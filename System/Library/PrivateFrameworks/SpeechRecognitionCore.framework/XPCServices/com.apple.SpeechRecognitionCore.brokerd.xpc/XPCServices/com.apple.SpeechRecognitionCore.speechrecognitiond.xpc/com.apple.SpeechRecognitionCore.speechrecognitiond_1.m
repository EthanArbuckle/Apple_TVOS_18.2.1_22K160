uint64_t sub_10007B848(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10007B87C((uint64_t *)a1);
  }
  return a1;
}

void sub_10007B87C(uint64_t *a1)
{
  v1 = (uint64_t *)a1[2];
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  uint64_t v14 = v3;
  uint64_t v15 = v2;
  uint64_t v16 = v3;
  uint64_t v17 = v2;
  uint64_t v4 = *a1;
  v5 = (uint64_t *)a1[1];
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  uint64_t v9 = v7;
  uint64_t v10 = v6;
  uint64_t v11 = v7;
  uint64_t v12 = v6;
  sub_10007B8F0(v4, (uint64_t)v13, (uint64_t)v8);
}

void sub_10007B8F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = *(void *)(a2 + 32); i != *(void *)(a3 + 32); *(void *)(a2 + 32) = i)
  {
    sub_10001A7A8(i + 56, *(void **)(i + 64));
    sub_10001A7A8(i + 32, *(void **)(i + 40));
    uint64_t i = *(void *)(a2 + 32) + 80LL;
  }

uint64_t sub_10007B958(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10007B98C(uint64_t a1, uint64_t a2)
{
  for (uint64_t i = *(void *)(a1 + 16); i != a2; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 80;
    sub_10001A7A8(i - 24, *(void **)(i - 16));
    sub_10001A7A8(i - 48, *(void **)(i - 40));
  }

uint64_t sub_10007B9EC(uint64_t *a1, uint64_t a2)
{
  unint64_t v3 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x333333333333333LL) {
    sub_100018774();
  }
  if (0x999999999999999ALL * ((a1[2] - *a1) >> 4) > v4) {
    unint64_t v4 = 0x999999999999999ALL * ((a1[2] - *a1) >> 4);
  }
  if (0xCCCCCCCCCCCCCCCDLL * ((a1[2] - *a1) >> 4) >= 0x199999999999999LL) {
    unint64_t v6 = 0x333333333333333LL;
  }
  else {
    unint64_t v6 = v4;
  }
  uint64_t v14 = a1 + 2;
  if (v6) {
    uint64_t v7 = (char *)sub_10007B6D4((uint64_t)(a1 + 2), v6);
  }
  else {
    uint64_t v7 = 0LL;
  }
  uint64_t v10 = v7;
  uint64_t v11 = &v7[80 * v3];
  v13 = &v7[80 * v6];
  sub_10007B7CC((uint64_t)(a1 + 2), (uint64_t)v11, a2);
  uint64_t v12 = v11 + 80;
  sub_10007B660(a1, &v10);
  uint64_t v8 = a1[1];
  sub_10007B958((uint64_t)&v10);
  return v8;
}

void sub_10007BAE0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t **sub_10007BAF4(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  unint64_t v6 = a1[1];
  if (v6)
  {
    int v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        int v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10) {
          break;
        }
        unint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      unint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((void *)v11 + 5) = 0LL;
    sub_100019D14(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }

  return v9;
}

uint64_t sub_10007BBB4(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 24);
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 != v3)
  {
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(v3 + 8 * v4);
      if (v5)
      {
        (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
        uint64_t v3 = *(void *)(a1 + 24);
        uint64_t v2 = *(void *)(a1 + 32);
      }

      ++v4;
    }

    while (v4 < (v2 - v3) >> 3);
  }

  unint64_t v6 = *(void **)(a1 + 248);
  if (v6)
  {
    *(void *)(a1 + 256) = v6;
    operator delete(v6);
  }

  v13 = (void **)(a1 + 224);
  sub_10007AE40(&v13);
  uint64_t v7 = *(void **)(a1 + 184);
  if (v7) {
    operator delete(v7);
  }
  int v8 = *(void **)(a1 + 160);
  if (v8)
  {
    *(void *)(a1 + 168) = v8;
    operator delete(v8);
  }

  *(void *)(a1 + 136) = off_1000D0A50;
  sub_100017FC4(a1 + 144);
  sub_10001A760(a1 + 96);
  uint64_t v9 = *(void **)(a1 + 72);
  if (v9)
  {
    *(void *)(a1 + 80) = v9;
    operator delete(v9);
  }

  int v10 = *(void **)(a1 + 48);
  if (v10)
  {
    *(void *)(a1 + 56) = v10;
    operator delete(v10);
  }

  uint64_t v11 = *(void **)(a1 + 24);
  if (v11)
  {
    *(void *)(a1 + 32) = v11;
    operator delete(v11);
  }

  return a1;
}

void *sub_10007BC9C@<X0>(int *a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x78uLL);
  result = sub_10007BCF4(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10007BCE0(_Unwind_Exception *a1)
{
}

void *sub_10007BCF4(void *a1, int *a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D2CF0;
  sub_10007BD98((uint64_t)(a1 + 3), *a2);
  return a1;
}

void sub_10007BD2C(_Unwind_Exception *a1)
{
}

void sub_10007BD40(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000D2CF0;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10007BD50(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000D2CF0;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

void sub_10007BD70(uint64_t a1)
{
}

uint64_t sub_10007BD98(uint64_t a1, int a2)
{
  *(_DWORD *)a1 = a2;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  v4[0] = a2;
  sub_10007BE04(a1 + 32, 0x400uLL, v4);
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 88) = 0LL;
  return a1;
}

void sub_10007BDEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10007BE04(uint64_t a1, size_t a2, int *a3)
{
  int v4 = *a3;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = 1065353216;
  sub_10007BE54(a1, a2);
  return a1;
}

void sub_10007BE40(_Unwind_Exception *a1)
{
}

void sub_10007BE54(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2LL;
  }

  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }

  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 40));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }

    else
    {
      uint64_t v7 = 1LL << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }

    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4) {
LABEL_16:
    }
      sub_100018410(a1, prime);
  }

void sub_10007BF30(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10007BF70(v2);
    operator delete(**a1);
  }

void sub_10007BF70(void *a1)
{
  uint64_t v2 = (void *)*a1;
  uint64_t v3 = (void *)a1[1];
  while (v3 != v2)
  {
    unint64_t v5 = (void *)*--v3;
    int8x8_t v4 = v5;
    *uint64_t v3 = 0LL;
    if (v5) {
      operator delete(v4);
    }
  }

  a1[1] = v2;
}

void sub_10007BFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 88);
  *(void *)(a2 + 88) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  uint64_t v4 = *(void *)(a2 + 80);
  *(void *)(a2 + 80) = 0LL;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
  }
  sub_10001A760(a2 + 32);
  unint64_t v5 = (void **)(a2 + 8);
  sub_10007BF30(&v5);
}

void sub_10007C024(void *a1, void *a2, uint64_t a3)
{
  int v6 = (*(uint64_t (**)(void *))(*(void *)a1 + 136LL))(a1);
  LOBYTE(__p[0]) = 0;
  sub_1000819B0(&v97, v6, (unsigned __int8 *)__p);
  int v7 = (*(uint64_t (**)(void *))(*(void *)a1 + 16LL))(a1);
  unint64_t v8 = 0LL;
  *(void *)&v97[((unint64_t)v7 >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << v7;
LABEL_3:
  if (v8 < (*(int (**)(void *))(*(void *)a1 + 136LL))(a1))
  {
    unint64_t v67 = 0LL;
    *(_OWORD *)__p = 0u;
    __int128 v66 = 0u;
    (*(void (**)(void *, unint64_t, void **))(*(void *)a1 + 120LL))(a1, v8, __p);
    while (1)
    {
      if (__p[0])
      {
        if ((*(unsigned int (**)(void *))(*(void *)__p[0] + 16LL))(__p[0]))
        {
          if (__p[0])
          {
            (*(void (**)(void))(*(void *)__p[0] + 8LL))();
            goto LABEL_20;
          }

LABEL_18:
          if (*((void *)&v66 + 1)) {
            --**((_DWORD **)&v66 + 1);
          }
LABEL_20:
          ++v8;
          goto LABEL_3;
        }

        if (__p[0])
        {
          uint64_t v9 = (char *)(*(uint64_t (**)(void))(*(void *)__p[0] + 24LL))();
          goto LABEL_11;
        }
      }

      else if (v67 >= (unint64_t)v66)
      {
        goto LABEL_18;
      }

      uint64_t v9 = (char *)__p[1] + 16 * v67;
LABEL_11:
      if (*(void *)v9) {
        *(void *)&v97[((unint64_t)*((int *)v9 + 3) >> 3) & 0x1FFFFFFFFFFFFFF8LL] |= 1LL << *((_DWORD *)v9 + 3);
      }
      if (__p[0]) {
        (*(void (**)(void *))(*(void *)__p[0] + 32LL))(__p[0]);
      }
      else {
        ++v67;
      }
    }
  }

  v94 = 0LL;
  v95 = 0LL;
  v96 = 0LL;
  int v10 = (*(uint64_t (**)(void *))(*(void *)a1 + 136LL))(a1);
  sub_10008048C((void **)&v94, v10);
  if (((*(uint64_t (**)(void *, uint64_t, void))(*(void *)a1 + 56LL))(a1, 0x4000000000LL, 0LL) & 0x4000000000LL) != 0)
  {
    for (unint64_t i = 0LL; i < (*(int (**)(void *))(*(void *)a1 + 136LL))(a1); ++i)
    {
      v35 = v95;
      if (v95 >= v96)
      {
        v37 = v94;
        uint64_t v38 = (v95 - v94) >> 2;
        unint64_t v39 = v38 + 1;
        uint64_t v40 = v96 - v94;
        if ((v96 - v94) >> 1 > v39) {
          unint64_t v39 = v40 >> 1;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          v42 = (char *)sub_10002C050((uint64_t)&v96, v41);
          v37 = v94;
          v35 = v95;
        }

        else
        {
          v42 = 0LL;
        }

        v43 = &v42[4 * v38];
        *(_DWORD *)v43 = i;
        v36 = v43 + 4;
        while (v35 != v37)
        {
          int v44 = *((_DWORD *)v35 - 1);
          v35 -= 4;
          *((_DWORD *)v43 - 1) = v44;
          v43 -= 4;
        }

        v94 = v43;
        v95 = v36;
        v96 = &v42[4 * v41];
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        *(_DWORD *)v95 = i;
        v36 = v35 + 4;
      }

      v95 = v36;
    }

    goto LABEL_100;
  }

  if (((*(uint64_t (**)(void *, uint64_t, void))(*(void *)a1 + 56LL))(a1, 0x800000000LL, 0LL) & 0x800000000LL) == 0)
  {
    v98 = 0LL;
    v99 = 0LL;
    v100 = 0LL;
    __p[0] = &v98;
    __p[1] = 0LL;
    *(void *)&__int128 v66 = 0LL;
    *((void *)&v66 + 1) = v90;
    *(_OWORD *)v71 = 0u;
    *(_OWORD *)v72 = 0u;
    sub_100080CF4((uint64_t)a1, (uint64_t *)__p, 0);
    sub_10002DBF0(&v91, ((char *)v99 - (char *)v98) >> 2, &dword_1000AF5EC);
    sub_10002DBF0(v89, ((char *)v99 - (char *)v98) >> 2, &dword_1000AF5EC);
    uint64_t v11 = v98;
    uint64_t v12 = v91;
    if (v99 != v98)
    {
      uint64_t v13 = 0LL;
      unint64_t v14 = ((char *)v99 - (char *)v98) >> 2;
      uint64_t v15 = v89[0];
      if (v14 <= 1) {
        unint64_t v14 = 1LL;
      }
      do
      {
        uint64_t v16 = *((int *)v11 + v13);
        int v17 = v12[v16];
        if (v17 != -1)
        {
          v15[v13] = v17;
          uint64_t v16 = *((int *)v11 + v13);
        }

        v12[v16] = v13++;
      }

      while (v14 != v13);
    }

    v18 = v92;
    if (v92 != v12)
    {
      unint64_t v19 = 0LL;
      do
      {
        int v20 = v12[v19];
        if (v20 != -1)
        {
          v21 = v95;
          do
          {
            if (v21 >= v96)
            {
              v23 = v94;
              uint64_t v24 = (v21 - v94) >> 2;
              unint64_t v25 = v24 + 1;
              uint64_t v26 = v96 - v94;
              if ((v96 - v94) >> 1 > v25) {
                unint64_t v25 = v26 >> 1;
              }
              else {
                unint64_t v27 = v25;
              }
              if (v27)
              {
                v28 = (char *)sub_10002C050((uint64_t)&v96, v27);
                v23 = v94;
                v21 = v95;
              }

              else
              {
                v28 = 0LL;
              }

              v29 = &v28[4 * v24];
              *(_DWORD *)v29 = v20;
              v22 = v29 + 4;
              while (v21 != v23)
              {
                int v30 = *((_DWORD *)v21 - 1);
                v21 -= 4;
                *((_DWORD *)v29 - 1) = v30;
                v29 -= 4;
              }

              v94 = v29;
              v95 = v22;
              v96 = &v28[4 * v27];
              if (v23) {
                operator delete(v23);
              }
            }

            else
            {
              *(_DWORD *)v21 = v20;
              v22 = v21 + 4;
            }

            v95 = v22;
            int v20 = *((_DWORD *)v89[0] + v20);
            v21 = v22;
          }

          while (v20 != -1);
          uint64_t v12 = v91;
          v18 = v92;
        }

        ++v19;
      }

      while (v19 < (v18 - (_BYTE *)v12) >> 2);
    }

    if (v89[0])
    {
      v89[1] = v89[0];
      operator delete(v89[0]);
      uint64_t v12 = v91;
    }

    if (v12)
    {
      v92 = v12;
      operator delete(v12);
    }

    v31 = (void **)v72[1];
    v72[1] = 0LL;
    if (v31) {
      sub_10002B7A4((int)&v72[1], v31);
    }
    sub_10002B764((void ***)v72, 0LL);
    v32 = (void **)v71[1];
    v71[1] = 0LL;
    if (v32) {
      sub_10002B7A4((int)&v71[1], v32);
    }
    v33 = (void **)v71[0];
    v71[0] = 0LL;
    if (v33) {
      sub_10002B7A4((int)v71, v33);
    }
    if (v98)
    {
      v99 = v98;
      operator delete(v98);
    }

    goto LABEL_100;
  }

  __p[0] = 0LL;
  __p[1] = 0LL;
  *(void *)&__int128 v66 = 0LL;
  v98 = __p;
  v99 = v89;
  v100 = 0LL;
  sub_100080520((uint64_t)a1, (uint64_t)&v98, 0);
  int v45 = LOBYTE(v89[0]);
  if (LOBYTE(v89[0]))
  {
    sub_100080CC4((uint64_t)&v94, ((char *)__p[1] - (char *)__p[0]) >> 2);
    v46 = (int *)__p[0];
    if (__p[1] != __p[0])
    {
      uint64_t v47 = 0LL;
      unint64_t v48 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      v49 = v94;
      if (v48 <= 1) {
        unint64_t v48 = 1LL;
      }
      do
      {
        *(_DWORD *)&v49[4 * v46[v47]] = v47;
        ++v47;
      }

      while (v48 != v47);
    }
  }

  else
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(&v91, "FATAL");
    }
    else {
      sub_10000A2DC(&v91, "ERROR");
    }
    sub_10002A9EC(v90, (uint64_t)&v91);
    sub_10002A6A4(&std::cerr, (uint64_t)"RmEpsilon: Inconsistent acyclic property bit", 44LL);
    sub_10002AA94(v90);
    if (v93 < 0) {
      operator delete(v91);
    }
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)a1 + 168LL))(a1, 4LL, 4LL);
  }

  v50 = v100;
  v100 = 0LL;
  if (v50) {
    sub_10002B7A4((int)&v100, v50);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  if (v45)
  {
LABEL_100:
    __p[0] = a1;
    __p[1] = a2;
    *(void *)&__int128 v66 = a1;
    *((void *)&v66 + 1) = a2;
    unint64_t v67 = *(void *)a3;
    int v68 = *(_DWORD *)(a3 + 16);
    char v69 = *(_BYTE *)(a3 + 20);
    char v70 = 1;
    *(_OWORD *)v71 = 0u;
    *(_OWORD *)v72 = 0u;
    __int128 v73 = 0u;
    __int128 v74 = 0u;
    __int128 v75 = 0u;
    memset(v76, 0, sizeof(v76));
    a2[1] = *a2;
    __int128 v77 = 0u;
    __int128 v78 = 0u;
    int v79 = 1065353216;
    int v88 = 0;
    __int128 v80 = 0u;
    __int128 v81 = 0u;
    __int128 v82 = 0u;
    __int128 v83 = 0u;
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    uint64_t v86 = 0LL;
    while (v94 != v95)
    {
      unint64_t v51 = *((int *)v95 - 1);
      v95 -= 4;
      if (((*(void *)&v97[(v51 >> 3) & 0x1FFFFFFFFFFFFFF8LL] >> v51) & 1) == 0)
      {
        if (*(_BYTE *)(a3 + 21)) {
          continue;
        }
        v54 = sub_10002ADB0();
        LODWORD(v98) = *(_DWORD *)(a3 + 24);
        LODWORD(v89[0]) = *v54;
      }

      sub_100081494(__p, v51);
      int v64 = v87;
      (*(void (**)(void *, unint64_t, int *))(*(void *)a1 + 160LL))(a1, v51, &v64);
      (*(void (**)(void *, unint64_t))(*(void *)a1 + 216LL))(a1, v51);
      (*(void (**)(void *, unint64_t, uint64_t))(*(void *)a1 + 232LL))( a1,  v51,  (uint64_t)(*((void *)&v85 + 1) - v85) >> 4);
      uint64_t v52 = *((void *)&v85 + 1);
      uint64_t v53 = v85;
      while (v53 != v52)
      {
        (*(void (**)(void *, unint64_t, uint64_t))(*(void *)a1 + 184LL))(a1, v51, v52 - 16);
        uint64_t v53 = v85;
        uint64_t v52 = *((void *)&v85 + 1) - 16LL;
        *((void *)&v85 + 1) -= 16LL;
      }
    }

    if (*(_BYTE *)(a3 + 21)
      || (v57 = sub_10002ADB0(),
          LODWORD(v98) = *(_DWORD *)(a3 + 24),
          LODWORD(v89[0]) = *v57,
          *(float *)&v98 != *(float *)v89)
      || *(_DWORD *)(a3 + 28) != -1)
    {
      for (unint64_t j = 0LL; j < (*(int (**)(void *))(*(void *)a1 + 136LL))(a1); ++j)
      {
        if (((*(void *)&v97[(j >> 3) & 0x1FFFFFFFFFFFFFF8LL] >> j) & 1) == 0) {
          (*(void (**)(void *, unint64_t))(*(void *)a1 + 216LL))(a1, j);
        }
      }
    }

    if (v76[20]) {
      (*(void (**)(void *, uint64_t, uint64_t))(*(void *)a1 + 168LL))(a1, 4LL, 4LL);
    }
    uint64_t v58 = (*(uint64_t (**)(void *, uint64_t, void))(*(void *)a1 + 56LL))(a1, 0xFFFFFFFF0007LL, 0LL);
    uint64_t v59 = sub_1000A4C10(v58, 0);
    (*(void (**)(void *, uint64_t, uint64_t))(*(void *)a1 + 168LL))(a1, v59, 0xFFFFFFFF0007LL);
    v60 = sub_10002ADB0();
    float v61 = *(float *)(a3 + 24);
    *(float *)&v98 = v61;
    LODWORD(v89[0]) = *v60;
    unsigned int v62 = *(_DWORD *)(a3 + 28);
    if (v61 != *(float *)v89 || v62 != -1)
    {
      v98 = (void **)__PAIR64__(v62, LODWORD(v61));
      v100 = 0LL;
      int v101 = 981467136;
      char v102 = 0;
      sub_1000834EC((uint64_t)a1, (uint64_t)&v98);
    }

    if (*(_BYTE *)(a3 + 21))
    {
      v63 = sub_10002ADB0();
      LODWORD(v98) = *(_DWORD *)(a3 + 24);
      LODWORD(v89[0]) = *v63;
    }

    sub_10008E200(__p);
  }

  if (v94)
  {
    v95 = v94;
    operator delete(v94);
  }

  if (v97) {
    operator delete(v97);
  }
}

      v18 = *((void *)&v29 + 1) + 16 * v31;
LABEL_19:
      if (*(void *)v18) {
        goto LABEL_29;
      }
      unint64_t v19 = *(int *)(*a2 + 4 * v17);
      if ((_DWORD)v19 == *(_DWORD *)(*a2 + 4LL * *(int *)(v18 + 12)))
      {
        int v20 = *(_DWORD **)a3;
        if (!a4
          || (v21 = sub_10002AD60(), v22 = (float *)(v18 + 8), sub_10007F7A8(a4, (float *)(v18 + 8), (float *)v21)))
        {
          v23 = 1;
          goto LABEL_24;
        }

        if ((v20[v19] | 2) == 2)
        {
          uint64_t v26 = sub_10002ADB0();
          v36 = *v22;
          v35 = *(float *)v26;
          else {
            v23 = 3;
          }
LABEL_24:
          v20[v19] = v23;
        }

        *a5 = 0;
      }

      uint64_t v24 = sub_10002ADB0();
      v36 = *(float *)(v18 + 8);
      v35 = *(float *)v24;
      v16.n128_f32[0] = v36;
      if (v36 != v35)
      {
        unint64_t v25 = sub_10002AD60();
        v36 = *(float *)(v18 + 8);
        v35 = *(float *)v25;
        v16.n128_f32[0] = v36;
        if (v36 != v35) {
          *a6 = 0;
        }
      }

      int v17 = *((void *)&v29 + 1) + 16 * v31;
LABEL_19:
      v18 = *(int *)(*a2 + 4 * v16);
      if ((_DWORD)v18 == *(_DWORD *)(*a2 + 4LL * *(int *)(v17 + 12)))
      {
        unint64_t v19 = *(_DWORD **)a3;
        if (!a4
          || (int v20 = sub_10002AD60(), v21 = (float *)(v17 + 8), sub_10007F7A8(a4, (float *)(v17 + 8), (float *)v20)))
        {
          v22 = 1;
          goto LABEL_23;
        }

        if ((v19[v18] | 2) == 2)
        {
          uint64_t v26 = sub_10002ADB0();
          v36 = *v21;
          v35 = *(float *)v26;
          else {
            v22 = 3;
          }
LABEL_23:
          v19[v18] = v22;
        }

        *a5 = 0;
      }

      v23 = sub_10002ADB0();
      v36 = *(float *)(v17 + 8);
      v35 = *(float *)v23;
      v24.n128_f32[0] = v36;
      if (v36 != v35)
      {
        unint64_t v25 = sub_10002AD60();
        v36 = *(float *)(v17 + 8);
        v35 = *(float *)v25;
        v24.n128_f32[0] = v36;
        if (v36 != v35) {
          *a6 = 0;
        }
      }

      if ((void)v29) {
        (*(void (**)(void, __n128))(*(void *)v29 + 32LL))(v29, v24);
      }
      else {
        ++v31;
      }
    }

    if ((void)v29)
    {
      (*(void (**)(void))(*(void *)v29 + 8LL))();
      goto LABEL_40;
    }

      int v17 = *((void *)&v29 + 1) + 16 * v31;
LABEL_19:
      v18 = *(int *)(*a2 + 4 * v16);
      if ((_DWORD)v18 == *(_DWORD *)(*a2 + 4LL * *(int *)(v17 + 12)))
      {
        unint64_t v19 = *(_DWORD **)a3;
        if (!a4
          || (int v20 = sub_10002AD60(), v21 = (float *)(v17 + 8), sub_10007F7A8(a4, (float *)(v17 + 8), (float *)v20)))
        {
          v22 = 1;
          goto LABEL_23;
        }

        if ((v19[v18] | 2) == 2)
        {
          uint64_t v26 = sub_10002ADB0();
          v36 = *v21;
          v35 = *(float *)v26;
          else {
            v22 = 3;
          }
LABEL_23:
          v19[v18] = v22;
        }

        *a5 = 0;
      }

      v23 = sub_10002ADB0();
      v36 = *(float *)(v17 + 8);
      v35 = *(float *)v23;
      v24.n128_f32[0] = v36;
      if (v36 != v35)
      {
        unint64_t v25 = sub_10002AD60();
        v36 = *(float *)(v17 + 8);
        v35 = *(float *)v25;
        v24.n128_f32[0] = v36;
        if (v36 != v35) {
          *a6 = 0;
        }
      }

      if ((void)v29) {
        (*(void (**)(void, __n128))(*(void *)v29 + 32LL))(v29, v24);
      }
      else {
        ++v31;
      }
    }

    if ((void)v29)
    {
      (*(void (**)(void))(*(void *)v29 + 8LL))();
      goto LABEL_40;
    }

    int v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        v18 = v17;
        int v17 = (void *)*v17;
      }

      while (v17);
    }

    else
    {
      do
      {
        v18 = (void *)v3[2];
        unint64_t v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }

      while (!v19);
    }

    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0LL;
    }
  }

  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
  return sub_1000A29D8(a1, a3, (char *)v3[7]);
}

    uint64_t v16 = (void *)v3[1];
    if (v16)
    {
      do
      {
        int v17 = v16;
        uint64_t v16 = (void *)*v16;
      }

      while (v16);
    }

    else
    {
      do
      {
        int v17 = (void *)v3[2];
        v18 = *v17 == (void)v3;
        uint64_t v3 = v17;
      }

      while (!v18);
    }

    uint64_t v3 = v17;
    if (v17 == v4) {
      return 0LL;
    }
  }

  if (memcmp(v9, v13, v8)) {
    goto LABEL_18;
  }
LABEL_25:
  std::string::operator=((std::string *)v3[7], __str);
  return 1LL;
}

    int v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        v18 = v17;
        int v17 = (void *)*v17;
      }

      while (v17);
    }

    else
    {
      do
      {
        v18 = (void *)v3[2];
        unint64_t v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }

      while (!v19);
    }

    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0LL;
    }
  }

  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
  return sub_1000A2B3C(a1, a3, (_DWORD *)v3[7]);
}

    int v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        v18 = v17;
        int v17 = (void *)*v17;
      }

      while (v17);
    }

    else
    {
      do
      {
        v18 = (void *)v3[2];
        unint64_t v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }

      while (!v19);
    }

    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0LL;
    }
  }

  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
  return sub_1000A2BB8(a1, a3, (uint64_t *)v3[7]);
}

    int v17 = (void *)v3[1];
    if (v17)
    {
      do
      {
        v18 = v17;
        int v17 = (void *)*v17;
      }

      while (v17);
    }

    else
    {
      do
      {
        v18 = (void *)v3[2];
        unint64_t v19 = *v18 == (void)v3;
        uint64_t v3 = v18;
      }

      while (!v19);
    }

    uint64_t v3 = v18;
    if (v18 == v4) {
      return 0LL;
    }
  }

  if (memcmp(v10, v14, v9)) {
    goto LABEL_18;
  }
  return sub_1000A2C34(a1, a3, (double *)v3[7]);
}

void sub_10007C9B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, uint64_t a14)
{
  v18 = *(void ***)(v15 + 448);
  *(void *)(v15 + 448) = 0LL;
  if (v18) {
    sub_10002B7A4(v14, v18);
  }
  if (__p) {
    operator delete(__p);
  }
  unint64_t v19 = *(void **)(v15 + 384);
  if (v19)
  {
    *(void *)(v15 + 392) = v19;
    operator delete(v19);
  }

  int v20 = *(void **)(v15 + 408);
  if (v20) {
    operator delete(v20);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10007CB0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = 7;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2D40;
  *(_OWORD *)(a1 + 16) = 0u;
  int v6 = (uint64_t *)(a1 + 16);
  int v7 = (uint64_t *)(a1 + 24);
  *(_OWORD *)(a1 + 48) = 0u;
  unint64_t v8 = (void *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 64) = 0LL;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0x4E00000000LL, 0LL);
  if ((v9 & 0x4000000000LL) != 0 || (*(unsigned int (**)(uint64_t))(*(void *)a2 + 16LL))(a2) == -1)
  {
    v23 = operator new(0x30uLL);
    v23[2] = 5;
    *((_BYTE *)v23 + 12) = 0;
    *(void *)v23 = &off_1000D2DB8;
    *((void *)v23 + 2) = 0xFFFFFFFF00000000LL;
    *((void *)v23 + 4) = 0LL;
    *((void *)v23 + 5) = 0LL;
    *((void *)v23 + 3) = 0LL;
    uint64_t v24 = *v6;
    *int v6 = (uint64_t)v23;
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using state-order discipline", 39LL);
      goto LABEL_19;
    }
  }

  else if ((v9 & 0x800000000LL) != 0)
  {
    unint64_t v25 = operator new(0x48uLL);
    sub_10007E288((uint64_t)v25, a2);
    uint64_t v26 = *v6;
    *int v6 = (uint64_t)v25;
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8LL))(v26);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
      goto LABEL_19;
    }
  }

  else
  {
    if ((v9 & 0x200000000LL) == 0)
    {
      __p[0] = v8;
      __p[1] = 0LL;
      uint64_t v66 = 0LL;
      unint64_t v67 = &v70;
      *(_OWORD *)int v68 = 0u;
      *(_OWORD *)char v69 = 0u;
      sub_10007D528(a2, (uint64_t *)__p, 0);
      int v10 = *(int **)(a1 + 48);
      uint64_t v11 = *(int **)(a1 + 56);
      if (v10 != v11)
      {
        uint64_t v12 = v10 + 1;
        if (v10 + 1 != v11)
        {
          int v13 = *v10;
          int v14 = v10 + 1;
          do
          {
            int v16 = *v14++;
            int v15 = v16;
            BOOL v17 = v13 < v16;
            if (v13 <= v16) {
              int v13 = v15;
            }
            if (v17) {
              int v10 = v12;
            }
            uint64_t v12 = v14;
          }

          while (v14 != v11);
        }
      }

      int v18 = *v10;
      unint64_t v19 = *v10 + 1;
      sub_10007F734(v64, v19);
      if (a3)
      {
        int v20 = operator new(1uLL);
        v21 = operator new(0x10uLL);
        void *v21 = a3;
        v21[1] = v20;
        v22 = v21;
      }

      else
      {
        int v20 = 0LL;
        v22 = 0LL;
      }

      sub_10007DCC8(a2, v8, (uint64_t)v64, (uint64_t)v20, &v62, &v63);
      if (v63)
      {
        v29 = operator new(0x40uLL);
        v29[2] = 2;
        *((_BYTE *)v29 + 12) = 0;
        *(void *)v29 = off_1000D2E88;
        *((_OWORD *)v29 + 1) = 0u;
        *((_OWORD *)v29 + 2) = 0u;
        *((_OWORD *)v29 + 3) = 0u;
        uint64_t v30 = *v6;
        *int v6 = (uint64_t)v29;
        if (v30) {
          (*(void (**)(uint64_t))(*(void *)v30 + 8LL))(v30);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_40:
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_71:
        if (v22) {
          operator delete(v22);
        }
        if (v20) {
          operator delete(v20);
        }
        if (v64[0])
        {
          v64[1] = v64[0];
          operator delete(v64[0]);
        }

        v55 = (void **)v69[1];
        v69[1] = 0LL;
        if (v55) {
          sub_10002B7A4((int)&v69[1], v55);
        }
        sub_10002B764((void ***)v69, 0LL);
        v56 = (void **)v68[1];
        v68[1] = 0LL;
        if (v56) {
          sub_10002B7A4((int)&v68[1], v56);
        }
        v57 = (void **)v68[0];
        v68[0] = 0LL;
        if (v57) {
          sub_10002B7A4((int)v68, v57);
        }
        return a1;
      }

      if (v62)
      {
        v31 = operator new(0x48uLL);
        sub_10007F848((uint64_t)v31, (uint64_t)v8);
        uint64_t v32 = *v6;
        *int v6 = (uint64_t)v31;
        if (v32) {
          (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
        goto LABEL_40;
      }

      if (dword_1000DE7E8 >= 2)
      {
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using SCC meta-discipline", 36LL);
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
      }

      sub_100069658((uint64_t)v7, v19);
      if (v18 < 0)
      {
LABEL_69:
        uint64_t v53 = operator new(0x40uLL);
        v53[2] = 6;
        *((_BYTE *)v53 + 12) = 0;
        *(void *)uint64_t v53 = &off_1000D2FC0;
        *((void *)v53 + 2) = v7;
        *((void *)v53 + 3) = v8;
        *((void *)v53 + 4) = 0xFFFFFFFF00000000LL;
        *((void *)v53 + 6) = 0LL;
        *((void *)v53 + 7) = 0LL;
        *((void *)v53 + 5) = 0LL;
        uint64_t v54 = *v6;
        *int v6 = (uint64_t)v53;
        if (v54) {
          (*(void (**)(uint64_t))(*(void *)v54 + 8LL))(v54);
        }
        goto LABEL_71;
      }

      uint64_t v33 = 0LL;
      while (1)
      {
        int v34 = *((_DWORD *)v64[0] + v33);
        if (v34 == 3)
        {
          uint64_t v38 = *v7;
          unint64_t v39 = (char *)operator new(0x88uLL);
          *((_DWORD *)v39 + 2) = 3;
          v39[12] = 0;
          *(void *)unint64_t v39 = off_1000D2EF0;
          *((_OWORD *)v39 + 1) = *v22;
          *((_OWORD *)v39 + 2) = 0u;
          *((_OWORD *)v39 + 3) = 0u;
          *((_OWORD *)v39 + 4) = 0u;
          *((_OWORD *)v39 + 5) = 0u;
          *(_OWORD *)(v39 + 92) = 0u;
          *((void *)v39 + 15) = 0LL;
          *((void *)v39 + 16) = 0LL;
          *((void *)v39 + 14) = 0LL;
          uint64_t v40 = *(void *)(v38 + 8 * v33);
          *(void *)(v38 + 8 * v33) = v39;
          if (v40) {
            (*(void (**)(uint64_t))(*(void *)v40 + 8LL))(v40);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          unint64_t v41 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          v42 = (void *)std::ostream::operator<<(v41, v33);
          sub_10002A6A4(v42, (uint64_t)": using shortest-first discipline", 33LL);
        }

        else if (v34 == 2)
        {
          uint64_t v43 = *v7;
          int v44 = operator new(0x40uLL);
          v44[2] = 2;
          *((_BYTE *)v44 + 12) = 0;
          *(void *)int v44 = off_1000D2E88;
          *((_OWORD *)v44 + 1) = 0u;
          *((_OWORD *)v44 + 2) = 0u;
          *((_OWORD *)v44 + 3) = 0u;
          uint64_t v45 = *(void *)(v43 + 8 * v33);
          *(void *)(v43 + 8 * v33) = v44;
          if (v45) {
            (*(void (**)(uint64_t))(*(void *)v45 + 8LL))(v45);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          v46 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v47 = (void *)std::ostream::operator<<(v46, v33);
          sub_10002A6A4(v47, (uint64_t)": using LIFO discipline", 23LL);
        }

        else if (v34)
        {
          uint64_t v48 = *v7;
          v49 = operator new(0x40uLL);
          v49[2] = 1;
          *((_BYTE *)v49 + 12) = 0;
          *(void *)v49 = off_1000D2F58;
          *((_OWORD *)v49 + 1) = 0u;
          *((_OWORD *)v49 + 2) = 0u;
          *((_OWORD *)v49 + 3) = 0u;
          uint64_t v50 = *(void *)(v48 + 8 * v33);
          *(void *)(v48 + 8 * v33) = v49;
          if (v50) {
            (*(void (**)(uint64_t))(*(void *)v50 + 8LL))(v50);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          unint64_t v51 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v52 = (void *)std::ostream::operator<<(v51, v33);
          sub_10002A6A4(v52, (uint64_t)": using FIFO discipine", 22LL);
        }

        else
        {
          uint64_t v35 = *(void *)(*v7 + 8 * v33);
          *(void *)(*v7 + 8 * v33) = 0LL;
          if (v35) {
            (*(void (**)(uint64_t))(*(void *)v35 + 8LL))(v35);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          v36 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          v37 = (void *)std::ostream::operator<<(v36, v33);
          sub_10002A6A4(v37, (uint64_t)": using trivial discipline", 26LL);
        }

        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_68:
      }
    }

    unint64_t v27 = operator new(0x40uLL);
    v27[2] = 2;
    *((_BYTE *)v27 + 12) = 0;
    *(void *)unint64_t v27 = off_1000D2E88;
    *((_OWORD *)v27 + 1) = 0u;
    *((_OWORD *)v27 + 2) = 0u;
    *((_OWORD *)v27 + 3) = 0u;
    uint64_t v28 = *v6;
    *int v6 = (uint64_t)v27;
    if (v28) {
      (*(void (**)(uint64_t))(*(void *)v28 + 8LL))(v28);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_19:
      sub_10002AA94(v64);
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
    }
  }

  return a1;
}

void sub_10007D38C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, char a16, char a17, void *a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if (v28)
    {
LABEL_10:
      operator delete(v28);
      if (!v29)
      {
LABEL_7:
        if (a18)
        {
          a19 = (uint64_t)a18;
          operator delete(a18);
        }

        sub_10002ACFC((void ***)&a21);
        uint64_t v32 = *v27;
        if (*v27)
        {
          *(void *)(v26 + 56) = v32;
          operator delete(v32);
        }

        sub_10006C65C((void ***)&a21);
        uint64_t v33 = *v30;
        *uint64_t v30 = 0LL;
        if (v33) {
          (*(void (**)(uint64_t))(*(void *)v33 + 8LL))(v33);
        }
        _Unwind_Resume(a1);
      }

LABEL_6:
      operator delete(v29);
      goto LABEL_7;
    }
  }

  else if (v28)
  {
    goto LABEL_10;
  }

  if (!v29) {
    goto LABEL_7;
  }
  goto LABEL_6;
}

      operator delete(v29);
      goto LABEL_7;
    }
  }

  else if (v28)
  {
    goto LABEL_10;
  }

  if (!v29) {
    goto LABEL_7;
  }
  goto LABEL_6;
}

      operator delete(v29);
      goto LABEL_7;
    }
  }

  else if (v28)
  {
    goto LABEL_10;
  }

  if (!v29) {
    goto LABEL_7;
  }
  goto LABEL_6;
}

void sub_10007D528(uint64_t a1, uint64_t *a2, char a3)
{
  int v44 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v44 == -1)
  {
    sub_10002AF44((uint64_t)a2);
    return;
  }

  v55 = 0LL;
  v56 = 0LL;
  v57 = 0LL;
  __int128 v54 = 0u;
  memset(v53, 0, sizeof(v53));
  sub_10002B8A4(v50, 64LL);
  uint64_t v52 = 0LL;
  v49 = off_1000D0B78;
  uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v43) {
    uint64_t v5 = sub_10005BFFC(a1);
  }
  else {
    uint64_t v5 = (v44 + 1);
  }
  if ((int)v5 <= (unint64_t)(v56 - v55))
  {
  }

  else
  {
    sub_10002BA28(&v55, (int)v5 - (v56 - v55), &unk_1000AF61E);
  }

  uint64_t v46 = 0LL;
  int v47 = 0;
  int v48 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v46);
  uint64_t v6 = v44;
  do
  {
    v55[(int)v6] = 1;
    int v7 = v52;
    if (v52)
    {
      uint64_t v52 = (char *)*((void *)v52 + 6);
    }

    else
    {
      int v7 = sub_10002BED8(v50, 1LL);
      *((void *)v7 + 6) = 0LL;
    }

    *(_DWORD *)int v7 = v6;
    *(_OWORD *)(v7 + 24) = 0u;
    *((void *)v7 + 5) = 0LL;
    *(_OWORD *)(v7 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v6, v7 + 8);
    uint64_t v45 = v7;
    sub_10002BB40(v53, &v45);
    char v8 = sub_10002B010(a2, v6, v6);
LABEL_16:
    char v9 = v8;
    while (*((void *)&v54 + 1))
    {
      int v10 = *(int **)(*(void *)(*((void *)&v53[0] + 1)
      unint64_t v11 = *v10;
      unint64_t v12 = v56 - v55;
      if (v56 - v55 <= v11)
      {
        uint64_t v5 = (v11 + 1);
        if ((int)v5 <= v12)
        {
        }

        else
        {
          sub_10002BA28(&v55, (int)v5 - v12, &unk_1000AF61E);
        }
      }

      if ((v9 & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v13 = *((void *)v10 + 1);
      if (v13)
      {
        uint64_t v14 = *((void *)v10 + 1);
        if (v14)
        {
          uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 24LL))(v14);
          goto LABEL_30;
        }

void sub_10007DC38( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10007DCC8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5, _BYTE *a6)
{
  *a5 = 1;
  *a6 = 1;
  uint64_t v11 = *(void *)(a3 + 8) - *(void *)a3;
  if (v11)
  {
    unint64_t v12 = v11 >> 2;
    if (v12 <= 1) {
      unint64_t v12 = 1LL;
    }
    bzero(*(void **)a3, 4 * v12);
  }

  uint64_t v32 = 0LL;
  int v33 = 0;
  unsigned int v34 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v32);
  while (1)
  {
    uint64_t result = v32;
    if (!v32)
    {
LABEL_11:
      uint64_t v15 = v34;
      goto LABEL_12;
    }

    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 16LL))(v32);
    uint64_t result = v32;
    if (v14) {
      break;
    }
    if (!v32) {
      goto LABEL_11;
    }
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v32 + 24LL))();
LABEL_12:
    unint64_t v31 = 0LL;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v15, &v29);
    uint64_t v17 = (int)v15;
    while (1)
    {
      if (!(void)v29)
      {
        goto LABEL_18;
      }

      if ((void)v29)
      {
        uint64_t v18 = (*(uint64_t (**)(void))(*(void *)v29 + 24LL))();
        goto LABEL_19;
      }

void sub_10007DFC4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17) {
    (*(void (**)(uint64_t))(*(void *)a17 + 8LL))(a17);
  }
  _Unwind_Resume(exception_object);
}

void sub_10007E028(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10008E2A4(a1);
  operator delete(v1);
}

uint64_t sub_10007E03C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 16LL))(*(void *)(a1 + 16));
}

uint64_t sub_10007E04C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 24LL))(*(void *)(a1 + 16));
}

uint64_t sub_10007E05C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 32LL))(*(void *)(a1 + 16));
}

uint64_t sub_10007E06C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 40LL))(*(void *)(a1 + 16));
}

uint64_t sub_10007E07C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 48LL))(*(void *)(a1 + 16));
}

uint64_t sub_10007E08C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 16) + 56LL))(*(void *)(a1 + 16));
}

void *sub_10007E09C(void *a1)
{
  *a1 = &off_1000D2DB8;
  uint64_t v2 = (void *)a1[3];
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void sub_10007E0D4(void *__p)
{
  *__p = &off_1000D2DB8;
  uint64_t v2 = (void *)__p[3];
  if (v2) {
    operator delete(v2);
  }
  operator delete(__p);
}

uint64_t sub_10007E10C(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

void sub_10007E114(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 16);
  int v4 = *(_DWORD *)(a1 + 20);
  if (v3 > v4)
  {
    *(_DWORD *)(a1 + 20) = a2;
LABEL_6:
    *(_DWORD *)(a1 + 16) = a2;
    goto LABEL_7;
  }

  if (v4 < a2)
  {
    *(_DWORD *)(a1 + 20) = a2;
    goto LABEL_7;
  }

  if (v3 > a2) {
    goto LABEL_6;
  }
LABEL_7:
  uint64_t v5 = (void *)(a1 + 24);
  unint64_t v6 = a2;
  while (*(void *)(a1 + 32) <= v6)
  {
    char v7 = 0;
    sub_10002BFAC(a1 + 24, &v7);
  }

  *(void *)(*v5 + ((v6 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v6;
}

uint64_t sub_10007E1C0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 24);
  int v2 = *(_DWORD *)(result + 20);
  unint64_t v3 = *(int *)(result + 16);
  *(void *)(v1 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v3);
  if ((int)v3 <= v2)
  {
    int v4 = v3 - 1;
    do
    {
      if (((*(void *)(v1 + ((v3 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v3) & 1) != 0) {
        break;
      }
      ++v3;
      *(_DWORD *)(result + 16) = v4 + 2;
      ++v4;
    }

    while (v2 != v4);
  }

  return result;
}

BOOL sub_10007E228(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) > *(_DWORD *)(a1 + 20);
}

double sub_10007E238(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  unint64_t v2 = *(int *)(a1 + 16);
  if ((int)v2 <= v1)
  {
    uint64_t v3 = *(void *)(a1 + 24);
    int v4 = v1 - v2 + 1;
    do
    {
      *(void *)(v3 + ((v2 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v2);
      ++v2;
      --v4;
    }

    while (v4);
  }

  double result = NAN;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  return result;
}

uint64_t sub_10007E288(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 4;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2E20;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v3 = a1 + 48;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  v9[0] = a1 + 24;
  v9[1] = &v11;
  int v10 = 0LL;
  sub_10007E450(a2, (uint64_t)v9, 0);
  if (!v11)
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v8, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"TopOrderQueue: FST is not acyclic", 33LL);
    sub_10002AA94(&v8);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    *(_BYTE *)(a1 + 12) = 1;
  }

  sub_10007EBF4(v3, (uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 2, &dword_1000AF5EC);
  int v4 = (void **)v10;
  int v10 = 0LL;
  if (v4) {
    sub_10002B7A4((int)&v10, v4);
  }
  return a1;
}

void sub_10007E3DC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20, void **a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21) {
    sub_10002B7A4(v23, a21);
  }
  uint64_t v26 = *v22;
  if (*v22)
  {
    *(void *)(v21 + 56) = v26;
    operator delete(v26);
  }

  uint64_t v27 = *v24;
  if (*v24)
  {
    *(void *)(v21 + 32) = v27;
    operator delete(v27);
  }

  _Unwind_Resume(exception_object);
}

void sub_10007E450(uint64_t a1, uint64_t a2, char a3)
{
  int v47 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v47 == -1)
  {
    sub_10007ED84((char ***)a2);
    return;
  }

  uint64_t v58 = 0LL;
  uint64_t v59 = 0LL;
  char v60 = 0LL;
  __int128 v57 = 0u;
  memset(v56, 0, sizeof(v56));
  sub_10002B8A4(v53, 64LL);
  v55 = 0LL;
  uint64_t v52 = off_1000D0B78;
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v46) {
    uint64_t v6 = sub_10005BFFC(a1);
  }
  else {
    uint64_t v6 = (v47 + 1);
  }
  if ((int)v6 <= (unint64_t)(v59 - v58))
  {
  }

  else
  {
    sub_10002BA28(&v58, (int)v6 - (v59 - v58), &unk_1000AF609);
  }

  uint64_t v49 = 0LL;
  int v50 = 0;
  int v51 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v49);
  uint64_t v7 = v47;
  char v45 = a3;
  do
  {
    v58[(int)v7] = 1;
    BOOL v8 = v55;
    if (v55)
    {
      v55 = (char *)*((void *)v55 + 6);
    }

    else
    {
      BOOL v8 = sub_10002BED8(v53, 1LL);
      *((void *)v8 + 6) = 0LL;
    }

    *(_DWORD *)BOOL v8 = v7;
    *(_OWORD *)(v8 + 24) = 0u;
    *((void *)v8 + 5) = 0LL;
    *(_OWORD *)(v8 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v7, v8 + 8);
    int v48 = v8;
    sub_10002BB40(v56, &v48);
    uint64_t v9 = *((void *)&v57 + 1);
    if (!*((void *)&v57 + 1))
    {
      char v10 = 1;
      if ((a3 & 1) != 0) {
        break;
      }
      goto LABEL_66;
    }

    char v10 = 1;
    do
    {
      char v11 = *(char **)(*(void *)(*((void *)&v56[0] + 1)
      unint64_t v12 = *(int *)v11;
      unint64_t v13 = v59 - v58;
      if (v59 - v58 <= v12)
      {
        uint64_t v6 = (v12 + 1);
        if ((int)v6 <= v13)
        {
        }

        else
        {
          sub_10002BA28(&v58, (int)v6 - v13, &unk_1000AF609);
        }
      }

      if ((v10 & 1) == 0)
      {
LABEL_32:
        v58[v12] = 2;
        uint64_t v19 = *((void *)v11 + 1);
        if (v19)
        {
          (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
        }

        else
        {
          uint64_t v20 = (_DWORD *)*((void *)v11 + 4);
          if (v20) {
            --*v20;
          }
        }

        *((void *)v11 + 6) = v55;
        v55 = v11;
        --*((void *)&v57 + 1);
        sub_10002C2E0(v56, 1);
        if (!*((void *)&v57 + 1))
        {
          sub_10007EF2C(a2, v12);
          goto LABEL_62;
        }

        uint64_t v21 = *(void *)(*(void *)(*((void *)&v56[0] + 1)
        uint64_t v22 = *(void *)(v21 + 8);
        if (v22) {
          (*(void (**)(uint64_t))(*(void *)v22 + 24LL))(v22);
        }
        sub_10007EF2C(a2, v12);
        uint64_t v23 = *(void *)(v21 + 8);
        if (v23)
        {
LABEL_41:
          (*(void (**)(uint64_t))(*(void *)v23 + 32LL))(v23);
          goto LABEL_62;
        }

        ++*(void *)(v21 + 40);
        goto LABEL_62;
      }

      uint64_t v14 = *((void *)v11 + 1);
      if (!v14)
      {
        if (*((void *)v11 + 5) >= *((void *)v11 + 3)) {
          goto LABEL_32;
        }
LABEL_28:
        uint64_t v16 = *((void *)v11 + 2) + 16LL * *((void *)v11 + 5);
        goto LABEL_29;
      }

      uint64_t v15 = *((void *)v11 + 1);
      if (!v15) {
        goto LABEL_28;
      }
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 24LL))(v15);
LABEL_29:
      unint64_t v17 = *(int *)(v16 + 12);
      unint64_t v18 = v59 - v58;
      if (v59 - v58 <= v17)
      {
        uint64_t v6 = v17 + 1;
        if (v17 + 1 <= v18)
        {
          if (v17 + 1 < v18) {
            uint64_t v59 = &v58[v6];
          }
        }

        else
        {
          sub_10002BA28(&v58, v17 + 1 - v18, &unk_1000AF609);
        }
      }

      if (*(void *)v16)
      {
        uint64_t v23 = *((void *)v11 + 1);
        if (v23) {
          goto LABEL_41;
        }
LABEL_58:
        ++*((void *)v11 + 5);
        goto LABEL_62;
      }

      uint64_t v24 = *(int *)(v16 + 12);
      int v25 = v58[v24];
      if (v25 == 1)
      {
        **(_BYTE **)(a2 + 8) = 0;
        uint64_t v27 = *((void *)v11 + 1);
        if (v27)
        {
          (*(void (**)(uint64_t))(*(void *)v27 + 32LL))(v27);
          char v10 = 0;
          goto LABEL_62;
        }

        char v10 = 0;
        goto LABEL_58;
      }

      if (v25 == 2)
      {
        uint64_t v26 = *((void *)v11 + 1);
        if (v26) {
          (*(void (**)(uint64_t))(*(void *)v26 + 32LL))(v26);
        }
        else {
          ++*((void *)v11 + 5);
        }
      }

      else
      {
        v58[v24] = 1;
        uint64_t v28 = v55;
        if (v55)
        {
          v55 = (char *)*((void *)v55 + 6);
        }

        else
        {
          uint64_t v28 = sub_10002BED8(v53, 1LL);
          *((void *)v28 + 6) = 0LL;
        }

        *(_DWORD *)uint64_t v28 = *(_DWORD *)(v16 + 12);
        *(_OWORD *)(v28 + 24) = 0u;
        *((void *)v28 + 5) = 0LL;
        *(_OWORD *)(v28 + 8) = 0u;
        (*(void (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
        int v48 = v28;
        sub_10002BB40(v56, &v48);
      }

      char v10 = 1;
LABEL_62:
      uint64_t v9 = *((void *)&v57 + 1);
    }

    while (*((void *)&v57 + 1));
    if ((a3 & 1) != 0) {
      break;
    }
LABEL_66:
    if ((_DWORD)v7 == v47) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = (v7 + 1);
    }
    if ((int)v7 < (int)v6)
    {
      __int128 v29 = &v58[(int)v7];
      uint64_t v30 = (int)v6 - (uint64_t)(int)v7;
      while (*v29++)
      {
        uint64_t v7 = (v7 + 1);
        if (!--v30)
        {
          uint64_t v7 = v6;
          break;
        }
      }
    }

    if (v46 || (_DWORD)v7 != (_DWORD)v6) {
      continue;
    }
LABEL_76:
    if (v49)
    {
      if (v49)
      {
        int v32 = (*(uint64_t (**)(uint64_t))(*(void *)v49 + 24LL))(v49);
        goto LABEL_82;
      }
    }

    else if (v51 >= v50)
    {
      continue;
    }

    int v32 = v51;
LABEL_82:
    if (v32 != (_DWORD)v6)
    {
      if (v49) {
        (*(void (**)(uint64_t))(*(void *)v49 + 32LL))(v49);
      }
      else {
        ++v51;
      }
      goto LABEL_76;
    }

    int v33 = v59;
    if (v59 >= v60)
    {
      unint64_t v35 = (unint64_t)v58;
      uint64_t v36 = v59 - v58;
      uint64_t v37 = v59 - v58 + 1;
      if (v37 < 0) {
        sub_100018774();
      }
      unint64_t v38 = v60 - v58;
      if (v38 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v39 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v39 = v37;
      }
      if (v39) {
        uint64_t v40 = (char *)operator new(v39);
      }
      else {
        uint64_t v40 = 0LL;
      }
      char v41 = &v40[v36];
      v42 = &v40[v36];
      char *v42 = 0;
      unsigned int v34 = v42 + 1;
      if (v33 != (char *)v35)
      {
        uint64_t v43 = &v33[~v35];
        do
        {
          char v44 = *--v33;
          (v43--)[(void)v40] = v44;
        }

        while (v33 != (char *)v35);
        int v33 = v58;
        char v41 = v40;
      }

      uint64_t v58 = v41;
      uint64_t v59 = v34;
      char v60 = &v40[v39];
      if (v33) {
        operator delete(v33);
      }
    }

    else
    {
      *uint64_t v59 = 0;
      unsigned int v34 = v33 + 1;
    }

    uint64_t v6 = (v6 + 1);
    uint64_t v59 = v34;
    a3 = v45;
  }

  while ((v10 & 1) != 0 && (int)v7 < (int)v6);
LABEL_106:
  sub_10007ED84((char ***)a2);
  if (v49) {
    (*(void (**)(uint64_t))(*(void *)v49 + 8LL))(v49);
  }
  uint64_t v52 = off_1000D0BA0;
  v53[0] = off_1000D0BC8;
  sub_10002B998(v54);
  sub_10002C34C(v56);
  if (v58)
  {
    uint64_t v59 = v58;
    operator delete(v58);
  }

void sub_10007EB60( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

void sub_10007EBF4(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }

  else
  {
    sub_10007F008((void **)a1, a2 - v3, a3);
  }

void sub_10007EC28(void *a1)
{
  int v1 = sub_10007F118(a1);
  operator delete(v1);
}

uint64_t sub_10007EC3C(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 48) + 4LL * *(int *)(a1 + 16));
}

uint64_t sub_10007EC4C(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 16);
  int v3 = *(_DWORD *)(result + 20);
  uint64_t v4 = *(void *)(result + 24);
  int v5 = *(_DWORD *)(v4 + 4LL * a2);
  if (v2 > v3)
  {
    *(_DWORD *)(result + 20) = v5;
LABEL_6:
    *(_DWORD *)(result + 16) = v5;
    goto LABEL_7;
  }

  if (v5 <= v3)
  {
    if (v5 < v2) {
      goto LABEL_6;
    }
  }

  else
  {
    *(_DWORD *)(result + 20) = v5;
  }

uint64_t sub_10007EC98(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 48);
  *(_DWORD *)(v1 + 4LL * *(int *)(result + 16)) = -1;
  int v2 = *(_DWORD *)(result + 20);
  uint64_t v3 = *(int *)(result + 16);
  if ((int)v3 <= v2)
  {
    uint64_t v4 = (int *)(v1 + 4 * v3);
    int v5 = v3 - 1;
    do
    {
      int v6 = *v4++;
      if (v6 != -1) {
        break;
      }
      *(_DWORD *)(result + 16) = v5 + 2;
      ++v5;
    }

    while (v2 != v5);
  }

  return result;
}

BOOL sub_10007ECE8(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) > *(_DWORD *)(a1 + 20);
}

double sub_10007ECF8(uint64_t a1)
{
  uint64_t v1 = *(int *)(a1 + 16);
  if ((int)v1 <= *(_DWORD *)(a1 + 20))
  {
    uint64_t v2 = *(void *)(a1 + 48);
    do
      *(_DWORD *)(v2 + 4 * v1) = -1;
    while (v1++ < *(int *)(a1 + 20));
  }

  double result = NAN;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  return result;
}

void sub_10007ED34(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t v3 = *(void ***)(a1 + 16);
  v2[1] = 0LL;
  v2[2] = 0LL;
  *uint64_t v2 = 0LL;
  *(void *)(a1 + 16) = v2;
  if (v3) {
    sub_10002B7A4(a1 + 16, v3);
  }
  **(_BYTE **)(a1 + 8) = 1;
}

void sub_10007ED84(char ***a1)
{
  if (!*(_BYTE *)a1[1])
  {
    uint64_t v2 = (void **)a1[2];
    goto LABEL_26;
  }

  (*a1)[1] = **a1;
  uint64_t v3 = (void ***)(a1 + 2);
  uint64_t v2 = (void **)a1[2];
  uint64_t v4 = v2[1];
  if (v4 != *v2)
  {
    unint64_t v5 = 0LL;
    do
    {
      int v6 = *a1;
      uint64_t v7 = (*a1)[1];
      unint64_t v8 = (unint64_t)(*a1)[2];
      if ((unint64_t)v7 >= v8)
      {
        char v10 = *v6;
        uint64_t v11 = (v7 - *v6) >> 2;
        unint64_t v12 = v11 + 1;
        uint64_t v13 = v8 - (void)v10;
        if (v13 >> 1 > v12) {
          unint64_t v12 = v13 >> 1;
        }
        else {
          unint64_t v14 = v12;
        }
        if (v14)
        {
          uint64_t v15 = (char *)sub_10002C050((uint64_t)(*a1 + 2), v14);
          char v10 = *v6;
          uint64_t v7 = v6[1];
        }

        else
        {
          uint64_t v15 = 0LL;
        }

        uint64_t v16 = &v15[4 * v11];
        *(_DWORD *)uint64_t v16 = -1;
        uint64_t v9 = v16 + 4;
        while (v7 != v10)
        {
          int v17 = *((_DWORD *)v7 - 1);
          v7 -= 4;
          *((_DWORD *)v16 - 1) = v17;
          v16 -= 4;
        }

        *int v6 = v16;
        v6[1] = v9;
        v6[2] = &v15[4 * v14];
        if (v10) {
          operator delete(v10);
        }
      }

      else
      {
        *(_DWORD *)uint64_t v7 = -1;
        uint64_t v9 = v7 + 4;
      }

      v6[1] = v9;
      ++v5;
      uint64_t v2 = *v3;
      uint64_t v4 = **v3;
      unint64_t v18 = ((_BYTE *)(*v3)[1] - v4) >> 2;
    }

    while (v18 > v5);
    if (v18) {
      goto LABEL_22;
    }
LABEL_30:
    *uint64_t v3 = 0LL;
    goto LABEL_31;
  }

  unint64_t v18 = (v4 - (_BYTE *)*v2) >> 2;
  if (!v18) {
    goto LABEL_30;
  }
LABEL_22:
  uint64_t v19 = 0LL;
  uint64_t v20 = **a1;
  uint64_t v21 = (int *)&v4[4 * v18 - 4];
  do
  {
    uint64_t v22 = *v21--;
    *(_DWORD *)&v20[4 * v22] = v19++;
  }

  while (v18 != v19);
LABEL_26:
  a1[2] = 0LL;
  int v23 = (_DWORD)a1 + 16;
  if (v2)
  {
    LODWORD(v3) = v23;
LABEL_31:
    sub_10002B7A4((int)v3, v2);
  }

void sub_10007EF2C(uint64_t a1, int a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = *(_DWORD **)(v3 + 8);
  unint64_t v5 = *(void *)(v3 + 16);
  if ((unint64_t)v4 >= v5)
  {
    uint64_t v7 = *(_DWORD **)v3;
    uint64_t v8 = ((uint64_t)v4 - *(void *)v3) >> 2;
    unint64_t v9 = v8 + 1;
    uint64_t v10 = v5 - (void)v7;
    if (v10 >> 1 > v9) {
      unint64_t v9 = v10 >> 1;
    }
    else {
      unint64_t v11 = v9;
    }
    if (v11)
    {
      unint64_t v12 = (char *)sub_10002C050(v3 + 16, v11);
      uint64_t v7 = *(_DWORD **)v3;
      uint64_t v4 = *(_DWORD **)(v3 + 8);
    }

    else
    {
      unint64_t v12 = 0LL;
    }

    uint64_t v13 = &v12[4 * v8];
    unint64_t v14 = &v12[4 * v11];
    *(_DWORD *)uint64_t v13 = a2;
    int v6 = v13 + 4;
    while (v4 != v7)
    {
      int v15 = *--v4;
      *((_DWORD *)v13 - 1) = v15;
      v13 -= 4;
    }

    *(void *)uint64_t v3 = v13;
    *(void *)(v3 + 8) = v6;
    *(void *)(v3 + 16) = v14;
    if (v7) {
      operator delete(v7);
    }
  }

  else
  {
    *uint64_t v4 = a2;
    int v6 = v4 + 1;
  }

  *(void *)(v3 + 8) = v6;
}

void sub_10007F008(void **a1, unint64_t a2, _DWORD *a3)
{
  uint64_t v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  unint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      int v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4LL;
      }

      while (v16);
      unint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_100018774();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      int v15 = (char *)sub_10002C050(v6, v14);
    }
    else {
      int v15 = 0LL;
    }
    unint64_t v18 = &v15[4 * v12];
    uint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    uint64_t v21 = v18;
    do
    {
      *(_DWORD *)uint64_t v21 = *a3;
      v21 += 4;
      v20 -= 4LL;
    }

    while (v20);
    uint64_t v22 = &v15[4 * v14];
    int v23 = (char *)*a1;
    for (unint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void *sub_10007F118(void *a1)
{
  *a1 = off_1000D2E20;
  uint64_t v2 = (void *)a1[6];
  if (v2)
  {
    a1[7] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[3];
  if (v3)
  {
    a1[4] = v3;
    operator delete(v3);
  }

  return a1;
}

void *sub_10007F164(void *a1)
{
  *a1 = off_1000D2E88;
  sub_10007F2B8(a1 + 2);
  return a1;
}

void sub_10007F194(void *a1)
{
  *a1 = off_1000D2E88;
  sub_10007F2B8(a1 + 2);
  operator delete(a1);
}

uint64_t sub_10007F1C4(uint64_t a1)
{
}

void sub_10007F1E4(uint64_t a1, int a2)
{
  int v2 = a2;
  sub_10007F34C(a1 + 16, &v2);
}

uint64_t sub_10007F20C(int64x2_t *a1)
{
  a1[3] = vaddq_s64(a1[3], (int64x2_t)xmmword_1000AC990);
  return sub_10007F6D8((uint64_t)a1[1].i64, 1);
}

BOOL sub_10007F234(uint64_t a1)
{
  return *(void *)(a1 + 56) == 0LL;
}

void sub_10007F244(void *a1)
{
  int v2 = (void **)a1[3];
  uint64_t v3 = a1[4];
  a1[7] = 0LL;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = a1[4];
      int v2 = (void **)(a1[3] + 8LL);
      a1[3] = v2;
      unint64_t v4 = v5 - (void)v2;
    }

    while (v4 > 0x10);
  }

  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 512LL;
  }

  else
  {
    if (v4 >> 3 != 2) {
      return;
    }
    uint64_t v6 = 1024LL;
  }

  a1[6] = v6;
}

uint64_t sub_10007F2B8(void *a1)
{
  int v2 = (void **)a1[1];
  uint64_t v3 = (void **)a1[2];
  a1[5] = 0LL;
  unint64_t v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v3 = (void **)a1[2];
      int v2 = (void **)(a1[1] + 8LL);
      a1[1] = v2;
      unint64_t v4 = (char *)v3 - (char *)v2;
    }

    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }

  unint64_t v5 = v4 >> 3;
  if (v5 == 1)
  {
    uint64_t v6 = 512LL;
  }

  else
  {
    if (v5 != 2) {
      goto LABEL_9;
    }
    uint64_t v6 = 1024LL;
  }

  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    uint64_t v7 = *v2++;
    operator delete(v7);
  }

  return sub_100024EDC((uint64_t)a1);
}

void sub_10007F34C(uint64_t a1, _DWORD *a2)
{
  unint64_t v4 = *(void *)(a1 + 32);
  if (!v4)
  {
    sub_10007F3C8((void **)a1);
    unint64_t v4 = *(void *)(a1 + 32);
  }

  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = (void *)(v5 + 8 * (v4 >> 10));
  if (*(void *)(a1 + 16) == v5) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = *v6 + 4 * (v4 & 0x3FF);
  }
  if (v7 == *v6) {
    uint64_t v7 = *(v6 - 1) + 4096LL;
  }
  *(_DWORD *)(v7 - 4) = *a2;
  uint64_t v8 = *(void *)(a1 + 40) + 1LL;
  *(void *)(a1 + 32) = v4 - 1;
  *(void *)(a1 + 40) = v8;
}

void sub_10007F3C8(void **a1)
{
  int v2 = a1[1];
  uint64_t v3 = a1[2];
  unint64_t v4 = v3 - v2;
  if (v3 == v2) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = ((v3 - v2) << 7) - 1;
  }
  uint64_t v6 = (char *)a1[4];
  if (v5 - (unint64_t)&v6[(void)a1[5]] < 0x400)
  {
    uint64_t v7 = (uint64_t)(a1 + 3);
    uint64_t v8 = a1[3];
    unint64_t v9 = *a1;
    uint64_t v10 = v8 - (_BYTE *)*a1;
    if (v4 >= v10)
    {
      if (v8 == v9) {
        unint64_t v11 = 1LL;
      }
      else {
        unint64_t v11 = v10 >> 2;
      }
      uint64_t v46 = a1 + 3;
      __p = sub_100018788(v7, v11);
      uint64_t v43 = (char *)__p;
      char v44 = (char *)__p;
      char v45 = (char *)__p + 8 * v12;
      char v41 = operator new(0x1000uLL);
      sub_1000247E0(&__p, &v41);
      uint64_t v13 = (char *)a1[1];
      unint64_t v14 = v44;
      if (v13 == a1[2])
      {
        int v33 = (char *)a1[1];
      }

      else
      {
        do
        {
          if (v14 == v45)
          {
            int64_t v15 = v43 - (_BYTE *)__p;
            if (v43 <= __p)
            {
              if (v14 == __p) {
                unint64_t v23 = 1LL;
              }
              else {
                unint64_t v23 = (v14 - (_BYTE *)__p) >> 2;
              }
              uint64_t v24 = (char *)sub_100018788((uint64_t)v46, v23);
              uint64_t v26 = v43;
              unint64_t v14 = &v24[8 * (v23 >> 2)];
              uint64_t v27 = v44 - v43;
              if (v44 != v43)
              {
                unint64_t v14 = &v24[8 * (v23 >> 2) + (v27 & 0xFFFFFFFFFFFFFFF8LL)];
                uint64_t v28 = 8 * (v27 >> 3);
                __int128 v29 = &v24[8 * (v23 >> 2)];
                do
                {
                  uint64_t v30 = *(void *)v26;
                  v26 += 8;
                  *(void *)__int128 v29 = v30;
                  v29 += 8;
                  v28 -= 8LL;
                }

                while (v28);
              }

              unint64_t v31 = __p;
              __p = v24;
              uint64_t v43 = &v24[8 * (v23 >> 2)];
              char v44 = v14;
              char v45 = &v24[8 * v25];
              if (v31)
              {
                operator delete(v31);
                unint64_t v14 = v44;
              }
            }

            else
            {
              uint64_t v16 = v15 >> 3;
              BOOL v17 = v15 >> 3 < -1;
              uint64_t v18 = (v15 >> 3) + 2;
              if (v17) {
                uint64_t v19 = v18;
              }
              else {
                uint64_t v19 = v16 + 1;
              }
              uint64_t v20 = &v43[-8 * (v19 >> 1)];
              int64_t v21 = v14 - v43;
              if (v14 != v43)
              {
                memmove(&v43[-8 * (v19 >> 1)], v43, v14 - v43);
                unint64_t v14 = v43;
              }

              uint64_t v22 = &v14[-8 * (v19 >> 1)];
              unint64_t v14 = &v20[v21];
              uint64_t v43 = v22;
              char v44 = &v20[v21];
            }
          }

          uint64_t v32 = *(void *)v13;
          v13 += 8;
          *(void *)unint64_t v14 = v32;
          unint64_t v14 = v44 + 8;
          v44 += 8;
        }

        while (v13 != a1[2]);
        int v33 = (char *)a1[1];
      }

      uint64_t v36 = *a1;
      uint64_t v37 = v43;
      *a1 = __p;
      a1[1] = v37;
      __p = v36;
      uint64_t v43 = v33;
      unint64_t v38 = (char *)a1[3];
      size_t v39 = v45;
      a1[2] = v14;
      a1[3] = v39;
      char v44 = v13;
      char v45 = v38;
      if (v14 - v37 == 8) {
        uint64_t v40 = 512LL;
      }
      else {
        uint64_t v40 = (uint64_t)a1[4] + 1024;
      }
      a1[4] = (void *)v40;
      if (v13 != v33) {
        char v44 = &v13[(v33 - v13 + 7) & 0xFFFFFFFFFFFFFFF8LL];
      }
      if (v36) {
        operator delete(v36);
      }
    }

    else
    {
      if (v2 == v9)
      {
        __p = operator new(0x1000uLL);
        sub_1000245B0(a1, &__p);
        unsigned int v34 = a1[2];
        __p = (void *)*(v34 - 1);
        a1[2] = v34 - 1;
      }

      else
      {
        __p = operator new(0x1000uLL);
      }

      sub_1000246C4((uint64_t)a1, &__p);
      if ((_BYTE *)a1[2] - (_BYTE *)a1[1] == 8) {
        uint64_t v35 = 512LL;
      }
      else {
        uint64_t v35 = (uint64_t)a1[4] + 1024;
      }
      a1[4] = (void *)v35;
    }
  }

  else
  {
    a1[4] = v6 + 1024;
    __p = (void *)*((void *)v3 - 1);
    a1[2] = v3 - 8;
    sub_1000246C4((uint64_t)a1, &__p);
  }

void sub_10007F68C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10007F6D8(uint64_t a1, int a2)
{
  unint64_t v2 = *(void *)(a1 + 32);
  if (v2 < 0x400) {
    a2 = 1;
  }
  if (v2 < 0x800) {
    int v4 = a2;
  }
  else {
    int v4 = 0;
  }
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(void *)(a1 + 8) += 8LL;
    *(void *)(a1 + 32) -= 1024LL;
  }

  return v4 ^ 1u;
}

void *sub_10007F734(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10002DC70(a1, a2);
    int v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }

  return a1;
}

void sub_10007F78C(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

BOOL sub_10007F7A8(uint64_t a1, float *a2, float *a3)
{
  float v3 = *a2;
  float v4 = *a3;
  if (*a2 == *a3) {
    return 0LL;
  }
  if (v3 == -INFINITY || v4 >= -INFINITY && v4 <= -INFINITY)
  {
    float v4 = *(float *)sub_1000606CC();
    float v3 = *a2;
  }

  else if (v3 < v4)
  {
    float v4 = *a2;
  }

  return v4 == v3;
}

uint64_t sub_10007F848(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 4;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2E20;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  *(void *)(a1 + 24) = 0LL;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  sub_10008F49C( (void *)(a1 + 24),  *(const void **)a2,  *(void *)(a2 + 8),  (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2);
  sub_10002DBF0((void *)(a1 + 48), (uint64_t)(*(void *)(a2 + 8) - *(void *)a2) >> 2, &dword_1000AF5EC);
  return a1;
}

void sub_10007F8D4(_Unwind_Exception *exception_object)
{
  float v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 32) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

void sub_10007F8F4(void *a1)
{
  uint64_t v1 = sub_10007F960(a1);
  operator delete(v1);
}

uint64_t sub_10007F908(uint64_t a1)
{
  return **(unsigned int **)(a1 + 80);
}

uint64_t sub_10007F914(uint64_t a1, int a2)
{
  int v3 = a2;
  return sub_10007F9CC(a1 + 16, &v3);
}

uint64_t sub_10007F93C(uint64_t a1)
{
  return sub_10007FD24(a1 + 16);
}

BOOL sub_10007F948(uint64_t a1)
{
  return *(_DWORD *)(a1 + 104) == 0;
}

uint64_t sub_10007F958(uint64_t result)
{
  *(_DWORD *)(result + 104) = 0;
  return result;
}

void *sub_10007F960(void *a1)
{
  *a1 = off_1000D2EF0;
  unint64_t v2 = (void *)a1[14];
  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }

  int v3 = (void *)a1[10];
  if (v3)
  {
    a1[11] = v3;
    operator delete(v3);
  }

  float v4 = (void *)a1[7];
  if (v4)
  {
    a1[8] = v4;
    operator delete(v4);
  }

  uint64_t v5 = (void *)a1[4];
  if (v5)
  {
    a1[5] = v5;
    operator delete(v5);
  }

  return a1;
}

uint64_t sub_10007F9CC(uint64_t a1, int *a2)
{
  uint64_t v5 = a1 + 64;
  float v4 = *(int **)(a1 + 64);
  unint64_t v6 = *(int *)(v5 + 24);
  uint64_t v7 = *(int **)(v5 + 8);
  unint64_t v8 = v7 - v4;
  if (v8 <= v6)
  {
    unint64_t v9 = *(void *)(a1 + 80);
    if ((unint64_t)v7 >= v9)
    {
      if ((v8 + 1) >> 62) {
        sub_100018774();
      }
      unint64_t v11 = v9 - (void)v4;
      unint64_t v12 = (uint64_t)(v9 - (void)v4) >> 1;
      if (v12 <= v8 + 1) {
        unint64_t v12 = v8 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        unint64_t v14 = (char *)sub_10002C050(a1 + 80, v13);
        float v4 = *(int **)(a1 + 64);
        uint64_t v7 = *(int **)(a1 + 72);
      }

      else
      {
        unint64_t v14 = 0LL;
      }

      int64_t v15 = (int *)&v14[4 * v8];
      uint64_t v16 = &v14[4 * v13];
      *int64_t v15 = *a2;
      uint64_t v10 = v15 + 1;
      while (v7 != v4)
      {
        int v17 = *--v7;
        *--int64_t v15 = v17;
      }

      *(void *)(a1 + 64) = v15;
      *(void *)(a1 + 72) = v10;
      *(void *)(a1 + 80) = v16;
      if (v4) {
        operator delete(v4);
      }
    }

    else
    {
      *uint64_t v7 = *a2;
      uint64_t v10 = v7 + 1;
    }

    unint64_t v18 = *(void *)(a1 + 32);
    *(void *)(a1 + 72) = v10;
    uint64_t v19 = *(char **)(a1 + 24);
    if ((unint64_t)v19 >= v18)
    {
      int64_t v21 = *(char **)(a1 + 16);
      uint64_t v22 = (v19 - v21) >> 2;
      unint64_t v23 = v18 - (void)v21;
      unint64_t v24 = (uint64_t)(v18 - (void)v21) >> 1;
      if (v24 <= v22 + 1) {
        unint64_t v24 = v22 + 1;
      }
      if (v23 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25)
      {
        uint64_t v26 = (char *)sub_10002C050(a1 + 32, v25);
        int64_t v21 = *(char **)(a1 + 16);
        uint64_t v19 = *(char **)(a1 + 24);
      }

      else
      {
        uint64_t v26 = 0LL;
      }

      uint64_t v27 = &v26[4 * v22];
      uint64_t v28 = &v26[4 * v25];
      *(_DWORD *)uint64_t v27 = *(_DWORD *)(a1 + 88);
      uint64_t v20 = v27 + 4;
      while (v19 != v21)
      {
        int v29 = *((_DWORD *)v19 - 1);
        v19 -= 4;
        *((_DWORD *)v27 - 1) = v29;
        v27 -= 4;
      }

      *(void *)(a1 + 16) = v27;
      *(void *)(a1 + 24) = v20;
      *(void *)(a1 + 32) = v28;
      if (v21) {
        operator delete(v21);
      }
    }

    else
    {
      *(_DWORD *)uint64_t v19 = *(_DWORD *)(a1 + 88);
      uint64_t v20 = v19 + 4;
    }

    unint64_t v30 = *(void *)(a1 + 56);
    *(void *)(a1 + 24) = v20;
    unint64_t v31 = *(char **)(a1 + 48);
    if ((unint64_t)v31 < v30)
    {
      *(_DWORD *)unint64_t v31 = *(_DWORD *)(a1 + 88);
      uint64_t v32 = v31 + 4;
LABEL_51:
      *(void *)(a1 + 48) = v32;
      goto LABEL_52;
    }

    int v33 = *(char **)(a1 + 40);
    uint64_t v34 = (v31 - v33) >> 2;
    if (!((unint64_t)(v34 + 1) >> 62))
    {
      unint64_t v35 = v30 - (void)v33;
      unint64_t v36 = (uint64_t)(v30 - (void)v33) >> 1;
      if (v36 <= v34 + 1) {
        unint64_t v36 = v34 + 1;
      }
      if (v35 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37)
      {
        unint64_t v38 = (char *)sub_10002C050(a1 + 56, v37);
        int v33 = *(char **)(a1 + 40);
        unint64_t v31 = *(char **)(a1 + 48);
      }

      else
      {
        unint64_t v38 = 0LL;
      }

      size_t v39 = &v38[4 * v34];
      uint64_t v40 = &v38[4 * v37];
      *(_DWORD *)size_t v39 = *(_DWORD *)(a1 + 88);
      uint64_t v32 = v39 + 4;
      while (v31 != v33)
      {
        int v41 = *((_DWORD *)v31 - 1);
        v31 -= 4;
        *((_DWORD *)v39 - 1) = v41;
        v39 -= 4;
      }

      *(void *)(a1 + 40) = v39;
      *(void *)(a1 + 48) = v32;
      *(void *)(a1 + 56) = v40;
      if (v33) {
        operator delete(v33);
      }
      goto LABEL_51;
    }

uint64_t sub_10007FC6C(uint64_t a1, int *a2, int a3)
{
  unsigned int v3 = a3;
  if (a3 >= 1)
  {
    uint64_t v6 = *(void *)(a1 + 64);
    while (1)
    {
      unsigned int v7 = v3 - 1;
      uint64_t v8 = (v3 - 1) >> 1;
      if (sub_10007F7A8( *(void *)(a1 + 8),  (float *)(**(void **)a1 + 4LL * *(int *)(v6 + 4LL * v8)),  (float *)(**(void **)a1 + 4LL * *a2)))
      {
        break;
      }

      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(int *)(v9 + 4LL * v3);
      uint64_t v11 = *(int *)(v9 + 4 * v8);
      *(_DWORD *)(v9 + 4LL * v3) = v11;
      uint64_t v12 = *(void *)(a1 + 16);
      *(_DWORD *)(v12 + 4 * v11) = v3;
      *(_DWORD *)(v9 + 4 * v8) = v10;
      *(_DWORD *)(v12 + 4 * v10) = v8;
      uint64_t v6 = *(void *)(a1 + 64);
      LODWORD(v10) = *(_DWORD *)(v6 + 4LL * v3);
      *(_DWORD *)(v6 + 4LL * v3) = *(_DWORD *)(v6 + 4 * v8);
      *(_DWORD *)(v6 + 4 * v8) = v10;
      unsigned int v3 = v7 >> 1;
      if (v7 <= 1) {
        return *(unsigned int *)(*(void *)(a1 + 40) + 4LL * (int)v8);
      }
    }
  }

  LODWORD(v8) = v3;
  return *(unsigned int *)(*(void *)(a1 + 40) + 4LL * (int)v8);
}

uint64_t sub_10007FD24(uint64_t a1)
{
  uint64_t v1 = *(_DWORD **)(a1 + 64);
  uint64_t v2 = *v1;
  uint64_t v3 = *(int *)(a1 + 88) - 1LL;
  float v4 = *(int **)(a1 + 40);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[v3];
  *float v4 = v6;
  uint64_t v7 = *(void *)(a1 + 16);
  *(_DWORD *)(v7 + 4 * v6) = 0;
  v4[v3] = v5;
  *(_DWORD *)(v7 + 4 * v5) = v3;
  LODWORD(v4) = *v1;
  _DWORD *v1 = v1[v3];
  v1[v3] = (_DWORD)v4;
  --*(_DWORD *)(a1 + 88);
  sub_10007FD94(a1, 0LL);
  return v2;
}

BOOL sub_10007FD94(BOOL result, uint64_t a2)
{
  uint64_t v3 = result;
  while (1)
  {
    uint64_t v4 = (2 * (_DWORD)a2) | 1u;
    if ((int)v4 >= *(_DWORD *)(v3 + 88)
      || !(double result = sub_10007F7A8( *(void *)(v3 + 8),  (float *)(**(void **)v3 + 4LL * *(int *)(*(void *)(v3 + 64) + 4LL * (int)v4)),  (float *)(**(void **)v3 + 4LL * *(int *)(*(void *)(v3 + 64) + 4LL * (int)a2)))))
    {
      uint64_t v4 = a2;
    }

    unsigned int v5 = 2 * a2 + 2;
    if ((signed int)v5 < *(_DWORD *)(v3 + 88))
    {
      double result = sub_10007F7A8( *(void *)(v3 + 8),  (float *)(**(void **)v3 + 4LL * *(int *)(*(void *)(v3 + 64) + 4LL * (int)v5)),  (float *)(**(void **)v3 + 4LL * *(int *)(*(void *)(v3 + 64) + 4LL * (int)v4)));
      if (result) {
        uint64_t v4 = v5;
      }
      else {
        uint64_t v4 = v4;
      }
    }

    if ((_DWORD)v4 == (_DWORD)a2) {
      break;
    }
    uint64_t v6 = *(void *)(v3 + 40);
    uint64_t v7 = *(int *)(v6 + 4LL * (int)a2);
    uint64_t v8 = *(int *)(v6 + 4LL * (int)v4);
    *(_DWORD *)(v6 + 4LL * (int)a2) = v8;
    uint64_t v9 = *(void *)(v3 + 16);
    *(_DWORD *)(v9 + 4 * v8) = a2;
    *(_DWORD *)(v6 + 4LL * (int)v4) = v7;
    *(_DWORD *)(v9 + 4 * v7) = v4;
    uint64_t v10 = *(void *)(v3 + 64);
    LODWORD(v7) = *(_DWORD *)(v10 + 4LL * (int)a2);
    *(_DWORD *)(v10 + 4LL * (int)a2) = *(_DWORD *)(v10 + 4LL * (int)v4);
    *(_DWORD *)(v10 + 4LL * (int)v4) = v7;
    a2 = v4;
  }

  return result;
}

void *sub_10007FE78(void *a1)
{
  *a1 = off_1000D2F58;
  sub_10007F2B8(a1 + 2);
  return a1;
}

void sub_10007FEA8(void *a1)
{
  *a1 = off_1000D2F58;
  sub_10007F2B8(a1 + 2);
  operator delete(a1);
}

uint64_t sub_10007FED8(void *a1)
{
  unint64_t v1 = a1[7] + a1[6] - 1LL;
  return *(unsigned int *)(*(void *)(a1[3] + ((v1 >> 7) & 0x1FFFFFFFFFFFFF8LL)) + 4 * (v1 & 0x3FF));
}

void sub_10007FF00(uint64_t a1, int a2)
{
  int v2 = a2;
  sub_10007F34C(a1 + 16, &v2);
}

uint64_t sub_10007FF28(uint64_t a1)
{
  return sub_10007FFCC((void *)(a1 + 16), 1);
}

BOOL sub_10007FF48(uint64_t a1)
{
  return *(void *)(a1 + 56) == 0LL;
}

void sub_10007FF58(void *a1)
{
  int v2 = (void **)a1[3];
  uint64_t v3 = a1[4];
  a1[7] = 0LL;
  unint64_t v4 = v3 - (void)v2;
  if (v4 >= 0x11)
  {
    do
    {
      operator delete(*v2);
      uint64_t v5 = a1[4];
      int v2 = (void **)(a1[3] + 8LL);
      a1[3] = v2;
      unint64_t v4 = v5 - (void)v2;
    }

    while (v4 > 0x10);
  }

  if (v4 >> 3 == 1)
  {
    uint64_t v6 = 512LL;
  }

  else
  {
    if (v4 >> 3 != 2) {
      return;
    }
    uint64_t v6 = 1024LL;
  }

  a1[6] = v6;
}

uint64_t sub_10007FFCC(void *a1, int a2)
{
  uint64_t v3 = a1[1];
  uint64_t v2 = a1[2];
  if (v2 == v3) {
    uint64_t v4 = 0LL;
  }
  else {
    uint64_t v4 = ((v2 - v3) << 7) - 1;
  }
  unint64_t v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x400) {
    a2 = 1;
  }
  if (v5 < 0x800) {
    int v7 = a2;
  }
  else {
    int v7 = 0;
  }
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8LL;
  }

  return v7 ^ 1u;
}

void *sub_100080038(void *a1)
{
  *a1 = &off_1000D2FC0;
  uint64_t v2 = (void *)a1[5];
  if (v2)
  {
    a1[6] = v2;
    operator delete(v2);
  }

  return a1;
}

void sub_100080074(void *__p)
{
  void *__p = &off_1000D2FC0;
  uint64_t v2 = (void *)__p[5];
  if (v2)
  {
    __p[6] = v2;
    operator delete(v2);
  }

  operator delete(__p);
}

uint64_t sub_1000800B0(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 32);
  if (v2 <= *(_DWORD *)(a1 + 36))
  {
    while (1)
    {
      uint64_t v4 = *(void *)(**(void **)(a1 + 16) + 8LL * v2);
      if (v4)
      {
        char v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 48LL))(v4);
        int v3 = *(_DWORD *)(a1 + 32);
        if ((v5 & 1) != 0) {
          goto LABEL_10;
        }
        unint64_t v6 = v3;
        if (*(void *)(**(void **)(a1 + 16) + 8LL * v3)) {
          goto LABEL_11;
        }
      }

      else
      {
        unint64_t v6 = v2;
        int v3 = v2;
      }

      uint64_t v7 = *(void *)(a1 + 40);
      if (v6 < (*(void *)(a1 + 48) - v7) >> 2 && *(_DWORD *)(v7 + 4 * v6) != -1) {
        goto LABEL_11;
      }
LABEL_10:
      int v2 = v3 + 1;
      *(_DWORD *)(a1 + 32) = v3 + 1;
      if (v3++ >= *(_DWORD *)(a1 + 36)) {
        goto LABEL_11;
      }
    }
  }

  int v3 = *(_DWORD *)(a1 + 32);
LABEL_11:
  uint64_t v9 = *(void *)(**(void **)(a1 + 16) + 8LL * v3);
  if (v9) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16LL))(v9);
  }
  else {
    return *(unsigned int *)(*(void *)(a1 + 40) + 4LL * v3);
  }
}

char *sub_100080188(uint64_t a1, uint64_t a2)
{
  int v2 = a2;
  int v4 = *(_DWORD *)(a1 + 32);
  int v5 = *(_DWORD *)(a1 + 36);
  uint64_t v6 = (int)a2;
  uint64_t v7 = **(void **)(a1 + 24);
  int v8 = *(_DWORD *)(v7 + 4LL * (int)a2);
  if (v4 > v5)
  {
    *(_DWORD *)(a1 + 36) = v8;
LABEL_3:
    *(_DWORD *)(a1 + 32) = v8;
    goto LABEL_7;
  }

  if (v8 <= v5)
  {
    if (v8 < v4) {
      goto LABEL_3;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 36) = v8;
  }

uint64_t sub_100080334(uint64_t result)
{
  unint64_t v1 = *(int *)(result + 32);
  uint64_t v2 = *(void *)(**(void **)(result + 16) + 8 * v1);
  if (v2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 32LL))(v2);
  }
  uint64_t v3 = *(void *)(result + 40);
  if (v1 < (*(void *)(result + 48) - v3) >> 2) {
    *(_DWORD *)(v3 + 4 * v1) = -1;
  }
  return result;
}

uint64_t sub_100080374(uint64_t a1, int a2)
{
  uint64_t result = *(void *)(**(void **)(a1 + 16) + 8LL * *(int *)(**(void **)(a1 + 24) + 4LL * a2));
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 40LL))(result);
  }
  return result;
}

uint64_t sub_10008039C(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 36);
  unint64_t v2 = *(int *)(a1 + 32);
  uint64_t v4 = *(void *)(**(void **)(a1 + 16) + 8 * v2);
  if (v4) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v4 + 48LL))(v4);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v2 >= (*(void *)(a1 + 48) - v5) >> 2) {
    return 1LL;
  }
  return *(_DWORD *)(v5 + 4 * v2) == -1;
}

double sub_100080404(uint64_t a1)
{
  unint64_t v2 = *(int *)(a1 + 32);
  if ((int)v2 <= *(_DWORD *)(a1 + 36))
  {
    do
    {
      uint64_t v3 = *(void *)(**(void **)(a1 + 16) + 8 * v2);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(void *)v3 + 56LL))(v3);
      }

      else
      {
        uint64_t v4 = *(void *)(a1 + 40);
        if (v2 < (*(void *)(a1 + 48) - v4) >> 2) {
          *(_DWORD *)(v4 + 4 * v2) = -1;
        }
      }
    }

    while ((uint64_t)v2++ < *(int *)(a1 + 36));
  }

  double result = NAN;
  *(void *)(a1 + 32) = 0xFFFFFFFF00000000LL;
  return result;
}

void sub_10008048C(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100018774();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_10002C050(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_100080520(uint64_t a1, uint64_t a2, char a3)
{
  int v47 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v47 == -1)
  {
    sub_10007ED84((char ***)a2);
    return;
  }

  uint64_t v58 = 0LL;
  uint64_t v59 = 0LL;
  char v60 = 0LL;
  __int128 v57 = 0u;
  memset(v56, 0, sizeof(v56));
  sub_10002B8A4(v53, 64LL);
  v55 = 0LL;
  uint64_t v52 = off_1000D3028;
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v46) {
    uint64_t v6 = sub_10005BFFC(a1);
  }
  else {
    uint64_t v6 = (v47 + 1);
  }
  if ((int)v6 <= (unint64_t)(v59 - v58))
  {
  }

  else
  {
    sub_10002BA28(&v58, (int)v6 - (v59 - v58), &unk_1000AF6CB);
  }

  uint64_t v49 = 0LL;
  int v50 = 0;
  int v51 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v49);
  uint64_t v7 = v47;
  char v45 = a3;
  do
  {
    v58[(int)v7] = 1;
    uint64_t v8 = v55;
    if (v55)
    {
      v55 = (char *)*((void *)v55 + 6);
    }

    else
    {
      uint64_t v8 = sub_10002BED8(v53, 1LL);
      *((void *)v8 + 6) = 0LL;
    }

    *(_DWORD *)uint64_t v8 = v7;
    *(_OWORD *)(v8 + 24) = 0u;
    *((void *)v8 + 5) = 0LL;
    *(_OWORD *)(v8 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v7, v8 + 8);
    int v48 = v8;
    sub_100081AF0(v56, &v48);
    uint64_t v9 = *((void *)&v57 + 1);
    if (!*((void *)&v57 + 1))
    {
      char v10 = 1;
      if ((a3 & 1) != 0) {
        break;
      }
      goto LABEL_66;
    }

    char v10 = 1;
    do
    {
      uint64_t v11 = *(char **)(*(void *)(*((void *)&v56[0] + 1)
      unint64_t v12 = *(int *)v11;
      unint64_t v13 = v59 - v58;
      if (v59 - v58 <= v12)
      {
        uint64_t v6 = (v12 + 1);
        if ((int)v6 <= v13)
        {
        }

        else
        {
          sub_10002BA28(&v58, (int)v6 - v13, &unk_1000AF6CB);
        }
      }

      if ((v10 & 1) == 0)
      {
LABEL_32:
        v58[v12] = 2;
        uint64_t v19 = *((void *)v11 + 1);
        if (v19)
        {
          (*(void (**)(uint64_t))(*(void *)v19 + 8LL))(v19);
        }

        else
        {
          uint64_t v20 = (_DWORD *)*((void *)v11 + 4);
          if (v20) {
            --*v20;
          }
        }

        *((void *)v11 + 6) = v55;
        v55 = v11;
        --*((void *)&v57 + 1);
        sub_10002C2E0(v56, 1);
        if (!*((void *)&v57 + 1))
        {
          sub_10007EF2C(a2, v12);
          goto LABEL_62;
        }

        uint64_t v21 = *(void *)(*(void *)(*((void *)&v56[0] + 1)
        uint64_t v22 = *(void *)(v21 + 8);
        if (v22) {
          (*(void (**)(uint64_t))(*(void *)v22 + 24LL))(v22);
        }
        sub_10007EF2C(a2, v12);
        uint64_t v23 = *(void *)(v21 + 8);
        if (v23)
        {
LABEL_41:
          (*(void (**)(uint64_t))(*(void *)v23 + 32LL))(v23);
          goto LABEL_62;
        }

        ++*(void *)(v21 + 40);
        goto LABEL_62;
      }

      uint64_t v14 = *((void *)v11 + 1);
      if (!v14)
      {
        if (*((void *)v11 + 5) >= *((void *)v11 + 3)) {
          goto LABEL_32;
        }
LABEL_28:
        uint64_t v16 = *((void *)v11 + 2) + 16LL * *((void *)v11 + 5);
        goto LABEL_29;
      }

      uint64_t v15 = *((void *)v11 + 1);
      if (!v15) {
        goto LABEL_28;
      }
      uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 24LL))(v15);
LABEL_29:
      unint64_t v17 = *(int *)(v16 + 12);
      unint64_t v18 = v59 - v58;
      if (v59 - v58 <= v17)
      {
        uint64_t v6 = v17 + 1;
        if (v17 + 1 <= v18)
        {
          if (v17 + 1 < v18) {
            uint64_t v59 = &v58[v6];
          }
        }

        else
        {
          sub_10002BA28(&v58, v17 + 1 - v18, &unk_1000AF6CB);
        }
      }

      if (*(void *)v16)
      {
        uint64_t v23 = *((void *)v11 + 1);
        if (v23) {
          goto LABEL_41;
        }
LABEL_58:
        ++*((void *)v11 + 5);
        goto LABEL_62;
      }

      uint64_t v24 = *(int *)(v16 + 12);
      int v25 = v58[v24];
      if (v25 == 1)
      {
        **(_BYTE **)(a2 + 8) = 0;
        uint64_t v27 = *((void *)v11 + 1);
        if (v27)
        {
          (*(void (**)(uint64_t))(*(void *)v27 + 32LL))(v27);
          char v10 = 0;
          goto LABEL_62;
        }

        char v10 = 0;
        goto LABEL_58;
      }

      if (v25 == 2)
      {
        uint64_t v26 = *((void *)v11 + 1);
        if (v26) {
          (*(void (**)(uint64_t))(*(void *)v26 + 32LL))(v26);
        }
        else {
          ++*((void *)v11 + 5);
        }
      }

      else
      {
        v58[v24] = 1;
        uint64_t v28 = v55;
        if (v55)
        {
          v55 = (char *)*((void *)v55 + 6);
        }

        else
        {
          uint64_t v28 = sub_10002BED8(v53, 1LL);
          *((void *)v28 + 6) = 0LL;
        }

        *(_DWORD *)uint64_t v28 = *(_DWORD *)(v16 + 12);
        *(_OWORD *)(v28 + 24) = 0u;
        *((void *)v28 + 5) = 0LL;
        *(_OWORD *)(v28 + 8) = 0u;
        (*(void (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
        int v48 = v28;
        sub_100081AF0(v56, &v48);
      }

      char v10 = 1;
LABEL_62:
      uint64_t v9 = *((void *)&v57 + 1);
    }

    while (*((void *)&v57 + 1));
    if ((a3 & 1) != 0) {
      break;
    }
LABEL_66:
    if ((_DWORD)v7 == v47) {
      uint64_t v7 = 0LL;
    }
    else {
      uint64_t v7 = (v7 + 1);
    }
    if ((int)v7 < (int)v6)
    {
      int v29 = &v58[(int)v7];
      uint64_t v30 = (int)v6 - (uint64_t)(int)v7;
      while (*v29++)
      {
        uint64_t v7 = (v7 + 1);
        if (!--v30)
        {
          uint64_t v7 = v6;
          break;
        }
      }
    }

    if (v46 || (_DWORD)v7 != (_DWORD)v6) {
      continue;
    }
LABEL_76:
    if (v49)
    {
      if (v49)
      {
        int v32 = (*(uint64_t (**)(uint64_t))(*(void *)v49 + 24LL))(v49);
        goto LABEL_82;
      }
    }

    else if (v51 >= v50)
    {
      continue;
    }

    int v32 = v51;
LABEL_82:
    if (v32 != (_DWORD)v6)
    {
      if (v49) {
        (*(void (**)(uint64_t))(*(void *)v49 + 32LL))(v49);
      }
      else {
        ++v51;
      }
      goto LABEL_76;
    }

    int v33 = v59;
    if (v59 >= v60)
    {
      unint64_t v35 = (unint64_t)v58;
      uint64_t v36 = v59 - v58;
      uint64_t v37 = v59 - v58 + 1;
      if (v37 < 0) {
        sub_100018774();
      }
      unint64_t v38 = v60 - v58;
      if (v38 >= 0x3FFFFFFFFFFFFFFFLL) {
        size_t v39 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        size_t v39 = v37;
      }
      if (v39) {
        uint64_t v40 = (char *)operator new(v39);
      }
      else {
        uint64_t v40 = 0LL;
      }
      int v41 = &v40[v36];
      int v42 = &v40[v36];
      char *v42 = 0;
      uint64_t v34 = v42 + 1;
      if (v33 != (char *)v35)
      {
        uint64_t v43 = &v33[~v35];
        do
        {
          char v44 = *--v33;
          (v43--)[(void)v40] = v44;
        }

        while (v33 != (char *)v35);
        int v33 = v58;
        int v41 = v40;
      }

      uint64_t v58 = v41;
      uint64_t v59 = v34;
      char v60 = &v40[v39];
      if (v33) {
        operator delete(v33);
      }
    }

    else
    {
      *uint64_t v59 = 0;
      uint64_t v34 = v33 + 1;
    }

    uint64_t v6 = (v6 + 1);
    uint64_t v59 = v34;
    a3 = v45;
  }

  while ((v10 & 1) != 0 && (int)v7 < (int)v6);
LABEL_106:
  sub_10007ED84((char ***)a2);
  if (v49) {
    (*(void (**)(uint64_t))(*(void *)v49 + 8LL))(v49);
  }
  uint64_t v52 = off_1000D0BA0;
  v53[0] = off_1000D0BC8;
  sub_10002B998(v54);
  sub_10002C34C(v56);
  if (v58)
  {
    uint64_t v59 = v58;
    operator delete(v58);
  }

void sub_100080C30( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

void sub_100080CC4(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }

  else
  {
    sub_100081E88((char **)a1, a2 - v2);
  }

void sub_100080CF4(uint64_t a1, uint64_t *a2, char a3)
{
  int v44 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v44 == -1)
  {
    sub_10002AF44((uint64_t)a2);
    return;
  }

  v55 = 0LL;
  v56 = 0LL;
  __int128 v57 = 0LL;
  __int128 v54 = 0u;
  memset(v53, 0, sizeof(v53));
  sub_10002B8A4(v50, 64LL);
  uint64_t v52 = 0LL;
  uint64_t v49 = off_1000D3028;
  uint64_t v43 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v43) {
    uint64_t v5 = sub_10005BFFC(a1);
  }
  else {
    uint64_t v5 = (v44 + 1);
  }
  if ((int)v5 <= (unint64_t)(v56 - v55))
  {
  }

  else
  {
    sub_10002BA28(&v55, (int)v5 - (v56 - v55), &unk_1000AF732);
  }

  uint64_t v46 = 0LL;
  int v47 = 0;
  int v48 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v46);
  uint64_t v6 = v44;
  do
  {
    v55[(int)v6] = 1;
    uint64_t v7 = v52;
    if (v52)
    {
      uint64_t v52 = (char *)*((void *)v52 + 6);
    }

    else
    {
      uint64_t v7 = sub_10002BED8(v50, 1LL);
      *((void *)v7 + 6) = 0LL;
    }

    *(_DWORD *)uint64_t v7 = v6;
    *(_OWORD *)(v7 + 24) = 0u;
    *((void *)v7 + 5) = 0LL;
    *(_OWORD *)(v7 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v6, v7 + 8);
    char v45 = v7;
    sub_100081AF0(v53, &v45);
    char v8 = sub_10002B010(a2, v6, v6);
LABEL_16:
    char v9 = v8;
    while (*((void *)&v54 + 1))
    {
      char v10 = *(int **)(*(void *)(*((void *)&v53[0] + 1)
      unint64_t v11 = *v10;
      unint64_t v12 = v56 - v55;
      if (v56 - v55 <= v11)
      {
        uint64_t v5 = (v11 + 1);
        if ((int)v5 <= v12)
        {
        }

        else
        {
          sub_10002BA28(&v55, (int)v5 - v12, &unk_1000AF732);
        }
      }

      if ((v9 & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v13 = *((void *)v10 + 1);
      if (v13)
      {
        uint64_t v14 = *((void *)v10 + 1);
        if (v14)
        {
          uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 24LL))(v14);
          goto LABEL_30;
        }

void sub_100081404( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

int *sub_100081494(void *a1, int a2)
{
  int v45 = a2;
  *((_DWORD *)a1 + 78) = *sub_10002ADB0();
  a1[37] = a1[36];
  double result = (int *)sub_100081F90(a1 + 2, a2);
  if (*((_BYTE *)a1 + 156)) {
    return result;
  }
  sub_100082F00(a1 + 26, &v45);
  uint64_t v5 = a1[31];
  if (!v5) {
    goto LABEL_67;
  }
  uint64_t v6 = a1 + 32;
  do
  {
    uint64_t v7 = v5 - 1;
    a1[31] = v7;
    sub_10007FFCC(a1 + 26, 1);
    while (a1[33] <= (unint64_t)(int)v8)
    {
      LOBYTE(v42) = 0;
      sub_10002BFAC((uint64_t)(a1 + 32), &v42);
    }

    uint64_t v9 = *(void *)(*v6 + 8 * ((unint64_t)(int)v8 >> 6));
    if ((v9 & (1LL << v8)) != 0) {
      goto LABEL_66;
    }
    *(void *)(*v6 + 8 * ((unint64_t)(int)v8 >> 6)) = v9 | (1LL << v8);
    uint64_t v10 = a1[35];
    unint64_t v11 = operator new(0x10uLL);
    *(void *)unint64_t v11 = v10;
    v11[2] = v8;
    a1[35] = v11;
    uint64_t v12 = *a1;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    unint64_t v44 = 0LL;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)v12 + 120LL))(v12, v8, &v42);
    while (1)
    {
      if (!(void)v42)
      {
LABEL_13:
        uint64_t v13 = *((void *)&v42 + 1) + 16 * v44;
        goto LABEL_14;
      }

      if (!(void)v42) {
        goto LABEL_13;
      }
      uint64_t v13 = (*(uint64_t (**)(void))(*(void *)v42 + 24LL))();
LABEL_14:
      unint64_t v14 = *(void *)v13;
      unint64_t v39 = *(void *)v13;
      float v15 = *(float *)(v13 + 8);
      float v40 = v15;
      int v41 = *(_DWORD *)(v13 + 12);
      float v16 = *(float *)(*(void *)a1[1] + 4LL * (int)v8);
      if (v16 == -INFINITY || v15 >= -INFINITY && v15 <= -INFINITY)
      {
        float v17 = *(float *)sub_1000606CC();
        LODWORD(v14) = v39;
        LODWORD(v18) = HIDWORD(v39);
      }

      else
      {
        unint64_t v18 = HIDWORD(v14);
        BOOL v19 = v16 == INFINITY || v15 == INFINITY;
        float v17 = v15 + v16;
        if (v19) {
          float v17 = INFINITY;
        }
      }

      float v40 = v17;
      if (v14 | v18)
      {
        uint64_t v20 = (uint64_t)(a1[37] - a1[36]) >> 4;
        uint64_t v21 = *((unsigned int *)a1 + 79);
        v36[0] = v14;
        v36[1] = v18;
        v36[2] = v41;
        uint64_t v37 = v21;
        uint64_t v38 = v20;
        uint64_t v22 = sub_100083298((uint64_t)(a1 + 20), v36, (uint64_t)v36);
        if (v23)
        {
          unint64_t v24 = a1[37];
          if (v24 < a1[38]) {
            goto LABEL_37;
          }
          goto LABEL_28;
        }

        int v26 = *((_DWORD *)a1 + 79);
        if (*((_DWORD *)v22 + 8) != v26)
        {
          *((_DWORD *)v22 + 8) = v26;
          unint64_t v24 = a1[37];
          v22[5] = (uint64_t)(v24 - a1[36]) >> 4;
          if (v24 < a1[38])
          {
LABEL_37:
            *(void *)unint64_t v24 = v39;
            *(float *)(v24 + 8) = v40;
            *(_DWORD *)(v24 + 12) = v41;
            uint64_t v25 = v24 + 16;
            goto LABEL_38;
          }

void sub_100081960( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, _DWORD *a20)
{
  if (a17)
  {
    (*(void (**)(uint64_t))(*(void *)a17 + 8LL))(a17);
  }

  else if (a20)
  {
    --*a20;
  }

  _Unwind_Resume(exception_object);
}

void *sub_1000819B0(void *a1, unint64_t a2, unsigned __int8 *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10002C140(a1, a2);
    int v6 = *a3;
    unint64_t v7 = a1[1];
    unint64_t v8 = v7 + a2;
    a1[1] = v7 + a2;
    if (v7)
    {
      unint64_t v9 = v8 - 1;
      if (((v8 - 1) ^ (v7 - 1)) < 0x40)
      {
LABEL_10:
        uint64_t v13 = *a1 + 8 * (v7 >> 6);
        int v14 = v7 & 0x3F;
        if (v6) {
          sub_100071E40(&v13, a2);
        }
        else {
          sub_100071EF0((uint64_t)&v13, a2);
        }
        return a1;
      }
    }

    else
    {
      unint64_t v9 = v8 - 1;
    }

    unint64_t v10 = v9 >> 6;
    if (v8 >= 0x41) {
      unint64_t v11 = v10;
    }
    else {
      unint64_t v11 = 0LL;
    }
    *(void *)(*a1 + 8 * v11) = 0LL;
    goto LABEL_10;
  }

  return a1;
}

void *sub_100081A80(void *a1)
{
  *a1 = off_1000D0BA0;
  a1[1] = off_1000D0BC8;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100081AB8(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D0BA0;
  a1[1] = (uint64_t)off_1000D0BC8;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void sub_100081AF0(void *a1, void *a2)
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
    sub_100081B74(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_100081B74(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    unint64_t v9 = (char *)(v7 + 1);
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
      BOOL v34 = (char *)sub_100018788(v5, v33);
      float v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        int v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)int v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

void sub_100081E3C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_100081E88(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_100018774();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      BOOL v14 = (char *)sub_10002C050(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }

    else
    {
      BOOL v14 = 0LL;
    }

    uint64_t v15 = &v14[4 * v11];
    uint64_t v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    uint64_t v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }

    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

uint64_t sub_100081F90(void *a1, int a2)
{
  if ((*(unsigned int (**)(void))(*(void *)*a1 + 16LL))(*a1) == -1)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*a1 + 56LL))(*a1, 4LL, 0LL);
    if (!result) {
      return result;
    }
    v181 = (char *)a1 + 140;
    goto LABEL_270;
  }

  (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 56LL))(*(void *)(a1[2] + 16LL));
  if (!*((_BYTE *)a1 + 33))
  {
    *(void *)(a1[1] + 8LL) = *(void *)a1[1];
    a1[6] = a1[5];
    a1[9] = a1[8];
    a1[12] = 0LL;
  }

  if (a2 == -1) {
    a2 = (*(uint64_t (**)(void))(*(void *)*a1 + 16LL))(*a1);
  }
  unint64_t v4 = a2;
  uint64_t v5 = a1[1];
  uint64_t v6 = (int **)(v5 + 8);
  if (a2 >= (unint64_t)((uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2))
  {
    v185 = (void **)(a1 + 5);
    uint64_t v7 = (void **)(a1 + 8);
    do
    {
      unint64_t v8 = sub_10002ADB0();
      uint64_t v9 = v8;
      unint64_t v10 = *(void *)(v5 + 16);
      uint64_t v11 = *(int **)(v5 + 8);
      if ((unint64_t)v11 >= v10)
      {
        unint64_t v13 = *(int **)v5;
        uint64_t v14 = ((uint64_t)v11 - *(void *)v5) >> 2;
        unint64_t v15 = v14 + 1;
        uint64_t v16 = v10 - (void)v13;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          int v18 = (char *)sub_10002C050(v5 + 16, v17);
          uint64_t v11 = *v6;
          unint64_t v13 = *(int **)v5;
        }

        else
        {
          int v18 = 0LL;
        }

        BOOL v19 = (int *)&v18[4 * v14];
        *BOOL v19 = *v9;
        uint64_t v12 = v19 + 1;
        while (v11 != v13)
        {
          int v20 = *--v11;
          *--BOOL v19 = v20;
        }

        *(void *)uint64_t v5 = v19;
        *uint64_t v6 = v12;
        *(void *)(v5 + 16) = &v18[4 * v17];
        if (v13) {
          operator delete(v13);
        }
      }

      else
      {
        *uint64_t v11 = *v8;
        uint64_t v12 = v11 + 1;
      }

      *uint64_t v6 = v12;
      int v21 = *sub_10002ADB0();
      uint64_t v23 = (int *)a1[6];
      unint64_t v22 = a1[7];
      if ((unint64_t)v23 >= v22)
      {
        unint64_t v25 = (int *)*v185;
        uint64_t v26 = ((char *)v23 - (_BYTE *)*v185) >> 2;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62) {
LABEL_276:
        }
          sub_100018774();
        uint64_t v28 = v22 - (void)v25;
        if (v28 >> 1 > v27) {
          unint64_t v27 = v28 >> 1;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          __int128 v30 = (char *)sub_10002C050((uint64_t)(a1 + 7), v29);
          unint64_t v25 = (int *)a1[5];
          uint64_t v23 = (int *)a1[6];
        }

        else
        {
          __int128 v30 = 0LL;
        }

        __int128 v31 = (int *)&v30[4 * v26];
        int *v31 = v21;
        uint64_t v24 = v31 + 1;
        while (v23 != v25)
        {
          int v32 = *--v23;
          *--__int128 v31 = v32;
        }

        a1[5] = v31;
        a1[6] = v24;
        a1[7] = &v30[4 * v29];
        if (v25) {
          operator delete(v25);
        }
      }

      else
      {
        int *v23 = v21;
        uint64_t v24 = v23 + 1;
      }

      a1[6] = v24;
      int v33 = *sub_10002ADB0();
      float v35 = (int *)a1[9];
      unint64_t v34 = a1[10];
      if ((unint64_t)v35 >= v34)
      {
        uint64_t v37 = (int *)*v7;
        uint64_t v38 = ((char *)v35 - (_BYTE *)*v7) >> 2;
        unint64_t v39 = v38 + 1;
        uint64_t v40 = v34 - (void)v37;
        if (v40 >> 1 > v39) {
          unint64_t v39 = v40 >> 1;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          uint64_t v42 = (char *)sub_10002C050((uint64_t)(a1 + 10), v41);
          uint64_t v37 = (int *)a1[8];
          float v35 = (int *)a1[9];
        }

        else
        {
          uint64_t v42 = 0LL;
        }

        __int128 v43 = (int *)&v42[4 * v38];
        int *v43 = v33;
        uint64_t v36 = v43 + 1;
        while (v35 != v37)
        {
          int v44 = *--v35;
          *--__int128 v43 = v44;
        }

        a1[8] = v43;
        a1[9] = v36;
        a1[10] = &v42[4 * v41];
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        int *v35 = v33;
        uint64_t v36 = v35 + 1;
      }

      a1[9] = v36;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
      uint64_t v5 = a1[1];
      uint64_t v6 = (int **)(v5 + 8);
    }

    while (v4 >= (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
  }

  if (*((_BYTE *)a1 + 33))
  {
    uint64_t v45 = (char *)a1[14];
    unint64_t v46 = (char *)a1[15];
    unint64_t v47 = (v46 - v45) >> 2;
    if (v47 <= v4)
    {
      int v48 = a1 + 16;
      do
      {
        if ((unint64_t)v46 >= *v48)
        {
          unint64_t v50 = v47 + 1;
          if ((v47 + 1) >> 62) {
            sub_100018774();
          }
          uint64_t v51 = *v48 - (void)v45;
          if (v51 >> 1 > v50) {
            unint64_t v50 = v51 >> 1;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52)
          {
            uint64_t v53 = (char *)sub_10002C050((uint64_t)(a1 + 16), v52);
            uint64_t v45 = (char *)a1[14];
            unint64_t v46 = (char *)a1[15];
          }

          else
          {
            uint64_t v53 = 0LL;
          }

          __int128 v54 = &v53[4 * v47];
          *(_DWORD *)__int128 v54 = -1;
          uint64_t v49 = v54 + 4;
          while (v46 != v45)
          {
            int v55 = *((_DWORD *)v46 - 1);
            v46 -= 4;
            *((_DWORD *)v54 - 1) = v55;
            v54 -= 4;
          }

          a1[14] = v54;
          a1[15] = v49;
          a1[16] = &v53[4 * v52];
          if (v45)
          {
            operator delete(v45);
            uint64_t v45 = (char *)a1[14];
          }

          else
          {
            uint64_t v45 = v54;
          }
        }

        else
        {
          *(_DWORD *)unint64_t v46 = -1;
          uint64_t v49 = v46 + 4;
        }

        a1[15] = v49;
        unint64_t v47 = (v49 - v45) >> 2;
        unint64_t v46 = v49;
      }

      while (v47 <= v4);
    }

    *(_DWORD *)&v45[4 * v4] = *((_DWORD *)a1 + 34);
  }

  *(_DWORD *)(*(void *)a1[1] + 4 * v4) = *sub_10002AD60();
  uint64_t v56 = a1[5];
  v184 = (void **)(a1 + 5);
  *(_DWORD *)(v56 + 4 * v4) = *sub_10002AD60();
  uint64_t v57 = a1[8];
  v186 = (void **)(a1 + 8);
  *(_DWORD *)(v57 + 4 * v4) = *sub_10002AD60();
  *(void *)(a1[11] + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v4;
  (*(void (**)(void, unint64_t))(**(void **)(a1[2] + 16LL) + 24LL))(*(void *)(a1[2] + 16LL), v4);
  uint64_t v182 = (uint64_t)(a1 + 10);
  uint64_t v183 = (uint64_t)(a1 + 7);
  uint64_t v58 = a1 + 16;
  v181 = (char *)a1 + 140;
  do
  {
    int v60 = (*(uint64_t (**)(void))(**(void **)(a1[2] + 16LL) + 16LL))(*(void *)(a1[2] + 16LL));
    (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 32LL))(*(void *)(a1[2] + 16LL));
    unint64_t v61 = v60;
    while (1)
    {
      char v62 = (int **)a1[1];
      char v63 = v62 + 1;
      if (v61 < v62[1] - *v62) {
        break;
      }
      int v64 = sub_10002ADB0();
      v65 = v64;
      unint64_t v66 = (unint64_t)v62[2];
      unint64_t v67 = v62[1];
      if ((unint64_t)v67 >= v66)
      {
        char v69 = *v62;
        uint64_t v70 = v67 - *v62;
        unint64_t v71 = v70 + 1;
        uint64_t v72 = v66 - (void)v69;
        if (v72 >> 1 > v71) {
          unint64_t v71 = v72 >> 1;
        }
        else {
          unint64_t v73 = v71;
        }
        if (v73)
        {
          __int128 v74 = (char *)sub_10002C050((uint64_t)(v62 + 2), v73);
          unint64_t v67 = *v63;
          char v69 = *v62;
        }

        else
        {
          __int128 v74 = 0LL;
        }

        __int128 v75 = (int *)&v74[4 * v70];
        *__int128 v75 = *v65;
        int v68 = v75 + 1;
        while (v67 != v69)
        {
          int v76 = *--v67;
          *--__int128 v75 = v76;
        }

        *char v62 = v75;
        int *v63 = v68;
        v62[2] = (int *)&v74[4 * v73];
        if (v69) {
          operator delete(v69);
        }
      }

      else
      {
        *unint64_t v67 = *v64;
        int v68 = v67 + 1;
      }

      int *v63 = v68;
      int v77 = *sub_10002ADB0();
      int v79 = (int *)a1[6];
      unint64_t v78 = a1[7];
      if ((unint64_t)v79 >= v78)
      {
        __int128 v81 = (int *)*v184;
        uint64_t v82 = ((char *)v79 - (_BYTE *)*v184) >> 2;
        unint64_t v83 = v82 + 1;
        uint64_t v84 = v78 - (void)v81;
        if (v84 >> 1 > v83) {
          unint64_t v83 = v84 >> 1;
        }
        else {
          unint64_t v85 = v83;
        }
        if (v85)
        {
          uint64_t v86 = (char *)sub_10002C050(v183, v85);
          __int128 v81 = (int *)a1[5];
          int v79 = (int *)a1[6];
        }

        else
        {
          uint64_t v86 = 0LL;
        }

        int v87 = (int *)&v86[4 * v82];
        *int v87 = v77;
        __int128 v80 = v87 + 1;
        while (v79 != v81)
        {
          int v88 = *--v79;
          *--int v87 = v88;
        }

        a1[5] = v87;
        a1[6] = v80;
        a1[7] = &v86[4 * v85];
        if (v81) {
          operator delete(v81);
        }
      }

      else
      {
        *int v79 = v77;
        __int128 v80 = v79 + 1;
      }

      a1[6] = v80;
      int v89 = *sub_10002ADB0();
      v91 = (int *)a1[9];
      unint64_t v90 = a1[10];
      if ((unint64_t)v91 >= v90)
      {
        char v93 = (int *)*v186;
        uint64_t v94 = ((char *)v91 - (_BYTE *)*v186) >> 2;
        unint64_t v95 = v94 + 1;
        uint64_t v96 = v90 - (void)v93;
        if (v96 >> 1 > v95) {
          unint64_t v95 = v96 >> 1;
        }
        else {
          unint64_t v97 = v95;
        }
        if (v97)
        {
          v98 = (char *)sub_10002C050(v182, v97);
          char v93 = (int *)a1[8];
          v91 = (int *)a1[9];
        }

        else
        {
          v98 = 0LL;
        }

        v99 = (int *)&v98[4 * v94];
        int *v99 = v89;
        v92 = v99 + 1;
        while (v91 != v93)
        {
          int v100 = *--v91;
          *--v99 = v100;
        }

        a1[8] = v99;
        a1[9] = v92;
        a1[10] = &v98[4 * v97];
        if (v93) {
          operator delete(v93);
        }
      }

      else
      {
        int *v91 = v89;
        v92 = v91 + 1;
      }

      a1[9] = v92;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
    }

    if (*((_BYTE *)a1 + 32))
    {
      (*(void (**)(uint64_t *__return_ptr, void, unint64_t))(*(void *)*a1 + 24LL))(&v190, *a1, v61);
      int v101 = sub_10002ADB0();
      LODWORD(v187) = v190;
      HIDWORD(v190) = *v101;
      v59.n128_u32[0] = v190;
      if (*(float *)&v190 != *((float *)&v190 + 1))
      {
LABEL_266:
        ++*((_DWORD *)a1 + 34);
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void, __n128))(*(void *)*a1 + 56LL))( *a1,  4LL,  0LL,  v59);
        if (!result) {
          return result;
        }
LABEL_270:
        _BYTE *v181 = 1;
        return result;
      }
    }

    *(void *)(a1[11] + ((v61 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v61);
    uint64_t v102 = a1[8];
    float v103 = *(float *)(v102 + 4 * v61);
    *(_DWORD *)(v102 + 4 * v61) = *sub_10002ADB0();
    uint64_t v104 = *a1;
    __int128 v187 = 0u;
    __int128 v188 = 0u;
    unint64_t v189 = 0LL;
    (*(void (**)(uint64_t, unint64_t, __int128 *))(*(void *)v104 + 120LL))(v104, v61, &v187);
    while (1)
    {
      if (!(void)v187)
      {
        if (v189 >= (unint64_t)v188)
        {
LABEL_258:
          char v179 = 1;
          goto LABEL_259;
        }

LABEL_140:
        uint64_t v105 = *((void *)&v187 + 1) + 16 * v189;
        goto LABEL_141;
      }

      if (!(void)v187) {
        goto LABEL_140;
      }
      uint64_t v105 = (*(uint64_t (**)(void))(*(void *)v187 + 24LL))(v187);
LABEL_141:
      if (!*(void *)v105)
      {
        uint64_t v106 = a1[1];
        v107 = (int **)(v106 + 8);
        for (unint64_t i = *(int *)(v105 + 12); i >= (uint64_t)(*(void *)(v106 + 8) - *(void *)v106) >> 2; unint64_t i = *(int *)(v105 + 12))
        {
          v109 = sub_10002ADB0();
          v110 = v109;
          v111 = *v107;
          unint64_t v112 = *(void *)(v106 + 16);
          if ((unint64_t)*v107 >= v112)
          {
            v114 = *(int **)v106;
            uint64_t v115 = ((uint64_t)v111 - *(void *)v106) >> 2;
            unint64_t v116 = v115 + 1;
            uint64_t v117 = v112 - (void)v114;
            if (v117 >> 1 > v116) {
              unint64_t v116 = v117 >> 1;
            }
            else {
              unint64_t v118 = v116;
            }
            if (v118)
            {
              v119 = (char *)sub_10002C050(v106 + 16, v118);
              v111 = *v107;
              v114 = *(int **)v106;
            }

            else
            {
              v119 = 0LL;
            }

            v120 = (int *)&v119[4 * v115];
            int *v120 = *v110;
            v113 = v120 + 1;
            while (v111 != v114)
            {
              int v121 = *--v111;
              *--v120 = v121;
            }

            *(void *)uint64_t v106 = v120;
            *v107 = v113;
            *(void *)(v106 + 16) = &v119[4 * v118];
            if (v114) {
              operator delete(v114);
            }
          }

          else
          {
            int *v111 = *v109;
            v113 = v111 + 1;
          }

          *v107 = v113;
          int v122 = *sub_10002ADB0();
          v124 = (int *)a1[6];
          unint64_t v123 = a1[7];
          if ((unint64_t)v124 >= v123)
          {
            v126 = (int *)*v184;
            uint64_t v127 = ((char *)v124 - (_BYTE *)*v184) >> 2;
            unint64_t v128 = v127 + 1;
            uint64_t v129 = v123 - (void)v126;
            if (v129 >> 1 > v128) {
              unint64_t v128 = v129 >> 1;
            }
            else {
              unint64_t v130 = v128;
            }
            if (v130)
            {
              v131 = (char *)sub_10002C050(v183, v130);
              v126 = (int *)a1[5];
              v124 = (int *)a1[6];
            }

            else
            {
              v131 = 0LL;
            }

            v132 = (int *)&v131[4 * v127];
            int *v132 = v122;
            v125 = v132 + 1;
            while (v124 != v126)
            {
              int v133 = *--v124;
              *--v132 = v133;
            }

            a1[5] = v132;
            a1[6] = v125;
            a1[7] = &v131[4 * v130];
            if (v126) {
              operator delete(v126);
            }
          }

          else
          {
            int *v124 = v122;
            v125 = v124 + 1;
          }

          a1[6] = v125;
          int v134 = *sub_10002ADB0();
          v136 = (int *)a1[9];
          unint64_t v135 = a1[10];
          if ((unint64_t)v136 >= v135)
          {
            v138 = (int *)*v186;
            uint64_t v139 = ((char *)v136 - (_BYTE *)*v186) >> 2;
            unint64_t v140 = v139 + 1;
            uint64_t v141 = v135 - (void)v138;
            if (v141 >> 1 > v140) {
              unint64_t v140 = v141 >> 1;
            }
            else {
              unint64_t v142 = v140;
            }
            if (v142)
            {
              v143 = (char *)sub_10002C050(v182, v142);
              v138 = (int *)a1[8];
              v136 = (int *)a1[9];
            }

            else
            {
              v143 = 0LL;
            }

            v144 = (int *)&v143[4 * v139];
            int *v144 = v134;
            v137 = v144 + 1;
            while (v136 != v138)
            {
              int v145 = *--v136;
              *--v144 = v145;
            }

            a1[8] = v144;
            a1[9] = v137;
            a1[10] = &v143[4 * v142];
            if (v138) {
              operator delete(v138);
            }
          }

          else
          {
            int *v136 = v134;
            v137 = v136 + 1;
          }

          a1[9] = v137;
          BYTE4(v190) = 0;
          sub_10002BFAC((uint64_t)(a1 + 11), (_BYTE *)&v190 + 4);
          uint64_t v106 = a1[1];
          v107 = (int **)(v106 + 8);
        }

        if (*((_BYTE *)a1 + 33))
        {
          v146 = (char *)a1[14];
          v147 = (char *)a1[15];
          unint64_t v148 = (v147 - v146) >> 2;
          if (v148 <= (int)i)
          {
            do
            {
              if ((unint64_t)v147 >= *v58)
              {
                unint64_t v151 = v148 + 1;
                if ((v148 + 1) >> 62) {
                  sub_100018774();
                }
                uint64_t v152 = *v58 - (void)v146;
                if (v152 >> 1 > v151) {
                  unint64_t v151 = v152 >> 1;
                }
                else {
                  unint64_t v153 = v151;
                }
                if (v153)
                {
                  v154 = (char *)sub_10002C050((uint64_t)(a1 + 16), v153);
                  v146 = (char *)a1[14];
                  v147 = (char *)a1[15];
                }

                else
                {
                  v154 = 0LL;
                }

                v155 = &v154[4 * v148];
                *(_DWORD *)v155 = -1;
                v150 = v155 + 4;
                while (v147 != v146)
                {
                  int v156 = *((_DWORD *)v147 - 1);
                  v147 -= 4;
                  *((_DWORD *)v155 - 1) = v156;
                  v155 -= 4;
                }

                a1[14] = v155;
                a1[15] = v150;
                a1[16] = &v154[4 * v153];
                if (v146)
                {
                  operator delete(v146);
                  v146 = (char *)a1[14];
                }

                else
                {
                  v146 = v155;
                }
              }

              else
              {
                *(_DWORD *)v147 = -1;
                v150 = v147 + 4;
              }

              a1[15] = v150;
              unint64_t v148 = (v150 - v146) >> 2;
              int v157 = *(_DWORD *)(v105 + 12);
              v147 = v150;
            }

            while (v148 <= v157);
            uint64_t v149 = v157;
            LODWORD(i) = *(_DWORD *)(v105 + 12);
          }

          else
          {
            uint64_t v149 = (int)i;
          }

          if (*(_DWORD *)&v146[4 * v149] != *((_DWORD *)a1 + 34))
          {
            v158 = sub_10002ADB0();
            uint64_t v159 = *(int *)(v105 + 12);
            *(_DWORD *)(*(void *)a1[1] + 4 * v159) = *v158;
            uint64_t v160 = a1[5];
            *(_DWORD *)(v160 + 4 * v159) = *sub_10002ADB0();
            uint64_t v161 = *(int *)(v105 + 12);
            unint64_t i = (unint64_t)*v186;
            *(_DWORD *)(i + 4 * v161) = *sub_10002ADB0();
            unint64_t v162 = *(int *)(v105 + 12);
            *(void *)(a1[11] + ((v162 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v162);
            *(_DWORD *)(a1[14] + 4 * v162) = *((_DWORD *)a1 + 34);
            LODWORD(i) = *(_DWORD *)(v105 + 12);
          }
        }

        uint64_t v163 = *(void *)a1[1];
        uint64_t v164 = a1[5];
        uint64_t v165 = a1[8];
        if (v103 == -INFINITY || (float v166 = *(float *)(v105 + 8), v166 >= -INFINITY) && v166 <= -INFINITY)
        {
          float v167 = *(float *)sub_1000606CC();
        }

        else
        {
          BOOL v168 = v166 == INFINITY || v103 == INFINITY;
          float v169 = v103 + v166;
          float v167 = v168 ? INFINITY : v169;
        }

        float v170 = *(float *)(v163 + 4LL * (int)i);
        if (v170 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
        {
          float v171 = *(float *)sub_1000606CC();
          float v170 = *(float *)(v163 + 4LL * (int)i);
        }

        else
        {
          float v171 = v170 >= v167 ? v167 : *(float *)(v163 + 4LL * (int)i);
        }

        float v172 = *((float *)a1 + 7);
        float v173 = v171 + v172;
        float v174 = v172 + v170;
        if (v170 > v173 || v171 > v174) {
          break;
        }
      }

LABEL_255:
      if ((void)v187) {
        (*(void (**)(void))(*(void *)v187 + 32LL))(v187);
      }
      else {
        ++v189;
      }
    }

    float v176 = *(float *)(v164 + 4LL * (int)i);
    if (v176 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v176 = *(float *)sub_1000606CC();
    }

    else if (v176 >= v167)
    {
      float v176 = v167;
    }

    *(float *)(v164 + 4LL * (int)i) = v176;
    *(float *)(v163 + 4LL * (int)i) = v176;
    float v177 = *(float *)(v165 + 4LL * (int)i);
    if (v177 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v177 = *(float *)sub_1000606CC();
    }

    else if (v177 >= v167)
    {
      float v177 = v167;
    }

    *(float *)(v165 + 4LL * (int)i) = v177;
    if (*(float *)(v163 + 4LL * (int)i) != -INFINITY && v177 != -INFINITY)
    {
      uint64_t v178 = **(void **)(a1[2] + 16LL);
      if (((*(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> *(_DWORD *)(v105 + 12)) & 1) != 0)
      {
        (*(void (**)(void))(v178 + 40))();
      }

      else
      {
        (*(void (**)(void))(v178 + 24))();
        *(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << *(_DWORD *)(v105 + 12);
      }

      goto LABEL_255;
    }

    char v179 = 0;
    _BYTE *v181 = 1;
LABEL_259:
    uint64_t result = v187;
    if ((void)v187)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)v187 + 8LL))(v187);
    }

    else if (*((void *)&v188 + 1))
    {
      --**((_DWORD **)&v188 + 1);
    }
  }

  while ((v179 & 1) != 0);
  return result;
}

void sub_100082E94( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  if (a15)
  {
    (*(void (**)(uint64_t))(*(void *)a15 + 8LL))(a15);
  }

  else if (a18)
  {
    --*a18;
  }

  _Unwind_Resume(exception_object);
}

void sub_100082F00(void *a1, _DWORD *a2)
{
  uint64_t v4 = a1[2];
  uint64_t v5 = a1[1];
  if (v4 == v5) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = ((v4 - v5) << 7) - 1;
  }
  uint64_t v7 = a1[5];
  unint64_t v8 = v7 + a1[4];
  if (v6 == v8)
  {
    sub_100082F84(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(_DWORD *)(*(void *)(v5 + ((v8 >> 7) & 0x1FFFFFFFFFFFFF8LL)) + 4 * (v8 & 0x3FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_100082F84(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x400;
  unint64_t v4 = v2 - 1024;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
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
      unint64_t v34 = (char *)sub_100018788(v5, v33);
      float v35 = &v34[8 * (v33 >> 2)];
      uint64_t v37 = &v34[8 * v36];
      uint64_t v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        unint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)unint64_t v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

void sub_10008324C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void *sub_100083298(uint64_t a1, int *a2, uint64_t a3)
{
  int v7 = a2[1];
  uint64_t v6 = a2[2];
  int v8 = *a2;
  unint64_t v9 = v6 + 7853LL * *a2 + 7867LL * v7;
  unint64_t v10 = *(void *)(a1 + 8);
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      uint64_t v3 = v6 + 7853LL * v8 + 7867LL * v7;
      if (v9 >= v10) {
        uint64_t v3 = v9 % v10;
      }
    }

    else
    {
      uint64_t v3 = v9 & (v10 - 1);
    }

    uint64_t v12 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      uint64_t v13 = *v12;
      if (*v12)
      {
        do
        {
          unint64_t v14 = v13[1];
          if (v14 == v9)
          {
          }

          else
          {
            if (v11.u32[0] > 1uLL)
            {
              if (v14 >= v10) {
                v14 %= v10;
              }
            }

            else
            {
              v14 &= v10 - 1;
            }

            if (v14 != v3) {
              break;
            }
          }

          uint64_t v13 = (void *)*v13;
        }

        while (v13);
      }
    }
  }

  uint64_t v13 = operator new(0x30uLL);
  void *v13 = 0LL;
  v13[1] = v9;
  v13[2] = *(void *)a3;
  *((_DWORD *)v13 + 6) = *(_DWORD *)(a3 + 8);
  *((_OWORD *)v13 + 2) = *(_OWORD *)(a3 + 16);
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1LL);
  float v16 = *(float *)(a1 + 32);
  if (!v10 || (float)(v16 * (float)v10) < v15)
  {
    BOOL v17 = 1LL;
    if (v10 >= 3) {
      BOOL v17 = (v10 & (v10 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v10);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_100018334(a1, v20);
    unint64_t v10 = *(void *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10) {
        uint64_t v3 = v9 % v10;
      }
      else {
        uint64_t v3 = v9;
      }
    }

    else
    {
      uint64_t v3 = (v10 - 1) & v9;
    }
  }

  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    void *v13 = *v22;
LABEL_39:
    void *v22 = v13;
    goto LABEL_40;
  }

  void *v13 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = v13;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*v13)
  {
    unint64_t v23 = *(void *)(*v13 + 8LL);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v23 >= v10) {
        v23 %= v10;
      }
    }

    else
    {
      v23 &= v10 - 1;
    }

    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_39;
  }

void sub_1000834D8(_Unwind_Exception *a1)
{
}

void sub_1000834EC(uint64_t a1, uint64_t a2)
{
  int v4 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 136LL))(a1);
  if (v4 < 1) {
    return;
  }
  unint64_t v5 = v4;
  uint64_t v6 = sub_10002ADB0();
  sub_100084598(v101, v5, v6);
  v98 = 0LL;
  v99 = 0LL;
  uint64_t v100 = 0LL;
  int v7 = *(void ***)(a2 + 16);
  if (!v7)
  {
    sub_100083E5C(&v98, v5);
    sub_100083EF0(a1, (char **)&v98, 1, *(float *)(a2 + 24));
    int v7 = *(void ***)(a2 + 16);
  }

  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = &v98;
  }
  if (*(_DWORD *)(a2 + 4))
  {
    unint64_t v9 = v7 ? v7 : &v98;
    unint64_t v10 = v9[1];
    uint8x8_t v11 = *v8;
    if ((*(int (**)(uint64_t))(*(void *)a1 + 16LL))(a1) < (unint64_t)((v10 - v11) >> 2))
    {
      int v12 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
      uint64_t v13 = *v8;
      unint64_t v14 = sub_10002ADB0();
      LODWORD(v93[0]) = v13[v12];
      LODWORD(v91) = *v14;
      if (*(float *)v93 != *(float *)&v91)
      {
        v93[0] = v101;
        v93[1] = v8;
        __int128 v94 = 0u;
        __int128 v95 = 0u;
        __int128 v96 = 0u;
        memset(v97, 0, 28);
        LOBYTE(v90[0]) = 0;
        sub_1000819B0(&v91, v5, (unsigned __int8 *)v90);
        __p = (void *)-1LL;
        sub_10008DE90(v90, v5, &__p);
        __p = 0LL;
        int v88 = 0LL;
        int v89 = 0LL;
        int v15 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 176LL))(a1);
        int v16 = v15;
        BOOL v17 = v88;
        if (v88 >= v89)
        {
          unint64_t v19 = (char *)__p;
          uint64_t v20 = (v88 - (_BYTE *)__p) >> 2;
          unint64_t v21 = v20 + 1;
          uint64_t v22 = v89 - (_BYTE *)__p;
          if ((v89 - (_BYTE *)__p) >> 1 > v21) {
            unint64_t v21 = v22 >> 1;
          }
          else {
            unint64_t v23 = v21;
          }
          if (v23)
          {
            uint64_t v24 = (char *)sub_10002C050((uint64_t)&v89, v23);
            unint64_t v19 = (char *)__p;
            BOOL v17 = v88;
          }

          else
          {
            uint64_t v24 = 0LL;
          }

          unint64_t v25 = &v24[4 * v20];
          uint64_t v26 = &v24[4 * v23];
          *(_DWORD *)unint64_t v25 = v16;
          unint64_t v18 = v25 + 4;
          while (v17 != v19)
          {
            int v27 = *((_DWORD *)v17 - 1);
            v17 -= 4;
            *((_DWORD *)v25 - 1) = v27;
            v25 -= 4;
          }

          __p = v25;
          int v88 = v18;
          int v89 = v26;
          if (v19) {
            operator delete(v19);
          }
        }

        else
        {
          *(_DWORD *)int v88 = v15;
          unint64_t v18 = v17 + 4;
        }

        int v88 = v18;
        int v28 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
        unsigned int v85 = v28;
        if (*(_BYTE *)(a2 + 28))
        {
          float v29 = *(float *)a2;
          if (*(float *)a2 == -INFINITY || (float v30 = *((float *)*v8 + v28), v30 >= -INFINITY) && v30 <= -INFINITY)
          {
LABEL_43:
            float v31 = *(float *)sub_1000606CC();
LABEL_49:
            float v84 = v31;
            if (sub_10007F7A8((uint64_t)&v86, &v84, (float *)*v8 + (int)v85))
            {
              int v33 = 0;
            }

            else
            {
              *((_DWORD *)v101[0] + (int)v85) = *sub_10002AD60();
              int v34 = sub_1000841B8((uint64_t)v93, (int *)&v85);
              *((void *)v90[0] + (int)v85) = v34;
              int v33 = 1;
            }

            while (LODWORD(v97[3]))
            {
              unsigned int v85 = *(_DWORD *)v97[0];
              sub_100084458((uint64_t)v93);
              int v35 = v85;
              uint64_t v36 = (int)v85;
              *((void *)v90[0] + (int)v85) = -1LL;
              *(void *)((char *)v91 + (((unint64_t)v35 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v35;
              uint64_t v37 = (float *)v101[0];
              (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)a1 + 24LL))(&v82, a1);
              float v38 = v37[v36];
              if (v38 == -INFINITY || *(float *)&v82 >= -INFINITY && *(float *)&v82 <= -INFINITY)
              {
                float v39 = *(float *)sub_1000606CC();
              }

              else
              {
                BOOL v40 = *(float *)&v82 == INFINITY || v38 == INFINITY;
                float v39 = v38 + *(float *)&v82;
                if (v40) {
                  float v39 = INFINITY;
                }
              }

              *(float *)&uint64_t v79 = v39;
              if (sub_10007F7A8((uint64_t)&v86, &v84, (float *)&v79))
              {
                uint64_t v41 = v85;
                int v83 = *sub_10002ADB0();
                (*(void (**)(uint64_t, uint64_t, int *))(*(void *)a1 + 160LL))(a1, v41, &v83);
              }

              (*(void (**)(uint64_t, void, uint64_t *))(*(void *)a1 + 272LL))(a1, v85, &v82);
              while (!(*(unsigned int (**)(uint64_t))(*(void *)v82 + 16LL))(v82))
              {
                uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)v82 + 24LL))(v82);
                uint64_t v79 = *(void *)v42;
                float v43 = *(float *)(v42 + 8);
                float v80 = v43;
                int v44 = *(_DWORD *)(v42 + 12);
                int v81 = v44;
                float v45 = *((float *)v101[0] + (int)v85);
                if (v45 == -INFINITY || v43 >= -INFINITY && v43 <= -INFINITY)
                {
                  float v46 = *(float *)sub_1000606CC();
                  int v44 = v81;
                }

                else
                {
                  BOOL v47 = v45 == INFINITY || v43 == INFINITY;
                  float v48 = v43 + v45;
                  if (v47) {
                    float v46 = INFINITY;
                  }
                  else {
                    float v46 = v48;
                  }
                }

                else {
                  uint64_t v49 = (int *)((char *)*v8 + 4 * v44);
                }
                if (v46 == -INFINITY || (float v50 = *(float *)v49, *(float *)v49 >= -INFINITY) && *(float *)v49 <= -INFINITY)
                {
                  float v51 = *(float *)sub_1000606CC();
                }

                else
                {
                  BOOL v52 = v50 == INFINITY || v46 == INFINITY;
                  float v51 = v46 + v50;
                  if (v52) {
                    float v51 = INFINITY;
                  }
                }

                float v78 = v51;
                if (sub_10007F7A8((uint64_t)&v86, &v84, &v78))
                {
                  int v81 = *(_DWORD *)__p;
                  (*(void (**)(uint64_t, uint64_t *))(*(void *)v82 + 80LL))(v82, &v79);
                }

                else
                {
                  uint64_t v53 = (float *)v101[0];
                  float v54 = *((float *)v101[0] + (int)v85);
                  if (v54 == -INFINITY || v80 >= -INFINITY && v80 <= -INFINITY)
                  {
                    float v55 = *(float *)sub_1000606CC();
                    uint64_t v53 = (float *)v101[0];
                  }

                  else
                  {
                    BOOL v56 = v80 == INFINITY || v54 == INFINITY;
                    float v55 = v54 + v80;
                    if (v56) {
                      float v55 = INFINITY;
                    }
                  }

                  float v77 = v55;
                  if (sub_10007F7A8((uint64_t)&v86, &v77, &v53[v81]))
                  {
                    uint64_t v57 = (float *)v101[0];
                    float v58 = *((float *)v101[0] + (int)v85);
                    if (v58 == -INFINITY || v80 >= -INFINITY && v80 <= -INFINITY)
                    {
                      float v59 = *(float *)sub_1000606CC();
                      uint64_t v57 = (float *)v101[0];
                    }

                    else
                    {
                      BOOL v61 = v80 == INFINITY || v58 == INFINITY;
                      float v59 = v58 + v80;
                      if (v61) {
                        float v59 = INFINITY;
                      }
                    }

                    unint64_t v60 = v81;
                    v57[v81] = v59;
                  }

                  else
                  {
                    unint64_t v60 = v81;
                  }

                  if (((*(void *)((char *)v91 + ((v60 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v60) & 1) == 0)
                  {
                    int v62 = *(_DWORD *)(a2 + 4);
                    if (v62 == -1 || v33 < v62)
                    {
                      uint64_t v63 = *((void *)v90[0] + v60);
                      if (v63 == -1)
                      {
                        int v64 = sub_1000841B8((uint64_t)v93, &v81);
                        *((void *)v90[0] + v81) = v64;
                        ++v33;
                      }

                      else
                      {
                        sub_1000844C8((uint64_t)v93, v63, &v81);
                      }
                    }
                  }
                }

                (*(void (**)(uint64_t))(*(void *)v82 + 32LL))(v82);
              }

              if (v82) {
                (*(void (**)(uint64_t))(*(void *)v82 + 8LL))(v82);
              }
            }

            unint64_t v65 = v92;
            if (v92)
            {
              unint64_t v66 = 0LL;
              do
              {
                if (((*(void *)((char *)v91 + ((v66 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v66) & 1) == 0)
                {
                  unint64_t v67 = v88;
                  if (v88 >= v89)
                  {
                    char v69 = (char *)__p;
                    uint64_t v70 = (v88 - (_BYTE *)__p) >> 2;
                    unint64_t v71 = v70 + 1;
                    uint64_t v72 = v89 - (_BYTE *)__p;
                    if ((v89 - (_BYTE *)__p) >> 1 > v71) {
                      unint64_t v71 = v72 >> 1;
                    }
                    else {
                      unint64_t v73 = v71;
                    }
                    if (v73)
                    {
                      __int128 v74 = (char *)sub_10002C050((uint64_t)&v89, v73);
                      char v69 = (char *)__p;
                      unint64_t v67 = v88;
                    }

                    else
                    {
                      __int128 v74 = 0LL;
                    }

                    __int128 v75 = &v74[4 * v70];
                    *(_DWORD *)__int128 v75 = v66;
                    int v68 = v75 + 4;
                    while (v67 != v69)
                    {
                      int v76 = *((_DWORD *)v67 - 1);
                      v67 -= 4;
                      *((_DWORD *)v75 - 1) = v76;
                      v75 -= 4;
                    }

                    __p = v75;
                    int v88 = v68;
                    int v89 = &v74[4 * v73];
                    if (v69) {
                      operator delete(v69);
                    }
                  }

                  else
                  {
                    *(_DWORD *)int v88 = v66;
                    int v68 = v67 + 4;
                  }

                  int v88 = v68;
                  unint64_t v65 = v92;
                }

                ++v66;
              }

              while (v65 > v66);
            }

            (*(void (**)(uint64_t, void **))(*(void *)a1 + 192LL))(a1, &__p);
            if (__p)
            {
              int v88 = (char *)__p;
              operator delete(__p);
            }

            if (v90[0])
            {
              v90[1] = v90[0];
              operator delete(v90[0]);
            }

            if (v91) {
              operator delete(v91);
            }
            if (v97[0])
            {
              v97[1] = v97[0];
              operator delete(v97[0]);
            }

            if (*((void *)&v95 + 1))
            {
              *(void *)&__int128 v96 = *((void *)&v95 + 1);
              operator delete(*((void **)&v95 + 1));
            }

            if ((void)v94)
            {
              *((void *)&v94 + 1) = v94;
              operator delete((void *)v94);
            }

            goto LABEL_14;
          }
        }

        else
        {
          float v29 = *((float *)*v8 + v28);
          if (v29 == -INFINITY) {
            goto LABEL_43;
          }
          float v30 = *(float *)a2;
        }

        BOOL v32 = v30 == INFINITY || v29 == INFINITY;
        float v31 = v29 + v30;
        if (v32) {
          float v31 = INFINITY;
        }
        goto LABEL_49;
      }
    }
  }

  (*(void (**)(uint64_t))(*(void *)a1 + 200LL))(a1);
LABEL_14:
  if (v98)
  {
    v99 = v98;
    operator delete(v98);
  }

  if (v101[0])
  {
    v101[1] = v101[0];
    operator delete(v101[0]);
  }

void sub_100083D90( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20, uint64_t a21, void *a22, uint64_t a23, uint64_t a24, uint64_t a25)
{
  if (__p) {
    operator delete(__p);
  }
  if (a19) {
    operator delete(a19);
  }
  if (a22) {
    operator delete(a22);
  }
  sub_100084548(&a25);
  int v27 = *(void **)(v25 - 152);
  if (v27)
  {
    *(void *)(v25 - 144) = v27;
    operator delete(v27);
  }

  int v28 = *(void **)(v25 - 128);
  if (v28)
  {
    *(void *)(v25 - 120) = v28;
    operator delete(v28);
  }

  _Unwind_Resume(a1);
}

void sub_100083E5C(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100018774();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_10002C050(v3, a2);
    int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    unint64_t v9 = &v6[4 * v8];
    unint64_t v10 = (char *)*a1;
    uint8x8_t v11 = (char *)a1[1];
    int v12 = v7;
    if (v11 != *a1)
    {
      int v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_100083EF0(uint64_t a1, char **a2, char a3, float a4)
{
  if ((a3 & 1) != 0)
  {
    sub_1000877DC(&v31);
    sub_100084704(a1, (uint64_t *)&v31, 1);
    __p = 0LL;
    float v29 = 0LL;
    uint64_t v30 = 0LL;
    sub_10008B760((uint64_t)v34, (uint64_t)&v31, (uint64_t)&__p);
    uint64_t v24 = v34;
    int v25 = -1;
    float v26 = a4;
    char v27 = 0;
    sub_100085014((uint64_t)&v31, &__p, (uint64_t)&v24);
    int v7 = *a2;
    a2[1] = *a2;
    uint64_t v8 = __p;
    if (v29 - (_BYTE *)__p == 4)
    {
      if (*(float *)__p >= -INFINITY && *(float *)__p <= -INFINITY)
      {
        unint64_t v9 = sub_1000606CC();
        sub_100085100((uint64_t)a2, 1uLL, v9);
      }
    }

    else
    {
      unint64_t v10 = 0LL;
      uint8x8_t v11 = a2 + 2;
      int v12 = v7;
      do
      {
        unint64_t v13 = v10 + 1;
        int v14 = v8[v10 + 1];
        if ((unint64_t)v12 >= *v11)
        {
          if (v13 >> 62) {
            sub_100018774();
          }
          uint64_t v16 = *v11 - (void)v7;
          if (v16 >> 1 > v13) {
            unint64_t v13 = v16 >> 1;
          }
          else {
            unint64_t v17 = v13;
          }
          if (v17)
          {
            unint64_t v18 = (char *)sub_10002C050((uint64_t)(a2 + 2), v17);
            int v7 = *a2;
            int v12 = a2[1];
          }

          else
          {
            unint64_t v18 = 0LL;
          }

          unint64_t v19 = &v18[4 * v10];
          *(_DWORD *)unint64_t v19 = v14;
          int v15 = v19 + 4;
          while (v12 != v7)
          {
            int v20 = *((_DWORD *)v12 - 1);
            v12 -= 4;
            *((_DWORD *)v19 - 1) = v20;
            v19 -= 4;
          }

          *a2 = v19;
          a2[1] = v15;
          a2[2] = &v18[4 * v17];
          if (v7) {
            operator delete(v7);
          }
        }

        else
        {
          *(_DWORD *)int v12 = v14;
          int v15 = v12 + 4;
        }

        a2[1] = v15;
        int v7 = *a2;
        unint64_t v10 = (v15 - *a2) >> 2;
        uint64_t v8 = __p;
        int v12 = v15;
      }

      while (v10 < ((v29 - (_BYTE *)__p) >> 2) - 1);
    }

    sub_10008E2A4((uint64_t)v34);
    if (__p)
    {
      float v29 = __p;
      operator delete(__p);
    }

    float v31 = off_1000D35A0;
    unint64_t v21 = v33;
    if (v33)
    {
      p_shared_owners = (unint64_t *)&v33->__shared_owners_;
      do
        unint64_t v23 = __ldaxr(p_shared_owners);
      while (__stlxr(v23 - 1, p_shared_owners));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  else
  {
    sub_100085160((uint64_t)v34, a1, (uint64_t)a2);
    float v31 = (void (**)())v34;
    int v32 = -1;
    *(float *)&int v33 = a4;
    BYTE4(v33) = 0;
    sub_100084618(a1, a2, (uint64_t)&v31);
    sub_10008E2A4((uint64_t)v34);
  }

void sub_100084154( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  if (__p) {
    operator delete(__p);
  }
  sub_100017FC4((uint64_t)&a16);
  _Unwind_Resume(a1);
}

uint64_t sub_1000841B8(uint64_t a1, int *a2)
{
  uint64_t v5 = a1 + 72;
  int v4 = *(int **)(a1 + 72);
  unint64_t v6 = *(int *)(v5 + 24);
  int v7 = *(int **)(v5 + 8);
  unint64_t v8 = v7 - v4;
  if (v8 <= v6)
  {
    unint64_t v9 = *(void *)(a1 + 88);
    if ((unint64_t)v7 >= v9)
    {
      if ((v8 + 1) >> 62) {
        sub_100018774();
      }
      unint64_t v11 = v9 - (void)v4;
      unint64_t v12 = (uint64_t)(v9 - (void)v4) >> 1;
      if (v12 <= v8 + 1) {
        unint64_t v12 = v8 + 1;
      }
      if (v11 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v13 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      if (v13)
      {
        int v14 = (char *)sub_10002C050(a1 + 88, v13);
        int v4 = *(int **)(a1 + 72);
        int v7 = *(int **)(a1 + 80);
      }

      else
      {
        int v14 = 0LL;
      }

      int v15 = (int *)&v14[4 * v8];
      uint64_t v16 = &v14[4 * v13];
      *int v15 = *a2;
      unint64_t v10 = v15 + 1;
      while (v7 != v4)
      {
        int v17 = *--v7;
        *--int v15 = v17;
      }

      *(void *)(a1 + 72) = v15;
      *(void *)(a1 + 80) = v10;
      *(void *)(a1 + 88) = v16;
      if (v4) {
        operator delete(v4);
      }
    }

    else
    {
      *int v7 = *a2;
      unint64_t v10 = v7 + 1;
    }

    unint64_t v18 = *(void *)(a1 + 40);
    *(void *)(a1 + 80) = v10;
    unint64_t v19 = *(char **)(a1 + 32);
    if ((unint64_t)v19 >= v18)
    {
      unint64_t v21 = *(char **)(a1 + 24);
      uint64_t v22 = (v19 - v21) >> 2;
      unint64_t v23 = v18 - (void)v21;
      unint64_t v24 = (uint64_t)(v18 - (void)v21) >> 1;
      if (v24 <= v22 + 1) {
        unint64_t v24 = v22 + 1;
      }
      if (v23 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v25 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v25 = v24;
      }
      if (v25)
      {
        float v26 = (char *)sub_10002C050(a1 + 40, v25);
        unint64_t v21 = *(char **)(a1 + 24);
        unint64_t v19 = *(char **)(a1 + 32);
      }

      else
      {
        float v26 = 0LL;
      }

      char v27 = &v26[4 * v22];
      int v28 = &v26[4 * v25];
      *(_DWORD *)char v27 = *(_DWORD *)(a1 + 96);
      int v20 = v27 + 4;
      while (v19 != v21)
      {
        int v29 = *((_DWORD *)v19 - 1);
        v19 -= 4;
        *((_DWORD *)v27 - 1) = v29;
        v27 -= 4;
      }

      *(void *)(a1 + 24) = v27;
      *(void *)(a1 + 32) = v20;
      *(void *)(a1 + 40) = v28;
      if (v21) {
        operator delete(v21);
      }
    }

    else
    {
      *(_DWORD *)unint64_t v19 = *(_DWORD *)(a1 + 96);
      int v20 = v19 + 4;
    }

    unint64_t v30 = *(void *)(a1 + 64);
    *(void *)(a1 + 32) = v20;
    float v31 = *(char **)(a1 + 56);
    if ((unint64_t)v31 < v30)
    {
      *(_DWORD *)float v31 = *(_DWORD *)(a1 + 96);
      int v32 = v31 + 4;
LABEL_51:
      *(void *)(a1 + 56) = v32;
      goto LABEL_52;
    }

    int v33 = *(char **)(a1 + 48);
    uint64_t v34 = (v31 - v33) >> 2;
    if (!((unint64_t)(v34 + 1) >> 62))
    {
      unint64_t v35 = v30 - (void)v33;
      unint64_t v36 = (uint64_t)(v30 - (void)v33) >> 1;
      if (v36 <= v34 + 1) {
        unint64_t v36 = v34 + 1;
      }
      if (v35 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v37 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v37 = v36;
      }
      if (v37)
      {
        float v38 = (char *)sub_10002C050(a1 + 64, v37);
        int v33 = *(char **)(a1 + 48);
        float v31 = *(char **)(a1 + 56);
      }

      else
      {
        float v38 = 0LL;
      }

      float v39 = &v38[4 * v34];
      BOOL v40 = &v38[4 * v37];
      *(_DWORD *)float v39 = *(_DWORD *)(a1 + 96);
      int v32 = v39 + 4;
      while (v31 != v33)
      {
        int v41 = *((_DWORD *)v31 - 1);
        v31 -= 4;
        *((_DWORD *)v39 - 1) = v41;
        v39 -= 4;
      }

      *(void *)(a1 + 48) = v39;
      *(void *)(a1 + 56) = v32;
      *(void *)(a1 + 64) = v40;
      if (v33) {
        operator delete(v33);
      }
      goto LABEL_51;
    }

uint64_t sub_100084458(uint64_t a1)
{
  int v1 = *(_DWORD **)(a1 + 72);
  uint64_t v2 = *v1;
  uint64_t v3 = *(int *)(a1 + 96) - 1LL;
  int v4 = *(int **)(a1 + 48);
  uint64_t v5 = *v4;
  uint64_t v6 = v4[v3];
  *int v4 = v6;
  uint64_t v7 = *(void *)(a1 + 24);
  *(_DWORD *)(v7 + 4 * v6) = 0;
  v4[v3] = v5;
  *(_DWORD *)(v7 + 4 * v5) = v3;
  LODWORD(v4) = *v1;
  _DWORD *v1 = v1[v3];
  v1[v3] = (_DWORD)v4;
  --*(_DWORD *)(a1 + 96);
  sub_10008E134(a1, 0LL);
  return v2;
}

uint64_t sub_1000844C8(uint64_t a1, int a2, int *a3)
{
  uint64_t v5 = *(int *)(*(void *)(a1 + 24) + 4LL * a2);
  int v6 = v5 - 1;
  BOOL v7 = sub_10008DFBC((uint64_t **)a1, *a3, *(_DWORD *)(*(void *)(a1 + 72) + 4LL * (v6 >> 1)));
  *(_DWORD *)(*(void *)(a1 + 72) + 4 * v5) = *a3;
  if (v7) {
    return sub_10008DF10(a1, a3, v5);
  }
  else {
    return sub_10008E134(a1, v5);
  }
}

void *sub_100084548(void *a1)
{
  uint64_t v2 = (void *)a1[9];
  if (v2)
  {
    a1[10] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[6];
  if (v3)
  {
    a1[7] = v3;
    operator delete(v3);
  }

  int v4 = (void *)a1[3];
  if (v4)
  {
    a1[4] = v4;
    operator delete(v4);
  }

  return a1;
}

void *sub_100084598(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_10002DC70(a1, a2);
    int v6 = (_DWORD *)a1[1];
    BOOL v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_1000845FC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void sub_100084618(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = *(void *)a3;
  int v6 = *(_DWORD *)(a3 + 16);
  char v7 = *(_BYTE *)(a3 + 20);
  char v8 = 0;
  *(_OWORD *)unint64_t v9 = 0u;
  *(_OWORD *)unint64_t v10 = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)unint64_t v12 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v14, 0, sizeof(v14));
  a2[1] = *a2;
  sub_10008681C(v5, *(_DWORD *)(a3 + 12));
  if (v14[20])
  {
    a2[1] = *a2;
    int v4 = sub_1000606CC();
    sub_100085100((uint64_t)a2, 1uLL, v4);
  }

  if (__p[1])
  {
    *(void **)int v14 = __p[1];
    operator delete(__p[1]);
  }

  if (v12[0]) {
    operator delete(v12[0]);
  }
  if (v10[1])
  {
    *(void **)&__int128 v11 = v10[1];
    operator delete(v10[1]);
  }

  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }

void sub_1000846F0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100084704(uint64_t a1, uint64_t *a2, char a3)
{
  uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  (*(void (**)(uint64_t *, uint64_t))(*a2 + 256))(a2, v6);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
  (*(void (**)(uint64_t *, uint64_t))(*a2 + 264))(a2, v7);
  if ((*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL))
  {
    int v8 = sub_10005BFFC(a1);
    (*(void (**)(uint64_t *, void))(*a2 + 224))(a2, (v8 + 1));
  }

  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  uint64_t v10 = 0LL;
  uint64_t v62 = 0LL;
  if ((a3 & 1) != 0) {
    goto LABEL_65;
  }
  *(void *)&__int128 v53 = 0LL;
  DWORD2(v53) = 0;
  LODWORD(v54) = 0;
  (*(void (**)(uint64_t, __int128 *))(*(void *)a1 + 112LL))(a1, &v53);
  uint64_t v11 = 0xFFFFFFFFLL;
  while (1)
  {
    if ((void)v53)
    {
      char v12 = (*(uint64_t (**)(void))(*(void *)v53 + 16LL))(v53);
      uint64_t v13 = v53;
      if ((v12 & 1) != 0) {
        goto LABEL_24;
      }
      if ((void)v53)
      {
        uint64_t v14 = (*(uint64_t (**)(void))(*(void *)v53 + 24LL))();
        goto LABEL_11;
      }
    }

    else if ((int)v54 >= SDWORD2(v53))
    {
      goto LABEL_26;
    }

    uint64_t v14 = v54;
LABEL_11:
    (*(void (**)(float *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v61, a1, v14);
    int v15 = sub_10002ADB0();
    *(float *)&__int128 v50 = v61;
    LODWORD(v58) = *v15;
    int v16 = 2 * ((_DWORD)v11 != -1);
    if ((_DWORD)v11 == -1) {
      int v17 = v14;
    }
    else {
      int v17 = -1;
    }
    uint64_t v11 = v61 == *(float *)&v58 ? v11 : v17;
    if ((v16 | 4) != 4) {
      break;
    }
    if ((void)v53) {
      (*(void (**)(void))(*(void *)v53 + 32LL))(v53);
    }
    else {
      LODWORD(v54) = v54 + 1;
    }
  }

  uint64_t v13 = v53;
LABEL_24:
  if (v13) {
    (*(void (**)(uint64_t))(*(void *)v13 + 8LL))(v13);
  }
LABEL_26:
  if ((_DWORD)v11 != -1)
  {
    (*(void (**)(int **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v58, a1, v11);
    unint64_t v18 = sub_10002AD60();
    LODWORD(v53) = (_DWORD)v58;
    LODWORD(v50) = *v18;
    v19.n128_u32[0] = v58;
    if (*(float *)&v58 == *(float *)&v50)
    {
      int v26 = 0;
      uint64_t v47 = 0LL;
      goto LABEL_66;
    }

    float v58 = 0LL;
    float v59 = 0LL;
    uint64_t v60 = 0LL;
    __int128 v53 = (unint64_t)&v58;
    *(void *)&__int128 v54 = 0LL;
    *((void *)&v54 + 1) = &v62;
    *(_OWORD *)BOOL v56 = 0u;
    *(_OWORD *)__p = 0u;
    sub_10005B86C(a1, (uint64_t *)&v53, 0);
    int v20 = v58;
    if (v58 != v59)
    {
      unint64_t v21 = 0LL;
      do
      {
        int v22 = *v20++;
      }

      while (v20 != v59);
      if (v21 > 1) {
        goto LABEL_54;
      }
    }

    unint64_t v52 = 0LL;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v11, &v50);
    while (2)
    {
      while (2)
      {
        if ((void)v50)
        {
          char v23 = (*(uint64_t (**)(void))(*(void *)v50 + 16LL))(v50);
          uint64_t v24 = v50;
          if ((v23 & 1) != 0) {
            goto LABEL_48;
          }
          if ((void)v50)
          {
            uint64_t v25 = (*(uint64_t (**)(void))(*(void *)v50 + 24LL))();
            uint64_t v24 = v50;
            if (*(_DWORD *)(v25 + 12) == (_DWORD)v11)
            {
              uint64_t v11 = 0xFFFFFFFFLL;
LABEL_48:
              if (v24)
              {
                (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
                goto LABEL_52;
              }

LABEL_54:
              uint64_t v10 = 0LL;
              uint64_t v11 = 0xFFFFFFFFLL;
LABEL_55:
              char v27 = (void **)__p[1];
              __p[1] = 0LL;
              if (v27) {
                sub_10002B7A4((int)&__p[1], v27);
              }
              sub_10002B764((void ***)__p, 0LL);
              int v28 = (void **)v56[1];
              v56[1] = 0LL;
              if (v28) {
                sub_10002B7A4((int)&v56[1], v28);
              }
              int v29 = (void **)v56[0];
              v56[0] = 0LL;
              if (v29) {
                sub_10002B7A4((int)v56, v29);
              }
              if (v58)
              {
                float v59 = v58;
                operator delete(v58);
              }

              if ((_DWORD)v11 != -1)
              {
                uint64_t v47 = v10;
                int v26 = 0;
                goto LABEL_66;
              }

              goto LABEL_65;
            }

            if ((void)v50)
            {
              (*(void (**)(void))(*(void *)v50 + 32LL))();
              continue;
            }

            goto LABEL_43;
          }
        }

        else if (v52 >= (unint64_t)v51)
        {
          goto LABEL_50;
        }

        break;
      }

      if (*(_DWORD *)(*((void *)&v50 + 1) + 16 * v52 + 12) == (_DWORD)v11)
      {
        uint64_t v11 = 0xFFFFFFFFLL;
        goto LABEL_50;
      }

LABEL_43:
      ++v52;
      continue;
    }
  }

  uint64_t v10 = 0LL;
LABEL_65:
  uint64_t v47 = v10;
  uint64_t v11 = (*(uint64_t (**)(uint64_t *))(*a2 + 176))(a2);
  int v26 = 1;
LABEL_66:
  *(void *)&__int128 v50 = 0LL;
  DWORD2(v50) = 0;
  LODWORD(v51) = 0;
  (*(void (**)(uint64_t, __int128 *, __n128))(*(void *)a1 + 112LL))(a1, &v50, v19);
  while (2)
  {
    if (!(void)v50)
    {
      goto LABEL_72;
    }

    if (!(*(unsigned int (**)(void))(*(void *)v50 + 16LL))(v50))
    {
      if ((void)v50)
      {
        uint64_t v30 = (*(uint64_t (**)(void))(*(void *)v50 + 24LL))();
LABEL_73:
        int v31 = v30 + v26;
        if ((_DWORD)v30 == (_DWORD)v9)
        {
          int v49 = *sub_10002AD60();
          (*(void (**)(uint64_t *, void, int *))(*a2 + 160))(a2, (v30 + v26), &v49);
        }

        (*(void (**)(float *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v61, a1, v30);
        int v32 = sub_10002ADB0();
        *(float *)&__int128 v53 = v61;
        LODWORD(v58) = *v32;
        char v33 = v26 ^ 1;
        if ((v33 & 1) == 0)
        {
          *(void *)&__int128 v53 = 0LL;
          *((float *)&v53 + 2) = v61;
          HIDWORD(v53) = v30 + v26;
          (*(void (**)(uint64_t *, void, __int128 *))(*a2 + 184))(a2, 0LL, &v53);
        }

        unint64_t v55 = 0LL;
        __int128 v53 = 0u;
        __int128 v54 = 0u;
        (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v30, &v53);
LABEL_83:
        if ((void)v53)
        {
          if ((*(unsigned int (**)(void))(*(void *)v53 + 16LL))(v53))
          {
            if ((void)v53)
            {
              (*(void (**)(void))(*(void *)v53 + 8LL))();
              goto LABEL_113;
            }

LABEL_111:
            if (*((void *)&v54 + 1)) {
              --**((_DWORD **)&v54 + 1);
            }
LABEL_113:
            if ((void)v50) {
              (*(void (**)(void))(*(void *)v50 + 32LL))(v50);
            }
            else {
              LODWORD(v51) = v51 + 1;
            }
            continue;
          }

          if ((void)v53)
          {
            uint64_t v34 = (*(uint64_t (**)(void))(*(void *)v53 + 24LL))();
LABEL_89:
            uint64_t v35 = (*(_DWORD *)(v34 + 12) + v26);
            float v36 = *(float *)(v34 + 8);
            if ((_DWORD)v35 == (_DWORD)v11) {
              char v37 = v26;
            }
            else {
              char v37 = 1;
            }
            if ((v37 & 1) == 0)
            {
              (*(void (**)(int **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v58, a1, v11);
              if (*(float *)&v58 == -INFINITY || v36 >= -INFINITY && v36 <= -INFINITY)
              {
                LODWORD(v36) = *sub_1000606CC();
              }

              else if (*(float *)&v58 == INFINITY || v36 == INFINITY)
              {
                float v36 = INFINITY;
              }

              else
              {
                float v36 = v36 + *(float *)&v58;
              }
            }

            float v58 = *(int **)v34;
            float v59 = (int *)__PAIR64__(v31, LODWORD(v36));
            while (1)
            {
              int v39 = (*(uint64_t (**)(uint64_t *))(*a2 + 136))(a2);
              uint64_t v40 = *a2;
              (*(void (**)(uint64_t *))(v40 + 176))(a2);
            }

            (*(void (**)(uint64_t *, uint64_t, int **))(v40 + 184))(a2, v35, &v58);
            if ((void)v53) {
              (*(void (**)(void))(*(void *)v53 + 32LL))(v53);
            }
            else {
              ++v55;
            }
            goto LABEL_83;
          }
        }

        else if (v55 >= (unint64_t)v54)
        {
          goto LABEL_111;
        }

        uint64_t v34 = *((void *)&v53 + 1) + 16 * v55;
        goto LABEL_89;
      }

void sub_100084F28( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v11 = *(void **)(v9 - 144);
  if (v11)
  {
    *(void *)(v9 - 136) = v11;
    operator delete(v11);
  }

  _Unwind_Resume(a1);
}

void sub_100085014(uint64_t a1, void *a2, uint64_t a3)
{
  v5[0] = a1;
  v5[1] = a2;
  v5[2] = *(void *)a3;
  int v6 = *(_DWORD *)(a3 + 16);
  char v7 = *(_BYTE *)(a3 + 20);
  char v8 = 0;
  *(_OWORD *)uint64_t v9 = 0u;
  *(_OWORD *)uint64_t v10 = 0u;
  __int128 v11 = 0u;
  *(_OWORD *)char v12 = 0u;
  *(_OWORD *)__p = 0u;
  memset(v14, 0, sizeof(v14));
  a2[1] = *a2;
  sub_10008CE1C(v5, *(_DWORD *)(a3 + 12));
  if (v14[20])
  {
    a2[1] = *a2;
    int v4 = sub_1000606CC();
    sub_100085100((uint64_t)a2, 1uLL, v4);
  }

  if (__p[1])
  {
    *(void **)uint64_t v14 = __p[1];
    operator delete(__p[1]);
  }

  if (v12[0]) {
    operator delete(v12[0]);
  }
  if (v10[1])
  {
    *(void **)&__int128 v11 = v10[1];
    operator delete(v10[1]);
  }

  if (v9[0])
  {
    v9[1] = v9[0];
    operator delete(v9[0]);
  }

void sub_1000850EC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100085100(uint64_t a1, unint64_t a2, _DWORD *a3)
{
  unint64_t v3 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v3)
  {
    if (a2 < v3) {
      *(void *)(a1 + 8) = *(void *)a1 + 4 * a2;
    }
  }

  else
  {
    sub_10008DD80((void **)a1, a2 - v3, a3);
  }

void *sub_100085130(void *a1)
{
  *a1 = off_1000D35A0;
  sub_100017FC4((uint64_t)(a1 + 1));
  return a1;
}

uint64_t sub_100085160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = 7;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2D40;
  *(_OWORD *)(a1 + 16) = 0u;
  int v6 = (uint64_t *)(a1 + 16);
  char v7 = (uint64_t *)(a1 + 24);
  *(_OWORD *)(a1 + 48) = 0u;
  char v8 = (void *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 64) = 0LL;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0x4E00000000LL, 0LL);
  if ((v9 & 0x4000000000LL) != 0 || (*(unsigned int (**)(uint64_t))(*(void *)a2 + 16LL))(a2) == -1)
  {
    char v23 = operator new(0x30uLL);
    v23[2] = 5;
    *((_BYTE *)v23 + 12) = 0;
    *(void *)char v23 = &off_1000D2DB8;
    *((void *)v23 + 2) = 0xFFFFFFFF00000000LL;
    *((void *)v23 + 4) = 0LL;
    *((void *)v23 + 5) = 0LL;
    *((void *)v23 + 3) = 0LL;
    uint64_t v24 = *v6;
    *int v6 = (uint64_t)v23;
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using state-order discipline", 39LL);
      goto LABEL_19;
    }
  }

  else if ((v9 & 0x800000000LL) != 0)
  {
    uint64_t v25 = operator new(0x48uLL);
    sub_100085ED0((uint64_t)v25, a2);
    uint64_t v26 = *v6;
    *int v6 = (uint64_t)v25;
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8LL))(v26);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
      goto LABEL_19;
    }
  }

  else
  {
    if ((v9 & 0x200000000LL) == 0)
    {
      __p[0] = v8;
      __p[1] = 0LL;
      uint64_t v66 = 0LL;
      unint64_t v67 = &v70;
      *(_OWORD *)int v68 = 0u;
      *(_OWORD *)char v69 = 0u;
      sub_10005B86C(a2, (uint64_t *)__p, 0);
      uint64_t v10 = *(int **)(a1 + 48);
      __int128 v11 = *(int **)(a1 + 56);
      if (v10 != v11)
      {
        char v12 = v10 + 1;
        if (v10 + 1 != v11)
        {
          int v13 = *v10;
          uint64_t v14 = v10 + 1;
          do
          {
            int v16 = *v14++;
            int v15 = v16;
            BOOL v17 = v13 < v16;
            if (v13 <= v16) {
              int v13 = v15;
            }
            if (v17) {
              uint64_t v10 = v12;
            }
            char v12 = v14;
          }

          while (v14 != v11);
        }
      }

      int v18 = *v10;
      unint64_t v19 = *v10 + 1;
      sub_10007F734(v64, v19);
      if (a3)
      {
        int v20 = operator new(1uLL);
        unint64_t v21 = operator new(0x10uLL);
        void *v21 = a3;
        v21[1] = v20;
        int v22 = v21;
      }

      else
      {
        int v20 = 0LL;
        int v22 = 0LL;
      }

      sub_100085B7C(a2, v8, (uint64_t)v64, (uint64_t)v20, &v62, &v63);
      if (v63)
      {
        int v29 = operator new(0x40uLL);
        v29[2] = 2;
        *((_BYTE *)v29 + 12) = 0;
        *(void *)int v29 = off_1000D2E88;
        *((_OWORD *)v29 + 1) = 0u;
        *((_OWORD *)v29 + 2) = 0u;
        *((_OWORD *)v29 + 3) = 0u;
        uint64_t v30 = *v6;
        *int v6 = (uint64_t)v29;
        if (v30) {
          (*(void (**)(uint64_t))(*(void *)v30 + 8LL))(v30);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_40:
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_71:
        if (v22) {
          operator delete(v22);
        }
        if (v20) {
          operator delete(v20);
        }
        if (v64[0])
        {
          v64[1] = v64[0];
          operator delete(v64[0]);
        }

        unint64_t v55 = (void **)v69[1];
        v69[1] = 0LL;
        if (v55) {
          sub_10002B7A4((int)&v69[1], v55);
        }
        sub_10002B764((void ***)v69, 0LL);
        BOOL v56 = (void **)v68[1];
        v68[1] = 0LL;
        if (v56) {
          sub_10002B7A4((int)&v68[1], v56);
        }
        uint64_t v57 = (void **)v68[0];
        v68[0] = 0LL;
        if (v57) {
          sub_10002B7A4((int)v68, v57);
        }
        return a1;
      }

      if (v62)
      {
        int v31 = operator new(0x48uLL);
        sub_10007F848((uint64_t)v31, (uint64_t)v8);
        uint64_t v32 = *v6;
        *int v6 = (uint64_t)v31;
        if (v32) {
          (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
        goto LABEL_40;
      }

      if (dword_1000DE7E8 >= 2)
      {
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using SCC meta-discipline", 36LL);
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
      }

      sub_100069658((uint64_t)v7, v19);
      if (v18 < 0)
      {
LABEL_69:
        __int128 v53 = operator new(0x40uLL);
        _OWORD v53[2] = 6;
        *((_BYTE *)v53 + 12) = 0;
        *(void *)__int128 v53 = &off_1000D2FC0;
        *((void *)v53 + 2) = v7;
        *((void *)v53 + 3) = v8;
        *((void *)v53 + 4) = 0xFFFFFFFF00000000LL;
        *((void *)v53 + 6) = 0LL;
        *((void *)v53 + 7) = 0LL;
        *((void *)v53 + 5) = 0LL;
        uint64_t v54 = *v6;
        *int v6 = (uint64_t)v53;
        if (v54) {
          (*(void (**)(uint64_t))(*(void *)v54 + 8LL))(v54);
        }
        goto LABEL_71;
      }

      uint64_t v33 = 0LL;
      while (1)
      {
        int v34 = *((_DWORD *)v64[0] + v33);
        if (v34 == 3)
        {
          uint64_t v38 = *v7;
          int v39 = (char *)operator new(0x88uLL);
          *((_DWORD *)v39 + 2) = 3;
          v39[12] = 0;
          *(void *)int v39 = off_1000D2EF0;
          *((_OWORD *)v39 + 1) = *v22;
          *((_OWORD *)v39 + 2) = 0u;
          *((_OWORD *)v39 + 3) = 0u;
          *((_OWORD *)v39 + 4) = 0u;
          *((_OWORD *)v39 + 5) = 0u;
          *(_OWORD *)(v39 + 92) = 0u;
          *((void *)v39 + 15) = 0LL;
          *((void *)v39 + 16) = 0LL;
          *((void *)v39 + 14) = 0LL;
          uint64_t v40 = *(void *)(v38 + 8 * v33);
          *(void *)(v38 + 8 * v33) = v39;
          if (v40) {
            (*(void (**)(uint64_t))(*(void *)v40 + 8LL))(v40);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          char v41 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v42 = (void *)std::ostream::operator<<(v41, v33);
          sub_10002A6A4(v42, (uint64_t)": using shortest-first discipline", 33LL);
        }

        else if (v34 == 2)
        {
          uint64_t v43 = *v7;
          uint64_t v44 = operator new(0x40uLL);
          v44[2] = 2;
          *((_BYTE *)v44 + 12) = 0;
          *(void *)uint64_t v44 = off_1000D2E88;
          *((_OWORD *)v44 + 1) = 0u;
          *((_OWORD *)v44 + 2) = 0u;
          *((_OWORD *)v44 + 3) = 0u;
          uint64_t v45 = *(void *)(v43 + 8 * v33);
          *(void *)(v43 + 8 * v33) = v44;
          if (v45) {
            (*(void (**)(uint64_t))(*(void *)v45 + 8LL))(v45);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          float v46 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v47 = (void *)std::ostream::operator<<(v46, v33);
          sub_10002A6A4(v47, (uint64_t)": using LIFO discipline", 23LL);
        }

        else if (v34)
        {
          uint64_t v48 = *v7;
          int v49 = operator new(0x40uLL);
          v49[2] = 1;
          *((_BYTE *)v49 + 12) = 0;
          *(void *)int v49 = off_1000D2F58;
          *((_OWORD *)v49 + 1) = 0u;
          *((_OWORD *)v49 + 2) = 0u;
          *((_OWORD *)v49 + 3) = 0u;
          uint64_t v50 = *(void *)(v48 + 8 * v33);
          *(void *)(v48 + 8 * v33) = v49;
          if (v50) {
            (*(void (**)(uint64_t))(*(void *)v50 + 8LL))(v50);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          __int128 v51 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          unint64_t v52 = (void *)std::ostream::operator<<(v51, v33);
          sub_10002A6A4(v52, (uint64_t)": using FIFO discipine", 22LL);
        }

        else
        {
          uint64_t v35 = *(void *)(*v7 + 8 * v33);
          *(void *)(*v7 + 8 * v33) = 0LL;
          if (v35) {
            (*(void (**)(uint64_t))(*(void *)v35 + 8LL))(v35);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          float v36 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          char v37 = (void *)std::ostream::operator<<(v36, v33);
          sub_10002A6A4(v37, (uint64_t)": using trivial discipline", 26LL);
        }

        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_68:
      }
    }

    char v27 = operator new(0x40uLL);
    v27[2] = 2;
    *((_BYTE *)v27 + 12) = 0;
    *(void *)char v27 = off_1000D2E88;
    *((_OWORD *)v27 + 1) = 0u;
    *((_OWORD *)v27 + 2) = 0u;
    *((_OWORD *)v27 + 3) = 0u;
    uint64_t v28 = *v6;
    *int v6 = (uint64_t)v27;
    if (v28) {
      (*(void (**)(uint64_t))(*(void *)v28 + 8LL))(v28);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_19:
      sub_10002AA94(v64);
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
    }
  }

  return a1;
}

void sub_1000859E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, char a16, char a17, void *a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if (v28)
    {
LABEL_10:
      operator delete(v28);
      if (!v29)
      {
LABEL_7:
        if (a18)
        {
          a19 = (uint64_t)a18;
          operator delete(a18);
        }

        sub_10002ACFC((void ***)&a21);
        uint64_t v32 = *v27;
        if (*v27)
        {
          *(void *)(v26 + 56) = v32;
          operator delete(v32);
        }

        sub_10006C65C((void ***)&a21);
        uint64_t v33 = *v30;
        *uint64_t v30 = 0LL;
        if (v33) {
          (*(void (**)(uint64_t))(*(void *)v33 + 8LL))(v33);
        }
        _Unwind_Resume(a1);
      }

uint64_t sub_100085B7C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5, _BYTE *a6)
{
  *a5 = 1;
  *a6 = 1;
  uint64_t v11 = *(void *)(a3 + 8) - *(void *)a3;
  if (v11)
  {
    unint64_t v12 = v11 >> 2;
    if (v12 <= 1) {
      unint64_t v12 = 1LL;
    }
    bzero(*(void **)a3, 4 * v12);
  }

  uint64_t v32 = 0LL;
  int v33 = 0;
  unsigned int v34 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v32);
  while (1)
  {
    uint64_t result = v32;
    if (!v32)
    {
LABEL_11:
      uint64_t v15 = v34;
      goto LABEL_12;
    }

    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 16LL))(v32);
    uint64_t result = v32;
    if (v14) {
      break;
    }
    if (!v32) {
      goto LABEL_11;
    }
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v32 + 24LL))();
LABEL_12:
    unint64_t v31 = 0LL;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v15, &v29);
    uint64_t v16 = (int)v15;
    while (1)
    {
      if (!(void)v29)
      {
        goto LABEL_18;
      }

      if ((void)v29)
      {
        uint64_t v17 = (*(uint64_t (**)(void))(*(void *)v29 + 24LL))();
        goto LABEL_19;
      }

void sub_100085E6C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17) {
    (*(void (**)(uint64_t))(*(void *)a17 + 8LL))(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100085ED0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 4;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2E20;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  *(_OWORD *)(a1 + 24) = 0u;
  uint64_t v3 = a1 + 48;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  v9[0] = a1 + 24;
  v9[1] = &v11;
  uint64_t v10 = 0LL;
  sub_100086098(a2, (uint64_t)v9, 0);
  if (!v11)
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v8, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"TopOrderQueue: FST is not acyclic", 33LL);
    sub_10002AA94(&v8);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    *(_BYTE *)(a1 + 12) = 1;
  }

  sub_10007EBF4(v3, (uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 2, &dword_1000AF5EC);
  int v4 = (void **)v10;
  uint64_t v10 = 0LL;
  if (v4) {
    sub_10002B7A4((int)&v10, v4);
  }
  return a1;
}

void sub_100086024( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20, void **a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21) {
    sub_10002B7A4(v23, a21);
  }
  uint64_t v26 = *v22;
  if (*v22)
  {
    *(void *)(v21 + 56) = v26;
    operator delete(v26);
  }

  char v27 = *v24;
  if (*v24)
  {
    *(void *)(v21 + 32) = v27;
    operator delete(v27);
  }

  _Unwind_Resume(exception_object);
}

void sub_100086098(uint64_t a1, uint64_t a2, char a3)
{
  int v47 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v47 == -1)
  {
    sub_10007ED84((char ***)a2);
    return;
  }

  float v58 = 0LL;
  float v59 = 0LL;
  char v60 = 0LL;
  __int128 v57 = 0u;
  memset(v56, 0, sizeof(v56));
  sub_10002B8A4(v53, 64LL);
  unint64_t v55 = 0LL;
  unint64_t v52 = off_1000D0B78;
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v46) {
    uint64_t v6 = sub_10005BFFC(a1);
  }
  else {
    uint64_t v6 = (v47 + 1);
  }
  if ((int)v6 <= (unint64_t)(v59 - v58))
  {
  }

  else
  {
    sub_10002BA28(&v58, (int)v6 - (v59 - v58), &unk_1000AF733);
  }

  uint64_t v49 = 0LL;
  int v50 = 0;
  int v51 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v49);
  uint64_t v7 = v47;
  char v45 = a3;
  do
  {
    v58[(int)v7] = 1;
    BOOL v8 = v55;
    if (v55)
    {
      unint64_t v55 = (char *)*((void *)v55 + 6);
    }

    else
    {
      BOOL v8 = sub_10002BED8(v53, 1LL);
      *((void *)v8 + 6) = 0LL;
    }

    *(_DWORD *)BOOL v8 = v7;
    *(_OWORD *)(v8 + 24) = 0u;
    *((void *)v8 + 5) = 0LL;
    *(_OWORD *)(v8 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v7, v8 + 8);
    uint64_t v48 = v8;
    sub_10002BB40(v56, &v48);
    uint64_t v9 = *((void *)&v57 + 1);
    if (!*((void *)&v57 + 1))
    {
      char v10 = 1;
      if ((a3 & 1) != 0) {
        break;
      }
      goto LABEL_62;
    }

    char v10 = 1;
    do
    {
      char v11 = *(char **)(*(void *)(*((void *)&v56[0] + 1)
      unint64_t v12 = *(int *)v11;
      unint64_t v13 = v59 - v58;
      if (v59 - v58 <= v12)
      {
        uint64_t v6 = (v12 + 1);
        if ((int)v6 <= v13)
        {
        }

        else
        {
          sub_10002BA28(&v58, (int)v6 - v13, &unk_1000AF733);
        }
      }

      if ((v10 & 1) != 0)
      {
        uint64_t v14 = *((void *)v11 + 1);
        if (v14)
        {
          if (!(*(unsigned int (**)(uint64_t))(*(void *)v14 + 16LL))(v14))
          {
            uint64_t v15 = *((void *)v11 + 1);
            if (v15) {
              uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 24LL))(v15);
            }
            else {
LABEL_28:
            }
              uint64_t v16 = *((void *)v11 + 2) + 16LL * *((void *)v11 + 5);
            unint64_t v17 = *(int *)(v16 + 12);
            uint64_t v18 = v58;
            unint64_t v19 = v59 - v58;
            if (v59 - v58 <= v17)
            {
              uint64_t v6 = (v17 + 1);
              if ((int)v6 <= v19)
              {
              }

              else
              {
                sub_10002BA28(&v58, (int)v6 - v19, &unk_1000AF733);
                unint64_t v17 = *(int *)(v16 + 12);
                uint64_t v18 = v58;
              }
            }

            int v25 = v18[v17];
            if (v25 == 1)
            {
              **(_BYTE **)(a2 + 8) = 0;
              uint64_t v27 = *((void *)v11 + 1);
              if (v27)
              {
                (*(void (**)(uint64_t))(*(void *)v27 + 32LL))(v27);
                char v10 = 0;
              }

              else
              {
                char v10 = 0;
                ++*((void *)v11 + 5);
              }
            }

            else
            {
              if (v25 == 2)
              {
                uint64_t v26 = *((void *)v11 + 1);
                if (v26) {
                  (*(void (**)(uint64_t))(*(void *)v26 + 32LL))(v26);
                }
                else {
                  ++*((void *)v11 + 5);
                }
              }

              else
              {
                v18[v17] = 1;
                uint64_t v28 = v55;
                if (v55)
                {
                  unint64_t v55 = (char *)*((void *)v55 + 6);
                }

                else
                {
                  uint64_t v28 = sub_10002BED8(v53, 1LL);
                  *((void *)v28 + 6) = 0LL;
                }

                *(_DWORD *)uint64_t v28 = *(_DWORD *)(v16 + 12);
                *(_OWORD *)(v28 + 24) = 0u;
                *((void *)v28 + 5) = 0LL;
                *(_OWORD *)(v28 + 8) = 0u;
                (*(void (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
                uint64_t v48 = v28;
                sub_10002BB40(v56, &v48);
              }

              char v10 = 1;
            }

            goto LABEL_58;
          }
        }

        else if (*((void *)v11 + 5) < *((void *)v11 + 3))
        {
          goto LABEL_28;
        }
      }

      v58[v12] = 2;
      uint64_t v20 = *((void *)v11 + 1);
      if (v20)
      {
        (*(void (**)(uint64_t))(*(void *)v20 + 8LL))(v20);
      }

      else
      {
        uint64_t v21 = (_DWORD *)*((void *)v11 + 4);
        if (v21) {
          --*v21;
        }
      }

      *((void *)v11 + 6) = v55;
      unint64_t v55 = v11;
      --*((void *)&v57 + 1);
      sub_10002C2E0(v56, 1);
      if (*((void *)&v57 + 1))
      {
        uint64_t v22 = *(void *)(*(void *)(*((void *)&v56[0] + 1)
        uint64_t v23 = *(void *)(v22 + 8);
        if (v23) {
          (*(void (**)(uint64_t))(*(void *)v23 + 24LL))(v23);
        }
        sub_10007EF2C(a2, v12);
        uint64_t v24 = *(void *)(v22 + 8);
        if (v24) {
          (*(void (**)(uint64_t))(*(void *)v24 + 32LL))(v24);
        }
        else {
          ++*(void *)(v22 + 40);
        }
      }

      else
      {
        sub_10007EF2C(a2, v12);
      }

void sub_100086788( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10008681C(void *a1, int a2)
{
  if ((*(unsigned int (**)(void))(*(void *)*a1 + 16LL))(*a1) == -1)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*a1 + 56LL))(*a1, 4LL, 0LL);
    if (!result) {
      return result;
    }
    v181 = (char *)a1 + 140;
    goto LABEL_269;
  }

  (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 56LL))(*(void *)(a1[2] + 16LL));
  if (!*((_BYTE *)a1 + 33))
  {
    *(void *)(a1[1] + 8LL) = *(void *)a1[1];
    a1[6] = a1[5];
    a1[9] = a1[8];
    a1[12] = 0LL;
  }

  if (a2 == -1) {
    a2 = (*(uint64_t (**)(void))(*(void *)*a1 + 16LL))(*a1);
  }
  unint64_t v4 = a2;
  uint64_t v5 = a1[1];
  uint64_t v6 = (int **)(v5 + 8);
  if (a2 >= (unint64_t)((uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2))
  {
    v185 = (void **)(a1 + 5);
    uint64_t v7 = (void **)(a1 + 8);
    do
    {
      BOOL v8 = sub_10002ADB0();
      uint64_t v9 = v8;
      unint64_t v10 = *(void *)(v5 + 16);
      char v11 = *(int **)(v5 + 8);
      if ((unint64_t)v11 >= v10)
      {
        uint64_t v13 = *(int **)v5;
        uint64_t v14 = ((uint64_t)v11 - *(void *)v5) >> 2;
        unint64_t v15 = v14 + 1;
        uint64_t v16 = v10 - (void)v13;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          uint64_t v18 = (char *)sub_10002C050(v5 + 16, v17);
          char v11 = *v6;
          uint64_t v13 = *(int **)v5;
        }

        else
        {
          uint64_t v18 = 0LL;
        }

        uint64_t v19 = (int *)&v18[4 * v14];
        *uint64_t v19 = *v9;
        unint64_t v12 = v19 + 1;
        while (v11 != v13)
        {
          int v20 = *--v11;
          *--uint64_t v19 = v20;
        }

        *(void *)uint64_t v5 = v19;
        *uint64_t v6 = v12;
        *(void *)(v5 + 16) = &v18[4 * v17];
        if (v13) {
          operator delete(v13);
        }
      }

      else
      {
        *char v11 = *v8;
        unint64_t v12 = v11 + 1;
      }

      *uint64_t v6 = v12;
      int v21 = *sub_10002ADB0();
      uint64_t v23 = (int *)a1[6];
      unint64_t v22 = a1[7];
      if ((unint64_t)v23 >= v22)
      {
        int v25 = (int *)*v185;
        uint64_t v26 = ((char *)v23 - (_BYTE *)*v185) >> 2;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62) {
LABEL_275:
        }
          sub_100018774();
        uint64_t v28 = v22 - (void)v25;
        if (v28 >> 1 > v27) {
          unint64_t v27 = v28 >> 1;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          uint64_t v30 = (char *)sub_10002C050((uint64_t)(a1 + 7), v29);
          int v25 = (int *)a1[5];
          uint64_t v23 = (int *)a1[6];
        }

        else
        {
          uint64_t v30 = 0LL;
        }

        unint64_t v31 = (int *)&v30[4 * v26];
        int *v31 = v21;
        uint64_t v24 = v31 + 1;
        while (v23 != v25)
        {
          int v32 = *--v23;
          *--unint64_t v31 = v32;
        }

        a1[5] = v31;
        a1[6] = v24;
        a1[7] = &v30[4 * v29];
        if (v25) {
          operator delete(v25);
        }
      }

      else
      {
        int *v23 = v21;
        uint64_t v24 = v23 + 1;
      }

      a1[6] = v24;
      int v33 = *sub_10002ADB0();
      unint64_t v35 = (int *)a1[9];
      unint64_t v34 = a1[10];
      if ((unint64_t)v35 >= v34)
      {
        uint64_t v37 = (int *)*v7;
        uint64_t v38 = ((char *)v35 - (_BYTE *)*v7) >> 2;
        unint64_t v39 = v38 + 1;
        uint64_t v40 = v34 - (void)v37;
        if (v40 >> 1 > v39) {
          unint64_t v39 = v40 >> 1;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          uint64_t v42 = (char *)sub_10002C050((uint64_t)(a1 + 10), v41);
          uint64_t v37 = (int *)a1[8];
          unint64_t v35 = (int *)a1[9];
        }

        else
        {
          uint64_t v42 = 0LL;
        }

        uint64_t v43 = (int *)&v42[4 * v38];
        int *v43 = v33;
        uint64_t v36 = v43 + 1;
        while (v35 != v37)
        {
          int v44 = *--v35;
          *--uint64_t v43 = v44;
        }

        a1[8] = v43;
        a1[9] = v36;
        a1[10] = &v42[4 * v41];
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        int *v35 = v33;
        uint64_t v36 = v35 + 1;
      }

      a1[9] = v36;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
      uint64_t v5 = a1[1];
      uint64_t v6 = (int **)(v5 + 8);
    }

    while (v4 >= (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
  }

  if (*((_BYTE *)a1 + 33))
  {
    char v45 = (char *)a1[14];
    uint64_t v46 = (char *)a1[15];
    unint64_t v47 = (v46 - v45) >> 2;
    if (v47 <= v4)
    {
      uint64_t v48 = a1 + 16;
      do
      {
        if ((unint64_t)v46 >= *v48)
        {
          unint64_t v50 = v47 + 1;
          if ((v47 + 1) >> 62) {
            sub_100018774();
          }
          uint64_t v51 = *v48 - (void)v45;
          if (v51 >> 1 > v50) {
            unint64_t v50 = v51 >> 1;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52)
          {
            __int128 v53 = (char *)sub_10002C050((uint64_t)(a1 + 16), v52);
            char v45 = (char *)a1[14];
            uint64_t v46 = (char *)a1[15];
          }

          else
          {
            __int128 v53 = 0LL;
          }

          uint64_t v54 = &v53[4 * v47];
          *(_DWORD *)uint64_t v54 = -1;
          uint64_t v49 = v54 + 4;
          while (v46 != v45)
          {
            int v55 = *((_DWORD *)v46 - 1);
            v46 -= 4;
            *((_DWORD *)v54 - 1) = v55;
            v54 -= 4;
          }

          a1[14] = v54;
          a1[15] = v49;
          a1[16] = &v53[4 * v52];
          if (v45)
          {
            operator delete(v45);
            char v45 = (char *)a1[14];
          }

          else
          {
            char v45 = v54;
          }
        }

        else
        {
          *(_DWORD *)uint64_t v46 = -1;
          uint64_t v49 = v46 + 4;
        }

        a1[15] = v49;
        unint64_t v47 = (v49 - v45) >> 2;
        uint64_t v46 = v49;
      }

      while (v47 <= v4);
    }

    *(_DWORD *)&v45[4 * v4] = *((_DWORD *)a1 + 34);
  }

  *(_DWORD *)(*(void *)a1[1] + 4 * v4) = *sub_10002AD60();
  uint64_t v56 = a1[5];
  v184 = (void **)(a1 + 5);
  *(_DWORD *)(v56 + 4 * v4) = *sub_10002AD60();
  uint64_t v57 = a1[8];
  v186 = (void **)(a1 + 8);
  *(_DWORD *)(v57 + 4 * v4) = *sub_10002AD60();
  *(void *)(a1[11] + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v4;
  (*(void (**)(void, unint64_t))(**(void **)(a1[2] + 16LL) + 24LL))(*(void *)(a1[2] + 16LL), v4);
  uint64_t v182 = (uint64_t)(a1 + 10);
  uint64_t v183 = (uint64_t)(a1 + 7);
  float v58 = a1 + 16;
  v181 = (char *)a1 + 140;
  do
  {
    int v60 = (*(uint64_t (**)(void))(**(void **)(a1[2] + 16LL) + 16LL))(*(void *)(a1[2] + 16LL));
    (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 32LL))(*(void *)(a1[2] + 16LL));
    unint64_t v61 = v60;
    while (1)
    {
      char v62 = (int **)a1[1];
      char v63 = v62 + 1;
      if (v61 < v62[1] - *v62) {
        break;
      }
      int v64 = sub_10002ADB0();
      unint64_t v65 = v64;
      unint64_t v66 = (unint64_t)v62[2];
      unint64_t v67 = v62[1];
      if ((unint64_t)v67 >= v66)
      {
        char v69 = *v62;
        uint64_t v70 = v67 - *v62;
        unint64_t v71 = v70 + 1;
        uint64_t v72 = v66 - (void)v69;
        if (v72 >> 1 > v71) {
          unint64_t v71 = v72 >> 1;
        }
        else {
          unint64_t v73 = v71;
        }
        if (v73)
        {
          __int128 v74 = (char *)sub_10002C050((uint64_t)(v62 + 2), v73);
          unint64_t v67 = *v63;
          char v69 = *v62;
        }

        else
        {
          __int128 v74 = 0LL;
        }

        __int128 v75 = (int *)&v74[4 * v70];
        *__int128 v75 = *v65;
        int v68 = v75 + 1;
        while (v67 != v69)
        {
          int v76 = *--v67;
          *--__int128 v75 = v76;
        }

        *char v62 = v75;
        int *v63 = v68;
        v62[2] = (int *)&v74[4 * v73];
        if (v69) {
          operator delete(v69);
        }
      }

      else
      {
        *unint64_t v67 = *v64;
        int v68 = v67 + 1;
      }

      int *v63 = v68;
      int v77 = *sub_10002ADB0();
      uint64_t v79 = (int *)a1[6];
      unint64_t v78 = a1[7];
      if ((unint64_t)v79 >= v78)
      {
        int v81 = (int *)*v184;
        uint64_t v82 = ((char *)v79 - (_BYTE *)*v184) >> 2;
        unint64_t v83 = v82 + 1;
        uint64_t v84 = v78 - (void)v81;
        if (v84 >> 1 > v83) {
          unint64_t v83 = v84 >> 1;
        }
        else {
          unint64_t v85 = v83;
        }
        if (v85)
        {
          char v86 = (char *)sub_10002C050(v183, v85);
          int v81 = (int *)a1[5];
          uint64_t v79 = (int *)a1[6];
        }

        else
        {
          char v86 = 0LL;
        }

        int v87 = (int *)&v86[4 * v82];
        *int v87 = v77;
        float v80 = v87 + 1;
        while (v79 != v81)
        {
          int v88 = *--v79;
          *--int v87 = v88;
        }

        a1[5] = v87;
        a1[6] = v80;
        a1[7] = &v86[4 * v85];
        if (v81) {
          operator delete(v81);
        }
      }

      else
      {
        *uint64_t v79 = v77;
        float v80 = v79 + 1;
      }

      a1[6] = v80;
      int v89 = *sub_10002ADB0();
      v91 = (int *)a1[9];
      unint64_t v90 = a1[10];
      if ((unint64_t)v91 >= v90)
      {
        char v93 = (int *)*v186;
        uint64_t v94 = ((char *)v91 - (_BYTE *)*v186) >> 2;
        unint64_t v95 = v94 + 1;
        uint64_t v96 = v90 - (void)v93;
        if (v96 >> 1 > v95) {
          unint64_t v95 = v96 >> 1;
        }
        else {
          unint64_t v97 = v95;
        }
        if (v97)
        {
          v98 = (char *)sub_10002C050(v182, v97);
          char v93 = (int *)a1[8];
          v91 = (int *)a1[9];
        }

        else
        {
          v98 = 0LL;
        }

        v99 = (int *)&v98[4 * v94];
        int *v99 = v89;
        unint64_t v92 = v99 + 1;
        while (v91 != v93)
        {
          int v100 = *--v91;
          *--v99 = v100;
        }

        a1[8] = v99;
        a1[9] = v92;
        a1[10] = &v98[4 * v97];
        if (v93) {
          operator delete(v93);
        }
      }

      else
      {
        int *v91 = v89;
        unint64_t v92 = v91 + 1;
      }

      a1[9] = v92;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
    }

    if (*((_BYTE *)a1 + 32))
    {
      (*(void (**)(uint64_t *__return_ptr, void, unint64_t))(*(void *)*a1 + 24LL))(&v190, *a1, v61);
      int v101 = sub_10002ADB0();
      LODWORD(v187) = v190;
      HIDWORD(v190) = *v101;
      v59.n128_u32[0] = v190;
      if (*(float *)&v190 != *((float *)&v190 + 1))
      {
LABEL_265:
        ++*((_DWORD *)a1 + 34);
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void, __n128))(*(void *)*a1 + 56LL))( *a1,  4LL,  0LL,  v59);
        if (!result) {
          return result;
        }
LABEL_269:
        _BYTE *v181 = 1;
        return result;
      }
    }

    *(void *)(a1[11] + ((v61 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v61);
    uint64_t v102 = a1[8];
    float v103 = *(float *)(v102 + 4 * v61);
    *(_DWORD *)(v102 + 4 * v61) = *sub_10002ADB0();
    uint64_t v104 = *a1;
    __int128 v187 = 0u;
    __int128 v188 = 0u;
    unint64_t v189 = 0LL;
    (*(void (**)(uint64_t, unint64_t, __int128 *))(*(void *)v104 + 120LL))(v104, v61, &v187);
    while (1)
    {
      if ((void)v187)
      {
        if ((void)v187)
        {
          uint64_t v105 = (*(uint64_t (**)(void))(*(void *)v187 + 24LL))(v187);
          goto LABEL_141;
        }
      }

      else if (v189 >= (unint64_t)v188)
      {
LABEL_257:
        char v179 = 1;
        goto LABEL_259;
      }

      uint64_t v105 = *((void *)&v187 + 1) + 16 * v189;
LABEL_141:
      uint64_t v106 = a1[1];
      v107 = (int **)(v106 + 8);
      for (unint64_t i = *(int *)(v105 + 12); i >= (uint64_t)(*(void *)(v106 + 8) - *(void *)v106) >> 2; unint64_t i = *(int *)(v105 + 12))
      {
        v109 = sub_10002ADB0();
        v110 = v109;
        v111 = *v107;
        unint64_t v112 = *(void *)(v106 + 16);
        if ((unint64_t)*v107 >= v112)
        {
          v114 = *(int **)v106;
          uint64_t v115 = ((uint64_t)v111 - *(void *)v106) >> 2;
          unint64_t v116 = v115 + 1;
          uint64_t v117 = v112 - (void)v114;
          if (v117 >> 1 > v116) {
            unint64_t v116 = v117 >> 1;
          }
          else {
            unint64_t v118 = v116;
          }
          if (v118)
          {
            v119 = (char *)sub_10002C050(v106 + 16, v118);
            v111 = *v107;
            v114 = *(int **)v106;
          }

          else
          {
            v119 = 0LL;
          }

          v120 = (int *)&v119[4 * v115];
          int *v120 = *v110;
          v113 = v120 + 1;
          while (v111 != v114)
          {
            int v121 = *--v111;
            *--v120 = v121;
          }

          *(void *)uint64_t v106 = v120;
          *v107 = v113;
          *(void *)(v106 + 16) = &v119[4 * v118];
          if (v114) {
            operator delete(v114);
          }
        }

        else
        {
          int *v111 = *v109;
          v113 = v111 + 1;
        }

        *v107 = v113;
        int v122 = *sub_10002ADB0();
        v124 = (int *)a1[6];
        unint64_t v123 = a1[7];
        if ((unint64_t)v124 >= v123)
        {
          v126 = (int *)*v184;
          uint64_t v127 = ((char *)v124 - (_BYTE *)*v184) >> 2;
          unint64_t v128 = v127 + 1;
          uint64_t v129 = v123 - (void)v126;
          if (v129 >> 1 > v128) {
            unint64_t v128 = v129 >> 1;
          }
          else {
            unint64_t v130 = v128;
          }
          if (v130)
          {
            v131 = (char *)sub_10002C050(v183, v130);
            v126 = (int *)a1[5];
            v124 = (int *)a1[6];
          }

          else
          {
            v131 = 0LL;
          }

          v132 = (int *)&v131[4 * v127];
          int *v132 = v122;
          v125 = v132 + 1;
          while (v124 != v126)
          {
            int v133 = *--v124;
            *--v132 = v133;
          }

          a1[5] = v132;
          a1[6] = v125;
          a1[7] = &v131[4 * v130];
          if (v126) {
            operator delete(v126);
          }
        }

        else
        {
          int *v124 = v122;
          v125 = v124 + 1;
        }

        a1[6] = v125;
        int v134 = *sub_10002ADB0();
        v136 = (int *)a1[9];
        unint64_t v135 = a1[10];
        if ((unint64_t)v136 >= v135)
        {
          v138 = (int *)*v186;
          uint64_t v139 = ((char *)v136 - (_BYTE *)*v186) >> 2;
          unint64_t v140 = v139 + 1;
          uint64_t v141 = v135 - (void)v138;
          if (v141 >> 1 > v140) {
            unint64_t v140 = v141 >> 1;
          }
          else {
            unint64_t v142 = v140;
          }
          if (v142)
          {
            v143 = (char *)sub_10002C050(v182, v142);
            v138 = (int *)a1[8];
            v136 = (int *)a1[9];
          }

          else
          {
            v143 = 0LL;
          }

          v144 = (int *)&v143[4 * v139];
          int *v144 = v134;
          v137 = v144 + 1;
          while (v136 != v138)
          {
            int v145 = *--v136;
            *--v144 = v145;
          }

          a1[8] = v144;
          a1[9] = v137;
          a1[10] = &v143[4 * v142];
          if (v138) {
            operator delete(v138);
          }
        }

        else
        {
          int *v136 = v134;
          v137 = v136 + 1;
        }

        a1[9] = v137;
        BYTE4(v190) = 0;
        sub_10002BFAC((uint64_t)(a1 + 11), (_BYTE *)&v190 + 4);
        uint64_t v106 = a1[1];
        v107 = (int **)(v106 + 8);
      }

      if (*((_BYTE *)a1 + 33))
      {
        v146 = (char *)a1[14];
        v147 = (char *)a1[15];
        unint64_t v148 = (v147 - v146) >> 2;
        if (v148 <= (int)i)
        {
          do
          {
            if ((unint64_t)v147 >= *v58)
            {
              unint64_t v151 = v148 + 1;
              if ((v148 + 1) >> 62) {
                sub_100018774();
              }
              uint64_t v152 = *v58 - (void)v146;
              if (v152 >> 1 > v151) {
                unint64_t v151 = v152 >> 1;
              }
              else {
                unint64_t v153 = v151;
              }
              if (v153)
              {
                v154 = (char *)sub_10002C050((uint64_t)(a1 + 16), v153);
                v146 = (char *)a1[14];
                v147 = (char *)a1[15];
              }

              else
              {
                v154 = 0LL;
              }

              v155 = &v154[4 * v148];
              *(_DWORD *)v155 = -1;
              v150 = v155 + 4;
              while (v147 != v146)
              {
                int v156 = *((_DWORD *)v147 - 1);
                v147 -= 4;
                *((_DWORD *)v155 - 1) = v156;
                v155 -= 4;
              }

              a1[14] = v155;
              a1[15] = v150;
              a1[16] = &v154[4 * v153];
              if (v146)
              {
                operator delete(v146);
                v146 = (char *)a1[14];
              }

              else
              {
                v146 = v155;
              }
            }

            else
            {
              *(_DWORD *)v147 = -1;
              v150 = v147 + 4;
            }

            a1[15] = v150;
            unint64_t v148 = (v150 - v146) >> 2;
            int v157 = *(_DWORD *)(v105 + 12);
            v147 = v150;
          }

          while (v148 <= v157);
          uint64_t v149 = v157;
          LODWORD(i) = *(_DWORD *)(v105 + 12);
        }

        else
        {
          uint64_t v149 = (int)i;
        }

        if (*(_DWORD *)&v146[4 * v149] != *((_DWORD *)a1 + 34))
        {
          v158 = sub_10002ADB0();
          uint64_t v159 = *(int *)(v105 + 12);
          *(_DWORD *)(*(void *)a1[1] + 4 * v159) = *v158;
          uint64_t v160 = a1[5];
          *(_DWORD *)(v160 + 4 * v159) = *sub_10002ADB0();
          uint64_t v161 = *(int *)(v105 + 12);
          unint64_t i = (unint64_t)*v186;
          *(_DWORD *)(i + 4 * v161) = *sub_10002ADB0();
          unint64_t v162 = *(int *)(v105 + 12);
          *(void *)(a1[11] + ((v162 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v162);
          *(_DWORD *)(a1[14] + 4 * v162) = *((_DWORD *)a1 + 34);
          LODWORD(i) = *(_DWORD *)(v105 + 12);
        }
      }

      uint64_t v163 = *(void *)a1[1];
      uint64_t v164 = a1[5];
      uint64_t v165 = a1[8];
      if (v103 == -INFINITY || (float v166 = *(float *)(v105 + 8), v166 >= -INFINITY) && v166 <= -INFINITY)
      {
        float v167 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v168 = v166 == INFINITY || v103 == INFINITY;
        float v169 = v103 + v166;
        float v167 = v168 ? INFINITY : v169;
      }

      float v170 = *(float *)(v163 + 4LL * (int)i);
      if (v170 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
      {
        float v171 = *(float *)sub_1000606CC();
        float v170 = *(float *)(v163 + 4LL * (int)i);
      }

      else
      {
        float v171 = v170 >= v167 ? v167 : *(float *)(v163 + 4LL * (int)i);
      }

      float v172 = *((float *)a1 + 7);
      float v173 = v171 + v172;
      float v174 = v172 + v170;
      if (v170 > v173 || v171 > v174) {
        break;
      }
LABEL_254:
      if ((void)v187) {
        (*(void (**)(void))(*(void *)v187 + 32LL))(v187);
      }
      else {
        ++v189;
      }
    }

    float v176 = *(float *)(v164 + 4LL * (int)i);
    if (v176 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v176 = *(float *)sub_1000606CC();
    }

    else if (v176 >= v167)
    {
      float v176 = v167;
    }

    *(float *)(v164 + 4LL * (int)i) = v176;
    *(float *)(v163 + 4LL * (int)i) = v176;
    float v177 = *(float *)(v165 + 4LL * (int)i);
    if (v177 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v177 = *(float *)sub_1000606CC();
    }

    else if (v177 >= v167)
    {
      float v177 = v167;
    }

    *(float *)(v165 + 4LL * (int)i) = v177;
    if (*(float *)(v163 + 4LL * (int)i) != -INFINITY && v177 != -INFINITY)
    {
      uint64_t v178 = **(void **)(a1[2] + 16LL);
      if (((*(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> *(_DWORD *)(v105 + 12)) & 1) != 0)
      {
        (*(void (**)(void))(v178 + 40))();
      }

      else
      {
        (*(void (**)(void))(v178 + 24))();
        *(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << *(_DWORD *)(v105 + 12);
      }

      goto LABEL_254;
    }

    char v179 = 0;
    _BYTE *v181 = 1;
LABEL_259:
    uint64_t result = v187;
    if ((void)v187)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)v187 + 8LL))(v187);
    }

    else if (*((void *)&v188 + 1))
    {
      --**((_DWORD **)&v188 + 1);
    }
  }

  while ((v179 & 1) != 0);
  return result;
}

void sub_100087714( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  if (a15)
  {
    (*(void (**)(uint64_t))(*(void *)a15 + 8LL))(a15);
  }

  else if (a18)
  {
    --*a18;
  }

  _Unwind_Resume(exception_object);
}

void *sub_100087780(void *a1)
{
  uint64_t v2 = (void *)a1[14];
  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[11];
  if (v3) {
    operator delete(v3);
  }
  unint64_t v4 = (void *)a1[8];
  if (v4)
  {
    a1[9] = v4;
    operator delete(v4);
  }

  uint64_t v5 = (void *)a1[5];
  if (v5)
  {
    a1[6] = v5;
    operator delete(v5);
  }

  return a1;
}

void *sub_1000877DC(void *a1)
{
  uint64_t v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  *a1 = off_1000D3068;
  return a1;
}

void sub_100087860(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_100087874(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = (std::__shared_weak_count *)a2[1];
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      unint64_t v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
    do
      unint64_t v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
    a1[1] = v3;
    a1[2] = v4;
    *a1 = off_1000D3478;
    do
      unint64_t v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }

  else
  {
    a1[1] = v3;
    a1[2] = 0LL;
  }

  *a1 = off_1000D3350;
  return a1;
}

void sub_100087910(void *a1)
{
  *a1 = off_1000D35A0;
  sub_100017FC4((uint64_t)(a1 + 1));
  operator delete(a1);
}

uint64_t sub_100087940(uint64_t a1)
{
  return *(unsigned int *)(*(void *)(a1 + 8) + 80LL);
}

float sub_10008794C@<S0>(uint64_t a1@<X0>, int a2@<W1>, _DWORD *a3@<X8>)
{
  uint64_t v3 = *(float **)(*(void *)(*(void *)(a1 + 8) + 56LL) + 8LL * a2);
  float result = *v3;
  *a3 = *(_DWORD *)v3;
  return result;
}

uint64_t sub_100087964(uint64_t a1, int a2)
{
}

uint64_t sub_100087980(uint64_t a1, int a2)
{
  return *(void *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 56LL) + 8LL * a2) + 8LL);
}

uint64_t sub_100087994(uint64_t a1, int a2)
{
  return *(void *)(*(void *)(*(void *)(*(void *)(a1 + 8) + 56LL) + 8LL * a2) + 16LL);
}

uint64_t sub_1000879A8(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 24LL))(*(void *)(a1 + 8), a2);
  }
  unint64_t v5 = sub_1000886D0(a1, a2, &v7);
  *(void *)(*(void *)(a1 + 8) + 8LL) = *(void *)(*(void *)(a1 + 8) + 8LL) & (~v7 | 4) | v7 & v5;
  return v5 & a2;
}

uint64_t sub_100087A2C(uint64_t a1)
{
  return *(void *)(a1 + 8) + 16LL;
}

void *sub_100087A38(uint64_t a1)
{
  float result = operator new(0x18uLL);
  uint64_t v3 = *(void *)(a1 + 16);
  result[1] = *(void *)(a1 + 8);
  result[2] = v3;
  if (v3)
  {
    unint64_t v4 = (unint64_t *)(v3 + 8);
    do
      unint64_t v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }

  void *result = off_1000D3068;
  return result;
}

uint64_t sub_100087A90(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40LL);
}

uint64_t sub_100087A9C(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL);
}

uint64_t sub_100087AA8(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *(void *)a2 = 0LL;
  *(_DWORD *)(a2 + 8) = (*(void *)(v2 + 64) - *(void *)(v2 + 56)) >> 3;
  return result;
}

uint64_t sub_100087AC4(uint64_t result, int a2, void *a3)
{
  uint64_t v3 = *(void *)(result + 8);
  *a3 = 0LL;
  unint64_t v5 = (uint64_t *)(*(void *)(*(void *)(v3 + 56) + 8LL * a2) + 24LL);
  uint64_t v4 = *v5;
  uint64_t v6 = (v5[1] - *v5) >> 4;
  if (v5[1] == *v5) {
    uint64_t v4 = 0LL;
  }
  a3[1] = v4;
  a3[2] = v6;
  a3[3] = 0LL;
  return result;
}

uint64_t sub_100087AF0()
{
  return 0LL;
}

uint64_t sub_100087AF8(uint64_t a1)
{
  return (*(void *)(*(void *)(a1 + 8) + 64LL) - *(void *)(*(void *)(a1 + 8) + 56LL)) >> 3;
}

uint64_t sub_100087B0C(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10008AA18(a2, &v7);
    sub_10002CF84((void *)(a1 + 8), &v7);
    uint64_t v3 = v8;
    if (v8)
    {
      p_shared_owners = (unint64_t *)&v8->__shared_owners_;
      do
        unint64_t v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }

  return a1;
}

unint64_t sub_100087B8C(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  *(_DWORD *)(v4 + 80) = a2;
  unint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
  *(void *)(v4 + 8) = result & 0xCCCFFFFF0007LL | (((result >> 35) & 1) << 37) | *(void *)(v4 + 8) & 4LL;
  return result;
}

float sub_100087BF0(uint64_t a1, int a2, int *a3)
{
  uint64_t v6 = *(void **)(a1 + 8);
  int v8 = *a3;
  return sub_10002D840(v6, a2, (float *)&v8);
}

void sub_100087C40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(*(void *)(a1 + 8) + 8LL) = *(void *)(*(void *)(a1 + 8) + 8LL) & (~a3 | 4) | a3 & a2;
}

uint64_t sub_100087CB8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = sub_10002D0E8(v2);
  v2[1] = v2[1] & 4LL | (*(uint64_t (**)(void *))(*v2 + 16LL))(v2) & 0xEAFFFFFF0007LL;
  return v3;
}

uint64_t sub_100087D1C(uint64_t a1, int a2, float *a3)
{
  return sub_10008B260(*(void **)(a1 + 8), a2, a3);
}

uint64_t sub_100087D58(uint64_t a1, char **a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  sub_10008B2DC((uint64_t)v4, a2);
  uint64_t result = (*(uint64_t (**)(void *))(*v4 + 16LL))(v4);
  v4[1] = v4[1] & 4LL | result & 0x806A5A950007LL;
  return result;
}

uint64_t sub_100087DBC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1 && !*(void *)(v1 + 8))
  {
    unint64_t v15 = *(void **)(a1 + 8);
    sub_10002DF28((uint64_t)v15);
    uint64_t result = (*(uint64_t (**)(void *))(*v15 + 16LL))(v15);
    v15[1] = (*((_DWORD *)v15 + 2) | result) & 4 | 0x956A5A950003LL;
  }

  else
  {
    uint64_t v3 = *(void *)(a1 + 8);
    uint64_t v2 = (uint64_t *)(a1 + 8);
    uint64_t v5 = *(void *)(v3 + 40);
    uint64_t v4 = *(void *)(v3 + 48);
    sub_1000881F8(&v16);
    sub_10002CF84(v2, &v16);
    uint64_t v6 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        unint64_t v8 = __ldaxr(p_shared_owners);
      while (__stlxr(v8 - 1, p_shared_owners));
      if (!v8)
      {
        ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
        std::__shared_weak_count::__release_weak(v6);
      }
    }

    uint64_t v9 = *v2;
    if (v5) {
      uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 16LL))(v5);
    }
    else {
      uint64_t v10 = 0LL;
    }
    uint64_t v11 = *(void *)(v9 + 40);
    *(void *)(v9 + 40) = v10;
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
    }
    uint64_t v12 = *v2;
    if (v4) {
      uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t result = *(void *)(v12 + 48);
    *(void *)(v12 + 48) = v13;
    if (result) {
      return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
    }
  }

  return result;
}

uint64_t sub_100087F08(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 8);
  sub_10002DB9C(*(void **)(v6[7] + 8LL * a2), a3);
  uint64_t result = (*(uint64_t (**)(void *))(*v6 + 16LL))(v6);
  v6[1] = v6[1] & 4LL | result & 0x8A6A5A950007LL;
  return result;
}

uint64_t sub_100087F7C(uint64_t a1, int a2)
{
  uint64_t v4 = *(void **)(a1 + 8);
  uint64_t v5 = *(void **)(v4[7] + 8LL * a2);
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[4] = v5[3];
  uint64_t result = (*(uint64_t (**)(void *))(*v4 + 16LL))(v4);
  v4[1] = v4[1] & 4LL | result & 0x8A6A5A950007LL;
  return result;
}

void sub_100087FE8(uint64_t a1, int a2)
{
}

void sub_100088018(uint64_t a1, int a2, unint64_t a3)
{
}

uint64_t sub_10008805C(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40LL);
}

uint64_t sub_100088084(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL);
}

uint64_t sub_1000880AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t result = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v5;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_100088114(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  if (a2) {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2);
  }
  else {
    uint64_t v5 = 0LL;
  }
  uint64_t result = *(void *)(v4 + 48);
  *(void *)(v4 + 48) = v5;
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

void sub_10008817C(uint64_t a1, int a2, void *a3)
{
  uint64_t v6 = operator new(0x20uLL);
  *uint64_t v6 = &off_1000D3708;
  v6[3] = 0LL;
  sub_10008B138(a1);
  uint64_t v7 = *(void *)(a1 + 8);
  v6[1] = *(void *)(*(void *)(v7 + 56) + 8LL * a2);
  v6[2] = v7 + 8;
  *a3 = v6;
}

void sub_1000881E4(_Unwind_Exception *a1)
{
}

void *sub_1000881F8@<X0>(void *a1@<X8>)
{
  uint64_t v2 = operator new(0x70uLL);
  uint64_t result = sub_100088240(v2);
  *a1 = v2 + 3;
  a1[1] = v2;
  return result;
}

void sub_10008822C(_Unwind_Exception *a1)
{
}

void *sub_100088240(void *a1)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3230;
  sub_1000882C8((uint64_t)(a1 + 3));
  return a1;
}

void sub_100088274(_Unwind_Exception *a1)
{
}

void sub_100088288(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3230;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100088298(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3230;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_1000882B8(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_1000882C8(uint64_t a1)
{
  *(void *)a1 = off_1000D3320;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v2 = (std::string *)(a1 + 16);
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(_DWORD *)(a1 + 80) = -1;
  *(void *)a1 = off_1000D3280;
  sub_10000A2DC(&__str, "vector");
  std::string::operator=(v2, &__str);
  *(void *)(a1 + 8) = *(void *)(a1 + 8) & 4LL | 0x956A5A950003LL;
  return a1;
}

void sub_100088378( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_1000883A4(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_1000883A4(void *a1)
{
  *a1 = off_1000D32F0;
  uint64_t v2 = (void **)a1[8];
  if (v2 != (void **)a1[7])
  {
    unint64_t v3 = 0LL;
    uint64_t v2 = (void **)a1[7];
    do
    {
      sub_10002D6DC(v2[v3++]);
      uint64_t v2 = (void **)a1[7];
    }

    while (v3 < (uint64_t)(a1[8] - (void)v2) >> 3);
  }

  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }

  return sub_10008847C((uint64_t)a1);
}

void sub_100088424(void *a1)
{
  uint64_t v1 = (void *)sub_1000883A4(a1);
  operator delete(v1);
}

uint64_t sub_100088438(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_100088440(uint64_t a1, uint64_t a2)
{
  return *(void *)(a1 + 8) & a2;
}

void sub_100088450(void *a1)
{
  uint64_t v1 = (void *)sub_1000883A4(a1);
  operator delete(v1);
}

void sub_100088468(uint64_t a1)
{
  uint64_t v1 = (void *)sub_10008847C(a1);
  operator delete(v1);
}

uint64_t sub_10008847C(uint64_t a1)
{
  *(void *)a1 = off_1000D3320;
  uint64_t v2 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  uint64_t v3 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

uint64_t sub_1000884E8(uint64_t a1)
{
  uint64_t v2 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::Write: No write stream method for ", 39LL);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  int v4 = *(char *)(v3 + 23);
  if (v4 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = *(void *)v3;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(v3 + 23);
  }
  else {
    uint64_t v6 = *(void *)(v3 + 8);
  }
  uint64_t v7 = sub_10002A6A4(v2, v5, v6);
  sub_10002A6A4(v7, (uint64_t)" FST type", 9LL);
  sub_10002AA94(&v11);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return 0LL;
}

void sub_1000885A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000885CC(uint64_t a1)
{
  uint64_t v2 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::Write: No write filename method for ", 41LL);
  uint64_t v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 64LL))(a1);
  int v4 = *(char *)(v3 + 23);
  if (v4 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = *(void *)v3;
  }
  if (v4 >= 0) {
    uint64_t v6 = *(unsigned __int8 *)(v3 + 23);
  }
  else {
    uint64_t v6 = *(void *)(v3 + 8);
  }
  uint64_t v7 = sub_10002A6A4(v2, v5, v6);
  sub_10002A6A4(v7, (uint64_t)" FST type", 9LL);
  sub_10002AA94(&v11);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return 0LL;
}

void sub_100088684( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000886B0(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40LL);
}

uint64_t sub_1000886BC(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL);
}

unint64_t sub_1000886D0(uint64_t a1, uint64_t a2, void *a3)
{
  if (!byte_1000DE7EE) {
    return sub_100088848(a1, a2, a3, 1);
  }
  unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 0xFFFFFFFF0007LL, 0LL);
  unint64_t v7 = sub_100088848(a1, a2, a3, 0);
  if (!sub_10002AB50(v6, v7))
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v12, (uint64_t)__p);
    uint64_t v9 = sub_10002A6A4(&std::cerr, (uint64_t)"TestProperties: stored FST properties incorrect", 47LL);
    sub_10002A6A4(v9, (uint64_t)" (stored: props1, computed: props2)", 35LL);
    sub_10002AA94(&v12);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
  }

  return v7;
}

void sub_100088810( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_100088848(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v8 = a1;
  unint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 0xFFFFFFFF0007LL, 0LL);
  unint64_t v10 = v9;
  if (a4)
  {
    uint64_t v11 = v9 & 0xFFFFFFFF0000LL | (2 * v9) & 0xAAAAAAAA0000LL | (v9 >> 1) & 0x555555550000LL | 7;
    if ((a2 & ~v11) == 0)
    {
      if (a3) {
        *a3 = v11;
      }
      return v10;
    }
  }

  uint64_t v56 = 0LL;
  unint64_t v57 = v9 & 7;
  uint64_t v54 = 0LL;
  int v55 = 0LL;
  if ((a2 & 0xCF3C00000000LL) != 0)
  {
    __int128 v49 = (unint64_t)&v54;
    *(void *)&__int128 v50 = 0LL;
    *((void *)&v50 + 1) = &v57;
    *(_OWORD *)unint64_t v52 = 0u;
    *(_OWORD *)__p = 0u;
    sub_100088FFC(v8, (uint64_t *)&v49, 0);
    BOOL v12 = (void **)__p[1];
    __p[1] = 0LL;
    if (v12) {
      sub_10002B7A4((int)&__p[1], v12);
    }
    sub_10002B764((void ***)__p, 0LL);
    uint64_t v13 = (void **)v52[1];
    v52[1] = 0LL;
    if (v13) {
      sub_10002B7A4((int)&v52[1], v13);
    }
    uint64_t v14 = (void **)v52[0];
    v52[0] = 0LL;
    if (v14) {
      sub_10002B7A4((int)v52, v14);
    }
  }

  if ((a2 & 0xFFFFF0C3FFFFFFF8LL) == 0) {
    goto LABEL_102;
  }
  uint64_t v42 = a3;
  uint64_t v15 = 0x10425A810000LL;
  if ((a2 & 0xC0000) != 0) {
    uint64_t v15 = 0x10425A850000LL;
  }
  unint64_t v16 = v57 | v15;
  uint64_t v44 = a2 & 0x300000;
  uint64_t v45 = a2 & 0xC0000;
  if ((a2 & 0x300000) != 0) {
    v16 |= 0x100000uLL;
  }
  if ((a2 & 0xCF3C00000000LL) != 0) {
    v16 |= 0x800000000000uLL;
  }
  unint64_t v57 = v16;
  uint64_t v46 = 0LL;
  int v47 = 0;
  unsigned int v48 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)v8 + 112LL))(v8, &v46);
  unint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  int v19 = 0;
  uint64_t v43 = v8;
LABEL_20:
  if (!v46)
  {
    goto LABEL_25;
  }

  if (!(*(unsigned int (**)(uint64_t))(*(void *)v46 + 16LL))(v46))
  {
    if (v46)
    {
      uint64_t v20 = (*(uint64_t (**)(void))(*(void *)v46 + 24LL))();
LABEL_26:
      if (v45)
      {
        int v21 = operator new(0x28uLL);
        _OWORD *v21 = 0u;
        v21[1] = 0u;
        *((_DWORD *)v21 + 8) = 1065353216;
        if (v18)
        {
          unint64_t v22 = (void *)sub_10001A760((uint64_t)v18);
          operator delete(v22);
        }

        uint64_t v18 = v21;
      }

      if (v44)
      {
        uint64_t v23 = operator new(0x28uLL);
        _OWORD *v23 = 0u;
        v23[1] = 0u;
        *((_DWORD *)v23 + 8) = 1065353216;
        if (v17)
        {
          uint64_t v24 = (void *)sub_10001A760((uint64_t)v17);
          operator delete(v24);
        }

        unint64_t v17 = v23;
      }

      unint64_t v51 = 0LL;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)v8 + 120LL))(v8, v20, &v49);
      char v25 = 1;
      while ((void)v49)
      {
        if ((*(unsigned int (**)(void))(*(void *)v49 + 16LL))(v49))
        {
          if ((void)v49)
          {
            (*(void (**)(void))(*(void *)v49 + 8LL))();
            goto LABEL_82;
          }

void sub_100088F20( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  unint64_t v22 = *(void **)(v20 - 128);
  if (v22)
  {
    *(void *)(v20 - 120) = v22;
    operator delete(v22);
  }

  _Unwind_Resume(exception_object);
}

void sub_100088FFC(uint64_t a1, uint64_t *a2, char a3)
{
  int v45 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v45 == -1)
  {
    sub_10002AF44((uint64_t)a2);
    return;
  }

  uint64_t v56 = 0LL;
  unint64_t v57 = 0LL;
  uint64_t v58 = 0LL;
  __int128 v55 = 0u;
  memset(v54, 0, sizeof(v54));
  sub_10002B8A4(v51, 64LL);
  __int128 v53 = 0LL;
  __int128 v50 = off_1000D36C8;
  uint64_t v44 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v44) {
    uint64_t v5 = sub_10008978C(a1);
  }
  else {
    uint64_t v5 = (v45 + 1);
  }
  if ((int)v5 <= (unint64_t)(v57 - v56))
  {
  }

  else
  {
    sub_10002BA28(&v56, (int)v5 - (v57 - v56), &unk_1000AFCA9);
  }

  uint64_t v47 = 0LL;
  int v48 = 0;
  int v49 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v47);
  uint64_t v6 = v45;
  do
  {
    v56[(int)v6] = 1;
    unint64_t v7 = v53;
    if (v53)
    {
      __int128 v53 = (char *)*((void *)v53 + 6);
    }

    else
    {
      unint64_t v7 = sub_10002BED8(v51, 1LL);
      *((void *)v7 + 6) = 0LL;
    }

    *(_DWORD *)unint64_t v7 = v6;
    *(_OWORD *)(v7 + 24) = 0u;
    *((void *)v7 + 5) = 0LL;
    *(_OWORD *)(v7 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v6, v7 + 8);
    uint64_t v46 = v7;
    sub_100089908(v54, &v46);
    char v8 = sub_10002B010(a2, v6, v6);
LABEL_16:
    char v9 = v8;
    while (*((void *)&v55 + 1))
    {
      unint64_t v10 = *(char **)(*(void *)(*((void *)&v54[0] + 1)
      unint64_t v11 = *(int *)v10;
      unint64_t v12 = v57 - v56;
      if (v57 - v56 <= v11)
      {
        uint64_t v5 = (v11 + 1);
        if ((int)v5 <= v12)
        {
        }

        else
        {
          sub_10002BA28(&v56, (int)v5 - v12, &unk_1000AFCA9);
        }
      }

      if ((v9 & 1) == 0) {
        goto LABEL_33;
      }
      uint64_t v13 = *((void *)v10 + 1);
      if (v13)
      {
        uint64_t v14 = *((void *)v10 + 1);
        if (!v14) {
          goto LABEL_29;
        }
        uint64_t v15 = (*(uint64_t (**)(uint64_t))(*(void *)v14 + 24LL))(v14);
LABEL_30:
        unint64_t v16 = *(int *)(v15 + 12);
        unint64_t v17 = v56;
        unint64_t v18 = v57 - v56;
        if (v57 - v56 <= v16)
        {
          uint64_t v5 = (v16 + 1);
          if ((int)v5 <= v18)
          {
          }

          else
          {
            sub_10002BA28(&v56, (int)v5 - v18, &unk_1000AFCA9);
            unint64_t v16 = *(int *)(v15 + 12);
            unint64_t v17 = v56;
          }
        }

        int v25 = v17[v16];
        if (v25 == 1)
        {
          char v9 = sub_10002B5F0((uint64_t)a2, v11, v15);
          uint64_t v24 = *((void *)v10 + 1);
          if (v24) {
            goto LABEL_50;
          }
LABEL_51:
          ++*((void *)v10 + 5);
        }

        else
        {
          if (v25 != 2)
          {
            v17[v16] = 1;
            uint64_t v26 = v53;
            if (v53)
            {
              __int128 v53 = (char *)*((void *)v53 + 6);
            }

            else
            {
              uint64_t v26 = sub_10002BED8(v51, 1LL);
              *((void *)v26 + 6) = 0LL;
            }

            *(_DWORD *)uint64_t v26 = *(_DWORD *)(v15 + 12);
            *(_OWORD *)(v26 + 24) = 0u;
            *((void *)v26 + 5) = 0LL;
            *(_OWORD *)(v26 + 8) = 0u;
            (*(void (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
            uint64_t v46 = v26;
            sub_100089908(v54, &v46);
            char v8 = sub_10002B010(a2, *(_DWORD *)(v15 + 12), v6);
            goto LABEL_16;
          }

          char v9 = sub_10002B684((void **)a2, v11, v15);
          uint64_t v24 = *((void *)v10 + 1);
          if (!v24) {
            goto LABEL_51;
          }
LABEL_50:
          (*(void (**)(uint64_t))(*(void *)v24 + 32LL))(v24);
        }
      }

      else
      {
        if (*((void *)v10 + 5) < *((void *)v10 + 3))
        {
LABEL_29:
          uint64_t v15 = *((void *)v10 + 2) + 16LL * *((void *)v10 + 5);
          goto LABEL_30;
        }

void sub_1000896FC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10008978C(uint64_t a1)
{
  uint64_t v4 = 0LL;
  int v5 = 0;
  int v6 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v4);
  uint64_t v3 = 0LL;
  while (1)
  {
    while (!v4)
    {
      if (v6 >= v5) {
        return v3;
      }
      uint64_t v3 = (v3 + 1);
LABEL_10:
      ++v6;
    }

    uint64_t v3 = (v3 + 1);
    if (!v4) {
      goto LABEL_10;
    }
    (*(void (**)(void))(*(void *)v4 + 32LL))();
  }

  if (v4) {
    (*(void (**)(void))(*(void *)v4 + 8LL))();
  }
  return v3;
}

void sub_100089878( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100089898(void *a1)
{
  *a1 = off_1000D0BA0;
  a1[1] = off_1000D0BC8;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_1000898D0(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D0BA0;
  a1[1] = (uint64_t)off_1000D0BC8;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void sub_100089908(void *a1, void *a2)
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
    sub_10008998C(a1);
    uint64_t v5 = a1[1];
    uint64_t v7 = a1[5];
    unint64_t v8 = a1[4] + v7;
  }

  *(void *)(*(void *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8LL)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

void sub_10008998C(void *a1)
{
  unint64_t v2 = a1[4];
  BOOL v3 = v2 >= 0x200;
  unint64_t v4 = v2 - 512;
  if (v3)
  {
    uint64_t v5 = (uint64_t)(a1 + 3);
    uint64_t v6 = (char *)a1[3];
    a1[4] = v4;
    uint64_t v7 = (void *)a1[1];
    unint64_t v8 = (char *)a1[2];
    uint64_t v11 = *v7;
    char v9 = (char *)(v7 + 1);
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
      uint64_t v34 = (char *)sub_100018788(v5, v33);
      uint64_t v35 = &v34[8 * (v33 >> 2)];
      size_t v37 = &v34[8 * v36];
      __n128 v38 = (uint64_t *)a1[1];
      unint64_t v8 = v35;
      uint64_t v39 = a1[2] - (void)v38;
      if (v39)
      {
        unint64_t v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8LL];
        uint64_t v40 = 8 * (v39 >> 3);
        unint64_t v41 = &v34[8 * (v33 >> 2)];
        do
        {
          uint64_t v42 = *v38++;
          *(void *)unint64_t v41 = v42;
          v41 += 8;
          v40 -= 8LL;
        }

        while (v40);
      }

      goto LABEL_30;
    }

void sub_100089C54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_100089CA0(void *a1, void *a2, uint64_t a3)
{
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  *(_OWORD *)__int128 v32 = 0u;
  *(_OWORD *)unint64_t v33 = 0u;
  uint64_t v37 = 0LL;
  uint64_t v38 = 0LL;
  uint64_t v36 = -1LL;
  uint64_t v36 = (*(int (**)(void *))(*a1 + 16LL))(a1);
  uint64_t v37 = -1LL;
  else {
    BOOL v6 = *(_BYTE *)(a3 + 28) == 0;
  }
  if (!v6)
  {
    uint64_t v7 = 0LL;
LABEL_6:
    int v8 = 0;
    uint64_t v37 = (int)sub_10008978C((uint64_t)a1);
    goto LABEL_9;
  }

  char v9 = (char *)a2 + *(void *)(*a2 - 24LL);
  if ((v9[32] & 5) != 0)
  {
    int v8 = 1;
    uint64_t v7 = -1LL;
  }

  else
  {
    (*(void (**)(std::string *__return_ptr, void, void, uint64_t, uint64_t))(**((void **)v9 + 5) + 32LL))( __p,  *((void *)v9 + 5),  0LL,  1LL,  16LL);
    uint64_t v7 = v40;
    if (v40 != -1) {
      goto LABEL_6;
    }
    int v8 = 1;
  }

void sub_10008A0D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, char a12, __int16 a13, char a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, void *__p, uint64_t a28, int a29, __int16 a30, char a31, char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  sub_10002C8BC((uint64_t)&a14);
  _Unwind_Resume(a1);
}

uint64_t sub_10008A14C(uint64_t a1, uint64_t a2, _BYTE *a3, int a4, std::string *__str, uint64_t a6, uint64_t a7)
{
  if (a3[24])
  {
    std::string::operator=((std::string *)(a7 + 8), __str);
    unint64_t v13 = (const std::string *)sub_10008A628();
    std::string::operator=((std::string *)(a7 + 32), v13);
    *(_DWORD *)(a7 + 56) = a4;
    *(void *)(a7 + 64) = a6;
    else {
      BOOL v14 = 1;
    }
    int v15 = !v14;
    uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
    if (a3[26]) {
      BOOL v17 = v16 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    int v18 = v15 | 2;
    if (v17) {
      int v18 = v15;
    }
    if (a3[27]) {
      v18 |= 4u;
    }
    *(_DWORD *)(a7 + 60) = v18;
    sub_1000A3E5C(a7, a2);
  }

  else {
    BOOL v19 = 1;
  }
  if (!v19)
  {
    uint64_t v20 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
    (*(void (**)(uint64_t, uint64_t))(*(void *)v20 + 144LL))(v20, a2);
  }

  uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
  if (result) {
    BOOL v22 = a3[26] == 0;
  }
  else {
    BOOL v22 = 1;
  }
  if (!v22)
  {
    uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v23 + 144LL))(v23, a2);
  }

  return result;
}

uint64_t sub_10008A2B0( uint64_t a1, void *a2, uint64_t a3, int a4, std::string *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16 = (char *)a2 + *(void *)(*a2 - 24LL);
  if ((v16[32] & 5) == 0)
  {
    uint64_t v17 = *((void *)v16 + 5);
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 __p = 0u;
    __int128 v29 = 0u;
    uint64_t v36 = a8;
    (*(void (**)(void *__return_ptr, uint64_t, __int128 *, uint64_t))(*(void *)v17 + 40LL))( v27,  v17,  &__p,  16LL);
    if (v27[16] == -1LL) {
      std::ios_base::clear( (std::ios_base *)((char *)a2 + *(void *)(*a2 - 24LL)),  *(_DWORD *)((char *)a2 + *(void *)(*a2 - 24LL) + 32) | 4);
    }
  }

  std::ostream::sentry::~sentry(v26);
  if ((*((_BYTE *)a2 + *(void *)(*a2 - 24LL) + 32) & 5) != 0)
  {
    sub_10000A2DC(&__p, "ERROR");
    sub_10002A9EC((BOOL *)v27, (uint64_t)&__p);
    int v18 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::UpdateFstHeader: Write failed: ", 36LL);
    int v19 = *(char *)(a3 + 23);
    if (v19 >= 0) {
      uint64_t v20 = a3;
    }
    else {
      uint64_t v20 = *(void *)a3;
    }
    if (v19 >= 0) {
      uint64_t v21 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      uint64_t v21 = *(void *)(a3 + 8);
    }
  }

  else
  {
    sub_10008A14C(a1, (uint64_t)a2, (_BYTE *)a3, a4, a5, a6, a7);
    if ((*((_BYTE *)a2 + *(void *)(*a2 - 24LL) + 32) & 5) != 0)
    {
      sub_10000A2DC(&__p, "ERROR");
      sub_10002A9EC((BOOL *)v27, (uint64_t)&__p);
      int v18 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::UpdateFstHeader: Write failed: ", 36LL);
      int v22 = *(char *)(a3 + 23);
      if (v22 >= 0) {
        uint64_t v20 = a3;
      }
      else {
        uint64_t v20 = *(void *)a3;
      }
      if (v22 >= 0) {
        uint64_t v21 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        uint64_t v21 = *(void *)(a3 + 8);
      }
    }

    else
    {
      std::ostream::sentry::sentry(v27, a2);
      uint64_t v23 = (char *)a2 + *(void *)(*a2 - 24LL);
      if ((v23[32] & 5) == 0)
      {
        (*(void (**)(__int128 *__return_ptr, void, void, uint64_t, uint64_t))(**((void **)v23 + 5) + 32LL))( &__p,  *((void *)v23 + 5),  0LL,  2LL,  16LL);
        if (v36 == -1) {
          std::ios_base::clear( (std::ios_base *)((char *)a2 + *(void *)(*a2 - 24LL)),  *(_DWORD *)((char *)a2 + *(void *)(*a2 - 24LL) + 32) | 4);
        }
      }

      std::ostream::sentry::~sentry(v27);
      if ((*((_BYTE *)a2 + *(void *)(*a2 - 24LL) + 32) & 5) == 0) {
        return 1LL;
      }
      sub_10000A2DC(&__p, "ERROR");
      sub_10002A9EC((BOOL *)v27, (uint64_t)&__p);
      int v18 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::UpdateFstHeader: Write failed: ", 36LL);
      int v24 = *(char *)(a3 + 23);
      if (v24 >= 0) {
        uint64_t v20 = a3;
      }
      else {
        uint64_t v20 = *(void *)a3;
      }
      if (v24 >= 0) {
        uint64_t v21 = *(unsigned __int8 *)(a3 + 23);
      }
      else {
        uint64_t v21 = *(void *)(a3 + 8);
      }
    }
  }

  sub_10002A6A4(v18, v20, v21);
  sub_10002AA94(v27);
  if (SBYTE7(v29) < 0) {
    operator delete((void *)__p);
  }
  return 0LL;
}

void sub_10008A5C0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
}

uint64_t sub_10008A628()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDA88);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDA88))
  {
    unint64_t v2 = operator new(0x18uLL);
    uint64_t v3 = sub_10002C8FC();
    std::operator+<char>(v2, "reverse_", v3);
    qword_1000DDA80 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDA88);
  }

  return qword_1000DDA80;
}

void sub_10008A6A0(_Unwind_Exception *a1)
{
}

uint64_t sub_10008A6C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = *(void *)(a2 + 8);
  }
  if (v3)
  {
    sub_10002CE18((void (__cdecl ***)(std::ofstream *__hidden))__p, (uint64_t *)a2, 20);
    if ((v29[*((void *)__p[0] - 3)] & 5) != 0)
    {
      sub_10000A2DC(v16, "ERROR");
      sub_10002A9EC(&v22, (uint64_t)v16);
      uint64_t v5 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::Write: Can't open file: ", 29LL);
      int v6 = *(char *)(a2 + 23);
      if (v6 >= 0) {
        uint64_t v7 = a2;
      }
      else {
        uint64_t v7 = *(void *)a2;
      }
      if (v6 >= 0) {
        uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v8 = *(void *)(a2 + 8);
      }
      goto LABEL_31;
    }

    char v10 = byte_1000DE7EF;
    if (*(char *)(a2 + 23) < 0)
    {
      sub_10005AA70(v16, *(void **)a2, *(void *)(a2 + 8));
    }

    else
    {
      *(_OWORD *)uint64_t v16 = *(_OWORD *)a2;
      uint64_t v17 = *(void *)(a2 + 16);
    }

    __int16 v18 = 257;
    char v19 = 1;
    char v20 = v10;
    char v21 = 0;
    char v12 = (*(uint64_t (**)(uint64_t, void **, void **))(*(void *)a1 + 80LL))(a1, __p, v16);
    char v13 = v12;
    if (SHIBYTE(v17) < 0)
    {
      operator delete(v16[0]);
      if ((v13 & 1) != 0) {
        goto LABEL_23;
      }
    }

    else if ((v12 & 1) != 0)
    {
LABEL_23:
      uint64_t v11 = 1LL;
LABEL_34:
      std::filebuf::~filebuf(&__p[1]);
      std::ios::~ios(&v30);
      return v11;
    }

    sub_10000A2DC(v16, "ERROR");
    sub_10002A9EC(&v22, (uint64_t)v16);
    uint64_t v5 = sub_10002A6A4(&std::cerr, (uint64_t)"Fst::Write failed: ", 19LL);
    int v14 = *(char *)(a2 + 23);
    if (v14 >= 0) {
      uint64_t v7 = a2;
    }
    else {
      uint64_t v7 = *(void *)a2;
    }
    if (v14 >= 0) {
      uint64_t v8 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v8 = *(void *)(a2 + 8);
    }
LABEL_31:
    sub_10002A6A4(v5, v7, v8);
    sub_10002AA94(&v22);
    if (SHIBYTE(v17) < 0) {
      operator delete(v16[0]);
    }
    uint64_t v11 = 0LL;
    goto LABEL_34;
  }

  sub_10000A2DC(v16, "standard output");
  char v9 = byte_1000DE7EF;
  if (SHIBYTE(v17) < 0)
  {
    sub_10005AA70(__p, v16[0], (unint64_t)v16[1]);
  }

  else
  {
    *(_OWORD *)__int128 __p = *(_OWORD *)v16;
    uint64_t v24 = v17;
  }

  __int16 v25 = 257;
  char v26 = 1;
  char v27 = v9;
  char v28 = 0;
  uint64_t v11 = (*(uint64_t (**)(uint64_t, std::ostream *, void **))(*(void *)a1 + 80LL))(a1, &std::cout, __p);
  if (SHIBYTE(v24) < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v17) < 0) {
    operator delete(v16[0]);
  }
  return v11;
}

void sub_10008A990( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
}

void *sub_10008AA18@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  unint64_t v4 = operator new(0x70uLL);
  uint64_t result = sub_10008AA70(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10008AA5C(_Unwind_Exception *a1)
{
}

void *sub_10008AA70(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3230;
  sub_10008AAB8((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_10008AAA4(_Unwind_Exception *a1)
{
}

uint64_t sub_10008AAB8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000D3320;
  *(void *)(a1 + 8) = 0LL;
  unint64_t v4 = (std::string *)(a1 + 16);
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  uint64_t v5 = (uint64_t *)(a1 + 40);
  *(void *)(a1 + 48) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  int v6 = (void *)(a1 + 56);
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(_DWORD *)(a1 + 80) = -1;
  *(void *)a1 = off_1000D3280;
  sub_10000A2DC(__p, "vector");
  std::string::operator=(v4, (const std::string *)__p);
  if (SBYTE7(v17) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  if (v7) {
    uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)v7 + 16LL))(v7);
  }
  uint64_t v8 = *v5;
  uint64_t *v5 = v7;
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8LL))(v8);
  }
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
  if (v9) {
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16LL))(v9);
  }
  uint64_t v10 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
  }
  *(_DWORD *)(a1 + 80) = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2);
  if ((*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 1LL, 0LL))
  {
    int v11 = sub_10008978C(a2);
    sub_10002D348((void **)(a1 + 56), v11);
  }

  uint64_t v20 = 0LL;
  int v21 = 0;
  unsigned int v22 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a2 + 112LL))(a2, &v20);
  while (1)
  {
    if (!v20)
    {
LABEL_19:
      uint64_t v12 = v22;
      goto LABEL_20;
    }

    if (!v20) {
      goto LABEL_19;
    }
    uint64_t v12 = (*(uint64_t (**)(void))(*(void *)v20 + 24LL))();
LABEL_20:
    sub_10002D0E8((void *)a1);
    (*(void (**)(int *__return_ptr, uint64_t, uint64_t))(*(void *)a2 + 24LL))(&v19, a2, v12);
    **(_DWORD **)(*v6 + 8LL * (int)v12) = v19;
    unint64_t v13 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 32LL))(a2, v12);
    sub_10008AEBC((uint64_t *)(*(void *)(*v6 + 8LL * (int)v12) + 24LL), v13);
    unint64_t v18 = 0LL;
    *(_OWORD *)__int128 __p = 0u;
    __int128 v17 = 0u;
    (*(void (**)(uint64_t, uint64_t, void **))(*(void *)a2 + 120LL))(a2, v12, __p);
    while (1)
    {
      if (!__p[0])
      {
LABEL_26:
        int v14 = (char *)__p[1] + 16 * v18;
        goto LABEL_27;
      }

      if (!__p[0]) {
        goto LABEL_26;
      }
      int v14 = (_DWORD *)(*(uint64_t (**)(void))(*(void *)__p[0] + 24LL))();
LABEL_27:
      sub_10008AF94(*(void **)(*v6 + 8LL * (int)v12), v14);
      if (__p[0]) {
        (*(void (**)(void *))(*(void *)__p[0] + 32LL))(__p[0]);
      }
      else {
        ++v18;
      }
    }

    if (__p[0])
    {
      (*(void (**)(void))(*(void *)__p[0] + 8LL))();
      goto LABEL_34;
    }

void sub_10008AE2C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19)
{
}

void sub_10008AEBC(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      sub_100018774();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v11 = v3;
    __int128 __p = sub_1000198A8(v3, a2);
    uint64_t v8 = (char *)__p + v5;
    uint64_t v9 = (char *)__p + v5;
    uint64_t v10 = (char *)__p + 16 * v6;
    sub_10002D4B4(a1, &__p);
    if (v9 != v8) {
      v9 += (v8 - v9 + 15) & 0xFFFFFFFFFFFFFFF0LL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

void sub_10008AF5C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10008AF94(void *a1, _DWORD *a2)
{
  if (!*a2) {
    ++a1[1];
  }
  if (!a2[1]) {
    ++a1[2];
  }
  unint64_t v3 = a1[4];
  if (v3 >= a1[5])
  {
    uint64_t result = sub_10008B010(a1 + 3, (uint64_t)a2);
  }

  else
  {
    *(void *)unint64_t v3 = *(void *)a2;
    *(_DWORD *)(v3 + 8) = a2[2];
    *(_DWORD *)(v3 + 12) = a2[3];
    uint64_t result = v3 + 16;
  }

  a1[4] = result;
  return result;
}

uint64_t sub_10008B010(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = (a1[1] - *a1) >> 4;
  unint64_t v5 = v4 + 1;
  uint64_t v7 = (uint64_t)(a1 + 2);
  uint64_t v8 = a1[2] - v3;
  if (v8 >> 3 > v5) {
    unint64_t v5 = v8 >> 3;
  }
  else {
    unint64_t v9 = v5;
  }
  int v19 = a1 + 2;
  uint64_t v10 = (char *)sub_1000198A8(v7, v9);
  uint64_t v11 = &v10[16 * v4];
  __int128 __p = v10;
  uint64_t v16 = v11;
  unint64_t v18 = &v10[16 * v12];
  *(void *)uint64_t v11 = *(void *)a2;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(a2 + 8);
  *((_DWORD *)v11 + 3) = *(_DWORD *)(a2 + 12);
  __int128 v17 = v11 + 16;
  sub_10002D4B4(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    v17 += (v16 - v17 + 15) & 0xFFFFFFFFFFFFFFF0LL;
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_10008B100( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10008B138(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2 || *(void *)(v2 + 8))
  {
    sub_10008B1C0(a1, &v6);
    sub_10002CF84((void *)(a1 + 8), &v6);
    uint64_t v3 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        unint64_t v5 = __ldaxr(p_shared_owners);
      while (__stlxr(v5 - 1, p_shared_owners));
      if (!v5)
      {
        ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
        std::__shared_weak_count::__release_weak(v3);
      }
    }
  }

void *sub_10008B1C0@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0x70uLL);
  uint64_t result = sub_10008B218(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10008B204(_Unwind_Exception *a1)
{
}

void *sub_10008B218(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3230;
  sub_10008AAB8((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_10008B24C(_Unwind_Exception *a1)
{
}

uint64_t sub_10008B260(void *a1, int a2, float *a3)
{
  uint64_t v6 = *(void *)(*(void *)(a1[7] + 8LL * a2) + 32LL);
  if (v6 == *(void *)(*(void *)(a1[7] + 8LL * a2) + 24LL)) {
    uint64_t v7 = 0LL;
  }
  else {
    uint64_t v7 = (_DWORD *)(v6 - 16);
  }
  unint64_t v8 = (*(uint64_t (**)(void *))(*a1 + 16LL))(a1);
  a1[1] = a1[1] & 4LL | sub_10005CE04(v8, a2, a3, v7);
  return sub_10008AF94(*(void **)(a1[7] + 8LL * a2), a3);
}

void sub_10008B2DC(uint64_t a1, char **a2)
{
  uint64_t v4 = (uint64_t *)(a1 + 56);
  unint64_t v5 = (uint64_t)(*(void *)(a1 + 64) - *(void *)(a1 + 56)) >> 3;
  int v35 = 0;
  sub_10002DBF0(__p, v5, &v35);
  uint64_t v6 = *a2;
  uint64_t v7 = a2[1] - *a2;
  if (v7)
  {
    unint64_t v8 = v7 >> 2;
    unint64_t v9 = __p[0];
    if (v8 <= 1) {
      unint64_t v8 = 1LL;
    }
    do
    {
      uint64_t v10 = *(int *)v6;
      v6 += 4;
      v9[v10] = -1;
      --v8;
    }

    while (v8);
  }

  uint64_t v11 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 64) == v11)
  {
    int v13 = 0;
  }

  else
  {
    unint64_t v12 = 0LL;
    int v13 = 0;
    do
    {
      if (*((_DWORD *)__p[0] + v12) == -1)
      {
        sub_10002D6DC(*(void **)(v11 + 8 * v12));
      }

      else
      {
        *((_DWORD *)__p[0] + v12) = v13;
        if (v12 != v13) {
          *(void *)(v11 + 8LL * v13) = *(void *)(v11 + 8 * v12);
        }
        ++v13;
      }

      ++v12;
      uint64_t v11 = *(void *)(a1 + 56);
    }

    while (v12 < (*(void *)(a1 + 64) - v11) >> 3);
  }

  sub_10002DB6C((uint64_t)v4, v13);
  uint64_t v14 = *(void *)(a1 + 56);
  if (*(void *)(a1 + 64) != v14)
  {
    unint64_t v15 = 0LL;
    do
    {
      uint64_t v16 = *(void *)(v14 + 8 * v15);
      uint64_t v17 = *(void *)(v16 + 24);
      uint64_t v18 = *(void *)(v16 + 32);
      int64x2_t v19 = *(int64x2_t *)(v16 + 8);
      uint64_t v21 = v18 - v17;
      BOOL v20 = v18 == v17;
      if (v18 == v17) {
        uint64_t v22 = 0LL;
      }
      else {
        uint64_t v22 = *(void *)(v16 + 24);
      }
      if (v20)
      {
        int64x2_t v34 = *(int64x2_t *)(v16 + 8);
        uint64_t v24 = 0LL;
        uint64_t v31 = v21 >> 4;
      }

      else
      {
        unint64_t v23 = 0LL;
        uint64_t v24 = 0LL;
        __int16 v25 = (int *)(v22 + 12);
        do
        {
          int v26 = *((_DWORD *)__p[0] + *v25);
          if (v26 == -1)
          {
            uint64_t v28 = *(void *)(v25 - 3);
            v29.i64[0] = v28;
            v29.i64[1] = HIDWORD(v28);
            int64x2_t v19 = vaddq_s64(v19, vceqzq_s64(v29));
          }

          else
          {
            *__int16 v25 = v26;
            if (v23 != v24)
            {
              uint64_t v27 = v22 + 16 * v24;
              *(void *)uint64_t v27 = *(void *)(v25 - 3);
              *(_DWORD *)(v27 + 8) = *(v25 - 1);
              *(_DWORD *)(v27 + 12) = v26;
              uint64_t v14 = *v4;
            }

            ++v24;
          }

          uint64_t v16 = *(void *)(v14 + 8 * v15);
          ++v23;
          uint64_t v30 = *(void *)(v16 + 32) - *(void *)(v16 + 24);
          v25 += 4;
        }

        while (v23 < v30 >> 4);
        int64x2_t v34 = v19;
        uint64_t v31 = v30 >> 4;
      }

      sub_10002DB9C((void *)v16, v31 - v24);
      uint64_t v14 = *(void *)(a1 + 56);
      *(int64x2_t *)(*(void *)(v14 + 8 * v15++) + 8LL) = v34;
    }

    while (v15 < (*(void *)(a1 + 64) - v14) >> 3);
  }

  uint64_t v32 = *(int *)(a1 + 80);
  if ((_DWORD)v32 == -1)
  {
    __int128 v33 = __p[0];
    if (!__p[0]) {
      return;
    }
  }

  else
  {
    __int128 v33 = __p[0];
    *(_DWORD *)(a1 + 80) = *((_DWORD *)__p[0] + v32);
  }

  __p[1] = v33;
  operator delete(v33);
}

void sub_10008B4F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

BOOL sub_10008B518(uint64_t a1)
{
}

uint64_t sub_10008B534(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 24LL) + 16LL * *(void *)(a1 + 24);
}

uint64_t sub_10008B548(uint64_t result)
{
  return result;
}

uint64_t sub_10008B558(uint64_t a1)
{
  return *(void *)(a1 + 24);
}

uint64_t sub_10008B560(uint64_t result)
{
  *(void *)(result + ++*(void *)(result + 24) = 0LL;
  return result;
}

uint64_t sub_10008B568(uint64_t result, uint64_t a2)
{
  *(void *)(result + ++*(void *)(result + 24) = a2;
  return result;
}

uint64_t sub_10008B570()
{
  return 15LL;
}

int *sub_10008B57C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v5 = *(void *)(*(void *)(a1 + 8) + 24LL);
  uint64_t v6 = (int *)(v5 + 16 * v4);
  int v7 = *v6;
  int v8 = v6[1];
  if (v7 != v8) {
    **(void **)(a1 + 16) &= ~0x20000uLL;
  }
  if (v7)
  {
    if (!v8)
    {
      unint64_t v9 = *(unint64_t **)(a1 + 16);
      unint64_t v10 = *v9;
LABEL_8:
      *unint64_t v9 = v10 & 0xFFFFFFFFFBFFFFFFLL;
    }
  }

  else
  {
    unint64_t v9 = *(unint64_t **)(a1 + 16);
    unint64_t v11 = *v9;
    *v9 &= ~0x1000000uLL;
    if (!v8)
    {
      unint64_t v10 = v11 & 0xFFFFFFFFFEBFFFFFLL;
      *unint64_t v9 = v11 & 0xFFFFFFFFFEBFFFFFLL;
      goto LABEL_8;
    }
  }

  uint64_t v12 = v5 + 16 * v4;
  int v13 = sub_10002ADB0();
  float v15 = *(float *)(v12 + 8);
  uint64_t v14 = (float *)(v12 + 8);
  sub_10002E1E0(*(void **)(a1 + 8), a2, *(void *)(a1 + 24));
  int v16 = *(_DWORD *)a2;
  int v17 = *(_DWORD *)(a2 + 4);
  if (*(_DWORD *)a2 != v17) {
    **(void **)(a1 + 16) = **(void **)(a1 + 16) & 0xFFFFFFFFFFFCFFFFLL | 0x20000;
  }
  if (v16)
  {
    if (!v17)
    {
      uint64_t v18 = *(unint64_t **)(a1 + 16);
      unint64_t v19 = *v18;
LABEL_19:
      unint64_t *v18 = v19 & 0xFFFFFFFFF3FFFFFFLL | 0x4000000;
    }
  }

  else
  {
    uint64_t v18 = *(unint64_t **)(a1 + 16);
    unint64_t v20 = *v18 & 0xFFFFFFFFFCFFFFFFLL | 0x1000000;
    unint64_t *v18 = v20;
    if (!v17)
    {
      unint64_t v19 = v20 & 0xFFFFFFFFFD3FFFFFLL | 0x400000;
      unint64_t *v18 = v19;
      goto LABEL_19;
    }
  }

  uint64_t result = sub_10002ADB0();
  if (*(float *)(a2 + 8) != *(float *)result)
  {
    uint64_t result = sub_10002AD60();
  }

  **(void **)(a1 + 16) &= 0x30FC30007uLL;
  return result;
}

uint64_t sub_10008B760(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 8) = 7;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2D40;
  *(_OWORD *)(a1 + 16) = 0u;
  uint64_t v6 = (uint64_t *)(a1 + 16);
  int v7 = (uint64_t *)(a1 + 24);
  *(_OWORD *)(a1 + 48) = 0u;
  int v8 = (void *)(a1 + 48);
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 64) = 0LL;
  uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0x4E00000000LL, 0LL);
  if ((v9 & 0x4000000000LL) != 0 || (*(unsigned int (**)(uint64_t))(*(void *)a2 + 16LL))(a2) == -1)
  {
    unint64_t v23 = operator new(0x30uLL);
    v23[2] = 5;
    *((_BYTE *)v23 + 12) = 0;
    *(void *)unint64_t v23 = &off_1000D2DB8;
    *((void *)v23 + 2) = 0xFFFFFFFF00000000LL;
    *((void *)v23 + 4) = 0LL;
    *((void *)v23 + 5) = 0LL;
    *((void *)v23 + 3) = 0LL;
    uint64_t v24 = *v6;
    *uint64_t v6 = (uint64_t)v23;
    if (v24) {
      (*(void (**)(uint64_t))(*(void *)v24 + 8LL))(v24);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using state-order discipline", 39LL);
      goto LABEL_19;
    }
  }

  else if ((v9 & 0x800000000LL) != 0)
  {
    __int16 v25 = operator new(0x48uLL);
    sub_10008C4D0((uint64_t)v25, a2);
    uint64_t v26 = *v6;
    *uint64_t v6 = (uint64_t)v25;
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8LL))(v26);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
      goto LABEL_19;
    }
  }

  else
  {
    if ((v9 & 0x200000000LL) == 0)
    {
      __p[0] = v8;
      __p[1] = 0LL;
      uint64_t v66 = 0LL;
      unint64_t v67 = &v70;
      *(_OWORD *)int v68 = 0u;
      *(_OWORD *)char v69 = 0u;
      sub_100088FFC(a2, (uint64_t *)__p, 0);
      unint64_t v10 = *(int **)(a1 + 48);
      unint64_t v11 = *(int **)(a1 + 56);
      if (v10 != v11)
      {
        uint64_t v12 = v10 + 1;
        if (v10 + 1 != v11)
        {
          int v13 = *v10;
          uint64_t v14 = v10 + 1;
          do
          {
            int v16 = *v14++;
            int v15 = v16;
            BOOL v17 = v13 < v16;
            if (v13 <= v16) {
              int v13 = v15;
            }
            if (v17) {
              unint64_t v10 = v12;
            }
            uint64_t v12 = v14;
          }

          while (v14 != v11);
        }
      }

      int v18 = *v10;
      unint64_t v19 = *v10 + 1;
      sub_10007F734(v64, v19);
      if (a3)
      {
        unint64_t v20 = operator new(1uLL);
        uint64_t v21 = operator new(0x10uLL);
        void *v21 = a3;
        v21[1] = v20;
        uint64_t v22 = v21;
      }

      else
      {
        unint64_t v20 = 0LL;
        uint64_t v22 = 0LL;
      }

      sub_10008C17C(a2, v8, (uint64_t)v64, (uint64_t)v20, &v62, &v63);
      if (v63)
      {
        int64x2_t v29 = operator new(0x40uLL);
        v29[2] = 2;
        *((_BYTE *)v29 + 12) = 0;
        *(void *)int64x2_t v29 = off_1000D2E88;
        *((_OWORD *)v29 + 1) = 0u;
        *((_OWORD *)v29 + 2) = 0u;
        *((_OWORD *)v29 + 3) = 0u;
        uint64_t v30 = *v6;
        *uint64_t v6 = (uint64_t)v29;
        if (v30) {
          (*(void (**)(uint64_t))(*(void *)v30 + 8LL))(v30);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_40:
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_71:
        if (v22) {
          operator delete(v22);
        }
        if (v20) {
          operator delete(v20);
        }
        if (v64[0])
        {
          v64[1] = v64[0];
          operator delete(v64[0]);
        }

        __int128 v55 = (void **)v69[1];
        v69[1] = 0LL;
        if (v55) {
          sub_10002B7A4((int)&v69[1], v55);
        }
        sub_10002B764((void ***)v69, 0LL);
        uint64_t v56 = (void **)v68[1];
        v68[1] = 0LL;
        if (v56) {
          sub_10002B7A4((int)&v68[1], v56);
        }
        unint64_t v57 = (void **)v68[0];
        v68[0] = 0LL;
        if (v57) {
          sub_10002B7A4((int)v68, v57);
        }
        return a1;
      }

      if (v62)
      {
        uint64_t v31 = operator new(0x48uLL);
        sub_10007F848((uint64_t)v31, (uint64_t)v8);
        uint64_t v32 = *v6;
        *uint64_t v6 = (uint64_t)v31;
        if (v32) {
          (*(void (**)(uint64_t))(*(void *)v32 + 8LL))(v32);
        }
        if (dword_1000DE7E8 < 2) {
          goto LABEL_71;
        }
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using top-order discipline", 37LL);
        goto LABEL_40;
      }

      if (dword_1000DE7E8 >= 2)
      {
        sub_10000A2DC(v59, "INFO");
        sub_10002A9EC(&v61, (uint64_t)v59);
        sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using SCC meta-discipline", 36LL);
        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
      }

      sub_100069658((uint64_t)v7, v19);
      if (v18 < 0)
      {
LABEL_69:
        __int128 v53 = operator new(0x40uLL);
        _OWORD v53[2] = 6;
        *((_BYTE *)v53 + 12) = 0;
        *(void *)__int128 v53 = &off_1000D2FC0;
        *((void *)v53 + 2) = v7;
        *((void *)v53 + 3) = v8;
        *((void *)v53 + 4) = 0xFFFFFFFF00000000LL;
        *((void *)v53 + 6) = 0LL;
        *((void *)v53 + 7) = 0LL;
        *((void *)v53 + 5) = 0LL;
        uint64_t v54 = *v6;
        *uint64_t v6 = (uint64_t)v53;
        if (v54) {
          (*(void (**)(uint64_t))(*(void *)v54 + 8LL))(v54);
        }
        goto LABEL_71;
      }

      uint64_t v33 = 0LL;
      while (1)
      {
        int v34 = *((_DWORD *)v64[0] + v33);
        if (v34 == 3)
        {
          uint64_t v38 = *v7;
          uint64_t v39 = (char *)operator new(0x88uLL);
          *((_DWORD *)v39 + 2) = 3;
          v39[12] = 0;
          *(void *)uint64_t v39 = off_1000D2EF0;
          *((_OWORD *)v39 + 1) = *v22;
          *((_OWORD *)v39 + 2) = 0u;
          *((_OWORD *)v39 + 3) = 0u;
          *((_OWORD *)v39 + 4) = 0u;
          *((_OWORD *)v39 + 5) = 0u;
          *(_OWORD *)(v39 + 92) = 0u;
          *((void *)v39 + 15) = 0LL;
          *((void *)v39 + 16) = 0LL;
          *((void *)v39 + 14) = 0LL;
          uint64_t v40 = *(void *)(v38 + 8 * v33);
          *(void *)(v38 + 8 * v33) = v39;
          if (v40) {
            (*(void (**)(uint64_t))(*(void *)v40 + 8LL))(v40);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          unint64_t v41 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v42 = (void *)std::ostream::operator<<(v41, v33);
          sub_10002A6A4(v42, (uint64_t)": using shortest-first discipline", 33LL);
        }

        else if (v34 == 2)
        {
          uint64_t v43 = *v7;
          uint64_t v44 = operator new(0x40uLL);
          v44[2] = 2;
          *((_BYTE *)v44 + 12) = 0;
          *(void *)uint64_t v44 = off_1000D2E88;
          *((_OWORD *)v44 + 1) = 0u;
          *((_OWORD *)v44 + 2) = 0u;
          *((_OWORD *)v44 + 3) = 0u;
          uint64_t v45 = *(void *)(v43 + 8 * v33);
          *(void *)(v43 + 8 * v33) = v44;
          if (v45) {
            (*(void (**)(uint64_t))(*(void *)v45 + 8LL))(v45);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          unint64_t v46 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v47 = (void *)std::ostream::operator<<(v46, v33);
          sub_10002A6A4(v47, (uint64_t)": using LIFO discipline", 23LL);
        }

        else if (v34)
        {
          uint64_t v48 = *v7;
          uint64_t v49 = operator new(0x40uLL);
          v49[2] = 1;
          *((_BYTE *)v49 + 12) = 0;
          *(void *)uint64_t v49 = off_1000D2F58;
          *((_OWORD *)v49 + 1) = 0u;
          *((_OWORD *)v49 + 2) = 0u;
          *((_OWORD *)v49 + 3) = 0u;
          uint64_t v50 = *(void *)(v48 + 8 * v33);
          *(void *)(v48 + 8 * v33) = v49;
          if (v50) {
            (*(void (**)(uint64_t))(*(void *)v50 + 8LL))(v50);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          unint64_t v51 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v52 = (void *)std::ostream::operator<<(v51, v33);
          sub_10002A6A4(v52, (uint64_t)": using FIFO discipine", 22LL);
        }

        else
        {
          uint64_t v35 = *(void *)(*v7 + 8 * v33);
          *(void *)(*v7 + 8 * v33) = 0LL;
          if (v35) {
            (*(void (**)(uint64_t))(*(void *)v35 + 8LL))(v35);
          }
          if (dword_1000DE7E8 < 3) {
            goto LABEL_68;
          }
          sub_10000A2DC(v59, "INFO");
          sub_10002A9EC(&v61, (uint64_t)v59);
          uint64_t v36 = sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: SCC #", 16LL);
          uint64_t v37 = (void *)std::ostream::operator<<(v36, v33);
          sub_10002A6A4(v37, (uint64_t)": using trivial discipline", 26LL);
        }

        sub_10002AA94(&v61);
        if (v60 < 0) {
          operator delete(v59[0]);
        }
LABEL_68:
      }
    }

    uint64_t v27 = operator new(0x40uLL);
    v27[2] = 2;
    *((_BYTE *)v27 + 12) = 0;
    *(void *)uint64_t v27 = off_1000D2E88;
    *((_OWORD *)v27 + 1) = 0u;
    *((_OWORD *)v27 + 2) = 0u;
    *((_OWORD *)v27 + 3) = 0u;
    uint64_t v28 = *v6;
    *uint64_t v6 = (uint64_t)v27;
    if (v28) {
      (*(void (**)(uint64_t))(*(void *)v28 + 8LL))(v28);
    }
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v64, (uint64_t)__p);
      sub_10002A6A4(&std::cerr, (uint64_t)"AutoQueue: using LIFO discipline", 32LL);
LABEL_19:
      sub_10002AA94(v64);
      if (SHIBYTE(v66) < 0) {
        operator delete(__p[0]);
      }
    }
  }

  return a1;
}

void sub_10008BFE0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, char a16, char a17, void *a18, uint64_t a19, uint64_t a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a14 < 0)
  {
    operator delete(__p);
    if (v28)
    {
LABEL_10:
      operator delete(v28);
      if (!v29)
      {
LABEL_7:
        if (a18)
        {
          a19 = (uint64_t)a18;
          operator delete(a18);
        }

        sub_10002ACFC((void ***)&a21);
        uint64_t v32 = *v27;
        if (*v27)
        {
          *(void *)(v26 + 56) = v32;
          operator delete(v32);
        }

        sub_10006C65C((void ***)&a21);
        uint64_t v33 = *v30;
        *uint64_t v30 = 0LL;
        if (v33) {
          (*(void (**)(uint64_t))(*(void *)v33 + 8LL))(v33);
        }
        _Unwind_Resume(a1);
      }

uint64_t sub_10008C17C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5, _BYTE *a6)
{
  *a5 = 1;
  *a6 = 1;
  uint64_t v11 = *(void *)(a3 + 8) - *(void *)a3;
  if (v11)
  {
    unint64_t v12 = v11 >> 2;
    if (v12 <= 1) {
      unint64_t v12 = 1LL;
    }
    bzero(*(void **)a3, 4 * v12);
  }

  uint64_t v32 = 0LL;
  int v33 = 0;
  unsigned int v34 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v32);
  while (1)
  {
    uint64_t result = v32;
    if (!v32)
    {
LABEL_11:
      uint64_t v15 = v34;
      goto LABEL_12;
    }

    int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v32 + 16LL))(v32);
    uint64_t result = v32;
    if (v14) {
      break;
    }
    if (!v32) {
      goto LABEL_11;
    }
    uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v32 + 24LL))();
LABEL_12:
    unint64_t v31 = 0LL;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v15, &v29);
    uint64_t v16 = (int)v15;
    while (1)
    {
      if (!(void)v29)
      {
        goto LABEL_18;
      }

      if ((void)v29)
      {
        uint64_t v17 = (*(uint64_t (**)(void))(*(void *)v29 + 24LL))();
        goto LABEL_19;
      }

void sub_10008C46C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  if (a17) {
    (*(void (**)(uint64_t))(*(void *)a17 + 8LL))(a17);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10008C4D0(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 8) = 4;
  *(_BYTE *)(a1 + 12) = 0;
  *(void *)a1 = off_1000D2E20;
  *(void *)(a1 + 16) = 0xFFFFFFFF00000000LL;
  *(_OWORD *)(a1 + ++*(void *)(result + 24) = 0u;
  uint64_t v3 = a1 + 48;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  v9[0] = a1 + 24;
  v9[1] = &v11;
  unint64_t v10 = 0LL;
  sub_10008C698(a2, (uint64_t)v9, 0);
  if (!v11)
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v8, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"TopOrderQueue: FST is not acyclic", 33LL);
    sub_10002AA94(&v8);
    if (v7 < 0) {
      operator delete(__p[0]);
    }
    *(_BYTE *)(a1 + 12) = 1;
  }

  sub_10007EBF4(v3, (uint64_t)(*(void *)(a1 + 32) - *(void *)(a1 + 24)) >> 2, &dword_1000AF5EC);
  uint64_t v4 = (void **)v10;
  unint64_t v10 = 0LL;
  if (v4) {
    sub_10002B7A4((int)&v10, v4);
  }
  return a1;
}

void sub_10008C624( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20, void **a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21) {
    sub_10002B7A4(v23, a21);
  }
  uint64_t v26 = *v22;
  if (*v22)
  {
    *(void *)(v21 + 56) = v26;
    operator delete(v26);
  }

  uint64_t v27 = *v24;
  if (*v24)
  {
    *(void *)(v21 + 32) = v27;
    operator delete(v27);
  }

  _Unwind_Resume(exception_object);
}

void sub_10008C698(uint64_t a1, uint64_t a2, char a3)
{
  int v47 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  if (v47 == -1)
  {
    sub_10007ED84((char ***)a2);
    return;
  }

  uint64_t v58 = 0LL;
  __n128 v59 = 0LL;
  char v60 = 0LL;
  __int128 v57 = 0u;
  memset(v56, 0, sizeof(v56));
  sub_10002B8A4(v53, 64LL);
  __int128 v55 = 0LL;
  uint64_t v52 = off_1000D36C8;
  uint64_t v46 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 56LL))(a1, 1LL, 0LL);
  if (v46) {
    uint64_t v6 = sub_10008978C(a1);
  }
  else {
    uint64_t v6 = (v47 + 1);
  }
  if ((int)v6 <= (unint64_t)(v59 - v58))
  {
  }

  else
  {
    sub_10002BA28(&v58, (int)v6 - (v59 - v58), &unk_1000AFE5A);
  }

  uint64_t v49 = 0LL;
  int v50 = 0;
  int v51 = 0;
  (*(void (**)(uint64_t, uint64_t *))(*(void *)a1 + 112LL))(a1, &v49);
  uint64_t v7 = v47;
  char v45 = a3;
  do
  {
    v58[(int)v7] = 1;
    BOOL v8 = v55;
    if (v55)
    {
      __int128 v55 = (char *)*((void *)v55 + 6);
    }

    else
    {
      BOOL v8 = sub_10002BED8(v53, 1LL);
      *((void *)v8 + 6) = 0LL;
    }

    *(_DWORD *)BOOL v8 = v7;
    *(_OWORD *)(v8 + ++*(void *)(result + 24) = 0u;
    *((void *)v8 + 5) = 0LL;
    *(_OWORD *)(v8 + 8) = 0u;
    (*(void (**)(uint64_t, uint64_t, char *))(*(void *)a1 + 120LL))(a1, v7, v8 + 8);
    uint64_t v48 = v8;
    sub_100089908(v56, &v48);
    uint64_t v9 = *((void *)&v57 + 1);
    if (!*((void *)&v57 + 1))
    {
      char v10 = 1;
      if ((a3 & 1) != 0) {
        break;
      }
      goto LABEL_62;
    }

    char v10 = 1;
    do
    {
      char v11 = *(char **)(*(void *)(*((void *)&v56[0] + 1)
      unint64_t v12 = *(int *)v11;
      unint64_t v13 = v59 - v58;
      if (v59 - v58 <= v12)
      {
        uint64_t v6 = (v12 + 1);
        if ((int)v6 <= v13)
        {
        }

        else
        {
          sub_10002BA28(&v58, (int)v6 - v13, &unk_1000AFE5A);
        }
      }

      if ((v10 & 1) != 0)
      {
        uint64_t v14 = *((void *)v11 + 1);
        if (v14)
        {
          if (!(*(unsigned int (**)(uint64_t))(*(void *)v14 + 16LL))(v14))
          {
            uint64_t v15 = *((void *)v11 + 1);
            if (v15) {
              uint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 24LL))(v15);
            }
            else {
LABEL_28:
            }
              uint64_t v16 = *((void *)v11 + 2) + 16LL * *((void *)v11 + 5);
            unint64_t v17 = *(int *)(v16 + 12);
            uint64_t v18 = v58;
            unint64_t v19 = v59 - v58;
            if (v59 - v58 <= v17)
            {
              uint64_t v6 = (v17 + 1);
              if ((int)v6 <= v19)
              {
              }

              else
              {
                sub_10002BA28(&v58, (int)v6 - v19, &unk_1000AFE5A);
                unint64_t v17 = *(int *)(v16 + 12);
                uint64_t v18 = v58;
              }
            }

            int v25 = v18[v17];
            if (v25 == 1)
            {
              **(_BYTE **)(a2 + 8) = 0;
              uint64_t v27 = *((void *)v11 + 1);
              if (v27)
              {
                (*(void (**)(uint64_t))(*(void *)v27 + 32LL))(v27);
                char v10 = 0;
              }

              else
              {
                char v10 = 0;
                ++*((void *)v11 + 5);
              }
            }

            else
            {
              if (v25 == 2)
              {
                uint64_t v26 = *((void *)v11 + 1);
                if (v26) {
                  (*(void (**)(uint64_t))(*(void *)v26 + 32LL))(v26);
                }
                else {
                  ++*((void *)v11 + 5);
                }
              }

              else
              {
                v18[v17] = 1;
                uint64_t v28 = v55;
                if (v55)
                {
                  __int128 v55 = (char *)*((void *)v55 + 6);
                }

                else
                {
                  uint64_t v28 = sub_10002BED8(v53, 1LL);
                  *((void *)v28 + 6) = 0LL;
                }

                *(_DWORD *)uint64_t v28 = *(_DWORD *)(v16 + 12);
                *(_OWORD *)(v28 + ++*(void *)(result + 24) = 0u;
                *((void *)v28 + 5) = 0LL;
                *(_OWORD *)(v28 + 8) = 0u;
                (*(void (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
                uint64_t v48 = v28;
                sub_100089908(v56, &v48);
              }

              char v10 = 1;
            }

            goto LABEL_58;
          }
        }

        else if (*((void *)v11 + 5) < *((void *)v11 + 3))
        {
          goto LABEL_28;
        }
      }

      v58[v12] = 2;
      uint64_t v20 = *((void *)v11 + 1);
      if (v20)
      {
        (*(void (**)(uint64_t))(*(void *)v20 + 8LL))(v20);
      }

      else
      {
        uint64_t v21 = (_DWORD *)*((void *)v11 + 4);
        if (v21) {
          --*v21;
        }
      }

      *((void *)v11 + 6) = v55;
      __int128 v55 = v11;
      --*((void *)&v57 + 1);
      sub_10002C2E0(v56, 1);
      if (*((void *)&v57 + 1))
      {
        uint64_t v22 = *(void *)(*(void *)(*((void *)&v56[0] + 1)
        uint64_t v23 = *(void *)(v22 + 8);
        if (v23) {
          (*(void (**)(uint64_t))(*(void *)v23 + 24LL))(v23);
        }
        sub_10007EF2C(a2, v12);
        uint64_t v24 = *(void *)(v22 + 8);
        if (v24) {
          (*(void (**)(uint64_t))(*(void *)v24 + 32LL))(v24);
        }
        else {
          ++*(void *)(v22 + 40);
        }
      }

      else
      {
        sub_10007EF2C(a2, v12);
      }

void sub_10008CD88( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v16 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  uint64_t v20 = va_arg(va1, void);
  if (a7) {
    (*(void (**)(uint64_t))(*(void *)a7 + 8LL))(a7);
  }
  sub_10002B998((uint64_t *)va);
  sub_10002C34C((uint64_t *)va1);
  uint64_t v15 = *(void **)(v13 - 112);
  if (v15)
  {
    *(void *)(v13 - 104) = v15;
    operator delete(v15);
  }

  _Unwind_Resume(a1);
}

uint64_t sub_10008CE1C(void *a1, int a2)
{
  if ((*(unsigned int (**)(void))(*(void *)*a1 + 16LL))(*a1) == -1)
  {
    uint64_t result = (*(uint64_t (**)(void, uint64_t, void))(*(void *)*a1 + 56LL))(*a1, 4LL, 0LL);
    if (!result) {
      return result;
    }
    v181 = (char *)a1 + 140;
    goto LABEL_269;
  }

  (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 56LL))(*(void *)(a1[2] + 16LL));
  if (!*((_BYTE *)a1 + 33))
  {
    *(void *)(a1[1] + 8LL) = *(void *)a1[1];
    a1[6] = a1[5];
    a1[9] = a1[8];
    a1[12] = 0LL;
  }

  if (a2 == -1) {
    a2 = (*(uint64_t (**)(void))(*(void *)*a1 + 16LL))(*a1);
  }
  unint64_t v4 = a2;
  uint64_t v5 = a1[1];
  uint64_t v6 = (int **)(v5 + 8);
  if (a2 >= (unint64_t)((uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2))
  {
    v185 = (void **)(a1 + 5);
    uint64_t v7 = (void **)(a1 + 8);
    do
    {
      BOOL v8 = sub_10002ADB0();
      uint64_t v9 = v8;
      unint64_t v10 = *(void *)(v5 + 16);
      char v11 = *(int **)(v5 + 8);
      if ((unint64_t)v11 >= v10)
      {
        uint64_t v13 = *(int **)v5;
        uint64_t v14 = ((uint64_t)v11 - *(void *)v5) >> 2;
        unint64_t v15 = v14 + 1;
        uint64_t v16 = v10 - (void)v13;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          uint64_t v18 = (char *)sub_10002C050(v5 + 16, v17);
          char v11 = *v6;
          uint64_t v13 = *(int **)v5;
        }

        else
        {
          uint64_t v18 = 0LL;
        }

        uint64_t v19 = (int *)&v18[4 * v14];
        *uint64_t v19 = *v9;
        unint64_t v12 = v19 + 1;
        while (v11 != v13)
        {
          int v20 = *--v11;
          *--uint64_t v19 = v20;
        }

        *(void *)uint64_t v5 = v19;
        *uint64_t v6 = v12;
        *(void *)(v5 + 16) = &v18[4 * v17];
        if (v13) {
          operator delete(v13);
        }
      }

      else
      {
        *char v11 = *v8;
        unint64_t v12 = v11 + 1;
      }

      *uint64_t v6 = v12;
      int v21 = *sub_10002ADB0();
      uint64_t v23 = (int *)a1[6];
      unint64_t v22 = a1[7];
      if ((unint64_t)v23 >= v22)
      {
        int v25 = (int *)*v185;
        uint64_t v26 = ((char *)v23 - (_BYTE *)*v185) >> 2;
        unint64_t v27 = v26 + 1;
        if ((unint64_t)(v26 + 1) >> 62) {
LABEL_275:
        }
          sub_100018774();
        uint64_t v28 = v22 - (void)v25;
        if (v28 >> 1 > v27) {
          unint64_t v27 = v28 >> 1;
        }
        else {
          unint64_t v29 = v27;
        }
        if (v29)
        {
          uint64_t v30 = (char *)sub_10002C050((uint64_t)(a1 + 7), v29);
          int v25 = (int *)a1[5];
          uint64_t v23 = (int *)a1[6];
        }

        else
        {
          uint64_t v30 = 0LL;
        }

        unint64_t v31 = (int *)&v30[4 * v26];
        int *v31 = v21;
        uint64_t v24 = v31 + 1;
        while (v23 != v25)
        {
          int v32 = *--v23;
          *--unint64_t v31 = v32;
        }

        a1[5] = v31;
        a1[6] = v24;
        a1[7] = &v30[4 * v29];
        if (v25) {
          operator delete(v25);
        }
      }

      else
      {
        int *v23 = v21;
        uint64_t v24 = v23 + 1;
      }

      a1[6] = v24;
      int v33 = *sub_10002ADB0();
      unint64_t v35 = (int *)a1[9];
      unint64_t v34 = a1[10];
      if ((unint64_t)v35 >= v34)
      {
        uint64_t v37 = (int *)*v7;
        uint64_t v38 = ((char *)v35 - (_BYTE *)*v7) >> 2;
        unint64_t v39 = v38 + 1;
        uint64_t v40 = v34 - (void)v37;
        if (v40 >> 1 > v39) {
          unint64_t v39 = v40 >> 1;
        }
        else {
          unint64_t v41 = v39;
        }
        if (v41)
        {
          uint64_t v42 = (char *)sub_10002C050((uint64_t)(a1 + 10), v41);
          uint64_t v37 = (int *)a1[8];
          unint64_t v35 = (int *)a1[9];
        }

        else
        {
          uint64_t v42 = 0LL;
        }

        uint64_t v43 = (int *)&v42[4 * v38];
        int *v43 = v33;
        uint64_t v36 = v43 + 1;
        while (v35 != v37)
        {
          int v44 = *--v35;
          *--uint64_t v43 = v44;
        }

        a1[8] = v43;
        a1[9] = v36;
        a1[10] = &v42[4 * v41];
        if (v37) {
          operator delete(v37);
        }
      }

      else
      {
        int *v35 = v33;
        uint64_t v36 = v35 + 1;
      }

      a1[9] = v36;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
      uint64_t v5 = a1[1];
      uint64_t v6 = (int **)(v5 + 8);
    }

    while (v4 >= (uint64_t)(*(void *)(v5 + 8) - *(void *)v5) >> 2);
  }

  if (*((_BYTE *)a1 + 33))
  {
    char v45 = (char *)a1[14];
    uint64_t v46 = (char *)a1[15];
    unint64_t v47 = (v46 - v45) >> 2;
    if (v47 <= v4)
    {
      uint64_t v48 = a1 + 16;
      do
      {
        if ((unint64_t)v46 >= *v48)
        {
          unint64_t v50 = v47 + 1;
          if ((v47 + 1) >> 62) {
            sub_100018774();
          }
          uint64_t v51 = *v48 - (void)v45;
          if (v51 >> 1 > v50) {
            unint64_t v50 = v51 >> 1;
          }
          else {
            unint64_t v52 = v50;
          }
          if (v52)
          {
            __int128 v53 = (char *)sub_10002C050((uint64_t)(a1 + 16), v52);
            char v45 = (char *)a1[14];
            uint64_t v46 = (char *)a1[15];
          }

          else
          {
            __int128 v53 = 0LL;
          }

          uint64_t v54 = &v53[4 * v47];
          *(_DWORD *)uint64_t v54 = -1;
          uint64_t v49 = v54 + 4;
          while (v46 != v45)
          {
            int v55 = *((_DWORD *)v46 - 1);
            v46 -= 4;
            *((_DWORD *)v54 - 1) = v55;
            v54 -= 4;
          }

          a1[14] = v54;
          a1[15] = v49;
          a1[16] = &v53[4 * v52];
          if (v45)
          {
            operator delete(v45);
            char v45 = (char *)a1[14];
          }

          else
          {
            char v45 = v54;
          }
        }

        else
        {
          *(_DWORD *)uint64_t v46 = -1;
          uint64_t v49 = v46 + 4;
        }

        a1[15] = v49;
        unint64_t v47 = (v49 - v45) >> 2;
        uint64_t v46 = v49;
      }

      while (v47 <= v4);
    }

    *(_DWORD *)&v45[4 * v4] = *((_DWORD *)a1 + 34);
  }

  *(_DWORD *)(*(void *)a1[1] + 4 * v4) = *sub_10002AD60();
  uint64_t v56 = a1[5];
  v184 = (void **)(a1 + 5);
  *(_DWORD *)(v56 + 4 * v4) = *sub_10002AD60();
  uint64_t v57 = a1[8];
  v186 = (void **)(a1 + 8);
  *(_DWORD *)(v57 + 4 * v4) = *sub_10002AD60();
  *(void *)(a1[11] + ((v4 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << v4;
  (*(void (**)(void, unint64_t))(**(void **)(a1[2] + 16LL) + 24LL))(*(void *)(a1[2] + 16LL), v4);
  uint64_t v182 = (uint64_t)(a1 + 10);
  uint64_t v183 = (uint64_t)(a1 + 7);
  uint64_t v58 = a1 + 16;
  v181 = (char *)a1 + 140;
  do
  {
    int v60 = (*(uint64_t (**)(void))(**(void **)(a1[2] + 16LL) + 16LL))(*(void *)(a1[2] + 16LL));
    (*(void (**)(void))(**(void **)(a1[2] + 16LL) + 32LL))(*(void *)(a1[2] + 16LL));
    unint64_t v61 = v60;
    while (1)
    {
      char v62 = (int **)a1[1];
      char v63 = v62 + 1;
      if (v61 < v62[1] - *v62) {
        break;
      }
      int v64 = sub_10002ADB0();
      unint64_t v65 = v64;
      unint64_t v66 = (unint64_t)v62[2];
      unint64_t v67 = v62[1];
      if ((unint64_t)v67 >= v66)
      {
        char v69 = *v62;
        uint64_t v70 = v67 - *v62;
        unint64_t v71 = v70 + 1;
        uint64_t v72 = v66 - (void)v69;
        if (v72 >> 1 > v71) {
          unint64_t v71 = v72 >> 1;
        }
        else {
          unint64_t v73 = v71;
        }
        if (v73)
        {
          __int128 v74 = (char *)sub_10002C050((uint64_t)(v62 + 2), v73);
          unint64_t v67 = *v63;
          char v69 = *v62;
        }

        else
        {
          __int128 v74 = 0LL;
        }

        __int128 v75 = (int *)&v74[4 * v70];
        *__int128 v75 = *v65;
        int v68 = v75 + 1;
        while (v67 != v69)
        {
          int v76 = *--v67;
          *--__int128 v75 = v76;
        }

        *char v62 = v75;
        int *v63 = v68;
        v62[2] = (int *)&v74[4 * v73];
        if (v69) {
          operator delete(v69);
        }
      }

      else
      {
        *unint64_t v67 = *v64;
        int v68 = v67 + 1;
      }

      int *v63 = v68;
      int v77 = *sub_10002ADB0();
      uint64_t v79 = (int *)a1[6];
      unint64_t v78 = a1[7];
      if ((unint64_t)v79 >= v78)
      {
        int v81 = (int *)*v184;
        uint64_t v82 = ((char *)v79 - (_BYTE *)*v184) >> 2;
        unint64_t v83 = v82 + 1;
        uint64_t v84 = v78 - (void)v81;
        if (v84 >> 1 > v83) {
          unint64_t v83 = v84 >> 1;
        }
        else {
          unint64_t v85 = v83;
        }
        if (v85)
        {
          char v86 = (char *)sub_10002C050(v183, v85);
          int v81 = (int *)a1[5];
          uint64_t v79 = (int *)a1[6];
        }

        else
        {
          char v86 = 0LL;
        }

        int v87 = (int *)&v86[4 * v82];
        *int v87 = v77;
        float v80 = v87 + 1;
        while (v79 != v81)
        {
          int v88 = *--v79;
          *--int v87 = v88;
        }

        a1[5] = v87;
        a1[6] = v80;
        a1[7] = &v86[4 * v85];
        if (v81) {
          operator delete(v81);
        }
      }

      else
      {
        *uint64_t v79 = v77;
        float v80 = v79 + 1;
      }

      a1[6] = v80;
      int v89 = *sub_10002ADB0();
      v91 = (int *)a1[9];
      unint64_t v90 = a1[10];
      if ((unint64_t)v91 >= v90)
      {
        char v93 = (int *)*v186;
        uint64_t v94 = ((char *)v91 - (_BYTE *)*v186) >> 2;
        unint64_t v95 = v94 + 1;
        uint64_t v96 = v90 - (void)v93;
        if (v96 >> 1 > v95) {
          unint64_t v95 = v96 >> 1;
        }
        else {
          unint64_t v97 = v95;
        }
        if (v97)
        {
          v98 = (char *)sub_10002C050(v182, v97);
          char v93 = (int *)a1[8];
          v91 = (int *)a1[9];
        }

        else
        {
          v98 = 0LL;
        }

        v99 = (int *)&v98[4 * v94];
        int *v99 = v89;
        unint64_t v92 = v99 + 1;
        while (v91 != v93)
        {
          int v100 = *--v91;
          *--v99 = v100;
        }

        a1[8] = v99;
        a1[9] = v92;
        a1[10] = &v98[4 * v97];
        if (v93) {
          operator delete(v93);
        }
      }

      else
      {
        int *v91 = v89;
        unint64_t v92 = v91 + 1;
      }

      a1[9] = v92;
      LOBYTE(v187) = 0;
      sub_10002BFAC((uint64_t)(a1 + 11), &v187);
    }

    if (*((_BYTE *)a1 + 32))
    {
      (*(void (**)(uint64_t *__return_ptr, void, unint64_t))(*(void *)*a1 + 24LL))(&v190, *a1, v61);
      int v101 = sub_10002ADB0();
      LODWORD(v187) = v190;
      HIDWORD(v190) = *v101;
      v59.n128_u32[0] = v190;
      if (*(float *)&v190 != *((float *)&v190 + 1))
      {
LABEL_265:
        ++*((_DWORD *)a1 + 34);
        uint64_t result = (*(uint64_t (**)(void, uint64_t, void, __n128))(*(void *)*a1 + 56LL))( *a1,  4LL,  0LL,  v59);
        if (!result) {
          return result;
        }
LABEL_269:
        _BYTE *v181 = 1;
        return result;
      }
    }

    *(void *)(a1[11] + ((v61 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v61);
    uint64_t v102 = a1[8];
    float v103 = *(float *)(v102 + 4 * v61);
    *(_DWORD *)(v102 + 4 * v61) = *sub_10002ADB0();
    uint64_t v104 = *a1;
    __int128 v187 = 0u;
    __int128 v188 = 0u;
    unint64_t v189 = 0LL;
    (*(void (**)(uint64_t, unint64_t, __int128 *))(*(void *)v104 + 120LL))(v104, v61, &v187);
    while (1)
    {
      if ((void)v187)
      {
        if ((void)v187)
        {
          uint64_t v105 = (*(uint64_t (**)(void))(*(void *)v187 + 24LL))(v187);
          goto LABEL_141;
        }
      }

      else if (v189 >= (unint64_t)v188)
      {
LABEL_257:
        char v179 = 1;
        goto LABEL_259;
      }

      uint64_t v105 = *((void *)&v187 + 1) + 16 * v189;
LABEL_141:
      uint64_t v106 = a1[1];
      v107 = (int **)(v106 + 8);
      for (unint64_t i = *(int *)(v105 + 12); i >= (uint64_t)(*(void *)(v106 + 8) - *(void *)v106) >> 2; unint64_t i = *(int *)(v105 + 12))
      {
        v109 = sub_10002ADB0();
        v110 = v109;
        v111 = *v107;
        unint64_t v112 = *(void *)(v106 + 16);
        if ((unint64_t)*v107 >= v112)
        {
          v114 = *(int **)v106;
          uint64_t v115 = ((uint64_t)v111 - *(void *)v106) >> 2;
          unint64_t v116 = v115 + 1;
          uint64_t v117 = v112 - (void)v114;
          if (v117 >> 1 > v116) {
            unint64_t v116 = v117 >> 1;
          }
          else {
            unint64_t v118 = v116;
          }
          if (v118)
          {
            v119 = (char *)sub_10002C050(v106 + 16, v118);
            v111 = *v107;
            v114 = *(int **)v106;
          }

          else
          {
            v119 = 0LL;
          }

          v120 = (int *)&v119[4 * v115];
          int *v120 = *v110;
          v113 = v120 + 1;
          while (v111 != v114)
          {
            int v121 = *--v111;
            *--v120 = v121;
          }

          *(void *)uint64_t v106 = v120;
          *v107 = v113;
          *(void *)(v106 + 16) = &v119[4 * v118];
          if (v114) {
            operator delete(v114);
          }
        }

        else
        {
          int *v111 = *v109;
          v113 = v111 + 1;
        }

        *v107 = v113;
        int v122 = *sub_10002ADB0();
        v124 = (int *)a1[6];
        unint64_t v123 = a1[7];
        if ((unint64_t)v124 >= v123)
        {
          v126 = (int *)*v184;
          uint64_t v127 = ((char *)v124 - (_BYTE *)*v184) >> 2;
          unint64_t v128 = v127 + 1;
          uint64_t v129 = v123 - (void)v126;
          if (v129 >> 1 > v128) {
            unint64_t v128 = v129 >> 1;
          }
          else {
            unint64_t v130 = v128;
          }
          if (v130)
          {
            v131 = (char *)sub_10002C050(v183, v130);
            v126 = (int *)a1[5];
            v124 = (int *)a1[6];
          }

          else
          {
            v131 = 0LL;
          }

          v132 = (int *)&v131[4 * v127];
          int *v132 = v122;
          v125 = v132 + 1;
          while (v124 != v126)
          {
            int v133 = *--v124;
            *--v132 = v133;
          }

          a1[5] = v132;
          a1[6] = v125;
          a1[7] = &v131[4 * v130];
          if (v126) {
            operator delete(v126);
          }
        }

        else
        {
          int *v124 = v122;
          v125 = v124 + 1;
        }

        a1[6] = v125;
        int v134 = *sub_10002ADB0();
        v136 = (int *)a1[9];
        unint64_t v135 = a1[10];
        if ((unint64_t)v136 >= v135)
        {
          v138 = (int *)*v186;
          uint64_t v139 = ((char *)v136 - (_BYTE *)*v186) >> 2;
          unint64_t v140 = v139 + 1;
          uint64_t v141 = v135 - (void)v138;
          if (v141 >> 1 > v140) {
            unint64_t v140 = v141 >> 1;
          }
          else {
            unint64_t v142 = v140;
          }
          if (v142)
          {
            v143 = (char *)sub_10002C050(v182, v142);
            v138 = (int *)a1[8];
            v136 = (int *)a1[9];
          }

          else
          {
            v143 = 0LL;
          }

          v144 = (int *)&v143[4 * v139];
          int *v144 = v134;
          v137 = v144 + 1;
          while (v136 != v138)
          {
            int v145 = *--v136;
            *--v144 = v145;
          }

          a1[8] = v144;
          a1[9] = v137;
          a1[10] = &v143[4 * v142];
          if (v138) {
            operator delete(v138);
          }
        }

        else
        {
          int *v136 = v134;
          v137 = v136 + 1;
        }

        a1[9] = v137;
        BYTE4(v190) = 0;
        sub_10002BFAC((uint64_t)(a1 + 11), (_BYTE *)&v190 + 4);
        uint64_t v106 = a1[1];
        v107 = (int **)(v106 + 8);
      }

      if (*((_BYTE *)a1 + 33))
      {
        v146 = (char *)a1[14];
        v147 = (char *)a1[15];
        unint64_t v148 = (v147 - v146) >> 2;
        if (v148 <= (int)i)
        {
          do
          {
            if ((unint64_t)v147 >= *v58)
            {
              unint64_t v151 = v148 + 1;
              if ((v148 + 1) >> 62) {
                sub_100018774();
              }
              uint64_t v152 = *v58 - (void)v146;
              if (v152 >> 1 > v151) {
                unint64_t v151 = v152 >> 1;
              }
              else {
                unint64_t v153 = v151;
              }
              if (v153)
              {
                v154 = (char *)sub_10002C050((uint64_t)(a1 + 16), v153);
                v146 = (char *)a1[14];
                v147 = (char *)a1[15];
              }

              else
              {
                v154 = 0LL;
              }

              v155 = &v154[4 * v148];
              *(_DWORD *)v155 = -1;
              v150 = v155 + 4;
              while (v147 != v146)
              {
                int v156 = *((_DWORD *)v147 - 1);
                v147 -= 4;
                *((_DWORD *)v155 - 1) = v156;
                v155 -= 4;
              }

              a1[14] = v155;
              a1[15] = v150;
              a1[16] = &v154[4 * v153];
              if (v146)
              {
                operator delete(v146);
                v146 = (char *)a1[14];
              }

              else
              {
                v146 = v155;
              }
            }

            else
            {
              *(_DWORD *)v147 = -1;
              v150 = v147 + 4;
            }

            a1[15] = v150;
            unint64_t v148 = (v150 - v146) >> 2;
            int v157 = *(_DWORD *)(v105 + 12);
            v147 = v150;
          }

          while (v148 <= v157);
          uint64_t v149 = v157;
          LODWORD(i) = *(_DWORD *)(v105 + 12);
        }

        else
        {
          uint64_t v149 = (int)i;
        }

        if (*(_DWORD *)&v146[4 * v149] != *((_DWORD *)a1 + 34))
        {
          v158 = sub_10002ADB0();
          uint64_t v159 = *(int *)(v105 + 12);
          *(_DWORD *)(*(void *)a1[1] + 4 * v159) = *v158;
          uint64_t v160 = a1[5];
          *(_DWORD *)(v160 + 4 * v159) = *sub_10002ADB0();
          uint64_t v161 = *(int *)(v105 + 12);
          unint64_t i = (unint64_t)*v186;
          *(_DWORD *)(i + 4 * v161) = *sub_10002ADB0();
          unint64_t v162 = *(int *)(v105 + 12);
          *(void *)(a1[11] + ((v162 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v162);
          *(_DWORD *)(a1[14] + 4 * v162) = *((_DWORD *)a1 + 34);
          LODWORD(i) = *(_DWORD *)(v105 + 12);
        }
      }

      uint64_t v163 = *(void *)a1[1];
      uint64_t v164 = a1[5];
      uint64_t v165 = a1[8];
      if (v103 == -INFINITY || (float v166 = *(float *)(v105 + 8), v166 >= -INFINITY) && v166 <= -INFINITY)
      {
        float v167 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v168 = v166 == INFINITY || v103 == INFINITY;
        float v169 = v103 + v166;
        float v167 = v168 ? INFINITY : v169;
      }

      float v170 = *(float *)(v163 + 4LL * (int)i);
      if (v170 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
      {
        float v171 = *(float *)sub_1000606CC();
        float v170 = *(float *)(v163 + 4LL * (int)i);
      }

      else
      {
        float v171 = v170 >= v167 ? v167 : *(float *)(v163 + 4LL * (int)i);
      }

      float v172 = *((float *)a1 + 7);
      float v173 = v171 + v172;
      float v174 = v172 + v170;
      if (v170 > v173 || v171 > v174) {
        break;
      }
LABEL_254:
      if ((void)v187) {
        (*(void (**)(void))(*(void *)v187 + 32LL))(v187);
      }
      else {
        ++v189;
      }
    }

    float v176 = *(float *)(v164 + 4LL * (int)i);
    if (v176 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v176 = *(float *)sub_1000606CC();
    }

    else if (v176 >= v167)
    {
      float v176 = v167;
    }

    *(float *)(v164 + 4LL * (int)i) = v176;
    *(float *)(v163 + 4LL * (int)i) = v176;
    float v177 = *(float *)(v165 + 4LL * (int)i);
    if (v177 == -INFINITY || v167 >= -INFINITY && v167 <= -INFINITY)
    {
      float v177 = *(float *)sub_1000606CC();
    }

    else if (v177 >= v167)
    {
      float v177 = v167;
    }

    *(float *)(v165 + 4LL * (int)i) = v177;
    if (*(float *)(v163 + 4LL * (int)i) != -INFINITY && v177 != -INFINITY)
    {
      uint64_t v178 = **(void **)(a1[2] + 16LL);
      if (((*(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> *(_DWORD *)(v105 + 12)) & 1) != 0)
      {
        (*(void (**)(void))(v178 + 40))();
      }

      else
      {
        (*(void (**)(void))(v178 + 24))();
        *(void *)(a1[11] + (((unint64_t)*(int *)(v105 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << *(_DWORD *)(v105 + 12);
      }

      goto LABEL_254;
    }

    char v179 = 0;
    _BYTE *v181 = 1;
LABEL_259:
    uint64_t result = v187;
    if ((void)v187)
    {
      uint64_t result = (*(uint64_t (**)(void))(*(void *)v187 + 8LL))(v187);
    }

    else if (*((void *)&v188 + 1))
    {
      --**((_DWORD **)&v188 + 1);
    }
  }

  while ((v179 & 1) != 0);
  return result;
}

void sub_10008DD14( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18)
{
  if (a15)
  {
    (*(void (**)(uint64_t))(*(void *)a15 + 8LL))(a15);
  }

  else if (a18)
  {
    --*a18;
  }

  _Unwind_Resume(exception_object);
}

void sub_10008DD80(void **a1, unint64_t a2, _DWORD *a3)
{
  BOOL v8 = a1[2];
  uint64_t v6 = (uint64_t)(a1 + 2);
  uint64_t v7 = v8;
  uint64_t v9 = *(_DWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 2)
  {
    if (a2)
    {
      uint64_t v16 = 4 * a2;
      unint64_t v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 4LL;
      }

      while (v16);
      uint64_t v9 = v17;
    }

    a1[1] = v9;
  }

  else
  {
    uint64_t v10 = (char *)v9 - (_BYTE *)*a1;
    unint64_t v11 = a2 + (v10 >> 2);
    if (v11 >> 62) {
      sub_100018774();
    }
    uint64_t v12 = v10 >> 2;
    uint64_t v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 1 > v11) {
      unint64_t v11 = v13 >> 1;
    }
    else {
      unint64_t v14 = v11;
    }
    if (v14) {
      unint64_t v15 = (char *)sub_10002C050(v6, v14);
    }
    else {
      unint64_t v15 = 0LL;
    }
    uint64_t v18 = &v15[4 * v12];
    uint64_t v19 = &v18[4 * a2];
    uint64_t v20 = 4 * a2;
    int v21 = v18;
    do
    {
      *(_DWORD *)int v21 = *a3;
      v21 += 4;
      v20 -= 4LL;
    }

    while (v20);
    unint64_t v22 = &v15[4 * v14];
    uint64_t v23 = (char *)*a1;
    for (unint64_t i = (char *)a1[1]; i != v23; i -= 4)
    {
      int v25 = *((_DWORD *)i - 1);
      *((_DWORD *)v18 - 1) = v25;
      v18 -= 4;
    }

    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23) {
      operator delete(v23);
    }
  }

void *sub_10008DE90(void *a1, unint64_t a2, void *a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100076100(a1, a2);
    uint64_t v6 = (void *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8LL;
    }

    while (v8);
    a1[1] = v7;
  }

  return a1;
}

void sub_10008DEF4(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_10008DF10(uint64_t a1, int *a2, int a3)
{
  unsigned int v3 = a3;
  if (a3 >= 1)
  {
    uint64_t v6 = *(void *)(a1 + 72);
    while (1)
    {
      unsigned int v7 = v3 - 1;
      uint64_t v8 = (v3 - 1) >> 1;
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v10 = *(int *)(v9 + 4LL * v3);
      uint64_t v11 = *(int *)(v9 + 4 * v8);
      *(_DWORD *)(v9 + 4LL * v3) = v11;
      uint64_t v12 = *(void *)(a1 + 24);
      *(_DWORD *)(v12 + 4 * v11) = v3;
      *(_DWORD *)(v9 + 4 * v8) = v10;
      *(_DWORD *)(v12 + 4 * v10) = v8;
      uint64_t v6 = *(void *)(a1 + 72);
      LODWORD(v10) = *(_DWORD *)(v6 + 4LL * v3);
      *(_DWORD *)(v6 + 4LL * v3) = *(_DWORD *)(v6 + 4 * v8);
      *(_DWORD *)(v6 + 4 * v8) = v10;
      unsigned int v3 = v7 >> 1;
      if (v7 <= 1) {
        return *(unsigned int *)(*(void *)(a1 + 48) + 4LL * (int)v8);
      }
    }
  }

  LODWORD(v8) = v3;
  return *(unsigned int *)(*(void *)(a1 + 48) + 4LL * (int)v8);
}

BOOL sub_10008DFBC(uint64_t **a1, int a2, int a3)
{
  unint64_t v5 = a2;
  uint64_t v6 = **a1;
  else {
    unsigned int v7 = (int *)(v6 + 4LL * a2);
  }
  float v8 = *(float *)v7;
  uint64_t v9 = *a1[1];
  if (v5 >= (a1[1][1] - v9) >> 2) {
    uint64_t v10 = sub_10002ADB0();
  }
  else {
    uint64_t v10 = (int *)(v9 + 4 * v5);
  }
  if (v8 == -INFINITY || (float v11 = *(float *)v10, *(float *)v10 >= -INFINITY) && *(float *)v10 <= -INFINITY)
  {
    float v12 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v13 = v11 == INFINITY || v8 == INFINITY;
    float v12 = v8 + v11;
    if (v13) {
      float v12 = INFINITY;
    }
  }

  float v24 = v12;
  uint64_t v14 = **a1;
  else {
    unint64_t v15 = (int *)(v14 + 4LL * a3);
  }
  float v16 = *(float *)v15;
  uint64_t v17 = *a1[1];
  else {
    uint64_t v18 = (int *)(v17 + 4LL * a3);
  }
  if (v16 == -INFINITY || (float v19 = *(float *)v18, *(float *)v18 >= -INFINITY) && *(float *)v18 <= -INFINITY)
  {
    float v20 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v21 = v19 == INFINITY || v16 == INFINITY;
    float v20 = v16 + v19;
    if (v21) {
      float v20 = INFINITY;
    }
  }

  float v23 = v20;
  return sub_10007F7A8((uint64_t)(a1 + 2), &v24, &v23);
}

BOOL sub_10008E134(BOOL result, uint64_t a2)
{
  uint64_t v3 = result;
  while (1)
  {
    uint64_t v4 = (2 * (_DWORD)a2) | 1u;
    if ((int)v4 >= *(_DWORD *)(v3 + 96)
      || !(uint64_t result = sub_10008DFBC( (uint64_t **)v3,  *(_DWORD *)(*(void *)(v3 + 72) + 4LL * (int)v4),  *(_DWORD *)(*(void *)(v3 + 72) + 4LL * (int)a2))))
    {
      uint64_t v4 = a2;
    }

    unsigned int v5 = 2 * a2 + 2;
    if ((signed int)v5 < *(_DWORD *)(v3 + 96))
    {
      uint64_t result = sub_10008DFBC( (uint64_t **)v3,  *(_DWORD *)(*(void *)(v3 + 72) + 4LL * (int)v5),  *(_DWORD *)(*(void *)(v3 + 72) + 4LL * (int)v4));
      if (result) {
        uint64_t v4 = v5;
      }
      else {
        uint64_t v4 = v4;
      }
    }

    if ((_DWORD)v4 == (_DWORD)a2) {
      break;
    }
    uint64_t v6 = *(void *)(v3 + 48);
    uint64_t v7 = *(int *)(v6 + 4LL * (int)a2);
    uint64_t v8 = *(int *)(v6 + 4LL * (int)v4);
    *(_DWORD *)(v6 + 4LL * (int)a2) = v8;
    uint64_t v9 = *(void *)(v3 + 24);
    *(_DWORD *)(v9 + 4 * v8) = a2;
    *(_DWORD *)(v6 + 4LL * (int)v4) = v7;
    *(_DWORD *)(v9 + 4 * v7) = v4;
    uint64_t v10 = *(void *)(v3 + 72);
    LODWORD(v7) = *(_DWORD *)(v10 + 4LL * (int)a2);
    *(_DWORD *)(v10 + 4LL * (int)a2) = *(_DWORD *)(v10 + 4LL * (int)v4);
    *(_DWORD *)(v10 + 4LL * (int)v4) = v7;
    a2 = v4;
  }

  return result;
}

void *sub_10008E200(void *a1)
{
  uint64_t v2 = (void *)a1[36];
  if (v2)
  {
    a1[37] = v2;
    operator delete(v2);
  }

  uint64_t v3 = (void *)a1[35];
  if (v3)
  {
    do
    {
      uint64_t v4 = (void *)*v3;
      operator delete(v3);
      uint64_t v3 = v4;
    }

    while (v4);
  }

  a1[35] = 0LL;
  unsigned int v5 = (void *)a1[32];
  if (v5) {
    operator delete(v5);
  }
  sub_10007F2B8(a1 + 26);
  sub_10001A760((uint64_t)(a1 + 20));
  uint64_t v6 = (void *)a1[16];
  if (v6)
  {
    a1[17] = v6;
    operator delete(v6);
  }

  uint64_t v7 = (void *)a1[13];
  if (v7) {
    operator delete(v7);
  }
  uint64_t v8 = (void *)a1[10];
  if (v8)
  {
    a1[11] = v8;
    operator delete(v8);
  }

  uint64_t v9 = (void *)a1[7];
  if (v9)
  {
    a1[8] = v9;
    operator delete(v9);
  }

  return a1;
}

uint64_t sub_10008E2A4(uint64_t a1)
{
  *(void *)a1 = off_1000D2D40;
  uint64_t v2 = *(void **)(a1 + 48);
  if (v2)
  {
    *(void *)(a1 + 56) = v2;
    operator delete(v2);
  }

  unsigned int v5 = (void **)(a1 + 24);
  sub_10006C65C(&v5);
  uint64_t v3 = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = 0LL;
  if (v3) {
    (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
  }
  return a1;
}

uint64_t sub_10008E310(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v8[0] = byte_1000DDB00;
  uint64_t v9 = qword_1000DDB08;
  sub_10008EAD4((uint64_t)v8, &v10);
  uint64_t v6 = v10;
  *(_OWORD *)(a1 + 8) = v10;
  *(void *)a1 = off_1000D37B0;
  sub_10008E3C0(v6, a2, a3);
  return a1;
}

void sub_10008E3A0(_Unwind_Exception *a1)
{
  void *v1 = off_1000D3928;
  sub_100017FC4(v2);
  _Unwind_Resume(a1);
}

uint64_t sub_10008E3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 112);
  *(void *)(a1 + 112) = 0LL;
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
  }
  uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0xFFFFFFFF0007LL, 0LL);
  uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a3 + 56LL))(a3, 0xFFFFFFFF0007LL, 0LL);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  if (v9) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16LL))(v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v10;
  if (v11) {
    (*(void (**)(uint64_t))(*(void *)v11 + 8LL))(v11);
  }
  uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
  if (v12) {
    uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 16LL))(v12);
  }
  else {
    uint64_t v13 = 0LL;
  }
  uint64_t v14 = *(void *)(a1 + 48);
  *(void *)(a1 + 48) = v13;
  if (v14) {
    (*(void (**)(uint64_t))(*(void *)v14 + 8LL))(v14);
  }
  sub_100029F78(a1 + 56);
  sub_100029F78(a1 + 56);
  sub_10002D714(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 64);
  *(_DWORD *)(v15 + 80) = 0;
  unint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)v15 + 16LL))(v15);
  *(void *)(v15 + 8) = v16 & 0xCCCFFFFF0007LL | (((v16 >> 35) & 1) << 37) | *(void *)(v15 + 8) & 4LL;
  int v17 = *sub_10002AD60();
  sub_10002D714(a1 + 56);
  uint64_t v18 = *(void **)(a1 + 64);
  LODWORD(v54) = v17;
  float v19 = sub_10002D840(v18, 1, (float *)&v54);
  uint64_t v20 = (*(uint64_t (**)(uint64_t, float))(*(void *)a2 + 96LL))(a2, v19);
  sub_10002A36C(a1 + 56, v20);
  uint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
  sub_10002A3D4(a1 + 56, v21);
  *(_DWORD *)(a1 + 80) = 2;
  int v22 = *sub_10002AD60();
  unint64_t v54 = 0xFFFFFFFF00000000LL;
  int v55 = v22;
  int v56 = 1;
  sub_10002D714(a1 + 56);
  sub_10002D8BC(*(void **)(a1 + 64), 0, (float *)&v54);
  int v23 = *sub_10002AD60();
  unint64_t v54 = 0xFFFFFFFE00000000LL;
  int v55 = v23;
  int v56 = 1;
  sub_10002D714(a1 + 56);
  sub_10002D8BC(*(void **)(a1 + 64), 0, (float *)&v54);
  uint64_t v24 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 72LL))(a2, 0LL);
  uint64_t v25 = v24;
  unint64_t v26 = *(void *)(a1 + 104);
  unint64_t v27 = (char **)(a1 + 88);
  unint64_t v28 = *(void *)(a1 + 96);
  if (v28 >= v26)
  {
    uint64_t v30 = (uint64_t)(v28 - (void)*v27) >> 4;
    unint64_t v31 = v30 + 1;
    uint64_t v32 = v26 - (void)*v27;
    if (v32 >> 3 > v31) {
      unint64_t v31 = v32 >> 3;
    }
    else {
      unint64_t v33 = v31;
    }
    if (v33) {
      unint64_t v34 = (char *)sub_1000198A8(a1 + 104, v33);
    }
    else {
      unint64_t v34 = 0LL;
    }
    unint64_t v35 = &v34[16 * v30];
    uint64_t v36 = &v34[16 * v33];
    *(_DWORD *)unint64_t v35 = -1;
    *((void *)v35 + 1) = v25;
    unint64_t v29 = v35 + 16;
    uint64_t v38 = *(char **)(a1 + 88);
    uint64_t v37 = *(char **)(a1 + 96);
    if (v37 != v38)
    {
      do
      {
        *((_OWORD *)v35 - 1) = *((_OWORD *)v37 - 1);
        v35 -= 16;
        v37 -= 16;
      }

      while (v37 != v38);
      uint64_t v37 = *v27;
    }

    *(void *)(a1 + 88) = v35;
    *(void *)(a1 + 96) = v29;
    *(void *)(a1 + 104) = v36;
    if (v37) {
      operator delete(v37);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v28 = -1;
    *(void *)(v28 + 8) = v24;
    unint64_t v29 = (char *)(v28 + 16);
  }

  *(void *)(a1 + 96) = v29;
  uint64_t v39 = (*(uint64_t (**)(uint64_t, void))(*(void *)a3 + 72LL))(a3, 0LL);
  uint64_t v40 = v39;
  unint64_t v42 = *(void *)(a1 + 96);
  unint64_t v41 = *(void *)(a1 + 104);
  if (v42 < v41)
  {
    *(_DWORD *)unint64_t v42 = -2;
    *(void *)(v42 + 8) = v39;
    uint64_t v43 = (char *)(v42 + 16);
    goto LABEL_45;
  }

  uint64_t v44 = (uint64_t)(v42 - (void)*v27) >> 4;
  unint64_t v45 = v44 + 1;
  if ((unint64_t)(v44 + 1) >> 60) {
LABEL_46:
  }
    sub_100018774();
  uint64_t v46 = v41 - (void)*v27;
  if (v46 >> 3 > v45) {
    unint64_t v45 = v46 >> 3;
  }
  else {
    unint64_t v47 = v45;
  }
  if (v47) {
    uint64_t v48 = (char *)sub_1000198A8(a1 + 104, v47);
  }
  else {
    uint64_t v48 = 0LL;
  }
  uint64_t v49 = &v48[16 * v44];
  unint64_t v50 = &v48[16 * v47];
  *(_DWORD *)uint64_t v49 = -2;
  *((void *)v49 + 1) = v40;
  uint64_t v43 = v49 + 16;
  unint64_t v52 = *(char **)(a1 + 88);
  uint64_t v51 = *(char **)(a1 + 96);
  if (v51 != v52)
  {
    do
    {
      *((_OWORD *)v49 - 1) = *((_OWORD *)v51 - 1);
      v49 -= 16;
      v51 -= 16;
    }

    while (v51 != v52);
    uint64_t v51 = *v27;
  }

  *(void *)(a1 + 88) = v49;
  *(void *)(a1 + 96) = v43;
  *(void *)(a1 + 104) = v50;
  if (v51) {
    operator delete(v51);
  }
LABEL_45:
  *(void *)(a1 + 96) = v43;
  uint64_t result = sub_1000A4CA4(v7, v8, 1);
  *(void *)(a1 + 8) = *(void *)(a1 + 8) & 0xFFFF00000000FFFFLL | result & 0xFFFFFFFF0004LL;
  return result;
}

void *sub_10008E818(void *a1)
{
  *a1 = off_1000D3928;
  sub_100017FC4((uint64_t)(a1 + 1));
  return a1;
}

void sub_10008E848(void *a1)
{
  *a1 = off_1000D3928;
  sub_100017FC4((uint64_t)(a1 + 1));
  operator delete(a1);
}

uint64_t sub_10008E878(uint64_t a1)
{
  uint64_t v1 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *))(*(void *)v1 + 16LL))(v1);
}

uint64_t sub_10008E898(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 24LL))(v3, a2);
}

uint64_t sub_10008E8D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 32LL))(v3, a2);
}

uint64_t sub_10008E900(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 40LL))(v3, a2);
}

uint64_t sub_10008E930(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 48LL))(v3, a2);
}

uint64_t sub_10008E960(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 24LL))(*(void *)(a1 + 8), a2);
  }
  unint64_t v5 = sub_10005AF40(a1, a2, &v7);
  *(void *)(*(void *)(a1 + 8) + 8LL) = *(void *)(*(void *)(a1 + 8) + 8LL) & (~v7 | 4) | v7 & v5;
  return v5 & a2;
}

uint64_t sub_10008E9E4(uint64_t a1)
{
  return *(void *)(a1 + 8) + 16LL;
}

void *sub_10008E9F0(uint64_t a1, int a2)
{
  uint64_t v4 = operator new(0x18uLL);
  sub_10008EFC8(v4, a1, a2);
  *uint64_t v4 = off_1000D37B0;
  return v4;
}

void sub_10008EA40(_Unwind_Exception *a1)
{
}

uint64_t sub_10008EA54(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40LL);
}

uint64_t sub_10008EA60(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL);
}

uint64_t sub_10008EA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t))(*(void *)v3 + 112LL))(v3, a2);
}

uint64_t sub_10008EA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v5 = sub_10008EEEC(*(void **)(a1 + 8));
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)v5 + 120LL))(v5, a2, a3);
}

void *sub_10008EAD4@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0xD0uLL);
  uint64_t result = sub_10008EB2C(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10008EB18(_Unwind_Exception *a1)
{
}

void *sub_10008EB2C(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3890;
  sub_10008EBB4((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_10008EB60(_Unwind_Exception *a1)
{
}

void sub_10008EB74(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3890;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10008EB84(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3890;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_10008EBA4(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

uint64_t sub_10008EBB4(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000D05B8;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v4 = (std::string *)(a1 + 16);
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)a1 = off_1000D38E0;
  sub_10008F514((void *)(a1 + 56));
  *(_OWORD *)(a1 + 88) = 0u;
  unint64_t v5 = (char **)(a1 + 88);
  *(_DWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_BYTE *)(a1 + 120) = *(_BYTE *)a2;
  *(void *)(a1 + 128) = *(void *)(a2 + 8);
  *(void *)(a1 + 136) = 0LL;
  *(_BYTE *)(a1 + 144) = 1;
  *(_OWORD *)(a1 + 148) = xmmword_1000AC9A0;
  *(_DWORD *)(a1 + 164) = 0;
  *(_BYTE *)(a1 + 168) = 0;
  *(void *)(a1 + 176) = 0LL;
  sub_10000A2DC(&__str, "rational");
  std::string::operator=(v4, &__str);
  unint64_t v6 = *(void *)(a1 + 104);
  unint64_t v7 = *(void *)(a1 + 96);
  if (v7 >= v6)
  {
    uint64_t v9 = (uint64_t)(v7 - (void)*v5) >> 4;
    unint64_t v10 = v9 + 1;
    uint64_t v11 = v6 - (void)*v5;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12) {
      uint64_t v13 = (char *)sub_1000198A8(a1 + 104, v12);
    }
    else {
      uint64_t v13 = 0LL;
    }
    uint64_t v14 = &v13[16 * v9];
    uint64_t v15 = &v13[16 * v12];
    *(_DWORD *)uint64_t v14 = 0;
    *((void *)v14 + 1) = 0LL;
    uint64_t v8 = v14 + 16;
    int v17 = *(char **)(a1 + 88);
    unint64_t v16 = *(char **)(a1 + 96);
    if (v16 != v17)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }

      while (v16 != v17);
      unint64_t v16 = *v5;
    }

    *(void *)(a1 + 88) = v14;
    *(void *)(a1 + 96) = v8;
    *(void *)(a1 + 104) = v15;
    if (v16) {
      operator delete(v16);
    }
  }

  else
  {
    *(_DWORD *)unint64_t v7 = 0;
    *(void *)(v7 + 8) = 0LL;
    uint64_t v8 = (char *)(v7 + 16);
  }

  *(void *)(a1 + 96) = v8;
  return a1;
}

void sub_10008ED5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v18 = v15[14];
  v15[14] = 0LL;
  if (v18) {
    (*(void (**)(uint64_t))(*(void *)v18 + 8LL))(v18);
  }
  float v19 = *v16;
  if (*v16)
  {
    v15[12] = v19;
    operator delete(v19);
  }

  v15[7] = off_1000D0A50;
  sub_100017FC4((uint64_t)(v15 + 8));
  sub_10002D2D8((uint64_t)v15);
  _Unwind_Resume(a1);
}

void sub_10008EDD4(void *a1)
{
  uint64_t v1 = (void *)sub_10008EE54(a1);
  operator delete(v1);
}

uint64_t sub_10008EDE8(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, 0xFFFFFFFF0007LL);
}

uint64_t sub_10008EDFC(void *a1, uint64_t a2)
{
  if ((a2 & 4) != 0)
  {
    uint64_t v4 = sub_10008EEEC(a1);
  }

  return a1[1] & a2;
}

uint64_t sub_10008EE54(void *a1)
{
  *a1 = off_1000D38E0;
  uint64_t v2 = a1[11];
  uint64_t v3 = a1[12];
  while (v2 != v3)
  {
    uint64_t v4 = *(void *)(v2 + 8);
    if (v4) {
      (*(void (**)(uint64_t))(*(void *)v4 + 8LL))(v4);
    }
    v2 += 16LL;
  }

  uint64_t v5 = a1[14];
  a1[14] = 0LL;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
  }
  unint64_t v6 = (void *)a1[11];
  if (v6)
  {
    a1[12] = v6;
    operator delete(v6);
  }

  a1[7] = off_1000D0A50;
  sub_100017FC4((uint64_t)(a1 + 8));
  return sub_10002D2D8((uint64_t)a1);
}

char *sub_10008EEEC(void *a1)
{
  uint64_t v1 = (char *)a1[14];
  if (!v1)
  {
    uint64_t v3 = operator new(0x18uLL);
    uint64_t v4 = a1[9];
    v3[1] = a1[8];
    v3[2] = v4;
    if (v4)
    {
      uint64_t v5 = (unint64_t *)(v4 + 8);
      do
        unint64_t v6 = __ldxr(v5);
      while (__stxr(v6 + 1, v5));
    }

    *uint64_t v3 = off_1000D06D8;
    *(void *)(a1[11] + 8LL) = v3;
    uint64_t v1 = (char *)operator new(0x18uLL);
    sub_1000734B8(a1 + 11, (uint64_t)(a1 + 15), &v9);
    *(_OWORD *)(v1 + 8) = v9;
    *(void *)uint64_t v1 = off_1000D2630;
    uint64_t v7 = a1[14];
    a1[14] = v1;
    if (v7)
    {
      (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
      return (char *)a1[14];
    }
  }

  return v1;
}

void sub_10008EFB4(_Unwind_Exception *a1)
{
}

void *sub_10008EFC8(void *a1, uint64_t a2, int a3)
{
  *a1 = off_1000D3928;
  a1[1] = 0LL;
  uint64_t v4 = (uint64_t)(a1 + 1);
  a1[2] = 0LL;
  if (a3)
  {
    sub_10008F084(*(void *)(a2 + 8), &v9);
    sub_1000784F0(v4, &v9);
    uint64_t v5 = (std::__shared_weak_count *)*((void *)&v9 + 1);
    if (*((void *)&v9 + 1))
    {
      unint64_t v6 = (unint64_t *)(*((void *)&v9 + 1) + 8LL);
      do
        unint64_t v7 = __ldaxr(v6);
      while (__stlxr(v7 - 1, v6));
      if (!v7)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }

  else
  {
    sub_10002CF84(a1 + 1, (uint64_t *)(a2 + 8));
  }

  return a1;
}

void sub_10008F070(_Unwind_Exception *a1)
{
}

void *sub_10008F084@<X0>(uint64_t a1@<X1>, void *a2@<X8>)
{
  uint64_t v4 = operator new(0xD0uLL);
  uint64_t result = sub_10008F0DC(v4, a1);
  *a2 = v4 + 3;
  a2[1] = v4;
  return result;
}

void sub_10008F0C8(_Unwind_Exception *a1)
{
}

void *sub_10008F0DC(void *a1, uint64_t a2)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3890;
  sub_10008F124((uint64_t)(a1 + 3), a2);
  return a1;
}

void sub_10008F110(_Unwind_Exception *a1)
{
}

uint64_t sub_10008F124(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000D05B8;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v4 = (std::string *)(a1 + 16);
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 48) = 0LL;
  *(void *)a1 = off_1000D38E0;
  *(void *)(a1 + 56) = off_1000D0A50;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v5 = *(void *)(a2 + 72);
  *(void *)(a1 + 72) = v5;
  if (v5)
  {
    unint64_t v6 = (unint64_t *)(v5 + 8);
    do
      unint64_t v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }

  int v8 = *(_DWORD *)(a2 + 80);
  *(void *)(a1 + 88) = 0LL;
  __int128 v9 = (char **)(a1 + 88);
  *(void *)(a1 + 56) = off_1000D06D8;
  *(_DWORD *)(a1 + 80) = v8;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  uint64_t v10 = *(void *)(a2 + 112);
  if (v10) {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v10 + 72LL))(v10, 1LL);
  }
  *(void *)(a1 + 112) = v10;
  __int128 v11 = *(_OWORD *)(a2 + 120);
  __int128 v12 = *(_OWORD *)(a2 + 136);
  __int128 v13 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 152) = v13;
  *(_OWORD *)(a1 + 136) = v12;
  *(_OWORD *)(a1 + 120) = v11;
  sub_10000A2DC(&__str, "rational");
  std::string::operator=(v4, &__str);
  sub_10008F3FC((void **)(a1 + 88), (uint64_t)(*(void *)(a2 + 96) - *(void *)(a2 + 88)) >> 4);
  uint64_t v14 = *(void *)(a2 + 88);
  for (uint64_t i = *(void *)(a2 + 96); v14 != i; v14 += 16LL)
  {
    uint64_t v16 = *(void *)(v14 + 8);
    if (v16) {
      uint64_t v17 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v16 + 72LL))(v16, 1LL);
    }
    else {
      uint64_t v17 = 0LL;
    }
    unint64_t v19 = *(void *)(a1 + 96);
    unint64_t v18 = *(void *)(a1 + 104);
    if (v19 >= v18)
    {
      uint64_t v21 = (uint64_t)(v19 - (void)*v9) >> 4;
      unint64_t v22 = v21 + 1;
      uint64_t v23 = v18 - (void)*v9;
      if (v23 >> 3 > v22) {
        unint64_t v22 = v23 >> 3;
      }
      else {
        unint64_t v24 = v22;
      }
      uint64_t v25 = (char *)sub_1000198A8(a1 + 104, v24);
      unint64_t v27 = &v25[16 * v21];
      *(_DWORD *)unint64_t v27 = *(_DWORD *)v14;
      *((void *)v27 + 1) = v17;
      unint64_t v29 = *(char **)(a1 + 88);
      unint64_t v28 = *(char **)(a1 + 96);
      uint64_t v30 = v27;
      if (v28 != v29)
      {
        do
        {
          *((_OWORD *)v30 - 1) = *((_OWORD *)v28 - 1);
          v30 -= 16;
          v28 -= 16;
        }

        while (v28 != v29);
        unint64_t v28 = *v9;
      }

      uint64_t v20 = v27 + 16;
      *(void *)(a1 + 88) = v30;
      *(void *)(a1 + 96) = v27 + 16;
      *(void *)(a1 + 104) = &v25[16 * v26];
      if (v28) {
        operator delete(v28);
      }
    }

    else
    {
      *(_DWORD *)unint64_t v19 = *(_DWORD *)v14;
      *(void *)(v19 + 8) = v17;
      uint64_t v20 = (char *)(v19 + 16);
    }

    *(void *)(a1 + 96) = v20;
  }

  return a1;
}

void sub_10008F380( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  unint64_t v19 = *v17;
  if (*v17)
  {
    *(void *)(v15 + 96) = v19;
    operator delete(v19);
  }

  *(void *)(v15 + 56) = off_1000D0A50;
  sub_100017FC4(v16);
  sub_10002D2D8(v15);
  _Unwind_Resume(a1);
}

void sub_10008F3FC(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 4)
  {
    if (a2 >> 60) {
      sub_100018774();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    unint64_t v6 = (char *)sub_1000198A8(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0LL];
    __int128 v9 = &v6[16 * v8];
    __int128 v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    __int128 v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }

      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void *sub_10008F49C(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = sub_10002DC70(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_10008F4F8(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_10008F514(void *a1)
{
  uint64_t v2 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      unint64_t v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }

  *a1 = off_1000D06D8;
  return a1;
}

void sub_10008F598(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_10008F5AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v8 = *(_DWORD *)(a4 + 24);
  if (v8 == 1)
  {
    uint64_t v43 = 0LL;
    uint64_t v44 = 0LL;
    *(void *)unint64_t v45 = 0LL;
    else {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168LL))(a2, 4LL, 4LL);
    }
    if (v43)
    {
      uint64_t v44 = v43;
      operator delete(v43);
    }
  }

  else if (v8 >= 1)
  {
    if (*(_BYTE *)(a4 + 29)
      || (sub_100084618(a1, (void *)a3, a4), __int128 v9 = *(int **)a3, *(void *)(a3 + 8) - *(void *)a3 != 4LL)
      || *(float *)v9 < -INFINITY
      || *(float *)v9 > -INFINITY)
    {
      sub_1000877DC(v54);
      sub_100084704(a1, v54, 1);
      float v10 = *(float *)sub_10002ADB0();
      float v53 = v10;
      uint64_t v11 = **(void **)(v54[1] + 56);
      uint64_t v12 = *(void *)(v11 + 24);
      uint64_t v13 = *(void *)(v11 + 32);
      if (v12 == v13) {
        uint64_t v14 = 0LL;
      }
      else {
        uint64_t v14 = *(void *)(v11 + 24);
      }
      if (v12 != v13)
      {
        unint64_t v15 = (v13 - v12) >> 4;
        if (v15 <= 1) {
          uint64_t v16 = 1LL;
        }
        else {
          uint64_t v16 = v15;
        }
        uint64_t v17 = (float *)(v14 + 12);
        unint64_t v18 = v17;
        do
        {
          uint64_t v19 = *(int *)v18;
          v18 += 4;
          uint64_t v20 = v19 - 1;
          if (v19 - 1 < (unint64_t)((uint64_t)(*(void *)(a3 + 8) - *(void *)a3) >> 2))
          {
            float v21 = *(v17 - 1);
            if (v21 == -INFINITY || (float v22 = *(float *)(*(void *)a3 + 4 * v20), v22 >= -INFINITY) && v22 <= -INFINITY)
            {
              float v23 = *(float *)sub_1000606CC();
            }

            else
            {
              BOOL v24 = v22 == INFINITY || v21 == INFINITY;
              float v23 = v21 + v22;
              if (v24) {
                float v23 = INFINITY;
              }
            }

            if (v10 == -INFINITY || v23 >= -INFINITY && v23 <= -INFINITY)
            {
              float v10 = *(float *)sub_1000606CC();
            }

            else if (v10 >= v23)
            {
              float v10 = v23;
            }

            float v53 = v10;
          }

          uint64_t v17 = v18;
          --v16;
        }

        while (v16);
      }

      sub_1000907DC(a3, *(int **)a3, (int *)&v53);
      if (*(_BYTE *)(a4 + 28))
      {
        __int128 __p = 0LL;
        unint64_t v50 = 0LL;
        uint64_t v51 = 0LL;
        int v25 = *(_DWORD *)(a4 + 16);
        LOBYTE(v43) = byte_1000DDB00;
        uint64_t v44 = (void *)qword_1000DDB08;
        *(_DWORD *)unint64_t v45 = v25;
        *(void *)&v45[4] = 0LL;
        char v46 = 0;
        uint64_t v47 = 0LL;
        uint64_t v48 = 0LL;
        sub_100091C4C((uint64_t)v41, (uint64_t)v54, a3, (uint64_t)&__p, (uint64_t)&v43);
        int v26 = *(_DWORD *)(a4 + 24);
        float v27 = *(float *)(a4 + 16);
        int v40 = *(_DWORD *)(a4 + 32);
        sub_100090A34((uint64_t)v41, a2, (uint64_t *)&__p, v26, (float *)&v40, *(_DWORD *)(a4 + 36), v27);
        v41[0] = off_1000D3F88;
        unint64_t v28 = v42;
        if (v42)
        {
          p_shared_owners = (unint64_t *)&v42->__shared_owners_;
          do
            unint64_t v30 = __ldaxr(p_shared_owners);
          while (__stlxr(v30 - 1, p_shared_owners));
          if (!v30)
          {
            ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
            std::__shared_weak_count::__release_weak(v28);
          }
        }

        if (__p)
        {
          unint64_t v50 = __p;
          operator delete(__p);
        }
      }

      else
      {
        int v31 = *(_DWORD *)(a4 + 24);
        float v32 = *(float *)(a4 + 16);
        int v52 = *(_DWORD *)(a4 + 32);
        sub_100090A34((uint64_t)v54, a2, (uint64_t *)a3, v31, (float *)&v52, *(_DWORD *)(a4 + 36), v32);
      }

      unint64_t v34 = *(int **)a3;
      unint64_t v33 = *(_BYTE **)(a3 + 8);
      unint64_t v35 = (_BYTE *)(*(void *)a3 + 4LL);
      if (v35 != v33)
      {
        size_t v36 = ((v33 - (_BYTE *)v34) & 0xFFFFFFFFFFFFFFFCLL) - 4;
        memmove(*(void **)a3, v35, v36);
        unint64_t v34 = (int *)((char *)v34 + v36);
      }

      *(void *)(a3 + 8) = v34;
      v54[0] = (uint64_t)off_1000D35A0;
      uint64_t v37 = v55;
      if (v55)
      {
        uint64_t v38 = (unint64_t *)&v55->__shared_owners_;
        do
          unint64_t v39 = __ldaxr(v38);
        while (__stlxr(v39 - 1, v38));
        if (!v39)
        {
          ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
          std::__shared_weak_count::__release_weak(v37);
        }
      }
    }

    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168LL))(a2, 4LL, 4LL);
    }
  }

void sub_10008F978( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *__p, uint64_t a21)
{
  if (__p) {
    operator delete(__p);
  }
  *(void *)(v22 - 104) = off_1000D35A0;
  sub_100017FC4(v22 - 96);
  _Unwind_Resume(a1);
}

uint64_t sub_10008F9F4(uint64_t a1, int **a2, uint64_t *a3, _DWORD *a4, char **a5)
{
  a5[1] = *a5;
  *a4 = -1;
  memset(__p, 0, sizeof(__p));
  uint64_t v8 = *a3;
  uint64_t v111 = *((unsigned int *)a3 + 3);
  if ((_DWORD)v111 == -1) {
    uint64_t v111 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  }
  float v9 = *(float *)sub_10002ADB0();
  a2[1] = *a2;
  (*(void (**)(void))(**(void **)(v8 + 16) + 56LL))(*(void *)(v8 + 16));
  for (uint64_t i = a3; (int)v111 > (unint64_t)(a2[1] - *a2); a5[1] = v25)
  {
    float v10 = sub_10002ADB0();
    uint64_t v11 = v10;
    uint64_t v13 = a2[1];
    unint64_t v12 = (unint64_t)a2[2];
    if ((unint64_t)v13 >= v12)
    {
      unint64_t v15 = *a2;
      uint64_t v16 = v13 - *a2;
      unint64_t v17 = v16 + 1;
      uint64_t v18 = v12 - (void)v15;
      if (v18 >> 1 > v17) {
        unint64_t v17 = v18 >> 1;
      }
      else {
        unint64_t v19 = v17;
      }
      if (v19)
      {
        uint64_t v20 = (char *)sub_10002C050((uint64_t)(a2 + 2), v19);
        unint64_t v15 = *a2;
        uint64_t v13 = a2[1];
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      uint64_t v21 = (int *)&v20[4 * v16];
      int *v21 = *v11;
      uint64_t v14 = v21 + 1;
      while (v13 != v15)
      {
        int v22 = *--v13;
        *--uint64_t v21 = v22;
      }

      *a2 = v21;
      a2[1] = v14;
      a2[2] = (int *)&v20[4 * v19];
      if (v15) {
        operator delete(v15);
      }
    }

    else
    {
      int *v13 = *v10;
      uint64_t v14 = v13 + 1;
    }

    a2[1] = v14;
    LOBYTE(v114) = 0;
    sub_10002BFAC((uint64_t)__p, &v114);
    BOOL v24 = a5[1];
    unint64_t v23 = (unint64_t)a5[2];
    if ((unint64_t)v24 >= v23)
    {
      uint64_t v26 = (v24 - *a5) >> 4;
      uint64_t v27 = v23 - (void)*a5;
      uint64_t v28 = v27 >> 3;
      else {
        unint64_t v29 = v28;
      }
      if (v29) {
        unint64_t v30 = (char *)sub_1000198A8((uint64_t)(a5 + 2), v29);
      }
      else {
        unint64_t v30 = 0LL;
      }
      int v31 = &v30[16 * v26];
      *(_OWORD *)int v31 = xmmword_1000AC9B0;
      int v25 = v31 + 16;
      unint64_t v33 = *a5;
      float v32 = a5[1];
      if (v32 != *a5)
      {
        do
        {
          *((_OWORD *)v31 - 1) = *((_OWORD *)v32 - 1);
          v31 -= 16;
          v32 -= 16;
        }

        while (v32 != v33);
        float v32 = *a5;
      }

      *a5 = v31;
      a5[1] = v25;
      a5[2] = &v30[16 * v29];
      if (v32) {
        operator delete(v32);
      }
    }

    else
    {
      *(_OWORD *)BOOL v24 = xmmword_1000AC9B0;
      int v25 = v24 + 16;
    }
  }

  unint64_t v34 = sub_10002AD60();
  unint64_t v35 = v34;
  unint64_t v36 = (unint64_t)a2[2];
  uint64_t v113 = (uint64_t)(a2 + 2);
  uint64_t v37 = a2[1];
  if ((unint64_t)v37 >= v36)
  {
    int v40 = *a2;
    uint64_t v41 = v37 - *a2;
    unint64_t v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 62) {
LABEL_183:
    }
      sub_100018774();
    uint64_t v43 = v36 - (void)v40;
    if (v43 >> 1 > v42) {
      unint64_t v42 = v43 >> 1;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      unint64_t v45 = (char *)sub_10002C050(v113, v44);
      int v40 = *a2;
      uint64_t v37 = a2[1];
    }

    else
    {
      unint64_t v45 = 0LL;
    }

    char v46 = (int *)&v45[4 * v41];
    uint64_t v47 = &v45[4 * v44];
    int *v46 = *v35;
    uint64_t v38 = v46 + 1;
    while (v37 != v40)
    {
      int v48 = *--v37;
      *--char v46 = v48;
    }

    *a2 = v46;
    a2[1] = v38;
    a2[2] = (int *)v47;
    if (v40) {
      operator delete(v40);
    }
  }

  else
  {
    int *v37 = *v34;
    uint64_t v38 = v37 + 1;
  }

  a2[1] = v38;
  unint64_t v49 = (unint64_t)a5[2];
  unint64_t v50 = a5[1];
  if ((unint64_t)v50 >= v49)
  {
    uint64_t v52 = (v50 - *a5) >> 4;
    uint64_t v53 = v49 - (void)*a5;
    uint64_t v54 = v53 >> 3;
    else {
      unint64_t v55 = v54;
    }
    if (v55) {
      int v56 = (char *)sub_1000198A8((uint64_t)(a5 + 2), v55);
    }
    else {
      int v56 = 0LL;
    }
    uint64_t v57 = &v56[16 * v52];
    uint64_t v58 = &v56[16 * v55];
    *(_OWORD *)uint64_t v57 = xmmword_1000AC9B0;
    uint64_t v51 = v57 + 16;
    int v60 = *a5;
    __n128 v59 = a5[1];
    if (v59 != *a5)
    {
      do
      {
        *((_OWORD *)v57 - 1) = *((_OWORD *)v59 - 1);
        v57 -= 16;
        v59 -= 16;
      }

      while (v59 != v60);
      __n128 v59 = *a5;
    }

    *a5 = v57;
    a5[1] = v51;
    a5[2] = v58;
    if (v59) {
      operator delete(v59);
    }
  }

  else
  {
    *(_OWORD *)unint64_t v50 = xmmword_1000AC9B0;
    uint64_t v51 = v50 + 16;
  }

  a5[1] = v51;
  (*(void (**)(void, uint64_t))(**(void **)(v8 + 16) + 24LL))(*(void *)(v8 + 16), v111);
  LOBYTE(v114) = 1;
  sub_10002BFAC((uint64_t)__p, &v114);
  char v109 = 0;
LABEL_72:
  if (((*(uint64_t (**)(void))(**(void **)(v8 + 16) + 48LL))(*(void *)(v8 + 16)) & 1) != 0
    || (uint64_t v112 = (*(uint64_t (**)(void))(**(void **)(v8 + 16) + 16LL))(*(void *)(v8 + 16)),
        (*(void (**)(void))(**(void **)(v8 + 16) + 32LL))(*(void *)(v8 + 16)),
        *(void *)((char *)__p[0] + (((unint64_t)(int)v112 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) &= ~(1LL << v112),
        float v61 = *(float *)&(*a2)[(int)v112],
        ((*((_BYTE *)i + 30) != 0) & v109) == 1)
    && (float v117 = v9, v118 = v61, sub_1000917DC((uint64_t)&v114, v112, &v118, &v117)))
  {
    uint64_t v39 = 1LL;
    goto LABEL_178;
  }

  (*(void (**)(void *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(v120, a1, v112);
  char v62 = sub_10002ADB0();
  LODWORD(v114) = v120[0];
  HIDWORD(v120[0]) = *v62;
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t, float))(*(void *)a1 + 24LL))( &v114,  a1,  v112,  *(float *)v120);
  if (v61 == -INFINITY || *(float *)&v114 >= -INFINITY && *(float *)&v114 <= -INFINITY)
  {
    float v63 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v64 = *(float *)&v114 == INFINITY || v61 == INFINITY;
    float v63 = v61 + *(float *)&v114;
    if (v64) {
      float v63 = INFINITY;
    }
  }

  if (v9 == -INFINITY || v63 >= -INFINITY && v63 <= -INFINITY)
  {
    float v63 = *(float *)sub_1000606CC();
  }

  else if (v9 < v63)
  {
    float v63 = v9;
  }

  *(float *)&__int128 v114 = v9;
  *((float *)v120 + 1) = v63;
  if (v9 != v63)
  {
    *a4 = v112;
    float v9 = v63;
  }

  uint64_t v39 = 0LL;
  char v109 = 1;
  if (v9 != -INFINITY)
  {
LABEL_94:
    unint64_t v116 = 0LL;
    __int128 v114 = 0u;
    __int128 v115 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v112, &v114);
    while (1)
    {
      if ((void)v114)
      {
        char v65 = (*(uint64_t (**)(void))(*(void *)v114 + 16LL))(v114);
        uint64_t v66 = v114;
        if ((v65 & 1) != 0)
        {
          char v101 = 1;
LABEL_170:
          if (v66)
          {
            (*(void (**)(uint64_t))(*(void *)v66 + 8LL))(v66);
            goto LABEL_175;
          }

LABEL_173:
          if (*((void *)&v115 + 1)) {
            --**((_DWORD **)&v115 + 1);
          }
LABEL_175:
          if ((v101 & 1) == 0)
          {
            uint64_t v39 = 0LL;
            break;
          }

          goto LABEL_72;
        }

        if ((void)v114)
        {
          uint64_t v67 = (*(uint64_t (**)(void))(*(void *)v114 + 24LL))();
          goto LABEL_134;
        }
      }

      else if (v116 >= (unint64_t)v115)
      {
        char v101 = 1;
        goto LABEL_173;
      }

      uint64_t v67 = *((void *)&v114 + 1) + 16 * v116;
LABEL_134:
      while (1)
      {
        unint64_t v92 = *a2;
        unint64_t v93 = *(int *)(v67 + 12);
        if (v93 < a2[1] - *a2) {
          break;
        }
        int v68 = sub_10002ADB0();
        char v69 = v68;
        unint64_t v71 = a2[1];
        unint64_t v70 = (unint64_t)a2[2];
        if ((unint64_t)v71 >= v70)
        {
          unint64_t v73 = *a2;
          uint64_t v74 = v71 - *a2;
          unint64_t v75 = v74 + 1;
          uint64_t v76 = v70 - (void)v73;
          if (v76 >> 1 > v75) {
            unint64_t v75 = v76 >> 1;
          }
          else {
            unint64_t v77 = v75;
          }
          if (v77)
          {
            unint64_t v78 = (char *)sub_10002C050(v113, v77);
            unint64_t v73 = *a2;
            unint64_t v71 = a2[1];
          }

          else
          {
            unint64_t v78 = 0LL;
          }

          uint64_t v79 = (int *)&v78[4 * v74];
          *uint64_t v79 = *v69;
          uint64_t v72 = v79 + 1;
          while (v71 != v73)
          {
            int v80 = *--v71;
            *--uint64_t v79 = v80;
          }

          *a2 = v79;
          a2[1] = v72;
          a2[2] = (int *)&v78[4 * v77];
          if (v73) {
            operator delete(v73);
          }
        }

        else
        {
          *unint64_t v71 = *v68;
          uint64_t v72 = v71 + 1;
        }

        a2[1] = v72;
        BYTE4(v120[0]) = 0;
        sub_10002BFAC((uint64_t)__p, (_BYTE *)v120 + 4);
        uint64_t v82 = a5[1];
        unint64_t v81 = (unint64_t)a5[2];
        if ((unint64_t)v82 >= v81)
        {
          uint64_t v84 = (v82 - *a5) >> 4;
          uint64_t v85 = v81 - (void)*a5;
          uint64_t v86 = v85 >> 3;
          else {
            unint64_t v87 = v86;
          }
          if (v87) {
            int v88 = (char *)sub_1000198A8((uint64_t)(a5 + 2), v87);
          }
          else {
            int v88 = 0LL;
          }
          int v89 = &v88[16 * v84];
          *(_OWORD *)int v89 = xmmword_1000AC9B0;
          unint64_t v83 = v89 + 16;
          v91 = *a5;
          unint64_t v90 = a5[1];
          if (v90 != *a5)
          {
            do
            {
              *((_OWORD *)v89 - 1) = *((_OWORD *)v90 - 1);
              v89 -= 16;
              v90 -= 16;
            }

            while (v90 != v91);
            unint64_t v90 = *a5;
          }

          *a5 = v89;
          a5[1] = v83;
          a5[2] = &v88[16 * v87];
          if (v90) {
            operator delete(v90);
          }
        }

        else
        {
          *(_OWORD *)uint64_t v82 = xmmword_1000AC9B0;
          unint64_t v83 = v82 + 16;
        }

        a5[1] = v83;
      }

      if (v61 == -INFINITY || (float v94 = *(float *)(v67 + 8), v94 >= -INFINITY) && v94 <= -INFINITY)
      {
        float v95 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v96 = v94 == INFINITY || v61 == INFINITY;
        float v97 = v61 + v94;
        if (v96) {
          float v95 = INFINITY;
        }
        else {
          float v95 = v97;
        }
      }

      LODWORD(v9sub_100017FC4(v21 + 8) = v92[v93];
      if (v98 == -INFINITY || v95 >= -INFINITY && v95 <= -INFINITY)
      {
        int v99 = *sub_1000606CC();
        LODWORD(v9sub_100017FC4(v21 + 8) = v92[v93];
      }

      else if (v98 >= v95)
      {
        *(float *)&int v99 = v95;
      }

      else
      {
        int v99 = v92[v93];
      }

      v120[0] = __PAIR64__(LODWORD(v98), v99);
      if (v98 != *(float *)&v99)
      {
        float v100 = *(float *)&v92[v93];
        if (v100 == -INFINITY || v95 >= -INFINITY && v95 <= -INFINITY)
        {
          float v100 = *(float *)sub_1000606CC();
        }

        else if (v100 >= v95)
        {
          float v100 = v95;
        }

        char v101 = 0;
        *(float *)&v92[v93] = v100;
        uint64_t v66 = v114;
        if (v100 == -INFINITY) {
          goto LABEL_170;
        }
        if ((void)v114) {
          uint64_t v102 = (*(uint64_t (**)(void))(*(void *)v114 + 40LL))();
        }
        else {
          uint64_t v102 = v116;
        }
        unint64_t v103 = *(int *)(v67 + 12);
        uint64_t v104 = (uint64_t)&(*a5)[16 * v103];
        *(_DWORD *)uint64_t v104 = v112;
        *(void *)(v104 + sub_100017FC4(v21 + 8) = v102;
        uint64_t v105 = **(void **)(v8 + 16);
        if (((*(void *)((char *)__p[0] + ((v103 >> 3) & 0x1FFFFFFFFFFFFFF8LL)) >> v103) & 1) != 0)
        {
          (*(void (**)(void))(v105 + 40))();
        }

        else
        {
          (*(void (**)(void))(v105 + 24))();
          *(void *)((char *)__p[0] + (((unint64_t)*(int *)(v67 + 12) >> 3) & 0x1FFFFFFFFFFFFFF8LL)) |= 1LL << *(_DWORD *)(v67 + 12);
        }
      }

      if ((void)v114) {
        (*(void (**)(void))(*(void *)v114 + 32LL))(v114);
      }
      else {
        ++v116;
      }
    }
  }

LABEL_178:
  if (__p[0]) {
    operator delete(__p[0]);
  }
  return v39;
}

void sub_10009047C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, void *__p)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100090524(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 256LL))(a2, v8);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 264LL))(a2, v9);
  if ((_DWORD)a4 != -1)
  {
    int v10 = -1;
    uint64_t v11 = a4;
    int v12 = -1;
    while (1)
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176LL))(a2);
      if (v10 != -1) {
        break;
      }
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v25, a1, a4);
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 160LL))(a2, v13, &v25);
LABEL_15:
      int v10 = v11;
      uint64_t v11 = *(unsigned int *)(*a3 + 16LL * (int)v11);
      int v12 = v13;
      if ((_DWORD)v11 == -1) {
        goto LABEL_18;
      }
    }

    uint64_t v24 = 0LL;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v11, &v22);
    uint64_t v14 = *(void *)(*a3 + 16LL * v10 + 8);
    if ((void)v22)
    {
      (*(void (**)(void, uint64_t))(*(void *)v22 + 56LL))(v22, v14);
      if ((void)v22)
      {
        uint64_t v15 = (*(uint64_t (**)(void))(*(void *)v22 + 24LL))(v22);
        goto LABEL_11;
      }

      uint64_t v14 = v24;
    }

    else
    {
      uint64_t v24 = *(void *)(*a3 + 16LL * v10 + 8);
    }

    uint64_t v15 = *((void *)&v22 + 1) + 16 * v14;
LABEL_11:
    uint64_t v19 = *(void *)v15;
    int v20 = *(_DWORD *)(v15 + 8);
    int v21 = v12;
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 184LL))(a2, v13, &v19);
    if ((void)v22)
    {
      (*(void (**)(void))(*(void *)v22 + 8LL))(v22);
    }

    else if (*((void *)&v23 + 1))
    {
      --**((_DWORD **)&v23 + 1);
    }

    goto LABEL_15;
  }

  uint64_t v13 = 0xFFFFFFFFLL;
LABEL_18:
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 152LL))(a2, v13);
  uint64_t v16 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0xFFFFFFFF0007LL, 0LL);
  uint64_t v17 = sub_1000A4C64(v16, 1);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168LL))(a2, v17, 0xFFFFFFFF0007LL);
}

void sub_1000907A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a11)
  {
    (*(void (**)(uint64_t))(*(void *)a11 + 8LL))(a11);
  }

  else if (a14)
  {
    --*a14;
  }

  _Unwind_Resume(exception_object);
}

int *sub_1000907DC(uint64_t a1, int *a2, int *a3)
{
  uint64_t v6 = *(int **)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  uint64_t v7 = (uint64_t)a2 - *(void *)a1;
  uint64_t v8 = v7 >> 2;
  uint64_t v9 = (int *)(*(void *)a1 + (v7 & 0xFFFFFFFFFFFFFFFCLL));
  uint64_t v11 = a1 + 16;
  unint64_t v10 = *(void *)(a1 + 16);
  if (v5 >= v10)
  {
    unint64_t v17 = ((uint64_t)(v5 - (void)v6) >> 2) + 1;
    if (v17 >> 62) {
      sub_100018774();
    }
    uint64_t v19 = v10 - (void)v6;
    if (v19 >> 1 > v17) {
      unint64_t v17 = v19 >> 1;
    }
    else {
      unint64_t v20 = v17;
    }
    uint64_t v35 = a1 + 16;
    if (v20) {
      int v21 = (char *)sub_10002C050(a1 + 16, v20);
    }
    else {
      int v21 = 0LL;
    }
    __int128 v22 = &v21[4 * v8];
    __int128 __p = v21;
    float v32 = v22;
    unint64_t v33 = v22;
    unint64_t v34 = &v21[4 * v20];
    if (v8 == v20)
    {
      if (v7 < 1)
      {
        if (v6 == a2) {
          unint64_t v27 = 1LL;
        }
        else {
          unint64_t v27 = v7 >> 1;
        }
        uint64_t v28 = (char *)sub_10002C050(v11, v27);
        __int128 v22 = &v28[v27 & 0xFFFFFFFFFFFFFFFCLL];
        __int128 __p = v28;
        float v32 = v22;
        unint64_t v34 = &v28[4 * v29];
        if (v21) {
          operator delete(v21);
        }
      }

      else
      {
        unint64_t v23 = v8 + 2;
        if (v8 >= -1) {
          unint64_t v23 = v8 + 1;
        }
        v22 -= 4 * (v23 >> 1);
        float v32 = v22;
      }
    }

    *(_DWORD *)__int128 v22 = *a3;
    unint64_t v33 = v22 + 4;
    uint64_t v9 = sub_10009185C((int **)a1, &__p, v9);
    if (v33 != v32) {
      v33 += (v32 - v33 + 3) & 0xFFFFFFFFFFFFFFFCLL;
    }
    if (__p) {
      operator delete(__p);
    }
  }

  else if (v9 == (int *)v5)
  {
    *uint64_t v9 = *a3;
    *(void *)(a1 + sub_100017FC4(v21 + 8) = v9 + 1;
  }

  else
  {
    int v12 = v9 + 1;
    uint64_t v13 = (_DWORD *)(v5 - 4);
    if (v5 < 4)
    {
      uint64_t v15 = *(int **)(a1 + 8);
    }

    else
    {
      uint64_t v14 = (int *)(v5 - 4);
      uint64_t v15 = *(int **)(a1 + 8);
      do
      {
        int v16 = *v14++;
        *v15++ = v16;
      }

      while ((unint64_t)v14 < v5);
    }

    *(void *)(a1 + sub_100017FC4(v21 + 8) = v15;
    if ((int *)v5 != v12)
    {
      uint64_t v24 = (uint64_t)(v5 - (void)v12) >> 2;
      do
        *v13-- = v6[v8 - 1 + v24--];
      while (v24 * 4);
    }

    BOOL v26 = v9 <= a3 && v15 > a3;
    *uint64_t v9 = a3[v26];
  }

  return v9;
}

void sub_1000909FC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100090A34(uint64_t a1, uint64_t a2, uint64_t *a3, int a4, float *a5, int a6, float a7)
{
  if (a4 < 1) {
    return;
  }
  (*(void (**)(uint64_t))(*(void *)a2 + 200LL))(a2);
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 96LL))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 256LL))(a2, v13);
  uint64_t v14 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 104LL))(a1);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 264LL))(a2, v14);
  uint64_t v161 = 0LL;
  unint64_t v162 = 0LL;
  v163[0] = 0LL;
  uint64_t v17 = *a3;
  uint64_t v16 = a3[1];
  int v18 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  uint64_t v19 = *a3;
  unint64_t v20 = sub_10002ADB0();
  LODWORD(v146) = *(_DWORD *)(v19 + 4LL * v18);
  LODWORD(v156) = *v20;
  v15.n128_u32[0] = v146;
  int v21 = sub_10002AD60();
  BOOL v22 = !sub_10007F7A8((uint64_t)&v160, a5, (float *)v21);
  if (!a6) {
    LOBYTE(v22) = 0;
  }
  if (!v22)
  {
LABEL_192:
    goto LABEL_10;
  }

  uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176LL))(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 152LL))(a2, v23);
  uint64_t v24 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176LL))(a2);
  int v159 = *sub_10002AD60();
  (*(void (**)(uint64_t, uint64_t, int *))(*(void *)a2 + 160LL))(a2, v24, &v159);
  if ((int)v24 >= (unint64_t)((v162 - v161) >> 3))
  {
    do
    {
      int v25 = *sub_10002ADB0();
      BOOL v26 = v162;
      if ((unint64_t)v162 >= v163[0])
      {
        uint64_t v28 = (v162 - v161) >> 3;
        unint64_t v29 = v28 + 1;
        uint64_t v30 = v163[0] - (void)v161;
        else {
          unint64_t v31 = v29;
        }
        unint64_t v33 = (char *)sub_100018788((uint64_t)v163, v31);
        unint64_t v34 = &v33[8 * v28];
        *(_DWORD *)unint64_t v34 = -1;
        *((_DWORD *)v34 + 1) = v25;
        uint64_t v35 = v161;
        unint64_t v36 = v162;
        uint64_t v37 = v34;
        while (v36 != v35)
        {
          int v38 = *((_DWORD *)v36 - 2);
          v36 -= 8;
          *((_DWORD *)v37 - 2) = v38;
          v37 -= 8;
          *((_DWORD *)v37 + 1) = *((_DWORD *)v36 + 1);
        }

        unint64_t v27 = v34 + 8;
        uint64_t v161 = v37;
        unint64_t v162 = v34 + 8;
        v163[0] = &v33[8 * v32];
        if (v35) {
          operator delete(v35);
        }
      }

      else
      {
        *(_DWORD *)unint64_t v162 = -1;
        *((_DWORD *)v26 + 1) = v25;
        unint64_t v27 = v26 + 8;
      }

      unint64_t v162 = v27;
    }

    while ((int)v24 >= (unint64_t)((v27 - v161) >> 3));
  }

  int v39 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 16LL))(a1);
  int v40 = *sub_10002AD60();
  uint64_t v41 = &v161[8 * (int)v24];
  *(_DWORD *)uint64_t v41 = v39;
  *((_DWORD *)v41 + 1) = v40;
  v158 = 0LL;
  unint64_t v42 = sub_10002C050((uint64_t)&v158, 1uLL);
  _DWORD *v42 = v24;
  int v156 = v42;
  v158 = (char *)&v42[v43];
  int v157 = (char *)(v42 + 1);
  float v44 = *(float *)(*a3 + 4LL * (*(int (**)(uint64_t))(*(void *)a1 + 16LL))(a1));
  if (v44 == -INFINITY || (float v45 = *a5, *a5 >= -INFINITY) && *a5 <= -INFINITY)
  {
    float v46 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v47 = v45 == INFINITY || v44 == INFINITY;
    float v46 = v44 + v45;
    if (v47) {
      float v46 = INFINITY;
    }
  }

  float v155 = v46;
  __int128 __p = 0LL;
  unint64_t v153 = 0LL;
  v154 = 0LL;
  unint64_t v49 = v156;
  int v48 = v157;
  do
  {
    v149[0] = &v161;
    v149[1] = a3;
    int v150 = -1;
    float v151 = a7;
    if (v48 - (char *)v49 >= 5)
    {
      int v50 = *v49;
      uint64_t v51 = sub_1000918EC(v49, (uint64_t)v149, (unint64_t)(v48 - (char *)v49) >> 2);
      uint64_t v52 = (int *)(v48 - 4);
      if (v48 - 4 == (char *)v51)
      {
        *uint64_t v51 = v50;
      }

      else
      {
        *uint64_t v51 = *v52;
        *uint64_t v52 = v50;
        sub_100091998((uint64_t)v49, (uint64_t)(v51 + 1), (uint64_t)v149, v51 + 1 - v49);
      }
    }

    uint64_t v53 = *((int *)v157 - 1);
    uint64_t v54 = (float *)&v161[8 * v53];
    unint64_t v55 = *(int *)v54;
    float v56 = v54[1];
    v157 -= 4;
    if ((_DWORD)v55 == -1)
    {
      uint64_t v57 = sub_10002AD60();
    }

    else if (v55 >= (a3[1] - *a3) >> 2)
    {
      uint64_t v57 = sub_10002ADB0();
    }

    else
    {
      uint64_t v57 = (int *)(*a3 + 4 * v55);
    }

    float v58 = *(float *)v57;
    if (*(float *)v57 == -INFINITY || v56 >= -INFINITY && v56 <= -INFINITY)
    {
      float v59 = *(float *)sub_1000606CC();
    }

    else
    {
      BOOL v60 = v58 == INFINITY || v56 == INFINITY;
      float v59 = v56 + v58;
      if (v60) {
        float v59 = INFINITY;
      }
    }

    *(float *)&__int128 v146 = v59;
    if (sub_10007F7A8((uint64_t)&v160, &v155, (float *)&v146)
      || a6 != -1 && (*(int (**)(uint64_t))(*(void *)a2 + 136LL))(a2) >= a6)
    {
      goto LABEL_177;
    }

    unint64_t v61 = v55 + 1;
    char v62 = (char *)__p;
    float v63 = v153;
    unint64_t v64 = (v153 - (_BYTE *)__p) >> 2;
    while (v64 <= v61)
    {
      if (v63 >= v154)
      {
        unint64_t v66 = v64 + 1;
        if ((v64 + 1) >> 62) {
          sub_100018774();
        }
        uint64_t v67 = v154 - v62;
        if ((v154 - v62) >> 1 > v66) {
          unint64_t v66 = v67 >> 1;
        }
        else {
          unint64_t v68 = v66;
        }
        if (v68)
        {
          char v69 = (char *)sub_10002C050((uint64_t)&v154, v68);
          char v62 = (char *)__p;
          float v63 = v153;
        }

        else
        {
          char v69 = 0LL;
        }

        unint64_t v70 = &v69[4 * v64];
        *(_DWORD *)unint64_t v70 = 0;
        char v65 = v70 + 4;
        while (v63 != v62)
        {
          int v71 = *((_DWORD *)v63 - 1);
          v63 -= 4;
          *((_DWORD *)v70 - 1) = v71;
          v70 -= 4;
        }

        __int128 __p = v70;
        unint64_t v153 = v65;
        v154 = &v69[4 * v68];
        if (v62)
        {
          operator delete(v62);
          char v62 = (char *)__p;
        }

        else
        {
          char v62 = v70;
        }
      }

      else
      {
        *(_DWORD *)float v63 = 0;
        char v65 = v63 + 4;
      }

      unint64_t v153 = v65;
      unint64_t v64 = (v65 - v62) >> 2;
      float v63 = v65;
    }

    int v72 = *(_DWORD *)&v62[4 * v61];
    *(_DWORD *)&v62[4 * v61] = v72 + 1;
    if ((_DWORD)v55 == -1)
    {
      uint64_t v104 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2);
      int v105 = *sub_10002AD60();
      *(void *)&__int128 v146 = 0LL;
      *((void *)&v146 + 1) = __PAIR64__(v53, v105);
      (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a2 + 184LL))(a2, v104, &v146);
      if (*(_DWORD *)__p != a4) {
        goto LABEL_177;
      }
      break;
    }

    if (v72 >= a4) {
      goto LABEL_177;
    }
    unint64_t v148 = 0LL;
    __int128 v146 = 0u;
    __int128 v147 = 0u;
    (*(void (**)(uint64_t, unint64_t, __int128 *))(*(void *)a1 + 120LL))(a1, v55, &v146);
    while (1)
    {
      if (!(void)v146)
      {
LABEL_87:
        uint64_t v73 = *((void *)&v146 + 1) + 16 * v148;
        goto LABEL_88;
      }

      if (!(void)v146) {
        goto LABEL_87;
      }
      uint64_t v73 = (*(uint64_t (**)(void))(*(void *)v146 + 24LL))();
LABEL_88:
      float v74 = *(float *)(v73 + 8);
      int v75 = *(_DWORD *)(v73 + 12);
      uint64_t v143 = *(void *)v73;
      float v144 = v74;
      int v145 = v75;
      if (v56 == -INFINITY || v74 >= -INFINITY && v74 <= -INFINITY)
      {
        float v76 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v77 = v74 == INFINITY || v56 == INFINITY;
        float v78 = v56 + v74;
        if (v77) {
          float v76 = INFINITY;
        }
        else {
          float v76 = v78;
        }
      }

      uint64_t v79 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176LL))(a2);
      int v80 = v145;
      unint64_t v81 = v162;
      if ((unint64_t)v162 >= v163[0])
      {
        uint64_t v83 = (v162 - v161) >> 3;
        unint64_t v84 = v83 + 1;
        uint64_t v85 = v163[0] - (void)v161;
        else {
          unint64_t v86 = v84;
        }
        int v88 = (char *)sub_100018788((uint64_t)v163, v86);
        int v89 = &v88[8 * v83];
        *(_DWORD *)int v89 = v80;
        *((float *)v89 + 1) = v76;
        unint64_t v90 = v161;
        v91 = v162;
        unint64_t v92 = v89;
        while (v91 != v90)
        {
          int v93 = *((_DWORD *)v91 - 2);
          v91 -= 8;
          *((_DWORD *)v92 - 2) = v93;
          v92 -= 8;
          *((_DWORD *)v92 + 1) = *((_DWORD *)v91 + 1);
        }

        uint64_t v82 = v89 + 8;
        uint64_t v161 = v92;
        unint64_t v162 = v89 + 8;
        v163[0] = &v88[8 * v87];
        if (v90) {
          operator delete(v90);
        }
      }

      else
      {
        *(_DWORD *)unint64_t v162 = v145;
        *((float *)v81 + 1) = v76;
        uint64_t v82 = v81 + 8;
      }

      unint64_t v162 = v82;
      int v145 = v53;
      (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 184LL))(a2, v79, &v143);
      float v94 = v157;
      if (v157 >= v158)
      {
        BOOL v96 = v156;
        uint64_t v97 = (v157 - (char *)v156) >> 2;
        unint64_t v98 = v97 + 1;
        uint64_t v99 = v158 - (char *)v156;
        else {
          unint64_t v100 = v98;
        }
        if (v100)
        {
          char v101 = (char *)sub_10002C050((uint64_t)&v158, v100);
          BOOL v96 = v156;
          float v94 = v157;
        }

        else
        {
          char v101 = 0LL;
        }

        uint64_t v102 = (int *)&v101[4 * v97];
        *uint64_t v102 = v79;
        uint64_t v95 = (uint64_t)(v102 + 1);
        while (v94 != (char *)v96)
        {
          int v103 = *((_DWORD *)v94 - 1);
          v94 -= 4;
          *--uint64_t v102 = v103;
        }

        int v156 = v102;
        int v157 = (char *)v95;
        v158 = &v101[4 * v100];
        if (v96) {
          operator delete(v96);
        }
      }

      else
      {
        *(_DWORD *)int v157 = v79;
        uint64_t v95 = (uint64_t)(v94 + 4);
      }

      int v157 = (char *)v95;
      v140[0] = &v161;
      v140[1] = a3;
      int v141 = -1;
      float v142 = a7;
      sub_100091998((uint64_t)v156, v95, (uint64_t)v140, (v95 - (uint64_t)v156) >> 2);
      if ((void)v146) {
        (*(void (**)(void))(*(void *)v146 + 32LL))(v146);
      }
      else {
        ++v148;
      }
    }

    if ((void)v146)
    {
      (*(void (**)(void))(*(void *)v146 + 8LL))();
      goto LABEL_136;
    }

LABEL_134:
    if (*((void *)&v147 + 1)) {
      --**((_DWORD **)&v147 + 1);
    }
LABEL_136:
    (*(void (**)(__int128 *__return_ptr, uint64_t, unint64_t))(*(void *)a1 + 24LL))(&v146, a1, v55);
    LODWORD(v106) = v146;
    v107 = sub_10002ADB0();
    *(float *)&__int128 v146 = v106;
    LODWORD(v143) = *v107;
    if (v106 != *(float *)&v143)
    {
      if (v56 == -INFINITY || v106 >= -INFINITY && v106 <= -INFINITY)
      {
        float v108 = *(float *)sub_1000606CC();
      }

      else if (v106 == INFINITY || v56 == INFINITY)
      {
        float v108 = INFINITY;
      }

      else
      {
        float v108 = v56 + v106;
      }

      uint64_t v110 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 176LL))(a2);
      uint64_t v111 = v162;
      if ((unint64_t)v162 >= v163[0])
      {
        uint64_t v113 = (v162 - v161) >> 3;
        unint64_t v114 = v113 + 1;
        uint64_t v115 = v163[0] - (void)v161;
        else {
          unint64_t v116 = v114;
        }
        float v118 = (char *)sub_100018788((uint64_t)v163, v116);
        v119 = &v118[8 * v113];
        *(_DWORD *)v119 = -1;
        *((float *)v119 + 1) = v108;
        v120 = v161;
        int v121 = v162;
        int v122 = v119;
        while (v121 != v120)
        {
          int v123 = *((_DWORD *)v121 - 2);
          v121 -= 8;
          *((_DWORD *)v122 - 2) = v123;
          v122 -= 8;
          *((_DWORD *)v122 + 1) = *((_DWORD *)v121 + 1);
        }

        uint64_t v112 = v119 + 8;
        uint64_t v161 = v122;
        unint64_t v162 = v119 + 8;
        v163[0] = &v118[8 * v117];
        if (v120) {
          operator delete(v120);
        }
      }

      else
      {
        *(_DWORD *)unint64_t v162 = -1;
        *((float *)v111 + 1) = v108;
        uint64_t v112 = v111 + 8;
      }

      unint64_t v162 = v112;
      *(void *)&__int128 v146 = 0LL;
      *((void *)&v146 + 1) = __PAIR64__(v53, LODWORD(v106));
      (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)a2 + 184LL))(a2, v110, &v146);
      v124 = v157;
      if (v157 >= v158)
      {
        v126 = v156;
        uint64_t v127 = (v157 - (char *)v156) >> 2;
        unint64_t v128 = v127 + 1;
        uint64_t v129 = v158 - (char *)v156;
        else {
          unint64_t v130 = v128;
        }
        if (v130)
        {
          v131 = (char *)sub_10002C050((uint64_t)&v158, v130);
          v126 = v156;
          v124 = v157;
        }

        else
        {
          v131 = 0LL;
        }

        v132 = (int *)&v131[4 * v127];
        int *v132 = v110;
        uint64_t v125 = (uint64_t)(v132 + 1);
        while (v124 != (char *)v126)
        {
          int v133 = *((_DWORD *)v124 - 1);
          v124 -= 4;
          *--v132 = v133;
        }

        int v156 = v132;
        int v157 = (char *)v125;
        v158 = &v131[4 * v130];
        if (v126) {
          operator delete(v126);
        }
      }

      else
      {
        *(_DWORD *)int v157 = v110;
        uint64_t v125 = (uint64_t)(v124 + 4);
      }

      int v157 = (char *)v125;
      v137[0] = &v161;
      v137[1] = a3;
      int v138 = -1;
      float v139 = a7;
      sub_100091998((uint64_t)v156, v125, (uint64_t)v137, (v125 - (uint64_t)v156) >> 2);
    }

LABEL_177:
    unint64_t v49 = v156;
    int v48 = v157;
  }

  while (v156 != (int *)v157);
LABEL_178:
  sub_10005EC50(a2);
  uint64_t v134 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0xFFFFFFFF0007LL, 0LL);
  uint64_t v135 = sub_1000A4C64(v134, 0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 168LL))(a2, v135, 0xFFFFFFFF0007LL);
  if (__p)
  {
    unint64_t v153 = (char *)__p;
    operator delete(__p);
  }

  if (v156)
  {
    int v157 = (char *)v156;
    operator delete(v156);
  }

void sub_1000916C4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *__p, uint64_t a34)
{
  if (__p) {
    operator delete(__p);
  }
  unint64_t v36 = *(void **)(v34 - 176);
  if (v36)
  {
    *(void *)(v34 - 16sub_100017FC4(v21 + 8) = v36;
    operator delete(v36);
  }

  uint64_t v37 = *(void **)(v34 - 144);
  if (v37)
  {
    *(void *)(v34 - 136) = v37;
    operator delete(v37);
  }

  _Unwind_Resume(exception_object);
}

void *sub_1000917AC(void *a1)
{
  *a1 = off_1000D3F88;
  sub_100017FC4((uint64_t)(a1 + 1));
  return a1;
}

BOOL sub_1000917DC(uint64_t a1, uint64_t a2, float *a3, float *a4)
{
  float v5 = *a3;
  if (*a3 == -INFINITY || (float v6 = *a4, *a4 >= -INFINITY) && *a4 <= -INFINITY)
  {
    float v5 = *(float *)sub_1000606CC();
    float v6 = *a4;
  }

  else if (v5 >= v6)
  {
    float v5 = *a4;
  }

  return v6 == v5;
}

int *sub_10009185C(int **a1, void *a2, int *a3)
{
  uint64_t result = (int *)a2[1];
  float v5 = *a1;
  float v6 = result;
  if (*a1 != a3)
  {
    uint64_t v7 = a3;
    float v6 = (int *)a2[1];
    do
    {
      int v8 = *--v7;
      *--float v6 = v8;
    }

    while (v7 != v5);
  }

  a2[1] = v6;
  uint64_t v9 = a1[1];
  for (uint64_t i = (_DWORD *)a2[2]; a3 != v9; ++i)
  {
    int v11 = *a3++;
    *uint64_t i = v11;
  }

  a2[2] = i;
  int v12 = *a1;
  *a1 = v6;
  a2[1] = v12;
  uint64_t v13 = a1[1];
  a1[1] = (int *)a2[2];
  a2[2] = v13;
  uint64_t v14 = a1[2];
  a1[2] = (int *)a2[3];
  a2[3] = v14;
  *a2 = a2[1];
  return result;
}

int *sub_1000918EC(int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  uint64_t v7 = a3 - 2;
  if (a3 < 2) {
    uint64_t v7 = a3 - 1;
  }
  uint64_t v8 = v7 >> 1;
  do
  {
    uint64_t v9 = &a1[v6 + 1];
    uint64_t v10 = (2 * v6) | 1;
    uint64_t v11 = 2 * v6 + 2;
    if (v11 < a3 && sub_100091A34(a2, *v9, a1[v6 + 2]))
    {
      ++v9;
      uint64_t v10 = v11;
    }

    *a1 = *v9;
    a1 = v9;
    uint64_t v6 = v10;
  }

  while (v10 <= v8);
  return v9;
}

uint64_t sub_100091998(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4 = a4 - 2;
  if (a4 >= 2)
  {
    uint64_t v6 = result;
    unint64_t v7 = v4 >> 1;
    uint64_t v8 = (int *)(result + 4 * (v4 >> 1));
    uint64_t v9 = (int *)(a2 - 4);
    uint64_t result = sub_100091A34(a3, *v8, *(_DWORD *)(a2 - 4));
    if ((_DWORD)result)
    {
      int v10 = *v9;
      do
      {
        uint64_t v11 = v8;
        *uint64_t v9 = *v8;
        if (!v7) {
          break;
        }
        unint64_t v7 = (v7 - 1) >> 1;
        uint64_t v8 = (int *)(v6 + 4 * v7);
        uint64_t result = sub_100091A34(a3, *v8, v10);
        uint64_t v9 = v11;
      }

      while ((result & 1) != 0);
      *uint64_t v11 = v10;
    }
  }

  return result;
}

uint64_t sub_100091A34(uint64_t a1, int a2, int a3)
{
  uint64_t v6 = **(void **)a1;
  unint64_t v7 = (int *)(v6 + 8LL * a2);
  uint64_t v8 = (int *)(v6 + 8LL * a3);
  sub_100091BF0(a1, *v7, (int *)&v26);
  if (v26 == -INFINITY || (float v9 = *(float *)(v6 + 8LL * a2 + 4), v9 >= -INFINITY) && v9 <= -INFINITY)
  {
    float v10 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v11 = v9 == INFINITY || v26 == INFINITY;
    float v10 = v26 + v9;
    if (v11) {
      float v10 = INFINITY;
    }
  }

  float v27 = v10;
  sub_100091BF0(a1, *v8, (int *)&v25);
  if (v25 == -INFINITY || (float v12 = *(float *)(v6 + 8LL * a3 + 4), v12 >= -INFINITY) && v12 <= -INFINITY)
  {
    float v13 = *(float *)sub_1000606CC();
  }

  else
  {
    BOOL v14 = v12 == INFINITY || v25 == INFINITY;
    float v13 = v25 + v12;
    if (v14) {
      float v13 = INFINITY;
    }
  }

  float v26 = v13;
  int v15 = *v7;
  int v16 = *(_DWORD *)(a1 + 16);
  int v17 = *v8;
  uint64_t v18 = a1 + 24;
  if (*v7 != v16 || v17 == v16)
  {
    LODWORD(result) = sub_10007F7A8(v18, &v26, &v27);
    int v21 = result;
    BOOL v22 = v15 != v16 && v17 == v16;
    if (v22) {
      uint64_t result = 0LL;
    }
    else {
      uint64_t result = result;
    }
    if (v22 && v21)
    {
      float v23 = *(float *)(a1 + 20);
      return v27 > (float)(v23 + v26) || v26 > (float)(v23 + v27);
    }
  }

  else if (sub_10007F7A8(v18, &v26, &v27))
  {
    return 1LL;
  }

  else
  {
    float v24 = *(float *)(a1 + 20);
    return v27 <= (float)(v24 + v26) && v26 <= (float)(v24 + v27);
  }

  return result;
}

float sub_100091BF0@<S0>(uint64_t a1@<X0>, int a2@<W1>, int *a3@<X8>)
{
  if (*(_DWORD *)(a1 + 16) == a2)
  {
    unint64_t v4 = sub_10002AD60();
  }

  else
  {
    uint64_t v5 = **(void **)(a1 + 8);
    else {
      unint64_t v4 = (int *)(v5 + 4LL * a2);
    }
  }

  float result = *(float *)v4;
  *a3 = *v4;
  return result;
}

uint64_t sub_100091C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  sub_100091F98(a2, &v12, &v11, a5, __p);
  *(_OWORD *)(a1 + sub_100017FC4(v21 + 8) = *(_OWORD *)__p;
  *(void *)a1 = off_1000D39C0;
  if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 56LL))(a2, 0x10000LL, 1LL))
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v13, (uint64_t)__p);
    unint64_t v7 = sub_10002A6A4(&std::cerr, (uint64_t)"DeterminizeFst: ", 16LL);
    sub_10002A6A4(v7, (uint64_t)"Distance to final states computed for acceptors only", 52LL);
    sub_10002AA94(&v13);
    if (v10 < 0) {
      operator delete(__p[0]);
    }
    *(void *)(*(void *)(a1 + 8) + 8LL) |= 4uLL;
  }

  return a1;
}

void sub_100091D68( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  *BOOL v14 = off_1000D3F88;
  sub_100017FC4(v15);
  _Unwind_Resume(a1);
}

void sub_100091DBC(void *a1)
{
  *a1 = off_1000D3F88;
  sub_100017FC4((uint64_t)(a1 + 1));
  operator delete(a1);
}

uint64_t sub_100091DEC(uint64_t a1)
{
  return sub_1000967EC(*(void *)(a1 + 8));
}

float sub_100091DF4@<S0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  return sub_10009687C(*(uint64_t **)(a1 + 8), a2, a3);
}

uint64_t sub_100091DFC(uint64_t a1, uint64_t a2)
{
  return sub_100072A80(*(void **)(a1 + 8), a2);
}

uint64_t sub_100091E04(uint64_t a1, uint64_t a2)
{
  return sub_100072B4C(*(void **)(a1 + 8), a2);
}

uint64_t sub_100091E0C(uint64_t a1, uint64_t a2)
{
  return sub_100072BB4(*(void **)(a1 + 8), a2);
}

uint64_t sub_100091E14(uint64_t a1, uint64_t a2, int a3)
{
  if (!a3) {
    return (*(uint64_t (**)(void, uint64_t))(**(void **)(a1 + 8) + 24LL))(*(void *)(a1 + 8), a2);
  }
  unint64_t v5 = sub_1000886D0(a1, a2, &v7);
  *(void *)(*(void *)(a1 + 8) + 8LL) = *(void *)(*(void *)(a1 + 8) + 8LL) & (~v7 | 4) | v7 & v5;
  return v5 & a2;
}

uint64_t sub_100091E98(uint64_t a1)
{
  return *(void *)(a1 + 8) + 16LL;
}

void *sub_100091EA4(uint64_t a1, int a2)
{
  unint64_t v4 = operator new(0x18uLL);
  sub_100096924(v4, a1, a2);
  return v4;
}

void sub_100091EE8(_Unwind_Exception *a1)
{
}

uint64_t sub_100091EFC(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 40LL);
}

uint64_t sub_100091F08(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL);
}

uint64_t sub_100091F14(uint64_t *a1, void *a2)
{
  unint64_t v4 = operator new(0x20uLL);
  *unint64_t v4 = &off_1000D4118;
  v4[1] = a1;
  uint64_t v5 = *a1;
  v4[2] = a1[1];
  *((_DWORD *)v4 + 6) = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t *))(v5 + 16))(a1);
  *unint64_t v4 = &off_1000D4098;
  *a2 = v4;
  return result;
}

void sub_100091F7C(_Unwind_Exception *a1)
{
}

uint64_t sub_100091F90(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_100073028(*(void *)(a1 + 8), a2, a3);
}

void *sub_100091F98@<X0>( uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t *a3@<X3>, uint64_t a4@<X4>, void *a5@<X8>)
{
  char v10 = operator new(0xD8uLL);
  uint64_t result = sub_100092010(v10, a1, a2, a3, a4);
  *a5 = v10 + 3;
  a5[1] = v10;
  return result;
}

void sub_100091FFC(_Unwind_Exception *a1)
{
}

void *sub_100092010(void *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  a1[1] = 0LL;
  a1[2] = 0LL;
  *a1 = off_1000D3A88;
  sub_1000920A0(a1 + 3, a2, *a3, *a4, a5);
  return a1;
}

void sub_10009204C(_Unwind_Exception *a1)
{
}

void sub_100092060(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3A88;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_100092070(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_1000D3A88;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete(v1);
}

uint64_t sub_100092090(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

void *sub_1000920A0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_1000922AC((uint64_t)a1, a2, a5);
  *(void *)uint64_t v10 = off_1000D3AD8;
  *(_DWORD *)(v10 + 144) = *(_DWORD *)(a5 + 16);
  *(void *)(v10 + 152) = a3;
  *(void *)(v10 + 160) = a4;
  uint64_t v11 = *(void **)(a5 + 32);
  if (!v11)
  {
    uint64_t v11 = operator new(8uLL);
    *uint64_t v11 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 72LL))(a2, 0LL);
  }

  a1[22] = v11;
  uint64_t v12 = *(void **)(a5 + 40);
  if (!v12)
  {
    uint64_t v12 = operator new(0x90uLL);
    *uint64_t v12 = 0LL;
    sub_100093DB4((uint64_t)(v12 + 1), 0LL, 0LL, 0LL);
  }

  a1[23] = v12;
  if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 56LL))(a2, 0x10000LL, 1LL))
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v17, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"DeterminizeFst: Argument not an acceptor", 40LL);
    sub_10002AA94(&v17);
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    a1[1] |= 4uLL;
  }

  BOOL v13 = (void *)a1[20];
  if (v13) {
    v13[1] = *v13;
  }
  return a1;
}

void sub_10009221C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_100094000(v19, 0LL);
  sub_1000940E0((uint64_t **)(v18 + 176), 0LL);
  sub_10009245C((void *)v18);
  _Unwind_Resume(a1);
}

uint64_t sub_1000922AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)sub_1000928B0(a1, a3) = off_1000D3B88;
  *(void *)(a1 + 136) = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 72LL))(a2, 0LL);
  sub_10000A2DC(&__str, "determinize");
  std::string::operator=((std::string *)(a1 + 16), &__str);
  unint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 56LL))(a2, 0xFFFFFFFF0007LL, 0LL);
  BOOL v8 = *(_DWORD *)(a3 + 24) != 1 || *(_BYTE *)(a3 + 28) != 0;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = *(void *)(a1 + 8) & 0xFFFF00000000FFFFLL | sub_1000A4834(v6, *(_DWORD *)(a3 + 20) != 0, v8) & 0xFFFFFFFF0004LL;
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 96LL))(a2);
  if (v9) {
    uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)v9 + 16LL))(v9);
  }
  uint64_t v10 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v9;
  if (v10) {
    (*(void (**)(uint64_t))(*(void *)v10 + 8LL))(v10);
  }
  uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 104LL))(a2);
  if (v11) {
    uint64_t v11 = (*(uint64_t (**)(uint64_t))(*(void *)v11 + 16LL))(v11);
  }
  uint64_t v12 = *(void *)(a1 + 48);
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = v11;
  if (v12) {
    (*(void (**)(uint64_t))(*(void *)v12 + 8LL))(v12);
  }
  return a1;
}

void sub_100092408( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v17 = *(void *)(v15 + 136);
  *(void *)(v15 + 136) = 0LL;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  sub_100093D0C(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_10009245C(void *a1)
{
  *a1 = off_1000D3B88;
  uint64_t v2 = a1[17];
  a1[17] = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return sub_100093D0C((uint64_t)a1);
}

uint64_t sub_1000924A0(uint64_t a1)
{
  *(void *)a1 = off_1000D3AD8;
  sub_100094000((void **)(a1 + 184), 0LL);
  sub_1000940E0((uint64_t **)(a1 + 176), 0LL);
  *(void *)a1 = off_1000D3B88;
  uint64_t v2 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  return sub_100093D0C(a1);
}

void sub_100092504(uint64_t a1)
{
  *(void *)a1 = off_1000D3AD8;
  sub_100094000((void **)(a1 + 184), 0LL);
  sub_1000940E0((uint64_t **)(a1 + 176), 0LL);
  *(void *)a1 = off_1000D3B88;
  uint64_t v2 = *(void *)(a1 + 136);
  *(void *)(a1 + 136) = 0LL;
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 8LL))(v2);
  }
  uint64_t v3 = (void *)sub_100093D0C(a1);
  operator delete(v3);
}

uint64_t sub_10009256C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, 0xFFFFFFFF0007LL);
}

uint64_t sub_100092580(uint64_t a1, uint64_t a2)
{
  if ((a2 & 4) != 0
    && (*(uint64_t (**)(void, uint64_t, void))(**(void **)(a1 + 136) + 56LL))( *(void *)(a1 + 136),  4LL,  0LL))
  {
    *(void *)(a1 + 8) |= 4uLL;
  }

  return *(void *)(a1 + 8) & a2;
}

void *sub_1000925D4(uint64_t a1)
{
  uint64_t v2 = operator new(0xC0uLL);
  sub_10009412C(v2, a1);
  return v2;
}

void sub_100092608(_Unwind_Exception *a1)
{
}

void sub_10009261C(void *a1, int a2)
{
  v9[0] = 0LL;
  v9[1] = 0LL;
  BOOL v8 = (void **)v9;
  sub_100094DBC(a1, a2, &v8);
  unint64_t v4 = v8;
  if (v8 != (void **)v9)
  {
    do
    {
      sub_100094FE8((uint64_t)a1, a2, v4 + 5);
      uint64_t v5 = (void **)v4[1];
      if (v5)
      {
        do
        {
          unint64_t v6 = v5;
          uint64_t v5 = (void **)*v5;
        }

        while (v5);
      }

      else
      {
        do
        {
          unint64_t v6 = (void **)v4[2];
          BOOL v7 = *v6 == v4;
          unint64_t v4 = v6;
        }

        while (!v7);
      }

      unint64_t v4 = v6;
    }

    while (v6 != (void **)v9);
  }

  sub_100095054((uint64_t)a1, a2);
  sub_10001A7A8((uint64_t)&v8, v9[0]);
}

void sub_1000926D0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, void *a11)
{
}

uint64_t sub_1000926EC(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 136) + 16LL))(*(void *)(a1 + 136));
  if ((_DWORD)result != -1)
  {
    int v3 = result;
    int v4 = *sub_10002AD60();
    uint64_t v5 = operator new(0x10uLL);
    *(void *)uint64_t v5 = 0LL;
    v5[8] = -1;
    unint64_t v6 = operator new(0x10uLL);
    *(void *)unint64_t v6 = 0LL;
    v6[2] = v3;
    v6[3] = v4;
    *(void *)uint64_t v5 = v6;
    v5[8] = 0;
    return sub_1000956B4(a1, v5);
  }

  return result;
}

int *sub_10009278C@<X0>(uint64_t a1@<X0>, int a2@<W1>, int *a3@<X8>)
{
  uint64_t v5 = *(float ***)(*(void *)(*(void *)(a1 + 184) + 112LL) + 8LL * a2);
  uint64_t result = sub_10002ADB0();
  float v7 = *(float *)result;
  *a3 = *result;
  for (uint64_t i = *v5; i; uint64_t i = *(float **)i)
  {
    uint64_t result = (int *)(*(void *(**)(uint64_t *__return_ptr, void, void))(**(void **)(a1 + 136) + 24LL))( &v12,  *(void *)(a1 + 136),  *((unsigned int *)i + 2));
    float v9 = i[3];
    if (v9 == -INFINITY || *(float *)&v12 >= -INFINITY && *(float *)&v12 <= -INFINITY)
    {
      uint64_t result = sub_1000606CC();
      float v10 = *(float *)result;
    }

    else
    {
      BOOL v11 = *(float *)&v12 == INFINITY || v9 == INFINITY;
      float v10 = v9 + *(float *)&v12;
      if (v11) {
        float v10 = INFINITY;
      }
    }

    if (v7 == -INFINITY || v10 >= -INFINITY && v10 <= -INFINITY)
    {
      uint64_t result = sub_1000606CC();
      float v7 = *(float *)result;
    }

    else if (v7 >= v10)
    {
      float v7 = v10;
    }

    *(float *)a3 = v7;
    if (v7 >= -INFINITY && v7 <= -INFINITY) {
      *(void *)(a1 + 8) |= 4uLL;
    }
  }

  return result;
}

uint64_t sub_1000928B0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = off_1000D3320;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = 0LL;
  *(void *)a1 = off_1000D3BD8;
  *(_BYTE *)(a1 + 56) = 0;
  *(void *)(a1 + 60) = 0xFFFFFFFFLL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 8sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 96) = 0xFFFFFFFF00000000LL;
  *(_BYTE *)(a1 + 104) = *(_BYTE *)a2;
  *(void *)(a1 + 112) = *(void *)(a2 + 8);
  int v4 = operator new(0x88uLL);
  sub_1000929D8((uint64_t)v4, (_BYTE *)a2);
  unint64_t v5 = *(void *)(a2 + 8);
  v4[88] = v5 == 0;
  *((_DWORD *)v4 + 23) = -1;
  *((void *)v4 + 12) = 0LL;
  v4[104] = *(_BYTE *)a2;
  if (v5 <= 0x1FA0) {
    unint64_t v5 = 8096LL;
  }
  *((void *)v4 + 14) = v5;
  v4[120] = 0;
  *((void *)v4 + 16) = 0LL;
  *(void *)(a1 + 120) = v4;
  *(_WORD *)(a1 + 12sub_100017FC4(v21 + 8) = 257;
  return a1;
}

void sub_100092990(_Unwind_Exception *a1)
{
  if (*v3) {
    operator delete(*v3);
  }
  sub_10008847C(v1);
  _Unwind_Resume(a1);
}

void sub_1000929C4(uint64_t a1)
{
  uint64_t v1 = (void *)sub_100093D0C(a1);
  operator delete(v1);
}

uint64_t sub_1000929D8(uint64_t a1, _BYTE *a2)
{
  *(_BYTE *)a1 = *a2;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + ++*(void *)(result + 24) = 0LL;
  *(void *)(a1 + 32) = a1 + 32;
  *(void *)(a1 + 40) = a1 + 32;
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = 0LL;
  int v3 = operator new(0x28uLL);
  *(void *)(a1 + 56) = v3;
  *(void *)(a1 + 64) = 0LL;
  *(_OWORD *)int v3 = xmmword_1000AC970;
  v3[3] = 0LL;
  v3[4] = 0LL;
  v3[2] = 0LL;
  int v4 = operator new(0x28uLL);
  *(_OWORD *)int v4 = xmmword_1000AC970;
  int v4[3] = 0LL;
  v4[4] = 0LL;
  v4[2] = 0LL;
  *(void *)(a1 + 72) = v4;
  unint64_t v5 = operator new(0x28uLL);
  *(_OWORD *)unint64_t v5 = xmmword_1000AC970;
  void v5[3] = 0LL;
  v5[4] = 0LL;
  v5[2] = 0LL;
  *(void *)(a1 + 80) = v5;
  sub_100092AF4(a1);
  *(void *)(a1 + 64) = *(void *)(a1 + 40);
  return a1;
}

void sub_100092AA4(_Unwind_Exception *a1)
{
  unint64_t v6 = v4;
  sub_10006C608(v6);
  sub_10006C608(v3 + 2);
  sub_10006B424(v2);
  sub_10006C608(v3);
  BOOL v8 = *v5;
  if (*v5)
  {
    *(void *)(v1 + 16) = v8;
    operator delete(v8);
  }

  _Unwind_Resume(a1);
}

void *sub_100092AF4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a1 + 8))
  {
    unint64_t v3 = 0LL;
    uint64_t v2 = *(void *)(a1 + 8);
    do
    {
      sub_100092B58(*(void **)(v2 + 8 * v3++), (uint64_t **)(a1 + 72));
      uint64_t v2 = *(void *)(a1 + 8);
    }

    while (v3 < (*(void *)(a1 + 16) - v2) >> 3);
  }

  *(void *)(a1 + 16) = v2;
  return sub_10006B424((void *)(a1 + 32));
}

void *sub_100092B58(void *result, uint64_t **a2)
{
  if (result)
  {
    unint64_t v3 = (void ***)result;
    int v4 = (void **)(result + 3);
    sub_100092BB0(&v4);
    sub_10006C608(v3 + 6);
    uint64_t result = sub_1000934F8(*a2);
    v3[8] = (void **)result[7];
    result[7] = v3;
  }

  return result;
}

void sub_100092BB0(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    v1[1] = v2;
    sub_100092BE8(v1 + 3, v2, ((char *)v1[2] - (char *)v2) >> 4);
  }

void sub_100092BE8(uint64_t **a1, void *__p, unint64_t a3)
{
  if (a3 == 2)
  {
    int v4 = sub_100092E18(*a1);
    if (!__p) {
      return;
    }
    __p[4] = v4[7];
    goto LABEL_22;
  }

  if (a3 == 1)
  {
    int v4 = sub_100092CF4(*a1);
    if (!__p) {
      return;
    }
    __p[2] = v4[7];
    goto LABEL_22;
  }

  if (a3 <= 4)
  {
    int v4 = sub_100092F3C(*a1);
    if (!__p) {
      return;
    }
    __p[8] = v4[7];
    goto LABEL_22;
  }

  if (a3 <= 8)
  {
    int v4 = sub_100093060(*a1);
    if (!__p) {
      return;
    }
    __p[16] = v4[7];
    goto LABEL_22;
  }

  if (a3 <= 0x10)
  {
    int v4 = sub_100093184(*a1);
    if (!__p) {
      return;
    }
    __p[32] = v4[7];
    goto LABEL_22;
  }

  if (a3 <= 0x20)
  {
    int v4 = sub_1000932A8(*a1);
    if (!__p) {
      return;
    }
    __p[64] = v4[7];
    goto LABEL_22;
  }

  if (a3 > 0x40)
  {
    operator delete(__p);
    return;
  }

  int v4 = sub_1000933D0(*a1);
  if (__p)
  {
    __p[128] = v4[7];
LABEL_22:
    v4[7] = __p;
  }

void *sub_100092CF4(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x87)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x11uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 128);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1360;
    sub_100069948(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3C08;
    uint64_t v6 = *(void *)(*v3 + 128);
    *(void *)(*v3 + 12sub_100017FC4(v21 + 8) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100092D94(_Unwind_Exception *a1)
{
}

void *sub_100092DA8(void *a1)
{
  *a1 = off_1000D1360;
  a1[1] = off_1000D1388;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100092DE0(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1360;
  a1[1] = (uint64_t)off_1000D1388;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100092E18(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x107)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x21uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 256);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1420;
    sub_100069BCC(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3C48;
    uint64_t v6 = *(void *)(*v3 + 256);
    *(void *)(*v3 + 256) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100092EB8(_Unwind_Exception *a1)
{
}

void *sub_100092ECC(void *a1)
{
  *a1 = off_1000D1420;
  a1[1] = off_1000D1448;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100092F04(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1420;
  a1[1] = (uint64_t)off_1000D1448;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100092F3C(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x207)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x41uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 512);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D14E0;
    sub_100069E50(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3C88;
    uint64_t v6 = *(void *)(*v3 + 512);
    *(void *)(*v3 + 512) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100092FDC(_Unwind_Exception *a1)
{
}

void *sub_100092FF0(void *a1)
{
  *a1 = off_1000D14E0;
  a1[1] = off_1000D1508;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093028(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D14E0;
  a1[1] = (uint64_t)off_1000D1508;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093060(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x407)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x81uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 1024);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D15A0;
    sub_10006A0D4(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3CC8;
    uint64_t v6 = *(void *)(*v3 + 1024);
    *(void *)(*v3 + 10++*(void *)(result + 24) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093100(_Unwind_Exception *a1)
{
}

void *sub_100093114(void *a1)
{
  *a1 = off_1000D15A0;
  a1[1] = off_1000D15C8;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_10009314C(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D15A0;
  a1[1] = (uint64_t)off_1000D15C8;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093184(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x807)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x101uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 2048);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1660;
    sub_10006A358(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3D08;
    uint64_t v6 = *(void *)(*v3 + 2048);
    *(void *)(*v3 + 204sub_100017FC4(v21 + 8) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093224(_Unwind_Exception *a1)
{
}

void *sub_100093238(void *a1)
{
  *a1 = off_1000D1660;
  a1[1] = off_1000D1688;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093270(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1660;
  a1[1] = (uint64_t)off_1000D1688;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_1000932A8(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) >> 3 <= 0x200)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x201uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 4096);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1720;
    sub_10006A5E0(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3D48;
    uint64_t v6 = *(void *)(*v3 + 4096);
    *(void *)(*v3 + 4096) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_10009334C(_Unwind_Exception *a1)
{
}

void *sub_100093360(void *a1)
{
  *a1 = off_1000D1720;
  a1[1] = off_1000D1748;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093398(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1720;
  a1[1] = (uint64_t)off_1000D1748;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_1000933D0(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) >> 3 <= 0x400)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x401uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 0x2000);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D17E0;
    sub_10006A868(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3D88;
    uint64_t v6 = *(void *)(*v3 + 0x2000);
    *(void *)(*v3 + 0x2000) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093474(_Unwind_Exception *a1)
{
}

void *sub_100093488(void *a1)
{
  *a1 = off_1000D17E0;
  a1[1] = off_1000D1808;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_1000934C0(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D17E0;
  a1[1] = (uint64_t)off_1000D1808;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_1000934F8(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x207)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x41uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 512);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D14E0;
    sub_100069E50(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3DC8;
    uint64_t v6 = *(void *)(*v3 + 512);
    *(void *)(*v3 + 512) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093598(_Unwind_Exception *a1)
{
}

void *sub_1000935AC(void *a1)
{
  *a1 = off_1000D14E0;
  a1[1] = off_1000D1508;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_1000935E4(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D14E0;
  a1[1] = (uint64_t)off_1000D1508;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_10009361C(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x407)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x81uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 1024);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D15A0;
    sub_10006A0D4(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3E08;
    uint64_t v6 = *(void *)(*v3 + 1024);
    *(void *)(*v3 + 10++*(void *)(result + 24) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_1000936BC(_Unwind_Exception *a1)
{
}

void *sub_1000936D0(void *a1)
{
  *a1 = off_1000D15A0;
  a1[1] = off_1000D15C8;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093708(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D15A0;
  a1[1] = (uint64_t)off_1000D15C8;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093740(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x807)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x101uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 2048);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1660;
    sub_10006A358(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3E48;
    uint64_t v6 = *(void *)(*v3 + 2048);
    *(void *)(*v3 + 204sub_100017FC4(v21 + 8) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_1000937E0(_Unwind_Exception *a1)
{
}

void *sub_1000937F4(void *a1)
{
  *a1 = off_1000D1660;
  a1[1] = off_1000D1688;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_10009382C(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1660;
  a1[1] = (uint64_t)off_1000D1688;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093864(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) >> 3 <= 0x200)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x201uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 4096);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1720;
    sub_10006A5E0(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3E88;
    uint64_t v6 = *(void *)(*v3 + 4096);
    *(void *)(*v3 + 4096) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093908(_Unwind_Exception *a1)
{
}

void *sub_10009391C(void *a1)
{
  *a1 = off_1000D1720;
  a1[1] = off_1000D1748;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093954(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1720;
  a1[1] = (uint64_t)off_1000D1748;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_10009398C(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) >> 3 <= 0x400)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x401uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 0x2000);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D17E0;
    sub_10006A868(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3EC8;
    uint64_t v6 = *(void *)(*v3 + 0x2000);
    *(void *)(*v3 + 0x2000) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093A30(_Unwind_Exception *a1)
{
}

void *sub_100093A44(void *a1)
{
  *a1 = off_1000D17E0;
  a1[1] = off_1000D1808;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093A7C(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D17E0;
  a1[1] = (uint64_t)off_1000D1808;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093AB4(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) >> 3 <= 0x800)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x801uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 0x4000);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D19E0;
    sub_10006B0AC(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3F08;
    uint64_t v6 = *(void *)(*v3 + 0x4000);
    *(void *)(*v3 + 0x4000) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093B58(_Unwind_Exception *a1)
{
}

void *sub_100093B6C(void *a1)
{
  *a1 = off_1000D19E0;
  a1[1] = off_1000D1A08;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093BA4(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D19E0;
  a1[1] = (uint64_t)off_1000D1A08;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

void *sub_100093BDC(uint64_t *a1)
{
  uint64_t v2 = a1[2];
  unint64_t v3 = a1 + 2;
  if ((unint64_t)(a1[3] - v2) <= 0x8007)
  {
    sub_100069658((uint64_t)(a1 + 2), 0x1001uLL);
    uint64_t v2 = *v3;
  }

  int v4 = *(void **)(v2 + 0x8000);
  if (!v4)
  {
    int v4 = operator new(0x40uLL);
    uint64_t v5 = *a1;
    *int v4 = off_1000D1AA0;
    sub_10006B33C(v4 + 1, v5);
    v4[7] = 0LL;
    *int v4 = off_1000D3F48;
    uint64_t v6 = *(void *)(*v3 + 0x8000);
    *(void *)(*v3 + 0x8000) = v4;
    if (v6) {
      (*(void (**)(uint64_t))(*(void *)v6 + 8LL))(v6);
    }
  }

  return v4;
}

void sub_100093C88(_Unwind_Exception *a1)
{
}

void *sub_100093C9C(void *a1)
{
  *a1 = off_1000D1AA0;
  a1[1] = off_1000D1AC8;
  sub_10002B998(a1 + 4);
  return a1;
}

void sub_100093CD4(uint64_t *a1)
{
  *a1 = (uint64_t)off_1000D1AA0;
  a1[1] = (uint64_t)off_1000D1AC8;
  sub_10002B998(a1 + 4);
  operator delete(a1);
}

uint64_t sub_100093D0C(uint64_t a1)
{
  *(void *)a1 = off_1000D3BD8;
  if (*(_BYTE *)(a1 + 129))
  {
    uint64_t v2 = *(void *)(a1 + 120);
    if (v2)
    {
      unint64_t v3 = (void *)sub_100093D5C(v2);
      operator delete(v3);
    }
  }

  int v4 = *(void **)(a1 + 72);
  if (v4) {
    operator delete(v4);
  }
  return sub_10008847C(a1);
}

uint64_t sub_100093D5C(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 8);
  if (v2)
  {
    *(void *)(a1 + 16) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_100093DB4(uint64_t a1, size_t a2, void *a3, void *a4)
{
  if (!a3) {
    a3 = operator new(1uLL);
  }
  *(void *)a1 = a3;
  if (!a4) {
    a4 = operator new(1uLL);
  }
  *(void *)(a1 + sub_100017FC4(v21 + 8) = a4;
  *(void *)(a1 + 16) = a1;
  *(void *)(a1 + ++*(void *)(result + 24) = a1;
  sub_100093E98(a1 + 32, a2, (void *)(a1 + 16), (void *)(a1 + 24));
  *(void *)(a1 + 104) = 0LL;
  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  if (a2) {
    sub_10002D348((void **)(a1 + 104), a2);
  }
  return a1;
}

void sub_100093E44(_Unwind_Exception *exception_object)
{
  unint64_t v3 = *v1;
  void *v1 = 0LL;
  if (v3) {
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100093E98(uint64_t a1, size_t a2, void *a3, void *a4)
{
  BOOL v8 = (void **)operator new(0x28uLL);
  v8[3] = 0LL;
  v8[4] = 0LL;
  v8[2] = 0LL;
  *(void *)a1 = 0LL;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 16) = v8;
  *(_OWORD *)BOOL v8 = xmmword_1000AC980;
  BOOL v11 = v8;
  sub_10006C608(&v11);
  *(void *)(a1 + ++*(void *)(result + 24) = 0LL;
  float v9 = operator new(0x28uLL);
  *(_OWORD *)float v9 = xmmword_1000AC970;
  v9[3] = 0LL;
  v9[4] = 0LL;
  void v9[2] = 0LL;
  *(void *)(a1 + 32) = v9;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = *a3;
  *(_DWORD *)(a1 + 56) = 1065353216;
  *(void *)(a1 + 64) = *a4;
  sub_10006D600(a1, a2);
  return a1;
}

void sub_100093F5C(_Unwind_Exception *a1)
{
}

uint64_t sub_100093F80(uint64_t a1)
{
  return sub_10006CB40(a1);
}

void *sub_100093FB0(void *result, void *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    unint64_t v3 = result;
    do
    {
      int v4 = (void *)*v2;
      uint64_t result = sub_10006E014((uint64_t *)v3[4]);
      v2[3] = result[7];
      result[7] = v2;
      uint64_t v2 = v4;
    }

    while (v4);
  }

  return result;
}

void sub_100094000(void **a1, void *a2)
{
  unint64_t v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    int v4 = sub_10009402C(v3);
    operator delete(v4);
  }

void *sub_10009402C(void *a1)
{
  int v4 = a1 + 14;
  uint64_t v2 = (void *)a1[14];
  uint64_t v3 = v4[1];
  if ((int)((unint64_t)(v3 - (void)v2) >> 3) >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      uint64_t v6 = (void **)v2[v5];
      if (v6)
      {
        float v7 = *v6;
        if (*v6)
        {
          do
          {
            BOOL v8 = (void *)*v7;
            operator delete(v7);
            float v7 = v8;
          }

          while (v8);
        }

        operator delete(v6);
        uint64_t v2 = (void *)a1[14];
        uint64_t v3 = a1[15];
      }

      ++v5;
    }

    while (v5 < (int)((unint64_t)(v3 - (void)v2) >> 3));
  }

  if (v2)
  {
    a1[15] = v2;
    operator delete(v2);
  }

  sub_100093F80((uint64_t)(a1 + 5));
  float v9 = (void *)a1[2];
  a1[2] = 0LL;
  if (v9) {
    operator delete(v9);
  }
  float v10 = (void *)a1[1];
  a1[1] = 0LL;
  if (v10) {
    operator delete(v10);
  }
  return a1;
}

void sub_1000940E0(uint64_t **a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  *a1 = a2;
  if (v2)
  {
    uint64_t v3 = *v2;
    *uint64_t v2 = 0LL;
    if (v3) {
      (*(void (**)(uint64_t))(*(void *)v3 + 8LL))(v3);
    }
    operator delete(v2);
  }

void *sub_10009412C(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_1000942FC((uint64_t)a1, a2);
  *(void *)uint64_t v4 = off_1000D3AD8;
  *(_DWORD *)(v4 + 144) = *(_DWORD *)(a2 + 144);
  *(void *)(v4 + 152) = 0LL;
  *(void *)(v4 + 160) = 0LL;
  uint64_t v5 = operator new(8uLL);
  if (a1[17]) {
    uint64_t v6 = a1[17];
  }
  else {
    uint64_t v6 = **(void **)(a2 + 176);
  }
  void *v5 = (*(uint64_t (**)(uint64_t, void))(*(void *)v6 + 72LL))(v6, 0LL);
  a1[22] = v5;
  float v7 = operator new(0x90uLL);
  BOOL v8 = *(size_t **)(a2 + 184);
  size_t v9 = *v8;
  *float v7 = *v8;
  sub_100093DB4((uint64_t)(v7 + 1), v9, 0LL, 0LL);
  a1[23] = v7;
  if (*(void *)(a2 + 160))
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v13, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"DeterminizeFsaImpl: Cannot copy with out_dist vector", 52LL);
    sub_10002AA94(&v13);
    if (v12 < 0) {
      operator delete(__p[0]);
    }
    a1[1] |= 4uLL;
  }

  return a1;
}

void sub_100094270( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_100094000(v19, 0LL);
  sub_1000940E0((uint64_t **)(v18 + 176), 0LL);
  sub_10009245C((void *)v18);
  _Unwind_Resume(a1);
}

uint64_t sub_1000942FC(uint64_t a1, uint64_t a2)
{
  *(void *)sub_100094458(a1, a2, 0) = off_1000D3B88;
  *(void *)(a1 + 136) = (*(uint64_t (**)(void, uint64_t))(**(void **)(a2 + 136) + 72LL))( *(void *)(a2 + 136),  1LL);
  sub_10000A2DC(&__str, "determinize");
  std::string::operator=((std::string *)(a1 + 16), &__str);
  *(void *)(a1 + sub_100017FC4(v21 + 8) = *(void *)(a1 + 8) & 0xFFFF00000000FFFFLL | (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2) & 0xFFFFFFFF0004LL;
  uint64_t v4 = *(void *)(a2 + 40);
  if (v4) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  *(void *)(a1 + 40) = v4;
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 8LL))(v5);
  }
  uint64_t v6 = *(void *)(a2 + 48);
  if (v6) {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v6 + 16LL))(v6);
  }
  uint64_t v7 = *(void *)(a1 + 48);
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = v6;
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8LL))(v7);
  }
  return a1;
}

void sub_100094408( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  uint64_t v17 = *(void *)(v15 + 136);
  *(void *)(v15 + 136) = 0LL;
  if (v17) {
    (*(void (**)(uint64_t))(*(void *)v17 + 8LL))(v17);
  }
  sub_100093D0C(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_100094458(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  *(void *)a1 = off_1000D3320;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  sub_10000A2DC((void *)(a1 + 16), "null");
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = 0LL;
  *(void *)a1 = off_1000D3BD8;
  *(_BYTE *)(a1 + 56) = 0;
  *(void *)(a1 + 60) = 0xFFFFFFFFLL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 8sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 96) = 0xFFFFFFFF00000000LL;
  char v6 = *(_BYTE *)(a2 + 104);
  *(_BYTE *)(a1 + 104) = v6;
  unint64_t v7 = *(void *)(a2 + 112);
  *(void *)(a1 + 112) = v7;
  BOOL v8 = (char *)operator new(0x88uLL);
  v14[0] = v6;
  unint64_t v15 = v7;
  sub_1000929D8((uint64_t)v8, v14);
  unint64_t v9 = v15;
  v8[88] = v15 == 0;
  *((_DWORD *)v8 + 23) = -1;
  *((void *)v8 + 12) = 0LL;
  v8[104] = v14[0];
  if (v9 <= 0x1FA0) {
    unint64_t v9 = 8096LL;
  }
  *((void *)v8 + 14) = v9;
  v8[120] = 0;
  *((void *)v8 + 16) = 0LL;
  *(void *)(a1 + 120) = v8;
  if (*(_BYTE *)(a2 + 128)) {
    char v10 = 1;
  }
  else {
    char v10 = a3 ^ 1;
  }
  *(_BYTE *)(a1 + 12sub_100017FC4(v21 + 8) = v10;
  *(_BYTE *)(a1 + 129) = 1;
  if (((a3 ^ 1) & 1) == 0)
  {
    uint64_t v11 = *(void *)(a2 + 120);
    sub_1000945E8((uint64_t)v8, v11);
    __int128 v12 = *(_OWORD *)(v11 + 120);
    *(_OWORD *)(v8 + 104) = *(_OWORD *)(v11 + 104);
    *(_OWORD *)(v8 + 120) = v12;
    *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
    *(void *)(a1 + 60) = *(void *)(a2 + 60);
    sub_10006ECB4((void **)(a1 + 72), a2 + 72);
    *(void *)(a1 + 96) = *(void *)(a2 + 96);
  }

  return a1;
}

void sub_1000945B8(_Unwind_Exception *a1)
{
  if (*v2) {
    operator delete(*v2);
  }
  sub_10008847C(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000945E8(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_10009474C(a1, a2);
    *(void *)(a1 + 64) = *(void *)(a1 + 40);
    *(_BYTE *)(a1 + 8sub_100017FC4(v21 + 8) = *(_BYTE *)(a2 + 88);
    *(_DWORD *)(a1 + 92) = *(_DWORD *)(a2 + 92);
    if (*(_DWORD *)(a2 + 92) == -1) {
      uint64_t v4 = 0LL;
    }
    else {
      uint64_t v4 = sub_100094658(a1, 0);
    }
    *(void *)(a1 + 96) = v4;
  }

  return a1;
}

char *sub_100094658(uint64_t a1, int a2)
{
  int v13 = a2;
  uint64_t v3 = a2;
  uint64_t v5 = *(void *)(a1 + 8);
  uint64_t v6 = *(void *)(a1 + 16);
  uint64_t v4 = a1 + 8;
  if (a2 >= (unint64_t)((v6 - v5) >> 3))
  {
    uint64_t v12 = 0LL;
    sub_10006FF4C(v4, a2 + 1, &v12);
  }

  else
  {
    unint64_t v7 = *(char **)(v5 + 8LL * a2);
    if (v7) {
      return v7;
    }
  }

  unint64_t v7 = sub_100094924((uint64_t **)(a1 + 72), 1uLL);
  *(_DWORD *)unint64_t v7 = *sub_10002ADB0();
  *((void *)v7 + 5) = 0LL;
  *(_OWORD *)(v7 + ++*(void *)(result + 24) = 0u;
  *(_OWORD *)(v7 + sub_100017FC4(v21 + 8) = 0u;
  uint64_t v8 = *(void *)(a1 + 80);
  *((void *)v7 + 6) = v8;
  ++*(void *)(v8 + 8);
  *((void *)v7 + 7) = 0LL;
  *(void *)(*(void *)(a1 + 8) + 8 * v3) = v7;
  if (*(_BYTE *)a1)
  {
    unint64_t v9 = sub_10006F788(a1 + 32, 0LL, 0LL, &v13);
    uint64_t v10 = *(void *)(a1 + 32);
    *unint64_t v9 = v10;
    v9[1] = a1 + 32;
    *(void *)(v10 + sub_100017FC4(v21 + 8) = v9;
    *(void *)(a1 + 32) = v9;
    ++*(void *)(a1 + 48);
  }

  return v7;
}

void sub_10009474C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (char **)(a1 + 8);
  sub_10002D348((void **)(a1 + 8), (uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3);
  int v23 = 0;
  uint64_t v5 = *(void *)(a2 + 8);
  if (*(void *)(a2 + 16) != v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = *(void *)(v5 + 8 * v6);
      if (v7)
      {
        uint64_t v8 = sub_100094924((uint64_t **)(a1 + 72), 1uLL);
        *(_DWORD *)uint64_t v8 = *(_DWORD *)v7;
        *(_OWORD *)(v8 + sub_100017FC4(v21 + 8) = *(_OWORD *)(v7 + 8);
        sub_100094AD4((uint64_t)(v8 + 24), *(void *)(v7 + 24), *(void *)(v7 + 32), (uint64_t *)(a1 + 80));
        *((_DWORD *)v8 + 14) = *(_DWORD *)(v7 + 56);
        *((_DWORD *)v8 + 15) = 0;
        if (*(_BYTE *)a1)
        {
          unint64_t v9 = sub_10006F788(a1 + 32, 0LL, 0LL, &v23);
          uint64_t v10 = *(void *)(a1 + 32);
          *unint64_t v9 = v10;
          v9[1] = a1 + 32;
          *(void *)(v10 + sub_100017FC4(v21 + 8) = v9;
          *(void *)(a1 + 32) = v9;
          ++*(void *)(a1 + 48);
        }
      }

      else
      {
        uint64_t v8 = 0LL;
      }

      uint64_t v12 = *(char ***)(a1 + 16);
      unint64_t v11 = *(void *)(a1 + 24);
      if ((unint64_t)v12 >= v11)
      {
        uint64_t v14 = ((char *)v12 - *v4) >> 3;
        uint64_t v15 = v11 - (void)*v4;
        uint64_t v16 = v15 >> 2;
        else {
          unint64_t v17 = v16;
        }
        if (v17) {
          uint64_t v18 = (char *)sub_100018788(a1 + 24, v17);
        }
        else {
          uint64_t v18 = 0LL;
        }
        uint64_t v19 = (char **)&v18[8 * v14];
        *uint64_t v19 = v8;
        int v13 = v19 + 1;
        int v21 = *(char **)(a1 + 8);
        unint64_t v20 = *(char **)(a1 + 16);
        if (v20 != v21)
        {
          do
          {
            BOOL v22 = (char *)*((void *)v20 - 1);
            v20 -= 8;
            *--uint64_t v19 = v22;
          }

          while (v20 != v21);
          unint64_t v20 = *v4;
        }

        *(void *)(a1 + sub_100017FC4(v21 + 8) = v19;
        *(void *)(a1 + 16) = v13;
        *(void *)(a1 + ++*(void *)(result + 24) = &v18[8 * v17];
        if (v20) {
          operator delete(v20);
        }
      }

      else
      {
        *uint64_t v12 = v8;
        int v13 = v12 + 1;
      }

      *(void *)(a1 + 16) = v13;
      unint64_t v6 = ++v23;
      uint64_t v5 = *(void *)(a2 + 8);
    }

    while (v6 < (*(void *)(a2 + 16) - v5) >> 3);
  }

char *sub_100094924(uint64_t **a1, unint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = sub_10009361C(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DD24(v2 + 1, 1LL);
      *((void *)result + 16) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 16);
    goto LABEL_26;
  }

  if (a2 == 1)
  {
    uint64_t v2 = sub_1000934F8(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DC54(v2 + 1, 1LL);
      *((void *)result + sub_100017FC4(v21 + 8) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 8);
LABEL_26:
    v2[7] = v4;
    return result;
  }

  if (a2 <= 4)
  {
    uint64_t v2 = sub_100093740(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DDF4(v2 + 1, 1LL);
      *((void *)result + 32) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 32);
    goto LABEL_26;
  }

  if (a2 <= 8)
  {
    uint64_t v2 = sub_100093864(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DEC4(v2 + 1, 1LL);
      *((void *)result + 64) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 64);
    goto LABEL_26;
  }

  if (a2 <= 0x10)
  {
    uint64_t v2 = sub_10009398C(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006F230(v2 + 1, 1LL);
      *((void *)result + 12sub_100017FC4(v21 + 8) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 128);
    goto LABEL_26;
  }

  if (a2 <= 0x20)
  {
    uint64_t v2 = sub_100093AB4(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006F300(v2 + 1, 1LL);
      *((void *)result + 256) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 256);
    goto LABEL_26;
  }

  if (a2 <= 0x40)
  {
    uint64_t v2 = sub_100093BDC(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006F3D0(v2 + 1, 1LL);
      *((void *)result + 512) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 512);
    goto LABEL_26;
  }

  if (a2 >> 58) {
    sub_100017F08();
  }
  return (char *)operator new(a2 << 6);
}

uint64_t sub_100094AD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  *(void *)a1 = 0LL;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  uint64_t v5 = *a4;
  *(void *)(a1 + ++*(void *)(result + 24) = *a4;
  ++*(void *)(v5 + 8);
  sub_100094B34((char *)a1, a2, a3, (a3 - a2) >> 4);
  return a1;
}

void sub_100094B20(_Unwind_Exception *a1)
{
}

char *sub_100094B34(char *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    unint64_t v6 = result;
    uint64_t result = sub_100094BC4((uint64_t)result, a4);
    uint64_t v7 = *((void *)v6 + 1);
    while (a2 != a3)
    {
      *(void *)uint64_t v7 = *(void *)a2;
      *(_DWORD *)(v7 + sub_100017FC4(v21 + 8) = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(v7 + 12) = *(_DWORD *)(a2 + 12);
      v7 += 16LL;
      a2 += 16LL;
    }

    *((void *)v6 + 1) = v7;
  }

  return result;
}

void sub_100094BB0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
}

char *sub_100094BC4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    sub_100018774();
  }
  uint64_t result = sub_100094C0C((uint64_t **)(a1 + 24), a2);
  *(void *)a1 = result;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = result;
  *(void *)(a1 + 16) = &result[16 * a2];
  return result;
}

char *sub_100094C0C(uint64_t **a1, unint64_t a2)
{
  if (a2 == 2)
  {
    uint64_t v2 = sub_100092E18(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DB84(v2 + 1, 1LL);
      *((void *)result + 4) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 4);
    goto LABEL_26;
  }

  if (a2 == 1)
  {
    uint64_t v2 = sub_100092CF4(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DAB4(v2 + 1, 1LL);
      *((void *)result + 2) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 2);
LABEL_26:
    v2[7] = v4;
    return result;
  }

  if (a2 <= 4)
  {
    uint64_t v2 = sub_100092F3C(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DC54(v2 + 1, 1LL);
      *((void *)result + sub_100017FC4(v21 + 8) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 8);
    goto LABEL_26;
  }

  if (a2 <= 8)
  {
    uint64_t v2 = sub_100093060(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DD24(v2 + 1, 1LL);
      *((void *)result + 16) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 16);
    goto LABEL_26;
  }

  if (a2 <= 0x10)
  {
    uint64_t v2 = sub_100093184(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DDF4(v2 + 1, 1LL);
      *((void *)result + 32) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 32);
    goto LABEL_26;
  }

  if (a2 <= 0x20)
  {
    uint64_t v2 = sub_1000932A8(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006DEC4(v2 + 1, 1LL);
      *((void *)result + 64) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 64);
    goto LABEL_26;
  }

  if (a2 <= 0x40)
  {
    uint64_t v2 = sub_1000933D0(*a1);
    uint64_t result = (char *)v2[7];
    if (!result)
    {
      uint64_t result = sub_10006F230(v2 + 1, 1LL);
      *((void *)result + 12sub_100017FC4(v21 + 8) = 0LL;
      return result;
    }

    uint64_t v4 = *((void *)result + 128);
    goto LABEL_26;
  }

  if (a2 >> 60) {
    sub_100017F08();
  }
  return (char *)operator new(16 * a2);
}

void sub_100094DBC(void *a1, int a2, void *a3)
{
  uint64_t v5 = **(float ***)(*(void *)(a1[23] + 112LL) + 8LL * a2);
  if (!v5) {
    goto LABEL_26;
  }
  do
  {
    uint64_t v6 = *((unsigned int *)v5 + 2);
    uint64_t v7 = a1[17];
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    unint64_t v22 = 0LL;
    (*(void (**)(uint64_t, uint64_t, __int128 *))(*(void *)v7 + 120LL))(v7, v6, &v20);
    while (1)
    {
      if (!(void)v20)
      {
LABEL_8:
        uint64_t v8 = *((void *)&v20 + 1) + 16 * v22;
        goto LABEL_9;
      }

      if (!(void)v20) {
        goto LABEL_8;
      }
      uint64_t v8 = (*(uint64_t (**)(void))(*(void *)v20 + 24LL))();
LABEL_9:
      int v9 = *(_DWORD *)(v8 + 12);
      float v10 = v5[3];
      if (v10 == -INFINITY || (float v11 = *(float *)(v8 + 8), v11 >= -INFINITY) && v11 <= -INFINITY)
      {
        float v12 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v13 = v11 == INFINITY || v10 == INFINITY;
        float v12 = v10 + v11;
        if (v13) {
          float v12 = INFINITY;
        }
      }

      v19[0] = v9;
      *(float *)&v19[1] = v12;
      sub_1000950EC(a1[22], (_DWORD *)v8, (uint64_t)(v5 + 2), v19, (uint64_t)a3);
      if ((void)v20) {
        (*(void (**)(void))(*(void *)v20 + 32LL))(v20);
      }
      else {
        ++v22;
      }
    }

    if ((void)v20)
    {
      (*(void (**)(void))(*(void *)v20 + 8LL))();
      goto LABEL_25;
    }

void sub_100094FA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  if (a11)
  {
    (*(void (**)(uint64_t))(*(void *)a11 + 8LL))(a11);
  }

  else if (a14)
  {
    --*a14;
  }

  _Unwind_Resume(exception_object);
}

void *sub_100094FE8(uint64_t a1, int a2, void **a3)
{
  int v5 = *(_DWORD *)a3;
  int v6 = *((_DWORD *)a3 + 1);
  int v7 = sub_1000956B4(a1, a3[1]);
  v10[0] = v5;
  v10[1] = v5;
  v10[2] = v6;
  v10[3] = v7;
  uint64_t v8 = sub_100095F5C(*(void *)(a1 + 120), a2);
  return sub_100096660((void *)v8 + 3, (uint64_t)v10);
}

void sub_100095054(uint64_t a1, int a2)
{
  uint64_t v4 = sub_100095F5C(*(void *)(a1 + 120), a2);
  sub_100096774(*(void *)(a1 + 120), (uint64_t)v4);
  uint64_t v5 = *((void *)v4 + 3);
  uint64_t v6 = *((void *)v4 + 4) - v5;
  if (v6)
  {
    unint64_t v7 = v6 >> 4;
    int v8 = *(_DWORD *)(a1 + 64);
    if (v7 <= 1) {
      unint64_t v7 = 1LL;
    }
    int v9 = (int *)(v5 + 12);
    do
    {
      int v11 = *v9;
      v9 += 4;
      int v10 = v11;
      if (v11 >= v8)
      {
        int v8 = v10 + 1;
        *(_DWORD *)(a1 + 64) = v10 + 1;
      }

      --v7;
    }

    while (v7);
  }

  sub_100071AB8(a1, a2);
  *((_DWORD *)v4 + 14) |= 0xAu;
}

uint64_t sub_1000950EC(uint64_t a1, _DWORD *a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v15 = a2;
  unint64_t v7 = sub_10009538C(a5, a2, (uint64_t)&unk_1000AF371, &v15);
  int v8 = v7;
  if (*((_DWORD *)v7 + 10) == -1)
  {
    int v11 = *a2;
    int v12 = *sub_10002ADB0();
    int v9 = operator new(0x10uLL);
    uint64_t v10 = 0LL;
    *(void *)int v9 = 0LL;
    *((_DWORD *)v8 + 10) = v11;
    *((_DWORD *)v8 + 11) = v12;
    v8[6] = (uint64_t)v9;
    v9[8] = 0;
  }

  else
  {
    int v9 = (_BYTE *)v7[6];
    uint64_t v10 = *(void *)v9;
  }

  BOOL v13 = operator new(0x10uLL);
  *(void *)BOOL v13 = v10;
  v13[2] = *a4;
  v13[3] = a4[1];
  *(void *)int v9 = v13;
  return 1LL;
}

void sub_1000951B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(uint64_t ***)(a2 + 8);
  sub_1000954C8(v4);
  uint64_t v5 = *v4;
  if (*v4)
  {
    uint64_t v6 = *v4;
    do
    {
      float v7 = *(float *)(a2 + 4);
      if (v7 == -INFINITY || (float v8 = *((float *)v6 + 3), v8 >= -INFINITY) && v8 <= -INFINITY)
      {
        float v7 = *(float *)sub_1000606CC();
      }

      else if (v7 >= v8)
      {
        float v7 = *((float *)v6 + 3);
      }

      *(float *)(a2 + 4) = v7;
      if (v5 == v6 || *((_DWORD *)v6 + 2) != *((_DWORD *)v5 + 2))
      {
        int v11 = (uint64_t *)*v6;
        uint64_t v5 = v6;
      }

      else
      {
        float v9 = *((float *)v5 + 3);
        if (v9 == -INFINITY || (float v10 = *((float *)v6 + 3), v10 >= -INFINITY) && v10 <= -INFINITY)
        {
          float v9 = *(float *)sub_1000606CC();
        }

        else if (v9 >= v10)
        {
          float v9 = *((float *)v6 + 3);
        }

        *((float *)v5 + 3) = v9;
        if (v9 >= -INFINITY && v9 <= -INFINITY) {
          *(void *)(a1 + 8) |= 4uLL;
        }
        int v11 = (uint64_t *)*v6;
        int v12 = (void *)*v5;
        uint64_t *v5 = *(void *)*v5;
        operator delete(v12);
      }

      uint64_t v6 = v11;
    }

    while (v11);
    for (uint64_t i = *v4; i; uint64_t i = (uint64_t *)*i)
    {
      float v14 = *((float *)i + 3);
      if (v14 == -INFINITY || (float v15 = *(float *)(a2 + 4), v15 >= -INFINITY) && v15 <= -INFINITY)
      {
        float v16 = *(float *)sub_1000606CC();
      }

      else
      {
        BOOL v17 = v14 == INFINITY;
        float v16 = v14 - v15;
        if (v17) {
          float v16 = INFINITY;
        }
        if (v15 == INFINITY) {
          float v16 = NAN;
        }
      }

      if ((LODWORD(v16) & 0x7FFFFFFFu) <= 0x7F7FFFFF) {
        float v16 = *(float *)(a1 + 144) * floorf((float)(v16 / *(float *)(a1 + 144)) + 0.5);
      }
      *((float *)i + 3) = v16;
    }
  }

uint64_t *sub_10009538C(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v6 = (uint64_t **)(a1 + 8);
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  if (v5)
  {
    int v7 = *a2;
    while (1)
    {
      while (1)
      {
        float v8 = (uint64_t **)v5;
        int v9 = *((_DWORD *)v5 + 8);
        if (v7 >= v9) {
          break;
        }
        uint64_t v5 = *v8;
        uint64_t v6 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (v9 >= v7) {
        break;
      }
      uint64_t v5 = v8[1];
      if (!v5)
      {
        uint64_t v6 = v8 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    float v8 = (uint64_t **)(a1 + 8);
LABEL_10:
    sub_100095444(a1, a4, (uint64_t)&v11);
    sub_100019D14((uint64_t **)a1, (uint64_t)v8, v6, v11);
    return v11;
  }

  return (uint64_t *)v8;
}

float sub_100095444@<S0>(uint64_t a1@<X0>, _DWORD **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + sub_100017FC4(v21 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  v6[8] = **a2;
  v6[10] = -1;
  int v7 = sub_10002ADB0();
  float result = *(float *)v7;
  v6[11] = *v7;
  *((void *)v6 + 6) = 0LL;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1000954B0(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  operator delete(v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_1000954C8(uint64_t **a1)
{
  uint64_t v2 = *a1;
  if (v2)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = v2;
    do
    {
      ++v3;
      uint64_t v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  float result = sub_10009551C(v2, v3, (uint64_t)&v6);
  *a1 = result;
  return result;
}

uint64_t *sub_10009551C(uint64_t *result, uint64_t a2, uint64_t a3)
{
  if ((unint64_t)a2 >= 2)
  {
    if (a2 == 2)
    {
      uint64_t v3 = (void *)*result;
      if (*(_DWORD *)(*result + 8) < *((_DWORD *)result + 2))
      {
        *uint64_t v3 = result;
        uint64_t *result = 0LL;
        return v3;
      }
    }

    else
    {
      if (a2 >= 0) {
        uint64_t v6 = a2;
      }
      else {
        uint64_t v6 = a2 + 1;
      }
      uint64_t v7 = v6 >> 1;
      uint64_t v8 = a2 - (v6 >> 1);
      int v9 = result;
      if (a2 >= 4)
      {
        unint64_t v10 = v7;
        int v9 = result;
        do
        {
          --v10;
          int v9 = (uint64_t *)*v9;
        }

        while (v10 > 1);
      }

      int v11 = (uint64_t *)*v9;
      *int v9 = 0LL;
      int v12 = (uint64_t *)sub_10009551C(result, v7, a3);
      BOOL v13 = (uint64_t *)sub_10009551C(v11, v8, a3);
      return sub_1000955E4(v12, v13);
    }
  }

  return result;
}

uint64_t *sub_1000955E4(uint64_t *a1, uint64_t *a2)
{
  if (a1)
  {
    if (a2)
    {
      int v2 = *((_DWORD *)a1 + 2);
      if (*((_DWORD *)a2 + 2) >= v2)
      {
        uint64_t v3 = a2;
        a2 = a1;
      }

      else
      {
        uint64_t v3 = a2;
        do
        {
          uint64_t v4 = (uint64_t **)v3;
          uint64_t v3 = (uint64_t *)*v3;
        }

        while (v3 && *((_DWORD *)v3 + 2) < v2);
        *uint64_t v4 = a1;
      }

      uint64_t v5 = *a1;
      BOOL v6 = v3 != 0LL;
      if (*a1) {
        BOOL v7 = v3 == 0LL;
      }
      else {
        BOOL v7 = 1;
      }
      if (!v7)
      {
        do
        {
          uint64_t v8 = (uint64_t *)v5;
          int v9 = *(_DWORD *)(v5 + 8);
          if (*((_DWORD *)v3 + 2) < v9)
          {
            unint64_t v10 = v3;
            do
            {
              int v11 = (uint64_t **)v10;
              unint64_t v10 = (uint64_t *)*v10;
            }

            while (v10 && *((_DWORD *)v10 + 2) < v9);
            *a1 = (uint64_t)v3;
            uint64_t v3 = *v11;
            *int v11 = v8;
          }

          uint64_t v5 = *v8;
          BOOL v6 = v3 != 0LL;
          if (*v8) {
            BOOL v12 = v3 == 0LL;
          }
          else {
            BOOL v12 = 1;
          }
          a1 = v8;
        }

        while (!v12);
        a1 = v8;
      }

      if (v6) {
        *a1 = (uint64_t)v3;
      }
    }

    else
    {
      return a1;
    }
  }

  return a2;
}

uint64_t sub_1000956B4(uint64_t a1, void *a2)
{
  uint64_t v4 = sub_1000957E0(*(void **)(a1 + 184), a2);
  uint64_t v5 = v4;
  if (*(void *)(a1 + 152))
  {
    uint64_t v6 = *(void *)(a1 + 160);
    if ((int)v4 >= (unint64_t)((uint64_t)(*(void *)(v6 + 8) - *(void *)v6) >> 2))
    {
      sub_100095864(a1, (float **)a2, &v20);
      unint64_t v7 = *(void *)(v6 + 16);
      uint64_t v8 = *(_DWORD **)(v6 + 8);
      if ((unint64_t)v8 >= v7)
      {
        unint64_t v10 = *(_DWORD **)v6;
        uint64_t v11 = ((uint64_t)v8 - *(void *)v6) >> 2;
        unint64_t v12 = v11 + 1;
        uint64_t v13 = v7 - (void)v10;
        if (v13 >> 1 > v12) {
          unint64_t v12 = v13 >> 1;
        }
        else {
          unint64_t v14 = v12;
        }
        if (v14)
        {
          float v15 = (char *)sub_10002C050(v6 + 16, v14);
          unint64_t v10 = *(_DWORD **)v6;
          uint64_t v8 = *(_DWORD **)(v6 + 8);
        }

        else
        {
          float v15 = 0LL;
        }

        float v16 = &v15[4 * v11];
        BOOL v17 = &v15[4 * v14];
        *(_DWORD *)float v16 = v20;
        int v9 = v16 + 4;
        while (v8 != v10)
        {
          int v18 = *--v8;
          *((_DWORD *)v16 - 1) = v18;
          v16 -= 4;
        }

        *(void *)uint64_t v6 = v16;
        *(void *)(v6 + sub_100017FC4(v21 + 8) = v9;
        *(void *)(v6 + 16) = v17;
        if (v10) {
          operator delete(v10);
        }
      }

      else
      {
        *uint64_t v8 = v20;
        int v9 = v8 + 1;
      }

      *(void *)(v6 + sub_100017FC4(v21 + 8) = v9;
    }
  }

  return v5;
}

uint64_t sub_1000957E0(void *a1, void *a2)
{
  __int128 __p = a2;
  uint64_t v2 = (a1[15] - a1[14]) >> 3;
  uint64_t v3 = sub_100095968(a1 + 1, &__p, 1);
  if ((_DWORD)v3 != (_DWORD)v2)
  {
    uint64_t v4 = __p;
    if (__p)
    {
      uint64_t v5 = *(void **)__p;
      if (*(void *)__p)
      {
        do
        {
          uint64_t v6 = (void *)*v5;
          operator delete(v5);
          uint64_t v5 = v6;
        }

        while (v6);
      }

      operator delete(v4);
    }
  }

  return v3;
}

int *sub_100095864@<X0>(uint64_t a1@<X0>, float **a2@<X1>, int *a3@<X8>)
{
  float result = sub_10002ADB0();
  float v7 = *(float *)result;
  *a3 = *result;
  for (uint64_t i = *a2; i; uint64_t i = *(float **)i)
  {
    unint64_t v9 = *((int *)i + 2);
    uint64_t v10 = **(void **)(a1 + 152);
    if (v9 >= (*(void *)(*(void *)(a1 + 152) + 8LL) - v10) >> 2) {
      float result = sub_10002ADB0();
    }
    else {
      float result = (int *)(v10 + 4 * v9);
    }
    float v11 = i[3];
    if (v11 == -INFINITY || (float v12 = *(float *)result, *(float *)result >= -INFINITY) && *(float *)result <= -INFINITY)
    {
      float result = sub_1000606CC();
      float v13 = *(float *)result;
    }

    else
    {
      BOOL v14 = v11 == INFINITY || v12 == INFINITY;
      float v13 = v12 + v11;
      if (v14) {
        float v13 = INFINITY;
      }
    }

    if (v7 == -INFINITY || v13 >= -INFINITY && v13 <= -INFINITY)
    {
      float result = sub_1000606CC();
      float v7 = *(float *)result;
    }

    else if (v7 >= v13)
    {
      float v7 = v13;
    }

    *(float *)a3 = v7;
  }

  return result;
}

uint64_t sub_100095968(void *a1, void *a2, int a3)
{
  a1[16] = a2;
  uint64_t v4 = a1 + 4;
  if (!a3)
  {
    uint64_t v6 = sub_100095E58(v4, &dword_1000B0AE0);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    return v6[4];
  }

  uint64_t v6 = sub_100095A9C((uint64_t)v4, &dword_1000B0AE0, &dword_1000B0AE0);
  if (!v7) {
    return v6[4];
  }
  uint64_t v8 = a1[13];
  unint64_t v9 = (void *)a1[14];
  uint64_t v10 = ((uint64_t)v9 - v8) >> 3;
  v6[4] = v10;
  unint64_t v11 = a1[15];
  if ((unint64_t)v9 >= v11)
  {
    uint64_t v13 = v11 - v8;
    uint64_t v14 = v13 >> 2;
    else {
      unint64_t v15 = v14;
    }
    if (v15) {
      float v16 = (char *)sub_100018788((uint64_t)(a1 + 15), v15);
    }
    else {
      float v16 = 0LL;
    }
    BOOL v17 = &v16[8 * v10];
    int v18 = &v16[8 * v15];
    *(void *)BOOL v17 = *a2;
    float v12 = v17 + 8;
    int v20 = (char *)a1[13];
    uint64_t v19 = (char *)a1[14];
    if (v19 != v20)
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v17 - 1) = v21;
        v17 -= 8;
      }

      while (v19 != v20);
      uint64_t v19 = (char *)a1[13];
    }

    a1[13] = v17;
    a1[14] = v12;
    a1[15] = v18;
    if (v19) {
      operator delete(v19);
    }
  }

  else
  {
    *unint64_t v9 = *a2;
    float v12 = v9 + 1;
  }

  a1[14] = v12;
  return v10;
}

char *sub_100095A9C(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v7 = sub_100095D14((uint64_t *)(a1 + 48), *a2);
  unint64_t v8 = v7;
  unint64_t v9 = *(void *)(a1 + 8);
  if (v9)
  {
    uint8x8_t v10 = (uint8x8_t)vcnt_s8((int8x8_t)v9);
    v10.i16[0] = vaddlv_u8(v10);
    unint64_t v11 = v10.u32[0];
    if (v10.u32[0] > 1uLL)
    {
      unint64_t v3 = v7;
      if (v7 >= v9) {
        unint64_t v3 = v7 % v9;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v7;
    }

    float v12 = *(char ***)(*(void *)a1 + 8 * v3);
    if (v12)
    {
      for (uint64_t i = *v12; i; uint64_t i = *(char **)i)
      {
        unint64_t v14 = *((void *)i + 1);
        if (v14 == v8)
        {
        }

        else
        {
          if (v11 > 1)
          {
            if (v14 >= v9) {
              v14 %= v9;
            }
          }

          else
          {
            v14 &= v9 - 1;
          }

          if (v14 != v3) {
            break;
          }
        }
      }
    }
  }

  uint64_t i = sub_100070674((uint64_t **)(a1 + 32), 1uLL);
  *(void *)uint64_t i = 0LL;
  *((void *)i + 1) = v8;
  *((_DWORD *)i + 4) = *a3;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 40) + 1LL);
  float v16 = *(float *)(a1 + 56);
  if (!v9 || (float)(v16 * (float)v9) < v15)
  {
    BOOL v17 = 1LL;
    if (v9 >= 3) {
      BOOL v17 = (v9 & (v9 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v9);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    sub_10006D600(a1, v20);
    unint64_t v9 = *(void *)(a1 + 8);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v8 >= v9) {
        unint64_t v3 = v8 % v9;
      }
      else {
        unint64_t v3 = v8;
      }
    }

    else
    {
      unint64_t v3 = (v9 - 1) & v8;
    }
  }

  uint64_t v21 = *(char ***)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *(void *)uint64_t i = *v21;
LABEL_38:
    char *v21 = i;
    goto LABEL_39;
  }

  *(void *)uint64_t i = *(void *)(a1 + 24);
  *(void *)(a1 + ++*(void *)(result + 24) = i;
  *(void *)(*(void *)a1 + 8 * v3) = a1 + 24;
  if (*(void *)i)
  {
    unint64_t v22 = *(void *)(*(void *)i + 8LL);
    if ((v9 & (v9 - 1)) != 0)
    {
      if (v22 >= v9) {
        v22 %= v9;
      }
    }

    else
    {
      v22 &= v9 - 1;
    }

    uint64_t v21 = (char **)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }

void sub_100095CF8(_Unwind_Exception *a1)
{
}

unint64_t sub_100095D14(uint64_t *a1, int a2)
{
  if (a2 < -1) {
    return 0LL;
  }
  uint64_t v2 = *a1;
  if (a2 == -1) {
    unint64_t v3 = *(uint64_t ****)(v2 + 128);
  }
  else {
    unint64_t v3 = (uint64_t ***)(*(void *)(v2 + 104) + 8LL * a2);
  }
  uint64_t v5 = *v3;
  for (unint64_t result = *((char *)v5 + 8);
        ;
        result ^= (2 * result) ^ (32LL * *((int *)v5 + 2)) ^ ((unint64_t)*((int *)v5 + 2) >> 59) ^ *((unsigned int *)v5 + 3))
  {
    uint64_t v5 = (uint64_t **)*v5;
    if (!v5) {
      break;
    }
  }

  return result;
}

uint64_t sub_100095D6C(uint64_t *a1, int a2, int a3)
{
  if (a2 == a3) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (a2 >= -1 && a3 >= -1)
  {
    uint64_t v5 = *a1;
    if (a2 == -1) {
      uint64_t v6 = *(uint64_t **)(v5 + 128);
    }
    else {
      uint64_t v6 = (uint64_t *)(*(void *)(v5 + 104) + 8LL * a2);
    }
    uint64_t v7 = *v6;
    if (a3 == -1) {
      unint64_t v8 = *(uint64_t ***)(v5 + 128);
    }
    else {
      unint64_t v8 = (uint64_t **)(*(void *)(v5 + 104) + 8LL * a3);
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100095DEC(uint64_t *a1, uint64_t *a2)
{
  while (1)
  {
    a1 = (uint64_t *)*a1;
    a2 = (uint64_t *)*a2;
    if (!a1 || a2 == 0LL) {
      break;
    }
  }

  return (a1 != 0LL) ^ (a2 == 0LL);
}

uint64_t *sub_100095E58(void *a1, int *a2)
{
  unint64_t v4 = sub_100095D14(a1 + 6, *a2);
  int8x8_t v5 = (int8x8_t)a1[1];
  if (!*(void *)&v5) {
    return 0LL;
  }
  unint64_t v6 = v4;
  uint8x8_t v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  unint64_t v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    unint64_t v9 = v4;
    if (v4 >= *(void *)&v5) {
      unint64_t v9 = v4 % *(void *)&v5;
    }
  }

  else
  {
    unint64_t v9 = (*(void *)&v5 - 1LL) & v4;
  }

  uint8x8_t v10 = *(uint64_t ***)(*a1 + 8 * v9);
  if (!v10) {
    return 0LL;
  }
  unint64_t v11 = *v10;
  if (*v10)
  {
    float v12 = a1 + 8;
    do
    {
      unint64_t v13 = v11[1];
      if (v13 == v6)
      {
        if ((sub_100095D6C(v12, *((_DWORD *)v11 + 4), *a2) & 1) != 0) {
          return v11;
        }
      }

      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(void *)&v5) {
            v13 %= *(void *)&v5;
          }
        }

        else
        {
          v13 &= *(void *)&v5 - 1LL;
        }

        if (v13 != v9) {
          return 0LL;
        }
      }

      unint64_t v11 = (uint64_t *)*v11;
    }

    while (v11);
  }

  return v11;
}

char *sub_100095F5C(uint64_t a1, int a2)
{
  unint64_t v3 = sub_100095FE0(a1, a2);
  unint64_t v4 = v3;
  if (*(_BYTE *)(a1 + 104))
  {
    int v5 = *((_DWORD *)v3 + 14);
    if ((v5 & 4) == 0)
    {
      *((_DWORD *)v3 + 14) = v5 | 4;
      unint64_t v6 = *((void *)v3 + 4) - *((void *)v3 + 3) + *(void *)(a1 + 128) + 64LL;
      *(void *)(a1 + 12sub_100017FC4(v21 + 8) = v6;
      *(_BYTE *)(a1 + 120) = 1;
      if (v6 > *(void *)(a1 + 112)) {
        sub_1000960B0(a1, v3, 0LL, 0.666);
      }
    }
  }

  return v4;
}

char *sub_100095FE0(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 92);
  if (v3 == a2) {
    return *(char **)(a1 + 96);
  }
  if (!*(_BYTE *)(a1 + 88)) {
    return sub_100094658(a1, a2 + 1);
  }
  if (v3 == -1)
  {
    *(_DWORD *)(a1 + 92) = a2;
    unint64_t v6 = sub_100094658(a1, 0);
    *(void *)(a1 + 96) = v6;
    *((_DWORD *)v6 + 14) |= 4u;
    sub_1000964C4((uint64_t)(v6 + 24), 0x80uLL);
    return *(char **)(a1 + 96);
  }

  uint64_t v5 = *(void *)(a1 + 96);
  if (*(_DWORD *)(v5 + 60))
  {
    *(_DWORD *)(v5 + 56) &= ~4u;
    *(_BYTE *)(a1 + 8sub_100017FC4(v21 + 8) = 0;
    return sub_100094658(a1, a2 + 1);
  }

  *(_DWORD *)(a1 + 92) = a2;
  *(_DWORD *)uint64_t v5 = *sub_10002ADB0();
  *(void *)(v5 + 56) = 0LL;
  *(void *)(v5 + sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(v5 + 16) = 0LL;
  *(void *)(v5 + 32) = *(void *)(v5 + 24);
  uint64_t result = *(char **)(a1 + 96);
  *((_DWORD *)result + 14) |= 4u;
  return result;
}

void sub_1000960B0(uint64_t a1, char *a2, uint64_t a3, float a4)
{
  if (*(_BYTE *)(a1 + 120))
  {
    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(__p, "INFO");
      sub_10002A9EC((BOOL *)v42, (uint64_t)__p);
      unint64_t v8 = sub_10002A6A4(&std::cerr, (uint64_t)"GCCacheStore: Enter GC: object = ", 33LL);
      unint64_t v9 = sub_10002A6A4(v8, (uint64_t)"(", 1LL);
      uint8x8_t v10 = (void *)std::ostream::operator<<(v9, a1);
      unint64_t v11 = sub_10002A6A4(v10, (uint64_t)"), free recently cached = ", 26LL);
      float v12 = (void *)std::ostream::operator<<(v11, a3);
      unint64_t v13 = sub_10002A6A4(v12, (uint64_t)", cache size = ", 15LL);
      unint64_t v14 = (void *)std::ostream::operator<<(v13, *(void *)(a1 + 128));
      float v15 = sub_10002A6A4(v14, (uint64_t)", cache frac = ", 15LL);
      float v16 = (void *)std::ostream::operator<<(v15, a4);
      BOOL v17 = sub_10002A6A4(v16, (uint64_t)", cache limit = ", 16LL);
      unint64_t v18 = (void *)std::ostream::operator<<(v17, *(void *)(a1 + 112));
      sub_10002A6A4(v18, (uint64_t)"\n", 1LL);
      sub_10002AA94(v42);
      if (v47 < 0) {
        operator delete(__p[0]);
      }
    }

    unint64_t v19 = (unint64_t)(float)((float)*(unint64_t *)(a1 + 112) * a4);
    uint64_t v20 = *(void *)(a1 + 40);
LABEL_6:
    *(void *)(a1 + 64) = v20;
    while (v20 != a1 + 32)
    {
      int v21 = *(_DWORD *)(v20 + 16);
      if (v21) {
        int v22 = v21 - 1;
      }
      else {
        int v22 = *(_DWORD *)(a1 + 92);
      }
      int v23 = sub_100095FE0(a1, v22);
      unint64_t v24 = *(void *)(a1 + 128);
      if (v24 <= v19 || *((_DWORD *)v23 + 15))
      {
LABEL_23:
        *((_DWORD *)v23 + 14) &= ~8u;
        uint64_t v20 = *(void *)(*(void *)(a1 + 64) + 8LL);
        goto LABEL_6;
      }

      if ((a3 & 1) != 0)
      {
        if (v23 == a2) {
          goto LABEL_23;
        }
        int v25 = *((_DWORD *)v23 + 14);
      }

      else
      {
        int v25 = *((_DWORD *)v23 + 14);
        if ((v25 & 8) != 0 || v23 == a2) {
          goto LABEL_23;
        }
      }

      if ((v25 & 4) != 0)
      {
        unint64_t v26 = *((void *)v23 + 4) - *((void *)v23 + 3) + 64LL;
        BOOL v27 = v24 > v26;
        unint64_t v28 = v24 - v26;
        if (v27) {
          *(void *)(a1 + 12sub_100017FC4(v21 + 8) = v28;
        }
      }

      sub_1000965C8(a1);
      uint64_t v20 = *(void *)(a1 + 64);
    }

    if ((a3 & 1) != 0 || *(void *)(a1 + 128) <= v19)
    {
      unint64_t v29 = *(void *)(a1 + 128);
      if (v19)
      {
        if (v29 > v19)
        {
          uint64_t v30 = *(void *)(a1 + 112);
          do
          {
            v30 *= 2LL;
            BOOL v27 = v29 > 2 * v19;
            v19 *= 2LL;
          }

          while (v27);
          *(void *)(a1 + 112) = v30;
        }
      }

      else if (v29)
      {
        if (byte_1000DDAF8) {
          sub_10000A2DC(__p, "FATAL");
        }
        else {
          sub_10000A2DC(__p, "ERROR");
        }
        sub_10002A9EC(&v45, (uint64_t)__p);
        sub_10002A6A4(&std::cerr, (uint64_t)"GCCacheStore:GC: Unable to free all cached states", 49LL);
        sub_10002AA94(&v45);
        if (v47 < 0) {
          operator delete(__p[0]);
        }
      }
    }

    else
    {
      sub_1000960B0(a1, a2, 1LL, a4);
    }

    if (dword_1000DE7E8 >= 2)
    {
      sub_10000A2DC(v42, "INFO");
      sub_10002A9EC(&v44, (uint64_t)v42);
      unint64_t v31 = sub_10002A6A4(&std::cerr, (uint64_t)"GCCacheStore: Exit GC: object = ", 32LL);
      uint64_t v32 = sub_10002A6A4(v31, (uint64_t)"(", 1LL);
      unint64_t v33 = (void *)std::ostream::operator<<(v32, a1);
      uint64_t v34 = sub_10002A6A4(v33, (uint64_t)"), free recently cached = ", 26LL);
      uint64_t v35 = (void *)std::ostream::operator<<(v34, a3);
      unint64_t v36 = sub_10002A6A4(v35, (uint64_t)", cache size = ", 15LL);
      uint64_t v37 = (void *)std::ostream::operator<<(v36, *(void *)(a1 + 128));
      int v38 = sub_10002A6A4(v37, (uint64_t)", cache frac = ", 15LL);
      int v39 = (void *)std::ostream::operator<<(v38, a4);
      int v40 = sub_10002A6A4(v39, (uint64_t)", cache limit = ", 16LL);
      uint64_t v41 = (void *)std::ostream::operator<<(v40, *(void *)(a1 + 112));
      sub_10002A6A4(v41, (uint64_t)"\n", 1LL);
      sub_10002AA94(&v44);
      if (v43 < 0) {
        operator delete(v42[0]);
      }
    }
  }

void sub_100096458( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, void *__p, uint64_t a21, int a22, __int16 a23, char a24, char a25)
{
  if (a25 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000964C4(uint64_t result, unint64_t a2)
{
  if (a2 > (uint64_t)(*(void *)(result + 16) - *(void *)result) >> 4)
  {
    int v3 = (uint64_t *)result;
    if (a2 >> 60) {
      sub_100018774();
    }
    uint64_t v4 = *(void *)(result + 8) - *(void *)result;
    v5[4] = result + 24;
    v5[0] = sub_100094C0C((uint64_t **)(result + 24), a2);
    v5[1] = v5[0] + v4;
    v5[2] = v5[0] + v4;
    void v5[3] = v5[0] + 16 * a2;
    sub_10002D4B4(v3, v5);
    return sub_10009656C((uint64_t)v5);
  }

  return result;
}

void sub_100096558(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10009656C(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != v3) {
    *(void *)(a1 + 16) = v2 + ((v3 - v2 + 15) & 0xFFFFFFFFFFFFFFF0LL);
  }
  if (*(void *)a1) {
    sub_100092BE8(*(uint64_t ***)(a1 + 32), *(void **)a1, (uint64_t)(*(void *)(a1 + 24) - *(void *)a1) >> 4);
  }
  return a1;
}

void *sub_1000965C8(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(a1 + 64) + 16LL);
  if (!v1 || v1 - 1 == *(_DWORD *)(a1 + 92))
  {
    *(_DWORD *)(a1 + 92) = -1;
    *(void *)(a1 + 96) = 0LL;
  }

  return sub_1000965F4(a1);
}

void *sub_1000965F4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 8) + 8LL * *(int *)(*(void *)(a1 + 64) + 16LL)) = 0LL;
  uint64_t v2 = *(uint64_t **)(a1 + 64);
  uint64_t v4 = *v2;
  uint64_t v3 = v2[1];
  *(void *)(a1 + 64) = v3;
  *(void *)(v4 + sub_100017FC4(v21 + 8) = v3;
  *(void *)v2[1] = v4;
  --*(void *)(a1 + 48);
  return sub_10006B484(a1 + 32, (uint64_t)v2);
}

void *sub_100096660(void *result, uint64_t a2)
{
  uint64_t v3 = result;
  unint64_t v4 = result[1];
  unint64_t v5 = result[2];
  if (v4 >= v5)
  {
    uint64_t v7 = (uint64_t)(v4 - *result) >> 4;
    unint64_t v8 = v7 + 1;
    unint64_t v9 = (uint64_t **)(result + 3);
    uint64_t v10 = v5 - *v3;
    if (v10 >> 3 > v8) {
      unint64_t v8 = v10 >> 3;
    }
    else {
      unint64_t v11 = v8;
    }
    v14[4] = v3 + 3;
    float v12 = sub_100094C0C(v9, v11);
    unint64_t v13 = &v12[16 * v7];
    v14[0] = v12;
    v14[1] = v13;
    v14[3] = &v12[16 * v11];
    *(void *)unint64_t v13 = *(void *)a2;
    *((_DWORD *)v13 + 2) = *(_DWORD *)(a2 + 8);
    *((_DWORD *)v13 + 3) = *(_DWORD *)(a2 + 12);
    v14[2] = v13 + 16;
    sub_10002D4B4(v3, v14);
    uint64_t v6 = v3[1];
    uint64_t result = (void *)sub_10009656C((uint64_t)v14);
  }

  else
  {
    *(void *)unint64_t v4 = *(void *)a2;
    *(_DWORD *)(v4 + sub_100017FC4(v21 + 8) = *(_DWORD *)(a2 + 8);
    *(_DWORD *)(v4 + 12) = *(_DWORD *)(a2 + 12);
    uint64_t v6 = v4 + 16;
    result[1] = v4 + 16;
  }

  v3[1] = v6;
  return result;
}

void sub_100096760(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_100096774(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 120) && (*(_BYTE *)(a2 + 56) & 4) != 0)
  {
    unint64_t v4 = *(void *)(a2 + 32) - *(void *)(a2 + 24) + *(void *)(a1 + 128);
    *(void *)(a1 + 12sub_100017FC4(v21 + 8) = v4;
    if (v4 > *(void *)(a1 + 112)) {
      sub_1000960B0(a1, (char *)a2, 0LL, 0.666);
    }
  }

uint64_t sub_1000967EC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 56))
  {
    if ((*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 24LL))(a1, 4LL))
    {
      *(_BYTE *)(a1 + 56) = 1;
    }

    else if (!*(_BYTE *)(a1 + 56))
    {
      int v3 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48LL))(a1);
      if (v3 != -1)
      {
        *(_DWORD *)(a1 + 60) = v3;
        *(_BYTE *)(a1 + 56) = 1;
        if (*(_DWORD *)(a1 + 64) <= v3) {
          *(_DWORD *)(a1 + 64) = v3 + 1;
        }
      }
    }
  }

  return *(unsigned int *)(a1 + 60);
}

float sub_10009687C@<S0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  if ((sub_100072A24((uint64_t)a1, a2) & 1) == 0)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 56))(&v11, a1, a2);
    uint64_t v6 = sub_100095F5C(a1[15], a2);
    *(_DWORD *)uint64_t v6 = v11;
    *((_DWORD *)v6 + 14) |= 9u;
  }

  uint64_t v7 = a1[15];
  if (*(_DWORD *)(v7 + 92) == (_DWORD)a2) {
    unint64_t v8 = (float **)(v7 + 96);
  }
  else {
    unint64_t v8 = (float **)(*(void *)(v7 + 8) + 8LL * ((int)a2 + 1));
  }
  unint64_t v9 = *v8;
  float result = *v9;
  *a3 = *(_DWORD *)v9;
  return result;
}

void *sub_100096924(void *a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (a3)
  {
    uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 32LL))(v4);
    sub_1000969A0(v10, v5);
    uint64_t v4 = v10[0];
    uint64_t v6 = v10[1];
  }

  else
  {
    uint64_t v6 = *(void *)(a2 + 16);
    if (v6)
    {
      uint64_t v7 = (unint64_t *)(v6 + 8);
      do
        unint64_t v8 = __ldxr(v7);
      while (__stxr(v8 + 1, v7));
    }
  }

  a1[1] = v4;
  a1[2] = v6;
  *a1 = off_1000D39C0;
  return a1;
}

void *sub_1000969A0(void *a1, uint64_t a2)
{
  *a1 = a2;
  uint64_t v4 = operator new(0x20uLL);
  *uint64_t v4 = &off_1000D4020;
  v4[1] = 0LL;
  v4[2] = 0LL;
  int v4[3] = a2;
  a1[1] = v4;
  return a1;
}

void sub_1000969E4(_Unwind_Exception *exception_object)
{
  if (v1) {
    (*(void (**)(uint64_t))(*(void *)v1 + 8LL))(v1);
  }
  _Unwind_Resume(exception_object);
}

void sub_100096A08(std::__shared_weak_count *a1)
{
}

uint64_t sub_100096A1C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 24);
  if (result) {
    return (*(uint64_t (**)(uint64_t))(*(void *)result + 8LL))(result);
  }
  return result;
}

uint64_t sub_100096A34(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }

  else
  {
    return 0LL;
  }

uint64_t sub_100096A7C(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 16);
  if (v2 < *(_DWORD *)(v3 + 64)) {
    return 0LL;
  }
  uint64_t v5 = sub_100072EC0(v3);
  uint64_t v6 = v5;
  do
  {
    sub_100096BC8(&v20, *(void *)(a1 + 8), v6);
    unint64_t v7 = v21;
    uint64_t v8 = *((void *)v20 + 3);
    uint64_t v9 = *((void *)v20 + 4) - v8;
    uint64_t v10 = *(void *)(a1 + 16);
    if (v21 < v9 >> 4)
    {
      uint64_t v11 = v9 >> 4;
      int v12 = *(_DWORD *)(v10 + 64);
      unint64_t v13 = (int *)(v8 + 16 * v21 + 12);
      do
      {
        int v15 = *v13;
        v13 += 4;
        int v14 = v15;
        if (v12 <= v15)
        {
          int v12 = v14 + 1;
          *(_DWORD *)(v10 + 64) = v14 + 1;
        }

        ++v7;
      }

      while (v11 != v7);
      unint64_t v21 = v11;
    }

    sub_100071AB8(v10, v6);
    int v16 = *(_DWORD *)(a1 + 24);
    uint64_t v17 = *(void *)(a1 + 16);
    int v18 = *(_DWORD *)(v17 + 64);
    --*((_DWORD *)v20 + 15);
    BOOL v4 = v16 >= v18;
    if (v16 < v18) {
      break;
    }
    uint64_t v6 = sub_100072EC0(v17);
  }

  while ((int)v6 < *(_DWORD *)(*(void *)(a1 + 16) + 64LL));
  return v4;
}

void sub_100096B8C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_100096BA0(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t sub_100096BA8(uint64_t result)
{
  return result;
}

uint64_t sub_100096BB8(uint64_t result)
{
  *(_DWORD *)(result + ++*(_DWORD *)(result + 24) = 0;
  return result;
}

char **sub_100096BC8(char **a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  a1[1] = 0LL;
  unint64_t v7 = sub_100095F5C(*(void *)(v6 + 120), a3);
  *a1 = v7;
  ++*((_DWORD *)v7 + 15);
  if ((sub_100072AF0(*(void *)(a2 + 8), a3) & 1) == 0) {
    (*(void (**)(void, uint64_t))(**(void **)(a2 + 8) + 40LL))(*(void *)(a2 + 8), a3);
  }
  return a1;
}

void sub_100096C40(_Unwind_Exception *a1)
{
}

int *sub_100096C54@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, int a3@<W2>, int *a4@<X8>)
{
  if (a3)
  {
    else {
      uint64_t result = (int *)(*a2 + 4LL * (*(int (**)(uint64_t))(*(void *)a1 + 16LL))(a1));
    }
    *a4 = *result;
  }

  else
  {
    uint64_t result = sub_10002ADB0();
    float v8 = *(float *)result;
    *a4 = *result;
    uint64_t v9 = *a2;
    if (a2[1] != *a2)
    {
      unint64_t v10 = 0LL;
      do
      {
        uint64_t result = (int *)(*(void *(**)(uint64_t *__return_ptr, uint64_t, unint64_t))(*(void *)a1 + 24LL))( &v14,  a1,  v10);
        float v11 = *(float *)(v9 + 4 * v10);
        if (v11 == -INFINITY || *(float *)&v14 >= -INFINITY && *(float *)&v14 <= -INFINITY)
        {
          uint64_t result = sub_1000606CC();
          float v12 = *(float *)result;
        }

        else
        {
          BOOL v13 = *(float *)&v14 == INFINITY || v11 == INFINITY;
          float v12 = v11 + *(float *)&v14;
          if (v13) {
            float v12 = INFINITY;
          }
        }

        if (v8 == -INFINITY || v12 >= -INFINITY && v12 <= -INFINITY)
        {
          uint64_t result = sub_1000606CC();
          float v8 = *(float *)result;
        }

        else if (v8 >= v12)
        {
          float v8 = v12;
        }

        *(float *)a4 = v8;
        ++v10;
        uint64_t v9 = *a2;
      }

      while (v10 < (a2[1] - *a2) >> 2);
    }
  }

  return result;
}

uint64_t sub_100096DC4(uint64_t *a1, uint64_t *a2, int a3)
{
  uint64_t result = (*(uint64_t (**)(uint64_t *))(*a1 + 136))(a1);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v68 = 0LL;
  int v69 = 0;
  signed int v70 = 0;
  (*(void (**)(uint64_t *, uint64_t *))(*a1 + 112))(a1, &v68);
LABEL_3:
  if (v68)
  {
    if (v68)
    {
      int v7 = (*(uint64_t (**)(uint64_t))(*(void *)v68 + 24LL))(v68);
      goto LABEL_9;
    }
  }

  else if (v70 >= v69)
  {
    goto LABEL_90;
  }

  int v7 = v70;
LABEL_9:
  uint64_t v8 = v7;
  uint64_t v9 = *a2;
  if (v7 != (a2[1] - *a2) >> 2)
  {
    unint64_t v10 = sub_10002ADB0();
    LODWORD(v64) = *(_DWORD *)(v9 + 4 * v8);
    LODWORD(v67) = *v10;
    v11.n128_u32[0] = v64;
    (*(void (**)(uint64_t *, uint64_t, uint64_t *, float))(*a1 + 272))(a1, v8, &v67, *(float *)&v64);
    while (1)
    {
      if ((*(unsigned int (**)(uint64_t))(*(void *)v67 + 16LL))(v67))
      {
        if (v67) {
          (*(void (**)(uint64_t))(*(void *)v67 + 8LL))(v67);
        }
        if (a3)
        {
LABEL_49:
          if (a3 == 1)
          {
            (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t, __n128))(*a1 + 24))(&v64, a1, v8, v11);
            float v21 = *(float *)(v9 + 4 * v8);
            if (v21 == -INFINITY || *(float *)&v64 >= -INFINITY && *(float *)&v64 <= -INFINITY)
            {
              float v22 = *(float *)sub_1000606CC();
            }

            else
            {
              BOOL v25 = *(float *)&v64 == INFINITY || v21 == INFINITY;
              float v22 = v21 + *(float *)&v64;
              if (v25) {
                float v22 = INFINITY;
              }
            }

            float v62 = v22;
            (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v62);
          }
        }

        else
        {
          (*(void (**)(uint64_t *__return_ptr, uint64_t *, uint64_t))(*a1 + 24))(&v64, a1, v8);
          if (*(float *)&v64 == -INFINITY || (float v23 = *(float *)(v9 + 4 * v8), v23 >= -INFINITY) && v23 <= -INFINITY)
          {
            float v24 = *(float *)sub_1000606CC();
          }

          else
          {
            float v24 = *(float *)&v64 - v23;
            if (v23 == INFINITY) {
              float v24 = NAN;
            }
          }

          float v63 = v24;
          (*(void (**)(uint64_t *, uint64_t, float *))(*a1 + 160))(a1, v8, &v63);
        }

        if (v68) {
          (*(void (**)(uint64_t))(*(void *)v68 + 32LL))(v68);
        }
        else {
          ++v70;
        }
        goto LABEL_3;
      }

      uint64_t v12 = (*(uint64_t (**)(uint64_t))(*(void *)v67 + 24LL))(v67);
      uint64_t v64 = *(void *)v12;
      float v65 = *(float *)(v12 + 8);
      int v66 = *(_DWORD *)(v12 + 12);
      uint64_t v13 = v66;
      uint64_t v14 = *a2;
      if (v66 < (unint64_t)((a2[1] - *a2) >> 2))
      {
        int v15 = sub_10002ADB0();
        float v72 = *(float *)(v14 + 4 * v13);
        float v71 = *(float *)v15;
        if (v72 != v71) {
          break;
        }
      }

LABEL_171:
  uint64_t v57 = (*(uint64_t (**)(uint64_t *, uint64_t, void, __n128))(*a1 + 56))(a1, 0xFFFFFFFF0007LL, 0LL, v34);
  uint64_t v58 = sub_1000A4BFC(v57);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*a1 + 168))(a1, v58, 0xFFFFFFFF0007LL);
  uint64_t result = v68;
  if (v68) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v68 + 8LL))(v68);
  }
  return result;
}

void sub_1000977C0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  if (a15) {
    (*(void (**)(uint64_t))(*(void *)a15 + 8LL))(a15);
  }
  _Unwind_Resume(exception_object);
}

int *sub_100097860(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = sub_10002AD60();
  LODWORD(v23) = *a2;
  LODWORD(v21) = *result;
  uint64_t result = sub_10002ADB0();
  LODWORD(v23) = *a2;
  LODWORD(v21) = *result;
  float v7 = *(float *)&v23;
  if (a3)
  {
    float v23 = 0LL;
    float v24 = 0.0;
    unsigned int v26 = 0;
    (*(void (**)(uint64_t, int **, float))(*(void *)a1 + 112LL))(a1, &v23, v7);
    while (1)
    {
      uint64_t result = v23;
      if (!v23) {
        break;
      }
      int v8 = (*(uint64_t (**)(int *))(*(void *)v23 + 16LL))(v23);
      uint64_t result = v23;
      if (v8)
      {
        if (v23) {
          return (int *)(*(uint64_t (**)(void))(*(void *)v23 + 8LL))();
        }
        return result;
      }

      if (!v23) {
        goto LABEL_11;
      }
      uint64_t v9 = (*(uint64_t (**)(void))(*(void *)v23 + 24LL))();
      if (v23) {
        uint64_t v10 = (*(uint64_t (**)(int *))(*(void *)v23 + 24LL))(v23);
      }
      else {
        uint64_t v10 = v26;
      }
LABEL_12:
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 24LL))(&v21, a1, v10);
      if (*(float *)&v21 == -INFINITY || (float v11 = *(float *)a2, *(float *)a2 >= -INFINITY) && *(float *)a2 <= -INFINITY)
      {
        float v12 = *(float *)sub_1000606CC();
      }

      else
      {
        float v12 = *(float *)&v21 - v11;
        if (v11 == INFINITY) {
          float v12 = NAN;
        }
      }

      float v22 = v12;
      (*(void (**)(uint64_t, uint64_t, float *))(*(void *)a1 + 160LL))(a1, v9, &v22);
      if (v23) {
        (*(void (**)(int *))(*(void *)v23 + 32LL))(v23);
      }
      else {
        ++v26;
      }
    }

void sub_100097BE0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a10) {
    (*(void (**)(uint64_t))(*(void *)a10 + 8LL))(a10);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_100097C1C(uint64_t result)
{
  uint64_t v1 = *(_DWORD **)(result + 24);
  if (v1) {
    --*v1;
  }
  return result;
}

CFLocaleRef *sub_100097C34(CFLocaleRef *a1, const __CFLocale *a2)
{
  *a1 = CFLocaleCreateCopy(0LL, a2);
  return a1;
}

CFTypeRef *sub_100097C60(CFTypeRef *a1)
{
  return a1;
}

CFTypeRef *sub_100097C8C(CFTypeRef *a1)
{
  return a1;
}

void sub_100097CB8(CFLocaleRef *a1@<X0>, const char *a2@<X1>, void *a3@<X8>)
{
  uint64_t v3 = a2;
  if (a2[23] < 0) {
    a2 = *(const char **)a2;
  }
  uint64_t v6 = CFStringCreateWithCStringNoCopy(0LL, a2, 0x8000100u, kCFAllocatorNull);
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, v6);
  CFStringLowercase(MutableCopy, *a1);
  CFRelease(v6);
  if (MutableCopy)
  {
    sub_100097D98(MutableCopy, 1, a3);
  }

  else if (v3[23] < 0)
  {
    sub_10005AA70(a3, *(void **)v3, *((void *)v3 + 1));
  }

  else
  {
    *(_OWORD *)a3 = *(_OWORD *)v3;
    a3[2] = *((void *)v3 + 2);
  }

void sub_100097D98(const __CFString *a1@<X0>, int a2@<W1>, void *a3@<X8>)
{
  if (a1)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    __chkstk_darwin();
    int v8 = (char *)&v10 - v7;
    CFStringGetCString(a1, (char *)&v10 - v7, v9, 0x8000100u);
    sub_10000A2DC(a3, v8);
    if (a2) {
      CFRelease(a1);
    }
  }

  else
  {
    sub_10000A2DC(a3, 0LL);
  }

void sub_100097EA8(_Unwind_Exception *exception_object)
{
}

void sub_100097ECC(CFStringRef theString@<X1>, CFLocaleRef *a2@<X0>, void *a3@<X8>)
{
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0LL, 0LL, theString);
  CFStringLowercase(MutableCopy, *a2);
  if (MutableCopy) {
    sub_100097D98(MutableCopy, 1, a3);
  }
  else {
    sub_10000A2DC(a3, 0LL);
  }
}

std::string *sub_100097F38@<X0>(const void **a1@<X1>, std::string *a2@<X8>)
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&qword_1000DDF30);
  if ((v4 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDF30))
  {
    int v8 = operator new(0x18uLL);
    sub_100098E30(v10, "zero", "0");
    sub_100098E80(v11, "one", "1");
    sub_100098E80(v12, "two", "2");
    sub_100098ED0(v13, "three", "3");
    sub_100098E30(v14, "four", "4");
    sub_100098E80(v15, "for", "4");
    sub_100098E30(v16, "five", "5");
    sub_100098E80(v17, "six", "6");
    sub_100098ED0(v18, "seven", "7");
    sub_100098ED0(v19, "eight", "8");
    sub_100098E30(v20, "nine", "9");
    sub_100098F20(v21, "to", "2");
    sub_100098E80(v22, "and", "&");
    sub_100098E30(v23, "null", "0");
    sub_100098E30(v24, "eins", "1");
    sub_100098E80(v25, "ein", "1");
    sub_100098E30(v26, "eine", "1");
    sub_100098ED0(v27, "einer", "1");
    sub_100098ED0(v28, "eines", "1");
    sub_100098ED0(v29, "einen", "1");
    sub_100098ED0(v30, "einem", "1");
    sub_100098E30(v31, "zwei", "2");
    sub_100098E80(v32, "zwo", "2");
    sub_100098E30(v33, "drei", "3");
    sub_100098E30(v34, "vier", "4");
    sub_100098ED0(v35, "fünf", "5");
    sub_100098ED0(v36, "sechs", "6");
    sub_100098F70(v37, "sieben", "7");
    sub_100098E30(v38, "acht", "8");
    sub_100098E30(v39, "neun", "9");
    sub_100098FC0(v40, "zehn", "10");
    sub_100099010(v41, "elf", "11");
    sub_100099060(v42, "zwölf", "12");
    sub_100098E30(v43, "cero", "0");
    sub_100098F20(v44, "un", "1");
    sub_100098E80(v45, "uno", "1");
    sub_100098E80(v46, "una", "1");
    sub_100098E80(v47, "dos", "2");
    sub_100098E30(v48, "tres", "3");
    sub_100098F70(v49, "cuatro", "4");
    sub_100098ED0(v50, "cinco", "5");
    sub_100098E30(v51, "seis", "6");
    sub_100098ED0(v52, "siete", "7");
    sub_100098E30(v53, "ocho", "8");
    sub_100098ED0(v54, "nueve", "9");
    sub_100098ED0(v55, "zéro", "0");
    sub_100098E80(v56, "une", "1");
    sub_100098E30(v57, "deux", "2");
    sub_100098ED0(v58, "trois", "3");
    sub_100098F70(v59, "quatre", "4");
    sub_100098E30(v60, "cinq", "5");
    sub_100098E30(v61, "sept", "7");
    sub_100098E30(v62, "huit", "8");
    sub_100098E30(v63, "neuf", "9");
    sub_100098E80(v64, "零", "0");
    sub_100098E80(v65, "〇", "0");
    sub_100098E80(v66, "一", "1");
    sub_100098E80(v67, "壱", "1");
    sub_100098E80(v68, "二", "2");
    sub_100098E80(v69, "两", "2");
    sub_100098E80(v70, "兩", "2");
    sub_100098E80(v71, "三", "3");
    sub_100098E80(v72, "四", "4");
    sub_100098E80(v73, "五", "5");
    sub_100098E80(v74, "六", "6");
    sub_100098E80(v75, "七", "7");
    sub_100098E80(v76, "八", "8");
    sub_100098E80(v77, "九", "9");
    sub_1000991FC((uint64_t)v8, v10, 68LL);
    for (uint64_t i = 402LL; i != -6; i -= 6LL)
      sub_100014BB4((uint64_t)&v10[i]);
    qword_1000DDF28 = (uint64_t)v8;
    __cxa_guard_release(&qword_1000DDF30);
  }

  sub_10000A2DC(a2, "");
  uint64_t v5 = sub_10001AE70(qword_1000DDF28, a1);
  uint64_t result = (std::string *)qword_1000DDF28;
  if (qword_1000DDF28 + 8 != v5)
  {
    uint64_t v7 = (const std::string *)sub_1000988D8(qword_1000DDF28, a1);
    return std::string::operator=(a2, v7);
  }

  return result;
}

void sub_10009884C(_Unwind_Exception *a1)
{
  for (uint64_t i = 3216LL; i != -48; i -= 48LL)
    sub_100014BB4(v2 + i);
  operator delete(v1);
  __cxa_guard_abort(&qword_1000DDF30);
  _Unwind_Resume(a1);
}

uint64_t sub_1000988D8(uint64_t a1, const void **a2)
{
  uint64_t v2 = *sub_100099510(a1, &v4, a2);
  if (!v2) {
    sub_100018030("map::at:  key not found");
  }
  return v2 + 56;
}

__CFArray *sub_100098914(CFLocaleRef *a1, const __CFString *a2)
{
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (a2)
  {
    CFIndex Length = CFStringGetLength(a2);
    v17.location = 0LL;
    v17.length = Length;
    uint64_t v6 = CFStringTokenizerCreate(0LL, a2, v17, 4uLL, *a1);
    while (CFStringTokenizerAdvanceToNextToken(v6))
    {
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v6);
      CFIndex v8 = CurrentTokenRange.length;
      if (qword_1000DDF38 != -1) {
        dispatch_once(&qword_1000DDF38, &stru_1000D4168);
      }
      if (CFStringFindCharacterFromSet(a2, (CFCharacterSetRef)qword_1000DDF40, CurrentTokenRange, 0LL, &v16))
      {
        CFIndex v9 = CurrentTokenRange.length + CurrentTokenRange.location;
LABEL_7:
        if (v9 < Length - 1)
        {
          if (qword_1000DDF38 != -1) {
            dispatch_once(&qword_1000DDF38, &stru_1000D4168);
          }
          uint64_t v10 = (const __CFCharacterSet *)qword_1000DDF40;
          UniChar CharacterAtIndex = CFStringGetCharacterAtIndex(a2, v9 + 1);
          if (CFCharacterSetIsCharacterMember(v10, CharacterAtIndex))
          {
            int v12 = CFStringGetCharacterAtIndex(a2, v9);
            if ((v12 - 8208) < 2 || v12 == 173 || v12 == 45)
            {
              while (CFStringTokenizerAdvanceToNextToken(v6))
              {
                CFRange v13 = CFStringTokenizerGetCurrentTokenRange(v6);
                if (v13.location > v9)
                {
                  CFIndex v8 = v13.length - CurrentTokenRange.location + v13.location;
                  CFIndex v9 = v13.length + v13.location;
                  goto LABEL_7;
                }
              }
            }
          }
        }

        v18.location = CurrentTokenRange.location;
        v18.length = v8;
        CFStringRef v14 = CFStringCreateWithSubstring(0LL, a2, v18);
        CFArrayAppendValue(Mutable, v14);
        CFRelease(v14);
      }
    }

    CFRelease(v6);
  }

  return Mutable;
}

__CFArray *sub_100098AFC(uint64_t a1, const __CFString *a2)
{
  Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  if (a2)
  {
    if (sub_100098BA4((BOOL)a2))
    {
      CFArrayAppendValue(Mutable, a2);
    }

    else if (CFStringGetLength(a2) >= 1)
    {
      CFIndex v4 = 0LL;
      do
      {
        v7.location = v4;
        v7.length = 1LL;
        CFStringRef v5 = CFStringCreateWithSubstring(0LL, a2, v7);
        CFArrayAppendValue(Mutable, v5);
        ++v4;
      }

      while (v4 < CFStringGetLength(a2));
    }
  }

  return Mutable;
}

BOOL sub_100098BA4(BOOL theString)
{
  if (theString)
  {
    uint64_t v1 = (const __CFString *)theString;
    if (qword_1000DDF58 != -1) {
      dispatch_once(&qword_1000DDF58, &stru_1000D41E8);
    }
    uint64_t v2 = (const __CFCharacterSet *)qword_1000DDF60;
    v4.length = CFStringGetLength(v1);
    v4.location = 0LL;
    return CFStringFindCharacterFromSet(v1, v2, v4, 0LL, &v3) == 0;
  }

  return theString;
}

BOOL sub_100098C28(const __CFString *a1)
{
  return CFStringCompare(a1, @"\n\n", 0LL) == kCFCompareEqualTo;
}

CFStringRef sub_100098C50(const __CFString *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFStringGetLength(result) == 1)
    {
      if (qword_1000DDF48 != -1) {
        dispatch_once(&qword_1000DDF48, &stru_1000D41A8);
      }
      uint64_t v2 = (const __CFCharacterSet *)qword_1000DDF50;
      v5.length = CFStringGetLength(v1);
      v5.location = 0LL;
      return (const __CFString *)(CFStringFindCharacterFromSet(v1, v2, v5, 0LL, &v4) == 0);
    }

    else
    {
      return (const __CFString *)(CFStringCompare(v1, @"\n\n", 0LL) == kCFCompareEqualTo);
    }
  }

  return result;
}

CFStringRef sub_100098CFC(uint64_t a1)
{
  uint64_t v1 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(void *)(a1 + 8)) {
      return 0LL;
    }
    uint64_t v1 = *(const char **)a1;
  }

  else if (!*(_BYTE *)(a1 + 23))
  {
    return 0LL;
  }

  uint64_t v2 = CFStringCreateWithCString(0LL, v1, 0x8000100u);
  CFRange v3 = sub_100098C50(v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

BOOL sub_100098D68(uint64_t a1)
{
  uint64_t v1 = (const char *)a1;
  if (*(char *)(a1 + 23) < 0)
  {
    if (!*(void *)(a1 + 8)) {
      return 0LL;
    }
    uint64_t v1 = *(const char **)a1;
  }

  else if (!*(_BYTE *)(a1 + 23))
  {
    return 0LL;
  }

  CFStringRef v2 = CFStringCreateWithCString(0LL, v1, 0x8000100u);
  BOOL v3 = sub_100098BA4((BOOL)v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

uint64_t sub_100098DD4(char *a1)
{
  if (a1[23] < 0)
  {
    uint64_t v1 = *((void *)a1 + 1);
    if (v1)
    {
      a1 = *(char **)a1;
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v1 = a1[23];
    if (a1[23])
    {
LABEL_6:
      while ((*a1 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[*a1] & 0x400) != 0)
      {
        ++a1;
        if (!--v1) {
          return 1LL;
        }
      }
    }
  }

  return 0LL;
}

void *sub_100098E30(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098E64(_Unwind_Exception *exception_object)
{
}

void *sub_100098E80(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098EB4(_Unwind_Exception *exception_object)
{
}

void *sub_100098ED0(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098F04(_Unwind_Exception *exception_object)
{
}

void *sub_100098F20(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098F54(_Unwind_Exception *exception_object)
{
}

void *sub_100098F70(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098FA4(_Unwind_Exception *exception_object)
{
}

void *sub_100098FC0(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100098FF4(_Unwind_Exception *exception_object)
{
}

void *sub_100099010(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100099044(_Unwind_Exception *exception_object)
{
}

void *sub_100099060(void *a1, char *a2, char *a3)
{
  CFRange v5 = sub_10000A2DC(a1, a2);
  sub_10000A2DC(v5 + 3, a3);
  return a1;
}

void sub_100099094(_Unwind_Exception *exception_object)
{
}

void sub_1000990B0(id a1)
{
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0LL, Predefined);
  BOOL v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v3);
  CFCharacterSetInvert(MutableCopy);
  qword_1000DDF40 = (uint64_t)MutableCopy;
}

void sub_100099104(id a1)
{
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetUppercaseLetter);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0LL, Predefined);
  BOOL v3 = CFCharacterSetGetPredefined(kCFCharacterSetLowercaseLetter);
  CFCharacterSetUnion(MutableCopy, v3);
  CFRange v4 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v4);
  CFRange v5 = CFCharacterSetGetPredefined(kCFCharacterSetSymbol);
  CFCharacterSetUnion(MutableCopy, v5);
  uint64_t v6 = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFCharacterSetUnion(MutableCopy, v6);
  CFRange v7 = CFCharacterSetGetPredefined(kCFCharacterSetWhitespaceAndNewline);
  CFCharacterSetUnion(MutableCopy, v7);
  CFCharacterSetInvert(MutableCopy);
  qword_1000DDF50 = (uint64_t)MutableCopy;
}

void sub_1000991A8(id a1)
{
  Predefined = CFCharacterSetGetPredefined(kCFCharacterSetDecimalDigit);
  CFMutableStringRef MutableCopy = CFCharacterSetCreateMutableCopy(0LL, Predefined);
  BOOL v3 = CFCharacterSetGetPredefined(kCFCharacterSetPunctuation);
  CFCharacterSetUnion(MutableCopy, v3);
  CFCharacterSetInvert(MutableCopy);
  qword_1000DDF60 = (uint64_t)MutableCopy;
}

uint64_t sub_1000991FC(uint64_t a1, const void **a2, uint64_t a3)
{
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  CFRange v4 = (uint64_t *)(a1 + 8);
  *(void *)(a1 + 16) = 0LL;
  *(void *)a1 = a1 + 8;
  if (a3)
  {
    uint64_t v6 = 48 * a3;
    do
    {
      sub_10009927C((uint64_t **)a1, v4, a2, (__int128 *)a2);
      a2 += 6;
      v6 -= 48LL;
    }

    while (v6);
  }

  return a1;
}

void sub_100099264(_Unwind_Exception *a1)
{
}

uint64_t *sub_10009927C(uint64_t **a1, uint64_t *a2, const void **a3, __int128 *a4)
{
  uint64_t v6 = sub_100099310(a1, a2, &v12, &v11, a3);
  CFRange v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    CFIndex v8 = (uint64_t **)v6;
    sub_1000994A8((uint64_t)a1, a4, (uint64_t)v10);
    sub_100019D14(a1, (uint64_t)v12, v8, v10[0]);
    CFRange v7 = v10[0];
    v10[0] = 0LL;
    sub_100099640((uint64_t)v10, 0LL);
  }

  return v7;
}

const void **sub_100099310(void *a1, uint64_t *a2, const void ***a3, uint64_t *a4, const void **a5)
{
  CFIndex v9 = (const void **)(a1 + 1);
  if (a1 + 1 == a2 || sub_10001AEFC((uint64_t)(a1 + 2), a5, (const void **)a2 + 4))
  {
    if ((uint64_t *)*a1 == a2)
    {
      int v12 = (const void **)a2;
LABEL_16:
      if (*a2)
      {
        *a3 = v12;
        return v12 + 1;
      }

      else
      {
        *a3 = (const void **)a2;
        return (const void **)a2;
      }
    }

    uint64_t v11 = (const void **)*a2;
    if (*a2)
    {
      do
      {
        int v12 = v11;
        uint64_t v11 = (const void **)v11[1];
      }

      while (v11);
    }

    else
    {
      CFRange v16 = a2;
      do
      {
        int v12 = (const void **)v16[2];
        BOOL v17 = *v12 == v16;
        CFRange v16 = (uint64_t *)v12;
      }

      while (v17);
    }

    return (const void **)sub_100099510((uint64_t)a1, a3, a5);
  }

  if (sub_10001AEFC((uint64_t)(a1 + 2), (const void **)a2 + 4, a5))
  {
    a4 = a2 + 1;
    uint64_t v13 = a2[1];
    if (v13)
    {
      CFStringRef v14 = (const void **)a2[1];
      do
      {
        float v15 = v14;
        CFStringRef v14 = (const void **)*v14;
      }

      while (v14);
    }

    else
    {
      CFRange v18 = (const void **)a2;
      do
      {
        float v15 = (const void **)v18[2];
        BOOL v17 = *v15 == v18;
        CFRange v18 = v15;
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
      *a3 = (const void **)a2;
    }

    return (const void **)a4;
  }

  *a3 = (const void **)a2;
  *a4 = (uint64_t)a2;
  return (const void **)a4;
}

char *sub_1000994A8@<X0>(uint64_t a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x50uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + sub_100017FC4(v21 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = sub_1000995AC(v6 + 32, a2);
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_1000994F8(_Unwind_Exception *a1)
{
}

void *sub_100099510(uint64_t a1, void *a2, const void **a3)
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
        CFIndex v8 = (void *)v4;
        CFIndex v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_10001AEFC(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    CFIndex v8 = (void *)(a1 + 8);
  }

char *sub_1000995AC(char *__dst, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v4;
  }

  uint64_t v5 = __dst + 24;
  if (*((char *)a2 + 47) < 0)
  {
    sub_10005AA70(v5, *((void **)a2 + 3), *((void *)a2 + 4));
  }

  else
  {
    __int128 v6 = *(__int128 *)((char *)a2 + 24);
    *((void *)__dst + 5) = *((void *)a2 + 5);
    *(_OWORD *)uint64_t v5 = v6;
  }

  return __dst;
}

void sub_100099624(_Unwind_Exception *exception_object)
{
}

void sub_100099640(uint64_t a1, uint64_t a2)
{
  CFStringRef v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_100099684((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }

void sub_100099684(uint64_t a1)
{
}

void sub_1000996C8(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_1000996C8(a1, *a2);
    sub_1000996C8(a1, a2[1]);
    sub_100099684((uint64_t)(a2 + 4));
    operator delete(a2);
  }

double *sub_100099710( double *__dst, __int128 *a2, char a3, char a4, double a5, double a6, double a7, double a8)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v15 = *a2;
    __dst[2] = *((double *)a2 + 2);
    *(_OWORD *)__dst = v15;
  }

  __dst[3] = a5;
  __dst[4] = a6;
  __dst[5] = a7;
  __dst[6] = a8;
  *((_BYTE *)__dst + 56) = a3;
  *((_BYTE *)__dst + 57) = a4;
  return __dst;
}

void sub_10009979C(uint64_t a1@<X0>, uint64_t a2@<X1>, double **a3@<X8>)
{
  else {
    std::string __dst = *(std::string *)a1;
  }
  if (*(char *)(a2 + 23) < 0)
  {
    sub_10005AA70(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)__int128 __p = *(_OWORD *)a2;
    uint64_t v22 = *(void *)(a2 + 16);
  }

  if (v22 >= 0) {
    __int128 v6 = __p;
  }
  else {
    __int128 v6 = (void **)__p[0];
  }
  if (v22 >= 0) {
    std::string::size_type v7 = HIBYTE(v22);
  }
  else {
    std::string::size_type v7 = (std::string::size_type)__p[1];
  }
  CFIndex v8 = std::string::append(&__dst, (const std::string::value_type *)v6, v7);
  CFIndex v9 = (void *)v8->__r_.__value_.__r.__words[0];
  std::string::size_type size = v8->__r_.__value_.__l.__size_;
  v23[0] = v8->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v23 + 3) = *(_DWORD *)((char *)&v8->__r_.__value_.__r.__words[2] + 3);
  int v11 = (char)v8->__r_.__value_.__s.__size_;
  v8->__r_.__value_.__l.__size_ = 0LL;
  v8->__r_.__value_.__l.__cap_ = 0LL;
  v8->__r_.__value_.__r.__words[0] = 0LL;
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  uint64_t v12 = *(void *)(a1 + 24);
  uint64_t v13 = *(void *)(a2 + 32);
  uint64_t v14 = *(void *)(a1 + 40);
  double v15 = *(double *)(a1 + 48);
  double v16 = *(double *)(a2 + 48);
  char v17 = *(_BYTE *)(a2 + 56);
  char v18 = *(_BYTE *)(a1 + 57);
  float v19 = (double *)operator new(0x40uLL);
  if ((v11 & 0x80000000) == 0)
  {
    __dst.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
    __dst.__r_.__value_.__l.__size_ = size;
    LODWORD(__dst.__r_.__value_.__r.__words[2]) = v23[0];
    *(_DWORD *)((char *)&__dst.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v23 + 3);
    __dst.__r_.__value_.__s.__size_ = v11;
LABEL_20:
    BOOL v20 = 0;
    *(std::string *)float v19 = __dst;
    goto LABEL_21;
  }

  sub_10005AA70(&__dst, v9, size);
  sub_10005AA70(v19, __dst.__r_.__value_.__l.__data_, __dst.__r_.__value_.__l.__size_);
  BOOL v20 = (__dst.__r_.__value_.__s.__size_ & 0x80u) != 0;
LABEL_21:
  *((void *)v19 + 3) = v12;
  *((void *)v19 + 4) = v13;
  *((void *)v19 + 5) = v14;
  void v19[6] = v15 + v16;
  *((_BYTE *)v19 + 56) = v17;
  *((_BYTE *)v19 + 57) = v18;
  *a3 = v19;
  if (v20) {
    operator delete(__dst.__r_.__value_.__l.__data_);
  }
  if (v11 < 0) {
    operator delete(v9);
  }
}

void sub_100099968( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  operator delete(v22);
  operator delete(v21);
  _Unwind_Resume(a1);
}

void sub_1000999D4(uint64_t *a1)
{
  uint64_t v13 = (__int128 ****)a1[1];
  for (uint64_t i = (__int128 ****)*a1; i != v13; i += 3)
  {
    uint64_t v1 = (os_log_s *)sub_1000A39A8();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "CMDPTokenSausage -> phrase", buf, 2u);
    }

    CFStringRef v2 = *i;
    BOOL v3 = i[1];
    while (v2 != v3)
    {
      __int128 v4 = (os_log_s *)sub_1000A39A8();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "CMDPTokenSausage -> token_group_array",  buf,  2u);
      }

      uint64_t v5 = *v2;
      __int128 v6 = v2[1];
      while (v5 != v6)
      {
        std::string::size_type v7 = (os_log_s *)sub_1000A39A8();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          CFIndex v8 = *v5;
          if (*((char *)*v5 + 23) < 0)
          {
            sub_10005AA70(buf, *(void **)v8, *((void *)v8 + 1));
          }

          else
          {
            __int128 v9 = *v8;
            uint64_t v16 = *((void *)v8 + 2);
            *(_OWORD *)buf = v9;
          }

          uint64_t v10 = v16 >= 0 ? buf : *(uint8_t **)buf;
          *(_DWORD *)char v17 = 136315138;
          char v18 = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "CMDPTokenSausage -> token: %s\n",  v17,  0xCu);
          if (SHIBYTE(v16) < 0) {
            operator delete(*(void **)buf);
          }
        }

        if (*((_BYTE *)*v5 + 57))
        {
          int v11 = (os_log_s *)sub_1000A39A8();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Has space before", buf, 2u);
          }
        }

        if (*((_BYTE *)*v5 + 56))
        {
          uint64_t v12 = (os_log_s *)sub_1000A39A8();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Has space after", buf, 2u);
          }
        }

        ++v5;
      }

      v2 += 3;
    }
  }

void sub_100099C3C(uint64_t *a1@<X0>, int a2@<W1>, CFLocaleRef *a3@<X2>, uint64_t *a4@<X8>)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = 0LL;
  __int128 v4 = (uint64_t **)*a1;
  float v44 = (uint64_t **)a1[1];
  do
  {
    uint64_t v55 = 0LL;
    uint64_t v56 = 0LL;
    uint64_t v57 = 0LL;
    std::string::size_type v7 = *v4;
    float v45 = v4;
    float v46 = v4[1];
    if (*v4 == v46) {
      goto LABEL_75;
    }
    do
    {
      float v53 = 0LL;
      unint64_t v54 = 0LL;
      float v52 = 0LL;
      uint64_t v8 = *v7;
      if (v7[1] == *v7) {
        goto LABEL_69;
      }
      unint64_t v9 = 0LL;
      while (1)
      {
        if (a2)
        {
          if (a2 != 1)
          {
            unsigned __int8 v14 = 0;
            goto LABEL_18;
          }

          uint64_t v10 = *(__int128 **)(v8 + 8 * v9);
          if (*((char *)v10 + 23) < 0)
          {
            sub_10005AA70(&__p, *(void **)v10, *((void *)v10 + 1));
          }

          else
          {
            __int128 v11 = *v10;
            __p.__r_.__value_.__l.__cap_ = *((void *)v10 + 2);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
          }

          unsigned __int8 v15 = sub_100098D68((uint64_t)&__p);
        }

        else
        {
          uint64_t v12 = *(__int128 **)(v8 + 8 * v9);
          if (*((char *)v12 + 23) < 0)
          {
            sub_10005AA70(&__p, *(void **)v12, *((void *)v12 + 1));
          }

          else
          {
            __int128 v13 = *v12;
            __p.__r_.__value_.__l.__cap_ = *((void *)v12 + 2);
            *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v13;
          }

          unsigned __int8 v15 = sub_100098CFC((uint64_t)&__p);
        }

        unsigned __int8 v14 = v15;
LABEL_18:
        uint64_t v16 = *(__int128 **)(v8 + 8 * v9);
        if (*((char *)v16 + 23) < 0)
        {
          sub_10005AA70(&__p, *(void **)v16, *((void *)v16 + 1));
        }

        else
        {
          __int128 v17 = *v16;
          __p.__r_.__value_.__l.__cap_ = *((void *)v16 + 2);
          *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v17;
        }

        sub_100098CFC((uint64_t)&__p);
        if ((char)__p.__r_.__value_.__s.__size_ < 0)
        {
          operator delete(__p.__r_.__value_.__l.__data_);
          if ((v14 & 1) != 0)
          {
LABEL_23:
            char v18 = *(__int128 **)(v8 + 8 * v9);
            if (*((char *)v18 + 23) < 0)
            {
              sub_10005AA70(&__p, *(void **)v18, *((void *)v18 + 1));
            }

            else
            {
              __int128 v19 = *v18;
              __p.__r_.__value_.__l.__cap_ = *((void *)v18 + 2);
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v19;
            }

            std::string::size_type size = __p.__r_.__value_.__l.__size_;
            uint64_t v22 = (void *)__p.__r_.__value_.__r.__words[0];
            v51[0] = __p.__r_.__value_.__r.__words[2];
            *(_DWORD *)((char *)v51 + 3) = *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3);
            unsigned __int8 v24 = __p.__r_.__value_.__s.__size_;
            goto LABEL_41;
          }
        }

        else if ((v14 & 1) != 0)
        {
          goto LABEL_23;
        }

        BOOL v20 = *(__int128 **)(v8 + 8 * v9);
        if (*((char *)v20 + 23) < 0)
        {
          sub_10005AA70(__dst, *(void **)v20, *((void *)v20 + 1));
        }

        else
        {
          __int128 v21 = *v20;
          uint64_t v48 = *((void *)v20 + 2);
          *(_OWORD *)std::string __dst = v21;
        }

        sub_100097CB8(a3, (const char *)__dst, v49);
        sub_100097F38((const void **)v49, &__p);
        if (v50 < 0) {
          operator delete(v49[0]);
        }
        if (SHIBYTE(v48) < 0)
        {
          operator delete(__dst[0]);
          if (!a2)
          {
LABEL_38:
            unsigned __int8 v25 = sub_100098CFC((uint64_t)&__p);
            goto LABEL_39;
          }
        }

        else if (!a2)
        {
          goto LABEL_38;
        }

        if (a2 != 1) {
          break;
        }
        unsigned __int8 v25 = sub_100098D68((uint64_t)&__p);
LABEL_39:
        unsigned __int8 v24 = __p.__r_.__value_.__s.__size_;
        if ((v25 & 1) == 0) {
          goto LABEL_67;
        }
        std::string::size_type size = __p.__r_.__value_.__l.__size_;
        uint64_t v22 = (void *)__p.__r_.__value_.__r.__words[0];
        v51[0] = __p.__r_.__value_.__r.__words[2];
        *(_DWORD *)((char *)v51 + 3) = *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3);
LABEL_41:
        unsigned int v26 = *(void **)(v8 + 8 * v9);
        uint64_t v27 = v26[3];
        uint64_t v28 = v26[4];
        uint64_t v29 = v26[5];
        uint64_t v30 = v26[6];
        unint64_t v31 = operator new(0x40uLL);
        if ((v24 & 0x80) != 0)
        {
          sub_10005AA70(&__p, v22, size);
          if ((char)__p.__r_.__value_.__s.__size_ < 0)
          {
            sub_10005AA70(v31, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
            BOOL v32 = (__p.__r_.__value_.__s.__size_ & 0x80u) != 0;
            goto LABEL_45;
          }
        }

        else
        {
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v22;
          __p.__r_.__value_.__l.__size_ = size;
          LODWORD(__p.__r_.__value_.__r.__words[2]) = v51[0];
          *(_DWORD *)((char *)&__p.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v51 + 3);
          __p.__r_.__value_.__s.__size_ = v24;
        }

        BOOL v32 = 0;
        *(std::string *)unint64_t v31 = __p;
LABEL_45:
        v31[3] = v27;
        v31[4] = v28;
        v31[5] = v29;
        void v31[6] = v30;
        *((_WORD *)v31 + 2sub_100017FC4(v21 + 8) = 0;
        v49[0] = v31;
        if (v32) {
          operator delete(__p.__r_.__value_.__l.__data_);
        }
        unint64_t v33 = v53;
        if ((unint64_t)v53 >= v54)
        {
          uint64_t v36 = (v53 - v52) >> 3;
          unint64_t v37 = (uint64_t)(v54 - (void)v52) >> 2;
          if (v37 <= v36 + 1) {
            unint64_t v37 = v36 + 1;
          }
          else {
            unint64_t v38 = v37;
          }
          float v60 = &v54;
          if (v38) {
            float v39 = (char *)sub_100018788((uint64_t)&v54, v38);
          }
          else {
            float v39 = 0LL;
          }
          float v40 = &v39[8 * v36];
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v39;
          __p.__r_.__value_.__l.__size_ = (std::string::size_type)v40;
          float v59 = &v39[8 * v38];
          uint64_t v41 = v49[0];
          v49[0] = 0LL;
          *(void *)float v40 = v41;
          __p.__r_.__value_.__l.__cap_ = (std::string::size_type)(v40 + 8);
          sub_100018700((uint64_t *)&v52, &__p);
          uint64_t v35 = v53;
          sub_1000188CC((uint64_t)&__p);
        }

        else
        {
          __n128 v34 = v49[0];
          v49[0] = 0LL;
          *(void *)float v53 = v34;
          uint64_t v35 = v33 + 8;
        }

        float v53 = v35;
        uint64_t v42 = (void **)v49[0];
        v49[0] = 0LL;
        if (v42) {
          sub_1000186C8((int)v49, v42);
        }
        if ((v24 & 0x80) != 0) {
          operator delete(v22);
        }
        ++v9;
        uint64_t v8 = *v7;
        if (v9 >= (v7[1] - *v7) >> 3) {
          goto LABEL_69;
        }
      }

      unsigned __int8 v24 = __p.__r_.__value_.__s.__size_;
LABEL_67:
      if ((v24 & 0x80) != 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
LABEL_69:
      if (v52 != v53 && v53 - v52 == v7[1] - *v7) {
        sub_100012888(&v55, (uint64_t)&v52);
      }
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v52;
      sub_100018568((void ***)&__p);
      v7 += 3;
    }

    while (v7 != v46);
    if (v55 != v56) {
      sub_1000129C4(a4, (uint64_t)&v55);
    }
LABEL_75:
    __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v55;
    sub_100018E1C((void ***)&__p);
    __int128 v4 = v45 + 3;
  }

  while (v45 + 3 != v44);
}

void sub_10009A0E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t *a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, void *__p, uint64_t a34, int a35, __int16 a36, char a37, char a38)
{
  a27 = &a30;
  sub_100018E1C((void ***)&a27);
  a30 = a9;
  sub_100018608((void ***)&a30);
  _Unwind_Resume(a1);
}

void sub_10009A1F0(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  a2[2] = 0LL;
  uint64_t v2 = *a1;
  uint64_t v54 = a1[1];
  if (*a1 == v54) {
    return;
  }
  do
  {
    uint64_t v68 = 0LL;
    uint64_t v69 = 0LL;
    uint64_t v70 = 0LL;
    BOOL v3 = *(void **)v2;
    uint64_t v55 = v2;
    uint64_t v56 = *(void **)(v2 + 8);
    if (*(void **)v2 == v56) {
      goto LABEL_84;
    }
    do
    {
      int v66 = 0LL;
      unint64_t v67 = 0LL;
      float v65 = 0LL;
      uint64_t v4 = *v3;
      if (v3[1] == *v3) {
        goto LABEL_81;
      }
      uint64_t v57 = v3;
      unint64_t v5 = 0LL;
      do
      {
        __int128 v6 = *(__int128 **)(v4 + 8 * v5);
        if (*((char *)v6 + 23) < 0)
        {
          sub_10005AA70(__dst, *(void **)v6, *((void *)v6 + 1));
        }

        else
        {
          __int128 v7 = *v6;
          uint64_t v64 = *((void *)v6 + 2);
          *(_OWORD *)std::string __dst = v7;
        }

        if (v64 >= 0) {
          uint64_t v8 = __dst;
        }
        else {
          uint64_t v8 = (void **)__dst[0];
        }
        unint64_t v9 = CFStringCreateWithCString(0LL, (const char *)v8, 0x8000100u);
        if (CFStringCompare(@" ", v9, 0LL))
        {
          ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(kCFAllocatorDefault, v9, @" ");
          if (!v9) {
            goto LABEL_16;
          }
LABEL_15:
          CFRelease(v9);
          goto LABEL_16;
        }

        ArrayBySeparatingStrings = 0LL;
        if (v9) {
          goto LABEL_15;
        }
LABEL_16:
        if (ArrayBySeparatingStrings && CFArrayGetCount(ArrayBySeparatingStrings) >= 2)
        {
          CFIndex v11 = 0LL;
          uint64_t v12 = *(void *)(v4 + 8 * v5);
          __int128 v58 = *(_OWORD *)(v12 + 40);
          __int128 v59 = *(_OWORD *)(v12 + 24);
          char v13 = *(_BYTE *)(v12 + 57);
          char v14 = *(_BYTE *)(v12 + 56);
          while (CFArrayGetCount(ArrayBySeparatingStrings) > v11)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, v11);
            sub_100097D98(ValueAtIndex, 0, __p);
            if (v11)
            {
              if (v11 == CFArrayGetCount(ArrayBySeparatingStrings) - 1) {
                char v16 = v14;
              }
              else {
                char v16 = 1;
              }
              char v17 = 1;
            }

            else
            {
              char v16 = 1;
              char v17 = v13;
            }

            char v18 = (char *)operator new(0x40uLL);
            if (SHIBYTE(v62) < 0)
            {
              sub_10005AA70(&v71, __p[0], (unint64_t)__p[1]);
            }

            else
            {
              __int128 v71 = *(_OWORD *)__p;
              float v72 = v62;
            }

            if (SHIBYTE(v72) < 0)
            {
              sub_10005AA70(v18, (void *)v71, *((unint64_t *)&v71 + 1));
              int v19 = SHIBYTE(v72);
              *(_OWORD *)(v18 + ++*(_DWORD *)(result + 24) = v59;
              *(_OWORD *)(v18 + 40) = v58;
              v18[56] = v16;
              v18[57] = v17;
              float v60 = v18;
              if (v19 < 0) {
                operator delete((void *)v71);
              }
            }

            else
            {
              *(_OWORD *)char v18 = v71;
              *((void *)v18 + 2) = v72;
              *(_OWORD *)(v18 + ++*(_DWORD *)(result + 24) = v59;
              *(_OWORD *)(v18 + 40) = v58;
              v18[56] = v16;
              v18[57] = v17;
              float v60 = v18;
            }

            BOOL v20 = v66;
            if ((unint64_t)v66 >= v67)
            {
              uint64_t v23 = v66 - v65;
              unint64_t v24 = (uint64_t)(v67 - (void)v65) >> 2;
              if (v24 <= v23 + 1) {
                unint64_t v24 = v23 + 1;
              }
              else {
                unint64_t v25 = v24;
              }
              float v74 = &v67;
              if (v25) {
                unsigned int v26 = (char *)sub_100018788((uint64_t)&v67, v25);
              }
              else {
                unsigned int v26 = 0LL;
              }
              uint64_t v27 = &v26[8 * v23];
              *(void *)&__int128 v71 = v26;
              *((void *)&v71 + 1) = v27;
              uint64_t v73 = &v26[8 * v25];
              uint64_t v28 = v60;
              float v60 = 0LL;
              *(void *)uint64_t v27 = v28;
              float v72 = v27 + 8;
              sub_100018700((uint64_t *)&v65, &v71);
              uint64_t v22 = v66;
              sub_1000188CC((uint64_t)&v71);
            }

            else
            {
              __int128 v21 = v60;
              float v60 = 0LL;
              *int v66 = v21;
              uint64_t v22 = v20 + 1;
            }

            int v66 = v22;
            uint64_t v29 = (void **)v60;
            float v60 = 0LL;
            if (v29) {
              sub_1000186C8((int)&v60, v29);
            }
            if (SHIBYTE(v62) < 0) {
              operator delete(__p[0]);
            }
            ++v11;
          }
        }

        else
        {
          uint64_t v30 = *(__int128 **)(v4 + 8 * v5);
          if (*((char *)v30 + 23) < 0)
          {
            sub_10005AA70(&v71, *(void **)v30, *((void *)v30 + 1));
          }

          else
          {
            __int128 v31 = *v30;
            float v72 = (void *)*((void *)v30 + 2);
            __int128 v71 = v31;
          }

          uint64_t v32 = *(void *)(v4 + 8 * v5);
          uint64_t v33 = *(void *)(v32 + 24);
          uint64_t v34 = *(void *)(v32 + 32);
          uint64_t v35 = *(void *)(v32 + 40);
          uint64_t v36 = *(void *)(v32 + 48);
          char v37 = *(_BYTE *)(v32 + 56);
          char v38 = *(_BYTE *)(v32 + 57);
          float v39 = operator new(0x40uLL);
          float v40 = v39;
          __int128 v41 = v71;
          LODWORD(v--*(_DWORD *)(a9 + 60) = (_DWORD)v72;
          *(_DWORD *)((char *)&v60 + 3) = *(_DWORD *)((char *)&v72 + 3);
          int v42 = SHIBYTE(v72);
          __int128 v71 = 0uLL;
          float v72 = 0LL;
          if (v42 < 0)
          {
            sub_10005AA70(v39, (void *)v41, *((unint64_t *)&v41 + 1));
          }

          else
          {
            *(_OWORD *)float v39 = v41;
            v39[4] = (_DWORD)v60;
            *(_DWORD *)((char *)v39 + 19) = *(_DWORD *)((char *)&v60 + 3);
            *((_BYTE *)v39 + 23) = v42;
          }

          v40[3] = v33;
          v40[4] = v34;
          v40[5] = v35;
          void v40[6] = v36;
          *((_BYTE *)v40 + 56) = v37;
          *((_BYTE *)v40 + 57) = v38;
          __p[0] = v40;
          if (v42 < 0) {
            operator delete((void *)v41);
          }
          if (SHIBYTE(v72) < 0) {
            operator delete((void *)v71);
          }
          float v43 = v66;
          if ((unint64_t)v66 >= v67)
          {
            uint64_t v46 = v66 - v65;
            unint64_t v47 = (uint64_t)(v67 - (void)v65) >> 2;
            if (v47 <= v46 + 1) {
              unint64_t v47 = v46 + 1;
            }
            else {
              unint64_t v48 = v47;
            }
            float v74 = &v67;
            if (v48) {
              float v49 = (char *)sub_100018788((uint64_t)&v67, v48);
            }
            else {
              float v49 = 0LL;
            }
            char v50 = &v49[8 * v46];
            *(void *)&__int128 v71 = v49;
            *((void *)&v71 + 1) = v50;
            uint64_t v73 = &v49[8 * v48];
            float v51 = __p[0];
            __p[0] = 0LL;
            *(void *)char v50 = v51;
            float v72 = v50 + 8;
            sub_100018700((uint64_t *)&v65, &v71);
            float v45 = v66;
            sub_1000188CC((uint64_t)&v71);
          }

          else
          {
            float v44 = __p[0];
            __p[0] = 0LL;
            *int v66 = v44;
            float v45 = v43 + 1;
          }

          int v66 = v45;
          float v52 = (void **)__p[0];
          __p[0] = 0LL;
          if (v52) {
            sub_1000186C8((int)__p, v52);
          }
        }

        if (ArrayBySeparatingStrings) {
          CFRelease(ArrayBySeparatingStrings);
        }
        if (SHIBYTE(v64) < 0) {
          operator delete(__dst[0]);
        }
        ++v5;
        uint64_t v4 = *v57;
      }

      while (v5 < (uint64_t)(v57[1] - *v57) >> 3);
      BOOL v3 = v57;
      if (v65 != v66) {
        sub_100012888(&v68, (uint64_t)&v65);
      }
LABEL_81:
      *(void *)&__int128 v71 = &v65;
      sub_100018568((void ***)&v71);
      v3 += 3;
    }

    while (v3 != v56);
    if (v68 != v69) {
      sub_1000129C4(a2, (uint64_t)&v68);
    }
LABEL_84:
    *(void *)&__int128 v71 = &v68;
    sub_100018E1C((void ***)&v71);
    uint64_t v2 = v55 + 24;
  }

  while (v55 + 24 != v54);
}

void sub_10009A788( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, void *a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, void *__p, uint64_t a29, int a30, __int16 a31, char a32, char a33, uint64_t a34, uint64_t *a35, uint64_t a36, uint64_t a37, uint64_t a38)
{
  a35 = &a38;
  sub_100018E1C((void ***)&a35);
  a38 = a10;
  sub_100018608((void ***)&a38);
  _Unwind_Resume(a1);
}

void sub_10009A8CC( uint64_t a1, int a2, int a3, int a4, const char *a5, int a6, uint64_t **a7, CFLocaleRef *a8)
{
  std::string::size_type size = v17.__r_.__value_.__s.__size_;
  unsigned __int8 v15 = v17.__r_.__value_.__s.__size_;
  if ((v17.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type size = v17.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    std::to_string(&v16, a4);
    sub_10005D67C(a1, a2, a3, (uint64_t)&v16, (uint64_t)&v17, (double)a6);
    sub_10009B5D8(a7, (const void **)&v17.__r_.__value_.__l.__data_, (uint64_t)&v17);
    unsigned __int8 v15 = v17.__r_.__value_.__s.__size_;
  }

  if ((v15 & 0x80) != 0) {
    operator delete(v17.__r_.__value_.__l.__data_);
  }
  if (v19 < 0) {
    operator delete(__p[0]);
  }
}

void sub_10009AA14( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10009AA70(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    if (*(char *)(a1 + 23) < 0)
    {
      sub_10005AA70(__p, *(void **)a1, *(void *)(a1 + 8));
    }

    else
    {
      *(_OWORD *)std::string __p = *(_OWORD *)a1;
      uint64_t v13 = *(void *)(a1 + 16);
    }

    if (SHIBYTE(v13) < 0)
    {
      uint64_t v4 = (char *)__p[1];
      if (__p[1])
      {
        unint64_t v5 = (void **)__p[0];
        goto LABEL_13;
      }

void sub_10009ABE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10009AC00( uint64_t *a1@<X0>, CFLocaleRef *a2@<X1>, uint64_t **a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, void *a6@<X8>)
{
  if (v113 == v114)
  {
    *a6 = 0LL;
  }

  else
  {
    uint64_t v82 = a6;
    uint64_t v110 = 0LL;
    uint64_t v111 = 0LL;
    unint64_t v112 = 0LL;
    __int128 v7 = operator new(0x28uLL);
    sub_10005D1F4(v7, 1LL);
    sub_10005D498((uint64_t)v7, 0);
    uint64_t v9 = v113;
    uint64_t v8 = v114;
    if (v114 == v113)
    {
      int v12 = 0;
    }

    else
    {
      unint64_t v10 = 0LL;
      int v11 = 0;
      int v86 = 0;
      uint64_t v98 = (uint64_t)v7;
      do
      {
        int v12 = v11 + 1;
        uint64_t v13 = (uint64_t *)(v9 + 24 * v10);
        uint64_t v14 = v13[1];
        uint64_t v83 = v13 + 1;
        unint64_t v84 = v13;
        uint64_t v15 = *v13;
        ++v11;
        if (v14 != *v13)
        {
          unint64_t v96 = v10;
          unint64_t v16 = 0LL;
          int v11 = v12;
          int v87 = v12;
          do
          {
            std::string v17 = (uint64_t *)(v15 + 24 * v16);
            uint64_t v18 = v17[1];
            int v88 = v17 + 1;
            int v89 = v17;
            uint64_t v100 = *v17;
            uint64_t v19 = v18 - *v17;
            if (v18 != *v17)
            {
              uint64_t v20 = 0LL;
              unint64_t v21 = v16;
              uint64_t v22 = v19 >> 3;
              unint64_t v85 = v21;
              int v90 = v21 - 100;
              do
              {
                uint64_t v99 = v20;
                if (v20)
                {
                  int v109 = v11;
                  if (v22 - 1 == v20)
                  {
                    int v108 = v12;
                    BOOL v91 = 1;
                    int v23 = v11;
                  }

                  else
                  {
                    BOOL v91 = 0;
                    int v23 = v11;
                    int v108 = ++v11;
                  }
                }

                else
                {
                  BOOL v91 = v19 == 8;
                  if (v19 == 8) {
                    int v11 = v12;
                  }
                  else {
                    ++v11;
                  }
                  int v23 = v86;
                  int v108 = v11;
                  int v109 = v86;
                }

                int v105 = 0LL;
                float v106 = 0LL;
                v107 = 0LL;
                unint64_t v24 = v110;
                unint64_t v25 = v111;
                if (v111 == v110) {
                  goto LABEL_82;
                }
                unsigned int v26 = 0LL;
                unint64_t v27 = 0LL;
                do
                {
                  if (HIDWORD(v24[3 * v27]) == v23)
                  {
                    if (v26 >= v107)
                    {
                      uint64_t v29 = v105;
                      uint64_t v30 = ((char *)v26 - (char *)v105) >> 2;
                      unint64_t v31 = v30 + 1;
                      uint64_t v32 = (char *)v107 - (char *)v105;
                      else {
                        unint64_t v33 = v31;
                      }
                      if (v33)
                      {
                        uint64_t v34 = (char *)sub_10002C050((uint64_t)&v107, v33);
                        uint64_t v29 = v105;
                        unsigned int v26 = v106;
                      }

                      else
                      {
                        uint64_t v34 = 0LL;
                      }

                      uint64_t v35 = (void **)&v34[4 * v30];
                      *(_DWORD *)uint64_t v35 = v27;
                      uint64_t v28 = (void **)((char *)v35 + 4);
                      while (v26 != v29)
                      {
                        int v36 = *((_DWORD *)v26 - 1);
                        unsigned int v26 = (void **)((char *)v26 - 4);
                        *((_DWORD *)v35 - 1) = v36;
                        uint64_t v35 = (void **)((char *)v35 - 4);
                      }

                      int v105 = v35;
                      float v106 = v28;
                      v107 = (void **)&v34[4 * v33];
                      if (v29) {
                        operator delete(v29);
                      }
                    }

                    else
                    {
                      *(_DWORD *)unsigned int v26 = v27;
                      uint64_t v28 = (void **)((char *)v26 + 4);
                    }

                    float v106 = v28;
                    unsigned int v26 = v28;
                    unint64_t v24 = v110;
                    unint64_t v25 = v111;
                  }

                  ++v27;
                }

                while (0xAAAAAAAAAAAAAAABLL * (v25 - v24) > v27);
                char v37 = v105;
                if (v105 == v26)
                {
LABEL_82:
                  char v71 = !v91;
                  if (-1 - 0x5555555555555555LL * ((v114 - v113) >> 3) != v96) {
                    char v71 = 1;
                  }
                  if ((v71 & 1) != 0)
                  {
                    float v78 = *(void **)(v100 + 8 * v99);
                    __p[0] = v78;
                    char v102 = 0;
                    LODWORD(v101) = v90;
                    if ((unint64_t)v25 >= v112)
                    {
                      uint64_t v79 = (void **)sub_10009B790((uint64_t *)&v110, &v109, &v108, (uint64_t *)__p, &v102, (int *)&v101);
                    }

                    else
                    {
                      sub_10009B8C4((uint64_t)v25, v109, v108, (uint64_t)v78, 0, v90);
                      uint64_t v79 = v25 + 3;
                    }

                    uint64_t v111 = v79;
                  }

                  else
                  {
                    __p[0] = *(void **)(v100 + 8 * v99);
                    uint64_t v72 = *(void *)(a4 + 24);
                    if (!v72) {
                      sub_100007B40();
                    }
                    int v73 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v72 + 48LL))(v72, __p);
                    int v75 = v108;
                    int v74 = v109;
                    float v76 = *(__int128 **)(v100 + 8 * v99);
                    if (*((char *)v76 + 23) < 0)
                    {
                      sub_10005AA70(__p, *(void **)v76, *((void *)v76 + 1));
                    }

                    else
                    {
                      __int128 v77 = *v76;
                      uint64_t v104 = *((void *)v76 + 2);
                      *(_OWORD *)std::string __p = v77;
                    }

                    sub_10009A8CC(v98, v74, v75, v73, (const char *)__p, v90, a3, a2);
                    if (SHIBYTE(v104) < 0) {
                      operator delete(__p[0]);
                    }
                    __int128 v7 = (void *)v98;
                  }
                }

                else
                {
                  int v97 = 1;
                  do
                  {
                    int v38 = *(_DWORD *)v37;
                    float v39 = v110;
                    float v40 = &v110[3 * *(int *)v37];
                    __int128 v41 = (uint64_t *)(v40 + 2);
                    if ((sub_10009AA70((uint64_t)v40[2], *(void *)(v100 + 8 * v99), a5) & 1) != 0)
                    {
                      sub_10009979C(*v41, *(void *)(v100 + 8 * v99), &v101);
                      char v42 = !v91;
                      if (-1 - 0x5555555555555555LL * ((v114 - v113) >> 3) != v96) {
                        char v42 = 1;
                      }
                      if ((v42 & 1) == 0)
                      {
                        __p[0] = v101;
                        uint64_t v43 = *(void *)(a4 + 24);
                        if (!v43) {
                          sub_100007B40();
                        }
                        int v44 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v43 + 48LL))(v43, __p);
                        int v45 = *(_DWORD *)v40;
                        int v46 = v108;
                        if (*((char *)v101 + 23) < 0)
                        {
                          sub_10005AA70(__p, *(void **)v101, *((void *)v101 + 1));
                        }

                        else
                        {
                          __int128 v47 = *(_OWORD *)v101;
                          uint64_t v104 = *((void *)v101 + 2);
                          *(_OWORD *)std::string __p = v47;
                        }

                        sub_10009A8CC(v98, v45, v46, v44, (const char *)__p, HIDWORD(v39[3 * v38 + 1]), a3, a2);
                        if (SHIBYTE(v104) < 0) {
                          operator delete(__p[0]);
                        }
                        __int128 v7 = (void *)v98;
                      }

                      __p[0] = v101;
                      char v102 = 0;
                      uint64_t v57 = (int *)&v39[3 * v38 + 1] + 1;
                      __int128 v58 = v111;
                      if ((unint64_t)v111 >= v112)
                      {
                        __int128 v59 = (void **)sub_10009BB7C( (uint64_t *)&v110,  (int *)&v39[3 * v38],  &v108,  (uint64_t *)__p,  &v102,  v57);
                      }

                      else
                      {
                        sub_10009B8C4((uint64_t)v111, *(_DWORD *)v40, v108, (uint64_t)v101, 0, *v57);
                        __int128 v59 = v58 + 3;
                      }

                      uint64_t v111 = v59;
                      float v60 = (void **)v101;
                      char v101 = 0LL;
                      if (v60) {
                        sub_1000186C8((int)&v101, v60);
                      }
                    }

                    else
                    {
                      unint64_t v48 = &v39[3 * v38];
                      int v50 = *((unsigned __int8 *)v48 + 8);
                      float v49 = v48 + 1;
                      if (!v50)
                      {
                        __p[0] = (void *)*v41;
                        uint64_t v51 = *(void *)(a4 + 24);
                        if (!v51) {
                          sub_100007B40();
                        }
                        int v52 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v51 + 48LL))(v51, __p);
                        int v53 = *(_DWORD *)v40;
                        int v54 = HIDWORD(v39[3 * v38]);
                        uint64_t v55 = *v41;
                        if (*(char *)(*v41 + 23) < 0)
                        {
                          sub_10005AA70(__p, *(void **)v55, *(void *)(v55 + 8));
                        }

                        else
                        {
                          __int128 v56 = *(_OWORD *)v55;
                          uint64_t v104 = *(void *)(v55 + 16);
                          *(_OWORD *)std::string __p = v56;
                        }

                        sub_10009A8CC(v98, v53, v54, v52, (const char *)__p, HIDWORD(v39[3 * v38 + 1]), a3, a2);
                        if (SHIBYTE(v104) < 0) {
                          operator delete(__p[0]);
                        }
                        _BYTE *v49 = 1;
                        __int128 v7 = (void *)v98;
                      }

                      char v61 = !v91;
                      if (-1 - 0x5555555555555555LL * ((v114 - v113) >> 3) != v96) {
                        char v61 = 1;
                      }
                      if ((v61 & 1) == 0 && ((v97 ^ 1) & 1) == 0)
                      {
                        __p[0] = *(void **)(v100 + 8 * v99);
                        uint64_t v62 = *(void *)(a4 + 24);
                        if (!v62) {
                          sub_100007B40();
                        }
                        int v63 = (*(uint64_t (**)(uint64_t, void **))(*(void *)v62 + 48LL))(v62, __p);
                        int v65 = v108;
                        int v64 = v109;
                        int v66 = *(__int128 **)(v100 + 8 * v99);
                        if (*((char *)v66 + 23) < 0)
                        {
                          sub_10005AA70(__p, *(void **)v66, *((void *)v66 + 1));
                        }

                        else
                        {
                          __int128 v67 = *v66;
                          uint64_t v104 = *((void *)v66 + 2);
                          *(_OWORD *)std::string __p = v67;
                        }

                        sub_10009A8CC(v98, v64, v65, v63, (const char *)__p, v90, a3, a2);
                        if (SHIBYTE(v104) < 0) {
                          operator delete(__p[0]);
                        }
                        __int128 v7 = (void *)v98;
                      }

                      if ((v97 & 1) != 0)
                      {
                        uint64_t v68 = *(void **)(v100 + 8 * v99);
                        __p[0] = v68;
                        char v102 = 0;
                        LODWORD(v101) = v90;
                        uint64_t v69 = v111;
                        if ((unint64_t)v111 >= v112)
                        {
                          uint64_t v70 = (void **)sub_10009B790( (uint64_t *)&v110,  &v109,  &v108,  (uint64_t *)__p,  &v102,  (int *)&v101);
                        }

                        else
                        {
                          sub_10009B8C4((uint64_t)v111, v109, v108, (uint64_t)v68, 0, v90);
                          uint64_t v70 = v69 + 3;
                        }

                        int v97 = 0;
                        uint64_t v111 = v70;
                      }

                      else
                      {
                        int v97 = 0;
                      }
                    }

                    char v37 = (void **)((char *)v37 + 4);
                  }

                  while (v37 != v26);
                }

                int v12 = v87;
                if (v105)
                {
                  float v106 = v105;
                  operator delete(v105);
                }

                uint64_t v20 = v99 + 1;
                uint64_t v100 = *v89;
                uint64_t v19 = *v88 - *v89;
                uint64_t v22 = v19 >> 3;
              }

              while (v19 >> 3 > (unint64_t)(v99 + 1));
              uint64_t v14 = *v83;
              unint64_t v16 = v85;
              uint64_t v15 = *v84;
            }

            ++v16;
          }

          while (0xAAAAAAAAAAAAAAABLL * ((v14 - v15) >> 3) > v16);
          uint64_t v9 = v113;
          uint64_t v8 = v114;
          unint64_t v10 = v96;
        }

        ++v10;
        int v86 = v12;
      }

      while (0xAAAAAAAAAAAAAAABLL * ((v8 - v9) >> 3) > v10);
    }

    sub_10005D554((uint64_t)v7, v12, 0.0);
    sub_10005D628((uint64_t)v7);
    uint64_t v80 = v7[1];
    v7[1] = 0LL;
    *uint64_t v82 = v80;
    unint64_t v81 = sub_1000292E0(v7);
    operator delete(v81);
    int v105 = (void **)&v110;
    sub_10009B6F0(&v105);
  }

  uint64_t v110 = (void **)&v113;
  sub_100018608(&v110);
}

void sub_10009B4A4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, void *a31, uint64_t a32, void *__p, uint64_t a34, int a35, __int16 a36, char a37, char a38)
{
  __int128 v41 = sub_1000292E0(v38);
  operator delete(v41);
  *(void *)(v39 - 16sub_100017FC4(v21 + 8) = v39 - 136;
  sub_10009B6F0((void ***)(v39 - 168));
  *(void *)(v39 - 136) = v39 - 112;
  sub_100018608((void ***)(v39 - 136));
  _Unwind_Resume(a1);
}

uint64_t *sub_10009B5D8(uint64_t **a1, const void **a2, uint64_t a3)
{
  unint64_t v5 = (uint64_t **)sub_100099510((uint64_t)a1, &v8, a2);
  uint64_t result = *v5;
  if (!*v5)
  {
    sub_10009B654((uint64_t)a1, a3, (uint64_t)&v7);
    sub_100019D14(a1, v8, v5, v7);
    return v7;
  }

  return result;
}

void *sub_10009B654@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  __int128 v6 = (char *)operator new(0x38uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + sub_100017FC4(v21 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  if (*(char *)(a2 + 23) < 0)
  {
    uint64_t result = sub_10005AA70(result, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)uint64_t result = *(_OWORD *)a2;
    result[2] = *(void *)(a2 + 16);
  }

  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_10009B6D4(_Unwind_Exception *a1)
{
  void *v1 = 0LL;
  sub_10001AF64(v3, v2);
  _Unwind_Resume(a1);
}

void sub_10009B6F0(void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    sub_10009B730((uint64_t)v2, (void ***)*v2);
    operator delete(**a1);
  }

void sub_10009B730(uint64_t a1, void ***a2)
{
  uint64_t v4 = *(void ****)(a1 + 8);
  if (v4 != a2)
  {
    uint64_t v5 = v4 - 1;
    do
    {
      __int128 v6 = *v5;
      _BYTE *v5 = 0LL;
      if (v6) {
        sub_1000186C8((int)v5, v6);
      }
      __int128 v7 = v5 - 2;
      v5 -= 3;
    }

    while (v7 != a2);
  }

  *(void *)(a1 + sub_100017FC4(v21 + 8) = a2;
}

uint64_t sub_10009B790(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100018774();
  }
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
  if (2 * v16 > v9) {
    unint64_t v9 = 2 * v16;
  }
  if (v16 >= 0x555555555555555LL) {
    unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v17 = v9;
  }
  unint64_t v25 = a1 + 2;
  if (v17) {
    uint64_t v18 = (char *)sub_100018F00(v15, v17);
  }
  else {
    uint64_t v18 = 0LL;
  }
  unint64_t v21 = v18;
  uint64_t v22 = &v18[24 * v8];
  uint64_t v23 = (uint64_t)v22;
  unint64_t v24 = &v18[24 * v17];
  sub_10009B8C4((uint64_t)v22, *a2, *a3, *a4, *a5, *a6);
  uint64_t v23 = (uint64_t)(v22 + 24);
  sub_10009B960(a1, &v21);
  uint64_t v19 = a1[1];
  sub_10009BAF8((uint64_t)&v21);
  return v19;
}

void sub_10009B8B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10009B8C4(uint64_t a1, int a2, int a3, uint64_t a4, char a5, int a6)
{
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_BYTE *)(a1 + sub_100017FC4(v21 + 8) = a5;
  *(_DWORD *)(a1 + 12) = a6;
  unint64_t v8 = operator new(0x40uLL);
  unint64_t v9 = v8;
  if (*(char *)(a4 + 23) < 0)
  {
    sub_10005AA70(v8, *(void **)a4, *(void *)(a4 + 8));
  }

  else
  {
    *(_OWORD *)unint64_t v8 = *(_OWORD *)a4;
    v8[2] = *(void *)(a4 + 16);
  }

  *(_OWORD *)(v9 + 3) = *(_OWORD *)(a4 + 24);
  *(_OWORD *)(v9 + 5) = *(_OWORD *)(a4 + 40);
  *((_WORD *)v9 + 2sub_100017FC4(v21 + 8) = *(_WORD *)(a4 + 56);
  *(void *)(a1 + 16) = v9;
  return a1;
}

void sub_10009B94C(_Unwind_Exception *a1)
{
}

uint64_t sub_10009B960(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10009B9D4((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_10009B9D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v14 = a6;
  *((void *)&v14 + 1) = a7;
  __int128 v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    uint64_t v9 = a6;
  }

  else
  {
    do
    {
      *(_OWORD *)(v7 - ++*(_DWORD *)(result + 24) = *(_OWORD *)(a3 - 24);
      uint64_t v8 = *(void *)(a3 - 8);
      *(void *)(a3 - sub_100017FC4(v21 + 8) = 0LL;
      *(void *)(v7 - sub_100017FC4(v21 + 8) = v8;
      uint64_t v7 = *((void *)&v14 + 1) - 24LL;
      *((void *)&v14 + 1) -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    uint64_t v9 = v14;
  }

  char v12 = 1;
  sub_10009BA70((uint64_t)v11);
  return v9;
}

uint64_t sub_10009BA70(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10009BAA4(a1);
  }
  return a1;
}

void sub_10009BAA4(uint64_t a1)
{
  uint64_t v1 = *(void ****)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void ****)(*(void *)(a1 + 8) + 8LL);
  if (v1 != v2)
  {
    uint64_t v3 = v1 + 2;
    do
    {
      uint64_t v4 = *v3;
      *uint64_t v3 = 0LL;
      if (v4) {
        sub_1000186C8((int)v3, v4);
      }
      uint64_t v5 = v3 + 1;
      v3 += 3;
    }

    while (v5 != v2);
  }

uint64_t sub_10009BAF8(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

uint64_t sub_10009BB2C(uint64_t a1, uint64_t a2)
{
  for (uint64_t result = *(void *)(a1 + 16); result != a2; uint64_t result = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = result - 24;
    uint64_t v7 = *(void ***)(result - 8);
    uint64_t v5 = (void *)(result - 8);
    uint64_t v6 = v7;
    void *v5 = 0LL;
    if (v7) {
      sub_1000186C8((int)v5, v6);
    }
  }

  return result;
}

uint64_t sub_10009BB7C(uint64_t *a1, int *a2, int *a3, uint64_t *a4, char *a5, int *a6)
{
  uint64_t v7 = *a1;
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v9 = v8 + 1;
  if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100018774();
  }
  uint64_t v15 = (uint64_t)(a1 + 2);
  unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v7) >> 3);
  if (2 * v16 > v9) {
    unint64_t v9 = 2 * v16;
  }
  if (v16 >= 0x555555555555555LL) {
    unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v17 = v9;
  }
  unint64_t v25 = a1 + 2;
  if (v17) {
    uint64_t v18 = (char *)sub_100018F00(v15, v17);
  }
  else {
    uint64_t v18 = 0LL;
  }
  unint64_t v21 = v18;
  uint64_t v22 = &v18[24 * v8];
  uint64_t v23 = (uint64_t)v22;
  unint64_t v24 = &v18[24 * v17];
  sub_10009B8C4((uint64_t)v22, *a2, *a3, *a4, *a5, *a6);
  uint64_t v23 = (uint64_t)(v22 + 24);
  sub_10009B960(a1, &v21);
  uint64_t v19 = a1[1];
  sub_10009BAF8((uint64_t)&v21);
  return v19;
}

void sub_10009BC9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_10009BCB0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6 = operator new(0x18uLL);
  uint64_t v7 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112LL))(a1);
  std::operator+<char>(&v45, "merge_", v7);
  unint64_t v8 = std::string::append(&v45, "_");
  __int128 v9 = *(_OWORD *)&v8->__r_.__value_.__l.__data_;
  v46.__r_.__value_.__l.__cap_ = v8->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v9;
  v8->__r_.__value_.__l.__size_ = 0LL;
  v8->__r_.__value_.__l.__cap_ = 0LL;
  v8->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v10 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 112LL))(a2);
  int v11 = *(char *)(v10 + 23);
  if (v11 >= 0) {
    char v12 = (const std::string::value_type *)v10;
  }
  else {
    char v12 = *(const std::string::value_type **)v10;
  }
  if (v11 >= 0) {
    std::string::size_type v13 = *(unsigned __int8 *)(v10 + 23);
  }
  else {
    std::string::size_type v13 = *(void *)(v10 + 8);
  }
  __int128 v14 = std::string::append(&v46, v12, v13);
  __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
  cap = (void *)v14->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v15;
  v14->__r_.__value_.__l.__size_ = 0LL;
  v14->__r_.__value_.__l.__cap_ = 0LL;
  v14->__r_.__value_.__r.__words[0] = 0LL;
  *uint64_t v6 = off_1000D4218;
  sub_1000615EC((__int128 *)__p, v6 + 1);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  unint64_t v16 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  uint64_t v17 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64LL))(a1, 0LL);
  if (!v16)
  {
    char v19 = 0;
    if (!a3) {
      goto LABEL_31;
    }
    goto LABEL_30;
  }

  uint64_t v18 = v17;
  int v44 = a3;
  char v19 = 0;
  uint64_t v20 = 0LL;
  BOOL v21 = 1;
  do
  {
    (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72LL))(__p, a1, v18);
    (*(void (**)(void *, void **, uint64_t))(*v6 + 24LL))(v6, __p, v18);
    if (SHIBYTE(cap) < 0)
    {
      operator delete(__p[0]);
      if (!v21)
      {
LABEL_22:
        BOOL v21 = 0;
        goto LABEL_23;
      }
    }

    else if (!v21)
    {
      goto LABEL_22;
    }

    (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72LL))(__p, a1, v18);
    uint64_t v22 = (*(uint64_t (**)(uint64_t, void **))(*(void *)a2 + 80LL))(a2, __p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    BOOL v21 = v22 != -1;
    if (!((v22 == -1) | v19 & 1)) {
      char v19 = v22 != v18;
    }
LABEL_23:
    if (++v20 < v16) {
      uint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, v20);
    }
  }

  while (v16 != v20);
  if (v21)
  {
    a3 = v44;
    if (!v44)
    {
LABEL_31:
      uint64_t v23 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 16LL))(a2);
      goto LABEL_32;
    }

void sub_10009C228( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  std::string __p = &a16;
  sub_10001FAA8(&__p);
  (*(void (**)(uint64_t))(*(void *)v28 + 8LL))(v28);
  _Unwind_Resume(a1);
}

void *sub_10009C340(uint64_t a1)
{
  v24[0] = 0LL;
  v24[1] = 0LL;
  uint64_t v23 = v24;
  unint64_t v2 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
  uint64_t v3 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64LL))(a1, 0LL);
  if (v2)
  {
    uint64_t v4 = v3;
    uint64_t v5 = 0LL;
    do
    {
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72LL))(__p, a1, v4);
      uint64_t v20 = v4;
      unint64_t v25 = &v20;
      uint64_t v6 = sub_10009CC38((uint64_t **)&v23, &v20, (uint64_t)&unk_1000B0E01, &v25);
      uint64_t v7 = v6 + 5;
      *(_OWORD *)uint64_t v7 = *(_OWORD *)__p;
      v7[2] = v22;
      if (++v5 < v2) {
        uint64_t v4 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, v5);
      }
    }

    while (v2 != v5);
  }

  unint64_t v8 = operator new(0x18uLL);
  uint64_t v9 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 112LL))(a1);
  uint64_t v10 = (char *)v9;
  else {
    size_t v11 = *(void *)(v9 + 8);
  }
  char v12 = __p;
  sub_100037608((uint64_t)__p, v11 + 8);
  if (v22 < 0) {
    char v12 = (void **)__p[0];
  }
  if (v11)
  {
    if (v10[23] >= 0) {
      std::string::size_type v13 = v10;
    }
    else {
      std::string::size_type v13 = *(char **)v10;
    }
    memmove(v12, v13, v11);
  }

  strcpy((char *)v12 + v11, "_compact");
  *unint64_t v8 = off_1000D4218;
  sub_1000615EC((__int128 *)__p, v8 + 1);
  if (SHIBYTE(v22) < 0) {
    operator delete(__p[0]);
  }
  __int128 v14 = (uint64_t *)v23;
  if (v23 != v24)
  {
    uint64_t v15 = 0LL;
    do
    {
      (*(void (**)(void *, uint64_t *, uint64_t))(*v8 + 24LL))(v8, v14 + 5, v15);
      unint64_t v16 = (char *)v14[1];
      if (v16)
      {
        do
        {
          uint64_t v17 = (char **)v16;
          unint64_t v16 = *(char **)v16;
        }

        while (v16);
      }

      else
      {
        do
        {
          uint64_t v17 = (char **)v14[2];
          BOOL v18 = *v17 == (char *)v14;
          __int128 v14 = (uint64_t *)v17;
        }

        while (!v18);
      }

      ++v15;
      __int128 v14 = (uint64_t *)v17;
    }

    while (v17 != v24);
  }

  sub_10009CBE8((uint64_t)&v23, v24[0]);
  return v8;
}

void sub_10009C588( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, char a17, char *a18)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  operator delete(v18);
  sub_10009CBE8((uint64_t)&a17, a18);
  _Unwind_Resume(a1);
}

void *sub_10009C5EC(std::string *a1, int a2)
{
  if ((v36[(unint64_t)*(v35[0] - 3) + 16] & 5) != 0)
  {
    sub_10000A2DC(&__p, "ERROR");
    sub_10002A9EC((BOOL *)v24, (uint64_t)&__p);
    uint64_t v4 = sub_10002A6A4(&std::cerr, (uint64_t)"FstReadSymbols: Can't open file ", 32LL);
    int size = (char)a1->__r_.__value_.__s.__size_;
    if (size >= 0) {
      uint64_t v6 = (uint64_t)a1;
    }
    else {
      uint64_t v6 = a1->__r_.__value_.__r.__words[0];
    }
    if (size >= 0) {
      uint64_t v7 = a1->__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v7 = a1->__r_.__value_.__l.__size_;
    }
    sub_10002A6A4(v4, v6, v7);
    sub_10002AA94(v24);
    if (SHIBYTE(v28) < 0) {
      operator delete(__p);
    }
    unint64_t v8 = 0LL;
    goto LABEL_41;
  }

  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v28 = 0u;
  *(_OWORD *)char v29 = 0u;
  uint64_t v33 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v32 = -1LL;
  if ((sub_1000A3AC8((uint64_t)&__p, v35, (uint64_t)a1, 0) & 1) == 0)
  {
    sub_10000A2DC(v24, "ERROR");
    sub_10002A9EC(&v26, (uint64_t)v24);
    uint64_t v17 = sub_10002A6A4(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read header from ", 42LL);
    int v18 = (char)a1->__r_.__value_.__s.__size_;
    if (v18 >= 0) {
      uint64_t v19 = (uint64_t)a1;
    }
    else {
      uint64_t v19 = a1->__r_.__value_.__r.__words[0];
    }
    if (v18 >= 0) {
      uint64_t v20 = a1->__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v20 = a1->__r_.__value_.__l.__size_;
    }
    goto LABEL_33;
  }

  char v9 = BYTE4(v31);
  if ((BYTE4(v31) & 1) != 0)
  {
    uint64_t v10 = sub_10005A9EC(v35, a1);
    unint64_t v8 = v10;
    if (!v10)
    {
      sub_10000A2DC(v24, "ERROR");
      sub_10002A9EC(&v26, (uint64_t)v24);
      uint64_t v17 = sub_10002A6A4(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read input symbols from ", 49LL);
      int v22 = (char)a1->__r_.__value_.__s.__size_;
      if (v22 >= 0) {
        uint64_t v19 = (uint64_t)a1;
      }
      else {
        uint64_t v19 = a1->__r_.__value_.__r.__words[0];
      }
      if (v22 >= 0) {
        uint64_t v20 = a1->__r_.__value_.__s.__size_;
      }
      else {
        uint64_t v20 = a1->__r_.__value_.__l.__size_;
      }
      goto LABEL_33;
    }

    if ((a2 & 1) != 0) {
      goto LABEL_37;
    }
    (*(void (**)(void *))(*v10 + 8LL))(v10);
    char v9 = BYTE4(v31);
  }

  if ((v9 & 2) == 0)
  {
LABEL_20:
    sub_10000A2DC(v24, "ERROR");
    sub_10002A9EC(&v26, (uint64_t)v24);
    char v12 = sub_10002A6A4(&std::cerr, (uint64_t)"FstReadSymbols: The file ", 25LL);
    int v13 = (char)a1->__r_.__value_.__s.__size_;
    if (v13 >= 0) {
      uint64_t v14 = (uint64_t)a1;
    }
    else {
      uint64_t v14 = a1->__r_.__value_.__r.__words[0];
    }
    if (v13 >= 0) {
      uint64_t v15 = a1->__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v15 = a1->__r_.__value_.__l.__size_;
    }
    unint64_t v16 = sub_10002A6A4(v12, v14, v15);
    sub_10002A6A4(v16, (uint64_t)" doesn't contain the requested symbols", 38LL);
    goto LABEL_34;
  }

  size_t v11 = sub_10005A9EC(v35, a1);
  unint64_t v8 = v11;
  if (!v11)
  {
    sub_10000A2DC(v24, "ERROR");
    sub_10002A9EC(&v26, (uint64_t)v24);
    uint64_t v17 = sub_10002A6A4(&std::cerr, (uint64_t)"FstReadSymbols: Couldn't read output symbols from ", 50LL);
    int v23 = (char)a1->__r_.__value_.__s.__size_;
    if (v23 >= 0) {
      uint64_t v19 = (uint64_t)a1;
    }
    else {
      uint64_t v19 = a1->__r_.__value_.__r.__words[0];
    }
    if (v23 >= 0) {
      uint64_t v20 = a1->__r_.__value_.__s.__size_;
    }
    else {
      uint64_t v20 = a1->__r_.__value_.__l.__size_;
    }
LABEL_33:
    sub_10002A6A4(v17, v19, v20);
LABEL_34:
    sub_10002AA94(&v26);
    if (v25 < 0) {
      operator delete(v24[0]);
    }
    unint64_t v8 = 0LL;
    goto LABEL_37;
  }

  if (a2)
  {
    (*(void (**)(void *))(*v11 + 8LL))(v11);
    goto LABEL_20;
  }

void sub_10009C950( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, void *a20, uint64_t a21, int a22, __int16 a23, char a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  sub_10002C8BC((uint64_t)&a20);
  sub_10005A3D8(&a35);
  _Unwind_Resume(a1);
}

BOOL sub_10009C9FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 < 1)
  {
    return 1;
  }

  else
  {
    BOOL v8 = 0;
    uint64_t v9 = 0LL;
    while (1)
    {
      std::to_string(&v17, v9);
      int v10 = *(char *)(a1 + 23);
      if (v10 >= 0) {
        size_t v11 = (const std::string::value_type *)a1;
      }
      else {
        size_t v11 = *(const std::string::value_type **)a1;
      }
      if (v10 >= 0) {
        std::string::size_type v12 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        std::string::size_type v12 = *(void *)(a1 + 8);
      }
      int v13 = std::string::insert(&v17, 0LL, v11, v12);
      __int128 v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
      std::string::size_type cap = v13->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v14;
      v13->__r_.__value_.__l.__size_ = 0LL;
      v13->__r_.__value_.__l.__cap_ = 0LL;
      v13->__r_.__value_.__r.__words[0] = 0LL;
      uint64_t v15 = (*(uint64_t (**)(uint64_t, void **, uint64_t))(*(void *)a4 + 24LL))(a4, __p, a2 + v9);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (a2 + v9 != v15) {
        break;
      }
      BOOL v8 = ++v9 >= a3;
      if (a3 == v9) {
        return v8;
      }
    }

    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC((BOOL *)&v17, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"AddAuxiliarySymbols: Symbol table clash", 39LL);
    sub_10002AA94(&v17);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
  }

  return v8;
}

void sub_10009CB84( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10009CBE8(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10009CBE8(a1, *(void *)a2);
    sub_10009CBE8(a1, *((void *)a2 + 1));
    if (a2[63] < 0) {
      operator delete(*((void **)a2 + 5));
    }
    operator delete(a2);
  }

uint64_t *sub_10009CC38(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  uint64_t v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        uint64_t v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        uint64_t v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    size_t v11 = (uint64_t *)operator new(0x40uLL);
    uint64_t v12 = **a4;
    void v11[6] = 0LL;
    v11[7] = 0LL;
    v11[4] = v12;
    v11[5] = 0LL;
    sub_100019D14(a1, (uint64_t)v9, v7, v11);
    return v11;
  }

  return (uint64_t *)v9;
}

uint64_t sub_10009CCF8(uint64_t a1, char a2)
{
  *(_BYTE *)a1 = a2;
  sub_10000A2DC((void *)(a1 + 8), off_1000DDA98[0]);
  return a1;
}

void *sub_10009CD28(void *a1)
{
  *a1 = -1LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  a1[3] = 0LL;
  sub_1000A011C(a1 + 5, 0x10uLL);
  uint64_t v3 = (void *)a1[5];
  unint64_t v2 = (void *)a1[6];
  for (a1[8] = v2 - v3 - 1; v3 != v2; ++v3)
    *uint64_t v3 = *a1;
  return a1;
}

void sub_10009CD9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10009CDB8(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = -1LL;
  *(void *)(a1 + sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + ++*(_DWORD *)(result + 24) = 0LL;
  sub_1000A0190( (char *)(a1 + 8),  *(__int128 **)(a2 + 8),  *(__int128 **)(a2 + 16),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a2 + 16) - *(void *)(a2 + 8)) >> 3));
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4sub_100017FC4(v21 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  sub_1000A00A4( (void *)(a1 + 40),  *(const void **)(a2 + 40),  *(void *)(a2 + 48),  (uint64_t)(*(void *)(a2 + 48) - *(void *)(a2 + 40)) >> 3);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  return a1;
}

void sub_10009CE48(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

unint64_t sub_10009CE64(uint64_t *a1, __int128 *a2)
{
  uint64_t v4 = a1 + 1;
  uint64_t v5 = a1[6] - a1[5];
  unint64_t v6 = sub_10009D140((uint64_t)(a1 + 4), (uint64_t)a2);
  uint64_t v7 = a1[8];
  uint64_t v8 = a1[5];
  uint64_t v9 = v6 & v7;
  unint64_t v10 = *(void *)(v8 + 8 * (v6 & v7));
  uint64_t v12 = *a1;
  uint64_t v11 = a1[1];
  int v23 = a2;
  if (v10 != *a1)
  {
    char v16 = *((_BYTE *)a2 + 23);
    if (v16 >= 0) {
      uint64_t v17 = *((unsigned __int8 *)a2 + 23);
    }
    else {
      uint64_t v17 = *((void *)a2 + 1);
    }
    if (v16 < 0) {
      a2 = *(__int128 **)a2;
    }
    do
    {
      int v18 = (unsigned __int8 *)(v11 + 24 * v10);
      uint64_t v19 = v18[23];
      if ((v19 & 0x80u) == 0LL) {
        uint64_t v20 = v18[23];
      }
      else {
        uint64_t v20 = *((void *)v18 + 1);
      }
      if (v20 == v17)
      {
        if ((v19 & 0x80) != 0)
        {
        }

        else
        {
          if (!v18[23]) {
            return v10;
          }
          for (std::string::size_type i = a2; *v18 == *(unsigned __int8 *)i; std::string::size_type i = (__int128 *)((char *)i + 1))
          {
            ++v18;
            if (!--v19) {
              return v10;
            }
          }
        }
      }

      uint64_t v9 = (v9 + 1) & v7;
      unint64_t v10 = *(void *)(v8 + 8 * v9);
    }

    while (v10 != v12);
  }

  unint64_t v14 = a1[2];
  unint64_t v13 = a1[3];
  unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v14 - v11) >> 3);
  *(void *)(v8 + 8 * v9) = v10;
  if (v14 >= v13)
  {
    uint64_t v15 = sub_1000A07B4(v4, v23);
  }

  else
  {
    sub_100020FEC(v4, v23);
    uint64_t v15 = v14 + 24;
  }

  a1[2] = v15;
  return v10;
}

void sub_10009D010(void *a1, unint64_t a2)
{
  uint64_t v4 = (void *)a1[5];
  uint64_t v3 = (void *)a1[6];
  for (a1[8] = v3 - v4 - 1; v4 != v3; ++v4)
    *uint64_t v4 = *a1;
  uint64_t v5 = a1[1];
  if (a1[2] != v5)
  {
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = (__int128 *)(v5 + 24 * v6);
      if (*((char *)v7 + 23) < 0)
      {
        sub_10005AA70(__p, *(void **)v7, *((void *)v7 + 1));
      }

      else
      {
        __int128 v8 = *v7;
        uint64_t v14 = *((void *)v7 + 2);
        *(_OWORD *)std::string __p = v8;
      }

      unint64_t v9 = sub_10009D140((uint64_t)(a1 + 4), (uint64_t)__p);
      uint64_t v10 = a1[8];
      if (SHIBYTE(v14) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v11 = v10 & v9;
      uint64_t v12 = a1[5];
      if (*(void *)(v12 + 8 * (v10 & v9)) != *a1)
      {
        do
          uint64_t v11 = a1[8] & (v11 + 1);
        while (*(void *)(v12 + 8 * v11) != *a1);
      }

      *(void *)(v12 + 8 * v11) = v6++;
      uint64_t v5 = a1[1];
    }

    while (v6 < 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v5) >> 3));
  }

unint64_t sub_10009D140(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    unint64_t v3 = *(unsigned __int8 *)(a2 + 23);
  }

  else
  {
    a2 = *(void *)a2;
    unint64_t v3 = v2;
  }

  return sub_1000A0348((uint64_t)&v5, (uint64_t *)a2, v3);
}

uint64_t sub_10009D17C(uint64_t *a1, uint64_t a2)
{
  unint64_t v2 = (_BYTE *)a2;
  unint64_t v4 = sub_10009D140((uint64_t)(a1 + 4), a2);
  uint64_t v5 = a1[8];
  uint64_t v6 = a1[5];
  uint64_t v7 = *a1;
  uint64_t v8 = v4 & v5;
  uint64_t v9 = *(void *)(v6 + 8 * (v4 & v5));
  if (v9 != *a1)
  {
    uint64_t v11 = a1[1];
    char v12 = v2[23];
    if (v12 >= 0) {
      uint64_t v13 = v2[23];
    }
    else {
      uint64_t v13 = *((void *)v2 + 1);
    }
    if (v12 < 0) {
      unint64_t v2 = *(_BYTE **)v2;
    }
    do
    {
      uint64_t v14 = (unsigned __int8 *)(v11 + 24 * v9);
      uint64_t v15 = v14[23];
      if ((v15 & 0x80u) == 0LL) {
        uint64_t v16 = v14[23];
      }
      else {
        uint64_t v16 = *((void *)v14 + 1);
      }
      if (v16 == v13)
      {
        if ((v15 & 0x80) != 0)
        {
        }

        else
        {
          if (!v14[23]) {
            return v9;
          }
          for (std::string::size_type i = v2; *v14 == *i; ++i)
          {
            ++v14;
            if (!--v15) {
              return v9;
            }
          }
        }
      }

      uint64_t v8 = (v8 + 1) & v5;
      uint64_t v9 = *(void *)(v6 + 8 * v8);
    }

    while (v9 != v7);
  }

  return v7;
}

void sub_10009D280(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + sub_100017FC4(v21 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_1000A08D4((char **)a1, a2 - v2);
  }

void sub_10009D2B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v3;
  uint64_t v5 = *(void *)(a1 + 16);
  if (v5 != v3)
  {
    do
    {
      v5 -= 24LL;
    }

    while (v5 != v4);
  }

  *(void *)(a1 + 16) = v4;
  sub_10009D010((void *)a1, (uint64_t)(*(void *)(a1 + 48) - *(void *)(a1 + 40)) >> 3);
}

char *sub_10009D338(void *a1, uint64_t a2, uint64_t a3)
{
  std::string v45 = (char *)operator new(0x118uLL);
  sub_1000616C8(v45, (__int128 *)a2);
  for (uint64_t i = 1LL; ; ++i)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
    uint64_t v7 = std::locale::use_facet(&v52, &std::ctype<char>::id);
    uint64_t v8 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v7->__vftable[2].~facet_0)(v7, 10LL);
    std::locale::~locale(&v52);
    uint64_t v9 = (void *)std::istream::getline(a1, __s, 8096LL, v8);
    if ((*((_BYTE *)v9 + *(void *)(*v9 - 24LL) + 32) & 5) != 0) {
      break;
    }
    v52.__locale_ = 0LL;
    locale = 0LL;
    uint64_t v54 = 0LL;
    else {
      size_t v10 = *(void *)(a3 + 16);
    }
    sub_100037608((uint64_t)v50, v10 + 1);
    if (v51 >= 0) {
      uint64_t v11 = v50;
    }
    else {
      uint64_t v11 = (void **)v50[0];
    }
    if (v10)
    {
      else {
        char v12 = *(const void **)(a3 + 8);
      }
      memmove(v11, v12, v10);
    }

    *(_WORD *)((char *)v11 + v10) = 10;
    if (v51 >= 0) {
      uint64_t v13 = (char *)v50;
    }
    else {
      uint64_t v13 = (char *)v50[0];
    }
    sub_1000A321C(__s, v13, (void **)&v52.__locale_, 1);
    if (v52.__locale_ == locale)
    {
      int v18 = 2;
      goto LABEL_46;
    }

    if ((std::locale::__imp *)(locale - v52.__locale_) == (std::locale::__imp *)16)
    {
      uint64_t v15 = *(char **)v52.__locale_;
      uint64_t v14 = (const char *)*((void *)v52.__locale_ + 1);
      uint64_t v16 = strtoll(v14, &__endptr, 10);
      if (__endptr >= &v14[strlen(v14)])
      {
        BOOL v17 = v16 < 0 && *(_BYTE *)a3 == 0;
        if (!v17 && v16 != -1)
        {
          sub_10000A2DC(__p, v15);
          sub_10009D814((uint64_t)v45, (uint64_t)__p, v16);
          if (v49 < 0) {
            operator delete(__p[0]);
          }
          int v18 = 0;
          goto LABEL_46;
        }
      }

      sub_10000A2DC(__p, "ERROR");
      sub_10002A9EC(&v46, (uint64_t)__p);
      uint64_t v33 = sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::ReadText: Bad non-negative integer ", 49LL);
      size_t v34 = strlen(v14);
      unint64_t v35 = sub_10002A6A4(v33, (uint64_t)v14, v34);
      unint64_t v36 = sub_10002A6A4(v35, (uint64_t)", ", 3LL);
      uint64_t v37 = sub_10002A6A4(v36, (uint64_t)"file = ", 7LL);
      int v38 = *(char *)(a2 + 23);
      if (v38 >= 0) {
        uint64_t v39 = a2;
      }
      else {
        uint64_t v39 = *(void *)a2;
      }
      if (v38 >= 0) {
        uint64_t v40 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v40 = *(void *)(a2 + 8);
      }
      std::string::size_type v41 = sub_10002A6A4(v37, v39, v40);
      char v42 = sub_10002A6A4(v41, (uint64_t)", line = ", 9LL);
      std::ostream::operator<<(v42, i);
      p_endptr = (char **)&v46;
    }

    else
    {
      sub_10000A2DC(__p, "ERROR");
      sub_10002A9EC((BOOL *)&__endptr, (uint64_t)__p);
      uint64_t v19 = sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::ReadText: Bad number of columns (", 46LL);
      uint64_t v20 = (void *)std::ostream::operator<<(v19, (locale - v52.__locale_) >> 3);
      BOOL v21 = sub_10002A6A4(v20, (uint64_t)"), ", 3LL);
      int v22 = sub_10002A6A4(v21, (uint64_t)"file = ", 7LL);
      int v23 = *(char *)(a2 + 23);
      if (v23 >= 0) {
        uint64_t v24 = a2;
      }
      else {
        uint64_t v24 = *(void *)a2;
      }
      if (v23 >= 0) {
        uint64_t v25 = *(unsigned __int8 *)(a2 + 23);
      }
      else {
        uint64_t v25 = *(void *)(a2 + 8);
      }
      BOOL v26 = sub_10002A6A4(v22, v24, v25);
      uint64_t v27 = sub_10002A6A4(v26, (uint64_t)", line = ", 9LL);
      __int128 v28 = (void *)std::ostream::operator<<(v27, i);
      char v29 = sub_10002A6A4(v28, (uint64_t)":<", 2LL);
      size_t v30 = strlen(__s);
      __int128 v31 = sub_10002A6A4(v29, (uint64_t)__s, v30);
      sub_10002A6A4(v31, (uint64_t)">", 1LL);
      p_endptr = &__endptr;
    }

    sub_10002AA94(p_endptr);
    if (v49 < 0) {
      operator delete(__p[0]);
    }
    int v18 = 1;
LABEL_46:
    if (v51 < 0) {
      operator delete(v50[0]);
    }
    if (v52.__locale_)
    {
      locale = v52.__locale_;
      operator delete(v52.__locale_);
    }

    if ((v18 | 2) != 2)
    {
      std::string::size_type v43 = (void *)sub_10005AC80((uint64_t)v45);
      operator delete(v43);
      return 0LL;
    }
  }

  return v45;
}

void sub_10009D768( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, std::locale a29, uint64_t a30)
{
}

uint64_t sub_10009D814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v35 = a3;
  if (a3 == -1) {
    return -1LL;
  }
  unint64_t v6 = sub_10009CE64((uint64_t *)(a1 + 40), (__int128 *)a2);
  if ((v7 & 1) != 0)
  {
    if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3) - 1 == a3
      && *(void *)(a1 + 32) == a3)
    {
      *(void *)(a1 + 32) = a3 + 1;
      uint64_t v9 = a3;
    }

    else
    {
      unint64_t v10 = *(void *)(a1 + 128);
      uint64_t v11 = *(uint64_t **)(a1 + 120);
      if ((unint64_t)v11 >= v10)
      {
        int v22 = *(uint64_t **)(a1 + 112);
        uint64_t v23 = v11 - v22;
        unint64_t v24 = v10 - (void)v22;
        unint64_t v25 = (uint64_t)(v10 - (void)v22) >> 2;
        if (v25 <= v23 + 1) {
          unint64_t v25 = v23 + 1;
        }
        if (v24 >= 0x7FFFFFFFFFFFFFF8LL) {
          unint64_t v26 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v26 = v25;
        }
        if (v26)
        {
          uint64_t v27 = (char *)sub_100018788(a1 + 128, v26);
          int v22 = *(uint64_t **)(a1 + 112);
          uint64_t v11 = *(uint64_t **)(a1 + 120);
        }

        else
        {
          uint64_t v27 = 0LL;
        }

        __int128 v28 = (uint64_t *)&v27[8 * v23];
        char v29 = &v27[8 * v26];
        uint64_t *v28 = a3;
        char v12 = v28 + 1;
        while (v11 != v22)
        {
          uint64_t v30 = *--v11;
          *--__int128 v28 = v30;
        }

        *(void *)(a1 + 112) = v28;
        *(void *)(a1 + 120) = v12;
        *(void *)(a1 + 12sub_100017FC4(v21 + 8) = v29;
        if (v22) {
          operator delete(v22);
        }
      }

      else
      {
        *uint64_t v11 = a3;
        char v12 = v11 + 1;
      }

      *(void *)(a1 + 120) = v12;
      uint64_t v31 = -1 - 0x5555555555555555LL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
      __p[0] = &v35;
      sub_1000A0A4C((uint64_t **)(a1 + 136), &v35, (uint64_t)&unk_1000B0E16, (uint64_t **)__p)[5] = v31;
      uint64_t v9 = v35;
    }

    if (v9 >= *(void *)(a1 + 24)) {
      *(void *)(a1 + ++*(_DWORD *)(result + 24) = v9 + 1;
    }
    *(_BYTE *)(a1 + 1--*(_DWORD *)(a9 + 60) = 0;
  }

  else
  {
    uint64_t v8 = sub_10009E244((void *)a1, v6);
    if (v8 == a3)
    {
      return a3;
    }

    else
    {
      uint64_t v9 = v8;
      if (dword_1000DE7E8 >= 1)
      {
        sub_10000A2DC(__p, "INFO");
        sub_10002A9EC(&v36, (uint64_t)__p);
        uint64_t v13 = sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::AddSymbol: symbol = ", 33LL);
        int v14 = *(char *)(a2 + 23);
        if (v14 >= 0) {
          uint64_t v15 = a2;
        }
        else {
          uint64_t v15 = *(void *)a2;
        }
        if (v14 >= 0) {
          uint64_t v16 = *(unsigned __int8 *)(a2 + 23);
        }
        else {
          uint64_t v16 = *(void *)(a2 + 8);
        }
        BOOL v17 = sub_10002A6A4(v13, v15, v16);
        int v18 = sub_10002A6A4(v17, (uint64_t)" already in symbol_map_ with key = ", 35LL);
        uint64_t v19 = (void *)std::ostream::operator<<(v18, v9);
        uint64_t v20 = sub_10002A6A4(v19, (uint64_t)" but supplied new key = ", 24LL);
        BOOL v21 = (void *)std::ostream::operator<<(v20, a3);
        sub_10002A6A4(v21, (uint64_t)" (ignoring new key)", 19LL);
        sub_10002AA94(&v36);
        if (v34 < 0) {
          operator delete(__p[0]);
        }
      }
    }
  }

  return v9;
}

void sub_10009DAA4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10009DAD0(uint64_t a1)
{
  unint64_t v2 = (std::mutex *)(a1 + 216);
  std::mutex::lock((std::mutex *)(a1 + 216));
  int v3 = *(unsigned __int8 *)(a1 + 160);
  std::mutex::unlock(v2);
  if (!v3)
  {
    std::mutex::lock(v2);
    if (!*(_BYTE *)(a1 + 160))
    {
      __int128 v59 = v2;
      sub_10009FABC((uint64_t)&v70);
      uint64_t v5 = *(void *)(a1 + 48);
      uint64_t v4 = *(void *)(a1 + 56);
      if (v4 != v5)
      {
        unint64_t v6 = 0LL;
        do
        {
          char v7 = (char *)(v5 + 24 * v6);
          if (v7[23] < 0)
          {
            uint64_t v8 = *((unsigned int *)v7 + 2);
            char v7 = *(char **)v7;
          }

          else
          {
            uint64_t v8 = v7[23];
          }

          if ((int)v8 >= 1)
          {
            do
            {
              char v10 = *v7++;
              char v9 = v10;
              int v11 = v70++;
              BOOL v12 = -v11 < 0;
              int v13 = -v11 & 0x1F;
              int v14 = v11 & 0x1F;
              if (!v12) {
                int v14 = -v13;
              }
              if (v72 >= 0) {
                uint64_t v15 = &v71;
              }
              else {
                uint64_t v15 = (__int128 *)v71;
              }
              *((_BYTE *)v15 + v14) ^= v9;
              --v8;
            }

            while (v8);
            uint64_t v5 = *(void *)(a1 + 48);
            uint64_t v4 = *(void *)(a1 + 56);
          }

          ++v70;
          ++v6;
        }

        while (v6 < 0xAAAAAAAAAAAAAAABLL * ((v4 - v5) >> 3));
      }

      if (SHIBYTE(v72) < 0)
      {
        sub_10005AA70(&__dst, (void *)v71, *((unint64_t *)&v71 + 1));
      }

      else
      {
        __int128 __dst = v71;
        uint64_t v63 = v72;
      }

      uint64_t v16 = (void **)(a1 + 168);
      *(_OWORD *)uint64_t v16 = __dst;
      *(void *)(a1 + 184) = v63;
      sub_10009FABC((uint64_t)&v67);
      if (*(uint64_t *)(a1 + 32) >= 1)
      {
        uint64_t v17 = 0LL;
        do
        {
          sub_10009E0D4((uint64_t)&__dst);
          uint64_t v20 = *(void *)(a1 + 48) + 24 * v17;
          int v21 = *(char *)(v20 + 23);
          if (v21 >= 0) {
            uint64_t v22 = *(void *)(a1 + 48) + 24 * v17;
          }
          else {
            uint64_t v22 = *(void *)v20;
          }
          if (v21 >= 0) {
            uint64_t v23 = *(unsigned __int8 *)(v20 + 23);
          }
          else {
            uint64_t v23 = *(void *)(v20 + 8);
          }
          unint64_t v24 = sub_10002A6A4(&__dst, v22, v23);
          v61.__r_.__value_.__s.__data_[0] = 9;
          unint64_t v25 = sub_10002A6A4(v24, (uint64_t)&v61, 1LL);
          std::ostream::operator<<(v25, v17);
          std::stringbuf::str(&v61, (const std::stringbuf *)((char *)&__dst + 8));
          if ((v61.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            unint64_t v26 = &v61;
          }
          else {
            unint64_t v26 = (std::stringbuf::string_type *)v61.__r_.__value_.__r.__words[0];
          }
          std::stringbuf::str(&v60, (const std::stringbuf *)((char *)&__dst + 8));
          int size = v60.__r_.__value_.__s.__size_;
          unsigned __int8 v28 = v60.__r_.__value_.__s.__size_;
          if ((v60.__r_.__value_.__s.__size_ & 0x80u) != 0) {
            int size = v60.__r_.__value_.__r.__words[1];
          }
          if (size >= 1)
          {
            uint64_t v29 = size;
            do
            {
              std::string::value_type v31 = v26->__r_.__value_.__s.__data_[0];
              unint64_t v26 = (std::stringbuf::string_type *)((char *)v26 + 1);
              std::string::value_type v30 = v31;
              int v32 = v67++;
              BOOL v12 = -v32 < 0;
              int v33 = -v32 & 0x1F;
              int v34 = v32 & 0x1F;
              if (!v12) {
                int v34 = -v33;
              }
              if (v69 >= 0) {
                uint64_t v35 = &v68;
              }
              else {
                uint64_t v35 = (__int128 *)v68;
              }
              *((_BYTE *)v35 + v34) ^= v30;
              --v29;
            }

            while (v29);
            unsigned __int8 v28 = v60.__r_.__value_.__s.__size_;
          }

          if ((v28 & 0x80) != 0) {
            operator delete(v60.__r_.__value_.__l.__data_);
          }
          *(void *)&__int128 __dst = v18;
          *(void *)((char *)&__dst + *(void *)(v18 - 24)) = v19;
          if (v65 < 0) {
            operator delete(__p);
          }
          std::streambuf::~streambuf((char *)&__dst + 8);
          std::ios::~ios(v66);
          ++v17;
        }

        while (v17 < *(void *)(a1 + 32));
      }

      BOOL v36 = *(void **)(a1 + 136);
      if (v36 != (void *)(a1 + 144))
      {
        do
        {
          if (v36[4] >= *(void *)(a1 + 32))
          {
            sub_10009E0D4((uint64_t)&__dst);
            uint64_t v39 = *(void *)(a1 + 48) + 24LL * v36[5];
            int v40 = *(char *)(v39 + 23);
            if (v40 >= 0) {
              uint64_t v41 = *(void *)(a1 + 48) + 24LL * v36[5];
            }
            else {
              uint64_t v41 = *(void *)v39;
            }
            if (v40 >= 0) {
              uint64_t v42 = *(unsigned __int8 *)(v39 + 23);
            }
            else {
              uint64_t v42 = *(void *)(v39 + 8);
            }
            std::string::size_type v43 = sub_10002A6A4(&__dst, v41, v42);
            v61.__r_.__value_.__s.__data_[0] = 9;
            int v44 = sub_10002A6A4(v43, (uint64_t)&v61, 1LL);
            std::ostream::operator<<(v44, v36[4]);
            std::stringbuf::str(&v61, (const std::stringbuf *)((char *)&__dst + 8));
            if ((v61.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              std::string v45 = &v61;
            }
            else {
              std::string v45 = (std::stringbuf::string_type *)v61.__r_.__value_.__r.__words[0];
            }
            std::stringbuf::str(&v60, (const std::stringbuf *)((char *)&__dst + 8));
            int v46 = v60.__r_.__value_.__s.__size_;
            unsigned __int8 v47 = v60.__r_.__value_.__s.__size_;
            if ((v60.__r_.__value_.__s.__size_ & 0x80u) != 0) {
              int v46 = v60.__r_.__value_.__r.__words[1];
            }
            if (v46 >= 1)
            {
              uint64_t v48 = v46;
              do
              {
                std::string::value_type v50 = v45->__r_.__value_.__s.__data_[0];
                std::string v45 = (std::stringbuf::string_type *)((char *)v45 + 1);
                std::string::value_type v49 = v50;
                int v51 = v67++;
                BOOL v12 = -v51 < 0;
                int v52 = -v51 & 0x1F;
                int v53 = v51 & 0x1F;
                if (!v12) {
                  int v53 = -v52;
                }
                if (v69 >= 0) {
                  uint64_t v54 = &v68;
                }
                else {
                  uint64_t v54 = (__int128 *)v68;
                }
                *((_BYTE *)v54 + v53) ^= v49;
                --v48;
              }

              while (v48);
              unsigned __int8 v47 = v60.__r_.__value_.__s.__size_;
            }

            if ((v47 & 0x80) != 0) {
              operator delete(v60.__r_.__value_.__l.__data_);
            }
            *(void *)&__int128 __dst = v37;
            *(void *)((char *)&__dst + *(void *)(v37 - 24)) = v38;
            if (v65 < 0) {
              operator delete(__p);
            }
            std::streambuf::~streambuf((char *)&__dst + 8);
            std::ios::~ios(v66);
          }

          uint64_t v55 = (void *)v36[1];
          if (v55)
          {
            do
            {
              __int128 v56 = v55;
              uint64_t v55 = (void *)*v55;
            }

            while (v55);
          }

          else
          {
            do
            {
              __int128 v56 = (void *)v36[2];
              BOOL v57 = *v56 == (void)v36;
              BOOL v36 = v56;
            }

            while (!v57);
          }

          BOOL v36 = v56;
        }

        while (v56 != (void *)(a1 + 144));
      }

      if (SHIBYTE(v69) < 0)
      {
        unint64_t v2 = v59;
        sub_10005AA70(&__dst, (void *)v68, *((unint64_t *)&v68 + 1));
      }

      else
      {
        __int128 __dst = v68;
        uint64_t v63 = v69;
        unint64_t v2 = v59;
      }

      __int128 v58 = (void **)(a1 + 192);
      *(_OWORD *)__int128 v58 = __dst;
      *(void *)(a1 + 20sub_100017FC4(v21 + 8) = v63;
      *(_BYTE *)(a1 + 1--*(_DWORD *)(a9 + 60) = 1;
      if (SHIBYTE(v69) < 0) {
        operator delete((void *)v68);
      }
      if (SHIBYTE(v72) < 0) {
        operator delete((void *)v71);
      }
    }

    std::mutex::unlock(v2);
  }

void sub_10009E04C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::mutex *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19, char a20)
{
}

uint64_t sub_10009E0D4(uint64_t a1)
{
  uint64_t v2 = a1 + 8;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  uint64_t v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 8));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8sub_100017FC4(v21 + 8) = 0u;
  *(_DWORD *)(a1 + 104) = 16;
  return a1;
}

void sub_10009E198(_Unwind_Exception *a1)
{
}

uint64_t sub_10009E1C0(uint64_t a1)
{
  uint64_t v3 = a1 + 8;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 112);
  return a1;
}

uint64_t sub_10009E244(void *a1, unint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) != 0) {
    return -1LL;
  }
  uint64_t v3 = a1[6];
  if (0xAAAAAAAAAAAAAAABLL * ((a1[7] - v3) >> 3) <= a2) {
    return -1LL;
  }
  if (a1[4] <= (int64_t)a2)
  {
    uint64_t v4 = sub_10009D17C(a1 + 5, v3 + 24 * a2);
    a2 = v4;
    if (v4 != -1)
    {
      uint64_t v5 = a1[4];
      BOOL v6 = __OFSUB__(v4, v5);
      uint64_t v7 = v4 - v5;
      if (v7 < 0 == v6) {
        return *(void *)(a1[14] + 8 * v7);
      }
    }
  }

  return a2;
}

void sub_10009E2D4(uint64_t a1, uint64_t a2)
{
  if ((a2 & 0x8000000000000000LL) == 0)
  {
    uint64_t v4 = a2;
    if (*(void *)(a1 + 32) > a2) {
      goto LABEL_14;
    }
  }

  uint64_t v5 = (uint64_t *)(a1 + 144);
  BOOL v6 = *(void **)(a1 + 144);
  if (v6)
  {
    uint64_t v7 = (uint64_t **)(a1 + 136);
    uint64_t v8 = (uint64_t *)(a1 + 144);
    do
    {
      uint64_t v9 = v6[4];
      BOOL v10 = v9 < a2;
      if (v9 >= a2) {
        int v11 = v6;
      }
      else {
        int v11 = v6 + 1;
      }
      if (!v10) {
        uint64_t v8 = v6;
      }
      BOOL v6 = (void *)*v11;
    }

    while (*v11);
    if (v8 != v5 && v8[4] <= a2)
    {
      uint64_t v4 = v8[5];
      sub_10002F254(v7, v8);
      operator delete(v8);
      if ((v4 & 0x8000000000000000LL) == 0)
      {
LABEL_14:
        if (v4 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3))
        {
          sub_10009D2B0(a1 + 40, v4);
          BOOL v12 = *(void **)(a1 + 136);
          if (v12 != (void *)(a1 + 144))
          {
            do
            {
              uint64_t v13 = v12[5];
              if (v13 > v4) {
                v12[5] = v13 - 1;
              }
              int v14 = (void *)v12[1];
              if (v14)
              {
                do
                {
                  uint64_t v15 = v14;
                  int v14 = (void *)*v14;
                }

                while (v14);
              }

              else
              {
                do
                {
                  uint64_t v15 = (void *)v12[2];
                  BOOL v16 = *v15 == (void)v12;
                  BOOL v12 = v15;
                }

                while (!v16);
              }

              BOOL v12 = v15;
            }

            while (v15 != (void *)(a1 + 144));
          }

          uint64_t v17 = *(void *)(a1 + 32);
          if (a2 < 0 || v17 <= a2)
          {
            uint64_t v27 = *(void *)(a1 + 112);
            uint64_t v26 = *(void *)(a1 + 120);
            uint64_t v28 = (v26 - v27) >> 3;
            if (v4 - v17 < (unint64_t)(v28 - 1))
            {
              uint64_t v29 = ~v4 + v17 + v28;
              std::string::value_type v30 = (void *)(v27 - 8 * v17 + 8 * v4 + 8);
              do
              {
                *(v30 - 1) = *v30;
                ++v30;
                --v29;
              }

              while (v29);
            }

            *(void *)(a1 + 120) = v26 - 8;
          }

          else
          {
            uint64_t v31 = a2 + 1;
            if (a2 + 1 < v17)
            {
              uint64_t v18 = a2;
              do
              {
                int v32 = &v31;
                sub_1000A0A4C((uint64_t **)(a1 + 136), &v31, (uint64_t)&unk_1000B0E16, &v32)[5] = v18;
                uint64_t v18 = v31++;
              }

              while (v31 < *(void *)(a1 + 32));
            }

            uint64_t v19 = (void *)(a1 + 112);
            sub_10009D280( a1 + 112,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3) - a2);
            int64_t v20 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 3);
            int64_t v21 = *(void *)(a1 + 32);
            if (v20 >= v21)
            {
              uint64_t v22 = (void *)*v19;
              uint64_t v23 = *v19 - 8 * a2;
              do
              {
                *(void *)(v23 + 8 * v20 - std::ostream::~ostream(v2, v3 + 8) = v22[v20 - v21];
                int64_t v21 = *(void *)(a1 + 32);
                BOOL v10 = v20-- <= v21;
              }

              while (!v10);
            }

            if (v21 - 1 > a2)
            {
              unint64_t v24 = (void *)*v19;
              uint64_t v25 = a2;
              do
                *v24++ = ++v25;
              while (v25 < *(void *)(a1 + 32) - 1LL);
            }

            *(void *)(a1 + 32) = a2;
          }

          if (*(void *)(a1 + 24) - 1LL == a2) {
            *(void *)(a1 + ++*(_DWORD *)(result + 24) = a2;
          }
        }
      }
    }
  }

char *sub_10009E578(void *a1)
{
  int v16 = 0;
  std::istream::read(a1, &v16, 4LL);
  if ((*((_BYTE *)a1 + *(void *)(*a1 - 24LL) + 32) & 5) != 0)
  {
    sub_10000A2DC(&__p, "ERROR");
    sub_10002A9EC((BOOL *)&v13, (uint64_t)&__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::Read: Read failed", 30LL);
    sub_10002AA94(&v13);
    return 0LL;
  }

  memset(&__p, 0, sizeof(__p));
  LODWORD(v13.__r_.__value_.__l.__data_) = 0;
  std::istream::read(a1, &v13, 4LL);
  if (SLODWORD(v13.__r_.__value_.__l.__data_) >= 1)
  {
    int v3 = 0;
    do
    {
      std::istream::read(a1, __c, 1LL);
      std::string::push_back(&__p, __c[0]);
      ++v3;
    }

    while (v3 < SLODWORD(v13.__r_.__value_.__l.__data_));
  }

  uint64_t v4 = (char *)operator new(0x118uLL);
  sub_1000616C8(v4, (__int128 *)&__p);
  std::istream::read(a1, v4 + 24, 8LL);
  std::istream::read(a1, &v14, 8LL);
  if ((*((_BYTE *)a1 + *(void *)(*a1 - 24LL) + 32) & 5) != 0)
  {
    sub_10000A2DC(&v13, "ERROR");
    sub_10002A9EC((BOOL *)__c, (uint64_t)&v13);
    sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::Read: Read failed", 30LL);
    sub_10002AA94(__c);
    uint64_t v2 = 0LL;
    uint64_t v5 = (uint64_t)v4;
  }

  else
  {
    memset(&v13, 0, sizeof(v13));
    v4[160] = 0;
    if (v14 < 1)
    {
LABEL_22:
      uint64_t v5 = 0LL;
      uint64_t v2 = v4;
    }

    else
    {
      uint64_t v6 = 0LL;
      while (1)
      {
        if ((char)v13.__r_.__value_.__s.__size_ < 0)
        {
          *v13.__r_.__value_.__l.__data_ = 0;
          v13.__r_.__value_.__l.__size_ = 0LL;
        }

        else
        {
          v13.__r_.__value_.__s.__data_[0] = 0;
          v13.__r_.__value_.__s.__size_ = 0;
        }

        *(_DWORD *)__c = 0;
        std::istream::read(a1, __c, 4LL);
        if (*(int *)__c >= 1)
        {
          int v7 = 0;
          do
          {
            std::istream::read(a1, &v17, 1LL);
            std::string::push_back(&v13, v17);
            ++v7;
          }

          while (v7 < *(int *)__c);
        }

        std::istream::read(a1, &v12, 8LL);
        if ((*((_BYTE *)a1 + *(void *)(*a1 - 24LL) + 32) & 5) != 0) {
          break;
        }
        sub_10009D814((uint64_t)v4, (uint64_t)&v13, v12);
        if (++v6 >= v14) {
          goto LABEL_22;
        }
      }

      sub_10000A2DC(__c, "ERROR");
      sub_10002A9EC((BOOL *)&v17, (uint64_t)__c);
      sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::Read: Read failed", 30LL);
      sub_10002AA94(&v17);
      if (v11 < 0) {
        operator delete(*(void **)__c);
      }
      uint64_t v2 = 0LL;
      uint64_t v5 = (uint64_t)v4;
    }

    if (!v5) {
      goto LABEL_30;
    }
  }

  uint64_t v8 = (void *)sub_10005AC80(v5);
  operator delete(v8);
LABEL_30:
  return v2;
}

void sub_10009E898( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  uint64_t v31 = (void *)sub_10005AC80(v28);
  operator delete(v31);
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(a1);
}

BOOL sub_10009E954(uint64_t *a1, void *a2)
{
  LODWORD(__p[0]) = 2125658996;
  std::ostream::write(a2, __p, 4LL);
  LODWORD(v4) = *((unsigned __int8 *)a1 + 23);
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = a1[1];
  }
  LODWORD(__p[0]) = v4;
  std::ostream::write(a2, __p, 4LL);
  else {
    uint64_t v5 = (uint64_t *)*a1;
  }
  std::ostream::write(a2, v5, SLODWORD(__p[0]));
  __p[0] = (void *)a1[3];
  std::ostream::write(a2, __p, 8LL);
  uint64_t v6 = a1[7] - a1[6];
  uint64_t v7 = v6 / 24;
  __p[0] = (void *)(v6 / 24);
  std::ostream::write(a2, __p, 8LL);
  if (v6 >= 1)
  {
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    if (v7 <= 1) {
      uint64_t v7 = 1LL;
    }
    do
    {
      uint64_t v10 = a1[4];
      char v11 = (void *)v9;
      if (v9 >= v10) {
        char v11 = *(void **)(a1[14] - 8 * v10 + 8 * v9);
      }
      uint64_t v12 = (uint64_t *)(a1[6] + v8);
      LODWORD(v13) = *((unsigned __int8 *)v12 + 23);
      if ((v13 & 0x80u) != 0LL) {
        uint64_t v13 = v12[1];
      }
      LODWORD(__p[0]) = v13;
      std::ostream::write(a2, __p, 4LL);
      else {
        uint64_t v14 = (uint64_t *)*v12;
      }
      std::ostream::write(a2, v14, SLODWORD(__p[0]));
      __p[0] = v11;
      std::ostream::write(a2, __p, 8LL);
      ++v9;
      v8 += 24LL;
    }

    while (v7 != v9);
  }

  std::ostream::flush(a2);
  int v15 = *(_DWORD *)((_BYTE *)a2 + *(void *)(*a2 - 24LL) + 32) & 5;
  if (v15)
  {
    sub_10000A2DC(__p, "ERROR");
    sub_10002A9EC(&v19, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::Write: Write failed", 32LL);
    sub_10002AA94(&v19);
    if (v18 < 0) {
      operator delete(__p[0]);
    }
  }

  return v15 == 0;
}

void sub_10009EB5C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_10009EB88(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 120LL))(a2);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void))(*(void *)a2 + 64LL))(a2, 0LL);
  if (v4)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0LL;
    do
    {
      uint64_t v8 = *(void *)(a1 + 8);
      (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(*(void *)a2 + 72LL))(__p, a2, v6);
      sub_10009D814(v8, (uint64_t)__p, *(void *)(v8 + 24));
      if (v10 < 0) {
        operator delete(__p[0]);
      }
      if (++v7 < v4) {
        uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a2 + 64LL))(a2, v7);
      }
    }

    while (v4 != v7);
  }

void sub_10009EC60( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10009EC7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1 || *(void *)(v1 + 8))
  {
    uint64_t v2 = (__int128 **)(a1 + 8);
    int v3 = (char *)operator new(0x118uLL);
    sub_10009FB90(v3, *v2);
    sub_10009FB20(v2, (uint64_t)v3);
  }

void sub_10009ECD0(_Unwind_Exception *a1)
{
}

BOOL sub_10009ECE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int8 *)(a3 + 31);
  if ((v3 & 0x80u) != 0LL) {
    uint64_t v3 = *(void *)(a3 + 16);
  }
  uint64_t v25 = v3;
  if (v3)
  {
    unint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 120LL))(a1);
    uint64_t v7 = (*(uint64_t (**)(uint64_t, void))(*(void *)a1 + 64LL))(a1, 0LL);
    if (v6)
    {
      uint64_t v8 = v7;
      int v9 = 0;
      uint64_t v10 = 0LL;
      do
      {
        sub_10009E0D4((uint64_t)&v30);
        BOOL v13 = v8 >= 0 || *(_BYTE *)a3 != 0;
        if (((v13 | v9) & 1) == 0)
        {
          sub_10000A2DC(&__p, "WARNING");
          sub_10002A9EC((BOOL *)&v28, (uint64_t)&__p);
          sub_10002A6A4(&std::cerr, (uint64_t)"Negative symbol table entry when not allowed", 44LL);
          sub_10002AA94(&v28);
          int v9 = 1;
        }

        (*(void (**)(std::stringbuf::string_type *__return_ptr, uint64_t, uint64_t))(*(void *)a1 + 72LL))( &__p,  a1,  v8);
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          p_p = &__p;
        }
        else {
          p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          uint64_t size = __p.__r_.__value_.__s.__size_;
        }
        else {
          uint64_t size = __p.__r_.__value_.__l.__size_;
        }
        int v16 = sub_10002A6A4(&v30, (uint64_t)p_p, size);
        std::string::value_type v17 = (std::string::value_type *)(a3 + 8);
        v28.__r_.__value_.__s.__data_[0] = *v17;
        char v18 = sub_10002A6A4(v16, (uint64_t)&v28, 1LL);
        BOOL v19 = (void *)std::ostream::operator<<(v18, v8);
        v28.__r_.__value_.__s.__data_[0] = 10;
        sub_10002A6A4(v19, (uint64_t)&v28, 1LL);
        std::stringbuf::str(&__p, &v31);
        int v20 = (char)__p.__r_.__value_.__s.__size_;
        std::string::size_type v21 = __p.__r_.__value_.__r.__words[0];
        std::stringbuf::str(&v28, &v31);
        if (v20 >= 0) {
          uint64_t v22 = &__p;
        }
        else {
          uint64_t v22 = (std::stringbuf::string_type *)v21;
        }
        if ((v28.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type v23 = v28.__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type v23 = v28.__r_.__value_.__l.__size_;
        }
        std::ostream::write(a2, v22, v23);
        std::string::value_type v30 = v11;
        *(void **)((char *)&v30 + *((void *)v11 - 3)) = v26;
        std::streambuf::~streambuf(&v31);
        std::ios::~ios(&v32);
        if (++v10 < v6) {
          uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)a1 + 64LL))(a1, v10);
        }
      }

      while (v6 != v10);
    }
  }

  else
  {
    sub_10000A2DC(&v30, "ERROR");
    sub_10002A9EC((BOOL *)&__p, (uint64_t)&v30);
    sub_10002A6A4(&std::cerr, (uint64_t)"Missing required field separator", 32LL);
    sub_10002AA94(&__p);
    if (SHIBYTE(v31.__loc_.__locale_) < 0) {
      operator delete(v30);
    }
  }

  return v25 != 0;
}

void sub_10009EFFC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, void *__p, uint64_t a28, int a29, __int16 a30, char a31, char a32)
{
  if (a32 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

BOOL sub_10009F090(uint64_t a1, uint64_t a2, int a3)
{
  if (!byte_1000DDA90) {
    return 1LL;
  }
  BOOL result = 1LL;
  if (!a1 || !a2) {
    return result;
  }
  uint64_t v7 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t))(*(void *)a1 + 88LL))(a1);
  uint64_t v8 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 88LL))(a2);
  uint64_t v9 = v7[23];
  if ((v9 & 0x80u) == 0LL) {
    uint64_t v10 = v7[23];
  }
  else {
    uint64_t v10 = *((void *)v7 + 1);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 23);
  int v12 = (char)v11;
  if ((v11 & 0x80u) != 0LL) {
    uint64_t v11 = *(void *)(v8 + 8);
  }
  if (v10 != v11) {
    goto LABEL_20;
  }
  if (v12 >= 0) {
    BOOL v13 = (unsigned __int8 *)v8;
  }
  else {
    BOOL v13 = *(unsigned __int8 **)v8;
  }
  if ((v9 & 0x80) != 0)
  {
    BOOL result = memcmp(*(const void **)v7, v13, *((void *)v7 + 1)) == 0;
    if (result) {
      return result;
    }
    goto LABEL_22;
  }

  if (!v7[23]) {
    return 1LL;
  }
  BOOL result = 1LL;
  while (*v7 == *v13)
  {
    ++v7;
    ++v13;
    if (!--v9) {
      return result;
    }
  }

void sub_10009F248( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10009F274(uint64_t a1, uint64_t a2)
{
  *(std::stringbuf::string_type *)a2 = v5;
  std::streambuf::~streambuf(&v7);
  return std::ios::~ios(&v8);
}

void sub_10009F350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
}

void *sub_10009F368(const std::string *a1)
{
  uint64_t v1 = sub_10005AAFC(v3);
  if (v5 < 0) {
    operator delete((void *)v4[8]);
  }
  std::streambuf::~streambuf(v4);
  std::ios::~ios(&v6);
  return v1;
}

void sub_10009F448( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void *sub_10009F464(void *a1)
{
  *a1 = off_1000D4218;
  sub_100017FC4((uint64_t)(a1 + 1));
  return a1;
}

void sub_10009F494(void *a1)
{
  *a1 = off_1000D4218;
  sub_100017FC4((uint64_t)(a1 + 1));
  operator delete(a1);
}

void *sub_10009F4C4(uint64_t a1)
{
  BOOL result = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  void *result = off_1000D4218;
  result[1] = v4;
  result[2] = v3;
  if (v3)
  {
    char v5 = (unint64_t *)(v3 + 8);
    do
      unint64_t v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }

  return result;
}

uint64_t sub_10009F514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10009D814(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_10009F550(uint64_t a1, uint64_t a2)
{
  return sub_10009D814(*(void *)(a1 + 8), a2, *(void *)(*(void *)(a1 + 8) + 24LL));
}

uint64_t sub_10009F580(uint64_t a1)
{
  return *(void *)(*(void *)(a1 + 8) + 24LL);
}

uint64_t sub_10009F58C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  sub_10009DAD0(v1);
  return v1 + 168;
}

uint64_t sub_10009F5B4(uint64_t a1, unint64_t a2)
{
  return sub_10009E244(*(void **)(a1 + 8), a2);
}

void *sub_10009F5BC@<X0>(uint64_t a1@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  return sub_10009FF9C(*(void **)(a1 + 8), a2, a3);
}

uint64_t sub_10009F5C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t result = sub_10009D17C(v2 + 5, a2);
  if (result != -1)
  {
    uint64_t v4 = v2[4];
    BOOL v5 = __OFSUB__(result, v4);
    uint64_t v6 = result - v4;
    if (v6 < 0 == v5) {
      return *(void *)(v2[14] + 8 * v6);
    }
  }

  return result;
}

uint64_t sub_10009F604(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  sub_10009DAD0(v1);
  return v1 + 192;
}

BOOL sub_10009F62C(uint64_t a1, int64_t a2)
{
  return sub_1000A0054(*(void **)(a1 + 8), a2);
}

BOOL sub_10009F634(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 8);
  uint64_t v3 = sub_10009D17C(v2 + 5, a2);
  if (v3 == -1) {
    return 0LL;
  }
  uint64_t v4 = v2[4];
  BOOL v5 = __OFSUB__(v3, v4);
  uint64_t v6 = v3 - v4;
  return v6 < 0 != v5 || *(void *)(v2[14] + 8 * v6) != -1LL;
}

uint64_t sub_10009F68C(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

unint64_t sub_10009F694(uint64_t a1)
{
  return 0xAAAAAAAAAAAAAAABLL
       * ((uint64_t)(*(void *)(*(void *)(a1 + 8) + 56LL) - *(void *)(*(void *)(a1 + 8) + 48LL)) >> 3);
}

void sub_10009F6B4(uint64_t a1, uint64_t a2)
{
}

std::string *sub_10009F6E0(uint64_t a1, const std::string *a2)
{
  return std::string::operator=(*(std::string **)(a1 + 8), a2);
}

BOOL sub_10009F70C(uint64_t a1, void *a2)
{
  return sub_10009E954(*(uint64_t **)(a1 + 8), a2);
}

uint64_t sub_10009F714(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)&v14[(void)*(v13 - 3) + 24])
  {
    sub_10000A2DC(__p, "ERROR");
    sub_10002A9EC(&v12, (uint64_t)__p);
    uint64_t v4 = sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::Write: Can't open file ", 36LL);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    sub_10002A6A4(v4, v6, v7);
    sub_10002AA94(&v12);
    if (v11 < 0) {
      operator delete(__p[0]);
    }
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, void (__cdecl ***)(std::ofstream *__hidden)))(*(void *)a1 + 144LL))( a1,  &v13);
  }

  std::filebuf::~filebuf(v14);
  std::ios::~ios(&v15);
  return v8;
}

void sub_10009F85C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
}

uint64_t sub_10009F8A4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)&v16[(void)*(v15 - 3) + 24])
  {
    sub_10000A2DC(&__p, "ERROR");
    sub_10002A9EC(&v14, (uint64_t)&__p);
    uint64_t v4 = sub_10002A6A4(&std::cerr, (uint64_t)"SymbolTable::WriteText: Can't open file ", 40LL);
    int v5 = *(char *)(a2 + 23);
    if (v5 >= 0) {
      uint64_t v6 = a2;
    }
    else {
      uint64_t v6 = *(void *)a2;
    }
    if (v5 >= 0) {
      uint64_t v7 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v7 = *(void *)(a2 + 8);
    }
    sub_10002A6A4(v4, v6, v7);
    sub_10002AA94(&v14);
    if (v12 < 0) {
      operator delete(__p);
    }
    uint64_t v8 = 0LL;
  }

  else
  {
    LOBYTE(__p) = 0;
    sub_10000A2DC(&v11, off_1000DDA98[0]);
    uint64_t v8 = (*(uint64_t (**)(uint64_t, void (__cdecl ***)(std::ofstream *__hidden), void **))(*(void *)a1 + 160LL))( a1,  &v15,  &__p);
    if (v13 < 0) {
      operator delete(v11);
    }
  }

  std::filebuf::~filebuf(v16);
  std::ios::~ios(&v17);
  return v8;
}

void sub_10009FA18( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19, int a20, __int16 a21, char a22, char a23, uint64_t a24)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  sub_10002CF2C(&a24);
  _Unwind_Resume(a1);
}

uint64_t sub_10009FA74(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 4std::ostream::~ostream(v2, v3 + 8) = v2;
    operator delete(v2);
  }

  uint64_t v4 = (void **)(a1 + 8);
  sub_10001FAA8(&v4);
  return a1;
}

uint64_t sub_10009FABC(uint64_t a1)
{
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + ++*(_DWORD *)(result + 24) = 0LL;
  std::string::resize((std::string *)(a1 + 8), 0x20uLL, 0);
  return a1;
}

void sub_10009FB04(_Unwind_Exception *exception_object)
{
}

void sub_10009FB20(void *a1, uint64_t a2)
{
  uint64_t v3 = (std::__shared_weak_count *)a1[1];
  __int128 v4 = v7;
  *(void *)&__int128 v7 = *a1;
  *((void *)&v7 + 1) = v3;
  *(_OWORD *)a1 = v4;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      unint64_t v6 = __ldaxr(p_shared_owners);
    while (__stlxr(v6 - 1, p_shared_owners));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

char *sub_10009FB90(char *__dst, __int128 *a2)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__int128 __dst = v4;
  }

  *(_OWORD *)(__dst + ++*(_DWORD *)(result + 24) = *(__int128 *)((char *)a2 + 24);
  sub_10009CDB8((uint64_t)(__dst + 40), (uint64_t)a2 + 40);
  *((void *)__dst + 14) = 0LL;
  *((void *)__dst + 15) = 0LL;
  *((void *)__dst + 16) = 0LL;
  sub_1000A00A4( (void *)__dst + 14,  *((const void **)a2 + 14),  *((void *)a2 + 15),  (uint64_t)(*((void *)a2 + 15) - *((void *)a2 + 14)) >> 3);
  sub_10009FC98((uint64_t *)__dst + 17, (uint64_t)a2 + 136);
  __dst[160] = 0;
  *(_OWORD *)(__dst + 16std::ostream::~ostream(v2, v3 + 8) = 0u;
  *(_OWORD *)(__dst + 184) = 0u;
  *(_OWORD *)(__dst + 200) = 0u;
  *((void *)__dst + 27) = 850045863LL;
  *((_OWORD *)__dst + 14) = 0u;
  *((_OWORD *)__dst + 15) = 0u;
  *((_OWORD *)__dst + 16) = 0u;
  *((void *)__dst + 34) = 0LL;
  return __dst;
}

void sub_10009FC54(_Unwind_Exception *a1)
{
  int v5 = *v3;
  if (*v3)
  {
    *(void *)(v1 + 120) = v5;
    operator delete(v5);
  }

  sub_10009FA74(v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_10009FC98(uint64_t *a1, uint64_t a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = (uint64_t)(a1 + 1);
  sub_10009FCEC(a1, *(void **)a2, (void *)(a2 + 8));
  return a1;
}

void sub_10009FCD4(_Unwind_Exception *a1)
{
}

uint64_t *sub_10009FCEC(uint64_t *result, void *a2, void *a3)
{
  if (a2 != a3)
  {
    __int128 v4 = a2;
    int v5 = (uint64_t **)result;
    unint64_t v6 = result + 1;
    do
    {
      uint64_t result = sub_10009FD70(v5, v6, v4 + 4, (_OWORD *)v4 + 2);
      __int128 v7 = (void *)v4[1];
      if (v7)
      {
        do
        {
          uint64_t v8 = v7;
          __int128 v7 = (void *)*v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          uint64_t v8 = (void *)v4[2];
          BOOL v9 = *v8 == (void)v4;
          __int128 v4 = v8;
        }

        while (!v9);
      }

      __int128 v4 = v8;
    }

    while (v8 != a3);
  }

  return result;
}

uint64_t *sub_10009FD70(uint64_t **a1, void *a2, uint64_t *a3, _OWORD *a4)
{
  unint64_t v6 = (void **)sub_10009FDF4(a1, a2, &v11, &v10, a3);
  __int128 v7 = (uint64_t *)*v6;
  if (!*v6)
  {
    uint64_t v8 = (uint64_t **)v6;
    __int128 v7 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v7 + 2) = *a4;
    sub_100019D14(a1, v11, v8, v7);
  }

  return v7;
}

void *sub_10009FDF4(void *a1, void *a2, void *a3, void *a4, uint64_t *a5)
{
  int v5 = a1 + 1;
  if (a1 + 1 == a2 || (uint64_t v6 = *a5, v7 = a2[4], *a5 < v7))
  {
    uint64_t v8 = *a2;
    if ((void *)*a1 == a2)
    {
      uint64_t v10 = a2;
LABEL_17:
      if (v8)
      {
        *a3 = v10;
        return v10 + 1;
      }

      else
      {
        *a3 = a2;
        return a2;
      }
    }

    if (v8)
    {
      BOOL v9 = (void *)*a2;
      do
      {
        uint64_t v10 = v9;
        BOOL v9 = (void *)v9[1];
      }

      while (v9);
    }

    else
    {
      char v13 = a2;
      do
      {
        uint64_t v10 = (void *)v13[2];
        BOOL v14 = *v10 == (void)v13;
        char v13 = v10;
      }

      while (v14);
    }

    uint64_t v15 = *a5;
    if (v10[4] < *a5) {
      goto LABEL_17;
    }
    uint64_t v16 = (void *)*v5;
    if (*v5)
    {
      do
      {
        while (1)
        {
          uint64_t v17 = v16;
          uint64_t v18 = v16[4];
          if (v15 >= v18) {
            break;
          }
          uint64_t v16 = (void *)*v17;
          int v5 = v17;
          if (!*v17) {
            goto LABEL_29;
          }
        }

        if (v18 >= v15) {
          break;
        }
        int v5 = v17 + 1;
        uint64_t v16 = (void *)v17[1];
      }

      while (v16);
    }

    else
    {
      uint64_t v17 = a1 + 1;
    }

void *sub_10009FF9C@<X0>(void *result@<X0>, int64_t a2@<X1>, void *a3@<X8>)
{
  if (a2 < 0 || result[4] <= a2)
  {
    uint64_t v3 = (void *)result[18];
    if (!v3) {
      return sub_10000A2DC(a3, "");
    }
    __int128 v4 = result + 18;
    do
    {
      int64_t v5 = v3[4];
      BOOL v6 = v5 < a2;
      if (v5 >= a2) {
        uint64_t v7 = v3;
      }
      else {
        uint64_t v7 = v3 + 1;
      }
      if (!v6) {
        __int128 v4 = v3;
      }
      uint64_t v3 = (void *)*v7;
    }

    while (*v7);
    if (v4 == result + 18) {
      return sub_10000A2DC(a3, "");
    }
    if (v4[4] > a2) {
      return sub_10000A2DC(a3, "");
    }
    a2 = v4[5];
    if (a2 < 0) {
      return sub_10000A2DC(a3, "");
    }
  }

  uint64_t v8 = result[6];
  if (a2 >= 0xAAAAAAAAAAAAAAABLL * ((result[7] - v8) >> 3)) {
    return sub_10000A2DC(a3, "");
  }
  BOOL v9 = (__int128 *)(v8 + 24 * a2);
  __int128 v10 = *v9;
  a3[2] = *((void *)v9 + 2);
  *(_OWORD *)a3 = v10;
  return result;
}

BOOL sub_1000A0054(void *a1, int64_t a2)
{
  if ((v5 & 0x80000000) == 0) {
    return v5 != 0;
  }
  BOOL v2 = v4[1] != 0LL;
  operator delete(v4[0]);
  return v2;
}

void *sub_1000A00A4(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    uint64_t result = sub_100076100(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      uint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }

  return result;
}

void sub_1000A0100(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

void *sub_1000A011C(void *a1, unint64_t a2)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  if (a2)
  {
    sub_100076100(a1, a2);
    __int128 v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }

  return a1;
}

void sub_1000A0174(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::ostream::~ostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

char *sub_1000A0190(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  if (a4)
  {
    BOOL v6 = result;
    sub_100019ABC(result, a4);
    uint64_t result = sub_1000A0214((uint64_t)(v6 + 16), a2, a3, *((char **)v6 + 1));
    *((void *)v6 + 1) = result;
  }

  return result;
}

void sub_1000A01F4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  *(void *)(v9 + std::ostream::~ostream(v2, v3 + 8) = v10;
  sub_10001FAA8(&a9);
  _Unwind_Resume(a1);
}

char *sub_1000A0214(uint64_t a1, __int128 *a2, __int128 *a3, char *__dst)
{
  __int128 v4 = __dst;
  uint64_t v11 = __dst;
  char v12 = __dst;
  v9[0] = a1;
  v9[1] = &v11;
  void v9[2] = &v12;
  char v10 = 0;
  if (a2 != a3)
  {
    BOOL v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        sub_10005AA70(v4, *(void **)v6, *((void *)v6 + 1));
        __int128 v4 = v12;
      }

      else
      {
        __int128 v7 = *v6;
        *((void *)v4 + 2) = *((void *)v6 + 2);
        *(_OWORD *)__int128 v4 = v7;
      }

      BOOL v6 = (__int128 *)((char *)v6 + 24);
      v4 += 24;
      char v12 = v4;
    }

    while (v6 != a3);
  }

  char v10 = 1;
  sub_1000A02D0((uint64_t)v9);
  return v4;
}

void sub_1000A02BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t sub_1000A02D0(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_1000A0304(a1);
  }
  return a1;
}

void sub_1000A0304(uint64_t a1)
{
  uint64_t v1 = **(void **)(a1 + 16);
  uint64_t v2 = **(void **)(a1 + 8);
  while (v1 != v2)
  {
    v1 -= 24LL;
  }

unint64_t sub_1000A0348(uint64_t a1, uint64_t *a2, unint64_t a3)
{
  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      uint64_t v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      uint64_t v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      uint64_t v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      uint64_t v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      uint64_t v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      uint64_t v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      uint64_t v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      unint64_t v11 = v7 + v9;
      unint64_t v12 = 0x9DDFEA08EB382D69LL
          * (v6 ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69LL * (v6 ^ (v4 + a3))));
      unint64_t v13 = 0x9DDFEA08EB382D69LL * (v12 ^ (v12 >> 47));
      unint64_t v14 = v8 + a3 + v7 + v4;
      uint64_t v15 = v14 + v5;
      unint64_t v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297LL * (v12 ^ (v12 >> 47)), 21);
      uint64_t v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      uint64_t v18 = v17 + v6 + v9;
      uint64_t v19 = __ROR8__(v18, 44);
      uint64_t v20 = v18 + v10;
      uint64_t v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      uint64_t v23 = *a2;
      uint64_t v22 = a2 + 4;
      unint64_t v24 = v23 - 0x4B6D499041670D8DLL * v5;
      uint64_t v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0LL);
      do
      {
        uint64_t v26 = *(v22 - 3);
        uint64_t v27 = v24 + v15 + v11 + v26;
        uint64_t v28 = v22[2];
        uint64_t v29 = v22[3];
        uint64_t v30 = v22[1];
        unint64_t v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        uint64_t v31 = v13 + v20;
        uint64_t v32 = *(v22 - 2);
        uint64_t v33 = *(v22 - 1);
        uint64_t v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        uint64_t v35 = v34 + v20 + v33;
        uint64_t v36 = v34 + v26 + v32;
        uint64_t v15 = v36 + v33;
        uint64_t v37 = __ROR8__(v36, 44) + v34;
        unint64_t v38 = (0xB492B66FBE98F273LL * __ROR8__(v27, 37)) ^ v21;
        unint64_t v24 = 0xB492B66FBE98F273LL * __ROR8__(v31, 33);
        unint64_t v16 = v37 + __ROR8__(v35 + v38, 21);
        unint64_t v39 = v24 + v21 + *v22;
        uint64_t v20 = v39 + v30 + v28 + v29;
        uint64_t v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        unint64_t v13 = v38;
        v25 += 64LL;
      }

      while (v25);
      unint64_t v40 = v24
          - 0x622015F714C7D297LL
          * ((0x9DDFEA08EB382D69LL
            * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69LL * (v21 ^ ((0x9DDFEA08EB382D69LL * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v21 ^ v16)))) >> 47));
      unint64_t v41 = 0x9DDFEA08EB382D69LL
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297LL
                  * ((0x9DDFEA08EB382D69LL
                    * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69LL * (v20 ^ ((0x9DDFEA08EB382D69LL * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69LL * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }

    else
    {
      return sub_1000A06F4(a2, a3);
    }
  }

  else if (a3 > 0x10)
  {
    return sub_1000A0648(a2, a3);
  }

  else
  {
    return sub_1000A0550(a2, a3);
  }

unint64_t sub_1000A0550(_DWORD *a1, unint64_t a2)
{
  if (a2 < 9)
  {
    if (a2 < 4)
    {
      unint64_t result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        unint64_t v8 = (0xC949D7C7509E6557LL * (a2 + 4LL * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }

    else
    {
      uint64_t v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      unint64_t v7 = 0x9DDFEA08EB382D69LL * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69LL
           * ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69LL * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }

  else
  {
    uint64_t v3 = *(void *)((char *)a1 + a2 - 8);
    uint64_t v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69LL
          * ((0x9DDFEA08EB382D69LL
            * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) ^ ((0x9DDFEA08EB382D69LL * (v4 ^ ((0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)) >> 47) ^ (0x9DDFEA08EB382D69LL * (v4 ^ *(void *)a1)))) >> 47))) ^ v3;
  }

  return result;
}

unint64_t sub_1000A0648(void *a1, uint64_t a2)
{
  uint64_t v2 = a1[1];
  unint64_t v3 = 0xB492B66FBE98F273LL * *a1;
  uint64_t v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  unint64_t v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557LL, 20) - 0x9AE16A3B2F90404FLL * *(void *)((char *)a1 + a2 - 8);
  unint64_t v6 = 0x9DDFEA08EB382D69LL * (v5 ^ (v4 - 0x3C5A37A36834CED9LL * *(void *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69LL
       * ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69LL * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t sub_1000A06F4(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)((char *)a1 + a2 - 16);
  uint64_t v3 = *a1 - 0x3C5A37A36834CED9LL * (v2 + a2);
  uint64_t v5 = a1[2];
  uint64_t v4 = a1[3];
  uint64_t v6 = __ROR8__(v3 + v4, 52);
  uint64_t v7 = v3 + a1[1];
  uint64_t v8 = __ROR8__(v7, 7);
  uint64_t v9 = v7 + v5;
  uint64_t v10 = *(void *)((char *)a1 + a2 - 32) + v5;
  uint64_t v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9LL * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  uint64_t v12 = *(void *)((char *)a1 + a2 - 24) + v10 + v2;
  unint64_t v13 = 0xC3A5C85C97CB3127LL * (v12 + *(void *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1LL
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(void *)((char *)a1 + a2 - 24) + v10, 7)
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9LL * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t sub_1000A07B4(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100018774();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v18 = a1 + 2;
  if (v9) {
    uint64_t v10 = (char *)sub_100018F00(v7, v9);
  }
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }

  unint64_t v16 = v11 + 24;
  sub_100021168(a1, v15);
  uint64_t v13 = a1[1];
  sub_1000212F0((uint64_t)v15);
  return v13;
}

void sub_1000A08C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_1000A08D4(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  unint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      sub_100018774();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      unint64_t v14 = (char *)sub_100018788(v4, v13);
      unint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }

    else
    {
      unint64_t v14 = 0LL;
    }

    uint64_t v15 = &v14[8 * v11];
    unint64_t v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    uint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }

    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

__int128 *sub_1000A09DC(uint64_t a1, __int128 *a2, __int128 *a3, uint64_t a4)
{
  unint64_t v5 = a2;
  if (a2 != a3)
  {
    do
    {
      __int128 v7 = *v5;
      *(void *)(a4 + 16) = *((void *)v5 + 2);
      *(_OWORD *)a4 = v7;
      a4 += 24LL;
      *((_BYTE *)v5 + 23) = 0;
      *(_BYTE *)unint64_t v5 = 0;
      unint64_t v5 = (__int128 *)((char *)v5 + 24);
    }

    while (v5 != a3);
    return a3;
  }

  return v5;
}

uint64_t *sub_1000A0A4C(uint64_t **a1, uint64_t *a2, uint64_t a3, uint64_t **a4)
{
  __int128 v7 = a1 + 1;
  uint64_t v6 = a1[1];
  if (v6)
  {
    uint64_t v8 = *a2;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = (uint64_t **)v6;
        uint64_t v10 = v6[4];
        if (v8 >= v10) {
          break;
        }
        uint64_t v6 = *v9;
        __int128 v7 = v9;
        if (!*v9) {
          goto LABEL_10;
        }
      }

      if (v10 >= v8) {
        break;
      }
      uint64_t v6 = v9[1];
      if (!v6)
      {
        __int128 v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }

  else
  {
    uint64_t v9 = a1 + 1;
LABEL_10:
    uint64_t v11 = (uint64_t *)operator new(0x30uLL);
    v11[4] = **a4;
    v11[5] = 0LL;
    sub_100019D14(a1, (uint64_t)v9, v7, v11);
    return v11;
  }

  return (uint64_t *)v9;
}

void sub_1000A0B08(char *__src, int *a2, void *a3, int a4, const char *a5)
{
  uint64_t v9 = 1LL;
  if (*a2 >= 2)
  {
    do
    {
      sub_10000A2DC(&__str, *(char **)(*a3 + 8 * v9));
      if ((char)__str.__r_.__value_.__s.__size_ < 0)
      {
        if (*__str.__r_.__value_.__l.__data_ != 45 || __str.__r_.__value_.__l.__size_ == 1)
        {
          operator delete(__str.__r_.__value_.__l.__data_);
          if (!a4) {
            goto LABEL_57;
          }
          goto LABEL_53;
        }
      }

      else if (__str.__r_.__value_.__s.__data_[0] != 45 || __str.__r_.__value_.__s.__size_ == 1)
      {
        break;
      }

      if ((__str.__r_.__value_.__s.__size_ & 0x80) != 0) {
        goto LABEL_13;
      }
      while (__str.__r_.__value_.__s.__data_[0] == 45)
      {
        while (1)
        {
          std::string::basic_string(&__dst, &__str, 1uLL, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&__p);
          std::string __str = __dst;
          if ((__dst.__r_.__value_.__s.__size_ & 0x80) == 0) {
            break;
          }
LABEL_13:
          if (*__str.__r_.__value_.__l.__data_ != 45)
          {
            sub_10005AA70(&__dst, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
            goto LABEL_19;
          }
        }
      }

      std::string __dst = __str;
LABEL_19:
      sub_10000A2DC(&__p, "");
      if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        int64_t size = __str.__r_.__value_.__s.__size_;
      }
      else {
        int64_t size = __str.__r_.__value_.__l.__size_;
      }
      if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        p_str = &__str;
      }
      else {
        p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
      }
      if (size >= 1)
      {
        unint64_t v13 = (char *)p_str + size;
        unint64_t v14 = p_str;
        do
        {
          uint64_t v15 = memchr(v14, 61, size);
          if (!v15) {
            break;
          }
          if (*v15 == 61)
          {
            if (v15 != v13)
            {
              std::string::size_type v16 = v15 - (_BYTE *)p_str;
              if (v16 != -1LL)
              {
                std::string::basic_string(&v27, &__str, 0LL, v16, (std::allocator<char> *)&v31);
                std::string __dst = v27;
                std::string::basic_string(&v27, &__str, v16 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v31);
                std::string __p = v27;
              }
            }

            break;
          }

          unint64_t v14 = (std::string *)(v15 + 1);
          int64_t size = v13 - (_BYTE *)v14;
        }

        while (v13 - (_BYTE *)v14 >= 1);
      }

      uint64_t v17 = sub_1000A0F7C();
      if ((sub_1000A101C(v17, (unsigned __int8 *)&__dst, (unsigned __int8 *)&__p) & 1) == 0)
      {
        uint64_t v18 = sub_1000A1158();
        if ((sub_1000A11F8(v18, (unsigned __int8 *)&__dst, &__p) & 1) == 0)
        {
          uint64_t v19 = sub_1000A1314();
          if (!sub_1000A13B4(v19, (unsigned __int8 *)&__dst, (uint64_t)&__p))
          {
            uint64_t v20 = sub_1000A14F0();
            if (!sub_1000A1590(v20, (unsigned __int8 *)&__dst, (uint64_t)&__p))
            {
              uint64_t v21 = sub_1000A16CC();
              if (!sub_1000A176C(v21, (unsigned __int8 *)&__dst, (uint64_t)&__p))
              {
                sub_10000A2DC(&v27, "FATAL");
                sub_10002A9EC(&v31, (uint64_t)&v27);
                uint64_t v22 = sub_10002A6A4(&std::cerr, (uint64_t)"SetFlags: Bad option: ", 22LL);
                size_t v23 = strlen(*(const char **)(*a3 + 8 * v9));
                sub_10002A6A4(v22, *(void *)(*a3 + 8 * v9), v23);
                sub_10002AA94(&v31);
              }
            }
          }
        }
      }

      ++v9;
    }

    while (v9 < *a2);
  }

  if (!a4) {
    goto LABEL_57;
  }
LABEL_53:
  int v24 = *a2 - v9;
  if (v24 >= 1)
  {
    uint64_t v25 = 0LL;
    do
    {
      *(void *)(*a3 + v25 + std::ostream::~ostream(v2, v3 + 8) = *(void *)(*a3 + v25 + 8LL * v9);
      v25 += 8LL;
    }

    while (8LL * v24 != v25);
  }

  *a2 = v24 + 1;
LABEL_57:
  if (byte_1000DE7EC)
  {
    int v26 = 1;
    goto LABEL_64;
  }

  if (byte_1000DE7ED)
  {
    int v26 = 0;
LABEL_64:
    sub_1000A18A8(v26);
    exit(1);
  }

void sub_1000A0EE8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28, uint64_t a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A0F7C()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDAB0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDAB0))
  {
    uint64_t v2 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v2 = 850045863LL;
    *(_OWORD *)(v2 + std::ostream::~ostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v2 + ++*(_DWORD *)(result + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 7) = 0LL;
    *((void *)v2 + std::ostream::~ostream(v2, v3 + 8) = v2 + 72;
    qword_1000DDAA8 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDAB0);
  }

  return qword_1000DDAA8;
}

void sub_1000A1004(_Unwind_Exception *a1)
{
}

uint64_t sub_1000A101C(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0LL;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0LL) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0LL) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)v8) {
      return sub_1000A29D8(a1, a3, (char *)v3[7]);
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        return sub_1000A29D8(a1, a3, (char *)v3[7]);
      }
    }

uint64_t sub_1000A1158()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDAC0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDAC0))
  {
    uint64_t v2 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v2 = 850045863LL;
    *(_OWORD *)(v2 + std::ostream::~ostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v2 + ++*(_DWORD *)(result + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 7) = 0LL;
    *((void *)v2 + std::ostream::~ostream(v2, v3 + 8) = v2 + 72;
    qword_1000DDAB8 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDAC0);
  }

  return qword_1000DDAB8;
}

void sub_1000A11E0(_Unwind_Exception *a1)
{
}

uint64_t sub_1000A11F8(uint64_t a1, unsigned __int8 *a2, std::string *__str)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0LL;
  }
  uint64_t v7 = a2[23];
  size_t v9 = *(const void **)a2;
  size_t v8 = *((void *)a2 + 1);
  if ((v7 & 0x80u) == 0LL) {
    uint64_t v10 = a2[23];
  }
  else {
    uint64_t v10 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v11 = *((unsigned __int8 *)v3 + 55);
    int v12 = (char)v11;
    if ((v11 & 0x80u) != 0LL) {
      uint64_t v11 = v3[5];
    }
    if (v10 != v11) {
      goto LABEL_18;
    }
    int v13 = v12 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v7 & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)v7) {
      goto LABEL_25;
    }
    unint64_t v14 = a2;
    uint64_t v15 = v7;
    while (*v14 == *v13)
    {
      ++v14;
      ++v13;
      if (!--v15) {
        goto LABEL_25;
      }
    }

uint64_t sub_1000A1314()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDAD0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDAD0))
  {
    uint64_t v2 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v2 = 850045863LL;
    *(_OWORD *)(v2 + std::ostream::~ostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v2 + ++*(_DWORD *)(result + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 7) = 0LL;
    *((void *)v2 + std::ostream::~ostream(v2, v3 + 8) = v2 + 72;
    qword_1000DDAC8 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDAD0);
  }

  return qword_1000DDAC8;
}

void sub_1000A139C(_Unwind_Exception *a1)
{
}

BOOL sub_1000A13B4(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0LL;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0LL) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0LL) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)v8) {
      return sub_1000A2B3C(a1, a3, (_DWORD *)v3[7]);
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        return sub_1000A2B3C(a1, a3, (_DWORD *)v3[7]);
      }
    }

uint64_t sub_1000A14F0()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDAE0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDAE0))
  {
    uint64_t v2 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v2 = 850045863LL;
    *(_OWORD *)(v2 + std::ostream::~ostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v2 + ++*(_DWORD *)(result + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 7) = 0LL;
    *((void *)v2 + std::ostream::~ostream(v2, v3 + 8) = v2 + 72;
    qword_1000DDAD8 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDAE0);
  }

  return qword_1000DDAD8;
}

void sub_1000A1578(_Unwind_Exception *a1)
{
}

BOOL sub_1000A1590(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0LL;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0LL) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0LL) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)v8) {
      return sub_1000A2BB8(a1, a3, (uint64_t *)v3[7]);
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        return sub_1000A2BB8(a1, a3, (uint64_t *)v3[7]);
      }
    }

uint64_t sub_1000A16CC()
{
  unsigned __int8 v0 = atomic_load((unsigned __int8 *)&qword_1000DDAF0);
  if ((v0 & 1) == 0 && __cxa_guard_acquire(&qword_1000DDAF0))
  {
    uint64_t v2 = (char *)operator new(0x58uLL);
    *(void *)uint64_t v2 = 850045863LL;
    *(_OWORD *)(v2 + std::ostream::~ostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v2 + ++*(_DWORD *)(result + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 10) = 0LL;
    *((void *)v2 + 9) = 0LL;
    *((void *)v2 + 7) = 0LL;
    *((void *)v2 + std::ostream::~ostream(v2, v3 + 8) = v2 + 72;
    qword_1000DDAE8 = (uint64_t)v2;
    __cxa_guard_release(&qword_1000DDAF0);
  }

  return qword_1000DDAE8;
}

void sub_1000A1754(_Unwind_Exception *a1)
{
}

BOOL sub_1000A176C(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 64);
  uint64_t v4 = (void *)(a1 + 72);
  if (v3 == (void *)(a1 + 72)) {
    return 0LL;
  }
  uint64_t v8 = a2[23];
  uint64_t v10 = *(const void **)a2;
  size_t v9 = *((void *)a2 + 1);
  if ((v8 & 0x80u) == 0LL) {
    uint64_t v11 = a2[23];
  }
  else {
    uint64_t v11 = *((void *)a2 + 1);
  }
  while (1)
  {
    uint64_t v12 = *((unsigned __int8 *)v3 + 55);
    int v13 = (char)v12;
    if ((v12 & 0x80u) != 0LL) {
      uint64_t v12 = v3[5];
    }
    if (v11 != v12) {
      goto LABEL_18;
    }
    unint64_t v14 = v13 >= 0 ? (unsigned __int8 *)(v3 + 4) : (unsigned __int8 *)v3[4];
    if ((v8 & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)v8) {
      return sub_1000A2C34(a1, a3, (double *)v3[7]);
    }
    uint64_t v15 = a2;
    uint64_t v16 = v8;
    while (*v15 == *v14)
    {
      ++v15;
      ++v14;
      if (!--v16) {
        return sub_1000A2C34(a1, a3, (double *)v3[7]);
      }
    }

void sub_1000A18A8(int a1)
{
  v12[0] = 0LL;
  v12[1] = 0LL;
  uint64_t v11 = (uint64_t *)v12;
  size_t v2 = strlen(byte_1000DDF68);
  uint64_t v3 = sub_10002A6A4(&std::cout, (uint64_t)byte_1000DDF68, v2);
  sub_10002A6A4(v3, (uint64_t)"\n", 1LL);
  uint64_t v4 = sub_1000A0F7C();
  sub_1000A1A60(v4, &v11);
  uint64_t v5 = sub_1000A1158();
  sub_1000A1CFC(v5, &v11);
  uint64_t v6 = sub_1000A1314();
  sub_1000A1F88(v6, &v11);
  uint64_t v7 = sub_1000A14F0();
  sub_1000A2214(v7, &v11);
  uint64_t v8 = sub_1000A16CC();
  sub_1000A24A0(v8, &v11);
  if (byte_1000DE368
    && (sub_10002A6A4(&std::cout, (uint64_t)"PROGRAM FLAGS:\n\n", 16LL),
        sub_10000A2DC(__p, &byte_1000DE368),
        sub_1000A272C(&v11, (unsigned __int8 *)__p, 1, 0),
        v10 < 0))
  {
    operator delete(__p[0]);
    if (!a1) {
      goto LABEL_9;
    }
  }

  else if (!a1)
  {
    goto LABEL_9;
  }

  if (byte_1000DE368) {
    sub_10002A6A4(&std::cout, (uint64_t)"LIBRARY FLAGS:\n\n", 16LL);
  }
  sub_10000A2DC(__p, &byte_1000DE368);
  sub_1000A272C(&v11, (unsigned __int8 *)__p, 0, 1);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
LABEL_9:
  sub_1000996C8((uint64_t)&v11, v12[0]);
}

void sub_1000A1A10( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *a16)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  sub_1000996C8((uint64_t)&a15, a16);
  _Unwind_Resume(a1);
}

void sub_1000A1A60(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>(&v19, "  --", v2 + 4);
      std::string::append(&v19, ": type = ");
      std::string::append(&v19, (const std::string::value_type *)v2[9]);
      std::string::append(&v19, ", default = ");
      if (*((_BYTE *)v2 + 88)) {
        uint64_t v5 = "true";
      }
      else {
        uint64_t v5 = "false";
      }
      sub_10000A2DC(&__s, v5);
      uint64_t v6 = std::string::append((std::string *)&__s, "\n  ");
      __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
      int64_t cap = v6->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v7;
      v6->__r_.__value_.__l.__size_ = 0LL;
      v6->__r_.__value_.__l.__cap_ = 0LL;
      v6->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        uint64_t v8 = __p;
      }
      else {
        uint64_t v8 = (void **)__p[0];
      }
      if (cap >= 0) {
        std::string::size_type v9 = HIBYTE(cap);
      }
      else {
        std::string::size_type v9 = (std::string::size_type)__p[1];
      }
      std::string::append(&v19, (const std::string::value_type *)v8, v9);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (v15.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v19, (const std::string::value_type *)v2[8]);
      char v10 = (char *)v2[10];
      __s = v10;
      if ((char)v19.__r_.__value_.__s.__size_ < 0)
      {
        sub_10005AA70(&v15, v19.__r_.__value_.__l.__data_, v19.__r_.__value_.__l.__size_);
        char v10 = __s;
      }

      else
      {
        std::string v15 = v19;
      }

      sub_10000A2DC(__p, v10);
      std::string v18 = v15;
      memset(&v15, 0, sizeof(v15));
      sub_1000A2CAC(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v11 = (void *)v2[1];
      if (v11)
      {
        do
        {
          uint64_t v12 = v11;
          uint64_t v11 = (void *)*v11;
        }

        while (v11);
      }

      else
      {
        do
        {
          uint64_t v12 = (void *)v2[2];
          BOOL v13 = *v12 == (void)v2;
          size_t v2 = v12;
        }

        while (!v13);
      }

      size_t v2 = v12;
    }

    while (v12 != v3);
  }

void sub_1000A1C84( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A1CFC(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>(&v18, "  --", v2 + 4);
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000A2F3C((uint64_t)(v2 + 11), (std::string *)&__s);
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t cap = v5->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0LL;
      v5->__r_.__value_.__l.__cap_ = 0LL;
      v5->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        __int128 v7 = __p;
      }
      else {
        __int128 v7 = (void **)__p[0];
      }
      if (cap >= 0) {
        std::string::size_type v8 = HIBYTE(cap);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if ((char)v18.__r_.__value_.__s.__size_ < 0)
      {
        sub_10005AA70(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }

      else
      {
        std::string v14 = v18;
      }

      sub_10000A2DC(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000A2CAC(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }

        while (v10);
      }

      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }

        while (!v12);
      }

      size_t v2 = v11;
    }

    while (v11 != v3);
  }

void sub_1000A1F10( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A1F88(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(unsigned int **)(a1 + 64);
  uint64_t v3 = (unsigned int *)(a1 + 72);
  if (v2 != (unsigned int *)(a1 + 72))
  {
    do
    {
      std::operator+<char>(&v18, "  --", v2 + 8);
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, *((const std::string::value_type **)v2 + 9));
      std::string::append(&v18, ", default = ");
      sub_1000A2FC4(v2 + 22, (std::stringbuf::string_type *)&__s);
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t cap = v5->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0LL;
      v5->__r_.__value_.__l.__cap_ = 0LL;
      v5->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        __int128 v7 = __p;
      }
      else {
        __int128 v7 = (void **)__p[0];
      }
      if (cap >= 0) {
        std::string::size_type v8 = HIBYTE(cap);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, *((const std::string::value_type **)v2 + 8));
      std::string::size_type v9 = (char *)*((void *)v2 + 10);
      __s = v9;
      if ((char)v18.__r_.__value_.__s.__size_ < 0)
      {
        sub_10005AA70(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }

      else
      {
        std::string v14 = v18;
      }

      sub_10000A2DC(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000A2CAC(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      char v10 = (unsigned int *)*((void *)v2 + 1);
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = *(unsigned int **)v10;
        }

        while (v10);
      }

      else
      {
        do
        {
          uint64_t v11 = (unsigned int *)*((void *)v2 + 2);
          BOOL v12 = *(void *)v11 == (void)v2;
          size_t v2 = v11;
        }

        while (!v12);
      }

      size_t v2 = v11;
    }

    while (v11 != v3);
  }

void sub_1000A219C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A2214(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(void **)(a1 + 64);
  uint64_t v3 = (void *)(a1 + 72);
  if (v2 != (void *)(a1 + 72))
  {
    do
    {
      std::operator+<char>(&v18, "  --", v2 + 4);
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, (const std::string::value_type *)v2[9]);
      std::string::append(&v18, ", default = ");
      sub_1000A308C(v2 + 11, (std::stringbuf::string_type *)&__s);
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t cap = v5->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0LL;
      v5->__r_.__value_.__l.__cap_ = 0LL;
      v5->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        __int128 v7 = __p;
      }
      else {
        __int128 v7 = (void **)__p[0];
      }
      if (cap >= 0) {
        std::string::size_type v8 = HIBYTE(cap);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, (const std::string::value_type *)v2[8]);
      std::string::size_type v9 = (char *)v2[10];
      __s = v9;
      if ((char)v18.__r_.__value_.__s.__size_ < 0)
      {
        sub_10005AA70(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }

      else
      {
        std::string v14 = v18;
      }

      sub_10000A2DC(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000A2CAC(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      char v10 = (void *)v2[1];
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = (void *)*v10;
        }

        while (v10);
      }

      else
      {
        do
        {
          uint64_t v11 = (void *)v2[2];
          BOOL v12 = *v11 == (void)v2;
          size_t v2 = v11;
        }

        while (!v12);
      }

      size_t v2 = v11;
    }

    while (v11 != v3);
  }

void sub_1000A2428( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A24A0(uint64_t a1, uint64_t **a2)
{
  size_t v2 = *(double **)(a1 + 64);
  uint64_t v3 = (double *)(a1 + 72);
  if (v2 != (double *)(a1 + 72))
  {
    do
    {
      std::operator+<char>(&v18, "  --", v2 + 4);
      std::string::append(&v18, ": type = ");
      std::string::append(&v18, *((const std::string::value_type **)v2 + 9));
      std::string::append(&v18, ", default = ");
      sub_1000A3154(v2 + 11, (std::stringbuf::string_type *)&__s);
      uint64_t v5 = std::string::append((std::string *)&__s, "\n  ");
      __int128 v6 = *(_OWORD *)&v5->__r_.__value_.__l.__data_;
      int64_t cap = v5->__r_.__value_.__l.__cap_;
      *(_OWORD *)std::string __p = v6;
      v5->__r_.__value_.__l.__size_ = 0LL;
      v5->__r_.__value_.__l.__cap_ = 0LL;
      v5->__r_.__value_.__r.__words[0] = 0LL;
      if (cap >= 0) {
        __int128 v7 = __p;
      }
      else {
        __int128 v7 = (void **)__p[0];
      }
      if (cap >= 0) {
        std::string::size_type v8 = HIBYTE(cap);
      }
      else {
        std::string::size_type v8 = (std::string::size_type)__p[1];
      }
      std::string::append(&v18, (const std::string::value_type *)v7, v8);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      if (v14.__r_.__value_.__s.__data_[15] < 0) {
        operator delete(__s);
      }
      std::string::append(&v18, *((const std::string::value_type **)v2 + 8));
      std::string::size_type v9 = (char *)*((void *)v2 + 10);
      __s = v9;
      if ((char)v18.__r_.__value_.__s.__size_ < 0)
      {
        sub_10005AA70(&v14, v18.__r_.__value_.__l.__data_, v18.__r_.__value_.__l.__size_);
        std::string::size_type v9 = __s;
      }

      else
      {
        std::string v14 = v18;
      }

      sub_10000A2DC(__p, v9);
      std::string v17 = v14;
      memset(&v14, 0, sizeof(v14));
      sub_1000A2CAC(a2, (const void **)__p, (uint64_t)__p);
      if (SHIBYTE(cap) < 0) {
        operator delete(__p[0]);
      }
      char v10 = (double *)*((void *)v2 + 1);
      if (v10)
      {
        do
        {
          uint64_t v11 = v10;
          char v10 = *(double **)v10;
        }

        while (v10);
      }

      else
      {
        do
        {
          uint64_t v11 = (double *)*((void *)v2 + 2);
          BOOL v12 = *(void *)v11 == (void)v2;
          size_t v2 = v11;
        }

        while (!v12);
      }

      size_t v2 = v11;
    }

    while (v11 != v3);
  }

void sub_1000A26B4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18, void *a19, uint64_t a20, int a21, __int16 a22, char a23, char a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, void *__p, uint64_t a30, int a31, __int16 a32, char a33, char a34)
{
  if (a34 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000A272C(void *a1, unsigned __int8 *a2, int a3, int a4)
{
  uint64_t v4 = a1 + 1;
  uint64_t v5 = (void *)*a1;
  if ((void *)*a1 == a1 + 1) {
    goto LABEL_61;
  }
  char v8 = 0;
  char v9 = 0;
  do
  {
    char v10 = (const void **)(v5 + 4);
    uint64_t v11 = *((unsigned __int8 *)v5 + 55);
    size_t v12 = v5[5];
    if ((v11 & 0x80u) == 0LL) {
      uint64_t v13 = *((unsigned __int8 *)v5 + 55);
    }
    else {
      uint64_t v13 = v5[5];
    }
    uint64_t v14 = a2[23];
    int v15 = (char)v14;
    if ((v14 & 0x80u) != 0LL) {
      uint64_t v14 = *((void *)a2 + 1);
    }
    if (v13 == v14)
    {
      if (v15 >= 0) {
        uint64_t v16 = a2;
      }
      else {
        uint64_t v16 = *(unsigned __int8 **)a2;
      }
      if ((v11 & 0x80) != 0)
      {
        if ((((memcmp(*v10, v16, v5[5]) == 0) ^ a3) & 1) != 0) {
          goto LABEL_53;
        }
        goto LABEL_22;
      }

      if (!*((_BYTE *)v5 + 55))
      {
LABEL_17:
        if ((a3 & 1) == 0) {
          goto LABEL_53;
        }
        goto LABEL_22;
      }

      std::string v17 = (unsigned __int8 *)(v5 + 4);
      uint64_t v18 = *((unsigned __int8 *)v5 + 55);
      while (*v17 == *v16)
      {
        ++v17;
        ++v16;
        if (!--v18) {
          goto LABEL_17;
        }
      }
    }

    if ((a3 & 1) != 0) {
      goto LABEL_53;
    }
LABEL_22:
    std::string::size_type size = v35.__r_.__value_.__s.__size_;
    if ((v35.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = v35.__r_.__value_.__l.__size_;
    }
    if (v13 != size) {
      goto LABEL_35;
    }
    if ((v35.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v20 = &v35;
    }
    else {
      uint64_t v20 = (std::string *)v35.__r_.__value_.__r.__words[0];
    }
    if ((v11 & 0x80) != 0)
    {
      if (memcmp(*v10, v20, v12)) {
        goto LABEL_35;
      }
    }

    else if ((_DWORD)v11)
    {
      uint64_t v21 = (unsigned __int8 *)(v5 + 4);
      while (*v21 == v20->__r_.__value_.__s.__data_[0])
      {
        ++v21;
        uint64_t v20 = (std::string *)((char *)v20 + 1);
        if (!--v11) {
          goto LABEL_46;
        }
      }

void sub_1000A29B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A29D8(uint64_t a1, unsigned __int8 *a2, char *a3)
{
  if (((char)a2[23] & 0x80000000) == 0)
  {
    uint64_t result = 0LL;
    char v4 = 1;
    switch(a2[23])
    {
      case 0u:
        goto LABEL_33;
      case 1u:
        int v5 = *a2;
        if (v5 == 49) {
          goto LABEL_33;
        }
        goto LABEL_29;
      case 4u:
        if (*(_DWORD *)a2 != 1702195828) {
          return 0LL;
        }
        goto LABEL_21;
      case 5u:
        if (*(_DWORD *)a2 == 1936482662 && a2[4] == 101) {
          goto LABEL_32;
        }
        if (a2[23] != 1) {
          return 0LL;
        }
        goto LABEL_28;
      default:
        return result;
    }
  }

  uint64_t result = 0LL;
  uint64_t v6 = *((void *)a2 + 1);
  char v4 = 1;
  switch(v6)
  {
    case 0LL:
      goto LABEL_33;
    case 1LL:
      goto LABEL_6;
    case 4LL:
      if (**(_DWORD **)a2 == 1702195828 || !v6) {
        goto LABEL_21;
      }
      if (v6 != 5)
      {
        if (v6 != 1) {
          return 0LL;
        }
LABEL_6:
        if (**(_BYTE **)a2 != 49) {
          goto LABEL_27;
        }
LABEL_21:
        char v4 = 1;
LABEL_33:
        *a3 = v4;
        return 1LL;
      }

BOOL sub_1000A2B3C(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  __endptr = 0LL;
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtol(v4, &__endptr, 0);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0LL) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *__endptr == 0;
}

BOOL sub_1000A2BB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __endptr = 0LL;
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtoll(v4, &__endptr, 0);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0LL) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *__endptr == 0;
}

BOOL sub_1000A2C34(uint64_t a1, uint64_t a2, double *a3)
{
  __int128 v7 = 0LL;
  else {
    char v4 = *(const char **)a2;
  }
  *a3 = strtod(v4, &v7);
  uint64_t v5 = *(unsigned __int8 *)(a2 + 23);
  if ((v5 & 0x80u) != 0LL) {
    uint64_t v5 = *(void *)(a2 + 8);
  }
  return v5 && *v7 == 0;
}

_OWORD *sub_1000A2CAC(uint64_t **a1, const void **a2, uint64_t a3)
{
  uint64_t v5 = (void **)sub_1000A2D78((uint64_t)a1, &v11, a2);
  uint64_t v6 = *v5;
  if (!*v5)
  {
    __int128 v7 = (uint64_t **)v5;
    uint64_t v6 = operator new(0x50uLL);
    v9[1] = a1 + 1;
    v6[2] = *(_OWORD *)a3;
    *((void *)v6 + 6) = *(void *)(a3 + 16);
    *(void *)a3 = 0LL;
    *(void *)(a3 + std::ostream::~ostream(v2, v3 + 8) = 0LL;
    *(_OWORD *)((char *)v6 + 56) = *(_OWORD *)(a3 + 24);
    *((void *)v6 + 9) = *(void *)(a3 + 40);
    *(void *)(a3 + 16) = 0LL;
    *(void *)(a3 + ++*(_DWORD *)(result + 24) = 0LL;
    *(void *)(a3 + 32) = 0LL;
    *(void *)(a3 + 40) = 0LL;
    char v10 = 1;
    sub_100019D14(a1, v11, v7, (uint64_t *)v6);
    v9[0] = 0LL;
    sub_100099640((uint64_t)v9, 0LL);
  }

  return v6;
}

void *sub_1000A2D78(uint64_t a1, void *a2, const void **a3)
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
        char v8 = (void *)v4;
        char v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    char v8 = (void *)(a1 + 8);
  }

uint64_t sub_1000A2E14(uint64_t a1, const void **a2, const void **a3)
{
  int v5 = *((char *)a3 + 23);
  int v6 = *((char *)a2 + 23);
  if (v6 >= 0) {
    size_t v7 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v7 = (size_t)a2[1];
  }
  if (v6 >= 0) {
    char v8 = a2;
  }
  else {
    char v8 = *a2;
  }
  if (v5 >= 0) {
    size_t v9 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v9 = (size_t)a3[1];
  }
  if (v5 >= 0) {
    char v10 = a3;
  }
  else {
    char v10 = *a3;
  }
  if (v9 >= v7) {
    size_t v11 = v7;
  }
  else {
    size_t v11 = v9;
  }
  int v12 = memcmp(v8, v10, v11);
  BOOL v13 = v7 < v9;
  if (v12) {
    BOOL v13 = v12 < 0;
  }
  if (v13) {
    return 1LL;
  }
  int v15 = memcmp(v10, v8, v11);
  BOOL v16 = v9 < v7;
  if (v15) {
    BOOL v16 = v15 < 0;
  }
  if (v16) {
    return 0LL;
  }
  std::string v19 = (const void **)a3[3];
  uint64_t v18 = a3 + 3;
  std::string v17 = v19;
  int v20 = *((char *)v18 + 23);
  int v23 = (const void **)a2[3];
  uint64_t v22 = a2 + 3;
  uint64_t v21 = v23;
  int v24 = *((char *)v22 + 23);
  if (v24 >= 0) {
    size_t v25 = *((unsigned __int8 *)v22 + 23);
  }
  else {
    size_t v25 = (size_t)v22[1];
  }
  if (v24 >= 0) {
    int v26 = v22;
  }
  else {
    int v26 = v21;
  }
  if (v20 >= 0) {
    size_t v27 = *((unsigned __int8 *)v18 + 23);
  }
  else {
    size_t v27 = (size_t)v18[1];
  }
  if (v20 >= 0) {
    uint64_t v28 = v18;
  }
  else {
    uint64_t v28 = v17;
  }
  if (v27 >= v25) {
    size_t v29 = v25;
  }
  else {
    size_t v29 = v27;
  }
  int v30 = memcmp(v26, v28, v29);
  if (v30) {
    return v30 < 0;
  }
  else {
    return v25 < v27;
  }
}

void sub_1000A2F3C(uint64_t a1@<X1>, std::string *a2@<X8>)
{
  uint64_t v3 = std::string::append(&v4, "");
  *a2 = *v3;
  v3->__r_.__value_.__l.__size_ = 0LL;
  v3->__r_.__value_.__l.__cap_ = 0LL;
  v3->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_1000A2FA8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A2FC4@<X0>(unsigned int *a1@<X1>, std::stringbuf::string_type *a2@<X8>)
{
  return std::ios::~ios(&v7);
}

void sub_1000A3078(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1000A308C@<X0>(void *a1@<X1>, std::stringbuf::string_type *a2@<X8>)
{
  return std::ios::~ios(&v7);
}

void sub_1000A3140(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1000A3154@<X0>(double *a1@<X1>, std::stringbuf::string_type *a2@<X8>)
{
  return std::ios::~ios(&v7);
}

void sub_1000A3208(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_1000A321C(char *__s, char *__charset, void **a3, int a4)
{
  if (__s)
  {
    uint64_t v7 = __s;
    uint64_t v8 = (uint64_t)(a3 + 2);
    do
    {
      size_t v9 = strpbrk(v7, __charset);
      char v10 = v9;
      if (v9) {
        *size_t v9 = 0;
      }
      if (!a4 || *v7)
      {
        int v12 = (const char **)a3[1];
        unint64_t v11 = (unint64_t)a3[2];
        if ((unint64_t)v12 >= v11)
        {
          uint64_t v14 = ((char *)v12 - (_BYTE *)*a3) >> 3;
          uint64_t v15 = v11 - (void)*a3;
          uint64_t v16 = v15 >> 2;
          else {
            unint64_t v17 = v16;
          }
          if (v17) {
            uint64_t v18 = (char *)sub_100018788(v8, v17);
          }
          else {
            uint64_t v18 = 0LL;
          }
          std::string v19 = (const char **)&v18[8 * v14];
          *std::string v19 = v7;
          BOOL v13 = v19 + 1;
          uint64_t v21 = (char *)*a3;
          int v20 = (char *)a3[1];
          if (v20 != *a3)
          {
            do
            {
              uint64_t v22 = (const char *)*((void *)v20 - 1);
              v20 -= 8;
              *--std::string v19 = v22;
            }

            while (v20 != v21);
            int v20 = (char *)*a3;
          }

          *a3 = v19;
          a3[1] = v13;
          a3[2] = &v18[8 * v17];
          if (v20) {
            operator delete(v20);
          }
        }

        else
        {
          *int v12 = v7;
          BOOL v13 = v12 + 1;
        }

        a3[1] = v13;
      }

      uint64_t v7 = v10 + 1;
    }

    while (v10);
  }

uint64_t sub_1000A3348(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _BYTE *a5)
{
  else {
    char v10 = *(const char **)a1;
  }
  if (a5) {
    *a5 = 0;
  }
  uint64_t result = strtoll(v10, &__endptr, 10);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 23);
  if ((v12 & 0x80u) != 0LL) {
    uint64_t v12 = *(void *)(a1 + 8);
  }
  unint64_t v13 = (unint64_t)&v10[v12];
  if (result >= 0) {
    char v14 = 1;
  }
  else {
    char v14 = a4;
  }
  if ((unint64_t)__endptr < v13 || (v14 & 1) == 0)
  {
    if (byte_1000DDAF8) {
      sub_10000A2DC(__p, "FATAL");
    }
    else {
      sub_10000A2DC(__p, "ERROR");
    }
    sub_10002A9EC(&v28, (uint64_t)__p);
    uint64_t v15 = sub_10002A6A4(&std::cerr, (uint64_t)"StrToInt64: Bad integer = ", 26LL);
    int v16 = *(char *)(a1 + 23);
    if (v16 >= 0) {
      uint64_t v17 = a1;
    }
    else {
      uint64_t v17 = *(void *)a1;
    }
    if (v16 >= 0) {
      uint64_t v18 = *(unsigned __int8 *)(a1 + 23);
    }
    else {
      uint64_t v18 = *(void *)(a1 + 8);
    }
    std::string v19 = sub_10002A6A4(v15, v17, v18);
    int v20 = sub_10002A6A4(v19, (uint64_t)", source = ", 12LL);
    int v21 = *(char *)(a2 + 23);
    if (v21 >= 0) {
      uint64_t v22 = a2;
    }
    else {
      uint64_t v22 = *(void *)a2;
    }
    if (v21 >= 0) {
      uint64_t v23 = *(unsigned __int8 *)(a2 + 23);
    }
    else {
      uint64_t v23 = *(void *)(a2 + 8);
    }
    int v24 = sub_10002A6A4(v20, v22, v23);
    size_t v25 = sub_10002A6A4(v24, (uint64_t)", line = ", 9LL);
    std::ostream::operator<<(v25, a3);
    sub_10002AA94(&v28);
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    uint64_t result = 0LL;
    if (a5) {
      *a5 = 1;
    }
  }

  return result;
}

void sub_1000A34CC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, int a16, __int16 a17, char a18, char a19)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

unint64_t sub_1000A3504(unint64_t result)
{
  unint64_t v1 = result;
  uint64_t v2 = *(unsigned __int8 *)(result + 23);
  uint64_t v3 = (_BYTE *)result;
  while (1)
  {
    unint64_t v4 = v1;
    if ((v2 & 0x80) != 0)
    {
      unint64_t v4 = *(void *)v1;
      uint64_t v2 = *(void *)(v1 + 8);
    }

    if (v3 == (_BYTE *)(v4 + v2)) {
      return result;
    }
    __darwin_ct_rune_t v5 = (char)*v3;
    if ((v5 & 0x80000000) == 0)
    {
      uint64_t result = _DefaultRuneLocale.__runetype[v5] & 0x500;
      if ((_DWORD)result) {
        goto LABEL_9;
      }
LABEL_8:
      *uint64_t v3 = 95;
      goto LABEL_9;
    }

    uint64_t result = __maskrune(v5, 0x500uLL);
    if (!(_DWORD)result) {
      goto LABEL_8;
    }
LABEL_9:
    ++v3;
    uint64_t v2 = *(unsigned __int8 *)(v1 + 23);
  }

BOOL sub_1000A35A4(uint64_t a1)
{
  int v2 = 16;
  while (1)
  {
    std::istream::tellg(__p);
    uint64_t v3 = v9;
    if (v9 < 0) {
      break;
    }
    if ((v9 & 0xF) != 0)
    {
      std::istream::read(a1, &v6, 1LL);
      if (--v2) {
        continue;
      }
    }

    return v3 >= 0;
  }

  sub_10000A2DC(__p, "ERROR");
  sub_10002A9EC(&v5, (uint64_t)__p);
  sub_10002A6A4(&std::cerr, (uint64_t)"AlignInput: Can't determine stream position", 43LL);
  sub_10002AA94(&v5);
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  return v3 >= 0;
}

void sub_1000A3690( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000A36C4(void *a1)
{
  int v2 = 16;
  while (1)
  {
    uint64_t v3 = (char *)a1 + *(void *)(*a1 - 24LL);
    if ((v3[32] & 5) != 0) {
      break;
    }
    (*(void (**)(void **__return_ptr, void, void, uint64_t, uint64_t))(**((void **)v3 + 5) + 32LL))( __p,  *((void *)v3 + 5),  0LL,  1LL,  16LL);
    if (v8 < 0) {
      break;
    }
    if ((v8 & 0xF) != 0)
    {
      std::ostream::write(a1, "", 1LL);
      if (--v2) {
        continue;
      }
    }

    return 1LL;
  }

  sub_10000A2DC(__p, "ERROR");
  sub_10002A9EC(&v5, (uint64_t)__p);
  sub_10002A6A4(&std::cerr, (uint64_t)"AlignOutput: Can't determine stream position", 44LL);
  sub_10002AA94(&v5);
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return 0LL;
}

void sub_1000A37F0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, void *__p, uint64_t a15, int a16, __int16 a17, char a18, char a19)
{
  if (a19 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000A3824(void *a1, uint64_t a2)
{
  int v2 = (char *)a1 + *(void *)(*a1 - 24LL);
  if ((v2[32] & 5) != 0)
  {
    memset(v10, 0, sizeof(v10));
    uint64_t v11 = -1LL;
LABEL_3:
    sub_10000A2DC(__p, "ERROR");
    sub_10002A9EC(&v9, (uint64_t)__p);
    sub_10002A6A4(&std::cerr, (uint64_t)"Cannot determine stream position", 32LL);
    sub_10002AA94(&v9);
    if (v8 < 0) {
      operator delete(__p[0]);
    }
    return 0xFFFFFFFFLL;
  }

  (*(void (**)(_OWORD *__return_ptr, void, void, uint64_t, uint64_t))(**((void **)v2 + 5) + 32LL))( v10,  *((void *)v2 + 5),  0LL,  1LL,  16LL);
  if (v11 == -1) {
    goto LABEL_3;
  }
  if (v11 <= 0) {
    uint64_t v3 = -(-v11 & 0xF);
  }
  else {
    uint64_t v3 = v11 & 0xF;
  }
  if ((int)v3 >= 1)
  {
    int v6 = v3;
    do
    {
      std::ostream::write(a2, "", 1LL);
      --v6;
    }

    while (v6);
  }

  return v3;
}

void sub_1000A3974( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, int a15, __int16 a16, char a17, char a18)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_1000A39A8()
{
  if (qword_1000DE770 != -1) {
    dispatch_once(&qword_1000DE770, &stru_1000D42F8);
  }
  return qword_1000DE768;
}

void sub_1000A39E8(id a1)
{
  qword_1000DE768 = (uint64_t)os_log_create("com.apple.SpeechRecognitionCore", "CMDPLogs");
}

BOOL sub_1000A3A14(uint64_t a1)
{
  uint64_t v2 = v7[16];
  LODWORD(v7[0]) = 0;
  std::istream::read(a1, v7, 4LL);
  BOOL v3 = LODWORD(v7[0]) == 2125659606;
  memset(v5, 0, sizeof(v5));
  uint64_t v6 = v2;
  std::istream::seekg(a1, v5);
  return v3;
}

uint64_t sub_1000A3AC8(uint64_t a1, void *a2, uint64_t a3, int a4)
{
  if (a4)
  {
    std::istream::tellg(v26);
    uint64_t v8 = v28;
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  int v20 = 0;
  std::istream::read(a2, &v20, 4LL);
  if (v20 != 2125659606)
  {
    sub_10000A2DC(v26, "ERROR");
    sub_10002A9EC((BOOL *)&__c, (uint64_t)v26);
    BOOL v9 = sub_10002A6A4(&std::cerr, (uint64_t)"FstHeader::Read: Bad FST header: ", 33LL);
    int v10 = *(char *)(a3 + 23);
    if (v10 >= 0) {
      uint64_t v11 = a3;
    }
    else {
      uint64_t v11 = *(void *)a3;
    }
    if (v10 >= 0) {
      uint64_t v12 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      uint64_t v12 = *(void *)(a3 + 8);
    }
    sub_10002A6A4(v9, v11, v12);
    sub_10002AA94(&__c);
    if (v27 < 0)
    {
      operator delete(v26[0]);
      if (!a4) {
        return 0LL;
      }
    }

    else if (!a4)
    {
      return 0LL;
    }

    memset(v24, 0, sizeof(v24));
    uint64_t v25 = v8;
    std::istream::seekg(a2, v24);
    return 0LL;
  }

  if (*(char *)(a1 + 31) < 0)
  {
    **(_BYTE **)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0;
    *(void *)(a1 + 16) = 0LL;
  }

  else
  {
    *(_BYTE *)(a1 + std::ostream::~ostream(v2, v3 + 8) = 0;
    *(_BYTE *)(a1 + 31) = 0;
  }

  LODWORD(v26[0]) = 0;
  std::istream::read(a2, v26, 4LL);
  if (SLODWORD(v26[0]) >= 1)
  {
    int v13 = 0;
    do
    {
      std::istream::read(a2, &__c, 1LL);
      std::string::push_back((std::string *)(a1 + 8), __c);
      ++v13;
    }

    while (v13 < SLODWORD(v26[0]));
  }

  if (*(char *)(a1 + 55) < 0)
  {
    **(_BYTE **)(a1 + 32) = 0;
    *(void *)(a1 + 40) = 0LL;
  }

  else
  {
    *(_BYTE *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 55) = 0;
  }

  LODWORD(v26[0]) = 0;
  std::istream::read(a2, v26, 4LL);
  if (SLODWORD(v26[0]) >= 1)
  {
    int v14 = 0;
    do
    {
      std::istream::read(a2, &__c, 1LL);
      std::string::push_back((std::string *)(a1 + 32), __c);
      ++v14;
    }

    while (v14 < SLODWORD(v26[0]));
  }

  std::istream::read(a2, a1 + 56, 4LL);
  std::istream::read(a2, a1 + 60, 4LL);
  std::istream::read(a2, a1 + 64, 8LL);
  std::istream::read(a2, a1 + 72, 8LL);
  std::istream::read(a2, a1 + 80, 8LL);
  std::istream::read(a2, a1 + 88, 8LL);
  if ((*((_BYTE *)a2 + *(void *)(*a2 - 24LL) + 32) & 5) != 0)
  {
    sub_10000A2DC(v26, "ERROR");
    sub_10002A9EC((BOOL *)&__c, (uint64_t)v26);
    uint64_t v15 = sub_10002A6A4(&std::cerr, (uint64_t)"FstHeader::Read: Read failed: ", 30LL);
    int v16 = *(char *)(a3 + 23);
    if (v16 >= 0) {
      uint64_t v17 = a3;
    }
    else {
      uint64_t v17 = *(void *)a3;
    }
    if (v16 >= 0) {
      uint64_t v18 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      uint64_t v18 = *(void *)(a3 + 8);
    }
    sub_10002A6A4(v15, v17, v18);
    sub_10002AA94(&__c);
    if (v27 < 0) {
      operator delete(v26[0]);
    }
    return 0LL;
  }

  if (a4)
  {
    memset(v22, 0, sizeof(v22));
    uint64_t v23 = v8;
    std::istream::seekg(a2, v22);
  }

  return 1LL;
}

void sub_1000A3E20( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, int a10, __int16 a11, char a12, char a13)
{
}

uint64_t sub_1000A3E5C(uint64_t a1, uint64_t a2)
{
  LODWORD(v13) = 2125659606;
  std::ostream::write(a2, &v13, 4LL);
  LODWORD(v4) = *(unsigned __int8 *)(a1 + 31);
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = *(void *)(a1 + 16);
  }
  LODWORD(v13) = v4;
  std::ostream::write(a2, &v13, 4LL);
  else {
    uint64_t v5 = *(void *)(a1 + 8);
  }
  std::ostream::write(a2, v5, (int)v13);
  LODWORD(v6) = *(unsigned __int8 *)(a1 + 55);
  if ((v6 & 0x80u) != 0LL) {
    uint64_t v6 = *(void *)(a1 + 40);
  }
  LODWORD(v13) = v6;
  std::ostream::write(a2, &v13, 4LL);
  int v7 = *(char *)(a1 + 55);
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v9 = a1 + 32;
  uint64_t v8 = v10;
  if (v7 >= 0) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = v8;
  }
  std::ostream::write(a2, v11, (int)v13);
  LODWORD(v13) = *(_DWORD *)(v9 + 24);
  std::ostream::write(a2, &v13, 4LL);
  LODWORD(v13) = *(_DWORD *)(v9 + 28);
  std::ostream::write(a2, &v13, 4LL);
  uint64_t v13 = *(void *)(v9 + 32);
  std::ostream::write(a2, &v13, 8LL);
  uint64_t v13 = *(void *)(v9 + 40);
  std::ostream::write(a2, &v13, 8LL);
  uint64_t v13 = *(void *)(v9 + 48);
  std::ostream::write(a2, &v13, 8LL);
  uint64_t v13 = *(void *)(v9 + 56);
  std::ostream::write(a2, &v13, 8LL);
  return 1LL;
}

uint64_t sub_1000A3FC0@<X0>(uint64_t a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  uint64_t v4 = sub_10002A6A4(&v27, (uint64_t)"fsttype: ", 10LL);
  int v5 = *(char *)(a1 + 31);
  if (v5 >= 0) {
    uint64_t v6 = a1 + 8;
  }
  else {
    uint64_t v6 = *(void *)(a1 + 8);
  }
  if (v5 >= 0) {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 31);
  }
  else {
    uint64_t v7 = *(void *)(a1 + 16);
  }
  uint64_t v8 = sub_10002A6A4(v4, v6, v7);
  uint64_t v9 = sub_10002A6A4(v8, (uint64_t)" arctype: ", 12LL);
  int v10 = *(char *)(a1 + 55);
  if (v10 >= 0) {
    uint64_t v11 = a1 + 32;
  }
  else {
    uint64_t v11 = *(void *)(a1 + 32);
  }
  if (v10 >= 0) {
    uint64_t v12 = *(unsigned __int8 *)(a1 + 55);
  }
  else {
    uint64_t v12 = *(void *)(a1 + 40);
  }
  uint64_t v13 = sub_10002A6A4(v9, v11, v12);
  int v14 = sub_10002A6A4(v13, (uint64_t)" version: ", 12LL);
  uint64_t v15 = (void *)std::ostream::operator<<(v14, *(unsigned int *)(a1 + 56));
  int v16 = sub_10002A6A4(v15, (uint64_t)" flags: ", 10LL);
  uint64_t v17 = (void *)std::ostream::operator<<(v16, *(unsigned int *)(a1 + 60));
  uint64_t v18 = sub_10002A6A4(v17, (uint64_t)" properties: ", 15LL);
  std::string v19 = (void *)std::ostream::operator<<(v18, *(void *)(a1 + 64));
  int v20 = sub_10002A6A4(v19, (uint64_t)" start: ", 10LL);
  int v21 = (void *)std::ostream::operator<<(v20, *(void *)(a1 + 72));
  uint64_t v22 = sub_10002A6A4(v21, (uint64_t)" numstates: ", 14LL);
  uint64_t v23 = (void *)std::ostream::operator<<(v22, *(void *)(a1 + 80));
  int v24 = sub_10002A6A4(v23, (uint64_t)" numarcs: ", 12LL);
  uint64_t v25 = (void *)std::ostream::operator<<(v24, *(void *)(a1 + 88));
  sub_10002A6A4(v25, (uint64_t)"", 1LL);
  std::stringbuf::str(a2, &v28);
  std::streambuf::~streambuf(&v28);
  return std::ios::~ios(&v29);
}

void sub_1000A4174(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void *sub_1000A4188(void *__dst, __int128 *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v9 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v9;
  }

  __dst[3] = a3;
  __dst[4] = a4;
  __dst[5] = a5;
  *((_WORD *)__dst + 26) = 257;
  sub_10000A2DC(__p, off_1000DDB20[0]);
  *((_DWORD *)__dst + 12) = sub_1000A4260((uint64_t)__p);
  if (v12 < 0) {
    operator delete(__p[0]);
  }
  return __dst;
}

void sub_1000A422C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A4260(uint64_t a1)
{
  if (*(char *)(a1 + 23) < 0)
  {
    uint64_t v4 = *(void *)(a1 + 8);
    if (v4 != 3)
    {
      if (v4 == 4 && **(_DWORD **)a1 == 1684104562) {
        return 0LL;
      }
      goto LABEL_15;
    }

    BOOL v3 = *(_DWORD **)a1;
  }

  else
  {
    int v2 = *(unsigned __int8 *)(a1 + 23);
    BOOL v3 = (_DWORD *)a1;
    if (v2 != 3)
    {
      if (v2 == 4 && *(_DWORD *)a1 == 1684104562) {
        return 0LL;
      }
LABEL_15:
      sub_10000A2DC(__p, "ERROR");
      sub_10002A9EC(&v15, (uint64_t)__p);
      uint64_t v8 = sub_10002A6A4(&std::cerr, (uint64_t)"Unknown file read mode ", 23LL);
      int v9 = *(char *)(a1 + 23);
      if (v9 >= 0) {
        int v10 = (_DWORD *)a1;
      }
      else {
        int v10 = *(_DWORD **)a1;
      }
      if (v9 >= 0) {
        uint64_t v11 = *(unsigned __int8 *)(a1 + 23);
      }
      else {
        uint64_t v11 = *(void *)(a1 + 8);
      }
      sub_10002A6A4(v8, (uint64_t)v10, v11);
      sub_10002AA94(&v15);
      if (v14 < 0) {
        operator delete(__p[0]);
      }
      return 0LL;
    }
  }

  int v5 = *(unsigned __int16 *)v3;
  int v6 = *((unsigned __int8 *)v3 + 2);
  if (v5 != 24941 || v6 != 112) {
    goto LABEL_15;
  }
  return 1LL;
}

void sub_1000A4384( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1000A43B4(void *__dst, __int128 *a2, uint64_t a3, uint64_t a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_10005AA70(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v7 = *a2;
    __dst[2] = *((void *)a2 + 2);
    *(_OWORD *)std::string __dst = v7;
  }

  __dst[3] = 0LL;
  __dst[4] = a3;
  __dst[5] = a4;
  *((_WORD *)__dst + 26) = 257;
  sub_10000A2DC(__p, off_1000DDB20[0]);
  *((_DWORD *)__dst + 12) = sub_1000A4260((uint64_t)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  return __dst;
}

void sub_1000A4454( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000A448C@<X0>(uint64_t a1@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  uint64_t v4 = sub_10002A6A4(&v38, (uint64_t)"source: ", 9LL);
  int v5 = *(char *)(a1 + 23);
  if (v5 >= 0) {
    uint64_t v6 = a1;
  }
  else {
    uint64_t v6 = *(void *)a1;
  }
  if (v5 >= 0) {
    uint64_t v7 = *(unsigned __int8 *)(a1 + 23);
  }
  else {
    uint64_t v7 = *(void *)(a1 + 8);
  }
  uint64_t v8 = sub_10002A6A4(v4, v6, v7);
  int v9 = sub_10002A6A4(v8, (uint64_t)" mode: ", 9LL);
  int v10 = *(_DWORD *)(a1 + 48);
  if (v10) {
    uint64_t v11 = "MAP";
  }
  else {
    uint64_t v11 = "READ";
  }
  if (v10) {
    uint64_t v12 = 3LL;
  }
  else {
    uint64_t v12 = 4LL;
  }
  uint64_t v13 = sub_10002A6A4(v9, (uint64_t)v11, v12);
  char v14 = sub_10002A6A4(v13, (uint64_t)" read_isymbols: ", 18LL);
  if (*(_BYTE *)(a1 + 52)) {
    uint64_t v15 = "true";
  }
  else {
    uint64_t v15 = "false";
  }
  if (*(_BYTE *)(a1 + 52)) {
    uint64_t v16 = 4LL;
  }
  else {
    uint64_t v16 = 5LL;
  }
  uint64_t v17 = sub_10002A6A4(v14, (uint64_t)v15, v16);
  uint64_t v18 = sub_10002A6A4(v17, (uint64_t)" read_osymbols: ", 18LL);
  if (*(_BYTE *)(a1 + 53)) {
    std::string v19 = "true";
  }
  else {
    std::string v19 = "false";
  }
  if (*(_BYTE *)(a1 + 53)) {
    uint64_t v20 = 4LL;
  }
  else {
    uint64_t v20 = 5LL;
  }
  int v21 = sub_10002A6A4(v18, (uint64_t)v19, v20);
  uint64_t v22 = sub_10002A6A4(v21, (uint64_t)" header: ", 11LL);
  uint64_t v23 = *(void *)(a1 + 24);
  if (v23) {
    int v24 = "set";
  }
  else {
    int v24 = "null";
  }
  if (v23) {
    uint64_t v25 = 3LL;
  }
  else {
    uint64_t v25 = 4LL;
  }
  int v26 = sub_10002A6A4(v22, (uint64_t)v24, v25);
  uint64_t v27 = sub_10002A6A4(v26, (uint64_t)" isymbols: ", 13LL);
  uint64_t v28 = *(void *)(a1 + 32);
  if (v28) {
    uint64_t v29 = "set";
  }
  else {
    uint64_t v29 = "null";
  }
  if (v28) {
    uint64_t v30 = 3LL;
  }
  else {
    uint64_t v30 = 4LL;
  }
  BOOL v31 = sub_10002A6A4(v27, (uint64_t)v29, v30);
  uint64_t v32 = sub_10002A6A4(v31, (uint64_t)" osymbols: ", 13LL);
  uint64_t v33 = *(void *)(a1 + 40);
  if (v33) {
    uint64_t v34 = "set";
  }
  else {
    uint64_t v34 = "null";
  }
  if (v33) {
    uint64_t v35 = 3LL;
  }
  else {
    uint64_t v35 = 4LL;
  }
  uint64_t v36 = sub_10002A6A4(v32, (uint64_t)v34, v35);
  sub_10002A6A4(v36, (uint64_t)"", 1LL);
  std::stringbuf::str(a2, &v39);
  std::streambuf::~streambuf(&v39);
  return std::ios::~ios(&v40);
}

void sub_1000A469C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_1000A46B0(unint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a1 & 0x248000000003LL;
  if (a3) {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = a1 & 0x10200010004LL | (((a1 >> 33) & 1) << 47) | v3;
  if ((a1 & 0x10000000000LL) != 0 || (a3 & 1) == 0)
  {
    v4 |= a1 & 0x4A01A02A0000LL;
    if ((~a1 & 0x50100000000LL) == 0) {
      return v4 | 0x400000000000LL;
    }
  }

  return v4;
}

uint64_t sub_1000A4710(uint64_t a1)
{
  uint64_t v1 = 0x8106AA950000LL;
  if ((a1 & 0x10000000000LL) == 0) {
    uint64_t v1 = 0x81020A950000LL;
  }
  return v1 | a1 & 0x1050000004LL;
}

uint64_t sub_1000A4740(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (a2 | a1) & 4;
  uint64_t v3 = a2 & a1;
  uint64_t v4 = a2 & a1 & 0x2802010000LL | v2 | 0x10000000000LL;
  uint64_t v5 = v3 & 0x280A800000LL | v2 | 0x10000010000LL;
  if ((v3 & 0x2000000) != 0) {
    v5 |= v3 & 0x140000;
  }
  if ((v3 & 0x10000) != 0) {
    return v5;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000A47AC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2 & 0x208000000000LL | a1 & 0x20B000000003LL;
  if (a3) {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = (a2 | a1) & 4 | a1 & a2 & 0x800A00010000LL | v3;
  else {
    uint64_t v5 = a1 & 0x4A05A56A0000LL;
  }
  uint64_t v6 = v4 | v5;
  if ((~a1 & 0x50000000000LL) != 0) {
    int v7 = 1;
  }
  else {
    int v7 = a3;
  }
  if (v7) {
    uint64_t v8 = 0LL;
  }
  else {
    uint64_t v8 = a2 & 0x4F05A56A0000LL;
  }
  return v6 | v8;
}

uint64_t sub_1000A4834(unint64_t a1, int a2, int a3)
{
  if ((a1 & 0x10000) != 0
    || ((a1 & 0x2000000) == 0 ? (char v3 = a2 ^ 1) : (char v3 = 0), (v4 = 0x10000000000LL, (v3 & 1) == 0) && a3))
  {
    uint64_t v4 = 0x10000040000LL;
  }

  uint64_t v5 = (a1 >> 25) & 1;
  uint64_t v6 = a1 & 0x800000;
  uint64_t v7 = a1 & ((uint64_t)(a1 << 23) >> 63) & 0x405000000LL | a1 & 0x142800010004LL | a1 & ((int)((_DWORD)a1 << 15) >> 31) & 0xA000000 | v6 | v4;
  else {
    return v7;
  }
}

uint64_t sub_1000A48BC(uint64_t a1)
{
  uint64_t v1 = 0x50CA56B0007LL;
  if ((a1 & 0x10000000000LL) == 0) {
    uint64_t v1 = 0x50800010007LL;
  }
  return v1 & a1;
}

unint64_t sub_1000A48E4(unint64_t a1)
{
  return a1 & 0xFFFF00C30007LL | (((a1 >> 18) & 3) << 20) & 0xFFFFFFFF33FFFFFFLL | (a1 >> 2) & 0xC0000 | (((a1 >> 24) & 3) << 26) & 0xFFFFFFFF3FFFFFFFLL | (a1 >> 2) & 0x3000000 | (((a1 >> 28) & 3) << 30) | (a1 >> 2) & 0x30000000;
}

uint64_t sub_1000A492C(unint64_t a1, int a2)
{
  uint64_t v2 = a1 & 0xFFFF00000007LL | 0x10000;
  uint64_t v3 = (a1 >> 2) & 0xC0000 | a1 & 0xCC300000 | v2;
  if ((a1 & 0x4000000) != 0) {
    v3 |= 0x1400000uLL;
  }
  if ((a1 & 0x8000000) != 0) {
    v3 |= 0x2800000uLL;
  }
  uint64_t v4 = (a1 >> 2) & 0x30000000 | v3;
  uint64_t v5 = a1 & 0x330C0000 | (((a1 >> 18) & 3) << 20) | v2;
  if ((a1 & 0x1000000) != 0) {
    v5 |= 0x4400000uLL;
  }
  if ((a1 & 0x2000000) != 0) {
    v5 |= 0x8800000uLL;
  }
  unint64_t v6 = (4 * (_DWORD)a1) & 0xC0000000 | (unint64_t)v5;
  if (a2) {
    return v6;
  }
  else {
    return v4;
  }
}

uint64_t sub_1000A49C4(int a1, int a2)
{
  if (a2) {
    return a1 & 0x5A950004 | 0x816800000000LL;
  }
  else {
    return a1 & 0x50010004 | 0x812A00000000LL;
  }
}

uint64_t sub_1000A49F8( uint64_t **a1, uint64_t a2, int a3, int a4, int a5, char a6, int a7, int a8, char a9, char a10, unsigned __int8 a11)
{
  uint64_t v11 = *a1;
  uint64_t v12 = a1[1];
  if (*a1 == v12) {
    return 0x956A5A950000LL;
  }
  uint64_t v13 = 0LL;
  char v14 = *a1;
  do
  {
    uint64_t v15 = *v14++;
    v13 |= v15 & 4;
  }

  while (v14 != v12);
  uint64_t v16 = 0x50000000000LL;
  if (!a8) {
    uint64_t v16 = 0LL;
  }
  uint64_t v17 = *a1;
  do
  {
    uint64_t v18 = *v17++;
    v16 &= v18;
  }

  while (v17 != v12);
  if (v16 == 0x50000000000LL)
  {
    uint64_t v19 = 0LL;
    LOBYTE(v20) = 1;
    int v21 = *a1;
    do
    {
      uint64_t v23 = *v21++;
      uint64_t v22 = v23;
      uint64_t v24 = v23 & 0x20000;
      if (!a7) {
        uint64_t v24 = 0LL;
      }
      v19 |= v22 & 0x608505680000LL | v24;
      int v20 = ((v22 & 0x100000000000LL) != 0) & v20;
    }

    while (v21 != v12);
    BOOL v25 = v20 == 0;
    uint64_t v26 = 0x50000000000LL;
    if (!v25) {
      uint64_t v26 = 0x150000000000LL;
    }
    v13 |= v11[a2] & 0x1000000000LL | v19 | v26;
  }

  char v27 = a3 ^ 1;
  unint64_t v28 = v12 - v11;
  int v29 = (a3 | a4) ^ 1;
  int v30 = (a3 ^ 1) & a4;
  LOBYTE(v31) = a7 ^ 1;
  if (v28 <= 1) {
    uint64_t v32 = 1LL;
  }
  else {
    uint64_t v32 = v28;
  }
  LOBYTE(v33) = 1;
  uint64_t v34 = (unint64_t *)v11;
  uint64_t v35 = a2;
  LOBYTE(v36) = 1;
  do
  {
    unint64_t v37 = *v34++;
    int v31 = BYTE2(v37) & 1 & v31;
    uint64_t v38 = (v37 >> 18) & 1;
    uint64_t v39 = (v37 >> 25) & 1;
    v29 &= v39;
    int v36 = ((v37 & 0x800000000LL) != 0) & v36;
    int v33 = ((v37 & 0x200000000LL) != 0) & v33;
    if (v35) {
      int v40 = v39;
    }
    else {
      int v40 = 1;
    }
    v30 &= v40 & v38;
    --v35;
    --v32;
  }

  while (v32);
  if (v31) {
    v13 |= 0x10000uLL;
  }
  if (v30) {
    v13 |= 0x40000uLL;
  }
  if (v29) {
    v13 |= 0x2000000uLL;
  }
  if (v36) {
    v13 |= 0x800000000uLL;
  }
  if (v33) {
    v13 |= 0x200000000uLL;
  }
  uint64_t v41 = v11[a2] & 0x2000000000LL | v13;
  else {
    return v41;
  }
}

uint64_t sub_1000A4BC8(uint64_t a1)
{
  return a1 & 0xFFFF00000007LL;
}

uint64_t sub_1000A4BD4(uint64_t a1, int a2)
{
  uint64_t v2 = 0xC00E05430007LL;
  if (a2) {
    uint64_t v2 = 0xC00F05430007LL;
  }
  return v2 & a1;
}

uint64_t sub_1000A4BFC(uint64_t a1)
{
  return a1 & 0x3BFCFFFF0007LL;
}

uint64_t sub_1000A4C10(uint64_t a1, int a2)
{
  uint64_t v2 = 176160768LL;
  if ((a1 & 0x10000) == 0) {
    uint64_t v2 = 0x800000LL;
  }
  uint64_t v3 = v2 | a1 & 0x2800010004LL;
  if (!a2) {
    v3 |= a1 & 0x4000000000LL | 3;
  }
  else {
    uint64_t v4 = a1 & 0x20000;
  }
  return v3 | v4;
}

uint64_t sub_1000A4C64(uint64_t a1, int a2)
{
  uint64_t v2 = 0x852800000000LL;
  if (a2) {
    uint64_t v2 = 0x812800000000LL;
  }
  return v2 | a1;
}

uint64_t sub_1000A4C7C(uint64_t a1)
{
  uint64_t v1 = 0xCD0F00010004LL;
  if ((a1 & 0x10000000000LL) == 0) {
    uint64_t v1 = 0x850A00010004LL;
  }
  return v1 & a1;
}

uint64_t sub_1000A4CA4(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = a2 & 0x8000000000LL | a1 & 0x8000000003LL;
  if (a3) {
    uint64_t v3 = 0LL;
  }
  uint64_t v4 = a2 & a1 & 0x40000000000LL | 0x5400000 | a2 & a1 & 0x810A00010000LL | (a2 | a1) & 4 | v3 | 0x2000000000LL;
  if (a3) {
    uint64_t v4 = a2 & a1 & 0x810A00010000LL | (a2 | a1) & 4 | v3 | 0x2000000000LL;
  }
  else {
    uint64_t v5 = a1 & 0x4205A56A0000LL;
  }
  else {
    uint64_t v6 = a2 & 0x4A05A56A0000LL;
  }
  return v6 | v5 | v4;
}

void sub_1000A4D38()
{
  __assert_rtn("RDQSRSoundSource_block_invoke", "RDQSRSoundSource.cc", 183, "queueAttributes != NULL");
}

void sub_1000A4D68(void *a1)
{
}

void sub_1000A4DCC()
{
}

void sub_1000A4E38(_xpc_connection_s *a1)
{
  uint64_t v2 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = xpc_connection_get_pid(a1);
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "peer(%d) killed me", (uint8_t *)v3, 8u);
  }

  abort();
}

void sub_1000A4EB8()
{
  __assert_rtn("speechrecognitiond_new_peer_event_handler", "main.cpp", 203, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000A4EE0()
{
  __assert_rtn("speechrecognitiond_peer_event_handler", "main.cpp", 117, "type == XPC_TYPE_DICTIONARY");
}

void sub_1000A4F08()
{
  unsigned __int8 v0 = (os_log_s *)RXOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "RDASRWSpeechRecognizerCreate return nil!", v1, 2u);
  }

  abort();
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

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__addRecordedSpeechSampleData_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addRecordedSpeechSampleData:length:");
}

id objc_msgSend__assetPathForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetPathForLanguage:error:");
}

id objc_msgSend__assetQueryForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_assetQueryForLanguage:");
}

id objc_msgSend__cancelDownloadForLangaugeWithError_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelDownloadForLangaugeWithError:withError:");
}

id objc_msgSend__cancelDownloadForLanguageWithError_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cancelDownloadForLanguageWithError:withError:");
}

id objc_msgSend__didReceiveSiriSettingChanged_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveSiriSettingChanged:");
}

id objc_msgSend__downloadStatusDescription(void *a1, const char *a2, ...)
{
  return _[a1 _downloadStatusDescription];
}

id objc_msgSend__drainAndClearAudioConverter(void *a1, const char *a2, ...)
{
  return _[a1 _drainAndClearAudioConverter];
}

id objc_msgSend__endAllDownloadsForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endAllDownloadsForLanguage:");
}

id objc_msgSend__errorStringForCancelDownloadResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForCancelDownloadResult:");
}

id objc_msgSend__errorStringForDownloadResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForDownloadResult:");
}

id objc_msgSend__errorStringForPurgeResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForPurgeResult:");
}

id objc_msgSend__errorStringForQueryResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_errorStringForQueryResult:");
}

id objc_msgSend__es_compareByVersion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_compareByVersion:");
}

id objc_msgSend__es_contentVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_contentVersion");
}

id objc_msgSend__es_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_description");
}

id objc_msgSend__es_isCompatibleWithThisDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isCompatibleWithThisDevice");
}

id objc_msgSend__es_isDownloading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isDownloading");
}

id objc_msgSend__es_isInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_isInstalled");
}

id objc_msgSend__es_language(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_language");
}

id objc_msgSend__es_masteredVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_masteredVersion");
}

id objc_msgSend__es_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_path");
}

id objc_msgSend__es_quasarDir(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_quasarDir");
}

id objc_msgSend__es_quasarModelPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_quasarModelPath");
}

id objc_msgSend__es_requiredCapabilityIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_requiredCapabilityIdentifier");
}

id objc_msgSend__es_status(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_es_status");
}

id objc_msgSend__fetchContactsWithKeepGoing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchContactsWithKeepGoing:");
}

id objc_msgSend__handleSpeechDetectionVADPresentChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleSpeechDetectionVADPresentChange:");
}

id objc_msgSend__initWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithLanguage:");
}

id objc_msgSend__installedAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedAssetForLanguage:error:");
}

id objc_msgSend__installedAssetFromFoundAssets_language_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedAssetFromFoundAssets:language:error:");
}

id objc_msgSend__installedLocalAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_installedLocalAssetForLanguage:error:");
}

id objc_msgSend__isActiveDownloadForLanguage_downloadId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isActiveDownloadForLanguage:downloadId:");
}

id objc_msgSend__isDownloadingForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDownloadingForLanguage:");
}

id objc_msgSend__isDownloadingStalledForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDownloadingStalledForLanguage:");
}

id objc_msgSend__languagesWithDownloadAttempts(void *a1, const char *a2, ...)
{
  return _[a1 _languagesWithDownloadAttempts];
}

id objc_msgSend__queryAndCopyInstallationStatusForLanguagesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryAndCopyInstallationStatusForLanguagesWithError:");
}

id objc_msgSend__resumeStalledDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resumeStalledDownloadForLanguage:");
}

id objc_msgSend__sendCallback(void *a1, const char *a2, ...)
{
  return _[a1 _sendCallback];
}

id objc_msgSend__sendDownloadCallbackDictionaryWithLanguage_downloadPhase_timeRemaining_bytesWritten_bytesTotal_error_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "_sendDownloadCallbackDictionaryWithLanguage:downloadPhase:timeRemaining:bytesWritten:bytesTotal:error:");
}

id objc_msgSend__sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendMessageToClient:");
}

id objc_msgSend__speechDonation(void *a1, const char *a2, ...)
{
  return _[a1 _speechDonation];
}

id objc_msgSend__stalledDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stalledDownloadForLanguage:");
}

id objc_msgSend__startDownloadForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startDownloadForLanguage:");
}

id objc_msgSend__startObservingSpeechClientsActive(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSpeechClientsActive];
}

id objc_msgSend__startObservingSpeechDetectionVADPresence(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSpeechDetectionVADPresence];
}

id objc_msgSend__startObservingSystemControllerLifecycle(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingSystemControllerLifecycle];
}

id objc_msgSend__startedDownloadingEmbeddedSpeechAsset_withUrgency_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startedDownloadingEmbeddedSpeechAsset:withUrgency:error:");
}

id objc_msgSend__startedUrgentDownloadingEmbeddedSpeechAssetForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startedUrgentDownloadingEmbeddedSpeechAssetForLanguage:error:");
}

id objc_msgSend__stopObservingSpeechClientsActive(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingSpeechClientsActive];
}

id objc_msgSend__waitAndFinishSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 _waitAndFinishSpeaking];
}

id objc_msgSend_activateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 activateNotifications];
}

id objc_msgSend_activeConfigurationForEverything(void *a1, const char *a2, ...)
{
  return _[a1 activeConfigurationForEverything];
}

id objc_msgSend_adaptUserProfileWithUserData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adaptUserProfileWithUserData:");
}

id objc_msgSend_addAudio_numSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudio:numSamples:");
}

id objc_msgSend_addAudioSamplesWithAudio_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAudioSamplesWithAudio:");
}

id objc_msgSend_addKeyValuePair_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addKeyValuePair:with:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addPeerForCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPeerForCallback:");
}

id objc_msgSend_addPhraseToUserProfileWithTemplateName_wordTag_phrase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addPhraseToUserProfileWithTemplateName:wordTag:phrase:");
}

id objc_msgSend_addWordWithParts_templateName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addWordWithParts:templateName:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attachAnalysisContextWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachAnalysisContextWithCompletionHandler:");
}

id objc_msgSend_attachProgressCallBack_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachProgressCallBack:");
}

id objc_msgSend_attachTranscriberWithTask_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachTranscriberWithTask:completionHandler:");
}

id objc_msgSend_attributeForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeForKey:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_audioEngine(void *a1, const char *a2, ...)
{
  return _[a1 audioEngine];
}

id objc_msgSend_audioPCMBuffers(void *a1, const char *a2, ...)
{
  return _[a1 audioPCMBuffers];
}

id objc_msgSend_audioSessionSetupCompleted(void *a1, const char *a2, ...)
{
  return _[a1 audioSessionSetupCompleted];
}

id objc_msgSend_avIndependenRouteSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 avIndependenRouteSoundInput];
}

id objc_msgSend_avSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 avSoundInput];
}

id objc_msgSend_availableInputs(void *a1, const char *a2, ...)
{
  return _[a1 availableInputs];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cancelDownloadForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadForLanguage:error:");
}

id objc_msgSend_cancelDownloadSync(void *a1, const char *a2, ...)
{
  return _[a1 cancelDownloadSync];
}

id objc_msgSend_cancelRecognition(void *a1, const char *a2, ...)
{
  return _[a1 cancelRecognition];
}

id objc_msgSend_catalogDownloadInProgress(void *a1, const char *a2, ...)
{
  return _[a1 catalogDownloadInProgress];
}

id objc_msgSend_channelCount(void *a1, const char *a2, ...)
{
  return _[a1 channelCount];
}

id objc_msgSend_commandTaggingFromRecognitionResult_activeCommands_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandTaggingFromRecognitionResult:activeCommands:");
}

id objc_msgSend_commonFormat(void *a1, const char *a2, ...)
{
  return _[a1 commonFormat];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_compare_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:options:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_contactsWords(void *a1, const char *a2, ...)
{
  return _[a1 contactsWords];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_convertRawAudiotoPCM_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRawAudiotoPCM:count:");
}

id objc_msgSend_convertToBuffer_error_withInputFromBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertToBuffer:error:withInputFromBlock:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyInstallationStatusForLangaugesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstallationStatusForLangaugesWithError:");
}

id objc_msgSend_copyInstalledAssetPathForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetPathForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledAssetPropertiesForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetPropertiesForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledAssetSupportedTasksForLangaugeWithError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledAssetSupportedTasksForLangaugeWithError:error:");
}

id objc_msgSend_copyInstalledQuasarModelPathForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyInstalledQuasarModelPathForLanguage:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createCaesuraSPG(void *a1, const char *a2, ...)
{
  return _[a1 createCaesuraSPG];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createRecognitionBufferWithDelegate_task_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createRecognitionBufferWithDelegate:task:");
}

id objc_msgSend_csSoundInput(void *a1, const char *a2, ...)
{
  return _[a1 csSoundInput];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentTask(void *a1, const char *a2, ...)
{
  return _[a1 currentTask];
}

id objc_msgSend_dataProfile(void *a1, const char *a2, ...)
{
  return _[a1 dataProfile];
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivateNotifications(void *a1, const char *a2, ...)
{
  return _[a1 deactivateNotifications];
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodePropertyListForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodePropertyListForKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultOption(void *a1, const char *a2, ...)
{
  return _[a1 defaultOption];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_donateWithAudioBuffers_logAudioFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "donateWithAudioBuffers:logAudioFile:");
}

id objc_msgSend_donorBundleID(void *a1, const char *a2, ...)
{
  return _[a1 donorBundleID];
}

id objc_msgSend_donorReferenceID(void *a1, const char *a2, ...)
{
  return _[a1 donorReferenceID];
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAudio(void *a1, const char *a2, ...)
{
  return _[a1 endAudio];
}

id objc_msgSend_enumerateContactsWithFetchRequest_error_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateContactsWithFetchRequest:error:usingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateVocabularyUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateVocabularyUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_expectedTimeRemaining(void *a1, const char *a2, ...)
{
  return _[a1 expectedTimeRemaining];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fetchAssetsForLanguage_urgent_forceUpgrade_detailedProgress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsForLanguage:urgent:forceUpgrade:detailedProgress:completion:");
}

id objc_msgSend_fetchAssetsForLanguage_urgent_progress_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsForLanguage:urgent:progress:completion:");
}

id objc_msgSend_fetchUserDataWithLanguage_keepGoing_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchUserDataWithLanguage:keepGoing:completion:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return _[a1 format];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return _[a1 frameLength];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return _[a1 frequency];
}

id objc_msgSend_getJitProfileData(void *a1, const char *a2, ...)
{
  return _[a1 getJitProfileData];
}

id objc_msgSend_getLocalUrl(void *a1, const char *a2, ...)
{
  return _[a1 getLocalUrl];
}

id objc_msgSend_getUserProfileData(void *a1, const char *a2, ...)
{
  return _[a1 getUserProfileData];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSpaceAfter(void *a1, const char *a2, ...)
{
  return _[a1 hasSpaceAfter];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForWriting_settings_commonFormat_interleaved_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForWriting:settings:commonFormat:interleaved:error:");
}

id objc_msgSend_initFromFormat_toFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFromFormat:toFormat:");
}

id objc_msgSend_initWithBundleID_donorReferenceID_locale_taskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:donorReferenceID:locale:taskHint:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithConfigFile_samplingRate_queue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfigFile:samplingRate:queue:");
}

id objc_msgSend_initWithConfiguration_language_overrides_sdapiOverrides_emptyVoc_pgVoc_paramsetHolder_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:language:overrides:sdapiOverrides:emptyVoc:pgVoc:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_language_sdapiOverrides_generalVoc_emptyVoc_pgVoc_lexiconEnh_tokenEnh_paramsetHolder_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithConfiguration:language:sdapiOverrides:generalVoc:emptyVoc:pgVoc:lexiconEnh:tokenEnh:paramsetHolder:");
}

id objc_msgSend_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn_( void *a1, const char *a2, ...)
{
  return _objc_msgSend( a1,  "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSp eakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:");
}

id objc_msgSend_initWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentsOfFile:options:error:");
}

id objc_msgSend_initWithDelegate_locale_highPriority_farField_supportEmojiRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:locale:highPriority:farField:supportEmojiRecognition:");
}

id objc_msgSend_initWithDeliverSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDeliverSamples:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithDonorBundleID_donorReferenceID_recordingDate_locale_taskHint_transcription_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDonorBundleID:donorReferenceID:recordingDate:locale:taskHint:transcription:");
}

id objc_msgSend_initWithExpectedFormat_deliverSamples_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExpectedFormat:deliverSamples:");
}

id objc_msgSend_initWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKeysToFetch:");
}

id objc_msgSend_initWithLanguage_assetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLanguage:assetPath:");
}

id objc_msgSend_initWithLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocale:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithName_options_queue_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:options:queue:delegate:");
}

id objc_msgSend_initWithOrthography_pronunciations_tag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tag:");
}

id objc_msgSend_initWithOrthography_pronunciations_tagName_frequency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithOrthography:pronunciations:tagName:frequency:");
}

id objc_msgSend_initWithPCMFormat_frameCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPCMFormat:frameCapacity:");
}

id objc_msgSend_initWithStream_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStream:");
}

id objc_msgSend_initWithStreamDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStreamDescription:");
}

id objc_msgSend_initWithSwiftSpeechAnalyzer_task_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSwiftSpeechAnalyzer:task:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_inputFormat(void *a1, const char *a2, ...)
{
  return _[a1 inputFormat];
}

id objc_msgSend_inputFormatForBus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputFormatForBus:");
}

id objc_msgSend_inputNode(void *a1, const char *a2, ...)
{
  return _[a1 inputNode];
}

id objc_msgSend_installTapOnBus_bufferSize_format_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installTapOnBus:bufferSize:format:block:");
}

id objc_msgSend_installedLanguages(void *a1, const char *a2, ...)
{
  return _[a1 installedLanguages];
}

id objc_msgSend_installedLanguagesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "installedLanguagesWithCompletion:");
}

id objc_msgSend_int16ChannelData(void *a1, const char *a2, ...)
{
  return _[a1 int16ChannelData];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_interpretationIndices(void *a1, const char *a2, ...)
{
  return _[a1 interpretationIndices];
}

id objc_msgSend_isCSVADHidden(void *a1, const char *a2, ...)
{
  return _[a1 isCSVADHidden];
}

id objc_msgSend_isCSVADPresent(void *a1, const char *a2, ...)
{
  return _[a1 isCSVADPresent];
}

id objc_msgSend_isCallActive(void *a1, const char *a2, ...)
{
  return _[a1 isCallActive];
}

id objc_msgSend_isCarPlayActive(void *a1, const char *a2, ...)
{
  return _[a1 isCarPlayActive];
}

id objc_msgSend_isCommandPhraseTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCommandPhraseTag:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHearstConnected(void *a1, const char *a2, ...)
{
  return _[a1 isHearstConnected];
}

id objc_msgSend_isInterleaved(void *a1, const char *a2, ...)
{
  return _[a1 isInterleaved];
}

id objc_msgSend_isParameterTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isParameterTag:");
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return _[a1 isRecording];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return _[a1 isRunning];
}

id objc_msgSend_isSpeaking(void *a1, const char *a2, ...)
{
  return _[a1 isSpeaking];
}

id objc_msgSend_isStalled(void *a1, const char *a2, ...)
{
  return _[a1 isStalled];
}

id objc_msgSend_isSystemSleeping(void *a1, const char *a2, ...)
{
  return _[a1 isSystemSleeping];
}

id objc_msgSend_jitProfileData(void *a1, const char *a2, ...)
{
  return _[a1 jitProfileData];
}

id objc_msgSend_kickCatalogDownloadWithUrgency_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "kickCatalogDownloadWithUrgency:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _[a1 locale];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mapDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapDelegate:");
}

id objc_msgSend_maximumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return _[a1 maximumSupportedConfigurationVersion];
}

id objc_msgSend_middleName(void *a1, const char *a2, ...)
{
  return _[a1 middleName];
}

id objc_msgSend_minimumSupportedConfigurationVersion(void *a1, const char *a2, ...)
{
  return _[a1 minimumSupportedConfigurationVersion];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nBestResults(void *a1, const char *a2, ...)
{
  return _[a1 nBestResults];
}

id objc_msgSend_newUtteranceBegins(void *a1, const char *a2, ...)
{
  return _[a1 newUtteranceBegins];
}

id objc_msgSend_nickname(void *a1, const char *a2, ...)
{
  return _[a1 nickname];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_pathForResource_ofType_inDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pathForResource:ofType:inDirectory:");
}

id objc_msgSend_peersRequestingDownloadProgress(void *a1, const char *a2, ...)
{
  return _[a1 peersRequestingDownloadProgress];
}

id objc_msgSend_personNameComponentsFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personNameComponentsFromString:");
}

id objc_msgSend_preITNRecognition(void *a1, const char *a2, ...)
{
  return _[a1 preITNRecognition];
}

id objc_msgSend_preferDecoupledIO_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferDecoupledIO:error:");
}

id objc_msgSend_preferredRouteControlConfig(void *a1, const char *a2, ...)
{
  return _[a1 preferredRouteControlConfig];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_pronunciationsForOrthography_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pronunciationsForOrthography:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_purge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purge:");
}

id objc_msgSend_purgeAssetsForLanguage_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeAssetsForLanguage:error:");
}

id objc_msgSend_purgeInstalledAssetsWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purgeInstalledAssetsWithError:");
}

id objc_msgSend_purgeSync(void *a1, const char *a2, ...)
{
  return _[a1 purgeSync];
}

id objc_msgSend_queryAndCopyInstallationStatusForLangaugesWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryAndCopyInstallationStatusForLangaugesWithError:");
}

id objc_msgSend_queryMetaData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryMetaData:");
}

id objc_msgSend_queryMetaDataSync(void *a1, const char *a2, ...)
{
  return _[a1 queryMetaDataSync];
}

id objc_msgSend_readUserProfile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readUserProfile:");
}

id objc_msgSend_readUserProfileFromCache(void *a1, const char *a2, ...)
{
  return _[a1 readUserProfileFromCache];
}

id objc_msgSend_recognition(void *a1, const char *a2, ...)
{
  return _[a1 recognition];
}

id objc_msgSend_recognitionBuffer(void *a1, const char *a2, ...)
{
  return _[a1 recognitionBuffer];
}

id objc_msgSend_recognitionDelegate(void *a1, const char *a2, ...)
{
  return _[a1 recognitionDelegate];
}

id objc_msgSend_recognizer(void *a1, const char *a2, ...)
{
  return _[a1 recognizer];
}

id objc_msgSend_recordingStartDate(void *a1, const char *a2, ...)
{
  return _[a1 recordingStartDate];
}

id objc_msgSend_refreshState(void *a1, const char *a2, ...)
{
  return _[a1 refreshState];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePeerFromCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePeerFromCallback:");
}

id objc_msgSend_removeTapOnBus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTapOnBus:");
}

id objc_msgSend_requestAccessForEntityType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestAccessForEntityType:completionHandler:");
}

id objc_msgSend_requestedLanguagesForDownload(void *a1, const char *a2, ...)
{
  return _[a1 requestedLanguagesForDownload];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return _[a1 results];
}

id objc_msgSend_returnTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "returnTypes:");
}

id objc_msgSend_routeControlOptions(void *a1, const char *a2, ...)
{
  return _[a1 routeControlOptions];
}

id objc_msgSend_runRecognitionWithResultStream_language_task_samplingRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runRecognitionWithResultStream:language:task:samplingRate:");
}

id objc_msgSend_sanitizedStringWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sanitizedStringWithString:");
}

id objc_msgSend_sendCallback(void *a1, const char *a2, ...)
{
  return _[a1 sendCallback];
}

id objc_msgSend_sendLiveRecordingOffNotificationWithInterrupt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendLiveRecordingOffNotificationWithInterrupt:");
}

id objc_msgSend_sendLiveRecordingOnNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendLiveRecordingOnNotification];
}

id objc_msgSend_sendMessageToClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendMessageToClient:");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return _[a1 server];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setActive_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:error:");
}

id objc_msgSend_setActive_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:withOptions:error:");
}

id objc_msgSend_setAllowHapticsAndSystemSoundsDuringRecording_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowHapticsAndSystemSoundsDuringRecording:error:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAssetPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetPath:");
}

id objc_msgSend_setAssetsPurgeability_forLanguages_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetsPurgeability:forLanguages:error:");
}

id objc_msgSend_setAttribute_forKey_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttribute:forKey:error:");
}

id objc_msgSend_setAudioHardwareControlFlags_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioHardwareControlFlags:error:");
}

id objc_msgSend_setAudioPCMBuffers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioPCMBuffers:");
}

id objc_msgSend_setCatalogDownloadInProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCatalogDownloadInProgress:");
}

id objc_msgSend_setCategory_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCategory:withOptions:error:");
}

id objc_msgSend_setConfidence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfidence:");
}

id objc_msgSend_setContextWithJitProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextWithJitProfileData:");
}

id objc_msgSend_setContextWithUserProfileData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextWithUserProfileData:");
}

id objc_msgSend_setCurrentTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTask:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDoNotBlockBeforeFirstUnlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockBeforeFirstUnlock:");
}

id objc_msgSend_setDoNotBlockOnNetworkStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoNotBlockOnNetworkStatus:");
}

id objc_msgSend_setDonorBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonorBundleID:");
}

id objc_msgSend_setDonorReferenceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDonorReferenceID:");
}

id objc_msgSend_setEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnd:");
}

id objc_msgSend_setFrameLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrameLength:");
}

id objc_msgSend_setHasSpaceAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSpaceAfter:");
}

id objc_msgSend_setHasSpaceBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasSpaceBefore:");
}

id objc_msgSend_setIpaPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIpaPhoneSequence:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMXSessionProperty_value_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMXSessionProperty:value:error:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPeersRequestingDownloadProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPeersRequestingDownloadProgress:");
}

id objc_msgSend_setPhoneSequence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPhoneSequence:");
}

id objc_msgSend_setPreferredRouteControlConfig_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredRouteControlConfig:error:");
}

id objc_msgSend_setPrefersNoMicrophoneUsageIndicator_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersNoMicrophoneUsageIndicator:error:");
}

id objc_msgSend_setPurgeabilityForLanguages_withPurgeability_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPurgeabilityForLanguages:withPurgeability:error:");
}

id objc_msgSend_setRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRate:");
}

id objc_msgSend_setRecognitionBuffer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionBuffer:");
}

id objc_msgSend_setRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacements:");
}

id objc_msgSend_setRecognitionReplacementsWithUseRecognitionReplacements_completionHandler_( void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognitionReplacementsWithUseRecognitionReplacements:completionHandler:");
}

id objc_msgSend_setRecognizeEmoji_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizeEmoji:");
}

id objc_msgSend_setRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizer:");
}

id objc_msgSend_setRecordingStartDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecordingStartDate:");
}

id objc_msgSend_setRequestedLanguagesForDownload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequestedLanguagesForDownload:");
}

id objc_msgSend_setRequiresPowerPluggedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresPowerPluggedIn:");
}

id objc_msgSend_setRouteControlOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRouteControlOptions:");
}

id objc_msgSend_setSampleRateConverterQuality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSampleRateConverterQuality:");
}

id objc_msgSend_setSilenceStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSilenceStart:");
}

id objc_msgSend_setStart_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStart:");
}

id objc_msgSend_setSwiftSpeechAnalyzer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSwiftSpeechAnalyzer:");
}

id objc_msgSend_setTaskHint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskHint:");
}

id objc_msgSend_setTextWithLeftContextText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextWithLeftContextText:");
}

id objc_msgSend_setTokenName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTokenName:");
}

id objc_msgSend_setUseRecognitionReplacements_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseRecognitionReplacements:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVoice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVoice:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_set_speechDonation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set_speechDonation:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupAudioSession(void *a1, const char *a2, ...)
{
  return _[a1 setupAudioSession];
}

id objc_msgSend_setupDefaultAudioSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDefaultAudioSession:");
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return _[a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_silenceDurationMs(void *a1, const char *a2, ...)
{
  return _[a1 silenceDurationMs];
}

id objc_msgSend_silenceProbability(void *a1, const char *a2, ...)
{
  return _[a1 silenceProbability];
}

id objc_msgSend_spaceCheck_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "spaceCheck:");
}

id objc_msgSend_speechAnalyzerAudioBuffer(void *a1, const char *a2, ...)
{
  return _[a1 speechAnalyzerAudioBuffer];
}

id objc_msgSend_speechUtteranceWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "speechUtteranceWithString:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_startAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAndReturnError:");
}

id objc_msgSend_startCatalogDownload_options_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startCatalogDownload:options:then:");
}

id objc_msgSend_startDownload_then_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDownload:then:");
}

id objc_msgSend_startListenWithOption_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListenWithOption:completion:");
}

id objc_msgSend_startRecognition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecognition:");
}

id objc_msgSend_startRecognitionWithTranscriberModuleWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecognitionWithTranscriberModuleWrapper:");
}

id objc_msgSend_startRecording(void *a1, const char *a2, ...)
{
  return _[a1 startRecording];
}

id objc_msgSend_startRecording_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecording:");
}

id objc_msgSend_startRunningAudioEngine(void *a1, const char *a2, ...)
{
  return _[a1 startRunningAudioEngine];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return _[a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _[a1 stop];
}

id objc_msgSend_stopListenWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopListenWithCompletion:");
}

id objc_msgSend_stopRecording(void *a1, const char *a2, ...)
{
  return _[a1 stopRecording];
}

id objc_msgSend_stopRunningAudioEngine(void *a1, const char *a2, ...)
{
  return _[a1 stopRunningAudioEngine];
}

id objc_msgSend_stringArrayForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringArrayForKey:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_swiftSpeechAnalyzer(void *a1, const char *a2, ...)
{
  return _[a1 swiftSpeechAnalyzer];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_taskHint(void *a1, const char *a2, ...)
{
  return _[a1 taskHint];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tokenSausage(void *a1, const char *a2, ...)
{
  return _[a1 tokenSausage];
}

id objc_msgSend_tokens(void *a1, const char *a2, ...)
{
  return _[a1 tokens];
}

id objc_msgSend_totalExpected(void *a1, const char *a2, ...)
{
  return _[a1 totalExpected];
}

id objc_msgSend_totalWritten(void *a1, const char *a2, ...)
{
  return _[a1 totalWritten];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateUserProfileWithPersonalData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserProfileWithPersonalData:");
}

id objc_msgSend_useRecognitionReplacements(void *a1, const char *a2, ...)
{
  return _[a1 useRecognitionReplacements];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userProfileData(void *a1, const char *a2, ...)
{
  return _[a1 userProfileData];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_voiceWithLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "voiceWithLanguage:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:options:error:");
}

id objc_msgSend_writeUtterance_toBufferCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeUtterance:toBufferCallback:");
}