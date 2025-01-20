char *mdns_dns_service_type_description(unsigned int a1)
{
  if (a1 > 5) {
    return 0LL;
  }
  else {
    return off_18A3202D8[a1];
  }
}

uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, void *a5)
{
  if (__dst) {
    v6 = __dst + 256;
  }
  else {
    v6 = 0LL;
  }
  uint64_t result = 4294960586LL;
  unint64_t v8 = a1 + a2;
  v10 = __dst;
  unsigned int v11 = *__src;
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
        unsigned int v11 = *__src;
        if (v11 > 0xBF) {
          return 4294960554LL;
        }
      }

      else
      {
        v13 = &__src[v11 + 1];
        if (v10)
        {
          uint64_t v14 = v11 + 1;
          if (v6 - v10 <= v14) {
            return 4294960545LL;
          }
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }

        unsigned int v11 = *v13;
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
    _BYTE *v10 = 0;
LABEL_23:
  uint64_t result = 0LL;
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
  uint64_t v8 = 0LL;
  memset(__dst, 0, sizeof(__dst));
  uint64_t result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    uint64_t result = DomainNameToString((unsigned __int8 *)__dst, 0LL, a4, 0LL);
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
  uint64_t v14 = 0LL;
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
  v27 = 0LL;
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
  v76 = 0LL;
  memset(__srca, 0, 256);
  memset(__dst, 0, sizeof(__dst));
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
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
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
          int v56 = LOBYTE(__dst[0]);
          v57 = (char *)__dst;
          if (LOBYTE(__dst[0]))
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

          int64_t v60 = v57 - (char *)__dst;
          unint64_t v61 = v57 - (char *)__dst + 1;
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
        uint64_t result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
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
          int v42 = LOBYTE(__dst[0]);
          v43 = (char *)__dst;
          if (LOBYTE(__dst[0]))
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

          int64_t v46 = v43 - (char *)__dst;
          unint64_t v47 = v43 - (char *)__dst + 1;
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
          v35 = (char *)__dst;
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
      v12[0] = 0LL;
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
  v17 = 0LL;
  uint64_t result = DNSMessageGetAnswerSection((unint64_t)a1, a2, &v17);
  if (!(_DWORD)result)
  {
    unsigned int v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        __int16 v16 = 0;
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
          __int16 v15 = 0;
          v13 = v17;
          uint64_t result = _DNSMessageExtractRecordEx( (unint64_t)a1,  a2,  v17,  0LL,  &v15,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  &v17);
          if ((_DWORD)result) {
            break;
          }
          if (v15 == 41)
          {
            if (v12 || *v13) {
              return 4294960554LL;
            }
            char v11 = (char *)(v17 - v13);
            unint64_t v12 = v13;
          }

          else
          {
            v13 = v12;
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
        v13 = 0LL;
        char v11 = 0LL;
        if (a3) {
LABEL_16:
        }
          *a3 = v13;
LABEL_17:
        uint64_t result = 0LL;
        if (a4) {
          *a4 = v11;
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

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, void *a3, char **a4)
{
  uint64_t v72 = *MEMORY[0x1895F89C0];
  int v53 = 0LL;
  int v52 = 0;
  memset(__src, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  if (a2 < 0xC)
  {
LABEL_69:
    int v36 = 0LL;
    v20 = 0LL;
    int DomainName = -6743;
    goto LABEL_58;
  }

  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    int v36 = 0LL;
    v20 = 0LL;
    int DomainName = -6764;
    goto LABEL_58;
  }

  int v53 = (char *)(a1 + 12);
  int DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v52 + 1, &v52, &v53);
  if (DomainName) {
    goto LABEL_63;
  }
  if ((unsigned __int16)v52 != 1)
  {
    int v36 = 0LL;
    v20 = 0LL;
    int DomainName = -6756;
    goto LABEL_58;
  }

  int v9 = __src[0];
  v38 = a3;
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
  unint64_t v41 = v53;
  __memcpy_chk();
  unsigned int v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    int v15 = 0;
    unsigned int v43 = -1;
LABEL_9:
    int v16 = 0;
    int v53 = v41;
    char v17 = 1;
    while (1)
    {
      v51 = 0LL;
      LODWORD(v49) = 0;
      LOWORD(v48) = 0;
      unsigned __int16 v50 = 0;
      __int128 v68 = 0u;
      __int128 v69 = 0u;
      __int128 v66 = 0u;
      __int128 v67 = 0u;
      __int128 v64 = 0u;
      __int128 v65 = 0u;
      __int128 v62 = 0u;
      __int128 v63 = 0u;
      __int128 v60 = 0u;
      __int128 v61 = 0u;
      __int128 v58 = 0u;
      __int128 v59 = 0u;
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      int DomainName = _DNSMessageExtractRecordEx( a1,  a2,  v53,  (char *)&v54,  &v48,  &v50,  &v49,  (unsigned __int16 **)&v51,  0LL,  0LL,  0LL,  0LL,  0LL,  &v53);
      if (DomainName) {
        break;
      }
      if ((unsigned __int16)v48 == 5
        && v50 == (unsigned __int16)v52
        && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
      {
        int DomainName = DNSMessageExtractDomainName(a1, a2, v51, __dst, 0LL);
        if (DomainName) {
          break;
        }
        char v17 = 0;
        unsigned int v18 = v43;
        unsigned int v43 = v18;
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

LABEL_63:
    int v36 = 0LL;
LABEL_57:
    v20 = 0LL;
    goto LABEL_58;
  }

  unsigned int v43 = -1;
LABEL_25:
  int v39 = a4;
  int64_t v46 = 0LL;
  v19 = 0LL;
  v20 = 0LL;
  size_t __size = v13 + 17;
  char v21 = 1;
  a4 = &v53;
  while (1)
  {
    char v42 = v21;
    int v53 = v41;
    if (v14) {
      break;
    }
    unsigned int v45 = 0;
    if (v20) {
      goto LABEL_52;
    }
LABEL_45:
    if (!__size || (int64_t v29 = (char *)calloc(1uLL, __size)) == 0LL)
    {
      __break(1u);
      goto LABEL_69;
    }

    v20 = v29;
    if (__size < 0xC) {
      goto LABEL_67;
    }
    int v30 = *(_DWORD *)a1;
    *((_WORD *)v29 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)int64_t v29 = v30;
    *(_DWORD *)(v29 + 6) = 0;
    *((_WORD *)v29 + 5) = 0;
    if (__size - 12 < __n) {
      goto LABEL_67;
    }
    BOOL v31 = &v29[__size];
    uint64_t v32 = v29 + 12;
    memcpy(v29 + 12, __src, __n);
    v33 = &v32[__n];
    int64_t v46 = v31;
    char v21 = 0;
    char v34 = BYTE2(v52);
    __int16 v35 = v52;
    char *v33 = HIBYTE(v52);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    v19 = v33 + 4;
    *((_WORD *)v20 + 2) = 256;
    if ((v42 & 1) == 0) {
      goto LABEL_54;
    }
  }

  unsigned int v45 = 0;
  unsigned int v22 = v14;
  do
  {
    v51 = 0LL;
    size_t v49 = 0LL;
    unsigned int v48 = 0;
    unsigned __int16 v50 = 0;
    unsigned __int16 v47 = 0;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v58 = 0u;
    __int128 v59 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    unsigned int v23 = v53;
    int DomainName = _DNSMessageExtractRecordEx( a1,  a2,  v53,  (char *)&v54,  &v50,  &v47,  &v48,  0LL,  0LL,  0LL,  0LL,  0LL,  &v49,  &v53);
    if (DomainName) {
      goto LABEL_65;
    }
    if (v50 == HIWORD(v52)
      && v47 == (unsigned __int16)v52
      && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
    {
      if (v20)
      {
        if (v46 - v19 < 2) {
          goto LABEL_64;
        }
        *(_WORD *)v19 = 3264;
        unsigned int v24 = v48;
        if (v48 >= v43) {
          unsigned int v24 = v43;
        }
        unsigned int v48 = v24;
        char v25 = v50;
        unsigned __int16 v26 = v47;
        __int16 v27 = v49;
        v19[2] = HIBYTE(v50);
        v19[3] = v25;
        v19[4] = HIBYTE(v26);
        v19[5] = v26;
        v19[6] = HIBYTE(v24);
        v19[7] = BYTE2(v24);
        v19[8] = BYTE1(v24);
        v19[9] = v24;
        v19[10] = HIBYTE(v27);
        v19[11] = v27;
        int v28 = v19 + 12;
        if (v46 - v28 < v49)
        {
LABEL_64:
          int DomainName = -6762;
LABEL_65:
          int v36 = 0LL;
          goto LABEL_66;
        }

        int DomainName = _DNSMessageExtractRecordEx(a1, a2, v23, 0LL, 0LL, 0LL, 0LL, 0LL, 0LL, v28, v49, &v51, 0LL, 0LL);
        if (DomainName) {
          goto LABEL_65;
        }
        v19 = &v51[(void)v28];
        ++v45;
      }

      else
      {
        __size += v49 + 12;
      }
    }

    --v22;
  }

  while (v22);
  if (!v20) {
    goto LABEL_45;
  }
LABEL_52:
  if (__size >= 0xC)
  {
    *((_WORD *)v20 + 3) = bswap32(v45) >> 16;
LABEL_54:
    a4 = v39;
    int DomainName = 0;
    if (v38) {
      void *v38 = v19 - v20;
    }
    int v36 = v20;
    goto LABEL_57;
  }

LABEL_67:
  int v36 = 0LL;
  int DomainName = -6762;
LABEL_66:
  a4 = v39;
LABEL_58:
  if (a4) {
    *(_DWORD *)a4 = DomainName;
  }
  if (v20) {
    free(v20);
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
    if (v3 != v2)
    {
      int v5 = *v2;
    }

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
  int v3 = *a2;
  return (_DWORD)v2 == v3 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2, v3) == 0;
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
  int v3 = (_BYTE *)v2;
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

uint64_t DNSMessageToString(unsigned __int16 *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  __src[127] = *(void **)MEMORY[0x1895F89C0];
  v107 = 0LL;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  uint64_t v110 = 0LL;
  memset(v109, 0, sizeof(v109));
  v108 = 0LL;
  uint64_t v106 = 0LL;
  memset(v120, 0, sizeof(v120));
  bzero(v119, 0x3F1uLL);
  memset(v118, 0, 256);
  memset(v117, 0, sizeof(v117));
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_647;
  }
  _GetCUSymAddr_DataBuffer_Init_sAddr(v109, v120, 512LL, -1LL);
  if (a2 < 0xC)
  {
LABEL_650:
    uint64_t v78 = 4294960553LL;
    goto LABEL_640;
  }

  unint64_t v8 = ((unint64_t)*((unsigned __int8 *)a1 + 2) >> 3) & 0xF;
  unsigned int v102 = __rev16(a1[2]);
  unsigned int v100 = __rev16(a1[3]);
  unsigned int v99 = __rev16(a1[4]);
  uint64_t v97 = a4;
  unsigned int v98 = __rev16(a1[5]);
  unint64_t v9 = (const char *)&unk_188F5CA9B;
  unsigned int v103 = a3;
  unint64_t v104 = (unint64_t)a1;
  if ((a3 & 0x20) == 0)
  {
    unint64_t v10 = *((unsigned __int8 *)a1 + 3) | (*((unsigned __int8 *)a1 + 2) << 8);
    uint64_t v11 = __rev16(*a1);
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      uint64_t v16 = 81LL;
      if ((v10 & 0x8000u) != 0LL) {
        uint64_t v16 = 82LL;
      }
      unint64_t v94 = v10;
      uint64_t v95 = v16;
      uint64_t v93 = v11;
      size_t v15 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
    }

    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  "ID:               0x%04X (%u)\n",  v11,  v11);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      int v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      uint64_t v14 = 81LL;
      if ((v10 & 0x8000u) != 0LL) {
        uint64_t v14 = 82LL;
      }
      uint64_t v93 = v14;
      size_t v15 = "Flags:            0x%04X %c/";
    }

    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = v13(v109, v15);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_639;
    }
    if (v8 > 6 || (_DWORD)v8 == 3)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      int v17 = v8;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "OPCODE%d");
    }

    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      int v17 = v8;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
    }

    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_639;
    }
    for (uint64_t i = 0LL; i != 14; i += 2LL)
    {
      if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  ", %s",  (&kDNSHeaderFlagsDescs)[i]);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
      }
    }

    int v19 = DNSRCodeToString(v10 & 0xF);
    if (v19)
    {
      v20 = v19;
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      unint64_t v91 = (unint64_t)v20;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", %s");
    }

    else
    {
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      unint64_t v91 = v10 & 0xF;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", RCODE%d");
    }

    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    {
LABEL_639:
      uint64_t v78 = CUSymAddr_DataBuffer_AppendF_sAddr;
      goto LABEL_640;
    }

    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ")", v91, v93);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if ((a3 & 0x40) != 0) {
        goto LABEL_631;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  ", counts: %u/%u/%u/%u",  v102,  v100,  v99,  v98);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      unint64_t v9 = ", ";
    }

    else
    {
      if ((a3 & 0x40) != 0)
      {
LABEL_631:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
        }
        if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v109, &unk_188F5CA9B, 1LL);
        if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        {
          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v109, v97, &v106);
            goto LABEL_639;
          }

LABEL_647:
          uint64_t v78 = 4294960561LL;
          goto LABEL_640;
        }

        goto LABEL_639;
      }

      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n", v91, v93);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Question count:   %u\n", v102);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Answer count:     %u\n", v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Authority count:  %u\n", v99);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_647;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Additional count: %u\n", v98);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      unint64_t v9 = (const char *)&unk_188F5CA9B;
    }
  }

  if ((a3 & 0x10) != 0) {
    goto LABEL_631;
  }
  int v96 = v8;
  int v105 = (a3 >> 3) & 1;
  v108 = (char *)(v104 + 12);
  if (v102)
  {
    char v21 = 0LL;
    int v22 = 0;
    unsigned int v23 = v118;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v121[0]) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion(v104, a2, v108, v23, __src, v121, &v108);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      BOOL v24 = SLOWORD(v121[0]) < 0;
      if ((a3 & 1) != 0) {
        LOWORD(v121[0]) &= ~0x8000u;
      }
      char v25 = a3;
      int v26 = a3 & v24;
      if ((v25 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v23, v21))
        {
          __int16 v27 = v23;
          unsigned int v23 = (char *)v21;
        }

        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v119, 0LL);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if (v105 && _NameIsPrivate((const char *)v119))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s ");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s ");
          }

          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if (v23 == v118) {
            __int16 v27 = (char *)v117;
          }
          else {
            __int16 v27 = v118;
          }
          char *v27 = 0;
        }

        BOOL v31 = "ANY";
        if (LOWORD(v121[0]) != 255) {
          BOOL v31 = 0LL;
        }
        if (LOWORD(v121[0]) == 1) {
          uint64_t v32 = "IN";
        }
        else {
          uint64_t v32 = v31;
        }
        if (v32)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "CLASS%u");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if ((v103 & 1) != 0)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          v33 = "QM";
          if (v26) {
            v33 = "QU";
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v33);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        char v34 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v34)
        {
          __int16 v35 = v34;
          a3 = v103;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v90 = (unint64_t)v35;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s?");
        }

        else
        {
          a3 = v103;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v90 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u?");
        }

        unint64_t v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
      }

      else
      {
        if (!v22)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nQUESTION SECTION\n");
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0LL, v119, 0LL);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (v105 && _NameIsPrivate((const char *)v119))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~-30s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%-30s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        int v28 = "QM";
        if (v26) {
          int v28 = "QU";
        }
        if ((v103 & 1) == 0) {
          int v28 = (const char *)&unk_188F5CA9B;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %2s", v28);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        int64_t v29 = "ANY";
        if (LOWORD(v121[0]) != 255) {
          int64_t v29 = 0LL;
        }
        if (LOWORD(v121[0]) == 1) {
          int v30 = "IN";
        }
        else {
          int v30 = v29;
        }
        if (v30)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v30);
          a3 = v103;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", LOWORD(v121[0]));
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        int v36 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v36)
        {
          v37 = v36;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v90 = (unint64_t)v37;
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %-5s\n");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v90 = LOWORD(__src[0]);
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u\n");
        }

        __int16 v27 = v23;
        unsigned int v23 = (char *)v21;
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
      }

      char v21 = (unsigned __int8 *)v23;
      ++v22;
      unsigned int v23 = v27;
      if (v102 == v22) {
        goto LABEL_201;
      }
    }
  }

  char v21 = 0LL;
  __int16 v27 = v118;
LABEL_201:
  if (v99 + v100 + v98)
  {
    int v38 = 0;
    while (1)
    {
      __src[0] = 0LL;
      v121[0] = 0LL;
      LODWORD(v116) = 0;
      LOWORD(v115) = 0;
      LOWORD(v114) = 0;
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx( v104,  a2,  v108,  v27,  &v115,  &v114,  &v116,  (unsigned __int16 **)__src,  v121,  0LL,  0LL,  0LL,  0LL,  &v108);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0LL, v119, 0LL);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
      BOOL v39 = (__int16)v114 < 0;
      if ((a3 & 1) != 0) {
        LOWORD(v114) = (unsigned __int16)v114 & 0x7FFF;
      }
      char v40 = a3;
      int v41 = a3 & v39;
      if ((v40 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (v21 && DomainNameEqual((unsigned __int8 *)v27, v21))
        {
          char v42 = v27;
          __int16 v27 = (char *)v21;
        }

        else
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0LL, v119, 0LL);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if (v105 && _NameIsPrivate((const char *)v119))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s ");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s ");
          }

          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if (v27 == v118) {
            char v42 = (char *)v117;
          }
          else {
            char v42 = v118;
          }
          *char v42 = 0;
        }

        if ((unsigned __int16)v115 == 41)
        {
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "CF ");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_639;
            }
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  "OPT %u",  (unsigned __int16)v114);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if ((_DWORD)v116)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0");
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%u", (_DWORD)v116);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CF");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_639;
            }
          }

          unsigned int v43 = "ANY";
          else {
            v44 = v43;
          }
          if (v44)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v44);
            a3 = v103;
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_639;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            a3 = v103;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  " CLASS%u",  (unsigned __int16)v114);
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_639;
            }
          }

          if (DNSRecordTypeValueToString((unsigned __int16)v115))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }
        }

        unint64_t v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        goto LABEL_372;
      }

      if (v100 && !v38) {
        break;
      }
      if (v99 && v100 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nAUTHORITY SECTION\n");
        goto LABEL_284;
      }

      if (v98 && v99 + v100 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nADDITIONAL SECTION\n");
        goto LABEL_284;
      }

LABEL_285:
      if ((unsigned __int16)v115 == 41)
      {
        if (v105 && _NameIsPrivate((const char *)v119))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        unsigned int v45 = (const char *)&unk_188F5CA9B;
        if (v41) {
          unsigned int v45 = " CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  "%s OPT %u",  v45,  (unsigned __int16)v114);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        a3 = v103;
        if ((_DWORD)v116)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0");
        }
      }

      else
      {
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~-42s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%-42s");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        int64_t v46 = (const char *)&unk_188F5CA9B;
        if (v41) {
          int64_t v46 = "CF";
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %6u %2s", (_DWORD)v116, v46);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        unsigned __int16 v47 = "ANY";
        else {
          unsigned int v48 = v47;
        }
        if (v48)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v48);
          a3 = v103;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v109,  " CLASS%u",  (unsigned __int16)v114);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_639;
          }
        }

        if (DNSRecordTypeValueToString((unsigned __int16)v115))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %-5s");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
        }
      }

      char v42 = v27;
      __int16 v27 = (char *)v21;
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_639;
      }
LABEL_372:
      if ((a3 & 2) == 0) {
        DNSRecordDataToStringEx( (unsigned __int16 *)__src[0],  v121[0],  (unsigned __int16)v115,  v104,  a2,  v105,  (uint64_t)&v107);
      }
      if (v107)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v107);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        if (v107)
        {
          free(v107);
          v107 = 0LL;
        }
      }

      else
      {
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v90 = v121[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_647;
          }
          unint64_t v92 = v121[0];
          unint64_t v94 = v121[0];
          unint64_t v90 = (unint64_t)__src[0];
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %#H");
        }

        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
      }

      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v115 == 5)
        {
          int DomainName = DNSMessageExtractDomainName(v104, a2, (char *)__src[0], v42, 0LL);
          unsigned __int16 v50 = v118;
          if (v42 == v118) {
            unsigned __int16 v50 = (char *)v117;
          }
          if (!DomainName)
          {
            __int16 v27 = v42;
            char v42 = v50;
          }

          *char v42 = 0;
        }
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n");
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
      }

      ++v38;
      char v21 = (unsigned __int8 *)v27;
      __int16 v27 = v42;
      if (v100 + v98 + v99 == v38) {
        goto LABEL_404;
      }
    }

    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_647;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nANSWER SECTION\n");
LABEL_284:
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_639;
    }
    goto LABEL_285;
  }

LABEL_404:
  if (v96 != 6) {
    goto LABEL_631;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  }
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_647;
  }
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "[");
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
    goto LABEL_639;
  }
  unint64_t v51 = v104 + a2;
  int v52 = v108;
  if ((unint64_t)v108 >= v104 + a2)
  {
LABEL_624:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_647;
    }
    if (((v103 >> 2) & 1) != 0) {
      uint64_t v88 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "]", v90, v92, v94, v95);
    }
    else {
      uint64_t v88 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n]", v90, v92, v94, v95);
    }
    uint64_t v78 = v88;
    if ((_DWORD)v88) {
      goto LABEL_640;
    }
    goto LABEL_631;
  }

  if (((v103 >> 2) & 1) != 0) {
    int v53 = (const char *)&unk_188F5CA9B;
  }
  else {
    int v53 = "\n\t";
  }
  if (((v103 >> 2) & 1) != 0) {
    __int128 v54 = ", ";
  }
  else {
    __int128 v54 = ",\n\t";
  }
  v101 = v54;
  while ((unint64_t)v52 >= v104)
  {
    if (v51 - (unint64_t)v52 < 4
      || (int64_t v55 = __rev16(*((unsigned __int16 *)v52 + 1)), v56 = v52 + 4, (uint64_t)(v51 - (void)(v52 + 4)) < v55))
    {
LABEL_648:
      uint64_t v78 = 4294960546LL;
      goto LABEL_640;
    }

    unsigned int v57 = *(unsigned __int16 *)v52;
    unint64_t v58 = (unint64_t)&v56[v55];
    v108 = &v56[v55];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    }
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_647;
    }
    uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v53);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
      goto LABEL_639;
    }
    unint64_t v59 = __rev16(v57);
    __int128 v61 = "Reserved";
    uint64_t v60 = a2;
    switch((int)v59)
    {
      case 0:
        goto LABEL_438;
      case 1:
        __int128 v61 = "KeepAlive";
        goto LABEL_438;
      case 2:
        __int128 v61 = "Retry Delay";
        goto LABEL_438;
      case 3:
        __int128 v61 = "Encryption Padding";
LABEL_438:
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_647;
        }
        unint64_t v90 = (unint64_t)v61;
        uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s: ");
LABEL_442:
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_639;
        }
        break;
      default:
        uint64_t v60 = a2;
        switch((int)v59)
        {
          case '@':
            __int128 v61 = "SUBSCRIBE";
            goto LABEL_438;
          case 'A':
            __int128 v61 = "PUSH";
            goto LABEL_438;
          case 'B':
            __int128 v61 = "UNSUBSCRIBE";
            goto LABEL_438;
          case 'C':
            __int128 v61 = "RECONFIRM";
            goto LABEL_438;
          default:
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_647;
            }
            unint64_t v90 = v59;
            uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "DSO-TYPE%u: ");
            break;
        }

        goto LABEL_442;
    }

    v115 = 0LL;
    v116 = (unsigned __int16 *)(v52 + 4);
    bzero(__src, 0x3F1uLL);
    switch((int)v59)
    {
      case '@':
        uint64_t v62 = DNSMessageExtractDomainNameString(v104, v60, v52 + 4, (unsigned __int8 *)__src, &v116);
        if ((_DWORD)v62) {
          goto LABEL_569;
        }
        __int128 v63 = v116;
        if (v58 - (void)v116 == 4)
        {
          if (v105 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)__src;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)__src;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          unint64_t v71 = __rev16(v63[1]);
          uint64_t v72 = "ANY";
          if ((_DWORD)v71 != 255) {
            uint64_t v72 = 0LL;
          }
          if ((_DWORD)v71 == 1) {
            v73 = "IN";
          }
          else {
            v73 = v72;
          }
          if (v73)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)v73;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = v71;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          unint64_t v79 = __rev16(*v63);
          v80 = DNSRecordTypeValueToString(v79);
          if (v80)
          {
            v81 = v80;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v90 = (unint64_t)v81;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
              goto LABEL_614;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v90 = v79;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
              goto LABEL_614;
            }
          }

          goto LABEL_621;
        }

        uint64_t v78 = 4294960553LL;
        goto LABEL_616;
      case 'A':
        int v64 = (v103 >> 3) & 1;
        while (1)
        {
          unint64_t v113 = 0LL;
          v114 = 0LL;
          int v111 = 0;
          int v112 = 0;
          memset(v121, 0, sizeof(v121));
          uint64_t v62 = _DNSMessageExtractRecordEx( v104,  v60,  v56,  (char *)v121,  (_WORD *)&v111 + 1,  &v111,  &v112,  &v114,  &v113,  0LL,  0LL,  0LL,  0LL,  &v116);
          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          uint64_t v62 = DomainNameToString((unsigned __int8 *)v121, 0LL, (unsigned __int8 *)__src, 0LL);
          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          if (v64 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)__src;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)__src;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_621;
          }
          uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X", v112);
          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          __int128 v65 = "ANY";
          else {
            __int128 v66 = v65;
          }
          if (v66)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)v66;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unsigned __int16)v111;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          __int128 v67 = DNSRecordTypeValueToString(HIWORD(v111));
          if (v67)
          {
            __int128 v68 = v67;
            int v64 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)v68;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }

          else
          {
            int v64 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = HIWORD(v111);
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          DNSRecordDataToStringEx(v114, v113, HIWORD(v111), v104, v60, v64, (uint64_t)&v115);
          if (v115)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v115);
            if ((_DWORD)v62) {
              goto LABEL_569;
            }
            if (v115)
            {
              free(v115);
              v115 = 0LL;
            }
          }

          else
          {
            if (v64)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_621;
              }
              unint64_t v90 = v113;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
            }

            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_621;
              }
              unint64_t v92 = v113;
              unint64_t v94 = v113;
              unint64_t v90 = (unint64_t)v114;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %#H");
            }

            if ((_DWORD)v62) {
              goto LABEL_569;
            }
          }

          __int128 v56 = (char *)v116;
        }

      case 'B':
        if ((_DWORD)v55 != 2) {
          goto LABEL_650;
        }
        unsigned int v69 = *((unsigned __int16 *)v52 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_621;
        }
        uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%u", __rev16(v69));
        goto LABEL_569;
      case 'C':
        uint64_t v62 = DNSMessageExtractDomainNameString(v104, v60, v52 + 4, (unsigned __int8 *)__src, &v116);
        if ((_DWORD)v62) {
          goto LABEL_569;
        }
        v70 = v116;
        if (v58 - (unint64_t)v116 >= 4)
        {
          v116 += 2;
          if (v105 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v90 = (unint64_t)__src;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
              goto LABEL_553;
            }

LABEL_621:
            uint64_t v78 = 4294960561LL;
            goto LABEL_616;
          }

          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_621;
          }
          unint64_t v90 = (unint64_t)__src;
          uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
LABEL_553:
          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          unsigned int v74 = __rev16(v70[1]);
          unint64_t v75 = "ANY";
          if (v74 != 255) {
            unint64_t v75 = 0LL;
          }
          if (v74 == 1) {
            v76 = "IN";
          }
          else {
            v76 = v75;
          }
          if (v76)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            unint64_t v77 = v104;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v76);
            if ((_DWORD)v62) {
              goto LABEL_569;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", v74);
            unint64_t v77 = v104;
            if ((_DWORD)v62) {
              goto LABEL_569;
            }
          }

          unint64_t v82 = __rev16(*v70);
          v83 = DNSRecordTypeValueToString(v82);
          if (v83)
          {
            v84 = v83;
            int v85 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = (unint64_t)v84;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }

          else
          {
            int v85 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_621;
            }
            unint64_t v90 = v82;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }

          if ((_DWORD)v62) {
            goto LABEL_569;
          }
          v86 = v116;
          unint64_t v87 = v58 - (void)v116;
          DNSRecordDataToStringEx(v116, v58 - (void)v116, v82, v77, v60, v85, (uint64_t)&v115);
          if (v115)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v115);
              if ((_DWORD)v62) {
                goto LABEL_569;
              }
              if (v115)
              {
                free(v115);
                v115 = 0LL;
              }

              goto LABEL_615;
            }
          }

          else if (v85)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v90 = v87;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
              goto LABEL_614;
            }
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              unint64_t v92 = v87;
              unint64_t v94 = v87;
              unint64_t v90 = (unint64_t)v86;
              uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " '%H'");
LABEL_614:
              if ((_DWORD)v62) {
                goto LABEL_569;
              }
LABEL_615:
              uint64_t v78 = 0LL;
              goto LABEL_616;
            }
          }

          goto LABEL_621;
        }

LABEL_622:
        uint64_t v78 = 4294960546LL;
LABEL_616:
        if (v115) {
          free(v115);
        }
        if ((_DWORD)v78) {
          goto LABEL_640;
        }
        int v52 = v108;
        int v53 = v101;
        unint64_t v51 = v104 + a2;
        break;
      default:
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v90 = v55;
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "[%u B]");
            goto LABEL_569;
          }
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            unint64_t v92 = v55;
            unint64_t v94 = v55;
            unint64_t v90 = (unint64_t)(v52 + 4);
            uint64_t v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "'%H'");
LABEL_569:
            uint64_t v78 = v62;
            goto LABEL_616;
          }
        }

        goto LABEL_621;
    }
  }

  uint64_t v78 = 4294960586LL;
LABEL_640:
  if (v107) {
    free(v107);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  }
  if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
    _GetCUSymAddr_DataBuffer_Free_sAddr(v109);
  }
  return v78;
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
  v90[127] = *(void **)MEMORY[0x1895F89C0];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1) {
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  }
  uint64_t v85 = 0LL;
  v86 = 0LL;
  memset(v84, 0, sizeof(v84));
  uint64_t v83 = 0LL;
  memset(v89, 0, sizeof(v89));
  bzero(v88, 0x3F1uLL);
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr) {
    goto LABEL_424;
  }
  uint64_t v78 = a7;
  unint64_t v13 = (unint64_t)a1 + a2;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v84, v89, 256LL, -1LL);
  uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960582LL;
  if (a3 <= 32)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4) {
          goto LABEL_426;
        }
        uint64_t appended = _AppendIPv4Address((uint64_t)v84, 0LL, (unsigned int *)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
      case 3:
      case 4:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
        goto LABEL_419;
      case 6:
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v86, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          uint64_t appended = DomainNameToString(v86, (unint64_t)a1 + a2, v88, &v86);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v88);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        v73 = (unsigned int *)v86;
        if (v13 - (void)v86 != 20) {
          goto LABEL_426;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  " %u %u %u %u %u",  bswap32(*v73),  bswap32(v73[1]),  bswap32(v73[2]),  bswap32(v73[3]),  bswap32(v73[4]));
          goto LABEL_409;
        }

        goto LABEL_424;
      case 13:
      case 16:
        if (!a2) {
          goto LABEL_426;
        }
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%zu B]");
        }

        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#H");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%#{txt}");
        }

        if (!(_DWORD)appended) {
          goto LABEL_410;
        }
        goto LABEL_418;
      case 15:
        unsigned int v71 = *a1;
        v70 = (char *)(a1 + 1);
        unsigned int v69 = v71;
        if (a4)
        {
          uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, v70, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        else
        {
          uint64_t appended = DomainNameToString((unsigned __int8 *)v70, v13, v88, 0LL);
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
        }

        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v69));
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        unint64_t v75 = " ";
        break;
      default:
        if (a3 == 25) {
          goto LABEL_229;
        }
        if (a3 != 28) {
          goto LABEL_419;
        }
        if (a2 != 16) {
          goto LABEL_426;
        }
        uint64_t appended = _AppendIPv6Address((uint64_t)v84, 0LL, (uint64_t)a1, a6);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        goto LABEL_410;
    }

    goto LABEL_408;
  }

  switch(a3)
  {
    case ')':
      uint64_t v16 = (const char *)&unk_188F5CA9B;
      while (2)
      {
        int v17 = a1 + 2;
        unint64_t v18 = __rev16(a1[1]);
        unsigned int v19 = *a1;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s{", v16);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        unsigned int v20 = __rev16(v19);
        if (v20 == 12)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "Padding");
        }

        else if (v20 == 15)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "EDE");
        }

        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
            goto LABEL_424;
          }
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "CODE%u");
        }

        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", ");
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        char v21 = (unsigned __int16 *)&v17[v18];
        if (v20 != 15 || !(_DWORD)v18)
        {
          if (a6)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "[%u B]");
          }

          else if (v20 == 12 && (_DWORD)v18 && !*v17 && !memcmp(a1 + 2, (char *)a1 + 5, v18 - 1))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u zero bytes>");
          }

          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%H'");
          }

          goto LABEL_78;
        }

        unsigned int v22 = a1[2];
        int v23 = (unsigned __int16)((_WORD)v21 - ((_WORD)a1 + 6));
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        unsigned int v24 = __rev16(v22);
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "code: %u", v24);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
        if (v23 | v24)
        {
          if (v24 <= 0x18)
          {
            char v25 = off_18A320CE0[v24];
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " (%s)", v25);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
          }

          if (v23)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            }
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
              goto LABEL_424;
            }
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, ", extra-text: ");
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            if (a6)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_424;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "«REDACTED»");
            }

            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              }
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                goto LABEL_424;
              }
              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "'%.*s'");
            }

LABEL_78:
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
          }
        }

        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "}");
          a1 = v21;
          uint64_t v16 = ", ";
          if ((_DWORD)appended) {
            goto LABEL_418;
          }
          continue;
        }

        goto LABEL_424;
      }

    case '*':
    case ',':
    case '-':
    case '1':
      goto LABEL_419;
    case '+':
      if (a2 < 4) {
        goto LABEL_426;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  "%u %u %u",  __rev16(*a1),  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (a2 == 4) {
        goto LABEL_410;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %.4H", a1 + 2, a2 - 4, a2 - 4);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      goto LABEL_410;
    case '.':
      LODWORD(v87) = 0;
      uint64_t v81 = 0LL;
      uint64_t v82 = 0LL;
      int v80 = 0;
      if (a2 < 0x13) {
        goto LABEL_426;
      }
      if (DNSRecordTypeValueToString(__rev16(*a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s");
      }

      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        }
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
          goto LABEL_424;
        }
        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "TYPE%u");
      }

      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  " %u %u %u",  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3),  bswap32(*((_DWORD *)a1 + 1)));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      LODWORD(v87) = 0;
      uint64_t v81 = 0LL;
      uint64_t v82 = 0LL;
      int v80 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_424;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr( bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880LL,  &v87,  (char *)&v82 + 4,  &v82,  (char *)&v81 + 4,  &v81,  &v80);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  " %u%02u%02u%02u%02u%02u",  (_DWORD)v87,  HIDWORD(v82),  v82,  HIDWORD(v81),  v81,  v80);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      }
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr) {
        goto LABEL_424;
      }
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr( bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880LL,  &v87,  (char *)&v82 + 4,  &v82,  (char *)&v81 + 4,  &v81,  &v80);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  " %u%02u%02u%02u%02u%02u",  (_DWORD)v87,  HIDWORD(v82),  v82,  HIDWORD(v81),  v81,  v80);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %u", __rev16(a1[8]));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      v86 = (unsigned __int8 *)(a1 + 9);
      uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 18, v13, v88, &v86);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v88);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      v90[0] = 0LL;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0LL, v90, 0LL);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
LABEL_376:
      }
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %s", (const char *)v90[0]);
      else {
LABEL_427:
      }
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
      if (v90[0]) {
        free(v90[0]);
      }
      if (!(_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
        goto LABEL_410;
      }
      goto LABEL_419;
    case '/':
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v88, &v86);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1, (unint64_t)a1 + a2, v88, &v86);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, 0LL, a6, (const char *)v88);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      uint64_t v72 = v86;
LABEL_338:
      uint64_t appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v84, v72, v13);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      goto LABEL_410;
    case '0':
LABEL_229:
      if (a2 < 5) {
        goto LABEL_426;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  "%u %u %u",  __rev16(*a1),  *((unsigned __int8 *)a1 + 2),  *((unsigned __int8 *)a1 + 3));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      v86 = (unsigned __int8 *)(a1 + 2);
      v90[0] = 0LL;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      }
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v86, v13 - (void)v86, 0LL, v90, 0LL);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_376;
      }
      goto LABEL_427;
    case '2':
      if (a2 < 5) {
        goto LABEL_426;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr( v84,  "%u %u %u",  *(unsigned __int8 *)a1,  *((unsigned __int8 *)a1 + 1),  __rev16(a1[1]));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      v86 = (unsigned __int8 *)(a1 + 2);
      v86 = (unsigned __int8 *)a1 + 5;
      unint64_t v52 = *((unsigned __int8 *)a1 + 4);
      if (a2 - 5 < v52) {
        goto LABEL_426;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %.4H", v86, v52, v52);
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      int v53 = &v86[v52];
      v86 = v53;
      __int128 v54 = v53 + 1;
      v86 = v53 + 1;
      unint64_t v55 = *v53;
      if (!*v53) {
        goto LABEL_289;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " ");
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      __int128 v54 = v86;
LABEL_289:
      __int128 v56 = &v54[v55];
      while (2)
      {
        unint64_t v57 = v56 - v86;
        if (v56 != v86)
        {
          v90[0] = 0LL;
          uint64_t v58 = 0LL;
          switch(v57)
          {
            case 1uLL:
              uint64_t v59 = 0LL;
              unint64_t v60 = (unint64_t)*v86++ << 32;
              goto LABEL_307;
            case 2uLL:
              uint64_t v65 = 0LL;
              unint64_t v63 = (unint64_t)v86[1] << 24;
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              v86 += 2;
              goto LABEL_304;
            case 3uLL:
              unsigned __int8 v66 = v86[2];
              unint64_t v63 = ((unint64_t)v66 << 16) | ((unint64_t)v86[1] << 24);
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              v86 += 3;
              BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v66 & 0xF)];
              uint64_t v65 = 5LL;
              goto LABEL_304;
            case 4uLL:
              goto LABEL_294;
            default:
              uint64_t v58 = v86[4];
LABEL_294:
              unint64_t v61 = v86[3];
              unint64_t v62 = v58 | (v61 << 8);
              unint64_t v63 = ((unint64_t)v86[1] << 24) | ((unint64_t)v86[2] << 16) | v62;
              unint64_t v60 = v63 | ((unint64_t)*v86 << 32);
              uint64_t v64 = 5LL;
              if (v57 < 5) {
                uint64_t v64 = v56 - v86;
              }
              v86 += v64;
              if (v57 == 1)
              {
                uint64_t v59 = 0LL;
              }

              else
              {
                if (v57 == 4)
                {
                  uint64_t v65 = 7LL;
                }

                else
                {
                  HIBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v58 & 0x1F];
                  uint64_t v65 = 8LL;
                }

                char v67 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v61 >> 2) & 0x1F];
                BYTE6(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v62 >> 5) & 0x1F];
                BYTE5(v90[0]) = v67;
                BYTE4(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 15) & 0x1F];
LABEL_304:
                BYTE3(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 20) & 0x1F];
                BYTE2(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v63 >> 25) & 0x1F];
                if (v65) {
                  uint64_t v59 = v65;
                }
                else {
                  uint64_t v59 = 4LL;
                }
              }

LABEL_307:
              BYTE1(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v60 >> 30) & 0x1F];
              LOBYTE(v90[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v60 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              }
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_424;
              }
              if (v59) {
                uint64_t v68 = v59;
              }
              else {
                uint64_t v68 = 2LL;
              }
              uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, v90, v68);
              if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                goto LABEL_419;
              }
              continue;
          }
        }

        break;
      }

      uint64_t v72 = v56;
      goto LABEL_338;
    default:
      if ((a3 - 64) < 2)
      {
        if (v13 < (unint64_t)a1)
        {
LABEL_428:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960586LL;
          goto LABEL_419;
        }

        if (a2 >= 2)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(*a1));
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            bzero(v90, 0x3F1uLL);
            unint64_t v87 = (unsigned int *)(a1 + 1);
            uint64_t appended = DomainNameToString( (unsigned __int8 *)a1 + 2,  (unint64_t)a1 + a2,  (unsigned __int8 *)v90,  &v87);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            uint64_t appended = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)" ", a6, (const char *)v90);
            if ((_DWORD)appended) {
              goto LABEL_418;
            }
            int v26 = v87;
            while (2)
            {
              if (v13 - (unint64_t)v26 < 4)
              {
LABEL_425:
                uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960546LL;
                goto LABEL_419;
              }

              __int16 v27 = (const char *)__rev16(*(unsigned __int16 *)v26);
              unsigned int v28 = *((unsigned __int16 *)v26 + 1);
              int64_t v29 = _DNSSVCBKeyToString((int)v27);
              if (v29)
              {
                int v30 = v29;
                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                }
                if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                {
                  unint64_t v77 = v30;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " %s=");
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
                  unint64_t v77 = v27;
                  uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, " key%u=");
LABEL_108:
                  if ((_DWORD)appended) {
                    goto LABEL_418;
                  }
                  BOOL v31 = (const char *)__rev16(v28);
                  uint64_t v32 = v26 + 1;
                  unint64_t v87 = v26 + 1;
                  if (v13 - (unint64_t)(v26 + 1) >= v31)
                  {
                    switch((int)v27)
                    {
                      case 0:
                        v33 = (unsigned int *)&v31[(void)v32];
                        char v34 = 0LL;
                        char v35 = 1;
                        do
                        {
                          int v36 = (const char *)__rev16(*(unsigned __int16 *)v32);
                          unint64_t v87 = (unsigned int *)((char *)v32 + 2);
                          v37 = _DNSSVCBKeyToString((int)v36);
                          if ((v35 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v34);
                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                          }

                          if (v37)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            unint64_t v77 = v37;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s");
                          }

                          else
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            unint64_t v77 = v36;
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "key%u");
                          }

                          if ((_DWORD)appended) {
                            goto LABEL_418;
                          }
                          char v35 = 0;
                          uint64_t v32 = v87;
                          char v34 = ",";
                        }

                        while (v87 < v33);
                        goto LABEL_212;
                      case 1:
                        int v38 = (unsigned int *)&v31[(void)v32];
                        BOOL v39 = 0LL;
                        char v40 = 1;
                        while (1)
                        {
                          unint64_t v87 = (unsigned int *)((char *)v32 + 1);
                          unint64_t v41 = *(unsigned __int8 *)v32;
                          uint64_t v32 = (unsigned int *)((char *)v32 + 1);
                          if ((v40 & 1) == 0)
                          {
                            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                            }
                            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                              goto LABEL_424;
                            }
                            uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%s", v39);
                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                            uint64_t v32 = v87;
                          }

                          char v42 = (unsigned int *)((char *)v32 + v41);
                          while (v32 < v42)
                          {
                            unsigned int v43 = (const char *)*(unsigned __int8 *)v32;
                            if (((_DWORD)v43 - 32) > 0x5E)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              unint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                            }

                            else if ((_DWORD)v43 == 92 || (_DWORD)v43 == 44)
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              unint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                            }

                            else
                            {
                              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                              }
                              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                goto LABEL_424;
                              }
                              unint64_t v77 = v43;
                              uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                            }

                            if ((_DWORD)appended) {
                              goto LABEL_418;
                            }
                            uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                            unint64_t v87 = (unsigned int *)((char *)v87 + 1);
                          }

                          char v40 = 0;
                          BOOL v39 = ",";
                          if (v32 >= v38) {
                            goto LABEL_212;
                          }
                        }

                      case 2:
                        goto LABEL_136;
                      case 3:
                        if ((_DWORD)v31 != 2) {
                          goto LABEL_426;
                        }
                        unsigned int v44 = *((unsigned __int16 *)v26 + 2);
                        unint64_t v87 = (unsigned int *)&v31[(void)v32];
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_424;
                        }
                        uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u", __rev16(v44));
                        if ((_DWORD)appended) {
                          goto LABEL_418;
                        }
                        goto LABEL_212;
                      case 4:
                        unsigned int v45 = (unsigned int *)&v31[(void)v32];
                        int64_t v46 = (const char *)&unk_188F5CA9B;
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv4Address((uint64_t)v84, (uint64_t)v46, v32, a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_419;
                          }
                          uint64_t v32 = v87 + 1;
                          unint64_t v87 = v32;
                          if (v32 < v45)
                          {
                            int64_t v46 = ",";
                            continue;
                          }

                          goto LABEL_212;
                        }

                      case 5:
                        goto LABEL_132;
                      case 6:
                        unsigned __int16 v47 = (unsigned int *)&v31[(void)v32];
                        unsigned int v48 = (const char *)&unk_188F5CA9B;
                        while (2)
                        {
                          uint64_t CUSymAddr_DataBuffer_Append_sAddr = _AppendIPv6Address( (uint64_t)v84,  (uint64_t)v48,  (uint64_t)v32,  a6);
                          if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                            goto LABEL_419;
                          }
                          uint64_t v32 = v87 + 4;
                          unint64_t v87 = v32;
                          if (v32 < v47)
                          {
                            unsigned int v48 = ",";
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
                            goto LABEL_424;
                          }
                          unint64_t v77 = (const char *)v87;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%.4H");
                        }

                        else
                        {
LABEL_136:
                          if (!a6)
                          {
                            size_t v49 = (unsigned int *)&v31[(void)v32];
                            while (v32 < v49)
                            {
                              unsigned __int16 v50 = (const char *)*(unsigned __int8 *)v32;
                              if (((_DWORD)v50 - 33) > 0x5D)
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                unint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%03d");
                              }

                              else if (((_DWORD)v50 - 34) > 0x3A {
                                     || ((1LL << (v50 - 34)) & 0x4000000020000C1LL) == 0)
                              }
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                unint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%c");
                              }

                              else
                              {
                                if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                                  dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                                }
                                if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                                  goto LABEL_424;
                                }
                                unint64_t v77 = v50;
                                uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "\\%c");
                              }

                              if ((_DWORD)appended) {
                                goto LABEL_418;
                              }
                              uint64_t v32 = (unsigned int *)((char *)v87 + 1);
                              unint64_t v87 = (unsigned int *)((char *)v87 + 1);
                            }

                            goto LABEL_212;
                          }

                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          }
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                            goto LABEL_424;
                          }
                          unint64_t v77 = v31;
                          uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "<%u redacted bytes>");
                        }

                        if ((_DWORD)appended) {
                          goto LABEL_418;
                        }
                        unint64_t v87 = (unsigned int *)&v31[(void)v87];
LABEL_212:
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        }
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
                          goto LABEL_424;
                        }
                        uint64_t CUSymAddr_DataBuffer_Append_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "", v77);
                        if ((_DWORD)CUSymAddr_DataBuffer_Append_sAddr) {
                          goto LABEL_419;
                        }
                        int v26 = v87;
                        continue;
                    }
                  }

                  goto LABEL_425;
                }
              }

              break;
            }
          }

LABEL_424:
          uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960561LL;
          goto LABEL_419;
        }

LABEL_426:
        uint64_t CUSymAddr_DataBuffer_Append_sAddr = 4294960554LL;
        goto LABEL_419;
      }

      if (a3 != 33) {
        goto LABEL_419;
      }
      if (a2 < 7) {
        goto LABEL_426;
      }
      if (a4)
      {
        uint64_t appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      else
      {
        uint64_t appended = DomainNameToString((unsigned __int8 *)a1 + 6, (unint64_t)a1 + a2, v88, 0LL);
        if ((_DWORD)appended) {
          goto LABEL_418;
        }
      }

      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      }
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr) {
        goto LABEL_424;
      }
      uint64_t appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v84, "%u %u %u ", __rev16(*a1), __rev16(a1[1]), __rev16(a1[2]));
      if ((_DWORD)appended) {
        goto LABEL_418;
      }
      unint64_t v75 = 0LL;
LABEL_408:
      uint64_t CUSymAddr_DataBuffer_AppendF_sAddr = _AppendDomainNameStringEx((uint64_t)v84, (uint64_t)v75, a6, (const char *)v88);
LABEL_409:
      uint64_t CUSymAddr_DataBuffer_Append_sAddr = CUSymAddr_DataBuffer_AppendF_sAddr;
      if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      {
LABEL_410:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1) {
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
        }
        if (_GetCUSymAddr_DataBuffer_Append_sAddr)
        {
          uint64_t appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v84, &unk_188F5CA9B, 1LL);
          if ((_DWORD)appended)
          {
LABEL_418:
            uint64_t CUSymAddr_DataBuffer_Append_sAddr = appended;
            goto LABEL_419;
          }

          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1) {
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
          }
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            uint64_t appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v84, v78, &v83);
            goto LABEL_418;
          }
        }

        goto LABEL_424;
      }

LABEL_419:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1) {
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
      }
      if (_GetCUSymAddr_DataBuffer_Free_sAddr) {
        _GetCUSymAddr_DataBuffer_Free_sAddr(v84);
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
  uint64_t v19 = *MEMORY[0x1895F89C0];
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
          *(_OWORD *)__str = 0u;
          __int128 v18 = 0u;
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
    return off_18A320CE0[a1];
  }
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
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

  char v10 = 0;
  memset(v9, 0, sizeof(v9));
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
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      uint64_t v5 = "%~s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, v5);
    }
  }

  else
  {
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      uint64_t v5 = "%s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, v5);
    }
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
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (a4 != 16 && a4 != 4) {
    return 4294960553LL;
  }
  char v10 = 0;
  memset(v9, 0, sizeof(v9));
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

char *dnssec_result_to_description(unsigned int a1)
{
  if (a1 > 3) {
    return 0LL;
  }
  else {
    return off_18A320DA8[a1];
  }
}

char *dnssec_insecure_validation_state_to_description(unsigned int a1)
{
  if (a1 > 3) {
    return 0LL;
  }
  else {
    return off_18A320DC8[a1];
  }
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v4 = v3;
    if (stricmp_prefix())
    {
      uint64_t v5 = 0LL;
      BOOL v6 = (const char **)&off_18A320DE8;
      while (strcasecmp(a1, *v6))
      {
        ++v5;
        v6 += 2;
        if (v5 == 5) {
          goto LABEL_15;
        }
      }

      uint64_t v14 = ((void (*)(id))(&off_18A320DE8)[2 * v5 + 1])(v4);
      goto LABEL_18;
    }

    int v9 = bsearch( a1 + 3,  &DNSRecordTypeStringToValue_sTable,  0x5AuLL,  0x10uLL,  (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
    if (v9)
    {
      int v10 = (unsigned __int16)v9[4];
      if (v9[4])
      {
        id v11 = v4;
        size_t v12 = (unsigned __int16 *)[v11 bytes];
        unint64_t v13 = [v11 length];

        uint64_t v14 = _log_mdns_create_record_data_attributed_string(v12, v13, v10);
LABEL_18:
        uint64_t v15 = v14;

        goto LABEL_20;
      }
    }

LABEL_15:
    goto LABEL_16;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    uint64_t v15 = 0LL;
    goto LABEL_20;
  }

  uint64_t v7 = 0LL;
  unsigned int v8 = (const char **)&off_18A320E38;
  while (strcasecmp(a1, *v8))
  {
    ++v7;
    v8 += 2;
    if (v7 == 20) {
      goto LABEL_16;
    }
  }

  uint64_t v15 = ((void (*)(id))(&off_18A320E38)[2 * v7 + 1])(v3);
LABEL_20:

  return v15;
}

id _log_mdns_create_record_data_attributed_string(unsigned __int16 *a1, unint64_t a2, int a3)
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  id v4 = v3;
  if (v3)
  {
    _log_mdns_create_attributed_string(v3);
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  return v5;
}

id _log_mdns_format_acceptable(void *a1)
{
  else {
    return _log_mdns_create_attributed_string(@"unacceptable");
  }
}

id _log_mdns_format_add_rmv(void *a1)
{
  else {
    return _log_mdns_create_attributed_string(@"rmv");
  }
}

id _log_mdns_format_add_rmv_uppercase(void *a1)
{
  else {
    return _log_mdns_create_attributed_string(@"RMV");
  }
}

id _log_mdns_format_dns_counts(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  uint64_t v2 = (void *)objc_msgSend( objc_alloc((Class)&off_18C75D7E8),  "initWithFormat:",  @"%u/%u/%u/%u",  HIWORD(v1),  WORD2(v1),  WORD1(v1),  (unsigned __int16)v1);
  id v3 = v2;
  if (v2)
  {
    _log_mdns_create_attributed_string(v2);
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v4 = 0LL;
  }

  return v4;
}

id _log_mdns_format_dns_record_type(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  if (v1 >> 16)
  {
    id v4 = 0LL;
  }

  else
  {
    _log_mdns_create_dns_record_type_string((unsigned __int16)v1);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    id v3 = v2;
    if (v2)
    {
      _log_mdns_create_attributed_string(v2);
      id v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v4 = 0LL;
    }
  }

  return v4;
}

id _log_mdns_format_dns_id_and_flags(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  if (HIDWORD(v1)) {
    return 0LL;
  }
  uint64_t v6 = 0LL;
  LOBYTE(v3) = BYTE3(v1);
  HIBYTE(v3) = BYTE2(v1);
  char v4 = BYTE1(v1);
  char v5 = v1;
  _log_mdns_format_dns_message_ex(&v3, 0xCuLL, 64);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _log_mdns_format_dns_service_type(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  uint64_t v2 = 0LL;
  if (v1 <= 0xFF && v1 <= 5u)
  {
    +[NSString stringWithUTF8String:](&off_18C75D7E8, "stringWithUTF8String:", off_18A3202D8[v1]);
    unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

id _log_mdns_format_dnssec_insecure_validation_state(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  if (v1 <= 3)
  {
    +[NSString stringWithUTF8String:](&off_18C75D7E8, "stringWithUTF8String:", off_18A320DC8[v1]);
    unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

id _log_mdns_format_dnssec_result(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  if (v1 <= 3)
  {
    +[NSString stringWithUTF8String:](&off_18C75D7E8, "stringWithUTF8String:", off_18A320DA8[v1]);
    unsigned __int16 v3 = (void *)objc_claimAutoreleasedReturnValue();
    char v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

uint64_t _log_mdns_format_err()
{
  return NSPrintTypedObject();
}

id _log_mdns_format_gai_options(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)[objc_alloc((Class)&off_18C75D938) initWithCapacity:0];
  if (v2)
  {
    uint64_t v3 = [v1 unsignedLongLongValue];
    objc_msgSend(v2, "appendFormat:", @"0x%llX {", v3);
    uint64_t v4 = 0LL;
    char v5 = (const char *)&unk_188F5CA9B;
    do
    {
      if ((v3 & byte_18A320F78[v4]) != 0)
      {
        objc_msgSend(v2, "appendFormat:", @"%s%s", v5, *(void *)&byte_18A320F78[v4 + 8]);
        char v5 = ", ";
      }

      v4 += 16LL;
    }

    while (v4 != 80);
    [v2 appendString:@"}"];
    _log_mdns_create_attributed_string(v2);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  return v6;
}

id _log_mdns_format_mortality(void *a1)
{
  unint64_t v1 = [a1 longLongValue];
  if (v1 > 2)
  {
    uint64_t v2 = 0LL;
  }

  else
  {
    _log_mdns_create_attributed_string(*((void **)&off_18A320FC8 + v1));
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id _log_mdns_format_negative_reason(void *a1)
{
  uint64_t v1 = [a1 longLongValue];
  uint64_t v2 = 0LL;
  if (v1 == (int)v1 && v1 <= 5)
  {
    _log_mdns_create_attributed_string(*(&off_18A321078 + (int)v1));
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id _log_mdns_format_positive_negative(void *a1)
{
  else {
    return _log_mdns_create_attributed_string(@"negative");
  }
}

id _log_mdns_format_powerlog_event_subtype(void *a1)
{
  unint64_t v1 = [a1 unsignedLongLongValue];
  uint64_t v2 = 0LL;
  if (v1 <= 0xFF && v1 <= 0x12u)
  {
    +[NSString stringWithUTF8String:](&off_18C75D7E8, "stringWithUTF8String:", off_18A320FE0[(char)v1]);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v2 = 0LL;
    }
  }

  return v2;
}

id _log_mdns_format_protocol(void *a1)
{
  uint64_t v1 = [a1 longLongValue];
  uint64_t v2 = 0LL;
  if (v1 == (int)v1 && v1 <= 4)
  {
    _log_mdns_create_attributed_string(*(&off_18A3210A8 + (int)v1));
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

id _log_mdns_format_session_event(void *a1)
{
  uint64_t v1 = [a1 longLongValue];
  if (v1 == (int)v1 && (v1 - 1) <= 3)
  {
    _log_mdns_create_attributed_string(*(&off_18A3210D0 + (v1 - 1)));
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    uint64_t v2 = 0LL;
  }

  return v2;
}

id _log_mdns_format_termination_reason(void *a1)
{
  uint64_t v1 = [a1 longLongValue];
  uint64_t v2 = 0LL;
  if (v1 == (int)v1 && v1 <= 5)
  {
    _log_mdns_create_attributed_string(*(&off_18A3210F0 + (int)v1));
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

uint64_t _log_mdns_format_time_duration()
{
  return NSPrintTypedObject();
}

id _log_mdns_format_yes_no(void *a1)
{
  else {
    return _log_mdns_create_attributed_string(@"no");
  }
}

id _log_mdns_create_attributed_string(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)[objc_alloc((Class)&off_18C75D2D0) initWithString:v1];

  return v2;
}

id _log_mdns_format_dns_message_ex(unsigned __int16 *a1, unint64_t a2, int a3)
{
  __s = 0LL;
  DNSMessageToString(a1, a2, a3 | 4, (uint64_t)&__s);
  if (!__s) {
    return 0LL;
  }
  id v3 = objc_alloc((Class)&off_18C75D7E8);
  uint64_t v4 = (void *)[v3 initWithBytesNoCopy:__s length:strlen(__s) encoding:4 freeWhenDone:1];
  if (v4)
  {
    char v5 = (void *)[objc_alloc((Class)&off_18C75D2D0) initWithString:v4];
  }

  else if (__s)
  {
    free(__s);
    char v5 = 0LL;
    __s = 0LL;
  }

  else
  {
    char v5 = 0LL;
  }

  return v5;
}

id _log_mdns_create_dns_record_type_string(uint64_t a1)
{
  uint64_t v2 = DNSRecordTypeValueToString(a1);
  id v3 = objc_alloc((Class)&off_18C75D7E8);
  if (v2) {
    uint64_t v4 = (void *)objc_msgSend(v3, "initWithFormat:", @"%s", v2);
  }
  else {
    uint64_t v4 = (void *)objc_msgSend(v3, "initWithFormat:", @"TYPE%u", a1);
  }
  return v4;
}

id _log_mdns_format_base64(void *a1)
{
  id v1 = a1;
  [v1 bytes];
  [v1 length];

  Base64EncodeCopyEx();
  return 0LL;
}

id _log_mdns_format_dns_header(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (unsigned __int16 *)[v1 bytes];
  unint64_t v3 = [v1 length];

  return _log_mdns_format_dns_message_ex(v2, v3, 16);
}

id _log_mdns_format_dns_message(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (unsigned __int16 *)[v1 bytes];
  unint64_t v3 = [v1 length];

  return _log_mdns_format_dns_message_ex(v2, v3, 0);
}

unsigned __int16 *_log_mdns_format_record_data(void *a1)
{
  unsigned __int16 v4 = 0;
  unint64_t v3 = 0LL;
  id v1 = _log_mdns_extract_record_type_and_rdata(a1, &v4, (uint64_t *)&v3);
  if (v1)
  {
    _log_mdns_create_record_data_attributed_string(v1, v3, v4);
    id v1 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
  }

  return v1;
}

unsigned __int16 *_log_mdns_format_record_type_data(void *a1)
{
  unsigned __int16 v8 = 0;
  unint64_t v7 = 0LL;
  id v1 = _log_mdns_extract_record_type_and_rdata(a1, &v8, (uint64_t *)&v7);
  if (v1)
  {
    _log_mdns_create_dns_record_type_string(v8);
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2
      && ((_log_mdns_create_record_data_string(v1, v7, v8), (unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)
       || (NSPrintF(), (unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL)))
    {
      unsigned __int16 v4 = (void *)[objc_alloc((Class)&off_18C75D7E8) initWithFormat:@"%@ %@", v2, v3];
      char v5 = v4;
      if (v4)
      {
        _log_mdns_create_attributed_string(v4);
        id v1 = (unsigned __int16 *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        id v1 = 0LL;
      }
    }

    else
    {
      id v1 = 0LL;
    }
  }

  return v1;
}

unsigned __int16 *_log_mdns_extract_record_type_and_rdata(void *a1, _WORD *a2, uint64_t *a3)
{
  id v5 = a1;
  if ((unint64_t)[v5 length] < 2)
  {
    LOWORD(v9) = 0;
    uint64_t v10 = 0LL;
    unsigned __int16 v8 = 0LL;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  id v6 = v5;
  unint64_t v7 = (unsigned __int16 *)[v6 bytes];
  unsigned __int16 v8 = v7 + 1;
  unsigned int v9 = bswap32(*v7) >> 16;
  uint64_t v10 = [v6 length] - 2;
  if (a2) {
LABEL_5:
  }
    *a2 = v9;
LABEL_6:
  if (a3) {
    *a3 = v10;
  }

  return v8;
}

id _log_mdns_create_record_data_string(unsigned __int16 *a1, unint64_t a2, int a3)
{
  __s = 0LL;
  DNSRecordDataToStringEx(a1, a2, a3, 0LL, 0LL, 0, (uint64_t)&__s);
  if (!__s) {
    return 0LL;
  }
  size_t v3 = strlen(__s);
  id v4 = objc_alloc((Class)&off_18C75D7E8);
  id v5 = (void *)[v4 initWithBytesNoCopy:__s length:v3 encoding:4 freeWhenDone:1];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }

  else if (__s)
  {
    free(__s);
    __s = 0LL;
  }

  return v6;
}

uint64_t _log_mdns_negative_reason_to_string(unsigned int a1)
{
  if (a1 > 5) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_18A321078 + a1);
  }
}

uint64_t _log_mdns_protocol_to_string(unsigned int a1)
{
  if (a1 > 4) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_18A3210A8 + a1);
  }
}

uint64_t _log_mdns_session_event_to_string(int a1)
{
  else {
    return (uint64_t)*(&off_18A3210D0 + (a1 - 1));
  }
}

uint64_t _log_mdns_termination_reason_to_string(unsigned int a1)
{
  if (a1 > 5) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_18A3210F0 + a1);
  }
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

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>( unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  if (a3)
  {
    while (1)
    {
      unsigned int v5 = *a1++;
      unsigned int v4 = v5;
      unsigned int v6 = v5 + 32;
      if (v5 - 65 < 0x1A) {
        unsigned int v4 = v6;
      }
      unsigned int v8 = *a2++;
      unsigned int v7 = v8;
      unsigned int v9 = v8 + 32;
      if (v8 - 65 < 0x1A) {
        unsigned int v7 = v9;
      }
      if (v4 > v7) {
        a4 = 1;
      }
      if (v4 < v7) {
        a4 = -1;
      }
      if (v4 != v7) {
        break;
      }
      if (!--a3) {
        return 0;
      }
    }
  }

  else
  {
    return 0;
  }

  return a4;
}

uint64_t Base64EncodeCopyEx()
{
  return MEMORY[0x18960E7E0]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x18960ECE8]();
}

uint64_t NSPrintTypedObject()
{
  return MEMORY[0x18960ECF8]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

void *__cdecl bsearch( const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1895F9650](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x189616830](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

uint64_t stricmp_prefix()
{
  return MEMORY[0x18960EFD8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}