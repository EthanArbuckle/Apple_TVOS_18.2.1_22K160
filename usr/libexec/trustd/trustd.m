double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;
  v7 = 0LL;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }

  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  v6[0] = 0LL;
  v6[1] = 0LL;
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 < 4) {
    return 0xFFFFFFFFLL;
  }
  if (v2 != 4) {
    return 1LL;
  }
  unsigned int v5 = 0;
  if (v5 < a2) {
    return 0xFFFFFFFFLL;
  }
  return v5 > a2;
}

uint64_t DERImg4DecodeManifest(void *a1, unint64_t a2)
{
  return sub_100002B80(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t sub_100002B80(void *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1]) {
      return 0LL;
    }
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }

    uint64_t result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0LL);
    if (!(_DWORD)result)
    {
      unsigned int v9 = 0;
      uint64_t result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result) {
        return result;
      }
      if (v9 > 2) {
        return 2LL;
      }
      return 0LL;
    }
  }

  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(void *a1, unint64_t a2)
{
  return sub_100002B80(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(void *a1, unint64_t a2)
{
  return sub_100002B80(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(void *a1, unint64_t a2)
{
  return sub_100002B80(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeProperty(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 6LL;
  if (a1)
  {
    if (a3)
    {
      unint64_t v14 = 0LL;
      __int128 v15 = 0uLL;
      __int128 v13 = 0uLL;
      uint64_t v11 = 0LL;
      unint64_t v12 = 0LL;
      uint64_t v9 = 0LL;
      unint64_t v10 = 0LL;
      unsigned int v8 = 0;
      uint64_t result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010LL) {
          return 2LL;
        }
        uint64_t result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result) {
          return result;
        }
        if (v14 != 22) {
          return 2LL;
        }
        uint64_t result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result) {
          return result;
        }
        if ((v8 | 0xE000000000000000LL) != a2) {
          return 2LL;
        }
        *(_OWORD *)a3 = v15;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result) {
          return result;
        }
        *(void *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        uint64_t result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1) {
          return 2LL;
        }
        uint64_t v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }

        else if (v11 == *a1 + v7)
        {
          return 0LL;
        }

        else
        {
          return 7LL;
        }
      }
    }
  }

  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unsigned int v8 = 0;
  v9[0] = 0LL;
  v9[2] = 0LL;
  v9[1] = 22LL;
  v9[3] = 24LL;
  __int128 v10 = a3;
  uint64_t result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000LL) == a2)
      {
        uint64_t result = 0LL;
        *(void *)(a4 + 16) = a2 | 0xE000000000000000LL;
        *(void *)(a4 + 40) = a3;
      }

      else
      {
        return 2LL;
      }
    }
  }

  return result;
}

void DERImg4DecodeFindPropertyInSequence( unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  __int128 v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7) {
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
  }
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  v7[0] = 0LL;
  v7[1] = 0LL;
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
}

void sub_100002F38(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  int v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      unint64_t v14 = 0LL;
      v15[0] = 0LL;
      v15[1] = 0LL;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011LL
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        unint64_t v8 = v11 == 2 ? 0x2000000000000010LL : 0x2000000000000011LL;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000LL, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2) {
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          }
          DERImg4DecodeFindProperty( (unint64_t *)&v13[1] + 1,  0xE00000004D414E50LL,  0x2000000000000011uLL,  (unint64_t)v12);
          if (a3)
          {
            if (!v10) {
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  unint64_t v11 = 0LL;
  unint64_t v12 = 0LL;
  v16[0] = 0LL;
  v16[1] = 0LL;
  v14[1] = 0LL;
  unint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  unint64_t v13 = 0LL;
  v14[0] = 0LL;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010LL) {
            return 2LL;
          }
          uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result) {
            return result;
          }
          if (v11)
          {
            uint64_t result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              uint64_t v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1)) {
                return 7LL;
              }
              BOOL v9 = __CFADD__(v12, v8);
              uint64_t v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }

              else
              {
                uint64_t result = 0LL;
                *a4 = v10;
              }

              return result;
            }

            return 2LL;
          }
        }

        return 3LL;
      }
    }
  }

  return result;
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result = 6LL;
  if (a1 && a2)
  {
    if (*(void *)(a1 + 136)) {
      BOOL v4 = *(void *)(a1 + 144) != 0LL;
    }
    else {
      BOOL v4 = 0;
    }
    uint64_t result = 0LL;
    *a2 = v4;
  }

  return result;
}

uint64_t Img4DecodeCopyManifestDigest( uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, void, _OWORD *, size_t, void))
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          int v7 = *a4;
          if (*a4)
          {
            uint64_t v8 = *(void *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7LL;
              }

              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0LL;
              }

              else
              {
                memset(v10, 0, sizeof(v10));
                uint64_t v4 = v7(v8, *(void *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4) {
                  memcpy(__dst, v10, __n);
                }
              }
            }

            else
            {
              return 1LL;
            }
          }
        }
      }
    }
  }

  return v4;
}

uint64_t Img4DecodeSectionExists(void *a1, unsigned int a2, char *a3)
{
  uint64_t v3 = 6LL;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56]) {
        goto LABEL_11;
      }
    }

    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      char v4 = 0;
      goto LABEL_12;
    }

    char v4 = 1;
LABEL_12:
    uint64_t v3 = 0LL;
    *a3 = v4;
  }

  return v3;
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4 = 6LL;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000LL, 1uLL, v8);
      uint64_t v4 = v6;
      if (!(_DWORD)v6) {
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
      }
    }
  }

  return v4;
}

double Img4DecodeGetPropertyFromSection( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  *(_OWORD *)unint64_t v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    char v14 = 0;
    if (!Img4DecodeSectionExists((void *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)unint64_t v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }

      DERImg4DecodeParseManifestProperties(a1, 0LL, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12) {
          return result;
        }
      }
    }

    double result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }

  return result;
}

void Img4DecodeEvaluateCertificateProperties(void *a1)
{
}

void sub_100003430(void *a1, _OWORD *a2)
{
  v21[0] = 0LL;
  v21[1] = 0LL;
  v20[0] = 0LL;
  v20[1] = 0LL;
  uint64_t v19 = 0LL;
  __int128 v18 = 0uLL;
  size_t __n = 0LL;
  uint64_t v17 = 0LL;
  uint64_t v14 = 0LL;
  __s1 = 0LL;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __int128 __s2 = 0uLL;
  __int128 v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011LL)
  {
    while (1)
    {
      uint64_t v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50LL:
LABEL_11:
          __int128 v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((void *)&v13 + 1) != 0x2000000000000011LL
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }

          while (1)
          {
            int v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5) {
              break;
            }
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((void *)&v10 + 1) <= 4uLL && ((1LL << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6) {
                return;
              }
              if (__n != *((void *)&__s2 + 1)) {
                return;
              }
              int v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6) {
                return;
              }
            }

            else if (*((void *)&v10 + 1) != 0xA000000000000000LL)
            {
              if (*((void *)&v10 + 1) != 0xA000000000000001LL || v6 != 1) {
                return;
              }
              int v6 = 0;
            }

            if (v6) {
              return;
            }
          }

          if (v5 != 1) {
            return;
          }
          break;
        case 0xE00000006D616E78LL:
          if (a2) {
            *a2 = v18;
          }
          break;
        case 0xE00000004F424A50LL:
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[9]) {
            goto LABEL_11;
          }
          uint64_t v4 = (__int128 *)(a1 + 9);
          if (a1[10]) {
            goto LABEL_11;
          }
          break;
        default:
          return;
      }
    }
  }

uint64_t Img4DecodeEvaluateDictionaryProperties( unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t v15 = 0LL;
  unint64_t v16 = 0LL;
  unint64_t v14 = 0LL;
  v13[0] = 0LL;
  v13[1] = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v10 = 0LL;
  memset(v8, 0, sizeof(v8));
  __int128 v9 = 0u;
  if (!a3) {
    return 6LL;
  }
  uint64_t result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      uint64_t result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1) {
        return 0LL;
      }
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t result = 2LL;
      if (*((void *)&v9 + 1) > 0x16uLL
        || ((1LL << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000LL) == 0)
      {
        return result;
      }

      if (HIDWORD(v16)) {
        break;
      }
      uint64_t v10 = v15;
      LODWORD(v11) = v16;
      uint64_t v12 = *((void *)&v9 + 1);
      uint64_t result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result) {
        return result;
      }
    }

    return 7LL;
  }

  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000037CC(a1, a2, 1, a3, 1229796429);
}

uint64_t sub_1000037CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result = 6LL;
  if (a1 && a4)
  {
    uint64_t v15 = a1;
    uint64_t v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(void *)(a4 + 448) = 0LL;
    if (a5 == 1229796419)
    {
      unint64_t v10 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeCertificate(&v15, v10);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedCertificate(&v15, v10);
      }
    }

    else
    {
      if (a5 != 1229796429) {
        return 2LL;
      }
      unint64_t v9 = a4 + 232;
      if (a3) {
        uint64_t result = DERImg4DecodeManifest(&v15, v9);
      }
      else {
        uint64_t result = DERImg4DecodeUnsignedManifest(&v15, v9);
      }
    }

    if (!(_DWORD)result)
    {
      if (*(void *)(a4 + 264))
      {
        unint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        uint64_t v14 = 0LL;
        uint64_t v15 = a1;
        uint64_t v16 = a2;
        uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0LL);
        if (!(_DWORD)result)
        {
          *(void *)(a4 + 24) = a1;
          uint64_t v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }

          else
          {
            *(void *)(a4 + 32) = v11;
            if (v11 == a2) {
              return 0LL;
            }
            else {
              return 7LL;
            }
          }
        }
      }

      else
      {
        return 3LL;
      }
    }
  }

  return result;
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[1] = 0LL;
  v5[2] = 0LL;
  v5[0] = a3;
  sub_100003938(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void sub_100003938(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      BOOL v21 = 0;
      if (a4)
      {
        if (*(void *)a3)
        {
          if (*(void *)a4)
          {
            if (*(void *)(a4 + 24))
            {
              if (*(void *)(a4 + 8))
              {
                if (*(void *)(a4 + 16))
                {
                  unint64_t v9 = *(void **)(a4 + 32);
                  if (v9)
                  {
                    if (*(void *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (uint64_t v14 = (const void *)v13(a2, a6)) != 0LL
                        && !memcmp((const void *)(a2 + 328), v14, **(void **)(a4 + 32)))
                      {
                        int v15 = 0;
                      }

                      else
                      {
                        if ((*(unsigned int (**)(void, void, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))( *(void *)(a2 + 296),  *(void *)(a2 + 304),  &v22,  &v23,  a2 + 312,  a2 + 320,  a4,  a6)
                          || **(void **)(a4 + 32) > 0x30uLL
                          || (*(unsigned int (**)(void, void, uint64_t))a4)( *(void *)(a2 + 264),  *(void *)(a2 + 272),  a2 + 376)
                          || (*(unsigned int (**)(uint64_t, uint64_t, void, void, uint64_t, void, uint64_t, uint64_t))(a4 + 16))( v22,  v23,  *(void *)(a2 + 280),  *(void *)(a2 + 288),  a2 + 376,  **(void **)(a4 + 32),  a4,  a6))
                        {
                          return;
                        }

                        int v15 = 1;
                      }

                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16) {
                        return;
                      }
                      if ((a5 & 1) == 0)
                      {
                        uint64_t v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        unint64_t v18 = a1 | 0xE000000000000000LL;
                        uint64_t v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011LL, v24, a6)) {
                            return;
                          }
                        }

                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20) {
                            return;
                          }
                        }

                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }

                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(void **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(void, void, uint64_t, void, uint64_t))a4)( *(void *)(a2 + 8),  *(void *)(a2 + 16),  a2 + 184,  **(void **)(a4 + 32),  a4))
                          {
                            return;
                          }

                          *(_BYTE *)a2 = 1;
                        }

                        if (!Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 56),  0LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6)
                          && (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties( (unint64_t *)(a2 + 72),  1LL,  *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3,  a6);
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

uint64_t sub_100003BE0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  if (a5 != 4096 && a5 != 3072) {
    return 0xFFFFFFFFLL;
  }
  v24[0] = 0LL;
  v24[1] = 0LL;
  unint64_t v9 = (unint64_t)(a5 + 63) >> 6;
  __chkstk_darwin();
  uint64_t v11 = (unint64_t *)((char *)&v21 - v10);
  bzero((char *)&v21 - v10, v10);
  *uint64_t v11 = v9;
  uint64_t v12 = *(unsigned int *)(a1 + 8);
  v23[0] = *(void *)a1;
  v23[1] = v12;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t result = DERParseSequenceToObject( (uint64_t)v23,  (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs,  (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs,  (unint64_t)&v21,  0x20uLL,  0x20uLL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v14 = *((void *)&v21 + 1);
  int v15 = (_BYTE *)v21;
  for (__int128 i = v22; v14; --v14)
  {
    if (*v15) {
      break;
    }
    if (v15 == (_BYTE *)-1LL) {
      __break(0x5513u);
    }
    ++v15;
  }

  if (v14 >= 0xFFFFFFFFFFFFFFF8LL)
  {
    __break(0x5500u);
    return result;
  }

  unint64_t v17 = (v14 + 7) >> 3;
  if (v17 > *v11) {
    return 0xFFFFFFFFLL;
  }
  *uint64_t v11 = v17;
  if (&_ccrsa_verify_pkcs1v15_digest) {
    BOOL v18 = &CCRSA_PKCS1_FAULT_CANARY == 0LL;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18)
  {
    int v20 = ccrsa_verify_pkcs1v15_digest(v11, a2, a3[1], *a3, a4[1], *a4, v24);
    return 0xFFFFFFFFLL;
  }

  LOBYTE(v21) = 0;
  int v19 = ccrsa_verify_pkcs1v15(v11, a2, a3[1], *a3, a4[1], *a4, &v21);
  uint64_t result = 0xFFFFFFFFLL;
  if (!v19 && (_BYTE)v21) {
    return 0LL;
  }
  return result;
}

uint64_t verify_signature_rsa( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  if (!a4) {
    return 0xFFFFFFFFLL;
  }
  if (!a5) {
    return 0xFFFFFFFFLL;
  }
  if (!a6) {
    return 0xFFFFFFFFLL;
  }
  if (!a7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = *(void *)(a7 + 32);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v8 = *(void ***)(v7 + 16);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v9 = *v8;
  if (!v9) {
    return 0xFFFFFFFFLL;
  }
  if (*v9 != a6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = sub_100003BE0((uint64_t)v13, v9[4], v11, v12, 4096LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t verify_chain_img4_v1( unint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215LL;
        if (!sub_1000047EC(v26, (uint64_t)v27, 3u)
          && !sub_100004164((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          uint64_t v15 = 0LL;
          int v16 = (const void **)v32;
          unint64_t v17 = &v30;
          BOOL v18 = (const void **)v32;
          while (1)
          {
            int v19 = &v26[20 * v15];
            size_t v20 = v19[37];
            __int128 v21 = *v18;
            v18 += 20;
            uint64_t result = sub_1000043C8(&v34[v15], v17, a7);
            if ((_DWORD)result) {
              break;
            }
            v17 += 6;
            ++v15;
            int v16 = v18;
            if (v15 == 2)
            {
              __int128 v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }

              v42[0] = 0LL;
              v42[1] = 0LL;
              unint64_t v40 = 0LL;
              v41[0] = 0LL;
              v41[1] = 0LL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011LL)
              {
                v47[0] = 0LL;
                v47[1] = 0LL;
                unint64_t v45 = 0LL;
                v46[0] = 0LL;
                v46[1] = 0LL;
                __int128 v43 = 0u;
                __int128 v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    int v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1) {
                        goto LABEL_14;
                      }
                      return 0xFFFFFFFFLL;
                    }

                    if (v45 != 0x2000000000000010LL
                      || DERParseSequenceContentToObject( v46,  (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs,  (uint64_t)&DERAttributeTypeAndValueItemSpecs,  (unint64_t)&v43,  0x20uLL,  0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }

                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  __int128 v25 = v44;
                  uint64_t result = DEROidCompare((uint64_t)&off_100075958, (uint64_t)&v25);
                  if (!(_DWORD)result) {
                    return 0xFFFFFFFFLL;
                  }
                  *a3 = v35;
                  *a4 = v36;
                  if (!v38) {
                    return 0LL;
                  }
                  uint64_t v23 = v39;
                  if (!v39) {
                    return 0LL;
                  }
                  uint64_t result = 0LL;
                  if (a5)
                  {
                    if (v24)
                    {
                      uint64_t result = 0LL;
                      *a5 = v38;
                      void *v24 = v23;
                    }
                  }

                  return result;
                }
              }

              return 0xFFFFFFFFLL;
            }
          }
        }

        return 0xFFFFFFFFLL;
      }
    }
  }

  return result;
}

uint64_t sub_100004164(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v8 = 0LL;
  uint64_t v15 = result;
  unint64_t v18 = ~result;
  unint64_t v17 = ~a3;
  unint64_t v14 = ~a4;
  unint64_t v13 = ~a5;
  unint64_t v11 = ~a6;
  uint64_t v10 = a2;
  while (1)
  {
    unint64_t v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( v15 + 16 * v8,  (unsigned __int16)DERNumSignedCertCrlItemSpecs,  (uint64_t)&DERSignedCertCrlItemSpecs,  a3 + 48 * v8,  0x30uLL,  0x30uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (160 * v8 > v14) {
      break;
    }
    uint64_t result = DERParseSequenceToObject( a3 + 48 * v8,  (unsigned __int16)DERNumTBSCertItemSpecs,  (uint64_t)&DERTBSCertItemSpecs,  a4 + 160 * v8,  0xA0uLL,  0xA0uLL);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v13) {
      break;
    }
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    char v21 = 0;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    if (DERParseSequenceContentToObject( (unint64_t *)(a4 + 160 * v8 + 96),  (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs,  (uint64_t)&DERSubjPubKeyInfoItemSpecs,  (unint64_t)&v22,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    if (DERParseSequenceContentToObject( (unint64_t *)&v22,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v19,  0x20uLL,  0x20uLL)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (*((void *)&v20 + 1))
    {
      if (*((void *)&v20 + 1) != 2LL || *(_BYTE *)v20 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v20 == -1LL) {
        break;
      }
      if (*(_BYTE *)(v20 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21) {
      return 0xFFFFFFFFLL;
    }
    if (v9 > v11) {
      break;
    }
    uint64_t result = sub_1000048C4(a4 + 160 * v8, (void *)(a6 + 16 * v8));
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (++v8 == v10) {
      return 0LL;
    }
  }

  __break(0x5513u);
  return result;
}

uint64_t sub_1000043C8(void *a1, void *a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  char v10 = 0;
  memset(v13, 0, sizeof(v13));
  unint64_t v8 = 0LL;
  uint64_t v9 = 0LL;
  int v5 = *(void **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(void *)a3
    || !*(void *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject( a2 + 2,  (unsigned __int16)DERNumAlgorithmIdItemSpecs,  (uint64_t)&DERAlgorithmIdItemSpecs,  (unint64_t)&v11,  0x20uLL,  0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }

  if (*((void *)&v12 + 1))
  {
    uint64_t result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((void *)&v12 + 1) != 2LL || *(_BYTE *)v12 != 5) {
        return 0xFFFFFFFFLL;
      }
      if ((void)v12 == -1LL)
      {
        __break(0x5513u);
        return result;
      }

      if (*(_BYTE *)(v12 + 1)) {
        return 0xFFFFFFFFLL;
      }
    }
  }

  if ((*(unsigned int (**)(void, void, _OWORD *, void, uint64_t))a3)( *a2,  a2[1],  v13,  **(void **)(a3 + 32),  a3))
  {
    return 0xFFFFFFFFLL;
  }

  if (v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = (*(uint64_t (**)(void, void, unint64_t, uint64_t, _OWORD *, void, uint64_t, void))(a3 + 16))( *a1,  a1[1],  v8,  v9,  v13,  **(void **)(a3 + 32),  a3,  0LL);
  if ((_DWORD)result) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t sub_10000456C( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, unsigned int (*a8)(void *, _BYTE *, uint64_t))
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1)
  {
    unsigned int v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2LL)) {
          return 0xFFFFFFFFLL;
        }
        uint64_t result = sub_100004164((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }

        else
        {
          char v16 = 1;
          uint64_t v17 = 1LL;
          while ((v16 & 1) != 0)
          {
            unint64_t v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              uint64_t result = sub_1000043C8(v27, &v23[3 * v17], a7);
              char v16 = 0;
              uint64_t v17 = 2LL;
              if (!(_DWORD)result) {
                continue;
              }
            }

            return 0xFFFFFFFFLL;
          }

          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }

          else if (v29 && (uint64_t v19 = v30) != 0)
          {
            uint64_t result = 0LL;
            if (a5 && a6)
            {
              uint64_t result = 0LL;
              *a5 = v29;
              *a6 = v19;
            }
          }

          else
          {
            return 0LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t verify_chain_img4_ddi( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10000456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100004708);
}

uint64_t sub_100004708(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394LL;
  else {
    return 0LL;
  }
}

uint64_t verify_chain_img4_v2( uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7)
{
  return sub_10000456C( a1,  a2,  a3,  a4,  a5,  a6,  a7,  (unsigned int (*)(void *, _BYTE *, uint64_t))sub_100004748);
}

uint64_t sub_100004748(unint64_t *a1, void *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374LL;
  else {
    return 0LL;
  }
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    unint64_t v8 = *(void **)(a5 + 32);
    if (v8 && (uint64_t v9 = (void *)v8[2]) != 0LL && *v8 == a4 && *v9 && *(void *)*v9 == a4)
    {
      ccdigest();
      return 0LL;
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

uint64_t sub_1000047EC(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v18 = 0LL;
  unint64_t v19 = 0LL;
  unint64_t v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  unint64_t v5 = ~a2;
  unsigned int v6 = 1;
  unint64_t v7 = *a1;
  unint64_t v8 = a1[1];
  while (1)
  {
    unint64_t v18 = v7;
    unint64_t v19 = v8;
    uint64_t result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result) {
      return 0xFFFFFFFFLL;
    }
    if (__CFADD__(v16, v17)) {
      break;
    }
    unint64_t v10 = v16 + v17;
    unint64_t v11 = v16 + v17 - v7;
    BOOL v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3) {
      return 0xFFFFFFFFLL;
    }
    unint64_t v14 = (unint64_t *)(a2 + 16LL * v6);
    *unint64_t v14 = v7;
    v14[1] = v11;
    if (v10 < v7) {
      break;
    }
    BOOL v12 = v8 >= v11;
    v8 -= v11;
    if (!v12) {
      goto LABEL_21;
    }
    ++v6;
    unint64_t v7 = v10;
    if (!v8)
    {
      if (v6 == a3) {
        return 0LL;
      }
      return 0xFFFFFFFFLL;
    }
  }

  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t sub_1000048C4(uint64_t a1, void *a2)
{
  v11[0] = 0LL;
  v11[1] = 0LL;
  v9[1] = 0LL;
  uint64_t v10 = 0LL;
  unint64_t v8 = 0LL;
  v9[0] = 0LL;
  __int128 v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(a1 + 152)) {
    return 0LL;
  }
  char v3 = 1;
  while (1)
  {
    int v4 = DERDecodeSeqNext(v11, &v8);
    if (v4) {
      break;
    }
    if (v8 != 0x2000000000000010LL
      || DERParseSequenceContentToObject( v9,  (unsigned __int16)DERNumExtensionItemSpecs,  (uint64_t)&DERExtensionItemSpecs,  (unint64_t)v6,  0x30uLL,  0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }

    char v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      char v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }

  if (v4 != 1 || (v3 & 1) != 0) {
    return 0xFFFFFFFFLL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0LL);
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3LL;
  }
  int v4 = *(_BYTE **)result;
  if (*(void *)result == -1LL) {
    goto LABEL_68;
  }
  unint64_t v5 = &v4[v3];
  unsigned int v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    BOOL v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1LL)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      unint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0LL;
            }
LABEL_34:
            uint64_t result = 0LL;
            *a3 = v15;
            return result;
          }

LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }

        return 3LL;
      }

      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3LL;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3LL;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3LL;
      }
      unint64_t v15 = 0LL;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1LL)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3LL;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0LL;
        }
      }
    }

LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }

  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3LL;
  }
  unint64_t v8 = 0LL;
  uint64_t result = 3LL;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    BOOL v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3LL;
      }
      goto LABEL_20;
    }
  }

  return result;
}

              *(_BYTE *)(v33 + 24) = v32;
              *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v37;
LABEL_69:
              CFRelease(v15);
              return;
            }

            *(void *)&__b[28] = 0xAAAAAAAAAAAAAAAALL;
            *(void *)&v42 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
            __b[26] = v42;
            __b[27] = v42;
            __b[24] = v42;
            __b[25] = v42;
            __b[22] = v42;
            __b[23] = v42;
            __b[20] = v42;
            __b[21] = v42;
            __b[18] = v42;
            __b[19] = v42;
            __b[16] = v42;
            __b[17] = v42;
            __b[14] = v42;
            __b[15] = v42;
            __b[12] = v42;
            __b[13] = v42;
            __b[10] = v42;
            __b[11] = v42;
            __b[8] = v42;
            __b[9] = v42;
            __b[6] = v42;
            __b[7] = v42;
            __b[4] = v42;
            __b[5] = v42;
            __b[2] = v42;
            __b[3] = v42;
            __b[0] = v42;
            __b[1] = v42;
            if (v60 != Length)
            {
              unint64_t v45 = (os_log_s *)sub_10000856C("personalization");
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                __s2.st_dev = 134218240;
                *(void *)&__s2.st_mode = v60;
                WORD2(__s2.st_ino) = 2048;
                *(__darwin_ino64_t *)((char *)&__s2.st_ino + 6) = Length;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "Incorrect amount of data in retrieved manifest. Parsed length: %zu; Have: %zu",
                  (uint8_t *)&__s2,
                  0x16u);
              }

              v37 = 7;
              goto LABEL_68;
            }

            cc_clear(456LL, __b);
            __int128 v43 = CFDataGetBytePtr(v15);
            inited = Img4DecodeInitManifest((uint64_t)v43, v60, (uint64_t)__b);
            if (inited)
            {
              v37 = inited;
              uint64_t v38 = (os_log_s *)sub_10000856C("personalization");
              if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_68;
              }
              __s2.st_dev = 67109120;
              *(_DWORD *)&__s2.st_mode = v37;
              uint64_t v39 = "Failed to initialize manifest: %d";
              goto LABEL_65;
            }

            if (qword_100082CA0 != -1) {
              dispatch_once(&qword_100082CA0, &stru_100076980);
            }
            v46 = (const __CFData *)qword_100082C90;
            if (qword_100082C90) {
              CFRetain((CFTypeRef)qword_100082C90);
            }
            v47.tv_sec = 0xAAAAAAAAAAAAAAAALL;
            v47.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
            *(timespec *)&__s2.st_uid = v47;
            __s2.st_atimespec = v47;
            *(timespec *)&__s2.st_dev = v47;
            v37 = dword_1000827C8;
            if (dword_1000827C8)
            {
              v48 = (os_log_s *)sub_10000856C("personalization");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v62) = v37;
                v49 = "failed to read boot-manifest-hash from device tree: %d";
LABEL_59:
                _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, v49, buf, 8u);
              }
            }

            else
            {
              v50 = qword_100082C98;
              v51 = Img4DecodeCopyManifestDigest( (uint64_t)__b,  &__s2,  qword_100082C98,  (uint64_t (**)(uint64_t, void, _OWORD *, size_t, void))&xmmword_100082C50);
              if (!v51)
              {
                v56 = CFDataGetBytePtr(v46);
                if (!memcmp(v56, &__s2, v50))
                {
                  v37 = 0;
                }

                else
                {
                  v57 = (os_log_s *)sub_10000856C("personalization");
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "manifest read does not match boot-manifest-hash",  buf,  2u);
                  }

                  v37 = 3;
                }

                goto LABEL_60;
              }

              v37 = v51;
              v48 = (os_log_s *)sub_10000856C("personalization");
              if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v62) = v37;
                v49 = "unable to copy digest of manifest: %d";
                goto LABEL_59;
              }
            }

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  *a3 = 0;
  *a2 = 0LL;
  a2[1] = 0LL;
  if (!*(void *)(result + 8)) {
    return 3LL;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }

      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }

      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1LL)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }

        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0LL;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }

        goto LABEL_19;
      }
    }

    return 3LL;
  }

  if (v3) {
    return 3LL;
  }
  else {
    return 0LL;
  }
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2 = **a1;
  if (v2 != 255 && v2 != 0) {
    return 3LL;
  }
  uint64_t result = 0LL;
  *a2 = v2 != 0;
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  unint64_t v4 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = DERParseInteger64(a1, &v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      return 7LL;
    }

    else
    {
      uint64_t result = 0LL;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3LL;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3LL;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7LL;
    }
    goto LABEL_10;
  }

  if (v2 >= 2)
  {
    if (v2 > 9) {
      return 7LL;
    }
  }

LABEL_10:
  unint64_t v5 = 0LL;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }

  while (v2);
  uint64_t result = 0LL;
  *a2 = v5;
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, void *a2, void *a3)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v8, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008LL)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }

      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0LL;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }

      __break(0x5519u);
    }

    else
    {
      return 2LL;
    }
  }

  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2 = *result;
  unint64_t v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }

  else
  {
    unint64_t v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0LL;
    }
  }

  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  v10[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1LL;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0LL);
  if (!(_DWORD)result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0LL;
        *a1 = v9;
        return result;
      }

      __break(0x5519u);
    }

    __break(0x5513u);
  }

  return result;
}

uint64_t DERParseSequenceToObject( uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v12, 0LL);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010LL) {
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERParseSequenceContentToObject( unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v32 = 0LL;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }

  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result) {
        break;
      }
      if (a2 <= v13) {
        return 2LL;
      }
      while (1)
      {
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24LL * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24LL * v13 + 8)) {
          break;
        }
        uint64_t result = 2LL;
        if ((v18 & 1) != 0)
        {
          ++v13;
        }

        return result;
      }

      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24LL * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7LL;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3LL;
            }

            goto LABEL_59;
          }

          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }

          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }

      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }

LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }

      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }

    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0LL;
      }

      else
      {
        BOOL v25 = (__int16 *)(a3 + 24LL * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0LL;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }

        return 5LL;
      }
    }
  }

  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0LL;
    }
    else {
      return 3LL;
    }
  }

  return result;
}

                  v60 = v57;
                  v61 = objc_opt_class(&OBJC_CLASS___NSArray);
                  v62 = objc_opt_isKindOfClass(v60, v61);

                  if ((v62 & 1) != 0)
                  {
                    v60 = v60;
                    v57 = v60;
                  }

                  else
                  {
                    v57 = 0LL;
                  }

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent( unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t DERDecodeSequenceWithBlock(uint64_t a1, uint64_t a2)
{
  uint64_t result = DERDecodeItemPartialBufferGetLength(a1, v4, 0LL);
  if (!(_DWORD)result)
  {
    if (v4[0] - 0x2000000000000012LL >= 0xFFFFFFFFFFFFFFFELL) {
      return DERDecodeSequenceContentWithBlock(&v4[1], a2);
    }
    else {
      return 2LL;
    }
  }

  return result;
}

uint64_t DERDecodeSequenceContentWithBlock(unint64_t *a1, uint64_t a2)
{
  v9[0] = 0LL;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }

  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = DERDecodeSeqNext(v9, v8);
    if ((_DWORD)result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if ((_DWORD)result) {
      break;
    }
    if (v7) {
      return 0LL;
    }
  }

  else {
    return result;
  }
}

unint64_t DEREncodeLengthSized( unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (result >= 0x80)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = result;
    do
    {
      --v5;
      BOOL v7 = v6 > 0xFF;
      v6 >>= 8;
    }

    while (v7);
    unint64_t v8 = -v5;
    uint64_t v9 = 7LL;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        uint64_t v4 = 1 - v5;
        *(_BYTE *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          unint64_t v10 = (_BYTE *)(a2 - v5);
          if (a2 - v5 != -2LL)
          {
            unint64_t v11 = (_BYTE *)(a2 + *a4);
            while (v10 != (_BYTE *)-1LL)
            {
              *v10-- = result;
              BOOL v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4) {
                  goto LABEL_23;
                }
                goto LABEL_19;
              }
            }
          }
        }

        __break(0x5513u);
      }

      goto LABEL_23;
    }

    return v9;
  }

  if (!a3) {
    return 7LL;
  }
  if (*a4)
  {
    *(_BYTE *)a2 = result;
    if (*a4)
    {
      uint64_t v4 = 1LL;
LABEL_19:
      uint64_t v9 = 0LL;
      *a4 = v4;
      return v9;
    }
  }

LABEL_23:
  __break(0x5519u);
  return result;
}

    unint64_t v6 = sqlite3_open(a2, v3 + 1);
    goto LABEL_24;
  }

    uint64_t v29 = v56[5];
    if (v29)
    {
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v9 originalRequest]);
      v31 = (void *)objc_claimAutoreleasedReturnValue([v30 URL]);
      [v14 maxAge];
      unint64_t v33 = v32;
      Current = CFAbsoluteTimeGetCurrent();
      if (qword_100082CB8 != -1)
      {
        v41 = Current;
        dispatch_once(&qword_100082CB8, &stru_100076A00);
        Current = v41;
      }

      if (qword_100082CC0)
      {
        uint64_t v35 = *(dispatch_queue_s **)qword_100082CC0;
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&buf[8] = 0x40000000LL;
        *(void *)&buf[16] = sub_10001C3F0;
        v67 = &unk_100076A20;
        v68 = v29;
        v69 = v31;
        v70 = v33 + Current;
        dispatch_sync(v35, buf);
      }

      uint64_t v36 = (void *)v62[3];
      if (v36) {
        uint64_t v36 = (void *)v36[2];
      }
      v37 = v36;
      v48 = _NSConcreteStackBlock;
      v49 = 3221225472LL;
      v50 = sub_10001D820;
      v51 = &unk_100076B90;
      uint64_t v38 = &v52;
      v52 = v14;
      v53 = &v61;
      v54 = &v55;
      p_block = &v48;
    }

    else
    {
      if (!-[CAIssuerDelegate fetchNext:context:](self, "fetchNext:context:", v8, v14))
      {
LABEL_36:
        -[TrustURLSessionDelegate removeTask:]( self,  "removeTask:",  v12,  *(void *)&v41,  block,  v43,  v44,  v45,  v46,  v47,  v48,  v49,  v50,  v51,  v52,  v53,  v54,  v55);
        _Block_object_dispose(&v55, 8);

        goto LABEL_37;
      }

      unint64_t v40 = (void *)v62[3];
      if (v40) {
        unint64_t v40 = (void *)v40[2];
      }
      v37 = v40;
      block = _NSConcreteStackBlock;
      __int128 v43 = 3221225472LL;
      __int128 v44 = sub_10001D85C;
      unint64_t v45 = &unk_100076BB8;
      uint64_t v38 = &v46;
      v46 = v14;
      v47 = &v61;
      p_block = &block;
    }

    dispatch_async(v37, p_block);

    goto LABEL_36;
  }

  __int128 v20 = sub_10000856C("http");
  uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v12;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "failed to find context for %@", buf, 0xCu);
  }

LABEL_38:
}

unint64_t DERLengthOfItem(unint64_t result, unint64_t a2)
{
  unint64_t v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v3 = 1LL;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      BOOL v4 = v2 > 0x7F;
      v2 >>= 7;
    }

    while (v4);
  }

  uint64_t v5 = 1LL;
  if (a2 >= 0x80)
  {
    unint64_t v6 = a2;
    do
    {
      ++v5;
      BOOL v4 = v6 > 0xFF;
      v6 >>= 8;
    }

    while (v4);
  }

  BOOL v7 = __CFADD__(v3, v5);
  uint64_t v8 = v3 + v5;
  if (v7 || (uint64_t result = v8 + a2, __CFADD__(v8, a2))) {
    __break(0x5500u);
  }
  return result;
}

uint64_t sub_10000562C(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(_BYTE *)a2 = HIBYTE(result) & 0xE0 | result;
      unint64_t v8 = 1LL;
      goto LABEL_17;
    }

    return 7LL;
  }

  unint64_t v4 = 0LL;
  unint64_t v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    BOOL v6 = v5 > 0x7F;
    v5 >>= 7;
  }

  while (v6);
  unint64_t v7 = *a3;
  if (v4 >= *a3) {
    return 7LL;
  }
  if (v4 >= ~a2 || (*(_BYTE *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2LL))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }

  if (a2 + v4 >= a2)
  {
    unint64_t v8 = v4 + 1;
    *(_BYTE *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      uint64_t v9 = (_BYTE *)(a2 + v4 - 1);
      unint64_t v10 = (_BYTE *)(a2 + v7);
      while (v9 != (_BYTE *)-2LL)
      {
        unint64_t v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11) {
          goto LABEL_17;
        }
      }

      goto LABEL_20;
    }

LABEL_17:
    if (v8 <= *a3)
    {
      uint64_t result = 0LL;
      *a3 = v8;
      return result;
    }
  }
}

  objc_autoreleasePoolPop(v2);
  return v15;
}

          if ([v11 isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
          {
            uint64_t v36 = 0LL;
            unint64_t v22 = v36;
            v40[0] = v12;
            v39[0] = @"assetVersion";
            v39[1] = @"systemVersion";
            uint64_t v23 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100013E48(@"MobileAssetContentVersion"));
            unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            v40[1] = v24;
            v39[2] = @"installedVersion";
            BOOL v25 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_100016AB8(0LL));
            unint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
            v40[2] = v26;
            __int16 v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v40,  v39,  3LL));

            uint64_t v35 = v22;
            sub_100016B50(v11, &v35, v28, NSOSStatusErrorDomain, v29, v27, v30, v31, (uint64_t)v11);
            unint64_t v15 = v35;
          }

          else
          {
            v34 = 0LL;
            sub_1000159FC( v11,  &v34,  3,  NSOSStatusErrorDomain,  -25299,  @"skipping asset %@ because we already have _ContentVersion %@ (or newer)",  v20,  v21,  (uint64_t)v11);
            unint64_t v15 = v34;
          }

          unint64_t v16 = 0LL;
          goto LABEL_23;
        }

        cf = 0LL;
        CFRelease(v19);
      }

  __int16 v18 = (const void *)v23[3];
  if (v18)
  {
    v23[3] = 0LL;
    CFRelease(v18);
  }

  unint64_t v19 = (const void *)v27[3];
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  a4(a3, v19);
  if (v19) {
    CFRelease(v19);
  }
  return 1LL;
}

LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t DEREncodeSequenceFromObject( uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  unint64_t v8 = ~a6;
  if (~a6 < a7) {
    goto LABEL_73;
  }
  unint64_t v11 = *a8;
  unint64_t v44 = a7;
  unint64_t v45 = 0LL;
  if (v11 < a7) {
    goto LABEL_74;
  }
  uint64_t result = sub_10000562C(a1, a6, &v44);
  if ((_DWORD)result) {
    return result;
  }
  if (v44 > v8) {
    goto LABEL_73;
  }
  unint64_t v17 = a7 - v44;
  if (a7 < v44) {
    goto LABEL_75;
  }
  unint64_t v18 = a6 + a7;
  unint64_t v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    uint64_t result = sub_100005AF0(a2, a3, a4, a5, &v45);
    if ((_DWORD)result) {
      return result;
    }
    unint64_t v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19) {
      goto LABEL_74;
    }
    unint64_t v42 = a6 + v11;
    unint64_t v20 = v45;
    uint64_t result = DEREncodeLengthSized(v45, v19, v17, (uint64_t *)&v44);
    if ((_DWORD)result) {
      return result;
    }
    unint64_t v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }

    unint64_t v22 = v17 - v44;
    if (v17 >= v44)
    {
      uint64_t v23 = (_BYTE *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if (a4)
        {
          unint64_t v24 = 0LL;
          unint64_t v25 = a2 + a3;
          uint64_t v41 = 24LL * a4;
          while (1)
          {
            if (v24 > ~a5) {
              goto LABEL_73;
            }
            unint64_t v26 = *(void *)(a5 + v24);
            if (v26 > ~a2) {
              goto LABEL_73;
            }
            __int16 v27 = (const void **)(a2 + v26);
            __int16 v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0) {
              break;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
            if (v27[1])
            {
LABEL_29:
              unint64_t v44 = v22;
              uint64_t result = sub_10000562C(*(void *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if ((_DWORD)result) {
                return result;
              }
              if (__CFADD__(v23, v44)) {
                goto LABEL_73;
              }
              unint64_t v30 = v22 - v44;
              if (v22 < v44) {
                goto LABEL_75;
              }
              unint64_t v31 = (unint64_t)v27[1];
              unint64_t v45 = v31;
              char v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                char v32 = 0;
                unint64_t v45 = ++v31;
              }

              unint64_t v33 = (unint64_t)&v23[v44];
              unint64_t v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33) {
                goto LABEL_74;
              }
              uint64_t result = DEREncodeLengthSized(v31, v33, v30, (uint64_t *)&v44);
              if ((_DWORD)result) {
                return result;
              }
              unint64_t v34 = v44;
              if (__CFADD__(v33, v44)) {
                goto LABEL_73;
              }
              unint64_t v35 = v30 - v44;
              if (v30 < v44) {
                goto LABEL_75;
              }
              uint64_t v23 = (_BYTE *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (_BYTE *)-1LL) {
                  goto LABEL_73;
                }
                *uint64_t v23 = 0;
                --v35;
                if (v30 == v34) {
                  goto LABEL_75;
                }
                ++v23;
              }

              size_t v36 = (size_t)v27[1];
              uint64_t result = (uint64_t)memmove(v23, *v27, v36);
              unint64_t v21 = v42;
              unint64_t v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37)) {
                goto LABEL_73;
              }
              unint64_t v22 = v35 - v37;
              if (v35 < v37) {
                goto LABEL_75;
              }
              goto LABEL_69;
            }

LABEL_70:
            v24 += 24LL;
            if (v41 == v24) {
              goto LABEL_71;
            }
          }

          size_t v39 = (size_t)v27[1];
          uint64_t result = (uint64_t)memmove(v23, *v27, v39);
          unint64_t v21 = v42;
          unint64_t v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37)) {
            goto LABEL_73;
          }
          BOOL v40 = v22 >= v37;
          v22 -= v37;
          if (!v40) {
            goto LABEL_75;
          }
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }

LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          uint64_t result = 0LL;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }

LABEL_74:
        __break(0x5519u);
      }

      goto LABEL_73;
    }

LABEL_75:
    __break(0x5515u);
    return result;
  }

  return 7LL;
}

unint64_t sub_100005AF0(unint64_t result, unint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5 = 0LL;
  if (!a3)
  {
LABEL_38:
    uint64_t result = 0LL;
LABEL_40:
    *a5 = v5;
    return result;
  }

  unsigned int v6 = 0;
  unint64_t v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    unint64_t v8 = *(void *)(a4 + 24LL * v6);
    BOOL v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      uint64_t v5 = 0LL;
      uint64_t result = 7LL;
      goto LABEL_40;
    }

    if (v8 > ~result) {
      break;
    }
    unint64_t v10 = (unsigned __int8 **)(result + v8);
    __int16 v11 = *(_WORD *)(a4 + 24LL * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if ((v11 & 1) != 0)
      {
        if (!v10[1]) {
          goto LABEL_37;
        }
      }

      unint64_t v13 = *(void *)(a4 + 24LL * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v14 = 1LL;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          BOOL v9 = v13 > 0x7F;
          v13 >>= 7;
        }

        while (v9);
      }

      BOOL v15 = __CFADD__(v5, v14);
      uint64_t v16 = v5 + v14;
      if (v15) {
        goto LABEL_42;
      }
      unint64_t v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24LL * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }

LABEL_25:
        uint64_t v18 = 1LL;
      }

      else
      {
LABEL_24:
        if (v17 < 0x80) {
          goto LABEL_25;
        }
        uint64_t v18 = 1LL;
        unint64_t v21 = v17;
        do
        {
          ++v18;
          BOOL v9 = v21 > 0xFF;
          v21 >>= 8;
        }

        while (v9);
      }

      BOOL v15 = __CFADD__(v16, v18);
      uint64_t v22 = v16 + v18;
      if (v15) {
        goto LABEL_42;
      }
      BOOL v15 = __CFADD__(v22, v17);
      uint64_t v5 = v22 + v17;
      if (v15) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }

    unint64_t v20 = v10[1];
    BOOL v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15) {
      goto LABEL_42;
    }
LABEL_37:
    if (++v6 == a3) {
      goto LABEL_38;
    }
  }

  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

unint64_t DERLengthOfEncodedSequenceFromObject( uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, unint64_t *a6)
{
  unint64_t v17 = 0LL;
  unint64_t result = sub_100005AF0(a2, a3, a4, a5, &v17);
  if (!(_DWORD)result)
  {
    unint64_t v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 1LL;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        BOOL v11 = v9 > 0x7F;
        v9 >>= 7;
      }

      while (v11);
    }

    uint64_t v12 = 1LL;
    if (v17 >= 0x80)
    {
      unint64_t v13 = v17;
      do
      {
        ++v12;
        BOOL v11 = v13 > 0xFF;
        v13 >>= 8;
      }

      while (v11);
    }

    BOOL v14 = __CFADD__(v10, v12);
    uint64_t v15 = v10 + v12;
    if (v14 || (BOOL v14 = __CFADD__(v15, v17), v16 = v15 + v17, v14))
    {
      __break(0x5500u);
    }

    else
    {
      unint64_t result = 0LL;
      *a6 = v16;
    }
  }

  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0LL;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }

  return result;
}

void start()
{
  v0 = getenv("WAIT4DEBUGGER");
  if (v0 && !strcasecmp("YES", v0))
  {
    v1 = (os_log_s *)sub_10000856C("SecCritical");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "SIGSTOPing self, awaiting debugger", buf, 2u);
    }

    pid_t v2 = getpid();
    kill(v2, 17);
    unint64_t v3 = (os_log_s *)sub_10000856C("SecCritical");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v6 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Again, for good luck (or bad debuggers)",  v6,  2u);
    }

    pid_t v4 = getpid();
    kill(v4, 17);
  }

  sub_100005E8C();
  sub_10001A388();
  sub_1000097F8();
  sub_1000243AC();
  uint64_t v5 = (dispatch_queue_s *)sub_1000113A4();
  sub_100005F00(v5);
  sub_100005F58();
  dispatch_main();
}

size_t sub_100005E8C()
{
  return confstr(65537, v1, 0x400uLL);
}

void sub_100005F00(dispatch_queue_s *a1)
{
  qword_100082AA8 = (uint64_t)dispatch_source_create( (dispatch_source_type_t)&_dispatch_source_type_signal,  0xFuLL,  0LL,  a1);
  dispatch_source_set_event_handler((dispatch_source_t)qword_100082AA8, &stru_100075A48);
  dispatch_activate((dispatch_object_t)qword_100082AA8);
}

void sub_100005F58()
{
  mach_service = xpc_connection_create_mach_service("com.apple.trustd", 0LL, 1uLL);
  if (!mach_service)
  {
    pid_t v2 = (os_log_s *)sub_10000856C("SecCritical");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      pid_t v4 = "com.apple.trustd";
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "security failed to register xpc listener for %s, exiting",  (uint8_t *)&v3,  0xCu);
    }

    abort();
  }

  v1 = mach_service;
  xpc_connection_set_event_handler(mach_service, &stru_100075A88);
  xpc_connection_activate(v1);
}

void sub_100006028(id a1, void *a2)
{
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_connection)
  {
    int v3 = (dispatch_queue_s *)sub_1000113A4();
    xpc_connection_set_target_queue((xpc_connection_t)a2, v3);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000LL;
    handler[2] = sub_1000060B8;
    handler[3] = &unk_100075AA8;
    handler[4] = a2;
    xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
    xpc_connection_activate((xpc_connection_t)a2);
  }

void sub_1000060B8(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    pid_t v4 = *(_xpc_connection_s **)(a1 + 32);
    xpc_type_t type = xpc_get_type(object);
    uint64_t v64 = 0LL;
    CFTypeRef cf = 0LL;
    *(_OWORD *)v62 = 0u;
    __int128 v63 = 0u;
    *(_OWORD *)v61 = 0u;
    LOBYTE(v62[0]) = 1;
    uid_t euid = xpc_connection_get_euid(v4);
    HIDWORD(v62[0]) = euid;
    BYTE4(v63) = 0;
    if (type == (xpc_type_t)&_xpc_type_dictionary)
    {
      int v13 = euid;
      xpc_object_t reply = xpc_dictionary_create_reply(object);
      uint64_t uint64 = xpc_dictionary_get_uint64(object, "operation");
      memset(&bytes, 0, sizeof(bytes));
      objecta = v4;
      xpc_connection_get_audit_token(v4, &bytes);
      audit_token_t buf = bytes;
      SecTaskRef v14 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &buf);
      v61[0] = v14;
      CFDataRef v52 = CFDataCreate(kCFAllocatorDefault, (const UInt8 *)&bytes, 32LL);
      BOOL v15 = sub_1000083C0(v14, @"com.apple.developer.on-demand-install-capable");
      unint64_t v16 = (const __CFArray *)sub_1000082DC(v14, @"keychain-access-groups");
      unint64_t v17 = (const __CFArray *)sub_1000082DC(v14, @"com.apple.security.application-groups");
      uint64_t v18 = sub_10000837C(v14);
      unint64_t v19 = (const __CFArray *)sub_1000082DC(v14, @"com.apple.developer.associated-application-identifier");
      Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
      if (v16)
      {
        v80.length = CFArrayGetCount(v16);
        v80.location = 0LL;
        CFArrayAppendArray(Mutable, v16, v80);
      }

      if (v19)
      {
        v81.length = CFArrayGetCount(v19);
        v81.location = 0LL;
        CFArrayAppendArray(Mutable, v19, v81);
      }

      if (v18) {
        CFArrayAppendValue(Mutable, v18);
      }
      if (v17)
      {
        if (v15)
        {
          unint64_t v21 = (os_log_s *)sub_10000856C("entitlements");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            buf.val[0] = 138412290;
            *(void *)&buf.val[1] = @"com.apple.security.application-groups";
            _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Ignoring %@ because client is API-restricted",  (uint8_t *)&buf,  0xCu);
          }
        }

        else
        {
          v82.length = CFArrayGetCount(v17);
          v82.location = 0LL;
          CFArrayAppendArray(Mutable, v17, v82);
        }
      }

      v79.length = CFArrayGetCount(Mutable);
      v79.location = 0LL;
      CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(Mutable, v79, kSecAttrAccessGroupToken);
      if (FirstIndexOfValue != -1)
      {
        CFIndex v23 = FirstIndexOfValue;
        if (_os_feature_enabled_impl("CryptoTokenKit", "UseTokens"))
        {
          CFArrayRemoveValueAtIndex(Mutable, v23);
          CFArrayAppendValue(Mutable, kSecAttrAccessGroupToken);
        }

        else
        {
          unint64_t v24 = (os_log_s *)sub_10000856C("SecWarning");
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.val[0]) = 0;
            _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "Keychain access group com.apple.token ignored, feature not available",  (uint8_t *)&buf,  2u);
          }

          CFArrayRemoveValueAtIndex(Mutable, v23);
        }
      }

      if (v19) {
        CFRelease(v19);
      }
      pid_t v4 = objecta;
      if (v18) {
        CFRelease(v18);
      }
      reply_with_format = reply;
      if (v16) {
        CFRelease(v16);
      }
      CFDataRef v12 = v52;
      if (v17) {
        CFRelease(v17);
      }
      v61[1] = Mutable;
      unint64_t v25 = (os_log_s *)sub_10000856C("serverxpc");
      unsigned int v26 = uint64;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        else {
          __int16 v28 = *(&off_100079C10 + uint64);
        }
        buf.val[0] = 138412802;
        *(void *)&buf.val[1] = v14;
        LOWORD(buf.val[3]) = 2112;
        *(void *)((char *)&buf.val[3] + 2) = v28;
        HIWORD(buf.val[5]) = 2048;
        *(void *)&buf.val[6] = uint64;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "XPC [%@] operation: %@ (%llu)",  (uint8_t *)&buf,  0x20u);
      }

      switch(uint64)
      {
        case 0x64uLL:
          __int16 v27 = (uint64_t *)&off_100075B48;
          goto LABEL_93;
        case 0x65uLL:
          __int16 v27 = (uint64_t *)&off_100075B58;
          goto LABEL_93;
        case 0x66uLL:
          __int16 v27 = &qword_100075B78;
          goto LABEL_93;
        case 0x67uLL:
        case 0x68uLL:
        case 0x69uLL:
        case 0x6AuLL:
        case 0x6BuLL:
        case 0x6CuLL:
        case 0x6DuLL:
        case 0x6EuLL:
        case 0x6FuLL:
        case 0x70uLL:
        case 0x71uLL:
        case 0x72uLL:
        case 0x83uLL:
        case 0x84uLL:
          goto LABEL_98;
        case 0x73uLL:
          __int16 v27 = &qword_100075BF8;
          goto LABEL_93;
        case 0x74uLL:
          __int16 v27 = (uint64_t *)&off_100075C08;
          goto LABEL_93;
        case 0x75uLL:
          __int16 v27 = (uint64_t *)&off_100075C18;
          goto LABEL_93;
        case 0x76uLL:
          __int16 v27 = &qword_100075C28;
          goto LABEL_93;
        case 0x77uLL:
          __int16 v27 = &qword_100075C38;
          goto LABEL_93;
        case 0x78uLL:
          __int16 v27 = &qword_100075C48;
          goto LABEL_93;
        case 0x79uLL:
          __int16 v27 = (uint64_t *)&off_100075C58;
          goto LABEL_93;
        case 0x7AuLL:
          __int16 v27 = (uint64_t *)&off_100075C68;
          goto LABEL_93;
        case 0x7BuLL:
          __int16 v27 = (uint64_t *)&off_100075C78;
          goto LABEL_93;
        case 0x7CuLL:
          __int16 v27 = &qword_100075C88;
          goto LABEL_93;
        case 0x7DuLL:
          __int16 v27 = (uint64_t *)&off_100075C98;
          goto LABEL_93;
        case 0x7EuLL:
          __int16 v27 = (uint64_t *)&off_100075CA8;
          goto LABEL_93;
        case 0x7FuLL:
          *(void *)v66 = 0LL;
          CFTypeRef v58 = 0LL;
          CFTypeRef v59 = 0LL;
          if (!sub_100059BC4(object, "domain", v66, (__CFString **)&cf)) {
            goto LABEL_136;
          }
          if (sub_100059928(object, "auth", &v59, (__CFString **)&cf))
          {
            if (sub_100059928(object, "settings", &v58, (__CFString **)&cf))
            {
              xpc_retain(objecta);
              if (v14) {
                CFRetain(v14);
              }
              if (v52) {
                CFRetain(v52);
              }
              CFTypeRef v29 = v58;
              *(void *)buf.val = _NSConcreteStackBlock;
              *(void *)&buf.val[2] = 0x40000000LL;
              *(void *)&buf.val[4] = sub_1000070A0;
              *(void *)&buf.val[6] = &unk_100075AE8;
              xpc_object_t v72 = reply;
              v73 = objecta;
              __int128 v74 = *(_OWORD *)v61;
              __int128 v75 = *(_OWORD *)v62;
              __int128 v76 = v63;
              uint64_t v77 = v64;
              CFDataRef v78 = v52;
              sub_10004FCFC(v13, v52, *(const void **)v66, v59, v58, &buf);
              reply_with_format = 0LL;
            }

            else
            {
              CFTypeRef v29 = v58;
            }

            if (v29) {
              CFRelease(v29);
            }
          }

          CFTypeRef v46 = v59;
          if (!v59) {
            goto LABEL_136;
          }
          goto LABEL_135;
        case 0x80uLL:
          __int16 v27 = &qword_100075CC8;
          goto LABEL_93;
        case 0x81uLL:
          __int16 v27 = (uint64_t *)&off_100075CD8;
          goto LABEL_93;
        case 0x82uLL:
          __int16 v27 = &qword_100075CE8;
          goto LABEL_93;
        case 0x85uLL:
          *(void *)v66 = 0LL;
          CFTypeRef v59 = 0LL;
          if (!sub_100006E10( 0x85u,  v14,  @"com.apple.private.security.storage.trustd-private",  (__CFString **)&cf)) {
            goto LABEL_98;
          }
          if (sub_100059AC0(object, v66, (__CFString **)&cf))
          {
            if (sub_1000599F4(object, "cfdict", &v59, (__CFString **)&cf))
            {
              xpc_retain(objecta);
              if (v14) {
                CFRetain(v14);
              }
              CFTypeRef v30 = v59;
              *(void *)buf.val = _NSConcreteStackBlock;
              *(void *)&buf.val[2] = 0x40000000LL;
              *(void *)&buf.val[4] = sub_10000715C;
              *(void *)&buf.val[6] = &unk_100075B08;
              xpc_object_t v72 = reply;
              v73 = objecta;
              __int128 v74 = *(_OWORD *)v61;
              __int128 v75 = *(_OWORD *)v62;
              __int128 v76 = v63;
              uint64_t v77 = v64;
              sub_10002B31C(v13, *(const void **)v66, v59, &buf);
              reply_with_format = 0LL;
            }

            else
            {
              CFTypeRef v30 = v59;
            }

            if (v30)
            {
              CFTypeRef v46 = v30;
LABEL_135:
              CFRelease(v46);
            }
          }

LABEL_136:
          CFTypeRef v47 = *(CFTypeRef *)v66;
          if (*(void *)v66) {
LABEL_167:
          }
            CFRelease(v47);
          goto LABEL_98;
        case 0x86uLL:
          __int16 v27 = &qword_100075B98;
          goto LABEL_93;
        case 0x87uLL:
          __int16 v27 = &qword_100075B88;
LABEL_93:
          unint64_t v31 = (void (*)(uint64_t, void *, void *, __CFString **))v27[1];
          if (!v31) {
            goto LABEL_98;
          }
          if (!*v27) {
            goto LABEL_97;
          }
          if (sub_100006E10(uint64, v14, (const __CFString *)*v27, (__CFString **)&cf))
          {
            unint64_t v31 = (void (*)(uint64_t, void *, void *, __CFString **))v27[1];
LABEL_97:
            v31((uint64_t)v61, object, reply, (__CFString **)&cf);
          }

LABEL_98:
          if (!cf)
          {
            xpc_object_t v10 = 0LL;
            break;
          }

          if (SecErrorGetOSStatus(cf) == -25330)
          {
            char v32 = (os_log_s *)sub_10000856C("SecWarning");
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_113;
            }
            if (v26 > 0x87) {
              unint64_t v33 = @"Unknown xpc operation";
            }
            else {
              unint64_t v33 = *(&off_100079C10 + v26);
            }
            *(_DWORD *)v66 = 138412802;
            *(CFTypeRef *)&v66[4] = v61[0];
            __int16 v67 = 2112;
            v68 = v33;
            __int16 v69 = 2112;
            CFTypeRef v70 = cf;
            unint64_t v35 = "Authentication is needed %@ %@ %@";
          }

          else
          {
            char v32 = (os_log_s *)sub_10000856C("SecError");
            if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_113;
            }
            if (v26 > 0x87) {
              unint64_t v34 = @"Unknown xpc operation";
            }
            else {
              unint64_t v34 = *(&off_100079C10 + v26);
            }
            *(_DWORD *)v66 = 138412802;
            *(CFTypeRef *)&v66[4] = v61[0];
            __int16 v67 = 2112;
            v68 = v34;
            __int16 v69 = 2112;
            CFTypeRef v70 = cf;
            unint64_t v35 = "%@ %@ %@";
          }

          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v35, v66, 0x20u);
LABEL_113:
          xpc_object_t v10 = sub_1000101A0((__CFError *)cf);
          if (reply_with_format) {
            xpc_dictionary_set_value(reply_with_format, "error", v10);
          }
          break;
        default:
          switch(uint64)
          {
            case 0x13uLL:
              __int16 v27 = &qword_100075BA8;
              goto LABEL_93;
            case 0x14uLL:
              __int16 v27 = &qword_100075BB8;
              goto LABEL_93;
            case 0x15uLL:
            case 0x16uLL:
            case 0x18uLL:
              goto LABEL_98;
            case 0x17uLL:
              __int16 v27 = &qword_100075BC8;
              goto LABEL_93;
            case 0x19uLL:
              __int16 v27 = &qword_100075BD8;
              goto LABEL_93;
            case 0x1AuLL:
              __int16 v27 = &qword_100075BE8;
              goto LABEL_93;
            default:
              __int16 v27 = &qword_100075B28;
              switch(uint64)
              {
                case 4uLL:
                  goto LABEL_93;
                case 5uLL:
                  __int16 v27 = (uint64_t *)&off_100075B38;
                  goto LABEL_93;
                case 6uLL:
                  __int16 v27 = (uint64_t *)&off_100075B68;
                  goto LABEL_93;
                case 8uLL:
                  *(void *)v66 = 0LL;
                  CFTypeRef v58 = 0LL;
                  CFTypeRef v59 = 0LL;
                  CFTypeRef v56 = 0LL;
                  CFTypeRef v57 = 0LL;
                  BOOL v36 = xpc_dictionary_get_BOOL(object, "anchorsOnly");
                  BOOL v51 = xpc_dictionary_get_BOOL(object, "keychainsAllowed");
                  uint64_t v37 = xpc_dictionary_get_uint64(object, "attribution");
                  xpc_object_t value = xpc_dictionary_get_value(object, "certificates");
                  if (!value)
                  {
                    sub_10000DE88(-108, (__CFString **)&cf, @"no certs for key %s", "certificates");
                    goto LABEL_158;
                  }

                  int v39 = v36;
                  uint64_t v40 = SecCertificateXPCArrayCopyArray(value, &cf);
                  if (!v40) {
                    goto LABEL_158;
                  }
                  uint64_t v41 = (const __CFArray *)v40;
                  xpc_object_t v42 = xpc_dictionary_get_value(object, "anchors");
                  if (v42)
                  {
                    __int128 v43 = (const __CFArray *)SecCertificateXPCArrayCopyArray(v42, &cf);
                    if (!v43) {
                      goto LABEL_157;
                    }
                  }

                  else
                  {
                    __int128 v43 = 0LL;
                  }

                  xpc_object_t v44 = xpc_dictionary_get_value(object, "policies");
                  if (v44)
                  {
                    unint64_t v45 = (const void *)SecPolicyXPCArrayCopyArray(v44, &cf);
                    if (!v45) {
                      goto LABEL_155;
                    }
                  }

                  else
                  {
                    unint64_t v45 = 0LL;
                  }

                  if (sub_100059C24(object, "responses", (__CFArray **)v66, (__CFString **)&cf)
                    && sub_100059C24(object, "scts", (__CFArray **)&v59, (__CFString **)&cf)
                    && sub_10005985C(object, "trustedLogs", &v58, (__CFString **)&cf))
                  {
                    double v48 = xpc_dictionary_get_double(object, "verifyDate");
                    if (sub_10005985C(object, "exceptions", &v57, (__CFString **)&cf))
                    {
                      if (sub_100059928(object, "auditToken", &v56, (__CFString **)&cf))
                      {
                        xpc_retain(objecta);
                        if (v14) {
                          CFRetain(v14);
                        }
                        CFTypeRef v49 = v56;
                        if (v56
                          && sub_100006E10( 8u,  v14,  @"com.apple.private.network.socket-delegate",  (__CFString **)&cf)
                          || (CFTypeRef v49 = v52) != 0LL)
                        {
                          CFRetain(v49);
                        }

                        v50 = (dispatch_queue_s *)sub_1000113A4();
                        *(void *)buf.val = _NSConcreteStackBlock;
                        *(void *)&buf.val[2] = 0x40000000LL;
                        *(void *)&buf.val[4] = sub_100006EA4;
                        *(void *)&buf.val[6] = &unk_100075AC8;
                        pid_t v4 = objecta;
                        xpc_object_t v72 = reply;
                        v73 = objecta;
                        __int128 v74 = *(_OWORD *)v61;
                        __int128 v75 = *(_OWORD *)v62;
                        __int128 v76 = v63;
                        uint64_t v77 = v64;
                        CFDataRef v78 = (CFDataRef)v49;
                        sub_10005397C( v50,  v49,  v41,  v43,  v39,  v51,  v45,  *(const void **)v66,  v48,  v59,  (void *)v58,  Mutable,  v57,  v37,  &buf);
                        xpc_object_t reply = 0LL;
                      }

                      else
                      {
                        pid_t v4 = objecta;
                      }

                      CFDataRef v12 = v52;
                    }
                  }

                  if (v45) {
                    CFRelease(v45);
                  }
LABEL_155:
                  reply_with_format = reply;
                  if (v43) {
                    CFRelease(v43);
                  }
LABEL_157:
                  unsigned int v26 = uint64;
                  CFRelease(v41);
LABEL_158:
                  if (*(void *)v66) {
                    CFRelease(*(CFTypeRef *)v66);
                  }
                  if (v59) {
                    CFRelease(v59);
                  }
                  if (v58) {
                    CFRelease(v58);
                  }
                  if (v57) {
                    CFRelease(v57);
                  }
                  CFTypeRef v47 = v56;
                  if (v56) {
                    goto LABEL_167;
                  }
                  goto LABEL_98;
                default:
                  goto LABEL_98;
              }
          }
      }
    }

    else
    {
      sub_10000DE58( 1LL,  @"com.apple.security.xpc",  v7,  &cf,  v8,  @"Messages expect to be xpc dictionary, got: %@",  object);
      unint64_t v9 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        buf.val[0] = 138412546;
        *(void *)&buf.val[1] = 0LL;
        LOWORD(buf.val[3]) = 2112;
        *(void *)((char *)&buf.val[3] + 2) = cf;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%@: returning error: %@",  (uint8_t *)&buf,  0x16u);
      }

      xpc_object_t v10 = sub_1000101A0((__CFError *)cf);
      reply_with_format = (void *)xpc_create_reply_with_format(object, "{%string: %value}", "error", v10);
      CFDataRef v12 = 0LL;
    }

    if (reply_with_format)
    {
      xpc_connection_send_message(v4, reply_with_format);
      xpc_release(reply_with_format);
    }

    if (v10) {
      xpc_release(v10);
    }
    if (cf) {
      CFRelease(cf);
    }
    if (v61[1]) {
      CFRelease(v61[1]);
    }
    if (v62[1]) {
      CFRelease(v62[1]);
    }
    if (v61[0]) {
      CFRelease(v61[0]);
    }
    if (v12) {
      CFRelease(v12);
    }
  }

BOOL sub_100006E10(unsigned int a1, __SecTask *a2, const __CFString *a3, __CFString **a4)
{
  BOOL v8 = sub_1000083C0(a2, a3);
  if (!v8)
  {
    if (a1 > 0x87) {
      unint64_t v9 = @"Unknown xpc operation";
    }
    else {
      unint64_t v9 = *(&off_100079C10 + a1);
    }
    sub_10000DE88(-34018, a4, @"%@: %@ lacks entitlement %@", v9, a2, a3);
  }

  return v8;
}

void sub_100006EA4( uint64_t a1, int64_t value, const __CFString *a3, const __CFString *a4, const __CFArray *a5, void *cf)
{
  CFTypeRef cfa = cf;
  if (cf)
  {
    uint64_t v7 = (__CFError *)cf;
    CFRetain(cf);
LABEL_14:
    xpc_object_t v15 = sub_1000101A0(v7);
    if (v15)
    {
      unint64_t v16 = v15;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "error", v15);
      xpc_release(v16);
    }

    CFTypeRef v17 = cfa;
    if (cfa)
    {
      CFTypeRef cfa = 0LL;
      CFRelease(v17);
    }

    goto LABEL_18;
  }

  xpc_dictionary_set_int64(*(xpc_object_t *)(a1 + 32), "result", value);
  if ((!a3 || sub_100059620(*(void **)(a1 + 32), "details", a3, &cfa, v11))
    && (!a4 || sub_100059620(*(void **)(a1 + 32), "info", a4, &cfa, v11))
    && a5)
  {
    CFDataRef v12 = *(void **)(a1 + 32);
    uint64_t v22 = 0LL;
    CFIndex v23 = &v22;
    uint64_t v24 = 0x2000000000LL;
    uint64_t v25 = 0LL;
    xpc_object_t v13 = xpc_array_create(0LL, 0LL);
    v23[3] = (uint64_t)v13;
    if (v13)
    {
      context[0] = _NSConcreteStackBlock;
      context[1] = 0x40000000LL;
      context[2] = sub_1000081B0;
      context[3] = &unk_100075D10;
      context[4] = &v22;
      context[5] = &cfa;
      v26.length = CFArrayGetCount(a5);
      v26.location = 0LL;
      CFArrayApplyFunction(a5, v26, (CFArrayApplierFunction)sub_10000820C, context);
    }

    else
    {
      sub_10000DE88(-50, (__CFString **)&cfa, @"xpc_array_create failed");
    }

    SecTaskRef v14 = (void *)v23[3];
    if (v14)
    {
      xpc_dictionary_set_value(v12, "chain", v14);
      xpc_release((xpc_object_t)v23[3]);
    }

    _Block_object_dispose(&v22, 8);
  }

  uint64_t v7 = (__CFError *)cfa;
  if (cfa) {
    goto LABEL_14;
  }
LABEL_18:
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  uint64_t v18 = *(const void **)(a1 + 48);
  if (v18) {
    CFRelease(v18);
  }
  unint64_t v19 = *(const void **)(a1 + 104);
  if (v19) {
    CFRelease(v19);
  }
}

void sub_1000070A0(uint64_t a1, BOOL value, void *cf)
{
  if (cf)
  {
    CFRetain(cf);
    xpc_object_t v5 = sub_1000101A0((__CFError *)cf);
    if (v5)
    {
      unsigned int v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "error", v5);
      xpc_release(v6);
    }

    CFRelease(cf);
  }

  else
  {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "status", value);
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
  BOOL v8 = *(const void **)(a1 + 104);
  if (v8) {
    CFRelease(v8);
  }
}

void sub_10000715C(uint64_t a1, BOOL value, void *cf)
{
  if (cf)
  {
    CFRetain(cf);
    xpc_object_t v5 = sub_1000101A0((__CFError *)cf);
    if (v5)
    {
      unsigned int v6 = v5;
      xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), "error", v5);
      xpc_release(v6);
    }

    CFRelease(cf);
  }

  else
  {
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), "status", value);
  }

  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 32));
  xpc_release(*(xpc_object_t *)(a1 + 40));
  uint64_t v7 = *(const void **)(a1 + 48);
  if (v7) {
    CFRelease(v7);
  }
}

uint64_t sub_10000720C(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  CFStringRef v7 = sub_1000080C8(a2, a4);
  if (!v7) {
    return 0LL;
  }
  BOOL v8 = (os_log_s *)v7;
  uint64_t v9 = sub_100008114(a2, a4);
  if (!v9) {
    return 0LL;
  }
  xpc_object_t v10 = (const void *)v9;
  BOOL value = -86;
  uint64_t v11 = sub_100055F10(v8, v9, &value, a4);
  if ((_DWORD)v11) {
    xpc_dictionary_set_BOOL(a3, "status", value);
  }
  CFRelease(v10);
  return v11;
}

BOOL sub_1000072B4(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  CFStringRef v7 = sub_1000080C8(a2, a4);
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = (uint64_t)v7;
  size_t length = 0LL;
  uint64_t v9 = 0LL;
  if (xpc_dictionary_get_data(a2, "cert", &length) && length && length <= 0x7FFFFFFFFFFFFFFELL) {
    uint64_t v9 = (const void *)SecCertificateCreateWithBytes(kCFAllocatorDefault);
  }
  size_t length = 0LL;
  BOOL v10 = sub_100059AC0(a2, &length, a4);
  if (v10)
  {
    uint64_t v11 = (const void *)length;
    BOOL v12 = sub_100054ED8(v8, (uint64_t)v9, length, a4);
    xpc_dictionary_set_BOOL(a3, "status", v12);
    if (v11) {
      CFRelease(v11);
    }
  }

  if (v9) {
    CFRelease(v9);
  }
  return v10;
}

uint64_t sub_1000073BC(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  CFStringRef v6 = sub_1000080C8(a2, a4);
  if (!v6) {
    return 0LL;
  }
  CFTypeRef cf = 0LL;
  unsigned int v7 = sub_100056558((uint64_t)v6, (__CFArray **)&cf, a4);
  if (cf) {
    uint64_t v9 = v7;
  }
  else {
    uint64_t v9 = 0LL;
  }
  if ((_DWORD)v9 == 1)
  {
    sub_100059620(a3, "status", (const __CFString *)cf, (CFTypeRef *)a4, v8);
    CFTypeRef v10 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v10);
    }
  }

  return v9;
}

os_log_s *sub_100007450(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  unsigned int v7 = (os_log_s *)sub_1000080C8(a2, a4);
  if (v7)
  {
    uint64_t v8 = sub_100008114(a2, a4);
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      CFTypeRef cf = 0LL;
      unsigned int v10 = sub_1000564E8(v7, v8, (__CFArray **)&cf, a4);
      if (cf) {
        unsigned int v7 = (os_log_s *)v10;
      }
      else {
        unsigned int v7 = 0LL;
      }
      if ((_DWORD)v7 == 1)
      {
        sub_100059620(a3, "status", (const __CFString *)cf, (CFTypeRef *)a4, v11);
        CFTypeRef v12 = cf;
        if (cf)
        {
          CFTypeRef cf = 0LL;
          CFRelease(v12);
        }
      }

      CFRelease(v9);
    }

    else
    {
      return 0LL;
    }
  }

  return v7;
}

uint64_t sub_100007510(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t result = (uint64_t)sub_1000080C8(a2, a4);
  if (result)
  {
    uint64_t v8 = (os_log_s *)result;
    uint64_t result = sub_100008114(a2, a4);
    if (result)
    {
      uint64_t v9 = (const void *)result;
      char v10 = sub_10005566C(v8, result, a4);
      xpc_dictionary_set_BOOL(a3, "status", v10);
      CFRelease(v9);
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_100007594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100022880(a4);
}

BOOL sub_10000759C(uint64_t a1, uint64_t a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_100019414(a4);
  if (!v5) {
    return 0LL;
  }
  CFStringRef v6 = (const void *)v5;
  unsigned int v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v8 = v7 != 0LL;
  if (v7)
  {
    uint64_t v9 = v7;
    xpc_dictionary_set_value(a3, "status", v7);
    xpc_release(v9);
  }

  CFRelease(v6);
  return v8;
}

BOOL sub_100007614(uint64_t a1, uint64_t a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_100019474(a4);
  if (!v5) {
    return 0LL;
  }
  CFStringRef v6 = (const void *)v5;
  unsigned int v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v8 = v7 != 0LL;
  if (v7)
  {
    uint64_t v9 = v7;
    xpc_dictionary_set_value(a3, "status", v7);
    xpc_release(v9);
  }

  CFRelease(v6);
  return v8;
}

uint64_t sub_10000768C(uint64_t a1, uint64_t a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_100019668(a4);
  xpc_dictionary_set_uint64(a3, "status", v5);
  return 1LL;
}

uint64_t sub_1000076C8(uint64_t a1, uint64_t a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_100016AB8(a4);
  xpc_dictionary_set_uint64(a3, "status", v5);
  return 1LL;
}

uint64_t sub_100007704(int a1, int a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_1000196B4(a4);
  xpc_dictionary_set_uint64(a3, "status", v5);
  return 1LL;
}

BOOL sub_100007740(uint64_t a1, uint64_t a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_1000191E8(a4);
  if (!v5) {
    return 0LL;
  }
  CFStringRef v6 = v5;
  unsigned int v7 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v8 = v7 != 0LL;
  if (v7)
  {
    uint64_t v9 = v7;
    xpc_dictionary_set_value(a3, "status", v7);
    xpc_release(v9);
  }

  CFRelease(v6);
  return v8;
}

BOOL sub_1000077B8(int a1, xpc_object_t xdict, void *a3)
{
  size_t length = 0LL;
  data = (const UInt8 *)xpc_dictionary_get_data(xdict, "data", &length);
  if (data) {
    BOOL v5 = length == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5 || length > 0x7FFFFFFFFFFFFFFELL) {
    return 0LL;
  }
  CFDataRef v7 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, data, length, kCFAllocatorNull);
  if (!v7) {
    return 0LL;
  }
  CFDataRef v8 = v7;
  uint64_t v9 = sub_100019378(v7);
  BOOL v10 = v9 != 0LL;
  if (v9)
  {
    uint64_t v11 = v9;
    CFTypeRef v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
    xpc_dictionary_set_value(a3, "status", v12);
    xpc_release(v12);
    CFRelease(v11);
  }

  CFRelease(v8);
  return v10;
}

BOOL sub_100007898(int a1, xpc_object_t xdict, void *a3, __CFString **a4)
{
  xpc_object_t dictionary = xpc_dictionary_get_dictionary(xdict, "eventAttributes");
  CFDataRef v8 = (__CFString *)sub_100059B38(xdict, "eventName", a4);
  uint64_t v9 = v8;
  if (dictionary) {
    BOOL v10 = v8 == 0LL;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    xpc_dictionary_set_BOOL(a3, "status", 0);
    BOOL v12 = 0LL;
    BOOL result = 0LL;
    if (!v9) {
      return result;
    }
  }

  else
  {
    BOOL v12 = sub_10004D63C(v8, dictionary, a4);
    xpc_dictionary_set_BOOL(a3, "status", v12);
  }

  CFRelease(v9);
  return v12;
}

uint64_t sub_100007954(__SecTask **a1, void *a2, void *a3, __CFString **a4)
{
  SecTaskRef v14 = 0LL;
  xpc_object_t v15 = 0LL;
  BOOL v8 = sub_100059BC4(a2, "appID", &v15, a4);
  uint64_t v9 = v15;
  if (!v8 || v15 == 0LL) {
    uint64_t v9 = sub_10000837C(*a1);
  }
  sub_1000599F4(a2, "exceptions", &v14, a4);
  uint64_t v11 = v14;
  char v12 = sub_10002A120((uint64_t)v9, (uint64_t)v14, a4);
  xpc_dictionary_set_BOOL(a3, "status", v12);
  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  return 0LL;
}

uint64_t sub_100007A24(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t v11 = 0LL;
  sub_100059BC4(a2, "appID", &v11, a4);
  CFStringRef v6 = v11;
  CFDataRef v7 = (const __CFString *)sub_10002A708((uint64_t)v11, (uint64_t)a4);
  if (v7)
  {
    uint64_t v9 = v7;
    sub_100059620(a3, "exceptions", v7, (CFTypeRef *)a4, v8);
    CFRelease(v9);
  }

  if (v6) {
    CFRelease(v6);
  }
  return 0LL;
}

BOOL sub_100007AB4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = sub_100019864();
  if (!v4) {
    return 0LL;
  }
  BOOL v5 = (const void *)v4;
  CFStringRef v6 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  BOOL v7 = v6 != 0LL;
  if (v6)
  {
    uint64_t v8 = v6;
    xpc_dictionary_set_value(a3, "status", v6);
    xpc_release(v8);
  }

  CFRelease(v5);
  return v7;
}

uint64_t sub_100007B28(int a1, int a2, void *a3, __CFString **a4)
{
  uint64_t v5 = sub_10001978C(a4);
  xpc_dictionary_set_uint64(a3, "status", v5);
  return 1LL;
}

uint64_t sub_100007B64(uint64_t a1, uint64_t a2, void *a3, CFTypeRef *a4)
{
  uint64_t v6 = sub_10002060C(a4);
  if (a4 && *a4) {
    return 0LL;
  }
  xpc_dictionary_set_uint64(a3, "status", v6);
  return 1LL;
}

id sub_100007BB8(uint64_t a1, uint64_t a2, void *a3, CFTypeRef *a4)
{
  id v6 = sub_100020A78(a4);
  BOOL v7 = !(_DWORD)v6 || a4 && *a4;
  xpc_dictionary_set_BOOL(a3, "status", v7);
  return v6;
}

uint64_t sub_100007C1C(__SecTask **a1, void *a2, void *a3, __CFString **a4)
{
  SecTaskRef v14 = 0LL;
  xpc_object_t v15 = 0LL;
  BOOL v8 = sub_100059BC4(a2, "appID", &v15, a4);
  uint64_t v9 = v15;
  if (!v8 || v15 == 0LL) {
    uint64_t v9 = sub_10000837C(*a1);
  }
  sub_1000599F4(a2, "revocationCheck", &v14, a4);
  uint64_t v11 = v14;
  char v12 = sub_10002ACA8((uint64_t)v9, (uint64_t)v14, a4);
  xpc_dictionary_set_BOOL(a3, "status", v12);
  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  return 0LL;
}

uint64_t sub_100007CEC(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t v11 = 0LL;
  sub_100059BC4(a2, "appID", &v11, a4);
  id v6 = v11;
  BOOL v7 = (const __CFString *)sub_10002AD50((uint64_t)v11, (uint64_t)a4);
  if (v7)
  {
    uint64_t v9 = v7;
    sub_100059620(a3, "revocationCheck", v7, (CFTypeRef *)a4, v8);
    CFRelease(v9);
  }

  if (v6) {
    CFRelease(v6);
  }
  return 0LL;
}

uint64_t sub_100007D7C(int a1, int a2, void *a3, __CFString **a4)
{
  unsigned int v5 = sub_100046344(a4);
  xpc_dictionary_set_uint64(a3, "status", v5);
  return 1LL;
}

uint64_t sub_100007DB8(__SecTask **a1, void *a2, void *a3, __CFString **a4)
{
  SecTaskRef v14 = 0LL;
  xpc_object_t v15 = 0LL;
  BOOL v8 = sub_100059BC4(a2, "appID", &v15, a4);
  uint64_t v9 = v15;
  if (!v8 || v15 == 0LL) {
    uint64_t v9 = sub_10000837C(*a1);
  }
  sub_10005985C(a2, "anchors", &v14, a4);
  uint64_t v11 = v14;
  char v12 = sub_10002AE48((uint64_t)v9, (uint64_t)v14, a4);
  xpc_dictionary_set_BOOL(a3, "status", v12);
  if (v11) {
    CFRelease(v11);
  }
  if (v9) {
    CFRelease(v9);
  }
  return 0LL;
}

uint64_t sub_100007E88(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  uint64_t v11 = 0LL;
  sub_100059BC4(a2, "appID", &v11, a4);
  id v6 = v11;
  BOOL v7 = (const __CFString *)sub_10002AEF0((uint64_t)v11, (uint64_t)a4);
  if (v7)
  {
    uint64_t v9 = v7;
    sub_100059620(a3, "anchors", v7, (CFTypeRef *)a4, v8);
    CFRelease(v9);
  }

  if (v6) {
    CFRelease(v6);
  }
  return 0LL;
}

BOOL sub_100007F18(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  CFStringRef v7 = sub_100059B38(a2, "domain", a4);
  if (!v7) {
    return 0LL;
  }
  CFStringRef v8 = v7;
  CFDataRef theData = 0LL;
  BOOL v9 = sub_100050164(*(_DWORD *)(a1 + 20), (uint64_t)v7, (uint64_t)&theData, a4);
  BOOL v10 = theData;
  if (theData) {
    BOOL v11 = v9;
  }
  else {
    BOOL v11 = 0LL;
  }
  if (v11)
  {
    if (CFDataGetLength(theData) < 0)
    {
      sub_10000DE88(-50, a4, @"no data for key %s", "status");
    }

    else
    {
      BytePtr = CFDataGetBytePtr(v10);
      size_t Length = CFDataGetLength(v10);
      xpc_dictionary_set_data(a3, "status", BytePtr, Length);
    }

    BOOL v10 = theData;
  }

  if (v10)
  {
    CFDataRef theData = 0LL;
    CFRelease(v10);
  }

  CFRelease(v8);
  return v11;
}

BOOL sub_100008024(uint64_t a1, void *a2, void *a3, __CFString **a4)
{
  id v6 = (os_log_s *)sub_1000080C8(a2, a4);
  CFStringRef v7 = v6;
  if (v6)
  {
    char v8 = sub_10005596C(v6, a4);
    xpc_dictionary_set_BOOL(a3, "status", v8);
  }

  return v7 != 0LL;
}

uint64_t sub_100008088(int a1, xpc_object_t xdict, uint64_t a3, __CFString **a4)
{
  uint64_t result = xpc_dictionary_get_uint64(xdict, "flags");
  if ((_DWORD)result) {
    return sub_100050514(result, a4);
  }
  return result;
}

CFStringRef sub_1000080C8(void *a1, __CFString **a2)
{
  CFStringRef result = sub_100059B38(a1, "domain", a2);
  if (result)
  {
    CFStringRef v4 = result;
    uint64_t v5 = sub_100053F0C(result, a2);
    CFRelease(v4);
    return (CFStringRef)v5;
  }

  return result;
}

uint64_t sub_100008114(void *a1, __CFString **a2)
{
  size_t length = 0LL;
  if (xpc_dictionary_get_data(a1, "cert", &length)) {
    BOOL v3 = length == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3 || length > 0x7FFFFFFFFFFFFFFELL)
  {
    sub_10000DE88(-50, a2, @"object for key %s missing", "cert");
    return 0LL;
  }

  uint64_t result = SecCertificateCreateWithBytes(kCFAllocatorDefault);
  if (!result)
  {
    sub_10000DE88(-26275, a2, @"object for key %s failed to create certificate from data", "cert");
    return 0LL;
  }

  return result;
}

void sub_1000081B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (v2)
  {
    if ((SecCertificateAppendToXPCArray(a2, v2, *(void *)(a1 + 40)) & 1) == 0)
    {
      xpc_release(*(xpc_object_t *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
    }
  }

uint64_t sub_10000820C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_100008220(id a1)
{
  v1 = (os_log_s *)sub_10000856C("serverxpc");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "Received signal SIGTERM. Will terminate when clean.",  v2,  2u);
  }

  xpc_transaction_exit_clean();
}

const void *sub_10000828C(__SecTask *a1, const __CFString *a2)
{
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(a1, a2, 0LL);
  BOOL v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFStringGetTypeID())
    {
      CFRelease(v3);
      return 0LL;
    }
  }

  return v3;
}

const void *sub_1000082DC(__SecTask *a1, const __CFString *a2)
{
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(a1, a2, 0LL);
  BOOL v3 = v2;
  if (v2)
  {
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 != CFArrayGetTypeID())
    {
LABEL_8:
      CFRelease(v3);
      return 0LL;
    }

    CFIndex Count = CFArrayGetCount((CFArrayRef)v3);
    if (Count >= 1)
    {
      CFIndex v6 = Count;
      CFIndex v7 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v3, v7);
        CFTypeID v9 = CFGetTypeID(ValueAtIndex);
        if (v9 != CFStringGetTypeID()) {
          break;
        }
        if (v6 == ++v7) {
          return v3;
        }
      }

      goto LABEL_8;
    }
  }

  return v3;
}

const void *sub_10000837C(__SecTask *a1)
{
  uint64_t result = sub_10000828C(a1, @"application-identifier");
  if (!result) {
    return sub_10000828C(a1, @"com.apple.application-identifier");
  }
  return result;
}

BOOL sub_1000083C0(__SecTask *a1, const __CFString *a2)
{
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(a1, a2, 0LL);
  if (!v2) {
    return 0LL;
  }
  BOOL v3 = v2;
  CFTypeID TypeID = CFBooleanGetTypeID();
  BOOL v5 = TypeID == CFGetTypeID(v3) && CFBooleanGetValue((CFBooleanRef)v3) != 0;
  CFRelease(v3);
  return v5;
}

const void *sub_10000842C(const __CFString *a1)
{
  if (a1) {
    v1 = a1;
  }
  else {
    v1 = @"logging";
  }
  os_unfair_lock_lock_with_options(&unk_100082AB0, 0x10000LL);
  Mutable = (const __CFDictionary *)qword_100082AB8;
  if (!qword_100082AB8)
  {
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFCopyStringDictionaryKeyCallBacks, 0LL);
    qword_100082AB8 = (uint64_t)Mutable;
  }

  Value = CFDictionaryGetValue(Mutable, v1);
  if (!Value)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    v5[2] = sub_100008530;
    void v5[3] = &unk_100075D30;
    v5[4] = v1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 0x40000000LL;
    _OWORD v6[2] = sub_100008E78;
    v6[3] = &unk_100075DC8;
    v6[4] = v5;
    sub_100008D10(v1, (uint64_t)v6);
    Value = CFDictionaryGetValue((CFDictionaryRef)qword_100082AB8, v1);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_100082AB0);
  return Value;
}

void sub_100008530(uint64_t a1, const char *a2)
{
  CFTypeRef v2 = (__CFDictionary *)qword_100082AB8;
  BOOL v3 = *(const void **)(a1 + 32);
  os_log_t v4 = os_log_create("com.apple.securityd", a2);
  CFDictionaryAddValue(v2, v3, v4);
}

const void *sub_10000856C(const char *a1)
{
  if (!a1) {
    return sub_10000842C(0LL);
  }
  CFTypeRef v2 = CFStringCreateWithCString(kCFAllocatorDefault, a1, 0x600u);
  BOOL v3 = sub_10000842C(v2);
  if (v2) {
    CFRelease(v2);
  }
  return v3;
}

uint64_t sub_1000085E8(const __CFDictionary *a1, uint64_t a2)
{
  __int128 v3 = xmmword_1000628E0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100008648, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof(0x2000000000000011LL, *((void *)&v3 + 1));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_100008648(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)a3)
  {
    uint64_t result = sub_10000868C(result, a2, *(CFTypeRef **)(a3 + 16));
    if (result) {
      *(void *)(a3 + 8) += result;
    }
    else {
      *(_BYTE *)a3 = 0;
    }
  }

  return result;
}

uint64_t sub_10000868C(uint64_t a1, uint64_t a2, CFTypeRef *a3)
{
  uint64_t v5 = sub_10000E960(a1, a3);
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v9 = sub_10000E960(a2, a3);
    if (v9) {
      return ccder_sizeof(0x2000000000000010LL, v9 + v8);
    }
  }

  sub_10000DE58(-6LL, @"com.apple.security.cfder.error", v6, a3, v7, @"null input");
  return 0LL;
}

uint64_t sub_100008710(const __CFDictionary *a1, CFTypeRef *a2, char a3, uint64_t a4, uint64_t a5)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  v20[0] = 0xAAAAAAAAAAAAAA01LL;
  v20[1] = a2;
  BYTE1(v20[0]) = a3;
  unint64_t v20[2] = Mutable;
  v20[3] = 0LL;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)sub_100008880, v20);
  if (!LOBYTE(v20[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0LL;
  }

  v21.size_t length = CFArrayGetCount(Mutable);
  v21.location = 0LL;
  CFArraySortValues(Mutable, v21, (CFComparatorFunction)sub_1000089BC, 0LL);
  CFIndex Count = CFArrayGetCount(Mutable);
  uint64_t v12 = a5;
  if (Count >= 1)
  {
    unint64_t v13 = Count + 1;
    uint64_t v12 = a5;
    do
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v13 - 2);
      CFIndex Length = CFDataGetLength(ValueAtIndex);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      uint64_t v12 = ccder_encode_body(Length, BytePtr, a4, v12);
      --v13;
    }

    while (v13 > 1);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl(0x2000000000000011LL, a5, a4, v12);
  if (!result)
  {
    sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v18, a2, v19, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_100008880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)a3)
  {
    CFIndex v6 = sub_10000868C(a1, a2, *(CFTypeRef **)(a3 + 8));
    if (!v6)
    {
      *(_BYTE *)a3 = 0;
      return;
    }

    CFIndex v7 = v6;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a3 + 24), v6);
    CFDataSetLength(Mutable, v7);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    BOOL v10 = &MutableBytePtr[v7];
    BOOL v11 = *(CFTypeRef **)(a3 + 8);
    uint64_t v12 = *(unsigned __int8 *)(a3 + 1);
    uint64_t v13 = sub_10000EBA0(a2, v11, v12, MutableBytePtr, v10);
    uint64_t v14 = sub_10000EBA0(a1, v11, v12, MutableBytePtr, v13);
    uint64_t v15 = ccder_encode_constructed_tl(0x2000000000000010LL, v10, MutableBytePtr, v14);
    if (v15)
    {
      v18.size_t length = v15 - (void)MutableBytePtr;
      v18.location = 0LL;
      CFDataDeleteBytes(Mutable, v18);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a3 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }

    else
    {
      sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v16, v11, v17, @"ccder failed to encode");
      *(_BYTE *)a3 = 0;
      if (!Mutable) {
        return;
      }
    }

    CFRelease(Mutable);
  }

uint64_t sub_1000089BC(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = -1LL;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1LL;
    }
  }

  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }

    else
    {
      return 1LL;
    }
  }

uint64_t sub_100008A80()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100008AFC;
  block[3] = &unk_100075D50;
  block[4] = &qword_100082AC8;
  if (qword_100082AC0 != -1) {
    dispatch_once(&qword_100082AC0, block);
  }
  return qword_100082AC8;
}

CFDictionaryRef sub_100008AFC(uint64_t a1)
{
  values = kCFBooleanTrue;
  keys = @"debug";
  CFDictionaryRef result = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&keys,  (const void **)&values,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_100008B98(uint64_t a1)
{
  if (qword_100082AD0 != -1) {
    dispatch_once(&qword_100082AD0, &stru_100075E08);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100008C24;
  block[3] = &unk_100075D78;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)qword_100082AD8, block);
}

uint64_t sub_100008C24(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (qword_100082AE0 != -1) {
    dispatch_once(&qword_100082AE0, &stru_100075E48);
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 16))(v1, qword_100082AE8);
}

void sub_100008C78(id a1)
{
  qword_100082AE8 = (uint64_t)CFCalendarCreateWithIdentifier(kCFAllocatorDefault, kCFGregorianCalendar);
  uint64_t v1 = CFTimeZoneCreateWithTimeIntervalFromGMT(kCFAllocatorDefault, 0.0);
  CFCalendarSetTimeZone((CFCalendarRef)qword_100082AE8, v1);
  if (v1) {
    CFRelease(v1);
  }
}

void sub_100008CE8(id a1)
{
  qword_100082AD8 = (uint64_t)dispatch_queue_create("ZuluCalendar", 0LL);
}

void sub_100008D10(const __CFString *a1, uint64_t a2)
{
  CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
  if (CStringPtr)
  {
    CFIndex v5 = CStringPtr;
    size_t v6 = strlen(CStringPtr);
    (*(void (**)(uint64_t, const char *, size_t))(a2 + 16))(a2, v5, v6);
  }

  else
  {
    CFIndex usedBufLen = 0LL;
    CFIndex Length = CFStringGetLength(a1);
    v10.location = 0LL;
    v10.size_t length = Length;
    CFStringGetBytes(a1, v10, 0x8000100u, 0, 0, 0LL, 0LL, &usedBufLen);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000LL;
    _OWORD v8[2] = sub_100008E04;
    unint64_t v8[3] = &unk_100075DA0;
    v8[6] = 0LL;
    v8[7] = Length;
    v8[8] = usedBufLen;
    v8[4] = a2;
    v8[5] = a1;
    sub_100010054(usedBufLen + 1, (uint64_t)v8);
  }

uint64_t sub_100008E04(uint64_t result, int a2, UInt8 *buffer)
{
  if (buffer)
  {
    uint64_t v4 = result;
    CFIndex v5 = *(const __CFString **)(result + 40);
    CFRange v8 = *(CFRange *)(v4 + 48);
    CFIndex v6 = *(void *)(v4 + 64);
    CFIndex usedBufLen = 0xAAAAAAAAAAAAAAAALL;
    CFStringGetBytes(v5, v8, 0x8000100u, 0, 0, buffer, v6, &usedBufLen);
    buffer[usedBufLen] = 0;
    return (*(uint64_t (**)(void))(*(void *)(v4 + 32) + 16LL))();
  }

  return result;
}

uint64_t sub_100008E78(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t sub_100008E84(unsigned __int8 **a1, unint64_t a2, CFTypeRef *a3, uint64_t a4, uint64_t a5)
{
  size_t v7 = *a1;
  if (*a1)
  {
    if ((unint64_t)v7 >= a2)
    {
      sub_10000DE58( -1LL,  @"com.apple.security.cfder.error",  (uint64_t)a3,  a3,  a5,  @"Unexpected end of datetime");
      *a1 = 0LL;
    }

    else
    {
      int v9 = *v7;
      int v8 = v9;
      *a1 = v7 + 1;
    }
  }

  sub_10000DE58(-1LL, @"com.apple.security.cfder.error", (uint64_t)a3, a3, a5, @"Not a decimal digit");
  *a1 = 0LL;
  return 0xFFFFFFFFLL;
}

unint64_t sub_100008F20( double *a1, CFTypeRef *a2, unsigned int a3, unsigned __int8 *a4, unint64_t a5)
{
  unint64_t v5 = a5;
  v71 = a4;
  int v68 = sub_100008E84(&v71, a5, a2, (uint64_t)a4, a5);
  int v67 = sub_100008E84(&v71, v5, a2, v7, v8);
  int v66 = sub_100008E84(&v71, v5, a2, v9, v10);
  int v13 = sub_100008E84(&v71, v5, a2, v11, v12);
  int v16 = sub_100008E84(&v71, v5, a2, v14, v15);
  int v19 = sub_100008E84(&v71, v5, a2, v17, v18);
  int v22 = sub_100008E84(&v71, v5, a2, v20, v21);
  int v25 = sub_100008E84(&v71, v5, a2, v23, v24);
  int v28 = sub_100008E84(&v71, v5, a2, v26, v27);
  int v34 = sub_100008E84(&v71, v5, a2, v29, v30);
  unint64_t v35 = 0LL;
  BOOL v36 = v71;
  double v37 = NAN;
  if (v71 && (unint64_t)v71 < v5)
  {
    int v38 = *v71;
    if (v38 == 46)
    {
      int v39 = v71 + 1;
      if ((unint64_t)(v71 + 1) < v5)
      {
        int v38 = *v39;
        if ((v38 - 58) < 0xFFFFFFF6)
        {
          uint64_t v40 = @"fraction without digits";
LABEL_14:
          CFIndex v42 = -1LL;
LABEL_23:
          sub_10000DE58(v42, @"com.apple.security.cfder.error", v31, a2, v33, v40);
          unint64_t v35 = 0LL;
          goto LABEL_24;
        }

        uint64_t v43 = 0LL;
        uint64_t v44 = v5 - (void)v71 - 2;
        unint64_t v45 = 1LL;
        while (v44)
        {
          int v46 = v38;
          if (v45 < 0x1999999999999999LL)
          {
            v45 *= 10LL;
            uint64_t v43 = (v38 - 48) + 10 * v43;
          }

          int v47 = *++v39;
          int v38 = v47;
          --v44;
          if ((v47 - 58) < 0xFFFFFFF6)
          {
            if (v46 == 48)
            {
              uint64_t v40 = @"fraction ends in 0";
              goto LABEL_14;
            }

            double v37 = (double)(unint64_t)v43 / (double)v45;
            BOOL v36 = v39;
            goto LABEL_8;
          }
        }
      }

      uint64_t v40 = @"overflow";
      CFIndex v42 = -8LL;
      goto LABEL_23;
    }

    double v37 = 0.0;
LABEL_8:
    if ((unint64_t)v36 < v5)
    {
      unint64_t v35 = v36 + 1;
      v71 = v36 + 1;
      switch(v38)
      {
        case 'Z':
          double v48 = 0.0;
          goto LABEL_25;
        case '-':
          int v41 = -60;
          break;
        case '+':
          int v41 = 60;
          break;
        default:
          goto LABEL_24;
      }

      int v65 = v41;
      int v56 = sub_100008E84(&v71, v5, a2, v32, v33);
      int v64 = sub_100008E84(&v71, v5, a2, v57, v58) + 10 * v56;
      int v61 = sub_100008E84(&v71, v5, a2, v59, v60);
      double v48 = (double)(int)((sub_100008E84(&v71, v5, a2, v62, v63) + 10 * v61 + 60 * v64) * v65);
      unint64_t v35 = v71;
      if (!v71) {
        return 0LL;
      }
      goto LABEL_25;
    }

    uint64_t v40 = @"Unexpected end of datetime";
    goto LABEL_14;
  }

LABEL_24:
  sub_10000DE58(-1LL, @"com.apple.security.cfder.error", v31, a2, v33, @"Invalid datetime character");
  double v48 = NAN;
  if (!v35) {
    return 0LL;
  }
LABEL_25:
  if (v35 != (unsigned __int8 *)v5)
  {
    sub_10000DE58( -1LL,  @"com.apple.security.cfder.error",  v31,  a2,  v33,  @"trailing garbage at end of datetime");
    return 0LL;
  }

  uint64_t v50 = (v13 + 10 * v66);
  uint64_t v51 = (v19 + 10 * v16);
  uint64_t v52 = (v25 + 10 * v22);
  v87[0] = 0;
  if ((sub_1000093AC( a3,  (v67 + 10 * v68),  v50,  v51,  v52,  (v34 + 10 * v28),  v87,  (__CFString **)a2) & 1) != 0)
  {
    uint64_t v83 = 0LL;
    v84 = &v83;
    uint64_t v85 = 0x2000000000LL;
    char v86 = 0;
    int v79 = 0;
    CFRange v80 = (double *)((char *)&v78 + 4);
    uint64_t v81 = 0x2000000000LL;
    uint64_t v82 = 0LL;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 0x40000000LL;
    v72[2] = sub_1000094C0;
    v72[3] = &unk_100075E70;
    v72[4] = &v83;
    v72[5] = (char *)&v78 + 4;
    unsigned int v73 = a3;
    int v74 = v67 + 10 * v68;
    int v75 = v50;
    int v76 = v51;
    int v77 = v52;
    uint64_t v78 = (v34 + 10 * v28);
    sub_100008B98((uint64_t)v72);
    if (*((_BYTE *)v84 + 24))
    {
      double v55 = v80[3] - v48;
    }

    else
    {
      sub_10000DE58( -1LL,  @"com.apple.security.cfder.error",  v53,  a2,  v54,  @"Failed to encode date from components");
      double v55 = NAN;
    }

    _Block_object_dispose((char *)&v78 + 4, 8);
    _Block_object_dispose(&v83, 8);
    *a1 = v55;
    *a1 = v37 + v55;
  }

  else
  {
    unint64_t v5 = 0LL;
    *a1 = NAN;
  }

  return v5;
}

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = Mutable;
}

uint64_t sub_1000093AC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, __CFString **a8)
{
  if ((a1 & 3) != 0)
  {
    BOOL v8 = 0LL;
  }

  else
  {
    HIDWORD(v9) = -1030792151 * a1 + 85899344;
    LODWORD(v9) = HIDWORD(v9);
    if ((v9 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v10) = -1030792151 * a1 + 85899344;
      LODWORD(v10) = HIDWORD(v10);
      BOOL v8 = (v10 >> 4) < 0xA3D70B;
    }

    else
    {
      BOOL v8 = 1LL;
    }
  }

  if (a7) {
    *a7 = v8;
  }
  if ((int)a6 <= 61
    && (int)a5 <= 59
    && (int)a4 <= 23
    && (a2 - 13) >= 0xFFFFFFF4
    && (a3 - 32) >= 0xFFFFFFE1
    && ((_DWORD)a2 != 2 || (v8 | 0x1C) >= a3)
    && ((_DWORD)a2 == 2 || dword_1000602B0[a2] - dword_1000602B0[(a2 - 1)] >= (int)a3))
  {
    return 1LL;
  }

  sub_10000DE88(-1, a8, @"Invalid date: %i, %i, %i, %i, %i, %i, %i", a1, a2, a3, a4, a5, a6, v8);
  return 0LL;
}

uint64_t sub_1000094C0(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarComposeAbsoluteTime( calendar,  (CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  "yMdHms",  *(unsigned int *)(a1 + 48),  *(unsigned int *)(a1 + 52),  *(unsigned int *)(a1 + 56),  *(unsigned int *)(a1 + 60),  *(unsigned int *)(a1 + 64),  *(unsigned int *)(a1 + 68));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result != 0;
  return result;
}

uint64_t sub_100009530(uint64_t a1, CFCalendarRef calendar)
{
  uint64_t result = CFCalendarDecomposeAbsoluteTime( calendar,  *(CFAbsoluteTime *)(a1 + 40),  "yMdHms",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 80),  *(void *)(a1 + 88));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = (_DWORD)result != 0;
  return result;
}

void sub_100009590()
{
}

void sub_1000095A0(int a1, CFTypeRef *a2, CFStringRef format, ...)
{
  if (a2)
  {
    uint64_t v4 = (__CFString *)*a2;
    *a2 = 0LL;
    sub_10000DBBC(a1, @"com.apple.utilities.sqlite3", v4, a2, format, va);
  }

BOOL sub_1000095E8(uint64_t a1, sqlite3 *a2, CFTypeRef *a3, CFStringRef format, ...)
{
  if ((_DWORD)a1 && a3)
  {
    CFStringRef v7 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
    if ((_DWORD)a1 == 14)
    {
      uint64_t v8 = sqlite3_system_errno(a2);
      unint64_t v9 = (void *)CFStringCreateWithFormat(0LL, 0LL, @"%d", v8);
    }

    else
    {
      unint64_t v9 = (void *)CFRetain(&stru_10007A4F0);
    }

    unint64_t v10 = v9;
    uint64_t v11 = sqlite3_extended_errcode(a2);
    uint64_t v12 = sqlite3_errmsg(a2);
    if ((_DWORD)v11 == (_DWORD)a1) {
      sub_1000095A0(a1, a3, @"%@: [%d]%@ %s", v7, a1, v10, v12, v14, va);
    }
    else {
      sub_1000095A0(a1, a3, @"%@: [%d->%d]%@ %s", v7, a1, v11, v10, v12, va);
    }
    if (v7) {
      CFRelease(v7);
    }
    if (v10) {
      CFRelease(v10);
    }
  }

  return (_DWORD)a1 == 0;
}

BOOL sub_100009708(uint64_t a1, sqlite3_stmt *a2, CFTypeRef *a3, CFStringRef format, ...)
{
  if ((_DWORD)a1 && a3)
  {
    CFStringRef v7 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
    uint64_t v8 = sqlite3_db_handle(a2);
    unint64_t v9 = sqlite3_sql(a2);
    uint64_t v10 = sqlite3_extended_errcode(v8);
    uint64_t v11 = sqlite3_errmsg(v8);
    if ((_DWORD)v10 == (_DWORD)a1) {
      sub_1000095A0(a1, a3, @"%@: [%d] %s sql: %s", v7, a1, v11, v9, v13, va);
    }
    else {
      sub_1000095A0(a1, a3, @"%@: [%d->%d] %s sql: %s", v7, a1, v10, v11, v9, va);
    }
    if (v7) {
      CFRelease(v7);
    }
  }

  return (_DWORD)a1 == 0;
}

void sub_1000097F8()
{
  if (qword_100082AF0 != -1) {
    dispatch_once(&qword_100082AF0, &stru_100075ED8);
  }
}

void sub_100009820(id a1)
{
  int v1 = sqlite3_config(16, nullsub_1, 0LL);
  if (v1)
  {
    int v2 = v1;
    __int128 v3 = (os_log_s *)sub_10000856C("SecWarning");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      int v5 = v2;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Could not set up sqlite global error logging to syslog: %d",  buf,  8u);
    }
  }

uint64_t sub_1000098DC(uint64_t a1)
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_100075EF8);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_10000990C(uint64_t a1)
{
  int v2 = *(const void **)(a1 + 16);
  if (v2)
  {
    *(void *)(a1 + 16) = 0LL;
    CFRelease(v2);
  }

  __int128 v3 = *(dispatch_queue_s **)(a1 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100009A74;
  block[3] = &unk_100076148;
  block[4] = a1;
  dispatch_sync(v3, block);
  uint64_t v4 = *(dispatch_object_s **)(a1 + 24);
  if (v4)
  {
    dispatch_release(v4);
    *(void *)(a1 + 24) = 0LL;
  }

  int v5 = *(dispatch_object_s **)(a1 + 32);
  if (v5)
  {
    dispatch_release(v5);
    *(void *)(a1 + 32) = 0LL;
  }

  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 56));
  CFIndex v6 = *(dispatch_object_s **)(a1 + 120);
  if (v6)
  {
    dispatch_release(v6);
    *(void *)(a1 + 120) = 0LL;
  }

  CFStringRef v7 = *(const void **)(a1 + 136);
  if (v7)
  {
    _Block_release(v7);
    *(void *)(a1 + 136) = 0LL;
  }

  uint64_t v8 = *(const void **)(a1 + 152);
  if (v8)
  {
    *(void *)(a1 + 152) = 0LL;
    CFRelease(v8);
  }

CFStringRef sub_1000099E0(uint64_t a1)
{
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"<SecDb path:%@ connections: %@>",  *(void *)(a1 + 16),  *(void *)(a1 + 48));
}

CFStringRef sub_100009A24(uint64_t a1)
{
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"<SecDb path:%@ connections: %@>",  *(void *)(a1 + 16),  *(void *)(a1 + 48));
}

void sub_100009A74(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  __int128 v3 = *(const void **)(v2 + 40);
  if (v3)
  {
    *(void *)(v2 + 40) = 0LL;
    CFRelease(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  uint64_t v4 = *(const void **)(v2 + 48);
  if (v4)
  {
    *(void *)(v2 + 48) = 0LL;
    CFRelease(v4);
  }

uint64_t sub_100009AC0(const __CFString *a1, __int16 a2, char a3, char a4, char a5, char a6, void *a7)
{
  *(void *)audit_token_t buf = _NSConcreteStackBlock;
  uint64_t v30 = 0x40000000LL;
  uint64_t v31 = sub_1000098DC;
  uint64_t v32 = &unk_100075F58;
  uint64_t v33 = &qword_100082B00;
  if (qword_100082AF8 != -1) {
    dispatch_once(&qword_100082AF8, buf);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_100082B00, 160LL, 0LL);
  if (Instance)
  {
    aBlock = a7;
    char v25 = a3;
    __int16 v15 = a2;
    char v16 = a5;
    if (getenv("__OSINSTALL_ENVIRONMENT"))
    {
      uint64_t v17 = (os_log_s *)sub_10000856C("#SecDB");
      char v18 = a6;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)audit_token_t buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEBUG,  "SecDB: running from installer",  buf,  2u);
      }

      CFStringRef Copy = @"file::memory:?cache=shared";
    }

    else
    {
      char v18 = a6;
      CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, a1);
    }

    *(void *)(Instance + 16) = Copy;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 0x40000000LL;
    v28[2] = sub_100009E68;
    v28[3] = &unk_100075F78;
    v28[4] = Instance;
    *(void *)audit_token_t buf = _NSConcreteStackBlock;
    uint64_t v30 = 0x40000000LL;
    uint64_t v31 = sub_100008E78;
    uint64_t v32 = &unk_100075DC8;
    uint64_t v33 = v28;
    sub_100008D10(a1, (uint64_t)buf);
    uint64_t v20 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@-commit", a1);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 0x40000000LL;
    void v27[2] = sub_100009E98;
    v27[3] = &unk_100075F98;
    v27[4] = Instance;
    *(void *)audit_token_t buf = _NSConcreteStackBlock;
    uint64_t v30 = 0x40000000LL;
    uint64_t v31 = sub_100008E78;
    uint64_t v32 = &unk_100075DC8;
    uint64_t v33 = v27;
    sub_100008D10(v20, (uint64_t)buf);
    if (v20) {
      CFRelease(v20);
    }
    *(void *)(Instance + 40) = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    *(void *)(Instance + 48) = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    v34.__sig = 0xAAAAAAAAAAAAAAAALL;
    *(void *)v34.__opaque = 0xAAAAAAAAAAAAAAAALL;
    if (pthread_mutexattr_init(&v34) || (uint64_t v21 = &v34, pthread_mutexattr_setpolicy_np(&v34, 1)))
    {
      int v22 = (os_log_s *)sub_10000856C("SecCritical");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)audit_token_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "SecDb: SecDbCreate failed to create attributes for the write mutex; fairness properties are no longer present",
          buf,
          2u);
      }

      uint64_t v21 = 0LL;
    }

    if (pthread_mutex_init((pthread_mutex_t *)(Instance + 56), v21))
    {
      uint64_t v23 = (os_log_s *)sub_10000856C("SecCritical");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)audit_token_t buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "SecDb: SecDbCreate failed to init the write mutex, this will end badly",  buf,  2u);
      }
    }

    pthread_mutexattr_destroy(&v34);
    *(void *)(Instance + 120) = dispatch_semaphore_create(5LL);
    *(_BYTE *)(Instance + 128) = 0;
    *(void *)(Instance + 136) = _Block_copy(aBlock);
    *(_BYTE *)(Instance + 144) = 0;
    *(_DWORD *)(Instance + 148) = 0;
    *(void *)(Instance + 152) = 0LL;
    *(_WORD *)(Instance + 160) = v15;
    *(_BYTE *)(Instance + 162) = v25;
    *(_BYTE *)(Instance + 163) = a4;
    *(_BYTE *)(Instance + 164) = v16;
    *(_BYTE *)(Instance + 165) = v18;
    *(_BYTE *)(Instance + 166) = 2;
    *(void *)(Instance + 168) = 0LL;
  }

  return Instance;
}

dispatch_queue_t sub_100009E68(uint64_t a1, char *label)
{
  dispatch_queue_t result = dispatch_queue_create(label, 0LL);
  *(void *)(*(void *)(a1 + 32) + 24LL) = result;
  return result;
}

dispatch_queue_t sub_100009E98(uint64_t a1, char *label)
{
  dispatch_queue_t result = dispatch_queue_create(label, &_dispatch_queue_attr_concurrent);
  *(void *)(*(void *)(a1 + 32) + 32LL) = result;
  return result;
}

uint64_t sub_100009ED0(uint64_t a1, const __CFString *cf, CFTypeRef *a3)
{
  uint64_t v4 = cf;
  CFRetain(cf);
  if (!v4) {
    return 1LL;
  }
  LOBYTE(v6) = 1;
  do
  {
    CFStringRef v9 = 0LL;
    if ((v6 & 1) != 0)
    {
      CFIndex v6 = sub_100009FBC(a1, v4, &v9, a3);
      if (v6)
      {
        do
          int v7 = sub_10000A0E0(a1, v6, (uint64_t)a3);
        while (v7 == 1);
        CFIndex v6 = (sqlite3_stmt *)((v7 != 0) & sub_10000A238(v6, a3));
      }
    }

    else
    {
      sub_1000095A0(1, a3, @"Error with unexecuted sql remaining %@", v4);
      CFIndex v6 = 0LL;
    }

    CFRelease(v4);
    uint64_t v4 = v9;
  }

  while (v9);
  return (uint64_t)v6;
}

sqlite3_stmt *sub_100009FBC(uint64_t a1, const __CFString *a2, CFStringRef *a3, CFTypeRef *a4)
{
  v12.location = 0LL;
  v12.size_t length = 0LL;
  uint64_t v14 = 0LL;
  __int16 v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  if (a2)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 0x40000000LL;
    void v13[2] = sub_10000AF08;
    _OWORD v13[3] = &unk_1000762C0;
    v13[4] = &v14;
    v13[5] = a1;
    v13[6] = a4;
    v13[7] = &v12;
    sub_100008D10(a2, (uint64_t)v13);
    int v7 = (sqlite3_stmt *)v15[3];
  }

  else
  {
    int v7 = 0LL;
  }

  _Block_object_dispose(&v14, 8);
  if (v12.length >= 1)
  {
    uint64_t v8 = CFGetAllocator(a2);
    CFStringRef v9 = CFStringCreateWithSubstring(v8, a2, v12);
    CFStringRef v10 = v9;
    if (a3)
    {
      *a3 = v9;
    }

    else
    {
      sub_1000095A0(2, a4, @"prepare_v2: %@ unused sql: %@", a2, v9);
      if (v10) {
        CFRelease(v10);
      }
      sub_10000A238(v7, a4);
      return 0LL;
    }
  }

  return v7;
}

uint64_t sub_10000A0E0(uint64_t a1, sqlite3_stmt *pStmt, uint64_t a3)
{
  uint64_t v6 = 0LL;
  while (1)
  {
    if (*(_BYTE *)(a1 + 24) && !sqlite3_stmt_readonly(pStmt))
    {
      int v7 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = sqlite3_sql(pStmt);
        *(_DWORD *)audit_token_t buf = 136315138;
        uint64_t v13 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "_SecDbStep: SecDbConnection is readonly but we're about to write: %s",  buf,  0xCu);
      }
    }

    uint64_t v9 = sqlite3_step(pStmt);
    if ((_DWORD)v9 == 100) {
      return 1LL;
    }
    if ((_DWORD)v9 == 101) {
      break;
    }
    char v10 = sub_10000A29C(a1, v9, @"step", v6, a3);
    uint64_t v6 = (v6 + 1);
    if ((v10 & 1) == 0) {
      return 0LL;
    }
  }

  sqlite3_reset(pStmt);
  return 2LL;
}

BOOL sub_10000A238(sqlite3_stmt *a1, CFTypeRef *a2)
{
  uint64_t v4 = sqlite3_db_handle(a1);
  uint64_t v5 = sqlite3_finalize(a1);
  return !(_DWORD)v5 || sub_1000095E8(v5, v4, a2, @"finalize: %p", a1);
}

uint64_t sub_10000A29C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, CFTypeRef *a5)
{
  if (a4 > 4)
  {
    int v10 = 250;
    int v11 = 250 * a4 - 820;
  }

  else
  {
    int v10 = dword_1000602E4[a4];
    int v11 = dword_1000602F8[a4];
  }

  CFRange v12 = (os_log_s *)sub_10000856C("#SecDB");
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11 > 299999)
  {
    if (v13)
    {
      *(_DWORD *)audit_token_t buf = 67109120;
      int v16 = v11;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "sqlite busy/locked: too long: %d ms, giving up",  buf,  8u);
    }

    return sub_10000A450(a1, a2, a5, @"%@", a3);
  }

  if (v13)
  {
    *(_DWORD *)audit_token_t buf = 67109632;
    int v16 = a2;
    __int16 v17 = 1024;
    int v18 = a4;
    __int16 v19 = 1024;
    int v20 = v11;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "sqlite busy/locked: %d ntries: %d totaltimeout: %d",  buf,  0x14u);
  }

  j__sqlite3_sleep(v10);
  return 1LL;
}

BOOL sub_10000A450(uint64_t a1, uint64_t a2, CFTypeRef *a3, CFStringRef format, ...)
{
  if (!(_DWORD)a2 || (_DWORD)a2 == 101) {
    return !(_DWORD)a2 || (_DWORD)a2 == 101;
  }
  if (a3)
  {
    va_copy((va_list)buf, va);
    CFStringRef v7 = CFStringCreateWithFormatAndArguments(kCFAllocatorDefault, 0LL, format, va);
    sub_1000095E8(a2, *(sqlite3 **)(a1 + 64), a3, @"%@", v7);
    CFRelease(v7);
  }

  *(_BYTE *)(a1 + 48) |= (_DWORD)a2 == 10;
  if (*(_BYTE *)(a1 + 40))
  {
    uint64_t v8 = (__CFString *)CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"SQL DB %@ is corrupted already. Corruption error was: %d (previously %d)",  format,  *(void *)(*(void *)(a1 + 16) + 16LL),  a2,  *(unsigned int *)(a1 + 44));
    uint64_t v9 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);
    }

    if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 16) + 16LL), @"/Library/Keychains/keychain-2.db"))
    {
      int v10 = 1405092101;
    }

    else if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 16) + 16LL), @"/Library/Keychains/ocspcache.sqlite3"))
    {
      int v10 = 1405092357;
    }

    else if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 16) + 16LL), @"/Library/Keychains/TrustStore.sqlite3"))
    {
      int v10 = 1405092613;
    }

    else if (CFEqual(*(CFTypeRef *)(*(void *)(a1 + 16) + 16LL), @"/Library/Keychains/caissuercache.sqlite3"))
    {
      int v10 = 1405092869;
    }

    else
    {
      int v10 = 1405091845;
    }

    sub_10000FD78(v8, v10);
    if (v8) {
      CFRelease(v8);
    }
    if ((_DWORD)a2 == 26 || (_DWORD)a2 == 11)
    {
      uint64_t v33 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        uint64_t v30 = "SecDbConnectionCheckCode detected corruption twice: going to handle corrupt DB";
        uint64_t v31 = v33;
        uint32_t v32 = 2;
        goto LABEL_51;
      }

      goto LABEL_52;
    }

    return !(_DWORD)a2 || (_DWORD)a2 == 101;
  }

  BOOL v11 = (_DWORD)a2 == 11;
  if ((_DWORD)a2 == 26) {
    BOOL v11 = 1;
  }
  *(_BYTE *)(a1 + 40) = v11;
  if ((_DWORD)a2 != 26 && (_DWORD)a2 != 11) {
    return !(_DWORD)a2 || (_DWORD)a2 == 101;
  }
  *(_DWORD *)(a1 + 44) = a2;
  uint64_t v44 = 0LL;
  unint64_t v45 = &v44;
  uint64_t v46 = 0x2000000000LL;
  char v47 = 0;
  uint64_t v40 = 0LL;
  int v41 = &v40;
  uint64_t v42 = 0x2000000000LL;
  char v43 = 0;
  uint64_t v36 = 0LL;
  double v37 = &v36;
  uint64_t v38 = 0x2000000000LL;
  CFTypeRef v39 = 0LL;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  uint64_t v51 = sub_10000AACC;
  uint64_t v52 = &unk_1000761E8;
  uint64_t v53 = &v36;
  uint64_t v54 = &v40;
  double v55 = &v44;
  uint64_t v56 = a1;
  CFRange v12 = (sqlite3_stmt *)sub_100009FBC(a1, @"PRAGMA integrity_check", 0LL, &v39);
  if (v12)
  {
    BOOL v13 = v12;
    sub_10000AACC((uint64_t)&buf, v12);
    sub_10000A238(v13, &v39);
  }

  if (!*((_BYTE *)v45 + 24))
  {
    uint64_t v14 = (__CFError *)v37[3];
    if (!v14)
    {
      *((_BYTE *)v41 + 24) = 1;
      uint64_t v21 = (os_log_s *)sub_10000856C("#SecDB");
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_28;
      }
      *(_WORD *)double v48 = 0;
      int v18 = "#SecDB warning: failed to run integrity check due to corruption";
      __int16 v19 = v21;
      uint32_t v20 = 2;
      goto LABEL_60;
    }

    CFIndex Code = CFErrorGetCode(v14);
    if (Code == 26 || Code == 11) {
      *((_BYTE *)v41 + 24) = 1;
    }
    int v16 = (os_log_s *)sub_10000856C("#SecDB");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v17 = v37[3];
      *(_DWORD *)double v48 = 138543362;
      uint64_t v49 = v17;
      int v18 = "#SecDB warning error %{public}@ when running integrity check";
      __int16 v19 = v16;
      uint32_t v20 = 12;
LABEL_60:
      _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, v18, v48, v20);
    }
  }

LABEL_28:
  if (*((_BYTE *)v41 + 24))
  {
    int v22 = *((unsigned __int8 *)v45 + 24);
    uint64_t v23 = (os_log_s *)sub_10000856C("SecError");
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
    if (v22)
    {
      if (v24)
      {
        *(_WORD *)double v48 = 0;
        char v25 = "SecDBCheckCorrupted ran integrity_check, and that didn't return ok";
LABEL_34:
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v25, v48, 2u);
      }
    }

    else if (v24)
    {
      *(_WORD *)double v48 = 0;
      char v25 = "SecDBCheckCorrupted failed to run integrity check";
      goto LABEL_34;
    }
  }

  uint64_t v26 = (const void *)v37[3];
  if (v26)
  {
    v37[3] = 0LL;
    CFRelease(v26);
  }

  int v27 = *((unsigned __int8 *)v41 + 24);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  *(_BYTE *)(a1 + 40) = v27;
  int v28 = (os_log_s *)sub_10000856C("SecError");
  BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
  if (v27)
  {
    if (v29)
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = a2;
      uint64_t v30 = "operation returned code: %d integrity check=fail";
      uint64_t v31 = v28;
      uint32_t v32 = 8;
LABEL_51:
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&buf, v32);
    }

  char v25 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v28);
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  int v27 = Mutable;
  if (cf) {
    CFDictionaryAddValue(Mutable, kCFErrorUnderlyingErrorKey, cf);
  }
  if (v25) {
    CFDictionaryAddValue(v27, kSOSCountKey, v25);
  }
  if (v10) {
    CFDictionaryAddValue(v27, kCFErrorDescriptionKey, v10);
  }
  *a4 = CFErrorCreate(kCFAllocatorDefault, a2, a1, v27);
  if (v25) {
    CFRelease(v25);
  }
  if (v10) {
    CFRelease(v10);
  }
  if (v27) {
    CFRelease(v27);
  }
  if (cf)
  {
    uint32_t v20 = cf;
LABEL_42:
    CFRelease(v20);
  }

LABEL_52:
    sub_10000A9BC(a1, a2, a3);
    return !(_DWORD)a2 || (_DWORD)a2 == 101;
  }

  if (v29)
  {
    LODWORD(buf) = 67109120;
    DWORD1(buf) = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "operation returned code: %d: integrity check=pass",  (uint8_t *)&buf,  8u);
  }

  return !(_DWORD)a2 || (_DWORD)a2 == 101;
}

uint64_t sub_10000A9BC(uint64_t a1, uint64_t __errnum, CFTypeRef *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (*(_BYTE *)(v3 + 163))
  {
    CFRange v12 = *(const __CFString **)(v3 + 16);
    *(void *)__int128 buf = _NSConcreteStackBlock;
    uint64_t v15 = 0x40000000LL;
    int v16 = sub_100008E78;
    uint64_t v17 = &unk_100075DC8;
    int v18 = &stru_100076298;
    sub_100008D10(v12, (uint64_t)buf);
    BOOL v13 = (os_log_s *)sub_10000856C("SecWarning");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "SecDbHandleCorrupt: killing self so that successor might cleanly delete corrupt db",  buf,  2u);
    }

    sub_100009590();
  }

  CFIndex v7 = (int)__errnum;
  uint64_t v8 = strerror(__errnum);
  sub_10000DE58( v7,  kCFErrorDomainPOSIX,  v9,  a3,  v10,  @"SecDbHandleCorrupt not allowed to repair, handled error: [%d] %s",  __errnum,  v8);
  *(_BYTE *)(a1 + 40) = 0;
  return 0LL;
}

uint64_t sub_10000AACC(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 0x40000000LL;
  v5[2] = sub_10000AB38;
  void v5[3] = &unk_1000761C0;
  CFIndex v7 = a2;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  return sub_10000AC3C(v2, a2, v3, (uint64_t)v5);
}

void sub_10000AB38(uint64_t a1)
{
  uint64_t v2 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 48), 0);
  uint64_t v3 = v2;
  if (!v2 || strncasecmp((const char *)v2, "ok", 3uLL))
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
    uint64_t v4 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = "NULL";
      if (v3) {
        uint64_t v5 = (const char *)v3;
      }
      int v6 = 136315138;
      CFIndex v7 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SecDBCheckCorrupted integrity_check returned %s",  (uint8_t *)&v6,  0xCu);
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
}

uint64_t sub_10000AC3C(uint64_t a1, sqlite3_stmt *pStmt, CFTypeRef *a3, uint64_t a4)
{
  while (1)
  {
    while (1)
    {
      uint64_t result = sub_10000A0E0(a1, pStmt, (uint64_t)a3);
      if ((_DWORD)result == 1) {
        break;
      }
      if (!(_DWORD)result) {
        return result;
      }
      if ((_DWORD)result == 2) {
        return 1LL;
      }
    }

    if (!a4) {
      break;
    }
    uint64_t v16 = 0LL;
    uint64_t v17 = &v16;
    uint64_t v18 = 0x2000000000LL;
    char v19 = 0;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 0x40000000LL;
    CFRange v12 = sub_10000AD6C;
    BOOL v13 = &unk_100076010;
    uint64_t v14 = a4;
    uint64_t v15 = &v16;
    uint64_t v9 = v11;
    uint64_t v10 = objc_autoreleasePoolPush();
    v12((uint64_t)v9);
    objc_autoreleasePoolPop(v10);

    LODWORD(v9) = *((unsigned __int8 *)v17 + 24);
    _Block_object_dispose(&v16, 8);
    if ((_DWORD)v9) {
      return 1LL;
    }
  }

  sub_1000095A0(1, a3, @"SecDbStep SQLITE_ROW returned without a row handler");
  return 0LL;
}

uint64_t sub_10000AD6C(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
}

void sub_10000AD84(id a1, const char *a2)
{
  if (!stat(__b, &v7))
  {
    uint64_t v3 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)uint64_t v9 = __b;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "SecDbHandleCorrupt: Tried to write corruption marker %s but one already exists",  buf,  0xCu);
    }
  }

  uint64_t v4 = fopen(__b, "w");
  if (v4)
  {
    fclose(v4);
  }

  else
  {
    uint64_t v5 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = *__error();
      *(_DWORD *)__int128 buf = 67109378;
      *(_DWORD *)uint64_t v9 = v6;
      *(_WORD *)&void v9[4] = 2082;
      *(void *)&v9[6] = __b;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "SecDbHandleCorrupt: Unable (%{darwin.errno}d) to create corruption marker %{public}s",  buf,  0x12u);
    }
  }

uint64_t sub_10000AF08(void *a1, char *zSql, unint64_t nByte)
{
  uint64_t v15 = 0LL;
  uint64_t v7 = a1[5];
  int v6 = (CFTypeRef *)a1[6];
  uint64_t v8 = *(sqlite3 **)(v7 + 64);
  if (nByte >> 31)
  {
    uint64_t result = sub_1000095E8(18LL, *(sqlite3 **)(v7 + 64), v6, @"prepare_v2: sql bigger than INT_MAX");
LABEL_3:
    uint64_t v10 = 0LL;
  }

  else
  {
    for (int i = 0; ; ++i)
    {
      ppStmt = 0LL;
      uint64_t result = sqlite3_prepare_v2(v8, zSql, nByte, &ppStmt, (const char **)&v15);
      if (!(_DWORD)result) {
        break;
      }
      uint64_t result = sub_10000A29C(v7, result, (uint64_t)@"preparev2", i, v6);
      if ((result & 1) == 0) {
        goto LABEL_3;
      }
    }

    uint64_t v10 = ppStmt;
  }

  *(void *)(*(void *)(a1[4] + 8LL) + 24LL) = v10;
  CFRange v12 = (void *)a1[7];
  if (v12)
  {
    uint64_t v13 = v15 - zSql;
    if (v15 > zSql && v15 < &zSql[nByte])
    {
      *CFRange v12 = v13;
      v12[1] = nByte - v13;
    }
  }

  return result;
}

uint64_t sub_10000B004(uint64_t a1, const __CFString *a2)
{
  uint64_t v19 = 0LL;
  uint32_t v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  char v22 = 1;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2000000000LL;
  int v18 = -1;
  uint64_t v11 = 0LL;
  CFRange v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  CFTypeRef v14 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 0x40000000LL;
  void v10[2] = sub_10000B198;
  _OWORD v10[3] = &unk_100075FE8;
  v10[4] = &v19;
  v10[5] = &v11;
  v10[6] = &v15;
  v10[7] = a1;
  char v3 = sub_10000B220(a1, a2, &v14, (uint64_t)v10);
  if (*((_BYTE *)v20 + 24)) {
    char v4 = v3;
  }
  else {
    char v4 = 0;
  }
  *((_BYTE *)v20 + 24) = v4;
  if ((v4 & 1) == 0)
  {
    uint64_t v5 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = v12[3];
      *(_DWORD *)__int128 buf = 138412546;
      BOOL v24 = a2;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "SecDBGetInteger [%@] failed: %@", buf, 0x16u);
    }
  }

  uint64_t v7 = (const void *)v12[3];
  if (v7)
  {
    unint64_t v12[3] = 0LL;
    CFRelease(v7);
  }

  uint64_t v8 = *((unsigned int *)v16 + 6);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);
  return v8;
}

uint64_t sub_10000B198(void *a1, sqlite3_stmt *a2)
{
  uint64_t v3 = a1[6];
  uint64_t v4 = *(void *)(a1[5] + 8LL);
  v10[0] = _NSConcreteStackBlock;
  void v10[2] = sub_10000B31C;
  _OWORD v10[3] = &unk_100075FC0;
  uint64_t v5 = a1[7];
  v10[1] = 0x40000000LL;
  v10[4] = v3;
  v10[5] = a2;
  char v6 = sub_10000AC3C(v5, a2, (CFTypeRef *)(v4 + 24), (uint64_t)v10);
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  return 1LL;
}

unint64_t sub_10000B220(uint64_t a1, const __CFString *cf, CFTypeRef *a3, uint64_t a4)
{
  char v6 = cf;
  CFRetain(cf);
  unint64_t v8 = 1LL;
  if (v6)
  {
    do
    {
      CFStringRef v11 = 0LL;
      if ((v8 & 1) != 0)
      {
        unint64_t v8 = (unint64_t)sub_100009FBC(a1, v6, &v11, a3);
        if (v8)
        {
          if (a4)
          {
            int v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a4 + 16))(a4, v8);
          }

          else
          {
            sub_10000DE88(-50, (__CFString **)a3, @"SecDbWithSQL perform block missing");
            int v9 = 0;
          }

          unint64_t v8 = v9 & sub_10000A238((sqlite3_stmt *)v8, a3);
        }
      }

      else
      {
        sub_1000095A0(1, a3, @"Error with unexecuted sql remaining %@", v6);
        unint64_t v8 = 0LL;
      }

      CFRelease(v6);
      char v6 = v11;
    }

    while (v11);
  }

  return v8;
}

uint64_t sub_10000B31C(uint64_t a1, _BYTE *a2)
{
  uint64_t result = sqlite3_column_int(*(sqlite3_stmt **)(a1 + 40), 0);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  *a2 = 1;
  return result;
}

BOOL sub_10000B35C(uint64_t a1, uint64_t a2, CFTypeRef *a3, uint64_t a4)
{
  char v12 = 1;
  if (!*(_BYTE *)(a1 + 25))
  {
    if (a2 == 1)
    {
      int v9 = @"BEGIN IMMEDIATE";
    }

    else
    {
      if (a2 != 2)
      {
        sub_1000095A0(1, a3, @"invalid transaction type %d", a2);
        goto LABEL_15;
      }

      int v9 = @"BEGIN EXCLUSIVE";
    }

    if (!sqlite3_get_autocommit(*(sqlite3 **)(a1 + 64)) || (sub_100009ED0(a1, v9, a3) & 1) != 0)
    {
      *(_BYTE *)(a1 + 25) = 1;
      (*(void (**)(uint64_t, char *))(a4 + 16))(a4, &v12);
      uint64_t v25 = 0LL;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2000000000LL;
      char v28 = 1;
      v23[0] = 0LL;
      v23[1] = v23;
      void v23[2] = 0x2000000000LL;
      char v24 = 0;
      *(void *)__int128 buf = _NSConcreteStackBlock;
      uint64_t v15 = 0x40000000LL;
      uint64_t v16 = sub_10000B574;
      uint64_t v17 = &unk_100076170;
      char v22 = v12;
      int v18 = v23;
      uint64_t v19 = &v25;
      uint64_t v20 = a1;
      uint64_t v21 = a3;
      if (*(_BYTE *)(a1 + 24))
      {
        sub_10000B574((uint64_t)buf);
      }

      else
      {
        uint64_t v10 = *(dispatch_queue_s **)(*(void *)(a1 + 16) + 32LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 0x40000000LL;
        block[2] = sub_10000B7BC;
        block[3] = &unk_100076198;
        block[4] = buf;
        dispatch_barrier_sync(v10, block);
      }

      BOOL v6 = *((_BYTE *)v26 + 24) != 0;
      _Block_object_dispose(v23, 8);
      _Block_object_dispose(&v25, 8);
      return v12 && v6;
    }

LABEL_15:
    BOOL v6 = 0;
    return v12 && v6;
  }

  (*(void (**)(uint64_t, char *))(a4 + 16))(a4, &v12);
  if (!v12)
  {
    uint64_t v5 = (os_log_s *)sub_10000856C("#SecDB");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "#SecDB nested transaction asked to not be committed",  buf,  2u);
    }
  }

  BOOL v6 = 1;
  return v12 && v6;
}

  uint64_t v10 = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v10;
}

void sub_10000B574(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    if (!*(_BYTE *)(v3 + 24))
    {
      sub_10000B7C8(v3, 1LL);
      uint64_t v3 = *(void *)(a1 + 48);
    }

    char v4 = sub_100009ED0(v3, @"END", *(CFTypeRef **)(a1 + 56));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v4;
  }

  else
  {
    char v5 = sub_100009ED0(v3, @"ROLLBACK", *(CFTypeRef **)(a1 + 56));
    char v4 = 0;
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v5;
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v4;
  uint64_t v6 = *(void *)(a1 + 48);
  *(_BYTE *)(v6 + 25) = 0;
  if (!*(_BYTE *)(v6 + 24))
  {
    sub_10000B7C8(v6, 2LL * *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    uint64_t v6 = *(void *)(a1 + 48);
  }

  *(void *)(v6 + 32) = 1LL;
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(*(void *)(v6 + 16) + 165LL))
    {
      if (!*(_BYTE *)(v6 + 24))
      {
        int v7 = sub_10000B004(v6, @"pragma page_count");
        if (v7 >= 1)
        {
          int v8 = v7;
          int v9 = sub_10000B004(v6, @"pragma freelist_count");
          if ((v9 & 0x80000000) == 0)
          {
            LODWORD(v10) = v9;
            double v11 = (double)(v8 - (uint64_t)v9) / (double)v8;
            if (v9 >> 13 || v11 <= 0.85)
            {
              if (v11 >= 0.4) {
                uint64_t v10 = (uint64_t)((double)v9 * 0.2);
              }
              sql = 0LL;
              asprintf(&sql, "pragma incremental_vacuum(%d)", v10);
              if (sql)
              {
                errmsg = 0LL;
                int v12 = sqlite3_exec(*(sqlite3 **)(v6 + 64), sql, 0LL, 0LL, &errmsg);
                if (v12)
                {
                  int v13 = v12;
                  CFTypeRef v14 = (os_log_s *)sub_10000856C("SecError");
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)__int128 buf = 67109378;
                    int v18 = v13;
                    __int16 v19 = 2082;
                    uint64_t v20 = errmsg;
                    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "incremental_vacuum failed with: (%d) %{public}s",  buf,  0x12u);
                  }
                }

                sqlite3_free(errmsg);
                free(sql);
              }
            }
          }
        }
      }
    }
  }

uint64_t sub_10000B7BC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void sub_10000B7C8(uint64_t a1, uint64_t a2)
{
  char v4 = *(const void **)(a1 + 72);
  if (CFArrayGetCount((CFArrayRef)v4))
  {
    uint64_t v5 = *(void *)(a1 + 16);
    uint64_t v6 = (os_unfair_lock_s *)(v5 + 148);
    os_unfair_lock_lock((os_unfair_lock_t)(v5 + 148));
    int v7 = *(const __CFArray **)(v5 + 152);
    if (v7)
    {
      CFStringRef Copy = CFArrayCreateCopy(kCFAllocatorDefault, v7);
      os_unfair_lock_unlock(v6);
      if (Copy)
      {
        *(void *)(a1 + 72) = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
        context[0] = _NSConcreteStackBlock;
        context[1] = 0x40000000LL;
        context[2] = sub_10000B8EC;
        context[3] = &unk_1000762E0;
        context[4] = a1;
        context[5] = a2;
        void context[6] = v4;
        v10.size_t length = CFArrayGetCount(Copy);
        v10.location = 0LL;
        CFArrayApplyFunction(Copy, v10, (CFArrayApplierFunction)sub_10000B908, context);
        if (v4) {
          CFRelease(v4);
        }
        CFRelease(Copy);
      }
    }

    else
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(v5 + 148));
    }
  }

uint64_t sub_10000B8EC(void *a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, void, void, void, void))(a2 + 16))( a2,  a1[4],  a1[5],  *(void *)(a1[4] + 32LL),  a1[6]);
}

uint64_t sub_10000B908(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_10000B91C(uint64_t a1, int a2, void *a3, uint64_t a4)
{
  if (a2) {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 120), 0xFFFFFFFFFFFFFFFFLL);
  }
  else {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 56));
  }
  uint64_t v33 = 0LL;
  pthread_mutexattr_t v34 = &v33;
  uint64_t v35 = 0x2000000000LL;
  uint64_t v36 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2000000000LL;
  char v32 = 1;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000LL;
  char v28 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 0x40000000LL;
  uint64_t v21 = sub_10000BB58;
  char v22 = &unk_100076038;
  uint64_t v23 = &v33;
  char v24 = a3;
  int v8 = *(dispatch_queue_s **)(a1 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000BB88;
  block[3] = &unk_100076060;
  block[8] = a1;
  block[9] = a3;
  block[10] = a4;
  char v19 = a2;
  block[6] = &v25;
  block[7] = &v33;
  block[4] = v20;
  void block[5] = &v29;
  dispatch_sync(v8, block);
  int v9 = v34;
  if (*((_BYTE *)v30 + 24))
  {
    if (!v34[3])
    {
      char v17 = 0;
      uint64_t v10 = sub_10000C068(a1, a2);
      int v11 = ((uint64_t (*)(void *, uint64_t))v21)(v20, v10);
      int v9 = v34;
      if (v11)
      {
        char v12 = sub_10000C160(v34[3], (uint64_t)&v17, a4);
        int v9 = v34;
        if ((v12 & 1) == 0)
        {
          int v13 = (const void *)v34[3];
          if (v13)
          {
            v34[3] = 0LL;
            CFRelease(v13);
            int v9 = v34;
          }
        }
      }
    }
  }

  uint64_t v14 = v9[3];
  if (v14 && !*((_BYTE *)v26 + 24) && *(void *)(*(void *)(v14 + 16) + 136LL) && !*(_BYTE *)(v14 + 24))
  {
    uint64_t v15 = *(dispatch_queue_s **)(a1 + 24);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    void v16[2] = sub_10000C220;
    v16[3] = &unk_100076088;
    v16[4] = &v33;
    v16[5] = a1;
    v16[6] = a4;
    dispatch_sync(v15, v16);
    int v9 = v34;
  }

  if (a3) {
    *a3 = v9[3];
  }
  if (!v9[3])
  {
    if (a2) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 120));
    }
    else {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 56));
    }
    CFRelease((CFTypeRef)a1);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
}

BOOL sub_10000BB58(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = a2;
  int v2 = *(void **)(a1 + 40);
  if (v2) {
    *int v2 = a2;
  }
  return *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) != 0LL;
}

void sub_10000BB88(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  if (*(_BYTE *)(v2 + 128)) {
    goto LABEL_22;
  }
  char v4 = *(uint64_t **)(a1 + 72);
  uint64_t v3 = *(CFTypeRef **)(a1 + 80);
  uint64_t v5 = *(const __CFString **)(v2 + 16);
  CFTypeRef v34 = 0LL;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2000000000LL;
  char v37 = 1;
  cf[0] = _NSConcreteStackBlock;
  cf[1] = (CFTypeRef)0x40000000;
  cf[2] = sub_10000CA94;
  cf[3] = &unk_100076210;
  cf[4] = &v34;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  CFTypeRef v39 = sub_100008E78;
  uint64_t v40 = &unk_100075DC8;
  int v41 = cf;
  sub_100008D10(v5, (uint64_t)&buf);
  int v6 = *((unsigned __int8 *)v35 + 24);
  _Block_object_dispose(&v34, 8);
  if (v6)
  {
    unsigned __int8 v32 = 0;
    uint64_t v7 = sub_10000C068(v2, 0);
    if (v7)
    {
      uint64_t v8 = v7;
      cf[0] = 0LL;
      if ((sub_10000C160(v7, (uint64_t)&v32, (uint64_t)cf) & 1) != 0)
      {
        CFTypeRef v9 = cf[0];
        if (cf[0])
        {
          cf[0] = 0LL;
          CFRelease(v9);
        }

        if (v4) {
          *char v4 = v8;
        }
        uint64_t v10 = (os_log_s *)sub_10000856C("#SecDB");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "#SecDB starting maintenance",  (uint8_t *)&buf,  2u);
        }

        if (*(_BYTE *)(v8 + 40)) {
          goto LABEL_12;
        }
        uint64_t v27 = *(void *)(v8 + 16);
        uint64_t v28 = *(void *)(v27 + 136);
        if (v28)
        {
          CFTypeRef v34 = 0LL;
          *(_BYTE *)(v27 + 144) = 0;
          int v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, CFTypeRef *))(v28 + 16))( v28,  v27,  v8,  v32,  v27 + 144,  &v34);
          *(_BYTE *)(v2 + 128) = v11;
          if ((v11 & 1) == 0)
          {
            uint64_t v29 = (os_log_s *)sub_10000856C("SecError");
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 138412290;
              *(void *)((char *)&buf + 4) = v34;
              _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "opened block failed: %@",  (uint8_t *)&buf,  0xCu);
            }
          }

          if (!v3 || *(_BYTE *)(v8 + 40) || *v3)
          {
            if (v34)
            {
              uint64_t v30 = (os_log_s *)sub_10000856C("SecError");
              if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf) = 138412290;
                *(void *)((char *)&buf + 4) = v34;
                _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "opened block failed: error (%@) is being released and lost",  (uint8_t *)&buf,  0xCu);
              }

              CFTypeRef v31 = v34;
              if (v34)
              {
                CFTypeRef v34 = 0LL;
                CFRelease(v31);
              }
            }
          }

          else
          {
            *uint64_t v3 = v34;
          }

          if (*(_BYTE *)(v8 + 40)) {
LABEL_12:
          }
            int v11 = sub_10000A9BC(v8, 0LL, v3);
        }

        else
        {
          int v11 = 0;
        }

        char v12 = (os_log_s *)sub_10000856C("#SecDB");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(buf) = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "#SecDB ending maintenance",  (uint8_t *)&buf,  2u);
          if (!v11)
          {
LABEL_16:
            CFRelease((CFTypeRef)v8);
            if (v4) {
              *char v4 = 0LL;
            }
            goto LABEL_20;
          }
        }

        else if (!v11)
        {
          goto LABEL_16;
        }

        CFArrayAppendValue(*(CFMutableArrayRef *)(v2 + 40), (const void *)v8);
        goto LABEL_16;
      }

      char v22 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(CFTypeRef *)((char *)&buf + 4) = cf[0];
        _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "Unable to create database: %@",  (uint8_t *)&buf,  0xCu);
      }

      if (cf[0])
      {
        CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)cf[0]);
        if (CFEqual(Domain, @"com.apple.utilities.sqlite3"))
        {
          int Code = CFErrorGetCode((CFErrorRef)cf[0]);
          BOOL v26 = Code == 11 || Code == 26;
          *(_BYTE *)(v8 + 40) = v26;
        }
      }

      LOBYTE(v11) = 0;
      if (!v3 || *(_BYTE *)(v8 + 40)) {
        goto LABEL_20;
      }
      if (!*v3)
      {
        LOBYTE(v11) = 0;
        *uint64_t v3 = cf[0];
        goto LABEL_20;
      }
    }
  }

  else
  {
    CFIndex v13 = *__error();
    uint64_t v14 = __error();
    sub_10000DE58( v13,  kCFErrorDomainPOSIX,  v15,  v3,  v16,  @"Unable to process corruption marker: %{darwin.errno}d",  *v14);
  }

  LOBYTE(v11) = 0;
LABEL_20:
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v11;
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = v11;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL)) {
    return;
  }
  uint64_t v2 = *(void *)(a1 + 64);
LABEL_22:
  uint64_t v17 = 48LL;
  if (!*(_BYTE *)(a1 + 88)) {
    uint64_t v17 = 40LL;
  }
  int v18 = *(const __CFArray **)(v2 + v17);
  if (CFArrayGetCount(v18) && !*(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL))
  {
    uint64_t v19 = *(void *)(a1 + 32);
    ValueAtIndex = CFArrayGetValueAtIndex(v18, 0LL);
    if ((*(unsigned int (**)(uint64_t, const void *))(v19 + 16))(v19, ValueAtIndex))
    {
      uint64_t v21 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
      if (v21) {
        CFRetain(v21);
      }
    }

    CFArrayRemoveValueAtIndex(v18, 0LL);
  }

uint64_t sub_10000C068(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000C82C;
  block[3] = &unk_100076128;
  block[4] = &qword_100082B10;
  if (qword_100082B08 != -1) {
    dispatch_once(&qword_100082B08, block);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_100082B10, 64LL, 0LL);
  uint64_t v5 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = a1;
    *(_BYTE *)(Instance + 24) = a2;
    *(_BYTE *)(Instance + 25) = 0;
    *(void *)(Instance + 32) = 2LL;
    *(_BYTE *)(Instance + 40) = 0;
    *(_DWORD *)(Instance + 44) = 0;
    *(_BYTE *)(Instance + 48) = 0;
    *(void *)(Instance + 56) = 0LL;
    *(void *)(Instance + 64) = 0LL;
    *(void *)(Instance + 72) = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  }

  return v5;
}

uint64_t sub_10000C160(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  char v10 = 1;
  uint64_t v3 = *(const __CFString **)(*(void *)(a1 + 16) + 16LL);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000LL;
  _OWORD v6[2] = sub_10000C2C8;
  v6[3] = &unk_100076238;
  v6[4] = &v7;
  void v6[5] = a1;
  v6[6] = a2;
  v6[7] = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000LL;
  void v11[2] = sub_100008E78;
  v11[3] = &unk_100075DC8;
  v11[4] = v6;
  sub_100008D10(v3, (uint64_t)v11);
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_10000C220(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 16LL);
  if (*(_BYTE *)(v1 + 144))
  {
    *(_BYTE *)(v1 + 144) = 0;
    if (((*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)
                                                       + 16LL)
                                           + 136LL)
                               + 16LL))() & 1) == 0)
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8LL);
      uint64_t v4 = *(_BYTE **)(v3 + 24);
      if (!v4[40]
        || (sub_10000A9BC((uint64_t)v4, 0LL, *(CFTypeRef **)(a1 + 48)) & 1) == 0
        && (v3 = *(void *)(*(void *)(a1 + 32) + 8LL), (uint64_t v4 = *(_BYTE **)(v3 + 24)) != 0LL))
      {
        *(void *)(v3 + 24) = 0LL;
        CFRelease(v4);
      }
    }
  }

void sub_10000C2C8(uint64_t a1, char *filename)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(_BYTE *)(*(void *)(v4 + 16) + 162LL))
  {
    if (*(_BYTE *)(v4 + 24)) {
      uint64_t v5 = 4194305LL;
    }
    else {
      uint64_t v5 = 4194306LL;
    }
  }

  else
  {
    uint64_t v5 = 4194305LL;
  }

  if (*(void *)(a1 + 48)) {
    BOOL v6 = sub_10000C4E4(v4, filename, v5, 0LL);
  }
  else {
    BOOL v6 = 0;
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v6;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (!*(_BYTE *)(v7 + 24))
  {
    *(_BYTE *)(v7 + 24) = 1;
    if (*(void *)(a1 + 48))
    {
      uint64_t v8 = dirname(filename);
      if (v8)
      {
        uint64_t v9 = v8;
        unsigned int v10 = *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 40) + 16LL) + 160LL);
        uint64_t v11 = mkpath_np(v8, (v10 >> 2) & 0x49 | v10);
        if ((_DWORD)v11 && (_DWORD)v11 != 17)
        {
          uint64_t v13 = v11;
          CFIndex v14 = (int)v11;
          uint64_t v15 = *(CFTypeRef **)(a1 + 56);
          uint64_t v16 = strerror(v11);
          sub_10000DE58(v14, kCFErrorDomainPOSIX, v17, v15, v18, @"mkpath_np %s: [%d] %s", v9, v13, v16);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
        }
      }
    }

    uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
    if (*(_BYTE *)(v19 + 24))
    {
      BOOL v20 = sub_10000C4E4(*(void *)(a1 + 40), filename, 4194310LL, *(CFTypeRef **)(a1 + 56));
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 8LL);
    }

    else
    {
      BOOL v20 = 0;
    }

    *(_BYTE *)(v19 + 24) = v20;
    if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
    {
      chmod(filename, *(_WORD *)(*(void *)(*(void *)(a1 + 40) + 16LL) + 160LL));
      uint64_t v21 = *(_BYTE **)(a1 + 48);
      if (v21) {
        *uint64_t v21 = 1;
      }
    }
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    if (qword_100082B18 != -1) {
      dispatch_once(&qword_100082B18, &stru_100076278);
    }
    if (dword_100082B20) {
      sqlite3_trace_v2( *(sqlite3 **)(*(void *)(a1 + 40) + 64LL),  dword_100082B20,  (int (__cdecl *)(unsigned int, void *, void *, void *))sub_10000C668,  *(void **)(a1 + 40));
    }
  }

BOOL sub_10000C4E4(uint64_t a1, char *filename, uint64_t a3, CFTypeRef *a4)
{
  uint64_t v8 = *(void *)(a1 + 16);
  int v9 = *(unsigned __int8 *)(v8 + 164);
  int v10 = *(unsigned __int8 *)(v8 + 165);
  ppDb = 0LL;
  uint64_t v11 = sqlite3_open_v2(filename, &ppDb, a3, 0LL);
  if ((_DWORD)v11)
  {
    if (ppDb)
    {
      sub_1000095E8(v11, ppDb, a4, @"open_v2 %s 0x%X", filename, a3);
      sqlite3_close(ppDb);
      ppDb = 0LL;
    }

    else
    {
      sub_1000095A0(v11, a4, @"open_v2 %s 0x%X", filename, a3);
    }

    goto LABEL_16;
  }

  if ((a3 & 2) == 0) {
    goto LABEL_16;
  }
  if (v10)
  {
    ppStmt = 0LL;
    if (!sqlite3_prepare_v2(ppDb, "PRAGMA auto_vacuum", -1, &ppStmt, 0LL))
    {
      if (sqlite3_step(ppStmt) == 100)
      {
        int v12 = sqlite3_column_int(ppStmt, 0);
        sqlite3_finalize(ppStmt);
        if (v12 == 2) {
          goto LABEL_13;
        }
      }

      else
      {
        sqlite3_finalize(ppStmt);
      }
    }

    sqlite3_exec(ppDb, "PRAGMA auto_vacuum = incremental", 0LL, 0LL, 0LL);
    sqlite3_exec(ppDb, "VACUUM", 0LL, 0LL, 0LL);
  }

LABEL_13:
  if (v9) {
    sqlite3_exec(ppDb, "PRAGMA journal_mode = WAL", 0LL, 0LL, 0LL);
  }
  sqlite3_busy_timeout(ppDb, 5000);
LABEL_16:
  uint64_t v13 = ppDb;
  *(void *)(a1 + 64) = ppDb;
  return v13 != 0LL;
}

  uint64_t v18 = v15;
  uint64_t v19 = objc_opt_class(&OBJC_CLASS___NSArray);
  BOOL v20 = objc_opt_isKindOfClass(v18, v19);

  if ((v20 & 1) != 0)
  {
    uint64_t v21 = sub_100011514(v18);
    uint64_t v15 = (id)objc_claimAutoreleasedReturnValue(v21);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

uint64_t sub_10000C668()
{
  return 0LL;
}

void sub_10000C670(id a1)
{
  uint64_t v1 = (os_log_s *)sub_10000856C("#SecDB");
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = dword_100082B20;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "sqlDb: sql trace mask: 0x%08x",  (uint8_t *)v2,  8u);
  }

uint64_t sub_10000C754()
{
  if (!csr_check(16LL))
  {
    uint64_t v1 = (const __CFBoolean *)CFPreferencesCopyValue( @"SQLProfile",  @"com.apple.security",  kCFPreferencesAnyUser,  kCFPreferencesAnyHost);
    if (v1)
    {
      uint64_t v2 = v1;
      CFTypeID v3 = CFGetTypeID(v1);
      if (v3 == CFBooleanGetTypeID())
      {
        BOOL v4 = CFBooleanGetValue(v2) == 0;
      }

      else
      {
        CFTypeID v5 = CFGetTypeID(v2);
        if (v5 != CFNumberGetTypeID())
        {
          uint64_t v0 = 0LL;
LABEL_12:
          CFRelease(v2);
          return v0;
        }

        int valuePtr = 0;
        CFNumberGetValue(v2, kCFNumberSInt32Type, &valuePtr);
        BOOL v4 = valuePtr == 0;
      }

      uint64_t v0 = !v4;
      goto LABEL_12;
    }
  }

  return 0LL;
}

uint64_t sub_10000C82C(uint64_t a1)
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000760C8);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_10000C85C(uint64_t a1)
{
  uint64_t v2 = *(sqlite3 **)(a1 + 64);
  if (v2 && (int v3 = sqlite3_close(v2)) != 0)
  {
    int v10 = v3;
    BOOL v6 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(*(void *)(a1 + 16) + 16LL);
      uint64_t v8 = sqlite3_errmsg(*(sqlite3 **)(a1 + 64));
      *(_DWORD *)__int128 buf = 67109634;
      int v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      __int16 v15 = 2080;
      uint64_t v16 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "failed to close database connection (%d) for %@: %s",  buf,  0x1Cu);
    }

    uint64_t v9 = _os_assert_log(0LL);
    _os_crash(v9);
    __break(1u);
  }

  else
  {
    *(void *)(a1 + 16) = 0LL;
    BOOL v4 = *(const void **)(a1 + 72);
    if (v4)
    {
      *(void *)(a1 + 72) = 0LL;
      CFRelease(v4);
    }

    CFTypeID v5 = *(const void **)(a1 + 56);
    if (v5)
    {
      *(void *)(a1 + 56) = 0LL;
      CFRelease(v5);
    }
  }

CFStringRef sub_10000C9A0(uint64_t a1)
{
  uint64_t v1 = "ro";
  if (!*(_BYTE *)(a1 + 24)) {
    uint64_t v1 = "rw";
  }
  if (*(void *)(a1 + 64)) {
    uint64_t v2 = "open";
  }
  else {
    uint64_t v2 = "closed";
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"<SecDbConnection %s %s>", v1, v2);
}

CFStringRef sub_10000CA14(uint64_t a1)
{
  uint64_t v2 = "ro";
  if (!*(_BYTE *)(a1 + 24)) {
    uint64_t v2 = "rw";
  }
  if (*(void *)(a1 + 64)) {
    int v3 = "open";
  }
  else {
    int v3 = "closed";
  }
  return CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"<SecDbConnection %s %s>", v2, v3);
}

void sub_10000CA94(uint64_t a1, const char *a2)
{
  if (!stat(__b, &v18))
  {
    uint64_t v9 = (os_log_s *)sub_10000856C("SecWarning");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 136315138;
      *(void *)BOOL v20 = __b;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SecDbSecDbProcessCorruptionMarker: found corruption marker %s",  buf,  0xCu);
    }

    if (remove(__b))
    {
      int v10 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *__error();
        *(_DWORD *)__int128 buf = 67109120;
        *(_DWORD *)BOOL v20 = v11;
        int v12 = "SecDbSecDbProcessCorruptionMarker: Unable (%{darwin.errno}d) to delete corruption marker";
        __int16 v13 = v10;
        uint32_t v14 = 8;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
      }
    }

    else
    {
      if (!remove(a2) || *__error() == 2)
      {
        __int16 v15 = (os_log_s *)sub_10000856C("SecWarning");
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          return;
        }
        *(_DWORD *)__int128 buf = 136446210;
        *(void *)BOOL v20 = a2;
        BOOL v6 = "SecDbSecDbProcessCorruptionMarker: deleted corrupt db %{public}s";
        uint64_t v7 = v15;
        uint32_t v8 = 12;
        goto LABEL_16;
      }

      uint64_t v16 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = *__error();
        *(_DWORD *)__int128 buf = 67109378;
        *(_DWORD *)BOOL v20 = v17;
        *(_WORD *)&void v20[4] = 2082;
        *(void *)&v20[6] = a2;
        int v12 = "SecDbSecDbProcessCorruptionMarker: Unable (%{darwin.errno}d) to delete db %{public}s";
        __int16 v13 = v16;
        uint32_t v14 = 18;
        goto LABEL_10;
      }
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    return;
  }

  if (*__error() != 2)
  {
    BOOL v4 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = *__error();
      *(_DWORD *)__int128 buf = 67109120;
      *(_DWORD *)BOOL v20 = v5;
      BOOL v6 = "SecDbSecDbProcessCorruptionMarker: Unable to check for corruption marker: %{darwin.errno}d";
      uint64_t v7 = v4;
      uint32_t v8 = 8;
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }

void sub_10000CD4C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 24);
  BOOL v4 = *(dispatch_queue_s **)(v2 + 24);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000CDE4;
  block[3] = &unk_1000760A8;
  block[4] = a1;
  void block[5] = v2;
  char v6 = v3;
  dispatch_sync(v4, block);
  if (v3) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 120));
  }
  else {
    pthread_mutex_unlock((pthread_mutex_t *)(v2 + 56));
  }
  CFRelease((CFTypeRef)a1);
  CFRelease((CFTypeRef)v2);
}

void sub_10000CDE4(uint64_t a1)
{
  if (!*(_BYTE *)(*(void *)(a1 + 32) + 48LL))
  {
    CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 48LL));
    CFIndex v4 = CFArrayGetCount(*(CFArrayRef *)(*(void *)(a1 + 40) + 40LL)) + Count;
    uint64_t v5 = 48LL;
    if (!*(_BYTE *)(a1 + 48)) {
      uint64_t v5 = 40LL;
    }
    char v6 = *(const __CFArray **)(*(void *)(a1 + 40) + v5);
    unint64_t v7 = CFArrayGetCount(v6);
    if (*(_BYTE *)(a1 + 48)) {
      unint64_t v8 = 5LL;
    }
    else {
      unint64_t v8 = 1LL;
    }
    CFIndex v9 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 166LL);
    if (v7 < v8 && v4 < v9)
    {
      CFArrayAppendValue(v6, *(const void **)(a1 + 32));
      return;
    }

    if (v9 < 6)
    {
      uint64_t v16 = (os_log_s *)sub_10000856C("dbconn");
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v17 = "ro";
      if (!*(_BYTE *)(a1 + 48)) {
        int v17 = "rw";
      }
      int v18 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 166LL);
      int v19 = 136315394;
      BOOL v20 = v17;
      __int16 v21 = 1024;
      int v22 = v18;
      __int16 v13 = "releasing %s connection rather than storing in size %d cache";
      uint32_t v14 = v16;
      uint32_t v15 = 18;
    }

    else
    {
      int v11 = (os_log_s *)sub_10000856C("SecError");
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      if (*(_BYTE *)(a1 + 48)) {
        int v12 = "ro";
      }
      else {
        int v12 = "rw";
      }
      int v19 = 136315138;
      BOOL v20 = v12;
      __int16 v13 = "dbconn: did not expect to run out of room in the %s cache when releasing connection";
      uint32_t v14 = v11;
      uint32_t v15 = 12;
    }

    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v19, v15);
    return;
  }

  uint64_t v2 = (os_log_s *)sub_10000856C("SecWarning");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v19) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "SecDbConnectionRelease: IO failure reported in connection, throwing away currently idle caches",  (uint8_t *)&v19,  2u);
  }

  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(void *)(a1 + 40) + 40LL));
  CFArrayRemoveAllValues(*(CFMutableArrayRef *)(*(void *)(a1 + 40) + 48LL));
}

BOOL sub_10000D038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = 0LL;
  sub_10000B91C(a1, 1, &v6, a2);
  uint64_t v4 = v6;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v6);
    sub_10000CD4C(v4);
  }

  return v4 != 0;
}

uint64_t sub_10000D098(uint64_t a1, __CFString **a2, uint64_t a3)
{
  if (a1)
  {
    uint64_t v6 = 0LL;
    sub_10000B91C(a1, 0, &v6, (uint64_t)a2);
    uint64_t v4 = v6;
    if (v6)
    {
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, v6);
      sub_10000CD4C(v4);
      return 1LL;
    }
  }

  else
  {
    sub_10000DE88(-25291, a2, @"failed to get a db handle");
  }

  return 0LL;
}

BOOL sub_10000D114(sqlite3_stmt *a1, uint64_t a2, const void *a3, unint64_t a4, CFTypeRef *a5)
{
  if (a4 >> 31) {
    return sub_100009708(18LL, a1, a5, @"bind_blob[%d]: blob bigger than INT_MAX", a2);
  }
  uint64_t v9 = sqlite3_bind_blob(a1, a2, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return sub_100009708(v9, a1, a5, @"bind_blob[%d]", a2);
}

BOOL sub_10000D18C(sqlite3_stmt *a1, uint64_t a2, const char *a3, unint64_t a4, CFTypeRef *a5)
{
  if (a4 >> 31) {
    return sub_100009708(18LL, a1, a5, @"bind_text[%d]: text bigger than INT_MAX", a2);
  }
  uint64_t v9 = sqlite3_bind_text(a1, a2, a3, a4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  return sub_100009708(v9, a1, a5, @"bind_text[%d]", a2);
}

uint64_t sub_10000D204(uint64_t a1, sqlite3_stmt *pStmt, CFTypeRef *a3, uint64_t a4)
{
  for (uint64_t i = 0LL; ; uint64_t i = (i + 1))
  {
    if (*(_BYTE *)(a1 + 24) && !sqlite3_stmt_readonly(pStmt))
    {
      uint64_t v9 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = sqlite3_sql(pStmt);
        *(_DWORD *)__int128 buf = 136315138;
        uint32_t v15 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "SecDbForEach: SecDbConnection is readonly but we're about to write: %s",  buf,  0xCu);
      }
    }

    uint64_t v11 = sqlite3_step(pStmt);
    if ((_DWORD)v11 != 100) {
      break;
    }
    if (a4)
    {
    }

    else
    {
      int v12 = sqlite3_sql(pStmt);
      sub_1000095A0(100, a3, @"step[%d]: %s returned SQLITE_ROW with NULL row block", i, v12);
    }
  }

  if ((_DWORD)v11 == 101) {
    return 1LL;
  }
  sub_10000A450(a1, v11, a3, @"SecDbForEach step[%d]", i);
  return 0LL;
}

void sub_10000D38C(id a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  sub_10000D440(Mutable, byte_10006197E, 1);
  sub_10000D440(Mutable, byte_10006199E, 1);
  sub_10000D440(Mutable, byte_1000619BE, 1);
  sub_10000D440(Mutable, byte_1000619DE, 0);
  sub_10000D440(Mutable, byte_1000619FE, 0);
  sub_10000D440(Mutable, byte_100061A1E, 0);
  qword_100082B50 = (uint64_t)Mutable;
}

void sub_10000D440(const __CFDictionary *a1, const UInt8 *a2, int a3)
{
  CFDataRef v5 = CFDataCreateWithBytesNoCopy(0LL, a2, 32LL, kCFAllocatorNull);
  if (CFDictionaryGetValue(a1, v5)) {
    abort();
  }
  uint64_t v6 = (const void **)&kCFBooleanTrue;
  if (!a3) {
    uint64_t v6 = (const void **)&kCFBooleanFalse;
  }
  CFDictionarySetValue(a1, v5, *v6);
  if (v5) {
    CFRelease(v5);
  }
}

uint64_t sub_10000D4D8(uint64_t a1, char a2)
{
  uint64_t v3 = SecCertificateCopySHA256Digest();
  if (!v3) {
    return 0LL;
  }
  uint64_t v4 = (const void *)v3;
  if (qword_100082B48 != -1) {
    dispatch_once(&qword_100082B48, &stru_100076380);
  }
  if (!qword_100082B50)
  {
LABEL_13:
    uint64_t v6 = 0LL;
    goto LABEL_11;
  }

  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100082B50, v4);
  uint64_t v6 = (uint64_t)Value;
  if (Value)
  {
    CFTypeID v7 = CFGetTypeID(Value);
    if (v7 == CFBooleanGetTypeID())
    {
      int v8 = CFBooleanGetValue((CFBooleanRef)v6);
      uint64_t v6 = v8 != 0;
      if ((a2 & 1) != 0)
      {
        int v9 = v8;
        unsigned int v10 = SecIsInternalRelease() | ((a2 & 2) >> 1);
        if (v9) {
          uint64_t v6 = 1LL;
        }
        else {
          uint64_t v6 = v10;
        }
      }

      goto LABEL_11;
    }

    goto LABEL_13;
  }

LABEL_11:
  CFRelease(v4);
  return v6;
}

    if (v5) {
      goto LABEL_12;
    }
  }

  return v5;
}

  return v16;
}

CFBooleanRef sub_10000D5AC(void *key)
{
  if (qword_100082B28 == -1)
  {
    if (!key) {
      return 0LL;
    }
  }

  else
  {
    dispatch_once(&qword_100082B28, &stru_100076320);
    if (!key) {
      return 0LL;
    }
  }

  uint64_t result = (const __CFBoolean *)qword_100082B30;
  if (qword_100082B30)
  {
    uint64_t result = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)qword_100082B30, key);
    if (result)
    {
      uint64_t v3 = result;
      CFTypeID v4 = CFGetTypeID(result);
      if (v4 == CFBooleanGetTypeID()) {
        return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
      }
      return 0LL;
    }
  }

  return result;
}

void sub_10000D63C(id a1)
{
  CFMutableArrayRef Mutable = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDataRef v2 = CFDataCreateWithBytesNoCopy(0LL, byte_10006030C, 32LL, kCFAllocatorNull);
  CFDictionarySetValue(Mutable, v2, kCFBooleanTrue);
  if (v2) {
    CFRelease(v2);
  }
  CFDataRef v3 = CFDataCreateWithBytesNoCopy(0LL, byte_10006032C, 32LL, kCFAllocatorNull);
  CFDictionarySetValue(Mutable, v3, kCFBooleanTrue);
  if (v3) {
    CFRelease(v3);
  }
  qword_100082B30 = (uint64_t)Mutable;
}

uint64_t sub_10000D70C(char a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10000D780;
  block[3] = &unk_100076340;
  char v3 = a1;
  if (qword_100082B40 != -1) {
    dispatch_once(&qword_100082B40, block);
  }
  return qword_100082B38;
}

void sub_10000D780(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 3LL, &kCFTypeArrayCallBacks);
  sub_10000D840(Mutable);
  sub_10000D840(Mutable);
  sub_10000D840(Mutable);
  if ((SecIsInternalRelease() & 1) != 0 || *(_BYTE *)(a1 + 32))
  {
    sub_10000D840(Mutable);
    sub_10000D840(Mutable);
    sub_10000D840(Mutable);
  }

  qword_100082B38 = (uint64_t)Mutable;
}

void sub_10000D840(const __CFArray *a1)
{
  CFDataRef v2 = (const void *)SecCertificateCreateWithBytes(0LL);
  v3.size_t length = CFArrayGetCount(a1);
  v3.location = 0LL;
  if (CFArrayContainsValue(a1, v3, v2)) {
    abort();
  }
  CFArrayAppendValue(a1, v2);
  if (v2) {
    CFRelease(v2);
  }
}

CFMutableArrayRef sub_10000D8AC(unsigned __int16 *a1, unint64_t a2)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v5 = Mutable;
  if (a2 < 3 || !Mutable) {
    goto LABEL_11;
  }
  unint64_t v6 = __rev16(*a1);
  if (v6 != a2 - 2)
  {
LABEL_12:
    CFRelease(v5);
    return 0LL;
  }

  CFTypeID v7 = (const UInt8 *)(a1 + 1);
  if (v6)
  {
    while (v6 != 1)
    {
      unint64_t v8 = __rev16(*(unsigned __int16 *)v7);
      BOOL v9 = v6 - 2 >= v8;
      unint64_t v6 = v6 - 2 - v8;
      if (!v9) {
        break;
      }
      unsigned int v10 = v7 + 2;
      CFDataRef v11 = CFDataCreate(kCFAllocatorDefault, v10, v8);
      if (!v11) {
        break;
      }
      CFDataRef v12 = v11;
      CFTypeID v7 = &v10[v8];
      CFArrayAppendValue(v5, v11);
      CFRelease(v12);
      if (!v6) {
        return v5;
      }
    }

uint64_t sub_10000D994(const __CFNumber *a1, CFTypeRef *a2)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    unint64_t v5 = HIBYTE(valuePtr);
    if ((HIBYTE(valuePtr) + 1) > 1u)
    {
      uint64_t v11 = 8LL;
    }

    else
    {
      uint64_t v6 = 9LL;
      uint64_t v7 = 48LL;
      uint64_t v8 = 1LL;
      while ((unint64_t)(v6 - 2) >= 2)
      {
        uint64_t v9 = valuePtr >> v7;
        --v6;
        v7 -= 8LL;
        if ((_DWORD)v5 != v9)
        {
          uint64_t v8 = v6 - 1;
          goto LABEL_10;
        }
      }

      uint64_t v6 = 2LL;
LABEL_10:
      else {
        uint64_t v11 = v8;
      }
    }

    return ccder_sizeof(2LL, v11);
  }

  else
  {
    sub_10000DE58(-4LL, @"com.apple.security.cfder.error", v3, a2, v4, @"Unable to get number from data");
    return 0LL;
  }

uint64_t sub_10000DA6C(const __CFNumber *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4)
{
  uint64_t valuePtr = 0xAAAAAAAAAAAAAAAALL;
  if (!CFNumberGetValue(a1, kCFNumberLongLongType, &valuePtr))
  {
    sub_10000DE58(-4LL, @"com.apple.security.cfder.error", v7, a2, v8, @"Unable to get number from data");
    return 0LL;
  }

  uint64_t v9 = valuePtr;
  unint64_t v10 = HIBYTE(valuePtr);
  if ((HIBYTE(valuePtr) + 1) > 1u)
  {
    unint64_t v15 = 8LL;
    if (!a4) {
      goto LABEL_22;
    }
  }

  else
  {
    uint64_t v11 = 9LL;
    uint64_t v12 = 48LL;
    uint64_t v13 = 1LL;
    while ((unint64_t)(v11 - 2) >= 2)
    {
      uint64_t v14 = valuePtr >> v12;
      --v11;
      v12 -= 8LL;
      if ((_DWORD)v10 != v14)
      {
        uint64_t v13 = v11 - 1;
        goto LABEL_11;
      }
    }

    uint64_t v11 = 2LL;
LABEL_11:
    else {
      unint64_t v15 = v13;
    }
    if (!a4) {
      goto LABEL_22;
    }
  }

  if (a4 - a3 < (uint64_t)v15)
  {
LABEL_22:
    sub_10000DE58(-3LL, @"com.apple.security.cfder.error", v7, a2, v8, @"Unknown size");
    return 0LL;
  }

  if (v15 <= 1) {
    uint64_t v16 = 1LL;
  }
  else {
    uint64_t v16 = v15;
  }
  do
  {
    *(_BYTE *)--a4 = v9;
    v9 >>= 8;
    --v16;
  }

  while (v16);
  uint64_t valuePtr = v9;
  uint64_t result = ccder_encode_tl(2LL);
  if (!result)
  {
    sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v18, a2, v19, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_10000DBBC( CFIndex a1, const __CFString *a2, __CFString *cf, CFTypeRef *a4, CFStringRef format, va_list arguments)
{
  if (!a4) {
    return;
  }
  if (*a4)
  {
    if (cf)
    {
      if (*a4 != cf) {
        CFRelease(cf);
      }
    }

    return;
  }

  unint64_t v10 = CFStringCreateWithFormatAndArguments(0LL, 0LL, format, arguments);
  uint64_t v28 = 0LL;
  if (!cf) {
    goto LABEL_28;
  }
  uint64_t v11 = CFErrorCopyUserInfo((CFErrorRef)cf);
  Value = (const __CFString *)CFDictionaryGetValue(v11, kCFErrorDescriptionKey);
  if (Value)
  {
    BOOL v13 = CFStringCompare(v10, Value, 0LL) == kCFCompareEqualTo;
    if (!v11) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  BOOL v13 = 0;
  if (v11) {
LABEL_9:
  }
    CFRelease(v11);
LABEL_10:
  CFIndex Code = CFErrorGetCode((CFErrorRef)cf);
  CFErrorDomain Domain = CFErrorGetDomain((CFErrorRef)cf);
  CFComparisonResult v16 = CFStringCompare(a2, Domain, 0LL);
  BOOL v18 = Code == a1 && v16 == kCFCompareEqualTo && v13;
  uint64_t v19 = cf;
  if (v18) {
    goto LABEL_17;
  }
  __int16 v21 = CFErrorCopyUserInfo((CFErrorRef)cf);
  if (v21)
  {
    int v22 = v21;
    uint64_t v23 = (const void *)kSOSCountKey;
    if (CFDictionaryContainsKey(v21, kSOSCountKey) == 1)
    {
      char v24 = (const __CFNumber *)CFDictionaryGetValue(v22, v23);
      if (v24)
      {
        uint64_t valuePtr = 0LL;
        CFNumberGetValue(v24, kCFNumberLongType, &valuePtr);
        if (valuePtr > 199)
        {
          CFRelease(v22);
          uint64_t v19 = cf;
LABEL_17:
          CFRetain(v19);
          *a4 = cf;
          CFRelease(cf);
          if (!v10) {
            return;
          }
          BOOL v20 = v10;
          goto LABEL_42;
        }

        uint64_t v28 = valuePtr + 1;
      }
    }

    CFRelease(v22);
  }

void sub_10000DE58(CFIndex a1, const __CFString *a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, CFStringRef format, ...)
{
}

void sub_10000DE88(int a1, __CFString **a2, CFStringRef format, ...)
{
  CFTypeRef cf = 0LL;
  if (a2)
  {
    sub_10000DBBC(a1, kCFErrorDomainOSStatus, *a2, &cf, format, va);
    *a2 = (__CFString *)cf;
  }

  else
  {
    sub_10000DBBC(a1, kCFErrorDomainOSStatus, 0LL, &cf, format, va);
    CFTypeRef v4 = cf;
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(v4);
    }
  }

const UInt8 *sub_10000DF08( const __CFAllocator *a1, CFTypeRef *a2, CFTypeRef *a3, const UInt8 *a4, _BYTE *a5)
{
  unint64_t v5 = a4;
  if (!a4)
  {
    uint64_t v14 = @"null input";
    CFIndex v15 = -6LL;
    goto LABEL_12;
  }

  uint64_t v94 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_decode_tag(&v94, a4, a5))
  {
    CFComparisonResult v16 = @"invalid tag";
    goto LABEL_14;
  }

  if (v94 <= 17)
  {
    switch(v94)
    {
      case 1LL:
        CFIndex length = 0LL;
        uint64_t v12 = (_BYTE *)ccder_decode_tl(1LL, &length, v5, a5);
        if (!v12 || a5 - v12 < 1 || length != 1)
        {
          CFComparisonResult v16 = @"Unknown BOOLean encoding";
          goto LABEL_14;
        }

        unint64_t v5 = v12 + 1;
        if (*v12) {
          BOOL v13 = &kCFBooleanTrue;
        }
        else {
          BOOL v13 = &kCFBooleanFalse;
        }
        goto LABEL_54;
      case 2LL:
        CFIndex length = 0LL;
        int v41 = (UInt8 *)ccder_decode_tl(2LL, &length, v5, a5);
        if (!v41 || (uint64_t v42 = v41, a5 - v41 < length))
        {
          CFComparisonResult v16 = @"Unknown number encoding";
          goto LABEL_14;
        }

        if ((unint64_t)length >= 9)
        {
          sub_10000DE58(-4LL, @"com.apple.security.cfder.error", v10, a3, v11, @"Number too large");
          return 0LL;
        }

        BOOL value = 0LL;
        if (length)
        {
          int8x8_t v79 = 0LL;
          CFRange v80 = v41;
          do
          {
            unsigned int v81 = *v80++;
            int8x8_t v79 = (int8x8_t)(v81 | (*(void *)&v79 << 8));
            BOOL value = (void *)v79;
          }

          while (v80 < &v41[length]);
          if ((char)*v41 < 0)
          {
            if (length != 8)
            {
              else {
                CFIndex v82 = 8 - length;
              }
              unint64_t v83 = (v82 - 1) & 0xFFFFFFFFFFFFFFFELL;
              uint64_t v84 = v82 - 1;
              unint64_t v85 = (v82 + 1) & 0xFFFFFFFFFFFFFFFELL;
              int8x16_t v86 = (int8x16_t)(unint64_t)v79;
              int64x2_t v87 = (int64x2_t)xmmword_1000628F0;
              int64x2_t v88 = vdupq_n_s64(0x40uLL);
              v89.i64[0] = 255LL;
              v89.i64[1] = 255LL;
              int64x2_t v90 = vdupq_n_s64(2uLL);
              do
              {
                int8x16_t v91 = v86;
                int8x16_t v86 = vorrq_s8(v86, (int8x16_t)vshlq_u64(v89, (uint64x2_t)vsubq_s64(v88, vshlq_n_s64(v87, 3uLL))));
                int64x2_t v87 = vaddq_s64(v87, v90);
                v85 -= 2LL;
              }

              while (v85);
              int8x16_t v92 = vbslq_s8( (int8x16_t)vcgtq_u64( (uint64x2_t)vorrq_s8((int8x16_t)vdupq_n_s64(v83), (int8x16_t)xmmword_100062900),  (uint64x2_t)vdupq_lane_s64(v84, 0)),  v91,  v86);
              int8x8_t v79 = vorr_s8(*(int8x8_t *)v92.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v92, v92, 8uLL));
            }

            BOOL value = (void *)v79;
          }
        }

        CFNumberRef v93 = CFNumberCreate(a1, kCFNumberLongLongType, &value);
        *a2 = v93;
        if (v93) {
          return &v42[length];
        }
        CFComparisonResult v16 = @"Number allocation failed";
        goto LABEL_136;
      case 3LL:
      case 6LL:
      case 7LL:
      case 8LL:
      case 9LL:
      case 10LL:
      case 11LL:
        goto LABEL_44;
      case 4LL:
        CFIndex length = 0LL;
        char v43 = (const UInt8 *)ccder_decode_tl(4LL, &length, v5, a5);
        if (!v43 || (v42 = v43, CFIndex v10 = length, a5 - v43 < length))
        {
          CFComparisonResult v16 = @"Unknown data encoding";
          goto LABEL_14;
        }

        CFDataRef v73 = CFDataCreate(a1, v43, length);
        *a2 = v73;
        if (v73) {
          return &v42[length];
        }
        CFComparisonResult v16 = @"Failed to create data";
        goto LABEL_136;
      case 5LL:
        CFIndex length = 0LL;
        uint64_t v44 = ccder_decode_tl(5LL, &length, v5, a5);
        if (!v44 || length)
        {
          CFComparisonResult v16 = @"Unknown null encoding";
          goto LABEL_14;
        }

        unint64_t v5 = (const UInt8 *)v44;
        BOOL v13 = &kCFNull;
LABEL_54:
        *a2 = *v13;
        return v5;
      case 12LL:
        CFIndex length = 0LL;
        unint64_t v45 = (const UInt8 *)ccder_decode_tl(12LL, &length, v5, a5);
        if (!v45 || (v42 = v45, CFIndex v10 = length, a5 - v45 < length))
        {
          CFComparisonResult v16 = @"Unknown string encoding";
          goto LABEL_14;
        }

        CFStringRef v74 = CFStringCreateWithBytes(a1, v45, length, 0x8000100u, 0);
        *a2 = v74;
        if (v74) {
          return &v42[length];
        }
        CFComparisonResult v16 = @"String allocation failed";
        goto LABEL_136;
      default:
        if (v94 != 0xC000000000000011LL) {
          goto LABEL_44;
        }
        CFIndex length = 0LL;
        unint64_t v5 = (const UInt8 *)ccder_decode_constructed_tl(0xC000000000000011LL, &length, v5, a5);
        if (!v5)
        {
          uint64_t v14 = @"Unknown data encoding, expected CCDER_CONSTRUCTED_CFSET";
          goto LABEL_98;
        }

        CFMutableArrayRef Mutable = CFSetCreateMutable(a1, 0LL, &kCFTypeSetCallBacks);
        if (Mutable)
        {
          BOOL v39 = v5 == (const UInt8 *)length;
          if ((unint64_t)v5 < length)
          {
            do
            {
              BOOL value = 0LL;
              unint64_t v5 = (const UInt8 *)sub_10000DF08(a1, &value, a3, v5);
              uint64_t v40 = value;
              if (v5) {
                CFSetAddValue(Mutable, value);
              }
              if (v40) {
                CFRelease(v40);
              }
            }

            while (v5 && (unint64_t)v5 < length);
            BOOL v39 = v5 == (const UInt8 *)length;
          }

          if (!v39)
          {
            CFRelease(Mutable);
            return v5;
          }
        }

        else
        {
          sub_10000DE58(-3LL, @"com.apple.security.cfder.error", v36, a3, v37, @"Failed to create set");
          unint64_t v5 = 0LL;
          if (length) {
            return v5;
          }
        }

        if (*a2) {
          CFRelease(*a2);
        }
        break;
    }

    goto LABEL_111;
  }

  if (v94 > 0x200000000000000FLL)
  {
    if (v94 == 0x2000000000000010LL)
    {
      CFMutableArrayRef v57 = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
      CFIndex length = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v58 = ccder_decode_sequence_tl(&length, v5, a5);
      if (!v58)
      {
        sub_10000DE58(-1LL, @"com.apple.security.cfder.error", v59, a3, v60, @"tag/length decode failed");
LABEL_86:
        if (v57) {
          CFRelease(v57);
        }
        return 0LL;
      }

      unint64_t v5 = (const UInt8 *)v58;
      while ((unint64_t)v5 < length)
      {
        BOOL value = 0LL;
        uint64_t v61 = sub_10000DF08(a1, &value, a3, v5);
        if (!v61) {
          goto LABEL_86;
        }
        unint64_t v5 = (const UInt8 *)v61;
        uint64_t v62 = value;
        CFArrayAppendValue(v57, value);
        if (v62) {
          CFRelease(v62);
        }
      }

      *a2 = v57;
      return v5;
    }

    if (v94 != 0x2000000000000011LL)
    {
      if (v94 != 0x6000000000000010LL) {
        goto LABEL_44;
      }
      CFIndex length = 0LL;
      uint64_t v34 = ccder_decode_tl(0x6000000000000010LL, &length, v5, a5);
      if (v34)
      {
        uint64_t v35 = v34;
        if ((uint64_t)&a5[-v34] >= length)
        {
          CFDataRef v75 = CFDataCreate(a1, v5, v34 + length - (void)v5);
          *a2 = v75;
          if (v75) {
            return (const UInt8 *)(v35 + length);
          }
          CFComparisonResult v16 = @"Failed to create CoreEntitlements data";
          goto LABEL_136;
        }
      }

      CFComparisonResult v16 = @"Unknown CoreEntitlements encoding";
LABEL_14:
      CFIndex v17 = -1LL;
LABEL_15:
      sub_10000DE58(v17, @"com.apple.security.cfder.error", v10, a3, v11, v16);
      return 0LL;
    }

    v95 = 0LL;
    unint64_t v5 = (const UInt8 *)ccder_decode_constructed_tl(0x2000000000000011LL, &v95, v5, a5);
    if (v5)
    {
      CFMutableArrayRef Mutable = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Mutable)
      {
        int v65 = v95;
        if (v5 < v95)
        {
          while (1)
          {
            CFIndex length = 0LL;
            uint64_t v66 = ccder_decode_constructed_tl(0x2000000000000010LL, &length, v5, v65);
            if (!v66)
            {
              sub_10000DE58( -1LL,  @"com.apple.security.cfder.error",  v67,  a3,  v68,  @"Unknown data encoding, expected CCDER_CONSTRUCTED_SEQUENCE");
              goto LABEL_132;
            }

            CFAbsoluteTime at = 0.0;
            BOOL value = 0LL;
            uint64_t v69 = sub_10000DF08(a1, &value, a3, v66);
            uint64_t v70 = sub_10000DF08(a1, &at, a3, v69);
            v71 = value;
            if (!v70) {
              break;
            }
            unint64_t v5 = (const UInt8 *)v70;
            CFAbsoluteTime v72 = at;
            CFDictionaryAddValue(Mutable, value, *(const void **)&at);
            if (v71) {
              CFRelease(v71);
            }
            if (v72 != 0.0) {
              CFRelease(*(CFTypeRef *)&v72);
            }
            int v65 = v95;
            if (v5 >= v95) {
              goto LABEL_133;
            }
          }

          if (value) {
            CFRelease(value);
          }
          if (*(void *)&at) {
            CFRelease(*(CFTypeRef *)&at);
          }
LABEL_132:
          unint64_t v5 = 0LL;
          int v65 = v95;
LABEL_133:
          uint64_t v78 = v5;
          unint64_t v5 = v65;
          if (v78 == v65) {
            goto LABEL_111;
          }
LABEL_134:
          CFRelease(Mutable);
          return v78;
        }

        uint64_t v78 = v5;
        if (v5 != v95) {
          goto LABEL_134;
        }
      }

      else
      {
        sub_10000DE58(-3LL, @"com.apple.security.cfder.error", v63, a3, v64, @"Failed to create dictionary");
        unint64_t v5 = 0LL;
        if (v95) {
          return v5;
        }
      }

LABEL_111:
      *a2 = Mutable;
      return v5;
    }

    uint64_t v14 = @"Unknown data encoding, expected CCDER_CONSTRUCTED_SET";
LABEL_98:
    CFIndex v15 = -1LL;
LABEL_12:
    sub_10000DE58(v15, @"com.apple.security.cfder.error", (uint64_t)a3, a3, (uint64_t)a5, v14);
    return v5;
  }

  if (v94 == 18)
  {
    CFIndex length = 0LL;
    uint64_t v46 = (const UInt8 *)ccder_decode_tl(18LL, &length, v5, a5);
    if (v46)
    {
      uint64_t v42 = v46;
      CFIndex v10 = length;
      if (a5 - v46 >= length)
      {
        CFStringRef v76 = CFStringCreateWithBytes(a1, v46, length, 0x8000100u, 0);
        *a2 = v76;
        if (v76) {
          return &v42[length];
        }
        CFComparisonResult v16 = @"Numeric string allocation failed";
        goto LABEL_136;
      }
    }

    CFComparisonResult v16 = @"Unknown numeric string encoding";
    goto LABEL_14;
  }

  if (v94 != 23)
  {
    if (v94 == 24)
    {
      BOOL value = a5;
      CFIndex v19 = ccder_decode_constructed_tl(24LL, &value, v5, a5);
      CFAbsoluteTime at = 0.0;
      BOOL v20 = value;
      CFIndex length = v19;
      int v23 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)value, a3, v21, v22);
      int v26 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)v20, a3, v24, v25) + 10 * v23;
      int v29 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)v20, a3, v27, v28);
      int v32 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)v20, a3, v30, v31);
      unint64_t v5 = (const UInt8 *)sub_100008F20( &at,  a3,  v32 + 10 * v29 + 100 * v26,  (unsigned __int8 *)length,  (unint64_t)v20);
      if (v5)
      {
        CFDateRef v33 = CFDateCreate(a1, at);
        *a2 = v33;
        if (!v33)
        {
          CFComparisonResult v16 = @"Failed to create date";
LABEL_136:
          CFIndex v17 = -3LL;
          goto LABEL_15;
        }
      }

      return v5;
    }

LABEL_44:
    sub_10000DE58(-2LL, @"com.apple.security.cfder.error", v10, a3, v11, @"Unsupported DER Type");
    return 0LL;
  }

  BOOL value = a5;
  CFIndex v47 = ccder_decode_constructed_tl(23LL, &value, v5, a5);
  CFAbsoluteTime at = 0.0;
  double v48 = value;
  CFIndex length = v47;
  int v51 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)value, a3, v49, v50);
  signed int v56 = sub_100008E84((unsigned __int8 **)&length, (unint64_t)v48, a3, v52, v53) + 10 * v51;
  if (v56 > 49)
  {
    if (v56 > 0x45)
    {
      v56 += 1900;
    }

    else
    {
      sub_10000DE58( -1LL,  @"com.apple.security.cfder.error",  v54,  a3,  v55,  @"Invalid universal time year between 50 and 70");
      CFIndex length = 0LL;
    }
  }

  else
  {
    v56 += 2000;
  }

  unint64_t v5 = (const UInt8 *)sub_100008F20(&at, a3, v56, (unsigned __int8 *)length, (unint64_t)v48);
  if (v5)
  {
    CFDateRef v77 = CFDateCreate(a1, at);
    *a2 = v77;
    if (!v77)
    {
      CFComparisonResult v16 = @"Failed to create utc date";
      goto LABEL_136;
    }
  }

  return v5;
}

uint64_t sub_10000E960(const __CFString *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!a1)
  {
    sub_10000DE58(-5LL, @"com.apple.security.cfder.error", a3, a2, a5, @"Null CFType");
    return 0LL;
  }

  CFTypeID v7 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() != v7)
  {
    if (CFBooleanGetTypeID() == v7) {
      return ccder_sizeof(1LL, 1LL);
    }
    if (CFDataGetTypeID() == v7)
    {
      CFIndex Length = CFDataGetLength((CFDataRef)a1);
      return ccder_sizeof_raw_octet_string(Length);
    }

    if (CFDateGetTypeID() == v7)
    {
      double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
      int v23 = -1431655766;
      int v24 = -1431655766;
      unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
      uint64_t v17 = __dtoa(0LL, 0LL, &v24, &v23, &v22, AbsoluteTime);
      int64_t v18 = v22 - v17;
      __freedtoa();
      int64_t v19 = v18 - v24;
      if (v18 < v24) {
        int64_t v19 = 0LL;
      }
      if (v19) {
        uint64_t v15 = v19 + 16;
      }
      else {
        uint64_t v15 = 15LL;
      }
      uint64_t v14 = 24LL;
      return ccder_sizeof(v14, v15);
    }

    if (CFDictionaryGetTypeID() == v7) {
      return sub_1000085E8((const __CFDictionary *)a1, (uint64_t)a2);
    }
    if (CFSetGetTypeID() == v7) {
      return sub_10000F7F8((const __CFSet *)a1, (uint64_t)a2);
    }
    if (CFStringGetTypeID() == v7) {
      return sub_10000F620(a1);
    }
    if (CFNumberGetTypeID() == v7) {
      return sub_10000D994((const __CFNumber *)a1, a2);
    }
    if (CFNullGetTypeID() == v7) {
      return ccder_sizeof(5LL, 0LL);
    }
    sub_10000DE58(-5LL, @"com.apple.security.cfder.error", v20, a2, v21, @"Unsupported CFType");
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
  if (Count < 1)
  {
    uint64_t v9 = 0LL;
  }

  else
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = Count + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v10 - 2);
      v9 += sub_10000E960(ValueAtIndex, a2);
      --v10;
    }

    while (v10 > 1);
  }

  uint64_t v14 = 0x2000000000000010LL;
  uint64_t v15 = v9;
  return ccder_sizeof(v14, v15);
}

uint64_t sub_10000EBA0(const __CFString *a1, CFTypeRef *a2, uint64_t a3, UInt8 *a4, unint64_t a5)
{
  if (!a1)
  {
    sub_10000DE58(-5LL, @"com.apple.security.cfder.error", a3, a2, a5, @"Null CFType");
    return 0LL;
  }

  CFTypeID v10 = CFGetTypeID(a1);
  if (CFArrayGetTypeID() == v10)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    uint64_t v12 = a5;
    if (Count >= 1)
    {
      unint64_t v13 = Count + 1;
      uint64_t v12 = a5;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v13 - 2);
        uint64_t v12 = sub_10000EBA0(ValueAtIndex, a2, a3, a4, v12);
        --v13;
      }

      while (v13 > 1);
    }

    uint64_t v15 = 0x2000000000000010LL;
    unint64_t v16 = a5;
    uint64_t v17 = a4;
    uint64_t v18 = v12;
    goto LABEL_7;
  }

  if (CFBooleanGetTypeID() == v10)
  {
    buf[0] = CFBooleanGetValue((CFBooleanRef)a1);
    ccder_encode_body(1LL, buf, a4, a5);
    uint64_t v23 = 1LL;
LABEL_14:
    uint64_t v19 = ccder_encode_tl(v23);
LABEL_15:
    uint64_t v22 = v19;
    if (!v19) {
      sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v20, a2, v21, @"ccder failed to encode");
    }
    return v22;
  }

  if (CFDataGetTypeID() == v10)
  {
    CFIndex Length = CFDataGetLength((CFDataRef)a1);
    BytePtr = CFDataGetBytePtr((CFDataRef)a1);
    ccder_encode_body(Length, BytePtr, a4, a5);
    uint64_t v23 = 4LL;
    goto LABEL_14;
  }

  if (CFDateGetTypeID() == v10)
  {
    double AbsoluteTime = CFDateGetAbsoluteTime((CFDateRef)a1);
    uint64_t v67 = 0LL;
    uint64_t v68 = 0LL;
    uint64_t v66 = 0LL;
    CFErrorRef err = 0LL;
    p_CFErrorRef err = &err;
    uint64_t v71 = 0x2000000000LL;
    char v72 = -86;
    *(void *)__int128 buf = _NSConcreteStackBlock;
    *(void *)&uint8_t buf[8] = 0x40000000LL;
    *(void *)&uint8_t buf[16] = sub_100009530;
    CFStringRef v76 = &unk_100075E98;
    CFDateRef v77 = &err;
    double v78 = AbsoluteTime;
    int8x8_t v79 = (char *)&v68 + 4;
    CFRange v80 = &v68;
    unsigned int v81 = (char *)&v67 + 4;
    CFIndex v82 = &v67;
    unint64_t v83 = (char *)&v66 + 4;
    uint64_t v84 = &v66;
    sub_100008B98((uint64_t)buf);
    if (*((_BYTE *)p_err + 24))
    {
      _Block_object_dispose(&err, 8);
    }

    else
    {
      sub_10000DE58(-1LL, @"com.apple.security.cfder.error", v28, a2, v29, @"Failed to encode date.");
      int v30 = *((unsigned __int8 *)p_err + 24);
      _Block_object_dispose(&err, 8);
      if (!v30)
      {
        uint64_t v54 = (os_log_s *)sub_10000856C("SecError");
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          if (a2) {
            CFTypeRef v55 = *a2;
          }
          else {
            CFTypeRef v55 = 0LL;
          }
          *(_DWORD *)__int128 buf = 138412290;
          *(void *)&uint8_t buf[4] = v55;
          _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "der: unable to encode date: %@",  buf,  0xCu);
        }

        goto LABEL_75;
      }
    }

    CFErrorRef err = 0LL;
    if ((sub_1000093AC( HIDWORD(v68),  v68,  HIDWORD(v67),  v67,  HIDWORD(v66),  v66,  0LL,  (__CFString **)&err) & 1) == 0)
    {
      uint64_t v31 = (__CFString *)CFErrorCopyDescription(err);
      sub_10000FD78(v31, 1405091842);
      if (v31) {
        CFRelease(v31);
      }
      int v32 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        CFDateRef v33 = "continuing";
        if ((_DWORD)a3) {
          CFDateRef v33 = "setting default value";
        }
        *(_DWORD *)__int128 buf = 138412546;
        *(void *)&uint8_t buf[4] = err;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "der: invalid date: %@; %s", buf, 0x16u);
      }

      CFErrorRef v34 = err;
      if (err)
      {
        CFErrorRef err = 0LL;
        CFRelease(v34);
      }

      if ((_DWORD)a3)
      {
        uint64_t v68 = 0x7D100000001LL;
        HIDWORD(v67) = 1;
        HIDWORD(v66) = 1;
      }
    }

    if ((unint64_t)(a4 + 1) <= a5)
    {
      *(_BYTE *)(a5 - 1) = 90;
      unint64_t v35 = a5 - 1;
    }

    else
    {
      unint64_t v35 = 0LL;
    }

    int v37 = v68;
    int v36 = HIDWORD(v68);
    int v38 = HIDWORD(v66);
    int v64 = HIDWORD(v67);
    int v65 = v67;
    int v39 = v66;
    int v73 = -1431655766;
    int v74 = -1431655766;
    *(void *)__int128 buf = 0xAAAAAAAAAAAAAAAALL;
    uint64_t v40 = __dtoa(0LL, 0LL, &v74, &v73, buf, AbsoluteTime);
    uint64_t v41 = v40;
    int v42 = v74;
    uint64_t v43 = *(void *)buf;
    if (AbsoluteTime < 0.0)
    {
      unint64_t v44 = v40 + (v74 & ~(v74 >> 31));
      if (v44 < *(void *)buf)
      {
        unint64_t v45 = (_BYTE *)(*(void *)buf - 1LL);
      }

      int v42 = v74;
      uint64_t v43 = *(void *)buf;
    }

    uint64_t v47 = v43 - v40;
    if (v43 - v41 > v42)
    {
      if ((v42 & 0x80000000) == 0)
      {
        unint64_t v35 = ccder_encode_body(v47 - v42, v41 + v42, a4, v35);
LABEL_55:
        else {
          unint64_t v35 = 0LL;
        }
        goto LABEL_66;
      }

      int v63 = v37;
      int v49 = v36;
      uint64_t v50 = ccder_encode_body(v47, v41, a4, v35);
      size_t v51 = -(uint64_t)v74;
      uint64_t v52 = (void *)ccder_encode_body_nocopy(v51, a4, v50);
      unint64_t v35 = (unint64_t)v52;
      if (v52)
      {
        if (AbsoluteTime >= 0.0) {
          int v53 = 48;
        }
        else {
          int v53 = 57;
        }
        memset(v52, v53, v51);
        int v36 = v49;
        int v37 = v63;
        goto LABEL_55;
      }

      int v36 = v49;
      int v37 = v63;
    }

LABEL_66:
    __freedtoa(v41);
    if (v35)
    {
      unint64_t v60 = (unint64_t)(a4 + 2);
      if ((unint64_t)(a4 + 2) <= v35)
      {
        *(_BYTE *)(v35 - 2) = v39 / 10 + 48;
        *(_BYTE *)(v35 - 1) = v39 % 10 + 48;
        if (v60 <= v35 - 2)
        {
          *(_BYTE *)(v35 - 4) = v38 / 10 + 48;
          *(_BYTE *)(v35 - 3) = v38 % 10 + 48;
          if (v60 <= v35 - 4)
          {
            *(_BYTE *)(v35 - 6) = v65 / 10 + 48;
            *(_BYTE *)(v35 - 5) = v65 % 10 + 48;
            if (v60 <= v35 - 6)
            {
              *(_BYTE *)(v35 - 8) = v64 / 10 + 48;
              *(_BYTE *)(v35 - 7) = v64 % 10 + 48;
              if (v60 <= v35 - 8)
              {
                *(_BYTE *)(v35 - 10) = v37 / 10 + 48;
                *(_BYTE *)(v35 - 9) = v37 % 10 + 48;
                if (v60 <= v35 - 10)
                {
                  unsigned int v61 = (((103 * (v36 % 100)) >> 15) & 1) + ((103 * (v36 % 100)) >> 10);
                  *(_BYTE *)(v35 - 12) = v61 + 48;
                  *(_BYTE *)(v35 - 11) = v36 % 100 - 10 * v61 + 48;
                  if (v60 <= v35 - 12)
                  {
                    *(_BYTE *)(v35 - 14) = v36 / 1000 + 48;
                    unint64_t v62 = v35 - 14;
                    *(_BYTE *)(v62 + 1) = v36 / 100 % 10 + 48;
                    goto LABEL_76;
                  }
                }
              }
            }
          }
        }
      }
    }

    sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v58, a2, v59, @"ccder failed to encode");
LABEL_75:
    unint64_t v62 = 0LL;
LABEL_76:
    uint64_t v15 = 24LL;
    unint64_t v16 = a5;
    uint64_t v17 = a4;
    uint64_t v18 = v62;
LABEL_7:
    uint64_t v19 = ccder_encode_constructed_tl(v15, v16, v17, v18);
    goto LABEL_15;
  }

  if (CFDictionaryGetTypeID() == v10) {
    return sub_100008710((const __CFDictionary *)a1, a2, a3, (uint64_t)a4, a5);
  }
  if (CFSetGetTypeID() == v10) {
    return sub_10000F89C((const __CFSet *)a1, a2, a3, (uint64_t)a4, a5);
  }
  if (CFStringGetTypeID() == v10) {
    return sub_10000F69C(a1, a2, a4, a5, v48);
  }
  if (CFNumberGetTypeID() == v10) {
    return sub_10000DA6C((const __CFNumber *)a1, a2, (uint64_t)a4, a5);
  }
  if (CFNullGetTypeID() != v10)
  {
    sub_10000DE58(-5LL, @"com.apple.security.cfder.error", v56, a2, v57, @"Unsupported CFType");
    return 0LL;
  }

  return sub_10000F7A0(a2);
}

dispatch_source_t sub_10000F4F4(dispatch_object_s *a1, char *label, uint64_t a3)
{
  if (a1)
  {
    CFTypeRef v4 = (dispatch_queue_s *)a1;
    dispatch_retain(a1);
  }

  else
  {
    CFTypeRef v4 = dispatch_queue_create(label, 0LL);
  }

  dispatch_source_t v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_data_add, 0LL, 0LL, v4);
  uint64_t v6 = malloc(0x20uLL);
  *uint64_t v6 = v4;
  v6[1] = v5;
  _OWORD v6[2] = 0LL;
  v6[3] = a3;
  dispatch_set_context(v5, v6);
  dispatch_source_set_event_handler_f(v5, (dispatch_function_t)sub_10000F594);
  dispatch_set_finalizer_f(v5, (dispatch_function_t)sub_10000F5EC);
  return v5;
}

void sub_10000F594(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  dispatch_suspend(*(dispatch_object_t *)(a1 + 8));
  dispatch_time_t v3 = dispatch_time(0LL, 1000000000LL * *(void *)(a1 + 24));
  dispatch_after_f(v3, *(dispatch_queue_t *)a1, *(void **)(a1 + 8), (dispatch_function_t)&_dispatch_resume);
}

void sub_10000F5EC(uint64_t a1)
{
  uint64_t v2 = *(const void **)(a1 + 16);
  if (v2) {
    _Block_release(v2);
  }
  free((void *)a1);
}

uint64_t sub_10000F620(const __CFString *a1)
{
  CFIndex Length = CFStringGetLength(a1);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex usedBufLen = 0LL;
  v7.location = 0LL;
  v7.CFIndex length = Length;
  if (CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, 0LL, MaximumSizeForEncoding, &usedBufLen) == Length) {
    CFIndex v4 = usedBufLen;
  }
  else {
    CFIndex v4 = 0LL;
  }
  return ccder_sizeof(12LL, v4);
}

uint64_t sub_10000F69C(const __CFString *a1, CFTypeRef *a2, UInt8 *a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex usedBufLen = 0LL;
    v16.location = 0LL;
    v16.CFIndex length = Length;
    if (CFStringGetBytes(a1, v16, 0x8000100u, 0, 0, a3, a4 - (void)a3, &usedBufLen) == Length)
    {
      ccder_encode_body(usedBufLen, a3, a3, a4);
      uint64_t result = ccder_encode_tl(12LL);
      if (result) {
        return result;
      }
      sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v13, a2, v14, @"ccder failed to encode");
    }

    else
    {
      sub_10000DE58(-5LL, @"com.apple.security.cfder.error", v10, a2, v11, @"String extraction failed");
    }
  }

  else
  {
    sub_10000DE58(-6LL, @"com.apple.security.cfder.error", (uint64_t)a3, a2, a5, @"null input");
  }

  return 0LL;
}

uint64_t sub_10000F7A0(CFTypeRef *a1)
{
  uint64_t v4 = ccder_encode_tl(5LL);
  if (!v4) {
    sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v2, a1, v3, @"ccder failed to encode");
  }
  return v4;
}

uint64_t sub_10000F7F8(const __CFSet *a1, uint64_t a2)
{
  __int128 v3 = xmmword_1000628E0;
  LOBYTE(v3) = 1;
  uint64_t v4 = a2;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_10000F858, &v3);
  if ((_BYTE)v3) {
    return ccder_sizeof(0xC000000000000011LL, *((void *)&v3 + 1));
  }
  else {
    return 0LL;
  }
}

uint64_t sub_10000F858(uint64_t result, uint64_t a2)
{
  if (*(_BYTE *)a2)
  {
    uint64_t result = sub_10000E960(result, *(void *)(a2 + 16));
    if (result) {
      *(void *)(a2 + 8) += result;
    }
    else {
      *(_BYTE *)a2 = 0;
    }
  }

  return result;
}

uint64_t sub_10000F89C(const __CFSet *a1, CFTypeRef *a2, char a3, uint64_t a4, uint64_t a5)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
  v20[0] = 0xAAAAAAAAAAAAAA01LL;
  v20[1] = a2;
  BYTE1(v20[0]) = a3;
  void v20[2] = Mutable;
  v20[3] = 0LL;
  CFSetApplyFunction(a1, (CFSetApplierFunction)sub_10000FA0C, v20);
  if (!LOBYTE(v20[0]))
  {
    if (Mutable) {
      CFRelease(Mutable);
    }
    return 0LL;
  }

  v21.CFIndex length = CFArrayGetCount(Mutable);
  v21.location = 0LL;
  CFArraySortValues(Mutable, v21, (CFComparatorFunction)sub_10000FAE0, 0LL);
  CFIndex Count = CFArrayGetCount(Mutable);
  uint64_t v12 = a5;
  if (Count >= 1)
  {
    unint64_t v13 = Count + 1;
    uint64_t v12 = a5;
    do
    {
      ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(Mutable, v13 - 2);
      CFIndex Length = CFDataGetLength(ValueAtIndex);
      BytePtr = CFDataGetBytePtr(ValueAtIndex);
      uint64_t v12 = ccder_encode_body(Length, BytePtr, a4, v12);
      --v13;
    }

    while (v13 > 1);
  }

  if (Mutable) {
    CFRelease(Mutable);
  }
  uint64_t result = ccder_encode_constructed_tl(0xC000000000000011LL, a5, a4, v12);
  if (!result)
  {
    sub_10000DE58(-7LL, @"com.apple.security.cfder.error", v18, a2, v19, @"ccder failed to encode");
    return 0LL;
  }

  return result;
}

void sub_10000FA0C(const __CFString *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*(_BYTE *)a2)
  {
    CFIndex v7 = sub_10000E960(a1, *(CFTypeRef **)(a2 + 8), a3, a4, a5);
    if (!v7)
    {
      *(_BYTE *)a2 = 0;
      return;
    }

    CFIndex v8 = v7;
    CFMutableArrayRef Mutable = CFDataCreateMutable(*(CFAllocatorRef *)(a2 + 24), v7);
    CFDataSetLength(Mutable, v8);
    MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
    uint64_t v11 = sub_10000EBA0(a1, *(void *)(a2 + 8), *(unsigned __int8 *)(a2 + 1), MutableBytePtr, &MutableBytePtr[v8]);
    if (v11)
    {
      v12.CFIndex length = v11 - (void)MutableBytePtr;
      v12.location = 0LL;
      CFDataDeleteBytes(Mutable, v12);
      CFArrayAppendValue(*(CFMutableArrayRef *)(a2 + 16), Mutable);
      if (!Mutable) {
        return;
      }
    }

    else
    {
      *(_BYTE *)a2 = 0;
      if (!Mutable) {
        return;
      }
    }

    CFRelease(Mutable);
  }

uint64_t sub_10000FAE0(const __CFData *a1, const __CFData *a2)
{
  CFIndex Length = CFDataGetLength(a1);
  CFIndex v5 = CFDataGetLength(a2);
  unint64_t v6 = v5;
  if (Length < 0 || v5 < 0)
  {
    if (Length >= v5) {
      uint64_t v12 = 0LL;
    }
    else {
      uint64_t v12 = -1LL;
    }
    if (Length <= v5) {
      return v12;
    }
    else {
      return 1LL;
    }
  }

  else
  {
    if (Length >= v5) {
      size_t v7 = v5;
    }
    else {
      size_t v7 = Length;
    }
    BytePtr = CFDataGetBytePtr(a1);
    uint64_t v9 = CFDataGetBytePtr(a2);
    int v10 = memcmp(BytePtr, v9, v7);
    if (v10 <= 0 && (v10 || Length <= v6))
    {
      LODWORD(v13) = v10 == 0;
      if (Length >= v6) {
        LODWORD(v13) = 0;
      }
      if (v10 < 0) {
        uint64_t v13 = 1LL;
      }
      else {
        uint64_t v13 = v13;
      }
      return v13 << 63 >> 63;
    }

    else
    {
      return 1LL;
    }
  }

CFURLRef sub_10000FBA4(const __CFString *a1, uint64_t a2)
{
  uint64_t v4 = CFURLCreateWithFileSystemPath(0LL, @"/", kCFURLPOSIXPathStyle, 1u);
  if (a2)
  {
    CFIndex v5 = kCFAllocatorDefault;
    CFStringRef Copy = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@/%@", a1, a2);
  }

  else
  {
    if (!a1) {
      goto LABEL_10;
    }
    CFIndex v5 = kCFAllocatorDefault;
    CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, a1);
  }

  size_t v7 = Copy;
  if (v4 && Copy)
  {
    CFURLRef v8 = CFURLCreateCopyAppendingPathComponent(v5, v4, Copy, a2 == 0);
    CFRelease(v7);
LABEL_11:
    CFRelease(v4);
    return v8;
  }

  if (Copy) {
    CFRelease(Copy);
  }
LABEL_10:
  CFURLRef v8 = 0LL;
  if (v4) {
    goto LABEL_11;
  }
  return v8;
}

void sub_10000FC8C(const __CFURL *a1, uint64_t a2)
{
  if (a1)
  {
    memset(__b, 170, sizeof(__b));
    CFURLGetFileSystemRepresentation(a1, 0, __b, 1024LL);
    (*(void (**)(uint64_t, UInt8 *))(a2 + 16))(a2, __b);
    CFRelease(a1);
  }

void sub_10000FD28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000FBA4(@"Library/Keychains", a1);
  sub_10000FC8C(v4, a2);
}

void sub_10000FD78(void *a1, int a2)
{
  LODWORD(v2) = a2;
  uint64_t v4 = sub_10000856C("SecError");
  CFIndex v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138412546;
    *(void *)&uint8_t buf[4] = a1;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = (_DWORD)v2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Simulating crash, reason: %@, code=%08x",  buf,  0x12u);
  }

  int v6 = dword_100082760;
  if (dword_100082760 != -1) {
    goto LABEL_4;
  }
  if (!qword_100082B58)
  {
    *(_OWORD *)__int128 buf = off_1000763A0;
    *(void *)&uint8_t buf[16] = 0LL;
    qword_100082B58 = _sl_dlopen(buf, 0LL);
  }

  if (!qword_100082B58)
  {
    int v6 = dword_100082760;
LABEL_4:
    dword_100082760 = v6 + 1;
    return;
  }

  uint64_t v7 = getpid();
  id v8 = a1;
  *(void *)__int128 buf = 0LL;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000LL;
  uint64_t v9 = off_100082B60;
  uint64_t v13 = off_100082B60;
  if (off_100082B60) {
    goto LABEL_14;
  }
  uint64_t v11 = 0LL;
  if (!qword_100082B58)
  {
    __int128 v14 = off_1000763A0;
    uint64_t v15 = 0LL;
    qword_100082B58 = _sl_dlopen(&v14, &v11);
  }

  uint64_t v9 = (void *)qword_100082B58;
  if (!qword_100082B58)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "void *CrashReporterSupportLibrary(void)"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v8,  @"simulate_crash.m",  18,  @"%s",  v11);

    goto LABEL_20;
  }

  int v10 = v11;
  if (v11) {
    goto LABEL_21;
  }
  while (1)
  {
    uint64_t v9 = dlsym(v9, "SimulateCrash");
    *(void *)(*(void *)&buf[8] + 24LL) = v9;
    off_100082B60 = v9;
LABEL_14:
    _Block_object_dispose(buf, 8);
    if (v9) {
      break;
    }
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSString stringWithUTF8String:]( &OBJC_CLASS___NSString,  "stringWithUTF8String:",  "BOOL soft_SimulateCrash(pid_t, mach_exception_data_type_t, NSString *__strong)"));
    objc_msgSend( v2,  "handleFailureInFunction:file:lineNumber:description:",  v8,  @"simulate_crash.m",  22,  @"%s",  dlerror());

LABEL_20:
    __break(1u);
LABEL_21:
    free(v10);
  }

  ((void (*)(uint64_t, void, id))v9)(v7, v2, v8);
}

void sub_100010034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
}

void sub_100010054(size_t __size, uint64_t a2)
{
  if (__size)
  {
    if (__size > 0x800)
    {
      uint64_t v4 = malloc(__size);
      (*(void (**)(uint64_t, size_t, void *))(a2 + 16))(a2, __size, v4);
      if (v4) {
        free(v4);
      }
    }

    else
    {
      __chkstk_darwin();
      memset((char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL), 170, __size);
      (*(void (**)(uint64_t, size_t, char *))(a2 + 16))( a2,  __size,  (char *)&v5 - ((__size + 15) & 0xFFFFFFFFFFFFFFF0LL));
    }
  }

  else
  {
    (*(void (**)(uint64_t, void, void))(a2 + 16))(a2, 0LL, 0LL);
  }

xpc_object_t sub_1000101A0(__CFError *a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0LL, 0LL, 0LL);
  CFErrorDomain Domain = CFErrorGetDomain(a1);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000LL;
  unint64_t v15[2] = sub_1000102D8;
  v15[3] = &unk_1000763B8;
  v15[4] = v2;
  v15[5] = "domain";
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000LL;
  void v16[2] = sub_100008E78;
  v16[3] = &unk_100075DC8;
  v16[4] = v15;
  sub_100008D10(Domain, (uint64_t)v16);
  int64_t Code = CFErrorGetCode(a1);
  xpc_dictionary_set_int64(v2, "code", Code);
  uint64_t v5 = (const __CFString *)CFErrorCopyUserInfo(a1);
  size_t v9 = sub_10000E960(v5, 0LL, v6, v7, v8);
  if (v9)
  {
    size_t v10 = v9;
    uint64_t v11 = (UInt8 *)malloc(v9);
    unint64_t v12 = (unint64_t)&v11[v10];
    uint64_t v13 = (const void *)sub_10000EBA0(v5, 0LL, 0LL, v11, v12);
    if (v13) {
      xpc_dictionary_set_data(v2, "userinfo", v13, v12 - (void)v13);
    }
    free(v11);
  }

  CFRelease(v5);
  return v2;
}

void sub_1000102D8(uint64_t a1, char *string)
{
}

uint64_t sub_1000102E8(uint64_t a1, const __CFArray *a2, _BYTE *a3, int a4)
{
  uint64_t v8 = ((uint64_t (*)(void))SecCertificateCopySubjectSequence)();
  if (!v8) {
    return 4294941021LL;
  }
  size_t v9 = (const __CFData *)v8;
  uint64_t SubjectAltName = SecCertificateGetSubjectAltName(a1);
  if (sub_10001053C(v9) && !SubjectAltName)
  {
    uint64_t v16 = 4294941021LL;
    goto LABEL_21;
  }

  uint64_t v11 = (const __CFData *)SecCertificateCopySubjectSequence(a1);
  if (!v11) {
    goto LABEL_8;
  }
  unint64_t v12 = v11;
  if (CFDataGetLength(v11) < 0 || sub_10001053C(v12))
  {
    CFRelease(v12);
LABEL_8:
    int v13 = 0;
    char v14 = a4;
    goto LABEL_9;
  }

  CFIndex Count = CFArrayGetCount(a2);
  __int16 v31 = 0;
  v30[0] = CFDataGetBytePtr(v12);
  v30[1] = CFDataGetLength(v12);
  context[0] = 0xAAAAAAAA00000004LL;
  context[1] = v30;
  context[2] = &v31;
  v32.location = 0LL;
  v32.CFIndex length = Count;
  CFArrayApplyFunction(a2, v32, (CFArrayApplierFunction)sub_1000105B4, context);
  CFRelease(v12);
  int v13 = v31;
  if ((_BYTE)v31) {
    char v14 = HIBYTE(v31);
  }
  else {
    char v14 = a4;
  }
  char v27 = 0;
  char v28 = a4;
  uint64_t v19 = (const __CFArray *)SecCertificateCopyRFC822NamesFromSubject(a1);
  if (v19)
  {
    uint64_t v20 = v19;
    v33.CFIndex length = CFArrayGetCount(v19);
    v25[0] = a2;
    v25[1] = &v27;
    unint64_t v26 = 0xAAAAAAAAAAAAAAAALL;
    LOBYTE(v26) = a4;
    v33.location = 0LL;
    CFArrayApplyFunction(v20, v33, (CFArrayApplierFunction)sub_10001068C, v25);
    CFRelease(v20);
    if (v27)
    {
      if (a4) {
        v14 &= v28;
      }
      else {
        v14 |= v28;
      }
      int v13 = 1;
    }
  }

LABEL_9:
  char v23 = 0;
  char v24 = a4;
  v21[0] = a2;
  v21[1] = &v23;
  unint64_t v22 = 0xAAAAAAAAAAAAAAAALL;
  LOBYTE(v22) = a4;
  if (!SubjectAltName)
  {
    if (v13)
    {
LABEL_16:
      uint64_t v16 = 0LL;
      LOBYTE(a4) = v14;
      goto LABEL_20;
    }

  return v12;
}

LABEL_19:
    uint64_t v16 = 0LL;
    goto LABEL_20;
  }

  uint64_t v15 = SecCertificateParseGeneralNames(SubjectAltName, v21, sub_1000107DC);
  if ((_DWORD)v15)
  {
    uint64_t v16 = v15;
    LOBYTE(a4) = 0;
    goto LABEL_20;
  }

  if (!v13)
  {
    if (v23)
    {
      uint64_t v16 = 0LL;
      LOBYTE(a4) = v24;
      goto LABEL_20;
    }

    goto LABEL_19;
  }

  if (!v23 || (v14 != 0) != (v24 == 0)) {
    goto LABEL_16;
  }
  uint64_t v16 = 0LL;
  LOBYTE(a4) = a4 ^ 1;
LABEL_20:
  *a3 = a4;
LABEL_21:
  CFRelease(v9);
  return v16;
}

  uint64_t v15 = 7;
LABEL_20:
  uint64_t v16 = (os_log_s *)sub_10000856C("SecError");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = sqlite3_errmsg(*(sqlite3 **)(v1 + 8));
    LODWORD(v23) = 136315138;
    *(void *)((char *)&v23 + 4) = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "caissuer cache add failed: %s",  (uint8_t *)&v23,  0xCu);
  }

  sub_10004ADB8(3LL, 2LL, v15);
LABEL_23:
  uint64_t v18 = qword_100082CC0;
  uint64_t v19 = sub_10001C848(qword_100082CC0);
  if (v19)
  {
    uint64_t v20 = v19;
    CFRange v21 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v22 = sqlite3_errmsg(*(sqlite3 **)(v18 + 8));
      LODWORD(v23) = 136315138;
      *(void *)((char *)&v23 + 4) = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "caissuer cache flush failed: %s",  (uint8_t *)&v23,  0xCu);
    }

    sub_10004ADB8(3LL, 2LL, v20);
  }

BOOL sub_10001053C(const __CFData *a1)
{
  BOOL result = 1;
  if (CFDataGetLength(a1) >= 1)
  {
    v4[0] = CFDataGetBytePtr(a1);
    v4[1] = CFDataGetLength(a1);
    memset(v3, 170, sizeof(v3));
    if (!DERDecodeItem((uint64_t)v4, v3))
    {
      if (v3[2]) {
        return 0;
      }
    }
  }

  return result;
}

void sub_1000105B4(const __CFData *a1, uint64_t a2)
{
  if (a1)
  {
    if (CFDataGetLength(a1) >= 1)
    {
      v7[0] = CFDataGetBytePtr(a1);
      v7[1] = CFDataGetLength(a1);
      memset(v6, 170, sizeof(v6));
      if (!DERDecodeItem((uint64_t)v7, v6)
        && SecCertificateParseGeneralNameContentProperty(v6[0], &v6[1], a2, sub_1000108A4) == -26275)
      {
        uint64_t v4 = (os_log_s *)sub_10000856C("policy");
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v5 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "can't parse general name or not a type we support",  v5,  2u);
        }
      }
    }
  }

void sub_10001068C(const __CFString *a1, uint64_t a2)
{
  if (!a2) {
    return;
  }
  __int128 v3 = *(const __CFArray **)a2;
  if (!*(void *)a2) {
    return;
  }
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)a2);
  __int16 v15 = 0;
  if (!a1)
  {
    uint64_t v8 = strdup("");
    if (!v8) {
      return;
    }
    goto LABEL_9;
  }

  CFRetain(a1);
  CFIndex Length = CFStringGetLength(a1);
  CFIndex v7 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
  uint64_t v8 = (char *)malloc(v7);
  if (!CFStringGetCString(a1, v8, v7, 0x8000100u)) {
    *uint64_t v8 = 0;
  }
  CFRelease(a1);
  if (v8)
  {
LABEL_9:
    v14[0] = v8;
    v14[1] = strlen(v8);
    v13[0] = 0xAAAAAAAA00000001LL;
    v13[1] = v14;
    void v13[2] = &v15;
    v16.location = 0LL;
    v16.CFIndex length = Count;
    CFArrayApplyFunction(v3, v16, (CFArrayApplierFunction)sub_1000105B4, v13);
    free(v8);
    size_t v9 = *(_BYTE **)(a2 + 8);
    if (v9 && (_BYTE)v15)
    {
      int v10 = *(unsigned __int8 *)(a2 + 16);
      *size_t v9 = 1;
      char v11 = v9[1];
      if (v10) {
        char v12 = v11 & HIBYTE(v15);
      }
      else {
        char v12 = v11 | HIBYTE(v15);
      }
      v9[1] = v12;
    }
  }

uint64_t sub_1000107DC(uint64_t a1, int a2, uint64_t a3)
{
  if (!a1) {
    return 4294941021LL;
  }
  uint64_t v4 = *(const __CFArray **)a1;
  if (!*(void *)a1) {
    return 4294941021LL;
  }
  v16.CFIndex length = CFArrayGetCount(*(CFArrayRef *)a1);
  __int16 v15 = 0;
  v12[1] = -1431655766;
  uint64_t v13 = a3;
  v12[0] = a2;
  char v14 = &v15;
  v16.location = 0LL;
  CFArrayApplyFunction(v4, v16, (CFArrayApplierFunction)sub_1000105B4, v12);
  CFIndex v7 = *(_BYTE **)(a1 + 8);
  if (v7 && (_BYTE)v15)
  {
    int v8 = *(unsigned __int8 *)(a1 + 16);
    *CFIndex v7 = 1;
    char v9 = v7[1];
    if (v8) {
      char v10 = v9 & HIBYTE(v15);
    }
    else {
      char v10 = v9 | HIBYTE(v15);
    }
    v7[1] = v10;
  }

  return 0LL;
}

uint64_t sub_1000108A4(uint64_t a1, int a2, const UInt8 **a3)
{
  if (!a1) {
    return 4294941021LL;
  }
  if (*(_DWORD *)a1 != a2) {
    return 4294941021LL;
  }
  uint64_t v4 = *(_BYTE **)(a1 + 16);
  if (!v4) {
    return 4294941021LL;
  }
  uint64_t v5 = *(const UInt8 ***)(a1 + 8);
  if (!v5) {
    return 4294941021LL;
  }
  *uint64_t v4 = 1;
  uint64_t result = 4294941021LL;
  switch(a2)
  {
    case 1:
      unint64_t v8 = (unint64_t)v5[1];
      char v9 = CFStringCreateWithBytes(kCFAllocatorDefault, *v5, v8, 0x8000100u, 0);
      char v10 = CFStringCreateWithBytes(kCFAllocatorDefault, *a3, (CFIndex)a3[1], 0x8000100u, 0);
      char v11 = v10;
      if (v9) {
        BOOL v12 = v10 == 0LL;
      }
      else {
        BOOL v12 = 1;
      }
      if (v12) {
        goto LABEL_83;
      }
      if (CFStringFind(v10, @"@", 0LL).location != -1)
      {
        CFComparisonResult v13 = CFStringCompare(v9, v11, 1uLL);
        goto LABEL_75;
      }

      CFIndex location = CFStringFind(v9, @"@", 0LL).location;
      if (location == -1) {
        goto LABEL_22;
      }
      CFIndex v47 = location;
      CFIndex v48 = location + 1;
      CFIndex Length = CFStringGetLength(v9);
      if (CFStringGetCharacterAtIndex(v11, 0LL) != 46)
      {
        v45.CFIndex length = Length + ~v47;
        uint64_t v43 = v9;
        unint64_t v44 = v11;
        v45.CFIndex location = v48;
        goto LABEL_74;
      }

      if (CFStringGetCharacterAtIndex(v9, v48) != 46 && CFStringHasSuffix(v9, v11))
      {
        BOOL v20 = 1;
        goto LABEL_76;
      }

      goto LABEL_22;
    case 2:
      unint64_t v14 = (unint64_t)v5[1];
      char v9 = CFStringCreateWithBytes(kCFAllocatorDefault, *v5, v14, 0x8000100u, 0);
      __int16 v15 = CFStringCreateWithBytes(kCFAllocatorDefault, *a3, (CFIndex)a3[1], 0x8000100u, 0);
      char v11 = v15;
      if (v9) {
        BOOL v16 = v15 == 0LL;
      }
      else {
        BOOL v16 = 1;
      }
      if (!v16)
      {
        CFIndex v17 = CFStringGetLength(v15);
        CFIndex v18 = CFStringGetLength(v9);
        CFIndex v19 = v18 - v17;
        if (v18 >= v17
          && (v18 == v17
           || (CFIndex v42 = v18, CFStringGetCharacterAtIndex(v11, 0LL) == 46)
           || CFStringGetCharacterAtIndex(v9, v42 + ~v17) == 46))
        {
          uint64_t v43 = v9;
          unint64_t v44 = v11;
          v45.CFIndex location = v19;
          v45.CFIndex length = v17;
LABEL_74:
          CFComparisonResult v13 = CFStringCompareWithOptions(v43, v44, v45, 1uLL);
LABEL_75:
          BOOL v20 = v13 == kCFCompareEqualTo;
        }

        else
        {
LABEL_22:
          BOOL v20 = 0;
        }

        goto LABEL_76;
      }

LABEL_83:
      BOOL v20 = 0;
      if (v9)
      {
LABEL_76:
        CFRelease(v9);
        goto LABEL_77;
      }

      goto LABEL_77;
    case 4:
      memset(&__s1, 170, 24);
      memset(v54, 170, sizeof(v54));
      if (DERDecodeItem((uint64_t)a3, v54)
        || v5[1] <= a3[1]
        || memcmp((const void *)__s1.length, (const void *)v54[1], v54[2]))
      {
        goto LABEL_27;
      }

      BOOL v20 = 1;
      goto LABEL_79;
    case 6:
      unint64_t v21 = (unint64_t)v5[1];
      if (v21 > 0x7FFFFFFFFFFFFFFELL || (unint64_t)a3[1] > 0x7FFFFFFFFFFFFFFELL)
      {
LABEL_27:
        BOOL v20 = 0;
        goto LABEL_79;
      }

      unint64_t v22 = CFStringCreateWithBytes(kCFAllocatorDefault, *v5, v21, 0x8000100u, 0);
      CFStringRef v23 = CFStringCreateWithBytes(kCFAllocatorDefault, *a3, (CFIndex)a3[1], 0x8000100u, 0);
      char v11 = v23;
      if (v22) {
        BOOL v24 = v23 == 0LL;
      }
      else {
        BOOL v24 = 1;
      }
      if (!v24)
      {
        CFRange v25 = CFStringFind(v22, @"://", 0LL);
        if (v25.location != -1)
        {
          CFIndex v26 = CFStringGetLength(v22) - (v25.location + v25.length);
          char v27 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @":/");
          CFRange __s1 = (CFRange)xmmword_100062910;
          v56.CFIndex location = v25.location + v25.length;
          v56.CFIndex length = v26;
          if (CFStringFindCharacterFromSet(v22, v27, v56, 0LL, &__s1))
          {
            CFIndex v28 = CFStringGetLength(v22);
            CFIndex v26 = v26 - v28 + __s1.location;
          }

          v57.CFIndex location = v25.location + v25.length;
          v57.CFIndex length = v26;
          uint64_t v29 = CFStringCreateWithSubstring(kCFAllocatorDefault, v22, v57);
          if (CFStringGetCharacterAtIndex(v29, 0LL) == 46
            || (CFIndex v30 = CFStringGetLength(v29), v31 = CFStringGetLength(v11), v32 = v30 < v31, v33 = v30 - v31, v32))
          {
            BOOL v36 = 0;
            if (v27) {
LABEL_43:
            }
              CFRelease(v27);
          }

          else
          {
            CFIndex v34 = v31;
            if (CFStringGetCharacterAtIndex(v11, 0LL) == 46) {
              v35.CFIndex location = v33;
            }
            else {
              v35.CFIndex location = 0LL;
            }
            v35.CFIndex length = v34;
            BOOL v36 = CFStringCompareWithOptions(v29, v11, v35, 1uLL) == kCFCompareEqualTo;
            if (v27) {
              goto LABEL_43;
            }
          }

          if (v29) {
            CFRelease(v29);
          }
          goto LABEL_46;
        }

        BOOL v36 = 0;
LABEL_46:
        CFRelease(v22);
        BOOL v20 = v36;
        goto LABEL_77;
      }

      BOOL v36 = 0;
      BOOL v20 = 0;
      if (v22) {
        goto LABEL_46;
      }
LABEL_77:
      if (v11) {
        CFRelease(v11);
      }
LABEL_79:
      uint64_t v4 = *(_BYTE **)(a1 + 16);
LABEL_80:
      uint64_t result = 0LL;
      v4[1] |= v20;
      break;
    case 7:
      int v37 = (unsigned __int8 *)a3[1];
      if (v37 != (unsigned __int8 *)32 && v37 != (unsigned __int8 *)8
        || ((int v38 = (unsigned __int8 *)v5[1], v38 != (unsigned __int8 *)16)
          ? (BOOL v39 = v38 == (unsigned __int8 *)4)
          : (BOOL v39 = 1),
            v39 ? (BOOL v40 = v37 == (unsigned __int8 *)(2LL * (void)v38)) : (BOOL v40 = 0),
            !v40 || (uint64_t v41 = &v38[(void)*a3], ((**v5 ^ **a3) & *v41) != 0)))
      {
        BOOL v20 = 0;
        goto LABEL_80;
      }

      uint64_t v50 = 1LL;
      while (v38 != (unsigned __int8 *)v50)
      {
        int v51 = v41[v50];
        int v52 = (*v5)[v50] ^ (*a3)[v50];
        ++v50;
        if ((v52 & v51) != 0)
        {
          int v53 = (unsigned __int8 *)(v50 - 1);
          goto LABEL_82;
        }
      }

      int v53 = (unsigned __int8 *)v5[1];
LABEL_82:
      BOOL v20 = v53 >= v38;
      goto LABEL_80;
    default:
      return result;
  }

  return result;
}

void sub_100010E28(const __CFData *a1, const __CFArray **a2)
{
  if (a1)
  {
    __int128 v3 = *a2;
    uint64_t v4 = a2[1];
    if ((CFDataGetLength(a1) & 0x8000000000000000LL) == 0)
    {
      if (v3)
      {
        v21[0] = CFDataGetBytePtr(a1);
        v21[1] = CFDataGetLength(a1);
        memset(v20, 170, sizeof(v20));
        if (!DERDecodeItem((uint64_t)v21, v20))
        {
          int v5 = 0;
          int v6 = 2;
          switch(v20[0])
          {
            case 0x8000000000000001LL:
              int v5 = 1;
              goto LABEL_14;
            case 0x8000000000000002LL:
              break;
            case 0x8000000000000003LL:
            case 0x8000000000000004LL:
            case 0x8000000000000005LL:
              goto LABEL_14;
            case 0x8000000000000006LL:
LABEL_9:
              int v5 = 6;
              goto LABEL_14;
            case 0x8000000000000007LL:
              int v5 = 7;
              goto LABEL_14;
            case 0x8000000000000008LL:
              int v5 = 8;
LABEL_14:
              CFArrayAppendValue(v4, a1);
              int v6 = v5;
              break;
            default:
              switch(v20[0])
              {
                case 0xA000000000000003LL:
                  int v5 = 3;
                  goto LABEL_14;
                case 0xA000000000000004LL:
                  int v6 = 4;
                  break;
                case 0xA000000000000005LL:
                  int v5 = 5;
                  goto LABEL_14;
                case 0xA000000000000006LL:
                  goto LABEL_9;
                default:
                  goto LABEL_14;
              }

              break;
          }

          CFIndex Count = CFArrayGetCount(v3);
          __int16 v19 = 0;
          v16[1] = -1431655766;
          CFIndex v17 = &v20[1];
          v16[0] = v6;
          CFIndex v18 = &v19;
          if (Count < 1)
          {
            CFIndex v8 = 0LL;
          }

          else
          {
            CFIndex v8 = 0LL;
            while (1)
            {
              ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v3, v8);
              if ((CFDataGetLength(ValueAtIndex) & 0x8000000000000000LL) == 0)
              {
                BytePtr = (const UInt8 *)0xAAAAAAAAAAAAAAAALL;
                CFIndex Length = 0xAAAAAAAAAAAAAAAALL;
                BytePtr = CFDataGetBytePtr(ValueAtIndex);
                CFIndex Length = CFDataGetLength(ValueAtIndex);
                memset(v13, 170, sizeof(v13));
                if (!DERDecodeItem((uint64_t)&BytePtr, v13))
                {
                  if (!SecCertificateParseGeneralNameContentProperty(v13[0], &v13[1], v16, sub_1000108A4)
                    && (_BYTE)v19
                    && HIBYTE(v19))
                  {
                    break;
                  }

                  int v10 = 0;
                  __int16 v12 = 0;
                  v11[0] = 0xAAAAAAAAAAAAAAAALL;
                  switch(v13[0])
                  {
                    case 0x8000000000000001LL:
                      int v10 = 1;
                      break;
                    case 0x8000000000000002LL:
                      int v10 = 2;
                      break;
                    case 0x8000000000000003LL:
                    case 0x8000000000000004LL:
                    case 0x8000000000000005LL:
                      break;
                    case 0x8000000000000006LL:
LABEL_26:
                      int v10 = 6;
                      break;
                    case 0x8000000000000007LL:
                      int v10 = 7;
                      break;
                    case 0x8000000000000008LL:
                      int v10 = 8;
                      break;
                    default:
                      switch(v13[0])
                      {
                        case 0xA000000000000003LL:
                          int v10 = 3;
                          break;
                        case 0xA000000000000004LL:
                          int v10 = 4;
                          break;
                        case 0xA000000000000005LL:
                          int v10 = 5;
                          break;
                        case 0xA000000000000006LL:
                          goto LABEL_26;
                        default:
                          goto LABEL_32;
                      }

                      break;
                  }

LABEL_32:
                  LODWORD(v11[0]) = v10;
                  v11[1] = &v13[1];
                  void v11[2] = &v12;
                  if (!SecCertificateParseGeneralNameContentProperty(v20[0], &v20[1], v11, sub_1000108A4)
                    && (_BYTE)v12
                    && HIBYTE(v12))
                  {
                    break;
                  }
                }
              }

              if (Count == ++v8) {
                goto LABEL_39;
              }
            }
          }

          if (v8 == Count)
          {
LABEL_39:
            CFArrayAppendValue(v4, a1);
          }

          else if ((_BYTE)v19)
          {
            if (HIBYTE(v19)) {
              CFArraySetValueAtIndex(v3, v8, a1);
            }
          }
        }
      }
    }
  }

uint64_t sub_100011134()
{
  int v0 = os_variant_uses_ephemeral_storage("com.apple.security");
  if (v0 && qword_100082B68 != -1) {
    dispatch_once(&qword_100082B68, &stru_1000763D8);
  }
  return v0 ^ 1u;
}

void sub_10001118C(id a1)
{
  uint64_t v1 = sub_10000856C("trustd");
  xpc_object_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "variant does not allow file writes", v3, 2u);
  }
}

uint64_t sub_1000111F8()
{
  if (sub_100011134())
  {
    if (qword_100082B70 != -1) {
      dispatch_once(&qword_100082B70, &stru_1000763F8);
    }
    if (byte_100082B78 != 1) {
      return 1LL;
    }
  }

  if (qword_100082B80 != -1) {
    dispatch_once(&qword_100082B80, &stru_100076418);
  }
  return 0LL;
}

void sub_100011280(id a1)
{
  uint64_t v1 = sub_10000856C("trustd");
  xpc_object_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "variant does not allow MobileAsset", v3, 2u);
  }
}

void sub_1000112EC(id a1)
{
  if (!objc_opt_class(&OBJC_CLASS___ASAssetQuery)
    || !objc_opt_class(&OBJC_CLASS___ASAsset)
    || !objc_opt_class(&OBJC_CLASS___MAAssetQuery)
    || !objc_opt_class(&OBJC_CLASS___MAAsset))
  {
    uint64_t v1 = sub_10000856C("OTATrust");
    xpc_object_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 v3 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Weak-linked MobileAsset framework missing.",  v3,  2u);
    }

    byte_100082B78 = 1;
  }

id sub_1000113A4()
{
  if (qword_100082B90 != -1) {
    dispatch_once(&qword_100082B90, &stru_100076438);
  }
  return (id)qword_100082B88;
}

void sub_1000113E4(id a1)
{
  dispatch_workloop_t v1 = dispatch_workloop_create("com.apple.trustd.evaluation");
  xpc_object_t v2 = (void *)qword_100082B88;
  qword_100082B88 = (uint64_t)v1;
}

uint64_t sub_10001140C()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011488;
  block[3] = &unk_1000790A8;
  void block[4] = &qword_100082BA0;
  if (qword_100082B98 != -1) {
    dispatch_once(&qword_100082B98, block);
  }
  return qword_100082BA0;
}

void sub_100011488(uint64_t a1)
{
  xpc_object_t v2 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/Security/Certificates.bundle",  kCFURLPOSIXPathStyle,  1u);
  if (v2)
  {
    __int128 v3 = v2;
    **(void **)(a1 + 32) = CFBundleCreate(kCFAllocatorDefault, v2);
    CFRelease(v3);
  }

  else
  {
    **(void **)(a1 + 32) = 0LL;
  }

  CFRelease(@"/System/Library/Security/Certificates.bundle");
}

id sub_100011514(void *a1)
{
  id v1 = a1;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  void v4[2] = sub_1000115AC;
  unint64_t v4[3] = &unk_100076528;
  id v2 = (id)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v1 count]));
  id v5 = v2;
  [v1 enumerateObjectsUsingBlock:v4];

  return v2;
}

void sub_1000115AC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    {
      id v7 = v5;
      CFIndex v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"log_id"]);
      char v9 = v8;
      if (!v8
        || (id v10 = v8,
            uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSData),
            char isKindOfClass = objc_opt_isKindOfClass(v10, v11),
            v10,
            (isKindOfClass & 1) == 0))
      {
        CFComparisonResult v13 = sub_10000856C("OTATrust");
        unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          int v20 = 134217984;
          uint64_t v21 = a3;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "failed to read log_id from trusted CT log array entry at index %lu, computing log_id",  (uint8_t *)&v20,  0xCu);
        }

        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKeyedSubscript:@"key"]);
        if (!v15 || (uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSData), (objc_opt_isKindOfClass(v15, v16) & 1) == 0))
        {
          CFIndex v18 = sub_10000856C("SecError");
          __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = 134217984;
            uint64_t v21 = a3;
            _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "failed to read key from trusted CT log array entry at index %lu",  (uint8_t *)&v20,  0xCu);
          }

          goto LABEL_16;
        }

        id v10 = (id)SecSHA256DigestCreateFromData(0LL, v15);
      }

      [*(id *)(a1 + 32) setObject:v7 forKey:v10];
      char v9 = v10;
LABEL_16:

      goto LABEL_17;
    }
  }

  CFIndex v17 = sub_10000856C("SecError");
  id v7 = (id)objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 134217984;
    uint64_t v21 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to read entry from trusted CT logs array at index %lu",  (uint8_t *)&v20,  0xCu);
  }

uint64_t sub_100011810(uint64_t a1)
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_100076458);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_100011840(void *a1)
{
  id v2 = (const void *)a1[2];
  if (v2)
  {
    a1[2] = 0LL;
    CFRelease(v2);
  }

  __int128 v3 = (const void *)a1[3];
  if (v3)
  {
    a1[3] = 0LL;
    CFRelease(v3);
  }

  uint64_t v4 = (const void *)a1[4];
  if (v4)
  {
    a1[4] = 0LL;
    CFRelease(v4);
  }

  id v5 = (const void *)a1[8];
  if (v5)
  {
    a1[8] = 0LL;
    CFRelease(v5);
  }

  uint64_t v6 = (const void *)a1[9];
  if (v6)
  {
    a1[9] = 0LL;
    CFRelease(v6);
  }

  id v7 = (const void *)a1[12];
  if (v7)
  {
    a1[12] = 0LL;
    CFRelease(v7);
  }

  CFIndex v8 = (const void *)a1[13];
  if (v8)
  {
    a1[13] = 0LL;
    CFRelease(v8);
  }

  char v9 = (const void *)a1[5];
  if (v9)
  {
    a1[5] = 0LL;
    CFRelease(v9);
  }

  id v10 = (const void *)a1[6];
  if (v10)
  {
    a1[6] = 0LL;
    CFRelease(v10);
  }

  uint64_t v11 = (const void *)a1[7];
  if (v11)
  {
    a1[7] = 0LL;
    CFRelease(v11);
  }

  __int16 v12 = (const void *)a1[21];
  if (v12)
  {
    a1[21] = 0LL;
    CFRelease(v12);
  }

  CFComparisonResult v13 = (const void *)a1[22];
  if (v13)
  {
    a1[22] = 0LL;
    CFRelease(v13);
  }

  unint64_t v14 = (const void *)a1[20];
  if (v14)
  {
    a1[20] = 0LL;
    CFRelease(v14);
  }

  __int16 v15 = (const void *)a1[23];
  if (v15)
  {
    a1[23] = 0LL;
    CFRelease(v15);
  }

  uint64_t v16 = (void *)a1[10];
  if (v16)
  {
    free(v16);
    a1[10] = 0LL;
  }

  CFIndex v17 = (void *)a1[15];
  if (v17)
  {
    free(v17);
    a1[15] = 0LL;
  }

  CFIndex v18 = (void *)a1[26];
  a1[26] = 0LL;

  __int16 v19 = (const void *)a1[27];
  if (v19)
  {
    a1[27] = 0LL;
    CFRelease(v19);
  }

CFStringRef sub_100011980(uint64_t a1)
{
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"<SecOTAPKIRef: version %llu/%llu>",  *(void *)(a1 + 112),  *(void *)(a1 + 152));
}

CFStringRef sub_1000119C4(uint64_t a1)
{
  return CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"<SecOTAPKIRef: version %llu/%llu>",  *(void *)(a1 + 112),  *(void *)(a1 + 152));
}

uint64_t sub_100011A14()
{
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  if (qword_100082BD0 != -1) {
    dispatch_once(&qword_100082BD0, &stru_1000764B8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011AD0;
  block[3] = &unk_1000772B8;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

CFTypeRef sub_100011AD0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = qword_100082BD8;
  CFTypeRef result = *(CFTypeRef *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  if (result) {
    return CFRetain(result);
  }
  return result;
}

void sub_100011AFC(id a1)
{
  id v1 = objc_autoreleasePoolPush();
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.security.OTAPKIQueue", 0LL);
  uint64_t v3 = (void *)qword_100082BB0;
  qword_100082BB0 = (uint64_t)v2;

  dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
  uint64_t v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.security.OTAPKIBackgroundQueue", v7);
  char v9 = (void *)qword_100082BA8;
  qword_100082BA8 = (uint64_t)v8;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.security.OTAPKIReloadAssetQueue", 0LL);
  uint64_t v11 = (void *)qword_100082BB8;
  qword_100082BB8 = (uint64_t)v10;

  __int16 v12 = (dispatch_queue_s *)qword_100082BB0;
  if (!qword_100082BB0 || !qword_100082BA8 || !qword_100082BB8)
  {
    CFComparisonResult v13 = sub_10000856C("SecError");
    unint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to create OTAPKI Queues. May crash later.",  v15,  2u);
    }

    __int16 v12 = (dispatch_queue_s *)qword_100082BB0;
  }

  dispatch_sync(v12, &stru_1000764D8);

  objc_autoreleasePoolPop(v1);
}

void sub_100011C40(id a1)
{
  *(void *)&buf[0].st_dev = _NSConcreteStackBlock;
  buf[0].st_ino = 3221225472LL;
  *(void *)&buf[0].st_uid = sub_100011810;
  *(void *)&buf[0].st_rdev = &unk_1000790A8;
  buf[0].st_atimespec.tv_sec = (__darwin_time_t)&qword_100082BC8;
  if (qword_100082BC0 != -1) {
    dispatch_once(&qword_100082BC0, buf);
  }
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_100082BC8, 208LL, 0LL);
  uint64_t v2 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    uint64_t v3 = (__CFSet **)(Instance + 16);
    *(void *)(Instance + 12syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_OWORD *)(Instance + 4_Block_object_dispose(va, 8) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(void *)(Instance + 8syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
    *(void *)(Instance + 96) = 0LL;
    *(void *)(Instance + 104) = 0LL;
    *(_OWORD *)(Instance + 16syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0u;
    *(_OWORD *)(Instance + 176) = 0u;
    dispatch_queue_attr_t v4 = *(void **)(Instance + 208);
    *(void *)(Instance + 20_Block_object_dispose(va, 8) = 0LL;

    *(void *)(v2 + 216) = 0LL;
    if (sub_1000111F8())
    {
      id v129 = 0LL;
      uint64_t v5 = -[OTAAutoAssetClient initWithError:](objc_alloc(&OBJC_CLASS___OTAAutoAssetClient), "initWithError:", &v129);
      dispatch_queue_attr_t v6 = (__CFError *)v129;
      id v7 = *(void **)(v2 + 208);
      *(void *)(v2 + 20_Block_object_dispose(va, 8) = v5;

      dispatch_queue_t v8 = *(void **)(v2 + 208);
      if (v8)
      {
        [v8 registerForAssetChangedNotificationsWithBlock:&stru_100076548];
      }

      else
      {
        char v9 = sub_10000856C("SecError");
        dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          buf[0].st_dev = 138412290;
          *(void *)&buf[0].st_mode = v6;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Error initializing OTAAutoAssetClient: %@",  (uint8_t *)buf,  0xCu);
        }

        if (v6) {
          CFIndex Code = CFErrorGetCode(v6);
        }
        else {
          CFIndex Code = 0xFFFFFFFFLL;
        }
        sub_10004AC48((uint64_t)@"AssetBuiltInEvent", 0, Code);
      }
    }

    __int16 v12 = (const __CFData *)sub_100012D6C(v2, (uint64_t)@"AssetVersion", (uint64_t)@"plist");
    uint64_t v13 = sub_100012E80(v12);
    if (v13)
    {
      uint64_t v14 = v13;
      __int16 v15 = "asset";
      if (!v12) {
        goto LABEL_17;
      }
    }

    else
    {
      if (v12) {
        CFRelease(v12);
      }
      __int16 v12 = sub_100012F34(@"AssetVersion", @"plist");
      uint64_t v14 = sub_100012E80(v12);
      __int16 v15 = "system";
      if (!v12)
      {
LABEL_17:
        uint64_t v16 = sub_10000856C("OTATrust");
        CFIndex v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          buf[0].st_dev = 134218242;
          *(void *)&buf[0].st_mode = v14;
          WORD2(buf[0].st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)v15;
          _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Using trust store version %llu from %s",  (uint8_t *)buf,  0x16u);
        }

        *(void *)(v2 + 112) = v14;
        CFIndex v18 = sub_10001305C(@"Blocked");
        __int16 v19 = sub_1000130B8(v18);
        if (v18) {
          CFRelease(v18);
        }
        *uint64_t v3 = v19;
        int v20 = sub_10001305C(@"GrayListedKeys");
        uint64_t v21 = sub_1000130B8(v20);
        if (v20) {
          CFRelease(v20);
        }
        *(void *)(v2 + 24) = v21;
        *(void *)(v2 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = sub_100013160(@"TrustedCTLogs.plist");
        *(void *)(v2 + 4_Block_object_dispose(va, 8) = 0LL;
        *(void *)(v2 + 56) = sub_1000133C8(@"CertificatePinning", @"plist");
        unint64_t v22 = 0LL;
        id v23 = 0LL;
        id v24 = 0LL;
        if (sub_1000134B0())
        {
          id v25 = sub_1000135AC(@"AnalyticsSamplingRates.plist");
          CFIndex v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
          *(void *)uint64_t valuePtr = 0LL;
          unint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v26,  valuePtr));
          id v27 = *(id *)valuePtr;

          if (v22
            && (id v28 = v22,
                uint64_t v29 = objc_opt_class(&OBJC_CLASS___NSDictionary),
                char isKindOfClass = objc_opt_isKindOfClass(v28, v29),
                v28,
                (isKindOfClass & 1) != 0))
          {
            id v24 = v27;
          }

          else
          {
            CFIndex v31 = sub_10000856C("SecError");
            BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              buf[0].st_dev = 138412290;
              *(void *)&buf[0].st_mode = v27;
              _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to read sampling rates from asset data: %@",  (uint8_t *)buf,  0xCu);
            }

            *(void *)&buf[0].st_dev = v27;
            sub_1000137D8(4, (uint64_t *)&buf[0].st_dev, 0LL);
            id v24 = *(id *)&buf[0].st_dev;

            if ((sub_10001387C() & 1) == 0) {
              byte_100082BE0 = 1;
            }
          }

          CFIndex v33 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKeyedSubscript:@"Events"]);
          if (v33)
          {
            id v23 = v33;
            uint64_t v34 = objc_opt_class(&OBJC_CLASS___NSDictionary);
            char v35 = objc_opt_isKindOfClass(v23, v34);

            if ((v35 & 1) != 0)
            {
              if (!v22) {
                goto LABEL_45;
              }
LABEL_41:
              id v39 = v22;
              uint64_t v40 = objc_opt_class(&OBJC_CLASS___NSDictionary);
              char v41 = objc_opt_isKindOfClass(v39, v40);

              if ((v41 & 1) != 0)
              {
                id v42 = (id)objc_claimAutoreleasedReturnValue([v39 objectForKeyedSubscript:@"Events"]);

                if (!v42)
                {
                  id v23 = 0LL;
LABEL_46:

                  *(void *)(v2 + 16_Block_object_dispose(va, 8) = v42;
                  if (sub_1000134B0())
                  {
                    id v45 = sub_1000135AC(@"AppleCertificateAuthorities.plist");
                    char v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
                    *(void *)uint64_t valuePtr = 0LL;
                    id v47 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithContentsOfURL:error:]( &OBJC_CLASS___NSArray,  "arrayWithContentsOfURL:error:",  v46,  valuePtr));
                    id v48 = *(id *)valuePtr;

                    if (v47)
                    {
                      id v49 = v47;
                      uint64_t v50 = objc_opt_class(&OBJC_CLASS___NSArray);
                      char v51 = objc_opt_isKindOfClass(v49, v50);

                      if ((v51 & 1) != 0)
                      {
                        id v52 = v48;
                        goto LABEL_56;
                      }
                    }

                    int v53 = sub_10000856C("SecError");
                    uint64_t v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
                    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                    {
                      buf[0].st_dev = 138412290;
                      *(void *)&buf[0].st_mode = v48;
                      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to read Apple CAs list from asset data: %@",  (uint8_t *)buf,  0xCu);
                    }

                    *(void *)&buf[0].st_dev = v48;
                    sub_1000137D8(4, (uint64_t *)&buf[0].st_dev, 0LL);
                    id v52 = *(id *)&buf[0].st_dev;

                    if ((sub_10001387C() & 1) == 0) {
                      byte_100082BE0 = 1;
                    }
                    if (v47)
                    {
LABEL_56:
                      id v47 = v47;
                      uint64_t v55 = objc_opt_class(&OBJC_CLASS___NSArray);
                      char v56 = objc_opt_isKindOfClass(v47, v55);

                      CFRange v57 = v47;
                      if ((v56 & 1) != 0) {
                        goto LABEL_58;
                      }
                    }
                  }

                  else
                  {
                    id v47 = 0LL;
                    id v52 = 0LL;
                  }

                  id v58 = sub_1000138E0(@"AppleCertificateAuthorities.plist");
                  uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
                  CFRange v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithContentsOfURL:]( &OBJC_CLASS___NSArray,  "arrayWithContentsOfURL:",  v59));

                  if (!v57)
                  {
                    id v60 = 0LL;
                    goto LABEL_62;
                  }

LABEL_62:
                  *(void *)(v2 + 176) = v57;
                  if ((byte_100082BE0 & 1) != 0)
                  {
                    *(void *)(v2 + 152) = sub_100013E48(@"MobileAssetContentVersion");
                  }

                  else
                  {
                    *(void *)&buf[0].st_dev = 0LL;
                    *(void *)(v2 + 152) = sub_1000139E0(buf);
                    *(void *)(v2 + 16syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = sub_100013CA4();
                    int v63 = *(const void **)&buf[0].st_dev;
                    if (*(void *)&buf[0].st_dev)
                    {
                      *(void *)&buf[0].st_dev = 0LL;
                      CFRelease(v63);
                    }
                  }

                  *(void *)(v2 + 192) = 0LL;
                  *(void *)&buf[0].st_dev = 0LL;
                  *(void *)uint64_t valuePtr = 0LL;
                  v131 = 0LL;
                  int v64 = sub_100012F34(@"ValidUpdate", @"plist");
                  if (v64)
                  {
                    int v65 = v64;
                    formCFAbsoluteTime at = 0xAAAAAAAAAAAAAAAALL;
                    uint64_t v66 = (const __CFDictionary *)CFPropertyListCreateWithData( kCFAllocatorDefault,  v64,  0LL,  &format,  0LL);
                    if (v66)
                    {
                      uint64_t v67 = v66;
                      CFTypeID TypeID = CFDictionaryGetTypeID();
                      if (TypeID == CFGetTypeID(v67))
                      {
                        Value = (const __CFNumber *)CFDictionaryGetValue(v67, @"Version");
                        if (Value) {
                          CFNumberGetValue(Value, kCFNumberCFIndexType, buf);
                        }
                        uint64_t v70 = (const __CFNumber *)CFDictionaryGetValue(v67, @"Format");
                        if (v70) {
                          CFNumberGetValue(v70, kCFNumberCFIndexType, valuePtr);
                        }
                        uint64_t v71 = (const __CFNumber *)CFDictionaryGetValue(v67, @"Generation");
                        if (v71) {
                          CFNumberGetValue(v71, kCFNumberCFIndexType, &v131);
                        }
                      }

                      CFRelease(v67);
                    }

                    CFRelease(v65);
                  }

                  uint64_t v72 = *(void *)valuePtr;
                  int v73 = v131;
                  *(void *)(v2 + 12_Block_object_dispose(va, 8) = *(void *)&buf[0].st_dev;
                  *(void *)(v2 + 136) = v72;
                  *(void *)(v2 + 144) = v73;
                  v131 = 0LL;
                  int v74 = sub_1000133C8(@"valid", @"sqlite3");
                  if (v74)
                  {
                    CFDataRef v75 = v74;
                    CFStringRef v76 = CFURLCopyFileSystemPath(v74, kCFURLPOSIXPathStyle);
                    bzero(buf, 0x400uLL);
                    if (v76)
                    {
                      CStringPtr = CFStringGetCStringPtr(v76, 0x8000100u);
                      if (CStringPtr
                        || (CStringPtr = (const char *)buf, CFStringGetCString(v76, (char *)buf, 1024LL, 0x8000100u)))
                      {
                        asprintf(&v131, "%s", CStringPtr);
                      }

                      else
                      {
                        v101 = sub_10000856C("SecError");
                        v102 = (os_log_s *)objc_claimAutoreleasedReturnValue(v101);
                        if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)uint64_t valuePtr = 136315138;
                          *(void *)&valuePtr[4] = "could not get valid snapshot";
                          _os_log_impl( (void *)&_mh_execute_header,  v102,  OS_LOG_TYPE_DEFAULT,  "%s path as UTF8 string",  valuePtr,  0xCu);
                        }
                      }

                      CFRelease(v76);
                    }

                    else
                    {
                      CFRange v80 = sub_10000856C("SecError");
                      unsigned int v81 = (os_log_s *)objc_claimAutoreleasedReturnValue(v80);
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)uint64_t valuePtr = 136315138;
                        *(void *)&valuePtr[4] = "could not get valid snapshot";
                        _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "%s path", valuePtr, 0xCu);
                      }
                    }

                    CFRelease(v75);
                    CFIndex v82 = v131;
                    if (!v131) {
                      goto LABEL_93;
                    }
                    v83.tv_sec = 0xAAAAAAAAAAAAAAAALL;
                    v83.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
                    *(timespec *)&buf[0].st_blksize = v83;
                    *(timespec *)buf[0].st_qspare = v83;
                    buf[0].st_birthtimespec = v83;
                    *(timespec *)&buf[0].st_size = v83;
                    buf[0].st_mtimespec = v83;
                    buf[0].st_ctimespec = v83;
                    *(timespec *)&buf[0].st_uid = v83;
                    buf[0].st_atimespec = v83;
                    *(timespec *)&buf[0].st_dev = v83;
                    int v84 = stat(v131, buf);
                    CFIndex v82 = v131;
                    if (!v84)
                    {
LABEL_93:
                      *(void *)(v2 + 12syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v82;
                      unint64_t v85 = sub_10001305C(@"EVRoots");
                      if (v85)
                      {
                        int8x16_t v86 = v85;
                        CFTypeID v87 = CFGetTypeID(v85);
                        if (v87 == CFDictionaryGetTypeID())
                        {
                          *(void *)(v2 + 64) = v86;
                          *(void *)uint64_t valuePtr = 0LL;
                          formCFAbsoluteTime at = 0LL;
                          v131 = 0LL;
                          if ((sub_100013F34(v2, (const __CFDictionary **)valuePtr, &v131, (size_t *)&format, 1) & 1) != 0) {
                            goto LABEL_99;
                          }
                          int64x2_t v88 = sub_10000856C("OTATrust");
                          uint64x2_t v89 = (os_log_s *)objc_claimAutoreleasedReturnValue(v88);
                          if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf[0].st_dev) = 0;
                            _os_log_impl( (void *)&_mh_execute_header,  v89,  OS_LOG_TYPE_DEFAULT,  "Using built-in system anchors",  (uint8_t *)buf,  2u);
                          }

                          if ((sub_100013F34(v2, (const __CFDictionary **)valuePtr, &v131, (size_t *)&format, 0) & 1) != 0)
                          {
LABEL_99:
                            int64x2_t v90 = v131;
                            *(void *)(v2 + 72) = *(void *)valuePtr;
                            *(void *)(v2 + 8syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v90;
                            *(void *)(v2 + 8_Block_object_dispose(va, 8) = format;
                            int8x16_t v91 = sub_1000145D4(v2);
                            if (!v91) {
                              goto LABEL_131;
                            }
                            int8x16_t v92 = v91;
                            CFNumberRef v93 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/../%@",  v91,  @"Info"));
                            CFRelease(v92);
                            uint64_t v94 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%@",  v93,  @"plist"));

                            v95 = (void *)objc_claimAutoreleasedReturnValue( +[NSURL fileURLWithPath:isDirectory:]( &OBJC_CLASS___NSURL,  "fileURLWithPath:isDirectory:",  v94,  0LL));
                            if (v95)
                            {
                              v96 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:",  v95));
                              if (v96)
                              {
                                v97 = v96;
                                v98 = v97;
                                goto LABEL_124;
                              }

                              v104 = (const char *)[v95 fileSystemRepresentation];
                              v105 = sub_10000856C("SecWarning");
                              v106 = (os_log_s *)objc_claimAutoreleasedReturnValue(v105);
                              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                              {
                                v107 = "";
                                if (v104) {
                                  v107 = v104;
                                }
                                buf[0].st_dev = 136315138;
                                *(void *)&buf[0].st_mode = v107;
                                _os_log_impl( (void *)&_mh_execute_header,  v106,  OS_LOG_TYPE_DEFAULT,  "Unable to get data from %s",  (uint8_t *)buf,  0xCu);
                              }

                              v97 = 0LL;
                            }

                            else
                            {
                              v103 = sub_10000856C("SecWarning");
                              v97 = (os_log_s *)objc_claimAutoreleasedReturnValue(v103);
                              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
                              {
                                buf[0].st_dev = 138412802;
                                *(void *)&buf[0].st_mode = @"Info";
                                WORD2(buf[0].st_ino) = 2112;
                                *(__darwin_ino64_t *)((char *)&buf[0].st_ino + 6) = (__darwin_ino64_t)@"plist";
                                HIWORD(buf[0].st_gid) = 2112;
                                *(void *)&buf[0].st_rdev = 0LL;
                                _os_log_impl( (void *)&_mh_execute_header,  v97,  OS_LOG_TYPE_DEFAULT,  "resource: %@.%@ in %@ not found",  (uint8_t *)buf,  0x20u);
                              }
                            }

                            v98 = 0LL;
LABEL_124:

                            if (v98)
                            {
                              *(void *)&buf[0].st_dev = 0xAAAAAAAAAAAAAAAALL;
                              v108 = (const __CFDictionary *)CFPropertyListCreateWithData( kCFAllocatorDefault,  v98,  0LL,  (CFPropertyListFormat *)buf,  0LL);
                              if (!v108)
                              {
                                v112 = 0LL;
                                goto LABEL_135;
                              }

                              v109 = v108;
                              CFTypeID v110 = CFGetTypeID(v108);
                              if (v110 == CFDictionaryGetTypeID())
                              {
                                v111 = (const __CFDictionary *)CFDictionaryGetValue( v109,  @"MobileAssetProperties");
                                v112 = v111;
                                if (!v111)
                                {
LABEL_133:
                                  CFRelease(v109);
LABEL_135:
                                  CFRelease(v98);
                                  goto LABEL_136;
                                }

                                CFTypeID v113 = CFGetTypeID(v111);
                                if (v113 == CFDictionaryGetTypeID())
                                {
                                  v114 = (const __CFDictionary *)CFDictionaryGetValue(v112, @"AssetVersion");
                                  v112 = v114;
                                  if (v114) {
                                    CFRetain(v114);
                                  }
                                  goto LABEL_133;
                                }
                              }

                              v112 = 0LL;
                              goto LABEL_133;
                            }

LABEL_131:
                            v112 = 0LL;
LABEL_136:
                            *(void *)(v2 + 96) = v112;
                            v115 = (const __CFData *)SecSHA256DigestCreate( 0LL,  *(void *)(v2 + 80),  *(void *)(v2 + 88));
                            if (v115)
                            {
                              v116 = v115;
                              CFIndex Length = CFDataGetLength(v115);
                              CFMutableArrayRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 2 * Length);
                              BytePtr = CFDataGetBytePtr(v116);
                              CFIndex v120 = CFDataGetLength(v116);
                              if (v120 >= 1)
                              {
                                CFIndex v121 = v120;
                                do
                                {
                                  unsigned int v122 = *BytePtr++;
                                  CFStringAppendFormat(Mutable, 0LL, @"%02X", v122);
                                  --v121;
                                }

                                while (v121);
                              }

                              CFRelease(v116);
                            }

                            else
                            {
                              CFMutableArrayRef Mutable = 0LL;
                            }

                            *(void *)(v2 + 104) = Mutable;
                            if (sub_1000111F8())
                            {
                              v123 = (dispatch_queue_s *)(id)qword_100082BA8;
                              if (sub_1000111F8())
                              {
                                if (qword_100082C10 != -1) {
                                  dispatch_once(&qword_100082C10, &stru_100076788);
                                }
                                if (byte_100082C08 == 1)
                                {
                                  if (sub_1000111F8())
                                  {
                                    buf[0].st_dev = 0;
                                    notify_register_dispatch( "com.apple.MobileAsset.PKITrustSupplementals.ma.cached-metadata-updated",  &buf[0].st_dev,  v123,  &stru_1000765A8);
                                  }

                                  dispatch_async(v123, &stru_1000765C8);
                                }

                                else
                                {
                                  v124 = sub_10000856C("OTATrust");
                                  v125 = (os_log_s *)objc_claimAutoreleasedReturnValue(v124);
                                  if (os_log_type_enabled(v125, OS_LOG_TYPE_DEFAULT))
                                  {
                                    LOWORD(buf[0].st_dev) = 0;
                                    _os_log_impl( (void *)&_mh_execute_header,  v125,  OS_LOG_TYPE_DEFAULT,  "Initializing listener for PKI Asset changes from system trustd.",  (uint8_t *)buf,  2u);
                                  }

                                  buf[0].st_dev = 0;
                                  notify_register_dispatch( "com.apple.trustd.asset-updated",  &buf[0].st_dev,  v123,  &stru_1000765E8);
                                  int out_token = 0;
                                  notify_register_dispatch( "com.apple.trustd.asset-check-in",  &out_token,  v123,  &stru_100076608);
                                  int v132 = 0;
                                  notify_register_dispatch("com.apple.trustd.kill-switch", &v132, v123, &stru_100076628);
                                }
                              }

                              *(_BYTE *)(v2 + 20syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = sub_1000146C4(@"CTKillSwitch");
                              *(_BYTE *)(v2 + 201) = sub_1000146C4(@"CTKillSwitch_nonTLS");
                              v126 = (dispatch_queue_s *)(id)qword_100082BA8;
                              if (qword_100082C10 != -1) {
                                dispatch_once(&qword_100082C10, &stru_100076788);
                              }
                              if (byte_100082C08 == 1)
                              {
                                dispatch_async(v126, &stru_100076700);
                              }

                              else
                              {
                                v127 = sub_10000856C("OTATrust");
                                v128 = (os_log_s *)objc_claimAutoreleasedReturnValue(v127);
                                if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(buf[0].st_dev) = 0;
                                  _os_log_impl( (void *)&_mh_execute_header,  v128,  OS_LOG_TYPE_DEFAULT,  "Initializing listener for SecExperiment Asset changes from system trustd.",  (uint8_t *)buf,  2u);
                                }

                                buf[0].st_dev = 0;
                                notify_register_dispatch( "com.apple.trustd.secexperiment.asset-updated",  &buf[0].st_dev,  v126,  &stru_100076720);
                              }
                            }

                            else
                            {
                              *(_WORD *)(v2 + 20syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 257;
                            }

                            goto LABEL_107;
                          }

                          if (*(void *)valuePtr) {
                            CFRelease(*(CFTypeRef *)valuePtr);
                          }
                          if (v131) {
                            free(v131);
                          }
                        }

                        else
                        {
                          v99 = sub_10000856C("SecWarning");
                          v100 = (os_log_s *)objc_claimAutoreleasedReturnValue(v99);
                          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
                          {
                            LOWORD(buf[0].st_dev) = 0;
                            _os_log_impl( (void *)&_mh_execute_header,  v100,  OS_LOG_TYPE_DEFAULT,  "EVRoot.plist is wrong type.",  (uint8_t *)buf,  2u);
                          }

                          CFRelease(v86);
                        }
                      }

                      CFRelease((CFTypeRef)v2);
                      uint64_t v2 = 0LL;
                      goto LABEL_107;
                    }

                    free(v131);
                  }

                  else
                  {
                    double v78 = sub_10000856C("SecError");
                    int8x8_t v79 = (os_log_s *)objc_claimAutoreleasedReturnValue(v78);
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                    {
                      buf[0].st_dev = 136315138;
                      *(void *)&buf[0].st_mode = "could not get valid snapshot";
                      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)buf, 0xCu);
                    }
                  }

                  CFIndex v82 = 0LL;
                  goto LABEL_93;
                }

                id v23 = v42;
                uint64_t v43 = objc_opt_class(&OBJC_CLASS___NSDictionary);
                char v44 = objc_opt_isKindOfClass(v23, v43);

                if ((v44 & 1) != 0)
                {
                  id v42 = v23;
                  id v23 = v42;
                  goto LABEL_46;
                }
              }

LABEL_45:
              id v42 = 0LL;
              goto LABEL_46;
            }
          }

          else
          {
            id v23 = 0LL;
          }
        }

        id v36 = sub_1000138E0(@"AnalyticsSamplingRates.plist");
        int v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
        uint64_t v38 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v37));

        unint64_t v22 = (void *)v38;
        if (!v38) {
          goto LABEL_45;
        }
        goto LABEL_41;
      }
    }

    CFRelease(v12);
    goto LABEL_17;
  }

        id v36 = 0;
        goto LABEL_34;
      }

      uint64_t v43 = KeyUsage;
      char v44 = (os_log_s *)sub_10000856C("ev");
      id v36 = 0;
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LODWORD(v46[0]) = 67109120;
      HIDWORD(v46[0]) = v43;
      uint64_t v40 = "Leaf has invalid key usage %u";
      char v41 = v44;
      id v42 = 8;
    }

    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, v40, (uint8_t *)v46, v42);
    goto LABEL_45;
  }

  return v12;
}

LABEL_107:
  qword_100082BD8 = v2;
}

void *sub_100012D6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = sub_1000186EC(a1, a2, a3);
  if (!v3) {
    return 0LL;
  }
  dispatch_queue_attr_t v4 = v3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v3));
  dispatch_queue_attr_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else
  {
    dispatch_queue_t v8 = (const char *)[v4 fileSystemRepresentation];
    char v9 = sub_10000856C("SecWarning");
    dispatch_queue_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = "";
      if (v8) {
        uint64_t v11 = v8;
      }
      int v13 = 136315138;
      uint64_t v14 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Unable to get data from %s",  (uint8_t *)&v13,  0xCu);
    }
  }

  CFRelease(v4);

  return v6;
}

uint64_t sub_100012E80(CFDataRef data)
{
  if (!data) {
    return 0LL;
  }
  formCFAbsoluteTime at = 0xAAAAAAAAAAAAAAAALL;
  CFPropertyListRef v1 = CFPropertyListCreateWithData(kCFAllocatorDefault, data, 0LL, &format, 0LL);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID == CFGetTypeID(v2)
    && (Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v2, @"VersionNumber")) != 0LL)
  {
    uint64_t v7 = 0LL;
    CFNumberGetValue(Value, kCFNumberSInt64Type, &v7);
    uint64_t v5 = v7 & ~(v7 >> 63);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  CFRelease(v2);
  return v5;
}

CFURLRef sub_100012F34(const __CFString *a1, const __CFString *a2)
{
  CFTypeRef result = sub_1000133C8(a1, a2);
  CFDataRef resourceData = 0LL;
  if (result)
  {
    uint64_t v3 = result;
    errorCFIndex Code = -1431655766;
    if (!CFURLCreateDataAndPropertiesFromResource(kCFAllocatorDefault, result, &resourceData, 0LL, 0LL, &errorCode))
    {
      dispatch_queue_attr_t v4 = (const char *)-[__CFURL fileSystemRepresentation](v3, "fileSystemRepresentation");
      uint64_t v5 = sub_10000856C("SecWarning");
      dispatch_queue_attr_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = "";
        if (v4) {
          uint64_t v7 = v4;
        }
        *(_DWORD *)__int128 buf = 136315394;
        uint64_t v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = errorCode;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Unable to get data from %s: error %ld",  buf,  0x16u);
      }
    }

    CFRelease(v3);
    return resourceData;
  }

  return result;
}

CFDataRef sub_10001305C(const __CFString *a1)
{
  CFTypeRef result = sub_100012F34(a1, @"plist");
  if (result)
  {
    uint64_t v2 = result;
    CFPropertyListRef v3 = CFPropertyListCreateWithData(kCFAllocatorDefault, result, 0LL, 0LL, 0LL);
    CFRelease(v2);
    return (const __CFData *)v3;
  }

  return result;
}

__CFSet *sub_1000130B8(const void *a1)
{
  if (!a1) {
    return 0LL;
  }
  CFTypeID v2 = CFGetTypeID(a1);
  if (v2 != CFArrayGetTypeID()) {
    return 0LL;
  }
  CFMutableArrayRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
  if (Mutable)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)a1);
    if (Count >= 1)
    {
      CFIndex v5 = Count;
      for (CFIndex i = 0LL; i != v5; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, i);
        CFSetAddValue(Mutable, ValueAtIndex);
      }
    }
  }

  return Mutable;
}

id sub_100013160(void *a1)
{
  id v1 = a1;
  CFTypeID v2 = objc_autoreleasePoolPush();
  if (sub_1000134B0())
  {
    id v3 = sub_1000135AC(v1);
    dispatch_queue_attr_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    id v24 = 0LL;
    id v5 = (id)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithContentsOfURL:error:]( &OBJC_CLASS___NSArray,  "arrayWithContentsOfURL:error:",  v4,  &v24));
    id v6 = v24;

    if (v5)
    {
      id v7 = v5;
      uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSArray);
      char isKindOfClass = objc_opt_isKindOfClass(v7, v8);

      if ((isKindOfClass & 1) != 0)
      {
        id v10 = v6;
        goto LABEL_11;
      }
    }

    uint64_t v11 = sub_10000856C("SecError");
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v26 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to read CT list from asset data: %@",  buf,  0xCu);
    }

    id v23 = v6;
    sub_1000137D8(4, (uint64_t *)&v23, 0LL);
    id v10 = v23;

    if ((sub_10001387C() & 1) == 0) {
      byte_100082BE0 = 1;
    }
    if (v5)
    {
LABEL_11:
      id v5 = v5;
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSArray);
      char v14 = objc_opt_isKindOfClass(v5, v13);

      id v15 = v5;
      if ((v14 & 1) != 0) {
        goto LABEL_13;
      }
    }
  }

  else
  {
    id v5 = 0LL;
    id v10 = 0LL;
  }

  id v16 = sub_1000138E0(v1);
  CFIndex v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:", v17));

  if (!v15)
  {
    id v18 = 0LL;
    goto LABEL_17;
  }

CFURLRef sub_1000133C8(const __CFString *a1, const __CFString *a2)
{
  dispatch_queue_attr_t v4 = (__CFBundle *)sub_10001140C();
  if (!v4 || (CFURLRef result = CFBundleCopyResourceURL(v4, a1, a2, 0LL)) == 0LL)
  {
    id v6 = sub_10000856C("SecWarning");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412802;
      char v9 = a1;
      __int16 v10 = 2112;
      uint64_t v11 = a2;
      __int16 v12 = 2112;
      uint64_t v13 = 0LL;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "resource: %@.%@ in %@ not found",  (uint8_t *)&v8,  0x20u);
    }

    return 0LL;
  }

  return result;
}

uint64_t sub_1000134B0()
{
  if (sub_1000111F8()
    && (v0 = sub_100013E48(@"MobileAssetContentVersion"), unint64_t v1 = sub_1000139E0(0LL), v1 > v0))
  {
    unint64_t v2 = v1;
    id v3 = sub_10000856C("OTATrust");
    dispatch_queue_attr_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      unint64_t v8 = v2;
      __int16 v9 = 2048;
      unint64_t v10 = v0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Using asset v%llu instead of system v%llu",  (uint8_t *)&v7,  0x16u);
    }

    char v5 = byte_100082BE0 ^ 1;
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

id sub_1000135AC(void *a1)
{
  id v1 = a1;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  CFIndex v17 = sub_100015E48;
  id v18 = sub_100015E58;
  id v19 = 0LL;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  void v13[2] = sub_10001892C;
  unint64_t v13[3] = &unk_100079B48;
  v13[4] = &v14;
  sub_10001A220((uint64_t)@"SupplementalsAssets", v13);
  unint64_t v2 = (void *)v15[5];
  if (!v2) {
    goto LABEL_16;
  }
  id v3 = (const char *)[v2 fileSystemRepresentation];
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 != 1) {
    goto LABEL_14;
  }
  int v4 = mkpath_np(v3, 0x1EDu);
  int v5 = v4;
  if (v4 && v4 != 17)
  {
    id v6 = sub_10000856C("SecError");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v8 = strerror(v5);
      *(_DWORD *)__int128 buf = 136315394;
      id v21 = v3;
      __int16 v22 = 2080;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "could not create path: %s (%s)", buf, 0x16u);
    }
  }

  else
  {
    chmod(v3, 0x1EDu);
  }

  if (!v5 || v5 == 17)
  {
LABEL_14:
    __int16 v9 = (void *)v15[5];
    if (v1) {
      id v10 = (id)objc_claimAutoreleasedReturnValue([v9 URLByAppendingPathComponent:v1]);
    }
    else {
      id v10 = v9;
    }
    uint64_t v11 = v10;
  }

  else
  {
LABEL_16:
    uint64_t v11 = 0LL;
  }

  _Block_object_dispose(&v14, 8);

  return v11;
}

void sub_1000137B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
}

void sub_1000137D8(int a1, uint64_t *a2, void *a3)
{
  id v9 = a3;
  if (a1 == 4 && a2)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
    id v6 = v5;
    uint64_t v7 = *a2;
    uint64_t v8 = 1LL;
LABEL_7:
    [v5 logResultForEvent:@"OTAPKIEvent" hardFailure:v8 result:v7 withAttributes:v9];

    goto LABEL_8;
  }

  if (a1 == 3 && a2)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
    id v6 = v5;
    uint64_t v7 = *a2;
    uint64_t v8 = 0LL;
    goto LABEL_7;
  }

LABEL_8:
}

    return v0;
  }

  if (!sub_10001765C(2592000.0))
  {
    id v1 = sub_10000856C("OTATrust");
    unint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = 0;
      id v3 = "Asset staleness state: at risk";
      int v4 = (uint8_t *)&v7;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v3, v4, 2u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  return v0;
}

uint64_t sub_10001387C()
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  uint64_t v0 = byte_100082C08;
  if (byte_100082C08 == 1)
  {
    sub_10001604C();
    sub_1000169AC(@"OTAPKIContext.plist");
  }

  return v0;
}

id sub_1000138E0(void *a1)
{
  id v1 = a1;
  unint64_t v2 = (__CFBundle *)sub_10001140C();
  if (!v2)
  {
    int v4 = 0LL;
    goto LABEL_10;
  }

  CFURLRef v3 = CFBundleCopyResourcesDirectoryURL(v2);
  if (!v3) {
    goto LABEL_7;
  }
  int v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:relativeToURL:](&OBJC_CLASS___NSURL, "URLWithString:relativeToURL:", v1, v3));
  if (!v4)
  {
    int v5 = sub_10000856C("SecWarning");
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v1;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "resource: %@ not found", (uint8_t *)&v8, 0xCu);
    }

LABEL_7:
    int v4 = 0LL;
  }

LABEL_10:
  return v4;
}

unint64_t sub_1000139E0(void *a1)
{
  unint64_t v2 = objc_autoreleasePoolPush();
  unint64_t v3 = sub_100013E48(@"MobileAssetContentVersion");
  id v4 = sub_1000135AC(@"OTAPKIContext.plist");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (!v7)
  {
    id v9 = 0LL;
    id v8 = 0LL;
LABEL_9:
    if (!a1)
    {
LABEL_16:
      sub_10001604C();
      sub_1000160C8(@"CTKillSwitch", &off_10007FC98, 0LL);
      sub_1000160C8(@"CTKillSwitch_nonTLS", &off_10007FC98, 0LL);
      goto LABEL_17;
    }

    id v23 = v9;
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v23,  3,  NSOSStatusErrorDomain,  -67871,  @"OTAContext.plist missing dictionary",  v5,  v6,  v22);
    id v17 = v23;

    id v16 = 0LL;
    id v9 = v17;
LABEL_11:
    id v18 = sub_10000856C("OTATrust");
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218240;
      id v27 = v16;
      __int16 v28 = 2048;
      unint64_t v29 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "asset (%llu) is not newer than the system version (%llu); deleting stale data",
        buf,
        0x16u);
    }

    if (v9) {
      CFRetain(v9);
    }
    *a1 = v9;
    goto LABEL_16;
  }

  id v25 = 0LL;
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v7,  &v25));
  id v9 = v25;
  if (!v8) {
    goto LABEL_9;
  }
  id v8 = v8;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v8, v10);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"MobileAssetContentVersion"]);
  if (!v14 || (uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v14, v15) & 1) == 0))
  {
    if (a1)
    {
      id v24 = v9;
      sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v24,  3,  NSOSStatusErrorDomain,  -67694,  @"OTAContext.plist missing version",  v12,  v13,  v22);
      id v21 = v24;

      id v9 = v21;
    }

    id v16 = 0LL;
LABEL_21:
    if (!a1) {
      goto LABEL_16;
    }
    goto LABEL_11;
  }

  id v16 = [v14 unsignedLongLongValue];

  unint64_t v3 = (unint64_t)v16;
LABEL_17:

  objc_autoreleasePoolPop(v2);
  return v3;
}

void *sub_100013CA4()
{
  id v0 = sub_1000135AC(@"OTAPKIContext.plist");
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v0);
  if (!v3)
  {
    id v5 = 0LL;
    id v4 = 0LL;
LABEL_8:
    id v16 = v5;
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v16,  3,  NSOSStatusErrorDomain,  -67871,  @"OTAContext.plist missing dictionary",  v1,  v2,  v15);
    uint64_t v12 = 0LL;
    uint64_t v10 = v5;
    id v5 = v16;
    goto LABEL_9;
  }

  id v18 = 0LL;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v18));
  id v5 = v18;
  if (!v4) {
    goto LABEL_8;
  }
  id v4 = v4;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKeyedSubscript:@"MobileAssetLastCheckIn"]);
  if (v10 && (uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSDate), (objc_opt_isKindOfClass(v10, v11) & 1) != 0))
  {
    CFRetain(v10);
    uint64_t v12 = v10;
  }

  else
  {
    id v17 = v5;
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v17,  3,  NSOSStatusErrorDomain,  -67694,  @"OTAContext.plist missing check-in",  v8,  v9,  v15);
    id v14 = v17;

    uint64_t v12 = 0LL;
    id v5 = v14;
  }

uint64_t sub_100013E48(const void *a1)
{
  uint64_t valuePtr = 0LL;
  uint64_t v2 = sub_100012F34(@"AssetVersion", @"plist");
  if (!v2) {
    return 0LL;
  }
  unint64_t v3 = v2;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  CFPropertyListRef v4 = CFPropertyListCreateWithData(kCFAllocatorDefault, v2, 0LL, (CFPropertyListFormat *)&v10, 0LL);
  if (v4)
  {
    id v5 = v4;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(v5) && (Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v5, a1)) != 0LL)
    {
      CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
      uint64_t v8 = valuePtr;
      if (valuePtr < 0)
      {
        uint64_t v8 = 0LL;
        uint64_t valuePtr = 0LL;
      }
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    CFRelease(v5);
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  CFRelease(v3);
  return v8;
}

uint64_t sub_100013F34(uint64_t a1, const __CFDictionary **a2, void *a3, size_t *a4, int a5)
{
  uint64_t result = 0LL;
  if (a2 && a3)
  {
    *a2 = 0LL;
    *a3 = 0LL;
    memset(__b, 170, sizeof(__b));
    int valuePtr = 0;
    if (a5) {
      uint64_t v11 = (const __CFData *)sub_100012D6C(a1, (uint64_t)@"certsIndex", (uint64_t)@"data");
    }
    else {
      uint64_t v11 = sub_100012F34(@"certsIndex", @"data");
    }
    uint64_t v12 = v11;
    if (v11)
    {
      if (a5)
      {
LABEL_8:
        uint64_t v13 = (const __CFURL *)sub_1000186EC(a1, (uint64_t)@"certsTable", (uint64_t)@"data");
        goto LABEL_13;
      }
    }

    else
    {
      id v14 = sub_10000856C("SecError");
      uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.st_dev) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "could not find certsIndex",  (uint8_t *)&buf,  2u);
      }

      if (a5) {
        goto LABEL_8;
      }
    }

    uint64_t v13 = sub_1000133C8(@"certsTable", @"data");
LABEL_13:
    id v16 = v13;
    if (!v13)
    {
      __int16 v28 = sub_10000856C("SecError");
      unint64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.st_dev) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "could not find certsTable",  (uint8_t *)&buf,  2u);
      }

      goto LABEL_57;
    }

    CFStringRef v17 = CFURLCopyFileSystemPath(v13, kCFURLPOSIXPathStyle);
    if (!v17)
    {
      CFRelease(v16);
      goto LABEL_57;
    }

    id v18 = v17;
    char v56 = a3;
    CFRange v57 = a4;
    bzero(__b, 0x400uLL);
    CStringPtr = (char *)CFStringGetCStringPtr(v18, 0x8000100u);
    if (CStringPtr || (CStringPtr = __b, CFStringGetCString(v18, __b, 1024LL, 0x8000100u)))
    {
      v20.tv_sec = 0xAAAAAAAAAAAAAAAALL;
      v20.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
      *(timespec *)&buf.st_blksize = v20;
      *(timespec *)buf.st_qspare = v20;
      buf.st_birthtimespec = v20;
      *(timespec *)&buf.off_t st_size = v20;
      buf.st_mtimespec = v20;
      buf.st_ctimespec = v20;
      *(timespec *)&buf.st_uid = v20;
      buf.st_atimespec = v20;
      *(timespec *)&buf.st_dev = v20;
      int v21 = open(CStringPtr, 0);
      if (v21 < 0)
      {
        CFIndex v30 = sub_10000856C("SecError");
        CFIndex v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          int v32 = *__error();
          *(_DWORD *)id v60 = 136315394;
          uint64_t v61 = CStringPtr;
          __int16 v62 = 1024;
          *(_DWORD *)int v63 = v32;
          _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "MapFile: unable to open %s (errno %d)",  v60,  0x12u);
        }
      }

      else
      {
        int v22 = v21;
        int v23 = fstat(v21, &buf);
        if (v23)
        {
          int v24 = v23;
          id v25 = sub_10000856C("SecError");
          id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = *__error();
            *(_DWORD *)id v60 = 136315650;
            uint64_t v61 = CStringPtr;
            __int16 v62 = 1024;
            *(_DWORD *)int v63 = v24;
            *(_WORD *)&v63[4] = 1024;
            *(_DWORD *)&v63[6] = v27;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "MapFile: fstat of %s returned %d (errno %d)",  v60,  0x18u);
          }
        }

        else
        {
          off_t st_size = buf.st_size;
          if (buf.st_size < 0x7FFFFFFF)
          {
            uint64_t v38 = mmap(0LL, buf.st_size, 1, 2, v22, 0LL);
            if ((unint64_t)v38 + 1 > 1)
            {
              char v44 = v38;
              close(v22);
LABEL_44:
              CFRelease(v18);
              CFRelease(v16);
              if (v12 && v44)
              {
                int v53 = v44;
                size_t v54 = st_size;
                BytePtr = CFDataGetBytePtr(v12);
                CFTypeRef cf = v12;
                CFIndex Length = CFDataGetLength(v12);
                CFMutableArrayRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                if (Length >= 1)
                {
                  uint64_t v48 = Length + 24;
                  do
                  {
                    int valuePtr = *((_DWORD *)BytePtr + 5);
                    CFNumberRef v49 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
                    CFDataRef v50 = CFDataCreate(kCFAllocatorDefault, BytePtr, 20LL);
                    Value = (__CFArray *)CFDictionaryGetValue(Mutable, v50);
                    id v52 = Value;
                    if (!Value) {
                      id v52 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
                    }
                    CFArrayAppendValue(v52, v49);
                    CFDictionarySetValue(Mutable, v50, v52);
                    CFRelease(v49);
                    CFRelease(v50);
                    if (!Value) {
                      CFRelease(v52);
                    }
                    BytePtr += 24;
                    v48 -= 24LL;
                  }

                  while (v48 > 24);
                }

                CFRelease(cf);
                if (Mutable)
                {
                  *a2 = Mutable;
                  *char v56 = v53;
                  uint64_t result = 1LL;
                  *CFRange v57 = v54;
                  return result;
                }

                sub_100018854(v53, v54);
                return 0LL;
              }

              if (v44) {
                sub_100018854(v44, st_size);
              }
LABEL_57:
              if (v12) {
                CFRelease(v12);
              }
              return 0LL;
            }

            id v39 = sub_10000856C("SecError");
            uint64_t v40 = (os_log_s *)objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              int v41 = *__error();
              *(_DWORD *)id v60 = 136315394;
              uint64_t v61 = CStringPtr;
              __int16 v62 = 1024;
              *(_DWORD *)int v63 = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v40,  OS_LOG_TYPE_DEFAULT,  "MapFile: unable to map %s (errno %d)",  v60,  0x12u);
            }
          }

          else
          {
            uint64_t v34 = sub_10000856C("SecError");
            char v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)id v60 = 136315394;
              uint64_t v61 = CStringPtr;
              __int16 v62 = 2048;
              *(void *)int v63 = buf.st_size;
              _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "MapFile: %s is too large (%lld)",  v60,  0x16u);
            }
          }
        }

        close(v22);
      }
    }

    else
    {
      id v36 = sub_10000856C("SecError");
      int v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v60 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "MapFile: path or out_file_size was NULL",  v60,  2u);
      }
    }

    id v42 = sub_10000856C("SecError");
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      buf.st_dev = 138412290;
      *(void *)&buf.st_mode = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "InitializeAnchorTable: failed to map file at %@",  (uint8_t *)&buf,  0xCu);
    }

    char v44 = 0LL;
    off_t st_size = 0LL;
    goto LABEL_44;
  }

  return result;
}

const void *sub_1000145D4(uint64_t a1)
{
  if (!*(void *)(a1 + 208))
  {
    unint64_t v3 = sub_10000856C("SecError");
    CFPropertyListRef v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)stat buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "SecAssetTrustStoreCopyPath: no autoAssetClient",  buf,  2u);
    }

    return 0LL;
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10001861C;
  block[3] = &unk_1000790A8;
  void block[4] = a1;
  if (qword_100082BE8 != -1) {
    dispatch_once(&qword_100082BE8, block);
  }
  uint64_t v2 = *(const void **)(a1 + 216);
  if (v2) {
    CFRetain(v2);
  }
  return v2;
}

id sub_1000146C4(void *a1)
{
  id v1 = a1;
  id v2 = sub_1000135AC(@"OTAPKIContext.plist");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (!v5)
  {
    id v7 = 0LL;
    id v6 = 0LL;
LABEL_10:
    id v21 = v7;
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v21,  3,  NSOSStatusErrorDomain,  -67871,  @"OTAContext.plist missing dictionary",  v3,  v4,  v20);
    id v16 = 0LL;
    uint64_t v12 = v7;
    id v7 = v21;
    goto LABEL_11;
  }

  id v23 = 0LL;
  id v6 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v5,  &v23));
  id v7 = v23;
  if (!v6) {
    goto LABEL_10;
  }
  id v6 = v6;
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:v1]);
  if (v12 && (uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v12, v13) & 1) != 0))
  {
    id v14 = sub_10000856C("OTATrust");
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v19 = [v12 BOOLValue];
      *(_DWORD *)stat buf = 138543618;
      id v25 = v1;
      __int16 v26 = 1024;
      unsigned int v27 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "found on-disk kill switch %{public}@ with value %d",  buf,  0x12u);
    }

    id v16 = [v12 BOOLValue];
  }

  else
  {
    id v22 = v7;
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  &v22,  3,  NSOSStatusErrorDomain,  -67694,  @"OTAContext.plist missing kill switch",  v10,  v11,  v20);
    id v18 = v22;

    id v16 = 0LL;
    id v7 = v18;
  }

void sub_100014914(id a1, int a2)
{
  id v2 = sub_10000856C("OTATrust");
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Got notification about a new SecExperiment asset from system trustd.",  buf,  2u);
  }

  id v4 = [[MAAssetQuery alloc] initWithType:@"com.apple.MobileAsset.SecExperimentAssets"];
  [v4 returnTypes:1];
  id v5 = [v4 queryMetaDataSync];
  if (v5)
  {
    id v6 = v5;
    id v7 = sub_10000856C("SecError");
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)stat buf = 134217984;
      id v27 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to update SecExperiment Asset after notification: %ld",  buf,  0xCu);
    }

LABEL_18:
    uint64_t v13 = 0LL;
    goto LABEL_19;
  }

  uint64_t v9 = sub_10000856C("OTATrust");
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Updated SecExperiment asset successfully",  buf,  2u);
  }

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 results]);
  id v11 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  if (!v11) {
    goto LABEL_18;
  }
  id v12 = v11;
  uint64_t v13 = 0LL;
  uint64_t v14 = *(void *)v22;
  do
  {
    for (CFIndex i = 0LL; i != v12; CFIndex i = (char *)i + 1)
    {
      if (*(void *)v22 != v14) {
        objc_enumerationMutation(v8);
      }
      id v16 = *(void **)(*((void *)&v21 + 1) + 8LL * (void)i);
      CFStringRef v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetProperty:@"_ContentVersion"]);
      if (sub_100014BB0(@"com.apple.MobileAsset.SecExperimentAssets", v16))
      {
        id v20 = v13;
        id v18 = sub_100014F24(@"com.apple.MobileAsset.SecExperimentAssets", v16, v17, (uint64_t *)&v20);
        id v19 = v20;

        uint64_t v13 = v19;
      }
    }

    id v12 = -[os_log_s countByEnumeratingWithState:objects:count:]( v8,  "countByEnumeratingWithState:objects:count:",  &v21,  v25,  16LL);
  }

  while (v12);
LABEL_19:
}

    id v27 = (void *)v56[5];
    v56[5] = v26;

    if (v41 != 0.0)
    {
      __int16 v28 = (void *)v56[5];
      if (v28)
      {
      }

      else
      {
        *(_BYTE *)(*(void *)&v41 + 44LL) = 1;
      }
    }

uint64_t sub_100014BB0(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  else {
    uint64_t v5 = 1LL;
  }
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v4 assetProperty:@"_CompatibilityVersion"]);
  if (v8)
  {
    uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0 && [v8 unsignedIntegerValue] == (id)v5)
    {
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v4 assetProperty:@"_ContentVersion"]);
      id v11 = v3;
      id v12 = v10;
      uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        CFTypeRef cf = 0LL;
        if ([v11 isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
        {
          uint64_t v14 = sub_100016AB8((__CFString **)&cf);
        }

        else
        {
          uint64_t v14 = sub_100016B04((__CFString **)&cf);
        }

        uint64_t v18 = v14;
        CFTypeRef v19 = cf;
        if (!cf)
        {
          int v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  v18));
          id v33 = [v12 compare:v32];

          if (v33 == (id)1)
          {
            id v15 = 0LL;
            uint64_t v16 = 1LL;
LABEL_23:

            goto LABEL_11;
          }

LABEL_16:
      goto LABEL_17;
    }
  }

  id v37 = 0LL;
  sub_1000159FC( v3,  &v37,  3,  NSOSStatusErrorDomain,  -67704,  @"skipping asset %@ because Compatibility Version doesn't match %@",  v6,  v7,  (uint64_t)v3);
  id v15 = v37;
  uint64_t v16 = 0LL;
LABEL_11:

  return v16;
}

id sub_100014F24(void *a1, void *a2, void *a3, uint64_t *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if ([v7 isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
  {
    id v10 = v8;
    id v11 = v9;
    id v12 = (id)objc_claimAutoreleasedReturnValue([v10 getLocalFileUrl]);
    if ((sub_100011134() & 1) != 0)
    {
      if (qword_100082DA8 != -1) {
        dispatch_once(&qword_100082DA8, &stru_100077BC8);
      }
      unsigned __int8 v13 = [(id)qword_100082DA0 installDbFromURL:v12 error:a4];

      if ((v13 & 1) != 0)
      {
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v10 getLocalFileUrl]);
        int v15 = sub_100015304(v14, v11, a4);

        if (v15)
        {
          uint64_t v16 = sub_10000856C("OTATrust");
          CFStringRef v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "finished update to version %@ from installed asset. purging asset.",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
          [v18 logSuccessForEventNamed:@"OTAPKIEvent"];

          [v10 purge:&stru_100076690];
          id v19 = v11;
          goto LABEL_21;
        }

        goto LABEL_17;
      }
    }

    else
    {
    }

LABEL_17:
    id v35 = (void *)objc_claimAutoreleasedReturnValue([v10 getLocalFileUrl]);
    sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a4,  4,  NSOSStatusErrorDomain,  -67695,  @"Failed to install new asset version %@ from %@",  v28,  v29,  (uint64_t)v11);

LABEL_20:
    id v19 = 0LL;
LABEL_21:

    goto LABEL_22;
  }

  if ([v7 isEqualToString:@"com.apple.MobileAsset.SecExperimentAssets"])
  {
    id v10 = v9;
    uint64_t v20 = objc_claimAutoreleasedReturnValue([v8 getLocalFileUrl]);
    id v11 = (id)v20;
    if (v10 && v20)
    {
      id v23 = [v10 unsignedLongLongValue];
      __int128 v24 = (void *)objc_claimAutoreleasedReturnValue([v11 URLByAppendingPathComponent:@"SecExperimentAssets.plist"]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v24,  a4));
      __int16 v26 = v25;
      if (v25)
      {
        id v27 = (dispatch_queue_s *)qword_100082BB0;
        *(void *)&__int128 buf = _NSConcreteStackBlock;
        *((void *)&buf + 1) = 3221225472LL;
        id v37 = sub_100015A2C;
        uint64_t v38 = &unk_1000766B8;
        id v40 = v23;
        id v39 = v25;
        dispatch_sync(v27, &buf);
        notify_post("com.apple.trustd.secexperiment.asset-updated");
        id v19 = v10;
      }

      else
      {
        uint64_t v31 = sub_10000856C("SecError");
        int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          if (a4) {
            uint64_t v33 = *a4;
          }
          else {
            uint64_t v33 = 0LL;
          }
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v33;
          _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to create SecExperiment from asset file: %@",  (uint8_t *)&buf,  0xCu);
        }

        id v19 = 0LL;
      }

      goto LABEL_21;
    }

    sub_1000159FC( @"com.apple.MobileAsset.SecExperimentAssets",  a4,  4,  NSOSStatusErrorDomain,  -26276,  @"missing url and version for downloaded SecExperiment asset",  v21,  v22,  v34);
    goto LABEL_20;
  }

  id v19 = 0LL;
LABEL_22:

  return v19;
}

uint64_t sub_100015304(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v9 = v6;
  if (v5 && v6)
  {
    uint64_t v59 = 0LL;
    id v60 = &v59;
    uint64_t v61 = 0x3032000000LL;
    __int16 v62 = sub_100015E48;
    int v63 = sub_100015E58;
    id v64 = 0LL;
    uint64_t v53 = 0LL;
    size_t v54 = &v53;
    uint64_t v55 = 0x3032000000LL;
    char v56 = sub_100015E48;
    CFRange v57 = sub_100015E58;
    id v58 = 0LL;
    v51[0] = 0LL;
    v51[1] = v51;
    v51[2] = 0x2020000000LL;
    id v52 = (id)0xAAAAAAAAAAAAAAAALL;
    id v52 = [v6 unsignedLongLongValue];
    uint64_t v45 = 0LL;
    char v46 = &v45;
    uint64_t v47 = 0x3032000000LL;
    uint64_t v48 = sub_100015E48;
    CFNumberRef v49 = sub_100015E58;
    id v50 = 0LL;
    uint64_t v39 = 0LL;
    id v40 = &v39;
    uint64_t v41 = 0x3032000000LL;
    id v42 = sub_100015E48;
    uint64_t v43 = sub_100015E58;
    id v44 = 0LL;
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"TrustedCTLogs.plist"]);
    uint64_t v11 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:error:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:error:", v10, a3));
    id v12 = (void *)v60[5];
    v60[5] = v11;

    if (!v60[5])
    {
      __int128 v24 = sub_10000856C("SecError");
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v26 = *a3;
        }
        else {
          uint64_t v26 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v66 = v26;
        _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to create TrustedCTLogs from asset file: %@",  buf,  0xCu);
      }

      sub_1000137D8(4, a3, 0LL);
      uint64_t v23 = 0LL;
      goto LABEL_49;
    }

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"TrustedCTLogs_nonTLS.plist"]);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:error:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:error:", v13, a3));
    int v15 = (void *)v54[5];
    v54[5] = v14;

    if (!v54[5])
    {
      id v27 = sub_10000856C("SecError");
      uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v29 = *a3;
        }
        else {
          uint64_t v29 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v66 = v29;
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to create TrustedCTLogs_nonTLS from asset file: %@",  buf,  0xCu);
      }

      sub_1000137D8(4, a3, 0LL);
      uint64_t v23 = 0LL;
      goto LABEL_48;
    }

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"AnalyticsSamplingRates.plist"]);
    uint64_t v17 = objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v16,  a3));
    uint64_t v18 = (void *)v46[5];
    v46[5] = v17;

    if (!v46[5])
    {
      uint64_t v30 = sub_10000856C("SecError");
      uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v32 = *a3;
        }
        else {
          uint64_t v32 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v66 = v32;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to create AnalyticsSamplingRates from asset file: %@",  buf,  0xCu);
      }

      sub_1000137D8(4, a3, 0LL);
      uint64_t v23 = 0LL;
      goto LABEL_47;
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue([v5 URLByAppendingPathComponent:@"AppleCertificateAuthorities.plist"]);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithContentsOfURL:error:](&OBJC_CLASS___NSArray, "arrayWithContentsOfURL:error:", v19, a3));
    uint64_t v21 = (void *)v40[5];
    v40[5] = v20;

    if (v40[5])
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100015E60;
      block[3] = &unk_1000766E0;
      void block[4] = v51;
      void block[5] = &v59;
      void block[6] = &v53;
      block[7] = &v45;
      block[8] = &v39;
      dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
      if (qword_100082C10 != -1) {
        dispatch_once(&qword_100082C10, &stru_100076788);
      }
      if (byte_100082C08 != 1) {
        goto LABEL_19;
      }
      sub_10001604C();
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSince1970:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSince1970:",  0.0));
      sub_1000160C8(@"MobileAssetLastCheckIn", v22, 0LL);

      if (sub_1000164E0(@"TrustedCTLogs.plist", v10, a3)
        && sub_1000164E0(@"TrustedCTLogs_nonTLS.plist", v13, a3)
        && sub_1000164E0(@"AnalyticsSamplingRates.plist", v16, a3)
        && sub_1000164E0(@"AppleCertificateAuthorities.plist", v19, a3)
        && sub_1000160C8(@"MobileAssetContentVersion", v9, a3)
        && sub_1000162A0())
      {
        notify_post("com.apple.trustd.asset-updated");
LABEL_19:
        uint64_t v23 = 1LL;
LABEL_46:

LABEL_47:
LABEL_48:

LABEL_49:
        _Block_object_dispose(&v39, 8);

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(v51, 8);
        _Block_object_dispose(&v53, 8);

        _Block_object_dispose(&v59, 8);
        goto LABEL_50;
      }
    }

    else
    {
      uint64_t v33 = sub_10000856C("SecError");
      uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v35 = *a3;
        }
        else {
          uint64_t v35 = 0LL;
        }
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v66 = v35;
        _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to create AppleCAs from asset file: %@",  buf,  0xCu);
      }

      sub_1000137D8(4, a3, 0LL);
    }

    uint64_t v23 = 0LL;
    goto LABEL_46;
  }

  sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a3,  4,  NSOSStatusErrorDomain,  -26276,  @"missing url and version for downloaded asset",  v7,  v8,  v37);
  uint64_t v23 = 0LL;
LABEL_50:

  return v23;
}

void sub_100015998( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_1000159FC( void *a1, void *a2, int a3, void *a4, int a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100015A2C(uint64_t a1)
{
  id v2 = sub_10000856C("OTATrust");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(qword_100082BD8 + 192);
    uint64_t v5 = *(void *)(a1 + 40);
    int v9 = 134218240;
    uint64_t v10 = v4;
    __int16 v11 = 2048;
    uint64_t v12 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "updating SecExperiment asset version from %llu to %llu",  (uint8_t *)&v9,  0x16u);
  }

  uint64_t v6 = qword_100082BD8;
  uint64_t v7 = *(const void **)(a1 + 32);
  uint64_t v8 = *(const void **)(qword_100082BD8 + 184);
  if (v8 != v7)
  {
    *(void *)(v6 + 184) = v7;
    uint64_t v6 = qword_100082BD8;
  }

  *(void *)(v6 + 192) = *(void *)(a1 + 40);
}

void sub_100015B34(void *a1, void *a2, int a3, void *a4, int a5, void *a6, void *a7, uint64_t a8)
{
  id v15 = a1;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  if (v18)
  {
    id v19 = -[NSString initWithFormat:arguments:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:arguments:",  v18,  a8);
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[NSMutableDictionary setObject:forKey:](v20, "setObject:forKey:", v19, NSLocalizedDescriptionKey);
    if (!a2) {
      goto LABEL_7;
    }
  }

  else
  {
    uint64_t v20 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v19 = 0LL;
    if (!a2) {
      goto LABEL_7;
    }
  }

  if (*a2) {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", *a2, NSUnderlyingErrorKey);
  }
LABEL_7:
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v16,  a5,  v20));
  uint64_t v22 = v19;
  if (a3 == 4)
  {
    uint64_t v26 = sub_10000856C("SecError");
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v30 = v22;
      id v25 = "OTATrust: %@";
      goto LABEL_13;
    }
  }

  else
  {
    if (a3 != 3) {
      goto LABEL_15;
    }
    uint64_t v23 = sub_10000856C("OTATrust");
    __int128 v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v30 = v22;
      id v25 = "%@";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
    }
  }

LABEL_15:
  if ([v15 isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
  {
    id v28 = v21;
    sub_1000137D8(a3, (uint64_t *)&v28, v17);
    id v27 = v28;

    uint64_t v21 = v27;
  }

  if (a2) {
    *a2 = v21;
  }
}

void sub_100015D9C(id a1, int64_t a2)
{
  if (a2)
  {
    id v3 = sub_10000856C("SecError");
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 134217984;
      int64_t v6 = a2;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "OTATrust: purge failed: %ld",  (uint8_t *)&v5,  0xCu);
    }
  }

uint64_t sub_100015E48(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
  return result;
}

void sub_100015E58(uint64_t a1)
{
}

id sub_100015E60(void *a1)
{
  id v2 = sub_10000856C("OTATrust");
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(qword_100082BD8 + 152);
    uint64_t v5 = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
    int v20 = 134218240;
    uint64_t v21 = v4;
    __int16 v22 = 2048;
    uint64_t v23 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "updating asset version from %llu to %llu",  (uint8_t *)&v20,  0x16u);
  }

  uint64_t v6 = qword_100082BD8;
  id v7 = sub_100011514(*(void **)(*(void *)(a1[5] + 8LL) + 40LL));
  id v8 = *(id *)(v6 + 40);
  if (v8 != v7)
  {
    if (!v7 || (CFRetain(v7), (id v8 = *(id *)(v6 + 40)) != 0LL)) {
      CFRelease(v8);
    }
    *(void *)(v6 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v7;
  }

  uint64_t v9 = qword_100082BD8;
  if (*(void *)(qword_100082BD8 + 48))
  {
    id v10 = sub_100011514(*(void **)(*(void *)(a1[6] + 8LL) + 40LL));
    id v11 = *(id *)(v9 + 48);
    if (v11 != v10)
    {
      if (!v10 || (CFRetain(v10), (id v11 = *(id *)(v9 + 48)) != 0LL)) {
        CFRelease(v11);
      }
      *(void *)(v9 + 4_Block_object_dispose((const void *)(v35 - 176), 8) = v10;
    }
  }

  uint64_t v12 = (void *)qword_100082BD8;
  uint64_t v13 = *(void *)(a1[7] + 8LL);
  uint64_t v14 = *(const void **)(v13 + 40);
  id v15 = *(const void **)(qword_100082BD8 + 168);
  if (v15 != v14)
  {
    v12[21] = v14;
    uint64_t v12 = (void *)qword_100082BD8;
  }

  uint64_t v16 = *(void *)(a1[8] + 8LL);
  id v17 = *(const void **)(v16 + 40);
  id v18 = (const void *)v12[22];
  if (v18 != v17)
  {
    v12[22] = v17;
    uint64_t v12 = (void *)qword_100082BD8;
  }

  v12[19] = *(void *)(*(void *)(a1[4] + 8LL) + 24LL);
  return sub_10001688C();
}

void sub_10001604C()
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    sub_1000169AC(@"TrustedCTLogs.plist");
    sub_1000169AC(@"TrustedCTLogs_nonTLS.plist");
    sub_1000169AC(@"AnalyticsSamplingRates.plist");
    sub_1000169AC(@"AppleCertificateAuthorities.plist");
  }

id sub_1000160C8(void *a1, void *a2, uint64_t *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1 && sub_100011134())
  {
    id v7 = sub_1000135AC(@"OTAPKIContext.plist");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if (v8)
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:",  v8));
      id v10 = v9;
      if (v9) {
        id v11 = [v9 mutableCopy];
      }
      else {
        id v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      }
      uint64_t v13 = v11;
      [v11 setObject:v6 forKeyedSubscript:v5];
      id v12 = [v13 writeToClassDURL:v8 permissions:420 error:a3];
      if ((v12 & 1) == 0)
      {
        uint64_t v14 = sub_10000856C("SecError");
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          if (a3) {
            uint64_t v16 = *a3;
          }
          else {
            uint64_t v16 = 0LL;
          }
          int v18 = 138412290;
          uint64_t v19 = v16;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "OTATrust: unable to write OTA Context to disk: %@",  (uint8_t *)&v18,  0xCu);
        }

        sub_1000137D8(4, a3, 0LL);
      }
    }

    else
    {
      id v12 = 0LL;
    }
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

unint64_t sub_1000162A0()
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000LL;
    id v12 = sub_100015E48;
    uint64_t v13 = sub_100015E58;
    id v14 = 0LL;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100016818;
    block[3] = &unk_1000772B8;
    void block[4] = &v9;
    dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
    id v0 = (void *)v10[5];
    id v7 = 0LL;
    unint64_t v1 = (unint64_t)sub_1000160C8(@"MobileAssetLastCheckIn", v0, (uint64_t *)&v7);
    id v2 = v7;
    if ((v1 & 1) == 0)
    {
      id v3 = sub_10000856C("SecError");
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v16 = v2;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to write last check-in time: %@",  buf,  0xCu);
      }
    }

    notify_post("com.apple.trustd.asset-check-in");

    _Block_object_dispose(&v9, 8);
  }

  else
  {
    uint64_t v9 = 0LL;
    id v10 = &v9;
    uint64_t v11 = 0x2020000000LL;
    LOBYTE(v12) = 0;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    _OWORD v6[2] = sub_10001684C;
    unint64_t v6[3] = &unk_1000772B8;
    v6[4] = &v9;
    dispatch_sync((dispatch_queue_t)qword_100082BB0, v6);
    unint64_t v1 = *((_BYTE *)v10 + 24) != 0;
    _Block_object_dispose(&v9, 8);
  }

  return v1;
}

void sub_1000164C0( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
}

BOOL sub_1000164E0(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1 && sub_100011134())
  {
    id v7 = sub_1000135AC(v5);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    uint64_t v9 = copyfile_state_alloc();
    id v10 = (const char *)[v6 fileSystemRepresentation];
    id v11 = v8;
    LODWORD(v1syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = copyfile(v10, (const char *)[v11 fileSystemRepresentation], v9, 8u);
    copyfile_state_free(v9);
    if ((v10 & 0x80000000) != 0)
    {
      int v21 = *__error();
      uint64_t v22 = *__error();
      uint64_t v23 = __error();
      strerror(*v23);
      sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a3,  4,  NSPOSIXErrorDomain,  v21,  @"copyfile error for asset %d: %s",  v24,  v25,  v22);
    }

    else
    {
      id v12 = v11;
      uint64_t v13 = (const char *)[v12 fileSystemRepresentation];
      if (chmod(v13, 0x1A4u))
      {
        int v14 = *__error();
        id v15 = sub_10000856C("SecError");
        id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 136315394;
          uint64_t v41 = v13;
          __int16 v42 = 2080;
          uint64_t v43 = strerror(v14);
          _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "failed to change permissions of %s: %s",  buf,  0x16u);
        }

        int v17 = *__error();
        strerror(v14);
        sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a3,  4,  NSPOSIXErrorDomain,  v17,  @"failed to change permissions of %s: %s",  v18,  v19,  (uint64_t)v13);
      }

      else
      {
        int v27 = open((const char *)[v12 fileSystemRepresentation], 0);
        if (v27)
        {
          int v28 = v27;
          int v29 = fcntl(v27, 64, 4LL);
          BOOL v20 = v29 >= 0;
          if (v29 < 0)
          {
            int v30 = *__error();
            uint64_t v31 = *__error();
            uint64_t v32 = __error();
            strerror(*v32);
            sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a3,  4,  NSPOSIXErrorDomain,  v30,  @"set proteciton class error for asset %d: %s",  v33,  v34,  v31);
          }

          close(v28);
          goto LABEL_13;
        }

        int v35 = *__error();
        uint64_t v36 = *__error();
        uint64_t v37 = __error();
        strerror(*v37);
        sub_1000159FC( @"com.apple.MobileAsset.PKITrustSupplementals",  a3,  4,  NSPOSIXErrorDomain,  v35,  @"open error for asset %d: %s",  v38,  v39,  v36);
      }
    }

    BOOL v20 = 0LL;
LABEL_13:

    goto LABEL_14;
  }

  BOOL v20 = 0LL;
LABEL_14:

  return v20;
}

void sub_100016818(uint64_t a1)
{
  id v2 = sub_10001688C();
  uint64_t v3 = objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v3;
}

void sub_10001684C(uint64_t a1)
{
  id v2 = sub_10001688C();
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);

  if (v3) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }
}

id sub_10001688C()
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 != 1)
  {
    id v0 = sub_100013CA4();
    if (sub_1000139E0(0LL) == *(void *)(qword_100082BD8 + 152))
    {
      uint64_t v4 = (CFTypeRef *)(qword_100082BD8 + 160);
      uint64_t v3 = *(const void **)(qword_100082BD8 + 160);
      if (v3 == v0) {
        return v0;
      }
      if (v0)
      {
        CFRetain(v0);
        if (*v4) {
          CFRelease(*v4);
        }
        goto LABEL_16;
      }
    }

    else
    {

      uint64_t v4 = (CFTypeRef *)(qword_100082BD8 + 160);
      uint64_t v3 = *(const void **)(qword_100082BD8 + 160);
      if (!v3)
      {
        id v0 = 0LL;
        return v0;
      }
    }

    CFRelease(v3);
    id v0 = 0LL;
LABEL_16:
    *uint64_t v4 = v0;
    return v0;
  }

  id v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  uint64_t v1 = qword_100082BD8;
  id v2 = *(const void **)(qword_100082BD8 + 160);
  if (v2 != v0)
  {
    *(void *)(v1 + 16syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v0;
  }

  return v0;
}

void sub_1000169AC(void *a1)
{
  id v1 = a1;
  if (sub_100011134())
  {
    id v2 = sub_1000135AC(v1);
    id v3 = objc_claimAutoreleasedReturnValue(v2);
    if (remove((const char *)[v3 fileSystemRepresentation]) == -1)
    {
      int v4 = *__error();
      if (v4 != 2)
      {
        id v5 = sub_10000856C("OTATrust");
        id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          int v7 = 138412546;
          id v8 = v3;
          __int16 v9 = 2080;
          id v10 = strerror(v4);
          _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "failed to remove %@: %s",  (uint8_t *)&v7,  0x16u);
        }
      }
    }
  }
}

uint64_t sub_100016AB8(__CFString **a1)
{
  id v2 = (void *)sub_100011A14();
  if (v2)
  {
    uint64_t v3 = v2[19];
    CFRelease(v2);
  }

  else
  {
    sub_10000DE88(-26276, a1, @"Unable to get the current OTAPKIRef");
    return 0LL;
  }

  return v3;
}

uint64_t sub_100016B04(__CFString **a1)
{
  id v2 = (void *)sub_100011A14();
  if (v2)
  {
    uint64_t v3 = v2[24];
    CFRelease(v2);
  }

  else
  {
    sub_10000DE88(-26276, a1, @"Unable to get the current OTAPKIRef");
    return 0LL;
  }

  return v3;
}

void sub_100016B50( void *a1, void *a2, uint64_t a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100016B88(id a1)
{
  id v1 = sub_10000856C("OTATrust");
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Initial check with MobileAsset for newer SecExperiment asset",  v3,  2u);
  }

  sub_100016C08(0LL, @"com.apple.MobileAsset.SecExperimentAssets", 0LL);
}

BOOL sub_100016C08(BOOL a1, void *a2, void *a3)
{
  id v5 = a2;
  if ((sub_1000111F8() & 1) == 0)
  {
    sub_1000159FC( v5,  a3,  3,  NSOSStatusErrorDomain,  -67585,  @"MobileAsset disabled, skipping check.",  v6,  v7,  (uint64_t)v40);
    goto LABEL_11;
  }

  if (a1)
  {
LABEL_15:
    dispatch_semaphore_t v23 = 0LL;
    id v59 = 0LL;
    id v60 = &v59;
    uint64_t v61 = 0x3032000000LL;
    uint64_t v53 = 0LL;
    size_t v54 = &v53;
    __int16 v62 = sub_100015E48;
    int v63 = sub_100015E58;
    id v64 = 0LL;
    uint64_t v55 = 0x3032000000LL;
    char v56 = sub_100015E48;
    CFRange v57 = sub_100015E58;
    dispatch_semaphore_t v58 = (dispatch_semaphore_t)0xAAAAAAAAAAAAAAAALL;
    if (a1) {
      dispatch_semaphore_t v23 = dispatch_semaphore_create(0LL);
    }
    dispatch_semaphore_t v58 = v23;
    uint64_t v47 = 0LL;
    uint64_t v48 = &v47;
    uint64_t v49 = 0x3032000000LL;
    id v50 = sub_100015E48;
    char v51 = sub_100015E58;
    id v52 = 0LL;
    uint64_t v24 = sub_10000856C("OTATrust");
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v66 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "begin MobileAsset query for catalog %@",  buf,  0xCu);
    }

    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    sub_100017190(v5, v26);

    id v27 = sub_1000172EC();
    int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    unint64_t v41[2] = sub_1000173DC;
    v41[3] = &unk_100076768;
    id v29 = v5;
    id v42 = v29;
    uint64_t v43 = &v47;
    BOOL v46 = a1;
    id v44 = &v53;
    uint64_t v45 = &v59;
    +[MAAsset startCatalogDownload:options:then:]( &OBJC_CLASS___MAAsset,  "startCatalogDownload:options:then:",  v29,  v28,  v41);

    if (!a1) {
      goto LABEL_23;
    }
    int v30 = (dispatch_semaphore_s *)v54[5];
    int v31 = sub_1000175CC();
    dispatch_time_t v32 = dispatch_time(0LL, 1000000000LL * v31);
    if (dispatch_semaphore_wait(v30, v32))
    {
      sub_1000175CC();
      sub_1000159FC( v29,  a3,  4,  NSOSStatusErrorDomain,  -67636,  @"Failed to get asset %@ metadata within %d seconds.",  v35,  v36,  (uint64_t)v29);
    }

    else
    {
      id v38 = v60[5];
      a1 = v38 != 0LL;
      if (a3)
      {
        uint64_t v39 = (void *)v48[5];
        if (v39)
        {
          *a3 = v39;
          goto LABEL_23;
        }
      }

      if (v38)
      {
        a1 = 1LL;
        goto LABEL_23;
      }

      sub_1000159FC(v29, a3, 4, NSOSStatusErrorDomain, -2070, @"Unknown error occurred.", v33, v34, (uint64_t)v40);
    }

    a1 = 0LL;
LABEL_23:

    _Block_object_dispose(&v47, 8);
    _Block_object_dispose(&v53, 8);

    _Block_object_dispose(&v59, 8);
    goto LABEL_24;
  }

  id v8 = v5;
  id v9 = sub_1000135AC(@"OTAPKIContext.plist");
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  if (!v10)
  {
    id v12 = 0LL;
    id v11 = 0LL;
LABEL_14:

    goto LABEL_15;
  }

  id v59 = 0LL;
  id v11 = (id)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v10,  &v59));
  id v12 = v59;
  if (!v11) {
    goto LABEL_14;
  }
  id v11 = v11;
  uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  char isKindOfClass = objc_opt_isKindOfClass(v11, v13);

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_14;
  }
  id v40 = @"MobileAssetLastRequest";
  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@"));
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:v15]);

  if (!v16
    || (id v17 = v16,
        uint64_t v18 = objc_opt_class(&OBJC_CLASS___NSDate),
        char v19 = objc_opt_isKindOfClass(v17, v18),
        v17,
        (v19 & 1) == 0)
    || ([v17 timeIntervalSinceNow], fabs(v20) >= (double)(unint64_t)sub_1000170F8()))
  {

    goto LABEL_14;
  }

  sub_1000159FC( v8,  a3,  3,  NSOSStatusErrorDomain,  -25297,  @"last MobileAsset request for %@ too recent, skipping check.",  v21,  v22,  (uint64_t)v8);
LABEL_11:
  a1 = 0LL;
LABEL_24:

  return a1;
}

void sub_1000170BC( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, char a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, char a27)
{
}

uint64_t sub_1000170F8()
{
  id v0 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.security");
  id v1 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v0, "valueForKey:", @"PKITrustSupplementalsUpdatePeriod"));
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0))
  {
    int v3 = [v1 intValue];
    if (v3 <= 300) {
      uint64_t v4 = 300LL;
    }
    else {
      uint64_t v4 = v3;
    }
  }

  else
  {
    uint64_t v4 = 43200LL;
  }

  return v4;
}

void sub_100017190(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@-%@",  @"MobileAssetLastRequest",  v3));
    id v10 = 0LL;
    unsigned __int8 v6 = sub_1000160C8(v5, v4, (uint64_t *)&v10);
    id v7 = v10;

    if ((v6 & 1) == 0)
    {
      id v8 = sub_10000856C("SecError");
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        id v12 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to write last request time: %@",  buf,  0xCu);
      }
    }
  }
}

id sub_1000172EC()
{
  id v0 = objc_alloc_init(&OBJC_CLASS___MADownloadOptions);
  [v0 setDiscretionary:0];
  [v0 setAllowsCellularAccess:1];
  if (!sub_10001765C(3888000.0))
  {
    id v5 = sub_10000856C("OTATrust");
    uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      id v3 = "Asset staleness state: warning";
      id v4 = buf;
      goto LABEL_7;
    }

void sub_1000173DC(uint64_t a1, uint64_t a2)
{
  id v4 = objc_autoreleasePoolPush();
  id v5 = *(void **)(a1 + 32);
  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  0.0));
  sub_100017190(v5, v6);

  id v9 = (void *)os_transaction_create("com.apple.trustd.asset.download");
  id v10 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id obj = *(id *)(v11 + 40);
    sub_1000159FC( v10,  &obj,  4,  @"MADownLoadResult",  a2,  @"failed to download catalog for asset %@: %ld",  v7,  v8,  (uint64_t)v10);
    objc_storeStrong((id *)(v11 + 40), obj);
    if (a2 == 13
      && [*(id *)(a1 + 32) isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
    {
      id v12 = (void *)qword_100082BA8;
      id v13 = *(id *)(a1 + 32);
      int v14 = v12;
      if (!sub_10001765C(2592000.0))
      {
        int out_token = 0;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472LL;
        handler[2] = sub_1000176D4;
        handler[3] = &unk_100079A80;
        id v25 = v13;
        notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, v14, handler);
      }
    }
  }

  else
  {
    char v15 = *(_BYTE *)(a1 + 64);
    uint64_t v16 = *(void *)(*(void *)(a1 + 56) + 8LL);
    id v17 = *(void **)(v16 + 40);
    uint64_t v18 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL);
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v21 = *(id *)(v19 + 40);
    id v22 = v17;
    uint64_t v20 = sub_100017768(v10, v15, v18, &v22, &v21);
    objc_storeStrong((id *)(v16 + 40), v22);
    objc_storeStrong((id *)(v19 + 40), v21);
    if (*(_BYTE *)(a1 + 64) && (v20 & 1) == 0) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
    }

    id v9 = 0LL;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t sub_1000175CC()
{
  id v0 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.security");
  id v1 = (void *)objc_claimAutoreleasedReturnValue(-[NSUserDefaults valueForKey:](v0, "valueForKey:", @"TrustdAssetDownloadWaitTimeout"));
  if (v1 && (uint64_t v2 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v1, v2) & 1) != 0)) {
    uint64_t v3 = (uint64_t)[v1 intValue];
  }
  else {
    uint64_t v3 = 60LL;
  }

  return v3;
}

BOOL sub_10001765C(double a1)
{
  uint64_t v2 = (void *)sub_100018158();
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  if (v4 == CFDateGetTypeID())
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = fabs(v5) < a1;
  }

  else
  {
    BOOL v6 = 0LL;
  }

  CFRelease(v3);
  return v6;
}

uint64_t sub_1000176D4(uint64_t a1, int a2)
{
  CFTypeID v4 = sub_10000856C("OTATrust");
  double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Got lock status notification for at-risk last check-in after MA daemon error",  v7,  2u);
  }

  sub_100016C08(0LL, *(void *)(a1 + 32), 0LL);
  return notify_cancel(a2);
}

uint64_t sub_100017768(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v6 = a1;
  id v63 = a3;
  id v60 = [[MAAssetQuery alloc] initWithType:v6];
  uint64_t v7 = sub_10000856C("OTATrust");
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "begin MobileAsset metadata sync request %{public}@",  (uint8_t *)&buf,  0xCu);
  }

  id v9 = [v60 queryMetaDataSync];
  if (v9)
  {
    sub_1000159FC( v6,  a5,  4,  @"MAQueryResult",  (int)v9,  @"failed to query MobileAsset %@ metadata: %ld",  v10,  v11,  (uint64_t)v6);
LABEL_5:
    char v62 = 0;
    goto LABEL_54;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue([v60 results]);
  BOOL v13 = v12 == 0LL;

  if (v13)
  {
    sub_1000159FC( v6,  a5,  4,  NSOSStatusErrorDomain,  -26276,  @"no results in MobileAsset query for %@",  v14,  v15,  (uint64_t)v6);
    goto LABEL_5;
  }

  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v90 = 0x3032000000LL;
  int8x16_t v91 = sub_100015E48;
  int8x16_t v92 = sub_100015E58;
  id v93 = 0LL;
  uint64_t v81 = 0LL;
  CFIndex v82 = &v81;
  uint64_t v83 = 0x3032000000LL;
  int v84 = sub_100015E48;
  unint64_t v85 = sub_100015E58;
  id v86 = 0LL;
  __int128 v77 = 0u;
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v60 results]);
  id v17 = [v16 countByEnumeratingWithState:&v77 objects:v88 count:16];
  if (v17)
  {
    char v62 = 0;
    uint64_t v65 = *(void *)v78;
    id obj = v16;
    do
    {
      uint64_t v18 = 0LL;
      do
      {
        if (*(void *)v78 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void **)(*((void *)&v77 + 1) + 8LL * (void)v18);
        uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetProperty:@"_ContentVersion"]);
        if ((sub_100014BB0(v6, v19) & 1) != 0)
        {
          if ([v6 isEqualToString:@"com.apple.MobileAsset.PKITrustSupplementals"])
          {
            id v21 = (id)objc_claimAutoreleasedReturnValue([v19 attributes]);
            id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"CTKillSwitch"]);
            if (v22 && (uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSNumber), (objc_opt_isKindOfClass(v22, v23) & 1) != 0))
            {
              *(void *)CFTypeID v87 = 0LL;
              sub_1000160C8(@"CTKillSwitch", v22, (uint64_t *)v87);
              sub_100017F6C(@"CTKillSwitch", (char)[v22 BOOLValue]);
              uint64_t v24 = sub_10000856C("OTATrust");
              id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                unsigned int v26 = [v22 BOOLValue];
                *(_DWORD *)v96 = 67109120;
                *(_DWORD *)&v96[4] = v26;
                _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "got CT kill switch = %{BOOL}d",  v96,  8u);
              }

              char v27 = 1;
            }

            else
            {
              char v27 = 0;
            }

            int v28 = (void *)objc_claimAutoreleasedReturnValue([v21 objectForKey:@"CTKillSwitch_nonTLS"]);

            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = objc_opt_class(&OBJC_CLASS___NSNumber);
              char isKindOfClass = objc_opt_isKindOfClass(v29, v30);

              if ((isKindOfClass & 1) != 0)
              {
                *(void *)v96 = 0LL;
                sub_1000160C8(@"CTKillSwitch_nonTLS", v29, (uint64_t *)v96);
                sub_100017F6C(@"CTKillSwitch_nonTLS", (char)[v29 BOOLValue]);
                dispatch_time_t v32 = sub_10000856C("OTATrust");
                uint64_t v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  unsigned int v34 = [v29 BOOLValue];
                  *(_DWORD *)uint64_t v94 = 67109120;
                  unsigned int v95 = v34;
                  _os_log_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEFAULT,  "got non-TLS CT kill switch = %{BOOL}d",  v94,  8u);
                }

                char v27 = 1;
              }
            }

            if (qword_100082C10 != -1) {
              dispatch_once(&qword_100082C10, &stru_100076788);
            }
          }

          switch((unint64_t)[v19 state])
          {
            case 0uLL:
              uint64_t v35 = *((void *)&buf + 1);
              int v74 = *(void **)(*((void *)&buf + 1) + 40LL);
              int v36 = [v19 state];
              sub_1000159FC( v6,  &v74,  4,  @"MAAssetState",  v36,  @"asset %@ is unknown",  v37,  v38,  (uint64_t)v6);
              uint64_t v39 = v74;
              goto LABEL_40;
            case 1uLL:
              goto LABEL_36;
            case 2uLL:
              uint64_t v40 = *((void *)&buf + 1);
              id v75 = *(id *)(*((void *)&buf + 1) + 40LL);
              id v41 = sub_100014F24(v6, v19, v20, (uint64_t *)&v75);
              uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
              objc_storeStrong((id *)(v40 + 40), v75);
              uint64_t v43 = (void *)v82[5];
              v82[5] = v42;
              break;
            case 4uLL:
              id v44 = sub_10000856C("OTATrust");
              uint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)CFTypeID v87 = 138543362;
                *(void *)&v87[4] = v6;
                _os_log_impl( (void *)&_mh_execute_header,  v45,  OS_LOG_TYPE_DEFAULT,  "asset %{public}@ is downloading",  v87,  0xCu);
              }

LABEL_36:
              BOOL v46 = sub_10000856C("OTATrust");
              uint64_t v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)CFTypeID v87 = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "begin download of OTATrust asset",  v87,  2u);
              }

              id v48 = sub_1000172EC();
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
              v66[0] = _NSConcreteStackBlock;
              v66[1] = 3221225472LL;
              v66[2] = sub_100017FF0;
              v66[3] = &unk_100076650;
              id v50 = v6;
              p___int128 buf = &buf;
              uint64_t v72 = &v81;
              id v67 = v50;
              uint64_t v68 = v19;
              id v69 = v20;
              char v73 = a2;
              id v70 = v63;
              [v19 startDownload:v49 then:v66];

              char v62 = 1;
              uint64_t v43 = v67;
              break;
            default:
              uint64_t v35 = *((void *)&buf + 1);
              CFStringRef v76 = *(void **)(*((void *)&buf + 1) + 40LL);
              id v51 = [v19 state];
              sub_1000159FC( v6,  &v76,  4,  NSOSStatusErrorDomain,  -26276,  @"unknown asset state %ld",  v52,  v53,  (uint64_t)v51);
              uint64_t v39 = v76;
LABEL_40:
              id v54 = v39;
              uint64_t v43 = *(void **)(v35 + 40);
              *(void *)(v35 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v54;
              break;
          }
        }

        uint64_t v18 = (char *)v18 + 1;
      }

      while (v17 != v18);
      uint64_t v16 = obj;
      id v17 = [obj countByEnumeratingWithState:&v77 objects:v88 count:16];
    }

    while (v17);
  }

  else
  {
    char v62 = 0;
  }

  if (a5)
  {
    uint64_t v55 = *(void **)(*((void *)&buf + 1) + 40LL);
    if (v55) {
      *a5 = v55;
    }
  }

  if (a4)
  {
    char v56 = (void *)v82[5];
    if (v56) {
      *a4 = v56;
    }
  }

  _Block_object_dispose(&v81, 8);

  _Block_object_dispose(&buf, 8);
LABEL_54:

  return v62 & 1;
}

void sub_100017F20( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, char a47)
{
}

void sub_100017F6C(void *a1, char a2)
{
  id v3 = a1;
  CFTypeID v4 = (dispatch_queue_s *)qword_100082BB0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000180F0;
  block[3] = &unk_1000790F8;
  id v7 = v3;
  char v8 = a2;
  id v5 = v3;
  dispatch_sync(v4, block);
}

void sub_100017FF0(uint64_t a1, uint64_t a2)
{
  CFTypeID v4 = objc_autoreleasePoolPush();
  id v7 = (void *)os_transaction_create("com.apple.trustd.asset.downloadAsset");
  char v8 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v9 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id obj = *(id *)(v9 + 40);
    sub_1000159FC( v8,  &obj,  4,  @"MADownLoadResult",  a2,  @"failed to download asset %@: %ld",  v5,  v6,  (uint64_t)v8);
    objc_storeStrong((id *)(v9 + 40), obj);
  }

  else
  {
    uint64_t v10 = *(void **)(a1 + 40);
    uint64_t v11 = *(void **)(a1 + 48);
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v18 = *(id *)(v12 + 40);
    id v13 = sub_100014F24(v8, v10, v11, (uint64_t *)&v18);
    uint64_t v14 = objc_claimAutoreleasedReturnValue(v13);
    objc_storeStrong((id *)(v12 + 40), v18);
    uint64_t v15 = *(void *)(*(void *)(a1 + 72) + 8LL);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v14;

    if (*(_BYTE *)(a1 + 80))
    {
      id v17 = *(dispatch_semaphore_s **)(a1 + 56);
      if (v17) {
        dispatch_semaphore_signal(v17);
      }
    }
  }

  objc_autoreleasePoolPop(v4);
}

id sub_1000180F0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isEqualToString:@"CTKillSwitch"];
  if ((_DWORD)result)
  {
    *(_BYTE *)(qword_100082BD8 + 20syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = *(_BYTE *)(a1 + 40);
  }

  else
  {
    id result = [*(id *)(a1 + 32) isEqualToString:@"CTKillSwitch_nonTLS"];
    if ((_DWORD)result) {
      *(_BYTE *)(qword_100082BD8 + 201) = *(_BYTE *)(a1 + 40);
    }
  }

  return result;
}

uint64_t sub_100018158()
{
  if (!qword_100082BB0) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  CFTypeID v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000181F4;
  block[3] = &unk_1000772B8;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void *sub_1000181F4(void *result)
{
  if (qword_100082BD8)
  {
    id v1 = result;
    uint64_t v2 = *(void *)(qword_100082BD8 + 160);
    if (v2) {
      id result = CFRetain(*(CFTypeRef *)(qword_100082BD8 + 160));
    }
    *(void *)(*(void *)(v1[4] + 8LL) + 24LL) = v2;
  }

  return result;
}

void sub_100018238(id a1, int a2)
{
  char v2 = sub_1000146C4(@"CTKillSwitch");
  sub_100017F6C(@"CTKillSwitch", v2);
  char v3 = sub_1000146C4(@"CTKillSwitch_nonTLS");
  sub_100017F6C(@"CTKillSwitch_nonTLS", v3);
}

void sub_100018284(id a1, int a2)
{
  char v2 = sub_10000856C("OTATrust");
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)CFTypeID v4 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "Got notification about successful PKITrustSupplementals asset check-in",  v4,  2u);
  }

  sub_1000162A0();
}

void sub_1000182F8(id a1, int a2)
{
  char v2 = sub_10000856C("OTATrust");
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)__int128 buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Got notification about a new PKITrustSupplementals asset from system trustd.",  buf,  2u);
  }

  uint64_t v14 = 0LL;
  CFTypeID v4 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000139E0(&v14));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = v14;
  id v7 = sub_1000135AC(0LL);
  char v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v13 = v6;
  char v9 = sub_100015304(v8, v5, (uint64_t *)&v13);
  id v10 = v13;

  if ((v9 & 1) == 0)
  {
    uint64_t v11 = sub_10000856C("SecError");
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v16 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to update from asset after notification: %@",  buf,  0xCu);
    }

    sub_10001846C();
  }
}

uint64_t sub_10001846C()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000184D4;
  block[3] = &unk_1000790A8;
  void block[4] = sub_100013E48(@"MobileAssetContentVersion");
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  return sub_10001387C();
}

void sub_1000184D4(uint64_t a1)
{
  uint64_t v1 = qword_100082BD8;
  *(void *)(qword_100082BD8 + 152) = *(void *)(a1 + 32);
  char v2 = *(const void **)(v1 + 160);
  if (v2)
  {
    *(void *)(v1 + 16syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
    CFRelease(v2);
    uint64_t v1 = qword_100082BD8;
  }

  *(void *)(v1 + 16syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
}

void sub_100018514(id a1)
{
  uint64_t v1 = sub_10000856C("OTATrust");
  char v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "Initial check with MobileAsset for newer PKITrustSupplementals asset",  v3,  2u);
  }

  sub_100016C08(0LL, @"com.apple.MobileAsset.PKITrustSupplementals", 0LL);
}

void sub_100018594(id a1, int a2)
{
  char v2 = sub_10000856C("OTATrust");
  char v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFTypeID v4 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Got notification about a new PKITrustSupplementals asset from mobileassetd.",  v4,  2u);
  }

  sub_100017768(@"com.apple.MobileAsset.PKITrustSupplementals", 0, 0LL, 0LL, 0LL);
}

void sub_10001861C(uint64_t a1)
{
  char v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 208) startUsingLocalAsset]);
  char v3 = v2;
  if (v2) {
    *(void *)(*(void *)(a1 + 32) + 216LL) = v2;
  }
  CFTypeID v4 = sub_10000856C("OTATrust");
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Using asset path: %@", (uint8_t *)&v6, 0xCu);
  }
}

void *sub_1000186EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_1000145D4(a1);
  if (!v5) {
    return 0LL;
  }
  int v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v5, a2));
  if (a3)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@.%@", v7, a3));

    id v7 = (void *)v8;
  }

  char v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v7, 0LL));
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }

  else
  {
    uint64_t v12 = sub_10000856C("SecWarning");
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412802;
      uint64_t v16 = a2;
      __int16 v17 = 2112;
      uint64_t v18 = a3;
      __int16 v19 = 2112;
      uint64_t v20 = 0LL;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "resource: %@.%@ in %@ not found", buf, 0x20u);
    }
  }

  CFRelease(v6);

  return v10;
}

void sub_100018854(void *a1, size_t a2)
{
  int v4 = munmap(a1, a2);
  if (v4)
  {
    int v5 = v4;
    int v6 = sub_10000856C("SecError");
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134218496;
      size_t v9 = a2;
      __int16 v10 = 2048;
      id v11 = a1;
      __int16 v12 = 1024;
      int v13 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "unable to unmap %ld bytes at %p (error %d)",  (uint8_t *)&v8,  0x1Cu);
    }
  }

void sub_10001892C(uint64_t a1, uint64_t a2)
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](&OBJC_CLASS___NSString, "stringWithUTF8String:", a2));
  uint64_t v3 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v6, 1LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  int v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v3;
}

void sub_10001899C(id a1)
{
}

void sub_1000189B0(id a1)
{
  uint64_t v1 = sub_10000856C("OTATrust");
  char v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEFAULT,  "--- Received asset download notification ---",  v3,  2u);
  }

  sub_100025DB4((uint64_t)"Will exit when clean to use downloaded asset.");
}

uint64_t sub_100018A28()
{
  if (!qword_100082BB0) {
    return 0LL;
  }
  sub_100018AD4((void *)qword_100082BA8);
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018B80;
  block[3] = &unk_1000772B8;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100018AD4(void *a1)
{
  id v5 = a1;
  int v1 = sub_1000111F8();
  char v2 = v5;
  if (v1)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100018BC4;
    block[3] = &unk_100077A78;
    id v3 = v5;
    id v7 = v3;
    if (qword_100082C00 == -1)
    {
      uint64_t v4 = v3;
    }

    else
    {
      dispatch_once(&qword_100082C00, block);
      uint64_t v4 = v7;
    }

    dispatch_source_merge_data((dispatch_source_t)qword_100082BF0, 1uLL);

    char v2 = v5;
  }
}

void *sub_100018B80(void *result)
{
  if (qword_100082BD8)
  {
    int v1 = result;
    uint64_t v2 = *(void *)(qword_100082BD8 + 40);
    if (v2) {
      id result = CFRetain(*(CFTypeRef *)(qword_100082BD8 + 40));
    }
    *(void *)(*(void *)(v1[4] + 8LL) + 24LL) = v2;
  }

  return result;
}

void sub_100018BC4(uint64_t a1)
{
  uint64_t v2 = sub_1000170F8();
  id v3 = sub_10000856C("OTATrust");
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Setting periodic update delta to %llu seconds",  (uint8_t *)&v9,  0xCu);
  }

  dispatch_source_t v5 = sub_10000F4F4(*(dispatch_object_s **)(a1 + 32), "OTATrust", v2);
  uint64_t v6 = (void *)qword_100082BF0;
  qword_100082BF0 = (uint64_t)v5;

  id v7 = (dispatch_object_s *)qword_100082BF0;
  context = dispatch_get_context((dispatch_object_t)qword_100082BF0);
  context[2] = _Block_copy(&stru_100076740);
  dispatch_activate(v7);
}

void sub_100018CC8(id a1)
{
  if (byte_100082BF8 == 1)
  {
    if (qword_100082C10 != -1) {
      dispatch_once(&qword_100082C10, &stru_100076788);
    }
    if (byte_100082C08 == 1)
    {
      sub_100016C08(0LL, @"com.apple.MobileAsset.SecExperimentAssets", 0LL);
      sub_100016C08(0LL, @"com.apple.MobileAsset.PKITrustSupplementals", 0LL);
    }

    else
    {
      int v1 = sub_10000856C("OTATrust");
      uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue(v1);
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)__int128 buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "periodic re-read asset from disk", buf, 2u);
      }

      int v13 = 0LL;
      id v3 = +[NSNumber numberWithUnsignedLongLong:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedLongLong:",  sub_1000139E0(&v13));
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
      dispatch_source_t v5 = v13;
      id v6 = sub_1000135AC(0LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
      id v12 = v5;
      char v8 = sub_100015304(v7, v4, (uint64_t *)&v12);
      id v9 = v12;

      if ((v8 & 1) == 0)
      {
        uint64_t v10 = sub_10000856C("SecError");
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)__int128 buf = 138412290;
          id v15 = v9;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "OTATrust: failed to update from asset during periodic re-read: %@",  buf,  0xCu);
        }

        sub_10001846C();
      }
    }
  }

  byte_100082BF8 = 1;
}

uint64_t sub_100018EB8()
{
  if (!qword_100082BB0) {
    return 0LL;
  }
  sub_100018AD4((void *)qword_100082BA8);
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100018F64;
  block[3] = &unk_1000772B8;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void *sub_100018F64(void *result)
{
  if (qword_100082BD8)
  {
    int v1 = result;
    uint64_t v2 = *(const void **)(qword_100082BD8 + 48);
    if (v2 {
      || (id result = sub_100013160(@"TrustedCTLogs_nonTLS.plist"),
    }
          uint64_t v2 = result,
          (*(void *)(qword_100082BD8 + 4_Block_object_dispose((const void *)(v47 - 192), 8) = result) != 0LL))
    {
      id result = CFRetain(v2);
    }

    *(void *)(*(void *)(v1[4] + 8LL) + 24LL) = v2;
  }

  return result;
}

void sub_100018FCC(uint64_t a1)
{
  if (qword_100082BD8)
  {
    uint64_t v2 = *(const __CFDictionary **)(qword_100082BD8 + 168);
    if (v2)
    {
      Value = (void *)CFDictionaryGetValue(v2, *(const void **)(a1 + 32));
      if (Value)
      {
        if ((v4 = Value, CFTypeID v5 = CFGetTypeID(Value), v5 == CFNumberGetTypeID())
          && CFNumberGetType((CFNumberRef)v4) == kCFNumberSInt64Type
          || (CFTypeID v6 = CFGetTypeID(v4), v6 == CFNumberGetTypeID())
          && CFNumberGetType((CFNumberRef)v4) == kCFNumberSInt32Type)
        {
          objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), v4);
        }
      }
    }
  }

void *sub_100019080(void *result)
{
  if (qword_100082BD8)
  {
    int v1 = result;
    uint64_t v2 = *(void *)(qword_100082BD8 + 176);
    if (v2) {
      id result = CFRetain(*(CFTypeRef *)(qword_100082BD8 + 176));
    }
    *(void *)(*(void *)(v1[4] + 8LL) + 24LL) = v2;
  }

  return result;
}

BOOL sub_1000190C4(uint64_t a1)
{
  BOOL v1 = 0LL;
  if (a1 && qword_100082BB0)
  {
    uint64_t v4 = 0LL;
    CFTypeID v5 = &v4;
    uint64_t v6 = 0x2020000000LL;
    char v7 = 0;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472LL;
    v3[2] = sub_10001916C;
    unint64_t v3[3] = &unk_100076500;
    v3[4] = &v4;
    v3[5] = a1;
    dispatch_sync((dispatch_queue_t)qword_100082BB0, v3);
    BOOL v1 = *((_BYTE *)v5 + 24) != 0;
    _Block_object_dispose(&v4, 8);
  }

  return v1;
}

void *sub_10001916C(void *result)
{
  if (qword_100082BD8)
  {
    BOOL v1 = result;
    id result = (void *)result[5];
    if (result)
    {
      id result = (void *)CFEqual(result, @"CTKillSwitch");
      if ((_DWORD)result)
      {
        uint64_t v2 = (_BYTE *)(qword_100082BD8 + 200);
LABEL_8:
        *(_BYTE *)(*(void *)(v1[4] + 8LL) + 24LL) = *v2;
        return result;
      }

      id result = (void *)v1[5];
      if (result)
      {
        id result = (void *)CFEqual(result, @"CTKillSwitch_nonTLS");
        if ((_DWORD)result)
        {
          uint64_t v2 = (_BYTE *)(qword_100082BD8 + 201);
          goto LABEL_8;
        }
      }
    }
  }

  return result;
}

void *sub_1000191E8(__CFString **a1)
{
  uint64_t v2 = (void *)sub_100018A28();
  uint64_t v3 = objc_autoreleasePoolPush();
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithCapacity:]( NSMutableDictionary,  "dictionaryWithCapacity:",  [v2 count]));
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = v2;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (CFIndex i = 0LL; i != v7; CFIndex i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v10, (void)v14));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 base64EncodedStringWithOptions:0]);
        [v4 setObject:v11 forKeyedSubscript:v12];
      }

      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v7);
  }

  objc_autoreleasePoolPop(v3);
  if (!v4) {
    sub_10000DE88(-26276, a1, @"Could not get CT logs from the current OTAPKIRef");
  }
  return v4;
}

const void *sub_100019378(const void *a1)
{
  uint64_t v2 = (const __CFDictionary *)sub_100018A28();
  uint64_t v3 = sub_100018EB8();
  uint64_t v4 = (const __CFDictionary *)v3;
  if (v2 && v3)
  {
    Value = CFDictionaryGetValue(v2, a1);
    if (Value || (Value = CFDictionaryGetValue(v4, a1)) != 0LL) {
      CFRetain(Value);
    }
    CFRelease(v2);
LABEL_10:
    CFRelease(v4);
    return Value;
  }

  if (v2) {
    CFRelease(v2);
  }
  Value = 0LL;
  id result = 0LL;
  if (v4) {
    goto LABEL_10;
  }
  return result;
}

uint64_t sub_100019414(__CFString **a1)
{
  uint64_t v2 = sub_100011A14();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = *(void *)(v2 + 96);
    if (v4) {
      CFRetain(*(CFTypeRef *)(v2 + 96));
    }
    CFRelease(v3);
  }

  else
  {
    sub_10000DE88(-26276, a1, @"Unable to get the current OTAPKIRef");
    return 0LL;
  }

  return v4;
}

uint64_t sub_100019474(__CFString **a1)
{
  uint64_t v2 = sub_100011A14();
  if (v2)
  {
    uint64_t v3 = (const void *)v2;
    uint64_t v4 = *(void *)(v2 + 104);
    if (v4) {
      CFRetain(*(CFTypeRef *)(v2 + 104));
    }
    CFRelease(v3);
  }

  else
  {
    sub_10000DE88(-26276, a1, @"Unable to get the current OTAPKIRef");
    return 0LL;
  }

  return v4;
}

uint64_t sub_1000194D4(uint64_t a1, __CFString **a2)
{
  uint64_t valuePtr = 0LL;
  if (a1)
  {
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@/%@",  a1,  @"AssetVersion.plist"));
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](&OBJC_CLASS___NSURL, "fileURLWithPath:isDirectory:", v2, 0LL));
    uint64_t v4 = (const __CFData *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](&OBJC_CLASS___NSData, "dataWithContentsOfURL:", v3));
    if (v4
      && (formCFAbsoluteTime at = 0xAAAAAAAAAAAAAAAALL,
          (id v5 = (const __CFDictionary *)CFPropertyListCreateWithData(kCFAllocatorDefault, v4, 0LL, &format, 0LL)) != 0LL))
    {
      id v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      if (v7 == CFDictionaryGetTypeID()
        && (Value = (const __CFNumber *)CFDictionaryGetValue(v6, @"VersionNumber")) != 0LL)
      {
        CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
        uint64_t v9 = valuePtr;
        if (valuePtr < 0)
        {
          uint64_t v9 = 0LL;
          uint64_t valuePtr = 0LL;
        }
      }

      else
      {
        uint64_t v9 = 0LL;
      }

      CFRelease(v6);
    }

    else
    {
      uint64_t v9 = 0LL;
    }
  }

  else
  {
    sub_10000DE88(-26276, a2, @"Unable to get trust store version (empty path)");
    return 0LL;
  }

  return v9;
}

uint64_t sub_100019624()
{
  uint64_t v0 = sub_100013E48(@"VersionNumber");
  if (!v0) {
    sub_10000DE88(-26276, 0LL, @"Unable to get the system trust store version");
  }
  return v0;
}

uint64_t sub_100019668(__CFString **a1)
{
  uint64_t v2 = (void *)sub_100011A14();
  if (v2)
  {
    uint64_t v3 = v2[14];
    CFRelease(v2);
  }

  else
  {
    sub_10000DE88(-26276, a1, @"Unable to get the current OTAPKIRef");
    return 0LL;
  }

  return v3;
}

unint64_t sub_1000196B4(__CFString **a1)
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    id v7 = 0LL;
    BOOL v2 = sub_100016C08(1LL, @"com.apple.MobileAsset.PKITrustSupplementals", &v7);
    uint64_t v3 = (__CFString *)v7;
    uint64_t v4 = v3;
    if (a1 && !v2)
    {
      if (v3) {
        CFRetain(v3);
      }
      *a1 = v4;
    }
  }

  else
  {
    sub_10000DE88(-67585, a1, @"This function may only be performed by the system trustd.");
    uint64_t v4 = 0LL;
  }

  unint64_t v5 = sub_1000139E0(0LL);

  return v5;
}

uint64_t sub_10001978C(__CFString **a1)
{
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    id v7 = 0LL;
    BOOL v2 = sub_100016C08(1LL, @"com.apple.MobileAsset.SecExperimentAssets", &v7);
    uint64_t v3 = (__CFString *)v7;
    uint64_t v4 = v3;
    if (a1 && !v2)
    {
      if (v3) {
        CFRetain(v3);
      }
      *a1 = v4;
    }
  }

  else
  {
    sub_10000DE88(-67585, a1, @"This function may only be performed by the system trustd.");
    uint64_t v4 = 0LL;
  }

  uint64_t v5 = sub_100016B04(a1);

  return v5;
}

uint64_t sub_100019864()
{
  if (!qword_100082BB0) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = &v3;
  uint64_t v5 = 0x2020000000LL;
  uint64_t v6 = 0LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100019900;
  block[3] = &unk_1000772B8;
  void block[4] = &v3;
  dispatch_sync((dispatch_queue_t)qword_100082BB0, block);
  uint64_t v0 = v4[3];
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_100019900(uint64_t a1)
{
  if (qword_100082BD8)
  {
    uint64_t v1 = *(void *)(qword_100082BD8 + 184);
    if (v1)
    {
      CFRetain(*(CFTypeRef *)(qword_100082BD8 + 184));
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v1;
      uint64_t v3 = sub_10000856C("OTATrust");
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v9 = 0;
        uint64_t v5 = "asset found";
        uint64_t v6 = (uint8_t *)&v9;
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
      }
    }

    else
    {
      id v7 = sub_10000856C("OTATrust");
      uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v8 = 0;
        uint64_t v5 = "asset NULL";
        uint64_t v6 = (uint8_t *)&v8;
        goto LABEL_7;
      }
    }
  }

BOOL sub_100019C00(const char *a1, void *a2)
{
  int v4 = open(a1, 0);
  if (v4)
  {
    int v5 = v4;
    int v6 = fcntl(v4, 64, 4LL);
    BOOL v7 = v6 >= 0;
    if (v6 < 0)
    {
      uint64_t v8 = *__error();
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      __int16 v9 = __error();
      uint64_t v10 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to change protection class of %s: %s",  a1,  strerror(*v9));
      id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      uint64_t v24 = v11;
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
      int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v8,  v12));

      if (a2 && !*a2) {
        *a2 = v13;
      }
    }

    close(v5);
  }

  else
  {
    uint64_t v14 = *__error();
    NSErrorUserInfoKey v21 = NSLocalizedDescriptionKey;
    __int128 v15 = __error();
    __int128 v16 = +[NSString localizedStringWithFormat:]( &OBJC_CLASS___NSString,  "localizedStringWithFormat:",  @"failed to open file for protection class change %s: %s",  a1,  strerror(*v15));
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v22 = v17;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSPOSIXErrorDomain,  v14,  v18));

    if (a2 && !*a2) {
      *a2 = v19;
    }

    return 0LL;
  }

  return v7;
}

void sub_100019E2C(id a1)
{
  if (getuid() == 282 || !getuid() && gTrustd) {
    byte_100082C08 = 1;
  }
}

os_log_s *sub_100019E6C(uid_t a1)
{
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = 0xAAAAAAAAAAAAAAAALL;
  int v2 = mbr_uid_to_uuid(a1, (unsigned __int8 *)v9);
  if (v2)
  {
    int v3 = v2;
    int v4 = sub_10000856C("SecError");
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109376;
      uid_t v11 = a1;
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "failed to get UUID for user(%d) - %d",  buf,  0xEu);
    }

    int v6 = 0LL;
  }

  else
  {
    BOOL v7 = -[NSData initWithBytes:length:](objc_alloc(&OBJC_CLASS___NSData), "initWithBytes:length:", v9, 16LL);
    int v5 = v7;
    if (v7)
    {
      int v5 = v7;
      int v6 = v5;
    }

    else
    {
      int v6 = 0LL;
    }
  }

  return v6;
}

CFURLRef sub_100019F80(uint64_t a1)
{
  if (qword_100082C18 != -1)
  {
    dispatch_once(&qword_100082C18, &stru_1000767A8);
    if (a1) {
      goto LABEL_3;
    }
LABEL_5:
    int v2 = @"trustd/";
    goto LABEL_6;
  }

  if (!a1) {
    goto LABEL_5;
  }
LABEL_3:
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"trustd/%@",  a1));
LABEL_6:
  CFURLRef v3 = sub_10000FBA4(@"private/var/protected/", (uint64_t)v2);

  return v3;
}

void sub_10001A018(id a1)
{
  uint64_t v1 = sub_10000FBA4(@"private/var/protected/", (uint64_t)@"trustd");
  sub_10000FC8C(v1, (uint64_t)&stru_1000767C8);
}

void sub_10001A044(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      int v5 = sub_10000856C("SecError");
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 136315394;
        __int16 v9 = a2;
        __int16 v10 = 2080;
        uid_t v11 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "could not create path: %s (%s)",  (uint8_t *)&v8,  0x16u);
      }
    }
  }

  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    uid_t v7 = getuid();
    chown(a2, v7, v7);
    chmod(a2, 0x1EDu);
  }

CFURLRef sub_10001A17C(uint64_t a1)
{
  if (qword_100082C20 != -1)
  {
    dispatch_once(&qword_100082C20, &stru_1000767E8);
    if (a1) {
      goto LABEL_3;
    }
LABEL_5:
    int v2 = @"private/";
    goto LABEL_6;
  }

  if (!a1) {
    goto LABEL_5;
  }
LABEL_3:
  int v2 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"private/%@",  a1));
LABEL_6:
  CFURLRef v3 = sub_100019F80((uint64_t)v2);

  return v3;
}

void sub_10001A20C(id a1)
{
}

void sub_10001A220(uint64_t a1, void *a2)
{
  id v4 = a2;
  CFURLRef v3 = sub_100019F80(a1);
  sub_10000FC8C(v3, (uint64_t)v4);
}

void sub_10001A260(id a1, const char *a2)
{
  int v3 = mkpath_np(a2, 0x1FFu);
  if (v3)
  {
    int v4 = v3;
    if (v3 != 17)
    {
      int v5 = sub_10000856C("SecError");
      int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = 136315394;
        int v8 = a2;
        __int16 v9 = 2080;
        __int16 v10 = strerror(v4);
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "could not create path: %s (%s)",  (uint8_t *)&v7,  0x16u);
      }
    }
  }

  chmod(a2, 0x1FFu);
}

void sub_10001A34C()
{
  uint64_t v0 = &stru_100076B48;
  uint64_t v1 = sub_10001A17C((uint64_t)@"caissuercache.sqlite3");
  sub_10000FC8C(v1, (uint64_t)&stru_100076B48);
}

void sub_10001A388()
{
  uint64_t v0 = objc_autoreleasePoolPush();
  uint64_t v16 = 0LL;
  __int128 v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  if ((sub_100011134() & 1) != 0)
  {
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    NSErrorUserInfoKey v21 = sub_10001A708;
    id v22 = &unk_100079B48;
    NSErrorUserInfoKey v23 = &v16;
    sub_10000FD28((uint64_t)@"Analytics", (uint64_t)&buf);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    unint64_t v15[2] = sub_10001A884;
    v15[3] = &unk_100079B48;
    v15[4] = &v16;
    uint64_t v1 = v15;
    int v2 = sub_10001A17C((uint64_t)@"TrustStore.sqlite3");
    sub_10000FC8C(v2, (uint64_t)v1);

    LODWORD(v1) = *((unsigned __int8 *)v17 + 24);
    _Block_object_dispose(&v16, 8);
    if ((_DWORD)v1)
    {
      int v3 = -[NSXPCConnection initWithMachServiceName:options:]( objc_alloc(&OBJC_CLASS___NSXPCConnection),  "initWithMachServiceName:options:",  @"com.apple.securityuploadd",  0LL);
      int v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___TrustdFileHelper_protocol));
      -[NSXPCConnection setRemoteObjectInterface:](v3, "setRemoteObjectInterface:", v4);

      -[NSXPCConnection resume](v3, "resume");
      if (v3)
      {
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        void v13[2] = sub_10001A978;
        unint64_t v13[3] = &unk_100076830;
        uint64_t v14 = @"securityuploadd";
        int v5 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( v3,  "synchronousRemoteObjectProxyWithErrorHandler:",  v13));
        int v6 = v5;
        if (v5)
        {
          v11[0] = _NSConcreteStackBlock;
          v11[1] = 3221225472LL;
          void v11[2] = sub_10001AA44;
          void v11[3] = &unk_100076858;
          __int16 v12 = @"securityuploadd";
          [v5 fixFiles:v11];
        }

        -[NSXPCConnection invalidate](v3, "invalidate");

        int v7 = (os_log_s *)v14;
      }

      else
      {
        __int16 v10 = sub_10000856C("SecError");
        int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf) = 138543362;
          *(void *)((char *)&buf + 4) = @"securityuploadd";
          _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "failed to ceate %{public}@ connection",  (uint8_t *)&buf,  0xCu);
        }
      }

      goto LABEL_14;
    }
  }

  else
  {
    _Block_object_dispose(&v16, 8);
  }

  int v8 = sub_10000856C("helper");
  __int16 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf) = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "trustd file permissions already fixed. skipping trustdFileHelper call.",  (uint8_t *)&buf,  2u);
  }

LABEL_14:
  objc_autoreleasePoolPop(v0);
}

void sub_10001A664( _Unwind_Exception *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, char a25)
{
  if (a2 == 1)
  {
    id v27 = objc_begin_catch(exc_buf);
    int v28 = sub_10000856C("SecError");
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)(v26 - 12_Block_object_dispose((const void *)(v47 - 192), 8) = 138412290;
      *(void *)(v25 + 4) = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "failed to fix files; caught exception: %@",
        (uint8_t *)(v26 - 128),
        0xCu);
    }

    objc_end_catch();
    JUMPOUT(0x10001A5F4LL);
  }

  _Unwind_Resume(exc_buf);
}

void sub_10001A708(uint64_t a1, char *a2)
{
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v3.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v3;
  *(timespec *)v12.st_qspare = v3;
  v12.st_birthtimespec = v3;
  *(timespec *)&v12.off_t st_size = v3;
  v12.st_mtimespec = v3;
  v12.st_ctimespec = v3;
  *(timespec *)&v12.st_uid = v3;
  v12.st_atimespec = v3;
  *(timespec *)&v12.st_dev = v3;
  if (!stat(a2, &v12))
  {
    if ((~v12.st_mode & 0x1FF) == 0) {
      return;
    }
    uid_t v11 = sub_10000856C("helper");
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_8;
    }
    *(_DWORD *)__int128 buf = 67109120;
    LODWORD(v14) = v12.st_mode;
    int v8 = "wrong permissions on Analytics dir: %d";
    __int16 v9 = v5;
    uint32_t v10 = 8;
    goto LABEL_11;
  }

  if (*__error() != 20 && *__error() != 2)
  {
    int v4 = sub_10000856C("helper");
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
LABEL_8:

      *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
      return;
    }

    int v6 = __error();
    int v7 = strerror(*v6);
    *(_DWORD *)__int128 buf = 136315138;
    uint64_t v14 = v7;
    int v8 = "failed to stat Analytics dir: %s";
    __int16 v9 = v5;
    uint32_t v10 = 12;
LABEL_11:
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v8, buf, v10);
    goto LABEL_8;
  }

void sub_10001A884(uint64_t a1, char *a2)
{
  v3.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v3.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v8.st_blksize = v3;
  *(timespec *)v8.st_qspare = v3;
  v8.st_birthtimespec = v3;
  *(timespec *)&v8.off_t st_size = v3;
  v8.st_mtimespec = v3;
  v8.st_ctimespec = v3;
  *(timespec *)&v8.st_uid = v3;
  v8.st_atimespec = v3;
  *(timespec *)&v8.st_dev = v3;
  if (stat(a2, &v8))
  {
    int v4 = sub_10000856C("helper");
    int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = __error();
      int v7 = strerror(*v6);
      *(_DWORD *)__int128 buf = 136315138;
      uint32_t v10 = v7;
      _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "failed to stat TrustStore: %s", buf, 0xCu);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 1;
  }

void sub_10001A978(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = sub_10000856C("SecError");
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "failed to talk to %{public}@: %@",  (uint8_t *)&v7,  0x16u);
  }
}

void sub_10001AA44(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = sub_10000856C("SecError");
    int v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ failed to fix our files: %@",  (uint8_t *)&v9,  0x16u);
    }
  }
}

uint64_t sub_10001AB18()
{
  if (qword_100082C30 != -1) {
    dispatch_once(&qword_100082C30, &stru_100076898);
  }
  return byte_100082C28;
}

void sub_10001AB58(id a1)
{
  char v4 = 0;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2000000000LL;
  char v14 = 0;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2000000000LL;
  int v10 = -1;
  if (qword_100082C38 != -1) {
    dispatch_once(&qword_100082C38, &stru_1000768D8);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10001ACDC;
  block[3] = &unk_100076900;
  void block[6] = &v4;
  strcpy(v6, "ctaa");
  void block[4] = &v7;
  void block[5] = &v11;
  dispatch_sync((dispatch_queue_t)qword_100082C40, block);
  if (*((_DWORD *)v8 + 6))
  {
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    uint64_t v1 = (os_log_s *)sub_10000856C("personalization");
    BOOL v2 = os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT);
    BOOL v3 = 0;
    if (v2)
    {
      LOWORD(block[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEFAULT,  "Failed to get entitlement BOOL",  (uint8_t *)block,  2u);
      BOOL v3 = 0;
    }
  }

  else
  {
    char v4 = *((_BYTE *)v12 + 24);
    _Block_object_dispose(&v7, 8);
    _Block_object_dispose(&v11, 8);
    BOOL v3 = v4 != 0;
  }

  byte_100082C28 = v3;
}

void sub_10001ACDC(uint64_t a1)
{
  if (qword_100082C88 != -1) {
    dispatch_once(&qword_100082C88, &stru_100076940);
  }
  v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)__s2.st_qspare = v2;
  *(timespec *)&__s2.st_blksize = v2;
  *(timespec *)&__s2.off_t st_size = v2;
  __s2.st_birthtimespec = v2;
  __s2.st_ctimespec = v2;
  __s2.st_mtimespec = v2;
  __s2.st_atimespec = v2;
  *(timespec *)&__s2.st_uid = v2;
  *(timespec *)&__s2.st_dev = v2;
  memset(__b, 170, 0x401uLL);
  uint64_t v3 = lookupPathForPersonalizedData(2LL, __b, 1025LL);
  if (!v3)
  {
    int v10 = open((const char *)__b, 0, 0LL);
    if (v10 < 0)
    {
      id v5 = (os_log_s *)sub_10000856C("personalization");
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      uint64_t v16 = __error();
      __int128 v17 = strerror(*v16);
      *(_DWORD *)__int128 buf = 136315138;
      off_t v62 = (off_t)v17;
      uint64_t v6 = "unable to open ticket file: %s";
      goto LABEL_6;
    }

    int v11 = v10;
    if (fstat(v10, &__s2) < 0)
    {
      uint64_t v18 = (os_log_s *)sub_10000856C("personalization");
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_32;
      }
      char v19 = __error();
      uint64_t v20 = strerror(*v19);
      *(_DWORD *)__int128 buf = 136315138;
      off_t v62 = (off_t)v20;
      NSErrorUserInfoKey v21 = "failed to stat ticket file: %s";
      id v22 = v18;
      uint32_t v23 = 12;
    }

    else
    {
      off_t st_size = __s2.st_size;
      if (__s2.st_size < 0)
      {
        uint64_t v24 = (os_log_s *)sub_10000856C("personalization");
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        *(_WORD *)__int128 buf = 0;
        NSErrorUserInfoKey v21 = "file size is negative";
        id v22 = v24;
        uint32_t v23 = 2;
      }

      else
      {
        uint64_t v13 = (UInt8 *)malloc(__s2.st_size);
        if (v13)
        {
          char v14 = v13;
          if (read(v11, v13, st_size) == st_size)
          {
            __int128 v15 = CFDataCreateWithBytesNoCopy(0LL, v14, st_size, kCFAllocatorMalloc);
            if (!v15) {
              free(v14);
            }
LABEL_33:
            if (v11) {
              close(v11);
            }
            if (!v15) {
              goto LABEL_7;
            }
            if (!byte_100082C48)
            {
              id v41 = (os_log_s *)sub_10000856C("SecError");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(__b[0]) = 0;
                _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Got a non-img4 ticket.",  (uint8_t *)__b,  2u);
              }

              goto LABEL_69;
            }

            uint64_t v31 = *(unsigned int *)(a1 + 56);
            char v32 = *(_BYTE *)(a1 + 60);
            uint64_t v33 = *(void *)(*(void *)(a1 + 40) + 8LL);
            uint64_t v60 = 0LL;
            char v59 = v32;
            BytePtr = CFDataGetBytePtr(v15);
            CFIndex Length = CFDataGetLength(v15);
            int v36 = Img4DecodeParseLengthFromBufferWithTag((uint64_t)BytePtr, Length, 0x494D344Du, &v60);
            if (v36)
            {
              int v37 = v36;
              uint64_t v38 = (os_log_s *)sub_10000856C("personalization");
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(__b[0]) = 67109120;
                DWORD1(__b[0]) = v37;
                uint64_t v39 = "Failed to get manifest length: %d";
                p_s2 = (uint8_t *)__b;
LABEL_66:
                uint64_t v52 = v38;
                uint32_t v53 = 8;
LABEL_67:
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, v39, p_s2, v53);
              }

LABEL_60:
            if (v46) {
              CFRelease(v46);
            }
            if (!v37)
            {
              Img4DecodePerformTrustEvaluation( 0x6B726E6Cu,  (uint64_t)__b,  (uint64_t)sub_10001B59C,  (uint64_t)&xmmword_100082C50,  0LL);
              if (!v54)
              {
                int BooleanFromSection = Img4DecodeGetBooleanFromSection((uint64_t)__b, 0, v31, (BOOL *)&v59);
                if (BooleanFromSection == 1)
                {
                  int v37 = 0;
                }

                else
                {
                  char v32 = v59;
                  int v37 = BooleanFromSection;
                }

                goto LABEL_68;
              }

              int v37 = v54;
              uint64_t v55 = (os_log_s *)sub_10000856C("personalization");
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(__s2.st_dev) = 0;
                uint64_t v39 = "failed to verify ap ticket";
                p_s2 = (uint8_t *)&__s2;
                uint64_t v52 = v55;
                uint32_t v53 = 2;
                goto LABEL_67;
              }

              goto LABEL_68;
            }

            uint64_t v38 = (os_log_s *)sub_10000856C("personalization");
            if (!os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_68;
            }
            __s2.st_dev = 67109120;
            *(_DWORD *)&__s2.st_mode = v37;
            uint64_t v39 = "Manifest digests did not match: %d";
LABEL_65:
            p_s2 = (uint8_t *)&__s2;
            goto LABEL_66;
          }

          int v28 = (os_log_s *)sub_10000856C("personalization");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            id v29 = __error();
            uint64_t v30 = strerror(*v29);
            *(_DWORD *)__int128 buf = 136315138;
            off_t v62 = (off_t)v30;
            _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "failed to read ticket data: %s",  buf,  0xCu);
          }

          free(v14);
LABEL_32:
          __int128 v15 = 0LL;
          goto LABEL_33;
        }

        uint64_t v25 = (os_log_s *)sub_10000856C("personalization");
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        uint64_t v26 = __error();
        id v27 = strerror(*v26);
        *(_DWORD *)__int128 buf = 134218242;
        off_t v62 = st_size;
        __int16 v63 = 2080;
        id v64 = v27;
        NSErrorUserInfoKey v21 = "failed to allocate %zu bytes: %s";
        id v22 = v25;
        uint32_t v23 = 22;
      }
    }

    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    goto LABEL_32;
  }

  uint64_t v4 = v3;
  id v5 = (os_log_s *)sub_10000856C("personalization");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 134217984;
    off_t v62 = v4;
    uint64_t v6 = "failed to get ticket file path: %ld";
LABEL_6:
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 0xCu);
  }

LABEL_7:
  uint64_t v7 = (os_log_s *)sub_10000856C("personalization");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__b[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Unable to read personalization ticket from disk",  (uint8_t *)__b,  2u);
  }

  uint64_t v8 = (os_log_s *)sub_10000856C("personalization");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__b[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to get ticket", (uint8_t *)__b, 2u);
  }

  uint64_t v9 = *(_BYTE **)(a1 + 48);
  if (v9) {
    *uint64_t v9 = *(_BYTE *)(a1 + 60);
  }
}

uint64_t sub_10001B59C()
{
  return 0LL;
}

void sub_10001B5A4(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (v1)
  {
    io_registry_entry_t v2 = v1;
    if (byte_100082C48) {
      uint64_t v3 = @"boot-manifest-hash";
    }
    else {
      uint64_t v3 = @"root-ticket-hash";
    }
    qword_100082C90 = (uint64_t)IORegistryEntryCreateCFProperty(v1, v3, kCFAllocatorDefault, 0);
    if (!qword_100082C90)
    {
      char v19 = (os_log_s *)sub_10000856C("personalization");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v2syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "unable to read manifest hash",  (uint8_t *)&v20,  2u);
      }

      uint64_t v8 = 0LL;
      id v5 = 0LL;
      goto LABEL_30;
    }

    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty( v2,  @"crypto-hash-method",  kCFAllocatorDefault,  0);
    id v5 = CFProperty;
    if (CFProperty)
    {
      BytePtr = CFDataGetBytePtr(CFProperty);
      CFIndex Length = CFDataGetLength(v5);
      uint64_t v8 = CFStringCreateWithBytes(0LL, BytePtr, Length - 1, 0x8000100u, 0);
      uint64_t v9 = (os_log_s *)sub_10000856C("personalization");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        int v20 = 138412290;
        NSErrorUserInfoKey v21 = v8;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "using hash method %@",  (uint8_t *)&v20,  0xCu);
      }
    }

    else
    {
      uint64_t v8 = @"sha1";
    }

    if (CFStringCompare(@"sha1", v8, 0LL))
    {
      if (CFStringCompare(@"sha2-384", v8, 0LL))
      {
        int v10 = (os_log_s *)sub_10000856C("personalization");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = 138412290;
          NSErrorUserInfoKey v21 = v8;
          _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "unknown hash found in crypto-hash-method entry: %@",  (uint8_t *)&v20,  0xCu);
        }

        int v11 = 2;
        goto LABEL_29;
      }

      if (qword_100082CA8 != -1) {
        dispatch_once(&qword_100082CA8, &stru_1000769C0);
      }
      if (byte_100082CB0)
      {
        uint64_t v13 = (os_log_s *)sub_10000856C("personalization");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v2syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "using DDI root", (uint8_t *)&v20, 2u);
        }

        char v14 = kImg4DecodeSecureBootRsa4kSha384DDI;
      }

      else
      {
        char v14 = kImg4DecodeSecureBootRsa4kSha384;
      }

      __int128 v15 = *((_OWORD *)v14 + 1);
      xmmword_100082C50 = *(_OWORD *)v14;
      unk_100082C60 = v15;
      xmmword_100082C70 = *((_OWORD *)v14 + 2);
      qword_100082C80 = (uint64_t)v14[6];
      uint64_t v12 = 48LL;
    }

    else
    {
      xmmword_100082C50 = *(_OWORD *)kImg4DecodeSecureBootRsa1kSha1;
      unk_100082C60 = *(_OWORD *)off_1000758C0;
      xmmword_100082C70 = *(_OWORD *)&off_1000758D0;
      qword_100082C80 = (uint64_t)&oidRsa;
      uint64_t v12 = 20LL;
    }

    qword_100082C98 = v12;
    if (v12 == CFDataGetLength((CFDataRef)qword_100082C90))
    {
      dword_1000827C8 = 0;
LABEL_30:
      IOObjectRelease(v2);
      goto LABEL_31;
    }

    uint64_t v16 = (os_log_s *)sub_10000856C("personalization");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "boot-manifest-hash length does not match crypto-hash-method",  (uint8_t *)&v20,  2u);
    }

    int v11 = 6;
LABEL_29:
    dword_1000827C8 = v11;
    goto LABEL_30;
  }

  uint64_t v18 = (os_log_s *)sub_10000856C("personalization");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v2syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Unable to read chosen node",  (uint8_t *)&v20,  2u);
  }

  id v5 = 0LL;
  uint64_t v8 = 0LL;
LABEL_31:
  if (dword_1000827C8)
  {
    __int128 v17 = (const void *)qword_100082C90;
    if (qword_100082C90)
    {
      qword_100082C90 = 0LL;
      CFRelease(v17);
    }

    qword_100082C98 = 0LL;
  }

  if (v5) {
    CFRelease(v5);
  }
  if (v8) {
    CFRelease(v8);
  }
}

void sub_10001B9D4(id a1)
{
  int v2 = 0;
  size_t v1 = 4LL;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0LL, 0LL)) {
    byte_100082CB0 = v2 == 1;
  }
}

void sub_10001BA2C(id a1)
{
  io_registry_entry_t v1 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/chosen");
  if (!v1)
  {
    uint64_t v7 = (os_log_s *)sub_10000856C("personalization");
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    char v6 = 0;
    if (!v8) {
      goto LABEL_10;
    }
    *(_WORD *)int v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to read chosen node", v11, 2u);
    goto LABEL_9;
  }

  io_object_t v2 = v1;
  CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(v1, @"image4-supported", kCFAllocatorDefault, 0);
  uint64_t v4 = (os_log_s *)sub_10000856C("personalization");
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (!CFProperty)
  {
    if (v5)
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "img3 device", buf, 2u);
    }

    IOObjectRelease(v2);
LABEL_9:
    char v6 = 0;
    goto LABEL_10;
  }

  if (v5)
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "img4 device", v9, 2u);
  }

  IOObjectRelease(v2);
  CFRelease(CFProperty);
  char v6 = 1;
LABEL_10:
  byte_100082C48 = v6;
}

void sub_10001BB88(id a1)
{
  qword_100082C40 = (uint64_t)dispatch_queue_create("apticket", 0LL);
}

uint64_t sub_10001BBB0(uint64_t a1, unsigned int a2, uint64_t (*a3)(void))
{
  if (a2 <= 0xE && (char v6 = malloc(8LL * (a2 + 1))) != 0LL)
  {
    uint64_t v7 = v6;
    char v8 = 0;
    int v9 = 0;
    unsigned int v10 = 0;
    *char v6 = a1;
    do
    {
      while (1)
      {
        while (1)
        {
          uint64_t v11 = v7[v10];
          if ((v8 & 1) != 0) {
            break;
          }
          uint64_t v13 = *(void *)(v11 + 32);
          if (!v13) {
            break;
          }
          char v8 = 0;
          v7[++v10] = v13;
          if ((v10 & 0x80000000) != 0) {
            goto LABEL_15;
          }
        }

        uint64_t v12 = *(void *)(v11 + 40);
        if (v10 == a2) {
          v9 |= a3();
        }
        if (!v12) {
          break;
        }
        char v8 = 0;
        v7[v10] = v12;
        if ((v10 & 0x80000000) != 0) {
          goto LABEL_15;
        }
      }

      --v10;
      char v8 = 1;
    }

    while ((v10 & 0x80000000) == 0);
LABEL_15:
    free(v7);
  }

  else
  {
    LOBYTE(v9) = 0;
  }

  return v9 & 1;
}

void sub_10001BC98(void **a1)
{
  io_object_t v2 = *a1;
  if (v2[4])
  {
    sub_10001BC98(v2 + 4);
    io_object_t v2 = *a1;
  }

  if (v2[5])
  {
    sub_10001BC98(v2 + 5);
    io_object_t v2 = *a1;
  }

  sub_10001BCF0(v2);
  *a1 = 0LL;
}

void sub_10001BCF0(void *a1)
{
  io_object_t v2 = (void *)a1[3];
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[2];
      free(v2);
      io_object_t v2 = v3;
    }

    while (v3);
  }

  free(a1);
}

void sub_10001BD28(uint64_t a1, int a2)
{
  char v6 = (uint64_t *)((char *)&v16 - v5);
  if ((v7 & 1) == 0) {
    memset((char *)&v16 - v5, 170, 8 * v4);
  }
  int v8 = 0;
  LOBYTE(v9) = 0;
  *char v6 = a1;
  do
  {
    while (1)
    {
      while (1)
      {
        unsigned int v10 = (void **)v6[v8];
        uint64_t v11 = (uint64_t)*v10;
        uint64_t v12 = (*v10)[4];
        if ((v9 & 1) != 0 || v8 >= a2) {
          break;
        }
        if (v12)
        {
          LOBYTE(v9) = 0;
          v6[++v8] = *v10 + 4;
          if (v8 < 0) {
            return;
          }
        }

        else
        {
LABEL_13:
          __int128 v15 = *(void **)(v11 + 40);
          *(void *)(v11 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
          sub_10001BCF0(*v10);
          *unsigned int v10 = v15;
          int v9 = v15 == 0LL;
          v8 -= v9;
          if (v8 < 0) {
            return;
          }
        }
      }

      if (!v12) {
        goto LABEL_13;
      }
      uint64_t v14 = *(void *)(v11 + 40);
      uint64_t v13 = v11 + 40;
      if (!v14) {
        break;
      }
      LOBYTE(v9) = 0;
      v6[v8] = v13;
      if (v8 < 0) {
        return;
      }
    }

    --v8;
    LOBYTE(v9) = 1;
  }

  while ((v8 & 0x80000000) == 0);
}

__n128 sub_10001BE60(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  char v6 = malloc(0x18uLL);
  _OWORD v6[2] = 0LL;
  *(_OWORD *)char v6 = *a2;
  char v7 = malloc(0x38uLL);
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)char v7 = *a2;
  void v7[2] = a3;
  v7[3] = v6;
  uint64_t v9 = *(void *)(a1 + 32);
  v7[4] = 0LL;
  v7[5] = v9;
  v7[6] = a1;
  *(void *)(a1 + 32) = v7;
  return result;
}

LABEL_6:
  int v20 = v7;
  objc_sync_exit(v5);

  return v20;
}

void sub_10001C33C(_Unwind_Exception *a1)
{
}

void sub_10001C3F0(double *a1)
{
  uint64_t v1 = qword_100082CC0;
  io_object_t v2 = (const __CFArray *)*((void *)a1 + 4);
  uint64_t v3 = (const __CFURL *)*((void *)a1 + 5);
  double v4 = a1[6];
  int v5 = sub_10001C71C(qword_100082CC0);
  if (v5)
  {
    int v15 = v5;
    goto LABEL_20;
  }

  char v6 = CFURLCreateData(kCFAllocatorDefault, v3, 0x8000100u, 0);
  if (v6)
  {
    CFMutableDataRef Mutable = v6;
    if (CFDataGetLength(v6) < 1)
    {
LABEL_30:
      CFRelease(Mutable);
      goto LABEL_19;
    }

    int v8 = *(sqlite3_stmt **)(v1 + 40);
    BytePtr = CFDataGetBytePtr(Mutable);
    unint64_t Length = CFDataGetLength(Mutable);
    if (Length >> 31)
    {
      CFRelease(Mutable);
      unsigned int v11 = 18;
      if (!v2) {
        goto LABEL_19;
      }
LABEL_9:
      if (!CFArrayGetCount(v2)) {
        goto LABEL_19;
      }
      CFMutableDataRef Mutable = CFDataCreateMutable(0LL, 0LL);
      *(void *)&__int128 v23 = _NSConcreteStackBlock;
      *((void *)&v23 + 1) = 0x40000000LL;
      uint64_t v24 = sub_10001C77C;
      uint64_t v25 = &unk_100076B68;
      CFMutableDataRef v26 = Mutable;
      v27.CFIndex length = CFArrayGetCount(v2);
      v27.CFIndex location = 0LL;
      CFArrayApplyFunction(v2, v27, (CFArrayApplierFunction)sub_10001C7E8, &v23);
      if (!Mutable) {
        goto LABEL_19;
      }
      if (CFDataGetLength(Mutable) >= 1)
      {
        if (!v11)
        {
          uint64_t v12 = *(sqlite3_stmt **)(v1 + 40);
          uint64_t v13 = CFDataGetBytePtr(Mutable);
          unint64_t v14 = CFDataGetLength(Mutable);
          if (!(v14 >> 31))
          {
            unsigned int v11 = sqlite3_bind_blob(v12, 3, v13, v14, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
            CFRelease(Mutable);
            if (!v11) {
              unsigned int v11 = sqlite3_step(*(sqlite3_stmt **)(v1 + 40));
            }
LABEL_16:
            int v15 = sub_10001C7FC(*(sqlite3_stmt **)(v1 + 40), v11);
            if (!v15) {
              goto LABEL_23;
            }
            goto LABEL_20;
          }

          unsigned int v11 = 18;
        }

        CFRelease(Mutable);
        goto LABEL_16;
      }

      goto LABEL_30;
    }

    unsigned int v11 = sqlite3_bind_blob(v8, 1, BytePtr, Length, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    CFRelease(Mutable);
    if (v11)
    {
      if (v2) {
        goto LABEL_9;
      }
    }

    else
    {
      unsigned int v11 = sqlite3_bind_double(*(sqlite3_stmt **)(v1 + 40), 2, v4);
      if (v2) {
        goto LABEL_9;
      }
    }
  }

uint64_t sub_10001C71C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 64)) {
    return 0LL;
  }
  unsigned int v3 = sqlite3_step(*(sqlite3_stmt **)(a1 + 24));
  if (v3 == 101)
  {
    unsigned int v3 = 0;
    *(_BYTE *)(a1 + 64) = 1;
  }

  LODWORD(result) = sqlite3_reset(*(sqlite3_stmt **)(a1 + 24));
  if ((_DWORD)result) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return result;
  }
  else {
    return v3;
  }
}

void sub_10001C77C(uint64_t a1, SecCertificateRef certificate)
{
  unsigned int v3 = SecCertificateCopyData(certificate);
  if (v3)
  {
    BOOL v4 = v3;
    int v5 = *(__CFData **)(a1 + 32);
    BytePtr = CFDataGetBytePtr(v3);
    CFIndex Length = CFDataGetLength(v4);
    CFDataAppendBytes(v5, BytePtr, Length);
    CFRelease(v4);
  }

uint64_t sub_10001C7E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_10001C7FC(sqlite3_stmt *a1, unsigned int a2)
{
  if ((a2 & 0xFFFFFFFE) == 0x64) {
    unsigned int v3 = 0;
  }
  else {
    unsigned int v3 = a2;
  }
  int v4 = sqlite3_reset(a1);
  if (v4) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 0;
  }
  if (v5) {
    unsigned int v3 = v4;
  }
  LODWORD(result) = sqlite3_clear_bindings(a1);
  if (v3) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (_DWORD)result == 0;
  }
  if (v7) {
    return v3;
  }
  else {
    return result;
  }
}

uint64_t sub_10001C848(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 64)) {
    return 0LL;
  }
  unsigned int v2 = sqlite3_step(*(sqlite3_stmt **)(a1 + 32));
  if (v2 == 101)
  {
    unsigned int v2 = 0;
    *(_BYTE *)(a1 + 64) = 0;
  }

  LODWORD(result) = sqlite3_reset(*(sqlite3_stmt **)(a1 + 32));
  if ((_DWORD)result) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return result;
  }
  else {
    return v2;
  }
}

void sub_10001C8A8(id a1, const char *a2)
{
  unsigned int v3 = (sqlite3 **)calloc(0x48uLL, 1uLL);
  if (!v3) {
    goto LABEL_39;
  }
  dispatch_queue_t v4 = dispatch_queue_create("caissuercache", 0LL);
  *unsigned int v3 = (sqlite3 *)v4;
  if (!v4)
  {
    int v6 = -108;
    goto LABEL_6;
  }

  BOOL v5 = v3 + 1;
  int v6 = sqlite3_open_v2(a2, v3 + 1, 4194310, 0LL);
  if (v6 != 14)
  {
LABEL_24:
    if (v6) {
      goto LABEL_6;
    }
    *((_BYTE *)v3 + 64) = 0;
    int v14 = sqlite3_prepare_v2(v3[1], "BEGIN EXCLUSIVE TRANSACTION", 28, v3 + 3, 0LL);
    if (!v14)
    {
      int v14 = sqlite3_prepare_v2(v3[1], "COMMIT TRANSACTION", 19, v3 + 4, 0LL);
      if (!v14)
      {
        int v6 = sqlite3_prepare_v2(v3[1], "DELETE FROM issuers", 20, v3 + 2, 0LL);
        if (v6 == 1)
        {
          int v14 = sub_10001C71C((uint64_t)v3);
          if (v14) {
            goto LABEL_47;
          }
          errmsg = 0LL;
          int v6 = sqlite3_exec( *v5,  "CREATE TABLE issuers(uri BLOB PRIMARY KEY,expires DOUBLE NOT NULL,certificate BLOB NOT NULL);CREATE IND"
                 "EX iexpires ON issuers(expires);",
                 0LL,
                 0LL,
                 &errmsg);
          if (errmsg)
          {
            int v15 = (os_log_s *)sub_10000856C("SecError");
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              __b[0] = 136315138;
              *(void *)&__b[1] = errmsg;
              _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "caissuer db CREATE TABLES: %s",  (uint8_t *)__b,  0xCu);
            }

            sqlite3_free(errmsg);
          }

          if (v6) {
            goto LABEL_6;
          }
          int v6 = sqlite3_prepare_v2(*v5, "DELETE FROM issuers", 20, v3 + 2, 0LL);
        }

        if (v6) {
          goto LABEL_6;
        }
        int v14 = sqlite3_prepare_v2( v3[1],  "INSERT OR REPLACE INTO issuers (uri,expires,certificate) VALUES (?,?,?)",  72,  v3 + 5,  0LL);
        if (!v14)
        {
          int v14 = sqlite3_prepare_v2(v3[1], "SELECT certificate FROM issuers WHERE uri=?", 44, v3 + 6, 0LL);
          if (!v14)
          {
            int v14 = sqlite3_prepare_v2( v3[1],  "SELECT certificate FROM issuers WHERE uri=? and expires>?",  58,  v3 + 7,  0LL);
            if (!v14) {
              goto LABEL_39;
            }
          }
        }
      }
    }

LABEL_47:
    int v6 = v14;
    goto LABEL_6;
  }

  size_t v7 = strlen(a2);
  if (v7 - 1025 >= 0xFFFFFFFFFFFFFC00LL)
  {
    size_t v9 = v7;
    memset(__b, 170, 0x400uLL);
    __memcpy_chk(__b, a2, v9, 1024LL);
    size_t v10 = v9 - 1;
    do
    {
      if (!v10) {
        goto LABEL_23;
      }
      size_t v11 = v10;
      int v12 = *((unsigned __int8 *)__b + v10--);
    }

    while (v12 != 47);
    *((_BYTE *)__b + v11) = 0;
    if (mkdir((const char *)__b, 0x1FFu))
    {
      int v13 = *__error();
      if (v13 > 19)
      {
        if (v13 <= 29)
        {
          if (v13 == 20) {
            goto LABEL_5;
          }
          if (v13 != 28) {
            goto LABEL_46;
          }
LABEL_43:
          int v6 = 13;
          goto LABEL_6;
        }

        if (v13 == 69) {
          goto LABEL_43;
        }
        if (v13 == 30)
        {
          int v6 = 8;
          goto LABEL_6;
        }

LABEL_46:
        int v6 = 2;
        goto LABEL_6;
      }

      if (v13 == 5)
      {
        int v6 = 10;
        goto LABEL_6;
      }

      if (v13 == 13)
      {
        int v6 = 3;
        goto LABEL_6;
      }

      if (v13 != 17) {
        goto LABEL_46;
      }
    }

LABEL_5:
  int v6 = 14;
LABEL_6:
  sub_10004ADB8(3LL, 0LL, v6);
  if (*v3) {
    dispatch_release((dispatch_object_t)*v3);
  }
  int v8 = v3[1];
  if (v8) {
    sqlite3_close(v8);
  }
  free(v3);
  unsigned int v3 = 0LL;
LABEL_39:
  qword_100082CC0 = (uint64_t)v3;
}

void sub_10001CC40(uint64_t a1)
{
  uint64_t v2 = qword_100082CC0;
  int v3 = *(unsigned __int8 *)(a1 + 48);
  dispatch_queue_t v4 = CFURLCreateData(kCFAllocatorDefault, *(CFURLRef *)(a1 + 40), 0x8000100u, 0);
  CFMutableDataRef Mutable = v4;
  if (!v4) {
    goto LABEL_24;
  }
  if (CFDataGetLength(v4) >= 1)
  {
    uint64_t v6 = 48LL;
    if (!v3) {
      uint64_t v6 = 56LL;
    }
    size_t v7 = *(sqlite3_stmt **)(v2 + v6);
    BytePtr = CFDataGetBytePtr(Mutable);
    unint64_t Length = CFDataGetLength(Mutable);
    if (Length >> 31) {
      unsigned int v10 = 18;
    }
    else {
      unsigned int v10 = sqlite3_bind_blob(v7, 1, BytePtr, Length, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    CFRelease(Mutable);
    if (v3)
    {
      if (v10)
      {
LABEL_10:
        if (v10 == 100)
        {
          size_t v11 = (char *)sqlite3_column_blob(v7, 0);
          int v12 = sqlite3_column_bytes(v7, 0);
          if (v11 && v12 != 0)
          {
            int v19 = v12;
            CFMutableDataRef Mutable = CFArrayCreateMutable(0LL, 0LL, &kCFTypeArrayCallBacks);
            if (v19 >= 1)
            {
              int v20 = &v11[v19];
              do
              {
                NSErrorUserInfoKey v21 = (const void *)SecCertificateCreateWithBytes(0LL);
                if (!v21) {
                  break;
                }
                id v22 = v21;
                CFArrayAppendValue(Mutable, v21);
                v11 += SecCertificateGetLength(v22);
                v19 -= SecCertificateGetLength(v22);
                CFRelease(v22);
              }

              while (v11 < v20);
            }

            if (CFArrayGetCount(Mutable) > 0 || !Mutable)
            {
LABEL_17:
              int v14 = sub_10001C7FC(v7, v10);
              if (!v14) {
                goto LABEL_24;
              }
              int v15 = v14;
              if (v14 == 101) {
                goto LABEL_22;
              }
              goto LABEL_19;
            }

            CFRelease(Mutable);
          }
        }

        CFMutableDataRef Mutable = 0LL;
        goto LABEL_17;
      }
    }

    else
    {
      double Current = CFAbsoluteTimeGetCurrent();
      unsigned int v10 = sqlite3_bind_double(v7, 2, Current);
      if (v10) {
        goto LABEL_10;
      }
    }

    unsigned int v10 = sqlite3_step(v7);
    goto LABEL_10;
  }

  CFRelease(Mutable);
  CFMutableDataRef Mutable = 0LL;
  int v15 = 7;
LABEL_19:
  uint64_t v16 = (os_log_s *)sub_10000856C("SecError");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int128 v17 = sqlite3_errmsg(*(sqlite3 **)(v2 + 8));
    int v23 = 136315138;
    uint64_t v24 = v17;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "caissuer cache lookup failed: %s",  (uint8_t *)&v23,  0xCu);
  }

  sub_10004ADB8(3LL, 3LL, v15);
LABEL_22:
  if (Mutable)
  {
    CFRelease(Mutable);
    CFMutableDataRef Mutable = 0LL;
  }

void sub_10001CF00(id a1)
{
  uint64_t v1 = qword_100082CC0;
  int v2 = sub_10001C71C(qword_100082CC0);
  if (v2) {
    goto LABEL_10;
  }
  int v3 = (os_log_s *)sub_10000856C("caissuercache");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v_Block_object_dispose((const void *)(v47 - 192), 8) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "clearing CAIssuer cache", (uint8_t *)&v8, 2u);
  }

  unsigned int v4 = sqlite3_step(*(sqlite3_stmt **)(v1 + 16));
  int v2 = sub_10001C7FC(*(sqlite3_stmt **)(v1 + 16), v4);
  if (v2)
  {
LABEL_10:
    int v5 = v2;
  }

  else
  {
    int v5 = sub_10001C848(v1);
    if (!v5) {
      return;
    }
  }

  uint64_t v6 = (os_log_s *)sub_10000856C("SecError");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    size_t v7 = sqlite3_errmsg(*(sqlite3 **)(v1 + 8));
    int v8 = 136315138;
    size_t v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "caissuer cache delete failed: %s",  (uint8_t *)&v8,  0xCu);
  }

  sub_10004ADB8(3LL, 2LL, v5);
}

void sub_10001D680( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, char a29)
{
}

uint64_t sub_10001D808(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
  return result;
}

void sub_10001D818(uint64_t a1)
{
}

uint64_t sub_10001D820(uint64_t a1)
{
  return ((uint64_t (*)(void, void))[*(id *)(a1 + 32) callback])( *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void sub_10001D85C(uint64_t a1)
{
  int v2 = (const __CFArray *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) URIs]);
  id v3 = sub_10001D8E0(0LL, v2, 1);

  ((void (*)(void, id))[*(id *)(a1 + 32) callback])( *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24),  v3);
  if (v3) {
    CFRelease(v3);
  }
}

id sub_10001D8E0(uint64_t a1, CFArrayRef theArray, char a3)
{
  id v3 = theArray;
  CFIndex Count = CFArrayGetCount(theArray);
  if (Count >= 1)
  {
    CFIndex v6 = Count;
    CFIndex v7 = 0LL;
    uint64_t v23 = a1;
    uint64_t v24 = v3;
    do
    {
      ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v3, v7);
      CFStringRef v9 = CFURLCopyScheme(ValueAtIndex);
      if (v9)
      {
        CFStringRef v10 = v9;
        if (CFEqual(@"http", v9))
        {
          if (qword_100082CB8 != -1) {
            dispatch_once(&qword_100082CB8, &stru_100076A60);
          }
          *(void *)&__int128 v26 = 0LL;
          *((void *)&v26 + 1) = &v26;
          __int128 v27 = 0x2000000000uLL;
          if (qword_100082CC0)
          {
            size_t v11 = *(dispatch_queue_s **)qword_100082CC0;
            block[0] = _NSConcreteStackBlock;
            block[1] = 0x40000000LL;
            block[2] = sub_10001CC40;
            block[3] = &unk_100076A88;
            void block[4] = &v26;
            void block[5] = ValueAtIndex;
            char v31 = a3;
            dispatch_sync(v11, block);
            id v12 = *(id *)(*((void *)&v26 + 1) + 24LL);
          }

          else
          {
            id v12 = 0LL;
          }

          _Block_object_dispose(&v26, 8);
          if (a1)
          {
            NormalizedIssuerContent = (const void *)SecCertificateGetNormalizedIssuerContent(a1);
            int v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
            __int128 v26 = 0u;
            __int128 v27 = 0u;
            __int128 v28 = 0u;
            __int128 v29 = 0u;
            id v15 = v12;
            id v16 = [v15 countByEnumeratingWithState:&v26 objects:block count:16];
            if (v16)
            {
              id v17 = v16;
              uint64_t v18 = *(void *)v27;
              do
              {
                for (CFIndex i = 0LL; i != v17; CFIndex i = (char *)i + 1)
                {
                  if (*(void *)v27 != v18) {
                    objc_enumerationMutation(v15);
                  }
                  uint64_t v20 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)i);
                  NormalizedSubjectContent = (const void *)SecCertificateGetNormalizedSubjectContent(v20);
                  if (NormalizedIssuerContent
                    && NormalizedSubjectContent
                    && CFEqual(NormalizedIssuerContent, NormalizedSubjectContent))
                  {
                    [v14 addObject:v20];
                  }
                }

                id v17 = [v15 countByEnumeratingWithState:&v26 objects:block count:16];
              }

              while (v17);
            }

            if ([v14 count]) {
              id v12 = v14;
            }
            else {
              id v12 = 0LL;
            }
            id v3 = v24;

            a1 = v23;
          }

          if (v12)
          {
            CFRelease(v10);
            return v12;
          }
        }

        CFRelease(v10);
      }

      ++v7;
    }

    while (v7 != v6);
  }

  return 0LL;
}

void sub_10001DB98(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___CAIssuerDelegate);
  int v2 = (void *)qword_100082CD0;
  qword_100082CD0 = (uint64_t)v1;

  id v3 = objc_alloc(&OBJC_CLASS___TrustURLSessionCache);
  unsigned int v4 = -[TrustURLSessionCache initWithDelegate:](v3, "initWithDelegate:", qword_100082CD0);
  int v5 = (void *)qword_100082CC8;
  qword_100082CC8 = (uint64_t)v4;
}

uint64_t sub_10001DBEC(uint64_t a1)
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_100076BF8);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_10001DC1C(void *a1)
{
  int v2 = (const void *)a1[2];
  if (v2)
  {
    a1[2] = 0LL;
    CFRelease(v2);
  }

  id v3 = (const void *)a1[3];
  if (v3)
  {
    a1[3] = 0LL;
    CFRelease(v3);
  }

  unsigned int v4 = (const void *)a1[4];
  if (v4)
  {
    a1[4] = 0LL;
    CFRelease(v4);
  }

uint64_t sub_10001DC70(uint64_t a1, uint64_t a2)
{
  uint64_t result = CFEqual(*(CFTypeRef *)(a1 + 16), *(CFTypeRef *)(a2 + 16));
  if ((_DWORD)result)
  {
    int v5 = *(const void **)(a1 + 24);
    if (!v5) {
      return 1LL;
    }
    CFIndex v6 = *(const void **)(a2 + 24);
    if (!v6) {
      return 1LL;
    }
    uint64_t result = CFEqual(v5, v6);
    if ((_DWORD)result) {
      return 1LL;
    }
  }

  return result;
}

CFHashCode sub_10001DCBC(uint64_t a1)
{
  CFHashCode v2 = CFHash(*(CFTypeRef *)(a1 + 16));
  id v3 = *(const void **)(a1 + 24);
  if (v3) {
    v2 += CFHash(v3);
  }
  return v2;
}

CFStringRef sub_10001DCF8(uint64_t a1)
{
  return CFCopyDescription(*(CFTypeRef *)(a1 + 16));
}

CFStringRef sub_10001DD00(uint64_t a1)
{
  return CFCopyDescription(*(CFTypeRef *)(a1 + 16));
}

uint64_t sub_10001DD24()
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_10001DDA0;
  block[3] = &unk_100076CD8;
  void block[4] = &qword_100082CF8;
  if (qword_100082CF0 != -1) {
    dispatch_once(&qword_100082CF0, block);
  }
  return qword_100082CF8;
}

uint64_t sub_10001DDA0(uint64_t a1)
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_100076C78);
  **(void **)(a1 + 32) = result;
  return result;
}

void sub_10001DDD0(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    sub_10001BC98((void **)(a1 + 56));
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 1)
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = a1 + 136;
    do
    {
      int v5 = *(const void **)(v4 + 8 * v3);
      if (v5)
      {
        *(void *)(v4 + 8 * v3) = 0LL;
        CFRelease(v5);
        uint64_t v2 = *(void *)(a1 + 16);
      }

      ++v3;
    }

    while (v3 < v2);
  }

uint64_t sub_10001DE3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 != *(void *)(a2 + 16)) {
    return 0LL;
  }
  if (v2 < 1) {
    return 1LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = a2 + 136;
  uint64_t v6 = a1 + 136;
  while (1)
  {
    uint64_t result = CFEqual(*(CFTypeRef *)(v6 + 8 * v4), *(CFTypeRef *)(v5 + 8 * v4));
    if (!(_DWORD)result) {
      break;
    }
    if (++v4 >= *(void *)(a1 + 16)) {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_10001DEB0(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  uint64_t v4 = a1 + 136;
  do
    v3 += CFHash(*(CFTypeRef *)(v4 + 8 * v2++));
  while (v2 < *(void *)(a1 + 16));
  return v3;
}

__CFString *sub_10001DF14(void *a1)
{
  CFMutableDataRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
  CFTypeID v3 = CFGetTypeID(a1);
  CFStringRef v4 = CFCopyTypeIDDescription(v3);
  CFStringAppendFormat(Mutable, 0LL, @"<%@ certs: ", v4);
  CFRelease(v4);
  if ((uint64_t)a1[2] >= 1)
  {
    uint64_t v5 = 0LL;
    do
    {
      if (v5) {
        CFStringAppend(Mutable, @", ");
      }
      uint64_t v6 = CFCopyDescription((CFTypeRef)a1[v5 + 17]);
      CFStringAppend(Mutable, v6);
      CFRelease(v6);
      ++v5;
    }

    while (v5 < a1[2]);
  }

  CFStringAppend(Mutable, @" >");
  return Mutable;
}

__CFString *sub_10001E000(void *a1)
{
  return sub_10001DF14(a1);
}

void sub_10001E024(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 80);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 88);
    if (v3 >= 1)
    {
      uint64_t v4 = 0LL;
      do
      {
        sub_1000486F4(*(void *)(a1 + 80) + v4);
        v4 += 40LL;
        --v3;
      }

      while (v3);
      uint64_t v2 = *(void **)(a1 + 80);
    }

    free(v2);
    *(void *)(a1 + 8syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
  }

uint64_t sub_10001E084(uint64_t a1, const void *a2, const void *a3)
{
  if (a1)
  {
    uint64_t v6 = *(void *)(a1 + 16) + 1LL;
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    BOOL v9 = *(_BYTE *)(a1 + 48) != 0;
  }

  else
  {
    uint64_t v7 = 0LL;
    BOOL v9 = 0;
    uint64_t v8 = -1LL;
    uint64_t v6 = 1LL;
  }

  uint64_t v10 = sub_10001DD24();
  uint64_t Instance = _CFRuntimeCreateInstance(kCFAllocatorDefault, v10, 8 * v6 + 120, 0LL);
  uint64_t v12 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 24) = 0u;
    *(_OWORD *)(Instance + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0u;
    *(_OWORD *)(Instance + 12syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0u;
    *(_OWORD *)(Instance + 104) = 0u;
    *(_OWORD *)(Instance + 8_Block_object_dispose((const void *)(v47 - 192), 8) = 0u;
    *(_OWORD *)(Instance + 72) = 0u;
    *(_OWORD *)(Instance + 56) = 0u;
    *(void *)(Instance + 16) = v6;
    *(void *)(Instance + 32) = v7;
    *(void *)(Instance + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v8;
    uint64_t v13 = v6 - 1;
    *(_BYTE *)(Instance + 4_Block_object_dispose((const void *)(v47 - 192), 8) = v9;
    if (v6 >= 2)
    {
      int v14 = (void *)(Instance + 136);
      id v15 = (const void **)(a1 + 136);
      uint64_t v16 = v6 - 1;
      do
      {
        id v17 = *v15++;
        *v14++ = v17;
        CFRetain(v17);
        --v16;
      }

      while (v16);
    }

    if (!a2) {
      goto LABEL_53;
    }
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 0x40000000LL;
    unint64_t v46[2] = sub_10001DBEC;
    v46[3] = &unk_100076C58;
    v46[4] = &qword_100082CE8;
    if (qword_100082CE0 != -1) {
      dispatch_once(&qword_100082CE0, v46);
    }
    uint64_t v18 = _CFRuntimeCreateInstance(kCFAllocatorDefault, qword_100082CE8, 32LL, 0LL);
    if (!v18) {
      goto LABEL_54;
    }
    CFRetain(a2);
    *(void *)(v18 + 16) = a2;
    *(_BYTE *)(v18 + 41) = SecCertificateIsWeakHash(a2);
    uint64_t CertificatePolicies = SecCertificateGetCertificatePolicies(a2);
    if (!CertificatePolicies) {
      goto LABEL_45;
    }
    uint64_t v20 = CertificatePolicies;
    if (!*(void *)(CertificatePolicies + 8)) {
      goto LABEL_45;
    }
    uint64_t v21 = 0LL;
    char v22 = 0;
    unsigned int v23 = 1;
    do
    {
      v22 |= sub_1000321A0(*(void *)(v20 + 16) + 32 * v21) != 0LL;
      uint64_t v21 = v23;
    }

    while (*(void *)(v20 + 8) > (unint64_t)v23++);
    if ((v22 & 1) == 0) {
      goto LABEL_45;
    }
    uint64_t BasicConstraints = SecCertificateGetBasicConstraints(a2);
    if (BasicConstraints && *(_BYTE *)(BasicConstraints + 2))
    {
      uint64_t v39 = (os_log_s *)sub_10000856C("ev");
      char v36 = 0;
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      LOWORD(v46[0]) = 0;
      uint64_t v40 = "Leaf has invalid basic constraints";
      id v41 = v39;
      uint32_t v42 = 2;
    }

    else
    {
      int KeyUsage = SecCertificateGetKeyUsage(a2);
      if ((KeyUsage & 0x60) == 0)
      {
        v46[0] = 256LL;
        CFNumberRef v27 = CFNumberCreate(0LL, kCFNumberCFIndexType, v46);
        if (v27)
        {
          CFNumberRef v28 = v27;
          CFMutableDataRef Mutable = CFDictionaryCreateMutable( 0LL,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            uint64_t v30 = Mutable;
            CFDictionaryAddValue(Mutable, kSecAttrKeyTypeEC, v28);
            if (SecCertificateNotValidBefore(a2) >= 410227200.0)
            {
              v46[0] = 2048LL;
              CFNumberRef v35 = CFNumberCreate(0LL, kCFNumberCFIndexType, v46);
              if (v35)
              {
                CFNumberRef v32 = v35;
                CFDictionaryAddValue(v30, kSecAttrKeyTypeRSA, v35);
                if ((SecCertificateIsAtLeastMinKeySize(a2, v30) & 1) == 0)
                {
                  uint64_t v33 = (os_log_s *)sub_10000856C("ev");
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v46[0]) = 0;
                    unsigned int v34 = "Leaf's public key is too small for issuance after 2013";
                    goto LABEL_50;
                  }

LABEL_51:
                  char v36 = 0;
                  goto LABEL_32;
                }

LABEL_29:
                if (SecCertificateNotValidBefore(a2) <= 473299200.0
                  || SecCertificateGetSignatureHashAlgorithm(a2) > 4)
                {
                  char v36 = 1;
LABEL_32:
                  CFRelease(v32);
LABEL_33:
                  CFRelease(v28);
                  CFRelease(v30);
LABEL_34:
                  *(_BYTE *)(v18 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = v36;
                  if (a3)
                  {
                    CFRetain(a3);
                    *(void *)(v18 + 24) = a3;
LABEL_54:
                    *(void *)(v12 + 8 * v13 + 136) = v18;
                    return v12;
                  }

                  CFArrayRef v37 = CFArrayCreate(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeArrayCallBacks);
                  if (v37)
                  {
                    CFArrayRef v38 = v37;
                    CFRetain(v37);
                    *(void *)(v18 + 24) = v38;
                    CFRelease(v38);
                    goto LABEL_54;
                  }

                  CFRelease((CFTypeRef)v18);
LABEL_53:
                  uint64_t v18 = 0LL;
                  goto LABEL_54;
                }

                uint64_t v33 = (os_log_s *)sub_10000856C("ev");
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  LOWORD(v46[0]) = 0;
                  unsigned int v34 = "Leaf was issued with SHA-1 after 2015";
                  goto LABEL_50;
                }

                goto LABEL_51;
              }
            }

            else
            {
              v46[0] = 1024LL;
              CFNumberRef v31 = CFNumberCreate(0LL, kCFNumberCFIndexType, v46);
              if (v31)
              {
                CFNumberRef v32 = v31;
                CFDictionaryAddValue(v30, kSecAttrKeyTypeRSA, v31);
                if ((SecCertificateIsAtLeastMinKeySize(a2, v30) & 1) == 0)
                {
                  uint64_t v33 = (os_log_s *)sub_10000856C("ev");
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(v46[0]) = 0;
                    unsigned int v34 = "Leaf's public key is too small for issuance before 2014";
LABEL_50:
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, v34, (uint8_t *)v46, 2u);
                    goto LABEL_51;
                  }

                  goto LABEL_51;
                }

                goto LABEL_29;
              }
            }

            char v36 = 0;
            goto LABEL_33;
          }

          CFRelease(v28);
        }

CFMutableArrayRef sub_10001E5E0(uint64_t a1)
{
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0LL, *(void *)(a1 + 16), &kCFTypeArrayCallBacks);
  CFMutableArrayRef v3 = Mutable;
  if (Mutable)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 0x40000000LL;
    v5[2] = sub_10001E660;
    void v5[3] = &unk_100076CF8;
    void v5[4] = Mutable;
    sub_10001E668(a1, (uint64_t)v5);
  }

  return v3;
}

void sub_10001E660(uint64_t a1, const void *a2)
{
}

uint64_t sub_10001E668(uint64_t result, uint64_t a2)
{
  char v8 = 0;
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = v2 - 1;
  if (v2 >= 1)
  {
    uint64_t v5 = (uint64_t *)(result + 136);
    do
    {
      uint64_t v6 = *v5++;
      uint64_t result = (*(uint64_t (**)(uint64_t, void, char *))(a2 + 16))(a2, *(void *)(v6 + 16), &v8);
      if (v8) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v3 == 0;
      }
      --v3;
    }

    while (!v7);
  }

  return result;
}

uint64_t sub_10001E6D4(uint64_t result)
{
  *(_BYTE *)(result + 49) = 1;
  if (!*(_BYTE *)(result + 48))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 16);
    if (v2 >= 1)
    {
      uint64_t v3 = *(void *)(result + 8 * v2 + 128);
      char v5 = 0;
      uint64_t result = SecCertificateIsSelfSigned(*(void *)(v3 + 16), &v5);
      if ((_DWORD)result) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = v5 == 0;
      }
      if (!v4)
      {
        *(_BYTE *)(v1 + 4_Block_object_dispose((const void *)(v47 - 192), 8) = 1;
        if (*(void *)(v1 + 40) == -1LL) {
          *(void *)(v1 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = *(void *)(v1 + 16) - 1LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_10001E760(uint64_t a1, CFTypeRef cf2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2 < 1) {
    return -1LL;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = a1 + 136;
  while (!CFEqual(*(CFTypeRef *)(*(void *)(v5 + 8 * v4) + 16LL), cf2))
  {
    if (v2 == ++v4) {
      return -1LL;
    }
  }

  return v4;
}

void sub_10001E7C0(uint64_t a1, const __CFArray *cf)
{
  if (cf)
  {
    CFArrayRef v3 = cf;
    CFArrayRef v4 = 0LL;
  }

  else
  {
    CFArrayRef v4 = CFArrayCreate(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeArrayCallBacks);
    CFArrayRef v3 = v4;
    if (!v4) {
      return;
    }
  }

  uint64_t v5 = *(void *)(a1 + 136);
  CFRetain(v3);
  *(void *)(v5 + 24) = v3;
  if (v4) {
    CFRelease(v4);
  }
}

uint64_t sub_10001E844(uint64_t a1, uint64_t a2)
{
  uint64_t result = SecCertificateIsValid(a2, *(double *)(a1 + 40));
  if ((result & 1) == 0) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
  }
  return result;
}

void sub_10001E87C(uint64_t a1, uint64_t a2)
{
  CFAbsoluteTime v3 = SecCertificateNotValidBefore(a2);
  CFDateRef v4 = CFDateCreate(0LL, v3);
  if (v4)
  {
    CFDateRef v5 = v4;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
    CFRelease(v5);
  }

void sub_10001E8CC(uint64_t a1, uint64_t a2)
{
  CFAbsoluteTime v3 = SecCertificateNotValidAfter(a2);
  CFDateRef v4 = CFDateCreate(0LL, v3);
  if (v4)
  {
    CFDateRef v5 = v4;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v4);
    CFRelease(v5);
  }

uint64_t sub_10001E91C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 68)) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 16) - *(char *)(a1 + 49);
  if (v2 < 1)
  {
LABEL_7:
    uint64_t v1 = 0LL;
    *(_BYTE *)(a1 + 6_Block_object_dispose((const void *)(v47 - 192), 8) = 1;
  }

  else
  {
    uint64_t v3 = a1 + 136;
    while (!*(_BYTE *)(*(void *)v3 + 41LL))
    {
      v3 += 8LL;
      if (!--v2) {
        goto LABEL_7;
      }
    }

    return 1LL;
  }

  return v1;
}

uint64_t sub_10001E978(uint64_t a1)
{
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x2000000000LL;
  uint64_t v17 = 0LL;
  uint64_t v10 = 0LL;
  size_t v11 = &v10;
  uint64_t v12 = 0x2000000000LL;
  char v13 = 0;
  uint64_t valuePtr = 2048LL;
  CFNumberRef v2 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
  if (v2)
  {
    uint64_t valuePtr = 224LL;
    CFNumberRef v3 = CFNumberCreate(0LL, kCFNumberCFIndexType, &valuePtr);
    CFNumberRef v4 = v3;
    if (v3)
    {
      keys[0] = (void *)kSecAttrKeyTypeRSA;
      keys[1] = (void *)kSecAttrKeyTypeEC;
      values[0] = v2;
      values[1] = v3;
      CFDictionaryRef v5 = CFDictionaryCreate( 0LL,  (const void **)keys,  (const void **)values,  2LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      v15[3] = (uint64_t)v5;
      if (v5)
      {
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 0x40000000LL;
        void v9[2] = sub_10001EB20;
        v9[3] = &unk_100076D88;
        void v9[4] = &v14;
        v9[5] = &v10;
        sub_10001E668(a1, (uint64_t)v9);
      }
    }
  }

  else
  {
    CFNumberRef v4 = 0LL;
  }

  uint64_t v6 = (const void *)v15[3];
  if (v6) {
    CFRelease(v6);
  }
  if (v2) {
    CFRelease(v2);
  }
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v7 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

uint64_t sub_10001EB20(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result = SecCertificateIsAtLeastMinKeySize(a2, *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a3 = 1;
  }

  return result;
}

uint64_t sub_10001EB70(uint64_t a1, double a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  uint64_t v4 = -100000LL;
  if (*(void *)(a1 + 32) == v3 - 1) {
    uint64_t v4 = 0LL;
  }
  if (*(_BYTE *)(a1 + 49)) {
    v4 += 10000LL;
  }
  if (*(_BYTE *)(a1 + 48) && *(void *)(a1 + 40) == v3 - 1) {
    uint64_t v5 = v4 - v3 + 1000;
  }
  else {
    uint64_t v5 = v4 + v3;
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2000000000LL;
  char v12 = 1;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 0x40000000LL;
  _OWORD v8[2] = sub_10001E844;
  unint64_t v8[3] = &unk_100076D20;
  *(double *)&v8[5] = a2;
  v8[4] = &v9;
  sub_10001E668(a1, (uint64_t)v8);
  int v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  if (v6) {
    v5 += 100LL;
  }
  else {
    return v5 + 10;
  }
}

double sub_10001EC94(void *a1)
{
  uint64_t v1 = a1[2];
  double v2 = 0.0;
  if (v1 >= 2 && a1[10] && (uint64_t)a1[11] >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t v6 = v1 - 1;
    double v7 = 0.0;
    do
    {
      uint64_t v8 = a1[10];
      double v2 = 0.0;
      if (v8 && (v9 = *(void *)(v8 + v4 + 16)) != 0 && (double v2 = *(double *)(v9 + 72), v2 != 0.0))
      {
        if (v2 < v7 || v7 == 0.0) {
          double v7 = *(double *)(v9 + 72);
        }
      }

      else
      {
        if (!v5) {
          return v2;
        }
        uint64_t v10 = *(void *)(v8 + v4 + 8);
        if (v10 < 0 || a1[2] <= v10 || (uint64_t v11 = a1[v10 + 17]) == 0) {
          uint64_t v12 = 0LL;
        }
        else {
          uint64_t v12 = *(void *)(v11 + 16);
        }
        OCSPResponders = (const __CFArray *)SecCertificateGetOCSPResponders(v12);
        if (OCSPResponders)
        {
          if (CFArrayGetCount(OCSPResponders) && v6 != v5) {
            return v2;
          }
        }
      }

      ++v5;
      v4 += 40LL;
      double v2 = v7;
    }

    while (v5 < a1[11]);
  }

  return v2;
}

BOOL sub_10001ED9C(uint64_t *a1)
{
  if (a1[2] < 2) {
    return 0LL;
  }
  uint64_t v1 = a1[10];
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = a1[11];
  if (v2 < 2) {
    return 1LL;
  }
  uint64_t v3 = v2 - 1;
  uint64_t v4 = (unsigned __int8 *)(v1 + 33);
  while (1)
  {
    int v5 = *v4;
    v4 += 40;
    BOOL result = v5 != 0;
    if (!v5) {
      break;
    }
    if (!--v3) {
      return 1LL;
    }
  }

  return result;
}

void sub_10001EDEC(uint64_t a1, CFDictionaryRef theDict)
{
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    char v3 = 1;
  }

  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    Value = CFDictionaryGetValue(theDict, kSecCARevocationSPKIHashKey);
    if (Value && v4 && *(uint64_t *)(v4 + 16) >= 2)
    {
      uint64_t v6 = Value;
      char v3 = 0;
      uint64_t v7 = 18LL;
      do
      {
        uint64_t v8 = *(void *)(v4 + 8 * v7);
        if (v8) {
          uint64_t v9 = *(void *)(v8 + 16);
        }
        else {
          uint64_t v9 = 0LL;
        }
        uint64_t v10 = (const void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v9);
        if (v10)
        {
          uint64_t v11 = v10;
          int v12 = CFEqual(v6, v10);
          CFRelease(v11);
          if (v12)
          {
            if (v7 - 17 > *(void *)(v4 + 72)) {
              *(void *)(v4 + 72) = v7 - 17;
            }
            char v3 = 1;
          }
        }

        uint64_t v13 = v7 - 16;
        ++v7;
      }

      while (v13 < *(void *)(v4 + 16));
    }

    else
    {
      char v3 = 0;
    }
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3 & 1;
}

uint64_t sub_10001EEF4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

BOOL sub_10001EF08(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && (a2 & 0x8000000000000000LL) == 0)
  {
    if (*(void *)(a1 + 16) > a2 && (uint64_t v3 = *(void *)(a1 + 8 * a2 + 136)) != 0) {
      uint64_t v2 = *(__SecCertificate **)(v3 + 16);
    }
    else {
      uint64_t v2 = 0LL;
    }
  }

  CFDataRef v4 = SecCertificateCopyNormalizedIssuerSequence(v2);
  CFDataRef v5 = SecCertificateCopyNormalizedSubjectSequence(v2);
  CFDataRef v6 = v5;
  if (v4 && v5)
  {
    BOOL v7 = CFEqual(v4, v5) != 0;
  }

  else
  {
    BOOL v7 = 0LL;
    BOOL v8 = 0LL;
    if (!v4) {
      goto LABEL_12;
    }
  }

  CFRelease(v4);
  BOOL v8 = v7;
LABEL_12:
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

uint64_t sub_10001EFB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    return 0LL;
  }
  while (!DEROidCompare(v2, a2))
  {
    uint64_t v2 = *(void *)(v2 + 16);
    if (!v2) {
      return 0LL;
    }
  }

  sub_10001BE60(a1, (_OWORD *)a2, *(void *)(a2 + 16));
  return 1LL;
}

BOOL sub_10001F01C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = DEROidCompare(a1, (uint64_t)&oidAnyPolicy);
  if (v4) {
    sub_10001BE60(a1, (_OWORD *)a2, *(void *)(a2 + 16));
  }
  return v4;
}

uint64_t sub_10001F06C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    char v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(a1 + 32);
      if (v6)
      {
        while (!DEROidCompare(v6, v2))
        {
          uint64_t v6 = *(void *)(v6 + 40);
          if (!v6) {
            goto LABEL_6;
          }
        }
      }

      else
      {
LABEL_6:
        sub_10001BE60(a1, (_OWORD *)v2, a2);
        char v5 = 1;
      }

      uint64_t v2 = *(void *)(v2 + 16);
    }

    while (v2);
  }

  else
  {
    char v5 = 0;
  }

  return v5 & 1;
}

uint64_t sub_10001F0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  if (!v4) {
    return 0LL;
  }
  char v5 = 0LL;
  uint64_t v6 = 16LL;
  do
  {
    uint64_t v7 = *(void *)(a2 + 16);
    if (DEROidCompare(a1, v7 + v6 - 16))
    {
      BOOL v8 = malloc(0x18uLL);
      *(_OWORD *)BOOL v8 = *(_OWORD *)(v7 + v6);
      _OWORD v8[2] = v5;
      char v5 = v8;
    }

    v6 += 32LL;
    --v4;
  }

  while (v4);
  if (!v5) {
    return 0LL;
  }
  uint64_t v9 = *(void **)(a1 + 24);
  if (v9)
  {
    do
    {
      uint64_t v10 = (void *)v9[2];
      free(v9);
      uint64_t v9 = v10;
    }

    while (v10);
  }

  *(void *)(a1 + 24) = v5;
  return 1LL;
}

CFMutableDictionaryRef sub_10001F1A8(uint64_t a1, uint64_t a2)
{
  CFMutableDictionaryRef result = (CFMutableDictionaryRef)DEROidCompare(a1, (uint64_t)&oidAnyPolicy);
  if (!(_DWORD)result) {
    return result;
  }
  uint64_t v5 = *(void *)(a2 + 8);
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0LL, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!result) {
    return result;
  }
  uint64_t v6 = result;
  if (!v5)
  {
LABEL_17:
    context[0] = _NSConcreteStackBlock;
    context[1] = 0x40000000LL;
    context[2] = sub_10001F424;
    void context[3] = &unk_100076DF8;
    context[4] = a1;
    CFDictionaryApplyFunction(v6, (CFDictionaryApplierFunction)sub_10001F538, context);
    CFRelease(v6);
    return (CFMutableDictionaryRef)1;
  }

  uint64_t v7 = 0LL;
  while (1)
  {
    uint64_t v8 = *(void *)(a2 + 16) + v7;
    CFIndex v9 = *(void *)(v8 + 8);
    if (v9 < 0) {
      goto LABEL_12;
    }
    CFIndex v10 = *(void *)(v8 + 24);
    if (v10 < 0) {
      goto LABEL_12;
    }
    uint64_t v11 = *(const UInt8 **)(v8 + 16);
    CFDataRef v12 = CFDataCreateWithBytesNoCopy(0LL, *(const UInt8 **)v8, v9, kCFAllocatorNull);
    CFDataRef v13 = CFDataCreateWithBytesNoCopy(0LL, v11, v10, kCFAllocatorNull);
    Value = (__CFArray *)CFDictionaryGetValue(v6, v12);
    if (Value)
    {
      CFArrayAppendValue(Value, v13);
      if (!v12) {
        goto LABEL_10;
      }
LABEL_9:
      CFRelease(v12);
      goto LABEL_10;
    }

    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    if (!Mutable) {
      break;
    }
    uint64_t v16 = Mutable;
    CFArrayAppendValue(Mutable, v13);
    CFDictionarySetValue(v6, v12, v16);
    CFRelease(v16);
    if (v12) {
      goto LABEL_9;
    }
LABEL_10:
    if (v13) {
      CFRelease(v13);
    }
LABEL_12:
    v7 += 32LL;
    if (!--v5) {
      goto LABEL_17;
    }
  }

  CFRelease(v6);
  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    CFRelease(v13);
  }
  return 0LL;
}

BOOL sub_10001F38C(uint64_t a1, uint64_t a2)
{
  BOOL v4 = DEROidCompare(a1, (uint64_t)&oidAnyPolicy);
  if (!v4)
  {
    uint64_t v5 = *(void *)(a2 + 8);
    if (v5)
    {
      for (uint64_t i = 0LL; !DEROidCompare(a1, *(void *)(a2 + 16) + i); i += 32LL)
      {
        if (!--v5) {
          return !v4;
        }
      }

      if (*(void *)(a1 + 32)) {
        sub_10001BC98((void **)(a1 + 32));
      }
      *(void *)(*(void *)(a1 + 48) + 32LL) = *(void *)(a1 + 40);
      sub_10001BCF0((void *)a1);
    }
  }

  return !v4;
}

void sub_10001F424(uint64_t a1, CFDataRef theData, const __CFArray *a3)
{
  if ((CFDataGetLength(theData) & 0x8000000000000000LL) == 0)
  {
    BytePtr = CFDataGetBytePtr(theData);
    CFIndex Length = CFDataGetLength(theData);
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 16LL);
    uint64_t v14 = 0LL;
    id v15 = &v14;
    uint64_t v16 = 0x2000000000LL;
    uint64_t v17 = 0LL;
    context[0] = _NSConcreteStackBlock;
    context[1] = 0x40000000LL;
    context[2] = sub_10001F550;
    void context[3] = &unk_100076DD8;
    context[4] = &v14;
    v18.CFIndex length = CFArrayGetCount(a3);
    v18.CFIndex location = 0LL;
    CFArrayApplyFunction(a3, v18, (CFArrayApplierFunction)sub_10001EEF4, context);
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = v15[3];
    uint64_t v11 = *(void *)(v9 + 48);
    CFDataRef v12 = malloc(0x38uLL);
    unint64_t v12[3] = v10;
    v12[4] = 0LL;
    *CFDataRef v12 = BytePtr;
    v12[1] = Length;
    _DWORD v12[2] = v8;
    v12[6] = v11;
    v12[5] = *(void *)(v11 + 32);
    *(void *)(v11 + 32) = v12;
    _Block_object_dispose(&v14, 8);
  }

uint64_t sub_10001F538(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

CFIndex sub_10001F550(uint64_t a1, CFDataRef theData)
{
  CFIndex result = CFDataGetLength(theData);
  if ((result & 0x8000000000000000LL) == 0)
  {
    uint64_t v5 = malloc(0x18uLL);
    *uint64_t v5 = CFDataGetBytePtr(theData);
    CFIndex result = CFDataGetLength(theData);
    v5[1] = result;
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
    v5[2] = *(void *)(v6 + 24);
    *(void *)(v6 + 24) = v5;
  }

  return result;
}

uint64_t sub_10001F5BC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, __CFArray *))
{
  NormalizedIssuerContent = (const __CFData *)SecCertificateGetNormalizedIssuerContent(a2);
  uint64_t v7 = sub_10001F9A8(NormalizedIssuerContent);
  if (v7 && (uint64_t v8 = sub_10001FAB4(v7)) != 0LL)
  {
    uint64_t v9 = v8;
    CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFIndex Count = CFArrayGetCount(v9);
    if (Count >= 1)
    {
      CFIndex v12 = Count;
      for (CFIndex i = 0LL; i != v12; ++i)
      {
        ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v9, i);
        if (ValueAtIndex)
        {
          SecCertificateRef v15 = SecCertificateCreateWithData(kCFAllocatorDefault, ValueAtIndex);
          if (v15)
          {
            SecCertificateRef v16 = v15;
            CFArrayAppendValue(Mutable, v15);
            CFRelease(v16);
          }
        }
      }
    }

    CFRelease(v9);
    a4(a3, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    a4(a3, 0LL);
  }

  return 1LL;
}

__CFArray *sub_10001F6C4()
{
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!Mutable) {
    return 0LL;
  }
  CFMutableDictionaryRef v1 = Mutable;
  CFMutableDictionaryRef v2 = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (!v2)
  {
    CFRelease(v1);
    return 0LL;
  }

  uint64_t v3 = v2;
  CFMutableDictionaryRef v4 = CFDictionaryCreateMutable(0LL, 1LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (v4)
  {
    uint64_t v5 = v4;
    int valuePtr = 1;
    CFNumberRef v6 = CFNumberCreate(0LL, kCFNumberSInt32Type, &valuePtr);
    if (v6)
    {
      CFNumberRef v7 = v6;
      CFDictionaryAddValue(v5, @"kSecTrustSettingsResult", v6);
      CFDictionaryAddValue(v1, kSecPolicyCheckSystemTrustedWeakHash, kCFBooleanTrue);
      CFDictionaryAddValue(v1, kSecPolicyCheckSystemTrustedWeakKey, kCFBooleanTrue);
      CFDictionaryAddValue(v3, @"kSecTrustSettingsPolicyOptions", v1);
      uint64_t v8 = CFArrayCreateMutable(0LL, 2LL, &kCFTypeArrayCallBacks);
      uint64_t v9 = v8;
      if (v8)
      {
        CFArrayAppendValue(v8, v3);
        CFArrayAppendValue(v9, v5);
      }

      CFRelease(v1);
    }

    else
    {
      uint64_t v9 = 0LL;
      CFNumberRef v7 = v1;
    }

    CFRelease(v7);
    CFRelease(v5);
  }

  else
  {
    CFRelease(v1);
    uint64_t v9 = 0LL;
  }

  CFRelease(v3);
  return v9;
}

BOOL sub_10001F868(uint64_t a1, uint64_t a2)
{
  NormalizedSubjectContent = (const __CFData *)SecCertificateGetNormalizedSubjectContent(a2);
  uint64_t v4 = sub_100011A14();
  if (v4)
  {
    uint64_t v5 = (const void *)v4;
    CFNumberRef v6 = sub_10001F9A8(NormalizedSubjectContent);
    if (v6 && (CFNumberRef v7 = sub_10001FAB4(v6)) != 0LL)
    {
      uint64_t v8 = v7;
      int64_t Length = SecCertificateGetLength(a2);
      BytePtr = (const void *)SecCertificateGetBytePtr(a2);
      CFIndex Count = CFArrayGetCount(v8);
      if (Count < 1)
      {
        BOOL v14 = 0;
      }

      else
      {
        CFIndex v12 = Count;
        CFIndex v13 = 0LL;
        BOOL v14 = 1;
        do
        {
          ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(v8, v13);
          if (ValueAtIndex)
          {
            SecCertificateRef v16 = ValueAtIndex;
            CFTypeID v17 = CFGetTypeID(ValueAtIndex);
            if (v17 == CFDataGetTypeID())
            {
              CFIndex v18 = CFDataGetLength(v16);
              int v19 = CFDataGetBytePtr(v16);
              if (Length >= 1 && v18 == Length && !memcmp(BytePtr, v19, Length)) {
                break;
              }
            }
          }

          BOOL v14 = ++v13 < v12;
        }

        while (v12 != v13);
      }

      CFRelease(v8);
    }

    else
    {
      BOOL v14 = 0;
    }

    CFRelease(v5);
  }

  else
  {
    return 0;
  }

  return v14;
}

CFDataRef sub_10001F9A8(const __CFData *a1)
{
  Value = a1;
  if (!a1) {
    return Value;
  }
  CFMutableDictionaryRef v2 = (CFTypeRef *)sub_100011A14();
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = (const __CFDictionary *)v2[9];
  if (!v4)
  {
    CFRelease(v2);
    return 0LL;
  }

  CFRetain(v2[9]);
  CFRelease(v3);
  v9[0] = 0LL;
  v9[1] = 0LL;
  int v10 = 0;
  BytePtr = CFDataGetBytePtr(Value);
  CC_LONG Length = CFDataGetLength(Value);
  CC_SHA1(BytePtr, Length, (unsigned __int8 *)v9);
  CFDataRef v7 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, (const UInt8 *)v9, 20LL, kCFAllocatorNull);
  Value = (const __CFData *)CFDictionaryGetValue(v4, v7);
  CFRelease(v4);
  if (v7) {
    CFRelease(v7);
  }
  return Value;
}

__CFArray *sub_10001FAB4(const __CFArray *a1)
{
  CFMutableDictionaryRef v2 = (void *)sub_100011A14();
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = v2;
  uint64_t v4 = v2[10];
  if (!v4)
  {
    CFRelease(v2);
    return 0LL;
  }

  CFIndex Count = CFArrayGetCount(a1);
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  if (Count >= 1)
  {
    for (CFIndex i = 0LL; i != Count; ++i)
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, i);
      unsigned int valuePtr = 0;
      if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr))
      {
        CFDataRef v9 = CFDataCreateWithBytesNoCopy( kCFAllocatorDefault,  (const UInt8 *)(v4 + valuePtr + 8),  *(int *)(v4 + valuePtr + 4),  kCFAllocatorNull);
        if (v9)
        {
          CFDataRef v10 = v9;
          CFArrayAppendValue(Mutable, v9);
          CFRelease(v10);
        }
      }
    }
  }

  CFRelease(v3);
  return Mutable;
}

uint64_t sub_10001FBD4(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, const void *))
{
  uint64_t v7 = SecTrustStoreForDomain(2LL);
  uint64_t v26 = 0LL;
  CFNumberRef v27 = &v26;
  uint64_t v28 = 0x2000000000LL;
  uint64_t v29 = 0LL;
  uint64_t v22 = 0LL;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x2000000000LL;
  uint64_t v25 = (os_log_s *)0xAAAAAAAAAAAAAAAALL;
  uint64_t v25 = sub_100054BCC((os_log_s *)v7);
  NormalizedIssuerContent = (const __CFData *)SecCertificateGetNormalizedIssuerContent(a2);
  CFDataRef v9 = NormalizedIssuerContent;
  if (NormalizedIssuerContent && CFDataGetLength(NormalizedIssuerContent) >= 1)
  {
    if (!v7) {
      goto LABEL_17;
    }
    if (*(void *)(v7 + 8) && *(_DWORD *)(v7 + 36) != 1 && v23[3])
    {
      CFDataRef v10 = *(dispatch_queue_s **)v7;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 0x40000000LL;
      void v21[2] = sub_100055CB8;
      unint64_t v21[3] = &unk_100079900;
      v21[6] = v7;
      v21[7] = v9;
      v21[4] = &v22;
      v21[5] = &v26;
      dispatch_sync(v10, v21);
    }
  }

  else if (!v7)
  {
    goto LABEL_17;
  }

  if (v9)
  {
    uint64_t v11 = *(void *)(v7 + 40);
    if (v11)
    {
      CFIndex v12 = (const __CFArray *)v27[3];
      if (v12)
      {
        if (CFArrayGetCount(v12)) {
          goto LABEL_17;
        }
        uint64_t v11 = *(void *)(v7 + 40);
      }

      Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(v11 + 16), v9);
      if (Value)
      {
        BOOL v14 = Value;
        SecCertificateRef v15 = (const void *)v27[3];
        if (v15)
        {
          v27[3] = 0LL;
          CFRelease(v15);
        }

        CFIndex Count = CFArrayGetCount(v14);
        MutableCFStringRef Copy = CFArrayCreateMutableCopy(0LL, Count, v14);
        v27[3] = (uint64_t)MutableCopy;
      }
    }
  }

CFTypeRef sub_10001FD98(uint64_t a1, uint64_t a2)
{
  CFTypeRef cf = 0LL;
  uint64_t v3 = (os_log_s *)SecTrustStoreForDomain(2LL);
  char v4 = sub_1000564E8(v3, a2, (__CFArray **)&cf, 0LL);
  CFTypeRef result = cf;
  if ((v4 & 1) == 0)
  {
    if (cf)
    {
      CFTypeRef cf = 0LL;
      CFRelease(result);
      return 0LL;
    }
  }

  return result;
}

BOOL sub_10001FDF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = SecTrustStoreForDomain(2LL);
  return SecTrustStoreContains(v3, a2) != 0;
}

uint64_t sub_10001FE28(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, id))
{
  double v7 = *(double *)(a3 + 120);
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x2000000000LL;
  char v28 = 0;
  *(void *)&__int128 buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 0x40000000LL;
  uint64_t v30 = sub_100053854;
  CFNumberRef v31 = &unk_1000794E8;
  CFNumberRef v32 = &v25;
  sub_100051910(a3, (uint64_t)&buf);
  int v8 = *((unsigned __int8 *)v26 + 24);
  _Block_object_dispose(&v25, 8);
  if (!v8 || (SecCertificateIsValid(a2, v7) & 1) != 0)
  {
    CFDataRef v9 = objc_autoreleasePoolPush();
    CAIssuers = (const __CFArray *)SecCertificateGetCAIssuers(a2);
    uint64_t v11 = CAIssuers;
    if (CAIssuers)
    {
      CFRetain(CAIssuers);
      uint64_t v12 = *(void *)(a3 + 272);
      id v13 = sub_10001D8E0(a2, v11, 0);
      if (v13)
      {
        BOOL v14 = v13;
        if (v12) {
          *(_BYTE *)(v12 + 21) = 1;
        }
        a4(a3, v13);
        CFRelease(v14);
        goto LABEL_18;
      }

      if (v12) {
        *(_BYTE *)(v12 + 22) = 1;
      }
      id v17 = -[__CFArray count](v11, "count");
      if ((unint64_t)v17 < 0xA)
      {
        if (qword_100082CD8 != -1) {
          dispatch_once(&qword_100082CD8, &stru_100076BD8);
        }
        uint64_t v22 = *(void **)(a3 + 32);
        if (v22) {
          CFRetain(*(CFTypeRef *)(a3 + 32));
        }
        unsigned int v23 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100082CC8 sessionForAuditToken:v22]);
        uint64_t v24 = -[TrustURLSessionContext initWithContext:uris:]( objc_alloc(&OBJC_CLASS___CAIssuerContext),  "initWithContext:uris:",  a3,  v11);
        -[CAIssuerContext setCallback:](v24, "setCallback:", a4);
        -[TrustURLSessionContext setAttribution:](v24, "setAttribution:", *(void *)(a3 + 280));
        uint64_t v16 = (uint64_t)[(id)qword_100082CD0 fetchNext:v23 context:v24];

        goto LABEL_19;
      }

      id v18 = v17;
      int v19 = sub_10000856C("caissuer");
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "too many caIssuer entries (%ld)",  (uint8_t *)&buf,  0xCu);
      }
    }

    a4(a3, 0LL);
LABEL_18:
    uint64_t v16 = 1LL;
LABEL_19:

    objc_autoreleasePoolPop(v9);
    return v16;
  }

  SecCertificateRef v15 = (os_log_s *)sub_10000856C("async");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = a2;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "skipping CAIssuer fetch for expired %@",  (uint8_t *)&buf,  0xCu);
  }

  a4(a3, 0LL);
  return 1LL;
}

uint64_t sub_100020128()
{
  return 0LL;
}

uint64_t sub_100020130(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, __CFArray *))
{
  uint64_t NormalizedIssuerContent = SecCertificateGetNormalizedIssuerContent(a2);
  CFErrorRef err = 0LL;
  int v8 = (const __CFArray *)SecItemCopyParentCertificates_ios(NormalizedIssuerContent, *(void *)(a1 + 24), &err);
  if (v8)
  {
    CFDataRef v9 = v8;
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFArrayGetTypeID())
    {
      CFIndex Count = CFArrayGetCount(v9);
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, Count, &kCFTypeArrayCallBacks);
      context[0] = _NSConcreteStackBlock;
      context[1] = 0x40000000LL;
      context[2] = sub_10002038C;
      void context[3] = &unk_100076E18;
      context[4] = Mutable;
      v20.CFIndex length = CFArrayGetCount(v9);
      v20.CFIndex location = 0LL;
      CFArrayApplyFunction(v9, v20, (CFArrayApplierFunction)sub_1000203DC, context);
    }

    else
    {
      CFTypeID v13 = CFGetTypeID(v9);
      if (v13 == CFDataGetTypeID())
      {
        CFIndex v14 = CFArrayGetCount(v9);
        CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, v14, &kCFTypeArrayCallBacks);
        SecCertificateRef v15 = SecCertificateCreateWithData(kCFAllocatorDefault, v9);
        if (v15)
        {
          SecCertificateRef v16 = v15;
          CFArrayAppendValue(Mutable, v15);
          CFRelease(v16);
        }
      }

      else
      {
        CFMutableDictionaryRef Mutable = 0LL;
      }
    }

    CFRelease(v9);
    a4(a3, Mutable);
    if (Mutable) {
      CFRelease(Mutable);
    }
  }

  else
  {
    if (err)
    {
      CFErrorGetCode(err);
      if (err) {
        CFRelease(err);
      }
    }

    a4(a3, 0LL);
  }

  return 1LL;
}

uint64_t sub_1000202E4(uint64_t a1, __SecCertificate *a2)
{
  uint64_t NormalizedIssuerContent = (const void *)SecCertificateGetNormalizedIssuerContent(a2);
  uint64_t v5 = NormalizedIssuerContent;
  if (NormalizedIssuerContent) {
    CFRetain(NormalizedIssuerContent);
  }
  CFErrorRef error = 0LL;
  CFDataRef v6 = SecCertificateCopySerialNumberData(a2, &error);
  uint64_t v7 = SecItemCertificateExists(v5, v6, *(void *)(a1 + 24), &error);
  if (error)
  {
    CFErrorGetCode(error);
    if (error) {
      CFRelease(error);
    }
  }

  if (v6) {
    CFRelease(v6);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v7;
}

void sub_10002038C(uint64_t a1, const __CFData *a2)
{
  SecCertificateRef v3 = SecCertificateCreateWithData(kCFAllocatorDefault, a2);
  if (v3)
  {
    SecCertificateRef v4 = v3;
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), v3);
    CFRelease(v4);
  }

uint64_t sub_1000203DC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void *sub_1000203F0(const __CFArray *a1)
{
  CFMutableDictionaryRef v2 = malloc(0x28uLL);
  *CFMutableDictionaryRef v2 = sub_1000204A8;
  v2[1] = 0LL;
  _DWORD v2[2] = sub_1000204FC;
  CFIndex Count = CFArrayGetCount(a1);
  v2[3] = CFSetCreateMutable(kCFAllocatorDefault, Count, &kCFTypeSetCallBacks);
  v2[4] = CFDictionaryCreateMutable( kCFAllocatorDefault,  Count,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  v5.CFIndex location = 0LL;
  v5.CFIndex length = Count;
  CFArrayApplyFunction(a1, v5, (CFArrayApplierFunction)sub_10002051C, v2);
  return v2;
}

uint64_t sub_1000204A8(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, const void *))
{
  uint64_t NormalizedIssuerContent = (const void *)SecCertificateGetNormalizedIssuerContent(a2);
  if (NormalizedIssuerContent) {
    uint64_t NormalizedIssuerContent = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 32), NormalizedIssuerContent);
  }
  a4(a3, NormalizedIssuerContent);
  return 1LL;
}

BOOL sub_1000204FC(uint64_t a1, const void *a2)
{
  return CFSetContainsValue(*(CFSetRef *)(a1 + 24), a2) != 0;
}

void sub_10002051C(void *value, uint64_t a2)
{
  if (!CFSetContainsValue(*(CFSetRef *)(a2 + 24), value))
  {
    CFSetAddValue(*(CFMutableSetRef *)(a2 + 24), value);
    NormalizedSubjectContent = (const void *)SecCertificateGetNormalizedSubjectContent(value);
    if (NormalizedSubjectContent)
    {
      CFRange v5 = NormalizedSubjectContent;
      CFDataRef v6 = *(const __CFDictionary **)(a2 + 32);
      CFMutableDictionaryRef Mutable = (__CFArray *)CFDictionaryGetValue(v6, NormalizedSubjectContent);
      if (Mutable
        || (CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks),
            CFDictionaryAddValue(v6, v5, Mutable),
            CFRelease(Mutable),
            Mutable))
      {
        CFArrayAppendValue(Mutable, value);
      }
    }
  }

void sub_1000205DC(CFTypeRef *a1)
{
}

uint64_t sub_10002060C(CFTypeRef *a1)
{
  CFTypeRef cf = 0LL;
  CFURLRef v2 = sub_100020748();
  SecCertificateRef v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  uint64_t v4 = sub_100020764(v3, (CFErrorRef *)&cf);

  CFTypeRef v5 = cf;
  if (cf)
  {
    if (a1)
    {
      *a1 = cf;
    }

    else
    {
      CFTypeRef cf = 0LL;
      CFRelease(v5);
    }
  }

  CFDataRef v6 = sub_10000856C("trust");
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (a1)
    {
      if (*a1) {
        CFDataRef v9 = "Error";
      }
      else {
        CFDataRef v9 = "OK";
      }
    }

    else
    {
      CFDataRef v9 = "N/A";
    }

    *(_DWORD *)__int128 buf = 134218242;
    uint64_t v12 = v4;
    __int16 v13 = 2080;
    CFIndex v14 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "exceptionResetCount: %llu (%s)", buf, 0x16u);
  }

  return v4;
}

CFURLRef sub_100020748()
{
  return sub_10001A17C((uint64_t)@"com.apple.security.exception_reset_counter.plist");
}

uint64_t sub_100020764(void *a1, CFErrorRef *a2)
{
  SecCertificateRef v3 = a1;
  uint64_t v4 = objc_autoreleasePoolPush();
  id v22 = 0LL;
  CFTypeRef v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithContentsOfURL:error:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithContentsOfURL:error:",  v3,  &v22));
  id v6 = v22;
  id v7 = [v5 mutableCopy];

  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"ExceptionResetCount"]);
    if (v8)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___NSNumber);
      if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
      {
        uint64_t v10 = [v8 unsignedIntValue];
        uint64_t v11 = sub_10000856C("trust");
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)__int128 buf = 138543618;
          uint64_t v24 = @"ExceptionResetCount";
          __int16 v25 = 2048;
          uint64_t v26 = v10;
          _os_log_debug_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "'%{public}@' is %llu.", buf, 0x16u);
        }

        goto LABEL_21;
      }

      int v19 = sub_10000856C("SecError");
      CFRange v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v24 = @"ExceptionResetCount";
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "The value for key '%{public}@' is not a number.",  buf,  0xCu);
      }

      if (a2)
      {
        id v17 = kCFErrorDomainPOSIX;
        CFIndex v18 = 33LL;
        goto LABEL_19;
      }
    }

    else
    {
      SecCertificateRef v15 = sub_10000856C("trust");
      SecCertificateRef v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v24 = @"ExceptionResetCount";
        __int16 v25 = 2048;
        uint64_t v26 = 0LL;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEBUG,  "Could not find key '%{public}@'. Defaulting to value %llu.",  buf,  0x16u);
      }

      if (a2)
      {
        id v17 = kCFErrorDomainPOSIX;
        CFIndex v18 = 6LL;
LABEL_19:
        uint64_t v10 = 0LL;
        *a2 = CFErrorCreate(0LL, v17, v18, 0LL);
LABEL_21:

        goto LABEL_22;
      }
    }

    uint64_t v10 = 0LL;
    goto LABEL_21;
  }

  __int16 v13 = sub_10000856C("SecError");
  CFIndex v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)__int128 buf = 138543618;
    uint64_t v24 = v3;
    __int16 v25 = 2048;
    uint64_t v26 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Failed to read from permanent storage at '%{public}@' or the data is bad. Defaulting to value %llu.",  buf,  0x16u);
  }

  uint64_t v10 = 0LL;
  if (a2) {
    *a2 = (CFErrorRef)v6;
  }
LABEL_22:

  objc_autoreleasePoolPop(v4);
  return v10;
}

id sub_100020A78(CFTypeRef *a1)
{
  if ((sub_100011134() & 1) != 0)
  {
    uint64_t v2 = sub_10002060C(a1);
    if (a1)
    {
      if (*a1)
      {
        SecCertificateRef v3 = sub_10000856C("SecError");
        uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)SecCertificateRef v15 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Failed to increment the extensions epoch.",  v15,  2u);
        }

        return 0LL;
      }

      uint64_t v12 = v2 + 1;
      CFURLRef v13 = sub_100020748();
      int v8 = (void *)objc_claimAutoreleasedReturnValue(v13);
      uint64_t v9 = v12;
      uint64_t v10 = v8;
      uint64_t v11 = (CFErrorRef *)a1;
    }

    else
    {
      uint64_t v6 = v2 + 1;
      CFURLRef v7 = sub_100020748();
      int v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      uint64_t v9 = v6;
      uint64_t v10 = v8;
      uint64_t v11 = 0LL;
    }

    id v5 = sub_100020B78(v9, v10, v11);

    return v5;
  }

  sub_10000DE88(-4, (__CFString **)a1, @"exception counter not implemented in this environment");
  return 0LL;
}

id sub_100020B78(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_autoreleasePoolPush();
  CFURLRef v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  if (v7)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", 1LL));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v8, @"Version");

    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](&OBJC_CLASS___NSNumber, "numberWithUnsignedLongLong:", a1));
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v7,  "setObject:forKeyedSubscript:",  v9,  @"ExceptionResetCount");

    id v19 = 0LL;
    id v10 = -[NSMutableDictionary writeToClassDURL:permissions:error:]( v7,  "writeToClassDURL:permissions:error:",  v5,  384LL,  &v19);
    id v11 = v19;
    if ((v10 & 1) != 0)
    {
      uint64_t v12 = sub_10000856C("trust");
      CFURLRef v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int128 buf = 138543618;
        uint64_t v21 = @"ExceptionResetCount";
        __int16 v22 = 2114;
        unsigned int v23 = v5;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "'%{public}@' has been committed to permanent storage at '%{public}@'.",  buf,  0x16u);
      }
    }

    else
    {
      SecCertificateRef v16 = sub_10000856C("SecError");
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138543362;
        uint64_t v21 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Failed to write to permanent storage at '%{public}@'.",  buf,  0xCu);
      }

      if (a3) {
        *a3 = (CFErrorRef)v11;
      }
    }
  }

  else
  {
    CFIndex v14 = sub_10000856C("SecError");
    SecCertificateRef v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)__int128 buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Failed to allocate memory for the exceptions epoch structure.",  buf,  2u);
    }

    id v10 = 0LL;
    if (a3) {
      *a3 = CFErrorCreate(0LL, kCFErrorDomainPOSIX, 12LL, 0LL);
    }
  }

  objc_autoreleasePoolPop(v6);
  return v10;
}

void sub_100020DFC(id a1, const char *a2)
{
}

void sub_100020E04(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  int8x16_t v15 = *(int8x16_t *)(a1 + 40);
  uint64_t v5 = *(void *)v15.i64[0];
  if ((CFDataGetLength(*(CFDataRef *)v15.i64[0]) & 0x8000000000000000LL) == 0)
  {
    uint64_t v23 = 0LL;
    uint64_t v24 = &v23;
    uint64_t v25 = 0x2000000000LL;
    uint64_t v26 = 0LL;
    uint64_t v19 = 0LL;
    CFRange v20 = &v19;
    uint64_t v21 = 0x2000000000LL;
    char v22 = 1;
    uint64_t v6 = *a2;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 0x40000000LL;
    _DWORD v16[2] = sub_10002164C;
    v16[3] = &unk_1000770A0;
    v16[4] = &v19;
    void v16[5] = &v23;
    v16[6] = v3;
    void v16[7] = v5;
    int8x16_t v17 = vextq_s8(v15, v15, 8uLL);
    uint64_t v18 = v4;
    char v7 = sub_10000D098(v6, &v26, (uint64_t)v16);
    if (*((_BYTE *)v20 + 24)) {
      char v8 = v7;
    }
    else {
      char v8 = 0;
    }
    *((_BYTE *)v20 + 24) = v8;
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = v24[3];
        *(_DWORD *)__int128 buf = 138412290;
        uint64_t v28 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "_SecOCSPCacheAddResponse failed: %@",  buf,  0xCu);
      }

      id v11 = (__CFError *)v24[3];
      if (v11) {
        CFIndex Code = CFErrorGetCode(v11);
      }
      else {
        CFIndex Code = -2070LL;
      }
      sub_10004ADB8(2LL, 2LL, Code);
      CFURLRef v13 = (const void *)v24[3];
      if (v13)
      {
        _OWORD v24[3] = 0LL;
        CFRelease(v13);
      }
    }

    CFIndex v14 = (const void *)v24[3];
    if (v14) {
      CFRelease(v14);
    }
    _Block_object_dispose(&v19, 8);
    _Block_object_dispose(&v23, 8);
  }

void sub_100020FDC(uint64_t a1)
{
  if (sub_100011134())
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_100082D00);
    if (qword_100082D08) {
      goto LABEL_22;
    }
    uint64_t v2 = sub_10001A17C((uint64_t)@"ocspcache.sqlite3");
    if (!v2 || (v3 = v2, uint64_t v4 = CFURLCopyFileSystemPath(v2, kCFURLPOSIXPathStyle), CFRelease(v3), !v4))
    {
LABEL_21:
      if (!qword_100082D08)
      {
LABEL_23:
        os_unfair_lock_unlock((os_unfair_lock_t)&unk_100082D00);
        return;
      }

LABEL_22:
      (*(void (**)(uint64_t))(a1 + 16))(a1);
      goto LABEL_23;
    }

    uint64_t v5 = malloc(8uLL);
    if (v5)
    {
      uint64_t v6 = sub_100009AC0(v4, 384, 1, 1, 1, 1, &stru_100076F10);
      *uint64_t v5 = v6;
      if (v6)
      {
        char v7 = (const void *)v6;
        uint64_t v21 = 0LL;
        char v22 = &v21;
        uint64_t v23 = 0x2000000000LL;
        char v24 = 1;
        uint64_t v17 = 0LL;
        uint64_t v18 = &v17;
        uint64_t v19 = 0x2000000000LL;
        CFRange v20 = 0LL;
        v16[0] = _NSConcreteStackBlock;
        v16[1] = 0x40000000LL;
        _DWORD v16[2] = sub_100021240;
        v16[3] = &unk_100076FB0;
        v16[4] = &v21;
        void v16[5] = &v17;
        char v8 = sub_10000D098(v6, &v20, (uint64_t)v16);
        if (*((_BYTE *)v22 + 24)) {
          char v9 = v8;
        }
        else {
          char v9 = 0;
        }
        *((_BYTE *)v22 + 24) = v9;
        if ((v9 & 1) == 0)
        {
          uint64_t v10 = (os_log_s *)sub_10000856C("SecError");
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = v18[3];
            *(_DWORD *)__int128 buf = 138412290;
            uint64_t v26 = v11;
            _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "OCSP table update failed: %@",  buf,  0xCu);
          }

          uint64_t v12 = (__CFError *)v18[3];
          if (v12) {
            CFIndex Code = CFErrorGetCode(v12);
          }
          else {
            CFIndex Code = -2070LL;
          }
          sub_10004ADB8(2LL, 2LL, Code);
        }

        CFIndex v14 = (const void *)v18[3];
        if (v14) {
          CFRelease(v14);
        }
        int v15 = *((unsigned __int8 *)v22 + 24);
        _Block_object_dispose(&v17, 8);
        _Block_object_dispose(&v21, 8);
        if (v15) {
          goto LABEL_20;
        }
        CFRelease(v7);
      }

      free(v5);
      uint64_t v5 = 0LL;
    }

    uint64_t v19 = 0LL;
    goto LABEL_23;
  }

  uint64_t v19 = CFDataCreateWithBytesNoCopy(0LL, v15, st_size, kCFAllocatorNull);
  close(v7);
LABEL_23:
  CFRange v20 = *(void *)(a1 + 80) == 0LL;
  if (v19)
  {
    uint64_t v21 = *(const __CFString **)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL);
    BytePtr = (unsigned int *)CFDataGetBytePtr(v19);
    CC_LONG Length = CFDataGetLength(v19);
    if (!BytePtr) {
      goto LABEL_46;
    }
    if (Length < 5) {
      goto LABEL_46;
    }
    char v24 = bswap32(*BytePtr);
    uint64_t v25 = (const UInt8 *)(BytePtr + 1);
    uint64_t v26 = (const UInt8 *)BytePtr + v24 + 4;
    uint64_t v27 = bswap32(*(_DWORD *)v26);
    *(void *)&buf.st_dev = 0LL;
    uint64_t v28 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v26 + 4, v27, kCFAllocatorNull);
    if (!v28) {
      goto LABEL_46;
    }
    uint64_t v29 = v28;
    uint64_t v30 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v25, v24, kCFAllocatorNull);
    if (v30)
    {
      CFNumberRef v31 = v30;
      ApplePinned = (const void *)SecPolicyCreateApplePinned( @"ValidUpdate",  @"1.2.840.113635.100.6.2.10",  @"1.2.840.113635.100.6.51");
      uint64_t v33 = SecCMSVerify(v29, v31, ApplePinned, &buf, 0LL);
      if (v33)
      {
        unsigned int v34 = v33;
        CFNumberRef v35 = (os_log_s *)sub_10000856C("SecError");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v65 = 67109120;
          *(_DWORD *)&v65[4] = v34;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "failed to verify Valid Update: %d",  v65,  8u);
        }

        TrustResult = -67671;
      }

      else
      {
        LODWORD(v6syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0;
        TrustResult = SecTrustGetTrustResult(*(SecTrustRef *)&buf.st_dev, (SecTrustResultType *)&v60);
        if (!TrustResult && (_DWORD)v60 != 1 && (_DWORD)v60 != 4)
        {
          char v59 = (os_log_s *)sub_10000856C("SecError");
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v65 = 67109120;
            *(_DWORD *)&v65[4] = v60;
            _os_log_impl( (void *)&_mh_execute_header,  v59,  OS_LOG_TYPE_DEFAULT,  "Valid Update SecTrustEvaluate failed with trust result %d\n",  v65,  8u);
          }

          TrustResult = -67671;
        }
      }

      CFRelease(v31);
    }

    else
    {
      ApplePinned = 0LL;
      TrustResult = -67671;
    }

    CFRelease(v29);
    if (*(void *)&buf.st_dev) {
      CFRelease(*(CFTypeRef *)&buf.st_dev);
    }
    if (ApplePinned) {
      CFRelease(ApplePinned);
    }
    if (TrustResult)
    {
LABEL_46:
      CFArrayRef v38 = (os_log_s *)sub_10000856C("SecError");
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.st_dev) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v38,  OS_LOG_TYPE_DEFAULT,  "failed to verify valid update",  (uint8_t *)&buf,  2u);
      }

      sub_10004AC48((uint64_t)@"ValidUpdateEvent", 1, 4294899488LL);
      goto LABEL_49;
    }

    uint64_t v55 = (const __CFString *)sub_10003A730();
    char v56 = v55;
    if (v21 && v55)
    {
      if (CFStringCompare(v55, v21, 1uLL))
      {
        CFRange v57 = (os_log_s *)sub_10000856C("validupdate");
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          buf.st_dev = 138412546;
          *(void *)&buf.st_mode = v56;
          WORD2(buf.st_ino) = 2112;
          *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v21;
          _os_log_impl( (void *)&_mh_execute_header,  v57,  OS_LOG_TYPE_DEFAULT,  "switching db source from %@ to %@",  (uint8_t *)&buf,  0x16u);
        }
      }
    }

    else if (!v55)
    {
LABEL_70:
      *(void *)uint64_t v65 = 0LL;
      *(void *)&v65[8] = v65;
      *(void *)&v65[16] = 0x2000000000LL;
      LOBYTE(v66) = 1;
      uint64_t v60 = 0LL;
      uint64_t v61 = &v60;
      off_t v62 = 0x2000000000LL;
      __int16 v63 = 0LL;
      *(void *)&buf.st_dev = _NSConcreteStackBlock;
      buf.st_ino = 0x40000000LL;
      *(void *)&buf.st_uid = sub_10003A7B8;
      *(void *)&buf.st_rdev = &unk_100077DA8;
      buf.st_atimespec.tv_sec = (__darwin_time_t)v65;
      buf.st_atimespec.tv_nsec = (uint64_t)&v60;
      LOBYTE(buf.st_ctimespec.tv_sec) = v20;
      buf.st_mtimespec.tv_sec = (__darwin_time_t)v21;
      buf.st_mtimespec.tv_nsec = (uint64_t)v19;
      sub_10003A94C((uint64_t)&buf);
      sub_10003A9B4(*(double *)&qword_100082DD8);
      dispatch_semaphore_t v58 = (const void *)v61[3];
      if (v58) {
        CFRelease(v58);
      }
      _Block_object_dispose(&v60, 8);
      _Block_object_dispose(v65, 8);
      goto LABEL_49;
    }

    CFRelease(v56);
    goto LABEL_70;
  }

  CFArrayRef v37 = (os_log_s *)sub_10000856C("validupdate");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "invalid update data", (uint8_t *)&buf, 2u);
  }

LABEL_20:
    qword_100082D08 = (uint64_t)v5;
    CFRelease(v4);
    goto LABEL_21;
  }

BOOL sub_100021240(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v3 + 8);
  v9[0] = _NSConcreteStackBlock;
  void v9[2] = sub_1000212CC;
  v9[3] = &unk_100076F88;
  v9[1] = 0x40000000LL;
  v9[5] = v3;
  void v9[6] = a2;
  void v9[4] = v4;
  BOOL result = sub_10000B35C(a2, 2LL, (CFTypeRef *)(v5 + 24), (uint64_t)v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    BOOL v8 = result;
  }
  else {
    BOOL v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  return result;
}

void sub_1000212CC(void *a1, _BYTE *a2)
{
  uint64_t v12 = 0LL;
  if ((sub_10000B220( a1[6],  @"SELECT issuerNameHash FROM ocsp WHERE certStatus=0 LIMIT 1",  (CFTypeRef *)&v12,  0LL) & 1) == 0 && CFErrorGetCode(v12) == 1)
  {
    uint64_t v5 = a1[4];
    uint64_t v4 = a1[5];
    uint64_t v6 = *(void *)(v4 + 8);
    v11[0] = _NSConcreteStackBlock;
    void v11[2] = sub_1000213AC;
    void v11[3] = &unk_100076F60;
    uint64_t v7 = a1[6];
    v11[1] = 0x40000000LL;
    void v11[5] = v4;
    v11[6] = v7;
    void v11[4] = v5;
    char v8 = sub_10000B220( v7,  @"ALTER TABLE ocsp ADD COLUMN certStatus INTEGER NOT NULL DEFAULT 255",  (CFTypeRef *)(v6 + 24),  (uint64_t)v11);
    uint64_t v9 = *(void *)(a1[4] + 8LL);
    if (*(_BYTE *)(v9 + 24)) {
      char v10 = v8;
    }
    else {
      char v10 = 0;
    }
    *(_BYTE *)(v9 + 24) = v10;
    *a2 = *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL);
  }

  if (v12) {
    CFRelease(v12);
  }
}

uint64_t sub_1000213AC(void *a1, sqlite3_stmt *a2)
{
  *(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL) = sub_10000AC3C( a1[6],  a2,  (CFTypeRef *)(*(void *)(a1[5] + 8LL) + 24LL),  0LL);
  return *(unsigned __int8 *)(*(void *)(a1[4] + 8LL) + 24LL);
}

BOOL sub_1000213F8(id a1, __OpaqueSecDb *a2, __OpaqueSecDbConnection *a3, BOOL a4, BOOL *a5, __CFError **a6)
{
  BOOL v7 = a4;
  uint64_t v19 = 0LL;
  CFRange v20 = &v19;
  uint64_t v21 = 0x2000000000LL;
  char v22 = 1;
  CFErrorRef err = 0LL;
  if ((sub_10000B220( (uint64_t)a3,  @"SELECT DISTINCT hashAlgorithm FROM ocsp WHERE serialNum=?",  (CFTypeRef *)&err,  0LL) & 1) == 0 && CFErrorGetCode(err) == 1)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 0x40000000LL;
    void v17[2] = sub_1000215F0;
    v17[3] = &unk_100076F38;
    v17[4] = &v19;
    v17[5] = a3;
    v17[6] = a6;
    BOOL v9 = sub_10000B35C((uint64_t)a3, 2LL, (CFTypeRef *)a6, (uint64_t)v17);
    if (*((_BYTE *)v20 + 24)) {
      BOOL v10 = v9;
    }
    else {
      BOOL v10 = 0;
    }
    *((_BYTE *)v20 + 24) = v10;
  }

  if (err) {
    CFRelease(err);
  }
  if (*((_BYTE *)v20 + 24))
  {
    BOOL v11 = 1;
  }

  else
  {
    uint64_t v12 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFURLRef v13 = "Open";
      if (v7) {
        CFURLRef v13 = "Create";
      }
      if (a6) {
        CFIndex v14 = *a6;
      }
      else {
        CFIndex v14 = 0LL;
      }
      *(_DWORD *)__int128 buf = 136315394;
      char v24 = v13;
      __int16 v25 = 2112;
      uint64_t v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s failed: %@", buf, 0x16u);
    }

    if (a6 && *a6) {
      CFIndex Code = CFErrorGetCode(*a6);
    }
    else {
      CFIndex Code = -2070LL;
    }
    sub_10004ADB8(2LL, !v7, Code);
    BOOL v11 = *((_BYTE *)v20 + 24) != 0;
  }

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t sub_1000215F0(uint64_t a1, _BYTE *a2)
{
  uint64_t result = sub_100009ED0( *(void *)(a1 + 40),  @"CREATE TABLE ocsp(issuerNameHash BLOB NOT NULL,issuerPubKeyHash BLOB NOT NULL,serialNum BLOB NOT NULL,hashAlgorithm BLOB NOT NULL,responseId INTEGER NOT NULL,certStatus INTEGER NOT NULL DEFAULT 255);CREATE INDEX iResponseId ON ocsp(responseId);CREATE INDEX iserialNum ON ocsp(serialNum);CREATE INDEX iSNumDAlg ON ocsp(serialNum,hashAlgorithm);CREATE TABLE responses(responseId INTEGER PRIMARY KEY,ocspResponse BLOB NOT NULL,responderURI BLOB,expires DOUBLE NOT NULL,lastUsed DOUBLE NOT NULL);CREATE INDEX iexpires ON responses(expires);CREATE TRIGGER tocspdel BEFORE DELETE ON responses FOR EACH ROW BEGIN DELETE FROM ocsp WHERE responseId=OLD.responseId; END;",
             *(CFTypeRef **)(a1 + 48));
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v5 + 24)) {
    char v6 = result;
  }
  else {
    char v6 = 0;
  }
  *(_BYTE *)(v5 + 24) = v6;
  *a2 = *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
  return result;
}

BOOL sub_10002164C(uint64_t a1, uint64_t a2)
{
  v9[0] = _NSConcreteStackBlock;
  uint64_t v3 = *(void *)(a1 + 32);
  __int128 v4 = *(_OWORD *)(a1 + 40);
  uint64_t v5 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v9[1] = 0x40000000LL;
  void v9[2] = sub_1000216FC;
  v9[3] = &unk_100077078;
  void v9[4] = v3;
  uint64_t v11 = a2;
  __int128 v10 = v4;
  __int128 v12 = *(_OWORD *)(a1 + 56);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  BOOL result = sub_10000B35C(a2, 2LL, v5, (uint64_t)v9);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    BOOL v8 = result;
  }
  else {
    BOOL v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  return result;
}

void sub_1000216FC(uint64_t a1, _BYTE *a2)
{
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2000000000LL;
  unint64_t v41 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v4 = *(void *)(a1 + 48);
  if (v4)
  {
    unint64_t v41 = *(void *)(v4 + 208);
    if ((v41 & 0x8000000000000000LL) == 0)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v6 = *(void *)(a1 + 40);
      BOOL v8 = (CFTypeRef *)(*(void *)(v6 + 8) + 24LL);
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 0x40000000LL;
      v39[2] = sub_10002193C;
      void v39[3] = &unk_100076FD8;
      v39[4] = v7;
      v39[5] = v40;
      v39[6] = v6;
      v39[7] = v5;
      char v9 = sub_10000B220(v5, @"DELETE FROM responses WHERE responseId=?", v8, (uint64_t)v39);
      uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 8LL);
      if (*(_BYTE *)(v10 + 24)) {
        char v11 = v9;
      }
      else {
        char v11 = 0;
      }
      *(_BYTE *)(v10 + 24) = v11;
    }
  }

  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v14 = *(void *)(v12 + 8);
  _OWORD v34[2] = sub_1000219FC;
  v34[3] = &unk_100077000;
  uint64_t v15 = *(void *)(a1 + 56);
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 0x40000000LL;
  v34[4] = v13;
  v34[5] = v12;
  __int128 v35 = *(_OWORD *)(a1 + 64);
  uint64_t v36 = *(void *)(a1 + 80);
  uint64_t v37 = *(void *)(a1 + 88);
  uint64_t v38 = v15;
  v34[6] = v40;
  char v16 = sub_10000B220( v15,  @"INSERT INTO responses (ocspResponse,responderURI,expires,lastUsed) VALUES (?,?,?,?)",  (CFTypeRef *)(v14 + 24),  (uint64_t)v34);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v17 + 24)) {
    char v18 = v16;
  }
  else {
    char v18 = 0;
  }
  *(_BYTE *)(v17 + 24) = v18;
  uint64_t v19 = *(void *)(a1 + 56);
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(a1 + 40);
  char v22 = (CFTypeRef *)(*(void *)(v20 + 8) + 24LL);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 0x40000000LL;
  v33[2] = sub_100021C0C;
  v33[3] = &unk_100077050;
  uint64_t v23 = *(void *)(a1 + 80);
  v33[4] = v21;
  v33[5] = v20;
  v33[6] = v40;
  v33[7] = v23;
  v33[8] = v19;
  char v24 = sub_10000B220( v19,  @"INSERT INTO ocsp (hashAlgorithm,issuerNameHash,issuerPubKeyHash,serialNum,responseId,certStatus) VALUES (?,?,?,?,?,?)",  v22,  (uint64_t)v33);
  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v25 + 24)) {
    char v26 = v24;
  }
  else {
    char v26 = 0;
  }
  *(_BYTE *)(v25 + 24) = v26;
  uint64_t v27 = *(void *)(a1 + 56);
  uint64_t v28 = *(void *)(a1 + 88);
  uint64_t v29 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 0x40000000LL;
  unint64_t v42[2] = sub_100021CEC;
  v42[3] = &unk_1000770C0;
  v42[4] = v28;
  v42[5] = v29;
  v42[6] = v27;
  char v30 = sub_10000B220( v27,  @"DELETE FROM responses WHERE expires<? AND responseId NOT IN (SELECT responseId FROM ocsp WHERE certStatus=1)",  v29,  (uint64_t)v42);
  uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v31 + 24)) {
    char v32 = v30;
  }
  else {
    char v32 = 0;
  }
  *(_BYTE *)(v31 + 24) = v32;
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL)) {
    *a2 = 0;
  }
  _Block_object_dispose(v40, 8);
}

uint64_t sub_10002193C(void *a1, sqlite3_stmt *a2)
{
  uint64_t v4 = (CFTypeRef *)(*(void *)(a1[6] + 8LL) + 24LL);
  uint64_t v5 = sqlite3_bind_int64(a2, 1, *(void *)(*(void *)(a1[5] + 8LL) + 24LL));
  BOOL v6 = sub_100009708(v5, a2, v4, @"bind_int64[%d]", 1LL);
  uint64_t v7 = *(void *)(a1[4] + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  char v9 = sub_10000AC3C(a1[7], a2, (CFTypeRef *)(*(void *)(a1[6] + 8LL) + 24LL), 0LL);
  uint64_t v10 = *(void *)(a1[4] + 8LL);
  if (*(_BYTE *)(v10 + 24)) {
    char v11 = v9;
  }
  else {
    char v11 = 0;
  }
  *(_BYTE *)(v10 + 24) = v11;
  return *(unsigned __int8 *)(*(void *)(a1[4] + 8LL) + 24LL);
}

uint64_t sub_1000219FC(uint64_t a1, sqlite3_stmt *a2)
{
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 56));
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 56));
  BOOL v6 = sub_10000D114(a2, 1LL, BytePtr, Length, (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL))
  {
    char v9 = *(const __CFURL **)(a1 + 64);
    if (v9)
    {
      uint64_t v10 = CFURLCreateData(kCFAllocatorDefault, v9, 0x8000100u, 0);
      if (v10)
      {
        char v11 = v10;
        if (CFDataGetLength(v10) >= 1)
        {
          uint64_t v12 = CFDataGetBytePtr(v11);
          CFIndex v13 = CFDataGetLength(v11);
          *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_10000D114( a2,  2LL,  v12,  v13,  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40)
                                                                                                 + 8LL)
                                                                                     + 24LL));
        }

        CFRelease(v11);
      }
    }
  }

  uint64_t v14 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v15 = sqlite3_bind_double(a2, 3, *(double *)(*(void *)(a1 + 72) + 32LL));
  BOOL v16 = sub_100009708(v15, a2, v14, @"bind_double[%d]", 3LL);
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v17 + 24)) {
    BOOL v18 = v16;
  }
  else {
    BOOL v18 = 0;
  }
  *(_BYTE *)(v17 + 24) = v18;
  uint64_t v19 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v20 = sqlite3_bind_double(a2, 4, *(double *)(a1 + 80));
  BOOL v21 = sub_100009708(v20, a2, v19, @"bind_double[%d]", 4LL);
  uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v22 + 24)) {
    BOOL v23 = v21;
  }
  else {
    BOOL v23 = 0;
  }
  *(_BYTE *)(v22 + 24) = v23;
  char v24 = sub_10000AC3C(*(void *)(a1 + 88), a2, (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL), 0LL);
  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v25 + 24)) {
    char v26 = v24;
  }
  else {
    char v26 = 0;
  }
  *(_BYTE *)(v25 + 24) = v26;
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = sqlite3_last_insert_rowid(*(sqlite3 **)(*(void *)(a1 + 88) + 64LL));
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

uint64_t sub_100021C0C(uint64_t a1, uint64_t a2)
{
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 0x40000000LL;
  void v9[2] = sub_100021D70;
  v9[3] = &unk_100077028;
  __int128 v10 = *(_OWORD *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v12 = a2;
  uint64_t v13 = *(void *)(a1 + 64);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 0x40000000LL;
  void v14[2] = sub_10002B704;
  v14[3] = &unk_100077750;
  v14[4] = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 0x40000000LL;
  unint64_t v15[2] = sub_10002B8D4;
  v15[3] = &unk_1000777E8;
  v15[4] = v14;
  int v4 = DERDecodeSequenceContentWithBlock((unint64_t *)(v3 + 152), (uint64_t)v15);
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(_BYTE *)(v5 + 24) == 0;
  }
  char v7 = !v6;
  *(_BYTE *)(v5 + 24) = v7;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

uint64_t sub_100021CEC(uint64_t a1, sqlite3_stmt *a2)
{
  int v4 = *(CFTypeRef **)(a1 + 40);
  uint64_t v5 = sqlite3_bind_double(a2, 1, *(double *)(a1 + 32));
  uint64_t result = sub_100009708(v5, a2, v4, @"bind_double[%d]", 1LL);
  if ((_DWORD)result) {
    return sub_10000AC3C(*(void *)(a1 + 48), a2, *(CFTypeRef **)(a1 + 40), 0LL);
  }
  return result;
}

uint64_t sub_100021D70(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7 = sub_10000D114( *(sqlite3_stmt **)(a1 + 56),  1LL,  *(const void **)a4,  *(void *)(a4 + 8),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v8 + 24)) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  *(_BYTE *)(v8 + 24) = v9;
  BOOL v10 = sub_10000D114( *(sqlite3_stmt **)(a1 + 56),  2LL,  *(const void **)(a3 + 16),  *(void *)(a3 + 24),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v11 + 24)) {
    BOOL v12 = v10;
  }
  else {
    BOOL v12 = 0;
  }
  *(_BYTE *)(v11 + 24) = v12;
  BOOL v13 = sub_10000D114( *(sqlite3_stmt **)(a1 + 56),  3LL,  *(const void **)(a3 + 32),  *(void *)(a3 + 40),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v14 + 24)) {
    BOOL v15 = v13;
  }
  else {
    BOOL v15 = 0;
  }
  *(_BYTE *)(v14 + 24) = v15;
  BOOL v16 = sub_10000D114( *(sqlite3_stmt **)(a1 + 56),  4LL,  *(const void **)(a3 + 48),  *(void *)(a3 + 56),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v17 + 24)) {
    BOOL v18 = v16;
  }
  else {
    BOOL v18 = 0;
  }
  *(_BYTE *)(v17 + 24) = v18;
  uint64_t v19 = *(sqlite3_stmt **)(a1 + 56);
  uint64_t v20 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v21 = sqlite3_bind_int64(v19, 5, *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL));
  BOOL v22 = sub_100009708(v21, v19, v20, @"bind_int64[%d]", 5LL);
  uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v23 + 24)) {
    BOOL v24 = v22;
  }
  else {
    BOOL v24 = 0;
  }
  *(_BYTE *)(v23 + 24) = v24;
  uint64_t v25 = *(sqlite3_stmt **)(a1 + 56);
  int v26 = *a2;
  uint64_t v27 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v28 = sqlite3_bind_int(v25, 6, v26);
  BOOL v29 = sub_100009708(v28, v25, v27, @"bind_int[%d]", 6LL);
  uint64_t v30 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v30 + 24)) {
    BOOL v31 = v29;
  }
  else {
    BOOL v31 = 0;
  }
  *(_BYTE *)(v30 + 24) = v31;
  char v32 = sub_10000AC3C( *(void *)(a1 + 64),  *(sqlite3_stmt **)(a1 + 56),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL),  0LL);
  uint64_t v33 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v33 + 24)) {
    char v34 = v32;
  }
  else {
    char v34 = 0;
  }
  *(_BYTE *)(v33 + 24) = v34;
  __int128 v35 = *(sqlite3_stmt **)(a1 + 56);
  uint64_t v36 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v37 = sqlite3_reset(v35);
  BOOL v38 = sub_100009708(v37, v35, v36, @"reset");
  uint64_t v39 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v39 + 24)) {
    BOOL v40 = v38;
  }
  else {
    BOOL v40 = 0;
  }
  *(_BYTE *)(v39 + 24) = v40;
  return (*(char *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) - 1);
}

uint64_t sub_100021FAC(uint64_t a1, uint64_t *a2)
{
  uint64_t result = sub_100021FE8(a2, *(SecCertificateRef **)(a1 + 40), 0.0);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100021FE8(uint64_t *a1, SecCertificateRef *a2, double a3)
{
  uint64_t v32 = 0LL;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2000000000LL;
  uint64_t v35 = 0LL;
  uint64_t v28 = 0LL;
  BOOL v29 = &v28;
  uint64_t v30 = 0x2000000000LL;
  uint64_t v31 = 0LL;
  uint64_t v24 = 0LL;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x2000000000LL;
  char v27 = 1;
  uint64_t PublicKeyData = SecCertificateGetPublicKeyData(a2[1]);
  if (PublicKeyData)
  {
    uint64_t v7 = PublicKeyData;
    uint64_t v8 = SecCertificateCopyIssuerSequence(*a2);
    if (v8)
    {
      BOOL v9 = (const void *)v8;
      BOOL v10 = SecCertificateCopySerialNumberData(*a2, 0LL);
      if (v10)
      {
        uint64_t v11 = v10;
        if (CFDataGetLength(v10) >= 1 && *(void *)(v7 + 8) <= 0x7FFFFFFFFFFFFFFEuLL)
        {
          uint64_t v12 = *a1;
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 0x40000000LL;
          void v23[2] = sub_100022254;
          void v23[3] = &unk_100077188;
          v23[4] = &v24;
          v23[5] = &v28;
          v23[8] = v9;
          _OWORD v23[9] = v7;
          *(double *)&v23[10] = a3;
          v23[6] = &v32;
          v23[7] = v11;
          BOOL v13 = sub_10000D038(v12, (uint64_t)(v29 + 3), (uint64_t)v23);
          if (*((_BYTE *)v25 + 24)) {
            BOOL v14 = v13;
          }
          else {
            BOOL v14 = 0;
          }
          *((_BYTE *)v25 + 24) = v14;
        }

        CFRelease(v11);
      }

      CFRelease(v9);
    }
  }

  if (!*((_BYTE *)v25 + 24) || v29[3])
  {
    BOOL v15 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = v29[3];
      *(_DWORD *)__int128 buf = 138412290;
      uint64_t v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ocsp cache lookup failed: %@", buf, 0xCu);
    }

    uint64_t v17 = (const void **)v33[3];
    if (v17)
    {
      sub_10002CDB8(v17);
      v33[3] = 0LL;
    }

    BOOL v18 = (__CFError *)v29[3];
    if (v18) {
      CFIndex Code = CFErrorGetCode(v18);
    }
    else {
      CFIndex Code = -2070LL;
    }
    sub_10004ADB8(2LL, 3LL, Code);
    uint64_t v20 = (const void *)v29[3];
    if (v20) {
      CFRelease(v20);
    }
  }

  uint64_t v21 = v33[3];
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);
  return v21;
}

unint64_t sub_100022254(uint64_t a1, uint64_t a2)
{
  v11[0] = _NSConcreteStackBlock;
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 80);
  __int128 v6 = *(_OWORD *)(a1 + 40);
  uint64_t v7 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v11[1] = 0x40000000LL;
  void v11[2] = sub_100022308;
  void v11[3] = &unk_100077160;
  void v11[4] = v3;
  uint64_t v13 = v4;
  uint64_t v14 = a2;
  __int128 v15 = *(_OWORD *)(a1 + 64);
  uint64_t v16 = v5;
  __int128 v12 = v6;
  unint64_t result = sub_10000B220(a2, @"SELECT DISTINCT hashAlgorithm FROM ocsp WHERE serialNum=?", v7, (uint64_t)v11);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v9 + 24)) {
    char v10 = result;
  }
  else {
    char v10 = 0;
  }
  *(_BYTE *)(v9 + 24) = v10;
  return result;
}

uint64_t sub_100022308(uint64_t a1, sqlite3_stmt *a2)
{
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 56));
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 56));
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_10000D114( a2,  1LL,  BytePtr,  Length,  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL)
                                                                             + 24LL));
  v16[0] = _NSConcreteStackBlock;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 56);
  uint64_t v8 = *(void *)(a1 + 64);
  __int128 v10 = *(_OWORD *)(a1 + 40);
  uint64_t v11 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v16[1] = 0x40000000LL;
  _DWORD v16[2] = sub_100022410;
  v16[3] = &unk_100077138;
  BOOL v18 = a2;
  __int128 v19 = *(_OWORD *)(a1 + 72);
  v16[4] = v6;
  uint64_t v20 = v8;
  uint64_t v21 = v7;
  uint64_t v22 = v9;
  __int128 v17 = v10;
  char v12 = sub_10000AC3C(v8, a2, v11, (uint64_t)v16);
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v13 + 24)) {
    char v14 = v12;
  }
  else {
    char v14 = 0;
  }
  *(_BYTE *)(v13 + 24) = v14;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

void sub_100022410(uint64_t a1)
{
  if ((sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 56), 0) & 0x80000000) == 0)
  {
    *((void *)&v18 + 1) = sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 56), 0);
    *(void *)&__int128 v18 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 56), 0);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
    CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 64));
    uint64_t v4 = (const __CFData *)SecDigestCreate(kCFAllocatorDefault, &v18, 0LL, BytePtr, Length);
    uint64_t v5 = (const __CFData *)SecDigestCreate( kCFAllocatorDefault,  &v18,  0LL,  **(void **)(a1 + 72),  *(void *)(*(void *)(a1 + 72) + 8LL));
    if (v4)
    {
      if (CFDataGetLength(v4) >= 1 && v5 != 0LL && CFDataGetLength(v5) >= 1)
      {
        uint64_t v7 = *(void *)(a1 + 32);
        if (*(_BYTE *)(*(void *)(v7 + 8) + 24LL))
        {
          v15[0] = _NSConcreteStackBlock;
          uint64_t v8 = *(void *)(a1 + 40);
          uint64_t v9 = *(void *)(a1 + 48);
          uint64_t v10 = *(void *)(v8 + 8);
          unint64_t v15[2] = sub_1000225A0;
          v15[3] = &unk_100077110;
          uint64_t v11 = *(void *)(a1 + 80);
          v15[1] = 0x40000000LL;
          v15[7] = *(void *)(a1 + 88);
          v15[4] = v7;
          void v15[5] = v8;
          v15[8] = v4;
          v15[9] = v5;
          v15[10] = *(void *)(a1 + 96);
          __int128 v16 = v18;
          uint64_t v17 = v11;
          void v15[6] = v9;
          char v12 = sub_10000B220( v11,  @"SELECT ocspResponse,responseId FROM responses WHERE lastUsed>? AND responseId=(SELECT responseId FROM ocsp WHERE issuerNameHash=? AND issuerPubKeyHash=? AND serialNum=? AND hashAlgorithm=?) ORDER BY expires DESC",  (CFTypeRef *)(v10 + 24),  (uint64_t)v15);
          uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 8LL);
          if (*(_BYTE *)(v13 + 24)) {
            char v14 = v12;
          }
          else {
            char v14 = 0;
          }
          *(_BYTE *)(v13 + 24) = v14;
        }
      }

      CFRelease(v4);
    }

    if (v5) {
      CFRelease(v5);
    }
  }

uint64_t sub_1000225A0(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4 = (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  uint64_t v5 = sqlite3_bind_double(a2, 1, *(double *)(a1 + 56));
  BOOL v6 = sub_100009708(v5, a2, v4, @"bind_double[%d]", 1LL);
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v7 + 24)) {
    BOOL v8 = v6;
  }
  else {
    BOOL v8 = 0;
  }
  *(_BYTE *)(v7 + 24) = v8;
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 64));
  CFIndex Length = CFDataGetLength(*(CFDataRef *)(a1 + 64));
  BOOL v11 = sub_10000D114(a2, 2LL, BytePtr, Length, (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v12 + 24)) {
    BOOL v13 = v11;
  }
  else {
    BOOL v13 = 0;
  }
  *(_BYTE *)(v12 + 24) = v13;
  char v14 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 72));
  CFIndex v15 = CFDataGetLength(*(CFDataRef *)(a1 + 72));
  BOOL v16 = sub_10000D114(a2, 3LL, v14, v15, (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v17 + 24)) {
    BOOL v18 = v16;
  }
  else {
    BOOL v18 = 0;
  }
  *(_BYTE *)(v17 + 24) = v18;
  __int128 v19 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 80));
  CFIndex v20 = CFDataGetLength(*(CFDataRef *)(a1 + 80));
  BOOL v21 = sub_10000D114(a2, 4LL, v19, v20, (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v22 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v22 + 24)) {
    BOOL v23 = v21;
  }
  else {
    BOOL v23 = 0;
  }
  *(_BYTE *)(v22 + 24) = v23;
  BOOL v24 = sub_10000D114( a2,  5LL,  *(const void **)(a1 + 96),  *(void *)(a1 + 88),  (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v25 + 24)) {
    BOOL v26 = v24;
  }
  else {
    BOOL v26 = 0;
  }
  *(_BYTE *)(v25 + 24) = v26;
  uint64_t v27 = *(void *)(a1 + 48);
  uint64_t v28 = *(void *)(*(void *)(a1 + 40) + 8LL);
  v34[0] = _NSConcreteStackBlock;
  _OWORD v34[2] = sub_1000227A8;
  v34[3] = &unk_1000770E8;
  uint64_t v29 = *(void *)(a1 + 104);
  v34[1] = 0x40000000LL;
  v34[4] = v27;
  v34[5] = a2;
  char v30 = sub_10000AC3C(v29, a2, (CFTypeRef *)(v28 + 24), (uint64_t)v34);
  uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v31 + 24)) {
    char v32 = v30;
  }
  else {
    char v32 = 0;
  }
  *(_BYTE *)(v31 + 24) = v32;
  return *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL);
}

void sub_1000227A8(uint64_t a1)
{
  uint64_t v2 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 40), 0);
  int v3 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 40), 0);
  uint64_t v4 = CFDataCreate(kCFAllocatorDefault, v2, v3);
  sqlite3_int64 v5 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 40), 1);
  if (v4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = sub_10002C1B4(v4, v5);
    CFRelease(v4);
  }

uint64_t sub_100022844(uint64_t a1, uint64_t *a2)
{
  uint64_t result = sub_100021FE8(a2, *(SecCertificateRef **)(a1 + 40), *(double *)(a1 + 56));
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = result;
  return result;
}

uint64_t sub_100022880(uint64_t a1)
{
  uint64_t v4 = 0LL;
  sqlite3_int64 v5 = &v4;
  uint64_t v6 = 0x2000000000LL;
  char v7 = 0;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000LL;
  v3[2] = sub_100022908;
  unint64_t v3[3] = &unk_100076ED0;
  v3[4] = &v4;
  v3[5] = a1;
  sub_100020FDC((uint64_t)v3);
  uint64_t v1 = *((unsigned __int8 *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100022908(uint64_t a1, uint64_t *a2)
{
  int v3 = *(void **)(a1 + 40);
  uint64_t v16 = 0LL;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2000000000LL;
  __int128 v19 = 0LL;
  uint64_t v12 = 0LL;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2000000000LL;
  char v15 = 1;
  uint64_t v4 = *a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000LL;
  void v11[2] = sub_100022A3C;
  void v11[3] = &unk_1000771B0;
  void v11[4] = &v12;
  void v11[5] = &v16;
  int v5 = sub_10000D098(v4, &v19, (uint64_t)v11);
  if (*((_BYTE *)v13 + 24)) {
    int v6 = v5;
  }
  else {
    int v6 = 0;
  }
  *((_BYTE *)v13 + 24) = v6;
  char v7 = (__CFError *)v17[3];
  if (v6 == 1)
  {
    if (!v7) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }

  if (v7)
  {
LABEL_8:
    CFIndex Code = CFErrorGetCode(v7);
    goto LABEL_10;
  }

  CFIndex Code = -2070LL;
LABEL_10:
  sub_10004ADB8(2LL, 2LL, Code);
  uint64_t v9 = (const void *)v17[3];
  if (v9)
  {
    if (v3 && !*v3) {
      *int v3 = v9;
    }
    else {
      CFRelease(v9);
    }
  }

uint64_t sub_100022A3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_100009ED0( a2,  @"DELETE FROM ocsp WHERE certStatus!=1; DELETE FROM responses WHERE responseId NOT IN (SELECT responseId FROM ocsp WHERE certStatus=1)",
             (CFTypeRef *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL));
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  if (*(_BYTE *)(v4 + 24)) {
    char v5 = result;
  }
  else {
    char v5 = 0;
  }
  *(_BYTE *)(v4 + 24) = v5;
  return result;
}

void sub_100022A90(const void **a1)
{
  uint64_t v2 = a1[5];
  if (v2)
  {
    a1[5] = 0LL;
    CFRelease(v2);
  }

  int v3 = a1[6];
  if (v3)
  {
    a1[6] = 0LL;
    CFRelease(v3);
  }

  uint64_t v4 = a1[7];
  if (v4)
  {
    a1[7] = 0LL;
    CFRelease(v4);
  }

  char v5 = *a1;
  if (*a1)
  {
    *a1 = 0LL;
    CFRelease(v5);
  }

  int v6 = a1[1];
  if (v6)
  {
    a1[1] = 0LL;
    CFRelease(v6);
  }

  char v7 = a1[2];
  if (v7)
  {
    a1[2] = 0LL;
    CFRelease(v7);
  }

  free(a1);
}

void *sub_100022B10(const void *a1, const void *a2)
{
  uint64_t v4 = calloc(1uLL, 0x40uLL);
  if (v4)
  {
    if (a1) {
      CFRetain(a1);
    }
    *uint64_t v4 = a1;
    if (a2) {
      CFRetain(a2);
    }
    v4[1] = a2;
  }

  return v4;
}

void sub_100022B70(uint64_t *a1)
{
  uint64_t v2 = *(const __CFDictionary **)(*a1 + 112);
  if (v2) {
    CFRetain(*(CFTypeRef *)(*a1 + 112));
  }
  else {
    uint64_t v2 = (const __CFDictionary *)sub_100018A28();
  }
  CFTypeRef v8 = 0LL;
  CFTypeRef cf = 0LL;
  __int16 v7 = 0;
  uint64_t v6 = 0LL;
  uint64_t v3 = *(void *)(*a1 + 200);
  *(_BYTE *)(v3 + 66) = 0;
  int v4 = sub_100022C64( (uint64_t)a1,  v2,  (CFMutableDictionaryRef *)&cf,  (CFMutableDictionaryRef *)&v8,  (_BYTE *)&v7 + 1,  &v7);
  char v5 = (const __CFDictionary *)cf;
  if (v4)
  {
    sub_10002368C((uint64_t)a1, v5, v6);
  }

  if (v5) {
    CFRelease(v5);
  }
  if (v8) {
    CFRelease(v8);
  }
  if (v2) {
    CFRelease(v2);
  }
}

uint64_t sub_100022C64( uint64_t a1, const __CFDictionary *a2, CFMutableDictionaryRef *a3, CFMutableDictionaryRef *a4, _BYTE *a5, _BYTE *a6)
{
  uint64_t v9 = *(void *)(*(void *)a1 + 200LL);
  else {
    uint64_t v11 = 0LL;
  }
  uint64_t v12 = SecCertificateCopySignedCertificateTimestamps(v11);
  BOOL v13 = *(const __CFArray **)(*(void *)a1 + 104LL);
  if (v13) {
    CFRetain(*(CFTypeRef *)(*(void *)a1 + 104LL));
  }
  uint64_t v14 = sub_10002380C(a1);
  char v15 = *(uint64_t **)(*(void *)a1 + 200LL);
  off_t v62 = a6;
  __int16 v63 = a5;
  uint64_t v65 = (const __CFArray *)v12;
  if (!v15 || v15[2] < 2 || ((v16 = v15[17]) == 0 ? (uint64_t v17 = 0LL) : (uint64_t v17 = *(void *)(v16 + 16)), (v18 = v15[18]) == 0))
  {
    CFMutableDictionaryRef Mutable = 0LL;
    goto LABEL_27;
  }

  CFMutableDictionaryRef Mutable = 0LL;
  if (v17)
  {
    uint64_t v20 = *(void *)(v18 + 16);
    if (v20)
    {
      BOOL v21 = (const __CFData *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest(v20);
      uint64_t v22 = (const __CFData *)SecCertificateCopyPrecertTBS(v17);
      BOOL v23 = v22;
      if (v21) {
        BOOL v24 = v22 == 0LL;
      }
      else {
        BOOL v24 = 1;
      }
      if (v24)
      {
        CFMutableDictionaryRef Mutable = 0LL;
        if (!v21)
        {
LABEL_23:
          if (v23) {
            CFRelease(v23);
          }
          goto LABEL_27;
        }
      }

      else if (CFDataGetLength(v22) < 1)
      {
        CFMutableDictionaryRef Mutable = 0LL;
      }

      else
      {
        CFIndex Length = CFDataGetLength(v21);
        CFIndex v26 = CFDataGetLength(v23);
        CFMutableDictionaryRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, Length + v26 + 3);
        CFIndex v27 = CFDataGetLength(v21);
        CFIndex v28 = CFDataGetLength(v23);
        CFDataSetLength(Mutable, v27 + v28 + 3);
        MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
        char v30 = v14;
        BytePtr = CFDataGetBytePtr(v21);
        size_t v32 = CFDataGetLength(v21);
        memcpy(MutableBytePtr, BytePtr, v32);
        uint64_t v33 = &MutableBytePtr[CFDataGetLength(v21)];
        CFIndex v34 = CFDataGetLength(v23);
        *uint64_t v33 = BYTE2(v34);
        v33[1] = BYTE1(v34);
        v33[2] = v34;
        uint64_t v35 = CFDataGetBytePtr(v23);
        size_t v36 = CFDataGetLength(v23);
        uint64_t v37 = v35;
        uint64_t v14 = v30;
        memcpy(v33 + 3, v37, v36);
      }

      CFRelease(v21);
      goto LABEL_23;
    }
  }

LABEL_27:
  uint64_t v38 = *(void *)(*(void *)a1 + 200LL);
  else {
    uint64_t v40 = 0LL;
  }
  unint64_t v41 = Mutable;
  if (SecCertificateGetLength(v40) < 0)
  {
    int v43 = 0LL;
  }

  else
  {
    uint64_t v42 = SecCertificateGetLength(v40);
    int v43 = CFDataCreateMutable(kCFAllocatorDefault, v42 + 3);
    uint64_t v44 = SecCertificateGetLength(v40);
    CFDataSetLength(v43, v44 + 3);
    uint64_t v45 = v14;
    BOOL v46 = CFDataGetMutableBytePtr(v43);
    uint64_t v47 = SecCertificateGetLength(v40);
    *BOOL v46 = BYTE2(v47);
    v46[1] = BYTE1(v47);
    unint64_t v46[2] = v47;
    id v48 = (const void *)SecCertificateGetBytePtr(v40);
    size_t v49 = SecCertificateGetLength(v40);
    size_t v50 = v46 + 3;
    uint64_t v14 = v45;
    memcpy(v50, v48, v49);
  }

  v78[0] = 0LL;
  v78[1] = v78;
  v78[2] = 0x2020000000LL;
  double v79 = NAN;
  double v79 = SecCertificateNotValidAfter(v11);
  CFMutableDictionaryRef v51 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v52 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  double v53 = *(double *)(*(void *)a1 + 120LL);
  uint64_t v74 = 0LL;
  id v75 = &v74;
  uint64_t v76 = 0x2020000000LL;
  char v77 = 0;
  uint64_t v70 = 0LL;
  uint64_t v71 = &v70;
  uint64_t v72 = 0x2020000000LL;
  char v73 = 0;
  if (v52)
  {
    if (!v51
      || (!v65 || CFArrayGetCount(v65) <= 0)
      && (!v13 || CFArrayGetCount(v13) <= 0)
      && (!v14 || CFArrayGetCount(v14) <= 0))
    {
      goto LABEL_56;
    }

    if (a2 && CFDictionaryGetCount(a2) >= 1)
    {
      unint64_t v54 = (unint64_t)(v53 + kCFAbsoluteTimeIntervalSince1970);
      uint64_t v55 = 1000 * v54;
      if (v65 && v41)
      {
        v69[0] = _NSConcreteStackBlock;
        v69[1] = 3221225472LL;
        v69[2] = sub_100023BD0;
        v69[3] = &unk_1000771D8;
        v69[6] = v41;
        v69[7] = 1000 * v54;
        v69[8] = a2;
        v69[9] = v52;
        v69[10] = v51;
        v69[4] = v78;
        v69[5] = &v70;
        char v56 = v69;
        v80.CFIndex length = CFArrayGetCount(v65);
        v80.CFIndex location = 0LL;
        CFArrayApplyFunction(v65, v80, (CFArrayApplierFunction)sub_1000239F4, v56);
      }

      if (v13 && v43)
      {
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472LL;
        v68[2] = sub_100023C78;
        v68[3] = &unk_100077200;
        v68[6] = v43;
        v68[7] = v55;
        v68[8] = a2;
        v68[9] = v51;
        v68[4] = v78;
        v68[5] = &v74;
        CFRange v57 = v68;
        v81.CFIndex length = CFArrayGetCount(v13);
        v81.CFIndex location = 0LL;
        CFArrayApplyFunction(v13, v81, (CFArrayApplierFunction)sub_1000239F4, v57);
      }

      if (v14 && v43)
      {
        v67[0] = _NSConcreteStackBlock;
        v67[1] = 3221225472LL;
        v67[2] = sub_100023CEC;
        v67[3] = &unk_100077200;
        v67[6] = v43;
        v67[7] = v55;
        v67[8] = a2;
        v67[9] = v51;
        v67[4] = v78;
        v67[5] = &v74;
        dispatch_semaphore_t v58 = v67;
        v82.CFIndex length = CFArrayGetCount(v14);
        v82.CFIndex location = 0LL;
        CFArrayApplyFunction(v14, v82, (CFArrayApplierFunction)sub_1000239F4, v58);
      }
    }

    if (CFDictionaryGetCount(v51) >= 1)
    {
      CFRetain(v51);
      *a3 = v51;
      CFRetain(v52);
      *a4 = v52;
      *off_t v62 = *((_BYTE *)v71 + 24);
      *__int16 v63 = *((_BYTE *)v75 + 24);
      uint64_t v59 = 1LL;
    }

    else
    {
LABEL_56:
      uint64_t v59 = 0LL;
    }

    CFRelease(v52);
    if (v51) {
      goto LABEL_58;
    }
  }

  else
  {
    uint64_t v59 = 0LL;
    if (v51) {
LABEL_58:
    }
      CFRelease(v51);
  }

  if (v13) {
    CFRelease(v13);
  }
  if (v65) {
    CFRelease(v65);
  }
  if (v14) {
    CFRelease(v14);
  }
  if (v41) {
    CFRelease(v41);
  }
  if (v43) {
    CFRelease(v43);
  }
  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(v78, 8);
  return v59;
}

void sub_1000232E8(_Unwind_Exception *a1)
{
}

BOOL sub_100023348( uint64_t *a1, CFDictionaryRef theDict, const __CFDictionary *a3, int a4, int a5, void *a6)
{
  BOOL v6 = 0LL;
  if (theDict && a3)
  {
    uint64_t v38 = 0LL;
    uint64_t v39 = &v38;
    uint64_t v13 = *a1;
    uint64_t v14 = *(void *)(*a1 + 120);
    uint64_t v40 = 0x2020000000LL;
    uint64_t v41 = v14;
    uint64_t v15 = *(void *)(v13 + 200);
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v34 = 0LL;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000LL;
    CFIndex Count = 0xAAAAAAAAAAAAAAAALL;
    CFIndex Count = CFDictionaryGetCount(theDict);
    if (a4)
    {
      BOOL v6 = CFDictionaryGetCount(theDict) > 1;
      if (!a5) {
        goto LABEL_28;
      }
    }

    else
    {
      BOOL v6 = 0LL;
      if (!a5)
      {
LABEL_28:
        *a6 = v35[3];
        _Block_object_dispose(&v34, 8);
        _Block_object_dispose(&v38, 8);
        return v6;
      }
    }

    uint64_t v18 = *(void *)(*a1 + 200);
    context[0] = _NSConcreteStackBlock;
    context[1] = 3221225472LL;
    context[2] = sub_100023A08;
    void context[3] = &unk_100077248;
    context[4] = &v38;
    CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_100023A60, context);
    *(void *)(v18 + 12_Block_object_dispose((const void *)(v1 - 136), 8) = v39[3];
    if (v6)
    {
      BOOL v6 = 1LL;
    }

    else
    {
      uint64_t v29 = 0LL;
      char v30 = &v29;
      uint64_t v31 = 0x2020000000LL;
      int v32 = 0;
      v27[0] = 0LL;
      v27[1] = v27;
      void v27[2] = 0x2020000000LL;
      char v28 = 0;
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472LL;
      unint64_t v26[2] = sub_100023A78;
      v26[3] = &unk_100077270;
      v26[4] = &v29;
      v26[5] = &v38;
      v26[6] = &v34;
      v26[7] = v27;
      CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)sub_100023A60, v26);
      double v19 = SecCertificateNotValidBefore(v17);
      unsigned int v20 = *((_DWORD *)v30 + 6);
      if (v19 >= 640656000.0)
      {
        double v23 = SecCertificateNotValidAfter(v17);
        double v24 = v23 - SecCertificateNotValidBefore(v17);
        if (v24 <= 15552000.0)
        {
          unsigned int v22 = 2;
        }

        else if (v24 <= 71280000.0)
        {
          unsigned int v22 = 3;
        }

        else
        {
          unsigned int v22 = 4;
        }
      }

      else
      {
        uint64_t v43 = 0LL;
        uint64_t v44 = &v43;
        uint64_t v45 = 0x2020000000LL;
        int v46 = 60;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        unint64_t v42[2] = sub_100023B4C;
        v42[3] = &unk_100079280;
        v42[4] = &v43;
        v42[5] = v17;
        sub_100008B98((uint64_t)v42);
        int v21 = *((_DWORD *)v44 + 6);
        if (v21 >= 15)
        {
          if (v21 >= 0x1C)
          {
            else {
              unsigned int v22 = 5;
            }
          }

          else
          {
            unsigned int v22 = 3;
          }
        }

        else
        {
          unsigned int v22 = 2;
        }

        _Block_object_dispose(&v43, 8);
      }

      BOOL v6 = v22 <= v20;
      _Block_object_dispose(v27, 8);
      _Block_object_dispose(&v29, 8);
    }

    goto LABEL_28;
  }

  return v6;
}

void sub_100023638( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20, uint64_t a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, char a31, uint64_t a32, uint64_t a33, uint64_t a34, char a35)
{
}

void sub_10002368C(uint64_t a1, const __CFDictionary *a2, int a3)
{
  uint64_t v3 = *(void *)a1;
  if (!*(void *)a1) {
    return;
  }
  uint64_t v4 = *(void *)(v3 + 272);
  if (!v4) {
    return;
  }
  uint64_t v8 = *(void *)(v3 + 200);
  else {
    uint64_t v10 = 0LL;
  }
  uint64_t v11 = (const __CFArray *)SecCertificateCopySignedCertificateTimestamps(v10);
  uint64_t v12 = *(const __CFArray **)(*(void *)a1 + 104LL);
  if (v12) {
    CFRetain(*(CFTypeRef *)(*(void *)a1 + 104LL));
  }
  uint64_t v13 = sub_10002380C(a1);
  if (!v11 || CFArrayGetCount(v11) < 1)
  {
    CFIndex Count = 0LL;
    if (!v12) {
      goto LABEL_17;
    }
LABEL_15:
    if (CFArrayGetCount(v12) >= 1)
    {
      *(_BYTE *)(v4 + 11) |= 4u;
      Count += CFArrayGetCount(v12);
    }

    goto LABEL_17;
  }

  *(_BYTE *)(v4 + 11) |= 1u;
  CFIndex Count = CFArrayGetCount(v11);
  if (v12) {
    goto LABEL_15;
  }
LABEL_17:
  if (v13 && CFArrayGetCount(v13) >= 1)
  {
    *(_BYTE *)(v4 + 11) |= 2u;
    LODWORD(Count) = CFArrayGetCount(v13) + Count;
  }

  *(_DWORD *)(v4 + 12) = Count;
  *(_DWORD *)(v4 + 16) = a3;
  if (CFDictionaryGetCount(a2) == 1) {
    *(_BYTE *)(v4 + 2syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 1;
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v12) {
    CFRelease(v12);
  }
  if (v13) {
    CFRelease(v13);
  }
}

CFMutableArrayRef sub_10002380C(uint64_t a1)
{
  uint64_t v1 = *(const void **)(*(void *)a1 + 96LL);
  if (!v1) {
    return 0LL;
  }
  CFRetain(*(CFTypeRef *)(*(void *)a1 + 96LL));
  uint64_t v3 = *(uint64_t **)(*(void *)a1 + 200LL);
  if (!v3
    || v3[2] < 2
    || ((v4 = v3[17]) == 0 ? (char v5 = 0LL) : (char v5 = *(const void **)(v4 + 16)),
        (v6 = v3[18]) == 0 || !v5 || (__int16 v7 = *(const void **)(v6 + 16)) == 0LL))
  {
    CFRelease(v1);
    return 0LL;
  }

  uint64_t v8 = (const void **)sub_100022B10(v5, v7);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v10 = Mutable;
  if (Mutable)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    _DWORD v12[2] = sub_10002394C;
    unint64_t v12[3] = &unk_100077220;
    v12[4] = v8;
    v12[5] = Mutable;
    v13.CFIndex length = CFArrayGetCount((CFArrayRef)v1);
    v13.CFIndex location = 0LL;
    CFArrayApplyFunction((CFArrayRef)v1, v13, (CFArrayApplierFunction)sub_1000239F4, v12);
    if (!CFArrayGetCount(v10))
    {
      CFRelease(v10);
      CFMutableArrayRef v10 = 0LL;
    }
  }

  CFRelease(v1);
  if (v8) {
    sub_100022A90(v8);
  }
  return v10;
}

void sub_10002394C(uint64_t a1, const __CFData *a2)
{
  uint64_t v3 = (const void **)sub_10002C1B4(a2, -1LL);
  if (v3)
  {
    uint64_t v4 = v3;
    if (!*((_BYTE *)v3 + 8))
    {
      uint64_t v5 = sub_10002CDEC((uint64_t)v3, *(void *)(a1 + 32));
      if (v5)
      {
        uint64_t v6 = (void *)v5;
        __int16 v7 = *(const __CFArray **)(v5 + 40);
        if (v7)
        {
          CFRetain(*(CFTypeRef *)(v5 + 40));
          uint64_t v8 = *(__CFArray **)(a1 + 40);
          v9.CFIndex length = CFArrayGetCount(v7);
          v9.CFIndex location = 0LL;
          CFArrayAppendArray(v8, v7, v9);
          CFRelease(v7);
        }

        sub_10002B6D8(v6);
      }
    }

    sub_10002CDB8(v4);
  }

uint64_t sub_1000239F4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

void sub_100023A08(uint64_t a1, CFDictionaryRef theDict, const __CFDate *a3)
{
  if (!CFDictionaryContainsKey(theDict, @"expiry"))
  {
    double AbsoluteTime = CFDateGetAbsoluteTime(a3);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8LL);
  }

uint64_t sub_100023A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a3 + 16))(a3, a1, a2);
}

void sub_100023A78(void *a1, CFDictionaryRef theDict, const __CFDate *a3)
{
  Value = (const __CFDate *)CFDictionaryGetValue(theDict, @"expiry");
  if (Value)
  {
    uint64_t v6 = Value;
    if (CFDateCompare(a3, Value, 0LL) == kCFCompareLessThan
      && (double v7 = *(double *)(*(void *)(a1[5] + 8LL) + 24LL), v7 < CFDateGetAbsoluteTime(v6)))
    {
      ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
      ++*(void *)(*(void *)(a1[6] + 8LL) + 24LL);
    }

    else
    {
      *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 1;
    }
  }

  else
  {
    ++*(_DWORD *)(*(void *)(a1[4] + 8LL) + 24LL);
  }

uint64_t sub_100023B4C(uint64_t a1, __CFCalendar *a2)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v9 = *(_DWORD *)(*(void *)(v5 + 8) + 24LL);
  CFAbsoluteTime v6 = SecCertificateNotValidBefore(v4);
  CFAbsoluteTime v7 = SecCertificateNotValidAfter(*(void *)(a1 + 40));
  uint64_t result = CFCalendarGetComponentDifference(a2, v6, v7, 0LL, "M", &v9);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v9;
  return result;
}

void sub_100023BD0(uint64_t a1, const __CFData *a2)
{
  CFAbsoluteTime v6 = NAN;
  uint64_t v3 = sub_100023D60( a2,  1LL,  *(const __CFData **)(a1 + 48),  *(void *)(a1 + 56),  *(const __CFDictionary **)(a1 + 64),  &v6,  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (v3)
  {
    uint64_t v4 = v3;
    CFAbsoluteTime v5 = v6;
    sub_100024320(*(const __CFDictionary **)(a1 + 72), v3, v6);
    if (!CFDictionaryContainsKey(v4, @"expiry"))
    {
      sub_100024320(*(const __CFDictionary **)(a1 + 80), v4, v5);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    }
  }

void sub_100023C78(uint64_t a1, const __CFData *a2)
{
  CFAbsoluteTime v4 = NAN;
  uint64_t v3 = sub_100023D60( a2,  0LL,  *(const __CFData **)(a1 + 48),  *(void *)(a1 + 56),  *(const __CFDictionary **)(a1 + 64),  &v4,  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (v3)
  {
    sub_100024320(*(const __CFDictionary **)(a1 + 72), v3, v4);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

void sub_100023CEC(uint64_t a1, const __CFData *a2)
{
  CFAbsoluteTime v4 = NAN;
  uint64_t v3 = sub_100023D60( a2,  0LL,  *(const __CFData **)(a1 + 48),  *(void *)(a1 + 56),  *(const __CFDictionary **)(a1 + 64),  &v4,  *(CFAbsoluteTime *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
  if (v3)
  {
    sub_100024320(*(const __CFDictionary **)(a1 + 72), v3, v4);
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

CFDictionaryRef sub_100023D60( const __CFData *a1, uint64_t a2, const __CFData *a3, unint64_t a4, const __CFDictionary *a5, double *a6, CFAbsoluteTime a7)
{
  v13.CFIndex Length = 0xAAAAAAAAAAAAAAAALL;
  v13.Data = (uint8_t *)0xAAAAAAAAAAAAAAAALL;
  SecAsn1Oid v66 = v13;
  SecAsn1Oid v67 = v13;
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  uint64_t v16 = BytePtr[41];
  uint64_t v17 = BytePtr[42];
  unint64_t v18 = v17 | (v16 << 8);
  unint64_t v19 = Length - 43 - v18;
  if (Length - 43 < v18) {
    goto LABEL_16;
  }
  BOOL v20 = v19 >= 4;
  unint64_t v21 = v19 - 4;
  if (!v20) {
    goto LABEL_16;
  }
  unsigned int v22 = BytePtr + 43;
  double v23 = &BytePtr[v18 + 43];
  uint64_t v24 = __rev16(*((unsigned __int16 *)v23 + 1));
  if (v21 != v24) {
    goto LABEL_16;
  }
  int v25 = *BytePtr;
  if (*BytePtr)
  {
    CFIndex v26 = sub_10000856C("SecError");
    CFIndex v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 67109120;
      LODWORD(v69) = v25;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "SCT version unsupported: %d\n", buf, 8u);
    }

    goto LABEL_16;
  }

  __int16 v63 = a6;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  char v30 = (UInt8 *)(BytePtr + 1);
  uint64_t v31 = BytePtr + 33;
  int v32 = *v23;
  do
    uint64_t v29 = *((unsigned __int8 *v31 + v28++) | ((void)v29 << 8));
  while ((_DWORD)v28 != 8);
  if ((unint64_t)v29 > a4)
  {
    uint64_t v33 = sub_10000856C("SecError");
    uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 134218240;
      id v69 = v29;
      __int16 v70 = 2048;
      unint64_t v71 = a4;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "SCT is in the future: %llu > %llu\n",  buf,  0x16u);
    }

    goto LABEL_16;
  }

  bytesa = v30;
  int v61 = v23[1];
  dispatch_semaphore_t v58 = (unsigned __int8 *)(v23 + 4);
  uint64_t v59 = v24;
  if (CFDataGetLength(a3) < 1
    || CFDataGetLength(a3) > 1048574
    || (v60 = v32, v57 = v18 + CFDataGetLength(a3) + 14, (uint64_t v38 = (char *)malloc(v57)) == 0LL))
  {
LABEL_16:
    uint64_t v35 = 0LL;
    uint64_t v36 = 0LL;
    goto LABEL_17;
  }

  *(_WORD *)uint64_t v38 = 0;
  *(void *)(v38 + 2) = *v31;
  v38[10] = 0;
  v38[11] = a2;
  off_t v62 = v38;
  uint64_t v39 = v38 + 12;
  uint64_t v40 = CFDataGetBytePtr(a3);
  size_t v41 = CFDataGetLength(a3);
  memcpy(v39, v40, v41);
  uint64_t v42 = &v39[CFDataGetLength(a3)];
  *uint64_t v42 = v16;
  v42[1] = v17;
  memcpy(v42 + 2, v22, v17 | (v16 << 8));
  CFDataRef v43 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, bytesa, 32LL, kCFAllocatorNull);
  Value = (const __CFDictionary *)CFDictionaryGetValue(a5, v43);
  uint64_t v36 = Value;
  if (!Value)
  {
    double v53 = 0LL;
LABEL_45:
    uint64_t v35 = v62;
    if (!v43) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }

  if (!a2 && CFDictionaryContainsKey(Value, @"expiry"))
  {
    double v53 = 0LL;
    uint64_t v36 = 0LL;
    goto LABEL_45;
  }

  double v45 = (double)((unint64_t)v29 / 0x3E8) - kCFAbsoluteTimeIntervalSince1970;
  int v46 = (const __CFDate *)CFDictionaryGetValue(v36, @"frozen");
  if (v46 && CFDateGetAbsoluteTime(v46) < v45)
  {
    uint64_t v47 = sub_10000856C("SecError");
    id v48 = (os_log_s *)objc_claimAutoreleasedReturnValue(v47);
    uint64_t v35 = v62;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v69 = v36;
      _os_log_impl( (void *)&_mh_execute_header,  v48,  OS_LOG_TYPE_DEFAULT,  "Frozen CT log issued SCT after freezing (log=%@)\n",  buf,  0xCu);
    }

    goto LABEL_40;
  }

  size_t v49 = (const __CFDate *)CFDictionaryGetValue(v36, @"start_inclusive");
  size_t v50 = (const __CFDate *)CFDictionaryGetValue(v36, @"end_exclusive");
  uint64_t v35 = v62;
  if (v49 && CFDateGetAbsoluteTime(v49) > a7
    || v50 && CFDateGetAbsoluteTime(v50) <= a7
    || (CFMutableDictionaryRef v51 = CFDictionaryGetValue(v36, @"key")) == 0LL)
  {
LABEL_40:
    double v53 = 0LL;
    goto LABEL_41;
  }

  uint64_t v52 = SecKeyCreateFromSubjectPublicKeyInfoData(kCFAllocatorDefault, v51);
  double v53 = (const void *)v52;
  if (!v52) {
    goto LABEL_41;
  }
  if (v61 == 3)
  {
    switch(v60)
    {
      case 2:
        unint64_t v54 = &CSSMOID_ECDSA_WithSHA1;
        break;
      case 5:
        unint64_t v54 = &CSSMOID_ECDSA_WithSHA384;
        break;
      case 4:
        unint64_t v54 = &CSSMOID_ECDSA_WithSHA256;
        break;
      default:
        goto LABEL_41;
    }
  }

  else
  {
    if (v61 != 1) {
      goto LABEL_41;
    }
    switch(v60)
    {
      case 2:
        unint64_t v54 = &CSSMOID_SHA1WithRSA;
        break;
      case 5:
        unint64_t v54 = &CSSMOID_SHA384WithRSA;
        break;
      case 4:
        unint64_t v54 = &CSSMOID_SHA256WithRSA;
        break;
      default:
        goto LABEL_41;
    }
  }

  SecAsn1Oid v66 = *v54;
  SecAsn1Oid v67 = (SecAsn1Oid)0LL;
  if (SecKeyDigestAndVerify(v52, &v66, v62, v57, v58, v59))
  {
    uint64_t v55 = sub_10000856C("SecError");
    char v56 = (os_log_s *)objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      id v69 = v36;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "SCT signature failed (log=%@)\n", buf, 0xCu);
    }

LABEL_41:
    uint64_t v36 = 0LL;
    if (!v43) {
      goto LABEL_47;
    }
LABEL_46:
    CFRelease(v43);
    goto LABEL_47;
  }

  *__int16 v63 = v45;
  if (v43) {
    goto LABEL_46;
  }
LABEL_47:
  if (v53) {
    CFRelease(v53);
  }
LABEL_17:
  free(v35);
  return v36;
}

void sub_100024320(const __CFDictionary *a1, const void *a2, CFAbsoluteTime a3)
{
  Value = (const __CFDate *)CFDictionaryGetValue(a1, a2);
  if (!Value || CFDateGetAbsoluteTime(Value) > a3)
  {
    CFDateRef v7 = CFDateCreate(kCFAllocatorDefault, a3);
    CFDictionarySetValue(a1, a2, v7);
    if (v7) {
      CFRelease(v7);
    }
  }

void sub_1000243AC()
{
  gTrustd = &off_100082818;
  CFErrorRef error = 0LL;
  if (qword_100082D80 != -1) {
    dispatch_once(&qword_100082D80, &stru_100077640);
  }
  if (qword_100082D88 != -1) {
    dispatch_once(&qword_100082D88, &stru_100077660);
  }
  *(void *)v117 = 0LL;
  CFURLRef v0 = sub_100020748();
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  sub_100020764(v1, (CFErrorRef *)v117);

  uint64_t v2 = *(const void **)v117;
  if (*(void *)v117)
  {
    *(void *)v117 = 0LL;
    CFRelease(v2);
    syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
    CFURLRef v3 = sub_10000FBA4(@"Library/Keychains", (uint64_t)@"com.apple.security.exception_reset_counter.plist");
    uint64_t v4 = sub_100020764(v3, 0LL);

    CFURLRef v5 = sub_100020748();
    CFAbsoluteTime v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LOBYTE(v4) = sub_100020B78(v4, v6, (CFErrorRef *)v117);

    if ((v4 & 1) != 0)
    {
      sub_10000FD28((uint64_t)@"com.apple.security.exception_reset_counter.plist", (uint64_t)&stru_100076E38);
    }

    else
    {
      CFDateRef v7 = sub_10000856C("SecError");
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)__int128 buf = 138412290;
        *(void *)&uint8_t buf[4] = *(void *)v117;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Failed to migrate exceptions reset count: %@",  buf,  0xCu);
      }

      int v9 = *(const void **)v117;
      if (*(void *)v117)
      {
        *(void *)v117 = 0LL;
        CFRelease(v9);
      }
    }
  }

  memset(buf, 170, sizeof(buf));
  if (sub_100054110(buf))
  {
    CFMutableArrayRef v10 = fopen((const char *)buf, "r");
    if (v10)
    {
      fclose(v10);
      *(void *)CFIndex v120 = 0LL;
      ppStmt = 0LL;
      db = 0LL;
      v109 = 0LL;
      pStmt = 0LL;
      if (sub_100054CD0((const char *)buf, &db))
      {
        SecAsn1Oid v13 = 0LL;
        goto LABEL_140;
      }

      uint64_t v11 = sqlite3_prepare_v3( db,  "SELECT INSTR(sql,'uuid') FROM sqlite_master WHERE type='table' AND name='tsettings'",  84,  0,  &ppStmt,  0LL);
      if ((_DWORD)v11)
      {
        BOOL v33 = sub_1000095E8(v11, db, (CFTypeRef *)&error, @"failed to prepare findColStmt");
        goto LABEL_61;
      }

      uint64_t v12 = sqlite3_step(ppStmt);
      if ((_DWORD)v12 && (_DWORD)v12 != 101)
      {
        if ((_DWORD)v12 != 100)
        {
          BOOL v33 = sub_100009708(v12, ppStmt, (CFTypeRef *)&error, @"check for uuid column failed");
          goto LABEL_61;
        }

        if (sqlite3_column_int64(ppStmt, 0) > 0)
        {
          SecAsn1Oid v13 = 0LL;
LABEL_104:
          char v34 = 1;
          goto LABEL_141;
        }

        uint64_t v35 = (os_log_s *)sub_10000856C("config");
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v117 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_DEFAULT,  "trust store schema not current, will update",  v117,  2u);
        }
      }

      uint64_t v36 = ppStmt;
      if (!ppStmt || (ppStmt = 0LL, uint64_t v37 = sqlite3_finalize(v36), !(_DWORD)v37))
      {
        SecAsn1Oid v13 = sub_100019E6C(0x11Au);
        if (!v13)
        {
          sub_10000DE88(-50, (__CFString **)&error, @"get uuid failed");
          goto LABEL_140;
        }

        if (!sqlite3_exec(db, "BEGIN EXCLUSIVE TRANSACTION;", 0LL, 0LL, 0LL))
        {
          uint64_t v38 = sqlite3_exec( db,  "CREATE TABLE tmp_tsettings(sha256 BLOB NOT NULL DEFAULT '',subj BLOB NOT NULL DEFAULT '',tset BLOB,dat a BLOB,uuid BLOB NOT NULL DEFAULT '',UNIQUE(sha256,uuid));",
                  0LL,
                  0LL,
                  (char **)v120);
          if (*(void *)v120)
          {
            uint64_t v39 = (os_log_s *)sub_10000856C("SecWarning");
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v117 = 136315138;
              *(void *)&v117[4] = *(void *)v120;
              _os_log_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEFAULT,  "CREATE TABLE tmp_tsettings: %s",  v117,  0xCu);
            }

            sqlite3_free(*(void **)v120);
          }

          if ((_DWORD)v38)
          {
            BOOL v62 = 0;
            goto LABEL_133;
          }

          uint64_t v40 = sqlite3_prepare_v3(db, "SELECT COUNT(*) FROM tsettings", 31, 0, &pStmt, 0LL);
          if ((_DWORD)v40)
          {
            uint64_t v38 = v40;
            uint64_t v47 = db;
            id v48 = @"failed to prepare countAllStmt";
            goto LABEL_106;
          }

          if (sqlite3_step(pStmt) == 100) {
            sqlite3_int64 v41 = sqlite3_column_int64(pStmt, 0);
          }
          else {
            sqlite3_int64 v41 = -1LL;
          }
          uint64_t v42 = pStmt;
          if (pStmt)
          {
            pStmt = 0LL;
            uint64_t v43 = sqlite3_finalize(v42);
            if ((_DWORD)v43)
            {
              uint64_t v38 = v43;
              uint64_t v47 = db;
              id v48 = @"failed to finalize countAllStmt";
              goto LABEL_106;
            }
          }

          uint64_t v44 = (os_log_s *)sub_10000856C("config");
          BOOL v45 = os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
          if (v41 < 1)
          {
            if (v45)
            {
              *(_DWORD *)v117 = 134217984;
              *(void *)&v117[4] = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "no existing tsettings (%lld rows)",  v117,  0xCu);
            }
          }

          else
          {
            if (v45)
            {
              *(_DWORD *)v117 = 134217984;
              *(void *)&v117[4] = v41;
              _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "copying %lld rows from tsettings",  v117,  0xCu);
            }

            uint64_t v46 = sqlite3_exec( db,  "INSERT OR REPLACE INTO tmp_tsettings(sha256,subj,tset,data) SELECT sha256,subj,tset,data FROM tsettings",  0LL,  0LL,  0LL);
            if ((_DWORD)v46)
            {
              uint64_t v38 = v46;
              uint64_t v47 = db;
              id v48 = @"failed to copy table data";
              goto LABEL_106;
            }
          }

          uint64_t v49 = sqlite3_exec(db, "DROP TABLE tsettings;", 0LL, 0LL, 0LL);
          size_t v50 = db;
          if ((_DWORD)v49)
          {
            uint64_t v38 = v49;
            id v48 = @"failed to drop old table";
          }

          else
          {
            uint64_t v51 = sqlite3_exec(db, "ALTER TABLE tmp_tsettings RENAME TO tsettings;", 0LL, 0LL, 0LL);
            if ((_DWORD)v51)
            {
              uint64_t v38 = v51;
              uint64_t v47 = db;
              id v48 = @"failed to rename new table";
              goto LABEL_106;
            }

            if (v41 >= 1)
            {
              uint64_t v52 = sqlite3_prepare_v3(db, "UPDATE tsettings SET uuid=? WHERE uuid=''", 42, 1u, &v109, 0LL);
              if ((_DWORD)v52)
              {
                uint64_t v38 = v52;
                uint64_t v47 = db;
                id v48 = @"failed to prepare updateUUIDStmt";
                goto LABEL_106;
              }

              double v53 = v109;
              BytePtr = CFDataGetBytePtr(v13);
              unint64_t Length = CFDataGetLength(v13);
              if (Length >> 31)
              {
                uint64_t v38 = 18LL;
LABEL_92:
                uint64_t v47 = db;
                id v48 = @"failed to bind uuid value";
                goto LABEL_106;
              }

              uint64_t v56 = sqlite3_bind_blob(v53, 1, BytePtr, Length, 0LL);
              if ((_DWORD)v56)
              {
                uint64_t v38 = v56;
                goto LABEL_92;
              }

              uint64_t v57 = sqlite3_step(v109);
              if ((_DWORD)v57)
              {
                uint64_t v38 = v57;
                if ((_DWORD)v57 != 101)
                {
                  uint64_t v47 = db;
                  id v48 = @"failed to update uuid column";
                  goto LABEL_106;
                }
              }
            }

            uint64_t v58 = sqlite3_exec(db, "DROP INDEX IF EXISTS isubj;", 0LL, 0LL, 0LL);
            size_t v50 = db;
            if ((_DWORD)v58)
            {
              uint64_t v38 = v58;
              id v48 = @"failed to drop old index";
            }

            else
            {
              uint64_t v59 = sqlite3_exec(db, "CREATE INDEX isubj ON tsettings(subj);", 0LL, 0LL, 0LL);
              size_t v50 = db;
              if (!(_DWORD)v59)
              {
                uint64_t v60 = sqlite3_exec(db, "COMMIT TRANSACTION", 0LL, 0LL, 0LL);
                if ((_DWORD)v60)
                {
                  uint64_t v38 = v60;
                  int v61 = (os_log_s *)sub_10000856C("SecError");
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v117 = 67109120;
                    *(_DWORD *)&v117[4] = v38;
                    _os_log_impl( (void *)&_mh_execute_header,  v61,  OS_LOG_TYPE_DEFAULT,  "Failed to commit transaction (%d), will attempt rollback",  v117,  8u);
                  }

                  BOOL v62 = 1;
                  goto LABEL_133;
                }

                __int16 v63 = (os_log_s *)sub_10000856C("config");
                if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)v117 = 0;
                  _os_log_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEFAULT,  "successfully updated trust store schema",  v117,  2u);
                }

                goto LABEL_104;
              }

              uint64_t v38 = v59;
              id v48 = @"failed to recreate index";
            }
          }

          uint64_t v64 = v38;
          uint64_t v47 = v50;
          goto LABEL_132;
        }

LABEL_140:
        while (1)
        {
          char v34 = 0;
LABEL_141:
          if (v109)
          {
            uint64_t v69 = sqlite3_finalize(v109);
            if ((_DWORD)v69) {
              break;
            }
          }

          if (pStmt)
          {
            uint64_t v70 = sqlite3_finalize(pStmt);
            if ((_DWORD)v70)
            {
              BOOL v107 = sub_1000095E8(v70, db, (CFTypeRef *)&error, @"failed to finalize countAllStmt");
              goto LABEL_183;
            }
          }

          if (ppStmt)
          {
            uint64_t v71 = sqlite3_finalize(ppStmt);
            if ((_DWORD)v71)
            {
              BOOL v107 = sub_1000095E8(v71, db, (CFTypeRef *)&error, @"failed to finalize findColStmt");
              goto LABEL_183;
            }
          }

LABEL_147:
          if ((v34 & 1) != 0) {
            goto LABEL_151;
          }
          while (1)
          {
            uint64_t v72 = (os_log_s *)sub_10000856C("SecError");
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v117 = 138412290;
              *(void *)&v117[4] = v13;
              _os_log_impl( (void *)&_mh_execute_header,  v72,  OS_LOG_TYPE_DEFAULT,  "Failed to update schema (uuid %@)",  v117,  0xCu);
            }

            uint64_t v73 = sqlite3_exec(db, "DROP TABLE tsettings;", 0LL, 0LL, 0LL);
            if ((_DWORD)v73) {
              break;
            }
LABEL_151:
            if (!db || (int v74 = sqlite3_close(db)) == 0)
            {
              if (v13) {
                CFRelease(v13);
              }
              if ((v34 & 1) == 0) {
                goto LABEL_157;
              }
              goto LABEL_159;
            }

            sub_1000095A0(v74, (CFTypeRef *)&error, @"failed to close trust store after schema update");
            char v34 = 0;
          }

          uint64_t v38 = v73;
          uint64_t v47 = db;
          id v48 = @"failed to drop tsettings table";
LABEL_106:
          uint64_t v64 = v38;
LABEL_132:
          BOOL v62 = sub_1000095E8(v64, v47, (CFTypeRef *)&error, v48);
LABEL_133:
          uint64_t v65 = (os_log_s *)sub_10000856C("SecError");
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v117 = 67109378;
            *(_DWORD *)&v117[4] = v38;
            *(_WORD *)&v117[8] = 2112;
            *(void *)&v117[10] = error;
            _os_log_impl( (void *)&_mh_execute_header,  v65,  OS_LOG_TYPE_DEFAULT,  "Failed to update trust store: (%d) %@",  v117,  0x12u);
          }

          sub_10004ADB8(4LL, 2LL, (int)v38);
          if (v62) {
            sub_10000DE88(-26276, (__CFString **)&error, @"sqlite3 error: %d", v38);
          }
          int v66 = sqlite3_exec(db, "ROLLBACK TRANSACTION", 0LL, 0LL, 0LL);
          if (v66)
          {
            int v67 = v66;
            uint64_t v68 = (os_log_s *)sub_10000856C("SecError");
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v117 = 67109378;
              *(_DWORD *)&v117[4] = v67;
              *(_WORD *)&v117[8] = 2112;
              *(void *)&v117[10] = error;
              _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_DEFAULT,  "Failed to rollback transaction (%d) %@",  v117,  0x12u);
            }
          }
        }

        BOOL v107 = sub_1000095E8(v69, db, (CFTypeRef *)&error, @"failed to finalize updateUUIDStmt");
LABEL_183:
        char v34 = v107;
        goto LABEL_147;
      }

      BOOL v33 = sub_1000095E8(v37, db, (CFTypeRef *)&error, @"failed to finalize findColStmt");
LABEL_61:
      char v34 = v33;
      SecAsn1Oid v13 = 0LL;
      goto LABEL_141;
    }
  }

  uint64_t v14 = (os_log_s *)sub_10000856C("config");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v117 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "migrating trust store", v117, 2u);
  }

  *(void *)v117 = 0LL;
  *(void *)CFIndex v120 = 0LL;
  syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0);
  uint64_t v15 = sub_10000FBA4(@"Library/Keychains", (uint64_t)@"TrustStore.sqlite3");
  uint64_t v16 = v15;
  if (!v15)
  {
    sub_10000DE88(-36, (__CFString **)&error, @"failed to get old DB file URL");
    goto LABEL_117;
  }

  if (!CFURLGetFileSystemRepresentation(v15, 0, buf, 1024LL))
  {
    sub_10000DE88(-36, (__CFString **)&error, @"failed to get old DB file path");
    goto LABEL_117;
  }

  int v17 = sqlite3_open_v2((const char *)buf, (sqlite3 **)v117, 1, 0LL);
  if (v17)
  {
    sub_1000095A0( v17,  (CFTypeRef *)&error,  @"failed to open old trust store database; new trust store will be empty");
    goto LABEL_117;
  }

  uint64_t v18 = sqlite3_prepare_v2( *(sqlite3 **)v117,  "SELECT data,tset FROM tsettings ORDER BY sha1",  46,  (sqlite3_stmt **)v120,  0LL);
  if ((_DWORD)v18)
  {
    BOOL v30 = sub_1000095E8(v18, *(sqlite3 **)v117, (CFTypeRef *)&error, @"failed to prepare old trust store read");
  }

  else
  {
    uint64_t v19 = sub_100053F0C(@"user", (__CFString **)&error);
    if (!v19)
    {
      sub_10000DE88(-108, (__CFString **)&error, @"failed to open new trust store");
      goto LABEL_43;
    }

    while (1)
    {
      uint64_t v20 = sqlite3_step(*(sqlite3_stmt **)v120);
      if ((_DWORD)v20 != 100) {
        break;
      }
      sqlite3_column_blob(*(sqlite3_stmt **)v120, 0);
      sqlite3_column_bytes(*(sqlite3_stmt **)v120, 0);
      unint64_t v21 = (const void *)SecCertificateCreateWithBytes(0LL);
      if (!v21)
      {
        sub_10000DE88(-26275, (__CFString **)&error, @"failed to decode cert in old DB");
        CFIndex v26 = 0LL;
        uint64_t v24 = 0LL;
        goto LABEL_118;
      }

      unsigned int v22 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)v120, 1);
      int v23 = sqlite3_column_bytes(*(sqlite3_stmt **)v120, 1);
      uint64_t v24 = CFDataCreate(0LL, v22, v23);
      if (!v24)
      {
        sub_10000DE88(-50, (__CFString **)&error, @"no tset data in old DB");
        CFIndex v26 = 0LL;
        goto LABEL_118;
      }

      CFPropertyListRef v25 = CFPropertyListCreateWithData(0LL, v24, 0LL, 0LL, &error);
      CFIndex v26 = v25;
      if (!v25) {
        goto LABEL_118;
      }
      CFTypeID v27 = CFGetTypeID(v25);
      if (v27 != CFArrayGetTypeID())
      {
        sub_10000DE88(-26275, (__CFString **)&error, @"tset is not an array in old DB");
        goto LABEL_118;
      }

      CFRelease(v21);
      CFRelease(v24);
      CFRelease(v26);
    }

    if ((_DWORD)v20 && (_DWORD)v20 != 101)
    {
      BOOL v30 = sub_100009708(v20, *(sqlite3_stmt **)v120, (CFTypeRef *)&error, @"sqlite3_step failed");
      goto LABEL_42;
    }

    uint64_t v28 = sqlite3_finalize(*(sqlite3_stmt **)v120);
    if (!(_DWORD)v28)
    {
      *(void *)CFIndex v120 = 0LL;
      int v29 = sqlite3_close(*(sqlite3 **)v117);
      if (!v29)
      {
        *(void *)v117 = 0LL;
        sub_10000FD28((uint64_t)@"TrustStore.sqlite3", (uint64_t)&stru_100079968);
        CFIndex v26 = 0LL;
        uint64_t v24 = 0LL;
        unint64_t v21 = 0LL;
        LOBYTE(v19) = 1;
        goto LABEL_44;
      }

      sub_1000095A0(v29, (CFTypeRef *)&error, @"failed to close old trust store");
LABEL_117:
      CFIndex v26 = 0LL;
      uint64_t v24 = 0LL;
      unint64_t v21 = 0LL;
LABEL_118:
      LOBYTE(v19) = 0;
      goto LABEL_44;
    }

    BOOL v30 = sub_1000095E8(v28, *(sqlite3 **)v117, (CFTypeRef *)&error, @"failed to finalize old trust store read");
  }

LABEL_42:
  LOBYTE(v19) = v30;
LABEL_43:
  CFIndex v26 = 0LL;
  uint64_t v24 = 0LL;
  unint64_t v21 = 0LL;
  while (1)
  {
LABEL_44:
    while (*(void *)v120)
    {
      uint64_t v31 = sqlite3_finalize(*(sqlite3_stmt **)v120);
      if (!(_DWORD)v31) {
        break;
      }
      LOBYTE(v19) = sub_1000095E8( v31,  *(sqlite3 **)v117,  (CFTypeRef *)&error,  @"failed to finalize old trust store read");
    }

    if (!*(void *)v117) {
      break;
    }
    int v32 = sqlite3_close(*(sqlite3 **)v117);
    if (!v32) {
      break;
    }
    sub_1000095A0(v32, (CFTypeRef *)&error, @"failed to close old trust store");
    LOBYTE(v19) = 0;
  }

  if (v21) {
    CFRelease(v21);
  }
  if (v24) {
    CFRelease(v24);
  }
  if (v26) {
    CFRelease(v26);
  }
  if (v16) {
    CFRelease(v16);
  }
  if ((v19 & 1) == 0)
  {
LABEL_157:
    id v75 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138412290;
      *(void *)&uint8_t buf[4] = error;
      _os_log_impl( (void *)&_mh_execute_header,  v75,  OS_LOG_TYPE_DEFAULT,  "failed to migrate user trust store; new trust store will be empty: %@",
        buf,
        0xCu);
    }
  }

LABEL_159:
  CFErrorRef v76 = error;
  if (error)
  {
    CFErrorRef error = 0LL;
    CFRelease(v76);
    CFErrorRef v77 = error;
    if (error)
    {
      CFErrorRef error = 0LL;
      CFRelease(v77);
    }
  }

LABEL_162:
  qword_100082DB0 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
  qword_100082DB8 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeDictionaryKeyCallBacks, 0LL);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSSLHostname, sub_100032244);
  __int128 v78 = (const void *)kSecPolicyCheckEmail;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckEmail, sub_100032398);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, v78, sub_100032398);
  double v79 = (const void *)kSecPolicyCheckTemporalValidity;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckTemporalValidity, sub_1000324E8);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, v79, sub_1000324E8);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckValidLeaf, sub_1000325C0);
  CFRange v80 = (const void *)kSecPolicyCheckWeakKeySize;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckWeakKeySize, sub_100032644);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, v80, sub_100032644);
  CFRange v81 = (const void *)kSecPolicyCheckWeakSignature;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckWeakSignature, sub_100032708);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, v81, sub_100032708);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckKeyUsage, sub_1000327F4);
  CFRange v82 = (const void *)kSecPolicyCheckExtendedKeyUsage;
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckExtendedKeyUsage, sub_1000328A0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, v82, sub_1000328A0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSubjectCommonName, sub_100032B14);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSubjectCommonNamePrefix, sub_100032BE8);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSubjectCommonNameTEST, sub_100032CBC);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSubjectOrganization, sub_100032D90);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckSubjectOrganizationalUnit, sub_100032E64);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckNotValidBefore, sub_100032F38);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckEAPTrustedServerNames, sub_10003300C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckLeafMarkerOid, sub_1000330D0);
  CFDictionaryAddValue( (CFMutableDictionaryRef)qword_100082DB0,  kSecPolicyCheckLeafMarkerOidWithoutValueCheck,  sub_100033184);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckLeafMarkersProdAndQA, sub_100033230);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckBlackListedLeaf, sub_100033348);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckGrayListedLeaf, sub_100033520);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckLeafSPKISHA256, sub_1000335FC);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckNotCA, sub_100033718);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckMarkRepresentation, sub_100033798);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIssuerCommonName, sub_100033A84);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIssuerCommonNamePrefix, sub_100033B58);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckBasicConstraints, nullsub_2);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckBasicConstraintsCA, sub_100033C30);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIntermediateSPKISHA256, sub_100033CD0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIntermediateEKU, sub_100033DC0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIntermediateMarkerOid, sub_100033EB0);
  CFDictionaryAddValue( (CFMutableDictionaryRef)qword_100082DB8,  kSecPolicyCheckIntermediateMarkerOidWithoutValueCheck,  sub_100033FA0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIntermediateOrganization, sub_100034088);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIntermediateCountry, sub_100034184);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckAnchorSHA256, sub_100034280);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckAnchorApple, sub_100034348);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckCAspkiSHA256, sub_1000343F4);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckNonEmptySubject, sub_100034534);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckIdLinkage, sub_100034620);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckKeySize, sub_10003470C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSignatureHashAlgorithms, sub_100034838);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckCertificatePolicy, sub_100034978);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckCriticalExtensions, nullsub_3);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckChainLength, sub_100034A60);
  CFDictionaryAddValue( (CFMutableDictionaryRef)qword_100082DB8,  kSecPolicyCheckBasicCertificateProcessing,  sub_100034B30);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSystemTrustedWeakHash, sub_1000359E8);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSystemTrustedWeakKey, sub_100035B54);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckPinningRequired, sub_100035CC0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckRevocation, sub_100035DAC);
  CFDictionaryAddValue( (CFMutableDictionaryRef)qword_100082DB0,  kSecPolicyCheckRevocationResponseRequired,  sub_100035E20);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckCTRequired, sub_100035E2C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSystemTrustedCTRequired, sub_100035E4C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckValidityPeriodMaximums, sub_100036284);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSystemTrustValidityPeriod, sub_1000364E0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckOtherTrustValidityPeriod, sub_10003660C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckServerAuthEKU, sub_1000366F8);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckEmailProtectionEKU, sub_10003694C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckSinglePurposeChainEKU, sub_100036A54);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckUnparseableExtension, sub_100036B94);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckNonTlsCTRequired, sub_100036C80);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, kSecPolicyCheckDuplicateExtension, sub_100036DF0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckNoNetworkAccess, sub_100036EDC);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckRevocationOnline, sub_100036F2C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckRevocationIfTrusted, sub_100036F3C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, kSecPolicyCheckRevocationDbIgnored, sub_100036F4C);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, @"CheckLeafMarkerOid", sub_1000330D0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB0, @"CheckLeafMarkersProdAndQA", sub_100033230);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, @"CheckIntermediateMarkerOid", sub_100033EB0);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, @"CheckIntermediateCountry", sub_100034184);
  CFDictionaryAddValue((CFMutableDictionaryRef)qword_100082DB8, @"CheckIntermediateOrganization", sub_100034088);
  uint64_t v83 = (void *)os_transaction_create("com.apple.trustd.valid.initialize");
  db = 0LL;
  p_db = &db;
  uint64_t v114 = 0x2000000000LL;
  char v115 = 0;
  if (qword_100082C10 != -1) {
    dispatch_once(&qword_100082C10, &stru_100076788);
  }
  if (byte_100082C08 == 1)
  {
    if (sub_100011134())
    {
      sub_10001A220(0LL, &stru_100077DE8);
      *(void *)__int128 buf = _NSConcreteStackBlock;
      *(void *)&uint8_t buf[8] = 0x40000000LL;
      *(void *)&uint8_t buf[16] = sub_10004481C;
      *(void *)&_BYTE buf[24] = &unk_100077E10;
      *(void *)&buf[32] = &db;
      sub_10001A220((uint64_t)@".valid_replace", buf);
      *(void *)v117 = _NSConcreteStackBlock;
      *(void *)&v117[8] = 0x40000000LL;
      *(void *)&v117[16] = sub_100044930;
      v118 = &unk_100077E38;
      v119 = &db;
      sub_10001A220((uint64_t)@"valid.sqlite3", v117);
      if (*((_BYTE *)p_db + 24))
      {
        int v84 = sub_1000449F0();
        unint64_t v85 = (os_log_s *)sub_10000856C("validupdate");
        if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CFIndex v120 = 0;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "initializing database", v120, 2u);
        }

        if (!sub_100044AA8(v84, 0LL, 0LL, 1))
        {
          id v86 = (void *)sub_100044C78();
          sub_100029048(v86, (uint64_t)v84, 0LL);
        }

        if (v84) {
          CFRelease(v84);
        }
      }
    }
  }

  CFTypeID v87 = (os_log_s *)sub_10000856C("validupdate");
  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v104 = sub_100044D00();
    uint64_t v105 = sub_100044D8C();
    uint64_t v106 = sub_100044E18();
    *(_DWORD *)CFIndex v120 = 134218496;
    *(void *)&v120[4] = v104;
    __int16 v121 = 2048;
    uint64_t v122 = v105;
    __int16 v123 = 2048;
    uint64_t v124 = v106;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_DEBUG,  "starting service with g%ld, v%ld, schema v%ld",  v120,  0x20u);
  }

  os_release(v83);
  _Block_object_dispose(&db, 8);
  if (qword_100082DA8 != -1) {
    dispatch_once(&qword_100082DA8, &stru_100077BC8);
  }
  if (sub_100011134())
  {
    int64x2_t v88 = objc_autoreleasePoolPush();
    dispatch_queue_attr_t v89 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_BACKGROUND, 0);
    uint64_t v90 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v89);
    dispatch_queue_attr_t v91 = dispatch_queue_attr_make_with_autorelease_frequency(v90, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int8x16_t v92 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v91);

    dispatch_queue_t v93 = dispatch_queue_create("com.apple.trustd.Background.Analytics", v92);
    uint64_t v94 = (void *)qword_100082E38;
    qword_100082E38 = (uint64_t)v93;

    qword_100082E50 = mach_absolute_time();
    uint64_t v95 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v96 = (void *)qword_100082E40;
    qword_100082E40 = v95;

    uint64_t v97 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    v98 = (void *)qword_100082E48;
    qword_100082E48 = v97;

    v99 = (void *)objc_claimAutoreleasedReturnValue(+[TrustAnalytics logger](&OBJC_CLASS___TrustAnalytics, "logger"));
    double v100 = SFAnalyticsSamplerIntervalOncePerReport;
    id v101 =  [v99 AddMultiSamplerForName:@"VersionSampler" withTimeInterval:&stru_100079068 block:SFAnalyticsSamplerIntervalOncePerReport];

    v102 = (void *)objc_claimAutoreleasedReturnValue(+[NetworkingAnalytics logger](&OBJC_CLASS___NetworkingAnalytics, "logger"));
    id v103 =  [v102 AddMultiSamplerForName:@"VersionSampler" withTimeInterval:&stru_100079088 block:v100];

    objc_autoreleasePoolPop(v88);
  }

void sub_100025DB4(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0LL, 11000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000LL;
  block[2] = sub_100025E3C;
  block[3] = &unk_100077290;
  void block[4] = a1;
  dispatch_after(v2, global_queue, block);
}

uint64_t sub_100025E3C(uint64_t a1)
{
  dispatch_time_t v2 = (os_log_s *)sub_10000856C("OTATrust");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(void *)(a1 + 32)) {
      CFURLRef v3 = *(const char **)(a1 + 32);
    }
    else {
      CFURLRef v3 = "Will exit trustd when all transactions are complete.";
    }
    uint64_t v4 = mach_absolute_time() - qword_100082E50;
    memset(v7, 170, 16);
    clock_gettime(_CLOCK_UPTIME_RAW, (timespec *)v7);
    uint64_t v5 = *(void *)v7;
    *(_DWORD *)CFDateRef v7 = 136315650;
    *(void *)&v7[4] = v3;
    *(_WORD *)&v7[12] = 2048;
    *(void *)&v7[14] = v4;
    __int16 v8 = 2048;
    uint64_t v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s uptime: %llu, system: %llus", v7, 0x20u);
  }

  return xpc_transaction_exit_clean();
}

void sub_100026288( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, uint64_t a24, uint64_t a25, uint64_t a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, char a37)
{
}

void sub_10002689C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9)
{
  if (a2 == 1)
  {
    id v11 = objc_begin_catch(exception_object);
    uint64_t v12 = sub_10000856C("validupdate");
    SecAsn1Oid v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = objc_claimAutoreleasedReturnValue([v11 description]);
      id v15 = [v14 UTF8String];
      LODWORD(a9) = 136315138;
      *(void *)((char *)&a9 + 4) = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&a9, 0xCu);
    }

    sub_10004AC48((uint64_t)@"ValidUpdateEvent", 0, 4294967262LL);
    [v9 cancel];
    [v10 reschedule];

    objc_end_catch();
    JUMPOUT(0x100026858LL);
  }

  _Unwind_Resume(exception_object);
}

uint64_t sub_100026C38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = *(void *)(a2 + 40);
  *(void *)(a2 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
  return result;
}

void sub_100026C48(uint64_t a1)
{
}

void sub_100026C50(uint64_t a1)
{
  dispatch_time_t v2 = sub_10000856C("validupdate");
  CFURLRef v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFAbsoluteTime v6 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Got SIGTERM, abandon all hope and clear transaction",  v6,  2u);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
}

void sub_100026CD4(uint64_t a1)
{
  dispatch_time_t v2 = sub_10000856C("validupdate");
  CFURLRef v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    buf.st_dev = 134217984;
    *(void *)&buf.st_mode = CFAbsoluteTimeGetCurrent();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "update started at %f", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v4 = (const char *)[*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) fileSystemRepresentation];
  v5.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v5.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&buf.st_blksize = v5;
  *(timespec *)buf.st_qspare = v5;
  buf.st_birthtimespec = v5;
  *(timespec *)&buf.off_t st_size = v5;
  buf.st_mtimespec = v5;
  buf.st_ctimespec = v5;
  *(timespec *)&buf.st_uid = v5;
  buf.st_atimespec = v5;
  *(timespec *)&buf.st_dev = v5;
  int v6 = open(v4, 0);
  if (v6 < 0)
  {
    uint64_t v8 = *__error();
    if ((_DWORD)v8) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }

  int v7 = v6;
  uint64_t v8 = fstat(v6, &buf);
  if ((_DWORD)v8)
  {
LABEL_7:
    close(v7);
LABEL_9:
    CFMutableArrayRef v10 = sub_10000856C("SecError");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
      buf.st_dev = 138412546;
      *(void *)&buf.st_mode = v12;
      WORD2(buf.st_ino) = 1024;
      *(_DWORD *)((char *)&buf.st_ino + 6) = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "failed to read %@ with error %d",  (uint8_t *)&buf,  0x12u);
    }

    sub_10004AC48((uint64_t)@"ValidUpdateEvent", 1, v8);
    [*(id *)(a1 + 32) reschedule];
    goto LABEL_12;
  }

  off_t st_size = buf.st_size;
  if (buf.st_size > 2147483646)
  {
    uint64_t v8 = 27LL;
    goto LABEL_7;
  }

  id v15 = (const UInt8 *)mmap(0LL, buf.st_size, 1, 2, v7, 0LL);
  uint64_t v16 = (UInt8 *)v15;
  if (st_size < 0 || (unint64_t)(v15 + 1) <= 1)
  {
    uint64_t v8 = *__error();
    int v17 = (os_log_s *)sub_10000856C("SecError");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v65 = 136315394;
      *(void *)&v65[4] = v4;
      *(_WORD *)&v65[12] = 1024;
      *(_DWORD *)&v65[14] = v8;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "unable to map %s (errno %d)", v65, 0x12u);
    }

    close(v7);
    if ((_DWORD)v8)
    {
      if (v16)
      {
        if (munmap(v16, st_size))
        {
          uint64_t v18 = (os_log_s *)sub_10000856C("SecError");
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)uint64_t v65 = 134218496;
            *(void *)&v65[4] = st_size;
            *(_WORD *)&v65[12] = 2048;
            *(void *)&v65[14] = v16;
            *(_WORD *)&v65[22] = 1024;
            int v66 = v8;
            _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "unable to unmap %ld bytes at %p (error %d)",  v65,  0x1Cu);
          }
        }
      }

      goto LABEL_9;
    }

LABEL_49:
  if (CFDataGetLength(v19) < 0)
  {
    dev_t v41 = 0;
    goto LABEL_53;
  }

  uint64_t v39 = (UInt8 *)CFDataGetBytePtr(v19);
  size_t v40 = CFDataGetLength(v19);
  dev_t v41 = munmap(v39, v40);
  if (v41)
  {
LABEL_53:
    uint64_t v42 = sub_10000856C("SecError");
    uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      CFIndex v44 = CFDataGetLength(v19);
      BOOL v45 = CFDataGetBytePtr(v19);
      buf.st_dev = 134218496;
      *(void *)&buf.st_mode = v44;
      WORD2(buf.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = (__darwin_ino64_t)v45;
      HIWORD(buf.st_gid) = 1024;
      buf.st_rdev = v41;
      _os_log_impl( (void *)&_mh_execute_header,  v43,  OS_LOG_TYPE_DEFAULT,  "unable to unmap current update %ld bytes at %p (error %d)",  (uint8_t *)&buf,  0x1Cu);
    }
  }

  if (v19) {
    CFRelease(v19);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) closeFile];
  if (v4) {
    remove(v4);
  }
  uint64_t v46 = *(void *)(a1 + 32);
  uint64_t v47 = *(void **)(v46 + 48);
  *(void *)(v46 + 4_Block_object_dispose((const void *)(v37 - 128), 8) = 0LL;

  uint64_t v48 = *(void *)(a1 + 32);
  uint64_t v49 = *(void **)(v48 + 56);
  *(void *)(v48 + 56) = 0LL;

  uint64_t v50 = *(void *)(a1 + 32);
  uint64_t v51 = *(void **)(v50 + 40);
  *(void *)(v50 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;

  uint64_t v52 = sub_10000856C("validupdate");
  double v53 = (os_log_s *)objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    buf.st_dev = 134217984;
    *(CFAbsoluteTime *)&buf.st_mode = Current;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "update finished at %f", (uint8_t *)&buf, 0xCu);
  }

  qword_100082DD0 = 0LL;
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16LL) + 16LL))();
LABEL_12:
  dispatch_source_cancel(*(dispatch_source_t *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL));
  uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 4syslog(5, "SecCopyURLForFileInParameterizedKeychainDirectory: forceUserScope:%d", 0) = 0LL;
}