uint64_t sub_100001AA8(unsigned int *a1, uint64_t a2, char **a3, void *a4, _DWORD *a5)
{
  unsigned int *v9;
  unsigned int *v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  unint64_t i;
  uint64_t j;
  char v18;
  uint64_t v20;
  int v21;
  int v22;
  __int8 *v23;
  int v24;
  unint64_t v25;
  __int8 v26;
  int8x16_t *v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  int v31;
  int v32;
  __int8 *v33;
  int v34;
  unint64_t v35;
  __int8 v36;
  int8x16_t v37;
  int8x16_t v38;
  v9 = sub_100026F74(a1, 16LL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  v10 = v9;
  v38 = 0uLL;
  v11 = 0LL;
  if (a2)
  {
    v12 = 0LL;
    do
      v11 += a4[v12++];
    while (a2 != v12);
    v13 = *a3;
    v14 = &(*a3)[*a4];
    if (v11 < 0x10)
    {
      v15 = 0LL;
      i = v11;
    }

    else
    {
      v15 = 0LL;
      for (i = v11; i > 0xF; i -= 16LL)
      {
        for (j = 0LL; j != 16; ++j)
        {
          v18 = *v13++;
          v38.i8[j] ^= v18;
          if (v13 >= v14)
          {
            v13 = a3[++v15];
            v14 = &v13[a4[v15]];
          }
        }

        if (i >= 0x11) {
          sub_100026FC0(v10, (unsigned int *)&v38, &v38);
        }
      }

      v11 = 1LL;
    }
  }

  else
  {
    v15 = 0LL;
    i = 0LL;
    v13 = *a3;
    v14 = &(*a3)[*a4];
  }

  v37 = 0uLL;
  sub_100026FC0(v10, (unsigned int *)&v37, &v37);
  v20 = 0LL;
  v21 = v37.i8[0];
  v22 = v37.i8[0];
  do
  {
    v23 = &v37.i8[v20++];
    v24 = v23[1];
    HIDWORD(v25) = v22;
    LODWORD(v25) = v24 << 24;
    *v23 = v25 >> 31;
    v22 = v24;
  }

  while (v20 != 15);
  if (v21 >= 0) {
    v26 = 2 * v37.i8[15];
  }
  else {
    v26 = (2 * v37.i8[15]) ^ 0x87;
  }
  v37.i8[15] = v26;
  if (i || !v11)
  {
    if (i)
    {
      v27 = &v38;
      v28 = i;
      do
      {
        v29 = *v13++;
        v27->i8[0] ^= v29;
        if (v13 >= v14)
        {
          v13 = a3[++v15];
          v14 = &v13[a4[v15]];
        }

        v27 = (int8x16_t *)((char *)v27 + 1);
        --v28;
      }

      while (v28);
    }

    v30 = 0LL;
    v38.i8[i] ^= 0x80u;
    v31 = v37.i8[0];
    v32 = v37.i8[0];
    do
    {
      v33 = &v37.i8[v30++];
      v34 = v33[1];
      HIDWORD(v35) = v32;
      LODWORD(v35) = v34 << 24;
      *v33 = v35 >> 31;
      v32 = v34;
    }

    while (v30 != 15);
    v36 = (2 * v37.i8[15]) ^ 0x87;
    if (v31 >= 0) {
      v36 = 2 * v37.i8[15];
    }
    v37.i8[15] = v36;
  }

  v37 = veorq_s8(v37, v38);
  sub_100026FC0(v10, (unsigned int *)&v37, a5);
  sub_100026FC4(v10);
  return 0LL;
}

uint64_t sub_100001D38(unsigned int *a1, char *a2, uint64_t a3, _DWORD *a4)
{
  uint64_t v5 = a3;
  v6 = a2;
  return sub_100001AA8(a1, 1LL, &v6, &v5, a4);
}

double sub_100001D68(uint64_t a1)
{
  *(_OWORD *)(a1 + 36) = xmmword_10002AD00;
  *(_DWORD *)(a1 + 480) = 3;
  *(_OWORD *)(a1 + 404) = xmmword_10002AD10;
  *(_DWORD *)(a1 + 512) = 600;
  *(_DWORD *)(a1 + 520) = 86400;
  *(_DWORD *)(a1 + 488) = 2;
  *(_DWORD *)(a1 + 528) = 0;
  *(void *)(a1 + 64) = 0x2000007D7LL;
  *(_DWORD *)(a1 + 680) = 1812;
  *(_DWORD *)(a1 + 700) = 31536000;
  *(_DWORD *)(a1 + 76) = 2;
  *(_WORD *)(a1 + 742) = -1;
  *(void *)&double result = 0xC9000003E8LL;
  *(_OWORD *)(a1 + 496) = xmmword_10002AD20;
  return result;
}

void *sub_100001DE8()
{
  v0 = sub_100016B98(0x160uLL);
  v1 = sub_100016B98(0x2F8uLL);
  v8 = v1;
  if (!v0 || !v1)
  {
    sub_100016E40(4LL, "Failed to allocate memory for configuration data.", v2, v3, v4, v5, v6, v7, v12);
    goto LABEL_8;
  }

  v9 = sub_100016B98(0x50uLL);
  v8[17] = v9;
  if (!v9)
  {
LABEL_8:
    free(v0);
    free(v8);
    return 0LL;
  }

  sub_100001D68((uint64_t)v8);
  v0[2] = 1LL;
  void *v0 = v8;
  *((_WORD *)v0 + 12) = 100;
  *(void *)((char *)v0 + 28) = -1LL;
  *((_BYTE *)v0 + 36) = 1;
  for (uint64_t i = 96LL; i != 256; i += 20LL)
    *(_DWORD *)((char *)v0 + i) = -1;
  *((_DWORD *)v0 + 68) = 0;
  *((_OWORD *)v0 + 16) = xmmword_10002AD4C;
  *((_DWORD *)v0 + 73) = 0;
  *(_OWORD *)((char *)v0 + 276) = xmmword_10002AD38;
  *((_DWORD *)v0 + 78) = 1;
  *(_OWORD *)(v0 + 37) = xmmword_10002AD60;
  *((_DWORD *)v0 + 83) = 1;
  *(_OWORD *)((char *)v0 + 316) = xmmword_10002AD74;
  *((_WORD *)v0 + 170) = 12;
  return v0;
}

uint64_t sub_100001EFC(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = bswap32(*(_DWORD *)a1);
  unsigned int v3 = bswap32(*(_DWORD *)a2);
  if (v2 == v3)
  {
    unsigned int v2 = bswap32(*(unsigned __int16 *)(a1 + 4)) >> 16;
    unsigned int v4 = bswap32(*(unsigned __int16 *)(a2 + 4));
    if (v2 == HIWORD(v4)) {
      return 0LL;
    }
    unsigned int v3 = HIWORD(v4);
  }

  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 1LL;
  }
}

uint64_t sub_100001F4C(uint64_t a1)
{
  unsigned int v1 = bswap32(*(_DWORD *)a1);
  unsigned int v2 = bswap32(0);
  if (v1 == v2)
  {
    unsigned int v1 = bswap32(*(unsigned __int16 *)(a1 + 4)) >> 16;
    unsigned int v3 = bswap32(0);
    if (v1 == HIWORD(v3)) {
      return 0LL;
    }
    unsigned int v2 = HIWORD(v3);
  }

  if (v1 < v2) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 1LL;
  }
}

uint64_t sub_100001FAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9 = (unsigned __int8 *)(a1 + 152);
  if (*(void *)(a1 + 240))
  {
    if (*(void *)(a1 + 232))
    {
      sub_100016E40(1LL, "Using pre-configured WPA PSK instead of passphrase", a3, a4, a5, a6, a7, a8, v53);
    }

    else
    {
      sub_100016E40(1LL, "Deriving WPA PSK based on passphrase", a3, a4, a5, a6, a7, a8, v53);
      v10 = sub_100016B98(0x38uLL);
      *(void *)(a1 + 232) = v10;
      if (!v10)
      {
        sub_100016E40(4LL, "Unable to alloc space for PSK", v11, v12, v13, v14, v15, v16, v53);
        return 0xFFFFFFFFLL;
      }

      sub_100016F80(1LL, "SSID", v9, *(void *)(a1 + 192));
      size_t v17 = strlen(*(const char **)(a1 + 240));
      sub_100017128(1LL, "PSK (ASCII passphrase)", *(unsigned __int8 **)(a1 + 240), v17);
      sub_10000F2C4( *(char **)(a1 + 240),  (uint64_t)v9,  *(void *)(a1 + 192),  4096,  (char *)(*(void *)(a1 + 232) + 12LL),  0x20uLL);
      sub_100016F74(1LL, "PSK (from passphrase)", (unsigned __int8 *)(*(void *)(a1 + 232) + 12LL), 32LL);
    }

    *(_DWORD *)(*(void *)(a1 + 232) + 8LL) = 1;
  }

  uint64_t v18 = *(void *)(a1 + 248);
  if (!v18) {
    return 0LL;
  }
  v19 = fopen(*(const char **)(a1 + 248), "r");
  if (!v19)
  {
    sub_100016E40(4LL, "WPA PSK file '%s' not found.", v20, v21, v22, v23, v24, v25, v18);
    return 0xFFFFFFFFLL;
  }

  v26 = v19;
  if (!fgets(&v56, 128, v19))
  {
LABEL_31:
    fclose(v26);
    return 0LL;
  }

  LODWORD(v27) = 0;
  while (1)
  {
    uint64_t v27 = (v27 + 1);
    if (v56 != 35) {
      break;
    }
LABEL_30:
    if (!fgets(&v56, 128, v26)) {
      goto LABEL_31;
    }
  }

  v28 = v57;
  int v29 = v56;
  if (v56)
  {
    while (v29 != 10)
    {
      int v30 = *v28++;
      int v29 = v30;
      if (!v30) {
        goto LABEL_15;
      }
    }

    *(v28 - 1) = 0;
    if (!v56) {
      goto LABEL_30;
    }
  }

  else
  {
LABEL_15:
    if (!v56) {
      goto LABEL_30;
    }
  }

  if (sub_100016198(&v56, (uint64_t)&v54))
  {
    sub_100016E40(4LL, "Invalid MAC address '%s' on line %d in '%s'", v31, v32, v33, v34, v35, v36, (uint64_t)&v56);
    goto LABEL_40;
  }

  v37 = sub_100016B98(0x38uLL);
  if (!v37)
  {
    sub_100016E40(4LL, "WPA PSK allocation failed", v38, v39, v40, v41, v42, v43, v53);
    goto LABEL_40;
  }

  v44 = v37;
  if (BYTE1(v54) | v54 | BYTE2(v54) | HIBYTE(v54) | v55 | HIBYTE(v55))
  {
    *((_DWORD *)v37 + 11) = v54;
    *((_WORD *)v37 + 24) = v55;
  }

  else
  {
    *((_DWORD *)v37 + 2) = 1;
  }

  if (!v57[16])
  {
    sub_100016E40(4LL, "No PSK on line %d in '%s'", v38, v39, v40, v41, v42, v43, v27);
    goto LABEL_39;
  }

  int v45 = strlen(v58);
  if (v45 == 64)
  {
    goto LABEL_29;
  }

  if ((v45 - 8) <= 0x37)
  {
    sub_10000F2C4(v58, (uint64_t)v9, *(void *)(a1 + 192), 4096, v44 + 12, 0x20uLL);
LABEL_29:
    *(void *)v44 = *(void *)(a1 + 232);
    *(void *)(a1 + 232) = v44;
    goto LABEL_30;
  }

LABEL_38:
  sub_100016E40(4LL, "Invalid PSK '%s' on line %d in '%s'", v46, v47, v48, v49, v50, v51, (uint64_t)v58);
LABEL_39:
  free(v44);
LABEL_40:
  fclose(v26);
  return 0xFFFFFFFFLL;
}

  *((_BYTE *)a2 + 68) = v20 & 0xF7;
  --*(_DWORD *)(*(void *)a1 + 2200LL);
  uint64_t v20 = *((_BYTE *)a2 + 68);
  if ((v20 & 0x10) != 0) {
    goto LABEL_39;
  }
LABEL_32:
  if ((v20 & 0x20) != 0)
  {
LABEL_33:
    *((_BYTE *)a2 + 68) = v20 & 0xDF;
    --*(_DWORD *)(*(void *)a1 + 2208LL);
  }

uint64_t sub_1000022E8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2 && *((void *)a1 + 10) == *((void *)a2 + 10))
  {
    uint64_t v4 = 0LL;
    while (1)
    {
      size_t v5 = *(void *)&a1[v4 + 40];
      v4 += 8LL;
      if (v4 == 32) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

void sub_100002374(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 16))
    {
      unint64_t v2 = 0LL;
      do
      {
        unsigned int v3 = *(void **)a1;
        if (*(void *)a1)
        {
          uint64_t v4 = (void *)v3[95 * v2 + 29];
          if (v4)
          {
            do
            {
              size_t v5 = (void *)*v4;
              free(v4);
              uint64_t v4 = v5;
            }

            while (v5);
          }

          uint64_t v6 = (char *)&v3[95 * v2];
          free(*((void **)v6 + 30));
          free(*((void **)v6 + 31));
          uint64_t v7 = (void **)*((void *)v6 + 11);
          if (v7)
          {
            do
            {
              v8 = (void **)*v7;
              free(v7[1]);
              free(v7[11]);
              free(v7);
              uint64_t v7 = v8;
            }

            while (v8);
          }

          v9 = (char *)&v3[95 * v2];
          free(*((void **)v9 + 7));
          free(*((void **)v9 + 46));
          free(*((void **)v9 + 56));
          free(*((void **)v9 + 58));
          free(*((void **)v9 + 16));
          sub_1000027A8(**((void ****)v9 + 17), *(_DWORD *)(*((void *)v9 + 17) + 8LL));
          sub_1000027A8(*(void ***)(*((void *)v9 + 17) + 24LL), *(_DWORD *)(*((void *)v9 + 17) + 32LL));
          free(*((void **)v9 + 67));
          free(*((void **)v9 + 69));
          free(*((void **)v9 + 71));
          free(*((void **)v9 + 72));
          free(*((void **)v9 + 73));
          free(*((void **)v9 + 74));
          free(*((void **)v9 + 76));
          free(*((void **)v9 + 77));
          free(*((void **)v9 + 78));
          free(*((void **)v9 + 80));
          free(*((void **)v9 + 12));
          free(*((void **)v9 + 84));
          free(*((void **)v9 + 86));
          free(*((void **)v9 + 17));
          v10 = (void *)*((void *)v9 + 90);
          if (v10)
          {
            do
            {
              uint64_t v11 = (void *)*v10;
              free(v10);
              v10 = v11;
            }

            while (v11);
          }

          *((void *)v9 + 90) = 0LL;
          uint64_t v12 = (char *)&v3[95 * v2];
          if (*((void *)v12 + 44))
          {
            unint64_t v13 = 0LL;
            uint64_t v14 = (void **)(v12 + 352);
            uint64_t v15 = &v3[95 * v2 + 45];
            do
            {
              uint64_t v16 = *((void *)*v14 + v13);
              if (v16)
              {
                uint64_t v17 = 0LL;
                uint64_t v18 = v16 + 8;
                do
                {
                  free(*(void **)(v18 + v17));
                  *(void *)(v18 + v17) = 0LL;
                  v17 += 8LL;
                }

                while (v17 != 32);
                free(*((void **)*v14 + v13));
              }

              ++v13;
            }

            while (v13 <= *v15);
            free(*v14);
            *uint64_t v14 = 0LL;
          }
        }

        ++v2;
      }

      while (v2 < *(void *)(a1 + 16));
    }

    free(*(void **)a1);
    free(*(void **)(a1 + 56));
    free(*(void **)(a1 + 64));
    free((void *)a1);
  }
}

uint64_t sub_100002598(uint64_t a1, int a2, uint64_t a3, _DWORD *a4)
{
  int v4 = a2 - 1;
  if (a2 < 1) {
    return 0LL;
  }
  int v5 = 0;
  while (1)
  {
    int v6 = v5 + v4;
    if (v5 + v4 < 0 != __OFADD__(v5, v4)) {
      ++v6;
    }
    uint64_t v7 = a1 + 12LL * (v6 >> 1);
    unsigned int v8 = bswap32(*(_DWORD *)v7);
    unsigned int v9 = bswap32(*(_DWORD *)a3);
    if (v8 == v9)
    {
      unsigned int v8 = bswap32(*(unsigned __int16 *)(v7 + 4)) >> 16;
      unsigned int v10 = bswap32(*(unsigned __int16 *)(a3 + 4));
      if (v8 == HIWORD(v10))
      {
        int v11 = 0;
        goto LABEL_12;
      }

      unsigned int v9 = HIWORD(v10);
    }

    int v11 = v8 < v9 ? -1 : 1;
LABEL_12:
    uint64_t v12 = (uint64_t)v6 >> 1;
    if (!v11) {
      break;
    }
    if (v11 < 0) {
      int v5 = v12 + 1;
    }
    else {
      int v4 = v12 - 1;
    }
    if (v5 > v4) {
      return 0LL;
    }
  }

  if (a4) {
    *a4 = *(_DWORD *)(a1 + 12LL * (int)v12 + 8);
  }
  return 1LL;
}

uint64_t sub_100002648(uint64_t result, int a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)result;
    if ((*(_DWORD *)result & 0x80000000) != 0)
    {
      return 0LL;
    }

    else
    {
      unsigned int v3 = (int *)(result + 4);
      while (v2 != a2)
      {
        int v4 = *v3++;
        int v2 = v4;
        if (v4 < 0) {
          return 0LL;
        }
      }

      return 1LL;
    }
  }

  return result;
}

uint64_t *sub_100002678(uint64_t *result, int a2)
{
  if (result)
  {
    while (1)
    {
      int v2 = *((_DWORD *)result + 2);
      if (v2 == a2 || v2 == -1) {
        break;
      }
      double result = (uint64_t *)*result;
      if (!result) {
        return result;
      }
    }

    return (uint64_t *)((char *)result + 12);
  }

  return result;
}

uint64_t sub_1000026A0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned int v3 = *(uint64_t **)(a1 + 232);
  if (!v3) {
    return 0LL;
  }
  BOOL v4 = a3 == 0LL;
  while (1)
  {
    if (v4)
    {
      if (*((_DWORD *)v3 + 2)) {
        break;
      }
    }

    int v6 = (uint64_t *)*v3;
    unsigned int v3 = (uint64_t *)*v3;
    if (!v6) {
      return 0LL;
    }
  }

  return (uint64_t)v3 + 12;
}

uint64_t *sub_1000026FC(uint64_t a1, void *__s2, size_t __n, int a4)
{
  BOOL v4 = *(uint64_t **)(a1 + 88);
  if (v4)
  {
    int v8 = a4 != 0;
    do
    {
      if (!a4 && !v4[1]) {
        break;
      }
      if (*((_DWORD *)v4 + 26) == v8)
      {
        size_t v9 = v4[2];
      }

      BOOL v4 = (uint64_t *)*v4;
    }

    while (v4);
  }

  return v4;
}

void sub_1000027A8(void **a1, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v3 = a2;
    BOOL v4 = a1 + 3;
    do
    {
      int v5 = *v4;
      v4 += 12;
      free(v5);
      --v3;
    }

    while (v3);
  }

  free(a1);
}

void *sub_1000027F0(void *result)
{
  *double result = sub_1000028F0;
  result[1] = sub_100002918;
  result[2] = sub_100002938;
  result[3] = sub_100002960;
  result[4] = sub_100002980;
  result[5] = sub_1000029A0;
  result[6] = sub_100002A18;
  result[7] = sub_100002A40;
  result[8] = sub_100002A60;
  result[9] = sub_100002A80;
  result[10] = sub_100002B04;
  result[11] = sub_100002B7C;
  result[12] = sub_100002B9C;
  result[13] = sub_100002BBC;
  result[14] = sub_100002CC0;
  result[15] = sub_100002CE0;
  result[16] = sub_100002D60;
  result[17] = sub_100002D88;
  result[18] = sub_100002DA8;
  result[19] = sub_100002DD4;
  result[20] = sub_100002DF4;
  result[21] = sub_100002E24;
  result[22] = sub_100002E54;
  result[23] = sub_100002EB4;
  result[24] = sub_100002ED4;
  return result;
}

uint64_t sub_1000028F0(void *a1)
{
  uint64_t v1 = a1[294];
  else {
    return 0LL;
  }
}

uint64_t sub_100002918(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002938(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002960(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002980(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_1000029A0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v5 = a2 + 16;
  uint64_t v6 = (*(_DWORD *)(a2 + 24) >> 8) & 2 | (*(_DWORD *)(a2 + 24) >> 5) & 5 | (*(_DWORD *)(a2 + 24) >> 7) & 8u;
  uint64_t v7 = *(void *)(a1 + 2352);
  if (a3)
  {
    if (v7)
    {
      int v8 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 504);
      if (v8) {
        return v8(*(void *)(a1 + 2360), v5, v6, 1LL, 0xFFFFFFFFLL);
      }
    }
  }

  else if (v7)
  {
    unsigned int v10 = *(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t))(v7 + 504);
    if (v10) {
      return v10(*(void *)(a1 + 2360), v5, v6, 0LL, 4294967294LL);
    }
  }

  return 0LL;
}

uint64_t sub_100002A18(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002A40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002A60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002A80(void *a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a2 + 24);
  uint64_t v3 = a1[2];
  if ((*(_DWORD *)(v3 + 72) || *(_DWORD *)(v3 + 484)) && *(_WORD *)(a2 + 70) != 2)
  {
    int v4 = 14;
  }

  else if ((v2 & 0x20) != 0)
  {
    int v4 = 15;
  }

  else
  {
    int v4 = 14;
  }

  uint64_t v5 = a1[294];
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = *(uint64_t (**)(void, uint64_t, uint64_t, void, void))(v5 + 504);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = (v2 >> 8) & 2 | (v2 >> 5) & 5 | (v2 >> 7) & 8;
  return v6(a1[295], a2 + 16, v7, v4 & v7, v7 | ~v4);
}

uint64_t sub_100002B04(void *a1, uint64_t a2, int a3)
{
  v9[0] = a2;
  LODWORD(v9[1]) = a3;
  if (a3)
  {
    uint64_t v3 = (int32x2_t *)a1[2];
    __int32 v4 = v3[9].i32[0];
    HIDWORD(v9[1]) = v3[60].i32[1];
    LODWORD(v9[2]) = v4;
    *(int32x2_t *)((char *)&v9[2] + 4) = vrev64_s32(v3[63]);
    __int32 v5 = v3[61].i32[0];
    LODWORD(v3) = v3[66].i32[1];
    HIDWORD(v9[3]) = v5;
    LODWORD(v9[4]) = (_DWORD)v3;
  }

  uint64_t v6 = a1[294];
  else {
    return 0LL;
  }
}

uint64_t sub_100002B7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002B9C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002BBC(void *a1)
{
  uint64_t v2 = a1[294];
  if (v2 && (uint64_t v3 = *(unsigned int (**)(void))(v2 + 520)) != 0LL && v3(a1[295]))
  {
    sub_100016E40(4LL, "Failed to set CTS protect in kernel driver", v4, v5, v6, v7, v8, v9, v30);
    uint64_t v10 = 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  int v11 = *(_DWORD **)(*a1 + 2152LL);
  if (v11)
  {
    if (*v11 == 1)
    {
      uint64_t v12 = a1[294];
      if (v12)
      {
        unint64_t v13 = *(unsigned int (**)(void, BOOL))(v12 + 536);
        if (v13)
        {
          if (v13(a1[295], *(_DWORD *)(*a1 + 2188LL) < 1))
          {
            sub_100016E40( 4LL,  "Failed to set Short Slot Time option in kernel driver",  v14,  v15,  v16,  v17,  v18,  v19,  v30);
            uint64_t v10 = 0xFFFFFFFFLL;
          }
        }
      }
    }
  }

  BOOL v20 = !*(_DWORD *)(*a1 + 2192LL) && *(_DWORD *)(a1[1] + 44LL) == 1;
  uint64_t v21 = a1[294];
  if (v21)
  {
    uint64_t v22 = *(unsigned int (**)(void, BOOL))(v21 + 528);
    if (v22)
    {
      if (v22(a1[295], v20))
      {
        sub_100016E40(4LL, "Could not set preamble for kernel driver", v23, v24, v25, v26, v27, v28, v30);
        return 0xFFFFFFFFLL;
      }
    }
  }

  return v10;
}

uint64_t sub_100002CC0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002CE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 2352);
  if (v2
    && (uint64_t v3 = *(uint64_t (**)(void, uint64_t, uint64_t, void, void, void, _BYTE *, _BYTE *))(v2 + 560)) != 0LL)
  {
    return v3(*(void *)(a1 + 2360), 1LL, a2, 0LL, 0LL, 0LL, v6, v5);
  }

  else
  {
    return 0xFFFFFFFFLL;
  }

uint64_t sub_100002D60(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002D88(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002DA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a2 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002DD4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002E24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002E54( uint64_t a1, uint64_t a2, __int16 a3, __int16 a4, uint64_t a5, uint64_t a6, unsigned __int16 a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 2352);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = *(uint64_t (**)(void, uint64_t *))(v8 + 456);
  if (!v9) {
    return 0LL;
  }
  int v14 = 0;
  uint64_t v11 = a2;
  __int16 v12 = a3;
  __int16 v13 = a4;
  uint64_t v15 = a5;
  uint64_t v16 = a6;
  uint64_t v17 = a7;
  uint64_t v18 = a8;
  return v9(*(void *)(a1 + 2360), &v11);
}

uint64_t sub_100002EB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002ED4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002EF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002F14(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002F34(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002F54(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002F74(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002F94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100002FB4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100002FF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_100003014(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  uint64_t v6 = *(void *)(a1 + 2352);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = *(uint64_t (**)(void, _DWORD *))(v6 + 480);
  if (!v7) {
    return 0LL;
  }
  v9[0] = a2;
  v9[1] = a3;
  v9[2] = a4;
  v9[3] = a5;
  v9[4] = a6;
  return v7(*(void *)(a1 + 2360), v9);
}

uint64_t sub_10000305C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000307C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000309C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_1000030BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_1000030DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_1000030FC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000311C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000313C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000315C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000317C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 1LL;
  }
}

uint64_t sub_10000319C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_1000031BC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_1000031DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

BOOL sub_100003204(uint64_t a1)
{
  uint64_t v1 = *(const char ***)(a1 + 2352);
  return v1 && strcmp(*v1, "none") == 0;
}

uint64_t sub_10000323C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000325C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2352);
  else {
    return 0LL;
  }
}

uint64_t sub_10000327C(uint64_t a1, char *__str, size_t __size)
{
  return sub_10000328C(a1, *(void *)(a1 + 40), __str, __size);
}

uint64_t sub_10000328C(int a1, uint64_t a2, char *__str, size_t __size)
{
  if (a2)
  {
    unsigned int v8 = snprintf( __str,  __size,  "%02x:%02x:%02x:%02x:%02x:%02x\n",  *(unsigned __int8 *)(a2 + 16),  *(unsigned __int8 *)(a2 + 17),  *(unsigned __int8 *)(a2 + 18),  *(unsigned __int8 *)(a2 + 19),  *(unsigned __int8 *)(a2 + 20),  *(unsigned __int8 *)(a2 + 21));
    uint64_t result = 0LL;
    if ((v8 & 0x80000000) == 0)
    {
      unsigned int v10 = v8;
      if (__size > v8)
      {
        int v11 = sub_100009A5C(*(void *)(a2 + 168), &__str[v8], __size - v8);
        uint64_t v12 = (v11 & ~(v11 >> 31)) + v10;
        int v13 = sub_100020B1C(a1, a2, &__str[v12], __size - v12);
        return v12 + (v13 & ~(v13 >> 31));
      }
    }
  }

  else
  {
    LODWORD(result) = snprintf(__str, __size, "FAIL\n");
    else {
      return result;
    }
  }

  return result;
}

uint64_t sub_10000337C(uint64_t a1, char *a2, char *a3, size_t a4)
{
  if (sub_100016198(a2, (uint64_t)v10))
  {
    LODWORD(result) = snprintf(a3, a4, "FAIL\n");
    else {
      return result;
    }
  }

  else
  {
    uint64_t v9 = sub_1000059B4(a1, (uint64_t)v10);
    return sub_10000328C(a1, v9, a3, a4);
  }

uint64_t sub_100003410(uint64_t a1, char *a2, char *a3, size_t a4)
{
  if (!sub_100016198(a2, (uint64_t)v10))
  {
    uint64_t v9 = (uint64_t *)sub_1000059B4(a1, (uint64_t)v10);
    if (v9) {
      return sub_10000328C(a1, *v9, a3, a4);
    }
  }

  LODWORD(result) = snprintf(a3, a4, "FAIL\n");
  else {
    return result;
  }
}

uint64_t sub_1000034A8( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2)
  {
    uint64_t v25 = "hostapd_notif_assoc: Skip event with no address";
LABEL_5:
    uint64_t v26 = 1LL;
LABEL_6:
    sub_100016E40(v26, v25, (uint64_t)a3, a4, a5, a6, a7, a8, v48);
    return 0xFFFFFFFFLL;
  }

  sub_1000172B0(a1, a2, 1LL, 2LL, "associated", a6, a7, a8, v48);
  sub_10000CD28(a3, a4, (uint64_t)v50, 0LL, v12, v13, v14, v15);
  if (v53)
  {
    uint64_t v22 = (unsigned __int8 *)(v53 - 2);
    unint64_t v23 = v56 + 2LL;
    uint64_t v24 = "STA included WPS IE in (Re)AssocReq";
  }

  else if (v52)
  {
    uint64_t v22 = (unsigned __int8 *)(v52 - 2);
    unint64_t v23 = v55 + 2LL;
    uint64_t v24 = "STA included RSN IE in (Re)AssocReq";
  }

  else if (v51)
  {
    uint64_t v22 = (unsigned __int8 *)(v51 - 2);
    unint64_t v23 = v54 + 2LL;
    uint64_t v24 = "STA included WPA IE in (Re)AssocReq";
  }

  else
  {
    unint64_t v23 = 0LL;
    uint64_t v22 = 0LL;
    uint64_t v24 = "STA did not include WPS/RSN/WPA IE in (Re)AssocReq";
  }

  sub_100016E40(1LL, v24, v16, v17, v18, v19, v20, v21, v49);
  uint64_t v28 = sub_1000059B4(a1, (uint64_t)a2);
  if (!v28)
  {
    uint64_t v28 = (uint64_t)sub_1000063B0(a1, (uint64_t)a2);
    if (!v28) {
      return 0xFFFFFFFFLL;
    }
  }

  unsigned int v29 = *(_DWORD *)(v28 + 24) & 0xFFFFCFFF;
  *(_DWORD *)(v28 + 24) = v29;
  uint64_t v30 = *(void *)(a1 + 16);
  if (!*(_DWORD *)(v30 + 484))
  {
    if (!*(_DWORD *)(v30 + 748)) {
      goto LABEL_42;
    }
    if (!v22 || v23 < 5 || *v22 != 221 || v22[1] < 4u || *(_DWORD *)(v22 + 2) != 82989056)
    {
      v29 |= 0x2000u;
      goto LABEL_42;
    }

LABEL_41:
    v29 |= 0x1000u;
    goto LABEL_42;
  }

  int v31 = *(_DWORD *)(v30 + 748);
  if (!v22 || !v23)
  {
    if (v31)
    {
      sub_100016E40( 1LL,  "STA did not include WPA/RSN IE in (Re)Association Request - possible WPS use",  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  v48);
      unsigned int v29 = *(_DWORD *)(v28 + 24) | 0x2000;
      goto LABEL_42;
    }

    uint64_t v25 = "No WPA/RSN IE from STA";
    goto LABEL_5;
  }

  if (v31 && *v22 == 221 && v22[1] >= 4u && *(_DWORD *)(v22 + 2) == 82989056) {
    goto LABEL_41;
  }
  uint64_t v32 = *(_WORD **)(v28 + 168);
  if (!v32)
  {
    uint64_t v32 = sub_100007F68(*(uint64_t **)(a1 + 2624), (int *)(v28 + 16));
    *(void *)(v28 + 168) = v32;
    if (!v32)
    {
      uint64_t v25 = "Failed to initialize WPA state machine";
      uint64_t v26 = 4LL;
      goto LABEL_6;
    }
  }

  uint64_t v33 = sub_10000C1C0(*(void *)(a1 + 2624), (uint64_t)v32, v22, v23, 0LL, 0LL, a7, a8);
  if ((_DWORD)v33)
  {
    int v40 = v33;
    sub_100016E40(1LL, "WPA/RSN information element rejected? (res %u)", v34, v35, v36, v37, v38, v39, v33);
    sub_100016EB0(1LL, "IE", v22, v23);
    else {
      uint64_t v41 = dword_10002AD9C[v40 - 2];
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 2536))(a1, v28 + 16, v41);
    sub_100005A04(a1, (unsigned __int16 *)v28, v42, v43, v44, v45, v46, v47);
    return 0xFFFFFFFFLL;
  }

  unsigned int v29 = *(_DWORD *)(v28 + 24);
LABEL_42:
  *(_DWORD *)(v28 + 24) = v29 | 3;
  sub_100009508(*(void *)(v28 + 168), 1);
  sub_1000049BC(a1, v28, (v29 >> 1) & 1);
  sub_100020AC8(*(void *)(v28 + 88), 1);
  return 0LL;
}

void sub_100003790( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = sub_1000059B4(a1, (uint64_t)a2);
  if (v10)
  {
    uint64_t v17 = v10;
    *(_DWORD *)(v10 + 24) &= 0xFFFFFFFC;
    sub_100017140( *(void *)(a1 + 2576),  2LL,  "AP-STA-DISCONNECTED %02x:%02x:%02x:%02x:%02x:%02x",  v12,  v13,  v14,  v15,  v16,  *(unsigned __int8 *)(v10 + 16));
    sub_100009508(*(void *)(v17 + 168), 2);
    *(_DWORD *)(v17 + 124) = 1;
    sub_100020AC8(*(void *)(v17 + 88), 0);
    sub_100005A04(a1, (unsigned __int16 *)v17, v18, v19, v20, v21, v22, v23);
  }

  else
  {
    sub_100016E40( 1LL,  "Disassociation notification for unknown STA %02x:%02x:%02x:%02x:%02x:%02x",  v11,  v12,  v13,  v14,  v15,  v16,  *a2);
  }

void sub_10000389C( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = (uint64_t)a1;
  if ((int)a2 <= 15)
  {
    switch((int)a2)
    {
      case 0:
        sub_1000034A8( (uint64_t)a1,  *(unsigned __int8 **)(a3 + 56),  *(unsigned __int8 **)a3,  *(void *)(a3 + 8),  a5,  a6,  a7,  a8);
        break;
      case 1:
      case 11:
        if (a3) {
          sub_100003790((uint64_t)a1, *(unsigned __int8 **)a3, a3, a4, a5, a6, a7, a8);
        }
        break;
      case 2:
        sub_1000069C0((uint64_t)a1, *(unsigned __int8 **)(a3 + 8), 1);
        break;
      case 3:
        uint64_t v21 = *(void (**)(void))(*a1 + 2224LL);
        if (v21) {
          v21();
        }
        break;
      default:
        goto LABEL_28;
    }

    return;
  }

  if ((int)a2 <= 24)
  {
    if ((_DWORD)a2 == 16) {
      return;
    }
    if ((_DWORD)a2 == 24)
    {
      uint64_t v10 = a1[343];
      if (v10)
      {
        uint64_t v11 = 0LL;
        uint64_t v12 = *(unsigned __int8 **)a3;
        uint64_t v13 = *(void *)(a3 + 8);
        uint64_t v14 = -1LL;
        uint64_t v15 = *(void *)(a3 + 16);
        do
        {
          if ((*(int (**)(void, unsigned __int8 *, uint64_t, uint64_t))(v10 + v11))( *(void *)(v10 + v11 + 8),  v12,  v13,  v15) > 0) {
            break;
          }
          v11 += 16LL;
          uint64_t v10 = *(void *)(v9 + 2744);
        }

        while (v10);
      }

      return;
    }

LABEL_28:
    sub_100016E40(1LL, "Unknown event %d", a3, a4, a5, a6, a7, a8, a2);
    return;
  }

  if ((_DWORD)a2 == 25)
  {
    uint64_t v22 = *(unsigned __int8 **)a3;
    if (!sub_1000059B4((uint64_t)a1, *(void *)a3))
    {
      sub_100016E40( 1LL,  "Data frame from unknown STA %02x:%02x:%02x:%02x:%02x:%02x - adding a new STA",  v23,  v24,  v25,  v26,  v27,  v28,  *v22);
      unsigned int v29 = sub_1000063B0(v9, (uint64_t)v22);
      if (v29) {
        sub_1000049BC(v9, (uint64_t)v29, 0);
      }
      else {
        sub_100016E40( 1LL,  "Failed to add STA entry for %02x:%02x:%02x:%02x:%02x:%02x",  v30,  v31,  v32,  v33,  v34,  v35,  *v22);
      }
    }
  }

  else
  {
    if ((_DWORD)a2 != 26) {
      goto LABEL_28;
    }
    uint64_t v16 = *(unsigned __int8 **)a3;
    uint64_t v17 = *(unsigned __int8 **)(a3 + 8);
    unint64_t v18 = *(void *)(a3 + 16);
    uint64_t v19 = *a1;
    if (*(void *)(*a1 + 48LL))
    {
      uint64_t v20 = 0LL;
      while (!sub_1000059B4(*(void *)(*(void *)(v19 + 56) + 8 * v20), (uint64_t)v16))
      {
      }

      uint64_t v9 = *(void *)(*(void *)(v19 + 56) + 8 * v20);
    }

    if (*(_BYTE *)(a1 + 344)
      || (*(unsigned int (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65))
    {
      if (*(_BYTE *)(a1 + 24))
      {
        uint64_t v21 = *(_DWORD *)(a1 + 144);
LABEL_40:
        if (v21)
        {
LABEL_41:
          *(_BYTE *)(a1 + 345) = 1;
          sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_KEY_TX entering state NO_KEY_TRANSMIT",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
        }

        *(_DWORD *)(a1 + 144) = 0;
        goto LABEL_43;
      }

      uint64_t v21 = *(_DWORD *)(a1 + 144);
      if (*(_DWORD *)(a1 + 28) != 2) {
        goto LABEL_40;
      }
      if (v21 == 1)
      {
        if (!*(_BYTE *)(a1 + 27) || !*(_BYTE *)(a1 + 26)) {
          goto LABEL_41;
        }
        if (*(_BYTE *)(*(void *)(a1 + 232) + 72LL)) {
          goto LABEL_101;
        }
      }

      else if (!v21 {
             && *(_BYTE *)(a1 + 27)
      }
             && *(_BYTE *)(*(void *)(a1 + 232) + 72LL)
             && *(_BYTE *)(a1 + 26)
             && (*(_BYTE *)(a1 + 224) & 4) == 0)
      {
LABEL_101:
        sub_10001D998(a1, a2, a3, a4, a5, a6, a7, a8);
      }
    }

LABEL_31:
    sub_10001FB00(v9, (uint64_t)v16, v17, v18, a5, a6, a7, a8, a9);
  }

uint64_t sub_100003B40(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 24);
  if (!v1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = **(void **)(a1 + 56);
  uint64_t v4 = v1(*(void *)(a1 + 32));
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = (uint64_t *)v4;
  if (*(void *)(a1 + 48))
  {
    unint64_t v13 = 0LL;
    do
      sub_100003D04(*(void *)(*(void *)(a1 + 56) + 8 * v13++));
    while (v13 < *(void *)(a1 + 48));
  }

  uint64_t v14 = *(void *)(v3 + 8);
  uint64_t v15 = *v12;
  *(void *)(v3 + 8) = v12;
  *(void *)(v3 + 16) = v15;
  *(void *)(a1 + 40) = v12;
  if (sub_100001FAC(v15, v5, v6, v7, v8, v9, v10, v11)) {
    sub_100016E40( 4LL,  "Failed to re-configure WPA PSK after reloading configuration",  v17,  v18,  v19,  v20,  v21,  v22,  v43);
  }
  uint64_t v23 = *(void *)(v3 + 2624);
  if (*(_DWORD *)(*(void *)(v3 + 16) + 484LL))
  {
    if (v23)
    {
      sub_10000BB08(v3, v16, v17, v18, v19, v20, v21, v22);
      sub_100009C78(*(void *)(v3 + 2624), &v44);
    }

    else
    {
      sub_10000B504(v3);
    }
  }

  else if (v23)
  {
    sub_100007D40(v23, v16, v17, v18, v19, v20, v21, v22);
    *(void *)(v3 + 2624) = 0LL;
    sub_100002EF4(v3);
    sub_100003DB4(*(void *)(v3 + 16), v3);
    sub_100002F14(v3);
  }

  if (*(_DWORD *)(*(void *)(v3 + 16) + 200LL))
  {
    if (sub_100002F54(v3)) {
      sub_100016E40( 4LL,  "%s: Could not set SSID for kernel driver",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)"hostapd_reload_config");
    }
  }

  (*(void (**)(uint64_t))(v3 + 2448))(v3);
  sub_100002374(v14);
  sub_100016E40(1LL, "Reconfigured interface %s", v37, v38, v39, v40, v41, v42, *(void *)(v3 + 16));
  return 0LL;
}

uint64_t sub_100003D04(uint64_t a1)
{
  uint64_t result = sub_100003204(a1);
  if (!(_DWORD)result && *(void *)(a1 + 2360))
  {
    sub_100016E40(1LL, "Flushing old station entries", v3, v4, v5, v6, v7, v8, v16);
    uint64_t result = sub_100016E40(1LL, "Deauthenticate all stations", v9, v10, v11, v12, v13, v14, v17);
    uint64_t v15 = *(const char ***)(a1 + 2352);
    if (v15)
    {
      uint64_t result = strcmp(*v15, "hostap");
      if ((_DWORD)result)
      {
        __int16 v19 = -1;
        int v18 = -1;
        return (*(uint64_t (**)(uint64_t, int *, uint64_t))(a1 + 2528))(a1, &v18, 2LL);
      }
    }
  }

  return result;
}

uint64_t sub_100003DB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 16);
  if (*(void *)(v4 + 336))
  {
    uint64_t v31 = *(void *)(v4 + 256 + 8LL * *(unsigned __int8 *)(v4 + 256) + 8);
  }

  if (*(void *)(v4 + 352))
  {
    unint64_t v11 = 0LL;
    do
    {
      uint64_t v12 = *(unsigned __int8 **)(*(void *)(v4 + 352) + 8 * v11);
      if (v12)
      {
        uint64_t v13 = sub_100002678(*(uint64_t **)(*(void *)(a2 + 16) + 720LL), v11);
        if (v13)
        {
          uint64_t v32 = *(void *)&v12[8 * *v12 + 8];
        }
      }

      ++v11;
    }

    while (v11 <= *(void *)(v4 + 360));
  }

  if (!*(void *)(*(void *)(a2 + 16) + 336LL))
  {
    uint64_t v20 = 0LL;
    while (1)
    {
      uint64_t v21 = *(void *)(a2 + 16);
      uint64_t v22 = v21 + 8 * v20;
      if (*(void *)(v22 + 264))
      {
        uint64_t v33 = *(void *)(v22 + 264);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, BOOL, void, void))(a2 + 2416))( a1,  a2,  1LL,  0LL,  v20,  v20 == *(unsigned __int8 *)(v21 + 256),  0LL,  0LL))
        {
          sub_100016E40(3LL, "Could not set WEP encryption.", v23, v24, v25, v26, v27, v28, v33);
          return 0xFFFFFFFFLL;
        }

        uint64_t v29 = *(void *)(a2 + 16);
        if (*(void *)(v29 + 8 * v20 + 264))
        {
        }
      }

      if (++v20 == 4) {
        return 0LL;
      }
    }
  }

  sub_100002EF4(a2);
  return 0LL;
}

uint64_t sub_100003F8C( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    sub_100016E40(4LL, "Interface initialization failed", a3, a4, a5, a6, a7, a8, v82);
    sub_1000266B8();
    return 0xFFFFFFFFLL;
  }

  uint64_t v9 = **(void **)(a1 + 56);
  sub_100016E40(1LL, "Completing interface initialization", a3, a4, a5, a6, a7, a8, v82);
  uint64_t v16 = *(void *)(v9 + 8);
  if (*(_BYTE *)(v16 + 37))
  {
    *(_DWORD *)(a1 + 2176) = -1;
    sub_100016E40(1LL, "Mode: %s  Channel: %d  Frequency: %d MHz", v10, v11, v12, v13, v14, v15, 0LL);
    if (sub_100003014( v9,  *(_DWORD *)(*(void *)(v9 + 8) + 40LL),  *(_DWORD *)(a1 + 2176),  *(unsigned __int8 *)(*(void *)(v9 + 8) + 37LL),  *(_DWORD *)(*(void *)(v9 + 8) + 344LL),  *(_DWORD *)(*(void *)(v9 + 8) + 348LL)))
    {
      uint64_t v23 = "Could not set channel for kernel driver";
      goto LABEL_75;
    }

    uint64_t v16 = *(void *)(v9 + 8);
  }

  if ((*(_DWORD *)(v16 + 28) & 0x80000000) == 0)
  {
    if (sub_10000305C(v9))
    {
      uint64_t v23 = "Could not set RTS threshold for kernel driver";
      goto LABEL_75;
    }

    uint64_t v16 = *(void *)(v9 + 8);
  }

  if ((*(_DWORD *)(v16 + 32) & 0x80000000) == 0 && sub_10000307C(v9))
  {
    uint64_t v23 = "Could not set fragmentation threshold for kernel driver";
    goto LABEL_75;
  }

  if (*(void *)(a1 + 48))
  {
    unint64_t v24 = 0LL;
    uint64_t v25 = v9 + 28;
    do
    {
      uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8 * v24);
      if (v24)
      {
        __int16 v26 = *(_WORD *)(v25 + 4);
        *(_DWORD *)(v9 + 28) = *(_DWORD *)v25;
        *(_WORD *)(v9 + memset(&v9[1], 0, 32) = v26;
        uint64_t v27 = (uint64_t *)(v9 + 16);
        uint64_t v84 = *(void *)(v9 + 16);
        uint64_t v85 = v25;
        if (sub_100001F4C(v84 + 736))
        {
          uint64_t v28 = *(void *)(v9 + 16);
          __int16 v29 = *(_WORD *)(v28 + 740);
          *(_DWORD *)(v9 + 28) = *(_DWORD *)(v28 + 736);
          *(_WORD *)(v9 + memset(&v9[1], 0, 32) = v29;
          if (!sub_100001EFC(v9 + 28, **(void **)(*(void *)v9 + 56LL) + 28LL))
          {
            uint64_t v83 = *v27;
            uint64_t v23 = "BSS '%s' may not have BSSID set to the MAC address of the radio";
LABEL_75:
            sub_100016E40(4LL, v23, v17, v18, v19, v20, v21, v22, v83);
            return 0xFFFFFFFFLL;
          }
        }

        else
        {
          while (1)
          {
            sub_1000163D4(v9 + 28, 6);
            v65 = *(void **)(v9 + 8);
            if (!v65[2]) {
              break;
            }
            unint64_t v63 = 0LL;
            uint64_t v64 = 736LL;
            while (sub_100001EFC(*v65 + v64, v9 + 28))
            {
              ++v63;
              v64 += 760LL;
              if (v63 >= v65[2]) {
                goto LABEL_19;
              }
            }
          }
        }

LABEL_19:
        *(_DWORD *)(v9 + 24) = 1;
        uint64_t v36 = v84;
        uint64_t v25 = v85;
        if (sub_100002F74(**(void **)(*(void *)v9 + 56LL)))
        {
          sub_100016E40( 4LL,  "Failed to add BSS (BSSID=%02x:%02x:%02x:%02x:%02x:%02x)",  v30,  v31,  v32,  v33,  v34,  v35,  *(unsigned __int8 *)(v9 + 28));
          return 0xFFFFFFFFLL;
        }
      }

      else
      {
        uint64_t v27 = (uint64_t *)(v9 + 16);
        uint64_t v36 = *(void *)(v9 + 16);
      }

      sub_100003D04(v9);
      sub_100002EF4(v9);
      uint64_t v37 = 0LL;
      uint64_t v38 = *(void *)(v9 + 16);
      do
      {
        uint64_t v83 = 0LL;
        if ((*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, BOOL, void, void))(v9 + 2416))( v38,  v9,  0LL,  0LL,  v37,  (_DWORD)v37 == 0,  0LL,  0LL))
        {
          sub_100016E40( 1LL,  "Failed to clear default encryption keys (ifname=%s keyidx=%d)",  v39,  v40,  v41,  v42,  v43,  v44,  v38);
        }

        uint64_t v37 = (v37 + 1);
      }

      while ((_DWORD)v37 != 4);
      uint64_t v45 = *v27;
      if (*(_DWORD *)(*v27 + 492))
      {
        uint64_t v46 = 4LL;
        do
        {
          uint64_t v83 = 0LL;
          if ((*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, void, void))(v9 + 2416))( v38,  v9,  0LL,  0LL,  v46,  0LL,  0LL,  0LL))
          {
            sub_100016E40( 1LL,  "Failed to clear default mgmt encryption keys (ifname=%s keyidx=%d)",  v47,  v48,  v49,  v50,  v51,  v52,  v38);
          }

          uint64_t v46 = (v46 + 1);
        }

        while ((_DWORD)v46 != 6);
        uint64_t v45 = *v27;
      }

      unsigned int v53 = sub_100002F34(v9);
      if ((v53 & 0x80000000) != 0)
      {
        uint64_t v23 = "Could not read SSID from system";
        goto LABEL_75;
      }

      if (!*(_DWORD *)(v36 + 200))
      {
        *(void *)(v36 + 192) = v53;
        memcpy((void *)(v36 + 152), __src, v53);
        *(_BYTE *)(v36 + 152 + *(void *)(v36 + 192)) = 0;
      }

      if (!sub_100003204(v9)) {
        sub_100016E40( 2LL,  "Using interface %s with hwaddr %02x:%02x:%02x:%02x:%02x:%02x and ssid '%s'",  v55,  v56,  v57,  v58,  v59,  v60,  *(void *)(v9 + 16));
      }
      if (sub_100001FAC(v36, v54, v55, v56, v57, v58, v59, v60))
      {
        uint64_t v23 = "WPA-PSK setup failed.";
        goto LABEL_75;
      }

      if (!dword_10003C010) {
        *(_DWORD *)(*(void *)(v36 + 136) + 52LL) = 1;
      }
      if (sub_100004C68())
      {
        uint64_t v23 = "ACL initialization failed.";
        goto LABEL_75;
      }

      if ((sub_100004C68() & 0x80000000) != 0) {
        return 0xFFFFFFFFLL;
      }
      if (sub_1000203B0(v9))
      {
        uint64_t v23 = "IEEE 802.1X initialization failed.";
        goto LABEL_75;
      }

      uint64_t v61 = *v27;
      if (*(_DWORD *)(*v27 + 484))
      {
        uint64_t v61 = *v27;
      }

      if (*(_DWORD *)(v61 + 420))
      {
        *(void *)(v9 + 2600) = 0LL;
        uint64_t v23 = "IEEE 802.11F (IAPP) initialization failed.";
        goto LABEL_75;
      }

      v62 = *(unsigned int (**)(uint64_t))(*(void *)v9 + 2232LL);
      if (v62 && v62(v9))
      {
        uint64_t v23 = "Failed to setup control interface";
        goto LABEL_75;
      }

      sub_100003204(v9);
      ++v24;
    }

    while (v24 < *(void *)(a1 + 48));
  }

  uint64_t v66 = 0LL;
  uint64_t v67 = 0LL;
  uint64_t v68 = **(void **)(a1 + 56);
  do
  {
    if (*(_DWORD *)(*(void *)(a1 + 40) + v67 + 112))
    {
    }

    v67 += 20LL;
    uint64_t v66 = (v66 + 1);
  }

  while (v67 != 160);
  if ((sub_1000031BC(v9) & 0x80000000) != 0)
  {
    sub_100016E40( 4LL,  "%s: Failed to commit driver configuration",  v75,  v76,  v77,  v78,  v79,  v80,  (uint64_t)"hostapd_setup_interface_complete");
    return 0xFFFFFFFFLL;
  }

  sub_100016E40( 1LL,  "%s: Setup of interface done.",  v75,  v76,  v77,  v78,  v79,  v80,  *(void *)(**(void **)(a1 + 56) + 16LL));
  return 0LL;
}

  uint64_t v18 = *(unsigned __int16 **)(a1 + 40);
  if (v18 == a2)
  {
    *(void *)(a1 + 40) = *(void *)a2;
  }

  else
  {
    while (v18)
    {
      uint64_t v19 = v18;
      uint64_t v18 = *(unsigned __int16 **)v18;
      if (v18 == a2)
      {
        *(void *)uint64_t v19 = *(void *)a2;
        goto LABEL_25;
      }
    }

    sub_100016E40( 1LL,  "Could not remove STA %02x:%02x:%02x:%02x:%02x:%02x from list.",  a3,  a4,  a5,  a6,  a7,  a8,  *((unsigned __int8 *)a2 + 16));
  }

  if ((v14 & 0x80) != 0)
  {
    *(_DWORD *)uint64_t v16 = 95162112;
    v16 += 4LL;
    ++v15;
    uint64_t v14 = a1[1];
    if ((v14 & 0x100) == 0)
    {
LABEL_21:
      if ((v14 & 0x400) == 0) {
        goto LABEL_22;
      }
LABEL_26:
      *(_DWORD *)uint64_t v16 = 145493760;
      v16 += 4LL;
      LOBYTE(v15) = v15 + 1;
      goto LABEL_27;
    }
  }

  else if ((v14 & 0x100) == 0)
  {
    goto LABEL_21;
  }

  *(_DWORD *)uint64_t v16 = 111939328;
  v16 += 4LL;
  ++v15;
  uint64_t v14 = a1[1];
  if ((v14 & 0x400) != 0) {
    goto LABEL_26;
  }
LABEL_22:
  if (!v15)
  {
    sub_100016E40(1LL, "Invalid key management type (%d).", a3, (uint64_t)a4, a5, a6, a7, a8, v14);
    return 0xFFFFFFFFLL;
  }

  if ((v15 & 1) != 0)
  {
    *(_DWORD *)uint64_t v17 = 15880192;
    v17 += 4;
    LOBYTE(v16) = v16 + 1;
  }

  else if (!v16)
  {
    sub_100016E40(1LL, "Invalid pairwise cipher (%d).", a3, a4, a5, a6, a7, a8, v15);
    return 0xFFFFFFFFLL;
  }

  v10[13] = 0;
  v10[12] = v16;
  uint64_t v18 = *(_DWORD *)(a1 + 76);
  if ((v18 & 1) != 0)
  {
    *(_DWORD *)(v17 + 2) = 32657408;
    uint64_t v19 = v17 + 6;
    if ((*(_BYTE *)(a1 + 76) & 2) == 0)
    {
      uint64_t v20 = 1;
      goto LABEL_31;
    }

    uint64_t v20 = 2;
  }

  else
  {
    if ((v18 & 2) == 0)
    {
      sub_100016E40(1LL, "Invalid key management type (%d).", a3, a4, a5, a6, a7, a8, *(unsigned int *)(a1 + 76));
      return 0xFFFFFFFFLL;
    }

    uint64_t v19 = v17 + 2;
    uint64_t v20 = 1;
  }

  *(_DWORD *)uint64_t v19 = 49434624;
  v19 += 4;
LABEL_31:
  v17[1] = 0;
  *uint64_t v17 = v20;
  uint64_t result = v19 - v10;
  v10[1] = (_BYTE)v19 - (_BYTE)v10 - 2;
  if ((((_DWORD)v19 - (_DWORD)v10) & 0x80000000) == 0)
  {
    v10 += result;
LABEL_7:
    free(*(void **)(a1 + 272));
    uint64_t v12 = malloc(v10 - __src);
    *(void *)(a1 + 272) = v12;
    if (v12)
    {
      memcpy(v12, __src, v10 - __src);
      uint64_t result = 0LL;
      *(void *)(a1 + 280) = v10 - __src;
      return result;
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t sub_100004560(void *a1)
{
  unint64_t v3 = a1[6];
  uint64_t v2 = (uint64_t *)a1[7];
  uint64_t v4 = (void *)*v2;
  uint64_t v5 = *v2;
  if (v3 >= 2)
  {
    for (uint64_t i = 1LL; i != v3; ++i)
    {
      *(void *)(v2[i] + 2352) = v4[294];
      *(void *)(v2[i] + 2360) = v4[295];
    }

    uint64_t v5 = *v2;
  }

  __int16 v45 = 0;
  int v44 = 0;
  uint64_t v7 = *(void *)(a1[5] + 16LL);
  if (sub_100003204(v5)) {
    goto LABEL_6;
  }
  unsigned int v21 = v7 - 1;
  if ((_DWORD)v7 == 1)
  {
    LODWORD(v22) = 0;
  }

  else
  {
    LODWORD(v22) = 0;
    do
    {
      LODWORD(v22) = v22 + 1;
      BOOL v23 = v21 >= 2;
      v21 >>= 1;
    }

    while (v23);
  }

  unint64_t v24 = (void *)a1[5];
  if (!v24[2])
  {
    unint64_t v30 = 0LL;
LABEL_39:
    char v36 = 1;
    goto LABEL_40;
  }

  uint64_t v25 = 0LL;
  int v26 = 0;
  unsigned int v27 = 0;
  do
  {
    if (sub_100001F4C(*v24 + 760 * v25 + 736))
    {
      uint64_t v28 = 0LL;
      unint64_t v24 = (void *)a1[5];
      uint64_t v29 = *v24 + 760LL * v27 + 736;
      do
      {
        *((_BYTE *)&v44 + v28) |= *(_BYTE *)(v5 + 28 + v28) ^ *(_BYTE *)(v29 + v28);
        ++v28;
      }

      while (v28 != 6);
    }

    else
    {
      if (v27) {
        ++v26;
      }
      unint64_t v24 = (void *)a1[5];
    }

    unint64_t v30 = v24[2];
    uint64_t v25 = ++v27;
  }

  while (v30 > v27);
  if (!v26) {
    goto LABEL_39;
  }
  uint64_t v31 = 0LL;
  unsigned int v32 = 40;
  while (1)
  {
    unsigned int v33 = *((unsigned __int8 *)&v44 + v31);
    if (*((_BYTE *)&v44 + v31)) {
      break;
    }
    ++v31;
    v32 -= 8;
    if (v31 == 6)
    {
      unsigned int v32 = 0;
      goto LABEL_33;
    }
  }

  do
  {
    unsigned int v34 = v33 >> 1;
    ++v32;
    BOOL v35 = v33 > 1;
    v33 >>= 1;
  }

  while (v35);
  *((_BYTE *)&v44 + v31) = v34;
LABEL_33:
  else {
    uint64_t v22 = v22;
  }
  if (v22 >= 0x29)
  {
    sub_100016E40(4LL, "Too many bits in the BSSID mask (%u)", v8, v9, v10, v11, v12, v13, v22);
    goto LABEL_57;
  }

  __int16 v45 = -1;
  int v44 = -1;
  uint64_t v40 = 5LL;
  if (v22 >= 8)
  {
    uint64_t v40 = 5 - (v22 >> 3);
    bzero((char *)&v44 - (v22 >> 3) + 6, v22 >> 3);
  }

  int v41 = v22 & 7;
  if ((v22 & 7) != 0)
  {
    char v42 = *((_BYTE *)&v44 + v40);
    do
    {
      v42 *= 2;
      --v41;
    }

    while (v41);
    char v36 = 0;
    *((_BYTE *)&v44 + v40) = v42;
  }

  else
  {
    char v36 = 0;
  }

LABEL_40:
  sub_100016E40( 1LL,  "BSS count %lu, BSSID mask %02x:%02x:%02x:%02x:%02x:%02x (%d bits)",  v8,  v9,  v10,  v11,  v12,  v13,  v30);
  int v37 = sub_10000317C(v5);
  if (v37)
  {
    if (v37 < 0)
    {
      sub_100016E40( 4LL,  "Driver did not accept BSSID mask %02x:%02x:%02x:%02x:%02x:%02x for start address %02x:%02x:%02x:%02x:%02x:%02x.",  v8,  v9,  v10,  v11,  v12,  v13,  v44);
      goto LABEL_57;
    }

    if ((v36 & 1) == 0)
    {
      uint64_t v38 = 0LL;
      while ((*(unsigned __int8 *)(v5 + 28 + v38) & ~*((unsigned __int8 *)&v44 + v38)) == 0)
      {
        if (++v38 == 6) {
          goto LABEL_6;
        }
      }

      sub_100016E40( 4LL,  "Invalid BSSID mask %02x:%02x:%02x:%02x:%02x:%02x for start address %02x:%02x:%02x:%02x:%02x:%02x.",  v8,  v9,  v10,  v11,  v12,  v13,  v44);
      uint64_t v39 = "Start address must be the first address in the block (i.e., addr AND mask == addr).";
      goto LABEL_56;
    }
  }

          if ((v20 & 8) != 0)
          {
            uint64_t v29 = 5304834;
          }

          else if ((v20 & 4) != 0)
          {
            uint64_t v29 = 5304837;
          }

          else if ((v20 & 2) != 0)
          {
            uint64_t v29 = 5304833;
          }

          else
          {
            uint64_t v29 = 5304832;
            if ((v20 & 1) == 0) {
              uint64_t v29 = 5304834;
            }
          }

          goto LABEL_59;
        }

        if ((_DWORD)a4 - 15 == (_DWORD)v24)
        {
          uint64_t v16 = -7;
          goto LABEL_148;
        }
      }
    }

    uint64_t v16 = 0;
LABEL_148:
    LOBYTE(v28) = 1;
    goto LABEL_149;
  }

  uint64_t v15 = 1027076;
  uint64_t v16 = sub_10000D570((uint64_t)a3, a4, (uint64_t)&v64, a4, a5, a6, a7, a8);
  if ((v66 & 0x400) != 0)
  {
    uint64_t v17 = 1027080;
  }

  else if ((v66 & 0x80) != 0)
  {
    uint64_t v17 = 1027077;
  }

  else if ((v66 & 0x100) != 0)
  {
    uint64_t v17 = 1027078;
  }

  else if ((v66 & 3) == 2)
  {
    uint64_t v17 = 1027074;
  }

  else
  {
    uint64_t v17 = 1027073;
  }

  *(_DWORD *)(a1 + 12) = v17;
  unint64_t v30 = 1027076;
  if ((v65 & 0x10) == 0)
  {
    if ((v65 & 8) != 0)
    {
      unint64_t v30 = 1027074;
    }

    else if ((v65 & 4) != 0)
    {
      unint64_t v30 = 1027077;
    }

    else if ((v65 & 2) != 0)
    {
      unint64_t v30 = 1027073;
    }

    else
    {
      unint64_t v30 = 1027072;
      if ((v65 & 1) == 0) {
        unint64_t v30 = 1027076;
      }
    }
  }

  *(_DWORD *)(a1 + 16) = v30;
  if ((v65 & 0x1000000000LL) == 0)
  {
    if ((v65 & 0x800000000LL) != 0)
    {
      uint64_t v15 = 1027074;
      goto LABEL_79;
    }

    if ((v65 & 0x400000000LL) == 0)
    {
      if ((v65 & 0x200000000LL) != 0)
      {
        uint64_t v15 = 1027073;
      }

      else if ((v65 & 0x100000000LL) != 0)
      {
        uint64_t v15 = 1027072;
      }

      else
      {
        uint64_t v15 = 1027076;
      }

      goto LABEL_79;
    }

    int v26 = v10;
    uint64_t v18 = "Invalid key management type (%d).";
    goto LABEL_16;
  }

  if ((_DWORD)v10 == 128)
  {
    uint64_t v22 = 5;
    goto LABEL_45;
  }

  if ((_DWORD)v10 == 256)
  {
    uint64_t v22 = 6;
    goto LABEL_45;
  }

  if ((_DWORD)v10 != 1024) {
    goto LABEL_40;
  }
  uint64_t v22 = 8;
LABEL_45:
  *(_WORD *)(a2 + 16) = 3840;
  *(_BYTE *)(a2 + 18) = -84;
  *(_BYTE *)(a2 + 19) = v22;
  BOOL v23 = *(_DWORD *)(a1 + 672);
  if (v23 == 2) {
    unint64_t v24 = -64;
  }
  else {
    unint64_t v24 = (v23 != 0) << 7;
  }
  *(_BYTE *)(a2 + 21) = 0;
  *(_BYTE *)(a2 + 20) = v24;
  if (*(void *)(a1 + 440))
  {
    *(_WORD *)(a2 + 22) = 1;
    *(_OWORD *)(a2 + 24) = *(_OWORD *)(*(void *)(a1 + 440) + 8LL);
    uint64_t v25 = (_WORD *)(a2 + 40);
  }

  else
  {
    uint64_t v25 = (_WORD *)(a2 + 22);
  }

  if (v15 == 32)
  {
    if (!*(void *)(a1 + 440)) {
      *v25++ = 0;
    }
    *(_DWORD *)uint64_t v25 = 111939328;
    LODWORD(v25) = (_DWORD)v25 + 4;
  }

  uint64_t result = ((_DWORD)v25 - a2);
  *(_BYTE *)(a2 + 1) = (_BYTE)v25 - a2 - 2;
  return result;
}

LABEL_6:
  if (*(_BYTE *)(v4[1] + 88LL) && *(_BYTE *)(v4[1] + 89LL) && (sub_1000030DC((uint64_t)v4) & 0x80000000) != 0)
  {
    uint64_t v39 = "Failed to set country code";
LABEL_56:
    sub_100016E40(4LL, v39, v8, v9, v10, v11, v12, v13, v43);
    goto LABEL_57;
  }

  uint64_t result = sub_100003F8C((uint64_t)a1, 0, v8, v9, v10, v11, v12, v13);
  if ((_DWORD)result)
  {
LABEL_57:
    sub_100016E40( 4LL,  "%s: Unable to setup interface.",  v15,  v16,  v17,  v18,  v19,  v20,  *(void *)(*(void *)a1[7] + 16LL));
    return 0xFFFFFFFFLL;
  }

  return result;
}

  sub_10000D238(a2, a3, (char *)a6, a7, a8);
  if (!v28) {
    goto LABEL_9;
  }
  sub_100016E40(4LL, "WPA: Failed to generate EAPOL-Key version %d MIC", v22, v23, v24, v25, v26, v27, a3);
LABEL_10:
  free(a6);
}

          memmove(v15, (const void *)(v12 + 8 * v14), (0x700000000LL - (v11 << 32)) >> 29);
          uint64_t v12 = *(void *)(v10 + 272);
          *(void *)(v12 + 56) = 0LL;
          if (!v13) {
            return sub_100016EB0(0LL, "EAP: new list of configured methods", (unsigned __int8 *)v12, 64LL);
          }
        }

        while (1)
        {
          uint64_t v19 = *v17++;
          if (v16 == v19) {
            break;
          }
          if (!--v18) {
            goto LABEL_6;
          }
        }

        uint64_t v13 = v11++ < 7;
      }

      while (v14 != 8);
    }

    return sub_100016EB0(0LL, "EAP: new list of configured methods", (unsigned __int8 *)v12, 64LL);
  }

  return result;
}

void *sub_100004958(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100016B98(0xAE8uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    sub_1000027F0(v6 + 296);
    v7[321] = sub_1000049BC;
    v7[1] = a2;
    v7[2] = a3;
    *uint64_t v7 = a1;
    v7[294] = *(void *)(a2 + 72);
  }

  return v7;
}

void sub_1000049BC(uint64_t a1, uint64_t a2, int a3)
{
  if (*(_DWORD *)(a1 + 2660))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 2528))(a1, a2 + 16, 14LL);
  }

  else
  {
    sub_100006C1C((void **)a1, a2 + 16);
    sub_100020154(a1, a2, v6, v7, v8, v9, v10, v11, v18);
    if (a3)
    {
      if (*(_WORD *)(a2 + 70) != 2 && (*(_BYTE *)(a2 + 25) & 0x30) == 0) {
        sub_100009508(*(void *)(a2 + 168), 4);
      }
    }

    else
    {
      sub_100007FAC(*(void *)(a1 + 2624), *(void *)(a2 + 168), v12, v13, v14, v15, v16, v17);
    }
  }

void sub_100004A74( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && *(void *)(a1 + 48))
  {
    unint64_t v9 = 0LL;
    do
    {
      uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8 * v9);
      sub_100006284(v10, a2, a3, a4, a5, a6, a7, a8);
      sub_100003D04(v10);
      uint64_t v18 = *(void (**)(uint64_t))(*(void *)v10 + 2240LL);
      if (v18) {
        v18(v10);
      }
      *(void *)(v10 + 2600) = 0LL;
      sub_10000BB80(v10, v11, v12, v13, v14, v15, v16, v17);
      sub_100004C70(v10);
      nullsub_2(v10);
      if (*(_DWORD *)(v10 + 24))
      {
      }

      free(*(void **)(v10 + 2744));
      *(void *)(v10 + 2744) = 0LL;
      ++v9;
    }

    while (v9 < *(void *)(a1 + 48));
  }

void sub_100004B4C(uint64_t a1)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v2 = 0LL;
    do
      free(*(void **)(*(void *)(a1 + 56) + 8 * v2++));
    while (v2 < *(void *)(a1 + 48));
  }

  *(void *)(a1 + 2136) = 0LL;
  free(*(void **)(a1 + 2168));
  *(void *)(a1 + 2168) = 0LL;
  sub_100002374(*(void *)(a1 + 40));
  *(void *)(a1 + 40) = 0LL;
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 56));
  free((void *)a1);
}

uint64_t sub_100004BC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, _DWORD *a6, _DWORD *a7)
{
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (sub_100002598( *(void *)(*(void *)(a1 + 16) + 448LL),  *(_DWORD *)(*(void *)(a1 + 16) + 456LL),  a2,  a7)) {
    return 1LL;
  }
  if (sub_100002598( *(void *)(*(void *)(a1 + 16) + 464LL),  *(_DWORD *)(*(void *)(a1 + 16) + 472LL),  a2,  a7)) {
    return 0LL;
  }
  uint64_t v11 = *(int *)(*(void *)(a1 + 16) + 444LL);
  return dword_10002ADB8[v11];
}

uint64_t sub_100004C68()
{
  return 0LL;
}

void sub_100004C70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 2616);
  if (v1)
  {
    do
    {
      uint64_t v2 = *(void *)(v1 + 32);
      free(*(void **)(v1 + 16));
      free((void *)v1);
      uint64_t v1 = v2;
    }

    while (v2);
  }

uint64_t sub_100004CAC(uint64_t *a1, uint64_t a2)
{
  if (*(_DWORD *)(a1[1] + 344))
  {
    *(_WORD *)a2 = 6701;
    *(_WORD *)(a2 + 26) = 0;
    *(void *)(a2 + 18) = 0LL;
    *(void *)(a2 + 10) = 0LL;
    *(void *)(a2 + 2) = 0LL;
    uint64_t v2 = *a1;
    *(_WORD *)(a2 + 2) = *(_WORD *)(a1[1] + 340);
    uint64_t v3 = *(void *)(v2 + 2152);
    *(_BYTE *)(a2 + 4) = *(_BYTE *)(v3 + 50);
    *(_OWORD *)(a2 + 5) = *(_OWORD *)(v3 + 34);
    a2 += 28LL;
  }

  return a2;
}

uint64_t sub_100004CFC(uint64_t *a1, uint64_t a2)
{
  if (*(_DWORD *)(a1[1] + 344))
  {
    *(_WORD *)a2 = 5693;
    *(void *)(a2 + 16) = 0LL;
    *(void *)(a2 + 10) = 0LL;
    *(void *)(a2 + 2) = 0LL;
    uint64_t v3 = *a1;
    uint64_t v2 = a1[1];
    *(_BYTE *)(a2 + 2) = *(_BYTE *)(v2 + 37);
    *(_WORD *)(a2 + 4) = *(_WORD *)(v3 + 2216);
    int v4 = *(_DWORD *)(v2 + 348);
    if (v4 == 1)
    {
      char v5 = 5;
    }

    else
    {
      if (v4 != -1)
      {
LABEL_7:
        a2 += 24LL;
        return a2;
      }

      char v5 = 7;
    }

    *(_BYTE *)(a2 + 3) |= v5;
    goto LABEL_7;
  }

  return a2;
}

uint64_t sub_100004D68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  if (!*(_DWORD *)(v8 + 344) || *(_DWORD *)(v8 + 336)) {
    return 0LL;
  }
  sub_100016E40(1LL, "%s current operation mode=0x%X", a3, a4, a5, a6, a7, a8, (uint64_t)"hostapd_ht_operation_update");
  __int16 v17 = *(_WORD *)(a1 + 2216);
  int v18 = *(_DWORD *)(a1 + 2200);
  if ((v17 & 4) != 0)
  {
    if (!v18)
    {
      v17 &= ~4u;
      goto LABEL_10;
    }

LABEL_8:
    uint64_t v9 = 0LL;
    goto LABEL_11;
  }

  if (!v18) {
    goto LABEL_8;
  }
  v17 |= 4u;
LABEL_10:
  *(_WORD *)(a1 + 2216) = v17;
  uint64_t v9 = 1LL;
LABEL_11:
  int v19 = *(_DWORD *)(a1 + 2204);
  if ((v17 & 0x10) != 0)
  {
    if (v19) {
      goto LABEL_24;
    }
    if (!*(_DWORD *)(a1 + 2212))
    {
      v17 &= ~0x10u;
LABEL_19:
      *(_WORD *)(a1 + 2216) = v17;
      uint64_t v9 = (v9 + 1);
    }
  }

  else
  {
    if (v19)
    {
      v17 |= 0x10u;
      *(_WORD *)(a1 + 2216) = v17;
      uint64_t v9 = (v9 + 1);
LABEL_24:
      int v20 = 3;
      goto LABEL_25;
    }

    if (*(_DWORD *)(a1 + 2212))
    {
      v17 |= 0x10u;
      goto LABEL_19;
    }
  }

  if ((v17 & 4) != 0) {
    goto LABEL_24;
  }
  if ((*(_WORD *)(*(void *)(a1 + 40) + 340LL) & 2) != 0 && *(_DWORD *)(a1 + 2208)) {
    int v20 = 2;
  }
  else {
    int v20 = *(_DWORD *)(a1 + 2212) != 0;
  }
LABEL_25:
  if (v20 != (v17 & 3))
  {
    *(_WORD *)(a1 + 2216) = v17 & 0xFFFC | v20;
    uint64_t v9 = (v9 + 1);
  }

  sub_100016E40( 1LL,  "%s new operation mode=0x%X changes=%d",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"hostapd_ht_operation_update");
  return v9;
}

    uint64_t v7 = 3LL;
    goto LABEL_12;
  }

  if (v6 == 32 || v6 == 64) {
    goto LABEL_8;
  }
LABEL_9:
  if (*(_DWORD *)(a1 + 652) == 8) {
    uint64_t v7 = 1LL;
  }
  else {
    uint64_t v7 = 2LL;
  }
LABEL_12:
  if (((*(uint64_t (**)(void, unsigned __int8 *))(*(void *)(a1 + 496) + 64LL))( **(void **)(a1 + 496),  v29) & 0x80000000) != 0)
  {
    sub_100016E40(3LL, "Failed to read BSSID for EAPOL-Key request", v8, v9, v10, v11, v12, v13, v28);
  }

  else
  {
    uint64_t v14 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, uint64_t *, uint64_t *))(*(void *)(a1 + 496)
                                                                                            + 96LL))( **(void **)(a1 + 496),  3LL,  0LL,  95LL,  &v31,  &v30);
    if (v14)
    {
      uint64_t v15 = (unsigned __int8 *)v14;
      if (*(_DWORD *)(a1 + 648) == 2) {
        uint64_t v16 = 2;
      }
      else {
        uint64_t v16 = -2;
      }
      __int16 v17 = v30;
      *(_BYTE *)unint64_t v30 = v16;
      if (*(_DWORD *)(a1 + 168)) {
        int v18 = 2304;
      }
      else {
        int v18 = 2048;
      }
      int v19 = v18 | v7;
      if ((_DWORD)a2) {
        v19 |= 0x400u;
      }
      if (a3) {
        int v20 = v19 | 8;
      }
      else {
        int v20 = v19;
      }
      *(_BYTE *)(v17 + 1) = HIBYTE(v20);
      *(_BYTE *)(v30 + 2) = v20;
      *(_BYTE *)(v30 + 3) = 0;
      *(_BYTE *)(v30 + 4) = 0;
      *(void *)(v30 + 5) = *(void *)(a1 + 256);
      sub_1000163D4(a1 + 256, 8);
      *(_WORD *)(v30 + 93) = 0;
      sub_100016E40( 2LL,  "WPA: Sending EAPOL-Key Request (error=%d pairwise=%d ptk_set=%d len=%lu)",  v21,  v22,  v23,  v24,  v25,  v26,  a2);
      if ((v20 & 0x100) != 0) {
        unsigned int v27 = (_DWORD *)(v30 + 77);
      }
      else {
        unsigned int v27 = 0LL;
      }
      sub_100012570(a1, (unsigned int *)(a1 + 40), v7, v29, 34958LL, v15, v31, v27);
    }
  }

  int v41 = *(_DWORD *)(a1 + 660);
  if (v41 != 1 && v41 != 128 && v41 != 32 || !*(void *)(a1 + 424))
  {
LABEL_24:
    if (!v40) {
      goto LABEL_30;
    }
    goto LABEL_25;
  }

  sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  3LL,  "WPA: Failed to get master session key from EAPOL state machines",  v27,  v28,  v29,  v30,  v31,  v66);
  sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  3LL,  "WPA: Key handshake aborted",  v42,  v43,  v44,  v45,  v46,  v67);
  if (*(void *)(a1 + 440))
  {
    sub_100016E40(1LL, "RSN: Cancelled PMKSA caching attempt", v26, v27, v28, v29, v30, v31, v66);
    *(void *)(a1 + 440) = 0LL;
  }

  else if (v19)
  {
    goto LABEL_46;
  }

    if (*(_BYTE *)(a1 + 344)
      || (*(unsigned int (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65))
    {
      if (*(_DWORD *)(a1 + 28) != 2 || *(_BYTE *)(a1 + 24) || *(_BYTE *)(a1 + 12))
      {
        if (*(_DWORD *)(a1 + 104) != 6)
        {
          *(_BYTE *)(a1 + 345) = 1;
          sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state INITIALIZE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
        }

        *(_DWORD *)(a1 + 104) = 6;
        (*(void (**)(void, void))(*(void *)(a1 + 352) + 184LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360));
        *(_BYTE *)(*(void *)(a1 + 232) + 37LL) = 0;
        *(_BYTE *)(a1 + 12) = 0;
      }

      else
      {
        switch(*(_DWORD *)(a1 + 104))
        {
          case 0:
          case 7:
            if (*(_BYTE *)(a1 + 23))
            {
              sub_10001D580(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            else
            {
              uint64_t v49 = *(void *)(a1 + 232);
              if (*(_BYTE *)(v49 + 36)) {
                goto LABEL_148;
              }
              if (*(_BYTE *)(v49 + 40)) {
                goto LABEL_158;
              }
            }

            break;
          case 1:
            int v44 = *(_BYTE **)(a1 + 232);
            if (v44[37])
            {
              *(_BYTE *)(a1 + 345) = 1;
              sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state IGNORE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
              *(_DWORD *)(a1 + 104) = 7;
              int v44 = *(_BYTE **)(a1 + 232);
              v44[37] = 0;
            }

            if (v44[36])
            {
              ++*(_DWORD *)(a1 + 116);
              goto LABEL_148;
            }

            if (*(_DWORD *)a1)
            {
              if (v44[39])
              {
                ++*(_DWORD *)(a1 + 128);
                goto LABEL_152;
              }

              if (v44[38])
              {
                ++*(_DWORD *)(a1 + 124);
                goto LABEL_170;
              }
            }

            else
            {
LABEL_158:
              sub_10001D68C(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            break;
          case 2:
          case 3:
          case 4:
          case 6:
            sub_10001D514(a1, a2, a3, a4, a5, a6, a7, a8);
            break;
          case 5:
            __int16 v45 = *(_BYTE **)(a1 + 232);
            if (v45[39] && *(_BYTE *)(a1 + 20))
            {
LABEL_152:
              sub_10001D6F8(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            else if (v45[36] && *(_BYTE *)(a1 + 20))
            {
LABEL_148:
              sub_10001D608(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            else if (v45[38] && *(_BYTE *)(a1 + 20))
            {
LABEL_170:
              sub_10001D76C(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            break;
          default:
            break;
        }
      }
    }

    if (*(_BYTE *)(a1 + 344)
      || (*(unsigned int (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65))
    {
      if (*(_DWORD *)(a1 + 28) != 2 || *(_BYTE *)(a1 + 24) || *(_DWORD *)(a1 + 16) == 2 || !*(_BYTE *)(a1 + 140))
      {
        int v19 = a1;
        int v20 = 1;
      }

      else
      {
        int v18 = *(_DWORD *)(a1 + 132);
        if (v18 != 1)
        {
          if (!v18 && !*(_DWORD *)(a1 + 8))
          {
            *(_BYTE *)(a1 + 345) = 1;
            sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x REAUTH_TIMER entering state REAUTHENTICATE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
            *(_DWORD *)(a1 + 1memset(&v9[1], 0, 32) = 1;
            *(_BYTE *)(a1 + 33) = 1;
            (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 352) + 200LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  1LL);
          }

          goto LABEL_28;
        }

        int v19 = a1;
        int v20 = 0;
      }

      sub_10001D920(v19, v20, a3, a4, a5, a6, a7, a8);
    }

uint64_t sub_100004EB4(uint64_t a1, __int128 *a2, unint64_t a3)
{
  if (a2 && a3 > 0x19)
  {
    char v5 = *(_OWORD **)(a1 + 208);
    if (v5 || (char v5 = sub_100016B98(0x1AuLL), (*(void *)(a1 + 208) = v5) != 0LL))
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 24) |= 0x800u;
      __int128 v7 = *a2;
      *(_OWORD *)((char *)v5 + 10) = *(__int128 *)((char *)a2 + 10);
      *char v5 = v7;
    }

    else
    {
      return 1LL;
    }
  }

  else
  {
    *(_DWORD *)(a1 + 24) &= ~0x800u;
    free(*(void **)(a1 + 208));
    uint64_t result = 0LL;
    *(void *)(a1 + 208) = 0LL;
  }

  return result;
}

uint64_t sub_100004F44( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_BYTE *)(a2 + 25) & 8) != 0 && (uint64_t v10 = *(__int16 **)(a2 + 208)) != 0LL)
  {
    __int16 v11 = *v10;
    sub_100016E40( 1LL,  "HT: STA %02x:%02x:%02x:%02x:%02x:%02x HT Capabilities Info: 0x%04x",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
    if ((v11 & 0x10) == 0)
    {
      if ((*(_BYTE *)(a2 + 68) & 8) == 0)
      {
        *(_BYTE *)(a2 + 68) |= 8u;
        ++*(_DWORD *)(*a1 + 2200);
      }

      sub_100016E40( 1LL,  "%s STA %02x:%02x:%02x:%02x:%02x:%02x - no greenfield, num of non-gf stations %d",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"update_sta_ht");
    }

    if ((v11 & 2) == 0)
    {
      if ((*(_BYTE *)(a2 + 68) & 0x20) == 0)
      {
        *(_BYTE *)(a2 + 68) |= 0x20u;
        ++*(_DWORD *)(*a1 + 2208);
      }

      sub_100016E40( 1LL,  "%s STA %02x:%02x:%02x:%02x:%02x:%02x - 20 MHz HT, num of 20MHz HT STAs %d",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"update_sta_ht");
    }
  }

  else
  {
    if ((*(_BYTE *)(a2 + 68) & 0x10) == 0)
    {
      *(_BYTE *)(a2 + 68) |= 0x10u;
      ++*(_DWORD *)(*a1 + 2204);
    }

    if (*(_DWORD *)(a1[1] + 344)) {
      sub_100016E40( 1LL,  "%s STA %02x:%02x:%02x:%02x:%02x:%02x - no HT, num of non-HT stations %d",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"update_sta_no_ht");
    }
  }

  return sub_100004D68(*a1, a2, a3, a4, a5, a6, a7, a8);
}

__n128 sub_10000510C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2)
  {
    __n128 result = *(__n128 *)(a2 + 10);
    *(_OWORD *)a3 = *(_OWORD *)a2;
    *(__n128 *)(a3 + 10) = result;
    *(_WORD *)a3 = *(_WORD *)(*(void *)(a1 + 8) + 340LL) & (*(_WORD *)a3 | 0x30C);
  }

  return result;
}

uint64_t sub_100005140( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result && a2)
  {
    uint64_t v9 = result;
    if (*(void *)(result + 96))
    {
      free(*(void **)(a2 + 264));
      size_t v10 = *(void *)(v9 + 104);
      __int16 v11 = (unsigned __int8 *)malloc(v10);
      uint64_t v12 = v11;
      *(void *)(a2 + 264) = v11;
      if (v11)
      {
        *(void *)(a2 + 272) = v10;
        memcpy(v11, *(const void **)(v9 + 96), v10);
      }

      else
      {
        size_t v10 = *(void *)(a2 + 272);
      }

      __n128 result = sub_100016F80(1LL, "STA identity from PMKSA", v12, v10);
    }

    if (*(void *)(a2 + 288)) {
      __n128 result = sub_100016E40( 1LL,  "Copied %lu Class attribute(s) from PMKSA",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 296));
    }
    *(_BYTE *)(a2 + 280) = *(_BYTE *)(v9 + 128);
    *(_DWORD *)(*(void *)(a2 + 360) + 200LL) = *(_DWORD *)(v9 + 132);
  }

  return result;
}

uint64_t sub_100005208( uint64_t a1, void *a2, size_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, int a9)
{
  if (a3 > 0x20) {
    return 0LL;
  }
  int v18 = (char *)sub_100016B98(0x90uLL);
  uint64_t v9 = (uint64_t)v18;
  if (v18)
  {
    memcpy(v18 + 32, a2, a3);
    *(void *)(v9 + 64) = a3;
    int v19 = (_OWORD *)(v9 + 16);
    if (a4)
    {
      _OWORD *v19 = *a4;
    }

    else
    {
      BOOL v22 = a9 == 128 || a9 == 1024 || a9 == 256;
      sub_10000D9CC((char *)a2, a3, a5, a6, v19, v22);
    }

    sub_100016734(v37);
    if (a7 <= 0) {
      uint64_t v23 = 43200LL;
    }
    else {
      uint64_t v23 = a7;
    }
    *(void *)(v9 + 72) = v37[0] + v23;
    *(_DWORD *)(v9 + 80) = a9;
    __int16 v24 = *(_WORD *)(a6 + 4);
    *(_DWORD *)(v9 + 84) = *(_DWORD *)a6;
    *(_WORD *)(v9 + 88) = v24;
    if (a8)
    {
      uint64_t v25 = *(const void **)(a8 + 264);
      if (v25)
      {
        size_t v26 = *(void *)(a8 + 272);
        unsigned int v27 = malloc(v26);
        *(void *)(v9 + 96) = v27;
        if (v27)
        {
          *(void *)(v9 + 104) = v26;
          memcpy(v27, v25, v26);
        }
      }

      *(_BYTE *)(v9 + 128) = *(_BYTE *)(a8 + 280);
      *(_DWORD *)(v9 + 1memset(&v9[1], 0, 32) = *(_DWORD *)(*(void *)(a8 + 360) + 200LL);
    }

    uint64_t v28 = sub_1000053DC(a1, a6, 0LL);
    if (v28) {
      sub_100005448(a1, v28);
    }
    if (*(int *)(a1 + 1032) >= 1024)
    {
      uint64_t v35 = *(void *)(a1 + 1024);
      if (v35)
      {
        sub_100016E40( 1LL,  "RSN: removed the oldest PMKSA cache entry (for %02x:%02x:%02x:%02x:%02x:%02x) to make room for new one",  v29,  v30,  v31,  v32,  v33,  v34,  *(unsigned __int8 *)(v35 + 84));
        sub_100005448(a1, *(void *)(a1 + 1024));
      }
    }

    sub_10000550C(a1, v9, v29, v30, v31, v32, v33, v34);
  }

  return v9;
}

uint64_t sub_1000053DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    uint64_t v3 = (uint64_t *)(a1 + 8LL * (*(_BYTE *)a3 & 0x7F));
  }
  else {
    uint64_t v3 = (uint64_t *)(a1 + 1024);
  }
  while (1)
  {
    uint64_t result = *v3;
    if (!*v3) {
      break;
    }
    if (!a2
      || (*(_DWORD *)(result + 84) == *(_DWORD *)a2
        ? (BOOL v5 = *(unsigned __int16 *)(result + 88) == *(unsigned __int16 *)(a2 + 4))
        : (BOOL v5 = 0),
          v5))
    {
      if (!a3) {
        break;
      }
      if (*(void *)(result + 16) == *(void *)a3 && *(void *)(result + 24) == *(void *)(a3 + 8)) {
        break;
      }
    }

    uint64_t v3 = (uint64_t *)(result + 8);
    if (!a3) {
      uint64_t v3 = (uint64_t *)result;
    }
  }

  return result;
}

void sub_100005448(uint64_t a1, uint64_t a2)
{
  int v4 = (uint64_t *)(a1 + 8LL * (*(_BYTE *)(a2 + 16) & 0x7F));
  uint64_t v5 = *v4;
  if (*v4)
  {
    if (v5 == a2)
    {
      uint64_t v7 = 0LL;
LABEL_7:
      if (v7) {
        int v4 = (uint64_t *)(v7 + 8);
      }
      *int v4 = *(void *)(a2 + 8);
    }

    else
    {
      while (1)
      {
        uint64_t v6 = *(void *)(v5 + 8);
        if (!v6) {
          break;
        }
        uint64_t v7 = v5;
        uint64_t v5 = *(void *)(v5 + 8);
        if (v6 == a2) {
          goto LABEL_7;
        }
      }
    }
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = (void *)(a1 + 1024);
  size_t v10 = (void *)(a1 + 1024);
  while (1)
  {
    size_t v10 = (void *)*v10;
    if (!v10) {
      break;
    }
    __int16 v11 = v8;
    uint64_t v8 = v10;
    if (v10 == (void *)a2)
    {
      if (v11) {
        uint64_t v9 = v11;
      }
      void *v9 = *(void *)a2;
      break;
    }
  }

  sub_100005720((void **)a2);
}

uint64_t sub_10000550C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = (void *)(a1 + 1024);
  uint64_t v9 = *(void *)(a1 + 1024);
  if (v9)
  {
    uint64_t v10 = *(void *)(a2 + 72);
    if (*(void *)(v9 + 72) <= v10)
    {
      uint64_t v12 = *(void **)(a1 + 1024);
      while (1)
      {
        __int16 v11 = v12;
        uint64_t v12 = (void *)*v12;
        if (!v12) {
          goto LABEL_8;
        }
        if (v12[9] > v10) {
          goto LABEL_7;
        }
      }
    }

    __int16 v11 = 0LL;
LABEL_7:
    if (v11)
    {
LABEL_8:
      uint64_t v9 = *v11;
      uint64_t v8 = v11;
    }
  }

  *(void *)a2 = v9;
  void *v8 = a2;
  uint64_t v13 = (unsigned __int8 *)(a2 + 16);
  uint64_t v14 = *(_BYTE *)(a2 + 16) & 0x7F;
  *(void *)(a2 + 8) = *(void *)(a1 + 8 * v14);
  *(void *)(a1 + 8 * v14) = a2;
  ++*(_DWORD *)(a1 + 1032);
  sub_100016E40( 1LL,  "RSN: added PMKSA cache entry for %02x:%02x:%02x:%02x:%02x:%02x",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 84));
  return sub_100016EB0(1LL, "RSN: added PMKID", v13, 16LL);
}

uint64_t sub_1000055EC(uint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4)
{
  uint64_t v7 = sub_100016B98(0x90uLL);
  uint64_t v8 = (uint64_t)v7;
  if (v7)
  {
    v7[1] = *a4;
    memcpy(v7 + 2, (const void *)(a2 + 32), *(void *)(a2 + 64));
    *(_OWORD *)(v8 + 64) = *(_OWORD *)(a2 + 64);
    *(_DWORD *)(v8 + 80) = *(_DWORD *)(a2 + 80);
    int v15 = *(_DWORD *)(a2 + 84);
    *(_WORD *)(v8 + 88) = *(_WORD *)(a2 + 88);
    *(_DWORD *)(v8 + 84) = v15;
    *(_DWORD *)(v8 + 136) = 1;
    if (*(void *)(a2 + 96))
    {
      size_t v16 = *(void *)(a2 + 104);
      __int16 v17 = malloc(v16);
      *(void *)(v8 + 96) = v17;
      if (v17)
      {
        *(void *)(v8 + 104) = v16;
        memcpy(v17, *(const void **)(a2 + 96), *(void *)(a2 + 104));
      }
    }

    *(_BYTE *)(v8 + 128) = *(_BYTE *)(a2 + 128);
    *(_DWORD *)(v8 + 1memset(&v9[1], 0, 32) = *(_DWORD *)(a2 + 132);
    *(_DWORD *)(v8 + 136) = 1;
    sub_10000550C(a1, v8, v9, v10, v11, v12, v13, v14);
  }

  return v8;
}

void sub_1000056B8( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = (void **)a1[128];
    if (v9)
    {
      do
      {
        uint64_t v10 = (void **)*v9;
        free(v9[12]);
        free(v9);
        uint64_t v9 = v10;
      }

      while (v10);
    }

    sub_100026438((uint64_t)sub_100005750, (uint64_t)a1, 0LL, a4, a5, a6, a7, a8);
    free(a1);
  }

void sub_100005720(void **a1)
{
  if (a1)
  {
    free(a1[12]);
    free(a1);
  }

uint64_t sub_100005750(uint64_t a1)
{
  for (uint64_t i = *(void *)(a1 + 1024); i; uint64_t i = *(void *)(a1 + 1024))
  {
    if (*(void *)(i + 72) > v11[0]) {
      break;
    }
    *(void *)(a1 + 1024) = *(void *)i;
    sub_100016E40( 1LL,  "RSN: expired PMKSA cache entry for %02x:%02x:%02x:%02x:%02x:%02x",  v2,  v3,  v4,  v5,  v6,  v7,  *(unsigned __int8 *)(i + 84));
    sub_100005448(a1, i);
  }

  uint64_t result = sub_100026438((uint64_t)sub_100005750, a1, 0LL, v3, v4, v5, v6, v7);
  if (*(void *)(a1 + 1024))
  {
    sub_100016734(v12);
    int v10 = *(_DWORD *)(*(void *)(a1 + 1024) + 72LL) - LODWORD(v12[0]);
    return sub_100026220((v10 & ~(v10 >> 31)) + 1, 0, (uint64_t)sub_100005750, a1, 0LL);
  }

  return result;
}

uint64_t *sub_100005844(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  for (uint64_t i = *(uint64_t **)(a1 + 1024); i; uint64_t i = (uint64_t *)*i)
  {
    if (*((_DWORD *)i + 21) != *(_DWORD *)a3 || *((unsigned __int16 *)i + 44) != *(unsigned __int16 *)(a3 + 4))
    {
      while (1)
        ;
    }

    int v9 = *((_DWORD *)i + 20);
    BOOL v12 = v9 == 128 || v9 == 1024 || v9 == 256;
    sub_10000D9CC((char *)i + 32, i[8], a2, a3, &v15, v12);
    if ((void)v15 == *a4 && *((void *)&v15 + 1) == a4[1]) {
      break;
    }
  }

  return i;
}

void *sub_100005928(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100016B98(0x420uLL);
  if (result)
  {
    result[130] = a1;
    result[131] = a2;
  }

  return result;
}

uint64_t sub_10000595C(uint64_t a1, unsigned int (*a2)(uint64_t, void *, uint64_t), uint64_t a3)
{
  uint64_t v6 = (void *)(a1 + 40);
  while (1)
  {
    uint64_t v6 = (void *)*v6;
    if (!v6) {
      break;
    }
    if (a2(a1, v6, a3)) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_1000059B4(uint64_t a1, uint64_t a2)
{
  for (uint64_t result = *(void *)(a1 + 8LL * *(unsigned __int8 *)(a2 + 5) + 48); result; uint64_t result = *(void *)(result + 8))
  {
    if (*(_DWORD *)(result + 16) == *(_DWORD *)a2
      && *(unsigned __int16 *)(result + 20) == *(unsigned __int16 *)(a2 + 4))
    {
      break;
    }
  }

  return result;
}

uint64_t sub_1000059EC(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result + 8LL * *(unsigned __int8 *)(a2 + 21);
  *(void *)(a2 + 8) = *(void *)(v2 + 48);
  *(void *)(v2 + 48) = a2;
  return result;
}

void sub_100005A04( uint64_t a1, unsigned __int16 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = *((_DWORD *)a2 + 6);
  if ((v10 & 0x4000) != 0)
  {
    (*(void (**)(uint64_t, unsigned __int16 *, void, void))(a1 + 2504))(a1, a2 + 8, a2[11], 0LL);
    int v10 = *((_DWORD *)a2 + 6);
  }

  if ((v10 & 0x100) == 0) {
    (*(void (**)(uint64_t, unsigned __int16 *))(a1 + 2552))(a1, a2 + 8);
  }
  uint64_t v11 = a1 + 8LL * *((unsigned __int8 *)a2 + 21);
  uint64_t v14 = *(void *)(v11 + 48);
  uint64_t v13 = (void *)(v11 + 48);
  uint64_t v12 = v14;
  if (v14)
  {
    if (*(_DWORD *)(v12 + 16) == *((_DWORD *)a2 + 4) && *(unsigned __int16 *)(v12 + 20) == a2[10])
    {
      *uint64_t v13 = *(void *)(v12 + 8);
    }

    else
    {
      while (1)
      {
        uint64_t v16 = v12;
        uint64_t v12 = *(void *)(v12 + 8);
        if (!v12) {
          break;
        }
        if (*(_DWORD *)(v12 + 16) == *((_DWORD *)a2 + 4) && *(unsigned __int16 *)(v12 + 20) == a2[10])
        {
          *(void *)(v16 + 8) = *(void *)(v12 + 8);
          goto LABEL_19;
        }
      }

      sub_100016E40( 1LL,  "AP: could not remove STA %02x:%02x:%02x:%02x:%02x:%02x from hash table",  a3,  a4,  a5,  a6,  a7,  a8,  *((unsigned __int8 *)a2 + 16));
    }
  }

LABEL_25:
  if (a2[11]) {
    *(_DWORD *)(a1 + 4LL * ((a2[11] - 1) >> 5) + 2096) &= ~(1 << (a2[11] - 1));
  }
  --*(_DWORD *)(a1 + 36);
  char v20 = *((_BYTE *)a2 + 68);
  if ((v20 & 1) != 0)
  {
    *((_BYTE *)a2 + 68) = v20 & 0xFE;
    --*(_DWORD *)(*(void *)a1 + 2184LL);
    char v20 = *((_BYTE *)a2 + 68);
    if ((v20 & 2) == 0)
    {
LABEL_29:
      if ((v20 & 4) == 0) {
        goto LABEL_30;
      }
      goto LABEL_37;
    }
  }

  else if ((a2[34] & 2) == 0)
  {
    goto LABEL_29;
  }

  *((_BYTE *)a2 + 68) = v20 & 0xFD;
  --*(_DWORD *)(*(void *)a1 + 2188LL);
  char v20 = *((_BYTE *)a2 + 68);
  if ((v20 & 4) == 0)
  {
LABEL_30:
    if ((v20 & 8) == 0) {
      goto LABEL_31;
    }
    goto LABEL_38;
  }

  if ((v13 & 8) != 0)
  {
    if (!*(_DWORD *)(a2 + 292)
      || ((uint64_t v22 = bswap64(*(void *)(a3 + 9)),
           uint64_t v23 = bswap64(*(void *)(a2 + 281)),
           uint64_t v24 = v22 >= v23,
           uint64_t v25 = v22 > v23,
           v24)
        ? (uint64_t v26 = 0)
        : (uint64_t v26 = 1),
          v25 - v26 > 0))
    {
LABEL_39:
      switch(v18)
      {
        case 0:
          if ((*(_DWORD *)(a2 + 24) - 7) >= 2)
          {
            sub_1000078D0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  "received EAPOL-Key msg 2/4 in invalid state (%d) - dropped");
            return;
          }

          if ((sub_10000CA80((unsigned __int8 *)(a3 + 99), v12, (uint64_t)&v71, a4, a5, a6, a7, a8) & 0x80000000) != 0)
          {
            sub_1000078D0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  "received EAPOL-Key msg 2/4 with invalid Key Data contents");
            return;
          }

          uint64_t v27 = v74;
          uint64_t v28 = v73;
          if (!v73) {
            uint64_t v28 = v71;
          }
          uint64_t v70 = v28;
          if (!v73) {
            uint64_t v27 = &v72;
          }
          uint64_t v29 = *v27;
          if (*(_DWORD *)(a2 + 312) == 2)
          {
            uint64_t v30 = *(_DWORD *)(a2 + 320);
            uint64_t v32 = v30 == 64 || v30 == 32;
          }

          else
          {
            uint64_t v32 = 0;
          }

          uint64_t v48 = *(void **)(a2 + 296);
          if (v48 && !sub_10000DBC8(v32, v48, *(void *)(a2 + 304), v28, v29))
          {
            if (!*(_BYTE *)(a2 + 344) && !__s2) {
              goto LABEL_60;
            }
            if ((*(_BYTE *)(a2 + 344) == 0) == (__s2 == 0LL))
            {
              uint64_t v67 = *(unsigned __int8 *)(a2 + 345);
            }

            uint64_t v68 = (unsigned __int8 *)(a2 + 16);
            sub_10000774C(a1, v68, 1LL, (uint64_t)"RSNXE from (Re)AssocReq did not match with msg 2/4");
            uint64_t v50 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 160);
            if (!v50) {
              return;
            }
            uint64_t v51 = *(void *)(a1 + 144);
            uint64_t v52 = v68;
          }

          else
          {
            sub_10000774C( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  (uint64_t)"WPA IE from (Re)AssocReq did not match with msg 2/4");
            uint64_t v49 = *(unsigned __int8 **)(a2 + 296);
            if (v49) {
              sub_100016EB0(1LL, "WPA IE in AssocReq", v49, *(void *)(a2 + 304));
            }
            sub_100016EB0(1LL, "WPA IE in msg 2/4", v70, v29);
            uint64_t v50 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 160);
            if (!v50) {
              return;
            }
            uint64_t v51 = *(void *)(a1 + 144);
            uint64_t v52 = (unsigned __int8 *)(a2 + 16);
          }

          v50(v51, v52, 2LL);
          return;
        case 1:
          if (*(_DWORD *)(a2 + 24) == 10 && *(_BYTE *)(a2 + 214)) {
            goto LABEL_60;
          }
          sub_1000078D0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  "received EAPOL-Key msg 4/4 in invalid state (%d) - dropped");
          return;
        case 2:
          if (*(_DWORD *)(a2 + 28) == 1 && *(_BYTE *)(a2 + 214)) {
            goto LABEL_60;
          }
          sub_1000078D0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  "received EAPOL-Key msg 2/2 in invalid state (%d) - dropped");
          return;
        case 4:
        case 5:
        case 6:
          return;
        default:
LABEL_60:
          sub_1000078D0(a1, (unsigned __int8 *)(a2 + 16), 0LL, "received EAPOL-Key frame (%s)", v17);
          if (v14 < 0)
          {
            uint64_t v40 = "received invalid EAPOL-Key: Key Ack set";
            goto LABEL_115;
          }

          if ((v13 & 1) == 0)
          {
            uint64_t v40 = "received invalid EAPOL-Key: Key MIC not set";
LABEL_115:
            sub_10000774C(a1, (unsigned __int8 *)(a2 + 16), 1LL, (uint64_t)v40);
            return;
          }

          *(_BYTE *)(a2 + 52) = 0;
          if (*(_BYTE *)(a2 + 214))
          {
            if (sub_100008EC4((unsigned int *)(a2 + 150), a3, a4))
            {
              uint64_t v40 = "received EAPOL-Key with invalid MIC";
              goto LABEL_115;
            }

            *(_BYTE *)(a2 + 52) = 1;
            sub_100026438((uint64_t)sub_1000086A8, a1, a2, v43, v44, v45, v46, v47);
          }

          if ((v13 & 8) != 0)
          {
            if (!*(_BYTE *)(a2 + 52))
            {
              uint64_t v40 = "received EAPOL-Key request with invalid MIC";
              goto LABEL_115;
            }

            *(_DWORD *)(a2 + 292) = 1;
            *(void *)(a2 + 281) = *(void *)(a3 + 9);
            if ((v16 & 1) != 0) {
              return;
            }
            if ((v13 & 4) != 0)
            {
              sub_10000774C( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  (uint64_t)"received EAPOL-Key Error Request (STA detected Michael MIC failure)");
              uint64_t v69 = *(void (**)(void, uint64_t))(a1 + 168);
              if (v69) {
                v69(*(void *)(a1 + 144), a2 + 16);
              }
              ++*(_DWORD *)(a2 + 340);
              ++*(_DWORD *)(a1 + 8);
            }

            else
            {
              if ((v14 & 8) == 0)
              {
                if (!(_DWORD)v12
                  || sub_10000CA80( (unsigned __int8 *)(a3 + 99),  v12,  (uint64_t)&v71,  v35,  v36,  v37,  v38,  v39)
                  || !v74[4])
                {
                  sub_10000774C( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  (uint64_t)"received EAPOL-Key Request for GTK rekeying");
                  sub_100026438((uint64_t)sub_100007CAC, a1, 0LL, v62, v63, v64, v65, v66);
                  sub_100007CAC(a1);
                }

                goto LABEL_97;
              }

              sub_10000774C( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  (uint64_t)"received EAPOL-Key Request for new 4-Way Handshake");
            }

            *(_BYTE *)(a2 + 258) = 1;
            *(_BYTE *)(a2 + 214) = 0;
          }

          else
          {
            *(_BYTE *)(a2 + 229) = 0;
          }

  puts(v13);
  return 1LL;
}

  uint64_t v51 = *(_DWORD *)(a1 + 660);
  if (v51 == 1 || v51 == 128 || v51 == 32)
  {
    sub_100016E40(1LL, "RSN: no PMKSA entry found - trigger full EAP authentication", v26, v27, v28, v29, v30, v31, v66);
    uint64_t v52 = (*(uint64_t (**)(void, uint64_t, void, void, uint64_t *, void))(*(void *)(a1 + 496) + 96LL))( **(void **)(a1 + 496),  1LL,  0LL,  0LL,  &v73,  0LL);
    if (v52)
    {
      unsigned int v53 = (void *)v52;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 496) + 72LL))( **(void **)(a1 + 496),  a1 + 624,  34958LL,  v52,  v73);
      free(v53);
    }

    goto LABEL_46;
  }

    if (*(void *)(a1 + 248) && *(_DWORD *)(a1 + 148) != -1)
    {
      uint64_t v23 = "EAP: getDecision: no more methods available -> FAILURE";
LABEL_36:
      __int16 v17 = 1;
      uint64_t result = sub_100016E40(1LL, v23, v9, v10, v11, v12, v13, v14, v27);
      goto LABEL_37;
    }

    uint64_t v22 = "EAP: getDecision: no identity known yet -> CONTINUE";
LABEL_29:
    uint64_t result = sub_100016E40(1LL, v22, v9, v10, v11, v12, v13, v14, v27);
    __int16 v17 = 2;
    goto LABEL_37;
  }

  uint64_t v16 = "EAP: getDecision: method failed -> FAILURE";
LABEL_7:
  __int16 v17 = 1;
  uint64_t result = sub_100016E40(1LL, v16, v9, v10, v11, v12, v13, v14, v27);
  *(_BYTE *)(a1 + 305) = 1;
LABEL_37:
  *(_DWORD *)(a1 + 196) = v17;
  return result;
}

LABEL_37:
  *((_BYTE *)a2 + 68) = v20 & 0xFB;
  --*(_DWORD *)(*(void *)a1 + 2192LL);
  char v20 = *((_BYTE *)a2 + 68);
  if ((v20 & 8) == 0)
  {
LABEL_31:
    if ((v20 & 0x10) == 0) {
      goto LABEL_32;
    }
LABEL_39:
    *((_BYTE *)a2 + 68) = v20 & 0xEF;
    --*(_DWORD *)(*(void *)a1 + 2204LL);
    char v20 = *((_BYTE *)a2 + 68);
    if ((v20 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

LABEL_34:
  sub_100026438((uint64_t)sub_100005CF0, a1, (uint64_t)a2, a4, a5, a6, a7, a8);
  sub_100026438((uint64_t)sub_1000060F4, a1, (uint64_t)a2, v21, v22, v23, v24, v25);
  sub_1000202F8((uint64_t)a2);
  sub_1000085A4(*((void *)a2 + 21), v26, v27, v28, v29, v30, v31, v32);
  free(*((void **)a2 + 12));
  free(*((void **)a2 + 20));
  free(*((void **)a2 + 28));
  sub_100026438((uint64_t)sub_100006180, a1, (uint64_t)a2, v33, v34, v35, v36, v37);
  sub_10001757C(*((void ***)a2 + 31));
  free(*((void **)a2 + 26));
  free(a2);
}

void sub_100005CF0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v10 = *(_DWORD *)(a2 + 80);
  if (v10 == 3)
  {
    sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  2LL,  "deauthenticated due to local deauth request",  a6,  a7,  a8,  v46);
    sub_100005A04(a1, (unsigned __int16 *)a2, v11, v12, v13, v14, v15, v16);
    return;
  }

  if (v10 <= 1 && (*(_DWORD *)(a2 + 24) & 2) != 0)
  {
    sub_100016E40( 1LL,  "Checking STA %02x:%02x:%02x:%02x:%02x:%02x inactivity:",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
    int v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2520))(a1, a2 + 16);
    if (v18 == -1)
    {
      sub_100016E40( 1LL,  "Could not get station info from kernel driver for %02x:%02x:%02x:%02x:%02x:%02x.",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
    }

    else
    {
      int v19 = v18;
      if (v18 < *(_DWORD *)(*(void *)(a1 + 16) + 700LL) && (*(_BYTE *)(a2 + 24) & 2) != 0)
      {
        sub_100016E40(1LL, "  Station has been active", a3, a4, a5, a6, a7, a8, v46);
        *(_DWORD *)(a2 + 80) = 0;
        uint64_t v20 = *(int *)(*(void *)(a1 + 16) + 700LL) - (uint64_t)v19;
        goto LABEL_13;
      }
    }
  }

  uint64_t v20 = 0LL;
LABEL_13:
  int v21 = *(_DWORD *)(a2 + 24);
  if ((v21 & 2) != 0 && (v21 & 0x40) == 0 && *(_DWORD *)(a2 + 80) == 1)
  {
    sub_100016E40(1LL, "  Station has ACKed data poll", a3, a4, a5, a6, a7, a8, v46);
    *(_DWORD *)(a2 + 80) = 0;
    uint64_t v20 = *(int *)(*(void *)(a1 + 16) + 700LL);
  }

  if (v20)
  {
    sub_100026220(v20, 0, (uint64_t)sub_100005CF0, a1, a2);
  }

  else
  {
    int v22 = *(_DWORD *)(a2 + 80);
    if (v22 == 3) {
      goto LABEL_37;
    }
    if (!v22 && (*(_BYTE *)(a2 + 24) & 2) != 0)
    {
      sub_100016E40(1LL, "  Polling STA with data frame", a3, a4, a5, a6, a7, a8, v46);
      *(_DWORD *)(a2 + 24) |= 0x40u;
      memset(v49, 0, sizeof(v49));
      uint64_t v48 = 0LL;
      uint64_t v24 = *(const char ***)(a1 + 2352);
      if (v24 && !strcmp(*v24, "hostap")) {
        __int16 v25 = 520;
      }
      else {
        __int16 v25 = 584;
      }
      __int16 v47 = v25;
      *(_DWORD *)((char *)&v48 + 2) = *(_DWORD *)(a2 + 16);
      HIWORD(v48) = *(_WORD *)(a2 + 20);
      *(_DWORD *)uint64_t v49 = *(_DWORD *)(a1 + 28);
      *(_WORD *)&v49[4] = *(_WORD *)(a1 + 32);
      *(_DWORD *)&v49[6] = *(_DWORD *)v49;
      *(_WORD *)&v49[10] = *(_WORD *)&v49[4];
    }

    else
    {
      uint64_t v23 = "disassociation";
      if (v22 == 2) {
        uint64_t v23 = "deauthentication";
      }
      sub_100016E40(1LL, "Sending %s info to STA %02x:%02x:%02x:%02x:%02x:%02x", a3, a4, a5, a6, a7, a8, (uint64_t)v23);
      if (v22 == 2) {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 2528))(a1, a2 + 16, 2LL);
      }
      else {
        (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 2536))(a1, a2 + 16, 4LL);
      }
    }

    int v26 = *(_DWORD *)(a2 + 80);
    if ((v26 - 2) < 2)
    {
LABEL_37:
      sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 1LL, 2LL, "deauthenticated due to inactivity", a6, a7, a8, v46);
      if (!*(_DWORD *)(a2 + 124)) {
        *(_DWORD *)(a2 + 124) = 4;
      }
      sub_10001BC94(a1, a2, 2LL, v27, v28, v29, v30, v31);
      sub_100005A04(a1, (unsigned __int16 *)a2, v32, v33, v34, v35, v36, v37);
    }

    else if (v26 == 1)
    {
      *(_DWORD *)(a2 + 24) &= ~2u;
      sub_100020AC8(*(void *)(a2 + 88), 0);
      if (!*(_DWORD *)(a2 + 124)) {
        *(_DWORD *)(a2 + 124) = 4;
      }
      sub_1000202F8(a2);
      sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 1LL, 2LL, "disassociated due to inactivity", v38, v39, v40, v46);
      *(_DWORD *)(a2 + 80) = 2;
      sub_100026220(1u, 0, (uint64_t)sub_100005CF0, a1, a2);
      sub_10001BE34(a1, a2, 4LL, v41, v42, v43, v44, v45);
    }

    else if (!v26)
    {
      *(_DWORD *)(a2 + 80) = 1;
      sub_100026220(1u, 0, (uint64_t)sub_100005CF0, a1, a2);
    }
  }

uint64_t sub_1000060F4( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*(_BYTE *)(a2 + 24) & 1) != 0)
  {
    uint64_t v9 = result;
    sub_10001BC94(result, a2, 2LL, a4, a5, a6, a7, a8);
    sub_1000172B0( v9,  (unsigned __int8 *)(a2 + 16),  1LL,  2LL,  "deauthenticated due to session timeout",  v10,  v11,  v12,  v13);
    *(_DWORD *)(a2 + 124) = 5;
    int v14 = *(_DWORD *)(a2 + 16);
    __int16 v15 = *(_WORD *)(a2 + 20);
    sub_100005A04(v9, a2);
    return (*(uint64_t (**)(uint64_t, int *, uint64_t))(v9 + 2528))(v9, &v14, 2LL);
  }

  return result;
}

void sub_100006180(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a2 + 216);
  if (v4 >= 1)
  {
    int v4 = *(_DWORD *)(a2 + 216);
  }

  uint64_t v5 = (char *)realloc(*(void **)(a2 + 224), 2 * v4 + 2);
  if (v5)
  {
    uint64_t v6 = v5;
    int v7 = *(_DWORD *)(a2 + 216);
    if (!v7)
    {
      sub_100016734((__darwin_time_t *)(a2 + 232));
      int v7 = *(_DWORD *)(a2 + 216);
    }

    *(void *)(a2 + 224) = v6;
    *(_DWORD *)(a2 + 216) = v7 + 1;
    sub_10001691C(&v6[2 * v7], 2uLL);
    sub_100026220( ((*(_DWORD *)(*(void *)(a1 + 16) + 500LL) / 0x3E8u) << 10) / 0x3E8,  (*(_DWORD *)(*(void *)(a1 + 16) + 500LL) % 0x3E8u) << 10,  (uint64_t)sub_100006180,  a1,  a2);
    sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  1LL,  1LL,  "association SA Query attempt %d",  v8,  v9,  v10,  *(unsigned int *)(a2 + 216));
  }

void sub_100006284( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    do
    {
      if ((*(_BYTE *)(v8 + 24) & 1) != 0) {
        sub_10001BC94(a1, v8, 1LL, a4, a5, a6, a7, a8);
      }
      uint64_t v10 = *(void *)v8;
      sub_100016E40( 1LL,  "Removing station %02x:%02x:%02x:%02x:%02x:%02x",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(v8 + 16));
      sub_100005A04(a1, (unsigned __int16 *)v8, v11, v12, v13, v14, v15, v16);
      uint64_t v8 = v10;
    }

    while (v10);
  }

uint64_t sub_100006320( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v8 = a3;
  sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 1LL, 1LL, "setting session timeout to %d seconds", a6, a7, a8, a3);
  sub_100026438((uint64_t)sub_1000060F4, a1, a2, v11, v12, v13, v14, v15);
  return sub_100026220(v8, 0, (uint64_t)sub_1000060F4, a1, a2);
}

uint64_t sub_10000639C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100026438((uint64_t)sub_1000060F4, a1, a2, a4, a5, a6, a7, a8);
}

_DWORD *sub_1000063B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000059B4(a1, a2);
  if (v4)
  {
    uint64_t v11 = v4;
    sub_100016E40(2LL, "STA already exists! resetting..", v5, v6, v7, v8, v9, v10, v47);
    *(_DWORD *)(v11 + 24) &= 0xFFFFFFFC;
    *(_DWORD *)(v11 + 124) = 1;
    sub_100020AC8(*(void *)(v11 + 88), 0);
    sub_100005A04(a1, (unsigned __int16 *)v11, v12, v13, v14, v15, v16, v17);
    if (sub_1000059B4(a1, a2)) {
      sub_100016E40(4LL, "Failed to reset STA!!", v5, v6, v7, v8, v9, v10, v47);
    }
  }

  sub_100016E40(1LL, "  New STA", v5, v6, v7, v8, v9, v10, v47);
  if (*(_DWORD *)(a1 + 36) >= *(_DWORD *)(*(void *)(a1 + 16) + 64LL))
  {
    sub_100016E40(1LL, "no more room for new STAs (%d/%d)", v18, v19, v20, v21, v22, v23, *(unsigned int *)(a1 + 36));
    return 0LL;
  }

  else
  {
    uint64_t v24 = sub_100016B98(0x100uLL);
    uint64_t v31 = v24;
    if (v24)
    {
      uint64_t v32 = *(void *)(a1 + 16);
      v24[32] = *(_DWORD *)(v32 + 144);
      sub_100026220(*(_DWORD *)(v32 + 700), 0, (uint64_t)sub_100005CF0, a1, (uint64_t)v24);
      __int16 v33 = *(_WORD *)(a2 + 4);
      v31[4] = *(_DWORD *)a2;
      *((_WORD *)v31 + 10) = v33;
      *(void *)uint64_t v31 = *(void *)(a1 + 40);
      *(void *)(a1 + 40) = v31;
      ++*(_DWORD *)(a1 + 36);
      uint64_t v34 = a1 + 8LL * *((unsigned __int8 *)v31 + 21);
      *((void *)v31 + 1) = *(void *)(v34 + 48);
      *(void *)(v34 + 48) = v31;
      *((void *)v31 + 23) = *(void *)(a1 + 16) + 152LL;
      uint64_t v35 = *(void *)a1;
      unint64_t v36 = *(void *)(*(void *)a1 + 48LL);
      if (v36)
      {
        for (unint64_t i = 0LL; i < v36; ++i)
        {
          uint64_t v38 = *(void *)(v35 + 56);
          uint64_t v39 = *(void *)(v38 + 8 * i);
          if (v39 != a1 && v39 != 0)
          {
            uint64_t v41 = sub_1000059B4(*(void *)(v38 + 8 * i), (uint64_t)(v31 + 4));
            if (v41)
            {
              sub_100006910(v39, v41, v41 + 16, 2LL, v42, v43, v44, v45);
              unint64_t v36 = *(void *)(v35 + 48);
            }
          }
        }
      }
    }

    else
    {
      sub_100016E40(4LL, "malloc failed", v25, v26, v27, v28, v29, v30, v48);
    }
  }

  return v31;
}

uint64_t sub_10000658C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a2 + 24) &= ~2u;
  sub_100006660(a1, a2);
  *(_DWORD *)(a2 + 80) = 2;
  sub_100026438((uint64_t)sub_100005CF0, a1, a2, v11, v12, v13, v14, v15);
  sub_100026220(0x1Eu, 0, (uint64_t)sub_100005CF0, a1, a2);
  sub_1000202F8(a2);
  return sub_10001BE34(a1, a2, a3, v16, v17, v18, v19, v20);
}

uint64_t sub_100006660(uint64_t a1, uint64_t a2)
{
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 2552))(a1, a2 + 16);
  if ((_DWORD)result)
  {
    if ((*(_BYTE *)(a2 + 24) & 2) != 0) {
      return sub_100016E40( 1LL,  "Could not remove station %02x:%02x:%02x:%02x:%02x:%02x from kernel driver.",  v11,  v12,  v13,  v14,  v15,  v16,  *(unsigned __int8 *)(a2 + 16));
    }
  }

  return result;
}

uint64_t sub_100006724( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a2 + 24) &= 0xFFFFFFFC;
  sub_100006660(a1, a2);
  *(_DWORD *)(a2 + 80) = 3;
  sub_100026438((uint64_t)sub_100005CF0, a1, a2, v11, v12, v13, v14, v15);
  sub_100026220(5u, 0, (uint64_t)sub_100005CF0, a1, a2);
  sub_1000202F8(a2);
  return sub_10001BC94(a1, a2, a3, v16, v17, v18, v19, v20);
}

uint64_t sub_1000067F8(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *(void *)(a2 + 240);
  BOOL v8 = v19 < v7;
  uint64_t v9 = v19 - v7;
  uint64_t v10 = v19 - v7 + 1000000;
  if (!v8) {
    uint64_t v10 = v9;
  }
  if (*(_DWORD *)(*(void *)(a1 + 16) + 496LL) >= ((v10
                                                                  + 1000000 * (v18 - *(void *)(a2 + 232) + (v9 >> 63)))
                                                                 / 1024))
    return 0LL;
  uint64_t v11 = 1LL;
  sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 1LL, 1LL, "association SA Query timed out", v4, v5, v6, v18);
  *(_DWORD *)(a2 + 220) = 1;
  free(*(void **)(a2 + 224));
  *(void *)(a2 + 224) = 0LL;
  *(_DWORD *)(a2 + 216) = 0;
  sub_100026438((uint64_t)sub_100006180, a1, a2, v12, v13, v14, v15, v16);
  return v11;
}

void sub_1000068D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a2 + 224) = 0LL;
  *(_DWORD *)(a2 + 216) = 0;
}

uint64_t sub_100006910( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a2;
  uint64_t v11 = result;
  if (a2 || !a3)
  {
    if (!a3) {
      goto LABEL_6;
    }
  }

  else
  {
    uint64_t v10 = sub_1000059B4(result, a3);
  }

  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 2528))(v11, a3, a4);
LABEL_6:
  if (v10)
  {
    *(_DWORD *)(v10 + 24) &= 0xFFFFFFDC;
    sub_100026438((uint64_t)sub_100005CF0, v11, v10, a4, a5, a6, a7, a8);
    uint64_t result = sub_100026220(0, 0, (uint64_t)sub_100005CF0, v11, v10);
    *(_DWORD *)(v10 + 80) = 3;
  }

  return result;
}

time_t sub_1000069C0(uint64_t a1, unsigned __int8 *a2, int a3)
{
  if (a2 && a3)
  {
    uint64_t v5 = sub_1000059B4(a1, (uint64_t)a2);
    if (!v5) {
      return sub_100016E40( 1LL,  "MLME-MICHAELMICFAILURE.indication for not associated STA (%02x:%02x:%02x:%02x:%02x:%02x) ignored",  v6,  v7,  v8,  v9,  v10,  v11,  *a2);
    }
    sub_100009C64(*(void *)(v5 + 168));
    sub_1000172B0(a1, a2, 1LL, 2LL, "Michael MIC failure detected in received frame", v12, v13, v14, v32);
    sub_10001BEA4(a1, a2, v15, v16, v17, v18, v19, v20);
  }

  time_t result = time(&v33);
  if (v33 <= *(void *)(a1 + 2648) + 60LL)
  {
    int v25 = *(_DWORD *)(a1 + 2656);
    *(_DWORD *)(a1 + 2656) = v25 + 1;
    if (v25 >= 1)
    {
      sub_1000172B0(a1, 0LL, 1LL, 2LL, "TKIP countermeasures initiated", v22, v23, v24, v32);
      sub_100009BE0(*(void *)(a1 + 2624));
      *(_DWORD *)(a1 + 2660) = 1;
      (*(void (**)(uint64_t, uint64_t))(a1 + 2560))(a1, 1LL);
      sub_100009620(*(void *)(a1 + 2624));
      sub_100026438((uint64_t)sub_100006B6C, a1, 0LL, v26, v27, v28, v29, v30);
      time_t result = sub_100026220(0x3Cu, 0, (uint64_t)sub_100006B6C, a1, 0LL);
      for (unint64_t i = *(uint64_t **)(a1 + 40); i; unint64_t i = (uint64_t *)*i)
      {
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(a1 + 2528))(a1, i + 2, 14LL);
        *((_DWORD *)i + 6) &= 0xFFFFFFDC;
        time_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(a1 + 2552))(a1, i + 2);
      }
    }
  }

  else
  {
    *(_DWORD *)(a1 + 2656) = 1;
  }

  *(void *)(a1 + 2648) = v33;
  return result;
}

void sub_100006B6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_DWORD *)(a1 + 2660) = 0;
  (*(void (**)(uint64_t, void))(a1 + 2560))(a1, 0LL);
  sub_1000172B0(a1, 0LL, 1LL, 2LL, "TKIP countermeasures ended", v10, v11, v12, a9);
}

uint64_t sub_100006BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (char *)realloc(*(void **)(a1 + 2744), 16LL * *(void *)(a1 + 2752) + 16);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  uint64_t result = 0LL;
  *(void *)(a1 + 2744) = v7;
  uint64_t v9 = *(void *)(a1 + 2752);
  uint64_t v10 = &v7[16 * v9];
  *(void *)(a1 + 2752) = v9 + 1;
  *(void *)uint64_t v10 = a2;
  *((void *)v10 + 1) = a3;
  return result;
}

void **sub_100006C1C(void **result, uint64_t a2)
{
  v3[0] = result;
  v3[1] = a2;
  uint64_t v2 = (uint64_t (*)(void, uint64_t (*)(uint64_t, void *), void *))(*result)[281];
  if (v2) {
    return (void **)v2(**result, sub_100006C58, v3);
  }
  return result;
}

uint64_t sub_100006C58(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 48))
  {
    unint64_t v4 = 0LL;
    do
    {
      uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8 * v4);
      if (v5 != *a2)
      {
        uint64_t v6 = sub_1000059B4(*(void *)(*(void *)(a1 + 56) + 8 * v4), a2[1]);
        if (v6) {
          sub_10000658C(v5, v6, 1LL, v7, v8, v9, v10, v11);
        }
      }

      ++v4;
    }

    while (v4 < *(void *)(a1 + 48));
  }

  return 0LL;
}

uint64_t sub_100006CD4(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 708LL))
  {
    *(_BYTE *)a2 = -35;
    *(_DWORD *)(a2 + 2) = 49434624;
    *(_WORD *)(a2 + 6) = 257;
    char v2 = *(_BYTE *)(a1 + 2704) & 0xF;
    *(_BYTE *)(a2 + 8) = v2;
    if (*(_DWORD *)(*(void *)(a1 + 16) + 712LL)) {
      *(_BYTE *)(a2 + 8) = v2 | 0x80;
    }
    uint64_t v3 = 0LL;
    unint64_t v4 = (_WORD *)(a2 + 12);
    uint64_t v5 = (_DWORD *)(*(void *)(a1 + 8) + 272LL);
    do
    {
      if (*v5) {
        char v6 = *(_BYTE *)(v5 - 2) & 0xF | 0x10;
      }
      else {
        char v6 = *(_BYTE *)(v5 - 2) & 0xF;
      }
      *((_BYTE *)v4 - 2) = v6 | (32 * v3);
      *((_BYTE *)v4 - 1) = *(_BYTE *)(v5 - 4) & 0xF | (16 * *(v5 - 3));
      *unint64_t v4 = *(v5 - 1);
      v4 += 2;
      ++v3;
      v5 += 5;
    }

    while (v3 != 4);
    *(_BYTE *)(a2 + 1) = 24;
    a2 += 26LL;
  }

  return a2;
}

uint64_t sub_100006D88(uint64_t a1, unsigned __int8 *a2, unint64_t a3)
{
  if (a3 > 6)
  {
    sub_100016E40( 1LL,  "Validating WMM IE: OUI %02x:%02x:%02x  OUI type %d  OUI sub-type %d  version %d  QoS info 0x%x",  v5,  v6,  v7,  v8,  v9,  v10,  *a2);
    if (!a2[4] && a2[5] == 1) {
      return 0LL;
    }
    sub_100016E40(1LL, "Unsupported WMM IE Subtype/Version", v11, v12, v13, v14, v15, v16, v18);
  }

  else
  {
    sub_100016E40(1LL, "Too short WMM IE (len=%lu)", v5, v6, v7, v8, v9, v10, a3);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100006E4C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100016E40( 1LL,  "WMM: TS Info: UP=%d PSB=%d Direction=%d TID=%d",  a3,  a4,  a5,  a6,  a7,  a8,  (*(unsigned __int8 *)(a1 + 9) >> 3) & 7);
  sub_100016E40(1LL, "WMM: Nominal MSDU Size: %d%s", v9, v10, v11, v12, v13, v14, *(_WORD *)(a1 + 11) & 0x7FFF);
  sub_100016E40(1LL, "WMM: Mean Data Rate: %u bps", v15, v16, v17, v18, v19, v20, *(unsigned int *)(a1 + 39));
  sub_100016E40(1LL, "WMM: Minimum PHY Rate: %u bps", v21, v22, v23, v24, v25, v26, *(unsigned int *)(a1 + 55));
  sub_100016E40( 1LL,  "WMM: Surplus Bandwidth Allowance: %u.%04u",  v27,  v28,  v29,  v30,  v31,  v32,  *(unsigned __int16 *)(a1 + 59) >> 13);
  if (!*(_WORD *)(a1 + 11))
  {
    uint64_t v41 = "WMM: Invalid Nominal MSDU Size (0)";
    goto LABEL_7;
  }

  sub_100016E40(1LL, "WMM: Packets-per-second estimate for TSPEC: %d", v33, v34, v35, v36, v37, v38, v39);
  unsigned int v40 = *(_DWORD *)(a1 + 55);
  if (v40 < 0xF4240)
  {
    uint64_t v41 = "WMM: Too small Minimum PHY Rate";
LABEL_7:
    uint64_t v43 = 1LL;
    sub_100016E40(1LL, v41, v33, v34, v35, v36, v37, v38, v47);
    return v43;
  }

  unsigned int v42 = *(unsigned __int16 *)(a1 + 59);
  if (v42 <= 0x2000)
  {
    uint64_t v41 = "WMM: Surplus Bandwidth Allowance not greater than unity";
    goto LABEL_7;
  }

  signed int v45 = v39 * v42 * (8 * (*(_WORD *)(a1 + 11) & 0x7FFFu) / (v40 / 0xF4240) + 50);
  if (v45 >= 0) {
    int v46 = v45;
  }
  else {
    int v46 = v45 + 0x3FFFF;
  }
  sub_100016E40(1LL, "WMM: Estimated medium time: %u", v33, v34, v35, v36, v37, v38, (v45 / 0x2000));
  uint64_t v43 = 0LL;
  *(_WORD *)(a1 + 61) = v46 >> 18;
  return v43;
}

void sub_10000701C( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12 = a2 + 10;
  uint64_t v13 = sub_1000059B4(a1, (uint64_t)(a2 + 10));
  if (!v13 || (~*(_DWORD *)(v13 + 24) & 0x202) != 0)
  {
    sub_1000172B0(a1, v12, 1LL, 1LL, "wmm action received is not from associated wmm station", v15, v16, v17, a9);
    return;
  }

  unint64_t v18 = (a3 - 28);
  if ((v18 & 0x80000000) == 0)
  {
    if (sub_10000CD28(a2 + 28, v18, (uint64_t)v50, 1LL, v14, v15, v16, v17) == -1)
    {
      uint64_t v26 = "hostapd_wmm_action - could not parse wmm action";
    }

    else
    {
      uint64_t v25 = v51;
      if (v51 && v52 == 61)
      {
        if (a2[25])
        {
          sub_1000172B0(a1, v12, 1LL, 1LL, "hostapd_wmm_action - unknown action code %d", v22, v23, v24, a2[25]);
        }

        else if (v51 + 61 <= (unint64_t)&a2[a3])
        {
          sub_100016E40( 1LL,  "WMM: ADDTS Request (Dialog Token %d) for TSPEC from %02x:%02x:%02x:%02x:%02x:%02x",  v19,  v20,  v21,  v22,  v23,  v24,  a2[26]);
          uint64_t v34 = sub_100006E4C(v25 - 2, v27, v28, v29, v30, v31, v32, v33);
          sub_100016E40(1LL, "WMM: ADDTS processing result: %d", v35, v36, v37, v38, v39, v40, v34);
          unsigned __int8 v41 = a2[26];
          sub_1000172B0(a1, v12, 1LL, 1LL, "action response - reason %d", v42, v43, v44, v34);
          memset(v63, 0, sizeof(v63));
          __int128 v62 = 0u;
          __int128 v61 = 0u;
          __int128 v60 = 0u;
          __int128 v59 = 0u;
          __int128 v58 = 0u;
          __int128 v57 = 0u;
          __int128 v56 = 0u;
          __int128 v55 = 0u;
          *(_OWORD *)&v54[80] = 0u;
          memset(&v54[48], 0, 25);
          *(_OWORD *)&v54[32] = 0u;
          *(_OWORD *)&v54[16] = 0u;
          *(_OWORD *)uint64_t v54 = 0u;
          __int16 v53 = 208;
          int v45 = *(_DWORD *)v12;
          *(_WORD *)&v54[6] = *((_WORD *)v12 + 2);
          *(_DWORD *)&v54[2] = v45;
          *(_DWORD *)&v54[8] = *(_DWORD *)(a1 + 28);
          *(_WORD *)&v54[12] = *(_WORD *)(a1 + 32);
          *(_DWORD *)&v54[14] = *(_DWORD *)&v54[8];
          *(_WORD *)&v54[18] = *(_WORD *)&v54[12];
          *(_WORD *)&v54[22] = 273;
          v54[24] = v41;
          v54[25] = v34;
          __int128 v46 = *(_OWORD *)(v25 + 14);
          __int128 v47 = *(_OWORD *)(v25 + 30);
          __int128 v48 = *(_OWORD *)(v25 + 45);
          *(_OWORD *)&v54[26] = *(_OWORD *)(v25 - 2);
          *(_OWORD *)&v54[73] = v48;
          *(_OWORD *)&v54[58] = v47;
          *(_OWORD *)&v54[42] = v46;
        }

        else
        {
          sub_100016E40(1LL, "WMM: TSPEC overflow in ADDTS Request", v19, v20, v21, v22, v23, v24, v49);
        }

        return;
      }

      uint64_t v26 = "hostapd_wmm_action - missing or wrong length tspec";
    }

    sub_1000172B0(a1, v12, 1LL, 1LL, v26, v22, v23, v24, v49);
  }

void sub_1000072E8()
{
  if (qword_10003C4A8)
  {
    xpc_connection_cancel((xpc_connection_t)qword_10003C4A8);
    xpc_release((xpc_object_t)qword_10003C4A8);
  }

uint64_t sub_100007320()
{
  uint64_t v4 = 0LL;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  char v7 = 0;
  v0 = dispatch_semaphore_create(0LL);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  void v3[2] = sub_100007418;
  v3[3] = &unk_100038688;
  v3[4] = &v4;
  v3[5] = v0;
  qword_10003C4A8 = (uint64_t)xpc_connection_create_mach_service("com.apple.wifi.hostapd", 0LL, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000LL;
  handler[2] = sub_1000074F0;
  handler[3] = &unk_1000386B0;
  handler[4] = v3;
  xpc_connection_set_event_handler((xpc_connection_t)qword_10003C4A8, handler);
  xpc_connection_activate((xpc_connection_t)qword_10003C4A8);
  dispatch_semaphore_wait(v0, 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

uint64_t sub_100007418(uint64_t a1, char a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_10000742C()
{
  if (qword_10003C308)
  {
    xpc_release((xpc_object_t)qword_10003C308);
    qword_10003C308 = 0LL;
  }

uint64_t sub_100007458(uint64_t result)
{
  qword_10003C310 = result;
  return result;
}

void sub_100007464( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10003C318)
  {
    sub_100016E40( 2LL,  "%s sending terminate event begin",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"xpc_reply_to_terminate_event");
    xpc_object_t reply = xpc_dictionary_create_reply((xpc_object_t)qword_10003C318);
    remote_connection = xpc_dictionary_get_remote_connection((xpc_object_t)qword_10003C318);
    xpc_connection_send_message(remote_connection, reply);
    xpc_release((xpc_object_t)qword_10003C318);
    qword_10003C318 = 0LL;
    sub_100016E40( 2LL,  "%s sending terminate event done",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"xpc_reply_to_terminate_event");
  }

void sub_1000074F0(uint64_t a1, _xpc_connection_s *object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_get_audit_token(object, &handler);
    audit_token_t token = handler;
    uint64_t v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
    if (v4)
    {
      uint64_t v5 = v4;
      CFTypeRef v6 = SecTaskCopyValueForEntitlement(v4, @"com.apple.wifi.hostapd", 0LL);
      if (v6)
      {
        char v7 = (void *)v6;
        CFTypeID TypeID = CFBooleanGetTypeID();
        if (TypeID == CFGetTypeID(v7))
        {
          int v9 = CFEqual(v7, kCFBooleanTrue);
          CFRelease(v5);
          CFRelease(v7);
          if (v9)
          {
            *(void *)handler.val = _NSConcreteStackBlock;
            *(void *)&handler.val[2] = 0x40000000LL;
            *(void *)&handler.val[4] = sub_100007648;
            *(void *)&handler.val[6] = &unk_1000386D8;
            uint64_t v12 = v3;
            xpc_connection_set_event_handler(object, &handler);
            xpc_connection_activate(object);
            return;
          }

          goto LABEL_10;
        }

        CFRelease(v5);
        uint64_t v10 = (__SecTask *)v7;
      }

      else
      {
        uint64_t v10 = v5;
      }

      CFRelease(v10);
    }

LABEL_10:
    xpc_connection_cancel(object);
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0LL);
  }

                sub_10000A32C((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                goto LABEL_21;
              }

              switch(*((_DWORD *)a1 + 6))
              {
                case 1:
                  goto LABEL_10;
                case 2:
                  goto LABEL_6;
                case 3:
                  goto LABEL_17;
                case 4:
                  uint64_t v15 = *((_DWORD *)a1 + 80);
                  if (v15 != 1 && v15 != 128 && v15 != 32) {
                    goto LABEL_56;
                  }
                  uint64_t v16 = *(int (**)(void, _BYTE *, uint64_t))(v11 + 184);
                  if (!v16) {
                    goto LABEL_56;
                  }
                  if (v16(*(void *)(v11 + 144), a1 + 16, 4LL) > 0) {
                    goto LABEL_89;
                  }
                  uint64_t v15 = *((_DWORD *)a1 + 80);
LABEL_56:
                  if (v15 > 255)
                  {
                    if (v15 == 256) {
                      goto LABEL_90;
                    }
                    if (v15 == 1024) {
LABEL_89:
                    }
                      sub_10000A678(a1, a2, a3, a4, a5, a6, a7, a8);
                  }

                  else if (v15 == 2 || v15 == 64)
                  {
LABEL_90:
                    sub_10000A7CC((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                    break;
                  }

                  break;
                case 5:
                  uint64_t v17 = *(int (**)(void, _BYTE *, uint64_t))(v11 + 184);
                  if (v17 && v17(*(void *)(v11 + 144), a1 + 16, 5LL) > 0 || *((_DWORD *)a1 + 80) == 1024) {
                    goto LABEL_20;
                  }
                  goto LABEL_79;
                case 6:
                  unint64_t v18 = *(uint64_t (**)(void, _BYTE *, void))(v11 + 192);
                  uint64_t v19 = v11;
                  if (!v18) {
                    goto LABEL_69;
                  }
                  if (v18(*(void *)(v11 + 144), a1 + 16, 0LL)) {
                    goto LABEL_20;
                  }
                  uint64_t v19 = *(void *)a1;
LABEL_69:
                  sub_10000774C(v19, a1 + 16, 1LL, (uint64_t)"no PSK configured for the STA");
                  goto LABEL_79;
                case 7:
                  if (a1[49] && !a1[51] && a1[50]) {
                    goto LABEL_92;
                  }
                  goto LABEL_79;
                case 8:
                  if (a1[52])
                  {
                    sub_10000AB28((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                    break;
                  }

                  if (a1[49] && !a1[51] && a1[50])
                  {
LABEL_92:
                    sub_10000A86C((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                  }

                  else
                  {
LABEL_85:
                    if (a1[48]) {
                      goto LABEL_20;
                    }
                  }

                  break;
                case 9:
                  goto LABEL_81;
                case 0xA:
                  if (a1[49] && !a1[51] && a1[50] && a1[52])
                  {
                    sub_10000AE78((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                  }

                  else
                  {
                    if (*((int *)a1 + 10) >= 5)
                    {
LABEL_79:
                      ++*(_DWORD *)(v11 + 56);
                      goto LABEL_8;
                    }

                    if (a1[48]) {
LABEL_81:
                    }
                      sub_10000AB98((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                  }

                  break;
                default:
                  break;
              }
            }
          }

  if ((v11 & 1) != 0)
  {
    *(_DWORD *)uint64_t v13 = 11276032;
    v13 += 4LL;
    LOBYTE(v12) = v12 + 1;
  }

  else if (!v12)
  {
    sub_100016E40(1LL, "Invalid pairwise cipher (%d).", a3, (uint64_t)a4, a5, a6, a7, a8, v11);
    return 0xFFFFFFFFLL;
  }

  *(_BYTE *)(a2 + 9) = 0;
  *(_BYTE *)(a2 + 8) = v12;
  uint64_t v14 = a1[1];
  if ((v14 & 1) != 0)
  {
    *(_DWORD *)(v13 + 2) = 28053248;
    uint64_t v16 = v13 + 6;
    uint64_t v14 = a1[1];
    uint64_t v15 = 1;
    if ((v14 & 2) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  uint64_t v15 = 0;
  uint64_t v16 = v13 + 2;
  if ((v14 & 2) != 0)
  {
LABEL_18:
    *(_DWORD *)uint64_t v16 = 44830464;
    v16 += 4LL;
    ++v15;
    uint64_t v14 = a1[1];
  }

    if (v6 >= 0x14) {
      uint64_t v15 = 20LL;
    }
    else {
      uint64_t v15 = v6;
    }
    memcpy(a5, &__src, v15);
    a5 += v15;
    v6 -= v15;
    if (!v6) {
      return 0LL;
    }
  }

  DWORD2(v15) = *(_DWORD *)a2;
  WORD6(v15) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(a1 + 792) = 74;
  *(_DWORD *)(a1 + 800) = 20;
  *(void *)(a1 + 808) = &v15;
  return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
}

xpc_type_t sub_100007648(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = *(void *)(a1 + 32);
  xpc_type_t result = xpc_get_type(object);
  if (result == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_value(object, "Terminate"))
    {
      sub_100016E40( 2LL,  "%s received terminate event",  v5,  v6,  v7,  v8,  v9,  v10,  (uint64_t)"__xpc_connection_handle_request");
      qword_10003C318 = (uint64_t)xpc_retain(object);
      if (qword_10003C310)
      {
        sub_100026730((__CFRunLoop *)qword_10003C310);
        qword_10003C310 = 0LL;
      }

      return (xpc_type_t)sub_100016E40( 2LL,  "%s received terminate event - loop terminated",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)"__xpc_connection_handle_request");
    }

    else
    {
      qword_10003C308 = (uint64_t)xpc_retain(object);
      return (xpc_type_t)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1LL);
    }
  }

  return result;
}

uint64_t sub_10000771C(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 248);
  if (v1) {
    return v1(*(void *)(a1 + 144));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100007734(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(void))(a1 + 256);
  if (v1) {
    return v1(*(void *)(a1 + 144));
  }
  else {
    return 0LL;
  }
}

void sub_10000774C(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = (os_log_s *)qword_10003C320;
  if (!qword_10003C320)
  {
    uint64_t v8 = os_log_create("com.apple.hostapd", "wpa_auth");
    qword_10003C320 = (uint64_t)v8;
    if (!v8) {
      goto LABEL_9;
    }
  }

  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v9) {
      goto LABEL_9;
    }
    int v10 = *a2;
    int v11 = a2[1];
    int v12 = a2[2];
    int v13 = a2[3];
    int v14 = a2[4];
    int v15 = a2[5];
    int v20 = 67110658;
    *(_DWORD *)uint64_t v21 = v10;
    *(_WORD *)&v21[4] = 1024;
    *(_DWORD *)&v21[6] = v11;
    __int16 v22 = 1024;
    int v23 = v12;
    __int16 v24 = 1024;
    int v25 = v13;
    __int16 v26 = 1024;
    int v27 = v14;
    __int16 v28 = 1024;
    int v29 = v15;
    __int16 v30 = 2082;
    uint64_t v31 = a4;
    uint64_t v16 = "STA %02x:%02x:%02x:%02x:%02x:%02x %{public}s";
    uint64_t v17 = v8;
    uint32_t v18 = 48;
  }

  else
  {
    if (!v9) {
      goto LABEL_9;
    }
    int v20 = 136446210;
    *(void *)uint64_t v21 = a4;
    uint64_t v16 = "%{public}s";
    uint64_t v17 = v8;
    uint32_t v18 = 12;
  }

  _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, v18);
LABEL_9:
  uint64_t v19 = *(void (**)(void, unsigned __int8 *, uint64_t, uint64_t))(a1 + 152);
  if (v19) {
    v19(*(void *)(a1 + 144), a2, a3, a4);
  }
}

void sub_1000078D0(uint64_t a1, unsigned __int8 *a2, uint64_t a3, char *__s, ...)
{
  if (*(void *)(a1 + 152))
  {
    size_t v8 = (int)(strlen(__s) + 100);
    BOOL v9 = (char *)malloc(v8);
    if (v9)
    {
      int v10 = v9;
      vsnprintf(v9, v8, __s, va);
      sub_10000774C(a1, a2, a3, (uint64_t)v10);
      free(v10);
    }
  }

unsigned int *sub_10000796C(int *a1, uint64_t a2, __int128 *a3)
{
  uint64_t v6 = (char *)sub_100016B98(0x138uLL);
  int v14 = (unsigned int *)v6;
  if (!v6) {
    return v14;
  }
  int v15 = *a1;
  *((_WORD *)v6 + 146) = *((_WORD *)a1 + 2);
  *((_DWORD *)v6 + 72) = v15;
  __int128 v17 = *(_OWORD *)(a2 + 32);
  __int128 v16 = *(_OWORD *)(a2 + 48);
  int v18 = *(_DWORD *)(a2 + 64);
  *(_OWORD *)(v6 + 88) = *(_OWORD *)(a2 + 16);
  *((_DWORD *)v6 + 34) = v18;
  *(_OWORD *)(v6 + 120) = v16;
  *(_OWORD *)(v6 + 104) = v17;
  *(_OWORD *)(v6 + 72) = *(_OWORD *)a2;
  __int128 v19 = a3[7];
  __int128 v21 = a3[4];
  __int128 v20 = a3[5];
  *((_OWORD *)v6 + 15) = a3[6];
  *((_OWORD *)v6 + 16) = v19;
  *((_OWORD *)v6 + 13) = v21;
  *((_OWORD *)v6 + 14) = v20;
  __int128 v22 = *a3;
  __int128 v23 = a3[1];
  __int128 v24 = a3[3];
  *((_OWORD *)v6 + 11) = a3[2];
  *((_OWORD *)v6 + 12) = v24;
  *((_OWORD *)v6 + 9) = v22;
  *((_OWORD *)v6 + 10) = v23;
  if (sub_10000BEE8((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13))
  {
    sub_100016E40(4LL, "Could not generate WPA IE.", v25, v26, v27, v28, v29, v30, v42);
LABEL_12:
    free(v14);
    return 0LL;
  }

  uint64_t v31 = sub_100007AB4((uint64_t)v14, 0);
  *(void *)int v14 = v31;
  if (!v31)
  {
LABEL_11:
    free(*((void **)v14 + 34));
    goto LABEL_12;
  }

  uint64_t v32 = sub_100005928((uint64_t)sub_100007C08, (uint64_t)v14);
  *((void *)v14 + 37) = v32;
  if (!v32)
  {
    sub_100016E40(4LL, "PMKSA cache initialization failed.", v33, v34, v35, v36, v37, v38, v42);
    goto LABEL_11;
  }

  unsigned int v39 = v14[24];
  if (v39) {
    sub_100026220(v39, 0, (uint64_t)sub_100007C28, (uint64_t)v14, 0LL);
  }
  unsigned int v40 = v14[22];
  if (v40) {
    sub_100026220(v40, 0, (uint64_t)sub_100007CAC, (uint64_t)v14, 0LL);
  }
  return v14;
}

_BYTE *sub_100007AB4(uint64_t a1, int a2)
{
  uint64_t v4 = sub_100016B98(0xF8uLL);
  uint64_t v5 = v4;
  if (v4)
  {
    v4[36] = 1;
    *((_DWORD *)v4 + 2) = a2;
    HIDWORD(v7) = *(_DWORD *)(a1 + 84);
    LODWORD(v7) = HIDWORD(v7) - 2;
    unsigned int v6 = v7 >> 1;
    if (v6 <= 7 && ((0x8Bu >> v6) & 1) != 0) {
      *((_DWORD *)v4 + 6) = dword_10002AE30[v6];
    }
    int v28 = *(_DWORD *)(a1 + 288);
    __int16 v29 = *(_WORD *)(a1 + 292);
    sub_1000163F4(&v30);
    uint64_t v31 = v5;
    if (sub_10001691C(v27, 0x20uLL) || sub_10001691C(v5 + 76, 0x20uLL))
    {
      sub_100016E40(4LL, "Failed to get random data for WPA initialization.", v8, v9, v10, v11, v12, v13, v27[0]);
      free(v5);
      return 0LL;
    }

    else
    {
      sub_10000F64C((char *)v27, 0x20uLL, "Init Counter", (uint64_t)&v28, 22LL, (uint64_t)(v5 + 37), 0x20uLL);
      v5[12] = 1;
      sub_100007E70(a1, (uint64_t)v5, v15, v16, v17, v18, v19, v20);
      v5[12] = 0;
      sub_100007E70(a1, (uint64_t)v5, v21, v22, v23, v24, v25, v26);
    }
  }

  return v5;
}

uint64_t sub_100007C08(uint64_t result, uint64_t a2)
{
  char v2 = *(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t), uint64_t))(a2 + 248);
  if (v2) {
    return v2(*(void *)(a2 + 144), sub_100009EE4, result);
  }
  return result;
}

uint64_t sub_100007C28(unsigned int *a1)
{
  else {
    sub_10000774C((uint64_t)a1, 0LL, 0LL, (uint64_t)"GMK rekeyd");
  }
  uint64_t result = a1[24];
  if ((_DWORD)result) {
    return sub_100026220(result, 0, (uint64_t)sub_100007C28, (uint64_t)a1, 0LL);
  }
  return result;
}

uint64_t sub_100007CAC(uint64_t a1)
{
  for (uint64_t i = *(void *)a1; i; uint64_t i = *(void *)i)
  {
    *(_BYTE *)(i + 20) = 1;
    do
    {
      *(_BYTE *)(i + 204) = 0;
      sub_100007E70(a1, i, v2, v3, v4, v5, v6, v7);
    }

    while (*(_BYTE *)(i + 204));
  }

  uint64_t result = *(unsigned int *)(a1 + 88);
  if ((_DWORD)result) {
    return sub_100026220(result, 0, (uint64_t)sub_100007CAC, a1, 0LL);
  }
  return result;
}

void sub_100007D40( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v21 = *(void **)a1;
  if (*(void *)a1)
  {
    do
    {
      uint64_t v22 = (void *)*v21;
      free(v21);
      uint64_t v21 = v22;
    }

    while (v22);
  }

  free((void *)a1);
}

uint64_t sub_100007DB0( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    *(_OWORD *)(result + 72) = *(_OWORD *)a2;
    __int128 v9 = *(_OWORD *)(a2 + 16);
    __int128 v10 = *(_OWORD *)(a2 + 32);
    __int128 v11 = *(_OWORD *)(a2 + 48);
    *(_DWORD *)(result + 136) = *(_DWORD *)(a2 + 64);
    *(_OWORD *)(result + 120) = v11;
    *(_OWORD *)(result + 104) = v10;
    *(_OWORD *)(result + 88) = v9;
    if (sub_10000BEE8(result, a2, a3, a4, a5, a6, a7, a8))
    {
      sub_100016E40(4LL, "Could not generate WPA IE.", v12, v13, v14, v15, v16, v17, v27);
      return 0xFFFFFFFFLL;
    }

    else
    {
      uint64_t v18 = *(void *)v8;
      HIDWORD(v20) = *(_DWORD *)(v8 + 84);
      LODWORD(v20) = HIDWORD(v20) - 2;
      unsigned int v19 = v20 >> 1;
      if (v19 <= 7 && ((0x8Bu >> v19) & 1) != 0) {
        *(_DWORD *)(v18 + 24) = dword_10002AE30[v19];
      }
      *(_BYTE *)(v18 + 12) = 1;
      sub_100007E70(v8, v18, v12, v13, v14, v15, v16, v17);
      *(_BYTE *)(v18 + 12) = 0;
      sub_100007E70(v8, v18, v21, v22, v23, v24, v25, v26);
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100007E70( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = result;
  if (*(_BYTE *)(a2 + 12))
  {
    sub_100016E40( 1LL,  "WPA: group state machine entering state GTK_INIT (VLAN-ID %d)",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned int *)(a2 + 8));
    *(_BYTE *)(a2 + 204) = 0;
    *(_DWORD *)(a2 + 72) = 0;
    *(_OWORD *)(a2 + 108) = 0u;
    *(_OWORD *)(a2 + 124) = 0u;
    *(_OWORD *)(a2 + 140) = 0u;
    *(_OWORD *)(a2 + 156) = 0u;
    *(void *)(a2 + 28) = 0x200000001LL;
    *(void *)(a2 + 240) = 0x500000004LL;
    return sub_100009688(v9, a2);
  }

  int v10 = *(_DWORD *)(a2 + 72);
  if (v10 != 2)
  {
    if (v10 != 1)
    {
      if (v10 || !*(_BYTE *)(a2 + 36)) {
        return result;
      }
      return sub_100009EFC(result, a2, a3, a4, a5, a6, a7, a8);
    }

    if (!*(_DWORD *)(a2 + 16)) {
      return sub_100009EFC(result, a2, a3, a4, a5, a6, a7, a8);
    }
  }

  if (*(_BYTE *)(a2 + 20)) {
    return sub_100009FE8(result, a2, a3, a4, a5, a6, a7, a8);
  }
  return result;
}

_WORD *sub_100007F68(uint64_t *a1, int *a2)
{
  uint64_t result = sub_100016B98(0x260uLL);
  if (result)
  {
    int v5 = *a2;
    result[10] = *((_WORD *)a2 + 2);
    *((_DWORD *)result + 4) = v5;
    uint64_t v6 = *a1;
    *(void *)uint64_t result = a1;
    *((void *)result + 1) = v6;
  }

  return result;
}

uint64_t sub_100007FAC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = 0xFFFFFFFFLL;
  if (!a2 || !*(_DWORD *)(a1 + 72)) {
    return v9;
  }
  if ((*(_BYTE *)(a2 + 280) & 8) != 0)
  {
    *(_DWORD *)(a2 + 253) = 0;
    *(_OWORD *)(a2 + 237) = 0u;
    *(_OWORD *)(a2 + 221) = 0u;
    *(_BYTE *)(a2 + 35) = 1;
    return sub_100008054((_BYTE *)a2, a2, a3, a4, a5, a6, a7, a8);
  }

  sub_10000774C(a1, (unsigned __int8 *)(a2 + 16), 0LL, (uint64_t)"start authentication");
  *(_BYTE *)(a2 + 280) |= 8u;
  uint64_t v9 = 1LL;
  *(_BYTE *)(a2 + memset(&v9[1], 0, 32) = 1;
  *(_BYTE *)(a2 + memset(&v9[1], 0, 32) = 0;
  *(_BYTE *)(a2 + 34) = 1;
  return sub_100008054((_BYTE *)a2, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_100008054( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    if ((a1[280] & 2) != 0)
    {
      sub_100016E40(4LL, "WPA: wpa_sm_step() called recursively", a3, a4, a5, a6, a7, a8, v22);
    }

    else
    {
      char v9 = a1[280] | 2;
      if ((a1[280] & 4) == 0)
      {
        uint64_t v10 = a1 + 150;
        while (1)
        {
          a1[280] = v9 & 0xFE;
          uint64_t v11 = *(void *)a1;
          *(_BYTE *)(**(void **)a1 + 204LL) = 0;
          if (a1[32])
          {
LABEL_6:
            sub_10000A124(a1, a2, a3, a4, a5, a6, a7, a8);
          }

          else if (a1[36])
          {
LABEL_8:
            sub_10000A284((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
          }

          else
          {
            if (a1[33]) {
              goto LABEL_10;
            }
            if (a1[34])
            {
              a1[280] |= 1u;
              sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state AUTHENTICATION",  a3,  a4,  a5,  a6,  a7,  a8,  a1[16]);
              *((_DWORD *)a1 + 6) = 3;
              _OWORD *v10 = 0u;
              *(_OWORD *)(a1 + 166) = 0u;
              *(_OWORD *)(a1 + 182) = 0u;
              *(_OWORD *)(a1 + 198) = 0u;
              a1[214] = 0;
              uint64_t v12 = *(void (**)(void, _BYTE *, uint64_t, uint64_t))(*(void *)a1 + 176LL);
              if (v12)
              {
                v12(*(void *)(*(void *)a1 + 144LL), a1 + 16, 3LL, 1LL);
                uint64_t v13 = *(void (**)(void, _BYTE *, void, uint64_t))(*(void *)a1 + 176LL);
                if (v13) {
                  v13(*(void *)(*(void *)a1 + 144LL), a1 + 16, 0LL, 1LL);
                }
              }

              a1[34] = 0;
            }

            else
            {
              if (a1[35])
              {
LABEL_17:
                sub_10000A39C((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                goto LABEL_21;
              }

              if (a1[258])
              {
                if ((sub_10000A430((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8) & 0x80000000) == 0)
                {
LABEL_20:
                  sub_10000A4A0((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                  goto LABEL_21;
                }

LABEL_21:
          char v9 = a1[280];
          if ((v9 & 4) != 0) {
            break;
          }
          if (a1[32] || a1[260])
          {
            sub_10000B194((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
            a1[260] = 0;
          }

          else
          {
            switch(*((_DWORD *)a1 + 7))
            {
              case 0:
                if (a1[53] || *((_DWORD *)a1 + 78) == 1 && a1[257]) {
                  goto LABEL_48;
                }
                break;
              case 1:
                if (!a1[49] || a1[51] || a1[50] || !a1[52])
                {
                  if (*((int *)a1 + 11) < 5)
                  {
                    if (a1[48]) {
LABEL_48:
                    }
                      sub_10000B214((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                  }

                  else
                  {
                    a1[280] = v9 | 1;
                    sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK_GROUP entering state KEYERROR",  a3,  a4,  a5,  a6,  a7,  a8,  a1[16]);
                    *((_DWORD *)a1 + 7) = 3;
                    if (a1[53]) {
                      --*(_DWORD *)(*((void *)a1 + 1) + 16LL);
                    }
                    a1[53] = 0;
                    a1[36] = 1;
                  }
                }

                else
                {
                  sub_10000B428((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                }

                break;
              case 2:
              case 3:
                sub_10000B194((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
                break;
              default:
                break;
            }
          }

          char v9 = a1[280];
          if ((v9 & 4) != 0) {
            break;
          }
          sub_100007E70(*(void *)a1, *((void *)a1 + 1), a3, a4, a5, a6, a7, a8);
          char v9 = a1[280];
          if ((v9 & 1) != 0)
          {
            if ((a1[280] & 4) != 0) {
              break;
            }
          }

          else
          {
            if (*(_BYTE *)(**(void **)a1 + 204LL)) {
              BOOL v14 = (v9 & 4) == 0;
            }
            else {
              BOOL v14 = 0;
            }
            if (!v14) {
              break;
            }
          }
        }
      }

      a1[280] = v9 & 0xFD;
      if ((v9 & 4) != 0)
      {
        uint64_t v20 = 1LL;
        sub_100016E40( 1LL,  "WPA: Completing pending STA state machine deinit for %02x:%02x:%02x:%02x:%02x:%02x",  a3,  a4,  a5,  a6,  a7,  a8,  a1[16]);
        sub_100008768((void **)a1);
        return v20;
      }
    }
  }

  return 0LL;
}

      ++v6;
    }

    while (v6 < a1[4]);
  }

  return result;
}

uint64_t sub_100008598(uint64_t result)
{
  if (result) {
    *(_DWORD *)(result + 320) = 0;
  }
  return result;
}

void sub_1000085A4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v9 = *(void *)a1;
    if (*(_DWORD *)(*(void *)a1 + 92LL) && *(_BYTE *)(a1 + 259))
    {
      sub_100026438((uint64_t)sub_100007CAC, v9, 0LL, a4, a5, a6, a7, a8);
      sub_100026220(0, 0x7A120u, (uint64_t)sub_100007CAC, *(void *)a1, 0LL);
      uint64_t v9 = *(void *)a1;
    }

    sub_100026438((uint64_t)sub_1000086A8, v9, a1, a4, a5, a6, a7, a8);
    sub_100026438((uint64_t)sub_100008720, a1, 0LL, v10, v11, v12, v13, v14);
    sub_100026438((uint64_t)sub_100008724, *(void *)a1, a1, v15, v16, v17, v18, v19);
    if ((*(_BYTE *)(a1 + 280) & 2) != 0)
    {
      sub_100016E40( 1LL,  "WPA: Registering pending STA state machine deinit for %02x:%02x:%02x:%02x:%02x:%02x",  v20,  v21,  v22,  v23,  v24,  v25,  *(unsigned __int8 *)(a1 + 16));
      *(_BYTE *)(a1 + 280) |= 4u;
    }

    else
    {
      sub_100008768((void **)a1);
    }
  }

uint64_t sub_1000086A8( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    return sub_100016E40(1LL, "%s: sm == NULL!", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_send_eapol_timeout");
  }
  sub_10000774C(a1, a2 + 16, 0LL, (uint64_t)"EAPOL-Key timeout");
  a2[229] = 0;
  a2[48] = 1;
  return sub_100008054(a2);
}

uint64_t sub_100008724(uint64_t a1, _BYTE *a2)
{
  if (a2)
  {
    a2[258] = 1;
    a2[214] = 0;
  }

  return sub_100008054(a2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_100008768(void **a1)
{
}

void sub_100008798( uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v75 = 0LL;
  __s2 = 0LL;
  if (!a1 || a4 < 0x63 || !a2 || !*(_DWORD *)(a1 + 72)) {
    return;
  }
  unint64_t v12 = __rev16(*(unsigned __int16 *)(a3 + 97));
  if (a4 - 99 < v12)
  {
    sub_100016E40(2LL, "WPA: Invalid EAPOL-Key frame - key_data overflow (%d > %lu)", a3, a4, a5, a6, a7, a8, v12);
    return;
  }

  int v13 = *(unsigned __int8 *)(a3 + 5);
  char v14 = *(_BYTE *)(a3 + 6);
  int v15 = *(unsigned __int8 *)(a3 + 4);
  if (*(_DWORD *)(a2 + 312) == 2)
  {
    if (v15 != 2)
    {
      sub_100016E40( 1LL,  "Ignore EAPOL-Key with unexpected type %d in RSN mode",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a3 + 4));
      return;
    }
  }

  else if (v15 != 254)
  {
    sub_100016E40( 1LL,  "Ignore EAPOL-Key with unexpected type %d in WPA mode",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a3 + 4));
    return;
  }

  if ((~v13 & 0x28) == 0)
  {
    int v16 = (v13 & 4) >> 2;
    if ((v13 & 4) != 0) {
      uint64_t v17 = "SMK Error";
    }
    else {
      uint64_t v17 = "SMK M1";
    }
    if ((v13 & 4) != 0) {
      int v18 = 6;
    }
    else {
      int v18 = 4;
    }
    goto LABEL_25;
  }

  if ((v13 & 0x20) != 0)
  {
    LOBYTE(v16) = 0;
    uint64_t v17 = "SMK M3";
    int v18 = 5;
    goto LABEL_25;
  }

  if ((v13 & 8) != 0)
  {
    int v18 = 3;
    uint64_t v17 = "Request";
  }

  else if ((*(_BYTE *)(a3 + 6) & 8) != 0)
  {
    int v18 = v12 == 0;
    if ((_DWORD)v12) {
      uint64_t v17 = "2/4 Pairwise";
    }
    else {
      uint64_t v17 = "4/4 Pairwise";
    }
  }

  else
  {
    int v18 = 2;
    uint64_t v17 = "2/2 Group";
  }

  int v41 = v14 & 7;
  int v42 = *(_DWORD *)(a2 + 320);
  if (*(_DWORD *)(a2 + 316) == 16)
  {
    if (v42 == 256 || v42 == 128)
    {
      if (v41 != 3)
      {
        uint64_t v33 = (unsigned __int8 *)(a2 + 16);
        uint64_t v34 = "advertised support for AES-128-CMAC, but did not use it";
        goto LABEL_80;
      }

      LOBYTE(v16) = 0;
      goto LABEL_25;
    }

    if (v42 != 1024 && v41 != 2)
    {
      uint64_t v33 = (unsigned __int8 *)(a2 + 16);
      uint64_t v34 = "did not use HMAC-SHA1-AES with CCMP";
      goto LABEL_80;
    }
  }

  LOBYTE(v16) = 0;
  if (v42 == 1024 && (v14 & 7) != 0)
  {
    uint64_t v33 = (unsigned __int8 *)(a2 + 16);
    uint64_t v34 = "did not use EAPOL-Key descriptor version 0 as required for AKM-defined cases";
    goto LABEL_80;
  }

LABEL_97:
          free(*(void **)(a2 + 264));
          __int16 v53 = malloc(a4);
          *(void *)(a2 + 264) = v53;
          if (v53)
          {
            memcpy(v53, (const void *)a3, a4);
            *(void *)(a2 + 272) = a4;
            *(_BYTE *)(a2 + 49) = 1;
            *(_BYTE *)(a2 + 50) = (v14 & 8) != 0;
            *(_BYTE *)(a2 + 51) = (v13 & 8) >> 3;
            __int128 v54 = *(_OWORD *)(a3 + 17);
            *(_OWORD *)(a2 + 102) = *(_OWORD *)(a3 + 33);
            *(_OWORD *)(a2 + 86) = v54;
            sub_100008054((_BYTE *)a2, v55, v56, v57, v58, v59, v60, v61);
          }

          return;
      }
    }

    uint64_t v33 = (unsigned __int8 *)(a2 + 16);
    uint64_t v34 = "received EAPOL-Key request with replayed counter";
LABEL_80:
    sub_10000774C(a1, v33, 2LL, (uint64_t)v34);
    return;
  }

  uint64_t v19 = 0LL;
  uint64_t v20 = (unsigned __int8 *)(a3 + 9);
  do
  {
    if (!*(_BYTE *)(a2 + v19 + 229)) {
      break;
    }
    if (*(void *)v20 == *(void *)(a2 + v19 + 221)) {
      goto LABEL_39;
    }
    v19 += 9LL;
  }

  while (v19 != 36);
  sub_1000078D0(a1, (unsigned __int8 *)(a2 + 16), 1LL, "received EAPOL-Key %s with unexpected replay counter", v17);
  for (uint64_t i = 0LL; i != 36; i += 9LL)
  {
    if (!*(_BYTE *)(a2 + i + 229)) {
      break;
    }
    sub_100016EB0(1LL, "pending replay counter", (unsigned __int8 *)(a2 + i + 221), 8LL);
  }

  sub_100016EB0(1LL, "received replay counter", v20, 8LL);
}

uint64_t sub_100008EC4(unsigned int *a1, uint64_t a2, unint64_t a3)
{
  if (a3 < 0x63) {
    return 0xFFFFFFFFLL;
  }
  char v4 = *(_BYTE *)(a2 + 6);
  uint64_t v5 = (void *)(a2 + 81);
  __int128 v8 = *(_OWORD *)(a2 + 81);
  *(void *)(a2 + 81) = 0LL;
  *(void *)(a2 + 89) = 0LL;
  sub_10000D238(a1, v4 & 7, (char *)a2, a3, (_DWORD *)(a2 + 81));
  if (!v6 && ((void)v8 == *v5 ? (BOOL v7 = *((void *)&v8 + 1) == v5[1]) : (BOOL v7 = 0), v7)) {
    uint64_t result = 0LL;
  }
  else {
    uint64_t result = 0xFFFFFFFFLL;
  }
  *(_OWORD *)uint64_t v5 = v8;
  return result;
}

void sub_100008F78( uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4, __n128 *a5, uint64_t a6, size_t a7, uint64_t a8, int a9, unsigned int a10)
{
  __int16 v10 = a8;
  __int16 v13 = a3;
  uint64_t v16 = a10;
  if (!a10)
  {
    int v17 = *((_DWORD *)a2 + 80);
    if (v17 == 128 || v17 == 256)
    {
      uint64_t v16 = 3LL;
    }

    else if (v17 == 1024)
    {
      uint64_t v16 = 0LL;
    }

    else if (*((_DWORD *)a2 + 79) == 16)
    {
      uint64_t v16 = 2LL;
    }

    else
    {
      uint64_t v16 = 1LL;
    }
  }

  int v18 = a3 & 8;
  sub_100016E40( 1LL,  "WPA: Send EAPOL(version=%d secure=%d mic=%d ack=%d install=%d pairwise=%d kde_len=%lu keyidx=%d encr=%d)",  a3,  (uint64_t)a4,  (uint64_t)a5,  a6,  a7,  a8,  v16);
  uint64_t v58 = (const void *)a6;
  if ((_DWORD)v16 == 2)
  {
    uint64_t v19 = a1;
    if (!a9)
    {
      int v54 = 0;
LABEL_29:
      int v26 = a7;
      goto LABEL_30;
    }
  }

  else
  {
    int v20 = *((_DWORD *)a2 + 80);
    HIDWORD(v22) = v20;
    LODWORD(v22) = v20 - 32;
    unsigned int v21 = v22 >> 5;
    if (v21 < 8 && ((0x8Bu >> v21) & 1) != 0)
    {
      uint64_t v19 = a1;
      BOOL v23 = 1;
    }

    else
    {
      uint64_t v19 = a1;
      BOOL v23 = v20 == 1024;
    }

    if ((_DWORD)v16 == 3) {
      BOOL v23 = 1;
    }
    if (!a9 || !v23)
    {
      int v54 = 0;
      goto LABEL_29;
    }
  }

  else {
    int v24 = a7 & 7;
  }
  if (v24) {
    int v25 = 8 - v24;
  }
  else {
    int v25 = 0;
  }
  int v54 = v25;
  int v26 = a7 + v25 + 8;
LABEL_30:
  size_t v27 = v26;
  uint64_t v55 = v26 + 99LL;
  int v28 = (char *)sub_100016B98(v55);
  if (!v28) {
    return;
  }
  uint64_t v29 = v28;
  char *v28 = *(_DWORD *)(v19 + 112);
  v28[1] = 3;
  *((_WORD *)v28 + 1) = bswap32(v27 + 95) >> 16;
  int v30 = *((_DWORD *)a2 + 78);
  if (a9) {
    BOOL v31 = v30 == 2;
  }
  else {
    BOOL v31 = 0;
  }
  __int16 v32 = v16 | v13;
  if (v31) {
    __int16 v32 = v16 | v13 | 0x1000;
  }
  BOOL v33 = v30 == 2;
  if (v30 == 2) {
    char v34 = 2;
  }
  else {
    char v34 = -2;
  }
  v28[4] = v34;
  __int16 v35 = 16 * v10;
  if (v33) {
    __int16 v35 = 0;
  }
  __int16 v36 = v32 | v35;
  v28[5] = (unsigned __int16)(v32 | v35) >> 8;
  v28[6] = v32 | v35;
  uint64_t v37 = a2 + 316;
  if (!v18) {
    uint64_t v37 = (_DWORD *)(v19 + 84);
  }
  HIDWORD(v39) = *v37;
  LODWORD(v39) = *v37 - 2;
  unsigned int v38 = v39 >> 1;
  if (v38 <= 7 && ((0x8Bu >> v38) & 1) != 0)
  {
    v28[7] = 0;
    v28[8] = 0x1010101020100D05uLL >> (8 * v38);
  }

  if ((v36 & 0x2000) != 0) {
    *(_WORD *)(v28 + 7) = 0;
  }
  unsigned int v40 = a2 + 256;
  unint64_t v41 = 4LL;
  int v42 = a2 + 256;
  do
  {
    unsigned __int8 v43 = *(v42 - 9);
    v42 -= 9;
    *unsigned int v40 = v43;
    *((void *)v40 - 1) = *(void *)(v40 - 17);
    --v41;
    unsigned int v40 = v42;
  }

  while (v41 > 1);
  sub_1000163D4((uint64_t)(a2 + 221), 8);
  *(void *)(v29 + 9) = *(void *)(a2 + 221);
  a2[229] = 1;
  if (a5)
  {
    __n128 v44 = *a5;
    *(__n128 *)(v29 + 33) = a5[1];
    *(__n128 *)(v29 + 17) = v44;
  }

  if (a4) {
    *(void *)(v29 + 65) = *a4;
  }
  if (!v58 || a9)
  {
    if (v58 && a9)
    {
      uint64_t v45 = (unsigned __int8 *)sub_100016B98(v27);
      if (!v45)
      {
        free(v29);
        return;
      }

      uint64_t v46 = v45;
      memcpy(v45, v58, a7);
      if (v54) {
        v46[a7] = -35;
      }
      sub_100016F74(1LL, "Plaintext EAPOL-Key Key Data", v46, v27);
      if ((_DWORD)v16 == 2
        || (int v47 = *((_DWORD *)a2 + 80), HIDWORD(v49) = v47, LODWORD(v49) = v47 - 32, v48 = v49 >> 5, v48 <= 7)
        && ((1 << v48) & 0x8B) != 0
        || (_DWORD)v16 == 3
        || v47 == 1024)
      {
        int v50 = v27 - 8;
        if (sub_10000DFBC((unsigned int *)(a2 + 166), v50 >> 3, v46, (uint64_t *)(v29 + 99)))
        {
          free(v29);
          free(v46);
          return;
        }
      }

      else
      {
        *(_OWORD *)(v29 + 49) = *(_OWORD *)(*((void *)a2 + 1) + 53LL);
        sub_1000163D4(*((void *)a2 + 1) + 37LL, 32);
        __int128 v51 = *(_OWORD *)(a2 + 166);
        v59[0] = *(_OWORD *)(v29 + 49);
        v59[1] = v51;
        memcpy(v29 + 99, v46, v27);
        sub_100026B04((uint64_t)v59, 0x20uLL, 0x100uLL, (uint64_t)(v29 + 99), v27);
      }

      *(_WORD *)(v29 + 97) = bswap32(v27) >> 16;
      free(v46);
    }
  }

  else
  {
    memcpy(v29 + 99, v58, a7);
    *(_WORD *)(v29 + 97) = bswap32(a7) >> 16;
  }

  if ((v36 & 0x100) == 0) {
    goto LABEL_77;
  }
  if (a2[214])
  {
    v44.n128_f64[0] = sub_10000D238((unsigned int *)(a2 + 150), v16, v29, v55, v29 + 81);
LABEL_77:
    char v52 = *(void (**)(void, unsigned __int8 *, uint64_t, uint64_t, __n128))(*(void *)a2 + 176LL);
    if (v52) {
      v52(*(void *)(*(void *)a2 + 144LL), a2 + 16, 7LL, 1LL, v44);
    }
    __int16 v53 = *(void (**)(void, unsigned __int8 *, char *, uint64_t, void, __n128))(v19 + 224);
    if (v53) {
      v53(*(void *)(v19 + 144), a2 + 16, v29, v55, a2[215], v44);
    }
    goto LABEL_82;
  }

  sub_10000774C(v19, a2 + 16, 0LL, (uint64_t)"PTK not valid when sending EAPOL-Key frame");
LABEL_82:
  free(v29);
}

uint64_t sub_100009490( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 214) = 0;
  *(_OWORD *)(a1 + 150) = 0u;
  *(_OWORD *)(a1 + 166) = 0u;
  *(_OWORD *)(a1 + 182) = 0u;
  *(_OWORD *)(a1 + 198) = 0u;
  uint64_t v9 = *(void *)a1;
  __int16 v10 = *(void (**)(void, void, void, uint64_t, void, void *, void))(*(void *)a1 + 208LL);
  if (v10)
  {
    v10(*(void *)(v9 + 144), 0LL, 0LL, a1 + 16, 0LL, &unk_10002C2E3, 0LL);
    uint64_t v9 = *(void *)a1;
  }

  *(_BYTE *)(a1 + 215) = 0;
  return sub_100026438((uint64_t)sub_100008724, v9, a1, a4, a5, a6, a7, a8);
}

uint64_t sub_100009508(uint64_t a1, int a2)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  sub_1000078D0(*(void *)a1, (unsigned __int8 *)(a1 + 16), 0LL, "event %d notification", a2);
  if ((a2 - 4) < 2)
  {
    if (*(_BYTE *)(a1 + 53))
    {
      --*(_DWORD *)(*(void *)(a1 + 8) + 16LL);
      *(_BYTE *)(a1 + 53) = 0;
      *(_BYTE *)(a1 + 260) = 1;
    }

    *(_BYTE *)(a1 + 35) = 1;
    *(_BYTE *)(a1 + 214) = 0;
    *(_OWORD *)(a1 + 150) = 0u;
    *(_OWORD *)(a1 + 166) = 0u;
    *(_OWORD *)(a1 + 182) = 0u;
    *(_OWORD *)(a1 + 198) = 0u;
    if (a2 == 5) {
      return sub_100008054((_BYTE *)a1, v4, v5, v6, v7, v8, v9, v10);
    }
  }

  else
  {
    if ((a2 - 2) > 1)
    {
      if (!a2 && (*(_BYTE *)(a1 + 280) & 0x10) != 0) {
        return sub_100008054((_BYTE *)a1, v4, v5, v6, v7, v8, v9, v10);
      }
    }

    else
    {
      *(_BYTE *)(a1 + 33) = 1;
    }

    *(_BYTE *)(a1 + 214) = 0;
    *(_OWORD *)(a1 + 150) = 0u;
    *(_OWORD *)(a1 + 166) = 0u;
    *(_OWORD *)(a1 + 182) = 0u;
    *(_OWORD *)(a1 + 198) = 0u;
  }

  sub_100009490(a1, v4, v5, v6, v7, v8, v9, v10);
  return sub_100008054((_BYTE *)a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000095FC(uint64_t result)
{
  if (result) {
    return sub_100026220(0, 0, (uint64_t)sub_100008720, result, 0LL);
  }
  return result;
}

uint64_t sub_100009620(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)result;
    *(int32x2_t *)(v2 + 28) = vrev64_s32(*(int32x2_t *)(*(void *)result + 28LL));
    *(int32x2_t *)(v2 + 240) = vrev64_s32(*(int32x2_t *)(v2 + 240));
    sub_100009688(result, v2);
    *(int32x2_t *)(v2 + 28) = vrev64_s32(*(int32x2_t *)(v2 + 28));
    *(int32x2_t *)(v2 + 240) = vrev64_s32(*(int32x2_t *)(v2 + 240));
    return sub_100009688(v1, v2);
  }

  return result;
}

uint64_t sub_100009688(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a2 + 172) = *(_OWORD *)(a2 + 37);
  *(_OWORD *)(a2 + 188) = *(_OWORD *)(a2 + 53);
  sub_1000163D4(a2 + 37, 32);
  size_t v4 = *(int *)(a2 + 24);
  uint64_t v5 = (unsigned __int8 *)(a2 + 76 + 32LL * *(int *)(a2 + 28));
  *(_DWORD *)__int16 v13 = *(_DWORD *)(a1 + 288);
  *(_WORD *)&v13[4] = *(_WORD *)(a1 + 292);
  *(_OWORD *)&v13[6] = *(_OWORD *)(a2 + 172);
  __int128 v14 = *(_OWORD *)(a2 + 188);
  sub_10000FE00(a2 + 76, 0x20uLL, "Group key expansion", (uint64_t)v13, 38LL, (uint64_t)v5, v4);
  sub_100016F74(1LL, "GMK", (unsigned __int8 *)(a2 + 76), 32LL);
  uint64_t result = sub_100016F74(1LL, "GTK", v5, v4);
  if (*(_DWORD *)(a1 + 132))
  {
    return sub_100016F74(1LL, "IGTK", (unsigned __int8 *)(a2 + 16LL * *(int *)(a2 + 240) + 141), 16LL);
  }

  return result;
}

uint64_t sub_1000097D8(uint64_t a1, char *__str, size_t __size)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v6 = "TRUE";
  if ((*(_DWORD *)(a1 + 72) & 2) != 0) {
    uint64_t v7 = "TRUE";
  }
  else {
    uint64_t v7 = "FALSE";
  }
  if (!*(_DWORD *)(a1 + 108)) {
    uint64_t v6 = "FALSE";
  }
  uint64_t v8 = snprintf( __str,  __size,  "dot11RSNAOptionImplemented=TRUE\n dot11RSNAPreauthenticationImplemented=FALSE\n dot11RSNAEnabled=%s\n dot11RSNAPreauthenticationEnabled=%s\n",  v7,  v6);
  if ((v8 & 0x80000000) != 0) {
    return 0LL;
  }
  uint64_t v9 = v8;
  sub_100016454(__stra, 33LL, (unsigned __int8 *)(a1 + 24), 16LL);
  HIDWORD(v11) = *(_DWORD *)(a1 + 84);
  LODWORD(v11) = HIDWORD(v11) - 2;
  unsigned int v10 = v11 >> 1;
  if (v10 > 7) {
    int v25 = 0;
  }
  else {
    int v25 = dword_10002AE50[v10];
  }
  unsigned int v13 = *(_DWORD *)(a1 + 12);
  unsigned int v14 = *(_DWORD *)(a1 + 16);
  unsigned int v15 = *(_DWORD *)(a1 + 20);
  unsigned int v16 = *(_DWORD *)(a1 + 40);
  unsigned int v17 = *(_DWORD *)(a1 + 44);
  unsigned int v18 = *(_DWORD *)(a1 + 48);
  size_t v26 = __size - v9;
  unsigned int v19 = snprintf( &__str[v9],  v26,  "dot11RSNAConfigVersion=%u\n dot11RSNAConfigPairwiseKeysSupported=9999\n dot11RSNAConfigGroupRekeyStrict=%u\n dot11RSNAConfigGroupUpdateCount=%u\n dot11RSNAConfigPairwiseUpdateCount=%u\n dot11RSNAConfigGroupCipherSize=%u\n dot11RSNAConfigPMKLifetime=%u\n dot11RSNAConfigPMKReauthThreshold=%u\n dot11RSNAConfigNumberOfPTKSAReplayCounters=0\n dot11RSNAConfigSATimeout=%u\n dot11RSNAAuthenticationSuiteSelected=%02x-%02x-%02x-%d\n dot11RSNAPairwiseCipherSelected=%02x-%02x-%02x-%d\n dot11RSNAGroupCipherSelected=%02x-%02x-%02x-%d\n dot11RSNAPMKIDUsed=%s\n dot11RSNAAuthenticationSuiteRequested=%02x-%02x-%02x-%d\n dot11RSNAPairwiseCipherRequested=%02x-%02x-%02x-%d\n dot11RSNAGroupCipherRequested=%02x-%02x-%02x-%d\n dot11RSNATKIPCounterMeasuresInvoked=%u\n dot11RSNA4WayHandshakeFailures=%u\n dot11RSNAConfigNumberOfGTKSAReplayCounters=0\n",  1,  *(_DWORD *)(a1 + 92) != 0,  4,  4,  v25,  43200,  70,  60,  HIBYTE(v13),  BYTE2(v13),  BYTE1(v13),  v13,  HIBYTE(v14),  BYTE2(v14),  BYTE1(v14),  v14,  HIBYTE(v15),  BYTE2(v15),  BYTE1(v15),  v15,  __stra,  HIBYTE(v16),  BYTE2(v16),  BYTE1(v16),  v16,  HIBYTE(v17),  BYTE2(v17),
          BYTE1(v17),
          v17,
          HIBYTE(v18),
          BYTE2(v18),
          BYTE1(v18),
          v18,
          *(_DWORD *)(a1 + 52),
          *(_DWORD *)(a1 + 56));
  if ((v19 & 0x80000000) == 0 && v26 > v19)
  {
    uint64_t v20 = v19 + v9;
    size_t v21 = __size - v20;
    int v22 = snprintf(&__str[v20], v21, "hostapdWPAGroupState=%d\n", *(_DWORD *)(*(void *)a1 + 72LL));
    else {
      int v24 = v22;
    }
    return (v24 + v20);
  }

  return v9;
}

uint64_t sub_100009A5C(uint64_t result, char *__str, size_t __size)
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  int v6 = *(_DWORD *)(result + 312);
  if (v6 == 2)
  {
    unsigned int v7 = 1027072;
    int v8 = *(_DWORD *)(result + 316);
    switch(v8)
    {
      case 1:
        break;
      case 2:
LABEL_6:
        ++v7;
        break;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_9;
      case 4:
LABEL_10:
        v7 += 5;
        break;
      case 8:
LABEL_11:
        v7 += 2;
        break;
      default:
LABEL_7:
        if (v8 == 16) {
          v7 |= 4u;
        }
        else {
LABEL_9:
        }
          unsigned int v7 = 0;
        break;
    }
  }

  else
  {
    if (v6 != 1) {
      return 0LL;
    }
    unsigned int v7 = 5304832;
    int v8 = *(_DWORD *)(result + 316);
    switch(v8)
    {
      case 1:
        break;
      case 2:
        goto LABEL_6;
      case 3:
      case 5:
      case 6:
      case 7:
        goto LABEL_9;
      case 4:
        goto LABEL_10;
      case 8:
        goto LABEL_11;
      default:
        goto LABEL_7;
    }
  }

  unsigned int v9 = snprintf( __str,  __size,  "dot11RSNAStatsSTAAddress=%02x:%02x:%02x:%02x:%02x:%02x\n dot11RSNAStatsVersion=1\n dot11RSNAStatsSelectedPairwiseCipher=%02x-%02x-%02x-%d\n dot11RSNAStatsTKIPLocalMICFailures=%u\n dot11RSNAStatsTKIPRemoveMICFailures=%u\n",  *(unsigned __int8 *)(result + 16),  *(unsigned __int8 *)(result + 17),  *(unsigned __int8 *)(result + 18),  *(unsigned __int8 *)(result + 19),  *(unsigned __int8 *)(result + 20),  *(unsigned __int8 *)(result + 21),  0,  HIWORD(v7),  (v7 >> 8) & 0xFE,  v7 & 7,  *(_DWORD *)(result + 336),  *(_DWORD *)(result + 340));
  if ((v9 & 0x80000000) != 0) {
    return 0LL;
  }
  unsigned int v10 = v9;
  if (__size <= v9) {
    return 0LL;
  }
  size_t v11 = __size - v9;
  int v12 = snprintf( &__str[v9],  v11,  "hostapdWPAPTKState=%d\nhostapdWPAPTKGroupState=%d\n",  *(_DWORD *)(v5 + 24),  *(_DWORD *)(v5 + 28));
  else {
    int v14 = v12;
  }
  return v14 + v10;
}

uint64_t sub_100009BE0(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 52);
  }
  return result;
}

BOOL sub_100009BF4(BOOL result)
{
  if (result) {
    return *(_BYTE *)(result + 215) != 0;
  }
  return result;
}

uint64_t sub_100009C08(uint64_t a1)
{
  return *(unsigned int *)(a1 + 316);
}

uint64_t sub_100009C10(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 320);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_100009C24(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 312);
  }
  return result;
}

uint64_t sub_100009C30(uint64_t a1, uint64_t a2)
{
  if (!a1 || *(void *)(a1 + 328) != a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 328) = 0LL;
  return result;
}

uint64_t sub_100009C58(uint64_t result)
{
  if (result) {
    return *(void *)(result + 328);
  }
  return result;
}

uint64_t sub_100009C64(uint64_t result)
{
  if (result) {
    ++*(_DWORD *)(result + 336);
  }
  return result;
}

uint64_t sub_100009C78(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = result + 272;
    uint64_t result = *(void *)(result + 272);
    *a2 = *(void *)(v2 + 8);
  }

  return result;
}

uint64_t sub_100009C88(_DWORD *a1, void *a2, int a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (a1[78] != 2) {
    return 0xFFFFFFFFLL;
  }
  if (sub_100005208( *(void *)(*(void *)a1 + 296LL),  a2,  0x20uLL,  0LL,  *(void *)a1 + 288LL,  (uint64_t)(a1 + 4),  a3,  a4,  a1[80]))
  {
    return 0LL;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100009CF8(uint64_t a1, void *a2, size_t a3, uint64_t a4, int a5, uint64_t a6)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (sub_100005208(*(void *)(a1 + 296), a2, a3, 0LL, a1 + 288, a4, a5, a6, 1)) {
    return 0LL;
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_100009D4C( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    unsigned int v9 = *(void ***)result;
    if (*(void *)result)
    {
      int v10 = a2;
      size_t v11 = *(void ***)result;
      while (1)
      {
        size_t v11 = (void **)*v11;
        if (!v11) {
          break;
        }
        if (*((_DWORD *)v11 + 2) == (_DWORD)a2) {
          goto LABEL_10;
        }
      }

      if (!*v9) {
        return 0xFFFFFFFFLL;
      }
      sub_100016E40(1LL, "WPA: Add group state machine for VLAN-ID %d", a3, a4, a5, a6, a7, a8, a2);
      int v12 = sub_100007AB4((uint64_t)v9, v10);
      if (!v12) {
        return 0xFFFFFFFFLL;
      }
      size_t v11 = (void **)v12;
      unsigned int v13 = *v9;
      *(void *)int v12 = **v9;
      *unsigned int v13 = v12;
LABEL_10:
      if (*(void ***)(v8 + 8) == v11) {
        return 0LL;
      }
      sub_100016E40( 1LL,  "WPA: Moving STA %02x:%02x:%02x:%02x:%02x:%02x to use group state machine for VLAN ID %d",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(v8 + 16));
      uint64_t result = 0LL;
      *(void *)(v8 + 8) = v11;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100009E40( uint64_t a1, void *a2, size_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 296);
  if (!v8)
  {
    uint64_t v9 = 4294967294LL;
    int v10 = "%s: NULL PMKSA for %02X:%02X:%02X:%02X:%02X:%02X";
LABEL_6:
    sub_100016E40(4LL, v10, a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)"wpa_auth_pmksa_sae_add");
    return v9;
  }

  if (!sub_100005208(v8, a2, a3, a4, a5, a6, a7, 0LL, 1024))
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    int v10 = "%s: failed to add PMKSA for %02X:%02X:%02X:%02X:%02X:%02X";
    goto LABEL_6;
  }

  return 0LL;
}

uint64_t sub_100009EE4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 328) == a2) {
    *(void *)(a1 + 328) = 0LL;
  }
  return 0LL;
}

uint64_t sub_100009EFC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_100016E40( 1LL,  "WPA: group state machine entering state SETKEYSDONE (VLAN-ID %d)",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned int *)(a2 + 8));
  *(_BYTE *)(a2 + 204) = 1;
  *(_DWORD *)(a2 + 72) = 2;
  HIDWORD(v12) = *(_DWORD *)(a1 + 84);
  LODWORD(v12) = HIDWORD(v12) - 2;
  unsigned int v11 = v12 >> 1;
  if (v11 > 7) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = dword_10002AE70[v11];
  }
  int v14 = *(uint64_t (**)(void, void, uint64_t, void))(a1 + 208);
  if (v14) {
    uint64_t result = v14(*(void *)(a1 + 144), *(unsigned int *)(a2 + 8), v13, 0LL);
  }
  if (*(_DWORD *)(a1 + 132))
  {
    unsigned int v15 = *(uint64_t (**)(void, void, uint64_t, void))(a1 + 208);
    if (v15) {
      return v15(*(void *)(a1 + 144), *(unsigned int *)(a2 + 8), 4LL, 0LL);
    }
  }

  return result;
}

uint64_t sub_100009FE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a2 + 204) = 1;
  *(_DWORD *)(a2 + 72) = 1;
  *(_BYTE *)(a2 + 20) = 0;
  *(int32x2_t *)(a2 + 28) = vrev64_s32(*(int32x2_t *)(a2 + 28));
  *(int32x2_t *)(a2 + 240) = vrev64_s32(*(int32x2_t *)(a2 + 240));
  sub_100009688(a1, a2);
  unsigned int v16 = *(void (**)(void, uint64_t (*)(uint64_t), void))(a1 + 248);
  if (v16) {
    v16(*(void *)(a1 + 144), sub_10000A098, 0LL);
  }
  return sub_100016E40( 1LL,  "wpa_group_setkeys: GKeyDoneStations=%d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a2 + 16));
}

uint64_t sub_10000A098(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 24) == 11)
  {
    if (*(_BYTE *)(a1 + 53))
    {
      sub_10000774C( *(void *)a1,  (unsigned __int8 *)(a1 + 16),  0LL,  (uint64_t)"GUpdateStationKeys already set - do not increment GKeyDoneStations");
    }

    else
    {
      ++*(_DWORD *)(*(void *)(a1 + 8) + 16LL);
      *(_BYTE *)(a1 + 53) = 1;
    }

    sub_100008054(a1);
  }

  else
  {
    sub_10000774C( *(void *)a1,  (unsigned __int8 *)(a1 + 16),  0LL,  (uint64_t)"Not in PTKINITDONE; skip Group Key update");
  }

  return 0LL;
}

uint64_t sub_10000A124( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 4;
  uint64_t v9 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 280) |= 1u;
  sub_100016E40(1LL, "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state INITIALIZE", a3, a4, a5, a6, a7, a8, v9);
  v10[2] = 0;
  if (*((_BYTE *)v10 + 16)) {
    *((_BYTE *)a1 + 280) &= ~1u;
  }
  a1[54] = 0;
  if (*((_BYTE *)a1 + 53)) {
    --*(_DWORD *)(*((void *)a1 + 1) + 16LL);
  }
  *((_BYTE *)a1 + 53) = 0;
  if (a1[78] == 1) {
    *((_BYTE *)a1 + 257) = 0;
  }
  *((_BYTE *)a1 + 220) = 1;
  uint64_t v11 = *(void (**)(void, _DWORD *, void, void))(*(void *)a1 + 176LL);
  if (v11) {
    v11(*(void *)(*(void *)a1 + 144LL), v10, 0LL, 0LL);
  }
  uint64_t result = sub_100009490(a1);
  uint64_t v13 = *(uint64_t (**)(void, _DWORD *, uint64_t, void))(*(void *)a1 + 176LL);
  if (v13) {
    uint64_t result = v13(*(void *)(*(void *)a1 + 144LL), v10, 1LL, 0LL);
  }
  a1[10] = 0;
  int v14 = a1[80];
  if (v14 <= 255)
  {
    if (v14 != 2 && v14 != 64) {
      return result;
    }
LABEL_17:
    uint64_t v15 = *(uint64_t (**)(void, _DWORD *, uint64_t, void))(*(void *)a1 + 176LL);
    if (v15) {
      return v15(*(void *)(*(void *)a1 + 144LL), v10, 2LL, 0LL);
    }
    return result;
  }

  if (v14 == 1024 || v14 == 256) {
    goto LABEL_17;
  }
  return result;
}

uint64_t sub_10000A284( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state DISCONNECT",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  *(_DWORD *)(a1 + 24) = 1;
  *(_BYTE *)(a1 + 36) = 0;
  uint64_t v12 = *(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)a1 + 160LL);
  if (v12) {
    return v12(*(void *)(*(void *)a1 + 144LL), v10, 2LL);
  }
  return result;
}

uint64_t sub_10000A32C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state DISCONNECTED",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 16));
  *(_DWORD *)(a1 + 24) = 2;
  *(_BYTE *)(a1 + 33) = 0;
  return result;
}

uint64_t sub_10000A39C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state AUTHENTICATION2",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 16));
  *(_DWORD *)(a1 + 24) = 4;
  uint64_t v9 = *(void *)(a1 + 8);
  __int128 v10 = *(_OWORD *)(v9 + 53);
  *(_OWORD *)(a1 + 54) = *(_OWORD *)(v9 + 37);
  *(_OWORD *)(a1 + 70) = v10;
  uint64_t result = sub_1000163D4(v9 + 37, 32);
  *(_BYTE *)(a1 + 35) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_10000A430( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (unsigned __int8 *)(a1 + 54);
  if (sub_10000E4BC((void *)(a1 + 54), 0x20uLL, a3, a4, a5, a6, a7, a8))
  {
    sub_100016E40(4LL, "WPA: Failed to get random data for ANonce", v10, v11, v12, v13, v14, v15, v17);
    *(_BYTE *)(a1 + 36) = 1;
    return 0xFFFFFFFFLL;
  }

  else
  {
    sub_100016EB0(1LL, "WPA: Assign new ANonce", v9, 32LL);
    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 40) = 0;
  }

  return result;
}

uint64_t sub_10000A4A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state PTKSTART",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  *(_DWORD *)(v10 + 8) = 7;
  *(_BYTE *)(v10 + 242) = 0;
  *(_BYTE *)(v10 + memset(&v9[1], 0, 32) = 0;
  int v12 = *(_DWORD *)(v10 + 24);
  *(_DWORD *)(v10 + 24) = v12 + 1;
  if (v12 <= 3)
  {
    sub_10000774C(*(void *)a1, (unsigned __int8 *)v10, 0LL, (uint64_t)"sending 1/4 msg of 4-Way Handshake");
    if (*(_DWORD *)(a1 + 312) == 2)
    {
      uint64_t v13 = 0LL;
      int v14 = *(_DWORD *)(a1 + 320);
      if (v14 > 127)
      {
        if (v14 != 1024)
        {
          size_t v15 = 0LL;
          if (v14 != 128) {
            goto LABEL_23;
          }
        }
      }

      else if (v14 != 1)
      {
        size_t v15 = 0LL;
        if (v14 != 32) {
          goto LABEL_23;
        }
      }

      int v21 = 251663581;
      __int16 v22 = 1196;
      uint64_t v16 = *(void *)(a1 + 328);
      if (v16)
      {
        __int128 v23 = *(_OWORD *)(v16 + 16);
        uint64_t v13 = &v21;
      }

      else
      {
        uint64_t v13 = &v21;
        BOOL v19 = v14 == 128 || v14 == 1024 || v14 == 256;
        sub_10000D9CC((char *)(a1 + 118), 0x20uLL, *(void *)a1 + 288LL, v10, &v23, v19);
      }

      size_t v15 = 22LL;
      goto LABEL_23;
    }

    uint64_t v13 = 0LL;
    size_t v15 = 0LL;
LABEL_23:
    uint64_t v20 = *(void *)a1;
    sub_100008F78(*(void *)a1, (unsigned __int8 *)a1, 136LL, 0LL, (__n128 *)(a1 + 54), (uint64_t)v13, v15, 0LL, 0, 0);
    return sub_100026220(1u, 0, (uint64_t)sub_1000086A8, v20, a1);
  }

  return result;
}

uint64_t sub_10000A678( _DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v24 = 64LL;
  uint64_t v10 = a1 + 4;
  uint64_t v9 = *((unsigned __int8 *)a1 + 16);
  *((_BYTE *)a1 + 280) |= 1u;
  sub_100016E40(1LL, "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state INITPMK", a3, a4, a5, a6, a7, a8, v9);
  v10[2] = 5;
  if (*((void *)v10 + 39))
  {
    uint64_t result = sub_100016E40(1LL, "WPA: PMK from PMKSA cache", v11, v12, v13, v14, v15, v16, v23);
    uint64_t v18 = *((void *)a1 + 41);
    __int128 v19 = *(_OWORD *)(v18 + 48);
    *(_OWORD *)((char *)a1 + 118) = *(_OWORD *)(v18 + 32);
    *(_OWORD *)((char *)a1 + 134) = v19;
  }

  else
  {
    uint64_t v20 = *(unsigned int (**)(void, _DWORD *, _OWORD *, uint64_t *))(*(void *)a1 + 200LL);
    if (v20 && !v20(*(void *)(*(void *)a1 + 144LL), v10, v25, &v24))
    {
      uint64_t result = sub_100016E40(1LL, "WPA: PMK from EAPOL state machine (len=%lu)", v11, v12, v13, v14, v15, v16, v24);
      __int128 v21 = v25[1];
      *(_OWORD *)((char *)a1 + 118) = v25[0];
      *(_OWORD *)((char *)a1 + 134) = v21;
    }

    else
    {
      uint64_t result = sub_100016E40(1LL, "WPA: Could not get PMK", v11, v12, v13, v14, v15, v16, v23);
    }
  }

  a1[73] = 0;
  __int16 v22 = *(uint64_t (**)(void, _DWORD *, uint64_t, void))(*(void *)a1 + 176LL);
  if (v22) {
    return v22(*(void *)(*(void *)a1 + 144LL), v10, 4LL, 0LL);
  }
  return result;
}

__int128 *sub_10000A7CC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = (__int128 *)sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state INITPSK",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  *(_DWORD *)(a1 + 24) = 6;
  uint64_t v12 = *(uint64_t (**)(void, uint64_t, void))(*(void *)a1 + 192LL);
  if (v12)
  {
    uint64_t result = (__int128 *)v12(*(void *)(*(void *)a1 + 144LL), v10, 0LL);
    if (result)
    {
      __int128 v13 = *result;
      *(_OWORD *)(a1 + 134) = result[1];
      *(_OWORD *)(a1 + 118) = v13;
    }
  }

  *(_DWORD *)(a1 + 292) = 0;
  return result;
}

double sub_10000A86C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state PTKCALCNEGOTIATING",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  int v11 = 0;
  uint64_t v12 = 0LL;
  *(_DWORD *)(v10 + 8) = 8;
  *(_BYTE *)(v10 + 33) = 0;
  do
  {
    int v13 = *(_DWORD *)(a1 + 320);
    if (v13 > 255)
    {
      if (v13 == 1024)
      {
        int v11 = 1;
        uint64_t v14 = "PMK for SAE STA";
        goto LABEL_12;
      }

      if (v13 != 256) {
        goto LABEL_5;
      }
    }

    else if (v13 != 2 && v13 != 64)
    {
LABEL_5:
      uint64_t v14 = "PMK for enterprise STA";
LABEL_12:
      sub_10000774C(*(void *)a1, (unsigned __int8 *)v10, 0LL, (uint64_t)v14);
      char v17 = 1;
      uint64_t v12 = v10 + 102;
      goto LABEL_13;
    }

    uint64_t v15 = *(void *)a1;
    uint64_t v16 = *(uint64_t (**)(void, uint64_t, uint64_t))(*(void *)a1 + 192LL);
    if (!v16)
    {
      sub_10000774C(v15, (unsigned __int8 *)v10, 0LL, (uint64_t)"PMK for WPA STA");
      goto LABEL_24;
    }

    uint64_t v12 = v16(*(void *)(v15 + 144), v10, v12);
    sub_10000774C(*(void *)a1, (unsigned __int8 *)v10, 0LL, (uint64_t)"PMK for WPA STA");
    if (!v12) {
      goto LABEL_24;
    }
    char v17 = 0;
LABEL_13:
    if (*(_DWORD *)(a1 + 316) == 16) {
      uint64_t v18 = 48LL;
    }
    else {
      uint64_t v18 = 64LL;
    }
    sub_10000D330( (char *)v12,  0x20uLL,  "Pairwise key expansion",  (unsigned __int8 *)(*(void *)a1 + 288LL),  (unsigned __int8 *)v10,  (unint64_t *)(v10 + 38),  (unint64_t *)(v10 + 70),  (unsigned __int8 *)v31,  v18,  v11);
    int v19 = sub_100008EC4((unsigned int *)v31, *(void *)(a1 + 264), *(void *)(a1 + 272));
  }

  while ((v17 & 1) == 0 && v19);
  if (!v19)
  {
    sub_10000774C(*(void *)a1, (unsigned __int8 *)v10, 0LL, (uint64_t)"MIC OK");
    sub_100026438((uint64_t)sub_1000086A8, *(void *)a1, a1, v20, v21, v22, v23, v24);
    int v25 = *(_DWORD *)(a1 + 320);
    if (v25 > 255)
    {
      if (v25 != 1024 && v25 != 256) {
        goto LABEL_29;
      }
    }

    else if (v25 != 2 && v25 != 64)
    {
      goto LABEL_29;
    }

    __int128 v28 = *(_OWORD *)(v12 + 16);
    *(_OWORD *)(v10 + 102) = *(_OWORD *)v12;
    *(_OWORD *)(v10 + 118) = v28;
LABEL_29:
    *(_BYTE *)(a1 + 52) = 1;
    __int128 v29 = v31[1];
    *(_OWORD *)(a1 + 150) = v31[0];
    *(_OWORD *)(a1 + 166) = v29;
    double result = *(double *)&v32;
    __int128 v30 = v33;
    *(_OWORD *)(a1 + 182) = v32;
    *(_OWORD *)(a1 + 198) = v30;
    *(_BYTE *)(a1 + 214) = 1;
    return result;
  }

LABEL_24:
  sub_10000774C(*(void *)a1, (unsigned __int8 *)v10, 0LL, (uint64_t)"PTK derivation not verified");
  size_t v27 = *(void (**)(void, uint64_t, uint64_t))(*(void *)a1 + 160LL);
  if (v27) {
    v27(*(void *)(*(void *)a1 + 144LL), v10, 2LL);
  }
  return result;
}

uint64_t sub_10000AB28( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state PTKCALCNEGOTIATING2",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 16));
  *(_DWORD *)(a1 + 24) = 9;
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

void sub_10000AB98( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 8);
  int v11 = (unsigned __int8 *)(a1 + 16);
  uint64_t v10 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state PTKINITNEGOTIATING",  a3,  a4,  a5,  a6,  a7,  a8,  v10);
  *(_DWORD *)(a1 + 24) = 10;
  uint64_t v12 = *(void *)a1;
  *(_BYTE *)(a1 + 48) = 0;
  int v13 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(a1 + 40) = v13 + 1;
  if (v13 <= 3)
  {
    uint64_t v40 = 0LL;
    uint64_t v14 = *(void (**)(void, void, void, uint64_t *))(v12 + 216);
    uint64_t v15 = v12;
    if (v14)
    {
      v14(*(void *)(v12 + 144), 0LL, *(unsigned int *)(v9 + 28), &v40);
      uint64_t v15 = *(void *)a1;
    }

    uint64_t v16 = *(_BYTE **)(v15 + 272);
    int v17 = *(_DWORD *)(v15 + 280);
    if (*(_DWORD *)(a1 + 312) == 1 && (*(_BYTE *)(v15 + 72) & 2) != 0)
    {
      uint64_t v18 = v16[1];
      if ((int)v18 + 2 < v17 && *v16 == 48)
      {
        int v19 = &v16[v18];
        uint64_t v16 = v19 + 2;
        int v17 = v19[3] + 2;
      }
    }

    sub_10000774C(v15, v11, 0LL, (uint64_t)"sending 3/4 msg of 4-Way Handshake");
    sub_1000078D0( *(void *)a1,  v11,  0LL,  "sending 3/4 msg of 4-Way Handshake %x %x %x ",  *(unsigned __int8 *)(a1 + 344),  *(unsigned __int8 *)(a1 + 345),  *(unsigned __int8 *)(a1 + 346));
    int v20 = *(_DWORD *)(a1 + 312);
    if (v20 == 2)
    {
      size_t v22 = *(int *)(v9 + 24);
      uint64_t v21 = *(int *)(v9 + 28);
      uint64_t v23 = (const void *)(v9 + 32 * v21 + 76);
      unsigned int v38 = &v40;
      int v24 = 1;
    }

    else
    {
      size_t v22 = 0LL;
      uint64_t v23 = 0LL;
      uint64_t v21 = 0LL;
      int v24 = 0;
      unsigned int v38 = 0LL;
    }

    if ((*(_BYTE *)(a1 + 280) & 0x10) != 0) {
      int v25 = sub_10000DC00(32) + 14;
    }
    else {
      int v25 = 0;
    }
    int v26 = v25 + v17;
    size_t v27 = v22 + 8;
    if (!v23) {
      size_t v27 = 0LL;
    }
    size_t v28 = v27 + v26;
    int v30 = *(unsigned __int8 *)(v12 + 137);
    __int128 v29 = (_BYTE *)(v12 + 137);
    if (v30) {
      size_t v31 = v28 + 7;
    }
    else {
      size_t v31 = v28;
    }
    __int128 v32 = malloc(v31);
    if (v32)
    {
      __int128 v33 = v32;
      memcpy(v32, v16, v17);
      char v34 = &v33[v17];
      if (v23)
      {
        __src[0] = v21 & 3;
        __src[1] = 0;
        char v34 = sub_10000C130(&v33[v17], 1027073, __src, 2uLL, v23, v22);
      }

      __int16 v35 = sub_10000B0A4((_BYTE *)a1, v34);
      if (*v29) {
        __int16 v35 = sub_10000C130(v35, 1349491232, v29, 1uLL, 0LL, 0LL);
      }
      uint64_t v36 = *(void *)a1;
      if (v20 == 2) {
        uint64_t v37 = 968LL;
      }
      else {
        uint64_t v37 = 456LL;
      }
      sub_100008F78(v36, (unsigned __int8 *)a1, v37, v38, (__n128 *)(a1 + 54), (uint64_t)v33, v35 - v33, v21, v24, 0);
      sub_100026220(1u, 0, (uint64_t)sub_1000086A8, v36, a1);
      free(v33);
    }
  }

void sub_10000AE78( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK entering state PTKINITDONE",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  *(_DWORD *)(v10 + 8) = 11;
  *(_BYTE *)(v10 + 33) = 0;
  if (!*(_BYTE *)(v10 + 204)) {
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)a1;
  uint64_t v12 = *(uint64_t (**)(void, void, uint64_t, uint64_t, void, uint64_t, uint64_t))(*(void *)a1 + 208LL);
  if (!v12
    || (*(_DWORD *)(a1 + 316) != 8 ? (uint64_t v13 = 16LL) : (uint64_t v13 = 32LL),
        *(_DWORD *)(a1 + 316) == 8 ? (uint64_t v14 = 2LL) : (uint64_t v14 = 3LL),
        int v15 = v12(*(void *)(v11 + 144), 0LL, v14, v10, 0LL, a1 + 182, v13),
        uint64_t v11 = *(void *)a1,
        v15))
  {
    uint64_t v21 = *(void (**)(void, uint64_t, uint64_t))(v11 + 160);
    if (v21) {
      v21(*(void *)(v11 + 144), v10, 2LL);
    }
    return;
  }

  *(_BYTE *)(a1 + 215) = 1;
  if (*(_DWORD *)(v11 + 100))
  {
    sub_100026438((uint64_t)sub_100008724, v11, a1, v16, v17, v18, v19, v20);
    sub_100026220(*(_DWORD *)(*(void *)a1 + 100LL), 0, (uint64_t)sub_100008724, *(void *)a1, a1);
  }

  int v22 = *(_DWORD *)(a1 + 320);
  if (v22 > 255)
  {
    if (v22 != 1024 && v22 != 256) {
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v23 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 176LL);
    if (v23) {
      v23(*(void *)(*(void *)a1 + 144LL), v10, 2LL, 1LL);
    }
    goto LABEL_22;
  }

  if (v22 == 2 || v22 == 64) {
    goto LABEL_20;
  }
LABEL_22:
  int v24 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 176LL);
  if (v24)
  {
    v24(*(void *)(*(void *)a1 + 144LL), v10, 1LL, 1LL);
    int v25 = *(void (**)(void, uint64_t, uint64_t, void))(*(void *)a1 + 176LL);
    if (v25)
    {
      v25(*(void *)(*(void *)a1 + 144LL), v10, 5LL, 0LL);
      int v26 = *(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)a1 + 176LL);
      if (v26) {
        v26(*(void *)(*(void *)a1 + 144LL), v10, 6LL, 1LL);
      }
    }
  }

  uint64_t v27 = 259LL;
  if (*(_DWORD *)(a1 + 312) == 1)
  {
    uint64_t v27 = 257LL;
    size_t v28 = "WPA";
  }

  else
  {
    size_t v28 = "RSN";
  }

  *(_BYTE *)(a1 + v27) = 1;
  sub_1000078D0(*(void *)a1, (unsigned __int8 *)v10, 1LL, "pairwise key handshake completed (%s)", v28);
}

char *sub_10000B0A4(_BYTE *a1, _BYTE *a2)
{
  uint64_t v4 = *((void *)a1 + 1);
  int v5 = sub_10000DC00(32);
  if ((a1[280] & 0x10) != 0)
  {
    uint64_t v6 = v5;
    v9[0] = *(_DWORD *)(v4 + 240);
    v9[1] = 0;
    if (*(_DWORD *)(v4 + 72) != 2
      || (unsigned int v7 = *(uint64_t (**)(void, void))(*(void *)a1 + 216LL)) == 0LL
      || (v7(*(void *)(*(void *)a1 + 144LL), 0LL) & 0x80000000) != 0)
    {
      __int16 v11 = 0;
      int v10 = 0;
    }

    __int128 v12 = *(_OWORD *)(v4 + 16LL * *(int *)(v4 + 240) + 141);
    return sub_10000C130(a2, 1027081, v9, v6 + 8, 0LL, 0LL);
  }

  return a2;
}

uint64_t sub_10000B194( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 280) |= 1u;
  uint64_t result = sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK_GROUP entering state IDLE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 16));
  *(_DWORD *)(a1 + 28) = 0;
  if (*(_BYTE *)(a1 + 32)) {
    *(_BYTE *)(a1 + 280) &= ~1u;
  }
  *(_DWORD *)(a1 + 44) = 0;
  return result;
}

void sub_10000B214( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 8);
  uint64_t v11 = a1 + 16;
  uint64_t v10 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK_GROUP entering state REKEYNEGOTIATING",  a3,  a4,  a5,  a6,  a7,  a8,  v10);
  *(_DWORD *)(v11 + 12) = 1;
  int v12 = *(_DWORD *)(v11 + 28);
  *(_DWORD *)(v11 + 28) = v12 + 1;
  if (v12 > 3) {
    return;
  }
  if (*(_DWORD *)(a1 + 312) == 1) {
    *(_BYTE *)(a1 + 257) = 0;
  }
  *(_BYTE *)(a1 + 48) = 0;
  uint64_t v27 = 0LL;
  uint64_t v13 = *(void *)a1;
  if (*(_DWORD *)(v9 + 72) == 2)
  {
    uint64_t v14 = *(void (**)(void, void, void, uint64_t *))(v13 + 216);
    if (v14)
    {
      v14(*(void *)(v13 + 144), 0LL, *(unsigned int *)(v9 + 28), &v27);
      uint64_t v13 = *(void *)a1;
    }
  }

  sub_10000774C(v13, (unsigned __int8 *)v11, 0LL, (uint64_t)"sending 1/2 msg of Group Key Handshake");
  if (*(_DWORD *)(a1 + 312) != 2)
  {
    uint64_t v17 = *(int *)(v9 + 28);
    uint64_t v18 = (_BYTE *)(v9 + 32 * v17 + 76);
    uint64_t v19 = &v18[*(int *)(v9 + 24)];
LABEL_14:
    uint64_t v24 = *(void *)a1;
    if (*(_BYTE *)(a1 + 220)) {
      uint64_t v25 = 896LL;
    }
    else {
      uint64_t v25 = 960LL;
    }
    sub_100008F78(v24, (unsigned __int8 *)a1, v25, &v27, (__n128 *)(v9 + 172), (uint64_t)v18, v19 - v18, v17, 1, 0);
    sub_100026220(1u, 0, (uint64_t)sub_1000086A8, v24, a1);
    if (*(_DWORD *)(a1 + 312) == 2) {
      free(v18);
    }
    return;
  }

  uint64_t v15 = *(int *)(v9 + 24) + 8LL;
  if ((*(_BYTE *)(a1 + 280) & 0x10) != 0) {
    int v16 = sub_10000DC00(32) + 14;
  }
  else {
    int v16 = 0;
  }
  uint64_t v20 = malloc(v15 + v16);
  if (v20)
  {
    uint64_t v18 = v20;
    size_t v21 = *(int *)(v9 + 24);
    uint64_t v22 = *(int *)(v9 + 28);
    __src[0] = v22 & 3;
    __src[1] = 0;
    uint64_t v23 = sub_10000C130(v20, 1027073, __src, 2uLL, (const void *)(v9 + 32 * v22 + 76), v21);
    uint64_t v19 = sub_10000B0A4((_BYTE *)a1, v23);
    uint64_t v17 = *(unsigned int *)(v9 + 28);
    goto LABEL_14;
  }

void sub_10000B428( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a1 + 16;
  uint64_t v9 = *(unsigned __int8 *)(a1 + 16);
  *(_BYTE *)(a1 + 280) |= 1u;
  sub_100016E40( 1LL,  "WPA: %02x:%02x:%02x:%02x:%02x:%02x WPA_PTK_GROUP entering state REKEYESTABLISHED",  a3,  a4,  a5,  a6,  a7,  a8,  v9);
  *(_DWORD *)(v10 + 12) = 2;
  *(_BYTE *)(v10 + 33) = 0;
  if (*(_BYTE *)(v10 + 37)) {
    --*(_DWORD *)(*(void *)(a1 + 8) + 16LL);
  }
  *(_BYTE *)(a1 + 53) = 0;
  *(_DWORD *)(a1 + 44) = 0;
  if (*(_DWORD *)(a1 + 312) == 1) {
    uint64_t v11 = "WPA";
  }
  else {
    uint64_t v11 = "RSN";
  }
  sub_1000078D0(*(void *)a1, (unsigned __int8 *)v10, 1LL, "group key handshake completed (%s)", v11);
  *(_BYTE *)(a1 + 259) = 1;
}

uint64_t sub_10000B504(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  *(void *)&__int128 v3 = *(void *)(v2 + 484);
  *((void *)&v3 + 1) = *(void *)(v2 + 504);
  __int128 v4 = *(_OWORD *)(v2 + 512);
  v39[0] = v3;
  v39[1] = v4;
  uint64_t v40 = *(void *)(v2 + 528);
  int v5 = *(_DWORD *)(v2 + 544);
  int v41 = *(_DWORD *)(v2 + 76);
  int v42 = v5;
  uint64_t v43 = *(void *)(v2 + 708);
  int v6 = *(_DWORD *)(v2 + 744);
  char v46 = *(_BYTE *)(v2 + 752);
  char v47 = *(_BYTE *)(v2 + 753);
  LODWORD(v2) = *(_DWORD *)(v2 + 492);
  int v44 = v6;
  int v45 = v2;
  *(void *)&__int128 v24 = a1;
  *((void *)&v24 + 1) = sub_10000B694;
  uint64_t v25 = sub_10000B6DC;
  int v26 = sub_10000B764;
  uint64_t v27 = sub_10000B76C;
  size_t v28 = sub_10000B884;
  __int128 v29 = sub_10000B8D8;
  int v30 = sub_10000B8E0;
  size_t v31 = sub_10000B960;
  __int128 v32 = sub_10000B9F0;
  __int128 v33 = sub_10000BA08;
  char v34 = sub_10000BA10;
  __int16 v35 = sub_10000BA18;
  uint64_t v36 = sub_10000BA20;
  uint64_t v37 = sub_10000BA78;
  unsigned int v38 = sub_10000BABC;
  unsigned int v7 = sub_10000796C((int *)(a1 + 28), (uint64_t)v39, &v24);
  *(void *)(a1 + 2624) = v7;
  if (!v7)
  {
    uint64_t v20 = "WPA initialization failed.";
LABEL_7:
    sub_100016E40(4LL, v20, v8, v9, v10, v11, v12, v13, v22);
    return 0xFFFFFFFFLL;
  }

  if (!sub_100002EF4(a1))
  {
    sub_100009C78(*(void *)(a1 + 2624), &v23);
    uint64_t result = sub_100002F14(a1);
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v20 = "Failed to configure WPA IE for the kernel driver.";
    goto LABEL_7;
  }

  sub_100016E40( 4LL,  "Could not set PrivacyInvoked for interface %s",  v14,  v15,  v16,  v17,  v18,  v19,  *(void *)(a1 + 16));
  return 0xFFFFFFFFLL;
}

void sub_10000B694( uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == 1) {
    LODWORD(v8) = 2;
  }
  else {
    LODWORD(v8) = 1;
  }
  if (a3 == 2) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = v8;
  }
  sub_1000172B0(a1, a2, 8LL, v8, "%s", a6, a7, a8, a4);
}

uint64_t sub_10000B6DC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_100006910(a1, 0LL, a2, a3, v11, v12, v13, v14);
}

time_t sub_10000B764(uint64_t a1, unsigned __int8 *a2)
{
  return sub_1000069C0(a1, a2, 0);
}

void sub_10000B76C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = sub_1000059B4(a1, a2);
  if (v7)
  {
    switch(a3)
    {
      case 0:
        sub_100020AC8(*(void *)(v7 + 88), a4);
        break;
      case 1:
        sub_100020AE4(*(void *)(v7 + 88), a4);
        break;
      case 2:
        sub_10001F538(a1, v7, a4, v8, v9, v10, v11, v12);
        break;
      case 3:
        uint64_t v13 = *(void *)(v7 + 88);
        if (v13) {
          *(_DWORD *)(v13 + 28) = 2;
        }
        break;
      case 4:
        uint64_t v14 = *(void *)(v7 + 88);
        if (v14) {
          *(_BYTE *)(v14 + 26) = a4 != 0;
        }
        break;
      case 5:
        uint64_t v15 = *(void *)(v7 + 88);
        if (v15) {
          *(_BYTE *)(*(void *)(v15 + 232) + 72LL) = a4 != 0;
        }
        break;
      case 6:
        uint64_t v16 = *(void *)(v7 + 88);
        if (v16) {
          *(_BYTE *)(v16 + 25) = a4 != 0;
        }
        break;
      case 7:
        uint64_t v17 = *(void *)(v7 + 88);
        if (v17) {
          ++*(_DWORD *)(v17 + 176);
        }
        break;
      default:
        return;
    }
  }

uint64_t sub_10000B884(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = sub_1000059B4(a1, a2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *(void *)(v4 + 88);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  if (a3 != 5)
  {
    if (a3 == 4) {
      return *(unsigned __int8 *)(v5 + 26);
    }
    return 0xFFFFFFFFLL;
  }

  return *(unsigned __int8 *)(*(void *)(v5 + 232) + 72LL);
}

uint64_t sub_10000B8D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_1000026A0(*(void *)(a1 + 16), a2, a3);
}

uint64_t sub_10000B8E0(uint64_t a1, uint64_t a2, void *a3, size_t *a4)
{
  uint64_t v6 = sub_1000059B4(a1, a2);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = (const void *)sub_100020AB4(*(void *)(v6 + 88), &__n);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  size_t v8 = __n;
  size_t v9 = *a4;
  if (__n > *a4)
  {
    size_t __n = *a4;
    size_t v8 = v9;
  }

  memcpy(a3, v7, v8);
  uint64_t result = 0LL;
  *a4 = v8;
  return result;
}

uint64_t sub_10000B960(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13 = *(uint64_t **)(a1 + 16);
  if (a2 < 1) {
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(a1 + 2416))( v13,  a1,  a3,  a4,  a5,  1LL,  0LL,  0LL,  a6,  a7);
  }
  uint64_t v13 = sub_100002678((uint64_t *)v13[90], a2);
  if (v13) {
    return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, uint64_t, uint64_t))(a1 + 2416))( v13,  a1,  a3,  a4,  a5,  1LL,  0LL,  0LL,  a6,  a7);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000B9F0(uint64_t a1)
{
  return sub_100002FD4(*(void *)(a1 + 16), a1);
}

uint64_t sub_10000BA08(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 2384))();
}

uint64_t sub_10000BA10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 2392))();
}

uint64_t sub_10000BA18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 2400))();
}

uint64_t sub_10000BA20(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  __int128 v3 = *(void **)(a1 + 40);
  if (!v3) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v6 = v3[21];
    if (v6)
    {
      if (a2(v6, a3)) {
        break;
      }
    }

    __int128 v3 = (void *)*v3;
    if (!v3) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t sub_10000BA78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v3 = *(void **)a1;
  uint64_t v4 = *(uint64_t (**)(void, uint64_t (*)(uint64_t, uint64_t), void *))(*(void *)a1 + 2248LL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  v6[0] = a2;
  v6[1] = a3;
  return v4(*v3, sub_10000BC10, v6);
}

uint64_t sub_10000BABC(char *a1, uint64_t a2, uint64_t a3, u_char *a4, size_t a5)
{
  uint64_t v5 = *((void *)a1 + 294);
  if (v5)
  {
    uint64_t v6 = *(uint64_t (**)(void, uint64_t, char *, uint64_t, u_char *, size_t))(v5 + 592);
    if (v6) {
      return v6(*((void *)a1 + 295), a2, a1 + 28, a3, a4, a5);
    }
  }

  uint64_t v8 = *((void *)a1 + 339);
  if (v8) {
    return sub_100010198(v8, a2, a3, a4, a5);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t sub_10000BB08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)&__int128 v9 = *(void *)(v8 + 484);
  *((void *)&v9 + 1) = *(void *)(v8 + 504);
  __int128 v10 = *(_OWORD *)(v8 + 512);
  v14[0] = v9;
  v14[1] = v10;
  uint64_t v15 = *(void *)(v8 + 528);
  int v11 = *(_DWORD *)(v8 + 544);
  int v16 = *(_DWORD *)(v8 + 76);
  int v17 = v11;
  uint64_t v18 = *(void *)(v8 + 708);
  int v12 = *(_DWORD *)(v8 + 744);
  char v21 = *(_BYTE *)(v8 + 752);
  char v22 = *(_BYTE *)(v8 + 753);
  LODWORD(v8) = *(_DWORD *)(v8 + 492);
  int v19 = v12;
  int v20 = v8;
  return sub_100007DB0(*(void *)(a1 + 2624), (uint64_t)v14, a3, a4, a5, a6, a7, a8);
}

void sub_10000BB80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 2624);
  if (v9)
  {
    sub_100007D40(v9, a2, a3, a4, a5, a6, a7, a8);
    *(void *)(a1 + 2624) = 0LL;
    if (sub_100002EF4(a1)) {
      sub_100016E40( 1LL,  "Could not disable PrivacyInvoked for interface %s",  v10,  v11,  v12,  v13,  v14,  v15,  *(void *)(a1 + 16));
    }
    if (sub_100002F14(a1)) {
      sub_100016E40( 1LL,  "Could not remove generic information element from interface %s",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a1 + 16));
    }
  }

  sub_1000208BC(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_10000BC10(uint64_t a1, uint64_t a2)
{
  unint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8 * v5) + 2624LL);
    if (v6) {
      break;
    }
LABEL_6:
    if (++v5 >= v2) {
      return 0LL;
    }
  }

  if (!(*(unsigned int (**)(uint64_t, void))a2)(v6, *(void *)(a2 + 8)))
  {
    unint64_t v2 = *(void *)(a1 + 48);
    goto LABEL_6;
  }

  return 1LL;
}

uint64_t sub_10000BC7C( unsigned int *a1, uint64_t a2, uint64_t a3, _OWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)a2 = 48;
  *(_WORD *)(a2 + 2) = 1;
  HIDWORD(v9) = a1[3];
  LODWORD(v9) = HIDWORD(v9) - 2;
  unsigned int v8 = v9 >> 1;
  if (v8 >= 8 || ((0x8Bu >> v8) & 1) == 0)
  {
    sub_100016E40(1LL, "Invalid group cipher (%d).", a3, (uint64_t)a4, a5, a6, a7, a8, a1[3]);
    return 0xFFFFFFFFLL;
  }

  *(_WORD *)(a2 + 4) = 3840;
  *(_BYTE *)(a2 + 6) = -84;
  *(_BYTE *)(a2 + 7) = 0x404040402040501uLL >> (8 * v8);
  uint64_t v11 = a1[8];
  if ((v11 & 0x10) != 0)
  {
    *(_DWORD *)(a2 + 10) = 78384896;
    uint64_t v13 = a2 + 14;
    uint64_t v11 = a1[8];
    int v12 = 1;
    if ((v11 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  int v12 = 0;
  uint64_t v13 = a2 + 10;
  if ((v11 & 8) != 0)
  {
LABEL_9:
    *(_DWORD *)uint64_t v13 = 44830464;
    v13 += 4LL;
    ++v12;
    uint64_t v11 = a1[8];
  }

LABEL_27:
  *(_BYTE *)(v13 + 1) = 0;
  *(_BYTE *)uint64_t v13 = v15;
  __int16 v17 = a1[9] != 0;
  if (a1[11]) {
    v17 |= 0x200u;
  }
  if (a1[12]) {
    v17 |= 0xCu;
  }
  unsigned int v18 = a1[15];
  if (v18 == 2) {
    char v19 = -52;
  }
  else {
    char v19 = -116;
  }
  if (v18) {
    char v20 = v19;
  }
  else {
    char v20 = 12;
  }
  *(_BYTE *)(v16 + 1) = HIBYTE(v17);
  *(_BYTE *)uint64_t v16 = v20 | v17;
  if (a4)
  {
    int v21 = v16 + 20;
    *(_WORD *)(v16 + 2) = 1;
    *(_OWORD *)(v16 + 4) = *a4;
  }

  else
  {
    int v21 = v16 + 2;
  }

  uint64_t result = (v21 - a2);
  *(_BYTE *)(a2 + 1) = v21 - a2 - 2;
  return result;
}

uint64_t sub_10000BEC0(uint64_t a1, uint64_t a2)
{
  *(_WORD *)a2 = 500;
  *(_BYTE *)(a2 + 2) = 0;
  *(_BYTE *)(a2 + 2) = 32 * (*(_BYTE *)(a1 + 64) != 0);
  return 3LL;
}

uint64_t sub_10000BEE8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = (_BYTE *)(a1 + 72);
  if ((*(_BYTE *)(a1 + 72) & 2) != 0)
  {
    uint64_t result = sub_10000BC7C((unsigned int *)(a1 + 72), (uint64_t)__src, 128LL, 0LL, a5, a6, a7, a8);
    if ((result & 0x80000000) != 0) {
      return result;
    }
    uint64_t v10 = &__src[result];
    if (*(_BYTE *)(a1 + 136))
    {
      *(_WORD *)uint64_t v10 = 500;
      v10[2] = 32;
      v10 += 3;
    }
  }

  else
  {
    uint64_t v10 = __src;
  }

  if ((*v9 & 1) == 0) {
    goto LABEL_7;
  }
  _BYTE *v10 = -35;
  *(_DWORD *)(v10 + 2) = 32657408;
  *((_WORD *)v10 + 3) = 1;
  HIDWORD(v14) = *(_DWORD *)(a1 + 84);
  LODWORD(v14) = HIDWORD(v14) - 2;
  unsigned int v13 = v14 >> 1;
  if (v13 >= 8 || ((0x8Bu >> v13) & 1) == 0)
  {
    sub_100016E40(1LL, "Invalid group cipher (%d).", a3, a4, a5, a6, a7, a8, *(unsigned int *)(a1 + 84));
    return 0xFFFFFFFFLL;
  }

  *((_WORD *)v10 + 4) = 20480;
  v10[10] = -14;
  v10[11] = 0x404040402040501uLL >> (8 * v13);
  uint64_t v15 = *(unsigned int *)(a1 + 80);
  if ((v15 & 0x10) != 0)
  {
    *(_DWORD *)(v10 + 14) = 82989056;
    __int16 v17 = v10 + 18;
    int v16 = 1;
    if ((v15 & 8) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  int v16 = 0;
  __int16 v17 = v10 + 14;
  if ((v15 & 8) != 0)
  {
LABEL_18:
    *(_DWORD *)__int16 v17 = 49434624;
    v17 += 4;
    ++v16;
    uint64_t v15 = *(unsigned int *)(a1 + 80);
  }

char *sub_10000C130(_BYTE *a1, int a2, void *__src, size_t __n, const void *a5, size_t a6)
{
  *a1 = -35;
  a1[1] = __n + a6 + 4;
  a1[2] = HIBYTE(a2);
  a1[3] = BYTE2(a2);
  a1[4] = BYTE1(a2);
  a1[5] = a2;
  unint64_t v9 = a1 + 6;
  memcpy(a1 + 6, __src, __n);
  uint64_t v10 = &v9[__n];
  if (a5)
  {
    memcpy(v10, a5, a6);
    v10 += a6;
  }

  return v10;
}

uint64_t sub_10000C1C0( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 5LL;
  if (!a1) {
    return v8;
  }
  if (!a2) {
    return v8;
  }
  uint64_t v8 = 1LL;
  if (!a3 || !a4) {
    return v8;
  }
  int v13 = *a3;
  if (v13 == 48) {
    uint64_t v14 = 2LL;
  }
  else {
    uint64_t v14 = 1LL;
  }
  if ((v14 & *(_DWORD *)(a1 + 72)) == 0)
  {
    sub_100016E40( 1LL,  "Invalid WPA proto (%d) from %02x:%02x:%02x:%02x:%02x:%02x",  (uint64_t)a3,  a4,  a5,  a6,  a7,  a8,  v14);
    return 10LL;
  }

  if (v13 != 48)
  {
    int v15 = 5304833;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    int v64 = 0;
    uint64_t v65 = 0x800000008LL;
    unsigned int v66 = 1;
    if (a4 < 8)
    {
      int v16 = -1;
LABEL_37:
      char v19 = 8;
LABEL_38:
      LOBYTE(v20) = 8;
LABEL_39:
      *(_DWORD *)(a1 + 12) = 5304833;
      goto LABEL_40;
    }

    if (v13 != 221 || a4 - 2 != a3[1] || bswap32(*(_DWORD *)(a3 + 2)) != 5304833 || *((_WORD *)a3 + 3) != 1)
    {
      int v16 = -2;
      goto LABEL_37;
    }

    if ((int)a4 - 8 <= 3)
    {
      char v19 = 8;
      if ((int)a4 - 8 > 0)
      {
        int v16 = -3;
        goto LABEL_38;
      }

      LOBYTE(v20) = 8;
    }

    else
    {
      int v18 = sub_10000CCF8((unsigned int *)a3 + 2);
      char v19 = v18;
      HIDWORD(v65) = v18;
      if ((a4 - 12) < 2)
      {
        LOBYTE(v20) = 8;
        if ((_DWORD)a4 == 13)
        {
          int v16 = -5;
          goto LABEL_39;
        }
      }

      else
      {
        LOBYTE(v20) = 0;
        LODWORD(v65) = 0;
        int v21 = a3[13];
        int v22 = a3[12];
        int v23 = v22 | (v21 << 8);
        int v16 = -4;
        uint64_t v24 = 0LL;
        int v20 = 0;
        int v25 = (4 * v22) | (v21 << 10);
        do
        {
          v20 |= sub_10000CCF8((unsigned int *)&a3[v24 + 14]);
          v24 += 4LL;
        }

        while (v25 != (_DWORD)v24);
        LODWORD(v65) = v20;
        if ((int)a4 - (int)v24 - 10 >= 6)
        {
          unsigned int v66 = 0;
          int v26 = a3[v24 + 14] | (a3[v24 + 15] << 8);
          if (v26) {
            BOOL v27 = (int)a4 - (int)v24 - 16 >= (4 * v26);
          }
          else {
            BOOL v27 = 0;
          }
          if (v27)
          {
            unsigned int v28 = 0;
            int v59 = a4 - 18 - v24;
            uint64_t v60 = (unsigned int *)&a3[v24 + 16];
            do
            {
              unsigned int v61 = bswap32(*v60) - 5304832;
              if (v61 > 2) {
                int v62 = 0;
              }
              else {
                int v62 = dword_10002AEF4[v61];
              }
              v28 |= v62;
              unsigned int v66 = v28;
              ++v60;
              v59 -= 4;
              --v26;
            }

            while (v26);
            if (v59 + 6 < 6) {
              v59 += 2;
            }
            else {
              LODWORD(v67) = *(unsigned __int16 *)v60;
            }
            if (v59 <= 0) {
              int v16 = 0;
            }
            else {
              int v16 = -8;
            }
          }

          else
          {
            LOBYTE(v28) = 0;
            int v16 = -6;
          }

LABEL_149:
          if ((v28 & 3) == 2) {
            int v58 = 5304834;
          }
          else {
            int v58 = 5304833;
          }
          *(_DWORD *)(a1 + 12) = v58;
          if ((v20 & 0x10) != 0)
          {
            int v29 = 5304836;
LABEL_59:
            *(_DWORD *)(a1 + 16) = v29;
            if ((v19 & 0x10) != 0)
            {
              int v15 = 5304836;
              goto LABEL_79;
            }

            if ((v19 & 8) != 0) {
              goto LABEL_76;
            }
            if ((v19 & 4) != 0)
            {
              int v15 = 5304837;
            }

            else if ((v19 & 2) == 0)
            {
              if ((v19 & 1) != 0) {
                int v15 = 5304832;
              }
              else {
                int v15 = 5304834;
              }
            }

            goto LABEL_79;
          }

LABEL_76:
    ++v15;
  }

LABEL_79:
  *(_DWORD *)(a1 + 20) = v15;
  sub_100016EB0(1LL, "WPA/RSN IE", a3, a4);
  if (v16)
  {
    uint64_t v8 = 1LL;
    sub_100016E40( 1LL,  "Failed to parse WPA/RSN IE from %02x:%02x:%02x:%02x:%02x:%02x (res=%d)",  v31,  v32,  v33,  v34,  v35,  v36,  *(unsigned __int8 *)(a2 + 16));
    return v8;
  }

  if (HIDWORD(v65) != *(_DWORD *)(a1 + 84))
  {
    sub_100016E40( 1LL,  "Invalid WPA group cipher (0x%x) from %02x:%02x:%02x:%02x:%02x:%02x",  v31,  v32,  v33,  v34,  v35,  v36,  HIDWORD(v65));
    return 2LL;
  }

  int v37 = *(_DWORD *)(a1 + 76) & v66;
  if (!v37)
  {
    sub_100016E40( 1LL,  "Invalid WPA key mgmt (0x%x) from %02x:%02x:%02x:%02x:%02x:%02x",  v31,  v32,  v33,  v34,  v35,  v36,  v66);
    return 4LL;
  }

  if ((v37 & 0x400) != 0)
  {
    int v38 = 1024;
  }

  else if ((v37 & 0x80) != 0)
  {
    int v38 = 128;
  }

  else if ((v37 & 0x100) != 0)
  {
    int v38 = 256;
  }

  else if ((v37 & 1) != 0)
  {
    int v38 = 1;
  }

  else
  {
    int v38 = 2;
  }

  *(_DWORD *)(a2 + 320) = v38;
  uint64_t v39 = 80LL;
  if (v13 == 48) {
    uint64_t v39 = 104LL;
  }
  int v40 = *(_DWORD *)(a1 + v39) & v65;
  if (!v40)
  {
    uint64_t v43 = "WPA";
    if (v13 == 48) {
      uint64_t v43 = "RSN";
    }
    sub_100016E40( 1LL,  "Invalid %s pairwise cipher (0x%x) from %02x:%02x:%02x:%02x:%02x:%02x",  v31,  v32,  v33,  v34,  v35,  v36,  (uint64_t)v43);
    return 3LL;
  }

  int v41 = *(_DWORD *)(a1 + 132);
  if (v41)
  {
    if (v41 == 2)
    {
      if ((v67 & 0x80) == 0)
      {
        int v42 = "Management frame protection required, but client did not enable it";
LABEL_132:
        sub_100016E40(1LL, v42, v31, v32, v33, v34, v35, v36, v63);
        return 7LL;
      }

      if ((v40 & 8) != 0)
      {
        int v42 = "Management frame protection cannot use TKIP";
        goto LABEL_132;
      }

      if (DWORD2(v68) != 32)
      {
        sub_100016E40(1LL, "Unsupported management group cipher %d", v31, v32, v33, v34, v35, v36, DWORD2(v68));
        return 8LL;
      }

      goto LABEL_110;
    }

    if ((v67 & 0x80) != 0)
    {
LABEL_110:
      char v44 = *(_BYTE *)(a2 + 280) | 0x10;
      goto LABEL_111;
    }
  }

  char v44 = *(_BYTE *)(a2 + 280) & 0xEF;
LABEL_111:
  *(_BYTE *)(a2 + 280) = v44;
  if ((v40 & 0x10) != 0) {
    int v45 = 16;
  }
  else {
    int v45 = 8;
  }
  *(_DWORD *)(a2 + 316) = v45;
  if (*a3 == 48) {
    int v46 = 2;
  }
  else {
    int v46 = 1;
  }
  *(_DWORD *)(a2 + 312) = v46;
  *(void *)(a2 + 328) = 0LL;
  if (*((void *)&v67 + 1))
  {
    uint64_t v47 = 0LL;
    unint64_t v48 = 0LL;
    do
    {
      sub_100016EB0(1LL, "RSN IE: STA PMKID", (unsigned __int8 *)(v68 + v47), 16LL);
      uint64_t v49 = sub_1000053DC(*(void *)(a1 + 296), a2 + 16, v68 + v47);
      *(void *)(a2 + 328) = v49;
      if (v49)
      {
        __int16 v53 = (_OWORD *)(v49 + 16);
        goto LABEL_134;
      }

      ++v48;
      v47 += 16LL;
    }

    while (v48 < *((void *)&v67 + 1));
    uint64_t v50 = 0LL;
    unint64_t v51 = 0LL;
    while (*(_DWORD *)(a1 + 128) && v51 < *((void *)&v67 + 1))
    {
      sub_100007734(a1);
      ++v51;
      uint64_t v49 = *(void *)(a2 + 328);
      v50 += 16LL;
      if (v49)
      {
        __int16 v53 = 0LL;
        goto LABEL_134;
      }
    }
  }

  else if ((v37 & 0x400) != 0)
  {
    uint64_t v54 = sub_1000053DC(*(void *)(a1 + 296), a2 + 16, 0LL);
    *(void *)(a2 + 328) = v54;
    sub_1000078D0(a1, (unsigned __int8 *)(a2 + 16), 0LL, "search for SAE PMK (found == %d) without PMKID", v54 != 0);
    __int16 v53 = 0LL;
    uint64_t v49 = *(void *)(a2 + 328);
    if (v49)
    {
LABEL_134:
      sub_1000078D0( a1,  (unsigned __int8 *)(a2 + 16),  0LL,  "PMKID found (%d) from PMKSA cache eap_type=%d vlan_id=%d",  v53 != 0LL,  *(unsigned __int8 *)(v49 + 128),  *(_DWORD *)(v49 + 132));
      uint64_t v55 = (_OWORD *)(a1 + 24);
      if (v53)
      {
        *uint64_t v55 = *v53;
      }

      else
      {
        *(void *)uint64_t v55 = 0LL;
        *(void *)(a1 + memset(&v9[1], 0, 32) = 0LL;
      }
    }
  }

  uint64_t v56 = *(void **)(a2 + 296);
  if (!v56 || *(void *)(a2 + 304) < a4)
  {
    free(v56);
    uint64_t v56 = malloc(a4);
    *(void *)(a2 + 296) = v56;
    if (!v56) {
      return 6LL;
    }
  }

  memcpy(v56, a3, a4);
  uint64_t v8 = 0LL;
  *(void *)(a2 + 304) = a4;
  return v8;
}

BOOL sub_10000CA48(uint64_t a1, uint64_t a2)
{
  __int128 v3 = sub_100005844(*(void *)(a1 + 296), *(void *)(a2 + 8), *(void *)(a2 + 16), *(void **)(a2 + 24));
  *(void *)a2 = v3;
  return v3 != 0LL;
}

uint64_t sub_10000CA80( unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a3 + 96) = 0LL;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  if (a2 < 2) {
    return 0LL;
  }
  unint64_t v11 = (unint64_t)&a1[a2];
  int v12 = a1 + 1;
  uint64_t v13 = (uint64_t)&a1[a2 - 1];
  uint64_t v14 = a1;
  while (1)
  {
    uint64_t v15 = *v14;
    if ((_DWORD)v15 == 221)
    {
      unsigned int v16 = *v12;
      if (!*v12) {
        return 0LL;
      }
    }

    else
    {
      unsigned int v16 = *v12;
    }

    switch((_DWORD)v15)
    {
      case 0xF4:
        *(void *)(a3 + 88) = v16;
        *(void *)(a3 + 96) = v14;
        break;
      case 0xDD:
        if (!v16) {
          return 0LL;
        }
        if (v16 >= 6)
        {
          unsigned int v17 = bswap32(*(_DWORD *)(v14 + 2));
          if (v17 == 5304833 && v14[6] == 1 && !v14[7])
          {
            *(void *)a3 = v14;
            *(void *)(a3 + 8) = *v12 + 2LL;
          }

          else if (v16 < 0x14)
          {
            if (v16 >= 7)
            {
              switch(v17)
              {
                case 0xFAC09u:
LABEL_30:
                  *(void *)(a3 + 72) = v14 + 6;
                  *(void *)(a3 + 80) = *v12 - 4LL;
                  break;
                case 0xFAC03u:
LABEL_31:
                  *(void *)(a3 + 56) = v14 + 6;
                  *(void *)(a3 + 64) = *v12 - 4LL;
                  break;
                case 0xFAC01u:
LABEL_29:
                  *(void *)(a3 + 40) = v14 + 6;
                  *(void *)(a3 + 48) = *v12 - 4LL;
                  break;
              }
            }
          }

          else
          {
            switch(v17)
            {
              case 0xFAC01u:
                goto LABEL_29;
              case 0xFAC03u:
                goto LABEL_31;
              case 0xFAC04u:
                *(void *)(a3 + memset(&v9[1], 0, 32) = v14 + 6;
                break;
              case 0xFAC09u:
                goto LABEL_30;
              default:
                goto LABEL_23;
            }
          }
        }

        break;
      case 0x30:
        *(void *)(a3 + 16) = v14;
        *(void *)(a3 + 24) = *v12 + 2LL;
        break;
      default:
        sub_100016EB0(1LL, "WPA: Unrecognized EAPOL-Key Key Data IE", v14, v16 + 2);
        break;
    }

LABEL_23:
    int v18 = &v14[v14[1]];
    uint64_t v14 = v18 + 2;
    int v12 = v18 + 3;
  }

  sub_100016E40(1LL, "WPA: EAPOL-Key Key Data underflow (ie=%d len=%d pos=%d)", a3, a4, a5, a6, a7, a8, v15);
  sub_100016F74(1LL, "WPA: Key Data", a1, a2);
  return 0xFFFFFFFFLL;
}

uint64_t sub_10000CCE8(uint64_t result)
{
  if (result) {
    return (*(unsigned __int8 *)(result + 280) >> 4) & 1;
  }
  return result;
}

uint64_t sub_10000CCF8(unsigned int *a1)
{
  unsigned int v1 = bswap32(*a1) - 5304832;
  if (v1 > 5) {
    return 0LL;
  }
  else {
    return dword_10002AF00[v1];
  }
}

uint64_t sub_10000CD28( unsigned __int8 *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_OWORD *)(a3 + 176) = 0u;
  *(_OWORD *)(a3 + 192) = 0u;
  *(_OWORD *)(a3 + 144) = 0u;
  *(_OWORD *)(a3 + 160) = 0u;
  *(_OWORD *)(a3 + 112) = 0u;
  *(_OWORD *)(a3 + 128) = 0u;
  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (a2 < 2)
  {
    int v12 = 0;
    unint64_t v13 = a2;
LABEL_57:
    if (v13) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v12 != 0;
    }
  }

  else
  {
    int v9 = a4;
    int v12 = 0;
    unint64_t v13 = a2;
    uint64_t v14 = a1;
    while (1)
    {
      uint64_t v15 = *v14;
      unint64_t v16 = v14[1];
      BOOL v17 = v13 - 2 >= v16;
      unint64_t v13 = v13 - 2 - v16;
      if (!v17) {
        break;
      }
      int v18 = v14 + 2;
      if (*v14 <= 0x23u)
      {
        switch(*v14)
        {
          case 0u:
            *(void *)a3 = v18;
            *(_BYTE *)(a3 + 184) = v16;
            break;
          case 1u:
            *(void *)(a3 + 8) = v18;
            *(_BYTE *)(a3 + 185) = v16;
            break;
          case 2u:
            *(void *)(a3 + 16) = v18;
            *(_BYTE *)(a3 + 186) = v16;
            break;
          case 3u:
            *(void *)(a3 + 24) = v18;
            *(_BYTE *)(a3 + 187) = v16;
            break;
          case 4u:
            *(void *)(a3 + memset(&v9[1], 0, 32) = v18;
            *(_BYTE *)(a3 + 188) = v16;
            break;
          case 5u:
            *(void *)(a3 + 40) = v18;
            *(_BYTE *)(a3 + 189) = v16;
            break;
          case 6u:
            *(void *)(a3 + 48) = v18;
            *(_BYTE *)(a3 + 190) = v16;
            break;
          case 7u:
          case 8u:
          case 9u:
          case 0xAu:
          case 0xBu:
          case 0xCu:
          case 0xDu:
          case 0xEu:
          case 0xFu:
            goto LABEL_17;
          case 0x10u:
            *(void *)(a3 + 56) = v18;
            *(_BYTE *)(a3 + 191) = v16;
            break;
          default:
            if ((_DWORD)v15 == 33)
            {
              *(void *)(a3 + 120) = v18;
              *(_BYTE *)(a3 + 199) = v16;
            }

            else
            {
LABEL_17:
              ++v12;
              if (v9) {
                sub_100016E40( 0LL,  "IEEE 802.11 element parse ignored unknown element (id=%d elen=%d)",  a3,  a4,  a5,  a6,  a7,  a8,  v15);
              }
            }

            break;
        }
      }

      else
      {
        switch(*v14)
        {
          case '*':
            *(void *)(a3 + 64) = v18;
            *(_BYTE *)(a3 + 192) = v16;
            break;
          case '+':
          case ',':
          case '.':
          case '/':
          case '1':
          case '3':
          case '4':
          case '5':
          case '9':
          case ':':
          case ';':
          case '<':
            goto LABEL_17;
          case '-':
            *(void *)(a3 + 160) = v18;
            *(_BYTE *)(a3 + 204) = v16;
            break;
          case '0':
            *(void *)(a3 + 88) = v18;
            *(_BYTE *)(a3 + 195) = v16;
            break;
          case '2':
            *(void *)(a3 + 72) = v18;
            *(_BYTE *)(a3 + 193) = v16;
            break;
          case '6':
            *(void *)(a3 + 136) = v18;
            *(_BYTE *)(a3 + 201) = v16;
            break;
          case '7':
            *(void *)(a3 + 144) = v18;
            *(_BYTE *)(a3 + 202) = v16;
            break;
          case '8':
            *(void *)(a3 + 152) = v18;
            *(_BYTE *)(a3 + 203) = v16;
            break;
          case '=':
            *(void *)(a3 + 168) = v18;
            *(_BYTE *)(a3 + 205) = v16;
            break;
          default:
            if ((_DWORD)v15 == 36)
            {
              *(void *)(a3 + 128) = v18;
              *(_BYTE *)(a3 + 200) = v16;
              break;
            }

            if ((_DWORD)v15 != 221) {
              goto LABEL_17;
            }
            if (v16 <= 3)
            {
              if (v9) {
                sub_100016E40( 0LL,  "short vendor specific information element ignored (len=%lu)",  a3,  a4,  a5,  a6,  a7,  a8,  v14[1]);
              }
              goto LABEL_48;
            }

            uint64_t v19 = v14[2];
            int v20 = ((_DWORD)v19 << 16) | (v14[3] << 8) | v14[4];
            if (v20 == 36940)
            {
              uint64_t v22 = v14[5];
              if ((_DWORD)v22 == 51)
              {
                *(void *)(a3 + 176) = v18;
                *(_BYTE *)(a3 + 206) = v16;
                break;
              }

              sub_100016E40( 0LL,  "Unknown Broadcom information element ignored (type=%d len=%lu)\n",  a3,  a4,  a5,  a6,  a7,  a8,  v22);
              goto LABEL_48;
            }

            if (v20 != 20722)
            {
              sub_100016E40( 0LL,  "unknown vendor specific information element ignored (vendor OUI %02x:%02x:%02x len=%lu)",  a3,  a4,  a5,  a6,  a7,  a8,  v19);
LABEL_48:
              ++v12;
              break;
            }

            int v21 = v14[5];
            if (v21 == 4)
            {
              *(void *)(a3 + 112) = v18;
              *(_BYTE *)(a3 + 198) = v16;
              break;
            }

            if (v21 != 2)
            {
              if (v21 == 1)
              {
                *(void *)(a3 + 80) = v18;
                *(_BYTE *)(a3 + 194) = v16;
                break;
              }

              sub_100016E40( 0LL,  "Unknown Microsoft information element ignored (type=%d len=%lu)\n",  a3,  a4,  a5,  a6,  a7,  a8,  v14[5]);
              goto LABEL_48;
            }

            if (v16 <= 4)
            {
              sub_100016E40(0LL, "short WMM information element ignored (len=%lu)", a3, a4, a5, a6, a7, a8, 4LL);
              goto LABEL_48;
            }

            uint64_t v23 = v14[6];
            if (v23 >= 2)
            {
              if ((_DWORD)v23 != 2)
              {
                sub_100016E40( 0LL,  "unknown WMM information element ignored (subtype=%d len=%lu)",  a3,  a4,  a5,  a6,  a7,  a8,  v23);
                goto LABEL_48;
              }

              *(void *)(a3 + 104) = v18;
              *(_BYTE *)(a3 + 197) = v16;
            }

            else
            {
              *(void *)(a3 + 96) = v18;
              *(_BYTE *)(a3 + 196) = v16;
            }

            break;
        }
      }

      uint64_t v14 = &v18[v16];
      if (v13 <= 1) {
        goto LABEL_57;
      }
    }

    if (v9)
    {
      sub_100016E40(1LL, "IEEE 802.11 element parse failed (id=%d elen=%d left=%lu)", a3, a4, a5, a6, a7, a8, v15);
      sub_100016EB0(0LL, "IEs", a1, a2);
    }

    return 0xFFFFFFFFLL;
  }

uint64_t sub_10000D0C8(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2 >= 2)
    {
      uint64_t v2 = result;
      uint64_t result = 0LL;
      unint64_t v3 = v2 + a2;
      do
      {
        uint64_t v4 = *(unsigned __int8 *)(v2 + 1);
        if (v2 + v4 + 2 > v3) {
          break;
        }
        uint64_t result = (result + 1);
        uint64_t v5 = v4 + v2;
        uint64_t v2 = v5 + 2;
      }

      while (v5 + 4 <= v3);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

unint64_t *sub_10000D118(unsigned __int8 *a1, uint64_t a2, int a3)
{
  if (a2 >= 2)
  {
    uint64_t v4 = a1;
    unint64_t v5 = (unint64_t)&a1[a2];
    do
    {
      uint64_t v6 = v4[1];
      if (v6 >= 4 && *v4 == 221 && bswap32(*(_DWORD *)(v4 + 2)) == a3)
      {
        uint64_t v8 = sub_100017458(a2);
        if (v8)
        {
          unint64_t v16 = v4 + 1;
          do
          {
            uint64_t v17 = v4[1];
            if (v17 >= 4 && *v4 == 221 && bswap32(*(_DWORD *)(v4 + 2)) == a3)
            {
              size_t v18 = (v17 - 4);
              uint64_t v19 = sub_1000175AC(v8, v18, v10, v11, v12, v13, v14, v15);
              memcpy(v19, v4 + 6, v18);
              uint64_t v17 = *v16;
            }

            int v20 = &v4[v17];
            uint64_t v4 = v20 + 2;
            unint64_t v16 = v20 + 3;
          }

          while ((unint64_t)(v20 + 3) < v5);
        }

        return v8;
      }

      uint64_t v7 = &v4[v6];
      uint64_t v4 = v7 + 2;
    }

    while ((unint64_t)(v7 + 3) < v5);
  }

  return 0LL;
}

double sub_10000D238(unsigned int *a1, int a2, char *a3, uint64_t a4, _DWORD *a5)
{
  switch(a2)
  {
    case 0:
    case 3:
      sub_100001D38(a1, a3, a4, a5);
      break;
    case 1:
      sub_10000E2AC((__int128 *)a1, 0x10uLL, (uint64_t)a3, a4, a5);
      break;
    case 2:
      if (!sub_10000F61C((char *)a1, 0x10uLL, (uint64_t)a3, a4, (uint64_t)v7))
      {
        double result = v7[0];
        *(_OWORD *)a5 = *(_OWORD *)v7;
      }

      break;
    default:
      return result;
  }

  return result;
}

uint64_t sub_10000D330( char *a1, unint64_t a2, char *a3, unsigned __int8 *a4, unsigned __int8 *a5, unint64_t *a6, unint64_t *a7, unsigned __int8 *a8, uint64_t a9, int a10)
{
  unsigned int v14 = bswap32(*(_DWORD *)a4);
  unsigned int v15 = bswap32(*(_DWORD *)a5);
  if (v14 != v15) {
    goto LABEL_5;
  }
  unsigned int v14 = bswap32(*((unsigned __int16 *)a4 + 2)) >> 16;
  unsigned int v16 = bswap32(*((unsigned __int16 *)a5 + 2));
  if (v14 != HIWORD(v16))
  {
    unsigned int v15 = HIWORD(v16);
LABEL_5:
    if (v14 < v15) {
      int v17 = -1;
    }
    else {
      int v17 = 1;
    }
    goto LABEL_8;
  }

  int v17 = 0;
LABEL_8:
  BOOL v18 = v17 < 0;
  if (v17 >= 0) {
    uint64_t v19 = a5;
  }
  else {
    uint64_t v19 = a4;
  }
  if (v18) {
    int v20 = a5;
  }
  else {
    int v20 = a4;
  }
  int v36 = *(_DWORD *)v19;
  __int16 v37 = *((_WORD *)v19 + 2);
  int v38 = *(_DWORD *)v20;
  __int16 v39 = *((_WORD *)v20 + 2);
  unint64_t v21 = bswap64(*a6);
  unint64_t v22 = bswap64(*a7);
  if (v21 == v22
    && (unint64_t v21 = bswap64(a6[1]), v22 = bswap64(a7[1]), v21 == v22)
    && (unint64_t v21 = bswap64(a6[2]), v22 = bswap64(a7[2]), v21 == v22)
    && (unint64_t v21 = bswap64(a6[3]), v22 = bswap64(a7[3]), v21 == v22))
  {
    int v23 = 0;
  }

  else if (v21 < v22)
  {
    int v23 = -1;
  }

  else
  {
    int v23 = 1;
  }

  BOOL v24 = v23 < 0;
  if (v23 >= 0) {
    int v25 = a7;
  }
  else {
    int v25 = a6;
  }
  if (v24) {
    int v26 = a7;
  }
  else {
    int v26 = a6;
  }
  __int128 v27 = *((_OWORD *)v25 + 1);
  __int128 v40 = *(_OWORD *)v25;
  __int128 v41 = v27;
  __int128 v28 = *((_OWORD *)v26 + 1);
  __int128 v42 = *(_OWORD *)v26;
  __int128 v43 = v28;
  if (a10) {
    sub_10000FE00((uint64_t)a1, a2, a3, (uint64_t)&v36, 76LL, (uint64_t)a8, a9);
  }
  else {
    sub_10000F64C(a1, a2, a3, (uint64_t)&v36, 76LL, (uint64_t)a8, a9);
  }
  sub_100016E40( 1LL,  "WPA: PTK derivation - A1=%02x:%02x:%02x:%02x:%02x:%02x A2=%02x:%02x:%02x:%02x:%02x:%02x",  v29,  v30,  v31,  v32,  v33,  v34,  *a4);
  sub_100016F74(1LL, "WPA: PMK", (unsigned __int8 *)a1, a2);
  return sub_100016F74(1LL, "WPA: PTK", a8, a9);
}

uint64_t sub_10000D570( uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)a3 = xmmword_10002AFB0;
  *(_DWORD *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0LL;
  uint64_t v8 = (uint64_t *)(a3 + 24);
  *(void *)(a3 + memset(&v9[1], 0, 32) = 0LL;
  *(_DWORD *)(a3 + 40) = 32;
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v9 = a2;
  if (a2 <= 3)
  {
    sub_100016E40(1LL, "%s: ie len too short %lu", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 0xFFFFFFFFLL;
  }

  if (*(_BYTE *)a1 != 48 || a2 - 2 != *(unsigned __int8 *)(a1 + 1) || *(_WORD *)(a1 + 2) != 1)
  {
    sub_100016E40(1LL, "%s: malformed ie or unknown version", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 4294967294LL;
  }

  if ((int)a2 - 4 < 4)
  {
    if ((int)a2 - 4 >= 1)
    {
      sub_100016E40(1LL, "%s: ie length mismatch, %u too much", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_rsn");
      return 4294967293LL;
    }

    return 0LL;
  }

  int v13 = sub_10000D99C((unsigned int *)(a1 + 4));
  *(_DWORD *)(a3 + 8) = v13;
  if (v13 == 32)
  {
    sub_100016E40( 1LL,  "%s: AES-128-CMAC used as group cipher",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 0xFFFFFFFFLL;
  }

  if ((v9 - 8) < 2)
  {
    if (v9 == 9)
    {
      sub_100016E40( 1LL,  "%s: ie too short (for key mgmt)",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"wpa_parse_wpa_ie_rsn");
      return 4294967291LL;
    }

    return 0LL;
  }

  *(_DWORD *)(a3 + 4) = 0;
  int v20 = *(unsigned __int8 *)(a1 + 9);
  int v21 = *(unsigned __int8 *)(a1 + 8);
  int v22 = v21 | (v20 << 8);
  if (!v22 || v9 - 10 < (4 * v22))
  {
    sub_100016E40( 1LL,  "%s: ie count botch (pairwise), count %u left %u",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 4294967292LL;
  }

  uint64_t v23 = 0LL;
  int v24 = 0;
  uint64_t v25 = a1 + 10;
  int v26 = (4 * v21) | (v20 << 10);
  do
  {
    v24 |= sub_10000D99C((unsigned int *)(v25 + v23));
    *(_DWORD *)(a3 + 4) = v24;
    v23 += 4LL;
  }

  while (v26 != (_DWORD)v23);
  if ((v24 & 0x20) != 0)
  {
    sub_100016E40( 1LL,  "%s: AES-128-CMAC used as pairwise cipher",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 0xFFFFFFFFLL;
  }

  if (v9 - 6 - (int)v23 < 6)
  {
    if (v9 - 11 == (_DWORD)v23)
    {
      sub_100016E40( 1LL,  "%s: ie too short (for capabilities)",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
      return 4294967289LL;
    }

    return 0LL;
  }

  *(_DWORD *)(a3 + 12) = 0;
  int v33 = *(unsigned __int16 *)(v25 + v23);
  int v34 = v9 - 12;
  if (!*(_WORD *)(v25 + v23) || v34 - (int)v23 < (4 * v33))
  {
    sub_100016E40( 1LL,  "%s: ie count botch (key mgmt), count %u left %u",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    return 4294967290LL;
  }

  int v35 = 0;
  do
  {
    unsigned int v36 = bswap32(*(_DWORD *)(a1 + v23 + 12)) - 1027073;
    if (v36 > 7) {
      int v37 = 0;
    }
    else {
      int v37 = dword_10002AF70[v36];
    }
    v35 |= v37;
    *(_DWORD *)(a3 + 12) = v35;
    v23 += 4LL;
    --v33;
  }

  while (v33);
  if (v9 - 8 - (int)v23 <= 5)
  {
    int v38 = v34 - v23;
    goto LABEL_44;
  }

  *(_DWORD *)(a3 + 16) = *(unsigned __int8 *)(a1 + v23 + 12) | (*(unsigned __int8 *)(a1 + v23 + 13) << 8);
  int v38 = v9 - 14 - v23;
  uint64_t v39 = *(unsigned __int8 *)(a1 + v23 + 15);
  uint64_t v40 = *(unsigned __int8 *)(a1 + v23 + 14);
  uint64_t v41 = v40 | (v39 << 8);
  uint64_t *v8 = v41;
  int v42 = v9 - 16;
  if (v9 - 16 - (int)v23 < (16 * v41))
  {
    sub_100016E40( 1LL,  "%s: PMKID underflow (num_pmkid=%lu left=%d)",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    uint64_t *v8 = 0LL;
    return 4294967287LL;
  }

  *(void *)(a3 + memset(&v9[1], 0, 32) = a1 + v23 + 16;
  int v43 = ((_DWORD)v39 << 12) | (16 * v40);
  if (v42 - v43 - (int)v23 <= 3)
  {
    int v38 = v42 - v43 - v23;
LABEL_44:
    if (v38 >= 1) {
      sub_100016E40( 1LL,  "%s: ie has %u trailing bytes - ignored",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
    }
    return 0LL;
  }

  int v44 = sub_10000D99C((unsigned int *)(a1 + 16 * v41 + v23 + 16));
  *(_DWORD *)(a3 + 40) = v44;
  if (v44 == 32)
  {
    int v38 = v9 - v43 - v23 - 20;
    goto LABEL_44;
  }

  sub_100016E40( 1LL,  "%s: Unsupported management group cipher 0x%x",  v27,  v28,  v29,  v30,  v31,  v32,  (uint64_t)"wpa_parse_wpa_ie_rsn");
  return 4294967286LL;
}

uint64_t sub_10000D99C(unsigned int *a1)
{
  unsigned int v1 = bswap32(*a1) - 1027072;
  if (v1 > 6) {
    return 0LL;
  }
  else {
    return dword_10002AF90[v1];
  }
}

double sub_10000D9CC(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, int a6)
{
  __int128 v9 = xmmword_10002AF58;
  uint64_t v10 = 6LL;
  v11[0] = "PMK Name";
  v11[1] = a3;
  __darwin_time_t v11[2] = a4;
  if (a6) {
    sub_10000FC2C((uint64_t)a1, a2, 3uLL, v11, &v9, (uint64_t)v8);
  }
  else {
    sub_10000F460(a1, a2, 3uLL, v11, &v9, (uint64_t)v8);
  }
  double result = v8[0];
  *a5 = *(_OWORD *)v8;
  return result;
}

const char *sub_10000DA74(int a1)
{
  int v1 = a1 - 1;
  double result = "NONE";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      double result = "WEP-40";
      break;
    case 2:
    case 4:
    case 5:
    case 6:
      goto LABEL_6;
    case 3:
      double result = "WEP-104";
      break;
    case 7:
      double result = "TKIP";
      break;
    default:
      if ("NONE" == 16)
      {
        double result = "CCMP";
      }

      else if ("NONE" == 24)
      {
        double result = "CCMP+TKIP";
      }

      else
      {
LABEL_6:
        double result = "UNKNOWN";
      }

      break;
  }

  return result;
}

const char *sub_10000DAF8(int a1, int a2)
{
  if (a1 > 127)
  {
    switch(a1)
    {
      case 128:
        return "WPA2-EAP-SHA256";
      case 256:
        return "WPA2-PSK-SHA256";
      case 1024:
        return "WPA3-SAE";
      default:
        return "UNKNOWN";
    }
  }

  else
  {
    int v2 = a1 - 1;
    double result = "NONE";
    switch(v2)
    {
      case 0:
        uint64_t v4 = "WPA2+WPA/IEEE 802.1X/EAP";
        unint64_t v5 = "WPA/IEEE 802.1X/EAP";
        uint64_t v6 = "WPA2/IEEE 802.1X/EAP";
        goto LABEL_9;
      case 1:
        uint64_t v4 = "WPA2-PSK+WPA-PSK";
        unint64_t v5 = "WPA-PSK";
        uint64_t v6 = "WPA2-PSK";
LABEL_9:
        if (a2 == 2) {
          unint64_t v5 = v6;
        }
        if (a2 == 3) {
          double result = v4;
        }
        else {
          double result = v5;
        }
        break;
      case 3:
        return result;
      case 7:
        double result = "IEEE 802.1X (no WPA)";
        break;
      default:
        return "UNKNOWN";
    }
  }

  return result;
}

uint64_t sub_10000DBC8(int a1, void *__s1, size_t a3, void *__s2, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (__s1)
  {
    if (__s2)
    {
      if (a3 != a5) {
        return 0xFFFFFFFFLL;
      }
      uint64_t result = memcmp(__s1, __s2, a3);
      if ((_DWORD)result) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_10000DC00(int a1)
{
  uint64_t result = 32LL;
  if (a1 <= 255)
  {
    if (a1 > 31)
    {
      if (a1 != 32 && a1 != 64) {
        return 0LL;
      }
      return 16LL;
    }

    if (a1 != 8)
    {
      if (a1 != 16) {
        return 0LL;
      }
      return 16LL;
    }
  }

  else if (a1 <= 2047)
  {
    if (a1 != 256 && a1 != 512) {
      return 0LL;
    }
  }

  else if (a1 != 0x2000 && a1 != 4096)
  {
    if (a1 != 2048) {
      return 0LL;
    }
    return 16LL;
  }

  return result;
}

uint64_t sub_10000DC84(int a1)
{
  if (a1 <= 255)
  {
    if (a1 > 31)
    {
      if (a1 == 32) {
        return 4LL;
      }
      if (a1 == 64) {
        return 6LL;
      }
    }

    else
    {
      if (a1 == 8) {
        return 2LL;
      }
      if (a1 == 16) {
        return 3LL;
      }
    }
  }

  else if (a1 <= 2047)
  {
    if (a1 == 256) {
      return 9LL;
    }
    if (a1 == 512) {
      return 10LL;
    }
  }

  else
  {
    switch(a1)
    {
      case 0x800:
        return 11LL;
      case 0x1000:
        return 12LL;
      case 0x2000:
        return 13LL;
    }
  }

  return 0LL;
}

uint64_t sub_10000DD34(int a1)
{
  BOOL v1 = a1 == 0x2000;
  if (a1 == 4096) {
    BOOL v1 = 1;
  }
  if (a1 == 2048) {
    BOOL v1 = 1;
  }
  return a1 == 32 || v1;
}

uint64_t sub_10000DD5C(unsigned int *a1, __int128 *a2, _BYTE *a3, unint64_t a4)
{
  uint64_t v7 = sub_100026F74(a1, 16LL);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = v7;
  for (__int128 i = *a2; a4; a4 -= v10)
  {
    __int128 v9 = (char *)v20;
    sub_100026FC0(v8, (unsigned int *)&i, v20);
    if (a4 >= 0x10) {
      uint64_t v10 = 16LL;
    }
    else {
      uint64_t v10 = a4;
    }
    uint64_t v11 = a3;
    uint64_t v12 = v10;
    do
    {
      char v13 = *v9++;
      *v11++ ^= v13;
      --v12;
    }

    while (v12);
    a3 += v10;
    unsigned int v14 = 15;
    do
    {
      __int16 v15 = *((unsigned __int8 *)&i + v14);
      __int16 v16 = v15 + 1;
      *((_BYTE *)&i + v14) = v15 + 1;
      BOOL v18 = v14-- != 0;
    }

    while ((v16 & 0x100) != 0 && v18);
  }

  sub_100026FC4(v8);
  return 0LL;
}

uint64_t sub_10000DE64(unsigned int *a1, int a2, uint64_t *__src, char *__dst)
{
  uint64_t v7 = *__src;
  int v8 = 8 * a2;
  memcpy(__dst, __src + 1, 8 * a2);
  __int128 v9 = sub_1000270F8(a1, 16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = &__dst[v8 - 8];
    int v12 = 6 * a2;
    int v13 = 5;
    do
    {
      int v14 = v13;
      if (a2 >= 1)
      {
        int v15 = v12;
        unsigned int v16 = a2 + 1;
        uint64_t v17 = v11;
        do
        {
          uint64_t v18 = *(void *)v17;
          uint64_t v21 = v7;
          uint64_t v22 = v18;
          HIBYTE(v21) = HIBYTE(v7) ^ v15;
          sub_100027144(v10, (unsigned int *)&v21, &v21);
          uint64_t v7 = v21;
          *(void *)uint64_t v17 = v22;
          v17 -= 8;
          --v16;
          --v15;
        }

        while (v16 > 1);
      }

      int v13 = v14 - 1;
      v12 -= a2;
    }

    while (v14);
    uint64_t v23 = v7;
    sub_100026FC4(v10);
    uint64_t v19 = 0LL;
    while (*((unsigned __int8 *)&v23 + v19) == 166)
    {
      if (++v19 == 8) {
        return 0LL;
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000DFBC(unsigned int *a1, int a2, void *__src, uint64_t *a4)
{
  *a4 = 0xA6A6A6A6A6A6A6A6LL;
  memcpy(a4 + 1, __src, 8 * a2);
  uint64_t v7 = sub_100026F74(a1, 16LL);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  int v8 = v7;
  int v9 = 0;
  char v10 = 1;
  do
  {
    if (a2 >= 1)
    {
      uint64_t v11 = 0LL;
      do
      {
        int v12 = &a4[v11];
        uint64_t v13 = v12[1];
        uint64_t v16 = *a4;
        uint64_t v17 = v13;
        sub_100026FC0(v8, (unsigned int *)&v16, &v16);
        uint64_t v14 = v17;
        *a4 = v16;
        *((_BYTE *)a4 + 7) ^= v10 + (_BYTE)v11;
        v12[1] = v14;
        ++v11;
      }

      while (a2 != (_DWORD)v11);
    }

    ++v9;
    v10 += a2;
  }

  while (v9 != 6);
  sub_100026FC4(v8);
  return 0LL;
}

uint64_t sub_10000E0F0( __int128 *a1, unint64_t a2, unint64_t a3, const void *a4, const void *a5, _OWORD *a6)
{
  uint64_t v17 = a2;
  uint64_t v18 = a1;
  if (a3 > 5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = a2;
  uint64_t v11 = a1;
  if (a2 >= 0x41)
  {
    uint64_t v11 = &v22;
    if (!sub_100027430(1LL, &v18, &v17, &v22))
    {
      uint64_t v10 = 16LL;
      uint64_t v17 = 16LL;
      uint64_t v18 = &v22;
      goto LABEL_5;
    }

    return 0xFFFFFFFFLL;
  }

LABEL_5:
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __memcpy_chk(&v23, v11, v10, 64LL);
  uint64_t v12 = 0LL;
  v13.i64[0] = 0x3636363636363636LL;
  v13.i64[1] = 0x3636363636363636LL;
  do
  {
    *(__int128 *)((char *)&v23 + v12) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v23 + v12), v13);
    v12 += 16LL;
  }

  while (v12 != 64);
  int v20 = &v23;
  *(void *)&v19[0] = 64LL;
  if (a3)
  {
    memcpy(&v21, a4, 8 * a3);
    memcpy((char *)v19 + 8, a5, 8 * a3);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __memcpy_chk(&v23, v18, v17, 64LL);
  uint64_t v15 = 0LL;
  v16.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v16.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    *(__int128 *)((char *)&v23 + v15) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v23 + v15), v16);
    v15 += 16LL;
  }

  while (v15 != 64);
  int v20 = &v23;
  uint64_t v21 = a6;
  v19[0] = xmmword_10002AFC0;
  return sub_100027430(2LL, &v20, v19, a6);
}

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __memcpy_chk(&v23, v11, v10, 64LL);
  uint64_t v12 = 0LL;
  v13.i64[0] = 0x3636363636363636LL;
  v13.i64[1] = 0x3636363636363636LL;
  do
  {
    *(__int128 *)((char *)&v23 + v12) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v23 + v12), v13);
    v12 += 16LL;
  }

  while (v12 != 64);
  int v20 = (char *)&v23;
  *(void *)&v19[0] = 64LL;
  if (a3)
  {
    memcpy(v21, a4, 8 * a3);
    memcpy((char *)v19 + 8, a5, 8 * a3);
  }

  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __memcpy_chk(&v23, v18, v17, 64LL);
  uint64_t v15 = 0LL;
  v16.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
  v16.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
  do
  {
    *(__int128 *)((char *)&v23 + v15) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v23 + v15), v16);
    v15 += 16LL;
  }

  while (v15 != 64);
  int v20 = (char *)&v23;
  v21[0] = a6;
  v19[0] = xmmword_10002AFF0;
  return sub_100028038(2LL, &v20, v19, a6);
}

        uint64_t v12 = v12->next;
        if (!v12)
        {
          uint64_t v19 = 0xFFFFFFFFLL;
          goto LABEL_15;
        }
      }

      while (1)
      {
        addr = addresses->addr;
        if (addr)
        {
          if (addr->sa_family == 2) {
            break;
          }
        }

        addresses = addresses->next;
        if (!addresses) {
          goto LABEL_5;
        }
      }

      v16.s_addr = *(_DWORD *)&addr->sa_data[2];
      uint64_t v17 = inet_ntoa(v16);
      sub_100016BA4(a2, (unint64_t)v17, a3);
      uint64_t v19 = 0LL;
LABEL_15:
      uint64_t v18 = v21;
    }

    else
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = 0xFFFFFFFFLL;
    }

    pcap_freealldevs(v18);
  }

  return v19;
}

uint64_t sub_10000E2AC(__int128 *a1, unint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  return sub_10000E0F0(a1, a2, 1uLL, &v7, &v6, a5);
}

uint64_t sub_10000E2DC( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = ++dword_10003C328;
  if (dword_10003C32C < 0x3E9 || (v8 & 0x3FF) == 0)
  {
    uint64_t v11 = (unsigned __int8 *)result;
    sub_100016E40(1LL, "Add randomness: count=%u entropy=%u", a3, a4, a5, a6, a7, a8, v8);
    sub_100016734(v12);
    sub_100016F74(1LL, "random pool", (unsigned __int8 *)dword_10003C330, 128LL);
    sub_10000E3C4((unsigned __int8 *)v12, 16LL);
    sub_10000E3C4(v11, a2);
    uint64_t result = sub_100016F74(1LL, "random pool", (unsigned __int8 *)dword_10003C330, 128LL);
    ++dword_10003C32C;
    ++dword_10003C3B0;
  }

  return result;
}

uint64_t sub_10000E3C4(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t v2 = a2;
  unint64_t v3 = a1;
  uint64_t result = sub_100016F74(1LL, "random_mix_pool", a1, a2);
  if (v2)
  {
    unsigned int v5 = dword_10003C3C4;
    int v6 = dword_10003C3C0;
    do
    {
      int v7 = *v3++;
      int v8 = __ROR4__(v7, -(char)v6);
      if (v5) {
        int v9 = 7;
      }
      else {
        int v9 = 14;
      }
      v6 += v9;
      char v10 = v5 + 25;
      char v11 = v5 + 19;
      char v12 = v5 + 13;
      char v13 = v5 + 6;
      unsigned int v14 = v5 & 0x1F;
      unsigned int v5 = ((_BYTE)v5 - 1) & 0x1F;
      int v15 = dword_10003C330[v5] ^ v8 ^ dword_10003C330[v10 & 0x1F] ^ dword_10003C330[v11 & 0x1F];
      uint64_t result = dword_10003C330[v14];
      unsigned int v16 = v15 ^ dword_10003C330[v12 & 0x1F] ^ dword_10003C330[v13 & 0x1F] ^ result;
      dword_10003C330[v5] = dword_10002AFD0[v16 & 7] ^ (v16 >> 3);
      --v2;
    }

    while (v2);
    dword_10003C3C0 = v6;
    dword_10003C3C4 = v5;
  }

  return result;
}

uint64_t sub_10000E4BC( void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100016E40(0LL, "Get randomness: len=%u entropy=%u", a3, a4, a5, a6, a7, a8, a2);
  unsigned int v19 = sub_10001691C(a1, a2);
  int v20 = (unsigned __int8 *)a1;
  sub_100016F74(1LL, "random from os_get_random", (unsigned __int8 *)a1, a2);
  if (a2)
  {
    char v10 = a1;
    unint64_t v11 = a2;
    do
    {
      sub_10000F61C(byte_10003C3C8, 0x14uLL, (uint64_t)dword_10003C330, 128LL, (uint64_t)&v23);
      sub_10000E3C4((unsigned __int8 *)&v23, 20LL);
      uint64_t v12 = 0LL;
      int v13 = dword_10003C3C4;
      do
      {
        *(_DWORD *)&v22[v12] = dword_10003C330[v13 & 0x1F];
        v12 += 4LL;
        --v13;
      }

      while (v12 != 64);
      sub_10000F61C(byte_10003C3C8, 0x14uLL, (uint64_t)v22, 64LL, (uint64_t)&v23);
      LODWORD(v23) = v23 ^ v24;
      __int128 v21 = v23;
      sub_100016F74(1LL, "random from internal pool", (unsigned __int8 *)&v21, 16LL);
      uint64_t v14 = 0LL;
      if (v11 >= 0x10) {
        unint64_t v15 = 16LL;
      }
      else {
        unint64_t v15 = v11;
      }
      if (v15 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v15;
      }
      do
      {
        v10[v14] ^= v22[v14 - 12];
        ++v14;
      }

      while (v16 != v14);
      v10 += v14;
      v11 -= v15;
    }

    while (v11);
  }

  sub_100016F74(1LL, "mixed random", v20, a2);
  else {
    int v17 = 0;
  }
  dword_10003C32C = v17;
  return v19;
}

uint64_t sub_10000E6A8()
{
  return 1LL;
}

void sub_10000E6B0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_100016E40( 1LL,  "random: Mark internal entropy pool to be ready (count=%u/%u)",  a3,  a4,  a5,  a6,  a7,  a8,  ++dword_10003C3B4);
  sub_10000E6F0(v8, v9, v10, v11, v12, v13, v14, v15);
}

void sub_10000E6F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_10003C3B8 && (sub_10000E4BC(v30, 0x14uLL, a3, a4, a5, a6, a7, a8) & 0x80000000) == 0)
  {
    uint64_t v8 = fopen((const char *)qword_10003C3B8, "wb");
    if (v8)
    {
      uint64_t v15 = v8;
      char v16 = dword_10003C3B4;
      char __ptr = v16;
      if (fwrite(&__ptr, 1uLL, 1uLL, v8) == 1 && fwrite(v30, 0x14uLL, 1uLL, v15) == 1)
      {
        fclose(v15);
        sub_100016E40( 1LL,  "random: Updated entropy file %s (own_pool_ready=%u)",  v17,  v18,  v19,  v20,  v21,  v22,  qword_10003C3B8);
      }

      else
      {
        fclose(v15);
        sub_100016E40(4LL, "random: Could not write entropy data to %s", v23, v24, v25, v26, v27, v28, qword_10003C3B8);
      }
    }

    else
    {
      sub_100016E40( 4LL,  "random: Could not open entropy file %s for writing",  v9,  v10,  v11,  v12,  v13,  v14,  qword_10003C3B8);
    }
  }

void sub_10000E820(const char *a1)
{
  if (a1)
  {
    uint64_t v2 = strdup(a1);
    qword_10003C3B8 = (uint64_t)v2;
    if (v2)
    {
      uint64_t v2 = (const char *)sub_100016ADC(v2, &v17);
      if (v2)
      {
        uint64_t v10 = (char *)v2;
        if (v17 == 21)
        {
          dword_10003C3B4 = *(unsigned __int8 *)v2;
          sub_10000E2DC((uint64_t)(v2 + 1), 20LL, v4, v5, v6, v7, v8, v9);
          free(v10);
          uint64_t v2 = (const char *)sub_100016E40( 1LL,  "random: Added entropy from %s (own_pool_ready=%u)",  v11,  v12,  v13,  v14,  v15,  v16,  qword_10003C3B8);
        }

        else
        {
          sub_100016E40(1LL, "random: Invalid entropy file %s", v4, v5, v6, v7, v8, v9, qword_10003C3B8);
          free(v10);
        }
      }
    }
  }

  else
  {
    qword_10003C3B8 = 0LL;
  }

  sub_10000E6F0((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
}

void sub_10000E8F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  qword_10003C3B8 = 0LL;
}

uint64_t sub_10000E920( int8x16_t *a1, unsigned int *a2, int8x16_t *a3, uint64_t a4, _WORD *a5, void *a6, void *a7)
{
  int8x16_t v17 = veorq_s8(*a1, *a3);
  uint64_t v13 = 0LL;
  LODWORD(v16[0]) = *(_DWORD *)a4;
  WORD2(v16[0]) = *(_WORD *)(a4 + 4);
  HIWORD(v16[0]) = *a5;
  v16[1] = v16[0];
  do
  {
    *(_BYTE *)((unint64_t)&v15 | ((int)v13 + 8) & 0xFLL) = a1->i8[v13] ^ *((_BYTE *)v16 + v13);
    ++v13;
  }

  while (v13 != 16);
  int8x16_t v15 = veorq_s8(v15, v17);
  int8x16_t v17 = veorq_s8(v17, *a1);
  if (a6) {
    *a6 = v17.i64[0];
  }
  uint64_t result = 0LL;
  if (a7) {
    *a7 = v17.i64[1];
  }
  return result;
}

uint64_t sub_10000EA60( int8x16_t *a1, unsigned int *a2, int8x16_t *a3, void *a4, _DWORD *a5, _DWORD *a6, uint64_t a7, uint64_t a8)
{
  int8x16_t v24 = veorq_s8(*a1, *a3);
  int8x16_t v24 = veorq_s8(*a1, v23);
  v24.i8[15] ^= 1u;
  int8x16_t v22 = veorq_s8(v22, *a1);
  if (a4) {
    *a4 = v22.i64[1];
  }
  if (a7)
  {
    *(_DWORD *)a7 = v22.i32[0];
    *(_WORD *)(a7 + 4) = v22.i16[2];
  }

  if (a5)
  {
    for (uint64_t i = 0LL; i != 16; ++i)
      *(_BYTE *)((unint64_t)&v24 | ((int)i + 12) & 0xFLL) = a1->i8[i] ^ v23.i8[i];
    v24.i8[15] ^= 2u;
    for (uint64_t j = 0LL; j != 16; ++j)
      *((_BYTE *)a5 + j) ^= a1->u8[j];
  }

  if (a6)
  {
    for (uint64_t k = 0LL; k != 16; ++k)
      *(_BYTE *)((unint64_t)&v24 | ((int)k + 8) & 0xFLL) = a1->i8[k] ^ v23.i8[k];
    v24.i8[15] ^= 4u;
    for (uint64_t m = 0LL; m != 16; ++m)
      *((_BYTE *)a6 + m) ^= a1->u8[m];
  }

  if (!a8) {
    return 0LL;
  }
  for (uint64_t n = 0LL; n != 16; ++n)
    *(_BYTE *)((unint64_t)&v24 | ((int)n + 4) & 0xFLL) = a1->i8[n] ^ v23.i8[n];
  v24.i8[15] ^= 8u;
  for (iuint64_t i = 0LL; ii != 6; ++ii)
  {
    uint64_t result = 0LL;
    *(_BYTE *)(a8 + ii) = a1->i8[ii] ^ v24.i8[ii];
  }

  return result;
}

int8x16_t *sub_10000ECD8( int8x16_t *result, _WORD *a2, unsigned int *a3, uint64_t a4, int8x16_t *a5, uint64_t a6, _DWORD *a7, _DWORD *a8, void *a9, void *a10)
{
  if (*a10 <= 7uLL
    || (v17 = result, uint64_t result = (int8x16_t *)sub_10000E920(result, a3, a5, a4, a2, &v20, 0LL), (_DWORD)result)
    || (uint64_t result = (int8x16_t *)sub_10000EA60(v17, a3, a5, a9, a8, a7, (uint64_t)v19, 0LL), (_DWORD)result))
  {
    *a10 = 0LL;
  }

  else
  {
    uint64_t v18 = 0LL;
    *a10 = 8LL;
    do
    {
      *(_BYTE *)(a6 + v18) = v19[v18] ^ *(_BYTE *)(a4 + v18);
      ++v18;
    }

    while (v18 != 6);
    *(_WORD *)(a6 + 6) = *a2;
    *(void *)(a6 + 8) = v20;
  }

  return result;
}

uint64_t sub_10000EDFC(int8x16_t *a1, unsigned int *a2, int8x16_t *a3, uint64_t a4, uint64_t a5)
{
  __int16 v13 = 0;
  for (uint64_t i = 0LL; i != 6; ++i)
    *(_BYTE *)(a5 + i) = v12[i] ^ *(_BYTE *)(a4 + i);
  if (v14 == *(void *)(a4 + 6)) {
    return 0LL;
  }
  return 0xFFFFFFFFLL;
}

int8x8_t sub_10000EEEC(int8x16_t *a1, unsigned int *a2, int8x16_t *a3, _DWORD *a4, uint8x8_t *a5)
{
  if (!sub_10000EA60(a1, a2, a3, &v13, v12, v11, 0LL, 0LL))
  {
    int8x8_t v8 = veor_s8(v11[0], v11[1]);
    uint8x8_t v9 = (uint8x8_t)veor_s8(veor_s8(v12[1], v12[0]), v8);
    *a5 = v9;
    v8.i32[0] = HIDWORD(v13);
    v9.i32[0] = v13;
    int16x8_t v10 = (int16x8_t)vmovl_u8(v9);
    *(int8x8_t *)v10.i8 = veor_s8((int8x8_t)*(_OWORD *)&vmovl_u8((uint8x8_t)v8), *(int8x8_t *)v10.i8);
    int8x8_t result = vmovn_s16(v10);
    *a4 = result.i32[0];
  }

  return result;
}

uint64_t sub_10000EF94( int8x16_t *a1, unsigned int *a2, uint64_t a3, int8x16_t *a4, unsigned __int8 *a5, unsigned __int8 *a6, unsigned __int8 *a7, unsigned __int8 *a8, void *a9, uint64_t a10)
{
  *a9 = 8LL;
  sub_100016F74(1LL, "Milenage: RES", a8, 8LL);
  sub_100016F74(1LL, "Milenage: CK", a7, 16LL);
  sub_100016F74(1LL, "Milenage: IK", a6, 16LL);
  sub_100016F74(1LL, "Milenage: AK", v35, 6LL);
  for (uint64_t i = 0LL; i != 6; ++i)
    *((_BYTE *)&v33 + i + 4) = v35[i] ^ a5[i];
  sub_100016EB0(1LL, "Milenage: SQN", (unsigned __int8 *)&v33 + 4, 6LL);
  unsigned int v20 = bswap32(HIDWORD(v33));
  unsigned int v21 = bswap32(*(_DWORD *)a3);
  if (v20 == v21)
  {
    unsigned int v20 = bswap32(v34) >> 16;
    unsigned int v22 = bswap32(*(unsigned __int16 *)(a3 + 4));
    if (v20 == HIWORD(v22))
    {
      int v23 = 0;
      goto LABEL_13;
    }

    unsigned int v21 = HIWORD(v22);
  }

  if (v20 < v21) {
    int v23 = -1;
  }
  else {
    int v23 = 1;
  }
LABEL_13:
  if (v23 <= 0)
  {
    LOWORD(v36) = 0;
    if (!sub_10000EA60(a1, a2, a4, 0LL, 0LL, 0LL, 0LL, (uint64_t)v35))
    {
      sub_100016F74(1LL, "Milenage: AK*", v35, 6LL);
      for (uint64_t j = 0LL; j != 6; ++j)
        *(_BYTE *)(a10 + j) = v35[j] ^ *(_BYTE *)(a3 + j);
      if (!sub_10000E920(a1, a2, a4, a3, &v36, 0LL, (void *)(a10 + 6)))
      {
        sub_100016EB0(1LL, "Milenage: AUTS", (unsigned __int8 *)a10, 14LL);
        return 4294967294LL;
      }
    }
  }

  else
  {
    sub_100016EB0(1LL, "Milenage: AMF", a5 + 6, 2LL);
    if (!sub_10000E920(a1, a2, a4, (uint64_t)&v33 + 4, (_WORD *)a5 + 3, &v36, 0LL))
    {
      sub_100016EB0(1LL, "Milenage: MAC_A", (unsigned __int8 *)&v36, 8LL);
      uint64_t v31 = *((void *)a5 + 1);
      uint64_t v30 = a5 + 8;
      if (v36 == v31) {
        return 0LL;
      }
      sub_100016E40(1LL, "Milenage: MAC mismatch", v24, v25, v26, v27, v28, v29, v33);
      sub_100016EB0(1LL, "Milenage: Received MAC_A", v30, 8LL);
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10000F2C4(char *__s, uint64_t a2, uint64_t a3, int a4, char *a5, unint64_t a6)
{
  if (!a6) {
    return 0LL;
  }
  unint64_t v6 = a6;
  int v11 = 0;
  while (1)
  {
    ++v11;
    size_t v12 = strlen(__s);
    v22[0] = a2;
    v22[1] = v18;
    v21[0] = a3;
    v21[1] = 4LL;
    v18[0] = HIBYTE(v11);
    v18[1] = BYTE2(v11);
    v18[2] = BYTE1(v11);
    v18[3] = v11;
    __int128 __src = v25;
    int v20 = v26;
    if (a4 >= 2)
    {
      int v13 = 1;
      while (!sub_10000F61C(__s, v12, (uint64_t)&v25, 20LL, (uint64_t)&v23))
      {
        uint64_t v14 = 0LL;
        __int128 v25 = v23;
        int v26 = v24;
        do
        {
          *((_BYTE *)&__src + v14) ^= *((_BYTE *)&v23 + v14);
          ++v14;
        }

        while (v14 != 20);
        if (++v13 == a4) {
          goto LABEL_10;
        }
      }

      return 0xFFFFFFFFLL;
    }

uint64_t sub_10000F460( char *a1, unint64_t a2, unint64_t a3, const void *a4, const void *a5, uint64_t a6)
{
  uint64_t v17 = a2;
  uint64_t v18 = a1;
  if (a3 > 5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = a2;
  int v11 = a1;
  if (a2 >= 0x41)
  {
    int v11 = v22;
    if (!sub_100028038(1LL, &v18, &v17, (uint64_t)v22))
    {
      uint64_t v10 = 20LL;
      uint64_t v17 = 20LL;
      uint64_t v18 = v22;
      goto LABEL_5;
    }

    return 0xFFFFFFFFLL;
  }

uint64_t sub_10000F61C(char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  return sub_10000F460(a1, a2, 1uLL, &v7, &v6, a5);
}

uint64_t sub_10000F64C( char *a1, unint64_t a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, size_t a7)
{
  char v15 = 0;
  v17[0] = __s;
  v17[1] = a4;
  v16[0] = strlen(__s) + 1;
  v16[1] = a5;
  v17[2] = &v15;
  void v16[2] = 1LL;
  if (a7)
  {
    size_t v12 = 0LL;
    for (size_t i = a7; i >= 0x14; i -= 20LL)
    {
      v12 += 20LL;
      ++v15;
      if (v12 >= a7) {
        return 0LL;
      }
    }

    memcpy((void *)(a6 + v12), __src, i);
  }

  return 0LL;
}

uint64_t sub_10000F784(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v19 = 0;
  unint64_t v17 = 0LL;
  v18[0] = xmmword_10002B000;
  v18[1] = xmmword_10002B010;
  if (!a1)
  {
    unsigned int v12 = 0;
LABEL_19:
    unint64_t v14 = v17 + 8 * v12;
    unint64_t v17 = v14;
    unsigned int v15 = v12 + 1;
    unsigned int v19 = v12 + 1;
    v20[v12] = 0x80;
    if (v12 < 0x38)
    {
      if (v12 == 55) {
        goto LABEL_25;
      }
    }

    else
    {
      if (v12 != 63)
      {
        bzero((char *)&v17 + v12 + 45, 62 - v12 + 1LL);
        unsigned int v19 = 64;
      }

      sub_10000F9E0((uint64_t)&v17, v20);
      unsigned int v15 = 0;
    }

    bzero(&v20[v15], 55 - v15 + 1LL);
    unsigned int v19 = 56;
    unint64_t v14 = v17;
LABEL_25:
    unint64_t v21 = bswap64(v14);
    sub_10000F9E0((uint64_t)&v17, v20);
    for (uint64_t i = 0LL; i != 32; i += 4LL)
      *(_DWORD *)(a4 + i) = bswap32(*(_DWORD *)((char *)v18 + i));
    return 0LL;
  }

  uint64_t v8 = 0LL;
  while (v19 <= 0x40)
  {
    unint64_t v9 = *(void *)(a3 + 8 * v8);
    if (v9)
    {
      uint64_t v10 = *(char **)(a2 + 8 * v8);
      do
      {
        if (v9 < 0x40 || v19)
        {
          if (v9 >= 64 - v19) {
            size_t v11 = 64 - v19;
          }
          else {
            size_t v11 = v9;
          }
          memcpy(&v20[v19], v10, v11);
          v19 += v11;
          v10 += v11;
          v9 -= v11;
          if (v19 == 64)
          {
            sub_10000F9E0((uint64_t)&v17, v20);
            v17 += 512LL;
            unsigned int v19 = 0;
          }
        }

        else
        {
          sub_10000F9E0((uint64_t)&v17, v10);
          v17 += 512LL;
          v10 += 64;
          v9 -= 64LL;
        }
      }

      while (v9);
    }

    if (++v8 == a1)
    {
      unsigned int v12 = v19;
      if (v19 <= 0x3F) {
        goto LABEL_19;
      }
      return 0xFFFFFFFFLL;
    }
  }

  return 0xFFFFFFFFLL;
}

int32x4_t sub_10000F9E0(uint64_t a1, const char *a2)
{
  int8x16x4_t v40 = vld4q_s8(a2);
  __int128 v2 = *(_OWORD *)(a1 + 24);
  __int128 v38 = *(_OWORD *)(a1 + 8);
  __int128 v39 = v2;
  uint16x8_t v3 = vmovl_u8(*(uint8x8_t *)v40.val[0].i8);
  uint16x8_t v4 = vmovl_high_u8((uint8x16_t)v40.val[0]);
  _Q16 = vmovl_high_u8((uint8x16_t)v40.val[1]);
  _Q17 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v40.val[1].i8);
  int8x16_t v7 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q17.i8, 0x10uLL);
  __asm
  {
    SHLL2           V19.4S, V16.8H, #0x10
    SHLL2           V17.4S, V17.8H, #0x10
  }

  uint16x8_t v13 = vmovl_u8(*(uint8x8_t *)v40.val[2].i8);
  uint16x8_t v14 = vmovl_high_u8((uint8x16_t)v40.val[2]);
  int8x16_t v15 = vorrq_s8( vorrq_s8( (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q16.i8, 0x10uLL),  (int8x16_t)vshll_n_u16(*(uint16x4_t *)v14.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v4.i8), 0x18uLL));
  uint16x8_t v16 = vmovl_u8(*(uint8x8_t *)v40.val[3].i8);
  v40.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v40.val[3]);
  __darwin_time_t v37[2] = vorrq_s8(v15, (int8x16_t)vmovl_u16(*(uint16x4_t *)v40.val[0].i8));
  v37[3] = vorrq_s8( vorrq_s8( vorrq_s8(_Q19, (int8x16_t)vshll_high_n_u16(v14, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v4), 0x18uLL)),  (int8x16_t)vmovl_high_u16((uint16x8_t)v40.val[0]));
  v37[0] = vorrq_s8( vorrq_s8( vorrq_s8(v7, (int8x16_t)vshll_n_u16(*(uint16x4_t *)v13.i8, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v3.i8), 0x18uLL)),  (int8x16_t)vmovl_u16(*(uint16x4_t *)v16.i8));
  v37[1] = vorrq_s8( vorrq_s8( vorrq_s8(_Q17, (int8x16_t)vshll_high_n_u16(v13, 8uLL)),  (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v3), 0x18uLL)),  (int8x16_t)vmovl_high_u16(v16));
  uint64_t v17 = 64LL;
  int v18 = v37[0];
  do
  {
    HIDWORD(v19) = *(_DWORD *)((char *)v37 + v17 - 8);
    LODWORD(v19) = HIDWORD(v19);
    int v20 = (v19 >> 17) ^ __ROR4__(HIDWORD(v19), 19) ^ (HIDWORD(v19) >> 10);
    HIDWORD(v19) = *(_DWORD *)((char *)&v37[-3] + v17 - 12);
    LODWORD(v19) = HIDWORD(v19);
    *(_DWORD *)((char *)v37 + v17) = v20
                                   + *(_DWORD *)((char *)&v37[-1] + v17 - 12)
                                   + v18
                                   + ((v19 >> 7) ^ __ROR4__(HIDWORD(v19), 18) ^ (HIDWORD(v19) >> 3));
    v17 += 4LL;
    int v18 = HIDWORD(v19);
  }

  while (v17 != 256);
  uint64_t v21 = 0LL;
  unsigned int v22 = DWORD2(v39);
  unsigned int v23 = HIDWORD(v39);
  unsigned int v24 = v39;
  unsigned int v25 = DWORD1(v39);
  unsigned int v27 = v38;
  unsigned int v26 = DWORD1(v38);
  unsigned int v29 = DWORD2(v38);
  unsigned int v28 = HIDWORD(v38);
  do
  {
    unsigned int v30 = v25;
    unsigned int v31 = v22;
    unsigned int v25 = v24;
    int v32 = (v30 & v25 | v22 & ~v25)
        + *((_DWORD *)v37 + v21)
        + qword_10002B020[v21]
        + v23
        + (((v24 >> 6) | (v25 << 26)) ^ ((v24 >> 11) | (v25 << 21)) ^ ((v24 >> 25) | (v25 << 7)));
    unsigned int v24 = v32 + v28;
    unsigned int v28 = v29;
    unsigned int v29 = v26;
    unsigned int v26 = v27;
    HIDWORD(v33) = v27;
    LODWORD(v33) = v27;
    unsigned int v27 = ((v29 | v26) & v28 | v29 & v26) + ((v33 >> 2) ^ __ROR4__(v27, 13) ^ __ROR4__(v26, 22)) + v32;
    ++v21;
    unsigned int v23 = v22;
    unsigned int v22 = v30;
  }

  while (v21 != 64);
  uint64_t v34 = 0LL;
  HIDWORD(v39) = v31;
  LODWORD(v39) = v24;
  *(void *)((char *)&v39 + 4) = __PAIR64__(v30, v25);
  *(void *)&__int128 v38 = __PAIR64__(v26, v27);
  uint64_t v35 = a1 + 8;
  *((void *)&v38 + 1) = __PAIR64__(v28, v29);
  do
  {
    int32x4_t result = vaddq_s32(*(int32x4_t *)((char *)&v38 + v34), *(int32x4_t *)(v35 + v34));
    *(int32x4_t *)(v35 + v34) = result;
    v34 += 16LL;
  }

  while (v34 != 32);
  return result;
}

uint64_t sub_10000FC2C( uint64_t result, unint64_t a2, unint64_t a3, const void *a4, const void *a5, uint64_t a6)
{
  uint64_t v16 = a2;
  uint64_t v17 = (_BYTE *)result;
  if (a3 <= 5)
  {
    uint64_t v10 = a2;
    size_t v11 = (_BYTE *)result;
    if (a2 >= 0x41)
    {
      size_t v11 = v21;
      sub_10000F784(1LL, (uint64_t)&v17, (uint64_t)&v16, (uint64_t)v21);
      uint64_t v10 = 32LL;
      uint64_t v16 = 32LL;
      uint64_t v17 = v21;
    }

    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __memcpy_chk(&v22, v11, v10, 64LL);
    uint64_t v12 = 0LL;
    v13.i64[0] = 0x3636363636363636LL;
    v13.i64[1] = 0x3636363636363636LL;
    do
    {
      *(__int128 *)((char *)&v22 + v12) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v22 + v12), v13);
      v12 += 16LL;
    }

    while (v12 != 64);
    unint64_t v19 = &v22;
    *(void *)&v18[0] = 64LL;
    if (a3)
    {
      memcpy(v20, a4, 8 * a3);
      memcpy((char *)v18 + 8, a5, 8 * a3);
    }

    sub_10000F784(a3 + 1, (uint64_t)&v19, (uint64_t)v18, a6);
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __memcpy_chk(&v22, v17, v16, 64LL);
    uint64_t v14 = 0LL;
    v15.i64[0] = 0x5C5C5C5C5C5C5C5CLL;
    v15.i64[1] = 0x5C5C5C5C5C5C5C5CLL;
    do
    {
      *(__int128 *)((char *)&v22 + v14) = (__int128)veorq_s8(*(int8x16_t *)((char *)&v22 + v14), v15);
      v14 += 16LL;
    }

    while (v14 != 64);
    unint64_t v19 = &v22;
    v20[0] = a6;
    v18[0] = xmmword_10002B220;
    return sub_10000F784(2LL, (uint64_t)&v19, (uint64_t)v18, a6);
  }

  return result;
}

uint64_t sub_10000FDD0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  return sub_10000FC2C(a1, a2, 1uLL, &v7, &v6, a5);
}

void *sub_10000FE00( uint64_t a1, unint64_t a2, char *__s, uint64_t a4, uint64_t a5, uint64_t a6, size_t a7)
{
  v19[0] = 2LL;
  v20[0] = &v18;
  v20[1] = __s;
  int32x4_t result = (void *)strlen(__s);
  v19[1] = result;
  v19[2] = a5;
  v20[2] = a4;
  v20[3] = &v17;
  _OWORD v19[3] = 2LL;
  __int16 v17 = 8 * a7;
  if (a7)
  {
    size_t v14 = 0LL;
    __int16 v15 = 1;
    for (size_t i = a7; ; i -= 32LL)
    {
      __int16 v18 = v15;
      if (i < 0x20) {
        break;
      }
      int32x4_t result = (void *)sub_10000FC2C(a1, a2, 4uLL, v20, v19, a6 + v14);
      v14 += 32LL;
      ++v15;
      if (v14 >= a7) {
        return result;
      }
    }

    sub_10000FC2C(a1, a2, 4uLL, v20, v19, (uint64_t)__src);
    return memcpy((void *)(a6 + v14), __src, i);
  }

  return result;
}

uint64_t sub_10000FF30( int a1, int a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a3 + 24;
  unint64_t v9 = *(void *)(a3 + 8);
  if (*(void *)(a3 + 16)) {
    uint64_t v8 = *(void *)(a3 + 16);
  }
  if (v9 > 3)
  {
    unint64_t v11 = bswap32(*(unsigned __int16 *)(v8 + 2)) >> 16;
    if (v11 >= 5 && v9 >= v11)
    {
      int v13 = *(unsigned __int8 *)(v8 + 4);
      if (v13 == 254)
      {
        if (v11 > 0xB)
        {
          if (((*(unsigned __int8 *)(v8 + 5) << 16) | (*(unsigned __int8 *)(v8 + 6) << 8) | *(unsigned __int8 *)(v8 + 7)) == a1
            && bswap32(*(_DWORD *)(v8 + 8)) == a2)
          {
            uint64_t result = v8 + 12;
            *a4 = v11 - 12;
            return result;
          }

          uint64_t v10 = "EAP: Invalid expanded frame type";
        }

        else
        {
          uint64_t v10 = "EAP: Invalid expanded EAP length";
        }
      }

      else
      {
        if (!a1 && v13 == a2)
        {
          *a4 = v11 - 5;
          return v8 + 5;
        }

        uint64_t v10 = "EAP: Invalid frame type";
      }
    }

    else
    {
      uint64_t v10 = "EAP: Invalid EAP length";
    }
  }

  else
  {
    uint64_t v10 = "EAP: Too short EAP frame";
  }

  sub_100016E40(2LL, v10, a3, (uint64_t)a4, a5, a6, a7, a8, vars0);
  return 0LL;
}

unint64_t *sub_100010024(int a1, unsigned int a2, uint64_t a3, char a4, char a5)
{
  uint64_t v9 = 12LL;
  if (!a1) {
    uint64_t v9 = 5LL;
  }
  unsigned int v10 = v9 + a3;
  unint64_t v11 = sub_100017458(v9 + a3);
  __int16 v18 = v11;
  if (v11)
  {
    unint64_t v19 = sub_1000175AC(v11, 4LL, v12, v13, v14, v15, v16, v17);
    char *v19 = a4;
    v19[1] = a5;
    *((_WORD *)v19 + 1) = bswap32(v10) >> 16;
    if (a1)
    {
      *sub_1000175AC(v18, 1LL, v20, v21, v22, v23, v24, v25) = -2;
      int v32 = sub_1000175AC(v18, 3LL, v26, v27, v28, v29, v30, v31);
      *int v32 = BYTE2(a1);
      v32[1] = BYTE1(a1);
      v32[2] = a1;
      *(_DWORD *)sub_1000175AC(v18, 4LL, v33, v34, v35, v36, v37, v38) = bswap32(a2);
    }

    else
    {
      *sub_1000175AC(v18, 1LL, v20, v21, v22, v23, v24, v25) = a2;
    }
  }

  return v18;
}

uint64_t sub_1000100FC(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 8);
  if (v1 >= 4)
  {
    uint64_t v2 = *(void *)(result + 16);
    if (!v2) {
      uint64_t v2 = result + 24;
    }
    *(_WORD *)(v2 + 2) = bswap32(v1) >> 16;
  }

  return result;
}

uint64_t sub_100010128(uint64_t a1)
{
  if (*(void *)(a1 + 8) < 4uLL) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    uint64_t v2 = a1 + 24;
  }
  return *(unsigned __int8 *)(v2 + 1);
}

uint64_t sub_100010154(uint64_t a1)
{
  if (*(void *)(a1 + 8) < 5uLL) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    uint64_t v2 = a1 + 24;
  }
  return *(unsigned __int8 *)(v2 + 4);
}

uint64_t sub_100010180(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)(a1 + 112);
  *(_WORD *)(a2 + 4) = *(_WORD *)(a1 + 116);
  *(_DWORD *)a2 = v2;
  return 0LL;
}

uint64_t sub_100010198(uint64_t a1, uint64_t a2, unsigned int a3, u_char *a4, size_t a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 136)) {
    return pcap_sendpacket(*(pcap_t **)a1, a4, a5);
  }
  unint64_t v11 = (char *)malloc(a5 + 14);
  if (!v11) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v12 = (u_char *)v11;
  *(_DWORD *)unint64_t v11 = *(_DWORD *)a2;
  *((_WORD *)v11 + 2) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(v11 + 6) = *(_DWORD *)(a1 + 112);
  *((_WORD *)v11 + 5) = *(_WORD *)(a1 + 116);
  *((_WORD *)v11 + 6) = __rev16(a3);
  memcpy(v11 + 14, a4, a5);
  uint64_t v13 = pcap_sendpacket(*(pcap_t **)a1, v12, a5 + 14);
  free(v12);
  return v13;
}

uint64_t sub_100010280(unint64_t a1, int *a2, int a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v12 = sub_100016B98(0x90uLL);
  uint64_t v13 = (uint64_t)v12;
  if (!v12) {
    return v13;
  }
  sub_100016BA4(v12 + 12, a1, 100LL);
  *(void *)(v13 + 120) = a4;
  *(void *)(v13 + 128) = a5;
  *(_DWORD *)(v13 + 136) = a6;
  if (a2)
  {
    int v14 = *a2;
    *(_WORD *)(v13 + 116) = *((_WORD *)a2 + 2);
    *(_DWORD *)(v13 + 112) = v14;
  }

  pcap_lookupnet((const char *)(v13 + 12), &v29, &v30, v31);
  uint64_t v15 = pcap_open_live((const char *)(v13 + 12), 2500, 0, 10, v31);
  *(void *)uint64_t v13 = v15;
  if (!v15)
  {
    fprintf(__stderrp, "pcap_open_live: %s\n", v31);
    fprintf(__stderrp, "ifname='%s'\n");
LABEL_19:
    free((void *)v13);
    return 0LL;
  }

  if (pcap_datalink(v15) != 1 && pcap_set_datalink(*(pcap_t **)v13, 1) < 0)
  {
    uint64_t v23 = __stderrp;
    uint64_t v26 = pcap_geterr(*(pcap_t **)v13);
    uint64_t v24 = "pcap_set_datalink(DLT_EN10MB): %s\n";
    goto LABEL_18;
  }

  if (pcap_setnonblock(*(pcap_t **)v13, 1, v31) < 0)
  {
    uint64_t v16 = __stderrp;
    uint64_t v17 = pcap_geterr(*(pcap_t **)v13);
    fprintf(v16, "pcap_setnonblock: %s\n", v17);
  }

  snprintf( __str,  0xC8uLL,  "not ether src %02x:%02x:%02x:%02x:%02x:%02x and(ether dst %02x:%02x:%02x:%02x:%02x:%02x or ether dst %02x:%02x:%02 x:%02x:%02x:%02x) and ether proto 0x%x",  *(unsigned __int8 *)(v13 + 112),  *(unsigned __int8 *)(v13 + 113),  *(unsigned __int8 *)(v13 + 114),  *(unsigned __int8 *)(v13 + 115),  *(unsigned __int8 *)(v13 + 116),  *(unsigned __int8 *)(v13 + 117),  *(unsigned __int8 *)(v13 + 112),  *(unsigned __int8 *)(v13 + 113),  *(unsigned __int8 *)(v13 + 114),  *(unsigned __int8 *)(v13 + 115),  *(unsigned __int8 *)(v13 + 116),  *(unsigned __int8 *)(v13 + 117),  1,  128,  194,  0,  0,  3,  a3);
  if (pcap_compile(*(pcap_t **)v13, &v28, __str, 1, v29) < 0)
  {
    uint64_t v23 = __stderrp;
    uint64_t v26 = pcap_geterr(*(pcap_t **)v13);
    uint64_t v24 = "pcap_compile: %s\n";
LABEL_18:
    fprintf(v23, v24, v26);
    goto LABEL_19;
  }

  if (pcap_setfilter(*(pcap_t **)v13, &v28) < 0)
  {
    uint64_t v23 = __stderrp;
    uint64_t v26 = pcap_geterr(*(pcap_t **)v13);
    uint64_t v24 = "pcap_setfilter: %s\n";
    goto LABEL_18;
  }

  pcap_freecode(&v28);
  int v27 = 1;
  int v18 = pcap_fileno(*(pcap_t **)v13);
  if (ioctl(v18, 0x80044270uLL, &v27) < 0)
  {
    unint64_t v19 = __stderrp;
    uint64_t v20 = __error();
    uint64_t v21 = strerror(*v20);
    fprintf( v19,  "%s: cannot enable immediate mode on interface %s: %s\n",  "l2_packet_init_libpcap",  (const char *)(v13 + 12),  v21);
  }

  CFSocketNativeHandle selectable_fd = pcap_get_selectable_fd(*(pcap_t **)v13);
  sub_100025CA4(selectable_fd, (uint64_t)sub_1000107C8, v13, *(void *)v13);
  return v13;
}

void sub_1000105A0( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100026438((uint64_t)sub_1000105E8, (uint64_t)a1, *a1, a4, a5, a6, a7, a8);
    if (*a1) {
      pcap_close((pcap_t *)*a1);
    }
    free(a1);
  }

uint64_t sub_1000105E8(uint64_t a1, pcap_t *a2)
{
  int v4 = *(_DWORD *)(a1 + 8);
  if (v4)
  {
    *(_DWORD *)(a1 + 8) = v4 - 1;
    unsigned int v5 = 20000;
  }

  else
  {
    unsigned int v5 = 100000;
  }

  sub_100026220(0, v5, (uint64_t)sub_1000105E8, a1, (uint64_t)a2);
  return pcap_dispatch(a2, 10, (pcap_handler)sub_100010860, (u_char *)a1);
}

uint64_t sub_100010654(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  if (pcap_findalldevs(&v21, v22) < 0)
  {
    sub_100016E40(1LL, "pcap_findalldevs: %s\n", v6, v7, v8, v9, v10, v11, (uint64_t)v22);
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t v12 = v21;
    if (v21)
    {
      uint64_t v13 = (const char *)(a1 + 12);
      while (1)
      {
        if (!strcmp(v12->name, v13))
        {
          addresses = v12->addresses;
          if (addresses) {
            break;
          }
        }

uint64_t sub_100010778( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_DWORD *)(a1 + 8) = 150;
  sub_100026438((uint64_t)sub_1000105E8, a1, *(void *)a1, a4, a5, a6, a7, a8);
  return sub_100026220(0, 0x2710u, (uint64_t)sub_1000105E8, a1, *(void *)a1);
}

const u_char *sub_1000107C8(int a1, uint64_t a2, pcap_t *a3)
{
  uint64_t result = pcap_next(a3, &v6);
  if (result && v6.caplen >= 0xE)
  {
    if (*(_DWORD *)(a2 + 136)) {
      capleuint64_t n = v6.caplen;
    }
    else {
      capleuint64_t n = v6.caplen - 14LL;
    }
    return (const u_char *)(*(uint64_t (**)(void, const u_char *, const u_char *, uint64_t))(a2 + 120))( *(void *)(a2 + 128),  result + 6,  &result[14 * (*(_DWORD *)(a2 + 136) == 0)],  caplen);
  }

  return result;
}

uint64_t sub_100010860(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(unsigned int *)(a2 + 16);
    if (v3 >= 0xE)
    {
      uint64_t v4 = result;
      if (*(_DWORD *)(result + 136)) {
        uint64_t v5 = *(unsigned int *)(a2 + 16);
      }
      else {
        uint64_t v5 = v3 - 14;
      }
      uint64_t result = (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t))(result + 120))( *(void *)(result + 128),  a3 + 6,  a3 + 14LL * (*(_DWORD *)(result + 136) == 0),  v5);
      *(_DWORD *)(v4 + 8) = 150;
    }
  }

  return result;
}

uint64_t sub_1000108C0(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_1000108C8(uint64_t a1)
{
  return *(void *)a1;
}

char *sub_1000108D0(char a1, char a2)
{
  uint64_t v4 = (char *)sub_100016B98(0x28uLL);
  if (v4)
  {
    uint64_t v5 = sub_100017458(1024LL);
    *(void *)uint64_t v4 = v5;
    if (v5 && (pcap_pkthdr v6 = sub_100016B98(0x80uLL), (*((void *)v4 + 2) = v6) != 0LL))
    {
      *(_OWORD *)(v4 + 24) = xmmword_10002B230;
      uint64_t v13 = sub_1000175AC(*(unint64_t **)v4, 20LL, v7, v8, v9, v10, v11, v12);
      *((void *)v4 + 1) = v13;
      *uint64_t v13 = a1;
      v13[1] = a2;
    }

    else
    {
      sub_100010960((uint64_t)v4);
      return 0LL;
    }
  }

  return v4;
}

void sub_100010960(uint64_t a1)
{
  if (a1)
  {
    sub_10001757C(*(void ***)a1);
    free(*(void **)(a1 + 16));
    free((void *)a1);
  }

uint64_t sub_100010998(void *a1)
{
  int v2 = (unsigned __int8 *)a1[1];
  int v3 = *v2;
  uint64_t v4 = "?Unknown?";
  uint64_t result = printf( "RADIUS message: code=%d (%s) identifier=%d length=%d\n",  v3,  v4,  v2[1],  bswap32(*((unsigned __int16 *)v2 + 1)) >> 16);
  if (a1[4])
  {
    unint64_t v6 = 0LL;
    do
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = *a1 + 24LL;
      if (*(void *)(*a1 + 16LL)) {
        uint64_t v8 = *(void *)(*a1 + 16LL);
      }
      uint64_t v9 = (unsigned __int8 *)(v8 + *(void *)(a1[2] + 8LL * (int)v6));
      int v10 = *v9;
      while (byte_1000386F8[v7] != v10)
      {
        v7 += 24LL;
        if (v7 == 984)
        {
          uint64_t result = printf("   Attribute %d (%s) length=%d\n");
          goto LABEL_21;
        }
      }

      uint64_t v11 = &byte_1000386F8[v7];
      uint64_t result = printf("   Attribute %d (%s) length=%d\n", v10, *(const char **)&byte_1000386F8[v7 + 8], v9[1]);
      int v12 = *((_DWORD *)v11 + 4);
      unsigned int v13 = v9[1];
      uint64_t v14 = v13 - 2;
      uint64_t v15 = (in_addr_t *)(v9 + 2);
      switch(v12)
      {
        case 0:
        case 3:
          printf("      Value:");
          if (v13 >= 3)
          {
            do
            {
              int v16 = *(unsigned __int8 *)v15;
              uint64_t v15 = (in_addr_t *)((char *)v15 + 1);
              printf(" %02x", v16);
              --v14;
            }

            while (v14);
          }

          uint64_t result = putchar(10);
          break;
        case 1:
          printf("      Value: '");
          if (v13 >= 3)
          {
            do
            {
              int v18 = *(char *)v15;
              uint64_t v15 = (in_addr_t *)((char *)v15 + 1);
              int v17 = v18;
              else {
                putchar(v17);
              }
              --v14;
            }

            while (v14);
          }

          uint64_t result = puts("'");
          break;
        case 2:
          if (v13 == 6)
          {
            v19.s_addr = *v15;
            inet_ntoa(v19);
            uint64_t result = printf("      Value: %s\n");
          }

          else
          {
            uint64_t result = printf("      Invalid IP address length %d\n");
          }

          break;
        case 4:
          if (v13 == 6) {
            uint64_t result = printf("      Value: %u\n");
          }
          else {
            uint64_t result = printf("      Invalid INT32 length %d\n");
          }
          break;
        default:
          break;
      }

uint64_t sub_100010C04( void *a1, __int128 *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    v26[0] = 0LL;
    v26[1] = 0LL;
    uint64_t v11 = sub_100010D0C((uint64_t)a1, 80, v26, 0x10uLL, a5, a6, a7, a8);
    if (!v11)
    {
      sub_100016E40(3LL, "RADIUS: Could not add Message-Authenticator", v12, v13, v14, v15, v16, v17, v25);
      return 0xFFFFFFFFLL;
    }

    uint64_t v18 = *a1;
    uint64_t v19 = *(void *)(*a1 + 8LL);
    *(_WORD *)(a1[1] + 2LL) = bswap32(v19) >> 16;
    uint64_t v20 = *(void *)(v18 + 16);
    uint64_t v21 = v18 + 24;
    if (v20) {
      uint64_t v22 = v20;
    }
    else {
      uint64_t v22 = v21;
    }
    sub_10000E2AC(a2, a3, v22, v19, v11 + 2);
    unint64_t v23 = *(void *)(*a1 + 8LL);
  }

  else
  {
    unint64_t v23 = *(void *)(*a1 + 8LL);
    *(_WORD *)(a1[1] + 2LL) = bswap32(v23) >> 16;
  }

  if (v23 < 0x10000) {
    return 0LL;
  }
  sub_100016E40(3LL, "RADIUS: Too long message (%lu)", a3, a4, a5, a6, a7, a8, v23);
  return 0xFFFFFFFFLL;
}

char *sub_100010D0C( uint64_t a1, char a2, const void *a3, size_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a4 >= 0xFE)
  {
    printf("radius_msg_add_attr: too long attribute (%lu bytes)\n", a4);
    return 0LL;
  }

  char v13 = a4 + 2;
  uint64_t v14 = *(unint64_t **)a1;
  if (*v14 - v14[1] < a4 + 2)
  {
    if ((sub_10001737C((void **)a1, a4 + 2) & 0x80000000) != 0) {
      return 0LL;
    }
    uint64_t v14 = *(unint64_t **)a1;
    uint64_t v15 = *(void *)(*(void *)a1 + 16LL);
    if (!v15) {
      uint64_t v15 = *(void *)a1 + 24LL;
    }
    *(void *)(a1 + 8) = v15;
  }

  uint64_t v22 = sub_1000175AC(v14, 2LL, (uint64_t)a3, a4, a5, a6, a7, a8);
  *uint64_t v22 = a2;
  v22[1] = v13;
  if (a3)
  {
    unint64_t v23 = sub_1000175AC(*(unint64_t **)a1, a4, v16, v17, v18, v19, v20, v21);
    memcpy(v23, a3, a4);
  }

  else {
    return v22;
  }
}

uint64_t sub_100010DF0( void *a1, __int128 *a2, unint64_t a3, __int128 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v30[0] = 0LL;
  v30[1] = 0LL;
  uint64_t v12 = sub_100010D0C((uint64_t)a1, 80, v30, 0x10uLL, a5, a6, a7, a8);
  if (!v12)
  {
    puts("WARNING: Could not add Message-Authenticator");
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = a1[1];
  *(_WORD *)(v13 + 2) = bswap32(*(unsigned __int16 *)(*a1 + 8LL)) >> 16;
  *(_OWORD *)(v13 + 4) = *a4;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v14 = *(void *)(*a1 + 16LL);
  }
  else {
    uint64_t v14 = *a1 + 24LL;
  }
  sub_10000E2AC(a2, a3, v14, *(void *)(*a1 + 8LL), v12 + 2);
  uint64_t v16 = *a1;
  uint64_t v15 = (__int128 *)a1[1];
  v29[0] = v15;
  v29[1] = a4;
  __int128 v26 = xmmword_10002B240;
  uint64_t v17 = *(void *)(v16 + 16);
  if (!v17) {
    uint64_t v17 = v16 + 24;
  }
  v29[2] = (__int128 *)(v17 + 20);
  uint64_t v18 = *(void *)(v16 + 8) - 20LL;
  v29[3] = a2;
  uint64_t v27 = v18;
  unint64_t v28 = a3;
  sub_100027430(4LL, v29, &v26, (__int128 *)((char *)v15 + 4));
  if (*(void *)(*a1 + 8LL) >= 0x10000uLL)
  {
    sub_100016E40(3LL, "RADIUS: Too long message (%lu)", v19, v20, v21, v22, v23, v24, *(void *)(*a1 + 8LL));
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

uint64_t sub_100010F3C(void *a1, __int128 *a2, uint64_t a3)
{
  uint64_t v4 = a1[1];
  *(_WORD *)(v4 + 2) = bswap32(*(unsigned __int16 *)(*a1 + 8LL)) >> 16;
  *(void *)(v4 + 12) = 0LL;
  *(void *)(v4 + 4) = 0LL;
  uint64_t v5 = a1[1];
  unint64_t v6 = (__int128 *)(*a1 + 24LL);
  uint64_t v7 = *(void *)(*a1 + 8LL);
  if (*(void *)(*a1 + 16LL)) {
    unint64_t v6 = *(__int128 **)(*a1 + 16LL);
  }
  v16[0] = v6;
  v16[1] = a2;
  v15[0] = v7;
  v15[1] = a3;
  uint64_t result = sub_100027430(2LL, v16, v15, (_OWORD *)(v5 + 4));
  if (*(void *)(*a1 + 8LL) >= 0x10000uLL) {
    return sub_100016E40(3LL, "RADIUS: Too long messages (%lu)", v9, v10, v11, v12, v13, v14, *(void *)(*a1 + 8LL));
  }
  return result;
}

uint64_t sub_100010FFC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = *(void *)(a1 + 24);
  unint64_t v5 = *(void *)(a1 + 32);
  if (v5 >= v4)
  {
    int v7 = 2 * v4;
    unint64_t v6 = realloc(*(void **)(a1 + 16), 16LL * (_DWORD)v4);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    *(void *)(a1 + 16) = v6;
    *(void *)(a1 + 24) = v7;
    unint64_t v5 = *(void *)(a1 + 32);
  }

  else
  {
    unint64_t v6 = *(void **)(a1 + 16);
  }

  uint64_t v8 = 0LL;
  uint64_t v9 = *(void *)a1 + 24LL;
  if (*(void *)(*(void *)a1 + 16LL)) {
    uint64_t v9 = *(void *)(*(void *)a1 + 16LL);
  }
  *(void *)(a1 + memset(&v9[1], 0, 32) = v5 + 1;
  v6[v5] = a2 - v9;
  return v8;
}

char *sub_10001108C( unsigned __int16 *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  if (a1 && a2 >= 0x14)
  {
    size_t v10 = bswap32(a1[1]) >> 16;
    if (v10 < 0x14 || a2 < v10)
    {
      sub_100016E40(2LL, "RADIUS: Invalid message length", a3, a4, a5, a6, a7, a8, v21);
      return 0LL;
    }

    if (a2 > v10) {
      sub_100016E40(1LL, "RADIUS: Ignored %lu extra bytes after RADIUS message", a3, a4, a5, a6, a7, a8, a2 - v10);
    }
    uint64_t v8 = (char *)sub_100016B98(0x28uLL);
    if (v8)
    {
      uint64_t v12 = sub_1000174B8(a1, v10);
      *(void *)uint64_t v8 = v12;
      if (!v12 || (uint64_t v13 = sub_100016B98(0x80uLL), (*((void *)v8 + 2) = v13) == 0LL))
      {
LABEL_26:
        sub_100010960((uint64_t)v8);
        return 0LL;
      }

      *(_OWORD *)(v8 + 24) = xmmword_10002B230;
      uint64_t v14 = *(void *)(*(void *)v8 + 8LL);
      if (*(void *)(*(void *)v8 + 16LL)) {
        uint64_t v15 = *(void *)(*(void *)v8 + 16LL);
      }
      else {
        uint64_t v15 = *(void *)v8 + 24LL;
      }
      *((void *)v8 + 1) = v15;
      if (v14 >= 21)
      {
        unint64_t v16 = v15 + v14;
        unint64_t v17 = v15 + 20;
        while (v16 - v17 >= 2)
        {
          unint64_t v18 = *(unsigned __int8 *)(v17 + 1);
          BOOL v19 = v18 < 2 || v17 + v18 > v16;
          v17 += *(unsigned __int8 *)(v17 + 1);
          if (v17 >= v16) {
            return v8;
          }
        }

        goto LABEL_26;
      }
    }
  }

  return v8;
}

char *sub_1000111CC( uint64_t a1, char *a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (a3)
  {
    if (a3 >= 0xFD) {
      size_t v11 = 253LL;
    }
    else {
      size_t v11 = a3;
    }
    uint64_t result = sub_100010D0C(a1, 79, a2, v11, a5, a6, a7, a8);
    a2 += v11;
    a3 -= v11;
    if (!result) {
      return result;
    }
  }

  return (char *)1;
}

void *sub_100011238(void *a1, size_t *a2)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v3 = a1[4];
  if (!v3) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  size_t v6 = 0LL;
  uint64_t v7 = *a1 + 24LL;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v7 = *(void *)(*a1 + 16LL);
  }
  uint64_t v8 = a1[4];
  do
  {
    uint64_t v9 = (_BYTE *)(v7 + *(void *)(a1[2] + (v5 >> 29)));
    if (*v9 == 79) {
      size_t v6 = v6 + v9[1] - 2;
    }
    v5 += (uint64_t)&_mh_execute_header;
    --v8;
  }

  while (v8);
  if (!v6) {
    return 0LL;
  }
  size_t v10 = (char *)malloc(v6);
  size_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    uint64_t v14 = v10;
    do
    {
      uint64_t v15 = *a1 + 24LL;
      if (*(void *)(*a1 + 16LL)) {
        uint64_t v15 = *(void *)(*a1 + 16LL);
      }
      unint64_t v16 = (_BYTE *)(v15 + *(void *)(a1[2] + (v12 >> 29)));
      if (*v16 == 79)
      {
        size_t v17 = v16[1] - 2LL;
        memcpy(v14, v16 + 2, v17);
        v14 += v17;
        unint64_t v3 = a1[4];
      }

      ++v13;
      v12 += (uint64_t)&_mh_execute_header;
    }

    while (v13 < v3);
    if (a2) {
      *a2 = v6;
    }
  }

  return v11;
}

uint64_t sub_100011374(void *a1, __int128 *a2, unint64_t a3, _OWORD *a4)
{
  uint64_t v4 = a1[4];
  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = *a1 + 24LL;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v8 = *(void *)(*a1 + 16LL);
  }
  do
  {
    uint64_t v9 = v8 + *(void *)(a1[2] + (v6 >> 29));
    if (*(_BYTE *)v9 == 80)
    {
      if (v7)
      {
        unint64_t v13 = "Multiple Message-Authenticator attributes in RADIUS message";
        goto LABEL_25;
      }
    }

    else
    {
      uint64_t v9 = v7;
    }

    v6 += (uint64_t)&_mh_execute_header;
    uint64_t v7 = v9;
    --v4;
  }

  while (v4);
  if (v9)
  {
    size_t v10 = (_OWORD *)(v9 + 2);
    __int128 v18 = *(_OWORD *)(v9 + 2);
    *(void *)(v9 + 10) = 0LL;
    *(void *)(v9 + 2) = 0LL;
    if (a4)
    {
      uint64_t v11 = a1[1];
      __int128 v17 = *(_OWORD *)(v11 + 4);
      *(_OWORD *)(v11 + 4) = *a4;
      if (*(void *)(*a1 + 16LL)) {
        uint64_t v12 = *(void *)(*a1 + 16LL);
      }
      else {
        uint64_t v12 = *a1 + 24LL;
      }
      sub_10000E2AC(a2, a3, v12, *(void *)(*a1 + 8LL), &v19);
      _OWORD *v10 = v18;
      *(_OWORD *)(a1[1] + 4LL) = v17;
    }

    else
    {
      if (*(void *)(*a1 + 16LL)) {
        uint64_t v14 = *(void *)(*a1 + 16LL);
      }
      else {
        uint64_t v14 = *a1 + 24LL;
      }
      sub_10000E2AC(a2, a3, v14, *(void *)(*a1 + 8LL), &v19);
      _OWORD *v10 = v18;
    }

    if ((void)v18 == (void)v19 && *((void *)&v18 + 1) == *((void *)&v19 + 1)) {
      return 0LL;
    }
    unint64_t v13 = "Invalid Message-Authenticator!";
  }

  else
  {
LABEL_15:
    unint64_t v13 = "No Message-Authenticator attribute found";
  }

uint64_t sub_100011508(uint64_t *a1, __int128 *a2, unint64_t a3, uint64_t a4, int a5)
{
  if (a4)
  {
    uint64_t v9 = (__int128 *)(*(void *)(a4 + 8) + 4LL);
    uint64_t v10 = *a1;
    v23[0] = (__int128 *)a1[1];
    v23[1] = v9;
    __int128 v20 = xmmword_10002B240;
    uint64_t v11 = *(void *)(v10 + 16);
    if (!v11) {
      uint64_t v11 = v10 + 24;
    }
    v23[2] = (__int128 *)(v11 + 20);
    uint64_t v12 = *(void *)(v10 + 8) - 20LL;
    v23[3] = a2;
    uint64_t v21 = v12;
    unint64_t v22 = a3;
    sub_100027430(4LL, v23, &v20, &v19);
    uint64_t v13 = a1[1];
    uint64_t v14 = *(void *)(v13 + 4);
    uint64_t v15 = *(void *)(v13 + 12);
    if ((void)v19 == v14 && *((void *)&v19 + 1) == v15) {
      return 0LL;
    }
    __int128 v17 = "Response Authenticator invalid!";
  }

  else
  {
    __int128 v17 = "No matching Access-Request message found";
  }

  puts(v17);
  return 1LL;
}

uint64_t sub_100011628( uint64_t a1, void *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8 = a2[4];
  if (v8)
  {
    uint64_t v12 = 0LL;
    uint64_t v13 = 0LL;
    unint64_t v14 = 0LL;
    while (1)
    {
      uint64_t v15 = *a2 + 24LL;
      if (*(void *)(*a2 + 16LL)) {
        uint64_t v15 = *(void *)(*a2 + 16LL);
      }
      unint64_t v16 = (unsigned __int8 *)(v15 + *(void *)(a2[2] + (v12 >> 29)));
      if (*v16 == a3)
      {
        if (!sub_100010D0C(a1, a3, v16 + 2, v16[1] - 2LL, a5, a6, a7, a8)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v13 = (v13 + 1);
        unint64_t v8 = a2[4];
      }

      ++v14;
      v12 += (uint64_t)&_mh_execute_header;
      if (v14 >= v8) {
        return v13;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000116F4(uint64_t a1, __int128 *a2, uint64_t a3)
{
  uint64_t v7 = j__random();
  v10[0] = (__int128 *)v8;
  v10[1] = a2;
  v9[0] = 16LL;
  v9[1] = a3;
  v10[2] = (__int128 *)&v7;
  _BYTE v9[2] = 8LL;
  return sub_100027430(3LL, v10, v9, (_OWORD *)(*(void *)(a1 + 8) + 4LL));
}

void *sub_10001179C(void *a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4 = 0LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = sub_100016B98(0x20uLL);
      if (v4)
      {
        uint64_t v9 = sub_100011884(a1, 311, 16, &v14);
        if (v9)
        {
          uint64_t v10 = v9;
          *uint64_t v4 = sub_10001197C((uint64_t)v9, v14, *(void *)(a2 + 8) + 4LL, a3, a4, v4 + 1);
          free(v10);
        }

        uint64_t v11 = sub_100011884(a1, 311, 17, &v14);
        if (v11)
        {
          uint64_t v12 = v11;
          v4[2] = sub_10001197C((uint64_t)v11, v14, *(void *)(a2 + 8) + 4LL, a3, a4, v4 + 3);
          free(v12);
        }
      }
    }
  }

  return v4;
}

void *sub_100011884(void *a1, int a2, int a3, size_t *a4)
{
  uint64_t v4 = a1[4];
  if (v4)
  {
    uint64_t v6 = 0LL;
    uint64_t v7 = *a1 + 24LL;
    if (*(void *)(*a1 + 16LL)) {
      uint64_t v7 = *(void *)(*a1 + 16LL);
    }
    do
    {
      uint64_t v8 = v7 + *(void *)(a1[2] + 8LL * (int)v6);
      if (*(_BYTE *)v8 == 26)
      {
        uint64_t v9 = *(unsigned __int8 *)(v8 + 1);
        if ((unint64_t)(v9 - 2) >= 4)
        {
          unint64_t v10 = v9 - 6;
          if (bswap32(*(_DWORD *)(v8 + 2)) == a2 && v10 >= 2)
          {
            uint64_t v12 = (unsigned __int8 *)(v8 + 6);
            do
            {
              unint64_t v13 = v12[1];
              size_t v14 = v13 - 2;
              if (v13 < 2 || v10 < v13) {
                break;
              }
              if (*v12 == a3)
              {
                __int128 v18 = malloc(v13 - 2);
                unint64_t v16 = v18;
                if (v18)
                {
                  memcpy(v18, v12 + 2, v14);
                  if (a4) {
                    *a4 = v14;
                  }
                }

                return v16;
              }

              v12 += v13;
              v10 -= v13;
            }

            while (v10 > 1);
          }
        }
      }

      ++v6;
    }

    while (v6 != v4);
  }

  return 0LL;
}

void *sub_10001197C(uint64_t a1, unint64_t a2, uint64_t a3, __int128 *a4, uint64_t a5, size_t *a6)
{
  if (a2 < 0x12) {
    return 0LL;
  }
  unint64_t v7 = a2 - 2;
  if (((a2 - 2) & 0xF) != 0)
  {
    printf("Invalid ms key len %lu\n", a2 - 2);
    return 0LL;
  }

  unint64_t v13 = malloc(a2 - 2);
  if (!v13) {
    return 0LL;
  }
  uint64_t v23 = a6;
  char v14 = 0;
  uint64_t v15 = a1 + 2;
  *unint64_t v13 = 0;
  unint64_t v16 = v13;
  uint64_t v24 = v13;
  do
  {
    uint64_t v27 = a4;
    uint64_t v25 = a5;
    if ((v14 & 1) != 0)
    {
      uint64_t v28 = v15 - 16;
      *(void *)&__int128 v26 = 16LL;
      uint64_t v17 = 2LL;
    }

    else
    {
      uint64_t v28 = a3;
      uint64_t v29 = a1;
      uint64_t v17 = 3LL;
      __int128 v26 = xmmword_10002B250;
    }

    sub_100027430(v17, &v27, &v25, &v30);
    for (uint64_t i = 0LL; i != 16; ++i)
      v16[i] = *((_BYTE *)&v30 + i) ^ *(_BYTE *)(v15 + i);
    v15 += 16LL;
    v16 += 16;
    char v14 = 1;
    v7 -= 16LL;
  }

  while (v7);
  size_t v19 = *v24;
  if (!*v24 || a2 - 3 < v19)
  {
    puts("Failed to decrypt MPPE key");
    free(v24);
    return 0LL;
  }

  unint64_t v22 = malloc(*v24);
  __int128 v20 = v22;
  if (v22)
  {
    memcpy(v22, v24 + 1, v19);
    if (v23) {
      *uint64_t v23 = v19;
    }
  }

  free(v24);
  return v20;
}

void *sub_100011B40(void *a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4 = 0LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t v4 = sub_100016B98(0x20uLL);
      if (v4)
      {
        uint64_t v9 = sub_100011884(a1, 9, 1, &v14);
        unint64_t v10 = v9;
        if (v9
          && v14 == 51
          && *v9 == 0x7365733A7061656CLL
          && v9[1] == 0x79656B2D6E6F6973LL
          && *((_BYTE *)v9 + 16) == 61)
        {
          v4[2] = sub_10001197C((uint64_t)v9 + 17, 0x22uLL, *(void *)(a2 + 8) + 4LL, a3, a4, v4 + 3);
        }

        free(v10);
      }
    }
  }

  return v4;
}

_BYTE *sub_100011C30( uint64_t a1, _BYTE *a2, __int128 *a3, uint64_t a4, const void *a5, size_t a6, const void *a7, size_t a8)
{
  size_t v16 = a6 + 24;
  uint64_t result = malloc(a6 + 24);
  if (result)
  {
    __int128 v18 = result;
    uint64_t v35 = a7;
    size_t v36 = a8;
    *(_DWORD *)uint64_t result = 922812416;
    result[4] = 16;
    unsigned __int16 v19 = j__random();
    unsigned __int16 v20 = v19 | 0x8000;
    unsigned int v21 = (*(_DWORD *)&v19 | 0xFFFF8000) >> 8;
    v18[6] = (unsigned __int16)(v19 | 0x8000) >> 8;
    v18[7] = v19;
    sub_100011DA8(a5, a6, v19 | 0x8000, a2, a3, a4, v18 + 8, &v37);
    uint64_t v22 = v37;
    v18[5] = v37 + 4;
    uint64_t v27 = sub_100010D0C(a1, 26, v18, v22 + 8, v23, v24, v25, v26);
    free(v18);
    if (v27)
    {
      uint64_t result = malloc(v16);
      if (result)
      {
        uint64_t v28 = result;
        *(_DWORD *)uint64_t result = 922812416;
        result[4] = 17;
        result[6] = v21;
        result[7] = v20 ^ 1;
        sub_100011DA8(v35, v36, v20 ^ 1, a2, a3, a4, result + 8, &v37);
        uint64_t v29 = v37;
        v28[5] = v37 + 4;
        uint64_t v34 = sub_100010D0C(a1, 26, v28, v29 + 8, v30, v31, v32, v33);
        free(v28);
        return (_BYTE *)(v34 != 0LL);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100011DA8( const void *a1, size_t a2, unsigned int a3, _BYTE *a4, __int128 *a5, uint64_t a6, _BYTE *a7, void *a8)
{
  uint64_t v9 = a7;
  __int16 v21 = __rev16(a3);
  if ((((_BYTE)a2 + 1) & 0xF) != 0) {
    int v15 = (((_BYTE)a2 + 1) & 0xF0) + 16;
  }
  else {
    int v15 = a2 + 1;
  }
  bzero(a7, v15);
  _BYTE *v9 = a2;
  uint64_t result = (uint64_t)memcpy(v9 + 1, a1, a2);
  *a8 = v15;
  if (v15 >= 1)
  {
    char v17 = 0;
    do
    {
      uint64_t v24 = a5;
      uint64_t v22 = a6;
      if ((v17 & 1) != 0)
      {
        uint64_t v25 = v9 - 16;
        *(void *)&__int128 v23 = 16LL;
        uint64_t v18 = 2LL;
      }

      else
      {
        uint64_t v25 = a4;
        uint64_t v26 = &v21;
        uint64_t v18 = 3LL;
        __int128 v23 = xmmword_10002B250;
      }

      uint64_t result = sub_100027430(v18, &v24, &v22, &v27);
      for (uint64_t i = 0LL; i != 16; ++i)
        v9[i] ^= *((_BYTE *)&v27 + i);
      v9 += 16;
      char v17 = 1;
      BOOL v20 = __OFSUB__(v15, 16);
      v15 -= 16;
    }

    while (!((v15 < 0) ^ v20 | (v15 == 0)));
  }

  return result;
}

char *sub_100011F08(uint64_t a1, uint64_t a2, unint64_t a3, __int128 *a4, uint64_t a5)
{
  if (a3 > 0x80) {
    return 0LL;
  }
  size_t v8 = a3;
  __memcpy_chk(v23, a2, a3, 128LL);
  if ((v8 & 0xF) != 0)
  {
    size_t v10 = 16 - (v8 & 0xF);
    bzero((char *)v23 + v8, v10);
    v8 += v10;
  }

  uint64_t v11 = *(void *)(a1 + 8) + 4LL;
  __int16 v21 = a4;
  uint64_t v22 = (int8x16_t *)v11;
  uint64_t v19 = a5;
  uint64_t v20 = 16LL;
  sub_100027430(2LL, &v21, &v19, &v18);
  v23[0] = veorq_s8(v23[0], v18);
  if (v8 >= 0x11)
  {
    uint64_t v16 = 0LL;
    do
    {
      __int16 v21 = a4;
      uint64_t v22 = &v23[v16];
      uint64_t v19 = a5;
      uint64_t v20 = 16LL;
      sub_100027430(2LL, &v21, &v19, &v18);
      v23[v16 + 1] = veorq_s8(v23[v16 + 1], v18);
      unint64_t v17 = v16 * 16 + 32;
      ++v16;
    }

    while (v17 < v8);
  }

  return sub_100010D0C(a1, 2, v23, v8, v12, v13, v14, v15);
}

size_t sub_100012064(void *a1, int a2, void *__dst, size_t a4)
{
  uint64_t v4 = a1[4];
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = *a1 + 24LL;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v6 = *(void *)(*a1 + 16LL);
  }
  while (1)
  {
    uint64_t v7 = *(void *)(a1[2] + (v5 >> 29));
    v5 += (uint64_t)&_mh_execute_header;
    if (!--v4) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v9 = *(unsigned __int8 *)(v6 + v7 + 1);
  size_t v8 = v9 - 2;
  if (__dst)
  {
    if (v8 >= a4) {
      size_t v10 = a4;
    }
    else {
      size_t v10 = v9 - 2;
    }
    memcpy(__dst, (const void *)(v6 + v7 + 2), v10);
  }

  return v8;
}

uint64_t sub_1000120F8(void *a1, int a2, void *a3, void *a4, unint64_t a5)
{
  uint64_t v5 = a1[4];
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = *a1 + 24LL;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v7 = *(void *)(*a1 + 16LL);
  }
  while (1)
  {
    size_t v8 = (unsigned __int8 *)(v7 + *(void *)(a1[2] + (v6 >> 29)));
    v6 += (uint64_t)&_mh_execute_header;
    if (!--v5) {
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t result = 0LL;
  *a3 = v8 + 2;
  *a4 = v8[1] - 2LL;
  return result;
}

uint64_t sub_10001216C(void *a1, int a2, int a3)
{
  uint64_t v3 = a1[4];
  if (!v3) {
    return 0LL;
  }
  uint64_t v5 = 0LL;
  uint64_t result = 0LL;
  uint64_t v7 = *a1 + 24LL;
  if (*(void *)(*a1 + 16LL)) {
    uint64_t v7 = *(void *)(*a1 + 16LL);
  }
  uint64_t v8 = a1[2];
  do
  {
    uint64_t v9 = (unsigned __int8 *)(v7 + *(void *)(v8 + (v5 >> 29)));
    if (*v9 == a2)
    {
      else {
        uint64_t result = (result + 1);
      }
    }

    v5 += (uint64_t)&_mh_execute_header;
    --v3;
  }

  while (v3);
  return result;
}

uint64_t sub_1000121E0(void *a1)
{
  uint64_t v1 = a1[4];
  if (v1)
  {
    uint64_t v2 = 0LL;
    uint64_t v3 = a1[2];
    if (*(void *)(*a1 + 16LL)) {
      uint64_t v4 = *(void *)(*a1 + 16LL);
    }
    else {
      uint64_t v4 = *a1 + 24LL;
    }
    do
    {
      uint64_t v5 = (unsigned __int8 *)(v4 + *(void *)(v3 + (v2 >> 29)));
      uint64_t v6 = v5[1];
      if (v6 >= 3)
      {
        uint64_t v7 = v5[2];
        else {
          uint64_t v8 = v23;
        }
        int v9 = *v5;
        if (v9 == 81)
        {
          else {
            uint64_t v13 = -2LL;
          }
          uint64_t v14 = v13 + v6;
          if ((unint64_t)(v13 + v6) <= 9)
          {
            uint64_t v15 = v5 + 2;
            uint64_t v16 = v5 + 3;
            else {
              unint64_t v17 = v16;
            }
            __memcpy_chk(v22, v17, v14, 10LL);
            v22[v14] = 0;
            ++*(_DWORD *)v8;
            int v18 = atoi(v22);
            uint64_t v19 = (_DWORD *)((unint64_t)&v23[v7] | 0xC);
            _DWORD *v19 = v18;
          }

          goto LABEL_33;
        }

        if (v9 != 65)
        {
          if (v9 != 64 || (_DWORD)v6 != 6) {
            goto LABEL_33;
          }
          ++*(_DWORD *)v8;
          int v11 = (v5[3] << 16) | (v5[4] << 8) | v5[5];
          uint64_t v12 = (char *)((unint64_t)&v23[v7] | 4);
          goto LABEL_22;
        }

        if ((_DWORD)v6 == 6)
        {
          ++*(_DWORD *)v8;
          int v11 = (v5[3] << 16) | (v5[4] << 8) | v5[5];
          uint64_t v12 = (char *)((unint64_t)&v23[v7] | 8);
LABEL_22:
          *(_DWORD *)uint64_t v12 = v11;
        }
      }

LABEL_33:
      v2 += (uint64_t)&_mh_execute_header;
      --v1;
    }

    while (v1);
  }

  uint64_t v20 = 0LL;
  while (1)
  {
    if (LODWORD(v23[v20]))
    {
      if (DWORD1(v23[v20]) == 13 && DWORD2(v23[v20]) == 6)
      {
        uint64_t result = HIDWORD(v23[v20]);
      }
    }

    if (++v20 == 32) {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

        __memcpy_chk(&v37[4], a9, a10, 132LL);
        goto LABEL_34;
      }

      uint64_t v20 = 0LL;
      __int16 v21 = 0LL;
      uint64_t v22 = 0LL;
      __int128 v23 = (unsigned __int8 *)(*(void *)(a2 + 728) + 28LL);
      uint64_t v24 = a4;
      do
      {
        uint64_t v25 = *v23++;
        uint64_t v26 = v25 << v20;
        __int128 v27 = v24->octet[0];
        uint64_t v24 = (const ether_addr *)((char *)v24 + 1);
        v22 |= v26;
        v21 |= v27 << v20;
        v20 += 8LL;
      }

      while (v20 != 48);
      uint64_t v28 = *(os_log_s **)(a2 + 824);
      if (v22 > v21)
      {
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(v29) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_INFO,  "Using authenticator PTK",  (uint8_t *)&v29,  2u);
        }

        goto LABEL_32;
      }

      uint64_t result = os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      if ((_DWORD)result)
      {
        sub_1000295D0();
        return 0LL;
      }

      return result;
    default:
      unint64_t v17 = *(os_log_s **)(a2 + 824);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v29 = 67109120;
      LODWORD(v30) = a3;
      int v18 = "Unknown key type %d";
      goto LABEL_20;
  }

void sub_100012458(uint64_t a1)
{
  if (a1)
  {
    if (*(void *)(a1 + 8))
    {
      uint64_t v2 = 0LL;
      unint64_t v3 = 0LL;
      do
      {
        free(*(void **)(*(void *)a1 + v2));
        ++v3;
        v2 += 16LL;
      }

      while (v3 < *(void *)(a1 + 8));
    }

    free(*(void **)a1);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
  }

uint64_t sub_1000124BC(void *a1, void *a2)
{
  if (!*a2) {
    return 0LL;
  }
  uint64_t v4 = (char *)sub_100016B98(16LL * a2[1]);
  *a1 = v4;
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  a1[1] = 0LL;
  if (!a2[1]) {
    return 0LL;
  }
  uint64_t v5 = (size_t *)(*a2 + 8LL);
  uint64_t v6 = (size_t *)(v4 + 8);
  unint64_t v7 = 1LL;
  while (1)
  {
    size_t v8 = *v5;
    uint64_t result = (uint64_t)malloc(*v5);
    *(v6 - 1) = result;
    if (!result) {
      break;
    }
    a1[1] = v7;
    memcpy((void *)result, (const void *)*(v5 - 1), v8);
    size_t *v6 = v8;
    v6 += 2;
    v5 += 2;
    if (v7++ >= a2[1]) {
      return 0LL;
    }
  }

  return result;
}

void sub_100012570( uint64_t a1, unsigned int *a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, _DWORD *a8)
{
  uint64_t v12 = a4;
  if (!(a4[1] | *a4 | a4[2] | a4[3] | a4[4] | a4[5])
    && !(*(unsigned __int8 *)(a1 + 625) | *(unsigned __int8 *)(a1 + 624) | *(unsigned __int8 *)(a1 + 626) | *(unsigned __int8 *)(a1 + 627) | *(unsigned __int8 *)(a1 + 628) | *(unsigned __int8 *)(a1 + 629)))
  {
    if (((*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 64LL))(**(void **)(a1 + 496), a1 + 624) & 0x80000000) != 0)
    {
      sub_100016E40( 1LL,  "WPA: Failed to read BSSID for EAPOL-Key destination address",  v16,  v17,  v18,  v19,  v20,  v21,  v29);
      if (!a8) {
        goto LABEL_9;
      }
      goto LABEL_6;
    }

    sub_100016E40( 1LL,  "WPA: Use BSSID (%02x:%02x:%02x:%02x:%02x:%02x) as the destination for EAPOL-Key",  v16,  v17,  v18,  v19,  v20,  v21,  *(unsigned __int8 *)(a1 + 624));
    uint64_t v12 = (unsigned __int8 *)(a1 + 624);
  }

  if (!a8)
  {
LABEL_9:
    sub_100016EB0(0LL, "WPA: TX EAPOL-Key", a6, a7);
    (*(void (**)(void, unsigned __int8 *, uint64_t, unsigned __int8 *, uint64_t))(*(void *)(a1 + 496) + 72LL))( **(void **)(a1 + 496),  v12,  a5,  a6,  a7);
    goto LABEL_10;
  }

void sub_10001270C(uint64_t a1, uint64_t a2, int a3)
{
  int v6 = *(_DWORD *)(a1 + 660);
  if (v6 > 127)
  {
    if (v6 != 128 && v6 != 256)
    {
      if (v6 == 1024)
      {
        uint64_t v7 = 0LL;
        goto LABEL_12;
      }

      goto LABEL_9;
    }

uint64_t sub_1000128C8( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, _OWORD *a5, unsigned __int8 *a6, size_t a7, unsigned int *a8)
{
  if (!a6)
  {
    sub_100016E40(3LL, "WPA: No wpa_ie set - cannot generate msg 2/4", a3, a4, (uint64_t)a5, 0LL, a7, (uint64_t)a8, v29);
    return 0xFFFFFFFFLL;
  }

  sub_100016EB0(1LL, "WPA: WPA IE for msg 2/4", a6, a7);
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, void, void, uint64_t *, uint64_t *))(*(void *)(a1 + 496) + 96LL))( **(void **)(a1 + 496),  3LL,  0LL,  (unsigned __int16)(a7 + 95),  &v30,  &v29);
  if (!v16) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v17 = (unsigned __int8 *)v16;
  if (*(_DWORD *)(a1 + 648) == 2) {
    char v18 = 2;
  }
  else {
    char v18 = -2;
  }
  uint64_t v19 = v29;
  *(_BYTE *)uint64_t v29 = v18;
  *(_BYTE *)(v19 + 1) = (unsigned __int16)(a4 | 0x108) >> 8;
  *(_BYTE *)(v29 + 2) = a4 | 8;
  if (*(_DWORD *)(a1 + 648) == 2)
  {
    *(_BYTE *)(v29 + 3) = 0;
    *(_BYTE *)(v29 + 4) = 0;
  }

  else
  {
    *(_WORD *)(v29 + 3) = *(_WORD *)(a3 + 3);
  }

  *(void *)(v29 + 5) = *(void *)(a3 + 5);
  uint64_t v21 = v29;
  *(_WORD *)(v29 + 93) = bswap32(a7) >> 16;
  memcpy((void *)(v21 + 95), a6, a7);
  __int128 v22 = a5[1];
  *(_OWORD *)(v21 + 13) = *a5;
  *(_OWORD *)(v21 + 29) = v22;
  sub_100016E40(1LL, "WPA: Sending EAPOL-Key 2/4", v23, v24, v25, v26, v27, v28, v29);
  sub_100012570(a1, a8, a4, a2, 34958LL, v17, v30, (_DWORD *)(v29 + 77));
  return 0LL;
}

uint64_t sub_100012A58( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, __int16 a5, unsigned __int8 *a6, size_t a7, unsigned int *a8)
{
  if (a6) {
    sub_100016EB0(1LL, "WPA: KDE for msg 4/4", a6, a7);
  }
  uint64_t v16 = (*(uint64_t (**)(void, uint64_t, void, void, uint64_t *, uint64_t *))(*(void *)(a1 + 496) + 96LL))( **(void **)(a1 + 496),  3LL,  0LL,  (unsigned __int16)(a7 + 95),  &v29,  &v28);
  if (!v16) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v23 = (unsigned __int8 *)v16;
  if (*(_DWORD *)(a1 + 648) == 2) {
    char v24 = 2;
  }
  else {
    char v24 = -2;
  }
  uint64_t v25 = v28;
  *(_BYTE *)uint64_t v28 = v24;
  *(_BYTE *)(v25 + 1) = (unsigned __int16)(a5 & 0x200 | a4 | 0x108) >> 8;
  *(_BYTE *)(v28 + 2) = a4 | 8;
  if (*(_DWORD *)(a1 + 648) == 2)
  {
    *(_BYTE *)(v28 + 3) = 0;
    *(_BYTE *)(v28 + 4) = 0;
  }

  else
  {
    *(_WORD *)(v28 + 3) = *(_WORD *)(a3 + 3);
  }

  *(void *)(v28 + 5) = *(void *)(a3 + 5);
  uint64_t v27 = v28;
  *(_WORD *)(v28 + 93) = bswap32(a7) >> 16;
  if (a6) {
    memcpy((void *)(v27 + 95), a6, a7);
  }
  sub_100016E40(1LL, "WPA: Sending EAPOL-Key 4/4", v17, v18, v19, v20, v21, v22, v28);
  sub_100012570(a1, a8, a4, a2, 34958LL, v23, v29, (_DWORD *)(v28 + 77));
  return 0LL;
}

uint64_t sub_100012BD4( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    if (*(void *)(result + 440))
    {
      uint64_t result = sub_100016E40(1LL, "RSN: Cancelling PMKSA caching attempt", a3, a4, a5, a6, a7, a8, v9);
      *(void *)(v8 + 440) = 0LL;
    }
  }

  return result;
}

uint64_t sub_100012C10( uint64_t a1, unsigned __int8 *a2, const void *a3, size_t __size, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (__size > 0x62)
  {
    uint64_t v13 = (unsigned __int8 *)malloc(__size);
    if (!v13) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v14 = v13;
    memcpy(v13, a3, __size);
    unint64_t v15 = bswap32(*((unsigned __int16 *)v14 + 1)) >> 16;
    sub_100016E40(1LL, "IEEE 802.1X RX: version=%d type=%d length=%lu", v16, v17, v18, v19, v20, v21, *v14);
    if (v14[1] != 3)
    {
      sub_100016E40(1LL, "WPA: EAPOL frame (type %u) discarded, not a Key frame", v22, v23, v24, v25, v26, v27, v14[1]);
      goto LABEL_12;
    }

    BOOL v28 = v15 >= 0x5F && __size - 4 >= v15;
    if (!v28)
    {
      sub_100016E40( 1LL,  "WPA: EAPOL frame payload size %lu invalid (frame size %lu)",  v22,  v23,  v24,  v25,  v26,  v27,  v15);
LABEL_12:
      uint64_t v9 = 0LL;
LABEL_13:
      free(v14);
      return v9;
    }

    uint64_t v30 = v14[4];
    if ((_DWORD)v30 != 2 && (_DWORD)v30 != 254)
    {
      sub_100016E40(1LL, "WPA: EAPOL-Key type (%d) unknown, discarded", v22, v23, v24, v25, v26, v27, v14[4]);
      goto LABEL_12;
    }

    uint64_t v68 = (uint64_t)(v14 + 4);
    int v31 = v14[5];
    int v32 = v14[6];
    sub_100016E40(1LL, "  EAPOL-Key type=%d", v22, v23, v24, v25, v26, v27, v30);
    sub_100016E40( 1LL,  "  key_info 0x%x (ver=%d keyidx=%d rsvd=%d %s%s%s%s%s%s%s%s)",  v33,  v34,  v35,  v36,  v37,  v38,  v32 | (v31 << 8));
    sub_100016E40( 1LL,  "  key_length=%u key_data_length=%u",  v39,  v40,  v41,  v42,  v43,  v44,  __rev16(*(unsigned __int16 *)(v14 + 7)));
    sub_100016EB0(1LL, "  replay_counter", v14 + 9, 8LL);
    sub_100016EB0(1LL, "  key_nonce", v14 + 17, 32LL);
    sub_100016EB0(1LL, "  key_iv", v14 + 49, 16LL);
    sub_100016EB0(1LL, "  key_rsc", v14 + 65, 8LL);
    sub_100016EB0(1LL, "  key_id (reserved)", v14 + 73, 8LL);
    sub_100016EB0(1LL, "  key_mic", v14 + 81, 16LL);
    sub_100016EB0(0LL, "WPA: RX EAPOL-Key", v14, __size);
    if (__size > v15 + 4) {
      sub_100016E40( 1LL,  "WPA: ignoring %lu bytes after the IEEE 802.1X data",  v45,  v46,  v47,  v48,  v49,  v50,  __size - (v15 + 4));
    }
    uint64_t v51 = v14[6] & 7;
    if (v51 >= 4)
    {
      uint64_t v66 = v14[6] & 7;
      char v52 = "WPA: Unsupported EAPOL-Key descriptor version %d.";
LABEL_47:
      uint64_t v65 = 2LL;
LABEL_48:
      sub_100016E40(v65, v52, v45, v46, v47, v48, v49, v50, v66);
      goto LABEL_49;
    }

    unsigned __int16 v53 = _byteswap_ushort(*(_WORD *)(v14 + 5));
    int v54 = *(_DWORD *)(a1 + 660);
    if (v54 == 256 || v54 == 128)
    {
      if ((_DWORD)v51 != 3)
      {
        char v52 = "WPA: AP did not use the negotiated AES-128-CMAC.";
        goto LABEL_47;
      }
    }

    else if ((_DWORD)v51 == 2 || *(_DWORD *)(a1 + 652) != 16)
    {
      if ((v14[6] & 7) != 0 && v54 == 1024)
      {
        uint64_t v66 = 1024LL;
        char v52 = "WPA: 0x%X is used, but EAPOL-Key descriptor version (%d) is not 0.";
        goto LABEL_47;
      }
    }

    else
    {
      sub_100016E40( 2LL,  "WPA: CCMP is used, but EAPOL-Key descriptor version (%d) is not 2.",  v45,  v46,  v47,  v48,  v49,  v50,  v51);
      uint64_t v9 = 0xFFFFFFFFLL;
      if (*(_DWORD *)(a1 + 656) == 16 || (v53 & 8) != 0) {
        goto LABEL_13;
      }
      sub_100016E40( 2LL,  "WPA: Backwards compatibility: allow invalid version for non-CCMP group keys",  v59,  v60,  v61,  v62,  v63,  v64,  v67);
    }

    if (*(_DWORD *)(a1 + 252)
      && ((unint64_t v55 = bswap64(*(void *)(v14 + 9)),
           unint64_t v56 = bswap64(*(void *)(a1 + 244)),
           BOOL v28 = v55 >= v56,
           BOOL v57 = v55 > v56,
           v28)
        ? (int v58 = 0)
        : (int v58 = 1),
          v57 - v58 <= 0))
    {
      char v52 = "WPA: EAPOL-Key Replay Counter did not increase - dropping packet";
    }

    else
    {
      if ((v53 & 0x2080) == 0)
      {
        char v52 = "WPA: No Ack bit in key_info";
        goto LABEL_47;
      }

      if ((v53 & 0x800) != 0)
      {
        char v52 = "WPA: EAPOL-Key with Request bit - dropped";
        goto LABEL_47;
      }

      unint64_t v46 = __rev16(*(unsigned __int16 *)(v14 + 97));
      if (v15 - 95 < v46)
      {
        sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  2LL,  "WPA: Invalid EAPOL-Key frame - key_data overflow (%d > %lu)",  v46,  v47,  v48,  v49,  v50,  v46);
LABEL_49:
        uint64_t v9 = 0xFFFFFFFFLL;
        goto LABEL_13;
      }

      if (*(_DWORD *)(a1 + 648) == 2 && (v53 & 0x1000) != 0)
      {
        unint64_t v46 = __rev16(*(unsigned __int16 *)(v14 + 97));
      }

      if ((v53 & 8) == 0)
      {
        if ((v53 & 0x2000) == 0)
        {
          if ((v53 & 0x100) != 0) {
            sub_100013CFC(a1, a2, v68, v46, v51);
          }
          else {
            sub_100016E40(3LL, "WPA: EAPOL-Key (Group) without Mic bit - dropped", v45, v46, v47, v48, v49, v50, v66);
          }
        }

        goto LABEL_66;
      }

      if ((v53 & 0x30) == 0)
      {
        if ((v53 & 0x100) != 0) {
          sub_1000134A4(a1, v68, v51);
        }
        else {
          sub_1000138F8(a1, a2, v68, v51, v47, v48, v49, v50, v66);
        }
LABEL_66:
        uint64_t v9 = 1LL;
        goto LABEL_13;
      }

      char v52 = "WPA: Ignored EAPOL-Key (Pairwise) with non-zero key index";
    }

    uint64_t v65 = 3LL;
    goto LABEL_48;
  }

  sub_100016E40( 1LL,  "WPA: EAPOL frame too short to be a WPA EAPOL-Key (len %lu, expecting at least %lu)",  (uint64_t)a3,  __size,  a5,  a6,  a7,  a8,  __size);
  return 0LL;
}

uint64_t sub_100013164( uint64_t a1, uint64_t a2, uint64_t a3, char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = a3;
  uint64_t v13 = a2 + 77;
  __int128 v27 = *(_OWORD *)(a2 + 77);
  if (*(_DWORD *)(a1 + 172))
  {
    *(void *)uint64_t v13 = 0LL;
    *(void *)(a2 + 85) = 0LL;
    uint64_t v14 = (_OWORD *)(a1 + 104);
    sub_10000D238((unsigned int *)(a1 + 104), a3, a4, a5, (_DWORD *)v13);
    if ((void)v27 == *(void *)v13 && *((void *)&v27 + 1) == *(void *)(v13 + 8))
    {
      *(void *)(a1 + 168) = 1LL;
      __int128 v25 = *(_OWORD *)(a1 + 120);
      *(_OWORD *)(a1 + 40) = *v14;
      *(_OWORD *)(a1 + 56) = v25;
      __int128 v26 = *(_OWORD *)(a1 + 152);
      *(_OWORD *)(a1 + 72) = *(_OWORD *)(a1 + 136);
      *(_OWORD *)(a1 + 88) = v26;
      goto LABEL_16;
    }

    sub_100016E40(3LL, "WPA: Invalid EAPOL-Key MIC when using TPTK - ignoring TPTK", v15, v16, v17, v18, v19, v20, v27);
  }

  if (!*(_DWORD *)(a1 + 168))
  {
    uint64_t v23 = "WPA: Could not verify EAPOL-Key MIC - dropping packet";
    goto LABEL_14;
  }

  *(void *)uint64_t v13 = 0LL;
  *(void *)(v13 + 8) = 0LL;
  sub_10000D238((unsigned int *)(a1 + 40), v10, a4, a5, (_DWORD *)v13);
  if ((void)v27 != *(void *)v13 || *((void *)&v27 + 1) != *(void *)(v13 + 8))
  {
    uint64_t v23 = "WPA: Invalid EAPOL-Key MIC - dropping packet";
LABEL_14:
    sub_100016E40(3LL, v23, a3, (uint64_t)a4, a5, a6, a7, a8, v27);
    return 0xFFFFFFFFLL;
  }

LABEL_16:
  uint64_t result = 0LL;
  *(void *)(a1 + 244) = *(void *)(a2 + 5);
  *(_DWORD *)(a1 + 252) = 1;
  return result;
}

      if (!v24)
      {
        if (!__filename) {
          goto LABEL_493;
        }
        goto LABEL_18;
      }

      if (!(*(_DWORD *)__s ^ 0x706F7473 | __s[4]))
      {
        v350 = "Stop requested";
LABEL_489:
        sub_100016E40(4LL, v350, v3, v4, v5, v6, v7, v8, v377);
        return 0LL;
      }

      v378 = (void **)v22;
      BOOL v28 = strchr(__s, 61);
      if (!v28)
      {
        sub_100016E40(4LL, "Line %d: invalid line '%s'", v29, v30, v31, v32, v33, v34, v20);
        goto LABEL_344;
      }

      uint64_t v35 = v28;
      _BYTE *v28 = 0;
      uint64_t v36 = v28 + 1;
      if (*(void *)__s == 0x6361667265746E69LL && *(unsigned __int16 *)&__s[8] == 101)
      {
        v119 = *(_BYTE **)v18;
LABEL_350:
        sub_100016BA4(v119, (unint64_t)v36, 17LL);
        goto LABEL_351;
      }

      if (*(_DWORD *)__s == 1684632162 && *(_DWORD *)&__s[3] == 6645604)
      {
        v119 = (_BYTE *)(v23 + 17);
        goto LABEL_350;
      }

      if (*(_DWORD *)__s == 1986622052 && *(_DWORD *)&__s[3] == 7497078)
      {
        *(void *)(v18 + 72) = 0LL;
        v120 = (const char **)off_10003C000;
        if (off_10003C000)
        {
          v121 = &qword_10003C008;
          while (strcmp(v36, *v120))
          {
            v122 = (const char **)*v121++;
            v120 = v122;
            if (!v122) {
              goto LABEL_357;
            }
          }

          *(void *)(v18 + 72) = v120;
          goto LABEL_351;
        }

  uint64_t result = 0LL;
  v7[v12] = -1;
  *a1 = v7;
  return result;
}

uint64_t sub_1000132C8(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  size_t v6 = __rev16(*(unsigned __int16 *)(a2 + 93));
  uint64_t v7 = (void *)(a2 + 95);
  sub_100016EB0(1LL, "RSN: encrypted key data", (unsigned __int8 *)(a2 + 95), v6);
  if (!a1[42])
  {
    uint64_t v15 = "WPA: PTK not available, cannot decrypt EAPOL-Key key data.";
    goto LABEL_17;
  }

  if ((_DWORD)a3 == 2)
  {
LABEL_15:
    if ((v6 & 7) != 0)
    {
      uint64_t v27 = v6;
      uint64_t v15 = "WPA: Unsupported AES-WRAP len %d";
    }

    else
    {
      size_t v6 = (unsigned __int16)(v6 - 8);
      __int128 v25 = (char *)malloc(v6);
      if (v25)
      {
        __int128 v26 = v25;
        if (!sub_10000DE64(a1 + 14, v6 >> 3, (uint64_t *)v7, v25))
        {
          memcpy(v7, v26, v6);
          free(v26);
          *(_WORD *)(a2 + 93) = __rev16(v6);
          goto LABEL_25;
        }

        free(v26);
        uint64_t v15 = "WPA: AES unwrap failed - could not decrypt EAPOL-Key key data";
      }

      else
      {
        uint64_t v15 = "WPA: No memory for AES-UNWRAP buffer";
      }
    }

LABEL_17:
    uint64_t v16 = 3LL;
    goto LABEL_18;
  }

  if ((_DWORD)a3 != 1)
  {
    unsigned int v17 = a1[165];
    HIDWORD(v19) = v17;
    LODWORD(v19) = v17 - 32;
    unsigned int v18 = v19 >> 5;
    BOOL v20 = v18 > 7;
    int v21 = (1 << v18) & 0x8B;
    BOOL v23 = !v20 && v21 != 0 || (_DWORD)a3 == 3;
    if (!v23 && v17 != 1024)
    {
      uint64_t v27 = a3;
      uint64_t v15 = "WPA: Unsupported key_info type %d";
      goto LABEL_17;
    }

    goto LABEL_15;
  }

  __int128 v14 = *(_OWORD *)(a1 + 14);
  v28[0] = *(_OWORD *)(a2 + 45);
  v28[1] = v14;
  if (!sub_100026B04((uint64_t)v28, 0x20uLL, 0x100uLL, (uint64_t)v7, v6))
  {
LABEL_25:
    sub_100016F74(1LL, "WPA: decrypted EAPOL-Key key data", (unsigned __int8 *)v7, v6);
    return 0LL;
  }

  uint64_t v15 = "WPA: RC4 failed";
  uint64_t v16 = 4LL;
LABEL_18:
  sub_100016E40(v16, v15, v8, v9, v10, v11, v12, v13, v27);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000134A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_100016E40( 1LL,  "WPA: RX message 3 of 4-Way Handshake from %02x:%02x:%02x:%02x:%02x:%02x (ver=%d)",  v6,  v7,  v8,  v9,  v10,  v11,  *(unsigned __int8 *)(a1 + 624));
  __int16 v12 = *(unsigned __int8 *)(a2 + 1);
  unsigned __int16 v13 = *(unsigned __int8 *)(a2 + 2);
  uint64_t v14 = __rev16(*(unsigned __int16 *)(a2 + 93));
  sub_100016EB0(1LL, "WPA: IE KeyData", (unsigned __int8 *)(a2 + 95), v14);
  sub_100015EA0((unsigned __int8 *)(a2 + 95), v14, (uint64_t)&__s1, v15, v16, v17, v18, v19);
  if (v67 && (v12 & 0x10) == 0)
  {
    __int128 v26 = "WPA: GTK IE in unencrypted key data";
LABEL_10:
    uint64_t v27 = 3LL;
LABEL_11:
    sub_100016E40(v27, v26, v20, (uint64_t)v21, v22, (uint64_t)v23, v24, v25, v61);
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
  }

  if (v69 && (v12 & 0x10) == 0)
  {
    __int128 v26 = "WPA: IGTK KDE in unencrypted key data";
    goto LABEL_10;
  }

  if (v69 && v70 != 40)
  {
    uint64_t v61 = v70;
    __int128 v26 = "WPA: Invalid IGTK KDE length %lu";
    goto LABEL_10;
  }

  if (!*(void *)(a1 + 696) && !*(void *)(a1 + 704))
  {
    sub_100016E40( 1LL,  "WPA: No WPA/RSN IE for this AP known. Trying to get from scan results",  v20,  (uint64_t)v21,  v22,  (uint64_t)v23,  v24,  v25,  v61);
    if (((*(uint64_t (**)(void))(*(void *)(a1 + 496) + 80LL))(**(void **)(a1 + 496)) & 0x80000000) != 0)
    {
      uint64_t v35 = "WPA: Could not find AP from the scan results";
      uint64_t v36 = 3LL;
    }

    else
    {
      uint64_t v35 = "WPA: Found the current AP from updated scan results";
      uint64_t v36 = 1LL;
    }

    sub_100016E40(v36, v35, v29, v30, v31, v32, v33, v34, v62);
  }

  uint64_t v37 = (unsigned __int8 *)__s1;
  if (__s1)
  {
    uint64_t v38 = *(const void **)(a1 + 696);
    if (v38)
    {
      size_t v39 = __n;
      if (__n != *(void *)(a1 + 712) || memcmp(__s1, v38, __n)) {
        goto LABEL_36;
      }
    }
  }

  else if (!__s2 && (*(void *)(a1 + 696) || *(void *)(a1 + 704)))
  {
    size_t v49 = __n;
    uint64_t v44 = v66;
    uint64_t v45 = "IE in 3/4 msg does not match with IE in Beacon/ProbeResp (no IE?)";
    unint64_t v46 = (void *)a1;
    uint64_t v47 = a1 + 624;
    uint64_t v48 = 0LL;
    BOOL v23 = 0LL;
    goto LABEL_60;
  }

  int v21 = __s2;
  if (__s2)
  {
    uint64_t v40 = *(void **)(a1 + 704);
    if (v40)
    {
      int v41 = *(_DWORD *)(a1 + 660);
      BOOL v42 = v41 == 64 || v41 == 32;
      int v43 = v42;
      if (sub_10000DBC8(v43, v40, *(void *)(a1 + 720), __s2, v66))
      {
        uint64_t v37 = (unsigned __int8 *)__s1;
        size_t v39 = __n;
LABEL_36:
        BOOL v23 = (unsigned __int8 *)__s2;
        uint64_t v44 = v66;
        uint64_t v45 = "IE in 3/4 msg does not match with IE in Beacon/ProbeResp";
        unint64_t v46 = (void *)a1;
        uint64_t v47 = a1 + 624;
        uint64_t v48 = v37;
        size_t v49 = v39;
LABEL_60:
        sub_100015314(v46, (uint64_t)v45, v47, v48, v49, v23, v44, v25);
        return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
      }
    }
  }

  if (*(_DWORD *)(a1 + 648) == 1)
  {
    BOOL v23 = (unsigned __int8 *)__s2;
    if (__s2)
    {
      if (!*(void *)(a1 + 704) && *(_DWORD *)(a1 + 668))
      {
        uint64_t v48 = (unsigned __int8 *)__s1;
        size_t v49 = __n;
        uint64_t v44 = v66;
        uint64_t v45 = "Possible downgrade attack detected - RSN was enabled and RSN IE was in msg 3/4, but not in Beacon/ProbeResp";
        unint64_t v46 = (void *)a1;
        uint64_t v47 = a1 + 624;
        goto LABEL_60;
      }
    }
  }

  if (*(void *)(a1 + 208) != *(void *)(a2 + 13)
    || *(void *)(a1 + 216) != *(void *)(a2 + 21)
    || *(void *)(a1 + 224) != *(void *)(a2 + 29)
    || *(void *)(a1 + 232) != *(void *)(a2 + 37))
  {
    uint64_t v61 = *(unsigned __int8 *)(a1 + 624);
    __int128 v26 = "WPA: ANonce from message 1 of 4-Way Handshake differs from 3 of 4-Way Handshake - drop packet (src=%02x:%02x:%"
          "02x:%02x:%02x:%02x)";
    goto LABEL_10;
  }

  uint64_t v53 = __rev16(*(unsigned __int16 *)(a2 + 3));
  int v54 = *(_DWORD *)(a1 + 652);
  if (v54 == 8)
  {
    if ((_DWORD)v53 != 32)
    {
      __int128 v26 = "WPA: Invalid TKIP key length %d (src=%02x:%02x:%02x:%02x:%02x:%02x)";
      goto LABEL_72;
    }
  }

  else if (v54 == 16 && (_DWORD)v53 != 16)
  {
    __int128 v26 = "WPA: Invalid CCMP key length %d (src=%02x:%02x:%02x:%02x:%02x:%02x)";
LABEL_72:
    uint64_t v61 = v53;
    goto LABEL_10;
  }

  if (sub_100012A58( a1,  (unsigned __int8 *)(a1 + 624),  a2,  a3,  v13 | (unsigned __int16)(v12 << 8),  0LL,  0LL,  (unsigned int *)(a1 + 40))) {
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
  }
  *(_DWORD *)(a1 + 240) = 1;
  if ((v13 & 0x40) != 0)
  {
  }

  if (((v13 | (unsigned __int16)(v12 << 8)) & 0x200) != 0) {
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 496) + 136LL))( **(void **)(a1 + 496),  a1 + 624,  1LL,  1LL);
  }
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 496) + 16LL))(**(void **)(a1 + 496), 7LL);
  if (v67 && (sub_100015008(a1, a2, v67, v68, v13 | (unsigned __int16)(v12 << 8)) & 0x80000000) != 0)
  {
    __int128 v26 = "RSN: Failed to configure GTK";
    goto LABEL_74;
  }

  uint64_t result = sub_100015150(a1, (uint64_t)&__s1);
  if ((result & 0x80000000) != 0)
  {
    __int128 v26 = "RSN: Failed to configure IGTK";
LABEL_74:
    uint64_t v27 = 2LL;
    goto LABEL_11;
  }

  return result;
}

__n128 sub_1000138F8( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!(*(uint64_t (**)(void))(*(void *)(a1 + 496) + 56LL))(**(void **)(a1 + 496)))
  {
    sub_100016E40(3LL, "WPA: No SSID info found (msg 1 of 4).", v13, v14, v15, v16, v17, v18, a9);
    return result;
  }

  (*(void (**)(void, uint64_t))(*(void *)(a1 + 496) + 16LL))(**(void **)(a1 + 496), 6LL);
  BOOL v19 = 1;
  sub_100016E40( 1LL,  "WPA: RX message 1 of 4-Way Handshake from %02x:%02x:%02x:%02x:%02x:%02x (ver=%d)",  v20,  v21,  v22,  v23,  v24,  v25,  *a2);
  uint64_t v72 = 0LL;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v69 = 0u;
  memset(v68, 0, sizeof(v68));
  if (*(_DWORD *)(a1 + 648) != 2
    || (uint64_t v32 = __rev16(*(unsigned __int16 *)(a3 + 93)),
        sub_100016EB0(1LL, "RSN: msg 1/4 key data", (unsigned __int8 *)(a3 + 95), v32),
        sub_100015EA0((unsigned __int8 *)(a3 + 95), v32, (uint64_t)v68, v33, v34, v35, v36, v37),
        (uint64_t v26 = v69) == 0)
    || (sub_100016EB0(1LL, "RSN: PMKID from Authenticator", (unsigned __int8 *)v69, 16LL), (uint64_t v38 = v69) == 0))
  {
    int v40 = 0;
    goto LABEL_8;
  }

  uint64_t v39 = *(void *)(a1 + 440);
  BOOL v19 = v39 != 0;
  if (v39)
  {
    int v40 = 0;
  }

  else
  {
    *(void *)(a1 + 440) = 0LL;
    int v40 = 1;
    sub_100016E40(1LL, "RSN: no matching PMKID found", v26, v27, v28, v29, v30, v31, v66);
    uint64_t v39 = *(void *)(a1 + 440);
    if (!v39)
    {
      BOOL v19 = 0;
      goto LABEL_8;
    }
  }

  uint64_t v49 = *(void *)(v39 + 8);
  uint64_t v48 = *(void *)(v39 + 16);
  if (*(void *)v38 == v49 && *(void *)(v38 + 8) == v48)
  {
    sub_100016EB0(1LL, "RSN: matched PMKID", (unsigned __int8 *)v38, 16LL);
    sub_100014818((_OWORD *)a1);
    sub_100016F74(1LL, "RSN: PMK from PMKSA cache", (unsigned __int8 *)a1, *(void *)(a1 + 32));
    goto LABEL_24;
  }

LABEL_30:
  if (*(_DWORD *)(a1 + 240))
  {
    if (sub_10001691C((void *)(a1 + 176), 0x20uLL))
    {
      sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  3LL,  "WPA: Failed to get random data for SNonce",  v54,  v55,  v56,  v57,  v58,  v66);
LABEL_46:
      (*(void (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
      return result;
    }

    *(_DWORD *)(a1 + 240) = 0;
    sub_100016EB0(1LL, "WPA: Renewed SNonce", (unsigned __int8 *)(a1 + 176), 32LL);
  }

  uint64_t v59 = 64LL;
  if (*(_DWORD *)(a1 + 652) == 16) {
    uint64_t v59 = 48LL;
  }
  uint64_t v60 = (__n128 *)(a3 + 13);
  int v61 = *(_DWORD *)(a1 + 660);
  BOOL v64 = v61 == 128 || v61 == 1024 || v61 == 256;
  sub_10000D330( (char *)a1,  *(void *)(a1 + 32),  "Pairwise key expansion",  (unsigned __int8 *)(a1 + 596),  (unsigned __int8 *)(a1 + 624),  (unint64_t *)(a1 + 176),  (unint64_t *)(a3 + 13),  (unsigned __int8 *)(a1 + 104),  v59,  v64);
  *(int8x16_t *)(a1 + 152) = vextq_s8(*(int8x16_t *)(a1 + 152), *(int8x16_t *)(a1 + 152), 8uLL);
  *(_DWORD *)(a1 + 172) = 1;
  if (sub_1000128C8( a1,  (unsigned __int8 *)(a1 + 624),  a3,  a4,  (_OWORD *)(a1 + 176),  *(unsigned __int8 **)(a1 + 680),  *(void *)(a1 + 688),  (unsigned int *)(a1 + 104))) {
    goto LABEL_46;
  }
  __n128 result = *v60;
  __int128 v65 = *(_OWORD *)(a3 + 29);
  *(__n128 *)(a1 + 208) = *v60;
  *(_OWORD *)(a1 + 224) = v65;
  return result;
}

        asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.result", a7);
        if ((v23 & 0x40) == 0) {
          goto LABEL_37;
        }
        goto LABEL_31;
      }
    }
  }

  return result;
}

uint64_t sub_100013CFC(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  int v69 = 0;
  memset(v68, 0, sizeof(v68));
  int8x16_t v67 = 0u;
  int v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 496) + 24LL))(**(void **)(a1 + 496));
  sub_100016E40( 1LL,  "WPA: RX message 1 of Group Key Handshake from %02x:%02x:%02x:%02x:%02x:%02x (ver=%d)",  v11,  v12,  v13,  v14,  v15,  v16,  *a2);
  int v23 = *(unsigned __int8 *)(a3 + 1);
  int v24 = v23 << 8;
  unsigned int v25 = *(unsigned __int8 *)(a3 + 2);
  unint64_t v26 = __rev16(*(unsigned __int16 *)(a3 + 93));
  if (*(_DWORD *)(a1 + 648) != 2)
  {
    int v34 = __rev16(*(unsigned __int16 *)(a3 + 3));
    int v69 = v34;
    if (v26 > a4)
    {
      uint64_t v65 = v26;
      uint64_t v32 = "WPA: Truncated EAPOL-Key packet: key_data_length=%lu > extra_len=%lu";
LABEL_20:
      uint64_t v33 = 2LL;
      goto LABEL_21;
    }

    unint64_t v37 = v26;
    if ((_DWORD)a5 == 2)
    {
      if (v26 <= 7)
      {
        uint64_t v65 = v26;
        uint64_t v32 = "WPA: Too short maxkeylen (%lu)";
        goto LABEL_20;
      }

      unint64_t v37 = v26 - 8;
    }

    v67.i32[3] = ((v24 | v25) >> 4) & 3;
    if ((_DWORD)a5 == 1)
    {
      __int128 v50 = *(_OWORD *)(a1 + 56);
      v70[0] = *(_OWORD *)(a3 + 45);
      v70[1] = v50;
      if (v26 >= 0x21)
      {
        uint64_t v65 = v26;
        uint64_t v32 = "WPA: RC4 key data too long (%lu)";
        goto LABEL_5;
      }

      __memcpy_chk(v68, a3 + 95, v26, 36LL);
      if (sub_100026B04((uint64_t)v70, 0x20uLL, 0x100uLL, (uint64_t)v68, v26))
      {
        uint64_t v32 = "WPA: RC4 failed";
        uint64_t v33 = 4LL;
        goto LABEL_21;
      }
    }

    else
    {
      if ((_DWORD)a5 != 2)
      {
        uint64_t v65 = a5;
        uint64_t v32 = "WPA: Unsupported key_info type %d";
        goto LABEL_5;
      }

      if ((v26 & 7) != 0)
      {
        uint64_t v65 = v26;
        uint64_t v32 = "WPA: Unsupported AES-WRAP len %lu";
        goto LABEL_5;
      }

      if (v37 >= 0x21)
      {
        uint64_t v65 = v26;
        uint64_t v32 = "WPA: AES-WRAP key data too long (keydatalen=%lu maxkeylen=%lu)";
        goto LABEL_5;
      }

      if (sub_10000DE64((unsigned int *)(a1 + 56), v37 >> 3, (uint64_t *)(a3 + 95), (char *)v68))
      {
        uint64_t v32 = "WPA: AES unwrap failed - could not decrypt GTK";
        goto LABEL_5;
      }
    }

    if ((v25 & 0x40) != 0)
    {
      __int32 v64 = *(_DWORD *)(a1 + 652);
      if (v64 == 1)
      {
LABEL_59:
        int v38 = 0;
        v67.i32[1] = v64;
        goto LABEL_23;
      }

      sub_100016E40( 2LL,  "WPA: Tx bit set for GTK, but pairwise keys are used - ignore Tx bit",  v17,  v18,  v19,  v20,  v21,  v22,  v65);
    }

    __int32 v64 = 0;
    goto LABEL_59;
  }

  sub_100016EB0(1LL, "RSN: msg 1/2 key data", (unsigned __int8 *)(a3 + 95), v26);
  sub_100015EA0((unsigned __int8 *)(a3 + 95), v26, (uint64_t)v70, v27, v28, v29, v30, v31);
  if ((v23 & 0x10) == 0 && v71)
  {
    uint64_t v32 = "WPA: GTK IE in unencrypted key data";
LABEL_5:
    uint64_t v33 = 3LL;
LABEL_21:
    sub_100016E40(v33, v32, v17, v18, v19, v20, v21, v22, v65);
    goto LABEL_22;
  }

  if (!v71)
  {
    uint64_t v32 = "WPA: No GTK IE in Group Key msg 1/2";
    goto LABEL_20;
  }

  int v69 = v72 - 2;
  if (sub_100015448( *(unsigned int *)(a1 + 656),  (int)v72 - 2,  (v72 - 2),  &v67.i32[2],  v67.i32,  v20,  v21,  v22))
  {
LABEL_22:
    int v38 = -1;
    goto LABEL_23;
  }

  sub_100016EB0(1LL, "RSN: received GTK in group key handshake", v71, v72);
  v67.i32[3] = *v71 & 3;
  if ((*v71 & 4) != 0)
  {
    __int32 v36 = *(_DWORD *)(a1 + 652);
    if (v36 == 1) {
      goto LABEL_14;
    }
    sub_100016E40( 2LL,  "WPA: Tx bit set for GTK, but pairwise keys are used - ignore Tx bit",  v35,  v18,  v19,  v20,  v21,  v22,  v65);
  }

  __int32 v36 = 0;
LABEL_14:
  v67.i32[1] = v36;
  uint64_t v17 = v72 - 2;
  if ((unint64_t)(v72 - 2) >= 0x21)
  {
    uint64_t v65 = v72 - 2;
    uint64_t v32 = "RSN: Too long GTK in GTK IE (len=%lu)";
    goto LABEL_20;
  }

  __memcpy_chk(v68, v71 + 2, v17, 36LL);
  int v38 = 0;
LABEL_23:
  (*(void (**)(void, uint64_t))(*(void *)(a1 + 496) + 16LL))(**(void **)(a1 + 496), 7LL);
  if (v38) {
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
  }
  uint64_t v40 = (*(uint64_t (**)(void, uint64_t, void, uint64_t, _OWORD *, uint64_t *))(*(void *)(a1 + 496) + 96LL))( **(void **)(a1 + 496),  3LL,  0LL,  95LL,  v70,  &v66);
  if (!v40) {
    return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 32LL))(**(void **)(a1 + 496), 1LL);
  }
  uint64_t v47 = (unsigned __int8 *)v40;
  if (*(_DWORD *)(a1 + 648) == 2) {
    char v48 = 2;
  }
  else {
    char v48 = -2;
  }
  uint64_t v49 = v66;
  *(_BYTE *)uint64_t v66 = v48;
  *(_BYTE *)(v49 + 1) = 3;
  *(_BYTE *)(v66 + 2) = v25 & 0x30 | a5;
  if (*(_DWORD *)(a1 + 648) == 2)
  {
    *(_BYTE *)(v66 + 3) = 0;
    *(_BYTE *)(v66 + 4) = 0;
  }

  else
  {
    *(_WORD *)(v66 + 3) = *(_WORD *)(a3 + 3);
  }

  *(void *)(v66 + 5) = *(void *)(a3 + 5);
  *(_WORD *)(v66 + 93) = 0;
  sub_100016E40(1LL, "WPA: Sending EAPOL-Key 2/2", v41, v42, v43, v44, v45, v46, v65);
  sub_100012570( a1,  (unsigned int *)(a1 + 40),  a5,  (unsigned __int8 *)(a1 + 624),  34958LL,  v47,  *(uint64_t *)&v70[0],  (_DWORD *)(v66 + 77));
  if (v10 != 8) {
    return sub_100015758(a1, (unsigned __int8 *)(a1 + 624), v24 & 0x200);
  }
  uint64_t v51 = *(void *)(*(void *)(a1 + 496) + 8LL);
  uint64_t v52 = *(unsigned __int8 *)(a1 + 624);
  sub_10000DA74(*(_DWORD *)(a1 + 656));
  sub_100017140( v51,  2LL,  "WPA: Group rekeying completed with %02x:%02x:%02x:%02x:%02x:%02x [GTK=%s]",  v53,  v54,  v55,  v56,  v57,  v52);
  (*(void (**)(void))(*(void *)(a1 + 496) + 88LL))(**(void **)(a1 + 496));
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 16LL))(**(void **)(a1 + 496), 8LL);
}

uint64_t sub_100014260(uint64_t a1, char *a2, size_t a3)
{
  uint64_t v6 = *(void *)(a1 + 440);
  if (v6) {
    sub_100016454(__str, 33LL, (unsigned __int8 *)(v6 + 8), 16LL);
  }
  else {
    __str[0] = 0;
  }
  int v7 = *(_DWORD *)(a1 + 660);
  BOOL v8 = (v7 - 1) > 0x3F || ((1LL << (v7 - 1)) & 0x8000000080000003LL) == 0;
  if ((!v8 || v7 == 256 || v7 == 128) && *(_DWORD *)(a1 + 648) == 2) {
    uint64_t v9 = "TRUE";
  }
  else {
    uint64_t v9 = "FALSE";
  }
  HIDWORD(v11) = *(_DWORD *)(a1 + 656);
  LODWORD(v11) = HIDWORD(v11) - 2;
  unsigned int v10 = v11 >> 1;
  if (v10 > 7) {
    int v12 = 0;
  }
  else {
    int v12 = dword_10002B29C[v10];
  }
  unsigned int v13 = snprintf( a2,  a3,  "dot11RSNAOptionImplemented=TRUE\n dot11RSNAPreauthenticationImplemented=TRUE\n dot11RSNAEnabled=%s\n dot11RSNAPreauthenticationEnabled=%s\n dot11RSNAConfigVersion=%d\n dot11RSNAConfigPairwiseKeysSupported=5\n dot11RSNAConfigGroupCipherSize=%d\n dot11RSNAConfigPMKLifetime=%d\n dot11RSNAConfigPMKReauthThreshold=%d\n dot11RSNAConfigNumberOfPTKSAReplayCounters=1\n dot11RSNAConfigSATimeout=%d\n",  v9,  v9,  1,  v12,  *(_DWORD *)(a1 + 632),  *(_DWORD *)(a1 + 636),  *(_DWORD *)(a1 + 640));
  if ((v13 & 0x80000000) != 0) {
    return 0LL;
  }
  unsigned int v14 = v13;
  if (a3 <= v13) {
    return 0LL;
  }
  uint64_t v28 = &a2[v13];
  unsigned int v15 = sub_100014484(a1);
  unsigned int v16 = HIWORD(v15);
  int v17 = BYTE1(v15);
  int v18 = v15;
  unsigned int v19 = sub_10001452C(a1, *(_DWORD *)(a1 + 652));
  unsigned int v20 = HIWORD(v19);
  int v21 = BYTE1(v19);
  int v22 = v19;
  unsigned int v23 = sub_10001452C(a1, *(_DWORD *)(a1 + 656));
  int v24 = snprintf( v28,  a3 - v14,  "dot11RSNAAuthenticationSuiteSelected=%02x-%02x-%02x-%d\n dot11RSNAPairwiseCipherSelected=%02x-%02x-%02x-%d\n dot11RSNAGroupCipherSelected=%02x-%02x-%02x-%d\n dot11RSNAPMKIDUsed=%s\n dot11RSNAAuthenticationSuiteRequested=%02x-%02x-%02x-%d\n dot11RSNAPairwiseCipherRequested=%02x-%02x-%02x-%d\n dot11RSNAGroupCipherRequested=%02x-%02x-%02x-%d\n dot11RSNAConfigNumberOfGTKSAReplayCounters=0\n dot11RSNA4WayHandshakeFailures=%u\n",  0,  v16,  v17,  v18,  0,  v20,  v21,  v22,  0,  HIWORD(v23),  BYTE1(v23),  v23,  __str,  0,  v16,  v17,  v18,  0,  v20,  v21,  v22,  0,  HIWORD(v23),  BYTE1(v23),  v23,  *(_DWORD *)(a1 + 644));
  else {
    int v26 = v24;
  }
  return v26 + v14;
}

uint64_t sub_100014484(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 660);
  if (v1 > 127)
  {
    switch(v1)
    {
      case 128:
        return 1027077LL;
      case 256:
        return 1027078LL;
      case 1024:
        return 1027080LL;
    }

    return 0LL;
  }

  switch(v1)
  {
    case 1:
      if (*(_DWORD *)(a1 + 648) == 2) {
        return 1027073LL;
      }
      else {
        return 5304833LL;
      }
    case 2:
      if (*(_DWORD *)(a1 + 648) == 2) {
        return 1027074LL;
      }
      else {
        return 5304834LL;
      }
    case 16:
      return 5304832LL;
    default:
      return 0LL;
  }

uint64_t sub_10001452C(uint64_t a1, int a2)
{
  uint64_t result = 0LL;
  switch(a2)
  {
    case 1:
      if (*(_DWORD *)(a1 + 648) == 2) {
        return 1027072LL;
      }
      else {
        return 5304832LL;
      }
    case 2:
      int v4 = *(_DWORD *)(a1 + 648);
      unsigned int v5 = 1027073;
      unsigned int v6 = 5304833;
      goto LABEL_13;
    case 3:
    case 5:
    case 6:
    case 7:
      return result;
    case 4:
      if (*(_DWORD *)(a1 + 648) == 2) {
        return 1027077LL;
      }
      else {
        return 5304837LL;
      }
    case 8:
      int v4 = *(_DWORD *)(a1 + 648);
      unsigned int v5 = 1027074;
      unsigned int v6 = 5304834;
      goto LABEL_13;
    default:
      if (a2 != 16) {
        return result;
      }
      int v4 = *(_DWORD *)(a1 + 648);
      unsigned int v5 = 1027076;
      unsigned int v6 = 5304836;
LABEL_13:
      if (v4 == 2) {
        return v5;
      }
      else {
        return v6;
      }
  }

double sub_100014618(uint64_t a1)
{
  uint64_t v2 = sub_100016B98(0x2D8uLL);
  if (v2)
  {
    v2[56] = v2 + 56;
    v2[57] = v2 + 56;
    *((_DWORD *)v2 + 60) = 1;
    v2[62] = a1;
    *(void *)&double result = 0x460000A8C0LL;
    v2[79] = 0x460000A8C0LL;
    *((_DWORD *)v2 + 160) = 60;
    v2[54] = -1LL;
  }

  return result;
}

void sub_100014670( void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100026438((uint64_t)nullsub_1, (uint64_t)a1, 0LL, a4, a5, a6, a7, a8);
    sub_100026438((uint64_t)sub_1000146E4, (uint64_t)a1, 0LL, v9, v10, v11, v12, v13);
    free(a1[85]);
    free(a1[87]);
    free(a1[88]);
    free(a1[62]);
    free(a1);
  }

void sub_1000146E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

double sub_10001471C( uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100016E40(1LL, "WPA: Association event - clear replay counter", a3, a4, a5, a6, a7, a8, v18);
    int v10 = *a2;
    *(_WORD *)(a1 + 628) = *((_WORD *)a2 + 2);
    *(_DWORD *)(a1 + 624) = v10;
    *(void *)(a1 + 244) = 0LL;
    *(_DWORD *)(a1 + 252) = 0;
    *(_DWORD *)(a1 + 240) = 1;
    sub_100016E40(1LL, "WPA: Clear old PTK", v11, v12, v13, v14, v15, v16, v19);
    *(void *)(a1 + 168) = 0LL;
    double result = 0.0;
    *(_OWORD *)(a1 + 104) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_OWORD *)(a1 + 152) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
    *(void *)(a1 + 296) = 0LL;
    *(_OWORD *)(a1 + 304) = 0u;
    *(_OWORD *)(a1 + 320) = 0u;
    *(void *)(a1 + 336) = 0LL;
    *(_OWORD *)(a1 + 344) = 0u;
    *(_OWORD *)(a1 + 360) = 0u;
    *(void *)(a1 + 376) = 0LL;
    *(_OWORD *)(a1 + 384) = 0u;
    *(_OWORD *)(a1 + 400) = 0u;
    *(void *)(a1 + 416) = 0LL;
  }

  return result;
}

uint64_t sub_1000147C8(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 496) + 24LL))(**(void **)(a1 + 496));
  if ((_DWORD)result == 6) {
    ++*(_DWORD *)(a1 + 644);
  }
  return result;
}

void *sub_100014808(void *__dst, const void *__src, size_t __n)
{
  if (__dst)
  {
    *((void *)__dst + 4) = __n;
    return memcpy(__dst, __src, __n);
  }

  return __dst;
}

double sub_100014818(_OWORD *a1)
{
  if (a1)
  {
    uint64_t v1 = *((void *)a1 + 55);
    if (v1)
    {
      size_t v2 = *(void *)(v1 + 56);
      *((void *)a1 + 4) = v2;
      memcpy(a1, (const void *)(v1 + 24), v2);
    }

    else
    {
      *((void *)a1 + 4) = 32LL;
      double result = 0.0;
      *a1 = 0u;
      a1[1] = 0u;
    }
  }

  return result;
}

uint64_t sub_100014848(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 512) = a2;
  }
  return result;
}

uint64_t sub_100014854(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 504) = a2;
  }
  return result;
}

char *sub_100014860(char *result, uint64_t a2)
{
  if (result)
  {
    unint64_t v3 = result;
    if (a2)
    {
      *((void *)result + 65) = *(void *)a2;
      *((_OWORD *)result + 33) = *(_OWORD *)(a2 + 8);
      uint64_t v5 = *(void *)(a2 + 24);
      int v4 = *(const void **)(a2 + 32);
      *((void *)result + 68) = v5;
      if (v4)
      {
        double result = (char *)memcpy(result + 552, v4, *(void *)(a2 + 40));
        uint64_t v6 = *(void *)(a2 + 40);
      }

      else
      {
        uint64_t v6 = 0LL;
      }

      *((void *)v3 + 73) = v6;
      *((_DWORD *)v3 + 148) = *(_DWORD *)(a2 + 48);
    }

    else
    {
      *((void *)result + 73) = 0LL;
      *((_DWORD *)result + 148) = 0;
      *(_OWORD *)(result + 520) = 0u;
      *(_OWORD *)(result + 536) = 0u;
    }
  }

  return result;
}

uint64_t sub_1000148E0(uint64_t result, int *a2)
{
  if (result)
  {
    int v2 = *a2;
    *(_WORD *)(result + 600) = *((_WORD *)a2 + 2);
    *(_DWORD *)(result + 596) = v2;
  }

  return result;
}

uint64_t sub_1000148F8(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    *(void *)(result + 608) = a2;
    *(void *)(result + 616) = a3;
  }

  return result;
}

uint64_t sub_100014908(uint64_t result, uint64_t a2)
{
  if (result) {
    *(void *)(result + 424) = a2;
  }
  return result;
}

uint64_t sub_100014914(_DWORD *a1, int a2, int a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  switch(a2)
  {
    case 0:
      if (!a3) {
        return 0xFFFFFFFFLL;
      }
      uint64_t result = 0LL;
      a1[158] = a3;
      break;
    case 1:
      uint64_t result = 0LL;
      a1[159] = a3;
      break;
    case 2:
      if (!a3) {
        return 0xFFFFFFFFLL;
      }
      uint64_t result = 0LL;
      a1[160] = a3;
      break;
    case 3:
      uint64_t result = 0LL;
      a1[162] = a3;
      break;
    case 4:
      uint64_t result = 0LL;
      a1[163] = a3;
      break;
    case 5:
      uint64_t result = 0LL;
      a1[164] = a3;
      break;
    case 6:
      uint64_t result = 0LL;
      a1[165] = a3;
      break;
    case 7:
      uint64_t result = 0LL;
      a1[166] = a3;
      break;
    case 8:
      uint64_t result = 0LL;
      a1[167] = a3;
      break;
    case 9:
      uint64_t result = 0LL;
      a1[168] = a3;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

unsigned int *sub_1000149DC(unsigned int *result, int a2)
{
  if (result)
  {
    switch(a2)
    {
      case 0:
        uint64_t result = (unsigned int *)result[158];
        break;
      case 1:
        uint64_t result = (unsigned int *)result[159];
        break;
      case 2:
        uint64_t result = (unsigned int *)result[160];
        break;
      case 3:
        uint64_t result = (unsigned int *)result[162];
        break;
      case 4:
        uint64_t result = (unsigned int *)result[163];
        break;
      case 5:
        uint64_t result = (unsigned int *)result[164];
        break;
      case 6:
        uint64_t result = (unsigned int *)result[165];
        break;
      case 7:
        uint64_t result = (unsigned int *)result[166];
        break;
      case 8:
        uint64_t result = (unsigned int *)result[167];
        break;
      default:
        uint64_t result = 0LL;
        break;
    }
  }

  return result;
}

uint64_t sub_100014A54(int *a1, char *a2, int64_t a3)
{
  uint64_t v6 = sub_10000DA74(a1[163]);
  int v7 = sub_10000DA74(a1[164]);
  BOOL v8 = sub_10000DAF8(a1[165], a1[162]);
  LODWORD(result) = snprintf(a2, a3, "pairwise_cipher=%s\ngroup_cipher=%s\nkey_mgmt=%s\n", v6, v7, v8);
  else {
    return result;
  }
}

uint64_t sub_100014AE4( uint64_t a1, unsigned __int8 *a2, unint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v11 = sub_100015B8C(a1, (uint64_t)a2, *a3, a4, a5, a6, a7, a8);
  if ((v11 & 0x80000000) != 0) {
    return 0xFFFFFFFFLL;
  }
  *a3 = v11;
  sub_100016EB0(1LL, "WPA: Set own WPA IE default", a2, v11);
  if (*(void *)(a1 + 680)) {
    return 0LL;
  }
  size_t v13 = *a3;
  uint64_t v14 = malloc(v13);
  *(void *)(a1 + 680) = v14;
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  memcpy(v14, a2, v13);
  uint64_t result = 0LL;
  *(void *)(a1 + 688) = v13;
  return result;
}

uint64_t sub_100014B84(uint64_t a1, unsigned __int8 *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = (void *)(a1 + 680);
  free(*(void **)(a1 + 680));
  if (a2 && a3)
  {
    sub_100016EB0(1LL, "WPA: set own WPA/RSN IE", a2, a3);
    size_t v13 = malloc(a3);
    void *v6 = v13;
    if (v13)
    {
      memcpy(v13, a2, a3);
      uint64_t result = 0LL;
      *(void *)(a1 + 688) = a3;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    sub_100016E40(1LL, "WPA: clearing own WPA/RSN IE", v7, v8, v9, v10, v11, v12, v15);
    uint64_t result = 0LL;
    void *v6 = 0LL;
    v6[1] = 0LL;
  }

  return result;
}

uint64_t sub_100014C30(uint64_t a1, unsigned __int8 *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  free(*(void **)(a1 + 696));
  if (!a2 || !a3)
  {
    sub_100016E40(1LL, "WPA: clearing AP WPA IE", v6, v7, v8, v9, v10, v11, v14);
    a3 = 0LL;
    *(void *)(a1 + 696) = 0LL;
    goto LABEL_8;
  }

  sub_100016EB0(1LL, "WPA: set AP WPA IE", a2, a3);
  uint64_t v12 = malloc(a3);
  *(void *)(a1 + 696) = v12;
  if (v12)
  {
    memcpy(v12, a2, a3);
LABEL_8:
    uint64_t result = 0LL;
    *(void *)(a1 + 712) = a3;
    return result;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100014CD8(uint64_t a1, unsigned __int8 *a2, size_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  free(*(void **)(a1 + 704));
  if (!a2 || !a3)
  {
    sub_100016E40(1LL, "WPA: clearing AP RSN IE", v6, v7, v8, v9, v10, v11, v14);
    a3 = 0LL;
    *(void *)(a1 + 704) = 0LL;
    goto LABEL_8;
  }

  sub_100016EB0(1LL, "WPA: set AP RSN IE", a2, a3);
  uint64_t v12 = malloc(a3);
  *(void *)(a1 + 704) = v12;
  if (v12)
  {
    memcpy(v12, a2, a3);
LABEL_8:
    uint64_t result = 0LL;
    *(void *)(a1 + 720) = a3;
    return result;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100014D80( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && *(void *)(a1 + 680))
  {
    else {
      return 0LL;
    }
  }

  else
  {
    sub_100016E40(1LL, "WPA: No WPA/RSN IE available from association info", a3, a4, a5, a6, a7, a8, vars0);
    return 0xFFFFFFFFLL;
  }

uint64_t sub_100014DD0()
{
  return 0xFFFFFFFFLL;
}

double sub_100014DD8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a1 + 168) = 0LL;
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(void *)(a1 + 296) = 0LL;
  *(_OWORD *)(a1 + 304) = 0u;
  *(_OWORD *)(a1 + 320) = 0u;
  *(void *)(a1 + 336) = 0LL;
  *(void *)(a1 + 376) = 0LL;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(void *)(a1 + 416) = 0LL;
  *(_OWORD *)(a1 + 384) = 0u;
  *(_OWORD *)(a1 + 400) = 0u;
  return result;
}

uint64_t sub_100014E58(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 168);
  }
  return result;
}

uint64_t sub_100014E64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v28 = 0LL;
  sub_100016E40(1LL, "WPA: Installing PTK to the driver.", a3, a4, a5, a6, a7, a8, v26);
  unsigned int v16 = *(_DWORD *)(a1 + 652);
  switch(v16)
  {
    case 1u:
      sub_100016E40( 1LL,  "WPA: Pairwise Cipher Suite: NONE - do not use pairwise keys",  v10,  v11,  v12,  v13,  v14,  v15,  v27);
      return 0LL;
    case 0x10u:
      uint64_t v17 = 3LL;
      break;
    case 8u:
      uint64_t v17 = 2LL;
      unsigned int v16 = 32;
      break;
    default:
      sub_100016E40( 3LL,  "WPA: Unsupported pairwise cipher %d",  v10,  v11,  v12,  v13,  v14,  v15,  *(unsigned int *)(a1 + 652));
      return 0xFFFFFFFFLL;
  }

  if (*(_DWORD *)(a1 + 648) == 2)
  {
    uint64_t v18 = (unsigned __int8 *)&v28;
  }

  else
  {
    uint64_t v18 = (unsigned __int8 *)(a2 + 61);
    sub_100016EB0(1LL, "WPA: RSC", v18, 6LL);
  }

  if (((*(uint64_t (**)(void, uint64_t, uint64_t, void, uint64_t, unsigned __int8 *, uint64_t, uint64_t, void))(*(void *)(a1 + 496) + 48LL))( **(void **)(a1 + 496),  v17,  a1 + 624,  0LL,  1LL,  v18,  6LL,  a1 + 72,  v16) & 0x80000000) == 0)
  {
    if (*(_DWORD *)(a1 + 592))
    {
      sub_100026438((uint64_t)sub_1000146E4, a1, 0LL, v20, v21, v22, v23, v24);
      sub_100026220(*(_DWORD *)(a1 + 592), 0, (uint64_t)sub_1000146E4, a1, 0LL);
    }

    return 0LL;
  }

  sub_100016E40( 3LL,  "WPA: Failed to set PTK to the driver (alg=%d keylen=%d bssid=%02x:%02x:%02x:%02x:%02x:%02x)",  v19,  v20,  v21,  v22,  v23,  v24,  v17);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100015008(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4, __int16 a5)
{
  int8x16_t v30 = 0u;
  sub_100016F74(1LL, "RSN: received GTK in pairwise handshake", a3, a4);
  BOOL v16 = a4 >= 2;
  unint64_t v17 = a4 - 2;
  if (!v16 || v17 > 0x20) {
    return 0xFFFFFFFFLL;
  }
  unsigned __int8 v18 = *a3;
  v30.i32[3] = *a3 & 3;
  if ((v18 & 4) != 0)
  {
    __int32 v19 = *(_DWORD *)(a1 + 652);
    if (v19 == 1) {
      goto LABEL_8;
    }
    sub_100016E40( 2LL,  "WPA: Tx bit set for GTK, but pairwise keys are used - ignore Tx bit",  v10,  v11,  v12,  v13,  v14,  v15,  v30.i64[0]);
  }

  __int32 v19 = 0;
LABEL_8:
  v30.i32[1] = v19;
  __memcpy_chk(v31, a3 + 2, v17, 36LL);
  int v32 = v17;
  if (!sub_100015448(*(unsigned int *)(a1 + 656), v17, v17, &v30.i32[2], v30.i32, v20, v21, v22)
    && !sub_100015548(a1, &v30, (unsigned __int8 *)(a2 + 61)))
  {
    sub_100015758(a1, (unsigned __int8 *)(a1 + 624), a5 & 0x200);
    return 0LL;
  }

  sub_100016E40(1LL, "RSN: Failed to install GTK", v23, v24, v25, v26, v27, v28, v30.i64[0]);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100015150(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_10000DD34(*(_DWORD *)(a1 + 664));
  if ((_DWORD)result)
  {
    if (*(void *)(a2 + 72))
    {
      uint64_t v5 = *(unsigned __int16 **)(a2 + 72);
      size_t v12 = (int)sub_10000DC00(*(_DWORD *)(a1 + 664));
      uint64_t v13 = *v5;
      if (*(void *)(a1 + 376) == v12 && !memcmp((const void *)(a1 + 344), v5 + 4, v12)
        || *(void *)(a1 + 416) == v12 && !memcmp((const void *)(a1 + 384), v5 + 4, v12))
      {
        sub_100016E40( 1LL,  "WPA: Not reinstalling already in-use IGTK to the driver (keyidx=%d)",  v6,  v7,  v8,  v9,  v10,  v11,  v13);
      }

      else
      {
        uint64_t v14 = v5 + 1;
        sub_100016E40(1LL, "WPA: IGTK keyid %d pn %02x%02x%02x%02x%02x%02x", v6, v7, v8, v9, v10, v11, v13);
        sub_100016F74(1LL, "WPA: IGTK", (unsigned __int8 *)v14 + 6, v12);
        if (v13 >= 0x1000)
        {
          sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  3LL,  "WPA: Invalid IGTK KeyID %d",  v15,  v16,  v17,  v18,  v19,  v13);
          return 0xFFFFFFFFLL;
        }

        uint64_t v20 = sub_10000DC84(*(_DWORD *)(a1 + 664));
        if (((*(uint64_t (**)(void, uint64_t, const char *, uint64_t, void, unsigned __int16 *, uint64_t, unsigned __int16 *))(*(void *)(a1 + 496) + 48LL))( **(void **)(a1 + 496),  v20,  "\xFF\xFF\xFF\xFF\xFF\xFF",  v13,  0LL,  v14,  6LL,  v14 + 3) & 0x80000000) != 0)
        {
          sub_100017140( *(void *)(*(void *)(a1 + 496) + 8LL),  3LL,  "WPA: Failed to configure IGTK to the driver",  v21,  v22,  v23,  v24,  v25,  v12);
          return 0xFFFFFFFFLL;
        }

        *(void *)(a1 + 376) = v12;
        memcpy((void *)(a1 + 344), v14 + 3, v12);
      }
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_100015314( void *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8)
{
  sub_100017140( *(void *)(a1[62] + 8LL),  3LL,  "WPA: %s (src=%02x:%02x:%02x:%02x:%02x:%02x)",  (uint64_t)a4,  a5,  (uint64_t)a6,  a7,  a8,  a2);
  uint64_t v18 = (unsigned __int8 *)a1[87];
  if (v18) {
    sub_100016EB0(2LL, "WPA: WPA IE in Beacon/ProbeResp", v18, a1[89]);
  }
  if (a4)
  {
    if (!a1[87]) {
      sub_100016E40(2LL, "WPA: No WPA IE in Beacon/ProbeResp", (uint64_t)v18, v13, v14, v15, v16, v17, v21);
    }
    sub_100016EB0(2LL, "WPA: WPA IE in 3/4 msg", a4, a5);
  }

  uint64_t v19 = (unsigned __int8 *)a1[88];
  if (v19) {
    sub_100016EB0(2LL, "WPA: RSN IE in Beacon/ProbeResp", v19, a1[90]);
  }
  if (a6)
  {
    if (!a1[88]) {
      sub_100016E40(2LL, "WPA: No RSN IE in Beacon/ProbeResp", (uint64_t)v19, v13, v14, v15, v16, v17, v21);
    }
    sub_100016EB0(2LL, "WPA: RSN IE in 3/4 msg", a6, a7);
  }

  return (*(uint64_t (**)(void, uint64_t))(a1[62] + 40LL))(*(void *)a1[62], 17LL);
}

uint64_t sub_100015448( uint64_t a1, int a2, uint64_t a3, _DWORD *a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  HIDWORD(v8) = a1;
  LODWORD(v8) = a1 - 2;
  switch((v8 >> 1))
  {
    case 0u:
      goto LABEL_15;
    case 1u:
LABEL_7:
      uint64_t result = 0LL;
      *a4 = 0;
      int v10 = 1;
      goto LABEL_14;
    case 3u:
      uint64_t result = 0LL;
      *a4 = 6;
      int v10 = 2;
      goto LABEL_14;
    case 7u:
      if (a2 == 16 && (int)a3 >= 16)
      {
        uint64_t result = 0LL;
        *a4 = 6;
        int v10 = 3;
LABEL_14:
        *a5 = v10;
      }

      else
      {
LABEL_15:
        uint64_t v17 = sub_10000DA74(a1);
        sub_100016E40( 3LL,  "WPA: Unsupported %s Group Cipher key length %d (%d).",  v11,  v12,  v13,  v14,  v15,  v16,  (uint64_t)v17);
        return 0xFFFFFFFFLL;
      }

      return result;
    default:
      sub_100016E40(3LL, "WPA: Unsupported Group Cipher %d", a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a1);
      return 0xFFFFFFFFLL;
  }

uint64_t sub_100015548(uint64_t a1, int8x16_t *a2, unsigned __int8 *a3)
{
  uint64_t v6 = a2 + 1;
  uint64_t v7 = (void *)(a1 + 264);
  size_t v8 = *(void *)(a1 + 296);
  size_t v9 = a2[3].i32[0];
  if (v8 == v9 && !memcmp((const void *)(a1 + 264), &a2[1], v8)
    || *(void *)(a1 + 336) == v9 && !memcmp((const void *)(a1 + 304), v6, v9))
  {
    sub_100016E40( 1LL,  "WPA: Not reinstalling already in-use GTK to the driver (keyidx=%d tx=%d len=%d)",  v10,  v11,  v12,  v13,  v14,  v15,  a2->u32[3]);
    return 0LL;
  }

  sub_100016F74(1LL, "WPA: Group Key", (unsigned __int8 *)v6, v9);
  uint64_t v36 = a2->u32[1];
  uint64_t v37 = a2[3].u32[0];
  sub_100016E40( 1LL,  "WPA: Installing GTK to the driver (keyidx=%d tx=%d len=%d).",  v16,  v17,  v18,  v19,  v20,  v21,  a2->u32[3]);
  sub_100016EB0(1LL, "WPA: RSC", a3, a2->i32[2]);
  uint64_t v22 = v6;
  if (*(_DWORD *)(a1 + 656) == 8)
  {
    int8x16_t v23 = vextq_s8(a2[2], a2[2], 8uLL);
    v38[0] = *v6;
    v38[1] = v23;
    uint64_t v22 = (int8x16_t *)v38;
  }

  uint64_t v24 = a2->u32[0];
  uint64_t v25 = a2->u32[3];
  if (*(_DWORD *)(a1 + 652) != 1)
  {
    if (((*(uint64_t (**)(void, uint64_t, const char *, uint64_t, void, unsigned __int8 *, void, int8x16_t *, void, uint64_t, uint64_t))(*(void *)(a1 + 496) + 48LL))( **(void **)(a1 + 496),  v24,  "\xFF\xFF\xFF\xFF\xFF\xFF",  v25,  a2->u32[1],  a3,  a2->i32[2],  v22,  a2[3].i32[0],  v36,  v37) & 0x80000000) != 0)
    {
      uint64_t v35 = a2->u32[0];
      int v32 = "WPA: Failed to set GTK to the driver (alg=%d keylen=%d keyidx=%d)";
      goto LABEL_15;
    }

    goto LABEL_12;
  }

  uint64_t v35 = a2[3].i32[0];
  if (((*(uint64_t (**)(void, uint64_t, const char *, uint64_t, uint64_t, unsigned __int8 *, void, int8x16_t *))(*(void *)(a1 + 496) + 48LL))( **(void **)(a1 + 496),  v24,  "\xFF\xFF\xFF\xFF\xFF\xFF",  v25,  1LL,  a3,  a2->i32[2],  v22) & 0x80000000) == 0)
  {
LABEL_12:
    size_t v33 = a2[3].i32[0];
    *(void *)(a1 + 296) = v33;
    memcpy(v7, v6, v33);
    return 0LL;
  }

  int v32 = "WPA: Failed to set GTK to the driver (Group only).";
LABEL_15:
  sub_100016E40(3LL, v32, v26, v27, v28, v29, v30, v31, v35);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100015758(uint64_t a1, unsigned __int8 *a2, int a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 496) + 8LL);
  uint64_t v6 = *a2;
  sub_10000DA74(*(_DWORD *)(a1 + 652));
  sub_10000DA74(*(_DWORD *)(a1 + 656));
  sub_100017140( v5,  2LL,  "WPA: Key negotiation completed with %02x:%02x:%02x:%02x:%02x:%02x [PTK=%s GTK=%s]",  v7,  v8,  v9,  v10,  v11,  v6);
  (*(void (**)(void))(*(void *)(a1 + 496) + 88LL))(**(void **)(a1 + 496));
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 496) + 16LL))(**(void **)(a1 + 496), 8LL);
  if (a3)
  {
    (*(void (**)(void, unsigned __int8 *, uint64_t, uint64_t))(*(void *)(a1 + 496) + 136LL))( **(void **)(a1 + 496),  a2,  3LL,  1LL);
    uint64_t result = sub_100026220(1u, 0, (uint64_t)nullsub_1, a1, 0LL);
  }

  uint64_t v19 = *(void *)(a1 + 440);
  if (v19)
  {
    if (*(_DWORD *)(v19 + 104))
    {
      uint64_t result = sub_100016E40( 1LL,  "RSN: Authenticator accepted opportunistic PMKSA entry - marking it valid",  v13,  v14,  v15,  v16,  v17,  v18,  v20);
      *(_DWORD *)(*(void *)(a1 + 440) + 104LL) = 0;
    }
  }

  return result;
}

uint64_t sub_100015888( unsigned __int8 *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = a2;
  if (a2 && *a1 == 48) {
    return sub_10000D570((uint64_t)a1, a2, a3, a4, a5, a6, a7, a8);
  }
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)a3 = xmmword_10002B2C0;
  *(_DWORD *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0LL;
  *(void *)(a3 + memset(&v9[1], 0, 32) = 0LL;
  *(_DWORD *)(a3 + 40) = 0;
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (a2 <= 7)
  {
    sub_100016E40(1LL, "%s: ie len too short %lu", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_wpa");
    return 0xFFFFFFFFLL;
  }

  if (*a1 != 221 || a2 - 2 != a1[1] || bswap32(*(_DWORD *)(a1 + 2)) != 5304833 || *((_WORD *)a1 + 3) != 1)
  {
    sub_100016E40(1LL, "%s: malformed ie or unknown version", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_wpa");
    return 0xFFFFFFFFLL;
  }

  if ((int)a2 - 8 <= 3)
  {
    if ((int)a2 - 8 >= 1)
    {
      sub_100016E40(1LL, "%s: ie length mismatch, %u too much", a3, a4, a5, a6, a7, a8, (uint64_t)"wpa_parse_wpa_ie_wpa");
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    *(_DWORD *)(a3 + 8) = sub_100016168((unsigned int *)a1 + 2);
    if ((v9 - 12) < 2)
    {
      if (v9 == 13)
      {
        sub_100016E40( 1LL,  "%s: ie too short (for key mgmt)",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"wpa_parse_wpa_ie_wpa");
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      *(_DWORD *)(a3 + 4) = 0;
      int v18 = a1[13];
      int v19 = a1[12];
      int v20 = v19 | (v18 << 8);
      if (!v20 || v9 - 14 < (4 * v20))
      {
        sub_100016E40( 1LL,  "%s: ie count botch (pairwise), count %u left %u",  v12,  v13,  v14,  v15,  v16,  v17,  (uint64_t)"wpa_parse_wpa_ie_wpa");
        return 0xFFFFFFFFLL;
      }

      uint64_t v21 = 0LL;
      int v22 = 0;
      int v23 = (4 * v19) | (v18 << 10);
      do
      {
        v22 |= sub_100016168((unsigned int *)&a1[v21 + 14]);
        *(_DWORD *)(a3 + 4) = v22;
        v21 += 4LL;
      }

      while (v23 != (_DWORD)v21);
      if (v9 - (int)v21 - 10 < 6)
      {
        if (v9 - 15 == (_DWORD)v21)
        {
          sub_100016E40( 1LL,  "%s: ie too short (for capabilities)",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"wpa_parse_wpa_ie_wpa");
          return 0xFFFFFFFFLL;
        }
      }

      else
      {
        *(_DWORD *)(a3 + 12) = 0;
        int v30 = a1[v21 + 14] | (a1[v21 + 15] << 8);
        if (v30) {
          BOOL v31 = v9 - 16 - (int)v21 >= (4 * v30);
        }
        else {
          BOOL v31 = 0;
        }
        if (!v31)
        {
          sub_100016E40( 1LL,  "%s: ie count botch (key mgmt), count %u left %u",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"wpa_parse_wpa_ie_wpa");
          return 0xFFFFFFFFLL;
        }

        int v32 = 0;
        int v33 = v9 - 18 - v21;
        int v34 = (unsigned int *)&a1[v21 + 16];
        do
        {
          unsigned int v35 = bswap32(*v34) - 5304832;
          if (v35 > 2) {
            int v36 = 0;
          }
          else {
            int v36 = dword_10002B2DC[v35];
          }
          v32 |= v36;
          *(_DWORD *)(a3 + 12) = v32;
          ++v34;
          v33 -= 4;
          --v30;
        }

        while (v30);
        if (v33 + 6 < 6) {
          v33 += 2;
        }
        else {
          *(_DWORD *)(a3 + 16) = *(unsigned __int16 *)v34;
        }
        if (v33 >= 1) {
          sub_100016E40( 1LL,  "%s: ie has %u trailing bytes - ignored",  v24,  v25,  v26,  v27,  v28,  v29,  (uint64_t)"wpa_parse_wpa_ie_wpa");
        }
      }
    }
  }

  return 0LL;
}

uint64_t sub_100015B8C( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned int *)(a1 + 652);
  uint64_t v9 = *(unsigned int *)(a1 + 656);
  uint64_t v10 = *(unsigned int *)(a1 + 660);
  if (*(_DWORD *)(a1 + 648) != 2)
  {
    if (a3 < 0x18) {
      return 0xFFFFFFFFLL;
    }
    *(_BYTE *)a2 = -35;
    *(_DWORD *)(a2 + 2) = 32657408;
    *(_WORD *)(a2 + 6) = 1;
    HIDWORD(v13) = v9;
    LODWORD(v13) = v9 - 2;
    unsigned int v12 = v13 >> 1;
    if (v12 >= 8 || ((0x8Bu >> v12) & 1) == 0)
    {
LABEL_15:
      uint64_t v26 = v9;
      int v18 = "Invalid group cipher (%d).";
LABEL_16:
      sub_100016E40(3LL, v18, a3, a4, a5, a6, a7, a8, v26);
      return 0xFFFFFFFFLL;
    }

    *(_WORD *)(a2 + 8) = 20480;
    *(_BYTE *)(a2 + 10) = -14;
    *(_BYTE *)(a2 + 11) = 0x404040402040501uLL >> (8 * v12);
    *(_WORD *)(a2 + 12) = 1;
    switch((_DWORD)v8)
    {
      case 1:
        char v14 = 0;
        break;
      case 0x10:
        char v14 = 4;
        break;
      case 8:
        char v14 = 2;
        break;
      default:
        goto LABEL_23;
    }

    *(_WORD *)(a2 + 14) = 20480;
    *(_BYTE *)(a2 + 16) = -14;
    *(_BYTE *)(a2 + 17) = v14;
    char v21 = 1;
    *(_WORD *)(a2 + 18) = 1;
    if ((_DWORD)v10 != 1)
    {
      if ((_DWORD)v10 == 16)
      {
        char v21 = 0;
      }

      else
      {
        if ((_DWORD)v10 != 2) {
          goto LABEL_40;
        }
        char v21 = 2;
      }
    }

    *(_WORD *)(a2 + 20) = 20480;
    *(_BYTE *)(a2 + 22) = -14;
    *(_BYTE *)(a2 + 23) = v21;
    *(_BYTE *)(a2 + 1) = 22;
    return 24LL;
  }

  unint64_t v11 = 40LL;
  if (!*(void *)(a1 + 440)) {
    unint64_t v11 = 22LL;
  }
  if (v11 > a3)
  {
    sub_100016E40(1LL, "RSN: Too short IE buffer (%lu bytes)", a3, a4, a5, a6, a7, a8, a3);
    return 0xFFFFFFFFLL;
  }

  int v15 = *(_DWORD *)(a1 + 664);
  *(_BYTE *)a2 = 48;
  *(_WORD *)(a2 + 2) = 1;
  HIDWORD(v17) = v9;
  LODWORD(v17) = v9 - 2;
  unsigned int v16 = v17 >> 1;
  if (v16 >= 8 || ((0x8Bu >> v16) & 1) == 0) {
    goto LABEL_15;
  }
  *(_WORD *)(a2 + 4) = 3840;
  *(_BYTE *)(a2 + 6) = -84;
  *(_BYTE *)(a2 + 7) = 0x404040402040501uLL >> (8 * v16);
  *(_WORD *)(a2 + 8) = 1;
  switch((_DWORD)v8)
  {
    case 1:
      char v20 = 0;
      break;
    case 0x10:
      char v20 = 4;
      break;
    case 8:
      char v20 = 2;
      break;
    default:
LABEL_23:
      uint64_t v26 = v8;
      int v18 = "Invalid pairwise cipher (%d).";
      goto LABEL_16;
  }

  *(_WORD *)(a2 + 10) = 3840;
  *(_BYTE *)(a2 + 12) = -84;
  *(_BYTE *)(a2 + 13) = v20;
  char v22 = 1;
  *(_WORD *)(a2 + 14) = 1;
  if ((int)v10 <= 127)
  {
    if ((_DWORD)v10 == 1) {
      goto LABEL_45;
    }
    if ((_DWORD)v10 == 2)
    {
      char v22 = 2;
      goto LABEL_45;
    }

uint64_t sub_100015EA0( unsigned __int8 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(a3 + 80) = 0LL;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)a3 = 0u;
  if (a2 < 2) {
    return 0LL;
  }
  unint64_t v11 = (unint64_t)&a1[a2];
  unsigned int v12 = a1 + 1;
  uint64_t v13 = (uint64_t)&a1[a2 - 1];
  char v14 = a1;
  while (1)
  {
    uint64_t v15 = *v14;
    if ((_DWORD)v15 == 221)
    {
      unsigned int v16 = *v12;
      if (!*v12) {
        return 0LL;
      }
    }

    else
    {
      unsigned int v16 = *v12;
    }

    if ((_DWORD)v15 != 221)
    {
      if ((_DWORD)v15 == 48)
      {
        *(void *)(a3 + 16) = v14;
        uint64_t v17 = *v12 + 2LL;
        *(void *)(a3 + 24) = v17;
        int v18 = "WPA: RSN IE in EAPOL-Key";
      }

      else
      {
        uint64_t v17 = v16 + 2;
        int v18 = "WPA: Unrecognized EAPOL-Key Key Data IE";
      }

      goto LABEL_21;
    }

    if (!v16) {
      return 0LL;
    }
    if (v16 < 6) {
      goto LABEL_22;
    }
    unsigned int v19 = bswap32(*(_DWORD *)(v14 + 2));
    if (v19 == 5304833 && v14[6] == 1 && !v14[7])
    {
      *(void *)a3 = v14;
      uint64_t v17 = *v12 + 2LL;
      *(void *)(a3 + 8) = v17;
      int v18 = "WPA: WPA IE in EAPOL-Key";
      goto LABEL_21;
    }

    if (v16 >= 0x14)
    {
      switch(v19)
      {
        case 0xFAC01u:
          goto LABEL_28;
        case 0xFAC03u:
          goto LABEL_31;
        case 0xFAC04u:
          *(void *)(a3 + memset(&v9[1], 0, 32) = v14 + 6;
          uint64_t v17 = *v12 + 2LL;
          int v18 = "WPA: PMKID in EAPOL-Key";
          goto LABEL_21;
        case 0xFAC09u:
          goto LABEL_29;
        default:
          goto LABEL_22;
      }

      goto LABEL_22;
    }

    if (v16 >= 7)
    {
      switch(v19)
      {
        case 0xFAC09u:
LABEL_29:
          *(void *)(a3 + 72) = v14 + 6;
          *(void *)(a3 + 80) = *v12 - 4LL;
          uint64_t v21 = *v12 + 2LL;
          char v22 = "WPA: IGTK in EAPOL-Key";
          goto LABEL_30;
        case 0xFAC03u:
LABEL_31:
          *(void *)(a3 + 56) = v14 + 6;
          *(void *)(a3 + 64) = *v12 - 4LL;
          uint64_t v17 = *v12 + 2LL;
          int v18 = "WPA: MAC Address in EAPOL-Key";
LABEL_21:
          sub_100016EB0(1LL, v18, v14, v17);
          break;
        case 0xFAC01u:
LABEL_28:
          *(void *)(a3 + 40) = v14 + 6;
          *(void *)(a3 + 48) = *v12 - 4LL;
          uint64_t v21 = *v12 + 2LL;
          char v22 = "WPA: GTK in EAPOL-Key";
LABEL_30:
          sub_100016F74(1LL, v22, v14, v21);
          break;
      }
    }

LABEL_22:
    char v20 = &v14[v14[1]];
    char v14 = v20 + 2;
    unsigned int v12 = v20 + 3;
  }

  sub_100016E40(1LL, "WPA: EAPOL-Key Key Data underflow (ie=%d len=%d pos=%d)", a3, a4, a5, a6, a7, a8, v15);
  sub_100016F74(1LL, "WPA: Key Data", a1, a2);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100016168(unsigned int *a1)
{
  unsigned int v1 = bswap32(*a1) - 5304832;
  if (v1 > 5) {
    return 0LL;
  }
  else {
    return dword_10002B2E8[v1];
  }
}

uint64_t sub_100016198(char *a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  while (1)
  {
    int v3 = *a1;
    int v4 = v3 - 48;
    int v4 = v3 - 87;
LABEL_5:
    if (v4 < 0) {
      return 0xFFFFFFFFLL;
    }
LABEL_6:
    int v5 = a1[1];
    int v6 = v5 - 48;
    if ((v5 - 97) <= 5)
    {
      int v6 = v5 - 87;
LABEL_9:
      if (v6 < 0) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_10;
    }

    LOBYTE(v6) = v5 - 55;
    if (v5 - 55 < 0) {
      return 0xFFFFFFFFLL;
    }
LABEL_10:
    *(_BYTE *)(a2 + v2) = v6 | (16 * v4);
    if (v2 > 4)
    {
      a1 += 2;
    }

    else
    {
      if (a1[2] != 58) {
        return 0xFFFFFFFFLL;
      }
      a1 += 3;
    }

    if ((_DWORD)++v2 == 6) {
      return 0LL;
    }
  }

  if ((v3 - 65) <= 5)
  {
    LOBYTE(v4) = v3 - 55;
    if (((v3 - 55) & 0x80000000) == 0) {
      goto LABEL_6;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100016258(uint64_t a1, _BYTE *a2)
{
  uint64_t v2 = a1;
  int v3 = 0;
  int v4 = 2 - a1;
  while (1)
  {
    uint64_t result = (v4 + v2);
    for (v2 += 2LL; ; ++v2)
    {
      unsigned int v6 = *(unsigned __int8 *)(v2 - 2);
      if (v6 > 0x3A || ((1LL << v6) & 0x400600000000000LL) == 0) {
        break;
      }
      uint64_t result = (result + 1);
    }

    int v8 = (char)v6;
    unsigned int v9 = (char)v6 - 48;
    if (v9 > 9) {
      break;
    }
LABEL_11:
    if ((v9 & 0x80000000) != 0) {
      return 0xFFFFFFFFLL;
    }
LABEL_12:
    int v10 = *(char *)(v2 - 1);
    int v11 = v10 - 48;
    if ((v10 - 97) <= 5)
    {
      int v11 = v10 - 87;
LABEL_15:
      if (v11 < 0) {
        return 0xFFFFFFFFLL;
      }
      goto LABEL_16;
    }

    LOBYTE(v11) = v10 - 55;
    if (v10 - 55 < 0) {
      return 0xFFFFFFFFLL;
    }
LABEL_16:
    *a2++ = v11 | (16 * v9);
    if (++v3 == 6) {
      return result;
    }
  }

  if ((v8 - 97) <= 5)
  {
    unsigned int v9 = v8 - 87;
    goto LABEL_11;
  }

  if ((v8 - 65) <= 5)
  {
    LOBYTE(v9) = v8 - 55;
    if (((v8 - 55) & 0x80000000) == 0) {
      goto LABEL_12;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100016334(char *a1, _BYTE *a2, uint64_t a3)
{
  if (a3)
  {
    while (1)
    {
      int v3 = *a1;
      int v4 = v3 - 48;
      LOBYTE(v4) = v3 - 55;
      if (v3 - 55 < 0) {
        return 0xFFFFFFFFLL;
      }
LABEL_6:
      int v5 = a1[1];
      int v6 = v5 - 48;
      if ((v5 - 97) <= 5)
      {
        int v6 = v5 - 87;
LABEL_9:
        if (v6 < 0) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_10;
      }

      LOBYTE(v6) = v5 - 55;
      if (v5 - 55 < 0) {
        return 0xFFFFFFFFLL;
      }
LABEL_10:
      *a2++ = v6 | (16 * v4);
      a1 += 2;
      if (!--a3) {
        return 0LL;
      }
    }

    int v4 = v3 - 87;
LABEL_5:
    if (v4 < 0) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_6;
  }

  return 0LL;
}

uint64_t sub_1000163D4(uint64_t result, int a2)
{
  unsigned int v2 = a2 - 1;
  do
  {
    if ((v2 & 0x80000000) != 0) {
      break;
    }
    __int16 v3 = (*(_BYTE *)(result + v2--))++ + 1;
  }

  while ((v3 & 0x100) != 0);
  return result;
}

uint64_t sub_1000163F4(_DWORD *a1)
{
  uint64_t result = sub_100016734(&v4);
  unsigned int v3 = bswap32(4295 * v5 - ((v5 >> 5) + (v5 >> 9)));
  *a1 = bswap32(v4 - 2085978496);
  a1[1] = v3;
  return result;
}

uint64_t sub_100016454(char *__str, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = a4;
  int v5 = (int)__str;
  int v6 = &__str[a2];
  LODWORD(v7) = (_DWORD)__str;
  if (a4)
  {
    uint64_t v7 = __str;
    do
    {
      int v9 = *a3++;
      unsigned int v10 = snprintf(v7, v6 - v7, "%02x", v9);
      if ((v10 & 0x80000000) != 0) {
        break;
      }
      if (v6 - v7 <= v10) {
        break;
      }
      v7 += v10;
      --v4;
    }

    while (v4);
  }

  *(v6 - 1) = 0;
  return ((_DWORD)v7 - v5);
}

uint64_t sub_1000164FC(char *__str, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = a4;
  int v5 = (int)__str;
  int v6 = &__str[a2];
  LODWORD(v7) = (_DWORD)__str;
  if (a4)
  {
    uint64_t v7 = __str;
    do
    {
      int v9 = *a3++;
      unsigned int v10 = snprintf(v7, v6 - v7, "%02X", v9);
      if ((v10 & 0x80000000) != 0) {
        break;
      }
      if (v6 - v7 <= v10) {
        break;
      }
      v7 += v10;
      --v4;
    }

    while (v4);
  }

  *(v6 - 1) = 0;
  return ((_DWORD)v7 - v5);
}

char *sub_1000165A4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x20) {
    uint64_t v2 = 32LL;
  }
  else {
    uint64_t v2 = a2;
  }
  __memcpy_chk(byte_10003C3DC, a1, v2, 33LL);
  byte_10003C3DC[v2] = 0;
  int v3 = byte_10003C3DC[0];
  if (byte_10003C3DC[0])
  {
    uint64_t v4 = &byte_10003C3DD;
    do
    {
      int v5 = *v4++;
      int v3 = v5;
    }

    while (v5);
  }

  return byte_10003C3DC;
}

_BYTE *sub_100016624(_DWORD *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4 = 0LL;
  if (a1 && a3)
  {
    if (*a1 == 2)
    {
      v6.s_addr = a1[1];
      uint64_t v7 = inet_ntoa(v6);
      sub_100016BA4(a2, (unint64_t)v7, a3);
    }

    else
    {
      *a2 = 0;
    }

    return a2;
  }

  return (_BYTE *)v4;
}

uint64_t sub_100016684(unint64_t a1, uint64_t a2)
{
  if (!(a1 | a2)) {
    return 0LL;
  }
  uint64_t result = 1LL;
  if (a1)
  {
    if (a2 && (*(_DWORD *)a1 != 2 || *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4))) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000166C0(const char *a1, in_addr *a2)
{
  if (!inet_aton(a1, a2 + 1)) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0LL;
  a2->s_addr = 2;
  return result;
}

uint64_t sub_1000166FC(uint64_t result, uint64_t a2)
{
  if (result) {
    uint64_t result = sleep(result);
  }
  if (a2) {
    return usleep(a2);
  }
  return result;
}

uint64_t sub_100016734(__darwin_time_t *a1)
{
  uint64_t result = gettimeofday(&v4, 0LL);
  __darwin_time_t tv_usec = v4.tv_usec;
  *a1 = v4.tv_sec;
  a1[1] = tv_usec;
  return result;
}

uint64_t sub_100016770(int a1, int a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, void *a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a6 <= 0x3C
    && a5 <= 0x3B
    && a4 <= 0x17
    && a1 >= 1970
    && (a2 - 13) >= 0xFFFFFFF4
    && (a3 - 32) >= 0xFFFFFFE1)
  {
    uint64_t v18 = v7;
    uint64_t v19 = v8;
    memset(&v17.tm_wday, 0, 32);
    v17.tm_mouint64_t n = a2 - 1;
    v17.tm_year = a1 - 1900;
    v17.tm_hour = a4;
    v17.tm_mday = a3;
    v17.tm_sec = a6;
    v17.tm_miuint64_t n = a5;
    time_t v16 = mktime(&v17);
    unsigned int v12 = localtime(&v16);
    if (v12 && (uint64_t v13 = mktime(v12), (v14 = gmtime(&v16)) != 0LL)) {
      time_t v15 = v13 - mktime(v14);
    }
    else {
      time_t v15 = 0LL;
    }
    uint64_t result = 0LL;
    *a7 = v16 + v15;
  }

  return result;
}

FILE *sub_10001683C(const char *a1)
{
  if (chdir("/") < 0) {
    goto LABEL_11;
  }
  int v2 = open("/dev/null", 2);
  if (v2 < 0) {
    goto LABEL_11;
  }
  int v3 = v2;
  if (dup2(v2, 0) < 0 || dup2(v3, 1) < 0 || dup2(v3, 2) < 0)
  {
    close(v3);
LABEL_11:
    perror("daemon");
    return (FILE *)0xFFFFFFFFLL;
  }

  if (a1)
  {
    uint64_t result = fopen(a1, "w");
    if (!result) {
      return result;
    }
    int v5 = result;
    pid_t v6 = getpid();
    fprintf(v5, "%u\n", v6);
    fclose(v5);
  }

  return 0LL;
}

const char *sub_100016910(const char *result)
{
  if (result) {
    return (const char *)unlink(result);
  }
  return result;
}

uint64_t sub_10001691C(void *a1, size_t a2)
{
  timeval v4 = fopen("/dev/urandom", "rb");
  if (v4)
  {
    int v5 = v4;
    size_t v6 = fread(a1, 1uLL, a2, v4);
    fclose(v5);
    if (v6 == a2) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    puts("Could not open /dev/urandom.");
    return 0xFFFFFFFFLL;
  }

char *sub_1000169A0(char *__s1)
{
  if (*__s1 == 47) {
    return strdup(__s1);
  }
  size_t v3 = 128LL;
  while (1)
  {
    timeval v4 = (char *)malloc(v3);
    if (!v4) {
      return 0LL;
    }
    int v5 = v4;
    size_t v6 = getcwd(v4, v3);
    if (v6) {
      break;
    }
    int v7 = *__error();
    free(v5);
    uint64_t v8 = 0LL;
    v3 *= 2LL;
    if (v3 > 0x7D0 || v7 != 34) {
      return v8;
    }
  }

  int v9 = v6;
  v5[v3 - 1] = 0;
  size_t v10 = strlen(v6);
  size_t v11 = strlen(__s1);
  unsigned int v12 = malloc(v10 + v11 + 2);
  uint64_t v8 = v12;
  if (v12)
  {
    memcpy(v12, v9, v10);
    v8[v10] = 47;
    memcpy(&v8[v10 + 1], __s1, v11);
    v8[v10 + 1 + v11] = 0;
  }

  free(v5);
  return v8;
}

uint64_t sub_100016AC4(const char *a1)
{
  return 0LL;
}

void *sub_100016ADC(const char *a1, size_t *a2)
{
  size_t v3 = fopen(a1, "rb");
  if (!v3) {
    return 0LL;
  }
  timeval v4 = v3;
  fseek(v3, 0LL, 2);
  *a2 = ftell(v4);
  fseek(v4, 0LL, 0);
  size_t v5 = *a2;
  size_t v6 = malloc(*a2);
  int v7 = v6;
  if (!v6)
  {
    fclose(v4);
    return v7;
  }

  size_t v8 = fread(v6, 1uLL, v5, v4);
  size_t v9 = *a2;
  fclose(v4);
  if (v8 != v9)
  {
    free(v7);
    return 0LL;
  }

  return v7;
}

void *sub_100016B98(size_t __size)
{
  return calloc(1uLL, __size);
}

unsigned __int8 *sub_100016BA4(_BYTE *a1, unint64_t a2, uint64_t a3)
{
  size_t v3 = (unsigned __int8 *)a2;
  if (a3)
  {
    uint64_t v4 = a3 - 1;
    size_t v3 = (unsigned __int8 *)a2;
    while (v4)
    {
      int v5 = *v3++;
      *a1++ = v5;
      --v4;
      if (!v5) {
        return &v3[~a2];
      }
    }

    *a1 = 0;
  }

  while (*v3++)
    ;
  return &v3[~a2];
}

uint64_t sub_100016BE4(char *a1, const char *a2, int a3)
{
  pid_t v6 = fork();
  if (v6 < 0)
  {
    perror("fork");
    return 0xFFFFFFFFLL;
  }

  else
  {
    if (!v6) {
      sub_1000294C0(v8, a1, a2);
    }
    if (a3) {
      waitpid(v6, (int *)v8, 0);
    }
    return 0LL;
  }

uint64_t sub_100016C88(char *a1, _BYTE *a2)
{
  if (sub_100016334(a1, a2, 4LL)
    || a1[8] != 45
    || sub_100016334(a1 + 9, a2 + 4, 2LL)
    || a1[13] != 45
    || sub_100016334(a1 + 14, a2 + 6, 2LL)
    || a1[18] != 45
    || sub_100016334(a1 + 19, a2 + 8, 2LL)
    || a1[23] != 45)
  {
    return 0xFFFFFFFFLL;
  }

  return 0LL;
}

uint64_t sub_100016D40(unsigned __int8 *a1, char *__str, size_t __size)
{
  int v4 = snprintf( __str,  __size,  "%02x%02x%02x%02x-%02x%02x-%02x%02x-%02x%02x-%02x%02x%02x%02x%02x%02x",  *a1,  a1[1],  a1[2],  a1[3],  a1[4],  a1[5],  a1[6],  a1[7],  a1[8],  a1[9],  a1[10],  a1[11],  a1[12],  a1[13],  a1[14],  a1[15]);
  int v6 = v4 < 0 || v4 >= __size;
  return (v6 << 31 >> 31);
}

uint64_t sub_100016DEC(uint64_t a1)
{
  uint64_t v1 = 0LL;
  while (!*(_BYTE *)(a1 + v1))
  {
    if (++v1 == 16) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_100016E14()
{
  if (dword_10003C014) {
    return sub_100016734(v1);
  }
  return result;
}

uint64_t sub_100016E40( uint64_t result, char *format, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (dword_10003C010 <= (int)result)
  {
    va_list v9 = (va_list)&a9;
    if (!&a9) {
      va_list v9 = "(null)";
    }
    else {
      int v10 = dword_10002B300[(int)result];
    }
    return asl_vlog(0LL, 0LL, v10, format, v9);
  }

  return result;
}

uint64_t sub_100016EB0(uint64_t a1, const char *a2, unsigned __int8 *a3, uint64_t a4)
{
  return sub_100016EB8(a1, a2, a3, a4, 1);
}

uint64_t sub_100016EB8(uint64_t result, const char *a2, unsigned __int8 *a3, uint64_t a4, int a5)
{
  if (dword_10003C010 <= (int)result)
  {
    if (dword_10003C014) {
      sub_100016734(v10);
    }
    printf("%s - hexdump(len=%lu):", a2, a4);
    if (a3)
    {
      if (a5)
      {
        for (; a4; --a4)
        {
          int v9 = *a3++;
          printf(" %02x", v9);
        }
      }

      else
      {
        printf(" [REMOVED]");
      }
    }

    else
    {
      printf(" [NULL]");
    }

    return putchar(10);
  }

  return result;
}

uint64_t sub_100016F74(uint64_t a1, const char *a2, unsigned __int8 *a3, uint64_t a4)
{
  return sub_100016EB8(a1, a2, a3, a4, dword_10003C4B0);
}

uint64_t sub_100016F80(uint64_t a1, const char *a2, unsigned __int8 *a3, unint64_t a4)
{
  return sub_100016F88(a1, a2, a3, a4, 1);
}

uint64_t sub_100016F88(uint64_t result, const char *a2, unsigned __int8 *a3, unint64_t a4, int a5)
{
  if (dword_10003C010 <= (int)result)
  {
    if (dword_10003C014) {
      sub_100016734(v22);
    }
    if (a5)
    {
      if (a3)
      {
        for (uint64_t result = printf("%s - hexdump_ascii(len=%lu):\n", a2, a4); a4; a4 -= v9)
        {
          if (a4 >= 0x10) {
            unint64_t v9 = 16LL;
          }
          else {
            unint64_t v9 = a4;
          }
          printf("    ");
          if (v9 <= 1) {
            uint64_t v10 = 1LL;
          }
          else {
            uint64_t v10 = v9;
          }
          size_t v11 = a3;
          uint64_t v12 = v10;
          do
          {
            int v13 = *v11++;
            printf(" %02x", v13);
            --v12;
          }

          while (v12);
          if (a4 <= 0xF)
          {
            unint64_t v14 = v9 - 16;
            do
            {
              printf("   ");
              BOOL v15 = __CFADD__(v14++, 1LL);
            }

            while (!v15);
          }

          printf("   ");
          time_t v16 = (char *)a3;
          do
          {
            int v17 = *v16++;
            __darwin_ct_rune_t v18 = v17;
            if (v17 < 0) {
              __uint32_t v19 = __maskrune(v18, 0x40000uLL);
            }
            else {
              __uint32_t v19 = _DefaultRuneLocale.__runetype[v18] & 0x40000;
            }
            if (v19) {
              int v20 = v18;
            }
            else {
              int v20 = 95;
            }
            putchar(v20);
            --v10;
          }

          while (v10);
          if (a4 <= 0xF)
          {
            unint64_t v21 = v9 - 16;
            do
            {
              putchar(32);
              BOOL v15 = __CFADD__(v21++, 1LL);
            }

            while (!v15);
          }

          uint64_t result = putchar(10);
          a3 += v9;
        }
      }

      else
      {
        return printf("%s - hexdump_ascii(len=%lu): [NULL]\n");
      }
    }

    else
    {
      return printf("%s - hexdump_ascii(len=%lu): [REMOVED]\n");
    }
  }

  return result;
}

uint64_t sub_100017128(uint64_t a1, const char *a2, unsigned __int8 *a3, unint64_t a4)
{
  return sub_100016F88(a1, a2, a3, a4, dword_10003C4B0);
}

void *sub_100017134(void *result)
{
  off_10003C400 = result;
  return result;
}

void sub_100017140( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12 = (char *)malloc(0x800uLL);
  if (v12)
  {
    __uint32_t v19 = v12;
    int v20 = vsnprintf(v12, 0x800uLL, a3, (va_list)&a9);
    sub_100016E40(a2, "%s", v21, v22, v23, v24, v25, v26, (uint64_t)v19);
    if (off_10003C400) {
      off_10003C400(a1, a2, v19, v20);
    }
    free(v19);
  }

  else
  {
    sub_100016E40(4LL, "wpa_msg: Failed to allocate message buffer", v13, v14, v15, v16, v17, v18, a9);
  }

void sub_1000171FC( uint64_t a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (off_10003C400)
  {
    uint64_t v12 = (char *)malloc(0x800uLL);
    if (v12)
    {
      __uint32_t v19 = v12;
      int v20 = vsnprintf(v12, 0x800uLL, a3, (va_list)&a9);
      off_10003C400(a1, a2, v19, v20);
      free(v19);
    }

    else
    {
      sub_100016E40(4LL, "wpa_msg_ctrl: Failed to allocate message buffer", v13, v14, v15, v16, v17, v18, a9);
    }
  }

void sub_1000172B0( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, const char *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  size_t v11 = (char *)malloc(0x800uLL);
  if (v11)
  {
    uint64_t v18 = v11;
    vsnprintf(v11, 0x800uLL, a5, (va_list)&a9);
    if (a2) {
      sub_100016E40(1LL, "hostapd_logger: STA %02x:%02x:%02x:%02x:%02x:%02x - %s", v19, v20, v21, v22, v23, v24, *a2);
    }
    else {
      sub_100016E40(1LL, "hostapd_logger: %s", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
    }
    free(v18);
  }

  else
  {
    sub_100016E40(4LL, "hostapd_logger: Failed to allocate message buffer", v12, v13, v14, v15, v16, v17, a9);
  }

uint64_t sub_10001737C(void **a1, size_t a2)
{
  int v4 = *a1;
  if (*a1)
  {
    uint64_t v5 = v4[1];
    size_t v6 = v5 + a2;
    if (v5 + a2 <= *v4) {
      return 0LL;
    }
    int v7 = (void *)v4[2];
    if (v7)
    {
      size_t v8 = (char *)realloc(v7, v6);
      if (v8)
      {
        unint64_t v9 = v8;
        uint64_t v10 = v4[1];
        bzero(&v8[v10], a2);
        v4[2] = v9;
LABEL_14:
        uint64_t result = 0LL;
        *int v4 = v10 + a2;
        return result;
      }
    }

    else
    {
      uint64_t v13 = realloc(v4, a2 + v5 + 24);
      if (v13)
      {
        int v4 = v13;
        bzero((char *)v13 + v13[1] + 24, a2);
        *a1 = v4;
        uint64_t v10 = v4[1];
        goto LABEL_14;
      }
    }

    return 0xFFFFFFFFLL;
  }

  else
  {
    size_t v11 = sub_100016B98(a2 + 24);
    if (v11) {
      *size_t v11 = a2;
    }
    *a1 = v11;
    if (v11) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

void *sub_100017458(uint64_t a1)
{
  uint64_t result = sub_100016B98(a1 + 24);
  if (result) {
    *uint64_t result = a1;
  }
  return result;
}

void *sub_100017484(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100016B98(0x18uLL);
  if (result)
  {
    *uint64_t result = a2;
    result[1] = a2;
    result[2] = a1;
  }

  return result;
}

unint64_t *sub_1000174B8(const void *a1, size_t a2)
{
  int v4 = (unint64_t *)sub_100016B98(a2 + 24);
  size_t v11 = v4;
  if (v4)
  {
    *int v4 = a2;
    if (a1)
    {
      uint64_t v12 = sub_1000175AC(v4, a2, v5, v6, v7, v8, v9, v10);
      memcpy(v12, a1, a2);
    }
  }

  return v11;
}

unint64_t *sub_100017514(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 8);
  size_t v3 = (unint64_t *)sub_100016B98(v2 + 24);
  uint64_t v10 = v3;
  if (v3)
  {
    *size_t v3 = v2;
    size_t v11 = (const void *)(a1 + 24);
    uint64_t v14 = a1 + 8;
    size_t v13 = *(void *)(a1 + 8);
    uint64_t v12 = *(const void **)(v14 + 8);
    if (v12) {
      uint64_t v15 = v12;
    }
    else {
      uint64_t v15 = v11;
    }
    uint64_t v16 = sub_1000175AC(v3, v13, v4, v5, v6, v7, v8, v9);
    memcpy(v16, v15, v13);
  }

  return v10;
}

void sub_10001757C(void **a1)
{
  if (a1)
  {
    free(a1[2]);
    free(a1);
  }

char *sub_1000175AC( unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = a1[1];
  uint64_t v8 = (void *)a1[2];
  unint64_t v10 = *a1;
  a1[1] = v9 + a2;
  if (v9 + a2 > v10)
  {
    sub_100016E40(4LL, "wpabuf %p (size=%lu used=%lu) overflow len=%lu", a3, a4, a5, a6, a7, a8, (uint64_t)a1);
    abort();
  }

  size_t v11 = a1 + 3;
  if (v8) {
    size_t v11 = v8;
  }
  return (char *)v11 + v9;
}

unint64_t *sub_100017608(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return (unint64_t *)a1;
  }
  if (a1) {
    uint64_t v4 = *(void *)(a1 + 8);
  }
  else {
    uint64_t v4 = 0LL;
  }
  unint64_t v6 = *(void *)(a2 + 8) + v4;
  uint64_t v7 = (unint64_t *)sub_100016B98(v6 + 24);
  uint64_t v5 = v7;
  if (v7)
  {
    *uint64_t v7 = v6;
    if (a1)
    {
      size_t v14 = *(void *)(a1 + 8);
      if (*(void *)(a1 + 16)) {
        uint64_t v15 = *(const void **)(a1 + 16);
      }
      else {
        uint64_t v15 = (const void *)(a1 + 24);
      }
      uint64_t v16 = sub_1000175AC(v7, *(void *)(a1 + 8), v8, v9, v10, v11, v12, v13);
      memcpy(v16, v15, v14);
    }

    size_t v17 = *(void *)(a2 + 8);
    if (*(void *)(a2 + 16)) {
      uint64_t v18 = *(const void **)(a2 + 16);
    }
    else {
      uint64_t v18 = (const void *)(a2 + 24);
    }
    uint64_t v19 = sub_1000175AC(v5, *(void *)(a2 + 8), v8, v9, v10, v11, v12, v13);
    memcpy(v19, v18, v17);
  }

  sub_10001757C((void **)a1);
  free(*(void **)(a2 + 16));
  free((void *)a2);
  return v5;
}

unint64_t *sub_1000176E0(uint64_t a1, unint64_t a2)
{
  if (!a1) {
    return 0LL;
  }
  unint64_t v4 = *(void *)(a1 + 8);
  size_t v5 = a2 - v4;
  if (a2 <= v4) {
    return (unint64_t *)a1;
  }
  unint64_t v6 = (unint64_t *)sub_100016B98(a2 + 24);
  uint64_t v13 = v6;
  if (v6)
  {
    unint64_t *v6 = a2;
    size_t v14 = sub_1000175AC(v6, v5, v7, v8, v9, v10, v11, v12);
    bzero(v14, v5);
    size_t v21 = *(void *)(a1 + 8);
    if (*(void *)(a1 + 16)) {
      uint64_t v22 = *(const void **)(a1 + 16);
    }
    else {
      uint64_t v22 = (const void *)(a1 + 24);
    }
    uint64_t v23 = sub_1000175AC(v13, *(void *)(a1 + 8), v15, v16, v17, v18, v19, v20);
    memcpy(v23, v22, v21);
  }

  free(*(void **)(a1 + 16));
  free((void *)a1);
  return v13;
}

uint64_t sub_10001778C(void *a1, char *__format, ...)
{
  size_t v3 = (char *)a1[2];
  if (!v3) {
    size_t v3 = (char *)(a1 + 3);
  }
  uint64_t result = vsnprintf(&v3[a1[1]], *a1 - a1[1], __format, va);
  uint64_t v11 = a1[1];
  if ((result & 0x80000000) != 0 || *a1 - v11 <= (unint64_t)result)
  {
    sub_100016E40(4LL, "wpabuf %p (size=%lu used=%lu) overflow len=%lu", v5, v6, v7, v8, v9, v10, (uint64_t)a1);
    abort();
  }

  a1[1] = v11 + result;
  return result;
}

uint64_t sub_100017820(char *__filename)
{
  if (__filename)
  {
    unint64_t v2 = fopen(__filename, "r");
  }

  else
  {
    int v9 = sub_1000269A8();
    if (!v9)
    {
LABEL_488:
      uint64_t v377 = (uint64_t)__filename;
      v350 = "Could not open configuration file '%s' for reading.";
      goto LABEL_489;
    }

    unint64_t v2 = sub_100026788(v9);
  }

  uint64_t v10 = v2;
  if (!v2) {
    goto LABEL_488;
  }
  uint64_t v11 = sub_100001DE8();
  uint64_t v18 = (uint64_t)v11;
  if (!v11)
  {
    fclose(v10);
    return v18;
  }

  uint64_t v19 = off_10003C000;
  v11[9] = off_10003C000;
  if (!v19)
  {
    sub_100016E40(4LL, "No driver wrappers registered!", v12, v13, v14, v15, v16, v17, v377);
    sub_100002374(v18);
    fclose(v10);
    return 0LL;
  }

  v11[1] = *v11;
  if (fgets(__s, 256, v10))
  {
    LODWORD(v20) = 0;
    int v21 = 0;
    uint64_t v22 = v18 + 64;
    while (1)
    {
      while (1)
      {
        uint64_t v23 = *(void *)(v18 + 8);
        uint64_t v20 = (v20 + 1);
        int v24 = __s[0];
        uint64_t v25 = &__s[1];
        int v26 = __s[0];
        if (__s[0] != 35) {
          break;
        }
LABEL_18:
        if (!fgets(__s, 256, v10)) {
          goto LABEL_493;
        }
      }

      if (__s[0])
      {
        while (v26 != 10)
        {
          int v27 = *v25++;
          int v26 = v27;
          if (!v27) {
            goto LABEL_16;
          }
        }

        *(v25 - 1) = 0;
        int v24 = __s[0];
      }

LABEL_357:
        sub_100016E40(4LL, "Line %d: invalid/unknown driver '%s'", v29, v30, v31, v32, v33, v34, v20);
        goto LABEL_344;
      }

      if (*(_DWORD *)__s == 1969382756 && *(unsigned __int16 *)&__s[4] == 103)
      {
        sub_100016E40( 1LL,  "Line %d: DEPRECATED: 'debug' configuration variable is not used anymore",  v29,  v30,  v31,  v32,  v33,  v34,  v20);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x735F726567676F6CLL
        && *(void *)&__s[8] == 0x656C5F676F6C7379LL
        && *(_DWORD *)&__s[16] == 7103862)
      {
        *(_DWORD *)(v23 + 36) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x735F726567676F6CLL
        && *(void *)&__s[8] == 0x656C5F74756F6474LL
        && *(unsigned int *)&__s[16] == 7103862LL)
      {
        *(_DWORD *)(v23 + 40) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x735F726567676F6CLL && *(void *)&__s[6] == 0x676F6C7379735FLL)
      {
        *(_DWORD *)(v23 + 44) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x735F726567676F6CLL && *(void *)&__s[6] == 0x74756F6474735FLL)
      {
        *(_DWORD *)(v23 + 48) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x6C69665F706D7564LL && *(unsigned __int16 *)&__s[8] == 101)
      {
        *(void *)(v23 + 56) = strdup(v28 + 1);
        goto LABEL_351;
      }

      if (!(*(_DWORD *)__s ^ 0x64697373 | __s[4]))
      {
        size_t v123 = strlen(v28 + 1);
        if (v123 - 33 <= 0xFFFFFFFFFFFFFFDFLL)
        {
          sub_100016E40(4LL, "Line %d: invalid SSID '%s'", v124, v125, v126, v127, v128, v129, v20);
          goto LABEL_344;
        }

        *(void *)(v23 + 192) = v123;
        memcpy((void *)(v23 + 152), v36, v123);
        *(_BYTE *)(v23 + 152 + *(void *)(v23 + 192)) = 0;
        *(_DWORD *)(v23 + 200) = 1;
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F7264646163616DLL && *(unsigned int *)&__s[8] == 7103329LL)
      {
        unsigned int v130 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 444) = v130;
        if (v130 >= 3) {
          sub_100016E40(4LL, "Line %d: unknown macaddr_acl %d", v131, v132, v133, v134, v135, v136, v20);
        }
        goto LABEL_351;
      }

      if (*(void *)__s == 0x6D5F747065636361LL && *(void *)&__s[8] == 0x656C69665F6361LL)
      {
        if (sub_100019530((uint64_t)(v28 + 1), (void **)(v23 + 448), (int *)(v23 + 456)))
        {
          sub_100016E40(4LL, "Line %d: Failed to read accept_mac_file '%s'", v137, v138, v139, v140, v141, v142, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x63616D5F796E6564LL && *(void *)&__s[6] == 0x656C69665F6361LL)
      {
        if (sub_100019530((uint64_t)(v28 + 1), (void **)(v23 + 464), (int *)(v23 + 472)))
        {
          sub_100016E40(4LL, "Line %d: Failed to read deny_mac_file '%s'", v143, v144, v145, v146, v147, v148, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x6174735F736477LL)
      {
        *(_DWORD *)(v23 + 476) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x695F78616D5F7061LL
        && *(void *)&__s[8] == 0x746976697463616ELL
        && *(unsigned __int16 *)&__s[16] == 121)
      {
        *(_DWORD *)(v23 + 700) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F7972746E756F63LL && *(void *)&__s[5] == 0x65646F635F7972LL)
      {
        *(_WORD *)(v18 + 88) = *(_WORD *)v36;
        *(_BYTE *)(v18 + 90) = 32;
        goto LABEL_351;
      }

      if (*(void *)__s == 0x3132303865656569LL && *(void *)&__s[3] == 0x64313132303865LL)
      {
        *(_DWORD *)(v18 + 92) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x3132303865656569LL && *(unsigned __int16 *)&__s[8] == 120)
      {
        *(_DWORD *)(v23 + 72) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x65765F6C6F706165LL && *(void *)&__s[6] == 0x6E6F6973726576LL)
      {
        uint64_t v149 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 76) = v149;
        if ((v149 - 3) <= 0xFFFFFFFD)
        {
          sub_100016E40(4LL, "Line %d: invalid EAPOL version (%d): '%s'.", v150, v151, v152, v153, v154, v155, v20);
          goto LABEL_344;
        }

        sub_100016E40(1LL, "eapol_version=%d", v150, v151, v152, v153, v154, v155, v149);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x7373656D5F706165LL && *(_DWORD *)&__s[8] == 6645601)
      {
        v156 = strdup(v28 + 1);
        *(void *)(v23 + 368) = v156;
        if (v156)
        {
          v163 = v156;
          *(void *)(v23 + 376) = strlen(v156);
          v164 = strstr(v163, "\\0");
          if (v164)
          {
            char *v164 = 0;
            memmove(v164 + 1, v164 + 2, *(void *)(v23 + 376) + *(void *)(v23 + 368) + ~(unint64_t)(v164 + 1));
            --*(void *)(v23 + 376);
          }

          goto LABEL_351;
        }

        sub_100016E40( 4LL,  "Line %d: Failed to allocate memory for eap_req_id_text",  v157,  v158,  v159,  v160,  v161,  v162,  v20);
LABEL_344:
        BOOL v118 = v21 < 100;
LABEL_345:
        if (v118) {
          ++v21;
        }
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F79656B5F706577LL
        && *(void *)&__s[8] == 0x616F72625F6E656CLL
        && *(void *)&__s[14] == 0x7473616364616FLL)
      {
        int v165 = atoi(v28 + 1);
        *(void *)(v23 + 392) = v165;
        if (v165 >= 0xE)
        {
          sub_100016E40(4LL, "Line %d: invalid WEP key len %lu (= %lu bits)", v166, v167, v168, v169, v170, v171, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F79656B5F706577LL
        && *(void *)&__s[8] == 0x63696E755F6E656CLL
        && *(unsigned int *)&__s[16] == 7631713LL)
      {
        unsigned int v172 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 400) = v172;
        if (v172 >= 0xE)
        {
          sub_100016E40(4LL, "Line %d: invalid WEP key len %d (= %d bits)", v173, v174, v175, v176, v177, v178, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (!(*(void *)__s ^ 0x656B65725F706577LL | *(void *)&__s[8] ^ 0x646F697265705F79LL | __s[16]))
      {
        int v179 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 404) = v179;
        if (v179 < 0) {
          goto LABEL_393;
        }
        goto LABEL_351;
      }

      if (*(void *)__s == 0x756165725F706165LL
        && *(void *)&__s[8] == 0x6F697265705F6874LL
        && *(unsigned __int16 *)&__s[16] == 100)
      {
        int v186 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 416) = v186;
        if (v186 < 0)
        {
LABEL_393:
          sub_100016E40(4LL, "Line %d: invalid period %d", v180, v181, v182, v183, v184, v185, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x656B5F6C6F706165LL
        && *(void *)&__s[8] == 0x5F7865646E695F79LL
        && *(void *)&__s[16] == 0x756F72616B726F77LL
        && *(void *)&__s[19] == 0x646E756F72616BLL)
      {
        *(_DWORD *)(v23 + 384) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x615F70695F6E776FLL && *(_DWORD *)&__s[8] == 7496804)
      {
        if (sub_1000166C0(v28 + 1, (in_addr *)(v23 + 104)))
        {
          sub_100016E40(4LL, "Line %d: invalid IP address '%s'", v187, v188, v189, v190, v191, v192, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x6E6564695F73616ELL && *(void *)&__s[7] == 0x7265696669746ELL)
      {
        *(void *)(v23 + 128) = strdup(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x676C615F68747561LL && *(unsigned __int16 *)&__s[8] == 115)
      {
        int v193 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 480) = v193;
        if (!v193)
        {
          sub_100016E40(4LL, "Line %d: no authentication algorithms allowed", v194, v195, v196, v197, v198, v199, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F6D756E5F78616DLL && *(_DWORD *)&__s[8] == 6386803)
      {
        unsigned int v200 = atoi(v28 + 1);
        *(_DWORD *)(v23 + 64) = v200;
        if (v200 >= 0x7D8)
        {
          sub_100016E40( 4LL,  "Line %d: Invalid max_num_sta=%d; allowed range 0..%d",
            v201,
            v202,
            v203,
            v204,
            v205,
            v206,
            v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(_DWORD *)__s == 6385783)
      {
        *(_DWORD *)(v23 + 484) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x756F72675F617077LL && *(void *)&__s[8] == 0x79656B65725F70LL)
      {
        *(_DWORD *)(v23 + 512) = 3600;
        goto LABEL_351;
      }

      if (!(*(void *)__s ^ 0x697274735F617077LL | *(void *)&__s[8] ^ 0x79656B65725F7463LL | __s[16]))
      {
        *(_DWORD *)(v23 + 516) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F6B6D675F617077LL && *(void *)&__s[6] == 0x79656B65725F6BLL)
      {
        *(_DWORD *)(v23 + 520) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F6B74705F617077LL && *(void *)&__s[6] == 0x79656B65725F6BLL)
      {
        *(_DWORD *)(v23 + 524) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x737361705F617077LL && *(void *)&__s[7] == 0x65736172687073LL)
      {
        if (strlen(v28 + 1) - 64 <= 0xFFFFFFC7)
        {
          sub_100016E40( 4LL,  "Line %d: invalid WPA passphrase length %d (expected 8..63)",  v207,  v208,  v209,  v210,  v211,  v212,  v20);
          goto LABEL_344;
        }

        free(*(void **)(v23 + 240));
        *(void *)(v23 + 240) = strdup(v36);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x6B73705F617077LL)
      {
        free(*(void **)(v23 + 232));
        v213 = sub_100016B98(0x38uLL);
        *(void *)(v23 + 2memset(&v9[1], 0, 32) = v213;
        if (!v213) {
          goto LABEL_344;
        }
        if (sub_100016334(v36, v213 + 12, 32LL) || v35[65])
        {
          sub_100016E40(4LL, "Line %d: Invalid PSK '%s'.", v214, v215, v216, v217, v218, v219, v20);
          goto LABEL_344;
        }

        *(_DWORD *)(*(void *)(v23 + 232) + 8LL) = 1;
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F6B73705F617077LL && *(void *)&__s[5] == 0x656C69665F6B73LL)
      {
        free(*(void **)(v23 + 248));
        v220 = strdup(v36);
        *(void *)(v23 + 248) = v220;
        if (!v220)
        {
          sub_100016E40(4LL, "Line %d: allocation failed", v221, v222, v223, v224, v225, v226, v20);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F79656B5F617077LL && *(void *)&__s[5] == 0x746D676D5F7965LL)
      {
        int v227 = sub_100019758(v20, v36);
        *(_DWORD *)(v23 + 488) = v227;
        BOOL v118 = v227 == -1 && v21 < 100;
        goto LABEL_345;
      }

      if (*(void *)__s == 0x726961705F617077LL && *(void *)&__s[5] == 0x65736977726961LL)
      {
        uint64_t v228 = sub_100019910(v20, v36);
        *(_DWORD *)(v23 + 504) = v228;
        goto LABEL_421;
      }

      if (*(void *)__s == 0x726961705F6E7372LL && *(void *)&__s[5] == 0x65736977726961LL)
      {
        uint64_t v228 = sub_100019910(v20, v36);
        *(_DWORD *)(v23 + 528) = v228;
LABEL_421:
        if ((_DWORD)v228 == -1) {
          goto LABEL_344;
        }
        if ((v228 & 7) != 0)
        {
          sub_100016E40( 4LL,  "Line %d: unsupported pairwise cipher suite '%s'",  v229,  v230,  v231,  v232,  v233,  v234,  v228);
          goto LABEL_344;
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x746E695F6C727463LL && *(void *)&__s[7] == 0x65636166726574LL)
      {
        free(*(void **)(v23 + 552));
        *(void *)(v23 + 552) = strdup(v36);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x746E695F6C727463LL
        && *(void *)&__s[8] == 0x675F656361667265LL
        && *(void *)&__s[13] == 0x70756F72675F65LL)
      {
        v235 = getgrnam(v28 + 1);
        if (v235)
        {
          uint64_t gr_gid = v235->gr_gid;
          *(_DWORD *)(v23 + 560) = gr_gid;
          *(_DWORD *)(v23 + 564) = 1;
          sub_100016E40( 1LL,  "ctrl_interface_group=%d (from group name '%s')",  v236,  v237,  v238,  v239,  v240,  v241,  gr_gid);
        }

        else
        {
          uint64_t v243 = strtol(v36, &__endptr, 10);
          *(_DWORD *)(v23 + 560) = v243;
          if (!*v36 || *__endptr)
          {
            sub_100016E40(1LL, "Line %d: Invalid group '%s'", v244, v245, v246, v247, v248, v249, v20);
            goto LABEL_344;
          }

          *(_DWORD *)(v23 + 564) = 1;
          sub_100016E40(1LL, "ctrl_interface_group=%d", v244, v245, v246, v247, v248, v249, v243);
        }

        goto LABEL_351;
      }

      if (*(void *)__s == 0x636F735F74736574LL && *(unsigned int *)&__s[8] == 7628139LL)
      {
        free(*(void **)(v23 + 688));
        *(void *)(v23 + 688) = strdup(v36);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x5F6561705F657375LL
        && *(void *)&__s[8] == 0x64615F70756F7267LL
        && *(void *)&__s[11] == 0x726464615F7075LL)
      {
        *(_DWORD *)(v23 + 696) = atoi(v28 + 1);
        goto LABEL_351;
      }

      if (*(void *)__s == 0x65646F6D5F7768LL)
      {
        if (!strcmp(v28 + 1, "a"))
        {
          int v263 = 2;
LABEL_449:
          *(_DWORD *)(v18 + 40) = v263;
          goto LABEL_351;
        }

        if (strcmp(v36, "b"))
        {
          if (strcmp(v36, "g"))
          {
            sub_100016E40(4LL, "Line %d: unknown hw_mode '%s'", v250, v251, v252, v253, v254, v255, v20);
            goto LABEL_344;
          }

          int v263 = 1;
          goto LABEL_449;
        }

        *(_DWORD *)(v18 + 40) = 0;
      }

      else
      {
        if (*(void *)__s == 0x6C656E6E616863LL)
        {
          *(_BYTE *)(v18 + 37) = atoi(v28 + 1);
          goto LABEL_351;
        }

        if (*(void *)__s == 0x695F6E6F63616562LL && *(void *)&__s[3] == 0x746E695F6E6F63LL)
        {
          int v256 = atoi(v28 + 1);
          if ((v256 - 0x10000) <= 0xFFFF000E)
          {
            sub_100016E40( 4LL,  "Line %d: invalid beacon_int %d (expected 15..65535)",  v257,  v258,  v259,  v260,  v261,  v262,  v20);
            goto LABEL_344;
          }

          *(_WORD *)(v18 + 24) = v256;
          goto LABEL_351;
        }

        if (*(void *)__s == 0x7265705F6D697464LL && *(unsigned int *)&__s[8] == 6582121LL)
        {
          int v264 = atoi(v28 + 1);
          *(_DWORD *)(v23 + 68) = v264;
          if ((v264 - 256) <= 0xFFFFFF00)
          {
            sub_100016E40(4LL, "Line %d: invalid dtim_period %d", v265, v266, v267, v268, v269, v270, v20);
            goto LABEL_344;
          }

          goto LABEL_351;
        }

        if (*(void *)__s == 0x657268745F737472LL && *(void *)&__s[6] == 0x646C6F68736572LL)
        {
          unsigned int v271 = atoi(v28 + 1);
          *(_DWORD *)(v18 + 28) = v271;
          if (v271 >= 0x92C)
          {
            sub_100016E40(4LL, "Line %d: invalid rts_threshold %d", v272, v273, v274, v275, v276, v277, v20);
            goto LABEL_344;
          }

          goto LABEL_351;
        }

        if (*(void *)__s == 0x68745F6D67617266LL && *(void *)&__s[8] == 0x646C6F68736572LL)
        {
          int v278 = atoi(v28 + 1);
          *(_DWORD *)(v18 + memset(&v9[1], 0, 32) = v278;
          if ((v278 - 2347) <= 0xFFFFF7D4)
          {
            sub_100016E40(4LL, "Line %d: invalid fragm_threshold %d", v279, v280, v281, v282, v283, v284, v20);
            goto LABEL_344;
          }

          goto LABEL_351;
        }

        if (*(void *)__s == 0x6F72705F646E6573LL
          && *(void *)&__s[8] == 0x6F707365725F6562LL
          && *(unsigned int *)&__s[16] == 6648686LL)
        {
          unsigned int v285 = atoi(v28 + 1);
          if (v285 < 2) {
            *(_BYTE *)(v18 + 36) = v285;
          }
          else {
            sub_100016E40( 4LL,  "Line %d: invalid send_probe_response %d (expected 0 or 1)",  v286,  v287,  v288,  v289,  v290,  v291,  v20);
          }
          goto LABEL_351;
        }

        if (*(void *)__s == 0x6574726F70707573LL && *(void *)&__s[8] == 0x73657461725F64LL)
        {
          v292 = (void **)(v18 + 56);
          goto LABEL_457;
        }

        if (*(void *)__s == 0x61725F6369736162LL && *(_DWORD *)&__s[8] == 7562612)
        {
          v292 = v378;
LABEL_457:
          if (sub_100019AC8(v292, v36))
          {
            sub_100016E40(4LL, "Line %d: invalid rate list", v293, v294, v295, v296, v297, v298, v20);
            goto LABEL_344;
          }

          goto LABEL_351;
        }

        if (*(void *)__s ^ 0x656C626D61657270LL | __s[8])
        {
          if (*(void *)__s == 0x625F65726F6E6769LL
            && *(void *)&__s[8] == 0x7473616364616F72LL
            && *(void *)&__s[14] == 0x646973735F7473LL)
          {
            *(_DWORD *)(v23 + 704) = atoi(v28 + 1);
          }

          else if (*(void *)__s == 0x616665645F706577LL && *(void *)&__s[8] == 0x79656B5F746C75LL)
          {
            unsigned __int8 v305 = atoi(v28 + 1);
            *(_BYTE *)(v23 + 256) = v305;
            if (v305 >= 4u)
            {
              sub_100016E40(4LL, "Invalid wep_default_key index %d", v306, v307, v308, v309, v310, v311, v305);
              goto LABEL_344;
            }
          }

          else if (*(void *)__s ^ 0x3079656B5F706577LL | __s[8] {
                 && *(void *)__s ^ 0x3179656B5F706577LL | __s[8]
          }
                 && *(void *)__s ^ 0x3279656B5F706577LL | __s[8]
                 && *(void *)__s ^ 0x3379656B5F706577LL | __s[8])
          {
            if (*(void *)__s == 0x656C6261745F7061LL
              && *(void *)&__s[8] == 0x7A69735F78616D5FLL
              && *(unsigned __int16 *)&__s[16] == 101)
            {
              *(_DWORD *)(v18 + 80) = atoi(v28 + 1);
            }

            else if (*(void *)__s ^ 0x656C6261745F7061LL | *(void *)&__s[8] ^ 0x746172697078655FLL | *(void *)&__s[16] ^ 0x656D69745F6E6F69LL | __s[24])
            {
              if (*(void *)__s == 0x65756575715F7874LL && __s[8] == 95)
              {
                if (sub_100019CA8(v18, (uint64_t)__s, v36))
                {
                  sub_100016E40(4LL, "Line %d: invalid TX queue item", v312, v313, v314, v315, v316, v317, v20);
                  goto LABEL_344;
                }
              }

              else
              {
                BOOL v99 = *(void *)__s == 0x62616E655F656D77LL && *(unsigned int *)&__s[8] == 6579564LL;
                if (v99
                  || (*(void *)__s == 0x62616E655F6D6D77LL
                    ? (BOOL v100 = *(unsigned int *)&__s[8] == 6579564LL)
                    : (BOOL v100 = 0),
                      v100))
                {
                  *(_DWORD *)(v23 + 708) = atoi(v28 + 1);
                }

                else if (*(void *)__s == 0x64615F6473706175LL {
                       && *(void *)&__s[8] == 0x6D65736974726576LL
                }
                       && *(void *)&__s[16] == 0x62616E655F746E65LL
                       && *(unsigned int *)&__s[24] == 6579564LL)
                {
                  *(_DWORD *)(v23 + 712) = atoi(v28 + 1);
                }

                else
                {
                  BOOL v104 = *(_DWORD *)__s == 1600482679 && *(_DWORD *)&__s[3] == 1600348511;
                  if (v104
                    || (*(_DWORD *)__s == 1601006967 ? (BOOL v105 = *(_DWORD *)&__s[3] == 1600348511) : (BOOL v105 = 0), v105))
                  {
                    if (sub_100019ECC(v18, (uint64_t)__s, v36))
                    {
                      sub_100016E40(4LL, "Line %d: invalid WMM ac item", v318, v319, v320, v321, v322, v323, v20);
                      goto LABEL_344;
                    }
                  }

                  else if (*(_DWORD *)__s == 7566178)
                  {
                    if (sub_10001A134(v18, v36))
                    {
                      sub_100016E40(4LL, "Line %d: invalid bss item", v324, v325, v326, v327, v328, v329, v20);
                      goto LABEL_344;
                    }
                  }

                  else if (*(_DWORD *)__s == 1769173858 && *(unsigned __int16 *)&__s[4] == 100)
                  {
                    if (sub_100016198(v28 + 1, v23 + 736))
                    {
                      sub_100016E40(4LL, "Line %d: invalid bssid item", v330, v331, v332, v333, v334, v335, v20);
                      goto LABEL_344;
                    }
                  }

                  else if (*(void *)__s == 0x3132303865656569LL && *(void *)&__s[3] == 0x77313132303865LL)
                  {
                    *(_DWORD *)(v23 + 492) = atoi(v28 + 1);
                  }

                  else if (*(void *)__s == 0x61735F636F737361LL {
                         && *(void *)&__s[8] == 0x6D5F79726575715FLL
                  }
                         && *(void *)&__s[16] == 0x6F656D69745F7861LL
                         && *(void *)&__s[19] == 0x74756F656D6974LL)
                  {
                    int v336 = atoi(v28 + 1);
                    *(_DWORD *)(v23 + 496) = v336;
                    if (!v336)
                    {
                      sub_100016E40( 4LL,  "Line %d: invalid assoc_sa_query_max_timeout",  v337,  v338,  v339,  v340,  v341,  v342,  v20);
                      goto LABEL_344;
                    }
                  }

                  else if (*(void *)__s == 0x61735F636F737361LL {
                         && *(void *)&__s[8] == 0x725F79726575715FLL
                  }
                         && *(void *)&__s[16] == 0x6D69745F79727465LL
                         && *(void *)&__s[21] == 0x74756F656D6974LL)
                  {
                    int v343 = atoi(v28 + 1);
                    *(_DWORD *)(v23 + 500) = v343;
                    if (!v343)
                    {
                      sub_100016E40( 4LL,  "Line %d: invalid assoc_sa_query_retry_timeout",  v344,  v345,  v346,  v347,  v348,  v349,  v20);
                      goto LABEL_344;
                    }
                  }

                  else if (*(void *)__s == 0x7473696C5F78616DLL {
                         && *(void *)&__s[8] == 0x7265746E695F6E65LL
                  }
                         && *(unsigned int *)&__s[16] == 7102838LL)
                  {
                    *(_WORD *)(v23 + 742) = atoi(v28 + 1);
                  }

                  else if (*(_DWORD *)__s == 6515567)
                  {
                    *(_DWORD *)(v23 + 744) = atoi(v28 + 1);
                  }

                  else if (*(_DWORD *)__s == 6632040)
                  {
                    *(_BYTE *)(v23 + 752) = atoi(v28 + 1);
                  }

                  else
                  {
                    if (*(void *)__s != 0x617369645F6E7374LL
                      || *(void *)&__s[8] != 0x616C665F64656C62LL
                      || *(void *)&__s[11] != 0x7367616C665F64LL)
                    {
                      sub_100016E40(4LL, "Line %d: unknown configuration item '%s'", v29, v30, v31, v32, v33, v34, v20);
                      goto LABEL_344;
                    }

                    *(_BYTE *)(v23 + 753) = atoi(v28 + 1);
                  }
                }
              }
            }

            else
            {
              *(_DWORD *)(v18 + 84) = atoi(v28 + 1);
            }
          }

          else if (sub_100019BBC(v23 + 256, __s[7] - 48, v36))
          {
            sub_100016E40(4LL, "Line %d: invalid WEP key '%s'", v299, v300, v301, v302, v303, v304, v20);
            goto LABEL_344;
          }
        }

        else if (atoi(v28 + 1))
        {
          *(_DWORD *)(v18 + 44) = 1;
        }

        else
        {
          *(_DWORD *)(v18 + 44) = 0;
        }
      }

LABEL_351:
      uint64_t v22 = (uint64_t)v378;
      if (!fgets(__s, 256, v10)) {
        goto LABEL_493;
      }
    }
  }

  int v21 = 0;
LABEL_493:
  fclose(v10);
  unint64_t v357 = *(void *)(v18 + 16);
  if (v357)
  {
    uint64_t v358 = *(void *)v18 + 328LL;
    for (uint64_t i = *(void *)(v18 + 16); i; --i)
    {
      if (!*(_DWORD *)(v358 + 72)) {
        *(_DWORD *)(v358 + 80) = 0;
      }
      int v360 = *(_DWORD *)(v358 + 156);
      if ((v360 & 1) != 0)
      {
        int v361 = *(_DWORD *)(v358 + 176);
        if ((v360 & 2) != 0)
        {
LABEL_501:
          int v362 = *(_DWORD *)(v358 + 200);
          if (!v362)
          {
            int v362 = *(_DWORD *)(v358 + 176);
            *(_DWORD *)(v358 + 200) = v362;
          }

          LOBYTE(v361) = v362 | v361;
        }
      }

      else
      {
        LOBYTE(v361) = 0;
        if ((v360 & 2) != 0) {
          goto LABEL_501;
        }
      }

      if ((v361 & 8) != 0) {
        int v363 = 8;
      }
      else {
        int v363 = 16;
      }
      *(_DWORD *)(v358 + 180) = v363;
      v364 = *(void **)(v358 - 192);
      v364[2] = *v364;
      v364[5] = v364[3];
      int v365 = *(_DWORD *)(v358 - 256);
      if (v360)
      {
        if (v365) {
          *(_DWORD *)(v358 - 104) = 4;
        }
        else {
          *(_DWORD *)(v358 - 104) = 3;
        }
      }

      else if (v365)
      {
        *(_DWORD *)(v358 - 104) = 2;
        *(void *)(v358 + 8) = *(void *)(v358 + 64);
      }

      else if (*(_DWORD *)v358)
      {
        *(_DWORD *)(v358 - 104) = 1;
      }

      else
      {
        *(_DWORD *)(v358 - 104) = 0;
      }

      v358 += 760LL;
    }
  }

  if (!*(_DWORD *)(v18 + 92) || *(_BYTE *)(v18 + 88) && *(_BYTE *)(v18 + 89))
  {
    if (v357)
    {
      int v379 = v21;
      uint64_t v366 = 0LL;
      while (1)
      {
        v367 = *(_BYTE **)v18;
        uint64_t v368 = *(void *)v18 + 760 * v366;
        if (*(_DWORD *)(v368 + 72) && !*(_DWORD *)&v367[760 * v366 + 80] && !**(void **)&v367[760 * v366 + 136])
        {
          v374 = "Invalid IEEE 802.1X configuration (no EAP authenticator configured).";
LABEL_541:
          sub_100016E40(4LL, v374, v351, v352, v353, v354, v355, v356, v377);
          LODWORD(v357) = 1;
          goto LABEL_542;
        }

        if (*(_DWORD *)&v367[760 * v366 + 484]
          && (*(_WORD *)&v367[760 * v366 + 488] & 0x402) != 0
          && !*(void *)&v367[760 * v366 + 232]
          && !*(void *)&v367[760 * v366 + 240]
          && !*(void *)&v367[760 * v366 + 248])
        {
          v374 = "WPA-PSK or WPA3-SAE enabled, but PSK or passphrase is not configured.";
          goto LABEL_541;
        }

        v369 = &v367[760 * v366 + 736];
        int v370 = sub_100001F4C((uint64_t)v369);
        unint64_t v357 = *(void *)(v18 + 16);
        if (v370) {
          break;
        }
LABEL_537:
        if (++v366 >= v357)
        {
          LODWORD(v357) = 0;
          goto LABEL_542;
        }
      }

      if (v357)
      {
        uint64_t v371 = 0LL;
        unint64_t v372 = 0LL;
        while (1)
        {
          uint64_t v373 = *(void *)v18 + v371;
          if (v373 != v368)
          {
            if (!sub_100001EFC(v373 + 736, (uint64_t)v369))
            {
              v374 = "Duplicate BSSID %02x:%02x:%02x:%02x:%02x:%02x on interface '%s' and '%s'.";
              uint64_t v377 = *v369;
              goto LABEL_541;
            }

            unint64_t v357 = *(void *)(v18 + 16);
          }

          ++v372;
          v371 += 760LL;
          if (v372 >= v357) {
            goto LABEL_537;
          }
        }
      }

LABEL_542:
      int v21 = v379;
    }
  }

  else
  {
    sub_100016E40( 4LL,  "Cannot enable IEEE 802.11d without setting the country_code",  v351,  v352,  v353,  v354,  v355,  v356,  v377);
    LODWORD(v357) = 1;
  }

  if (v21 >= 100) {
    LODWORD(v357) = 0;
  }
  uint64_t v375 = (v21 + v357);
  if ((_DWORD)v375)
  {
    sub_100016E40(4LL, "%d errors found in configuration file '%s'", v351, v352, v353, v354, v355, v356, v375);
    sub_100002374(v18);
    return 0LL;
  }

  return v18;
}

uint64_t sub_100019530(uint64_t result, void **a2, int *a3)
{
  if (!result) {
    return result;
  }
  uint64_t v5 = result;
  uint64_t v6 = fopen((const char *)result, "r");
  if (!v6)
  {
    sub_100016E40(4LL, "MAC list file '%s' not found.", v7, v8, v9, v10, v11, v12, v5);
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = v6;
  if (!fgets(&v41, 128, v6))
  {
LABEL_29:
    fclose(v13);
    qsort(*a2, *a3, 0xCuLL, (int (__cdecl *)(const void *, const void *))sub_10001A21C);
    return 0LL;
  }

  int v14 = 0;
  while (1)
  {
    ++v14;
    if (v41 != 35) {
      break;
    }
LABEL_28:
    if (!fgets(&v41, 128, v13)) {
      goto LABEL_29;
    }
  }

  uint64_t v15 = v42;
  int v16 = v41;
  if (v41)
  {
    while (v16 != 10)
    {
      int v17 = *v15++;
      int v16 = v17;
      if (!v17) {
        goto LABEL_9;
      }
    }

    *(v15 - 1) = 0;
    if (!v41) {
      goto LABEL_28;
    }
  }

  else
  {
LABEL_9:
    if (!v41) {
      goto LABEL_28;
    }
  }

  if (sub_100016198(&v41, (uint64_t)&v39))
  {
    sub_100016E40(4LL, "Invalid MAC address '%s' at line %d in '%s'", v18, v19, v20, v21, v22, v23, (uint64_t)&v41);
    goto LABEL_33;
  }

  for (uint64_t i = &v41; ; ++i)
  {
    unsigned int v25 = *i;
    if (v25 <= 0x20 && ((1LL << v25) & 0x100000201LL) != 0) {
      break;
    }
  }

  while (v25 == 9 || v25 == 32)
  {
    char v27 = *++i;
    LOBYTE(v25) = v27;
  }

  if ((_BYTE)v25) {
    int v28 = atoi(i);
  }
  else {
    int v28 = 0;
  }
  uint64_t v29 = (char *)realloc(*a2, 12LL * *a3 + 12);
  if (v29)
  {
    *a2 = v29;
    int v36 = *a3;
    uint64_t v37 = &v29[12 * *a3];
    *(_DWORD *)uint64_t v37 = v39;
    *((_WORD *)v37 + 2) = v40;
    *((_DWORD *)v37 + 2) = v28;
    *a3 = v36 + 1;
    goto LABEL_28;
  }

  sub_100016E40(4LL, "MAC list reallocation failed", v30, v31, v32, v33, v34, v35, v38);
LABEL_33:
  fclose(v13);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100019758(uint64_t a1, char *__s1)
{
  uint64_t v3 = strdup(__s1);
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = *v3;
    if (*v3)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = v3;
      while (1)
      {
        for (uint64_t i = v7; ; ++i)
        {
          ++v7;
          if (v5 != 9 && v5 != 32) {
            break;
          }
          unsigned int v9 = i[1];
          unsigned int v5 = v9;
        }

        if (!v5) {
          break;
        }
        while (v5 > 0x20 || ((1LL << v5) & 0x100000201LL) == 0)
        {
          unsigned int v10 = *v7++;
          unsigned int v5 = v10;
        }

        *(v7 - 1) = 0;
        if (!strcmp(i, "WPA-PSK"))
        {
          int v17 = 2;
        }

        else if (!strcmp(i, "WPA-EAP"))
        {
          int v17 = 1;
        }

        else if (!strcmp(i, "WPA-PSK-SHA256"))
        {
          int v17 = 256;
        }

        else if (!strcmp(i, "WPA-EAP-SHA256"))
        {
          int v17 = 128;
        }

        else
        {
          if (strcmp(i, "WPA3-SAE"))
          {
            sub_100016E40(4LL, "Line %d: invalid key_mgmt '%s'", v11, v12, v13, v14, v15, v16, a1);
            free(v4);
            return 0xFFFFFFFFLL;
          }

          int v17 = 1024;
        }

        uint64_t v6 = v6 | v17;
        if (v5)
        {
          unsigned int v5 = *v7;
          if (*v7) {
            continue;
          }
        }

        free(v4);
        return v6;
      }

      free(v4);
      if ((_DWORD)v6) {
        return v6;
      }
    }

    else
    {
      free(v3);
    }

    sub_100016E40(4LL, "Line %d: no key_mgmt values configured.", v18, v19, v20, v21, v22, v23, a1);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100019910(uint64_t a1, char *__s1)
{
  uint64_t v3 = strdup(__s1);
  if (v3)
  {
    uint64_t v4 = v3;
    unsigned int v5 = *v3;
    if (*v3)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = v3;
      while (1)
      {
        for (uint64_t i = v7; ; ++i)
        {
          ++v7;
          if (v5 != 9 && v5 != 32) {
            break;
          }
          unsigned int v9 = i[1];
          unsigned int v5 = v9;
        }

        if (!v5) {
          break;
        }
        while (v5 > 0x20 || ((1LL << v5) & 0x100000201LL) == 0)
        {
          unsigned int v10 = *v7++;
          unsigned int v5 = v10;
        }

        *(v7 - 1) = 0;
        if (!strcmp(i, "CCMP"))
        {
          int v17 = 16;
        }

        else if (!strcmp(i, "TKIP"))
        {
          int v17 = 8;
        }

        else if (!strcmp(i, "WEP104"))
        {
          int v17 = 4;
        }

        else if (!strcmp(i, "WEP40"))
        {
          int v17 = 2;
        }

        else
        {
          if (strcmp(i, "NONE"))
          {
            sub_100016E40(4LL, "Line %d: invalid cipher '%s'.", v11, v12, v13, v14, v15, v16, a1);
            free(v4);
            return 0xFFFFFFFFLL;
          }

          int v17 = 1;
        }

        uint64_t v6 = v6 | v17;
        if (v5)
        {
          unsigned int v5 = *v7;
          if (*v7) {
            continue;
          }
        }

        free(v4);
        return v6;
      }

      free(v4);
      if ((_DWORD)v6) {
        return v6;
      }
    }

    else
    {
      free(v3);
    }

    sub_100016E40(4LL, "Line %d: no cipher values configured.", v18, v19, v20, v21, v22, v23, a1);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100019AC8(void **a1, const char *a2)
{
  int v4 = 0;
  *a1 = 0LL;
  for (uint64_t i = a2; *i == 32; ++i)
  {
    ++v4;
LABEL_6:
    ;
  }

  if (*i) {
    goto LABEL_6;
  }
  uint64_t v6 = malloc(4LL * (v4 + 2));
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = v6;
  if (*a2)
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      unsigned int v9 = strchr(a2, 32);
      if (!v9) {
        break;
      }
      unsigned int v10 = v9;
      char *v9 = 0;
      int v11 = atoi(a2);
      int v12 = v8 + 1;
      v7[v8++] = v11;
      a2 = v10 + 1;
      if (!v10[1]) {
        goto LABEL_16;
      }
    }

    int v14 = atoi(a2);
    int v12 = v8 + 1;
    v7[v8] = v14;
  }

  else
  {
    int v12 = 0;
  }

uint64_t sub_100019BBC(uint64_t a1, unsigned int a2, char *__s)
{
  size_t v6 = strlen(__s);
  if (a2 > 3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = a1 + 8LL * a2;
  uint64_t v9 = *(void *)(v7 + 8);
  uint64_t v8 = (void *)(v7 + 8);
  if (v9) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = a2;
  if (*__s != 34)
  {
    if ((v6 & 1) == 0)
    {
      uint64_t v14 = v6 >> 1;
      uint64_t v15 = malloc(v6 >> 1);
      void *v8 = v15;
      if (v15)
      {
        *(void *)(a1 + 8 * v11 + 40) = v14;
        if ((sub_100016334(__s, v15, v14) & 0x80000000) == 0) {
          goto LABEL_12;
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

  size_t v12 = v6 - 2;
  if (v6 < 2) {
    return 0xFFFFFFFFLL;
  }
  if (__s[v6 - 1] != 34) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = malloc(v6 - 2);
  void *v8 = v13;
  if (!v13) {
    return 0xFFFFFFFFLL;
  }
  memcpy(v13, __s + 1, v12);
  *(void *)(a1 + 8 * v11 + 40) = v12;
LABEL_12:
  uint64_t result = 0LL;
  ++*(_DWORD *)(a1 + 72);
  return result;
}

uint64_t sub_100019CA8(uint64_t a1, uint64_t a2, const char *a3)
{
  size_t v6 = (const char *)(a2 + 9);
  if (!strncmp((const char *)(a2 + 9), "data", 4uLL)
    && (int v7 = *(char *)(a2 + 13), (v7 - 48) <= 9u)
    && *(_BYTE *)(a2 + 14) == 95)
  {
    unsigned int v8 = v7 - 48;
    uint64_t v9 = (const char *)(a2 + 15);
  }

  else if (!strncmp(v6, "after_beacon_", 0xDuLL))
  {
    uint64_t v9 = (const char *)(a2 + 22);
    unsigned int v8 = 6;
  }

  else
  {
    if (strncmp(v6, "beacon_", 7uLL))
    {
      sub_100016E40(4LL, "Unknown tx_queue name '%s'", v10, v11, v12, v13, v14, v15, (uint64_t)v6);
      return 0xFFFFFFFFLL;
    }

    uint64_t v9 = (const char *)(a2 + 16);
    unsigned int v8 = 7;
  }

  if (!strcmp(v9, "aifs"))
  {
    uint64_t v22 = atoi(a3);
    *(_DWORD *)(a1 + 20LL * v8 + 96) = v22;
    if (v22 >= 0x100)
    {
      sub_100016E40(4LL, "Invalid AIFS value %d", v23, v24, v25, v26, v27, v28, v22);
      return 0xFFFFFFFFLL;
    }
  }

  else if (!strcmp(v9, "cwmin"))
  {
    uint64_t v29 = atoi(a3);
    *(_DWORD *)(a1 + 20LL * v8 + 100) = v29;
    if (!sub_10001A26C(v29))
    {
      sub_100016E40(4LL, "Invalid cwMin value %d", v30, v31, v32, v33, v34, v35, v29);
      return 0xFFFFFFFFLL;
    }
  }

  else if (!strcmp(v9, "cwmax"))
  {
    uint64_t v36 = atoi(a3);
    *(_DWORD *)(a1 + 20LL * v8 + 104) = v36;
    if (!sub_10001A26C(v36))
    {
      sub_100016E40(4LL, "Invalid cwMax value %d", v37, v38, v39, v40, v41, v42, v36);
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    if (strcmp(v9, "burst"))
    {
      sub_100016E40(4LL, "Unknown tx_queue field '%s'", v16, v17, v18, v19, v20, v21, (uint64_t)v9);
      return 0xFFFFFFFFLL;
    }

    int v44 = atoi(a3);
    uint64_t v45 = strchr(a3, 46);
    if (v45)
    {
      unsigned int v46 = v45[1] - 48;
      if (v46 > 9) {
        unsigned int v46 = 0;
      }
    }

    else
    {
      unsigned int v46 = 0;
    }

    *(_DWORD *)(a1 + 20LL * v8 + 108) = v46 + 10 * v44;
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a1 + 20LL * v8 + 112) = 1;
  return result;
}

uint64_t sub_100019ECC(uint64_t a1, uint64_t a2, const char *a3)
{
  size_t v6 = (const char *)(a2 + 7);
  if (!strncmp((const char *)(a2 + 7), "be_", 3uLL))
  {
    unsigned int v7 = 0;
  }

  else if (!strncmp(v6, "bk_", 3uLL))
  {
    unsigned int v7 = 1;
  }

  else if (!strncmp(v6, "vi_", 3uLL))
  {
    unsigned int v7 = 2;
  }

  else
  {
    unsigned int v7 = 3;
    if (strncmp(v6, "vo_", 3uLL))
    {
      sub_100016E40(4LL, "Unknown WMM name '%s'", v8, v9, v10, v11, v12, v13, (uint64_t)v6);
      return 0xFFFFFFFFLL;
    }
  }

  uint64_t v14 = (const char *)(a2 + 10);
  if (!strcmp(v14, "aifs"))
  {
    uint64_t v21 = atoi(a3);
    int v28 = v21;
    if ((v21 - 256) > 0xFFFFFF00)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 20LL * v7 + 264) = v28;
      return result;
    }

    sub_100016E40(4LL, "Invalid AIFS value %d", v22, v23, v24, v25, v26, v27, v21);
    return 0xFFFFFFFFLL;
  }

  if (!strcmp(v14, "cwmin"))
  {
    uint64_t v29 = atoi(a3);
    int v36 = v29;
    if (v29 < 0xD)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 20LL * v7 + 256) = v36;
      return result;
    }

    sub_100016E40(4LL, "Invalid cwMin value %d", v30, v31, v32, v33, v34, v35, v29);
    return 0xFFFFFFFFLL;
  }

  if (!strcmp(v14, "cwmax"))
  {
    uint64_t v38 = atoi(a3);
    int v45 = v38;
    if (v38 < 0xD)
    {
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 20LL * v7 + 260) = v45;
      return result;
    }

    sub_100016E40(4LL, "Invalid cwMax value %d", v39, v40, v41, v42, v43, v44, v38);
    return 0xFFFFFFFFLL;
  }

  if (!strcmp(v14, "txop_limit"))
  {
    uint64_t v46 = atoi(a3);
    int v53 = v46;
    if (v46 >= 0x10000)
    {
      sub_100016E40(4LL, "Invalid txop value %d", v47, v48, v49, v50, v51, v52, v46);
      return 0xFFFFFFFFLL;
    }

    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 20LL * v7 + 268) = v53;
  }

  else
  {
    if (strcmp(v14, "acm"))
    {
      sub_100016E40(4LL, "Unknown wmm_ac_ field '%s'", v15, v16, v17, v18, v19, v20, (uint64_t)v14);
      return 0xFFFFFFFFLL;
    }

    uint64_t v54 = atoi(a3);
    int v61 = v54;
    if (v54 >= 2)
    {
      sub_100016E40(4LL, "Invalid acm value %d", v55, v56, v57, v58, v59, v60, v54);
      return 0xFFFFFFFFLL;
    }

    uint64_t result = 0LL;
    *(_DWORD *)(a1 + 20LL * v7 + 272) = v61;
  }

  return result;
}

uint64_t sub_10001A134(uint64_t a1, _BYTE *a2)
{
  if (*a2)
  {
    int v4 = (char *)realloc(*(void **)a1, 760LL * *(void *)(a1 + 16) + 760);
    if (v4)
    {
      uint64_t v11 = v4;
      *(void *)a1 = v4;
      uint64_t v12 = *(void *)(a1 + 16);
      uint64_t v13 = &v4[760 * v12];
      bzero(v13, 0x2F8uLL);
      uint64_t v14 = sub_100016B98(0x50uLL);
      *((void *)v13 + 17) = v14;
      if (v14)
      {
        uint64_t v15 = *(void *)(a1 + 16) + 1LL;
        *(void *)(a1 + 8) = v13;
        *(void *)(a1 + 16) = v15;
        sub_100001D68((uint64_t)v13);
        sub_100016BA4(v13, (unint64_t)a2, 17LL);
        uint64_t result = 0LL;
        uint64_t v17 = &v11[760 * v12];
        *(_OWORD *)(v17 + 204) = *(_OWORD *)v13;
        v17[220] = v13[16];
        return result;
      }

      uint64_t v18 = "Failed to allocate memory for multi-BSS RADIUS data";
    }

    else
    {
      uint64_t v18 = "Failed to allocate memory for multi-BSS entry";
    }

    sub_100016E40(4LL, v18, v5, v6, v7, v8, v9, v10, v19);
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_10001A21C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = bswap32(*(_DWORD *)a1);
  unsigned int v3 = bswap32(*(_DWORD *)a2);
  if (v2 == v3)
  {
    unsigned int v2 = bswap32(*(unsigned __int16 *)(a1 + 4)) >> 16;
    unsigned int v4 = bswap32(*(unsigned __int16 *)(a2 + 4));
    if (v2 == HIWORD(v4)) {
      return 0LL;
    }
    unsigned int v3 = HIWORD(v4);
  }

  if (v2 < v3) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 1LL;
  }
}

BOOL sub_10001A26C(int a1)
{
  BOOL result = 1LL;
  if (a1 <= 126)
  {
    return a1 == 1023;
  }

  if (a1 != 127 && a1 != 255 && a1 != 511) {
    return a1 == 1023;
  }
  return result;
}

uint64_t sub_10001A2C8(uint64_t a1)
{
  *(_DWORD *)(a1 + 2664) = -1;
  uint64_t result = *(void *)(*(void *)(a1 + 16) + 552LL);
  if (result)
  {
    if (mkdir((const char *)result, 0x1F8u) < 0)
    {
      if (*__error() != 17)
      {
        uint64_t v42 = "mkdir[ctrl_interface]";
        goto LABEL_25;
      }

      sub_100016E40(1LL, "Using existing control interface directory.", v3, v4, v5, v6, v7, v8, v44);
    }

    uint64_t v9 = *(void *)(a1 + 16);
    if (*(_DWORD *)(v9 + 564))
    {
      if (chown(*(const char **)(v9 + 552), 0, *(_DWORD *)(v9 + 560)) < 0)
      {
        uint64_t v42 = "chown[ctrl_interface]";
        goto LABEL_25;
      }

      uint64_t v9 = *(void *)(a1 + 16);
    }

    size_t v10 = strlen(*(const char **)(v9 + 552));
    int v11 = socket(1, 2, 0);
    if ((v11 & 0x80000000) == 0)
    {
      int v12 = v11;
      __int128 v50 = 0u;
      memset(v51, 0, sizeof(v51));
      __int128 v48 = 0u;
      __int128 v49 = 0u;
      sockaddr v46 = (sockaddr)0;
      __int128 v47 = 0u;
      v46.sa_family = 1;
      uint64_t v13 = sub_10001A5A8(a1);
      if (v13)
      {
        uint64_t v14 = v13;
        sub_100016BA4(v46.sa_data, (unint64_t)v13, 104LL);
        if ((bind(v12, &v46, 0x6Au) & 0x80000000) == 0) {
          goto LABEL_12;
        }
        uint64_t v16 = __error();
        uint64_t v17 = strerror(*v16);
        sub_100016E40(1LL, "ctrl_iface bind(PF_UNIX) failed: %s", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
        if (connect(v12, &v46, 0x6Au) < 0)
        {
          sub_100016E40( 1LL,  "ctrl_iface exists, but does not allow connections - assuming it was leftover from forced program termination",  v24,  v25,  v26,  v27,  v28,  v29,  v45);
          if (unlink(v14) < 0)
          {
            sub_10002958C((uint64_t)v14);
LABEL_31:
            close(v12);
            unlink(v14);
            free(v14);
            return 0xFFFFFFFFLL;
          }

          if (bind(v12, &v46, 0x6Au) < 0)
          {
            uint64_t v43 = "bind(PF_UNIX)";
LABEL_30:
            perror(v43);
            goto LABEL_31;
          }

          sub_100016E40( 1LL,  "Successfully replaced leftover ctrl_iface socket '%s'",  v36,  v37,  v38,  v39,  v40,  v41,  (uint64_t)v14);
LABEL_12:
          uint64_t v15 = *(void *)(a1 + 16);
          if (*(_DWORD *)(v15 + 564) && chown(v14, 0, *(_DWORD *)(v15 + 560)) < 0)
          {
            uint64_t v43 = "chown[ctrl_interface/ifname]";
          }

          else
          {
            if ((chmod(v14, 0x1F8u) & 0x80000000) == 0)
            {
              free(v14);
              *(_DWORD *)(a1 + 2664) = v12;
              sub_100025CA4(v12, (uint64_t)sub_10001A63C, a1, 0LL);
              *(void *)(a1 + 2576) = a1;
              sub_100017134(sub_10001AA9C);
              return 0LL;
            }

            uint64_t v43 = "chmod[ctrl_interface/ifname]";
          }

          goto LABEL_30;
        }

        sub_100016E40( 2LL,  "ctrl_iface exists and seems to be in use - cannot override it",  v24,  v25,  v26,  v27,  v28,  v29,  v45);
        sub_100016E40(2LL, "Delete '%s' manually if it is not used anymore", v30, v31, v32, v33, v34, v35, (uint64_t)v14);
        free(v14);
      }

      close(v12);
      return 0xFFFFFFFFLL;
    }

    uint64_t v42 = "socket(PF_UNIX)";
LABEL_25:
    perror(v42);
    return 0xFFFFFFFFLL;
  }

  return result;
}

char *sub_10001A5A8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  unsigned int v2 = *(const char **)(v1 + 552);
  if (!v2) {
    return 0LL;
  }
  size_t v3 = strlen(*(const char **)(v1 + 552));
  size_t v4 = strlen((const char *)v1) + v3;
  uint64_t v5 = (char *)malloc(v4 + 2);
  uint64_t v6 = v5;
  if (v5)
  {
    snprintf(v5, v4 + 2, "%s/%s", v2, (const char *)v1);
    v6[v4 + 1] = 0;
  }

  return v6;
}

void sub_10001A63C(int a1, uint64_t a2)
{
  socklen_t v32 = 106;
  unsigned int v4 = recvfrom(a1, v39, 0xFFuLL, 0, &v33, &v32);
  if ((v4 & 0x80000000) != 0)
  {
    perror("recvfrom(ctrl_iface)");
    return;
  }

  v39[v4] = 0;
  sub_100016F80(1LL, "RX ctrl_iface", v39, v4);
  uint64_t v5 = (char *)malloc(0x1000uLL);
  if (!v5)
  {
    sendto(a1, "FAIL\n", 5uLL, 0, &v33, v32);
    return;
  }

  int v12 = v5;
  v5[2] = 10;
  *(_WORD *)uint64_t v5 = 19279;
  if (!(*(_DWORD *)v39 ^ 0x474E4950 | v39[4]))
  {
    v5[4] = 10;
    int v21 = 1196314448;
LABEL_51:
    *(_DWORD *)int v12 = v21;
    unsigned int v20 = 5;
    goto LABEL_52;
  }

  if (*(_DWORD *)v39 == 4344141)
  {
    int v22 = sub_1000097D8(*(void *)(a2 + 2624), v5, 0x1000uLL);
    if (v22 < 0) {
      unsigned int v20 = -1;
    }
    else {
      unsigned int v20 = v22;
    }
    if ((v22 & 0x80000000) == 0)
    {
      int v23 = sub_100004C68();
      if (v23 < 0)
      {
LABEL_50:
        v12[4] = 10;
        int v21 = 1279869254;
        goto LABEL_51;
      }

      v20 += v23;
    }

LABEL_49:
    if ((v20 & 0x80000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_50;
  }

  if (*(void *)v39 == 0x535249462D415453LL && *(unsigned __int16 *)&v39[8] == 84)
  {
    unsigned int v24 = sub_10000327C(a2, v5, 0x1000uLL);
LABEL_48:
    unsigned int v20 = v24;
    goto LABEL_49;
  }

  if (*(_DWORD *)v39 == 541152339)
  {
    unsigned int v24 = sub_10000337C(a2, &v39[4], v5, 0x1000uLL);
    goto LABEL_48;
  }

  if (*(void *)v39 == 0x5458454E2D415453LL && v39[8] == 32)
  {
    unsigned int v24 = sub_100003410(a2, &v39[9], v5, 0x1000uLL);
    goto LABEL_48;
  }

  if (*(_DWORD *)v39 == 1096045633 && *(_DWORD *)&v39[3] == 4735809)
  {
    uint64_t v25 = v32;
    uint64_t v26 = (char *)sub_100016B98(0x80uLL);
    if (v26)
    {
      sockaddr v27 = v33;
      __int128 v28 = v34;
      *(_OWORD *)(v26 + 40) = v35;
      *(_OWORD *)(v26 + 24) = v28;
      *(sockaddr *)(v26 + 8) = v27;
      __int128 v29 = v36;
      __int128 v30 = v37;
      __int128 v31 = *(_OWORD *)v38;
      *(_OWORD *)(v26 + 98) = *(_OWORD *)&v38[10];
      *(_OWORD *)(v26 + 88) = v31;
      *(_OWORD *)(v26 + 72) = v30;
      *(_OWORD *)(v26 + 56) = v29;
      *((_DWORD *)v26 + 29) = v25;
      *((_DWORD *)v26 + 30) = 2;
      *(void *)uint64_t v26 = *(void *)(a2 + 2672);
      *(void *)(a2 + 2672) = v26;
      sub_100016EB0(1LL, "CTRL_IFACE monitor attached", (unsigned __int8 *)v33.sa_data, v25 - 2);
LABEL_64:
      unsigned int v20 = 3;
      goto LABEL_52;
    }

    goto LABEL_50;
  }

  if (*(_DWORD *)v39 == 1096041796 && *(_DWORD *)&v39[3] == 4735809)
  {
    goto LABEL_50;
  }

  if (*(_DWORD *)v39 == 1163281740 && *(unsigned __int16 *)&v39[4] == 8268)
  {
    goto LABEL_50;
  }

  if (*(void *)v39 == 0x204154535F57454ELL)
  {
    goto LABEL_50;
  }

  if (*(void *)v39 == 0x4E45485455414544LL && *(void *)&v39[7] == 0x204554414349544ELL)
  {
    goto LABEL_50;
  }

  if (*(void *)v39 == 0x434F535341534944LL && *(void *)&v39[5] == 0x2045544149434F53LL)
  {
    goto LABEL_50;
  }

  *(_OWORD *)uint64_t v5 = *(_OWORD *)"UNKNOWN COMMAND\n";
  unsigned int v20 = 16;
LABEL_52:
  sendto(a1, v12, v20, 0, &v33, v32);
  free(v12);
}

size_t sub_10001AA9C(size_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result)
  {
    uint64_t v4 = result;
    if ((*(_DWORD *)(result + 2664) & 0x80000000) == 0)
    {
      uint64_t v5 = *(void **)(result + 2672);
      if (v5)
      {
        snprintf(__str, 0xAuLL, "<%d>", a2);
        v22[0] = __str;
        uint64_t result = strlen(__str);
        uint64_t v9 = 0LL;
        v22[1] = result;
        __darwin_time_t v22[2] = a3;
        v22[3] = a4;
        *(_OWORD *)&v20.msg_name = 0u;
        memset(&v20.msg_iovlen + 1, 0, 20);
        v20.msg_iov = (iovec *)v22;
        v20.msg_iovleuint64_t n = 2;
        do
        {
          uint64_t v10 = v5;
          uint64_t v5 = (void *)*v5;
          if (*((_DWORD *)v10 + 30) <= a2)
          {
            sub_100016EB0( 1LL,  "CTRL_IFACE monitor send",  (unsigned __int8 *)v10 + 10,  *((unsigned int *)v10 + 29) - 2LL);
            v20.msg_name = v10 + 1;
            v20.msg_nameleuint64_t n = *((_DWORD *)v10 + 29);
            uint64_t result = sendmsg(*(_DWORD *)(v4 + 2664), &v20, 0);
            if ((result & 0x8000000000000000LL) != 0)
            {
              int v11 = *__error();
              __error();
              int v12 = __error();
              strerror(*v12);
              uint64_t result = sub_100016E40(2LL, "CTRL_IFACE monitor[%d]: %d - %s", v13, v14, v15, v16, v17, v18, v9);
              int v19 = *((_DWORD *)v10 + 31);
              *((_DWORD *)v10 + 31) = v19 + 1;
              if (v19 > 9 || v11 == 2) {
                uint64_t result = sub_10001ACFC(v4, (uint64_t)(v10 + 1), *((_DWORD *)v10 + 29));
              }
            }

            else
            {
              *((_DWORD *)v10 + 31) = 0;
            }
          }

          uint64_t v9 = (v9 + 1);
        }

        while (v5);
      }
    }
  }

  return result;
}

void *sub_10001AC48(uint64_t a1)
{
  if ((*(_DWORD *)(a1 + 2664) & 0x80000000) == 0)
  {
    sub_100025F80();
    close(*(_DWORD *)(a1 + 2664));
    *(_DWORD *)(a1 + 2664) = -1;
    unsigned int v2 = sub_10001A5A8(a1);
    size_t v3 = v2;
    if (v2) {
      unlink(v2);
    }
    free(v3);
    uint64_t v4 = *(const char **)(*(void *)(a1 + 16) + 552LL);
    if (v4 && rmdir(v4) < 0)
    {
      if (*__error() == 66) {
        sub_100016E40(1LL, "Control interface directory not empty - leaving it behind", v5, v6, v7, v8, v9, v10, v13);
      }
      else {
        perror("rmdir[ctrl_interface]");
      }
    }
  }

  uint64_t result = *(void **)(a1 + 2672);
  if (result)
  {
    do
    {
      int v12 = (void *)*result;
      free(result);
      uint64_t result = v12;
    }

    while (v12);
  }

  return result;
}

uint64_t sub_10001ACFC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(void *)(a1 + 2672);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = 0LL;
  uint64_t v6 = (void *)(a1 + 2672);
  uint64_t v7 = (void *)(a2 + 2);
  uint64_t v8 = a3 - 2LL;
  while (1)
  {
    uint64_t v9 = (void *)v3;
    uint64_t v3 = *v9;
    uint64_t v5 = v9;
    if (!*v9) {
      return 0xFFFFFFFFLL;
    }
  }

  if (v5) {
    int v11 = v5;
  }
  else {
    int v11 = v6;
  }
  *int v11 = *v9;
  free(v9);
  sub_100016EB0(1LL, "CTRL_IFACE monitor detached", (unsigned __int8 *)v7, v8);
  return 0LL;
}

uint64_t sub_10001ADB0( uint64_t a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9 = a3;
  sub_100016E40(1LL, "CTRL_IFACE LEVEL %s", a3, (uint64_t)a4, a5, a6, a7, a8, (uint64_t)a4);
  int v12 = *(uint64_t **)(a1 + 2672);
  if (!v12) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v13 = (void *)(a2 + 2);
  while (*((_DWORD *)v12 + 29) != v9 || memcmp(v13, (char *)v12 + 10, v9 - 2LL))
  {
    int v12 = (uint64_t *)*v12;
    if (!v12) {
      return 0xFFFFFFFFLL;
    }
  }

  sub_100016EB0(1LL, "CTRL_IFACE changed monitor level", (unsigned __int8 *)v13, v9 - 2LL);
  int v15 = atoi(a4);
  uint64_t result = 0LL;
  *((_DWORD *)v12 + 30) = v15;
  return result;
}

uint64_t sub_10001AE74( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!sub_1000059B4(a1, (uint64_t)&v18))
  {
    sub_100016E40( 1LL,  "Add new STA %02x:%02x:%02x:%02x:%02x:%02x based on ctrl_iface notification",  v11,  v12,  v13,  v14,  v15,  v16,  v18);
    uint64_t v17 = sub_1000063B0(a1, (uint64_t)&v18);
    if (!v17) {
      return 0xFFFFFFFFLL;
    }
    sub_1000049BC(a1, (uint64_t)v17, 0);
  }

  return 0LL;
}

uint64_t sub_10001AF30( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = strstr(a2, " test=");
  if (v11)
  {
    uint64_t v12 = *(int (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 2352) + 720LL);
    if (v12)
    {
      uint64_t v13 = atoi(v11 + 6);
      memset((char *)v21 + 2, 0, 32);
      v21[4] = 0LL;
      LOWORD(v21[0]) = 192;
      LOWORD(v21[1]) = v20;
      HIDWORD(v21[0]) = v19;
      HIWORD(v21[1]) = *(_WORD *)(a1 + 32);
      *(_DWORD *)((char *)&v21[1] + 2) = *(_DWORD *)(a1 + 28);
      LODWORD(v21[2]) = *(_DWORD *)((char *)&v21[1] + 2);
      WORD2(v21[2]) = HIWORD(v21[1]);
      LOWORD(v21[3]) = 2;
      return (v12(*(void *)(a1 + 2360), v21, 26LL, v13) >> 31);
    }

    return 0xFFFFFFFFLL;
  }

  (*(void (**)(uint64_t, int *, uint64_t))(a1 + 2528))(a1, &v19, 2LL);
  uint64_t result = sub_1000059B4(a1, (uint64_t)&v19);
  if (result)
  {
    sub_100006724(a1, result, 2LL, v14, v15, v16, v17, v18);
    return 0LL;
  }

  return result;
}

uint64_t sub_10001B074( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = strstr(a2, " test=");
  if (v11)
  {
    uint64_t v12 = *(int (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 2352) + 720LL);
    if (v12)
    {
      uint64_t v13 = atoi(v11 + 6);
      memset((char *)v21 + 2, 0, 32);
      v21[4] = 0LL;
      LOWORD(v21[0]) = 160;
      LOWORD(v21[1]) = v20;
      HIDWORD(v21[0]) = v19;
      HIWORD(v21[1]) = *(_WORD *)(a1 + 32);
      *(_DWORD *)((char *)&v21[1] + 2) = *(_DWORD *)(a1 + 28);
      LODWORD(v21[2]) = *(_DWORD *)((char *)&v21[1] + 2);
      WORD2(v21[2]) = HIWORD(v21[1]);
      LOWORD(v21[3]) = 2;
      return (v12(*(void *)(a1 + 2360), v21, 26LL, v13) >> 31);
    }

    return 0xFFFFFFFFLL;
  }

  (*(void (**)(uint64_t, int *, uint64_t))(a1 + 2536))(a1, &v19, 2LL);
  uint64_t result = sub_1000059B4(a1, (uint64_t)&v19);
  if (result)
  {
    sub_10000658C(a1, result, 2LL, v14, v15, v16, v17, v18);
    return 0LL;
  }

  return result;
}

uint64_t sub_10001B1B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 48))
  {
    uint64_t v8 = a1;
    for (unint64_t i = 0LL; i < *(void *)(v8 + 48); ++i)
    {
      uint64_t v10 = *(void *)(*(void *)(v8 + 56) + 8 * i);
      if (*(void *)(*(void *)(v10 + 16) + 56LL))
      {
        sub_100016E40( 1LL,  "Dumping hostapd state to '%s'",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(*(void *)(v10 + 16) + 56LL));
        uint64_t v11 = fopen(*(const char **)(*(void *)(v10 + 16) + 56LL), "w");
        if (v11)
        {
          uint64_t v12 = v11;
          unint64_t v49 = i;
          time(&v50);
          uint64_t v13 = ctime(&v50);
          fprintf(v12, "hostapd state dump - %s", v13);
          fprintf( v12,  "num_sta=%d num_sta_non_erp=%d num_sta_no_short_slot_time=%d\nnum_sta_no_short_preamble=%d\n",  *(_DWORD *)(v10 + 36),  *(_DWORD *)(*(void *)v10 + 2184LL),  *(_DWORD *)(*(void *)v10 + 2188LL),  *(_DWORD *)(*(void *)v10 + 2192LL));
          for (uint64_t j = *(uint64_t **)(v10 + 40); j; uint64_t j = (uint64_t *)*j)
          {
            fprintf( v12,  "\nSTA=%02x:%02x:%02x:%02x:%02x:%02x\n",  *((unsigned __int8 *)j + 16),  *((unsigned __int8 *)j + 17),  *((unsigned __int8 *)j + 18),  *((unsigned __int8 *)j + 19),  *((unsigned __int8 *)j + 20),  *((unsigned __int8 *)j + 21));
            int v15 = *((_DWORD *)j + 6);
            uint64_t v16 = "[AUTH]";
            if ((v15 & 1) == 0) {
              uint64_t v16 = (const char *)&unk_10002C2E3;
            }
            uint64_t v17 = "[ASSOC]";
            if ((v15 & 2) == 0) {
              uint64_t v17 = (const char *)&unk_10002C2E3;
            }
            uint64_t v18 = "[PS]";
            if ((v15 & 4) == 0) {
              uint64_t v18 = (const char *)&unk_10002C2E3;
            }
            int v19 = "[TIM]";
            if ((v15 & 8) == 0) {
              int v19 = (const char *)&unk_10002C2E3;
            }
            __int16 v20 = "[PERM]";
            if ((v15 & 0x10) == 0) {
              __int16 v20 = (const char *)&unk_10002C2E3;
            }
            int v21 = "[AUTHORIZED]";
            if ((v15 & 0x20) == 0) {
              int v21 = (const char *)&unk_10002C2E3;
            }
            int v22 = "[PENDING_POLL";
            if ((v15 & 0x40) == 0) {
              int v22 = (const char *)&unk_10002C2E3;
            }
            int v23 = "[SHORT_PREAMBLE]";
            if ((v15 & 0x80) == 0) {
              int v23 = (const char *)&unk_10002C2E3;
            }
            unsigned int v24 = "[PREAUTH]";
            if ((v15 & 0x100) == 0) {
              unsigned int v24 = (const char *)&unk_10002C2E3;
            }
            uint64_t v25 = "[WMM]";
            if ((v15 & 0x200) == 0) {
              uint64_t v25 = (const char *)&unk_10002C2E3;
            }
            uint64_t v26 = "[MFP]";
            if ((v15 & 0x400) == 0) {
              uint64_t v26 = (const char *)&unk_10002C2E3;
            }
            sockaddr v27 = "[WPS]";
            if ((v15 & 0x1000) == 0) {
              sockaddr v27 = (const char *)&unk_10002C2E3;
            }
            __int128 v28 = "[MAYBE_WPS]";
            if ((v15 & 0x2000) == 0) {
              __int128 v28 = (const char *)&unk_10002C2E3;
            }
            __int128 v29 = "[WDS]";
            if ((v15 & 0x4000) == 0) {
              __int128 v29 = (const char *)&unk_10002C2E3;
            }
            __int128 v30 = "[NonERP]";
            if (v15 >= 0) {
              __int128 v30 = (const char *)&unk_10002C2E3;
            }
            fprintf( v12,  "  AID=%d flags=0x%x %s%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n  capability=0x%x listen_interval=%d\n",  *((unsigned __int16 *)j + 11),  v15,  v16,  v17,  v18,  v19,  v20,  v21,  v22,  v23,  v24,  v25,  v26,  v27,  v28,  v29,  v30,  *((unsigned __int16 *)j + 14),  *((unsigned __int16 *)j + 15));
            fwrite("  supported_rates=", 0x12uLL, 1uLL, v12);
            if (*((int *)j + 16) >= 1)
            {
              uint64_t v31 = 0LL;
              do
                fprintf(v12, "%02x ", *((unsigned __int8 *)j + v31++ + 32));
              while (v31 < *((int *)j + 16));
            }

            fputc(10, v12);
            int v32 = *((_DWORD *)j + 20);
            sockaddr v33 = "DEAUTH";
            if (v32 == 1) {
              sockaddr v33 = "DISASSOC";
            }
            BOOL v34 = v32 == 0;
            __int128 v35 = "NULLFUNC POLL";
            if (!v34) {
              __int128 v35 = v33;
            }
            fprintf(v12, "  timeout_next=%s\n", v35);
            uint64_t v36 = j[11];
            if (v36)
            {
              fprintf(v12, "%sIEEE 802.1X:\n", "  ");
              if (*(void *)(v36 + 264))
              {
                fprintf(v12, "%sidentity=", "  ");
                if (*(void *)(v36 + 272))
                {
                  unint64_t v37 = 0LL;
                  do
                  {
                    int v38 = *(char *)(*(void *)(v36 + 264) + v37);
                    else {
                      fputc(v38, v12);
                    }
                    ++v37;
                  }

                  while (v37 < *(void *)(v36 + 272));
                }

                fputc(10, v12);
              }

              int v39 = *(unsigned __int8 *)(v36 + 280);
              uint64_t v40 = (const char *)sub_1000210AC(0, v39);
              int v41 = *(unsigned __int8 *)(v36 + 281);
              uint64_t v42 = (const char *)sub_1000210AC(0, v41);
              fprintf( v12,  "%slast EAP type: Authentication Server: %d (%s) Supplicant: %d (%s)\n",  "  ",  v39,  v40,  v41,  v42);
              uint64_t v43 = "[RX RADIUS]";
              if (!*(void *)(v36 + 248)) {
                uint64_t v43 = (const char *)&unk_10002C2E3;
              }
              fprintf(v12, "%scached_packets=%s\n", "  ", v43);
              sub_100021458(v12, "  ", v36);
            }
          }

          fclose(v12);
          uint64_t v8 = a1;
          unint64_t i = v49;
          continue;
        }

        uint64_t v47 = *(void *)(*(void *)(v10 + 16) + 56LL);
        uint64_t v44 = 3LL;
        uint64_t v45 = "Could not open dump file '%s' for writing.";
      }

      else
      {
        uint64_t v44 = 1LL;
        uint64_t v45 = "Dump file not defined - ignoring dump request";
      }

      sub_100016E40(v44, v45, a3, a4, a5, a6, a7, a8, v47);
    }
  }

  return 0LL;
}

uint64_t sub_10001B634()
{
  return 0LL;
}

char *sub_10001B63C(unint64_t a1)
{
  unsigned int v2 = (char *)malloc(0xD8uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 53) = 0;
    *(_OWORD *)(v2 + 196) = 0u;
    *(_OWORD *)(v2 + 180) = 0u;
    *(_OWORD *)(v2 + 164) = 0u;
    *(_OWORD *)(v2 + 148) = 0u;
    *(_OWORD *)(v2 + 1memset(&v9[1], 0, 32) = 0u;
    *(_OWORD *)(v2 + 116) = 0u;
    *(_OWORD *)(v2 + 100) = 0u;
    *(_OWORD *)(v2 + 84) = 0u;
    *(_OWORD *)(v2 + 68) = 0u;
    *(_OWORD *)(v2 + 52) = 0u;
    *(_OWORD *)(v2 + 36) = 0u;
    *(_OWORD *)(v2 + 20) = 0u;
    *(_OWORD *)(v2 + 4) = 0u;
    int v4 = socket(1, 2, 0);
    *(_DWORD *)uint64_t v3 = v4;
    if ((v4 & 0x80000000) == 0)
    {
      v3[5] = 1;
      ++dword_10003C408;
      pid_t v5 = getpid();
      char v6 = 1;
      while (bind(*(_DWORD *)v3, (const sockaddr *)(v3 + 4), 0x6Au) < 0)
      {
        if (*__error() == 48 && (v6 & 1) != 0)
        {
          unlink(v3 + 6);
          pid_t v7 = getpid();
          char v6 = 0;
        }

        goto LABEL_10;
      }

      v3[111] = 1;
      if ((unint64_t)sub_100016BA4(v3 + 112, a1, 104LL) < 0x68)
      {
        if ((connect(*(_DWORD *)v3, (const sockaddr *)(v3 + 110), 0x6Au) & 0x80000000) == 0) {
          return v3;
        }
        close(*(_DWORD *)v3);
        unlink(v3 + 6);
      }

      else
      {
LABEL_10:
        close(*(_DWORD *)v3);
      }
    }

    free(v3);
    return 0LL;
  }

  return v3;
}

void sub_10001B7F0(uint64_t a1)
{
}

ssize_t sub_10001B820( int *a1, const void *a2, size_t a3, _BYTE *a4, size_t *a5, void (*a6)(_BYTE *, void))
{
  if (send(*a1, a2, a3, 0) < 0) {
    return 0xFFFFFFFFLL;
  }
  while (1)
  {
    v16.tv_sec = 2LL;
    v16.__darwin_time_t tv_usec = 0;
    memset(&v15, 0, sizeof(v15));
    int v10 = *a1;
    if (__darwin_check_fd_set_overflow(*a1, &v15, 0)) {
      *(__int32_t *)((char *)v15.fds_bits + (((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v10;
    }
    select(*a1 + 1, &v15, 0LL, 0LL, &v16);
    int v11 = *a1;
    if (!__darwin_check_fd_set_overflow(*a1, &v15, 0)
      || ((*(unsigned int *)((char *)v15.fds_bits + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v11) & 1) == 0)
    {
      return 4294967294LL;
    }

    ssize_t result = recv(*a1, a4, *a5, 0);
    if ((result & 0x80000000) != 0) {
      return result;
    }
    if (!(_DWORD)result || *a4 != 60) {
      break;
    }
    if (a6)
    {
      else {
        unsigned int v13 = result;
      }
      a4[v13] = 0;
      a6(a4, v13);
    }
  }

  size_t v14 = result;
  ssize_t result = 0LL;
  *a5 = v14;
  return result;
}

ssize_t sub_10001B98C(int *a1)
{
  return sub_10001B994(a1, 1);
}

ssize_t sub_10001B994(int *a1, int a2)
{
  size_t v5 = 10LL;
  if (a2) {
    unsigned int v2 = "ATTACH";
  }
  else {
    unsigned int v2 = "DETACH";
  }
  ssize_t result = sub_10001B820(a1, v2, 6uLL, &v6, &v5, 0LL);
  if ((result & 0x80000000) == 0)
  {
    if (v5 == 3 && (v6 == 19279 ? (BOOL v4 = v7 == 10) : (BOOL v4 = 0), v4)) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

ssize_t sub_10001BA40(int *a1)
{
  return sub_10001B994(a1, 0);
}

ssize_t sub_10001BA48(int *a1, void *a2, size_t *a3)
{
  ssize_t result = recv(*a1, a2, *a3, 0);
  if ((result & 0x80000000) == 0)
  {
    size_t v5 = result;
    ssize_t result = 0LL;
    *a3 = v5;
  }

  return result;
}

uint64_t sub_10001BA84(int *a1)
{
  v6.tv_sec = 0LL;
  v6.__darwin_time_t tv_usec = 0;
  memset(&v5, 0, sizeof(v5));
  int v2 = *a1;
  if (__darwin_check_fd_set_overflow(*a1, &v5, 0)) {
    *(__int32_t *)((char *)v5.fds_bits + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v2;
  }
  select(*a1 + 1, &v5, 0LL, 0LL, &v6);
  int v3 = *a1;
  uint64_t result = __darwin_check_fd_set_overflow(v3, &v5, 0);
  if ((_DWORD)result) {
    return *(__int32_t *)((_BYTE *)v5.fds_bits + (((unint64_t)v3 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) & (1 << v3);
  }
  return result;
}

uint64_t sub_10001BB5C(unsigned int *a1)
{
  return *a1;
}

void sub_10001BB64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_WORD *)(a2 + 70) != 2 && (*(_BYTE *)(a2 + 25) & 4) == 0) {
    sub_10001BC1C(a1, a2, v10, v11, v12, v13, v14, v15);
  }
}

uint64_t sub_10001BC1C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = a2 + 16;
  sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  64LL,  1LL,  "MLME-DELETEKEYS.request(%02x:%02x:%02x:%02x:%02x:%02x)",  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
  uint64_t result = *(void *)(v8 + 152);
  if (result) {
    return sub_100009490(result, v9, v10, v11, v12, v13, v14, v15);
  }
  return result;
}

uint64_t sub_10001BC94( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10001BC1C(a1, a2, v10, v11, v12, v13, v14, v15);
}

void sub_10001BD04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a2 + 16;
  sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  64LL,  1LL,  "MLME-ASSOCIATE.indication(%02x:%02x:%02x:%02x:%02x:%02x)",  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
  if (*(_WORD *)(v10 + 54) != 2) {
    sub_10001BC1C(a1, a2, v11, v12, v13, v14, v15, v16);
  }
}

void sub_10001BD9C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = a2 + 16;
  sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  64LL,  1LL,  "MLME-REASSOCIATE.indication(%02x:%02x:%02x:%02x:%02x:%02x)",  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
  if (*(_WORD *)(v10 + 54) != 2) {
    sub_10001BC1C(a1, a2, v11, v12, v13, v14, v15, v16);
  }
}

uint64_t sub_10001BE34( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_10001BC1C(a1, a2, v10, v11, v12, v13, v14, v15);
}

void sub_10001BEA4( uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10001BEF4(int *a1, int *a2, int a3, uint64_t a4, uint64_t a5)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v10 = (char *)sub_100016B98(0x170uLL);
  uint64_t v17 = (uint64_t)v10;
  if (!v10)
  {
    sub_100016E40(1LL, "IEEE 802.1X state machine allocation failed", v11, v12, v13, v14, v15, v16, v51);
    return v17;
  }

  BOOL v18 = 0;
  char v19 = 0;
  *((_DWORD *)v10 + 60) = -1;
  int v20 = *a2;
  *((_WORD *)v10 + 110) = *((_WORD *)a2 + 2);
  *((_DWORD *)v10 + 54) = v20;
  *((_DWORD *)v10 + 56) = a3;
  *((void *)v10 + 44) = a1;
  *((void *)v10 + 45) = a5;
  *((_DWORD *)v10 + 9) = 0;
  *(void *)(v10 + 52) = 0x20000003CLL;
  *((void *)v10 + 13) = 0x1E00000006LL;
  *((_DWORD *)v10 + 33) = 0;
  int v21 = *a1;
  *((_DWORD *)v10 + 34) = *a1;
  v10[140] = v21 > 0;
  *((void *)v10 + 18) = 0LL;
  *((_DWORD *)v10 + 39) = 1;
  *((_DWORD *)v10 + 7) = 2;
  if (!a1[1])
  {
    BOOL v18 = *((void *)a1 + 26) || a1[2] >= 1;
    char v19 = 1;
  }

  v10[27] = v18;
  v10[32] = v19;
  memset(v53, 0, sizeof(v53));
  DWORD1(v53[0]) = a1[3];
  __int128 v51 = *((_OWORD *)a1 + 1);
  uint64_t v52 = *((void *)a1 + 4);
  *(_OWORD *)((char *)v53 + 8) = *(_OWORD *)(a1 + 14);
  uint64_t v22 = *((void *)a1 + 10);
  *((void *)&v53[1] + 1) = *((void *)a1 + 9);
  *(void *)&v53[2] = v22;
  *(_OWORD *)((char *)&v53[2] + 8) = *(_OWORD *)(a1 + 22);
  DWORD2(v53[3]) = a1[26];
  uint64_t v54 = *((void *)a1 + 14);
  uint64_t v55 = a4;
  uint64_t v56 = a2;
  int v23 = sub_10001E6B0((uint64_t)v10, (uint64_t)off_10003C018, (uint64_t *)&v51);
  *(void *)(v17 + 336) = v23;
  if (!v23)
  {
    sub_10001C0E8((void *)v17, v24, v25, v26, v27, v28, v29, v30);
    return 0LL;
  }

  *(void *)(v17 + 2memset(&v9[1], 0, 32) = sub_10001E8F8((uint64_t)v23);
  *(_BYTE *)(v17 + 344) = 1;
  *(_BYTE *)(v17 + 24) = 1;
  sub_10001C530(v17, v31, v32, v33, v34, v35, v36, v37);
  *(_BYTE *)(v17 + 24) = 0;
  sub_10001C530(v17, v38, v39, v40, v41, v42, v43, v44);
  *(_BYTE *)(v17 + 344) = 0;
  sub_100026438((uint64_t)sub_10001C144, 0LL, v17, v45, v46, v47, v48, v49);
  sub_100026220(1u, 0, (uint64_t)sub_10001C144, 0LL, v17);
  return v17;
}

void sub_10001C0E8( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100026438((uint64_t)sub_10001C144, 0LL, (uint64_t)a1, a4, a5, a6, a7, a8);
    sub_100026438((uint64_t)sub_10001C2B0, (uint64_t)a1, 0LL, v9, v10, v11, v12, v13);
    uint64_t v21 = a1[42];
    if (v21) {
      sub_10001E7C8(v21, v14, v15, v16, v17, v18, v19, v20);
    }
    free(a1);
  }

uint64_t sub_10001C144( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v10 = *(_DWORD *)a2 == 1;
  if (*(int *)a2 >= 1)
  {
    --*(_DWORD *)a2;
    if (v10) {
      sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x - aWhile --> 0",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 216));
    }
  }

  int v11 = *(_DWORD *)(a2 + 4);
  BOOL v12 = __OFSUB__(v11, 1);
  int v13 = v11 - 1;
  if (v13 < 0 == v12)
  {
    *(_DWORD *)(a2 + 4) = v13;
    if (!v13) {
      sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x - quietWhile --> 0",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 216));
    }
  }

  int v14 = *(_DWORD *)(a2 + 8);
  BOOL v12 = __OFSUB__(v14, 1);
  int v15 = v14 - 1;
  if (v15 < 0 == v12)
  {
    *(_DWORD *)(a2 + 8) = v15;
    if (!v15) {
      sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x - reAuthWhen --> 0",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 216));
    }
  }

  uint64_t v16 = *(void *)(a2 + 232);
  int v17 = *(_DWORD *)(v16 + 20);
  BOOL v12 = __OFSUB__(v17, 1);
  int v18 = v17 - 1;
  if (v18 < 0 == v12)
  {
    *(_DWORD *)(v16 + 20) = v18;
    if (!v18) {
      sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x - (EAP) retransWhile --> 0",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 216));
    }
  }

  sub_10001C530(a2, a2, a3, a4, a5, a6, a7, a8);
  return sub_100026220(1u, 0, (uint64_t)sub_10001C144, a1, a2);
}

uint64_t sub_10001C2B4(uint64_t a1)
{
  return sub_100026220(0, 0, (uint64_t)sub_10001C2B0, a1, 0LL);
}

uint64_t sub_10001C2D0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(void *)(a1 + 336) != a2) {
    return 0xFFFFFFFFLL;
  }
  sub_10001E894(a2, a2, a3, a4, a5, a6, a7, a8);
  sub_100026220(0, 0, (uint64_t)sub_10001C2B0, a1, 0LL);
  return 0LL;
}

char *sub_10001C334(uint64_t a1, _OWORD *a2)
{
  BOOL v4 = sub_100016B98(0xE0uLL);
  fd_set v5 = (char *)v4;
  if (v4)
  {
    v4[15] = *(void *)(a1 + 120);
    __int128 v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)BOOL v4 = *(_OWORD *)a1;
    *((_OWORD *)v4 + 1) = v6;
    v4[4] = *(void *)(a1 + 32);
    char v7 = v4 + 5;
    free((void *)v4[5]);
    if (*(void *)(a1 + 40))
    {
      size_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = malloc(v8);
      *char v7 = v9;
      if (!v9)
      {
LABEL_22:
        free(v5);
        return 0LL;
      }

      BOOL v10 = v9;
      memcpy(v9, *(const void **)(a1 + 40), v8);
      *((void *)v5 + 6) = v8;
    }

    else
    {
      BOOL v10 = 0LL;
      *char v7 = 0LL;
      *((void *)v5 + 6) = 0LL;
    }

    if (*(void *)(a1 + 56))
    {
      int v11 = malloc(0x10uLL);
      *((void *)v5 + 7) = v11;
      *int v11 = *(_OWORD *)*(void *)(a1 + 56);
    }

    else
    {
      *((void *)v5 + 7) = 0LL;
    }

    if (*(void *)(a1 + 64))
    {
      size_t v12 = *(void *)(a1 + 72);
      int v13 = malloc(v12);
      *((void *)v5 + 8) = v13;
      if (!v13)
      {
        int v14 = v10;
        goto LABEL_21;
      }

      int v14 = v13;
      memcpy(v13, *(const void **)(a1 + 64), v12);
      *((void *)v5 + 9) = v12;
    }

    else
    {
      int v14 = 0LL;
      *((void *)v5 + 8) = 0LL;
    }

    int v15 = *(const char **)(a1 + 80);
    if (v15)
    {
      uint64_t v16 = strdup(v15);
      *((void *)v5 + 10) = v16;
      if (!v16)
      {
        free(v10);
LABEL_21:
        free(v14);
        goto LABEL_22;
      }
    }

    else
    {
      *((void *)v5 + 10) = 0LL;
    }

    *(_OWORD *)(v5 + 88) = *(_OWORD *)(a1 + 88);
    *((_DWORD *)v5 + 26) = *(_DWORD *)(a1 + 104);
    *((void *)v5 + 14) = *(void *)(a1 + 112);
    *((_OWORD *)v5 + 8) = *a2;
    *((_OWORD *)v5 + 9) = a2[1];
    *((_OWORD *)v5 + 10) = a2[2];
    *((_OWORD *)v5 + 11) = a2[3];
    *((_OWORD *)v5 + 12) = a2[4];
  }

  return v5;
}

void sub_10001C4D0(void **a1)
{
  if (a1)
  {
    free(a1[5]);
    a1[5] = 0LL;
    free(a1[7]);
    a1[7] = 0LL;
    free(a1[8]);
    a1[8] = 0LL;
    free(a1[10]);
    a1[10] = 0LL;
    free(a1[26]);
    free(a1);
  }

uint64_t sub_10001C530( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = 100;
  uint64_t v10 = *(void *)(a1 + 352);
  int v65 = *(_DWORD *)(a1 + 216);
  uint64_t v64 = a1 + 216;
  __int16 v66 = *(_WORD *)(a1 + 220);
  while (1)
  {
    int v11 = *(_DWORD *)(a1 + 36);
    int v12 = *(_DWORD *)(a1 + 104);
    int v13 = *(_DWORD *)(a1 + 132);
    int v15 = *(_DWORD *)(a1 + 144);
    int v14 = *(_DWORD *)(a1 + 148);
    int v16 = *(_DWORD *)(a1 + 156);
    int v17 = *(_DWORD *)(a1 + 28);
    if (v17 == 2 && *(_DWORD *)(a1 + 44) != 2) {
      goto LABEL_5;
    }
    if (*(_BYTE *)(a1 + 24) || (uint64_t v34 = *(_BYTE **)(a1 + 232), !v34[16]))
    {
LABEL_5:
      if (v11)
      {
        *(_BYTE *)(a1 + 345) = 1;
        sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state INITIALIZE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
      }

      *(_DWORD *)(a1 + 36) = 0;
      *(_DWORD *)(a1 + 44) = 2;
    }

    else
    {
      if (v17 == 1)
      {
        if (*(_DWORD *)(a1 + 44) != 1)
        {
          uint64_t v37 = a1;
          int v38 = 1;
LABEL_103:
          sub_10001D174(v37, v38, a3, a4, a5, a6, a7, a8);
          goto LABEL_8;
        }
      }

      else if (v17 == 3 && *(_DWORD *)(a1 + 44) != 3)
      {
        uint64_t v35 = a1;
        int v36 = 1;
LABEL_82:
        sub_10001D0CC(v35, v36, a3, a4, a5, a6, a7, a8);
        goto LABEL_8;
      }

      switch(v11)
      {
        case 0:
          goto LABEL_121;
        case 1:
          goto LABEL_124;
        case 2:
          if (*(_BYTE *)(a1 + 40) || *(_DWORD *)(a1 + 48) > *(_DWORD *)(a1 + 56)) {
            goto LABEL_121;
          }
          if (!v34[36] && !v34[38] && !v34[39]) {
            break;
          }
          *(_BYTE *)(a1 + 345) = 1;
          sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state AUTHENTICATING",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
          *(_DWORD *)(a1 + 36) = 3;
          *(_BYTE *)(a1 + 41) = 0;
          *(_BYTE *)(a1 + 22) = 0;
          *(_BYTE *)(a1 + 13) = 0;
          *(_WORD *)(a1 + 20) = 1;
          goto LABEL_167;
        case 3:
          if (*(_BYTE *)(a1 + 22) && *(_BYTE *)(a1 + 32))
          {
            ++*(_DWORD *)(a1 + 72);
            *(_BYTE *)(a1 + 345) = 1;
            sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state AUTHENTICATED",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
            *(_DWORD *)(a1 + 36) = 4;
            *(_DWORD *)(a1 + 16) = 1;
            (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 352) + 176LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  1LL);
            *(_DWORD *)(a1 + 48) = 0;
            int v39 = *(_DWORD *)(a1 + 224);
            uint64_t v40 = " (PMKSA cache)";
            if ((v39 & 8) == 0) {
              uint64_t v40 = (const char *)&unk_10002C2E3;
            }
            if ((v39 & 1) != 0) {
              uint64_t v41 = " (pre-authentication)";
            }
            else {
              uint64_t v41 = v40;
            }
            uint64_t v58 = v41;
            uint64_t v61 = *(void *)(a1 + 352);
            int v57 = *(unsigned __int8 *)(a1 + 280);
            uint64_t v42 = (const char *)sub_1000210AC(0, v57);
            sub_10001D470(v61, v64, 1LL, "authenticated - EAP type: %d (%s)%s", v57, v42, v58);
            (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 352) + 144LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  1LL,  *(_DWORD *)(a1 + 224) & 1);
            break;
          }

          if (*(_BYTE *)(a1 + 13))
          {
            ++*(_DWORD *)(a1 + 80);
LABEL_144:
            *(_BYTE *)(a1 + 345) = 1;
            sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state HELD",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
            *(_DWORD *)(a1 + 36) = 6;
            *(_DWORD *)(a1 + 16) = 2;
            (*(void (**)(void, void, void))(*(void *)(a1 + 352) + 176LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL);
            *(_DWORD *)(a1 + 4) = *(_DWORD *)(a1 + 52);
            *(_BYTE *)(a1 + 40) = 0;
            int v59 = *(unsigned __int8 *)(a1 + 280);
            uint64_t v62 = *(void *)(a1 + 352);
            uint64_t v46 = (const char *)sub_1000210AC(0, v59);
            sub_10001D470(v62, v64, 2LL, "authentication failed - EAP type: %d (%s)", v59, v46);
            int v47 = *(unsigned __int8 *)(a1 + 281);
            if (*(unsigned __int8 *)(a1 + 280) != v47)
            {
              int v60 = *(unsigned __int8 *)(a1 + 281);
              uint64_t v63 = *(void *)(a1 + 352);
              uint64_t v48 = (const char *)sub_1000210AC(0, v47);
              sub_10001D470(v63, v64, 1LL, "Supplicant used different EAP type: %d (%s)", v60, v48);
            }

            (*(void (**)(void, void, void, void))(*(void *)(a1 + 352) + 144LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL,  *(_DWORD *)(a1 + 224) & 1);
            break;
          }

          if (*(_BYTE *)(a1 + 25) && !*(_BYTE *)(a1 + 32)) {
            goto LABEL_144;
          }
          int v50 = *(unsigned __int8 *)(a1 + 41);
          if (*(_BYTE *)(a1 + 41))
          {
            int v51 = *(unsigned __int8 *)(a1 + 21);
          }

          else
          {
            int v51 = *(unsigned __int8 *)(a1 + 21);
            if (!*(_BYTE *)(a1 + 40))
            {
              if (!*(_BYTE *)(a1 + 21)) {
                break;
              }
              goto LABEL_161;
            }
          }

          if (!v51) {
            goto LABEL_162;
          }
LABEL_161:
          ++*(_DWORD *)(a1 + 76);
LABEL_162:
          if (v50) {
            ++*(_DWORD *)(a1 + 84);
          }
          if (*(_BYTE *)(a1 + 40)) {
            ++*(_DWORD *)(a1 + 88);
          }
          *(_BYTE *)(a1 + 345) = 1;
          sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state ABORTING",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
          *(_DWORD *)(a1 + 36) = 5;
          *(_BYTE *)(a1 + 12) = 1;
LABEL_167:
          *(_WORD *)(a1 + 25) = 0;
          break;
        case 4:
          if (*(_BYTE *)(a1 + 41) || *(_BYTE *)(a1 + 33)) {
            goto LABEL_124;
          }
          if (*(_BYTE *)(a1 + 40)) {
            goto LABEL_121;
          }
          int v43 = *(unsigned __int8 *)(a1 + 32);
LABEL_120:
          if (!v43) {
LABEL_121:
          }
            sub_10001D21C(a1, a2, a3, a4, a5, a6, a7, a8);
          break;
        case 5:
          int v43 = *(unsigned __int8 *)(a1 + 12);
          if (*(_BYTE *)(a1 + 40)) {
            goto LABEL_120;
          }
          goto LABEL_123;
        case 6:
          int v43 = *(_DWORD *)(a1 + 4);
LABEL_123:
          if (!v43) {
LABEL_124:
          }
            sub_10001D314(a1, a2, a3, a4, a5, a6, a7, a8);
          break;
        case 7:
          if (!*(_BYTE *)(a1 + 41)) {
            break;
          }
          uint64_t v35 = a1;
          int v36 = 0;
          goto LABEL_82;
        case 8:
          if (!*(_BYTE *)(a1 + 41)) {
            break;
          }
          uint64_t v37 = a1;
          int v38 = 0;
          goto LABEL_103;
        case 9:
          if (!v34[24])
          {
            ++*(_DWORD *)(a1 + 60);
            *(_BYTE *)(a1 + 345) = 1;
            sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state CONNECTING",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
            *(_DWORD *)(a1 + 36) = 2;
            *(_BYTE *)(a1 + 33) = 0;
            ++*(_DWORD *)(a1 + 48);
          }

          break;
        default:
          break;
      }
    }

LABEL_43:
    if (!*(_BYTE *)(a1 + 344)
      && !(*(unsigned int (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65))
    {
      goto LABEL_50;
    }

    if (*(_BYTE *)(a1 + 24))
    {
      unsigned int v22 = *(_DWORD *)(a1 + 148);
LABEL_47:
      if (v22)
      {
        *(_BYTE *)(a1 + 345) = 1;
        sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x KEY_RX entering state NO_KEY_RECEIVE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
      }

      *(_DWORD *)(a1 + 148) = 0;
      goto LABEL_50;
    }

    unsigned int v22 = *(_DWORD *)(a1 + 148);
    if (!*(_BYTE *)(*(void *)(a1 + 232) + 16LL)) {
      goto LABEL_47;
    }
    if (v22 <= 1 && *(_BYTE *)(a1 + 152)) {
      sub_10001DA18(a1, a2, a3, a4, a5, a6, a7, a8);
    }
LABEL_50:
    if (*(_BYTE *)(a1 + 344)
      || (*(unsigned int (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65))
    {
      if (*(_BYTE *)(a1 + 24))
      {
        uint64_t v23 = a1;
        int v24 = 1;
LABEL_54:
        sub_10001DA80(v23, v24, a3, a4, a5, a6, a7, a8);
        goto LABEL_55;
      }

      int v33 = *(_DWORD *)(a1 + 156);
      if (v33 == 1)
      {
        if (*(_DWORD *)(a1 + 164) != *(_DWORD *)(a1 + 160)) {
          sub_10001DA80(a1, 0, a3, a4, a5, a6, a7, a8);
        }
        if (!*(_BYTE *)(*(void *)(a1 + 232) + 16LL) || !*(_BYTE *)(a1 + 168))
        {
          *(_BYTE *)(a1 + 345) = 1;
          sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x CTRL_DIR entering state FORCE_BOTH",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
          *(_DWORD *)(a1 + 156) = 0;
          *(_DWORD *)(a1 + 164) = 0;
        }
      }

      else if (!v33 && *(_BYTE *)(*(void *)(a1 + 232) + 16LL) && *(_BYTE *)(a1 + 168))
      {
        uint64_t v23 = a1;
        int v24 = 0;
        goto LABEL_54;
      }
    }

LABEL_55:
    if (v11 == *(_DWORD *)(a1 + 36)
      && v12 == *(_DWORD *)(a1 + 104)
      && v13 == *(_DWORD *)(a1 + 132)
      && v15 == *(_DWORD *)(a1 + 144)
      && v14 == *(_DWORD *)(a1 + 148)
      && v16 == *(_DWORD *)(a1 + 156))
    {
      break;
    }

    if (v9 < 2) {
      return sub_100026220(0, 0, (uint64_t)sub_10001C2B0, a1, 0LL);
    }
LABEL_67:
    --v9;
  }

  uint64_t v32 = *(void *)(a1 + 336);
  if (!v32) {
    goto LABEL_181;
  }
  if (sub_10001DD58(v32, v25, v26, v27, v28, v29, v30, v31))
  {
    if (v9 <= 1) {
      return sub_100026220(0, 0, (uint64_t)sub_10001C2B0, a1, 0LL);
    }
    goto LABEL_67;
  }

  uint64_t v53 = *(void *)(a1 + 232);
  if (!*(_BYTE *)(v53 + 112)) {
    goto LABEL_181;
  }
  *(_BYTE *)(v53 + 112) = 0;
  uint64_t v54 = *(void *)(v53 + 120);
  if (!v54) {
    return sub_100016E40(1LL, "EAPOL: aaaEapResp set, but no aaaEapRespData available", a3, a4, a5, a6, a7, a8, v56);
  }
  if (*(void *)(v54 + 16)) {
    uint64_t v55 = *(void *)(v54 + 16);
  }
  else {
    uint64_t v55 = v54 + 24;
  }
  (*(void (**)(void, void, uint64_t, void))(*(void *)(a1 + 352) + 136LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  v55,  *(void *)(v54 + 8));
LABEL_181:
  uint64_t result = (*(uint64_t (**)(void, int *))(v10 + 160))(*(void *)(v10 + 120), &v65);
  if ((_DWORD)result) {
    return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 352) + 200LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL);
  }
  return result;
}

uint64_t sub_10001D0CC( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || *(_DWORD *)(a1 + 36) != 7)
  {
    *(_BYTE *)(a1 + 345) = 1;
    sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state FORCE_AUTH",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  }

  *(_DWORD *)(a1 + 36) = 7;
  *(_DWORD *)(a1 + 16) = 1;
  (*(void (**)(void, void, uint64_t))(*(void *)(a1 + 352) + 176LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  1LL);
  *(_DWORD *)(a1 + 44) = 3;
  *(_BYTE *)(a1 + 41) = 0;
  return sub_10001D3CC(a1, 1);
}

uint64_t sub_10001D174( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || *(_DWORD *)(a1 + 36) != 8)
  {
    *(_BYTE *)(a1 + 345) = 1;
    sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state FORCE_UNAUTH",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  }

  *(_DWORD *)(a1 + 36) = 8;
  *(_DWORD *)(a1 + 16) = 2;
  (*(void (**)(void, void, void))(*(void *)(a1 + 352) + 176LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL);
  *(_DWORD *)(a1 + 44) = 1;
  *(_BYTE *)(a1 + 41) = 0;
  return sub_10001D3CC(a1, 0);
}

uint64_t sub_10001D21C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = *(_DWORD *)(a1 + 36);
  if (*(_BYTE *)(a1 + 40))
  {
    if (v9 == 4)
    {
      ++*(_DWORD *)(a1 + 100);
    }

    else if (v9 == 2)
    {
      ++*(_DWORD *)(a1 + 64);
    }
  }

  *(_BYTE *)(a1 + 345) = 1;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state DISCONNECTED",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 36) = 1;
  *(_DWORD *)(a1 + 16) = 2;
  uint64_t result = (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 352) + 176LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL);
  *(_DWORD *)(a1 + 48) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  if (v9) {
    return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 352) + 144LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL,  *(_DWORD *)(a1 + 224) & 1);
  }
  return result;
}

uint64_t sub_10001D314( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)(a1 + 36) == 4)
  {
    if (*(_BYTE *)(a1 + 33)) {
      ++*(_DWORD *)(a1 + 92);
    }
    if (*(_BYTE *)(a1 + 41)) {
      ++*(_DWORD *)(a1 + 96);
    }
    if (*(_BYTE *)(a1 + 40)) {
      ++*(_DWORD *)(a1 + 100);
    }
  }

  *(_BYTE *)(a1 + 345) = 1;
  uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_PAE entering state RESTART",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 36) = 9;
  *(_BYTE *)(*(void *)(a1 + 232) + 24LL) = 1;
  return result;
}

uint64_t sub_10001D3CC(uint64_t a1, int a2)
{
  if (a2) {
    char v3 = 3;
  }
  else {
    char v3 = 4;
  }
  v8[0] = v3;
  unsigned __int8 v4 = *(_BYTE *)(a1 + 256) + 1;
  *(_BYTE *)(a1 + 256) = v4;
  v8[1] = v4;
  __int16 v9 = 1024;
  uint64_t v5 = *(void *)(a1 + 352);
  __int128 v6 = "SUCCESS";
  if (!a2) {
    __int128 v6 = "FAILURE";
  }
  sub_10001D470(v5, a1 + 216, 0LL, "Sending canned EAP packet %s (identifier %d)", v6, v4);
  uint64_t result = (*(uint64_t (**)(void, void, void, _BYTE *, uint64_t))(*(void *)(a1 + 352) + 128LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360),  0LL,  v8,  4LL);
  ++*(_DWORD *)(a1 + 176);
  return result;
}

void sub_10001D470(uint64_t a1, uint64_t a2, uint64_t a3, char *__s, ...)
{
  if (*(void *)(a1 + 168))
  {
    size_t v8 = (int)(strlen(__s) + 100);
    __int16 v9 = (char *)malloc(v8);
    if (v9)
    {
      uint64_t v10 = v9;
      vsnprintf(v9, v8, __s, va);
      int v11 = *(void (**)(void, uint64_t, uint64_t, char *))(a1 + 168);
      if (v11) {
        v11(*(void *)(a1 + 120), a2, a3, v10);
      }
      free(v10);
    }
  }

uint64_t sub_10001D514( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state IDLE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 5;
  *(_BYTE *)(a1 + 20) = 0;
  return result;
}

uint64_t sub_10001D580( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state RESPONSE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 1;
  *(_BYTE *)(a1 + 21) = 0;
  *(_BYTE *)(a1 + 23) = 0;
  uint64_t v10 = *(_BYTE **)(a1 + 232);
  v10[37] = 0;
  int v11 = *(_DWORD *)(a1 + 112);
  *(_DWORD *)a1 = *(_DWORD *)(a1 + 108);
  _BYTE *v10 = 1;
  *(_DWORD *)(a1 + 112) = v11 + 1;
  return result;
}

uint64_t sub_10001D608( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state REQUEST",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 0;
  uint64_t result = sub_10001D7E4(a1, v9, v10, v11, v12, v13, v14, v15);
  *(_BYTE *)(*(void *)(a1 + 232) + 36LL) = 0;
  ++*(_DWORD *)(a1 + 120);
  *(_BYTE *)(a1 + 23) = 0;
  return result;
}

uint64_t sub_10001D68C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state TIMEOUT",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 4;
  *(_BYTE *)(a1 + 21) = 1;
  return result;
}

uint64_t sub_10001D6F8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state FAIL",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 3;
  uint64_t result = sub_10001D7E4(a1, v9, v10, v11, v12, v13, v14, v15);
  *(_BYTE *)(a1 + 13) = 1;
  return result;
}

uint64_t sub_10001D76C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x BE_AUTH entering state SUCCESS",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 104) = 2;
  uint64_t result = sub_10001D7E4(a1, v9, v10, v11, v12, v13, v14, v15);
  *(_BYTE *)(a1 + 22) = 1;
  *(_BYTE *)(a1 + 26) = 1;
  return result;
}

uint64_t sub_10001D7E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = *(void *)(*(void *)(a1 + 232) + 48LL);
  if (result && *(void *)(result + 8) > 3uLL)
  {
    if ((*(_BYTE *)(a1 + 224) & 2) != 0)
    {
      return sub_100016E40( 1LL,  "EAPOL: Drop EAPOL TX to %02x:%02x:%02x:%02x:%02x:%02x while waiting for EAPOL-Start",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
    }

    else
    {
      int v12 = sub_100010128(result);
      *(_BYTE *)(a1 + 256) = v12;
      sub_10001D470(*(void *)(a1 + 352), a1 + 216, 0LL, "Sending EAP Packet (identifier %d)", v12);
      uint64_t v13 = *(void *)(a1 + 352);
      uint64_t v14 = *(void *)(v13 + 120);
      uint64_t v15 = *(void (**)(uint64_t, void, void, uint64_t, void))(v13 + 128);
      uint64_t v16 = *(void *)(*(void *)(a1 + 232) + 48LL);
      if (*(void *)(v16 + 16)) {
        uint64_t v17 = *(void *)(v16 + 16);
      }
      else {
        uint64_t v17 = v16 + 24;
      }
      v15(v14, *(void *)(a1 + 360), 0LL, v17, *(void *)(v16 + 8));
      ++*(_DWORD *)(a1 + 176);
      uint64_t result = sub_100010154(*(void *)(*(void *)(a1 + 232) + 48LL));
      if ((_DWORD)result == 1) {
        ++*(_DWORD *)(a1 + 196);
      }
      else {
        ++*(_DWORD *)(a1 + 200);
      }
    }
  }

  else
  {
    uint64_t v10 = *(void *)(a1 + 352);
    uint64_t v11 = *(uint64_t (**)(void, uint64_t, void, const char *))(v10 + 168);
    if (v11) {
      return v11( *(void *)(v10 + 120),  a1 + 216,  0LL,  "TxReq called, but there is no EAP request from authentication server");
    }
  }

  return result;
}

uint64_t sub_10001D920( uint64_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = (_DWORD *)result;
  if (!a2 || *(_DWORD *)(result + 132))
  {
    *(_BYTE *)(result + 345) = 1;
    uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x REAUTH_TIMER entering state INITIALIZE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(result + 216));
  }

  v8[33] = 0;
  _BYTE v8[2] = v8[34];
  return result;
}

uint64_t sub_10001D998( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x AUTH_KEY_TX entering state KEY_TRANSMIT",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 144) = 1;
  uint64_t result = (*(uint64_t (**)(void, void))(*(void *)(a1 + 352) + 192LL))( *(void *)(*(void *)(a1 + 352) + 120LL),  *(void *)(a1 + 360));
  *(_BYTE *)(*(void *)(a1 + 232) + 72LL) = 0;
  *(_BYTE *)(a1 + 25) = 1;
  return result;
}

uint64_t sub_10001DA18( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 345) = 1;
  uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x KEY_RX entering state KEY_RECEIVE",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 216));
  *(_DWORD *)(a1 + 148) = 1;
  *(_BYTE *)(a1 + 152) = 0;
  return result;
}

uint64_t sub_10001DA80( uint64_t result, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8 = (_DWORD *)result;
  if (!a2 || *(_DWORD *)(result + 156) != 1)
  {
    *(_BYTE *)(result + 345) = 1;
    uint64_t result = sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x CTRL_DIR entering state IN_OR_BOTH",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(result + 216));
  }

  v8[39] = 1;
  v8[41] = v8[40];
  return result;
}

uint64_t sub_10001DB00(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 352) + 152LL))(*(void *)(*(void *)(a1 + 352) + 120LL));
}

uint64_t sub_10001DB10(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 352);
  uint64_t result = *(void *)(v2 + 40);
  *a2 = *(void *)(v2 + 48);
  return result;
}

uint64_t sub_10001DB20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v5 = *(void **)(a1 + 232);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  if (!*v5) {
    return 0xFFFFFFFFLL;
  }
  sub_10001DBD4(*(void ***)(a1 + 272));
  *(void *)(a1 + 272) = 0LL;
  uint64_t v9 = (void **)sub_100016B98(0x60uLL);
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = v9;
  uint64_t result = (**(uint64_t (***)(void, uint64_t, uint64_t, uint64_t, void *))(a1 + 232))( *(void *)(a1 + 216),  a2,  a3,  a4,  v9);
  if ((_DWORD)result)
  {
    free(v10[8]);
    free(v10);
    return 0xFFFFFFFFLL;
  }

  *(void *)(a1 + 272) = v10;
  *(_DWORD *)(a1 + 280) = 0;
  return result;
}

void sub_10001DBD4(void **a1)
{
  if (a1)
  {
    free(a1[8]);
    free(a1);
  }

uint64_t sub_10001DC04( uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(result + 272))
  {
    uint64_t v10 = result;
    sub_100016E40( 0LL,  "EAP: processing NAK (current EAP method index %d)",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned int *)(result + 280));
    sub_100016EB0(0LL, "EAP: configured methods", *(unsigned __int8 **)(v10 + 272), 64LL);
    sub_100016EB0(0LL, "EAP: list of methods supported by the peer", a2, a3);
    uint64_t v11 = *(int *)(v10 + 280);
    if ((int)v11 >= 8)
    {
      uint64_t v12 = *(void *)(v10 + 272);
    }

    else
    {
      uint64_t v12 = *(void *)(v10 + 272);
      BOOL v13 = 1;
      do
      {
        uint64_t v14 = v11 + 1;
        while (1)
        {
          uint64_t v15 = (_DWORD *)(v12 + 8 * v11);
          if (!*v15)
          {
            int v16 = v15[1];
            if (!v16) {
              return sub_100016EB0(0LL, "EAP: new list of configured methods", (unsigned __int8 *)v12, 64LL);
            }
            uint64_t v17 = a2;
            uint64_t v18 = a3;
            if (a3) {
              break;
            }
          }

uint64_t sub_10001DD58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = 0LL;
  uint64_t v10 = (void ***)(a1 + 56);
  uint64_t v11 = (void **)(a1 + 64);
  do
  {
    uint64_t v12 = v9;
    *(_BYTE *)(a1 + 208) = 0;
    if (*(_BYTE *)(a1 + 32))
    {
      if (!*(_BYTE *)(a1 + 24)) {
        goto LABEL_11;
      }
      uint64_t v13 = a1;
      int v14 = 1;
LABEL_5:
      sub_10001E900(v13, v14, a3, a4, a5, a6, a7, a8);
    }

    else
    {
      if (!*(_BYTE *)(a1 + 24))
      {
LABEL_11:
        if (*(_DWORD *)a1)
        {
          *(_BYTE *)(a1 + 208) = 1;
          sub_100016E40(1LL, "EAP: EAP entering state DISABLED", a3, a4, a5, a6, a7, a8, v100);
        }

        *(_DWORD *)a1 = 0;
        *(_DWORD *)(a1 + 312) = 0;
        goto LABEL_14;
      }

      int v15 = *(_DWORD *)(a1 + 312);
      if (v15 < 51)
      {
        switch(*(_DWORD *)a1)
        {
          case 0:
            uint64_t v13 = a1;
            int v14 = 0;
            goto LABEL_5;
          case 1:
            if (!*(_BYTE *)(a1 + 304) || !*(_BYTE *)(a1 + 172)) {
              goto LABEL_61;
            }
            int v18 = *(_DWORD *)(a1 + 180);
            if (v18 == 3 || v18 == 254 && !*(_DWORD *)(a1 + 184) && *(_DWORD *)(a1 + 188) == 3) {
              goto LABEL_104;
            }
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state PICK_UP_METHOD", a3, a4, a5, a6, a7, a8, v100);
            *(_DWORD *)a1 = 16;
            if (*(_DWORD *)(a1 + 180) != 1)
            {
              uint64_t v91 = *(unsigned int *)(a1 + 144);
              goto LABEL_132;
            }

            int v24 = 1;
            *(_DWORD *)(a1 + 144) = 1;
            uint64_t v25 = *(void *)(a1 + 200);
            if (v25)
            {
              if (*(void *)(a1 + 240))
              {
                (*(void (**)(uint64_t))(v25 + 32))(a1);
                *(void *)(a1 + 240) = 0LL;
                int v24 = *(_DWORD *)(a1 + 144);
              }

              else
              {
                int v24 = 1;
              }
            }

            uint64_t v92 = sub_100020EDC(0, v24);
            *(void *)(a1 + 200) = v92;
            if (!v92) {
              goto LABEL_131;
            }
            v93 = *(uint64_t (**)(uint64_t))(v92 + 24);
            if (!v93) {
              goto LABEL_131;
            }
            uint64_t v94 = v93(a1);
            *(void *)(a1 + 240) = v94;
            uint64_t v91 = *(unsigned int *)(a1 + 144);
            if (!v94)
            {
              sub_100016E40( 1LL,  "EAP: Failed to initialize EAP method %d",  v95,  v19,  v20,  v21,  v22,  v23,  *(unsigned int *)(a1 + 144));
LABEL_131:
              uint64_t v91 = 0LL;
              *(void *)(a1 + 200) = 0LL;
              *(_DWORD *)(a1 + 144) = 0;
            }

LABEL_132:
            sub_100017140( *(void *)(a1 + 224),  2LL,  "CTRL-EVENT-EAP-PROPOSED-METHOD method=%u",  v19,  v20,  v21,  v22,  v23,  v91);
            break;
          case 2:
            if (!*(_DWORD *)(a1 + 28))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state RETRANSMIT", a3, a4, a5, a6, a7, a8, v100);
              int v58 = 12;
              goto LABEL_85;
            }

            if (*(_BYTE *)(a1 + 8))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state RECEIVED", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 3;
              sub_10001F230(a1, *(void *)(a1 + 16), v26, v27, v28, v29, v30, v31);
              ++*(_DWORD *)(a1 + 312);
            }

            break;
          case 3:
            int v32 = *(_DWORD *)(a1 + 180);
            if (!*(_BYTE *)(a1 + 172) || *(_DWORD *)(a1 + 176) != *(_DWORD *)(a1 + 148)) {
              goto LABEL_107;
            }
            if ((v32 == 3 || v32 == 254 && !*(_DWORD *)(a1 + 184) && *(_DWORD *)(a1 + 188) == 3)
              && !*(_DWORD *)(a1 + 152))
            {
LABEL_104:
              sub_10001ED3C(a1, a2, a3, a4, a5, a6, a7, a8);
              break;
            }

            int v33 = *(_DWORD *)(a1 + 144);
            if (v32 == v33 || v32 == 254 && !*(_DWORD *)(a1 + 184) && *(_DWORD *)(a1 + 188) == v33)
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state INTEGRITY_CHECK", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 4;
              uint64_t v34 = *(uint64_t (**)(uint64_t, void, void))(*(void *)(a1 + 200) + 56LL);
              if (v34) {
                *(_BYTE *)(a1 + 192) = v34(a1, *(void *)(a1 + 240), *(void *)(a1 + 16));
              }
              break;
            }

LABEL_107:
            sub_100016E40( 1LL,  "EAP: RECEIVED->DISCARD: rxResp=%d respId=%d currentId=%d respMethod=%d currentMethod=%d",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a1 + 172));
LABEL_108:
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state DISCARD", a3, a4, a5, a6, a7, a8, v100);
            int v57 = 10;
            goto LABEL_109;
          case 4:
            if (!*(_BYTE *)(a1 + 192)) {
              goto LABEL_111;
            }
            goto LABEL_108;
          case 5:
            if (*(_DWORD *)(a1 + 152) == 2) {
              goto LABEL_61;
            }
            int v35 = *(_DWORD *)(a1 + 316);
            if (v35 == 2)
            {
              sub_100016E40( 1LL,  "EAP: Method has completed pending processing - reprocess pending EAP message",  a3,  a4,  a5,  a6,  a7,  a8,  v100);
              *(_DWORD *)(a1 + 316) = 0;
LABEL_111:
              sub_10001EDF8(a1, a2, a3, a4, a5, a6, a7, a8);
            }

            else
            {
              if (v35 != 1) {
                goto LABEL_80;
              }
              sub_100016E40( 1LL,  "EAP: Method has pending processing - wait before proceeding to METHOD_REQUEST state",  a3,  a4,  a5,  a6,  a7,  a8,  v100);
            }

            break;
          case 6:
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state SEND_REQUEST", a3, a4, a5, a6, a7, a8, v100);
            *(_DWORD *)a1 = 9;
            *(_DWORD *)(a1 + 156) = 0;
            uint64_t v42 = *(void *)(a1 + 56);
            if (v42) {
              goto LABEL_74;
            }
            int v43 = "EAP: SEND_REQUEST - no eapReqData";
            goto LABEL_90;
          case 7:
            int v44 = *(_DWORD *)(a1 + 316);
            if (v44 == 2)
            {
              sub_100016E40( 1LL,  "EAP: Method has completed pending processing - reprocess pending EAP message",  a3,  a4,  a5,  a6,  a7,  a8,  v100);
              *(_DWORD *)(a1 + 316) = 0;
              goto LABEL_97;
            }

            if (v44 == 1)
            {
              sub_100016E40( 1LL,  "EAP: Method has pending processing - wait before proceeding to METHOD_REQUEST state",  a3,  a4,  a5,  a6,  a7,  a8,  v100);
              int v45 = *(_DWORD *)(a1 + 280);
              BOOL v46 = __OFSUB__(v45, 1);
              int v47 = v45 - 1;
              if (v47 < 0 == v46) {
                *(_DWORD *)(a1 + 280) = v47;
              }
            }

            else
            {
LABEL_80:
              sub_10001EEEC(a1, a2, a3, a4, a5, a6, a7, a8, v100);
            }

            break;
          case 8:
            int v48 = *(_DWORD *)(a1 + 196);
            switch(v48)
            {
              case 0:
                v102 = v10;
                int8x16_t v67 = v11;
                *(_BYTE *)(a1 + 208) = 1;
                sub_100016E40(1LL, "EAP: EAP entering state SUCCESS", a3, a4, a5, a6, a7, a8, v100);
                *(_DWORD *)a1 = 13;
                sub_10001757C(*(void ***)(a1 + 56));
                unsigned __int8 v68 = *(_BYTE *)(a1 + 148);
                sub_100016E40(1LL, "EAP: Building EAP-Success (id=%d)", v69, v70, v71, v72, v73, v74, v68);
                uint64_t v75 = sub_100017458(4LL);
                uint64_t v82 = v75;
                if (v75)
                {
                  uint64_t v83 = sub_1000175AC(v75, 4LL, v76, v77, v78, v79, v80, v81);
                  *uint64_t v83 = 3;
                  v83[1] = v68;
                  *((_WORD *)v83 + 1) = 1024;
                }

                *(void *)(a1 + 56) = v82;
                sub_10001757C(*(void ***)(a1 + 160));
                *(void *)(a1 + 160) = 0LL;
                uint64_t v11 = v67;
                if (*(void *)(a1 + 64)) {
                  *(_BYTE *)(a1 + 80) = 1;
                }
                *(_BYTE *)(a1 + 46) = 1;
                sub_100017140( *(void *)(a1 + 224),  2LL,  "CTRL-EVENT-EAP-SUCCESS %02x:%02x:%02x:%02x:%02x:%02x",  v84,  v85,  v86,  v87,  v88,  *(unsigned __int8 *)(a1 + 409));
                goto LABEL_125;
              case 3:
                *(_BYTE *)(a1 + 208) = 1;
                sub_100016E40(1LL, "EAP: EAP entering state INITIALIZE_PASSTHROUGH", a3, a4, a5, a6, a7, a8, v100);
                *(_DWORD *)a1 = 17;
                sub_10001757C(*(void ***)(a1 + 128));
                *(void *)(a1 + 128) = 0LL;
                break;
              case 1:
                uint64_t v16 = a1;
                int v17 = 0;
                goto LABEL_10;
              default:
LABEL_97:
                sub_10001EFE0(a1, a2, a3, a4, a5, a6, a7, a8);
                break;
            }

            break;
          case 9:
          case 0xA:
            goto LABEL_17;
          case 0xB:
            goto LABEL_61;
          case 0xC:
            if (*(_DWORD *)(a1 + 156) <= *(_DWORD *)(a1 + 4))
            {
LABEL_17:
              sub_10001EEA0(a1, a2, a3, a4, a5, a6, a7, a8);
              break;
            }

            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state TIMEOUT_FAILURE", a3, a4, a5, a6, a7, a8, v100);
            int v49 = 15;
            goto LABEL_68;
          case 0x10:
            if (*(_DWORD *)(a1 + 144)) {
              goto LABEL_111;
            }
LABEL_61:
            sub_10001EB08(a1, a2, a3, a4, a5, a6, a7, a8);
            break;
          case 0x11:
            if (*(_DWORD *)(a1 + 148) == -1) {
              goto LABEL_63;
            }
            goto LABEL_72;
          case 0x12:
            if (*(_BYTE *)(a1 + 8))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state RECEIVED2", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 20;
              sub_10001F230(a1, *(void *)(a1 + 16), v50, v51, v52, v53, v54, v55);
              break;
            }

            if (*(_DWORD *)(a1 + 28)) {
              break;
            }
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state RETRANSMIT2", a3, a4, a5, a6, a7, a8, v100);
            int v58 = 19;
LABEL_85:
            *(_DWORD *)a1 = v58;
            int v59 = *(_DWORD *)(a1 + 156);
            *(_DWORD *)(a1 + 156) = v59 + 1;
            if (v59 >= *(_DWORD *)(a1 + 4)) {
              break;
            }
            uint64_t v60 = *(void *)(a1 + 160);
            if (!v60) {
              break;
            }
            sub_10001757C(*v10);
            uint64_t v61 = sub_100017514(v60);
            _BYTE *v10 = (void **)v61;
            if (!v61) {
              break;
            }
            goto LABEL_75;
          case 0x13:
            if (*(_DWORD *)(a1 + 156) > *(_DWORD *)(a1 + 4)) {
              goto LABEL_67;
            }
            goto LABEL_69;
          case 0x14:
            if (*(_BYTE *)(a1 + 172) && *(_DWORD *)(a1 + 176) == *(_DWORD *)(a1 + 148))
            {
LABEL_72:
              sub_10001F174(a1, a2, a3, a4, a5, a6, a7, a8, v100);
            }

            else
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state DISCARD2", a3, a4, a5, a6, a7, a8, v100);
              int v57 = 21;
LABEL_109:
              *(_DWORD *)a1 = v57;
              *(_BYTE *)(a1 + 8) = 0;
              *(_BYTE *)(a1 + 45) = 1;
            }

            break;
          case 0x15:
          case 0x16:
LABEL_69:
            sub_10001F1E4(a1, a2, a3, a4, a5, a6, a7, a8);
            break;
          case 0x17:
LABEL_63:
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state AAA_IDLE", a3, a4, a5, a6, a7, a8, v100);
            *(_DWORD *)a1 = 25;
            *(_DWORD *)(a1 + 81) = 0;
            *(_BYTE *)(a1 + 120) = 1;
            break;
          case 0x18:
            *(_BYTE *)(a1 + 208) = 1;
            sub_100016E40(1LL, "EAP: EAP entering state SEND_REQUEST2", a3, a4, a5, a6, a7, a8, v100);
            *(_DWORD *)a1 = 22;
            *(_DWORD *)(a1 + 156) = 0;
            uint64_t v42 = *(void *)(a1 + 56);
            if (v42)
            {
LABEL_74:
              sub_10001757C(*(void ***)(a1 + 160));
              uint64_t v56 = sub_100017514(v42);
              *(void *)(a1 + 160) = v56;
              *(_BYTE *)(a1 + 8) = 0;
              if (v56) {
LABEL_75:
              }
                *(_BYTE *)(a1 + 44) = 1;
              else {
                *(_BYTE *)(a1 + 44) = 0;
              }
            }

            else
            {
              int v43 = "EAP: SEND_REQUEST2 - no eapReqData";
LABEL_90:
              sub_100016E40(2LL, v43, v36, v37, v38, v39, v40, v41, v100);
              *(_BYTE *)(a1 + 8) = 0;
              *(_WORD *)(a1 + 44) = 256;
            }

            break;
          case 0x19:
            if (*(_BYTE *)(a1 + 84))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state FAILURE2", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 27;
              sub_10001F3C4((unint64_t *)v10, *(void *)(a1 + 88));
              *(_BYTE *)(a1 + 47) = 1;
            }

            else if (*(_BYTE *)(a1 + 83))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state SUCCESS2", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 28;
              sub_10001F3C4((unint64_t *)v10, *(void *)(a1 + 88));
              int v62 = *(unsigned __int8 *)(a1 + 112);
              *(_BYTE *)(a1 + 80) = v62;
              v102 = v10;
              if (v62)
              {
                uint64_t v63 = v11;
                if (*(void *)(a1 + 96))
                {
                  v101 = *(const void **)(a1 + 96);
                  size_t v64 = *(void *)(a1 + 104);
                  free(*v63);
                  int v65 = malloc(v64);
                  *uint64_t v63 = v65;
                  if (v65)
                  {
                    size_t v66 = v64;
                    memcpy(v65, v101, v64);
                  }

                  else
                  {
                    size_t v66 = 0LL;
                  }

                  *(void *)(a1 + 72) = v66;
                }
              }

              else
              {
                free(*v11);
                *uint64_t v11 = 0LL;
                v11[1] = 0LL;
                uint64_t v63 = v11;
              }

              *(_BYTE *)(a1 + 46) = 1;
              *(_BYTE *)(a1 + 408) = 1;
              uint64_t v11 = v63;
LABEL_125:
              uint64_t v10 = v102;
            }

            else if (*(_BYTE *)(a1 + 81))
            {
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state AAA_RESPONSE", a3, a4, a5, a6, a7, a8, v100);
              *(_DWORD *)a1 = 24;
              sub_10001F3C4((unint64_t *)v10, *(void *)(a1 + 88));
              uint64_t v89 = *(void *)(a1 + 56);
              if (v89 && *(void *)(v89 + 8) >= 4uLL)
              {
                uint64_t v96 = *(void *)(v89 + 16);
                uint64_t v97 = v89 + 24;
                if (v96) {
                  uint64_t v98 = v96;
                }
                else {
                  uint64_t v98 = v97;
                }
                sub_100016E40(1LL, "EAP: getId: id=%d", a3, a4, a5, a6, a7, a8, *(unsigned __int8 *)(v98 + 1));
                int v90 = *(unsigned __int8 *)(v98 + 1);
              }

              else
              {
                int v90 = -1;
              }

              *(_DWORD *)(a1 + 148) = v90;
              *(_DWORD *)(a1 + 168) = *(_DWORD *)(a1 + 116);
            }

            else if (*(_BYTE *)(a1 + 136))
            {
LABEL_67:
              *(_BYTE *)(a1 + 208) = 1;
              sub_100016E40(1LL, "EAP: EAP entering state TIMEOUT_FAILURE2", a3, a4, a5, a6, a7, a8, v100);
              int v49 = 26;
LABEL_68:
              *(_DWORD *)a1 = v49;
              *(_BYTE *)(a1 + 48) = 1;
            }

            break;
          default:
            break;
        }
      }

      else if (v15 == 51)
      {
        sub_100016E40(1LL, "EAP: more than %d authentication rounds - abort", a3, a4, a5, a6, a7, a8, 50LL);
        ++*(_DWORD *)(a1 + 312);
        uint64_t v16 = a1;
        int v17 = 1;
LABEL_10:
        sub_10001EA04(v16, v17, a3, a4, a5, a6, a7, a8);
      }
    }

LABEL_14:
    uint64_t v9 = 1LL;
  }

  while (*(_BYTE *)(a1 + 208));
  return v12;
}

void *sub_10001E6B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __int128 v6 = sub_100016B98(0x1A0uLL);
  uint64_t v13 = v6;
  if (v6)
  {
    v6[29] = a2;
    *((_DWORD *)v6 + 1) = 5;
    uint64_t v14 = *a3;
    uint64_t v15 = a3[1];
    v6[27] = a1;
    v6[28] = v15;
    uint64_t v16 = a3[2];
    v6[36] = v14;
    v6[37] = v16;
    *((_BYTE *)v6 + 304) = *((_BYTE *)a3 + 24);
    *((_DWORD *)v6 + 77) = *((_DWORD *)a3 + 7);
    int v17 = (_OWORD *)a3[4];
    if (v17)
    {
      int v18 = malloc(0x10uLL);
      v13[42] = v18;
      if (v18) {
        *int v18 = *v17;
      }
    }

    uint64_t v19 = (const void *)a3[5];
    if (v19)
    {
      size_t v20 = a3[6];
      uint64_t v21 = malloc(v20);
      v13[43] = v21;
      if (v21)
      {
        memcpy(v21, v19, v20);
        v13[44] = v20;
      }
    }

    uint64_t v22 = (const char *)a3[7];
    if (v22) {
      v13[45] = strdup(v22);
    }
    *((_OWORD *)v13 + 23) = *((_OWORD *)a3 + 4);
    *((_DWORD *)v13 + 96) = *((_DWORD *)a3 + 20);
    uint64_t v23 = a3[12];
    v13[49] = a3[11];
    if (v23) {
      v13[50] = sub_100017514(v23);
    }
    int v24 = (int *)a3[13];
    if (v24)
    {
      int v25 = *v24;
      *(_WORD *)((char *)v13 + 413) = *((_WORD *)v24 + 2);
      *(_DWORD *)((char *)v13 + 409) = v25;
    }

    sub_100016E40(1LL, "EAP: Server state machine created", v7, v8, v9, v10, v11, v12, v27);
  }

  return v13;
}

void sub_10001E7C8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100016E40(1LL, "EAP: Server state machine removed", a3, a4, a5, a6, a7, a8, v10);
    uint64_t v9 = *(void *)(a1 + 200);
    if (v9)
    {
      if (*(void *)(a1 + 240)) {
        (*(void (**)(uint64_t))(v9 + 32))(a1);
      }
    }

    sub_10001757C(*(void ***)(a1 + 56));
    free(*(void **)(a1 + 64));
    sub_10001757C(*(void ***)(a1 + 160));
    sub_10001757C(*(void ***)(a1 + 16));
    free(*(void **)(a1 + 248));
    free(*(void **)(a1 + 336));
    free(*(void **)(a1 + 344));
    free(*(void **)(a1 + 360));
    sub_10001757C(*(void ***)(a1 + 88));
    sub_10001757C(*(void ***)(a1 + 128));
    free(*(void **)(a1 + 96));
    sub_10001DBD4(*(void ***)(a1 + 272));
    sub_10001757C(*(void ***)(a1 + 400));
    free((void *)a1);
  }

_DWORD *sub_10001E884(_DWORD *result)
{
  if (result) {
    *uint64_t result = 13;
  }
  return result;
}

uint64_t sub_10001E894( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    uint64_t v8 = result;
    uint64_t result = sub_100016E40(1LL, "EAP: Callback for pending request received", a3, a4, a5, a6, a7, a8, v9);
    if (*(_DWORD *)(v8 + 316) == 1) {
      *(_DWORD *)(v8 + 316) = 2;
    }
  }

  return result;
}

BOOL sub_10001E8D8(BOOL result)
{
  if (result) {
    return *(_DWORD *)(result + 316) == 1;
  }
  return result;
}

uint64_t sub_10001E8EC(uint64_t a1, void *a2)
{
  uint64_t v3 = a1 + 248;
  uint64_t result = *(void *)(a1 + 248);
  *a2 = *(void *)(v3 + 8);
  return result;
}

uint64_t sub_10001E8F8(uint64_t a1)
{
  return a1 + 8;
}

void sub_10001E900( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || *(_DWORD *)a1 != 1)
  {
    *(_BYTE *)(a1 + 208) = 1;
    sub_100016E40(1LL, "EAP: EAP entering state INITIALIZE", a3, a4, a5, a6, a7, a8, v16);
  }

  *(_DWORD *)a1 = 1;
  *(_DWORD *)(a1 + 148) = -1;
  *(_WORD *)(a1 + 46) = 0;
  *(_BYTE *)(a1 + 48) = 0;
  free(*(void **)(a1 + 64));
  *(_BYTE *)(a1 + memset(&v9[1], 0, 32) = 0;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(_BYTE *)(a1 + 80) = 0;
  uint64_t v15 = *(void *)(a1 + 200);
  if (v15 && *(void *)(a1 + 240))
  {
    (*(void (**)(uint64_t))(v15 + 32))(a1);
    *(void *)(a1 + 240) = 0LL;
  }

  *(void *)(a1 + 200) = 0LL;
  *(_DWORD *)(a1 + 280) = 0;
  if (*(_BYTE *)(a1 + 304))
  {
    *(_DWORD *)(a1 + 144) = 0;
    sub_10001F230(a1, *(void *)(a1 + 16), v9, v10, v11, v12, v13, v14);
    if (*(_BYTE *)(a1 + 172)) {
      *(_DWORD *)(a1 + 148) = *(_DWORD *)(a1 + 176);
    }
  }

  *(void *)(a1 + 312) = 0LL;
  sub_100017140( *(void *)(a1 + 224),  2LL,  "CTRL-EVENT-EAP-STARTED %02x:%02x:%02x:%02x:%02x:%02x",  v10,  v11,  v12,  v13,  v14,  *(unsigned __int8 *)(a1 + 409));
}

void sub_10001EA04( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2 || *(_DWORD *)a1 != 14)
  {
    *(_BYTE *)(a1 + 208) = 1;
    sub_100016E40(1LL, "EAP: EAP entering state FAILURE", a3, a4, a5, a6, a7, a8, v30);
  }

  *(_DWORD *)a1 = 14;
  sub_10001757C(*(void ***)(a1 + 56));
  unsigned __int8 v9 = *(_BYTE *)(a1 + 148);
  sub_100016E40(1LL, "EAP: Building EAP-Failure (id=%d)", v10, v11, v12, v13, v14, v15, v9);
  uint64_t v16 = sub_100017458(4LL);
  uint64_t v23 = v16;
  if (v16)
  {
    int v24 = sub_1000175AC(v16, 4LL, v17, v18, v19, v20, v21, v22);
    *int v24 = 4;
    v24[1] = v9;
    *((_WORD *)v24 + 1) = 1024;
  }

  *(void *)(a1 + 56) = v23;
  sub_10001757C(*(void ***)(a1 + 160));
  *(void *)(a1 + 160) = 0LL;
  *(_BYTE *)(a1 + 47) = 1;
  sub_100017140( *(void *)(a1 + 224),  2LL,  "CTRL-EVENT-EAP-FAILURE %02x:%02x:%02x:%02x:%02x:%02x",  v25,  v26,  v27,  v28,  v29,  *(unsigned __int8 *)(a1 + 409));
}

uint64_t sub_10001EB08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state SELECT_ACTION", a3, a4, a5, a6, a7, a8, v26);
  *(_DWORD *)a1 = 8;
  if (!*(_DWORD *)(a1 + 308) && *(void *)(a1 + 248) && !*(_BYTE *)(a1 + 408))
  {
    uint64_t result = sub_100016E40(1LL, "EAP: getDecision: -> PASSTHROUGH", v9, v10, v11, v12, v13, v14, v27);
    int v17 = 3;
    goto LABEL_37;
  }

  uint64_t v15 = *(void *)(a1 + 200);
  if (!v15) {
    goto LABEL_14;
  }
  if (*(_DWORD *)(a1 + 144) != 1)
  {
    if ((*(unsigned int (**)(uint64_t, void))(v15 + 88))(a1, *(void *)(a1 + 240)))
    {
      uint64_t result = sub_100016E40(1LL, "EAP: getDecision: method succeeded -> SUCCESS", v9, v10, v11, v12, v13, v14, v27);
      int v17 = 0;
      *(_BYTE *)(a1 + 305) = 1;
      goto LABEL_37;
    }

    uint64_t v15 = *(void *)(a1 + 200);
    if (!v15) {
      goto LABEL_14;
    }
  }

  if (!(*(unsigned int (**)(uint64_t, void))(v15 + 72))(a1, *(void *)(a1 + 240))
    || (*(unsigned int (**)(uint64_t, void))(*(void *)(a1 + 200) + 88LL))(a1, *(void *)(a1 + 240)))
  {
LABEL_14:
    uint64_t v19 = *(_DWORD **)(a1 + 272);
    if (v19 && !*(_BYTE *)(a1 + 305))
    {
      *(_BYTE *)(a1 + 408) = 0;
    }

    else
    {
      uint64_t v20 = *(void *)(a1 + 248);
      if (v20 && !*(_BYTE *)(a1 + 408))
      {
        BOOL v24 = !v19 || *(_DWORD *)(a1 + 144) != 1 || *v19 || v19[1] != 1;
        if (sub_10001DB20(a1, v20, *(void *)(a1 + 256), 0LL))
        {
          uint64_t v23 = "EAP: getDecision: user not found from database -> FAILURE";
          goto LABEL_36;
        }

        uint64_t v19 = *(_DWORD **)(a1 + 272);
        if (v19) {
          char v25 = v24;
        }
        else {
          char v25 = 1;
        }
        if ((v25 & 1) == 0 && !*v19 && v19[1] == 1)
        {
          uint64_t v16 = "EAP: getDecision: stop identity request loop -> FAILURE";
          goto LABEL_7;
        }

        *(_BYTE *)(a1 + 305) = 0;
      }

      *(_BYTE *)(a1 + 408) = 0;
      if (!v19) {
        goto LABEL_25;
      }
    }

    uint64_t v21 = *(int *)(a1 + 280);
    if ((int)v21 <= 7 && (v19[2 * v21] || v19[2 * v21 + 1]))
    {
      uint64_t v22 = "EAP: getDecision: another method available -> CONTINUE";
      goto LABEL_29;
    }

uint64_t sub_10001ED3C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state NAK", a3, a4, a5, a6, a7, a8, v21);
  *(_DWORD *)a1 = 11;
  if (*(void *)(a1 + 240))
  {
    (*(void (**)(uint64_t))(*(void *)(a1 + 200) + 32LL))(a1);
    *(void *)(a1 + 240) = 0LL;
  }

  *(void *)(a1 + 200) = 0LL;
  uint64_t v14 = *(void *)(a1 + 16);
  unint64_t v15 = *(void *)(v14 + 8);
  if (*(void *)(v14 + 16)) {
    uint64_t v16 = *(void *)(v14 + 16);
  }
  else {
    uint64_t v16 = v14 + 24;
  }
  if (v15 < 5)
  {
    uint64_t v19 = 0LL;
    uint64_t v18 = 0LL;
  }

  else
  {
    unint64_t v17 = bswap32(*(unsigned __int16 *)(v16 + 2)) >> 16;
    if (v15 >= v17) {
      unint64_t v15 = v17;
    }
    if (*(_BYTE *)(v16 + 4) == 3)
    {
      uint64_t v18 = (unsigned __int8 *)(v16 + 5);
      uint64_t v19 = v15 - 5;
    }

    else
    {
      uint64_t v18 = 0LL;
      uint64_t v19 = v15 - 4;
    }
  }

  return sub_10001F368(a1, v18, v19, v9, v10, v11, v12, v13);
}

uint64_t sub_10001EDF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = 1;
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state METHOD_RESPONSE", a3, a4, a5, a6, a7, a8, v12);
  *(_DWORD *)a1 = 5;
  (*(void (**)(uint64_t, void, void))(*(void *)(a1 + 200) + 64LL))( a1,  *(void *)(a1 + 240),  *(void *)(a1 + 16));
  uint64_t result = (*(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 200) + 72LL))(a1, *(void *)(a1 + 240));
  if ((_DWORD)result)
  {
    free(*(void **)(a1 + 64));
    uint64_t v11 = *(uint64_t (**)(uint64_t, void, uint64_t))(*(void *)(a1 + 200) + 80LL);
    if (v11)
    {
      uint64_t result = v11(a1, *(void *)(a1 + 240), a1 + 72);
    }

    else
    {
      uint64_t result = 0LL;
      *(void *)(a1 + 72) = 0LL;
    }

    *(void *)(a1 + 64) = result;
    int v9 = 2;
  }

  *(_DWORD *)(a1 + 152) = v9;
  return result;
}

uint64_t sub_10001EEA0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state IDLE", a3, a4, a5, a6, a7, a8, v16);
  *(_DWORD *)a1 = 2;
  uint64_t result = sub_10001F3FC(*(_DWORD *)(a1 + 156), *(unsigned int *)(a1 + 168), v9, v10, v11, v12, v13, v14);
  *(_DWORD *)(a1 + 28) = result;
  return result;
}

uint64_t sub_10001EEEC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state METHOD_REQUEST", a3, a4, a5, a6, a7, a8, v19);
  *(_DWORD *)a1 = 6;
  if (!*(void *)(a1 + 200)) {
    return sub_100016E40(1LL, "EAP: method not initialized", v10, v11, v12, v13, v14, v15, a9);
  }
  LODWORD(v16) = *(_DWORD *)(a1 + 148);
  *(_DWORD *)(a1 + 148) = v16;
  sub_100016E40(1LL, "EAP: building EAP-Request: Identifier %d", v10, v11, v12, v13, v14, v15, v16);
  *(_DWORD *)(a1 + 268) = *(_DWORD *)(a1 + 148);
  sub_10001757C(*(void ***)(a1 + 56));
  uint64_t result = (*(uint64_t (**)(uint64_t, void, void))(*(void *)(a1 + 200) + 40LL))( a1,  *(void *)(a1 + 240),  *(unsigned __int8 *)(a1 + 148));
  *(void *)(a1 + 56) = result;
  uint64_t v18 = *(uint64_t (**)(uint64_t, void))(*(void *)(a1 + 200) + 48LL);
  if (v18)
  {
    uint64_t result = v18(a1, *(void *)(a1 + 240));
    *(_DWORD *)(a1 + 168) = result;
  }

  else
  {
    *(_DWORD *)(a1 + 168) = 0;
  }

  return result;
}

void sub_10001EFE0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = 1;
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state PROPOSE_METHOD", a3, a4, a5, a6, a7, a8, v30);
  *(_DWORD *)a1 = 7;
  if (!*(void *)(a1 + 248) || *(_DWORD *)(a1 + 148) == -1)
  {
    *(_BYTE *)(a1 + 305) = 1;
LABEL_8:
    sub_100016E40(1LL, "EAP: getNextMethod: vendor %d type %d", v10, v11, v12, v13, v14, v15, 0LL);
    uint64_t v19 = 0LL;
    int v20 = v9;
    goto LABEL_9;
  }

  int v9 = 0;
  uint64_t v16 = *(void *)(a1 + 272);
  if (!v16) {
    goto LABEL_8;
  }
  uint64_t v17 = *(int *)(a1 + 280);
  uint64_t v18 = (unsigned int *)(v16 + 8 * v17);
  uint64_t v19 = *v18;
  int v20 = v18[1];
  if (!(_DWORD)v19)
  {
    if (v20)
    {
      *(_DWORD *)(a1 + 280) = v17 + 1;
      sub_100016E40(1LL, "EAP: getNextMethod: vendor %d type %d", v10, v11, v12, v13, v14, v15, v19);
      uint64_t v19 = 0LL;
      int v9 = v20;
      goto LABEL_9;
    }

    int v9 = 0;
    goto LABEL_8;
  }

  *(_DWORD *)(a1 + 280) = v17 + 1;
  sub_100016E40(1LL, "EAP: getNextMethod: vendor %d type %d", v10, v11, v12, v13, v14, v15, v19);
  int v9 = 254;
LABEL_9:
  *(_DWORD *)(a1 + 144) = v9;
  uint64_t v21 = *(void *)(a1 + 200);
  if (v21 && *(void *)(a1 + 240))
  {
    (*(void (**)(uint64_t))(v21 + 32))(a1);
    *(void *)(a1 + 240) = 0LL;
  }

  uint64_t v22 = sub_100020EDC(v19, v20);
  *(void *)(a1 + 200) = v22;
  if (v22)
  {
    uint64_t v28 = (*(uint64_t (**)(uint64_t))(v22 + 16))(a1);
    *(void *)(a1 + 240) = v28;
    if (!v28)
    {
      sub_100016E40( 1LL,  "EAP: Failed to initialize EAP method %d",  v29,  v23,  v24,  v25,  v26,  v27,  *(unsigned int *)(a1 + 144));
      *(void *)(a1 + 200) = 0LL;
      *(_DWORD *)(a1 + 144) = 0;
    }
  }

  *(_DWORD *)(a1 + 152) = (*(_DWORD *)(a1 + 144) - 1) < 2;
  sub_100017140( *(void *)(a1 + 224),  2LL,  "CTRL-EVENT-EAP-PROPOSED-METHOD vendor=%u method=%u",  v23,  v24,  v25,  v26,  v27,  v19);
}

unint64_t *sub_10001F174( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state AAA_REQUEST", a3, a4, a5, a6, a7, a8, v18);
  *(_DWORD *)a1 = 23;
  uint64_t v16 = *(void *)(a1 + 16);
  if (!v16) {
    return (unint64_t *)sub_100016E40(2LL, "EAP: AAA_REQUEST - no eapRespData", v10, v11, v12, v13, v14, v15, a9);
  }
  sub_10001757C(*(void ***)(a1 + 128));
  uint64_t result = sub_100017514(v16);
  *(void *)(a1 + 128) = result;
  return result;
}

uint64_t sub_10001F1E4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 208) = 1;
  sub_100016E40(1LL, "EAP: EAP entering state IDLE2", a3, a4, a5, a6, a7, a8, v16);
  *(_DWORD *)a1 = 18;
  uint64_t result = sub_10001F3FC(*(_DWORD *)(a1 + 156), *(unsigned int *)(a1 + 168), v9, v10, v11, v12, v13, v14);
  *(_DWORD *)(a1 + 28) = result;
  return result;
}

uint64_t sub_10001F230( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(_BYTE *)(a1 + 172) = 0;
  *(_OWORD *)(a1 + 176) = xmmword_10002B360;
  if (!a2) {
    return sub_100016E40(1LL, "EAP: parseEapResp: invalid resp=%p len=%lu", a3, a4, a5, a6, a7, a8, a2);
  }
  unint64_t v8 = *(void *)(a2 + 8);
  if (v8 <= 3) {
    return sub_100016E40(1LL, "EAP: parseEapResp: invalid resp=%p len=%lu", a3, a4, a5, a6, a7, a8, a2);
  }
  uint64_t v9 = a2 + 24;
  if (*(void *)(a2 + 16)) {
    uint64_t v9 = *(void *)(a2 + 16);
  }
  unint64_t v10 = bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16;
  if (v8 < v10) {
    return sub_100016E40( 1LL,  "EAP: Ignored truncated EAP-Packet (len=%lu plen=%lu)",  a3,  a4,  a5,  a6,  a7,  a8,  *(void *)(a2 + 8));
  }
  *(_DWORD *)(a1 + 176) = *(unsigned __int8 *)(v9 + 1);
  if (*(_BYTE *)v9 == 2)
  {
    uint64_t v12 = 1LL;
    *(_BYTE *)(a1 + 172) = 1;
  }

  else
  {
    uint64_t v12 = 0LL;
  }

  if (v10 >= 5)
  {
    int v13 = *(unsigned __int8 *)(v9 + 4);
    *(_DWORD *)(a1 + 180) = v13;
    if (v13 == 254)
    {
      *(_DWORD *)(a1 + 184) = (*(unsigned __int8 *)(v9 + 5) << 16) | (*(unsigned __int8 *)(v9 + 6) << 8) | *(unsigned __int8 *)(v9 + 7);
      *(_DWORD *)(a1 + 188) = bswap32(*(_DWORD *)(v9 + 8));
    }
  }

  return sub_100016E40( 1LL,  "EAP: parseEapResp: rxResp=%d respId=%d respMethod=%u respVendor=%u respVendorMethod=%u",  a3,  a4,  a5,  a6,  a7,  a8,  v12);
}

uint64_t sub_10001F368( uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    if (a2)
    {
      uint64_t v8 = result;
      uint64_t v9 = *(void *)(result + 272);
      if (v9)
      {
        if (*(_DWORD *)(v9 + 84))
        {
          uint64_t result = sub_100016E40( 1LL,  "EAP: EAP-Nak received after Phase2 user info was selected - reject",  a3,  a4,  a5,  a6,  a7,  a8,  v10);
          *(_DWORD *)(v8 + 196) = 1;
        }

        else
        {
          return sub_10001DC04(result, a2, a3, a4, a5, a6, a7, a8);
        }
      }
    }
  }

  return result;
}

unint64_t *sub_10001F3C4(unint64_t *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    sub_10001757C((void **)*result);
    uint64_t result = sub_100017514(a2);
    *uint64_t v3 = result;
  }

  return result;
}

uint64_t sub_10001F3FC( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((_DWORD)a2)
  {
    uint64_t v8 = a2;
    sub_100016E40(1LL, "EAP: retransmit timeout %d seconds (from EAP method hint)", a3, a4, a5, a6, a7, a8, a2);
  }

  else
  {
    if (a1 == 2) {
      unsigned int v9 = 12;
    }
    else {
      unsigned int v9 = 20;
    }
    if (a1 == 1) {
      unsigned int v9 = 6;
    }
    if (a1 <= 0) {
      uint64_t v8 = 3LL;
    }
    else {
      uint64_t v8 = v9;
    }
    sub_100016E40( 1LL,  "EAP: retransmit timeout %d seconds (from dynamic back off; retransCount=%d)",
      a3,
      a4,
      a5,
      a6,
      a7,
      a8,
      v8);
  }

  return v8;
}

unsigned int *sub_10001F478(unsigned int *result, unsigned int *a2)
{
  uint64_t v2 = 0LL;
  unsigned int v3 = bswap32(*a2);
  *uint64_t result = v3;
  result[1] = bswap32(a2[1]);
  result[2] = bswap32(a2[2]);
  result[3] = bswap32(a2[3]);
  unsigned __int8 v4 = result + 4;
  do
  {
    int v6 = *(v4 - 2);
    unint64_t v5 = *(v4 - 1);
    v3 ^= (HIWORD(*((_DWORD *)&unk_10002B370 + BYTE2(v5))) << 24) ^ (*((unsigned __int8 *)&unk_10002B370
                                                                     + 4 * BYTE1(v5)
                                                                     + 2) << 16) ^ (*((unsigned __int8 *)&unk_10002B370
                                                                                    + 4 * v5
                                                                                    + 1) << 8) ^ *((unsigned __int8 *)&unk_10002B370
                                                                                                 + ((v5 >> 22) & 0x3FC)
                                                                                                 + 1) ^ (byte_10002BC70[v2] << 24);
    int v7 = v3 ^ *(v4 - 3);
    *unsigned __int8 v4 = v3;
    v4[1] = v7;
    int v8 = v6 ^ v7;
    v4[2] = v8;
    v4[3] = v8 ^ v5;
    ++v2;
    v4 += 4;
  }

  while (v2 != 10);
  return result;
}

void sub_10001F538( uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a2 + 24);
  if ((v8 & 0x100) == 0)
  {
    if (a3)
    {
      if ((v8 & 0x20) == 0)
      {
        sub_100017140( *(void *)(a1 + 2576),  2LL,  "AP-STA-CONNECTED %02x:%02x:%02x:%02x:%02x:%02x",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
        int v8 = *(_DWORD *)(a2 + 24);
      }

      unsigned int v11 = v8 | 0x20;
      uint64_t v12 = "authorizing port";
      uint64_t v13 = 1LL;
    }

    else
    {
      if ((~v8 & 0x22) == 0)
      {
        sub_100017140( *(void *)(a1 + 2576),  2LL,  "AP-STA-DISCONNECTED %02x:%02x:%02x:%02x:%02x:%02x",  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
        int v8 = *(_DWORD *)(a2 + 24);
      }

      uint64_t v13 = 0LL;
      unsigned int v11 = v8 & 0xFFFFFFDF;
      uint64_t v12 = "unauthorizing port";
    }

    *(_DWORD *)(a2 + 24) = v11;
    int v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 2408))(a1, a2, v13);
    sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 2LL, 1LL, v12, v15, v16, v17, v25);
    if (v14)
    {
      if (*__error() != 2)
      {
        int v18 = *(unsigned __int8 *)(a2 + 16);
        int v19 = *(unsigned __int8 *)(a2 + 17);
        int v20 = *(unsigned __int8 *)(a2 + 18);
        int v21 = *(unsigned __int8 *)(a2 + 19);
        int v22 = *(unsigned __int8 *)(a2 + 20);
        int v23 = *(unsigned __int8 *)(a2 + 21);
        uint64_t v24 = __error();
        printf( "Could not set station %02x:%02x:%02x:%02x:%02x:%02x flags for kernel driver (errno=%d).\n",  v18,  v19,  v20,  v21,  v22,  v23,  *v24);
      }
    }
  }

void sub_10001F6A8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 88);
  if (v8 && *(void *)(*(void *)(v8 + 232) + 56LL))
  {
    uint64_t v11 = *(void *)(a1 + 2632);
    sub_100016E40( 1LL,  "IEEE 802.1X: Sending EAPOL-Key(s) to %02x:%02x:%02x:%02x:%02x:%02x",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
    uint64_t v12 = *(const void **)(v11 + 208);
    if (v12) {
      sub_10001F82C(a1, a2, *(_BYTE *)(v11 + 216), 1, v12, *(void *)(*(void *)(a1 + 16) + 392LL));
    }
    uint64_t v13 = *(void *)(a1 + 16);
    size_t v14 = *(unsigned int *)(v13 + 400);
    if ((int)v14 >= 1)
    {
      uint64_t v15 = (unsigned __int8 *)malloc(*(unsigned int *)(v13 + 400));
      int v22 = v15;
      if (v15 && !sub_10001691C(v15, v14))
      {
        sub_100016F74(1LL, "Individual WEP key", v22, *(int *)(*(void *)(a1 + 16) + 400LL));
        sub_10001F82C(a1, a2, 0, 0, v22, *(int *)(*(void *)(a1 + 16) + 400LL));
        uint64_t v24 = (uint64_t)v22;
        int v23 = "Could not set individual WEP encryption.";
      }

      else
      {
        int v23 = "Could not generate random individual WEP key.";
      }

      sub_100016E40(4LL, v23, v16, v17, v18, v19, v20, v21, v24);
LABEL_10:
      free(v22);
    }
  }

void sub_10001F82C(uint64_t a1, uint64_t a2, char a3, int a4, const void *a5, size_t a6)
{
  uint64_t v6 = *(void *)(a2 + 88);
  if (v6)
  {
    uint64_t v13 = a6 + 48;
    size_t v14 = (char *)sub_100016B98(a6 + 48);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v37 = a1;
      v14[4] = 1;
      uint64_t v16 = v14 + 4;
      *(_WORD *)(v14 + 5) = bswap32(a6) >> 16;
      sub_1000163F4(v14 + 7);
      if (sub_10001691C(v16 + 11, 0x10uLL))
      {
        int v23 = "Could not get random numbers";
      }

      else
      {
        v15[31] = a3 | ((a4 == 0) << 7);
        if (*(_DWORD *)(*(void *)(v37 + 16) + 384LL)) {
          v15[31] = a3 | 0x80;
        }
        uint64_t v24 = *(void *)(v6 + 232);
        if (*(void *)(v24 + 56) && *(void *)(v24 + 64) > 0x3FuLL)
        {
          memcpy(v15 + 48, a5, a6);
          uint64_t v25 = malloc(0x30uLL);
          if (v25)
          {
            uint64_t v26 = v25;
            *uint64_t v25 = *(_OWORD *)(v16 + 11);
            uint64_t v27 = *(_OWORD **)(*(void *)(v6 + 232) + 56LL);
            __int128 v28 = v27[1];
            v25[1] = *v27;
            v25[2] = v28;
            sub_100026B04((uint64_t)v25, 0x30uLL, 0LL, (uint64_t)(v15 + 48), a6);
            free(v26);
            *uint64_t v15 = *(_DWORD *)(*(void *)(v37 + 16) + 76LL);
            v15[1] = 3;
            *((_WORD *)v15 + 1) = bswap32(a6 + 44) >> 16;
            sub_10000E2AC( (__int128 *)(*(void *)(*(void *)(v6 + 232) + 56LL) + 32LL),  0x20uLL,  (uint64_t)v15,  v13,  (_OWORD *)v15 + 2);
            sub_100016E40( 1LL,  "IEEE 802.1X: Sending EAPOL-Key to %02x:%02x:%02x:%02x:%02x:%02x (%s index=%d)",  v29,  v30,  v31,  v32,  v33,  v34,  *(unsigned __int8 *)(v6 + 216));
            sub_100020DB8(v37, a2, 3, v16, a6 + 44);
            uint64_t v35 = *(void *)(a2 + 88);
            if (v35) {
              ++*(_DWORD *)(v35 + 176);
            }
            goto LABEL_12;
          }

          int v23 = "Could not encrypt key";
        }

        else
        {
          int v23 = "No eapKeyData available for encrypting and signing EAPOL-Key";
        }
      }

      sub_100016E40(4LL, v23, v17, v18, v19, v20, v21, v22, v36);
LABEL_12:
      free(v15);
    }
  }

const char *sub_10001FA8C(uint64_t a1)
{
  int v1 = *(_DWORD *)(*(void *)(*(void *)a1 + 40LL) + 40LL);
  uint64_t v2 = "802.11b";
  if (v1 == 1) {
    uint64_t v2 = "802.11g";
  }
  if (v1 == 2) {
    return "802.11a";
  }
  else {
    return v2;
  }
}

uint64_t sub_10001FAC4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2 + 64);
  LOBYTE(result) = 0;
  unsigned __int8 v4 = (char *)(a2 + 32);
  do
  {
    char v5 = *v4++;
    unsigned int v6 = v5 & 0x7F;
    else {
      uint64_t result = v6;
    }
    --v2;
  }

  while (v2);
  return result;
}

void sub_10001FB00( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v13 = *(_DWORD **)(a1 + 16);
  if (v13[18] || v13[121] || v13[187])
  {
    sub_100016E40(1LL, "IEEE 802.1X: %lu bytes from %02x:%02x:%02x:%02x:%02x:%02x", (uint64_t)a3, a4, a5, a6, a7, a8, a4);
    uint64_t v14 = sub_1000059B4(a1, a2);
    if (!v14 || (uint64_t v21 = v14, (*(_BYTE *)(v14 + 24) & 2) == 0))
    {
      sub_100016E40(1LL, "IEEE 802.1X data frame from not associated STA", v15, v16, v17, v18, v19, v20, a9);
      return;
    }

    if (a4 <= 3)
    {
      puts("   too short IEEE 802.1X packet");
      return;
    }

    unint64_t v22 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
    sub_100016E40(1LL, "   IEEE 802.1X: version=%d type=%d length=%d", v15, v16, v17, v18, v19, v20, *a3);
    if (a4 - 4 >= v22)
    {
      if (a4 - 4 > v22) {
        sub_100016E40( 1LL,  "   ignoring %lu extra octets after IEEE 802.1X packet",  v23,  v24,  v25,  v26,  v27,  v28,  a4 - 4 - v22);
      }
      uint64_t v30 = *(void *)(v21 + 88);
      if (v30)
      {
        *(_DWORD *)(v30 + 212) = *a3;
        ++*(_DWORD *)(v30 + 172);
      }

      if (v22 >= 0x2C && a3[1] == 3)
      {
        int v31 = a3[4];
        if (v31 == 254 || v31 == 2)
        {
          sub_100008798(*(void *)(a1 + 2624), *(void *)(v21 + 168), (uint64_t)a3, v22 + 4, v25, v26, v27, v28);
          return;
        }
      }

      if (*(_DWORD *)(*(void *)(a1 + 16) + 72LL) || (*(_BYTE *)(v21 + 25) & 0x30) != 0)
      {
        int v32 = sub_100009C10(*(void *)(v21 + 168));
        if (v32 != 2 && v32 != 64 && v32 != 256 && sub_100009C10(*(void *)(v21 + 168)) != 1024)
        {
          if (!*(void *)(v21 + 88))
          {
            uint64_t v39 = sub_10001FECC(a1, v21);
            *(void *)(v21 + 88) = v39;
            if (!v39) {
              return;
            }
            *(_BYTE *)(*(void *)(v39 + 232) + 16LL) = 1;
          }

          switch(a3[1])
          {
            case 0u:
              sub_10001FF3C(a1, v21, a3 + 4, v22, v35, v36, v37, v38, v48);
              break;
            case 1u:
              sub_1000172B0( a1,  (unsigned __int8 *)(v21 + 16),  2LL,  1LL,  "received EAPOL-Start from STA",  v36,  v37,  v38,  v48);
              *(_DWORD *)(*(void *)(v21 + 88) + 224LL) &= ~2u;
              uint64_t v42 = sub_100009C58(*(void *)(v21 + 168));
              if (v42)
              {
                uint64_t v46 = v42;
                sub_1000172B0( a1,  (unsigned __int8 *)(v21 + 16),  8LL,  1LL,  "cached PMKSA available - ignore it since STA sent EAPOL-Start",  v43,  v44,  v45,  v49);
                sub_100009C30(*(void *)(v21 + 168), v46);
              }

              uint64_t v47 = *(void *)(v21 + 88);
              *(_BYTE *)(v47 + 41) = 1;
              ++*(_DWORD *)(v47 + 180);
              sub_100009508(*(void *)(v21 + 168), 5);
              break;
            case 2u:
              sub_1000172B0( a1,  (unsigned __int8 *)(v21 + 16),  2LL,  1LL,  "received EAPOL-Logoff from STA",  v36,  v37,  v38,  v48);
              *(_DWORD *)(v21 + 124) = 1;
              uint64_t v40 = *(void *)(v21 + 88);
              *(_BYTE *)(v40 + 40) = 1;
              ++*(_DWORD *)(v40 + 184);
              break;
            case 3u:
              sub_100016E40(1LL, "   EAPOL-Key", v33, v34, v35, v36, v37, v38, v48);
              if ((*(_BYTE *)(v21 + 24) & 0x20) == 0)
              {
                uint64_t v41 = "   Dropped key data from unauthorized Supplicant";
                goto LABEL_41;
              }

              break;
            case 4u:
              uint64_t v41 = "   EAPOL-Encapsulated-ASF-Alert";
LABEL_41:
              sub_100016E40(1LL, v41, v33, v34, v35, v36, v37, v38, v48);
              break;
            default:
              sub_100016E40(1LL, "   unknown IEEE 802.1X packet type", v33, v34, v35, v36, v37, v38, v48);
              ++*(_DWORD *)(*(void *)(v21 + 88) + 204LL);
              break;
          }

          sub_10001C2B4(*(void *)(v21 + 88));
        }
      }
    }

    else
    {
      puts("   frame too short for this IEEE 802.1X packet");
      uint64_t v29 = *(void *)(v21 + 88);
      if (v29) {
        ++*(_DWORD *)(v29 + 208);
      }
    }
  }

uint64_t sub_10001FECC(uint64_t a1, uint64_t a2)
{
  int v4 = (*(_DWORD *)(a2 + 24) >> 8) & 1;
  uint64_t v5 = *(void *)(a2 + 168);
  if (v5)
  {
    if (sub_100009C58(v5)) {
      v4 |= 4u;
    }
    if (sub_100009C58(*(void *)(a2 + 168))) {
      v4 |= 8u;
    }
  }

  return sub_10001BEF4(*(int **)(a1 + 2632), (int *)(a2 + 16), v4, *(void *)(a2 + 248), a2);
}

uint64_t sub_10001FF3C( uint64_t a1, uint64_t a2, _BYTE *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a4 <= 3)
  {
    unsigned int v9 = "   too short EAP packet";
    return puts(v9);
  }

  size_t v15 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  sub_100016E40(1LL, "EAP: code=%d identifier=%d length=%d", (uint64_t)a3, a4, a5, a6, a7, a8, *a3);
  if (v15 <= 3)
  {
    unint64_t v22 = "   Invalid EAP length";
    return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
  }

  if (a4 < v15)
  {
    unint64_t v22 = "   Too short frame to contain this EAP packet";
    return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
  }

  if (a4 > v15) {
    sub_100016E40(1LL, "   Ignoring %lu extra bytes after EAP packet", v16, v17, v18, v19, v20, v21, a4 - v15);
  }
  switch(*a3)
  {
    case 1:
      unint64_t v22 = " (request)";
      return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
    case 2:
      uint64_t result = sub_100016E40(1LL, " (response)", v16, v17, v18, v19, v20, v21, v29);
      uint64_t v23 = *(void *)(a2 + 88);
      if (!v23) {
        return result;
      }
      if (v15 <= 4)
      {
        unsigned int v9 = "handle_eap_response: too short response data";
        return puts(v9);
      }

      int v24 = a3[4];
      *(_BYTE *)(v23 + 281) = v24;
      uint64_t v25 = *a3;
      sub_1000210AC(0, v24);
      sub_1000172B0( a1,  (unsigned __int8 *)(v23 + 216),  2LL,  1LL,  "received EAP packet (code=%d id=%d len=%d) from STA: EAP Response-%s (%d)",  v26,  v27,  v28,  v25);
      ++*(_DWORD *)(v23 + 192);
      sub_10001757C(*(void ***)(*(void *)(v23 + 232) + 8LL));
      uint64_t result = (uint64_t)sub_1000174B8(a3, v15);
      *(void *)(*(void *)(v23 + 232) + 8LL) = result;
      *(_BYTE *)(v23 + 23) = 1;
      break;
    case 3:
      unint64_t v22 = " (success)";
      return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
    case 4:
      unint64_t v22 = " (failure)";
      return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
    default:
      unint64_t v22 = " (unknown code)";
      return sub_100016E40(1LL, v22, v16, v17, v18, v19, v20, v21, a9);
  }

  return result;
}

void sub_100020154( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (*(_DWORD *)(*(void *)(a1 + 16) + 72LL))
  {
    int v11 = sub_100009C10(*(void *)(a2 + 168));
    if (v11 != 2 && v11 != 64 && v11 != 256 && sub_100009C10(*(void *)(a2 + 168)) != 1024)
    {
      uint64_t v15 = *(void *)(a2 + 88);
      uint64_t v16 = v15;
      if (v15
        || (sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 2LL, 1LL, "start authentication", v12, v13, v14, v34),
            uint64_t v16 = sub_10001FECC(a1, a2),
            (*(void *)(a2 + 88) = v16) != 0LL))
      {
        *(_BYTE *)(*(void *)(v16 + 232) + 16LL) = 1;
        uint64_t v20 = sub_100009C58(*(void *)(a2 + 168));
        if (v20)
        {
          uint64_t v24 = v20;
          sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  2LL,  1LL,  "PMK from PMKSA cache - skip IEEE 802.1X/EAP",  v21,  v22,  v23,  v34);
          uint64_t v31 = *(void *)(a2 + 88);
          *(_BYTE *)(v31 + 26) = 1;
          *(_BYTE *)(*(void *)(v31 + 232) + 72LL) = 1;
          *(_DWORD *)(v31 + 36) = 3;
          *(_DWORD *)(v31 + 104) = 2;
          *(_BYTE *)(v31 + 22) = 1;
          int v32 = *(_DWORD **)(v31 + 336);
          if (v32)
          {
            sub_10001E884(v32);
            uint64_t v31 = *(void *)(a2 + 88);
          }

          sub_100005140(v24, v31, v25, v26, v27, v28, v29, v30);
          if (!*(_DWORD *)(*(void *)(a2 + 184) + 192LL)) {
            *(_DWORD *)(a2 + 200) = 0;
          }
          sub_100004C68();
        }

        else
        {
          uint64_t v33 = *(void *)(a2 + 88);
          if (v15) {
            *(_BYTE *)(v33 + 33) = 1;
          }
          sub_10001C2B4(v33);
        }
      }

      else
      {
        sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 2LL, 2LL, "failed to allocate state machine", v17, v18, v19, a9);
      }
    }
  }

void sub_1000202F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    *(void *)(a1 + 88) = 0LL;
    free(*(void **)(v1 + 264));
    sub_10001C0E8((void *)v1, v2, v3, v4, v5, v6, v7, v8);
  }

void sub_100020334( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a2 + 88);
  if (v8)
  {
    uint64_t v11 = a2 + 16;
    sub_1000172B0(a1, (unsigned __int8 *)(a2 + 16), 2LL, 1LL, "aborting authentication", a6, a7, a8, v17);
    uint64_t v16 = *(void *)(v8 + 232);
    if (*(_BYTE *)(v16 + 40))
    {
      *(_BYTE *)(v16 + 16) = 0;
      sub_100006910(a1, a2, v11, 2LL, v12, v13, v14, v15);
    }
  }

uint64_t sub_1000203B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *(void *)(v2 + 368);
  uint64_t v4 = *(void *)(v2 + 376);
  uint64_t v39 = 0LL;
  uint64_t v41 = a1;
  int v5 = *(_DWORD *)(v2 + 484);
  v29[0] = *(_DWORD *)(v2 + 416);
  v29[1] = v5;
  int v6 = *(_DWORD *)(v2 + 80);
  v29[2] = *(_DWORD *)(v2 + 400);
  v29[3] = v6;
  uint64_t v7 = *(void *)(a1 + 2576);
  uint64_t v30 = *(void *)(a1 + 2680);
  uint64_t v31 = v7;
  uint64_t v32 = *(void *)(a1 + 2688);
  uint64_t v33 = v3;
  uint64_t v34 = v4;
  __int128 v35 = *(_OWORD *)(v2 + 616);
  uint64_t v8 = *(void *)(v2 + 640);
  uint64_t v36 = *(void *)(v2 + 632);
  uint64_t v37 = v8;
  __int128 v38 = *(_OWORD *)(v2 + 648);
  LODWORD(v39) = *(_DWORD *)(v2 + 664);
  uint64_t v40 = *(void *)(a1 + 2720);
  *(void *)&__int128 v20 = sub_100020558;
  *((void *)&v20 + 1) = nullsub_3;
  uint64_t v21 = sub_100020560;
  uint64_t v22 = sub_1000205DC;
  uint64_t v23 = sub_100020688;
  uint64_t v24 = sub_1000206AC;
  uint64_t v25 = sub_1000206F4;
  uint64_t v26 = sub_1000206F8;
  uint64_t v27 = sub_1000206FC;
  uint64_t v28 = sub_100020700;
  unsigned int v9 = sub_10001C334((uint64_t)v29, &v20);
  *(void *)(a1 + 26memset(&v9[1], 0, 32) = v9;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v10 = *(void *)(a1 + 16);
  if (*(_DWORD *)(v10 + 72) || *(_DWORD *)(v10 + 484))
  {
    uint64_t v10 = *(void *)(a1 + 16);
  }

  if (*(void *)(v10 + 392))
  {
    uint64_t v12 = 0LL;
    do
    {
      (*(void (**)(void, uint64_t, void, void, uint64_t, void, void, void, void, void))(a1 + 2416))( *(void *)(a1 + 16),  a1,  0LL,  0LL,  v12,  0LL,  0LL,  0LL,  0LL,  0LL);
      uint64_t v12 = (v12 + 1);
    }

    while ((_DWORD)v12 != 4);
    sub_100020724(a1, v13, v14, v15, v16, v17, v18, v19);
    if (!*(void *)(*(void *)(a1 + 2632) + 208LL)) {
      return 0xFFFFFFFFLL;
    }
  }

  return 0LL;
}

void sub_100020560( uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a4)
  {
    uint64_t v10 = *(void *)(a2 + 88);
    if (v10)
    {
      if (a3)
      {
        uint64_t v11 = *(void *)(v10 + 232);
        uint64_t v12 = *(void **)(v11 + 56);
        if (v12)
        {
          if (*(void *)(v11 + 64) >= 0x20uLL && !sub_100009C88(*(_DWORD **)(a2 + 168), v12, 43200, v10)) {
            sub_1000172B0( a1,  (unsigned __int8 *)(a2 + 16),  8LL,  1LL,  "Added PMKSA cache entry (IEEE 802.1X)",  v14,  v15,  v16,  a9);
          }
        }
      }
    }
  }

uint64_t sub_1000205DC(uint64_t a1, void *a2, size_t a3, int a4, uint64_t a5)
{
  uint64_t v7 = sub_1000026FC(*(void *)(a1 + 16), a2, a3, a4);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0LL;
    *(_OWORD *)(a5 + 64) = 0u;
    *(_OWORD *)(a5 + 80) = 0u;
    *(_OWORD *)(a5 + memset(&v9[1], 0, 32) = 0u;
    *(_OWORD *)(a5 + 48) = 0u;
    *(_OWORD *)a5 = 0u;
    *(_OWORD *)(a5 + 16) = 0u;
    *(_DWORD *)(a5 + 84) = a4;
    do
    {
      *(void *)(a5 + v9 * 8) = v7[v9 + 3];
      ++v9;
    }

    while (v9 != 8);
    uint64_t v10 = (const void *)v7[11];
    if (!v10) {
      goto LABEL_7;
    }
    size_t v11 = v7[12];
    uint64_t v12 = malloc(v11);
    *(void *)(a5 + 64) = v12;
    if (v12)
    {
      memcpy(v12, v10, v11);
      *(void *)(a5 + 72) = v11;
LABEL_7:
      uint64_t result = 0LL;
      int v14 = *((_DWORD *)v8 + 29);
      *(_DWORD *)(a5 + 88) = *((_DWORD *)v8 + 27);
      *(_DWORD *)(a5 + 92) = v14;
      return result;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_100020688(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1000059B4(a1, a2);
  if (result) {
    return *(void *)(result + 88) != 0LL;
  }
  return result;
}

void sub_1000206AC( uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a3 == 1) {
    LODWORD(v8) = 2;
  }
  else {
    LODWORD(v8) = 1;
  }
  if (a3 == 2) {
    uint64_t v8 = 4LL;
  }
  else {
    uint64_t v8 = v8;
  }
  sub_1000172B0(a1, a2, 2LL, v8, "%s", a6, a7, a8, a4);
}

uint64_t sub_100020700(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 == 1) {
    return sub_100009508(*(void *)(a2 + 168), 5);
  }
  if (!a3) {
    return sub_1000095FC(*(void *)(a2 + 168));
  }
  return result;
}

void sub_100020724( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 2632);
  unsigned int v10 = *(unsigned __int8 *)(v9 + 216);
  if (v10 < 3) {
    unsigned __int8 v11 = v10 + 1;
  }
  else {
    unsigned __int8 v11 = *(_DWORD *)(*(void *)(a1 + 16) + 400LL) > 0;
  }
  *(_BYTE *)(v9 + 216) = v11;
  sub_100016E40(1LL, "IEEE 802.1X: New default WEP key index %d", a3, a4, a5, a6, a7, a8, v11);
  if (*(void *)(*(void *)(a1 + 16) + 392LL))
  {
    uint64_t v12 = *(void *)(a1 + 2632);
    free(*(void **)(v12 + 208));
    size_t v13 = *(void *)(*(void *)(a1 + 16) + 392LL);
    int v14 = malloc(v13);
    *(void *)(v12 + 208) = v14;
    if (!v14 || sub_10001691C(v14, v13))
    {
      puts("Could not generate random WEP key.");
      free(*(void **)(v12 + 208));
      *(void *)(v12 + 208) = 0LL;
      uint64_t v18 = "failed to generate a new broadcast key";
LABEL_11:
      sub_1000172B0(a1, 0LL, 2LL, 4LL, v18, v15, v16, v17, v20);
      free(*(void **)(v9 + 208));
      *(void *)(v9 + 208) = 0LL;
      return;
    }

    sub_100016F74( 1LL,  "IEEE 802.1X: New default WEP key",  *(unsigned __int8 **)(v12 + 208),  *(void *)(*(void *)(a1 + 16) + 392LL));
  }

  uint64_t v20 = *(void *)(v9 + 208);
  if ((*(unsigned int (**)(void))(a1 + 2416))())
  {
    uint64_t v18 = "failed to configure a new broadcast key";
    goto LABEL_11;
  }

  sub_10000595C(a1, (unsigned int (*)(uint64_t, void *, uint64_t))sub_100020EB0, 0LL);
  signed int v19 = *(_DWORD *)(*(void *)(a1 + 16) + 404LL);
  if (v19 >= 1) {
    sub_100026220(v19, 0, (uint64_t)sub_100020724, a1, 0LL);
  }
}

void sub_1000208BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 2352))
  {
    uint64_t v9 = *(void *)(a1 + 16);
    if (*(_DWORD *)(v9 + 72) || *(_DWORD *)(v9 + 484)) {
      (*(void (**)(uint64_t))(a1 + 2448))(a1);
    }
  }

  sub_10001C4D0(*(void ***)(a1 + 2632));
  *(void *)(a1 + 26memset(&v9[1], 0, 32) = 0LL;
}

uint64_t sub_100020924( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if ((unint64_t)a4 < 0x24
    || *(_DWORD *)(a3 + 24) ^ 0x3AAAA | *(unsigned __int16 *)(a3 + 28)
    || bswap32(*(unsigned __int16 *)(a3 + 30)) >> 16 != 34958)
  {
    return 0LL;
  }

  int v10 = a5;
  uint64_t v12 = (unsigned __int8 *)(a2 + 16);
  uint64_t v13 = 1LL;
  sub_100016E40( 1LL,  "IEEE 802.1X: %02x:%02x:%02x:%02x:%02x:%02x TX status - version=%d type=%d length=%d - ack=%d",  a3,  a4,  a5,  a6,  a7,  a8,  *(unsigned __int8 *)(a2 + 16));
  if (a4 >= 80 && !v10 && *(_BYTE *)(a3 + 33) == 3)
  {
    uint64_t v17 = "uni";
    sub_1000172B0(a1, v12, 2LL, 1LL, "did not Ack EAPOL-Key frame (%scast index=%d)", v14, v15, v16, (uint64_t)v17);
  }

  return v13;
}

uint64_t sub_100020A68(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = result;
    uint64_t result = *(void *)(result + 264);
    if (result) {
      *a2 = *(void *)(v2 + 272);
    }
  }

  return result;
}

uint64_t sub_100020A84(uint64_t result, void *a2, int a3)
{
  if (result)
  {
    uint64_t v3 = *(void *)(result + 288);
    if (v3 && *(_DWORD *)(result + 296) > a3)
    {
      uint64_t v4 = (uint64_t *)(v3 + 16LL * a3);
      uint64_t result = *v4;
      *a2 = v4[1];
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_100020AB4(uint64_t result, void *a2)
{
  if (result)
  {
    uint64_t v2 = *(void *)(result + 232);
    uint64_t result = *(void *)(v2 + 56);
    *a2 = *(void *)(v2 + 64);
  }

  return result;
}

uint64_t sub_100020AC8(uint64_t a1, int a2)
{
  if (a1)
  {
    *(_BYTE *)(*(void *)(a1 + 232) + 16LL) = a2 != 0;
    return sub_10001C2B4(a1);
  }

  return a1;
}

uint64_t sub_100020AE4(uint64_t a1, int a2)
{
  if (a1)
  {
    *(_BYTE *)(a1 + memset(&v9[1], 0, 32) = a2 != 0;
    return sub_10001C2B4(a1);
  }

  return a1;
}

uint64_t sub_100020AFC(uint64_t result, int a2)
{
  if (result) {
    *(_DWORD *)(result + 224) = *(_DWORD *)(result + 224) & 0xFFFFFFFE | (a2 != 0);
  }
  return result;
}

uint64_t sub_100020B1C(int a1, uint64_t a2, char *__str, size_t __size)
{
  uint64_t v4 = *(void *)(a2 + 88);
  if (!v4) {
    return 0LL;
  }
  uint64_t v8 = snprintf( __str,  __size,  "dot1xPaePortNumber=%d\n dot1xPaePortProtocolVersion=%d\n dot1xPaePortCapabilities=1\n dot1xPaePortInitialize=%d\n dot1xPaePortReauthenticate=FALSE\n",  *(unsigned __int16 *)(a2 + 22),  2,  *(unsigned __int8 *)(v4 + 24));
  if ((v8 & 0x80000000) != 0) {
    return 0LL;
  }
  uint64_t v9 = v8;
  int v10 = &__str[v8];
  unsigned __int8 v11 = "TRUE";
  if (*(_BYTE *)(v4 + 140)) {
    uint64_t v12 = "TRUE";
  }
  else {
    uint64_t v12 = "FALSE";
  }
  if (!*(_BYTE *)(v4 + 27)) {
    unsigned __int8 v11 = "FALSE";
  }
  unsigned int v13 = snprintf( v10,  __size - v9,  "dot1xAuthPaeState=%d\n dot1xAuthBackendAuthState=%d\n dot1xAuthAdminControlledDirections=%d\n dot1xAuthOperControlledDirections=%d\n dot1xAuthAuthControlledPortStatus=%d\n dot1xAuthAuthControlledPortControl=%d\n dot1xAuthQuietPeriod=%u\n dot1xAuthServerTimeout=%u\n dot1xAuthReAuthPeriod=%u\n dot1xAuthReAuthEnabled=%s\n dot1xAuthKeyTxEnabled=%s\n",  *(_DWORD *)(v4 + 36) + 1,  *(_DWORD *)(v4 + 104) + 1,  *(_DWORD *)(v4 + 160),  *(_DWORD *)(v4 + 164),  *(_DWORD *)(v4 + 16),  *(_DWORD *)(v4 + 28),  *(_DWORD *)(v4 + 52),  *(_DWORD *)(v4 + 108),  *(_DWORD *)(v4 + 136),  v12,  v11);
  if ((v13 & 0x80000000) == 0 && __size - v9 > v13)
  {
    uint64_t v9 = v13 + v9;
    unsigned int v14 = snprintf( &__str[v9],  __size - v9,  "dot1xAuthEapolFramesRx=%u\n dot1xAuthEapolFramesTx=%u\n dot1xAuthEapolStartFramesRx=%u\n dot1xAuthEapolLogoffFramesRx=%u\n dot1xAuthEapolRespIdFramesRx=%u\n dot1xAuthEapolRespFramesRx=%u\n dot1xAuthEapolReqIdFramesTx=%u\n dot1xAuthEapolReqFramesTx=%u\n dot1xAuthInvalidEapolFramesRx=%u\n dot1xAuthEapLengthErrorFramesRx=%u\n dot1xAuthLastEapolFrameVersion=%u\n dot1xAuthLastEapolFrameSource=%02x:%02x:%02x:%02x:%02x:%02x\n",  *(_DWORD *)(v4 + 172),  *(_DWORD *)(v4 + 176),  *(_DWORD *)(v4 + 180),  *(_DWORD *)(v4 + 184),  *(_DWORD *)(v4 + 188),  *(_DWORD *)(v4 + 192),  *(_DWORD *)(v4 + 196),  *(_DWORD *)(v4 + 200),  *(_DWORD *)(v4 + 204),  *(_DWORD *)(v4 + 208),  *(_DWORD *)(v4 + 212),  *(unsigned __int8 *)(v4 + 216),  *(unsigned __int8 *)(v4 + 217),  *(unsigned __int8 *)(v4 + 218),  *(unsigned __int8 *)(v4 + 219),  *(unsigned __int8 *)(v4 + 220),  *(unsigned __int8 *)(v4 + 221));
    if ((v14 & 0x80000000) == 0 && __size - v9 > v14)
    {
      uint64_t v15 = v14 + v9;
      unsigned int v16 = snprintf( &__str[v15],  __size - v15,  "dot1xAuthEntersConnecting=%u\n dot1xAuthEapLogoffsWhileConnecting=%u\n dot1xAuthEntersAuthenticating=%u\n dot1xAuthAuthSuccessesWhileAuthenticating=%u\n dot1xAuthAuthTimeoutsWhileAuthenticating=%u\n dot1xAuthAuthFailWhileAuthenticating=%u\n dot1xAuthAuthEapStartsWhileAuthenticating=%u\n dot1xAuthAuthEapLogoffWhileAuthenticating=%u\n dot1xAuthAuthReauthsWhileAuthenticated=%u\n dot1xAuthAuthEapStartsWhileAuthenticated=%u\n dot1xAuthAuthEapLogoffWhileAuthenticated=%u\n dot1xAuthBackendResponses=%u\n dot1xAuthBackendAccessChallenges=%u\n dot1xAuthBackendOtherRequestsToSupplicant=%u\n dot1xAuthBackendAuthSuccesses=%u\n dot1xAuthBackendAuthFails=%u\n",  *(_DWORD *)(v4 + 60),  *(_DWORD *)(v4 + 64),  *(_DWORD *)(v4 + 68),  *(_DWORD *)(v4 + 72),  *(_DWORD *)(v4 + 76),  *(_DWORD *)(v4 + 80),  *(_DWORD *)(v4 + 84),  *(_DWORD *)(v4 + 88),  *(_DWORD *)(v4 + 92),  *(_DWORD *)(v4 + 96),  *(_DWORD *)(v4 + 100),  *(_DWORD *)(v4 + 112),  *(_DWORD *)(v4 + 116),  *(_DWORD *)(v4 + 120),  *(_DWORD *)(v4 + 124),  *(_DWORD *)(v4 + 128));
      if ((v16 & 0x80000000) != 0)
      {
        return v15;
      }

      else
      {
        uint64_t v9 = v15;
        if (__size - v15 > v16)
        {
          uint64_t v17 = v16 + v15;
          uint64_t v18 = &__str[v17];
          size_t v19 = __size - v17;
          int v20 = *(_DWORD *)(a2 + 104);
          int v21 = *(_DWORD *)(a2 + 108);
          int v22 = sub_100009C10(*(void *)(a2 + 168));
          int v23 = 1;
          if (v22 != 1 && v22 != 32)
          {
            if (v22 == 128) {
              int v23 = 1;
            }
            else {
              int v23 = 2;
            }
          }

          int v24 = time(0LL);
          int v25 = snprintf( v18,  v19,  "dot1xAuthSessionId=%08X-%08X\n dot1xAuthSessionAuthenticMethod=%d\n dot1xAuthSessionTime=%u\n dot1xAuthSessionTerminateCause=999\n dot1xAuthSessionUserName=%s\n",  v20,  v21,  v23,  v24 - *(_DWORD *)(a2 + 112),  *(const char **)(v4 + 264));
          else {
            int v27 = v25;
          }
          return (v27 + v17);
        }
      }
    }
  }

  return v9;
}

void sub_100020DB8(uint64_t a1, uint64_t a2, char a3, const void *a4, size_t a5)
{
  uint64_t v10 = a5 + 4;
  unsigned __int8 v11 = (char *)sub_100016B98(a5 + 4);
  if (v11)
  {
    uint64_t v18 = v11;
    *unsigned __int8 v11 = *(_DWORD *)(*(void *)(a1 + 16) + 76LL);
    v11[1] = a3;
    *((_WORD *)v11 + 1) = bswap32(a5) >> 16;
    if (a4 && a5) {
      memcpy(v11 + 4, a4, a5);
    }
    BOOL v19 = sub_100009BF4(*(void *)(a2 + 168));
    if ((*(_BYTE *)(a2 + 25) & 1) == 0) {
      (*(void (**)(uint64_t, uint64_t, void *, uint64_t, BOOL))(a1 + 2384))(a1, a2 + 16, v18, v10, v19);
    }
    free(v18);
  }

  else
  {
    sub_100016E40(4LL, "malloc() failed for ieee802_1x_send(len=%lu)", v12, v13, v14, v15, v16, v17, v10);
  }

uint64_t sub_100020EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 88);
  if (v2)
  {
    *(_BYTE *)(*(void *)(v2 + 232) + 72LL) = 1;
    sub_10001C2B4(v2);
  }

  return 0LL;
}

uint64_t sub_100020EDC(int a1, int a2)
{
  for (uint64_t result = qword_10003C410; result; uint64_t result = *(void *)(result + 112))
  {
    if (*(_DWORD *)result == a1 && *(_DWORD *)(result + 4) == a2) {
      break;
    }
  }

  return result;
}

uint64_t sub_100020F10(char *__s2, _DWORD *a2)
{
  uint64_t v3 = qword_10003C410;
  if (qword_10003C410)
  {
    while (strcmp(*(const char **)(v3 + 8), __s2))
    {
      uint64_t v3 = *(void *)(v3 + 112);
      if (!v3) {
        goto LABEL_4;
      }
    }

    uint64_t result = *(unsigned int *)(v3 + 4);
    *a2 = *(_DWORD *)v3;
  }

  else
  {
LABEL_4:
    uint64_t result = 0LL;
    *a2 = 0;
  }

  return result;
}

_DWORD *sub_100020F70(int a1, int a2, int a3, uint64_t a4)
{
  uint64_t result = sub_100016B98(0x80uLL);
  if (result)
  {
    result[26] = a1;
    *uint64_t result = a2;
    result[1] = a3;
    *((void *)result + 1) = a4;
  }

  return result;
}

uint64_t sub_100020FBC(uint64_t a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *(const char **)(a1 + 8);
  if (!v2 || *(_DWORD *)(a1 + 104) != 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = &qword_10003C410;
  uint64_t v4 = qword_10003C410;
  if (qword_10003C410)
  {
    int v5 = *(_DWORD *)a1;
    while (1)
    {
      uint64_t v6 = v4;
      if (*(_DWORD *)v4 == v5 && *(_DWORD *)(v4 + 4) == *(_DWORD *)(a1 + 4)) {
        return 4294967294LL;
      }
      uint64_t v4 = *(void *)(v6 + 112);
      if (!v4)
      {
        uint64_t v3 = (uint64_t *)(v6 + 112);
        goto LABEL_11;
      }
    }
  }

  else
  {
LABEL_11:
    uint64_t result = 0LL;
    *uint64_t v3 = a1;
  }

  return result;
}

void *sub_100021068()
{
  while (1)
  {
    uint64_t result = (void *)qword_10003C410;
    if (!qword_10003C410) {
      break;
    }
    qword_10003C410 = *(void *)(qword_10003C410 + 112);
    uint64_t v1 = (void (*)(void))result[12];
    if (v1) {
      v1();
    }
    else {
      free(result);
    }
  }

  return result;
}

uint64_t sub_1000210AC(int a1, int a2)
{
  uint64_t v2 = qword_10003C410;
  if (!qword_10003C410) {
    return 0LL;
  }
  while (*(_DWORD *)v2 != a1 || *(_DWORD *)(v2 + 4) != a2)
  {
    uint64_t v2 = *(void *)(v2 + 112);
    if (!v2) {
      return 0LL;
    }
  }

  return *(void *)(v2 + 8);
}

uint64_t sub_1000210E8()
{
  v0 = sub_100020F70(1, 0, 1, (uint64_t)"Identity");
  if (!v0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v1 = v0;
  v0[2] = sub_100021194;
  v0[3] = sub_1000211B4;
  v0[4] = sub_1000211DC;
  v0[5] = sub_1000211E4;
  v0[7] = sub_1000212B8;
  v0[8] = sub_100021300;
  v0[9] = sub_1000213E0;
  v0[11] = sub_1000213F0;
  uint64_t v2 = sub_100020FBC((uint64_t)v0);
  if ((_DWORD)v2) {
    j__free(v1);
  }
  return v2;
}

_DWORD *sub_100021194()
{
  uint64_t result = sub_100016B98(8uLL);
  if (result) {
    *uint64_t result = 0;
  }
  return result;
}

double sub_1000211B4()
{
  v0 = sub_100016B98(8uLL);
  if (v0)
  {
    double result = COERCE_DOUBLE(&_mh_execute_header);
    void *v0 = &_mh_execute_header;
  }

  return result;
}

void sub_1000211DC(int a1, void *a2)
{
}

unint64_t *sub_1000211E4(uint64_t a1, _DWORD *a2, char a3)
{
  int v5 = *(uint64_t (**)(void, size_t *))(*(void *)(a1 + 232) + 8LL);
  if (!v5)
  {
    size_t v19 = 0LL;
    uint64_t v14 = sub_100010024(0, 1u, 0LL, 1, a3);
    if (v14) {
      return v14;
    }
LABEL_6:
    sub_100016E40(4LL, "EAP-Identity: Failed to allocate memory for request", v8, v9, v10, v11, v12, v13, v18);
    uint64_t v14 = 0LL;
    *a2 = 2;
    return v14;
  }

  uint64_t v6 = (const void *)v5(*(void *)(a1 + 216), &v19);
  uint64_t v7 = sub_100010024(0, 1u, v19, 1, a3);
  if (!v7) {
    goto LABEL_6;
  }
  uint64_t v14 = v7;
  if (v6)
  {
    size_t v15 = v19;
    uint64_t v16 = sub_1000175AC(v7, v19, v8, v9, v10, v11, v12, v13);
    memcpy(v16, v6, v15);
  }

  return v14;
}

uint64_t sub_1000212B8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14 = sub_10000FF30(0, 1, a3, &v17, a5, a6, a7, a8);
  uint64_t result = 0LL;
  if (!v14)
  {
    sub_100016E40(2LL, "EAP-Identity: Invalid frame", v8, v9, v10, v11, v12, v13, v16);
    return 1LL;
  }

  return result;
}

unsigned __int8 *sub_100021300( uint64_t a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2[1])
  {
    if (sub_1000212B8(a1, (uint64_t)a2, a3, a4, a5, a6, a7, a8))
    {
      uint64_t result = (unsigned __int8 *)sub_100016E40( 1LL,  "EAP-Identity: failed to pick up already started negotiation",  v11,  v12,  a5,  a6,  a7,  a8,  v19);
LABEL_13:
      int v18 = 2;
      goto LABEL_14;
    }

    a2[1] = 0;
  }

  uint64_t result = (unsigned __int8 *)sub_10000FF30(0, 1, a3, &v20, a5, a6, a7, a8);
  if (!result) {
    return result;
  }
  uint64_t v14 = result;
  sub_100016F80(1LL, "EAP-Identity: Peer identity", result, v20);
  size_t v15 = *(void **)(a1 + 248);
  if (v15) {
    *(_BYTE *)(a1 + 305) = 1;
  }
  free(v15);
  size_t v16 = v20;
  if (v20 <= 1) {
    size_t v17 = 1LL;
  }
  else {
    size_t v17 = v20;
  }
  uint64_t result = (unsigned __int8 *)malloc(v17);
  *(void *)(a1 + 248) = result;
  if (!result) {
    goto LABEL_13;
  }
  uint64_t result = (unsigned __int8 *)memcpy(result, v14, v16);
  *(void *)(a1 + 256) = v16;
  int v18 = 1;
LABEL_14:
  *a2 = v18;
  return result;
}

BOOL sub_1000213E0(uint64_t a1, _DWORD *a2)
{
  return *a2 != 0;
}

BOOL sub_1000213F0(uint64_t a1, _DWORD *a2)
{
  return *a2 == 1;
}

uint64_t sub_100021400(unsigned int *a1, unsigned int *a2, _DWORD *a3)
{
  int v5 = sub_100026F74(a1, 16LL);
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = v5;
  sub_100026FC0(v5, a2, a3);
  sub_100026FC4(v6);
  return 0LL;
}

uint64_t sub_100021458(FILE *a1, const char *a2, uint64_t a3)
{
  fprintf( a1,  "%s  aWhile=%d quietWhile=%d reAuthWhen=%d\n",  a2,  *(_DWORD *)a3,  *(_DWORD *)(a3 + 4),  *(_DWORD *)(a3 + 8));
  if (*(_BYTE *)(a3 + 12)) {
    uint64_t v6 = "TRUE";
  }
  else {
    uint64_t v6 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 13)) {
    uint64_t v7 = "TRUE";
  }
  else {
    uint64_t v7 = "FALSE";
  }
  int v8 = *(_DWORD *)(a3 + 16);
  uint64_t v9 = "Unknown";
  uint64_t v10 = "Authorized";
  if (v8 != 1) {
    uint64_t v10 = "Unknown";
  }
  if (v8 == 2) {
    uint64_t v11 = "Unauthorized";
  }
  else {
    uint64_t v11 = v10;
  }
  if (*(_BYTE *)(a3 + 20)) {
    uint64_t v12 = "TRUE";
  }
  else {
    uint64_t v12 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 21)) {
    uint64_t v13 = "TRUE";
  }
  else {
    uint64_t v13 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 22)) {
    uint64_t v14 = "TRUE";
  }
  else {
    uint64_t v14 = "FALSE";
  }
  size_t v15 = *(_BYTE **)(a3 + 232);
  if (v15[39]) {
    size_t v16 = "TRUE";
  }
  else {
    size_t v16 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 23)) {
    size_t v17 = "TRUE";
  }
  else {
    size_t v17 = "FALSE";
  }
  if (v15[38]) {
    int v18 = "TRUE";
  }
  else {
    int v18 = "FALSE";
  }
  if (v15[40]) {
    uint64_t v19 = "TRUE";
  }
  else {
    uint64_t v19 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 24)) {
    unint64_t v20 = "TRUE";
  }
  else {
    unint64_t v20 = "FALSE";
  }
  if (v15[72]) {
    int v21 = "TRUE";
  }
  else {
    int v21 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 25)) {
    int v22 = "TRUE";
  }
  else {
    int v22 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 26)) {
    int v23 = "TRUE";
  }
  else {
    int v23 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 27)) {
    int v24 = "TRUE";
  }
  else {
    int v24 = "FALSE";
  }
  unsigned int v25 = *(_DWORD *)(a3 + 28) - 1;
  if (v25 <= 2) {
    uint64_t v9 = off_100038BB0[v25];
  }
  if (v15[16]) {
    uint64_t v26 = "TRUE";
  }
  else {
    uint64_t v26 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 32)) {
    int v27 = "TRUE";
  }
  else {
    int v27 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 33)) {
    uint64_t v28 = "TRUE";
  }
  else {
    uint64_t v28 = "FALSE";
  }
  fprintf( a1,  "%s  authAbort=%s authFail=%s authPortStatus=%s authStart=%s\n %s  authTimeout=%s authSuccess=%s eapFail=%s eapolEap=%s\n %s  eapSuccess=%s eapTimeout=%s initialize=%s keyAvailable=%s\n %s  keyDone=%s keyRun=%s keyTxEnabled=%s portControl=%s\n %s  portEnabled=%s portValid=%s reAuthenticate=%s\n",  a2,  v6,  v7,  v11,  v12,  a2,  v13,  v14,  v16,  v17,  a2,  v18,  v19,  v20,  v21,  a2,  v22,  v23,  v24,  v9,  a2,  v26,  v27,  v28);
  uint64_t v29 = *(int *)(a3 + 36);
  else {
    uint64_t v30 = off_100038B60[v29];
  }
  if (*(_BYTE *)(a3 + 40)) {
    uint64_t v31 = "TRUE";
  }
  else {
    uint64_t v31 = "FALSE";
  }
  if (*(_BYTE *)(a3 + 41)) {
    uint64_t v32 = "TRUE";
  }
  else {
    uint64_t v32 = "FALSE";
  }
  if (*(_BYTE *)(*(void *)(a3 + 232) + 24LL)) {
    uint64_t v33 = "TRUE";
  }
  else {
    uint64_t v33 = "FALSE";
  }
  unsigned int v34 = *(_DWORD *)(a3 + 44) - 1;
  if (v34 > 2) {
    __int128 v35 = "Unknown";
  }
  else {
    __int128 v35 = off_100038BB0[v34];
  }
  fprintf( a1,  "%s  Authenticator PAE:\n %s    state=%s\n %s    eapolLogoff=%s eapolStart=%s eapRestart=%s\n %s    portMode=%s reAuthCount=%d\n %s    quietPeriod=%d reAuthMax=%d\n %s    authEntersConnecting=%d\n %s    authEapLogoffsWhileConnecting=%d\n %s    authEntersAuthenticating=%d\n %s    authAuthSuccessesWhileAuthenticating=%d\n %s    authAuthTimeoutsWhileAuthenticating=%d\n %s    authAuthFailWhileAuthenticating=%d\n %s    authAuthEapStartsWhileAuthenticating=%d\n %s    authAuthEapLogoffWhileAuthenticating=%d\n %s    authAuthReauthsWhileAuthenticated=%d\n %s    authAuthEapStartsWhileAuthenticated=%d\n %s    authAuthEapLogoffWhileAuthenticated=%d\n",  a2,  a2,  v30,  a2,  v31,  v32,  v33,  a2,  v35,  *(_DWORD *)(a3 + 48),  a2,  *(_DWORD *)(a3 + 52),  *(_DWORD *)(a3 + 56),  a2,  *(_DWORD *)(a3 + 60),  a2,  *(_DWORD *)(a3 + 64),  a2,  *(_DWORD *)(a3 + 68),  a2,  *(_DWORD *)(a3 + 72),  a2,  *(_DWORD *)(a3 + 76),  a2,  *(_DWORD *)(a3 + 80),  a2,  *(_DWORD *)(a3 + 84),  a2,  *(_DWORD *)(a3 + 88),  a2,  *(_DWORD *)(a3 + 92),  a2,
    *(_DWORD *)(a3 + 96),
    a2,
    *(_DWORD *)(a3 + 100));
  uint64_t v36 = *(int *)(a3 + 104);
  uint64_t v37 = "Unknown";
  __int128 v38 = *(_BYTE **)(a3 + 232);
  if (v38[37]) {
    uint64_t v39 = "TRUE";
  }
  else {
    uint64_t v39 = "FALSE";
  }
  if (v38[36]) {
    uint64_t v40 = "TRUE";
  }
  else {
    uint64_t v40 = "FALSE";
  }
  if (*v38) {
    uint64_t v41 = "TRUE";
  }
  else {
    uint64_t v41 = "FALSE";
  }
  fprintf( a1,  "%s  Backend Authentication:\n %s    state=%s\n %s    eapNoReq=%s eapReq=%s eapResp=%s\n %s    serverTimeout=%d\n %s    backendResponses=%d\n %s    backendAccessChallenges=%d\n %s    backendOtherRequestsToSupplicant=%d\n %s    backendAuthSuccesses=%d\n %s    backendAuthFails=%d\n",  a2,  a2,  v37,  a2,  v39,  v40,  v41,  a2,  *(_DWORD *)(a3 + 108),  a2,  *(_DWORD *)(a3 + 112),  a2,  *(_DWORD *)(a3 + 116),  a2,  *(_DWORD *)(a3 + 120),  a2,  *(_DWORD *)(a3 + 124),  a2,  *(_DWORD *)(a3 + 128));
  uint64_t v42 = "REAUTHENTICATE";
  int v43 = *(_DWORD *)(a3 + 132);
  if (v43 != 1) {
    uint64_t v42 = "Unknown";
  }
  if (!v43) {
    uint64_t v42 = "INITIALIZE";
  }
  if (*(_BYTE *)(a3 + 140)) {
    uint64_t v44 = "TRUE";
  }
  else {
    uint64_t v44 = "FALSE";
  }
  fprintf( a1,  "%s  Reauthentication Timer:\n%s    state=%s\n%s    reAuthPeriod=%d reAuthEnabled=%s\n",  a2,  a2,  v42,  a2,  *(_DWORD *)(a3 + 136),  v44);
  int v45 = *(_DWORD *)(a3 + 144);
  uint64_t v46 = "KEY_TRANSMIT";
  if (v45 != 1) {
    uint64_t v46 = "Unknown";
  }
  if (v45) {
    uint64_t v47 = v46;
  }
  else {
    uint64_t v47 = "NO_KEY_TRANSMIT";
  }
  fprintf(a1, "%s  Authenticator Key Transmit:\n%s    state=%s\n", a2, a2, v47);
  int v48 = *(_DWORD *)(a3 + 148);
  uint64_t v49 = "KEY_RECEIVE";
  if (v48 != 1) {
    uint64_t v49 = "Unknown";
  }
  if (v48) {
    uint64_t v50 = v49;
  }
  else {
    uint64_t v50 = "NO_KEY_RECEIVE";
  }
  if (*(_BYTE *)(a3 + 152)) {
    uint64_t v51 = "TRUE";
  }
  else {
    uint64_t v51 = "FALSE";
  }
  fprintf(a1, "%s  Key Receive:\n%s    state=%s\n%s    rxKey=%s\n", a2, a2, v50, a2, v51);
  uint64_t v52 = "IN_OR_BOTH";
  int v53 = *(_DWORD *)(a3 + 156);
  int v54 = *(_DWORD *)(a3 + 160);
  if (v53 != 1) {
    uint64_t v52 = "Unknown";
  }
  if (!v53) {
    uint64_t v52 = "FORCE_BOTH";
  }
  uint64_t v55 = "In";
  if (v54 == 1) {
    uint64_t v56 = "In";
  }
  else {
    uint64_t v56 = "Unknown";
  }
  if (v54) {
    int v57 = v56;
  }
  else {
    int v57 = "Both";
  }
  int v58 = *(_DWORD *)(a3 + 164);
  if (v58 != 1) {
    uint64_t v55 = "Unknown";
  }
  if (!v58) {
    uint64_t v55 = "Both";
  }
  if (*(_BYTE *)(a3 + 168)) {
    int v59 = "TRUE";
  }
  else {
    int v59 = "FALSE";
  }
  return fprintf( a1,  "%s  Controlled Directions:\n %s    state=%s\n %s    adminControlledDirections=%s operControlledDirections=%s\n %s    operEdge=%s\n",  a2,  a2,  v52,  a2,  v57,  v55,  a2,  v59);
}

uint64_t start(int a1, char *const *a2)
{
  do
    unsigned int v4 = __ldxr((unsigned int *)&unk_10003C418);
  while (__stxr(v4 + 1, (unsigned int *)&unk_10003C418));
  vproc_transaction_begin(0LL);
  int v5 = getopt(a1, a2, "BdhKP:tvl");
  if (v5 < 0)
  {
    v101 = 0LL;
    int v100 = 0;
    int v102 = 0;
    int v7 = optind;
    uint64_t v8 = a1 - optind;
    unint64_t v103 = v8;
    goto LABEL_25;
  }

  int v6 = 0;
  v101 = 0LL;
  int v100 = 0;
  int v102 = 0;
  do
  {
    if (v5 <= 99)
    {
      switch(v5)
      {
        case 'B':
          ++v100;
          break;
        case 'K':
          ++dword_10003C4B0;
          break;
        case 'P':
          free(v101);
          v101 = sub_1000169A0(optarg);
          break;
        default:
          goto LABEL_93;
      }
    }

    else if (v5 <= 107)
    {
      if (v5 != 100) {
        goto LABEL_93;
      }
      ++v102;
      if (dword_10003C010 >= 1) {
        --dword_10003C010;
      }
    }

    else
    {
      switch(v5)
      {
        case 'l':
          int v6 = 1;
          fwrite("started..\n", 0xAuLL, 1uLL, __stderrp);
          break;
        case 't':
          ++dword_10003C014;
          break;
        case 'v':
          sub_100022050();
          exit(1);
        default:
          goto LABEL_93;
      }
    }

    int v5 = getopt(a1, a2, "BdhKP:tvl");
  }

  while ((v5 & 0x80000000) == 0);
  int v7 = optind;
  uint64_t v8 = a1 - optind;
  unint64_t v103 = v8;
  if (!v6)
  {
LABEL_25:
    if (v7 != a1)
    {
      int v9 = 1;
LABEL_27:
      BOOL v104 = malloc(8 * v8);
      if (!v104)
      {
        size_t v16 = "malloc failed\n";
        goto LABEL_33;
      }

      nullsub_2(sub_1000220D4);
      if (sub_100004C68())
      {
        size_t v16 = "Failed to register EAP methods";
LABEL_33:
        sub_100016E40(4LL, v16, v10, v11, v12, v13, v14, v15, v99);
        return 0xFFFFFFFFLL;
      }

      if (sub_100025C3C())
      {
        size_t v16 = "Failed to initialize event loop";
        goto LABEL_33;
      }

      sub_1000265A0(1, (uint64_t)sub_100022374, (uint64_t)&v103, v11, v12, v13, v14, v15);
      sub_1000265A0(30, (uint64_t)sub_1000223F4, (uint64_t)&v103, v18, v19, v20, v21, v22);
      sub_1000265F4((uint64_t)sub_100022440, (uint64_t)&v103, v23, v24, v25, v26, v27, v28);
      openlog("hostapd", 0, 24);
      if (!v103)
      {
LABEL_82:
        CFRunLoopRef Current = CFRunLoopGetCurrent();
        uint64_t v89 = sub_100007458((uint64_t)Current);
        else {
          sub_100026678(v89, v90, v91, v92, v93, v94, v95, v96, v99);
        }
LABEL_85:
        if (v103)
        {
          for (unint64_t i = 0LL; i < v103; ++i)
          {
            uint64_t v98 = *((void *)v104 + i);
            if (!v98) {
              break;
            }
            sub_100022070(v98, v48, v29, v30, v31, v32, v33, v34);
          }
        }

        free(v104);
        sub_100026714();
      }

      uint64_t v35 = 0LL;
      uint64_t v36 = "(null)";
      while (1)
      {
        uint64_t v37 = "/var/run/hostapd.conf";
        if (v9) {
          uint64_t v37 = (&a2[v35])[optind];
        }
        uint64_t v38 = (uint64_t)(v37 ? v37 : v36);
        sub_100016E40(1LL, "Configuration file: %s", v29, v30, v31, v32, v33, v34, v38);
        uint64_t v39 = sub_100016B98(0x8D0uLL);
        uint64_t v46 = (uint64_t)v39;
        if (v39) {
          break;
        }
        sub_100016E40(4LL, "%s failed", v40, v41, v42, v43, v44, v45, (uint64_t)"hostapd_init");
LABEL_78:
        *((void *)v104 + v35) = v46;
        if (!*((void *)v104 + v35)) {
          goto LABEL_85;
        }
        if (++v35 >= v103) {
          goto LABEL_82;
        }
      }

      _OWORD v39[2] = sub_100003B40;
      v39[3] = sub_100017820;
      if (v37) {
        uint64_t v47 = strdup(v37);
      }
      else {
        uint64_t v47 = 0LL;
      }
      *(void *)(v46 + memset(&v9[1], 0, 32) = v47;
      *(void *)(v46 + 22memset(&v9[1], 0, 32) = sub_10001A2C8;
      *(void *)(v46 + 2240) = sub_10001AC48;
      *(void *)(v46 + 2248) = sub_10002246C;
      uint64_t v49 = sub_100017820(v47);
      if (v49)
      {
        uint64_t v56 = (void *)v49;
        int v57 = v36;
        *(void *)(v46 + 40) = v49;
        uint64_t v58 = *(void *)(v49 + 16);
        *(void *)(v46 + 48) = v58;
        int v59 = (uint64_t **)sub_100016B98(8 * v58);
        *(void *)(v46 + 56) = v59;
        if (v59)
        {
          if (v56[2])
          {
            uint64_t v66 = 0LL;
            unint64_t v67 = 0LL;
            do
            {
              unsigned __int8 v68 = sub_100004958(v46, (uint64_t)v56, *v56 + v66);
              *(void *)(*(void *)(v46 + 56) + 8 * v67) = v68;
              if (!v68) {
                goto LABEL_73;
              }
              v68[322] = v68;
              ++v67;
              v66 += 760LL;
            }

            while (v67 < v56[2]);
            int v59 = *(uint64_t ***)(v46 + 56);
          }

          *(void *)uint64_t v46 = &v103;
          uint64_t v69 = *v59;
          uint64_t v70 = (*v59)[2];
          uint64_t v36 = v57;
          if (v102 >= 1)
          {
            int v71 = *(_DWORD *)(v70 + 40);
            int v72 = v102;
            do
            {
              if (v71) {
                *(_DWORD *)(v70 + 40) = --v71;
              }
              --v72;
            }

            while (v72);
          }

          uint64_t v73 = v69[294];
          if (v73 && *(void *)(v73 + 320))
          {
            uint64_t v74 = v70 + 736;
            __int128 v106 = 0u;
            __int128 v107 = 0u;
            v105[0] = v74;
            v105[1] = v70;
            uint64_t v75 = *(void *)(v70 + 192);
            v105[2] = v70 + 152;
            v105[3] = v75;
            v105[4] = *(void *)(v70 + 688);
            LODWORD(v106) = *(_DWORD *)(v70 + 696);
            *(void *)&__int128 v107 = *(void *)(*v69 + 48);
            uint64_t v76 = sub_100016B98(8 * v107);
            *((void *)&v106 + 1) = v76;
            if (v76)
            {
              uint64_t v77 = *v69;
              if (*(void *)(*v69 + 48))
              {
                unint64_t v78 = 0LL;
                do
                {
                  uint64_t v79 = *(void *)(*(void *)(*(void *)(v77 + 56) + 8 * v78) + 16LL);
                  int v81 = *(unsigned __int8 *)(v79 + 17);
                  uint64_t v80 = v79 + 17;
                  if (v81)
                  {
                    v76[v78] = v80;
                    uint64_t v77 = *v69;
                  }

                  ++v78;
                }

                while (v78 < *(void *)(v77 + 48));
              }

              *((void *)&v107 + 1) = (char *)v69 + 28;
              v69[295] = (*(uint64_t (**)(uint64_t *, void *))(v69[294] + 320))(v69, v105);
              free(*((void **)&v106 + 1));
              if (v69[295])
              {
              }

              else
              {
                sub_100016E40( 4LL,  "%s driver initialization failed.",  v82,  v83,  v84,  v85,  v86,  v87,  *(void *)v69[294]);
                v69[294] = 0LL;
              }
            }
          }

          else
          {
            sub_100016E40(4LL, "No hostapd driver wrapper available", v60, v61, v62, v63, v64, v65, v99);
          }

          sub_100022070(v46, v48, v29, v30, v31, v32, v33, v34);
          goto LABEL_77;
        }

LABEL_73:
        sub_100016E40(4LL, "%s failed", v60, v61, v62, v63, v64, v65, (uint64_t)"hostapd_init");
        sub_100002374((uint64_t)v56);
        uint64_t v36 = v57;
      }

      else
      {
        sub_100016E40(4LL, "%s failed", v50, v51, v52, v53, v54, v55, (uint64_t)"hostapd_init");
      }

      free(*(void **)(v46 + 32));
      free(*(void **)(v46 + 56));
      free((void *)v46);
LABEL_77:
      uint64_t v46 = 0LL;
      goto LABEL_78;
    }

LABEL_93:
    sub_10002201C();
  }

  uint64_t v8 = 1LL;
  unint64_t v103 = 1LL;
  if (sub_100007320())
  {
    int v9 = 0;
    goto LABEL_27;
  }

  return 0xFFFFFFFFLL;
}

void sub_10002201C()
{
}

size_t sub_100022050()
{
  return fwrite( "hostapd v0.7.2\n User space daemon for IEEE 802.11 AP management,\n IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator\n Copyright (c) 2002-2010, Jouni Malinen <j@w1.fi> and contributors\n",  0xB0uLL,  1uLL,  __stderrp);
}

void sub_100022070( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = **(void **)(a1 + 56);
  if (v9)
  {
    uint64_t v10 = *(void *)(v9 + 2352);
    uint64_t v11 = *(void *)(v9 + 2360);
    sub_100004A74(a1, a2, a3, a4, a5, a6, a7, a8);
    if (v10)
    {
      uint64_t v12 = *(void (**)(uint64_t))(v10 + 328);
      if (v12) {
        v12(v11);
      }
    }

    sub_100004B4C(a1);
  }

  else
  {
    sub_100004A74(a1, a2, a3, a4, a5, a6, a7, a8);
    __break(1u);
  }

void sub_1000220D4(uint64_t a1, unsigned __int8 *a2, int a3, signed int a4, uint64_t a5, int a6)
{
  size_t v10 = a6 + 100;
  uint64_t v11 = (char *)malloc(v10);
  if (!v11) {
    return;
  }
  uint64_t v12 = v11;
  if (a1 && (uint64_t v13 = *(_DWORD **)(a1 + 16)) != 0LL)
  {
    signed int v14 = v13[10];
    signed int v19 = v13[9];
    int v16 = v13[11];
    int v15 = v13[12];
  }

  else
  {
    signed int v19 = 0;
    signed int v14 = 0;
    int v16 = -1;
    int v15 = -1;
  }

  if (a3 <= 15)
  {
    switch(a3)
    {
      case 1:
        goto LABEL_19;
      case 2:
        if (!a1) {
          goto LABEL_26;
        }
        goto LABEL_20;
      case 4:
        if (!a1) {
          goto LABEL_26;
        }
        goto LABEL_20;
      case 8:
        if (!a1) {
          goto LABEL_26;
        }
        goto LABEL_20;
      default:
        goto LABEL_25;
    }
  }

  if (a3 == 16 || a3 == 32 || a3 == 64)
  {
LABEL_19:
    if (!a1) {
      goto LABEL_26;
    }
  }

  else
  {
LABEL_25:
    if (!a1) {
      goto LABEL_26;
    }
  }

LABEL_20:
  uint64_t v17 = *(void *)(a1 + 16);
  if (a2 && v17)
  {
    snprintf(v11, v10, "%s: STA %02x:%02x:%02x:%02x:%02x:%02x%s%s: %s", v17, *a2, a2[1], a2[2]);
    goto LABEL_29;
  }

  if (!v17)
  {
LABEL_26:
    if (a2) {
      snprintf(v11, v10, "STA %02x:%02x:%02x:%02x:%02x:%02x%s%s: %s", *a2, a2[1], a2[2], a2[3]);
    }
    else {
      snprintf(v11, v10, "%s%s%s");
    }
    goto LABEL_29;
  }

  snprintf(v11, v10, "%s:%s%s %s");
LABEL_29:
  if ((v15 & a3) != 0 && v14 <= a4)
  {
    sub_100016E14();
    puts(v12);
  }

  if ((v16 & a3) != 0 && v19 <= a4)
  {
    else {
      int v18 = dword_10002BCA0[a4];
    }
    syslog(v18, "%s", v12);
  }

  free(v12);
}

uint64_t sub_100022374( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = sub_100016E40(1LL, "Signal %d received - reloading configuration", a3, a4, a5, a6, a7, a8, a1);
  if (*a2)
  {
    unint64_t v10 = 0LL;
    do
    {
      uint64_t result = sub_100003B40(*(void *)(a2[1] + 8 * v10));
      if ((result & 0x80000000) != 0) {
        uint64_t result = sub_100016E40( 3LL,  "Failed to read new configuration file - continuing with old.",  v11,  v12,  v13,  v14,  v15,  v16,  v17);
      }
      ++v10;
    }

    while (v10 < *a2);
  }

  return result;
}

void sub_1000223F4( uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*a2)
  {
    unint64_t v9 = 0LL;
    do
    {
      ++v9;
    }

    while (v9 < *a2);
  }

void sub_100022440( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t sub_10002246C(void *a1, uint64_t (*a2)(void, uint64_t), uint64_t a3)
{
  if (!*a1) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t result = a2(*(void *)(a1[1] + 8 * v6), a3);
    if ((_DWORD)result) {
      break;
    }
  }

  return result;
}

uint64_t sub_1000224CC( uint64_t a1, uint64_t a2, int a3, const ether_addr *a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  __int128 v39 = 0u;
  __int128 v38 = 0u;
  memset(&v37[2], 0, 80);
  v37[0] = 1;
  if (a10)
  {
    uint64_t v14 = *(os_log_s **)(a2 + 824);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (a4) {
        uint64_t v15 = ether_ntoa(a4);
      }
      else {
        uint64_t v15 = "ff:ff:ff:ff:ff:ff";
      }
      int v29 = 136446978;
      uint64_t v30 = v15;
      __int16 v31 = 1024;
      int v32 = a5;
      __int16 v33 = 1024;
      int v34 = a10;
      __int16 v35 = 1024;
      int v36 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Setting key for %{public}s (idx=%d, len=%u) algo %d",  (uint8_t *)&v29,  0x1Eu);
    }
  }

  switch(a3)
  {
    case 0:
      goto LABEL_16;
    case 1:
      if (a10 == 5)
      {
        int v16 = 1;
      }

      else
      {
        if (a10 != 13) {
          return 0xFFFFFFFFLL;
        }
        int v16 = 2;
      }

      __darwin_time_t v37[2] = v16;
      goto LABEL_24;
    case 2:
      a3 = 3;
      goto LABEL_16;
    case 3:
      goto LABEL_15;
    case 4:
      if ((a5 & 0xFFFFFFFE) != 4)
      {
        uint64_t v17 = *(os_log_s **)(a2 + 824);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v29 = 67109120;
          LODWORD(v30) = a5;
          int v18 = "Wrong key index (%d) for iGTK";
LABEL_20:
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v29, 8u);
        }

        return 0xFFFFFFFFLL;
      }

LABEL_15:
      a3 = 5;
LABEL_16:
      __darwin_time_t v37[2] = a3;
      if (a10 > 0x40) {
        return 0xFFFFFFFFLL;
      }
LABEL_24:
      v37[1] = a10;
      LOWORD(v37[3]) = 12;
      if (!a4)
      {
        WORD4(v38) = -1;
        DWORD1(v38) = -1;
        HIWORD(v37[3]) = a5;
        LOWORD(v37[3]) = 28;
        if (!(_DWORD)a10) {
          goto LABEL_34;
        }
        goto LABEL_33;
      }

      if (!(_DWORD)a10 || *(_DWORD *)(a2 + 832) != 2)
      {
LABEL_32:
        DWORD1(v38) = *(_DWORD *)a4->octet;
        WORD4(v38) = *(_WORD *)&a4->octet[4];
        HIWORD(v37[3]) = a5;
        if (!(_DWORD)a10)
        {
LABEL_34:
          *(_DWORD *)(a2 + 792) = 3;
          *(_DWORD *)(a2 + 800) = 148;
          *(void *)(a2 + 808) = v37;
          return Apple80211RawSet(*(void *)(a2 + 816), a2 + 776);
        }

          sub_10002A374();
          goto LABEL_31;
        }
      }

      else if (sub_10000C1C0(*(void *)(v12 + 2624), (uint64_t)v23, a3, a3[1] + 2LL, 0LL, 0LL, v20, v21))
      {
        if (!os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
          goto LABEL_31;
        }
        goto LABEL_15;
      }
    }

    int v34 = *(_DWORD *)(v22 + 24);
    *(_DWORD *)(v22 + 24) = v34 | 3;
    __int16 v35 = *(void *)(v22 + 168);
    *(_BYTE *)(v35 + 600) = 0;
    *(_OWORD *)(v35 + 568) = 0u;
    *(_OWORD *)(v35 + 584) = 0u;
    *(_OWORD *)(v35 + 536) = 0u;
    *(_OWORD *)(v35 + 552) = 0u;
    *(_OWORD *)(v35 + 504) = 0u;
    *(_OWORD *)(v35 + 520) = 0u;
    *(_OWORD *)(v35 + 472) = 0u;
    *(_OWORD *)(v35 + 488) = 0u;
    *(_OWORD *)(v35 + 440) = 0u;
    *(_OWORD *)(v35 + 456) = 0u;
    *(_OWORD *)(v35 + 408) = 0u;
    *(_OWORD *)(v35 + 424) = 0u;
    *(_OWORD *)(v35 + 376) = 0u;
    *(_OWORD *)(v35 + 392) = 0u;
    *(_OWORD *)(v35 + 344) = 0u;
    *(_OWORD *)(v35 + 360) = 0u;
    if (a4)
    {
      if (*a4) {
        memcpy((void *)(*(void *)(v22 + 168) + 344LL), a4, a4[1] + 2LL);
      }
    }

    sub_100009508(*(void *)(v22 + 168), 1);
    sub_1000049BC(v12, v22, (v34 >> 1) & 1);
    sub_100020AC8(*(void *)(v22 + 88), 1);
  }

  else if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR))
  {
    sub_10002A2C4();
  }

uint64_t sub_100022824(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a1 + 792) = 1;
  *(_DWORD *)(a1 + 800) = 0;
  *(void *)(a1 + 808) = a2;
  if ((Apple80211RawGet(*(void *)(a1 + 816), a1 + 776) & 0x80000000) == 0 && *(_DWORD *)(a1 + 800) < 0x21u) {
    return 0LL;
  }
  uint64_t v3 = *(os_log_s **)(a1 + 824);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000295FC(v3);
  }
  return 0xFFFFFFFFLL;
}

uint64_t sub_10002289C(uint64_t a1, _OWORD *a2)
{
  uint64_t v3 = sub_100016B98(0x348uLL);
  if (!v3)
  {
    BOOL v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v7) {
      sub_100029670(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    return 0LL;
  }

  uint64_t v4 = (uint64_t)v3;
  v3[192] = -1;
  int v5 = os_log_create("com.apple.hostapd", "driver");
  *(void *)(v4 + 824) = v5;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136446210;
    int v25 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Starting darwin init for %{public}s", buf, 0xCu);
  }

  memcpy((void *)v4, &off_10003C028, 0x2D8uLL);
  int v6 = socket(2, 2, 0);
  *(_DWORD *)(v4 + 768) = v6;
  if (v6 < 0)
  {
    uint64_t v15 = *(void **)(v4 + 824);
    if (!os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      if (!v15)
      {
LABEL_14:
        free((void *)v4);
        return 0LL;
      }

LABEL_13:
      os_release(v15);
      goto LABEL_14;
    }

    sub_1000296A4((os_log_s *)v15);
    goto LABEL_24;
  }

  *(_OWORD *)(v4 + 736) = *a2;
  if (strlen((const char *)(v4 + 736)) >= 0x10)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029718();
    }
    goto LABEL_24;
  }

  __strcpy_chk(v4 + 776, v4 + 736, 16LL);
  if ((sub_100023D9C((const char *)(v4 + 736), (uint64_t)&v23) & 0x80000000) != 0)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029744();
    }
    goto LABEL_24;
  }

  uint64_t v17 = sub_100010280(v4 + 736, &v23, 34958, (uint64_t)sub_100023E54, v4, 1);
  *(void *)(v4 + 760) = v17;
  if (!v17) {
    goto LABEL_24;
  }
  *(_DWORD *)(v4 + 792) = 15;
  *(_DWORD *)(v4 + 800) = 0;
  if (Apple80211RawGet(*(void *)(v4 + 816), v4 + 776))
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 824), OS_LOG_TYPE_ERROR)) {
      sub_1000297D0();
    }
    goto LABEL_24;
  }

  int v19 = *(_DWORD *)(v4 + 796);
  if (v19 != 2)
  {
    if (v19 == 8)
    {
      *(_DWORD *)(v4 + 8memset(&v9[1], 0, 32) = 8;
      uint64_t v20 = *(os_log_s **)(v4 + 824);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_36;
      }
      *(_WORD *)buf = 0;
      unint64_t v21 = "Operating mode is hostap";
      goto LABEL_35;
    }

    if (os_log_type_enabled(*(os_log_t *)(v4 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029770();
    }
LABEL_24:
    int v18 = *(_DWORD *)(v4 + 768);
    if ((v18 & 0x80000000) == 0) {
      close(v18);
    }
    uint64_t v15 = *(void **)(v4 + 824);
    if (!v15) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }

  *(_DWORD *)(v4 + 8memset(&v9[1], 0, 32) = 2;
  uint64_t v20 = *(os_log_s **)(v4 + 824);
  if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_36;
  }
  *(_WORD *)buf = 0;
  unint64_t v21 = "Operating mode is ibss";
LABEL_35:
  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
LABEL_36:
  if ((sub_100023EB8(v4) & 0x80000000) != 0)
  {
    perror("Open event sockets");
    goto LABEL_24;
  }

  unint64_t v22 = *(os_log_s **)(v4 + 824);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    int v25 = a2;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Darwin init success for %{public}s", buf, 0xCu);
  }

  return v4;
}

void sub_100022C18(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 728) + 2352LL) = 0LL;
  int v9 = *(_DWORD *)(a1 + 768);
  if ((v9 & 0x80000000) == 0) {
    close(v9);
  }
  uint64_t v10 = *(uint64_t **)(a1 + 760);
  if (v10) {
    sub_1000105A0(v10, v2, v3, v4, v5, v6, v7, v8);
  }
  uint64_t v11 = *(void **)(a1 + 824);
  if (v11) {
    os_release(v11);
  }
  free((void *)a1);
}

uint64_t sub_100022C68(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  size_t v9 = a5 + 14;
  if (a5 + 14 < 0x5EB)
  {
    uint64_t v12 = &v18;
    uint64_t v13 = &v17;
    uint64_t v11 = v16;
  }

  else
  {
    uint64_t v10 = (char *)malloc(a5 + 14);
    if (!v10) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v11 = v10;
    uint64_t v12 = (int *)(v10 + 14);
    uint64_t v13 = (int *)(v11 + 6);
  }

  *(_DWORD *)uint64_t v11 = *(_DWORD *)a2;
  *((_WORD *)v11 + 2) = *(_WORD *)(a2 + 4);
  *uint64_t v13 = *(_DWORD *)(a1 + 752);
  *((_WORD *)v13 + 2) = *(_WORD *)(a1 + 756);
  *((_WORD *)v11 + 6) = -29048;
  memcpy(v12, a4, a5);
  uint64_t v14 = sub_100010198(*(void *)(a1 + 760), a2, 0x888Eu, v11, v9);
  if (v11 != v16) {
    free(v11);
  }
  return v14;
}

uint64_t sub_100022D80(uint64_t a1, uint64_t a2, int a3)
{
  *(_DWORD *)(a1 + 792) = 1;
  *(_DWORD *)(a1 + 800) = a3;
  *(void *)(a1 + 808) = a2;
  return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
}

uint64_t sub_100022DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100016B98(0x348uLL);
  if (!v4)
  {
    BOOL v10 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v10) {
      sub_1000297FC(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    return 0LL;
  }

  uint64_t v5 = (uint64_t)v4;
  v4[192] = -1;
  uint64_t v6 = os_log_create("com.apple.hostapd", "driver");
  *(void *)(v5 + 824) = v6;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a2 + 8);
    *(_DWORD *)buf = 136446210;
    uint64_t v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting hostapd init for %{public}s", buf, 0xCu);
  }

  memcpy((void *)v5, &off_10003C028, 0x2D8uLL);
  *(void *)(v5 + 728) = a1;
  int v8 = socket(2, 2, 0);
  *(_DWORD *)(v5 + 768) = v8;
  if (v8 < 0)
  {
    uint64_t v26 = "Opening IOCTL socket";
LABEL_27:
    perror(v26);
    goto LABEL_28;
  }

  *(_OWORD *)(v5 + 736) = *(_OWORD *)*(void *)(a1 + 16);
  int v9 = *(_DWORD *)(a1 + 28);
  *(_WORD *)(v5 + 756) = *(_WORD *)(a1 + 32);
  *(_DWORD *)(v5 + 752) = v9;
  if ((sub_100023EB8(v5) & 0x80000000) != 0)
  {
    uint64_t v26 = "Open event sockets";
    goto LABEL_27;
  }

  if (strlen((const char *)(v5 + 736)) >= 0x10)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029830();
    }
    goto LABEL_28;
  }

  sub_100016BA4((_BYTE *)(v5 + 776), v5 + 736, 16LL);
  if ((sub_100023D9C((const char *)(v5 + 736), (uint64_t)&v38) & 0x80000000) != 0)
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029744();
    }
    goto LABEL_28;
  }

  int v18 = v38;
  *(_DWORD *)(v5 + 752) = v38;
  __int16 v19 = v39;
  *(_WORD *)(v5 + 756) = v39;
  uint64_t v20 = *(void *)(a1 + 16);
  *(_DWORD *)(v20 + 736) = v18;
  *(_WORD *)(v20 + 740) = v19;
  *(_WORD *)(a1 + memset(&v9[1], 0, 32) = v19;
  *(_DWORD *)(a1 + 28) = v18;
  uint64_t v21 = sub_100010280(v5 + 736, &v38, 34958, (uint64_t)sub_100023E54, v5, 1);
  *(void *)(v5 + 760) = v21;
  if (!v21)
  {
LABEL_28:
    int v27 = *(_DWORD *)(v5 + 768);
    if ((v27 & 0x80000000) == 0) {
      close(v27);
    }
    uint64_t v28 = *(void **)(v5 + 824);
    if (v28) {
      os_release(v28);
    }
    free((void *)v5);
    return 0LL;
  }

  *(_DWORD *)(v5 + 792) = 15;
  *(_DWORD *)(v5 + 800) = 0;
  if (Apple80211RawGet(*(void *)(v5 + 816), v5 + 776))
  {
    if (os_log_type_enabled(*(os_log_t *)(v5 + 824), OS_LOG_TYPE_ERROR)) {
      sub_1000298C4();
    }
    goto LABEL_28;
  }

  int v22 = *(_DWORD *)(v5 + 796);
  if (v22 != 2 && v22 != 8)
  {
    uint64_t v30 = *(os_log_s **)(v5 + 824);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_10002985C(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    goto LABEL_28;
  }

  *(_DWORD *)(v5 + 8memset(&v9[1], 0, 32) = v22;
  *(void *)(a1 + 2352) = v5;
  sub_100024FE0(v5 + 736, 1);
  int v23 = *(os_log_s **)(v5 + 824);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v24 = *(void *)(a2 + 8);
    int v25 = "IBSS";
    if (*(_DWORD *)(v5 + 832) == 8) {
      int v25 = "AP";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v41 = v24;
    __int16 v42 = 2082;
    uint64_t v43 = v25;
    _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "hostapd started for %{public}s in %{public}s mode",  buf,  0x16u);
  }

  return v5;
}

void sub_100023118(uint64_t a1)
{
  uint64_t v9 = *(void *)(a1 + 728);
  if (v9) {
    *(void *)(v9 + 2352) = 0LL;
  }
  int v10 = *(_DWORD *)(a1 + 768);
  if ((v10 & 0x80000000) == 0) {
    close(v10);
  }
  sub_1000105A0(*(uint64_t **)(a1 + 760), v2, v3, v4, v5, v6, v7, v8);
  if (*(void *)(a1 + 816)) {
    Apple80211Close();
  }
  sub_1000252DC();
  free((void *)a1);
}

uint64_t sub_100023174(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 728);
  uint64_t v4 = *(_DWORD **)(v3 + 16);
  if (a2) {
    int v5 = *(_DWORD *)(a2 + 8);
  }
  else {
    int v5 = 0;
  }
  uint64_t v6 = *(os_log_s **)(a1 + 824);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = "enabled";
    if (!v5) {
      int v10 = "disabled";
    }
    *(_DWORD *)uint64_t v36 = 136315138;
    *(void *)&v36[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "802.1x: %s.", v36, 0xCu);
  }

  int v11 = v4[121];
  if (v11 || v4[18])
  {
    __int128 v44 = 0u;
    memset(v43, 0, sizeof(v43));
    __int128 v42 = 0u;
    __int128 v41 = 0u;
    __int128 v40 = 0u;
    __int128 v39 = 0u;
    __int128 v38 = 0u;
    __int128 v37 = 0u;
    *(_OWORD *)&v36[4] = 0u;
    *(_DWORD *)uint64_t v36 = 1;
    if (v5 && *(_DWORD *)(a1 + 832) == 8)
    {
      if (v11)
      {
        int v12 = v4[127];
        switch(v12)
        {
          case 1:
            int v13 = 0;
            goto LABEL_24;
          case 2:
            int v13 = 1;
            goto LABEL_24;
          case 3:
          case 5:
          case 6:
          case 7:
            goto LABEL_19;
          case 4:
            int v13 = 2;
            goto LABEL_24;
          case 8:
            int v13 = 3;
            goto LABEL_24;
          default:
            if (v12 != 16)
            {
LABEL_19:
              if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
                sub_100029924();
              }
              return 0xFFFFFFFFLL;
            }

            int v13 = 5;
LABEL_24:
            if ((v11 & 1) != 0) {
              *(_DWORD *)&v36[4] = v13;
            }
            if ((v11 & 2) != 0) {
              LODWORD(v41) = v13;
            }
            int v15 = v4[126];
            if ((v15 & 0x10) != 0)
            {
              if ((v11 & 1) != 0)
              {
                *(void *)&v36[8] = 0x500000001LL;
                int v16 = 1;
              }

              else
              {
                int v16 = 0;
              }

              if ((v11 & 2) != 0) {
                *(void *)((char *)&v41 + 4) = 0x500000001LL;
              }
            }

            else
            {
              int v16 = 0;
            }

            if ((v15 & 8) != 0)
            {
              if ((v11 & 1) != 0)
              {
                uint64_t v17 = &v36[4 * v16++];
                *(_DWORD *)&v36[8] = v16;
                *((_DWORD *)v17 + 3) = 3;
              }

              if ((v11 & 2) != 0)
              {
                int v18 = &v36[4 * DWORD1(v41)];
                ++DWORD1(v41);
                *((_DWORD *)v18 + 23) = 3;
              }
            }

            if ((v15 & 4) != 0)
            {
              if ((v11 & 1) != 0)
              {
                __int16 v19 = &v36[4 * v16++];
                *(_DWORD *)&v36[8] = v16;
                *((_DWORD *)v19 + 3) = 2;
              }

              if ((v11 & 2) != 0)
              {
                uint64_t v20 = &v36[4 * DWORD1(v41)];
                ++DWORD1(v41);
                *((_DWORD *)v20 + 23) = 2;
              }
            }

            if ((v15 & 1) != 0)
            {
              if ((v11 & 1) != 0)
              {
                uint64_t v21 = &v36[4 * v16++];
                *(_DWORD *)&v36[8] = v16;
                *((_DWORD *)v21 + 3) = 1;
              }

              if ((v11 & 2) != 0)
              {
                int v22 = &v36[4 * DWORD1(v41)];
                ++DWORD1(v41);
                *((_DWORD *)v22 + 23) = 1;
              }
            }

            if (!(v16 | DWORD1(v41)))
            {
              if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
                sub_100029984();
              }
              return 0xFFFFFFFFLL;
            }

            if (v4[133])
            {
              __int16 v23 = 1;
              WORD6(v44) = 1;
            }

            else
            {
              __int16 v23 = 0;
            }

            int v24 = v4[123];
            if (v24)
            {
              __int16 v25 = v24 == 2 ? 192 : 128;
              v23 |= v25;
              WORD6(v44) = v23;
              if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
                sub_100029AAC();
              }
            }

            int v26 = v4[122];
            if ((v26 & 1) != 0)
            {
              int v27 = v4[121];
              if ((v27 & 1) != 0)
              {
                uint64_t v28 = &v36[4 * DWORD2(v38)];
                ++DWORD2(v38);
                *((_DWORD *)v28 + 12) = 1;
              }

              if ((v27 & 2) != 0)
              {
                int v29 = &v36[4 * DWORD2(v43[0])];
                ++DWORD2(v43[0]);
                *((_DWORD *)v29 + memset(&v9[1], 0, 32) = 4;
              }
            }

            if ((v26 & 2) != 0)
            {
              int v30 = v4[121];
              if ((v30 & 1) != 0)
              {
                uint64_t v31 = &v36[4 * DWORD2(v38)];
                ++DWORD2(v38);
                *((_DWORD *)v31 + 12) = 2;
              }

              if ((v30 & 2) != 0)
              {
                uint64_t v32 = &v36[4 * DWORD2(v43[0])];
                ++DWORD2(v43[0]);
                *((_DWORD *)v32 + memset(&v9[1], 0, 32) = 8;
              }
            }

            uint64_t v33 = DWORD2(v43[0]);
            int v34 = DWORD2(v43[0]);
            if ((v26 & 0x400) != 0)
            {
              int v34 = ++DWORD2(v43[0]);
              *((_DWORD *)v43 + v33 + 3) = 4096;
              __int16 v35 = (v26 & 2) != 0 ? 128 : 192;
              WORD6(v44) = v23 | v35;
              if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
                sub_100029A48();
              }
            }

            if (!(DWORD2(v38) | v34))
            {
              if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
                sub_1000299E4();
              }
              return 0xFFFFFFFFLL;
            }

            break;
        }
      }

      *(_DWORD *)(a1 + 792) = 77;
      *(_DWORD *)(a1 + 800) = 164;
      *(void *)(a1 + 808) = v36;
      return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    sub_1000172B0(v3, 0LL, 16LL, 4LL, "No 802.1X or WPA enabled!", v7, v8, v9, *(uint64_t *)v36);
    return 0xFFFFFFFFLL;
  }

uint64_t sub_10002362C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  __int128 v19 = 0u;
  __int128 v18 = 0u;
  __int128 v17 = 0u;
  __int128 v16 = 0u;
  __int128 v15 = 0u;
  __int128 v14 = 0u;
  __int128 v13 = 0u;
  __int128 v12 = 0u;
  __int128 v11 = 0u;
  int v10 = 1;
  if (a3)
  {
    DWORD2(v16) = *(_DWORD *)a3;
    WORD6(v16) = *(_WORD *)(a3 + 4);
  }

  else
  {
    WORD6(v16) = -1;
    DWORD2(v16) = -1;
  }

  WORD5(v11) = a4;
  *(_DWORD *)(a2 + 792) = 78;
  *(_DWORD *)(a2 + 800) = 148;
  *(void *)(a2 + 808) = &v10;
  if ((Apple80211RawGet(*(void *)(a2 + 816), a2 + 776) & 0x80000000) != 0)
  {
    uint64_t v9 = *(os_log_s **)(a2 + 824);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100029B10(a4, v9);
    }
    return 0xFFFFFFFFLL;
  }

  else
  {
    uint64_t result = 0LL;
    *a5 = v16;
  }

  return result;
}

uint64_t sub_10002374C(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 80) = 0LL;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_DWORD *)(a1 + 792) = 79;
  return 0LL;
}

uint64_t sub_100023770(uint64_t a1, uint64_t a2, const void *a3, size_t a4, uint64_t a5, uint64_t a6)
{
  size_t v11 = a4 + 14;
  if (a4 + 14 < 0x5EB)
  {
    __int128 v13 = v24;
  }

  else
  {
    __int128 v12 = malloc(a4 + 14);
    if (!v12) {
      return 0xFFFFFFFFLL;
    }
    __int128 v13 = v12;
  }

  *(_DWORD *)__int128 v13 = *(_DWORD *)a2;
  *((_WORD *)v13 + 2) = *(_WORD *)(a2 + 4);
  *(_DWORD *)(v13 + 6) = *(_DWORD *)a6;
  *((_WORD *)v13 + 5) = *(_WORD *)(a6 + 4);
  *((_WORD *)v13 + 6) = -29048;
  memcpy(v13 + 14, a3, a4);
  sub_100016EB0(0LL, "TX EAPOL", v13, v11);
  sub_100016E40(4LL, "darwin_hapd_send_eapol", v14, v15, v16, v17, v18, v19, v23);
  uint64_t v20 = *(os_log_s **)(a1 + 824);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    LOWORD(v23) = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "darwin_hapd_send_eapol", (uint8_t *)&v23, 2u);
  }

  uint64_t v21 = sub_100010198(*(void *)(a1 + 760), a2, 0x888Eu, v13, v11);
  if (v13 != v24) {
    free(v13);
  }
  return v21;
}

uint64_t sub_1000238E8(uint64_t a1, const ether_addr *a2, unsigned int a3, int a4)
{
  uint64_t v7 = sub_1000059B4(*(void *)(a1 + 728), (uint64_t)a2);
  if (v7)
  {
    if (a4) {
      uint64_t v14 = *(_DWORD *)(v7 + 24) | a3;
    }
    else {
      uint64_t v14 = *(_DWORD *)(v7 + 24) & ~a3;
    }
    *(_DWORD *)(v7 + 24) = v14;
  }

  else
  {
    if (a2) {
      uint64_t v15 = ether_ntoa(a2);
    }
    else {
      uint64_t v15 = "ff:ff:ff:ff:ff:ff";
    }
    sub_100016E40(4LL, " Error %s darwin_hapd_get_sta_state is not found", v8, v9, v10, v11, v12, v13, (uint64_t)v15);
    return 0xFFFFFFFFLL;
  }

  return v14;
}

uint64_t sub_10002397C(uint64_t a1, const ether_addr *a2)
{
  uint64_t v3 = sub_1000059B4(*(void *)(a1 + 728), (uint64_t)a2);
  if (v3) {
    return *(unsigned int *)(v3 + 24);
  }
  if (a2) {
    uint64_t v11 = ether_ntoa(a2);
  }
  else {
    uint64_t v11 = "ff:ff:ff:ff:ff:ff";
  }
  sub_100016E40(4LL, " Error %s darwin_hapd_get_sta_state is not found", v4, v5, v6, v7, v8, v9, (uint64_t)v11);
  return 0xFFFFFFFFLL;
}

uint64_t sub_1000239E4(uint64_t a1, uint64_t a2, const ether_addr *a3, unsigned int a4)
{
  __int128 v10 = xmmword_10002BD40;
  if (*(_DWORD *)a3->octet != -1 || *(__int16 *)&a3->octet[4] != -1)
  {
    uint64_t v8 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      uint64_t v12 = ether_ntoa(a3);
      __int16 v13 = 1024;
      unsigned int v14 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "STA %{public}s deauthed, reason_code=%d\n",  buf,  0x12u);
    }
  }

  *(void *)((char *)&v10 + 4) = __PAIR64__(*(_DWORD *)a3->octet, a4);
  WORD6(v10) = *(_WORD *)&a3->octet[4];
  *(_DWORD *)(a1 + 792) = 76;
  *(_DWORD *)(a1 + 800) = 16;
  *(void *)(a1 + 808) = &v10;
  return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
}

uint64_t sub_100023AF8(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  __int128 v5 = xmmword_10002BD40;
  *(void *)((char *)&v5 + 4) = __PAIR64__(*(_DWORD *)a3, a4);
  WORD6(v5) = *(_WORD *)(a3 + 4);
  *(_DWORD *)(a1 + 792) = 75;
  *(_DWORD *)(a1 + 800) = 16;
  *(void *)(a1 + 808) = &v5;
  return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
}

double sub_100023B54(uint64_t a1, _OWORD *a2)
{
  char v9 = 0;
  __int128 v7 = 0u;
  __int128 v8 = 0u;
  *(_DWORD *)(a1 + 792) = 1;
  *(_DWORD *)(a1 + 800) = 0;
  *(void *)(a1 + 808) = &v7;
  if ((Apple80211RawGet(*(void *)(a1 + 816), a1 + 776) & 0x80000000) != 0 || *(_DWORD *)(a1 + 800) >= 0x21u)
  {
    uint64_t v4 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100029BAC(v4);
    }
  }

  else
  {
    double result = *(double *)&v7;
    __int128 v6 = v8;
    *a2 = v7;
    a2[1] = v6;
  }

  return result;
}

uint64_t sub_100023C14(uint64_t a1, uint64_t a2, int a3)
{
  int v4 = a3;
  *(_DWORD *)(a1 + 792) = 1;
  *(_DWORD *)(a1 + 800) = &v4;
  *(void *)(a1 + 808) = a2;
  return Apple80211RawSet(*(void *)(a1 + 816), a1 + 776);
}

uint64_t sub_100023C54(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  __int128 v15 = xmmword_10002BD28;
  int v16 = 0;
  char v9 = *(os_log_s **)(a1 + 824);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v10 = ether_ntoa((const ether_addr *)a2);
    int v11 = a4 & 1;
    uint64_t v12 = "AUTHORIZED";
    if (!v11) {
      uint64_t v12 = "DEAUTHORIZED";
    }
    *(_DWORD *)buf = 136446466;
    uint64_t v18 = v10;
    __int16 v19 = 2082;
    uint64_t v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "STA %{public}s %{public}s.", buf, 0x16u);
    if (v11) {
      goto LABEL_5;
    }
  }

  else if ((a4 & 1) != 0)
  {
LABEL_5:
    int v13 = 1;
LABEL_9:
    DWORD1(v15) = v13;
    goto LABEL_10;
  }

  if ((a5 & 1) == 0)
  {
    int v13 = 0;
    goto LABEL_9;
  }

uint64_t sub_100023D9C(const char *a1, uint64_t a2)
{
  if (getifaddrs(&v10) < 0)
  {
    perror("getifaddrs");
    return 0xFFFFFFFFLL;
  }

  else
  {
    int v4 = v10;
    if (v10)
    {
      __int128 v5 = v10;
      while (1)
      {
        if (!strcmp(v5->ifa_name, a1))
        {
          ifa_addr = v5->ifa_addr;
          if (ifa_addr->sa_family == 18) {
            break;
          }
        }

        __int128 v5 = v5->ifa_next;
        __int128 v10 = v5;
        if (!v5) {
          goto LABEL_9;
        }
      }

      __int128 v7 = &ifa_addr->sa_len + ifa_addr->sa_data[3];
      int v8 = *((_DWORD *)v7 + 2);
      *(_WORD *)(a2 + 4) = *((_WORD *)v7 + 6);
      *(_DWORD *)a2 = v8;
    }

LABEL_9:
    freeifaddrs(v4);
    if (v10) {
      return 0LL;
    }
    else {
      return 0xFFFFFFFFLL;
    }
  }

void sub_100023E54( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12 = *(void *)(a1 + 728);
  uint64_t v13 = sub_1000059B4(v12, a2);
  if (v13)
  {
    if ((*(_BYTE *)(v13 + 24) & 2) != 0) {
      sub_10001FB00(v12, a2, (unsigned __int8 *)(a3 + 14), a4 - 14, v14, v15, v16, v17, a9);
    }
  }

uint64_t sub_100023EB8(uint64_t a1)
{
  uint64_t v2 = (void *)(a1 + 816);
  if (Apple80211Open(a1 + 816))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_10002A118();
    }
    goto LABEL_9;
  }

  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)(a1 + 736), 0x8000100u);
  if (!v3) {
    goto LABEL_9;
  }
  CFStringRef v4 = v3;
  int v5 = Apple80211BindToInterface(*v2);
  if (v5)
  {
    int v6 = v5;
    __int128 v7 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10002A094(a1 + 736, v6, v7);
    }
    CFRelease(v4);
    goto LABEL_9;
  }

  CFRelease(v4);
  if (!*v2)
  {
    __int128 v10 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100029CF4(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    goto LABEL_9;
  }

  if (Apple80211EventMonitoringInit2(*v2, sub_100024278, a1, &_dispatch_main_q))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_10002A034();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 1LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 49LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      goto LABEL_41;
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 8LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
LABEL_41:
    }
      sub_100029FD4();
LABEL_9:
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029C94();
    }
    if (*v2) {
      Apple80211Close();
    }
    int v8 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100029C20(v8);
    }
    return 0xFFFFFFFFLL;
  }

  if (Apple80211StartMonitoringEvent(*v2, 2LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029F74();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 4LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029F14();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 12LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029EB4();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 13LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029E54();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*v2, 20LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029DF4();
    }
    goto LABEL_9;
  }

  if (Apple80211StartMonitoringEvent(*(void *)(a1 + 816), 152LL))
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
      sub_100029D94();
    }
    goto LABEL_9;
  }

  uint64_t result = os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_DEBUG);
  if ((_DWORD)result)
  {
    sub_100029D5C();
    return 0LL;
  }

  return result;
}

void sub_100024278(int a1, uint64_t a2, int a3, const void *a4, size_t __size, uint64_t a6)
{
  int v7 = __size;
  if (__size <= 0x1000)
  {
    if ((_DWORD)__size)
    {
      size_t v12 = __size;
      uint64_t v13 = malloc(__size);
      if (!v13)
      {
        if (os_log_type_enabled(*(os_log_t *)(a6 + 824), OS_LOG_TYPE_ERROR)) {
          sub_10002A178();
        }
        return;
      }
    }

    else
    {
      size_t v12 = 0LL;
      uint64_t v13 = 0LL;
    }

    memcpy(v13, a4, v12);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000LL;
    block[2] = sub_1000243A0;
    block[3] = &unk_100038C08;
    int v17 = a1;
    int v18 = a3;
    block[4] = a2;
    block[5] = v13;
    int v19 = v7;
    block[6] = a6;
    CFRunLoopPerformBlock(Current, kCFRunLoopDefaultMode, block);
    uint64_t v15 = CFRunLoopGetCurrent();
    CFRunLoopWakeUp(v15);
    return;
  }

  if (os_log_type_enabled(*(os_log_t *)(a6 + 824), OS_LOG_TYPE_ERROR)) {
    sub_10002A1A4();
  }
}

void sub_1000243A0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = *(_DWORD *)(a1 + 60);
  unsigned int v9 = *(_DWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  if (v8 <= 48)
  {
    switch(v8)
    {
      case 8:
        *(_DWORD *)(v11 + 792) = 15;
        *(_DWORD *)(v11 + 800) = 0;
        int v24 = Apple80211RawGet(*(void *)(v11 + 816), v11 + 776);
        if (v24 == 82)
        {
          int v26 = *(os_log_s **)(v11 + 824);
          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_69;
          }
          LOWORD(v58) = 0;
          uint64_t v20 = "Terminating because power is off";
          goto LABEL_67;
        }

        if (!v24)
        {
          int v25 = *(_DWORD *)(v11 + 796);
          int v26 = *(os_log_s **)(v11 + 824);
          if ((v25 & 0xA) != 0)
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
              break;
            }
            int v58 = 67109120;
            *(_DWORD *)int v59 = v25;
            uint64_t v14 = "Mode changed: 0x%x";
            uint64_t v15 = v26;
            os_log_type_t v16 = OS_LOG_TYPE_INFO;
LABEL_18:
            uint32_t v17 = 8;
LABEL_19:
            _os_log_impl((void *)&_mh_execute_header, v15, v16, v14, (uint8_t *)&v58, v17);
            break;
          }

          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_69;
          }
          LOWORD(v58) = 0;
          uint64_t v20 = "Terminating because operating mode changed";
LABEL_67:
          uint64_t v21 = v26;
          uint32_t v22 = 2;
          goto LABEL_68;
        }

        if (os_log_type_enabled(*(os_log_t *)(v11 + 824), OS_LOG_TYPE_ERROR)) {
          sub_10002A264();
        }
        break;
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
      case 17:
        goto LABEL_16;
      case 12:
        if (v9 <= 5)
        {
          if (!os_log_type_enabled(*(os_log_t *)(v11 + 824), OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_30;
        }

        if (!v10) {
          return;
        }
        uint64_t v31 = (unsigned __int8 *)(v10 + 16);
        uint64_t v29 = *(void *)(a1 + 48);
        uint64_t v30 = v10;
        uint64_t v28 = 0LL;
        goto LABEL_42;
      case 13:
        if (v9 <= 5)
        {
          if (!os_log_type_enabled(*(os_log_t *)(v11 + 824), OS_LOG_TYPE_ERROR)) {
            break;
          }
          goto LABEL_30;
        }

        if (!v10) {
          return;
        }
        sub_100024A64(*(void *)(a1 + 48), 13, (ether_addr *)v10, 0LL, 0LL, a6, a7, a8);
        goto LABEL_71;
      case 18:
      case 19:
        size_t v12 = *(os_log_s **)(v11 + 824);
        if (v9 <= 0x25)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
LABEL_30:
          }
            sub_10002A204();
          break;
        }

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          if (v8 == 18) {
            int v27 = "arrived";
          }
          else {
            int v27 = "left";
          }
          int v58 = 136446466;
          *(void *)int v59 = v27;
          *(_WORD *)&v59[8] = 2082;
          *(void *)&v59[10] = ether_ntoa((const ether_addr *)v10);
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received peer %{public}s annoucement (%{public}s)",  (uint8_t *)&v58,  0x16u);
        }

        if (v8 != 18)
        {
          sub_100024A64(v11, v8, (ether_addr *)v10, 0LL, 0LL, a6, a7, a8);
          break;
        }

        if (*(_BYTE *)(v10 + 7))
        {
          if (*(_DWORD *)(v11 + 832) == 2)
          {
            uint64_t v28 = (unsigned __int8 *)(v10 + 6);
            uint64_t v29 = v11;
            uint64_t v30 = v10;
            uint64_t v31 = 0LL;
LABEL_42:
            sub_100024C24(v29, v30, v28, v31, a5, a6, a7, a8);
          }

          goto LABEL_71;
        }

        uint64_t v48 = *(os_log_s **)(v11 + 824);
        if (!os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_71;
        }
        uint64_t v49 = ether_ntoa((const ether_addr *)v10);
        int v58 = 136315138;
        *(void *)int v59 = v49;
        uint64_t v50 = "No RSN IE present for %s. Ignoring.";
        uint64_t v51 = v48;
        uint32_t v52 = 12;
        goto LABEL_76;
      default:
        if (v8 == 1) {
          goto LABEL_12;
        }
        goto LABEL_16;
    }

LABEL_70:
    if (!v10) {
      return;
    }
    goto LABEL_71;
  }

  if (v8 == 49)
  {
LABEL_12:
    int v18 = *(os_log_s **)(v11 + 824);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = "APPLE80211_M_RESET_INTERFACE";
      if (v8 == 1) {
        int v19 = "APPLE80211_M_POWER_CHANGED";
      }
      int v58 = 136446210;
      *(void *)int v59 = v19;
      uint64_t v20 = "Got %{public}s event, terminating";
      uint64_t v21 = v18;
      uint32_t v22 = 12;
LABEL_68:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v58, v22);
    }

LABEL_69:
    sub_1000266B8();
    goto LABEL_70;
  }

  if (v8 != 152)
  {
LABEL_16:
    uint64_t v23 = *(os_log_s **)(v11 + 824);
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    int v58 = 67109120;
    *(_DWORD *)int v59 = v8;
    uint64_t v14 = "Unexpected Apple80211 Event %ud \n";
    uint64_t v15 = v23;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_18;
  }

  if (v9 <= 0x6B)
  {
    uint64_t v13 = *(os_log_s **)(v11 + 824);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_70;
    }
    int v58 = 67109376;
    *(_DWORD *)int v59 = v9;
    *(_WORD *)&v59[4] = 2048;
    *(void *)&v59[6] = 108LL;
    uint64_t v14 = "AUTH_IND event len (%d) is less than required (%ld)";
    uint64_t v15 = v13;
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    uint32_t v17 = 18;
    goto LABEL_19;
  }

  if (v10)
  {
    uint64_t v32 = *(void *)(v11 + 728);
    if (v32)
    {
      uint64_t v33 = *(void *)(v32 + 16);
      if (v33)
      {
        uint64_t v34 = *(void *)(v32 + 2624);
        if (v34)
        {
          if (*(_DWORD *)(v10 + 20) == 32)
          {
            if ((*(_BYTE *)(v33 + 489) & 4) == 0 || *(_DWORD *)v10 != 5) {
              goto LABEL_71;
            }
            __int16 v35 = *(os_log_s **)(v11 + 824);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              int v37 = *(unsigned __int8 *)(v10 + 12);
              int v38 = *(unsigned __int8 *)(v10 + 13);
              int v39 = *(unsigned __int8 *)(v10 + 14);
              int v40 = *(unsigned __int8 *)(v10 + 15);
              int v41 = *(unsigned __int8 *)(v10 + 16);
              int v42 = *(unsigned __int8 *)(v10 + 17);
              int v43 = *(unsigned __int8 *)(v10 + 92);
              int v44 = *(unsigned __int8 *)(v10 + 93);
              int v45 = *(unsigned __int8 *)(v10 + 106);
              int v46 = *(unsigned __int8 *)(v10 + 107);
              int v58 = 67111424;
              *(_DWORD *)int v59 = v37;
              *(_WORD *)&v59[4] = 1024;
              *(_DWORD *)&v59[6] = v38;
              *(_WORD *)&v59[10] = 1024;
              *(_DWORD *)&v59[12] = v39;
              *(_WORD *)&v59[16] = 1024;
              *(_DWORD *)uint64_t v60 = v40;
              *(_WORD *)&v60[4] = 1024;
              int v61 = v41;
              __int16 v62 = 1024;
              int v63 = v42;
              __int16 v64 = 1024;
              int v65 = v43;
              __int16 v66 = 1024;
              int v67 = v44;
              __int16 v68 = 1024;
              int v69 = v45;
              __int16 v70 = 1024;
              int v71 = v46;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "AUTH_IND to add PMKSA for %02X:%02X:%02X:%02X:%02X:%02X PMKID %2X%2X-%2X%2X\n",  (uint8_t *)&v58,  0x3Eu);
              uint64_t v34 = *(void *)(*(void *)(v11 + 728) + 2624LL);
              size_t v47 = *(unsigned int *)(v10 + 20);
            }

            else
            {
              size_t v47 = 32LL;
            }

            if (!sub_100009E40( v34,  (void *)(v10 + 24),  v47,  (_OWORD *)(v10 + 92),  v34 + 288,  v10 + 12,  0xFFFFFFFFLL,  v36)) {
              goto LABEL_71;
            }
            int v57 = *(os_log_s **)(v11 + 824);
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_71;
            }
            LOWORD(v58) = 0;
            uint64_t v50 = "AUTH_IND failed to add PMKSA \n";
            uint64_t v51 = v57;
            uint32_t v52 = 2;
            goto LABEL_76;
          }
        }
      }

      uint64_t v54 = *(os_log_s **)(v11 + 824);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = *(void *)(v32 + 2624);
LABEL_75:
        int v56 = *(_DWORD *)(v10 + 20);
        int v58 = 134218496;
        *(void *)int v59 = v32;
        *(_WORD *)&v59[8] = 2048;
        *(void *)&v59[10] = v55;
        *(_WORD *)uint64_t v60 = 1024;
        *(_DWORD *)&v60[2] = v56;
        uint64_t v50 = "AUTH_IND cannot set PMKSA. hapd is %p. wpa_auth is %p PMK length %d \n";
        uint64_t v51 = v54;
        uint32_t v52 = 28;
LABEL_76:
        _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v50, (uint8_t *)&v58, v52);
      }
    }

    else
    {
      uint64_t v54 = *(os_log_s **)(v11 + 824);
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = 0LL;
        goto LABEL_75;
      }
    }

LABEL_71:
    free((void *)v10);
    return;
  }

  uint64_t v53 = *(os_log_s **)(v11 + 824);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v58) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v53,  OS_LOG_TYPE_DEFAULT,  "AUTH_IND has no payload \n",  (uint8_t *)&v58,  2u);
  }

void sub_100024A64( uint64_t a1, int a2, ether_addr *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  switch(a2)
  {
    case 12:
      uint64_t v21 = (uint64_t)a3;
      uint32_t v22 = 0LL;
      uint64_t v23 = (unsigned __int8 *)a5;
      goto LABEL_13;
    case 13:
    case 19:
      uint64_t v10 = *(void *)(a1 + 728);
      uint64_t v11 = *(void *)(v10 + 16);
      sub_1000172B0(v10, a3->octet, 1LL, 2LL, "disassociated", a6, a7, a8, *(uint64_t *)v24);
      size_t v12 = *(os_log_s **)(a1 + 824);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)int v24 = 136446210;
        *(void *)&v24[4] = ether_ntoa(a3);
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "STA %{public}s disassociated", v24, 0xCu);
      }

      uint64_t v13 = sub_1000059B4(v10, (uint64_t)a3);
      if (v13)
      {
        uint64_t v14 = v13;
        *(_DWORD *)(v13 + 24) &= 0xFFFFFFFC;
        if (*(_DWORD *)(v11 + 484)) {
          sub_100009508(*(void *)(v13 + 168), 2);
        }
        *(_DWORD *)(v14 + 124) = 1;
        sub_100020AC8(*(void *)(v14 + 88), 0);
        sub_100005A04(v10, (unsigned __int16 *)v14, v15, v16, v17, v18, v19, v20);
      }

      nullsub_2(v13);
      break;
    case 18:
      if (*(_DWORD *)(a1 + 832) == 2)
      {
        uint64_t v21 = (uint64_t)a3;
        uint32_t v22 = a4;
        uint64_t v23 = 0LL;
LABEL_13:
        sub_100024C24(a1, v21, v22, v23, a5, a6, a7, a8);
      }

      break;
    default:
      return;
  }

void sub_100024C24( uint64_t a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = *(void *)(a1 + 728);
  uint64_t v13 = *(void *)(v12 + 16);
  sub_1000172B0(v12, (unsigned __int8 *)a2, 1LL, 2LL, "associated", a6, a7, a8, v36);
  uint64_t v14 = *(os_log_s **)(a1 + 824);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v36) = 136446210;
    *(void *)((char *)&v36 + 4) = ether_ntoa((const ether_addr *)a2);
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "STA %{public}s associated",  (uint8_t *)&v36,  0xCu);
  }

  if (a4)
  {
    uint64_t v15 = *(os_log_s **)(a1 + 824);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = *a4;
      int v17 = a4[1];
      int v18 = a4[2];
      LODWORD(v36) = 67109632;
      DWORD1(v36) = v16;
      WORD4(v36) = 1024;
      *(_DWORD *)((char *)&v36 + 10) = v17;
      HIWORD(v36) = 1024;
      *(_DWORD *)int v37 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "STA RSNXE: %x ,%x, %x",  (uint8_t *)&v36,  0x14u);
    }
  }

  uint64_t v19 = sub_1000063B0(v12, a2);
  if (v19)
  {
    uint64_t v22 = (uint64_t)v19;
    if (*(_DWORD *)(v13 + 484))
    {
      uint64_t v23 = (_WORD *)*((void *)v19 + 21);
      if (!v23)
      {
        uint64_t v23 = sub_100007F68(*(uint64_t **)(v12 + 2624), v19 + 4);
        *(void *)(v22 + 168) = v23;
        if (!v23)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
            sub_10002A2F0();
          }
          goto LABEL_31;
        }
      }

      if (*(_DWORD *)(a1 + 832) == 8)
      {
        bzero((char *)&v36 + 8, 0x408uLL);
        int v24 = *(_DWORD *)a2;
        LODWORD(v36) = 1;
        DWORD1(v36) = v24;
        WORD4(v36) = *(_WORD *)(a2 + 4);
        HIDWORD(v36) = 1024;
        *(_DWORD *)(a1 + 792) = 73;
        *(_DWORD *)(a1 + 800) = 1040;
        *(void *)(a1 + 808) = &v36;
        if ((Apple80211RawGet(*(void *)(a1 + 816), a1 + 776) & 0x80000000) != 0)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
            sub_10002A31C();
          }
          goto LABEL_31;
        }

        if (!v37[1])
        {
          if (os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR)) {
            sub_10002A348();
          }
          goto LABEL_31;
        }

        uint64_t v25 = v37[1] + 2LL;
        sub_100016F74(1LL, "WPA/RSN IE ", v37, v25);
        if (sub_10000C1C0(*(void *)(v12 + 2624), *(void *)(v22 + 168), v37, v25, 0LL, 0LL, v26, v27))
        {
          if (!os_log_type_enabled(*(os_log_t *)(a1 + 824), OS_LOG_TYPE_ERROR))
          {
LABEL_31:
            sub_100005A04(v12, (unsigned __int16 *)v22, v28, v29, v30, v31, v32, v33);
            return;
          }

uint64_t sub_100024FE0(unint64_t a1, int a2)
{
  int v4 = socket(30, 2, 0);
  if (v4 < 0)
  {
    uint64_t v13 = __error();
    strerror(*v13);
    return sub_100016E40( 4LL,  "%s: socket(AF_INET6,SOCK_DGRAM) failed: %s",  v14,  v15,  v16,  v17,  v18,  v19,  (uint64_t)"set_interface_up");
  }

  else
  {
    int v5 = v4;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    sub_100016BA4(&v34, a1, 16LL);
    if (ioctl(v5, 0xC0206911uLL, &v34))
    {
      int v6 = __error();
      strerror(*v6);
      sub_100016E40( 4LL,  "%s: ioctl(SIOCGIFFLAGS) failed for interface %s: %s",  v7,  v8,  v9,  v10,  v11,  v12,  (uint64_t)"set_interface_up");
    }

    else
    {
      LOWORD(v35) = v35 & 0xFFFE | (a2 != 0);
      if (ioctl(v5, 0x80206910uLL, &v34))
      {
        uint64_t v27 = __error();
        strerror(*v27);
        sub_100016E40( 4LL,  "%s: ioctl(SIOCSIFFLAGS) failed for interface %s: %s",  v28,  v29,  v30,  v31,  v32,  v33,  (uint64_t)"set_interface_up");
      }

      else
      {
        sub_100016E40( 4LL,  "%s: IFF_UP is set to %d for interface %s",  v21,  v22,  v23,  v24,  v25,  v26,  (uint64_t)"set_interface_up");
      }
    }

    return close(v5);
  }

void sub_10002515C( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_10002516C(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_100025180( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

  ;
}

int *sub_1000251C0()
{
  return __error();
}

uint64_t sub_1000251C8(const char *a1, const char *a2)
{
  dword_10003C4D8 = 0;
  dword_10003C300 = getpid();
  qword_10003C4B8 = (uint64_t)asl_open(a1, a2, 0);
  if (!qword_10003C4B8) {
    return 0xFFFFFFFFLL;
  }
  int v4 = asl_open(a1, a2, 0);
  qword_10003C4C0 = (uint64_t)v4;
  if (!qword_10003C4B8) {
    return 0xFFFFFFFFLL;
  }
  asl_set_filter(v4, 255);
  int v5 = asl_new(0);
  qword_10003C4C8 = (uint64_t)v5;
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  asl_set(v5, "Sender", a1);
  int v6 = asl_new(0);
  qword_10003C4D0 = (uint64_t)v6;
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  asl_set(v6, "Sender", a1);
  if (dword_10003C304 < 0) {
    dword_10003C304 = open("/dev/io8log", 1);
  }
  size_t v7 = strlen(a1);
  qword_10003C4E0 = (uint64_t)malloc(v7 + 1);
  strcpy((char *)qword_10003C4E0, a1);
  return 0LL;
}

uint64_t sub_1000252DC()
{
  if (qword_10003C4C8) {
    asl_free((asl_object_t)qword_10003C4C8);
  }
  if (qword_10003C4D0) {
    asl_free((asl_object_t)qword_10003C4D0);
  }
  if (qword_10003C4B8) {
    asl_close((asl_object_t)qword_10003C4B8);
  }
  if (qword_10003C4C0) {
    asl_close((asl_object_t)qword_10003C4C0);
  }
  if (qword_10003C4E0) {
    free((void *)qword_10003C4E0);
  }
  uint64_t result = dword_10003C304;
  if ((dword_10003C304 & 0x80000000) == 0)
  {
    uint64_t result = close(dword_10003C304);
    dword_10003C304 = -1;
  }

  return result;
}

BOOL sub_10002535C()
{
  int v0 = dword_10003C304;
  if (dword_10003C304 < 0)
  {
    int v0 = open("/dev/io8log", 1);
    dword_10003C304 = v0;
  }

  return v0 >= 0;
}

uint64_t sub_10002539C()
{
  uint64_t result = dword_10003C304;
  if ((dword_10003C304 & 0x80000000) == 0)
  {
    uint64_t result = close(dword_10003C304);
    dword_10003C304 = -1;
  }

  return result;
}

void sub_1000253CC(uint64_t a1, char *cStr, ...)
{
  if (!qword_10003C4C8) {
    sub_1000251C8("Apple80211 framework", "Daemon");
  }
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (v3)
  {
    int v4 = v3;
    va_copy(v18, va);
    CFStringRef v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v3, va);
    if (!v5)
    {
LABEL_16:
      CFRelease(v4);
      return;
    }

    int v6 = v5;
    time_t v17 = time(0LL);
    size_t v7 = localtime(&v17);
    uint64_t v8 = asctime(v7);
    v8[strlen(v8) - 6] = 0;
    uint64_t v9 = getpid();
    uint64_t v10 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%s: (%d) %@\n", v8, v9, v6);
    if (!v10)
    {
      close(1);
      uint64_t v11 = v6;
      goto LABEL_15;
    }

    uint64_t v11 = v10;
    CFIndex Length = CFStringGetLength(v10);
    CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
    CFIndex v14 = MaximumSizeForEncoding + 1;
    if ((unint64_t)(MaximumSizeForEncoding + 1) < 0x101)
    {
      uint64_t v15 = v19;
      CFIndex v14 = 256LL;
    }

    else
    {
      uint64_t v15 = (char *)malloc(MaximumSizeForEncoding + 1);
      if (!v15)
      {
LABEL_14:
        close(1);
        CFRelease(v6);
LABEL_15:
        CFRelease(v11);
        goto LABEL_16;
      }
    }

    if (CFStringGetCString(v11, v15, v14, 0x8000100u))
    {
      size_t v16 = strlen(v15);
      write(1, v15, v16);
    }

    if (v15 != v19) {
      free(v15);
    }
    goto LABEL_14;
  }

void sub_100025598(char *cStr, va_list a2)
{
  if (!cStr) {
    return;
  }
  if (dword_10003C304 < 0) {
    return;
  }
  CFStringRef v3 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
  if (!v3) {
    return;
  }
  int v4 = v3;
  CFStringRef v5 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v3, a2);
  if (!v5)
  {
    CFRelease(v4);
    return;
  }

  int v6 = v5;
  CFIndex Length = CFStringGetLength(v5);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v9 = MaximumSizeForEncoding + 1;
  if ((unint64_t)(MaximumSizeForEncoding + 1) < 0x101)
  {
    uint64_t v10 = v12;
    CFIndex v9 = 256LL;
LABEL_9:
    if (CFStringGetCString(v6, v10, v9, 0x8000100u))
    {
      size_t v11 = strlen(v10);
      write(dword_10003C304, v10, v11);
    }

    goto LABEL_11;
  }

  uint64_t v10 = (char *)malloc(MaximumSizeForEncoding + 1);
  if (v10) {
    goto LABEL_9;
  }
LABEL_11:
  CFRelease(v4);
  CFRelease(v6);
  if (v10)
  {
    if (v10 != v12) {
      free(v10);
    }
  }

void sub_1000256F4( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
}

uint64_t sub_10002571C( uint64_t result, char *value, const char *a3, const char *a4, const char *a5, const char *a6, const char *a7, const char *a8, float a9, float a10, float a11, const char *a12, char a13)
{
  __int16 v23 = result;
  if (((result & 1) == 0 || value)
    && ((result & 2) == 0 || a3)
    && ((result & 4) == 0 || a4)
    && ((result & 8) == 0 || a5)
    && ((result & 0x10) == 0 || a6)
    && ((result & 0x200) == 0 || a8)
    && ((result & 0x400) == 0 || a12)
    && ((result & 0x20) == 0 || a7))
  {
    if (!qword_10003C4D0) {
      uint64_t result = sub_1000251C8("Apple80211 framework", "Daemon");
    }
    if ((v23 & 1) != 0)
    {
      uint64_t result = asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.domain", value);
      if ((v23 & 2) != 0) {
        uint64_t result = asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.domain.version", a3);
      }
      if ((v23 & 4) != 0)
      {
        asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.signature", a4);
        if ((v23 & 8) != 0)
        {
          asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.signature2", a5);
          if ((v23 & 0x10) == 0)
          {
LABEL_25:
            if ((v23 & 0x20) == 0) {
              goto LABEL_26;
            }
            goto LABEL_30;
          }
        }

        else if ((v23 & 0x10) == 0)
        {
          goto LABEL_25;
        }

        asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.signature3", a6);
        if ((v23 & 0x20) == 0)
        {
LABEL_26:
          if ((v23 & 0x40) == 0) {
            goto LABEL_37;
          }
LABEL_31:
          double v24 = a9;
          int v25 = snprintf(0LL, 0LL, "%f", v24);
          if (v25 < 0x102)
          {
            int v26 = 256;
            uint64_t v27 = v44;
          }

          else
          {
            int v26 = v25;
            uint64_t v27 = (char *)malloc(v25 + 1LL);
          }

          snprintf(v27, v26, "%f", v24);
          asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.value", v27);
          if (v27 && v27 != v44) {
            free(v27);
          }
LABEL_37:
          if ((v23 & 0x80) != 0)
          {
            double v28 = a10;
            int v29 = snprintf(0LL, 0LL, "%f", v28);
            if (v29 < 0x102)
            {
              size_t v30 = 256LL;
              uint64_t v31 = v44;
            }

            else
            {
              size_t v30 = v29;
              uint64_t v31 = (char *)malloc(v29 + 1LL);
            }

            snprintf(v31, v30, "%f", v28);
            asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.value2", v31);
            if (v31)
            {
              if (v31 != v44) {
                free(v31);
              }
            }
          }

          if ((v23 & 0x100) != 0)
          {
            double v32 = a11;
            int v33 = snprintf(0LL, 0LL, "%f", v32);
            if (v33 < 0x102)
            {
              size_t v34 = 256LL;
              __int128 v35 = v44;
            }

            else
            {
              size_t v34 = v33;
              __int128 v35 = (char *)malloc(v33 + 1LL);
            }

            snprintf(v35, v34, "%f", v32);
            asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.value3", v35);
            if (v35)
            {
              if (v35 != v44) {
                free(v35);
              }
            }
          }

          if ((v23 & 0x200) != 0) {
            asl_set((asl_object_t)qword_10003C4D0, "com.apple.message.uuid", a8);
          }
          if ((v23 & 0x400) == 0)
          {
            asl_log((asl_object_t)qword_10003C4C0, (asl_object_t)qword_10003C4D0, 7, " ");
LABEL_67:
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.domain");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.domain.version");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.uuid");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.result");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.signature");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.signature2");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.signature3");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.value");
            asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.value2");
            return asl_unset((asl_object_t)qword_10003C4D0, "com.apple.message.value3");
          }

          __int128 v36 = CFStringCreateWithCString(kCFAllocatorDefault, a12, 0x8000100u);
          if (!v36) {
            goto LABEL_67;
          }
          int v37 = v36;
          int v38 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, v36, &a13);
          if (!v38)
          {
LABEL_66:
            CFRelease(v37);
            goto LABEL_67;
          }

          int v39 = v38;
          CFIndex Length = CFStringGetLength(v38);
          CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
          CFIndex v42 = MaximumSizeForEncoding + 1;
          if ((unint64_t)(MaximumSizeForEncoding + 1) < 0x101)
          {
            int v43 = v44;
            CFIndex v42 = 256LL;
          }

          else
          {
            int v43 = (char *)malloc(MaximumSizeForEncoding + 1);
            if (!v43)
            {
LABEL_65:
              CFRelease(v39);
              goto LABEL_66;
            }
          }

          if (CFStringGetCString(v39, v43, v42, 0x8000100u)) {
            asl_log((asl_object_t)qword_10003C4C0, (asl_object_t)qword_10003C4D0, 7, "%s", v43);
          }
          if (v43 != v44) {
            free(v43);
          }
          goto LABEL_65;
        }

void sub_100025C30()
{
  dword_10003C4D8 = 0;
}

uint64_t sub_100025C3C()
{
  sub_100016E40(1LL, "%s pid = %u", v0, v1, v2, v3, v4, v5, (uint64_t)"eloop_init");
  xmmword_10003C480 = 0u;
  unk_10003C490 = 0u;
  xmmword_10003C450 = 0u;
  *(_OWORD *)&qword_10003C460 = 0u;
  xmmword_10003C430 = 0u;
  *(_OWORD *)&dword_10003C440 = 0u;
  xmmword_10003C420 = 0u;
  *(void *)&xmmword_10003C470 = &xmmword_10003C470;
  *((void *)&xmmword_10003C470 + 1) = &xmmword_10003C470;
  return 0LL;
}

uint64_t sub_100025CA4(CFSocketNativeHandle a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100025CB8(a1, 0, a2, a3, a4);
}

uint64_t sub_100025CB8(CFSocketNativeHandle a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFSocketNativeHandle v59 = a1;
  CFRunLoopGetCurrent();
  sub_100016E40( 1LL,  "%s, Current run loop = %p, sock=%d, type = %d",  v10,  v11,  v12,  v13,  v14,  v15,  (uint64_t)"eloop_register_sock");
  if (a2 == 1)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    double v24 = 0LL;
    CFAbsoluteTime valuePtr = Current;
    __int16 v23 = &dword_10003C440;
    CFOptionFlags v25 = 8LL;
  }

  else if (a2)
  {
    sub_100016E40(4LL, "%s, unsupported socket type (%d)", v16, v17, v18, v19, v20, v21, (uint64_t)"eloop_register_sock");
    double v32 = CFAbsoluteTimeGetCurrent();
    CFOptionFlags v25 = 0LL;
    CFAbsoluteTime valuePtr = v32;
    if (a2 != 2)
    {
      double v24 = 0LL;
      goto LABEL_12;
    }

    CFAbsoluteTime Current = v32;
    __int16 v23 = (int *)&xmmword_10003C450 + 2;
    double v24 = 0LL;
  }

  else
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFAbsoluteTime valuePtr = Current;
    __int16 v23 = (int *)&xmmword_10003C420 + 2;
    double v24 = (void (__cdecl *)(CFSocketRef, CFSocketCallBackType, CFDataRef, const void *, void *))sub_100026008;
    CFOptionFlags v25 = 1LL;
  }

  int v33 = (char *)realloc(*((void **)v23 + 1), 40LL * *v23 + 40);
  if (!v33)
  {
LABEL_12:
    sub_100016E40(4LL, "%s Error: Failed to add socket", v26, v27, v28, v29, v30, v31, (uint64_t)"eloop_register_sock");
    goto LABEL_13;
  }

  int v34 = *v23;
  __int128 v35 = (CFAbsoluteTime *)&v33[40 * *v23];
  v35[4] = Current;
  *(_DWORD *)__int128 v35 = a1;
  *((void *)v35 + 1) = a4;
  *((void *)v35 + 2) = a5;
  *((void *)v35 + 3) = a3;
  *__int16 v23 = v34 + 1;
  *((void *)v23 + 1) = v33;
  v23[4] = 1;
LABEL_13:
  CFNumberRef v36 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
  context.versiouint64_t n = 0LL;
  context.info = v36;
  context.retaiuint64_t n = (const void *(__cdecl *)(const void *))&CFRetain;
  context.release = (void (__cdecl *)(const void *))&_CFRelease;
  context.copyDescriptiouint64_t n = 0LL;
  int v37 = CFSocketCreateWithNative(kCFAllocatorDefault, a1, v25, v24, &context);
  CFRelease(v36);
  if (!v37)
  {
    sub_100016E40( 4LL,  "%s, CFSocketCreateWithNative failed!\n",  v38,  v39,  v40,  v41,  v42,  v43,  (uint64_t)"eloop_register_sock");
    return 0xFFFFFFFFLL;
  }

  CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(kCFAllocatorDefault, v37, 0LL);
  if (!RunLoopSource)
  {
    sub_100016E40( 4LL,  "%s, CFSocketCreateRunLoopSource failed!\n",  v45,  v46,  v47,  v48,  v49,  v50,  (uint64_t)"eloop_register_sock");
    CFRelease(v37);
    return 0xFFFFFFFFLL;
  }

  uint64_t v51 = RunLoopSource;
  uint32_t v52 = CFRunLoopGetCurrent();
  CFRunLoopAddSource(v52, v51, kCFRunLoopDefaultMode);
  CFRelease(v51);
  if (qword_10003C4A0
    || (qword_10003C4A0 = (uint64_t)CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks)) != 0)
  {
    CFNumberRef v53 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v59);
    if (v53)
    {
      CFNumberRef v54 = v53;
      CFDictionaryAddValue((CFMutableDictionaryRef)qword_10003C4A0, v53, v37);
      CFRelease(v54);
    }
  }

  CFRelease(v37);
  return 0LL;
}

void sub_100025F84(int a1)
{
  int valuePtr = a1;
  if (qword_10003C4A0)
  {
    CFNumberRef v1 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v1)
    {
      CFNumberRef v2 = v1;
      Value = (__CFSocket *)CFDictionaryGetValue((CFDictionaryRef)qword_10003C4A0, v1);
      if (Value)
      {
        uint64_t v4 = Value;
        CFSocketInvalidate(Value);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_10003C4A0, v4);
      }

      CFRelease(v2);
    }
  }

uint64_t sub_100026008(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFNumber *a5)
{
  if (!a5) {
    return sub_100016E40(4LL, "%s: no socket context", v7, v8, v9, v10, v11, v12, (uint64_t)"runloopReadSockCallback");
  }
  uint64_t Value = CFNumberGetValue(a5, kCFNumberDoubleType, &valuePtr);
  if (!(_DWORD)Value) {
    return sub_100016E40( 4LL,  "%s: invalid socket context",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"runloopReadSockCallback");
  }
  if (a2 == 8)
  {
    uint64_t v22 = &dword_10003C440;
  }

  else
  {
    if (a2 != 1) {
      sub_10002A3D4(Value, v14, v15, v16, v17, v18, v19, v20);
    }
    uint64_t v22 = (int *)&xmmword_10003C420 + 2;
  }

  uint64_t v24 = *v22;
  if ((int)v24 < 1) {
    return sub_100016E40( 4LL,  "%s: couldn't find registered socket handler",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"runloopReadSockCallback");
  }
  v21.n128_f64[0] = valuePtr;
  for (uint64_t i = *((void *)v22 + 1) + 16LL; *(double *)(i + 16) != valuePtr; i += 40LL)
  {
    if (!--v24) {
      return sub_100016E40( 4LL,  "%s: couldn't find registered socket handler",  v15,  v16,  v17,  v18,  v19,  v20,  (uint64_t)"runloopReadSockCallback");
    }
  }

  return (*(uint64_t (**)(void, void, void, __n128))(i + 8))( *(unsigned int *)(i - 16),  *(void *)(i - 8),  *(void *)i,  v21);
}

uint64_t sub_100026104( int a1, CFNumberRef number, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((__int128 *)xmmword_10003C470 == &xmmword_10003C470) {
    return sub_100016E40( 1LL,  "%s ERROR: empty timeout list; nothing to do !!!",
  }
             a3,
             a4,
             a5,
             a6,
             a7,
             a8,
             (uint64_t)"runloopTimerCallback");
  if (!number || !CFNumberGetValue(number, kCFNumberDoubleType, valuePtr)) {
    return sub_100016E40( 1LL,  "%s, unable to get timeout context",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"runloopTimerCallback");
  }
  else {
    uint64_t v9 = (uint64_t *)xmmword_10003C470;
  }
  uint64_t v10 = v9[5];
  uint64_t v11 = (uint64_t (*)(uint64_t, uint64_t))v9[6];
  uint64_t v12 = v9[4];
  sub_1000261B4(v9, v8, a3, a4, a5, a6, a7, a8);
  return v11(v12, v10);
}

void sub_1000261B4( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (__CFRunLoopTimer *)a1[7];
  if (v9)
  {
    CFRunLoopTimerInvalidate(v9);
    CFRelease((CFTypeRef)a1[7]);
  }

  else
  {
    sub_100016E40( 1LL,  "%s, removing timer without CFRunLoopTimer !!!",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"eloop_remove_timeout");
  }

  uint64_t v10 = *a1;
  *(void *)(v10 + 8) = a1[1];
  *(void *)a1[1] = v10;
  free(a1);
}

uint64_t sub_100026220(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = sub_100016B98(0x40uLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10 + 2;
  if ((sub_100016734(v10 + 2) & 0x80000000) != 0)
  {
    free(v11);
    return 0xFFFFFFFFLL;
  }

  uint64_t v13 = v11[3];
  uint64_t v14 = v11[2] + a1;
  int8x8_t v11[2] = v14;
  uint64_t v15 = v13 + a2;
  if (v15 > 999999)
  {
    uint64_t v16 = 1999999LL;
    if (v15 < 1999999) {
      uint64_t v16 = v13 + a2;
    }
    unint64_t v17 = (v15 + 999999 - v16) / 0xF4240uLL;
    v14 += v17 + 1;
    uint64_t v15 = v15 - 1000000 * v17 - 1000000;
    *uint64_t v12 = v14;
  }

  void v11[3] = v15;
  v11[4] = a4;
  v11[5] = a5;
  v11[6] = a3;
  double valuePtr = (double)v15 / 1000000.0 + (double)v14;
  CFNumberRef v18 = CFNumberCreate(kCFAllocatorDefault, kCFNumberDoubleType, &valuePtr);
  v29.versiouint64_t n = 0LL;
  v29.info = v18;
  v29.retaiuint64_t n = (const void *(__cdecl *)(const void *))&CFRetain;
  v29.release = (void (__cdecl *)(const void *))&_CFRelease;
  v29.copyDescriptiouint64_t n = 0LL;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v20 = CFRunLoopTimerCreate( kCFAllocatorDefault,  (double)a2 / 1000000.0 + Current + (double)a1,  0.0,  0LL,  0LL,  (CFRunLoopTimerCallBack)sub_100026104,  &v29);
  if (v20)
  {
    __n128 v21 = v20;
    v11[7] = v20;
    __int16 v23 = (void **)&xmmword_10003C470 + 1;
    uint64_t v22 = (__int128 *)xmmword_10003C470;
    if ((__int128 *)xmmword_10003C470 != &xmmword_10003C470)
    {
      uint64_t v24 = *v12;
      while (1)
      {
        uint64_t v25 = *((void *)v22 + 2);
        if (v24 < v25 || v24 == v25 && v11[3] < *((void *)v22 + 3)) {
          break;
        }
        uint64_t v22 = *(__int128 **)v22;
        if (v22 == &xmmword_10003C470)
        {
          __int16 v23 = (void **)&xmmword_10003C470 + 1;
          goto LABEL_18;
        }
      }

      __int16 v23 = (void **)v22 + 1;
    }

LABEL_18:
    uint64_t v27 = *v23;
    *uint64_t v11 = **v23;
    v11[1] = v27;
    *(void *)(*v27 + 8LL) = v11;
    *uint64_t v27 = v11;
    uint64_t v28 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v28, v21, kCFRunLoopDefaultMode);
  }

  if (v18) {
    CFRelease(v18);
  }
  return 0LL;
}

uint64_t sub_100026438( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (uint64_t *)xmmword_10003C470;
  uint64_t v12 = 0LL;
  do
  {
    uint64_t v13 = (__int128 *)*v9;
    if (v9[6] == a1 && (a2 == -1 || v9[4] == a2) && (a3 == -1 || v9[5] == a3))
    {
      sub_1000261B4(v9, a2, a3, a4, a5, a6, a7, a8);
      uint64_t v12 = (v12 + 1);
    }

    uint64_t v9 = (uint64_t *)v13;
  }

  while (v13 != &xmmword_10003C470);
  return v12;
}

uint64_t sub_1000264DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  for (uint64_t i = (__int128 *)xmmword_10003C470; ; uint64_t i = *(__int128 **)i)
  {
    if (i == &xmmword_10003C470) {
      return 0LL;
    }
    if (*((void *)i + 6) == a1 && *((void *)i + 4) == a2 && *((void *)i + 5) == a3) {
      break;
    }
  }

  return 1LL;
}

void sub_10002652C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v17 = a1;
  sub_100016E40(1LL, "%s, signal = %d", a3, a4, a5, a6, a7, a8, (uint64_t)"eloop_handle_signals");
  CFAbsoluteTime Current = CFRunLoopGetCurrent();
  if (a1 == 1)
  {
    sub_100016E40(1LL, "%s, stopping the run loop %p", v10, v11, v12, v13, v14, v15, (uint64_t)"eloop_handle_signals");
    uint64_t v16 = CFRunLoopGetCurrent();
    CFRunLoopStop(v16);
    pthread_exit(&v17);
  }

  CFRunLoopStop(Current);
}

uint64_t sub_1000265A0( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100016E40(1LL, "%s, signal = %d", a3, a4, a5, a6, a7, a8, (uint64_t)"eloop_register_signal");
  signal(a1, (void (__cdecl *)(int))sub_10002652C);
  return 0LL;
}

uint64_t sub_1000265F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100016E40(1LL, "%s, signal = %d", a3, a4, a5, a6, a7, a8, (uint64_t)"eloop_register_signal");
  signal(2, (void (__cdecl *)(int))sub_10002652C);
  sub_100016E40(1LL, "%s, signal = %d", v8, v9, v10, v11, v12, v13, (uint64_t)"eloop_register_signal");
  signal(15, (void (__cdecl *)(int))sub_10002652C);
  return 0LL;
}

uint64_t sub_100026678( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  sub_100016E40(2LL, "eloop_run (%p)", v10, v11, v12, v13, v14, v15, (uint64_t)Current);
  CFRunLoopRun();
  return sub_100016E40(2LL, "eloop_run done", v16, v17, v18, v19, v20, v21, a9);
}

void sub_1000266B8()
{
  dword_10003C498 = 1;
  getpid();
  CFRunLoopGetCurrent();
  sub_100016E40(2LL, "%s pid = %u, (%p)", v0, v1, v2, v3, v4, v5, (uint64_t)"eloop_terminate");
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  CFRunLoopStop(Current);
}

void sub_100026714()
{
}

uint64_t sub_100026724()
{
  return dword_10003C498;
}

void sub_100026730(__CFRunLoop *a1)
{
  dword_10003C498 = 1;
  getpid();
  sub_100016E40(2LL, "%s pid = %u, (%p)", v2, v3, v4, v5, v6, v7, (uint64_t)"eloop_terminate_loop");
  CFRunLoopStop(a1);
}

FILE *sub_100026788(int a1)
{
  socklen_t v13 = 128;
  if (a1 >= 1)
  {
    uint64_t v2 = (char *)malloc(0x118uLL);
    *(_OWORD *)(v2 + 20) = 0u;
    *(_OWORD *)(v2 + 36) = 0u;
    *(_OWORD *)(v2 + 52) = 0u;
    *(_OWORD *)(v2 + 68) = 0u;
    *(_OWORD *)(v2 + 84) = 0u;
    *(_OWORD *)(v2 + 100) = 0u;
    *(_OWORD *)(v2 + 116) = 0u;
    *(_OWORD *)(v2 + 148) = 0u;
    *(_OWORD *)(v2 + 164) = 0u;
    *(_OWORD *)(v2 + 180) = 0u;
    *(_OWORD *)(v2 + 196) = 0u;
    *(_OWORD *)(v2 + 212) = 0u;
    *(_OWORD *)(v2 + 228) = 0u;
    *(_OWORD *)(v2 + 244) = 0u;
    *((_DWORD *)v2 + 69) = 0;
    *(_OWORD *)(v2 + 4) = 0u;
    *(_OWORD *)(v2 + 260) = 0u;
    *(_OWORD *)(v2 + 1memset(&v9[1], 0, 32) = 0u;
    uint64_t v3 = v2 + 132;
    *(_DWORD *)uint64_t v2 = a1;
    *(_OWORD *)(v2 + 1memset(&v9[1], 0, 32) = 0u;
    *(_OWORD *)(v2 + 148) = 0u;
    *(_OWORD *)(v2 + 164) = 0u;
    *(_OWORD *)(v2 + 180) = 0u;
    *(_OWORD *)(v2 + 196) = 0u;
    *(_OWORD *)(v2 + 212) = 0u;
    *(_OWORD *)(v2 + 228) = 0u;
    *(_OWORD *)(v2 + 244) = 0u;
    if (__darwin_check_fd_set_overflow(a1, v2 + 132, 0)) {
      *((_DWORD *)v3 + (a1 >> 5)) |= 1 << a1;
    }
    __int128 v4 = *(_OWORD *)(v2 + 212);
    *(_OWORD *)(v2 + 68) = *(_OWORD *)(v2 + 196);
    *(_OWORD *)(v2 + 84) = v4;
    __int128 v5 = *(_OWORD *)(v2 + 244);
    *(_OWORD *)(v2 + 100) = *(_OWORD *)(v2 + 228);
    *(_OWORD *)(v2 + 116) = v5;
    __int128 v6 = *(_OWORD *)(v2 + 148);
    *(_OWORD *)(v2 + 4) = *v3;
    *(_OWORD *)(v2 + 20) = v6;
    __int128 v7 = *(_OWORD *)(v2 + 180);
    *(_OWORD *)(v2 + 36) = *(_OWORD *)(v2 + 164);
    *((void *)v2 + 33) = 5LL;
    *((void *)v2 + 34) = 0LL;
    *(_OWORD *)(v2 + 52) = v7;
    int v8 = *(_DWORD *)v2 + 1;
    *((_DWORD *)v2 + 65) = 0;
    int v9 = pselect(v8, (fd_set *)(v2 + 4), 0LL, 0LL, (const timespec *)(v2 + 264), (const sigset_t *)v2 + 65);
    if (v9 < 0)
    {
      __error();
      asl_log(0LL, 0LL, 3, "pselect error (%d), leaving");
    }

    else if (v9)
    {
      int v10 = *(_DWORD *)v2;
      if (__darwin_check_fd_set_overflow(*(_DWORD *)v2, v2 + 4, 0)
        && ((*(_DWORD *)&v2[(((unint64_t)v10 >> 3) & 0x1FFFFFFFFFFFFFFCLL) + 4] >> v10) & 1) != 0)
      {
        int v11 = accept(*(_DWORD *)v2, &v14, &v13);
        if ((v11 & 0x80000000) == 0) {
          return fdopen(v11, "r+");
        }
        __error();
        asl_log(0LL, 0LL, 3, "accept error (%d). Continuing.");
      }
    }

    else
    {
      asl_log(0LL, 0LL, 3, "pselect timed out (no more requests); leaving");
    }
  }

  return 0LL;
}

uint64_t sub_1000269A8()
{
  uint64_t v0 = launch_data_new_string("CheckIn");
  uint64_t v1 = launch_msg(v0);
  if (!v1)
  {
    asl_log(0LL, 0LL, 4, "%s", "Error registering with launchd!");
    uint64_t fd = 0xFFFFFFFFLL;
    if (!v0) {
      return fd;
    }
    goto LABEL_9;
  }

  uint64_t v2 = v1;
  if (launch_data_get_type(v1) != LAUNCH_DATA_ERRNO)
  {
    __int128 v7 = launch_data_dict_lookup(v2, "Sockets");
    if (v7)
    {
      int v8 = launch_data_dict_lookup(v7, "Listeners");
      if (v8)
      {
        index = launch_data_array_get_index(v8, 0LL);
        if (index)
        {
          uint64_t fd = launch_data_get_fd(index);
          if ((fd & 0x80000000) == 0) {
            goto LABEL_8;
          }
          int v11 = "Invalid listen file descriptor!";
LABEL_18:
          asl_log(0LL, 0LL, 4, "%s", v11);
LABEL_8:
          launch_data_free(v2);
          if (!v0) {
            return fd;
          }
LABEL_9:
          launch_data_free(v0);
          return fd;
        }

        int v11 = "No listener socket array entry!";
      }

      else
      {
        int v11 = "No listener socket found!";
      }
    }

    else
    {
      int v11 = "No socket dictionary found!";
    }

    uint64_t fd = 0xFFFFFFFFLL;
    goto LABEL_18;
  }

  uint64_t v3 = __error();
  __int128 v4 = strerror(*v3);
  int errno = launch_data_get_errno(v2);
  asl_log(0LL, 0LL, 3, "Check in with launchd returned an error; %s (%d)", v4, errno);
  return 0xFFFFFFFFLL;
}

uint64_t sub_100026B04(uint64_t a1, unint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v5 = 0LL;
  int8x16_t v6 = (int8x16_t)xmmword_10002BD60;
  v7.i64[0] = 0x1010101010101010LL;
  v7.i64[1] = 0x1010101010101010LL;
  do
  {
    *(int8x16_t *)&v20[v5] = v6;
    v5 += 16LL;
    int8x16_t v6 = vaddq_s8(v6, v7);
  }

  while (v5 != 256);
  uint64_t v8 = 0LL;
  unsigned __int8 v9 = 0;
  uint64_t v10 = 0LL;
  do
  {
    char v11 = v20[v8];
    v9 += v11 + *(_BYTE *)(a1 + v10);
    if (v10 + 1 < a2) {
      ++v10;
    }
    else {
      uint64_t v10 = 0LL;
    }
    v20[v8] = v20[v9];
    v20[v9] = v11;
    ++v8;
  }

  while (v8 != 256);
  if (!a3)
  {
    int v13 = 0;
    LOBYTE(v12) = 0;
    if (!a5) {
      return 0LL;
    }
    goto LABEL_14;
  }

  LOBYTE(v12) = 0;
  int v13 = 0;
  unsigned int v14 = 1;
  do
  {
    uint64_t v12 = (v12 + 1);
    int v15 = v20[v12];
    v13 += v15;
    v20[v12] = v20[v13];
    v20[v13] = v15;
    unint64_t v16 = v14++;
  }

  while (v16 < a3);
  if (a5)
  {
LABEL_14:
    uint64_t v17 = 0LL;
    do
    {
      uint64_t v12 = (v12 + 1);
      int v18 = v20[v12];
      v13 += v18;
      v20[v12] = v20[v13];
      v20[v13] = v18;
      *(_BYTE *)(a4 + v17++) ^= v20[(v20[v12] + v18)];
    }

    while (a5 > v17);
  }

  return 0LL;
}

_DWORD *sub_100026C6C(_DWORD *result, unsigned int *a2, _DWORD *a3)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = bswap32(*a2) ^ *result;
  unsigned int v5 = bswap32(a2[1]) ^ result[1];
  unsigned int v6 = bswap32(a2[2]) ^ result[2];
  int v7 = bswap32(a2[3]);
  uint64_t v8 = result + 3;
  while (1)
  {
    unsigned __int8 v9 = &v8[v3];
    unsigned int v10 = v7 ^ v8[v3];
    unsigned int v11 = *((_DWORD *)&unk_10002B370 + HIBYTE(v4)) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v5)), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v6)), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v10), 24) ^ v8[v3 + 1];
    unsigned int v12 = *((_DWORD *)&unk_10002B370 + HIBYTE(v5)) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v6)), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v10)), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v4), 24) ^ v8[v3 + 2];
    int v13 = *((_DWORD *)&unk_10002B370 + HIBYTE(v10));
    unsigned int v14 = *((_DWORD *)&unk_10002B370 + HIBYTE(v6)) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v10)), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v4)), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v5), 24) ^ v8[v3 + 3];
    unsigned int v15 = v13 ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v4)), 8) ^ __ROR4__( *((_DWORD *)&unk_10002B370 + BYTE1(v5)),  16) ^ __ROR4__( *((_DWORD *)&unk_10002B370 + v6),  24) ^ v8[v3 + 4];
    int v16 = *((_DWORD *)&unk_10002B370 + HIBYTE(v11));
    unsigned int v17 = HIBYTE(v12);
    unsigned int v18 = HIBYTE(v14);
    unsigned int v19 = BYTE1(v11);
    unsigned int v20 = HIBYTE(v15);
    unsigned int v21 = BYTE2(v11);
    if ((_DWORD)(v3 * 4) == 128) {
      break;
    }
    HIDWORD(v22) = *((_DWORD *)&unk_10002B370 + BYTE2(v12));
    LODWORD(v22) = HIDWORD(v22);
    unsigned int v4 = (v22 >> 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v14)), 16) ^ __ROR4__( *((_DWORD *)&unk_10002B370 + v15),  24) ^ v9[5] ^ v16;
    unsigned int v5 = *((_DWORD *)&unk_10002B370 + v17) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v14)), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v15)), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v11), 24) ^ v9[6];
    int v23 = v9[7];
    int v24 = *((_DWORD *)&unk_10002B370 + v20);
    unsigned int v6 = *((_DWORD *)&unk_10002B370 + v18) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE2(v15)), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v19), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v12), 24) ^ v23;
    v3 += 8LL;
    int v7 = v24 ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v21), 8) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + BYTE1(v12)), 16) ^ __ROR4__(*((_DWORD *)&unk_10002B370 + v14), 24);
  }

  *a3 = bswap32(((v16 << 8) & 0xFF000000 | (*((unsigned __int8 *)&unk_10002B370 + 4 * BYTE2(v12) + 2) << 16) | (*((unsigned __int8 *)&unk_10002B370 + 4 * BYTE1(v14) + 1) << 8) | *((unsigned __int8 *)&unk_10002B370 + 4 * v15 + 1)) ^ result[40]);
  a3[1] = bswap32(((*((_DWORD *)&unk_10002B370 + v17) << 8) & 0xFF000000 | (*((unsigned __int8 *)&unk_10002B370
                                                                            + 4 * BYTE2(v14)
                                                                            + 2) << 16) | (*((unsigned __int8 *)&unk_10002B370
                                                                                           + 4 * BYTE1(v15)
                                                                                           + 1) << 8) | *((unsigned __int8 *)&unk_10002B370 + 4 * v11 + 1)) ^ result[41]);
  a3[2] = bswap32(((*((_DWORD *)&unk_10002B370 + v18) << 8) & 0xFF000000 | (*((unsigned __int8 *)&unk_10002B370
                                                                            + 4 * BYTE2(v15)
                                                                            + 2) << 16) | (*((unsigned __int8 *)&unk_10002B370
                                                                                           + 4 * BYTE1(v11)
                                                                                           + 1) << 8) | *((unsigned __int8 *)&unk_10002B370 + 4 * v12 + 1)) ^ result[42]);
  a3[3] = bswap32(((*((_DWORD *)&unk_10002B370 + v20) << 8) & 0xFF000000 | (*((unsigned __int8 *)&unk_10002B370
                                                                            + 4 * BYTE2(v11)
                                                                            + 2) << 16) | (*((unsigned __int8 *)&unk_10002B370
                                                                                           + 4 * BYTE1(v12)
                                                                                           + 1) << 8) | *((unsigned __int8 *)&unk_10002B370 + 4 * v14 + 1)) ^ result[43]);
  return result;
}

unsigned int *sub_100026F74(unsigned int *a1, uint64_t a2)
{
  if (a2 != 16) {
    return 0LL;
  }
  uint64_t v3 = (unsigned int *)malloc(0xB0uLL);
  unsigned int v4 = v3;
  if (v3) {
    sub_10001F478(v3, a1);
  }
  return v4;
}

void sub_100026FC4(void *a1)
{
  *((_OWORD *)a1 + 9) = 0u;
  *((_OWORD *)a1 + 10) = 0u;
  *((_OWORD *)a1 + 7) = 0u;
  *((_OWORD *)a1 + 8) = 0u;
  *((_OWORD *)a1 + 5) = 0u;
  *((_OWORD *)a1 + 6) = 0u;
  *((_OWORD *)a1 + 3) = 0u;
  *((_OWORD *)a1 + 4) = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  *((_OWORD *)a1 + 2) = 0u;
  *(_OWORD *)a1 = 0u;
  free(a1);
}

unsigned int *sub_100026FE4(unsigned int *a1, unsigned int *a2)
{
  uint64_t v2 = a1;
  uint64_t result = sub_10001F478(a1, a2);
  unint64_t v4 = 0LL;
  unsigned int v5 = (int *)(v2 + 43);
  unsigned int v6 = (int *)(v2 + 2);
  unint64_t v7 = 36LL;
  do
  {
    int v8 = *(v6 - 2);
    *(v6 - 2) = *(v5 - 3);
    *(v5 - 3) = v8;
    int v9 = *(v6 - 1);
    *(v6 - 1) = *(v5 - 2);
    *(v5 - 2) = v9;
    int v10 = *v6;
    int *v6 = *(v5 - 1);
    *(v5 - 1) = v10;
    int v11 = v6[1];
    v6[1] = *v5;
    *unsigned int v5 = v11;
    v5 -= 4;
    v4 += 4LL;
    v6 += 4;
    BOOL v12 = v4 >= v7;
    v7 -= 4LL;
  }

  while (!v12);
  for (int i = 1; i != 10; ++i)
  {
    for (uint64_t j = 4LL; j != 8; ++j)
    {
      unint64_t v15 = v2[j];
      v2[j] = dword_10002B770[byte_10002B370[((v15 >> 22) & 0x3FC) + 1]] ^ __ROR4__( dword_10002B770[byte_10002B370[4 * BYTE2(v15) + 1]],  8) ^ __ROR4__( dword_10002B770[byte_10002B370[4 * BYTE1(v15) + 1]],  16) ^ __ROR4__( dword_10002B770[byte_10002B370[4 * v15 + 1]],  24);
    }

    v2 += 4;
  }

  return result;
}

unsigned int *sub_1000270F8(unsigned int *a1, uint64_t a2)
{
  if (a2 != 16) {
    return 0LL;
  }
  uint64_t v3 = (unsigned int *)malloc(0xB0uLL);
  unint64_t v4 = v3;
  if (v3) {
    sub_100026FE4(v3, a1);
  }
  return v4;
}

_DWORD *sub_100027144(_DWORD *result, unsigned int *a2, _DWORD *a3)
{
  uint64_t v3 = 0LL;
  unsigned int v4 = bswap32(*a2) ^ *result;
  unsigned int v5 = bswap32(a2[1]) ^ result[1];
  unsigned int v6 = a2[3];
  unsigned int v7 = bswap32(a2[2]) ^ result[2];
  int v8 = bswap32(v6);
  int v9 = result + 3;
  while (1)
  {
    int v10 = &v9[v3];
    unsigned int v11 = v9[v3] ^ v8;
    unint64_t v12 = (dword_10002B770[HIBYTE(v4)] ^ __ROR4__(dword_10002B770[BYTE2(v11)], 8)) ^ __ROR4__( dword_10002B770[BYTE1(v7)],  16) ^ __ROR4__(dword_10002B770[v5], 24) ^ v9[v3 + 1];
    unint64_t v13 = (dword_10002B770[HIBYTE(v5)] ^ __ROR4__(dword_10002B770[BYTE2(v4)], 8)) ^ __ROR4__( dword_10002B770[BYTE1(v11)],  16) ^ __ROR4__(dword_10002B770[v7], 24) ^ v9[v3 + 2];
    unint64_t v14 = (dword_10002B770[HIBYTE(v7)] ^ __ROR4__(dword_10002B770[BYTE2(v5)], 8)) ^ __ROR4__( dword_10002B770[BYTE1(v4)],  16) ^ __ROR4__(dword_10002B770[v11], 24) ^ v9[v3 + 3];
    unint64_t v15 = (dword_10002B770[HIBYTE(v11)] ^ __ROR4__(dword_10002B770[BYTE2(v7)], 8)) ^ __ROR4__( dword_10002B770[BYTE1(v5)],  16) ^ __ROR4__(dword_10002B770[v4], 24) ^ v9[v3 + 4];
    unint64_t v16 = v12 >> 24;
    if ((_DWORD)(v3 * 4) == 128) {
      break;
    }
    unsigned int v4 = dword_10002B770[v16] ^ __ROR4__(dword_10002B770[BYTE2(v15)], 8) ^ __ROR4__(dword_10002B770[BYTE1(v14)], 16) ^ __ROR4__(dword_10002B770[v13], 24) ^ v10[5];
    unsigned int v5 = dword_10002B770[BYTE3(v13)] ^ __ROR4__(dword_10002B770[BYTE2(v12)], 8) ^ __ROR4__( dword_10002B770[BYTE1(v15)],  16) ^ __ROR4__( dword_10002B770[v14],  24) ^ v10[6];
    unsigned int v7 = dword_10002B770[BYTE3(v14)] ^ __ROR4__(dword_10002B770[BYTE2(v13)], 8) ^ __ROR4__( dword_10002B770[BYTE1(v12)],  16) ^ __ROR4__( dword_10002B770[v15],  24) ^ v10[7];
    v3 += 8LL;
    int v8 = dword_10002B770[BYTE3(v15)] ^ __ROR4__(dword_10002B770[BYTE2(v14)], 8) ^ __ROR4__( dword_10002B770[BYTE1(v13)],  16) ^ __ROR4__( dword_10002B770[v12],  24);
  }

  *a3 = bswap32(((byte_10002BB70[v16] << 24) | (byte_10002BB70[BYTE2(v15)] << 16) | (byte_10002BB70[BYTE1(v14)] << 8) | byte_10002BB70[v13]) ^ result[40]);
  a3[1] = bswap32(((byte_10002BB70[v13 >> 24] << 24) | (byte_10002BB70[BYTE2(v12)] << 16) | (byte_10002BB70[BYTE1(v15)] << 8) | byte_10002BB70[v14]) ^ result[41]);
  a3[2] = bswap32(((byte_10002BB70[v14 >> 24] << 24) | (byte_10002BB70[BYTE2(v13)] << 16) | (byte_10002BB70[BYTE1(v12)] << 8) | byte_10002BB70[v15]) ^ result[42]);
  a3[3] = bswap32(((byte_10002BB70[v15 >> 24] << 24) | (byte_10002BB70[BYTE2(v14)] << 16) | (byte_10002BB70[BYTE1(v13)] << 8) | byte_10002BB70[v12]) ^ result[43]);
  return result;
}

uint64_t sub_100027430(uint64_t a1, __int128 **a2, _DWORD *a3, _OWORD *a4)
{
  __int128 v11 = xmmword_10002BD70;
  uint64_t v12 = 0LL;
  if (a1)
  {
    uint64_t v7 = a1;
    do
    {
      int v9 = *a2++;
      int v8 = v9;
      LODWORD(v9) = *a3;
      a3 += 2;
      sub_1000274E4((uint64_t)&v11, v8, v9);
      --v7;
    }

    while (v7);
  }

  sub_1000275B0(a4, (uint64_t)&v11);
  return 0LL;
}

double sub_1000274D0(uint64_t a1)
{
  double result = -3.59869635e230;
  *(_OWORD *)a1 = xmmword_10002BD70;
  *(void *)(a1 + 16) = 0LL;
  return result;
}

void *sub_1000274E4(uint64_t a1, __int128 *__src, size_t __n)
{
  unsigned int v3 = __n;
  unsigned int v4 = __src;
  unint64_t v6 = *(unsigned int *)(a1 + 16);
  unsigned int v7 = *(_DWORD *)(a1 + 20) + __CFADD__((_DWORD)v6, 8 * __n) + (__n >> 29);
  *(_DWORD *)(a1 + 16) = v6 + 8 * __n;
  *(_DWORD *)(a1 + 20) = v7;
  uint64_t v8 = (v6 >> 3) & 0x3F;
  if ((_DWORD)v8)
  {
    int v9 = (void *)(a1 + 24 + v8);
    unsigned int v10 = 64 - v8;
    memcpy(v9, __src, (64 - v8));
    sub_10002765C((_DWORD *)a1, (int *)(a1 + 24));
    unsigned int v4 = (__int128 *)((char *)v4 + v10);
    v3 -= v10;
  }

  if (v3 >= 0x40)
  {
    do
    {
      __int128 v11 = *v4;
      __int128 v12 = v4[1];
      __int128 v13 = v4[3];
      *(_OWORD *)(a1 + 56) = v4[2];
      *(_OWORD *)(a1 + 72) = v13;
      *(_OWORD *)(a1 + 24) = v11;
      *(_OWORD *)(a1 + 40) = v12;
      sub_10002765C((_DWORD *)a1, (int *)(a1 + 24));
      v4 += 4;
      v3 -= 64;
    }

    while (v3 > 0x3F);
  }

  int v9 = (void *)(a1 + 24);
  return memcpy(v9, v4, v3);
}

double sub_1000275B0(_OWORD *a1, uint64_t a2)
{
  unint64_t v4 = ((unint64_t)*(unsigned int *)(a2 + 16) >> 3) & 0x3F;
  uint64_t v5 = a2 + 24;
  unint64_t v6 = (_BYTE *)(a2 + 24 + v4);
  _BYTE *v6 = 0x80;
  unsigned int v7 = v6 + 1;
  size_t v8 = v4 ^ 0x3F;
  if (v8 > 7)
  {
    bzero(v7, (55 - v4));
  }

  else
  {
    bzero(v7, v8);
    sub_10002765C((_DWORD *)a2, (int *)v5);
    *(void *)(v5 + 48) = 0LL;
    *(_OWORD *)(v5 + 16) = 0u;
    *(_OWORD *)(v5 + memset(&v9[1], 0, 32) = 0u;
    *(_OWORD *)uint64_t v5 = 0u;
  }

  *(void *)(a2 + 80) = *(void *)(a2 + 16);
  sub_10002765C((_DWORD *)a2, (int *)v5);
  *a1 = *(_OWORD *)a2;
  double result = 0.0;
  *(_OWORD *)(a2 + memset(&v9[1], 0, 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(void *)(a2 + 80) = 0LL;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  return result;
}

_DWORD *sub_10002765C(_DWORD *result, int *a2)
{
  int v2 = result[1];
  int v4 = result[2];
  int v3 = result[3];
  int v5 = *a2;
  int v6 = a2[1];
  HIDWORD(v7) = *result + *a2 - 680876936 + (v4 & v2 | v3 & ~v2);
  LODWORD(v7) = HIDWORD(v7);
  int v8 = (v7 >> 25) + v2;
  HIDWORD(v7) = v3 + v6 - 389564586 + (v2 & v8 | v4 & ~v8);
  LODWORD(v7) = HIDWORD(v7);
  int v9 = (v7 >> 20) + v8;
  int v10 = a2[2];
  int v11 = a2[3];
  HIDWORD(v7) = v4 + v10 + 606105819 + (v8 & v9 | v2 & ~v9);
  LODWORD(v7) = HIDWORD(v7);
  int v12 = (v7 >> 15) + v9;
  HIDWORD(v7) = v2 + v11 - 1044525330 + (v9 & v12 | v8 & ~v12);
  LODWORD(v7) = HIDWORD(v7);
  int v13 = (v7 >> 10) + v12;
  int v15 = a2[4];
  int v14 = a2[5];
  HIDWORD(v7) = v15 + v8 - 176418897 + (v12 & v13 | v9 & ~v13);
  LODWORD(v7) = HIDWORD(v7);
  int v16 = (v7 >> 25) + v13;
  HIDWORD(v7) = v14 + v9 + 1200080426 + (v13 & v16 | v12 & ~v16);
  LODWORD(v7) = HIDWORD(v7);
  int v17 = (v7 >> 20) + v16;
  int v18 = a2[6];
  int v19 = a2[7];
  HIDWORD(v7) = v18 + v12 - 1473231341 + (v16 & v17 | v13 & ~v17);
  LODWORD(v7) = HIDWORD(v7);
  int v20 = (v7 >> 15) + v17;
  HIDWORD(v7) = v19 + v13 - 45705983 + (v17 & v20 | v16 & ~v20);
  LODWORD(v7) = HIDWORD(v7);
  int v21 = (v7 >> 10) + v20;
  int v22 = a2[8];
  int v23 = a2[9];
  HIDWORD(v7) = v22 + v16 + 1770035416 + (v20 & v21 | v17 & ~v21);
  LODWORD(v7) = HIDWORD(v7);
  int v24 = (v7 >> 25) + v21;
  HIDWORD(v7) = v23 + v17 - 1958414417 + (v21 & v24 | v20 & ~v24);
  LODWORD(v7) = HIDWORD(v7);
  int v25 = (v7 >> 20) + v24;
  int v27 = a2[10];
  int v26 = a2[11];
  HIDWORD(v7) = v27 + v20 - 42063 + (v24 & v25 | v21 & ~v25);
  LODWORD(v7) = HIDWORD(v7);
  int v28 = (v7 >> 15) + v25;
  HIDWORD(v7) = v26 + v21 - 1990404162 + (v25 & v28 | v24 & ~v28);
  LODWORD(v7) = HIDWORD(v7);
  int v29 = (v7 >> 10) + v28;
  int v31 = a2[12];
  int v30 = a2[13];
  HIDWORD(v7) = v31 + v24 + 1804603682 + (v28 & v29 | v25 & ~v29);
  LODWORD(v7) = HIDWORD(v7);
  int v32 = (v7 >> 25) + v29;
  HIDWORD(v7) = v30 + v25 - 40341101 + (v29 & v32 | v28 & ~v32);
  LODWORD(v7) = HIDWORD(v7);
  int v33 = (v7 >> 20) + v32;
  int v35 = a2[14];
  int v34 = a2[15];
  HIDWORD(v7) = v35 + v28 - 1502002290 + (v32 & v33 | v29 & ~v33);
  LODWORD(v7) = HIDWORD(v7);
  int v36 = (v7 >> 15) + v33;
  HIDWORD(v7) = v34 + v29 + 1236535329 + (v33 & v36 | v32 & ~v36);
  LODWORD(v7) = HIDWORD(v7);
  int v37 = (v7 >> 10) + v36;
  HIDWORD(v7) = v6 + v32 - 165796510 + (v37 & v33 | v36 & ~v33);
  LODWORD(v7) = HIDWORD(v7);
  int v38 = (v7 >> 27) + v37;
  HIDWORD(v7) = v18 + v33 - 1069501632 + (v38 & v36 | v37 & ~v36);
  LODWORD(v7) = HIDWORD(v7);
  int v39 = (v7 >> 23) + v38;
  HIDWORD(v7) = v26 + v36 + 643717713 + (v39 & v37 | v38 & ~v37);
  LODWORD(v7) = HIDWORD(v7);
  int v40 = (v7 >> 18) + v39;
  HIDWORD(v7) = v5 + v37 - 373897302 + (v40 & v38 | v39 & ~v38);
  LODWORD(v7) = HIDWORD(v7);
  int v41 = (v7 >> 12) + v40;
  HIDWORD(v7) = v14 + v38 - 701558691 + (v41 & v39 | v40 & ~v39);
  LODWORD(v7) = HIDWORD(v7);
  int v42 = (v7 >> 27) + v41;
  HIDWORD(v7) = v27 + v39 + 38016083 + (v42 & v40 | v41 & ~v40);
  LODWORD(v7) = HIDWORD(v7);
  int v43 = (v7 >> 23) + v42;
  HIDWORD(v7) = v34 + v40 - 660478335 + (v43 & v41 | v42 & ~v41);
  LODWORD(v7) = HIDWORD(v7);
  int v44 = (v7 >> 18) + v43;
  HIDWORD(v7) = v15 + v41 - 405537848 + (v44 & v42 | v43 & ~v42);
  LODWORD(v7) = HIDWORD(v7);
  int v45 = (v7 >> 12) + v44;
  HIDWORD(v7) = v23 + v42 + 568446438 + (v45 & v43 | v44 & ~v43);
  LODWORD(v7) = HIDWORD(v7);
  int v46 = (v7 >> 27) + v45;
  HIDWORD(v7) = v35 + v43 - 1019803690 + (v46 & v44 | v45 & ~v44);
  LODWORD(v7) = HIDWORD(v7);
  int v47 = (v7 >> 23) + v46;
  HIDWORD(v7) = v11 + v44 - 187363961 + (v47 & v45 | v46 & ~v45);
  LODWORD(v7) = HIDWORD(v7);
  int v48 = (v7 >> 18) + v47;
  HIDWORD(v7) = v22 + v45 + 1163531501 + (v48 & v46 | v47 & ~v46);
  LODWORD(v7) = HIDWORD(v7);
  int v49 = (v7 >> 12) + v48;
  HIDWORD(v7) = v30 + v46 - 1444681467 + (v49 & v47 | v48 & ~v47);
  LODWORD(v7) = HIDWORD(v7);
  int v50 = (v7 >> 27) + v49;
  HIDWORD(v7) = v10 + v47 - 51403784 + (v50 & v48 | v49 & ~v48);
  LODWORD(v7) = HIDWORD(v7);
  int v51 = (v7 >> 23) + v50;
  HIDWORD(v7) = v19 + v48 + 1735328473 + (v51 & v49 | v50 & ~v49);
  LODWORD(v7) = HIDWORD(v7);
  int v52 = (v7 >> 18) + v51;
  HIDWORD(v7) = v31 + v49 - 1926607734 + ((v52 ^ v51) & v50 ^ v51);
  LODWORD(v7) = HIDWORD(v7);
  int v53 = (v7 >> 12) + v52;
  HIDWORD(v7) = v14 + v50 - 378558 + (v52 ^ v51 ^ v53);
  LODWORD(v7) = HIDWORD(v7);
  int v54 = (v7 >> 28) + v53;
  HIDWORD(v7) = v22 + v51 - 2022574463 + (v53 ^ v52 ^ v54);
  LODWORD(v7) = HIDWORD(v7);
  int v55 = (v7 >> 21) + v54;
  HIDWORD(v7) = v26 + v52 + 1839030562 + (v54 ^ v53 ^ v55);
  LODWORD(v7) = HIDWORD(v7);
  int v56 = (v7 >> 16) + v55;
  HIDWORD(v7) = v35 + v53 - 35309556 + (v55 ^ v54 ^ v56);
  LODWORD(v7) = HIDWORD(v7);
  int v57 = (v7 >> 9) + v56;
  HIDWORD(v7) = v6 + v54 - 1530992060 + (v56 ^ v55 ^ v57);
  LODWORD(v7) = HIDWORD(v7);
  int v58 = (v7 >> 28) + v57;
  HIDWORD(v7) = v15 + v55 + 1272893353 + (v57 ^ v56 ^ v58);
  LODWORD(v7) = HIDWORD(v7);
  int v59 = (v7 >> 21) + v58;
  HIDWORD(v7) = v19 + v56 - 155497632 + (v58 ^ v57 ^ v59);
  LODWORD(v7) = HIDWORD(v7);
  int v60 = (v7 >> 16) + v59;
  HIDWORD(v7) = v27 + v57 - 1094730640 + (v59 ^ v58 ^ v60);
  LODWORD(v7) = HIDWORD(v7);
  int v61 = (v7 >> 9) + v60;
  HIDWORD(v7) = v30 + v58 + 681279174 + (v60 ^ v59 ^ v61);
  LODWORD(v7) = HIDWORD(v7);
  int v62 = (v7 >> 28) + v61;
  HIDWORD(v7) = v5 + v59 - 358537222 + (v61 ^ v60 ^ v62);
  LODWORD(v7) = HIDWORD(v7);
  int v63 = (v7 >> 21) + v62;
  HIDWORD(v7) = v11 + v60 - 722521979 + (v62 ^ v61 ^ v63);
  LODWORD(v7) = HIDWORD(v7);
  int v64 = (v7 >> 16) + v63;
  HIDWORD(v7) = v18 + v61 + 76029189 + (v63 ^ v62 ^ v64);
  LODWORD(v7) = HIDWORD(v7);
  int v65 = (v7 >> 9) + v64;
  HIDWORD(v7) = v23 + v62 - 640364487 + (v64 ^ v63 ^ v65);
  LODWORD(v7) = HIDWORD(v7);
  int v66 = (v7 >> 28) + v65;
  HIDWORD(v7) = v31 + v63 - 421815835 + (v65 ^ v64 ^ v66);
  LODWORD(v7) = HIDWORD(v7);
  int v67 = (v7 >> 21) + v66;
  HIDWORD(v7) = v34 + v64 + 530742520 + (v66 ^ v65 ^ v67);
  LODWORD(v7) = HIDWORD(v7);
  int v68 = (v7 >> 16) + v67;
  HIDWORD(v7) = v10 + v65 - 995338651 + (v67 ^ v66 ^ v68);
  LODWORD(v7) = HIDWORD(v7);
  int v69 = (v7 >> 9) + v68;
  HIDWORD(v7) = v5 + v66 - 198630844 + ((v69 | ~v67) ^ v68);
  LODWORD(v7) = HIDWORD(v7);
  int v70 = (v7 >> 26) + v69;
  HIDWORD(v7) = v19 + v67 + 1126891415 + ((v70 | ~v68) ^ v69);
  LODWORD(v7) = HIDWORD(v7);
  int v71 = (v7 >> 22) + v70;
  HIDWORD(v7) = v35 + v68 - 1416354905 + ((v71 | ~v69) ^ v70);
  LODWORD(v7) = HIDWORD(v7);
  int v72 = (v7 >> 17) + v71;
  HIDWORD(v7) = v14 + v69 - 57434055 + ((v72 | ~v70) ^ v71);
  LODWORD(v7) = HIDWORD(v7);
  int v73 = (v7 >> 11) + v72;
  HIDWORD(v7) = v31 + v70 + 1700485571 + ((v73 | ~v71) ^ v72);
  LODWORD(v7) = HIDWORD(v7);
  int v74 = (v7 >> 26) + v73;
  HIDWORD(v7) = v11 + v71 - 1894986606 + ((v74 | ~v72) ^ v73);
  LODWORD(v7) = HIDWORD(v7);
  int v75 = (v7 >> 22) + v74;
  HIDWORD(v7) = v27 + v72 - 1051523 + ((v75 | ~v73) ^ v74);
  LODWORD(v7) = HIDWORD(v7);
  int v76 = (v7 >> 17) + v75;
  HIDWORD(v7) = v6 + v73 - 2054922799 + ((v76 | ~v74) ^ v75);
  LODWORD(v7) = HIDWORD(v7);
  int v77 = (v7 >> 11) + v76;
  HIDWORD(v7) = v22 + v74 + 1873313359 + ((v77 | ~v75) ^ v76);
  LODWORD(v7) = HIDWORD(v7);
  int v78 = (v7 >> 26) + v77;
  HIDWORD(v7) = v34 + v75 - 30611744 + ((v78 | ~v76) ^ v77);
  LODWORD(v7) = HIDWORD(v7);
  int v79 = (v7 >> 22) + v78;
  HIDWORD(v7) = v18 + v76 - 1560198380 + ((v79 | ~v77) ^ v78);
  LODWORD(v7) = HIDWORD(v7);
  int v80 = (v7 >> 17) + v79;
  HIDWORD(v7) = v30 + v77 + 1309151649 + ((v80 | ~v78) ^ v79);
  LODWORD(v7) = HIDWORD(v7);
  int v81 = (v7 >> 11) + v80;
  HIDWORD(v7) = v15 + v78 - 145523070 + ((v81 | ~v79) ^ v80);
  LODWORD(v7) = HIDWORD(v7);
  int v82 = (v7 >> 26) + v81;
  HIDWORD(v7) = v26 + v79 - 1120210379 + ((v82 | ~v80) ^ v81);
  LODWORD(v7) = HIDWORD(v7);
  int v83 = (v7 >> 22) + v82;
  HIDWORD(v7) = v10 + v80 + 718787259 + ((v83 | ~v81) ^ v82);
  LODWORD(v7) = HIDWORD(v7);
  int v84 = (v7 >> 17) + v83;
  HIDWORD(v7) = v23 + v81 - 343485551 + ((v84 | ~v82) ^ v83);
  LODWORD(v7) = HIDWORD(v7);
  *result += v82;
  result[1] = v84 + v2 + (v7 >> 11);
  result[2] = v84 + v4;
  result[3] = v83 + v3;
  return result;
}

uint64_t sub_100028038(uint64_t a1, char **a2, _DWORD *a3, uint64_t a4)
{
  __int128 v11 = xmmword_10002BD70;
  int v13 = 0;
  uint64_t v12 = 3285377520LL;
  if (a1)
  {
    uint64_t v7 = a1;
    do
    {
      int v9 = *a2++;
      int v8 = v9;
      LODWORD(v9) = *a3;
      a3 += 2;
      sub_100028104(&v11, v8, v9);
      --v7;
    }

    while (v7);
  }

  sub_1000281D8(a4, (uint64_t)&v11);
  return 0LL;
}

double sub_1000280E4(uint64_t a1)
{
  *(_OWORD *)a1 = xmmword_10002BD70;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)&double result = 3285377520LL;
  *(void *)(a1 + 16) = 3285377520LL;
  return result;
}

void *sub_100028104(_DWORD *a1, char *__src, unsigned int a3)
{
  unint64_t v6 = ((unint64_t)a1[5] >> 3) & 0x3F;
  *(void *)(a1 + 5) += __PAIR64__(a3 >> 29, 8 * a3);
  if (v6 + a3 < 0x40)
  {
    unsigned int v7 = 0;
    uint64_t v9 = v6;
  }

  else
  {
    unsigned int v7 = 64 - v6;
    memcpy((char *)a1 + v6 + 28, __src, (64 - v6));
    sub_10002831C(a1, a1 + 7);
    unsigned int v8 = v6 ^ 0x7F;
    if ((v6 ^ 0x7F) >= a3)
    {
      uint64_t v9 = 0LL;
    }

    else
    {
      do
      {
        sub_10002831C(a1, (unsigned int *)&__src[v8 - 63]);
        v8 += 64;
      }

      while (v8 < a3);
      uint64_t v9 = 0LL;
      unsigned int v7 = v8 - 63;
    }
  }

  return memcpy((char *)a1 + v9 + 28, &__src[v7], a3 - v7);
}

double sub_1000281D8(uint64_t a1, uint64_t a2)
{
  int v4 = 0;
  for (unint64_t i = 0LL; i != 8; ++i)
  {
    v9[i] = *(_DWORD *)(a2 + 4LL * (i < 4) + 20) >> (~(_BYTE)v4 & 0x18);
    v4 += 8;
  }

  sub_100028104((_DWORD *)a2, "\x80", 1u);
  while ((*(_DWORD *)(a2 + 20) & 0x1F8) != 0x1C0)
    sub_100028104((_DWORD *)a2, byte_10002BD88, 1u);
  sub_100028104((_DWORD *)a2, v9, 8u);
  int v6 = 0;
  for (uint64_t j = 0LL; j != 20; ++j)
  {
    *(_BYTE *)(a1 + j) = *(_DWORD *)(a2 + (j & 0xFFFFFFFC)) >> (~(_BYTE)v6 & 0x18);
    v6 += 8;
  }

  double result = 0.0;
  *(_OWORD *)(a2 + 76) = 0u;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 44) = 0u;
  *(_OWORD *)(a2 + 28) = 0u;
  *(void *)a2 = 0LL;
  *(void *)(a2 + 8) = 0LL;
  *(_DWORD *)(a2 + 16) = 0;
  *(void *)(a2 + 20) = 0LL;
  return result;
}

uint64_t sub_10002831C(_DWORD *a1, unsigned int *a2)
{
  HIDWORD(v3) = *a1;
  LODWORD(v3) = *a1;
  int v2 = v3 >> 27;
  HIDWORD(v3) = a1[1];
  LODWORD(v3) = HIDWORD(v3);
  int v4 = v3 >> 2;
  int v5 = a1[2];
  int v6 = *a1 & __ROR4__(HIDWORD(v3), 2);
  int v484 = a1[4];
  int v481 = a1[3];
  int v482 = HIDWORD(v3);
  unsigned int v7 = bswap32(*a2);
  int v8 = v7 + v484 + v2 + (v5 & HIDWORD(v3) | v481 & ~HIDWORD(v3)) + 1518500249;
  HIDWORD(v3) = v8;
  LODWORD(v3) = v8;
  int v9 = v3 >> 27;
  int v479 = v5;
  int v480 = *a1;
  HIDWORD(v3) = *a1;
  LODWORD(v3) = *a1;
  int v10 = v3 >> 2;
  int v11 = v8 & __ROR4__(*a1, 2);
  unsigned int v12 = bswap32(a2[1]);
  int v13 = v12 + v481 + (v6 | v5 & ~*a1) + 1518500249 + v9;
  HIDWORD(v3) = v13;
  LODWORD(v3) = v13;
  int v14 = v3 >> 27;
  HIDWORD(v3) = v8;
  LODWORD(v3) = v8;
  int v15 = v3 >> 2;
  int v16 = v13 & __ROR4__(v8, 2);
  int v17 = v11 | v4 & ~v8;
  unsigned int v18 = bswap32(a2[2]);
  int v19 = v18 + v5 + v17 + 1518500249 + v14;
  HIDWORD(v3) = v19;
  LODWORD(v3) = v19;
  int v20 = v3 >> 27;
  HIDWORD(v3) = v13;
  LODWORD(v3) = v13;
  int v21 = v3 >> 2;
  int v22 = v19 & __ROR4__(v13, 2);
  int v23 = v16 | v10 & ~v13;
  unsigned int v24 = bswap32(a2[3]);
  int v25 = v24 + v4 + v23 + 1518500249 + v20;
  HIDWORD(v3) = v25;
  LODWORD(v3) = v25;
  int v26 = v3 >> 27;
  HIDWORD(v3) = v19;
  LODWORD(v3) = v19;
  int v27 = v3 >> 2;
  int v28 = v25 & __ROR4__(v19, 2);
  int v29 = v22 | v15 & ~v19;
  unsigned int v30 = bswap32(a2[4]);
  int v31 = v30 + v10 + v29 + 1518500249 + v26;
  HIDWORD(v3) = v31;
  LODWORD(v3) = v31;
  int v32 = v3 >> 27;
  HIDWORD(v3) = v25;
  LODWORD(v3) = v25;
  int v33 = v3 >> 2;
  int v34 = v31 & __ROR4__(v25, 2);
  int v35 = v28 | v21 & ~v25;
  unsigned int v36 = bswap32(a2[5]);
  int v37 = v36 + v15 + v35 + 1518500249 + v32;
  HIDWORD(v3) = v37;
  LODWORD(v3) = v37;
  int v38 = v3 >> 27;
  HIDWORD(v3) = v31;
  LODWORD(v3) = v31;
  int v39 = v3 >> 2;
  int v40 = v37 & __ROR4__(v31, 2);
  unsigned int v41 = bswap32(a2[6]);
  int v42 = v41 + v21 + (v34 | v27 & ~v31) + 1518500249 + v38;
  HIDWORD(v3) = v42;
  LODWORD(v3) = v42;
  int v43 = v3 >> 27;
  HIDWORD(v3) = v37;
  LODWORD(v3) = v37;
  int v44 = v3 >> 2;
  int v45 = v42 & __ROR4__(v37, 2);
  unsigned int v46 = bswap32(a2[7]);
  int v47 = v46 + v27 + (v40 | v33 & ~v37) + 1518500249 + v43;
  HIDWORD(v3) = v47;
  LODWORD(v3) = v47;
  int v48 = v3 >> 27;
  HIDWORD(v3) = v42;
  LODWORD(v3) = v42;
  int v49 = v3 >> 2;
  int v50 = v47 & __ROR4__(v42, 2);
  int v51 = v45 | v39 & ~v42;
  unsigned int v52 = bswap32(a2[8]);
  int v53 = v52 + v33 + v51 + 1518500249 + v48;
  HIDWORD(v3) = v53;
  LODWORD(v3) = v53;
  int v54 = v3 >> 27;
  HIDWORD(v3) = v47;
  LODWORD(v3) = v47;
  int v55 = v3 >> 2;
  int v56 = v53 & __ROR4__(v47, 2);
  unsigned int v57 = bswap32(a2[9]);
  int v58 = v57 + v39 + (v50 | v44 & ~v47) + 1518500249 + v54;
  HIDWORD(v3) = v58;
  LODWORD(v3) = v58;
  int v59 = v3 >> 27;
  HIDWORD(v3) = v53;
  LODWORD(v3) = v53;
  int v60 = v3 >> 2;
  int v61 = v58 & __ROR4__(v53, 2);
  unsigned int v62 = bswap32(a2[10]);
  int v63 = v62 + v44 + (v56 | v49 & ~v53) + 1518500249 + v59;
  HIDWORD(v3) = v63;
  LODWORD(v3) = v63;
  int v64 = v3 >> 27;
  HIDWORD(v3) = v58;
  LODWORD(v3) = v58;
  int v65 = v3 >> 2;
  int v66 = v63 & __ROR4__(v58, 2);
  unsigned int v67 = bswap32(a2[11]);
  int v68 = v67 + v49 + (v61 | v55 & ~v58) + 1518500249 + v64;
  HIDWORD(v3) = v68;
  LODWORD(v3) = v68;
  int v69 = v3 >> 27;
  HIDWORD(v3) = v63;
  LODWORD(v3) = v63;
  int v70 = v3 >> 2;
  int v71 = v68 & __ROR4__(v63, 2);
  unsigned int v72 = bswap32(a2[12]);
  int v73 = v72 + v55 + (v66 | v60 & ~v63) + 1518500249 + v69;
  HIDWORD(v3) = v73;
  LODWORD(v3) = v73;
  int v74 = v3 >> 27;
  HIDWORD(v3) = v68;
  LODWORD(v3) = v68;
  int v75 = v3 >> 2;
  unsigned int v76 = bswap32(a2[13]);
  int v77 = v76 + v60 + (v71 | v65 & ~v68) + 1518500249 + v74;
  HIDWORD(v3) = v77;
  LODWORD(v3) = v77;
  int v78 = v3 >> 27;
  HIDWORD(v3) = v73;
  LODWORD(v3) = v73;
  int v79 = v3 >> 2;
  unsigned int v80 = bswap32(a2[14]);
  int v81 = v80 + v65 + (v73 & __ROR4__(v68, 2) | v70 & ~v73) + 1518500249 + v78;
  HIDWORD(v3) = v81;
  LODWORD(v3) = v81;
  int v82 = v3 >> 27;
  HIDWORD(v3) = v77;
  LODWORD(v3) = v77;
  int v83 = v3 >> 2;
  unsigned int v84 = bswap32(a2[15]);
  int v85 = v84 + v70 + (v77 & __ROR4__(v73, 2) | v75 & ~v77);
  int v86 = v18 ^ v7 ^ v52 ^ v76;
  HIDWORD(v3) = v86;
  LODWORD(v3) = v86;
  int v87 = v3 >> 31;
  int v88 = v85 + 1518500249 + v82;
  HIDWORD(v3) = v88;
  LODWORD(v3) = v88;
  int v89 = v3 >> 27;
  int v90 = v87 + v75;
  HIDWORD(v3) = v81;
  LODWORD(v3) = v81;
  int v91 = v3 >> 2;
  int v92 = v90 + (v81 & __ROR4__(v77, 2) | v79 & ~v81);
  int v93 = v24 ^ v12 ^ v57 ^ v80;
  HIDWORD(v3) = v93;
  LODWORD(v3) = v93;
  int v94 = v3 >> 31;
  int v95 = v92 + 1518500249 + v89;
  HIDWORD(v3) = v95;
  LODWORD(v3) = v95;
  int v96 = v3 >> 27;
  HIDWORD(v3) = v88;
  LODWORD(v3) = v88;
  int v97 = v3 >> 2;
  int v98 = v94 + v79 + (v88 & __ROR4__(v81, 2) | v83 & ~v88);
  int v99 = v30 ^ v18 ^ v62 ^ v84;
  HIDWORD(v3) = v99;
  LODWORD(v3) = v99;
  int v458 = v3 >> 31;
  int v100 = v98 + 1518500249 + v96;
  HIDWORD(v3) = v100;
  LODWORD(v3) = v100;
  int v102 = v458 + v83 + (v95 & __ROR4__(v88, 2) | v91 & ~v95) + 1518500249 + (v3 >> 27);
  LODWORD(v3) = v36 ^ v24 ^ v67 ^ __ROR4__(v86, 31);
  int v101 = v3;
  HIDWORD(v3) = v3;
  int v448 = v3 >> 31;
  HIDWORD(v3) = v102;
  LODWORD(v3) = v102;
  int v103 = v3 >> 27;
  HIDWORD(v3) = v100;
  LODWORD(v3) = v100;
  int v104 = v3 >> 2;
  int v105 = v448 + v91 + (v100 & __ROR4__(v95, 2) | v97 & ~v100) + 1518500249 + v103;
  LODWORD(v3) = v41 ^ v30 ^ v72 ^ __ROR4__(v93, 31);
  int v106 = v3;
  HIDWORD(v3) = v3;
  int v473 = v3 >> 31;
  HIDWORD(v3) = v105;
  LODWORD(v3) = v105;
  int v107 = v473 + v97 + (v104 ^ __ROR4__(v95, 2) ^ v102) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v95;
  LODWORD(v3) = v95;
  int v108 = v3 >> 2;
  HIDWORD(v3) = v102;
  LODWORD(v3) = v102;
  int v109 = v3 >> 2;
  unsigned int v110 = v46;
  LODWORD(v3) = v46 ^ v36 ^ v76 ^ __ROR4__(v99, 31);
  int v111 = v3;
  HIDWORD(v3) = v3;
  int v452 = v3 >> 31;
  HIDWORD(v3) = v107;
  LODWORD(v3) = v107;
  int v112 = v452 + v108 + (v109 ^ __ROR4__(v100, 2) ^ v105) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v105;
  LODWORD(v3) = v105;
  int v113 = v3 >> 2;
  int v115 = v101;
  LODWORD(v3) = v52 ^ v41 ^ v80 ^ __ROR4__(v101, 31);
  int v114 = v3;
  HIDWORD(v3) = v3;
  int v445 = v3 >> 31;
  HIDWORD(v3) = v112;
  LODWORD(v3) = v112;
  int v116 = v445 + v104 + (v113 ^ __ROR4__(v102, 2) ^ v107) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v107;
  LODWORD(v3) = v107;
  int v117 = v3 >> 2;
  int v118 = v117 ^ __ROR4__(v105, 2);
  LODWORD(v3) = v57 ^ v110 ^ v84 ^ __ROR4__(v106, 31);
  int v119 = v3;
  HIDWORD(v3) = v3;
  int v438 = v3 >> 31;
  HIDWORD(v3) = v116;
  LODWORD(v3) = v116;
  int v120 = v438 + v109 + (v118 ^ v112) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v112;
  LODWORD(v3) = v112;
  int v121 = v3 >> 2;
  int v122 = v121 ^ __ROR4__(v107, 2);
  LODWORD(v3) = v62 ^ v52 ^ __ROR4__(v86, 31) ^ __ROR4__(v111, 31);
  int v123 = v3;
  HIDWORD(v3) = v3;
  int v436 = v3 >> 31;
  HIDWORD(v3) = v120;
  LODWORD(v3) = v120;
  int v124 = v436 + v113 + (v122 ^ v116) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v116;
  LODWORD(v3) = v116;
  int v125 = v3 >> 2;
  int v126 = v67 ^ v57 ^ __ROR4__(v93, 31) ^ __ROR4__(v114, 31);
  HIDWORD(v3) = v126;
  LODWORD(v3) = v126;
  int v434 = v3 >> 31;
  HIDWORD(v3) = v124;
  LODWORD(v3) = v124;
  int v127 = v434 + v117 + (v125 ^ __ROR4__(v112, 2) ^ v120) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v120;
  LODWORD(v3) = v120;
  int v128 = v3 >> 2;
  int v129 = v72 ^ v62 ^ __ROR4__(v99, 31) ^ __ROR4__(v119, 31);
  HIDWORD(v3) = v129;
  LODWORD(v3) = v129;
  int v476 = v3 >> 31;
  HIDWORD(v3) = v127;
  LODWORD(v3) = v127;
  int v130 = v476 + v121 + (v128 ^ __ROR4__(v116, 2) ^ v124) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v124;
  LODWORD(v3) = v124;
  int v131 = v3 >> 2;
  int v132 = v115;
  int v133 = v76 ^ v67 ^ __ROR4__(v115, 31) ^ __ROR4__(v123, 31);
  HIDWORD(v3) = v133;
  LODWORD(v3) = v133;
  int v461 = v3 >> 31;
  HIDWORD(v3) = v130;
  LODWORD(v3) = v130;
  int v134 = v461 + v125 + (v131 ^ __ROR4__(v120, 2) ^ v127) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v127;
  LODWORD(v3) = v127;
  int v135 = v3 >> 2;
  int v136 = v135 ^ __ROR4__(v124, 2) ^ v130;
  int v137 = v80 ^ v72 ^ __ROR4__(v106, 31) ^ __ROR4__(v126, 31);
  HIDWORD(v3) = v137;
  LODWORD(v3) = v137;
  int v467 = v3 >> 31;
  HIDWORD(v3) = v134;
  LODWORD(v3) = v134;
  int v138 = v467 + v128 + v136 + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v130;
  LODWORD(v3) = v130;
  int v139 = v3 >> 2;
  LODWORD(v3) = v84 ^ v76 ^ __ROR4__(v111, 31) ^ __ROR4__(v129, 31);
  int v140 = v3;
  HIDWORD(v3) = v3;
  int v464 = v3 >> 31;
  HIDWORD(v3) = v138;
  LODWORD(v3) = v138;
  unsigned int v141 = v464 + v131 + (v139 ^ __ROR4__(v127, 2) ^ v134) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v134;
  LODWORD(v3) = v134;
  int v142 = v3 >> 2;
  LODWORD(v3) = v80 ^ __ROR4__(v86, 31) ^ __ROR4__(v114, 31) ^ __ROR4__(v133, 31);
  int v143 = v3;
  HIDWORD(v3) = v3;
  int v144 = v3 >> 31;
  HIDWORD(v3) = v141;
  LODWORD(v3) = v141;
  unsigned int v145 = v144 + v135 + (v142 ^ __ROR4__(v130, 2) ^ v138) + 1859775393 + (v3 >> 27);
  HIDWORD(v3) = v138;
  LODWORD(v3) = v138;
  int v146 = v3 >> 2;
  int v147 = v84 ^ __ROR4__(v93, 31) ^ __ROR4__(v119, 31) ^ __ROR4__(v137, 31);
  HIDWORD(v3) = v147;
  LODWORD(v3) = v147;
  int v470 = v3 >> 31;
  HIDWORD(v3) = v145;
  LODWORD(v3) = v145;
  unsigned int v148 = v470 + v139 + (v146 ^ __ROR4__(v134, 2) ^ v141) + 1859775393 + (v3 >> 27);
  unint64_t v150 = __PAIR64__(v141, __ROR4__(v86, 31));
  int v149 = v458 ^ v150;
  LODWORD(v150) = v141;
  int v151 = v150 >> 2;
  int v152 = v149 ^ __ROR4__(v123, 31) ^ __ROR4__(v140, 31);
  HIDWORD(v150) = v152;
  LODWORD(v150) = v152;
  int v455 = v150 >> 31;
  HIDWORD(v150) = v148;
  LODWORD(v150) = v148;
  unsigned int v153 = v455 + v142 + (v151 ^ __ROR4__(v138, 2) ^ v145) + 1859775393 + (v150 >> 27);
  unint64_t v155 = __PAIR64__(v145, __ROR4__(v93, 31));
  int v154 = v448 ^ v155;
  LODWORD(v155) = v145;
  int v156 = v155 >> 2;
  LODWORD(v155) = v154 ^ __ROR4__(v126, 31) ^ __ROR4__(v143, 31);
  int v157 = v155;
  HIDWORD(v155) = v155;
  int v449 = v155 >> 31;
  HIDWORD(v155) = v153;
  LODWORD(v155) = v153;
  unsigned int v158 = v449 + v146 + (v156 ^ __ROR4__(v141, 2) ^ v148) + 1859775393 + (v155 >> 27);
  unint64_t v160 = __PAIR64__(v148, __ROR4__(v99, 31));
  int v159 = v473 ^ v160;
  LODWORD(v160) = v148;
  int v161 = v160 >> 2;
  LODWORD(v160) = v159 ^ __ROR4__(v129, 31) ^ __ROR4__(v147, 31);
  int v162 = v160;
  HIDWORD(v160) = v160;
  int v443 = v160 >> 31;
  HIDWORD(v160) = v158;
  LODWORD(v160) = v158;
  unsigned int v163 = v443 + v151 + (v161 ^ __ROR4__(v145, 2) ^ v153) + 1859775393 + (v160 >> 27);
  unint64_t v165 = __PAIR64__(v153, __ROR4__(v132, 31));
  int v164 = v452 ^ v165;
  LODWORD(v165) = v153;
  int v166 = v165 >> 2;
  LODWORD(v165) = v164 ^ __ROR4__(v133, 31) ^ __ROR4__(v152, 31);
  int v167 = v165;
  HIDWORD(v165) = v165;
  int v441 = v165 >> 31;
  HIDWORD(v165) = v163;
  LODWORD(v165) = v163;
  unsigned int v168 = v441 + v156 + (v166 ^ __ROR4__(v148, 2) ^ v158) + 1859775393 + (v165 >> 27);
  unint64_t v170 = __PAIR64__(v158, __ROR4__(v106, 31));
  int v169 = v445 ^ v170;
  LODWORD(v170) = v158;
  int v171 = v170 >> 2;
  LODWORD(v170) = v169 ^ __ROR4__(v137, 31) ^ __ROR4__(v157, 31);
  int v172 = v170;
  HIDWORD(v170) = v170;
  int v446 = v170 >> 31;
  HIDWORD(v170) = v168;
  LODWORD(v170) = v168;
  unsigned int v173 = v446 + v161 + (v171 ^ __ROR4__(v153, 2) ^ v163) + 1859775393 + (v170 >> 27);
  unint64_t v175 = __PAIR64__(v163, __ROR4__(v111, 31));
  int v174 = v438 ^ v175;
  LODWORD(v175) = v163;
  int v176 = v175 >> 2;
  LODWORD(v175) = v174 ^ __ROR4__(v140, 31) ^ __ROR4__(v162, 31);
  int v177 = v175;
  HIDWORD(v175) = v175;
  int v453 = v175 >> 31;
  HIDWORD(v175) = v173;
  LODWORD(v175) = v173;
  unsigned int v178 = v453 + v166 + (v176 ^ __ROR4__(v158, 2) ^ v168) + 1859775393 + (v175 >> 27);
  unint64_t v180 = __PAIR64__(v168, __ROR4__(v114, 31));
  int v179 = v436 ^ v180;
  LODWORD(v180) = v168;
  int v181 = v180 >> 2;
  LODWORD(v180) = v179 ^ __ROR4__(v143, 31) ^ __ROR4__(v167, 31);
  int v182 = v180;
  HIDWORD(v180) = v180;
  int v459 = v180 >> 31;
  HIDWORD(v180) = v178;
  LODWORD(v180) = v178;
  unsigned int v183 = v459 + v171 + (v181 ^ __ROR4__(v163, 2) ^ v173) + 1859775393 + (v180 >> 27);
  unint64_t v185 = __PAIR64__(v173, __ROR4__(v119, 31));
  int v184 = v434 ^ v185;
  LODWORD(v185) = v173;
  int v186 = v185 >> 2;
  LODWORD(v185) = v184 ^ __ROR4__(v147, 31) ^ __ROR4__(v172, 31);
  int v187 = v185;
  HIDWORD(v185) = v185;
  int v474 = v185 >> 31;
  HIDWORD(v185) = v183;
  LODWORD(v185) = v183;
  unsigned int v188 = v474 + v176 + (v186 ^ __ROR4__(v168, 2) ^ v178) + 1859775393 + (v185 >> 27);
  LODWORD(v185) = v476 ^ __ROR4__(v123, 31) ^ __ROR4__(v152, 31) ^ __ROR4__(v177, 31);
  HIDWORD(v185) = v185;
  int v189 = v185;
  int v477 = v185 >> 31;
  HIDWORD(v185) = v188;
  LODWORD(v185) = v188;
  unsigned int v190 = v477
       + v181
       + ((v183 | __ROR4__(v178, 2)) & __ROR4__(v173, 2) | v183 & __ROR4__(v178, 2))
       + (v185 >> 27)
       - 1894007588;
  int v191 = v461 ^ __ROR4__(v126, 31) ^ __ROR4__(v157, 31);
  LODWORD(v185) = __ROR4__(v182, 31);
  int v192 = v191 ^ v185;
  unint64_t v194 = __PAIR64__(v191 ^ v185, __ROR4__(v183, 2));
  int v193 = v188 & v194;
  LODWORD(v194) = v192;
  int v439 = v194 >> 31;
  HIDWORD(v194) = v190;
  LODWORD(v194) = v190;
  unsigned int v195 = v439 + v186 + ((v188 | __ROR4__(v183, 2)) & __ROR4__(v178, 2) | v193) + (v194 >> 27);
  unint64_t v196 = __PAIR64__(v178, __ROR4__(v188, 2));
  int v197 = (v190 | __ROR4__(v188, 2)) & __ROR4__(v183, 2) | v190 & v196;
  LODWORD(v196) = v178;
  int v198 = v196 >> 2;
  int v199 = v467 ^ __ROR4__(v129, 31) ^ __ROR4__(v162, 31) ^ __ROR4__(v187, 31);
  HIDWORD(v196) = v199;
  LODWORD(v196) = v199;
  int v468 = v196 >> 31;
  v195 -= 1894007588;
  HIDWORD(v196) = v195;
  LODWORD(v196) = v195;
  unsigned int v200 = v468 + v198 + v197 + (v196 >> 27);
  unint64_t v202 = __PAIR64__(v183, __ROR4__(v133, 31));
  int v201 = v464 ^ v202;
  LODWORD(v202) = v183;
  int v203 = v202 >> 2;
  int v204 = v201 ^ __ROR4__(v167, 31) ^ __ROR4__(v189, 31);
  HIDWORD(v202) = v204;
  LODWORD(v202) = v204;
  int v465 = v202 >> 31;
  v200 -= 1894007588;
  HIDWORD(v202) = v200;
  LODWORD(v202) = v200;
  unsigned int v205 = v465 + v203 + ((v195 | __ROR4__(v190, 2)) & __ROR4__(v188, 2) | v195 & __ROR4__(v190, 2)) + (v202 >> 27);
  unint64_t v207 = __PAIR64__(v188, __ROR4__(v137, 31));
  int v206 = v144 ^ v207;
  LODWORD(v207) = v188;
  int v208 = v207 >> 2;
  int v209 = v206 ^ __ROR4__(v172, 31) ^ __ROR4__(v192, 31);
  HIDWORD(v207) = v209;
  LODWORD(v207) = v209;
  int v462 = v207 >> 31;
  v205 -= 1894007588;
  HIDWORD(v207) = v205;
  LODWORD(v207) = v205;
  int v210 = v462 + v208 + ((v200 | __ROR4__(v195, 2)) & __ROR4__(v190, 2) | v200 & __ROR4__(v195, 2)) + (v207 >> 27);
  unint64_t v212 = __PAIR64__(v190, __ROR4__(v140, 31));
  int v211 = v470 ^ v212;
  LODWORD(v212) = v190;
  int v213 = v212 >> 2;
  unsigned int v214 = v210 - 1894007588;
  LODWORD(v212) = v211 ^ __ROR4__(v177, 31) ^ __ROR4__(v199, 31);
  int v215 = v212;
  HIDWORD(v212) = v212;
  int v471 = v212 >> 31;
  HIDWORD(v212) = v210 - 1894007588;
  LODWORD(v212) = v210 - 1894007588;
  int v216 = v471 + v213 + ((v205 | __ROR4__(v200, 2)) & __ROR4__(v195, 2) | v205 & __ROR4__(v200, 2)) + (v212 >> 27);
  unint64_t v218 = __PAIR64__(v195, __ROR4__(v143, 31));
  int v217 = v455 ^ v218;
  LODWORD(v218) = v195;
  int v219 = v218 >> 2;
  int v220 = v217 ^ __ROR4__(v182, 31);
  LODWORD(v218) = __ROR4__(v204, 31);
  int v221 = v220 ^ v218;
  int v222 = v204;
  unint64_t v224 = __PAIR64__(v220 ^ v218, __ROR4__(v205, 2));
  int v223 = v214 & v224;
  LODWORD(v224) = v221;
  int v456 = v224 >> 31;
  int v225 = v456 + v219 + ((v214 | __ROR4__(v205, 2)) & __ROR4__(v200, 2) | v223);
  unsigned int v226 = v216 - 1894007588;
  HIDWORD(v224) = v216 - 1894007588;
  LODWORD(v224) = v216 - 1894007588;
  int v227 = v225 + (v224 >> 27);
  int v228 = ((v216 - 1894007588) | __ROR4__(v214, 2)) & __ROR4__(v205, 2) | (v216 - 1894007588) & __ROR4__(v214, 2);
  unint64_t v230 = __PAIR64__(v200, __ROR4__(v147, 31));
  int v229 = v449 ^ v230;
  LODWORD(v230) = v200;
  int v231 = v230 >> 2;
  LODWORD(v230) = v229 ^ __ROR4__(v187, 31) ^ __ROR4__(v209, 31);
  int v232 = v230;
  HIDWORD(v230) = v230;
  int v450 = v230 >> 31;
  unsigned int v233 = v227 - 1894007588;
  HIDWORD(v230) = v227 - 1894007588;
  LODWORD(v230) = v227 - 1894007588;
  int v234 = v450 + v231 + v228 + (v230 >> 27);
  unint64_t v235 = __PAIR64__(v205, __ROR4__(v226, 2));
  int v236 = ((v227 - 1894007588) | __ROR4__(v226, 2)) & __ROR4__(v214, 2) | (v227 - 1894007588) & v235;
  LODWORD(v235) = v205;
  int v237 = v235 >> 2;
  int v238 = v443 ^ __ROR4__(v152, 31) ^ __ROR4__(v189, 31);
  int v239 = v189;
  int v241 = v215;
  int v435 = v221;
  int v437 = v215;
  LODWORD(v235) = v238 ^ __ROR4__(v215, 31);
  int v240 = v235;
  HIDWORD(v235) = v235;
  int v444 = v235 >> 31;
  int v242 = v444 + v237 + v236;
  unsigned int v243 = v234 - 1894007588;
  HIDWORD(v235) = v234 - 1894007588;
  LODWORD(v235) = v234 - 1894007588;
  unsigned int v244 = v242 + (v235 >> 27);
  int v245 = ((v234 - 1894007588) | __ROR4__(v233, 2)) & __ROR4__(v226, 2) | (v234 - 1894007588) & __ROR4__(v233, 2);
  unint64_t v247 = __PAIR64__(v214, __ROR4__(v157, 31));
  int v246 = v441 ^ v247;
  LODWORD(v247) = v214;
  int v248 = v247 >> 2;
  LODWORD(v247) = v246 ^ __ROR4__(v192, 31) ^ __ROR4__(v221, 31);
  int v249 = v247;
  HIDWORD(v247) = v247;
  int v442 = v247 >> 31;
  v244 -= 1894007588;
  HIDWORD(v247) = v244;
  LODWORD(v247) = v244;
  unsigned int v250 = v442 + v248 + v245 + (v247 >> 27);
  unint64_t v252 = __PAIR64__(v226, __ROR4__(v162, 31));
  int v251 = v446 ^ v252;
  LODWORD(v252) = v226;
  int v253 = v252 >> 2;
  int v254 = v251 ^ __ROR4__(v199, 31) ^ __ROR4__(v232, 31);
  HIDWORD(v252) = v254;
  LODWORD(v252) = v254;
  int v447 = v252 >> 31;
  v250 -= 1894007588;
  HIDWORD(v252) = v250;
  LODWORD(v252) = v250;
  int v255 = v447 + v253 + ((v244 | __ROR4__(v243, 2)) & __ROR4__(v233, 2) | v244 & __ROR4__(v243, 2)) + (v252 >> 27);
  unint64_t v257 = __PAIR64__(v233, __ROR4__(v167, 31));
  int v256 = v453 ^ v257;
  LODWORD(v257) = v233;
  int v258 = v257 >> 2;
  unsigned int v259 = v255 - 1894007588;
  LODWORD(v257) = v256 ^ __ROR4__(v222, 31) ^ __ROR4__(v240, 31);
  int v260 = v257;
  HIDWORD(v257) = v257;
  int v454 = v257 >> 31;
  HIDWORD(v257) = v255 - 1894007588;
  LODWORD(v257) = v255 - 1894007588;
  unsigned int v261 = v454 + v258 + ((v250 | __ROR4__(v244, 2)) & __ROR4__(v243, 2) | v250 & __ROR4__(v244, 2)) + (v257 >> 27);
  unint64_t v263 = __PAIR64__(v243, __ROR4__(v172, 31));
  int v262 = v459 ^ v263;
  LODWORD(v263) = v243;
  int v264 = v263 >> 2;
  int v265 = v262 ^ __ROR4__(v209, 31);
  LODWORD(v263) = __ROR4__(v249, 31);
  int v266 = v265 ^ v263;
  unint64_t v268 = __PAIR64__(v265 ^ v263, __ROR4__(v250, 2));
  int v267 = v259 & v268;
  LODWORD(v268) = v266;
  int v460 = v268 >> 31;
  v261 -= 1894007588;
  HIDWORD(v268) = v261;
  LODWORD(v268) = v261;
  int v269 = v460 + v264 + ((v259 | __ROR4__(v250, 2)) & __ROR4__(v244, 2) | v267) + (v268 >> 27);
  unint64_t v271 = __PAIR64__(v244, __ROR4__(v177, 31));
  int v270 = v474 ^ v271;
  LODWORD(v271) = v244;
  int v272 = v271 >> 2;
  int v273 = v270 ^ __ROR4__(v241, 31) ^ __ROR4__(v254, 31);
  HIDWORD(v271) = v273;
  LODWORD(v271) = v273;
  int v475 = v271 >> 31;
  unsigned int v274 = v269 - 1894007588;
  HIDWORD(v271) = v269 - 1894007588;
  LODWORD(v271) = v269 - 1894007588;
  unsigned int v275 = v475 + v272 + ((v261 | __ROR4__(v259, 2)) & __ROR4__(v250, 2) | v261 & __ROR4__(v259, 2)) + (v271 >> 27);
  unint64_t v276 = __PAIR64__(v250, __ROR4__(v261, 2));
  int v277 = ((v269 - 1894007588) | __ROR4__(v261, 2)) & __ROR4__(v259, 2) | (v269 - 1894007588) & v276;
  LODWORD(v276) = v250;
  int v278 = v276 >> 2;
  int v279 = v477 ^ __ROR4__(v182, 31) ^ __ROR4__(v221, 31) ^ __ROR4__(v260, 31);
  HIDWORD(v276) = v279;
  LODWORD(v276) = v279;
  int v478 = v276 >> 31;
  v275 -= 1894007588;
  HIDWORD(v276) = v275;
  LODWORD(v276) = v275;
  int v280 = v478 + v278 + v277 + (v276 >> 27);
  unint64_t v282 = __PAIR64__(v259, __ROR4__(v187, 31));
  int v281 = v439 ^ v282;
  LODWORD(v282) = v259;
  int v283 = v282 >> 2;
  int v284 = v232;
  LODWORD(v282) = v281 ^ __ROR4__(v232, 31) ^ __ROR4__(v266, 31);
  int v285 = v282;
  HIDWORD(v282) = v282;
  int v440 = v282 >> 31;
  unsigned int v286 = v280 - 1894007588;
  HIDWORD(v282) = v280 - 1894007588;
  LODWORD(v282) = v280 - 1894007588;
  int v287 = v440 + v283 + ((v275 | __ROR4__(v274, 2)) & __ROR4__(v261, 2) | v275 & __ROR4__(v274, 2)) + (v282 >> 27);
  int v288 = ((v280 - 1894007588) | __ROR4__(v275, 2)) & __ROR4__(v274, 2) | (v280 - 1894007588) & __ROR4__(v275, 2);
  unint64_t v290 = __PAIR64__(v261, __ROR4__(v239, 31));
  int v289 = v468 ^ v290;
  LODWORD(v290) = v261;
  int v291 = v290 >> 2;
  int v292 = v240;
  LODWORD(v290) = v289 ^ __ROR4__(v240, 31) ^ __ROR4__(v273, 31);
  int v293 = v290;
  HIDWORD(v290) = v290;
  int v469 = v290 >> 31;
  HIDWORD(v290) = v287 - 1894007588;
  LODWORD(v290) = v287 - 1894007588;
  int v294 = v469 + v291 + v288 + (v290 >> 27);
  unint64_t v296 = __PAIR64__(v274, __ROR4__(v192, 31));
  int v295 = v465 ^ v296;
  LODWORD(v296) = v274;
  int v297 = v296 >> 2;
  int v298 = v249;
  LODWORD(v296) = v295 ^ __ROR4__(v249, 31) ^ __ROR4__(v279, 31);
  int v299 = v296;
  HIDWORD(v296) = v296;
  int v466 = v296 >> 31;
  HIDWORD(v296) = v294 - 1894007588;
  LODWORD(v296) = v294 - 1894007588;
  int v300 = v466
       + v297
       + (((v287 - 1894007588) | __ROR4__(v286, 2)) & __ROR4__(v275, 2) | (v287 - 1894007588) & __ROR4__(v286, 2))
       + (v296 >> 27);
  unint64_t v302 = __PAIR64__(v275, __ROR4__(v199, 31));
  int v301 = v462 ^ v302;
  LODWORD(v302) = v275;
  int v303 = v302 >> 2;
  int v304 = v301 ^ __ROR4__(v254, 31);
  LODWORD(v302) = __ROR4__(v285, 31);
  int v305 = v304 ^ v302;
  unint64_t v307 = __PAIR64__(v304 ^ v302, __ROR4__(v287 - 1894007588, 2));
  int v306 = (v294 - 1894007588) & v307;
  LODWORD(v307) = v305;
  int v463 = v307 >> 31;
  int v308 = v463 + v303 + (((v294 - 1894007588) | __ROR4__(v287 - 1894007588, 2)) & __ROR4__(v286, 2) | v306);
  int v309 = v300 - 1894007588;
  HIDWORD(v307) = v300 - 1894007588;
  LODWORD(v307) = v300 - 1894007588;
  int v310 = v308 + (v307 >> 27);
  int v311 = ((v300 - 1894007588) | __ROR4__(v294 - 1894007588, 2)) & __ROR4__(v287 - 1894007588, 2) | (v300 - 1894007588) & __ROR4__(v294 - 1894007588, 2);
  unint64_t v313 = __PAIR64__(v286, __ROR4__(v222, 31));
  int v312 = v471 ^ v313;
  LODWORD(v313) = v286;
  int v314 = v313 >> 2;
  LODWORD(v313) = v312 ^ __ROR4__(v260, 31) ^ __ROR4__(v293, 31);
  int v315 = v313;
  HIDWORD(v313) = v313;
  int v472 = v313 >> 31;
  v310 -= 1894007588;
  HIDWORD(v313) = v310;
  LODWORD(v313) = v310;
  unsigned int v316 = v472 + v314 + v311 + (v313 >> 27) - 1894007588;
  unint64_t v318 = __PAIR64__(v287 - 1894007588, __ROR4__(v209, 31));
  int v317 = v456 ^ v318;
  LODWORD(v318) = v287 - 1894007588;
  int v319 = v318 >> 2;
  HIDWORD(v318) = v309;
  LODWORD(v318) = v309;
  int v320 = v318 >> 2;
  LODWORD(v318) = v317 ^ __ROR4__(v266, 31) ^ __ROR4__(v299, 31);
  int v321 = v318;
  HIDWORD(v318) = v318;
  int v457 = v318 >> 31;
  HIDWORD(v318) = v316;
  LODWORD(v318) = v316;
  unsigned int v322 = v457 + v319 + (v320 ^ __ROR4__(v294 - 1894007588, 2) ^ v310) - 899497514 + (v318 >> 27);
  HIDWORD(v318) = v294 - 1894007588;
  LODWORD(v318) = v294 - 1894007588;
  int v323 = v318 >> 2;
  HIDWORD(v318) = v310;
  LODWORD(v318) = v310;
  int v324 = v318 >> 2;
  LODWORD(v318) = v450 ^ __ROR4__(v437, 31) ^ __ROR4__(v273, 31) ^ __ROR4__(v305, 31);
  int v325 = v318;
  HIDWORD(v318) = v318;
  int v326 = v318 >> 31;
  HIDWORD(v318) = v322;
  LODWORD(v318) = v322;
  unsigned int v327 = v326 + v323 + (v324 ^ __ROR4__(v309, 2) ^ v316) - 899497514 + (v318 >> 27);
  unint64_t v329 = __PAIR64__(v316, __ROR4__(v435, 31));
  int v328 = v444 ^ v329;
  LODWORD(v329) = v316;
  int v330 = v329 >> 2;
  LODWORD(v329) = v328 ^ __ROR4__(v279, 31) ^ __ROR4__(v315, 31);
  int v331 = v329;
  HIDWORD(v329) = v329;
  int v451 = v329 >> 31;
  HIDWORD(v329) = v327;
  LODWORD(v329) = v327;
  unsigned int v332 = v451 + v320 + (v330 ^ __ROR4__(v310, 2) ^ v322) - 899497514 + (v329 >> 27);
  unint64_t v334 = __PAIR64__(v322, __ROR4__(v284, 31));
  int v333 = v442 ^ v334;
  LODWORD(v334) = v322;
  int v335 = v334 >> 2;
  LODWORD(v334) = v333 ^ __ROR4__(v285, 31) ^ __ROR4__(v321, 31);
  int v336 = v334;
  HIDWORD(v334) = v334;
  int v337 = v334 >> 31;
  HIDWORD(v334) = v332;
  LODWORD(v334) = v332;
  int v338 = v337 + v324 + (v335 ^ __ROR4__(v316, 2) ^ v327) - 899497514 + (v334 >> 27);
  unint64_t v340 = __PAIR64__(v327, __ROR4__(v292, 31));
  int v339 = v447 ^ v340;
  LODWORD(v340) = v327;
  int v341 = v340 >> 2;
  LODWORD(v340) = v339 ^ __ROR4__(v293, 31) ^ __ROR4__(v325, 31);
  int v342 = v340;
  HIDWORD(v340) = v340;
  int v343 = v340 >> 31;
  HIDWORD(v340) = v338;
  LODWORD(v340) = v338;
  int v344 = v343 + v330 + (v341 ^ __ROR4__(v322, 2) ^ v332) - 899497514 + (v340 >> 27);
  unint64_t v346 = __PAIR64__(v332, __ROR4__(v298, 31));
  int v345 = v454 ^ v346;
  LODWORD(v346) = v332;
  int v347 = v346 >> 2;
  int v348 = v345 ^ __ROR4__(v299, 31) ^ __ROR4__(v331, 31);
  HIDWORD(v346) = v348;
  LODWORD(v346) = v348;
  int v349 = v346 >> 31;
  HIDWORD(v346) = v344;
  LODWORD(v346) = v344;
  unsigned int v350 = v349 + v335 + (v347 ^ __ROR4__(v327, 2) ^ v338) - 899497514 + (v346 >> 27);
  LODWORD(v346) = v460 ^ __ROR4__(v254, 31) ^ __ROR4__(v305, 31) ^ __ROR4__(v336, 31);
  int v351 = v346;
  HIDWORD(v346) = v346;
  int v352 = (v346 >> 31) + v341;
  HIDWORD(v346) = v338;
  LODWORD(v346) = v338;
  int v353 = v346 >> 2;
  unint64_t v354 = __PAIR64__(v350, __ROR4__(v332, 2));
  int v355 = v352 + (v353 ^ v354 ^ v344) - 899497514;
  LODWORD(v354) = v350;
  unsigned int v356 = v355 + (v354 >> 27);
  LODWORD(v354) = v475 ^ __ROR4__(v260, 31) ^ __ROR4__(v315, 31) ^ __ROR4__(v342, 31);
  int v357 = v354;
  HIDWORD(v354) = v354;
  int v358 = (v354 >> 31) + v347;
  HIDWORD(v354) = v344;
  LODWORD(v354) = v344;
  int v359 = v354 >> 2;
  unint64_t v360 = __PAIR64__(v356, __ROR4__(v338, 2));
  int v361 = v358 + (v359 ^ v360 ^ v350) - 899497514;
  LODWORD(v360) = v356;
  unsigned int v362 = v361 + (v360 >> 27);
  LODWORD(v360) = v478 ^ __ROR4__(v266, 31) ^ __ROR4__(v321, 31) ^ __ROR4__(v348, 31);
  int v363 = v360;
  HIDWORD(v360) = v360;
  int v364 = (v360 >> 31) + v353;
  HIDWORD(v360) = v350;
  LODWORD(v360) = v350;
  int v365 = v360 >> 2;
  unint64_t v366 = __PAIR64__(v362, __ROR4__(v344, 2));
  int v367 = v364 + (v365 ^ v366 ^ v356) - 899497514;
  LODWORD(v366) = v362;
  unsigned int v368 = v367 + (v366 >> 27);
  LODWORD(v366) = v440 ^ __ROR4__(v273, 31) ^ __ROR4__(v325, 31) ^ __ROR4__(v351, 31);
  int v369 = v366;
  HIDWORD(v366) = v366;
  int v370 = (v366 >> 31) + v359;
  HIDWORD(v366) = v356;
  LODWORD(v366) = v356;
  int v371 = v366 >> 2;
  unint64_t v372 = __PAIR64__(v368, __ROR4__(v350, 2));
  int v373 = v370 + (v371 ^ v372 ^ v362) - 899497514;
  LODWORD(v372) = v368;
  unsigned int v374 = v373 + (v372 >> 27);
  LODWORD(v372) = v469 ^ __ROR4__(v279, 31) ^ __ROR4__(v331, 31) ^ __ROR4__(v357, 31);
  int v375 = v372;
  HIDWORD(v372) = v372;
  int v376 = (v372 >> 31) + v365;
  HIDWORD(v372) = v362;
  LODWORD(v372) = v362;
  int v377 = v372 >> 2;
  unint64_t v378 = __PAIR64__(v374, __ROR4__(v356, 2));
  int v379 = v376 + (v377 ^ v378 ^ v368) - 899497514;
  LODWORD(v378) = v374;
  unsigned int v380 = v379 + (v378 >> 27);
  int v381 = v466 ^ __ROR4__(v285, 31) ^ __ROR4__(v336, 31) ^ __ROR4__(v363, 31);
  HIDWORD(v378) = v381;
  LODWORD(v378) = v381;
  int v382 = (v378 >> 31) + v371;
  HIDWORD(v378) = v368;
  LODWORD(v378) = v368;
  int v383 = v378 >> 2;
  unint64_t v384 = __PAIR64__(v380, __ROR4__(v362, 2));
  int v385 = v382 + (v383 ^ v384 ^ v374) - 899497514;
  LODWORD(v384) = v380;
  unsigned int v386 = v385 + (v384 >> 27);
  int v387 = v463 ^ __ROR4__(v293, 31) ^ __ROR4__(v342, 31) ^ __ROR4__(v369, 31);
  HIDWORD(v384) = v387;
  LODWORD(v384) = v387;
  int v388 = (v384 >> 31) + v377;
  HIDWORD(v384) = v374;
  LODWORD(v384) = v374;
  int v389 = v384 >> 2;
  unint64_t v390 = __PAIR64__(v386, __ROR4__(v368, 2));
  int v391 = v388 + (v389 ^ v390 ^ v380) - 899497514;
  LODWORD(v390) = v386;
  unsigned int v392 = v391 + (v390 >> 27);
  int v393 = v472 ^ __ROR4__(v299, 31) ^ __ROR4__(v348, 31) ^ __ROR4__(v375, 31);
  HIDWORD(v390) = v393;
  LODWORD(v390) = v393;
  int v394 = (v390 >> 31) + v383;
  HIDWORD(v390) = v380;
  LODWORD(v390) = v380;
  int v395 = v390 >> 2;
  unint64_t v396 = __PAIR64__(v392, __ROR4__(v374, 2));
  int v397 = v394 + (v395 ^ v396 ^ v386) - 899497514;
  LODWORD(v396) = v392;
  unsigned int v398 = v397 + (v396 >> 27);
  int v399 = v457 ^ __ROR4__(v305, 31) ^ __ROR4__(v351, 31) ^ __ROR4__(v381, 31);
  HIDWORD(v396) = v399;
  LODWORD(v396) = v399;
  int v400 = (v396 >> 31) + v389;
  HIDWORD(v396) = v386;
  LODWORD(v396) = v386;
  int v401 = v396 >> 2;
  unint64_t v402 = __PAIR64__(v398, __ROR4__(v380, 2));
  int v403 = v400 + (v401 ^ v402 ^ v392) - 899497514;
  LODWORD(v402) = v398;
  unsigned int v404 = v403 + (v402 >> 27);
  LODWORD(v402) = v326 ^ __ROR4__(v315, 31) ^ __ROR4__(v357, 31) ^ __ROR4__(v387, 31);
  int v405 = v402;
  HIDWORD(v402) = v402;
  int v406 = (v402 >> 31) + v395;
  HIDWORD(v402) = v392;
  LODWORD(v402) = v392;
  int v407 = v402 >> 2;
  unint64_t v408 = __PAIR64__(v404, __ROR4__(v386, 2));
  int v409 = v406 + (v407 ^ v408 ^ v398);
  LODWORD(v408) = v404;
  unsigned int v410 = v409 - 899497514 + (v408 >> 27);
  unint64_t v412 = __PAIR64__(v398, __ROR4__(v363, 31));
  int v411 = v451 ^ __ROR4__(v321, 31) ^ v412;
  LODWORD(v412) = v398;
  int v413 = v412 >> 2;
  LODWORD(v412) = v411 ^ __ROR4__(v393, 31);
  int v414 = v412;
  HIDWORD(v412) = v412;
  int v415 = (v412 >> 31) + v401;
  HIDWORD(v412) = v410;
  LODWORD(v412) = v410;
  unsigned int v416 = v415 + (v413 ^ __ROR4__(v392, 2) ^ v404) - 899497514 + (v412 >> 27);
  LODWORD(v412) = v337 ^ __ROR4__(v325, 31) ^ __ROR4__(v369, 31) ^ __ROR4__(v399, 31);
  HIDWORD(v412) = v412;
  int v417 = (v412 >> 31) + v407;
  HIDWORD(v412) = v404;
  LODWORD(v412) = v404;
  int v418 = v412 >> 2;
  unint64_t v419 = __PAIR64__(v416, __ROR4__(v398, 2));
  int v420 = v417 + (v418 ^ v419 ^ v410);
  LODWORD(v419) = v416;
  int v421 = v420 - 899497514 + (v419 >> 27);
  unint64_t v423 = __PAIR64__(v410, __ROR4__(v405, 31));
  unsigned int v422 = v343 ^ __ROR4__(v331, 31) ^ __ROR4__(v375, 31) ^ v423;
  LODWORD(v423) = v410;
  int v424 = v423 >> 2;
  unint64_t v425 = __PAIR64__(v422, __ROR4__(v404, 2));
  int v426 = v424 ^ v425 ^ v416;
  LODWORD(v425) = v422;
  int v427 = (v425 >> 31) + v413;
  HIDWORD(v425) = v421;
  LODWORD(v425) = v421;
  uint64_t result = (v425 >> 27);
  unsigned int v429 = v427 + v426 - 899497514 + result;
  LODWORD(v425) = v349 ^ __ROR4__(v336, 31) ^ __ROR4__(v381, 31) ^ __ROR4__(v414, 31);
  HIDWORD(v425) = v425;
  int v430 = v480 + (v425 >> 31) + v418;
  HIDWORD(v425) = v416;
  LODWORD(v425) = v416;
  int v431 = v425 >> 2;
  unint64_t v432 = __PAIR64__(v429, __ROR4__(v410, 2));
  int v433 = v430 + (v431 ^ v432 ^ v421) - 899497514;
  LODWORD(v4memset(&v9[1], 0, 32) = v429;
  *a1 = v433 + (v432 >> 27);
  a1[1] = v429 + v482;
  HIDWORD(v4memset(&v9[1], 0, 32) = v421;
  LODWORD(v4memset(&v9[1], 0, 32) = v421;
  a1[2] = (v432 >> 2) + v479;
  a1[3] = v431 + v481;
  a1[4] = v424 + v484;
  return result;
}

void sub_1000294C0(char **a1, char *__s1, const char *a3)
{
  int v6 = strdup(__s1);
  unsigned int v7 = strdup(a3);
  int v8 = v7;
  *a1 = v6;
  if (v7)
  {
    unint64_t v9 = 1LL;
    while (1)
    {
      int v10 = *v7;
      if (!*v7) {
        break;
      }
      while (v10 == 32)
      {
        int v11 = *++v7;
        int v10 = v11;
      }

      if (!v10) {
        break;
      }
      unsigned int v12 = v9 + 1;
      a1[v9] = v7;
      int v13 = strchr(v7, 32);
      if (v13)
      {
        *int v13 = 0;
        unsigned int v7 = v13 + 1;
        if (v9++ < 0x1D) {
          continue;
        }
      }

      goto LABEL_12;
    }

    unsigned int v12 = v9;
  }

  else
  {
    unsigned int v12 = 1;
  }

LABEL_12:
  a1[v12] = 0LL;
  execv(__s1, a1);
  perror("execv");
  free(v6);
  free(v8);
  exit(0);
}

uint64_t sub_10002958C(uint64_t a1)
{
  return sub_100016E40(4LL, "Could not unlink existing ctrl_iface socket '%s'", v2, v3, v4, v5, v6, v7, a1);
}

void sub_1000295D0()
{
}

void sub_1000295FC(os_log_s *a1)
{
}

void sub_100029670( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000296A4(os_log_s *a1)
{
}

void sub_100029718()
{
}

void sub_100029744()
{
}

void sub_100029770()
{
}

void sub_1000297D0()
{
}

void sub_1000297FC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029830()
{
}

void sub_10002985C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000298C4()
{
}

void sub_100029924()
{
}

void sub_100029984()
{
}

void sub_1000299E4()
{
}

void sub_100029A48()
{
}

void sub_100029AAC()
{
}

void sub_100029B10(int a1, os_log_s *a2)
{
  int v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "Failed to get RSC for index %d (%{errno}d)",  (uint8_t *)v5,  0xEu);
}

void sub_100029BAC(os_log_s *a1)
{
}

void sub_100029C20(os_log_s *a1)
{
}

void sub_100029C94()
{
}

void sub_100029CF4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100029D5C()
{
}

void sub_100029D94()
{
}

void sub_100029DF4()
{
}

void sub_100029E54()
{
}

void sub_100029EB4()
{
}

void sub_100029F14()
{
}

void sub_100029F74()
{
}

void sub_100029FD4()
{
}

void sub_10002A034()
{
}

void sub_10002A094(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 136446466;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_ERROR,  "Apple80211BindToInterface() failed (%{public}s, %d)",  (uint8_t *)&v3,  0x12u);
}

void sub_10002A118()
{
}

void sub_10002A178()
{
}

void sub_10002A1A4()
{
}

void sub_10002A204()
{
}

void sub_10002A264()
{
  sub_10002515C( (void *)&_mh_execute_header,  v0,  v1,  "Mode changed event received, op mode query failed (ret = %d)",  v2,  v3,  v4,  v5,  v6);
  sub_100025178();
}

void sub_10002A2C4()
{
}

void sub_10002A2F0()
{
}

void sub_10002A31C()
{
}

void sub_10002A348()
{
}

void sub_10002A374()
{
}

void sub_10002A3D4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = sub_100016E40( 4LL,  "%s, unsupported socket type (%d)",  a3,  a4,  a5,  a6,  a7,  a8,  (uint64_t)"runloopReadSockCallback");
  __break(1u);
  Apple80211BindToInterface(v8);
}