uint64_t l2tp_outgoing_call(int a1, const sockaddr *a2, unsigned __int16 *a3, uint64_t a4, int a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  sockaddr v24;
  HIDWORD(v22) = sub_27C0(1u, a3);
  result = sub_140C(a1, SHIDWORD(v22), 0, a2, "SCCRQ");
  if (!(_DWORD)result)
  {
    v24.sa_len = 0x80;
    result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v22 + 3, &v24, a5);
    if ((_DWORD)result != -2)
    {
      if ((_DWORD)result == -1 || !HIDWORD(v22)) {
        notice();
      }
      v17 = SHIDWORD(v22);
      l2tp_change_peeraddress(a1, &v24, v11, v12, v13, v14, v15, v16, v21, v22, v23);
      if (!*(_WORD *)a4) {
        goto LABEL_22;
      }
      l2tp_reset_timers(a1, 0);
      if (!*(_WORD *)(a4 + 6)) {
        *(_WORD *)(a4 + 6) = 4;
      }
      l2tp_set_peerparams(a1, (char *)a4);
      *(void *)&v23 = 1488LL;
      *((void *)&v23 + 1) = &word_189EC;
      else {
        v18 = 1500 - v23;
      }
      result = sub_140C(a1, v18, 0, 0LL, "SCCCN");
      if (!(_DWORD)result)
      {
        HIDWORD(v22) = sub_1E60((uint64_t)a3);
        result = sub_140C(a1, SHIDWORD(v22), 0, 0LL, "ICRQ");
        if (!(_DWORD)result)
        {
          v24.sa_len = 0x80;
          result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v22 + 3, &v24, a5);
          if (!(_DWORD)result)
          {
            v19 = bswap32(*(unsigned __int16 *)((char *)&dword_4 + (void)control_hdr + 2)) >> 16;
            if ((_DWORD)v19 == a3[4])
            {
              if (*(_WORD *)(a4 + 8))
              {
                v20 = sub_1EF8((uint64_t)a3);
                return sub_140C(a1, v20, *(unsigned __int16 *)(a4 + 8), 0LL, "ICCN");
              }
            }

            else
            {
              *(void *)&v22 = v19;
            }

LABEL_22:
            error();
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_140C(int a1, int a2, unsigned int a3, const sockaddr *a4, const char *a5)
{
  if (a2 <= 0) {
    error();
  }
  word_189E6 = __rev16(a3);
  memset(&v10[1], 0, 15);
  v10[0] = 16;
  size_t v7 = a2;
  if (a4) {
    v8 = a4;
  }
  else {
    v8 = (const sockaddr *)v10;
  }
  while (sendto(a1, &control_buf, v7, 0, v8, v8->sa_len) == -1)
  {
    if (*__error() != 4) {
      error();
    }
  }

  uint64_t result = strcmp(a5, "Hello");
  if ((_DWORD)result) {
    dbglog();
  }
  return result;
}

uint64_t l2tp_recv(int a1, void *a2, int a3, _DWORD *a4, sockaddr *a5, int a6)
{
  v22[0] = a5->sa_len;
  if (a6)
  {
    int v9 = 1 << a1;
    unint64_t v10 = (unint64_t)a1 >> 5;
    uint64_t v11 = a6;
    if (a6 == -1) {
      v12 = 0LL;
    }
    else {
      v12 = (timeval *)&v20;
    }
    while (1)
    {
      memset(&v19, 0, sizeof(v19));
      if (__darwin_check_fd_set_overflow(a1, &v19, 0)) {
        v19.fds_bits[v10] |= v9;
      }
      uint64_t v20 = v11;
      int v21 = 0;
      int v13 = select(a1 + 1, &v19, 0LL, 0LL, v12);
      if (!v13) {
        break;
      }
      if (v13 > 0) {
        goto LABEL_12;
      }
      if (*__error() != 4) {
        goto LABEL_15;
      }
    }

    return 0xFFFFFFFFLL;
  }

  else
  {
LABEL_12:
    while (1)
    {
      ssize_t v14 = recvfrom(a1, a2, a3, 128, a5, v22);
      if ((v14 & 0x8000000000000000LL) == 0) {
        break;
      }
      if (*__error() != 4) {
LABEL_15:
      }
        error();
    }

    int v16 = v14;
    uint64_t result = 0LL;
    *a4 = v16;
  }

  return result;
}

uint64_t sub_16F8(uint64_t a1, _WORD *a2, uint64_t a3, unsigned int a4)
{
  unint64_t v4 = a1 - 12;
  if (a1 == 12)
  {
LABEL_89:
    unsigned int v29 = 0;
LABEL_90:
    *a2 = v29;
    sub_274C(v29);
    dbglog();
  }

  __int16 v39 = 0;
  v5 = 0LL;
  char v6 = 0;
  uint64_t v40 = 0LL;
  v32 = (void *)(a3 + 827);
  uint64_t v33 = a3 + 1092;
  __dst = (void *)(a3 + 568);
  v35 = (void *)(a3 + 116);
  v36 = a2;
  v34 = (void *)(a3 + 52);
  size_t v7 = (unsigned __int16 *)&word_189EC;
  int v8 = 1;
  do
  {
    unsigned int v9 = v7[2];
    unsigned int v10 = bswap32(*v7);
    size_t v11 = HIWORD(v10) & 0x3FF;
    uint64_t v12 = __rev16(v9);
    unsigned int v13 = v11 - 6;
    unint64_t v41 = v4;
    int v14 = v7[1];
    if (v5) {
      free(v5);
    }
    unsigned int v15 = HIWORD(v10);
    __src = malloc(v11);
    memcpy(__src, v7 + 3, v11);
    if ((v15 & 0x3C00) == 0 && v14 == 0)
    {
      if ((v6 & 1) != 0)
      {
        v5 = __src;
        if ((v15 & 0x4000) != 0) {
          goto LABEL_94;
        }
        if (v12 <= 0x27)
        {
          int v17 = *((unsigned __int16 *)&avp_attr + 4 * v12);
          HIDWORD(v40) |= *((_DWORD *)&avp_attr + 2 * v12 + 1);
        }

        switch((int)v12)
        {
          case 1:
            if (v13 <= 1) {
              goto LABEL_94;
            }
            *(_WORD *)(a3 + 564) = bswap32((unsigned __int16)*__src) >> 16;
            if (v13 >= 4)
            {
              *(_WORD *)(a3 + 566) = bswap32((unsigned __int16)__src[1]) >> 16;
              if ((_DWORD)v11 == 10)
              {
                LODWORD(v18) = 0;
              }

              else
              {
                else {
                  size_t v18 = (unsigned __int16)(v11 - 10);
                }
                memmove(__dst, __src + 2, v18);
                v5 = __src;
              }

              *(_BYTE *)(a3 + v18 + 568) = 0;
            }

            break;
          case 2:
            unsigned int v21 = (unsigned __int16)*__src;
            *(_WORD *)(a3 + 2) = __rev16(v21);
            if (v21 != 1) {
              goto LABEL_94;
            }
            break;
          case 3:
          case 4:
          case 5:
          case 18:
          case 19:
          case 21:
          case 22:
          case 23:
          case 24:
          case 25:
          case 26:
          case 27:
          case 28:
          case 29:
          case 30:
          case 31:
          case 32:
          case 33:
          case 35:
          case 37:
          case 38:
            break;
          case 6:
            *(_WORD *)(a3 + 4) = bswap32((unsigned __int16)*__src) >> 16;
            break;
          case 7:
            else {
              size_t v22 = (unsigned __int16)(v11 - 6);
            }
            memmove(v34, __src, v22);
            v5 = __src;
            *(_BYTE *)(a3 + v22 + 52) = 0;
            break;
          case 8:
            else {
              size_t v23 = (unsigned __int16)(v11 - 6);
            }
            memmove(v35, __src, v23);
            v5 = __src;
            *(_BYTE *)(a3 + v23 + 116) = 0;
            break;
          case 9:
            unsigned int v24 = (unsigned __int16)*__src;
            *(_WORD *)a3 = __rev16(v24);
            if (!v24) {
              goto LABEL_94;
            }
            break;
          case 10:
            __int16 v25 = __rev16((unsigned __int16)*__src);
            if (*__src) {
              __int16 v26 = v25;
            }
            else {
              __int16 v26 = 4;
            }
            *(_WORD *)(a3 + 6) = v26;
            break;
          case 11:
          case 13:
            error();
          case 12:
            if (v13 <= 2) {
              goto LABEL_94;
            }
            *(_WORD *)(a3 + 824) = bswap32((unsigned __int16)*__src) >> 16;
            *(_BYTE *)(a3 + 826) = *((_BYTE *)__src + 2);
            if ((_DWORD)v11 == 9)
            {
              LODWORD(v27) = 0;
            }

            else
            {
              else {
                size_t v27 = (unsigned __int16)(v11 - 9);
              }
              memmove(v32, (char *)__src + 3, v27);
              v5 = __src;
            }

            *(_BYTE *)(a3 + v27 + 827) = 0;
            break;
          case 14:
            unsigned int v28 = (unsigned __int16)*__src;
            *(_WORD *)(a3 + 8) = __rev16(v28);
            if (!v28) {
              goto LABEL_94;
            }
            break;
          case 15:
            *(_DWORD *)(a3 + 24) = bswap32(*(_DWORD *)__src);
            break;
          case 34:
            if ((_DWORD)v11 != 32) {
              goto LABEL_94;
            }
            *(int8x16_t *)uint64_t v33 = vrev32q_s8(*(int8x16_t *)(__src + 1));
            *(int8x8_t *)(v33 + 16) = vrev32_s8(*(int8x8_t *)(__src + 9));
            break;
          case 36:
            if (v13 > 0x80) {
              goto LABEL_94;
            }
            __memmove_chk(v43, __src);
            v5 = __src;
            break;
          case 39:
            *(_WORD *)(a3 + 10) = 1;
            break;
          default:
            if ((v15 & 0x8000) != 0) {
              goto LABEL_94;
            }
            break;
        }
      }

      else
      {
        v5 = __src;
        if (v9 || (v15 & 0x4000) != 0 || (_DWORD)v11 != 8) {
          goto LABEL_94;
        }
        unsigned int v19 = bswap32((unsigned __int16)*__src) >> 16;
        int v20 = v40;
        if ((v15 & 0x8000u) != 0) {
          int v20 = 1;
        }
        __int16 v39 = v19;
        LODWORD(v40) = v20;
        HIDWORD(v40) |= dword_18004;
      }
    }

    else
    {
      v5 = __src;
      if ((((v15 & 0x8000u) == 0) & ~v8) == 0) {
        goto LABEL_94;
      }
    }

    int v8 = 0;
    size_t v7 = (unsigned __int16 *)((char *)v7 + v11);
    char v6 = 1;
    unint64_t v4 = v41 - v11;
  }

  while (v41 != v11);
  if (v5) {
    free(v5);
  }
  a2 = v36;
  switch(v39)
  {
    case 1:
      if ((~HIDWORD(v40) & 0x3D) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 1;
      goto LABEL_90;
    case 2:
      if ((~HIDWORD(v40) & 0x3D) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 2;
      goto LABEL_90;
    case 3:
      if ((v40 & 0x100000000LL) == 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 3;
      goto LABEL_90;
    case 4:
      if ((~HIDWORD(v40) & 0x23) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 4;
      goto LABEL_90;
    case 6:
      if ((v40 & 0x100000000LL) == 0) {
        goto LABEL_94;
      }
      _WORD *v36 = 6;
      uint64_t result = 0LL;
      if (a4 && a4 != 6)
      {
        sub_274C(a4);
        sub_274C(6u);
LABEL_94:
        error();
      }

      return result;
    case 7:
    case 8:
    case 9:
      goto LABEL_94;
    case 10:
      if ((~HIDWORD(v40) & 0x181) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 10;
      goto LABEL_90;
    case 11:
      if ((~HIDWORD(v40) & 0x81) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 11;
      goto LABEL_90;
    case 12:
      if ((~HIDWORD(v40) & 0x5001) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 12;
      goto LABEL_90;
    case 14:
      if ((~HIDWORD(v40) & 0x83) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 14;
      goto LABEL_90;
    case 15:
      if ((~HIDWORD(v40) & 0x8001) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 15;
      goto LABEL_90;
    case 16:
      if ((~HIDWORD(v40) & 0x10001) != 0) {
        goto LABEL_94;
      }
      unsigned int v29 = 16;
      goto LABEL_90;
    default:
      if (!(_DWORD)v40) {
        goto LABEL_89;
      }
      goto LABEL_94;
  }
}

uint64_t sub_1E60(uint64_t a1)
{
  uint64_t v4 = 1488LL;
  v5 = &word_189EC;
  int v2 = sub_28CC(&v5, &v4, 0, 0xAu);
  uint64_t result = 0LL;
  if (!v2)
  {
    if (sub_28CC(&v5, &v4, 0xEu, *(unsigned __int16 *)(a1 + 8))
      || sub_2940(&v5, &v4, 0xFu, *(_DWORD *)(a1 + 24)))
    {
      return 0LL;
    }

    else
    {
      return (1500 - v4);
    }
  }

  return result;
}

uint64_t sub_1EF8(uint64_t a1)
{
  uint64_t v3 = 1488LL;
  uint64_t v4 = &word_189EC;
  if (sub_28CC(&v4, &v3, 0, 0xCu)
    || sub_2940(&v4, &v3, 0x18u, *(_DWORD *)(a1 + 16))
    || sub_2940(&v4, &v3, 0x13u, *(_DWORD *)(a1 + 12)))
  {
    return 0LL;
  }

  else
  {
    return 1500 - v3;
  }

uint64_t l2tp_incoming_call(int a1, unsigned __int16 *a2, uint64_t a3, int a4)
{
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, 0);
  if ((_DWORD)result) {
    return result;
  }
  l2tp_change_peeraddress(a1, &v18, v9, v10, v11, v12, v13, v14, v16, v17, *(_OWORD *)&v18);
  if (!*(_WORD *)a3) {
    goto LABEL_19;
  }
  if (!*(_WORD *)(a3 + 6)) {
    *(_WORD *)(a3 + 6) = 4;
  }
  l2tp_set_peerparams(a1, (char *)a3);
  HIDWORD(v17) = sub_27C0(2u, a2);
  uint64_t result = sub_140C(a1, SHIDWORD(v17), 0, 0LL, "SCCRP");
  if ((_DWORD)result) {
    return result;
  }
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
  if ((_DWORD)result) {
    return result;
  }
  v18.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
  if ((_DWORD)result) {
    return result;
  }
  if (!*(_WORD *)(a3 + 8)) {
LABEL_19:
  }
    error();
  HIDWORD(v17) = sub_2200((uint64_t)a2);
  uint64_t result = sub_140C(a1, SHIDWORD(v17), *(unsigned __int16 *)(a3 + 8), 0LL, "ICRP");
  if (!(_DWORD)result)
  {
    uint64_t result = l2tp_recv(a1, &control_buf, 1500, (_DWORD *)&v17 + 3, &v18, a4);
    if (!(_DWORD)result)
    {
      uint64_t v15 = bswap32(*(unsigned __int16 *)((char *)&dword_4 + (void)control_hdr + 2)) >> 16;
      if ((_DWORD)v15 == a2[4]) {
        return 0LL;
      }
      *(void *)&__int128 v17 = v15;
      goto LABEL_19;
    }
  }

  return result;
}

uint64_t sub_2200(uint64_t a1)
{
  uint64_t v4 = 1488LL;
  v5 = &word_189EC;
  int v2 = sub_28CC(&v5, &v4, 0, 0xBu);
  uint64_t result = 0LL;
  if (!v2)
  {
    else {
      return (1500 - v4);
    }
  }

  return result;
}

uint64_t l2tp_send_hello(int a1)
{
  uint64_t v4 = 1488LL;
  v5 = &word_189EC;
  else {
    int v2 = 1500 - v4;
  }
  return sub_140C(a1, v2, 0, 0LL, "Hello");
}

uint64_t l2tp_send_hello_trigger(int a1, const sockaddr *a2)
{
  size_t v8 = 4LL;
  if (sysctlbyname("net.key.blockacq_count", &v9, &v8, 0LL, 0LL))
  {
    int v9 = 10;
    error();
  }

  uint64_t v10 = 1488LL;
  uint64_t v11 = &word_189EC;
  else {
    int v4 = 1500 - v10;
  }
  if ((v9 & 0x80000000) == 0)
  {
    int v5 = 0;
    do
    {
    }

    while (v5++ < v9);
  }

  return 0LL;
}

uint64_t l2tp_send_SCCRQ(int a1, const sockaddr *a2, unsigned __int16 *a3)
{
  int v5 = sub_27C0(1u, a3);
  return sub_140C(a1, v5, 0, a2, "SCCRQ");
}

uint64_t l2tp_send_CDN(int a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v13 = 1488LL;
  uint64_t v14 = &word_189EC;
  int v6 = sub_28CC(&v14, &v13, 0, 0xEu);
  int v7 = 0;
  if (!v6)
  {
    if (sub_28CC(&v14, &v13, 0xEu, a2[4])
      || (!a2[283]
        ? (v10 = 0LL, uint64_t v9 = 8LL)
        : (v8 = strlen((const char *)a2 + 568), uint64_t v9 = (unsigned __int16)(v8 + 10), v10 = v8),
          sub_29B4(&v14, &v13, 1u, v9)))
    {
      int v7 = 0;
    }

    else
    {
      uint64_t v12 = v14;
      *uint64_t v14 = a2[282];
      if (a2[283])
      {
        v12[1] = a2[283];
        memcpy(v12 + 2, a2 + 284, v10);
      }

      int v7 = 1500 - v13;
    }
  }

  return sub_140C(a1, v7, *(unsigned __int16 *)(a3 + 8), 0LL, "CDN");
}

uint64_t l2tp_send_StopCCN(int a1, const char *a2)
{
  uint64_t v11 = 1488LL;
  uint64_t v12 = &word_189EC;
  int v4 = sub_28CC(&v12, &v11, 0, 4u);
  int v5 = 0;
  if (!v4)
  {
    if (sub_28CC(&v12, &v11, 9u, *(unsigned __int16 *)a2)
      || (!*((_WORD *)a2 + 283)
        ? (v8 = 0LL, uint64_t v7 = 8LL)
        : (v6 = strlen(a2 + 568), uint64_t v7 = (unsigned __int16)(v6 + 10), v8 = v6),
          sub_29B4(&v12, &v11, 1u, v7)))
    {
      int v5 = 0;
    }

    else
    {
      size_t v10 = v12;
      __int16 *v12 = *((_WORD *)a2 + 282);
      if (*((_WORD *)a2 + 283))
      {
        v10[1] = *((_WORD *)a2 + 283);
        memcpy(v10 + 2, a2 + 568, v8);
      }

      int v5 = 1500 - v11;
    }
  }

  return sub_140C(a1, v5, 0, 0LL, "StopCCN");
}

uint64_t l2tp_data_in(int a1)
{
  v6.sa_len = 16;
  uint64_t result = l2tp_recv(a1, &control_buf, 1500, &v4, &v6, 0);
  if (!(_DWORD)result)
  {
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
    if (v3 > 0xEu) {
      return 0LL;
    }
    if (((1 << v3) & 0x1F8E) != 0) {
      error();
    }
    if (((1 << v3) & 0x4010) == 0) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

char *sub_274C(unsigned int a1)
{
  if (a1 < 0x11 && ((0x1DEDFu >> a1) & 1) != 0) {
    return (&off_14678)[(__int16)a1];
  }
  v1 = byte_19878;
  snprintf(byte_19878, 0xFFuLL, "unknown message (type = 0x%x)", a1);
  return v1;
}

uint64_t sub_27C0(unsigned int a1, unsigned __int16 *a2)
{
  uint64_t v6 = 1488LL;
  __dst = &word_189EC;
  size_t v3 = strlen((const char *)a2 + 52) + 1;
  int v4 = (char *)__dst;
  memmove(__dst, a2 + 26, v3);
  __dst = &v4[v3];
  if (sub_28CC((_WORD **)&__dst, &v6, 9u, *a2)
    || sub_28CC((_WORD **)&__dst, &v6, 0xAu, a2[3]))
  {
    return 0LL;
  }

  else
  {
    return 1500 - v6;
  }

uint64_t sub_28CC(_WORD **a1, void *a2, unsigned int a3, unsigned int a4)
{
  if (*a2 < 8uLL) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a2 -= 8LL;
  **a1 = 2176;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  *uint64_t v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  size_t v8 = (*a1)++;
  v8[1] = __rev16(a4);
  ++*a1;
  return result;
}

uint64_t sub_2940(_WORD **a1, void *a2, unsigned int a3, unsigned int a4)
{
  if (*a2 < 0xAuLL) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *a2 -= 10LL;
  **a1 = 2688;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  *uint64_t v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  size_t v8 = (*a1)++;
  *(_DWORD *)(v8 + 1) = bswap32(a4);
  *a1 += 2;
  return result;
}

uint64_t sub_29B4(_WORD **a1, void *a2, unsigned int a3, uint64_t a4)
{
  uint64_t result = 0LL;
  *a2 -= a4 + 6;
  **a1 = bswap32((a4 + 6) | 0x8000) >> 16;
  uint64_t v6 = *a1 + 1;
  *a1 = v6;
  *uint64_t v6 = 0;
  uint64_t v7 = (*a1)++;
  v7[1] = __rev16(a3);
  ++*a1;
  return result;
}

void start(const void *a1)
{
  qword_19B88 = (uint64_t)a1;
  CFRetain(a1);
  the_channel_ptr = &l2tp_options;
  timeout_ptr = (void (__cdecl *)(int))l2tp_process_extra_options;
  umask_ptr = (mode_t (__cdecl *)(mode_t))l2tp_check_options;
  off_14688 = (char *)l2tp_wait_input;
  off_14690 = (char *)l2tp_pre_start_link_check;
  untimeout_ptr = (uint64_t (*)())l2tp_connect;
  userOptions_ptr = l2tp_disconnect;
  off_14678 = (char *)l2tp_cleanup;
  off_14680 = (char *)l2tp_close_fds;
  wait_underlying_interface_up_ptr = l2tp_establish_ppp;
  waitpid_ptr = (pid_t (__cdecl *)(pid_t, int *, int))l2tp_disestablish_ppp;
  warning_ptr = (uint64_t (*)())&generic_send_config_ptr;
  write_ptr = (ssize_t (__cdecl *)(int, const void *, size_t))&generic_recv_config_ptr;
  add_notifier();
}

uint64_t l2tp_process_extra_options()
{
  uint64_t result = strcmp(off_18160, "answer");
  if (!(_DWORD)result)
  {
    uint64_t result = dup(0);
    dword_18848 = result;
  }

  return result;
}

void l2tp_wait_input()
{
  v0 = 0LL;
  if (dword_1884C != -1) {
    is_ready_fd();
  }
  if (dword_18848 != -1) {
    is_ready_fd();
  }
  ppp_process_nat_port_mapping_events();
}

uint64_t l2tp_check_options()
{
  v0 = off_18160;
  uint64_t result = strcmp(off_18160, "connect");
  if ((_DWORD)result)
  {
    uint64_t result = strcmp(v0, "listen");
    if ((_DWORD)result)
    {
      uint64_t result = strcmp(v0, "answer");
      if ((_DWORD)result) {
        error();
      }
    }
  }

  if (dword_1816C <= 3) {
    error();
  }
  if (&extraconnecttime_ptr)
  {
    LODWORD(busycode_ptr) = 1;
    LODWORD(redialtimer_ptr) = 3;
    LODWORD(redialcount_ptr) = (int)&extraconnecttime_ptr / 3;
    LOBYTE(hasbusystate_ptr) = 0;
  }

  return result;
}

uint64_t l2tp_pre_start_link_check()
{
  size_t v8 = 0LL;
  int v0 = nw_nat64_copy_prefixes(0LL, &v8);
  if (v0 >= 1 && v8 != 0LL)
  {
    xmmword_19CE0 = *(_OWORD *)v8;
    free(v8);
    notice();
  }

  xmmword_19CE0 = 0uLL;
  if (v0 < 0) {
    error();
  }
  *(void *)&stru_19CF8.sa_len = 0LL;
  *(void *)&stru_19CF8.sa_data[6] = 0LL;
  dword_19D10 = 0;
  qword_19D08 = 0LL;
  int v2 = SCNetworkReachabilityCreateWithName(0LL, (const char *)&remoteaddress_ptr);
  if (v2)
  {
    size_t v3 = v2;
    BOOL v4 = SCNetworkReachabilityGetFlags(v2, flags)
      && ((flags[0] & 2) != 0 && (flags[0] & 5) != 5
       || (flags[0] & 0x10) == 0 && ((~flags[0] & 0xF) == 0 || (flags[0] & 0x40007) == 0x40007));
    CFRelease(v3);
  }

  else
  {
    BOOL v4 = 0;
  }

  if ((_DWORD)xmmword_19CE0)
  {
    flags[1] = -1526332912;
    if (inet_aton((const char *)&remoteaddress_ptr, v10))
    {
      *(_DWORD *)&stru_19CF8.sa_len = -1526325732;
      if ((nw_nat64_synthesize_v6(&xmmword_19CE0, v10, &stru_19CF8.sa_data[6]) & 1) == 0) {
        error();
      }
      int v5 = SCNetworkReachabilityCreateWithAddress(0LL, &stru_19CF8);
      if (v5)
      {
        uint64_t v6 = v5;
        if (SCNetworkReachabilityGetFlags(v5, flags)
          && ((flags[0] & 2) != 0 && (flags[0] & 5) != 5
           || (flags[0] & 0x10) == 0 && ((~flags[0] & 0xF) == 0 || (flags[0] & 0x40007) == 0x40007)))
        {
          notice();
        }

        CFRelease(v6);
      }
    }
  }

  if (v4) {
    return 0LL;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t l2tp_connect(_DWORD *a1)
{
  return sub_46D8(a1);
}

void l2tp_disconnect()
{
}

void l2tp_cleanup()
{
  if (!byte_19979)
  {
    if (qword_19D18)
    {
      IPSecRemoveConfiguration((const void *)qword_19D18, &v0);
      IPSecRemovePolicies((const __CFDictionary *)qword_19D18, -1LL, &v0);
      CFRelease((CFTypeRef)qword_19D18);
      qword_19D18 = 0LL;
    }

    if (strcmp(off_18160, "answer")) {
      IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_19B90, (unsigned __int8 *)&xmmword_19C2C);
    }
  }

  if (DWORD1(xmmword_19C2C))
  {
    if (dword_19D40)
    {
      sub_66D8(2, SDWORD1(xmmword_19C2C), 0, 0LL, dword_19D40 != 1);
      dword_19D40 = 0;
    }
  }

uint64_t l2tp_close_fds()
{
  if (byte_19D14 == 1) {
    untimeout();
  }
  if (dword_1884C != -1)
  {
    close(dword_1884C);
    dword_1884C = -1;
  }

  if (dword_189A8 != -1)
  {
    close(dword_189A8);
    dword_189A8 = -1;
  }

  if ((dword_18848 & 0x80000000) == 0)
  {
    close(dword_18848);
    dword_18848 = -1;
  }

  uint64_t result = racoon_ctrlsockfd;
  if ((racoon_ctrlsockfd & 0x80000000) == 0)
  {
    uint64_t result = close(racoon_ctrlsockfd);
    racoon_ctrlsockfd = -1;
  }

  return result;
}

void l2tp_establish_ppp(int a1)
{
  if ((ioctl(a1, 0x8004743DuLL, v1) & 0x80000000) == 0) {
    generic_establish_ppp();
  }
  error();
}

void l2tp_disestablish_ppp()
{
}

void sub_3650()
{
  if (dword_19D40 == 2) {
    sub_66D8(2, SDWORD1(xmmword_19C2C), 0, 0LL, 0);
  }
}

void sub_3680()
{
}

void sub_3714()
{
}

uint64_t sub_3754()
{
  if (!strcmp(off_18160, "connect"))
  {
    if (racoon_ctrlsockfd < 0)
    {
      int v1 = socket(1, 1, 0);
      racoon_ctrlsockfd = v1;
      if (v1 < 0) {
        error();
      }
      __int128 v10 = xmmword_1025C;
      __int128 v11 = unk_1026C;
      __int128 v12 = xmmword_1027C;
      __int128 v13 = unk_1028C;
      strcpy(&v6[2], "/var/run/vpncontrol.sock");
      char v7 = unk_10255;
      __int16 v8 = unk_10256;
      int v9 = unk_10258;
      *(_WORD *)uint64_t v6 = 256;
      uint64_t v14 = 0LL;
      if (connect(v1, (const sockaddr *)v6, 0x6Au) < 0) {
        error();
      }
    }

    uint64_t v3 = 0LL;
    int v4 = 0;
    uint64_t v2 = 5632LL;
    if (byte_19B91 == 2) {
      int v4 = dword_19B94;
    }
    int v5 = DWORD1(xmmword_19C2C);
    HIWORD(v3) = 2048;
    write(racoon_ctrlsockfd, &v2, 0x18uLL);
  }

  else
  {
    IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_19B90, (unsigned __int8 *)&xmmword_19C2C);
  }

  return sleep(3u);
}

void sub_38B8()
{
  else {
    BOOL v0 = &lcp_echo_interval_ptr == 0;
  }
  if (!v0) {
    LODWORD(wait_underlying_interface_up_ptr) = 1;
  }
  ppp_block_public_nat_port_mapping_timer();
}

uint64_t l2tp_resolver_thread()
{
  char __buf = -1;
  BOOL v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    int v1 = gethostbyname((const char *)&remoteaddress_ptr);
    if (v1)
    {
      uint64_t v2 = v1;
      h_addr_list = v1->h_addr_list;
      int v4 = -1;
      do
      {
        uint64_t v5 = (uint64_t)*h_addr_list++;
        ++v4;
      }

      while (v5);
      unsigned __int8 v15 = 0;
      int v6 = open("/dev/random", 0);
      if (v6)
      {
        int v7 = v6;
        read(v6, &v15, 1uLL);
        close(v7);
      }

      DWORD1(xmmword_19C2C) = 0;
      if (v4)
      {
        DWORD1(xmmword_19C2C) = *(_DWORD *)v2->h_addr_list[v15 % v4];
        xmmword_19C3C = 0u;
        unk_19C4C = 0u;
        xmmword_19C5C = 0u;
        unk_19C6C = 0u;
        xmmword_19C7C = 0u;
        unk_19C8C = 0u;
        xmmword_19C9C = 0u;
        unk_19CAC = 0u;
        xmmword_19CBC = 0u;
        unk_19CCC = 0u;
        dword_19CDC = 0;
        if (v4 == 1) {
          goto LABEL_18;
        }
        int v8 = v4 >= 11 ? 11 : v4;
        if (v8 < 2) {
          goto LABEL_18;
        }
        unint64_t v9 = 0LL;
        unint64_t v10 = (v8 - 1);
        int v11 = v15 + 1;
        __int128 v12 = (char *)&xmmword_19C3C + 2;
        do
        {
          *(_DWORD *)(v12 - 2) = -1526332912;
          int v13 = v11 + v9++;
          *(_DWORD *)(v12 + 2) = *(_DWORD *)v2->h_addr_list[v13 % v4];
          v12 += 16;
        }

        while (v9 < v10);
      }

      else
      {
        LODWORD(v9) = 0;
        xmmword_19CBC = 0u;
        unk_19CCC = 0u;
        xmmword_19C9C = 0u;
        unk_19CAC = 0u;
        xmmword_19C7C = 0u;
        unk_19C8C = 0u;
        xmmword_19C5C = 0u;
        unk_19C6C = 0u;
        xmmword_19C3C = 0u;
        unk_19C4C = 0u;
      }

      dword_19CDC = v9;
LABEL_18:
      char __buf = 0;
    }
  }

  write(dword_1899C, &__buf, 1uLL);
  return 0LL;
}

uint64_t l2tp_edge_thread()
{
  char __buf = -1;
  uint64_t v10 = 0LL;
  memset(v9, 0, sizeof(v9));
  char v8 = 0;
  BOOL v0 = pthread_self();
  if (!pthread_detach(v0))
  {
    uint64_t v2 = _CTServerConnectionCreate(kCFAllocatorDefault, nullsub_1, v9);
    if (v2)
    {
      uint64_t v3 = (const void *)v2;
      _CTServerConnectionSetPacketContextActiveByServiceType(v2, kCTDataConnectionServiceTypeInternet, 1LL);
      else {
        BOOL v4 = v8 == 0;
      }
      if (v4)
      {
        int v5 = -39;
        do
        {
          sleep(1u);
          else {
            BOOL v6 = v8 == 0;
          }
        }

        while (v6 && v5++ != 0);
      }

      CFRelease(v3);
      if (v8)
      {
        sleep(2u);
        char __buf = 0;
      }
    }
  }

  write(dword_189A4, &__buf, 1uLL);
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
      goto LABEL_5;
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
      else {
LABEL_5:
      }
        uint64_t result = "Unknown error";
      break;
  }

  return result;
}

uint64_t l2tp_trigger_ipsec(int a1)
{
  if (racoon_ctrlsockfd < 0)
  {
    int v2 = socket(1, 1, 0);
    racoon_ctrlsockfd = v2;
    if (v2 < 0) {
      goto LABEL_10;
    }
    __int128 v11 = xmmword_1025C;
    __int128 v12 = unk_1026C;
    __int128 v13 = xmmword_1027C;
    __int128 v14 = unk_1028C;
    strcpy(&v7[2], "/var/run/vpncontrol.sock");
    *(_WORD *)int v7 = 256;
    uint64_t v15 = 0LL;
    char v8 = unk_10255;
    __int16 v9 = unk_10256;
    int v10 = unk_10258;
    if (connect(v2, (const sockaddr *)v7, 0x6Au) < 0) {
LABEL_10:
    }
      error();
  }

  if (!a1)
  {
    uint64_t v5 = 0x800000000000000LL;
    uint64_t __buf = 256LL;
    *(void *)&__int128 v6 = DWORD1(xmmword_19C2C);
    write(racoon_ctrlsockfd, &__buf, 0x18uLL);
    if ((_DWORD)xmmword_19CE0)
    {
      uint64_t v5 = 0x1000000000000000LL;
      uint64_t __buf = 6144LL;
      __int128 v6 = xmmword_19CE0;
      notice();
    }

    notice();
  }

  close(racoon_ctrlsockfd);
  racoon_ctrlsockfd = -1;
  return 0LL;
}

uint64_t l2tp_change_peeraddress( int a1, _DWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, __int128 a10, __int128 a11)
{
  size_t v11 = *(unsigned __int8 *)a2;
  if (!bcmp(&xmmword_19C2C, a2, v11)) {
    return 0LL;
  }
  if (!byte_19979 && !strcmp(off_18160, "connect"))
  {
    IPSecRemoveConfiguration((const void *)qword_19D18, &v26);
    if (a2[1] != DWORD1(xmmword_19C2C)) {
      IPSecRemoveSecurityAssociations((unsigned __int8 *)&unk_19B90, (unsigned __int8 *)&xmmword_19C2C);
    }
    IPSecRemovePolicies((const __CFDictionary *)qword_19D18, -1LL, &v26);
  }

  if (byte_19B91 == 2 && DWORD1(var48[0]) != dword_19B94)
  {
    xmmword_19BD0 = var48[4];
    unk_19BE0 = var48[5];
    xmmword_19BF0 = a10;
    unk_19C00 = a11;
    unk_19B90 = var48[0];
    unk_19BA0 = var48[1];
    xmmword_19BB0 = var48[2];
    unk_19BC0 = var48[3];
    if (!strcmp(off_18160, "connect")) {
      __int16 v15 = 0;
    }
    else {
      __int16 v15 = -23290;
    }
    word_19B92 = v15;
    l2tp_set_ouraddress(a1, (unsigned __int8 *)&unk_19B90);
  }

  __memmove_chk(&xmmword_19C2C, a2);
  uint64_t v14 = l2tp_set_peeraddress(a1, (unsigned __int8 *)a2);
  uint64_t v16 = off_18160;
  size_t v17 = strlen(off_18160);
  if (!strncmp(off_18160, "answer", v17) || !strncmp(v16, "listen", v17))
  {
    v18.s_addr = DWORD1(xmmword_19C2C);
    remoteaddress_ptr = inet_ntoa(v18);
    notice();
  }

  if (!byte_19979 && !strcmp(off_18160, "connect"))
  {
    int v20 = addr2ascii(2, (char *)&xmmword_19C2C + 4, 4, 0LL);
    CFStringRef v21 = CFStringCreateWithCString(0LL, v20, 0x600u);
    unsigned int valuePtr = bswap32(WORD1(xmmword_19C2C)) >> 16;
    CFNumberRef v22 = CFNumberCreate(0LL, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_19D18, @"RemoteAddress", v21);
    Value = (__CFArray *)CFDictionaryGetValue((CFDictionaryRef)qword_19D18, @"Policies");
    if (CFArrayGetCount(Value) >= 2) {
      CFArrayRemoveValueAtIndex(Value, 1LL);
    }
    ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, 0LL);
    CFDictionarySetValue(ValueAtIndex, @"RemotePort", v22);
    CFArraySetValueAtIndex(Value, 0LL, ValueAtIndex);
    CFDictionarySetValue((CFMutableDictionaryRef)qword_19D18, @"Policies", Value);
    CFRelease(v21);
    CFRelease(v22);
    if (IPSecApplyConfiguration((const void *)qword_19D18, &v26)
      || IPSecInstallPolicies((const __CFDictionary *)qword_19D18, -1LL, &v26))
    {
LABEL_9:
      error();
    }
  }

  return v14;
}

uint64_t sub_46D8(_DWORD *a1)
{
  *a1 = 0;
  if (&cfgCache_ptr) {
    BOOL v1 = &serviceidRef_ptr == 0LL;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1)
  {
    snprintf(__str, 0x20uLL, "socket[%d:%d]", 34, 18);
    __strlcpy_chk(&ppp_devnam_ptr, __str, 1024LL, 1024LL);
    LODWORD(hungup_ptr) = 0;
    LODWORD(kill_link_ptr) = 0;
    byte_19D20 = 0;
    int v2 = &unk_19000;
    byte_19C10 = 0;
    unk_19B90 = 528LL;
    unk_19B98 = 0LL;
    xmmword_19C2C = 0x210uLL;
    bzero(&our_params, 0x45CuLL);
    bzero(&peer_params, 0x45CuLL);
    word_18FC8 = getpid();
    word_18FC6 = dword_1817C;
    word_18FCA = 0;
    dword_18FD8 = 1;
    dword_18FE4 = 3;
    unk_18FCC = 0xF424000000003LL;
    if (gethostname(&byte_18FF4, 0x40uLL)) {
      byte_18FF4 = 0;
    }
    word_18FC2 = 256;
    if (!&ifscope_ptr)
    {
      NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0LL, kSCDynamicStoreDomainState, kSCEntNetIPv4);
      if (NetworkGlobalEntity)
      {
        in_addr v18 = NetworkGlobalEntity;
        unsigned int v19 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)&cfgCache_ptr, NetworkGlobalEntity);
        CFRelease(v18);
        if (v19)
        {
          Value = (const __CFString *)CFDictionaryGetValue(v19, kSCPropNetIPv4Router);
          if (Value) {
            CFStringGetCString(Value, &byte_19D20, 16LL, 0x8000100u);
          }
          CFStringRef v21 = (const __CFString *)CFDictionaryGetValue(v19, kSCDynamicStorePropNetPrimaryInterface);
          if (v21) {
            CFStringGetCString(v21, &byte_19C10, 17LL, 0x8000100u);
          }
          CFRelease(v19);
        }
      }

      goto LABEL_49;
    }

    __strcpy_chk(&byte_19C10);
    if (!byte_19C10) {
      goto LABEL_52;
    }
    Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity( kCFAllocatorDefault,  kSCDynamicStoreDomainState,  kSCCompAnyRegex,  kSCEntNetIPv4);
    CFStringRef v5 = NetworkServiceEntity;
    __int128 v6 = 0LL;
    if (Mutable)
    {
      int v7 = 0LL;
      char v8 = 0LL;
      if (!NetworkServiceEntity) {
        goto LABEL_36;
      }
      CFArrayAppendValue(Mutable, NetworkServiceEntity);
      __int16 v9 = SCDynamicStoreCopyMultiple(0LL, 0LL, Mutable);
      __int128 v6 = v9;
      if (v9)
      {
        size_t v27 = v5;
        int64_t Count = CFDictionaryGetCount(v9);
        char v8 = (const void **)calloc(Count, 8uLL);
        size_t v11 = (const void **)calloc(Count, 8uLL);
        int v7 = v11;
        if (v8)
        {
          if (v11)
          {
            CFDictionaryGetKeysAndValues(v6, v8, v11);
            if (Count >= 1)
            {
              __int16 v26 = Mutable;
              for (uint64_t i = 0LL; i != Count; ++i)
              {
                __int128 v13 = (const __CFString *)v8[i];
                uint64_t v14 = (const __CFDictionary *)v7[i];
                if (v13) {
                  BOOL v15 = v14 == 0LL;
                }
                else {
                  BOOL v15 = 1;
                }
                if (!v15)
                {
                  uint64_t v16 = (const __CFString *)CFDictionaryGetValue(v14, kSCPropInterfaceName);
                  if (v16)
                  {
                    buffer[0] = 0LL;
                    buffer[1] = 0LL;
                    CFStringGetCString(v16, (char *)buffer, 16LL, 0x600u);
                    if (!strcmp((const char *)buffer, &byte_19C10)
                      && CFStringHasPrefix(v13, kSCDynamicStoreDomainState)
                      && CFStringHasSuffix(v13, kSCEntNetIPv4))
                    {
                      ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0LL, v13, @"/");
                      if (CFArrayGetCount(ArrayBySeparatingStrings) >= 4)
                      {
                        ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3LL);
                        if (ValueAtIndex) {
                          CFRetain(ValueAtIndex);
                        }
                      }

                      CFRelease(ArrayBySeparatingStrings);
                      warning();
                    }
                  }
                }
              }

              int v2 = (_BYTE *)&unk_19000;
              Mutable = v26;
              CFStringRef v5 = v27;
LABEL_36:
              if (!v5) {
                goto LABEL_41;
              }
              goto LABEL_40;
            }
          }
        }

        CFStringRef v5 = v27;
      }

      else
      {
        char v8 = 0LL;
        int v7 = 0LL;
      }

LABEL_40:
      CFRelease(v5);
LABEL_41:
      if (Mutable) {
        CFRelease(Mutable);
      }
      if (v6) {
        CFRelease(v6);
      }
      if (v8) {
        free(v8);
      }
      if (v7) {
        free(v7);
      }
LABEL_49:
      if (v2[3088])
      {
        int v22 = get_if_mtu((uint64_t)&byte_19C10) - 220;
      }

LABEL_52:
      byte_19C24 = 0;
      byte_19C28 = 0;
      LODWORD(wait_underlying_interface_up_ptr) = 0;
      ppp_session_clear();
    }

    int v7 = 0LL;
    char v8 = 0LL;
    goto LABEL_36;
  }

  LODWORD(status_ptr) = 8;
  l2tp_close_fds();
  return 0xFFFFFFFFLL;
}

void sub_5EB8()
{
}

uint64_t l2tp_set_baudrate(int a1, int a2)
{
  int v4 = a2;
  uint64_t result = setsockopt(a1, 18, 15, &v4, 4u);
  if ((_DWORD)result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }

  return result;
}

uint64_t l2tp_set_delegated_process(int a1, int a2)
{
  int v4 = a2;
  uint64_t result = setsockopt(a1, 18, 17, &v4, 4u);
  if ((_DWORD)result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }

  return result;
}

uint64_t l2tp_set_ouraddress(int a1, unsigned __int8 *a2)
{
  if (setsockopt(a1, 18, 14, a2, *a2))
  {
    int v4 = __error();
    strerror(*v4);
    error();
  }

  socklen_t v6 = *a2;
  getsockopt(a1, 18, 14, a2, &v6);
  return 0LL;
}

uint64_t l2tp_set_peeraddress(int a1, unsigned __int8 *a2)
{
  uint64_t result = setsockopt(a1, 18, 2, a2, *a2);
  if ((_DWORD)result)
  {
    uint64_t v3 = __error();
    strerror(*v3);
    error();
  }

  return result;
}

uint64_t l2tp_new_tunnelid(int a1, uint64_t a2)
{
  uint64_t v4 = a2;
  socklen_t v3 = 2;
  getsockopt(a1, 18, 4, &v4, &v3);
  return 0LL;
}

uint64_t l2tp_set_ourparams(int a1, char *a2)
{
  uint64_t v4 = setsockopt(a1, 18, 3, a2, 2u);
  if ((_DWORD)v4
    || (uint64_t v4 = setsockopt(a1, 18, 6, a2 + 8, 2u), (_DWORD)v4)
    || (uint64_t v4 = setsockopt(a1, 18, 8, a2 + 6, 2u), (_DWORD)v4))
  {
    CFStringRef v5 = __error();
    socklen_t v6 = strerror(*v5);
    syslog(7, "l2tp_set_ourparams: failed to set L2TP socket options, err = %s", v6);
  }

  return v4;
}

uint64_t l2tp_set_peerparams(int a1, char *a2)
{
  uint64_t v4 = setsockopt(a1, 18, 5, a2, 2u);
  if ((_DWORD)v4
    || (uint64_t v4 = setsockopt(a1, 18, 7, a2 + 8, 2u), (_DWORD)v4)
    || (uint64_t v4 = setsockopt(a1, 18, 9, a2 + 6, 2u), (_DWORD)v4))
  {
    CFStringRef v5 = __error();
    socklen_t v6 = strerror(*v5);
    syslog(3, "l2tp_set_peerparams: failed to set L2TP socket options, err = %s", v6);
  }

  return v4;
}

uint64_t l2tp_set_flag(int a1, int a2, int a3)
{
  socklen_t v9 = 4;
  uint64_t result = getsockopt(a1, 18, 1, &v8, &v9);
  if (!(_DWORD)result)
  {
    int v7 = v8 & ~a3;
    if (a2) {
      int v7 = v8 | a3;
    }
    int v8 = v7;
    return setsockopt(a1, 18, 1, &v8, 4u);
  }

  return result;
}

void l2tp_reset_timers(int a1, int a2)
{
  BOOL v4 = a2 == 0;
  BOOL v5 = a2 == 0;
  if (v4) {
    socklen_t v6 = &unk_18170;
  }
  else {
    socklen_t v6 = &unk_18178;
  }
  l2tp_set_flag(a1, v5, 32);
  __int16 v7 = dword_18168;
  if (a2) {
    __int16 v7 = dword_18174;
  }
  __int16 v13 = v7;
  __int16 v8 = dword_1816C;
  if (a2) {
    __int16 v8 = dword_18174;
  }
  __int16 v12 = v8;
  __int16 v11 = *v6;
  if (setsockopt(a1, 18, 10, &v13, 2u) || setsockopt(a1, 18, 11, &v12, 2u) || setsockopt(a1, 18, 12, &v11, 2u))
  {
    socklen_t v9 = __error();
    int v10 = strerror(*v9);
    syslog(3, "l2tp_reset_timers: failed to set L2TP socket options, err = %s", v10);
  }

double l2tp_ip_probe_init(_OWORD *a1, uint64_t a2, int a3)
{
  if (a1 && a2 && a3 >= 3)
  {
    if_nametoindex(&byte_19C10);
    bzero(a1, 16LL * a3);
    *(void *)a1 = 0x808080800000204LL;
    if (BYTE1(xmmword_19C2C) == 2 && DWORD1(xmmword_19C2C) != 0)
    {
      a1[1] = xmmword_19C2C;
      if (dword_19CDC) {
        a1[2] = xmmword_19C3C[arc4random() % dword_19CDC];
      }
    }

    double result = NAN;
    *(void *)a2 = -1LL;
    *(_DWORD *)(a2 + 8) = -1;
  }

  return result;
}

void l2tp_init_session()
{
}

void sub_6504()
{
  if (byte_19C28 == 1)
  {
    byte_19C28 = 0;
    log_vpn_interface_address_event();
  }

void sub_6574()
{
  if (DWORD1(xmmword_19C2C))
  {
    BOOL v0 = SCNetworkReachabilityCreateWithAddress(0LL, (const sockaddr *)&xmmword_19C2C);
    if (SCNetworkReachabilityGetFlags(v0, &flags)) {
      BOOL v1 = (flags & 0x20000) != 0;
    }
    else {
      BOOL v1 = 0;
    }
    CFRelease(v0);
    sub_66D8(2, SDWORD1(xmmword_19C2C), 0, 0LL, 0);
    if (!v1 && byte_19D20 && inet_aton(&byte_19D20, &v3) == 1)
    {
      int v2 = 1;
      sub_66D8(1, SDWORD1(xmmword_19C2C), v3.s_addr, 0LL, 0);
    }

    else
    {
      if (!byte_19C10) {
        return;
      }
      v3.s_addr = 0;
      sub_66D8(1, SDWORD1(xmmword_19C2C), 0, &byte_19C10, 1);
      int v2 = 2;
    }

    dword_19D40 = v2;
  }

uint64_t sub_6674()
{
  int v0 = getdtablesize();
  if (v0 >= 1)
  {
    unsigned int v1 = v0 + 1;
    do
    {
      close(v1 - 2);
      --v1;
    }

    while (v1 > 1);
  }

  open("/dev/null", 2, 0LL);
  dup(0);
  return dup(0);
}

void sub_66D8(char a1, int a2, int a3, const char *a4, int a5)
{
  int v10 = socket(17, 3, 17);
  if (v10 < 0)
  {
    uint64_t v16 = __error();
    size_t v17 = strerror(*v16);
    syslog(6, "host_gateway: open routing socket failed, %s", v17);
  }

  else
  {
    int v11 = v10;
    __int128 __buf = 0u;
    __int128 v21 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    BYTE3(__buf) = a1;
    if (a5) {
      unsigned int v12 = 2305;
    }
    else {
      unsigned int v12 = 2053;
    }
    if (a3) {
      v12 |= 2u;
    }
    BYTE2(__buf) = 5;
    DWORD1(v21) = 1;
    WORD6(v25) = 528;
    LODWORD(v26) = a2;
    *((void *)&__buf + 1) = v12 | 0x700000000LL;
    WORD6(v26) = 528;
    LODWORD(v27) = a3;
    WORD6(v27) = 528;
    LODWORD(v28) = -1;
    if (a4)
    {
      WORD6(v28) = 4628;
      size_t v13 = strlen(a4);
      if (v13 >= 0xC) {
        char v14 = 12;
      }
      else {
        char v14 = v13;
      }
      BYTE1(v29) = v14;
      HIDWORD(__buf) = 23;
      __memmove_chk((char *)&v29 + 4, a4);
      unsigned int v15 = 160;
    }

    else
    {
      unsigned int v15 = 140;
    }

    LOWORD(__buf) = v15;
    if (write(v11, &__buf, v15) < 0)
    {
      in_addr v18 = __error();
      unsigned int v19 = strerror(*v18);
      syslog(7, "host_gateway: write routing socket failed, %s", v19);
    }

    close(v11);
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

  socklen_t v6 = sub_696C(v5, a2);
  if (v6)
  {
    __int16 v7 = v6;
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
  BOOL v4 = sub_696C(a1, a2);
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

unsigned __int8 *sub_696C(int a1, int a2)
{
  uint64_t v2 = 0LL;
  while (dword_102C4[v2] != a1)
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

  int v5 = (unsigned __int16 *)qword_19D48[v2];
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

    unsigned int v6 = sub_696C(v5, a2);
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
      dword_189B0 = v2;
      break;
    case 1u:
      uint64_t result = 0LL;
      dword_189B4 = v2;
      break;
    case 2u:
      uint64_t result = 0LL;
      dword_189B8 = v2;
      break;
    case 3u:
      uint64_t result = 0LL;
      dword_189BC = v2;
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
      uint64_t result = dword_189B0;
      break;
    case 1:
      uint64_t result = dword_189B4;
      break;
    case 2:
      uint64_t result = dword_189B8;
      break;
    case 3:
      uint64_t result = dword_189BC;
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
          __int128 v24 = calloc(1uLL, v23);
          if (v24)
          {
            __int128 v25 = v24;
            pid_t v26 = getpid();
            if ((int)v23 > 15)
            {
              *__int128 v25 = 0LL;
              v25[1] = 0LL;
              *(_WORD *)__int128 v25 = 258;
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
                uint64_t v33 = sub_6F44((_WORD *)v25 + 16, (unint64_t)v25 + v23, 5, a4, v36, 255);
                if (!v33)
                {
                  free(v25);
                  __int128 v27 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
                  goto LABEL_42;
                }

                v34 = sub_6F44(v33, (unint64_t)v25 + v23, 6, a5, v36, 255);
                if (!v34)
                {
                  free(v25);
                  __int128 v27 = @"%s: pfkey_setsadbaddr(DST) failed\n";
                  goto LABEL_42;
                }

                if ((v35 & 1) == 0)
                {
                  if ((unint64_t)(v34 + 16) > v32)
                  {
                    free(v25);
                    __int128 v27 = @"%s: response too long\n";
                    goto LABEL_42;
                  }

                  *(_DWORD *)v34 = 1048578;
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

                  __int128 v27 = @"%s: pfkey_send() failed\n";
                }

                else
                {
                  free(v25);
                  __int128 v27 = @"%s: bad response length\n";
                }

                goto LABEL_42;
              }

              free(v25);
              __int128 v27 = @"%s: pfkey_setsadbxsa2() failed\n";
            }

            else
            {
              free(v25);
              __int128 v27 = @"%s: pfkey_setsadbmsg() failed\n";
            }
          }

          else
          {
            v30 = __error();
            v31 = strerror(*v30);
            __ipsec_set_strerror(v31);
            __int128 v27 = @"%s: allocation failure\n";
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

char *sub_6F44(_WORD *a1, unint64_t a2, __int16 a3, unsigned __int8 *a4, char a5, char a6)
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
    BOOL v4 = __error();
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
  return sub_7080(a1, 2, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t sub_7080( int a1, char a2, int a3, char a4, unsigned __int8 *a5, unsigned __int8 *a6, int a7, int a8, char a9, char *a10, int a11, unsigned int a12, int a13, unsigned int a14, int a15, int a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
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
          v31 = @"%s: no AHa algs\n";
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
          v31 = @"%s: no IPCOMPa algs\n";
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
          v50 = v36;
          pid_t v37 = getpid();
          if ((int)v35 > 15)
          {
            void *v50 = 0LL;
            v50[1] = 0LL;
            *(_BYTE *)v50 = 2;
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
                v45 = sub_6F44((_WORD *)v50 + 24, (unint64_t)v50 + v35, 5, a5, v49, 255);
                if (!v45)
                {
                  free(v50);
                  v38 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
                  goto LABEL_61;
                }

                v46 = sub_6F44(v45, v44, 6, a6, v49, 255);
                if (!v46)
                {
                  free(v50);
                  v38 = @"%s: pfkey_setsadbaddr(DST) failed\n";
                  goto LABEL_61;
                }

                if (a11)
                {
                  unsigned int v47 = a12;
                  v46 = sub_8B44(v46, v44, 9, a10, a12);
                  if (!v46)
                  {
                    free(v50);
                    v38 = @"%s: pfkey_setsadbkey(ENC) failed\n";
                    goto LABEL_61;
                  }
                }

                else
                {
                  unsigned int v47 = a12;
                }

                if (a13 && (v46 = sub_8B44(v46, v44, 8, &a10[v47], a14)) == 0LL)
                {
                  free(v50);
                  v38 = @"%s: pfkey_setsadbkey(AUTH) failed\n";
                }

                else if ((unint64_t)(v46 + 32) <= v44)
                {
                  *(_OWORD *)v46 = 0u;
                  *((_OWORD *)v46 + 1) = 0u;
                  *(_DWORD *)v46 = 196612;
                  *((_DWORD *)v46 + 1) = a16;
                  *((void *)v46 + 1) = a17;
                  *((void *)v46 + 2) = a18;
                  *((void *)v46 + 3) = a19;
                  unint64_t v48 = sub_8BD0((uint64_t)(v46 + 32), v44, 4, a16, a17, a18, a19);
                  if (v48 && v48 == v44)
                  {
                    ssize_t v41 = pfkey_send(a1, v50, v43);
                    free(v50);
                    if ((v41 & 0x80000000) == 0)
                    {
                      __ipsec_errcode = 0;
                      return v41;
                    }

                    v38 = @"%s: pfkey_send() failed\n";
                  }

                  else
                  {
                    free(v50);
                    v38 = @"%s: pfkey_setsadblifetime(SOFT) failed\n";
                  }
                }

                else
                {
                  free(v50);
                  v38 = @"%s: pfkey_setsadblifetime(HARD) failed\n";
                }

                goto LABEL_61;
              }

              free(v50);
              v38 = @"%s: pfkey_setsadbxsa2() failed\n";
            }

            else
            {
              free(v50);
              v38 = @"%s: pfkey_setsadbsa() failed\n";
            }
          }

          else
          {
            free(v50);
            v38 = @"%s: pfkey_setsadbmsg() failed\n";
          }
        }

        else
        {
          __int16 v39 = __error();
          uint64_t v40 = strerror(*v39);
          __ipsec_set_strerror(v40);
          v38 = @"%s: allocation failure\n";
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
        v31 = @"%s: no ESP algs\n";
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
  return sub_7080(a1, 3, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t pfkey_send_delete(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_76B8(a1, 4, a2, a4, a5, a6);
}

uint64_t sub_76B8(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
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
  size_t v17 = calloc(1uLL, v15 + 50);
  if (v17)
  {
    char v18 = v17;
    pid_t v19 = getpid();
    if ((int)v15 > -35)
    {
      *char v18 = 0LL;
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
        __int128 v25 = sub_6F44((_WORD *)v18 + 16, (unint64_t)v18 + v16, 5, a4, v13, 255);
        if (v25)
        {
          char v26 = sub_6F44(v25, (unint64_t)v18 + v16, 6, a5, v13, 255);
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
    __int128 v24 = strerror(*v23);
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
      *uint64_t v15 = 0LL;
      v15[1] = 0LL;
      *(_WORD *)uint64_t v15 = 1026;
      *((_BYTE *)v15 + 2) = 0;
      *((_BYTE *)v15 + 3) = a2;
      *((_DWORD *)v15 + 1) = (unsigned __int16)(v13 >> 3);
      *((_DWORD *)v15 + 2) = 0;
      *((_DWORD *)v15 + 3) = v16;
      int v22 = sub_6F44((_WORD *)v15 + 8, (unint64_t)v15 + v13, 5, a4, v10, 255);
      if (v22)
      {
        size_t v23 = sub_6F44(v22, (unint64_t)v15 + v13, 6, a5, v10, 255);
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

          size_t v17 = @"%s: pfkey_send() failed\n";
        }

        else
        {
          free(v15);
          size_t v17 = @"%s: pfkey_setsadbaddr(DST) failed\n";
        }
      }

      else
      {
        free(v15);
        size_t v17 = @"%s: pfkey_setsadbaddr(SRC) failed\n";
      }
    }

    else
    {
      free(v15);
      size_t v17 = @"%s: pfkey_setsadbmsg() failed\n";
    }
  }

  else
  {
    BOOL v20 = __error();
    ssize_t v21 = strerror(*v20);
    __ipsec_set_strerror(v21);
    size_t v17 = @"%s: allocation failure\n";
  }

  SCLog(1LL, 3LL, v17);
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_get(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_76B8(a1, 5, a2, a4, a5, a6);
}

uint64_t pfkey_send_register(int a1, unsigned int a2)
{
  uint64_t v4 = 0LL;
  if (a2)
  {
    while (dword_102C4[v4] != a2)
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

    int v7 = (void *)qword_19D48[v4];
    if (v7)
    {
      free(v7);
      qword_19D48[v4] = 0LL;
    }
  }

  else
  {
    do
    {
      int v5 = *(void **)((char *)qword_19D48 + v4);
      if (v5)
      {
        free(v5);
        *(uint64_t *)((char *)qword_19D48 + v4) = 0LL;
      }

      v4 += 8LL;
    }

    while (v4 != 24);
  }

  return sub_7D24(a1, 7, a2);
}

uint64_t sub_7D24(int a1, int a2, unsigned int a3)
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
  char *v8 = 2;
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

        int v11 = (void *)qword_19D48[v10];
        if (v11)
        {
          free(v11);
          unsigned __int16 v9 = *v3;
        }

        size_t v12 = v9;
        uint64_t v13 = malloc(v9);
        qword_19D48[v10] = (uint64_t)v13;
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

uint64_t pfkey_send_flush(int a1, unsigned int a2)
{
  return sub_7D24(a1, 9, a2);
}

uint64_t pfkey_send_dump(int a1, unsigned int a2)
{
  return sub_7D24(a1, 10, a2);
}

uint64_t pfkey_send_promisc_toggle(int a1, int a2)
{
  return sub_7D24(a1, 11, a2 != 0);
}

ssize_t pfkey_send_spdadd( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_8224(a1, 14, a2, a3, a4, a5, a6, 0, 0LL, a7, a8, a9);
}

ssize_t sub_8224( int a1, char a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, char a7, unsigned int a8, uint64_t a9, void *__src, int a11, int a12)
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
    __int128 v25 = v24;
    pid_t v26 = getpid();
    if ((int)v23 > 15)
    {
      *__int128 v25 = 0LL;
      v25[1] = 0LL;
      *(_BYTE *)__int128 v25 = 2;
      *((_BYTE *)v25 + 1) = a2;
      unint64_t v32 = (char *)v25 + v23;
      *((_WORD *)v25 + 1) = 0;
      *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
      *((_DWORD *)v25 + 2) = a12;
      *((_DWORD *)v25 + 3) = v26;
      int v33 = sub_6F44((_WORD *)v25 + 8, (unint64_t)v25 + v23, 5, a3, v18, a7);
      if (v33)
      {
        int v34 = sub_6F44(v33, (unint64_t)v25 + v23, 6, a5, v17, a7);
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
    v31 = strerror(*v30);
    __ipsec_set_strerror(v31);
    BOOL v27 = @"%s: allocation failure\n";
  }

  SCLog(1LL, 3LL, v27);
  return 0xFFFFFFFFLL;
}

ssize_t pfkey_send_spdadd2( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_8224(a1, 14, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spdupdate( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_8224(a1, 13, a2, a3, a4, a5, a6, 0, 0LL, a7, a8, a9);
}

ssize_t pfkey_send_spdupdate2( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_8224(a1, 13, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spddelete( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_8224(a1, 15, a2, a3, a4, a5, a6, 0, 0LL, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spddelete2(int a1, int a2)
{
  return sub_86E8(a1, 22, a2);
}

uint64_t sub_86E8(int a1, char a2, int a3)
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
  return sub_86E8(a1, 16, a2);
}

ssize_t pfkey_send_spdsetidx( int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_8224(a1, 20, a2, a3, a4, a5, a6, 0, 0LL, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spdflush(int a1)
{
  return sub_7D24(a1, 19, 0);
}

uint64_t pfkey_send_spddump(int a1)
{
  return sub_7D24(a1, 18, 0);
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

char *sub_8B44(_WORD *a1, unint64_t a2, __int16 a3, const void *a4, unsigned int a5)
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

unint64_t sub_8BD0( uint64_t a1, unint64_t a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7)
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
    *(_DWORD *)(a1 + 4) = dword_189B0 * a4 / 0x64u;
    unint64_t v9 = dword_189B8 * a6 / 0x64uLL;
    *(void *)(a1 + 8) = dword_189B4 * a5 / 0x64uLL;
    *(void *)(a1 + 16) = v9;
    a7 = dword_189BC * a7 / 0x64;
LABEL_8:
    *(void *)(a1 + 24) = a7;
  }

  return result;
}

uint64_t makepath(const char *a1)
{
  mode_t v2 = umask(0);
  size_t v3 = (int)(strlen(a1) + 1);
  int v4 = (char *)malloc(v3);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  strlcpy(v4, a1, v3);
  uint64_t v6 = *v5 == 47;
  while (1)
  {
    if (v5[v6])
    {
      if (v5[v6] != 47)
      {
        int v7 = 0;
        goto LABEL_13;
      }

      int v7 = 0;
      v5[v6] = 0;
    }

    else
    {
      int v7 = 1;
    }

    if (mkdir(v5, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v5, &v10) < 0)) {
      break;
    }
    v5[v6] = 47;
LABEL_13:
    ++v6;
    if (v7)
    {
      uint64_t v8 = 0LL;
      goto LABEL_17;
    }
  }

  uint64_t v8 = 0xFFFFFFFFLL;
LABEL_17:
  free(v5);
  umask(v2);
  return v8;
}

FILE *racoon_pid()
{
  unsigned int v3 = 0;
  unint64_t result = fopen("/var/run/racoon.pid", "r");
  if (result)
  {
    uint64_t v1 = result;
    fscanf(result, "%d", &v3);
    fclose(v1);
    *(void *)uint64_t v6 = 0xE00000001LL;
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
  return sub_8F18(a1, a2, 1);
}

uint64_t sub_8F18(const void *a1, const char **a2, int a3)
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
    stat v10 = "incorrect local address found";
LABEL_19:
    *a2 = v10;
    goto LABEL_20;
  }

  if (!racoon_validate_cfg_str(cStr))
  {
    stat v10 = "invalid local address";
    goto LABEL_19;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v94, 256))
  {
    stat v10 = "incorrect remote address found";
    goto LABEL_19;
  }

  if (!racoon_validate_cfg_str(v94))
  {
    stat v10 = "invalid remote address";
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
    unint64_t v9 = __str;
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

      unint64_t v9 = __str;
    }
  }

  else
  {
    unint64_t v9 = "/dev/null";
  }

  mode_t v12 = umask(0x3Fu);
  uint64_t v13 = fopen(v9, "w");
  umask(v12);
  if (!v13)
  {
    __error();
    snprintf(v96, 0x100uLL, "cannot create racoon configuration file (error %d)");
    goto LABEL_68;
  }

  if (v89)
  {
    fprintf(v13, "%s%s", (const char *)TAB_LEVEL, "log debug2;\n");
    fprintf(v13, "%s%s", (const char *)TAB_LEVEL, "path logfile /var/log/racoon.log;\n\n");
  }

  BOOL v14 = CFDictionaryGetValue((CFDictionaryRef)a1, @"UseAnonymousPolicy") == 0LL && v7 != 0;
  BOOL v31 = !v14;
  BOOL v82 = v14;
  uint64_t v15 = v94;
  if (v31) {
    uint64_t v15 = "anonymous";
  }
  snprintf(v96, 0x100uLL, "remote %s {\n", v15);
  fprintf(v13, "%s%s", (const char *)TAB_LEVEL, v96);
  fprintf(v13, "%s%s", off_189C8, "doi ipsec_doi;\n");
  v86 = v13;
  fprintf(v13, "%s%s", off_189C8, "situation identity_only;\n");
  Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
  if (Value) {
    char v17 = Value;
  }
  else {
    char v17 = @"SharedSecret";
  }
  __strlcpy_chk(__ptr, "exchange_mode ", 1024LL, 1024LL);
  char v18 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ExchangeMode");
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
        __int128 v25 = "main";
        if (!v24)
        {
          int v26 = CFEqual(ValueAtIndex, @"Aggressive");
          __int128 v25 = "aggressive";
          if (!v26)
          {
            int v27 = CFEqual(ValueAtIndex, @"Base");
            __int128 v25 = "base";
            if (!v27)
            {
              uint64_t v40 = "incorrect phase 1 exchange mode";
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
    int StrFromDict = GetStrFromDict( (const __CFDictionary *)a1,  @"LocalIdentifier",  v100,  256,  (const char *)&unk_110A1);
    if (IPSecIsAggressiveMode(v17, StrFromDict, 1)) {
      char v29 = "aggressive";
    }
    else {
      char v29 = "main";
    }
    __strlcat_chk(__ptr, v29, 1024LL, 1024LL);
  }

  __strlcat_chk(__ptr, ";\n", 1024LL, 1024LL);
  int v30 = v13;
  fprintf(v13, "%s%s", off_189C8, __ptr);
  if (!CFEqual(v17, @"SharedSecret") && !CFEqual(v17, @"Certificate") && !CFEqual(v17, @"Hybrid"))
  {
    pid_t v37 = "incorrect authentication method found";
    goto LABEL_258;
  }

  if (GetStrFromDict( (const __CFDictionary *)a1,  @"LocalIdentifierType",  v99,  256,  (const char *)&unk_110A1))
  {
    if (*(_DWORD *)v99 ^ 0x4E445146 | v99[4])
    {
      if (*(void *)v99 ^ 0x4E44514672657355LL | v99[8])
      {
        BOOL v31 = *(_DWORD *)v99 == 1232692555 && *(unsigned __int16 *)&v99[4] == 68;
        if (v31)
        {
          unint64_t v32 = "keyid_use";
        }

        else if (*(void *)v99 == 0x73736572646441LL)
        {
          unint64_t v32 = "address";
        }

        else
        {
          unint64_t v32 = *(_DWORD *)v99 ^ 0x314E5341 | *(_DWORD *)&v99[3] ^ 0x4E4431u ? (const char *)&unk_110A1 : "asn1dn";
        }
      }

      else
      {
        unint64_t v32 = "user_fqdn";
      }
    }

    else
    {
      unint64_t v32 = "fqdn";
    }

    __strlcpy_chk(v99, v32, 256LL, 256LL);
    if (!racoon_validate_cfg_str(v99))
    {
      pid_t v37 = "invalid LocalIdentifierType";
      goto LABEL_258;
    }
  }

  if (GetStrFromDict( (const __CFDictionary *)a1,  @"LocalIdentifier",  v100,  256,  (const char *)&unk_110A1))
  {
    if (!racoon_validate_cfg_str(v100))
    {
      pid_t v37 = "invalid LocalIdentifier";
      goto LABEL_258;
    }

    int v33 = v99;
    if (!v99[0]) {
      int v33 = "fqdn";
    }
    snprintf(__ptr, 0x400uLL, "my_identifier %s %s;\n", v33, v100);
    goto LABEL_79;
  }

  if (!CFEqual(v17, @"SharedSecret") && !CFEqual(v17, @"Hybrid") && CFEqual(v17, @"Certificate"))
  {
    strcpy(__ptr, "my_identifier asn1dn;\n");
LABEL_79:
    fprintf(v13, "%s%s", off_189C8, __ptr);
  }

  int v34 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"IdentifierVerification");
  if (!CFEqual(v34, @"None"))
  {
    if (CFEqual(v34, @"GenerateFromRemoteAddress"))
    {
      if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v100, 256))
      {
        pid_t v37 = "no remote address found";
        goto LABEL_169;
      }

      snprintf(__ptr, 0x400uLL, "peers_identifier address %s;\n", v100);
      int v30 = v13;
      fprintf(v13, "%s%s", off_189C8, __ptr);
      int v38 = CFEqual(v17, @"Certificate");
      __int16 v39 = "off";
      if (!v38) {
        __int16 v39 = "on";
      }
      int v35 = 2 * (v38 != 0);
      goto LABEL_110;
    }

    if (CFEqual(v34, @"UseRemoteIdentifier"))
    {
      int v30 = v13;
      if (!GetStrFromDict( (const __CFDictionary *)a1,  @"RemoteIdentifier",  v100,  256,  (const char *)&unk_110A1))
      {
        pid_t v37 = "no remote identifier found";
        goto LABEL_258;
      }

      if (!racoon_validate_cfg_str(v100))
      {
        pid_t v37 = "invalid RemoteIdentifier";
        goto LABEL_258;
      }

      snprintf(__ptr, 0x400uLL, "peers_identifier fqdn %s;\n", v100);
      fprintf(v13, "%s%s", off_189C8, __ptr);
      if (!CFEqual(v17, @"Certificate") && !CFEqual(v17, @"Hybrid"))
      {
        int v35 = 0;
        __int16 v39 = "on";
        goto LABEL_110;
      }

      int v35 = 2;
    }

    else
    {
      if (!CFEqual(v34, @"UseOpenDirectory"))
      {
        pid_t v37 = "incorrect verification method";
        goto LABEL_169;
      }

      int v30 = v13;
      if (!CFEqual(v17, @"Certificate"))
      {
        pid_t v37 = "open directory can only be used with certificate authentication";
        goto LABEL_258;
      }

      int v35 = 1;
    }

    __int16 v39 = "off";
LABEL_110:
    char v36 = __ptr;
    snprintf(__ptr, 0x400uLL, "verify_identifier %s;\n", v39);
    goto LABEL_111;
  }

  int v35 = 0;
  char v36 = "verify_identifier off;\n";
  int v30 = v86;
LABEL_111:
  fprintf(v30, "%s%s", off_189C8, v36);
  if (CFEqual(v17, @"SharedSecret") || CFEqual(v17, @"Hybrid"))
  {
    if (!GetStrFromDict( (const __CFDictionary *)a1,  @"SharedSecret",  v100,  256,  (const char *)&unk_110A1))
    {
      pid_t v37 = "no shared secret found";
      goto LABEL_258;
    }

    if (!racoon_validate_cfg_str(v100))
    {
      pid_t v37 = "invalid SharedSecret";
      goto LABEL_258;
    }

    __strlcpy_chk(v99, "use", 256LL, 256LL);
    ssize_t v41 = CFDictionaryGetValue((CFDictionaryRef)a1, @"SharedSecretEncryption");
    if (!isString(v41))
    {
LABEL_126:
      snprintf(__ptr, 0x400uLL, "shared_secret %s %s;\n", v99, v100);
      int v30 = v86;
      fprintf(v86, "%s%s", off_189C8, __ptr);
      if (CFEqual(v17, @"Hybrid"))
      {
        strcpy(__ptr, "certificate_verification sec_framework use_peers_identifier;\n");
LABEL_135:
        fprintf(v30, "%s%s", off_189C8, __ptr);
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

    pid_t v37 = "incorrect shared secret encryption found";
LABEL_169:
    int v30 = v86;
    goto LABEL_258;
  }

  if (CFEqual(v17, @"Certificate"))
  {
    int v43 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"LocalCertificate");
    if (isData(v43))
    {
      fprintf(v86, "%s%s", off_189C8, "certificate_type x509 in_keychain ");
      unint64_t v44 = v43;
      int v30 = v86;
      int v45 = sub_F264(v44, (uint64_t)__ptr);
      fwrite(__ptr, 1uLL, v45, v86);
      fputs(";\n", v86);
    }

    else
    {
      int v30 = v86;
      fprintf(v86, "%s%s", off_189C8, "certificate_type x509 in_keychain;\n");
    }

    fprintf(v30, "%s%s", off_189C8, "verify_cert on;\n");
    v46 = " use_peers_identifier";
    if (v35 != 2) {
      v46 = (const char *)&unk_110A1;
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
      fprintf(v30, "%s%s", off_189C8, __ptr);
      goto LABEL_140;
    }

    pid_t v37 = "invalid force local address";
LABEL_258:
    *a2 = v37;
    goto LABEL_259;
  }

LABEL_140:
  GetIntFromDict((const __CFDictionary *)a1, @"NonceSize", v100, 16);
  snprintf(__ptr, 0x400uLL, "nonce_size %d;\n", *(_DWORD *)v100);
  fprintf(v30, "%s%s", off_189C8, __ptr);
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattMultipleUsersEnabled", v100, 0))
  {
    if (*(_DWORD *)v100) {
      unsigned int v47 = "on";
    }
    else {
      unsigned int v47 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_multi_user %s;\n", v47);
    fprintf(v30, "%s%s", off_189C8, __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"NattKeepAliveEnabled", v100, 1))
  {
    if (*(_DWORD *)v100) {
      unint64_t v48 = "on";
    }
    else {
      unint64_t v48 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_keepalive %s;\n", v48);
    fprintf(v30, "%s%s", off_189C8, __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionEnabled", v100, 0))
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionDelay", v99, 30);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionRetry", &v93, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionMaxFail", &v92, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"BlackHoleDetectionEnabled", &v91, 1);
    snprintf(__ptr, 0x400uLL, "dpd_delay %d;\n", *(_DWORD *)v99);
    fprintf(v30, "%s%s", off_189C8, __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_retry %d;\n", v93);
    fprintf(v30, "%s%s", off_189C8, __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_maxfail %d;\n", v92);
    fprintf(v30, "%s%s", off_189C8, __ptr);
    if (v91) {
      char v49 = "dpd_blackhole_detect";
    }
    else {
      char v49 = "dpd_inbound_detect";
    }
    snprintf(__ptr, 0x400uLL, "dpd_algorithm %s;\n", v49);
    fprintf(v30, "%s%s", off_189C8, __ptr);
  }

  if (GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdle", v100, 0) && *(_DWORD *)v100)
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdleTimer", v99, 120);
    snprintf(__ptr, 0x400uLL, "disconnect_on_idle idle_timeout %d idle_direction idle_outbound;\n", *(_DWORD *)v99);
    fprintf(v30, "%s%s", off_189C8, __ptr);
  }

  fprintf(v30, "%s%s", off_189C8, "initial_contact on;\n");
  fprintf(v30, "%s%s", off_189C8, "support_proxy on;\n");
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
  int v30 = v86;
  fprintf(v86, "%s%s", off_189C8, __ptr);
  if (!GetStrFromDict( (const __CFDictionary *)a1,  @"XAuthName",  v100,  256,  (const char *)&unk_110A1)) {
    goto LABEL_177;
  }
  if (!racoon_validate_cfg_str(v100))
  {
    pid_t v37 = "invalid XauthName";
    goto LABEL_258;
  }

  snprintf(__ptr, 0x400uLL, "xauth_login %s;\n", v100);
  fprintf(v86, "%s%s", off_189C8, __ptr);
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
    fprintf(v86, "%s%s", off_189C8, __ptr);
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

    fprintf(v30, "%s%s", off_189C8, "\n");
    fprintf(v30, "%s%s", off_189C8, "proposal {\n");
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
          uint64_t v40 = "incorrect authentication method";
          goto LABEL_104;
        }
      }

      __strlcpy_chk(v99, v59, 256LL, 256LL);
    }

    snprintf(v100, 0x400uLL, "authentication_method %s;\n", v99);
    fprintf(v86, "%s%s", off_189D0, v100);
    __strlcpy_chk(v99, "sha1", 256LL, 256LL);
    if (!v56)
    {
      snprintf(v100, 0x400uLL, "hash_algorithm %s;\n", v99);
      fprintf(v86, "%s%s", off_189D0, v100);
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
              uint64_t v40 = "incorrect authentication algorithm";
              goto LABEL_104;
            }
          }
        }
      }

      __strlcpy_chk(v99, v63, 256LL, 256LL);
    }

    snprintf(v100, 0x400uLL, "hash_algorithm %s;\n", v99);
    fprintf(v86, "%s%s", off_189D0, v100);
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
              uint64_t v40 = "incorrect encryption algorithm";
LABEL_104:
              *v84 = v40;
LABEL_105:
              int v30 = v86;
              goto LABEL_259;
            }
          }
        }
      }

      goto LABEL_216;
    }

LABEL_217:
    snprintf(v100, 0x400uLL, "encryption_algorithm %s;\n", v99);
    int v30 = v86;
    fprintf(v86, "%s%s", off_189D0, v100);
    *(_DWORD *)v99 = 3600;
    if (v56)
    {
      GetIntFromDict((const __CFDictionary *)v56, @"Lifetime", v99, 3600);
      snprintf(v100, 0x400uLL, "lifetime time %d sec;\n", *(_DWORD *)v99);
      fprintf(v86, "%s%s", off_189D0, v100);
      *(_DWORD *)v99 = 14;
      GetIntFromDict((const __CFDictionary *)v56, @"DHGroup", v99, 14);
      int v73 = *(_DWORD *)v99;
    }

    else
    {
      snprintf(v100, 0x400uLL, "lifetime time %d sec;\n", 3600);
      fprintf(v86, "%s%s", off_189D0, v100);
      int v73 = 14;
      *(_DWORD *)v99 = 14;
    }

    snprintf(v100, 0x400uLL, "dh_group %d;\n", v73);
    fprintf(v86, "%s%s", off_189D0, v100);
    fprintf(v86, "%s%s", off_189C8, "}\n");
    ++v55;
  }

  while (v85 != v55);
  fprintf(v86, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
  v74 = CFDictionaryGetValue((CFDictionaryRef)a1, @"Policies");
  if (!isArray(v74)
    || (CFIndex v75 = CFArrayGetCount((CFArrayRef)v74)) == 0
    || (!v82 ? (uint64_t v76 = 1LL) : (uint64_t v76 = v75), v76 < 1))
  {
LABEL_253:
    fclose(v30);
    if (v83) {
      sub_ABF0();
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
        int v30 = v86;
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

          int v30 = v86;
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
          fprintf(v30, "%s%s", (const char *)TAB_LEVEL, v96);
          fprintf(v30, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
          if (v82)
          {
            int v30 = v86;
            fprintf(v86, "%s%s", (const char *)TAB_LEVEL, v100);
            fprintf(v86, "%s%s", (const char *)TAB_LEVEL, "}\n\n");
          }

LABEL_249:
          ++v77;
          int v30 = v86;
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

      int v30 = v86;
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
  return sub_8F18(a1, a2, 0);
}

uint64_t IPSecRemoveConfiguration(const void *a1, const char **a2)
{
  __str[0] = 0;
  if (!isDictionary(a1))
  {
    int v5 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v5;
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v6, 32))
  {
    int v5 = "incorrect remote address found";
    goto LABEL_7;
  }

  uint64_t result = inet_addr(v6);
  if ((_DWORD)result)
  {
    snprintf(__str, 0x100uLL, "/var/run/racoon/%s.conf", v6);
    remove(__str);
    sub_ABF0();
    return 0LL;
  }

  return result;
}

FILE *sub_ABF0()
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
    int v5 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v5;
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v6, 32))
  {
    int v5 = "incorrect remote address found";
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
      uint64_t v13 = 0LL;
      int v6 = getaddrinfo(a1, 0LL, &stru_10308, &v13);
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
    unint64_t v9 = "cannot open a pfkey socket";
    goto LABEL_77;
  }

  if (!GetStrAddrFromDict(a1, @"LocalAddress", v59, 256))
  {
    unint64_t v9 = "incorrect local address";
    goto LABEL_77;
  }

  if (!GetStrAddrFromDict(a1, @"RemoteAddress", v58, 256))
  {
    unint64_t v9 = "incorrect remote address";
    goto LABEL_77;
  }

  Value = CFDictionaryGetValue(a1, @"Policies");
  if (!isArray(Value))
  {
    unint64_t v9 = "no policies found";
    goto LABEL_77;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  unint64_t v9 = "no policies found";
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
    pid_t v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
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

    char v18 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
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

LABEL_27:
    pid_t v19 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
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

LABEL_31:
    int v21 = strlen(__s);
    caddr_t v22 = ipsec_set_policy(__s, v21);
    if (!v22)
    {
      int v38 = "cannot set policy in";
      goto LABEL_85;
    }

    size_t v23 = (unsigned __int16 *)v22;
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
        __int16 v39 = "incorrect local address";
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
        __int16 v39 = "incorrect remote address";
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
      unint64_t v32 = (const __CFDictionary *)ValueAtIndex;
      int v33 = @"Protocol";
      int v34 = 0;
    }

    else
    {
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v57, 256))
      {
        __int16 v39 = "incorrect local network (0)";
        goto LABEL_95;
      }

      if (!get_address_from_string(v57, v54, 0x80uLL))
      {
        __int16 v39 = "incorrect local network (1)";
        goto LABEL_95;
      }

      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", &v48, 24);
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v57, 256))
      {
        __int16 v39 = "incorrect remote network (0)";
        goto LABEL_95;
      }

      if (!get_address_from_string(v57, v51, 0x80uLL))
      {
        __int16 v39 = "incorrect remote network (1)";
        goto LABEL_95;
      }

      int v28 = v27;
      BOOL v31 = (int *)&v47;
      unint64_t v32 = (const __CFDictionary *)ValueAtIndex;
      int v33 = @"RemotePrefix";
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
        __int16 v39 = "cannot add policy out";
        goto LABEL_95;
      }

      int v14 = v42 + 1;
    }

    if ((v44 & 1) == 0)
    {
      ++v12;
      if ((pfkey_send_spdadd(v6, v51, v47, v54, v48, v46, v23, 8 * v28, v14) & 0x80000000) != 0)
      {
        __int16 v39 = "cannot add policy in";
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

  __int16 v39 = "cannot set policy out";
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

uint64_t IPSecInstallRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_B610(a1, 1, a2, a3, a4, a5);
}

uint64_t sub_B610(uint64_t a1, int a2, const __CFDictionary *a3, CFIndex a4, const char **a5, int a6)
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
    char v18 = "cannot open a routing socket";
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
    pid_t v16 = "incorrect local address";
LABEL_57:
    *a5 = v16;
    CFRelease(v12);
LABEL_58:
    close(v13);
    return 0xFFFFFFFFLL;
  }

  if (!GetStrAddrFromDict(a3, @"RemoteAddress", v49, 256))
  {
    pid_t v16 = "incorrect remote address";
    goto LABEL_57;
  }

  Value = CFDictionaryGetValue(a3, @"Policies");
  if (!isArray(Value))
  {
    pid_t v16 = "no policies found";
    goto LABEL_57;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  pid_t v16 = "no policies found";
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
    char v18 = "incorrect policy found";
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, a4);
      uint64_t v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
      if (isString(v20) && !CFEqual(v20, @"Tunnel"))
      {
        if (!CFEqual(v20, @"Transport"))
        {
          char v18 = "incorrect policy type found";
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
            char v18 = "incorrect policy direction found";
            goto LABEL_52;
          }
        }

        caddr_t v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
        if (isString(v22) && !CFEqual(v22, @"None"))
        {
          if (!CFEqual(v22, @"Require") && !CFEqual(v22, @"Discard") && !CFEqual(v22, @"Unique"))
          {
            char v18 = "incorrect policy level";
            goto LABEL_52;
          }

          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v48, 256)
            || (v46[3].s_addr = 528, !inet_aton(v48, &v47)))
          {
            char v18 = "incorrect local network";
            goto LABEL_52;
          }

          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v48, 256))
          {
            char v18 = "incorrect remote network0";
            goto LABEL_52;
          }

          v45[10] = 528;
          if (!inet_aton(v48, v46))
          {
            char v18 = "incorrect remote network1";
            goto LABEL_52;
          }

          if (a2 != 2) {
            goto LABEL_37;
          }
          size_t v23 = *(uint64_t **)(a1 + 1048);
          if (!v23) {
            goto LABEL_33;
          }
          while (*((_DWORD *)v23 + 2) != v47.s_addr || *((_DWORD *)v23 + 4) != v46[0].s_addr)
          {
            size_t v23 = (uint64_t *)*v23;
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
              sub_F410(v46[0].s_addr, v45[4]);
              CFStringAppendFormat(v12, 0LL, @"%s, ", byte_19D60);
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
  return sub_B610(a1, 2, a2, a3, a4, a5);
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
          unint64_t v9 = "no policies found";
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

                pid_t v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
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
          unint64_t v9 = "no policies found";
        }
      }

      else
      {
        unint64_t v9 = "incorrect remote address";
      }
    }

    else
    {
      unint64_t v9 = "incorrect local address";
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
      unint64_t v9 = a1 + 8;
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
    __memmove_chk(v44, a2);
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
    if (!a1 || (v18 = (_DWORD *)v38) == 0LL || (uint64_t v19 = v37, a4) && !v37)
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
  *(_OWORD *)int v6 = xmmword_102F0;
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
  *(_OWORD *)CFStringRef v62 = xmmword_10338;
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
        unint64_t v9 = addr2ascii(2, a5, 4, v46);
        uint64_t v10 = *(unsigned int *)(a2 + 28);
        size_t v11 = sub_E90C(*(_DWORD *)(a2 + 24));
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
        uint64_t v16 = sub_E90C(*(_DWORD *)(a2 + 24));
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
        CFNumberRef v20 = sub_E90C(*(_DWORD *)(a2 + 24));
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
        uint64_t v28 = sub_E90C(*(_DWORD *)(a2 + 24));
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
        int v24 = sub_E90C(*(_DWORD *)(a2 + 24));
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

char *sub_E90C(int a1)
{
  int v1 = byte_19E60;
  snprintf(byte_19E60, 0x10uLL, "%d", a1);
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

uint64_t sub_ECC4(FILE *a1, const __CFDictionary *a2, const char **a3)
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
  fprintf(a1, "%s%s", off_189C8, __str);
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
  fprintf(a1, "%s%s", off_189C8, __str);
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
  fprintf(a1, "%s%s", off_189C8, __str);
  int v36 = 3600;
  if (a2)
  {
    GetIntFromDict(a2, @"Lifetime", &v36, 3600);
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", v36);
    fprintf(a1, "%s%s", off_189C8, __str);
    int v36 = 0;
    if (GetIntFromDict(a2, @"PFSGroup", &v36, 0))
    {
      if (v36)
      {
        snprintf(__str, 0x400uLL, "pfs_group %d;\n", v36);
        fprintf(a1, "%s%s", off_189C8, __str);
      }
    }
  }

  else
  {
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", 3600);
    fprintf(a1, "%s%s", off_189C8, __str);
  }

  return 0LL;
}

uint64_t sub_F264(const __CFData *a1, uint64_t a2)
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

char *sub_F410(unsigned int a1, unsigned int a2)
{
  unsigned int v3 = bswap32(a1);
  if ((v3 & 0xFFFFFF) != 0)
  {
    if ((_WORD)v3)
    {
      if ((_BYTE)v3) {
        snprintf(byte_19D60, 0x100uLL, "%u.%u.%u.%u");
      }
      else {
        snprintf(byte_19D60, 0x100uLL, "%u.%u.%u");
      }
    }

    else
    {
      snprintf(byte_19D60, 0x100uLL, "%u.%u");
    }
  }

  else
  {
    snprintf(byte_19D60, 0x100uLL, "%u");
  }

  uint64_t result = &byte_19D60[strlen(byte_19D60)];
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
    *uint64_t result = 0;
  }

  return result;
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

BOOL get_array_option( const __CFDictionary *a1, const void *a2, const void *a3, CFIndex a4, char *a5, unsigned int a6, _DWORD *a7, const char *a8)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (isDictionary(Value)
    && (uint64_t v15 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)Value, a3), isArray(v15))
    && (CFIndex Count = CFArrayGetCount(v15), Count > a4))
  {
    CFIndex v17 = Count;
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v15, a4);
    if (isString(ValueAtIndex))
    {
      *a5 = 0;
      CFStringGetCString(ValueAtIndex, a5, a6, 0);
      *a7 = strlen(a5);
    }

    return v17 > a4 + 1;
  }

  else
  {
    strlcpy(a5, a8, a6);
    int v20 = strlen(a5);
    BOOL result = 0LL;
    *a7 = v20;
  }

  return result;
}

size_t get_str_option( const __CFDictionary *a1, const void *a2, const void *a3, char *a4, unsigned int a5, _DWORD *a6, const char *a7)
{
  Value = CFDictionaryGetValue(a1, a2);
  if (isDictionary(Value)
    && (*a4 = 0, uint64_t v13 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)Value, a3), isString(v13)))
  {
    CFStringGetCString(v13, a4, a5, 0x8000100u);
  }

  else
  {
    strlcpy(a4, a7, a5);
  }

  size_t result = strlen(a4);
  *a6 = result;
  return result;
}

const void *get_cfstr_option(const __CFDictionary *a1, const void *a2, const void *a3)
{
  Value = CFDictionaryGetValue(a1, a2);
  int v5 = CFDictionaryGetValue((CFDictionaryRef)Value, a3);
  return v5;
}

const void *get_int_option(const __CFDictionary *a1, const void *a2, const void *a3, _DWORD *a4, int a5)
{
  Value = CFDictionaryGetValue(a1, a2);
  size_t result = isDictionary(Value);
  if ((_DWORD)result)
  {
    unint64_t v10 = CFDictionaryGetValue((CFDictionaryRef)Value, a3);
    size_t result = isNumber(v10);
    if ((_DWORD)result) {
      return (const void *)CFNumberGetValue((CFNumberRef)v10, kCFNumberSInt32Type, a4);
    }
  }

  *a4 = a5;
  return result;
}

uint64_t GetIntFromDict(const __CFDictionary *a1, const void *a2, _DWORD *a3, int a4)
{
  Value = CFDictionaryGetValue(a1, a2);
  uint64_t result = 0LL;
  *a3 = a4;
  return result;
}

size_t GetStrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4, const char *a5)
{
  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return strlen(a3);
}

BOOL GetStrAddrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return isString(Value) && CFStringGetCString(Value, a3, a4, 0x8000100u);
}

const void *GetStrNetFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  uint64_t result = isString(Value);
  if ((_DWORD)result)
  {
    uint64_t result = (const void *)CFStringGetCString(Value, a3, a4, 0x8000100u);
    if ((_DWORD)result) {
      return (const void *)(inet_network(a3) - 1 < 0xFFFFFFFE);
    }
  }

  return result;
}

void add_fd()
{
  while (1)
    ;
}

void add_notifier()
{
  while (1)
    ;
}

void check_vpn_interface_address_change()
{
  while (1)
    ;
}

void check_vpn_interface_alternate()
{
  while (1)
    ;
}

void check_vpn_interface_or_service_unrecoverable()
{
  while (1)
    ;
}

void dbglog()
{
  while (1)
    ;
}

void error()
{
  while (1)
    ;
}

void generic_disestablish_ppp()
{
  while (1)
    ;
}

void generic_establish_ppp()
{
  while (1)
    ;
}

void is_ready_fd()
{
  while (1)
    ;
}

void l2tp_clear_nat_port_mapping()
{
  while (1)
    ;
}

void l2tp_set_nat_port_mapping()
{
  while (1)
    ;
}

void lcp_lowerdown()
{
  while (1)
    ;
}

void link_terminated()
{
  while (1)
    ;
}

void log_vpn_interface_address_event()
{
  while (1)
    ;
}

void new_phase()
{
  while (1)
    ;
}

void notice()
{
  while (1)
    ;
}

void ppp_auxiliary_probe_stop()
{
  while (1)
    ;
}

void ppp_block_public_nat_port_mapping_timer()
{
  while (1)
    ;
}

void ppp_process_auxiliary_probe_input()
{
  while (1)
    ;
}

void ppp_process_nat_port_mapping_events()
{
  while (1)
    ;
}

void ppp_session_clear()
{
  while (1)
    ;
}

void ppp_unblock_public_nat_port_mapping_timer()
{
  while (1)
    ;
}

void ppp_variable_echo_start()
{
  while (1)
    ;
}

void remove_fd()
{
  while (1)
    ;
}

void set_network_signature()
{
  while (1)
    ;
}

void set_server_peer()
{
  while (1)
    ;
}

void timeout(int a1)
{
  while (1)
    ;
}

void untimeout()
{
  while (1)
    ;
}

void warning()
{
  while (1)
    ;
}