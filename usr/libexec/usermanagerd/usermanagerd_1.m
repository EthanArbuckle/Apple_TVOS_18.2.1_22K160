uint64_t sub_1000990C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  _OWORD __s[2];
  memset(__s, 0, sizeof(__s));
  v12 = 32;
  if (*(void *)a1)
  {
    v10 = 4294967284LL;
  }

  else
  {
    v8 = ccsha256_di(a1);
    v9 = sub_100095EF4((uint64_t)__s, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, (void *)(a1 + 24), 0x28u, (void *)a4, &v12);
    if ((_DWORD)v9)
    {
      v10 = v9;
      goto LABEL_8;
    }

    if (v12 != 32)
    {
LABEL_9:
      v10 = 4294967286LL;
    }

    else
    {
      cccurve25519_make_pub(a4 + 32, a4);
      else {
        v10 = 0LL;
      }
    }
  }

uint64_t sub_100099200(int a1, unsigned int a2, unsigned int a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v12 = 3758097098LL;
  bzero(v18, 0x1000uLL);
  *(void *)&__int128 v16 = v18;
  *((void *)&v16 + 1) = &v19;
  mach_port_t v13 = sub_100096240();
  if (v13)
  {
    mach_port_t v14 = v13;
    if (sub_1000A7840(&v16, a6)
      && ccder_blob_encode_tl(&v16, 0x2000000000000010LL, (char *)&v19 - *((void *)&v16 + 1)))
    {
      input[0] = a1;
      input[1] = a2;
      input[2] = a4;
      input[3] = a5;
      input[4] = a3;
      input[5] = *((void *)&v16 + 1);
      input[6] = (uint64_t)&v19 - *((void *)&v16 + 1);
      return IOConnectCallMethod(v14, 0x21u, input, 7u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_create_for_bag_and_kek",  ":",  50,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return v12;
}

uint64_t sub_1000993A8(int a1, unsigned int a2, uint64_t a3, int a4)
{
  v5[0] = 0LL;
  v5[1] = 0LL;
  return sub_100099200(a1, a2, 0, a3, a4, v5);
}

uint64_t sub_1000993D8(int a1)
{
  return sub_1000993E4(a1, 0, 0LL);
}

uint64_t sub_1000993E4(int a1, unsigned int a2, BOOL *a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v6, 0x22u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (!(_DWORD)result)
    {
      uint64_t result = 0LL;
      if (a3) {
        *a3 = output != 0;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_aks_stash_load",  ":",  77,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_100099504(int a1, _BYTE *a2)
{
  BOOL v4 = 0;
  if (!a2) {
    return sub_1000993E4(a1, 1u, &v4);
  }
  *a2 = 0;
  uint64_t result = sub_1000993E4(a1, 1u, &v4);
  if (!(_DWORD)result) {
    *a2 = v4;
  }
  return result;
}

uint64_t sub_10009955C()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x25u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_destroy",  ":",  125,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_100099600(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0x24u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_commit",  ":",  138,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1000996E4(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0x33u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_enable",  ":",  154,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1000997C8(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0x35u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_stash_persist",  ":",  170,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1000998AC(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1634431856) {
    return 0xFFFFFFFFLL;
  }
  free(a1[1]);
  free(a1);
  return 0LL;
}

uint64_t sub_100099904(int a1, uint64_t a2, unint64_t a3, int a4, void *a5)
{
  mach_port_t v14 = 0LL;
  if (!a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  if (sub_100099A08(a4, &v14) || (v9 = calloc(0x20uLL, 1uLL)) == 0LL)
  {
    uint64_t v12 = 0xFFFFFFFFLL;
  }

  else
  {
    v10 = v9;
    int v11 = sub_100099AE8((uint64_t)v14, a2, a3, (uint64_t)v9);
    uint64_t v12 = 0xFFFFFFFFLL;
    if (a3 <= 0x7FFFFFFE && !v11 && !sub_100099B88(a1, a2, a3, (uint64_t)v10, (uint64_t)v14))
    {
      uint64_t v12 = 0LL;
      if (a5)
      {
        *a5 = v14;
        mach_port_t v14 = 0LL;
      }
    }

    memset_s(v10, 0x20uLL, 0, 0x20uLL);
    free(v10);
  }

  if (v14) {
    sub_1000998AC(v14);
  }
  return v12;
}

uint64_t sub_100099A08(int a1, void *a2)
{
  mach_port_t v6 = calloc(0x20uLL, 1uLL);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  v7 = v6;
  *((void *)v6 + 2) = 20LL;
  v8 = calloc(0x14uLL, 1uLL);
  *((void *)v7 + 1) = v8;
  if (!v8)
  {
LABEL_19:
    free(v7);
    return 0xFFFFFFFFLL;
  }

  _DWORD *v7 = 1634431856;
  v7[6] = a1;
  uint64_t result = CCRandomCopyBytes(kCCRandomDefault, v8, *((void *)v7 + 2));
  if ((_DWORD)result)
  {
    v10 = (void *)*((void *)v7 + 1);
    if (v10) {
      free(v10);
    }
    goto LABEL_19;
  }

  if (a1 == 3) {
    int v9 = 2000;
  }
  else {
    int v9 = 10000000;
  }
  if (a1 == 2) {
    int v9 = 1000;
  }
  v7[1] = v9;
  *a2 = v7;
  return result;
}

uint64_t sub_100099AE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1 != 1634431856 || !a2 && a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (a4 && (*(_DWORD *)(a1 + 24) - 4) >= 0xFFFFFFFD)
  {
    uint64_t v9 = ccsha256_di(0xFFFFFFFFLL);
    if (ccpbkdf2_hmac( v9,  a3,  a2,  *(void *)(a1 + 16),  *(void *)(a1 + 8),  *(unsigned int *)(a1 + 4),  32LL,  a4)) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100099B88(int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  rsize_t __n = 0LL;
  __s = 0LL;
  uint64_t v10 = 3758097090LL;
  mach_port_t v14 = 0LL;
  if ((a2 || !a3) && a4 && a5)
  {
    mach_port_t v11 = sub_100096240();
    if (v11)
    {
      mach_port_t v12 = v11;
      if (!sub_1000A6CB0(&v14, (uint64_t)off_1000DB548, *(void *)(a5 + 8), *(void *)(a5 + 16))
        && !sub_1000A6CB0(&v14, (uint64_t)off_1000DB540, a4, 32LL)
        && !sub_1000A706C(&v14, (uint64_t)off_1000DB550, *(unsigned int *)(a5 + 4))
        && !sub_1000A706C(&v14, (uint64_t)off_1000DB558, *(unsigned int *)(a5 + 24))
        && (a3 < 1 || !sub_1000A6CB0(&v14, (uint64_t)off_1000DB210, a2, a3))
        && !sub_1000A7590(&v14)
        && !sub_1000A6970(&v14, &__s, &__n))
      {
        input[0] = a1;
        input[1] = (uint64_t)__s;
        uint64_t input[2] = __n;
        uint64_t v10 = IOConnectCallMethod(v12, 0x1Eu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_set_prederived_configuration",  ":",  218,  "",  0,  "",  "");
      uint64_t v10 = 3758097084LL;
    }
  }

  sub_1000A62A0(&v14);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  return v10;
}

uint64_t sub_100099DB0(int a1, uint64_t *a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t result = (uint64_t)calloc(0x20uLL, 1uLL);
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  *(_DWORD *)uint64_t result = 1634431856;
  mach_port_t v6 = sub_100096240();
  if (!v6)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_get_prederived_configuration",  ":",  384,  "",  0,  "",  "");
LABEL_16:
    sub_1000998AC((void **)v5);
    return 0LL;
  }

  mach_port_t v7 = v6;
  bzero(outputStruct, 0x8000uLL);
  size_t v19 = 0x8000LL;
  uint64_t input = a1;
  if (IOConnectCallMethod(v7, 0x1Fu, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v19) || v19 > 0x8000) {
    goto LABEL_16;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  uint64_t v9 = &outputStruct[v19];
  __int128 v22 = 0u;
  __int128 v24 = 0u;
  uint64_t v25 = 0LL;
  __int128 v21 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  v20 = off_1000DB548;
  __int128 v23 = (unint64_t)off_1000DB550;
  v26 = off_1000DB558;
  __int128 v16 = xmmword_1000AEE90;
  uint64_t v17 = 0LL;
  v18 = &v20;
  sub_1000A5D94( (uint64_t)outputStruct,  (uint64_t)&outputStruct[v19],  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v16);
  uint64_t v10 = *((void *)&v23 + 1);
  uint64_t v11 = v27;
  uint64_t v12 = ccder_decode_tl(4LL, v5 + 16, v21, v9);
  if (v12)
  {
    mach_port_t v13 = (const void *)v12;
    mach_port_t v14 = calloc(*(void *)(v5 + 16), 1uLL);
    *(void *)(v5 + 8) = v14;
    if (!v14)
    {
      int v15 = 0;
      if (!Mutable) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }

    memcpy(v14, v13, *(void *)(v5 + 16));
    *(_DWORD *)(v5 + 4) = sub_1000A5FAC(v10, (uint64_t)v9);
    *(_DWORD *)(v5 + 24) = sub_1000A5FAC(v11, (uint64_t)v9);
  }

  int v15 = 1;
  if (Mutable) {
LABEL_10:
  }
    CFRelease(Mutable);
LABEL_11:
  if (!v15 || !*(void *)(v5 + 16)) {
    goto LABEL_16;
  }
  *a2 = v5;
  return 1LL;
}

uint64_t sub_10009A070(int a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  BOOL v5 = v4 || a4 == 0LL;
  else {
    uint64_t v7 = sub_10009A138(a1, (uint64_t)v9, 32);
  }
  memset_s(v9, 0x20uLL, 0, 0x20uLL);
  return v7;
}

uint64_t sub_10009A138(int a1, uint64_t a2, int a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    return IOConnectCallMethod(v6, 0xCu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_bag",  ":",  807,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009A234(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t *a6)
{
  __int128 v16 = 0LL;
  if (!a6) {
    goto LABEL_17;
  }
  uint64_t v7 = *a6;
  if (!*a6 || *(_DWORD *)v7 != 1634431856 || !a2 && a3) {
    goto LABEL_17;
  }
  int v11 = sub_100099A08(*(_DWORD *)(v7 + 24), &v16);
  uint64_t v12 = v16;
  if (v11 || (v13 = sub_100099AE8((uint64_t)v16, a4, a5, (uint64_t)v17), uint64_t v12 = v16, v13))
  {
LABEL_15:
    if (v12) {
      sub_1000998AC(v12);
    }
LABEL_17:
    uint64_t v14 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }

  if (sub_100099B88(a1, (uint64_t)__s, 32, (uint64_t)v17, (uint64_t)v16))
  {
    uint64_t v12 = v16;
    goto LABEL_15;
  }

  sub_1000998AC((void **)v7);
  uint64_t v14 = 0LL;
  *a6 = (uint64_t)v16;
LABEL_13:
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v17, 0x20uLL, 0, 0x20uLL);
  return v14;
}

uint64_t sub_10009A394(uint64_t a1, int a2, unsigned int a3, _DWORD *a4)
{
  return sub_10009A3AC(a1, a2, 0LL, 0, a3, -1, a4);
}

uint64_t sub_10009A3AC(uint64_t a1, int a2, uint64_t a3, int a4, unsigned int a5, int a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_100096240();
  if (v15)
  {
    if (a7)
    {
      input[0] = a5;
      input[1] = a6;
      uint64_t input[2] = a1;
      uint64_t input[3] = a2;
      input[4] = a3;
      input[5] = a4;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      uint64_t v14 = IOConnectCallMethod(v15, 2u, input, 6u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v14) {
        *a7 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_create_bag",  ":",  187,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_10009A500(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_10009A3AC(a1, a2, 0LL, 0, 2u, a3, a4);
}

uint64_t sub_10009A518(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_10009A3AC(a3, a4, a1, a2, 2u, a5, a6);
}

uint64_t sub_10009A540(uint64_t a1, int a2, int a3, _DWORD *a4)
{
  return sub_10009A3AC(a1, a2, 0LL, 0, 0x8000002u, a3, a4);
}

uint64_t sub_10009A55C(uint64_t a1, int a2, uint64_t a3, int a4, int a5, _DWORD *a6)
{
  return sub_10009A3AC(a3, a4, a1, a2, 0x8000002u, a5, a6);
}

uint64_t sub_10009A588()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x42u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_invalidate_sync_bags",  ":",  544,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009A62C(const void *a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    if (a1)
    {
      input[0] = a5;
      input[1] = a3;
      uint64_t input[2] = a4;
      return IOConnectCallMethod(v11, 0x43u, input, 3u, a1, a2, 0LL, 0LL, 0LL, 0LL);
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_with_sync_bag",  ":",  557,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_10009A74C(const void *a1, int a2, _DWORD *a3)
{
  uint64_t v6 = 3758097084LL;
  mach_port_t v7 = sub_100096240();
  if (v7)
  {
    uint64_t v6 = 3758097090LL;
    if (a1)
    {
      if (a3)
      {
        uint64_t output = 0LL;
        uint32_t outputCnt = 1;
        uint64_t v6 = IOConnectCallMethod(v7, 6u, 0LL, 0, a1, a2, &output, &outputCnt, 0LL, 0LL);
        if (!(_DWORD)v6) {
          *a3 = output;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_load_bag",  ":",  574,  "",  0,  "",  "");
  }

  return v6;
}

uint64_t sub_10009A864(const void *a1, int a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a1) {
      return IOConnectCallMethod(v5, 0x57u, 0LL, 0, a1, a2, 0LL, 0LL, 0LL, 0LL);
    }
    return 3758097090LL;
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_invalidate_bag",  ":",  596,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009A930(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 4u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unload_bag",  ":",  612,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009AA14(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0x37u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unload_session_bags",  ":",  629,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009AAF8(int a1, void *a2, _DWORD *a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (a2)
    {
      if (a3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        uint64_t input = a1;
        uint64_t result = IOConnectCallMethod(v7, 3u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          uint64_t v9 = calloc(__count, 1uLL);
          *a2 = v9;
          if (v9)
          {
            memcpy(v9, __src, __count);
            uint64_t result = 0LL;
            *a3 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_save_bag",  ":",  646,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_10009AC80( int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, unsigned int a12, _DWORD *a13)
{
  mach_port_t v21 = sub_100096240();
  if (v21)
  {
    input[0] = a1;
    input[1] = a11;
    uint64_t input[2] = a10;
    uint64_t input[3] = a2;
    input[4] = a3;
    input[5] = a4;
    uint64_t input[6] = a5;
    uint64_t input[7] = a6;
    input[8] = a7;
    input[9] = a8;
    input[10] = a9;
    input[11] = a12;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v21, 0xFu, input, 0xCu, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (a13)
    {
      if (!(_DWORD)result) {
        *a13 = output;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_change_secret_opts",  ":",  678,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_10009ADF0( int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, unsigned __int8 a10, unsigned int a11, _DWORD *a12)
{
  return sub_10009AC80(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0, a12);
}

uint64_t sub_10009AE14(int a1, uint64_t a2, int a3, uint64_t a4, int a5, unsigned int a6, _DWORD *a7)
{
  return sub_10009AC80(a1, a2, a3, a4, a5, 0LL, 0, 0LL, 0, 0xFFu, a6, 0, a7);
}

uint64_t sub_10009AE50(int a1, _OWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  size_t v7 = 16LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      __int128 outputStruct = 0uLL;
      uint64_t input = a1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x17u, &input, 1u, 0LL, 0LL, 0LL, 0LL, &outputStruct, &v7);
      if (!(_DWORD)v4) {
        *a2 = outputStruct;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_bag_uuid",  ":",  729,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009AF74(int a1, void *a2, size_t *a3)
{
  return sub_10009AF88(a1, (uint64_t)&unk_1000AEEE0, a2, a3);
}

uint64_t sub_10009AF88(int a1, uint64_t a2, void *a3, size_t *a4)
{
  __int16 v23 = 0;
  memset(__src, 0, sizeof(__src));
  size_t __count = 34LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v8 = sub_100096240();
  if (v8)
  {
    uint64_t v14 = 3758097090LL;
    if (a3 && a4)
    {
      mach_port_t v15 = v8;
      uint64_t input = a1;
      sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 1, v9, v10, v11, v12, v13, a2);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v16 = IOConnectCallMethod( v15,  0x44u,  &input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
        if ((_DWORD)v16)
        {
          uint64_t v14 = v16;
        }

        else
        {
          uint64_t v17 = calloc(__count, 1uLL);
          *a3 = v17;
          uint64_t v14 = 3758097085LL;
          if (v17)
          {
            memcpy(v17, __src, __count);
            uint64_t v14 = 0LL;
            *a4 = __count;
          }
        }
      }

      else
      {
        uint64_t v14 = 3758097085LL;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_copy_volume_cookie_persona",  ":",  760,  "",  0,  "",  "");
    uint64_t v14 = 3758097084LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v14;
}

uint64_t sub_10009B134(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0xDu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_bag",  ":",  790,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009B218(int a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      uint64_t input = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 7u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_lock_state",  ":",  824,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009B330(const void *a1, int a2, int a3, int a4, void *a5, int *a6, _DWORD *a7)
{
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_100096240();
  if (v15)
  {
    uint64_t v14 = 3758097090LL;
    if (a1 && a5 && a6)
    {
      input[0] = a4;
      input[1] = a3;
      uint64_t output = 0LL;
      uint32_t outputCnt = 1;
      size_t v18 = *a6;
      uint64_t v16 = IOConnectCallMethod(v15, 0xAu, input, 2u, a1, a2, &output, &outputCnt, a5, &v18);
      if ((_DWORD)v16)
      {
        return v16;
      }

      else
      {
        *a6 = v18;
        uint64_t v14 = 0LL;
        if (a7) {
          *a7 = output;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_wrap_key",  ":",  848,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_10009B498(const void *a1, int a2, int a3, int a4, void *a5, int *a6)
{
  uint64_t v12 = 3758097084LL;
  mach_port_t v13 = sub_100096240();
  if (v13)
  {
    uint64_t v12 = 3758097090LL;
    if (a1)
    {
      if (a5)
      {
        if (a6)
        {
          input[0] = a4;
          input[1] = a3;
          size_t v15 = *a6;
          uint64_t v12 = IOConnectCallMethod(v13, 0xBu, input, 2u, a1, a2, 0LL, 0LL, a5, &v15);
          if (!(_DWORD)v12) {
            *a6 = v15;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unwrap_key",  ":",  877,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_10009B5DC(const void *a1, int a2, int a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v14 = 3758097084LL;
  mach_port_t v15 = sub_100096240();
  if (v15)
  {
    uint64_t v14 = 3758097090LL;
    if (a1 && a7)
    {
      input[0] = a3;
      input[1] = a4;
      uint64_t input[2] = a5;
      uint64_t input[3] = a6;
      size_t v17 = 108LL;
      return IOConnectCallMethod(v15, 0x18u, input, 4u, a1, a2, 0LL, 0LL, a7, &v17);
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_rewrap_key_for_backup",  ":",  901,  "",  0,  "",  "");
  }

  return v14;
}

uint64_t sub_10009B71C(int a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      uint64_t input = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0xEu, &input, a1 != 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_system",  ":",  922,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009B838(int a1, int a2, uint64_t a3, int a4)
{
  mach_port_t v8 = sub_100096240();
  if (v8)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(v8, 5u, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_system_with_passcode",  ":",  950,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009B93C(int a1, int a2)
{
  return sub_10009B838(a1, a2, 0LL, 0);
}

uint64_t sub_10009B948(int a1, uint64_t a2, unsigned int a3)
{
  return sub_10009B968(a1, a2, a3);
}

uint64_t sub_10009B95C(int a1, uint64_t a2, unsigned int a3)
{
  return sub_10009B968(a1, a2, a3);
}

uint64_t sub_10009B968(int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v7 = sub_100096240();
  if (v7)
  {
    mach_port_t v13 = v7;
    input[0] = a1;
    input[1] = a3;
    sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 3, v8, v9, v10, v11, v12, a2);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v6 = IOConnectCallMethod( v13,  0x41u,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  0LL,  0LL);
      uint64_t v14 = *(void **)&inputStructCnt[1];
    }

    else
    {
      uint64_t v14 = 0LL;
      uint64_t v6 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_keybag_for_volume_with_cookie_persona",  ":",  987,  "",  0,  "",  "");
    uint64_t v14 = 0LL;
  }

  free(v14);
  return v6;
}

uint64_t sub_10009BAD0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  uint64_t v10 = 3758097085LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    mach_port_t v17 = v11;
    input[0] = a2;
    input[1] = a3;
    sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a1);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod( v17,  0x6Eu,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
      if ((_DWORD)v18)
      {
        uint64_t v10 = v18;
      }

      else
      {
        size_t v19 = calloc(__count, 1uLL);
        *a4 = v19;
        if (v19)
        {
          memcpy(v19, __src, __count);
          uint64_t v10 = 0LL;
          *a5 = __count;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_enable_volume",  ":",  1014,  "",  0,  "",  "");
    uint64_t v10 = 3758097084LL;
  }

  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_10009BC80(uint64_t a1)
{
  uint64_t v2 = 3758097084LL;
  uint64_t v13 = 0LL;
  int v12 = 0;
  mach_port_t v3 = sub_100096240();
  if (v3)
  {
    mach_port_t v9 = v3;
    sub_1000A9930(&v13, (unsigned int *)&v12, 1, v4, v5, v6, v7, v8, a1);
    if (v13)
    {
      uint64_t v2 = IOConnectCallMethod(v9, 0x6Fu, 0LL, 0, v13, v12, 0LL, 0LL, 0LL, 0LL);
      uint64_t v10 = v13;
    }

    else
    {
      uint64_t v10 = 0LL;
      uint64_t v2 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_disable_volume",  ":",  1044,  "",  0,  "",  "");
    uint64_t v10 = 0LL;
  }

  free(v10);
  return v2;
}

uint64_t sub_10009BD84(uint64_t a1, void *a2)
{
  uint64_t v4 = 3758097084LL;
  uint64_t v16 = 0LL;
  int v15 = 0;
  size_t v14 = 16LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    mach_port_t v11 = v5;
    sub_1000A9930(&v16, (unsigned int *)&v15, 1, v6, v7, v8, v9, v10, a1);
    if (v16)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x70u, 0LL, 0, v16, v15, 0LL, 0LL, a2, &v14);
      int v12 = v16;
    }

    else
    {
      int v12 = 0LL;
      uint64_t v4 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_copy_current_bag_uuid",  ":",  1066,  "",  0,  "",  "");
    int v12 = 0LL;
  }

  free(v12);
  return v4;
}

uint64_t sub_10009BE98(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, void *a7)
{
  uint64_t v13 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v14 = sub_100096240();
  if (v14)
  {
    mach_port_t v20 = v14;
    mach_port_t v21 = 0LL;
    uint64_t v13 = 3758097090LL;
    if (a2 && a7)
    {
      input[0] = a4;
      input[1] = a5;
      uint64_t input[2] = a6;
      sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 2, v15, v16, v17, v18, v19, a1);
      size_t v23 = 108LL;
      uint64_t v13 = IOConnectCallMethod( v20,  0x71u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  a7,  &v23);
      mach_port_t v21 = *(void **)&inputStructCnt[1];
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_rewrap_key",  ":",  1087,  "",  0,  "",  "");
    mach_port_t v21 = 0LL;
  }

  free(v21);
  return v13;
}

uint64_t sub_10009C018( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, void *outputStruct)
{
  uint64_t v15 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v16 = sub_100096240();
  if (v16)
  {
    mach_port_t v22 = v16;
    size_t v23 = 0LL;
    uint64_t v15 = 3758097090LL;
    if (a2 && a4 && outputStruct)
    {
      input[0] = a6;
      input[1] = a7;
      uint64_t input[2] = a8;
      sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 3, v17, v18, v19, v20, v21, a1);
      size_t v25 = 108LL;
      uint64_t v15 = IOConnectCallMethod( v22,  0x71u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  outputStruct,  &v25);
      size_t v23 = *(void **)&inputStructCnt[1];
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_backup_rewrap_ek",  ":",  1113,  "",  0,  "",  "");
    size_t v23 = 0LL;
  }

  free(v23);
  return v15;
}

uint64_t sub_10009C1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 __s = 0u;
  __int128 v16 = 0u;
  uint64_t v14 = 0LL;
  memset(v13, 0, sizeof(v13));
  uint64_t v8 = sub_100098EB8(a1, a2, v13);
  if ((_DWORD)v8)
  {
    uint64_t v9 = v8;
  }

  else
  {
    uint64_t v9 = sub_1000990C8((uint64_t)v13, a3, a4, (uint64_t)&__s);
    if (!(_DWORD)v9)
    {
      __int128 v10 = v16;
      *a5 = __s;
      a5[1] = v10;
      __int128 v11 = v18;
      a5[2] = v17;
      a5[3] = v11;
    }
  }

  memset_s(v13, 0x58uLL, 0, 0x58uLL);
  memset_s(&__s, 0x40uLL, 0, 0x40uLL);
  return sub_1000A5088(v9);
}

uint64_t sub_10009C298(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v7 = 0LL;
  memset(v6, 0, sizeof(v6));
  uint64_t v4 = sub_100098EB8(a1, a2, v6);
  if (!(_DWORD)v4) {
    uuid_copy(a3, (const unsigned __int8 *)v6 + 8);
  }
  memset_s(v6, 0x58uLL, 0, 0x58uLL);
  return sub_1000A5088(v4);
}

uint64_t sub_10009C340(__int128 *a1, void *a2, unsigned int a3, void *a4, void *a5)
{
  __int128 v6 = a1[1];
  __int128 v12 = *a1;
  __int128 v13 = v6;
  __int128 v7 = a1[3];
  __int128 v14 = a1[2];
  __int128 v15 = v7;
  unsigned int v10 = *a5;
  int __s = 1;
  uint64_t v8 = sub_1000A56B4((uint64_t)&__s, 0LL, 0, a2, a3, a4, &v10);
  *a5 = v10;
  memset_s(&__s, 0x44uLL, 0, 0x44uLL);
  return sub_1000A5088(v8);
}

uint64_t sub_10009C3FC(uint64_t a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    uint64_t v10 = 3758097090LL;
    if (a2 && a4)
    {
      input[0] = a1;
      input[1] = 64LL;
      return IOConnectCallMethod(v11, 0x82u, input, 2u, a2, a3, 0LL, 0LL, a4, a5);
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_unwrap_key",  ":",  1193,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_10009C514(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t v10 = 3758097084LL;
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    uint64_t v10 = 3758097090LL;
    if (a2 && a4)
    {
      uint64_t input = a1;
      return IOConnectCallMethod(v11, 0x81u, &input, 1u, a2, a3, 0LL, 0LL, a4, a5);
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_wrap_key",  ":",  1212,  "",  0,  "",  "");
  }

  return v10;
}

uint64_t sub_10009C62C(int a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      uint64_t input = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x83u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_get_handle",  ":",  1231,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009C744(int a1, unsigned __int8 *a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      uint64_t v10 = 0LL;
      uint64_t input = a1;
      size_t v8 = 16LL;
      *(void *)src = 0LL;
      uint64_t v6 = IOConnectCallMethod(v5, 0x84u, &input, 1u, 0LL, 0LL, 0LL, 0LL, src, &v8);
      if ((_DWORD)v6)
      {
        return v6;
      }

      else if (v8 == 16)
      {
        uuid_copy(a2, src);
        return 0LL;
      }

      else
      {
        return 3758604298LL;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_get_uuid",  ":",  1253,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009C888(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, _OWORD *a6)
{
  __int128 v17 = 0LL;
  if (a5)
  {
    int v7 = a4;
    int v9 = a2;
    *a5 = -1;
    int v11 = sub_10009C1AC((uint64_t)a1, a2, a3, a4, a6);
    if (!v11)
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s Unwrapped DER backup bag%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1302,  "",  0,  "",  "");
      uint64_t v15 = 0LL;
      goto LABEL_9;
    }

    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unwrap backup bag as DER: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1290,  "",  0,  "",  v11,  "");
    uint64_t v12 = sub_10009A74C(a1, v9, a5);
    if ((_DWORD)v12)
    {
      uint64_t v15 = v12;
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to load in-kernel backup bag: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":",  1292,  "",  0,  "",  v12,  "");
    }

    else
    {
      int v13 = sub_100099DB0(*a5, (uint64_t *)&v17);
      int v14 = *a5;
      if (v13)
      {
        uint64_t v15 = sub_10009A070(v14, a3, v7, v17);
        if (!(_DWORD)v15) {
          goto LABEL_9;
        }
        fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag with prederived secret: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":");
      }

      else
      {
        uint64_t v15 = sub_10009A138(v14, a3, v7);
        if (!(_DWORD)v15) {
          goto LABEL_9;
        }
        fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s Failed to unlock in-kernel backup bag: 0x%08x%s\n",  "aks",  "",  "",  "",  "aks_kc_backup_open_keybag",  ":");
      }
    }
  }

  else
  {
    uint64_t v15 = 3758097090LL;
  }

  if (*a5 != -1)
  {
    sub_10009A930(*a5);
    *a5 = -1;
  }

LABEL_9:
  sub_1000998AC(v17);
  return v15;
}

  memset_s(__s, v6, 0, v6);
  return v3;
}

uint64_t sub_10009CAB4(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = 3758097084LL;
  uint64_t v19 = 0LL;
  int v18 = 0;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    mach_port_t v15 = v9;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    sub_1000A9930(&v19, (unsigned int *)&v18, 1, v10, v11, v12, v13, v14, a4);
    if (v19)
    {
      uint64_t v8 = IOConnectCallMethod(v15, 0x60u, input, 3u, v19, v18, 0LL, 0LL, 0LL, 0LL);
      __int128 v16 = v19;
    }

    else
    {
      __int128 v16 = 0LL;
      uint64_t v8 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_create",  ":",  1324,  "",  0,  "",  "");
    __int128 v16 = 0LL;
  }

  free(v16);
  return v8;
}

uint64_t sub_10009CC04(int a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5)
{
  uint64_t v10 = 3758097084LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    mach_port_t v17 = v11;
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a5;
    sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 1, v12, v13, v14, v15, v16, a4);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v10 = IOConnectCallMethod( v17,  0x75u,  input,  4u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  0LL,  0LL);
      int v18 = *(void **)&inputStructCnt[1];
    }

    else
    {
      int v18 = 0LL;
      uint64_t v10 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_create_with_flags",  ":",  1346,  "",  0,  "",  "");
    int v18 = 0LL;
  }

  free(v18);
  return v10;
}

uint64_t sub_10009CD64(int a1, void *a2, size_t *a3)
{
  size_t __count = 0x2000LL;
  uint64_t input = a1;
  uint64_t v6 = 3758097090LL;
  if (a2 && a3)
  {
    mach_port_t v7 = sub_100096240();
    if (v7)
    {
      uint64_t v8 = IOConnectCallMethod(v7, 0x61u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v8)
      {
        uint64_t v6 = v8;
      }

      else
      {
        if (__count)
        {
          mach_port_t v9 = calloc(__count, 1uLL);
          *a2 = v9;
          if (!v9)
          {
            uint64_t v6 = 3758097085LL;
            goto LABEL_10;
          }

          memcpy(v9, __src, __count);
          size_t v10 = __count;
        }

        else
        {
          size_t v10 = 0LL;
          *a2 = 0LL;
        }

        uint64_t v6 = 0LL;
        *a3 = v10;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_list",  ":",  1372,  "",  0,  "",  "");
      uint64_t v6 = 3758097084LL;
    }
  }

uint64_t sub_10009CF0C(int a1, uint64_t a2)
{
  uint64_t v4 = 3758097084LL;
  uint64_t v15 = 0LL;
  int v14 = 0;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    mach_port_t v11 = v5;
    uint64_t input = a1;
    sub_1000A9930(&v15, (unsigned int *)&v14, 1, v6, v7, v8, v9, v10, a2);
    if (v15)
    {
      uint64_t v4 = IOConnectCallMethod(v11, 0x62u, &input, 1u, v15, v14, 0LL, 0LL, 0LL, 0LL);
      uint64_t v12 = v15;
    }

    else
    {
      uint64_t v12 = 0LL;
      uint64_t v4 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_keybag_persona_delete",  ":",  1394,  "",  0,  "",  "");
    uint64_t v12 = 0LL;
  }

  free(v12);
  return v4;
}

uint64_t sub_10009D048(int a1, uint64_t a2, int a3, unsigned int a4, void *a5, size_t *a6)
{
  uint64_t v12 = 3758097084LL;
  mach_port_t v13 = sub_100096240();
  if (v13)
  {
    uint64_t v12 = 3758097090LL;
    if (a5 && a6)
    {
      input[0] = a1;
      input[1] = a4;
      uint64_t input[2] = a2;
      uint64_t input[3] = a3;
      return IOConnectCallMethod(v13, 0x26u, input, 4u, 0LL, 0LL, 0LL, 0LL, a5, a6);
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_auth_token_create",  ":",  1415,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_10009D178(int a1, uint64_t a2, int a3, const __CFDictionary *a4)
{
  rsize_t __n = 0LL;
  int __s = 0LL;
  uint64_t v8 = 3758097090LL;
  uint64_t v21 = 0LL;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    mach_port_t v10 = v9;
    CFTypeID TypeID = CFNumberGetTypeID();
    if (!sub_10009D4B0(a4, @"GracePeriod", TypeID, (uint64_t)off_1000DB368, &v21))
    {
      CFTypeID v12 = CFNumberGetTypeID();
      if (!sub_10009D4B0(a4, @"BackOffDelay", v12, (uint64_t)off_1000DB370, &v21))
      {
        CFTypeID v13 = CFNumberGetTypeID();
        if (!sub_10009D4B0(a4, @"MaxUnlockAttempts", v13, (uint64_t)off_1000DB378, &v21))
        {
          CFTypeID v14 = CFNumberGetTypeID();
          if (!sub_10009D4B0(a4, @"EscrowPasscodePeriod", v14, (uint64_t)off_1000DB380, &v21))
          {
            CFTypeID v15 = CFNumberGetTypeID();
            if (!sub_10009D4B0(a4, @"EscrowTokenPeriod", v15, (uint64_t)off_1000DB388, &v21))
            {
              CFTypeID v16 = CFDataGetTypeID();
              if (!sub_10009D4B0(a4, @"UserUUID", v16, (uint64_t)off_1000DB570, &v21))
              {
                CFTypeID v17 = CFDataGetTypeID();
                if (!sub_10009D4B0(a4, @"BindKEKToKB", v17, (uint64_t)off_1000DB5B0, &v21))
                {
                  CFTypeID v18 = CFBooleanGetTypeID();
                  if (!sub_10009D4B0( a4,  @"InactivityRebootEnabled",  v18,  (uint64_t)off_1000DB788,  &v21))
                  {
                    CFTypeID v19 = CFBooleanGetTypeID();
                    if (!sub_10009D4B0( a4,  @"OnenessAutomaticMode",  v19,  (uint64_t)off_1000DB790,  &v21)
                      && !sub_1000A7590(&v21)
                      && (!a2 || !sub_1000A6CB0(&v21, (uint64_t)off_1000DB210, a2, a3))
                      && !sub_1000A6970(&v21, &__s, &__n))
                    {
                      input[0] = a1;
                      input[1] = (uint64_t)__s;
                      uint64_t input[2] = __n;
                      uint64_t v8 = IOConnectCallMethod(v10, 0x1Eu, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
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

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_configuration",  ":",  1488,  "",  0,  "",  "");
    uint64_t v8 = 3758097084LL;
  }

  sub_1000A62A0(&v21);
  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  return v8;
}

uint64_t sub_10009D4B0(const __CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  value = 0LL;
  uint64_t result = CFDictionaryGetValueIfPresent(a1, a2, (const void **)&value);
  if ((_DWORD)result)
  {
    if (CFGetTypeID(value) == a3)
    {
      if (CFNumberGetTypeID() == a3)
      {
        uint64_t v12 = 0LL;
        if (!CFNumberGetValue((CFNumberRef)value, kCFNumberSInt64Type, &v12)
          || sub_1000A706C(a5, a4, v12))
        {
          return 0xFFFFFFFFLL;
        }

        return 0LL;
      }

      if (CFBooleanGetTypeID() == a3)
      {
        BOOL v9 = CFBooleanGetValue((CFBooleanRef)value) != 0;
      }

      else
      {
        if (CFDataGetTypeID() != a3) {
          return 0xFFFFFFFFLL;
        }
        BytePtr = CFDataGetBytePtr((CFDataRef)value);
        CFIndex Length = CFDataGetLength((CFDataRef)value);
      }

      return 0LL;
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_10009D5B4(int a1, __CFDictionary **a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      mach_port_t v6 = v5;
      bzero(outputStruct, 0x8000uLL);
      size_t v48 = 0x8000LL;
      uint64_t input = a1;
      uint64_t v7 = IOConnectCallMethod(v6, 0x1Fu, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, &v48);
      if ((_DWORD)v7)
      {
        return v7;
      }

      else if (v48 > 0x8000)
      {
        return 3758604298LL;
      }

      else
      {
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        BOOL v9 = &outputStruct[v48];
        bzero(v50, 0x250uLL);
        v49 = off_1000DB368;
        v50[4] = off_1000DB370;
        v50[9] = off_1000DB378;
        v50[14] = off_1000DB380;
        v50[19] = off_1000DB388;
        v50[24] = off_1000DB390;
        v50[29] = off_1000DB570;
        v50[34] = off_1000DB5A8;
        v50[39] = off_1000DB5B8;
        v50[44] = off_1000DB5C0;
        v50[49] = off_1000DB5C8;
        v50[54] = off_1000DB748;
        v50[59] = off_1000DB750;
        v50[64] = off_1000DB780;
        v50[69] = off_1000DB778;
        __int128 v45 = xmmword_1000AEEA0;
        uint64_t v46 = 0LL;
        v47 = &v49;
        sub_1000A5D94( (uint64_t)outputStruct,  (uint64_t)v9,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v45);
        uint64_t v10 = v50[0];
        uint64_t v11 = v50[5];
        uint64_t v12 = v50[10];
        uint64_t v13 = v50[15];
        uint64_t v14 = v50[20];
        uint64_t v15 = v50[25];
        uint64_t v16 = v50[30];
        v44 = a2;
        uint64_t v17 = v50[35];
        uint64_t v37 = v50[40];
        uint64_t v38 = v50[45];
        uint64_t v39 = v50[50];
        uint64_t v40 = v50[55];
        uint64_t v41 = v50[60];
        uint64_t v42 = v50[65];
        uint64_t v43 = v50[70];
        CFTypeID TypeID = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"GracePeriod", TypeID, v10, (uint64_t)v9);
        CFTypeID v19 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"BackOffDelay", v19, v11, (uint64_t)v9);
        CFTypeID v20 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"MaxUnlockAttempts", v20, v12, (uint64_t)v9);
        CFTypeID v21 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"EscrowPasscodePeriod", v21, v13, (uint64_t)v9);
        CFTypeID v22 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"EscrowTokenPeriod", v22, v14, (uint64_t)v9);
        CFTypeID v23 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"ConfigFlags", v23, v15, (uint64_t)v9);
        CFTypeID v24 = CFDataGetTypeID();
        sub_10009DB2C(Mutable, @"UserUUID", v24, v16, (uint64_t)v9);
        CFTypeID v25 = CFDataGetTypeID();
        sub_10009DB2C(Mutable, @"GroupUUID", v25, v17, (uint64_t)v9);
        CFTypeID v26 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"RecoveryIterations", v26, v37, (uint64_t)v9);
        CFTypeID v27 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"RecoveryFlags", v27, v38, (uint64_t)v9);
        CFTypeID v28 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"RecoveryTargetIterations", v28, v39, (uint64_t)v9);
        CFTypeID v29 = CFBooleanGetTypeID();
        sub_10009DB2C(Mutable, @"MementoSupported", v29, v40, (uint64_t)v9);
        CFTypeID v30 = CFBooleanGetTypeID();
        sub_10009DB2C(Mutable, @"MementoBlobExists", v30, v41, (uint64_t)v9);
        CFTypeID v31 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"MementoPasscodeGeneration", v31, v42, (uint64_t)v9);
        CFTypeID v32 = CFNumberGetTypeID();
        sub_10009DB2C(Mutable, @"PasscodeGeneration", v32, v43, (uint64_t)v9);
        char v33 = sub_1000A5FAC(v15, (uint64_t)v9);
        if ((v33 & 2) != 0) {
          CFBooleanRef v34 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v34 = kCFBooleanFalse;
        }
        CFDictionarySetValue(Mutable, @"InactivityRebootEnabled", v34);
        if ((v33 & 8) != 0) {
          CFBooleanRef v35 = kCFBooleanTrue;
        }
        else {
          CFBooleanRef v35 = kCFBooleanFalse;
        }
        CFDictionarySetValue(Mutable, @"OnenessAutomaticMode", v35);
        uint64_t v4 = 0LL;
        *v44 = Mutable;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_configuration",  ":",  1556,  "",  0,  "",  "");
  }

  return v4;
}

void sub_10009DB2C(__CFDictionary *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    if (CFNumberGetTypeID() == a3)
    {
      CFIndex valuePtr = sub_1000A5FAC(a4, a5);
      CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberSInt64Type, &valuePtr);
      if (!v10) {
        return;
      }
LABEL_12:
      CFNumberRef v14 = v10;
      CFDictionaryAddValue(a1, a2, v10);
      CFRelease(v14);
      return;
    }

    if (CFBooleanGetTypeID() == a3)
    {
      BOOL v11 = sub_1000A6248(a4, a5);
      uint64_t v12 = (const void **)&kCFBooleanTrue;
      if (!v11) {
        uint64_t v12 = (const void **)&kCFBooleanFalse;
      }
      CFDictionaryAddValue(a1, a2, *v12);
    }

    else if (CFDataGetTypeID() == a3)
    {
      CFIndex valuePtr = 0LL;
      uint64_t v13 = (const UInt8 *)ccder_decode_tl(4LL, &valuePtr, a4, a5);
      if (v13)
      {
        CFNumberRef v10 = CFDataCreate(kCFAllocatorDefault, v13, valuePtr);
        goto LABEL_12;
      }
    }
  }

uint64_t sub_10009DC60(int a1, unsigned int a2, uint64_t a3)
{
  input[0] = a2;
  input[1] = a3;
  uint64_t input[2] = a1;
  mach_port_t v3 = sub_100096240();
  if (v3) {
    return IOConnectCallMethod(v3, 0x1Au, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_hold",  ":",  1654,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009DD40(int a1, unsigned int a2)
{
  input[0] = a2;
  input[1] = a1;
  mach_port_t v2 = sub_100096240();
  if (v2) {
    return IOConnectCallMethod(v2, 0x1Bu, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_drop",  ":",  1672,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009DE1C(int a1, unsigned int a2)
{
  mach_port_t v4 = sub_100096240();
  if (v4)
  {
    input[0] = a2;
    input[1] = a1;
    return IOConnectCallMethod(v4, 0x64u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_promote",  ":",  1687,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009DF08(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x91u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_oneness_heartbeat",  ":",  1707,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009DFE0(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x65u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_assert_consume",  ":",  1722,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009E0B8(int a1, uint64_t a2)
{
  uint64_t v15 = 0LL;
  int v14 = 0;
  mach_port_t v4 = sub_100096240();
  if (v4)
  {
    mach_port_t v10 = v4;
    sub_1000A9930((char **)&v15, (unsigned int *)&v14, 3, v5, v6, v7, v8, v9, a2);
    input[0] = a1;
    input[1] = (uint64_t)v15;
    uint64_t input[2] = v14;
    uint64_t v11 = IOConnectCallMethod(v10, 0x12u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
    uint64_t v12 = v15;
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_recover_with_escrow_bag",  ":",  1739,  "",  0,  "",  "");
    uint64_t v12 = 0LL;
    uint64_t v11 = 3758097084LL;
  }

  free(v12);
  return v11;
}

uint64_t sub_10009E218(const void *a1, int a2, void *a3, _DWORD *a4)
{
  uint64_t v8 = 3758097090LL;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    if (a1 && a3 && a4)
    {
      uint64_t v10 = IOConnectCallMethod(v9, 0x29u, 0LL, 0, a1, a2, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v10)
      {
        uint64_t v8 = v10;
      }

      else
      {
        uint64_t v11 = calloc(__count, 1uLL);
        *a3 = v11;
        if (v11)
        {
          memcpy(v11, __src, __count);
          uint64_t v8 = 0LL;
          *a4 = __count;
        }

        else
        {
          uint64_t v8 = 3758097085LL;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fdr_hmac_data",  ":",  1758,  "",  0,  "",  "");
    uint64_t v8 = 3758097084LL;
  }

  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  return v8;
}

uint64_t sub_10009E3B4(int a1, unsigned int a2, _DWORD *a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t output = 0LL;
    uint32_t outputCnt = 1;
    uint64_t result = IOConnectCallMethod(v6, 0x28u, input, 2u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (a3)
    {
      if (!(_DWORD)result) {
        *a3 = output;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_generation",  ":",  1781,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_10009E4C8(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v9 = 3758097084LL;
  CFTypeID v21 = 0LL;
  int v20 = 0;
  mach_port_t v10 = sub_100096240();
  if (v10)
  {
    mach_port_t v16 = v10;
    if (a2) {
      uint64_t v17 = a2;
    }
    else {
      uint64_t v17 = "";
    }
    sub_1000A9930((char **)&v21, (unsigned int *)&v20, 2, v11, v12, v13, v14, v15, (uint64_t)v17);
    if (v21)
    {
      input[0] = a1;
      input[1] = a6;
      uint64_t input[2] = (uint64_t)v21;
      uint64_t input[3] = v20;
      uint64_t v9 = IOConnectCallMethod(v16, 0x2Au, input, 4u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
      CFTypeID v18 = v21;
    }

    else
    {
      CFTypeID v18 = 0LL;
      uint64_t v9 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_aks_verify_password",  ":",  1807,  "",  0,  "",  "");
    CFTypeID v18 = 0LL;
  }

  free(v18);
  return v9;
}

uint64_t sub_10009E650(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10009E4C8(a1, a2, a3, a4, a5, 0);
}

uint64_t sub_10009E658(int a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_10009E4C8(a1, a2, a3, a4, a5, 1u);
}

uint64_t sub_10009E660(mach_port_t a1, uintptr_t a2)
{
  io_connect_t v4 = sub_100096240();
  if (v4) {
    return IOConnectSetNotificationPort(v4, 0, a1, a2);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_register_for_notifications",  ":",  1840,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009E708(int a1, int a2, void *a3, size_t *a4)
{
  size_t __count = 256LL;
  input[0] = a1;
  input[1] = a2;
  uint64_t result = 3758097090LL;
  if (a3 && a4)
  {
    mach_port_t v7 = sub_100096240();
    if (v7)
    {
      memset(__src, 0, sizeof(__src));
      uint64_t result = IOConnectCallMethod(v7, 0x31u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x100)
        {
          return 3758604298LL;
        }

        else
        {
          uint64_t v8 = calloc(__count, 1uLL);
          *a3 = v8;
          if (v8)
          {
            memcpy(v8, __src, __count);
            uint64_t result = 0LL;
            *a4 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_create_signing_key",  ":",  1859,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_10009E898(int a1, int a2, const void *a3, size_t a4, void *a5, size_t *a6)
{
  size_t __count = 0x8000LL;
  input[0] = a1;
  input[1] = a2;
  uint64_t result = 3758097090LL;
  if (a5 && a6)
  {
    mach_port_t v11 = sub_100096240();
    if (v11)
    {
      mach_port_t v12 = v11;
      bzero(__src, 0x8000uLL);
      uint64_t result = IOConnectCallMethod(v12, 0x31u, input, 2u, a3, a4, 0LL, 0LL, __src, &__count);
      if (!(_DWORD)result)
      {
        if (__count > 0x8000)
        {
          return 3758604298LL;
        }

        else
        {
          uint64_t v13 = calloc(__count, 1uLL);
          *a5 = v13;
          if (v13)
          {
            memcpy(v13, __src, __count);
            uint64_t result = 0LL;
            *a6 = __count;
          }

          else
          {
            return 3758097085LL;
          }
        }
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_create_signing_key_with_params",  ":",  1881,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_10009EA40(int a1)
{
  return sub_10009EA58(a1, 0x6Du, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_10009EA58(int a1, uint32_t a2, uint64_t a3, uint64_t a4, void *a5, size_t *a6)
{
  size_t __count = 15360LL;
  input[0] = a1;
  input[1] = a3;
  uint64_t input[2] = a4;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    mach_port_t v10 = v9;
    bzero(__src, 0x3C00uLL);
    uint64_t v11 = IOConnectCallMethod(v10, a2, input, 3u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }

    else if (__count > 0x3C00)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      if (a5 && a6)
      {
        if (__count)
        {
          uint64_t v13 = calloc(__count, 1uLL);
          *a5 = v13;
          if (!v13) {
            return 3758097085LL;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }

        else
        {
          size_t v14 = 0LL;
        }

        uint64_t v12 = 0LL;
        *a6 = v14;
      }
    }
  }

  else
  {
    uint64_t v12 = 3758097084LL;
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "remote_session_operate",  ":",  2017,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_10009EC10( int a1, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, void *a8, size_t *a9)
{
  size_t __count = 256LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  input[0] = a1;
  input[1] = a2;
  uint64_t v9 = 3758097090LL;
  uint64_t input[2] = a5;
  if (a8 && a9)
  {
    mach_port_t v12 = sub_100096240();
    if (v12)
    {
      mach_port_t v18 = v12;
      sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 2, v13, v14, v15, v16, v17, a3);
      if (*(void *)&inputStructCnt[1])
      {
        uint64_t v19 = IOConnectCallMethod( v18,  0x32u,  input,  3u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
        if ((_DWORD)v19)
        {
          uint64_t v9 = v19;
        }

        else if (__count > 0x100)
        {
          uint64_t v9 = 3758604298LL;
        }

        else
        {
          int v20 = calloc(__count, 1uLL);
          *a8 = v20;
          uint64_t v9 = 3758097085LL;
          if (v20)
          {
            memcpy(v20, __src, __count);
            uint64_t v9 = 0LL;
            *a9 = __count;
          }
        }
      }

      else
      {
        uint64_t v9 = 3758097085LL;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_sign_signing_key",  ":",  1911,  "",  0,  "",  "");
      uint64_t v9 = 3758097084LL;
    }
  }

  free(*(void **)&inputStructCnt[1]);
  return v9;
}

uint64_t sub_10009EE10( int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  uint64_t v10 = 3758097084LL;
  input[0] = a2;
  input[1] = a1;
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  mach_port_t v11 = sub_100096240();
  if (v11)
  {
    mach_port_t v17 = v11;
    sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 3, v12, v13, v14, v15, v16, a3);
    if (*(void *)&inputStructCnt[1])
    {
      uint64_t v18 = IOConnectCallMethod( v17,  0x2Cu,  input,  2u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  &output,  &outputCnt,  0LL,  0LL);
      uint64_t v10 = v18;
      if (a9 && !(_DWORD)v18) {
        *a9 = output;
      }
    }

    else
    {
      uint64_t v10 = 3758097085LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_session",  ":",  1938,  "",  0,  "",  "");
  }

  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_10009EF88(int a1, int a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v17 = 0LL;
  int __s = 0LL;
  uint64_t v4 = 3758097084LL;
  rsize_t __n = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v5 = 3758097090LL;
  rsize_t __smax = 0LL;
  if (!a3 || !a4) {
    goto LABEL_12;
  }
  int v8 = -536870212;
  *(void *)&__int128 v19 = a3;
  *((void *)&v19 + 1) = a3 + a4;
  if (!(a3 + a4)) {
    goto LABEL_19;
  }
  uint64_t v16 = 0LL;
  if ((ccder_blob_decode_range(&v19, 0x2000000000000010LL, &v19) & 1) == 0)
  {
    int v8 = -536870198;
LABEL_19:
    syslog(3, "error parsing signing key: %d", v8);
    uint64_t v5 = 3758097084LL;
LABEL_12:
    uint64_t v12 = __s;
    uint64_t v4 = v5;
    goto LABEL_13;
  }

  sub_1000A8CD8(&v19, 0x8000000000000001LL, &v16);
  if (v16)
  {
    uint64_t v5 = sub_10009EA58(a1, 0x74u, a3, a4, 0LL, 0LL);
    if ((_DWORD)v5) {
      syslog(3, "error: validating v1 local signing key failed: %d");
    }
    goto LABEL_12;
  }

  uint64_t v11 = sub_10009E708(a1, 11, &__s, &__n);
  if ((_DWORD)v11)
  {
    uint64_t v5 = v11;
    syslog(3, "error: validating (create) v0 local signing key failed: %d", v11);
    goto LABEL_12;
  }

  uint64_t v12 = __s;
  if (__s && __n)
  {
    uint64_t v5 = sub_10009EC10(a1, a2, a3, a4, 11, (uint64_t)__s, __n, &v17, &__smax);
    if ((_DWORD)v5) {
      syslog(3, "error: validating (sign) v0 local signing key failed: %d");
    }
    goto LABEL_12;
  }

uint64_t sub_10009F15C(int a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  return sub_10009EA58(a1, 0x2Du, a2, a3, a4, a5);
}

uint64_t sub_10009F174(int a1, uint64_t a2, uint64_t a3, void *a4, size_t *a5)
{
  return sub_10009EA58(a1, 0x2Eu, a2, a3, a4, a5);
}

uint64_t sub_10009F18C(int a1, uint64_t a2, int a3, void *a4, size_t *a5)
{
  return sub_10009EA58(a1, 0x94u, a2, a3, a4, a5);
}

uint64_t sub_10009F1A8(int a1, void *a2, size_t *a3)
{
  return sub_10009EA58(a1, 0x30u, 0LL, 0LL, a2, a3);
}

uint64_t sub_10009F1C0(int a1, void *a2, size_t *a3)
{
  return sub_10009EA58(a1, 0x38u, 0LL, 0LL, a2, a3);
}

uint64_t sub_10009F1D8(int a1, void *a2, _DWORD *a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (a2)
    {
      if (a3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        input[0] = a1;
        input[1] = 0LL;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            uint64_t v9 = calloc(__count, 1uLL);
            *a2 = v9;
            if (v9)
            {
              memcpy(v9, __src, __count);
              uint64_t result = 0LL;
              *a3 = __count;
            }

            else
            {
              return 3758097085LL;
            }
          }

          else
          {
            return 3758097136LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drain_backup_keys",  ":",  2072,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_10009F370(int a1, void *a2, size_t *a3)
{
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    mach_port_t v7 = v6;
    uint64_t result = 3758097090LL;
    if (a2)
    {
      if (a3)
      {
        bzero(__src, 0x8000uLL);
        size_t __count = 0x8000LL;
        input[0] = a1;
        input[1] = 1LL;
        uint64_t result = IOConnectCallMethod(v7, 0x14u, input, 2u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
        if (!(_DWORD)result)
        {
          if (__count)
          {
            if (__ROR8__(0xEF7BDEF7BDEF7BDFLL * __count, 2) > 0x210842108421084uLL)
            {
              return 3758604298LL;
            }

            else
            {
              uint64_t v9 = calloc(__count, 1uLL);
              *a2 = v9;
              if (v9)
              {
                memcpy(v9, __src, __count);
                uint64_t result = 0LL;
                *a3 = __count / 0x7C;
              }

              else
              {
                return 3758097085LL;
              }
            }
          }

          else
          {
            return 3758097136LL;
          }
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drain_backup_keys_info",  ":",  2100,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_10009F564(int a1)
{
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t input = a1;
    return IOConnectCallMethod(v2, 0x16u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_clear_backup_bag",  ":",  2129,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009F648(int a1, int a2, uint64_t a3, int a4, void *a5, _DWORD *a6)
{
  mach_port_t v12 = sub_100096240();
  if (!v12)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_backup_bag",  ":",  2146,  "",  0,  "",  "");
    return 3758097084LL;
  }

  mach_port_t v13 = v12;
  if (a5)
  {
    if (!a6) {
      return 3758097090LL;
    }
    __int128 outputStruct = __src;
    p_count = &__count;
    uint64_t v16 = 1LL;
  }

  else
  {
    p_count = 0LL;
    __int128 outputStruct = 0LL;
    uint64_t v16 = 0LL;
  }

  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = v16;
  uint64_t input[3] = a3;
  uint64_t input[4] = a4;
  uint64_t result = IOConnectCallMethod(v13, 0x15u, input, 5u, 0LL, 0LL, 0LL, 0LL, outputStruct, p_count);
  if (a5 && !(_DWORD)result)
  {
    uint64_t v18 = calloc(__count, 1uLL);
    *a5 = v18;
    if (v18)
    {
      memcpy(v18, __src, __count);
      uint64_t result = 0LL;
      *a6 = __count;
    }

    else
    {
      return 3758097085LL;
    }
  }

  return result;
}

uint64_t sub_10009F81C(int a1, _DWORD *a2)
{
  uint64_t v4 = 3758097084LL;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2)
    {
      uint64_t output = 0LL;
      uint64_t input = a1;
      uint32_t outputCnt = 1;
      uint64_t v4 = IOConnectCallMethod(v5, 0x52u, &input, 1u, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
      if (!(_DWORD)v4) {
        *a2 = output;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_make_public_backup_bag",  ":",  2178,  "",  0,  "",  "");
  }

  return v4;
}

uint64_t sub_10009F934(int a1)
{
  return sub_10009EA58(a1, 0x34u, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_10009F94C()
{
  return sub_10009EA58(0, 0x40u, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_10009F968(int a1, uint64_t a2)
{
  return sub_10009F974(a1, 0x11u, a2);
}

uint64_t sub_10009F974(int a1, uint32_t a2, uint64_t a3)
{
  uint64_t input = a1;
  *(void *)mach_port_t v12 = 4096LL;
  uint64_t v5 = 3758097084LL;
  int v18 = 0;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 __s = 0u;
  mach_port_t v6 = sub_100096240();
  if (v6)
  {
    if (a3)
    {
      mach_port_t v7 = v6;
      bzero(outputStruct, 0x1000uLL);
      uint64_t v8 = IOConnectCallMethod(v7, a2, &input, 1u, 0LL, 0LL, 0LL, 0LL, outputStruct, (size_t *)v12);
      if ((_DWORD)v8)
      {
        return v8;
      }

      else
      {
        uint64_t v5 = 0LL;
        if (!sub_1000A7C54((uint64_t)outputStruct, v12[0], (char *)&__s))
        {
          __int128 v9 = v16;
          *(_OWORD *)(a3 + 32) = v15;
          *(_OWORD *)(a3 + 48) = v9;
          *(_WORD *)(a3 + 64) = v17;
          __int128 v10 = v14;
          *(_OWORD *)a3 = __s;
          *(_OWORD *)(a3 + 16) = v10;
        }
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_get_device_state",  ":",  2224,  "",  0,  "",  "");
  }

  return v5;
}

uint64_t sub_10009FB08(int a1, uint64_t a2)
{
  return sub_10009F974(a1, 0x23u, a2);
}

uint64_t sub_10009FB14(int a1, const void *a2, size_t a3, _DWORD *a4)
{
  uint64_t v7 = 3758097084LL;
  size_t v20 = 4096LL;
  uint64_t input = a1;
  mach_port_t v8 = sub_100096240();
  if (v8)
  {
    if (a4)
    {
      mach_port_t v9 = v8;
      bzero(outputStruct, 0x1000uLL);
      memset_s(a4, 0x10uLL, 0, 0x10uLL);
      uint64_t v10 = IOConnectCallMethod(v9, 0x39u, &input, 1u, a2, a3, 0LL, 0LL, outputStruct, &v20);
      if ((_DWORD)v10)
      {
        return v10;
      }

      else
      {
        uint64_t v11 = &outputStruct[v20];
        uint64_t v26 = 0LL;
        __int128 v30 = 0u;
        __int128 v22 = 0u;
        __int128 v23 = 0u;
        __int128 v25 = 0u;
        __int128 v28 = 0u;
        __int128 v29 = 0u;
        __int128 v31 = 0u;
        uint64_t v32 = 0LL;
        CFTypeID v21 = off_1000DB4B0;
        __int128 v24 = (unint64_t)off_1000DB4B8;
        CFTypeID v27 = off_1000DB4C0;
        *(void *)&__int128 v30 = off_1000DB4C8;
        __int128 v17 = xmmword_1000AEEB0;
        uint64_t v18 = 0LL;
        __int128 v19 = &v21;
        sub_1000A5D94( (uint64_t)outputStruct,  (uint64_t)&outputStruct[v20],  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v17);
        uint64_t v12 = *((void *)&v24 + 1);
        uint64_t v13 = v28;
        uint64_t v14 = *((void *)&v30 + 1);
        *a4 = sub_1000A5FAC(v22, (uint64_t)v11);
        a4[1] = sub_1000A5FAC(v12, (uint64_t)v11);
        a4[2] = sub_1000A5FAC(v13, (uint64_t)v11);
        int v15 = sub_1000A5FAC(v14, (uint64_t)v11);
        uint64_t v7 = 0LL;
        a4[3] = v15;
      }
    }

    else
    {
      return 3758097090LL;
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_peer_get_state",  ":",  2255,  "",  0,  "",  "");
  }

  return v7;
}

uint64_t sub_10009FD78(int a1, const void *a2, size_t a3)
{
  uint64_t input = a1;
  mach_port_t v5 = sub_100096240();
  if (v5) {
    return IOConnectCallMethod(v5, 0x3Au, &input, 1u, a2, a3, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_remote_peer_drop",  ":",  2292,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_10009FE60(int a1, int a2)
{
  uint64_t input = a1;
  mach_port_t v3 = sub_100096240();
  if (v3)
  {
    if (a2) {
      uint32_t v4 = 32;
    }
    else {
      uint32_t v4 = 8;
    }
    return IOConnectCallMethod(v3, v4, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_device",  ":",  2307,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_10009FF50(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x8Du, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lock_cx",  ":",  2327,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0028(int a1, uint64_t a2, int a3)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_100096240();
  if (v3) {
    return IOConnectCallMethod(v3, 9u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_unlock_device",  ":",  2342,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0108()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x13u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_obliterate_class_d",  ":",  2355,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A01AC(int a1, unsigned int a2, uint64_t a3, unsigned int a4, const void *a5, int a6)
{
  mach_port_t v12 = sub_100096240();
  if (v12)
  {
    input[0] = a1;
    input[1] = a2;
    uint64_t input[2] = a3;
    uint64_t input[3] = a4;
    return IOConnectCallMethod(v12, 0x3Fu, input, 4u, a5, a6, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_migrate_s_key",  ":",  2367,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1000A02C0( int a1, uint64_t a2, uint64_t a3, unsigned int a4, const void *a5, size_t a6, void *a7, size_t *a8)
{
  input[0] = a1;
  input[1] = a4;
  uint64_t input[2] = a2;
  uint64_t input[3] = a3;
  size_t __count = 2048LL;
  mach_port_t v12 = sub_100096240();
  if (v12)
  {
    mach_port_t v13 = v12;
    bzero(__src, 0x800uLL);
    uint64_t v14 = IOConnectCallMethod(v13, 0x3Bu, input, 4u, a5, a6, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v14)
    {
      return v14;
    }

    else if (__count > 0x800)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v15 = 0LL;
      if (a7 && a8)
      {
        if (__count)
        {
          __int128 v16 = calloc(__count, 1uLL);
          *a7 = v16;
          if (!v16) {
            return 3758097085LL;
          }
          memcpy(v16, __src, __count);
          size_t v17 = __count;
        }

        else
        {
          size_t v17 = 0LL;
        }

        uint64_t v15 = 0LL;
        *a8 = v17;
      }
    }
  }

  else
  {
    uint64_t v15 = 3758097084LL;
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_register",  ":",  2388,  "",  0,  "",  "");
  }

  return v15;
}

uint64_t sub_1000A046C(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x3Cu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_unregister",  ":",  2412,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0544(int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t input = a1;
  size_t __count = 2048LL;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    mach_port_t v10 = v9;
    bzero(__src, 0x800uLL);
    uint64_t v11 = IOConnectCallMethod(v10, 0x3Du, &input, 1u, a2, a3, 0LL, 0LL, __src, &__count);
    if ((_DWORD)v11)
    {
      return v11;
    }

    else if (__count > 0x800)
    {
      return 3758604298LL;
    }

    else
    {
      uint64_t v12 = 0LL;
      if (a4 && a5)
      {
        if (__count)
        {
          mach_port_t v13 = calloc(__count, 1uLL);
          *a4 = v13;
          if (!v13) {
            return 3758097085LL;
          }
          memcpy(v13, __src, __count);
          size_t v14 = __count;
        }

        else
        {
          size_t v14 = 0LL;
        }

        uint64_t v12 = 0LL;
        *a5 = v14;
      }
    }
  }

  else
  {
    uint64_t v12 = 3758097084LL;
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_request_unlock",  ":",  2429,  "",  0,  "",  "");
  }

  return v12;
}

uint64_t sub_1000A06E8(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  uint64_t input = a1;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  bzero(__src, 0x800uLL);
  size_t __count = 2048LL;
  sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 2, v10, v11, v12, v13, v14, a2);
  if (!*(void *)&inputStructCnt[1])
  {
    uint64_t v17 = 3758097085LL;
    goto LABEL_12;
  }

  mach_port_t v15 = sub_100096240();
  if (!v15)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_smartcard_unlock",  ":",  2460,  "",  0,  "",  "");
    uint64_t v17 = 3758097084LL;
    goto LABEL_12;
  }

  uint64_t v16 = IOConnectCallMethod( v15,  0x3Eu,  &input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
  if ((_DWORD)v16)
  {
    uint64_t v17 = v16;
    goto LABEL_12;
  }

  if (__count > 0x800)
  {
    uint64_t v17 = 3758604298LL;
    goto LABEL_12;
  }

  uint64_t v17 = 0LL;
  if (a6 && a7)
  {
    if (!__count)
    {
      size_t v19 = 0LL;
      goto LABEL_11;
    }

    uint64_t v18 = calloc(__count, 1uLL);
    *a6 = v18;
    uint64_t v17 = 3758097085LL;
    if (v18)
    {
      memcpy(v18, __src, __count);
      size_t v19 = __count;
LABEL_11:
      uint64_t v17 = 0LL;
      *a7 = v19;
    }
  }

uint64_t sub_1000A08CC(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000A0914(uint64_t a1, int a2, unint64_t a3, uint64_t a4, uint64_t *a5, void *a6)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a6)
  {
    if (a3)
    {
      if (a4)
      {
        if (a5)
        {
          uint64_t v9 = a3 + a4;
          if (a3 + a4 > a3)
          {
            __int128 v21 = 0u;
            __int128 v20 = 0u;
            uint64_t v19 = a1;
            __int128 v16 = xmmword_1000AEEC0;
            uint64_t v17 = 0LL;
            uint64_t v18 = &v19;
            sub_1000A5D94( a3,  v9,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v16);
            if (a2)
            {
              if (*a6 == 8LL)
              {
                uint64_t v12 = sub_1000A5FAC(v20, v9);
                uint64_t result = 0LL;
                *a5 = v12;
                return result;
              }

              return 0xFFFFFFFFLL;
            }

            uint64_t v15 = 0LL;
            uint64_t v13 = ccder_decode_tl(4LL, &v15, v20, v9);
            if (!v13) {
              return 0xFFFFFFFFLL;
            }
            uint64_t v14 = v13;
            uint64_t result = 0LL;
            *a5 = v14;
            *a6 = v15;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000A0A3C(unint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && a4)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000A0A84(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8LL;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t result = sub_1000A0914((uint64_t)off_1000DB4F0, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t sub_1000A0AF0(unint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v5 = 8LL;
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t result = sub_1000A0914((uint64_t)off_1000DB4E8, 1, a1, a2, &v6, &v5);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v6;
  return result;
}

uint64_t sub_1000A0B5C(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x47u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_fail",  ":",  2589,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0C34(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x49u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_set_healthy",  ":",  2605,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0D0C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1000A0D14(a1, a2, a3, 0x45u);
}

uint64_t sub_1000A0D14(int a1, uint64_t a2, uint64_t a3, uint32_t a4)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v5 = sub_100096240();
  if (v5) {
    return IOConnectCallMethod(v5, a4, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "__aks_se_set_secret",  ":",  2621,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0DFC(int a1, uint64_t a2, uint64_t a3)
{
  return sub_1000A0D14(a1, a2, a3, 0x8Cu);
}

uint64_t sub_1000A0E04(int a1, uint64_t a2, uint64_t a3)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_100096240();
  if (v3) {
    return IOConnectCallMethod(v3, 0x46u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_recover",  ":",  2649,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0EE0(int a1, uint64_t a2, uint64_t a3)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_100096240();
  if (v3) {
    return IOConnectCallMethod(v3, 0x69u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_change_secret_epilogue",  ":",  2665,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A0FBC(int a1, uint64_t a2, uint64_t a3, void *a4, _BYTE *a5)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096LL;
  mach_port_t v7 = sub_100096240();
  if (!v7)
  {
    uint64_t v15 = 3758097084LL;
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_token_for_memento_secret",  ":",  2683,  "",  0,  "",  "");
    goto LABEL_12;
  }

  uint64_t v8 = IOConnectCallMethod(v7, 0x48u, input, 3u, 0LL, 0LL, 0LL, 0LL, __s, &__n);
  if ((_DWORD)v8)
  {
    uint64_t v15 = v8;
    goto LABEL_12;
  }

  if (__n - 4097 < 0xFFFFFFFFFFFFF000LL)
  {
    uint64_t v15 = 3758604298LL;
    goto LABEL_12;
  }

  uint64_t v9 = &__s[__n];
  uint64_t v27 = 0LL;
  __int128 v26 = 0u;
  __int128 v24 = 0u;
  __int128 v23 = 0u;
  __int128 v22 = off_1000DB560;
  __int128 v25 = (unint64_t)off_1000DB568;
  __int128 v18 = xmmword_1000AEED0;
  uint64_t v19 = 0LL;
  __int128 v20 = &v22;
  sub_1000A5D94( (uint64_t)__s,  (uint64_t)&__s[__n],  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v18);
  uint64_t v10 = *((void *)&v25 + 1);
  if ((void)v23)
  {
    uint64_t v17 = 0LL;
    uint64_t v11 = ccder_decode_tl(4LL, &v17, v23, v9);
    if (v17 != 16)
    {
LABEL_11:
      uint64_t v15 = 0LL;
      goto LABEL_12;
    }

    uint64_t v12 = v11;
    uint64_t v13 = calloc(0x10uLL, 1uLL);
    *a4 = v13;
    if (!v13)
    {
      uint64_t v15 = 3758097085LL;
      goto LABEL_12;
    }

    __memcpy_chk(v13, v12, v17, 16LL);
  }

  if (!v10) {
    goto LABEL_11;
  }
  unint64_t v14 = sub_1000A5FAC(v10, (uint64_t)v9);
  if (v14 > 0xFF) {
    goto LABEL_11;
  }
  uint64_t v15 = 0LL;
  *a5 = v14;
LABEL_12:
  memset_s(__s, __n, 0, __n);
  return v15;
}

uint64_t sub_1000A1228(int a1, void *a2, _BYTE *a3)
{
  return sub_1000A0FBC(a1, 0LL, 0LL, a2, a3);
}

uint64_t sub_1000A123C(int a1, const void *a2, size_t a3)
{
  uint64_t input = a1;
  mach_port_t v5 = sub_100096240();
  if (v5)
  {
    if (a2) {
      size_t v6 = a3;
    }
    else {
      size_t v6 = 0LL;
    }
    return IOConnectCallMethod(v5, 0x58u, &input, 1u, a2, v6, 0LL, 0LL, 0LL, 0LL);
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_set_nonce",  ":",  2737,  "",  0,  "",  "");
    return 3758097084LL;
  }

uint64_t sub_1000A1328(int a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t input = a1;
  bzero(&__s, 0x1000uLL);
  size_t __n = 4096LL;
  uint64_t v9 = 3758097090LL;
  if (a2)
  {
    if (a3)
    {
      uint64_t v9 = 3758097090LL;
      if (a4)
      {
        if (a5)
        {
          mach_port_t v10 = sub_100096240();
          if (v10)
          {
            uint64_t v11 = IOConnectCallMethod(v10, 0x5Au, &input, 1u, 0LL, 0LL, 0LL, 0LL, &__s, &__n);
            if ((_DWORD)v11)
            {
              uint64_t v9 = v11;
            }

            else if (__n - 4097 < 0xFFFFFFFFFFFFF005LL)
            {
              uint64_t v9 = 3758604298LL;
            }

            else
            {
              uint64_t v12 = calloc(5uLL, 1uLL);
              *a4 = v12;
              if (v12)
              {
                *a5 = 5LL;
                int v13 = __s;
                v12[4] = v19;
                *(_DWORD *)uint64_t v12 = v13;
                unint64_t v14 = calloc(__n - 5, 1uLL);
                *a2 = v14;
                uint64_t v9 = 3758097085LL;
                if (v14)
                {
                  size_t v15 = __n;
                  *a3 = __n - 5;
                  memcpy(v14, v20, v15);
                  uint64_t v9 = 0LL;
                }
              }

              else
              {
                uint64_t v9 = 3758097085LL;
              }
            }
          }

          else
          {
            fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_sig",  ":",  2759,  "",  0,  "",  "");
            uint64_t v9 = 3758097084LL;
          }
        }
      }
    }
  }

  memset_s(&__s, __n, 0, __n);
  return v9;
}

uint64_t sub_1000A1538(int a1, void *a2, size_t *a3)
{
  uint64_t input = a1;
  size_t v5 = 4096LL;
  bzero(__src, 0x1000uLL);
  size_t __count = 4096LL;
  uint64_t v6 = 3758097090LL;
  if (a2 && a3)
  {
    mach_port_t v7 = sub_100096240();
    if (v7)
    {
      uint64_t v8 = IOConnectCallMethod(v7, 0x59u, &input, 1u, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      size_t v5 = __count;
      if ((_DWORD)v8)
      {
        uint64_t v6 = v8;
      }

      else if (__count - 4097 < 0xFFFFFFFFFFFFF000LL)
      {
        uint64_t v6 = 3758604298LL;
      }

      else
      {
        uint64_t v9 = calloc(__count, 1uLL);
        *a2 = v9;
        size_t v5 = __count;
        if (v9)
        {
          *a3 = __count;
          memcpy(v9, __src, v5);
          uint64_t v6 = 0LL;
          size_t v5 = __count;
        }

        else
        {
          uint64_t v6 = 3758097085LL;
        }
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_get_reset_pubkey",  ":",  2791,  "",  0,  "",  "");
      size_t v5 = 4096LL;
      uint64_t v6 = 3758097084LL;
    }
  }

  memset_s(__src, v5, 0, v5);
  return v6;
}

uint64_t sub_1000A16F8(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x5Bu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_delete_reset_token",  ":",  2815,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A17D0(unsigned int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x5Eu, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_support_in_rm",  ":",  2832,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A18A8(BOOL *a1)
{
  uint64_t output = 0LL;
  uint32_t outputCnt = 1;
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    uint64_t result = IOConnectCallMethod(v2, 0x6Bu, 0LL, 0, 0LL, 0LL, &output, &outputCnt, 0LL, 0LL);
    if (a1)
    {
      if (!(_DWORD)result) {
        *a1 = output != 0;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_support_in_rm_is_set",  ":",  2848,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_1000A19A8()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x5Fu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_stage_stash",  ":",  2865,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A1A4C(void *a1)
{
  return sub_100097410(0LL, 0x19u, 0LL, 0LL, 0LL, a1, 0LL);
}

uint64_t sub_1000A1A6C(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  return sub_100097658(a1, 0, a2, a3, a4, 0LL, a5);
}

uint64_t sub_1000A1A88(uint64_t a1, void *a2, char *a3)
{
  *(void *)&__int128 v11 = __s;
  *((void *)&v11 + 1) = &v14;
  *(void *)uint64_t v12 = 4096LL;
  uint64_t v6 = 3758097090LL;
  if (a2 && a3)
  {
    mach_port_t v7 = sub_100096240();
    if (v7)
    {
      mach_port_t v8 = v7;
      if (sub_1000A7840(&v11, a2) && sub_1000A7958(&v11, a1))
      {
        uint64_t v6 = 3758097098LL;
        if (ccder_blob_encode_tl(&v11, 0x2000000000000010LL, (char *)&v14 - *((void *)&v11 + 1)))
        {
          uint64_t v9 = IOConnectCallMethod( v8,  0x55u,  0LL,  0,  *((const void **)&v11 + 1),  (size_t)&v14 - *((void *)&v11 + 1),  0LL,  0LL,  __s,  (size_t *)v12);
          if (!(_DWORD)v9) {
            uint64_t v9 = sub_1000A8198((uint64_t)__s, *(uint64_t *)v12, a3);
          }
          uint64_t v6 = v9;
        }
      }

      else
      {
        uint64_t v6 = 3758097098LL;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_get_blob_state",  ":",  2900,  "",  0,  "",  "");
      uint64_t v6 = 3758097084LL;
    }
  }

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v6;
}

uint64_t sub_1000A1C5C(__int128 *a1, char *a2)
{
  char v7 = 0;
  v6[0] = &v7;
  v6[1] = 1LL;
  __int128 v4 = 0uLL;
  uint64_t v5 = 0LL;
  if (a1)
  {
    __int128 v4 = *a1;
    uint64_t v5 = *((void *)a1 + 2);
    uint64_t v2 = *((void *)&v4 + 1) | 0x10LL;
  }

  else
  {
    uint64_t v2 = 16LL;
  }

  *((void *)&v4 + 1) = v2;
  return sub_1000A1A88((uint64_t)&v4, v6, a2);
}

uint64_t sub_1000A1CC4(uint64_t a1, unsigned int a2, uint64_t *a3)
{
  uint64_t v5 = 3758097098LL;
  uint64_t output = 0LL;
  uint64_t input = a2;
  uint32_t outputCnt = 1;
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v9 = __s;
  *((void *)&v9 + 1) = &output;
  if (a3)
  {
    mach_port_t v6 = sub_100096240();
    if (v6)
    {
      mach_port_t v7 = v6;
      if (sub_1000A7958(&v9, a1))
      {
        if (ccder_blob_encode_tl(&v9, 0x2000000000000010LL, (char *)&output - *((void *)&v9 + 1)))
        {
          uint64_t v5 = IOConnectCallMethod( v7,  0x4Eu,  &input,  1u,  *((const void **)&v9 + 1),  (size_t)&output - *((void *)&v9 + 1),  &output,  &outputCnt,  0LL,  0LL);
          if (!(_DWORD)v5) {
            *a3 = output;
          }
        }
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_get_size",  ":",  2943,  "",  0,  "",  "");
      uint64_t v5 = 3758097084LL;
    }
  }

  else
  {
    uint64_t v5 = 3758097090LL;
  }

  memset_s(__s, 0x1000uLL, 0, 0x1000uLL);
  return v5;
}

uint64_t sub_1000A1E60(uint64_t a1, unsigned int a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t input = a2;
  bzero(__s, 0x1000uLL);
  *(void *)&__int128 v15 = __s;
  *((void *)&v15 + 1) = &input;
  size_t v16 = 4096LL;
  uint64_t v9 = 3758097090LL;
  if (a3 && a4)
  {
    mach_port_t v10 = sub_100096240();
    if (!v10)
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fv_import",  ":",  2971,  "",  0,  "",  "");
      uint64_t v9 = 3758097084LL;
      goto LABEL_14;
    }

    mach_port_t v11 = v10;
    if (!ccder_blob_encode_body_tl(&v15, 4LL, 16LL, a4)
      || !sub_1000A7840(&v15, a3)
      || !sub_1000A7958(&v15, a1)
      || !ccder_blob_encode_tl(&v15, 0x2000000000000010LL, (char *)&input - *((void *)&v15 + 1)))
    {
      goto LABEL_12;
    }

    uint64_t v12 = IOConnectCallMethod( v11,  0x4Fu,  &input,  1u,  *((const void **)&v15 + 1),  (size_t)&input - *((void *)&v15 + 1),  0LL,  0LL,  __s,  &v16);
    if ((_DWORD)v12)
    {
      uint64_t v9 = v12;
      goto LABEL_14;
    }

    *(void *)&__int128 v14 = __s;
    *((void *)&v14 + 1) = &__s[v16];
    if (!a5)
    {
      uint64_t v9 = 0LL;
      goto LABEL_14;
    }

    uint64_t v9 = 0LL;
    if ((sub_1000A78AC(&v14, 0, a5) & 1) == 0) {
LABEL_12:
    }
      uint64_t v9 = 3758097098LL;
  }

uint64_t sub_1000A2090(uint64_t *a1)
{
  return sub_1000A1CC4(0LL, 2u, a1);
}

uint64_t sub_1000A20A0(uint64_t *a1)
{
  return sub_1000A1CC4(0LL, 1u, a1);
}

uint64_t sub_1000A20B0(unsigned int a1, void *a2, uint64_t a3, uint64_t a4)
{
  return sub_100096D30(0LL, a1, a2, a3, a4);
}

uint64_t sub_1000A20C8(void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  return sub_1000971B4(0LL, a1, a2, a3, a4, a5);
}

uint64_t sub_1000A20E4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  v5[0] = 0LL;
  v5[1] = 2LL;
  void v5[2] = 0LL;
  return sub_100095FE0((uint64_t)v5, a1, a2, a3, a4, 0LL);
}

uint64_t sub_1000A2124(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = 130LL;
  if ((a1 & 6) == 0) {
    uint64_t v3 = 2LL;
  }
  v5[0] = 0LL;
  v5[1] = v3;
  void v5[2] = 0LL;
  return sub_100095FE0((uint64_t)v5, 0LL, 0LL, a2, a3, 0LL);
}

uint64_t sub_1000A2170(void *a1, void *a2, void *a3, uint64_t a4)
{
  return sub_100097410(0LL, 3u, 0LL, a1, a2, a3, a4);
}

uint64_t sub_1000A2190(void *a1, BOOL *a2)
{
  uint64_t v9 = 0LL;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  __int128 v6 = 0u;
  memset(v5, 0, sizeof(v5));
  if (!a2) {
    return 3758097090LL;
  }
  uint64_t result = sub_1000A1A88((uint64_t)v4, a1, (char *)v5);
  if (!(_DWORD)result)
  {
    if (LODWORD(v5[0]) == 1)
    {
      uint64_t result = 0LL;
      *a2 = (DWORD1(v6) & 0x8000000) != 0;
    }

    else
    {
      return 3758604312LL;
    }
  }

  return result;
}

uint64_t sub_1000A2248(void *a1, void *a2, void *a3)
{
  return sub_100097410(0LL, 0x12u, 4uLL, a1, a2, a3, 0LL);
}

uint64_t sub_1000A2268(void *a1, void *a2, void *a3, void *a4, unsigned int a5)
{
  return sub_100097658(0LL, a5, a1, a2, a3, a4, 0LL);
}

uint64_t sub_1000A228C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v10 = 3758097098LL;
  bzero(v17, 0x1000uLL);
  bzero(v16, 0x1000uLL);
  *(void *)&__int128 v15 = v17;
  *((void *)&v15 + 1) = v18;
  *(void *)&__int128 v14 = v16;
  *((void *)&v14 + 1) = v17;
  if (sub_1000A7840(&v15, a2)
    && sub_1000A7840(&v15, a3)
    && ccder_blob_encode_tl(&v15, 0x2000000000000010LL, (char *)v18 - *((void *)&v15 + 1))
    && sub_1000A7840(&v14, a4)
    && sub_1000A7840(&v14, a5)
    && ccder_blob_encode_tl(&v14, 0x2000000000000010LL, &v17[-*((void *)&v14 + 1)]))
  {
    v13[0] = *((void *)&v15 + 1);
    v13[1] = (char *)v18 - *((void *)&v15 + 1);
    v12[0] = *((void *)&v14 + 1);
    v12[1] = &v17[-*((void *)&v14 + 1)];
    return sub_100097410(a1, 0x10u, 0LL, v13, v12, 0LL, 0LL);
  }

  return v10;
}

uint64_t sub_1000A241C(uint64_t a1)
{
  return sub_100097410(a1, 0x11u, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_1000A2438(uint64_t a1)
{
  uint64_t v4 = a1;
  memset(v3, 0, sizeof(v3));
  v2[0] = &v4;
  v2[1] = 16LL;
  return sub_100097410((uint64_t)v3, 0x1Cu, 0LL, v2, 0LL, 0LL, 0LL);
}

uint64_t sub_1000A2488(uint64_t a1, BOOL *a2, _BYTE *a3)
{
  __int128 v14 = v16;
  uint64_t v15 = 0x4000LL;
  uint64_t result = sub_100097410(a1, 0x1Au, 0LL, 0LL, 0LL, 0LL, (uint64_t)&v14);
  if (!(_DWORD)result)
  {
    memset(v13, 0, 21);
    mach_port_t v11 = &v14[v15];
    unint64_t v12 = 0LL;
    uint64_t v7 = ccder_decode_sequence_tl(&v11);
    if (v7 && (uint64_t v8 = ccder_decode_tl(4LL, &v12, v7, v11)) != 0)
    {
      if (v12 >= 0x15) {
        uint64_t v9 = 21LL;
      }
      else {
        uint64_t v9 = v12;
      }
      __memcpy_chk(v13, v8, v9, 21LL);
      if (a2)
      {
        if (v13[1]) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = HIDWORD(v13[0]) != 0;
        }
        *a2 = v10;
      }

      if (a3) {
        *a3 = v13[2];
      }
      return 0LL;
    }

    else
    {
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_1000A25E0()
{
  return sub_100097410(0LL, 7u, 0LL, 0LL, 0LL, 0LL, 0LL);
}

uint64_t sub_1000A2600(int a1, void *a2, void *a3)
{
  uint64_t v3 = 8LL;
  if (a1) {
    uint64_t v3 = 12LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = v3;
  uint64_t v8 = 0LL;
  uint64_t v4 = sub_100097410((uint64_t)&v6, 7u, 0LL, a2, a3, 0LL, 0LL);
  syslog(6, "aks_fv_prot_cmd_stash_kek(%llu) = %d", v7, v4);
  return v4;
}

uint64_t sub_1000A2678()
{
  uint64_t v0 = sub_100097410(0LL, 0xDu, 0LL, 0LL, 0LL, 0LL, 0LL);
  syslog(6, "aks_fv_prot_cmd_stash_commit = %d", v0);
  return v0;
}

uint64_t sub_1000A26D4()
{
  uint64_t v0 = sub_100097410(0LL, 8u, 0LL, 0LL, 0LL, 0LL, 0LL);
  syslog(6, "aks_fv_prot_cmd_stash_destroy = %d", v0);
  return v0;
}

uint64_t sub_1000A2730(void *a1, void *a2, void *a3, void *a4)
{
  return sub_100097658(0LL, 0, a1, a2, a3, a4, 0LL);
}

uint64_t sub_1000A2750(void *a1)
{
  return sub_100097410(0LL, 0xBu, 0LL, 0LL, a1, 0LL, 0LL);
}

uint64_t sub_1000A2770( unsigned int a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v10 = 3758097084LL;
  uint64_t input = a1;
  bzero(__src, 0x8000uLL);
  size_t __count = 0x8000LL;
  memset(inputStructCnt, 0, sizeof(inputStructCnt));
  if (a6)
  {
    mach_port_t v11 = sub_100096240();
    if (v11)
    {
      mach_port_t v17 = v11;
      if (a4) {
        __int128 v18 = a4;
      }
      else {
        __int128 v18 = "";
      }
      sub_1000A9930((char **)&inputStructCnt[1], inputStructCnt, 2, v12, v13, v14, v15, v16, (uint64_t)v18);
      uint64_t v19 = IOConnectCallMethod( v17,  0x50u,  &input,  1u,  *(const void **)&inputStructCnt[1],  (int)inputStructCnt[0],  0LL,  0LL,  __src,  &__count);
      if ((_DWORD)v19)
      {
        uint64_t v10 = v19;
      }

      else
      {
        __int128 v20 = calloc(__count, 1uLL);
        *a6 = v20;
        if (v20)
        {
          memcpy(v20, __src, __count);
          uint64_t v10 = 0LL;
          *a7 = (int)__count;
        }

        else
        {
          uint64_t v10 = 3758097085LL;
        }
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_absinthe_collection",  ":",  3220,  "",  0,  "",  "");
    }
  }

  else
  {
    uint64_t v10 = 3758097090LL;
  }

  memset_s(__src, 0x8000uLL, 0, 0x8000uLL);
  free(*(void **)&inputStructCnt[1]);
  return v10;
}

uint64_t sub_1000A2970(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, size_t *a7)
{
  __int128 v21 = 0LL;
  uint64_t input = a1;
  int v20 = 0;
  uint64_t v7 = 3758097090LL;
  if (a2 && a6 && a7)
  {
    mach_port_t v11 = sub_100096240();
    if (v11)
    {
      mach_port_t v17 = v11;
      sub_1000A9930(&v21, (unsigned int *)&v20, 2, v12, v13, v14, v15, v16, a2);
      size_t v19 = *a7;
      uint64_t v7 = IOConnectCallMethod(v17, 0x51u, &input, 1u, v21, v20, 0LL, 0LL, a6, &v19);
      if (!(_DWORD)v7) {
        *a7 = (int)v19;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_absinthe_generate",  ":",  3253,  "",  0,  "",  "");
      uint64_t v7 = 3758097084LL;
    }
  }

  free(v21);
  return v7;
}

uint64_t sub_1000A2AF8(unsigned int a1)
{
  input[0] = 0LL;
  input[1] = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drop_auxiliary_auth_by_uid",  ":",  3280,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A2BD0(int a1)
{
  input[0] = 1LL;
  input[1] = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x53u, input, 2u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_drop_auxiliary_auth_by_handle",  ":",  3296,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A2CAC()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x5Cu, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lower_iteration_count",  ":",  3310,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A2D50(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x6Au, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_se_secret_drop",  ":",  3326,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A2E28(void *a1, size_t *a2)
{
  size_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v2 = 3758097084LL;
  size_t __count = 0LL;
  __src = 0LL;
  if (a1 && a2 && !sub_100098A90(-1, off_1000DB6E8, &v12, &v11))
  {
    else {
      BOOL v5 = 1;
    }
    if (!v5)
    {
      size_t v6 = __count;
      if (__count)
      {
        *a2 = __count;
        uint64_t v7 = calloc(v6, 1uLL);
        *a1 = v7;
        if (v7)
        {
          memcpy(v7, __src, *a2);
          uint64_t v2 = 0LL;
        }
      }
    }
  }

  free(v12);
  return v2;
}

uint64_t sub_1000A2EF0(int a1, void *a2, size_t *a3)
{
  return sub_100098A90(a1, 0LL, a2, a3);
}

uint64_t sub_1000A2F00(int a1, void *a2)
{
  uint64_t v3 = 3758097084LL;
  size_t v8 = 0LL;
  uint64_t v9 = 0LL;
  uint64_t v7 = 0LL;
  if (!sub_100098A90(a1, off_1000DB768, &v9, &v8)
    && sub_1000A5F34((uint64_t)off_1000DB768, (uint64_t)v9, (uint64_t)v9 + v8, &v7))
  {
    if (a2)
    {
      time_t v4 = time(0LL);
      uint64_t v3 = 0LL;
      time_t v5 = v4 - v7;
      if (v4 <= v7) {
        time_t v5 = 0LL;
      }
      *a2 = v5;
    }

    else
    {
      uint64_t v3 = 0LL;
    }
  }

  free(v9);
  return v3;
}

uint64_t sub_1000A2FA4(int a1, char *a2)
{
  uint64_t v3 = 3758097090LL;
  uint64_t input = a1;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096LL;
  mach_port_t v4 = sub_100096240();
  if (!v4)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_internal_state",  ":",  3405,  "",  0,  "",  "");
    uint64_t v3 = 3758097084LL;
    goto LABEL_11;
  }

  if (!a2)
  {
LABEL_11:
    rsize_t v6 = 4096LL;
    goto LABEL_9;
  }

  uint64_t v5 = IOConnectCallMethod(v4, 0x8Eu, &input, 1u, 0LL, 0LL, 0LL, 0LL, __s, &__n);
  rsize_t v6 = __n;
  if ((_DWORD)v5)
  {
    uint64_t v3 = v5;
  }

  else if (__n - 4097 >= 0xFFFFFFFFFFFFF000LL)
  {
    else {
      uint64_t v3 = 0LL;
    }
    rsize_t v6 = __n;
  }

uint64_t sub_1000A311C(const void *a1, size_t a2, void *a3, size_t *a4)
{
  uint64_t input = 266LL;
  uint64_t result = 3758097090LL;
  if (a3 && a4)
  {
    mach_port_t v9 = sub_100096240();
    if (v9)
    {
      size_t v10 = *a4;
      uint64_t result = IOConnectCallMethod(v9, 0x68u, &input, 1u, a1, a2, 0LL, 0LL, a3, &v10);
      if (!(_DWORD)result) {
        *a4 = (int)v10;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_fairplay_wrap",  ":",  3431,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_1000A3240(unsigned int a1, const void *a2, size_t a3, void *a4, size_t *a5)
{
  uint64_t input = ((unint64_t)a1 << 8) | 1;
  uint64_t result = 3758097090LL;
  if (a4 && a5)
  {
    mach_port_t v10 = sub_100096240();
    if (v10)
    {
      size_t v11 = *a5;
      uint64_t result = IOConnectCallMethod(v10, 0x68u, &input, 1u, a2, a3, 0LL, 0LL, a4, &v11);
      if (!(_DWORD)result) {
        *a5 = (int)v11;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "_fairplay_generate_csk_internal",  ":",  3455,  "",  0,  "",  "");
      return 3758097084LL;
    }
  }

  return result;
}

uint64_t sub_1000A336C(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_1000A3240(0, a1, a2, a3, a4);
}

uint64_t sub_1000A3384(const void *a1, size_t a2, void *a3, size_t *a4)
{
  return sub_1000A3240(1u, a1, a2, a3, a4);
}

uint64_t sub_1000A339C(uint64_t a1, const void *a2, size_t a3, void *a4, void *a5)
{
  size_t v16 = 0x4000LL;
  input[0] = 1LL;
  input[1] = a1;
  mach_port_t v10 = sub_100096240();
  if (v10)
  {
    uint64_t v11 = IOConnectCallMethod(v10, 0x87u, input, 2u, a2, a3, 0LL, 0LL, __s, &v16);
    if ((_DWORD)v11)
    {
      uint64_t v14 = v11;
    }

    else
    {
      if (v16 >= 0x2C) {
        size_t v12 = 44LL;
      }
      else {
        size_t v12 = v16;
      }
      __memcpy_chk(v19, __s, v12, 44LL);
      *a5 = 44LL;
      uint64_t v13 = calloc(0x2CuLL, 1uLL);
      *a4 = v13;
      if (v13)
      {
        __memcpy_chk(v13, v19, *a5, 44LL);
        uint64_t v14 = 0LL;
      }

      else
      {
        uint64_t v14 = 3758097085LL;
      }
    }
  }

  else
  {
    uint64_t v14 = 3758097084LL;
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_bak_get_beacon_internal",  ":",  3491,  "",  0,  "",  "");
  }

  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  return v14;
}

uint64_t sub_1000A356C( int a1, unsigned int a2, const void *a3, size_t a4, void *a5, void *a6, void *a7)
{
  mach_port_t v17 = 0LL;
  memset(__n, 0, 44);
  uint64_t v10 = sub_1000A339C(a1 ^ 1u | ((unint64_t)a2 << 16), a3, a4, &v17, __n);
  if ((_DWORD)v10)
  {
    uint64_t v15 = v10;
    uint64_t v11 = v17;
    goto LABEL_10;
  }

  uint64_t v11 = v17;
  if (__n[0] != 44)
  {
    uint64_t v15 = 3758604312LL;
LABEL_10:
    if (!v11) {
      return v15;
    }
    goto LABEL_6;
  }

  __int128 v12 = v17[1];
  *(_OWORD *)&__n[1] = *v17;
  *(_OWORD *)&__n[3] = v12;
  LODWORD(__n[5]) = *((_DWORD *)v17 + 8);
  uint64_t v13 = *(void *)((char *)v17 + 36);
  uint64_t v14 = calloc(0x1CuLL, 1uLL);
  *a5 = v14;
  if (v14)
  {
    *a6 = 28LL;
    *uint64_t v14 = *(_OWORD *)&__n[2];
    *(_OWORD *)((char *)v14 + 12) = *(_OWORD *)((char *)&__n[3] + 4);
    uint64_t v15 = 0LL;
    if (a7) {
      *a7 = v13;
    }
  }

  else
  {
    uint64_t v15 = 3758097085LL;
  }

uint64_t sub_1000A36AC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  input[0] = 2LL;
  input[1] = a1;
  int v37 = 0;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v28 = 0u;
  memset(v27, 0, sizeof(v27));
  bzero(__s, 0x4000uLL);
  size_t v25 = 0x4000LL;
  mach_port_t v9 = sub_100096240();
  if (v9)
  {
    uint64_t v10 = IOConnectCallMethod(v9, 0x87u, input, 2u, 0LL, 0LL, 0LL, 0LL, __s, &v25);
    if ((_DWORD)v10)
    {
      uint64_t v11 = v10;
    }

    else
    {
      uint64_t v11 = 3758097085LL;
      if (v25 >= 0xC4) {
        size_t v12 = 196LL;
      }
      else {
        size_t v12 = v25;
      }
      __memcpy_chk(v27, __s, v12, 196LL);
      uint64_t v13 = calloc(0x28uLL, 1uLL);
      *a2 = v13;
      if (v13)
      {
        *a3 = 40LL;
        __int128 v14 = *(_OWORD *)&v27[1];
        __int128 v15 = *(_OWORD *)&v27[3];
        v13[4] = v27[5];
        *(_OWORD *)uint64_t v13 = v14;
        *((_OWORD *)v13 + 1) = v15;
        size_t v16 = calloc(0x91uLL, 1uLL);
        *a4 = v16;
        if (v16)
        {
          uint64_t v11 = 0LL;
          *a5 = 145LL;
          __int128 v17 = v29;
          *size_t v16 = v28;
          v16[1] = v17;
          __int128 v18 = v30;
          __int128 v19 = v31;
          __int128 v20 = v33;
          v16[4] = v32;
          v16[5] = v20;
          v16[2] = v18;
          v16[3] = v19;
          __int128 v21 = v34;
          __int128 v22 = v35;
          __int128 v23 = v36;
          *((_BYTE *)v16 + 1memset(v19, 0, 44) = v37;
          v16[7] = v22;
          v16[8] = v23;
          v16[6] = v21;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_bak_get_swizzler_internal",  ":",  3551,  "",  0,  "",  "");
    uint64_t v11 = 3758097084LL;
  }

  memset_s(__s, 0x4000uLL, 0, 0x4000uLL);
  memset_s(v27, 0xC4uLL, 0, 0xC4uLL);
  return v11;
}

uint64_t sub_1000A38FC(void *a1, void *a2, void *a3, void *a4)
{
  return sub_1000A36AC(0LL, a1, a2, a3, a4);
}

uint64_t sub_1000A3914(uint64_t a1)
{
  mach_port_t v2 = sub_1000981D8();
  if (v2) {
    return IOConnectCallMethod(v2, 0xCu, 0LL, 0, *(const void **)a1, *(void *)(a1 + 8), 0LL, 0LL, 0LL, 0LL);
  }
  else {
    return 3758097084LL;
  }
}

uint64_t sub_1000A396C(void *a1, size_t *a2)
{
  size_t __count = 0x4000LL;
  mach_port_t v4 = sub_100096240();
  if (v4)
  {
    uint64_t v5 = 3758097090LL;
    if (a1 && a2)
    {
      uint64_t v6 = IOConnectCallMethod(v4, 0x96u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, __src, &__count);
      if ((_DWORD)v6)
      {
        uint64_t v5 = v6;
      }

      else
      {
        uint64_t v7 = calloc(__count, 1uLL);
        *a1 = v7;
        if (v7)
        {
          size_t v8 = __count;
          *a2 = __count;
          memcpy(v7, __src, v8);
          uint64_t v5 = 0LL;
        }

        else
        {
          uint64_t v5 = 3758097085LL;
        }
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_dsme_key",  ":",  3600,  "",  0,  "",  "");
    uint64_t v5 = 3758097084LL;
  }

  memset_s(__src, 0x4000uLL, 0, 0x4000uLL);
  return v5;
}

BOOL sub_1000A3AF8(uint64_t a1, uint64_t a2)
{
  return a2 == 4 || a2 == 32;
}

uint64_t sub_1000A3B0C()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x73u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_prewarm_sps",  ":",  3627,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A3BB0(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 4294967285LL;
  if (a3 && a4 <= 0x30)
  {
    uint64_t v4 = 3758097084LL;
    mach_port_t v9 = sub_100096240();
    if (v9)
    {
      mach_port_t v10 = v9;
      int v11 = ccder_sizeof_raw_octet_string(16LL);
      uint64_t v12 = a2;
      int v13 = ccder_sizeof_uint64(a2);
      int v14 = ccder_sizeof_raw_octet_string(a4);
      uint64_t v15 = ccder_sizeof(0x2000000000000010LL, (v13 + v11 + v14));
      int v16 = v15;
      size_t v17 = v15;
      __chkstk_darwin(v15);
      __int128 v19 = (char *)&v25 - v18;
      bzero((char *)&v25 - v18, v17);
      __int128 v20 = &v19[v16];
      uint64_t v21 = ccder_encode_raw_octet_string(a4, a3, v19, v20);
      uint64_t v22 = ccder_encode_uint64(v12, v19, v21);
      uint64_t v23 = ccder_encode_raw_octet_string(16LL, a1, v19, v22);
      else {
        return 3758097090LL;
      }
    }

    else
    {
      fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_sealed_hashes_set",  ":",  3644,  "",  0,  "",  "");
    }
  }

  return v4;
}

uint64_t sub_1000A3DC0(const void *a1, size_t a2)
{
  mach_port_t v4 = sub_100096240();
  if (v4) {
    return IOConnectCallMethod(v4, 0x90u, 0LL, 0, a1, a2, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_measure_and_seal_cryptex_manifest",  ":",  3674,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A3E74()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x95u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_seal_cryptex_manifest_lock",  ":",  3688,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A3F18(int a1, uint64_t a2, uint64_t a3)
{
  input[0] = a1;
  input[1] = a2;
  uint64_t input[2] = a3;
  mach_port_t v3 = sub_100096240();
  if (v3) {
    return IOConnectCallMethod(v3, 0x85u, input, 3u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_lkgp_recover",  ":",  3704,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A3FF4(int a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x8Au, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_memento_efface_blob",  ":",  3720,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A40CC(int a1, _BYTE *a2)
{
  uint64_t input = a1;
  bzero(__s, 0x1000uLL);
  rsize_t __n = 4096LL;
  mach_port_t v3 = sub_100096240();
  if (v3)
  {
    uint64_t v4 = IOConnectCallMethod(v3, 0x8Bu, &input, 1u, 0LL, 0LL, 0LL, 0LL, __s, &__n);
    rsize_t v5 = __n;
    if ((_DWORD)v4)
    {
      uint64_t v6 = v4;
    }

    else
    {
      uint64_t v6 = 3758097090LL;
      if (__n - 4097 >= 0xFFFFFFFFFFFFF000LL)
      {
        else {
          uint64_t v6 = 0LL;
        }
        rsize_t v5 = __n;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_memento_get_state",  ":",  3738,  "",  0,  "",  "");
    uint64_t v6 = 3758097084LL;
    rsize_t v5 = 4096LL;
  }

  memset_s(__s, v5, 0, v5);
  return v6;
}

uint64_t sub_1000A4248()
{
  mach_port_t v0 = sub_100096240();
  if (v0) {
    return IOConnectCallMethod(v0, 0x89u, &input, 0, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_jcop_supports_updated_kud_policy",  ":",  3758,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A42EC(uint64_t a1)
{
  uint64_t input = a1;
  mach_port_t v1 = sub_100096240();
  if (v1) {
    return IOConnectCallMethod(v1, 0x97u, &input, 1u, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL);
  }
  fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_set_cx_window",  ":",  3774,  "",  0,  "",  "");
  return 3758097084LL;
}

uint64_t sub_1000A43C0(void *a1)
{
  size_t v5 = 4096LL;
  if (!a1) {
    return 4294967285LL;
  }
  mach_port_t v2 = sub_100096240();
  if (v2)
  {
    mach_port_t v3 = v2;
    bzero(outputStruct, 0x1000uLL);
    uint64_t result = IOConnectCallMethod(v3, 0x98u, 0LL, 0, 0LL, 0LL, 0LL, 0LL, outputStruct, &v5);
    if (!(_DWORD)result)
    {
      if (v5 == 8)
      {
        uint64_t result = 0LL;
        *a1 = outputStruct[0];
      }

      else
      {
        return 3758604298LL;
      }
    }
  }

  else
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s aks connection failed%s\n",  "aks",  "",  "",  "",  "aks_get_cx_window",  ":",  3791,  "",  0,  "",  "");
    return 3758097084LL;
  }

  return result;
}

uint64_t sub_1000A4514()
{
  return 0LL;
}

uint64_t sub_1000A4520(uint64_t a1)
{
  uint64_t v2 = ccsha256_di(a1);
  ccdigest(v2, 16LL, a1, v4);
  return LODWORD(v4[0]);
}

unint64_t sub_1000A4590(unsigned int a1)
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return 1000000000 * info.denom * (unint64_t)a1 / info.numer;
}

unint64_t sub_1000A45D8(uint64_t a1)
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return (unint64_t)info.numer * a1 / info.denom;
}

uint64_t sub_1000A4614()
{
  mach_timebase_info info = 0LL;
  mach_timebase_info(&info);
  return mach_continuous_time() * info.numer / info.denom / 0x3E8;
}

__darwin_time_t sub_1000A4664()
{
  v1.tv_sec = 0LL;
  *(void *)&v1.tv_usec = 0LL;
  gettimeofday(&v1, 0LL);
  return v1.tv_sec;
}

uint64_t sub_1000A4690(uint64_t a1)
{
  return 1000000 * a1;
}

unint64_t sub_1000A46A0(uint64_t a1)
{
  return (a1 + 999999) / 0xF4240uLL;
}

void *sub_1000A46B8(unsigned int a1, unsigned int a2)
{
  uint64_t v2 = a1 + 1LL;
  uint64_t v3 = v2 << 31 >> 31;
  if (v3 != v2 || v3 < 0)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s overflow%s\n",  "aks",  "",  "",  "",  "circular_queue_init",  ":",  341,  "",  0,  "",  "");
    return 0LL;
  }

  else
  {
    size_t v5 = calloc(0x20uLL, 1uLL);
    uint64_t v6 = v5;
    if (v5)
    {
      v5[1] = 0LL;
      size_t v7 = (v3 & 0x1FFFFFFFFLL) * a2;
      *(_DWORD *)size_t v5 = a2;
      *((_DWORD *)v5 + 1) = v2;
      size_t v8 = calloc(v7, 1uLL);
      void v6[2] = v7;
      v6[3] = v8;
    }
  }

  return v6;
}

uint64_t sub_1000A4794(_DWORD *a1)
{
  unsigned int v3 = a1[2];
  unsigned int v2 = a1[3];
  uint64_t result = v2 - v3;
  if (v2 < v3) {
    return (result + a1[1]);
  }
  return result;
}

uint64_t sub_1000A47B0(unsigned int *a1, const void *a2)
{
  unsigned int v3 = a1[3];
  unsigned int v4 = (v3 + 1) % a1[1];
  memcpy((void *)(*((void *)a1 + 3) + *a1 * v3), a2, *a1);
  a1[3] = v4;
  if (v4 == a1[2]) {
    a1[2] = (v4 + 1) % a1[1];
  }
  return 0LL;
}

uint64_t sub_1000A4818(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  if (__dst)
  {
    memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
    unsigned int v2 = a1[2];
  }

  memset_s((void *)(*((void *)a1 + 3) + *a1 * v2), *a1, 0, *a1);
  uint64_t result = 0LL;
  a1[2] = (a1[2] + 1) % a1[1];
  return result;
}

uint64_t sub_1000A48A0(unsigned int *a1, void *__dst)
{
  unsigned int v2 = a1[2];
  if (v2 == a1[3]) {
    return 0xFFFFFFFFLL;
  }
  memcpy(__dst, (const void *)(*((void *)a1 + 3) + *a1 * v2), *a1);
  return 0LL;
}

uint64_t sub_1000A48E4(int *a1, void *a2, unsigned int *a3)
{
  unsigned int v7 = a1[2];
  unsigned int v6 = a1[3];
  unsigned int v8 = v6 - v7;
  if (v6 < v7) {
    v8 += a1[1];
  }
  if (!v8) {
    return 0LL;
  }
  unsigned int v9 = *a1 * v8;
  mach_port_t v10 = (char *)calloc(v9, 1uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  int v11 = v10;
  unsigned int v12 = a1[2];
  unsigned int v13 = a1[3];
  if (v13 <= v12)
  {
    if (v12 <= v13) {
      goto LABEL_13;
    }
    unsigned int v17 = a1[1] - v12;
    memcpy(v10, (const void *)(*((void *)a1 + 3) + *a1 * v12), *a1 * v17);
    if (v8 <= v17) {
      goto LABEL_13;
    }
    mach_port_t v10 = &v11[*a1 * v17];
    int v14 = (const void *)*((void *)a1 + 3);
    size_t v15 = *a1 * (v8 - v17);
  }

  else
  {
    int v14 = (const void *)(*((void *)a1 + 3) + *a1 * v12);
    size_t v15 = *a1 * v8;
  }

  memcpy(v10, v14, v15);
LABEL_13:
  unsigned int v18 = a1[1];
  int v19 = *a1;
  a1[2] = (a1[2] + v8) % v18;
  memset_s(*((void **)a1 + 3), v19 * v18, 0, v19 * v18);
  uint64_t result = 0LL;
  *a2 = v11;
  *a3 = v9;
  return result;
}

uint64_t sub_1000A4A0C(uint64_t a1)
{
  *(void *)(a1 + 8) = 0LL;
  rsize_t v1 = (*(_DWORD *)a1 * *(_DWORD *)(a1 + 4));
  return memset_s(*(void **)(a1 + 24), v1, 0, v1);
}

void sub_1000A4A2C(void *a1)
{
  *((void *)a1 + 1) = 0LL;
  rsize_t v2 = (*(_DWORD *)a1 * *((_DWORD *)a1 + 1));
  memset_s(*((void **)a1 + 3), v2, 0, v2);
  memset_s(*((void **)a1 + 3), *((void *)a1 + 2), 0, *((void *)a1 + 2));
  free(*((void **)a1 + 3));
  memset_s(a1, 0x20uLL, 0, 0x20uLL);
  free(a1);
}

uint64_t sub_1000A4A94(unsigned int a1)
{
  return (a1 >> 5) & 1;
}

BOOL sub_1000A4A9C(uint8x16_t *a1)
{
  int8x16_t v1 = (int8x16_t)vmovl_high_u8(*a1);
  int8x16_t v2 = (int8x16_t)vmovl_u8(*(uint8x8_t *)a1->i8);
  int8x16_t v3 = (int8x16_t)vmovl_u16((uint16x4_t)vorr_s8( vorr_s8(*(int8x8_t *)v2.i8, *(int8x8_t *)v1.i8),  vorr_s8( (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL),  (int8x8_t)*(_OWORD *)&vextq_s8(v1, v1, 8uLL))));
  return vorr_s8(*(int8x8_t *)v3.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v3, v3, 8uLL)) != 0LL;
}

BOOL sub_1000A4AE0(unsigned __int8 *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  int v2 = 0;
  do
  {
    int v3 = *a1++;
    v2 |= v3;
    --a2;
  }

  while (a2);
  return v2 != 0;
}

_DWORD *sub_1000A4B0C(_DWORD *result)
{
  if (result) {
    return (_DWORD *)(*result != 0);
  }
  return result;
}

uint64_t sub_1000A4B20(char a1, int a2)
{
  return a1 & 0x1F | (32 * a2);
}

uint64_t sub_1000A4B28(unsigned int a1)
{
  return (a1 >> 6) & 1;
}

uint64_t sub_1000A4B30(int a1)
{
  return a1 & 0xFFFFFFBF;
}

uint64_t sub_1000A4B38(int a1)
{
  return a1 | 0x40u;
}

uint64_t sub_1000A4B40(char a1)
{
  char v1 = a1 & 0x1F;
  if ((a1 & 0x1Fu) >= 0x14) {
    char v1 = -1;
  }
  return ((a1 & 0x1Fu) < 0x14) & (0xC3FC0u >> v1);
}

uint64_t sub_1000A4B68(char a1)
{
  if ((a1 & 0x1Fu) > 0x13) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a1 & 0x1F;
  }
}

uint64_t sub_1000A4B78(char a1)
{
  unsigned int v1 = a1 & 0x1F;
  if (v1 > 0x13) {
    unsigned int v1 = -1;
  }
  return (v1 < 0x12) & (0x2E03Eu >> v1);
}

uint64_t sub_1000A4BA0(char a1)
{
  return a1 & 0xF;
}

BOOL sub_1000A4BA8(int a1, int a2)
{
  return ((a2 ^ a1) & 0xF) == 0;
}

uint64_t sub_1000A4BB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return cc_cmp_safe(a3, a1, a2);
}

uint64_t sub_1000A4BCC(const char *a1, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = a3;
  unsigned int v4 = a1;
  char v24 = 0;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  *(_OWORD *)__str = 0u;
  __int128 v17 = 0u;
  size_t v5 = &__stdoutp;
  if (a3 >= 0x41)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s %sdump %s (len = %zd)%s%s\n",  "aks",  "",  "",  "",  "dump_bytes_internal",  ":",  786,  "",  0,  "",  "",  a1,  a3,  "",  "");
    unsigned int v4 = "";
  }

  else if (!a3)
  {
    return memset_s(__str, 0x81uLL, 0, 0x81uLL);
  }

  unint64_t v6 = 0LL;
  unint64_t v15 = v3;
  do
  {
    unsigned int v7 = v5;
    if (v3 - v6 >= 0x40) {
      uint64_t v8 = 64LL;
    }
    else {
      uint64_t v8 = v3 - v6;
    }
    if (v8)
    {
      unsigned int v9 = (unsigned __int8 *)(a2 + v6);
      mach_port_t v10 = __str;
      uint64_t v11 = v8;
      do
      {
        int v12 = *v9++;
        snprintf(v10, 3uLL, "%02x", v12);
        v10 += 2;
        --v11;
      }

      while (v11);
    }

    size_t v5 = v7;
    fprintf( *v7,  "%s%s:%s%s%s%s%u:%s%u:%s %s%s%s[%04zu,%04zu): %s%s%s%s\n",  "aks",  "",  "",  "",  "dump_bytes_internal",  ":",  796,  "",  0,  "",  "",  v4,  "",  v6,  v8 + v6,  "",  __str,  "",  "");
    v6 += v8;
    unint64_t v3 = v15;
  }

  while (v6 < v15);
  return memset_s(__str, 0x81uLL, 0, 0x81uLL);
}

_BYTE *sub_1000A4DA8(unsigned __int8 *a1, unint64_t a2)
{
  if (a2 >= 0x10) {
    uint64_t v2 = 16LL;
  }
  else {
    uint64_t v2 = a2;
  }
  if (v2)
  {
    unsigned int v4 = byte_1000DBCB0;
    uint64_t v5 = v2;
    do
    {
      int v6 = *a1++;
      snprintf(v4, 3uLL, "%02x", v6);
      v4 += 2;
      --v5;
    }

    while (v5);
  }

  byte_1000DBCB0[2 * v2] = 0;
  return byte_1000DBCB0;
}

uint64_t sub_1000A4E38(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  v10[0] = 0x101010101010101LL;
  v10[1] = 0x101010101010101LL;
  if (a4 == 3)
  {
    uint64_t v7 = ccsha256_di(a1);
    cchmac(v7, a2 >> 1, a1, 16LL, v10, __s);
    uint64_t v8 = 0LL;
    *(_WORD *)a3 = __s[0];
    *(_BYTE *)(a3 + 2) = BYTE2(__s[0]);
  }

  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  return v8;
}

uint64_t sub_1000A4F00(const char *a1, uint64_t a2, unint64_t a3)
{
  char v6 = 0;
  __int16 v5 = 0;
  sub_1000A4E38(a2, a3, (uint64_t)&v5, 3LL);
  return sub_1000A4BCC(a1, (uint64_t)&v5, 3uLL);
}

char *sub_1000A4F54(char *result, unint64_t a2)
{
  if (a2 >= 2)
  {
    unint64_t v2 = a2 >> 1;
    unint64_t v3 = &result[a2 - 1];
    do
    {
      char v4 = *result;
      *result++ = *v3;
      *v3-- = v4;
      --v2;
    }

    while (v2);
  }

  return result;
}

uint64_t sub_1000A4F84(unsigned __int8 *a1, unint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v5 = 0xFFFFFFFFLL;
  if ((a2 & 1) == 0)
  {
    char v6 = a1;
    if (a1)
    {
      if (a3 && a4)
      {
        unint64_t v9 = a2 >> 1;
        mach_port_t v10 = calloc(a2 >> 1, 1uLL);
        if (v10)
        {
          if (a2 >= 2)
          {
            if (v9 <= 1) {
              uint64_t v11 = 1LL;
            }
            else {
              uint64_t v11 = a2 >> 1;
            }
            int v12 = v10;
            do
            {
              int v13 = *v6;
              unsigned int v14 = v13 - 48;
              unsigned int v15 = v13 - 97;
              else {
                char v16 = v13 - 55;
              }
              char v17 = v13 - 87;
              if (v15 > 5) {
                char v17 = v16;
              }
              if (v14 < 0xA) {
                char v17 = v14;
              }
              char v18 = 16 * v17;
              int v19 = v6[1];
              unsigned int v20 = v19 - 48;
              unsigned int v21 = v19 - 97;
              else {
                char v22 = v19 - 55;
              }
              char v23 = v19 - 87;
              if (v21 > 5) {
                char v23 = v22;
              }
              if (v20 < 0xA) {
                char v23 = v20;
              }
              *v12++ = v23 | v18;
              v6 += 2;
              --v11;
            }

            while (v11);
          }

          uint64_t v5 = 0LL;
          *a3 = v10;
          *a4 = v9;
        }

        else
        {
          return 4294967279LL;
        }
      }
    }
  }

  return v5;
}

uint64_t sub_1000A5088(uint64_t result)
{
  return result;
}

uint64_t sub_1000A50A4(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0) {
    return 4294967285LL;
  }
  if (a2 && *(void *)a2 && (size_t v7 = *(void *)(a2 + 8)) != 0)
  {
    uint64_t v8 = calloc(v7, 1uLL);
    if (v8)
    {
      *a1 = v8;
      unint64_t v9 = *(const void **)a2;
      a1[1] = *(void *)(a2 + 8);
      memcpy(v8, v9, *(void *)(a2 + 8));
      return 0LL;
    }

    else
    {
      return 4294967279LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a1 = 0LL;
    a1[1] = 0LL;
  }

  return result;
}

uint64_t sub_1000A5138(uint64_t result, int a2, const char *a3)
{
  if ((result & 1) == 0)
  {
    fprintf( __stdoutp,  "%s%s:%s%s%s%s%u:%s%u:%s failed REQUIRE condition (%s:%d)\n%s\n",  "aks",  "",  "",  "",  "REQUIRE_func",  ":",  1047,  "",  0,  "",  a3,  a2,  "");
    abort();
  }

  return result;
}

uint64_t sub_1000A51A8(_OWORD *a1, _OWORD *a2)
{
  int __s = 0x1000000;
  __int128 v4 = a2[1];
  void v10[2] = *a2;
  v10[3] = v4;
  __int128 v5 = a1[1];
  v10[4] = *a1;
  v10[5] = v5;
  uint64_t v6 = cccurve25519(v10, v11, a1);
  uint64_t v7 = ccsha256_di(v6);
  ccdigest(v7, 100LL, &__s, a2 + 2);
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  memset_s(v11, 0x20uLL, 0, 0x20uLL);
  return 0LL;
}

uint64_t sub_1000A5290( uint64_t a1, uint64_t (*a2)(uint64_t, void *, uint64_t *, uint64_t *, uint64_t), char a3, uint64_t *a4, unsigned int a5, uint64_t a6, unsigned int *a7)
{
  unsigned int v38 = 0;
  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  memset(__s, 0, sizeof(__s));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (!a6 || !a7) {
    goto LABEL_46;
  }
  uint64_t v13 = a1;
  if ((a3 & 0x10) != 0) {
    unsigned int v14 = "SEP derived_key";
  }
  else {
    unsigned int v14 = "derived_key";
  }
  if ((a3 & 0x10) != 0) {
    uint64_t v15 = 16LL;
  }
  else {
    uint64_t v15 = 12LL;
  }
  if (!a1)
  {
LABEL_20:
    if (a2)
    {
      if (sub_100095F5C(a5, &v38))
      {
        if (*a7 < v38) {
          goto LABEL_46;
        }
        unsigned int v20 = 0LL;
        unsigned int v21 = 0;
        char v22 = a2;
        char v23 = a4;
        goto LABEL_44;
      }
    }

    else
    {
      if ((a3 & 4) != 0)
      {
        if ((a5 & 0xF) != 0 || *a7 < a5) {
          goto LABEL_46;
        }
        unsigned int v38 = a5;
        uint64_t v32 = ccaes_cbc_encrypt_mode(a1);
        sub_1000A5B08(v32, 32LL, v13 + 8, (uint64_t)&unk_1000DBD80, a5 & 0xFFFFFFF0);
LABEL_45:
        uint64_t v8 = 0LL;
        *a7 = v38;
        goto LABEL_46;
      }

      uint64_t v25 = sub_100095F5C(a5, &v38);
      if ((_DWORD)v25)
      {
        if (*a7 < v38) {
          goto LABEL_46;
        }
        if ((a3 & 8) != 0)
        {
          uint64_t v34 = ccsha256_di(v25);
          cchkdf(v34, 32LL, v13 + 8, 0LL, 0LL, v15, v14, 32LL, __s);
          unsigned int v20 = __s;
        }

        else
        {
          unsigned int v20 = (_OWORD *)(v13 + 8);
        }

        unsigned int v21 = 32;
        char v22 = 0LL;
        char v23 = a4;
LABEL_44:
        goto LABEL_45;
      }
    }

    uint64_t v8 = 4294967285LL;
    if ((a3 & 8) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }

  int v16 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 - 1) >= 2)
  {
    if (v16) {
      goto LABEL_46;
    }
    goto LABEL_20;
  }

  __int128 v36 = v14;
  if ((a3 & 4) != 0) {
    unsigned int v17 = 64;
  }
  else {
    unsigned int v17 = 72;
  }
  unsigned int v38 = v17;
  if (!a2 && a5 == 32 && *a7 >= v17)
  {
    if (v16 == 1)
    {
      a1 = sub_1000A51A8((_OWORD *)(a1 + 36), &v40);
    }

    else
    {
      __int128 v26 = *(_OWORD *)(a1 + 20);
      __int128 v40 = *(_OWORD *)(a1 + 4);
      __int128 v41 = v26;
      __int128 v27 = *(_OWORD *)(a1 + 52);
      __int128 v42 = *(_OWORD *)(a1 + 36);
      __int128 v43 = v27;
    }

    if ((a3 & 0x80) == 0)
    {
      __int128 v28 = v41;
      *(_OWORD *)a6 = v40;
      *(_OWORD *)(a6 + 16) = v28;
      if ((a3 & 4) != 0)
      {
        uint64_t v31 = ccaes_cbc_encrypt_mode(a1);
        sub_1000A5B08(v31, 32LL, (uint64_t)&v42, (uint64_t)&unk_1000DBD80, 0x20uLL);
        goto LABEL_40;
      }

      int v37 = 40;
      if ((a3 & 8) != 0)
      {
        uint64_t v33 = ccsha256_di(a1);
        cchkdf(v33, 32LL, &v42, 0LL, 0LL, v15, v36, 32LL, __s);
        __int128 v30 = (void *)(a6 + 32);
        __int128 v29 = __s;
      }

      else
      {
        __int128 v29 = &v42;
        __int128 v30 = (void *)(a6 + 32);
      }

      if (!sub_100095B30((uint64_t)v29, 0x20u, 0xA6A6A6A6A6A6A6A6LL, 0LL, a4, 0x20u, v30, &v37))
      {
LABEL_40:
        uint64_t v8 = 0LL;
        *a7 = v17;
        if ((a3 & 8) == 0) {
          goto LABEL_48;
        }
        goto LABEL_47;
      }
    }
  }

uint64_t sub_1000A55F8(_OWORD *a1, uint64_t a2, _OWORD *a3, uint64_t a4)
{
  __int128 v5 = a1[1];
  _OWORD v11[2] = *a1;
  v11[3] = v5;
  __int128 v6 = a3[1];
  v11[4] = *a3;
  int __s = 0x1000000;
  v11[5] = v6;
  uint64_t v7 = cccurve25519(v11, a2, a1);
  uint64_t v8 = ccsha256_di(v7);
  ccdigest(v8, 100LL, &__s, a4);
  memset_s(&__s, 0x64uLL, 0, 0x64uLL);
  return 0LL;
}

uint64_t sub_1000A56B4( uint64_t a1, uint64_t (*a2)(void, void *, unint64_t *, unint64_t *, uint64_t), char a3, void *a4, unsigned int a5, void *a6, unsigned int *a7)
{
  HIDWORD(v30) = 0;
  memset(v33, 0, sizeof(v33));
  uint64_t v8 = 0xFFFFFFFFLL;
  if (a4 && a5)
  {
    if ((a3 & 0x10) != 0) {
      uint64_t v15 = "SEP derived_key";
    }
    else {
      uint64_t v15 = "derived_key";
    }
    if ((a3 & 0x10) != 0) {
      uint64_t v16 = 16LL;
    }
    else {
      uint64_t v16 = 12LL;
    }
    if (!a1)
    {
LABEL_12:
      if (a5 <= 0x28)
      {
        if (a2)
        {
          if (sub_100095FB8(a5, (unsigned int *)&v30 + 1) && *a7 >= HIDWORD(v30))
          {
            unsigned int v17 = 0LL;
            unsigned int v18 = 0;
            int v19 = a2;
            goto LABEL_36;
          }
        }

        else if ((a3 & 4) != 0)
        {
          if ((a5 & 0xF) == 0 && *a7 >= a5)
          {
            HIDWORD(v30) = a5;
            uint64_t v24 = ccaes_cbc_decrypt_mode(a1);
            sub_1000A5B08(v24, 32LL, a1 + 8, (uint64_t)&unk_1000DBD80, a5 & 0xFFFFFFF0);
LABEL_37:
            uint64_t v8 = 0LL;
            *a7 = HIDWORD(v30);
            goto LABEL_41;
          }
        }

        else
        {
          BOOL v20 = sub_100095FB8(a5, (unsigned int *)&v30 + 1);
          if (v20 && *a7 >= HIDWORD(v30))
          {
            if ((a3 & 8) != 0)
            {
              uint64_t v27 = ccsha256_di(v20);
              ((void (*)(uint64_t, uint64_t, uint64_t, void, void, uint64_t, const char *, uint64_t, _OWORD *, uint64_t, void, void, void, void))cchkdf)( v27,  32LL,  a1 + 8,  0LL,  0LL,  v16,  v15,  32LL,  v33,  v30,  __s,  *((void *)&__s + 1),  v32,  *((void *)&v32 + 1));
              unsigned int v17 = v33;
            }

            else
            {
              unsigned int v17 = (_OWORD *)(a1 + 8);
            }

            unsigned int v18 = 32;
            int v19 = 0LL;
LABEL_36:
            if (!sub_100095EF4( (uint64_t)v17,  v18,  0xA6A6A6A6A6A6A6A6LL,  v19,  a4,  a5,  a6,  (_DWORD *)&v30 + 1)) {
              goto LABEL_37;
            }
            goto LABEL_46;
          }
        }
      }

uint64_t sub_1000A5A04(void *a1, void *a2, size_t *a3)
{
  size_t v6 = ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
  uint64_t v7 = calloc(v6, 1uLL);
  if (!v7) {
    return 4294967279LL;
  }
  uint64_t v8 = v7;
  ccec_export_pub(a1, v7);
  uint64_t result = 0LL;
  *a2 = v8;
  *a3 = v6;
  return result;
}

unint64_t sub_1000A5A80(uint64_t a1)
{
  return (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
}

unint64_t sub_1000A5AA0(uint64_t a1)
{
  return (((unint64_t)(cczp_bitlen(a1) + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
}

unint64_t sub_1000A5AC4(void *a1)
{
  return ((unint64_t)(cczp_bitlen(*a1) + 7) >> 2) | 1;
}

unint64_t sub_1000A5AE8(void *a1)
{
  return (unint64_t)(cczp_bitlen(*a1) + 7) >> 3;
}

uint64_t sub_1000A5B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  return cccbc_one_shot(a1, a2, a3, a4, a5 >> 4);
}

uint64_t sub_1000A5B10(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return ccecb_one_shot(a1, a2, a3, a4 >> 4);
}

uint64_t sub_1000A5B18(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  return cccbc_update(a1, a2, a3, a4 >> 4);
}

BOOL sub_1000A5B20(void *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
}

uint64_t sub_1000A5B98(void *a1, void **a2)
{
  return 1LL;
}

uint64_t sub_1000A5BCC(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(void *)(a5 + 8) >= *(void *)a5)
  {
    char v14 = 0;
  }

  else
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    uint64_t v11 = (uint64_t)a1 + a2;
    while (1)
    {
      BOOL v12 = sub_1000A5CC8( *(const void **)(*(void *)(a5 + 24) + v9),  *(void *)(*(void *)(a5 + 24) + v9)
            + *(unsigned __int8 *)(*(void *)(*(void *)(a5 + 24) + v9) + 1LL)
            + 2LL,
              a1,
              v11);
      if (v12) {
        break;
      }
      ++v10;
      v9 += 40LL;
      if (v10 >= *(void *)a5) {
        goto LABEL_10;
      }
    }

    uint64_t v15 = (void *)(*(void *)(a5 + 24) + v9);
    if (v15[1])
    {
      char v13 = 0;
      *(_BYTE *)(a5 + 16) = 1;
    }

    else
    {
      ++*(void *)(a5 + 8);
      v15[1] = a3;
      v15[2] = a3 + a4;
      v15[3] = a3;
      v15[4] = a3 + a4;
      char v13 = 1;
    }

BOOL sub_1000A5CB0(unsigned __int8 *a1, const void *a2, uint64_t a3)
{
  return sub_1000A5CC8(a1, (uint64_t)&a1[a1[1] + 2], a2, a3);
}

BOOL sub_1000A5CC8(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  size_t v7 = sub_1000A5D30((uint64_t)a1, a2);
  return v7 == sub_1000A5D30((uint64_t)a3, a4) && memcmp(a1, a3, v7) == 0;
}

uint64_t sub_1000A5D30(uint64_t a1, uint64_t a2)
{
  v6[0] = a1;
  v6[1] = a2;
  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  else {
    return 0LL;
  }
}

uint64_t sub_1000A5D94( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), uint64_t a4)
{
  v11[0] = a1;
  v11[1] = a2;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t result = ccder_blob_decode_range(v11, 0x2000000000000011LL, v11);
  if ((_DWORD)result)
  {
    if (ccder_blob_decode_sequence_tl(v11, &v9))
    {
      while (1)
      {
        uint64_t v7 = v9;
        uint64_t result = ccder_blob_decode_tl(&v9, 12LL, &v8);
        if (!(_DWORD)result) {
          break;
        }
        if (v9 - v7 != 2) {
          return 0LL;
        }
        uint64_t result = a3(v7, v10 - v7, v9 + v8, v10 - (v9 + v8), a4);
        if (!(_DWORD)result) {
          return result;
        }
        v11[0] = v10;
        if ((ccder_blob_decode_sequence_tl(v11, &v9) & 1) == 0) {
          return 1LL;
        }
      }
    }

    else
    {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000A5E68(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  uint64_t v10 = a1;
  uint64_t v11 = 0LL;
  if (a1)
  {
    sub_1000A5D94( a4,  a5,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5ED4,  (uint64_t)&v10);
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = v11;
        uint64_t v8 = v12;
        *a2 = v11;
        *a3 = v8 - v7;
      }
    }
  }

  return v13;
}

BOOL sub_1000A5ED4(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL v8 = sub_1000A5CC8( *(const void **)a5,  *(void *)a5 + *(unsigned __int8 *)(*(void *)a5 + 1LL) + 2LL,  a1,  (uint64_t)a1 + a2);
  if (v8)
  {
    *(_BYTE *)(a5 + 24) = 1;
    *(void *)(a5 + 8) = a3;
    *(void *)(a5 + 16) = a3 + a4;
  }

  return !v8;
}

uint64_t sub_1000A5F34(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v5 = result;
  uint64_t v6 = 0LL;
  if (result)
  {
    sub_1000A5D94( a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5ED4,  (uint64_t)&v5);
    if ((_BYTE)v8)
    {
      *a4 = sub_1000A5FAC(v6, v7);
      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000A5FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = 0LL;
  v6[0] = a1;
  v6[1] = a2;
  uint64_t v2 = v7;
  unint64_t v3 = (unsigned __int8 *)v6[0];
  uint64_t result = (uint64_t)*(char *)v6[0] >> 7;
  do
  {
    unsigned int v5 = *v3++;
    uint64_t result = v5 | (unint64_t)(result << 8);
    --v2;
  }

  while (v2);
  return result;
}

uint64_t sub_1000A6014(uint64_t result, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v8 = result;
  uint64_t v9 = 0LL;
  if (result)
  {
    sub_1000A5D94( a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5ED4,  (uint64_t)&v8);
    if ((_BYTE)v11 && (v8 = v9, v9 = v10, uint64_t v12 = 0LL, v13 = 0LL, (ccder_blob_decode_range(&v8, 4LL, &v12) & 1) != 0))
    {
      uint64_t result = 1LL;
      if (a4)
      {
        if (a5)
        {
          uint64_t v7 = (v13 - v12);
          *a4 = v12;
          *a5 = v7;
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

double sub_1000A60B0(__int128 *a1, uint64_t a2, _DWORD *a3, void *a4)
{
  __int128 v11 = *a1;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if (ccder_blob_decode_range(&v11, a2, &v9))
  {
    int v8 = v9;
    *a4 = v9;
    *a3 = v10 - v8;
    double result = *(double *)&v11;
    *a1 = v11;
  }

  return result;
}

uint64_t sub_1000A611C( uint64_t a1, uint64_t a2, unsigned int (*a3)(uint64_t, void, uint64_t), uint64_t a4)
{
  *(void *)&__int128 v12 = a1;
  *((void *)&v12 + 1) = a2;
  uint64_t v6 = ccder_blob_decode_range(&v12, 0x2000000000000010LL, &v12);
  if ((_DWORD)v6)
  {
    uint64_t v11 = 0LL;
    uint64_t v7 = v12;
    if (sub_1000A61CC(&v12, &v10, &v11))
    {
      do
      {
        uint64_t v8 = v12 + v11;
        if (!a3(v7, v12 + v11 - v7, a4)) {
          break;
        }
        *(void *)&__int128 v12 = v8;
        uint64_t v7 = v8;
      }

      while ((sub_1000A61CC(&v12, &v10, &v11) & 1) != 0);
    }
  }

  return v6;
}

uint64_t sub_1000A61CC(__int128 *a1, void *a2, void *a3)
{
  uint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  __int128 v7 = *a1;
  uint64_t result = ccder_blob_decode_tag(&v7, &v9);
  if ((_DWORD)result)
  {
    uint64_t result = ccder_blob_decode_len(&v7, &v8);
    if ((_DWORD)result)
    {
      *a1 = v7;
      *a2 = v9;
      *a3 = v8;
      return 1LL;
    }
  }

  return result;
}

BOOL sub_1000A6248(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = 0LL;
  v4[0] = a1;
  v4[1] = a2;
  int v2 = ccder_blob_decode_tl(v4, 1LL, &v5);
  BOOL result = 0LL;
  if (v2)
  {
    if (v5 == 1) {
      return *(_BYTE *)v4[0] != 0;
    }
  }

  return result;
}

uint64_t sub_1000A62A0(void **a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    int v2 = *a1;
    if (!*a1) {
      break;
    }
    unint64_t v3 = (void *)*((void *)v2 + 1);
    *a1 = *(void **)v2;
    if (v3)
    {
      memset_s(v3, *((void *)v2 + 2), 0, *((void *)v2 + 2));
      free(*((void **)v2 + 1));
    }

    memset_s(v2, 0x18uLL, 0, 0x18uLL);
    free(v2);
  }

  return 0LL;
}

uint64_t sub_1000A6318(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  int v2 = (void **)a1;
  uint64_t result = (uint64_t)sub_1000A63AC(a1, a2);
  if (result)
  {
    uint64_t v4 = result;
    for (i = *v2; i != (void *)result; i = (void *)*i)
      int v2 = (void **)i;
    *int v2 = *(void **)result;
    uint64_t v6 = *(void **)(result + 8);
    if (v6)
    {
      memset_s(v6, *(void *)(v4 + 16), 0, *(void *)(v4 + 16));
      free(*(void **)(v4 + 8));
    }

    memset_s((void *)v4, 0x18uLL, 0, 0x18uLL);
    free((void *)v4);
    return 0LL;
  }

  return result;
}

void *sub_1000A63AC(void *a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  int v2 = (void *)*a1;
  if (*a1)
  {
    do
    {
      uint64_t v4 = v2[1] + v2[2];
      uint64_t v6 = (const void *)v2[1];
      uint64_t v7 = v4;
      int v2 = (void *)*v2;
    }

    while (v2);
  }

  return v2;
}

uint64_t sub_1000A642C(void *a1, unsigned __int8 *a2, int a3, void *a4, void *a5)
{
  uint64_t v8 = sub_1000A63AC(a1, a2);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = 1LL;
  if (a4)
  {
    if (a5)
    {
      uint64_t v10 = v8[1] + v8[2];
      *(void *)&__int128 v17 = v8[1];
      *((void *)&v17 + 1) = v10;
      uint64_t v9 = ccder_blob_decode_sequence_tl(&v17, &v17);
      if ((_DWORD)v9)
      {
        if (sub_1000A6508(&v17, 12LL, 0LL, 0))
        {
          uint64_t v11 = v17;
          uint64_t v15 = 0LL;
          uint64_t v16 = 0LL;
          if (ccder_blob_decode_tag(&v17, &v15))
          {
            if (ccder_blob_decode_len(&v17, &v16))
            {
              uint64_t v13 = v16;
              uint64_t v12 = v17;
              if (a3)
              {
                uint64_t v13 = (v17 + v16 - v11);
                uint64_t v12 = v11;
              }

              *a4 = v12;
              *a5 = v13;
            }
          }
        }
      }
    }
  }

  return v9;
}

uint64_t sub_1000A6508(__int128 *a1, uint64_t a2, void *a3, int a4)
{
  __int128 v11 = *a1;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  if ((ccder_blob_decode_range(&v11, a2, &v9) & 1) == 0) {
    return 0LL;
  }
  __int128 v8 = v11;
  if (a3)
  {
    if ((_DWORD)v10 - (_DWORD)v9 == a4)
    {
      memcpy(a3, v9, (v10 - (_DWORD)v9));
      goto LABEL_5;
    }

    return 0LL;
  }

LABEL_5:
  *a1 = v8;
  return 1LL;
}

uint64_t sub_1000A6594(void *a1, char *__s, void *a3, size_t a4)
{
  v12[0] = 12;
  v12[1] = strlen(__s);
  __int128 v8 = (unsigned __int8 *)sub_1000A66BC((uint64_t)v12, (uint64_t)&v14);
  uint64_t result = 0xFFFFFFFFLL;
  if (a3 && v8)
  {
    __memcpy_chk(v13, __s, v8[1], 127LL);
    __src = 0LL;
    uint64_t v11 = 0LL;
    if (sub_1000A642C(a1, v8, 0, &__src, &v11))
    {
      if (v11 == a4)
      {
        memcpy(a3, __src, a4);
        return 0LL;
      }

      else
      {
        return 4294967277LL;
      }
    }

    else
    {
      return 4294967293LL;
    }
  }

  return result;
}

uint64_t sub_1000A66BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1;
  v4[1] = a2;
  unint64_t v5 = 0LL;
  v4[0] = a1;
  if ((ccder_blob_decode_tl(v4, 12LL, &v5) & 1) == 0)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 1%s\n", "aks", "", "", "", "der_key_validate");
    return 0LL;
  }

  if (v5 >= 0x11)
  {
    fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s bad 2%s\n", "aks", "", "", "", "der_key_validate");
    return 0LL;
  }

  return v2;
}

uint64_t sub_1000A67B8(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = sub_1000A642C(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && (_DWORD)v4) {
    *a3 = sub_1000A5FAC(v7, v7 + v8);
  }
  return v5;
}

uint64_t sub_1000A6810(void *a1, unsigned __int8 *a2, BOOL *a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 0LL;
  uint64_t v4 = sub_1000A642C(a1, a2, 1, &v7, &v8);
  uint64_t v5 = v4;
  if (a3 && (_DWORD)v4) {
    *a3 = sub_1000A6248(v7, v7 + v8);
  }
  return v5;
}

uint64_t sub_1000A6868(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return sub_1000A5D94( a2,  a3,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A68A4,  a1)
  }
         - 1;
  else {
    return 4294967285LL;
  }
}

uint64_t sub_1000A68A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v8 = (unsigned __int8 *)sub_1000A66BC(a1, a1 + a2);
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
  }

  fprintf(__stdoutp, "%s%s:%s%s%s%s%u:%s%u:%s fail%s\n", "aks", "", "", "", "_merge_dict_cb", ":", 647, "", 0, "", "");
  return 0LL;
}

uint64_t sub_1000A6970(void *a1, void *a2, size_t *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v7 = (void *)*a1;
        if (*a1)
        {
          unint64_t v8 = 0LL;
          uint64_t v9 = 0LL;
          uint64_t v10 = 0LL;
          do
          {
            v10 += v7[2];
            uint64_t v7 = (void *)*v7;
            v9 -= 16LL;
            --v8;
          }

          while (v7);
          if (v8 >= 0xF000000000000001LL && (v11 = -v9, (uint64_t v12 = (char *)calloc(-v9, 1uLL)) != 0LL))
          {
            uint64_t v13 = v12;
            uint64_t v14 = (void *)*a1;
            if (*a1)
            {
              uint64_t v15 = v12;
              do
              {
                *(_OWORD *)uint64_t v15 = *(_OWORD *)(v14 + 1);
                v15 += 16;
                uint64_t v14 = (void *)*v14;
              }

              while (v14);
            }

            qsort(v12, -(uint64_t)v8, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000A8D60);
            size_t v16 = ccder_sizeof(0x2000000000000011LL, v10);
            __int128 v17 = (char *)calloc(v16, 1uLL);
            unsigned int v18 = v17;
            if (v17)
            {
              uint64_t v25 = v17;
              uint64_t v26 = &v17[v16];
              unint64_t v19 = v8 - 1;
              BOOL v20 = &v13[-v9 - 8];
              while (!__CFADD__(v19++, 1LL))
              {
                char v22 = v20 - 16;
                char v23 = ccder_blob_encode_body(&v25, *(void *)v20, *((void *)v20 - 1));
                BOOL v20 = v22;
                if ((v23 & 1) == 0) {
                  goto LABEL_16;
                }
              }

              if (!ccder_blob_encode_tl(&v25, 0x2000000000000011LL, v10) || v25 != v26)
              {
LABEL_16:
                uint64_t v3 = 0xFFFFFFFFLL;
                goto LABEL_20;
              }

              uint64_t v3 = 0LL;
              *a2 = v18;
              *a3 = v16;
              unsigned int v18 = 0LL;
            }

            else
            {
              uint64_t v3 = 4294967279LL;
            }

uint64_t sub_1000A6B34(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a4)
  {
    unint64_t v9 = sub_1000A5D30(a3, a4);
    if (v9 <= a4 - a3)
    {
      unint64_t v10 = v9;
      size_t v11 = ccder_sizeof(0x2000000000000010LL, v9 + *(unsigned __int8 *)(a2 + 1) + 2);
      uint64_t v12 = (char *)calloc(v11, 1uLL);
      if (!v12) {
        return 4294967279LL;
      }
      uint64_t v13 = v12;
      uint64_t v14 = &v12[v11];
      char v22 = v12;
      char v23 = &v12[v11];
      if (ccder_blob_encode_body(&v22, v10, a3))
      {
        uint64_t v24 = v13;
        uint64_t v25 = v23;
        int v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
        size_t v16 = v25;
        if (!v15) {
          size_t v16 = 0LL;
        }
        uint64_t v24 = v13;
        uint64_t v25 = v16;
        int v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010LL, v14 - v16);
        unsigned int v18 = v25;
        if (!v17) {
          unsigned int v18 = 0LL;
        }
        if (v18 && v18 == v13)
        {
          BOOL v20 = calloc(0x18uLL, 1uLL);
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t result = 0LL;
            v21[1] = v13;
            v21[2] = v11;
            *uint64_t v21 = *a1;
            *a1 = v21;
            return result;
          }
        }
      }

      memset_s(v13, v11, 0, v11);
      free(v13);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_1000A6CA0(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_1000A6B34(a1, a2, a3, a3 + *(unsigned __int8 *)(a3 + 1) + 2);
}

uint64_t sub_1000A6CB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3)
  {
    uint64_t v9 = *(unsigned __int8 *)(a2 + 1);
    uint64_t v10 = ccder_sizeof(4LL, a4);
    size_t v11 = ccder_sizeof(0x2000000000000010LL, v9 + v10 + 2);
    uint64_t v12 = (char *)calloc(v11, 1uLL);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = &v12[v11];
      char v22 = v12;
      char v23 = &v12[v11];
      uint64_t v24 = v13;
      uint64_t v25 = v23;
      int v15 = ccder_blob_encode_body(&v24, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
      size_t v16 = v25;
      if (!v15) {
        size_t v16 = 0LL;
      }
      uint64_t v24 = v13;
      uint64_t v25 = v16;
      int v17 = ccder_blob_encode_tl(&v24, 0x2000000000000010LL, v14 - v16);
      unsigned int v18 = v25;
      if (!v17) {
        unsigned int v18 = 0LL;
      }
      BOOL v19 = v18 && v18 == v13;
      if (v19 && (BOOL v20 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        uint64_t v21 = v20;
        uint64_t result = 0LL;
        v21[1] = v13;
        v21[2] = v11;
        *uint64_t v21 = *a1;
        *a1 = v21;
      }

      else
      {
LABEL_19:
        memset_s(v13, v11, 0, v11);
        free(v13);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_1000A6E1C(void *a1, char *__s, uint64_t a3, uint64_t a4)
{
  v10[0] = 12;
  v10[1] = strlen(__s);
  uint64_t v8 = sub_1000A66BC((uint64_t)v10, (uint64_t)&v12);
  uint64_t result = 4294967285LL;
  if (a3)
  {
    if (v8)
    {
      __memcpy_chk(v11, __s, *(unsigned __int8 *)(v8 + 1), 127LL);
      return sub_1000A6CB0(a1, v8, a3, a4);
    }
  }

  return result;
}

uint64_t sub_1000A6F08(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    uint64_t v7 = *(unsigned __int8 *)(a2 + 1);
    uint64_t v8 = ccder_sizeof(1LL, 1LL);
    size_t v9 = ccder_sizeof(0x2000000000000010LL, v7 + v8 + 2);
    uint64_t v10 = (char *)calloc(v9, 1uLL);
    if (v10)
    {
      size_t v11 = v10;
      uint64_t v12 = &v10[v9];
      uint64_t v21 = v10;
      char v22 = &v10[v9];
      char v20 = a3 << 31 >> 31;
      char v23 = v11;
      uint64_t v24 = v22;
      int v13 = ccder_blob_encode_body(&v23, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
      uint64_t v14 = v24;
      if (!v13) {
        uint64_t v14 = 0LL;
      }
      char v23 = v11;
      uint64_t v24 = v14;
      int v15 = ccder_blob_encode_tl(&v23, 0x2000000000000010LL, v12 - v14);
      size_t v16 = v24;
      if (!v15) {
        size_t v16 = 0LL;
      }
      BOOL v17 = v16 && v16 == v11;
      if (v17 && (unsigned int v18 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        BOOL v19 = v18;
        uint64_t result = 0LL;
        v19[1] = v11;
        v19[2] = v9;
        *BOOL v19 = *a1;
        *a1 = v19;
      }

      else
      {
LABEL_18:
        memset_s(v11, v9, 0, v9);
        free(v11);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_1000A706C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  unint64_t v6 = HIBYTE(a3);
  if ((HIBYTE(a3) + 1) > 1u)
  {
    uint64_t v11 = 8LL;
  }

  else
  {
    uint64_t v7 = 9LL;
    uint64_t v8 = 48LL;
    uint64_t v9 = 1LL;
    while ((unint64_t)(v7 - 2) >= 2)
    {
      uint64_t v10 = a3 >> v8;
      --v7;
      v8 -= 8LL;
      if ((_DWORD)v6 != v10)
      {
        uint64_t v9 = v7 - 1;
        goto LABEL_8;
      }
    }

    uint64_t v7 = 2LL;
LABEL_8:
    else {
      uint64_t v11 = v9;
    }
  }

  uint64_t v30 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    uint64_t v13 = *(unsigned __int8 *)(a2 + 1);
    uint64_t v14 = ccder_sizeof(2LL, v11);
    size_t v15 = ccder_sizeof(0x2000000000000010LL, v13 + v14 + 2);
    size_t v16 = (char *)calloc(v15, 1uLL);
    if (v16)
    {
      BOOL v17 = v16;
      uint64_t v18 = v11;
      do
      {
        *((_BYTE *)&v30 + v18 - 1) = v3;
        v3 >>= 8;
        --v18;
      }

      while (v18);
      uint64_t v26 = v16;
      uint64_t v27 = &v16[v15];
      uint64_t v28 = v17;
      __int128 v29 = v27;
      int v19 = ccder_blob_encode_body(&v28, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
      char v20 = v29;
      if (!v19) {
        char v20 = 0LL;
      }
      uint64_t v28 = v17;
      __int128 v29 = v20;
      int v21 = ccder_blob_encode_tl(&v28, 0x2000000000000010LL, &v17[v15] - v20);
      char v22 = v29;
      if (!v21) {
        char v22 = 0LL;
      }
      BOOL v23 = v22 && v22 == v17;
      if (v23 && (uint64_t v24 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        uint64_t v25 = v24;
        uint64_t result = 0LL;
        v25[1] = v17;
        v25[2] = v15;
        *uint64_t v25 = *a1;
        *a1 = v25;
      }

      else
      {
LABEL_30:
        memset_s(v17, v15, 0, v15);
        free(v17);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_1000A7280(void *a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && __s)
  {
    size_t v7 = strlen(__s);
    uint64_t v8 = *(unsigned __int8 *)(a2 + 1);
    uint64_t v9 = ccder_sizeof(12LL, v7);
    size_t v10 = ccder_sizeof(0x2000000000000010LL, v8 + v9 + 2);
    uint64_t v11 = (char *)calloc(v10, 1uLL);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = &v11[v10];
      int v21 = v11;
      char v22 = &v11[v10];
      BOOL v23 = v12;
      uint64_t v24 = v22;
      int v14 = ccder_blob_encode_body(&v23, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
      size_t v15 = v24;
      if (!v14) {
        size_t v15 = 0LL;
      }
      BOOL v23 = v12;
      uint64_t v24 = v15;
      int v16 = ccder_blob_encode_tl(&v23, 0x2000000000000010LL, v13 - v15);
      BOOL v17 = v24;
      if (!v16) {
        BOOL v17 = 0LL;
      }
      BOOL v18 = v17 && v17 == v12;
      if (v18 && (int v19 = calloc(0x18uLL, 1uLL)) != 0LL)
      {
        char v20 = v19;
        uint64_t result = 0LL;
        v20[1] = v12;
        v20[2] = v10;
        void *v20 = *a1;
        *a1 = v20;
      }

      else
      {
LABEL_19:
        memset_s(v12, v10, 0, v10);
        free(v12);
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      return 4294967279LL;
    }
  }

  return result;
}

uint64_t sub_1000A73F4(void *a1, uint64_t a2, void *a3)
{
  uint64_t v3 = 0LL;
  __int128 __s = 0LL;
  rsize_t __n = 0LL;
  uint64_t v4 = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    size_t v6 = 0LL;
    if (a3)
    {
      if (sub_1000A6970(a3, &__s, &__n))
      {
        uint64_t v3 = 0LL;
        size_t v6 = 0LL;
      }

      else
      {
        size_t v6 = ccder_sizeof(0x2000000000000010LL, *(unsigned __int8 *)(a2 + 1) + __n + 2);
        uint64_t v8 = (char *)calloc(v6, 1uLL);
        uint64_t v3 = v8;
        if (v8)
        {
          int v16 = v8;
          BOOL v17 = &v8[v6];
          char v20 = v3;
          int v21 = v17;
          int v9 = ccder_blob_encode_body(&v20, *(unsigned __int8 *)(a2 + 1) + 2LL, a2);
          size_t v10 = v21;
          if (!v9) {
            size_t v10 = 0LL;
          }
          char v20 = v3;
          int v21 = v10;
          int v11 = ccder_blob_encode_tl(&v20, 0x2000000000000010LL, &v3[v6] - v10);
          uint64_t v12 = v21;
          if (!v11) {
            uint64_t v12 = 0LL;
          }
          BOOL v13 = v12 && v12 == v3;
          if (v13 && (int v14 = calloc(0x18uLL, 1uLL)) != 0LL)
          {
            uint64_t v4 = 0LL;
            v14[1] = v3;
            v14[2] = v6;
            *int v14 = *a1;
            *a1 = v14;
            uint64_t v3 = 0LL;
          }

          else
          {
LABEL_23:
            uint64_t v4 = 0xFFFFFFFFLL;
          }
        }

        else
        {
          uint64_t v4 = 4294967279LL;
        }
      }
    }
  }

  else
  {
    size_t v6 = 0LL;
  }

  if (__s)
  {
    memset_s(__s, __n, 0, __n);
    free(__s);
  }

  if (v3)
  {
    memset_s(v3, v6, 0, v6);
    free(v3);
  }

  return v4;
}

BOOL sub_1000A7590(void *a1)
{
  return *a1 == 0LL;
}

uint64_t sub_1000A75A0(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v1 = 0LL;
  }
  return ccder_sizeof(4LL, v1);
}

uint64_t sub_1000A75B8(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v1 = 0LL;
  }
  uint64_t v2 = ccder_sizeof(4LL, v1);
  return ccder_sizeof(4LL, 4LL) + v2;
}

uint64_t sub_1000A75FC(__int128 *a1, void *a2)
{
  __int128 v6 = *a1;
  if (a2)
  {
    uint64_t result = ccder_blob_encode_body_tl(&v6, 4LL, 4LL, a2 + 2);
    if (!(_DWORD)result) {
      return result;
    }
    if ((ccder_blob_encode_body_tl(&v6, 4LL, a2[1], *a2) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    int v5 = 0;
  }

  *a1 = v6;
  return 1LL;
}

uint64_t sub_1000A76A4(__int128 *a1, int a2, uint64_t a3)
{
  __int128 v6 = *(int **)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 20);
  __int128 v11 = *a1;
  if (a2)
  {
    __int128 v14 = *a1;
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    if ((ccder_blob_decode_range(&v14, 4LL, &v12) & 1) == 0) {
      return 0LL;
    }
    __int128 v6 = v12;
    unsigned int v8 = v13 - (_DWORD)v12;
    __int128 v11 = v14;
  }

  else
  {
    LODWORD(v14) = v5;
    uint64_t result = sub_1000A77A8(&v11, 4LL, v6, &v14);
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v8 = v14;
  }

  __int128 v14 = v11;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  if ((ccder_blob_decode_range(&v14, 4LL, &v12) & 1) == 0) {
    return 0LL;
  }
  __int128 v11 = v14;
  int v10 = *v12;
  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *(_DWORD *)(a3 + 16) = v10;
  *(_DWORD *)(a3 + 20) = v7;
  *a1 = v11;
  return 1LL;
}

uint64_t sub_1000A77A8(__int128 *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  __int128 v12 = *a1;
  int v10 = 0LL;
  uint64_t v11 = 0LL;
  if ((ccder_blob_decode_range(&v12, a2, &v10) & 1) == 0) {
    return 0LL;
  }
  __int128 v9 = v12;
  if (!a3 || !a4) {
    goto LABEL_6;
  }
  int v7 = v11 - (_DWORD)v10;
  memcpy(a3, v10, (v11 - (_DWORD)v10));
  *a4 = v7;
LABEL_6:
  *a1 = v9;
  return 1LL;
}

uint64_t sub_1000A7840(__int128 *a1, void *a2)
{
  __int128 v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl(&v4, 4LL, a2[1], *a2) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = ccder_blob_encode_tl(&v4, 4LL, 0LL);
    if (!(_DWORD)result) {
      return result;
    }
  }

  *a1 = v4;
  return 1LL;
}

uint64_t sub_1000A78AC(__int128 *a1, int a2, uint64_t a3)
{
  __int128 v6 = *(void **)a3;
  uint64_t v5 = *(void *)(a3 + 8);
  __int128 v9 = *a1;
  if (a2)
  {
    __int128 v12 = *a1;
    int v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t result = ccder_blob_decode_range(&v12, 4LL, &v10);
    if (!(_DWORD)result) {
      return result;
    }
    __int128 v6 = v10;
    unsigned int v8 = v11 - (_DWORD)v10;
    __int128 v9 = v12;
  }

  else
  {
    LODWORD(v12) = v5;
    uint64_t result = sub_1000A77A8(&v9, 4LL, v6, &v12);
    if (!(_DWORD)result) {
      return result;
    }
    unsigned int v8 = v12;
  }

  *(void *)a3 = v6;
  *(void *)(a3 + 8) = v8;
  *a1 = v9;
  return 1LL;
}

uint64_t sub_1000A7958(__int128 *a1, uint64_t a2)
{
  __int128 v4 = *a1;
  if (a2)
  {
    if ((ccder_blob_encode_body_tl(&v4, 4LL, 24LL, a2) & 1) == 0) {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = ccder_blob_encode_tl(&v4, 4LL, 0LL);
    if (!(_DWORD)result) {
      return result;
    }
  }

  *a1 = v4;
  return 1LL;
}

uint64_t sub_1000A79C8(__int128 *a1, void *a2)
{
  __int128 v8 = *a1;
  __int128 v6 = 0LL;
  uint64_t v7 = 0LL;
  if ((ccder_blob_decode_range(&v8, 4LL, &v6) & 1) == 0) {
    return 0LL;
  }
  __int128 v5 = v8;
  memcpy(a2, v6, (v7 - (_DWORD)v6));
  *a1 = v5;
  return 1LL;
}

uint64_t sub_1000A7A48(unsigned int *a1, int a2, void *a3, _DWORD *a4)
{
  __int128 v12 = 0LL;
  if (sub_1000A706C(&v12, (uint64_t)off_1000DB458, *a1)
    || sub_1000A706C(&v12, (uint64_t)off_1000DB460, a1[1])
    || sub_1000A706C(&v12, (uint64_t)off_1000DB468, *((void *)a1 + 1))
    || sub_1000A706C(&v12, (uint64_t)off_1000DB478, a1[4])
    || sub_1000A706C(&v12, (uint64_t)off_1000DB488, a1[5])
    || sub_1000A706C(&v12, (uint64_t)off_1000DB4A0, *(void *)((char *)a1 + 26))
    || sub_1000A706C(&v12, (uint64_t)off_1000DB4A8, *(void *)((char *)a1 + 34))
    || sub_1000A706C(&v12, (uint64_t)off_1000DB1B0, *(int *)((char *)a1 + 42))
    || sub_1000A706C(&v12, (uint64_t)off_1000DB378, *(unsigned int *)((char *)a1 + 46))
    || sub_1000A6CB0(&v12, (uint64_t)off_1000DB570, (uint64_t)a1 + 50, 16LL)
    || a2
    && (sub_1000A706C(&v12, (uint64_t)off_1000DB490, *((char *)a1 + 66))
     || sub_1000A706C(&v12, (uint64_t)off_1000DB498, *((char *)a1 + 67))
     || sub_1000A706C(&v12, (uint64_t)off_1000DB770, *(void *)(a1 + 17))
     || sub_1000A706C(&v12, (uint64_t)off_1000DB7B8, *(void *)(a1 + 19)))
    || (v10 = 0LL, size_t v11 = 0LL, sub_1000A6970(&v12, &v10, &v11)))
  {
    uint64_t v8 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v8 = 0LL;
    *a3 = v10;
    *a4 = v11;
  }

  sub_1000A62A0(&v12);
  return v8;
}

uint64_t sub_1000A7C54(uint64_t a1, unsigned int a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1)
  {
    if (__s)
    {
      memset_s(__s, 0x54uLL, 0, 0x54uLL);
      bzero(v12, 0x228uLL);
      size_t v11 = off_1000DB458;
      v12[4] = (uint64_t)off_1000DB460;
      v12[9] = (uint64_t)off_1000DB468;
      v12[14] = (uint64_t)off_1000DB478;
      v12[19] = (uint64_t)off_1000DB488;
      v12[24] = (uint64_t)off_1000DB490;
      v12[29] = (uint64_t)off_1000DB498;
      v12[34] = (uint64_t)off_1000DB4A0;
      v12[39] = (uint64_t)off_1000DB4A8;
      v12[44] = (uint64_t)off_1000DB1B0;
      v12[49] = (uint64_t)off_1000DB378;
      v12[54] = (uint64_t)off_1000DB570;
      __int128 v14 = off_1000DB770;
      BOOL v17 = off_1000DB7B8;
      __int128 v8 = xmmword_1000AEFC0;
      uint64_t v9 = 0LL;
      uint64_t v10 = &v11;
      sub_1000A5D94( a1,  a1 + a2,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v8);
      *(_DWORD *)__int128 __s = sub_1000A5FAC(v12[0], v12[1]);
      *((_DWORD *)__s + 1) = sub_1000A5FAC(v12[5], v12[6]);
      *((void *)__s + 1) = sub_1000A5FAC(v12[10], v12[11]);
      *((_DWORD *)__s + 4) = sub_1000A5FAC(v12[15], v12[16]);
      *((_DWORD *)__s + 5) = sub_1000A5FAC(v12[20], v12[21]);
      *(void *)(__s + 26) = sub_1000A5FAC(v12[35], v12[36]);
      *(void *)(__s + 34) = sub_1000A5FAC(v12[40], v12[41]);
      *(_DWORD *)(__s + 42) = sub_1000A5FAC(v12[45], v12[46]);
      *(_DWORD *)(__s + 46) = sub_1000A5FAC(v12[50], v12[51]);
      sub_1000A6508(&v13, 4LL, __s + 50, 16);
      __s[66] = sub_1000A5FAC(v12[25], v12[26]);
      __s[67] = sub_1000A5FAC(v12[30], v12[31]);
      *(void *)(__s + 68) = sub_1000A5FAC(v15, v16);
      uint64_t v7 = sub_1000A5FAC(v18, v19);
      uint64_t result = 0LL;
      *(void *)(__s + 76) = v7;
    }
  }

  return result;
}

uint64_t sub_1000A7EB8(uint64_t a1, unsigned int a2, _BYTE *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    __int128 v13 = 0u;
    __int128 v15 = 0u;
    uint64_t v16 = 0LL;
    __int128 v20 = 0u;
    __int128 v12 = 0u;
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v21 = 0u;
    uint64_t v22 = 0LL;
    size_t v11 = off_1000DB568;
    __int128 v14 = (unint64_t)off_1000DB478;
    BOOL v17 = off_1000DB378;
    *(void *)&__int128 v20 = off_1000DB458;
    __int128 v8 = xmmword_1000AEEB0;
    uint64_t v9 = 0LL;
    uint64_t v10 = &v11;
    if (sub_1000A5D94( a1,  a1 + a2,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v8))
    {
      void *__s = sub_1000A5FAC(v12, *((uint64_t *)&v12 + 1));
      *((_DWORD *)__s + 1) = sub_1000A5FAC(*((uint64_t *)&v14 + 1), v15);
      *((_DWORD *)__s + 2) = sub_1000A5FAC(v18, *((uint64_t *)&v18 + 1));
      int v7 = sub_1000A5FAC(*((uint64_t *)&v20 + 1), v21);
      uint64_t result = 0LL;
      *((_DWORD *)__s + 3) = v7;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_1000A801C(uint64_t a1, unsigned int a2, void *__s, void *a4, void *a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s && a4)
  {
    uint64_t v10 = a1 + a2;
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    memset_s(a4, 0x10uLL, 0, 0x10uLL);
    uint64_t v18 = 0LL;
    __int128 v15 = 0u;
    v16[0] = 0u;
    __int128 v17 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v14 = off_1000DB710;
    v16[1] = (unint64_t)off_1000DB718;
    __int128 v19 = off_1000DB250;
    __int128 v11 = xmmword_1000AEE90;
    uint64_t v12 = 0LL;
    __int128 v13 = &v14;
    sub_1000A5D94( a1,  v10,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v11);
    if (sub_1000A6508(v16, 4LL, __s, 16)
      && sub_1000A6508((__int128 *)((char *)&v17 + 8), 4LL, a4, 16))
    {
      return sub_1000A6508(&v21, 4LL, a5, 16) - 1;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_1000A8198(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    uint64_t v6 = a1 + a2;
    memset_s(__s, 0x58uLL, 0, 0x58uLL);
    __int128 v32 = 0u;
    uint64_t v34 = 0LL;
    __int128 v35 = 0u;
    uint64_t v36 = 0LL;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    uint64_t v41 = 0LL;
    __int128 v42 = 0u;
    uint64_t v43 = 0LL;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    uint64_t v48 = 0LL;
    __int128 v49 = 0u;
    uint64_t v50 = 0LL;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v16 = 0u;
    uint64_t v17 = 0LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    uint64_t v23 = 0LL;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v29 = 0LL;
    __int128 v31 = 0u;
    uint64_t v12 = off_1000DB240;
    __int128 v15 = (unint64_t)off_1000DB250;
    uint64_t v18 = off_1000DB230;
    *(void *)&__int128 v21 = off_1000DB228;
    uint64_t v24 = off_1000DB248;
    *(void *)&__int128 v27 = off_1000DB4D0;
    uint64_t v30 = off_1000DB478;
    uint64_t v33 = off_1000DB480;
    int v37 = off_1000DB378;
    __int128 v40 = off_1000DB468;
    v44 = off_1000DB470;
    v47 = off_1000DB630;
    v51 = off_1000DB698;
    __int128 v9 = xmmword_1000AEFD0;
    uint64_t v10 = 0LL;
    __int128 v11 = &v12;
    sub_1000A5D94( a1,  v6,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5BCC,  (uint64_t)&v9);
    *(_DWORD *)__int128 __s = sub_1000A5FAC(v13, *((uint64_t *)&v13 + 1));
    if (sub_1000A6508((__int128 *)((char *)&v16 + 8), 4LL, __s + 4, 16)
      && sub_1000A6508(&v20, 4LL, __s + 20, 16)
      && (*((_DWORD *)__s + 9) = sub_1000A5FAC(*((uint64_t *)&v21 + 1), v22),
          *((_DWORD *)__s + 10) = sub_1000A5FAC(v25, *((uint64_t *)&v25 + 1)),
          *((_DWORD *)__s + 11) = sub_1000A5FAC(v31, *((uint64_t *)&v31 + 1)),
          *((_DWORD *)__s + 12) = sub_1000A5FAC(v34, v35),
          *((_DWORD *)__s + 15) = sub_1000A5FAC(v38, *((uint64_t *)&v38 + 1)),
          *((_DWORD *)__s + 13) = sub_1000A5FAC(v41, v42),
          *((_DWORD *)__s + 14) = sub_1000A5FAC(v45, *((uint64_t *)&v45 + 1)),
          sub_1000A847C((__int128 *)((char *)&v28 + 8), 4LL, __s + 64, 8u)))
    {
      int v7 = *((_DWORD *)__s + 9);
      if ((v7 & 0x400) != 0)
      {
        *((void *)__s + 9) = sub_1000A5FAC(v48, v49);
        int v7 = *((_DWORD *)__s + 9);
      }

      if ((v7 & 0x800) != 0)
      {
        int v8 = sub_1000A5FAC(v52, *((uint64_t *)&v52 + 1));
        uint64_t result = 0LL;
        *((_DWORD *)__s + 20) = v8;
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_1000A847C(__int128 *a1, uint64_t a2, void *a3, unsigned int a4)
{
  __int128 v13 = *a1;
  __int128 v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v7 = ccder_blob_decode_range(&v13, a2, &v11);
  if ((v7 & 1) != 0)
  {
    __int128 v10 = v13;
    if (a3)
    {
      else {
        size_t v8 = (v12 - (_DWORD)v11);
      }
      memcpy(a3, v11, v8);
    }

    *a1 = v10;
  }

  return v7;
}

uint64_t sub_1000A8500(int *a1, void *a2, _DWORD *a3)
{
  __int128 v11 = 0LL;
  uint64_t v3 = 4294967273LL;
  if (a2 && a3)
  {
    if (a1 && (int v7 = *a1) != 0)
    {
      if ((v7 & 1) != 0)
      {
        sub_1000A6E1C(&v11, "persona_uuid", (uint64_t)(a1 + 1), 16LL);
        int v7 = *a1;
      }

      if ((v7 & 2) != 0) {
        sub_1000A6E1C(&v11, "volume_uuid", (uint64_t)(a1 + 5), 16LL);
      }
      uint64_t v9 = 0LL;
      size_t v10 = 0LL;
      if (!sub_1000A6970(&v11, &v9, &v10))
      {
        uint64_t v3 = 0LL;
        *a2 = v9;
        *a3 = v10;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      *a2 = 0LL;
      *a3 = 0;
    }
  }

  sub_1000A62A0(&v11);
  return v3;
}

uint64_t sub_1000A85D4(uint64_t a1, uint64_t a2, char *__s)
{
  size_t v8 = 0LL;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    uint64_t v6 = a1 + a2;
    memset_s(__s, 0x24uLL, 0, 0x24uLL);
    if (sub_1000A5D94( a1,  v6,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A68A4,  (uint64_t)&v8))
    {
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }

  sub_1000A62A0(&v8);
  return v3;
}

uint64_t sub_1000A86B4(uint64_t a1, void *a2, _DWORD *a3)
{
  size_t v10 = 0LL;
  uint64_t v3 = 4294967273LL;
  if (a2 && a3)
  {
    if (a1)
    {
      if (!sub_1000A6E1C(&v10, "options", a1, 8LL)
        && !sub_1000A6E1C(&v10, "kc", a1 + 8, 4LL))
      {
        uint64_t v8 = 0LL;
        size_t v9 = 0LL;
        if (!sub_1000A6970(&v10, &v8, &v9))
        {
          uint64_t v3 = 0LL;
          *a2 = v8;
          *a3 = v9;
        }
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      *a2 = 0LL;
      *a3 = 0;
    }
  }

  sub_1000A62A0(&v10);
  return v3;
}

uint64_t sub_1000A877C(uint64_t a1, uint64_t a2, char *__s)
{
  uint64_t v8 = 0LL;
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 && a1 && __s)
  {
    uint64_t v6 = a1 + a2;
    memset_s(__s, 0x10uLL, 0, 0x10uLL);
    if (sub_1000A5D94( a1,  v6,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A68A4,  (uint64_t)&v8))
    {
      sub_1000A6594(&v8, "options", __s, 8uLL);
      sub_1000A6594(&v8, "kc", __s + 8, 4uLL);
      uint64_t v3 = 0LL;
    }

    else
    {
      uint64_t v3 = 0xFFFFFFFFLL;
    }
  }

  sub_1000A62A0(&v8);
  return v3;
}

uint64_t sub_1000A883C(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    int v7 = off_1000DB1A8;
    uint64_t v8 = 0LL;
    if (off_1000DB1A8
      && (sub_1000A5D94( a1,  a1 + a2,  (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000A5ED4,  (uint64_t)&v7),  (_BYTE)v10))
    {
      uint64_t v4 = 0LL;
      v11[0] = 6LL;
      v11[1] = off_1000DB300;
      void v11[2] = 10LL;
      v11[3] = off_1000DB320;
      v11[4] = 17LL;
      v11[5] = off_1000DB338;
      _OWORD v11[6] = 1LL;
      v11[7] = off_1000DB2C8;
      v11[8] = 2LL;
      v11[9] = off_1000DB2E0;
      v11[10] = 3LL;
      v11[11] = off_1000DB2F0;
      v11[12] = 4LL;
      v11[13] = off_1000DB2F8;
      v11[14] = 5LL;
      v11[15] = off_1000DB2D8;
      v11[16] = 7LL;
      v11[17] = off_1000DB308;
      v11[18] = 8LL;
      v11[19] = off_1000DB310;
      v11[20] = 9LL;
      v11[21] = off_1000DB318;
      v11[22] = 11LL;
      v11[23] = off_1000DB328;
      v11[24] = 12LL;
      v11[25] = off_1000DB3A0;
      v11[26] = 13LL;
      v11[27] = off_1000DB398;
      v11[28] = 14LL;
      v11[29] = off_1000DB3A8;
      v11[30] = 15LL;
      v11[31] = off_1000DB3B0;
      v11[32] = 16LL;
      v11[33] = off_1000DB330;
      v11[34] = 18LL;
      v11[35] = off_1000DB3B8;
      v11[36] = 19LL;
      v11[37] = off_1000DB3C0;
      v11[38] = 20LL;
      v11[39] = off_1000DB3C8;
      v11[40] = 21LL;
      v11[41] = off_1000DB3D0;
      v11[42] = 22LL;
      v11[43] = off_1000DB3D8;
      v11[44] = 23LL;
      v11[45] = off_1000DB340;
      v11[46] = 24LL;
      v11[47] = off_1000DB348;
      v11[48] = 25LL;
      v11[49] = off_1000DB350;
      v11[50] = 26LL;
      v11[51] = off_1000DB358;
      v11[52] = 27LL;
      v11[53] = off_1000DB6F8;
      v11[54] = 28LL;
      v11[55] = off_1000DB7C0;
      v11[56] = 29LL;
      v11[57] = off_1000DB7C8;
      __int128 v5 = v8;
      uint64_t v6 = v9;
      while (!sub_1000A5CC8( (const void *)v11[v4 + 1],  v11[v4 + 1] + *(unsigned __int8 *)(v11[v4 + 1] + 1LL) + 2LL,  v5,  v6))
      {
        v4 += 2LL;
        if (v4 == 58) {
          return 0LL;
        }
      }

      return LODWORD(v11[v4]);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000A8C20(__int128 *a1, uint64_t a2, uint64_t *a3, _DWORD *a4)
{
  __int128 v15 = *a1;
  __int128 v13 = 0LL;
  uint64_t v14 = 0LL;
  if ((ccder_blob_decode_range(&v15, a2, &v13) & 1) == 0) {
    return 0LL;
  }
  int v7 = v13;
  __int128 v12 = v15;
  if (a3 && a4)
  {
    int v8 = v14 - (_DWORD)v13;
    size_t v9 = (v14 - (_DWORD)v13);
    uint64_t result = (uint64_t)calloc(v9, 1uLL);
    if (!result) {
      return result;
    }
    uint64_t v11 = result;
    memcpy((void *)result, v7, v9);
    *a3 = v11;
    *a4 = v8;
  }

  *a1 = v12;
  return 1LL;
}

uint64_t sub_1000A8CD8(__int128 *a1, uint64_t a2, void *a3)
{
  uint64_t v9 = 0LL;
  if (a3) {
    *a3 = 0LL;
  }
  __int128 v8 = *a1;
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t result = ccder_blob_decode_range(&v8, a2, &v6);
  if ((_DWORD)result)
  {
    if (ccn_read_uint(1LL, &v9, v7 - v6, v6))
    {
      return 0LL;
    }

    else
    {
      *a1 = v8;
      if (a3) {
        *a3 = v9;
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000A8D60(void *a1, void **a2)
{
  uint64_t v2 = *a1 + a1[1];
  v13[0] = *a1;
  v13[1] = v2;
  uint64_t v3 = (char *)a2[1] + (void)*a2;
  __s2[0] = *a2;
  __s2[1] = v3;
  unint64_t v17 = 0LL;
  unint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  uint64_t v4 = (const void *)v13[0];
  if (!v13[0]
    || !ccder_blob_decode_tag(__s2, &v15)
    || !ccder_blob_decode_len(__s2, &v14)
    || !__s2[0])
  {
    return 4294967293LL;
  }

  if (v17 > v15) {
    return 1LL;
  }
  if (v15 > v17) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v6 = v16;
  unint64_t v7 = v14;
  size_t v8 = v16 >= v14 ? v14 : v16;
  int v9 = memcmp(v4, __s2[0], v8);
  if (v9 > 0 || !v9 && v6 > v7) {
    return 1LL;
  }
  int v11 = v9 < 0 || v6 < v7;
  return (v11 << 31 >> 31);
}

uint64_t sub_1000A8E88()
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  36,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return 4294967284LL;
}

uint64_t sub_1000A8F94()
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  62,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138( sub_100095764 != 0LL,  63,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_100095764();
}

uint64_t sub_1000A8FF0(uint64_t a1, unsigned int a2)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  70,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138( sub_1000957D0 != 0LL,  71,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return sub_1000957D0(a1, a2);
}

uint64_t sub_1000A9064( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  78,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 79, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000A9120( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  86,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 87, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000A91E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  94,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 95, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
}

uint64_t sub_1000A92A8( unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  106,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 107, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15);
}

uint64_t sub_1000A9374( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  115,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 116, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13);
}

uint64_t sub_1000A9440(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  123,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 124, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2, a3, a4, a5);
}

uint64_t sub_1000A94DC()
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  131,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 132, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0]();
}

uint64_t sub_1000A9538(uint64_t a1, uint64_t a2)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  139,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 140, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1, a2);
}

uint64_t sub_1000A95AC(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  147,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 148, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A9618(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  155,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 156, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A9684(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  163,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 164, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A96F0(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  171,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 172, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A975C(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  179,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 180, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A97C8(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  187,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 188, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A9834(uint64_t a1)
{
  sub_1000A5138( &off_1000CDC70 != 0LL,  195,  "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  sub_1000A5138(0LL, 196, "/Library/Caches/com.apple.xbs/Sources/AppleKeyStore_libs/platform/platform.c");
  return MEMORY[0](a1);
}

uint64_t sub_1000A98A0(int a1)
{
  return -a1 & 3;
}

char *sub_1000A98AC(_DWORD *a1, const void *a2, int a3)
{
  uint64_t v3 = (char *)(a1 + 1);
  if (a2)
  {
    *a1 = a3;
    memcpy(a1 + 1, a2, a3);
    v3 += a3;
    int v5 = -a3;
    size_t v6 = -a3 & 3;
    if ((v5 & 3) != 0)
    {
      int __s = 0;
      memset_s(&__s, 4uLL, 0, 4uLL);
      memcpy(v3, &__s, v6);
      v3 += v6;
    }
  }

  else
  {
    *a1 = 0;
  }

  return v3;
}

char *sub_1000A9930( char **a1, unsigned int *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  __int128 v21 = &a9;
  unsigned int v12 = 4;
  if (a3)
  {
    int v13 = a3;
    do
    {
      unint64_t v14 = v21;
      v21 += 2;
      v12 += *((_DWORD *)v14 + 2) + (-*((_DWORD *)v14 + 2) & 3) + 4;
      --v13;
    }

    while (v13);
  }

  uint64_t result = (char *)calloc(1uLL, v12);
  unint64_t v16 = result;
  __int128 v22 = (const void **)&a9;
  int v17 = 0;
  if (a3)
  {
    uint64_t v18 = 4LL;
    do
    {
      __int128 v19 = v22;
      __int128 v20 = *v22;
      v22 += 2;
      uint64_t result = sub_1000A98AC(&v16[v18], v20, *((_DWORD *)v19 + 2));
      uint64_t v18 = result - v16;
      ++v17;
    }

    while (a3 != v17);
  }

  *(_DWORD *)unint64_t v16 = v17;
  *a1 = v16;
  *a2 = v12;
  return result;
}

uint64_t sub_1000A9A0C( unsigned int *a1, unint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a2 < 4) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a3;
  if (*a1 >= a3)
  {
    __int128 v19 = (void **)&a9;
    if (!a3) {
      return 0LL;
    }
    int v11 = (char *)(a1 + 1);
    while (1)
    {
      unsigned int v12 = v19;
      int v13 = *v19;
      v19 += 2;
      unsigned int v16 = *(_DWORD *)v11;
      unint64_t v14 = v11 + 4;
      size_t v15 = v16;
      if (v16 > a2) {
        break;
      }
      if (v13)
      {
        int v17 = (size_t *)v12[1];
        if (*v17 < v15) {
          return 0xFFFFFFFFLL;
        }
        memcpy(v13, v14, v15);
        *int v17 = v15;
      }

      int v11 = &v14[v15];
      if (!--v9) {
        return 0LL;
      }
    }
  }

  return 0xFFFFFFFFLL;
}

void sub_1000A9AD0()
{
  uint64_t v0 = _os_assert_log(0LL);
  _os_crash(v0);
  __break(1u);
}

void sub_1000A9AE8(char a1, const char *a2)
{
  if ((a1 & 1) == 0) {
    goto LABEL_11;
  }
  while (1)
  {
    uint64_t v3 = (os_log_s *)(id)qword_1000DBAB8;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = 0LL;
      unsigned int v4 = sub_100053B4C(0);
      BOOL v5 = os_log_type_enabled(v3, OS_LOG_TYPE_ERROR);
      size_t v6 = 0LL;
      if (v5) {
        uint64_t v7 = v4;
      }
      else {
        uint64_t v7 = v4 & 0xFFFFFFFE;
      }
      if ((_DWORD)v7)
      {
        int v8 = *(_DWORD *)a2;
        v14[0] = 67109120;
        v14[1] = v8;
        LODWORD(v12) = 8;
        unsigned int v9 = (const char *)_os_log_send_and_compose_impl( v7,  &v13,  0LL,  0LL,  &_mh_execute_header,  v3,  16LL,  "Failed to load persona manifest: %{darwin.errno}d",  v14,  v12);
        size_t v6 = 0LL;
        if (v9)
        {
          a2 = v9;
          sub_100053B7C(v9);
          size_t v6 = (char *)a2;
        }
      }

      free(v6);
    }

    sub_1000524B8(v10, v11, (uint64_t)"Daemon failed to load persona manifest.");
LABEL_11:
    dispatch_once(&qword_1000DBAC0, &stru_1000CD568);
  }

void sub_1000A9BF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = sub_1000524B8(a1, a2, (uint64_t)"usermanagerd failed assertion: _gPersonaManager == nil");
  sub_1000A9C04(v2);
}

void sub_1000A9C04(uint64_t a1, uint64_t a2)
{
  sub_1000524B8(a1, a2, (uint64_t)"usermanagerd failed assertion: newSession != NULL");
  sub_1000A9C18();
}

void sub_1000A9C18()
{
  uint64_t v0 = sub_100056850();
  uint64_t v1 = _os_crash(v0);
  __break(1u);
  AKSGetLastUser(v1);
}

id objc_msgSend_createIdentityWithUUID_passcode_existingSession_existingSessionPasscode_error_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createIdentityWithUUID:passcode:existingSession:existingSessionPasscode:error:");
}

id objc_msgSend_createUserLayoutForUserwithUserID_withAKSSetup_onUserVolumePath_fromSystemVolumePath_withError_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "createUserLayoutForUserwithUserID:withAKSSetup:onUserVolumePath:fromSystemVolumePath:withError:");
}

id objc_msgSend_xpcListener(void *a1, const char *a2, ...)
{
  return [a1 xpcListener];
}