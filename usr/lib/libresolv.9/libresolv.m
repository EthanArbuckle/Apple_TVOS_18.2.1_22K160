int res_9_b64_ntop(const u_char *a1, size_t a2, char *a3, size_t a4)
{
  size_t v5;
  size_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  char *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  char v15;
  __int16 v17;
  unsigned __int8 v18;
  if (a2 >= 3)
  {
    v5 = 0LL;
    while (1)
    {
      v6 = v5 + 4;
      if (v5 + 4 > a4) {
        goto LABEL_16;
      }
      v7 = a1[2];
      v8 = a1[1];
      v9 = *a1;
      a1 += 3;
      a2 -= 3LL;
      v10 = &a3[v5 + 1];
      *(v10 - 1) = Base64[(unint64_t)v9 >> 2];
      *v10 = Base64[(v8 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16LL * (v9 & 3))];
      v10[1] = Base64[(v7 >> 6) & 0xFFFFFFFFFFFFFFC3LL | (4 * (v8 & 0xF))];
      v10[2] = Base64[v7 & 0x3F];
      v5 = v6;
      if (a2 <= 2)
      {
        if (a2) {
          goto LABEL_8;
        }
        goto LABEL_14;
      }
    }
  }

  v6 = 0LL;
  if (a2)
  {
LABEL_8:
    v11 = 0LL;
    v18 = 0;
    v17 = 0;
    do
    {
      *((_BYTE *)&v17 + v11) = a1[v11];
      ++v11;
    }

    while (a2 != v11);
    if (v6 + 4 > a4) {
      goto LABEL_16;
    }
    v12 = HIBYTE(v17);
    v13 = ((unint64_t)HIBYTE(v17) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16LL * (v17 & 3));
    a3[v6] = Base64[(unint64_t)v17 >> 2];
    v14 = v18;
    a3[v6 | 1] = Base64[v13];
    v15 = 61;
    if (a2 != 1) {
      v15 = Base64[(v14 >> 6) & 0xFFFFFFFFFFFFFFC3LL | (4LL * (v12 & 0xF))];
    }
    a3[v6 | 2] = v15;
    a3[v6 | 3] = 61;
    v6 += 4LL;
  }

LABEL_14:
  if (v6 >= a4)
  {
LABEL_16:
    LODWORD(v6) = -1;
    return v6;
  }

  a3[v6] = 0;
  return v6;
}

int res_9_b64_pton(const char *a1, u_char *a2, size_t a3)
{
  LODWORD(v6) = 0;
  unsigned int v7 = 0;
  char v8 = 1;
  uint64_t v9 = MEMORY[0x1895F8770];
LABEL_2:
  uint64_t v10 = (int)v6;
  while (1)
  {
    do
    {
      while (1)
      {
        unsigned int v12 = *a1++;
        unsigned int v11 = v12;
        if (!v12)
        {
          if ((v8 & 1) != 0) {
            return v6;
          }
          return -1;
        }

        if ((v11 & 0x80000000) == 0) {
          break;
        }
        if (!__maskrune(v11, 0x4000uLL)) {
          goto LABEL_8;
        }
      }
    }

    while ((*(_DWORD *)(v9 + 4LL * v11 + 60) & 0x4000) != 0);
LABEL_8:
    if (v11 == 61) {
      break;
    }
    v13 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", v11, 0x41uLL);
    if (!v13) {
      return -1;
    }
    if (v7)
    {
      if (v7 == 1)
      {
        if (!a2)
        {
          char v8 = 0;
          LODWORD(v6) = v6 + 1;
          unsigned int v7 = 2;
          goto LABEL_2;
        }

        uint64_t v6 = (int)v6 + 1LL;
        if (v10 + 1 < a3)
        {
          char v8 = 0;
          a2[v10] |= (v13
                    - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/") >> 4;
          a2[v6] = 16
                 * ((_BYTE)v13 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
          unsigned int v7 = 2;
          goto LABEL_2;
        }
      }

      else
      {
        if (v7 != 2)
        {
          if (a2)
          {
            a2[(int)v6] |= (_BYTE)v13
                         - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
          }

          unsigned int v7 = 0;
          LODWORD(v6) = v6 + 1;
          char v8 = 1;
          goto LABEL_2;
        }

        if (!a2)
        {
          char v8 = 0;
          LODWORD(v6) = v6 + 1;
          unsigned int v7 = 3;
          goto LABEL_2;
        }

        uint64_t v6 = (int)v6 + 1LL;
        if (v10 + 1 < a3)
        {
          char v8 = 0;
          a2[v10] |= (v13
                    - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/") >> 2;
          a2[v6] = ((_BYTE)v13 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/") << 6;
          unsigned int v7 = 3;
          goto LABEL_2;
        }
      }

      return -1;
    }

    char v8 = 0;
    unsigned int v7 = 1;
    if (a2)
    {
      char v8 = 0;
      a2[(int)v6] = 4
                  * ((_BYTE)v13 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
    }
  }

  if (v7 >= 2)
  {
    v16 = a1 + 2;
    unsigned int v15 = *a1;
    if (v7 == 2)
    {
      if (!*a1) {
        return -1;
      }
      while (v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : *(_DWORD *)(v9 + 4LL * v15 + 60) & 0x4000)
      {
        unsigned int v15 = *(v16++ - 1);
        int result = -1;
        if (!v15) {
          return result;
        }
      }

      if (v15 != 61) {
        return -1;
      }
      unsigned int v15 = *(v16 - 1);
      if (*(v16 - 1))
      {
LABEL_41:
        while (v15 > 0x7F ? __maskrune(v15, 0x4000uLL) : *(_DWORD *)(v9 + 4LL * v15 + 60) & 0x4000)
        {
          unsigned int v19 = *v16++;
          unsigned int v15 = v19;
          if (!v19) {
            goto LABEL_46;
          }
        }

        return -1;
      }
    }

    else
    {
      v16 = a1 + 1;
      if (*a1) {
        goto LABEL_41;
      }
    }

LABEL_46:
  }

  return -1;
}

          if ((header->flags & 0x200) != 0)
          {
            v20 = "TC: Truncated\n";
            v21 = 14LL;
          }

          else
          {
            v20 = "TC: Non-Truncated\n";
            v21 = 18LL;
          }

          fwrite(v20, v21, 1uLL, f);
          if ((mask & 0x20) == 0)
          {
LABEL_10:
            if ((mask & 0x40) == 0) {
              goto LABEL_11;
            }
            goto LABEL_54;
          }

    v36 = strchr(v30, 46);
    v30 = v36 + 1;
    if (v36) {
      continue;
    }
    break;
  }

  free(__s);
  if (v27) {
    goto LABEL_49;
  }
LABEL_48:
  v27 = _pdns_get_default_handles(a1, (void **)&v71);
  if (!v27)
  {
LABEL_70:
    v40 = -1;
    v45 = a6;
    goto LABEL_71;
  }

uint64_t dns_async_start(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  *a1 = 0;
  if (a2)
  {
    uint64_t v10 = si_module_with_name();
    if (v10)
    {
      uint64_t v11 = v10;
      unsigned int v12 = calloc(1uLL, 0x18uLL);
      if (v12)
      {
        v13 = v12;
        *unsigned int v12 = a6;
        v12[1] = a7;
        v12[2] = v11;
        int v14 = si_async_call();
        uint64_t result = 0LL;
        *a1 = v14;
        if (v14) {
          return result;
        }
        free(v13);
      }

      si_module_release();
    }
  }

  return 3LL;
}

void _dns_callback(uint64_t a1, unsigned int a2, void *a3)
{
  if (a3)
  {
    if (!*a3)
    {
      si_item_release();
LABEL_21:
      si_module_release();
      free(a3);
      return;
    }

    if (a2 <= 9) {
      uint64_t v5 = a2;
    }
    else {
      uint64_t v5 = 3LL;
    }
    if (a1 && (size_t v6 = *(unsigned int *)(a1 + 32), (int)v6 >= 1))
    {
      unsigned int v7 = malloc(*(unsigned int *)(a1 + 32));
      char v8 = v7;
      if (!v7)
      {
        uint64_t v11 = 0LL;
        goto LABEL_19;
      }

      memcpy(v7, *(const void **)(a1 + 40), v6);
      size_t v9 = *(unsigned int *)(a1 + 48);
      if ((int)v9 >= 1)
      {
        uint64_t v10 = malloc(*(unsigned int *)(a1 + 48));
        uint64_t v11 = v10;
        if (v10)
        {
          memcpy(v10, *(const void **)(a1 + 56), v9);
LABEL_20:
          si_item_release();
          ((void (*)(uint64_t, void *, size_t, void *, size_t, void))*a3)(v5, v8, v6, v11, v9, a3[1]);
          goto LABEL_21;
        }

        free(v8);
        char v8 = 0LL;
LABEL_19:
        size_t v6 = 0LL;
        size_t v9 = 0LL;
        uint64_t v5 = 3LL;
        goto LABEL_20;
      }

      uint64_t v11 = 0LL;
    }

    else
    {
      char v8 = 0LL;
      uint64_t v11 = 0LL;
      size_t v6 = 0LL;
    }

    size_t v9 = 0LL;
    goto LABEL_20;
  }
}

uint64_t dns_async_send(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return dns_async_start(a1, a2, a3, a4, a5, 0LL, 0LL);
}

uint64_t dns_async_receive()
{
  return 0LL;
}

uint64_t dns_async_handle_reply()
{
  return 0LL;
}

dns_resource_record_t *__cdecl dns_parse_resource_record(const char *buf, uint32_t len)
{
  uint32_t v3 = len;
  v4 = buf;
  return _dns_parse_resource_record_internal((uint64_t)buf, (unint64_t *)&v4, &v3);
}

dns_resource_record_t *_dns_parse_resource_record_internal( uint64_t a1, unint64_t *a2, unsigned int *a3)
{
  if ((int)*a3 >= 1)
  {
    size_t v6 = (dns_resource_record_t *)calloc(1uLL, 0x18uLL);
    unsigned int v7 = _dns_parse_domain_name(a1, a2, a3);
    v6->name = v7;
    if (v7)
    {
      if ((int)*a3 > 9)
      {
        unint64_t v8 = *a2;
        unsigned int v9 = bswap32(*(unsigned __int16 *)*a2) >> 16;
        v6->dnstype = v9;
        v6->dnsclass = bswap32(*(unsigned __int16 *)(v8 + 2)) >> 16;
        v6->ttl = bswap32(*(_DWORD *)(v8 + 4));
        unsigned int v10 = bswap32(*(unsigned __int16 *)(v8 + 8));
        unint64_t v11 = v8 + 10;
        *a2 = v8 + 10;
        int v12 = *a3 - 10;
        *a3 = v12;
        if (v12 >= (int)HIWORD(v10))
        {
          size_t v13 = HIWORD(v10);
          v6->data.A = 0LL;
          switch(v9)
          {
            case 1u:
              *a3 -= 4;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 4uLL);
              in_addr_t v16 = *(_DWORD *)*a2;
              *a2 += 4LL;
              v6->data.A->addr.uint64_t s_addr = v16;
              goto LABEL_59;
            case 2u:
            case 3u:
            case 4u:
            case 5u:
            case 7u:
            case 8u:
            case 9u:
            case 0xCu:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 8uLL);
              int v14 = _dns_parse_domain_name(a1, a2, a3);
              goto LABEL_7;
            case 6u:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x28uLL);
              *(void *)v6->data.A = _dns_parse_domain_name(a1, a2, a3);
              if (!*(void *)v6->data.A) {
                break;
              }
              *(void *)&v6->data.A[2].addr.uint64_t s_addr = _dns_parse_domain_name(a1, a2, a3);
              *a3 -= 20;
              v17 = (unsigned int *)*a2;
              unsigned int v18 = bswap32(*(_DWORD *)*a2);
              *a2 += 4LL;
              v6->data.A[4].addr.uint64_t s_addr = v18;
              unsigned int v19 = bswap32(v17[1]);
              *a2 = (unint64_t)(v17 + 2);
              v6->data.A[5].addr.uint64_t s_addr = v19;
              unsigned int v20 = bswap32(v17[2]);
              *a2 = (unint64_t)(v17 + 3);
              v6->data.A[6].addr.uint64_t s_addr = v20;
              unsigned int v21 = bswap32(v17[3]);
              *a2 = (unint64_t)(v17 + 4);
              v6->data.A[7].addr.uint64_t s_addr = v21;
              unsigned int v22 = bswap32(v17[4]);
              *a2 = (unint64_t)(v17 + 5);
              v6->data.A[8].addr.uint64_t s_addr = v22;
              goto LABEL_59;
            case 0xBu:
              unsigned int v24 = *a3;
              *a3 = v24 - 5;
              int v25 = v13 - 5;
              *a3 = v24 - v13;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x18uLL);
              unint64_t v27 = *a2;
              in_addr_t v28 = *(_DWORD *)*a2;
              *a2 += 4LL;
              v6->data.A->addr.uint64_t s_addr = v28;
              LOBYTE(v28) = *(_BYTE *)(v27 + 4);
              *a2 = v27 + 5;
              LOBYTE(v6->data.A[1].addr.s_addr) = v28;
              v6->data.A[2].addr.uint64_t s_addr = 8 * v25;
              *(void *)&v6->data.A[4].addr.uint64_t s_addr = 0LL;
              if ((_DWORD)v13 != 5)
              {
                v29 = calloc(1uLL, v6->data.A[2].addr.s_addr);
                int v30 = 0;
                unsigned int v31 = 0;
                *(void *)&v6->data.A[4].addr.uint64_t s_addr = v29;
                do
                {
                  uint64_t v32 = 0LL;
                  uint64_t v33 = v31;
                  int v34 = *(unsigned __int8 *)(*a2)++;
                  v31 += 8;
                  unsigned int v35 = 128;
                  do
                  {
                    if ((v35 & v34) != 0) {
                      char v36 = -1;
                    }
                    else {
                      char v36 = 0;
                    }
                    *(_BYTE *)(*(void *)&v6->data.A[4].addr.s_addr + v33 + v32) = v36;
                    v35 >>= 1;
                    ++v32;
                  }

                  while ((_DWORD)v32 != 8);
                  ++v30;
                }

                while (v30 != v25);
              }

              goto LABEL_59;
            case 0xDu:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              *(void *)v6->data.A = _dns_parse_string(a2, (int *)a3);
              if (!*(void *)v6->data.A) {
                break;
              }
              goto LABEL_49;
            case 0xEu:
            case 0x11u:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              *(void *)v6->data.A = _dns_parse_domain_name(a1, a2, a3);
              if (!*(void *)v6->data.A) {
                break;
              }
              goto LABEL_57;
            case 0xFu:
            case 0x15u:
              *a3 -= 2;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              unsigned int v15 = bswap32(*(unsigned __int16 *)*a2) >> 16;
              *a2 += 2LL;
              LOWORD(v6->data.A->addr.s_addr) = v15;
              goto LABEL_57;
            case 0x10u:
              v37 = (dns_address_record_t *)malloc(0x10uLL);
              v6->data.A = v37;
              v37->addr.uint64_t s_addr = 0;
              *(void *)&v37[2].addr.uint64_t s_addr = 0LL;
              while (2)
              {
                A = v6->data.A;
                if (A->addr.s_addr) {
                  v39 = realloc(*(void **)&A[2].addr.s_addr, 8LL * (A->addr.s_addr + 1));
                }
                else {
                  v39 = calloc(1uLL, 8uLL);
                }
                *(void *)&v6->data.A[2].addr.uint64_t s_addr = v39;
                *(void *)(*(void *)&v6->data.A[2].addr.s_addr + 8LL * v6->data.A->addr.s_addr) = _dns_parse_string(a2, (int *)a3);
                v40 = v6->data.A;
                uint64_t s_addr = v40->addr.s_addr;
                if (*(void *)(*(void *)&v40[2].addr.s_addr + 8 * s_addr))
                {
                  v40->addr.uint64_t s_addr = s_addr + 1;
                  continue;
                }

                goto LABEL_64;
              }

            case 0x12u:
              *a3 -= 4;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              unsigned int v42 = bswap32(*(_DWORD *)*a2);
              *a2 += 4LL;
              v6->data.A->addr.uint64_t s_addr = v42;
              goto LABEL_57;
            case 0x13u:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 8uLL);
              int v14 = _dns_parse_string(a2, (int *)a3);
LABEL_7:
              *(void *)v6->data.A = v14;
              if (!*(void *)v6->data.A) {
                break;
              }
              goto LABEL_59;
            case 0x14u:
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              *(void *)v6->data.A = _dns_parse_string(a2, (int *)a3);
              v43 = v6->data.A;
              if (!*(void *)&v43->addr.s_addr) {
                break;
              }
              if (*a2 >= v11 + v13)
              {
                *(void *)&v43[2].addr.uint64_t s_addr = 0LL;
              }

              else
              {
LABEL_49:
                v44 = _dns_parse_string(a2, (int *)a3);
LABEL_58:
                *(void *)&v6->data.A[2].addr.uint64_t s_addr = v44;
                if (!*(void *)&v6->data.A[2].addr.s_addr) {
                  break;
                }
              }

LABEL_59:
              if (v12 >= (int)*a3)
              {
                unsigned int v61 = (int)(v12 - *a3) <= (int)v13 ? v13 : v12 - *a3;
                if (v12 >= (int)v61)
                {
                  *a2 = v11 + v61;
                  *a3 = v12 - v61;
                  return v6;
                }
              }

              break;
            case 0x1Cu:
              *a3 -= 16;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              in_addr_t v45 = *(_DWORD *)*a2;
              *a2 += 4LL;
              v6->data.A->addr.uint64_t s_addr = v45;
              in_addr_t v46 = *(_DWORD *)*a2;
              *a2 += 4LL;
              v6->data.A[1].addr.uint64_t s_addr = v46;
              in_addr_t v47 = *(_DWORD *)*a2;
              *a2 += 4LL;
              v6->data.A[2].addr.uint64_t s_addr = v47;
              uint64_t v48 = *a2 + 4;
              unsigned int v49 = *(_DWORD *)*a2;
              goto LABEL_54;
            case 0x1Du:
              *a3 -= 16;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              unint64_t v50 = *a2;
              char v51 = *(_BYTE *)(*a2)++;
              LOBYTE(v6->data.A->addr.s_addr) = v51;
              char v52 = *(_BYTE *)(v50 + 1);
              *a2 = v50 + 2;
              BYTE1(v6->data.A->addr.s_addr) = v52;
              char v53 = *(_BYTE *)(v50 + 2);
              *a2 = v50 + 3;
              BYTE2(v6->data.A->addr.s_addr) = v53;
              char v54 = *(_BYTE *)(v50 + 3);
              unsigned int v55 = *(_DWORD *)(v50 + 4);
              *a2 = v50 + 4;
              HIBYTE(v6->data.A->addr.s_addr) = v54;
              *a2 = v50 + 8;
              v6->data.A[1].addr.uint64_t s_addr = bswap32(v55);
              unsigned int v56 = bswap32(*(_DWORD *)(v50 + 8));
              *a2 = v50 + 12;
              v6->data.A[2].addr.uint64_t s_addr = v56;
              unsigned int v49 = bswap32(*(_DWORD *)(v50 + 12));
              uint64_t v48 = v50 + 16;
LABEL_54:
              *a2 = v48;
              v6->data.A[3].addr.uint64_t s_addr = v49;
              goto LABEL_59;
            case 0x21u:
              *a3 -= 6;
              v6->data.A = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              unint64_t v57 = *a2;
              unsigned int v58 = bswap32(*(unsigned __int16 *)*a2);
              *a2 += 2LL;
              LOWORD(v6->data.A->addr.s_addr) = HIWORD(v58);
              unsigned int v59 = bswap32(*(unsigned __int16 *)(v57 + 2));
              *a2 = v57 + 4;
              HIWORD(v6->data.A->addr.s_addr) = HIWORD(v59);
              unsigned int v60 = bswap32(*(unsigned __int16 *)(v57 + 4)) >> 16;
              *a2 = v57 + 6;
              LOWORD(v6->data.A[1].addr.s_addr) = v60;
LABEL_57:
              v44 = _dns_parse_domain_name(a1, a2, a3);
              goto LABEL_58;
            default:
              *a3 -= v13;
              v23 = (dns_address_record_t *)calloc(1uLL, 0x10uLL);
              v6->data.A = v23;
              LOWORD(v23->addr.s_addr) = v13;
              *(void *)&v6->data.A[2].addr.uint64_t s_addr = calloc(1uLL, v13);
              memmove(*(void **)&v6->data.A[2].addr.s_addr, (const void *)*a2, v13);
              *a2 += v13;
              goto LABEL_59;
          }
        }
      }
    }

    if (v26 == -1)
    {
      if (v37)
      {
        v40 = (__res_9_state *)a1;
        v26 = 4;
      }

      else
      {
        if (!v36) {
          return 0xFFFFFFFFLL;
        }
LABEL_64:
        v40 = (__res_9_state *)a1;
        v26 = 2;
      }

LABEL_64:
    dns_free_resource_record(v6);
  }

  return 0LL;
}

      unsigned int v18 = 22;
      goto LABEL_75;
    }

    unsigned int v31 = 0;
LABEL_53:
    if (v25) {
      *v23++ = 16 * v26;
    }
    unsigned int v18 = 40;
    if (v31 < 1)
    {
      LOBYTE(v31) = v24;
    }

    else if (((v31 + 3) & 0xFFFFFFFC) != v24 || (v26 << (v31 - v24 + 8)))
    {
      goto LABEL_64;
    }

    *size_t v6 = 65;
    *uint64_t v5 = v31;
    uint64_t v5 = v23 + 1;
    a1 = v21 + 2;
    size_t v6 = v23;
  }

  while (v21[1] == 46);
  if (v21[1]) {
    goto LABEL_64;
  }
LABEL_72:
  dns_address_record_t *v23 = 0;
LABEL_73:
  if (v5 - a2 >= 256) {
    goto LABEL_74;
  }
  return 0;
}

dns_question_t *__cdecl dns_parse_question(const char *buf, uint32_t len)
{
  uint32_t v3 = len;
  v4 = buf;
  return (dns_question_t *)_dns_parse_question_internal((uint64_t)buf, (unint64_t *)&v4, &v3);
}

_WORD *_dns_parse_question_internal(uint64_t a1, unint64_t *a2, unsigned int *a3)
{
  if (a2 && *a2 && (int)*a3 >= 1)
  {
    size_t v6 = calloc(1uLL, 0x10uLL);
    unsigned int v7 = _dns_parse_domain_name(a1, a2, a3);
    *(void *)size_t v6 = v7;
    if (v7)
    {
      if ((int)*a3 > 3)
      {
        *a3 -= 4;
        unint64_t v9 = *a2;
        v6[4] = bswap32(*(unsigned __int16 *)*a2) >> 16;
        unsigned int v10 = bswap32(*(unsigned __int16 *)(v9 + 2)) >> 16;
        *a2 = v9 + 4;
        v6[5] = v10;
        return v6;
      }

      free(v7);
    }

    free(v6);
  }

  return 0LL;
}

dns_reply_t *__cdecl dns_parse_packet(const char *buf, uint32_t len)
{
  v2 = 0LL;
  if (buf)
  {
    uint32_t v3 = len - 12;
    if (len >= 0xC)
    {
      v2 = (dns_reply_t *)calloc(1uLL, 0x38uLL);
      uint64_t v5 = calloc(1uLL, 0xCuLL);
      v2->header = (dns_header_t *)v5;
      *uint64_t v5 = bswap32(*(unsigned __int16 *)buf) >> 16;
      v5[1] = bswap32(*((unsigned __int16 *)buf + 1)) >> 16;
      unsigned int v6 = bswap32(*((unsigned __int16 *)buf + 2));
      size_t v7 = HIWORD(v6);
      v5[2] = HIWORD(v6);
      v5[3] = bswap32(*((unsigned __int16 *)buf + 3)) >> 16;
      v5[4] = bswap32(*((unsigned __int16 *)buf + 4)) >> 16;
      unsigned int v8 = bswap32(*((unsigned __int16 *)buf + 5)) >> 16;
      unsigned int v19 = buf + 12;
      v5[5] = v8;
      uint32_t v18 = v3;
      v2->question = (dns_question_t **)calloc(v7, 8uLL);
      if (v5[2])
      {
        uint64_t v9 = 0LL;
        while (1)
        {
          v2->question[v9] = (dns_question_t *)_dns_parse_question_internal( (uint64_t)buf,  (unint64_t *)&v19,  &v18);
          unsigned int v10 = (dns_resource_record_t *)v2->question[v9];
          if (!v10) {
            break;
          }
        }

        __int16 v14 = v9 - 1;
        if (!v9) {
          __int16 v14 = 0;
        }
        v5[2] = v14;
        *(_DWORD *)(v5 + 3) = 0;
        goto LABEL_31;
      }

LABEL_7:
      v2->answer = (dns_resource_record_t **)calloc((unsigned __int16)v5[3], 8uLL);
      if (v5[3])
      {
        uint64_t v11 = 0LL;
        while (1)
        {
          v2->answer[v11] = _dns_parse_resource_record_internal((uint64_t)buf, (unint64_t *)&v19, &v18);
          unsigned int v10 = v2->answer[v11];
          if (!v10) {
            break;
          }
        }

        __int16 v15 = v11 - 1;
        if (!v11) {
          __int16 v15 = 0;
        }
        v5[3] = v15;
        v5[4] = 0;
        goto LABEL_31;
      }

  uint64_t v5 = v7;
  return v5->number;
}

LABEL_11:
      v2->authority = (dns_resource_record_t **)calloc((unsigned __int16)v5[4], 8uLL);
      if (v5[4])
      {
        uint64_t v12 = 0LL;
        while (1)
        {
          v2->authority[v12] = _dns_parse_resource_record_internal((uint64_t)buf, (unint64_t *)&v19, &v18);
          unsigned int v10 = v2->authority[v12];
          if (!v10) {
            break;
          }
        }

        __int16 v16 = v12 - 1;
        if (!v12) {
          __int16 v16 = 0;
        }
        v5[4] = v16;
        goto LABEL_31;
      }

        free(A);
      }

      break;
  }

  free(rr);
}

  *__error() = 28;
  *a3 = v9;
  *a4 = v8;
  return 0xFFFFFFFFLL;
}

  if ((a1->options & 2) != 0) {
    puts(";; res_query_mDNSResponder");
  }
  unsigned int v20 = DNSServiceQueryRecord( &sdRef,  0x1000u,  v18,  v19,  a4,  v12,  (DNSServiceQueryRecordReply)res_query_callback,  &context);
  if (v18) {
    free(v19);
  }
  if (v20) {
    return 0LL;
  }
  in_addr_t v47 = a7;
  unsigned int v21 = kqueue();
  gettimeofday(&v51, 0LL);
  retrans = a1->retrans;
  timeout.tv_sec = retrans;
  timeout.tv_nsec = 0LL;
  tv_sec = v51.tv_sec;
  tv_usec = v51.tv_usec;
  changelist.ident = DNSServiceRefSockFD(sdRef);
  *(_DWORD *)&changelist.filter = 0x1FFFF;
  memset(&changelist.fflags, 0, 20);
  int v25 = kevent(v21, &changelist, 1, 0LL, 0, 0LL);
  uint64_t result = 0LL;
  if (!v25)
  {
    if (interrupt_pipe_enabled)
    {
      v26 = pthread_getspecific(interrupt_pipe_key);
      if (v26)
      {
        if ((*v26 & 0x80000000) == 0)
        {
          v53.ident = *v26;
          *(void *)&v53.filter = 0x1FFFFLL;
          v53.data = 0LL;
          v53.udata = a2;
          kevent(v21, &v53, 1, 0LL, 0, 0LL);
        }
      }
    }

    in_addr_t v46 = a8;
    unint64_t v27 = 1000LL * tv_usec;
    unsigned int v49 = 0LL;
    unsigned int v55 = -1;
    in_addr_t v28 = pthread_self();
    asprintf(&v49, "self.thread.%lu", v28);
    if (v49)
    {
      notify_register_plain();
      free(v49);
    }

    v29 = tv_sec + retrans;
    while (1)
    {
      memset(&eventlist, 0, sizeof(eventlist));
      int v30 = kevent(v21, 0LL, 0, &eventlist, 1, &timeout);
      if (v55 != -1)
      {
        state64 = 0LL;
        notify_get_state(v55, &state64);
        if (state64 == 4)
        {
          if ((a1->options & 2) != 0) {
            puts(";; cancelled");
          }
          v43 = 1;
          goto LABEL_85;
        }
      }

      if ((v30 & 0x80000000) == 0) {
        break;
      }
      if (*__error() != 4)
      {
        v43 = 0;
        v44 = 3;
LABEL_84:
        *MEMORY[0x1895FB758] = v44;
        goto LABEL_85;
      }

LABEL_15:
      v2->additional = (dns_resource_record_t **)calloc((unsigned __int16)v5[5], 8uLL);
      if (v5[5])
      {
        uint64_t v13 = 0LL;
        while (1)
        {
          v2->additional[v13] = _dns_parse_resource_record_internal((uint64_t)buf, (unint64_t *)&v19, &v18);
          if (!v2->additional[v13]) {
            break;
          }
        }

        LOWORD(v10) = v13 - 1;
        if (!v13) {
          LOWORD(v10) = 0;
        }
LABEL_31:
        v5[5] = (_WORD)v10;
        dns_free_reply(v2);
        return 0LL;
      }
    }
  }

  return v2;
}

      *__error() = 40;
      return -11;
    }

    char v53 = (unint64_t)a10 >> 16;
    char v54 = (unint64_t)a10 >> 8;
    v41 = (unint64_t)a10 >> 24;
    unsigned int v55 = a10;
    res_9_dst_sign_data(1, (uint64_t)a5, (uint64_t)v63, 0LL, 0LL, 0LL);
    unsigned int v42 = a9;
    if (a6 && (int)v13 >= 1)
    {
      v62 = bswap32(v13) >> 16;
      res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)&v62, 2LL, 0LL);
      res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)a6, v13, 0LL);
    }

    res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)a1, *a2, 0LL);
    v43 = res_9_ns_name_ntol(v22, v64, 0x401uLL);
    res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)v64, v43, 0LL);
    *(_WORD *)v64 = -256;
    v65 = 0;
    res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)v64, 6LL, 0LL);
    v44 = res_9_ns_name_ntol(v34, v64, 0x401uLL);
    res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)v64, v44, 0LL);
    *(_WORD *)v64 = 0;
    LOBYTE(v65) = v41;
    BYTE1(v65) = v53;
    BYTE2(v65) = v54;
    HIBYTE(v65) = v55;
    v66 = 11265;
    in_addr_t v45 = v61;
    v67 = BYTE1(v61);
    v68 = v61;
    if (v61 == 18)
    {
      v71 = 0;
      v72 = HIBYTE(v56);
      v73 = BYTE2(v56);
      v74 = BYTE1(v56);
      in_addr_t v46 = (__int16 *)v76;
      in_addr_t v47 = 6;
      v75 = v56;
    }

    else
    {
      in_addr_t v47 = 0;
      in_addr_t v46 = &v71;
    }

    v69 = 0;
    v70 = v47;
    res_9_dst_sign_data(2, (uint64_t)a5, (uint64_t)v63, (uint64_t)v64, v46 - v64, 0LL);
    uint64_t v48 = res_9_dst_sign_data(4, (uint64_t)a5, (uint64_t)v63, 0LL, 0LL, (uint64_t)a8);
    if ((v48 & 0x80000000) == 0)
    {
      *a9 = v48;
      v39 = v59;
      goto LABEL_37;
    }

    return -17;
  }

  return result;
}

void dns_free_reply(dns_reply_t *r)
{
  if (r)
  {
    header = r->header;
    if (header)
    {
      if (header->qdcount)
      {
        unint64_t v3 = 0LL;
        do
        {
          free(r->question[v3]->name);
          free(r->question[v3++]);
          header = r->header;
        }

        while (v3 < header->qdcount);
      }

      if (header->ancount)
      {
        unint64_t v4 = 0LL;
        do
        {
          dns_free_resource_record(r->answer[v4++]);
          header = r->header;
        }

        while (v4 < header->ancount);
      }

      if (header->nscount)
      {
        unint64_t v5 = 0LL;
        do
        {
          dns_free_resource_record(r->authority[v5++]);
          header = r->header;
        }

        while (v5 < header->nscount);
      }

      if (header->arcount)
      {
        unint64_t v6 = 0LL;
        do
        {
          dns_free_resource_record(r->additional[v6++]);
          header = r->header;
        }

        while (v6 < header->arcount);
      }

      free(header);
    }

    question = r->question;
    if (question) {
      free(question);
    }
    answer = r->answer;
    if (answer) {
      free(answer);
    }
    authority = r->authority;
    if (authority) {
      free(authority);
    }
    additional = r->additional;
    if (additional) {
      free(additional);
    }
    server = r->server;
    if (server) {
      free(server);
    }
    free(r);
  }

void dns_free_resource_record(dns_resource_record_t *rr)
{
  switch(rr->dnstype)
  {
    case 0u:
      break;
    case 1u:
    case 0x1Cu:
    case 0x1Du:
      A = rr->data.A;
      if (A) {
        goto LABEL_11;
      }
      break;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 7u:
    case 8u:
    case 9u:
    case 0xCu:
    case 0x13u:
      A = rr->data.A;
      if (A)
      {
        unint64_t v3 = *(void **)&A->addr.s_addr;
        if (*(void *)&A->addr.s_addr) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }

      break;
    case 6u:
    case 0xDu:
    case 0xEu:
    case 0x11u:
    case 0x14u:
      A = rr->data.A;
      if (A)
      {
        if (*(void *)&A->addr.s_addr)
        {
          free(*(void **)&A->addr.s_addr);
          A = rr->data.A;
        }

        goto LABEL_9;
      }

      break;
    case 0xBu:
      A = rr->data.A;
      if (A)
      {
        unint64_t v3 = *(void **)&A[4].addr.s_addr;
        if (v3) {
          goto LABEL_10;
        }
        goto LABEL_11;
      }

      break;
    case 0x10u:
      A = rr->data.A;
      if (A)
      {
        if (A->addr.s_addr)
        {
          unint64_t v4 = 0LL;
          do
          {
            free(*(void **)(*(void *)&A[2].addr.s_addr + 8 * v4++));
            A = rr->data.A;
          }

          while (v4 < A->addr.s_addr);
        }

        goto LABEL_9;
      }

      break;
    default:
      A = rr->data.A;
      if (A)
      {
LABEL_9:
        unint64_t v3 = *(void **)&A[2].addr.s_addr;
        if (v3)
        {
LABEL_10:
          free(v3);
          A = rr->data.A;
        }

void dns_free_question(dns_question_t *q)
{
  if (q)
  {
    name = q->name;
    if (name) {
      free(name);
    }
    free(q);
  }

void dns_set_buffer_size(dns_handle_t d, uint32_t len)
{
  if (d && *((_DWORD *)d + 8) != len)
  {
    unint64_t v4 = (void *)*((void *)d + 3);
    if (v4)
    {
      free(v4);
      *((void *)d + 3) = 0LL;
    }

    if (len >= 0x10000) {
      size_t v5 = 0x10000LL;
    }
    else {
      size_t v5 = len;
    }
    *((_DWORD *)d + 8) = v5;
    if ((_DWORD)v5) {
      *((void *)d + 3) = malloc(v5);
    }
  }

uint32_t dns_get_buffer_size(dns_handle_t d)
{
  if (d) {
    LODWORD(d) = *((_DWORD *)d + 8);
  }
  return d;
}

dns_reply_t *__cdecl dns_lookup(dns_handle_t dns, const char *name, uint32_t dnsclass, uint32_t dnstype)
{
  uint64_t result = 0LL;
  if (dns && name)
  {
    int v13 = -1;
    if (*((void *)dns + 3)) {
      goto LABEL_7;
    }
    unsigned int v9 = *((_DWORD *)dns + 8);
    if (!v9)
    {
      unsigned int v9 = 0x2000;
      *((_DWORD *)dns + 8) = 0x2000;
    }

    uint64_t result = (dns_reply_t *)malloc(v9);
    *((void *)dns + 3) = result;
    if (result)
    {
LABEL_7:
      int v14 = 128;
      unsigned int v10 = (sockaddr *)calloc(1uLL, 0x80uLL);
      time_t v11 = *((void *)dns + 1);
      if (*(_DWORD *)dns)
      {
        signed int v12 = _pdns_search( v11,  *((void *)dns + 2),  (char *)name,  dnsclass,  dnstype,  *((u_char **)dns + 3),  *((_DWORD *)dns + 8),  (int)v10,  (uint64_t)&v14);
      }

      else
      {
        _check_cache(v11);
        signed int v12 = _sdns_search( *((void *)dns + 1),  name,  dnsclass,  dnstype,  0LL,  1,  *((u_char **)dns + 3),  *((_DWORD *)dns + 8),  (uint64_t)v10,  &v14,  &v13);
      }

      if (v12 > 0 && (uint64_t result = dns_parse_packet(*((const char **)dns + 3), v12)) != 0LL)
      {
        result->server = v10;
      }

      else
      {
        free(v10);
        return 0LL;
      }
    }
  }

  return result;
}

const char *__cdecl dns_type_string(uint16_t dnstype)
{
  int v1 = dnstype - 1;
  uint64_t result = "A    ";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "NS   ";
      break;
    case 2:
      uint64_t result = "MD   ";
      break;
    case 3:
      uint64_t result = "MF   ";
      break;
    case 4:
      uint64_t result = "CNAME";
      break;
    case 5:
      uint64_t result = "SOA  ";
      break;
    case 6:
      uint64_t result = "MB  ";
      break;
    case 7:
      uint64_t result = "MG   ";
      break;
    case 8:
      uint64_t result = "MR   ";
      break;
    case 9:
      uint64_t result = "NULL ";
      break;
    case 10:
      uint64_t result = "WKS  ";
      break;
    case 11:
      uint64_t result = "PTR  ";
      break;
    case 12:
      uint64_t result = "HINFO";
      break;
    case 13:
      uint64_t result = "MINFO";
      break;
    case 14:
      uint64_t result = "MX   ";
      break;
    case 15:
      uint64_t result = "TXT  ";
      break;
    case 16:
      uint64_t result = "PR   ";
      break;
    case 17:
      uint64_t result = "AFSDB";
      break;
    case 18:
      uint64_t result = "X25  ";
      break;
    case 19:
      uint64_t result = "ISDN ";
      break;
    case 20:
      uint64_t result = "RT   ";
      break;
    case 21:
      uint64_t result = "NSAP ";
      break;
    case 22:
      uint64_t result = "NSPTR";
      break;
    case 23:
      uint64_t result = "SIG  ";
      break;
    case 24:
      uint64_t result = "KEY  ";
      break;
    case 25:
      uint64_t result = "PX   ";
      break;
    case 26:
      uint64_t result = "GPOS ";
      break;
    case 27:
      uint64_t result = "AAAA ";
      break;
    case 28:
      uint64_t result = "LOC  ";
      break;
    case 29:
      uint64_t result = "NXT  ";
      break;
    case 30:
      uint64_t result = "EID  ";
      break;
    case 31:
      uint64_t result = "NIMLC";
      break;
    case 32:
      uint64_t result = "SRV  ";
      break;
    case 33:
      uint64_t result = "ATMA ";
      break;
    case 34:
      uint64_t result = "NAPTR";
      break;
    case 35:
      uint64_t result = "KX   ";
      break;
    case 36:
      uint64_t result = "CERT ";
      break;
    case 37:
      uint64_t result = "A6   ";
      break;
    case 38:
      uint64_t result = "DNAME";
      break;
    case 39:
      uint64_t result = "SINK ";
      break;
    case 40:
      uint64_t result = "OPT  ";
      break;
    default:
      switch("A    ")
      {
        case 0xF9u:
          uint64_t result = "TKEY ";
          break;
        case 0xFAu:
          uint64_t result = "TSIG ";
          break;
        case 0xFBu:
          uint64_t result = "IXFR ";
          break;
        case 0xFCu:
          uint64_t result = "AXFR ";
          break;
        case 0xFDu:
          uint64_t result = "MAILB";
          break;
        case 0xFEu:
          uint64_t result = "MAILA";
          break;
        case 0xFFu:
          uint64_t result = "ANY  ";
          break;
        case 0x100u:
          uint64_t result = "ZXFR ";
          break;
        default:
          uint64_t result = "?????";
          break;
      }

      break;
  }

  return result;
}

int32_t dns_type_number(const char *t, uint16_t *n)
{
  if (!t) {
    return -1;
  }
  if (!strcasecmp(t, "A"))
  {
    uint16_t v5 = 1;
  }

  else if (!strcasecmp(t, "NS"))
  {
    uint16_t v5 = 2;
  }

  else if (!strcasecmp(t, "MD"))
  {
    uint16_t v5 = 3;
  }

  else if (!strcasecmp(t, "MF"))
  {
    uint16_t v5 = 4;
  }

  else if (!strcasecmp(t, "CNAME"))
  {
    uint16_t v5 = 5;
  }

  else if (!strcasecmp(t, "SOA"))
  {
    uint16_t v5 = 6;
  }

  else if (!strcasecmp(t, "MB"))
  {
    uint16_t v5 = 7;
  }

  else if (!strcasecmp(t, "MG"))
  {
    uint16_t v5 = 8;
  }

  else if (!strcasecmp(t, "MR"))
  {
    uint16_t v5 = 9;
  }

  else if (!strcasecmp(t, "NULL"))
  {
    uint16_t v5 = 10;
  }

  else if (!strcasecmp(t, "WKS"))
  {
    uint16_t v5 = 11;
  }

  else if (!strcasecmp(t, "PTR"))
  {
    uint16_t v5 = 12;
  }

  else if (!strcasecmp(t, "HINFO"))
  {
    uint16_t v5 = 13;
  }

  else if (!strcasecmp(t, "MINFO"))
  {
    uint16_t v5 = 14;
  }

  else if (!strcasecmp(t, "MX"))
  {
    uint16_t v5 = 15;
  }

  else if (!strcasecmp(t, "TXT"))
  {
    uint16_t v5 = 16;
  }

  else if (!strcasecmp(t, "RP"))
  {
    uint16_t v5 = 17;
  }

  else if (!strcasecmp(t, "AFSDB"))
  {
    uint16_t v5 = 18;
  }

  else if (!strcasecmp(t, "X25"))
  {
    uint16_t v5 = 19;
  }

  else if (!strcasecmp(t, "ISDN"))
  {
    uint16_t v5 = 20;
  }

  else if (!strcasecmp(t, "RT"))
  {
    uint16_t v5 = 21;
  }

  else if (!strcasecmp(t, "NSAP"))
  {
    uint16_t v5 = 22;
  }

  else if (!strcasecmp(t, "NSPTR") || !strcasecmp(t, "NSAP_PTR"))
  {
    uint16_t v5 = 23;
  }

  else if (!strcasecmp(t, "SIG"))
  {
    uint16_t v5 = 24;
  }

  else if (!strcasecmp(t, "KEY"))
  {
    uint16_t v5 = 25;
  }

  else if (!strcasecmp(t, "PX"))
  {
    uint16_t v5 = 26;
  }

  else if (!strcasecmp(t, "GPOS"))
  {
    uint16_t v5 = 27;
  }

  else if (!strcasecmp(t, "AAAA"))
  {
    uint16_t v5 = 28;
  }

  else if (!strcasecmp(t, "LOC"))
  {
    uint16_t v5 = 29;
  }

  else if (!strcasecmp(t, "NXT"))
  {
    uint16_t v5 = 30;
  }

  else if (!strcasecmp(t, "EID"))
  {
    uint16_t v5 = 31;
  }

  else if (!strcasecmp(t, "NIMLOC"))
  {
    uint16_t v5 = 32;
  }

  else if (!strcasecmp(t, "SRV"))
  {
    uint16_t v5 = 33;
  }

  else if (!strcasecmp(t, "ATMA"))
  {
    uint16_t v5 = 34;
  }

  else if (!strcasecmp(t, "NAPTR"))
  {
    uint16_t v5 = 35;
  }

  else if (!strcasecmp(t, "KX"))
  {
    uint16_t v5 = 36;
  }

  else if (!strcasecmp(t, "CERT"))
  {
    uint16_t v5 = 37;
  }

  else if (!strcasecmp(t, "A6"))
  {
    uint16_t v5 = 38;
  }

  else if (!strcasecmp(t, "DNAME"))
  {
    uint16_t v5 = 39;
  }

  else if (!strcasecmp(t, "SINK"))
  {
    uint16_t v5 = 40;
  }

  else if (!strcasecmp(t, "OPT"))
  {
    uint16_t v5 = 41;
  }

  else if (!strcasecmp(t, "TKEY"))
  {
    uint16_t v5 = 249;
  }

  else if (!strcasecmp(t, "TSIG"))
  {
    uint16_t v5 = 250;
  }

  else if (!strcasecmp(t, "IXFR"))
  {
    uint16_t v5 = 251;
  }

  else if (!strcasecmp(t, "AXFR"))
  {
    uint16_t v5 = 252;
  }

  else if (!strcasecmp(t, "MAILB"))
  {
    uint16_t v5 = 253;
  }

  else if (!strcasecmp(t, "MAILA"))
  {
    uint16_t v5 = 254;
  }

  else if (!strcasecmp(t, "ANY"))
  {
    uint16_t v5 = 255;
  }

  else
  {
    if (strcasecmp(t, "ZXFR")) {
      return -1;
    }
    uint16_t v5 = 256;
  }

  int32_t result = 0;
  *n = v5;
  return result;
}

const char *__cdecl dns_class_string(uint16_t dnsclass)
{
  int v1 = dnsclass - 1;
  int32_t result = "IN";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      int32_t result = "CS";
      break;
    case 2:
      int32_t result = "CH";
      break;
    case 3:
      int32_t result = "HS";
      break;
    default:
      unint64_t v3 = "ANY";
      else {
        int32_t result = v3;
      }
      break;
  }

  return result;
}

int32_t dns_class_number(const char *c, uint16_t *n)
{
  if (!c) {
    return -1;
  }
  if (!strcasecmp(c, "IN"))
  {
    uint16_t v5 = 1;
  }

  else if (!strcasecmp(c, "CS"))
  {
    uint16_t v5 = 2;
  }

  else if (!strcasecmp(c, "CH"))
  {
    uint16_t v5 = 3;
  }

  else if (!strcasecmp(c, "HS"))
  {
    uint16_t v5 = 4;
  }

  else if (!strcasecmp(c, "NONE"))
  {
    uint16_t v5 = 254;
  }

  else
  {
    if (strcasecmp(c, "ANY")) {
      return -1;
    }
    uint16_t v5 = 255;
  }

  int32_t result = 0;
  *n = v5;
  return result;
}

void dns_print_question(const dns_question_t *q, FILE *f)
{
}

uint64_t _dns_print_question_lock(uint64_t a1, FILE *a2, int a3)
{
  if (a3)
  {
    pthread_mutex_lock(&_dnsPrintLock);
    uint16_t v5 = *(const char **)a1;
    unint64_t v6 = dns_class_string(*(_WORD *)(a1 + 10));
    size_t v7 = dns_type_string(*(_WORD *)(a1 + 8));
    fprintf(a2, "%s %s %s\n", v5, v6, v7);
    return pthread_mutex_unlock(&_dnsPrintLock);
  }

  else
  {
    unsigned int v9 = *(const char **)a1;
    unsigned int v10 = dns_class_string(*(_WORD *)(a1 + 10));
    time_t v11 = dns_type_string(*(_WORD *)(a1 + 8));
    return fprintf(a2, "%s %s %s\n", v9, v10, v11);
  }

void dns_print_resource_record(const dns_resource_record_t *r, FILE *f)
{
}

uint64_t _dns_print_resource_record_lock(uint64_t a1, FILE *a2, int a3)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  if (a3) {
    pthread_mutex_lock(&_dnsPrintLock);
  }
  unint64_t v6 = *(const char **)a1;
  size_t v7 = dns_class_string(*(_WORD *)(a1 + 10));
  unsigned int v8 = dns_type_string(*(_WORD *)(a1 + 8));
  fprintf(a2, "%s %s %s ", v6, v7, v8);
  fprintf(a2, "%u", *(_DWORD *)(a1 + 12));
  switch(*(_WORD *)(a1 + 8))
  {
    case 1:
      v9.uint64_t s_addr = **(_DWORD **)(a1 + 16);
      inet_ntoa(v9);
      goto LABEL_4;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 0xC:
    case 0x13:
      goto LABEL_4;
    case 6:
      fprintf(a2, " %s %s %u %u %u %u %u", **(void **)(a1 + 16));
      break;
    case 0xB:
      v16.uint64_t s_addr = **(_DWORD **)(a1 + 16);
      v17 = inet_ntoa(v16);
      fprintf(a2, " %s", v17);
      uint32_t v18 = getprotobynumber(*(unsigned __int8 *)(*(void *)(a1 + 16) + 4LL));
      if (v18)
      {
        p_p_name = (const char **)&v18->p_name;
        fprintf(a2, " %s", v18->p_name);
        uint64_t v20 = *(void *)(a1 + 16);
        if (*(_DWORD *)(v20 + 8))
        {
          unint64_t v21 = 0LL;
          do
          {
            if (*(_BYTE *)(*(void *)(v20 + 16) + v21))
            {
              if (getservbyport(v21, *p_p_name)) {
                fprintf(a2, " %s");
              }
              else {
                fprintf(a2, " %u");
              }
            }

            ++v21;
            uint64_t v20 = *(void *)(a1 + 16);
          }

          while (v21 < *(unsigned int *)(v20 + 8));
        }
      }

      else
      {
        fprintf(a2, " UNKNOWN PROTOCOL %u");
      }

      break;
    case 0xD:
    case 0xE:
    case 0x11:
      fprintf(a2, " %s %s");
      break;
    case 0xF:
    case 0x12:
      fprintf(a2, " %u %s");
      break;
    case 0x10:
      unsigned int v22 = *(unsigned int **)(a1 + 16);
      if (*v22)
      {
        unint64_t v23 = 0LL;
        do
        {
          fprintf(a2, " %s", *(const char **)(*((void *)v22 + 1) + 8 * v23++));
          unsigned int v22 = *(unsigned int **)(a1 + 16);
        }

        while (v23 < *v22);
      }

      break;
    case 0x14:
      fprintf(a2, " %s", **(const char ***)(a1 + 16));
      if (!*(void *)(*(void *)(a1 + 16) + 8LL)) {
        break;
      }
      goto LABEL_4;
    case 0x15:
      fprintf(a2, " %hu %s");
      break;
    case 0x1C:
      __int128 v29 = 0uLL;
      int v30 = 0;
      __int128 v29 = *(_OWORD *)*(void *)(a1 + 16);
      inet_ntop(30, &v29, v31, 0x40u);
LABEL_4:
      fprintf(a2, " %s");
      break;
    case 0x1D:
      coord_ntoa(*(_DWORD *)(*(void *)(a1 + 16) + 4LL), 1);
      fprintf(a2, " %s", coord_ntoa_buf);
      coord_ntoa(*(_DWORD *)(*(void *)(a1 + 16) + 8LL), 0);
      fprintf(a2, " %s", coord_ntoa_buf);
      int v24 = *(_DWORD *)(*(void *)(a1 + 16) + 12LL);
      BOOL v25 = v24 < 10000000;
      if (v24 >= 10000000) {
        int v26 = v24 - 10000000;
      }
      else {
        int v26 = 10000000 - v24;
      }
      if (v25) {
        int v27 = v26 / -100;
      }
      else {
        int v27 = v26 / 100;
      }
      __sprintf_chk(alt_ntoa_buf, 0, 0x80uLL, "%d.%.2d", v27, v26 % 100);
      fprintf(a2, " %sm", alt_ntoa_buf);
      precsize_ntoa(*(unsigned __int8 *)(*(void *)(a1 + 16) + 1LL));
      fprintf(a2, " %sm", precsize_ntoa_buf);
      precsize_ntoa(*(unsigned __int8 *)(*(void *)(a1 + 16) + 2LL));
      fprintf(a2, " %sm", precsize_ntoa_buf);
      precsize_ntoa(*(unsigned __int8 *)(*(void *)(a1 + 16) + 3LL));
      fprintf(a2, " %sm");
      break;
    case 0x21:
      fprintf(a2, " %hu %hu %hu %s");
      break;
    default:
      uint64_t v10 = **(unsigned __int16 **)(a1 + 16);
      fprintf(a2, " %u ", v10);
      if (v10)
      {
        for (uint64_t i = 0LL; i != v10; ++i)
          fprintf(a2, "%x", *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 16) + 8LL) + i));
      }

      fwrite(" (", 2uLL, 1uLL, a2);
      signed int v12 = *(_WORD **)(a1 + 16);
      uint64_t v13 = (unsigned __int16)*v12;
      if (*v12)
      {
        uint64_t v14 = 0LL;
        do
        {
          int v15 = *(char *)(*(void *)(*(void *)(a1 + 16) + 8LL) + v14);
          if (v15 < 0) {
            LOBYTE(v15) = 32;
          }
          fputc(v15, a2);
          ++v14;
        }

        while (v13 != v14);
      }

      fwrite(")\n", 2uLL, 1uLL, a2);
      break;
  }

  uint64_t result = fputc(10, a2);
  if (a3) {
    return pthread_mutex_unlock(&_dnsPrintLock);
  }
  return result;
}

void dns_print_reply(const dns_reply_t *r, FILE *f, uint16_t mask)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock(&_dnsPrintLock);
  if (r)
  {
    switch(r->status)
    {
      case 0u:
        header = r->header;
        if ((mask & 1) != 0)
        {
          fprintf(f, "Xid: %u\n", header->xid);
          if ((mask & 2) == 0)
          {
LABEL_5:
            if ((mask & 0x2000) == 0) {
              goto LABEL_6;
            }
            goto LABEL_26;
          }
        }

        else if ((mask & 2) == 0)
        {
          goto LABEL_5;
        }

        if ((header->flags & 0x8000u) != 0) {
          in_addr v9 = "QR: Reply\n";
        }
        else {
          in_addr v9 = "QR: Query\n";
        }
        fwrite(v9, 0xAuLL, 1uLL, f);
        if ((mask & 0x2000) == 0)
        {
LABEL_6:
          if ((mask & 4) == 0) {
            goto LABEL_7;
          }
LABEL_38:
          fwrite("Opcode: ", 8uLL, 1uLL, f);
          if ((header->flags & 0x7800) != 0)
          {
            fprintf(f, "Reserved (%hu)\n", (unsigned __int16)(header->flags & 0x7800) >> 11);
            if ((mask & 8) != 0) {
              goto LABEL_42;
            }
          }

          else
          {
            fwrite("Standard\n", 9uLL, 1uLL, f);
            if ((mask & 8) != 0) {
              goto LABEL_42;
            }
          }

LABEL_8:
          if ((mask & 0x10) == 0) {
            goto LABEL_9;
          }
          goto LABEL_46;
        }

  if (*(void *)a1)
  {
    **(_BYTE **)a1 = 0;
    free(*(void **)a1);
  }

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  free((void *)a1);
  return 0LL;
}

    name = res_9_sym_ntos_unname;
    __sprintf_chk(res_9_sym_ntos_unname, 0, 0x14uLL, "%d", a2);
    size_t v7 = 0;
    if (a3) {
      goto LABEL_9;
    }
    return name;
  }

LABEL_26:
        server = r->server;
        if (!server)
        {
          fwrite("Server: -nil-\n", 0xEuLL, 1uLL, f);
          if ((mask & 4) != 0) {
            goto LABEL_38;
          }
LABEL_7:
          if ((mask & 8) == 0) {
            goto LABEL_8;
          }
LABEL_42:
          if ((header->flags & 0x400) != 0)
          {
            uint32_t v18 = "AA: Authoritative\n";
            size_t v19 = 18LL;
          }

          else
          {
            uint32_t v18 = "AA: Non-Authoritative\n";
            size_t v19 = 22LL;
          }

          fwrite(v18, v19, 1uLL, f);
          if ((mask & 0x10) == 0)
          {
LABEL_9:
            if ((mask & 0x20) == 0) {
              goto LABEL_10;
            }
            goto LABEL_50;
          }

    ++v11;
  }

  while (v14 < &a1->dnsrch[6]);
  while (1)
  {
    unsigned int v16 = *v11;
    v136 = v16 > 0x20;
    v17 = (1LL << v16) & 0x100000601LL;
    if (!v136 && v17 != 0) {
      break;
    }
    ++v11;
  }

  *time_t v11 = 0;
  *uint64_t v14 = 0LL;
LABEL_115:
  uint64_t v48 = fopen("/etc/resolv.conf", "r");
  if (!v48)
  {
    char v54 = 53;
    goto LABEL_140;
  }

  unsigned int v49 = v48;
  if (!fgets(__str, 1024, v48))
  {
LABEL_137:
    char v54 = 53;
    goto LABEL_138;
  }

  while (1)
  {
    if (__str[0] != 35 && __str[0] != 59 && *(_DWORD *)__str == 1953656688)
    {
      unint64_t v50 = __str[4];
      if (__str[4] == 32 || __str[4] == 9) {
        break;
      }
    }

LABEL_50:
          if ((header->flags & 0x100) != 0)
          {
            unsigned int v22 = "RD: Recursion desired\n";
            size_t v23 = 22LL;
          }

          else
          {
            unsigned int v22 = "RD: No recursion desired\n";
            size_t v23 = 25LL;
          }

          fwrite(v22, v23, 1uLL, f);
          if ((mask & 0x40) == 0)
          {
LABEL_11:
            if ((mask & 0x100) == 0)
            {
LABEL_12:
              if ((mask & 0x200) != 0)
              {
LABEL_75:
                fprintf(f, "Question (%hu):\n", header->qdcount);
                if (header->qdcount)
                {
                  unint64_t v28 = 0LL;
                  do
                    _dns_print_question_lock((uint64_t)r->question[v28++], f, 0);
                  while (v28 < header->qdcount);
                }
              }

LABEL_78:
              if ((mask & 0x400) != 0)
              {
                fprintf(f, "Answer (%hu):\n", header->ancount);
                if (header->ancount)
                {
                  unint64_t v29 = 0LL;
                  do
                    _dns_print_resource_record_lock((uint64_t)r->answer[v29++], f, 0);
                  while (v29 < header->ancount);
                }
              }

              if ((mask & 0x800) != 0)
              {
                fprintf(f, "Authority (%hu):\n", header->nscount);
                if (header->nscount)
                {
                  unint64_t v30 = 0LL;
                  do
                    _dns_print_resource_record_lock((uint64_t)r->authority[v30++], f, 0);
                  while (v30 < header->nscount);
                }
              }

              if ((mask & 0x1000) != 0)
              {
                fprintf(f, "Additional records (%hu):\n", header->arcount);
                if (header->arcount)
                {
                  unint64_t v31 = 0LL;
                  do
                    _dns_print_resource_record_lock((uint64_t)r->additional[v31++], f, 0);
                  while (v31 < header->arcount);
                }
              }

              pthread_mutex_unlock(&_dnsPrintLock);
              return;
            }

LABEL_58:
            fwrite("Rcode: ", 7uLL, 1uLL, f);
            switch(header->flags & 0xF)
            {
              case 0:
                int v26 = "No error\n";
                size_t v27 = 9LL;
                goto LABEL_74;
              case 1:
                int v26 = "Format error \n";
                goto LABEL_70;
              case 2:
                int v26 = "Server failure\n";
                size_t v27 = 15LL;
                goto LABEL_74;
              case 3:
                int v26 = "Name error \n";
                goto LABEL_68;
              case 4:
                int v26 = "Not implemented\n";
                size_t v27 = 16LL;
                goto LABEL_74;
              case 5:
                int v26 = "Refused\n";
                size_t v27 = 8LL;
                goto LABEL_74;
              case 6:
                int v26 = "Name exists\n";
LABEL_68:
                size_t v27 = 12LL;
                goto LABEL_74;
              case 7:
                int v26 = "RR Set exists\n";
LABEL_70:
                size_t v27 = 14LL;
                goto LABEL_74;
              case 8:
                int v26 = "RR Set does not exist\n";
                size_t v27 = 22LL;
                goto LABEL_74;
              case 9:
                int v26 = "Not authoritative\n";
                size_t v27 = 18LL;
                goto LABEL_74;
              case 0xA:
                int v26 = "Record zone does not match section zone\n";
                size_t v27 = 40LL;
LABEL_74:
                fwrite(v26, v27, 1uLL, f);
                if ((mask & 0x200) != 0) {
                  goto LABEL_75;
                }
                goto LABEL_78;
              default:
                fprintf(f, "Reserved (%hu)\n", header->flags & 0xF);
                if ((mask & 0x200) != 0) {
                  goto LABEL_75;
                }
                goto LABEL_78;
            }
          }

        int v34 = (__res_9_state *)a1;
        goto LABEL_63;
      }

      goto LABEL_34;
    }

LABEL_54:
          if ((header->flags & 0x80) != 0)
          {
            int v24 = "RA: Recursion available\n";
            size_t v25 = 24LL;
          }

          else
          {
            int v24 = "RA: No recursion available \n";
            size_t v25 = 28LL;
          }

          fwrite(v24, v25, 1uLL, f);
          if ((mask & 0x100) == 0) {
            goto LABEL_12;
          }
          goto LABEL_58;
        }

        int sa_family = server->sa_family;
        uint64_t v12 = 4LL;
        if (sa_family == 30) {
          uint64_t v12 = 8LL;
        }
        uint64_t v13 = inet_ntop(sa_family, &server->sa_len + v12, v32, 0x400u);
        fprintf(f, "Server: %s", v13);
        uint64_t v14 = r->server;
        int v15 = v14->sa_family;
        if (v15 == 30)
        {
          unsigned int v16 = *(_DWORD *)&v14[1].sa_data[6];
          if (!v16) {
            goto LABEL_37;
          }
        }

        else if (v15 != 2 || (unsigned int v16 = *(_DWORD *)&v14->sa_data[6]) == 0)
        {
LABEL_37:
          fputc(10, f);
          if ((mask & 4) != 0) {
            goto LABEL_38;
          }
          goto LABEL_7;
        }

        v17 = if_indextoname(v16, v32);
        fprintf(f, "%%%s", v17);
        goto LABEL_37;
      case 3u:
        size_t v7 = "Timeout\n";
        size_t v8 = 8LL;
        goto LABEL_19;
      case 4u:
        size_t v7 = "Send failed\n";
        size_t v8 = 12LL;
        goto LABEL_19;
      case 5u:
        size_t v7 = "Receive failed\n";
        size_t v8 = 15LL;
        goto LABEL_19;
      default:
        fprintf(f, "status %u\n", r->status);
        goto LABEL_20;
    }
  }

  size_t v7 = "-nil-\n";
  size_t v8 = 6LL;
LABEL_19:
  fwrite(v7, v8, 1uLL, f);
LABEL_20:
  pthread_mutex_unlock(&_dnsPrintLock);
}

void dns_print_handle(dns_handle_t d, FILE *f)
{
  if (!d) {
    goto LABEL_9;
  }
  if (*(_DWORD *)d)
  {
    _pdns_print_handle(*((void *)d + 2), f);
    goto LABEL_10;
  }

  uint64_t v4 = *((void *)d + 1);
  if (!v4)
  {
LABEL_9:
    fwrite("-nil-\n", 6uLL, 1uLL, f);
    goto LABEL_10;
  }

  if (*(_DWORD *)(v4 + 8))
  {
    unint64_t v5 = 0LL;
    do
    {
      fprintf(f, "DNS client %d\n", v5);
      _pdns_print_handle(*(void *)(*(void *)(v4 + 16) + 8 * v5), f);
      fputc(10, f);
      ++v5;
    }

    while (v5 < *(unsigned int *)(v4 + 8));
  }

  fprintf(f, "resolver dir mod time = %u\n", *(_DWORD *)(v4 + 24));
  fprintf(f, "resolver dir stat time = %u\n", *(_DWORD *)(v4 + 28));
  fprintf(f, "resolver dir stat latency = %u\n", *(_DWORD *)(v4 + 32));
LABEL_10:
  pthread_mutex_unlock(&_dnsPrintLock);
}

uint64_t _pdns_print_handle(uint64_t a1, FILE *__stream)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (!a1) {
    return fwrite("-nil-\n", 6uLL, 1uLL, __stream);
  }
  if (*(void *)(a1 + 16)) {
    fprintf(__stream, "Name: %s\n", *(const char **)(a1 + 16));
  }
  else {
    fwrite("Name: -nil-\n", 0xCuLL, 1uLL, __stream);
  }
  fwrite("Flags:", 6uLL, 1uLL, __stream);
  int v5 = *(_DWORD *)(a1 + 44);
  if (v5)
  {
    if ((v5 & 1) != 0)
    {
      fwrite(" Debug", 6uLL, 1uLL, __stream);
      int v5 = *(_DWORD *)(a1 + 44);
      if ((v5 & 2) == 0)
      {
LABEL_9:
        if ((v5 & 4) == 0) {
          goto LABEL_10;
        }
        goto LABEL_38;
      }
    }

    else if ((v5 & 2) == 0)
    {
      goto LABEL_9;
    }

    fwrite(" DirCheck", 9uLL, 1uLL, __stream);
    int v5 = *(_DWORD *)(a1 + 44);
    if ((v5 & 4) == 0)
    {
LABEL_10:
      if ((v5 & 8) == 0) {
        goto LABEL_11;
      }
      goto LABEL_39;
    }

LABEL_38:
    fwrite(" IPv6", 5uLL, 1uLL, __stream);
    int v5 = *(_DWORD *)(a1 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_11:
      if ((v5 & 0x10) == 0)
      {
LABEL_13:
        uint64_t result = fputc(10, __stream);
        goto LABEL_15;
      }

      ++v21;
      in_addr v18 = 40;
    }

    if (v28)
    {
      unsigned int v35 = v25;
      char v36 = v26;
      if (v27)
      {
        unint64_t v30 = v24;
        unint64_t v31 = strtol(v27, &__endptr, 10);
        if (*__endptr == 93)
        {
          int v24 = v30;
          size_t v25 = v35;
          int v26 = v36;
          goto LABEL_53;
        }
      }
  }

  int v24 = (char *)malloc(0x90uLL);
  if (v24)
  {
    *(void *)int v24 = -1LL;
    *((void *)v24 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = -1LL;
    *((_OWORD *)v24 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0u;
    *((_OWORD *)v24 + 2) = 0u;
    *((_OWORD *)v24 + 3) = 0u;
    *((_OWORD *)v24 + 4) = 0u;
    *((_OWORD *)v24 + 5) = 0u;
    *((_OWORD *)v24 + 6) = 0u;
    *((_OWORD *)v24 + 7) = 0u;
    *((_OWORD *)v24 + 8) = 0u;
    if (type == 28)
    {
      v24[17] = 30;
      *(_OWORD *)(v24 + 24) = *(_OWORD *)v40.rdata;
      *((_WORD *)v24 + 9) = 13568;
      *(_DWORD *)(a7 + 28) = 1;
    }

    else
    {
      if (type != 1) {
        abort();
      }
      v24[17] = 2;
      *((_DWORD *)v24 + 5) = *(_DWORD *)v40.rdata;
      *((_WORD *)v24 + 9) = 13568;
      *(_DWORD *)(a7 + 24) = 1;
    }

    size_t v25 = *(void *)(a7 + 40);
    int v26 = (void *)(v25 + 8);
    if (!v25) {
      int v26 = v39;
    }
    *int v26 = v24;
    *(void *)int v24 = v25;
    *((void *)v24 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0LL;
    *(void *)(a7 + 40) = v24;
    goto LABEL_38;
  }

  unint64_t v28 = *__error();
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    char v36 = "save_a: malloc failed";
LABEL_42:
    res_dprintf(v36, v29, v30, v31, v32, v33, v34, v35, v37);
  }

LABEL_12:
      fwrite(" Default", 8uLL, 1uLL, __stream);
      goto LABEL_13;
    }

    uint64_t result = 0;
    *(_WORD *)&a2[v8] = 46;
  }

  else
  {
    *__error() = 40;
    return -1;
  }

  return result;
}

  unsigned int v22 = res_9_hostalias_2((const res_9_state)a1, a2, v49, 0x401uLL);
  if (v22)
  {
    in_addr_t v47 = 128;
    uint64_t v48 = 0;
    return res_nquery_soa_min((__res_9_state *)a1, v22, a3, a4, a5, a6, (int)&v50, (int)&v47, &v48);
  }

  v17 = 0;
  uint64_t v21 = 1;
LABEL_15:
  int v24 = v17 >= (*(_BYTE *)(a1 + 392) & 0xFu) || v20;
  if (v24 != 1)
  {
    int v26 = -1;
    if (!v21)
    {
LABEL_24:
      if (v20)
      {
        if (v26 == -1) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_60;
      }

      if ((*(_BYTE *)(a1 + 9) & 2) == 0) {
        goto LABEL_53;
      }
      goto LABEL_31;
    }

  uint64_t v21 = res_9_hostalias_2((const res_9_state)a1, a2, v43, 0x401uLL);
  if (v21)
  {
    v41 = 128;
    unsigned int v42 = 0;
    return res_nquery_soa_min((__res_9_state *)a1, v21, a3, a4, a5, a6, (int)v44, (int)&v41, &v42);
  }

  in_addr v16 = 0;
  uint64_t v20 = 1;
LABEL_15:
  size_t v23 = v16 >= (*(_BYTE *)(a1 + 392) & 0xFu) || v19;
  if (v23 == 1)
  {
    unsigned int v42 = 128;
    uint64_t result = res_nquerydomain_2(a1, a2, 0LL, a3, a4, a5, a6, (int)v44, (int)&v42);
    int v24 = (int)result > 0 || v19;
    if ((v24 & 1) != 0) {
      return result;
    }
    size_t v25 = *MEMORY[0x1895FB758];
  }

  else
  {
    size_t v25 = -1;
  }

  int v26 = a9;
  if (v20)
  {
    char v36 = v25;
    v37 = v23;
    size_t v27 = 0;
    if ((*(_BYTE *)(a1 + 8) & 0x80) != 0)
    {
      unsigned int v35 = v20;
      unint64_t v28 = 0;
      unint64_t v29 = 0;
      if (a9 <= 0)
      {
LABEL_53:
        uint64_t v33 = v37;
        if (v27) {
          uint64_t v33 = 1;
        }
        if ((v33 & 1) == 0)
        {
LABEL_56:
          uint64_t result = res_nquerydomain_2(a1, a2, 0LL, a3, a4, a5, a6, a7, a8);
        }

LABEL_39:
    fwrite(" SkipAAAA", 9uLL, 1uLL, __stream);
    if ((*(_DWORD *)(a1 + 44) & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }

  uint64_t result = fwrite(" None\n", 6uLL, 1uLL, __stream);
LABEL_15:
  unint64_t v6 = *(_DWORD **)a1;
  if (*(void *)a1)
  {
    if (*((_BYTE *)v6 + 128)) {
      fprintf(__stream, "Domain: %s\n", (const char *)v6 + 128);
    }
    fprintf(__stream, "Search Order: %d\n", *(_DWORD *)(a1 + 56));
    fprintf(__stream, "Total Timeout: %d\n", *(_DWORD *)(a1 + 48));
    fprintf(__stream, "Retry Timeout: %d\n", **(_DWORD **)a1);
    fprintf(__stream, "Retry Attempts: %d\n", *(_DWORD *)(*(void *)a1 + 4LL));
    if (v6[4] == 1) {
      size_t v7 = (const char *)&unk_1874AA85D;
    }
    else {
      size_t v7 = "s";
    }
    uint64_t result = fprintf(__stream, "Server%s:\n", v7);
    if (v6[4])
    {
      unint64_t v8 = 0LL;
      do
      {
        uint64_t nsaddr = res_9_get_nsaddr((uint64_t)v6, v8);
        if (*(_BYTE *)(nsaddr + 1) == 30) {
          uint64_t v10 = 8LL;
        }
        else {
          uint64_t v10 = 4LL;
        }
        time_t v11 = inet_ntop(*(unsigned __int8 *)(nsaddr + 1), (const void *)(nsaddr + v10), v20, 0x400u);
        fprintf(__stream, "  %u: %s", v8, v11);
        uint64_t result = fputc(10, __stream);
        ++v8;
      }

      while (v8 < v6[4]);
    }

    if (*(_DWORD *)(a1 + 24))
    {
      uint64_t result = fwrite("Search List:\n", 0xDuLL, 1uLL, __stream);
      if (*(_DWORD *)(a1 + 24))
      {
        unint64_t v12 = 0LL;
        do
        {
          uint64_t result = fprintf(__stream, "  %u: %s\n", v12, *(const char **)(*(void *)(a1 + 32) + 8 * v12));
          ++v12;
        }

        while (v12 < *(unsigned int *)(a1 + 24));
      }
    }

    if (v6[99])
    {
      uint64_t v13 = v6 + 99;
      uint64_t result = fwrite("Sortlist:\n", 0xAuLL, 1uLL, __stream);
      if (v6[99])
      {
        uint64_t v14 = 0LL;
        int v15 = 0;
        do
        {
          fprintf(__stream, "  %u: ", v15);
          v16.uint64_t s_addr = *v13;
          v17 = inet_ntoa(v16);
          fprintf(__stream, "%s/", v17);
          v18.uint64_t s_addr = v6[2 * v14 + 100];
          size_t v19 = inet_ntoa(v18);
          uint64_t result = fprintf(__stream, "%s\n", v19);
          uint64_t v14 = (v15 + 1);
          uint64_t v13 = &v6[2 * v14 + 99];
          ++v15;
        }

        while (*v13);
      }
    }
  }

  return result;
}

                char v36 = &v22[v23];
                v37 = v36[1];
                unsigned int v22 = v36 + 1;
                size_t v23 = v37;
              }

              break;
            }
          }

          ++v20;
        }

        while (v20 < v5);
      }

      v38 = 2;
LABEL_43:
      *__error() = v38;
      uint64_t v21 = v16;
LABEL_44:
      if (a5 && v18 < v45 && v17 - v7 < 0x4000 && v21)
      {
        in_addr v16 = 0;
        *in_addr v18 = v17;
        v18[1] = 0LL;
        ++v18;
      }
    }

    if (v19 > 0xBF) {
      break;
    }
    v39 = *v6;
    if ((v39 & 0xC0) == 0xC0) {
      goto LABEL_56;
    }
    if ((v39 & 0xC0) == 0x40)
    {
      if (v39 == 65)
      {
        if (v6[1]) {
          v39 = ((v6[1] + 7) >> 3) + 1;
        }
        else {
          v39 = 33;
        }
        goto LABEL_57;
      }

      v8 -= 2;
      do
      {
        unint64_t v29 = v8[2];
        else {
          unint64_t v30 = *(_DWORD *)(v9 + 4 * v29 + 60) & 0x4000;
        }
        ++v8;
      }

      while (!v30);
      do
      {
        unint64_t v31 = v8[1];
        else {
          uint64_t v32 = *(_DWORD *)(v9 + 4 * v31 + 60) & 0x4000;
        }
        ++v8;
      }

      while (v32);
      goto LABEL_48;
    }
  }

  in_addr v18 = 0;
  uint64_t v21 = 0;
LABEL_48:
  uint64_t v33 = 0LL;
  int v34 = (char)*v8 - 69;
  if (v34 <= 0x32)
  {
    if (((1LL << v34) & 0x20100000201LL) != 0)
    {
      uint64_t v33 = v21 + 1000 * (v18 + 60 * (v13 + 60 * v6)) + 0x80000000;
    }

    else if (((1LL << v34) & 0x4400000044000LL) != 0)
    {
      uint64_t v33 = ((-1000 * (v18 + 60 * (v13 + 60 * v6))) ^ 0x80000000) - v21;
    }
  }

  if (v34 > 0x32) {
    goto LABEL_68;
  }
  if (((1LL << v34) & 0x420000004200LL) != 0)
  {
    unsigned int v35 = 1;
    goto LABEL_58;
  }

  if (((1LL << v34) & 0x4000100040001LL) == 0)
  {
LABEL_68:
    unsigned int v35 = 0;
    goto LABEL_58;
  }

  unsigned int v35 = 2;
LABEL_58:
  *a2 = v35;
  char v36 = v8 - 1;
  do
  {
    v37 = v36[2];
    else {
      v38 = *(_DWORD *)(v9 + 4 * v37 + 60) & 0x4000;
    }
    ++v36;
  }

  while (!v38);
  do
  {
    v39 = v36[1];
    else {
      v40 = *(_DWORD *)(v9 + 4 * v39 + 60) & 0x4000;
    }
    ++v36;
  }

  while (v40);
  *a1 = v36;
  return v33;
}

uint64_t dns_all_server_addrs(uint64_t dns, const void ***a2, int *a3)
{
  *a2 = 0LL;
  *a3 = 0;
  if (dns)
  {
    uint64_t v3 = dns;
    if (!*(_DWORD *)dns)
    {
      if (*(void *)(dns + 8))
      {
        dns = dns_search_list_count((dns_handle_t)dns);
        uint64_t v4 = *(void *)(v3 + 8);
        if (*(_DWORD *)(v4 + 8))
        {
          unint64_t v5 = 0LL;
          unint64_t v6 = 0LL;
          int v7 = 0;
          do
          {
            unint64_t v8 = *(uint64_t **)(*(void *)(v4 + 16) + 8 * v5);
            if (v8)
            {
              uint64_t v9 = *v8;
              if (*v8)
              {
                if (*(int *)(v9 + 16) >= 1)
                {
                  uint64_t v10 = 0LL;
                  do
                  {
                    uint64_t nsaddr = (unsigned __int8 *)res_9_get_nsaddr(v9, v10);
                    unint64_t v12 = nsaddr;
                    if (v7 < 1) {
                      goto LABEL_19;
                    }
                    unint64_t v13 = 0LL;
                    size_t v14 = *nsaddr;
                    do
                    {
                      dns = memcmp(v6[v13++], v12, v14);
                      if ((_DWORD)dns) {
                        BOOL v15 = v13 >= v7;
                      }
                      else {
                        BOOL v15 = 1;
                      }
                    }

                    while (!v15);
                    if ((_DWORD)dns)
                    {
LABEL_19:
                      if (v7) {
                        dns = (uint64_t)reallocf(v6, 8LL * (v7 + 1));
                      }
                      else {
                        dns = (uint64_t)calloc(1uLL, 8uLL);
                      }
                      unint64_t v6 = (const void **)dns;
                      if (!dns) {
                        return dns;
                      }
                      dns = (uint64_t)calloc(1uLL, 0x80uLL);
                      v6[v7] = (const void *)dns;
                      if (!dns) {
                        return dns;
                      }
                      *(_OWORD *)(dns + 96) = 0u;
                      *(_OWORD *)(dns + 112) = 0u;
                      *(_OWORD *)(dns + 64) = 0u;
                      *(_OWORD *)(dns + 80) = 0u;
                      *(_OWORD *)(dns + 32) = 0u;
                      *(_OWORD *)(dns + 48) = 0u;
                      *(_OWORD *)dns = 0u;
                      *(_OWORD *)(dns + 16) = 0u;
                      dns = (uint64_t)memcpy((void *)v6[v7++], v12, *v12);
                    }

                    ++v10;
                  }

                  while (v10 < *(int *)(v9 + 16));
                  uint64_t v4 = *(void *)(v3 + 8);
                }
              }
            }

            ++v5;
          }

          while (v5 < *(unsigned int *)(v4 + 8));
        }

        else
        {
          int v7 = 0;
          unint64_t v6 = 0LL;
        }

        *a2 = v6;
        *a3 = v7;
      }
    }
  }

  return dns;
}

_BYTE *_dns_parse_domain_name(uint64_t a1, unint64_t *a2, unsigned int *a3)
{
  unint64_t v3 = *a3;
  int v7 = (_BYTE *)*a2;
  uint64_t result = malloc(1uLL);
  if (result)
  {
    unint64_t v9 = (unint64_t)&v7[v3];
    *uint64_t result = 0;
    uint64_t v10 = (_WORD *)*a2;
    time_t v11 = (_BYTE *)(*a2 + 1);
    if (v11 > &v7[v3]) {
      goto LABEL_4;
    }
    size_t v25 = v7;
    int v26 = a3;
    int v12 = 0;
    uint64_t v13 = 0LL;
    int v14 = 0;
    int v15 = 1;
    while (1)
    {
      uint64_t v16 = *(unsigned __int8 *)v10;
      if ((~(_DWORD)v16 & 0xC0) != 0)
      {
        *a2 = (unint64_t)v11;
        if ((_DWORD)v16)
        {
          uint64_t v19 = v13;
          v15 += v16;
          uint64_t result = reallocf(result, (unsigned __int16)v15);
          if (!result) {
            return result;
          }
          time_t v11 = (_BYTE *)*a2;
          uint64_t v13 = v19;
        }

        if (!(_DWORD)v16)
        {
          result[(unsigned __int16)v12] = 0;
          unint64_t v24 = (unsigned __int16)(((_DWORD)v13 == 0) + (_WORD)v14);
          if (v24 <= v3)
          {
            *a2 = (unint64_t)&v25[v24];
            *v26 -= v24;
            return result;
          }

LABEL_4:
          free(result);
          return 0LL;
        }

        int v20 = 0;
        do
        {
          int v21 = v12;
          result[(unsigned __int16)v12++] = *v11;
          time_t v11 = (_BYTE *)(*a2 + 1);
          *a2 = (unint64_t)v11;
          ++v20;
        }

        while (v16 > (unsigned __int16)v20);
        result[(unsigned __int16)v12] = 0;
        if ((_DWORD)v13) {
          int v22 = 0;
        }
        else {
          int v22 = v16 + 1;
        }
        v14 += v22;
        if (*a2 + 1 > v9) {
          goto LABEL_4;
        }
        if (*(_BYTE *)*a2)
        {
          uint64_t v23 = v13;
          uint64_t result = reallocf(result, (unsigned __int16)++v15);
          if (!result) {
            return result;
          }
          result[(unsigned __int16)v12] = 46;
          int v12 = v21 + 2;
          result[(unsigned __int16)(v21 + 2)] = 0;
          uint64_t v13 = v23;
        }
      }

      else
      {
        unint64_t v17 = a1 + (bswap32(*v10 & 0xFF3F) >> 16);
        *a2 = v17;
        if (!(_DWORD)v13) {
          v14 += 2;
        }
        uint64_t v13 = 1LL;
      }

      uint64_t v10 = (_WORD *)*a2;
      time_t v11 = (_BYTE *)(*a2 + 1);
    }
  }

  return result;
}

void *_dns_parse_string(void *a1, int *a2)
{
  unsigned int v2 = *a2;
  int v3 = *a2 - 1;
  if (*a2 < 1) {
    return 0LL;
  }
  *a2 = v3;
  unint64_t v6 = (const void *)(*a1 + 1LL);
  size_t v5 = *(unsigned __int8 *)*a1;
  *a1 = v6;
  *a2 = v3 - v5;
  int v7 = malloc(v5 + 1);
  memmove(v7, v6, v5);
  *((_BYTE *)v7 + v5) = 0;
  *a1 += v5;
  return v7;
}

uint64_t coord_ntoa(int a1, int a2)
{
  signed int v2 = a1 ^ 0x80000000;
  BOOL v3 = a2 == 1;
  BOOL v4 = a1 >= 0;
  BOOL v5 = !v4 || !v3;
  if (v4 && v3) {
    signed int v6 = -v2;
  }
  else {
    signed int v6 = a1 ^ 0x80000000;
  }
  if (v5) {
    unsigned int v7 = 78;
  }
  else {
    unsigned int v7 = 83;
  }
  if (a1 >= 0) {
    signed int v2 = -v2;
  }
  if (v6 >= 0) {
    unsigned int v8 = 69;
  }
  else {
    unsigned int v8 = 87;
  }
  if (a2)
  {
    signed int v2 = v6;
    uint64_t v9 = v7;
  }

  else
  {
    uint64_t v9 = v8;
  }

  return __sprintf_chk( coord_ntoa_buf,  0,  0x40uLL,  "%d %.2d %.2d.%.3d %c",  v2 / 3600000,  v2 / 60000 % 60,  v2 / 1000 % 60,  v2 % 1000,  v9);
}

uint64_t precsize_ntoa(unsigned int a1)
{
  int v1 = a1 >> 4;
  if (a1 >= 0xA0) {
    int v1 = (a1 >> 4) - 10;
  }
  unsigned int v2 = a1 & 0xF;
  if (v2 >= 0xA) {
    unsigned int v2 = (a1 & 0xF) - 10;
  }
  unsigned int v3 = poweroften[v2] * v1;
  return __sprintf_chk(precsize_ntoa_buf, 0, 0x13uLL, "%ld.%.2ld", v3 / 0x64uLL, v3 % 0x64);
}

void _check_cache(uint64_t a1)
{
  if (!a1) {
    return;
  }
  if (*(_DWORD *)(a1 + 28))
  {
    int v2 = *(_DWORD *)(a1 + 40);
    if (v2 != -1)
    {
      int check = 1;
      if (!notify_check(v2, &check) && check != 1)
      {
        int v3 = *(_DWORD *)(a1 + 44);
        if (v3 != -1)
        {
          int check = 1;
          if (!notify_check(v3, &check) && check != 1) {
            return;
          }
        }
      }
    }
  }

  *(void *)a1 = 0LL;
  if (*(_DWORD *)(a1 + 8))
  {
    unint64_t v4 = 0LL;
    do
      _pdns_free(*(unsigned int **)(*(void *)(a1 + 16) + 8 * v4++));
    while (v4 < *(unsigned int *)(a1 + 8));
  }

  *(_DWORD *)(a1 + 8) = 0;
  BOOL v5 = *(void **)(a1 + 16);
  if (v5) {
    free(v5);
  }
  *(void *)(a1 + 16) = 0LL;
  uint64_t v6 = dns_configuration_copy();
  uint64_t v7 = v6;
  if (!v6 || (int v8 = *(_DWORD *)v6, *(int *)v6 < 1))
  {
    time_t v11 = _pdns_file_open("/etc/resolv.conf");
    int v8 = 0;
    *(void *)a1 = v11;
    if (v11) {
      goto LABEL_57;
    }
    goto LABEL_62;
  }

  uint64_t v9 = **(void **)(v6 + 4);
  if ((*(_BYTE *)(a1 + 36) & 0x20) != 0)
  {
    int v12 = (unsigned int *)_pdns_build_start(*(char **)v9);
    uint64_t v10 = v12;
    if (!*(void *)v9) {
      _pdns_build((uint64_t)v12, "default", 0LL);
    }
    uint64_t v13 = getenv("RES_RETRY_TIMEOUT");
    if (v13) {
      v10[13] = atoi(v13);
    }
    int v14 = getenv("RES_RETRY");
    if (v14) {
      *(_DWORD *)(*(void *)v10 + 4LL) = atoi(v14);
    }
    int v15 = *(_DWORD *)(v9 + 24);
    if (v15 < 7)
    {
      if (v15 < 1)
      {
LABEL_32:
        _pdns_build((uint64_t)v10, "mdns", 0LL);
        _pdns_build_finish(v10);
LABEL_34:
        int v8 = 1;
        goto LABEL_35;
      }
    }

    else
    {
      *(_DWORD *)(v9 + 24) = 6;
    }

    uint64_t v16 = 0LL;
    while (1)
    {
      in_addr_t v47 = 0LL;
      asprintf(&v47, "%s", *(const char **)(*(void *)(v9 + 28) + 8 * v16));
      if (!v47) {
        break;
      }
      _pdns_build((uint64_t)v10, "search", v47);
      free(v47);
    }

    _pdns_free(v10);
    uint64_t v10 = 0LL;
    goto LABEL_34;
  }

  uint64_t v10 = _pdns_convert_sc(**(void **)(v6 + 4));
LABEL_35:
  *(void *)a1 = v10;
  if (!v10) {
    goto LABEL_62;
  }
  unint64_t v17 = (const char *)*((void *)v10 + 2);
  if (!v17 || v10[6]) {
    goto LABEL_56;
  }
  int v18 = 0;
  for (uint64_t i = v17 - 1; i[1] == 46; ++i)
  {
    ++v18;
LABEL_43:
    ;
  }

  if (i[1]) {
    goto LABEL_43;
  }
  if (i >= v17)
  {
    if (*i == 46)
    {
      uint64_t v20 = 0LL;
      while (1)
      {
        i[v20] = 0;
        int v21 = &i[v20 - 1];
        unint64_t v17 = (const char *)*((void *)v10 + 2);
        if (v21 < v17) {
          break;
        }
        --v20;
        if (*v21 != 46)
        {
          v18 += v20;
          goto LABEL_50;
        }
      }
    }

    else
    {
LABEL_50:
      _pdns_build((uint64_t)v10, "search", v17);
      if (v18 >= 2)
      {
        int v22 = (const char *)*((void *)v10 + 2);
        int v23 = v18 + 1;
        while (*v22++)
        {
          if (*(v22 - 1) == 46)
          {
            _pdns_build((uint64_t)v10, "search", v22);
            if (v23-- <= 3) {
              break;
            }
          }
        }
      }
    }
  }

LABEL_56:
  time_t v11 = *(_DWORD **)a1;
  if (*(void *)a1)
  {
LABEL_57:
    int v25 = *(_DWORD *)(a1 + 36);
    if ((v25 & 1) != 0 && *(void *)v11) {
      *(void *)(*(void *)v11 + 8LL) |= 2uLL;
    }
    v11[11] |= v25 & 8 | 0x10;
    int v26 = calloc(1uLL, 8uLL);
    *(void *)(a1 + 16) = v26;
    if (!v26)
    {
      if (v7) {
        goto LABEL_97;
      }
      return;
    }

    uint64_t v27 = *(unsigned int *)(a1 + 8);
    v26[v27] = *(void *)a1;
    *(_DWORD *)(a1 + 8) = v27 + 1;
  }

      int v39 = -1;
    }

      gettimeofday(&v51, 0LL);
      unsigned int v35 = 1000LL * v51.tv_usec;
      timeout.tv_sec = v29 - v51.tv_sec;
      if ((int)v27 >= (int)v35)
      {
        timeout.tv_nsec = v27 - v35;
      }

      else
      {
        timeout.tv_sec = v29 - v51.tv_sec - 1;
        timeout.tv_nsec = v27 + 1000000000 - v35;
      }
    }

    if (!v30 && !*((_WORD *)a5 + 3))
    {
      int v43 = 0;
      v44 = 2;
      goto LABEL_84;
    }

    if (eventlist.udata == a2)
    {
      int v42 = v46;
      if ((a1->options & 2) != 0) {
        puts(";; cancelled");
      }
      int v43 = 1;
LABEL_86:
      if (v55 != -1) {
        notify_cancel(v55);
      }
      DNSServiceRefDeallocate(sdRef);
      close(v21);
      if (((*((_WORD *)a5 + 3) != 0) & ~v43) == 0) {
        unint64_t v57 = -1LL;
      }
      if (v47 && v42)
      {
        uint64_t v45 = HIDWORD(v59);
        if (HIDWORD(v59))
        {
          *(_WORD *)in_addr_t v47 = 7708;
          *(_BYTE *)(v47 + 23) = 1;
          *(_DWORD *)(v47 + 24) = v45;
          *int v42 = 28;
        }
      }

      return v57;
    }

    int v31 = DNSServiceProcessResult(sdRef);
    int v32 = v61;
    uint64_t v33 = (v31 | v61) == 0;
    if (!(v31 | v61))
    {
LABEL_46:
      if (!*((_WORD *)a5 + 3) || (v60 & 0x100000000LL) != 0)
      {
        if (!v33) {
          goto LABEL_82;
        }
      }

      else
      {
        if (!v33)
        {
LABEL_82:
          int v43 = 0;
LABEL_85:
          int v42 = v46;
          goto LABEL_86;
        }
      }

      goto LABEL_56;
    }

    if (v31) {
      int v32 = v31;
    }
    if (v32 > -65538)
    {
      if (!v32) {
        goto LABEL_45;
      }
      if (v32 == -65537)
      {
        int v32 = 3;
        goto LABEL_45;
      }
    }

    else
    {
      if (v32 == -65554)
      {
        int v32 = 4;
        goto LABEL_45;
      }

      if (v32 == -65538)
      {
        int v32 = 1;
LABEL_45:
        *MEMORY[0x1895FB758] = v32;
        goto LABEL_46;
      }
    }

    int v32 = -1;
    goto LABEL_45;
  }

  return result;
}

LABEL_62:
  if (v8 < 2)
  {
    if (v7) {
LABEL_77:
    }
      dns_configuration_free();
    if ((*(_BYTE *)(a1 + 36) & 2) != 0)
    {
      unsigned int v35 = opendir("/etc/resolver");
      if (v35)
      {
        char v36 = v35;
        while (1)
        {
          while (1)
          {
            v37 = readdir(v36);
            if (!v37)
            {
              closedir(v36);
              goto LABEL_99;
            }

            int v39 = v37->d_name[0];
            d_name = v37->d_name;
            if (v39 != 46)
            {
              v40 = _pdns_file_open(d_name);
              if (v40) {
                break;
              }
            }
          }

          v41 = v40;
          int v42 = *(_DWORD *)(a1 + 36);
          if ((v42 & 1) != 0) {
            *(void *)(*(void *)v40 + 8LL) |= 2uLL;
          }
          if ((v42 & 8) != 0) {
            v40[11] |= 8u;
          }
          int v43 = *(_DWORD *)(a1 + 8);
          v44 = v43 ? reallocf(*(void **)(a1 + 16), 8LL * (v43 + 1)) : calloc(1uLL, 8uLL);
          *(void *)(a1 + 16) = v44;
          if (!v44) {
            break;
          }
          uint64_t v45 = *(unsigned int *)(a1 + 8);
          v44[v45] = v41;
          *(_DWORD *)(a1 + 8) = v45 + 1;
        }

        *(_DWORD *)(a1 + 8) = 0;
        return;
      }

      *(_DWORD *)(a1 + 36) &= ~2u;
    }

  v108 = *__error();
  if ((a1->options & 2) != 0)
  {
    if (v100 < 0)
    {
      v109 = __error();
      strerror(*v109);
    }

    res_dprintf("FINISH n=%d (%s)", v101, v102, v103, v104, v105, v106, v107, v100);
  }

  *__error() = v108;
  while (v187[0])
    free_nsrr(v187, v187[0]);
  a1->pfcode = pfcode;
  return v100;
}

LABEL_99:
    *(_DWORD *)(a1 + 28) = 1;
    return;
  }

  uint64_t v28 = 8LL;
  while (2)
  {
    unint64_t v29 = _pdns_convert_sc(*(void *)(*(void *)(v7 + 4) + v28));
    if (!v29)
    {
LABEL_74:
      v28 += 8LL;
      continue;
    }

    break;
  }

  unint64_t v30 = v29;
  int v31 = *(_DWORD *)(a1 + 36);
  if ((v31 & 1) != 0) {
    *(void *)(*(void *)v29 + 8LL) |= 2uLL;
  }
  if ((v31 & 8) != 0) {
    v29[11] |= 8u;
  }
  int v32 = *(_DWORD *)(a1 + 8);
  if (v32) {
    uint64_t v33 = reallocf(*(void **)(a1 + 16), 8LL * (v32 + 1));
  }
  else {
    uint64_t v33 = calloc(1uLL, 8uLL);
  }
  *(void *)(a1 + 16) = v33;
  if (v33)
  {
    uint64_t v34 = *(unsigned int *)(a1 + 8);
    v33[v34] = v30;
    *(_DWORD *)(a1 + 8) = v34 + 1;
    goto LABEL_74;
  }

  *(_DWORD *)(a1 + 8) = 0;
LABEL_97:
  dns_configuration_free();
}

void _pdns_free(unsigned int *a1)
{
  if (a1)
  {
    if (a1[6] + 1 >= 2 && *((void *)a1 + 4))
    {
      unint64_t v2 = 0LL;
      do
        free(*(void **)(*((void *)a1 + 4) + 8 * v2++));
      while (v2 < a1[6]);
      free(*((void **)a1 + 4));
    }

    int v3 = (void *)*((void *)a1 + 2);
    if (v3) {
      free(v3);
    }
    if (*(void *)a1) {
      res_client_close(*(void **)a1);
    }
    free(a1);
  }

unsigned int *_pdns_convert_sc(uint64_t a1)
{
  unint64_t v2 = (unsigned int *)_pdns_build_start(*(char **)a1);
  int v3 = v2;
  if (!*(void *)a1) {
    _pdns_build((uint64_t)v2, "default", 0LL);
  }
  unint64_t v4 = getenv("RES_RETRY_TIMEOUT");
  if (v4) {
    v3[13] = atoi(v4);
  }
  BOOL v5 = (unsigned __int8 *)getenv("RES_RETRY");
  v38 = v5;
  if (v5) {
    *(_DWORD *)(*(void *)v3 + 4LL) = atoi((const char *)v5);
  }
  int v6 = *(unsigned __int16 *)(a1 + 20);
  if (*(_WORD *)(a1 + 20))
  {
    int v39 = 0LL;
    asprintf(&v39, "%hu", v6);
    if (!v39) {
      goto LABEL_34;
    }
    _pdns_build((uint64_t)v3, "port", v39);
    free(v39);
  }

  int v7 = *(_DWORD *)(a1 + 8);
  if (v7 >= 4)
  {
    *(_DWORD *)(a1 + 8) = 3;
LABEL_13:
    uint64_t v8 = 0LL;
    while (1)
    {
      int v9 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 12) + 8 * v8) + 1LL);
      if (v9 == 30) {
        break;
      }
      if (v9 == 2)
      {
        uint64_t v10 = (char *)calloc(1uLL, 0x100uLL);
        int v39 = v10;
        if (!v10) {
          goto LABEL_34;
        }
        time_t v11 = v10;
        int v12 = (const void *)(*(void *)(*(void *)(a1 + 12) + 8 * v8) + 4LL);
        int v13 = 2;
LABEL_20:
        inet_ntop(v13, v12, v11, 0x100u);
        _pdns_build((uint64_t)v3, "nameserver", v39);
        free(v39);
      }
    }

    v3[11] |= 4u;
    int v14 = (char *)calloc(1uLL, 0x100uLL);
    int v39 = v14;
    if (!v14) {
      goto LABEL_34;
    }
    time_t v11 = v14;
    int v12 = (const void *)(*(void *)(*(void *)(a1 + 12) + 8 * v8) + 8LL);
    int v13 = 30;
    goto LABEL_20;
  }

  if (v7 >= 1) {
    goto LABEL_13;
  }
LABEL_22:
  int v15 = *(_DWORD *)(a1 + 24);
  if (v15 >= 7)
  {
    *(_DWORD *)(a1 + 24) = 6;
    goto LABEL_25;
  }

  if (v15 >= 1)
  {
LABEL_25:
    uint64_t v16 = 0LL;
    do
    {
      int v39 = 0LL;
      asprintf(&v39, "%s", *(const char **)(*(void *)(a1 + 28) + 8 * v16));
      if (!v39) {
        goto LABEL_34;
      }
      _pdns_build((uint64_t)v3, "search", v39);
      free(v39);
    }

    while (++v16 < *(int *)(a1 + 24));
  }

  int v17 = *(_DWORD *)(a1 + 56);
  if (v17)
  {
    int v39 = 0LL;
    asprintf(&v39, "%d", v17);
    if (!v39) {
      goto LABEL_34;
    }
    _pdns_build((uint64_t)v3, "total_timeout", v39);
    free(v39);
  }

  int v39 = 0LL;
  asprintf(&v39, "%d", *(_DWORD *)(a1 + 60));
  if (v39)
  {
    _pdns_build((uint64_t)v3, "search_order", v39);
    free(v39);
    int v18 = *(_DWORD *)(a1 + 36);
    if (v18 < 11)
    {
      if (v18 < 1)
      {
LABEL_41:
        v38 = *(unsigned __int8 **)(a1 + 48);
        int v22 = res_next_word(&v38);
        if (!v22)
        {
LABEL_86:
          _pdns_build_finish(v3);
          return v3;
        }

        int v23 = v22;
        unint64_t v24 = "ndots";
        int v25 = "nibble";
        int v26 = "nibble2";
        uint64_t v27 = "timeout:";
        uint64_t v28 = "attempts:";
        while (1)
        {
          if (!strncmp((const char *)v23, "ndots:", 6uLL))
          {
            v37 = (char *)v23 + 6;
            uint64_t v35 = (uint64_t)v3;
            char v36 = (char *)v24;
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, "nibble:", 7uLL))
          {
            v37 = (char *)v23 + 7;
            uint64_t v35 = (uint64_t)v3;
            char v36 = (char *)v25;
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, "nibble2:", 8uLL))
          {
            v37 = (const char *)(v23 + 1);
            uint64_t v35 = (uint64_t)v3;
            char v36 = (char *)v26;
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, v27, 8uLL))
          {
            v37 = (const char *)(v23 + 1);
            uint64_t v35 = (uint64_t)v3;
            char v36 = "timeout";
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, v28, 9uLL))
          {
            v37 = (char *)v23 + 9;
            uint64_t v35 = (uint64_t)v3;
            char v36 = "attempts";
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, "bitstring:", 0xAuLL))
          {
            v37 = (char *)v23 + 10;
            uint64_t v35 = (uint64_t)v3;
            char v36 = "bitstring";
            goto LABEL_74;
          }

          if (!strncmp((const char *)v23, "v6revmode:", 0xAuLL))
          {
            v37 = (char *)v23 + 10;
            uint64_t v35 = (uint64_t)v3;
            char v36 = "v6revmode";
            goto LABEL_74;
          }

          unint64_t v29 = v24;
          unint64_t v30 = v27;
          int v31 = v25;
          int v32 = v28;
          uint64_t v33 = v26;
          uint64_t v34 = "debug";
          uint64_t v34 = "no_tld_query";
          int v26 = v33;
          if (!strcmp((const char *)v23, "inet6"))
          {
            _pdns_build((uint64_t)v3, "inet6", 0LL);
            goto LABEL_69;
          }

          uint64_t v28 = v32;
          if (!strcmp((const char *)v23, "rotate"))
          {
            _pdns_build((uint64_t)v3, "rotate", 0LL);
            goto LABEL_70;
          }

          int v25 = v31;
          if (!strcmp((const char *)v23, "no-check-names"))
          {
            _pdns_build((uint64_t)v3, "no-check-names", 0LL);
            goto LABEL_71;
          }

          uint64_t v27 = v30;
          if (!strcmp((const char *)v23, "edns0"))
          {
            _pdns_build((uint64_t)v3, "edns0", 0LL);
            goto LABEL_72;
          }

          unint64_t v24 = v29;
          if (!strcmp((const char *)v23, "a6"))
          {
            _pdns_build((uint64_t)v3, "a6", 0LL);
            goto LABEL_75;
          }

          if (!strcmp((const char *)v23, "dname"))
          {
            uint64_t v35 = (uint64_t)v3;
            char v36 = "dname";
            goto LABEL_85;
          }

          if (!strcmp((const char *)v23, "default"))
          {
            uint64_t v35 = (uint64_t)v3;
            char v36 = "default";
            goto LABEL_85;
          }

          if (!strcmp((const char *)v23, "pdns"))
          {
            uint64_t v35 = (uint64_t)v3;
            char v36 = "pdns";
LABEL_85:
            v37 = 0LL;
LABEL_74:
            _pdns_build(v35, v36, v37);
            goto LABEL_75;
          }

          if (!strcmp((const char *)v23, "mdns"))
          {
            uint64_t v35 = (uint64_t)v3;
            char v36 = "mdns";
            goto LABEL_85;
          }

LABEL_75:
          int v23 = res_next_word(&v38);
          if (!v23) {
            goto LABEL_86;
          }
        }

        _pdns_build((uint64_t)v3, v34, 0LL);
        int v26 = v33;
LABEL_69:
        uint64_t v28 = v32;
LABEL_70:
        int v25 = v31;
LABEL_71:
        uint64_t v27 = v30;
LABEL_72:
        unint64_t v24 = v29;
        goto LABEL_75;
      }
    }

    else
    {
      int v18 = 10;
      *(_DWORD *)(a1 + 36) = 10;
    }

    for (uint64_t i = 0LL; i < v18; ++i)
    {
      if (v3)
      {
        int v21 = *(int **)(*(void *)(a1 + 40) + 8 * i);
        res_build_sortlist(*(void *)v3, *v21, v21[1]);
        int v18 = *(_DWORD *)(a1 + 36);
      }
    }

    goto LABEL_41;
  }

LABEL_34:
  _pdns_free(v3);
  return 0LL;
}

void *_pdns_file_open(char *a1)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  __filename = 0LL;
  if (a1 && (*a1 & 0xFE) != 0x2E) {
    asprintf(&__filename, "%s/%s");
  }
  else {
    asprintf(&__filename, "%s");
  }
  if (!__filename) {
    return 0LL;
  }
  unint64_t v2 = fopen(__filename, "r");
  free(__filename);
  if (!v2) {
    return 0LL;
  }
  int v3 = _pdns_build_start(0LL);
  if (v3)
  {
    unint64_t v4 = getenv("RES_RETRY_TIMEOUT");
    if (v4) {
      *((_DWORD *)v3 + 13) = atoi(v4);
    }
    BOOL v5 = (unsigned __int8 *)getenv("RES_RETRY");
    int v17 = (char *)v5;
    if (v5) {
      *(_DWORD *)(*v3 + 4LL) = atoi((const char *)v5);
    }
    while (fgets(v19, 1024, v2))
    {
      if (v19[0] != 35 && v19[0] != 59)
      {
        int v17 = v19;
        word = res_next_word((unsigned __int8 **)&v17);
        if (word)
        {
          int v7 = (char *)word;
          if (!strcmp((const char *)word, "sortlist"))
          {
            time_t v11 = res_next_word((unsigned __int8 **)&v17);
            if (v11)
            {
              int v12 = v11;
              do
              {
                _pdns_build((uint64_t)v3, "sortlist", (const char *)v12);
                int v12 = res_next_word((unsigned __int8 **)&v17);
              }

              while (v12);
            }
          }

          else if (!strcmp(v7, "timeout"))
          {
            int v13 = res_next_word((unsigned __int8 **)&v17);
            if (v13) {
              _pdns_build((uint64_t)v3, "total_timeout", (const char *)v13);
            }
          }

          else
          {
            int v8 = strcmp(v7, "options");
            int v9 = res_next_word((unsigned __int8 **)&v17);
            uint64_t v10 = (char *)v9;
            if (v8)
            {
              if (v9) {
                _pdns_build((uint64_t)v3, v7, (const char *)v9);
              }
              if (!strcmp(v7, "domain") && !v3[2]) {
                _pdns_set_name(v3, v10);
              }
            }

            else if (v9)
            {
              do
              {
                int v14 = strchr(v10, 58);
                int v15 = v14;
                if (v14)
                {
                  *int v14 = 0;
                  int v15 = v14 + 1;
                }

                _pdns_build((uint64_t)v3, v10, v15);
                uint64_t v10 = (char *)res_next_word((unsigned __int8 **)&v17);
              }

              while (v10);
            }
          }
        }
      }
    }

    fclose(v2);
    if (!v3[2]) {
      _pdns_set_name(v3, a1);
    }
    _pdns_build_finish(v3);
  }

  else
  {
    fclose(v2);
  }

  return v3;
}

dns_handle_t dns_open(const char *name)
{
  unint64_t v2 = calloc(1uLL, 0x40uLL);
  if (v2)
  {
    if (dns_control_token != -1) {
      goto LABEL_6;
    }
    pthread_mutex_lock(&dns_control_lock);
    if (dns_control_token == -1) {
      notify_register_check("com.apple.system.dns", &dns_control_token);
    }
    pthread_mutex_unlock(&dns_control_lock);
    if (dns_control_token != -1)
    {
LABEL_6:
      pthread_mutex_lock(&dns_control_lock);
      if (notify_check(dns_control_token, &check)) {
        BOOL v3 = 0;
      }
      else {
        BOOL v3 = check == 1;
      }
      if (v3 && !notify_get_state(dns_control_token, &v16))
      {
        if ((v16 & 2) != 0) {
          dns_control_mdns = 1;
        }
        if ((v16 & 1) != 0) {
          dns_control_debug = 1;
        }
      }

      pthread_mutex_unlock(&dns_control_lock);
    }

    if (name)
    {
      if (strcmp(name, "*MDNS*"))
      {
        *(_DWORD *)unint64_t v2 = 1;
        uint64_t v4 = dns_configuration_copy();
        if (v4)
        {
          uint64_t v5 = *(_DWORD *)v4 & ~(*(int *)v4 >> 31);
          int v6 = *(const char ****)(v4 + 4);
          while (1)
          {
            int v7 = *v6;
            if (*v6)
            {
              if (*v7 && !strcasecmp(name, *v7)) {
                break;
              }
            }

            ++v6;
            if (!--v5) {
              goto LABEL_26;
            }
          }

          if (calloc(1uLL, 0x48uLL))
          {
            time_t v11 = _pdns_convert_sc((uint64_t)v7);
            dns_configuration_free();
            if (v11)
            {
              uint64_t v12 = *(void *)v11;
              if (*(void *)v11)
              {
                *((void *)v11 + 2) = 0LL;
                int v14 = *(unsigned __int8 *)(v12 + 128);
                int v13 = (char *)(v12 + 128);
                if (v14) {
                  int v15 = v13;
                }
                else {
                  int v15 = (char *)name;
                }
                _pdns_set_name(v11, v15);
                v11[6] = -1;
                v2[2] = v11;
                goto LABEL_35;
              }

              free(v11);
            }
          }

          else
          {
LABEL_26:
            dns_configuration_free();
          }
        }

        v2[2] = 0LL;
        int v8 = _pdns_file_open((char *)name);
        v2[2] = v8;
        if (!v8)
        {
LABEL_36:
          free(v2);
          return 0LL;
        }

LABEL_35:
        dns_set_debug((dns_handle_t)v2, dns_control_debug);
        return (dns_handle_t)v2;
      }
    }

    else if (dns_control_mdns == 1)
    {
      *(_DWORD *)unint64_t v2 = 0;
      int v9 = (char *)calloc(1uLL, 0x50uLL);
      v2[1] = v9;
      if (!v9) {
        goto LABEL_36;
      }
      *((_DWORD *)v9 + 9) |= 2u;
      *((void *)v9 + 5) = -1LL;
      *((_DWORD *)v9 + 12) = -1;
      goto LABEL_34;
    }

    *(_DWORD *)unint64_t v2 = 0;
    int v9 = (char *)calloc(1uLL, 0x50uLL);
    v2[1] = v9;
    if (!v9) {
      goto LABEL_36;
    }
    *(_OWORD *)(v9 + 36) = xmmword_1874A9FA0;
    if (name) {
      goto LABEL_35;
    }
LABEL_34:
    _dns_open_notify((uint64_t)v9);
    goto LABEL_35;
  }

  return (dns_handle_t)v2;
}

    *__error() = v51;
    goto LABEL_61;
  }

  if ((v185 & 1) != 0 || (v100 = satisfy((uint64_t)a1, v189, (uint64_t *)v187, a7, v184), v100 <= 0))
  {
    v133 = *__error();
    if ((a1->options & 2) != 0) {
      res_dprintf("get the missing glue and see if it's finally enough", v126, v127, v128, v129, v130, v131, v132, v182);
    }
    *__error() = v133;
    v134 = v187[0];
    if (v187[0])
    {
      while (1)
      {
        v135 = (char *)*((void *)v134 + 1);
        if (!*((_DWORD *)v134 + 6))
        {
          v136 = (uint64_t *)(v134 + 16);
          v137 = do_query((uint64_t)a1, *((char **)v134 + 2), a3, 1, (u_char *)&v190, &v192);
          if (v137 < 0) {
            goto LABEL_111;
          }
          if (v137)
          {
            v138 = *__error();
            if ((a1->options & 2) != 0)
            {
              v139 = *v136;
              res_9_p_class(a3);
              res_dprintf( "get_glue: do_query('%s', %s') CNAME or DNAME found",  v140,  v141,  v142,  v143,  v144,  v145,  v146,  v139);
            }

            *__error() = v138;
          }
        }

        if (!*((_DWORD *)v134 + 7))
        {
          v136 = (uint64_t *)(v134 + 16);
          v147 = do_query((uint64_t)a1, *((char **)v134 + 2), a3, 28, (u_char *)&v190, &v192);
          if (v147 < 0)
          {
LABEL_111:
            v172 = *__error();
            if ((a1->options & 2) == 0) {
              goto LABEL_116;
            }
            v173 = "get_glue: do_query('%s', %s') failed";
            goto LABEL_115;
          }

          if (v147)
          {
            v148 = *__error();
            if ((a1->options & 2) != 0)
            {
              v149 = *v136;
              res_9_p_class(a3);
              res_dprintf( "get_glue: do_query('%s', %s') CNAME or DNAME found",  v150,  v151,  v152,  v153,  v154,  v155,  v156,  v149);
            }

            *__error() = v148;
          }
        }

        if (!*((void *)v134 + 4))
        {
          v164 = *__error();
          if ((a1->options & 2) != 0) {
            res_dprintf( "get_glue: removing empty '%s' NS",  v157,  v158,  v159,  v160,  v161,  v162,  v163,  *((void *)v134 + 2));
          }
          *__error() = v164;
          free_nsrr(v187, v134);
        }

        v134 = v135;
        if (!v135) {
          goto LABEL_108;
        }
      }

      v172 = *__error();
      if ((a1->options & 2) == 0) {
        goto LABEL_116;
      }
      v173 = "get_glue: save_r('%s', %s) failed";
LABEL_115:
      v174 = *v136;
      res_9_p_class(a3);
      res_dprintf(v173, v175, v176, v177, v178, v179, v180, v181, v174);
LABEL_116:
      *__error() = v172;
LABEL_61:
      v100 = -1;
    }

    else
    {
LABEL_108:
      v100 = satisfy((uint64_t)a1, v189, (uint64_t *)v187, v183, v184);
    }
  }

uint64_t _dns_open_notify(uint64_t out_token)
{
  if (out_token)
  {
    uint64_t v1 = out_token;
    unint64_t v2 = (int *)(out_token + 48);
    if (*(_DWORD *)(out_token + 48) == -1)
    {
      out_token = notify_register_check("com.apple.system.dns.delay", v2);
      if ((_DWORD)out_token) {
        int *v2 = -1;
      }
      else {
        out_token = notify_check(*v2, &check);
      }
    }

    if (*(_DWORD *)(v1 + 40) == -1)
    {
      BOOL v3 = (const char *)dns_configuration_notify_key();
      out_token = notify_register_check(v3, (int *)(v1 + 40));
      if ((_DWORD)out_token) {
        *(_DWORD *)(v1 + 40) = -1;
      }
    }

    int v5 = *(_DWORD *)(v1 + 44);
    uint64_t v4 = (int *)(v1 + 44);
    if (v5 == -1)
    {
      out_token = notify_register_check("com.apple.system.dns.resolver.dir", v4);
      if (!(_DWORD)out_token)
      {
        out_token = notify_monitor_file();
        if (!(_DWORD)out_token) {
          return out_token;
        }
        out_token = notify_cancel(*v4);
      }

      int *v4 = -1;
    }
  }

  return out_token;
}

void dns_set_debug(dns_handle_t dns, uint32_t flag)
{
  if (dns)
  {
    if (*(_DWORD *)dns)
    {
      uint64_t v2 = *((void *)dns + 2);
      if (v2) {
        *(void *)(*(void *)v2 + 8LL) = *(void *)(*(void *)v2 + 8LL) & 0xFFFFFFFFFFFFFFFDLL | (2LL * (flag != 0));
      }
    }

    else
    {
      uint64_t v3 = *((void *)dns + 1);
      if (v3)
      {
        int v4 = *(_DWORD *)(v3 + 36);
        if (flag)
        {
          *(_DWORD *)(v3 + 36) = v4 | 1;
          uint64_t v5 = *(unsigned int *)(v3 + 8);
          if ((_DWORD)v5)
          {
            int v6 = *(uint64_t **)(v3 + 16);
            do
            {
              uint64_t v7 = *v6++;
              *(void *)(*(void *)v7 + 8LL) |= 2uLL;
              --v5;
            }

            while (v5);
          }
        }

        else
        {
          *(_DWORD *)(v3 + 36) = v4 & 0xFFFFFFFE;
          uint64_t v8 = *(unsigned int *)(v3 + 8);
          if ((_DWORD)v8)
          {
            int v9 = *(uint64_t **)(v3 + 16);
            do
            {
              uint64_t v10 = *v9++;
              *(void *)(*(void *)v10 + 8LL) &= ~2uLL;
              --v8;
            }

            while (v8);
          }
        }
      }
    }
  }

void dns_free(dns_handle_t dns)
{
  if (dns)
  {
    uint64_t v2 = (void *)*((void *)dns + 3);
    if (v2) {
      free(v2);
    }
    if (*(_DWORD *)dns)
    {
      _pdns_free(*((unsigned int **)dns + 2));
    }

    else
    {
      uint64_t v3 = (_DWORD *)*((void *)dns + 1);
      if (!v3) {
        return;
      }
      int v4 = v3[12];
      if (v4 != -1) {
        notify_cancel(v4);
      }
      v3[12] = -1;
      int v5 = v3[10];
      if (v5 != -1) {
        notify_cancel(v5);
      }
      v3[10] = -1;
      int v6 = v3[11];
      if (v6 != -1) {
        notify_cancel(v6);
      }
      v3[11] = -1;
      uint64_t v7 = *((void *)dns + 1);
      if (*(_DWORD *)(v7 + 8))
      {
        unint64_t v8 = 0LL;
        do
        {
          _pdns_free(*(unsigned int **)(*(void *)(v7 + 16) + 8 * v8++));
          uint64_t v7 = *((void *)dns + 1);
        }

        while (v8 < *(unsigned int *)(v7 + 8));
      }

      *(_DWORD *)(v7 + 8) = 0;
      if (*(void *)(v7 + 16))
      {
        free(*(void **)(v7 + 16));
        uint64_t v7 = *((void *)dns + 1);
      }

      free((void *)v7);
    }

    free(dns);
  }

uint32_t dns_search_list_count(dns_handle_t dns)
{
  if (dns)
  {
    dns_handle_t v1 = dns;
    if (*(_DWORD *)dns)
    {
      uint64_t v2 = (uint64_t **)((char *)dns + 16);
    }

    else
    {
      _check_cache(*((void *)dns + 1));
      uint64_t v2 = (uint64_t **)*((void *)v1 + 1);
    }

    uint64_t v3 = *v2;
    LODWORD(dns) = *((_DWORD *)*v2 + 6);
    if ((_DWORD)dns == -1)
    {
      _pdns_process_res_search_list(*v2);
      LODWORD(dns) = *((_DWORD *)v3 + 6);
    }
  }

  return dns;
}

uint64_t *_pdns_process_res_search_list(uint64_t *result)
{
  if (*((_DWORD *)result + 6) == -1)
  {
    uint64_t v1 = *result;
    *((_DWORD *)result + 6) = 0;
    uint64_t v2 = *(_BYTE **)(v1 + 72);
    if (v2)
    {
      unsigned int v3 = 1;
      do
      {
        if (!*v2) {
          break;
        }
        *((_DWORD *)result + 6) = v3;
        uint64_t v2 = *(_BYTE **)(v1 + 8LL * v3++ + 72);
      }

      while (v2);
    }
  }

  return result;
}

char *__cdecl dns_search_list_domain(dns_handle_t dns, uint32_t i)
{
  if (!dns) {
    return 0LL;
  }
  if (*(_DWORD *)dns)
  {
    int v4 = (uint64_t *)((char *)dns + 16);
  }

  else
  {
    _check_cache(*((void *)dns + 1));
    int v4 = (uint64_t *)*((void *)dns + 1);
  }

  uint64_t v5 = *v4;
  if (!*v4) {
    return 0LL;
  }
  uint32_t v6 = *(_DWORD *)(v5 + 24);
  if (v6 == -1)
  {
    _pdns_process_res_search_list((uint64_t *)v5);
    uint32_t v6 = *(_DWORD *)(v5 + 24);
  }

  else {
    return 0LL;
  }
}

uint64_t _pdns_search( time_t a1, uint64_t a2, char *__s, int a4, int a5, u_char *a6, int a7, int a8, uint64_t a9)
{
  uint64_t v9 = 0xFFFFFFFFLL;
  if (a2
    && __s
    && *(void *)a2
    && *(_DWORD *)(*(void *)a2 + 16LL)
    && (a5 != 28 || (*(_DWORD *)(a2 + 44) & 0xC) != 8))
  {
    if (!*(void *)(a2 + 16) || strrchr(__s, 46)) {
      goto LABEL_15;
    }
    int v19 = *(_DWORD *)(a2 + 24);
    if (v19 == -1)
    {
      _pdns_process_res_search_list((uint64_t *)a2);
      int v19 = *(_DWORD *)(a2 + 24);
    }

    if (v19 || *(_BYTE *)(*(void *)a2 + 128LL))
    {
LABEL_15:
      _pdns_delay(a1);
      return __res_nsearch_list_2( *(void *)a2,  __s,  a4,  a5,  a6,  a7,  a8,  a9,  *(_DWORD *)(a2 + 24),  *(const char ***)(a2 + 32));
    }

    _pdns_delay(a1);
    uint64_t v20 = 0LL;
    asprintf(&v20, "%s.%s.", __s, *(const char **)(a2 + 16));
    if (v20)
    {
      uint64_t v9 = res_nsearch_2(*(void *)a2, v20, a4, a5, a6, a7, a8, a9);
      free(v20);
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return v9;
}

time_t _pdns_delay(time_t result)
{
  if (result)
  {
    time_t v1 = result;
    int check = 0;
    uint64_t result = *(unsigned int *)(result + 48);
    if ((_DWORD)result != -1)
    {
      if (*(void *)(v1 + 56))
      {
        uint64_t result = time(0LL);
        unsigned int v2 = *(_DWORD *)(v1 + 56) - result;
        if (v2 > 0x7FFFFFFE) {
          return result;
        }
        unsigned int v3 = (v2 + 1) & ~((int)(v2 + 1) >> 31);
        goto LABEL_9;
      }

      uint64_t result = notify_check(result, &check);
      if (!(_DWORD)result && check == 1)
      {
        *(void *)(v1 + 56) = time(0LL) + 4;
        unsigned int v3 = 4;
LABEL_9:
        uint64_t result = sleep(v3);
        if (check == 1) {
          *(void *)(v1 + 56) = 0LL;
        }
      }
    }
  }

  return result;
}

uint64_t _sdns_search( uint64_t a1, const char *a2, unsigned int a3, unsigned int a4, uint64_t a5, int a6, u_char *a7, unsigned int a8, uint64_t a9, _DWORD *a10, int *a11)
{
  uint64_t v11 = 0xFFFFFFFFLL;
  if (!a1 || !a2) {
    return v11;
  }
  uint64_t v13 = a5;
  int v15 = a11;
  *a11 = -1;
  uint64_t v16 = *(uint64_t **)a1;
  if (*(void *)a1 && *v16) {
    int v17 = *(_BYTE *)(*v16 + 392) & 0xF;
  }
  else {
    int v17 = 1;
  }
  int v18 = 0;
  int v19 = 0LL;
  for (uint64_t i = a2; *i == 46; ++i)
  {
    ++v18;
    int v19 = i;
LABEL_12:
    ;
  }

  if (*i) {
    goto LABEL_12;
  }
  if (!(_DWORD)a5 && v19) {
    uint64_t v13 = *((unsigned __int8 *)v19 + 1) == 0;
  }
  if (a4 != 12 && v18 < v17 && (_DWORD)v13 != 1)
  {
    int v21 = -1;
    if (!a6 || !v16) {
      goto LABEL_103;
    }
    int v22 = 0;
    BOOL v23 = 1;
LABEL_79:
    int v46 = *((_DWORD *)v16 + 6);
    if (v46 == -1)
    {
      _pdns_process_res_search_list(v16);
      int v46 = *((_DWORD *)v16 + 6);
    }

    __sa = (char *)v15;
    if (v46 < 1)
    {
      v72 = 0LL;
      unsigned int default_handles = _pdns_get_default_handles(a1, (void **)&v72);
      if (default_handles)
      {
        uint64_t v56 = 0LL;
        uint64_t v57 = 8LL * default_handles;
        while (1)
        {
          v71 = 0LL;
          if (*(void *)(*(void *)&v72[v56] + 16LL)) {
            asprintf(&v71, "%s.%s");
          }
          else {
            asprintf(&v71, "%s");
          }
          if (!v71) {
            break;
          }
          int v69 = -1;
          uint64_t v11 = _pdns_query(a1, *(void *)&v72[v56], v71, a3, a4, a7, a8, a9, a10, &v69);
          if ((int)v11 > 0)
          {
            free(v71);
LABEL_135:
            free(v72);
            if (!v22) {
              *int v15 = v21;
            }
            return v11;
          }

          int v58 = v69;
          int v60 = v69 < 0 || v22 != 0;
          if (v69 >= v21) {
            int v61 = v21;
          }
          else {
            int v61 = v69;
          }
          if (v21 != -1) {
            int v58 = v61;
          }
          if (!v60) {
            int v21 = v58;
          }
          int v22 = v60 << 31 >> 31;
          free(v71);
          v56 += 8LL;
          if (v57 == v56) {
            goto LABEL_135;
          }
        }
      }

      else if (v23)
      {
        *int v15 = v21;
      }
    }

    else
    {
      uint64_t v47 = 0LL;
      uint64_t v48 = 8LL * v46;
      while (1)
      {
        v71 = 0LL;
        asprintf(&v71, "%s.%s", a2, *(const char **)(v16[4] + v47));
        if (!v71) {
          break;
        }
        int v69 = -1;
        uint64_t v49 = _sdns_search(a1, v71, a3, a4, v13, 0LL, a7, a8, a9, a10, &v69);
        if ((int)v49 > 0)
        {
          uint64_t v11 = v49;
          free(v71);
          return v11;
        }

        int v51 = v69 < 0 || v22 != 0;
        if (v69 >= v21) {
          int v52 = v21;
        }
        else {
          int v52 = v69;
        }
        if (v21 == -1) {
          int v53 = v69;
        }
        else {
          int v53 = v52;
        }
        if (!v51) {
          int v21 = v53;
        }
        int v22 = v51 << 31 >> 31;
        free(v71);
        v47 += 8LL;
        if (v48 == v47)
        {
          if ((v22 & 1) == 0) {
            *(_DWORD *)__sa = v53;
          }
          return 0xFFFFFFFFLL;
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

  v71 = 0LL;
  int v69 = -1;
  if (!*a2) {
    goto LABEL_48;
  }
  unint64_t v24 = strdup(a2);
  int v25 = strlen(v24);
  uint64_t v26 = (v25 - 1);
  __s = v24;
  if (v25 - 1 < 0)
  {
    if (!v24) {
      goto LABEL_48;
    }
  }

  else if (v24[v26] == 46)
  {
    v24[v26] = 0;
  }

  int v27 = 0;
  unint64_t v28 = *(unsigned int *)(a1 + 8);
  unint64_t v29 = v28;
  unint64_t v30 = v24;
  while (2)
  {
    if (v29)
    {
      unint64_t v31 = 0LL;
      while (1)
      {
        int v32 = *(const char **)(*(void *)(*(void *)(a1 + 16) + 8 * v31) + 16LL);
        if (v32)
        {
          if (!strcasecmp(v32, v30)) {
            break;
          }
        }

LABEL_45:
        ++v31;
        unint64_t v29 = v28;
        if (v31 >= v28) {
          goto LABEL_46;
        }
      }

      if (v27)
      {
        uint64_t v33 = (char *)reallocf(v71, 8LL * (v27 + 1));
        v71 = v33;
        if (!v33) {
          goto LABEL_70;
        }
        if (v27 >= 1)
        {
          uint64_t v34 = 0LL;
          while (*(_DWORD *)(*(void *)(*(void *)(a1 + 16) + 8 * v31) + 56LL) >= *(_DWORD *)(*(void *)&v33[8 * v34]
                                                                                               + 56LL))
          {
            if (v27 == ++v34)
            {
              LODWORD(v34) = v27;
              goto LABEL_41;
            }
          }

          goto LABEL_41;
        }
      }

      else
      {
        uint64_t v33 = (char *)calloc(1uLL, 8uLL);
        v71 = v33;
        if (!v33) {
          goto LABEL_70;
        }
      }

      LODWORD(v34) = 0;
LABEL_41:
      if (v27 > (int)v34)
      {
        uint64_t v35 = v27;
        do
        {
          *(void *)&v33[8 * v35] = *(void *)&v33[8 * v35 - 8];
          --v35;
        }

        while (v35 > (int)v34);
      }

      *(void *)&v33[8 * v34] = *(void *)(*(void *)(a1 + 16) + 8 * v31);
      ++v27;
      unint64_t v28 = *(unsigned int *)(a1 + 8);
      goto LABEL_45;
    }

  *__error() = v49;
  free((void *)v19);
  return 0xFFFFFFFFLL;
}

LABEL_49:
  v72 = 0LL;
  v37 = (const char *)&unk_1874AA85D;
  if (!(_DWORD)v13) {
    v37 = ".";
  }
  asprintf(&v72, "%s%s", a2, v37);
  if (!v72) {
    goto LABEL_70;
  }
  uint64_t v38 = 0LL;
  int v39 = 0;
  int v40 = -1;
  do
  {
    int v70 = -1;
    uint64_t v11 = _pdns_query(a1, *(void *)&v71[8 * v38], v72, a3, a4, a7, a8, a9, a10, &v70);
    int v41 = v70;
    if (v39) {
      BOOL v42 = 1;
    }
    else {
      BOOL v42 = v70 < 0;
    }
    int v43 = v42;
    if (v70 >= v40) {
      int v44 = v40;
    }
    else {
      int v44 = v70;
    }
    if (v40 != -1) {
      int v41 = v44;
    }
    if (!v43) {
      int v40 = v41;
    }
    int v39 = v43 << 31 >> 31;
    ++v38;
  }

  while (v27 != v38);
  if (v39) {
    int v40 = -1;
  }
  else {
    int v69 = v40;
  }
  int v15 = a11;
  uint64_t v13 = v13;
  int v45 = a6;
  free(v71);
  free(v72);
  if ((int)v11 <= 0)
  {
LABEL_71:
    if (v40 < 0) {
      int v21 = -1;
    }
    else {
      int v21 = v40;
    }
    if (a4 != 12 && v45 && v16 && (_DWORD)v13 != 1)
    {
      BOOL v23 = v40 >= 0;
      int v22 = v40 >> 31;
      goto LABEL_79;
    }

    if ((v40 & 0x80000000) == 0) {
LABEL_103:
    }
      *int v15 = v21;
    return 0xFFFFFFFFLL;
  }

  return v11;
}

void **_pdns_get_default_handles(uint64_t a1, void **a2)
{
  if (a2)
  {
    unint64_t v3 = *(unsigned int *)(a1 + 8);
    if ((_DWORD)v3)
    {
      int v4 = a2;
      unint64_t v5 = 0LL;
      uint32_t v6 = 0LL;
      do
      {
        if ((*(_BYTE *)(*(void *)(*(void *)(a1 + 16) + 8 * v5) + 44LL) & 0x10) != 0)
        {
          if ((_DWORD)v6)
          {
            uint64_t v7 = reallocf(*v4, 8LL * ((int)v6 + 1));
            uint64_t *v4 = v7;
            if (!v7) {
              return 0LL;
            }
            if ((int)v6 < 1)
            {
              LODWORD(v8) = 0;
            }

            else
            {
              uint64_t v8 = 0LL;
              while (*(_DWORD *)(*(void *)(*(void *)(a1 + 16) + 8 * v5) + 56LL) >= *(_DWORD *)(*((void *)v7 + v8)
                                                                                                  + 56LL))
              {
                if (v6 == ++v8)
                {
                  LODWORD(v8) = (_DWORD)v6;
                  break;
                }
              }
            }
          }

          else
          {
            uint64_t v7 = calloc(1uLL, 8uLL);
            LODWORD(v8) = 0;
            a2 = 0LL;
            uint64_t *v4 = v7;
            if (!v7) {
              return a2;
            }
          }

          if ((int)v6 > (int)v8)
          {
            uint64_t v9 = (int)v6;
            do
            {
              *((void *)*v4 + v9) = *((void *)*v4 + v9 - 1);
              --v9;
            }

            while (v9 > (int)v8);
            uint64_t v7 = *v4;
          }

          *((void *)v7 + v8) = *(void *)(*(void *)(a1 + 16) + 8 * v5);
          uint32_t v6 = (void **)((_DWORD)v6 + 1);
          unint64_t v3 = *(unsigned int *)(a1 + 8);
        }

        ++v5;
        a2 = v6;
      }

      while (v5 < v3);
    }

    else
    {
      return 0LL;
    }
  }

  return a2;
}

uint64_t _pdns_query( time_t a1, uint64_t a2, char *a3, int a4, int a5, u_char *a6, int a7, uint64_t a8, _DWORD *a9, int *a10)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (a2 && a3)
  {
    int v13 = a8;
    int v19 = *(__res_9_state **)a2;
    if ((*(_DWORD *)(a2 + 44) & 0x20) != 0)
    {
      uint64_t result = res_query_mDNSResponder(v19, a3, a4, a5, a6, a7, a8, a9);
      if (a10 && (result & 0x80000000) != 0) {
        *a10 = 2;
      }
    }

    else if (v19 && v19->nscount && (a5 != 28 || (*(_DWORD *)(a2 + 44) & 0xC) != 8))
    {
      _pdns_delay(a1);
      return res_nquery_soa_min(*(__res_9_state **)a2, a3, a4, a5, a6, a7, v13, (int)a9, a10);
    }

    else
    {
      return 0xFFFFFFFFLL;
    }
  }

  return result;
}

int32_t dns_query( dns_handle_t dns, const char *name, uint32_t dnsclass, uint32_t dnstype, char *buf, uint32_t len, sockaddr *from, uint32_t *fromlen)
{
  int32_t result = -1;
  if (dns && name)
  {
    int v18 = 0;
    time_t v17 = *((void *)dns + 1);
    if (*(_DWORD *)dns)
    {
      return _pdns_query( v17,  *((void *)dns + 2),  (char *)name,  dnsclass,  dnstype,  (u_char *)buf,  len,  (uint64_t)from,  fromlen,  &v18);
    }

    else
    {
      _check_cache(v17);
      return _sdns_search( *((void *)dns + 1),  name,  dnsclass,  dnstype,  1LL,  1,  (u_char *)buf,  len,  (uint64_t)from,  fromlen,  &v18);
    }
  }

  return result;
}

int32_t dns_search( dns_handle_t dns, const char *name, uint32_t dnsclass, uint32_t dnstype, char *buf, uint32_t len, sockaddr *from, uint32_t *fromlen)
{
  int32_t result = -1;
  if (dns && name)
  {
    time_t v17 = *((void *)dns + 1);
    if (*(_DWORD *)dns)
    {
      return _pdns_search( v17,  *((void *)dns + 2),  (char *)name,  dnsclass,  dnstype,  (u_char *)buf,  len,  (int)from,  (uint64_t)fromlen);
    }

    else
    {
      _check_cache(v17);
      return _sdns_search( *((void *)dns + 1),  name,  dnsclass,  dnstype,  0LL,  1,  (u_char *)buf,  len,  (uint64_t)from,  fromlen,  &v18);
    }
  }

  return result;
}

uint64_t dns_server_list_count(uint64_t result)
{
  if (result)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

uint64_t dns_server_list_address(uint64_t result, unsigned int a2)
{
  if (result)
  {
    if (*(_DWORD *)result != 1) {
      return 0LL;
    }
    uint64_t v2 = *(uint64_t **)(result + 16);
    if (!v2) {
      return 0LL;
    }
    int32_t result = *v2;
    if (!*v2) {
      return result;
    }
    if (*(_DWORD *)(result + 16) > a2)
    {
      int32_t result = res_9_get_nsaddr(result, a2);
      if (result)
      {
        unint64_t v3 = (__int128 *)result;
        int32_t result = (uint64_t)calloc(1uLL, 0x80uLL);
        if (result)
        {
          __int128 v4 = *v3;
          __int128 v5 = v3[1];
          __int128 v6 = v3[3];
          *(_OWORD *)(result + 32) = v3[2];
          *(_OWORD *)(result + 48) = v6;
          *(_OWORD *)int32_t result = v4;
          *(_OWORD *)(result + 16) = v5;
          __int128 v7 = v3[4];
          __int128 v8 = v3[5];
          __int128 v9 = v3[7];
          *(_OWORD *)(result + 96) = v3[6];
          *(_OWORD *)(result + 112) = v9;
          *(_OWORD *)(result + 64) = v7;
          *(_OWORD *)(result + 80) = v8;
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

_WORD *_pdns_build_start(char *a1)
{
  uint64_t v2 = calloc(1uLL, 0x48uLL);
  if (v2)
  {
    res_9_state v3 = res_build_start(0LL);
    *(void *)uint64_t v2 = v3;
    if (v3)
    {
      _pdns_set_name(v2, a1);
      v2[20] = 53;
    }

    else
    {
      free(v2);
      return 0LL;
    }
  }

  return v2;
}

void _pdns_build(uint64_t a1, char *__s1, const char *a3)
{
  if (!a1) {
    return;
  }
  if ((*(_BYTE *)(a1 + 44) & 4) == 0 && !strcmp(__s1, "nameserver"))
  {
    v12[0] = 0LL;
    v12[1] = 0LL;
    if (inet_pton(30, a3, v12) == 1) {
      *(_DWORD *)(a1 + 44) |= 4u;
    }
  }

  if (!strcmp(__s1, "default"))
  {
    int v6 = *(_DWORD *)(a1 + 44) | 0x10;
LABEL_16:
    *(_DWORD *)(a1 + 44) = v6;
    return;
  }

  if (!strcmp(__s1, "port"))
  {
    *(_WORD *)(a1 + 40) = atoi(a3);
    return;
  }

  if (!strcmp(__s1, "search"))
  {
    __int128 v7 = strdup(a3);
    if (!v7) {
      return;
    }
    __int128 v8 = v7;
    uint64_t v9 = *(unsigned int *)(a1 + 24);
    if ((_DWORD)v9)
    {
      if ((_DWORD)v9 != -1)
      {
        uint64_t v10 = reallocf(*(void **)(a1 + 32), 8 * v9 + 8);
LABEL_28:
        *(void *)(a1 + 32) = v10;
        if (v10)
        {
          uint64_t v11 = *(unsigned int *)(a1 + 24);
          v10[v11] = v8;
          *(_DWORD *)(a1 + 24) = v11 + 1;
        }

        else
        {
          free(v8);
          _pdns_free((unsigned int *)a1);
        }

        return;
      }

      *(_DWORD *)(a1 + 24) = 0;
    }

    uint64_t v10 = calloc(1uLL, 8uLL);
    goto LABEL_28;
  }

  if (!strcmp(__s1, "total_timeout"))
  {
    *(_DWORD *)(a1 + 48) = atoi(a3);
  }

  else if (!strcmp(__s1, "timeout"))
  {
    *(_DWORD *)(a1 + 52) = atoi(a3);
  }

  else
  {
    if (strcmp(__s1, "search_order"))
    {
      if (strcmp(__s1, "pdns") && strcmp(__s1, "mdns"))
      {
        res_build(*(void *)a1, *(unsigned __int16 *)(a1 + 40), (_DWORD *)(a1 + 24), __s1, a3);
        return;
      }

      int v6 = *(_DWORD *)(a1 + 44) | 0x20;
      goto LABEL_16;
    }

    *(_DWORD *)(a1 + 56) = atoi(a3);
  }

_DWORD *_pdns_build_finish(_DWORD *result)
{
  if (result)
  {
    uint64_t v1 = *(void *)result;
    if (*(_DWORD *)(*(void *)result + 16LL) <= 1u) {
      int v2 = 1;
    }
    else {
      int v2 = *(_DWORD *)(*(void *)result + 16LL);
    }
    int v3 = result[12];
    if (!v3)
    {
      int v4 = result[13];
      if (v4)
      {
        int v3 = v4 * v2 * *(_DWORD *)(v1 + 4);
        result[12] = v3;
        if (!v3) {
          int v3 = 30;
        }
      }

      else
      {
        int v3 = 30;
        result[12] = 30;
      }
    }

    *(_DWORD *)uint64_t v1 = v3;
    *(void *)(v1 + 8) |= 1uLL;
  }

  return result;
}

void *_pdns_set_name(void *result, char *__s)
{
  if (__s)
  {
    int v2 = result;
    if (!result[2])
    {
      int32_t result = (void *)strlen(__s);
      int v4 = (_DWORD)result + 2;
      while (1)
      {
        int v5 = v4 - 3;
        if (v4 - 3 < 0) {
          break;
        }
        --v4;
        if (__s[v5] != 46)
        {
          int32_t result = calloc(v4, 1uLL);
          v2[2] = result;
          if (result) {
            return memcpy(result, __s, v4 - 1);
          }
          return result;
        }
      }
    }
  }

  return result;
}

void res_9_dst_init()
{
  if ((done_init & 1) == 0)
  {
    done_init = 1;
    v0 = getenv("DSTKEYPATH");
    if (v0)
    {
      uint64_t v1 = v0;
      size_t v2 = strlen(v0);
      if ((int)v2 <= 1024 && !stat(v1, &v5) && (v5.st_mode & 0xF000) == 0x4000)
      {
        int v3 = malloc((uint64_t)((v2 << 32) + 0x200000000LL) >> 32);
        memcpy(v3, v1, (uint64_t)((v2 << 32) + 0x100000000LL) >> 32);
        size_t v4 = (size_t)v3 + strlen((const char *)v3);
        if (*(_BYTE *)(v4 - 1) != 47)
        {
          *(_BYTE *)(v4 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
          *((_BYTE *)v3 + strlen((const char *)v3)) = 47;
        }

        res_9_dst_path = (uint64_t)v3;
      }
    }

    bzero(&res_9_dst_t_func, 0x4F0uLL);
    res_9_dst_hmac_md5_init();
  }

uint64_t res_9_dst_sign_data(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a1 & 4) == 0 || (uint64_t v6 = 4294967266LL, a6) && *(void *)(a2 + 32))
  {
    uint64_t v6 = *(void *)(a2 + 40);
    if (v6)
    {
      if (*(void *)v6) {
        return (*(uint64_t (**)(void))v6)();
      }
      return 0LL;
    }
  }

  return v6;
}

uint64_t res_9_dst_verify_data(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ((a1 & 4) == 0 || (uint64_t v6 = 4294967266LL, a6) && *(void *)(a2 + 32))
  {
    uint64_t v7 = *(void *)(a2 + 40);
    if (v7)
    {
      __int128 v8 = *(uint64_t (**)(void))(v7 + 8);
      if (v8) {
        return v8();
      }
    }

    return 4294967265LL;
  }

  return v6;
}

uint64_t res_9_dst_buffer_to_key(const char *a1, unsigned int a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  if (a2 > 0x9D) {
    return 0LL;
  }
  uint64_t v7 = res_9_dst_t_func[a2];
  if (!v7) {
    return 0LL;
  }
  int v13 = malloc(0x30uLL);
  uint64_t v14 = (uint64_t)v13;
  if (!v13) {
    return v14;
  }
  v13[3] = 0LL;
  void *v13 = strdup(a1);
  *(_DWORD *)(v14 + 16) = a2;
  *(_DWORD *)(v14 + 20) = a3;
  *(_DWORD *)(v14 + 8) = -1;
  *(_DWORD *)(v14 + 12) = a4;
  *(void *)(v14 + 32) = 0LL;
  *(void *)(v14 + 40) = v7;
  int v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (!v15) {
    return 0LL;
  }
  if ((v15(v14, a5, a6) & 0x80000000) != 0)
  {
    res_9_dst_free_key(v14);
    return 0LL;
  }

  uint64_t v16 = *(unsigned int *)(v14 + 16);
  if (v16 <= 0x9D && res_9_dst_t_func[v16])
  {
    bzero(&v24, 0x800uLL);
    res_9_dst_s_put_int16(&v24, *(unsigned __int16 *)(v14 + 20));
    int v17 = *(_DWORD *)(v14 + 16);
    char v25 = *(_DWORD *)(v14 + 12);
    char v26 = v17;
    unsigned int v18 = *(_DWORD *)(v14 + 20);
    if (v18 < 0x10000)
    {
      unsigned int v19 = 4;
    }

    else
    {
      res_9_dst_s_put_int16(v27, HIWORD(v18));
      unsigned int v19 = 6;
    }

    if (*(void *)(v14 + 32))
    {
      uint64_t v21 = *(void *)(v14 + 40);
      if (v21 && (int v22 = *(uint64_t (**)(uint64_t, char *, void))(v21 + 40)) != 0LL)
      {
        int v23 = v22(v14, (char *)&v24 + v19, 2048 - v19);
        if (v23 <= 0) {
          unsigned int v19 = -1;
        }
        else {
          v19 += v23;
        }
      }

      else
      {
        unsigned int v19 = -1;
      }
    }
  }

  else
  {
    unsigned int v19 = -31;
  }

  *(_WORD *)(v14 + 24) = res_9_dst_s_dns_key_id(&v24, v19);
  return v14;
}

uint64_t res_9_dst_free_key(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    int v3 = *(uint64_t (**)(void))(v2 + 32);
    if (v3)
    {
      size_t v4 = (void *)v3(*(void *)(a1 + 32));
      *(void *)(a1 + 32) = v4;
      if (!v4) {
        goto LABEL_8;
      }
      goto LABEL_7;
    }
  }

  free(*(void **)(a1 + 32));
  size_t v4 = *(void **)(a1 + 32);
  if (v4)
  {
LABEL_7:
    free(v4);
    *(void *)(a1 + 32) = 0LL;
  }

uint64_t res_9_dst_hmac_md5_init()
{
  return 0LL;
}

uint64_t res_9_dst_s_dns_key_id(unsigned __int16 *a1, int a2)
{
  if (!a1 || (int v2 = *((unsigned __int8 *)a1 + 3), v2 == 157))
  {
    LOWORD(v3) = 0;
  }

  else if (v2 == 1)
  {
    return bswap32(*(unsigned __int16 *)((char *)a1 + a2 - 3)) >> 16;
  }

  else if (a2 < 1)
  {
    LOWORD(v3) = -1;
  }

  else
  {
    unsigned int v5 = 0;
    if (a2 == 1) {
      goto LABEL_12;
    }
    unsigned int v6 = a2 + 2;
    do
    {
      unsigned int v7 = *a1++;
      v5 += bswap32(v7) >> 16;
      v6 -= 2;
    }

    while (v6 > 3);
    if (v6 == 3) {
LABEL_12:
    }
      v5 += *(unsigned __int8 *)a1 << 8;
    return (unsigned __int16)(v5 + HIWORD(v5));
  }

  return (unsigned __int16)v3;
}

_WORD *res_9_dst_s_put_int16(_WORD *result, unsigned int a2)
{
  *int32_t result = __rev16(a2);
  return result;
}

u_int32_t res_9_ns_datetosecs(const char *cp, int *errp)
{
  if (strlen(cp) != 14) {
    goto LABEL_37;
  }
  int v4 = 0;
  uint64_t v5 = 0LL;
  int v6 = 0;
  *errp = 0;
  do
  {
    int v7 = v6;
    int v8 = cp[v5];
    if ((v8 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v8) = cp[v5];
    }

    int v6 = 10 * v6 + (char)v8 - 48;
    ++v5;
  }

  while (v5 != 4);
  if ((v6 - 10000) <= 0xFFFFE0B5)
  {
    int v4 = 1;
    *errp = 1;
  }

  uint64_t v9 = 0LL;
  int v10 = 0;
  uint64_t v11 = cp + 4;
  do
  {
    int v12 = v11[v9];
    if ((v12 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v12) = v11[v9];
    }

    int v10 = 10 * v10 + (char)v12 - 48;
    ++v9;
  }

  while (v9 != 2);
  if ((v10 - 13) <= 0xFFFFFFF3)
  {
    int v4 = 1;
    *errp = 1;
  }

  uint64_t v13 = 0LL;
  int v14 = 0;
  int v15 = cp + 6;
  do
  {
    int v16 = v15[v13];
    if ((v16 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v16) = v15[v13];
    }

    int v14 = 10 * v14 + (char)v16 - 48;
    ++v13;
  }

  while (v13 != 2);
  if ((v14 - 32) <= 0xFFFFFFE0)
  {
    int v4 = 1;
    *errp = 1;
  }

  uint64_t v17 = 0LL;
  unsigned int v18 = 0;
  uint64_t v19 = (v10 - 1);
  uint64_t v20 = cp + 8;
  do
  {
    int v21 = v20[v17];
    if ((v21 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v2_dns_print_resource_record_lock((uint64_t)r, f, 1) = v20[v17];
    }

    unsigned int v18 = 10 * v18 + (char)v21 - 48;
    ++v17;
  }

  while (v17 != 2);
  if (v18 >= 0x18)
  {
    int v4 = 1;
    *errp = 1;
  }

  uint64_t v22 = 0LL;
  unsigned int v23 = 0;
  unsigned __int16 v24 = cp + 10;
  do
  {
    int v25 = v24[v22];
    if ((v25 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v25) = v24[v22];
    }

    unsigned int v23 = 10 * v23 + (char)v25 - 48;
    ++v22;
  }

  while (v22 != 2);
  if (v23 >= 0x3C)
  {
    int v4 = 1;
    *errp = 1;
  }

  uint64_t v26 = 0LL;
  unsigned int v27 = 0;
  uint64_t v28 = cp + 12;
  do
  {
    int v29 = v28[v26];
    if ((v29 - 48) >= 0xA)
    {
      int v4 = 1;
      *errp = 1;
      LOBYTE(v29) = v28[v26];
    }

    unsigned int v27 = 10 * v27 + (char)v29 - 48;
    ++v26;
  }

  while (v26 != 2);
  if (v27 <= 0x3B)
  {
    if (v4)
    {
      return 0;
    }

    else
    {
      int v31 = 60 * v23;
      int v32 = 3600 * v18;
      if (v10 < 2)
      {
        int v33 = 0;
      }

      else
      {
        int v33 = 0;
        uint64_t v34 = &res_9_ns_datetosecs_days_per_month;
        do
        {
          int v35 = *v34++;
          v33 += v35;
          --v19;
        }

        while (v19);
      }

      int v36 = v32 + v31 + v27 + 86400 * (v33 + v14) - 86400;
      HIDWORD(v38) = -1030792151 * v6 + 85899344;
      LODWORD(v38) = HIDWORD(v38);
      unsigned int v37 = v38 >> 2;
      LODWORD(v38) = HIDWORD(v38);
      unsigned int v39 = v38 >> 4;
      BOOL v41 = (v37 <= 0x28F5C28 || (v6 & 3) != 0) && v39 >= 0xA3D70B;
      int v42 = v36 + 86400;
      if (v41) {
        int v42 = v36;
      }
      if (v10 > 2) {
        int v43 = v42;
      }
      else {
        int v43 = v36;
      }
      u_int32_t result = v43 + 31536000 * v6 - 1996377856;
      if (v6 >= 1971)
      {
        int v44 = 0;
        int v45 = 10 * v7 + (char)v8 - 2018;
        unsigned int v46 = 1970;
        do
        {
          if (100 * (v46 / 0x64) - 1970 != v44 && (((_BYTE)v44 + 70) & 3) == 0 || 400 * (v46 / 0x190) - 1970 == v44) {
            result += 86400;
          }
          ++v44;
          ++v46;
        }

        while (v45 != v44);
      }
    }
  }

  else
  {
LABEL_37:
    u_int32_t result = 0;
    *errp = 1;
  }

  return result;
}

int res_9_ns_name_ntop(const u_char *a1, char *a2, size_t a3)
{
  int v4 = &a2[a3];
  unsigned int v5 = *a1;
  if (*a1)
  {
    size_t v30 = a3;
    int v6 = a2;
    while (1)
    {
      if (v5 >= 0xC0) {
        goto LABEL_61;
      }
      unsigned int v7 = v5;
      int v8 = a2;
      if (v6 != a2)
      {
        if (v6 >= v4) {
          goto LABEL_61;
        }
        *int v6 = 46;
        unsigned int v7 = *a1;
        int v8 = v6 + 1;
      }

      uint64_t v9 = a1 + 1;
      if ((v7 & 0xC0) == 0x40)
      {
        if (v7 != 65) {
          goto LABEL_61;
        }
        unsigned int v7 = *v9 ? ((*v9 + 7) >> 3) + 1 : 33;
      }

      else if ((v7 & 0xC0) == 0xC0)
      {
        goto LABEL_61;
      }

      if (&v8[v7] >= v4) {
        goto LABEL_61;
      }
      if ((v5 & 0xC0) == 0x40) {
        break;
      }
      if (v7)
      {
        unsigned int v20 = v7 + 1;
        int v6 = v8;
        while (1)
        {
          int v22 = *v9++;
          int v21 = v22;
          uint64_t v23 = (1LL << (v22 - 34)) & 0x4000000420010C5LL;
          if ((v22 - 34) > 0x3A || v23 == 0)
          {
            if ((v21 - 127) > 0xFFFFFFA1)
            {
              if (v6 >= v4) {
                goto LABEL_61;
              }
              *v6++ = v21;
            }

            else
            {
              if (v6 + 3 >= v4) {
                goto LABEL_61;
              }
              *int v6 = 92;
              unsigned int v25 = (41 * v21) >> 12;
              v6[1] = digits[v25];
              v6[2] = digits[(v21 - 100 * v25) / 0xAu];
              v6[3] = digits[(v21 - 10 * ((205 * v21) >> 11))];
              v6 += 4;
            }
          }

          else
          {
            if (v6 + 1 >= v4) {
              goto LABEL_61;
            }
            *int v6 = 92;
            v6[1] = v21;
            v6 += 2;
          }
        }
      }

      int v6 = v8;
LABEL_53:
      unsigned int v5 = *v9;
      a1 = v9;
      if (!*v9)
      {
        a3 = v30;
        if (v6 != a2) {
          goto LABEL_59;
        }
        goto LABEL_57;
      }
    }

    if (v5 != 65)
    {
      uint64_t v28 = __error();
      int v29 = 22;
      goto LABEL_62;
    }

    unsigned int i = *v9;
    if (*v9) {
      unsigned int v11 = *v9;
    }
    else {
      unsigned int v11 = 256;
    }
    if (v11 <= 9) {
      int v12 = 7;
    }
    else {
      int v12 = 8;
    }
    if (v11 > 0x63) {
      int v12 = 9;
    }
    if (&v8[v12 + ((v11 + 3) >> 2)] >= v4) {
      goto LABEL_61;
    }
    *(_DWORD *)int v8 = 7887708;
    uint64_t v13 = v8 + 3;
    int v14 = a1 + 2;
    if (v11 >= 8)
    {
      for (unsigned int i = v11; i > 7; i -= 8)
      {
        int v15 = *v14++;
        v13 += sprintf(v13, "%02x", v15);
      }

      uint64_t v9 = v14 - 1;
    }

    if (i < 5)
    {
      if (!i)
      {
        uint64_t v9 = v14;
        goto LABEL_50;
      }

      int v16 = *v14 >> 4;
      int v17 = 15;
      char v18 = 4;
      uint64_t v19 = "%1x";
    }

    else
    {
      int v16 = *(char *)v14;
      int v17 = 255;
      char v18 = 8;
      uint64_t v19 = "%02x";
    }

    v9 += 2;
    v13 += sprintf(v13, v19, (v17 << (v18 - i)) & v16);
LABEL_50:
    int v26 = (_DWORD)v13 + sprintf(v13, "/%d]", v11) - (_DWORD)v8;
    if (v26 < 0) {
      goto LABEL_61;
    }
    int v6 = &v8[v26];
    goto LABEL_53;
  }

LABEL_57:
  *a2 = 46;
  int v6 = a2 + 1;
LABEL_59:
  if (v6 >= v4)
  {
LABEL_61:
    uint64_t v28 = __error();
    int v29 = 40;
LABEL_62:
    *uint64_t v28 = v29;
    return -1;
  }

  else
  {
    *int v6 = 0;
    return (_DWORD)v6 - (_DWORD)a2 + 1;
  }

    if (&v17[v39 + 1] >= v12) {
      break;
    }
    int v40 = (v39 + 1);
    memcpy(v17, v6, v40);
    v6 += v40;
    v17 += v40;
    if (!v39)
    {
      if (v17 <= v12) {
        return (_DWORD)v17 - v44;
      }
      break;
    }
  }

        unsigned int v25 = v36;
        if (v36 == -1)
        {
          if (v29)
          {
            uint64_t v34 = (__res_9_state *)a1;
            unsigned int v25 = 4;
          }

          else
          {
            if (!v28) {
              return 0xFFFFFFFFLL;
            }
LABEL_62:
            uint64_t v34 = (__res_9_state *)a1;
            unsigned int v25 = 2;
          }

int res_9_ns_name_pton(const char *a1, u_char *a2, size_t a3)
{
  int v4 = &a2[a3];
  unsigned int v5 = a2 + 1;
  int v6 = a2;
  do
  {
LABEL_2:
    unsigned int v7 = a1;
    while (2)
    {
      int v8 = v7 + 2;
      char v9 = 1;
      while (1)
      {
        int v11 = *a1++;
        int v10 = v11;
        if (!v11)
        {
          int v32 = (_DWORD)v5 + ~(_DWORD)v6;
          if ((v32 & 0xC0) == 0 && v6 < v4)
          {
            *int v6 = v32;
            if (!v32) {
              goto LABEL_73;
            }
            if (v5 < v4)
            {
              uint64_t v23 = v5++;
              goto LABEL_72;
            }
          }

LABEL_74:
          int v18 = 40;
          goto LABEL_75;
        }

        if ((v9 & 1) == 0) {
          break;
        }
        char v9 = 0;
        if (v10 != 92)
        {
          if (v10 != 46)
          {
            int v8 = a1;
            goto LABEL_17;
          }

          int v17 = (_DWORD)v5 + ~(_DWORD)v6;
          int v18 = 40;
          if ((v17 & 0xC0) != 0 || v6 >= v4) {
            goto LABEL_75;
          }
          *int v6 = v17;
          if (!*a1)
          {
            if (v17)
            {
              if (v5 >= v4) {
                goto LABEL_75;
              }
              *v5++ = 0;
            }

            if (v5 - a2 <= 255) {
              return 1;
            }
LABEL_75:
            *__error() = v18;
            return -1;
          }

          if (!v17 || *a1 == 46) {
            goto LABEL_75;
          }
          int v6 = v5++;
          goto LABEL_2;
        }
      }

      if (v10 != 91)
      {
        int v12 = (char *)memchr("0123456789", v10, 0xBuLL);
        if (v12)
        {
          if (!v7[2]) {
            goto LABEL_74;
          }
          uint64_t v13 = v12;
          int v14 = memchr("0123456789", v7[2], 0xBuLL);
          if (!v14) {
            goto LABEL_74;
          }
          if (!v7[3]) {
            goto LABEL_74;
          }
          int v15 = v14;
          int v16 = memchr("0123456789", v7[3], 0xBuLL);
          if (!v16) {
            goto LABEL_74;
          }
          int v10 = ((unint64_t)(0x6400000000LL * (void)&v13[-(int)"0123456789"]
                                  + 0xA00000000LL * (v15 - "0123456789")) >> 32)
              - "0123456789"
              + (_DWORD)v16;
          if (v10 > 255) {
            goto LABEL_74;
          }
          int v8 = v7 + 4;
        }

LABEL_17:
        if (v5 >= v4) {
          goto LABEL_74;
        }
        *v5++ = v10;
        unsigned int v7 = v8;
        a1 = v8;
        continue;
      }

      break;
    }

    uint64_t v19 = strchr(v7 + 2, 93);
    if (!v19) {
      goto LABEL_64;
    }
    unint64_t v20 = (unint64_t)(v19 + 2);
    __endptr = 0LL;
    if (v19 - v7 < 2) {
      goto LABEL_64;
    }
    if (v7[2] != 120) {
      goto LABEL_64;
    }
    int v21 = v7 + 3;
    int v22 = v7 + 1;
    int v18 = 40;
    if (v22 >= v19) {
      goto LABEL_75;
    }
    uint64_t v23 = v5 + 1;
    if (v5 + 1 >= v4) {
      goto LABEL_75;
    }
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    unsigned int v27 = 0LL;
    int v28 = 0;
    while (1)
    {
      int v29 = *v21;
      if (v29 == 47) {
        goto LABEL_37;
      }
      if (v29 == 93) {
        break;
      }
      if (v28)
      {
        if ((v29 & 0xFEu) - 48 > 9) {
          goto LABEL_64;
        }
        if (!v27)
        {
          if (v29 == 48) {
            goto LABEL_64;
          }
          int v28 = 1;
          unsigned int v27 = v21;
          goto LABEL_38;
        }

LABEL_37:
        int v28 = 1;
        goto LABEL_38;
      }

      int v26 = digitvalue[*v21] + 16 * v26;
      v24 += 4;
      v25 += 4;
      int v28 = 0;
      if (v25 == 8)
      {
        int v25 = 0;
        *v23++ = v26;
      }

int res_9_ns_name_ntol(const u_char *a1, u_char *a2, size_t a3)
{
  int v3 = (int)a2;
  unsigned int v4 = *a1;
  unsigned int v5 = a2;
  if (*a1)
  {
    int v6 = a1;
    unsigned int v7 = &a2[a3];
    uint64_t v8 = MEMORY[0x1895F8770];
    unsigned int v5 = a2;
    while (v4 < 0xC0)
    {
      *unsigned int v5 = v4;
      unsigned int v9 = *v6;
      if ((v9 & 0xC0) == 0x40)
      {
        if (v9 != 65) {
          break;
        }
        unsigned int v9 = v6[1] ? ((v6[1] + 7) >> 3) + 1 : 33;
      }

      else if ((v9 & 0xC0) == 0xC0)
      {
        break;
      }

      if (&(++v5)[v9] >= v7) {
        break;
      }
      ++v6;
      if (v9)
      {
        unsigned int v10 = v9 + 1;
        while (1)
        {
          int v11 = *(char *)v6;
          __darwin_ct_rune_t v12 = *v6;
          if (v11 < 0) {
            break;
          }
          if ((*(_DWORD *)(v8 + 4LL * *v6 + 60) & 0x8000) != 0) {
            goto LABEL_16;
          }
LABEL_17:
          *v5++ = v11;
          ++v6;
        }

        if (!__maskrune(*v6, 0x8000uLL)) {
          goto LABEL_17;
        }
LABEL_16:
        LOBYTE(v1_dns_print_resource_record_lock((uint64_t)r, f, 1) = __tolower(v12);
        goto LABEL_17;
      }

LABEL_21:
      unsigned int v4 = *v6;
      if (!*v6) {
        goto LABEL_22;
      }
    }

    *__error() = 40;
    return -1;
  }

  else
  {
LABEL_22:
    *unsigned int v5 = 0;
    return (_DWORD)v5 - v3 + 1;
  }

int res_9_ns_name_unpack(const u_char *a1, const u_char *a2, const u_char *a3, u_char *a4, size_t a5)
{
  if (a3 < a1 || (int v5 = (int)a3, a3 >= a2))
  {
LABEL_26:
    *__error() = 40;
    return -1;
  }

  unsigned int v7 = a4;
  unsigned int v8 = *a3;
  if (!*a3)
  {
    *a4 = 0;
    return 1;
  }

  int v10 = 0;
  int v11 = &a4[a5];
  __darwin_ct_rune_t v12 = a3 + 1;
  int64_t v13 = a2 - a1;
  int v14 = -1;
  do
  {
    unsigned int v15 = v8;
    int v16 = v8 & 0xC0;
    if ((v8 & 0xC0) == 0) {
      goto LABEL_12;
    }
    if (v16 != 192)
    {
      if (v16 != 64 || v8 != 65) {
        goto LABEL_26;
      }
      if (*v12) {
        unsigned int v15 = ((*v12 + 7) >> 3) + 1;
      }
      else {
        unsigned int v15 = 33;
      }
LABEL_12:
      uint64_t v17 = v15;
      unint64_t v18 = (unint64_t)&v12[v15];
      v10 += v15 + 1;
      *unsigned int v7 = v8;
      unint64_t v20 = (char *)(v7 + 1);
      memcpy(v20, v12, v15);
      unsigned int v7 = (u_char *)&v20[v17];
      int v21 = (unsigned __int8 *)v18;
      goto LABEL_23;
    }

    if (v12 >= a2) {
      goto LABEL_26;
    }
    int v22 = &a1[*v12 | ((unint64_t)(v8 & 0x3F) << 8)];
    if (v22 >= a2) {
      goto LABEL_26;
    }
    if (v14 < 0) {
      int v14 = (_DWORD)v12 - v5 + 1;
    }
    v10 += 2;
    if (v13 <= v10) {
      goto LABEL_26;
    }
    int v21 = (unsigned __int8 *)v22;
LABEL_23:
    unsigned int v23 = *v21;
    __darwin_ct_rune_t v12 = v21 + 1;
    unsigned int v8 = v23;
  }

  while (v23);
  *unsigned int v7 = 0;
  if (v14 < 0) {
    return (_DWORD)v12 - v5;
  }
  return v14;
}

int res_9_ns_name_pack(const u_char *a1, u_char *a2, int a3, const u_char **a4, const u_char **a5)
{
  int v5 = a4;
  int v6 = a1;
  if (a4)
  {
    unsigned int v8 = a4 + 1;
    unsigned int v7 = *a4;
    if (*a4)
    {
      do
      {
        unsigned int v9 = v5[1];
        ++v5;
      }

      while (v9);
    }

    else
    {
      int v5 = 0LL;
    }
  }

  else
  {
    unsigned int v8 = 0LL;
    unsigned int v7 = 0LL;
  }

  int v10 = 0;
  int v11 = a1;
  __darwin_ct_rune_t v12 = &a2[a3];
  do
  {
    unsigned int v13 = *v11;
    if (v13 >= 0xC0) {
      goto LABEL_67;
    }
    if ((v13 & 0xC0) == 0x40)
    {
      if (v13 != 65)
      {
        int v42 = __error();
        int v43 = 22;
        goto LABEL_68;
      }

      if (v11[1]) {
        unsigned int v14 = ((v11[1] + 7) >> 3) + 1;
      }
      else {
        unsigned int v14 = 33;
      }
    }

    else
    {
      unsigned int v14 = *v11;
    }

    unsigned int v15 = v14 + 1;
    v10 += v15;
    if (v10 >= 256) {
      goto LABEL_67;
    }
    v11 += v15;
  }

  while (v13);
  int v44 = (int)a2;
  int v45 = a5 - 1;
  int v16 = 1;
  uint64_t v17 = a2;
  unint64_t v18 = v5;
  while (1)
  {
    unsigned int v19 = *v6;
    if (v7 && *v6)
    {
      if (v8 < v5)
      {
        unint64_t v20 = v8;
        int v21 = v16;
        do
        {
          int v22 = *v20;
          int v23 = **v20;
          if ((v23 - 1) <= 0x3E)
          {
            while (2)
            {
              int v24 = (_DWORD)v22 - (_DWORD)v7;
              if (v22 - v7 < 0x4000)
              {
                int v25 = v6;
                int v26 = v22;
LABEL_25:
                while (1)
                {
                  int v27 = *v26;
                  if (!*v26) {
                    break;
                  }
                  int v28 = (unsigned __int8 *)(v26 + 1);
                  if ((v27 & 0xC0) != 0xC0)
                  {
                    if ((v27 & 0xC0) != 0)
                    {
                      int v38 = 40;
                      goto LABEL_43;
                    }

                    if (v27 == *v25)
                    {
                      uint64_t v29 = (v27 - 1);
                      v26 += v29 + 2;
                      int v30 = (unsigned __int8 *)&v25[v29 + 2];
                      int v31 = (unsigned __int8 *)(v25 + 1);
                      while (1)
                      {
                        int v33 = *v31++;
                        int v32 = v33;
                        int v34 = v33 + 32;
                        int v35 = *v28;
                        if (v32 != v35) {
                          break;
                        }
                        ++v28;
                        if (!--v27)
                        {
                          int v25 = v30;
                          if (*v30) {
                            goto LABEL_25;
                          }
                          if (*v26) {
                            goto LABEL_39;
                          }
                          if (v24 < 0) {
                            goto LABEL_44;
                          }
                          if (v17 + 1 < v12)
                          {
                            u_char *v17 = BYTE1(v24) | 0xC0;
                            v17[1] = v24;
                            return (_DWORD)v17 - v44 + 2;
                          }

                          goto LABEL_65;
                        }
                      }
                    }

                    break;
                  }

                  int v26 = &v7[*v28 | ((unint64_t)(v27 & 0x3F) << 8)];
                }

LABEL_65:
  if (v7) {
    *int v5 = 0LL;
  }
LABEL_67:
  int v42 = __error();
  int v43 = 40;
LABEL_68:
  *int v42 = v43;
  return -1;
}

    while (1)
    {
      unsigned int v7 = *v8;
      if (!*v8) {
        break;
      }
      if (v7 == 9 || v7 == 32) {
        goto LABEL_5;
      }
      ++v8;
    }
  }

  return result;
}

      _res_9_h_errno_set(v40, v26);
      return 0xFFFFFFFFLL;
    }

int res_9_ns_name_uncompress(const u_char *a1, const u_char *a2, const u_char *a3, char *a4, size_t a5)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int result = res_9_ns_name_unpack(a1, a2, a3, v9, 0xFFuLL);
  if (result != -1)
  {
    int v8 = result;
    if (res_9_ns_name_ntop(v9, a4, a5) == -1) {
      return -1;
    }
    else {
      return v8;
    }
  }

  return result;
}

int res_9_ns_name_compress(const char *a1, u_char *a2, size_t a3, const u_char **a4, const u_char **a5)
{
  int v7 = a3;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int result = res_9_ns_name_pton(a1, v10, 0xFFuLL);
  if (result != -1) {
    return res_9_ns_name_pack(v10, a2, v7, a4, a5);
  }
  return result;
}

void res_9_ns_name_rollback(const u_char *a1, const u_char **a2, const u_char **a3)
{
  while (a2 < a3 && *a2)
  {
    if (*a2 >= a1)
    {
      *a2 = 0LL;
      return;
    }

    ++a2;
  }

int res_9_ns_name_skip(const u_char **a1, const u_char *a2)
{
  int v2 = *a1;
  if (*a1 < a2)
  {
    unsigned int v3 = 0;
    do
    {
      unsigned int v4 = v2 + 1;
      uint64_t v5 = *v2;
      if (!*v2)
      {
        ++v2;
        break;
      }

      int v6 = v5 & 0xC0;
      if ((v5 & 0xC0) != 0)
      {
        if (v6 != 64)
        {
          if (v6 != 192) {
            goto LABEL_19;
          }
          v2 += 2;
          break;
        }

        if (v4 < a2)
        {
          if ((_DWORD)v5 != 65) {
            goto LABEL_19;
          }
          if (*v4) {
            unsigned int v3 = ((*v4 + 7) >> 3) + 1;
          }
          else {
            unsigned int v3 = 33;
          }
        }

        int v2 = &v4[v3];
      }

      else
      {
        int v2 = &v4[v5];
      }
    }

    while (v2 < a2);
  }

  if (v2 <= a2)
  {
    int v7 = 0;
    *a1 = v2;
  }

  else
  {
LABEL_19:
    *__error() = 40;
    return -1;
  }

  return v7;
}

u_int res_9_ns_get16(const u_char *a1)
{
  return __rev16(*(unsigned __int16 *)a1);
}

u_long res_9_ns_get32(const u_char *a1)
{
  return bswap32(*(_DWORD *)a1);
}

void res_9_ns_put16(u_int a1, u_char *a2)
{
  *(_WORD *)a2 = bswap32(a1) >> 16;
}

void res_9_ns_put32(u_long a1, u_char *a2)
{
  *(_DWORD *)a2 = bswap32(a1);
}

int res_9_ns_msg_getflag(res_9_ns_msg *a1, int a2)
{
  return (_res_9_ns_flagdata[a2].mask & a1->_flags) >> _res_9_ns_flagdata[a2].shift;
}

int res_9_ns_skiprr(const u_char *a1, const u_char *a2, res_9_ns_sect a3, int a4)
{
  int v5 = (int)a1;
  int v6 = a1;
  if (a4 >= 1)
  {
    int v8 = a4 + 1;
    int v6 = a1;
    do
    {
      int v9 = res_9_dn_skipname(v6, a2);
      if (v9 < 0) {
        goto LABEL_9;
      }
      v6 += (v9 + 4);
      if (a3)
      {
        if (v6 + 6 > a2) {
          goto LABEL_9;
        }
        v6 += __rev16(*((unsigned __int16 *)v6 + 2)) + 6;
      }
    }

    while (--v8 > 1);
  }

  if (v6 > a2)
  {
LABEL_9:
    *__error() = 40;
    return -1;
  }

  return (_DWORD)v6 - v5;
}

int res_9_ns_initparse(const u_char *a1, int a2, res_9_ns_msg *a3)
{
  *(void *)&__int128 v3 = 0x5E5E5E5E5E5E5E5ELL;
  *((void *)&v3 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0x5E5E5E5E5E5E5E5ELL;
  *(_OWORD *)&a3->_sections[2] = v3;
  *(_OWORD *)&a3->_sect = v3;
  unsigned int v4 = &a1[a2];
  *(_OWORD *)&a3->_id = v3;
  *(_OWORD *)a3->_sections = v3;
  *(_OWORD *)&a3->_msg = v3;
  a3->_msg = a1;
  a3->_eom = v4;
  if (a2 > 1)
  {
    a3->_id = bswap32(*(unsigned __int16 *)a1) >> 16;
    if (a2 > 3)
    {
      uint64_t v7 = 0LL;
      a3->_flags = bswap32(*((unsigned __int16 *)a1 + 1)) >> 16;
      while (&a1[v7 * 2 + 6] <= v4)
      {
        a3->_counts[v7] = _byteswap_ushort(*(_WORD *)&a1[v7 * 2 + 4]);
        if (++v7 == 4)
        {
          uint64_t v8 = 0LL;
          counts = a3->_counts;
          uint64_t v10 = a1 + 12;
          do
          {
            if (counts[v8])
            {
              unsigned int v11 = res_9_ns_skiprr(v10, v4, (res_9_ns_sect)v8, counts[v8]);
              if ((v11 & 0x80000000) != 0) {
                return -1;
              }
              *(void *)&counts[4 * v8 + 6] = v10;
              v10 += v11;
            }

            else
            {
              *(void *)&counts[4 * v8 + 6] = 0LL;
            }

            ++v8;
          }

          while (v8 != 4);
          if (v10 == v4)
          {
            int result = 0;
            *(void *)&a3->_sect = 0xFFFFFFFF00000004LL;
            a3->_msg_ptr = 0LL;
            return result;
          }

          break;
        }
      }
    }
  }

  *__error() = 40;
  return -1;
}

int res_9_ns_parserr(res_9_ns_msg *a1, res_9_ns_sect a2, int a3, res_9_ns_rr *a4)
{
  if (a2 >= ns_s_max) {
    goto LABEL_20;
  }
  int rrnum = a3;
  if (a1->_sect != a2)
  {
    uint64_t v8 = a1->_sections[a2];
    a1->_sect = a2;
    a1->_int rrnum = 0;
    a1->_msg_ptr = v8;
  }

  if (a3 == -1)
  {
    int rrnum = a1->_rrnum;
    if (rrnum < 0)
    {
LABEL_20:
      int v22 = __error();
      int v23 = 19;
      goto LABEL_21;
    }
  }

  else if (a3 < 0)
  {
    goto LABEL_20;
  }

  int v9 = (char *)a1 + 2 * a2;
  unsigned int v11 = *((unsigned __int16 *)v9 + 10);
  uint64_t v10 = (unsigned __int16 *)(v9 + 20);
  if (rrnum >= v11) {
    goto LABEL_20;
  }
  int v12 = a1->_rrnum;
  if (rrnum < v12)
  {
    int v12 = 0;
    unsigned int v13 = a1->_sections[a2];
    a1->_sect = a2;
    a1->_int rrnum = 0;
    a1->_msg_ptr = v13;
  }

  msg_ptr = a1->_msg_ptr;
  if (rrnum > v12)
  {
    int v15 = res_9_ns_skiprr(a1->_msg_ptr, a1->_eom, a2, rrnum - v12);
    if (v15 < 0) {
      return -1;
    }
    msg_ptr = &a1->_msg_ptr[v15];
    a1->_msg_ptr = msg_ptr;
    a1->_int rrnum = rrnum;
  }

  int v16 = res_9_dn_expand(a1->_msg, a1->_eom, msg_ptr, a4->name, 1025);
  if (v16 < 0) {
    return -1;
  }
  uint64_t v17 = &a1->_msg_ptr[v16];
  a1->_msg_ptr = v17;
  eom = a1->_eom;
  if (v17 + 4 > eom)
  {
LABEL_19:
    int v22 = __error();
    int v23 = 40;
LABEL_21:
    *int v22 = v23;
    return -1;
  }

  a4->type = bswap32(*(unsigned __int16 *)v17) >> 16;
  a1->_msg_ptr = v17 + 2;
  a4->rr_class = bswap32(*((unsigned __int16 *)v17 + 1)) >> 16;
  a1->_msg_ptr = v17 + 4;
  if (a2)
  {
    unsigned int v19 = v17 + 10;
    if (v17 + 10 > eom) {
      goto LABEL_19;
    }
    a4->ttl = bswap32(*((_DWORD *)v17 + 1));
    a1->_msg_ptr = v17 + 8;
    uint64_t v20 = __rev16(*((unsigned __int16 *)v17 + 4));
    a4->rdlength = v20;
    a1->_msg_ptr = v19;
    int v21 = &v19[v20];
    if (v21 > eom) {
      goto LABEL_19;
    }
    a4->rdata = v19;
    a1->_msg_ptr = v21;
  }

  else
  {
    a4->ttl = 0;
    a4->rdlength = 0;
    a4->rdata = 0LL;
  }

  int v25 = a1->_rrnum;
  a1->_int rrnum = v25 + 1;
  if (v25 < *v10) {
    return 0;
  }
  a1->_sect = a2 + 1;
  if (a2 == ns_s_ar)
  {
    int v26 = 0LL;
    int v27 = -1;
  }

  else
  {
    int v27 = 0;
    int v26 = a1->_sections[a2 + 1];
  }

  int result = 0;
  a1->_int rrnum = v27;
  a1->_msg_ptr = v26;
  return result;
}

int res_9_ns_sprintrr( const res_9_ns_msg *a1, const res_9_ns_rr *a2, const char *a3, const char *a4, char *a5, size_t a6)
{
  if (a2->name[0]) {
    int v6 = a2;
  }
  else {
    int v6 = (const res_9_ns_rr *)".";
  }
  return res_9_ns_sprintrrf( a1->_msg,  a1->_eom - a1->_msg,  v6->name,  (res_9_ns_class)a2->rr_class,  (ns_type)a2->type,  a2->ttl,  a2->rdata,  a2->rdlength,  a3,  a4,  a5,  a6);
}

int res_9_ns_sprintrrf( const u_char *a1, size_t a2, const char *a3, res_9_ns_class a4, ns_type a5, u_long a6, const u_char *a7, size_t a8, const char *a9, const char *a10, char *__s, size_t a12)
{
  uint64_t v12 = MEMORY[0x1895F8858](a1, a2, a3, *(void *)&a4, *(void *)&a5, a6, a7, a8);
  unint64_t v15 = v14;
  uint64_t v17 = v16;
  u_long v19 = v18;
  int v21 = v20;
  int v23 = v22;
  int v24 = (char *)v13;
  uint64_t v26 = v25;
  int v27 = (const u_char *)v12;
  int v28 = (int)__s;
  uint64_t v153 = *MEMORY[0x1895F89C0];
  binary = v16;
  if (a9 && res_9_ns_samename(a9, v13) == 1)
  {
    if (addstr("\t\t\t") < 0) {
      return -1;
    }
    uint64_t v146 = v26;
    v147 = v27;
    goto LABEL_19;
  }

  uint64_t v146 = v26;
  v147 = v27;
  uint64_t v29 = prune_origin(v24, (char *)a10);
  uint64_t v30 = v29;
  if (!*v24)
  {
LABEL_14:
    if (addstr(".") < 0) {
      return -1;
    }
    unint64_t v31 = (int)v30 + 1;
LABEL_16:
    int v32 = addtab(v31, 24LL, 0, (uint64_t *)&__s, (uint64_t *)&a12);
    if (v32 < 0) {
      return -1;
    }
    goto LABEL_20;
  }

  if ((_DWORD)v29)
  {
    unint64_t v31 = (int)v29;
    if (addstr(v24) < 0) {
      return -1;
    }
    goto LABEL_14;
  }

  if (addstr("@\t\t\t") < 0) {
    return -1;
  }
LABEL_19:
  int v32 = 0;
LABEL_20:
  int v145 = v28;
  int v33 = __s;
  size_t v34 = a12;
  unsigned int v35 = res_9_ns_format_ttl(v19, __s, a12);
  if ((v35 & 0x80000000) == 0)
  {
    unsigned int v36 = v35;
    if (v34 >= v35)
    {
      __s = &v33[v35];
      a12 = v34 - v35;
    }

    int v37 = res_9_p_class(v23);
    int v38 = res_9_p_type(v21);
    int v39 = __sprintf_chk(v152, 0, 0x64uLL, " %s %s", v37, v38);
    if ((addstr(v152) & 0x80000000) == 0)
    {
      if (!v15) {
        return (_DWORD)__s - v145;
      }
      if ((addtab((int)(v39 + v36), 16LL, v32, (uint64_t *)&__s, (uint64_t *)&a12) & 0x80000000) == 0)
      {
        size_t v40 = &v17[v15];
        BOOL v41 = "unknown RR type";
        switch(v21)
        {
          case 1:
            if (v15 != 4) {
              goto LABEL_214;
            }
            int v52 = binary;
            int v53 = __s;
            socklen_t v54 = a12;
            int v55 = 2;
            goto LABEL_133;
          case 2:
          case 5:
          case 7:
          case 8:
          case 9:
          case 12:
          case 39:
            goto LABEL_27;
          case 3:
          case 4:
          case 10:
          case 23:
          case 27:
          case 31:
          case 32:
          case 34:
          case 36:
          case 40:
            goto LABEL_215;
          case 6:
            if ((addname(v147, v146, (const u_char **)&binary, (char *)a10, &__s, (uint64_t *)&a12) & 0x80000000) != 0 {
              || addstr(" ") < 0
            }
              || (addname(v147, v146, (const u_char **)&binary, (char *)a10, &__s, (uint64_t *)&a12) & 0x80000000) != 0
              || addstr(" (\n") < 0)
            {
              return -1;
            }

            if (v40 - binary != 20) {
              goto LABEL_214;
            }
            u_long v56 = res_9_ns_get32(binary);
            binary += 4;
            if (addstr("\t\t\t\t\t") < 0) {
              return -1;
            }
            unint64_t v57 = __sprintf_chk(v152, 0, 0x64uLL, "%lu", v56);
            if (addstr(v152) < 0) {
              return -1;
            }
            if (addstr("; serial\n") < 0) {
              return -1;
            }
            u_long v58 = res_9_ns_get32(binary);
            binary += 4;
            if (addstr("\t\t\t\t\t") < 0) {
              return -1;
            }
            unsigned int v59 = res_9_ns_format_ttl(v58, __s, a12);
            if ((v59 & 0x80000000) != 0) {
              return -1;
            }
            if (a12 >= v59)
            {
              __s += v59;
              a12 -= v59;
            }

            if (addstr("; refresh\n") < 0) {
              return -1;
            }
            u_long v60 = res_9_ns_get32(binary);
            binary += 4;
            if (addstr("\t\t\t\t\t") < 0) {
              return -1;
            }
            unsigned int v61 = res_9_ns_format_ttl(v60, __s, a12);
            if ((v61 & 0x80000000) != 0) {
              return -1;
            }
            if (a12 >= v61)
            {
              __s += v61;
              a12 -= v61;
            }

            if (addstr("; retry\n") < 0) {
              return -1;
            }
            u_long v62 = res_9_ns_get32(binary);
            binary += 4;
            if (addstr("\t\t\t\t\t") < 0) {
              return -1;
            }
            unsigned int v63 = res_9_ns_format_ttl(v62, __s, a12);
            if ((v63 & 0x80000000) != 0) {
              return -1;
            }
            if (a12 >= v63)
            {
              __s += v63;
              a12 -= v63;
            }

            if (addstr("; expiry\n") < 0) {
              return -1;
            }
            u_long v64 = res_9_ns_get32(binary);
            binary += 4;
            if (addstr("\t\t\t\t\t") < 0) {
              return -1;
            }
            unsigned int v65 = res_9_ns_format_ttl(v64, __s, a12);
            if ((v65 & 0x80000000) != 0) {
              return -1;
            }
            unint64_t v66 = v65;
            if (a12 >= v65)
            {
              __s += v65;
              a12 -= v65;
            }

            v67 = "; minimum\n";
            goto LABEL_177;
          case 11:
            if (v15 < 5) {
              goto LABEL_214;
            }
            inet_ntop(2, binary, __s, a12);
            size_t v68 = strlen(__s);
            if (a12 >= v68)
            {
              __s += v68;
              a12 -= v68;
            }

            binary += 4;
            __sprintf_chk(v152, 0, 0x64uLL, " %u(", *binary);
            if (addstr(v152) < 0) {
              return -1;
            }
            int v69 = binary + 1;
            binary = v69;
            if (v69 >= v40) {
              goto LABEL_95;
            }
            int v70 = 0;
            int v71 = 0;
            do
            {
              binary = v69 + 1;
              u_char v72 = *v69;
              do
              {
                if ((v72 & 0x80) != 0)
                {
                  if (!v71)
                  {
                    if (addstr("\n\t\t\t\t") < 0) {
                      return -1;
                    }
                    int v71 = 10;
                  }

                  __sprintf_chk(v152, 0, 0x64uLL, "%d ", v70);
                  if (addstr(v152) < 0) {
                    return -1;
                  }
                  --v71;
                }

                v72 *= 2;
                ++v70;
              }

              while ((v70 & 7) != 0);
              int v69 = binary;
            }

            while (binary < v40);
LABEL_95:
            v67 = ")";
            goto LABEL_177;
          case 13:
          case 20:
            unsigned int v50 = charstr(binary, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
            if ((v50 & 0x80000000) != 0) {
              return -1;
            }
            if (!v50) {
              goto LABEL_214;
            }
            binary += v50;
            if (addstr(" ") < 0) {
              return -1;
            }
            int v51 = binary;
            if (v21 == 20 && binary == v40) {
              return (_DWORD)__s - v145;
            }
LABEL_106:
            int v75 = charstr(v51, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
            if (v75 < 0) {
              return -1;
            }
            if (!v75) {
              goto LABEL_214;
            }
            return (_DWORD)__s - v145;
          case 14:
          case 17:
            goto LABEL_128;
          case 15:
          case 18:
          case 21:
            if (v15 < 2) {
              goto LABEL_214;
            }
            u_int v45 = res_9_ns_get16(binary);
            binary += 2;
            __sprintf_chk(v152, 0, 0x64uLL, "%u ", v45);
            unsigned int v46 = v152;
            goto LABEL_149;
          case 16:
            v73 = binary;
            if (binary >= v40) {
              return (_DWORD)__s - v145;
            }
            BOOL v41 = "RR format error";
            while (2)
            {
              int v74 = charstr(v73, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
              if (v74 < 0) {
                return -1;
              }
              if (v74)
              {
                v73 = &binary[v74];
                binary = v73;
                if (v73 < v40)
                {
                  if (addstr(" ") < 0) {
                    return -1;
                  }
                  v73 = binary;
                }

                if (v73 >= v40) {
                  return (_DWORD)__s - v145;
                }
                continue;
              }

              break;
            }

LABEL_215:
            __sprintf_chk(v152, 0, 0x64uLL, "\\# %u (\t; %s", (_DWORD)v40 - (_DWORD)binary, v41);
            if (addstr(v152) < 0) {
              return -1;
            }
            int v134 = v145;
            if (binary < v40)
            {
              uint64_t v135 = MEMORY[0x1895F8770];
              do
              {
                v136 = &v152[__sprintf_chk(v152, 0, 0x64uLL, "\n\t")];
                if (v40 - binary >= 16) {
                  int v137 = 16;
                }
                else {
                  int v137 = (_DWORD)v40 - (_DWORD)binary;
                }
                if (v137 >= 1)
                {
                }

                int64_t v139 = v136 - v152;
                if (addstr(v152) < 0) {
                  return -1;
                }
                if (v137 >= 16)
                {
                  v140 = &v152[__sprintf_chk(v152, 0, 0x64uLL, "; ")];
                  int v134 = v145;
                }

                else
                {
                  int v134 = v145;
                  if (addstr(")") < 0 {
                    || (addtab(v139 + 1, 48LL, 0, (uint64_t *)&__s, (uint64_t *)&a12) & 0x80000000) != 0)
                  }
                  {
                    return -1;
                  }

                  v140 = &v152[__sprintf_chk(v152, 0, 0x64uLL, "; ")];
                  if (v137 < 1) {
                    goto LABEL_238;
                  }
                }

                v141 = binary;
                uint64_t v142 = v137;
                do
                {
                  int v144 = (char)*v141++;
                  unsigned __int8 v143 = v144;
                  if (v144 < 0)
                  {
                    unsigned __int8 v143 = 46;
                  }

                  else if ((*(_DWORD *)(v135 + 4LL * v143 + 60) & 0x40000) == 0)
                  {
                    unsigned __int8 v143 = 46;
                  }

                  *v140++ = v143;
                  --v142;
                }

                while (v142);
LABEL_238:
                if (addstr(v152) < 0) {
                  return -1;
                }
                binary += v137;
              }

              while (binary < v40);
            }

            return (_DWORD)__s - v134;
          case 19:
            int v51 = binary;
            goto LABEL_106;
          case 22:
            inet_nsap_ntoa(v15, binary, ascii);
            goto LABEL_137;
          case 24:
            if (v15 < 0x16) {
              goto LABEL_214;
            }
            u_int v76 = res_9_ns_get16(binary);
            v77 = binary;
            binary += 3;
            int v78 = v77[2];
            binary = v77 + 4;
            unsigned int v79 = v77[3];
            u_long v80 = res_9_ns_get32(v77 + 4);
            binary += 4;
            v81 = res_9_p_type(v76);
            __sprintf_chk(v152, 0, 0x64uLL, "%s %d %d %lu ", v81, v78, v79, v80);
            if (addstr(v152) < 0) {
              return -1;
            }
            if (res_9_dn_count_labels(v24) < v79) {
              goto LABEL_214;
            }
            u_long v82 = res_9_ns_get32(binary);
            binary += 4;
            v83 = res_9_p_secstodate(v82);
            __sprintf_chk(v152, 0, 0x64uLL, "%s ", v83);
            if (addstr(v152) < 0) {
              return -1;
            }
            u_long v84 = res_9_ns_get32(binary);
            binary += 4;
            v85 = res_9_p_secstodate(v84);
            __sprintf_chk(v152, 0, 0x64uLL, "%s ", v85);
            if (addstr(v152) < 0) {
              return -1;
            }
            u_int v86 = res_9_ns_get16(binary);
            binary += 2;
            __sprintf_chk(v152, 0, 0x64uLL, "%u ", v86);
            if (addstr(v152) < 0
              || (addname(v147, v146, (const u_char **)&binary, (char *)a10, &__s, (uint64_t *)&a12) & 0x80000000) != 0)
            {
              return -1;
            }

            int v87 = res_9_b64_ntop(binary, v40 - binary, ascii, 0x1A9CuLL);
            int v88 = v87;
            if (v87 < 16)
            {
              if (v87 < 0) {
                goto LABEL_214;
              }
              if (!v87) {
                return (_DWORD)__s - v145;
              }
              v89 = " ";
            }

            else
            {
              if (addstr(" (") < 0) {
                return -1;
              }
              v89 = "\n\t\t";
            }

            strlen(v89);
            uint64_t v132 = 0LL;
            int v133 = v88;
            do
            {
              if (addstr(v89) < 0 || addstr(&ascii[v132]) < 0) {
                return -1;
              }
              v132 += 48LL;
              v133 -= 48;
            }

            while (v88 > (int)v132);
            if (v88 < 16) {
              return (_DWORD)__s - v145;
            }
            goto LABEL_204;
          case 25:
            if (v15 < 4) {
              goto LABEL_214;
            }
            res_9_dst_s_dns_key_id((unsigned __int16 *)binary, (_DWORD)v40 - (_DWORD)binary);
            u_int v90 = res_9_ns_get16(binary);
            v91 = binary;
            binary += 3;
            int v92 = v91[2];
            binary = v91 + 4;
            __sprintf_chk(v152, 0, 0x64uLL, "0x%04x %u %u", v90, v92, v91[3]);
            if (addstr(v152) < 0) {
              return -1;
            }
            unsigned int v93 = res_9_b64_ntop(binary, v40 - binary, ascii, 0x1A9CuLL);
            if ((v93 & 0x80000000) != 0) {
              goto LABEL_214;
            }
            int v94 = v93;
            if (v93 < 0x10)
            {
              if (!v93) {
                goto LABEL_196;
              }
              v95 = " ";
            }

            else
            {
              if (addstr(" (") < 0)
                return -1;
              v95 = "\n\t\t";
            }

            strlen(v95);
            uint64_t v128 = 0LL;
            int v129 = v94;
            do
            {
              if (addstr(v95) < 0 || addstr(&ascii[v128]) < 0) {
                return -1;
              }
              v128 += 48LL;
              v129 -= 48;
            }

            while (v94 > (int)v128);
            if (v94 < 0x10 || (addstr(")") & 0x80000000) == 0)
            {
LABEL_196:
              __sprintf_chk(v152, 0, 0x64uLL, " ; key_tag= %u");
              goto LABEL_176;
            }

            break;
          case 26:
            if (v15 < 2) {
              goto LABEL_214;
            }
            u_int v96 = res_9_ns_get16(binary);
            binary += 2;
            __sprintf_chk(v152, 0, 0x64uLL, "%u ", v96);
            if (addstr(v152) < 0) {
              return -1;
            }
LABEL_128:
            if ((addname(v147, v146, (const u_char **)&binary, (char *)a10, &__s, (uint64_t *)&a12) & 0x80000000) != 0
              || addstr(" ") < 0)
            {
              return -1;
            }

            int v42 = v147;
            uint64_t v43 = v146;
            goto LABEL_28;
          case 28:
            if (v15 != 16) {
              goto LABEL_214;
            }
            int v52 = binary;
            int v53 = __s;
            socklen_t v54 = a12;
            int v55 = 30;
LABEL_133:
            inet_ntop(v55, v52, v53, v54);
            goto LABEL_134;
          case 29:
            res_9_loc_ntoa(binary, ascii);
LABEL_137:
            strlen(ascii);
            v67 = ascii;
            goto LABEL_177;
          case 30:
            int v98 = (_DWORD)v40 - (_DWORD)binary;
            unsigned int v99 = 0;
            int v100 = 8 * v98;
            if (v100 <= 1) {
              int v101 = 1;
            }
            else {
              int v101 = v100;
            }
            while (1)
            {
              if (((binary[(unint64_t)v99 >> 3] << (v99 & 7)) & 0x80) != 0)
              {
                v102 = res_9_p_type(v99);
                __sprintf_chk(v152, 0, 0x64uLL, " %s", v102);
                if (addstr(v152) < 0) {
                  break;
                }
              }

              if (v101 == ++v99) {
                return (_DWORD)__s - v145;
              }
            }

            return -1;
          case 33:
            if (v15 < 6) {
              goto LABEL_214;
            }
            u_int v103 = res_9_ns_get16(binary);
            binary += 2;
            u_int v104 = res_9_ns_get16(binary);
            binary += 2;
            u_int v105 = res_9_ns_get16(binary);
            binary += 2;
            __sprintf_chk(ascii, 0, 0x32uLL, "%u %u %u ", v103, v104, v105);
            unsigned int v46 = ascii;
            goto LABEL_149;
          case 35:
            if (v15 < 4) {
              goto LABEL_214;
            }
            u_int v106 = res_9_ns_get16(binary);
            binary += 2;
            u_int v107 = res_9_ns_get16(binary);
            binary += 2;
            __sprintf_chk(ascii, 0, 0x32uLL, "%u %u ", v106, v107);
            if (addstr(ascii) < 0) {
              return -1;
            }
            unsigned int v108 = charstr(binary, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
            if ((v108 & 0x80000000) != 0) {
              return -1;
            }
            if (!v108) {
              goto LABEL_214;
            }
            binary += v108;
            if (addstr(" ") < 0) {
              return -1;
            }
            unsigned int v109 = charstr(binary, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
            if ((v109 & 0x80000000) != 0) {
              return -1;
            }
            if (!v109) {
              goto LABEL_214;
            }
            binary += v109;
            if (addstr(" ") < 0) {
              return -1;
            }
            unsigned int v110 = charstr(binary, (unint64_t)v40, (uint64_t *)&__s, (uint64_t *)&a12);
            if ((v110 & 0x80000000) != 0) {
              return -1;
            }
            if (!v110) {
              goto LABEL_214;
            }
            binary += v110;
            unsigned int v46 = " ";
LABEL_149:
            if (addstr(v46) < 0) {
              return -1;
            }
LABEL_27:
            int v42 = v147;
            uint64_t v43 = v146;
LABEL_28:
            int v44 = (char *)a10;
LABEL_29:
            return (_DWORD)__s - v145;
          case 37:
            u_int v111 = res_9_ns_get16(binary);
            binary += 2;
            u_int v112 = res_9_ns_get16(binary);
            v113 = binary;
            binary += 3;
            __sprintf_chk(v149, 0, 0x28uLL, "%d %d %d ", v111, v112, v113[2]);
            if (addstr(v149) < 0) {
              return -1;
            }
            unint64_t v114 = (unsigned __int128)(4 * (v40 - binary) * (__int128)0x5555555555555556LL) >> 64;
            size_t v115 = v114 + (v114 >> 63) + 4;
            if (v115 >= 0x1801)
            {
              v67 = "record too long to print";
              goto LABEL_177;
            }

            unsigned int v125 = res_9_b64_ntop(binary, v40 - binary, ascii, v115);
            if ((v125 & 0x80000000) != 0)
            {
LABEL_214:
              BOOL v41 = "RR format error";
              goto LABEL_215;
            }

            int v126 = v125;
            if (v125 < 0x10)
            {
              if (!v125) {
                return (_DWORD)__s - v145;
              }
              v127 = " ";
            }

            else
            {
              if (addstr(" (") < 0)
                return -1;
              v127 = "\n\t\t";
            }

            strlen(v127);
            uint64_t v130 = 0LL;
            int v131 = v126;
            while ((addstr(v127) & 0x80000000) == 0 && (addstr(&ascii[v130]) & 0x80000000) == 0)
            {
              v130 += 48LL;
              v131 -= 48;
              if (v126 <= (int)v130)
              {
LABEL_204:
                v67 = ")";
LABEL_177:
                if (addstr(v67) < 0) {
                  return -1;
                }
                return (_DWORD)__s - v145;
              }
            }

            return -1;
          case 38:
            __sprintf_chk(v152, 0, 0x64uLL, "%d ", *binary);
            if (addstr(v152) < 0) {
              return -1;
            }
            unint64_t v116 = *binary;
            v117 = ++binary;
            if ((v116 & 0x80) != 0) {
              goto LABEL_172;
            }
            if (&v117[v116 >> 3] >= v40) {
              goto LABEL_214;
            }
            *(void *)asciuint64_t i = 0LL;
            uint64_t v151 = 0LL;
            size_t v118 = 16 - (v116 >> 3);
            memcpy(&ascii[v116 >> 3], v117, v118);
            inet_ntop(30, ascii, __s, a12);
            size_t v119 = strlen(__s);
            if (a12 >= v119)
            {
              __s += v119;
              a12 -= v119;
            }

            v117 = &binary[v118];
            binary += v118;
            if (!(_DWORD)v116) {
              return (_DWORD)__s - v145;
            }
LABEL_172:
            if (v117 >= v40) {
              goto LABEL_214;
            }
            if (addstr(" ") < 0) {
              return -1;
            }
            int v42 = v147;
            uint64_t v43 = v146;
            int v44 = (char *)a10;
            goto LABEL_29;
          case 41:
            __sprintf_chk(v152, 0, 0x64uLL, "%u bytes");
            goto LABEL_176;
          default:
            if (v21 == 249)
            {
              if (addstr(" ") < 0) {
                return -1;
              }
              u_long v121 = res_9_ns_get32(binary);
              binary += 4;
              v122 = res_9_p_secstodate(v121);
              __sprintf_chk(v152, 0, 0x64uLL, "%s ", v122);
              if (addstr(v152) < 0) {
                return -1;
              }
              u_long v123 = res_9_ns_get32(binary);
              binary += 4;
              v124 = res_9_p_secstodate(v123);
              __sprintf_chk(v152, 0, 0x64uLL, "%s ", v124);
              if (addstr(v152) < 0) {
                return -1;
              }
              res_9_ns_get16(binary);
              binary += 2;
              res_9_ns_get16(binary);
              binary += 2;
              res_9_ns_get16(binary);
              binary += 2;
              __sprintf_chk(v152, 0, 0x64uLL, "%u %u %u ");
LABEL_176:
              v67 = v152;
              goto LABEL_177;
            }

            if (v21 != 250) {
              goto LABEL_215;
            }
            if ((addname(v147, v146, (const u_char **)&binary, (char *)a10, &__s, (uint64_t *)&a12) & 0x80000000) == 0
              && (addstr(" ") & 0x80000000) == 0)
            {
              binary += 8;
              u_int v47 = res_9_ns_get16(binary);
              binary += (int)v47 + 2;
              res_9_ns_get16(binary);
              binary += 2;
              uint64_t v48 = __s;
              u_int v49 = res_9_ns_get16(binary);
              sprintf(v48, "%d", v49);
              binary += 2;
LABEL_134:
              size_t v97 = strlen(__s);
              if (a12 >= v97) {
                __s += v97;
              }
              return (_DWORD)__s - v145;
            }

            return -1;
        }
      }
    }
  }

  return -1;
}

        int v101 = evNowTime();
        u_int v103 = v133;
      }

      if ((a1->options & 2) == 0)
      {
        int v9 = 4294966295LL;
LABEL_245:
        v216 = 1;
        goto LABEL_247;
      }

      v216 = 1;
      fwrite(";; timeout\n", 0xBuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
      int v9 = 4294966295LL;
LABEL_247:
      a4 = v221;
      uint64_t v8 = v213;
      uint64_t v48 = v202;
LABEL_248:
      uint64_t v17 = 0;
      if (!(_DWORD)v9) {
        goto LABEL_315;
      }
LABEL_249:
      if ((_DWORD)v9 == -1002 || (_DWORD)v9 == -1010)
      {
LABEL_392:
        res_9_nclose(a1);
        goto LABEL_381;
      }

int addstr(const char *a1)
{
  size_t v4 = v1;
  if (*v3 <= v1)
  {
    *__error() = 28;
    return -1;
  }

  else
  {
    int v5 = v3;
    int v6 = v2;
    memcpy(*v2, a1, v1);
    uint64_t v7 = *v6;
    size_t v8 = *v5 - v4;
    if (*v5 >= v4)
    {
      v7 += v4;
      *int v6 = v7;
      *int v5 = v8;
    }

    int result = 0;
    *uint64_t v7 = 0;
  }

  return result;
}

uint64_t prune_origin(char *a1, char *a2)
{
  __int128 v3 = a1;
  if (!*a1) {
    return v3 - a1;
  }
  __int128 v3 = a1;
LABEL_3:
  if (!a2 || res_9_ns_samename(v3, a2) != 1)
  {
    while (1)
    {
      int v5 = *v3;
      if (v5 == 92)
      {
        if (!*++v3) {
          return v3 - a1;
        }
      }

      else
      {
        if (!*v3) {
          return v3 - a1;
        }
        if (v5 == 46)
        {
          if (!*++v3) {
            return v3 - a1;
          }
          goto LABEL_3;
        }
      }

      ++v3;
    }
  }

  return (__PAIR128__(v3 - a1, (unint64_t)a1) - (unint64_t)v3) >> 64;
}

uint64_t addtab(unint64_t a1, uint64_t a2, int a3, uint64_t *a4, uint64_t *a5)
{
  if (a3 || a2 - 1 <= a1)
  {
    if ((addstr("  ") & 0x80000000) == 0) {
      return 1LL;
    }
  }

  else
  {
    unint64_t v7 = (~a1 + a2) >> 3;
    if ((v7 & 0x80000000) != 0) {
      return 0LL;
    }
    uint64_t v8 = *a5;
    uint64_t v9 = *a4;
    int v10 = v7 + 1;
    while ((addstr("\t") & 0x80000000) == 0)
    {
      if (--v10 < 1) {
        return 0LL;
      }
    }

    *a5 = v8;
    *a4 = v9;
  }

  return 0xFFFFFFFFLL;
}

unint64_t addname(const u_char *a1, uint64_t a2, const u_char **a3, char *a4, char **a5, uint64_t *a6)
{
  uint64_t v10 = *a6;
  unsigned int v11 = *a5;
  int v12 = res_9_dn_expand(a1, &a1[a2], *a3, *a5, *a6);
  if (v12 < 0) {
    goto LABEL_13;
  }
  unsigned int v13 = v12;
  unint64_t result = prune_origin(*a5, a4);
  unint64_t v15 = *a5;
  if (**a5)
  {
    if (!result)
    {
      if ((unint64_t)*a6 >= 2)
      {
        *unint64_t v15 = 64;
        unint64_t result = 1LL;
        goto LABEL_15;
      }

LABEL_13:
      *__error() = 28;
      *a5 = v11;
      *a6 = v10;
      return 0xFFFFFFFFLL;
    }

    if (a4 && *a4 && (*a4 == 46 || !a4[1] || v15[result]) || v15[result - 1] == 46) {
      goto LABEL_16;
    }
  }

  if (result + 2 > *a6) {
    goto LABEL_13;
  }
  v15[result++] = 46;
LABEL_15:
  (*a5)[result] = 0;
LABEL_16:
  *a3 += v13;
  int v16 = *a5;
  unint64_t v17 = *a6 - result;
  if (*a6 >= result)
  {
    v16 += result;
    *a5 = v16;
    *a6 = v17;
  }

  char *v16 = 0;
  return result;
}

uint64_t charstr(unsigned __int8 *a1, unint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8 = *a4;
  uint64_t v9 = *a3;
  if ((addstr("") & 0x80000000) == 0)
  {
    LODWORD(v10) = (_DWORD)a1;
    if ((unint64_t)a1 < a2)
    {
      uint64_t v11 = *a1;
      LODWORD(v10) = (_DWORD)a1;
      if ((unint64_t)&a1[v11 + 1] <= a2)
      {
        uint64_t v10 = (const char *)(a1 + 1);
        while (1)
        {
          BOOL v13 = __OFSUB__((_DWORD)v11, 1);
          LODWORD(v1_dns_print_resource_record_lock((uint64_t)r, f, 1) = v11 - 1;
          if (!memchr("\n\, *(unsigned __int8 *)v10, 4uLL) || (addstr("\) & 0x80000000) == 0)
          {
            int v14 = addstr(v10++);
            if ((v14 & 0x80000000) == 0) {
              continue;
            }
          }

          goto LABEL_11;
        }
      }
    }

    if ((addstr("") & 0x80000000) == 0) {
      return ((_DWORD)v10 - (_DWORD)a1);
    }
  }

int res_9_ns_samedomain(const char *a1, const char *a2)
{
  size_t v4 = strlen(a1);
  size_t v5 = strlen(a2);
  size_t v6 = v5;
  if (v4 && a1[v4 - 1] == 46)
  {
    int v7 = 0;
    int v8 = v4 - 1;
    do
    {
      if (a1[--v8] != 92) {
        break;
      }
      v7 ^= 1u;
    }

    while (v8 > 0);
    if (!v7) {
LABEL_8:
    }
      --v4;
  }

  if (!v5) {
    return 1;
  }
  if (a2[v5 - 1] != 46) {
    goto LABEL_18;
  }
  int v9 = 0;
  int v10 = v5 - 1;
  do
  {
    if (a2[--v10] != 92) {
      break;
    }
    v9 ^= 1u;
  }

  while (v10 > 0);
  if (!v9) {
LABEL_16:
  }
    size_t v6 = v5 - 1;
  if (!v6) {
    return 1;
  }
LABEL_18:
  int v11 = v4 - v6;
  if (v4 < v6) {
    return 0;
  }
  if (v4 == v6)
  {
    BOOL v13 = a1;
    int v14 = a2;
    size_t v6 = v4;
  }

  else
  {
    if (v11 < 2 || a1[v11 - 1] != 46) {
      return 0;
    }
    int v15 = 0;
    int v16 = ~(_DWORD)v6 + v4;
    do
    {
      if (a1[--v16] != 92) {
        break;
      }
      v15 ^= 1u;
    }

    while (v16 > 0);
    if (v15) {
      return 0;
    }
    BOOL v13 = &a1[v11];
    int v14 = a2;
  }

  return strncasecmp(v13, v14, v6) == 0;
}

int res_9_ns_subdomain(const char *a1, const char *a2)
{
  if (res_9_ns_samename(a1, a2) == 1) {
    return 0;
  }
  else {
    return res_9_ns_samedomain(a1, a2);
  }
}

int res_9_ns_samename(const char *a1, const char *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if (res_9_ns_makecanon(a1, v5, 0x401uLL) < 0 || res_9_ns_makecanon(a2, v4, 0x401uLL) < 0) {
    return -1;
  }
  else {
    return strcasecmp(v5, v4) == 0;
  }
}

int res_9_ns_makecanon(const char *a1, char *a2, size_t a3)
{
  size_t v6 = strlen(a1);
  if (v6 + 2 <= a3)
  {
    size_t v8 = v6;
    strcpy(a2, a1);
    if (v8)
    {
      size_t v9 = v8 - 1;
      while (a2[v9] == 46)
      {
        if (v9 + 1 >= 2 && a2[v9 - 1] == 92 && a2[v9 - 2] != 92) {
          goto LABEL_12;
        }
        a2[v9--] = 0;
        --v8;
        if (v9 == -1LL)
        {
          size_t v8 = 0LL;
          goto LABEL_12;
        }
      }

      size_t v8 = v9 + 1;
    }

int res_9_ns_sign( u_char *a1, int *a2, int a3, int a4, void *a5, const u_char *a6, int a7, u_char *a8, int *a9, time_t a10)
{
  return res_9_ns_sign2(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, 0LL, 0LL);
}

int res_9_ns_sign2( u_char *a1, int *a2, int a3, int a4, void *a5, const u_char *a6, int a7, u_char *a8, int *a9, time_t a10, u_char **a11, u_char **a12)
{
  uint64_t v13 = *(void *)&a7;
  *(void *)&v76[1007] = *MEMORY[0x1895F89C0];
  uint64_t v20 = *a2;
  res_9_dst_init();
  int result = -1;
  if (a1 && a8 && a9)
  {
    int v22 = &a1[v20];
    int v23 = &a1[a3];
    if (a5) {
      BOOL v24 = (a4 - 18) >= 0xFFFFFFFE;
    }
    else {
      BOOL v24 = 1;
    }
    int v25 = !v24;
    if (v25 == 1)
    {
      unint64_t v28 = (unint64_t)v23;
      int v29 = (_DWORD)v23 - (_DWORD)v22;
      uint64_t v30 = *(const char **)a5;
      unint64_t v31 = (u_char *)v22;
    }

    else
    {
      unint64_t v28 = (unint64_t)v23;
      int v29 = (_DWORD)v23 - (_DWORD)v22;
      uint64_t v30 = (const char *)&unk_1874AA85D;
      unint64_t v31 = (u_char *)v22;
      a11 = 0LL;
      a12 = 0LL;
    }

    unsigned int v32 = res_9_dn_comp(v30, v31, v29, a11, a12);
    if ((v32 & 0x80000000) != 0) {
      return -11;
    }
    int v61 = a4;
    int v33 = (u_char *)&v22[v32];
    size_t v34 = v33 + 10;
    *(void *)int v33 = 4278254080LL;
    if (v25)
    {
      if (*((_DWORD *)a5 + 4) != 157) {
        return -17;
      }
      u_long v60 = &v22[v32];
      unsigned int v35 = "HMAC-MD5.SIG-ALG.REG.INT";
    }

    else
    {
      u_long v60 = &v22[v32];
      unsigned int v35 = (const char *)&unk_1874AA85D;
    }

    unsigned int v36 = res_9_dn_comp(v35, v33 + 10, v28 - (_DWORD)v34, 0LL, 0LL);
    if ((v36 & 0x80000000) != 0) {
      return -11;
    }
    int v37 = &v34[v36];
    unint64_t v57 = v37 + 8;
    unint64_t v58 = v28;
    *(_WORD *)int v37 = 0;
    unsigned int v59 = &v34[v36];
    time_t v38 = time(0LL);
    int v39 = v59;
    int v56 = v38;
    if (v61 != 18) {
      a10 = v38;
    }
    *((_BYTE *)v59 + 2) = BYTE3(a10);
    *((_BYTE *)v59 + 3) = BYTE2(a10);
    *((_BYTE *)v59 + 4) = BYTE1(a10);
    *((_BYTE *)v59 + 5) = a10;
    *((_WORD *)v59 + 3) = 11265;
    if (!v25)
    {
      unsigned int v48 = 0;
      int v42 = a9;
      *a9 = 0;
      int v45 = v61;
LABEL_37:
      if ((unint64_t)v57 + v48 + 2 <= v58)
      {
        *((_WORD *)v39 + 4) = bswap32(v48) >> 16;
        u_int v49 = v39 + 10;
        memcpy((void *)(v39 + 10), a8, *v42);
        unsigned int v50 = (u_char *)&v49[*v42];
        if ((unint64_t)(v50 + 4) <= v58)
        {
          unsigned int v51 = bswap32(*(unsigned __int16 *)a1);
          *unsigned int v50 = HIBYTE(v51);
          v50[1] = BYTE2(v51);
          v50[2] = BYTE1(v45);
          v50[3] = v45;
          int v52 = (_DWORD)v50 + 6;
          if ((unint64_t)(v50 + 6) <= v58)
          {
            v50[4] = 0;
            if (v45 != 18)
            {
              v50[5] = 0;
              goto LABEL_45;
            }

            v50[5] = 6;
            int v52 = (_DWORD)v50 + 12;
            if ((unint64_t)(v50 + 12) <= v58)
            {
              *((_WORD *)v50 + 3) = 0;
              v50[8] = HIBYTE(v56);
              v50[9] = BYTE2(v56);
              v50[10] = BYTE1(v56);
              v50[11] = v56;
LABEL_45:
              int result = 0;
              *((_WORD *)v60 + 4) = bswap32(v52 - ((_DWORD)v60 + 8) - 2) >> 16;
              *((_WORD *)a1 + 5) = bswap32(bswap32(*((_DWORD *)a1 + 2)) + 1) >> 16;
              *a2 = v52 - (_DWORD)a1;
              return result;
            }
          }
        }
      }

int res_9_ns_sign_tcp_init(void *a1, const u_char *a2, int a3, res_9_ns_tcp_tsig_state *a4)
{
  int result = -1;
  if ((a3 & 0x80000000) == 0 && a2 && a1 && a4)
  {
    a4->counter = -1;
    a4->key = (dst_key *)a1;
    if (*((_DWORD *)a1 + 4) == 157)
    {
      if (a3 <= 0x200)
      {
        memcpy(a4->sig, a2, a3);
        int result = 0;
        a4->siglen = a3;
      }
    }

    else
    {
      return -17;
    }
  }

  return result;
}

int res_9_ns_sign_tcp(u_char *a1, int *a2, int a3, int a4, res_9_ns_tcp_tsig_state *a5, int a6)
{
  return res_9_ns_sign_tcp2(a1, a2, a3, a4, a5, a6, 0LL, 0LL);
}

int res_9_ns_sign_tcp2( u_char *a1, int *a2, int a3, int a4, res_9_ns_tcp_tsig_state *a5, int a6, u_char **a7, u_char **a8)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  int result = -1;
  if (a1 && a2 && a5)
  {
    __int16 v14 = a4;
    if (__CFADD__(a5->counter++, 1)) {
      return res_9_ns_sign2( a1,  a2,  a3,  (unsigned __int16)a4,  a5->key,  a5->sig,  a5->siglen,  a5->sig,  &a5->siglen,  0LL,  a7,  a8);
    }
    signed int siglen = a5->siglen;
    if (siglen >= 1)
    {
      __int16 v33 = bswap32(siglen) >> 16;
      res_9_dst_sign_data(1, (uint64_t)a5->key, (uint64_t)&a5->ctx, 0LL, 0LL, 0LL);
      res_9_dst_sign_data(2, (uint64_t)a5->key, (uint64_t)&a5->ctx, (uint64_t)&v33, 2LL, 0LL);
      res_9_dst_sign_data(2, (uint64_t)a5->key, (uint64_t)&a5->ctx, (uint64_t)a5->sig, a5->siglen, 0LL);
      a5->signed int siglen = 0;
    }

    res_9_dst_sign_data(2, (uint64_t)a5->key, (uint64_t)&a5->ctx, (uint64_t)a1, *a2, 0LL);
    if (!a6)
    {
      HIDWORD(v3_dns_print_resource_record_lock((uint64_t)r, f, 1) = -1030792151 * a5->counter + 85899344;
      LODWORD(v3_dns_print_resource_record_lock((uint64_t)r, f, 1) = HIDWORD(v31);
    }

    u_long v19 = &a1[*a2];
    uint64_t v20 = &a1[a3];
    unsigned int v21 = res_9_dn_comp(*(const char **)a5->key, v19, (_DWORD)v20 - (_DWORD)v19, a7, a8);
    if ((v21 & 0x80000000) == 0)
    {
      int v22 = &v19[v21];
      int v23 = v22 + 10;
      if (v22 + 10 > v20)
      {
LABEL_18:
        *__error() = 40;
        return -11;
      }

      *(_DWORD *)int v22 = -16713216;
      *((_DWORD *)v22 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
      unsigned int v24 = res_9_dn_comp("HMAC-MD5.SIG-ALG.REG.INT", v22 + 10, (_DWORD)v20 - (_DWORD)v23, 0LL, 0LL);
      if ((v24 & 0x80000000) == 0)
      {
        int v25 = &v23[v24];
        if (v25 + 8 <= v20)
        {
          *(_WORD *)int v25 = 0;
          int v26 = time(0LL);
          v25[2] = HIBYTE(v26);
          v25[3] = BYTE2(v26);
          v25[4] = BYTE1(v26);
          v25[5] = v26;
          *((_WORD *)v25 + 3) = 11265;
          __int16 v33 = 0;
          char v34 = HIBYTE(v26);
          char v35 = BYTE2(v26);
          char v36 = BYTE1(v26);
          char v37 = v26;
          __int16 v38 = 11265;
          res_9_dst_sign_data(2, (uint64_t)a5->key, (uint64_t)&a5->ctx, (uint64_t)&v33, 8LL, 0LL);
          unsigned int v27 = res_9_dst_sign_data(4, (uint64_t)a5->key, (uint64_t)&a5->ctx, 0LL, 0LL, (uint64_t)a5->sig);
          if ((v27 & 0x80000000) != 0) {
            return -17;
          }
          a5->signed int siglen = v27;
          if (&v25[v27 + 10] <= v20)
          {
            *((_WORD *)v25 + 4) = bswap32(v27) >> 16;
            memcpy(v25 + 10, a5->sig, a5->siglen);
            uint64_t v28 = (uint64_t)&v25[a5->siglen + 10];
            if (v28 + 4 <= (unint64_t)v20)
            {
              unsigned int v29 = bswap32(*(unsigned __int16 *)a1);
              *(_BYTE *)uint64_t v28 = HIBYTE(v29);
              *(_BYTE *)(v28 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = BYTE2(v29);
              *(_BYTE *)(v28 + 2) = HIBYTE(v14);
              *(_BYTE *)(v28 + 3) = v14;
              int v30 = v28 + 6;
              if (v28 + 6 <= (unint64_t)v20)
              {
                int result = 0;
                *(_WORD *)(v28 + 4) = 0;
                __int16 v32 = v30 - ((_WORD)v22 + 8) - 2;
                v22[8] = HIBYTE(v32);
                v22[9] = v32;
                *((_WORD *)a1 + 5) = bswap32(bswap32(*((_DWORD *)a1 + 2)) + 1) >> 16;
                *a2 = v30 - (_DWORD)a1;
                return result;
              }
            }
          }
        }

        goto LABEL_18;
      }
    }

    return -11;
  }

  return result;
}

int res_9_ns_format_ttl(u_long a1, char *a2, size_t a3)
{
  size_t v18 = a3;
  u_long v19 = a2;
  u_long v5 = a1 / 0x93A80;
  if ((a1 / 0x93A80))
  {
    if ((fmt1(a1 / 0x93A80, 0x57u, &v19, &v18) & 0x80000000) != 0) {
      return -1;
    }
    unsigned int v6 = 1;
  }

  else
  {
    unsigned int v6 = 0;
  }

  int v7 = a1 / 0x15180 - 7 * ((a1 / 0x15180 * (unsigned __int128)0x2492492492492493uLL) >> 64);
  if (v7)
  {
    ++v6;
  }

  uint64_t v8 = (a1 / 0xE10 * (unsigned __int128)0xAAAAAAAAAAAAAABuLL) >> 64;
  int v9 = a1 / 0xE10 - 24 * v8;
  if (v9)
  {
    if ((fmt1(a1 / 0xE10 - 24 * v8, 0x48u, &v19, &v18) & 0x80000000) != 0) {
      return -1;
    }
    ++v6;
  }

  unint64_t v10 = (unint64_t)((a1 / 0x3C * (unsigned __int128)0x888888888888889uLL) >> 64) >> 1;
  int v11 = a1 / 0x3C - 60 * v10;
  if (v11)
  {
    if ((fmt1(a1 / 0x3C - 60 * v10, 0x4Du, &v19, &v18) & 0x80000000) != 0) {
      return -1;
    }
    ++v6;
  }

  if ((fmt1(a1 % 0x3C, 0x53u, &v19, &v18) & 0x80000000) != 0) {
    return -1;
  }
  ++v6;
LABEL_21:
  if (v6 >= 2)
  {
    char v13 = *a2;
    if (*a2)
    {
      __int16 v14 = a2 + 1;
      uint64_t v15 = MEMORY[0x1895F8770];
      do
      {
        int v16 = *v14++;
        char v13 = v16;
      }

      while (v16);
    }
  }

  return (_DWORD)v19 - (_DWORD)a2;
}

uint64_t fmt1(int a1, unsigned __int8 a2, char **a3, void *a4)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v6 = __sprintf_chk(__src, 0, 0x32uLL, "%d%c", a1, a2);
  strcpy(*a3, __src);
  uint64_t result = 0LL;
  *a3 += v6;
  *a4 -= v6;
  return result;
}

int res_9_ns_parse_ttl(const char *a1, u_long *a2)
{
  LOBYTE(v3) = *a1;
  if (*a1)
  {
    size_t v4 = a1;
    u_long v5 = 0LL;
    char v6 = 1;
    uint64_t v7 = MEMORY[0x1895F8770];
    while (2)
    {
      uint64_t v8 = 0LL;
      uint64_t v9 = 0LL;
      while (1)
      {
        if ((v3 & 0x80) != 0) {
          goto LABEL_29;
        }
        int v10 = (char)v3;
        int v11 = *(_DWORD *)(v7 + 4LL * (char)v3 + 60);
        if ((v11 & 0x40000) == 0) {
          goto LABEL_29;
        }
        uint64_t v9 = 10 * v9 + (v10 - 48);
        int v3 = v4[++v8];
        if (!v3)
        {
          if ((v6 & 1) != 0)
          {
            v5 += v9;
            goto LABEL_28;
          }

          goto LABEL_29;
        }
      }

      if ((_DWORD)v8)
      {
        if ((v11 & 0x1000) != 0) {
          int v10 = __toupper(v10);
        }
        if (v10 <= 76)
        {
          if (v10 == 68) {
            goto LABEL_20;
          }
          if (v10 == 72)
          {
LABEL_21:
            v9 *= 60LL;
            goto LABEL_22;
          }
        }

        else
        {
          switch(v10)
          {
            case 'M':
LABEL_22:
              v9 *= 60LL;
LABEL_23:
              char v6 = 0;
              v4 += v8 + 1;
              v5 += v9;
              LOBYTE(v3) = *v4;
              if (*v4) {
                continue;
              }
              goto LABEL_28;
            case 'S':
              goto LABEL_23;
            case 'W':
              v9 *= 7LL;
LABEL_20:
              v9 *= 24LL;
              goto LABEL_21;
          }
        }
      }

      break;
    }

LABEL_29:
    *__error() = 22;
    return -1;
  }

  u_long v5 = 0LL;
LABEL_28:
  int result = 0;
  *a2 = v5;
  return result;
}

  unsigned int v24 = -1;
LABEL_30:
  *int v22 = v24;
  if ((res->options & 2) != 0) {
    printf(";; res_nquery: SOA minimum TTL = %d\n", v24);
  }
LABEL_32:
  int v25 = *(void *)a5;
  if ((*(void *)a5 & 0xF000000LL) != 0 || (*(void *)a5 & 0xFFFF000000000000LL) == 0)
  {
    if ((res->options & 2) != 0)
    {
      printf(";; rcode = %d, ancount=%d\n", BYTE3(v25) & 0xF, __rev16(HIWORD(v25)));
      LODWORD(v25) = *(_DWORD *)a5;
    }

    if ((v25 & 0xC000000) != 0) {
      u_long v19 = 3;
    }
    else {
      u_long v19 = 4 - (BYTE3(v25) & 0xF);
    }
    int v16 = 0xFFFFFFFFLL;
    goto LABEL_43;
  }

  return v16;
}

  int v26 = a1->nscount;
  if (v26 >= 1)
  {
    unsigned int v27 = 0LL;
    uint64_t v28 = 0LL;
    unsigned int v29 = 514LL;
    do
    {
      *(_WORD *)((char *)&a1->retrans + v29) = -1;
      a1->_u._ext.nssocks[v28] = -1;
      if (a1->nsaddr_list[v27 / 0x10].sin_family)
      {
        int v30 = a1->_u._ext.ext;
        if (v30)
        {
          *(sockaddr_in *)((char *)v30 + 8 * v27) = a1->nsaddr_list[v27 / 0x10];
          int v26 = a1->nscount;
        }
      }

      ++v28;
      v27 += 16LL;
      v29 += 2LL;
    }

    while (v28 < v26);
  }

  a1->_u._ext.nscount = v26;
LABEL_36:
  if ((a1->options & 0x24000) == 0x4000)
  {
    unint64_t v31 = a1->nscount;
    __int16 v32 = a1->_u._ext.ext;
    if (v32)
    {
      v240 = *((_OWORD *)v32 + 4);
      v241 = *((_OWORD *)v32 + 5);
      v242 = *((_OWORD *)v32 + 6);
      v243 = *((_OWORD *)v32 + 7);
      v236 = *(sockaddr *)v32;
      v237 = *((_OWORD *)v32 + 1);
      v238 = *((_OWORD *)v32 + 2);
      v239 = *((_OWORD *)v32 + 3);
    }

    __int16 v33 = (v31 - 1);
    *(sockaddr_in *)v246 = a1->nsaddr_list[0];
    char v34 = a1->_u._ext.nssocks[0];
    char v35 = a1->_u._ext.nstimes[0];
    if (v31 >= 2)
    {
      char v36 = 0LL;
      do
      {
        char v37 = a1->_u._ext.ext;
        __int16 v38 = v36 + 1;
        if (v37)
        {
          uint64_t v39 = (_OWORD *)((char *)v37 + 128 * v36 + 128);
          size_t v40 = v39[5];
          unint64_t v41 = (_OWORD *)((char *)v37 + 128 * v36);
          v41[4] = v39[4];
          v41[5] = v40;
          int v42 = v39[7];
          v41[6] = v39[6];
          v41[7] = v42;
          uint64_t v43 = v39[1];
          const char *v41 = *v39;
          v41[1] = v43;
          uint64_t v44 = v39[3];
          v41[2] = v39[2];
          v41[3] = v44;
        }

        a1->nsaddr_list[v36] = a1->nsaddr_list[v38];
        a1->_u._ext.nssocks[v36] = a1->_u._ext.nssocks[v38];
        a1->_u._ext.nstimes[v36++] = a1->_u._ext.nstimes[v38];
      }

      while (v38 != v33);
      __int16 v32 = a1->_u._ext.ext;
    }

    if (v32)
    {
      int v45 = (char *)v32 + 128 * (uint64_t)(int)v33;
      *((_OWORD *)v45 + 4) = v240;
      *((_OWORD *)v45 + 5) = v241;
      *((_OWORD *)v45 + 6) = v242;
      *((_OWORD *)v45 + 7) = v243;
      *(sockaddr *)int v45 = v236;
      *((_OWORD *)v45 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = v237;
      *((_OWORD *)v45 + 2) = v238;
      *((_OWORD *)v45 + 3) = v239;
    }

    a1->nsaddr_list[(int)v33] = *(sockaddr_in *)v246;
    a1->_u._ext.nssocks[(int)v33] = v34;
    a1->_u._ext.nstimes[(int)v33] = v35;
  }

  v227 = 0LL;
  token = -1;
  unsigned int v46 = pthread_self();
  asprintf(&v227, "self.thread.%lu", v46);
  if (v227)
  {
    notify_register_plain();
    free(v227);
  }

  retry = a1->retry;
  if (retry < 1)
  {
    v216 = 0;
    uint64_t v9 = 0LL;
    v209 = 60;
    goto LABEL_372;
  }

  unsigned int v48 = 0LL;
  uint64_t v9 = 0LL;
  v216 = 0;
  LODWORD(v49) = a1->nscount;
  v209 = 60;
  do
  {
    unsigned int v50 = 0LL;
    do
    {
      unsigned int v51 = (char *)a1 + 16 * v50;
      int v52 = v51[21];
      v211 = v51 + 21;
      unint64_t v53 = (const sockaddr *)(v51 + 20);
      unint64_t v54 = (sockaddr *)(v51 + 20);
      if (!v52)
      {
        char v55 = a1->_u._ext.ext;
        if (v55) {
          unint64_t v54 = (sockaddr *)((char *)v55 + 128 * v50);
        }
        else {
          unint64_t v54 = (sockaddr *)v53;
        }
      }

      v224 = v54;
      int sa_family = v54->sa_family;
      if (sa_family == 30) {
        unint64_t v57 = 28;
      }
      else {
        unint64_t v57 = 0;
      }
      if (sa_family == 2) {
        unint64_t v58 = 16;
      }
      else {
        unint64_t v58 = v57;
      }
      v208 = v58;
      v212 = &a1->_u._ext.nssocks[v50];
      v210 = v50 + 1;
      v205 = v50 + 1;
      v206 = v50;
LABEL_65:
      if (a1->qhook)
      {
        unsigned int v59 = 42;
        while (1)
        {
          u_long v60 = ((uint64_t (*)(sockaddr **, u_char **, int *, const u_char *, uint64_t, _BYTE *))a1->qhook)( &v224,  &v230,  &v229,  a4,  v8,  v228);
          if (v60 != 2) {
            break;
          }
          if (!--v59) {
            goto LABEL_383;
          }
        }

        if (v60)
        {
          if (v60 == 1)
          {
LABEL_339:
            res_9_nclose(a1);
            goto LABEL_340;
          }

u_char *__cdecl res_9_ns_find_tsig(u_char *a1, u_char *a2)
{
  int result = 0LL;
  if (a1 <= a2 && a1 && a2)
  {
    if (a1 + 12 >= a2) {
      return 0LL;
    }
    int v5 = res_9_ns_skiprr(a1 + 12, a2, ns_s_qd, bswap32(HIDWORD(*(void *)a1)) >> 16);
    if (v5 < 0) {
      return 0LL;
    }
    char v6 = &a1[v5 + 12];
    unsigned int v7 = res_9_ns_skiprr(v6, a2, ns_s_an, bswap32(*((unsigned __int16 *)a1 + 3)) >> 16);
    if ((v7 & 0x80000000) != 0) {
      return 0LL;
    }
    uint64_t v8 = &v6[v7];
    unsigned int v9 = res_9_ns_skiprr(v8, a2, ns_s_ns, bswap32(*((unsigned __int16 *)a1 + 4)) >> 16);
    if ((v9 & 0x80000000) != 0) {
      return 0LL;
    }
    int v10 = &v8[v9];
    unsigned int v11 = res_9_ns_skiprr(v10, a2, ns_s_ar, (bswap32(*((unsigned __int16 *)a1 + 5)) >> 16) - 1);
    if ((v11 & 0x80000000) != 0) {
      return 0LL;
    }
    int v12 = &v10[v11];
    unsigned int v13 = res_9_dn_skipname(v12, a2);
    if ((v13 & 0x80000000) != 0) {
      return 0LL;
    }
    __int16 v14 = &v12[v13];
    if (v14 + 2 >= a2)
    {
      return 0LL;
    }

    else if (__rev16(*(unsigned __int16 *)v14) == 250)
    {
      return (u_char *)v12;
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

int res_9_ns_verify( u_char *a1, int *a2, void *a3, const u_char *a4, int a5, u_char *a6, int *a7, time_t *a8, int a9)
{
  uint64_t v9 = MEMORY[0x1895F8858](a1, a2, a3, a4, *(void *)&a5, a6, a7, a8);
  unsigned int v11 = v10;
  unsigned int v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  int v23 = v22;
  uint64_t v24 = v9;
  uint64_t v63 = *MEMORY[0x1895F89C0];
  res_9_dst_init();
  int result = -1;
  if (!v24) {
    return result;
  }
  if (!v23) {
    return result;
  }
  uint64_t v26 = *v23;
  if ((v26 & 0x80000000) != 0) {
    return result;
  }
  unsigned int v27 = (const u_char *)(v24 + v26);
  tsig = res_9_ns_find_tsig((u_char *)v24, (u_char *)(v24 + v26));
  if (!tsig) {
    return -10;
  }
  unsigned int v29 = tsig;
  unsigned int v30 = res_9_dn_expand((const u_char *)v24, v27, tsig, v62, 1025);
  if ((v30 & 0x80000000) != 0) {
    return -12;
  }
  unint64_t v31 = &v29[v30];
  __int16 v32 = v31 + 10;
  if (v31 + 10 > v27) {
    return -12;
  }
  int v56 = (u_char *)(v31 + 10);
  int v33 = res_9_dn_expand((const u_char *)v24, v27, v32, v61, 1025);
  if (v33 < 0) {
    return -12;
  }
  int v54 = v33;
  if (res_9_ns_samename(v61, "HMAC-MD5.SIG-ALG.REG.INT") != 1) {
    return -17;
  }
  char v34 = &v56[v54];
  if (v34 + 8 > v27) {
    return -12;
  }
  *unsigned int v11 = bswap32(*(_DWORD *)(v34 + 2));
  char v35 = v34 + 10;
  if (v34 + 10 > v27) {
    return -12;
  }
  size_t v36 = __rev16(*((unsigned __int16 *)v34 + 4));
  char v37 = &v35[v36];
  if (&v35[v36] > v27 || &v35[v36 + 4] > v27) {
    return -12;
  }
  if (v37 + 6 > v27) {
    return -12;
  }
  uint64_t v39 = __rev16(*((unsigned __int16 *)v37 + 2));
  if (&v37[v39 + 6] != v27) {
    return -12;
  }
  int v49 = v39;
  uint64_t v50 = (uint64_t)(v37 + 2);
  __src = v34 + 10;
  size_t __n = v36;
  unsigned int v52 = *((unsigned __int16 *)v34 + 3);
  unsigned int v40 = __rev16(*((unsigned __int16 *)v37 + 1));
  int v55 = v40;
  if (v21)
  {
    if (*(_DWORD *)(v21 + 16) != 157) {
      return -17;
    }
    if (v40 - 18 <= 0xFFFFFFFD)
    {
      int v41 = res_9_ns_samename(*(const char **)v21, v62);
      unsigned int v40 = v55;
      if (v41 != 1) {
        return -17;
      }
    }
  }

  *(_WORD *)(v24 + 10) = bswap32(bswap32(*(_DWORD *)(v24 + 8)) - 1) >> 16;
  if (v21 && v40 != 16 && v40 != 17)
  {
    res_9_dst_verify_data(1, v21, (uint64_t)v58, 0LL, 0LL, 0LL);
    if (v19 && (int)v17 >= 1)
    {
      __int16 v57 = bswap32(v17) >> 16;
      res_9_dst_verify_data(2, v21, (uint64_t)v58, (uint64_t)&v57, 2LL, 0LL);
      res_9_dst_verify_data(2, v21, (uint64_t)v58, v19, v17, 0LL);
    }

    res_9_dst_verify_data(2, v21, (uint64_t)v58, v24, ((_DWORD)v29 - v24), 0LL);
    if (res_9_ns_name_pton(v62, v59, 0x401uLL) < 0) {
      return -1;
    }
    uint64_t v42 = res_9_ns_name_ntol(v59, v60, 0x401uLL);
    if ((v42 & 0x80000000) != 0) {
      return -1;
    }
    res_9_dst_verify_data(2, v21, (uint64_t)v58, (uint64_t)v60, v42, 0LL);
    int v43 = res_9_dn_skipname(v29, v27);
    res_9_dst_verify_data(2, v21, (uint64_t)v58, (uint64_t)&v29[v43 + 2], 6LL, 0LL);
    if (res_9_ns_name_pton(v61, v59, 0x401uLL) < 0) {
      return -1;
    }
    uint64_t v44 = res_9_ns_name_ntol(v59, v60, 0x401uLL);
    if ((v44 & 0x80000000) != 0) {
      return -1;
    }
    res_9_dst_verify_data(2, v21, (uint64_t)v58, (uint64_t)v60, v44, 0LL);
    int v45 = res_9_dn_skipname(v56, v27);
    res_9_dst_verify_data(2, v21, (uint64_t)v58, (uint64_t)&v56[v45], 8LL, 0LL);
    res_9_dst_verify_data(2, v21, (uint64_t)v58, v50, (v49 + 4), 0LL);
    if (v15 && v13)
    {
      memcpy(v15, __src, __n);
      _DWORD *v13 = __n;
    }

    goto LABEL_46;
  }

  if ((_DWORD)__n) {
    return -12;
  }
  if (v15 && v13) {
    _DWORD *v13 = 0;
  }
LABEL_46:
  unsigned int v46 = __rev16(v52);
  *(_WORD *)(v24 + 10) = bswap32(bswap32(*(_DWORD *)(v24 + 8)) + 1) >> 16;
  int v47 = *(_DWORD *)v11;
  int v48 = v47 - time(0LL);
  if (v48 < 0) {
    int v48 = -v48;
  }
  if (v48 > v46) {
    return -18;
  }
  if (!a9)
  {
    _DWORD *v23 = (_DWORD)v29 - v24;
    *(_WORD *)(v24 + 10) = bswap32(bswap32(*(_DWORD *)(v24 + 8)) - 1) >> 16;
  }

  return v55;
}

int res_9_ns_verify_tcp_init(void *a1, const u_char *a2, int a3, res_9_ns_tcp_tsig_state *a4)
{
  int result = -1;
  if ((a3 & 0x80000000) == 0 && a2 && a1 && a4)
  {
    a4->counter = -1;
    a4->key = (dst_key *)a1;
    if (*((_DWORD *)a1 + 4) == 157)
    {
      if (a3 <= 0x200)
      {
        memcpy(a4->sig, a2, a3);
        int result = 0;
        a4->signed int siglen = a3;
      }
    }

    else
    {
      return -17;
    }
  }

  return result;
}

int res_9_ns_verify_tcp(u_char *a1, int *a2, res_9_ns_tcp_tsig_state *a3, int a4)
{
  v42[129] = *MEMORY[0x1895F89C0];
  int result = -1;
  if (!a1 || !a3) {
    return result;
  }
  uint64_t v8 = *a2;
  if (__CFADD__(a3->counter++, 1)) {
    return res_9_ns_verify(a1, a2, a3->key, a3->sig, a3->siglen, a3->sig, &a3->siglen, v42, 0);
  }
  unsigned int v11 = &a1[v8];
  signed int siglen = a3->siglen;
  if (siglen >= 1)
  {
    LOWORD(v42[0]) = bswap32(siglen) >> 16;
    res_9_dst_verify_data(1, (uint64_t)a3->key, (uint64_t)&a3->ctx, 0LL, 0LL, 0LL);
    res_9_dst_verify_data(2, (uint64_t)a3->key, (uint64_t)&a3->ctx, (uint64_t)v42, 2LL, 0LL);
    res_9_dst_verify_data(2, (uint64_t)a3->key, (uint64_t)&a3->ctx, (uint64_t)a3->sig, a3->siglen, 0LL);
    a3->signed int siglen = 0;
  }

  tsig = res_9_ns_find_tsig(a1, v11);
  if (!tsig)
  {
    if (!a4)
    {
      res_9_dst_verify_data(2, (uint64_t)a3->key, (uint64_t)&a3->ctx, (uint64_t)a1, *a2, 0LL);
      return 0;
    }

    return -10;
  }

  __int16 v14 = tsig;
  *((_WORD *)a1 + 5) = bswap32(bswap32(*((_DWORD *)a1 + 2)) - 1) >> 16;
  uint64_t v15 = ((_DWORD)tsig - (_DWORD)a1);
  res_9_dst_verify_data(2, (uint64_t)a3->key, (uint64_t)&a3->ctx, (uint64_t)a1, v15, 0LL);
  unsigned int v16 = res_9_dn_expand(a1, v11, v14, (char *)v42, 1025);
  if ((v16 & 0x80000000) != 0) {
    return -12;
  }
  uint64_t v17 = &v14[v16];
  uint64_t v18 = v17 + 10;
  if (v17 + 10 > v11) {
    return -12;
  }
  int v19 = res_9_dn_expand(a1, v11, v18, v41, 1025);
  if (v19 < 0) {
    return -12;
  }
  int v20 = v19;
  if (res_9_ns_samename(v41, "HMAC-MD5.SIG-ALG.REG.INT") != 1) {
    return -17;
  }
  key = a3->key;
  if (*((_DWORD *)key + 4) != 157) {
    return -17;
  }
  int v22 = &v18[v20];
  if (v22 + 8 > v11) {
    return -12;
  }
  int v23 = (char *)(v22 + 10);
  if (v22 + 10 > v11) {
    return -12;
  }
  size_t v24 = __rev16(*((unsigned __int16 *)v22 + 4));
  int v25 = &v23[v24];
  int result = -12;
  if (&v23[v24] <= (char *)v11 && v25 + 4 <= (char *)v11)
  {
    size_t __n = v24;
    if (v25 + 6 <= (char *)v11 && &v25[__rev16(*((unsigned __int16 *)v25 + 2)) + 6] == (char *)v11)
    {
      int v26 = v22[2];
      int v27 = v22[3];
      int v28 = v22[4];
      int v29 = v22[5];
      unsigned int v30 = *((unsigned __int16 *)v22 + 3);
      unsigned int v33 = *((unsigned __int16 *)v25 + 1);
      __int16 v35 = 0;
      char v36 = v26;
      char v37 = v27;
      char v38 = v28;
      char v39 = v29;
      __int16 v40 = 11265;
      res_9_dst_verify_data(2, (uint64_t)key, (uint64_t)&a3->ctx, (uint64_t)&v35, 8LL, 0LL);
      if ((res_9_dst_verify_data(4, (uint64_t)a3->key, (uint64_t)&a3->ctx, 0LL, 0LL, (uint64_t)v23) & 0x80000000) != 0)
      {
        return -16;
      }

      else if (__n <= 0x200)
      {
        unsigned int v31 = __rev16(v30);
        memcpy(a3->sig, v23, __n);
        a3->signed int siglen = __n;
        int v32 = ((v26 << 24) | (v27 << 16) | (v28 << 8) | v29) - time(0LL);
        if (v32 < 0) {
          int v32 = -v32;
        }
        if (v32 <= v31)
        {
          int result = __rev16(v33);
          *a2 = v15;
        }

        else
        {
          return -18;
        }
      }

      else
      {
        return -11;
      }
    }
  }

  return result;
}

int res_9_dn_expand(const u_char *a1, const u_char *a2, const u_char *a3, char *a4, int a5)
{
  int result = res_9_ns_name_uncompress(a1, a2, a3, a4, a5);
  if (result >= 1 && *a4 == 46) {
    *a4 = 0;
  }
  return result;
}

int res_9_dn_comp(const char *a1, u_char *a2, int a3, u_char **a4, u_char **a5)
{
  return res_9_ns_name_compress(a1, a2, a3, (const u_char **)a4, (const u_char **)a5);
}

int res_9_dn_skipname(const u_char *a1, const u_char *a2)
{
  int v2 = (int)a1;
  size_t v4 = (u_char *)a1;
  else {
    return (_DWORD)v4 - v2;
  }
}

int res_9_hnok(const char *a1)
{
  LOBYTE(v_dns_print_resource_record_lock((uint64_t)r, f, 1) = *a1;
  if (*a1)
  {
    int v2 = a1 + 1;
    int v3 = 46;
    do
    {
      int v4 = (char)v1;
      int v5 = v1;
      int v6 = *(unsigned __int8 *)v2++;
      int v1 = v6;
      if (v5 != 46)
      {
        if (v3 == 46 || (v1 != 46 ? (BOOL v7 = v1 == 0) : (BOOL v7 = 1), v7))
        {
        }

        else if ((v4 & 0xFFFFFFDF) - 65 >= 0x1A && v4 != 45 && (v4 - 48) > 9)
        {
          return 0;
        }
      }

      int v3 = v4;
    }

    while (v1);
  }

  return 1;
}

int res_9_ownok(const char *a1)
{
  if (*a1 != 42) {
    return res_9_hnok(a1);
  }
  if (a1[1])
  {
    if (a1[1] == 46) {
      a1 += 2;
    }
    return res_9_hnok(a1);
  }

  return 1;
}

int res_9_mailok(const char *a1)
{
  int v1 = *(unsigned __int8 *)a1;
  if (!*a1) {
    return 1;
  }
  int v2 = 0;
  int v3 = a1 + 1;
  while (v2 || v1 != 46)
  {
    if (v2) {
      BOOL v4 = 0;
    }
    else {
      BOOL v4 = v1 == 92;
    }
    int v2 = v4;
    int v5 = *(unsigned __int8 *)v3++;
    int v1 = v5;
  }

  return res_9_hnok(v3);
}

int res_9_dnok(const char *a1)
{
  while (1)
  {
    int v1 = *(unsigned __int8 *)a1;
    if (!*a1) {
      break;
    }
    ++a1;
  }

  return 1;
}

void res_9_putlong(u_int32_t a1, u_char *a2)
{
}

u_int32_t res_9_getlong(const u_char *src)
{
  return res_9_ns_get32(src);
}

u_int16_t res_9_getshort(const u_char *src)
{
  return res_9_ns_get16(src);
}

void _res_9_h_errno_set(__res_9_state *res, int err)
{
  res->res_h_errno = err;
  *MEMORY[0x1895FB758] = err;
}

void res_client_close(void *a1)
{
  if (a1)
  {
    int v2 = (void *)a1[67];
    if (v2) {
      free(v2);
    }
    free(a1);
  }

void *res_state_new()
{
  v0 = calloc(1uLL, 0x228uLL);
  int v1 = v0;
  if (v0)
  {
    *((_DWORD *)v0 + 127) = 9;
    int v2 = calloc(1uLL, 0x3A8uLL);
    v1[67] = v2;
    if (!v2)
    {
      free(v1);
      return 0LL;
    }
  }

  return v1;
}

int res_9_init(void)
{
  v0 = (int32x2_t *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  __int16 v1 = res_9_randomid();
  __int16 v2 = v1;
  int32x2_t v3 = v0[67];
  if ((*(void *)&v0[1] & 1) != 0)
  {
    uint64_t v5 = *(void *)&v0[1];
    int8x8_t v4 = vbsl_s8((int8x8_t)vceqz_s32(*v0), (int8x8_t)0x200000005LL, (int8x8_t)*v0);
    if (v0[8].i16[2]) {
      __int16 v2 = v0[8].i16[2];
    }
    else {
      __int16 v2 = v1;
    }
  }

  else
  {
    int8x8_t v4 = (int8x8_t)0x200000005LL;
    uint64_t v5 = 1728LL;
  }

  int v6 = (__res_9_state *)_res_static;
  bzero((void *)_res_static, 0x228uLL);
  v0[62].i32[1] = -1;
  int32x2_t *v0 = (int32x2_t)v4;
  v0[8].i16[2] = v2;
  v0[1] = (int32x2_t)v5;
  v0[67] = v3;
  v0[63].i32[1] = 9;
  if (!*(void *)&v3)
  {
    v0[67] = (int32x2_t)calloc(1uLL, 0x3A8uLL);
    int v6 = (__res_9_state *)_res_static;
  }

  return res_9_vinit(v6, 1);
}

int res_9_query(const char *a1, int a2, int a3, u_char *a4, int a5)
{
  int v10 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) != 0) {
    return res_9_nquery(v10, a1, a2, a3, a4, a5);
  }
  int result = res_9_init();
  if (result != -1)
  {
    int v10 = (__res_9_state *)_res_static;
    return res_9_nquery(v10, a1, a2, a3, a4, a5);
  }

  v10->res_h_errno = -1;
  *MEMORY[0x1895FB758] = -1;
  return result;
}

void res_9_fp_nquery(const u_char *a1, int a2, FILE *a3)
{
  int v6 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) == 0)
  {
    if (res_9_init() == -1) {
      return;
    }
    int v6 = (__res_9_state *)_res_static;
  }

  res_9_pquery(v6, a1, a2, a3);
}

void res_9_fp_query(const u_char *a1, FILE *a2)
{
}

void res_9_p_query(const u_char *a1)
{
}

const char *__cdecl res_9_hostalias_1(const char *a1)
{
  _res_static = MEMORY[0x1895F8EF8];
  return res_9_hostalias_2(MEMORY[0x1895F8EF8], a1, res_9_hostalias_1_abuf, 0x401uLL);
}

void res_9_close(void)
{
  _res_static = MEMORY[0x1895F8EF8];
  res_9_nclose(MEMORY[0x1895F8EF8]);
}

int res_9_isourserver(const sockaddr_in *a1)
{
  _res_static = MEMORY[0x1895F8EF8];
  return res_9_ourserver_p(MEMORY[0x1895F8EF8], (uint64_t)a1);
}

int res_9_mkquery( int a1, const char *a2, int a3, int a4, const u_char *a5, int a6, const u_char *a7, u_char *a8, int a9)
{
  uint64_t v17 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) != 0) {
    return res_9_nmkquery(v17, a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }
  int result = res_9_init();
  if (result != -1)
  {
    uint64_t v17 = (__res_9_state *)_res_static;
    return res_9_nmkquery(v17, a1, a2, a3, a4, a5, a6, a7, a8, a9);
  }

  v17->res_h_errno = -1;
  *MEMORY[0x1895FB758] = -1;
  return result;
}

int res_9_querydomain(const char *a1, const char *a2, int a3, int a4, u_char *a5, int a6)
{
  int v12 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) != 0) {
    return res_9_nquerydomain(v12, a1, a2, a3, a4, a5, a6);
  }
  int result = res_9_init();
  if (result != -1)
  {
    int v12 = (__res_9_state *)_res_static;
    return res_9_nquerydomain(v12, a1, a2, a3, a4, a5, a6);
  }

  v12->res_h_errno = -1;
  *MEMORY[0x1895FB758] = -1;
  return result;
}

int res_9_search(const char *a1, int a2, int a3, u_char *a4, int a5)
{
  int v10 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) != 0) {
    return res_9_nsearch(v10, a1, a2, a3, a4, a5);
  }
  int result = res_9_init();
  if (result != -1)
  {
    int v10 = (__res_9_state *)_res_static;
    return res_9_nsearch(v10, a1, a2, a3, a4, a5);
  }

  v10->res_h_errno = -1;
  *MEMORY[0x1895FB758] = -1;
  return result;
}

int res_9_send(const u_char *a1, int a2, u_char *a3, int a4)
{
  uint64_t v8 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) == 0)
  {
    int result = res_9_init();
    if (result == -1) {
      return result;
    }
    uint64_t v8 = (__res_9_state *)_res_static;
  }

  return res_9_nsend(v8, a1, a2, a3, a4);
}

int res_9_sendsigned(const u_char *a1, int a2, res_9_ns_tsig_key *a3, u_char *a4, int a5)
{
  int v10 = (__res_9_state *)MEMORY[0x1895F8EF8];
  _res_static = MEMORY[0x1895F8EF8];
  if ((*(_BYTE *)(MEMORY[0x1895F8EF8] + 8LL) & 1) == 0)
  {
    int result = res_9_init();
    if (result == -1) {
      return result;
    }
    int v10 = (__res_9_state *)_res_static;
  }

  return res_9_nsendsigned(v10, a1, a2, a3, a4, a5);
}

void res_9_fp_resstat(const res_9_state a1, FILE *a2)
{
  u_long v4 = 1LL;
  fwrite(";; res options:", 0xFuLL, 1uLL, a2);
  do
  {
    if ((a1->options & v4) != 0)
    {
      uint64_t v5 = res_9_p_option(v4);
      fprintf(a2, " %s", v5);
    }

    v4 *= 2LL;
  }

  while (v4);
  putc(10, a2);
}

const char *__cdecl res_9_p_option(u_long option)
{
  if ((uint64_t)option > 1023)
  {
    if ((uint64_t)option < 0x100000)
    {
      if ((uint64_t)option > 4095)
      {
        if (option == 4096) {
          return "noaliases";
        }
        if (option == 0x2000) {
          return "inet6";
        }
      }

      else
      {
        if (option == 1024) {
          return "insecure1";
        }
        if (option == 2048) {
          return "insecure2";
        }
      }
    }

    else if ((uint64_t)option <= 0xFFFFFFF)
    {
      if (option == 0x100000) {
        return "no-tld-query";
      }
      if (option == 0x200000) {
        return "dnssec";
      }
    }

    else
    {
      switch(option)
      {
        case 0x10000000uLL:
          return "dname";
        case 0x20000000uLL:
          return "a6";
        case 0x40000000uLL:
          return "edns0";
      }
    }

LABEL_41:
    __int16 v1 = res_9_p_option_nbuf;
    __sprintf_chk(res_9_p_option_nbuf, 0, 0x28uLL, "?0x%lx?", option);
    return v1;
  }

  if ((uint64_t)option > 31)
  {
    if ((uint64_t)option <= 127)
    {
      if (option == 32) {
        return "igntc";
      }
      if (option == 64) {
        return "recurs";
      }
    }

    else
    {
      switch(option)
      {
        case 0x80uLL:
          return "defnam";
        case 0x100uLL:
          return "styopn";
        case 0x200uLL:
          return "dnsrch";
      }
    }

    goto LABEL_41;
  }

  __int16 v1 = "init";
  switch(option)
  {
    case 1uLL:
      return v1;
    case 2uLL:
      __int16 v1 = "debug";
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      goto LABEL_41;
    case 4uLL:
      __int16 v1 = "aaonly(unimpl)";
      break;
    case 8uLL:
      __int16 v1 = "usevc";
      break;
    default:
      if (option != 16) {
        goto LABEL_41;
      }
      __int16 v1 = "primry(unimpl)";
      break;
  }

  return v1;
}

void res_9_pquery(const res_9_state a1, const u_char *a2, int a3, FILE *a4)
{
  if (res_9_ns_initparse(a2, a3, &v26) < 0)
  {
    int v23 = __error();
    size_t v24 = strerror(*v23);
    fprintf(a4, ";; ns_initparse: %s\n", v24);
    return;
  }

  res_9_ns_msg v25 = v26;
  int v6 = res_9_ns_msg_getflag(&v25, 1);
  res_9_ns_msg v25 = v26;
  int v7 = res_9_ns_msg_getflag(&v25, 9);
  int id = v26._id;
  int v9 = v26._counts[0];
  int v10 = v26._counts[1];
  int v11 = v26._counts[2];
  int v12 = v26._counts[3];
  u_long pfcode = a1->pfcode;
  if (pfcode && (pfcode & 0x800) == 0 && !v7)
  {
    BOOL v14 = 1;
    goto LABEL_7;
  }

  uint64_t v15 = __res_opcodes[v6];
  unsigned int v16 = res_9_sym_ntos((const res_9_sym *)&__res_p_rcode_syms, v7, 0LL);
  fprintf(a4, ";; ->>HEADER<<- opcode: %s, status: %s, id: %d\n", v15, v16, id);
  u_long pfcode = a1->pfcode;
  BOOL v14 = (pfcode & 0x800) == 0;
  if (pfcode)
  {
LABEL_7:
    if (v14) {
      goto LABEL_9;
    }
  }

  putc(59, a4);
  u_long pfcode = a1->pfcode;
LABEL_9:
  if (!pfcode || (pfcode & 0x200) != 0)
  {
    fwrite("; flags:", 8uLL, 1uLL, a4);
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 0)) {
      fwrite(" qr", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 2)) {
      fwrite(" aa", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 3)) {
      fwrite(" tc", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 4)) {
      fwrite(" rd", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 5)) {
      fwrite(" ra", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 6)) {
      fwrite(" ??", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 7)) {
      fwrite(" ad", 3uLL, 1uLL, a4);
    }
    res_9_ns_msg v25 = v26;
    if (res_9_ns_msg_getflag(&v25, 8)) {
      fwrite(" cd", 3uLL, 1uLL, a4);
    }
  }

  u_long v17 = a1->pfcode;
  if (!v17 || (v17 & 0x100) != 0)
  {
    if (v6 == 5) {
      uint64_t v18 = (const res_9_sym *)&__res_p_update_section_syms;
    }
    else {
      uint64_t v18 = (const res_9_sym *)&__res_p_default_section_syms;
    }
    int v19 = res_9_sym_ntos(v18, 0, 0LL);
    fprintf(a4, "; %s: %d", v19, v9);
    int v20 = res_9_sym_ntos(v18, 1, 0LL);
    fprintf(a4, ", %s: %d", v20, v10);
    uint64_t v21 = res_9_sym_ntos(v18, 2, 0LL);
    fprintf(a4, ", %s: %d", v21, v11);
    int v22 = res_9_sym_ntos(v18, 3, 0LL);
    fprintf(a4, ", %s: %d", v22, v12);
    u_long v17 = a1->pfcode;
  }

  if (!v17 || (v17 & 0xB00) != 0) {
    putc(10, a4);
  }
  do_section((uint64_t)a1, (uint64_t)&v26, ns_s_qd, 16, a4);
  do_section((uint64_t)a1, (uint64_t)&v26, ns_s_an, 32, a4);
  do_section((uint64_t)a1, (uint64_t)&v26, ns_s_ns, 64, a4);
  do_section((uint64_t)a1, (uint64_t)&v26, ns_s_ar, 128, a4);
  if (!v9 && !v10 && !v11 && !v12) {
    putc(10, a4);
  }
}

const char *__cdecl res_9_p_rcode(int a1)
{
  return res_9_sym_ntos((const res_9_sym *)&__res_p_rcode_syms, a1, 0LL);
}

const char *__cdecl res_9_p_section(int section, int opcode)
{
  if (opcode == 5) {
    int32x2_t v3 = (const res_9_sym *)&__res_p_update_section_syms;
  }
  else {
    int32x2_t v3 = (const res_9_sym *)&__res_p_default_section_syms;
  }
  return res_9_sym_ntos(v3, section, 0LL);
}

void do_section(uint64_t a1, uint64_t a2, res_9_ns_sect a3, int a4, FILE *a5)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v5 = *(void *)(a1 + 384);
  int v6 = v5 & a4;
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    return;
  }
  int v12 = malloc(do_section_buflen);
  if (!v12)
  {
    fwrite(";; memory allocation failure\n", 0x1DuLL, 1uLL, a5);
    return;
  }

  unsigned int v13 = v12;
  __int128 v14 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)&v22.name[32] = *(_OWORD *)(a2 + 32);
  *(_OWORD *)&v22.name[48] = v14;
  *(_OWORD *)&v22.name[64] = *(_OWORD *)(a2 + 64);
  __int128 v15 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v22.name = *(_OWORD *)a2;
  *(_OWORD *)&v22.name[16] = v15;
  int v16 = 0;
  if (res_9_ns_msg_getflag((res_9_ns_msg *)&v22, 1) == 5) {
    u_long v17 = (const res_9_sym *)&__res_p_update_section_syms;
  }
  else {
    u_long v17 = (const res_9_sym *)&__res_p_default_section_syms;
  }
  while (!res_9_ns_parserr((res_9_ns_msg *)a2, a3, v16, &v22))
  {
    if (v6 && !v16 && (*(_BYTE *)(a1 + 385) & 1) != 0)
    {
      uint64_t v18 = res_9_sym_ntos(v17, a3, 0LL);
      fprintf(a5, ";; %s SECTION:\n", v18);
    }

    if (a3 == ns_s_ar)
    {
      if (v22.type == 41)
      {
        fprintf(a5, "; EDNS: version: %u, udp=%u, flags=%04x\n");
        goto LABEL_21;
      }
    }

    else if (a3 == ns_s_qd)
    {
      res_9_p_type(v22.type);
      res_9_p_class(v22.rr_class);
      fprintf(a5, ";;\t%s, type = %s, class = %s\n");
      goto LABEL_21;
    }

    if (res_9_ns_sprintrr((const res_9_ns_msg *)a2, &v22, 0LL, 0LL, (char *)v13, do_section_buflen) < 0)
    {
      if (*__error() != 28)
      {
        uint64_t v21 = __error();
        strerror(*v21);
        fprintf(a5, ";; ns_sprintrr: %s\n");
        goto LABEL_33;
      }

      free(v13);
      if (do_section_buflen >= 0x20000
        || (size_t v19 = do_section_buflen + 1024LL, do_section_buflen += 1024, (v13 = malloc(v19)) == 0LL))
      {
        fwrite(";; memory allocation failure\n", 0x1DuLL, 1uLL, a5);
        return;
      }
    }

    else
    {
      fputs((const char *)v13, a5);
      fputc(10, a5);
LABEL_21:
      ++v16;
    }
  }

  if (*__error() == 19)
  {
    if (v6 && v16 >= 1 && (*(_BYTE *)(a1 + 385) & 1) != 0) {
      putc(10, a5);
    }
  }

  else
  {
    int v20 = __error();
    strerror(*v20);
    fprintf(a5, ";; ns_parserr: %s\n");
  }

LABEL_33:
  free(v13);
}

const u_char *__cdecl res_9_p_cdnname(const u_char *a1, const u_char *a2, int a3, FILE *a4)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v6 = res_9_dn_expand(a2, &a2[a3], a1, v9, 1025);
  if (v6 < 0) {
    return 0LL;
  }
  int v7 = v6;
  if (v9[0]) {
    fputs(v9, a4);
  }
  else {
    putc(46, a4);
  }
  return &a1[v7];
}

const u_char *__cdecl res_9_p_cdname(const u_char *a1, const u_char *a2, FILE *a3)
{
  return res_9_p_cdnname(a1, a2, 512, a3);
}

const u_char *__cdecl res_9_p_fqnname(const u_char *cp, const u_char *msg, int a3, char *a4, int a5)
{
  int v8 = res_9_dn_expand(msg, &cp[a3], cp, a4, a5);
  if ((v8 & 0x80000000) == 0)
  {
    int v9 = v8;
    int v10 = strlen(a4);
    if (v10 && a4[v10 - 1] == 46) {
      return &cp[v9];
    }
    if (v10 + 1 < a5)
    {
      *(_WORD *)&a4[v10] = 46;
      return &cp[v9];
    }
  }

  return 0LL;
}

const u_char *__cdecl res_9_p_fqname(const u_char *a1, const u_char *a2, FILE *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  u_long v4 = res_9_p_fqnname(a1, a2, 255, v6, 1025);
  if (v4) {
    fputs(v6, a3);
  }
  return v4;
}

int res_9_sym_ston(const res_9_sym *a1, const char *a2, int *a3)
{
  uint64_t v5 = a1;
  name = a1->name;
  if (name)
  {
    while (strcasecmp(a2, name))
    {
      uint64_t v7 = v5 + 1;
      name = v5[1].name;
      ++v5;
      if (!name)
      {
        if (!a3) {
          goto LABEL_7;
        }
        goto LABEL_5;
      }
    }

    if (!a3) {
      return v5->number;
    }
    int v8 = 1;
    goto LABEL_10;
  }

  uint64_t v7 = a1;
  if (a3)
  {
LABEL_5:
    int v8 = 0;
    uint64_t v5 = v7;
LABEL_10:
    *a3 = v8;
    return v5->number;
  }

const char *__cdecl res_9_sym_ntos(const res_9_sym *a1, int a2, int *a3)
{
  name = a1->name;
  if (!name) {
    goto LABEL_8;
  }
  if (a1->number != a2)
  {
    p_name = &a1[1].name;
    while (1)
    {
      name = *p_name;
      if (!*p_name) {
        break;
      }
      int v6 = *((_DWORD *)p_name - 2);
      p_name += 3;
      if (v6 == a2) {
        goto LABEL_6;
      }
    }

LABEL_6:
  if (a3)
  {
    int v7 = 1;
LABEL_9:
    *a3 = v7;
  }

  return name;
}

  int v11 = *a3;
  if (v11) {
    int v12 = a5 < 1;
  }
  else {
    int v12 = 1;
  }
  if (!v12)
  {
    do
    {
      if (res_9_ns_samename(*(const char **)(v11 + 16), a2) != 1)
      {
        unsigned int v13 = add_addrs(a1, v11, a4, a5);
        a4 += 8 * (uint64_t)v13;
        a5 -= v13;
        int v10 = (v13 + v10);
      }

      int v11 = *(void *)(v11 + 8);
      if (v11) {
        __int128 v14 = a5 <= 0;
      }
      else {
        __int128 v14 = 1;
      }
    }

    while (!v14);
  }

  res_9_ns_rr v22 = *__error();
  if ((*(_BYTE *)(a1 + 8) & 2) != 0) {
    res_dprintf("satisfy(%s): %d", v15, v16, v17, v18, v19, v20, v21, (char)a2);
  }
  *__error() = v22;
  return v10;
}

const char *__cdecl res_9_sym_ntop(const res_9_sym *a1, int a2, int *a3)
{
  if (a1->name)
  {
    p_humanname = &a1->humanname;
    while (*((_DWORD *)p_humanname - 4) != a2)
    {
      uint64_t v5 = p_humanname[2];
      p_humanname += 3;
      if (!v5) {
        goto LABEL_5;
      }
    }

    if (a3) {
      *a3 = 1;
    }
    return *p_humanname;
  }

  else
  {
LABEL_5:
    int v6 = res_9_sym_ntop_unname;
    __sprintf_chk(res_9_sym_ntop_unname, 0, 0x14uLL, "%d", a2);
    if (a3) {
      *a3 = 0;
    }
  }

  return v6;
}

const char *__cdecl res_9_p_type(int a1)
{
  __int16 v2 = res_9_sym_ntos(__res_9_p_type_syms, a1, &v5);
  if (v5) {
    return v2;
  }
  int32x2_t v3 = res_9_p_type_typebuf;
  __sprintf_chk(res_9_p_type_typebuf, 0, 0x14uLL, "TYPE%d", a1);
  return v3;
}

const char *__cdecl res_9_p_class(int a1)
{
  __int16 v2 = res_9_sym_ntos(&__res_p_class_syms, a1, &v5);
  if (v5) {
    return v2;
  }
  int32x2_t v3 = res_9_p_class_classbuf;
  __sprintf_chk(res_9_p_class_classbuf, 0, 0x14uLL, "CLASS%d", a1);
  return v3;
}

const char *__cdecl res_9_p_time(u_int32_t a1)
{
  if (res_9_ns_format_ttl(a1, res_9_p_time_nbuf, 0x28uLL) < 0) {
    __sprintf_chk(res_9_p_time_nbuf, 0, 0x28uLL, "%u", a1);
  }
  return res_9_p_time_nbuf;
}

int res_9_loc_aton(const char *ascii, u_char *binary)
{
  uint64_t v58 = 0LL;
  unsigned int v59 = ascii;
  size_t v4 = strlen(ascii);
  int v5 = latlon2ul((unsigned __int8 **)&v59, (int *)&v58 + 1);
  int v6 = latlon2ul((unsigned __int8 **)&v59, (int *)&v58);
  int result = 0;
  if ((_DWORD)v58 + HIDWORD(v58) == 3)
  {
    if (HIDWORD(v58) == 1 && (_DWORD)v58 == 2)
    {
      int v9 = v6;
      int v6 = v5;
    }

    else
    {
      int result = 0;
      if (HIDWORD(v58) != 2) {
        return result;
      }
      int v9 = v5;
      if ((_DWORD)v58 != 1) {
        return result;
      }
    }

    int v10 = (unsigned __int8 *)v59;
    int v11 = *(unsigned __int8 *)v59;
    if (v11 == 45)
    {
      int v10 = (unsigned __int8 *)(v59 + 1);
      int v11 = *(unsigned __int8 *)++v59;
      int v12 = -1;
    }

    else
    {
      int v12 = 1;
    }

    if (v11 == 43)
    {
      int v13 = *++v10;
      int v11 = v13;
      unsigned int v59 = (const char *)v10;
    }

    if ((v11 - 48) > 9)
    {
      int v16 = 0;
    }

    else
    {
      int v14 = 0;
      do
      {
        int v15 = *++v10;
        int v14 = 10 * v14 + (char)v11 - 48;
        int v11 = v15;
      }

      while ((v15 - 48) < 0xA);
      int v16 = 100 * v14;
    }

    unsigned int v59 = (const char *)v10;
    if (v11 == 46)
    {
      u_long v17 = v10 + 1;
      unsigned int v59 = (const char *)(v10 + 1);
      int v18 = v10[1];
      if ((v18 - 48) > 9)
      {
        int v21 = 0;
      }

      else
      {
        u_long v17 = v10 + 2;
        unsigned int v59 = (const char *)(v10 + 2);
        int v19 = 10 * (char)v18;
        int v20 = v10[2];
        if ((v20 - 48) <= 9)
        {
          v10 += 3;
          unsigned int v59 = (const char *)v10;
          int v21 = v19 + (char)v20 - 528;
LABEL_28:
          res_9_ns_rr v22 = &ascii[v4];
          int v23 = (v21 + v16) * v12;
          uint64_t v24 = MEMORY[0x1895F8770];
          do
          {
            uint64_t v25 = *v10;
            else {
              int v26 = *(_DWORD *)(v24 + 4 * v25 + 60) & 0x4000;
            }
            int v27 = v10 + 1;
            if (v26) {
              BOOL v28 = 1;
            }
            else {
              BOOL v28 = v10 >= (unsigned __int8 *)v22;
            }
            ++v10;
          }

          while (!v28);
          int v29 = v27 - 1;
          unsigned int v59 = (const char *)v29;
          do
          {
            unsigned int v30 = v29;
            int v31 = (char)*v29;
            if (v31 < 0) {
              int v32 = __maskrune(v31, 0x4000uLL);
            }
            else {
              int v32 = *(_DWORD *)(v24 + 4LL * v31 + 60) & 0x4000;
            }
            int v29 = v30 + 1;
            if (v32) {
              BOOL v33 = v30 >= (unsigned __int8 *)v22;
            }
            else {
              BOOL v33 = 1;
            }
          }

          while (!v33);
          int v34 = v23 + 10000000;
          unsigned int v59 = (const char *)v30;
          if (v30 >= (unsigned __int8 *)v22)
          {
            u_char v35 = 18;
          }

          else
          {
            u_char v35 = precsize_aton((unsigned __int8 **)&v59);
            char v36 = v59;
            do
            {
              uint64_t v37 = *(unsigned __int8 *)v36;
              if (*v36 < 0) {
                int v38 = __maskrune(v37, 0x4000uLL);
              }
              else {
                int v38 = *(_DWORD *)(v24 + 4 * v37 + 60) & 0x4000;
              }
              char v39 = v36 + 1;
              if (v38) {
                BOOL v40 = 1;
              }
              else {
                BOOL v40 = v36 >= v22;
              }
              ++v36;
            }

            while (!v40);
            int v41 = (unsigned __int8 *)(v39 - 1);
            do
            {
              uint64_t v42 = v41;
              int v43 = (char)*v41;
              if (v43 < 0) {
                int v44 = __maskrune(v43, 0x4000uLL);
              }
              else {
                int v44 = *(_DWORD *)(v24 + 4LL * v43 + 60) & 0x4000;
              }
              int v41 = v42 + 1;
              if (v44) {
                BOOL v45 = v42 >= (unsigned __int8 *)v22;
              }
              else {
                BOOL v45 = 1;
              }
            }

            while (!v45);
            unsigned int v59 = (const char *)v42;
            if (v42 < (unsigned __int8 *)v22)
            {
              u_char v46 = precsize_aton((unsigned __int8 **)&v59);
              int v47 = v59;
              do
              {
                uint64_t v48 = *(unsigned __int8 *)v47;
                if (*v47 < 0) {
                  int v49 = __maskrune(v48, 0x4000uLL);
                }
                else {
                  int v49 = *(_DWORD *)(v24 + 4 * v48 + 60) & 0x4000;
                }
                uint64_t v50 = v47 + 1;
                if (v49) {
                  BOOL v51 = 1;
                }
                else {
                  BOOL v51 = v47 >= v22;
                }
                ++v47;
              }

              while (!v51);
              unsigned int v52 = (unsigned __int8 *)(v50 - 1);
              do
              {
                unint64_t v53 = v52;
                int v54 = (char)*v52;
                if (v54 < 0) {
                  int v55 = __maskrune(v54, 0x4000uLL);
                }
                else {
                  int v55 = *(_DWORD *)(v24 + 4LL * v54 + 60) & 0x4000;
                }
                unsigned int v52 = v53 + 1;
                if (v55) {
                  BOOL v56 = v53 >= (unsigned __int8 *)v22;
                }
                else {
                  BOOL v56 = 1;
                }
              }

              while (!v56);
              unsigned int v59 = (const char *)v53;
              else {
                u_char v57 = precsize_aton((unsigned __int8 **)&v59);
              }
              goto LABEL_88;
            }
          }

          u_char v57 = 19;
          u_char v46 = 22;
LABEL_88:
          u_char *binary = 0;
          binary[1] = v35;
          binary[2] = v46;
          binary[3] = v57;
          binary[4] = HIBYTE(v6);
          binary[5] = BYTE2(v6);
          binary[6] = BYTE1(v6);
          binary[7] = v6;
          binary[8] = HIBYTE(v9);
          binary[9] = BYTE2(v9);
          binary[10] = BYTE1(v9);
          binary[11] = v9;
          binary[12] = HIBYTE(v34);
          binary[13] = BYTE2(v34);
          binary[14] = BYTE1(v34);
          int result = 16;
          binary[15] = v34;
          return result;
        }

        int v21 = v19 - 480;
      }

      int v10 = v17;
      goto LABEL_28;
    }

    int v21 = 0;
    goto LABEL_28;
  }

  return result;
}

uint64_t latlon2ul(unsigned __int8 **a1, int *a2)
{
  size_t v4 = *a1;
  int v5 = **a1;
  if ((v5 - 48) > 9)
  {
    int v6 = 0;
  }

  else
  {
    int v6 = 0;
    do
    {
      int v7 = *++v4;
      int v6 = 10 * v6 + (char)v5 - 48;
      LOBYTE(v5) = v7;
    }

    while ((v7 - 48) < 0xA);
  }

  int v8 = v4 - 1;
  uint64_t v9 = MEMORY[0x1895F8770];
  do
  {
    int v10 = v8[1];
    else {
      int v11 = *(_DWORD *)(v9 + 4LL * v8[1] + 60) & 0x4000;
    }
    ++v8;
  }

  while (v11);
  if ((v10 - 48) > 9)
  {
    int v13 = 0;
  }

  else
  {
    int v12 = *v8;
    if ((v12 - 48) > 9)
    {
      int v13 = 0;
    }

    else
    {
      int v13 = 0;
      do
      {
        int v14 = *++v8;
        int v13 = 10 * v13 + (char)v12 - 48;
        LOBYTE(v12) = v14;
      }

      while ((v14 - 48) < 0xA);
    }

    --v8;
    do
    {
      int v15 = v8[1];
      else {
        int v16 = *(_DWORD *)(v9 + 4LL * v8[1] + 60) & 0x4000;
      }
      ++v8;
    }

    while (v16);
    if ((v15 - 48) <= 9)
    {
      int v17 = *v8;
      if ((v17 - 48) > 9)
      {
        int v18 = 0;
      }

      else
      {
        int v18 = 0;
        char v19 = *v8;
        do
        {
          int v20 = *++v8;
          int v17 = v20;
          int v18 = 10 * v18 + v19 - 48;
          char v19 = v20;
        }

        while ((v20 - 48) < 0xA);
      }

      if (v17 == 46)
      {
        int v22 = v8[1];
        if ((v22 - 48) > 9)
        {
          int v21 = 0;
          ++v8;
        }

        else
        {
          int v23 = (char)v22;
          uint64_t v24 = v8 + 2;
          int v25 = v8[2];
          int v26 = 100 * v23;
          if ((v25 - 48) > 9)
          {
            int v21 = v26 - 4800;
          }

          else
          {
            int v27 = (char)v25;
            uint64_t v24 = v8 + 3;
            int v28 = v8[3];
            int v21 = v26 + 10 * v27 - 5280;
            if ((v28 - 48) <= 9)
            {
              v8 += 4;
              int v21 = v21 + (char)v28 - 48;
              goto LABEL_39;
            }
          }

          int v8 = v24;
        }
      }

      else
      {
        int v21 = 0;
      }

uint64_t precsize_aton(unsigned __int8 **a1)
{
  __int16 v1 = *a1;
  int v2 = **a1;
  if ((v2 - 48) > 9)
  {
    int v5 = 0;
  }

  else
  {
    int v3 = 0;
    do
    {
      int v4 = *++v1;
      int v3 = 10 * v3 + (char)v2 - 48;
      int v2 = v4;
    }

    while ((v4 - 48) < 0xA);
    int v5 = 100 * v3;
  }

  if (v2 != 46)
  {
    int v10 = 0;
    goto LABEL_14;
  }

  int v7 = v1 + 1;
  int v6 = v1[1];
  if ((v6 - 48) > 9)
  {
    int v10 = 0;
LABEL_13:
    __int16 v1 = v7;
    goto LABEL_14;
  }

  int v7 = v1 + 2;
  int v8 = v1[2];
  int v9 = 10 * (char)v6;
  if ((v8 - 48) > 9)
  {
    int v10 = v9 - 480;
    goto LABEL_13;
  }

  v1 += 3;
  int v10 = v9 + (char)v8 - 528;
LABEL_14:
  uint64_t v11 = 0LL;
  unsigned int v12 = v10 + v5;
  while (v11 != 9)
  {
    int v13 = v11 + 1;
    unsigned int v14 = poweroften_0[++v11];
    if (v12 < v14)
    {
      LODWORD(v1_dns_print_resource_record_lock((uint64_t)r, f, 1) = v13 - 1;
      break;
    }
  }

  int v15 = v12 / poweroften_0[v11];
  if (v15 >= 9) {
    LOBYTE(v15) = 9;
  }
  *a1 = v1;
  return (v11 | (16 * v15));
}

const char *__cdecl res_9_loc_ntoa(const u_char *binary, char *ascii)
{
  if (ascii) {
    int v2 = ascii;
  }
  else {
    int v2 = (char *)&res_9_loc_ntoa_tmpbuf;
  }
  if (*binary)
  {
    strcpy(v2, "; error: unknown LOC RR version");
  }

  else
  {
    unsigned int v4 = *((_DWORD *)binary + 2);
    int v5 = bswap32(*((_DWORD *)binary + 1));
    unsigned int v6 = bswap32(*((_DWORD *)binary + 3));
    BOOL v7 = v6 >= 0x989680;
    if (v6 >= 0x989680) {
      signed int v8 = v6 - 10000000;
    }
    else {
      signed int v8 = 10000000 - v6;
    }
    int v9 = (const char *)&unk_1874AA85D;
    if (!v7) {
      int v9 = "-";
    }
    int v38 = v9;
    BOOL v10 = v5 < 0;
    if (v5 < 0) {
      signed int v11 = v5 ^ 0x80000000;
    }
    else {
      signed int v11 = -(v5 ^ 0x80000000);
    }
    unsigned __int8 v12 = binary[1];
    unsigned __int8 v13 = binary[2];
    unsigned __int8 v14 = binary[3];
    int v15 = bswap32(v4);
    int v35 = v11 / 3600000;
    uint64_t v16 = 78LL;
    if (!v10) {
      uint64_t v16 = 83LL;
    }
    int v37 = v11 % 1000;
    int v36 = v11 / 1000 % 60;
    uint64_t v33 = v16;
    int v34 = v11 / 60000 % 60;
    if (v15 < 0) {
      signed int v17 = v15 ^ 0x80000000;
    }
    else {
      signed int v17 = -(v15 ^ 0x80000000);
    }
    int v32 = v17 / 3600000;
    int v18 = v8 / 100;
    if (v15 < 0) {
      uint64_t v19 = 69LL;
    }
    else {
      uint64_t v19 = 87LL;
    }
    int v20 = v17 % 1000;
    int v31 = v17 / 1000 % 60;
    int v21 = v17 / 60000 % 60;
    int v22 = v8 % 100;
    precsize_ntoa_0(v12);
    int v23 = strdup(precsize_ntoa_retbuf);
    precsize_ntoa_0(v13);
    uint64_t v24 = strdup(precsize_ntoa_retbuf);
    precsize_ntoa_0(v14);
    int v25 = strdup(precsize_ntoa_retbuf);
    int v26 = v25;
    int v27 = "?";
    if (v23) {
      int v28 = v23;
    }
    else {
      int v28 = "?";
    }
    if (v24) {
      uint64_t v29 = v24;
    }
    else {
      uint64_t v29 = "?";
    }
    if (v25) {
      int v27 = v25;
    }
    sprintf( v2,  "%d %.2d %.2d.%.3d %c %d %.2d %.2d.%.3d %c %s%d.%.2dm %sm %sm %sm",  v35,  v34,  v36,  v37,  v33,  v32,  v21,  v31,  v20,  v19,  v38,  v18,  v22,  v28,  v29,  v27);
    if (v23) {
      free(v23);
    }
    if (v24) {
      free(v24);
    }
    if (v26) {
      free(v26);
    }
  }

  return v2;
}

uint64_t precsize_ntoa_0(unsigned __int8 a1)
{
  unsigned int v1 = a1 >> 4;
  if (v1 >= 0xA) {
    v1 -= 10;
  }
  unsigned int v2 = a1 & 0xF;
  if (v2 >= 0xA) {
    unsigned int v2 = (a1 & 0xF) - 10;
  }
  unsigned int v3 = poweroften_0[v2] * v1;
  return __sprintf_chk(precsize_ntoa_retbuf, 0, 0xCuLL, "%lu.%.2lu", v3 / 0x64uLL, v3 % 0x64);
}

int res_9_dn_count_labels(const char *a1)
{
  int v2 = strlen(a1);
  if (v2 < 1) {
    return 0;
  }
  uint64_t v3 = 0LL;
  int v4 = 0;
  do
  {
    if (a1[v3] == 46) {
      ++v4;
    }
    ++v3;
  }

  while (v2 != v3);
  BOOL v6 = *a1 == 42 && v4 != 0;
  int v7 = v4 - v6;
  if (a1[v2 - 1] == 46) {
    return v7;
  }
  else {
    return v7 + 1;
  }
}

char *__cdecl res_9_p_secstodate(u_long a1)
{
  time_t v5 = a1;
  unsigned int v1 = gmtime(&v5);
  int v2 = v1->tm_year + 1900;
  int v3 = v1->tm_mon + 1;
  v1->tm_mon = v3;
  v1->tm_year = v2;
  __sprintf_chk( res_9_p_secstodate_output,  0,  0xFuLL,  "%04d%02d%02d%02d%02d%02d",  v2,  v3,  v1->tm_mday,  v1->tm_hour,  v1->tm_min,  v1->tm_sec);
  return res_9_p_secstodate_output;
}

u_int16_t res_9_nametoclass(const char *buf, int *success)
{
  int v4 = "IN";
  time_t v5 = &off_18A05EEE8;
  do
  {
    if (!strcasecmp(buf, v4))
    {
      LODWORD(v9) = *((_DWORD *)v5 - 8);
      int v11 = 1;
      if (!success) {
        return v9;
      }
      goto LABEL_15;
    }

    BOOL v6 = *v5;
    v5 += 3;
    int v4 = v6;
  }

  while (v6);
  if (strncasecmp(buf, "CLASS", 5uLL)
    || (v8 = *((unsigned __int8 *)buf + 5), int v7 = buf + 5, (v8 - 48) > 9))
  {
    int v11 = 0;
    LOWORD(v9) = 1;
    if (!success) {
      return v9;
    }
LABEL_15:
    *success = v11;
    return v9;
  }

  unint64_t v9 = strtoul(v7, &__endptr, 10);
  if (*__endptr) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 >= 0x10000;
  }
  int v11 = !v10;
  if (success) {
    goto LABEL_15;
  }
  return v9;
}

u_int16_t res_9_nametotype(const char *buf, int *success)
{
  int v4 = "A";
  time_t v5 = off_18A05E948;
  do
  {
    if (!strcasecmp(buf, v4))
    {
      LODWORD(v9) = *((_DWORD *)v5 - 8);
      int v11 = 1;
      if (!success) {
        return v9;
      }
      goto LABEL_15;
    }

    BOOL v6 = *v5;
    v5 += 3;
    int v4 = v6;
  }

  while (v6);
  if (strncasecmp(buf, "type", 4uLL) || (v8 = *((unsigned __int8 *)buf + 4), int v7 = buf + 4, (v8 - 48) > 9))
  {
    int v11 = 0;
    LOWORD(v9) = 0;
    if (!success) {
      return v9;
    }
LABEL_15:
    *success = v11;
    return v9;
  }

  unint64_t v9 = strtoul(v7, &__endptr, 10);
  if (*__endptr) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = v9 >= 0x10000;
  }
  int v11 = !v10;
  if (success) {
    goto LABEL_15;
  }
  return v9;
}

int res_9_findzonecut( res_9_state a1, const char *a2, res_9_ns_class a3, int a4, char *a5, size_t a6, in_addr *a7, int a8)
{
  uint64_t v16 = (res_9_sockaddr_union *)calloc(a8, 0x80uLL);
  if (!v16) {
    return -1;
  }
  signed int v17 = v16;
  int v18 = res_9_findzonecut2(a1, a2, a3, a4 & 0xFFFFFFF9 | 2, a5, a6, v16, a8);
  int v19 = v18;
  if (v18 >= 1)
  {
    uint64_t v20 = v18;
    p_uint64_t s_addr = &v17->sin.sin_addr.s_addr;
    do
    {
      in_addr_t v22 = *p_s_addr;
      p_s_addr += 32;
      a7->uint64_t s_addr = v22;
      ++a7;
      --v20;
    }

    while (v20);
  }

  free(v17);
  return v19;
}

int res_9_findzonecut2( res_9_state a1, const char *a2, res_9_ns_class a3, int a4, char *a5, size_t a6, res_9_sockaddr_union *a7, int a8)
{
  char v11 = a4;
  uint64_t v193 = *MEMORY[0x1895F89C0];
  int v15 = *__error();
  if ((a1->options & 2) != 0)
  {
    res_9_p_class(a3);
    res_dprintf("START dname='%s' class=%s, zsize=%ld, naddrs=%d", v16, v17, v18, v19, v20, v21, v22, (char)a2);
  }

  *__error() = v15;
  u_long pfcode = a1->pfcode;
  a1->u_long pfcode = pfcode | 0xBF0;
  v187[0] = 0LL;
  v187[1] = 0LL;
  int v31 = *__error();
  if ((a1->options & 2) != 0) {
    res_dprintf("get the soa, and see if it has enough glue", v24, v25, v26, v27, v28, v29, v30, v182);
  }
  *__error() = v31;
  char v185 = v11;
  v183 = a7;
  int v184 = a8;
  uint64_t i = &v192;
  do
  {
LABEL_7:
    uint64_t v33 = (char *)i;
    int msg_low = LOBYTE(i->_msg);
    uint64_t i = (res_9_ns_msg *)((char *)i + 1);
  }

  while (msg_low == 46);
  int v35 = do_query((uint64_t)a1, v33, a3, 6, v191, &v188);
  if (v35 < 0)
  {
    int v51 = *__error();
    if ((a1->options & 2) != 0)
    {
      res_9_p_class(a3);
      res_dprintf("get_soa: do_query('%s', %s) failed (%d)", v70, v71, v72, v73, v74, v75, v76, (char)v33);
    }

    goto LABEL_35;
  }

  if (v35)
  {
    int v43 = *__error();
    if ((a1->options & 2) != 0) {
      res_dprintf("get_soa: CNAME or DNAME found", v36, v37, v38, v39, v40, v41, v42, v182);
    }
    *__error() = v43;
    goto LABEL_13;
  }

  *(_OWORD *)&v190.name[32] = *(_OWORD *)v188._sections;
  *(_OWORD *)&v190.name[48] = *(_OWORD *)&v188._sections[2];
  *(_OWORD *)&v190.name[64] = *(_OWORD *)&v188._sect;
  *(_OWORD *)v190.name = *(_OWORD *)&v188._msg;
  *(_OWORD *)&v190.name[16] = *(_OWORD *)&v188._id;
  int v47 = res_9_ns_msg_getflag((res_9_ns_msg *)&v190, 9);
  int v48 = v188._counts[1];
  if (!v188._counts[1] || v47)
  {
    int v48 = v188._counts[2];
    if (!v188._counts[2])
    {
LABEL_13:
      int v44 = *v33;
      if (*v33)
      {
        for (uint64_t i = (res_9_ns_msg *)v33; ; uint64_t i = (res_9_ns_msg *)((char *)i + 1))
        {
          if (v44 == 92)
          {
            int v45 = BYTE1(i->_msg);
            uint64_t i = (res_9_ns_msg *)((char *)i + 1);
            if (!v45)
            {
              int v51 = 40;
              goto LABEL_35;
            }
          }

          else if (v44 == 46)
          {
            goto LABEL_7;
          }

          int v46 = BYTE1(i->_msg);
          int v44 = v46;
        }
      }

      int v84 = *__error();
      if ((a1->options & 2) != 0) {
        res_dprintf("get_soa: out of labels", v77, v78, v79, v80, v81, v82, v83, v182);
      }
      *__error() = v84;
      int v51 = 39;
      goto LABEL_35;
    }

    res_9_ns_sect v49 = ns_s_ns;
  }

  else
  {
    res_9_ns_sect v49 = ns_s_an;
  }

  int v50 = 0;
  while (1)
  {
    if (res_9_ns_parserr(&v188, v49, v50, &v190) < 0)
    {
      int v52 = *__error();
      if ((a1->options & 2) != 0)
      {
        char v182 = res_9_p_section(v49, 0);
        u_long v60 = "get_soa: ns_parserr(%s, %d) failed";
LABEL_38:
        res_dprintf(v60, v53, v54, v55, v56, v57, v58, v59, v182);
      }

LABEL_60:
      *__error() = v52;
      goto LABEL_61;
    }

    if (v190.type == 6) {
      break;
    }
    if (v190.type == 5 || v190.type == 39) {
      goto LABEL_13;
    }
LABEL_32:
    if (v48 == ++v50) {
      goto LABEL_13;
    }
  }

  if (v190.rr_class != a3) {
    goto LABEL_32;
  }
  if (v190.name[0]) {
    int v61 = &v190;
  }
  else {
    int v61 = (res_9_ns_rr *)".";
  }
  if (v49 == ns_s_ns)
  {
    if (res_9_ns_samename(v33, v61->name) != 1 && res_9_ns_samedomain(v33, v61->name)) {
      goto LABEL_53;
    }
    int v69 = *__error();
    if ((a1->options & 2) != 0) {
      res_dprintf("get_soa: ns_samename() || !ns_samedomain('%s', '%s')", v93, v94, v95, v96, v97, v98, v99, (char)v33);
    }
LABEL_59:
    *__error() = v69;
    int v52 = 41;
    goto LABEL_60;
  }

  if (!res_9_ns_samedomain(v33, v61->name))
  {
    int v69 = *__error();
    if ((a1->options & 2) != 0) {
      res_dprintf("get_soa: ns_samedomain('%s', '%s') == 0", v62, v63, v64, v65, v66, v67, v68, (char)v33);
    }
    goto LABEL_59;
  }

    uint64_t v40 = (__res_9_state *)a1;
    goto LABEL_65;
  }

  int v44 = v21;
  int result = res_nquerydomain_2(a1, a2, 0LL, a3, a4, a5, a6, a7, a8);
  uint64_t v25 = (int)result > 0 || v20;
  if ((v25 & 1) == 0)
  {
    uint64_t v26 = *MEMORY[0x1895FB758];
    uint64_t v21 = v44;
    if (!v44) {
      goto LABEL_24;
    }
    goto LABEL_28;
  }

  return result;
}

LABEL_53:
  if (strlen(v61->name) + 1 > a6)
  {
    int v85 = *__error();
    if ((a1->options & 2) != 0)
    {
      strlen(v61->name);
      res_dprintf("get_soa: zname(%zu) too small (%zu)", v86, v87, v88, v89, v90, v91, v92, a6);
    }

    *__error() = v85;
    int v52 = 40;
    goto LABEL_60;
  }

  strcpy(a5, v61->name);
  if (res_9_ns_name_uncompress(v191, v188._eom, v190.rdata, v189, 0x401uLL) < 0)
  {
    int v52 = *__error();
    if ((a1->options & 2) == 0) {
      goto LABEL_60;
    }
    u_long v60 = "get_soa: ns_name_uncompress failed";
    goto LABEL_38;
  }

  if ((save_ns((uint64_t)a1, &v188, 2u, a5, a3, v185, (uint64_t *)v187) & 0x80000000) != 0)
  {
    int v52 = *__error();
    if ((a1->options & 2) == 0) {
      goto LABEL_60;
    }
    u_long v60 = "get_soa: save_ns failed";
    goto LABEL_38;
  }

  if ((v185 & 1) == 0)
  {
    int v100 = satisfy((uint64_t)a1, v189, (uint64_t *)v187, a7, v184);
    if (v100 > 0) {
      goto LABEL_62;
    }
  }

  int v118 = *__error();
  if ((a1->options & 2) != 0) {
    res_dprintf("get the ns rrset and see if it has enough glue", v111, v112, v113, v114, v115, v116, v117, v182);
  }
  *__error() = v118;
  if (do_query((uint64_t)a1, a5, a3, 2, (u_char *)&v190, &v192))
  {
    int v51 = *__error();
    if ((a1->options & 2) != 0)
    {
      res_9_p_class(a3);
      res_dprintf("get_ns: do_query('%s', %s) failed (%d)", v119, v120, v121, v122, v123, v124, v125, (char)a5);
    }

    goto LABEL_35;
  }

  if ((save_ns((uint64_t)a1, &v192, 1u, a5, a3, v185, (uint64_t *)v187) & 0x80000000) != 0)
  {
    int v51 = *__error();
    if ((a1->options & 2) != 0)
    {
      res_9_p_class(a3);
      res_dprintf("get_ns save_ns('%s', %s) failed", v165, v166, v167, v168, v169, v170, v171, (char)a5);
    }

    uint64_t v33 = a5;
    int v34 = a4;
    int v35 = a6;
    uint64_t v28 = 0;
    uint64_t v36 = 0;
    uint64_t v37 = 0;
LABEL_54:
    if (v28) {
      uint64_t v38 = 1;
    }
    else {
      uint64_t v38 = v24;
    }
    if ((v38 & 1) == 0)
    {
LABEL_58:
      uint64_t v39 = v26;
      int result = res_nquerydomain_2(a1, a2, 0LL, a3, v34, v33, v35, a7, a8);
      uint64_t v26 = v39;
    }

uint64_t res_dprintf( const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  BOOL v10 = (FILE **)MEMORY[0x1895F89D0];
  fputs(";; res_findzonecut: ", (FILE *)*MEMORY[0x1895F89D0]);
  vfprintf(*v10, a1, &a9);
  return fputc(10, *v10);
}

uint64_t satisfy(uint64_t a1, char *a2, uint64_t *a3, _OWORD *a4, int a5)
{
  uint64_t v10 = *a3;
  if (*a3)
  {
    while (res_9_ns_samename(*(const char **)(v10 + 16), a2) != 1)
    {
      uint64_t v10 = *(void *)(v10 + 8);
      if (!v10) {
        goto LABEL_6;
      }
    }

    uint64_t v10 = add_addrs(a1, v10, a4, a5);
    a4 += 8 * (uint64_t)(int)v10;
    a5 -= v10;
  }

uint64_t add_addrs(uint64_t a1, uint64_t a2, _OWORD *a3, int a4)
{
  uint64_t v5 = *(void *)(a2 + 32);
  if (v5)
  {
    int v6 = 0;
    while ((a4 & (a4 >> 31)) - a4 != v6)
    {
      __int128 v7 = *(_OWORD *)(v5 + 16);
      __int128 v8 = *(_OWORD *)(v5 + 32);
      __int128 v9 = *(_OWORD *)(v5 + 64);
      a3[2] = *(_OWORD *)(v5 + 48);
      a3[3] = v9;
      *a3 = v7;
      a3[1] = v8;
      __int128 v10 = *(_OWORD *)(v5 + 80);
      __int128 v11 = *(_OWORD *)(v5 + 96);
      __int128 v12 = *(_OWORD *)(v5 + 128);
      a3[6] = *(_OWORD *)(v5 + 112);
      a3[7] = v12;
      a3[4] = v10;
      a3[5] = v11;
      a3 += 8;
      uint64_t v5 = *(void *)(v5 + 8);
      --v6;
      if (!v5)
      {
        uint64_t v13 = -v6;
        goto LABEL_7;
      }
    }

    return 0LL;
  }

  else
  {
    uint64_t v13 = 0LL;
LABEL_7:
    int v21 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) != 0) {
      res_dprintf("add_addrs: %d", v14, v15, v16, v17, v18, v19, v20, v13);
    }
    *__error() = v21;
  }

  return v13;
}

uint64_t do_query(uint64_t a1, char *a2, int a3, int a4, u_char *a5, res_9_ns_msg *a6)
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  int v10 = res_9_nmkquery((res_9_state)a1, 0, a2, a3, a4, 0LL, 0, 0LL, v36, 512);
  if (v10 < 0)
  {
    int v23 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) == 0) {
      goto LABEL_31;
    }
    uint64_t v24 = "do_query: res_nmkquery failed";
LABEL_30:
    res_dprintf(v24, v16, v17, v18, v19, v20, v21, v22, v34);
    goto LABEL_31;
  }

  int v11 = res_9_nsend((res_9_state)a1, v36, v10, a5, 512);
  if (v11 < 0)
  {
    int v23 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) == 0) {
      goto LABEL_31;
    }
    uint64_t v24 = "do_query: res_nsend failed";
    goto LABEL_30;
  }

  if (!v11)
  {
    int v32 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) != 0) {
      res_dprintf("do_query: res_nsend returned 0", v25, v26, v27, v28, v29, v30, v31, v34);
    }
    *__error() = v32;
    *__error() = 40;
    return 0xFFFFFFFFLL;
  }

  if (res_9_ns_initparse(a5, v11, a6) < 0)
  {
    int v23 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) != 0)
    {
      uint64_t v24 = "do_query: ns_initparse failed";
      goto LABEL_30;
    }

LABEL_31:
    *__error() = v23;
    return 0xFFFFFFFFLL;
  }

  if (a6->_counts[1])
  {
    int v12 = 0;
    LODWORD(v13) = 0;
    while ((res_9_ns_parserr(a6, ns_s_an, v12, &v35) & 0x80000000) == 0)
    {
      BOOL v15 = v35.rr_class == a3 && (v35.type == 5 || v35.type == 39);
      uint64_t v13 = (v13 + v15);
    }

    int v23 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) == 0) {
      goto LABEL_31;
    }
    uint64_t v24 = "do_query: ns_parserr failed";
    goto LABEL_30;
  }

  return 0LL;
}

uint64_t save_ns( uint64_t a1, res_9_ns_msg *a2, unsigned __int32 a3, const char *a4, int a5, char a6, uint64_t *a7)
{
  uint64_t v56 = *MEMORY[0x1895F89C0];
  __int128 v7 = (char *)a2 + 2 * a3;
  int v9 = *((unsigned __int16 *)v7 + 10);
  __int128 v8 = (unsigned __int16 *)(v7 + 20);
  if (!v9) {
    return 0LL;
  }
  int v15 = 0;
  while (1)
  {
    if (res_9_ns_parserr(a2, (res_9_ns_sect)a3, v15, &v54) < 0)
    {
      int v25 = *__error();
      if ((*(_BYTE *)(a1 + 8) & 2) == 0)
      {
LABEL_33:
        *__error() = v25;
        return 0xFFFFFFFFLL;
      }

      char v51 = res_9_p_section(a3, 0);
      uint64_t v33 = "save_ns: ns_parserr(%s, %d) failed";
LABEL_32:
      res_dprintf(v33, v26, v27, v28, v29, v30, v31, v32, v51);
      goto LABEL_33;
    }

    if (v54.type != 2 || v54.rr_class != a5) {
      goto LABEL_28;
    }
    uint64_t v17 = v54.name[0] ? &v54 : (res_9_ns_rr *)".";
    if (res_9_ns_samename(v17->name, a4) != 1) {
      goto LABEL_28;
    }
    uint64_t v18 = v54.name[0] ? &v54 : (res_9_ns_rr *)".";
    uint64_t v19 = *a7;
    if (!*a7) {
      break;
    }
    while (res_9_ns_samename(*(const char **)(v19 + 16), v18->name) != 1)
    {
      uint64_t v19 = *(void *)(v19 + 8);
      if (!v19) {
        goto LABEL_19;
      }
    }

    uint64_t v22 = *(const char **)(v19 + 16);
LABEL_27:
    if ((save_a(a1, a2, 3u, v22, a5, a6, v19) & 0x80000000) != 0)
    {
      int v25 = *__error();
      if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      {
        uint64_t v34 = *(void *)(v19 + 16);
        res_9_p_class(a5);
        res_dprintf("save_ns: save_r('%s', %s) failed", v35, v36, v37, v38, v39, v40, v41, v34);
      }

      goto LABEL_33;
    }

LABEL_28:
  }

    if ((*(_BYTE *)(a1 + 8) & 0x80) == 0) {
      goto LABEL_53;
    }
LABEL_31:
    uint64_t v27 = *(void *)(a1 + 72);
    if (v27)
    {
      uint64_t v43 = 0;
      uint64_t v45 = v21;
      uint64_t v41 = v24;
      uint64_t v42 = v26;
      uint64_t v28 = 0;
      uint64_t v46 = 0;
      uint64_t v29 = 80LL;
      while (1)
      {
        if (!*(_BYTE *)v27 || *(_BYTE *)v27 == 46 && !*(_BYTE *)(v27 + 1)) {
          ++v28;
        }
        int result = res_nquerydomain_2(a1, a2, (const char *)v27, a3, a4, a5, a6, a7, a8);
        if (*__error() == 61) {
          goto LABEL_64;
        }
        uint64_t v30 = *(_DWORD *)(a1 + 496);
        switch(v30)
        {
          case 1:
            uint64_t v31 = 0;
            goto LABEL_47;
          case 2:
            if ((*(void *)a5 & 0xF000000LL) == 0x5000000)
            {
              uint64_t v31 = 0;
              ++v43;
              goto LABEL_47;
            }

            break;
          case 4:
            uint64_t v31 = 0;
            ++v46;
            goto LABEL_47;
        }

        uint64_t v31 = 1;
LABEL_47:
        uint64_t v32 = *(void *)(a1 + 8);
        uint64_t v27 = *(void *)(a1 + v29);
        if (v27)
        {
          v29 += 8LL;
        }

        uint64_t v26 = v42;
        if (!v45)
        {
          uint64_t v33 = a5;
          uint64_t v34 = a4;
          uint64_t v35 = a6;
          LOBYTE(v24) = v41;
          uint64_t v36 = v43;
          uint64_t v37 = v46;
          goto LABEL_54;
        }

        if (v41 & 1 | (v32 >> 20) & 1)
        {
          uint64_t v36 = v43;
          uint64_t v37 = v46;
        }

        else
        {
          uint64_t v33 = a5;
          uint64_t v34 = a4;
          uint64_t v35 = a6;
          uint64_t v36 = v43;
          uint64_t v37 = v46;
          if (!v28) {
            goto LABEL_58;
          }
        }

        goto LABEL_59;
      }
    }

LABEL_19:
  uint64_t v20 = malloc(0x30uLL);
  if (!v20)
  {
    int v25 = *__error();
    if ((*(_BYTE *)(a1 + 8) & 2) == 0) {
      goto LABEL_33;
    }
    uint64_t v33 = "save_ns: malloc failed";
    goto LABEL_32;
  }

  uint64_t v19 = (uint64_t)v20;
  if ((res_9_ns_name_uncompress(a2->_msg, a2->_eom, v54.rdata, __s1, 0x401uLL) & 0x80000000) == 0)
  {
    uint64_t v21 = strdup(__s1);
    *(void *)(v19 + 16) = v21;
    if (!v21)
    {
      int v49 = *__error();
      if ((*(_BYTE *)(a1 + 8) & 2) != 0)
      {
        int v50 = "save_ns: strdup failed";
LABEL_44:
        res_dprintf(v50, v42, v43, v44, v45, v46, v47, v48, v51);
      }

      goto LABEL_45;
    }

    uint64_t v22 = v21;
    *(void *)(v19 + 24) = 0LL;
    *(void *)(v19 + 32) = 0LL;
    *(void *)(v19 + 40) = 0LL;
    uint64_t v23 = a7[1];
    if (v23)
    {
      *(void *)(v23 + 8) = v19;
      uint64_t v23 = a7[1];
    }

    else
    {
      *a7 = v19;
    }

    *(void *)uint64_t v19 = v23;
    *(void *)(v19 + 8) = 0LL;
    a7[1] = v19;
    goto LABEL_27;
  }

  int v49 = *__error();
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    int v50 = "save_ns: ns_name_uncompress failed";
    goto LABEL_44;
  }

uint64_t save_a( uint64_t a1, res_9_ns_msg *a2, unsigned __int32 a3, const char *a4, int a5, char a6, uint64_t a7)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  __int128 v7 = (char *)a2 + 2 * a3;
  int v9 = *((unsigned __int16 *)v7 + 10);
  __int128 v8 = (unsigned __int16 *)(v7 + 20);
  if (!v9) {
    return 0LL;
  }
  int v16 = 0;
  uint64_t v39 = (void *)(a7 + 32);
  while (1)
  {
    if (res_9_ns_parserr(a2, (res_9_ns_sect)a3, v16, &v40) < 0)
    {
      int v28 = *__error();
      if ((*(_BYTE *)(a1 + 8) & 2) == 0) {
        goto LABEL_43;
      }
      char v37 = res_9_p_section(a3, 0);
      uint64_t v36 = "save_a: ns_parserr(%s, %d) failed";
      goto LABEL_42;
    }

    BOOL v17 = v40.type == 28 || v40.type == 1;
    if (v17 && v40.rr_class == a5)
    {
      uint64_t v18 = v40.name[0] ? &v40 : (res_9_ns_rr *)".";
      if (res_9_ns_samename(v18->name, a4) == 1 && v40.rdlength == 4)
      {
        int type = v40.type;
        BOOL v21 = (a6 & 2) == 0 || v40.type == 1;
        BOOL v22 = v21;
        BOOL v23 = v40.type == 28 || (a6 & 4) == 0;
        if (v23 && v22) {
          break;
        }
      }
    }

LABEL_43:
  *__error() = v28;
  return 0xFFFFFFFFLL;
}

void free_nsrr(void *a1, char *a2)
{
  uint64_t v5 = (void **)(a2 + 32);
  int v4 = (uint64_t *)*((void *)a2 + 4);
  if (v4)
  {
    do
    {
      uint64_t v7 = *v4;
      int v6 = (void *)v4[1];
      if (v6)
      {
        *int v6 = v7;
        uint64_t v7 = *v4;
      }

      else
      {
        *((void *)a2 + 5) = v7;
      }

      if (v7) {
        __int128 v8 = (void *)(v7 + 8);
      }
      else {
        __int128 v8 = v5;
      }
      *__int128 v8 = v6;
      free(v4);
      int v4 = *v5;
    }

    while (*v5);
  }

  free(*((void **)a2 + 2));
  uint64_t v9 = *(void *)a2;
  int v10 = (void *)*((void *)a2 + 1);
  if (v10)
  {
    *int v10 = v9;
    uint64_t v9 = *(void *)a2;
  }

  else
  {
    a1[1] = v9;
  }

  if (v9) {
    int v11 = (void *)(v9 + 8);
  }
  else {
    int v11 = a1;
  }
  *int v11 = *((void *)a2 + 1);
  free(a2);
}

res_9_state res_build_start(res_9_state a1)
{
  if (a1)
  {
    res_9_state v1 = a1;
    if ((a1->options & 1) != 0) {
      res_9_ndestroy(a1);
    }
  }

  else
  {
    res_9_state v1 = (res_9_state)res_state_new();
    if (!v1) {
      return v1;
    }
  }

  if (!v1->_u._ext.ext) {
    v1->_u._ext.ext = (__res_9_state_ext *)calloc(1uLL, 0x3A8uLL);
  }
  v1->_pad = 9;
  v1->retry = 2;
  v1->options = 1728LL;
  v1->int id = arc4random();
  *((_BYTE *)v1 + 392) = *((_BYTE *)v1 + 392) & 0xF0 | 1;
  v1->_vcsock = -1;
  ext = v1->_u._ext.ext;
  if (ext)
  {
    strcpy((char *)ext + 744, "ip6.arpa");
    *((void *)v1->_u._ext.ext + 109) = 0x746E692E367069LL;
    strcpy((char *)v1->_u._ext.ext + 808, "ip6.arpa");
  }

  return v1;
}

void res_9_ndestroy(res_9_state a1)
{
  a1->options &= ~1uLL;
  if (a1->_pad >= 9)
  {
    ext = a1->_u._ext.ext;
    if (ext) {
      free(ext);
    }
    a1->_u._ext.ext = 0LL;
    a1->_pad = 9;
  }

uint64_t res_build_sortlist(uint64_t a1, int a2, int a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unint64_t v4 = *(unsigned __int8 *)(a1 + 392);
  uint64_t result = 0LL;
  uint64_t v6 = a1 + ((v4 >> 1) & 0x78);
  *(_DWORD *)(v6 + 396) = a2;
  *(_DWORD *)(v6 + 400) = a3;
  *(_BYTE *)(a1 + 392) = v4 + 16;
  return result;
}

unsigned __int8 **res_next_word(unsigned __int8 **result)
{
  if (result)
  {
    res_9_state v1 = *result;
    if (!*result) {
      return 0LL;
    }
    while (1)
    {
      unsigned int v2 = *v1;
      BOOL v3 = v2 > 0x20;
      uint64_t v4 = (1LL << v2) & 0x100000600LL;
      if (v3 || v4 == 0) {
        break;
      }
      ++v1;
    }

    *uint64_t result = v1;
    uint64_t v6 = v1 + 1;
    int v7 = *v1;
    if (*v1)
    {
      while (1)
      {
        if ((v7 - 9) < 2)
        {
LABEL_14:
          *(v6 - _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
          goto LABEL_16;
        }

        if (!v7) {
          break;
        }
        if (v7 == 32) {
          goto LABEL_14;
        }
        int v8 = *v6++;
        int v7 = v8;
      }

      --v6;
LABEL_16:
      *uint64_t result = v6;
      if (v1 == v6) {
        return 0LL;
      }
      else {
        return (unsigned __int8 **)v1;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t res_build(uint64_t a1, unsigned int a2, _DWORD *a3, char *__s1, const char *a5)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!strcmp(__s1, "domain"))
  {
    strncpy((char *)(a1 + 128), a5, 0xFFuLL);
    uint64_t result = 0LL;
    *(_BYTE *)(a1 + 383) = 0;
    return result;
  }

  if (!strcmp(__s1, "search"))
  {
    int v12 = strlen(a5) + 1;
    if (*a3)
    {
      uint64_t v13 = *(_BYTE **)(a1 + 8LL * (*a3 - 1) + 72);
      uint64_t v14 = v13 + 256;
      int v15 = 256;
      BOOL v16 = 1LL;
      do
      {
        if (!*v13) {
          goto LABEL_28;
        }
        ++v13;
        BOOL v17 = v15-- != 0;
      }

      while (v15 != 0 && v17);
      int v15 = 0;
      BOOL v16 = *v14 == 0;
      uint64_t v13 = v14;
LABEL_28:
      uint64_t v18 = &v13[v16];
    }

    else
    {
      *(_OWORD *)(a1 + 128) = 0u;
      uint64_t v18 = (_BYTE *)(a1 + 128);
      *(_OWORD *)(a1 + 352) = 0u;
      *(_OWORD *)(a1 + 368) = 0u;
      *(_OWORD *)(a1 + 320) = 0u;
      *(_OWORD *)(a1 + 336) = 0u;
      *(_OWORD *)(a1 + 288) = 0u;
      *(_OWORD *)(a1 + 304) = 0u;
      *(_OWORD *)(a1 + 256) = 0u;
      *(_OWORD *)(a1 + 272) = 0u;
      *(_OWORD *)(a1 + 224) = 0u;
      *(_OWORD *)(a1 + 240) = 0u;
      *(_OWORD *)(a1 + 192) = 0u;
      *(_OWORD *)(a1 + 208) = 0u;
      *(_OWORD *)(a1 + 160) = 0u;
      *(_OWORD *)(a1 + 176) = 0u;
      int v15 = 256;
      *(_OWORD *)(a1 + 144) = 0u;
    }

    if (v12 <= v15)
    {
      memcpy(v18, a5, v12);
      uint64_t result = 0LL;
      uint64_t v31 = *a3;
      *(void *)(a1 + 8 * v31 + 72) = v18;
      *a3 = v31 + 1;
      return result;
    }

    return 0xFFFFFFFFLL;
  }

  if (strcmp(__s1, "nameserver"))
  {
    if (strcmp(__s1, "sortlist"))
    {
      if (strcmp(__s1, "ndots"))
      {
        if (!strcmp(__s1, "nibble"))
        {
          if (strlen(a5) - 64 < 0xFFFFFFFFFFFFFFBFLL || !*(void *)(a1 + 536)) {
            return 0xFFFFFFFFLL;
          }
        }

        else
        {
          if (!strcmp(__s1, "nibble2"))
          {
            if (strlen(a5) - 64 < 0xFFFFFFFFFFFFFFBFLL) {
              return 0xFFFFFFFFLL;
            }
            uint64_t v42 = *(void *)(a1 + 536);
            if (!v42) {
              return 0xFFFFFFFFLL;
            }
            strcpy((char *)(v42 + 872), a5);
            return 0LL;
          }

          if (strcmp(__s1, "bitstring"))
          {
            if (!strcmp(__s1, "attempts"))
            {
              int v43 = atoi(a5);
              uint64_t result = 0LL;
              unsigned int v44 = v43 & ~(v43 >> 31);
              if (v44 >= 5) {
                unsigned int v44 = 5;
              }
              *(_DWORD *)(a1 + 4) = v44;
              return result;
            }

            if (strcmp(__s1, "v6revmode"))
            {
              uint64_t result = strcmp(__s1, "debug");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 2LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "no_tld_query");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x100000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "inet6");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x2000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "rotate");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x4000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "no-check-names");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x8000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "edns0");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x40000000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "a6");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x20000000LL;
                goto LABEL_97;
              }

              uint64_t result = strcmp(__s1, "dname");
              if (!(_DWORD)result)
              {
                uint64_t v11 = *(void *)(a1 + 8) | 0x10000000LL;
LABEL_97:
                *(void *)(a1 + 8) = v11;
                return result;
              }

              return 0xFFFFFFFFLL;
            }

            uint64_t result = strcmp(a5, "single");
            if (!(_DWORD)result)
            {
              uint64_t v11 = *(void *)(a1 + 8) | 0x80000000LL;
              goto LABEL_97;
            }

            uint64_t result = strcmp(a5, "both");
            if (!(_DWORD)result)
            {
              uint64_t v11 = *(void *)(a1 + 8) & 0x7FFFFFFFLL;
              goto LABEL_97;
            }

            return 0LL;
          }

          if (strlen(a5) - 64 < 0xFFFFFFFFFFFFFFBFLL || !*(void *)(a1 + 536)) {
            return 0xFFFFFFFFLL;
          }
        }

        __strcpy_chk();
        return 0LL;
      }

      int v37 = atoi(a5);
      uint64_t result = 0LL;
      unsigned int v38 = v37 & ~(v37 >> 31);
      if (v38 >= 0xF) {
        LOBYTE(v38) = 15;
      }
      char v39 = *(_BYTE *)(a1 + 392) & 0xF0 | v38;
LABEL_85:
      *(_BYTE *)(a1 + 392) = v39;
      return result;
    }

    uint64_t v29 = strchr(a5, 47);
    if (v29)
    {
      uint64_t v30 = v29;
      char *v29 = 0;
      if (!inet_aton(a5, &v50)) {
        return 0xFFFFFFFFLL;
      }
      if (inet_aton(v30 + 1, (in_addr *)v48)) {
        goto LABEL_83;
      }
    }

    else if (!inet_aton(a5, &v50))
    {
      return 0xFFFFFFFFLL;
    }

    unsigned int v40 = bswap32(v50.s_addr);
    if ((v40 & 0x80000000) != 0)
    {
      if (v40 >> 30 == 2) {
        int v41 = 0xFFFF;
      }
      else {
        int v41 = 0xFFFFFF;
      }
    }

    else
    {
      int v41 = 255;
    }

    *(_DWORD *)uint64_t v48 = v41;
LABEL_83:
    unint64_t v45 = *(unsigned __int8 *)(a1 + 392);
    uint64_t result = 0LL;
    in_addr_t v46 = *(_DWORD *)v48;
    uint64_t v47 = (in_addr *)(a1 + ((v45 >> 1) & 0x78));
    v47[99].in_addr_t s_addr = v50.s_addr;
    v47[100].in_addr_t s_addr = v46;
    char v39 = v45 + 16;
    goto LABEL_85;
  }

  int v19 = 0;
  int v20 = 0;
  BOOL v21 = 0LL;
  for (uint64_t i = a5; ; ++i)
  {
    int v23 = *(unsigned __int8 *)i;
    if (v23 == 46)
    {
      ++v19;
      BOOL v21 = i;
      continue;
    }

    if (v23 != 58) {
      break;
    }
    ++v20;
LABEL_36:
    ;
  }

  if (*i) {
    goto LABEL_36;
  }
  if (v19 == 4 || v20 >= 1 && v21)
  {
    int v24 = atoi(v21 + 1);
    if ((_WORD)v24) {
      a2 = v24;
    }
    *BOOL v21 = 0;
  }

  v50.in_addr_t s_addr = 0;
  __int128 v49 = 0uLL;
  memset(v48, 0, sizeof(v48));
  if (inet_pton(30, a5, &v49) == 1)
  {
    *(_OWORD *)&v48[4] = v49;
    uint64_t v25 = *(void *)(a1 + 536);
    if (v25)
    {
      uint64_t v26 = v25 + ((uint64_t)*(int *)(a1 + 16) << 7);
      *(_WORD *)uint64_t v26 = 7708;
      *(_WORD *)(v26 + 2) = bswap32(a2) >> 16;
      *(_OWORD *)(v26 + 4) = *(_OWORD *)v48;
      *(void *)(v26 + 20) = *(void *)&v48[16];
    }

    uint64_t result = 0LL;
    uint64_t v27 = *(int *)(a1 + 16);
    *(_BYTE *)(a1 + 16 * v27 + 2_dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
    int v28 = v27 + 1;
    goto LABEL_59;
  }

  if (inet_pton(2, a5, &v50) != 1) {
    return 0LL;
  }
  in_addr_t s_addr = v50.s_addr;
  unsigned int v33 = bswap32(a2) >> 16;
  uint64_t v34 = *(void *)(a1 + 536);
  if (v34)
  {
    uint64_t v35 = v34 + ((uint64_t)*(int *)(a1 + 16) << 7);
    *(_WORD *)uint64_t v35 = 528;
    *(_WORD *)(v35 + 2) = v33;
    *(_DWORD *)(v35 + 4) = s_addr;
    *(void *)(v35 + 8) = 0LL;
  }

  uint64_t result = 0LL;
  uint64_t v36 = a1 + 16LL * *(int *)(a1 + 16);
  *(_WORD *)(v36 + 20) = 528;
  *(_WORD *)(v36 + 22) = v33;
  *(_DWORD *)(v36 + 24) = s_addr;
  *(void *)(v36 + 28) = 0LL;
  int v28 = *(_DWORD *)(a1 + 16) + 1;
LABEL_59:
  *(_DWORD *)(a1 + 16) = v28;
  return result;
}

int res_9_vinit(res_9_state a1, int a2)
{
  uint64_t v172 = *MEMORY[0x1895F89C0];
  v152[0] = 0;
  uint64_t v4 = dns_configuration_copy();
  if (v4)
  {
    uint64_t v5 = **(void **)(v4 + 4);
    if (*(_WORD *)(v5 + 20)) {
      unsigned int v6 = *(unsigned __int16 *)(v5 + 20);
    }
    else {
      unsigned int v6 = 53;
    }
    if ((a1->options & 1) != 0) {
      res_9_ndestroy(a1);
    }
    a1 = res_build_start(a1);
    int v7 = getenv("RES_RETRY_TIMEOUT");
    if (v7) {
      int __s1 = atoi(v7);
    }
    else {
      int __s1 = 0;
    }
    int v19 = getenv("RES_RETRY");
    *(void *)&v155[0].in_addr_t s_addr = v19;
    if (v19) {
      a1->retry = atoi(v19);
    }
    int v20 = *(_DWORD *)(v5 + 8);
    if (v20 >= 4)
    {
      *(_DWORD *)(v5 + 8) = 3;
LABEL_39:
      uint64_t v21 = 0LL;
      while (1)
      {
        int v22 = *(unsigned __int8 *)(*(void *)(*(void *)(v5 + 12) + 8 * v21) + 1LL);
        if (v22 == 2) {
          break;
        }
        if (v22 == 30)
        {
          uint64_t v23 = 8LL;
LABEL_44:
          __int128 v170 = 0u;
          __int128 v171 = 0u;
          __int128 v168 = 0u;
          __int128 v169 = 0u;
          __int128 v166 = 0u;
          __int128 v167 = 0u;
          __int128 v164 = 0u;
          __int128 v165 = 0u;
          __int128 v162 = 0u;
          __int128 v163 = 0u;
          __int128 v160 = 0u;
          __int128 v161 = 0u;
          __int128 v159 = 0u;
          __int128 v157 = 0u;
          __int128 v158 = 0u;
          *(_OWORD *)__str = 0u;
          inet_ntop(v22, (const void *)(*(void *)(*(void *)(v5 + 12) + 8 * v21) + v23), __str, 0x100u);
          res_build((uint64_t)a1, v6, v152, "nameserver", __str);
        }
      }

      uint64_t v23 = 4LL;
      goto LABEL_44;
    }

    if (v20 >= 1) {
      goto LABEL_39;
    }
LABEL_46:
    LODWORD(v24) = *(_DWORD *)(v5 + 24);
    if ((int)v24 < 7)
    {
      if ((int)v24 < 1)
      {
LABEL_51:
        if ((_DWORD)v24 || !*(void *)v5) {
          goto LABEL_52;
        }
        int v45 = 0;
        for (uint64_t i = (_BYTE *)(*(void *)v5 - 1LL); ; ++i)
        {
          if (i[1] == 46)
          {
            ++v45;
          }

          else if (!i[1])
          {
            while (1)
            {
              *(void *)&v155[0].in_addr_t s_addr = i;
              uint64_t v47 = *(const char **)v5;
              if (*i != 46)
              {
                res_build((uint64_t)a1, v6, v152, "search", v47);
                uint64_t v47 = *(const char **)v5;
                break;
              }

              *uint64_t i = 0;
              --v45;
              uint64_t i = (_BYTE *)(*(void *)&v155[0].s_addr - 1LL);
            }

            *(void *)&v155[0].in_addr_t s_addr = v47;
            if (v45 >= 2 && v152[0] <= 2u)
            {
              int v142 = v45 + 1;
              do
              {
                uint64_t v143 = *(void *)&v155[0].s_addr;
                *(void *)&v155[0].in_addr_t s_addr = v143 + 1;
                res_build((uint64_t)a1, v6, v152, "search", (const char *)(v143 + 1));
                if (v142 < 4) {
                  break;
                }
                --v142;
              }

              while (v152[0] < 3u);
            }

LABEL_52:
            uint64_t v26 = *(unsigned int *)(v5 + 56);
            snprintf(__str, 0x100uLL, "%d", *(_DWORD *)(v5 + 60));
            res_build((uint64_t)a1, v6, v152, "search_order", __str);
            int v27 = *(_DWORD *)(v5 + 36);
            if (v27 < 11)
            {
              if (v27 >= 1) {
                goto LABEL_55;
              }
            }

            else
            {
              int v27 = 10;
              *(_DWORD *)(v5 + 36) = 10;
LABEL_55:
              for (uint64_t k = 0LL; k < v27; ++k)
              {
                if (a1)
                {
                  unint64_t v29 = *((unsigned __int8 *)a1 + 392);
                  if (v29 <= 0x9F)
                  {
                    *(__res_9_state::$74FC9BA5E222057206531471DD26DEFB *)((char *)a1->sort_list + ((v29 >> 1) & 0x78)) = **(__res_9_state::$74FC9BA5E222057206531471DD26DEFB **)(*(void *)(v5 + 40) + 8 * k);
                    *((_BYTE *)a1 + 392) = v29 + 16;
                    int v27 = *(_DWORD *)(v5 + 36);
                  }
                }
              }
            }

            *(void *)&v155[0].in_addr_t s_addr = *(void *)(v5 + 48);
            word = res_next_word((unsigned __int8 **)v155);
            if (!word)
            {
LABEL_98:
              unsigned int nscount = a1->nscount;
              if (nscount <= 1) {
                unsigned int nscount = 1;
              }
              if (!(_DWORD)v26)
              {
                if (__s1) {
                  LODWORD(v26) = nscount * __s1 * a1->retry;
                }
                else {
                  LODWORD(v26) = 30;
                }
              }

              dns_configuration_free();
              if (a1->nscount)
              {
                u_long options = a1->options;
              }

              else
              {
                a1->nsaddr_list[0].sin_addr.in_addr_t s_addr = 0;
                a1->nsaddr_list[0].sin_family = 2;
                a1->nsaddr_list[0].sin_port = __rev16(v6);
                a1->unsigned int nscount = 1;
                u_long options = a1->options | 8;
              }

              if ((_DWORD)v26) {
                int v131 = v26;
              }
              else {
                int v131 = 30;
              }
              a1->retrans = v131;
              goto LABEL_366;
            }

            uint64_t v31 = (const char *)word;
            uint64_t v32 = "ndots";
            unsigned int v33 = "nibble";
            uint64_t v34 = "timeout:";
            while (2)
            {
              if (!strncmp(v31, "ndots:", 6uLL))
              {
                int v43 = v31 + 6;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = (char *)v32;
                goto LABEL_89;
              }

              if (!strncmp(v31, "nibble:", 7uLL))
              {
                int v43 = v31 + 7;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = (char *)v33;
                goto LABEL_89;
              }

              if (!strncmp(v31, "nibble2:", 8uLL))
              {
                int v43 = v31 + 8;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = "nibble2";
                goto LABEL_89;
              }

              if (!strncmp(v31, v34, 8uLL))
              {
                int __s1 = atoi(v31 + 8);
                goto LABEL_90;
              }

              if (!strncmp(v31, "attempts:", 9uLL))
              {
                int v43 = v31 + 9;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = "attempts";
                goto LABEL_89;
              }

              if (!strncmp(v31, "bitstring:", 0xAuLL))
              {
                int v43 = v31 + 10;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = "bitstring";
                goto LABEL_89;
              }

              if (!strncmp(v31, "v6revmode:", 0xAuLL))
              {
                int v43 = v31 + 10;
                res_9_state v40 = a1;
                unsigned int v41 = v6;
                uint64_t v42 = "v6revmode";
                goto LABEL_89;
              }

              uint64_t v35 = v32;
              uint64_t v36 = v26;
              int v37 = v34;
              unsigned int v38 = v33;
              char v39 = "debug";
              if (!strcmp(v31, "debug") || (char v39 = "no_tld_query", !strcmp(v31, "no_tld_query")))
              {
                res_build((uint64_t)a1, v6, v152, v39, 0LL);
                unsigned int v33 = v38;
              }

              else
              {
                unsigned int v33 = v38;
                if (strcmp(v31, "inet6"))
                {
                  uint64_t v34 = v37;
                  if (strcmp(v31, "rotate"))
                  {
                    uint64_t v26 = v36;
                    if (strcmp(v31, "no-check-names"))
                    {
                      uint64_t v32 = v35;
                      if (!strcmp(v31, "edns0"))
                      {
                        res_build((uint64_t)a1, v6, v152, "edns0", 0LL);
                        goto LABEL_90;
                      }

                      if (strcmp(v31, "a6"))
                      {
                        if (!strcmp(v31, "dname"))
                        {
                          res_9_state v40 = a1;
                          unsigned int v41 = v6;
                          uint64_t v42 = "dname";
                          goto LABEL_97;
                        }

    int v28 = 0;
    unint64_t v29 = 0;
    goto LABEL_53;
  }

  if (v19)
  {
    if (v25 == -1) {
      return 0xFFFFFFFFLL;
    }
    goto LABEL_58;
  }

  uint64_t v36 = v25;
  int v37 = v23;
  int v27 = 0;
  if ((*(_BYTE *)(a1 + 9) & 2) == 0) {
    goto LABEL_52;
  }
  uint64_t v35 = 0;
  int v28 = 0;
  unint64_t v29 = 0;
  if (a9 < 1) {
    goto LABEL_53;
  }
LABEL_34:
  int v27 = 0;
  int v28 = 0;
  unint64_t v29 = 0;
  while (1)
  {
    uint64_t v31 = *a10;
    if (!**a10 || **a10 == 46 && !v31[1]) {
      ++v27;
    }
    uint64_t result = res_nquerydomain_2(a1, a2, v31, a3, a4, a5, a6, a7, a8);
    if (*__error() == 61) {
      goto LABEL_62;
    }
    uint64_t v32 = *(_DWORD *)(a1 + 496);
    if (v32 == 2)
    {
      if ((*(void *)a5 & 0xF000000LL) == 0x5000000) {
        ++v28;
      }
    }

    else if (v32 == 4)
    {
      ++v29;
    }

    ++a10;
    if (!--v26)
    {
      if (!v35) {
        goto LABEL_53;
      }
      goto LABEL_57;
    }
  }

LABEL_90:
                        uint64_t v31 = (const char *)res_next_word((unsigned __int8 **)v155);
                        if (!v31) {
                          goto LABEL_98;
                        }
                        continue;
                      }

                      res_9_state v40 = a1;
                      unsigned int v41 = v6;
                      uint64_t v42 = "a6";
LABEL_97:
                      int v43 = 0LL;
LABEL_89:
                      res_build((uint64_t)v40, v41, v152, v42, v43);
                      goto LABEL_90;
                    }

                    res_build((uint64_t)a1, v6, v152, "no-check-names", 0LL);
LABEL_87:
                    uint64_t v32 = v35;
                    goto LABEL_90;
                  }

                  res_build((uint64_t)a1, v6, v152, "rotate", 0LL);
LABEL_86:
                  uint64_t v26 = v36;
                  goto LABEL_87;
                }

                res_build((uint64_t)a1, v6, v152, "inet6", 0LL);
              }

              break;
            }

            uint64_t v34 = v37;
            goto LABEL_86;
          }
        }
      }
    }

    else
    {
      *(_DWORD *)(v5 + 24) = 6;
    }

    uint64_t v25 = 0LL;
    do
    {
      res_build((uint64_t)a1, v6, v152, "search", *(const char **)(*(void *)(v5 + 28) + 8 * v25++));
      uint64_t v24 = *(int *)(v5 + 24);
    }

    while (v25 < v24);
    goto LABEL_51;
  }

  if (!a2)
  {
    *(void *)&a1->retrans = 0x200000005LL;
    a1->u_long options = 1728LL;
    a1->int id = arc4random();
  }

  u_long v8 = a1->options;
  if ((v8 & 1) != 0)
  {
    res_9_ndestroy(a1);
    u_long v8 = a1->options;
  }

  a1->nsaddr_list[0].sin_addr.in_addr_t s_addr = 0;
  a1->nsaddr_list[0].sin_family = 2;
  a1->nsaddr_list[0].sin_port = 13568;
  a1->unsigned int nscount = 1;
  a1->u_long options = v8 | 8;
  *((_BYTE *)a1 + 392) = *((_BYTE *)a1 + 392) & 0xF0 | 1;
  a1->u_long pfcode = 0LL;
  a1->_vcsocuint64_t k = -1;
  *(void *)&a1->_flags = 0x900000000LL;
  a1->_u._ext.unsigned int nscount = 0;
  a1->qhoouint64_t k = 0LL;
  a1->rhoouint64_t k = 0LL;
  uint64_t v9 = (__res_9_state_ext *)calloc(1uLL, 0x3A8uLL);
  a1->_u._ext.ext = v9;
  if (v9)
  {
    bzero(v9, 0x3A8uLL);
    *(sockaddr_in *)a1->_u._ext.ext = a1->nsaddr_list[0];
    strcpy((char *)a1->_u._ext.ext + 744, "ip6.arpa");
    *((void *)a1->_u._ext.ext + 109) = 0x746E692E367069LL;
    strcpy((char *)a1->_u._ext.ext + 808, "ip6.arpa");
  }

  *((_BYTE *)a1 + 392) &= 0xFu;
  int v10 = getenv("LOCALDOMAIN");
  if (!v10)
  {
    uint64_t v12 = 0LL;
    goto LABEL_115;
  }

  uint64_t v11 = strncpy(a1->defdname, v10, 0xFFuLL);
  uint64_t v12 = 0LL;
  int v13 = 0;
  a1->defdname[255] = 0;
  uint64_t v14 = &a1->dnsrch[1];
  a1->dnsrch[0] = v11;
  do
  {
    unsigned int v15 = *v11;
    if (v15 > 9)
    {
      if (v15 == 32)
      {
LABEL_22:
        *uint64_t v11 = 0;
        int v13 = 1;
        goto LABEL_26;
      }

      if (v15 == 10) {
        break;
      }
    }

    else
    {
      if (v15 == 9) {
        goto LABEL_22;
      }
      if (!*v11) {
        break;
      }
    }

    if (v13)
    {
      int v13 = 0;
      *v14++ = v11;
      uint64_t v12 = 1LL;
    }

LABEL_120:
    if (!fgets(__str, 1024, v49)) {
      goto LABEL_137;
    }
  }

  int v52 = &__str[4];
  while (2)
  {
    if (v50 <= 9u)
    {
      if (v50 != 9)
      {
        if (!v50) {
          goto LABEL_120;
        }
        goto LABEL_136;
      }

      goto LABEL_132;
    }

    if (v50 == 32)
    {
LABEL_132:
      unsigned __int8 v53 = *++v52;
      unsigned __int8 v50 = v53;
      continue;
    }

    break;
  }

  if (v50 == 10) {
    goto LABEL_120;
  }
LABEL_136:
  unsigned int v54 = atoi(v52);
LABEL_138:
  fclose(v49);
LABEL_140:
  uint64_t v55 = fopen("/etc/resolv.conf", "r");
  if (!v55)
  {
    int v129 = 0;
    goto LABEL_337;
  }

  uint64_t v56 = v55;
  uint64_t v57 = 0LL;
  if (!fgets(__str, 1024, v55))
  {
    int v129 = 0;
    goto LABEL_336;
  }

  int v150 = 0;
  uint64_t v58 = &__str[6];
  __dst = a1->defdname;
  unsigned int v149 = v54;
  unsigned int v59 = bswap32(v54);
  uint64_t v60 = 0LL;
  unsigned int v146 = HIWORD(v59);
  while (2)
  {
    if (__str[0] == 35 || __str[0] == 59) {
      goto LABEL_145;
    }
    if (*(_DWORD *)__str == 1634561892 && *(unsigned __int16 *)&__str[4] == 28265)
    {
      unsigned __int8 v69 = __str[6];
      if (__str[6] == 32 || __str[6] == 9)
      {
        if (v10) {
          goto LABEL_145;
        }
        for (m = v58; ; ++m)
        {
          if (v69 > 9u)
          {
            if (v69 != 32)
            {
              if (v69 == 10) {
                goto LABEL_145;
              }
              goto LABEL_274;
            }
          }

          else if (v69 != 9)
          {
            if (!v69) {
              goto LABEL_145;
            }
LABEL_274:
            uint64_t v107 = strncpy(__dst, m, 0xFFuLL);
            a1->defdname[255] = 0;
            int v108 = strpbrk(v107, " \t\n");
            uint64_t v12 = 0LL;
            if (v108) {
              *int v108 = 0;
            }
            goto LABEL_145;
          }

          unsigned __int8 v72 = m[1];
          unsigned __int8 v69 = v72;
        }
      }
    }

    if (*(_DWORD *)__str == 1918985587 && *(unsigned __int16 *)&__str[4] == 26723)
    {
      unsigned __int8 v73 = __str[6];
      if (__str[6] == 32 || __str[6] == 9)
      {
        if (v10) {
          goto LABEL_145;
        }
        for (n = v58; ; ++n)
        {
          if (v73 > 9u)
          {
            if (v73 != 32)
            {
              if (v73 == 10) {
                goto LABEL_145;
              }
LABEL_279:
              unsigned int v109 = strncpy(__dst, n, 0xFFuLL);
              a1->defdname[255] = 0;
              unsigned int v110 = strchr(v109, 10);
              if (v110) {
                *unsigned int v110 = 0;
              }
              a1->dnsrch[0] = __dst;
              unsigned int v111 = a1->defdname[0];
              if (a1->defdname[0])
              {
                int v112 = 0;
                uint64_t v113 = &a1->dnsrch[1];
                defdname = a1->defdname;
                do
                {
                  if (v111 == 32 || v111 == 9)
                  {
                    char *defdname = 0;
                    int v112 = 1;
                  }

                  else if (v112)
                  {
                    int v112 = 0;
                    *v113++ = defdname;
                  }

                  unsigned int v115 = *++defdname;
                  unsigned int v111 = v115;
                  if (v115) {
                    BOOL v116 = v113 >= &a1->dnsrch[6];
                  }
                  else {
                    BOOL v116 = 1;
                  }
                }

                while (!v116);
              }

              else
              {
                defdname = a1->defdname;
                uint64_t v113 = &a1->dnsrch[1];
              }

              uint64_t v127 = (unsigned __int8 *)(defdname + 1);
              while (v111 > 0x20 || ((1LL << v111) & 0x100000201LL) == 0)
              {
                unsigned int v128 = *v127++;
                unsigned int v111 = v128;
              }

              *(v127 - _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
              u_char *v113 = 0LL;
              uint64_t v12 = 1LL;
              goto LABEL_145;
            }
          }

          else if (v73 != 9)
          {
            if (!v73) {
              goto LABEL_145;
            }
            goto LABEL_279;
          }

          unsigned __int8 v75 = n[1];
          unsigned __int8 v73 = v75;
        }
      }
    }

    if (*(void *)__str == 0x76726573656D616ELL && *(unsigned __int16 *)&__str[8] == 29285)
    {
      int v76 = __str[10];
      BOOL v77 = __str[10] == 9 || __str[10] == 32;
      if (v77 && (int)v60 <= 2)
      {
        uint64_t v78 = v57;
        uint64_t v79 = &__str[10];
        while (v76 == 32 || v76 == 9)
        {
          int v80 = *(unsigned __int8 *)++v79;
          int v76 = v80;
        }

        v79[strcspn(v79, ";# \t\n")] = 0;
        int v101 = *(unsigned __int8 *)v79;
        if (!*v79 || v101 == 10) {
          goto LABEL_316;
        }
        int v102 = 0;
        int v103 = 0;
        uint64_t v104 = 0LL;
        for (iuint64_t i = v79; ; ++ii)
        {
          if (v101 == 46)
          {
            ++v102;
            uint64_t v104 = ii;
          }

          else if (v101 == 58)
          {
            ++v103;
          }

          else if (!(_BYTE)v101)
          {
            if (v102 == 4 || (unsigned int v117 = v149, v103 >= 1) && (unsigned int v117 = v149, v104))
            {
              int v118 = atoi(v104 + 1);
              if ((_WORD)v118) {
                unsigned int v117 = v118;
              }
              else {
                unsigned int v117 = v149;
              }
              *uint64_t v104 = 0;
            }

            __sprintf_chk((char *)v155, 0, 0x20uLL, "%u", (unsigned __int16)v117);
            int v154 = 0;
            __int128 v153 = 0uLL;
            memset(&v152[1], 0, 24);
            if (inet_pton(30, v79, &v153) == 1)
            {
              *(_OWORD *)&v152[2] = v153;
              ext = a1->_u._ext.ext;
              uint64_t v57 = v78;
              if (ext)
              {
                uint64_t v120 = (char *)ext + 128 * (uint64_t)(int)v60;
                *(_WORD *)uint64_t v120 = 7708;
                *((_WORD *)v120 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = bswap32(v117) >> 16;
                *(_OWORD *)(v120 + 4) = *(_OWORD *)&v152[1];
                *(void *)(v120 + 20) = *(void *)&v152[5];
              }

              a1->nsaddr_list[(int)v60].sin_family = 0;
              uint64_t v60 = (v60 + 1);
              goto LABEL_145;
            }

            if (inet_pton(2, v79, &v154) == 1)
            {
              int v123 = v154;
              uint64_t v124 = a1->_u._ext.ext;
              uint64_t v57 = v78;
              if (v124)
              {
                uint64_t v125 = (char *)v124 + 128 * (uint64_t)(int)v60;
                *(_WORD *)uint64_t v125 = 528;
                *((_WORD *)v125 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = v146;
                *((_DWORD *)v125 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = v123;
                *((void *)v125 + _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0LL;
              }

              uint64_t v126 = (char *)a1 + 16 * (int)v60;
              *((_WORD *)v126 + 10) = 528;
              *((_WORD *)v126 + 1_dns_print_resource_record_lock((uint64_t)r, f, 1) = v146;
              *((_DWORD *)v126 + 6) = v123;
              *(void *)(v126 + 28) = 0LL;
              uint64_t v60 = (v60 + 1);
              goto LABEL_145;
            }

LABEL_316:
            uint64_t v57 = v78;
            goto LABEL_145;
          }

          char v106 = ii[1];
          LOBYTE(v10_dns_print_resource_record_lock((uint64_t)r, f, 1) = v106;
        }
      }
    }

    if (*(void *)__str == 0x7473696C74726F73LL)
    {
      unsigned __int8 v81 = __str[8];
      if (__str[8] == 32 || __str[8] == 9)
      {
        uint64_t v82 = &__str[8];
        int v147 = v58;
        while (1)
        {
          uint64_t v83 = v12;
          uint64_t v84 = v60;
          uint64_t v85 = v57;
          for (jint j = v82; ; ++jj)
          {
            if (v81 > 0x3Bu)
            {
              uint64_t v82 = jj;
              goto LABEL_219;
            }

            if (((1LL << v81) & 0x100000200LL) == 0) {
              break;
            }
            unsigned __int8 v87 = jj[1];
            unsigned __int8 v81 = v87;
          }

          uint64_t v82 = jj;
          if (((1LL << v81) & 0x800000000000401LL) != 0)
          {
            uint64_t v57 = v85;
            uint64_t v60 = v84;
            uint64_t v12 = v83;
            uint64_t v58 = v147;
            goto LABEL_145;
          }

          while (1)
          {
LABEL_219:
            uint64_t v88 = memchr(&sort_mask, (char)v81, 3uLL);
            if ((v81 & 0x80) != 0 || v81 == 59 || v88) {
              goto LABEL_229;
            }
            if ((v81 & 0x80) == 0)
            {
              if ((*(_DWORD *)(MEMORY[0x1895F8770] + 4LL * v81 + 60) & 0x4000) != 0) {
                break;
              }
              goto LABEL_226;
            }

            if (__maskrune(v81, 0x4000uLL)) {
              break;
            }
LABEL_226:
            int v89 = *++v82;
            unsigned __int8 v81 = v89;
            if (!v89) {
              goto LABEL_229;
            }
          }

          unsigned __int8 v81 = *v82;
LABEL_229:
          *uint64_t v82 = 0;
          if (inet_aton(jj, v155))
          {
            uint64_t v90 = (in_addr *)((char *)a1 + 8 * (int)v85);
            in_addr_t s_addr = v155[0].s_addr;
            v90[99].in_addr_t s_addr = (in_addr_t)v155[0];
            if (memchr(&sort_mask, (char)v81, 3uLL))
            {
              p_in_addr_t s_addr = &v90[99].s_addr;
              *v82++ = v81;
              uint64_t v93 = v82;
              int v94 = v85;
              uint64_t v60 = v84;
              uint64_t v12 = v83;
              uint64_t v58 = v147;
              while (1)
              {
                uint64_t v95 = *v82;
                unsigned __int8 v81 = *v82;
                if (!*v82
                  || (_DWORD)v95 == 59
                  || (char)v95 < 0
                  || (*(_DWORD *)(MEMORY[0x1895F8770] + 4 * v95 + 60) & 0x4000) != 0)
                {
                  break;
                }

                ++v82;
              }

              *uint64_t v82 = 0;
              if (inet_aton(v93, v155))
              {
                u_int32_t v96 = v155[0].s_addr;
              }

              else
              {
                int v99 = bswap32(*p_s_addr);
                else {
                  int v100 = 0xFFFFFF;
                }
                if (v99 < 0) {
                  u_int32_t v96 = v100;
                }
                else {
                  u_int32_t v96 = 255;
                }
              }
            }

            else
            {
              int v97 = bswap32(s_addr);
              else {
                int v98 = 0xFFFFFF;
              }
              if (v97 < 0) {
                u_int32_t v96 = v98;
              }
              else {
                u_int32_t v96 = 255;
              }
              int v94 = v85;
              uint64_t v60 = v84;
              uint64_t v12 = v83;
              uint64_t v58 = v147;
            }

            a1->sort_list[v94].masuint64_t k = v96;
            uint64_t v57 = (v94 + 1);
          }

          else
          {
            uint64_t v57 = v85;
            uint64_t v60 = v84;
            uint64_t v12 = v83;
            uint64_t v58 = v147;
          }

          *uint64_t v82 = v81;
        }
      }
    }

    BOOL v64 = *(_DWORD *)__str == 1769238639 && *(_DWORD *)&__str[3] == 1936617321;
    if (v64 && (__str[7] == 32 || __str[7] == 9))
    {
      res_setoptions((uint64_t)a1, &__str[7], "conf");
      goto LABEL_145;
    }

    if (*(_DWORD *)__str == 1701669236 && *(_DWORD *)&__str[3] == 1953853285)
    {
      unsigned __int8 v66 = __str[7];
      if (__str[7] == 32 || __str[7] == 9)
      {
        for (kuint64_t k = &__str[7]; ; ++kk)
        {
          if (v66 > 9u)
          {
            if (v66 != 32)
            {
              if (v66 == 10) {
                break;
              }
              goto LABEL_308;
            }
          }

          else if (v66 != 9)
          {
            if (!v66) {
              break;
            }
LABEL_308:
            unsigned int v121 = atoi(kk);
            if (v121 >= 0x1E) {
              int v122 = 30;
            }
            else {
              int v122 = v121;
            }
            int v150 = v122;
            break;
          }

          unsigned __int8 v68 = kk[1];
          unsigned __int8 v66 = v68;
        }
      }
    }

LABEL_145:
    if (fgets(__str, 1024, v56)) {
      continue;
    }
    break;
  }

  int v129 = v150;
LABEL_336:
  *((_BYTE *)a1 + 392) = *((_BYTE *)a1 + 392) & 0xF | (16 * v57);
  fclose(v56);
LABEL_337:
  uint64_t v132 = a1->defdname;
  if (!a1->defdname[0] && !gethostname(__str, 0xFFuLL) && strchr(__str, 46)) {
    __strcpy_chk();
  }
  if (!(_DWORD)v12)
  {
    int v133 = 0;
    a1->dnsrch[1] = 0LL;
    int v134 = &a1->dnsrch[1];
    a1->dnsrch[0] = v132;
    for (mm = (char *)&a1->dnsrch[6] + 7; ; ++mm)
    {
      if (mm[1] == 46)
      {
        ++v133;
      }

      else if (!mm[1])
      {
        while (mm >= v132 && *mm == 46)
        {
          *mm-- = 0;
          --v133;
        }

        if (v133 >= 2)
        {
          do
          {
            uint64_t v132 = strchr(v132, 46) + 1;
            *v134++ = v132;
            BOOL v136 = v134 < &a1->dnsrch[3] && v133-- > 2;
          }

          while (v136);
        }

        *int v134 = 0LL;
        if ((a1->options & 2) != 0)
        {
          puts(";; res_init()... default dnsrch list:");
          int v137 = a1->dnsrch[0];
          if (v137)
          {
            int v138 = &a1->dnsrch[1];
            do
            {
              printf(";;\t%s\n", v137);
              uint64_t v139 = *v138++;
              int v137 = v139;
            }

            while (v139);
          }

          puts(";;\t..END..");
        }

        break;
      }
    }
  }

  uint64_t v140 = getenv("RES_OPTIONS");
  if (v140) {
    res_setoptions((uint64_t)a1, v140, "env");
  }
  if (!v129) {
    int v129 = (a1->retrans + a1->retrans * a1->retry) * a1->nscount;
  }
  a1->retrans = v129;
  u_long options = a1->options;
LABEL_366:
  a1->u_long options = options | 1;
  return 0;
}

int res_9_ninit(res_9_state a1)
{
  if (!a1) {
    return -1;
  }
  bzero(a1, 0x228uLL);
  res_9_vinit(a1, 0);
  return 0;
}

void res_9_nclose(res_9_state a1)
{
  vcsocuint64_t k = a1->_vcsock;
  if ((vcsock & 0x80000000) == 0)
  {
    close(vcsock);
    a1->_vcsocuint64_t k = -1;
    a1->_flags &= 0xFFFFFFFC;
  }

  if (a1->_pad >= 9)
  {
    unsigned int nscount = a1->_u._ext.nscount;
    if (a1->_u._ext.nscount)
    {
      unint64_t v4 = 0LL;
      nssocks = a1->_u._ext.nssocks;
      do
      {
        int v6 = nssocks[v4];
        if (v6 != -1)
        {
          close(v6);
          nssocks[v4] = -1;
          unsigned int nscount = a1->_u._ext.nscount;
        }

        ++v4;
      }

      while (v4 < nscount);
    }
  }

const char *__cdecl res_get_nibblesuffix(res_9_state a1)
{
  ext = a1->_u._ext.ext;
  if (ext) {
    return (char *)ext + 744;
  }
  else {
    return "ip6.arpa";
  }
}

const char *__cdecl res_get_nibblesuffix2(res_9_state a1)
{
  ext = a1->_u._ext.ext;
  if (ext) {
    return (char *)ext + 872;
  }
  else {
    return "ip6.int";
  }
}

const char *__cdecl res_get_bitstringsuffix(res_9_state a1)
{
  ext = a1->_u._ext.ext;
  if (ext) {
    return (char *)ext + 808;
  }
  else {
    return "ip6.arpa";
  }
}

void res_9_setservers(res_9_state a1, const res_9_sockaddr_union *a2, int a3)
{
  a1->_u._ext.unsigned int nscount = 0;
  if (a3 >= 1)
  {
    int v6 = 0;
    int v7 = 1;
    while (1)
    {
      int sin_family = a2->sin.sin_family;
      if (sin_family == 30)
      {
        ext = a1->_u._ext.ext;
        if (ext)
        {
          sockaddr_in sin = a2->sin;
          uint64_t v12 = (sockaddr_in *)((char *)ext + 128 * (uint64_t)v6);
          *(sockaddr_in *)&v12->sin_zero[4] = *(sockaddr_in *)&a2->__space[12];
          *uint64_t v12 = sin;
        }

        a1->nsaddr_list[v6].int sin_family = 0;
      }

      else
      {
        if (sin_family != 2) {
          goto LABEL_12;
        }
        uint64_t v9 = a1->_u._ext.ext;
        if (v9) {
          *((_OWORD *)v9 + 8 * (uint64_t)v6) = a2->sin;
        }
        a1->nsaddr_list[v6] = a2->sin;
      }

      ++v6;
LABEL_12:
      if (v7 < a3)
      {
        ++a2;
        ++v7;
        if (v6 < 3) {
          continue;
        }
      }

      goto LABEL_16;
    }
  }

  int v6 = 0;
LABEL_16:
  a1->unsigned int nscount = v6;
}

int res_9_getservers(res_9_state a1, res_9_sockaddr_union *a2, int a3)
{
  int nscount = a1->nscount;
  if (a3 >= 1 && nscount >= 1)
  {
    uint64_t v4 = 0LL;
    p_int sin_family = &a1->nsaddr_list[0].sin_family;
    unint64_t v6 = 1LL;
    while (1)
    {
      int v7 = &a2[v4];
      ext = a1->_u._ext.ext;
      if (ext) {
        uint64_t v9 = (sa_family_t *)ext + v4 * 128 + 1;
      }
      else {
        uint64_t v9 = p_sin_family;
      }
      int v10 = *v9;
      if (v10 == 30)
      {
        if (ext)
        {
          uint64_t v12 = (_OWORD *)((char *)ext + v4 * 128);
          sockaddr_in v11 = (sockaddr_in)*v12;
          __int128 v13 = *(_OWORD *)((char *)v12 + 12);
        }

        else
        {
          sockaddr_in v11 = *(sockaddr_in *)(p_sin_family - 1);
          __int128 v13 = *(_OWORD *)(p_sin_family + 11);
        }

        *(_OWORD *)&v7->__space[12] = v13;
      }

      else
      {
        if (v10 != 2)
        {
          a2[v4].sin.int sin_family = 0;
          goto LABEL_18;
        }

        if (ext) {
          sockaddr_in v11 = *(sockaddr_in *)((char *)ext + v4 * 128);
        }
        else {
          sockaddr_in v11 = *(sockaddr_in *)(p_sin_family - 1);
        }
      }

      v7->sockaddr_in sin = v11;
LABEL_18:
      int nscount = a1->nscount;
      if (v6 < a3)
      {
        ++v4;
        p_sin_family += 16;
      }

      return nscount;
    }
  }

  return nscount;
}

uint64_t res_setoptions(uint64_t result, char *__s1, const char *a3)
{
  uint64_t v5 = result;
  uint64_t v6 = *(void *)(result + 536);
  if ((*(_BYTE *)(result + 8) & 2) != 0) {
    uint64_t result = printf(";; res_setoptions(%s, %s)...\n", __s1, a3);
  }
  int v7 = *__s1;
  if (*__s1)
  {
    u_long v8 = __s1;
LABEL_5:
    while (v7 == 32 || v7 == 9)
    {
      int v9 = *++v8;
      int v7 = v9;
    }

    if (!strncmp(v8, "ndots:", 6uLL))
    {
      uint64_t result = atoi(v8 + 6);
      else {
        char v11 = *(_BYTE *)(v5 + 392) & 0xF0 | result & 0xF;
      }
      *(_BYTE *)(v5 + 392) = v11;
      if ((*(_BYTE *)(v5 + 8) & 2) != 0) {
        uint64_t result = printf(";;\tndots=%d\n", v11 & 0xF);
      }
    }

    else
    {
      if (!strncmp(v8, "timeout:", 8uLL))
      {
        uint64_t result = atoi(v8 + 8);
        else {
          *(_DWORD *)uint64_t v5 = result;
        }
        goto LABEL_65;
      }

      if (!strncmp(v8, "attempts:", 9uLL))
      {
        uint64_t result = atoi(v8 + 9);
        else {
          *(_DWORD *)(v5 + 4) = result;
        }
        goto LABEL_65;
      }

      if (strncmp(v8, "debug", 5uLL))
      {
        uint64_t result = strncmp(v8, "no_tld_query", 0xCuLL);
        if ((_DWORD)result && (uint64_t result = strncmp(v8, "no-tld-query", 0xCuLL), (_DWORD)result))
        {
          uint64_t result = strncmp(v8, "inet6", 5uLL);
          if ((_DWORD)result)
          {
            uint64_t result = strncmp(v8, "rotate", 6uLL);
            if ((_DWORD)result)
            {
              uint64_t result = strncmp(v8, "no-check-names", 0xEuLL);
              if ((_DWORD)result)
              {
                uint64_t result = strncmp(v8, "edns0", 5uLL);
                if ((_DWORD)result)
                {
                  uint64_t result = strncmp(v8, "a6", 2uLL);
                  if ((_DWORD)result)
                  {
                    uint64_t result = strncmp(v8, "dname", 5uLL);
                    if ((_DWORD)result)
                    {
                      uint64_t result = strncmp(v8, "nibble:", 7uLL);
                      if (!(_DWORD)result)
                      {
                        if (v6)
                        {
                          v8 += 7;
                          size_t v12 = strcspn(v8, " \t");
                          if (v12 >= 0x3F) {
                            uint64_t v13 = 63LL;
                          }
                          else {
                            uint64_t v13 = v12;
                          }
                          uint64_t v18 = v13;
                          uint64_t result = __strncpy_chk();
                          *(_BYTE *)(v6 + v18 + 744) = 0;
                        }

                        goto LABEL_65;
                      }

                      uint64_t result = strncmp(v8, "nibble2:", 8uLL);
                      if (!(_DWORD)result)
                      {
                        if (v6)
                        {
                          v8 += 8;
                          size_t v14 = strcspn(v8, " \t");
                          if (v14 >= 0x3F) {
                            size_t v15 = 63LL;
                          }
                          else {
                            size_t v15 = v14;
                          }
                          size_t v19 = v15;
                          uint64_t result = (uint64_t)strncpy((char *)(v6 + 872), v8, v15);
                          *(_BYTE *)(v6 + v19 + 872) = 0;
                        }

                        goto LABEL_65;
                      }

                      uint64_t result = strncmp(v8, "bitstring:", 0xAuLL);
                      if (!(_DWORD)result)
                      {
                        if (v6)
                        {
                          v8 += 10;
                          size_t v16 = strcspn(v8, " \t");
                          if (v16 >= 0x3F) {
                            uint64_t v17 = 63LL;
                          }
                          else {
                            uint64_t v17 = v16;
                          }
                          uint64_t v20 = v17;
                          uint64_t result = __strncpy_chk();
                          *(_BYTE *)(v6 + v20 + 808) = 0;
                        }

                        goto LABEL_65;
                      }

                      uint64_t result = strncmp(v8, "v6revmode:", 0xAuLL);
                      if ((_DWORD)result) {
                        goto LABEL_65;
                      }
                      v8 += 10;
                      uint64_t result = strncmp(v8, "single", 6uLL);
                      if ((_DWORD)result)
                      {
                        uint64_t result = strncmp(v8, "both", 4uLL);
                        if ((_DWORD)result) {
                          goto LABEL_65;
                        }
                        uint64_t v10 = *(void *)(v5 + 8) & 0x7FFFFFFFLL;
                      }

                      else
                      {
                        uint64_t v10 = *(void *)(v5 + 8) | 0x80000000LL;
                      }
                    }

                    else
                    {
                      uint64_t v10 = *(void *)(v5 + 8) | 0x10000000LL;
                    }
                  }

                  else
                  {
                    uint64_t v10 = *(void *)(v5 + 8) | 0x20000000LL;
                  }
                }

                else
                {
                  uint64_t v10 = *(void *)(v5 + 8) | 0x40000000LL;
                }
              }

              else
              {
                uint64_t v10 = *(void *)(v5 + 8) | 0x8000LL;
              }
            }

            else
            {
              uint64_t v10 = *(void *)(v5 + 8) | 0x4000LL;
            }
          }

          else
          {
            uint64_t v10 = *(void *)(v5 + 8) | 0x2000LL;
          }
        }

        else
        {
          uint64_t v10 = *(void *)(v5 + 8) | 0x100000LL;
        }

        *(void *)(v5 + 8) = v10;
        goto LABEL_65;
      }

      if ((*(_BYTE *)(v5 + 8) & 2) == 0)
      {
        printf(";; res_setoptions(%s, %s)..\n", __s1, a3);
        *(void *)(v5 + 8) |= 2uLL;
      }

      uint64_t result = puts(";;\tdebug");
    }

int res_9_nmkquery( res_9_state a1, int a2, const char *a3, int a4, int a5, const u_char *a6, int a7, const u_char *a8, u_char *a9, int a10)
{
  char v11 = (const char *)a6;
  u_int16_t v12 = a4;
  v40[0] = *(u_char **)MEMORY[0x1895F89C0];
  if ((a1->options & 2) != 0)
  {
    uint64_t v17 = __res_opcodes[a2];
    u_int16_t v18 = a4;
    size_t v19 = res_9_p_class((unsigned __int16)a4);
    uint64_t v20 = res_9_p_type(a5);
    int v37 = v19;
    u_int16_t v12 = v18;
    uint64_t v36 = v17;
    char v11 = (const char *)a6;
    printf(";; res_nmkquery(%s, %s, %s, %s)\n", v36, a3, v37, v20);
  }

  if (a9) {
    BOOL v21 = a10 < 12;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    return -1;
  }
  *((_DWORD *)a9 + 2) = 0;
  *(void *)a9 = 0LL;
  unsigned __int16 v23 = res_9_randomid();
  unint64_t v24 = *(void *)a9 & 0xFFFFFFFFFF870000LL | v23 | ((a2 & 0xF) << 19);
  *(void *)a9 = v24;
  *(void *)a9 = v24 & 0xFFFFFFFFF0FEFFFFLL | (LODWORD(a1->options) << 10) & 0x10000;
  v39[0] = a9;
  v39[1] = 0LL;
  if (a2 == 5)
  {
LABEL_13:
    if (a10 >= 0x10)
    {
      int v25 = res_9_dn_comp(a3, a9 + 12, a10 - 16, v39, v40);
      if ((v25 & 0x80000000) == 0)
      {
        int v26 = v25;
        int v27 = &a9[v25 + 12];
        res_9_putshort(a5, v27);
        res_9_putshort(v12, v27 + 2);
        int v28 = v27 + 4;
        *((_WORD *)a9 + 2) = 256;
        if (!a2 || !v11) {
          return (_DWORD)v28 - (_DWORD)a9;
        }
        unsigned int v29 = res_9_dn_comp(v11, v27 + 4, a10 - v26 - 26, v39, v40);
        if ((v29 & 0x80000000) == 0)
        {
          uint64_t v30 = &v28[v29];
          res_9_putshort(0xAu, v30);
          res_9_putshort(v12, v30 + 2);
          res_9_putlong(0, v30 + 4);
          res_9_putshort(0, v30 + 8);
          uint64_t v31 = 0LL;
          LODWORD(v28) = (_DWORD)v30 + 10;
          uint64_t v32 = -1LL;
          int v33 = 0x1000000;
          int v34 = 0xFFFF;
LABEL_23:
          int v35 = *((_DWORD *)a9 + 2) & v34 | v33;
          *(void *)a9 = *(void *)a9 & v32 | v31;
          *((_DWORD *)a9 + 2) = v35;
          return (_DWORD)v28 - (_DWORD)a9;
        }
      }
    }

    return -1;
  }

  if (a2 != 1)
  {
    if (a2) {
      return -1;
    }
    goto LABEL_13;
  }

  if (a10 - 12 >= a7 + 11)
  {
    a9[12] = 0;
    res_9_putshort(a5, a9 + 13);
    res_9_putshort(v12, a9 + 15);
    res_9_putlong(0, a9 + 17);
    res_9_putshort(a7, a9 + 21);
    LODWORD(v28) = (_DWORD)a9 + 23;
    if (a7)
    {
      memcpy(a9 + 23, v11, a7);
      int v33 = 0;
      uint64_t v31 = 0x100000000000000LL;
      uint64_t v32 = 0xFFFFFFFFFFFFLL;
      int v34 = -1;
      LODWORD(v28) = (_DWORD)v28 + a7;
    }

    else
    {
      int v33 = 0;
      uint64_t v31 = 0x100000000000000LL;
      uint64_t v32 = 0xFFFFFFFFFFFFLL;
      int v34 = -1;
    }

    goto LABEL_23;
  }

  return -1;
}

int res_9_nopt(res_9_state a1, int a2, u_char *a3, int a4, int a5)
{
  u_int16_t v5 = a5;
  if ((a1->options & 2) != 0) {
    puts(";; res_nopt()");
  }
  if (a4 - a2 < 11) {
    return -1;
  }
  char v11 = &a3[a2];
  *char v11 = 0;
  res_9_putshort(0x29u, v11 + 1);
  res_9_putshort(v5, v11 + 3);
  u_int16_t v12 = 0;
  *(_WORD *)(v11 + 5) = 0;
  u_long options = a1->options;
  if ((options & 0x200000) != 0)
  {
    if ((options & 2) != 0) {
      puts(";; res_opt()... ENDS0 DNSSEC");
    }
    u_int16_t v12 = 0x8000;
  }

  res_9_putshort(v12, v11 + 7);
  res_9_putshort(0, v11 + 9);
  *((_WORD *)a3 + 5) = bswap32(bswap32(*((_DWORD *)a3 + 2)) + 1) >> 16;
  return (_DWORD)v11 - (_DWORD)a3 + 11;
}

void res_destroyservicelist(void)
{
  v0 = (void **)servicelist;
  if (servicelist)
  {
    do
    {
      res_9_state v1 = (void **)*v0;
      free(v0[2]);
      free(v0[3]);
      free(v0);
      v0 = v1;
    }

    while (v1);
  }

  servicelist = 0LL;
}

void res_buildprotolist(void)
{
  v0 = getprotoent();
  if (v0)
  {
    res_9_state v1 = v0;
    do
    {
      unsigned int v2 = malloc(0x28uLL);
      if (!v2) {
        break;
      }
      BOOL v3 = v2;
      uint64_t v4 = strdup(v1->p_name);
      v3[2] = v4;
      if (!v4)
      {
        free(v3);
        break;
      }

      *((_DWORD *)v3 + 8) = v1->p_proto;
      uint64_t v5 = protolist;
      *BOOL v3 = protolist;
      v3[1] = 0LL;
      if (v5) {
        *(void *)(v5 + 8) = v3;
      }
      protolist = (uint64_t)v3;
      res_9_state v1 = getprotoent();
    }

    while (v1);
  }

  endprotoent();
}

void res_destroyprotolist(void)
{
  v0 = (void **)protolist;
  if (protolist)
  {
    do
    {
      res_9_state v1 = (void **)*v0;
      free(v0[2]);
      free(v0);
      v0 = v1;
    }

    while (v1);
  }

  protolist = 0LL;
}

const char *__cdecl res_protocolname(int num)
{
  if (!protolist) {
    res_buildprotolist();
  }
  unsigned int v2 = &protolist;
  do
  {
    unsigned int v2 = (uint64_t *)*v2;
    if (!v2)
    {
      uint64_t v5 = res_protocolname_number;
      __sprintf_chk(res_protocolname_number, 0, 8uLL, "%d", num);
      return v5;
    }
  }

  while (*((_DWORD *)v2 + 8) != num);
  if (v2 != (uint64_t *)protolist)
  {
    BOOL v3 = (uint64_t *)v2[1];
    *BOOL v3 = *v2;
    if (*v2) {
      *(void *)(*v2 + 8) = v3;
    }
    uint64_t v4 = protolist;
    *(void *)(protolist + 8) = v2;
    uint64_t *v2 = v4;
    protolist = (uint64_t)v2;
  }

  uint64_t v5 = (const char *)v2[2];
  cgetprotobynumber_prot = (uint64_t)v5;
  dword_18C6D6678 = num;
  return v5;
}

const char *__cdecl res_servicename(u_int16_t port, const char *proto)
{
  unsigned int v3 = port;
  uint64_t v4 = servicelist;
  if (servicelist || (res_buildservicelist(), (uint64_t v4 = servicelist) != 0))
  {
    unsigned int v5 = __rev16(v3);
    uint64_t v6 = v4;
    while (1)
    {
      if (*(unsigned __int16 *)(v6 + 32) == v3)
      {
        int v7 = *(const char **)(v6 + 24);
        if (!strcasecmp(v7, proto)) {
          break;
        }
      }

      uint64_t v6 = *(void *)v6;
      if (!v6) {
        goto LABEL_7;
      }
    }

    if (v6 != v4)
    {
      int v9 = *(void **)(v6 + 8);
      *int v9 = *(void *)v6;
      if (*(void *)v6) {
        *(void *)(*(void *)v6 + 8LL) = v9;
      }
      uint64_t v10 = servicelist;
      *(void *)(servicelist + 8) = v6;
      *(void *)uint64_t v6 = v10;
      servicelist = v6;
    }

    u_long v8 = *(const char **)(v6 + 16);
    cgetservbyport_serv = (uint64_t)v8;
    dword_18C6D6690 = v5;
    qword_18C6D6698 = (uint64_t)v7;
  }

  else
  {
LABEL_7:
    unsigned int v12 = v3;
    u_long v8 = res_servicename_number;
    __sprintf_chk(res_servicename_number, 0, 8uLL, "%d", v12);
  }

  return v8;
}

void res_buildservicelist()
{
  v0 = getservent();
  if (v0)
  {
    res_9_state v1 = v0;
    do
    {
      unsigned int v2 = malloc(0x28uLL);
      if (!v2) {
        break;
      }
      unsigned int v3 = v2;
      uint64_t v4 = strdup(v1->s_name);
      v3[2] = v4;
      unsigned int v5 = strdup(v1->s_proto);
      v3[3] = v5;
      if (v4) {
        BOOL v6 = v5 == 0LL;
      }
      else {
        BOOL v6 = 1;
      }
      if (v6)
      {
        u_long v8 = v5;
        if (v4) {
          free(v4);
        }
        if (v8) {
          free(v8);
        }
        free(v3);
        break;
      }

      *((_DWORD *)v3 + 8) = bswap32(LOWORD(v1->s_port)) >> 16;
      uint64_t v7 = servicelist;
      *unsigned int v3 = servicelist;
      v3[1] = 0LL;
      if (v7) {
        *(void *)(v7 + 8) = v3;
      }
      servicelist = (uint64_t)v3;
      res_9_state v1 = getservent();
    }

    while (v1);
  }

  endservent();
}

uint64_t res_query_mDNSResponder( __res_9_state *a1, char *a2, int a3, int a4, u_char *a5, int a6, uint64_t a7, _DWORD *a8)
{
  uint16_t v12 = a3;
  *(void *)a5 &= 0xFFFFFFFFF0FFFFFFLL;
  uint64_t v59 = 0LL;
  uint64_t v60 = 0LL;
  uint64_t v61 = 0LL;
  LODWORD(v60) = a1->options;
  context = a5;
  uint64_t v58 = a6;
  uint64_t result = res_9_nmkquery(a1, 0, a2, a3, a4, 0LL, 0, 0LL, a5, a6);
  uint64_t v57 = (int)result;
  if (!(_DWORD)result) {
    return result;
  }
  *(void *)a5 &= ~0x800000uLL;
  if (a2)
  {
    int v16 = strlen(a2);
    if (v16)
    {
      if (v16 - (a2[v16 - 1] == 46) == 72)
      {
        unsigned int v17 = a2[58] - 56;
        if (v17 <= 0x2A && ((1LL << v17) & 0x60000000603LL) != 0 && !strncasecmp(a2 + 59, ".e.f.ip6.arpa", 0xDuLL))
        {
          unint64_t v36 = 0LL;
          while (1)
          {
            unsigned int v37 = a2[v36];
            if (a2[v36] < 48 || v37 - 58 < 7) {
              break;
            }
            BOOL v39 = v37 <= 0x66 && v37 - 71 >= 0x1A;
            if (!v39 || a2[v36 + 1] != 46) {
              break;
            }
            BOOL v40 = v36 > 0x37;
            v36 += 2LL;
            if (v40)
            {
              uint32_t v18 = hexval[a2[48]] + 16 * hexval[a2[50]] + (hexval[a2[52]] << 8) + (hexval[a2[54]] << 12);
              if (!v18) {
                goto LABEL_9;
              }
              unsigned int v41 = strdup(a2);
              if (!v41)
              {
                *MEMORY[0x1895FB758] = 3;
                *__error() = 12;
                return 0xFFFFFFFFLL;
              }

              size_t v19 = v41;
              v41[48] = 48;
              v41[50] = 48;
              v41[52] = 48;
              v41[54] = 48;
              goto LABEL_11;
            }
          }
        }
      }
    }

    uint32_t v18 = 0;
LABEL_9:
    size_t v19 = a2;
  }

  else
  {
    uint32_t v18 = 0;
    size_t v19 = 0LL;
  }

void res_query_callback( int a1, int a2, int a3, int a4, char *a5, int a6, int a7, unsigned int a8, unsigned __int8 *a9, u_int32_t a10, uint64_t *a11)
{
  v25[1] = *(u_char **)MEMORY[0x1895F89C0];
  *((_DWORD *)a11 + 9) = a2;
  *((_DWORD *)a11 + 10) = a4;
  if (a4)
  {
    if ((a11[4] & 2) != 0) {
      printf(";; res_query_mDNSResponder callback [%s %hu %hu]: error %u\n");
    }
  }

  else
  {
    uint64_t v14 = a11[1];
    unint64_t v15 = a11[2] - v14;
    if (v15 > 0xB)
    {
      uint64_t v18 = *a11;
      unint64_t v24 = (u_char *)(*a11 + 12);
      v25[0] = 0LL;
      uint64_t v19 = v18 + v14;
      int v20 = res_9_dn_comp(a5, (u_char *)(v18 + v14), v15, &v24, v25);
      if (v20 < 0)
      {
        if ((a11[4] & 2) != 0) {
          printf(";; res_query_mDNSResponder callback [%s %hu %hu]: name mismatch\n");
        }
      }

      else
      {
        unsigned int v21 = v20;
        int v22 = *((_DWORD *)a11 + 8);
        if (v15 >= a8 + v20 + 10)
        {
          if ((v22 & 2) != 0) {
            printf(";; res_query_mDNSResponder callback for %s %hu %hu\n", a5, a6, a7);
          }
          unsigned __int16 v23 = (u_char *)(v19 + v21);
          res_9_putshort(a6, v23);
          res_9_putshort(a7, v23 + 2);
          res_9_putlong(a10, v23 + 4);
          res_9_putshort(a8, v23 + 8);
          v23 += 10;
          memcpy(v23, a9, a8);
          *(_WORD *)(*a11 + 6) = bswap32(__rev16(*(unsigned __int16 *)(*a11 + 6)) + 1) >> 16;
          a11[1] = (uint64_t)&v23[a8 - *a11];
          *((_WORD *)a11 + 12) = a6;
          if (a6 == 28 && !*((_DWORD *)a11 + 7) && *a9 == 254 && (a9[1] & 0xC0) == 0x80) {
            *((_DWORD *)a11 + 7) = a3;
          }
        }

        else if ((v22 & 2) != 0)
        {
          printf(";; res_query_mDNSResponder callback [%s %hu %hu]: insufficient buffer space for reply\n");
        }
      }
    }

    else if ((a11[4] & 2) != 0)
    {
      printf(";; res_query_mDNSResponder callback [%s %hu %hu]: malformed reply\n");
    }
  }

uint64_t res_nquery_soa_min( __res_9_state *res, const char *a2, int a3, int a4, u_char *a5, int a6, int a7, int a8, int *a9)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  if (a9) {
    *a9 = -1;
  }
  u_int flags = res->_flags;
  while (1)
  {
    _res_9_h_errno_set(res, 0);
    *(void *)a5 &= 0xFFFFFFFFF0FFFFFFLL;
    if ((res->options & 2) != 0) {
      printf(";; res_query(%s, %d, %d)\n", a2, a3, a4);
    }
    uint64_t v16 = res_9_nmkquery(res, 0, a2, a3, a4, 0LL, 0, 0LL, v46, 1024);
    if ((int)v16 < 1
      || (res->_flags & 4) == 0
      && (res->options & 0x40200000) != 0
      && (uint64_t v16 = res_9_nopt(res, v16, v46, 1024, a6), (int)v16 <= 0))
    {
      if ((res->options & 2) != 0) {
        puts(";; res_query: mkquery failed");
      }
      int v19 = 3;
      goto LABEL_43;
    }

    uint64_t v16 = res_9_nsend_2(res, v46, v16, a5, a6);
    if ((v16 & 0x80000000) == 0) {
      break;
    }
    u_long options = res->options;
    if ((options & 0x40200000) == 0 || (u_int v18 = res->_flags, ((v18 ^ flags) & 4) == 0))
    {
      if ((options & 2) != 0) {
        puts(";; res_query: send error");
      }
      int v19 = 2;
LABEL_43:
      _res_9_h_errno_set(res, v19);
      return v16;
    }

    res->_u_int flags = v18 | 4;
    if ((options & 2) != 0) {
      puts(";; res_nquery: retry without EDNS0");
    }
  }

  unint64_t v20 = *(void *)a5;
  unsigned int v21 = BYTE3(*(void *)a5) & 0xF;
  if (v21 == 3)
  {
    int v22 = a9;
    if (!a9) {
      goto LABEL_32;
    }
  }

  else
  {
    int v22 = a9;
    if (v21 || !a9 || (v20 & 0xFFFF000000000000LL) != 0) {
      goto LABEL_32;
    }
  }

  unsigned __int16 v23 = &a5[a6];
  v40[0] = a5;
  v40[1] = v23;
  if (a6 >= 2)
  {
    __int16 v41 = bswap32(v20) >> 16;
    if (a6 >= 4)
    {
      uint64_t v28 = 0LL;
      __int16 v42 = (v20 >> 8) & 0xFF00 | BYTE3(v20);
      while (&a5[v28 + 6] <= v23)
      {
        *(_WORD *)&v43[v28] = _byteswap_ushort(*(_WORD *)&a5[v28 + 4]);
        v28 += 2LL;
        if (v28 == 8)
        {
          int v29 = v44;
          if (v44)
          {
            uint64_t v30 = 0LL;
            DNSServiceErrorType v31 = a5 + 12;
            char v32 = 1;
            do
            {
              char v33 = v32;
              int v34 = (char *)v40 + 2 * v30;
              if (*((_WORD *)v34 + 10))
              {
                unsigned int v35 = res_9_ns_skiprr(v31, v23, (res_9_ns_sect)v30, *((unsigned __int16 *)v34 + 10));
                if ((v35 & 0x80000000) != 0) {
                  goto LABEL_29;
                }
                v45[v30] = v31;
                v31 += v35;
              }

              else
              {
                v45[v30] = 0LL;
              }

              char v32 = 0;
              uint64_t v30 = 1LL;
            }

            while ((v33 & 1) != 0);
            int v36 = 0;
            int v24 = -1;
            while (1)
            {
              unsigned int v37 = res_9_ns_skiprr(v31, v23, ns_s_ns, 1);
              if ((v37 & 0x80000000) != 0) {
                break;
              }
              v31 += v37;
              signed int v38 = bswap32(*((_DWORD *)v31 - 1));
              if (v38 < v24 || v36 == 0) {
                int v24 = v38;
              }
              if (v29 == ++v36) {
                goto LABEL_30;
              }
            }
          }

          break;
        }
      }
    }
  }

int res_9_nquery(res_9_state a1, const char *a2, int a3, int a4, u_char *a5, int a6)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v7 = 128;
  int v8 = 0;
  return res_nquery_soa_min(a1, a2, a3, a4, a5, a6, (int)&v9, (int)&v7, &v8);
}

uint64_t res_nquerydomain_2( uint64_t a1, char *__s, const char *a3, int a4, int a5, u_char *a6, int a7, int a8, int a9)
{
  unint64_t v15 = __s;
  uint64_t v24 = *MEMORY[0x1895F89C0];
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    unsigned int v17 = "<Nil>";
    if (a3) {
      unsigned int v17 = a3;
    }
    printf(";; res_nquerydomain(%s, %s, %d, %d)\n", __s, v17, a4, a5);
  }

  int v18 = strlen(v15);
  if (a3)
  {
    if ((int)(strlen(a3) + v18) < 1024)
    {
      unsigned int v21 = v15;
      unint64_t v15 = v23;
      __sprintf_chk(v23, 0, 0x401uLL, "%s.%s", v21, a3);
LABEL_8:
      int v22 = 0;
      return res_nquery_soa_min((__res_9_state *)a1, v15, a4, a5, a6, a7, a8, a9, &v22);
    }
  }

  else if (v18 < 1025)
  {
    if (v18 >= 1)
    {
      uint64_t v20 = (v18 - 1);
      if (v15[v20] == 46)
      {
        __strncpy_chk();
        v23[v20] = 0;
        unint64_t v15 = v23;
      }
    }

    goto LABEL_8;
  }

  _res_9_h_errno_set((__res_9_state *)a1, 3);
  return 0xFFFFFFFFLL;
}

int res_9_nquerydomain(res_9_state a1, const char *a2, const char *a3, int a4, int a5, u_char *a6, int a7)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v8 = 128;
  return res_nquerydomain_2((uint64_t)a1, (char *)a2, a3, a4, a5, a6, a7, (int)&v9, (int)&v8);
}

uint64_t res_nsearch_2(uint64_t a1, char *a2, int a3, int a4, u_char *a5, int a6, int a7, int a8)
{
  uint64_t v51 = *MEMORY[0x1895F89C0];
  *__error() = 0;
  _res_9_h_errno_set((__res_9_state *)a1, 1);
  int v16 = *a2;
  if (*a2)
  {
    unsigned int v17 = 0;
    int v18 = a2;
    do
    {
      if (v16 == 46) {
        ++v17;
      }
      int v19 = *++v18;
      int v16 = v19;
    }

    while (v19);
    if (v18 > a2)
    {
      BOOL v20 = *(v18 - 1) == 46;
      if (!v17) {
        goto LABEL_12;
      }
LABEL_11:
      int v21 = 0;
      goto LABEL_15;
    }

    BOOL v20 = 0;
    if (v17) {
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v20 = 0;
  }

const char *__cdecl res_9_hostalias_2(const res_9_state a1, const char *a2, char *a3, size_t a4)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  if ((a1->options & 0x1000) != 0) {
    return 0LL;
  }
  int v7 = getenv("HOSTALIASES");
  if (!v7) {
    return 0LL;
  }
  int v8 = fopen(v7, "r");
  if (!v8) {
    return 0LL;
  }
  char v9 = v8;
  setbuf(v8, 0LL);
  v24[1022] = 0;
  uint64_t v10 = MEMORY[0x1895F8770];
  while (2)
  {
    char v11 = 0LL;
    unsigned int v12 = v23;
    if (!v23) {
      goto LABEL_31;
    }
    uint64_t v13 = v24;
    while (1)
    {
      if ((v12 & 0x80) == 0)
      {
        if ((*(_DWORD *)(v10 + 4LL * v12 + 60) & 0x4000) != 0) {
          break;
        }
        goto LABEL_12;
      }

      if (__maskrune(v12, 0x4000uLL)) {
        break;
      }
LABEL_12:
      unsigned int v14 = *v13++;
      unsigned int v12 = v14;
      if (!v14) {
        goto LABEL_30;
      }
    }

    if (!*(v13 - 1)) {
      goto LABEL_30;
    }
    *(v13 - _dns_print_resource_record_lock((uint64_t)r, f, 1) = 0;
    break;
  }

  do
  {
    uint64_t v15 = *v13;
    else {
      int v16 = *(_DWORD *)(v10 + 4 * v15 + 60) & 0x4000;
    }
    ++v13;
  }

  while (v16);
  if (!(_DWORD)v15)
  {
LABEL_30:
    char v11 = 0LL;
    goto LABEL_31;
  }

  unsigned int v17 = v13 - 1;
  unsigned int v18 = *v13;
  if (*v13)
  {
    do
    {
      if ((v18 & 0x80) != 0) {
        int v19 = __maskrune(v18, 0x4000uLL);
      }
      else {
        int v19 = *(_DWORD *)(v10 + 4LL * v18 + 60) & 0x4000;
      }
      if (v19) {
        break;
      }
      unsigned int v20 = *++v13;
      unsigned int v18 = v20;
    }

    while (v20);
  }

  _BYTE *v13 = 0;
  size_t v21 = a4 - 1;
  strncpy(a3, v17, v21);
  a3[v21] = 0;
  char v11 = a3;
LABEL_31:
  fclose(v9);
  return v11;
}

uint64_t __res_nsearch_list_2( uint64_t a1, char *a2, int a3, int a4, u_char *a5, int a6, int a7, int a8, int a9, const char **a10)
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  *__error() = 0;
  _res_9_h_errno_set((__res_9_state *)a1, 1);
  int v15 = *a2;
  if (*a2)
  {
    unsigned int v16 = 0;
    unsigned int v17 = a2;
    do
    {
      if (v15 == 46) {
        ++v16;
      }
      int v18 = *++v17;
      int v15 = v18;
    }

    while (v18);
    if (v17 > a2)
    {
      BOOL v19 = *(v17 - 1) == 46;
      if (!v16) {
        goto LABEL_12;
      }
LABEL_11:
      int v20 = 0;
      goto LABEL_15;
    }

    BOOL v19 = 0;
    if (v16) {
      goto LABEL_11;
    }
  }

  else
  {
    BOOL v19 = 0;
  }

LABEL_63:
          _res_9_h_errno_set(v34, v25);
          return 0xFFFFFFFFLL;
        }

int res_9_nsearch(res_9_state a1, const char *a2, int a3, int a4, u_char *a5, int a6)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  int v7 = 128;
  return res_nsearch_2((uint64_t)a1, (char *)a2, a3, a4, a5, a6, (int)&v8, (int)&v7);
}

uint64_t res_9_ourserver_p(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a2 + 1);
  if (v2 == 30)
  {
    uint64_t v10 = *(void *)(a1 + 536);
    if (v10)
    {
      uint64_t v11 = *(unsigned int *)(a1 + 16);
      if ((int)v11 >= 1)
      {
        for (uint64_t i = a1 + 20; ; i += 16LL)
        {
          uint64_t v13 = *(_BYTE *)(i + 1) ? i : v10;
          if (*(_BYTE *)(v13 + 1) == 30 && *(unsigned __int16 *)(v13 + 2) == *(unsigned __int16 *)(a2 + 2))
          {
            if (!*(_DWORD *)(v13 + 8) && !*(_DWORD *)(v13 + 12) && !*(_DWORD *)(v13 + 16) && !*(_DWORD *)(v13 + 20)) {
              break;
            }
            uint64_t v15 = *(void *)(v13 + 8);
            uint64_t v14 = *(void *)(v13 + 16);
            if (v15 == *(void *)(a2 + 8) && v14 == *(void *)(a2 + 16)) {
              break;
            }
          }

          v10 += 128LL;
          if (!--v11) {
            return 0LL;
          }
        }

        return 1LL;
      }
    }

    return 0LL;
  }

  if (v2 != 2) {
    return 0LL;
  }
  uint64_t v3 = *(unsigned int *)(a1 + 16);
  uint64_t v4 = 0LL;
  uint64_t v5 = a1 + 20;
  uint64_t v6 = v3 << 7;
  while (1)
  {
    uint64_t v7 = v5;
    if (!*(_BYTE *)(v5 + 1))
    {
      uint64_t v8 = *(void *)(a1 + 536);
      if (v8) {
        uint64_t v7 = v8 + v4;
      }
      else {
        uint64_t v7 = v5;
      }
    }

    if (*(_BYTE *)(v7 + 1) == 2 && *(unsigned __int16 *)(v7 + 2) == *(unsigned __int16 *)(a2 + 2))
    {
      int v9 = *(_DWORD *)(v7 + 4);
      if (!v9 || v9 == *(_DWORD *)(a2 + 4)) {
        break;
      }
    }

    v5 += 16LL;
    v4 += 128LL;
    if (v6 == v4) {
      return 0LL;
    }
  }

  return 1LL;
}

uint64_t res_9_get_nsaddr(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a1 + 16 * a2;
  uint64_t result = v3 + 20;
  if (!*(_BYTE *)(v3 + 21))
  {
    uint64_t v5 = *(void *)(a1 + 536);
    if (v5) {
      return v5 + (a2 << 7);
    }
  }

  return result;
}

int res_9_nameinquery(const char *a1, int a2, int a3, const u_char *a4, const u_char *a5)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (!*((_WORD *)a4 + 2)) {
    return 0;
  }
  uint64_t v10 = a4 + 12;
  unsigned int v11 = __rev16(*((unsigned __int16 *)a4 + 2)) + 1;
  while (1)
  {
    unsigned int v12 = res_9_dn_expand(a4, a5, v10, v18, 1026);
    if ((v12 & 0x80000000) != 0) {
      break;
    }
    uint64_t v13 = &v10[v12];
    uint64_t v10 = v13 + 4;
    if (v13 + 4 > a5) {
      break;
    }
    u_int v14 = res_9_ns_get16(v13);
    u_int v15 = res_9_ns_get16(v13 + 2);
    if (v14 == a2 && v15 == a3)
    {
      int result = res_9_ns_samename(v18, a1);
      if (result == 1) {
        return result;
      }
    }

    if (--v11 <= 1) {
      return 0;
    }
  }

  return -1;
}

int res_9_queriesmatch(const u_char *a1, const u_char *a2, const u_char *a3, const u_char *a4)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v5 = a1 + 12;
  int result = -1;
  if (v5 <= a2 && a3 + 12 <= a4)
  {
    uint64_t v10 = *(void *)a3;
    if ((*(void *)a1 & 0x780000LL) == 0x280000 && (v10 & 0x780000) == 0x280000) {
      return 1;
    }
    if ((unsigned __int16)WORD2(*(void *)a1) == WORD2(v10))
    {
      unsigned int v11 = (bswap32(HIDWORD(*(void *)a1)) >> 16) + 1;
      while ((int)--v11 >= 1)
      {
        unsigned int v12 = res_9_dn_expand(a1, a2, v5, v16, 1026);
        if ((v12 & 0x80000000) != 0) {
          return -1;
        }
        uint64_t v13 = &v5[v12];
        uint64_t v5 = v13 + 4;
        if (v13 + 4 > a2) {
          return -1;
        }
        u_int v14 = res_9_ns_get16(v13);
        u_int v15 = res_9_ns_get16(v13 + 2);
        int result = res_9_nameinquery(v16, v14, v15, a3, a4);
        if (!result) {
          return result;
        }
      }

      return 1;
    }

    return 0;
  }

  return result;
}

uint64_t dns_res_send( res_9_state a1, const u_char *a2, int a3, const u_char *a4, unsigned int *a5, _DWORD *a6, socklen_t *a7)
{
  uint64_t v254 = *MEMORY[0x1895F89C0];
  v230 = (u_char *)a2;
  int v229 = a3;
  if (!a1->nscount)
  {
    *__error() = 3;
    return 4294966291LL;
  }

  uint64_t v7 = a5;
  uint64_t v8 = *a5;
  if ((int)v8 <= 11)
  {
    *__error() = 22;
    return 4294966292LL;
  }

  u_long options = a1->options;
  u_int v15 = (FILE **)MEMORY[0x1895F89E0];
  if ((options & 2) != 0 || (a1->pfcode & 0x1000) != 0)
  {
    fwrite(";; res_send()\n", 0xEuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
    res_9_pquery(a1, a2, a3, *v15);
    u_long options = a1->options;
  }

  uint64_t v16 = (options >> 3) & 1;
  if (a3 > 512) {
    int v17 = 1;
  }
  else {
    int v17 = v16;
  }
  int nscount = a1->_u._ext.nscount;
  unsigned int v213 = v8;
  if (a1->_u._ext.nscount)
  {
    if (a1->nscount == nscount)
    {
      uint64_t v19 = 0LL;
      uint64_t v20 = 0LL;
      nsaddr_list = a1->nsaddr_list;
      while (1)
      {
        if (nsaddr_list->sin_family)
        {
          ext = a1->_u._ext.ext;
          if (ext)
          {
          }
        }

        int v23 = a1->_u._ext.nssocks[v20];
        if (v23 != -1)
        {
          v246[0] = 128;
          if (getsockname(v23, &v236, v246) < 0) {
            break;
          }
          uint64_t v24 = (uint64_t)nsaddr_list;
          if (!nsaddr_list->sin_family)
          {
            int v25 = a1->_u._ext.ext;
            if (v25) {
              uint64_t v24 = (uint64_t)v25 + v19;
            }
            else {
              uint64_t v24 = (uint64_t)nsaddr_list;
            }
          }

          int nscount = a1->nscount;
        }

        ++v20;
        v19 += 128LL;
        ++nsaddr_list;
        if (v20 >= nscount)
        {
          uint64_t v8 = v213;
          if (a1->_u._ext.nscount) {
            goto LABEL_36;
          }
          goto LABEL_29;
        }
      }
    }

    res_9_nclose(a1);
    a1->_u._ext.int nscount = 0;
    uint64_t v8 = v213;
  }

LABEL_383:
          int v197 = token;
          uint64_t v9 = 4294966294LL;
          goto LABEL_384;
        }
      }

      if (token == -1)
      {
        if ((a1->options & 2) == 0) {
          goto LABEL_78;
        }
LABEL_76:
        goto LABEL_78;
      }

      uint64_t state64 = 0LL;
      notify_get_state(token, &state64);
      u_long v61 = a1->options;
      if (state64 == 4)
      {
        if ((v61 & 2) != 0) {
          fwrite(";; cancelled\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
        }
        res_9_nclose(a1);
        uint64_t v9 = 4294966294LL;
        int v197 = token;
        goto LABEL_385;
      }

      if ((v61 & 2) != 0) {
        goto LABEL_76;
      }
LABEL_78:
      v219 = v7;
      if (v17)
      {
        unsigned int v203 = a1->retry;
        *uint64_t v7 = v8;
        if (!*v211)
        {
          int v142 = a1->_u._ext.ext;
          if (v142) {
            kevent v53 = (const sockaddr *)((char *)v142 + 128 * v206);
          }
        }

        char v143 = 0;
        v222 = v230;
        uint64_t v144 = v229;
        int v145 = token;
        int v146 = v53->sa_family;
        if (v146 == 30) {
          int v147 = 28;
        }
        else {
          int v147 = 0;
        }
        if (v146 == 2) {
          int v148 = 16;
        }
        else {
          int v148 = v147;
        }
        socklen_t v215 = v148;
        v218 = (sockaddr *)(v229 + 2LL);
        while (1)
        {
          if (v145 != -1)
          {
            v233.msg_name = 0LL;
            notify_get_state(v145, (uint64_t *)&v233);
            if (v233.msg_name == (void *)4)
            {
LABEL_344:
              if ((a1->options & 2) != 0) {
                fwrite(";; cancelled\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
              }
              uint64_t v9 = 4294966294LL;
              int v209 = 4;
              goto LABEL_313;
            }
          }

          vcsocuint64_t k = a1->_vcsock;
          if (vcsock < 0) {
            goto LABEL_273;
          }
          u_int flags = a1->_flags;
          if ((flags & 1) != 0)
          {
            v234[0] = 128;
            if (getpeername(vcsock, (sockaddr *)v246, v234) < 0 || !sock_eq((uint64_t)v246, (uint64_t)v53))
            {
              res_9_nclose(a1);
              a1->_flags &= ~1u;
            }

            if (a1->_vcsock < 0) {
              goto LABEL_273;
            }
            u_int flags = a1->_flags;
          }

          if ((flags & 1) == 0) {
            break;
          }
LABEL_278:
          res_9_putshort(v144, v245);
          *(void *)v244.fds_bits = v245;
          *(void *)&v244.fds_bits[2] = 2LL;
          *(void *)&v244.fds_bits[4] = v222;
          *(void *)&v244.fds_bits[6] = v144;
          if ((sockaddr *)writev(a1->_vcsock, (const iovec *)&v244, 2) != v218)
          {
            int v209 = *__error();
            res_9_ns_rr v190 = (FILE *)*MEMORY[0x1895F89D0];
            int v176 = *__error();
            res_9_state v177 = a1;
            uint64_t v178 = v190;
            uint64_t v179 = "write failed";
            goto LABEL_312;
          }

          int v153 = 0;
          while (1)
          {
            if (v145 != -1)
            {
              v233.msg_name = 0LL;
              notify_get_state(v145, (uint64_t *)&v233);
            }

            unsigned __int16 v154 = 2;
            *(_WORD *)v245 = 2;
            uint64_t v155 = (u_char *)a4;
LABEL_283:
            int v156 = read(a1->_vcsock, v155, v154);
            if (v156 < 1) {
              break;
            }
            v155 += v156;
            int v157 = *(unsigned __int16 *)v245;
            unsigned __int16 v154 = *(_WORD *)v245 - v156;
            *(_WORD *)v245 -= v156;
            signed int v158 = res_9_ns_get16(a4);
            LOWORD(v159) = v158;
            if (v158 > *(_DWORD *)v219)
            {
              int v153 = 1;
              if ((a1->options & 2) != 0)
              {
                fwrite(";; response truncated\n", 0x16uLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
                LOWORD(v159) = *v219;
              }

              else
              {
                int v159 = *(_DWORD *)v219;
              }
            }

            *(_WORD *)v245 = v159;
            if ((unsigned __int16)v159 < 0xCu)
            {
              if ((a1->options & 2) != 0) {
                fprintf((FILE *)*MEMORY[0x1895F89E0], ";; undersized: %d\n", (unsigned __int16)v159);
              }
              res_9_nclose(a1);
              uint64_t v7 = v219;
              *(_DWORD *)v219 = 0;
              uint64_t v9 = 4294966290LL;
              int v209 = 40;
              goto LABEL_314;
            }

            __int128 v160 = v53;
            if ((_WORD)v159)
            {
              __int128 v161 = (u_char *)a4;
              while (1)
              {
                int v162 = read(a1->_vcsock, v161, (unsigned __int16)v159);
                if (v162 < 1) {
                  break;
                }
                v161 += v162;
                *(_WORD *)v245 -= v162;
                LOWORD(v159) = *(_WORD *)v245;
                if (!*(_WORD *)v245) {
                  goto LABEL_294;
                }
              }

              int v209 = *__error();
              uint64_t v175 = (FILE *)*MEMORY[0x1895F89D0];
              int v176 = *__error();
              res_9_state v177 = a1;
              uint64_t v178 = v175;
              uint64_t v179 = "read(vc)";
LABEL_312:
              Perror((uint64_t)v177, v178, v179, v176);
              res_9_nclose(a1);
              uint64_t v9 = 4294966287LL;
LABEL_313:
              uint64_t v7 = v219;
LABEL_314:
              uint64_t v8 = v213;
              uint64_t v48 = v203;
              if ((_DWORD)v9) {
                goto LABEL_249;
              }
LABEL_315:
              u_long v180 = a1->options;
              if ((v180 & 2) != 0 || (~LODWORD(a1->pfcode) & 0x2100LL) == 0)
              {
                fwrite(";; got answer:\n", 0xFuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
                u_long v180 = a1->options;
              }

              if ((v180 & 2) != 0 || (a1->pfcode & 0x2000) != 0)
              {
                uint64_t v181 = (FILE **)MEMORY[0x1895F89E0];
                fputs((const char *)&unk_1874AA85D, (FILE *)*MEMORY[0x1895F89E0]);
                else {
                  int v182 = *v7;
                }
                res_9_pquery(a1, a4, v182, *v181);
                u_long v180 = a1->options;
              }

              BOOL v183 = (v180 & 8) != 0 || v17 == 0;
              if (!v183 || (v180 & 0x100) == 0) {
                res_9_nclose(a1);
              }
              if (a1->rhook)
              {
                int v184 = 42;
                while (1)
                {
                  int v185 = ((uint64_t (*)(sockaddr *, u_char *, void, const u_char *, void, _BYTE *))a1->rhook)( v224,  v230,  v229,  a4,  *v7,  v228);
                  if (v185 != 2) {
                    break;
                  }
                  if (!--v184) {
                    goto LABEL_382;
                  }
                }

                if (!v185) {
                  goto LABEL_380;
                }
                if (v185 == 1)
                {
                  uint64_t v9 = 0LL;
                  goto LABEL_339;
                }

                if (v185 != 3)
                {
LABEL_382:
                  res_9_nclose(a1);
                  goto LABEL_383;
                }
              }

LABEL_380:
              uint64_t v9 = 0LL;
LABEL_381:
              int v197 = token;
LABEL_384:
              if (v197 == -1) {
                return v9;
              }
LABEL_385:
              notify_cancel(v197);
              return v9;
            }

LABEL_294:
            kevent v53 = v160;
            if (v153)
            {
              *(void *)a4 |= 0x20000uLL;
              int v163 = v158 - *(_DWORD *)v219;
              *(_WORD *)v245 = v158 - *v219;
              if ((_WORD)v163)
              {
                do
                {
                  if ((v163 & 0xFE00) != 0) {
                    size_t v164 = 512LL;
                  }
                  else {
                    size_t v164 = (unsigned __int16)v163;
                  }
                  int v165 = read(a1->_vcsock, v246, v164);
                  if (v165 <= 0) {
                    break;
                  }
                  int v166 = *(unsigned __int16 *)v245;
                  LOWORD(v163) = *(_WORD *)v245 - v165;
                  *(_WORD *)v245 -= v165;
                }

                while (v166 != (unsigned __int16)v165);
              }
            }

            if (*(unsigned __int16 *)a4 == (unint64_t)*(unsigned __int16 *)v222)
            {
              uint64_t v9 = 0LL;
              uint64_t v7 = v219;
              *a7 = 8;
              *(void *)a6 = v160;
              *(_DWORD *)v219 = v158;
              goto LABEL_314;
            }

            if ((a1->options & 2) != 0 || (a1->pfcode & 0x2000) != 0)
            {
              __int128 v167 = (FILE **)MEMORY[0x1895F89E0];
              fwrite(";; old answer (unexpected):\n", 0x1CuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
              if (v158 >= *(_DWORD *)v219) {
                int v168 = *(_DWORD *)v219;
              }
              else {
                int v168 = v158;
              }
              __int128 v169 = *v167;
              kevent v53 = v160;
              res_9_pquery(a1, a4, v168, v169);
            }
          }

          int v170 = *__error();
          __int128 v171 = (FILE *)*MEMORY[0x1895F89D0];
          uint64_t v172 = __error();
          Perror((uint64_t)a1, v171, "read failed", *v172);
          res_9_nclose(a1);
          LOBYTE(v17_dns_print_resource_record_lock((uint64_t)r, f, 1) = v143 | (v170 != 54);
          res_9_nclose(a1);
          char v143 = 1;
          int v209 = 54;
          if ((v171 & 1) != 0)
          {
            uint64_t v9 = 4294966287LL;
            int v209 = v170;
            goto LABEL_313;
          }
        }

        res_9_nclose(a1);
LABEL_273:
        int v151 = socket(v53->sa_family, 1, 0);
        a1->_vcsocuint64_t k = v151;
        if (v151 >= 1024)
        {
          res_9_nclose(a1);
          *__error() = 38;
          int v151 = a1->_vcsock;
        }

        uint64_t v152 = __error();
        if (v151 < 0)
        {
          int v209 = *v152;
          v191 = (FILE *)*MEMORY[0x1895F89D0];
          res_9_ns_msg v192 = __error();
          Perror((uint64_t)a1, v191, "socket(vc)", *v192);
          uint64_t v9 = 4294966286LL;
          goto LABEL_313;
        }

        *uint64_t v152 = 0;
        if (connect(a1->_vcsock, v53, v215) < 0)
        {
          int v209 = *__error();
          uint64_t v193 = (FILE *)*MEMORY[0x1895F89D0];
          v194 = __error();
          Aerror((uint64_t)a1, v193, "connect(vc)", *v194, v53, v215);
          res_9_nclose(a1);
          uint64_t v9 = 4294966289LL;
          goto LABEL_313;
        }

        a1->_flags |= 1u;
        goto LABEL_278;
      }

      uint64_t v62 = (sockaddr *)v53;
      if (!*v211)
      {
        uint64_t v63 = a1->_u._ext.ext;
        uint64_t v62 = (sockaddr *)((char *)v63 + 128 * v206);
        if (!v63) {
          uint64_t v62 = (sockaddr *)v53;
        }
      }

      v214 = v230;
      size_t v204 = v229;
      int v64 = token;
      v217 = v62;
      int v65 = v62->sa_family;
      if (v65 == 30) {
        int v66 = 28;
      }
      else {
        int v66 = 0;
      }
      if (v65 == 2) {
        socklen_t v67 = 16;
      }
      else {
        socklen_t v67 = v66;
      }
      unsigned __int8 v68 = v212;
      if (*v212 == -1)
      {
        int v69 = socket(v65, 2, 0);
        int *v212 = v69;
        if (v69 >= 1024)
        {
          res_9_nclose(a1);
          *__error() = 38;
          int v69 = *v212;
        }

        if (v69 < 0)
        {
          __error();
          v199 = (FILE *)*MEMORY[0x1895F89D0];
          v200 = __error();
          Perror((uint64_t)a1, v199, "socket(dg)", *v200);
          uint64_t v9 = 4294966286LL;
          goto LABEL_392;
        }

        uint64_t v70 = v53;
        uint64_t v71 = v48;
        unsigned int v72 = 0;
        int v73 = v217->sa_family;
        while (1)
        {
          u_int v74 = res_9_randomid();
          *(_OWORD *)v246 = 0u;
          __int128 v247 = 0u;
          __int128 v248 = 0u;
          __int128 v249 = 0u;
          __int128 v250 = 0u;
          __int128 v251 = 0u;
          __int128 v252 = 0u;
          __int128 v253 = 0u;
          if (v73 == 2) {
            break;
          }
          if (v73 == 30)
          {
            socklen_t v75 = 28;
LABEL_97:
            LOBYTE(v246[0]) = v75;
            BYTE1(v246[0]) = v73;
            HIWORD(v246[0]) = bswap32(((_WORD)v74 + (unsigned __int16)(v74 / 0x3FFF)) | 0xFFFFC000) >> 16;
            goto LABEL_99;
          }

          socklen_t v75 = 0;
LABEL_99:
          int v76 = bind(v69, (const sockaddr *)v246, v75);
          if (v72 <= 0xE)
          {
            ++v72;
            if (v76 < 0) {
              continue;
            }
          }

          uint64_t v8 = v213;
          uint64_t v48 = v71;
          kevent v53 = v70;
          unsigned __int8 v68 = v212;
          if ((a1->options & 2) != 0)
          {
            fwrite(";; new DG socket\n", 0x11uLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
            unsigned __int8 v68 = v212;
          }

          goto LABEL_103;
        }

        socklen_t v75 = 16;
        goto LABEL_97;
      }

LABEL_103:
      v221 = (u_char *)a4;
      int v77 = *v68;
      int v232 = 1;
      setsockopt(v77, 0, 20, &v232, 4u);
      setsockopt(v77, 41, 19, &v232, 4u);
      int v78 = v217->sa_family;
      unsigned int v202 = v48;
      v201 = v53;
      if (v78 == 30)
      {
        if (v217->sa_data[6] == 255)
        {
          int v81 = 0;
          int v80 = 30;
          int v79 = 1;
          goto LABEL_111;
        }
      }

      else if (v78 == 2 && (*(_DWORD *)&v217->sa_data[2] & 0xF0) == 0xE0)
      {
        int v79 = 0;
        int v80 = 2;
        int v81 = 1;
LABEL_111:
        if (getifaddrs((ifaddrs **)v246) < 0)
        {
          v186 = (FILE *)*MEMORY[0x1895F89D0];
          v187 = __error();
          Aerror((uint64_t)a1, v186, "getifaddrs", *v187, v217, v67);
          res_9_nclose(a1);
          uint64_t v9 = 4294966286LL;
          goto LABEL_247;
        }

        uint64_t v82 = *(uint64_t **)v246;
        if (*(void *)v246)
        {
          while (1)
          {
            uint64_t v83 = v82[3];
            if (!v83) {
              goto LABEL_133;
            }
            int v84 = *((_DWORD *)v82 + 4);
            char v85 = v81 ^ 1;
            if ((v82[2] & 0x10) == 0) {
              char v85 = 1;
            }
            if ((v85 & 1) == 0 && bswap32(*(_DWORD *)&v217->sa_data[2]) < 0xE0000100) {
              goto LABEL_133;
            }
            if (v81)
            {
              uint64_t v86 = (msghdr *)(v83 + 4);
              int v87 = v77;
              int v88 = 0;
            }

            else
            {
              if (!v79)
              {
                uint64_t v93 = (FILE *)*MEMORY[0x1895F89D0];
                int v94 = __error();
                Aerror((uint64_t)a1, v93, "setsockopt", *v94, v217, v67);
                goto LABEL_133;
              }

              LODWORD(v233.msg_name) = if_nametoindex((const char *)v82[1]);
              *(_DWORD *)&v217[1].sa_data[6] = v233.msg_name;
              uint64_t v86 = &v233;
              int v87 = v77;
              int v88 = 41;
            }

            if ((setsockopt(v87, v88, 9, v86, 4u) & 0x80000000) == 0) {
              break;
            }
            uint64_t v91 = (FILE *)*MEMORY[0x1895F89D0];
            uint64_t v92 = __error();
            Aerror((uint64_t)a1, v91, "setsockopt", *v92, v217, v67);
            if (v79) {
              goto LABEL_131;
            }
LABEL_133:
            uint64_t v82 = (uint64_t *)*v82;
            if (!v82)
            {
              uint64_t v95 = *(void *)v246;
              goto LABEL_136;
            }
          }

          if (sendto(v77, v214, v204, 0, v217, v67) != v204)
          {
            int v89 = (FILE *)*MEMORY[0x1895F89D0];
            uint64_t v90 = __error();
            Aerror((uint64_t)a1, v89, "sendto", *v90, v217, v67);
          }

          if (!v79) {
            goto LABEL_133;
          }
LABEL_131:
          *(_DWORD *)&v217[1].sa_data[6] = 0;
          goto LABEL_133;
        }

        uint64_t v95 = 0LL;
LABEL_136:
        MEMORY[0x1895A5C50](v95);
        int v207 = 0;
        goto LABEL_137;
      }

      if (sendto(v77, v214, v204, 0, v217, v67) != v204)
      {
        v173 = (FILE *)*MEMORY[0x1895F89D0];
        uint64_t v174 = __error();
        Aerror((uint64_t)a1, v173, "sendto", *v174, v217, v67);
        res_9_nclose(a1);
        uint64_t v9 = 4294966287LL;
        a4 = v221;
        goto LABEL_248;
      }

      int v207 = 1;
LABEL_137:
      int v96 = a1->retry * a1->nscount;
      int v97 = a1->retrans / v96;
      if (v97 <= 1) {
        uint64_t v98 = 1LL;
      }
      else {
        uint64_t v98 = v97;
      }
      int v99 = 1000 * (a1->retrans - (int)v98 * v96) / v96;
      __darwin_time_t v100 = evNowTime();
      __darwin_time_t v101 = v100;
      uint64_t v103 = v102;
      uint64_t v104 = v102 + 1000000LL * v99;
      if (v104 <= 999999999) {
        uint64_t v105 = v100 + v98;
      }
      else {
        uint64_t v105 = v100 + v98 + 1;
      }
      if (v104 <= 999999999) {
        uint64_t v106 = v104;
      }
      else {
        uint64_t v106 = v104 - 1000000000;
      }
      else {
        uint64_t v107 = 0LL;
      }
      while (1)
      {
        if (v64 != -1)
        {
          uint64_t v231 = 0LL;
          notify_get_state(v64, &v231);
          if (v231 == 4)
          {
LABEL_236:
            if ((a1->options & 2) != 0) {
              fwrite(";; cancelled\n", 0xDuLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
            }
            uint64_t v9 = 4294966294LL;
            goto LABEL_247;
          }
        }

        memset(&v244, 0, sizeof(v244));
        if (__darwin_check_fd_set_overflow(v77, &v244, 0)) {
          v244.fds_bits[(unint64_t)v77 >> 5] |= 1 << v77;
        }
        else {
          BOOL v108 = 1;
        }
        int v109 = v77;
        if (!v108)
        {
          unint64_t v110 = *v107;
          int v109 = v77;
          if ((v110 & 0x80000000) == 0)
          {
            if (__darwin_check_fd_set_overflow(*v107, &v244, 0)) {
              *(__int32_t *)((char *)v244.fds_bits + ((v110 >> 3) & 0x1FFFFFFC)) |= 1 << v110;
            }
            int v109 = *v107;
            if (v77 > *v107) {
              int v109 = v77;
            }
          }
        }

        int v111 = v109 + 1;
        int v112 = v106 - v103;
        if (v105 == v101) {
          uint64_t v113 = v106 - v103;
        }
        else {
          uint64_t v113 = v105 - v101;
        }
        if (v106 < v103) {
          v112 += 1000000000;
        }
        uint64_t v114 = v105 - v101 - (v106 < v103);
        if (v113 < 1)
        {
          int v112 = 0;
          uint64_t v114 = 0LL;
        }

        *(void *)v246 = v114;
        *(void *)&v246[2] = (v112 / 1000);
        int v115 = select(v111, &v244, 0LL, 0LL, (timeval *)v246);
        if (!v115) {
          break;
        }
        if ((v115 & 0x80000000) == 0)
        {
          if (interrupt_pipe_enabled)
          {
            if (v107)
            {
              unint64_t v116 = *v107;
              if ((v116 & 0x80000000) != 0
                || __darwin_check_fd_set_overflow(*v107, &v244, 0)
                && ((*(unsigned int *)((char *)v244.fds_bits + ((v116 >> 3) & 0x1FFFFFFC)) >> v116) & 1) != 0)
              {
                goto LABEL_236;
              }
            }
          }

          *__error() = 0;
          uint64_t v117 = (int)*v7;
          *(void *)v234 = v221;
          uint64_t v235 = v117;
          *(void *)&v233.uint64_t msg_controllen = 0LL;
          memset(&v233.msg_namelen, 0, 32);
          v233.msg_name = a6;
          v233.msg_namelen = *a7;
          v233.msg_iov = (iovec *)v234;
          v233.msg_iovlen = 1;
          v233.msg_control = v246;
          v233.uint64_t msg_controllen = 1024;
          ssize_t v118 = recvmsg(v77, &v233, 0);
          unsigned int v119 = 0;
          if ((v118 & 0x8000000000000000LL) == 0)
          {
            uint64_t msg_controllen = v233.msg_controllen;
            if (v233.msg_controllen >= 0xCuLL)
            {
              if ((v233.msg_flags & 0x20) != 0 || (*a7 = v233.msg_namelen, (unsigned int v121 = (char *)v233.msg_control) == 0LL))
              {
                unsigned int v119 = 0;
              }

              else
              {
                unsigned int v119 = 0;
                msg_control = (unsigned int *)v233.msg_control;
                do
                {
                  unsigned int v123 = msg_control[1];
                  if (v123 == 41)
                  {
                    if (msg_control[2] == 19) {
                      unsigned int v119 = msg_control[7];
                    }
                  }

                  else if (!v123 && msg_control[2] == 20 && *((unsigned __int8 *)msg_control + 17) <= 0xFuLL)
                  {
                    __memcpy_chk();
                    v245[*((unsigned __int8 *)msg_control + 17)] = 0;
                    unsigned int v119 = if_nametoindex((const char *)v245);
                    unsigned int v121 = (char *)v233.msg_control;
                    uint64_t msg_controllen = v233.msg_controllen;
                  }

                  msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3LL) & 0x1FFFFFFFCLL));
                }

                while (msg_control + 3 <= (unsigned int *)&v121[msg_controllen]);
              }
            }
          }

          if ((int)v118 <= 0)
          {
            int v138 = (FILE *)*MEMORY[0x1895F89D0];
            uint64_t v139 = __error();
            Perror((uint64_t)a1, v138, "recvfrom", *v139);
            res_9_nclose(a1);
            uint64_t v9 = 4294966287LL;
            goto LABEL_247;
          }

          int v124 = v217->sa_family;
          if (v124 == 30)
          {
            a6[6] = v119;
          }

          else if (v124 == 2)
          {
            a6[2] = v119;
          }

          if (v118 <= 0xB)
          {
            if ((a1->options & 2) != 0) {
              fprintf((FILE *)*MEMORY[0x1895F89E0], ";; undersized: %d\n", v118);
            }
            res_9_nclose(a1);
            uint64_t v9 = 4294966290LL;
            int v209 = 40;
            goto LABEL_245;
          }

          uint64_t v125 = *(void *)v221;
          u_long v126 = a1->options;
          if ((unsigned __int16)*(void *)v221 != *(_WORD *)v214)
          {
            if ((v126 & 2) != 0 || (a1->pfcode & 0x2000) != 0)
            {
              uint64_t v127 = (FILE **)MEMORY[0x1895F89E0];
              unsigned int v128 = (FILE *)*MEMORY[0x1895F89E0];
              int v129 = ";; old answer:\n";
              size_t v130 = 15LL;
              goto LABEL_210;
            }
          }

          else
          {
            int v131 = v207;
            if ((v126 & 0x400) != 0) {
              int v131 = 0;
            }
            if (v131 != 1 || res_9_ourserver_p((uint64_t)a1, (uint64_t)a6))
            {
              if ((v125 & 0xF000000) == 0x1000000 && (v126 & 0x40000000) != 0)
              {
                a4 = v221;
                uint64_t v8 = v213;
                uint64_t v48 = v202;
                if ((v126 & 2) != 0)
                {
                  res_9_ns_msg v188 = (FILE **)MEMORY[0x1895F89E0];
                  fwrite("server rejected query with EDNS0:\n", 0x22uLL, 1uLL, (FILE *)*MEMORY[0x1895F89E0]);
                  else {
                    int v189 = *v7;
                  }
                  res_9_pquery(a1, v221, v189, *v188);
                }

                a1->_flags |= 4u;
                res_9_nclose(a1);
                uint64_t v9 = 4294966289LL;
              }

              else
              {
                a4 = v221;
                uint64_t v8 = v213;
                int v134 = (FILE **)MEMORY[0x1895F89E0];
                uint64_t v48 = v202;
                if ((v126 & 0x800) != 0) {
                  goto LABEL_221;
                }
                if (res_9_queriesmatch(v214, &v214[v204], v221, &v221[*v7]))
                {
                  LODWORD(v125) = *(_DWORD *)v221;
LABEL_221:
                  unsigned int v135 = BYTE3(v125) & 0xF;
                  kevent v53 = v201;
                  if (v135 > 5 || ((1 << v135) & 0x34) == 0) {
                    goto LABEL_229;
                  }
                  if ((a1->options & 2) != 0)
                  {
                    fwrite("server rejected query:\n", 0x17uLL, 1uLL, *v134);
                    else {
                      int v136 = *v7;
                    }
                    res_9_pquery(a1, v221, v136, *v134);
                  }

                  res_9_nclose(a1);
                  if (!a1->pfcode)
                  {
                    uint64_t v9 = v221[3] & 0xF;
                  }

                  else
                  {
LABEL_229:
                    u_long v137 = a1->options;
                    if ((v137 & 0x20) == 0 && (*(void *)v221 & 0x20000) != 0)
                    {
                      if ((v137 & 2) != 0) {
                        fwrite(";; truncated answer\n", 0x14uLL, 1uLL, *v134);
                      }
                      res_9_nclose(a1);
                      uint64_t v9 = 0LL;
                      int v216 = 1;
                      int v17 = 1;
                      goto LABEL_65;
                    }

                    uint64_t v9 = 0LL;
                    *uint64_t v7 = v118;
                  }
                }

                else
                {
                  if ((a1->options & 2) != 0 || (a1->pfcode & 0x2000) != 0)
                  {
                    fwrite(";; wrong query name:\n", 0x15uLL, 1uLL, *v134);
                    else {
                      int v195 = *v7;
                    }
                    res_9_pquery(a1, v221, v195, *v134);
                  }

                  res_9_nclose(a1);
                  uint64_t v9 = 4294966290LL;
                }
              }

              int v216 = 1;
              goto LABEL_248;
            }

            if ((v126 & 2) != 0 || (a1->pfcode & 0x2000) != 0)
            {
              uint64_t v127 = (FILE **)MEMORY[0x1895F89E0];
              unsigned int v128 = (FILE *)*MEMORY[0x1895F89E0];
              int v129 = ";; not our server:\n";
              size_t v130 = 19LL;
LABEL_210:
              fwrite(v129, v130, 1uLL, v128);
              else {
                int v132 = *v7;
              }
              res_9_pquery(a1, v221, v132, *v127);
            }
          }

          int v216 = 1;
          goto LABEL_215;
        }

        if (*__error() != 4)
        {
          uint64_t v140 = (FILE *)*MEMORY[0x1895F89D0];
          uint64_t v141 = __error();
          Perror((uint64_t)a1, v140, "select", *v141);
          res_9_nclose(a1);
          uint64_t v9 = 4294966286LL;
          goto LABEL_247;
        }

LABEL_340:
      uint64_t v49 = a1->nscount;
      uint64_t v50 = v210;
    }

    while (v210 < v49);
    int retry = a1->retry;
LABEL_369:
    uint64_t v48 = (v48 + 1);
  }

  while ((int)v48 < retry);
LABEL_372:
  res_9_nclose(a1);
  if (token != -1) {
    notify_cancel(token);
  }
  if (v17)
  {
    *__error() = v209;
  }

  else
  {
    v196 = __error();
    if (v216)
    {
      int *v196 = 61;
      return 4294966289LL;
    }

    else
    {
      int *v196 = 60;
      return 4294966295LL;
    }
  }

  return v9;
}

BOOL sock_eq(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 == 30)
  {
    return 0LL;
  }

  return *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4);
}

int res_9_nsend_2(res_9_state a1, const u_char *a2, int a3, u_char *a4, int a5)
{
  int v8 = a5;
  else {
    return v8;
  }
}

int res_9_nsend(res_9_state a1, const u_char *a2, int a3, u_char *a4, int a5)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  socklen_t v6 = 128;
  int v7 = a5;
  else {
    return v7;
  }
}

int *Perror(uint64_t a1, FILE *a2, const char *a3, int a4)
{
  int v8 = *__error();
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    uint64_t v9 = strerror(a4);
    fprintf(a2, "res_send: %s: %s\n", a3, v9);
  }

  int result = __error();
  *int result = v8;
  return result;
}

int *Aerror(uint64_t a1, FILE *a2, const char *a3, int a4, const sockaddr *a5, socklen_t a6)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  int v12 = *__error();
  if ((*(_BYTE *)(a1 + 8) & 2) != 0)
  {
    if (getnameinfo(a5, a6, __dst, 0x401u, v15, 0x20u, 10))
    {
      strncpy(__dst, "?", 0x400uLL);
      __dst[1024] = 0;
      *(_OWORD *)u_int v15 = xmmword_1874AA21B;
      *(_OWORD *)&v15[15] = *(__int128 *)((char *)&xmmword_1874AA21B + 15);
      char v16 = 0;
    }

    uint64_t v13 = strerror(a4);
    fprintf(a2, "res_send: %s ([%s].%s): %s\n", a3, __dst, v15, v13);
  }

  int result = __error();
  *int result = v12;
  return result;
}

__darwin_time_t evNowTime()
{
  if (gettimeofday(&v1, 0LL) < 0) {
    return 0LL;
  }
  else {
    return v1.tv_sec;
  }
}

int res_9_nsendsigned(res_9_state a1, const u_char *a2, int a3, res_9_ns_tsig_key *a4, u_char *a5, int a6)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  int v34 = a6;
  res_9_dst_init();
  int v12 = (__res_9_state *)malloc(0x228uLL);
  if (!v12 || (v13 = v12, memcpy(v12, a1, sizeof(__res_9_state)), v13->_pad = 9, (u_int v14 = malloc(a3 + 1024)) == 0LL))
  {
    int v25 = __error();
    int v26 = 12;
LABEL_18:
    *int v25 = v26;
    return -1;
  }

  u_int v15 = v14;
  memcpy(v14, a2, a3);
  int v33 = a3;
  if (res_9_ns_samename(a4->alg, "HMAC-MD5.SIG-ALG.REG.INT") != 1
    || (char v16 = (void *)res_9_dst_buffer_to_key(a4->name, 0x9Du, 0x4000, 255, (uint64_t)a4->data, a4->len)) == 0LL)
  {
    *__error() = 22;
    free(v13);
    free(v15);
    return -1;
  }

  int v17 = v16;
  v13->int nscount = 1;
  int v32 = 64;
  int v18 = res_9_ns_sign((u_char *)v15, &v33, a3 + 1024, 0, v16, 0LL, 0, v35, &v32, 0LL);
  if (v18 < 0)
  {
    int v23 = v18;
    free(v13);
    free(v15);
    res_9_dst_free_key((uint64_t)v17);
    if (v23 == -1)
    {
      uint64_t v28 = __error();
      int v29 = 22;
    }

    else
    {
      if (v23 != -11) {
        return v23;
      }
      uint64_t v28 = __error();
      int v29 = 40;
    }

    *uint64_t v28 = v29;
    return v23;
  }

  int v19 = v33;
  u_long options = v13->options;
  if (v33 > 512) {
    int v21 = 1;
  }
  else {
    int v21 = (options >> 5) & 1;
  }
  uint64_t v22 = 32LL;
  if (v21) {
    uint64_t v22 = 8LL;
  }
  v13->u_long options = options | v22;
  int v23 = res_9_nsend(v13, (const u_char *)v15, v19, a5, a6);
  if ((v23 & 0x80000000) == 0)
  {
    while (1)
    {
      int v34 = v23;
      int v24 = res_9_ns_verify(a5, &v34, v17, v35, v32, 0LL, 0LL, &v31, v13->options & 0x10000);
      if (v24) {
        break;
      }
      if (v21 || (*(void *)a5 & 0x20000) == 0)
      {
        free(v13);
        free(v15);
        res_9_dst_free_key((uint64_t)v17);
        return v34;
      }

      v13->options &= ~0x20uLL;
      int v23 = res_9_nsend(v13, (const u_char *)v15, v33, a5, v34);
      int v21 = 1;
      if (v23 < 0) {
        goto LABEL_16;
      }
    }

    int v30 = v24;
    free(v13);
    free(v15);
    res_9_dst_free_key((uint64_t)v17);
    int v25 = __error();
    if (v30 == -1) {
      int v26 = 22;
    }
    else {
      int v26 = 25;
    }
    goto LABEL_18;
  }

LABEL_16:
  free(v13);
  free(v15);
  res_9_dst_free_key((uint64_t)v17);
  return v23;
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1895F83F8](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecord( DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, const char *fullname, uint16_t rrtype, uint16_t rrclass, DNSServiceQueryRecordReply callBack, void *context)
{
  return MEMORY[0x1895F8400]( sdRef,  *(void *)&flags,  *(void *)&interfaceIndex,  fullname,  rrtype,  rrclass,  callBack,  context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x1895F8420](sdRef);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1895F8880](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1895F89F8]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1895F8A18]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void abort(void)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895F94C0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895F9608](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

int close(int a1)
{
  return MEMORY[0x1895FA590](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FA5A8](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FA5F0](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t dns_configuration_copy()
{
  return MEMORY[0x1895FAF80]();
}

uint64_t dns_configuration_free()
{
  return MEMORY[0x1895FAF88]();
}

uint64_t dns_configuration_notify_key()
{
  return MEMORY[0x1895FAF90]();
}

void endprotoent(void)
{
}

void endservent(void)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FB290](a1, *(void *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

void free(void *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1895FB590](a1, a2);
}

int getifaddrs(ifaddrs **a1)
{
  return MEMORY[0x1895FB5A0](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1895FB5D8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

int getpeername(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB610](*(void *)&a1, a2, a3);
}

protoent *__cdecl getprotobynumber(int a1)
{
  return (protoent *)MEMORY[0x1895FB648](*(void *)&a1);
}

protoent *getprotoent(void)
{
  return (protoent *)MEMORY[0x1895FB650]();
}

servent *__cdecl getservbyport(int a1, const char *a2)
{
  return (servent *)MEMORY[0x1895FB6C0](*(void *)&a1, a2);
}

servent *getservent(void)
{
  return (servent *)MEMORY[0x1895FB6C8]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FB6D0](*(void *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

tm *__cdecl gmtime(const time_t *a1)
{
  return (tm *)MEMORY[0x1895FB720](a1);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return (char *)MEMORY[0x1895FB7C8](*(void *)&a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x1895FB7D8](a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return MEMORY[0x1895FB820](a1, a2);
}

char *__cdecl inet_nsap_ntoa(int a1, const unsigned __int8 *a2, char *a3)
{
  return (char *)MEMORY[0x1895FB828](*(void *)&a1, a2, a3);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1895FB830](*(void *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FB838](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FB840](*(void *)&a1, a2, a3);
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1895FB8D8](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x1895FB910]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memchr(const void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1895FBE00](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1895FBE08](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1895FC188](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1895FC190](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1895FC198](*(void *)&token, state64);
}

uint64_t notify_monitor_file()
{
  return MEMORY[0x1895FC1A8]();
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1895FC1B8](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x1895FC1D8]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FC278](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1895FC890](a1);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1895FCA40](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCA98](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1895FCAA8](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1895FCB20]();
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x1895FCB80](*(void *)&a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FCB98](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1895FCC40](a1);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC70](__ptr, __size);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x1895FCCB8](*(void *)&a1, a2, *(void *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x1895FCE10](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return MEMORY[0x1895FCE48](*(void *)&a1, a2, a3, *(void *)&a4, a5, *(void *)&a6);
}

void setbuf(FILE *a1, char *a2)
{
}

void setprotoent(int a1)
{
}

void setservent(int a1)
{
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1895FCEC8](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

uint64_t si_async_call()
{
  return MEMORY[0x1895FCF00]();
}

uint64_t si_async_cancel()
{
  return MEMORY[0x1895FCF08]();
}

uint64_t si_async_handle_reply()
{
  return MEMORY[0x1895FCF10]();
}

uint64_t si_item_release()
{
  return MEMORY[0x1895FCF18]();
}

uint64_t si_module_release()
{
  return MEMORY[0x1895FCF20]();
}

uint64_t si_module_with_name()
{
  return MEMORY[0x1895FCF28]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1895FCF88](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1895FCFA0](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FCFB0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1895FD030](a1, a2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD048](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FD050](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FD068](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD070](__s, __charset);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FD078](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FD0D0](a1, a2, a3);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FD0E8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F0](__dst, __src, __n);
}

char *__cdecl strpbrk(const char *__s, const char *__charset)
{
  return (char *)MEMORY[0x1895FD110](__s, __charset);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1B8](__str, __endptr, *(void *)&__base);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FD528](a1, a2, a3);
}