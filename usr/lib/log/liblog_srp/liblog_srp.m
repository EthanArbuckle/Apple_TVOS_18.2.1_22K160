uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, void *a5)
{
  char *v6;
  uint64_t result;
  unint64_t v8;
  _BYTE *v10;
  unsigned int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  if (__dst) {
    v6 = __dst + 256;
  }
  else {
    v6 = 0LL;
  }
  result = 4294960586LL;
  v8 = a1 + a2;
  v10 = __dst;
  v11 = *__src;
  if (*__src)
  {
    v12 = 0LL;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0) {
          return 4294960554LL;
        }
        if (!v12)
        {
          v12 = __src + 2;
          if (!v10) {
            goto LABEL_23;
          }
        }

        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        v11 = *__src;
        if (v11 > 0xBF) {
          return 4294960554LL;
        }
      }

      else
      {
        v13 = &__src[v11 + 1];
        if (v10)
        {
          v14 = v11 + 1;
          if (v6 - v10 <= v14) {
            return 4294960545LL;
          }
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }

        v11 = *v13;
        __src = v13;
      }
    }

    while (v11);
    if (!v10) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }

  v12 = 0LL;
  if (__dst) {
LABEL_22:
  }
    *v10 = 0;
LABEL_23:
  result = 0LL;
  if (a5)
  {
    if (v12) {
      v15 = v12;
    }
    else {
      v15 = __src + 1;
    }
    *a5 = v15;
  }

  return result;
}

uint64_t DNSMessageExtractDomainNameString( unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, void *a5)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    uint64_t result = DomainNameToString(__dst, 0LL, a4, 0LL);
    if (a5)
    {
      if (!(_DWORD)result) {
        *a5 = v8;
      }
    }
  }

  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, void *a4)
{
  LODWORD(i) = *a1;
  if (*a1)
  {
    v5 = a1;
    do
    {
      v6 = &v5[i + 1];
      if (v6 - a1 > 255) {
        return 4294960554LL;
      }
      v7 = v5 + 1;
      if (v7 < v6)
      {
        for (uint64_t i = i; i; --i)
        {
          unsigned __int8 v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u) {
                char v10 = 48;
              }
              else {
                char v10 = 49;
              }
              a3[1] = v10;
              if (v8 >= 0x64u) {
                char v11 = v8 / 0xAu - 10;
              }
              else {
                char v11 = v8 / 0xAu;
              }
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }

          else if (*v7 - 32 <= 0x3C && ((1LL << (v8 - 32)) & 0x1000000000004001LL) != 0)
          {
            *a3++ = 92;
          }

          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }

      *a3++ = 46;
      LODWORD(i) = *v6;
      v5 = v6;
    }

    while (*v6);
    if (v6 != a1) {
      goto LABEL_30;
    }
  }

  *a3++ = 46;
  v6 = a1;
LABEL_30:
  *a3 = 0;
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v6 + 1;
  }
  return result;
}

uint64_t DNSMessageExtractQuestion( unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, void *a7)
{
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!(_DWORD)result)
  {
    v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546LL;
    }

    else
    {
      if (a5) {
        *a5 = bswap32(*v14) >> 16;
      }
      if (a6) {
        *a6 = bswap32(v13[1]) >> 16;
      }
      uint64_t result = 0LL;
      if (a7) {
        *a7 = v13 + 2;
      }
    }
  }

  return result;
}

uint64_t DNSMessageExtractRecord( unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, void *a10)
{
  return _DNSMessageExtractRecordEx(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0LL, 0LL, 0LL, 0LL, a10);
}

uint64_t _DNSMessageExtractRecordEx( unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, size_t a11, void *a12, void *a13, void *a14)
{
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v27);
  if (!(_DWORD)result)
  {
    v20 = v27;
    v21 = (unsigned __int16 *)(v27 + 10);
    unint64_t v22 = __rev16(*((unsigned __int16 *)v27 + 4));
    if (a1 + a2 - (unint64_t)(v27 + 10) < v22)
    {
      return 4294960546LL;
    }

    else
    {
      unint64_t v25 = 0LL;
      size_t v26 = 0LL;
      unsigned int v23 = bswap32(*(unsigned __int16 *)v27) >> 16;
      if (!a11 && !a13
        || (uint64_t result = DNSMessageExtractRData(a1, a2, v27 + 10, v22, v23, a10, a11, &v26, &v25), !(_DWORD)result))
      {
        if (a5) {
          *a5 = v23;
        }
        if (a6) {
          *a6 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        }
        if (a7) {
          *a7 = bswap32(*((_DWORD *)v20 + 1));
        }
        if (a8) {
          *a8 = v21;
        }
        if (a9) {
          *a9 = v22;
        }
        if (a12) {
          *a12 = v26;
        }
        if (a13) {
          *a13 = v25;
        }
        uint64_t result = 0LL;
        if (a14) {
          *a14 = (char *)v21 + v22;
        }
      }
    }
  }

  return result;
}

uint64_t DNSMessageExtractRData( unint64_t a1, uint64_t a2, char *__src, unint64_t a4, int a5, char *a6, size_t a7, size_t *a8, unint64_t *a9)
{
  size_t v10 = a7;
  unint64_t v12 = a4;
  uint64_t v79 = *MEMORY[0x1895F89C0];
  v16 = &__src[a4];
  switch(a5)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 12:
    case 39:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        int v18 = __srca[0];
        v19 = __srca;
        if (__srca[0])
        {
          do
          {
            v20 = &v19[v18];
            int v21 = v20[1];
            v19 = v20 + 1;
            int v18 = v21;
          }

          while (v21);
        }

        unint64_t v12 = v19 - __srca + 1;
        if (v12 < v10) {
          size_t v10 = v19 - __srca + 1;
        }
        unint64_t v22 = __srca;
        unsigned int v23 = a6;
        goto LABEL_9;
      }

      break;
    case 6:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, __dst, &v76);
        if (!(_DWORD)result)
        {
          v49 = v76;
          if (v16 - (_BYTE *)v76 != 20) {
            goto LABEL_77;
          }
          int v50 = __srca[0];
          v51 = __srca;
          if (__srca[0])
          {
            do
            {
              v52 = &v51[v50];
              int v53 = v52[1];
              v51 = v52 + 1;
              int v50 = v53;
            }

            while (v53);
          }

          v54 = &a6[v10];
          int64_t v55 = v51 - __srca;
          int v56 = __dst[0];
          v57 = __dst;
          if (__dst[0])
          {
            do
            {
              v58 = &v57[v56];
              int v59 = v58[1];
              v57 = v58 + 1;
              int v56 = v59;
            }

            while (v59);
          }

          int64_t v60 = v57 - __dst;
          unint64_t v61 = v57 - __dst + 1;
          unint64_t v12 = v55 + v61 + 21;
          if (v55 + 1 < v10) {
            size_t v10 = v55 + 1;
          }
          memcpy(a6, __srca, v10);
          v62 = &a6[v10];
          if (v54 - v62 >= v61) {
            size_t v63 = v60 + 1;
          }
          else {
            size_t v63 = v54 - v62;
          }
          memcpy(v62, __dst, v63);
          v64 = &v62[v63];
          else {
            size_t v65 = v54 - v64;
          }
          goto LABEL_70;
        }
      }

      break;
    case 14:
    case 17:
    case 26:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, __dst, &v76);
        if (!(_DWORD)result)
        {
          if (v76 != v16) {
            goto LABEL_77;
          }
          int v36 = __srca[0];
          v37 = __srca;
          if (__srca[0])
          {
            do
            {
              v38 = &v37[v36];
              int v39 = v38[1];
              v37 = v38 + 1;
              int v36 = v39;
            }

            while (v39);
          }

          v40 = &a6[v10];
          unint64_t v41 = v37 - __srca + 1;
          int v42 = __dst[0];
          v43 = __dst;
          if (__dst[0])
          {
            do
            {
              v44 = &v43[v42];
              int v45 = v44[1];
              v43 = v44 + 1;
              int v42 = v45;
            }

            while (v45);
          }

          int64_t v46 = v43 - __dst;
          unint64_t v47 = v43 - __dst + 1;
          unint64_t v12 = v47 + v41;
          if (v41 < v10) {
            size_t v10 = v37 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          v33 = &a6[v10];
          if (v40 - v33 >= v47) {
            size_t v34 = v46 + 1;
          }
          else {
            size_t v34 = v40 - v33;
          }
          v35 = __dst;
          goto LABEL_36;
        }
      }

      break;
    case 15:
    case 18:
    case 21:
    case 36:
      if (a4 < 3) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 2, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        v24 = &a6[v10];
        int v25 = __srca[0];
        size_t v26 = __srca;
        if (__srca[0])
        {
          do
          {
            v27 = &v26[v25];
            int v28 = v27[1];
            size_t v26 = v27 + 1;
            int v25 = v28;
          }

          while (v28);
        }

        int64_t v29 = v26 - __srca;
        unint64_t v30 = v26 - __srca + 1;
        unint64_t v12 = v26 - __srca + 3;
        BOOL v31 = v10 >= 2;
        uint64_t v32 = 2LL;
        goto LABEL_16;
      }

      break;
    case 33:
      if (a4 < 7) {
        goto LABEL_77;
      }
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src + 6, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16) {
          goto LABEL_77;
        }
        v24 = &a6[v10];
        int v66 = __srca[0];
        v67 = __srca;
        if (__srca[0])
        {
          do
          {
            v68 = &v67[v66];
            int v69 = v68[1];
            v67 = v68 + 1;
            int v66 = v69;
          }

          while (v69);
        }

        int64_t v29 = v67 - __srca;
        unint64_t v30 = v67 - __srca + 1;
        unint64_t v12 = v67 - __srca + 7;
        BOOL v31 = v10 >= 6;
        uint64_t v32 = 6LL;
LABEL_16:
        if (v31) {
          size_t v10 = v32;
        }
        memcpy(a6, __src, v10);
        v33 = &a6[v10];
        if (v24 - v33 >= v30) {
          size_t v34 = v29 + 1;
        }
        else {
          size_t v34 = v24 - v33;
        }
        v35 = __srca;
LABEL_36:
        memcpy(v33, v35, v34);
        v48 = &v33[v34];
        goto LABEL_71;
      }

      break;
    case 47:
      uint64_t result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        v49 = v76;
        if (v76 <= v16)
        {
          v70 = &a6[v10];
          int v71 = __srca[0];
          v72 = __srca;
          if (__srca[0])
          {
            do
            {
              v73 = &v72[v71];
              int v74 = v73[1];
              v72 = v73 + 1;
              int v71 = v74;
            }

            while (v74);
          }

          unint64_t v75 = v16 - (_BYTE *)v76;
          unint64_t v12 = v72 - __srca + 1 + v16 - (_BYTE *)v76;
          if (v72 - __srca + 1 < v10) {
            size_t v10 = v72 - __srca + 1;
          }
          memcpy(a6, __srca, v10);
          v64 = &a6[v10];
          if (v70 - v64 >= v75) {
            size_t v65 = v16 - v49;
          }
          else {
            size_t v65 = v70 - v64;
          }
LABEL_70:
          memcpy(v64, v49, v65);
          v48 = &v64[v65];
LABEL_71:
          size_t v10 = v48 - a6;
          goto LABEL_72;
        }

LABEL_77:
        uint64_t result = 4294960554LL;
      }

      break;
    default:
      if (a7 >= a4) {
        size_t v10 = a4;
      }
      unsigned int v23 = a6;
      unint64_t v22 = __src;
LABEL_9:
      memcpy(v23, v22, v10);
LABEL_72:
      if (a8) {
        *a8 = v10;
      }
      uint64_t result = 0LL;
      if (a9) {
        *a9 = v12;
      }
      break;
  }

  return result;
}

uint64_t DomainNameLength(_BYTE *a1)
{
  int v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = &v2[v1];
      int v4 = v3[1];
      v2 = v3 + 1;
      int v1 = v4;
    }

    while (v4);
  }

  return v2 - a1 + 1;
}

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  if (a2 < 0xC) {
    return 4294960553LL;
  }
  v12[7] = v3;
  v12[8] = v4;
  unsigned int v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  unsigned __int8 v8 = (char *)(a1 + 12);
  if (v7)
  {
    unint64_t v10 = a1 + a2;
    while (1)
    {
      uint64_t result = DNSMessageExtractDomainName(a1, a2, v8, 0LL, v12);
      if ((_DWORD)result) {
        break;
      }
      if (v10 - v12[0] <= 3) {
        return 4294960546LL;
      }
      unsigned __int8 v8 = (char *)(v12[0] + 4LL);
      if (!--v7) {
        goto LABEL_7;
      }
    }
  }

  else
  {
LABEL_7:
    uint64_t result = 0LL;
    if (a3) {
      *a3 = v8;
    }
  }

  return result;
}

uint64_t DNSMessageGetOptRecord(unsigned __int16 *a1, unint64_t a2, void *a3, char **a4)
{
  uint64_t result = DNSMessageGetAnswerSection((unint64_t)a1, a2, &v17);
  if (!(_DWORD)result)
  {
    unsigned int v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        LODWORD(result) = _DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v17,  0LL,  &v16,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v17);
        if ((_DWORD)result || v16 == 41) {
          break;
        }
        if (!--v9) {
          goto LABEL_6;
        }
      }

      if (v16 == 41) {
        unsigned int v14 = -6742;
      }
      else {
        unsigned int v14 = 0;
      }
      if ((_DWORD)result) {
        return result;
      }
      else {
        return v14;
      }
    }

    else
    {
LABEL_6:
      unsigned int v10 = __rev16(a1[5]);
      if (v10)
      {
        char v11 = 0LL;
        unint64_t v12 = 0LL;
        while (1)
        {
          v13 = v17;
          uint64_t result = _DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v17,  0LL,  &v15,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v17);
          if ((_DWORD)result) {
            break;
          }
          if (v15 == 41)
          {
            if (v11 || *v13) {
              return 4294960554LL;
            }
            unint64_t v12 = (char *)(v17 - v13);
            char v11 = v13;
          }

          else
          {
            v13 = v11;
          }

          if (!--v10)
          {
            if (!a3) {
              goto LABEL_17;
            }
            goto LABEL_16;
          }
        }
      }

      else
      {
        unint64_t v12 = 0LL;
        v13 = 0LL;
        if (a3) {
LABEL_16:
        }
          *a3 = v13;
LABEL_17:
        uint64_t result = 0LL;
        if (a4) {
          *a4 = v12;
        }
      }
    }
  }

  return result;
}

uint64_t DNSMessageGetExtendedDNSError( unsigned __int16 *a1, unint64_t a2, _WORD *a3, char **a4, _WORD *a5)
{
  __int16 v15 = 0LL;
  uint64_t v16 = 0LL;
  uint64_t result = DNSMessageGetOptRecord(a1, a2, &v16, &v15);
  if (!(_DWORD)result)
  {
    if (v16)
    {
      unsigned int v9 = &v15[v16];
      unsigned int v10 = (char *)(v16 + 11);
      while (v10 < v9)
      {
        char v11 = v10;
        int64_t v12 = __rev16(*((unsigned __int16 *)v10 + 1));
        if (v9 - (v10 + 4) < v12) {
          return 4294960546LL;
        }
        unsigned int v13 = __rev16(*(unsigned __int16 *)v10);
        v10 += v12 + 4;
        if (v13 == 15)
        {
          unsigned int v14 = v11 + 6;
          if ((_WORD)v10 == (_WORD)v11 + 6) {
            unsigned int v14 = 0LL;
          }
          if (a3) {
            *a3 = bswap32(*((unsigned __int16 *)v11 + 2)) >> 16;
          }
          if (a4) {
            *a4 = v14;
          }
          uint64_t result = 0LL;
          if (a5) {
            *a5 = (_WORD)v10 - ((_WORD)v11 + 6);
          }
          return result;
        }
      }
    }

    return 4294960569LL;
  }

  return result;
}

uint64_t DNSMessageWriteQuery( __int16 a1, __int16 a2, _BYTE *__src, __int16 a4, __int16 a5, uint64_t a6, void *a7)
{
  *(_WORD *)(a6 + 10) = 0;
  *(_DWORD *)(a6 + 6) = 0;
  *(_BYTE *)a6 = HIBYTE(a1);
  *(_BYTE *)(a6 + 1) = a1;
  *(_BYTE *)(a6 + 2) = HIBYTE(a2);
  *(_BYTE *)(a6 + 3) = a2;
  *(_WORD *)(a6 + 4) = 256;
  int v11 = *__src;
  int64_t v12 = __src;
  if (*__src)
  {
    int64_t v12 = __src;
    do
    {
      unsigned int v13 = &v12[v11];
      int v14 = v13[1];
      int64_t v12 = v13 + 1;
      int v11 = v14;
    }

    while (v14);
  }

  unint64_t v15 = v12 - __src + 1;
  if (v15 > 0x100) {
    return 4294960553LL;
  }
  memcpy((void *)(a6 + 12), __src, v12 - __src + 1);
  uint64_t v16 = (_BYTE *)(a6 + 12 + v15);
  _BYTE *v16 = HIBYTE(a4);
  v16[1] = a4;
  v16[2] = HIBYTE(a5);
  v16[3] = a5;
  uint64_t result = 0LL;
  if (a7) {
    *a7 = v15 + 16;
  }
  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, void *a3, size_t *a4)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  if (a2 < 0xC)
  {
LABEL_68:
    v19 = 0LL;
    int v36 = 0LL;
    int DomainName = -6743;
  }

  else if (__rev16(*(unsigned __int16 *)(a1 + 4)) == 1)
  {
    v52 = (char *)(a1 + 12);
    int DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, &v51, &v50, &v52);
    if (DomainName)
    {
LABEL_57:
      v19 = 0LL;
      int v36 = 0LL;
      goto LABEL_61;
    }

    if (v50 == 1)
    {
      int v9 = __src[0];
      unsigned int v10 = __src;
      if (__src[0])
      {
        do
        {
          int v11 = &v10[v9];
          int v12 = v11[1];
          unsigned int v10 = v11 + 1;
          int v9 = v12;
        }

        while (v12);
      }

      int64_t v13 = v10 - __src;
      unint64_t __n = v10 - __src + 1;
      v40 = v52;
      __memcpy_chk();
      unsigned int v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
      if (v14)
      {
        int v15 = 0;
        unsigned int v42 = -1;
LABEL_9:
        int v16 = 0;
        v52 = v40;
        char v17 = 1;
        while (1)
        {
          int DomainName = _DNSMessageExtractRecordEx( a1,  a2,  v52,  (char *)v53,  &v46,  &v48,  &v47,  (unsigned __int16 **)&v49,  0LL,  0LL,  0LL,  0LL,  0LL,  &v52);
          if (DomainName) {
            goto LABEL_57;
          }
          if ((unsigned __int16)v46 == 5 && v48 == v50 && DomainNameEqual(v53, __dst))
          {
            int DomainName = DNSMessageExtractDomainName(a1, a2, v49, (char *)__dst, 0LL);
            if (DomainName) {
              goto LABEL_57;
            }
            char v17 = 0;
            unsigned int v18 = v42;
            unsigned int v42 = v18;
            if (++v16 == v14) {
              goto LABEL_22;
            }
          }

          else if (v14 == ++v16)
          {
            if ((v17 & 1) != 0) {
              goto LABEL_25;
            }
LABEL_22:
            if (++v15 != v14) {
              goto LABEL_9;
            }
            goto LABEL_25;
          }
        }
      }

      unsigned int v42 = -1;
LABEL_25:
      v38 = a4;
      v19 = 0LL;
      v20 = 0LL;
      int v21 = 0LL;
      size_t __size = v13 + 17;
      char v22 = 1;
      a4 = &v47;
      while (1)
      {
        char v41 = v22;
        v52 = v40;
        if (v14) {
          break;
        }
        unsigned int v44 = 0;
        if (v19) {
          goto LABEL_52;
        }
LABEL_45:
        if (!__size || (unint64_t v30 = (char *)calloc(1uLL, __size)) == 0LL)
        {
          __break(1u);
          goto LABEL_68;
        }

        v19 = v30;
        if (__size < 0xC) {
          goto LABEL_66;
        }
        int v31 = *(_DWORD *)a1;
        *((_WORD *)v30 + 2) = *(_WORD *)(a1 + 4);
        *(_DWORD *)unint64_t v30 = v31;
        *(_DWORD *)(v30 + 6) = 0;
        *((_WORD *)v30 + 5) = 0;
        if (__size - 12 < __n) {
          goto LABEL_66;
        }
        int v21 = &v30[__size];
        uint64_t v32 = v30 + 12;
        memcpy(v30 + 12, __src, __n);
        v33 = &v32[__n];
        char v22 = 0;
        char v34 = v51;
        __int16 v35 = v50;
        char *v33 = HIBYTE(v51);
        v33[1] = v34;
        v33[2] = HIBYTE(v35);
        v33[3] = v35;
        v20 = v33 + 4;
        *((_WORD *)v19 + 2) = 256;
        if ((v41 & 1) == 0) {
          goto LABEL_54;
        }
      }

      unsigned int v44 = 0;
      unsigned int v23 = v14;
      do
      {
        v24 = v52;
        int DomainName = _DNSMessageExtractRecordEx( a1,  a2,  v52,  (char *)v53,  &v48,  &v45,  &v46,  0LL,  0LL,  0LL,  0LL,  0LL,  &v47,  &v52);
        if (DomainName) {
          goto LABEL_59;
        }
        if (v48 == v51 && v45 == v50 && DomainNameEqual(v53, __dst))
        {
          if (v19)
          {
            if (v21 - v20 < 2) {
              goto LABEL_58;
            }
            *(_WORD *)v20 = 3264;
            unsigned int v25 = v46;
            if (v46 >= v42) {
              unsigned int v25 = v42;
            }
            unsigned int v46 = v25;
            char v26 = v48;
            __int16 v27 = v45;
            __int16 v28 = v47;
            v20[2] = HIBYTE(v48);
            v20[3] = v26;
            v20[4] = HIBYTE(v27);
            v20[5] = v27;
            v20[6] = HIBYTE(v25);
            v20[7] = BYTE2(v25);
            v20[8] = BYTE1(v25);
            v20[9] = v25;
            v20[10] = HIBYTE(v28);
            v20[11] = v28;
            int64_t v29 = v20 + 12;
            if (v21 - v29 < v47)
            {
LABEL_58:
              int DomainName = -6762;
LABEL_59:
              int v36 = 0LL;
              goto LABEL_60;
            }

            int DomainName = _DNSMessageExtractRecordEx(a1, a2, v24, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, v29, v47, &v49, 0LL, 0LL);
            if (DomainName) {
              goto LABEL_59;
            }
            v20 = &v49[(void)v29];
            ++v44;
          }

          else
          {
            __size += v47 + 12;
          }
        }

        --v23;
      }

      while (v23);
      if (!v19) {
        goto LABEL_45;
      }
LABEL_52:
      if (__size >= 0xC)
      {
        *((_WORD *)v19 + 3) = bswap32(v44) >> 16;
LABEL_54:
        int v36 = v19;
        a4 = v38;
        v19 = 0LL;
        int DomainName = 0;
        if (a3) {
          *a3 = v20 - v36;
        }
        goto LABEL_61;
      }

LABEL_66:
      int v36 = 0LL;
      int DomainName = -6762;
LABEL_60:
      a4 = v38;
    }

    else
    {
      v19 = 0LL;
      int v36 = 0LL;
      int DomainName = -6756;
    }
  }

  else
  {
    v19 = 0LL;
    int v36 = 0LL;
    int DomainName = -6764;
  }

LABEL_61:
  if (a4) {
    *(_DWORD *)a4 = DomainName;
  }
  if (v19) {
    free(v19);
  }
  return v36;
}

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  v2 = a2;
  uint64_t v3 = a1;
  while (1)
  {
    uint64_t v4 = *v3;
    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!(_DWORD)v4) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t DomainNameAppendDomainName(_BYTE *a1, _BYTE *a2, void *a3)
{
  int v5 = *a1;
  v6 = a1;
  if (*a1)
  {
    v6 = a1;
    do
    {
      unsigned int v7 = &v6[v5];
      int v8 = v7[1];
      v6 = v7 + 1;
      int v5 = v8;
    }

    while (v8);
  }

  unint64_t v9 = v6 - a1;
  int v10 = *a2;
  int v11 = a2;
  if (*a2)
  {
    int v11 = a2;
    do
    {
      int v12 = &v11[v10];
      int v13 = v12[1];
      int v11 = v12 + 1;
      int v10 = v13;
    }

    while (v13);
  }

  uint64_t result = 4294960553LL;
  if (v9 <= 0x100)
  {
    size_t v15 = v11 - a2 + 1;
    if (v15 <= 0x100)
    {
      size_t v16 = v15 + v9;
      if (v15 + v9 <= 0x100)
      {
        memcpy(&a1[v9], a2, v15);
        uint64_t result = 0LL;
        if (a3) {
          *a3 = &a1[v16];
        }
      }
    }
  }

  return result;
}

uint64_t DomainNameAppendString(_BYTE *a1, char *a2, void *a3)
{
  uint64_t v3 = a1;
  while (*v3)
  {
    v3 += *v3 + 1;
    if (v3 >= a1 + 256) {
      return 4294960554LL;
    }
  }

  int v5 = *a2;
  if (*a2)
  {
    if (v5 != 46) {
      goto LABEL_9;
    }
    if (a2[1])
    {
      int v5 = 46;
LABEL_9:
      unint64_t v6 = (unint64_t)(a1 + 255);
      do
      {
        else {
          unsigned int v7 = v3 + 64;
        }
        int v8 = v3 + 1;
        unint64_t v9 = v3 + 1;
        int v10 = (unsigned __int8 *)a2;
        do
        {
          a2 = (char *)(v10 + 1);
          if (v5 == 92)
          {
            int v5 = *a2;
            if (!*a2) {
              return 4294960546LL;
            }
            a2 = (char *)(v10 + 2);
            if (v5 - 48 <= 9)
            {
              int v11 = *a2;
              if ((v11 - 48) <= 9)
              {
                int v12 = v10[3];
                if ((v12 - 48) <= 9)
                {
                  int v13 = 100 * v5 + 10 * (char)v11 + (char)v12;
                  unsigned int v14 = (char *)(v10 + 4);
                  if (v13 < 5584)
                  {
                    a2 = v14;
                    LOBYTE(v5) = v13 + 48;
                  }
                }
              }
            }
          }

          else if (v5 == 46)
          {
            break;
          }

          if (v9 >= v7) {
            return 4294960545LL;
          }
          *v9++ = v5;
          int v5 = *a2;
          int v10 = (unsigned __int8 *)a2;
        }

        while (*a2);
        if (v9 == v8) {
          return 4294960554LL;
        }
        _BYTE *v3 = (_BYTE)v9 - (_BYTE)v8;
        *unint64_t v9 = 0;
        int v5 = *a2;
        uint64_t v3 = v9;
      }

      while (*a2);
      goto LABEL_29;
    }
  }

  unint64_t v9 = v3;
LABEL_29:
  uint64_t result = 0LL;
  if (a3) {
    *a3 = v9 + 1;
  }
  return result;
}

_BYTE *DomainNameDupEx(_BYTE *result, int a2, unsigned __int8 **a3, size_t *a4)
{
  unsigned int v7 = result;
  int v8 = *result;
  unint64_t v9 = result;
  if (*result)
  {
    unint64_t v9 = result;
    do
    {
      int v10 = &v9[v8];
      int v11 = v10[1];
      unint64_t v9 = v10 + 1;
      int v8 = v11;
    }

    while (v11);
  }

  size_t v12 = v9 - result + 1;
  if (v9 - result == -1 || (uint64_t result = malloc(v9 - result + 1)) == 0LL)
  {
    __break(1u);
  }

  else
  {
    int v13 = result;
    memcpy(result, v7, v12);
    if (a2)
    {
      unsigned int v14 = *v13;
      if (*v13)
      {
        size_t v15 = v13;
        do
        {
          size_t v16 = v15 + 1;
          char v17 = v16;
          uint64_t v18 = v14;
          do
          {
            int v19 = *v17;
            *v17++ = v19;
            --v18;
          }

          while (v18);
          size_t v15 = &v16[v14];
          unsigned int v14 = *v15;
        }

        while (*v15);
      }
    }

    *a3 = v13;
    if (a4) {
      *a4 = v12;
    }
    return 0LL;
  }

  return result;
}

BOOL DomainLabelEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 1LL;
  }
  uint64_t v2 = *a1;
  return (_DWORD)v2 == *a2 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2) == 0;
}

uint64_t DomainNameFromString(_BYTE *a1, char *a2, void *a3)
{
  *a1 = 0;
  return DomainNameAppendString(a1, a2, a3);
}

uint64_t DomainNameLabelCount(uint64_t result)
{
  unsigned int v1 = *(unsigned __int8 *)result;
  if (!*(_BYTE *)result) {
    return 0LL;
  }
  uint64_t v2 = result;
  LODWORD(result) = 0;
  uint64_t v3 = (_BYTE *)v2;
  while (v1 <= 0x3F)
  {
    v3 += v1 + 1;
    uint64_t result = (result + 1);
    unsigned int v1 = *v3;
    if (!*v3) {
      return result;
    }
  }

  return 0xFFFFFFFFLL;
}

const char *DNSRecordTypeValueToString(int a1)
{
  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0LL;
      }
    }

    else
    {
      switch(a1)
      {
        case 249:
          uint64_t result = "TKEY";
          break;
        case 250:
          uint64_t result = "TSIG";
          break;
        case 251:
          uint64_t result = "IXFR";
          break;
        case 252:
          uint64_t result = "AXFR";
          break;
        case 253:
          uint64_t result = "MAILB";
          break;
        case 254:
          uint64_t result = "MAILA";
          break;
        case 255:
          uint64_t result = "ANY";
          break;
        case 256:
          uint64_t result = "URI";
          break;
        case 257:
          uint64_t result = "CAA";
          break;
        case 258:
          uint64_t result = "AVC";
          break;
        case 259:
          uint64_t result = "DOA";
          break;
        case 260:
          uint64_t result = "AMTRELAY";
          break;
        default:
          return 0LL;
      }
    }
  }

  else
  {
    int v1 = a1 - 1;
    uint64_t result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "NS";
        break;
      case 2:
        uint64_t result = "MD";
        break;
      case 3:
        uint64_t result = "MF";
        break;
      case 4:
        uint64_t result = "CNAME";
        break;
      case 5:
        uint64_t result = "SOA";
        break;
      case 6:
        uint64_t result = "MB";
        break;
      case 7:
        uint64_t result = "MG";
        break;
      case 8:
        uint64_t result = "MR";
        break;
      case 9:
        uint64_t result = "NULL";
        break;
      case 10:
        uint64_t result = "WKS";
        break;
      case 11:
        uint64_t result = "PTR";
        break;
      case 12:
        uint64_t result = "HINFO";
        break;
      case 13:
        uint64_t result = "MINFO";
        break;
      case 14:
        uint64_t result = "MX";
        break;
      case 15:
        uint64_t result = "TXT";
        break;
      case 16:
        uint64_t result = "RP";
        break;
      case 17:
        uint64_t result = "AFSDB";
        break;
      case 18:
        uint64_t result = "X25";
        break;
      case 19:
        uint64_t result = "ISDN";
        break;
      case 20:
        uint64_t result = "RT";
        break;
      case 21:
        uint64_t result = "NSAP";
        break;
      case 22:
        uint64_t result = "NSAP-PTR";
        break;
      case 23:
        uint64_t result = "SIG";
        break;
      case 24:
        uint64_t result = "KEY";
        break;
      case 25:
        uint64_t result = "PX";
        break;
      case 26:
        uint64_t result = "GPOS";
        break;
      case 27:
        uint64_t result = "AAAA";
        break;
      case 28:
        uint64_t result = "LOC";
        break;
      case 29:
        uint64_t result = "NXT";
        break;
      case 30:
        uint64_t result = "EID";
        break;
      case 31:
        uint64_t result = "NIMLOC";
        break;
      case 32:
        uint64_t result = "SRV";
        break;
      case 33:
        uint64_t result = "ATMA";
        break;
      case 34:
        uint64_t result = "NAPTR";
        break;
      case 35:
        uint64_t result = "KX";
        break;
      case 36:
        uint64_t result = "CERT";
        break;
      case 37:
        uint64_t result = "A6";
        break;
      case 38:
        uint64_t result = "DNAME";
        break;
      case 39:
        uint64_t result = "SINK";
        break;
      case 40:
        uint64_t result = "OPT";
        break;
      case 41:
        uint64_t result = "APL";
        break;
      case 42:
        uint64_t result = "DS";
        break;
      case 43:
        uint64_t result = "SSHFP";
        break;
      case 44:
        uint64_t result = "IPSECKEY";
        break;
      case 45:
        uint64_t result = "RRSIG";
        break;
      case 46:
        uint64_t result = "NSEC";
        break;
      case 47:
        uint64_t result = "DNSKEY";
        break;
      case 48:
        uint64_t result = "DHCID";
        break;
      case 49:
        uint64_t result = "NSEC3";
        break;
      case 50:
        uint64_t result = "NSEC3PARAM";
        break;
      case 51:
        uint64_t result = "TLSA";
        break;
      case 52:
        uint64_t result = "SMIMEA";
        break;
      case 54:
        uint64_t result = "HIP";
        break;
      case 55:
        uint64_t result = "NINFO";
        break;
      case 56:
        uint64_t result = "RKEY";
        break;
      case 57:
        uint64_t result = "TALINK";
        break;
      case 58:
        uint64_t result = "CDS";
        break;
      case 59:
        uint64_t result = "CDNSKEY";
        break;
      case 60:
        uint64_t result = "OPENPGPKEY";
        break;
      case 61:
        uint64_t result = "CSYNC";
        break;
      case 62:
        uint64_t result = "ZONEMD";
        break;
      case 63:
        uint64_t result = "SVCB";
        break;
      case 64:
        uint64_t result = "HTTPS";
        break;
      case 98:
        uint64_t result = "SPF";
        break;
      case 99:
        uint64_t result = "UINFO";
        break;
      case 100:
        uint64_t result = "UID";
        break;
      case 101:
        uint64_t result = "GID";
        break;
      case 102:
        uint64_t result = "UNSPEC";
        break;
      case 103:
        uint64_t result = "NID";
        break;
      case 104:
        uint64_t result = "L32";
        break;
      case 105:
        uint64_t result = "L64";
        break;
      case 106:
        uint64_t result = "LP";
        break;
      case 107:
        uint64_t result = "EUI48";
        break;
      case 108:
        uint64_t result = "EUI64";
        break;
      default:
        return 0LL;
    }
  }

  return result;
}

unsigned __int16 *DNSRecordTypeStringToValue(const void *a1)
{
  uint64_t result = (unsigned __int16 *)bsearch( a1,  &DNSRecordTypeStringToValue_sTable,  0x5AuLL,  0x10uLL,  (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
  if (result) {
    return (unsigned __int16 *)result[4];
  }
  return result;
}

uint64_t _DNSRecordTypeStringToValueCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

const char *DNSClassTypeToString(int a1)
{
  int v1 = "ANY";
  if (a1 != 255) {
    int v1 = 0LL;
  }
  if (a1 == 1) {
    return "IN";
  }
  else {
    return v1;
  }
}

const char *DNSRCodeToString(int a1)
{
  uint64_t result = "NoError";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "FormErr";
      break;
    case 2:
      uint64_t result = "ServFail";
      break;
    case 3:
      uint64_t result = "NXDomain";
      break;
    case 4:
      uint64_t result = "NotImp";
      break;
    case 5:
      uint64_t result = "Refused";
      break;
    case 6:
      uint64_t result = "YXDomain";
      break;
    case 7:
      uint64_t result = "YXRRSet";
      break;
    case 8:
      uint64_t result = "NXRRSet";
      break;
    case 9:
      uint64_t result = "NotAuth";
      break;
    case 10:
      uint64_t result = "NotZone";
      break;
    case 11:
      uint64_t result = "DSOTYPENI";
      break;
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_5;
    case 16:
      uint64_t result = "BADVERS";
      break;
    case 17:
      uint64_t result = "BADKEY";
      break;
    case 18:
      uint64_t result = "BADTIME";
      break;
    case 19:
      uint64_t result = "BADMODE";
      break;
    case 20:
      uint64_t result = "BADNAME";
      break;
    case 21:
      uint64_t result = "BADALG";
      break;
    case 22:
      uint64_t result = "BADTRUNC";
      break;
    case 23:
      uint64_t result = "BADCOOKIE";
      break;
    default:
      if (a1 == 0xFFFF) {
        uint64_t result = "Reserved";
      }
      else {
LABEL_5:
      }
        uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t DNSRCodeFromString(const void *a1)
{
  int v1 = (unsigned int *)bsearch( a1,  &DNSRCodeFromString_sTable,  0x15uLL,  0x10uLL,  (int (__cdecl *)(const void *, const void *))_DNSRCodeFromStringCmp);
  if (v1) {
    return v1[2];
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t _DNSRCodeFromStringCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

uint64_t DNSMessageToString(char *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __src[127] = *(void **)MEMORY[0x1895F89C0];
  v102 = 0LL;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_645;
  }
  _GetCUSymAddr_DataBuffer_Init_sAddr(v104, v115, 512LL, -1LL);
  if (a2 < 0xC)
  {
LABEL_648:
    uint64_t v73 = 4294960553LL;
    goto LABEL_638;
  }

  unint64_t v8 = ((unint64_t)a1[2] >> 3) & 0xF;
  unsigned int v97 = __rev16(*((unsigned __int16 *)a1 + 2));
  unint64_t v99 = (unint64_t)a1;
  unsigned int v95 = __rev16(*((unsigned __int16 *)a1 + 3));
  unsigned int v94 = __rev16(*((unsigned __int16 *)a1 + 4));
  uint64_t v92 = a4;
  unsigned int v93 = __rev16(*((unsigned __int16 *)a1 + 5));
  unint64_t v9 = (const char *)&unk_188FBED22;
  unint64_t v100 = a2;
  if ((a3 & 0x20) != 0) {
    goto LABEL_75;
  }
  unint64_t v10 = a1[3] | (a1[2] << 8);
  uint64_t v11 = __rev16(*(unsigned __int16 *)a1);
  if ((a3 & 4) != 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    int v13 = (uint64_t (*)(_BYTE *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v16 = 81LL;
    if ((v10 & 0x8000u) != 0LL) {
      uint64_t v16 = 82LL;
    }
    unint64_t v89 = v10;
    uint64_t v90 = v16;
    uint64_t v88 = v11;
    size_t v15 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  "ID:               0x%04X (%u)\n",  v11,  v11);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    int v13 = (uint64_t (*)(_BYTE *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
    uint64_t v14 = 81LL;
    if ((v10 & 0x8000u) != 0LL) {
      uint64_t v14 = 82LL;
    }
    uint64_t v88 = v14;
    size_t v15 = "Flags:            0x%04X %c/";
  }

  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = v13(v104, v15);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_637;
  }
  if (v8 > 6 || (_DWORD)v8 == 3)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    int v17 = v8;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "OPCODE%d");
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    int v17 = v8;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s");
  }

  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_637;
  }
  for (uint64_t i = 0LL; i != 14; i += 2LL)
  {
    if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_645;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  ", %s",  (&kDNSHeaderFlagsDescs)[i]);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_637;
      }
    }
  }

  int v19 = DNSRCodeToString(v10 & 0xF);
  if (v19)
  {
    v20 = v19;
    a1 = (char *)v99;
    LODWORD(v8) = v17;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    unint64_t v86 = (unint64_t)v20;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, ", %s");
  }

  else
  {
    a1 = (char *)v99;
    LODWORD(v8) = v17;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    unint64_t v86 = v10 & 0xF;
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, ", RCODE%d");
  }

  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
  {
LABEL_637:
    uint64_t v73 = CUSymAddr_DataBuffer_AppendF_sAddr;
    goto LABEL_638;
  }

  if ((a3 & 4) == 0)
  {
    if ((a3 & 0x40) != 0) {
      goto LABEL_629;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\n", v86, v88);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "Question count:   %u\n", v97);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "Answer count:     %u\n", v95);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "Authority count:  %u\n", v94);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "Additional count: %u\n", v93);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    unint64_t v9 = (const char *)&unk_188FBED22;
LABEL_75:
    if ((a3 & 0x10) == 0) {
      goto LABEL_76;
    }
LABEL_629:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    }
    if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v104, &unk_188FBED22, 1LL);
    if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    {
      if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
      }
      if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
      {
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v104, v92, __src);
        goto LABEL_637;
      }

LABEL_645:
      uint64_t v73 = 4294960561LL;
      goto LABEL_638;
    }

    goto LABEL_637;
  }

  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_645;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, ")", v86, v88);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_637;
  }
  if ((a3 & 0x40) != 0) {
    goto LABEL_629;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_645;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  ", counts: %u/%u/%u/%u",  v97,  v95,  v94,  v93);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_637;
  }
  unint64_t v9 = ", ";
  if ((a3 & 0x10) != 0) {
    goto LABEL_629;
  }
LABEL_76:
  int v91 = v8;
  int v101 = (a3 >> 3) & 1;
  v103 = a1 + 12;
  if (v97)
  {
    int v21 = 0;
    char v22 = 0LL;
    unsigned int v23 = v113;
    while (1)
    {
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion( (unint64_t)a1,  a2,  v103,  v23,  __src,  v116,  &v103);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_637;
      }
      BOOL v24 = SLOWORD(v116[0]) < 0;
      if ((a3 & 1) != 0) {
        LOWORD(v116[0]) &= ~0x8000u;
      }
      int v25 = a3 & v24;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (!v22 || !DomainNameEqual((unsigned __int8 *)v23, v22))
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v114, 0LL);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          if (v101 && _NameIsPrivate((const char *)v114))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s ");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s ");
          }

          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          char v22 = (unsigned __int8 *)v23;
          if (v23 == v113) {
            unsigned int v23 = v112;
          }
          else {
            unsigned int v23 = v113;
          }
          *unsigned int v23 = 0;
        }

        int64_t v29 = "ANY";
        if (LOWORD(v116[0]) != 255) {
          int64_t v29 = 0LL;
        }
        if (LOWORD(v116[0]) == 1) {
          unint64_t v30 = "IN";
        }
        else {
          unint64_t v30 = v29;
        }
        if (v30)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s", v30);
          a1 = (char *)v99;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a1 = (char *)v99;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "CLASS%u", LOWORD(v116[0]));
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        if ((a3 & 1) != 0)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          int v31 = "QM";
          if (v25) {
            int v31 = "QU";
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", v31);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        uint64_t v32 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v32)
        {
          v33 = v32;
          a2 = v100;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v85 = (unint64_t)v33;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s?");
        }

        else
        {
          a2 = v100;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v85 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u?");
        }

        unint64_t v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
      }

      else
      {
        if (!v21)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\nQUESTION SECTION\n");
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v114, 0LL);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (v101 && _NameIsPrivate((const char *)v114))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~-30s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%-30s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        char v26 = "QM";
        if (v25) {
          char v26 = "QU";
        }
        if ((a3 & 1) == 0) {
          char v26 = (const char *)&unk_188FBED22;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %2s", v26);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        __int16 v27 = "ANY";
        if (LOWORD(v116[0]) != 255) {
          __int16 v27 = 0LL;
        }
        if (LOWORD(v116[0]) == 1) {
          __int16 v28 = "IN";
        }
        else {
          __int16 v28 = v27;
        }
        if (v28)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", v28);
          a2 = v100;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a2 = v100;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " CLASS%u", LOWORD(v116[0]));
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        char v34 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v34)
        {
          __int16 v35 = v34;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v85 = (unint64_t)v35;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %-5s\n");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v85 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u\n");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
      }

      if (v97 == ++v21) {
        goto LABEL_201;
      }
    }
  }

  char v22 = 0LL;
  unsigned int v23 = v113;
LABEL_201:
  if (v94 + v95 + v93)
  {
    int v36 = 0;
    while (1)
    {
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v103,  v23,  &v110,  &v109,  &v111,  (unsigned __int16 **)__src,  v116,  0LL,  0LL,  0LL,  0LL,  &v103);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_637;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v114, 0LL);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_637;
      }
      BOOL v37 = (__int16)v109 < 0;
      if ((a3 & 1) != 0) {
        LOWORD(v109) = (unsigned __int16)v109 & 0x7FFF;
      }
      int v38 = a3 & v37;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (!v22 || !DomainNameEqual((unsigned __int8 *)v23, v22))
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v114, 0LL);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          if (v101 && _NameIsPrivate((const char *)v114))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s ");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s ");
          }

          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          char v22 = (unsigned __int8 *)v23;
          if (v23 == v113) {
            unsigned int v23 = v112;
          }
          else {
            unsigned int v23 = v113;
          }
          *unsigned int v23 = 0;
        }

        if ((unsigned __int16)v110 == 41)
        {
          if (v38)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "CF ");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_637;
            }
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a2 = v100;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  "OPT %u",  (unsigned __int16)v109);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          if ((_DWORD)v111)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " 0x%08X");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " 0");
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%u", (_DWORD)v111);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
          if (v38)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " CF");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_637;
            }
          }

          int v39 = "ANY";
          else {
            v40 = v39;
          }
          if (v40)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", v40);
            a2 = v100;
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_637;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            a2 = v100;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  " CLASS%u",  (unsigned __int16)v109);
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_637;
            }
          }

          if (DNSRecordTypeValueToString((unsigned __int16)v110))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u");
          }
        }

        unint64_t v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        goto LABEL_371;
      }

      if (v95 && !v36) {
        break;
      }
      if (v94 && v95 == v36)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\nAUTHORITY SECTION\n");
        goto LABEL_283;
      }

      if (v93 && v94 + v95 == v36)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\nADDITIONAL SECTION\n");
        goto LABEL_283;
      }

LABEL_284:
      if ((unsigned __int16)v110 == 41)
      {
        if (v101 && _NameIsPrivate((const char *)v114))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        char v41 = (const char *)&unk_188FBED22;
        if (v38) {
          char v41 = " CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  "%s OPT %u",  v41,  (unsigned __int16)v109);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        a2 = v100;
        if ((_DWORD)v111)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " 0x%08X");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " 0");
        }
      }

      else
      {
        if (v101)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~-42s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%-42s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        unsigned int v42 = (const char *)&unk_188FBED22;
        if (v38) {
          unsigned int v42 = "CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %6u %2s", (_DWORD)v111, v42);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        v43 = "ANY";
        else {
          unsigned int v44 = v43;
        }
        if (v44)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", v44);
          a2 = v100;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a2 = v100;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v104,  " CLASS%u",  (unsigned __int16)v109);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_637;
          }
        }

        if (DNSRecordTypeValueToString((unsigned __int16)v110))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %-5s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u");
        }
      }

      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_637;
      }
LABEL_371:
      if ((a3 & 2) == 0) {
        DNSRecordDataToStringEx( (unsigned __int16 *)__src[0],  v116[0],  (unsigned __int16)v110,  (unint64_t)a1,  a2,  v101,  (uint64_t)&v102);
      }
      if (v102)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", (const char *)v102);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        if (v102)
        {
          free(v102);
          v102 = 0LL;
        }
      }

      else
      {
        if (v101)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v85 = v116[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " [%zu B]");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_645;
          }
          unint64_t v87 = v116[0];
          unint64_t v89 = v116[0];
          unint64_t v85 = (unint64_t)__src[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %#H");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
      }

      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v110 == 5)
        {
          int DomainName = DNSMessageExtractDomainName((unint64_t)a1, a2, (char *)__src[0], v23, 0LL);
          unsigned int v46 = v113;
          if (v23 == v113) {
            unsigned int v46 = v112;
          }
          if (!DomainName)
          {
            char v22 = (unsigned __int8 *)v23;
            unsigned int v23 = v46;
          }

          *unsigned int v23 = 0;
        }
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\n");
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
      }

      if (v95 + v93 + v94 == ++v36) {
        goto LABEL_403;
      }
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\nANSWER SECTION\n");
LABEL_283:
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    goto LABEL_284;
  }

LABEL_403:
  if (v91 != 6) {
    goto LABEL_629;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_645;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "[");
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_637;
  }
  size_t v47 = &a1[v100];
  __int16 v48 = v103;
  if (v103 >= &a1[v100])
  {
LABEL_622:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    if (((a3 >> 2) & 1) != 0) {
      uint64_t v83 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "]", v85, v87, v89, v90);
    }
    else {
      uint64_t v83 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "\n]", v85, v87, v89, v90);
    }
    uint64_t v73 = v83;
    if ((_DWORD)v83) {
      goto LABEL_638;
    }
    goto LABEL_629;
  }

  if (((a3 >> 2) & 1) != 0) {
    v49 = (const char *)&unk_188FBED22;
  }
  else {
    v49 = "\n\t";
  }
  if (((a3 >> 2) & 1) != 0) {
    __int16 v50 = ", ";
  }
  else {
    __int16 v50 = ",\n\t";
  }
  v96 = v50;
  unint64_t v98 = (unint64_t)v47;
  while ((unint64_t)v48 >= v99)
  {
    if ((unint64_t)(v47 - v48) < 4
      || (int64_t v51 = __rev16(*((unsigned __int16 *)v48 + 1)), v52 = v48 + 4, v47 - (v48 + 4) < v51))
    {
LABEL_646:
      uint64_t v73 = 4294960546LL;
      goto LABEL_638;
    }

    unsigned int v53 = *(unsigned __int16 *)v48;
    unint64_t v54 = (unint64_t)&v52[v51];
    v103 = &v52[v51];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_645;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s", v49);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_637;
    }
    unint64_t v55 = __rev16(v53);
    v57 = "Reserved";
    uint64_t v56 = v100;
    switch((int)v55)
    {
      case 0:
        goto LABEL_437;
      case 1:
        v57 = "KeepAlive";
        goto LABEL_437;
      case 2:
        v57 = "Retry Delay";
        goto LABEL_437;
      case 3:
        v57 = "Encryption Padding";
LABEL_437:
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_645;
        }
        unint64_t v85 = (unint64_t)v57;
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s: ");
LABEL_441:
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_637;
        }
        break;
      default:
        uint64_t v56 = v100;
        switch((int)v55)
        {
          case '@':
            v57 = "SUBSCRIBE";
            goto LABEL_437;
          case 'A':
            v57 = "PUSH";
            goto LABEL_437;
          case 'B':
            v57 = "UNSUBSCRIBE";
            goto LABEL_437;
          case 'C':
            v57 = "RECONFIRM";
            goto LABEL_437;
          default:
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_645;
            }
            unint64_t v85 = v55;
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "DSO-TYPE%u: ");
            break;
        }

        goto LABEL_441;
    }

    v110 = 0LL;
    v111 = (unsigned __int16 *)(v48 + 4);
    switch((int)v55)
    {
      case '@':
        uint64_t v58 = DNSMessageExtractDomainNameString(v99, v56, v48 + 4, (unsigned __int8 *)__src, &v111);
        if ((_DWORD)v58) {
          goto LABEL_567;
        }
        int v59 = v111;
        if (v54 - (void)v111 == 4)
        {
          if (v101 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)__src;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)__src;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          unint64_t v66 = __rev16(v59[1]);
          v67 = "ANY";
          if ((_DWORD)v66 != 255) {
            v67 = 0LL;
          }
          if ((_DWORD)v66 == 1) {
            v68 = "IN";
          }
          else {
            v68 = v67;
          }
          if (v68)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)v68;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = v66;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " CLASS%u");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          unint64_t v74 = __rev16(*v59);
          unint64_t v75 = DNSRecordTypeValueToString(v74);
          if (v75)
          {
            v76 = v75;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v85 = (unint64_t)v76;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
              goto LABEL_612;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v85 = v74;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u");
              goto LABEL_612;
            }
          }

          goto LABEL_619;
        }

        uint64_t v73 = 4294960553LL;
        goto LABEL_614;
      case 'A':
        while (1)
        {
          uint64_t v58 = _DNSMessageExtractRecordEx( v99,  v56,  v52,  (char *)v116,  &v106,  &v105,  &v107,  &v109,  &v108,  0LL,  0LL,  0LL,  0LL,  &v111);
          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          uint64_t v58 = DomainNameToString((unsigned __int8 *)v116, 0LL, (unsigned __int8 *)__src, 0LL);
          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          if (v101 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)__src;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)__src;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_619;
          }
          uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " 0x%08X", v107);
          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          int64_t v60 = "ANY";
          if (v105 != 255) {
            int64_t v60 = 0LL;
          }
          if (v105 == 1) {
            unint64_t v61 = "IN";
          }
          else {
            unint64_t v61 = v60;
          }
          if (v61)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)v61;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = v105;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " CLASS%u");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          v62 = DNSRecordTypeValueToString(v106);
          if (v62)
          {
            size_t v63 = v62;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)v63;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = v106;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          DNSRecordDataToStringEx(v109, v108, v106, v99, v56, v101, (uint64_t)&v110);
          if (v110)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", (const char *)v110);
            if ((_DWORD)v58) {
              goto LABEL_567;
            }
            if (v110)
            {
              free(v110);
              v110 = 0LL;
            }
          }

          else
          {
            if (v101)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_619;
              }
              unint64_t v85 = v108;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " [%zu B]");
            }

            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_619;
              }
              unint64_t v87 = v108;
              unint64_t v89 = v108;
              unint64_t v85 = (unint64_t)v109;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %#H");
            }

            if ((_DWORD)v58) {
              goto LABEL_567;
            }
          }

          v52 = (char *)v111;
        }

      case 'B':
        if ((_DWORD)v51 != 2) {
          goto LABEL_648;
        }
        unsigned int v64 = *((unsigned __int16 *)v48 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_619;
        }
        uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%u", __rev16(v64));
        goto LABEL_567;
      case 'C':
        uint64_t v58 = DNSMessageExtractDomainNameString(v99, v56, v48 + 4, (unsigned __int8 *)__src, &v111);
        if ((_DWORD)v58) {
          goto LABEL_567;
        }
        size_t v65 = v111;
        if (v54 - (unint64_t)v111 >= 4)
        {
          v111 += 2;
          if (v101 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v85 = (unint64_t)__src;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%~s");
              goto LABEL_551;
            }

LABEL_619:
            uint64_t v73 = 4294960561LL;
            goto LABEL_614;
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_619;
          }
          unint64_t v85 = (unint64_t)__src;
          uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "%s");
LABEL_551:
          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          unsigned int v69 = __rev16(v65[1]);
          v70 = "ANY";
          if (v69 != 255) {
            v70 = 0LL;
          }
          if (v69 == 1) {
            int v71 = "IN";
          }
          else {
            int v71 = v70;
          }
          if (v71)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            unint64_t v72 = v99;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", v71);
            if ((_DWORD)v58) {
              goto LABEL_567;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " CLASS%u", v69);
            unint64_t v72 = v99;
            if ((_DWORD)v58) {
              goto LABEL_567;
            }
          }

          unint64_t v77 = __rev16(*v65);
          v78 = DNSRecordTypeValueToString(v77);
          if (v78)
          {
            uint64_t v79 = v78;
            uint64_t v80 = v100;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = (unint64_t)v79;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s");
          }

          else
          {
            uint64_t v80 = v100;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_619;
            }
            unint64_t v85 = v77;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " TYPE%u");
          }

          if ((_DWORD)v58) {
            goto LABEL_567;
          }
          v81 = v111;
          unint64_t v82 = v54 - (void)v111;
          DNSRecordDataToStringEx(v111, v54 - (void)v111, v77, v72, v80, v101, (uint64_t)&v110);
          if (v110)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " %s", (const char *)v110);
              if ((_DWORD)v58) {
                goto LABEL_567;
              }
              if (v110)
              {
                free(v110);
                v110 = 0LL;
              }

              goto LABEL_613;
            }
          }

          else if (v101)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v85 = v82;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " [%zu B]");
              goto LABEL_612;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v87 = v82;
              unint64_t v89 = v82;
              unint64_t v85 = (unint64_t)v81;
              uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, " '%H'");
LABEL_612:
              if ((_DWORD)v58) {
                goto LABEL_567;
              }
LABEL_613:
              uint64_t v73 = 0LL;
              goto LABEL_614;
            }
          }

          goto LABEL_619;
        }

LABEL_620:
        uint64_t v73 = 4294960546LL;
LABEL_614:
        if (v110) {
          free(v110);
        }
        if ((_DWORD)v73) {
          goto LABEL_638;
        }
        __int16 v48 = v103;
        v49 = v96;
        size_t v47 = (char *)v98;
        break;
      default:
        if (v101)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v85 = v51;
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "[%u B]");
            goto LABEL_567;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v87 = v51;
            unint64_t v89 = v51;
            unint64_t v85 = (unint64_t)(v48 + 4);
            uint64_t v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v104, "'%H'");
LABEL_567:
            uint64_t v73 = v58;
            goto LABEL_614;
          }
        }

        goto LABEL_619;
    }
  }

  uint64_t v73 = 4294960586LL;
LABEL_638:
  if (v102) {
    free(v102);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
    _GetCUSymAddr_DataBuffer_Free_sAddr(v104);
  }
  return v73;
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result = strcasecmp(a1, ".");
  if ((_DWORD)result) {
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  }
  return result;
}

uint64_t DNSRecordDataToStringEx( unsigned __int16 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  v88[127] = *(void **)MEMORY[0x1895F89C0];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_427;
  }
  uint64_t v79 = a7;
  unint64_t v13 = (unint64_t)a1 + a2;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v85, v87, 256LL, -1LL);
  uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960582LL;
  if (a3 <= 32)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4) {
          goto LABEL_429;
        }
        uint64_t appended = _AppendIPv4Address((uint64_t)v85, 0LL, (unsigned int *)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0LL, a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
        goto LABEL_422;
      case 6:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v86, (unsigned __int8 *)v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
          uint64_t appended = DomainNameToString(v86, (unint64_t)a1 + a2, (unsigned __int8 *)v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        unint64_t v74 = (unsigned int *)v86;
        if (v13 - (void)v86 != 20) {
          goto LABEL_429;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  " %u %u %u %u %u",  bswap32(*v74),  bswap32(v74[1]),  bswap32(v74[2]),  bswap32(v74[3]),  bswap32(v74[4]));
          goto LABEL_412;
        }

        goto LABEL_427;
      case 13:
      case 16:
        if (!a2) {
          goto LABEL_429;
        }
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "[%zu B]");
        }

        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%#H");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%#{txt}");
        }

        if (!(_DWORD)appended) {
          goto LABEL_413;
        }
        goto LABEL_421;
      case 15:
        unsigned int v72 = *a1;
        int v71 = (char *)(a1 + 1);
        unsigned int v70 = v72;
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, v71, (unsigned __int8 *)v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)v71, v13, (unsigned __int8 *)v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
        }

        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(v70));
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        v76 = " ";
        break;
      default:
        if (a3 == 25) {
          goto LABEL_229;
        }
        if (a3 != 28) {
          goto LABEL_422;
        }
        if (a2 != 16) {
          goto LABEL_429;
        }
        uint64_t appended = _AppendIPv6Address((uint64_t)v85, 0LL, (uint64_t)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        goto LABEL_413;
    }

    goto LABEL_411;
  }

  switch(a3)
  {
    case ')':
      uint64_t v16 = (const char *)&unk_188FBED22;
      while (2)
      {
        int v17 = a1 + 2;
        unint64_t v18 = __rev16(a1[1]);
        unsigned int v19 = *a1;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s{", v16);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        unsigned int v20 = __rev16(v19);
        if (v20 == 12)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "Padding");
        }

        else if (v20 == 15)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "EDE");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_427;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "CODE%u");
        }

        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, ", ");
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        int v21 = (unsigned __int16 *)&v17[v18];
        if (v20 != 15 || !(_DWORD)v18)
        {
          if (a6)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "[%u B]");
          }

          else if (v20 == 12 && (_DWORD)v18 && !*v17 && !memcmp(a1 + 2, (char *)a1 + 5, v18 - 1))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "<%u zero bytes>");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "'%H'");
          }

          goto LABEL_78;
        }

        unsigned int v22 = a1[2];
        int v23 = (unsigned __int16)((_WORD)v21 - ((_WORD)a1 + 6));
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        unsigned int v24 = __rev16(v22);
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "code: %u", v24);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
        if (v23 | v24)
        {
          if (v24 <= 0x18)
          {
            int v25 = off_18A330C18[v24];
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " (%s)", v25);
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
          }

          if (v23)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_427;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, ", extra-text: ");
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
            if (a6)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_427;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "«REDACTED»");
            }

            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_427;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "'%.*s'");
            }

LABEL_78:
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
          }
        }

        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "}");
          uint64_t v16 = ", ";
          a1 = v21;
          if ((_DWORD)appended) {
            goto LABEL_421;
          }
          continue;
        }

        goto LABEL_427;
      }

    case '*':
    case ',':
    case '-':
    case '1':
      goto LABEL_422;
    case '+':
      if (a2 < 4) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  "%u %u %u",  __rev16(*a1),  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (a2 == 4) {
        goto LABEL_413;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %.4H", a1 + 2, a2 - 4, a2 - 4);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      goto LABEL_413;
    case '.':
      if (a2 < 0x13) {
        goto LABEL_429;
      }
      if (DNSRecordTypeValueToString(__rev16(*a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_427;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "TYPE%u");
      }

      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  " %u %u %u",  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3),  bswap32(*((_DWORD *)a1 + 1)));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      uint64_t v82 = 0LL;
      uint64_t v83 = 0LL;
      uint64_t v81 = 0LL;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_427;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr( bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880LL,  (char *)&v83 + 4,  &v83,  (char *)&v82 + 4,  &v82,  (char *)&v81 + 4,  &v81);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  " %u%02u%02u%02u%02u%02u",  HIDWORD(v83),  v83,  HIDWORD(v82),  v82,  HIDWORD(v81),  v81);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_427;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr( bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880LL,  (char *)&v83 + 4,  &v83,  (char *)&v82 + 4,  &v82,  (char *)&v81 + 4,  &v81);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  " %u%02u%02u%02u%02u%02u",  HIDWORD(v83),  v83,  HIDWORD(v82),  v82,  HIDWORD(v81),  v81);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %u", __rev16(a1[8]));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      unint64_t v86 = (unsigned __int8 *)(a1 + 9);
      uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 18, v13, (unsigned __int8 *)v88, &v86);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v88);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      v84 = 0LL;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0LL, &v84, 0LL);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s", v84);
      }
      else {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
      }
      v52 = v84;
      if (v84) {
LABEL_243:
      }
        free(v52);
LABEL_244:
      if (!(_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
        goto LABEL_413;
      }
      goto LABEL_422;
    case '/':
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v88, &v86);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
      }

      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, (unsigned __int8 *)v88, &v86);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
      }

      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, 0LL, a6, (const char *)v88);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      uint64_t v73 = v86;
LABEL_343:
      uint64_t appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v85, v73, v13);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      goto LABEL_413;
    case '0':
LABEL_229:
      if (a2 < 5) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  "%u %u %u",  __rev16(*a1),  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      unint64_t v86 = (unsigned __int8 *)(a1 + 2);
      v88[0] = 0LL;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0LL, v88, 0LL);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s", (const char *)v88[0]);
      }
      else {
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
      }
      v52 = (char *)v88[0];
      if (v88[0]) {
        goto LABEL_243;
      }
      goto LABEL_244;
    case '2':
      if (a2 < 5) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v85,  "%u %u %u",  *(unsigned __int8 *)a1,  *((unsigned __int8 *)a1 + 1),  __rev16(a1[1]));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      unint64_t v86 = (unsigned __int8 *)(a1 + 2);
      unint64_t v86 = (unsigned __int8 *)a1 + 5;
      unint64_t v53 = *((unsigned __int8 *)a1 + 4);
      if (a2 - 5 < v53) {
        goto LABEL_429;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %.4H", v86, v53, v53);
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      unint64_t v54 = &v86[v53];
      unint64_t v86 = v54;
      unint64_t v55 = v54 + 1;
      unint64_t v86 = v54 + 1;
      unint64_t v56 = *v54;
      if (!*v54) {
        goto LABEL_293;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " ");
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      unint64_t v55 = v86;
LABEL_293:
      v57 = &v55[v56];
      while (2)
      {
        unint64_t v58 = v57 - v86;
        if (v57 != v86)
        {
          uint64_t v59 = 0LL;
          switch(v58)
          {
            case 1uLL:
              uint64_t v60 = 0LL;
              unint64_t v61 = (unint64_t)*v86++ << 32;
              goto LABEL_312;
            case 2uLL:
              uint64_t v66 = 0LL;
              unint64_t v64 = (unint64_t)v86[1] << 24;
              unint64_t v61 = v64 | ((unint64_t)*v86 << 32);
              v86 += 2;
              goto LABEL_309;
            case 3uLL:
              unsigned __int8 v67 = v86[2];
              unint64_t v64 = ((unint64_t)v67 << 16) | ((unint64_t)v86[1] << 24);
              unint64_t v61 = v64 | ((unint64_t)*v86 << 32);
              v86 += 3;
              BYTE4(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v67 & 0xF)];
              uint64_t v66 = 5LL;
              goto LABEL_309;
            case 4uLL:
              goto LABEL_298;
            default:
              uint64_t v59 = v86[4];
LABEL_298:
              unint64_t v62 = v86[3];
              unint64_t v63 = v59 | (v62 << 8);
              unint64_t v64 = ((unint64_t)v86[1] << 24) | ((unint64_t)v86[2] << 16) | v63;
              unint64_t v61 = v64 | ((unint64_t)*v86 << 32);
              if (v58 >= 5) {
                uint64_t v65 = 5LL;
              }
              else {
                uint64_t v65 = v57 - v86;
              }
              v86 += v65;
              if (v58 == 1)
              {
                uint64_t v60 = 0LL;
              }

              else
              {
                if (v58 == 4)
                {
                  uint64_t v66 = 7LL;
                }

                else
                {
                  HIBYTE(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v59 & 0x1F];
                  uint64_t v66 = 8LL;
                }

                char v68 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v62 >> 2) & 0x1F];
                BYTE6(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 5) & 0x1F];
                BYTE5(v88[0]) = v68;
                BYTE4(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 15) & 0x1F];
LABEL_309:
                BYTE3(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 20) & 0x1F];
                BYTE2(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v64 >> 25) & 0x1F];
                if (v66) {
                  uint64_t v60 = v66;
                }
                else {
                  uint64_t v60 = 4LL;
                }
              }

LABEL_312:
              BYTE1(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v61 >> 30) & 0x1F];
              LOBYTE(v88[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v61 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              }
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_427;
              }
              if (v60) {
                uint64_t v69 = v60;
              }
              else {
                uint64_t v69 = 2LL;
              }
              uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v85, v88, v69);
              if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_422;
              }
              continue;
          }
        }

        break;
      }

      uint64_t v73 = v57;
      goto LABEL_343;
    default:
      if ((a3 - 64) < 2)
      {
        if (v13 < (unint64_t)a1)
        {
LABEL_430:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960586LL;
          goto LABEL_422;
        }

        if (a2 >= 2)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(*a1));
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
            unint64_t v86 = (unsigned __int8 *)(a1 + 1);
            uint64_t appended = DomainNameToString( (unsigned __int8 *)a1 + 2,  (unint64_t)a1 + a2,  (unsigned __int8 *)v88,  &v86);
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
            uint64_t appended = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)" ", a6, (const char *)v88);
            if ((_DWORD)appended) {
              goto LABEL_421;
            }
            char v26 = v86;
            while (2)
            {
              if (v13 - (unint64_t)v26 < 4)
              {
LABEL_428:
                uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960546LL;
                goto LABEL_422;
              }

              __int16 v27 = (unsigned __int8 *)__rev16(*(unsigned __int16 *)v26);
              unsigned int v28 = *((unsigned __int16 *)v26 + 1);
              int64_t v29 = _DNSSVCBKeyToString((int)v27);
              if (v29)
              {
                unint64_t v30 = (unsigned __int8 *)v29;
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  v78 = v30;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " %s=");
                  goto LABEL_108;
                }
              }

              else
              {
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  v78 = v27;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, " key%u=");
LABEL_108:
                  if ((_DWORD)appended) {
                    goto LABEL_421;
                  }
                  int v31 = (unsigned __int8 *)__rev16(v28);
                  uint64_t v32 = v26 + 4;
                  unint64_t v86 = v26 + 4;
                  if (v13 - (unint64_t)(v26 + 4) >= v31)
                  {
                    switch((int)v27)
                    {
                      case 0:
                        unint64_t v33 = (unint64_t)&v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        char v34 = 0LL;
                        char v35 = 1;
                        do
                        {
                          int v36 = (unsigned __int8 *)__rev16(*(unsigned __int16 *)v32);
                          unint64_t v86 = v32 + 2;
                          BOOL v37 = _DNSSVCBKeyToString((int)v36);
                          if ((v35 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s", v34);
                            if ((_DWORD)appended) {
                              goto LABEL_421;
                            }
                          }

                          if (v37)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            v78 = (unsigned __int8 *)v37;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s");
                          }

                          else
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            v78 = v36;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "key%u");
                          }

                          if ((_DWORD)appended) {
                            goto LABEL_421;
                          }
                          char v35 = 0;
                          uint64_t v32 = v86;
                          char v34 = ",";
                        }

                        while ((unint64_t)v86 < v33);
                        goto LABEL_212;
                      case 1:
                        int v38 = &v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        int v39 = 0LL;
                        char v40 = 1;
                        while (1)
                        {
                          unint64_t v86 = v32 + 1;
                          unint64_t v41 = *v32;
                          if (v38 - (v32 + 1) < v41) {
                            goto LABEL_429;
                          }
                          ++v32;
                          if ((v40 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_427;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%s", v39);
                            if ((_DWORD)appended) {
                              goto LABEL_421;
                            }
                            uint64_t v32 = v86;
                          }

                          unsigned int v42 = &v32[v41];
                          while (v32 < v42)
                          {
                            v43 = (unsigned __int8 *)*v32;
                            if (((_DWORD)v43 - 32) > 0x5E)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%03d");
                            }

                            else if ((_DWORD)v43 == 92 || (_DWORD)v43 == 44)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%c");
                            }

                            else
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_427;
                              }
                              v78 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%c");
                            }

                            if ((_DWORD)appended) {
                              goto LABEL_421;
                            }
                            uint64_t v32 = ++v86;
                          }

                          char v40 = 0;
                          int v39 = ",";
                          if (v32 >= v38) {
                            goto LABEL_212;
                          }
                        }

                      case 2:
                        goto LABEL_136;
                      case 3:
                        if ((_DWORD)v31 != 2) {
                          goto LABEL_429;
                        }
                        unsigned int v44 = *((unsigned __int16 *)v26 + 2);
                        unint64_t v86 = &v31[(void)v32];
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_427;
                        }
                        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u", __rev16(v44));
                        if ((_DWORD)appended) {
                          goto LABEL_421;
                        }
                        goto LABEL_212;
                      case 4:
                        __int16 v45 = &v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        unsigned int v46 = (const char *)&unk_188FBED22;
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv4Address( (uint64_t)v85,  (uint64_t)v46,  (unsigned int *)v32,  a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_422;
                          }
                          uint64_t v32 = v86 + 4;
                          unint64_t v86 = v32;
                          if (v32 < v45)
                          {
                            unsigned int v46 = ",";
                            continue;
                          }

                          goto LABEL_212;
                        }

                      case 5:
                        goto LABEL_132;
                      case 6:
                        size_t v47 = &v31[(void)v32];
                        if (v32 >= &v31[(void)v32]) {
                          goto LABEL_212;
                        }
                        __int16 v48 = (const char *)&unk_188FBED22;
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv6Address( (uint64_t)v85,  (uint64_t)v48,  (uint64_t)v32,  a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_422;
                          }
                          uint64_t v32 = v86 + 16;
                          unint64_t v86 = v32;
                          if (v32 < v47)
                          {
                            __int16 v48 = ",";
                            continue;
                          }

                          goto LABEL_212;
                        }

                      default:
                        if ((_DWORD)v27 == 32769)
                        {
LABEL_132:
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_427;
                          }
                          v78 = v86;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%.4H");
                        }

                        else
                        {
LABEL_136:
                          if (!a6)
                          {
                            v49 = &v31[(void)v32];
                            while (v32 < v49)
                            {
                              __int16 v50 = (unsigned __int8 *)*v32;
                              if (((_DWORD)v50 - 33) > 0x5D)
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%03d");
                              }

                              else if (((_DWORD)v50 - 34) > 0x3A {
                                     || ((1LL << (v50 - 34)) & 0x4000000020000C1LL) == 0)
                              }
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%c");
                              }

                              else
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_427;
                                }
                                v78 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "\\%c");
                              }

                              if ((_DWORD)appended) {
                                goto LABEL_421;
                              }
                              uint64_t v32 = ++v86;
                            }

                            goto LABEL_212;
                          }

                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_427;
                          }
                          v78 = v31;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "<%u redacted bytes>");
                        }

                        if ((_DWORD)appended) {
                          goto LABEL_421;
                        }
                        unint64_t v86 = &v31[(void)v86];
LABEL_212:
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_427;
                        }
                        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "", v78);
                        if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                          goto LABEL_422;
                        }
                        char v26 = v86;
                        continue;
                    }
                  }

                  goto LABEL_428;
                }
              }

              break;
            }
          }

LABEL_427:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
          goto LABEL_422;
        }

LABEL_429:
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960554LL;
        goto LABEL_422;
      }

      if (a3 != 33) {
        goto LABEL_422;
      }
      if (a2 < 7) {
        goto LABEL_429;
      }
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, (unsigned __int8 *)v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
      }

      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 6, (unint64_t)a1 + a2, (unsigned __int8 *)v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_421;
        }
      }

      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_427;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v85, "%u %u %u ", __rev16(*a1), __rev16(a1[1]), __rev16(a1[2]));
      if ((_DWORD)appended) {
        goto LABEL_421;
      }
      v76 = 0LL;
LABEL_411:
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _AppendDomainNameStringEx((uint64_t)v85, (uint64_t)v76, a6, (const char *)v88);
LABEL_412:
      uint64_t CUSymAddr_DataBuffer_Append_sAddr = CUSymAddr_DataBuffer_AppendF_sAddr;
      if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      {
LABEL_413:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
        }
        if (_GetCUSymAddr_DataBuffer_Append_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v85, &unk_188FBED22, 1LL);
          if ((_DWORD)appended)
          {
LABEL_421:
            uint64_t CUSymAddr_DataBuffer_Append_sAddr = appended;
            goto LABEL_422;
          }

          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v85, v79, &v84);
            goto LABEL_421;
          }
        }

        goto LABEL_427;
      }

LABEL_422:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
      }
      if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
        _GetCUSymAddr_DataBuffer_Free_sAddr(v85);
      }
      return CUSymAddr_DataBuffer_Append_sAddr;
  }
}

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  if (a4)
  {
    unsigned int v4 = bswap32(*a3);
    if (v4) {
      BOOL v5 = v4 == 2130706433;
    }
    else {
      BOOL v5 = 1;
    }
    int v6 = !v5;
  }

  else
  {
    int v6 = 0;
  }

  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4LL, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4)
  {
    if (*(void *)a3 | *(void *)(a3 + 7)) {
      BOOL v4 = 1;
    }
    else {
      BOOL v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    }
    int v5 = v4;
  }

  else
  {
    int v5 = 0;
  }

  return _AppendIPAddress(a1, a2, a3, 16LL, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }

  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      int v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }

  return 4294960561LL;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  uint64_t v3 = a3 - (void)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      uint64_t v5 = a2[1];
      int v6 = a2 + 2;
      uint64_t v14 = a3 - (void)(a2 + 2);
      uint64_t v15 = a2[1];
      unsigned int v7 = 0;
      unsigned int v8 = 8 * v5;
      int v9 = *a2 << 8;
      else {
        int v10 = 8 * v5;
      }
      BOOL v11 = 1;
      while (1)
      {
        if (((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)) & 1) != 0)
        {
          size_t v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            size_t v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            return 4294960561LL;
          }
          uint64_t result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if ((_DWORD)result) {
            break;
          }
        }

        BOOL v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          uint64_t v3 = a3 - (void)v6;
          goto LABEL_19;
        }
      }

      uint64_t v3 = v14;
      if (v11) {
        return result;
      }
LABEL_19:
      a2 = v6;
      if (v3 > 0) {
        continue;
      }
      break;
    }
  }

  return 0LL;
}

const char *_DNSSVCBKeyToString(int a1)
{
  uint64_t result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "alpn";
      break;
    case 2:
      uint64_t result = "no-default-alpn";
      break;
    case 3:
      uint64_t result = "port";
      break;
    case 4:
      uint64_t result = "ipv4hint";
      break;
    case 5:
      uint64_t result = "echconfig";
      break;
    case 6:
      uint64_t result = "ipv6hint";
      break;
    case 7:
      uint64_t result = "dohpath";
      break;
    default:
      BOOL v4 = "odohconfig";
      if (a1 != 32769) {
        BOOL v4 = 0LL;
      }
      if (a1 == 0x8000) {
        uint64_t result = "dohuri";
      }
      else {
        uint64_t result = v4;
      }
      break;
  }

  return result;
}

char *DNSExtendedDNSErrorCodeToString(unsigned int a1)
{
  if (a1 > 0x18) {
    return 0LL;
  }
  else {
    return off_18A330C18[a1];
  }
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if ((_DWORD)a4 != 16 && (_DWORD)a4 != 4) {
    return 4294960553LL;
  }
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    }
    return 4294960561LL;
  }

  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33LL, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    }
    return 4294960561LL;
  }

  return result;
}

uint64_t DNSComputeDNSKeyTag(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = 0LL;
    int v3 = 0;
    do
    {
      int v4 = *(unsigned __int8 *)(a1 + v2);
      if ((v2 & 1) == 0) {
        v4 <<= 8;
      }
      v3 += v4;
      ++v2;
    }

    while (a2 != v2);
  }

  else
  {
    int v3 = 0;
  }

  return (unsigned __int16)(v3 + HIWORD(v3));
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_NameIsPrivate(a3))
  {
  }

  else
  {
  }

  return 4294960561LL;
}

uint64_t DNSMessagePrintObfuscatedIPv4Address(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = bswap32(a3);
  unsigned int v7 = a3;
  if (a3 && a3 != 2130706433) {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, (uint64_t)&v6, 4LL);
  }
  else {
    return 4294960561LL;
  }
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (a4 != 16 && a4 != 4) {
    return 4294960553LL;
  }
  uint64_t result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33LL, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    return 4294960561LL;
  }

  return result;
}

uint64_t DNSMessagePrintObfuscatedIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)a3 | *(void *)(a3 + 7)) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = *(unsigned __int8 *)(a3 + 15) >= 2u;
  }
  if (v6) {
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, a3, 16LL);
  }
  else {
    return 4294960561LL;
  }
}

uint64_t OSLogCopyFormattedString(char *__s1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  for (uint64_t i = (const char **)&OSLogCopyFormattedString_formatters; strcmp(__s1, *i); i += 2)
  {
    if (++v4 == 3) {
      return 0LL;
    }
  }

  return ((uint64_t (*)(uint64_t))(&OSLogCopyFormattedString_formatters)[2 * v4 + 1])(a2);
}

uint64_t srp_os_log_copy_formatted_string_ipv6_addr_segment(void *a1)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  __str[51] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v21 = objc_alloc((Class)&off_18C760020);
    id v22 = objc_alloc((Class)&off_18C760538);
    [v1 description];
    int v23 = (void *)objc_claimAutoreleasedReturnValue();
    unsigned int v24 = (void *)[v22 initWithFormat:@"<failed to decode - invalid data type: %@>", v23];
    uint64_t v15 = [v21 initWithString:v24];

    goto LABEL_19;
  }

  id v2 = v1;
  if (![v2 bytes] || !objc_msgSend(v2, "length") || (unint64_t)objc_msgSend(v2, "length") >= 0x11)
  {
    id v17 = objc_alloc((Class)&off_18C760020);
    id v19 = objc_alloc((Class)&off_18C760538);
    uint64_t v25 = [v2 length];
    unsigned int v20 = @"<failed to decode - NIL or invalid data length: %lu>";
LABEL_23:
    uint64_t v18 = objc_msgSend(v19, "initWithFormat:", v20, v25, v26);
LABEL_24:
    unint64_t v13 = (void *)v18;
    id v14 = v17;
    goto LABEL_18;
  }

  if ([v2 length])
  {
    id v17 = objc_alloc((Class)&off_18C760020);
    id v19 = objc_alloc((Class)&off_18C760538);
    uint64_t v25 = [v2 length];
    unsigned int v20 = @"<failed to decode - odd data length: %lu>";
    goto LABEL_23;
  }

  id v2 = v2;
  uint64_t v3 = [v2 bytes];
  if ([v2 length])
  {
    unint64_t v4 = 0LL;
    LODWORD(v5) = 0;
    do
    {
      unsigned int v6 = v5;
      v27[(int)v5] = bswap32(*(unsigned __int16 *)(v3 + v4)) >> 16;
      uint64_t v5 = (v5 + 1);
      v4 += 2LL;
    }

    while (v4 < [v2 length]);
    if (v6 <= 0x7FFFFFFE)
    {
      uint64_t v7 = 0LL;
      unsigned int v8 = __str;
      int v9 = (const char *)&unk_188FBED22;
      while (1)
      {
        uint64_t v10 = (char *)((char *)&v29 - v8);
        int v11 = snprintf(v8, (char *)&v29 - v8, "%s%x", v9, (unsigned __int16)v27[v7]);
        v8 += v11;
        ++v7;
        int v9 = ":";
        if (v5 == v7) {
          goto LABEL_17;
        }
      }

      id v17 = objc_alloc((Class)&off_18C760020);
      uint64_t v18 = objc_msgSend( objc_alloc((Class)&off_18C760538),  "initWithFormat:",  @"<failed to decode - snprintf: result: %d remain: %lu>",  v7,  v10);
      goto LABEL_24;
    }
  }

LABEL_17:
  +[NSString stringWithUTF8String:](&off_18C760538, "stringWithUTF8String:", __str);
  unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v14 = objc_alloc((Class)&off_18C760020);
LABEL_18:
  uint64_t v15 = [v14 initWithString:v13];

LABEL_19:
  return v15;
}

uint64_t srp_os_log_copy_formatted_string_domain_name(void *a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v10 = objc_alloc((Class)&off_18C760020);
    id v11 = objc_alloc((Class)&off_18C760538);
    [v1 description];
    size_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = (void *)[v11 initWithFormat:@"<failed to decode - invalid data type: %@>", v12];
    uint64_t v7 = [v10 initWithString:v13];

    goto LABEL_9;
  }

  id v2 = v1;
  if (![v2 bytes])
  {
    id v14 = objc_alloc((Class)&off_18C760020);
    uint64_t v15 = @"<null>";
LABEL_14:
    uint64_t v7 = [v14 initWithString:v15];
    goto LABEL_8;
  }

  if (![v2 length] || (unint64_t)objc_msgSend(v2, "length") >= 0x101)
  {
    id v9 = objc_alloc((Class)&off_18C760020);
    uint64_t v5 = (void *)objc_msgSend( objc_alloc((Class)&off_18C760538),  "initWithFormat:",  @"<failed to decode - NIL or invalid data length: %lu>",  objc_msgSend(v2, "length"));
    id v6 = v9;
    goto LABEL_7;
  }

  v16[1008] = 0;
  id v3 = v2;
  unint64_t v4 = (unsigned __int8 *)[v3 bytes];
  id v2 = v3;
  if (DomainNameToString(v4, [v2 bytes] + objc_msgSend(v2, "length"), v16, 0))
  {
    id v14 = objc_alloc((Class)&off_18C760020);
    uint64_t v15 = @"Malformed Domain Name";
    goto LABEL_14;
  }

  +[NSString stringWithUTF8String:](&off_18C760538, "stringWithUTF8String:", v16);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc((Class)&off_18C760020);
LABEL_7:
  uint64_t v7 = [v6 initWithString:v5];

LABEL_8:
LABEL_9:

  return v7;
}

uint64_t srp_os_log_copy_formatted_string_mac_addr(void *a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v1 = a1;
  __str[17] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = objc_alloc((Class)&off_18C760020);
    id v10 = objc_alloc((Class)&off_18C760538);
    [v1 description];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    size_t v12 = (void *)[v10 initWithFormat:@"<failed to decode - invalid data type: %@>", v11];
    uint64_t v6 = [v9 initWithString:v12];

    goto LABEL_8;
  }

  id v2 = v1;
  if ([v2 bytes] && objc_msgSend(v2, "length") == 6)
  {
    id v2 = v2;
    id v3 = (unsigned __int8 *)[v2 bytes];
    if (snprintf(__str, 0x12uLL, "%02x:%02x:%02x:%02x:%02x:%02x", *v3, v3[1], v3[2], v3[3], v3[4], v3[5]) <= 0)
    {
      uint64_t v6 = [objc_alloc((Class)&off_18C760020) initWithString:@"<failed to decode - MAC address conversion failed>"];
      goto LABEL_7;
    }

    +[NSString stringWithUTF8String:](&off_18C760538, "stringWithUTF8String:", __str);
    unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = objc_alloc((Class)&off_18C760020);
  }

  else
  {
    id v8 = objc_alloc((Class)&off_18C760020);
    unint64_t v4 = (void *)objc_msgSend( objc_alloc((Class)&off_18C760538),  "initWithFormat:",  @"<failed to decode - NIL or invalid data length: %lu>",  objc_msgSend(v2, "length"));
    id v5 = v8;
  }

  uint64_t v6 = [v5 initWithString:v4];

LABEL_7:
LABEL_8:

  return v6;
}

_BYTE *mdns_memcpy_bits(_BYTE *__dst, void *__src, unint64_t a3)
{
  char v3 = a3;
  id v5 = __dst;
  unint64_t v6 = a3 >> 3;
  if (a3 >= 8) {
    __dst = memcpy(__dst, __src, a3 >> 3);
  }
  if ((v3 & 7) != 0) {
    v5[v6] = v5[v6] & ~(-1 << (8 - (v3 & 7))) | *((_BYTE *)__src + v6) & (-1 << (8 - (v3 & 7)));
  }
  return __dst;
}

uint64_t mdns_memcmp_us_ascii_case_insensitive(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3)
{
  if (a3)
  {
    while (1)
    {
      unsigned int v4 = *a1++;
      unsigned int v3 = v4;
      unsigned int v5 = v4 + 32;
      BOOL v6 = v4 - 65 >= 0x1A;
      unsigned int v8 = *a2++;
      unsigned int v7 = v8;
      if (!v6) {
        unsigned int v3 = v5;
      }
      if (v7 - 65 < 0x1A) {
        v7 += 32;
      }
      if (v3 < v7) {
        return -1;
      }
      if (v3 > v7) {
        break;
      }
      if (!--a3) {
        return 0;
      }
    }

    return 1;
  }

  else
  {
    return 0;
  }

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FAF60](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}