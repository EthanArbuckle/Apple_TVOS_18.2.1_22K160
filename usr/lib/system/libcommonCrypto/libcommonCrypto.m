uint64_t adler32_implementation(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  if (!a1) {
    return 1LL;
  }
  v2 = 0;
  v3 = 1;
  do
  {
    v4 = *a2++;
    v3 = (v3 + v4) % 0xFFF1;
    v2 = (v3 + v2) % 0xFFF1;
    --a1;
  }

  while (a1);
  return v3 | (v2 << 16);
}

uint64_t adler32_final(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t adler32_oneshot(uint64_t a1, unsigned __int8 *a2)
{
  if (!a1) {
    return 1LL;
  }
  unsigned int v2 = 0;
  unsigned int v3 = 1;
  do
  {
    int v4 = *a2++;
    unsigned int v3 = (v3 + v4) % 0xFFF1;
    unsigned int v2 = (v3 + v2) % 0xFFF1;
    --a1;
  }

  while (a1);
  return v3 | (v2 << 16);
}

uint64_t adler32_setup()
{
  return 0LL;
}

uint64_t CCCryptorChaCha20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 12) {
    LODWORD(v4) = 0;
  }
  else {
    LODWORD(v4) = -4300;
  }
  if (a2 == 32) {
    uint64_t v4 = v4;
  }
  else {
    uint64_t v4 = 4294962986LL;
  }
  if (a2 == 32 && a4 == 12)
  {
    int v5 = ccchacha20();
    if (v5 == -7) {
      LODWORD(v4) = -4300;
    }
    else {
      LODWORD(v4) = -4308;
    }
    if (v5) {
      return v4;
    }
    else {
      return 0LL;
    }
  }

  return v4;
}

uint64_t init_globals(uint64_t a1)
{
  *(_OWORD *)(a1 + 3536) = 0u;
  *(_OWORD *)(a1 + 3552) = 0u;
  *(void *)(a1 + 3664) = 0LL;
  *(_OWORD *)(a1 + 3648) = 0u;
  *(_OWORD *)(a1 + 3632) = 0u;
  *(_OWORD *)(a1 + 3616) = 0u;
  *(_OWORD *)(a1 + 3600) = 0u;
  *(_OWORD *)(a1 + 3584) = 0u;
  *(_OWORD *)(a1 + 3568) = 0u;
  *(void *)(a1 + 3544) = MEMORY[0x1895FE460];
  *(void *)(a1 + 3552) = MEMORY[0x1895FE468];
  *(void *)(a1 + 3560) = ccmd5_di();
  *(void *)(a1 + 3576) = MEMORY[0x1895FE518];
  *(void *)(a1 + 3600) = ccsha1_di();
  *(void *)(a1 + 3608) = ccsha224_di();
  *(void *)(a1 + 3616) = ccsha256_di();
  *(void *)(a1 + 3624) = ccsha384_di();
  *(void *)(a1 + 3632) = ccsha512_di();
  *(void *)(a1 + 3640) = ccsha3_224_di();
  *(void *)(a1 + 3648) = ccsha3_256_di();
  *(void *)(a1 + 3656) = ccsha3_384_di();
  uint64_t v2 = 0LL;
  *(void *)(a1 + 3664) = ccsha3_512_di();
  *(void *)(a1 + 2472) = &defaultBase64;
  *(void *)(a1 + 2736) = &defaultBase32;
  *(void *)(a1 + 3000) = &recoveryBase32;
  *(void *)(a1 + 2208) = 0LL;
  *(void *)(a1 + 3264) = &hexBase32;
  *(void *)(a1 + 3528) = &defaultBase16;
  do
  {
    uint64_t result = setReverseMap(a1 + 2216 + v2);
    v2 += 264LL;
  }

  while (v2 != 1320);
  *(void *)(a1 + 328) = &CC_crc8;
  *(void *)(a1 + 360) = &CC_crc8_icode;
  *(void *)(a1 + 392) = &CC_crc8_itu;
  *(void *)(a1 + 424) = &CC_crc8_rohc;
  *(void *)(a1 + 456) = &CC_crc8_wcdma;
  *(void *)(a1 + 648) = &CC_crc16;
  *(void *)(a1 + 680) = &CC_crc16_ccitt_true;
  *(void *)(a1 + 712) = &CC_crc16_ccitt_false;
  *(void *)(a1 + 744) = &CC_crc16_usb;
  *(void *)(a1 + 776) = &CC_crc16_xmodem;
  *(void *)(a1 + 808) = &CC_crc16_dect_r;
  *(void *)(a1 + 840) = &CC_crc16_dect_x;
  *(void *)(a1 + 872) = &CC_crc16_icode;
  *(void *)(a1 + 904) = &CC_crc16_verifone;
  *(void *)(a1 + 936) = &CC_crc16_a;
  *(void *)(a1 + 968) = &CC_crc16_b;
  *(void *)(a1 + 1000) = 0LL;
  *(void *)(a1 + 1288) = &CC_adler32;
  *(void *)(a1 + 1320) = &CC_crc32;
  *(void *)(a1 + 1352) = &CC_crc32_castagnoli;
  *(void *)(a1 + 1384) = &CC_crc32_bzip2;
  *(void *)(a1 + 1416) = &CC_crc32_mpeg_2;
  *(void *)(a1 + 1448) = &CC_crc32_posix;
  *(void *)(a1 + 1480) = &CC_crc32_xfer;
  *(void *)(a1 + 1928) = &CC_crc64_ecma_182;
  return result;
}

uint64_t CCCryptorChaCha20Poly1305OneshotEncrypt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 != 32) {
    return 4294962986LL;
  }
  uint64_t v11 = 4294962996LL;
  if (a10) {
    BOOL v12 = a4 == 12;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12 && a11 == 16)
  {
    ccchacha20poly1305_info();
    int v14 = ccchacha20poly1305_encrypt_oneshot();
    if (v14 == -7) {
      unsigned int v15 = -4300;
    }
    else {
      unsigned int v15 = -4308;
    }
    if (v14) {
      return v15;
    }
    else {
      return 0LL;
    }
  }

  return v11;
}

uint64_t CCCryptorChaCha20Poly1305OneshotDecrypt( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  if (a2 != 32) {
    return 4294962986LL;
  }
  uint64_t result = 4294962996LL;
  if (a4 == 12 && a11 == 16)
  {
    ccchacha20poly1305_info();
    int v12 = ccchacha20poly1305_decrypt_oneshot();
    if (v12 == -7) {
      unsigned int v13 = -4300;
    }
    else {
      unsigned int v13 = -4308;
    }
    if (v12) {
      return v13;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCKDFParametersCreatePbkdf2(void *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (!a2) {
    return 4294962996LL;
  }
  if (!a3 && a4) {
    return 4294962996LL;
  }
  v9 = malloc(0x28uLL);
  if (!v9) {
    return 4294962994LL;
  }
  v10 = v9;
  uint64_t result = 0LL;
  _DWORD *v10 = 0;
  v10[2] = a2;
  *((void *)v10 + 2) = a3;
  *((void *)v10 + 3) = a4;
  *a1 = v10;
  return result;
}

uint64_t CCKDFParametersCreateCtrHmac(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2 && a3 || !a4 && a5) {
    return 4294962996LL;
  }
  uint64_t v11 = malloc(0x28uLL);
  if (!v11) {
    return 4294962994LL;
  }
  int v12 = v11;
  uint64_t result = 0LL;
  *(_DWORD *)int v12 = 1;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  *a1 = v12;
  return result;
}

uint64_t CCKDFParametersCreateCtrHmacFixed(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a2 && a3) {
    return 4294962996LL;
  }
  v7 = malloc(0x28uLL);
  if (!v7) {
    return 4294962994LL;
  }
  v8 = v7;
  uint64_t result = 0LL;
  *(_DWORD *)v8 = 2;
  v8[1] = a2;
  v8[2] = a3;
  *a1 = v8;
  return result;
}

uint64_t CCKDFParametersCreateHkdf(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a2 && a3 || !a4 && a5) {
    return 4294962996LL;
  }
  uint64_t v11 = malloc(0x28uLL);
  if (!v11) {
    return 4294962994LL;
  }
  int v12 = v11;
  uint64_t result = 0LL;
  *(_DWORD *)int v12 = 6;
  v12[1] = a2;
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a5;
  *a1 = v12;
  return result;
}

uint64_t CCKDFParametersCreateAnsiX963(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a2 && a3) {
    return 4294962996LL;
  }
  v7 = malloc(0x28uLL);
  if (!v7) {
    return 4294962994LL;
  }
  v8 = v7;
  uint64_t result = 0LL;
  *(_DWORD *)v8 = 7;
  v8[1] = a2;
  v8[2] = a3;
  *a1 = v8;
  return result;
}

void CCKDFParametersDestroy(void *a1)
{
}

uint64_t CCKeyDerivationHMac( int a1, unsigned int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  v27 = 0LL;
  uint64_t result = 4294962991LL;
  switch(a1)
  {
    case 0:
      if (!a3) {
        return 4294962996LL;
      }
      if (!a12 && a13 != 0) {
        return 4294962996LL;
      }
      v23 = (int *)malloc(0x28uLL);
      if (!v23) {
        return 4294962994LL;
      }
      v24 = v23;
      int *v23 = 0;
      v23[2] = a3;
      *((void *)v23 + 2) = a12;
      *((void *)v23 + 3) = a13;
      goto LABEL_19;
    case 1:
      uint64_t result = CCKDFParametersCreateCtrHmac(&v27, a6, a7, a8, a9);
      if (!(_DWORD)result) {
        goto LABEL_16;
      }
      return result;
    case 2:
      if (!a8 && a9) {
        return 4294962996LL;
      }
      v25 = (int *)malloc(0x28uLL);
      if (!v25) {
        return 4294962994LL;
      }
      v24 = v25;
      int *v25 = 2;
      *((void *)v25 + 1) = a8;
      *((void *)v25 + 2) = a9;
LABEL_19:
      uint64_t v26 = CCDeriveKey(v24, a2, a4, a5, a14, a15);
      cc_clear();
      free(v24);
      return v26;
    case 6:
      uint64_t result = CCKDFParametersCreateHkdf(&v27, a12, a13, a8, a9);
      if ((_DWORD)result) {
        return result;
      }
LABEL_16:
      v24 = v27;
      goto LABEL_19;
    default:
      return result;
  }
}

uint64_t CCDeriveKey(int *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(a2);
  uint64_t v12 = 4294962996LL;
  if (DigestInfo && a5 && a6 && (a3 || !a4))
  {
    BOOL v13 = !a4 || a3 == 0;
    int v14 = *a1;
    if (!v13 || v14 == 6)
    {
      uint64_t v12 = 4294962991LL;
      switch(v14)
      {
        case 0:
          int v15 = ccpbkdf2_hmac();
          goto LABEL_18;
        case 1:
          int v15 = ccnistkdf_ctr_hmac();
          goto LABEL_18;
        case 2:
          int v15 = ccnistkdf_ctr_hmac_fixed();
          goto LABEL_18;
        case 6:
          int v15 = cchkdf();
          goto LABEL_18;
        case 7:
          int v15 = ccansikdf_x963();
LABEL_18:
          if (v15) {
            uint64_t v12 = 4294962996LL;
          }
          else {
            uint64_t v12 = 0LL;
          }
          break;
        default:
          return v12;
      }
    }
  }

  return v12;
}

uint64_t CCHKDFExtract(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo = (void *)CCDigestGetDigestInfo(a2);
  uint64_t result = 4294962996LL;
  if (a5 && DigestInfo && *DigestInfo == a6 && (a3 || !a4) && *a1 == 6)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCHKDFExpand(_DWORD *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(a2);
  if (!DigestInfo) {
    return 4294962996LL;
  }
  uint64_t v12 = (void *)DigestInfo;
  uint64_t result = 4294962996LL;
  if (a3 && a5 && a6 && *v12 == a4 && *a1 == 6)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

unint64_t gen_std_crc_table(uint64_t a1)
{
  uint64_t v2 = *(int *)(*(void *)(a1 + 8) + 16LL);
  unint64_t result = (unint64_t)malloc(v2 << 8);
  *(void *)(a1 + 24) = result;
  if (result)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = v2 - 1;
    do
    {
      unint64_t result = v4;
      switch(v5)
      {
        case 0LL:
          uint64_t v6 = *(void *)(a1 + 8);
          int v7 = *(_DWORD *)(v6 + 16);
          else {
            uint64_t v8 = qword_1802D8948[v7 - 1];
          }
          char v18 = 8 * v7;
          if (*(_DWORD *)(v6 + 20))
          {
            unint64_t result = reflect_byte(v4);
            int v19 = 8 * *(_DWORD *)(v6 + 16);
          }

          else
          {
            int v19 = 8 * v7;
          }

          result <<= v19 - 8;
          int v26 = 8;
          do
          {
            BOOL v27 = (result & (1LL << (v18 - 1))) == 0;
            result *= 2LL;
            if (!v27) {
              result ^= *(void *)(v6 + 32);
            }
            --v26;
          }

          while (v26);
          if (*(_DWORD *)(v6 + 20)) {
            unint64_t result = reflect(result, v19);
          }
          *(_BYTE *)(*(void *)(a1 + 24) + v4) = result & v8;
          break;
        case 1LL:
          uint64_t v9 = *(void *)(a1 + 8);
          int v10 = *(_DWORD *)(v9 + 16);
          else {
            uint64_t v11 = qword_1802D8948[v10 - 1];
          }
          char v20 = 8 * v10;
          if (*(_DWORD *)(v9 + 20))
          {
            unint64_t result = reflect_byte(v4);
            int v21 = 8 * *(_DWORD *)(v9 + 16);
          }

          else
          {
            int v21 = 8 * v10;
          }

          result <<= v21 - 8;
          int v28 = 8;
          do
          {
            BOOL v27 = (result & (1LL << (v20 - 1))) == 0;
            result *= 2LL;
            if (!v27) {
              result ^= *(void *)(v9 + 32);
            }
            --v28;
          }

          while (v28);
          if (*(_DWORD *)(v9 + 20)) {
            unint64_t result = reflect(result, v21);
          }
          *(_WORD *)(*(void *)(a1 + 24) + 2 * v4) = result & v11;
          break;
        case 3LL:
          uint64_t v12 = *(void *)(a1 + 8);
          int v13 = *(_DWORD *)(v12 + 16);
          else {
            uint64_t v14 = qword_1802D8948[v13 - 1];
          }
          char v22 = 8 * v13;
          if (*(_DWORD *)(v12 + 20))
          {
            unint64_t result = reflect_byte(v4);
            int v23 = 8 * *(_DWORD *)(v12 + 16);
          }

          else
          {
            int v23 = 8 * v13;
          }

          result <<= v23 - 8;
          int v29 = 8;
          do
          {
            BOOL v27 = (result & (1LL << (v22 - 1))) == 0;
            result *= 2LL;
            if (!v27) {
              result ^= *(void *)(v12 + 32);
            }
            --v29;
          }

          while (v29);
          if (*(_DWORD *)(v12 + 20)) {
            unint64_t result = reflect(result, v23);
          }
          *(_DWORD *)(*(void *)(a1 + 24) + 4 * v4) = result & v14;
          break;
        case 7LL:
          uint64_t v15 = *(void *)(a1 + 8);
          int v16 = *(_DWORD *)(v15 + 16);
          else {
            uint64_t v17 = qword_1802D8948[v16 - 1];
          }
          char v24 = 8 * v16;
          if (*(_DWORD *)(v15 + 20))
          {
            unint64_t result = reflect_byte(v4);
            int v25 = 8 * *(_DWORD *)(v15 + 16);
          }

          else
          {
            int v25 = 8 * v16;
          }

          result <<= v25 - 8;
          int v30 = 8;
          do
          {
            BOOL v27 = (result & (1LL << (v24 - 1))) == 0;
            result *= 2LL;
            if (!v27) {
              result ^= *(void *)(v15 + 32);
            }
            --v30;
          }

          while (v30);
          if (*(_DWORD *)(v15 + 20)) {
            unint64_t result = reflect(result, v25);
          }
          *(void *)(*(void *)(a1 + 24) + 8 * v4) = result & v17;
          break;
        default:
          break;
      }

      ++v4;
    }

    while (v4 != 256);
  }

  return result;
}

void dump_crc_table(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = *(int *)(v1 + 16);
  unsigned int v3 = *(const char **)v1;
  size_t v4 = strnlen(*(const char **)v1, 0x40uLL);
  uint64_t v5 = malloc(v4 + 1);
  memcpy(v5, v3, v4);
  v5[v4] = 0;
  if (*v5)
  {
    size_t v6 = 0LL;
    do
    {
      if (v5[v6] == 45) {
        v5[v6] = 95;
      }
      ++v6;
    }

    while (v6 < strlen(v5));
  }

  uint64_t v7 = v2 - 1;
  if ((unint64_t)(v2 - 1) < 8 && ((0x8Bu >> v7) & 1) != 0)
  {
    int v8 = dword_1802D8988[v7];
    printf(off_18963C378[v7], v5);
  }

  else
  {
    int v8 = 7;
  }

  uint64_t v9 = 0LL;
  do
  {
    switch(v2)
    {
      case 1LL:
        printf(" 0x%02x,");
        break;
      case 2LL:
        printf(" 0x%04x,");
        break;
      case 4LL:
        printf(" 0x%08x,");
        break;
      case 8LL:
        printf(" 0x%016llx,");
        break;
      default:
        break;
    }
  }

  while (v9 != 256);
  puts("};\n");
  free(v5);
}

uint64_t crc_normal_init(dispatch_once_t *predicate)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  }
  return *(void *)(predicate[1] + 40);
}

uint64_t crc_normal_update(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4)
{
  for (int i = *(_DWORD *)(*(void *)(a1 + 8) + 16LL); a3; --a3)
  {
    switch(i)
    {
      case 1:
        a4 = *(unsigned __int8 *)(*(void *)(a1 + 24) + (*a2 ^ a4));
        break;
      case 2:
        a4 = (unsigned __int16)(*(_WORD *)(*(void *)(a1 + 24) + 2LL * (*a2 ^ BYTE1(a4))) ^ ((_WORD)a4 << 8));
        break;
      case 4:
        a4 = (*(_DWORD *)(*(void *)(a1 + 24) + 4LL * (*a2 ^ BYTE3(a4))) ^ ((_DWORD)a4 << 8));
        break;
      case 8:
        a4 = *(void *)(*(void *)(a1 + 24) + 8 * (*a2 ^ HIBYTE(a4))) ^ (a4 << 8);
        break;
      default:
        break;
    }

    ++a2;
  }

  unsigned int v5 = i - 1;
  if (v5 > 7) {
    uint64_t v6 = 0LL;
  }
  else {
    uint64_t v6 = qword_1802D89B0[v5];
  }
  return v6 & a4;
}

uint64_t crc_normal_final(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(v2 + 48);
  unsigned int v4 = *(_DWORD *)(v2 + 16) - 1;
  if (v4 > 7) {
    uint64_t v5 = 0LL;
  }
  else {
    uint64_t v5 = qword_1802D89B0[v4];
  }
  return v5 & (v3 ^ a2);
}

uint64_t crc_normal_oneshot(dispatch_once_t *predicate, _BYTE *a2, uint64_t a3)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  }
  uint64_t v6 = crc_normal_update((uint64_t)predicate, a2, a3, *(void *)(predicate[1] + 40));
  return crc_normal_final((uint64_t)predicate, v6);
}

uint64_t reflect_byte(int a1)
{
  return reflector[a1];
}

uint64_t reflect(unint64_t a1, unint64_t a2)
{
  if (a2 >> 3 >= 8) {
    uint64_t v2 = 8LL;
  }
  else {
    uint64_t v2 = a2 >> 3;
  }
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 0LL;
  uint64_t v5 = 8 * v2 - 8;
  do
  {
    v4 |= (unint64_t)reflector[(a1 >> v3)] << v5;
    v5 -= 8LL;
    v3 += 8LL;
  }

  while (v5 != -8);
  return v4;
}

unint64_t crc_reverse_update(uint64_t a1, _BYTE *a2, uint64_t a3, unint64_t a4)
{
  {
    switch(*(_DWORD *)(*(void *)(a1 + 8) + 16LL))
    {
      case 1:
        a4 = *(unsigned __int8 *)(*(void *)(a1 + 24) + (*a2 ^ a4));
        break;
      case 2:
        a4 = (unsigned __int16)(*(_WORD *)(*(void *)(a1 + 24) + 2LL * (*a2 ^ a4)) ^ ((unsigned __int16)(a4 & 0xFF00) >> 8));
        break;
      case 4:
        a4 = *(_DWORD *)(*(void *)(a1 + 24) + 4LL * (*a2 ^ a4)) ^ (a4 >> 8);
        break;
      case 8:
        a4 = *(void *)(*(void *)(a1 + 24) + 8LL * (*a2 ^ a4)) ^ (a4 >> 8);
        break;
      default:
        break;
    }

    ++a2;
  }

  return a4;
}

uint64_t crc_reverse_final(uint64_t a1, uint64_t a2)
{
  return *(void *)(*(void *)(a1 + 8) + 48LL) ^ a2;
}

unint64_t crc_reverse_oneshot(dispatch_once_t *predicate, _BYTE *a2, uint64_t a3)
{
  if (*predicate != -1) {
    dispatch_once_f(predicate, predicate, (dispatch_function_t)gen_std_crc_table);
  }
  dispatch_once_t v6 = predicate[1];
  return *(void *)(v6 + 48) ^ crc_reverse_update((uint64_t)predicate, a2, a3, *(void *)(v6 + 40));
}

uint64_t reverse_poly(unint64_t a1, unint64_t a2)
{
  return (2 * reflect(a1, a2)) | 1;
}

void *CCCreateBigNum(int *a1)
{
  size_t v2 = ccz_size();
  uint64_t v3 = malloc(v2);
  uint64_t v4 = v3;
  if (a1)
  {
    if (v3) {
      int v5 = 0;
    }
    else {
      int v5 = -4302;
    }
    *a1 = v5;
  }

  if (v3) {
    ccz_init();
  }
  return v4;
}

uint64_t CCBigNumClear()
{
  return 0LL;
}

void CCBigNumFree(void *a1)
{
}

void *CCBigNumCopy(int *a1)
{
  uint64_t v1 = CCCreateBigNum(a1);
  if (v1) {
    ccz_set();
  }
  return v1;
}

uint64_t CCBigNumBitCount()
{
  return ccz_bitlen();
}

uint64_t CCBigNumZeroLSBCount()
{
  return ccz_trailing_zeros();
}

uint64_t CCBigNumByteCount()
{
  return ccz_write_uint_size();
}

void *CCBigNumFromData(int *a1)
{
  uint64_t v1 = CCCreateBigNum(a1);
  if (v1) {
    ccz_read_uint();
  }
  return v1;
}

uint64_t CCBigNumToData()
{
  uint64_t v0 = ccz_write_uint_size();
  ccz_write_uint();
  return v0;
}

void *CCBigNumFromHexString(int *a1, const char *a2)
{
  uint64_t v4 = CCCreateBigNum(a1);
  if (!v4)
  {
    int v6 = -4302;
LABEL_6:
    int v5 = 0LL;
    *a1 = v6;
    return v5;
  }

  int v5 = v4;
  strlen(a2);
  if (ccz_read_radix())
  {
    ccz_zero();
    if (!a1) {
      return 0LL;
    }
    int v6 = -4304;
    goto LABEL_6;
  }

  return v5;
}

void *CCBigNumToHexString(int *a1)
{
  uint64_t v2 = ccz_write_radix_size();
  if (!v2)
  {
    uint64_t v4 = 0LL;
    int v5 = -4300;
LABEL_7:
    *a1 = v5;
    return v4;
  }

  uint64_t v3 = v2;
  uint64_t v4 = malloc(v2 + 1);
  if (!v4)
  {
    int v5 = -4302;
    goto LABEL_7;
  }

  if (ccz_write_radix())
  {
    *a1 = -4300;
    free(v4);
    return 0LL;
  }

  else
  {
    *((_BYTE *)v4 + v3) = 0;
  }

  return v4;
}

void *CCBigNumFromDecimalString(int *a1, const char *a2)
{
  uint64_t v4 = CCCreateBigNum(a1);
  if (!v4)
  {
    int v6 = -4302;
LABEL_6:
    int v5 = 0LL;
    *a1 = v6;
    return v5;
  }

  int v5 = v4;
  strlen(a2);
  if (ccz_read_radix())
  {
    ccz_zero();
    if (!a1) {
      return 0LL;
    }
    int v6 = -4304;
    goto LABEL_6;
  }

  return v5;
}

void *CCBigNumToDecimalString(int *a1)
{
  uint64_t v2 = ccz_write_radix_size();
  if (!v2)
  {
    uint64_t v4 = 0LL;
    int v5 = -4300;
LABEL_7:
    *a1 = v5;
    return v4;
  }

  uint64_t v3 = v2;
  uint64_t v4 = malloc(v2 + 1);
  if (!v4)
  {
    int v5 = -4302;
    goto LABEL_7;
  }

  if (ccz_write_radix())
  {
    *a1 = -4300;
    free(v4);
    return 0LL;
  }

  else
  {
    *((_BYTE *)v4 + v3) = 0;
  }

  return v4;
}

uint64_t CCBigNumSetNegative()
{
  return 0LL;
}

uint64_t CCBigNumSetI()
{
  return 0LL;
}

uint64_t CCBigNumGetI(_DWORD *a1)
{
  if ((unint64_t)ccz_write_int_size() < 5)
  {
    ccz_write_uint();
    uint64_t result = bswap32(v3);
    if (a1) {
      *a1 = 0;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a1 = -4306;
  }

  return result;
}

void *CCBigNumCreateRandom(int *a1, uint64_t a2, int a3, int a4)
{
  uint64_t v7 = CCCreateBigNum(a1);
  int v8 = v7;
  if (a3 >= 1 && v7)
  {
    do
    {
      ccz_random_bits();
      uint64_t v9 = ccz_bitlen();
    }

    while (v9 - ccz_trailing_zeros() < (unint64_t)a4);
  }

  return v8;
}

uint64_t CCBigNumAdd()
{
  return 0LL;
}

uint64_t CCBigNumAddI()
{
  return 0LL;
}

uint64_t CCBigNumSub()
{
  return 0LL;
}

uint64_t CCBigNumSubI()
{
  return 0LL;
}

uint64_t CCBigNumMul()
{
  return 0LL;
}

uint64_t CCBigNumMulI()
{
  return 0LL;
}

uint64_t CCBigNumDiv()
{
  return 0LL;
}

uint64_t CCBigNumMod()
{
  return 0LL;
}

uint64_t CCBigNumModI(_DWORD *a1)
{
  unsigned int v7 = 0;
  uint64_t v2 = CCCreateBigNum((int *)&v7);
  if (v2)
  {
    unsigned int v3 = v2;
    uint64_t v4 = CCCreateBigNum((int *)&v7);
    if (v4)
    {
      int v5 = v4;
      ccz_seti();
      unsigned int v7 = 0;
      ccz_mod();
      *a1 = CCBigNumGetI(&v7);
      ccz_free();
      free(v3);
      unsigned int v3 = v5;
    }

    ccz_free();
    free(v3);
  }

  return v7;
}

uint64_t CCBigNumMulMod()
{
  return 0LL;
}

uint64_t CCBigNumModExp()
{
  else {
    return 0LL;
  }
}

uint64_t CCBigNumLeftShift()
{
  return 0LL;
}

uint64_t CCBigNumRightShift()
{
  return 0LL;
}

uint64_t CCBigNumIsPrime(_DWORD *a1)
{
  if (a1) {
    *a1 = 0;
  }
  return ccz_is_prime();
}

uint64_t CCBigNumIsZero(_DWORD *a1)
{
  if (a1) {
    *a1 = 0;
  }
  return ccz_is_zero();
}

uint64_t CCBigNumIsNegative(_DWORD *a1)
{
  if (a1) {
    *a1 = 0;
  }
  return ccz_is_negative();
}

void *cc_alloc(int a1, size_t __size)
{
  return malloc(__size);
}

void *cc_realloc(int a1, size_t a2, void *a3, size_t __size)
{
  int v6 = malloc(__size);
  memcpy(v6, a3, a2);
  cc_clear();
  free(a3);
  return v6;
}

void cc_free(uint64_t a1, uint64_t a2, void *a3)
{
}

uint64_t CCAESCmac()
{
  return cccmac_one_shot_generate();
}

void *CCAESCmacCreate(uint64_t a1)
{
  uint64_t v2 = malloc(8uLL);
  if (v2)
  {
    unsigned int v3 = (void *)ccaes_cbc_encrypt_mode();
    uint64_t v4 = malloc(v3[1] + *v3 + 80LL);
    *uint64_t v2 = v4;
    if (!v4)
    {
LABEL_6:
      free(v2);
      return 0LL;
    }

    int v5 = v4;
    if (!a1 || cccmac_init())
    {
      free(v5);
      goto LABEL_6;
    }
  }

  return v2;
}

uint64_t CCAESCmacUpdate()
{
  return cccmac_update();
}

uint64_t CCAESCmacFinal()
{
  return cccmac_final_generate();
}

void CCAESCmacDestroy(void **a1)
{
  if (a1)
  {
    free(*a1);
    free(a1);
  }

uint64_t CCAESCmacOutputSizeFromContext(uint64_t a1)
{
  return *(void *)(*(void *)(*(void *)a1 + 64LL) + 8LL);
}

uint64_t CCCKGGetCommitmentSize(uint64_t a1, unsigned int a2)
{
  else {
    return 4294962996LL;
  }
}

uint64_t CCCKGGetShareSize(uint64_t a1, unsigned int a2)
{
  else {
    return 4294962996LL;
  }
}

uint64_t CCCKGGetOpeningSize(uint64_t a1, unsigned int a2)
{
  else {
    return 4294962996LL;
  }
}

uint64_t CCCKGContributorCreate(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a3) {
    return 4294962996LL;
  }
  int v6 = malloc(8uLL);
  if (!v6) {
    return 4294962994LL;
  }
  unsigned int v7 = v6;
  uint64_t v8 = CCCKGContextCreate(a1, a2, v6);
  if ((_DWORD)v8) {
    free(v7);
  }
  else {
    *a3 = v7;
  }
  return v8;
}

uint64_t CCCKGContextCreate(uint64_t a1, unsigned int a2, void *a3)
{
  size_t v5 = ccckg_sizeof_ctx();
  int v6 = malloc(v5);
  *a3 = v6;
  if (!v6) {
    return 4294962994LL;
  }
  ccDRBGGetRngState();
  ccckg_init();
  return 0LL;
}

uint64_t CCCKGOwnerCreate(uint64_t a1, unsigned int a2, void *a3)
{
  if (!a3) {
    return 4294962996LL;
  }
  int v6 = malloc(8uLL);
  if (!v6) {
    return 4294962994LL;
  }
  unsigned int v7 = v6;
  uint64_t v8 = CCCKGContextCreate(a1, a2, v6);
  if ((_DWORD)v8) {
    free(v7);
  }
  else {
    *a3 = v7;
  }
  return v8;
}

void CCCKGContributorDestroy(void **a1)
{
}

void CCCKGOwnerDestroy(void **a1)
{
}

uint64_t CCCKGContributorCommit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2)
  {
    uint64_t result = ccckg_contributor_commit();
    if ((int)result > -3)
    {
      if ((_DWORD)result == -2)
      {
        return 4294962992LL;
      }

      else if ((_DWORD)result)
      {
        return 4294962988LL;
      }
    }

    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7) {
          return 4294962996LL;
        }
        return 4294962988LL;
      }

      return 4294962987LL;
    }
  }

  return result;
}

uint64_t CCCKGOwnerGenerateShare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a4)
  {
    uint64_t result = ccckg_owner_generate_share();
    if ((int)result <= -3)
    {
      if ((_DWORD)result == -86) {
        return 4294962987LL;
      }
      if ((_DWORD)result == -7) {
        return 4294962996LL;
      }
      return 4294962988LL;
    }

    if ((_DWORD)result == -2) {
      return 4294962992LL;
    }
    if ((_DWORD)result) {
      return 4294962988LL;
    }
  }

  return result;
}

uint64_t CCCKGContributorFinish( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  v17[1] = *MEMORY[0x1895FEE08];
  uint64_t v8 = 4294962996LL;
  if (a1 && a2 && a4 && a6 && a8)
  {
    uint64_t v10 = ccckg_ctx_cp();
    v17[0] = v17;
    uint64_t v12 = MEMORY[0x1895FE128](v10, v11);
    uint64_t v14 = (char *)v17 - v13;
    *(void *)((char *)v17 - v13) = v12;
    int v15 = ccckg_contributor_finish();
    if (v15 > -3)
    {
      if (!v15)
      {
        uint64_t v8 = CCCKGConvertNativeToECCryptor(v10, (uint64_t)v14, 0, a8);
        goto LABEL_17;
      }

      if (v15 == -2)
      {
        uint64_t v8 = 4294962992LL;
        goto LABEL_17;
      }
    }

    else
    {
      if (v15 == -86)
      {
        uint64_t v8 = 4294962987LL;
        goto LABEL_17;
      }

      if (v15 == -7)
      {
        uint64_t v8 = 4294962996LL;
LABEL_17:
        cc_clear();
        return v8;
      }
    }

    uint64_t v8 = 4294962988LL;
    goto LABEL_17;
  }

  return v8;
}

uint64_t CCCKGConvertNativeToECCryptor(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  unint64_t v6 = (unint64_t)(cczp_bitlen() + 7) >> 3;
  uint64_t v7 = 2LL;
  if (a3 == 1) {
    uint64_t v7 = 3LL;
  }
  uint64_t v8 = v6 * v7 + 1;
  uint64_t v9 = malloc(v8);
  if (!v9) {
    return 4294962994LL;
  }
  uint64_t v10 = v9;
  ccec_x963_export();
  uint64_t v11 = CCECCryptorImportKey(0, (uint64_t)v10, v8, a3, a4);
  cc_clear();
  free(v10);
  return v11;
}

uint64_t CCCKGOwnerFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  v15[1] = *MEMORY[0x1895FEE08];
  uint64_t v6 = 4294962996LL;
  if (a1 && a2 && a4 && a6)
  {
    uint64_t v8 = ccckg_ctx_cp();
    uint64_t v10 = MEMORY[0x1895FE128](v8, v9);
    uint64_t v12 = (char *)v15 - v11;
    *(void *)((char *)v15 - v11) = v10;
    int v13 = ccckg_owner_finish();
    if (v13 > -3)
    {
      if (v13)
      {
        if (v13 != -2)
        {
LABEL_14:
          uint64_t v6 = 4294962988LL;
          goto LABEL_15;
        }

        uint64_t v6 = 4294962992LL;
      }

      else
      {
        uint64_t v6 = CCCKGConvertNativeToECCryptor(v8, (uint64_t)v12, 1, a6);
      }
    }

    else if (v13 == -86)
    {
      uint64_t v6 = 4294962987LL;
    }

    else if (v13 != -7)
    {
      goto LABEL_14;
    }

LABEL_15:
    cc_clear();
  }

  return v6;
}

    cc_clear();
  }

  return v6;
}

uint64_t CCCKG2GetCommitmentSize()
{
  return ccckg2_sizeof_commitment();
}

uint64_t CCCKG2GetShareSize()
{
  return ccckg2_sizeof_share();
}

uint64_t CCCKG2GetOpeningSize()
{
  return ccckg2_sizeof_opening();
}

uint64_t CCCKG2ContributorCreate(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294962996LL;
  }
  uint64_t v4 = malloc(8uLL);
  if (!v4) {
    return 4294962994LL;
  }
  size_t v5 = v4;
  uint64_t v6 = CCCKG2ContextCreate(a1, v4);
  if ((_DWORD)v6) {
    free(v5);
  }
  else {
    *a2 = v5;
  }
  return v6;
}

uint64_t CCCKG2ContextCreate(uint64_t a1, void *a2)
{
  size_t v3 = ccckg2_sizeof_ctx();
  uint64_t v4 = malloc(v3);
  *a2 = v4;
  if (!v4) {
    return 4294962994LL;
  }
  uint64_t result = ccckg2_init();
  if ((int)result > -3)
  {
    if ((_DWORD)result != -2)
    {
      if (!(_DWORD)result) {
        return result;
      }
      return 4294962988LL;
    }

    return 4294962992LL;
  }

  else
  {
    if ((_DWORD)result != -86)
    {
      if ((_DWORD)result == -7) {
        return 4294962996LL;
      }
      return 4294962988LL;
    }

    return 4294962987LL;
  }

uint64_t CCCKG2OwnerCreate(uint64_t a1, void *a2)
{
  if (!a2) {
    return 4294962996LL;
  }
  uint64_t v4 = malloc(8uLL);
  if (!v4) {
    return 4294962994LL;
  }
  size_t v5 = v4;
  uint64_t v6 = CCCKG2ContextCreate(a1, v4);
  if ((_DWORD)v6) {
    free(v5);
  }
  else {
    *a2 = v5;
  }
  return v6;
}

void CCCKG2ContributorDestroy(void **a1)
{
}

void CCCKG2OwnerDestroy(void **a1)
{
}

uint64_t CCCKG2ContributorCommit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2)
  {
    ccDRBGGetRngState();
    uint64_t result = ccckg2_contributor_commit();
    if ((int)result > -3)
    {
      if ((_DWORD)result != -2)
      {
        if (!(_DWORD)result) {
          return result;
        }
        return 4294962988LL;
      }

      return 4294962992LL;
    }

    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7) {
          return 4294962996LL;
        }
        return 4294962988LL;
      }

      return 4294962987LL;
    }
  }

  return result;
}

uint64_t CCCKG2OwnerGenerateShare(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a4)
  {
    ccDRBGGetRngState();
    uint64_t result = ccckg2_owner_generate_share();
    if ((int)result > -3)
    {
      if ((_DWORD)result != -2)
      {
        if (!(_DWORD)result) {
          return result;
        }
        return 4294962988LL;
      }

      return 4294962992LL;
    }

    else
    {
      if ((_DWORD)result != -86)
      {
        if ((_DWORD)result == -7) {
          return 4294962996LL;
        }
        return 4294962988LL;
      }

      return 4294962987LL;
    }
  }

  return result;
}

uint64_t CCCKG2ContributorFinish( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t *a8)
{
  v17[1] = *MEMORY[0x1895FEE08];
  uint64_t v8 = 4294962996LL;
  if (a1 && a2 && a4 && a6 && a8)
  {
    uint64_t v10 = ccckg2_ctx_cp();
    v17[0] = v17;
    uint64_t v12 = MEMORY[0x1895FE128](v10, v11);
    uint64_t v14 = (char *)v17 - v13;
    *(void *)((char *)v17 - v13) = v12;
    ccDRBGGetRngState();
    int v15 = ccckg2_contributor_finish();
    if (v15 > -3)
    {
      if (!v15)
      {
        uint64_t v8 = CCCKGConvertNativeToECCryptor(v10, (uint64_t)v14, 0, a8);
        goto LABEL_17;
      }

      if (v15 == -2)
      {
        uint64_t v8 = 4294962992LL;
        goto LABEL_17;
      }
    }

    else
    {
      if (v15 == -86)
      {
        uint64_t v8 = 4294962987LL;
        goto LABEL_17;
      }

      if (v15 == -7)
      {
        uint64_t v8 = 4294962996LL;
LABEL_17:
        cc_clear();
        return v8;
      }
    }

    uint64_t v8 = 4294962988LL;
    goto LABEL_17;
  }

  return v8;
}

uint64_t CCCKG2OwnerFinish(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  v15[1] = *MEMORY[0x1895FEE08];
  uint64_t v6 = 4294962996LL;
  if (a1 && a2 && a4 && a6)
  {
    uint64_t v8 = ccckg2_ctx_cp();
    uint64_t v10 = MEMORY[0x1895FE128](v8, v9);
    uint64_t v12 = (char *)v15 - v11;
    *(void *)((char *)v15 - v11) = v10;
    ccDRBGGetRngState();
    int v13 = ccckg2_owner_finish();
    if (v13 > -3)
    {
      if (v13)
      {
        if (v13 != -2)
        {
LABEL_14:
          uint64_t v6 = 4294962988LL;
          goto LABEL_15;
        }

        uint64_t v6 = 4294962992LL;
      }

      else
      {
        uint64_t v6 = CCCKGConvertNativeToECCryptor(v8, (uint64_t)v12, 1, a6);
      }
    }

    else if (v13 == -86)
    {
      uint64_t v6 = 4294962987LL;
    }

    else if (v13 != -7)
    {
      goto LABEL_14;
    }

uint64_t getCipherMode(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 0LL;
  switch((int)a2)
  {
    case 1:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3);
      goto LABEL_11;
    case 2:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 8);
      goto LABEL_11;
    case 3:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 16);
      goto LABEL_11;
    case 4:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 32);
      goto LABEL_11;
    case 7:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 40);
      goto LABEL_11;
    case 8:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 48);
      goto LABEL_11;
    case 10:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 24);
      goto LABEL_11;
    case 11:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 56);
      goto LABEL_11;
    case 12:
      uint64_t v4 = (uint64_t (**)(uint64_t, uint64_t))((char *)&ccmodeList + 144 * a1 + 72 * a3 + 64);
LABEL_11:
      uint64_t v3 = (*v4)(a1, a2);
      break;
    default:
      return v3;
  }

  return v3;
}

CCCryptorStatus CCCryptorCreateFromData( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *data, size_t dataLength, CCCryptorRef *cryptorRef, size_t *dataUsed)
{
  uint64_t v11 = (_CCCryptor *)(((unint64_t)data + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v12 = v11 - (_CCCryptor *)data + 16;
  if (dataUsed) {
    *dataUsed = v12;
  }
  CCCryptorStatus v13 = -4301;
  if (v11 && v12 <= dataLength)
  {
    if ((options & 2) != 0) {
      int v14 = 1;
    }
    else {
      int v14 = 2;
    }
    if (alg == 4) {
      CCMode v15 = 9;
    }
    else {
      CCMode v15 = v14;
    }
    CCCryptorStatus v13 = CCCryptorCreateWithMode( op,  v15,  alg,  options & 1,  iv,  key,  keyLength,  0LL,  v17,  v18,  HIDWORD(v18),  (CCCryptorRef *)(((unint64_t)data + 7) & 0xFFFFFFFFFFFFFFF8LL));
    if (!v13) {
      *cryptorRef = v11;
    }
  }

  return v13;
}

CCCryptorStatus CCCryptorCreate( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  if ((options & 2) != 0) {
    int v8 = 1;
  }
  else {
    int v8 = 2;
  }
  if (alg == 4) {
    CCMode v9 = 9;
  }
  else {
    CCMode v9 = v8;
  }
  return CCCryptorCreateWithMode(op, v9, alg, options & 1, iv, key, keyLength, 0LL, v11, v12, HIDWORD(v12), cryptorRef);
}

CCCryptorStatus CCCryptorCreateWithMode( CCOperation op, CCMode mode, CCAlgorithm alg, CCPadding padding, const void *iv, const void *key, size_t keyLength, const void *tweak, size_t tweakLength, int numRounds, CCModeOptions options, CCCryptorRef *cryptorRef)
{
  v44[2] = *MEMORY[0x1895FEE08];
  CCCryptorStatus v12 = -4300;
  if (!key || !cryptorRef) {
    return v12;
  }
  CCMode v15 = key;
  if ((key & 3) != 0)
  {
    char v20 = malloc(keyLength);
    if (!v20) {
      return -4302;
    }
    int v21 = v20;
    v42 = tweak;
    memcpy(v20, v15, keyLength);
    CCMode v15 = v21;
  }

  else
  {
    v42 = tweak;
    int v21 = 0LL;
  }

  char v22 = malloc(0x1000uLL);
  if (!v22)
  {
    *cryptorRef = 0LL;
    CCCryptorStatus v12 = -4302;
    if (!v21) {
      return v12;
    }
    goto LABEL_84;
  }

  uint64_t v23 = (uint64_t)v22;
  *(void *)char v22 = 0LL;
  if (op <= 3 && alg <= 6)
  {
    if (alg == 4) {
      CCMode v24 = 7;
    }
    else {
      CCMode v24 = mode;
    }
    v22[17] = v24;
    if (v24 <= 8 && ((1 << v24) & 0x106) != 0)
    {
      *((void *)v22 + 13) = 0LL;
      *((void *)v22 + 14) = 0LL;
    }

    else
    {
      *((void *)v22 + 13) = 0LL;
      *((void *)v22 + 14) = 0LL;
      if (op < 2)
      {
        CCMode v41 = v24;
        CCCryptorStatus v12 = setCryptorCipherMode((uint64_t)v22, alg, v24, op);
        if (v12) {
          goto LABEL_83;
        }
        uint64_t v28 = v23 + 8LL * op;
        size_t v29 = (**(uint64_t (***)(void))(v23 + 96))(*(void *)(v28 + 80));
        int v30 = malloc(v29);
        *(void *)(v28 + 104) = v30;
        goto LABEL_64;
      }

      if (op != 3)
      {
LABEL_65:
        if (padding == 12)
        {
          v36 = cccts3_pad;
        }

        else if (padding == 1)
        {
          if (v24 == 2) {
            v36 = ccpkcs7_pad;
          }
          else {
            v36 = ccpkcs7_ecb_pad;
          }
        }

        else
        {
          v36 = ccnopad_pad;
        }

        *(void *)(v23 + 120) = v36;
        *(_DWORD *)(v23 + 64) = alg;
        switch(alg)
        {
          case 1u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 8LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength != 8) {
              goto LABEL_82;
            }
            goto LABEL_91;
          case 2u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 8LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength != 24) {
              goto LABEL_82;
            }
            goto LABEL_91;
          case 3u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 8LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength - 5 < 0xC) {
              goto LABEL_91;
            }
            goto LABEL_82;
          case 4u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 1LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength - 1 < 0x200) {
              goto LABEL_91;
            }
            goto LABEL_82;
          case 5u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 8LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength - 1 < 0x80) {
              goto LABEL_91;
            }
            goto LABEL_82;
          case 6u:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 8LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (keyLength - 8 < 0x31) {
              goto LABEL_91;
            }
            goto LABEL_82;
          default:
            *(void *)(v23 + 48) = 0LL;
            *(void *)(v23 + 56) = 16LL;
            *(_DWORD *)(v23 + 72) = op;
            *(void *)(v23 + 40) = 0LL;
            if (alg)
            {
LABEL_82:
              CCCryptorStatus v12 = -4310;
              goto LABEL_83;
            }

            CCCryptorStatus v12 = -4310;
            if (keyLength > 0x20 || ((1LL << keyLength) & 0x101010000LL) == 0) {
              goto LABEL_83;
            }
LABEL_91:
            v44[0] = 0LL;
            v44[1] = 0LL;
            if (iv) {
              v38 = iv;
            }
            else {
              v38 = v44;
            }
            unsigned int v39 = *(_DWORD *)(v23 + 68);
            if (v39 <= 8 && ((1 << v39) & 0x106) != 0) {
              goto LABEL_96;
            }
            if (op >= 2)
            {
              if (op != 3) {
                goto LABEL_106;
              }
LABEL_96:
              int v40 = (*(uint64_t (**)(void, void *, const void *, size_t, const void *, void, void, void))(*(void *)(v23 + 96) + 16LL))( *(void *)(v23 + 80),  v38,  v15,  keyLength,  v42,  0LL,  0LL,  *(void *)(v23 + 104));
              if (!((*(unsigned int (**)(void, void *, const void *, size_t, const void *, void, void, void))(*(void *)(v23 + 96) + 16LL))( *(void *)(v23 + 88),  v38,  v15,  keyLength,  v42,  0LL,  0LL,  *(void *)(v23 + 112)) | v40)) {
                goto LABEL_106;
              }
            }

            else if (!(*(unsigned int (**)(void, void *, const void *, size_t, const void *, void, void, void))(*(void *)(v23 + 96) + 16LL))( *(void *)(v23 + 8LL * op + 80),  v38,  v15,  keyLength,  v42,  0LL,  0LL,  *(void *)(v23 + 8LL * op + 104)))
            {
              goto LABEL_106;
            }

            if (*(_DWORD *)(v23 + 64) != 2 && *(_DWORD *)(v23 + 68) != 8)
            {
              CCCryptorStatus v12 = -4308;
              goto LABEL_83;
            }

LABEL_106:
            CCCryptorStatus v12 = 0;
            *cryptorRef = (CCCryptorRef)v23;
            if (!v21) {
              return v12;
            }
            goto LABEL_84;
        }
      }
    }

    CCMode v25 = v24 - 1;
    CCMode v41 = v24;
    switch(v24)
    {
      case 1u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = ccecb_mode;
        goto LABEL_43;
      case 2u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 1])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = cccbc_mode;
        goto LABEL_43;
      case 3u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 2])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = cccfb_mode;
        goto LABEL_43;
      case 4u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 4])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = ccctr_mode;
        goto LABEL_43;
      case 7u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 5])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = ccofb_mode;
        goto LABEL_43;
      case 8u:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 6])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = ccxts_mode;
        goto LABEL_43;
      case 0xAu:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 3])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = cccfb8_mode;
        goto LABEL_43;
      case 0xBu:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 7])();
        *(void *)(v23 + 80) = v26;
        if (!v26) {
          goto LABEL_68;
        }
        BOOL v27 = ccgcm_mode;
        goto LABEL_43;
      case 0xCu:
        uint64_t v26 = ((uint64_t (*)(void))ccmodeList[18 * alg + 8])();
        *(void *)(v23 + 80) = v26;
        if (!v26)
        {
LABEL_68:
          CCCryptorStatus v12 = -4305;
          goto LABEL_83;
        }

        BOOL v27 = ccccm_mode;
LABEL_43:
        *(void *)(v23 + 96) = v27;
        size_t v31 = ((uint64_t (*)(uint64_t))*v27)(v26);
        v32 = malloc(v31);
        *(void *)(v23 + 104) = v32;
        if (!v32) {
          goto LABEL_69;
        }
        switch(v25)
        {
          case 0u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 9])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccecb_mode;
            break;
          case 1u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 10])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = cccbc_mode;
            break;
          case 2u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 11])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = cccfb_mode;
            break;
          case 3u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 13])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccctr_mode;
            break;
          case 6u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 14])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccofb_mode;
            break;
          case 7u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 15])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccxts_mode;
            break;
          case 9u:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 12])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = cccfb8_mode;
            break;
          case 0xAu:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 16])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccgcm_mode;
            break;
          case 0xBu:
            uint64_t v33 = ((uint64_t (*)(void))ccmodeList[18 * alg + 17])();
            *(void *)(v23 + 88) = v33;
            if (!v33) {
              goto LABEL_68;
            }
            v34 = ccccm_mode;
            break;
          default:
            goto LABEL_83;
        }

        *(void *)(v23 + 96) = v34;
        size_t v35 = ((uint64_t (*)(uint64_t))*v34)(v33);
        int v30 = malloc(v35);
        *(void *)(v23 + 112) = v30;
        break;
      default:
        goto LABEL_83;
    }

LABEL_64:
    CCMode v24 = v41;
    if (v30) {
      goto LABEL_65;
    }
LABEL_69:
    CCCryptorStatus v12 = -4302;
  }

LABEL_83:
  *cryptorRef = 0LL;
  ccClearCryptor(v23);
  free((void *)v23);
  if (v21)
  {
LABEL_84:
    cc_clear();
    free(v21);
  }

  return v12;
}

uint64_t CCCryptorCreateFromDataWithMode( CCOperation a1, CCMode a2, CCAlgorithm a3, CCPadding a4, const void *a5, const void *a6, size_t a7, const void *a8, uint64_t a9, uint64_t a10, uint64_t a11, unint64_t a12, CCCryptorRef **a13, unint64_t *a14)
{
  cryptorRef = (CCCryptorRef *)((a11 + 7) & 0xFFFFFFFFFFFFFFF8LL);
  unint64_t v15 = (unint64_t)cryptorRef - a11 + 16;
  if (a14) {
    *a14 = v15;
  }
  if (cryptorRef) {
    BOOL v16 = v15 > a12;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16) {
    return 4294962995LL;
  }
  uint64_t result = CCCryptorCreateWithMode(a1, a2, a3, a4, a5, a6, a7, a8, v18, v19, HIDWORD(v19), cryptorRef);
  if (!(_DWORD)result) {
    *a13 = cryptorRef;
  }
  return result;
}

uint64_t ccClearCryptor(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 68);
  BOOL v3 = v2 > 8;
  int v4 = (1 << v2) & 0x106;
  if (v3 || v4 == 0)
  {
    uint64_t v11 = *(unsigned int *)(a1 + 72);
    if (v11 < 2)
    {
      (**(void (***)(void))(a1 + 96))(*(void *)(a1 + 8 * v11 + 80));
      cc_clear();
      free(*(void **)(a1 + 104 + 8LL * *(unsigned int *)(a1 + 72)));
      return cc_clear();
    }

    if ((_DWORD)v11 != 3) {
      return cc_clear();
    }
  }

  uint64_t v6 = 0LL;
  char v7 = 1;
  do
  {
    char v8 = v7;
    uint64_t v9 = a1 + 8 * v6;
    (**(void (***)(void))(a1 + 96))(*(void *)(v9 + 80));
    cc_clear();
    free(*(void **)(v9 + 104));
    char v7 = 0;
    uint64_t v6 = 1LL;
  }

  while ((v8 & 1) != 0);
  return cc_clear();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  if (cryptorRef)
  {
    if (*(void *)cryptorRef) {
      CCCryptorRef v1 = *(CCCryptorRef *)cryptorRef;
    }
    else {
      CCCryptorRef v1 = cryptorRef;
    }
    ccClearCryptor((uint64_t)v1);
    free(v1);
  }

  return 0;
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  if (!cryptorRef) {
    return -4300LL;
  }
  BOOL v3 = final;
  if (*(void *)cryptorRef) {
    CCCryptorRef v5 = *(CCCryptorRef *)cryptorRef;
  }
  else {
    CCCryptorRef v5 = cryptorRef;
  }
  if ((*(uint64_t (**)(void))(*((void *)v5 + 12) + 8LL))(*((void *)v5 + *((unsigned int *)v5 + 18) + 10)) != 1) {
    return (*(uint64_t (**)(BOOL, void, void, size_t, BOOL))(*((void *)v5 + 15) + 16LL))( *((_DWORD *)v5 + 18) == 0,  *((void *)v5 + 12),  *((void *)v5 + *((unsigned int *)v5 + 18) + 10),  *((void *)v5 + 5) + inputLength,  v3);
  }
  return inputLength;
}

CCCryptorStatus CCCryptorUpdate( CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  size_t v31 = dataOutAvailable;
  v32 = dataOut;
  if (!cryptorRef) {
    return -4300;
  }
  size_t v9 = dataInLength;
  if (*(void *)cryptorRef) {
    CCCryptorRef v11 = *(CCCryptorRef *)cryptorRef;
  }
  else {
    CCCryptorRef v11 = cryptorRef;
  }
  if (dataOutMoved) {
    *dataOutMoved = 0LL;
  }
  if (!dataInLength) {
    return 0;
  }
  uint64_t v12 = (*(uint64_t (**)(void))(*((void *)v11 + 12) + 8LL))(*((void *)v11
  unint64_t v13 = v9;
  if (v12 != 1) {
    unint64_t v13 = (*(uint64_t (**)(BOOL, void, void, size_t, void))(*((void *)v11 + 15) + 16LL))( *((_DWORD *)v11 + 18) == 0,  *((void *)v11 + 12),  *((void *)v11 + *((unsigned int *)v11 + 18) + 10),  *((void *)v11 + 5) + v9,  0LL);
  }
  if (v13 <= dataOutAvailable)
  {
    if ((*(uint64_t (**)(void))(*((void *)v11 + 12) + 8LL))(*((void *)v11
                                                                           + *((unsigned int *)v11 + 18)
                                                                           + 10)) == 1)
    {
      unint64_t v15 = &v32;
      return ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v9, (uint64_t *)v15, &v31, dataOutMoved);
    }

    uint64_t v33 = dataOut;
    uint64_t v16 = *((void *)v11 + 5);
    unint64_t v17 = (*(uint64_t (**)(BOOL, void, void))(*((void *)v11 + 15) + 24LL))( *((_DWORD *)v11 + 18) == 0,  *((void *)v11 + 12),  *((void *)v11 + *((unsigned int *)v11 + 18) + 10));
    int v18 = v17;
    int v19 = *((_DWORD *)v11 + 16) - 1;
    if (v19 > 5)
    {
      uint64_t v20 = 16LL;
      if (!v17)
      {
LABEL_22:
        if (!*((void *)v11 + 5) && ((v20 - 1) & v9) == 0)
        {
          unint64_t v15 = &v33;
          return ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v9, (uint64_t *)v15, &v31, dataOutMoved);
        }
      }
    }

    else
    {
      uint64_t v20 = qword_1802D8B40[v19];
      if (!v17) {
        goto LABEL_22;
      }
    }

    size_t v21 = v16 + v9;
    unint64_t v22 = v16 + v9;
    if (v16 + v9 > v17)
    {
      unint64_t v23 = v17 - v20;
      if (!v17) {
        unint64_t v23 = 0LL;
      }
      if (((v20 - 1) & v21) != 0) {
        unint64_t v22 = v23 + ((v20 - 1) & v21);
      }
      else {
        unint64_t v22 = v17;
      }
    }

    unint64_t v24 = v21 - v22;
    if (v21 != v22)
    {
      unint64_t v25 = *((void *)v11 + 5);
      if (!v25) {
        goto LABEL_38;
      }
      if (v25 >= v24)
      {
        if (v25 != v24)
        {
          if (v22) {
            return -4304;
          }
          CCCryptorStatus result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v24, (uint64_t *)&v33, &v31, dataOutMoved);
          if (result) {
            return result;
          }
          size_t v30 = (v18 - v24);
          *((void *)v11 + 5) = v30;
          memmove((char *)v11 + 8, (char *)v11 + v24 + 8, v30);
          return 0;
        }

        CCCryptorStatus result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v24, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result) {
          return result;
        }
      }

      else
      {
        size_t v26 = v20 - (v25 & (v20 - 1));
        memcpy((char *)v11 + v25 + 8, dataIn, v26);
        unint64_t v27 = *((void *)v11 + 5) + v26;
        *((void *)v11 + 5) = v27;
        CCCryptorStatus result = ccSimpleUpdate((uint64_t)v11, (uint64_t)v11 + 8, v27, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result) {
          return result;
        }
        v9 -= v26;
        dataIn = (char *)dataIn + v26;
      }

      uint64_t v28 = *((void *)v11 + 5);
      *((void *)v11 + 5) = 0LL;
      v24 -= v28;
      if (v24)
      {
LABEL_38:
        if ((v24 & (v20 - 1)) != 0) {
          return -4304;
        }
        CCCryptorStatus result = ccSimpleUpdate((uint64_t)v11, (uint64_t)dataIn, v24, (uint64_t *)&v33, &v31, dataOutMoved);
        if (result) {
          return result;
        }
        dataIn = (char *)dataIn + v24;
        v9 -= v24;
      }
    }

    if (!v22 || (uint64_t v29 = *((void *)v11 + 5), v22 == v29))
    {
      if (!v9) {
        return 0;
      }
      return -4304;
    }

    if (v22 - v29 != v9) {
      return -4304;
    }
    memcpy((char *)v11 + v29 + 8, dataIn, v9);
    *((void *)v11 + 5) += v9;
    return 0;
  }

  if (dataOutMoved) {
    *dataOutMoved = v13;
  }
  return -4301;
}

uint64_t ccSimpleUpdate( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4, unint64_t *a5, void *a6)
{
  uint64_t v11 = *(void *)(a1 + 96);
  if (*(_DWORD *)(a1 + 72))
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v11 + 32);
    if (!v12) {
      return 4294962996LL;
    }
    uint64_t v13 = *a4;
    uint64_t v14 = *(void *)(a1 + 88);
    uint64_t v15 = *(void *)(a1 + 112);
  }

  else
  {
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t, uint64_t))(v11 + 24);
    if (!v12) {
      return 4294962996LL;
    }
    uint64_t v13 = *a4;
    uint64_t v14 = *(void *)(a1 + 80);
    uint64_t v15 = *(void *)(a1 + 104);
  }

  int v16 = v12(v14, a2, v13, a3, v15);
  if (v16 == -68) {
    return 4294962987LL;
  }
  if (v16) {
    return 4294962996LL;
  }
  if (a6) {
    *a6 += a3;
  }
  if (*a5 < a3) {
    return 4294962995LL;
  }
  uint64_t result = 0LL;
  *(void *)(a1 + 48) += a3;
  *a4 += a3;
  *a5 -= a3;
  return result;
}

CCCryptorStatus CCCryptorFinal( CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  if (!cryptorRef) {
    return (int)cryptorRef;
  }
  if (*(void *)cryptorRef) {
    CCCryptorRef v7 = *(CCCryptorRef *)cryptorRef;
  }
  else {
    CCCryptorRef v7 = cryptorRef;
  }
  uint64_t v8 = *((unsigned int *)v7 + 18);
  if (dataOutMoved) {
    *dataOutMoved = 0LL;
  }
  if ((*(uint64_t (**)(void))(*((void *)v7 + 12) + 8LL))(*((void *)v7 + v8 + 10)) != 1)
  {
    uint64_t v11 = (unsigned int (**)(void, void, void, char *, void, _BYTE *, size_t *))*((void *)v7 + 15);
    if ((_DWORD)v8)
    {
      uint64_t v12 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
      if (!v11[1]( *((void *)v12 + 13),  *((void *)v7 + 12),  *((void *)v12 + 10),  (char *)v7 + 8,  *((void *)v7 + 5),  __src,  &__n))
      {
        size_t v13 = __n;
        if (__n <= dataOutAvailable)
        {
          if (dataOut)
          {
            memcpy(dataOut, __src, __n);
            if (dataOutMoved) {
              *dataOutMoved = v13;
            }
          }

          *((void *)v7 + 6) += v13;
LABEL_18:
          LODWORD(cryptorRef) = 0;
          *((void *)v7 + 5) = 0LL;
          return (int)cryptorRef;
        }

        goto LABEL_22;
      }
    }

    else
    {
      uint64_t v14 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
      if (!(*v11)( *((void *)v14 + 13),  *((void *)v7 + 12),  *((void *)v14 + 10),  (char *)v7 + 8,  *((void *)v7 + 5),  __src,  &__n))
      {
        size_t v15 = __n;
        if (__n <= dataOutAvailable)
        {
          if (dataOut)
          {
            memcpy(dataOut, __src, __n);
            if (dataOutMoved) {
              *dataOutMoved = v15;
            }
          }

          goto LABEL_18;
        }

LABEL_22:
        LODWORD(cryptorRef) = -4301;
        return (int)cryptorRef;
      }
    }

    LODWORD(cryptorRef) = -4303;
    return (int)cryptorRef;
  }

  size_t v9 = *(void (**)(void, void))(*((void *)v7 + 12) + 56LL);
  if (v9)
  {
    uint64_t v10 = (char *)v7 + 8 * *((unsigned int *)v7 + 18);
    v9(*((void *)v10 + 10), *((void *)v10 + 13));
  }

  LODWORD(cryptorRef) = 0;
  return (int)cryptorRef;
}

uint64_t CCCryptorReset_binary_compatibility(void *a1, void *a2)
{
  v14[2] = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 4294962996LL;
  }
  unsigned int v2 = (void *)*a1;
  if (!*a1) {
    unsigned int v2 = a1;
  }
  v2[5] = 0LL;
  v2[6] = 0LL;
  if (!a2)
  {
    v14[0] = 0LL;
    v14[1] = 0LL;
    int v6 = *((_DWORD *)v2 + 16) - 1;
    else {
      uint64_t v4 = dword_1802D8B70[v6];
    }
    CCCryptorRef v7 = *(unsigned int (**)(uint64_t, void *, uint64_t, uint64_t))(v2[12] + 64LL);
    if (v7)
    {
      int v12 = *((_DWORD *)v2 + 18);
      if (v12 == 3) {
        int v12 = 0;
      }
      size_t v13 = &v2[v12];
      uint64_t v10 = v13[10];
      uint64_t v11 = v13[13];
      a2 = v14;
      goto LABEL_20;
    }

    return 0LL;
  }

  int v3 = *((_DWORD *)v2 + 16) - 1;
  else {
    uint64_t v4 = dword_1802D8B70[v3];
  }
  CCCryptorRef v7 = *(unsigned int (**)(uint64_t, void *, uint64_t, uint64_t))(v2[12] + 64LL);
  if (!v7) {
    return 0LL;
  }
  int v8 = *((_DWORD *)v2 + 18);
  if (v8 == 3) {
    int v8 = 0;
  }
  size_t v9 = &v2[v8];
  uint64_t v10 = v9[10];
  uint64_t v11 = v9[13];
LABEL_20:
  if (v7(v10, a2, v4, v11)) {
    return 4294962994LL;
  }
  else {
    return 0LL;
  }
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  v19[2] = *MEMORY[0x1895FEE08];
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    return CCCryptorReset_binary_compatibility(cryptorRef, iv);
  }
  if (!cryptorRef) {
    return -4300;
  }
  CCCryptorRef v4 = *(CCCryptorRef *)cryptorRef;
  if (!*(void *)cryptorRef) {
    CCCryptorRef v4 = cryptorRef;
  }
  int v5 = *((_DWORD *)v4 + 17);
  if (v5 != 4 && v5 != 2) {
    return -4305;
  }
  *((void *)v4 + 5) = 0LL;
  *((void *)v4 + 6) = 0LL;
  if (!iv)
  {
    v19[0] = 0LL;
    v19[1] = 0LL;
    unsigned int v10 = *((_DWORD *)v4 + 16) - 1;
    if (v10 > 5) {
      uint64_t v8 = 16LL;
    }
    else {
      uint64_t v8 = dword_1802D8B70[v10];
    }
    uint64_t v11 = *(unsigned int (**)(uint64_t, void *, uint64_t, uint64_t))(*((void *)v4 + 12) + 64LL);
    if (v11)
    {
      unsigned int v17 = *((_DWORD *)v4 + 18);
      if (v17 == 3) {
        unsigned int v17 = 0;
      }
      int v18 = (char *)v4 + 8 * v17;
      uint64_t v14 = *((void *)v18 + 10);
      uint64_t v15 = *((void *)v18 + 13);
      int v16 = v19;
      goto LABEL_26;
    }

    return -4300;
  }

  unsigned int v7 = *((_DWORD *)v4 + 16) - 1;
  if (v7 > 5) {
    uint64_t v8 = 16LL;
  }
  else {
    uint64_t v8 = dword_1802D8B70[v7];
  }
  uint64_t v11 = *(unsigned int (**)(uint64_t, void *, uint64_t, uint64_t))(*((void *)v4 + 12) + 64LL);
  if (!v11) {
    return -4300;
  }
  unsigned int v12 = *((_DWORD *)v4 + 18);
  if (v12 == 3) {
    unsigned int v12 = 0;
  }
  size_t v13 = (char *)v4 + 8 * v12;
  uint64_t v14 = *((void *)v13 + 10);
  uint64_t v15 = *((void *)v13 + 13);
  int v16 = iv;
LABEL_26:
  if (v11(v14, v16, v8, v15)) {
    return -4302;
  }
  else {
    return 0;
  }
}

uint64_t CCCryptorGetIV(void *a1, uint64_t a2)
{
  if (!a1) {
    return 4294962996LL;
  }
  if (*a1) {
    int v3 = (void *)*a1;
  }
  else {
    int v3 = a1;
  }
  unsigned int v4 = *((_DWORD *)v3 + 16) - 1;
  unsigned int v5 = v4 > 5 ? 16 : dword_1802D8B70[v4];
  unsigned int v7 = *(unsigned int (**)(void, uint64_t, unsigned int *, void))(v3[12] + 72LL);
  if (!v7) {
    return 4294962996LL;
  }
  unsigned int v9 = v5;
  unsigned int v8 = *((_DWORD *)v3 + 18);
  if (v8 == 3) {
    unsigned int v8 = 0;
  }
  if (v7(v3[v8 + 10], a2, &v9, v3[v8 + 13])) {
    return 4294962994LL;
  }
  else {
    return 0LL;
  }
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  CCCryptorRef cryptorRef = 0LL;
  if ((options & 2) != 0) {
    int v14 = 1;
  }
  else {
    int v14 = 2;
  }
  if (alg == 4) {
    CCMode v15 = 9;
  }
  else {
    CCMode v15 = v14;
  }
  CCCryptorStatus v16 = CCCryptorCreateWithMode(op, v15, alg, options & 1, iv, key, keyLength, 0LL, v19, v20, HIDWORD(v20), &cryptorRef);
  if (!v16)
  {
    size_t OutputLength = CCCryptorGetOutputLength(cryptorRef, dataInLength, 1);
    if (dataOutMoved) {
      *dataOutMoved = OutputLength;
    }
    if (OutputLength <= dataOutAvailable)
    {
      CCCryptorStatus v16 = CCCryptorUpdate(cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, &v22);
      if (!v16)
      {
        CCCryptorStatus v16 = CCCryptorFinal(cryptorRef, (char *)dataOut + v22, dataOutAvailable - v22, &v21);
        if (dataOutMoved) {
          *dataOutMoved = v21 + v22;
        }
      }
    }

    else
    {
      CCCryptorStatus v16 = -4301;
    }

    CCCryptorRelease(cryptorRef);
  }

  return v16;
}

uint64_t CCCryptorEncryptDataBlock(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1) {
    return 4294962996LL;
  }
  unsigned int v9 = *a1 ? (void *)*a1 : a1;
  uint64_t v12 = v9[12];
  if (a2)
  {
    size_t v13 = *(unsigned int (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, void))(v12 + 40);
    uint64_t v10 = 4294962996LL;
    if (v13)
    {
      if (v13(v9[10], a3, a4, a5, a2, v9[13])) {
        return 4294962996LL;
      }
      else {
        return 0LL;
      }
    }
  }

  else
  {
    int v14 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(v12 + 24);
    uint64_t v10 = 4294962996LL;
    if (v14)
    {
      int v15 = v14(v9[10], a3, a5, a4, v9[13]);
      if (v15) {
        unsigned int v16 = -4300;
      }
      else {
        unsigned int v16 = 0;
      }
      if (v15 == -68) {
        return 4294962987LL;
      }
      else {
        return v16;
      }
    }
  }

  return v10;
}

uint64_t CCCryptorDecryptDataBlock(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1) {
    return 4294962996LL;
  }
  unsigned int v9 = *a1 ? (void *)*a1 : a1;
  uint64_t v12 = v9[12];
  if (a2)
  {
    size_t v13 = *(unsigned int (**)(void, uint64_t, uint64_t, uint64_t, uint64_t, void))(v12 + 48);
    uint64_t v10 = 4294962996LL;
    if (v13)
    {
      if (v13(v9[11], a3, a4, a5, a2, v9[14])) {
        return 4294962996LL;
      }
      else {
        return 0LL;
      }
    }
  }

  else
  {
    int v14 = *(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, void))(v12 + 32);
    uint64_t v10 = 4294962996LL;
    if (v14)
    {
      int v15 = v14(v9[11], a3, a5, a4, v9[14]);
      if (v15) {
        unsigned int v16 = -4300;
      }
      else {
        unsigned int v16 = 0;
      }
      if (v15 == -68) {
        return 4294962987LL;
      }
      else {
        return v16;
      }
    }
  }

  return v10;
}

uint64_t CCCryptorAddParameter(void *a1, int a2, void *__src, size_t __n)
{
  if (!a1) {
    return 4294962996LL;
  }
  unsigned int v4 = (void *)*a1;
  if (!*a1) {
    unsigned int v4 = a1;
  }
  switch(a2)
  {
    case 0:
      int v5 = *((_DWORD *)v4 + 17);
      if (v5 == 12)
      {
        uint64_t v8 = v4[*((unsigned int *)v4 + 18) + 13];
        *(void *)(v8 + 16) = __n;
        memcpy((void *)(v8 + 32), __src, __n);
        return 0LL;
      }

      if (v5 != 11) {
        return 4294962991LL;
      }
      return 0LL;
    case 1:
      int v7 = *((_DWORD *)v4 + 17);
      if (v7 != 12)
      {
        if (v7 != 11) {
          return 4294962991LL;
        }
        return 0LL;
      }

      unsigned int v9 = (void *)v4[*((unsigned int *)v4 + 18) + 13];
      if (v9[1] != -1LL && v9[2] != -1LL && *v9 != -1LL)
      {
        v9[3] = __n;
        if (!ccccm_set_iv())
        {
          return 0LL;
        }
      }

LABEL_25:
      uint64_t result = 4294962996LL;
      break;
    case 2:
      if (*((_DWORD *)v4 + 17) != 12) {
        return 4294962991LL;
      }
      *(void *)(v4[*((unsigned int *)v4 + 18) + 13] + 8LL) = __n;
      return 0LL;
    case 3:
      if (*((_DWORD *)v4 + 17) != 12) {
        return 4294962991LL;
      }
      *(void *)v4[*((unsigned int *)v4 + 18) + 13] = __n;
      return 0LL;
    default:
      goto LABEL_25;
  }

  return result;
}

uint64_t CCCryptorGetParameter(void *a1, int a2, void *__dst, void *a4)
{
  if (!a1) {
    return 4294962996LL;
  }
  unsigned int v4 = (void *)*a1;
  if (!*a1) {
    unsigned int v4 = a1;
  }
  if (a2 != 4) {
    return 4294962996LL;
  }
  if (*((_DWORD *)v4 + 17) != 12) {
    return 4294962991LL;
  }
  uint64_t v6 = v4[*((unsigned int *)v4 + 18) + 13];
  memcpy(__dst, (const void *)(v6 + 48), *(void *)(v6 + 8));
  uint64_t result = 0LL;
  *a4 = *(void *)(v6 + 8);
  return result;
}

uint64_t setCryptorCipherMode(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  uint64_t result = 4294962996LL;
  switch(a3)
  {
    case 1:
      uint64_t v7 = (*(&ccmodeList[18 * a2] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v7;
      if (!v7) {
        return 4294962991LL;
      }
      uint64_t v8 = ccecb_mode;
      goto LABEL_20;
    case 2:
      uint64_t v9 = (*(&ccmodeList[18 * a2 + 1] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v9;
      if (!v9) {
        return 4294962991LL;
      }
      uint64_t v8 = cccbc_mode;
      goto LABEL_20;
    case 3:
      uint64_t v10 = (*(&ccmodeList[18 * a2 + 2] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v10;
      if (!v10) {
        return 4294962991LL;
      }
      uint64_t v8 = cccfb_mode;
      goto LABEL_20;
    case 4:
      uint64_t v11 = (*(&ccmodeList[18 * a2 + 4] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v11;
      if (!v11) {
        return 4294962991LL;
      }
      uint64_t v8 = ccctr_mode;
      goto LABEL_20;
    case 7:
      uint64_t v12 = (*(&ccmodeList[18 * a2 + 5] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v12;
      if (!v12) {
        return 4294962991LL;
      }
      uint64_t v8 = ccofb_mode;
      goto LABEL_20;
    case 8:
      uint64_t v13 = (*(&ccmodeList[18 * a2 + 6] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v13;
      if (!v13) {
        return 4294962991LL;
      }
      uint64_t v8 = ccxts_mode;
      goto LABEL_20;
    case 10:
      uint64_t v14 = (*(&ccmodeList[18 * a2 + 3] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v14;
      if (!v14) {
        return 4294962991LL;
      }
      uint64_t v8 = cccfb8_mode;
      goto LABEL_20;
    case 11:
      uint64_t v15 = (*(&ccmodeList[18 * a2 + 7] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v15;
      if (!v15) {
        return 4294962991LL;
      }
      uint64_t v8 = ccgcm_mode;
      goto LABEL_20;
    case 12:
      uint64_t v16 = (*(&ccmodeList[18 * a2 + 8] + 9 * a4))(4294962996LL);
      *(void *)(a1 + 8LL * a4 + 80) = v16;
      if (!v16) {
        return 4294962991LL;
      }
      uint64_t v8 = ccccm_mode;
LABEL_20:
      uint64_t result = 0LL;
      *(void *)(a1 + 96) = v8;
      return result;
    default:
      return result;
  }

void *CCDHCreate(int a1)
{
  if (a1 != 1) {
    return 0LL;
  }
  ccdh_gp_rfc3526group05();
  uint64_t v1 = ccdh_ccn_size();
  unsigned int v2 = malloc(2 * v1 + 16);
  if (v2)
  {
    ccdh_ctx_public();
    ccdh_ctx_init();
  }

  return v2;
}

uint64_t CCDHGenerateKey(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a3)
  {
    ccDRBGGetRngState();
    ccdh_ctx_public();
    unint64_t v6 = ccdh_export_pub_size();
    unint64_t v7 = *a3;
    *a3 = v6;
    if (v6 > v7)
    {
      return 0xFFFFFFFFLL;
    }

    else
    {
      ccdh_ctx_public();
      ccdh_export_pub();
      return 0LL;
    }
  }

  return result;
}

uint64_t CCDHComputeKey(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a3 && a5)
  {
    uint64_t v8 = ccdh_ccn_size();
    MEMORY[0x1895FE128](v8, v9);
    unint64_t v10 = (unint64_t)(cczp_bitlen() + 7) >> 3;
    if (v10 <= *a2)
    {
      if (ccdh_import_pub())
      {
        *a2 = v10;
        return 4294967294LL;
      }

      else
      {
        ccrng();
        else {
          return 0LL;
        }
      }
    }

    else
    {
      *a2 = v10;
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t CCDigestGetDigestInfo(unsigned int a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 96LL) == -1LL)
  {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 104LL);
    if (v2) {
      goto LABEL_3;
    }
  }

  else
  {
    uint64_t v2 = _os_alloc_once();
    if (v2)
    {
LABEL_3:
      if (a1 <= 0x10) {
        return *(void *)(v2 + 8LL * a1 + 3536);
      }
      else {
        return 0LL;
      }
    }
  }

  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_3();
  }
  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_2();
  }
  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_1();
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t CCDigestInit(unsigned int a1, uint64_t *a2)
{
  if (a1 - 17 < 0xFFFFFFF0 || a2 == 0LL) {
    return 4294962996LL;
  }
  uint64_t DigestInfo = CCDigestGetDigestInfo(a1);
  *a2 = DigestInfo;
  if (!DigestInfo) {
    return 4294962991LL;
  }
  ccdigest_init();
  return 0LL;
}

uint64_t CCDigestUpdate(void *a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  if (!a3) {
    return 0LL;
  }
  if (!a2) {
    return 4294962996LL;
  }
  if (!*a1) {
    return 4294962991LL;
  }
  ccdigest_update();
  return 0LL;
}

uint64_t CCDigestFinal(void *a1, uint64_t a2)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2)
  {
    if (*a1)
    {
      (*(void (**)(void, void *, uint64_t))(*a1 + 56LL))(*a1, a1 + 1, a2);
      return 0LL;
    }

    else
    {
      return 4294962991LL;
    }
  }

  return result;
}

uint64_t CCDigest(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!CCDigestGetDigestInfo(a1)) {
    return 4294962991LL;
  }
  if (!a4 || !a2 && a3) {
    return 4294962996LL;
  }
  ccdigest();
  return 0LL;
}

uint64_t CCDigestGetBlockSize(unsigned int a1)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(a1);
  if (DigestInfo) {
    return *(void *)(DigestInfo + 16);
  }
  else {
    return -4305LL;
  }
}

uint64_t CCDigestGetOutputSize(unsigned int a1)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(a1);
  if (DigestInfo) {
    return *(void *)DigestInfo;
  }
  else {
    return -4305LL;
  }
}

uint64_t CCDigestGetBlockSizeFromRef(uint64_t a1)
{
  if (*(void *)a1) {
    return *(void *)(*(void *)a1 + 16LL);
  }
  else {
    return -4305LL;
  }
}

uint64_t CCDigestBlockSize(uint64_t a1)
{
  if (*(void *)a1) {
    return *(void *)(*(void *)a1 + 16LL);
  }
  else {
    return -4305LL;
  }
}

uint64_t CCDigestOutputSize(uint64_t a1)
{
  if (*(void *)a1) {
    return **(void **)a1;
  }
  else {
    return -4305LL;
  }
}

uint64_t CCDigestGetOutputSizeFromRef(uint64_t a1)
{
  if (*(void *)a1) {
    return **(void **)a1;
  }
  else {
    return -4305LL;
  }
}

void *CCDigestCreate(unsigned int a1)
{
  uint64_t v2 = malloc(0x408uLL);
  if (v2 && CCDigestInit(a1, (uint64_t *)v2))
  {
    free(v2);
    return 0LL;
  }

  return v2;
}

uint64_t CCDigestOID(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 32LL);
}

uint64_t CCDigestOIDLen(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 24LL);
}

void *CCDigestCreateByOID(const void *a1, size_t a2)
{
  unsigned int v4 = 1;
  while (1)
  {
    uint64_t DigestInfo = CCDigestGetDigestInfo(v4);
    if (DigestInfo)
    {
    }

    if (++v4 == 17) {
      return 0LL;
    }
  }

  return CCDigestCreate(v4);
}

uint64_t CCDigestReset(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result) {
    return ccdigest_init();
  }
  return result;
}

void CCDigestDestroy(void *a1)
{
  if (a1)
  {
    cc_clear();
    free(a1);
  }

unsigned __int8 *__cdecl CC_MD2(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

int CC_MD4_Init(CC_MD4_CTX *c)
{
  v7[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(2u);
  MEMORY[0x1895FE128](DigestInfo, v3);
  int v5 = (void *)((char *)v7 - v4);
  ccdigest_init();
  memcpy(c, v5 + 1, *(void *)(DigestInfo + 8));
  memcpy(c->data, (char *)v5 + *(void *)(DigestInfo + 8) + 8, *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v5;
  c->num = *(_DWORD *)((char *)v5 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD4_Update(CC_MD4_CTX *c, const void *data, CC_LONG len)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(2u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  ccdigest_update();
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD4_Final(unsigned __int8 *md, CC_MD4_CTX *c)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(2u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v9, md);
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_MD4(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  v7[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(3u);
  MEMORY[0x1895FE128](DigestInfo, v3);
  size_t v5 = (void *)((char *)v7 - v4);
  ccdigest_init();
  memcpy(c, v5 + 1, *(void *)(DigestInfo + 8));
  memcpy(c->data, (char *)v5 + *(void *)(DigestInfo + 8) + 8, *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v5;
  c->num = *(_DWORD *)((char *)v5 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(3u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  ccdigest_update();
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(3u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v9, md);
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  v7[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(8u);
  MEMORY[0x1895FE128](DigestInfo, v3);
  size_t v5 = (void *)((char *)v7 - v4);
  ccdigest_init();
  memcpy(c, v5 + 1, *(void *)(DigestInfo + 8));
  memcpy(c->data, (char *)v5 + *(void *)(DigestInfo + 8) + 8, *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v5;
  c->num = *(_DWORD *)((char *)v5 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(8u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  ccdigest_update();
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(8u);
  size_t v5 = *(void *)(DigestInfo + 8);
  size_t v6 = *(void *)(DigestInfo + 16);
  MEMORY[0x1895FE128](DigestInfo, v7);
  uint64_t v9 = (void *)((char *)v13 - v8);
  unint64_t v10 = (char *)&v13[1] - v8;
  memcpy(v10, c, v5);
  uint64_t v11 = &v10[v5];
  memcpy(v11, c->data, v6);
  void *v9 = *(void *)&c->Nl;
  *(_DWORD *)&v11[v6] = c->num;
  (*(void (**)(uint64_t, void *, unsigned __int8 *))(DigestInfo + 56))(DigestInfo, v9, md);
  memcpy(c, v10, *(void *)(DigestInfo + 8));
  memcpy(c->data, &v10[*(void *)(DigestInfo + 8)], *(void *)(DigestInfo + 16));
  *(void *)&c->Nl = *v9;
  c->num = *(_DWORD *)((char *)v9 + *(void *)(DigestInfo + 8) + *(void *)(DigestInfo + 16) + 8);
  return 1;
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

unsigned __int8 *__cdecl CC_SHA224(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  else {
    return md;
  }
}

int CC_MD2_Init(CC_MD2_CTX *c)
{
  v7[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(1u);
  MEMORY[0x1895FE128](DigestInfo, v3);
  size_t v5 = (char *)v7 - v4;
  ccdigest_init();
  *(_OWORD *)c->cksm = *(_OWORD *)(v5 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v5 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v5[*(void *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v5[*(void *)(DigestInfo + 8) + 8 + *(void *)(DigestInfo + 16)];
  return 1;
}

int CC_MD2_Update(CC_MD2_CTX *c, const void *data, CC_LONG len)
{
  v12[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(1u);
  MEMORY[0x1895FE128](DigestInfo, v5);
  uint64_t v7 = (char *)v12 - v6;
  *(_OWORD *)(v7 + 56) = *(_OWORD *)c->cksm;
  *(_OWORD *)(v7 + 8) = *(_OWORD *)c->state;
  uint64_t v9 = (_OWORD *)((char *)&v12[1] + v8 - v6);
  _OWORD *v9 = *(_OWORD *)c->data;
  *(_DWORD *)((char *)v9 + v10) = c->num;
  ccdigest_update();
  *(_OWORD *)c->cksm = *(_OWORD *)(v7 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v7 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v7[*(void *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v7[*(void *)(DigestInfo + 8) + 8 + *(void *)(DigestInfo + 16)];
  return 1;
}

int CC_MD2_Final(unsigned __int8 *md, CC_MD2_CTX *c)
{
  v13[1] = *MEMORY[0x1895FEE08];
  uint64_t DigestInfo = CCDigestGetDigestInfo(1u);
  uint64_t v6 = MEMORY[0x1895FE128](DigestInfo, v5);
  uint64_t v8 = (char *)v13 - v7;
  *(_OWORD *)(v8 + 56) = *(_OWORD *)c->cksm;
  *(_OWORD *)(v8 + 8) = *(_OWORD *)c->state;
  uint64_t v10 = (_OWORD *)((char *)&v13[1] + v9 - v7);
  _OWORD *v10 = *(_OWORD *)c->data;
  *(_DWORD *)((char *)v10 + v11) = c->num;
  (*(void (**)(uint64_t, char *, unsigned __int8 *))(v6 + 56))(v6, (char *)v13 - v7, md);
  *(_OWORD *)c->cksm = *(_OWORD *)(v8 + 56);
  *(_OWORD *)c->state = *(_OWORD *)(v8 + 8);
  *(_OWORD *)c->data = *(_OWORD *)&v8[*(void *)(DigestInfo + 8) + 8];
  c->num = *(_DWORD *)&v8[*(void *)(DigestInfo + 8) + 8 + *(void *)(DigestInfo + 16)];
  return 1;
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(0xAu);
  cc_clear();
  cc_clear();
  *(void *)c->count = 0LL;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(void *)(DigestInfo + 8));
  return 1;
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo = (void *)CCDigestGetDigestInfo(0xAu);
  if (data && len)
  {
    uint64_t v7 = *(void *)c->count % DigestInfo[2];
    *(void *)c->count += len;
    ccdigest_process(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, v7, len, (char *)data);
  }

  return 1;
}

void *ccdigest_process(void *result, uint64_t a2, uint64_t a3, uint64_t a4, size_t a5, char *__src)
{
  if (a5)
  {
    size_t v7 = a5;
    uint64_t v11 = (uint64_t)result;
    do
    {
      size_t v12 = *(void *)(v11 + 16);
      if (a4 || v7 < v12)
      {
        size_t v15 = v12 - a4;
        if (v7 >= v15) {
          size_t v14 = v15;
        }
        else {
          size_t v14 = v7;
        }
        uint64_t result = memcpy((void *)(a2 + a4), __src, v14);
        a4 += v14;
        if (a4 == *(void *)(v11 + 16))
        {
          uint64_t result = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(a3, 1LL, a2);
          a4 = 0LL;
        }
      }

      else
      {
        size_t v13 = v7 / v12;
        uint64_t result = (void *)(*(uint64_t (**)(uint64_t, size_t, char *))(v11 + 48))(a3, v7 / v12, __src);
        a4 = 0LL;
        size_t v14 = *(void *)(v11 + 16) * v13;
      }

      __src += v14;
      v7 -= v14;
    }

    while (v7);
  }

  return result;
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(0xAu);
  if (md)
  {
    ccdigest_finalize( DigestInfo,  (uint64_t)c->wbuf,  (uint64_t)c->hash,  *(void *)c->count % *(void *)(DigestInfo + 16),  *(void *)c->count);
    for (uint64_t i = 0LL; i != 8; ++i)
      *(_DWORD *)&md[i * 4] = bswap32(c->hash[i]);
  }

  return 1;
}

uint64_t ccdigest_finalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v9 = a4 + 1;
  *(_BYTE *)(a2 + a4) = 0x80;
  unint64_t v10 = *(void *)(a1 + 16);
  uint64_t v11 = -8LL;
  if (v10 == 128) {
    uint64_t v11 = -16LL;
  }
  if (v9 > v11 + v10)
  {
    if (v9 < v10)
    {
      do
        *(_BYTE *)(a2 + v9++) = 0;
      while (v9 < *(void *)(a1 + 16));
    }

    (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 48))(a3, 1LL, a2);
    unint64_t v9 = 0LL;
    unint64_t v10 = *(void *)(a1 + 16);
  }

  for (unint64_t i = v10 - 8; v9 < i; ++v9)
  {
    *(_BYTE *)(a2 + v9) = 0;
    unint64_t i = *(void *)(a1 + 16) - 8LL;
  }

  *(void *)(a2 + i) = bswap64(8 * a5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 48))(a3, 1LL, a2);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(0xCu);
  cc_clear();
  cc_clear();
  c->count[0] = 0LL;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(void *)(DigestInfo + 8));
  return 1;
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  uint64_t DigestInfo = (void *)CCDigestGetDigestInfo(0xCu);
  if (data && len)
  {
    CC_LONG64 v7 = c->count[0] % DigestInfo[2];
    c->count[0] += len;
    ccdigest_process(DigestInfo, (uint64_t)c->wbuf, (uint64_t)c->hash, v7, len, (char *)data);
  }

  return 1;
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(0xCu);
  if (md)
  {
    uint64_t v5 = (void *)DigestInfo;
    ccdigest_finalize( DigestInfo,  (uint64_t)c->wbuf,  (uint64_t)c->hash,  c->count[0] % *(void *)(DigestInfo + 16),  c->count[0]);
    if (*v5 >= 8uLL)
    {
      unint64_t v6 = 0LL;
      CC_LONG64 v7 = md + 3;
      do
      {
        *(void *)(v7 - 3) = bswap64(c->hash[v6++]);
        v7 += 8;
      }

      while (v6 < *v5 >> 3);
    }
  }

  return 1;
}

int CC_SHA224_Init(CC_SHA256_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(9u);
  cc_clear();
  cc_clear();
  *(void *)c->count = 0LL;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(void *)(DigestInfo + 8));
  return 1;
}

int CC_SHA224_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return 1;
}

int CC_SHA224_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  CC_SHA256_Final(mda, c);
  *(_OWORD *)md = *(_OWORD *)mda;
  *(_OWORD *)(md + 12) = *(_OWORD *)&mda[12];
  return 1;
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  uint64_t DigestInfo = CCDigestGetDigestInfo(0xBu);
  cc_clear();
  cc_clear();
  c->count[0] = 0LL;
  c->count[1] = 0LL;
  memcpy(c->hash, *(const void **)(DigestInfo + 40), *(void *)(DigestInfo + 8));
  return 1;
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return 1;
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  CC_SHA512_Final(mda, c);
  __int128 v3 = v6;
  *(_OWORD *)md = *(_OWORD *)mda;
  *((_OWORD *)md + 1) = v3;
  *((_OWORD *)md + 2) = v7;
  return 1;
}

  ;
}

void OUTLINED_FUNCTION_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t CCECCryptorGeneratePair(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  __int128 v6 = ccMallocECCryptor(a1, 1);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6[1] = a1;
    if (ccec_generate_key()
      || (*(_DWORD *)(v7 + 16) = 1, (PublicKeyFromPrivateKey = CCECCryptorGetPublicKeyFromPrivateKey(v7)) == 0LL))
    {
      uint64_t v9 = v7;
    }

    else
    {
      uint64_t v9 = (uint64_t)PublicKeyFromPrivateKey;
      if (ccECpairwiseConsistencyCheck())
      {
        uint64_t result = 0LL;
        *a2 = v9;
        *a3 = v7;
        return result;
      }

      ccECCryptorFree(v7);
    }

    ccECCryptorFree(v9);
  }

  *a3 = 0LL;
  *a2 = 0LL;
  return 4294962992LL;
}

void *ccMallocECCryptor(uint64_t a1, int a2)
{
  cp = (uint64_t *)ccec_get_cp();
  uint64_t v5 = *cp;
  __int128 v6 = malloc(0x18uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[1] = a1;
    if (a2 == 1)
    {
      *((_DWORD *)v6 + 4) = 98;
      uint64_t v8 = 32 * v5;
    }

    else
    {
      if (a2)
      {
LABEL_9:
        free(v7);
        return 0LL;
      }

      *((_DWORD *)v6 + 4) = 97;
      uint64_t v8 = 24 * v5;
    }

    uint64_t v9 = malloc(v8 + 16);
    void *v7 = v9;
    if (v9)
    {
      void *v9 = cp;
      return v7;
    }

    goto LABEL_9;
  }

  return v7;
}

void *CCECCryptorGetPublicKeyFromPrivateKey(uint64_t a1)
{
  uint64_t v2 = ccMallocECCryptor(*(void *)(a1 + 8), 0);
  if (v2)
  {
    cp = (void *)ccec_get_cp();
    memcpy((void *)*v2, *(const void **)a1, 24LL * *cp + 16);
    v2[1] = *(void *)(a1 + 8);
    *((_DWORD *)v2 + 4) = 0;
    if (!ccECpairwiseConsistencyCheck())
    {
      ccECCryptorFree((uint64_t)v2);
      return 0LL;
    }
  }

  return v2;
}

BOOL ccECpairwiseConsistencyCheck()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v2 = v1;
  v8[3] = *MEMORY[0x1895FEE08];
  uint64_t v5 = 4096LL;
  memset(v8, 10, 20);
  char v6 = 0;
  if (!v2) {
    return 0LL;
  }
  else {
    BOOL v4 = v6 == 0;
  }
  return !v4;
}

void ccECCryptorFree(uint64_t a1)
{
  uint64_t v2 = *(void *)ccec_get_cp();
  int v3 = *(_DWORD *)(a1 + 16);
  if (v3 > 96)
  {
    if (v3 != 97)
    {
      if (v3 != 98) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }

    goto LABEL_8;
  }

  if (!v3)
  {
LABEL_8:
    if (24 * v2 == -16) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }

  if (v3 != 1) {
    goto LABEL_11;
  }
LABEL_9:
  if (*(void *)a1)
  {
    cc_clear();
    free(*(void **)a1);
  }

LABEL_11:
  cc_clear();
  free((void *)a1);
}

uint64_t CCECCryptorGetKeyComponents(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 16);
  if (v1 == 1)
  {
    return 0LL;
  }

  if (!v1)
  {
    return 0LL;
  }

  return 4294962996LL;
}

uint64_t CCECCryptorCreateFromData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  *a6 = 0LL;
  uint64_t v7 = ccMallocECCryptor(a1, 0);
  if (!v7) {
    return 4294962994LL;
  }
  uint64_t v8 = (uint64_t)v7;
  uint64_t result = ccec_make_pub();
  if ((_DWORD)result)
  {
    ccECCryptorFree(v8);
    return 4294962992LL;
  }

  else
  {
    *(_DWORD *)(v8 + 16) = 0;
    *a6 = v8;
  }

  return result;
}

uint64_t CCECGetKeyType(uint64_t a1)
{
  if (!a1) {
    return 97LL;
  }
  unsigned int v1 = *(_DWORD *)(a1 + 16);
  if (v1 <= 1) {
    return v1;
  }
  else {
    return 99LL;
  }
}

uint64_t CCECGetKeySize(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 8);
  }
  else {
    return 4294962996LL;
  }
}

uint64_t CCECCryptorImportPublicKey(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return CCECCryptorImportKey(0, a1, a2, 0, a3);
}

uint64_t CCECCryptorImportKey(int a1, uint64_t a2, uint64_t a3, int a4, uint64_t *a5)
{
  if (!a2) {
    return 4294962996LL;
  }
  if (a1 == 2)
  {
    if (a4) {
      return 4294962996LL;
    }
    uint64_t v12 = ccec_compact_import_pub_size();
    size_t v13 = ccMallocECCryptor(v12, 0);
    if (!v13) {
      return 4294962994LL;
    }
    uint64_t v9 = (uint64_t)v13;
    ccec_get_cp();
    uint64_t result = ccec_compact_import_pub();
    if (!(_DWORD)result)
    {
      *(void *)(v9 + 8) = v12;
      *(_DWORD *)(v9 + 16) = 0;
LABEL_23:
      *a5 = v9;
      return result;
    }

    goto LABEL_25;
  }

  if (a1 == 1)
  {
    uint64_t result = 4294962991LL;
LABEL_16:
    *a5 = 0LL;
    return result;
  }

  if (a1)
  {
    uint64_t result = 4294962996LL;
    goto LABEL_16;
  }

  if (a4)
  {
    if (a4 == 1)
    {
      uint64_t v7 = ccec_x963_import_priv_size();
      uint64_t v8 = ccMallocECCryptor(v7, 1);
      if (v8)
      {
        uint64_t v9 = (uint64_t)v8;
        ccec_get_cp();
        if (!ccec_x963_import_priv())
        {
          PublicKeyFromPrivateKey = CCECCryptorGetPublicKeyFromPrivateKey(v9);
          if (PublicKeyFromPrivateKey)
          {
            ccECCryptorFree((uint64_t)PublicKeyFromPrivateKey);
LABEL_22:
            uint64_t result = 0LL;
            *(void *)(v9 + 8) = v7;
            *(_DWORD *)(v9 + 16) = a4;
            goto LABEL_23;
          }
        }

        goto LABEL_25;
      }

      return 4294962994LL;
    }

    return 4294962996LL;
  }

  uint64_t v7 = ccec_x963_import_pub_size();
  size_t v14 = ccMallocECCryptor(v7, 0);
  if (!v14) {
    return 4294962994LL;
  }
  uint64_t v9 = (uint64_t)v14;
  ccec_get_cp();
LABEL_25:
  *a5 = 0LL;
  ccECCryptorFree(v9);
  return 4294962985LL;
}

uint64_t CCECCryptorExportPublicKey(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  if (a1 && a2) {
    return CCECCryptorExportKey(0, a2, a3, 0, a1);
  }
  else {
    return 4294962996LL;
  }
}

uint64_t CCECCryptorExportKey(int a1, uint64_t a2, unint64_t *a3, int a4, uint64_t a5)
{
  uint64_t result = 4294962996LL;
  if (a2 && a5)
  {
    if (a1 == 2)
    {
      if (a4 != 1)
      {
        unint64_t v13 = (unint64_t)(cczp_bitlen() + 7) >> 3;
        unint64_t v14 = *a3;
        *a3 = v13;
        if (v13 <= v14)
        {
          ccec_compact_export_pub();
          return 0LL;
        }

        return 4294962994LL;
      }
    }

    else if (a1 != 1)
    {
      if (a1) {
        return 4294962996LL;
      }
      uint64_t v9 = cczp_bitlen();
      uint64_t v10 = 2LL;
      if (a4 == 1) {
        uint64_t v10 = 3LL;
      }
      unint64_t v11 = ((unint64_t)(v9 + 7) >> 3) * v10;
      unint64_t v12 = v11 + 1;
      if (v11 < *a3)
      {
        *a3 = v12;
        ccec_x963_export();
        return 0LL;
      }

      *a3 = v12;
      return 4294962994LL;
    }

    return 4294962991LL;
  }

  return result;
}

uint64_t CCECCryptorSignHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a4 && a5)
  {
    ccDRBGGetRngState();
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCECCryptorVerifyHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _DWORD *a6)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a4)
  {
    else {
      uint64_t result = 0LL;
    }
    *a6 = 0;
  }

  return result;
}

uint64_t CCECCryptorWrapKey()
{
  return 4294962991LL;
}

uint64_t CCECCryptorUnwrapKey()
{
  return 4294962991LL;
}

uint64_t CCECCryptorComputeSharedSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a3)
  {
    ccrng();
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCECCryptorTwinDiversifyEntropySize(void **a1)
{
  return 2 * MEMORY[0x186DF9890](**a1);
}

uint64_t CCECCryptorTwinDiversifyKey(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (a1 > 1) {
    return 4294962996LL;
  }
  uint64_t v9 = ccMallocECCryptor(*(void *)(a2 + 8), a1);
  if (!v9) {
    return 4294962994LL;
  }
  uint64_t v10 = (uint64_t)v9;
  if (a1) {
    int v11 = ccec_diversify_priv_twin();
  }
  else {
    int v11 = ccec_diversify_pub_twin();
  }
  int v12 = v11;
  if (v11)
  {
    *a5 = 0LL;
    ccECCryptorFree(v10);
    if (v12 == -7) {
      return 4294962996LL;
    }
    else {
      return 4294962985LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *(void *)(v10 + 8) = *(void *)(a2 + 8);
    *(_DWORD *)(v10 + 16) = a1;
    *a5 = v10;
  }

  return result;
}

void *CCECCryptorH2C(int a1)
{
  if (a1 == 2)
  {
    ccec_cp_521();
  }

  else if (a1 == 1)
  {
    MEMORY[0x186DF9878]();
  }

  else
  {
    if (a1) {
      return 0LL;
    }
    MEMORY[0x186DF986C]();
  }

  uint64_t v1 = cczp_bitlen();
  uint64_t v2 = ccMallocECCryptor(v1, 0);
  if (v2 && cch2c())
  {
    ccECCryptorFree((uint64_t)v2);
    return 0LL;
  }

  return v2;
}

void *CCECCryptorGenerateBlindingKeys(uint64_t a1)
{
  if (!ccec_get_cp())
  {
    int v3 = 0LL;
LABEL_8:
    CCECCryptorBlindingKeysRelease(v3);
    return 0LL;
  }

  uint64_t v2 = malloc(0x18uLL);
  int v3 = v2;
  if (!v2) {
    goto LABEL_8;
  }
  *uint64_t v2 = a1;
  v2[2] = 0LL;
  BOOL v4 = ccMallocECCryptor(a1, 1);
  v3[1] = v4;
  if (!v4) {
    goto LABEL_8;
  }
  uint64_t v5 = ccMallocECCryptor(a1, 1);
  v3[2] = v5;
  if (!v5) {
    goto LABEL_8;
  }
  ccDRBGGetRngState();
  return v3;
}

void CCECCryptorBlindingKeysRelease(void *a1)
{
  if (a1)
  {
    ccECCryptorFree(a1[1]);
    ccECCryptorFree(a1[2]);
  }

  free(a1);
}

void *CCECCryptorBlind(uint64_t *a1)
{
  uint64_t v1 = ccMallocECCryptor(*a1, 0);
  if (v1)
  {
    ccDRBGGetRngState();
    if (ccec_blind())
    {
      ccECCryptorFree((uint64_t)v1);
      return 0LL;
    }
  }

  return v1;
}

void *CCECCryptorUnblind(uint64_t *a1)
{
  uint64_t v1 = ccMallocECCryptor(*a1, 0);
  if (v1)
  {
    ccDRBGGetRngState();
    if (ccec_unblind())
    {
      ccECCryptorFree((uint64_t)v1);
      return 0LL;
    }
  }

  return v1;
}

uint64_t CCCryptorGCMAddIV(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  uint64_t v3 = 4294962996LL;
  if (a2 || !a3)
  {
    int v4 = ccgcm_set_iv_legacy();
    if (v4 == -7) {
      unsigned int v5 = -4300;
    }
    else {
      unsigned int v5 = -4308;
    }
    if (v4) {
      return v5;
    }
    else {
      return 0LL;
    }
  }

  return v3;
}

uint64_t CCCryptorGCMSetIV(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  uint64_t result = 4294962996LL;
  if (a2 && a3 >= 0xC)
  {
    int v4 = ccgcm_set_iv();
    if (v4 == -7) {
      unsigned int v5 = -4300;
    }
    else {
      unsigned int v5 = -4308;
    }
    if (v4) {
      return v5;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCCryptorGCMAddAAD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  uint64_t v3 = 4294962996LL;
  if (a2 || !a3)
  {
    int v4 = ccgcm_aad();
    if (v4 == -7) {
      unsigned int v5 = -4300;
    }
    else {
      unsigned int v5 = -4308;
    }
    if (v4) {
      return v5;
    }
    else {
      return 0LL;
    }
  }

  return v3;
}

uint64_t gcm_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a1) {
    return 4294962996LL;
  }
  if (a3) {
    BOOL v4 = a2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  uint64_t result = 4294962996LL;
  if (!v4 && a4)
  {
    int v6 = ccgcm_update();
    if (v6 == -7) {
      unsigned int v7 = -4300;
    }
    else {
      unsigned int v7 = -4308;
    }
    if (v6) {
      return v7;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCCryptorGCMFinal(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  uint64_t result = 4294962996LL;
  if (a2 && a3)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCCryptorGCMFinalize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 4294962996LL;
  }
  uint64_t v4 = 4294962996LL;
  if (a2)
  {
    if ((unint64_t)(a3 - 17) >= 0xFFFFFFFFFFFFFFF7LL)
    {
      unsigned int v5 = *(_DWORD *)(a1 + 72);
      if (v5 <= 1)
      {
        if (v5 == 1) {
          __memcpy_chk();
        }
        else {
          uint64_t v4 = 0LL;
        }
        if (*(_DWORD *)(a1 + 72) == 1) {
          cc_clear();
        }
      }
    }
  }

  return v4;
}

uint64_t CCCryptorGCMReset(uint64_t a1)
{
  uint64_t v1 = 4294962996LL;
  if (a1)
  {
    int v2 = ccgcm_reset();
    if (v2 == -7) {
      unsigned int v3 = -4300;
    }
    else {
      unsigned int v3 = -4308;
    }
    if (v2) {
      return v3;
    }
    else {
      return 0LL;
    }
  }

  return v1;
}

uint64_t CCCryptorGCM( CCOperation a1, CCAlgorithm alg, void *key, size_t keyLength, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  uint64_t v17 = CCCryptorCreateWithMode(a1, 0xBu, alg, 0, 0LL, key, keyLength, 0LL, 0LL, 0, 0, &cryptorRef);
  if (!(_DWORD)v17)
  {
    uint64_t v17 = CCCryptorGCMAddIV((uint64_t)cryptorRef, a5, a6);
    if (!(_DWORD)v17)
    {
      uint64_t v17 = CCCryptorGCMAddAAD((uint64_t)cryptorRef, a7, a8);
      if (!(_DWORD)v17)
      {
        uint64_t v17 = gcm_update((uint64_t)cryptorRef, a9, a10, a11);
        if (!(_DWORD)v17)
        {
          uint64_t v17 = CCCryptorGCMFinal((uint64_t)cryptorRef, a12, a13);
          CCCryptorRelease(cryptorRef);
        }
      }
    }
  }

  return v17;
}

uint64_t CCCryptorGCMOneshotEncrypt( int a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a1) {
    return 4294962996LL;
  }
  uint64_t v12 = 4294962986LL;
  if (a3 <= 0x20 && ((1LL << a3) & 0x101010000LL) != 0)
  {
    uint64_t v12 = 4294962996LL;
    if (a5 >= 0xC && (unint64_t)(a12 - 17) >= 0xFFFFFFFFFFFFFFF7LL && a2 && a4 && a11 && (!a9 || a10))
    {
      ccaes_gcm_encrypt_mode();
      int v14 = ccgcm_one_shot();
      if (v14 == -7) {
        unsigned int v15 = -4300;
      }
      else {
        unsigned int v15 = -4308;
      }
      if (v14) {
        return v15;
      }
      else {
        return 0LL;
      }
    }
  }

  return v12;
}

uint64_t CCCryptorGCMOneshotDecrypt( int a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a1) {
    return 4294962996LL;
  }
  uint64_t result = 4294962986LL;
  if (a3 <= 0x20 && ((1LL << a3) & 0x101010000LL) != 0)
  {
    uint64_t result = 4294962996LL;
    if (a5 >= 0xC && (unint64_t)(a12 - 17) >= 0xFFFFFFFFFFFFFFF7LL && a2 && a4 && a11 && (!a9 || a10))
    {
      __memcpy_chk();
      ccaes_gcm_decrypt_mode();
      int v13 = ccgcm_one_shot();
      if (v13) {
        cc_clear();
      }
      cc_clear();
      if (v13 == -7) {
        unsigned int v14 = -4300;
      }
      else {
        unsigned int v14 = -4308;
      }
      if (v13) {
        return v14;
      }
      else {
        return 0LL;
      }
    }
  }

  return result;
}

void CCHmacInit(CCHmacContext *ctx, CCHmacAlgorithm algorithm, const void *key, size_t keyLength)
{
  if (ctx)
  {
    cc_clear();
    uint64_t v6 = 0LL;
    while (ccconversionTable[v6] != algorithm)
    {
      v6 += 4LL;
      if (v6 == 24)
      {
        *(void *)ctx->ctx = 0LL;
        return;
      }
    }

    uint64_t DigestInfo = CCDigestGetDigestInfo(ccconversionTable[v6 + 1]);
    *(void *)ctx->ctx = DigestInfo;
    if (DigestInfo) {
      cchmac_init();
    }
  }

void CCHmacUpdate(CCHmacContext *ctx, const void *data, size_t dataLength)
{
}

void CCHmacFinal(CCHmacContext *ctx, void *macOut)
{
}

void CCHmacDestroy(void *a1)
{
}

uint64_t CCHmacOutputSizeFromRef(uint64_t a1)
{
  return **(void **)a1;
}

void CCHmac( CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  uint64_t v6 = 0LL;
  while (ccconversionTable[v6] != algorithm)
  {
    v6 += 4LL;
    if (v6 == 24) {
      goto LABEL_6;
    }
  }

  CCDigestGetDigestInfo(ccconversionTable[v6 + 1]);
LABEL_6:
  cchmac();
}

void *CCHmacCreate(unsigned int a1)
{
  int v2 = malloc(0x118uLL);
  if (v2)
  {
    cc_clear();
    uint64_t DigestInfo = CCDigestGetDigestInfo(a1);
    *int v2 = DigestInfo;
    if (DigestInfo)
    {
      cchmac_init();
    }

    else
    {
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

uint64_t CCHmacOneShot(unsigned int a1)
{
  return cchmac();
}

void *CCHmacClone(const void *a1)
{
  int v2 = malloc(0x118uLL);
  unsigned int v3 = v2;
  if (v2) {
    memcpy(v2, a1, 0x118uLL);
  }
  return v3;
}

int CCKeyDerivationPBKDF( CCPBKDFAlgorithm algorithm, const char *password, size_t passwordLen, const uint8_t *salt, size_t saltLen, CCPseudoRandomAlgorithm prf, unsigned int rounds, uint8_t *derivedKey, size_t derivedKeyLen)
{
  int v9 = -4300;
  if (algorithm == 2 && prf - 1 <= 4)
  {
    CCDigestGetDigestInfo(prf + 7);
    if (rounds)
    {
      if (password && derivedKey && derivedKeyLen && (salt || !saltLen))
      {
        else {
          return 0;
        }
      }
    }
  }

  return v9;
}

unsigned int CCCalibratePBKDF( CCPBKDFAlgorithm algorithm, size_t passwordLen, size_t saltLen, CCPseudoRandomAlgorithm prf, size_t derivedKeyLen, uint32_t msec)
{
  unsigned int v6 = -1;
  if (saltLen <= 0x84 && derivedKeyLen)
  {
    if (passwordLen <= 1) {
      size_t v8 = 1LL;
    }
    else {
      size_t v8 = passwordLen;
    }
    if (algorithm == 2)
    {
      uint64_t v12 = (char *)malloc(v8);
      int v13 = v12;
      if (v12)
      {
        memset(v12, 97, v8);
        if (saltLen <= 1) {
          size_t v14 = 1LL;
        }
        else {
          size_t v14 = saltLen;
        }
        unsigned int v15 = (uint8_t *)malloc(v14);
        uint64_t v16 = v15;
        if (v15)
        {
          for (uint64_t i = 0LL; i != v14; ++i)
            v15[i] = i;
          int v18 = (uint8_t *)malloc(derivedKeyLen);
          if (v18)
          {
            unint64_t v19 = 0LL;
            while (1)
            {
              uint64_t v20 = mach_absolute_time();
              if (CCKeyDerivationPBKDF(2u, v13, v8, v16, saltLen, prf, 0x186A0u, v18, derivedKeyLen)) {
                break;
              }
              uint64_t v21 = mach_absolute_time();
              if (v19 <= 3)
              {
                ++v19;
                if (v21 == v20) {
                  continue;
                }
              }

              unsigned int v6 = 10000;
              unint64_t v22 = v21 - v20;
              if (v21 != v20)
              {
                mach_timebase_info(&info);
                LODWORD(v23) = info.numer;
                LODWORD(v24) = info.denom;
                else {
                  unsigned int v6 = 100000 * msec / (unint64_t)((double)v22 * (double)v23 / (double)v24 / 1000000.0);
                }
              }

              goto LABEL_27;
            }
          }
        }

        else
        {
          int v18 = 0LL;
        }
      }

      else
      {
        int v18 = 0LL;
        uint64_t v16 = 0LL;
      }

      unsigned int v6 = -1;
LABEL_27:
      free(v13);
      free(v16);
      free(v18);
    }

    else
    {
      return -1;
    }
  }

  return v6;
}

uint64_t ccDRBGGetRngState()
{
  return ccrng();
}

uint64_t ccDevRandomGetRngState()
{
  return ccrng();
}

uint64_t CCRandomCopyBytes(int a1, void *bytes, size_t count)
{
  return CCRandomGenerateBytes(bytes, count);
}

CCRNGStatus CCRandomGenerateBytes(void *bytes, size_t count)
{
  if (!count) {
    return 0;
  }
  if (!bytes) {
    return -4300;
  }
  uint64_t v4 = (unsigned int (**)(void, size_t, void *))ccrng();
  if ((*v4)(v4, count, bytes)) {
    return -4307;
  }
  else {
    return 0;
  }
}

uint64_t CCRandomUniform()
{
  else {
    return 0LL;
  }
}

uint64_t CCRSACryptorGeneratePair(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  *a4 = 0LL;
  *a3 = 0LL;
  size_t v7 = ccn_write_int_size();
  size_t v8 = malloc(v7);
  if (!v8)
  {
    int v9 = 0LL;
LABEL_10:
    uint64_t v11 = 4294962994LL;
    goto LABEL_8;
  }

  ccn_write_int();
  if (a1 > 0x1000)
  {
    int v9 = 0LL;
    uint64_t v11 = 4294962996LL;
    goto LABEL_8;
  }

  if (!ccDRBGGetRngState())
  {
    int v9 = 0LL;
    uint64_t v11 = 4294962989LL;
    goto LABEL_8;
  }

  int v9 = ccMallocRSACryptor(a1);
  if (!v9) {
    goto LABEL_10;
  }
  if (ccrsa_generate_fips186_key())
  {
    uint64_t v11 = 4294962992LL;
    goto LABEL_8;
  }

  *((_DWORD *)v9 + 2) = 1;
  PublicKeyFromPrivateKey = CCRSACryptorCreatePublicKeyFromPrivateKey(v9);
  if (!PublicKeyFromPrivateKey) {
    goto LABEL_10;
  }
  uint64_t v11 = 0LL;
  *a3 = PublicKeyFromPrivateKey;
  *a4 = v9;
  int v9 = 0LL;
LABEL_8:
  free(v8);
  ccRSACryptorClear(v9);
  ccRSACryptorClear(0LL);
  return v11;
}

void *ccMallocRSACryptor(unint64_t a1)
{
  if (a1 > 0x1000) {
    return 0LL;
  }
  unint64_t v3 = a1 + 63;
  uint64_t result = malloc( (((a1 + 63) >> 1) & 0x7FFFFFFFFFFFFFE0LL)
           - (((a1 + 63) >> 4) & 0xFFFFFFFFFFFFFF8LL)
           + 8 * (((a1 + 63) >> 4) & 0xFFFFFFFFFFFFFF8LL)
           + 192);
  if (result)
  {
    *uint64_t result = a1;
    result[2] = v3 >> 6;
  }

  return result;
}

_DWORD *CCRSACryptorCreatePublicKeyFromPrivateKey(unint64_t *a1)
{
  uint64_t v1 = ccMallocRSACryptor(*a1);
  if (v1)
  {
    ccrsa_ctx_public();
    int inited = ccrsa_init_pub();
    v1[2] = 0;
    if (inited)
    {
      ccRSACryptorClear(v1);
      return 0LL;
    }
  }

  return v1;
}

void ccRSACryptorClear(void *a1)
{
  if (a1)
  {
    cc_clear();
    free(a1);
  }

uint64_t CCRSAGetKeyType(uint64_t a1)
{
  uint64_t result = 99LL;
  if (a1)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 8);
    if (v3 <= 1) {
      return v3;
    }
    else {
      return 99LL;
    }
  }

  return result;
}

uint64_t CCRSAGetKeySize(unsigned int *a1)
{
  if (a1) {
    return *a1;
  }
  else {
    return 4294962996LL;
  }
}

uint64_t CCRSACryptorImport(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a3)
  {
    uint64_t v6 = ccrsa_import_priv_n();
    if (v6)
    {
      uint64_t v7 = v6;
      size_t v8 = ccMallocRSACryptor(v6 << 6);
      if (v8)
      {
        int v9 = v8;
        v8[2] = v7;
        if (!ccrsa_import_priv())
        {
          int v10 = 1;
LABEL_13:
          v9[2] = v10;
          *a3 = v9;
          uint64_t v14 = ccn_bitlen();
          uint64_t result = 0LL;
          *(void *)int v9 = v14;
          return result;
        }

LABEL_10:
        ccRSACryptorClear(v9);
        return 4294962992LL;
      }
    }

    else
    {
      uint64_t v11 = ccrsa_import_pub_n();
      if (!v11) {
        return 4294962992LL;
      }
      uint64_t v12 = v11;
      int v13 = ccMallocRSACryptor(v11 << 6);
      if (v13)
      {
        int v9 = v13;
        *(void *)ccrsa_ctx_public() = v12;
        ccrsa_ctx_public();
        if (!ccrsa_import_pub())
        {
          int v10 = 0;
          goto LABEL_13;
        }

        goto LABEL_10;
      }
    }

    ccRSACryptorClear(0LL);
    *a3 = 0LL;
    return 4294962994LL;
  }

  return result;
}

uint64_t CCRSACryptorExport(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2)
  {
    int v6 = *(_DWORD *)(a1 + 8);
    if (v6 == 1)
    {
      unint64_t v10 = ccrsa_export_priv_size();
      unint64_t v11 = *a3;
      *a3 = v10;
      if (v11 >= v10)
      {
        uint64_t result = ccrsa_export_priv();
        if (!(_DWORD)result) {
          return result;
        }
        return 4294962992LL;
      }
    }

    else
    {
      if (v6) {
        return 4294962996LL;
      }
      uint64_t v7 = ccrsa_ctx_public();
      unint64_t v8 = MEMORY[0x186DF9B9C](v7);
      unint64_t v9 = *a3;
      *a3 = v8;
      if (v9 >= v8)
      {
        ccrsa_ctx_public();
        uint64_t result = ccrsa_export_pub();
        if (!(_DWORD)result) {
          return result;
        }
        return 4294962992LL;
      }
    }

    return 4294962995LL;
  }

  return result;
}

uint64_t CCRSACryptorEncrypt( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 4294962996LL;
  if (a6 && a3 && a1 && a5)
  {
    if (a2 == 1002)
    {
      ccrsa_ctx_public();
      CCDigestGetDigestInfo(a9);
      ccDRBGGetRngState();
      int v11 = ccrsa_encrypt_oaep();
    }

    else
    {
      if (a2 != 1001) {
        return 4294962996LL;
      }
      ccrsa_ctx_public();
      ccDRBGGetRngState();
      int v11 = ccrsa_encrypt_eme_pkcs1v15();
    }

    if (v11) {
      return 4294962992LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCRSACryptorDecrypt( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 4294962996LL;
  if (a1 && a3 && a5 && a6)
  {
    if (a2 == 1002)
    {
      CCDigestGetDigestInfo(a9);
      int v11 = ccrsa_decrypt_oaep();
    }

    else
    {
      if (a2 != 1001) {
        return 0LL;
      }
      int v11 = ccrsa_decrypt_eme_pkcs1v15();
    }

    if (v11) {
      return 4294962992LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t CCRSACryptorCrypt(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t *a5)
{
  unsigned int v5 = 0LL;
  unint64_t v6 = *a5;
  *a5 = 0LL;
  uint64_t v7 = 4294962996LL;
  if (a1 && a2 && a4 && v6)
  {
    unint64_t v10 = (unint64_t)(*(void *)a1 + 7LL) >> 3;
    if (v10 != a3 || v6 < v10)
    {
      unsigned int v5 = 0LL;
LABEL_20:
      uint64_t v7 = 4294962994LL;
      goto LABEL_19;
    }

    unsigned int v5 = malloc(8LL * *(void *)(a1 + 16));
    if (!v5) {
      goto LABEL_20;
    }
    int v13 = *(_DWORD *)(a1 + 8);
    if (v13 == 1)
    {
      int v14 = ccrsa_priv_crypt();
    }

    else
    {
      if (v13) {
        goto LABEL_18;
      }
      ccrsa_ctx_public();
      int v14 = ccrsa_pub_crypt();
    }

    if (!v14)
    {
      ccn_write_uint_padded();
      uint64_t v7 = 0LL;
      *a5 = a3;
      goto LABEL_19;
    }

LABEL_18:
    uint64_t v7 = 4294962996LL;
  }

LABEL_19:
  free(v5);
  return v7;
}

uint64_t CCRSACryptorCreateFromData( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  if (a1 == 1)
  {
    if (a10) {
      BOOL v14 = a4 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14 && a5 != 0 && a6 != 0 && a7 != 0 && a8 != 0 && a9 != 0)
    {
      unint64_t v20 = a9 + a7 + 7;
      if (v20 >= 8)
      {
        uint64_t v21 = ccMallocRSACryptor(8 * (a9 + a7));
        int v13 = v21;
        if (v21)
        {
          v21[2] = v20 >> 3;
          if (!ccrsa_make_priv())
          {
            uint64_t v10 = 0LL;
            *(void *)int v13 = ccn_bitlen();
            void v13[2] = 1;
            goto LABEL_35;
          }

          goto LABEL_38;
        }

        goto LABEL_39;
      }
    }

LABEL_37:
    int v13 = 0LL;
LABEL_38:
    uint64_t v10 = 4294962996LL;
LABEL_40:
    ccRSACryptorClear(v13);
    return v10;
  }

  uint64_t v10 = 4294962996LL;
  if (!a1 && a5 && a3 && a2 && a4 && a10)
  {
    unint64_t v11 = a3 + 7;
    if ((unint64_t)(a3 + 7) >= 8)
    {
      uint64_t v12 = ccMallocRSACryptor(8 * a3);
      int v13 = v12;
      if (v12)
      {
        void v12[2] = v11 >> 3;
        ccrsa_ctx_public();
        if (!ccrsa_make_pub())
        {
          uint64_t v10 = 0LL;
          *(void *)int v13 = ccn_bitlen();
          void v13[2] = 0;
LABEL_35:
          *a10 = v13;
          return v10;
        }

        goto LABEL_38;
      }

LABEL_39:
      uint64_t v10 = 4294962994LL;
      goto LABEL_40;
    }

    goto LABEL_37;
  }

  return v10;
}

uint64_t CCRSACryptorRecoverPrivateKey( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = 4294962996LL;
  if (!a7 || !a1 || !a2 || !a3 || !a4 || !a5 || !a6) {
    goto LABEL_16;
  }
  uint64_t v7 = ccMallocRSACryptor(8 * a2);
  if (!v7)
  {
    uint64_t v8 = 4294962994LL;
LABEL_16:
    ccRSACryptorClear(v7);
    return v8;
  }

  if (!ccDRBGGetRngState())
  {
    uint64_t v8 = 4294962989LL;
    goto LABEL_16;
  }

  if (ccrsa_recover_priv())
  {
    uint64_t v8 = 4294962996LL;
    goto LABEL_16;
  }

  uint64_t v8 = 0LL;
  void *v7 = cczp_bitlen();
  *((_DWORD *)v7 + 2) = 1;
  *a7 = v7;
  return v8;
}

uint64_t CCRSAGetKeyComponents(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 8);
  if (v1 == 1)
  {
    int fullkey_components = ccrsa_get_fullkey_components();
  }

  else
  {
    if (v1) {
      return 4294962996LL;
    }
    ccrsa_ctx_public();
    int fullkey_components = ccrsa_get_pubkey_components();
  }

  if (fullkey_components) {
    return 4294962996LL;
  }
  else {
    return 0LL;
  }
}

uint64_t CCRSAGetCRTComponentsSizes(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t *a4)
{
  if (*(_DWORD *)(a1 + 8) != 1) {
    return 4294962996LL;
  }
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  *a2 = ccn_write_uint_size();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  *a3 = ccn_write_uint_size();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  uint64_t v7 = ccn_write_uint_size();
  uint64_t result = 0LL;
  *a4 = v7;
  return result;
}

uint64_t CCRSAGetCRTComponents( uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  if (*(_DWORD *)(a1 + 8) != 1
    || CCRSAGetCRTComponentsSizes(a1, (uint64_t *)&v16, (uint64_t *)&v15, (uint64_t *)&v14))
  {
    return 4294962996LL;
  }

  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  cczp_prime();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_prime();
  BOOL v10 = (int)ccn_cmpn() < 1 || v16 > a3;
  BOOL v11 = v10 || v15 > a5;
  if (v11 || v14 > a7) {
    return 4294962996LL;
  }
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  ccrsa_ctx_private_zp();
  cczp_n();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccrsa_ctx_private_zp();
  ccn_write_uint();
  return 0LL;
}

uint64_t CCRSACryptorSign( uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  if (!validate_sign_verify_params(a1, a2, a3, a5, a7, a7)) {
    return 4294962996LL;
  }
  if (a2 == 1001)
  {
    int v8 = ccrsa_sign_pkcs1v15();
  }

  else
  {
    ccDRBGGetRngState();
    int v8 = ccrsa_sign_pss();
  }

  if (v8) {
    return 4294962992LL;
  }
  else {
    return 0LL;
  }
}

uint64_t validate_sign_verify_params(uint64_t a1, int a2, uint64_t a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  if (a4 - 13 < 0xFFFFFFFB) {
    return 0LL;
  }
  uint64_t DigestInfo = CCDigestGetDigestInfo(a4);
  if ((a2 & 0xFFFFFFFB) == 0x3E9) {
    uint64_t v13 = DigestInfo;
  }
  else {
    uint64_t v13 = 0LL;
  }
  if (DigestInfo) {
    BOOL v14 = a6 == 0;
  }
  else {
    BOOL v14 = 1;
  }
  if (v14 || a5 == 0 || a3 == 0 || a1 == 0) {
    return 0LL;
  }
  else {
    return v13;
  }
}

uint64_t CCRSACryptorVerify( uint64_t a1, int a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  if (a5 - 13 < 0xFFFFFFFB) {
    return 4294962996LL;
  }
  uint64_t DigestInfo = CCDigestGetDigestInfo(a5);
  uint64_t v13 = DigestInfo;
  if ((a2 & 0xFFFFFFFB) == 0x3E9) {
    uint64_t v14 = DigestInfo;
  }
  else {
    uint64_t v14 = 0LL;
  }
  uint64_t result = 4294962996LL;
  if (a1 && a3 && a7 && v13 && v14)
  {
    ccrsa_ctx_public();
    if (a2 == 1001) {
      int v15 = ccrsa_verify_pkcs1v15_digest();
    }
    else {
      int v15 = ccrsa_verify_pss_digest();
    }
    else {
      int v16 = v15;
    }
    if (v16) {
      return 4294962992LL;
    }
    else {
      return 0LL;
    }
  }

  return result;
}

int CCSymmetricKeyWrap( CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *rawKey, size_t rawKeyLen, uint8_t *wrappedKey, size_t *wrappedKeyLen)
{
  v21[0] = rawKey;
  v21[1] = *MEMORY[0x1895FEE08];
  uint64_t CipherMode = getCipherMode(0LL, 1LL, 0);
  MEMORY[0x1895FE128](CipherMode, v14);
  int v16 = (char *)v21 - v15;
  BOOL v17 = (kekLen & 0xFFFFFFFFFFFFFFF7LL) == 0x10 || kekLen == 32;
  if (!v17
    || !wrappedKeyLen
    || (size_t v18 = *wrappedKeyLen, v18 < ccwrap_wrapped_size())
    || iv && ivLen < 8
    || (*(unsigned int (**)(uint64_t, char *, size_t, const uint8_t *))(CipherMode + 16))( CipherMode,  v16,  kekLen,  kek)
    || ccwrap_auth_encrypt_withiv())
  {
    cc_clear();
    *wrappedKeyLen = 0LL;
    int v19 = -4300;
  }

  else
  {
    int v19 = 0;
  }

  cc_clear();
  return v19;
}

int CCSymmetricKeyUnwrap( CCWrappingAlgorithm algorithm, const uint8_t *iv, const size_t ivLen, const uint8_t *kek, size_t kekLen, const uint8_t *wrappedKey, size_t wrappedKeyLen, uint8_t *rawKey, size_t *rawKeyLen)
{
  v28[0] = rawKey;
  v30[2] = *MEMORY[0x1895FEE08];
  v30[0] = iv;
  v30[1] = &rfc3394_iv_data;
  size_t v29 = 0LL;
  uint64_t CipherMode = getCipherMode(0LL, 1LL, 1);
  MEMORY[0x1895FE128](CipherMode, v14);
  BOOL v17 = (char *)v28 - v16;
  size_t v18 = 0LL;
  BOOL v19 = (kekLen & 0xFFFFFFFFFFFFFFF7LL) == 0x10 || kekLen == 32;
  int v20 = -4300;
  v28[1] = v15;
  if (v19 && rawKeyLen)
  {
    size_t v21 = *rawKeyLen;
    if (v21 < ccwrap_unwrapped_size()
      || iv && ivLen < 8
      || (*(unsigned int (**)(uint64_t, char *, size_t, const uint8_t *))(CipherMode + 16))( CipherMode,  v17,  kekLen,  kek))
    {
      size_t v18 = 0LL;
      int v20 = -4300;
    }

    else
    {
      unint64_t v22 = malloc(*rawKeyLen);
      if (v22)
      {
        unint64_t v23 = v22;
        uint64_t v24 = 0LL;
        char v25 = 1;
        while (1)
        {
          char v26 = v25;
          if (v30[v24])
          {
            size_t v29 = *rawKeyLen;
          }

          char v25 = 0;
          uint64_t v24 = 1LL;
          if ((v26 & 1) == 0)
          {
            cc_clear();
            int v20 = -4304;
            goto LABEL_18;
          }
        }

        memcpy(v28[0], v23, v29);
        int v20 = 0;
LABEL_18:
        cc_clear();
        free(v23);
        size_t v18 = v29;
      }

      else
      {
        size_t v18 = 0LL;
        int v20 = -4302;
      }
    }
  }

  *rawKeyLen = v18;
  cc_clear();
  return v20;
}

size_t CCSymmetricWrappedSize(CCWrappingAlgorithm algorithm, size_t rawKeyLen)
{
  return ccwrap_wrapped_size();
}

size_t CCSymmetricUnwrappedSize(CCWrappingAlgorithm algorithm, size_t wrappedKeyLen)
{
  return ccwrap_unwrapped_size();
}

uint64_t noMode()
{
  return 0LL;
}

void *cc_rc4_crypt_mode()
{
  return &rc4mode;
}

uint64_t ccecb_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccecb_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccecb_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3);
}

uint64_t ccecb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))( a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t cccbc_mode_get_ctx_size(void *a1)
{
  return *a1 + 16LL;
}

uint64_t cccbc_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t cccbc_mode_setup( uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7, char *__dst)
{
  return (*(uint64_t (**)(uint64_t, char *, uint64_t, uint64_t))(a1 + 16))(a1, __dst + 16, a4, a3);
}

uint64_t cccbc_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))( a5 + 16,  a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t cccbc_setiv(uint64_t a1, const void *a2, size_t __n, void *__dst)
{
  return 0LL;
}

uint64_t cccbc_getiv(uint64_t a1, void *__dst, _DWORD *a3, void *__src)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4 <= *a3)
  {
    *a3 = v4;
    memcpy(__dst, __src, v4);
    return 0LL;
  }

  else
  {
    *a3 = v4;
    return 0xFFFFFFFFLL;
  }

uint64_t cccfb_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cccfb_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t cccfb_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t cccfb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))( a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t cccfb8_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t cccfb8_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t cccfb8_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t cccfb8_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))( a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t ccctr_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccctr_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccctr_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3, a2);
}

uint64_t ccctr_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 40))( a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t ccctr_setiv(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (*(void *)(a1 + 16) != a3) {
    return 0xFFFFFFFFLL;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a1, a4, a2);
  return 0LL;
}

uint64_t ccofb_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccofb_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t ccofb_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a1, a8, a4, a3, a2);
}

uint64_t ccofb_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, unint64_t, uint64_t, uint64_t))(a1 + 24))( a5,  a4 / *(void *)(a1 + 8),  a2,  a3);
}

uint64_t ccxts_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccxts_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t ccxts_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3);
}

uint64_t ccxts_mode_encrypt_tweak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[1] = *MEMORY[0x1895FEE08];
  uint64_t v9 = ccxts_context_size();
  MEMORY[0x1895FE128](v9, v10);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 40))(a6, (char *)v14 - v11, a5);
  ccpad_xts_encrypt();
  return v12;
}

uint64_t ccxts_mode_decrypt_tweak(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v14[1] = *MEMORY[0x1895FEE08];
  uint64_t v9 = ccxts_context_size();
  MEMORY[0x1895FE128](v9, v10);
  uint64_t v12 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(a1 + 40))(a6, (char *)v14 - v11, a5);
  ccpad_xts_decrypt();
  return v12;
}

uint64_t ccgcm_mode_get_ctx_size(uint64_t a1)
{
  return *(void *)a1;
}

uint64_t ccgcm_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

uint64_t ccgcm_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a1, a8, a4, a3);
}

uint64_t ccgcm_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a5, a4, a2, a3);
}

uint64_t ccgcm_setiv()
{
  return ccgcm_set_iv_legacy();
}

uint64_t ccccm_mode_get_ctx_size(void *a1)
{
  return *a1 + 176LL;
}

uint64_t ccccm_mode_get_block_size(uint64_t a1)
{
  return *(void *)(a1 + 16);
}

__n128 ccccm_mode_setup( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __n128 *a8)
{
  result.n128_u64[0] = -1LL;
  result.n128_u64[1] = -1LL;
  *a8 = result;
  a8[1] = result;
  return result;
}

uint64_t ccccm_mode_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))( a5 + 160,  a5 + 64,  a4,  a2,  a3);
}

uint64_t ccccm_mode_done(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 8) = *(void *)(a2 + 152);
  return 0LL;
}

uint64_t ccpkcs7_encrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return 0LL;
}

uint64_t ccpkcs7_decrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  *a7 = ccpad_pkcs7_decrypt();
  return 0LL;
}

unint64_t ccpkcs7_padlen(int a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  unint64_t v5 = a4;
  if (!a5)
  {
    if (!a1 && a4) {
      unint64_t v5 = (__PAIR128__(v5, v5 % (*(uint64_t (**)(uint64_t))(a2 + 8))(a3)) - 1) >> 64;
    }
    int v8 = (uint64_t (**)(uint64_t))(a2 + 8);
    goto LABEL_8;
  }

  if (a1)
  {
    int v8 = (uint64_t (**)(uint64_t))(a2 + 8);
    unint64_t v5 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3) + a4;
LABEL_8:
    unint64_t v9 = (*v8)(a3);
    return v5 / v9 * v9;
  }

  return v5;
}

uint64_t ccpkcs7_reserve(int a1, uint64_t a2, uint64_t a3)
{
  if (a1) {
    return 0LL;
  }
  else {
    return (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  }
}

uint64_t ccpkcs7_encrypt_ecb_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return 0LL;
}

uint64_t ccpkcs7_decrypt_ecb_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  *a7 = ccpad_pkcs7_ecb_decrypt();
  return 0LL;
}

uint64_t cccts3_encrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = a5;
  return 0LL;
}

uint64_t cccts3_decrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = a5;
  return 0LL;
}

unint64_t cccts3_padlen(int a1, uint64_t a2, uint64_t a3, unint64_t a4, int a5)
{
  unint64_t v10 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  if (a5)
  {
    if (a1)
    {
      unint64_t v11 = a4 + (*(uint64_t (**)(uint64_t))(a2 + 8))(a3) - 1;
LABEL_7:
      unint64_t v13 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
      return v11 / v13 * v13;
    }
  }

  else if (a1)
  {
    BOOL v12 = a4 > v10;
    unint64_t v11 = a4 - v10;
    if (v12) {
      goto LABEL_7;
    }
    return 0LL;
  }

  return a4;
}

uint64_t cccts3_reserve(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return 2 * (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
}

uint64_t ccnopad_encrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = 0LL;
  if (a5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t ccnopad_decrypt_pad( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  *a7 = 0LL;
  if (a5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

unint64_t ccnopad_padlen(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5 = (*(uint64_t (**)(uint64_t))(a2 + 8))(a3);
  return a4 / v5 * v5;
}

uint64_t ccnopad_reserve()
{
  return 0LL;
}

uint64_t rc4ModeInit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return 0LL;
}

uint64_t rc4crypt()
{
  return 0LL;
}

uint64_t CNCRC(unsigned int a1, _BYTE *a2, uint64_t a3, uint64_t *a4)
{
  Desc = (dispatch_once_t *)getDesc(a1);
  dispatch_once_t v8 = Desc[1];
  if (!v8) {
    return 4294962991LL;
  }
  if (*(_DWORD *)(v8 + 8))
  {
    uint64_t v9 = (*(uint64_t (**)(uint64_t, _BYTE *))(v8 + 40))(a3, a2);
  }

  else if (*(_DWORD *)(v8 + 20))
  {
    uint64_t v9 = crc_reverse_oneshot(Desc, a2, a3);
  }

  else
  {
    uint64_t v9 = crc_normal_oneshot(Desc, a2, a3);
  }

  uint64_t v10 = 0LL;
  *a4 = v9;
  return v10;
}

uint64_t getDesc(unsigned int a1)
{
  if (*(void *)(MEMORY[0x1895FF8E0] + 96LL) == -1LL)
  {
    uint64_t v2 = *(void *)(MEMORY[0x1895FF8E0] + 104LL);
    if (v2) {
      return v2 + 32LL * a1;
    }
  }

  else
  {
    uint64_t v2 = _os_alloc_once();
    if (v2) {
      return v2 + 32LL * a1;
    }
  }

  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_3();
  }
  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_2();
  }
  if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
    CCDigestGetDigestInfo_cold_1();
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

uint64_t CNCRCInit(unsigned int a1, dispatch_once_t ***a2)
{
  unint64_t v4 = (dispatch_once_t **)malloc(0x18uLL);
  if (!v4) {
    return 4294962994LL;
  }
  unint64_t v5 = v4;
  Desc = (dispatch_once_t *)getDesc(a1);
  *unint64_t v5 = Desc;
  dispatch_once_t v7 = Desc[1];
  if (v7)
  {
    v5[2] = 0LL;
    if (*(_DWORD *)(v7 + 8)) {
      uint64_t v8 = (*(uint64_t (**)(void))(v7 + 16))();
    }
    else {
      uint64_t v8 = crc_normal_init(Desc);
    }
    uint64_t v10 = v8;
    uint64_t result = 0LL;
    v5[1] = (dispatch_once_t *)v10;
    *a2 = v5;
  }

  else
  {
    free(v5);
    return 4294962991LL;
  }

  return result;
}

uint64_t CNCRCRelease(void *a1)
{
  return 0LL;
}

uint64_t CNCRCUpdate(uint64_t *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v5 = *a1;
  uint64_t v6 = *(void *)(v5 + 8);
  if (*(_DWORD *)(v6 + 8) == 1)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v6 + 24))(a3, a2, a1[1]);
  }

  else
  {
    unint64_t v8 = a1[1];
    if (*(_DWORD *)(v6 + 20)) {
      uint64_t v7 = crc_reverse_update(v5, a2, a3, v8);
    }
    else {
      uint64_t v7 = crc_normal_update(v5, a2, a3, v8);
    }
  }

  uint64_t v9 = a1[2] + a3;
  a1[1] = v7;
  a1[2] = v9;
  return 0LL;
}

uint64_t CNCRCFinal(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(void *)(v4 + 8);
  if (*(_DWORD *)(v5 + 8) == 1)
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 32))(a1[2], a1[1]);
  }

  else
  {
    uint64_t v7 = a1[1];
    if (*(_DWORD *)(v5 + 20)) {
      uint64_t v6 = crc_reverse_final(v4, v7);
    }
    else {
      uint64_t v6 = crc_normal_final(v4, v7);
    }
  }

  a1[1] = v6;
  *a2 = v6;
  return 0LL;
}

uint64_t CNCRCDumpTable(unsigned int a1)
{
  Desc = (dispatch_once_t *)getDesc(a1);
  dispatch_once_t v2 = Desc[1];
  if (!v2) {
    return 4294962991LL;
  }
  if (*(_DWORD *)(v2 + 8)) {
    return 4294962996LL;
  }
  uint64_t v4 = (uint64_t)Desc;
  crc_normal_init(Desc);
  dump_crc_table(v4);
  return 0LL;
}

BOOL CNCRCWeakTest(unsigned int a1)
{
  Desc = (dispatch_once_t *)getDesc(a1);
  dispatch_once_t v2 = Desc[1];
  if (!v2 || *(_DWORD *)(v2 + 8) == 1) {
    return 0LL;
  }
  uint64_t v4 = Desc;
  if (*(_DWORD *)(v2 + 20)) {
    unint64_t v5 = crc_reverse_oneshot(Desc, "123456789", 9LL);
  }
  else {
    unint64_t v5 = crc_normal_oneshot(Desc, "123456789", 9LL);
  }
  return v5 != *(void *)(v4[1] + 56);
}

uint64_t CNEncoderCreate(unsigned int a1, int a2, void *a3)
{
  *a3 = 0LL;
  if (a1 > 5) {
    return 4294962996LL;
  }
  if (*(void *)(MEMORY[0x1895FF8E0] + 96LL) != -1LL)
  {
    uint64_t v8 = _os_alloc_once();
    if (v8) {
      goto LABEL_9;
    }
LABEL_29:
    if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
      CCDigestGetDigestInfo_cold_3();
    }
    if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
      CCDigestGetDigestInfo_cold_2();
    }
    if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_FAULT)) {
      CCDigestGetDigestInfo_cold_1();
    }
    uint64_t result = _os_crash();
    __break(1u);
    return result;
  }

  uint64_t v8 = *(void *)(MEMORY[0x1895FF8E0] + 104LL);
  if (!v8) {
    goto LABEL_29;
  }
LABEL_9:
  uint64_t v9 = (char *)malloc(0x20uLL);
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = malloc(0x108uLL);
    if (v11)
    {
      BOOL v12 = v11;
      memcpy(v11, (const void *)(v8 + 264LL * a1 + 1952), 0x108uLL);
      *((_DWORD *)v10 + 2) = a2;
      *(void *)uint64_t v10 = v12;
      uint64_t v13 = v12[32];
      if (v13 && (uint64_t v14 = *(void *)(v13 + 24)) != 0) {
        size_t v15 = *(unsigned int *)(v14 + 8);
      }
      else {
        size_t v15 = 0LL;
      }
      uint64_t v16 = v10 + 24;
      BOOL v17 = CNBufferCreate(v15);
      *((void *)v10 + 2) = v17;
      uint64_t v18 = v12[32];
      if (v18 && (uint64_t v19 = *(void *)(v18 + 24)) != 0) {
        size_t v20 = *(unsigned int *)(v19 + 12);
      }
      else {
        size_t v20 = 0LL;
      }
      size_t v21 = CNBufferCreate(v20);
      *uint64_t v16 = v21;
      if (v17 && v21)
      {
        uint64_t result = 0LL;
        *a3 = v10;
        return result;
      }

      if (v17)
      {
        CNBufferRelease((uint64_t)(v10 + 16));
        size_t v21 = (void *)*v16;
      }

      if (v21) {
        CNBufferRelease((uint64_t)(v10 + 24));
      }
    }

    free(v10);
  }

  return 4294962994LL;
}

uint64_t setReverseMap(uint64_t result)
{
  *(void *)&__int128 v1 = 0x8080808080808080LL;
  *((void *)&v1 + 1) = 0x8080808080808080LL;
  *(_OWORD *)(result + 224) = v1;
  *(_OWORD *)(result + 240) = v1;
  *(_OWORD *)(result + 192) = v1;
  *(_OWORD *)(result + 208) = v1;
  *(_OWORD *)(result + 160) = v1;
  *(_OWORD *)(result + 176) = v1;
  *(_OWORD *)(result + 128) = v1;
  *(_OWORD *)(result + 144) = v1;
  *(_OWORD *)(result + 96) = v1;
  *(_OWORD *)(result + 112) = v1;
  *(_OWORD *)(result + 64) = v1;
  *(_OWORD *)(result + 80) = v1;
  *(_OWORD *)(result + 32) = v1;
  *(_OWORD *)(result + 48) = v1;
  *(_OWORD *)uint64_t result = v1;
  *(_OWORD *)(result + 16) = v1;
  uint64_t v2 = *(void *)(result + 256);
  if (*(_BYTE *)(v2 + 32))
  {
    unint64_t v3 = 0LL;
    do
    {
      *(_BYTE *)(result + *(unsigned __int8 *)(*(void *)(v2 + 16) + v3)) = v3;
      ++v3;
    }

    while (v3 < *(unsigned __int8 *)(v2 + 32));
  }

  return result;
}

uint64_t CNEncoderCreateCustom(uint64_t a1, unsigned int a2, uint64_t a3, char a4, int a5, void *a6)
{
  uint64_t result = 4294962996LL;
  if (a2 - 16 <= 0x30 && ((1LL << (a2 - 16)) & 0x1000000010001LL) != 0 && a3 && a6)
  {
    *a6 = 0LL;
    uint64_t v13 = malloc(0x108uLL);
    uint64_t v14 = malloc(0x28uLL);
    size_t v15 = malloc(0x20uLL);
    if (v15)
    {
      uint64_t v16 = v15;
      BOOL v17 = 0LL;
      void v15[2] = 0LL;
      unint64_t v27 = v15 + 2;
      uint64_t v28 = v13;
      v15[3] = 0LL;
      size_t v29 = v15 + 3;
      if (v13)
      {
        uint64_t v18 = 0LL;
        if (v14)
        {
          v14[32] = a2;
          *(void *)uint64_t v14 = a1;
          *((void *)v14 + 2) = a3;
          *((void *)v14 + 3) = (char *)&encoderValue + 20 * (a2 >> 5);
          v14[33] = a4;
          *((_DWORD *)v14 + 2) = 51966;
          v28[32] = v14;
          setReverseMap((uint64_t)v28);
          *(void *)uint64_t v16 = v28;
          v16[2] = a5;
          uint64_t v19 = v28[32];
          if (!v19) {
            goto LABEL_14;
          }
          uint64_t v20 = *(void *)(v19 + 24);
          if (v20) {
            size_t v21 = *(unsigned int *)(v20 + 8);
          }
          else {
LABEL_14:
          }
            size_t v21 = 0LL;
          *((void *)v16 + 2) = CNBufferCreate(v21);
          if (*(void *)v16 && (uint64_t v23 = *(void *)(*(void *)v16 + 256LL)) != 0 && (v24 = *(void *)(v23 + 24)) != 0) {
            size_t v25 = *(unsigned int *)(v24 + 12);
          }
          else {
            size_t v25 = 0LL;
          }
          char v26 = CNBufferCreate(v25);
          BOOL v17 = v26;
          *size_t v29 = v26;
          uint64_t v18 = *v27;
          if (*v27)
          {
            if (v26)
            {
              uint64_t result = 0LL;
              *a6 = v16;
              return result;
            }
          }
        }
      }

      else
      {
        uint64_t v18 = 0LL;
      }

      free(v28);
      free(v14);
      if (v18)
      {
        CNBufferRelease((uint64_t)v27);
        BOOL v17 = (void *)*v29;
      }

      if (v17) {
        CNBufferRelease((uint64_t)v29);
      }
      unint64_t v22 = v16;
    }

    else
    {
      free(v13);
      unint64_t v22 = v14;
    }

    free(v22);
    return 4294962994LL;
  }

  return result;
}

uint64_t CNEncoderRelease(void **a1)
{
  __int128 v1 = *a1;
  *a1 = 0LL;
  if (v1)
  {
    uint64_t v2 = (void *)*v1;
    unint64_t v3 = *(_DWORD **)(*v1 + 256LL);
    if (v3 && v3[2] == 51966) {
      free(v3);
    }
    if (v1[2]) {
      CNBufferRelease((uint64_t)(v1 + 2));
    }
    if (v1[3]) {
      CNBufferRelease((uint64_t)(v1 + 3));
    }
    free(v2);
    free(v1);
  }

  return 0LL;
}

unint64_t CNEncoderGetOutputLength(unint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  int v2 = *(_DWORD *)(result + 8);
  if (v2 != 2)
  {
    if (v2 == 1)
    {
      uint64_t v3 = *(void *)(*(void *)(result + 16) + 8LL) + a2;
      if (v3
        && *(void *)result
        && (uint64_t v4 = *(void *)(*(void *)result + 256LL)) != 0
        && (uint64_t v5 = *(void *)(v4 + 24)) != 0
        && (unint64_t v6 = *(unsigned int *)(v5 + 8), (_DWORD)v6)
        && (uint64_t v7 = *(unsigned int *)(v5 + 12), (_DWORD)v7))
      {
        return (v3 + v6 - 1) / v6 * v7 + 1;
      }

      else
      {
        return 1LL;
      }
    }

    return 0LL;
  }

  uint64_t v8 = *(void *)(*(void *)(result + 24) + 8LL) + a2;
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = *(void *)result;
  if (*(void *)result)
  {
    uint64_t v9 = *(void *)(v9 + 256);
    if (v9)
    {
      uint64_t v9 = *(void *)(v9 + 24);
      if (v9) {
        uint64_t v9 = *(unsigned int *)(v9 + 4);
      }
    }
  }

  return (unint64_t)(v9 * v8 + 8) >> 3;
}

unint64_t encodeLen(uint64_t *a1, uint64_t a2)
{
  unint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *a1;
    if (v4
      && (uint64_t v5 = *(void *)(v4 + 256)) != 0
      && (uint64_t v6 = *(void *)(v5 + 24)) != 0
      && (unint64_t v7 = *(unsigned int *)(v6 + 8), (_DWORD)v7)
      && (uint64_t v8 = *(unsigned int *)(v6 + 12), (_DWORD)v8))
    {
      return (a2 + v7 - 1) / v7 * v8;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

unint64_t decodeLen(uint64_t *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      uint64_t v2 = *(void *)(v2 + 256);
      if (v2)
      {
        uint64_t v2 = *(void *)(v2 + 24);
        if (v2) {
          uint64_t v2 = *(unsigned int *)(v2 + 4);
        }
      }
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return (unint64_t)(v2 * a2 + 8) >> 3;
}

unint64_t CNEncoderGetOutputLengthFromEncoding(unsigned int a1, int a2, uint64_t a3)
{
  if (!CNEncoderCreate(a1, a2, &v12))
  {
    if (a2 == 2)
    {
      if (a3)
      {
        unint64_t v10 = (unint64_t)v12;
        if (v12)
        {
          unint64_t v10 = *v12;
          if (*v12)
          {
            unint64_t v10 = *(void *)(v10 + 256);
            if (v10)
            {
              unint64_t v10 = *(void *)(v10 + 24);
              if (v10) {
                unint64_t v10 = *(unsigned int *)(v10 + 4);
              }
            }
          }
        }

        unint64_t v5 = (v10 * a3 + 8) >> 3;
        goto LABEL_22;
      }
    }

    else if (a2 == 1)
    {
      unint64_t v5 = 1LL;
      if (a3 && v12)
      {
        if (*v12
          && (uint64_t v6 = *(void *)(*v12 + 256)) != 0
          && (uint64_t v7 = *(void *)(v6 + 24)) != 0
          && (unint64_t v8 = *(unsigned int *)(v7 + 8), (_DWORD)v8)
          && (uint64_t v9 = *(unsigned int *)(v7 + 12), (_DWORD)v9))
        {
          unint64_t v5 = (a3 + v8 - 1) / v8 * v9 + 1;
        }

        else
        {
          unint64_t v5 = 1LL;
        }
      }

      goto LABEL_22;
    }

    unint64_t v5 = 0LL;
LABEL_22:
    CNEncoderRelease(&v12);
    return v5;
  }

  return 0LL;
}

uint64_t CNEncoderUpdate(uint64_t a1, char *a2, size_t a3, uint64_t a4, unint64_t *a5)
{
  uint64_t result = 4294962996LL;
  if (a1 && a4 && a5)
  {
    if (a2)
    {
      int v11 = *(_DWORD *)(a1 + 8);
      if (v11 == 2)
      {
        uint64_t v12 = *(void *)(a1 + 24);
        uint64_t v13 = (void (*)(uint64_t, char *, size_t, uint64_t, unint64_t *))deCode;
        uint64_t v14 = (uint64_t (*)(uint64_t, size_t))decodeLen;
        return CNBufferProcessData(v12, a1, a2, a3, a4, a5, v13, v14);
      }

      if (v11 == 1)
      {
        uint64_t v12 = *(void *)(a1 + 16);
        uint64_t v13 = (void (*)(uint64_t, char *, size_t, uint64_t, unint64_t *))enCode;
        uint64_t v14 = (uint64_t (*)(uint64_t, size_t))encodeLen;
        return CNBufferProcessData(v12, a1, a2, a3, a4, a5, v13, v14);
      }
    }

    else if (!a3)
    {
      uint64_t result = 0LL;
      *a5 = 0LL;
    }
  }

  return result;
}

uint64_t enCode(uint64_t *a1, char *a2, uint64_t a3, char *a4, unint64_t *a5)
{
  if (!a1) {
    goto LABEL_15;
  }
  uint64_t v7 = *a1;
  if (!*a1) {
    goto LABEL_15;
  }
  uint64_t v8 = a3;
  uint64_t v10 = *(void *)(v7 + 256);
  if (v10 && (uint64_t v11 = *(void *)(v10 + 24)) != 0)
  {
    int v12 = *(_DWORD *)(v11 + 4);
    if (!a3) {
      goto LABEL_15;
    }
  }

  else
  {
    int v12 = 0;
    if (!a3)
    {
LABEL_15:
      *a5 = 0LL;
      goto LABEL_16;
    }
  }

  uint64_t v13 = *(void *)(v7 + 256);
  if (!v13) {
    goto LABEL_15;
  }
  uint64_t v14 = *(void *)(v13 + 24);
  if (!v14) {
    goto LABEL_15;
  }
  unint64_t v15 = *(unsigned int *)(v14 + 8);
  if (!(_DWORD)v15) {
    goto LABEL_15;
  }
  uint64_t v16 = *(unsigned int *)(v14 + 12);
  if (!(_DWORD)v16) {
    goto LABEL_15;
  }
  unint64_t v17 = (a3 + v15 - 1) / v15 * v16;
  if (!v17) {
    goto LABEL_15;
  }
  unint64_t v18 = *a5;
  *a5 = v17;
  if (v18 < v17) {
    return 0xFFFFFFFFLL;
  }
  cc_clear();
  unint64_t v20 = 0LL;
  do
  {
    unint64_t v21 = v20 / v12;
    int v22 = v20 % v12 - v12 + 8;
    a4[v21] |= *(_BYTE *)(*(void *)(*(void *)(*a1 + 256) + 24LL) + 16LL) & (*a2 >> (v20 % v12 - v12 + 8));
    if (v22 > v12)
    {
      a4[++v21] |= *(_BYTE *)(*(void *)(*(void *)(*a1 + 256) + 24LL) + 16LL) & (*a2 >> (v22 - v12));
      LOBYTE(v22) = v22 - v12;
    }

    char v23 = *a2++;
    a4[v21 + 1] |= *(_BYTE *)(*(void *)(*(void *)(*a1 + 256) + 24LL) + 16LL) & (v23 << (v12 - v22));
    v20 += 8LL;
    --v8;
  }

  while (v8);
  unint64_t v24 = v21 + 2;
  size_t v25 = a4;
  unint64_t v26 = v21 + 2;
  do
  {
    uint64_t v27 = *v25;
    uint64_t v28 = *(void *)(*a1 + 256);
    else {
      char v29 = *(_BYTE *)(*(void *)(v28 + 16) + v27);
    }
    *v25++ = v29;
    --v26;
  }

  while (v26);
  if (v24 < v17)
  {
    uint64_t v30 = v17 - v21 - 2;
    size_t v31 = &a4[v21 + 2];
    do
    {
      *v31++ = *(_BYTE *)(*(void *)(*a1 + 256) + 33LL);
      --v30;
    }

    while (v30);
    unint64_t v24 = v17;
  }

  a4 += v24;
LABEL_16:
  uint64_t result = 0LL;
  *a4 = 0;
  return result;
}

uint64_t deCode(uint64_t a1, unsigned __int8 *a2, uint64_t a3, _BYTE *a4, unint64_t *a5)
{
  if (!a1) {
    return 0LL;
  }
  if (!*(void *)a1) {
    return 0LL;
  }
  uint64_t v6 = *(void *)(*(void *)a1 + 256LL);
  if (!v6) {
    return 0LL;
  }
  uint64_t v9 = a3;
  uint64_t v11 = *(void *)(v6 + 24);
  if (v11)
  {
    int v12 = *(_DWORD *)(v11 + 4);
    if (a3) {
      goto LABEL_6;
    }
LABEL_21:
    *a5 = 0LL;
LABEL_22:
    *a4 = 0;
    return 0LL;
  }

  int v12 = 0;
  if (!a3) {
    goto LABEL_21;
  }
LABEL_6:
  uint64_t v13 = *(void *)(v6 + 24);
  if (v13) {
    uint64_t v13 = *(unsigned int *)(v13 + 4);
  }
  unint64_t v14 = v13 * a3;
  *a5 = (v14 + 8) >> 3;
  if (v14 >= 0xFFFFFFFFFFFFFFF8LL) {
    goto LABEL_22;
  }
  cc_clear();
  unint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  do
  {
    unsigned int v18 = *a2++;
    uint64_t v17 = v18;
    if (v18 != *(unsigned __int8 *)(*(void *)(*(void *)a1 + 256LL) + 33LL))
    {
      unsigned int v19 = *(unsigned __int8 *)(*(void *)a1 + v17);
      int v20 = (v15 & 7) + v12;
      unint64_t v16 = v15 >> 3;
      if (8 - v20 < 0)
      {
        a4[v16] |= v19 >> (v20 - 8);
        int v21 = v19 << (16 - v20);
        unint64_t v22 = v16 + 1;
      }

      else
      {
        int v21 = v19 << (8 - v20);
        unint64_t v22 = v15 >> 3;
      }

      a4[v22] |= v21;
    }

    v15 += v12;
    --v9;
  }

  while (v9);
  if (a4[v16 + 1]) {
    unint64_t v23 = v16 + 2;
  }
  else {
    unint64_t v23 = v16 + 1;
  }
  *a5 = v23;
  return 0LL;
}

uint64_t CNEncoderFinal(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a3)
  {
    int v7 = *(_DWORD *)(a1 + 8);
    if (v7 == 2)
    {
      return CNBufferFlushData( *(unint64_t **)(a1 + 24),  a1,  a2,  a3,  (void (*)(uint64_t, unint64_t, unint64_t, uint64_t, void *))deCode,  (uint64_t (*)(uint64_t))decodeLen);
    }

    else if (v7 == 1)
    {
      uint64_t v8 = *(void *)(*(void *)(a1 + 24) + 8LL);
      if (v8
        && *(void *)a1
        && (uint64_t v9 = *(void *)(*(void *)a1 + 256LL)) != 0
        && (uint64_t v10 = *(void *)(v9 + 24)) != 0
        && (unint64_t v11 = *(unsigned int *)(v10 + 8), (_DWORD)v11)
        && (uint64_t v12 = *(unsigned int *)(v10 + 12), (_DWORD)v12))
      {
        unint64_t v13 = (v8 + v11 - 1) / v11 * v12 + 1;
      }

      else
      {
        unint64_t v13 = 1LL;
      }

      if (v13 <= *a3)
      {
        uint64_t result = CNBufferFlushData( *(unint64_t **)(a1 + 16),  a1,  a2,  a3,  (void (*)(uint64_t, unint64_t, unint64_t, uint64_t, void *))enCode,  (uint64_t (*)(uint64_t))encodeLen);
        if (!(_DWORD)result) {
          *(_BYTE *)(a2 + *a3) = 0;
        }
      }

      else
      {
        return 4294962995LL;
      }
    }
  }

  return result;
}

uint64_t CNEncoderBlocksize(unsigned int a1, void *a2, void *a3)
{
  uint64_t result = 4294962996LL;
  if (a2)
  {
    if (a3)
    {
      uint64_t result = CNEncoderCreate(a1, 1, &v9);
      if (!(_DWORD)result)
      {
        int v7 = v9;
        if (v9 && (int v7 = (void *)*v9) != 0LL && (int v7 = (void *)v7[32]) != 0LL)
        {
          uint64_t v8 = v7[3];
          if (v8) {
            uint64_t v8 = *(unsigned int *)(v8 + 8);
          }
          *a2 = v8;
          int v7 = (void *)v7[3];
          if (v7) {
            int v7 = (void *)*((unsigned int *)v7 + 3);
          }
        }

        else
        {
          *a2 = 0LL;
        }

        *a3 = v7;
        CNEncoderRelease(&v9);
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t CNEncoderBlocksizeFromRef(uint64_t *a1, void *a2, void *a3)
{
  uint64_t result = 4294962996LL;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *a1;
    if (v5 && (uint64_t v5 = *(void *)(v5 + 256)) != 0)
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6) {
        uint64_t v6 = *(unsigned int *)(v6 + 8);
      }
      *a2 = v6;
      uint64_t v5 = *(void *)(v5 + 24);
      if (v5) {
        uint64_t v5 = *(unsigned int *)(v5 + 12);
      }
    }

    else
    {
      *a2 = 0LL;
    }

    uint64_t result = 0LL;
    *a3 = v5;
  }

  return result;
}

uint64_t CNEncode(unsigned int a1, int a2, char *a3, size_t a4, uint64_t a5, unint64_t *a6)
{
  uint64_t result = 4294962996LL;
  if (a3)
  {
    if (a5)
    {
      if (a6)
      {
        uint64_t result = CNEncoderCreate(a1, a2, &v15);
        if (!(_DWORD)result)
        {
          unint64_t v12 = *a6;
          unint64_t v16 = *a6;
          *a6 = 0LL;
          uint64_t result = CNEncoderUpdate((uint64_t)v15, a3, a4, a5, &v16);
          if (!(_DWORD)result)
          {
            unint64_t v13 = v15;
            unint64_t v14 = v16;
            *a6 = v16;
            unint64_t v16 = v12 - v14;
            uint64_t result = CNEncoderFinal((uint64_t)v13, a5 + v14, &v16);
            if (!(_DWORD)result)
            {
              *a6 += v16;
              CNEncoderRelease(&v15);
              return 0LL;
            }
          }
        }
      }
    }
  }

  return result;
}

void *CNBufferCreate(size_t a1)
{
  uint64_t v2 = malloc(0x18uLL);
  uint64_t v3 = v2;
  if (v2)
  {
    *uint64_t v2 = a1;
    v2[1] = 0LL;
    uint64_t v4 = malloc(a1);
    v3[2] = v4;
    if (!v4)
    {
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

uint64_t CNBufferRelease(uint64_t a1)
{
  if (a1)
  {
    __int128 v1 = *(void **)a1;
    uint64_t v2 = *(void **)(*(void *)a1 + 16LL);
    if (v2) {
      free(v2);
    }
    free(v1);
  }

  return 0LL;
}

uint64_t CNBufferProcessData( uint64_t a1, uint64_t a2, char *a3, size_t a4, uint64_t a5, unint64_t *a6, void (*a7)(uint64_t, char *, size_t, uint64_t, unint64_t *), uint64_t (*a8)(uint64_t, size_t))
{
  size_t v11 = a4;
  unint64_t v23 = *a6;
  unint64_t v15 = v23;
  size_t v16 = *(void *)a1;
  if (a8(a2, *(void *)(a1 + 8) + a4) > v23) {
    return 4294962995LL;
  }
  *a6 = 0LL;
  uint64_t v18 = *(void *)(a1 + 8);
  if (v18)
  {
    if (v16 - v18 >= v11) {
      size_t v19 = v11;
    }
    else {
      size_t v19 = v16 - v18;
    }
    memcpy((void *)(*(void *)(a1 + 16) + v18), a3, v19);
    size_t v20 = *(void *)(a1 + 8) + v19;
    *(void *)(a1 + 8) = v20;
    if (v20 < v16) {
      return 0LL;
    }
    unint64_t v22 = a7;
    a7(a2, *(char **)(a1 + 16), v16, a5, &v23);
    v11 -= v19;
    unint64_t v21 = v23;
    a3 += v19;
    a5 += v23;
    *a6 = v23;
    v15 -= v21;
    *(void *)(a1 + 8) = 0LL;
  }

  else
  {
    unint64_t v22 = a7;
  }

  if (v11 == v11 % v16)
  {
    if (v11 > v16) {
      return 4294962993LL;
    }
  }

  else
  {
    unint64_t v23 = v15;
    v22(a2, a3, v11 - v11 % v16, a5, &v23);
    a3 += v11 - v11 % v16;
    *a6 += v23;
    v11 %= v16;
  }

  if (v11)
  {
    memcpy(*(void **)(a1 + 16), a3, v11);
    uint64_t result = 0LL;
    *(void *)(a1 + 8) = v11;
    return result;
  }

  return 0LL;
}

uint64_t CNBufferFlushData( unint64_t *a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, unint64_t, unint64_t, uint64_t, void *), uint64_t (*a6)(uint64_t))
{
  unint64_t v8 = a1[1];
  if (v8)
  {
    if (v8 <= *a1)
    {
      if ((unint64_t)a6(a2) <= *a4)
      {
        a5(a2, a1[2], a1[1], a3, a4);
        return 0LL;
      }

      else
      {
        return 4294962995LL;
      }
    }

    else
    {
      return 4294962993LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *a4 = 0LL;
  }

  return result;
}

BOOL CNBufferEmpty(uint64_t a1)
{
  return *(void *)(a1 + 8) == 0LL;
}

void CCDigestGetDigestInfo_cold_1()
{
  OUTLINED_FUNCTION_1(&dword_1802CC000, MEMORY[0x189600830], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void CCDigestGetDigestInfo_cold_2()
{
  OUTLINED_FUNCTION_1(&dword_1802CC000, MEMORY[0x189600830], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void CCDigestGetDigestInfo_cold_3()
{
  OUTLINED_FUNCTION_1(&dword_1802CC000, MEMORY[0x189600830], v0, "slot=%p once=%li, ptr=%p", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895FEDD8]();
}

uint64_t _os_alloc_once()
{
  return MEMORY[0x189600400]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1895FEE78]();
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t cc_clear()
{
  return MEMORY[0x1895FE160]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1895FE168]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1895FE170]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1895FE178]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1895FE180]();
}

uint64_t ccansikdf_x963()
{
  return MEMORY[0x1895FE188]();
}

uint64_t ccccm_cbcmac()
{
  return MEMORY[0x1895FE190]();
}

uint64_t ccccm_set_iv()
{
  return MEMORY[0x1895FE198]();
}

uint64_t ccchacha20()
{
  return MEMORY[0x1895FE1A0]();
}

uint64_t ccchacha20poly1305_decrypt_oneshot()
{
  return MEMORY[0x1895FE1A8]();
}

uint64_t ccchacha20poly1305_encrypt_oneshot()
{
  return MEMORY[0x1895FE1B0]();
}

uint64_t ccchacha20poly1305_info()
{
  return MEMORY[0x1895FE1B8]();
}

uint64_t ccckg2_contributor_commit()
{
  return MEMORY[0x1895FE1C0]();
}

uint64_t ccckg2_contributor_finish()
{
  return MEMORY[0x1895FE1C8]();
}

uint64_t ccckg2_ctx_cp()
{
  return MEMORY[0x1895FE1D0]();
}

uint64_t ccckg2_init()
{
  return MEMORY[0x1895FE1D8]();
}

uint64_t ccckg2_owner_finish()
{
  return MEMORY[0x1895FE1E0]();
}

uint64_t ccckg2_owner_generate_share()
{
  return MEMORY[0x1895FE1E8]();
}

uint64_t ccckg2_params_p224_sha256_v2()
{
  return MEMORY[0x1895FE1F0]();
}

uint64_t ccckg2_sizeof_commitment()
{
  return MEMORY[0x1895FE1F8]();
}

uint64_t ccckg2_sizeof_ctx()
{
  return MEMORY[0x1895FE200]();
}

uint64_t ccckg2_sizeof_opening()
{
  return MEMORY[0x1895FE208]();
}

uint64_t ccckg2_sizeof_share()
{
  return MEMORY[0x1895FE210]();
}

uint64_t ccckg_contributor_commit()
{
  return MEMORY[0x1895FE218]();
}

uint64_t ccckg_contributor_finish()
{
  return MEMORY[0x1895FE220]();
}

uint64_t ccckg_ctx_cp()
{
  return MEMORY[0x1895FE228]();
}

uint64_t ccckg_init()
{
  return MEMORY[0x1895FE230]();
}

uint64_t ccckg_owner_finish()
{
  return MEMORY[0x1895FE238]();
}

uint64_t ccckg_owner_generate_share()
{
  return MEMORY[0x1895FE240]();
}

uint64_t ccckg_sizeof_commitment()
{
  return MEMORY[0x1895FE248]();
}

uint64_t ccckg_sizeof_ctx()
{
  return MEMORY[0x1895FE250]();
}

uint64_t ccckg_sizeof_opening()
{
  return MEMORY[0x1895FE258]();
}

uint64_t ccckg_sizeof_share()
{
  return MEMORY[0x1895FE260]();
}

uint64_t cccmac_final_generate()
{
  return MEMORY[0x1895FE268]();
}

uint64_t cccmac_init()
{
  return MEMORY[0x1895FE270]();
}

uint64_t cccmac_one_shot_generate()
{
  return MEMORY[0x1895FE278]();
}

uint64_t cccmac_update()
{
  return MEMORY[0x1895FE280]();
}

uint64_t ccdes_cbc_cksum()
{
  return MEMORY[0x1895FE288]();
}

uint64_t ccdes_key_is_weak()
{
  return MEMORY[0x1895FE290]();
}

uint64_t ccdes_key_set_odd_parity()
{
  return MEMORY[0x1895FE298]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1895FE2A0]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1895FE2A8]();
}

uint64_t ccdh_ctx_init()
{
  return MEMORY[0x1895FE2B0]();
}

uint64_t ccdh_ctx_public()
{
  return MEMORY[0x1895FE2B8]();
}

uint64_t ccdh_export_pub()
{
  return MEMORY[0x1895FE2C0]();
}

uint64_t ccdh_export_pub_size()
{
  return MEMORY[0x1895FE2C8]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1895FE2D0]();
}

uint64_t ccdh_gp_rfc3526group05()
{
  return MEMORY[0x1895FE2D8]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1895FE2E0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1895FE2E8]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1895FE2F0]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1895FE2F8]();
}

uint64_t ccec_blind()
{
  return MEMORY[0x1895FE300]();
}

uint64_t ccec_compact_export_pub()
{
  return MEMORY[0x1895FE308]();
}

uint64_t ccec_compact_import_pub()
{
  return MEMORY[0x1895FE310]();
}

uint64_t ccec_compact_import_pub_size()
{
  return MEMORY[0x1895FE318]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1895FE320]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1895FE328]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1895FE330]();
}

uint64_t ccec_diversify_min_entropy_len()
{
  return MEMORY[0x1895FE338]();
}

uint64_t ccec_diversify_priv_twin()
{
  return MEMORY[0x1895FE340]();
}

uint64_t ccec_diversify_pub_twin()
{
  return MEMORY[0x1895FE348]();
}

uint64_t ccec_generate_blinding_keys()
{
  return MEMORY[0x1895FE350]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1895FE358]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x1895FE360]();
}

uint64_t ccec_get_fullkey_components()
{
  return MEMORY[0x1895FE368]();
}

uint64_t ccec_get_pubkey_components()
{
  return MEMORY[0x1895FE370]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1895FE378]();
}

uint64_t ccec_make_pub()
{
  return MEMORY[0x1895FE380]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1895FE388]();
}

uint64_t ccec_unblind()
{
  return MEMORY[0x1895FE390]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1895FE398]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1895FE3A0]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1895FE3A8]();
}

uint64_t ccec_x963_import_priv_size()
{
  return MEMORY[0x1895FE3B0]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1895FE3B8]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1895FE3C0]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1895FE3C8]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1895FE3D0]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1895FE3D8]();
}

uint64_t ccgcm_one_shot()
{
  return MEMORY[0x1895FE3E0]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1895FE3E8]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1895FE3F0]();
}

uint64_t ccgcm_set_iv_legacy()
{
  return MEMORY[0x1895FE3F8]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1895FE400]();
}

uint64_t cch2c()
{
  return MEMORY[0x1895FE408]();
}

uint64_t cchkdf()
{
  return MEMORY[0x1895FE428]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1895FE430]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1895FE438]();
}

uint64_t cchmac()
{
  return MEMORY[0x1895FE440]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1895FE448]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1895FE450]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1895FE458]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1895FE470]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1895FE478]();
}

uint64_t ccn_cmpn()
{
  return MEMORY[0x1895FE480]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1895FE488]();
}

uint64_t ccn_write_int()
{
  return MEMORY[0x1895FE490]();
}

uint64_t ccn_write_int_size()
{
  return MEMORY[0x1895FE498]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1895FE4A0]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1895FE4A8]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1895FE4B0]();
}

uint64_t ccnistkdf_ctr_hmac()
{
  return MEMORY[0x1895FE4B8]();
}

uint64_t ccnistkdf_ctr_hmac_fixed()
{
  return MEMORY[0x1895FE4C0]();
}

uint64_t ccpad_cts3_decrypt()
{
  return MEMORY[0x1895FE4C8]();
}

uint64_t ccpad_cts3_encrypt()
{
  return MEMORY[0x1895FE4D0]();
}

uint64_t ccpad_pkcs7_decrypt()
{
  return MEMORY[0x1895FE4D8]();
}

uint64_t ccpad_pkcs7_ecb_decrypt()
{
  return MEMORY[0x1895FE4E0]();
}

uint64_t ccpad_pkcs7_ecb_encrypt()
{
  return MEMORY[0x1895FE4E8]();
}

uint64_t ccpad_pkcs7_encrypt()
{
  return MEMORY[0x1895FE4F0]();
}

uint64_t ccpad_xts_decrypt()
{
  return MEMORY[0x1895FE4F8]();
}

uint64_t ccpad_xts_encrypt()
{
  return MEMORY[0x1895FE500]();
}

uint64_t ccpbkdf2_hmac()
{
  return MEMORY[0x1895FE508]();
}

uint64_t ccrng()
{
  return MEMORY[0x1895FE520]();
}

uint64_t ccrng_uniform()
{
  return MEMORY[0x1895FE528]();
}

uint64_t ccrsa_ctx_private_zp()
{
  return MEMORY[0x1895FE530]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x1895FE538]();
}

uint64_t ccrsa_decrypt_eme_pkcs1v15()
{
  return MEMORY[0x1895FE540]();
}

uint64_t ccrsa_decrypt_oaep()
{
  return MEMORY[0x1895FE548]();
}

uint64_t ccrsa_encrypt_eme_pkcs1v15()
{
  return MEMORY[0x1895FE550]();
}

uint64_t ccrsa_encrypt_oaep()
{
  return MEMORY[0x1895FE558]();
}

uint64_t ccrsa_export_priv()
{
  return MEMORY[0x1895FE560]();
}

uint64_t ccrsa_export_priv_size()
{
  return MEMORY[0x1895FE568]();
}

uint64_t ccrsa_export_pub()
{
  return MEMORY[0x1895FE570]();
}

uint64_t ccrsa_export_pub_size()
{
  return MEMORY[0x1895FE578]();
}

uint64_t ccrsa_generate_fips186_key()
{
  return MEMORY[0x1895FE580]();
}

uint64_t ccrsa_get_fullkey_components()
{
  return MEMORY[0x1895FE588]();
}

uint64_t ccrsa_get_pubkey_components()
{
  return MEMORY[0x1895FE590]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x1895FE598]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x1895FE5A0]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1895FE5A8]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1895FE5B0]();
}

uint64_t ccrsa_init_pub()
{
  return MEMORY[0x1895FE5B8]();
}

uint64_t ccrsa_make_priv()
{
  return MEMORY[0x1895FE5C0]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x1895FE5C8]();
}

uint64_t ccrsa_priv_crypt()
{
  return MEMORY[0x1895FE5D0]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1895FE5D8]();
}

uint64_t ccrsa_recover_priv()
{
  return MEMORY[0x1895FE5E0]();
}

uint64_t ccrsa_sign_pkcs1v15()
{
  return MEMORY[0x1895FE5E8]();
}

uint64_t ccrsa_sign_pss()
{
  return MEMORY[0x1895FE5F0]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x1895FE5F8]();
}

uint64_t ccrsa_verify_pss_digest()
{
  return MEMORY[0x1895FE600]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1895FE608]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1895FE610]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1895FE618]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1895FE620]();
}

uint64_t ccsha3_224_di()
{
  return MEMORY[0x1895FE628]();
}

uint64_t ccsha3_256_di()
{
  return MEMORY[0x1895FE630]();
}

uint64_t ccsha3_384_di()
{
  return MEMORY[0x1895FE638]();
}

uint64_t ccsha3_512_di()
{
  return MEMORY[0x1895FE640]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1895FE648]();
}

uint64_t ccwrap_auth_decrypt_withiv()
{
  return MEMORY[0x1895FE650]();
}

uint64_t ccwrap_auth_encrypt_withiv()
{
  return MEMORY[0x1895FE658]();
}

uint64_t ccwrap_unwrapped_size()
{
  return MEMORY[0x1895FE660]();
}

uint64_t ccwrap_wrapped_size()
{
  return MEMORY[0x1895FE668]();
}

uint64_t ccxts_context_size()
{
  return MEMORY[0x1895FE670]();
}

uint64_t ccz_add()
{
  return MEMORY[0x1895FE678]();
}

uint64_t ccz_addi()
{
  return MEMORY[0x1895FE680]();
}

uint64_t ccz_bitlen()
{
  return MEMORY[0x1895FE688]();
}

uint64_t ccz_cmp()
{
  return MEMORY[0x1895FE690]();
}

uint64_t ccz_cmpi()
{
  return MEMORY[0x1895FE698]();
}

uint64_t ccz_divmod()
{
  return MEMORY[0x1895FE6A0]();
}

uint64_t ccz_expmod()
{
  return MEMORY[0x1895FE6A8]();
}

uint64_t ccz_free()
{
  return MEMORY[0x1895FE6B0]();
}

uint64_t ccz_init()
{
  return MEMORY[0x1895FE6B8]();
}

uint64_t ccz_is_negative()
{
  return MEMORY[0x1895FE6C0]();
}

uint64_t ccz_is_prime()
{
  return MEMORY[0x1895FE6C8]();
}

uint64_t ccz_is_zero()
{
  return MEMORY[0x1895FE6D0]();
}

uint64_t ccz_lsl()
{
  return MEMORY[0x1895FE6D8]();
}

uint64_t ccz_lsr()
{
  return MEMORY[0x1895FE6E0]();
}

uint64_t ccz_mod()
{
  return MEMORY[0x1895FE6E8]();
}

uint64_t ccz_mul()
{
  return MEMORY[0x1895FE6F0]();
}

uint64_t ccz_muli()
{
  return MEMORY[0x1895FE6F8]();
}

uint64_t ccz_mulmod()
{
  return MEMORY[0x1895FE700]();
}

uint64_t ccz_neg()
{
  return MEMORY[0x1895FE708]();
}

uint64_t ccz_random_bits()
{
  return MEMORY[0x1895FE710]();
}

uint64_t ccz_read_radix()
{
  return MEMORY[0x1895FE718]();
}

uint64_t ccz_read_uint()
{
  return MEMORY[0x1895FE720]();
}

uint64_t ccz_set()
{
  return MEMORY[0x1895FE728]();
}

uint64_t ccz_seti()
{
  return MEMORY[0x1895FE730]();
}

uint64_t ccz_size()
{
  return MEMORY[0x1895FE738]();
}

uint64_t ccz_sub()
{
  return MEMORY[0x1895FE740]();
}

uint64_t ccz_subi()
{
  return MEMORY[0x1895FE748]();
}

uint64_t ccz_trailing_zeros()
{
  return MEMORY[0x1895FE750]();
}

uint64_t ccz_write_int_size()
{
  return MEMORY[0x1895FE758]();
}

uint64_t ccz_write_radix()
{
  return MEMORY[0x1895FE760]();
}

uint64_t ccz_write_radix_size()
{
  return MEMORY[0x1895FE768]();
}

uint64_t ccz_write_uint()
{
  return MEMORY[0x1895FE770]();
}

uint64_t ccz_write_uint_size()
{
  return MEMORY[0x1895FE778]();
}

uint64_t ccz_zero()
{
  return MEMORY[0x1895FE780]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1895FE788]();
}

uint64_t cczp_n()
{
  return MEMORY[0x1895FE790]();
}

uint64_t cczp_prime()
{
  return MEMORY[0x1895FE798]();
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FECB8]();
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FF168](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FF170](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FF178](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FF180](__b, *(void *)&__c, __len);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FF1D8](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1895FF1E0](*(void *)&a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FF1E8](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}