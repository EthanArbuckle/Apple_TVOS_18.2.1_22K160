void herror(const char *a1)
{
  const char **v1;
  const char *v2;
  size_t v3;
  void *v4;
  void v5[4];
  void v6[5];
  v6[4] = *MEMORY[0x1895FEE08];
  if (a1)
  {
    v1 = (const char **)v5;
    if (*a1)
    {
      v5[0] = a1;
      v5[1] = strlen(a1);
      v5[2] = ": ";
      v5[3] = 2LL;
      v1 = (const char **)v6;
    }
  }

  else
  {
    v1 = (const char **)v5;
  }

  if (h_errno < 0)
  {
    v2 = "Resolver internal error";
  }

  else if (h_errno > 4)
  {
    v2 = "Unknown resolver error";
  }

  else
  {
    v2 = h_errlist[h_errno];
  }

  *v1 = v2;
  v3 = strlen(v2);
  v1[2] = "\n";
  v4 = v1 + 2;
  *(v4 - 1) = v3;
  v4[1] = 1LL;
  writev_NOCANCEL();
}

const char *__cdecl hstrerror(int a1)
{
  if (a1 < 0) {
    return "Resolver internal error";
  }
  return h_errlist[a1];
}

uint64_t dn_expand(uint64_t a1, unint64_t a2, _BYTE *a3, _BYTE *a4, int a5)
{
  v5 = a3 + 1;
  unsigned int v6 = *a3;
  if (*a3)
  {
    int v7 = 0;
    int v8 = -1;
    v9 = a4;
    unint64_t v10 = (unint64_t)&a4[a5];
    while (1)
    {
      if ((v6 & 0xC0) == 0xC0)
      {
        v16 = (unsigned __int8 *)(a1 + (*v5 | ((v6 & 0x3F) << 8)));
        int v17 = (_DWORD)v5 - (_DWORD)a3;
        if (v8 < 0) {
          int v8 = v17 + 1;
        }
        v7 += 2;
        v5 = v16;
      }

      else
      {
        if ((v6 & 0xC0) != 0) {
          return 0xFFFFFFFFLL;
        }
        v11 = a4;
        if (v9 != a4)
        {
          _BYTE *v9 = 46;
          v11 = v9 + 1;
        }

        uint64_t v12 = v6;
        v7 += v6 + 1;
        while (v12-- >= 1)
        {
          int v15 = *v5++;
          char v14 = v15;
          if (v15 == 46)
          {
            *v11++ = 92;
          }

          *v11++ = v14;
        }

        v9 = v11;
      }

      unsigned int v18 = *v5++;
      unsigned int v6 = v18;
      if (!v18) {
        goto LABEL_25;
      }
    }
  }

  int v8 = -1;
  v9 = a4;
LABEL_25:
  _BYTE *v9 = 0;
  unsigned int v19 = *a4;
  if (*a4)
  {
    v20 = a4 + 1;
    while ((v19 & 0x80) != 0 || (*(_DWORD *)(MEMORY[0x1895FED88] + 4LL * v19 + 60) & 0x4000) == 0)
    {
      unsigned int v21 = *v20++;
      unsigned int v19 = v21;
      if (!v21) {
        goto LABEL_30;
      }
    }

    return 0xFFFFFFFFLL;
  }

  else
  {
LABEL_30:
    unsigned int v22 = (_DWORD)v5 - (_DWORD)a3;
    if (v8 >= 0) {
      return v8;
    }
    else {
      return v22;
    }
  }
}

uint64_t __dn_skipname(_BYTE *a1, unint64_t a2)
{
  v2 = a1;
  if ((unint64_t)a1 >= a2)
  {
LABEL_10:
    else {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    v2 = a1;
    while (1)
    {
      v3 = v2 + 1;
      uint64_t v4 = *v2;
      if (!*v2)
      {
        ++v2;
        goto LABEL_10;
      }

      if ((v4 & 0xC0) != 0) {
        break;
      }
      v2 = &v3[v4];
    }

    if ((v4 & 0xC0) == 0xC0)
    {
      v2 += 2;
      goto LABEL_10;
    }

    return 0xFFFFFFFFLL;
  }

uint64_t _getshort(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t _getlong(unsigned int *a1)
{
  return bswap32(*a1);
}

uint64_t res_init()
{
  return 0LL;
}

uint64_t res_query(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  return _mdns_query(35LL, a1, a2, a3, a4, a5);
}

uint64_t _mdns_query(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  LODWORD(v6) = a6;
  int v8 = si_module_with_name("mdns");
  if (v8)
  {
    uint64_t v9 = (uint64_t)v8;
    uint64_t v10 = (*(uint64_t (**)(void))(v8[5] + 320LL))();
    if (v10)
    {
      v11 = (unsigned int *)v10;
      uint64_t v12 = *(unsigned int *)(v10 + 32);
      if (((v12 | v6) & 0x80000000) != 0)
      {
        h_errno = 3;
        si_item_release((unsigned int *)v10);
        goto LABEL_15;
      }

      else {
        size_t v6 = v12;
      }
      memcpy(a5, *(const void **)(v10 + 40), v6);
      si_item_release(v11);
      unsigned int v13 = BYTE3(*a5) & 0xF;
      if (!v13)
      {
        if ((*a5 & 0xFFFF000000000000LL) != 0) {
          goto LABEL_16;
        }
        int v14 = 4;
        goto LABEL_12;
      }

      if (v13 == 2)
      {
        int v14 = 2;
        goto LABEL_12;
      }

      if (v13 != 3)
      {
        int v14 = 3;
        goto LABEL_12;
      }
    }

    int v14 = 1;
LABEL_12:
    h_errno = v14;
LABEL_15:
    uint64_t v12 = 0xFFFFFFFFLL;
LABEL_16:
    si_module_release(v9);
    return v12;
  }

  h_errno = 3;
  return 0xFFFFFFFFLL;
}

uint64_t res_search(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5)
{
  return _mdns_query(36LL, a1, a2, a3, a4, a5);
}

int getifaddrs(ifaddrs **a1)
{
  uint64_t v65 = *MEMORY[0x1895FEE08];
  *(_OWORD *)v63 = xmmword_1804DCA60;
  uint64_t v64 = 3LL;
  if ((sysctl(v63, 6u, 0LL, &v62, 0LL, 0LL) & 0x80000000) == 0)
  {
    size_t v2 = v62;
    if (v62 <= 0x800) {
      size_t v2 = 2048LL;
    }
    unint64_t v3 = 2 * v2;
    if (v3 >= 0x1000000) {
      size_t v4 = 0x1000000LL;
    }
    else {
      size_t v4 = v3;
    }
    size_t v62 = v4;
    while (1)
    {
      v5 = (unsigned __int16 *)malloc(v4);
      if (!v5) {
        return -1;
      }
      size_t v6 = (ifaddrs *)v5;
      if ((sysctl(v63, 6u, v5, &v62, 0LL, 0LL) & 0x80000000) == 0) {
        break;
      }
      free(v6);
      size_t v4 = 2 * v62;
      size_t v62 = v4;
      if (v4 >= 0x1000001)
      {
        *__error() = 55;
        return -1;
      }
    }

    int64_t v8 = v62;
    if ((uint64_t)v62 < 1)
    {
      int v11 = 0;
      int v10 = 0;
      int v12 = 1;
    }

    else
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 1;
      unsigned int v13 = v6;
      do
      {
        if (BYTE2(v13->ifa_next) == 5)
        {
          int v14 = BYTE3(v13->ifa_next);
          if (v14 == 12)
          {
            if (v9)
            {
              if (WORD2(v13->ifa_name) != v9) {
LABEL_111:
              }
                abort();
              unsigned int v15 = HIDWORD(v13->ifa_next) & 0xA4;
              if (v15)
              {
                int v16 = 0;
                int v17 = &v13->ifa_flags + 1;
                ++v12;
                unsigned int v18 = &v13->ifa_flags + 1;
                do
                {
                  if (((v15 >> v16) & 1) != 0)
                  {
                    if (*v18) {
                      uint64_t v19 = (*v18 + 3) & 0x1FC;
                    }
                    else {
                      uint64_t v19 = 4LL;
                    }
                    if (v16 == 5) {
                      goto LABEL_32;
                    }
                    v18 += v19;
                  }

                  ++v16;
                }

                while (v16 != 8);
                LODWORD(v19) = 0;
LABEL_32:
                for (int i = 0; i != 8; ++i)
                {
                  if (((v15 >> i) & 1) != 0)
                  {
                    int v21 = *v17;
                    int v22 = ((_WORD)v21 + 3) & 0x1FC;
                    if (i == 2) {
                      int v23 = v19;
                    }
                    else {
                      int v23 = 4;
                    }
                    BOOL v24 = v21 == 0;
                    if (*v17) {
                      uint64_t v25 = ((_WORD)v21 + 3) & 0x1FC;
                    }
                    else {
                      uint64_t v25 = 4LL;
                    }
                    if (v24) {
                      int v22 = v23;
                    }
                    v10 += v22;
                    v17 += v25;
                  }
                }
              }
            }
          }

          else if (v14 == 14)
          {
            if ((BYTE4(v13->ifa_next) & 0x10) != 0)
            {
              int v9 = WORD2(v13->ifa_name);
              ++v12;
              if (LOBYTE(v13[2].ifa_next)) {
                int v26 = ((LOBYTE(v13[2].ifa_next) + 3) & 0x1FC) + 7;
              }
              else {
                int v26 = 11;
              }
              v10 += v26 + 96;
              v11 += BYTE5(v13[2].ifa_next) + 1;
            }

            else
            {
              int v9 = 0;
            }
          }
        }

        unsigned int v13 = (ifaddrs *)((char *)v13 + LOWORD(v13->ifa_next));
      }

      while (v13 < (ifaddrs *)((char *)v6 + v62));
    }

    if (v10 + v11 + v12 == 1)
    {
      *a1 = 0LL;
      v27 = v6;
      goto LABEL_99;
    }

    v58 = a1;
    uint64_t v28 = v10;
    v29 = (ifaddrs *)malloc(v10 + (uint64_t)v11 + 56LL * v12);
    if (v29)
    {
      v30 = v29;
      size_t v31 = v12;
      bzero(v29, v31 * 56);
      v32 = v30;
      if (v8 >= 1)
      {
        int v33 = 0;
        v34 = 0LL;
        v35 = (sockaddr *)&v30[v31];
        v36 = (char *)&v30[v31] + v28;
        v37 = v6;
        v32 = v30;
        do
        {
          if (BYTE2(v37->ifa_next) == 5)
          {
            int v38 = BYTE3(v37->ifa_next);
            if (v38 == 12)
            {
              if (v33)
              {
                if (WORD2(v37->ifa_name) != v33) {
                  goto LABEL_111;
                }
                unsigned int v39 = HIDWORD(v37->ifa_next) & 0xA4;
                if (v39)
                {
                  int v60 = v33;
                  int v40 = 0;
                  v32->ifa_name = v34->ifa_name;
                  v59 = v34;
                  v32->ifa_flags = v34->ifa_flags;
                  v32->ifa_data = 0LL;
                  v41 = &v37->ifa_flags + 1;
                  v42 = &v37->ifa_flags + 1;
                  v61 = v36;
                  do
                  {
                    if (((v39 >> v40) & 1) != 0)
                    {
                      if (*v42) {
                        size_t v43 = (*v42 + 3) & 0x1FC;
                      }
                      else {
                        size_t v43 = 4LL;
                      }
                      if (v40 == 5) {
                        goto LABEL_74;
                      }
                      v42 += v43;
                    }

                    ++v40;
                  }

                  while (v40 != 8);
                  size_t v43 = 0LL;
LABEL_74:
                  int v44 = 0;
                  while (2)
                  {
                    if (((1 << v44) & 0xA4 & HIDWORD(v37->ifa_next)) != 0)
                    {
                      int v45 = *v41;
                      __int16 v46 = v45 + 3;
                      uint64_t v47 = ((_WORD)v45 + 3) & 0x1FC;
                      if (*v41) {
                        size_t v48 = v46 & 0x1FC;
                      }
                      else {
                        size_t v48 = 4LL;
                      }
                      switch(v44)
                      {
                        case 2:
                          v32->ifa_netmask = v35;
                          if (v45)
                          {
                            memcpy(v35, v41, v46 & 0x1FC);
                            v35 = (sockaddr *)((char *)v35 + v47);
                          }

                          else
                          {
                            bzero(v35, v43);
                            v35 = (sockaddr *)((char *)v35 + v43);
                          }

                          break;
                        case 7:
                          v32->ifa_dstaddr = v35;
LABEL_86:
                          memcpy(v35, v41, v48);
                          v35 = (sockaddr *)((char *)v35 + v48);
                          break;
                        case 5:
                          v32->ifa_addr = v35;
                          goto LABEL_86;
                      }

                      v41 += v48;
                    }

                    if (++v44 == 8)
                    {
                      v36 = v61;
                      int v33 = v60;
                      v34 = v59;
                      goto LABEL_95;
                    }

                    continue;
                  }
                }
              }
            }

            else if (v38 == 14)
            {
              if ((BYTE4(v37->ifa_next) & 0x10) != 0)
              {
                int v33 = WORD2(v37->ifa_name);
                v32->ifa_name = v36;
                v32->ifa_flags = v37->ifa_name;
                memcpy(v36, &v37[2].ifa_name, BYTE5(v37[2].ifa_next));
                v36[BYTE5(v37[2].ifa_next)] = 0;
                v36 += BYTE5(v37[2].ifa_next) + 1;
                v32->ifa_addr = v35;
                memcpy(v35, &v37[2], LOBYTE(v37[2].ifa_next));
                if (LOBYTE(v37[2].ifa_next)) {
                  uint64_t v49 = (LOBYTE(v37[2].ifa_next) + 3) & 0x1FC;
                }
                else {
                  uint64_t v49 = 4LL;
                }
                v50 = (char *)((unint64_t)&v35->sa_data[v49 + 5] & 0xFFFFFFFFFFFFFFF8LL);
                v32->ifa_data = v50;
                __int128 v51 = *(_OWORD *)&v37->ifa_data;
                __int128 v52 = *(_OWORD *)&v37[1].ifa_name;
                __int128 v53 = *(_OWORD *)&v37[1].ifa_dstaddr;
                *((_OWORD *)v50 + 4) = *(_OWORD *)&v37[1].ifa_addr;
                *((_OWORD *)v50 + 5) = v53;
                *((_OWORD *)v50 + 2) = v51;
                *((_OWORD *)v50 + 3) = v52;
                __int128 v54 = *(_OWORD *)&v37->ifa_netmask;
                *(_OWORD *)v50 = *(_OWORD *)&v37->ifa_flags;
                *((_OWORD *)v50 + 1) = v54;
                v35 = (sockaddr *)(v50 + 96);
                v34 = v32;
LABEL_95:
                v32->ifa_next = v32 + 1;
                ++v32;
              }

              else
              {
                int v33 = 0;
              }
            }
          }

          v37 = (ifaddrs *)((char *)v37 + LOWORD(v37->ifa_next));
        }

        while (v37 < (ifaddrs *)((char *)v6 + v62));
      }

      free(v6);
      if (&v32[-1] >= v30)
      {
        v32[-1].ifa_next = 0LL;
        *v58 = v30;
        do
        {
          ifa_addr = v30->ifa_addr;
          if (ifa_addr->sa_family == 30 && ifa_addr->sa_data[6] == 254)
          {
            unsigned int v56 = ifa_addr->sa_data[7];
            if ((v56 & 0xC0) == 0x80 || v56 >= 0xC0)
            {
              unsigned int v57 = *(unsigned __int16 *)&ifa_addr->sa_data[8];
              *(_WORD *)&ifa_addr->sa_data[8] = 0;
              if (!*(_DWORD *)&ifa_addr[1].sa_data[6]) {
                *(_DWORD *)&ifa_addr[1].sa_data[6] = __rev16(v57);
              }
            }
          }

          v30 = v30->ifa_next;
        }

        while (v30);
        return 0;
      }

      *v58 = 0LL;
      v27 = v30;
LABEL_99:
      free(v27);
      return 0;
    }

    free(v6);
  }

  return -1;
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  if (getifaddrs(&v9) < 0) {
    return 0LL;
  }
  size_t v4 = v9;
  if (v9)
  {
    v5 = v9;
    while (1)
    {
      ifa_addr = v5->ifa_addr;
      if (ifa_addr)
      {
      }

      v5 = v5->ifa_next;
      if (!v5) {
        goto LABEL_8;
      }
    }

    strncpy(a2, v5->ifa_name, 0x10uLL);
    int v7 = 0;
    size_t v4 = v9;
  }

  else
  {
LABEL_8:
    a2 = 0LL;
    int v7 = 6;
  }

  freeifaddrs(v4);
  *__error() = v7;
  return a2;
}

if_nameindex *if_nameindex(void)
{
  if ((getifaddrs(&v16) & 0x80000000) == 0)
  {
    v0 = v16;
    if (v16)
    {
      uint64_t v1 = 0LL;
      LODWORD(v2) = 0;
      unint64_t v3 = v16;
      while (1)
      {
        ifa_addr = v3->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18)
          {
            size_t v5 = strlen(v3->ifa_name);
            BOOL v6 = __CFADD__(v1, v5 + 1);
            v1 += v5 + 1;
            if (v6) {
              break;
            }
            uint64_t v2 = v2 + 1LL;
            uint64_t v7 = v2 << 31 >> 31;
            if (v7 != v2 || v7 < 0) {
              break;
            }
          }
        }

        unint64_t v3 = v3->ifa_next;
        if (!v3) {
          goto LABEL_13;
        }
      }
    }

    else
    {
      LODWORD(v2) = 0;
      uint64_t v1 = 0LL;
LABEL_13:
      uint64_t v9 = 16LL * v2 + 16;
      if (!__CFADD__(v9, v1))
      {
        int v10 = (if_nameindex *)malloc(v9 + v1);
        int64_t v8 = v10;
        if (v10)
        {
          int v11 = v10;
          if (v0)
          {
            int v12 = (char *)&v10[(v2 + 1)];
            int v11 = v10;
            do
            {
              unsigned int v13 = v0->ifa_addr;
              if (v13 && v13->sa_family == 18)
              {
                v11->if_index = *(unsigned __int16 *)v13->sa_data;
                v11->if_name = v12;
                int v14 = strcpy(v12, v0->ifa_name);
                ++v11;
                v12 += strlen(v14) + 1;
              }

              v0 = v0->ifa_next;
            }

            while (v0);
          }

          v11->if_index = 0;
          v11->if_name = 0LL;
        }

        goto LABEL_24;
      }
    }

    int64_t v8 = 0LL;
    *__error() = 84;
LABEL_24:
    freeifaddrs(v16);
    return v8;
  }

  return 0LL;
}

unsigned int if_nametoindex(const char *a1)
{
  if (getifaddrs(&v7) < 0) {
    return 0;
  }
  uint64_t v2 = v7;
  if (!v7)
  {
LABEL_8:
    freeifaddrs(v2);
LABEL_9:
    unsigned int v5 = 0;
    *__error() = 6;
    return v5;
  }

  unint64_t v3 = v7;
  while (1)
  {
    ifa_addr = v3->ifa_addr;
    if (ifa_addr)
    {
      if (ifa_addr->sa_family == 18 && !strcmp(v3->ifa_name, a1)) {
        break;
      }
    }

    unint64_t v3 = v3->ifa_next;
    if (!v3) {
      goto LABEL_8;
    }
  }

  unsigned int v5 = *(unsigned __int16 *)ifa_addr->sa_data;
  freeifaddrs(v2);
  if (!v5) {
    goto LABEL_9;
  }
  return v5;
}

int inet6_option_space(int a1)
{
  return ((a1 + 9) & 0xFFFFFFF8) + 12;
}

int inet6_option_init(void *a1, cmsghdr **a2, int a3)
{
  int result = 0;
  *((_DWORD *)a1 + 2) = a3;
  *(void *)a1 = 0x290000000CLL;
  *a2 = (cmsghdr *)a1;
  return result;
}

int inet6_option_append(cmsghdr *a1, const __uint8_t *a2, int a3, int a4)
{
  int result = -1;
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0 && a4 <= 7)
  {
    int v8 = (_DWORD)a1 + 12;
    uint64_t cmsg_len = a1->cmsg_len;
    uint64_t v9 = (char *)a1 + cmsg_len;
    if ((_DWORD)cmsg_len == 12)
    {
      v9 += 2;
      a1->uint64_t cmsg_len = 14;
    }

    int v10 = (a4 - ((int)v9 - v8) % a3 + ((a3 + ((int)v9 - v8) % a3 - 1) & -a3)) % a3;
    inet6_insert_padopt(v9, v10);
    a1->cmsg_len += v10;
    int v11 = &v9[v10];
    if (*a2) {
      unsigned int v12 = a2[1] + 2;
    }
    else {
      unsigned int v12 = 1;
    }
    memcpy(v11, a2, v12);
    unsigned int v13 = &v11[v12];
    a1->cmsg_len += v12;
    int v14 = (((_DWORD)v13 - v8 + 7) & 0xFFFFFFF8) - ((_DWORD)v13 - v8);
    inet6_insert_padopt(v13, v14);
    int result = 0;
    a1->cmsg_len += v14;
    BYTE1(a1[1].cmsg_len) = (((_DWORD)v13 + v14 - v8) >> 3) - 1;
  }

  return result;
}

void inet6_insert_padopt(_BYTE *a1, int a2)
{
  if (a2)
  {
    if (a2 == 1)
    {
      *a1 = 0;
    }

    else
    {
      *a1 = 1;
      a1[1] = a2 - 2;
      bzero(a1 + 2, a2 - 2);
    }
  }

__uint8_t *__cdecl inet6_option_alloc(cmsghdr *a1, int a2, int a3, int a4)
{
  size_t v4 = 0LL;
  if (a3 <= 8 && ((1 << a3) & 0x116) != 0)
  {
    if (a4 <= 7)
    {
      int v8 = (_DWORD)a1 + 12;
      uint64_t cmsg_len = a1->cmsg_len;
      uint64_t v9 = (char *)a1 + cmsg_len;
      if ((_DWORD)cmsg_len == 12)
      {
        v9 += 2;
        a1->uint64_t cmsg_len = 14;
      }

      int v10 = (a4 - ((int)v9 - v8) % a3 + ((a3 + ((int)v9 - v8) % a3 - 1) & -a3)) % a3;
      inet6_insert_padopt(v9, v10);
      size_t v4 = &v9[v10];
      int v11 = &v4[a2];
      a1->cmsg_len += v10 + a2;
      int v12 = (((_DWORD)v11 - v8 + 7) & 0xFFFFFFF8) - ((_DWORD)v11 - v8);
      inet6_insert_padopt(v11, v12);
      a1->cmsg_len += v12;
      BYTE1(a1[1].cmsg_len) = (((_DWORD)v11 + v12 - v8) >> 3) - 1;
    }

    else
    {
      return 0LL;
    }
  }

  return v4;
}

int inet6_option_next(const cmsghdr *a1, __uint8_t **a2)
{
  if (a1->cmsg_level != 41) {
    return -1;
  }
  unint64_t cmsg_len = a1->cmsg_len;
  uint64_t v3 = 8LL * BYTE1(a1[1].cmsg_len);
  size_t v4 = (__uint8_t *)&a1[1].cmsg_type + v3;
  unsigned int v5 = *a2;
  if (*a2)
  {
    if (*v5)
    {
      if (v5 + 2 > v4) {
        return -1;
      }
      uint64_t v6 = v5[1] + 2LL;
    }

    else
    {
      uint64_t v6 = 1LL;
    }

    uint64_t v7 = &v5[v6];
    if (v7 > v4) {
      return -1;
    }
  }

  else
  {
    uint64_t v7 = (__uint8_t *)&a1[1].cmsg_len + 2;
  }

  *a2 = v7;
  if (v7 >= v4)
  {
    *a2 = 0LL;
    return -1;
  }

  if (*v7)
  {
    if (v7 + 2 <= v4)
    {
      uint64_t v8 = v7[1] + 2LL;
      goto LABEL_19;
    }

    return -1;
  }

  uint64_t v8 = 1LL;
LABEL_19:
  if (&v7[v8] <= v4) {
    return 0;
  }
  else {
    return -1;
  }
}

int inet6_option_find(const cmsghdr *a1, __uint8_t **a2, int a3)
{
  if (a1->cmsg_level != 41) {
    return -1;
  }
  unint64_t cmsg_len = a1->cmsg_len;
  uint64_t v4 = 8LL * BYTE1(a1[1].cmsg_len);
  uint64_t v6 = (__uint8_t *)&a1[1].cmsg_type + v4;
  uint64_t v7 = *a2;
  if (!*a2)
  {
    uint64_t v9 = (__uint8_t *)&a1[1].cmsg_len + 2;
    goto LABEL_13;
  }

  if (*v7)
  {
    if (v7 + 2 > v6) {
      return -1;
    }
    uint64_t v8 = v7[1] + 2LL;
  }

  else
  {
    uint64_t v8 = 1LL;
  }

  uint64_t v9 = &v7[v8];
  if (v9 > v6) {
    return -1;
  }
LABEL_13:
  *a2 = v9;
  while (1)
  {
    if (v9 >= v6)
    {
      uint64_t v9 = 0LL;
      int result = -1;
      goto LABEL_24;
    }

    if (*v9 == a3) {
      break;
    }
    if (*v9)
    {
      if (v9 + 2 > v6) {
        return -1;
      }
      uint64_t v10 = v9[1] + 2LL;
    }

    else
    {
      uint64_t v10 = 1LL;
    }

    v9 += v10;
    if (v9 > v6) {
      return -1;
    }
  }

  int result = 0;
LABEL_24:
  *a2 = v9;
  return result;
}

int inet6_opt_init(void *a1, socklen_t a2)
{
  int result = -1;
  if (a2 && (a2 & 7) == 0)
  {
    if (a1) {
      *((_BYTE *)a1 + 1) = (a2 >> 3) - 1;
    }
    return 2;
  }

  return result;
}

int inet6_opt_append(void *a1, socklen_t a2, int a3, __uint8_t a4, socklen_t a5, __uint8_t a6, void **a7)
{
  socklen_t v7 = -1;
  if (a4 >= 2u)
  {
    char v8 = a5;
    if (a5 <= 0xFF && a6 <= 8u && ((1 << a6) & 0x116) != 0 && a6 <= a5)
    {
      signed int v11 = a3 + a5 + 2;
      if (v11 % a6) {
        int v12 = a6 - v11 % a6;
      }
      else {
        int v12 = 0;
      }
      socklen_t v7 = v12 + v11;
      if (a2 && v7 > a2)
      {
        return -1;
      }

      else if (a1)
      {
        unsigned int v13 = (__uint8_t *)a1 + a3;
        if (v12 == 1)
        {
          *v13++ = 0;
        }

        else if (v12 >= 1)
        {
          *unsigned int v13 = 1;
          int v14 = v12 - 2;
          unsigned int v15 = (char *)(v13 + 2);
          v13[1] = v12 - 2;
          bzero(v13 + 2, v12 - 2);
          unsigned int v13 = (__uint8_t *)&v15[v14];
        }

        *unsigned int v13 = a4;
        v13[1] = v8;
        *a7 = v13 + 2;
      }
    }
  }

  return v7;
}

int inet6_opt_finish(void *a1, socklen_t a2, int a3)
{
  if (a3 > 0) {
    socklen_t v3 = ((a3 - 1) | 7) + 1;
  }
  else {
    socklen_t v3 = 0;
  }
  if (a1)
  {
    if (v3 <= a2)
    {
      int v4 = v3 - a3;
      unsigned int v5 = (char *)a1 + a3;
      if (v3 - a3 == 1)
      {
        char *v5 = 0;
      }

      else if (v4 >= 1)
      {
        char *v5 = 1;
        v5[1] = v4 - 2;
        bzero(v5 + 2, (v4 - 2));
      }
    }

    else
    {
      return -1;
    }
  }

  return v3;
}

int inet6_opt_set_val(void *a1, int a2, void *a3, socklen_t a4)
{
  return a4 + a2;
}

int inet6_opt_next(void *a1, socklen_t a2, int a3, __uint8_t *a4, socklen_t *a5, void **a6)
{
  int v6 = -1;
  if (a2 && (a2 & 7) == 0)
  {
    socklen_t v7 = (char *)a1 + a2;
    char v8 = (char *)a1 + 2;
    if (a3) {
      char v8 = (char *)a1 + a3;
    }
    while (1)
    {
      while (1)
      {
        if (v8 >= v7) {
          goto LABEL_14;
        }
        int v9 = *v8;
        if (v9 != 1) {
          break;
        }
        if (v8 + 2 <= v7)
        {
          v8 += v8[1] + 2;
          if (v8 <= v7) {
            continue;
          }
        }

        goto LABEL_14;
      }

      if (*v8) {
        break;
      }
      ++v8;
    }

    uint64_t v10 = v8 + 2;
    if (v8 + 2 > v7 || (v11 = v8[1], unint64_t v12 = (unint64_t)&v8[v11 + 2], v12 > (unint64_t)v7))
    {
LABEL_14:
      *a6 = 0LL;
      return -1;
    }

    *a4 = v9;
    *a5 = v11;
    int v6 = v12 - (_DWORD)a1;
    *a6 = v10;
  }

  return v6;
}

int inet6_opt_find(void *a1, socklen_t a2, int a3, __uint8_t a4, socklen_t *a5, void **a6)
{
  int v6 = -1;
  if (a2 && (a2 & 7) == 0)
  {
    socklen_t v7 = (char *)a1 + a2;
    char v8 = (char *)a1 + 2;
    if (a3) {
      char v8 = (char *)a1 + a3;
    }
    if (v8 < v7)
    {
      do
      {
        if (*v8)
        {
          if (v8 + 2 > v7) {
            break;
          }
          unsigned int v9 = v8[1] + 2;
        }

        else
        {
          unsigned int v9 = 1;
        }

        uint64_t v10 = &v8[v9];
        if (v10 > v7) {
          break;
        }
        if (*v8 == a4)
        {
          *a5 = v9 - 2;
          *a6 = v8 + 2;
          return (_DWORD)v10 - (_DWORD)a1;
        }

        v8 += v9;
      }

      while (v10 < v7);
    }

    *a6 = 0LL;
    return -1;
  }

  return v6;
}

int inet6_opt_get_val(void *a1, int a2, void *a3, socklen_t a4)
{
  return a4 + a2;
}

size_t inet6_rthdr_space(int a1, int a2)
{
  else {
    return 0LL;
  }
}

cmsghdr *__cdecl inet6_rthdr_init(cmsghdr *result, int a2)
{
  *(void *)&result->cmsg_level = 0x1800000029LL;
  if (a2) {
    return 0LL;
  }
  result->unint64_t cmsg_len = 20;
  *(void *)&result[1].unint64_t cmsg_len = 0LL;
  BYTE2(result[1].cmsg_len) = 0;
  return result;
}

int inet6_rthdr_add(cmsghdr *a1, const in6_addr *a2, unsigned int a3)
{
  int result = -1;
  if (a3 <= 1 && !BYTE2(a1[1].cmsg_len) && !a3)
  {
    int cmsg_len_high = HIBYTE(a1[1].cmsg_len);
    if (cmsg_len_high != 23)
    {
      int result = 0;
      HIBYTE(a1[1].cmsg_len) = cmsg_len_high + 1;
      uint64_t v6 = BYTE1(a1[1].cmsg_len);
      *(in6_addr *)(&a1[1].cmsg_type + 2 * v6) = *a2;
      LOBYTE(v6) = v6 + 2;
      BYTE1(a1[1].cmsg_len) = v6;
      a1->unint64_t cmsg_len = 8 * v6 + 20;
    }
  }

  return result;
}

int inet6_rthdr_lasthop(cmsghdr *a1, unsigned int a2)
{
  if (BYTE2(a1[1].cmsg_len)) {
    return -1;
  }
  if (a2) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = HIBYTE(a1[1].cmsg_len) > 0x17u;
  }
  int v4 = v3;
  return v4 << 31 >> 31;
}

int inet6_rthdr_segments(const cmsghdr *a1)
{
  if (BYTE2(a1[1].cmsg_len)) {
    return -1;
  }
  unsigned int v2 = BYTE1(a1[1].cmsg_len);
  char v3 = (v2 > 0x2E) | v2;
  int v4 = v2 >> 1;
  if ((v3 & 1) != 0) {
    return -1;
  }
  else {
    return v4;
  }
}

in6_addr *__cdecl inet6_rthdr_getaddr(cmsghdr *a1, int a2)
{
  if (BYTE2(a1[1].cmsg_len)) {
    return 0LL;
  }
  unsigned int v2 = BYTE1(a1[1].cmsg_len);
  if (v2 > 0x2E || (v2 & 1) != 0) {
    return 0LL;
  }
  BOOL v5 = (int)(v2 >> 1) < a2;
  uint64_t v6 = (in6_addr *)(&a1[1].cmsg_type + 4 * a2);
  if (v5) {
    uint64_t v6 = 0LL;
  }
  if (a2 >= 1) {
    return v6;
  }
  else {
    return 0LL;
  }
}

int inet6_rthdr_getflags(const cmsghdr *a1, int a2)
{
  if (BYTE2(a1[1].cmsg_len)) {
    return -1;
  }
  unsigned int v3 = BYTE1(a1[1].cmsg_len);
  if (a2 <= v3 >> 1) {
    int v4 = 0;
  }
  else {
    int v4 = -1;
  }
  if (v3 <= 0x2E && (v3 & 1) == 0) {
    return v4;
  }
  else {
    return -1;
  }
}

socklen_t inet6_rth_space(int a1, int a2)
{
  else {
    return 0;
  }
}

void *__cdecl inet6_rth_init(void *a1, socklen_t a2, int a3, int a4)
{
  if (a3) {
    return 0LL;
  }
  char v5 = a4;
  int result = 0LL;
  if (a4 <= 0x7F && ((16 * a4) | 8u) <= a2)
  {
    bzero(a1, a2);
    *((_BYTE *)a1 + 1) = 2 * v5;
    *((_WORD *)a1 + 1) = 0;
    *((_DWORD *)a1 + 1) = 0;
    return a1;
  }

  return result;
}

int inet6_rth_add(void *a1, const in6_addr *a2)
{
  if (*((_BYTE *)a1 + 2)) {
    return -1;
  }
  uint64_t v3 = *((unsigned __int8 *)a1 + 3);
  int result = 0;
  *(in6_addr *)((char *)a1 + 16 * v3 + 8) = *a2;
  *((_BYTE *)a1 + 3) = v3 + 1;
  return result;
}

int inet6_rth_reverse(const void *a1, void *a2)
{
  if (*((_BYTE *)a1 + 2)) {
    return -1;
  }
  unint64_t v3 = *((unsigned __int8 *)a1 + 1);
  if ((v3 & 1) != 0) {
    return -1;
  }
  memmove(a2, a1, 8 * v3 + 8);
  *((_BYTE *)a2 + 3) = v3 >> 1;
  if (v3 >= 4)
  {
    LODWORD(v4) = v3 >> 2;
    char v5 = (__int128 *)((char *)a2 + 8);
    else {
      uint64_t v4 = v4;
    }
    uint64_t v6 = (__int128 *)((char *)a2 + 16 * (v3 >> 1) - 8);
    do
    {
      __int128 v7 = *v5;
      *v5++ = *v6;
      *v6-- = v7;
      --v4;
    }

    while (v4);
  }

  return 0;
}

int inet6_rth_segments(const void *a1)
{
  if (*((_BYTE *)a1 + 2)) {
    return -1;
  }
  unsigned int v1 = *((unsigned __int8 *)a1 + 1);
  if ((v1 & 1) != 0) {
    return -1;
  }
  unsigned int v2 = v1 >> 1;
  else {
    return v2;
  }
}

in6_addr *__cdecl inet6_rth_getaddr(const void *a1, int a2)
{
  if (*((_BYTE *)a1 + 2)) {
    return 0LL;
  }
  unsigned int v2 = *((unsigned __int8 *)a1 + 1);
  if ((v2 & 1) != 0) {
    return 0LL;
  }
  unsigned int v3 = v2 >> 1;
  else {
    return 0LL;
  }
}

uint64_t si_module_static_cache()
{
  return si_module_cache_byname((uint64_t)&si_module_static_cache_si, &si_module_static_cache_once, (uint64_t)"cache");
}

uint64_t si_module_cache_byname(uint64_t a1, dispatch_once_t *predicate, uint64_t a3)
{
  v5[0] = MEMORY[0x1895FED80];
  v5[1] = 0x40000000LL;
  v5[2] = __si_module_cache_byname_block_invoke;
  v5[3] = &__block_descriptor_tmp;
  v5[4] = a1;
  v5[5] = a3;
  if (*predicate != -1) {
    dispatch_once(predicate, v5);
  }
  return a1;
}

uint64_t si_module_static_cache_file()
{
  return si_module_cache_byname( (uint64_t)&si_module_static_cache_file_si,  &si_module_static_cache_file_once,  (uint64_t)"cache_file");
}

const char *si_cache_add_item(const char *result, const char **a2, uint64_t a3)
{
  if (result != (const char *)a2)
  {
    unsigned int v3 = result;
    if (result)
    {
      if (a2)
      {
        if (a3)
        {
          int result = *a2;
          if (*a2)
          {
            int result = (const char *)strcmp(result, *(const char **)v3);
            if ((_DWORD)result)
            {
              int result = (const char *)si_module_allows_caching((BOOL)a2);
              if ((_DWORD)result)
              {
                unsigned int v6 = *(_DWORD *)(a3 + 8);
                if (v6 <= 0x11)
                {
                  uint64_t v7 = *((void *)v3 + 4);
                  if (v7)
                  {
                    char v8 = (pthread_mutex_t *)(v7 + 240LL * v6);
                    pthread_mutex_lock(v8);
                    uint64_t v9 = v7 + 240LL * *(unsigned int *)(a3 + 8);
                    uint64_t v10 = *(int *)(v9 + 64);
                    si_item_release(*(unsigned int **)(v9 + 8 * v10 + 72));
                    uint64_t v13 = si_item_retain(a3, v11, v12);
                    uint64_t v14 = v7 + 240LL * *(unsigned int *)(a3 + 8);
                    *(void *)(v14 + 8 * v10 + 72) = v13;
                    else {
                      int v15 = 0;
                    }
                    *(_DWORD *)(v14 + 64) = v15;
                    return (const char *)pthread_mutex_unlock(v8);
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return result;
}

const char *si_cache_add_list(const char *result, const char **a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        char v5 = result;
        if (result != (const char *)a2)
        {
          if (*(_DWORD *)(a3 + 4))
          {
            int result = *a2;
            if (*a2)
            {
              int result = (const char *)strcmp(result, *(const char **)v5);
              if ((_DWORD)result)
              {
                int result = (const char *)si_module_allows_caching((BOOL)a2);
                if ((_DWORD)result)
                {
                  uint64_t v6 = **(void **)(a3 + 16);
                  if (v6)
                  {
                    unsigned int v7 = *(_DWORD *)(v6 + 8);
                    if (v7 <= 0x11)
                    {
                      uint64_t v8 = *((void *)v5 + 4);
                      if (v8)
                      {
                        uint64_t v9 = (pthread_mutex_t *)(v8 + 240LL * v7);
                        pthread_mutex_lock(v9);
                        si_list_release(*(void *)(v8 + 240LL * *(unsigned int *)(v6 + 8) + 232));
                        *(void *)(v8 + 240LL * *(unsigned int *)(v6 + 8) + 232) = si_list_retain((unsigned int *)a3);
                        return (const char *)pthread_mutex_unlock(v9);
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

  return result;
}

void cache_close(uint64_t a1)
{
  if (a1)
  {
    unsigned int v1 = *(char **)(a1 + 32);
    if (v1)
    {
      uint64_t v2 = 0LL;
      unsigned int v3 = v1 + 72;
      do
      {
        si_list_release(*(void *)&v1[240 * v2 + 232]);
        for (uint64_t i = 0LL; i != 160; i += 8LL)
        {
          si_item_release(*(unsigned int **)&v3[i]);
          *(void *)&v3[i] = 0LL;
        }

        pthread_mutex_destroy((pthread_mutex_t *)&v1[240 * v2++]);
        v3 += 240;
      }

      while (v2 != 18);
      free(v1);
    }
  }

unsigned int *cache_user_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 1u, a2, 0, 1);
}

unsigned int *cache_user_byuid(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 1u, 0LL, a2, 2);
}

unsigned int *cache_user_all(uint64_t a1)
{
  return cache_fetch_list(a1, 1u);
}

unsigned int *cache_group_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 2u, a2, 0, 1);
}

unsigned int *cache_group_bygid(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 2u, 0LL, a2, 2);
}

unsigned int *cache_group_all(uint64_t a1)
{
  return cache_fetch_list(a1, 2u);
}

unsigned int *cache_grouplist(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 3u, a2, 0, 1);
}

unsigned int *cache_alias_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 5u, a2, 0, 1);
}

unsigned int *cache_alias_all(uint64_t a1)
{
  return cache_fetch_list(a1, 5u);
}

unsigned int *cache_host_byname(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  if (a5) {
    *a5 = 0;
  }
  if (a3 == 2) {
    unsigned int v8 = 6;
  }
  else {
    unsigned int v8 = 7;
  }
  int result = cache_fetch_item(a1, v8, a2, a3, 1);
  if (a5 && !result && !*a5) {
    *a5 = 1;
  }
  return result;
}

unsigned int *cache_host_byaddr(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  if (a5) {
    *a5 = 0;
  }
  if (a3 == 2) {
    unsigned int v8 = 6;
  }
  else {
    unsigned int v8 = 7;
  }
  int result = cache_fetch_item(a1, v8, a2, a3, 2);
  if (a5 && !result && !*a5) {
    *a5 = 1;
  }
  return result;
}

unsigned int *cache_host_all(uint64_t a1)
{
  return cache_fetch_list(a1, 6u);
}

unsigned int *cache_network_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 8u, a2, 0, 1);
}

unsigned int *cache_network_byaddr(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 8u, 0LL, a2, 2);
}

unsigned int *cache_network_all(uint64_t a1)
{
  return cache_fetch_list(a1, 8u);
}

unsigned int *cache_service_byname(uint64_t a1, char *a2, char *__s1)
{
  if (!a2) {
    return 0LL;
  }
  if (__s1)
  {
    if (!strcmp(__s1, "tcp")) {
      int v5 = 2;
    }
    else {
      int v5 = 1;
    }
  }

  else
  {
    int v5 = 0;
  }

  return cache_fetch_item(a1, 9u, a2, v5, 1);
}

unsigned int *cache_service_byport(uint64_t a1, int a2, char *a3)
{
  return cache_fetch_item(a1, 9u, a3, a2, 2);
}

unsigned int *cache_service_all(uint64_t a1)
{
  return cache_fetch_list(a1, 9u);
}

unsigned int *cache_protocol_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xAu, a2, 0, 1);
}

unsigned int *cache_protocol_bynumber(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 0xAu, 0LL, a2, 2);
}

unsigned int *cache_protocol_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xAu);
}

unsigned int *cache_rpc_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xBu, a2, 0, 1);
}

unsigned int *cache_rpc_bynumber(uint64_t a1, int a2)
{
  return cache_fetch_item(a1, 0xBu, 0LL, a2, 2);
}

unsigned int *cache_rpc_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xBu);
}

unsigned int *cache_fs_byspec(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xCu, a2, 0, 1);
}

unsigned int *cache_fs_byfile(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xCu, a2, 0, 2);
}

unsigned int *cache_fs_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xCu);
}

unsigned int *cache_mac_byname(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xDu, a2, 0, 1);
}

unsigned int *cache_mac_bymac(uint64_t a1, char *a2)
{
  return cache_fetch_item(a1, 0xDu, a2, 0, 2);
}

unsigned int *cache_mac_all(uint64_t a1)
{
  return cache_fetch_list(a1, 0xDu);
}

uint64_t cache_nameinfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  if (a5) {
    *a5 = 1;
  }
  return 0LL;
}

uint64_t __si_module_cache_byname_block_invoke(uint64_t a1)
{
  uint64_t v2 = (char *)calloc(1uLL, 0x10E0uLL);
  uint64_t v3 = 0LL;
  **(void **)(a1 + 32) = strdup(*(const char **)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)(v4 + 8) = 0x100000001LL;
  *(_DWORD *)(v4 + 16) = 1;
  *(void *)(v4 + 32) = v2;
  *(void *)(*(void *)(a1 + 32) + 40LL) = &si_module_cache_byname_cache_vtable;
  do
  {
    int v5 = 20;
    do
    {
      uint64_t result = pthread_mutex_init((pthread_mutex_t *)&v2[240 * v3], 0LL);
      --v5;
    }

    while (v5);
    ++v3;
  }

  while (v3 != 18);
  return result;
}

unsigned int *cache_fetch_item(uint64_t a1, unsigned int a2, char *a3, int a4, int a5)
{
  int v5 = 0LL;
  if (a1 && gL1CacheEnabled)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      uint64_t v11 = (pthread_mutex_t *)(v6 + 240LL * a2);
      pthread_mutex_lock(v11);
      for (uint64_t i = 72LL; i != 232; i += 8LL)
      {
        int v5 = *(unsigned int **)((char *)&v11->__sig + i);
        if (v5)
        {
          if (si_item_is_valid(*(uint64_t **)((char *)&v11->__sig + i)))
          {
            uint64_t v15 = si_item_retain((uint64_t)v5, v13, v14);
            int v5 = (unsigned int *)v15;
            if (v15 && si_item_match(v15, a2, a3, a4, a5)) {
              goto LABEL_13;
            }
          }

          else
          {
            si_item_release(v5);
            int v5 = 0LL;
            *(uint64_t *)((char *)&v11->__sig + i) = 0LL;
          }
        }

        si_item_release(v5);
      }

      int v5 = 0LL;
LABEL_13:
      pthread_mutex_unlock(v11);
    }

    else
    {
      return 0LL;
    }
  }

  return v5;
}

unsigned int *cache_fetch_list(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = 0LL;
  if (a1 && gL1CacheEnabled)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      uint64_t v4 = v3 + 240LL * a2;
      pthread_mutex_lock((pthread_mutex_t *)v4);
      uint64_t v2 = *(unsigned int **)(v4 + 232);
      if (v2)
      {
        if (v2[1])
        {
          uint64_t v5 = **((void **)v2 + 2);
          int is_valid = si_item_is_valid((uint64_t *)v5);
          unint64_t v7 = v2[1];
          if (v7 >= 2 && is_valid == 1)
          {
            uint64_t v9 = 1LL;
            do
            {
              uint64_t v10 = *(void *)(*((void *)v2 + 2) + 8 * v9);
              if (*(void *)v10 == *(void *)v5
                && *(_DWORD *)(v10 + 8) == *(_DWORD *)(v5 + 8)
                && *(void *)(v10 + 16) == *(void *)(v5 + 16)
                && *(void *)(v10 + 24) == *(void *)(v5 + 24))
              {
                int is_valid = 1;
              }

              else
              {
                int is_valid = si_item_is_valid(*(uint64_t **)(*((void *)v2 + 2) + 8 * v9));
                unint64_t v7 = v2[1];
                uint64_t v5 = v10;
              }
            }

            while (++v9 < v7 && is_valid == 1);
          }

          if (is_valid)
          {
            uint64_t v2 = si_list_retain(v2);
          }

          else
          {
            si_list_release((uint64_t)v2);
            uint64_t v2 = 0LL;
            *(void *)(v4 + 232) = 0LL;
          }
        }

        else
        {
          uint64_t v2 = 0LL;
        }
      }

      pthread_mutex_unlock((pthread_mutex_t *)v4);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

void *_fsi_tokenize(_BYTE *a1, char *__s, int a3, _DWORD *a4)
{
  if (!a1) {
    return 0LL;
  }
  if (a4) {
    *a4 = 0;
  }
  if (!__s)
  {
    int v26 = reallocf(0LL, 0x10uLL);
    appended = v26;
    if (v26)
    {
      *int v26 = a1;
      v26[1] = 0LL;
    }

    goto LABEL_38;
  }

  if (!*a1) {
    return 0LL;
  }
  int v8 = strlen(__s);
  appended = 0LL;
  uint64_t v10 = 0LL;
  while (1)
  {
    uint64_t v11 = v10 << 32;
    for (uint64_t i = &a1[(int)v10]; ; ++i)
    {
      int v13 = *i;
      LODWORD(v10) = v10 + 1;
      v11 += 0x100000000LL;
    }

    if (!*i) {
      break;
    }
    uint64_t v14 = v11 >> 32;
    uint64_t v15 = &a1[v11 >> 32];
    unsigned int v16 = *v15;
    if (*v15)
    {
      int v17 = v10;
      int v18 = v10;
      while (1)
      {
        uint64_t v19 = v8;
        v20 = __s;
        if (v8 >= 1) {
          break;
        }
LABEL_17:
        if (v16 > 0x20 || ((1LL << v16) & 0x100000600LL) == 0) {
          int v18 = v17;
        }
        uint64_t v14 = ++v17;
        uint64_t v15 = &a1[v14];
        unsigned int v16 = a1[v14];
        if (!a1[v14])
        {
          int v22 = 0;
          goto LABEL_24;
        }
      }

      while (1)
      {
        int v21 = *v20++;
        if (v16 == v21) {
          break;
        }
        if (!--v19) {
          goto LABEL_17;
        }
      }

      unsigned int v16 = *v15;
      int v22 = 1;
    }

    else
    {
      int v22 = 0;
      int v18 = v10;
      int v17 = v10;
    }

LABEL_24:
    BOOL v23 = v16 != 0;
    uint64_t v24 = v18 + 1;
    if (v17 == (_DWORD)v10) {
      uint64_t v25 = v14;
    }
    else {
      uint64_t v25 = v24;
    }
    a1[v25] = 0;
    appended = _fsi_append_string((uint64_t)i, appended);
    if (a4) {
      ++*a4;
    }
    uint64_t v10 = (v17 + v23);
  }

  int v22 = 1;
LABEL_33:
  if (a3 && v22)
  {
    appended = _fsi_append_string((uint64_t)&a1[(int)v10], appended);
LABEL_38:
    if (a4) {
      ++*a4;
    }
  }

  return appended;
}

      uint64_t v15 = &v39;
      goto LABEL_25;
    }

void *_fsi_append_string(uint64_t a1, void *__ptr)
{
  uint64_t v2 = __ptr;
  if (a1)
  {
    if (__ptr)
    {
      unsigned int v4 = -1;
      uint64_t v5 = (uint64_t *)__ptr;
      do
      {
        uint64_t v6 = *v5++;
        ++v4;
      }

      while (v6);
    }

    else
    {
      unsigned int v4 = 0;
    }

    unint64_t v7 = reallocf(__ptr, 8LL * (v4 + 2));
    uint64_t v2 = v7;
    if (v7)
    {
      *((void *)v7 + v4) = a1;
      *((void *)v7 + v4 + 1) = 0LL;
    }
  }

  return v2;
}

void *_fsi_get_line()
{
  v0 = (FILE *)MEMORY[0x1895FE128]();
  uint64_t v6 = *MEMORY[0x1895FEE08];
  __s[0] = 0;
  unsigned int v1 = 0LL;
  if (fgets(__s, 4096, v0) && __s[0])
  {
    if (__s[0] != 35) {
      __s[strlen(__s) - 1] = 0;
    }
    size_t v2 = (int)(strlen(__s) + 1);
    uint64_t v3 = malloc(v2);
    unsigned int v1 = v3;
    if (v3) {
      memmove(v3, __s, v2);
    }
  }

  return v1;
}

uint64_t *si_module_static_file()
{
  if (si_module_static_file_once != -1) {
    dispatch_once(&si_module_static_file_once, &__block_literal_global);
  }
  return &si_module_static_file_si;
}

const char *file_is_valid(const char **a1, const char ***a2)
{
  uint64_t result = 0LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = *a1;
      if (*a1)
      {
        unsigned int v4 = *a2;
        if (*a2 && *v4) {
          return (const char *)(strcmp(result, *v4) == 0);
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

void **file_user_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_user(a1, a2, 0, 1);
}

void **file_user_byuid(uint64_t a1, int a2)
{
  return _fsi_get_user(a1, 0LL, a2, 2);
}

void **file_user_all(uint64_t a1)
{
  return _fsi_get_user(a1, 0LL, 0, 0);
}

FILE *file_group_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_group(a1, a2, 0, 1);
}

FILE *file_group_bygid(uint64_t a1, int a2)
{
  return _fsi_get_group(a1, 0LL, a2, 2);
}

FILE *file_group_all(uint64_t a1)
{
  return _fsi_get_group(a1, 0LL, 0, 0);
}

_OWORD *file_grouplist(uint64_t a1, const char *a2)
{
  if (!a2) {
    return 0LL;
  }
  unsigned int v4 = (unsigned int *)(*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  if (v4) {
    si_item_release(v4);
  }
  uint64_t v5 = fopen("/etc/group", "r");
  if (!v5) {
    return 0LL;
  }
  uint64_t v6 = v5;
  _fsi_get_validation(a1, 2u, "/etc/group", v5, &v33, &v32);
  line = _fsi_get_line();
  if (!line)
  {
    fclose(v6);
    uint64_t v9 = 0LL;
    goto LABEL_30;
  }

  int v8 = line;
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  do
  {
    if (*v8 == 35)
    {
      uint64_t v11 = (_BYTE **)v8;
LABEL_10:
      free(v11);
      goto LABEL_11;
    }

    int v34 = 0;
    uint64_t v11 = (_BYTE **)_fsi_tokenize(v8, ":", 1, &v34);
    uint64_t v12 = (const char **)v11;
    if (v34 != 4) {
      goto LABEL_10;
    }
    int v34 = 0;
    int v13 = (const char **)_fsi_tokenize(v11[3], ",", 1, &v34);
    unint64_t v14 = v34;
    size_t v31 = v13;
    if (v34 < 1)
    {
      BOOL v18 = 0;
      int v30 = -2;
    }

    else
    {
      uint64_t v15 = v13;
      if (!strcmp(a2, *v13))
      {
        BOOL v18 = 1;
LABEL_21:
        int v30 = atoi(v12[2]);
      }

      else
      {
        uint64_t v29 = v10;
        unint64_t v16 = 0LL;
        while (v14 - 1 != v16)
        {
          if (!strcmp(a2, v15[++v16]))
          {
            BOOL v18 = v16 < v14;
            uint64_t v10 = v29;
            goto LABEL_21;
          }
        }

        BOOL v18 = 0;
        int v30 = -2;
        uint64_t v10 = v29;
      }
    }

    free(v12);
    free(v31);
    free(v8);
    if (v18)
    {
      uint64_t v19 = reallocf(v9, 4LL * ((int)v10 + 1));
      uint64_t v9 = v19;
      if (!v19)
      {
        fclose(v6);
        goto LABEL_30;
      }

      *((_DWORD *)v19 + (int)v10) = v30;
      uint64_t v10 = (v10 + 1);
    }

LABEL_11:
    int v8 = _fsi_get_line();
  }

  while (v8);
  fclose(v6);
  if ((_DWORD)v10)
  {
    v20 = LI_ils_create("L4488s4@", v21, v22, v23, v24, v25, v26, v27, a1);
    goto LABEL_31;
  }

LABEL_30:
  v20 = 0LL;
LABEL_31:
  free(v9);
  return v20;
}

  v7[2] = a1;
  return v7;
}

    if (a9)
    {
      uint64_t v19 = 0LL;
      v20 = 3;
      goto LABEL_32;
    }

    return 0LL;
  }

  uint64_t v28 = a6;
  BOOL v18 = 0;
  *(void *)&v30[0] = v34;
  *((void *)&v30[0] + 1) = v32;
  if ((a7 & 0x1000) == 0) {
    goto LABEL_13;
  }
LABEL_18:
  if (!a3)
  {
    uint64_t v29 = 0;
    if ((a7 & 4) == 0) {
      goto LABEL_21;
    }
LABEL_34:
    if (!a2) {
      return 0LL;
    }
    if (a4 == 2)
    {
      uint64_t v21 = 0LL;
      LODWORD(v36[0]) = *(_DWORD *)a2;
      uint64_t v22 = v36;
      uint64_t v23 = v28;
    }

    else
    {
      uint64_t v23 = v28;
      uint64_t v22 = 0LL;
      if (a4 == 30)
      {
        v36[0] = *(_OWORD *)a2;
        uint64_t v21 = (unsigned __int8 *)v36;
      }

      else
      {
        uint64_t v21 = 0LL;
      }
    }

    return si_addrinfo_list(a1, a7, a5, v23, (uint64_t)v22, v21, v29, 0LL, 0LL, 0LL);
  }

  uint64_t v29 = *(_WORD *)a3;
LABEL_20:
  if ((a7 & 4) != 0) {
    goto LABEL_34;
  }
LABEL_21:
  if (!a2) {
    return 0LL;
  }
  if (_mdns_search(a2, 1u, v18, a8, (unsigned __int16)(32 * a7) & 0x8000, 0LL, 0LL, (uint64_t *)v30)
    || SHIDWORD(v35) <= 0 && SHIDWORD(v33) < 1)
  {
    uint64_t v19 = 0LL;
    if (a9) {
      *a9 = 108;
    }
  }

  else
  {
    if (v16) {
      uint64_t v25 = (uint64_t *)v34;
    }
    else {
      uint64_t v25 = 0LL;
    }
    if (v17) {
      uint64_t v26 = (uint64_t *)v32;
    }
    else {
      uint64_t v26 = 0LL;
    }
    uint64_t v19 = si_addrinfo_list_from_hostent(a1, a7, a5, v28, v29, 0LL, v25, v26);
  }

  _mdns_reply_clear((uint64_t)v30);
  return v19;
}

void **file_netgroup_byname(uint64_t a1, void **a2)
{
  size_t v2 = a2;
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4)
    {
      _fsi_check_netgroup_cache(a1);
      pthread_mutex_lock(&file_mutex);
      uint64_t v5 = *(void *)(v4 + 56);
      if (!v5) {
        goto LABEL_12;
      }
      while (strcmp((const char *)v2, *(const char **)v5))
      {
        uint64_t v5 = *(void *)(v5 + 24);
        if (!v5) {
          goto LABEL_12;
        }
      }

      uint64_t v13 = *(void *)(v5 + 16);
      if (v13)
      {
        size_t v2 = 0LL;
        do
        {
          unint64_t v14 = LI_ils_create("L4488sss", v6, v7, v8, v9, v10, v11, v12, a1);
          size_t v2 = si_list_add(v2, (uint64_t)v14);
          uint64_t v13 = *(void *)(v13 + 32);
        }

        while (v13);
      }

      else
      {
LABEL_12:
        size_t v2 = 0LL;
      }

      pthread_mutex_unlock(&file_mutex);
    }

    else
    {
      return 0LL;
    }
  }

  return v2;
}

uint64_t file_in_netgroup(uint64_t a1, const char *a2, const char *a3, const char *a4, const char *a5)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5) {
    return 0LL;
  }
  _fsi_check_netgroup_cache(a1);
  pthread_mutex_lock(&file_mutex);
  uint64_t v10 = *(void *)(v5 + 56);
  if (!v10) {
    goto LABEL_19;
  }
  while (strcmp(a2, *(const char **)v10))
  {
    uint64_t v10 = *(void *)(v10 + 24);
    if (!v10) {
      goto LABEL_19;
    }
  }

  uint64_t v12 = *(void **)(v10 + 16);
  if (v12)
  {
    while (1)
    {
      uint64_t v13 = v12;
      uint64_t v12 = (void *)v12[4];
      if ((!a3 || (unint64_t v14 = (const char *)v13[1]) != 0LL && !strcmp(a3, v14))
        && (!a4 || (uint64_t v15 = (const char *)v13[2]) != 0LL && !strcmp(a4, v15)))
      {
        if (!a5) {
          break;
        }
        unint64_t v16 = (const char *)v13[3];
        if (v16)
        {
          if (!strcmp(a5, v16)) {
            break;
          }
        }
      }

      if (!v12) {
        goto LABEL_19;
      }
    }

    uint64_t v11 = 1LL;
  }

  else
  {
LABEL_19:
    uint64_t v11 = 0LL;
  }

  pthread_mutex_unlock(&file_mutex);
  return v11;
}

void **file_alias_byname(uint64_t a1, const char *a2)
{
  return _fsi_get_alias(a1, a2, 1);
}

void **file_alias_all(uint64_t a1)
{
  return _fsi_get_alias(a1, 0LL, 0);
}

unsigned int *file_host_byname(uint64_t a1, char *a2, int a3, uint64_t a4, _DWORD *a5)
{
  if (!a5) {
    return _fsi_get_host(a1, a2, 0LL, a3, 1, 0LL);
  }
  *a5 = 0;
  uint64_t result = _fsi_get_host(a1, a2, 0LL, a3, 1, a5);
  if (!result)
  {
    uint64_t result = 0LL;
    if (!*a5) {
      *a5 = 1;
    }
  }

  return result;
}

unsigned int *file_host_byaddr(uint64_t a1, void *a2, int a3, uint64_t a4, _DWORD *a5)
{
  if (!a5) {
    return _fsi_get_host(a1, 0LL, a2, a3, 2, 0LL);
  }
  *a5 = 0;
  uint64_t result = _fsi_get_host(a1, 0LL, a2, a3, 2, a5);
  if (!result)
  {
    uint64_t result = 0LL;
    if (!*a5) {
      *a5 = 1;
    }
  }

  return result;
}

unsigned int *file_host_all(uint64_t a1)
{
  return _fsi_get_host(a1, 0LL, 0LL, 0, 0, 0LL);
}

FILE *file_network_byname(uint64_t a1, const char *a2)
{
  if (a2) {
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 8);
  }
  else {
    return 0LL;
  }
}

FILE *file_network_byaddr(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0LL, a2, 2, 8);
}

FILE *file_network_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0LL, 0, 0, 8);
}

FILE *file_service_byname(uint64_t a1, const char *a2, char *a3)
{
  return _fsi_get_service(a1, a2, a3, 0, 1);
}

FILE *file_service_byport(uint64_t a1, unsigned int a2, char *a3)
{
  return _fsi_get_service(a1, 0LL, a3, a2, 2);
}

FILE *file_service_all(uint64_t a1)
{
  return _fsi_get_service(a1, 0LL, 0LL, 0, 0);
}

FILE *file_protocol_byname(uint64_t a1, const char *a2)
{
  if (a2) {
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 10);
  }
  else {
    return 0LL;
  }
}

FILE *file_protocol_bynumber(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0LL, a2, 2, 10);
}

FILE *file_protocol_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0LL, 0, 0, 10);
}

FILE *file_rpc_byname(uint64_t a1, const char *a2)
{
  if (a2) {
    return _fsi_get_name_number_aliases(a1, a2, 0, 1, 11);
  }
  else {
    return 0LL;
  }
}

FILE *file_rpc_bynumber(uint64_t a1, int a2)
{
  return _fsi_get_name_number_aliases(a1, 0LL, a2, 2, 11);
}

FILE *file_rpc_all(uint64_t a1)
{
  return _fsi_get_name_number_aliases(a1, 0LL, 0, 0, 11);
}

void **file_fs_byspec(uint64_t a1, const char *a2)
{
  return _fsi_get_fs(a1, a2, 1);
}

void **file_fs_byfile(uint64_t a1, const char *a2)
{
  return _fsi_get_fs(a1, a2, 2);
}

void **file_fs_all(uint64_t a1)
{
  return _fsi_get_fs(a1, 0LL, 0);
}

void **file_mac_byname(uint64_t a1, char *a2)
{
  return _fsi_get_ether(a1, a2, 1);
}

void **file_mac_bymac(uint64_t a1, char *a2)
{
  return _fsi_get_ether(a1, a2, 2);
}

void **file_mac_all(uint64_t a1)
{
  return _fsi_get_ether(a1, 0LL, 0);
}

unsigned int *file_addrinfo( uint64_t a1, uint64_t a2, const char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  if (a9) {
    *a9 = 0;
  }
  return _gai_simple(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

char *__si_module_static_file_block_invoke()
{
  si_module_static_file_suint64_t i = (uint64_t)strdup("file");
  uint64_t result = (char *)calloc(1uLL, 0x50uLL);
  if (result)
  {
    *(void *)&__int128 v1 = -1LL;
    *((void *)&v1 + 1) = -1LL;
    *(_OWORD *)(result + 36) = v1;
    *(_OWORD *)(result + 20) = v1;
    *(_OWORD *)(result + 4) = v1;
    *(_DWORD *)uint64_t result = 416;
  }

  qword_18C43C6F0 = (uint64_t)result;
  return result;
}

void **_fsi_get_user(uint64_t a1, const char *a2, int a3, int a4)
{
  if (!a2 && a4 == 1) {
    return 0LL;
  }
  uint64_t v30 = 0LL;
  __darwin_time_t v31 = 0LL;
  uid_t v29 = geteuid();
  if (v29)
  {
    uint64_t v8 = "/etc/passwd";
    uint64_t v9 = fopen("/etc/passwd", "r");
    uint64_t v10 = a1;
    unsigned int v11 = 0;
  }

  else
  {
    uint64_t v8 = "/etc/master.passwd";
    uint64_t v9 = fopen("/etc/master.passwd", "r");
    uint64_t v10 = a1;
    unsigned int v11 = 1;
  }

  _fsi_get_validation(v10, v11, v8, v9, &v31, &v30);
  if (!v9) {
    return 0LL;
  }
  line = _fsi_get_line();
  if (!line)
  {
    uint64_t v27 = 0LL;
    goto LABEL_30;
  }

  uint64_t v13 = line;
  uint64_t v27 = 0LL;
  if (v29) {
    int v14 = 7;
  }
  else {
    int v14 = 10;
  }
  int v28 = v14;
  while (*v13 == 35)
  {
LABEL_19:
    free(v13);
LABEL_20:
    uint64_t v13 = _fsi_get_line();
    if (!v13) {
      goto LABEL_30;
    }
  }

  v32[0] = 0;
  uint64_t v15 = (const char **)_fsi_tokenize(v13, ":", 1, v32);
  unint64_t v16 = v15;
  if (v32[0] != v14) {
    goto LABEL_18;
  }
  int v17 = atoi(v15[2]);
  if (!a4) {
    goto LABEL_23;
  }
  if (a4 == 2)
  {
    if (v17 == a3) {
      goto LABEL_23;
    }
    goto LABEL_18;
  }

  if (a4 != 1 || strcmp(a2, *v16))
  {
LABEL_18:
    free(v16);
    goto LABEL_19;
  }

LABEL_23:
  if (!v29)
  {
    atoi(v16[5]);
    atoi(v16[6]);
  }

  atoi(v16[3]);
  uint64_t v25 = (unsigned int *)LI_ils_create("L4488ss44LssssL", v18, v19, v20, v21, v22, v23, v24, a1);
  free(v16);
  free(v13);
  int v14 = v28;
  if (!v25) {
    goto LABEL_20;
  }
  if (!a4)
  {
    uint64_t v27 = si_list_add(v27, (uint64_t)v25);
    si_item_release(v25);
    goto LABEL_20;
  }

  uint64_t v27 = (void **)v25;
LABEL_30:
  fclose(v9);
  return v27;
}

void _fsi_get_validation( uint64_t a1, unsigned int a2, const char *a3, FILE *a4, __darwin_time_t *a5, uint64_t *a6)
{
  if (a5) {
    *a5 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a1)
  {
    if (a3)
    {
      if (gL1CacheEnabled)
      {
        uint64_t v9 = *(_DWORD **)(a1 + 32);
        if (v9)
        {
          if (((*v9 >> a2) & 1) != 0)
          {
            uint64_t v10 = &v9[a2];
            int v12 = v10[1];
            unsigned int v11 = v10 + 1;
            if (v12 < 0)
            {
              *(void *)&v16.st_dev = 0LL;
              asprintf((char **)&v16, "com.apple.system.info:%s", a3);
              if (!*(void *)&v16.st_dev) {
                return;
              }
              notify_register_check(*(const char **)&v16.st_dev, v11);
              free(*(void **)&v16.st_dev);
              if (!a5) {
                goto LABEL_20;
              }
            }

            else if (!a5)
            {
LABEL_20:
              if (!a6) {
                return;
              }
              uint64_t tv_nsec = a2;
              goto LABEL_30;
            }

            goto LABEL_20;
          }

          memset(&v16, 0, sizeof(v16));
          if (a4)
          {
            int v13 = fileno(a4);
            if (fstat(v13, &v16)) {
              return;
            }
          }

          else
          {
            if (a2 > 0xA) {
              uint64_t v15 = "/etc/ethers";
            }
            else {
              uint64_t v15 = off_18965F8E8[a2];
            }
            if (stat(v15, &v16)) {
              return;
            }
          }

          if (a5) {
            *a5 = v16.st_mtimespec.tv_sec;
          }
          if (a6)
          {
            uint64_t tv_nsec = v16.st_mtimespec.tv_nsec;
LABEL_30:
            *a6 = tv_nsec;
          }
        }
      }
    }
  }

FILE *_fsi_get_group(uint64_t a1, const char *a2, int a3, int a4)
{
  if (!a2 && a4 == 1) {
    return 0LL;
  }
  uint64_t result = fopen("/etc/group", "r");
  if (result)
  {
    uint64_t v9 = result;
    _fsi_get_validation(a1, 2u, "/etc/group", result, &v26, &v25);
    line = _fsi_get_line();
    if (!line)
    {
      uint64_t v24 = 0LL;
      goto LABEL_22;
    }

    unsigned int v11 = line;
    uint64_t v24 = 0LL;
    while (1)
    {
      if (*v11 == 35) {
        goto LABEL_14;
      }
      int v27 = 0;
      int v12 = (const char **)_fsi_tokenize(v11, ":", 1, &v27);
      int v13 = v12;
      if (v27 != 4) {
        goto LABEL_13;
      }
      int v14 = atoi(v12[2]);
      if (a4)
      {
        if (a4 == 2)
        {
          if (v14 != a3) {
            goto LABEL_13;
          }
        }

        else if (a4 != 1 || strcmp(a2, *v13))
        {
LABEL_13:
          free(v13);
LABEL_14:
          free(v11);
          goto LABEL_15;
        }
      }

      int v27 = 0;
      uint64_t v23 = _fsi_tokenize(v13[3], ",", 1, &v27);
      uint64_t v22 = (unsigned int *)LI_ils_create("L4488ss4*", v15, v16, v17, v18, v19, v20, v21, a1);
      free(v13);
      free(v23);
      free(v11);
      if (v22)
      {
        if (a4)
        {
          uint64_t v24 = (void **)v22;
LABEL_22:
          fclose(v9);
          return (FILE *)v24;
        }

        uint64_t v24 = si_list_add(v24, (uint64_t)v22);
        si_item_release(v22);
      }

LABEL_15:
      unsigned int v11 = _fsi_get_line();
      if (!v11) {
        goto LABEL_22;
      }
    }
  }

  return result;
}

      ++v9;
    }
  }

  return v12;
}

    a2->ru.RE_vers.high = cb_vers;
    return;
  }

  if (cb_rpcvers)
  {
    a2->re_status = RPC_FAILED;
    cb_proc = a1->ru.RM_cmb.cb_rpcvers;
    goto LABEL_9;
  }

  oa_length = a1->ru.RM_cmb.cb_cred.oa_length;
  switch(oa_length)
  {
    case 0u:
      a2->re_status = RPC_SUCCESS;
      return;
    case 1u:
      uint64_t v6 = RPC_PROGUNAVAIL;
      goto LABEL_19;
    case 2u:
      a2->re_status = RPC_PROGVERSMISMATCH;
      a2->ru.RE_errno = a1->ru.RM_cmb.cb_verf.oa_flavor;
      cb_vers = a1->ru.RM_rmb.ru.RP_ar.ru.AR_versions.high;
      goto LABEL_15;
    case 3u:
      uint64_t v6 = RPC_PROCUNAVAIL;
      goto LABEL_19;
    case 4u:
      uint64_t v6 = RPC_CANTDECODEARGS;
      goto LABEL_19;
    case 5u:
      uint64_t v6 = RPC_SYSTEMERROR;
LABEL_19:
      a2->re_status = v6;
      break;
    default:
      *(void *)&a2->re_status = 16LL;
      a2->ru.RE_vers.high = oa_length;
      break;
  }

        uint64_t v20 = AUTH_OK;
        uint64_t v21 = a1->rq_xprt;
        v21->xp_verf.oa_flavor = 0;
        v21->xp_verf.oa_length = 0;
        goto LABEL_18;
      }

      if (xdr_authunix_parms(&v23, rq_clntcred)) {
        goto LABEL_15;
      }
      v23.x_op = XDR_FREE;
      xdr_authunix_parms(&v23, rq_clntcred);
LABEL_17:
      uint64_t v20 = AUTH_BADCRED;
LABEL_18:
      x_destroy = v23.x_ops->x_destroy;
      if (x_destroy) {
        ((void (*)(XDR *))x_destroy)(&v23);
      }
      return v20;
    case 2:
      return 2;
    default:
      return 2;
  }

uint64_t _fsi_check_netgroup_cache(uint64_t result)
{
  if (result)
  {
    if (*(void *)(result + 32))
    {
      pthread_mutex_lock(&file_mutex);
      return pthread_mutex_unlock(&file_mutex);
    }
  }

  return result;
}

void **_fsi_get_alias(uint64_t a1, const char *a2, int a3)
{
  if (!a2 && a3 == 1) {
    return 0LL;
  }
  uint64_t v6 = fopen("/etc/aliases", "r");
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  _fsi_get_validation(a1, 4u, "/etc/aliases", v6, &v24, &v23);
  line = _fsi_get_line();
  if (!line)
  {
    uint64_t v10 = 0LL;
    goto LABEL_19;
  }

  uint64_t v9 = line;
  uint64_t v10 = 0LL;
  while (*v9 == 35)
  {
LABEL_11:
    free(v9);
LABEL_12:
    uint64_t v9 = _fsi_get_line();
    if (!v9) {
      goto LABEL_19;
    }
  }

  int v25 = 0;
  unsigned int v11 = (const char **)_fsi_tokenize(v9, ":", 1, &v25);
  int v12 = v11;
  if (v25 <= 1 || a3 && strcmp(a2, *v11))
  {
    free(v12);
    goto LABEL_11;
  }

  int v25 = 0;
  uint64_t v22 = _fsi_tokenize(v12[1], ",", 1, &v25);
  uint64_t v20 = (unsigned int *)LI_ils_create("L4488s4*4", v13, v14, v15, v16, v17, v18, v19, a1);
  free(v12);
  free(v22);
  free(v9);
  if (!v20) {
    goto LABEL_12;
  }
  if (!a3)
  {
    uint64_t v10 = si_list_add(v10, (uint64_t)v20);
    si_item_release(v20);
    goto LABEL_12;
  }

  uint64_t v10 = (void **)v20;
LABEL_19:
  fclose(v7);
  return v10;
}

unsigned int *_fsi_get_host(uint64_t a1, char *a2, void *a3, int a4, int a5, _DWORD *a6)
{
  uint64_t v52 = *MEMORY[0x1895FEE08];
  if ((a2 || a5 != 1) && (a3 || a5 != 2) && (int v12 = fopen("/etc/hosts", "r")) != 0LL)
  {
    uint64_t v13 = v12;
    __s1 = a2;
    v37 = a3;
    int v41 = a5;
    uint64_t v39 = a1;
    _fsi_get_validation(a1, 5u, "/etc/hosts", v12, &v43, &v42);
    line = _fsi_get_line();
    if (line)
    {
      uint64_t v15 = line;
      int v38 = 0LL;
      while (1)
      {
        if (*v15 == 35) {
          goto LABEL_36;
        }
        uint64_t v48 = 0LL;
        int v47 = 0;
        uint64_t v16 = (const char **)_fsi_tokenize(v15, " \t", 0, &v47);
        uint64_t v17 = v16;
        if (v47 <= 1) {
          goto LABEL_35;
        }
        uint64_t v51 = 0LL;
        int v24 = inet_pton(2, *v16, &v46);
        if (v24 == 1)
        {
          int v44 = v46;
          unsigned int v25 = 4;
          int v26 = 2;
          p_s2 = (const char *)&v44;
        }

        else
        {
          if (inet_pton(30, *v17, &v45) != 1) {
            goto LABEL_35;
          }
          __int128 __s2 = v45;
          unsigned int v25 = 16;
          int v26 = 30;
          p_s2 = (const char *)&__s2;
        }

        v50 = p_s2;
        int v28 = v47;
        uid_t v29 = v17 + 2;
        if (v47 >= 3) {
          uint64_t v30 = v17 + 2;
        }
        else {
          uint64_t v30 = 0LL;
        }
        if (v41)
        {
          if (v26 != a4) {
            goto LABEL_35;
          }
          if (v41 == 1)
          {
            if (strcmp(__s1, v17[1]))
            {
              if (v28 < 3) {
                goto LABEL_35;
              }
              p_s2 = *v29;
              if (!*v29) {
                goto LABEL_35;
              }
              __darwin_time_t v31 = v30 + 1;
              do
              {
                int v32 = strcmp(__s1, p_s2);
                if (!v32) {
                  break;
                }
                __darwin_time_t v33 = *v31++;
                p_s2 = v33;
              }

              while (v33);
              if (v32)
              {
LABEL_35:
                free(v17);
LABEL_36:
                free(v15);
                goto LABEL_37;
              }
            }
          }

          else if (memcmp(v37, p_s2, v25))
          {
            goto LABEL_35;
          }
        }

        if (v24 == 1) {
          int v34 = (unsigned int *)LI_ils_create("L4488s*44a", (uint64_t)p_s2, v18, v19, v20, v21, v22, v23, v39);
        }
        else {
          int v34 = (unsigned int *)LI_ils_create("L4488s*44c", (uint64_t)p_s2, v18, v19, v20, v21, v22, v23, v39);
        }
        v35 = v34;
        free(v17);
        free(v15);
        if (v35)
        {
          if (v41)
          {
            fclose(v13);
            return v35;
          }

          int v38 = si_list_add(v38, (uint64_t)v35);
          si_item_release(v35);
        }

LABEL_37:
        uint64_t v15 = _fsi_get_line();
        if (!v15) {
          goto LABEL_42;
        }
      }
    }

    int v38 = 0LL;
LABEL_42:
    fclose(v13);
    return (unsigned int *)v38;
  }

  else
  {
    v35 = 0LL;
    if (a6) {
      *a6 = 3;
    }
  }

  return v35;
}

FILE *_fsi_get_name_number_aliases(uint64_t a1, const char *a2, int a3, int a4, int a5)
{
  switch(a5)
  {
    case 8:
      unsigned int v7 = 6;
      uint64_t v8 = "/etc/networks";
      break;
    case 11:
      unsigned int v7 = 9;
      uint64_t v8 = "/etc/rpc";
      break;
    case 10:
      unsigned int v7 = 8;
      uint64_t v8 = "/etc/protocols";
      break;
    default:
LABEL_43:
      abort();
  }

  uint64_t result = fopen(v8, "r");
  if (!result) {
    return result;
  }
  uint64_t v10 = result;
  int v35 = a5;
  _fsi_get_validation(a1, v7, v8, result, &v39, &v38);
  line = (char *)_fsi_get_line();
  if (!line)
  {
    int v32 = 0LL;
    goto LABEL_40;
  }

  int v12 = line;
  int v32 = 0LL;
  unsigned int v34 = a5 - 10;
  while (1)
  {
    if (*v12 == 35) {
      goto LABEL_15;
    }
    uint64_t v13 = strchr(v12, 35);
    if (v13) {
      *uint64_t v13 = 0;
    }
    int v40 = 0;
    uint64_t v14 = (const char **)_fsi_tokenize(v12, " \t", 0, &v40);
    uint64_t v15 = v14;
    int v16 = v40;
    if (v40 < 2)
    {
LABEL_14:
      free(v15);
LABEL_15:
      free(v12);
      goto LABEL_16;
    }

    int v17 = atoi(v14[1]);
    unsigned int v25 = v15 + 2;
    if (v16 == 2) {
      int v26 = 0LL;
    }
    else {
      int v26 = v15 + 2;
    }
    if (a4)
    {
      if (a4 == 1)
      {
        if (strcmp(a2, *v15))
        {
          if (v16 == 2) {
            goto LABEL_14;
          }
          uint64_t v18 = *v25;
          if (!*v25) {
            goto LABEL_14;
          }
          int v27 = v26 + 1;
          do
          {
            int v28 = strcmp(a2, v18);
            if (!v28) {
              break;
            }
            uid_t v29 = *v27++;
            uint64_t v18 = v29;
          }

          while (v29);
          if (v28) {
            goto LABEL_14;
          }
        }
      }

      else if (v17 != a3)
      {
        goto LABEL_14;
      }
    }

    if (v34 >= 2)
    {
      if (v35 != 8) {
        goto LABEL_43;
      }
      uint64_t v30 = (unsigned int *)LI_ils_create("L4488s*44", (uint64_t)v18, v19, v20, v21, v22, v23, v24, a1);
    }

    else
    {
      uint64_t v30 = (unsigned int *)LI_ils_create("L4488s*4", (uint64_t)v18, v19, v20, v21, v22, v23, v24, a1);
    }

    __darwin_time_t v31 = v30;
    free(v15);
    free(v12);
    if (v31) {
      break;
    }
LABEL_16:
    int v12 = (char *)_fsi_get_line();
    if (!v12) {
      goto LABEL_40;
    }
  }

  if (!a4)
  {
    int v32 = si_list_add(v32, (uint64_t)v31);
    si_item_release(v31);
    goto LABEL_16;
  }

  int v32 = (void **)v31;
LABEL_40:
  fclose(v10);
  return (FILE *)v32;
}

FILE *_fsi_get_service(uint64_t a1, const char *a2, char *a3, unsigned int a4, int a5)
{
  if (!a2 && a5 == 1 || !a4 && a5 == 2) {
    return 0LL;
  }
  uint64_t result = fopen("/etc/services", "r");
  if (result)
  {
    uint64_t v10 = result;
    __s1 = a3;
    _fsi_get_validation(a1, 7u, "/etc/services", result, &v38, &v37);
    line = (char *)_fsi_get_line();
    if (!line)
    {
      *(void *)&v33[4] = 0LL;
      goto LABEL_38;
    }

    int v12 = line;
    *(_DWORD *)&v33[8] = 0;
    *(void *)__darwin_time_t v33 = bswap32(a4) >> 16;
    while (1)
    {
      if (*v12 == 35) {
        goto LABEL_30;
      }
      uint64_t v13 = strchr(v12, 35);
      if (v13) {
        *uint64_t v13 = 0;
      }
      v39[0] = 0;
      uint64_t v14 = (const char **)_fsi_tokenize(v12, " \t", 0, v39);
      uint64_t v15 = v14;
      int v16 = v39[0];
      if (v39[0] <= 1) {
        break;
      }
      int v17 = v14 + 2;
      uint64_t v18 = v39[0] == 2 ? 0LL : (uint64_t)(v14 + 2);
      uint64_t v36 = v18;
      uint64_t v19 = v14[1];
      int v20 = atoi(v19);
      uint64_t v21 = strchr(v19, 47);
      if (!v21) {
        break;
      }
      *uint64_t v21 = 0;
      if (__s1)
      {
        if (strcmp(__s1, v21 + 1)) {
          break;
        }
      }

      if (a5)
      {
        if (a5 == 1)
        {
          if (strcmp(a2, *v15))
          {
            if (v16 == 2) {
              break;
            }
            uint64_t v22 = *v17;
            if (!*v17) {
              break;
            }
            uid_t v29 = (const char **)(v36 + 8);
            do
            {
              int v30 = strcmp(a2, v22);
              if (!v30) {
                break;
              }
              __darwin_time_t v31 = *v29++;
              uint64_t v22 = v31;
            }

            while (v31);
            if (v30) {
              break;
            }
          }
        }

        else if (v20 != *(_DWORD *)v33)
        {
          break;
        }
      }

      int v32 = (unsigned int *)LI_ils_create("L4488s*4s", (uint64_t)v22, v23, v24, v25, v26, v27, v28, a1);
      free(v15);
      free(v12);
      if (v32)
      {
        if (a5)
        {
          *(void *)&v33[4] = v32;
LABEL_38:
          fclose(v10);
          return *(FILE **)&v33[4];
        }

        *(void *)&v33[4] = si_list_add(*(void ***)&v33[4], (uint64_t)v32);
        si_item_release(v32);
      }

LABEL_31:
      int v12 = (char *)_fsi_get_line();
      if (!v12) {
        goto LABEL_38;
      }
    }

    free(v15);
LABEL_30:
    free(v12);
    goto LABEL_31;
  }

  return result;
}

    if (!a5) {
      return 0LL;
    }
    goto LABEL_32;
  }

  if (v12 != 2)
  {
    if (!a5) {
      return 0LL;
    }
    int v16 = 0LL;
    int v17 = 105;
LABEL_33:
    *a5 = v17;
    return v16;
  }

  uint64_t v13 = 0;
  int v40 = *(_DWORD *)(a2 + 4);
  uint64_t v14 = *(unsigned __int16 *)(a2 + 2);
  uint64_t v15 = (__int128 *)&v40;
LABEL_25:
  if ((a3 & 2) != 0)
  {
LABEL_39:
    uint64_t v23 = 0LL;
    goto LABEL_40;
  }

void **_fsi_get_fs(uint64_t a1, const char *a2, int a3)
{
  uint64_t v62 = *MEMORY[0x1895FEE08];
  if (!a2 && a3 || statfs("/", &v61)) {
    return 0LL;
  }
  __size[0] = 0LL;
  uint64_t v8 = 0LL;
  if (sysctlbyname("vfs.generic.apfs.edt_fstab", 0LL, __size, 0LL, 0LL) || !__size[0])
  {
LABEL_12:
    BOOL v11 = a3 == 0;
    uint64_t v6 = (void **)v8;
    goto LABEL_13;
  }

  uint64_t v9 = (char *)malloc(__size[0]);
  if (!v9)
  {
LABEL_11:
    uint64_t v8 = 0LL;
    goto LABEL_12;
  }

  uint64_t v10 = v9;
  if (sysctlbyname("vfs.generic.apfs.edt_fstab", v9, __size, 0LL, 0LL))
  {
    free(v10);
    goto LABEL_11;
  }

  __size[0] /= 0xECuLL;
  _fsi_get_validation(a1, 0xAu, "/etc/fstab", 0LL, &v59, &v58);
  size_t v48 = 0LL;
  unsigned int v57 = 0LL;
LABEL_56:
  uint64_t v49 = 236 * v48;
  while (v48 < __size[0])
  {
    switch(a3)
    {
      case 0:
        goto LABEL_65;
      case 2:
        uint64_t v51 = &v10[v49 + 32];
        v50 = a2;
        break;
      case 1:
        v50 = a2;
        uint64_t v51 = &v10[v49];
        break;
      default:
        goto LABEL_64;
    }

    if (!strcmp(v50, v51))
    {
LABEL_65:
      uint64_t v8 = (unsigned int *)LI_ils_create("L4488sssss44", v41, v42, v43, v44, v45, v46, v47, a1);
      goto LABEL_66;
    }

LABEL_64:
    uint64_t v8 = 0LL;
LABEL_66:
    v49 += 236LL;
    ++v48;
    if (v8)
    {
      if (a3) {
        goto LABEL_12;
      }
      unsigned int v57 = si_list_add(v57, (uint64_t)v8);
      si_item_release(v8);
      goto LABEL_56;
    }
  }

  free(v10);
  if (a3)
  {
    uint64_t v6 = v57;
    BOOL v11 = a3 == 0;
    goto LABEL_13;
  }

  uint64_t v6 = v57;
  BOOL v11 = 1;
  if (!v57)
  {
LABEL_13:
    if (*(_DWORD *)v61.f_fstypename ^ 0x73667061 | v61.f_fstypename[4])
    {
      int v12 = fopen("/etc/fstab", "r");
      if (v12)
      {
        uint64_t v15 = v12;
        BOOL v54 = v11;
        unsigned int v56 = v6;
        uint64_t v55 = a1;
        _fsi_get_validation(a1, 0xAu, "/etc/fstab", v12, (__darwin_time_t *)__size, &v59);
        line = _fsi_get_line();
        if (!line)
        {
LABEL_45:
          fclose(v15);
          return v56;
        }

        int v17 = line;
        while (2)
        {
          if (*v17 == 35) {
            goto LABEL_39;
          }
          LODWORD(v58) = 0;
          uint64_t v18 = _fsi_tokenize(v17, " \t", 0, &v58);
          uint64_t v19 = v18;
          int v20 = v58;
          if (v58 >= 5)
          {
            atoi(*((const char **)v18 + 4));
            if (v20 == 6) {
              atoi((const char *)v19[5]);
            }
          }

          uint64_t v21 = strdup((const char *)v19[3]);
          if (!v21) {
            goto LABEL_37;
          }
          uint64_t v22 = v21;
          LODWORD(v58) = 0;
          uint64_t v23 = _fsi_tokenize(v21, ",", 0, &v58);
          if (!v23)
          {
            free(v19);
            uint64_t v36 = v22;
            goto LABEL_38;
          }

          __darwin_time_t v31 = v23;
          uint64_t v32 = v58;
          __darwin_time_t v33 = (const char **)v23;
          if ((int)v58 >= 1)
          {
            do
            {
              unsigned int v34 = *v33;
              if (!strcmp(*v33, "rw")) {
                break;
              }
              if (!strcmp(v34, "ro")) {
                break;
              }
              if (!strcmp(v34, "sw")) {
                break;
              }
              if (!strcmp(v34, "xx")) {
                break;
              }
              ++v33;
              --v32;
            }

            while (v32);
          }

          if (!a3) {
            goto LABEL_42;
          }
          if (a3 != 2)
          {
            if (a3 == 1)
            {
              int v35 = (const char *)*v19;
              goto LABEL_36;
            }

            goto LABEL_37;
          }

          int v35 = (const char *)v19[1];
LABEL_36:
          if (!strcmp(a2, v35))
          {
LABEL_42:
            uint64_t v37 = (unsigned int *)LI_ils_create("L4488sssss44", v24, v25, v26, v27, v28, v29, v30, v55);
            free(v19);
            free(v31);
            free(v22);
            free(v17);
            if (v37)
            {
              if (!v54)
              {
                fclose(v15);
                return (void **)v37;
              }

              unsigned int v56 = si_list_add(v56, (uint64_t)v37);
              si_item_release(v37);
            }
          }

          else
          {
LABEL_37:
            uint64_t v36 = (char *)v19;
LABEL_38:
            free(v36);
LABEL_39:
            free(v17);
          }

          int v17 = _fsi_get_line();
          if (!v17) {
            goto LABEL_45;
          }
          continue;
        }
      }

      __size[0] = MEMORY[0x1895FED80];
      __size[1] = 0x40000000LL;
      __size[2] = (size_t)___fsi_fs_root_block_invoke;
      __size[3] = (size_t)&__block_descriptor_tmp_40;
      __size[4] = a1;
      if (rootfs_once != -1) {
        dispatch_once(&rootfs_once, __size);
      }
      __darwin_time_t v38 = (unsigned int *)si_item_retain(rootfs, v13, v14);
      __darwin_time_t v39 = (const char **)(v38 + 8);
      if (!v38) {
        __darwin_time_t v39 = 0LL;
      }
      if (a3)
      {
        if (a3 == 2)
        {
          if (v39)
          {
            int v40 = v39[1];
            goto LABEL_75;
          }
        }

        else if (a3 == 1 && v39)
        {
          int v40 = *v39;
LABEL_75:
          int v53 = strcmp(a2, v40);
          uint64_t v52 = v6;
          uint64_t v6 = (void **)v38;
          if (!v53) {
            return v6;
          }
          return v52;
        }

        return v6;
      }

      uint64_t v52 = si_list_add(v6, (uint64_t)v38);
      si_item_release(v38);
      return v52;
    }
  }

  return v6;
}

      ++v122;
LABEL_103:
      v15 += v18 + v17;
      v12 += v18;
      __darwin_time_t v38 = *++v14;
      BOOL v11 = v38;
      if (!v38) {
        goto LABEL_107;
      }
    }
  }

  int v16 = 0LL;
  uint64_t v13 = 0LL;
  int v12 = 0LL;
  uint64_t v15 = 8LL;
LABEL_107:
  int v40 = 8LL;
  if (v13 < 8) {
    int v40 = v13;
  }
  uint64_t v41 = *((unsigned int *)align_64 + v40);
  if ((_DWORD)v41)
  {
    uint64_t v42 = v12 % v41;
    if (v42) {
      uint64_t v43 = (v41 - v42);
    }
    else {
      uint64_t v43 = 0LL;
    }
  }

  else
  {
    uint64_t v43 = 0LL;
  }

  uint64_t v44 = malloc(v15 + v43);
  __darwin_time_t v39 = v44;
  if (!v44)
  {
    *__error() = 12;
    return v39;
  }

  uint64_t v45 = (void *)((char *)v44 + v12 + v43);
  *uint64_t v45 = 0x434947414D534C49LL;
  v123 = (const char **)&a9;
  uint64_t v46 = *v10;
  if (!*v10)
  {
    uint64_t v47 = 0LL;
    uint64_t v49 = v44;
    if ((_DWORD)v41) {
      goto LABEL_211;
    }
    return v39;
  }

  uint64_t v47 = 0LL;
  size_t v48 = (char *)(v45 + 1);
  uint64_t v49 = v44;
  v121 = v44;
  do
  {
    if (v46 > 82)
    {
      if (v46 > 98)
      {
        if (v46 != 99)
        {
          if (v46 == 109)
          {
LABEL_146:
            if ((v47 & 3) != 0)
            {
              uint64_t v65 = 4 - (v47 & 3);
              bzero(v49, v65);
              uint64_t v49 = (_OWORD *)((char *)v49 + v65);
              v47 += v65;
            }

            v66 = v123++;
            *(_DWORD *)uint64_t v49 = *(_DWORD *)v66;
            uint64_t v49 = (_OWORD *)((char *)v49 + 4);
            v47 += 4LL;
            goto LABEL_206;
          }

          if (v46 != 115) {
            goto LABEL_206;
          }
          if ((v47 & 7) != 0)
          {
            int v60 = 8 - (v47 & 7);
            bzero(v49, v60);
            uint64_t v49 = (_OWORD *)((char *)v49 + v60);
            v47 += v60;
          }

          statfs v61 = v123++;
          uint64_t v62 = *v61;
          if (*v61)
          {
            *(void *)uint64_t v49 = v48;
            uint64_t v9 = strlen(v62) + 1;
            int v16 = HIDWORD(v9);
            memcpy(v48, v62, v9);
            v48 += v9;
          }

          else
          {
            *(void *)uint64_t v49 = 0LL;
          }

          goto LABEL_201;
        }

        if ((v47 & 7) != 0)
        {
          v97 = 8 - (v47 & 7);
          bzero(v49, v97);
          uint64_t v49 = (_OWORD *)((char *)v49 + v97);
          v47 += v97;
        }

        v98 = v123++;
        v99 = *v98;
        if (v99)
        {
          v100 = 0;
          *(void *)uint64_t v49 = v48;
          v101 = 1;
          do
          {
            v102 = v101;
            v103 = *(void *)&v99[8 * v100++];
            ++v101;
          }

          while (v103);
          v93 = &v48[8 * v100];
          if (*(void *)v99)
          {
            v104 = &v48[8 * v102];
            v105 = 1;
            v106 = v99;
            do
            {
              *(void *)size_t v48 = v104;
              v48 += 8;
              *(_OWORD *)v93 = *(_OWORD *)*(void *)v106;
              v93 += 16;
              v106 = &v99[8 * v105];
              v104 += 16;
              ++v105;
            }

            while (*(void *)v106);
            uint64_t v9 = 16LL;
            goto LABEL_191;
          }

          goto LABEL_190;
        }
      }

      else
      {
        if (v46 == 83)
        {
          if ((v47 & 3) != 0)
          {
            v79 = 4 - (v47 & 3);
            bzero(v49, v79);
            uint64_t v49 = (_OWORD *)((char *)v49 + v79);
            v47 += v79;
          }

          v80 = v123++;
          v81 = *v80;
          v82 = *((_OWORD *)v81 + 4);
          v126 = *((_OWORD *)v81 + 6);
          v127 = *((_OWORD *)v81 + 7);
          v83 = *(_OWORD *)v81;
          v125 = *((_OWORD *)v81 + 1);
          v84 = *((_OWORD *)v81 + 3);
          v85 = *((_OWORD *)v81 + 5);
          v49[2] = *((_OWORD *)v81 + 2);
          v49[3] = v84;
          *uint64_t v49 = v83;
          v49[1] = v125;
          v49[6] = v126;
          v49[7] = v127;
          v49[4] = v82;
          v49[5] = v85;
          v49 += 8;
          v47 += 128LL;
          goto LABEL_206;
        }

        if (v46 != 97)
        {
          if (v46 != 98) {
            goto LABEL_206;
          }
          if ((v47 & 7) != 0)
          {
            uint64_t v51 = 8 - (v47 & 7);
            bzero(v49, v51);
            uint64_t v49 = (_OWORD *)((char *)v49 + v51);
            v47 += v51;
          }

          uint64_t v52 = v123++;
          int v53 = *v52;
          if (v53)
          {
            BOOL v54 = 0;
            *(void *)uint64_t v49 = v48;
            while (*(void *)&v53[8 * v54++])
              ;
            if (*(void *)v53)
            {
              unsigned int v56 = 1;
              unsigned int v57 = v48;
              uint64_t v58 = v53;
              do
              {
                *(void *)size_t v48 = &v57[8 * v54];
                *(void *)&v48[8 * v54] = **(void **)v58;
                v48 += 8;
                uint64_t v58 = &v53[8 * v56];
                v57 += 8;
                ++v56;
              }

              while (*(void *)v58);
              uint64_t v59 = &v48[8 * v54];
              uint64_t v9 = 8LL;
            }

            else
            {
              uint64_t v59 = &v48[8 * v54];
              uint64_t v9 = v9 | (v16 << 32);
            }

            v116 = v48;
            int v16 = HIDWORD(v9);
            size_t v48 = v59;
          }

          else
          {
            v116 = (char *)v49;
          }

          *(void *)v116 = 0LL;
          goto LABEL_201;
        }

        if ((v47 & 7) != 0)
        {
          v86 = 8 - (v47 & 7);
          bzero(v49, v86);
          uint64_t v49 = (_OWORD *)((char *)v49 + v86);
          v47 += v86;
        }

        v87 = v123++;
        v88 = *v87;
        if (v88)
        {
          v89 = 0;
          *(void *)uint64_t v49 = v48;
          v90 = 1;
          do
          {
            v91 = v90;
            v92 = *(void *)&v88[8 * v89++];
            ++v90;
          }

          while (v92);
          v93 = &v48[8 * v89];
          if (*(void *)v88)
          {
            v94 = &v48[8 * v91];
            v95 = 1;
            v96 = v88;
            do
            {
              *(void *)size_t v48 = v94;
              v48 += 8;
              *(_DWORD *)v93 = **(_DWORD **)v96;
              v93 += 4;
              v96 = &v88[8 * v95];
              v94 += 4;
              ++v95;
            }

            while (*(void *)v96);
            uint64_t v9 = 4LL;
            goto LABEL_191;
          }

  close_NOCANCEL();
  v55->ah_ops->ah_destroy(v55);
  return v48;
}

void ___fsi_fs_root_block_invoke()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  uint64_t v23 = *MEMORY[0x1895FEE08];
  if ((stat("/", &v16) & 0x80000000) == 0
    && (statfs("/", &v19) & 0x80000000) == 0
    && (*(void *)v19.f_fstypename != 0x736668746E7973LL
     || (stat("/root", &v16) & 0x80000000) == 0 && (statfs("/root", &v19) & 0x80000000) == 0))
  {
    dev_t st_dev = v16.st_dev;
    __strlcpy_chk();
    if (devname_r(st_dev, 0x6000u, buf, 1024))
    {
      __strlcat_chk();
      uint64_t v9 = strdup(v22);
      if (v9)
      {
LABEL_25:
        rootfs = (uint64_t)LI_ils_create("L4488sssss44", v2, v3, v4, v5, v6, v7, v8, *(void *)(v0 + 32));
        free(v9);
        return;
      }
    }

    else
    {
      uint64_t v10 = opendir("/dev/");
      if (v10)
      {
        BOOL v11 = v10;
        while (1)
        {
          uint64_t v9 = 0LL;
          if (readdir_r(v11, &v20, &v17) || !v17) {
            break;
          }
          if (v17->d_type == 6)
          {
            __strlcat_chk();
            if (!stat(v22, &v18) && v18.st_rdev == st_dev)
            {
              uint64_t v9 = strdup(v22);
              break;
            }
          }

          v22[5] = 0;
        }

        closedir(v11);
        if (v9) {
          goto LABEL_25;
        }
      }
    }

    f_mntfromname = v19.f_mntfromname;
    size_t v13 = 1024LL;
    uint64_t v14 = strnstr(v19.f_mntfromname, "@", 0x400uLL);
    if (v14)
    {
      size_t v13 = 1024LL;
      do
      {
        uint64_t v15 = v14 + 1;
        size_t v13 = &f_mntfromname[v13] - (v14 + 1);
        uint64_t v14 = strnstr(v14 + 1, "@", v13);
        f_mntfromname = v15;
      }

      while (v14);
    }

    else
    {
      uint64_t v15 = v19.f_mntfromname;
    }

    uint64_t v9 = strndup(v15, v13);
    goto LABEL_25;
  }

void **_fsi_get_ether(uint64_t a1, char *a2, int a3)
{
  if (!a2 && a3) {
    return 0LL;
  }
  if (a3 == 2)
  {
    uint64_t v6 = si_standardize_mac_address(a2);
    if (!v6) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = fopen("/etc/ethers", "r");
  if (!v7) {
    return 0LL;
  }
  uint64_t v8 = v7;
  _fsi_get_validation(a1, 0xBu, "/etc/ethers", v7, &v15, &v14);
  line = _fsi_get_line();
  if (!line)
  {
    BOOL v11 = 0LL;
    goto LABEL_23;
  }

  uint64_t v10 = line;
  BOOL v11 = 0LL;
  while (1)
  {
    if (*v10 == 35)
    {
      free(v10);
      goto LABEL_16;
    }

    if (a3 != 2) {
      break;
    }
    int v12 = (unsigned int *)_fsi_parse_ether(a1, v6, 2, v10);
    free(v10);
    if (v12) {
      goto LABEL_22;
    }
LABEL_16:
    uint64_t v10 = _fsi_get_line();
    if (!v10) {
      goto LABEL_23;
    }
  }

  int v12 = (unsigned int *)_fsi_parse_ether(a1, a2, a3, v10);
  free(v10);
  if (!v12) {
    goto LABEL_16;
  }
  if (!a3)
  {
    BOOL v11 = si_list_add(v11, (uint64_t)v12);
    si_item_release(v12);
    goto LABEL_16;
  }

LABEL_22:
  BOOL v11 = (void **)v12;
LABEL_23:
  fclose(v8);
  return v11;
}

    *(_WORD *)&v2[strlen(v2)] = 10;
  }

  return v2;
}

_OWORD *_fsi_parse_ether(uint64_t a1, const char *a2, int a3, _BYTE *a4)
{
  int v23 = 0;
  uint64_t v7 = (char **)_fsi_tokenize(a4, " \t", 1, &v23);
  uint64_t v8 = v7;
  if (v23 == 2)
  {
    uint64_t v9 = si_standardize_mac_address(*v7);
    if (v9)
    {
      int v17 = v9;
      if (a3)
      {
        if (a3 == 2)
        {
          statfs v19 = a2;
          stat v18 = v17;
        }

        else
        {
          if (a3 != 1)
          {
LABEL_10:
            free(v8);
            dirent v20 = v17;
            goto LABEL_11;
          }

          stat v18 = v8[1];
          statfs v19 = a2;
        }

        if (strcmp(v19, v18)) {
          goto LABEL_10;
        }
      }

      uint64_t v21 = LI_ils_create("L4488ss", v10, v11, v12, v13, v14, v15, v16, a1);
      free(v8);
      free(v17);
      return v21;
    }
  }

  dirent v20 = v8;
LABEL_11:
  free(v20);
  return 0LL;
}

_OWORD *LI_ils_create( char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v10 = a1;
  v122 = (size_t *)&a9;
  char v11 = *a1;
  if (*a1)
  {
    unint64_t v12 = 0LL;
    unint64_t v13 = 0LL;
    uint64_t v14 = a1;
    uint64_t v15 = 8LL;
    while (1)
    {
      if (v11 > 82)
      {
        if (v11 <= 98)
        {
          switch(v11)
          {
            case 'S':
              size_t v16 = 0LL;
              LODWORD(v9) = 0;
              size_t v17 = 0LL;
              ++v122;
              if ((v12 & 3) != 0) {
                unsigned int v18 = 132 - (v12 & 3);
              }
              else {
                unsigned int v18 = 128;
              }
              unint64_t v13 = 128LL;
              goto LABEL_103;
            case 'a':
              if ((v12 & 7) != 0) {
                unsigned int v18 = 16 - (v12 & 7);
              }
              else {
                unsigned int v18 = 8;
              }
              if (v13 <= 8) {
                unint64_t v13 = 8LL;
              }
              uint64_t v29 = v122++;
              size_t v17 = *v29;
              if (v17)
              {
                uint64_t v20 = *(void *)v17;
                if (*(void *)v17)
                {
                  uint64_t v20 = 0LL;
                  unsigned int v30 = 1;
                  do
                    v20 += 12LL;
                  while (*(void *)(v17 + 8LL * v30++));
                }

                goto LABEL_88;
              }

              break;
            case 'b':
              if ((v12 & 7) != 0) {
                unsigned int v18 = 16 - (v12 & 7);
              }
              else {
                unsigned int v18 = 8;
              }
              if (v13 <= 8) {
                unint64_t v13 = 8LL;
              }
              statfs v19 = v122++;
              size_t v17 = *v19;
              if (v17)
              {
                uint64_t v20 = *(void *)v17;
                if (*(void *)v17)
                {
                  uint64_t v20 = 0LL;
                  unsigned int v21 = 1;
                  do
                    v20 += 16LL;
                  while (*(void *)(v17 + 8LL * v21++));
                }

                goto LABEL_88;
              }

              break;
            default:
              return 0LL;
          }

LABEL_90:
          size_t v16 = 0LL;
          LODWORD(v9) = 0;
          goto LABEL_103;
        }

        if (v11 == 99)
        {
          if ((v12 & 7) != 0) {
            unsigned int v18 = 16 - (v12 & 7);
          }
          else {
            unsigned int v18 = 8;
          }
          if (v13 <= 8) {
            unint64_t v13 = 8LL;
          }
          uint64_t v32 = v122++;
          size_t v17 = *v32;
          if (v17)
          {
            uint64_t v20 = *(void *)v17;
            if (*(void *)v17)
            {
              uint64_t v20 = 0LL;
              unsigned int v33 = 1;
              do
                v20 += 24LL;
              while (*(void *)(v17 + 8LL * v33++));
            }

LABEL_88:
            size_t v17 = v20 + 8;
LABEL_89:
            size_t v16 = HIDWORD(v17);
LABEL_99:
            LODWORD(v9) = v17;
            goto LABEL_103;
          }

          goto LABEL_90;
        }

        if (v11 != 109)
        {
          if (v11 != 115) {
            return 0LL;
          }
          if ((v12 & 7) != 0) {
            unsigned int v18 = 16 - (v12 & 7);
          }
          else {
            unsigned int v18 = 8;
          }
          if (v13 <= 8) {
            unint64_t v13 = 8LL;
          }
          int v23 = (const char **)v122++;
          if (!*v23)
          {
            size_t v16 = 0LL;
            LODWORD(v9) = 0;
            size_t v17 = 0LL;
            goto LABEL_103;
          }

          size_t v17 = strlen(*v23) + 1;
          goto LABEL_89;
        }

LABEL_42:
        size_t v16 = 0LL;
        LODWORD(v9) = 0;
        size_t v17 = 0LL;
        if ((v12 & 3) != 0) {
          unsigned int v18 = 8 - (v12 & 3);
        }
        else {
          unsigned int v18 = 4;
        }
        if (v13 <= 4) {
          unint64_t v13 = 4LL;
        }
      }

      else
      {
        if (v11 <= 63)
        {
          switch(v11)
          {
            case '1':
              size_t v16 = 0LL;
              LODWORD(v9) = 0;
              size_t v17 = 0LL;
              if (v13 <= 1) {
                unint64_t v13 = 1LL;
              }
              ++v122;
              unsigned int v18 = 1;
              goto LABEL_103;
            case '2':
              size_t v16 = 0LL;
              LODWORD(v9) = 0;
              size_t v17 = 0LL;
              if ((v12 & 1) != 0) {
                unsigned int v18 = 4 - (v12 & 1);
              }
              else {
                unsigned int v18 = 2;
              }
              if (v13 <= 2) {
                unint64_t v13 = 2LL;
              }
              goto LABEL_64;
            case '3':
            case '5':
            case '6':
            case '7':
              return 0LL;
            case '4':
              goto LABEL_42;
            case '8':
              goto LABEL_36;
            default:
              if (v11 != 42) {
                return 0LL;
              }
              if ((v12 & 7) != 0) {
                unsigned int v18 = 16 - (v12 & 7);
              }
              else {
                unsigned int v18 = 8;
              }
              if (v13 <= 8) {
                unint64_t v13 = 8LL;
              }
              uint64_t v24 = (const char ***)v122++;
              uint64_t v25 = *v24;
              if (*v24 && (uint64_t v26 = *v25) != 0LL)
              {
                uint64_t v27 = 0LL;
                unsigned int v28 = 1;
                do
                {
                  v27 += strlen(v26) + 9;
                  uint64_t v26 = v25[v28++];
                }

                while (v26);
              }

              else
              {
                uint64_t v27 = 0LL;
              }

              size_t v9 = v27 + 8;
              size_t v16 = HIDWORD(v9);
              size_t v17 = v9;
              break;
          }

          goto LABEL_103;
        }

        if (v11 == 64)
        {
          size_t v16 = 0LL;
          if ((v12 & 3) != 0) {
            int v35 = 8 - (v12 & 3);
          }
          else {
            int v35 = 4;
          }
          int v36 = ((_BYTE)v35 + (_BYTE)v12) & 7;
          BOOL v119 = v36 == 0;
          size_t v17 = *(unsigned int *)v122;
          v122 += 2;
          int v37 = 16 - v36;
          if (v119) {
            int v37 = 8;
          }
          if (v13 <= 8) {
            unint64_t v13 = 8LL;
          }
          unsigned int v18 = v37 + v35;
          goto LABEL_99;
        }

        if (v11 != 76) {
          return 0LL;
        }
LABEL_36:
        size_t v16 = 0LL;
        LODWORD(v9) = 0;
        size_t v17 = 0LL;
        if ((v12 & 7) != 0) {
          unsigned int v18 = 16 - (v12 & 7);
        }
        else {
          unsigned int v18 = 8;
        }
        if (v13 <= 8) {
          unint64_t v13 = 8LL;
        }
      }

LABEL_190:
          size_t v9 = v9 | (v16 << 32);
LABEL_191:
          v115 = v48;
          size_t v16 = HIDWORD(v9);
          size_t v48 = v93;
          goto LABEL_192;
        }
      }

      v115 = (char *)v49;
LABEL_192:
      *(void *)v115 = 0LL;
LABEL_201:
      uint64_t v49 = (_OWORD *)((char *)v49 + 8);
LABEL_202:
      v47 += 8LL;
      goto LABEL_206;
    }

    if (v46 <= 63)
    {
      switch(v46)
      {
        case '1':
          v50 = v123++;
          *(_BYTE *)uint64_t v49 = *(_DWORD *)v50;
          uint64_t v49 = (_OWORD *)((char *)v49 + 1);
          break;
        case '2':
          if ((v47 & 1) != 0)
          {
            size_t v77 = 2 - (v47 & 1);
            bzero(v49, v77);
            uint64_t v49 = (_OWORD *)((char *)v49 + v77);
            v47 += v77;
          }

          v78 = v123++;
          *(_WORD *)uint64_t v49 = *(_DWORD *)v78;
          uint64_t v49 = (_OWORD *)((char *)v49 + 2);
          v47 += 2LL;
          break;
        case '3':
        case '5':
        case '6':
        case '7':
          goto LABEL_206;
        case '4':
          goto LABEL_146;
        case '8':
          goto LABEL_143;
        default:
          if (v46 == 42)
          {
            if ((v47 & 7) != 0)
            {
              size_t v67 = 8 - (v47 & 7);
              bzero(v49, v67);
              uint64_t v49 = (_OWORD *)((char *)v49 + v67);
              v47 += v67;
            }

            v68 = (const char ***)v123++;
            v69 = *v68;
            *(void *)uint64_t v49 = v48;
            if (v69)
            {
              unint64_t v70 = v41;
              int v71 = 0;
              while (v69[v71++])
                ;
              v73 = &v48[8 * v71];
              if (*v69)
              {
                unsigned int v74 = 1;
                v75 = v69;
                do
                {
                  *(void *)size_t v48 = v73;
                  v48 += 8;
                  v76 = *v75;
                  size_t v9 = strlen(*v75) + 1;
                  memcpy(v73, v76, v9);
                  v73 += v9;
                  v75 = &v69[v74++];
                }

                while (*v75);
              }

              else
              {
                size_t v9 = v9 | (v16 << 32);
              }

              unint64_t v41 = v70;
            }

            else
            {
              v73 = v48 + 8;
              size_t v9 = v9 | (v16 << 32);
            }

            size_t v16 = HIDWORD(v9);
            *(void *)size_t v48 = 0LL;
            uint64_t v49 = (_OWORD *)((char *)v49 + 8);
            v47 += 8LL;
            size_t v48 = v73;
            __darwin_time_t v39 = v121;
          }

          break;
      }

      goto LABEL_206;
    }

    if (v46 != 64)
    {
      if (v46 != 76) {
        goto LABEL_206;
      }
LABEL_143:
      if ((v47 & 7) != 0)
      {
        size_t v63 = 8 - (v47 & 7);
        bzero(v49, v63);
        uint64_t v49 = (_OWORD *)((char *)v49 + v63);
        v47 += v63;
      }

      uint64_t v64 = v123++;
      *(void *)uint64_t v49 = *v64;
      uint64_t v49 = (_OWORD *)((char *)v49 + 8);
      goto LABEL_202;
    }

    if ((v47 & 3) != 0)
    {
      size_t v107 = 4 - (v47 & 3);
      bzero(v49, v107);
      uint64_t v49 = (_OWORD *)((char *)v49 + v107);
      v47 += v107;
    }

    v108 = v123;
    v124 = v123 + 1;
    size_t v9 = *(unsigned int *)v108;
    *(_DWORD *)uint64_t v49 = v9;
    v109 = (char **)((char *)v49 + 4);
    uint64_t v110 = v47 + 4;
    int v111 = (v47 + 4) & 7;
    if (v111)
    {
      size_t v112 = (8 - v111);
      bzero(v109, v112);
      v109 = (char **)((char *)v109 + v112);
      v110 += v112;
    }

    v113 = (const void **)v124;
    v123 = (const char **)(v124 + 1);
    v114 = *v113;
    if (*v113)
    {
      *v109 = v48;
      memcpy(v48, v114, v9);
      v48 += v9;
    }

    else
    {
      *v109 = 0LL;
    }

    size_t v16 = 0LL;
    uint64_t v49 = v109 + 1;
    unint64_t v47 = v110 + 8;
LABEL_206:
    int v117 = *++v10;
    char v46 = v117;
  }

  while (v117);
  if (!(_DWORD)v41) {
    return v39;
  }
LABEL_211:
  int v118 = v47 % v41;
  if (v118) {
    BOOL v119 = (_DWORD)v41 == v118;
  }
  else {
    BOOL v119 = 1;
  }
  if (!v119) {
    bzero(v49, (v41 - v118));
  }
  return v39;
}

int *kvbuf_query( _BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v20 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 0LL;
  }
  size_t v9 = a1;
  uint64_t v10 = malloc_default_zone();
  char v11 = (int *)kvbuf_new_zone(v10);
  unint64_t v12 = v11;
  if (v11)
  {
    kvbuf_add_dict((uint64_t)v11);
    unsigned int v18 = (char **)&a9;
    while (1)
    {
      unsigned int v13 = *v9;
      if (v13 > 0x72)
      {
        if (v13 != 115)
        {
          if (v13 != 117) {
            goto LABEL_15;
          }
          ++v18;
          snprintf(__str, 0x20uLL, "%u");
          goto LABEL_12;
        }

        size_t v16 = v18++;
        kvbuf_add_val((uint64_t)v12, *v16);
      }

      else
      {
        if (v13 == 105)
        {
          ++v18;
          snprintf(__str, 0x20uLL, "%d");
LABEL_12:
          int v15 = strlen(__str);
          kvbuf_add_val_len((uint64_t)v12, __str, v15 + 1);
          goto LABEL_15;
        }

        if (v13 == 107)
        {
          uint64_t v14 = v18++;
          kvbuf_add_key(v12, *v14);
        }

        else if (!*v9)
        {
          return v12;
        }
      }

void *kvbuf_new()
{
  uint64_t v0 = malloc_default_zone();
  return kvbuf_new_zone(v0);
}

void kvbuf_add_dict(uint64_t a1)
{
  if (a1)
  {
    kvbuf_grow((unsigned int *)a1, 4);
    uint64_t v2 = *(unsigned int **)(a1 + 8);
    if (v2)
    {
      unsigned int v3 = *(_DWORD *)a1;
      unsigned int v4 = *(_DWORD *)a1 + 4;
      *(_DWORD *)a1 = v4;
      *(_DWORD *)(a1 + 20) = v3;
      *(void *)(a1 + 24) = v4;
      *(_DWORD *)(a1 + 32) = 0;
      unsigned int *v2 = bswap32(bswap32(*v2) + 1);
    }
  }

void kvbuf_add_key(int *a1, char *__s)
{
  if (a1)
  {
    if (__s)
    {
      int v4 = strlen(__s);
      kvbuf_grow((unsigned int *)a1, v4 + 9);
      uint64_t v5 = *((void *)a1 + 1);
      if (v5)
      {
        uint64_t v6 = (v4 + 1);
        uint64_t v7 = a1[5];
        unsigned int v8 = *(_DWORD *)(v5 + v7);
        unsigned int v9 = bswap32(v8);
        if (v8) {
          unsigned int v10 = *a1;
        }
        else {
          unsigned int v10 = v7 + 4;
        }
        a1[6] = v10;
        *(_DWORD *)(v5 + v7) = bswap32(v9 + 1);
        char v11 = (_DWORD *)(*((void *)a1 + 1) + *a1);
        *v11++ = bswap32(v6);
        memcpy(v11, __s, (v4 + 1));
        a1[7] = v4 + *a1 + 5;
        *(_DWORD *)((char *)v11 + v6) = 0;
        int v12 = *a1 + v4 + 9;
        *a1 = v12;
        a1[8] = v12;
      }
    }
  }

void kvbuf_add_val(uint64_t a1, char *__s)
{
  if (a1)
  {
    if (__s)
    {
      unsigned int v4 = strlen(__s) + 1;
      kvbuf_add_val_len(a1, __s, v4);
    }
  }

void *kvbuf_query_key_val(const char *a1, const char *a2)
{
  if (!a1) {
    return 0LL;
  }
  int v4 = strlen(a1);
  if (a2)
  {
    unsigned int v5 = strlen(a2) + 1;
    int v6 = 0x1000000;
  }

  else
  {
    unsigned int v5 = 0;
    int v6 = 0;
  }

  uint64_t v7 = calloc(1uLL, 0x28uLL);
  unsigned int v8 = v7;
  if (v7)
  {
    size_t v9 = v4 + v5 + 21;
    v7[4] = v9;
    *uint64_t v7 = v9;
    unsigned int v10 = calloc(1uLL, v9);
    v8[1] = v10;
    if (v10)
    {
      size_t v11 = (v4 + 1);
      *(void *)unsigned int v10 = 0x100000001000000LL;
      v10[2] = bswap32(v11);
      int v12 = (char *)(v10 + 3);
      memcpy(v10 + 3, a1, v11);
      unsigned int v13 = (int *)&v12[v11];
      *unsigned int v13 = v6;
      if (a2)
      {
        v13[1] = bswap32(v5);
        memcpy(v13 + 2, a2, v5);
      }

      return v8;
    }

    free(v8);
    return 0LL;
  }

  return v8;
}

void *kvbuf_query_key_int(const char *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  snprintf(__str, 0x20uLL, "%d", a2);
  return kvbuf_query_key_val(a1, __str);
}

void *kvbuf_query_key_uint(const char *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  snprintf(__str, 0x20uLL, "%u", a2);
  return kvbuf_query_key_val(a1, __str);
}

void *kvbuf_new_zone(malloc_zone_t *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = malloc_zone_calloc(a1, 1uLL, 0x28uLL);
  unsigned int v3 = v2;
  if (v2)
  {
    *((_DWORD *)v2 + 4) = 128;
    int v4 = malloc_zone_calloc(a1, 1uLL, 0x80uLL);
    v3[1] = v4;
    if (v4)
    {
      *(_DWORD *)unsigned int v3 = 4;
      *((_DWORD *)v3 + 5) = 4;
      return v3;
    }

    free(v3);
    return 0LL;
  }

  return v3;
}

void *kvbuf_init_zone(malloc_zone_t *a1, const void *a2, unsigned int a3)
{
  if (!a1) {
    return 0LL;
  }
  int v6 = malloc_zone_calloc(a1, 1uLL, 0x28uLL);
  uint64_t v7 = v6;
  if (v6)
  {
    v6[4] = a3;
    *int v6 = a3;
    if (a3)
    {
      unsigned int v8 = malloc_zone_calloc(a1, 1uLL, a3);
      v7[1] = v8;
      if (v8)
      {
        memcpy(v8, a2, a3);
        return v7;
      }

      free(v7);
      return 0LL;
    }
  }

  return v7;
}

void *kvbuf_init(const void *a1, unsigned int a2)
{
  int v4 = malloc_default_zone();
  return kvbuf_init_zone(v4, a1, a2);
}

double kvbuf_grow(unsigned int *ptr, int a2)
{
  if (a2)
  {
    int v3 = *((void *)ptr + 1) ? a2 : a2 + 4;
    unsigned int v4 = v3 + *ptr;
    if (v4 > ptr[4])
    {
      ptr[4] = (v4 + 255) & 0xFFFFFF00;
      uint64_t v5 = malloc_zone_from_ptr(ptr);
      int v6 = (void *)*((void *)ptr + 1);
      size_t v7 = ptr[4];
      if (v6)
      {
        unsigned int v8 = (char *)malloc_zone_realloc(v5, v6, v7);
        if (v8)
        {
          *((void *)ptr + 1) = v8;
          bzero(&v8[*ptr], ptr[4] - *ptr);
          return result;
        }

        free(*((void **)ptr + 1));
      }

      else
      {
        unsigned int v10 = malloc_zone_calloc(v5, 1uLL, v7);
        *((void *)ptr + 1) = v10;
        if (v10)
        {
          *ptr = 4;
          ptr[5] = 4;
          return result;
        }
      }

      *((void *)ptr + 4) = 0LL;
      double result = 0.0;
      *(_OWORD *)ptr = 0u;
      *((_OWORD *)ptr + 1) = 0u;
    }
  }

  return result;
}

void kvbuf_add_val_len(uint64_t a1, const void *a2, unsigned int a3)
{
  if (a1 && a2 && a3)
  {
    unsigned int v6 = a3 + 4;
    kvbuf_grow((unsigned int *)a1, a3 + 4);
    uint64_t v7 = *(void *)(a1 + 8);
    if (v7)
    {
      *(_DWORD *)(v7 + *(unsigned int *)(a1 + 28)) = bswap32(bswap32(*(_DWORD *)(v7 + *(unsigned int *)(a1 + 28))) + 1);
      unsigned int v8 = (_DWORD *)(*(void *)(a1 + 8) + *(unsigned int *)(a1 + 32));
      *unsigned int v8 = bswap32(a3);
      memcpy(v8 + 1, a2, a3);
      unsigned int v9 = *(_DWORD *)a1 + v6;
      *(_DWORD *)a1 = v9;
      *(_DWORD *)(a1 + 32) = v9;
    }
  }

uint64_t kvbuf_get_len(uint64_t a1)
{
  return bswap32(*(_DWORD *)(a1 - 4));
}

void kvbuf_make_purgeable(uint64_t a1)
{
  if (a1)
  {
    __int128 v1 = *(void **)(a1 + 8);
    if (v1) {
      malloc_make_purgeable(v1);
    }
  }

void *kvbuf_make_nonpurgeable(void *result)
{
  if (result)
  {
    double result = (void *)result[1];
    if (result) {
      return (void *)(malloc_make_nonpurgeable(result) != 0);
    }
  }

  return result;
}

void kvbuf_free(void *a1)
{
  if (a1)
  {
    uint64_t v2 = (void *)a1[1];
    if (v2) {
      free(v2);
    }
    a1[4] = 0LL;
    *(_OWORD *)a1 = 0u;
    *((_OWORD *)a1 + 1) = 0u;
    free(a1);
  }

unsigned int *kvbuf_append_kvbuf(unsigned int *result, uint64_t a2)
{
  if (result && a2)
  {
    unsigned int v3 = **(_DWORD **)(a2 + 8);
    if (v3)
    {
      unsigned int v4 = result;
      **((_DWORD **)result + 1) = bswap32(bswap32(v3) + bswap32(**((_DWORD **)result + 1)));
      size_t v5 = (*(_DWORD *)a2 - 4);
      kvbuf_grow(result, *(_DWORD *)a2 - 4);
      double result = (unsigned int *)memcpy( (void *)(*((void *)v4 + 1) + *v4),  (const void *)(*(void *)(a2 + 8) + 4LL),  v5);
      *v4 += v5;
    }
  }

  return result;
}

uint64_t kvbuf_reset(uint64_t a1)
{
  if (a1
    && (__int128 v1 = *(unsigned int **)(a1 + 8)) != 0LL
    && (*(void *)(a1 + 28) = 0LL, *(void *)(a1 + 20) = 0LL, *(_DWORD *)a1 >= 4u))
  {
    return bswap32(*v1);
  }

  else
  {
    return 0LL;
  }

uint64_t kvbuf_next_dict(unsigned int *a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v1 = *((void *)a1 + 1);
  if (!v1) {
    return 0LL;
  }
  *((void *)a1 + 3) = 0LL;
  a1[8] = 0;
  uint64_t v2 = a1[5];
  if ((_DWORD)v2)
  {
    uint64_t v3 = v1 + v2;
    unsigned int v4 = *(_DWORD *)(v1 + v2);
    LODWORD(v2) = v2 + 4;
    a1[5] = v2;
    if (v4)
    {
      int v5 = 0;
      unsigned int v6 = bswap32(v4);
      uint64_t v7 = (unsigned int *)(v3 + 4);
      do
      {
        uint64_t v8 = bswap32(*v7);
        unsigned int v9 = (char *)v7 + v8;
        int v10 = v2 + v8;
        a1[5] = v10 + 4;
        unsigned int v11 = *((_DWORD *)v9 + 1);
        uint64_t v7 = (unsigned int *)(v9 + 8);
        LODWORD(v2) = v10 + 8;
        a1[5] = v2;
        if (v11)
        {
          unsigned int v12 = bswap32(v11);
          do
          {
            uint64_t v13 = bswap32(*v7);
            uint64_t v7 = (unsigned int *)((char *)v7 + v13 + 4);
            LODWORD(v2) = v2 + v13 + 4;
            a1[5] = v2;
            --v12;
          }

          while (v12);
        }

        ++v5;
      }

      while (v5 != v6);
    }

    uint64_t v2 = v2;
    return 0LL;
  }

  unsigned int v14 = *a1;
  if (*a1 < 4) {
    return 0LL;
  }
  uint64_t v2 = 4LL;
  a1[5] = 4;
  if (v14 < 8) {
    return 0LL;
  }
  return bswap32(*(_DWORD *)(v1 + v2));
}

unsigned int *kvbuf_next_key(unsigned int *a1, _DWORD *a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    *a2 = 0;
    uint64_t v3 = *((void *)a1 + 1);
    if (!v3) {
      return 0LL;
    }
    uint64_t v4 = a1[5];
    if (!(_DWORD)v4) {
      return 0LL;
    }
    a1[7] = 0;
    a1[8] = 0;
    uint64_t v5 = a1[6];
    if ((_DWORD)v5)
    {
      uint64_t v6 = v3 + v5;
      uint64_t v7 = bswap32(*(_DWORD *)(v3 + v5));
      unint64_t v8 = *a1;
      uint64_t v9 = v7 + 4;
      if (v7 + 4 + v5 > v8) {
        return 0LL;
      }
      uint64_t v10 = (v5 + v9);
      a1[6] = v10;
      if (v10 + 4 > v8) {
        return 0LL;
      }
      unsigned int v11 = (unsigned int *)(v6 + v9);
      unsigned int v12 = *v11;
      unsigned int v13 = v10 + 4;
      a1[6] = v10 + 4;
      if (v12)
      {
        unsigned int v14 = bswap32(v12);
        int v15 = v11 + 1;
        while ((unint64_t)v13 + 4 <= v8 && v8 >= v13 + v7)
        {
          uint64_t v17 = bswap32(*v15) + 4LL;
          int v15 = (unsigned int *)((char *)v15 + v17);
          v13 += v17;
          a1[6] = v13;
          if (!--v14) {
            goto LABEL_19;
          }
        }

        return 0LL;
      }
    }

    else
    {
      unint64_t v8 = *a1;
      unsigned int v13 = v4 + 4;
      if (v4 + 4 > v8) {
        return 0LL;
      }
      a1[6] = v13;
    }

LABEL_19:
    statfs v19 = (unsigned int *)(v3 + v13);
    uint64_t v20 = v13 + bswap32(*v19) + 4;
    a1[7] = v20;
    if (v20 + 4 <= v8)
    {
      uint64_t v2 = v19 + 1;
      *a2 = bswap32(*(_DWORD *)(v3 + v20));
    }

    else
    {
      uint64_t v2 = 0LL;
      a1[7] = 0;
    }
  }

  return v2;
}

unsigned int *kvbuf_next_val(unsigned int *a1)
{
  return kvbuf_next_val_len(a1, 0LL);
}

unsigned int *kvbuf_next_val_len(unsigned int *result, _DWORD *a2)
{
  if (!result) {
    return result;
  }
  uint64_t v2 = *((void *)result + 1);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = result[7];
  if (!(_DWORD)v3) {
    return 0LL;
  }
  uint64_t v4 = result[8];
  if (!(_DWORD)v4)
  {
    unint64_t v6 = *result;
    LODWORD(v4) = v3 + 4;
    if (v3 + 4 <= v6)
    {
      result[8] = v4;
      LODWORD(v5) = bswap32(*(_DWORD *)(v2 + v4));
      goto LABEL_9;
    }

    return 0LL;
  }

  uint64_t v5 = bswap32(*(_DWORD *)(v2 + v4));
  unint64_t v6 = *result;
  if (v4 + v5 + 4 > v6) {
    return 0LL;
  }
  LODWORD(v4) = v4 + v5 + 4;
  result[8] = v4;
LABEL_9:
  uint64_t v4 = v4;
  if (a2)
  {
    *a2 = v5;
    uint64_t v4 = result[8];
  }

  return (unsigned int *)(v2 + v4 + 4);
}

void *kvbuf_decode(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(unsigned int **)(a1 + 8);
  if (!v2) {
    return 0LL;
  }
  int v3 = *(_DWORD *)a1 - 4;
  if (*(_DWORD *)a1 < 4u) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)a1;
  unsigned int v6 = *v2;
  uint64_t v4 = v2 + 1;
  unsigned int v5 = v6;
  *(_DWORD *)(a1 + 16) = v3;
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = calloc(1uLL, 0x18uLL);
  if (!v7) {
    return v7;
  }
  size_t v8 = bswap32(v5);
  *(_DWORD *)uint64_t v7 = v8;
  uint64_t v9 = calloc(v8, 0x20uLL);
  v7[1] = v9;
  if (!v9)
  {
    free(v7);
    return 0LL;
  }

  if (*(_DWORD *)v7)
  {
    uint64_t v10 = 0LL;
    while (1)
    {
      unsigned int v11 = *(_DWORD *)(a1 + 16);
      if (v11 <= 3) {
        break;
      }
      unsigned int v12 = *v4++;
      *(_DWORD *)(a1 + 16) = v11 - 4;
      size_t v13 = bswap32(v12);
      v9[8 * v10] = v13;
      if (v12)
      {
        unsigned int v14 = calloc(v13, 8uLL);
        uint64_t v15 = v7[1];
        *(void *)(v15 + 32 * v10 + 8) = v14;
        if (!v14) {
          break;
        }
        size_t v16 = calloc(*(unsigned int *)(v15 + 32 * v10), 4uLL);
        uint64_t v17 = v7[1];
        *(void *)(v17 + 32 * v10 + 16) = v16;
        if (!v16) {
          break;
        }
        unsigned int v18 = calloc(*(unsigned int *)(v17 + 32 * v10), 8uLL);
        uint64_t v9 = (_DWORD *)v7[1];
        *(void *)&v9[8 * v10 + 6] = v18;
        if (!v18) {
          break;
        }
        if (v9[8 * v10])
        {
          uint64_t v19 = 0LL;
          do
          {
            unsigned int v20 = *(_DWORD *)(a1 + 16);
            if (v20 <= 3) {
              goto LABEL_32;
            }
            unsigned int v22 = *v4;
            unsigned int v21 = v4 + 1;
            unsigned int v23 = v20 - 4;
            *(_DWORD *)(a1 + 16) = v23;
            unsigned int v24 = bswap32(v22);
            BOOL v25 = v23 >= v24;
            unsigned int v26 = v23 - v24;
            if (!v25) {
              goto LABEL_32;
            }
            *(void *)(*(void *)&v9[8 * v10 + 2] + 8 * v19) = v21;
            *(_DWORD *)(a1 + 16) = v26;
            if (v26 <= 3) {
              goto LABEL_32;
            }
            uint64_t v27 = (unsigned int *)((char *)v21 + v24);
            unsigned int v28 = *v27;
            uint64_t v4 = v27 + 1;
            *(_DWORD *)(a1 + 16) = v26 - 4;
            unsigned int v29 = bswap32(v28);
            uint64_t v9 = (_DWORD *)v7[1];
            *(_DWORD *)(*(void *)&v9[8 * v10 + 4] + 4 * v19) = v29;
            if (v28)
            {
              *(void *)(*(void *)(v7[1] + 32 * v10 + 24) + 8 * v19) = calloc(v29 + 1, 8uLL);
              uint64_t v9 = (_DWORD *)v7[1];
              unsigned int v30 = (char *)&v9[8 * v10];
              if (!*(void *)(*((void *)v30 + 3) + 8 * v19)) {
                goto LABEL_32;
              }
              if (*(_DWORD *)(*((void *)v30 + 2) + 4 * v19))
              {
                unint64_t v31 = 0LL;
                unsigned int v32 = *(_DWORD *)(a1 + 16);
                while (v32 > 3)
                {
                  unsigned int v33 = *v4;
                  unsigned int v34 = v32 - 4;
                  *(_DWORD *)(a1 + 16) = v34;
                  unsigned int v35 = bswap32(v33);
                  BOOL v25 = v34 >= v35;
                  unsigned int v32 = v34 - v35;
                  if (!v25) {
                    break;
                  }
                  *(void *)(*(void *)(*(void *)&v9[8 * v10 + 6] + 8 * v19) + 8 * v31) = v4 + 1;
                  uint64_t v4 = (unsigned int *)((char *)v4 + v35 + 4);
                  *(_DWORD *)(a1 + 16) = v32;
                  ++v31;
                  uint64_t v9 = (_DWORD *)v7[1];
                }

                goto LABEL_32;
              }
            }

LABEL_28:
            ;
          }

          while (++v19 < (unint64_t)v9[8 * v10]);
        }
      }
    }

  if (v24) {
    uint64_t v27 = v24;
  }
  else {
    uint64_t v27 = __s;
  }
  if (a8)
  {
    if (v25 && v25 != a8) {
      return 0xFFFFFFFFLL;
    }
  }

  else
  {
    a8 = v25;
  }

  _mdns_debug_message(";; mdns query %s type %d class %d ifindex %d [ctx %p]\n", v27, a7, a6, a8, (const void *)a1);
  RecordWithAttribute = DNSServiceQueryRecordWithAttribute( (DNSServiceRef *)(a1 + 56),  a9 | 0x15000,  a8,  v27,  a7,  a6,  MEMORY[0x1895FF5F0],  (DNSServiceQueryRecordReply)_mdns_query_callback,  (void *)a1);
  if (v27 != __s) {
    free(v27);
  }
  *(void *)(a1 + 80) = in_flight;
  in_flight = a1;
  return RecordWithAttribute;
}

      unsigned int v5 = 0LL;
      uint64_t v7 = " - in";
      goto LABEL_29;
    }

    _mdns_debug_message(";; mdns is_complete ctx %p type mismatch (%d != %d) - incomplete\n");
  }

  return 0LL;
}

LABEL_32:
    kvarray_free(v7);
    return 0LL;
  }

  unsigned int v26 = a11[1];
  if (!v26) {
    goto LABEL_60;
  }
  if (a6 == 1)
  {
    if (*(_DWORD *)(v26 + 16) != 2) {
      goto LABEL_60;
    }
  }

  else if (*(_DWORD *)(v26 + 16) != 30)
  {
    goto LABEL_60;
  }

  if (!*(void *)v26)
  {
    unsigned int v34 = _mdns_canonicalize(a5);
    unsigned int v35 = (char **)a11[1];
    const char *v35 = v34;
    uint64_t v52 = *(unsigned int *)(v26 + 32);
    if ((int)v52 >= 1 && (int v36 = v34) != 0LL)
    {
      v50 = v26;
      uint64_t v49 = v35;
      int v37 = 0LL;
      size_t v51 = *(void *)(v26 + 8);
      int v38 = 8 * v52;
      while (1)
      {
        __darwin_time_t v39 = *(char **)(v51 + 8 * v37);
        uint64_t v40 = v36;
        if (!strcmp(v39, v36)) {
          break;
        }
        ++v37;
        v38 -= 8;
        int v36 = v40;
        if (v37 >= v52)
        {
          unsigned int v26 = (uint64_t)v49;
          goto LABEL_64;
        }
      }

      free(v39);
      memmove((void *)(*(void *)(v50 + 8) + 8 * v37), (const void *)(*(void *)(v50 + 8) + 8 * v37 + 8), v38);
      --*(_DWORD *)(v50 + 32);
      unsigned int v26 = a11[1];
LABEL_64:
      unsigned int v23 = a10;
    }

    else
    {
      unsigned int v26 = (uint64_t)v35;
    }
  }

  _mdns_hostent_append_addr(v26, v22, *(_DWORD *)(v26 + 20));
LABEL_66:
  unint64_t v41 = a11[2];
  if (v41)
  {
    int v42 = a11[3];
    uint64_t v43 = a11[4] - v42;
    if (v43 <= 0xB)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: malformed reply (too small) [ctx %p]\n");
      goto LABEL_10;
    }

    uint64_t v44 = v41 + v42;
    uint64_t v45 = _mdns_pack_domain_name(a5, v41 + v42, a11[4] - v42);
    if ((v45 & 0x80000000) != 0)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: name mismatch [ctx %p]\n");
      goto LABEL_10;
    }

    if (v43 < a8 + v45 + 10)
    {
      _mdns_debug_message(";; [%s type %hu class %hu]: insufficient buffer space for reply [ctx %p]\n");
      goto LABEL_10;
    }

    char v46 = a8;
    unint64_t v47 = v44 + v45;
    *(_WORD *)unint64_t v47 = __rev16(a6);
    *(_WORD *)(v47 + 2) = __rev16(a7);
    *(_DWORD *)(v47 + 4) = bswap32(v23);
    *(_WORD *)(v47 + 8) = __rev16(a8);
    size_t v48 = v47 + 10;
    memcpy((void *)(v47 + 10), v22, v46);
    *(_WORD *)(a11[2] + 6LL) = bswap32((bswap32(*(_DWORD *)(a11[2] + 6LL)) >> 16) + 1) >> 16;
    a11[3] = v48 + v46 - a11[2];
  }

  _mdns_debug_message(";; [%s type %hu class %hu] reply [ctx %p]\n");
LABEL_10:
  if (*((_DWORD *)a11 + 18) != -1)
  {
    _mdns_debug_message(";; _mdns_query_callback sending kevent wakeup\n");
    changelist.ident = 1LL;
    *(void *)&changelist.filter = 0x10000000000FFF6LL;
    changelist.data = 0LL;
    changelist.udata = 0LL;
    if (kevent(*((_DWORD *)a11 + 18), &changelist, 1, 0LL, 0, 0LL))
    {
      unsigned int v20 = __error();
      unsigned int v21 = strerror(*v20);
      _mdns_debug_message(";; kevent EV_TRIGGER: %s [ctx %p]\n", v21, a11);
    }
  }

  unsigned int v33 = v31;
  unsigned int v32 = si_host_byname(a1);
  LOBYTE(v31) = v30;
LABEL_33:
  if (v32) {
    unsigned int v34 = 0;
  }
  else {
    unsigned int v34 = v29;
  }
  if (a3 != 2 && (v31 & 1) == 0 && !v34)
  {
    uint64_t v9 = 0LL;
LABEL_44:
    if (v33)
    {
      si_item_release((unsigned int *)v9);
      if (!a6) {
        return v32;
      }
      uint64_t v9 = v32;
      if (v32) {
        return v9;
      }
      goto LABEL_51;
    }

    if (!(v32 | v9))
    {
LABEL_49:
      if (a6)
      {
        uint64_t v9 = 0LL;
LABEL_51:
        unsigned int v35 = 1;
LABEL_77:
        *a6 = v35;
        return v9;
      }

      return 0LL;
    }

    int v36 = (void **)calloc(1uLL, 0x30uLL);
    if (v36)
    {
      int v37 = v36;
      if (v9)
      {
        char *v36 = (void *)lower_case(*(const char **)(v9 + 32));
        int v38 = *(const char ***)(v9 + 40);
        if (v38)
        {
          __darwin_time_t v39 = *v38;
          if (*v38)
          {
            uint64_t v40 = 8LL;
            do
            {
              merge_alias(v39, (uint64_t)v37);
              __darwin_time_t v39 = *(const char **)(*(void *)(v9 + 40) + v40);
              v40 += 8LL;
            }

            while (v39);
          }
        }

        unint64_t v41 = *(_DWORD ***)(v9 + 56);
        if (*v41)
        {
          int v42 = 8LL;
          do
          {
            *(void *)&unsigned int v56 = 0LL;
            DWORD2(v56) = -65536;
            HIDWORD(v56) = **v41;
            append_addr(&v56, (uint64_t)v37);
            unint64_t v41 = (_DWORD **)(*(void *)(v9 + 56) + v42);
            v42 += 8LL;
          }

          while (*v41);
        }
      }

      if (v32)
      {
        if (!*v37) {
          unsigned int *v37 = (void *)lower_case(*(const char **)(v32 + 32));
        }
        uint64_t v43 = *(const char ***)(v32 + 40);
        if (v43)
        {
          uint64_t v44 = *v43;
          if (*v43)
          {
            uint64_t v45 = 8LL;
            do
            {
              merge_alias(v44, (uint64_t)v37);
              uint64_t v44 = *(const char **)(*(void *)(v32 + 40) + v45);
              v45 += 8LL;
            }

            while (v44);
          }
        }

        char v46 = **(_OWORD ***)(v32 + 56);
        if (v46)
        {
          unint64_t v47 = 8LL;
          do
          {
            append_addr(v46, (uint64_t)v37);
            char v46 = *(_OWORD **)(*(void *)(v32 + 56) + v47);
            v47 += 8LL;
          }

          while (v46);
        }
      }

      si_item_release((unsigned int *)v9);
      si_item_release((unsigned int *)v32);
      uint64_t v9 = (uint64_t)LI_ils_create("L4488s*44c", v48, v49, v50, v51, v52, v53, v54, a1);
      free_build_hostent(v37);
      return v9;
    }

    si_item_release((unsigned int *)v9);
    si_item_release((unsigned int *)v32);
LABEL_74:
    if (a6)
    {
      uint64_t v9 = 0LL;
LABEL_76:
      unsigned int v35 = 3;
      goto LABEL_77;
    }

    return 0LL;
  }

  uint64_t v9 = si_host_byname(a1);
  if (a3 != 2) {
    goto LABEL_44;
  }
  si_item_release((unsigned int *)v32);
  if (a6 && !v9) {
    goto LABEL_51;
  }
  return v9;
}

void kvarray_free(void *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1)
    {
      unint64_t v2 = 0LL;
      do
      {
        uint64_t v3 = a1[1];
        if (*(_DWORD *)(v3 + 32 * v2))
        {
          unint64_t v4 = 0LL;
          do
          {
            uint64_t v5 = *(void *)(v3 + 32 * v2 + 24);
            if (v5)
            {
              unsigned int v6 = *(void **)(v5 + 8 * v4);
              if (v6)
              {
                free(v6);
                uint64_t v3 = a1[1];
              }
            }

            ++v4;
          }

          while (v4 < *(unsigned int *)(v3 + 32 * v2));
        }

        uint64_t v7 = *(void **)(v3 + 32 * v2 + 8);
        if (v7)
        {
          free(v7);
          uint64_t v3 = a1[1];
        }

        size_t v8 = *(void **)(v3 + 32 * v2 + 16);
        if (v8)
        {
          free(v8);
          uint64_t v3 = a1[1];
        }

        uint64_t v9 = *(void **)(v3 + 32 * v2 + 24);
        if (v9) {
          free(v9);
        }
        ++v2;
      }

      while (v2 < *(unsigned int *)a1);
    }

    *(_DWORD *)a1 = 0;
    uint64_t v10 = (void *)a1[1];
    if (v10) {
      free(v10);
    }
    a1[1] = 0LL;
    unsigned int v11 = (void *)a1[2];
    if (v11) {
      kvbuf_free(v11);
    }
    free(a1);
  }

void *si_search()
{
  double result = (void *)si_search_search;
  if (!si_search_search)
  {
    double result = si_module_with_name("search");
    si_search_search = (uint64_t)result;
  }

  return result;
}

uint64_t si_search_module_set_flags(char *__s1, int a2)
{
  unint64_t v4 = (void *)si_search_search;
  if (!si_search_search)
  {
    unint64_t v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }

  return search_set_flags((uint64_t)v4, __s1, a2);
}

passwd *__cdecl getpwnam(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_user_byname((uint64_t)v1);
  LI_set_thread_item(101, v2);
  if (v2) {
    return (passwd *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void si_libinfo_general_callback(unsigned int *a1, int a2, unsigned int *a3)
{
  if (a3)
  {
    if (a2 == 15 || !*(void *)a3)
    {
      free(a3);
      si_item_release(a1);
    }

    else
    {
      unsigned int v5 = a3[5];
      if ((v5 & 0x80000000) == 0) {
        LI_set_thread_item(a3[4] + v5, (uint64_t)a1);
      }
      unsigned int v6 = a3[4];
      if (v6 <= 0xC && ((1 << v6) & 0x1FCE) != 0)
      {
        if (a1) {
          uint64_t v7 = a1 + 8;
        }
        else {
          uint64_t v7 = 0LL;
        }
        (*(void (**)(unsigned int *, void))a3)(v7, *((void *)a3 + 1));
      }

      free(a3);
    }
  }

passwd *__cdecl getpwuid(uid_t a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_user_byuid((uint64_t)v1);
  LI_set_thread_item(201, v2);
  if (v2) {
    return (passwd *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

passwd *__cdecl getpwuuid(uuid_t a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_user_byuuid((uint64_t)v1);
  LI_set_thread_item(301, v2);
  if (v2) {
    return (passwd *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void setpwent(void)
{
}

passwd *getpwent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(1);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_user_all((uint64_t)v1);
    LI_set_thread_list(1, thread_list);
  }

  uint64_t v2 = si_list_next(thread_list);
  if (v2) {
    return (passwd *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void endpwent(void)
{
}

int setpassent(int a1)
{
  uint64_t thread_list = LI_get_thread_list(1);
  si_list_reset((uint64_t)thread_list);
  return thread_list != 0LL;
}

group *__cdecl getgrnam(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = (group *)si_group_byname((uint64_t)v1);
  LI_set_thread_item(102, (uint64_t)v2);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

group *__cdecl getgrgid(gid_t a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = (group *)si_group_bygid((uint64_t)v1);
  LI_set_thread_item(202, (uint64_t)v2);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

group *__cdecl getgruuid(uuid_t a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = (group *)si_group_byuuid((uint64_t)v1);
  LI_set_thread_item(302, (uint64_t)v2);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void setgrent(void)
{
}

group *getgrent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(2);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_group_all((uint64_t)v1);
    LI_set_thread_list(2, thread_list);
  }

  uint64_t v2 = (group *)si_list_next(thread_list);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void endgrent(void)
{
}

int setgroupent(int a1)
{
  uint64_t thread_list = LI_get_thread_list(2);
  si_list_reset((uint64_t)thread_list);
  return thread_list != 0LL;
}

int innetgr(const char *a1, const char *a2, const char *a3, const char *a4)
{
  unint64_t v4 = (void *)si_search_search;
  if (!si_search_search)
  {
    unint64_t v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }

  return si_in_netgroup((uint64_t)v4);
}

void setnetgrent(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_netgroup_byname((uint64_t)v1);
  LI_set_thread_list(4, v2);
}

int getnetgrent(char **a1, char **a2, char **a3)
{
  uint64_t thread_list = LI_get_thread_list(4);
  uint64_t v7 = (char **)si_list_next((uint64_t)thread_list);
  if (v7)
  {
    *a1 = v7[4];
    *a2 = v7[5];
    *a3 = v7[6];
    LODWORD(v7) = 1;
  }

  return (int)v7;
}

void endnetgrent(void)
{
}

uint64_t getgrouplist_internal(uint64_t a1, int a2, int *a3, int *a4)
{
  uint64_t result = 0LL;
  if (a1 && a3 && a4)
  {
    int v8 = *a4;
    *a4 = 0;
    if (v8 >= 1)
    {
      *a3 = a2;
      *a4 = 1;
      uint64_t v9 = (void *)si_search_search;
      if (!si_search_search)
      {
        uint64_t v9 = si_module_with_name("search");
        si_search_search = (uint64_t)v9;
      }

      uint64_t v10 = si_grouplist((uint64_t)v9);
      LI_set_thread_item(3, v10);
      if (v10)
      {
        int v11 = *(_DWORD *)(v10 + 40);
        if (v11 >= 1)
        {
          uint64_t v12 = 0LL;
          uint64_t v13 = *(void *)(v10 + 48);
          int v14 = 1;
          do
          {
            int v15 = *(_DWORD *)(v13 + 4 * v12);
            if (v14 < 1)
            {
LABEL_14:
              if (v14 >= v8) {
                return 0xFFFFFFFFLL;
              }
              a3[v14++] = v15;
              *a4 = v14;
              int v11 = *(_DWORD *)(v10 + 40);
            }

            else
            {
              uint64_t v16 = v14;
              uint64_t v17 = a3;
              while (1)
              {
                int v18 = *v17++;
                if (v18 == v15) {
                  break;
                }
                if (!--v16) {
                  goto LABEL_14;
                }
              }
            }

            ++v12;
          }

          while (v12 < v11);
        }
      }
    }

    return 0LL;
  }

  return result;
}

int getgrouplist_2(const char *a1, int a2, int *a3, int *a4)
{
  if (a1 && a3) {
    return _getgrouplist_2_internal((uint64_t)a1, a2, (int **)a3);
  }
  else {
    return 0;
  }
}

uint64_t _getgrouplist_2_internal(uint64_t a1, int a2, int **a3)
{
  unsigned int v5 = (void *)si_search_search;
  if (!si_search_search)
  {
    unsigned int v5 = si_module_with_name("search");
    si_search_search = (uint64_t)v5;
  }

  uint64_t v6 = si_grouplist((uint64_t)v5);
  LI_set_thread_item(3, v6);
  if (!v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = (int *)calloc(*(int *)(v6 + 40) + 1LL, 4uLL);
  if (!v7) {
    return 0xFFFFFFFFLL;
  }
  *uint64_t v7 = a2;
  uint64_t v8 = *(void *)(v6 + 48);
  if (v8 && (int v9 = *(_DWORD *)(v6 + 40), v9 >= 1))
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = 1LL;
    do
    {
      int v12 = *(_DWORD *)(v8 + 4 * v10);
      if ((int)v11 < 1)
      {
LABEL_12:
        v7[(int)v11] = v12;
        uint64_t v11 = (v11 + 1);
        int v9 = *(_DWORD *)(v6 + 40);
      }

      else
      {
        uint64_t v13 = v11;
        int v14 = v7;
        while (1)
        {
          int v15 = *v14++;
          if (v15 == v12) {
            break;
          }
          if (!--v13) {
            goto LABEL_12;
          }
        }
      }

      ++v10;
    }

    while (v10 < v9);
  }

  else
  {
    uint64_t v11 = 1LL;
  }

  *a3 = v7;
  return v11;
}

uint64_t getgroupcount(uint64_t a1, int a2)
{
  unint64_t v4 = 0LL;
  uint64_t v2 = _getgrouplist_2_internal(a1, a2, (int **)&v4);
  if (v4) {
    free(v4);
  }
  return v2;
}

int initgroups(const char *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  int v3 = 16;
  getgrouplist_internal((uint64_t)a1, a2, v4, &v3);
  return (int)__initgroups() >> 31;
}

aliasent *__cdecl alias_getbyname(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = (aliasent *)si_alias_byname((uint64_t)v1);
  LI_set_thread_item(105, (uint64_t)v2);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void alias_setent(void)
{
}

aliasent *alias_getent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(5);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_alias_all((uint64_t)v1);
    LI_set_thread_list(5, thread_list);
  }

  uint64_t v2 = (aliasent *)si_list_next(thread_list);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void alias_endent(void)
{
}

void freehostent(hostent *a1)
{
  if (a1) {
    si_item_release((unsigned int *)&a1[-1]);
  }
}

hostent *__cdecl gethostbyname(const char *a1)
{
  *(void *)&v8[0].in_addr_t s_addr = 0LL;
  int v2 = inet_aton(a1, v8);
  int v3 = (void *)si_search_search;
  if (v2 == 1)
  {
    if (!si_search_search)
    {
      int v3 = si_module_with_name("search");
      si_search_search = (uint64_t)v3;
    }

    uint64_t v4 = si_ipnode_byname((uint64_t)v3, (char *)a1, 2, 0, 0LL, (int *)&v8[1]);
  }

  else
  {
    if (!si_search_search)
    {
      int v3 = si_module_with_name("search");
      si_search_search = (uint64_t)v3;
    }

    uint64_t v4 = si_host_byname((uint64_t)v3);
  }

  uint64_t v5 = (hostent *)v4;
  in_addr_t s_addr = v8[1].s_addr;
  if (v8[1].s_addr >= 0xA)
  {
    in_addr_t s_addr = 3;
    v8[1].in_addr_t s_addr = 3;
  }

  h_errno = s_addr;
  LI_set_thread_item(106, v4);
  if (v5) {
    return v5 + 1;
  }
  else {
    return 0LL;
  }
}

void *gethostbyname_async_call(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = calloc(1uLL, 0x18uLL);
  if (result)
  {
    uint64_t v7 = (uint64_t)result;
    *uint64_t result = a2;
    result[1] = a3;
    result[2] = 0x6400000006LL;
    uint64_t v8 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v8 = si_module_with_name("search");
      si_search_search = (uint64_t)v8;
    }

    LODWORD(v9) = 0;
    return (void *)si_async_call( (uint64_t)v8,  11LL,  a1,  0LL,  0LL,  2LL,  0LL,  0LL,  v9,  (uint64_t)si_libinfo_general_callback,  v7);
  }

  return result;
}

hostent *__cdecl gethostbyname2(const char *a1, int a2)
{
  uint64_t v4 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v4 = si_module_with_name("search");
    si_search_search = (uint64_t)v4;
  }

  v10[1] = 0LL;
  *(void *)&v11[0].in_addr_t s_addr = 0LL;
  v10[0] = 0LL;
  if (a2 == 30)
  {
    int v5 = inet_pton(30, a1, v10);
  }

  else
  {
    if (a2 != 2) {
      goto LABEL_9;
    }
    int v5 = inet_aton(a1, v11);
  }

  if (v5 == 1)
  {
    uint64_t v6 = si_ipnode_byname((uint64_t)v4, (char *)a1, a2, 0, 0LL, (int *)&v11[1]);
    goto LABEL_10;
  }

LABEL_9:
  uint64_t v6 = si_host_byname((uint64_t)v4);
LABEL_10:
  uint64_t v7 = (hostent *)v6;
  in_addr_t s_addr = v11[1].s_addr;
  if (v11[1].s_addr >= 0xA)
  {
    in_addr_t s_addr = 3;
    v11[1].in_addr_t s_addr = 3;
  }

  h_errno = s_addr;
  LI_set_thread_item(106, v6);
  if (v7) {
    return v7 + 1;
  }
  else {
    return 0LL;
  }
}

  if ((getifaddrs(&v12) & 0x80000000) == 0)
  {
    net_v4_count = 0;
    net_v6_count = 0;
    if (v12)
    {
      int v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = v12;
      do
      {
        ifa_addr = v7->ifa_addr;
        if (ifa_addr && (v7->ifa_flags & 1) != 0)
        {
          sa_family = ifa_addr->sa_family;
          if (sa_family == 30)
          {
            net_v6_count = ++v5;
          }

          else if (sa_family == 2)
          {
            net_v4_count = ++v6;
          }
        }

        uint64_t v7 = v7->ifa_next;
      }

      while (v7);
    }

    freeifaddrs(v12);
LABEL_20:
    uint64_t v10 = 0LL;
    if (!a1) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }

  uint64_t v10 = 0xFFFFFFFFLL;
  if (a1) {
LABEL_21:
  }
    *a1 = net_v4_count;
LABEL_22:
  if (a2) {
    *a2 = net_v6_count;
  }
  pthread_mutex_unlock(&net_config_mutex);
  return v10;
}

hostent *__cdecl gethostbyaddr(const void *a1, socklen_t a2, int a3)
{
  int v3 = (void *)si_search_search;
  if (!si_search_search)
  {
    int v3 = si_module_with_name("search");
    si_search_search = (uint64_t)v3;
  }

  uint64_t v4 = (hostent *)si_host_byaddr((uint64_t)v3);
  h_errno = 0;
  LI_set_thread_item(206, (uint64_t)v4);
  if (v4) {
    return v4 + 1;
  }
  else {
    return 0LL;
  }
}

void *gethostbyaddr_async_call(char *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = calloc(1uLL, 0x18uLL);
  if (result)
  {
    uint64_t v11 = (uint64_t)result;
    *uint64_t result = a4;
    result[1] = a5;
    result[2] = 0xC800000006LL;
    int v12 = (void *)si_search_search;
    if (!si_search_search)
    {
      int v12 = si_module_with_name("search");
      si_search_search = (uint64_t)v12;
    }

    LODWORD(v13) = 0;
    return (void *)si_async_call( (uint64_t)v12,  12LL,  a1,  0LL,  0LL,  a3,  0LL,  a2,  v13,  (uint64_t)si_libinfo_general_callback,  v11);
  }

  return result;
}

hostent *__cdecl getipnodebyname(const char *a1, int a2, int a3, int *a4)
{
  __int16 v5 = a3;
  unsigned int v12 = 0;
  uint64_t v8 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v8 = si_module_with_name("search");
    si_search_search = (uint64_t)v8;
  }

  uint64_t v9 = (hostent *)si_ipnode_byname((uint64_t)v8, (char *)a1, a2, v5, 0LL, (int *)&v12);
  if (a4)
  {
    int v10 = v12;
    if (v12 > 9) {
      int v10 = 3;
    }
    *a4 = v10;
  }

  if (v9) {
    return v9 + 1;
  }
  else {
    return 0LL;
  }
}

hostent *__cdecl getipnodebyaddr(const void *a1, size_t a2, int a3, int *a4)
{
  if (a2 == 16 && a3 == 30 && a1)
  {
    uint64_t v4 = 0LL;
    while (!*((_BYTE *)a1 + v4))
    {
      if (++v4 == 10)
      {
        break;
      }
    }

    for (uint64_t i = 0LL; i != 12; ++i)
    {
      if (*((_BYTE *)a1 + i)) {
        break;
      }
    }
  }

LABEL_12:
  uint64_t v6 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v6 = si_module_with_name("search");
    si_search_search = (uint64_t)v6;
  }

  uint64_t v7 = (hostent *)si_host_byaddr((uint64_t)v6);
  if (v7) {
    return v7 + 1;
  }
  else {
    return 0LL;
  }
}

    --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    return 1LL;
  }

  uint64_t v8 = xpc_string_get_string_ptr(a3);
  if (v8) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 32LL) = v8;
  }
  return 1LL;
}

void sethostent(int a1)
{
}

hostent *gethostent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(6);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_host_all((uint64_t)v1);
    LI_set_thread_list(6, thread_list);
  }

  int v2 = (hostent *)si_list_next(thread_list);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void endhostent(void)
{
}

int ether_hostton(const char *a1, ether_addr *a2)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  int result = -1;
  if (a1 && a2)
  {
    __int16 v5 = (void *)si_search_search;
    if (!si_search_search)
    {
      __int16 v5 = si_module_with_name("search");
      si_search_search = (uint64_t)v5;
    }

    uint64_t v6 = si_mac_byname((uint64_t)v5);
    LI_set_thread_item(113, v6);
    if (v6 && sscanf(*(const char **)(v6 + 40), " %x:%x:%x:%x:%x:%x", v8, &v8[1], &v8[2], &v8[3], &v8[4], &v8[5]) == 6)
    {
      for (uint64_t i = 0LL; i != 6; ++i)
        a2->octet[i] = v8[i];
      return 0;
    }

    else
    {
      return -1;
    }
  }

  return result;
}

int ether_ntohost(char *a1, const ether_addr *a2)
{
  uint64_t v11 = *MEMORY[0x1895FEE08];
  int result = -1;
  if (a1 && a2)
  {
    for (uint64_t i = 0LL; i != 6; ++i)
      v10[i] = a2->octet[i];
    snprintf(__str, 0x100uLL, "%x:%x:%x:%x:%x:%x", v10[0], v10[1], v10[2], v10[3], v10[4], v10[5]);
    __int16 v5 = (void *)si_search_search;
    if (!si_search_search)
    {
      __int16 v5 = si_module_with_name("search");
      si_search_search = (uint64_t)v5;
    }

    uint64_t v6 = si_mac_bymac((uint64_t)v5);
    LI_set_thread_item(213, v6);
    if (v6)
    {
      uint64_t v7 = *(const char **)(v6 + 32);
      size_t v8 = strlen(v7);
      memcpy(a1, v7, v8 + 1);
      return 0;
    }

    else
    {
      return -1;
    }
  }

  return result;
}

netent *__cdecl getnetbyname(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_network_byname((uint64_t)v1);
  LI_set_thread_item(108, v2);
  if (v2) {
    return (netent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

netent *__cdecl getnetbyaddr(uint32_t a1, int a2)
{
  if (a2 != 2) {
    return 0LL;
  }
  uint64_t v2 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }

  uint64_t v3 = si_network_byaddr((uint64_t)v2);
  LI_set_thread_item(208, v3);
  if (v3) {
    return (netent *)(v3 + 32);
  }
  else {
    return 0LL;
  }
}

void setnetent(int a1)
{
}

netent *getnetent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(8);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_network_all((uint64_t)v1);
    LI_set_thread_list(8, thread_list);
  }

  uint64_t v2 = si_list_next(thread_list);
  if (v2) {
    return (netent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void endnetent(void)
{
}

servent *__cdecl getservbyname(const char *a1, const char *a2)
{
  uint64_t v2 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }

  uint64_t v3 = (servent *)si_service_byname((uint64_t)v2);
  LI_set_thread_item(109, (uint64_t)v3);
  if (v3) {
    return v3 + 1;
  }
  else {
    return 0LL;
  }
}

servent *__cdecl getservbyport(int a1, const char *a2)
{
  uint64_t v2 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v2 = si_module_with_name("search");
    si_search_search = (uint64_t)v2;
  }

  uint64_t v3 = (servent *)si_service_byport((uint64_t)v2);
  LI_set_thread_item(209, (uint64_t)v3);
  if (v3) {
    return v3 + 1;
  }
  else {
    return 0LL;
  }
}

void setservent(int a1)
{
}

servent *getservent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(9);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_service_all((uint64_t)v1);
    LI_set_thread_list(9, thread_list);
  }

  uint64_t v2 = (servent *)si_list_next(thread_list);
  if (v2) {
    return v2 + 1;
  }
  else {
    return 0LL;
  }
}

void endservent(void)
{
}

protoent *__cdecl getprotobyname(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_protocol_byname((uint64_t)v1);
  LI_set_thread_item(110, v2);
  if (v2) {
    return (protoent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

protoent *__cdecl getprotobynumber(int a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_protocol_bynumber((uint64_t)v1);
  LI_set_thread_item(210, v2);
  if (v2) {
    return (protoent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void setprotoent(int a1)
{
}

protoent *getprotoent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(10);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_protocol_all((uint64_t)v1);
    LI_set_thread_list(10, thread_list);
  }

  uint64_t v2 = si_list_next(thread_list);
  if (v2) {
    return (protoent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void endprotoent(void)
{
}

rpcent *__cdecl getrpcbyname(const char *name)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_rpc_byname((uint64_t)v1);
  LI_set_thread_item(111, v2);
  if (v2) {
    return (rpcent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

rpcent *__cdecl getrpcbynumber(int number)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_rpc_bynumber((uint64_t)v1);
  LI_set_thread_item(211, v2);
  if (v2) {
    return (rpcent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void setrpcent(int stayopen)
{
}

rpcent *getrpcent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(11);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_rpc_all((uint64_t)v1);
    LI_set_thread_list(11, thread_list);
  }

  uint64_t v2 = si_list_next(thread_list);
  if (v2) {
    return (rpcent *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void endrpcent(void)
{
}

fstab *__cdecl getfsspec(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_fs_byspec((uint64_t)v1);
  LI_set_thread_item(112, v2);
  if (v2) {
    return (fstab *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

fstab *__cdecl getfsfile(const char *a1)
{
  uint64_t v1 = (void *)si_search_search;
  if (!si_search_search)
  {
    uint64_t v1 = si_module_with_name("search");
    si_search_search = (uint64_t)v1;
  }

  uint64_t v2 = si_fs_byfile((uint64_t)v1);
  LI_set_thread_item(212, v2);
  if (v2) {
    return (fstab *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

int setfsent(void)
{
  return 1;
}

fstab *getfsent(void)
{
  uint64_t thread_list = (uint64_t)LI_get_thread_list(12);
  if (!thread_list)
  {
    uint64_t v1 = (void *)si_search_search;
    if (!si_search_search)
    {
      uint64_t v1 = si_module_with_name("search");
      si_search_search = (uint64_t)v1;
    }

    uint64_t thread_list = si_fs_all((uint64_t)v1);
    LI_set_thread_list(12, thread_list);
  }

  uint64_t v2 = si_list_next(thread_list);
  if (v2) {
    return (fstab *)(v2 + 32);
  }
  else {
    return 0LL;
  }
}

void endfsent(void)
{
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  int v17 = 0;
  if (!a4) {
    return 0;
  }
  *a4 = 0LL;
  if (!a3)
  {
    unsigned int ai_protocol = 0;
    uint64_t ai_socktype = 0LL;
    unsigned int ai_family = 0;
LABEL_7:
    int ai_flags = 1536;
    goto LABEL_8;
  }

  uint64_t ai_socktype = a3->ai_socktype;
  unsigned int ai_protocol = a3->ai_protocol;
  int ai_flags = a3->ai_flags;
  unsigned int ai_family = a3->ai_family;
  if (!a3->ai_flags) {
    goto LABEL_7;
  }
LABEL_8:
  unsigned int v12 = (void *)si_search_search;
  if (!si_search_search)
  {
    unsigned int v12 = si_module_with_name("search");
    si_search_search = (uint64_t)v12;
  }

  uint64_t v13 = (addrinfo *)si_addrinfo((uint64_t)v12, a1, a2, ai_family, ai_socktype, ai_protocol, ai_flags, 0LL, &v17);
  uint64_t v14 = (uint64_t)v13;
  if (!v17 && v13 && v13->ai_family)
  {
    *a4 = si_list_to_addrinfo(v13);
    si_list_release(v14);
    int v15 = *a4;
    if (!v15) {
      return 6;
    }
    if ((ai_flags & 2) == 0)
    {
      do
      {
        free(v15->ai_canonname);
        v15->ai_canonname = 0LL;
        int v15 = v15->ai_next;
      }

      while (v15);
    }

    return v17;
  }

  else
  {
    si_list_release((uint64_t)v13);
    else {
      int v16 = 4;
    }
    if (v17) {
      return v16;
    }
    else {
      return 8;
    }
  }

void *_getaddrinfo_interface_async_call( char *a1, char *a2, int *a3, const char *a4, uint64_t a5, uint64_t a6)
{
  if (a3)
  {
    uint64_t v11 = a3[2];
    size_t v12 = a3[3];
    int v14 = *a3;
    uint64_t v13 = a3[1];
  }

  else
  {
    uint64_t v13 = 0LL;
    uint64_t v11 = 0LL;
    size_t v12 = 0LL;
    int v14 = 0;
  }

  int result = calloc(1uLL, 0x18uLL);
  if (result)
  {
    uint64_t v16 = (uint64_t)result;
    if (!v14) {
      int v14 = 1536;
    }
    *int result = a5;
    result[1] = a6;
    result[2] = 15LL;
    int v17 = (void *)si_search_search;
    if (!si_search_search)
    {
      int v17 = si_module_with_name("search");
      si_search_search = (uint64_t)v17;
    }

    LODWORD(v18) = v14;
    return (void *)si_async_call( (uint64_t)v17,  29LL,  a1,  a2,  a4,  v13,  v11,  v12,  v18,  (uint64_t)si_libinfo_addrinfo_callback,  v16);
  }

  return result;
}

void si_libinfo_addrinfo_callback( addrinfo *a1, int a2, void (**a3)(uint64_t, addrinfo *, uint64_t))
{
  if (!a3)
  {
    si_list_release((uint64_t)a1);
    return;
  }

  if (a2 != 15)
  {
    __int16 v5 = *a3;
    if (*a3)
    {
      else {
        unsigned int v6 = 4;
      }
      if (a2) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0LL;
      }
      if (a1)
      {
        size_t v8 = si_list_to_addrinfo(a1);
        si_list_release((uint64_t)a1);
        __int16 v5 = *a3;
        uint64_t v9 = a3[1];
        if (v8)
        {
          uint64_t v10 = v7;
          uint64_t v11 = v8;
LABEL_18:
          v5(v10, v11, (uint64_t)v9);
          goto LABEL_19;
        }

        uint64_t v10 = 6LL;
      }

      else
      {
        uint64_t v9 = a3[1];
        uint64_t v10 = 8LL;
      }

      uint64_t v11 = 0LL;
      goto LABEL_18;
    }
  }

  si_list_release((uint64_t)a1);
LABEL_19:
  free(a3);
}

uint64_t getaddrinfo_async_start(unsigned int *a1, char *a2, char *a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 11LL;
  if (a1)
  {
    unsigned int v8 = _getaddrinfo_interface_async_call(a2, a3, a4, 0LL, a5, a6);
    *a1 = v8;
    if (v8) {
      return 0LL;
    }
    else {
      return 11LL;
    }
  }

  return v6;
}

uint64_t getaddrinfo_async_send(unsigned int *a1, char *a2, char *a3, int *a4)
{
  uint64_t v4 = 11LL;
  if (a1)
  {
    unsigned int v6 = _getaddrinfo_interface_async_call(a2, a3, a4, 0LL, 0LL, 0LL);
    *a1 = v6;
    if (v6) {
      return 0LL;
    }
    else {
      return 11LL;
    }
  }

  return v4;
}

uint64_t getaddrinfo_async_receive()
{
  return 11LL;
}

uint64_t getaddrinfo_async_handle_reply(uint64_t a1)
{
  return 0LL;
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  if (!a1) {
    return 4;
  }
  if (a1->sa_family == 18) {
    return getnameinfo_link((uint64_t)a1, a2, a3, a4, a5, a6);
  }
  int v33 = 0;
  if (a3) {
    BOOL v15 = a4 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (a5) {
    BOOL v17 = a6 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  int v18 = !v17;
  if ((v16 & 1) != 0 || (int v14 = 0, v18))
  {
    unsigned int v19 = a7 | 2;
    if (v16) {
      unsigned int v19 = a7;
    }
    if (v18) {
      uint64_t v20 = v19;
    }
    else {
      uint64_t v20 = v19 | 8;
    }
    unsigned int v21 = (void *)si_search_search;
    if (!si_search_search)
    {
      unsigned int v21 = si_module_with_name("search");
      si_search_search = (uint64_t)v21;
    }

    unsigned int v22 = si_nameinfo((uint64_t)v21, (uint64_t)a1, v20, 0LL, &v33, *(uint64_t *)&a6, *(uint64_t *)&a7, v7);
    unsigned int v23 = v22;
    if (v33 || !v22)
    {
      si_item_release((unsigned int *)v22);
      else {
        int v32 = 4;
      }
      if (v33) {
        return v32;
      }
      else {
        return 8;
      }
    }

    unsigned int v24 = (const char *)*((void *)v22 + 4);
    if (v24)
    {
      int v25 = strlen(v24);
      size_t v26 = (v25 + 1);
      int v27 = v25 == -1 ? 0 : v16;
      if (v27 == 1)
      {
        if (v26 > a4)
        {
LABEL_41:
          int v14 = 14;
LABEL_50:
          si_item_release((unsigned int *)v23);
          return v14;
        }

        bzero(a3, a4);
        memcpy(a3, *((const void **)v23 + 4), v26);
      }
    }

    unsigned int v28 = (const char *)*((void *)v23 + 5);
    if (v28)
    {
      int v29 = strlen(v28);
      size_t v30 = (v29 + 1);
      int v31 = v29 == -1 ? 0 : v18;
      if (v31 == 1)
      {
        bzero(a5, a6);
        memcpy(a5, *((const void **)v23 + 5), v30);
      }
    }

    int v14 = 0;
    goto LABEL_50;
  }

  return v14;
}

void *_getnameinfo_interface_async_call( char *a1, size_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6)
{
  int result = calloc(1uLL, 0x18uLL);
  if (result)
  {
    uint64_t v13 = (uint64_t)result;
    *int result = a5;
    result[1] = a6;
    result[2] = 15LL;
    int v14 = (void *)si_search_search;
    if (!si_search_search)
    {
      int v14 = si_module_with_name("search");
      si_search_search = (uint64_t)v14;
    }

    LODWORD(v15) = 0;
    return (void *)si_async_call( (uint64_t)v14,  30LL,  a1,  0LL,  a4,  a3,  0LL,  a2,  v15,  (uint64_t)si_libinfo_nameinfo_callback,  v13);
  }

  return result;
}

void si_libinfo_nameinfo_callback( uint64_t a1, int a2, void (**a3)(uint64_t, char *, char *, uint64_t))
{
  if (a3)
  {
    if (a2 == 15 || (__int16 v5 = *a3) == 0LL)
    {
      si_item_release((unsigned int *)a1);
    }

    else
    {
      else {
        unsigned int v6 = 4;
      }
      if (a2) {
        uint64_t v7 = v6;
      }
      else {
        uint64_t v7 = 0LL;
      }
      if (a1)
      {
        LI_set_thread_item(14, a1);
        unsigned int v8 = *(const char **)(a1 + 32);
        if (v8) {
          uint64_t v9 = strdup(v8);
        }
        else {
          uint64_t v9 = 0LL;
        }
        int v14 = *(const char **)(a1 + 40);
        if (v14) {
          uint64_t v13 = strdup(v14);
        }
        else {
          uint64_t v13 = 0LL;
        }
        __int16 v5 = *a3;
        uint64_t v10 = a3[1];
        uint64_t v11 = v7;
        size_t v12 = v9;
      }

      else
      {
        uint64_t v10 = a3[1];
        uint64_t v11 = v7;
        size_t v12 = 0LL;
        uint64_t v13 = 0LL;
      }

      v5(v11, v12, v13, (uint64_t)v10);
    }

    free(a3);
  }

uint64_t getnameinfo_async_start(unsigned int *a1, char *a2, size_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = 11LL;
  if (a1)
  {
    unsigned int v8 = _getnameinfo_interface_async_call(a2, a3, a4, 0LL, a5, a6);
    *a1 = v8;
    if (v8) {
      return 0LL;
    }
    else {
      return 11LL;
    }
  }

  return v6;
}

uint64_t getnameinfo_async_send(unsigned int *a1, char *a2, size_t a3, uint64_t a4)
{
  uint64_t v4 = 11LL;
  if (a1)
  {
    unsigned int v6 = _getnameinfo_interface_async_call(a2, a3, a4, 0LL, 0LL, 0LL);
    *a1 = v6;
    if (v6) {
      return 0LL;
    }
    else {
      return 11LL;
    }
  }

  return v4;
}

uint64_t getnameinfo_async_handle_reply(uint64_t a1)
{
  return 0LL;
}

int getgrnam_r(const char *a1, group *a2, char *a3, size_t a4, group **a5)
{
  if (a5)
  {
    *a5 = 0LL;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        int v9 = a4;
        if (a4)
        {
          uint64_t v10 = (void *)si_search_search;
          if (!si_search_search)
          {
            uint64_t v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }

          uint64_t v7 = si_group_byname((uint64_t)v10);
          if (v7)
          {
            uint64_t v11 = (unsigned int *)v7;
            int v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }

            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 34;
  }

  return v7;
}

uint64_t copy_group_r(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v8 = *(const char **)a1;
  if (v8) {
    int v9 = strlen(v8) + 1;
  }
  else {
    int v9 = 0;
  }
  uint64_t v11 = *(const char **)(a1 + 8);
  if (v11) {
    v9 += strlen(v11) + 1;
  }
  int v12 = v9 + 8;
  uint64_t v13 = *(const char ***)(a1 + 24);
  if (v13 && (int v14 = *v13) != 0LL)
  {
    uint64_t v15 = 0LL;
    int v16 = v13 + 1;
    do
    {
      uint64_t v17 = v15;
      v12 += strlen(v14) + 9;
      ++v15;
      int v14 = v16[v17];
    }

    while (v14);
  }

  else
  {
    LODWORD(v15) = 0;
  }

  if (v12 > a4) {
    return 0xFFFFFFFFLL;
  }
  *(void *)a2 = 0LL;
  if (*(void *)a1)
  {
    *(void *)a2 = a3;
    int v18 = strlen(*(const char **)a1) + 1;
    memmove(a3, *(const void **)a1, v18);
    a3 = (void *)((char *)a3 + v18);
  }

  *(void *)(a2 + 8) = 0LL;
  if (*(void *)(a1 + 8))
  {
    *(void *)(a2 + 8) = a3;
    int v19 = strlen(*(const char **)(a1 + 8)) + 1;
    memmove(a3, *(const void **)(a1 + 8), v19);
    a3 = (void *)((char *)a3 + v19);
  }

  *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  *(void *)(a2 + 24) = 0LL;
  if (*(void *)(a1 + 24))
  {
    *(void *)(a2 + 24) = a3;
    if ((_DWORD)v15)
    {
      unint64_t v20 = 0LL;
      unsigned int v21 = (char *)&a3[(v15 + 1)];
      uint64_t v22 = 8LL * v15;
      do
      {
        a3[v20 / 8] = v21;
        int v23 = strlen(*(const char **)(*(void *)(a1 + 24) + v20)) + 1;
        memmove(v21, *(const void **)(*(void *)(a1 + 24) + v20), v23);
        v21 += v23;
        v20 += 8LL;
      }

      while (v22 != v20);
      a3 = (void *)((char *)a3 + v20);
    }
  }

  uint64_t result = 0LL;
  *a3 = 0LL;
  return result;
}

int getgrgid_r(gid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  if (a5)
  {
    *a5 = 0LL;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        int v9 = a4;
        if (a4)
        {
          uint64_t v10 = (void *)si_search_search;
          if (!si_search_search)
          {
            uint64_t v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }

          uint64_t v7 = si_group_bygid((uint64_t)v10);
          if (v7)
          {
            uint64_t v11 = (unsigned int *)v7;
            int v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }

            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 34;
  }

  return v7;
}

int getgruuid_r(uuid_t a1, group *a2, char *a3, size_t a4, group **a5)
{
  if (a5)
  {
    *a5 = 0LL;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        int v9 = a4;
        if (a4)
        {
          uint64_t v10 = (void *)si_search_search;
          if (!si_search_search)
          {
            uint64_t v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }

          uint64_t v7 = si_group_byuuid((uint64_t)v10);
          if (v7)
          {
            uint64_t v11 = (unsigned int *)v7;
            int v12 = copy_group_r(v7 + 32, (uint64_t)a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }

            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 34;
  }

  return v7;
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  if (a5)
  {
    *a5 = 0LL;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        int v9 = a4;
        if (a4)
        {
          uint64_t v10 = (void *)si_search_search;
          if (!si_search_search)
          {
            uint64_t v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }

          uint64_t v7 = si_user_byname((uint64_t)v10);
          if (v7)
          {
            uint64_t v11 = (unsigned int *)v7;
            int v12 = copy_user_r(v7 + 32, a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }

            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 34;
  }

  return v7;
}

uint64_t copy_user_r(uint64_t a1, void *a2, char *a3, int a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v8 = *(const char **)a1;
  if (v8) {
    int v9 = strlen(v8) + 1;
  }
  else {
    int v9 = 0;
  }
  uint64_t v11 = *(const char **)(a1 + 8);
  if (v11) {
    v9 += strlen(v11) + 1;
  }
  int v12 = *(const char **)(a1 + 32);
  if (v12) {
    v9 += strlen(v12) + 1;
  }
  uint64_t v13 = *(const char **)(a1 + 40);
  if (v13) {
    v9 += strlen(v13) + 1;
  }
  int v14 = *(const char **)(a1 + 48);
  if (v14) {
    v9 += strlen(v14) + 1;
  }
  uint64_t v15 = *(const char **)(a1 + 56);
  if (v15) {
    v9 += strlen(v15) + 1;
  }
  if (v9 > a4) {
    return 0xFFFFFFFFLL;
  }
  *a2 = 0LL;
  if (*(void *)a1)
  {
    *a2 = a3;
    int v16 = strlen(*(const char **)a1) + 1;
    memmove(a3, *(const void **)a1, v16);
    a3 += v16;
  }

  a2[1] = 0LL;
  if (*(void *)(a1 + 8))
  {
    a2[1] = a3;
    int v17 = strlen(*(const char **)(a1 + 8)) + 1;
    memmove(a3, *(const void **)(a1 + 8), v17);
    a3 += v17;
  }

  a2[2] = *(void *)(a1 + 16);
  a2[4] = 0LL;
  uint64_t v18 = *(void *)(a1 + 32);
  a2[3] = *(void *)(a1 + 24);
  if (v18)
  {
    a2[4] = a3;
    int v19 = strlen(*(const char **)(a1 + 32)) + 1;
    memmove(a3, *(const void **)(a1 + 32), v19);
    a3 += v19;
  }

  a2[5] = 0LL;
  if (*(void *)(a1 + 40))
  {
    a2[5] = a3;
    int v20 = strlen(*(const char **)(a1 + 40)) + 1;
    memmove(a3, *(const void **)(a1 + 40), v20);
    a3 += v20;
  }

  a2[6] = 0LL;
  if (*(void *)(a1 + 48))
  {
    a2[6] = a3;
    int v21 = strlen(*(const char **)(a1 + 48)) + 1;
    memmove(a3, *(const void **)(a1 + 48), v21);
    a3 += v21;
  }

  a2[7] = 0LL;
  if (*(void *)(a1 + 56))
  {
    a2[7] = a3;
    int v22 = strlen(*(const char **)(a1 + 56));
    memmove(a3, *(const void **)(a1 + 56), v22 + 1);
  }

  uint64_t result = 0LL;
  a2[8] = *(void *)(a1 + 64);
  return result;
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  if (!a5)
  {
    LODWORD(v8) = 34;
    return v8;
  }

  *a5 = 0LL;
  LODWORD(v8) = 34;
  if (a2)
  {
    if (a3)
    {
      int v10 = a4;
      if (a4)
      {
        if (a1 <= 0x1F3)
        {
          uint64_t v11 = (void *)si_search_cache_file_search;
          if (!si_search_cache_file_search)
          {
            uint64_t v11 = si_module_with_name("cache_file");
            si_search_cache_file_search = (uint64_t)v11;
          }

          int v12 = (unsigned int *)si_user_byuid((uint64_t)v11);
          if (v12) {
            goto LABEL_21;
          }
          uint64_t v13 = (void *)si_search_file_search;
          if (!si_search_file_search)
          {
            uint64_t v13 = si_module_with_name("file");
            si_search_file_search = (uint64_t)v13;
          }

          uint64_t v14 = si_user_byuid((uint64_t)v13);
          if (v14)
          {
            int v12 = (unsigned int *)v14;
            uint64_t v15 = (const char *)si_search_cache_file_search;
            if (!si_search_cache_file_search)
            {
              uint64_t v15 = (const char *)si_module_with_name("cache_file");
              si_search_cache_file_search = (uint64_t)v15;
            }

            int v16 = (const char **)si_search_file_search;
            if (!si_search_file_search)
            {
              int v16 = (const char **)si_module_with_name("file");
              si_search_file_search = (uint64_t)v16;
            }

            si_cache_add_item(v15, v16, (uint64_t)v12);
LABEL_21:
            int v18 = copy_user_r((uint64_t)(v12 + 8), a2, a3, v10);
            si_item_release(v12);
            if (v18)
            {
              LODWORD(v8) = 34;
            }

            else
            {
              LODWORD(v8) = 0;
              *a5 = a2;
            }

            return v8;
          }
        }

        int v17 = (void *)si_search_search;
        if (!si_search_search)
        {
          int v17 = si_module_with_name("search");
          si_search_search = (uint64_t)v17;
        }

        uint64_t v8 = si_user_byuid((uint64_t)v17);
        int v12 = (unsigned int *)v8;
        if (v8) {
          goto LABEL_21;
        }
      }
    }
  }

  return v8;
}

int getpwuuid_r(uuid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  if (a5)
  {
    *a5 = 0LL;
    LODWORD(v7) = 34;
    if (a2)
    {
      if (a3)
      {
        int v9 = a4;
        if (a4)
        {
          int v10 = (void *)si_search_search;
          if (!si_search_search)
          {
            int v10 = si_module_with_name("search");
            si_search_search = (uint64_t)v10;
          }

          uint64_t v7 = si_user_byuuid((uint64_t)v10);
          if (v7)
          {
            uint64_t v11 = (unsigned int *)v7;
            int v12 = copy_user_r(v7 + 32, a2, a3, v9);
            si_item_release(v11);
            if (v12)
            {
              LODWORD(v7) = 34;
            }

            else
            {
              LODWORD(v7) = 0;
              *a5 = a2;
            }
          }
        }
      }
    }
  }

  else
  {
    LODWORD(v7) = 34;
  }

  return v7;
}

char *__cdecl user_from_uid(uid_t a1, int a2)
{
  uint64_t v4 = getpwuid(a1);
  if (v4) {
    return v4->pw_name;
  }
  if (a2) {
    return 0LL;
  }
  __int16 v5 = user_from_uid_buf;
  snprintf(user_from_uid_buf, 0x10uLL, "%u", a1);
  return v5;
}

char *__cdecl group_from_gid(gid_t a1, int a2)
{
  uint64_t v4 = getgrgid(a1);
  if (v4) {
    return v4->gr_name;
  }
  if (a2) {
    return 0LL;
  }
  __int16 v5 = group_from_gid_buf;
  snprintf(group_from_gid_buf, 0x10uLL, "%u", a1);
  return v5;
}

const prdb_ent *__cdecl prdb_getbyname(const char *a1)
{
  return 0LL;
}

const prdb_ent *prdb_get(void)
{
  return 0LL;
}

bootparamsent *__cdecl bootparams_getbyname(const char *a1)
{
  return 0LL;
}

bootparamsent *bootparams_getent(void)
{
  return 0LL;
}

uint64_t *si_module_static_mdns()
{
  if (si_module_static_mdns_once != -1) {
    dispatch_once(&si_module_static_mdns_once, &__block_literal_global_0);
  }
  return &si_module_static_mdns_si;
}

uint64_t mdns_is_valid()
{
  return 0LL;
}

_OWORD *mdns_hostbyname(uint64_t a1, char *a2, int a3, char *a4, int *a5)
{
  if (a5)
  {
    *a5 = 0;
    int v10 = 3;
    if (!a1 || !a2) {
      goto LABEL_24;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    if (!a1 || !a2) {
      return v11;
    }
  }

  uint64_t v26 = 0LL;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  memset(v22, 0, sizeof(v22));
  uint64_t v23 = 0LL;
  if (a3 == 30)
  {
    DWORD1(v25) = 16;
    *((void *)&v22[0] + 1) = &v24;
    unsigned int v12 = 28;
  }

  else
  {
    if (a3 != 2)
    {
      if (a5)
      {
LABEL_23:
        int v10 = 3;
        goto LABEL_24;
      }

      return 0LL;
    }

    DWORD1(v25) = 4;
    *(void *)&v22[0] = &v24;
    unsigned int v12 = 1;
  }

  _mdns_debug_message(";; mdns_hostbyname %s type %u class %u\n", a2, v12, 1);
  LODWORD(v25) = a3;
  if (_mdns_search(a2, 1u, v12, a4, 0, 0LL, 0LL, (uint64_t *)v22) || !HIDWORD(v26))
  {
    _mdns_reply_clear((uint64_t)v22);
    if (a5)
    {
      int v10 = 1;
LABEL_24:
      uint64_t v11 = 0LL;
      *a5 = v10;
      return v11;
    }

    return 0LL;
  }

  time(0LL);
  if (a3 == 30) {
    int v20 = "L4488s*44c";
  }
  else {
    int v20 = "L4488s*44a";
  }
  uint64_t v11 = LI_ils_create(v20, v13, v14, v15, v16, v17, v18, v19, a1);
  _mdns_reply_clear((uint64_t)v22);
  if (a5 && !v11) {
    goto LABEL_23;
  }
  return v11;
}

_OWORD *mdns_hostbyaddr(uint64_t a1, unsigned __int8 *a2, int a3, const char *a4, int *a5)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  if (a5)
  {
    *a5 = 0;
    if (!a1 || !a2) {
      goto LABEL_32;
    }
  }

  else
  {
    int v10 = 0LL;
    if (!a1 || !a2) {
      return v10;
    }
  }

  uint64_t v33 = 0LL;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  memset(v29, 0, sizeof(v29));
  uint64_t v30 = 0LL;
  if (a3 == 30)
  {
    if (!a4 && *a2 == 254 && (a2[1] & 0xC0) == 0x80)
    {
      unsigned int v11 = __rev16(*((unsigned __int16 *)a2 + 1));
      __int128 v35 = *(_OWORD *)a2;
      WORD1(v35) = 0;
      if (v11)
      {
        uint64_t v13 = (unsigned __int8 *)&v35;
        if ((_is_v6addr_ifaddr(&v35, v11) & 1) != 0)
        {
          unsigned int v11 = -1;
          goto LABEL_21;
        }
      }
    }

    else
    {
      unsigned int v11 = 0;
    }

    uint64_t v13 = a2;
LABEL_21:
    uint64_t v14 = 0LL;
    DWORD1(v32) = 16;
    *((void *)&v29[0] + 1) = &v31;
    char v37 = 0;
    do
    {
      unsigned int v15 = *v13++;
      uint64_t v16 = (char *)v36 + v14;
      v16[63] = 46;
      v16[62] = hexchar[(unint64_t)v15 >> 4];
      v16[61] = 46;
      v16[60] = hexchar[v15 & 0xF];
      v14 -= 4LL;
    }

    while (v14 != -64);
    asprintf(&v34, "%sip6.arpa.", (const char *)v36);
    uint64_t v17 = v34;
    goto LABEL_26;
  }

  if (a3 != 2) {
    goto LABEL_31;
  }
  unsigned int v11 = 0;
  int v12 = *a2;
  if (!a4 && v12 == 169)
  {
    if (a2[1] == 254)
    {
      unsigned int v11 = (int)(_is_v4addr_ifaddr(a2) << 31) >> 31;
      int v12 = *a2;
    }

    else
    {
      unsigned int v11 = 0;
      int v12 = 169;
    }
  }

  DWORD1(v32) = 4;
  *(void *)&v29[0] = &v31;
  asprintf(v36, "%u.%u.%u.%u.in-addr.arpa.", a2[3], a2[2], a2[1], v12);
  uint64_t v17 = v36[0];
LABEL_26:
  LODWORD(v32) = a3;
  _mdns_debug_message(";; mdns_hostbyaddr %s type %u class %u\n", v17, 12, 1);
  if (a4)
  {
    unsigned int v11 = if_nametoindex(a4);
    if (!v11)
    {
      free(v17);
LABEL_35:
      _mdns_reply_clear((uint64_t)v29);
      if (a5)
      {
        int v10 = 0LL;
        int v19 = 1;
        goto LABEL_37;
      }

      return 0LL;
    }
  }

  int v18 = _mdns_search_ex(v17, 1u, 0xCu, v11, 0, 0LL, 0LL, (uint64_t *)v29);
  free(v17);
  if (v18) {
    goto LABEL_35;
  }
  if (_mdns_hostent_append_addr((uint64_t)&v31, a2, DWORD1(v32)))
  {
    _mdns_hostent_clear((uint64_t)&v31);
LABEL_31:
    if (a5)
    {
LABEL_32:
      int v10 = 0LL;
LABEL_33:
      int v19 = 3;
LABEL_37:
      *a5 = v19;
      return v10;
    }

    return 0LL;
  }

  time(0LL);
  if (a3 == 2) {
    unsigned int v28 = "L4488s*44a";
  }
  else {
    unsigned int v28 = "L4488s*44c";
  }
  int v10 = LI_ils_create(v28, v21, v22, v23, v24, v25, v26, v27, a1);
  _mdns_hostent_clear((uint64_t)&v31);
  if (a5 && !v10) {
    goto LABEL_33;
  }
  return v10;
}

void **mdns_addrinfo( uint64_t a1, char *a2, const char *a3, int a4, unsigned int a5, unsigned int a6, uint64_t a7, char *a8, int *a9)
{
  if (!a1) {
    goto LABEL_30;
  }
  if (a4 == 30)
  {
    unsigned int v16 = (a7 >> 11) & 1;
    int v17 = 1;
  }

  else
  {
    if (a4 == 2)
    {
      int v17 = 0;
    }

    else
    {
      if (a4) {
        return 0LL;
      }
      int v17 = 1;
    }

    unsigned int v16 = 1;
  }

  if (a9) {
    *a9 = 0;
  }
  _mdns_debug_message(";; mdns_addrinfo node %s serv %s\n", a2, a3);
  uint64_t v35 = 0LL;
  v34[0] = 0u;
  v32[0] = 0u;
  uint64_t v33 = 0LL;
  memset(v30, 0, sizeof(v30));
  uint64_t v31 = 0LL;
  v34[1] = 0x400000002uLL;
  v32[1] = 0x100000001EuLL;
  if ((v17 & v16) != 1)
  {
    if (v16)
    {
      unsigned int v28 = a6;
      *(void *)&v30[0] = v34;
      unsigned int v18 = 1;
      if ((a7 & 0x1000) != 0) {
        goto LABEL_18;
      }
LABEL_13:
      if (_gai_serv_to_port(a3, v28, &v29))
      {
        if (a9)
        {
          int v19 = 0LL;
          int v20 = 108;
LABEL_32:
          *a9 = v20;
          return v19;
        }

        return 0LL;
      }

      goto LABEL_20;
    }

    if (v17)
    {
      unsigned int v28 = a6;
      *((void *)&v30[0] + 1) = v32;
      unsigned int v18 = 28;
      if ((a7 & 0x1000) != 0) {
        goto LABEL_18;
      }
      goto LABEL_13;
    }

void **mdns_srv_byname(uint64_t a1, char *a2, char *a3, _DWORD *a4)
{
  if (a1)
  {
    if (a4) {
      *a4 = 0;
    }
    _mdns_debug_message(";; mdns_srv_byname %s type %u class %u\n", a2, 33, 1);
    uint64_t v21 = 0LL;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    int v7 = _mdns_search(a2, 1u, 0x21u, a3, 0, 0LL, 0LL, (uint64_t *)&v19);
    unsigned int v15 = 0LL;
    if (!v7)
    {
      uint64_t v16 = v20;
      if ((void)v20)
      {
        unsigned int v15 = 0LL;
        do
        {
          int v17 = (unsigned int *)LI_ils_create("L4488222s", v8, v9, v10, v11, v12, v13, v14, a1);
          unsigned int v15 = si_list_add(v15, (uint64_t)v17);
          si_item_release(v17);
          uint64_t v16 = *(void *)(v16 + 16);
        }

        while (v16);
      }

      else
      {
        unsigned int v15 = 0LL;
      }
    }

    _mdns_reply_clear((uint64_t)&v19);
  }

  else
  {
    unsigned int v15 = 0LL;
    if (a4) {
      *a4 = 3;
    }
  }

  return v15;
}

_OWORD *mdns_item_call()
{
  uint64_t v0 = MEMORY[0x1895FE128]();
  unsigned int v6 = v5;
  uint64_t v30 = *MEMORY[0x1895FEE08];
  unsigned int v28 = 0x10000;
  if (!v0 || (int v7 = (char *)v1) == 0LL)
  {
    if (v5)
    {
      __int128 v20 = 0LL;
      int v21 = 3;
LABEL_16:
      *unsigned int v6 = v21;
      return v20;
    }

    return 0LL;
  }

  unsigned int v8 = v4;
  unsigned int v9 = v3;
  uint64_t v10 = v2;
  uint64_t v11 = v0;
  if (v5) {
    int *v5 = 0;
  }
  _mdns_debug_message(";; mdns_item_call %s type %u class %u\n", v1, v4, v3);
  v25[0] = 0u;
  v23[0] = 0u;
  uint64_t v24 = 0LL;
  v25[1] = 0x400000002uLL;
  v23[1] = 0x100000001EuLL;
  uint64_t v26 = 0LL;
  v27[0] = (uint64_t)v25;
  v27[1] = (uint64_t)v23;
  memset(&v27[2], 0, 24);
  if (_mdns_search(v7, v9, v8, v10, 0, (uint64_t)v29, &v28, v27) || !v28 || v28 > 0x10000)
  {
    _mdns_reply_clear((uint64_t)v27);
    if (v6)
    {
      __int128 v20 = 0LL;
      int v21 = 1;
      goto LABEL_16;
    }

    return 0LL;
  }

  __int128 v19 = LI_ils_create("L4488@@", v12, v13, v14, v15, v16, v17, v18, v11);
  __int128 v20 = v19;
  if (v6 && !v19) {
    *unsigned int v6 = 3;
  }
  _mdns_reply_clear((uint64_t)v27);
  return v20;
}

char *__si_module_static_mdns_block_invoke()
{
  si_module_static_mdns_suint64_t i = (uint64_t)strdup("mdns");
  pthread_atfork( (void (*)(void))_mdns_atfork_prepare,  (void (*)(void))_mdns_atfork_parent,  (void (*)(void))_mdns_atfork_child);
  uint64_t result = getenv("RES_DEBUG");
  if (result) {
    _mdns_debug = 1;
  }
  return result;
}

void _mdns_debug_message(char *a1, ...)
{
  v2[0] = 0LL;
  if (a1)
  {
    if (_mdns_debug == 1)
    {
      va_copy((va_list)&v2[1], va);
      vasprintf(v2, a1, va);
      uint64_t v1 = v2[0];
      if (v2[0])
      {
        if (_mdns_debug == 1)
        {
          fputs(v2[0], (FILE *)*MEMORY[0x1895FEE18]);
          uint64_t v1 = v2[0];
        }

        free(v1);
      }
    }
  }

uint64_t _mdns_search( char *a1, unsigned int a2, unsigned int a3, char *a4, int a5, uint64_t a6, unsigned int *a7, uint64_t *a8)
{
  if (a4 && (LODWORD(a4) = if_nametoindex(a4), !(_DWORD)a4)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return _mdns_search_ex(a1, a2, a3, (uint32_t)a4, a5, a6, a7, a8);
  }
}

void _mdns_reply_clear(uint64_t a1)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 32) = 0;
    _mdns_hostent_clear(*(void *)a1);
    _mdns_hostent_clear(*(void *)(a1 + 8));
    uint64_t v2 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = 0LL;
    if (v2)
    {
      do
      {
        uint64_t v3 = *(void *)(v2 + 16);
        free(*(void **)(v2 + 8));
        free((void *)v2);
        uint64_t v2 = v3;
      }

      while (v3);
    }
  }

uint64_t _mdns_search_ex( char *a1, unsigned int a2, unsigned int a3, uint32_t a4, int a5, uint64_t a6, unsigned int *a7, uint64_t *a8)
{
  uint64_t v106 = *MEMORY[0x1895FEE08];
  int v92 = 0;
  si_inet_config(&v92, 0LL);
  if (v92) {
    --v92;
  }
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint32_t v85 = a4;
  int v86 = a5;
  *(void *)v87 = a6;
  v81 = a8;
  if (pthread_is_threaded_np() && pthread_main_np() && os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_1804BA000,  MEMORY[0x189600830],  OS_LOG_TYPE_DEFAULT,  "Warning: Libinfo call to mDNSResponder on main thread",  buf,  2u);
  }

  timespec v94 = (timespec)xmmword_1804DCB60;
  _mdns_deadline(v95, &v94);
  timespec timeout = v94;
  gettimeofday((timeval *)buf, 0LL);
  uint64_t v15 = *(void *)buf;
  int v16 = *(_DWORD *)&buf[8];
  *(_OWORD *)buf = 0u;
  __int128 v99 = 0u;
  __int128 v100 = 0u;
  __int128 v101 = 0u;
  __int128 v102 = 0u;
  __int16 v91 = 0;
  memset(v104, 0, sizeof(v104));
  uint64_t v103 = 0LL;
  uint64_t v105 = 0LL;
  int v17 = kqueue();
  changelist.ident = 1LL;
  *(_DWORD *)&changelist.filter = 2228214;
  memset(&changelist.fflags, 0, 20);
  int kq = v17;
  LODWORD(v18) = 0;
  unsigned int v19 = 0;
  if (kevent(v17, &changelist, 1, 0LL, 0, 0LL)) {
    goto LABEL_111;
  }
  LODWORD(v18) = 0;
  uint64_t v75 = 1000LL * v16;
  uint64_t v76 = v15;
  if (a3 <= 1) {
    int v20 = 1;
  }
  else {
    int v20 = a3;
  }
  int v84 = v20;
  int v82 = 0;
  int v83 = 3;
  char v21 = 1;
  uint64_t v22 = a8;
  size_t v77 = a7;
  while (1)
  {
    _mdns_debug_message(";; _mdns_search wait loop\n");
    if ((v21 & 1) != 0)
    {
      uint64_t v23 = a7;
      while (1)
      {
        pthread_mutex_lock(&_mdns_mutex);
        if ((int)v18 >= 1)
        {
          uint64_t v24 = v18;
          uint64_t v25 = buf;
          do
          {
            _mdns_query_clear((uint64_t)v25);
            v25 += 88;
            --v24;
          }

          while (v24);
        }

        if (_mdns_sdref)
        {
          uint64_t v26 = *(void *)v87;
          int v27 = v86;
        }

        else
        {
          uint64_t v26 = *(void *)v87;
          int v27 = v86;
          if (_mdns_old_sdref)
          {
            ++_mdns_generation;
            DNSServiceRefDeallocate((DNSServiceRef)_mdns_old_sdref);
            _mdns_old_sdref = 0LL;
          }

          DNSServiceErrorType Connection = DNSServiceCreateConnection((DNSServiceRef *)&_mdns_sdref);
          BOOL v29 = v83-- < 1;
          if (v29 || Connection)
          {
            pthread_mutex_unlock(&_mdns_mutex);
            uint64_t v64 = 0LL;
            LODWORD(v18) = 0;
            unsigned int v19 = 0;
            size_t v65 = 0LL;
            goto LABEL_116;
          }
        }

        int start = _mdns_query_start((uint64_t)buf, v22, v26, a7, a1, a2, v84, v85, v27, kq);
        if (start | a3)
        {
          int v31 = start;
          LODWORD(v18) = 1;
        }

        else
        {
          int v31 = _mdns_query_start((uint64_t)v104, v22, v26, a7, a1, a2, 28, v85, v27, kq);
          LODWORD(v18) = 2;
        }

        if (!v31) {
          break;
        }
        _mdns_debug_message(";; initialization error %d\n", v31);
        a7 = v23;
        if ((v31 + 65569) > 0x20 || ((1LL << (v31 + 33)) & 0x110000041LL) == 0)
        {
          pthread_mutex_unlock(&_mdns_mutex);
          goto LABEL_110;
        }

        if (_mdns_sdref)
        {
          ++_mdns_generation;
          DNSServiceRefDeallocate((DNSServiceRef)_mdns_sdref);
          _mdns_sdref = 0LL;
        }

        pthread_mutex_unlock(&_mdns_mutex);
        _mdns_debug_message(";; _mdns_search wait loop\n");
      }

      changelist.ident = DNSServiceRefSockFD((DNSServiceRef)_mdns_sdref);
      *(_DWORD *)&changelist.filter = 0x1FFFF;
      memset(&changelist.fflags, 0, 20);
      int v32 = kq;
      int v33 = kevent(kq, &changelist, 1, 0LL, 0, 0LL);
      pthread_mutex_unlock(&_mdns_mutex);
      a7 = v23;
      if (v33) {
        goto LABEL_110;
      }
    }

    else
    {
      int v32 = kq;
    }

    else {
      unsigned int v34 = buf;
    }
    uint64_t v35 = v104;
    v78 = v34;
    size_t v79 = v35;
    _mdns_debug_message(";; set kevent timeout %ld.%ld [ctx %p %p]\n", timeout.tv_sec, timeout.tv_nsec, v34, v35);
    *__error() = 0;
    if (kevent(v32, 0LL, 0, &changelist, 1, &timeout) < 0 && *__error() != 4) {
      break;
    }
    pthread_mutex_lock(&_mdns_mutex);
    v90.tv_sec = 0LL;
    v90.uint64_t tv_nsec = 0LL;
    int v36 = kevent(v32, 0LL, 0, &changelist, 1, &v90);
    if (!_mdns_sdref)
    {
      _mdns_debug_message(";; _mdns_sdref is NULL, initialize = true\n");
      DNSServiceErrorType v38 = 0;
      goto LABEL_49;
    }

    if (v36 >= 1 && (unsigned __int16)changelist.filter == 0xFFFF)
    {
      _mdns_debug_message(";; _mdns_search calling DNSServiceProcessResult\n");
      DNSServiceErrorType v37 = DNSServiceProcessResult((DNSServiceRef)_mdns_sdref);
      _mdns_debug_message(";; DNSServiceProcessResult -> %d\n", v37);
      DNSServiceErrorType v38 = v37;
      char v21 = 0;
      if ((v37 + 65569) <= 0x1C && ((1 << (v37 + 33)) & 0x10000041) != 0)
      {
        _mdns_debug_message(";; DNSServiceProcessResult status %d [ctx %p %p]\n", v37, v78, v79);
        ++_mdns_generation;
        DNSServiceRefDeallocate((DNSServiceRef)_mdns_sdref);
        DNSServiceErrorType v38 = 0;
        _mdns_sdref = 0LL;
LABEL_49:
        char v21 = 1;
      }
    }

    else
    {
      if (v36 || changelist.filter != -10) {
        _mdns_debug_message(";; kevent m=%d ev.filter=0x%08x\n");
      }
      else {
        _mdns_debug_message(";; kevent wakeup\n");
      }
      char v21 = 0;
      DNSServiceErrorType v38 = 0;
    }

    if ((int)v18 < 1)
    {
      DNSServiceErrorType v66 = v38;
      pthread_mutex_unlock(&_mdns_mutex);
      if (v66) {
LABEL_106:
      }
        _mdns_debug_message(";; DNSServiceProcessResult error status %d [ctx %p %p]\n");
      else {
LABEL_107:
      }
        _mdns_debug_message(";; [%s type %d class %d] done [ctx %p %p]\n");
      a7 = v77;
LABEL_110:
      unsigned int v19 = 0;
      goto LABEL_111;
    }

    DNSServiceErrorType v80 = v38;
    uint64_t v39 = 0LL;
    char v40 = 1;
    unint64_t v41 = buf;
    do
    {
      int is_complete = _mdns_query_is_complete((uint64_t)v41, (_BYTE *)&v91 + v39);
      char v43 = is_complete;
      uint64_t v44 = "false";
      if (is_complete) {
        uint64_t v44 = "true";
      }
      _mdns_debug_message(";; ctx %d %p error=%d complete=%s\n", v39, v41, *((_DWORD *)v41 + 17), v44);
      int v45 = *((_DWORD *)v41 + 17);
      if ((v43 & 1) != 0 || v45)
      {
        if (*((_DWORD *)v41 + 10) == 1)
        {
          BOOL v46 = v45 == 0;
          if (v45) {
            int v47 = 2;
          }
          else {
            int v47 = 1;
          }
          int v82 = v47;
          size_t v48 = "GOT_DATA";
          if (!v46) {
            size_t v48 = "GOT_ERROR";
          }
          _mdns_debug_message(";; type ns_t_a got_a_response=%s ctx %p\n", v48, v41);
        }

        _mdns_debug_message(";; [%s type %d class %d] finished processing ctx %p\n");
      }

      else
      {
        char v40 = 0;
        _mdns_debug_message(";; [%s type %d class %d] continuing ctx %p\n");
      }

      ++v39;
      v41 += 88;
    }

    while (v18 != v39);
    pthread_mutex_unlock(&_mdns_mutex);
    if (v80) {
      goto LABEL_106;
    }
    if ((v40 & 1) != 0) {
      goto LABEL_107;
    }
    if (!(v91 | HIBYTE(v91)))
    {
      a7 = v77;
      uint64_t v22 = v81;
      if (v82 != 1) {
        goto LABEL_98;
      }
      gettimeofday(&v97, 0LL);
      uint64_t v49 = 1000LL * v97.tv_usec;
      BOOL v29 = v49 < v75;
      uint64_t v50 = v49 - v75;
      if (v29) {
        uint64_t v51 = v50 + 1000000000;
      }
      else {
        uint64_t v51 = v50;
      }
      __darwin_time_t v52 = v97.tv_sec - v76 + (v50 >> 63);
      uint64_t v53 = 2LL;
      if (!v92) {
        uint64_t v53 = 10LL;
      }
      if (v51 < 20000001 && v52 == 0) {
        uint64_t v53 = 5LL;
      }
      uint64_t v55 = 2 * v52;
      unint64_t v56 = 2 * v51;
      if (v51 >= 500000001)
      {
        v55 += v56 / 0x3B9ACA00;
        v56 %= 0x3B9ACA00uLL;
      }

      v94.tv_sec = v55 + v53;
      v94.uint64_t tv_nsec = v56;
      _mdns_debug_message(";; new timeout [%s type %d class %d] (waiting for AAAA) %ld.%ld [ctx %p %p]\n");
      goto LABEL_97;
    }

    gettimeofday(&v97, 0LL);
    uint64_t v57 = 1000LL * v97.tv_usec;
    __darwin_time_t v58 = v97.tv_sec - v76;
    unint64_t v59 = v57 - v75;
    uint64_t v22 = v81;
    if (v57 - v75 < 0)
    {
      v59 += 1000000000LL;
      __darwin_time_t v60 = v58 + 4;
      v94.tv_sec = v60;
      goto LABEL_93;
    }

    __darwin_time_t v60 = v58 + 5;
    v94.tv_sec = v60;
    v94.uint64_t tv_nsec = v57 - v75;
    if (v59 > 0x3B9ACA00)
    {
      v60 += v59 / 0x3B9ACA00;
      v94.tv_sec = v60;
      v59 %= 0x3B9ACA00uLL;
LABEL_93:
      a7 = v77;
      v94.uint64_t tv_nsec = v59;
      goto LABEL_95;
    }

    a7 = v77;
LABEL_95:
    if (timeout.tv_sec - v60 - (timeout.tv_nsec < (uint64_t)v59) >= 0)
    {
      _mdns_debug_message(";; new timeout [%s type %d class %d] (waiting for more) %ld.%ld [ctx %p %p]\n");
LABEL_97:
      _mdns_deadline(v95, &v94);
    }

LABEL_98:
    gettimeofday(&v97, 0LL);
    __darwin_time_t v61 = v95[0] - v97.tv_sec;
    uint64_t v62 = v95[1] - 1000LL * v97.tv_usec;
    timeout.tv_sec = v95[0] - v97.tv_sec;
    timeout.uint64_t tv_nsec = v62;
    if (v62 < 0)
    {
      timeout.tv_sec = --v61;
      timeout.uint64_t tv_nsec = v62 + 1000000000;
    }

    if (v61 < 0)
    {
      _mdns_debug_message(";; [%s type %d class %d] timeout [ctx %p %p]\n", a1, a3, a2, v78, v79);
      goto LABEL_110;
    }
  }

  unsigned int v19 = -1;
LABEL_111:
  else {
    uint64_t v64 = buf;
  }
  size_t v65 = v104;
LABEL_116:
  _mdns_debug_message(";; finished _mdns_search loop [ctx %p %p]\n", v64, v65);
  pthread_mutex_lock(&_mdns_mutex);
  if ((int)v18 < 1)
  {
    int v67 = 0;
  }

  else
  {
    int v67 = 0;
    uint64_t v18 = v18;
    v68 = buf;
    do
    {
      BOOL clear = _mdns_query_clear((uint64_t)v68);
      v67 |= clear;
      if (clear) {
        unint64_t v70 = "";
      }
      else {
        unint64_t v70 = "in";
      }
      _mdns_debug_message(";; _mdns_search ctx %p %scomplete\n", v68, v70);
      v68 += 88;
      --v18;
    }

    while (v18);
  }

  BOOL v71 = (v91 | HIBYTE(v91)) == 0;
  BOOL v72 = (v71 & v67) == 0;
  if ((v71 & v67) != 0) {
    v73 = "";
  }
  else {
    v73 = "in";
  }
  if (v72) {
    uint64_t v63 = 0xFFFFFFFFLL;
  }
  else {
    uint64_t v63 = v19;
  }
  _mdns_debug_message(";; _mdns_search overall %scomplete\n", v73);
  pthread_mutex_unlock(&_mdns_mutex);
  close_NOCANCEL();
  if (a7) {
    *a7 = DWORD2(v99);
  }
  _mdns_debug_message(";; _mdns_search exit res %d\n", v63);
  return v63;
}

uint64_t _mdns_deadline(__darwin_time_t *a1, void *a2)
{
  uint64_t result = gettimeofday(&v8, 0LL);
  __darwin_suseconds_t tv_usec = v8.tv_usec;
  __darwin_time_t v6 = *a2 + v8.tv_sec;
  *a1 = v6;
  uint64_t v7 = a2[1] + 1000LL * tv_usec;
  a1[1] = v7;
  if (v7 > 1000000000)
  {
    *a1 = v7 / 0x3B9ACA00uLL + v6;
    a1[1] = v7 % 0x3B9ACA00uLL;
  }

  return result;
}

BOOL _mdns_query_clear(uint64_t a1)
{
  if (!a1) {
    return 1LL;
  }
  unsigned __int8 v10 = 0;
  int is_complete = _mdns_query_is_complete(a1, &v10);
  uint64_t v3 = *(_DNSServiceRef_t **)(a1 + 56);
  if (v3 && *(_DWORD *)(a1 + 48) == _mdns_generation) {
    DNSServiceRefDeallocate(v3);
  }
  *(void *)(a1 + 56) = 0LL;
  *(_DWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 72) = -1;
  unsigned int v4 = &in_flight;
  uint64_t v5 = in_flight;
  if (in_flight == a1)
  {
LABEL_9:
    *unsigned int v4 = *(void *)(a1 + 80);
  }

  else
  {
    while (v5)
    {
      uint64_t v6 = v5;
      uint64_t v5 = *(void *)(v5 + 80);
      if (v5 == a1)
      {
        unsigned int v4 = (uint64_t *)(v6 + 80);
        goto LABEL_9;
      }
    }
  }

  *(void *)(a1 + 80) = 0LL;
  int v7 = v10;
  if (v10) {
    char v8 = 1;
  }
  else {
    char v8 = is_complete;
  }
  if ((v8 & 1) == 0)
  {
    _mdns_hostent_clear(*(void *)(a1 + 8));
    *(void *)(a1 + 24) = -1LL;
    int v7 = v10;
  }

  return (v7 | is_complete) != 0;
}

uint64_t _mdns_query_start( uint64_t a1, uint64_t *a2, uint64_t a3, unsigned int *a4, char *__s, unsigned int a6, int a7, uint32_t a8, int a9, int a10)
{
  *(void *)(a1 + 80) = 0LL;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  if (a3 && a4)
  {
    *(void *)(a1 + 16) = a3;
    uint64_t v17 = *a4;
    *(void *)(a1 + 32) = v17;
    if (v17 < 0x10
      || (*(_DWORD *)(a3 + 8) = 0,
          *(void *)a3 = 0LL,
          *(void *)a3 = *(void *)a3 & 0xFFFF0000F0060000LL | (unsigned __int16)arc4random() | 0x10000810000LL,
          unsigned int v18 = _mdns_pack_domain_name(__s, a3 + 12, (v17 - 12)),
          (v18 & 0x80000000) != 0))
    {
      uint64_t v20 = -1LL;
    }

    else
    {
      uint64_t v19 = a3 + v18;
      *(_WORD *)(v19 + 12) = bswap32(a7) >> 16;
      *(_WORD *)(v19 + 14) = bswap32(a6) >> 16;
      uint64_t v20 = (int)(v18 + 16);
    }

    *(void *)(a1 + 24) = v20;
  }

  *(void *)(a1 + 56) = _mdns_sdref;
  *(_DWORD *)(a1 + 40) = a7;
  *(_DWORD *)(a1 + 48) = _mdns_generation;
  *(_DWORD *)(a1 + 72) = a10;
  if (a2)
  {
    *(void *)a1 = a2;
    uint64_t RecordWithAttribute = 0xFFFFFFFFLL;
    if (a7 <= 11)
    {
      if (a7 == 1)
      {
LABEL_17:
        uint64_t v22 = *a2;
LABEL_20:
        *(void *)(a1 + 8) = v22;
        goto LABEL_21;
      }

      if (a7 != 5) {
        return RecordWithAttribute;
      }
    }

    else
    {
      if (a7 == 12)
      {
        uint64_t v22 = *a2;
        if (!*a2)
        {
          uint64_t v22 = a2[1];
          if (!v22) {
            return RecordWithAttribute;
          }
        }

        goto LABEL_20;
      }

      if (a7 != 33)
      {
        if (a7 != 28) {
          return RecordWithAttribute;
        }
        ++a2;
        goto LABEL_17;
      }
    }
  }

LABEL_21:
  int v23 = strlen(__s);
  if (!v23 || v23 - (__s[v23 - 1] == 46) != 72)
  {
LABEL_26:
    int v25 = 0;
LABEL_27:
    uint64_t v24 = 0LL;
    goto LABEL_28;
  }

  uint64_t v24 = 0LL;
  int v25 = 0;
  unsigned int v26 = __s[58] - 56;
  if (v26 <= 0x2A && ((1LL << v26) & 0x60000000603LL) != 0)
  {
    if (!strncasecmp(__s + 59, ".e.f.ip6.arpa", 0xDuLL))
    {
      unint64_t v29 = 0LL;
      while (1)
      {
        unsigned int v30 = __s[v29];
        if (__s[v29] < 48 || v30 - 58 < 7) {
          break;
        }
        BOOL v32 = v30 <= 0x66 && v30 - 71 >= 0x1A;
        if (!v32 || __s[v29 + 1] != 46) {
          break;
        }
        BOOL v33 = v29 > 0x37;
        v29 += 2LL;
        if (v33)
        {
          int v25 = hexval[__s[48]] + 16 * hexval[__s[50]] + (hexval[__s[52]] << 8) + (hexval[__s[54]] << 12);
          if (!v25) {
            goto LABEL_27;
          }
          uint64_t v24 = strdup(__s);
          if (v24)
          {
            v24[48] = 48;
            v24[50] = 48;
            v24[52] = 48;
            v24[54] = 48;
          }

          else
          {
            int v25 = 0;
          }

          goto LABEL_28;
        }
      }
    }

    goto LABEL_26;
  }

uint64_t _mdns_query_is_complete(uint64_t a1, _BYTE *a2)
{
  if (!a1) {
    return 1LL;
  }
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    if (a2) {
      *a2 = 1;
    }
    _mdns_debug_message(";; mdns is_complete type %d ctx %p more coming - incomplete\n");
  }

  else
  {
    if (a2) {
      *a2 = 0;
    }
    _mdns_debug_message( ";; mdns is_complete type %d ctx %p clear more coming - complete\n",
      *(_DWORD *)(a1 + 40),
      (const void *)a1);
    int v3 = *(unsigned __int16 *)(a1 + 44);
    if (*(_DWORD *)(a1 + 40) == v3)
    {
      if (*(unsigned __int16 *)(a1 + 44) > 0x1Bu)
      {
        if (v3 == 33)
        {
          if (*(void *)a1 && *(void *)(*(void *)a1 + 16LL))
          {
            _mdns_debug_message(";; mdns is_complete type %d ctx %p srv %p complete -> true\n");
            goto LABEL_26;
          }

          goto LABEL_28;
        }

        if (v3 != 28) {
          goto LABEL_27;
        }
      }

      else if (v3 != 1)
      {
        if (v3 == 12)
        {
          unsigned int v4 = *(void **)(a1 + 8);
          if (v4 && *v4)
          {
            _mdns_debug_message(";; mdns is_complete type %d ctx %p host name %s complete -> true\n");
LABEL_26:
            int v7 = " - ";
            uint64_t v5 = 1LL;
LABEL_29:
            _mdns_debug_message( ";; mdns is_complete type %d ctx %p %scomplete\n",
              *(_DWORD *)(a1 + 40),
              (const void *)a1,
              v7);
            return v5;
          }

          goto LABEL_28;
        }

LABEL_27:
        _mdns_debug_message( ";; mdns is_complete unexpected type %d ctx %p\n",
          *(unsigned __int16 *)(a1 + 44),
          (const void *)a1);
        goto LABEL_28;
      }

      uint64_t v6 = *(void *)(a1 + 8);
      if (v6 && *(int *)(v6 + 36) >= 1)
      {
        _mdns_debug_message(";; mdns is_complete type %d ctx %p host addr count %d complete -> true\n");
        goto LABEL_26;
      }

void _mdns_hostent_clear(uint64_t a1)
{
  if (a1)
  {
    free(*(void **)a1);
    *(void *)a1 = 0LL;
    uint64_t v2 = *(void ***)(a1 + 8);
    if (v2)
    {
      int v3 = *v2;
      if (*v2)
      {
        unsigned int v4 = v2 + 1;
        do
        {
          free(v3);
          uint64_t v5 = *v4++;
          int v3 = v5;
        }

        while (v5);
      }

      uint64_t v6 = *(void **)(a1 + 8);
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    free(v6);
    *(void *)(a1 + 8) = 0LL;
    *(_DWORD *)(a1 + 32) = 0;
    int v7 = *(void ***)(a1 + 24);
    if (v7)
    {
      char v8 = *v7;
      if (*v7)
      {
        unsigned int v9 = v7 + 1;
        do
        {
          free(v8);
          unsigned __int8 v10 = *v9++;
          char v8 = v10;
        }

        while (v10);
      }

      uint64_t v11 = *(void **)(a1 + 24);
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    free(v11);
    *(void *)(a1 + 24) = 0LL;
    *(_DWORD *)(a1 + 36) = 0;
  }

void _mdns_query_callback( uint64_t a1, int a2, unsigned int a3, int a4, char *a5, signed int a6, unsigned int a7, unsigned int a8, unsigned __int16 *a9, unsigned int a10, void *a11)
{
  unsigned int v18 = "";
  if ((a2 & 1) != 0) {
    unsigned int v18 = " (kDNSServiceFlagsMoreComing is set)";
  }
  _mdns_debug_message(";; _mdns_query_callback ctx %p flags=0x%08x%s\n", a11, a2, v18);
  *((_DWORD *)a11 + 16) = a2;
  *((_DWORD *)a11 + 17) = a4;
  *((_WORD *)a11 + 22) = a6;
  if ((a2 & 1) == 0)
  {
    for (uint64_t i = in_flight; i; uint64_t i = *(void *)(i + 80))
    {
      if ((*(_BYTE *)(i + 64) & 1) != 0)
      {
        _mdns_debug_message(";; cleared kDNSServiceFlagsMoreComing flag for ctx %p\n", (const void *)i);
        *(_DWORD *)(i + 64) &= ~1u;
      }
    }
  }

  if (a4)
  {
    _mdns_debug_message(";; [%s type %hu class %hu]: error %d [ctx %p]\n");
    goto LABEL_10;
  }

  uint64_t v22 = a9;
  if (a6 == 28 && a8 == 16 && *(unsigned __int8 *)a9 == 254 && (*((_BYTE *)a9 + 1) & 0xC0) == 0x80)
  {
    __int128 v54 = *(_OWORD *)a9;
    WORD1(v54) = bswap32(a3) >> 16;
    uint64_t v22 = (unsigned __int16 *)&v54;
  }

  unsigned int v23 = a10;
  uint64_t v24 = *a11;
  if (!*a11) {
    goto LABEL_66;
  }
  if (!*(_DWORD *)(v24 + 32)) {
    *(_DWORD *)(v24 + 32) = a3;
  }
  _mdns_hostent_append_alias((void *)a11[1], a5);
  if (a6 <= 11)
  {
    if (a6 == 1) {
      goto LABEL_32;
    }
    if (a6 != 5) {
      goto LABEL_48;
    }
    int v25 = (char *)_mdns_parse_domain_name((uint64_t)v22, a8);
    _mdns_hostent_append_alias((void *)a11[1], v25);
    _mdns_debug_message(";; [%s type %hu class %hu] cname %s [ctx %p]\n", a5, 5, a7, v25, a11);
LABEL_40:
    free(v25);
    if (v25) {
      goto LABEL_66;
    }
    goto LABEL_60;
  }

  if (a6 == 12)
  {
    int v25 = (char *)_mdns_parse_domain_name((uint64_t)v22, a8);
    int v27 = (char **)a11[1];
    if (v27 && !*v27)
    {
      unsigned int v28 = _mdns_canonicalize(v25);
      int v27 = (char **)a11[1];
      char *v27 = v28;
    }

    _mdns_hostent_append_alias(v27, v25);
    goto LABEL_40;
  }

  if (a6 == 33)
  {
    unint64_t v29 = calloc(1uLL, 0x18uLL);
    if (!v29) {
      goto LABEL_66;
    }
    unsigned int v30 = v29;
    if (a8 <= 5
      || (_WORD *v29 = bswap32(*v22) >> 16,
          v29[1] = bswap32(v22[1]) >> 16,
          _OWORD v29[2] = bswap32(v22[2]) >> 16,
          int v31 = _mdns_parse_domain_name((uint64_t)(v22 + 3), a8 - 6),
          (v30[1] = v31) == 0LL))
    {
      free(v30);
      goto LABEL_60;
    }

    uint64_t v32 = *(void *)(v24 + 16);
    if (v32)
    {
      do
      {
        uint64_t v33 = v32;
        uint64_t v32 = *(void *)(v32 + 16);
      }

      while (v32);
      *(void *)(v33 + 16) = v30;
    }

    else
    {
      *(void *)(v24 + 16) = v30;
    }

    goto LABEL_66;
  }

  if (a6 != 28)
  {
LABEL_48:
    if ((_mdns_debug & 1) == 0) {
      goto LABEL_66;
    }
LABEL_60:
    _mdns_debug_message(";; [%s type %hu class %hu]: malformed reply [ctx %p]\n");
    goto LABEL_10;
  }

unint64_t _mdns_pack_domain_name(char *__s, uint64_t a2, unint64_t a3)
{
  unint64_t v3 = 0xFFFFFFFFLL;
  if (__s && a2 && a3)
  {
    uint64_t v6 = __s;
    uint64_t v7 = 0LL;
    LODWORD(v3) = 0;
    while (1)
    {
      char v8 = v6;
      unsigned int v9 = strchr(v6, 46);
      if (!v9) {
        unsigned int v9 = (char *)&v8[strlen(v8)];
      }
      *(_BYTE *)(a2 + v7) = (_BYTE)v9 - (_BYTE)v8;
      unint64_t v3 = (v3 + 1);
      if (v8 >= v9)
      {
        unsigned __int8 v10 = v8;
      }

      else
      {
        unsigned __int8 v10 = v8;
        if ((int)v3 < a3)
        {
          unint64_t v3 = (int)v3;
          unsigned __int8 v10 = v8;
          do
          {
            char v11 = *v10++;
            *(_BYTE *)(a2 + v3++) = v11;
          }

          while (v10 < v9 && v3 < a3);
        }
      }

      int v12 = *(unsigned __int8 *)v10;
      uint64_t v6 = v10 + 1;
      uint64_t v7 = (int)v3;
      if (v12) {
        BOOL v13 = (int)v3 >= a3;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13)
      {
        if ((int)v3 < a3)
        {
          if (v9 == v8 || (v3 = (v3 + 1), *(_BYTE *)(a2 + v7) = 0, uint64_t v7 = (int)v3, (int)v3 < a3))
          {
            *(_BYTE *)(a2 + v7) = 0;
            return v3;
          }
        }

        return 0xFFFFFFFFLL;
      }
    }

    return 0xFFFFFFFFLL;
  }

  return v3;
}

void _mdns_hostent_append_alias(void *a1, char *a2)
{
  if (a1)
  {
    if (a2)
    {
      unsigned int v4 = _mdns_canonicalize(a2);
      if (v4)
      {
        uint64_t v5 = v4;
        if (!*a1 || strcmp((const char *)*a1, v4))
        {
          int v6 = *((_DWORD *)a1 + 8);
          uint64_t v7 = (void *)a1[1];
          if (v6 >= 1)
          {
            uint64_t v8 = *((unsigned int *)a1 + 8);
            unsigned int v9 = (const char **)a1[1];
            while (strcmp(*v9, v5))
            {
              ++v9;
              if (!--v8) {
                goto LABEL_10;
              }
            }

            goto LABEL_14;
          }

LABEL_10:
          unsigned __int8 v10 = reallocf(v7, 8LL * (v6 + 2));
          a1[1] = v10;
          if (v10)
          {
            uint64_t v11 = *((int *)a1 + 8);
            v10[v11++] = v5;
            *((_DWORD *)a1 + 8) = v11;
            v10[v11] = 0LL;
            return;
          }

          *((_DWORD *)a1 + 8) = 0;
        }

    if (a3 == 30) {
      unsigned int v9 = 7;
    }
    else {
      unsigned int v9 = 6;
    }
    int v16 = 0;
    while (1)
    {
      module = search_get_module(v6, v9, &v16);
      if (!module) {
        break;
      }
      uint64_t v11 = (const char **)module;
      int v12 = si_host_byname(module);
      if (v12)
      {
        uint64_t v7 = v12;
        if (*(_DWORD *)(v6 + 24LL * v9 + 16)) {
          BOOL v13 = v9;
        }
        else {
          BOOL v13 = 0;
        }
        if ((*(_BYTE *)(v6 + 24LL * v13 + 20) & 1) != 0) {
          uint64_t v14 = *(const char **)(v6 + 432);
        }
        else {
          uint64_t v14 = 0LL;
        }
        si_cache_add_item(v14, v11, v7);
        return v7;
      }
    }

    if (!a5) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    uint64_t v8 = 1;
    goto LABEL_6;
  }

  uint64_t v7 = 0LL;
  if (a1 && a2)
  {
    int v6 = *(void *)(a1 + 32);
    if (!v6) {
      return 0LL;
    }
    goto LABEL_10;
  }

  return v7;
}

    if (a3 == 30) {
      unsigned int v9 = 7;
    }
    else {
      unsigned int v9 = 6;
    }
    int v16 = 0;
    while (1)
    {
      module = search_get_module(v6, v9, &v16);
      if (!module) {
        break;
      }
      uint64_t v11 = (const char **)module;
      int v12 = si_host_byaddr(module);
      if (v12)
      {
        uint64_t v7 = v12;
        if (*(_DWORD *)(v6 + 24LL * v9 + 16)) {
          BOOL v13 = v9;
        }
        else {
          BOOL v13 = 0;
        }
        if ((*(_BYTE *)(v6 + 24LL * v13 + 20) & 1) != 0) {
          uint64_t v14 = *(const char **)(v6 + 432);
        }
        else {
          uint64_t v14 = 0LL;
        }
        si_cache_add_item(v14, v11, v7);
        return v7;
      }
    }

    if (!a5) {
      return 0LL;
    }
    uint64_t v7 = 0LL;
    uint64_t v8 = 1;
    goto LABEL_6;
  }

  uint64_t v7 = 0LL;
  if (a1 && a2)
  {
    int v6 = *(void *)(a1 + 32);
    if (!v6) {
      return 0LL;
    }
    goto LABEL_10;
  }

  return v7;
}

    freeifaddrs(v2);
  }

LABEL_14:
        free(v5);
      }
    }
  }

  unsigned __int8 v10 = 0LL;
LABEL_15:
  xpc_release(v5);
  return v10;
}

char *_mdns_canonicalize(char *result)
{
  if (result)
  {
    uint64_t result = strdup(result);
    if (result)
    {
      int v1 = *result;
      if (*result)
      {
        uint64_t v2 = (unsigned __int8 *)(result + 1);
        uint64_t v3 = 0xFFFFFFFF00000000LL;
        do
        {
          int v4 = *v2++;
          int v1 = v4;
          v3 += 0x100000000LL;
        }

        while (v4);
        uint64_t v5 = v3 >> 32;
        if (result[v5] == 46) {
          result[v5] = 0;
        }
      }
    }
  }

  return result;
}

uint64_t _mdns_hostent_append_addr(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t result = 0LL;
  if (a1 && a2 && a3)
  {
    size_t v7 = a3;
    uint64_t v8 = malloc(a3);
    if (v8)
    {
      unsigned int v9 = v8;
      memcpy(v8, a2, v7);
      unsigned __int8 v10 = reallocf(*(void **)(a1 + 24), 8LL * *(int *)(a1 + 36) + 16);
      *(void *)(a1 + 24) = v10;
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t result = 0LL;
        uint64_t v12 = *(int *)(a1 + 36);
        v11[v12++] = v9;
        *(_DWORD *)(a1 + 36) = v12;
        v11[v12] = 0LL;
        return result;
      }

      *(_DWORD *)(a1 + 36) = 0;
      free(v9);
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

void *_mdns_parse_domain_name(uint64_t a1, int a2)
{
  uint64_t result = 0LL;
  if (a1)
  {
    int v4 = a2;
    if (a2)
    {
      uint64_t result = 0LL;
      LODWORD(v5) = 0;
      int v6 = 0;
      int v7 = 0;
LABEL_4:
      while (2)
      {
        int v8 = *(unsigned __int8 *)(a1 + v7);
        size_t v5 = (v5 + v8 + 1);
        uint64_t result = reallocf(result, v5);
        if (result)
        {
          if (v8)
          {
            int v9 = v4 - 1;
            if (v6 >= 1)
            {
              if (v4 == 1) {
                char v10 = 0;
              }
              else {
                char v10 = 46;
              }
              *((_BYTE *)result + v6++) = v10;
            }

            int v11 = v7 + 1;
            int v12 = v7 + 1 + v8;
            v7 += v4;
            int v4 = v9 - v8;
            BOOL v13 = (_BYTE *)(a1 + v11);
            do
            {
              if (!v9)
              {
                int v4 = -1;
                goto LABEL_4;
              }

              int v14 = *v13;
              if (v14 == 46)
              {
                size_t v5 = (v5 + 1);
                uint64_t result = reallocf(result, v5);
                if (!result) {
                  return result;
                }
                *((_BYTE *)result + v6++) = 92;
                LOBYTE(v14) = *v13;
              }

              *((_BYTE *)result + v6++) = v14;
              ++v13;
              --v9;
              --v8;
            }

            while (v8);
            int v7 = v12;
            if (v4) {
              continue;
            }
          }

          *((_BYTE *)result + v6) = 0;
        }

        break;
      }
    }
  }

  return result;
}

uint64_t _is_v4addr_ifaddr(_DWORD *a1)
{
  if (getifaddrs(&v6)) {
    return 0LL;
  }
  if (v6)
  {
    uint64_t v3 = v6;
    while (1)
    {
      if ((v3->ifa_flags & 1) != 0)
      {
        ifa_addr = v3->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 2 && *(_DWORD *)&ifa_addr->sa_data[2] == *a1) {
            break;
          }
        }
      }

      uint64_t v3 = v3->ifa_next;
      if (!v3) {
        goto LABEL_10;
      }
    }

    uint64_t v2 = 1LL;
  }

  else
  {
LABEL_10:
    uint64_t v2 = 0LL;
  }

  freeifaddrs(v6);
  return v2;
}

uint64_t _is_v6addr_ifaddr(void *a1, int a2)
{
  if (getifaddrs(&v11)) {
    return 0LL;
  }
  if (v11)
  {
    size_t v5 = v11;
    while (1)
    {
      if ((v5->ifa_flags & 1) != 0)
      {
        ifa_addr = v5->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 30 && *(_DWORD *)&ifa_addr[1].sa_data[6] == a2)
          {
            uint64_t v8 = *(void *)&ifa_addr->sa_data[6];
            uint64_t v7 = *(void *)&ifa_addr[1].sa_len;
            if (v8 == *a1 && v7 == a1[1]) {
              break;
            }
          }
        }
      }

      size_t v5 = v5->ifa_next;
      if (!v5) {
        goto LABEL_14;
      }
    }

    uint64_t v4 = 1LL;
  }

  else
  {
LABEL_14:
    uint64_t v4 = 0LL;
  }

  freeifaddrs(v11);
  return v4;
}

uint64_t _mdns_atfork_prepare()
{
  return pthread_mutex_lock(&_mdns_mutex);
}

uint64_t _mdns_atfork_parent()
{
  return pthread_mutex_unlock(&_mdns_mutex);
}

uint64_t _mdns_atfork_child()
{
  _mdns_old_sdref = _mdns_sdref;
  _mdns_sdref = 0LL;
  return pthread_mutex_unlock(&_mdns_mutex);
}

uint64_t search_set_flags(uint64_t result, char *__s1, int a3)
{
  if (result)
  {
    uint64_t v3 = *(uint64_t **)(result + 32);
    if (v3)
    {
      uint64_t v4 = *((unsigned int *)v3 + 4);
      if ((_DWORD)v4)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = *v3;
        while (1)
        {
          int v9 = *(const char ***)(v8 + 8 * v7);
          if (v9)
          {
            if (*v9)
            {
              uint64_t result = strcmp(__s1, *v9);
              if (!(_DWORD)result) {
                break;
              }
            }
          }

          if (v4 == ++v7) {
            return result;
          }
        }

        *(_DWORD *)(v3[1] + 4 * v7) = a3;
      }
    }
  }

  return result;
}

uint64_t *si_module_static_search()
{
  if (si_module_static_search_once != -1) {
    dispatch_once(&si_module_static_search_once, &__block_literal_global_1);
  }
  if (si_module_static_search_result) {
    return 0LL;
  }
  else {
    return &si_module_static_search_si;
  }
}

void search_close(uint64_t a1)
{
  if (a1)
  {
    int v1 = *(char **)(a1 + 32);
    if (v1)
    {
      for (uint64_t i = 0LL; i != 432; i += 24LL)
      {
        uint64_t v3 = *(void **)&v1[i];
        if (v3)
        {
          free(v3);
          uint64_t v4 = &v1[i];
          *(void *)uint64_t v4 = 0LL;
          *((void *)v4 + 2) = 0LL;
        }
      }

      free(v1);
    }
  }

uint64_t search_is_valid()
{
  return 0LL;
}

uint64_t search_user_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v8 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 1u, &v8);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_user_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          if ((*(_BYTE *)(v1 + 24LL * (*(_DWORD *)(v1 + 40) != 0) + 20) & 1) != 0) {
            int v6 = *(const char **)(v1 + 432);
          }
          else {
            int v6 = 0LL;
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_user_byuid(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v8 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 1u, &v8);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_user_byuid(module);
        if (v4)
        {
          uint64_t v5 = v4;
          if ((*(_BYTE *)(v1 + 24LL * (*(_DWORD *)(v1 + 40) != 0) + 20) & 1) != 0) {
            int v6 = *(const char **)(v1 + 432);
          }
          else {
            int v6 = 0LL;
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_user_byuuid(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1)
    {
      int v2 = 0;
      do
      {
        uint64_t result = search_get_module(v1, 1u, &v2);
        if (!result) {
          break;
        }
        uint64_t result = si_user_byuuid(result);
      }

      while (!result);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void **search_user_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  if ((*(_BYTE *)(v2 + 24LL * (*(_DWORD *)(v2 + 40) != 0) + 20) & 1) != 0)
  {
    uint64_t v3 = *(const char **)(v2 + 432);
    if (v3)
    {
      uint64_t v4 = (void **)si_user_all(*(void *)(v2 + 432));
      if (v4) {
        return v4;
      }
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  uint64_t v4 = 0LL;
  uint64_t v5 = 0LL;
  int v11 = 0;
LABEL_9:
  uint64_t v6 = v5;
LABEL_10:
  uint64_t v5 = v6;
  while (1)
  {
    uint64_t module = search_get_module(v2, 1u, &v11);
    if (!module) {
      break;
    }
    if (module != *(void *)(v2 + 432))
    {
      uint64_t v8 = si_user_all(module);
      uint64_t v6 = 1LL;
      if (!v8) {
        goto LABEL_10;
      }
      uint64_t v9 = v8;
      uint64_t v4 = si_list_concat(v4, v8);
      si_list_release(v9);
      goto LABEL_9;
    }
  }

  if (v4 && !(_DWORD)v5) {
    si_cache_add_list(v3, (const char **)a1, (uint64_t)v4);
  }
  return v4;
}

uint64_t search_group_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 2u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_group_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 48LL;
          if (!*(_DWORD *)(v1 + 64)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_group_bygid(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 2u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_group_bygid(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 48LL;
          if (!*(_DWORD *)(v1 + 64)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_group_byuuid(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1)
    {
      int v2 = 0;
      do
      {
        uint64_t result = search_get_module(v1, 2u, &v2);
        if (!result) {
          break;
        }
        uint64_t result = si_group_byuuid(result);
      }

      while (!result);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void **search_group_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 48LL;
  if (!*(_DWORD *)(v2 + 64)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_group_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 2u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_group_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_groupist(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t v4 = *(void *)(result + 32);
    if (v4)
    {
      int v8 = 0;
      while (1)
      {
        uint64_t result = search_get_module(v4, 3u, &v8);
        if (!result) {
          break;
        }
        if (result != *(void *)(v4 + 432))
        {
          uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(result + 40) + 80LL);
          if (v7)
          {
            uint64_t result = v7(v3, a2, a3);
            if (result) {
              break;
            }
          }
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

void **search_netgroup_byname(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 96LL;
  if (!*(_DWORD *)(v2 + 112)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_netgroup_byname(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 4u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_netgroup_byname(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_in_netgroup(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1)
    {
      int v2 = 0;
      while (1)
      {
        uint64_t result = search_get_module(v1, 4u, &v2);
        if (!result) {
          break;
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

uint64_t search_alias_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 5u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_alias_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 120LL;
          if (!*(_DWORD *)(v1 + 136)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_alias_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 120LL;
  if (!*(_DWORD *)(v2 + 136)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_alias_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 5u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_alias_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_host_byname(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int *a5)
{
  if (a5)
  {
    *a5 = 0;
    if (!a1 || !a2 || (uint64_t v6 = *(void *)(a1 + 32)) == 0)
    {
      uint64_t v7 = 0LL;
      int v8 = 3;
LABEL_6:
      *a5 = v8;
      return v7;
    }

uint64_t search_host_byaddr(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int *a5)
{
  if (a5)
  {
    *a5 = 0;
    if (!a1 || !a2 || (uint64_t v6 = *(void *)(a1 + 32)) == 0)
    {
      uint64_t v7 = 0LL;
      int v8 = 3;
LABEL_6:
      *a5 = v8;
      return v7;
    }

void **search_host_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 144LL;
  if (!*(_DWORD *)(v2 + 160)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_host_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 6u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_host_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_network_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 8u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_network_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 192LL;
          if (!*(_DWORD *)(v1 + 208)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_network_byaddr(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 8u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_network_byaddr(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 192LL;
          if (!*(_DWORD *)(v1 + 208)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_network_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 192LL;
  if (!*(_DWORD *)(v2 + 208)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_network_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 8u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_network_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_service_byname(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0LL;
  if (a1 && a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      int v10 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v3, 9u, &v10);
        if (!module) {
          break;
        }
        uint64_t v5 = (const char **)module;
        uint64_t v6 = si_service_byname(module);
        if (v6)
        {
          uint64_t v2 = v6;
          uint64_t v7 = 0LL;
          uint64_t v8 = 216LL;
          if (!*(_DWORD *)(v3 + 232)) {
            uint64_t v8 = 0LL;
          }
          if ((*(_BYTE *)(v3 + v8 + 20) & 1) != 0) {
            uint64_t v7 = *(const char **)(v3 + 432);
          }
          si_cache_add_item(v7, v5, v2);
          return v2;
        }
      }
    }

    return 0LL;
  }

  return v2;
}

uint64_t search_service_byport(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 9u, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_service_byport(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 216LL;
          if (!*(_DWORD *)(v1 + 232)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_service_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 216LL;
  if (!*(_DWORD *)(v2 + 232)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_service_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 9u, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_service_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_protocol_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xAu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_protocol_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 240LL;
          if (!*(_DWORD *)(v1 + 256)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_protocol_bynumber(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xAu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_protocol_bynumber(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 240LL;
          if (!*(_DWORD *)(v1 + 256)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_protocol_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 240LL;
  if (!*(_DWORD *)(v2 + 256)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_protocol_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 0xAu, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_protocol_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_rpc_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xBu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_rpc_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 264LL;
          if (!*(_DWORD *)(v1 + 280)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_rpc_bynumber(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xBu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_rpc_bynumber(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 264LL;
          if (!*(_DWORD *)(v1 + 280)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_rpc_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 264LL;
  if (!*(_DWORD *)(v2 + 280)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_rpc_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 0xBu, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_rpc_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_fs_byspec(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xCu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_fs_byspec(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 288LL;
          if (!*(_DWORD *)(v1 + 304)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_fs_byfile(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xCu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_fs_byfile(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 288LL;
          if (!*(_DWORD *)(v1 + 304)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_fs_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 288LL;
  if (!*(_DWORD *)(v2 + 304)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_fs_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 0xCu, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_fs_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_mac_byname(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xDu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_mac_byname(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 312LL;
          if (!*(_DWORD *)(v1 + 328)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

uint64_t search_mac_bymac(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = *(void *)(a1 + 32);
    if (v1)
    {
      int v9 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v1, 0xDu, &v9);
        if (!module) {
          break;
        }
        uint64_t v3 = (const char **)module;
        uint64_t v4 = si_mac_bymac(module);
        if (v4)
        {
          uint64_t v5 = v4;
          uint64_t v6 = 0LL;
          uint64_t v7 = 312LL;
          if (!*(_DWORD *)(v1 + 328)) {
            uint64_t v7 = 0LL;
          }
          if ((*(_BYTE *)(v1 + v7 + 20) & 1) != 0) {
            uint64_t v6 = *(const char **)(v1 + 432);
          }
          si_cache_add_item(v6, v3, v5);
          return v5;
        }
      }
    }
  }

  return 0LL;
}

void **search_mac_all(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 312LL;
  if (!*(_DWORD *)(v2 + 328)) {
    uint64_t v4 = 0LL;
  }
  if ((*(_BYTE *)(v2 + v4 + 20) & 1) == 0
    || (uint64_t v3 = *(const char **)(v2 + 432)) == 0LL
    || (uint64_t v5 = (void **)si_mac_all(*(void *)(v2 + 432))) == 0LL)
  {
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
    int v12 = 0;
LABEL_9:
    uint64_t v7 = v6;
LABEL_10:
    uint64_t v6 = v7;
    while (1)
    {
      uint64_t module = search_get_module(v2, 0xDu, &v12);
      if (!module) {
        break;
      }
      if (module != *(void *)(v2 + 432))
      {
        uint64_t v9 = si_mac_all(module);
        uint64_t v7 = 1LL;
        if (!v9) {
          goto LABEL_10;
        }
        uint64_t v10 = v9;
        uint64_t v5 = si_list_concat(v5, v9);
        si_list_release(v10);
        goto LABEL_9;
      }
    }

    if (v5 && !(_DWORD)v6) {
      si_cache_add_list(v3, (const char **)a1, (uint64_t)v5);
    }
  }

  return v5;
}

uint64_t search_addrinfo( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  if (a9) {
    *a9 = 104;
  }
  if (result)
  {
    uint64_t v9 = *(void *)(result + 32);
    if (v9)
    {
      int v12 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v9, 0xFu, &v12);
        if (!module) {
          break;
        }
        if (module != *(void *)(v9 + 432))
        {
          int v11 = *(uint64_t (**)(uint64_t))(*(void *)(module + 40) + 288LL);
          if (v11)
          {
            uint64_t result = v11(module);
            if (result) {
              return result;
            }
          }
        }
      }

      uint64_t result = 0LL;
      if (a9 && v12 >= 1)
      {
        uint64_t result = 0LL;
        *a9 = 108;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t search_wants_addrinfo(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 32);
    if (v1)
    {
      int v3 = 0;
      uint64_t result = search_get_module(v1, 0xFu, &v3);
      if (result)
      {
        uint64_t v2 = *(void *)(v1 + 432);
        while (result == v2 || !*(void *)(*(void *)(result + 40) + 288LL))
        {
          uint64_t result = search_get_module(v1, 0xFu, &v3);
          if (!result) {
            return result;
          }
        }

        return 1LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t search_nameinfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5)
{
  if (a5) {
    *a5 = 104;
  }
  if (!a1) {
    return 0LL;
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (!v9) {
    return 0LL;
  }
  int v21 = 0;
  while (1)
  {
    uint64_t module = search_get_module(v9, 0xEu, &v21);
    if (!module) {
      break;
    }
    int v14 = (const char **)module;
    uint64_t v15 = si_nameinfo(module, a2, a3, a4, a5, v11, v12, v13);
    if (v15)
    {
      uint64_t v16 = (uint64_t)v15;
      uint64_t v17 = 0LL;
      uint64_t v18 = 336LL;
      if (!*(_DWORD *)(v9 + 352)) {
        uint64_t v18 = 0LL;
      }
      if ((*(_BYTE *)(v9 + v18 + 20) & 1) != 0) {
        uint64_t v17 = *(const char **)(v9 + 432);
      }
      si_cache_add_item(v17, v14, v16);
      if (a5)
      {
        int v19 = 0;
LABEL_18:
        *a5 = v19;
        return v16;
      }

      return v16;
    }
  }

  uint64_t v16 = 0LL;
  if (a5 && v21 >= 1)
  {
    int v19 = 108;
    goto LABEL_18;
  }

  return v16;
}

uint64_t search_srv_byname(uint64_t result, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  if (result)
  {
    uint64_t v4 = *(void *)(result + 32);
    if (v4)
    {
      int v8 = 0;
      while (1)
      {
        uint64_t module = search_get_module(v4, 0x11u, &v8);
        if (!module) {
          break;
        }
        if (module != *(void *)(v4 + 432))
        {
          uint64_t v7 = *(uint64_t (**)(void))(*(void *)(module + 40) + 312LL);
          if (v7)
          {
            uint64_t result = v7();
            if (result) {
              return result;
            }
          }
        }
      }

      uint64_t result = 0LL;
      if (a4 && v8 >= 1)
      {
        uint64_t result = 0LL;
        *a4 = 108;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

void __si_module_static_search_block_invoke()
{
  si_module_static_search_suint64_t i = (uint64_t)strdup("search");
  uint64_t v0 = (void **)calloc(1uLL, 0x1B8uLL);
  qword_18C43C6B0 = (uint64_t)v0;
  if (si_module_config_modules_for_category((uint64_t)v0, 0, 5, (uint64_t)off_18965FC90))
  {
    free((void *)si_module_static_search_si);
    si_module_static_search_suint64_t i = 0LL;
    free(v0);
    qword_18C43C6B0 = 0LL;
    si_module_static_search_uint64_t result = 1;
    return;
  }

  v0[54] = (void *)**v0;
  uint64_t v1 = getenv("SYSINFO_CONF_ENABLE");
  if (v1)
  {
    if (!strcmp(v1, "1"))
    {
      uint64_t v2 = fopen("/etc/sysinfo.conf", "r");
      *__error() = 0;
      if (v2)
      {
        line = _fsi_get_line();
        if (!line)
        {
LABEL_43:
          fclose(v2);
          return;
        }

        uint64_t v4 = line;
        while (*v4 == 35)
        {
LABEL_42:
          free(v4);
          uint64_t v4 = _fsi_get_line();
          if (!v4) {
            goto LABEL_43;
          }
        }

        int v8 = 0;
        uint64_t v5 = (const char **)_fsi_tokenize(v4, "\t: ", 0, &v8);
        uint64_t v6 = *v5;
        if (!strcmp(*v5, "default"))
        {
          unsigned int v7 = 0;
        }

        else if (!strcmp(v6, "user"))
        {
          unsigned int v7 = 1;
        }

        else if (!strcmp(v6, "group"))
        {
          unsigned int v7 = 2;
        }

        else if (!strcmp(v6, "grouplist"))
        {
          unsigned int v7 = 3;
        }

        else if (!strcmp(v6, "netgroup"))
        {
          unsigned int v7 = 4;
        }

        else if (!strcmp(v6, "alias"))
        {
          unsigned int v7 = 5;
        }

        else if (!strcmp(v6, "host"))
        {
          unsigned int v7 = 6;
        }

        else if (!strcmp(v6, "network"))
        {
          unsigned int v7 = 8;
        }

        else if (!strcmp(v6, "service"))
        {
          unsigned int v7 = 9;
        }

        else if (!strcmp(v6, "protocol"))
        {
          unsigned int v7 = 10;
        }

        else if (!strcmp(v6, "rpc"))
        {
          unsigned int v7 = 11;
        }

        else if (!strcmp(v6, "fs"))
        {
          unsigned int v7 = 12;
        }

        else if (!strcmp(v6, "mac"))
        {
          unsigned int v7 = 13;
        }

        else if (!strcmp(v6, "addrinfo"))
        {
          unsigned int v7 = 15;
        }

        else
        {
          if (strcmp(v6, "nameinfo"))
          {
LABEL_41:
            free(v5);
            goto LABEL_42;
          }

          unsigned int v7 = 14;
        }

        si_module_config_modules_for_category((uint64_t)v0, v7, v8, (uint64_t)v5);
        goto LABEL_41;
      }
    }
  }

uint64_t si_module_config_modules_for_category(uint64_t a1, unsigned int a2, int a3, uint64_t a4)
{
  uint64_t v5 = a1 + 24LL * a2;
  size_t v6 = (a3 - 1);
  *(_DWORD *)(v5 + 16) = v6;
  if (a3 == 1) {
    return 0xFFFFFFFFLL;
  }
  *(void *)uint64_t v5 = calloc(v6, 8uLL);
  uint64_t v10 = calloc(*(unsigned int *)(v5 + 16), 4uLL);
  uint64_t v11 = a1 + 24LL * a2;
  *(void *)(v11 + 8) = v10;
  uint64_t v12 = (void **)(v11 + 8);
  if (*(void *)v5) {
    BOOL v13 = v10 == 0LL;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    free(*(void **)v5);
    free(*v12);
    return 0xFFFFFFFFLL;
  }

  if (a3 >= 2)
  {
    int v15 = 0;
    uint64_t v16 = (_DWORD *)(a1 + 24LL * a2 + 20);
    uint64_t v17 = a3;
    uint64_t v18 = (char **)(a4 + 8);
    uint64_t v19 = v17 - 1;
    do
    {
      uint64_t v20 = si_module_with_name(*v18);
      if (v20)
      {
        *(void *)(*(void *)v5 + 8LL * v15++) = v20;
        if (!strcmp(*v18, "cache")) {
          *v16 |= 1u;
        }
      }

      ++v18;
      --v19;
    }

    while (v19);
  }

  return 0LL;
}

uint64_t search_get_module(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  if (!a3) {
    return 0LL;
  }
  unsigned int v3 = (*a3)++;
  unsigned int v4 = *(_DWORD *)(a1 + 24LL * a2 + 16);
  if (v4) {
    BOOL v5 = v3 >= v4;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (v3 < *(_DWORD *)(a1 + 16))
    {
      uint64_t v6 = 8LL * (int)v3;
      unsigned int v7 = (char *)(*(void *)(a1 + 8) + 4LL * (int)v3);
      while (1)
      {
        char v8 = *v7;
        v7 += 4;
        if ((v8 & 1) == 0) {
          break;
        }
        *a3 = v3 + 2;
        v6 += 8LL;
        if (*(_DWORD *)(a1 + 16) <= ++v3) {
          return 0LL;
        }
      }

      uint64_t v10 = *(void *)a1 + v6;
      return *(void *)v10;
    }

    return 0LL;
  }

  uint64_t v10 = *(void *)(a1 + 24LL * a2) + 8LL * (int)v3;
  return *(void *)v10;
}

void **si_list_add(void **a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a2)
  {
    if (!a1)
    {
      unsigned int v4 = calloc(1uLL, 0x18uLL);
      uint64_t v2 = (void **)v4;
      if (!v4)
      {
LABEL_10:
        free(v2);
        uint64_t v2 = 0LL;
        *__error() = 12;
        return v2;
      }

      *unsigned int v4 = 1;
    }

    BOOL v5 = reallocf(v2[2], 8LL * (*((_DWORD *)v2 + 1) + 1));
    v2[2] = v5;
    if (!v5) {
      goto LABEL_10;
    }
    char v8 = (unsigned int *)(a2 + 12);
    do
      unsigned int v9 = __ldaxr(v8);
    while (__stlxr(v9 + 1, v8));
    if ((v9 & 0x80000000) != 0) {
      si_list_add_cold_1((uint64_t)v5, v6, v7);
    }
    uint64_t v10 = v2[2];
    uint64_t v11 = *((unsigned int *)v2 + 1);
    *((_DWORD *)v2 + 1) = v11 + 1;
    v10[v11] = a2;
    if (!v2[2]) {
      goto LABEL_10;
    }
  }

  return v2;
}

uint64_t si_item_retain(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    unsigned int v3 = (unsigned int *)(result + 12);
    do
      unsigned int v4 = __ldaxr(v3);
    while (__stlxr(v4 + 1, v3));
    if ((v4 & 0x80000000) != 0) {
      si_list_add_cold_1(result, a2, a3);
    }
  }

  return result;
}

void **si_list_concat(void **a1, uint64_t a2)
{
  uint64_t v2 = a1;
  if (a2)
  {
    unsigned int v4 = *(_DWORD *)(a2 + 4);
    if (v4)
    {
      if (!a1)
      {
        uint64_t v2 = (void **)calloc(1uLL, 0x18uLL);
        *(_DWORD *)uint64_t v2 = 1;
        unsigned int v4 = *(_DWORD *)(a2 + 4);
      }

      BOOL v5 = reallocf(v2[2], 8 * (*((unsigned int *)v2 + 1) + (unint64_t)v4));
      v2[2] = v5;
      if (v5)
      {
        unsigned int v8 = *(_DWORD *)(a2 + 4);
        if (v8)
        {
          for (unint64_t i = 0LL; i < v8; *((void *)v2[2] + (v13 + i++)) = v10)
          {
            uint64_t v10 = *(void *)(*(void *)(a2 + 16) + 8 * i);
            if (v10)
            {
              uint64_t v11 = (unsigned int *)(v10 + 12);
              do
                unsigned int v12 = __ldaxr(v11);
              while (__stlxr(v12 + 1, v11));
              if ((v12 & 0x80000000) != 0) {
                si_list_add_cold_1((uint64_t)v5, v6, v7);
              }
              unsigned int v8 = *(_DWORD *)(a2 + 4);
            }

            int v13 = *((_DWORD *)v2 + 1);
          }
        }

        else
        {
          int v13 = *((_DWORD *)v2 + 1);
        }

        *((_DWORD *)v2 + 1) = v13 + v8;
      }

      else
      {
        free(v2);
        uint64_t v2 = 0LL;
        *__error() = 12;
      }
    }
  }

  return v2;
}

uint64_t si_list_next(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(unsigned int *)(result + 8);
    if (v1 >= *(_DWORD *)(result + 4))
    {
      return 0LL;
    }

    else
    {
      uint64_t v2 = *(void *)(result + 16);
      *(_DWORD *)(result + 8) = v1 + 1;
      return *(void *)(v2 + 8 * v1);
    }
  }

  return result;
}

uint64_t si_list_reset(uint64_t result)
{
  if (result) {
    *(_DWORD *)(result + 8) = 0;
  }
  return result;
}

unsigned int *si_list_retain(unsigned int *result)
{
  if (result)
  {
    do
      unsigned int v1 = __ldaxr(result);
    while (__stlxr(v1 + 1, result));
    if ((v1 & 0x80000000) != 0) {
      si_list_retain_cold_1();
    }
  }

  return result;
}

void si_list_release(uint64_t a1)
{
  if (a1)
  {
    do
      int v2 = __ldaxr((unsigned int *)a1);
    while (__stlxr(v2 - 1, (unsigned int *)a1));
    if (v2 <= 0) {
      si_list_release_cold_1();
    }
    if (v2 == 1)
    {
      if (*(_DWORD *)(a1 + 4))
      {
        unint64_t v3 = 0LL;
        do
          si_item_release(*(unsigned int **)(*(void *)(a1 + 16) + 8 * v3++));
        while (v3 < *(unsigned int *)(a1 + 4));
      }

      free(*(void **)(a1 + 16));
      free((void *)a1);
    }
  }

void si_item_release(unsigned int *a1)
{
  if (a1)
  {
    unsigned int v1 = a1 + 3;
    do
      int v2 = __ldaxr(v1);
    while (__stlxr(v2 - 1, v1));
    if (v2 <= 0) {
      si_item_release_cold_1();
    }
    if (v2 == 1) {
      free(a1);
    }
  }

void OUTLINED_FUNCTION_0(const char *a1, const char *a2, uint64_t a3, const char *a4)
{
}

uint64_t si_inet_config(_DWORD *a1, _DWORD *a2)
{
  int check = 1;
  int v4 = net_config_token;
  if ((net_config_token & 0x80000000) == 0) {
    goto LABEL_29;
  }
  if (notify_register_check("com.apple.system.config.network_change", &net_config_token))
  {
    net_config_token = -1;
    goto LABEL_9;
  }

  int v4 = net_config_token;
  if ((net_config_token & 0x80000000) == 0)
  {
LABEL_29:
    if (notify_check(v4, &check))
    {
      int check = 1;
    }

    else if (!check)
    {
      goto LABEL_20;
    }
  }

void freeaddrinfo(addrinfo *a1)
{
  if (a1)
  {
    unsigned int v1 = a1;
    do
    {
      ai_addr = v1->ai_addr;
      ai_next = v1->ai_next;
      if (ai_addr) {
        free(ai_addr);
      }
      ai_canonname = v1->ai_canonname;
      if (ai_canonname) {
        free(ai_canonname);
      }
      free(v1);
      unsigned int v1 = ai_next;
    }

    while (ai_next);
  }

const char *__cdecl gai_strerror(int a1)
{
  else {
    return off_18965FCB8[a1 - 1];
  }
}

void si_set_nat64_v4_requires_synthesis(uint64_t (*a1)(void))
{
  if (a1)
  {
    nat64_v4_requires_synthesis = a1;
  }

  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT)) {
      si_set_nat64_v4_requires_synthesis_cold_1();
    }
  }

void si_set_nat64_v4_synthesize(uint64_t (*a1)(void, void, void))
{
  if (a1)
  {
    nat64_v4_synthesize = a1;
  }

  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT)) {
      si_set_nat64_v4_synthesize_cold_1();
    }
  }

void si_set_path_check(uint64_t (*a1)(void, void))
{
  if (a1)
  {
    path_int check = a1;
  }

  else
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT)) {
      si_set_path_check_cold_1();
    }
  }

_OWORD *si_nameinfo( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v47 = *MEMORY[0x1895FEE08];
  unint64_t v37 = 0LL;
  int v38 = 0LL;
  if (!a1 || !a2) {
    goto LABEL_31;
  }
  char v10 = a3;
  if (a5) {
    *a5 = 0;
  }
  int v12 = *(unsigned __int8 *)(a2 + 1);
  if (v12 == 30)
  {
    __int128 v39 = *(_OWORD *)(a2 + 8);
    unsigned int v14 = *(unsigned __int16 *)(a2 + 2);
    if (v39 == 255)
    {
      char v18 = *(_BYTE *)(a2 + 9);
      if ((v18 & 0xF) != 1)
      {
        unsigned int v13 = 0;
        if ((v18 & 0xF0) == 0x30 || (v18 & 0xF) != 2) {
          goto LABEL_22;
        }
      }
    }

    else if (v39 != 254 || (*(_BYTE *)(a2 + 9) & 0xC0) != 0x80)
    {
      unsigned int v13 = 0;
      goto LABEL_22;
    }

    if (!WORD1(v39))
    {
      unsigned int v13 = *(_DWORD *)(a2 + 24);
      WORD1(v39) = bswap32(v13) >> 16;
      goto LABEL_22;
    }

    unsigned int v13 = __rev16(WORD1(v39));
    int v19 = *(_DWORD *)(a2 + 24);
    if (v19 == bswap32(WORD1(v39)) >> 16 || !v19)
    {
LABEL_22:
      if (*(_DWORD *)(a2 + 8) || *(_DWORD *)(a2 + 12)) {
        goto LABEL_24;
      }
      int v24 = *(_DWORD *)(a2 + 16);
      if (v24)
      {
        if (v24 == -65536)
        {
          int v25 = *(_DWORD *)(a2 + 20);
          goto LABEL_38;
        }
      }

      else
      {
        int v25 = *(_DWORD *)(a2 + 20);
        if ((v25 | 0x1000000) != 0x1000000)
        {
LABEL_38:
          int v40 = v25;
          uint64_t v46 = 0LL;
          __int16 v43 = 528;
          __int16 v44 = v14;
          int v15 = (__int128 *)&v40;
          int v45 = v25;
          if ((a3 & 2) != 0) {
            goto LABEL_39;
          }
          goto LABEL_26;
        }
      }

LABEL_26:
  uint64_t v20 = si_host_byaddr(a1);
  if (!v20) {
    goto LABEL_39;
  }
  int v21 = (unsigned int *)v20;
  uint64_t v22 = *(const char **)(v20 + 32);
  if (!v22)
  {
    si_item_release(v21);
    goto LABEL_31;
  }

  unsigned int v23 = strdup(v22);
  int v38 = v23;
  si_item_release(v21);
  if (!v23)
  {
LABEL_46:
    if (a5)
    {
      uint64_t v16 = 0LL;
      int v17 = 106;
      goto LABEL_33;
    }

    return 0LL;
  }
        }
      }

      return 0LL;
    }
  }

  return v8;
}

LABEL_40:
  uint64_t v26 = 0LL;
  if ((v10 & 8) != 0 || !v14) {
    goto LABEL_49;
  }
  uint64_t v27 = si_service_byport(a1);
  if (!v27)
  {
    uint64_t v26 = 0LL;
    goto LABEL_49;
  }

  unsigned int v28 = (unsigned int *)v27;
  unint64_t v29 = *(const char **)(v27 + 32);
  if (!v29)
  {
    si_item_release(v28);
    free(v23);
    if (!a5) {
      return 0LL;
    }
LABEL_32:
    uint64_t v16 = 0LL;
    int v17 = 104;
    goto LABEL_33;
  }

  uint64_t v26 = strdup(v29);
  unint64_t v37 = v26;
  si_item_release(v28);
  if (!v26)
  {
    free(v23);
    goto LABEL_46;
  }

LABEL_49:
  if ((v10 & 4) == 0 && !v23)
  {
    int v30 = *(unsigned __int8 *)(a2 + 1);
    if (v30 == 30)
    {
      if (!v13)
      {
        int v31 = &v39;
        int v32 = 30;
        socklen_t v33 = 46;
LABEL_61:
        if (inet_ntop(v32, v31, __s1, v33)) {
          int v38 = strdup(__s1);
        }
        goto LABEL_63;
      }

      WORD1(v39) = 0;
      if (inet_ntop(30, &v39, __s1, 0x2Eu))
      {
        if (!if_indextoname(v13, v41))
        {
          if (a5) {
            *a5 = 104;
          }
          free(v26);
          return 0LL;
        }

        asprintf(&v38, "%s%%%s", __s1, v41);
      }
    }

    else if (v30 == 2)
    {
      int v31 = (__int128 *)&v40;
      int v32 = 2;
      socklen_t v33 = 16;
      goto LABEL_61;
    }
  }

LABEL_63:
  if (!v26)
  {
    asprintf(&v37, "%hu", __rev16(v14));
    uint64_t v26 = v37;
  }

  unsigned int v34 = v38;
  if (v38 && v26)
  {
    uint64_t v16 = LI_ils_create("L4488ss", (uint64_t)v15, a3, a4, (uint64_t)a5, a6, a7, a8, a1);
    unsigned int v34 = v38;
  }

  else
  {
    uint64_t v16 = 0LL;
    if (a5)
    {
      if ((v10 & 4) != 0) {
        int v35 = 108;
      }
      else {
        int v35 = 106;
      }
      *a5 = v35;
    }
  }

  free(v34);
  free(v37);
  return v16;
}

  freeaddrinfo(v69);
  sigsetmask((int)v26);
  return -1;
}

uint64_t _gai_serv_to_port(const char *a1, uint64_t a2, _WORD *a3)
{
  int v4 = si_search();
  uint64_t v5 = si_service_byname((uint64_t)v4);
  if (v5)
  {
    if (a3) {
      *a3 = bswap32(*(unsigned __int16 *)(v5 + 48)) >> 16;
    }
    si_item_release((unsigned int *)v5);
    return 0LL;
  }

  return 0xFFFFFFFFLL;
}

uint64_t _gai_numericserv(const char *a1, _WORD *a2)
{
  if (!a1)
  {
    if (!a2) {
      return 1LL;
    }
    LOWORD(v5) = 0;
LABEL_10:
    *a2 = v5;
    return 1LL;
  }

  uint64_t v4 = strtol(a1, &__endptr, 10);
  if (!*a1) {
    return 0LL;
  }
  uint64_t v5 = v4;
  uint64_t result = 0LL;
  if (!*__endptr && (v5 & 0x8000000000000000LL) == 0 && v5 < 0x10000)
  {
    if (!a2) {
      return 1LL;
    }
    goto LABEL_10;
  }

  return result;
}

_OWORD *si_addrinfo_v4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, a6, a7, a8, a1);
}

_OWORD *si_addrinfo_v4_mapped( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, a6, a7, a8, a1);
}

_OWORD *si_addrinfo_v6( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8)
{
  if (*a6 == 254 && (a6[1] & 0xC0) == 0x80 && *((_WORD *)a6 + 1))
  {
    unsigned int v8 = __rev16(*((unsigned __int16 *)a6 + 1));
    if ((_DWORD)a7) {
      a7 = a7;
    }
    else {
      a7 = v8;
    }
  }

  return LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
}

void **si_addrinfo_list( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  unsigned __int16 v10 = a7;
  int v12 = a4;
  BOOL v15 = (a2 & 0x100) == 0 && a6 != 0LL;
  int v16 = (a2 & 0x800) == 0 || v15;
  if (!a6)
  {
    uint64_t v20 = 0LL;
    goto LABEL_22;
  }

  unsigned __int16 v17 = a8;
  if ((_DWORD)a4 != 17 && (_DWORD)a4)
  {
    uint64_t v20 = 0LL;
  }

  else
  {
    int v19 = (unsigned int *)si_addrinfo_v6(a1, 0LL, 2LL, 17LL, (unsigned __int16)a7, a6, (unsigned __int16)a8, a10);
    uint64_t v20 = si_list_add(0LL, (uint64_t)v19);
    si_item_release(v19);
    if (!v12) {
      goto LABEL_19;
    }
  }

  if (v12 == 58)
  {
    uint64_t v21 = v10;
    uint64_t v22 = v17;
    uint64_t v23 = a1;
    uint64_t v24 = 3LL;
    uint64_t v25 = 58LL;
    goto LABEL_21;
  }

  if (v12 != 6) {
    goto LABEL_22;
  }
LABEL_19:
  uint64_t v21 = v10;
  uint64_t v22 = v17;
  uint64_t v23 = a1;
  uint64_t v24 = 1LL;
  uint64_t v25 = 6LL;
LABEL_21:
  uint64_t v26 = (unsigned int *)si_addrinfo_v6(v23, 0LL, v24, v25, v21, a6, v22, a10);
  uint64_t v20 = si_list_add(v20, (uint64_t)v26);
  si_item_release(v26);
LABEL_22:
  if (a5)
  {
    if (v12 != 17 && v12)
    {
      unsigned int v28 = 0LL;
    }

    else
    {
      if (v16)
      {
        uint64_t v27 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        unsigned int v28 = si_list_add(0LL, (uint64_t)v27);
      }

      else
      {
        uint64_t v27 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0LL, 2LL, 17LL, v10, a5, 0LL, a9);
        uint64_t v20 = si_list_add(v20, (uint64_t)v27);
        unsigned int v28 = 0LL;
      }

      si_item_release(v27);
    }

    if (v12 == 6 || !v12)
    {
      if (v16)
      {
        unint64_t v29 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        unsigned int v28 = si_list_add(v28, (uint64_t)v29);
      }

      else
      {
        unint64_t v29 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0LL, 1LL, 6LL, v10, a5, 0LL, a9);
        uint64_t v20 = si_list_add(v20, (uint64_t)v29);
      }

      si_item_release(v29);
    }

    if (v12 == 1)
    {
      if (v16)
      {
        int v30 = (unsigned int *)LI_ils_create("L448844444Ss", a2, a3, a4, a5, (uint64_t)a6, a7, a8, a1);
        unsigned int v28 = si_list_add(v28, (uint64_t)v30);
      }

      else
      {
        int v30 = (unsigned int *)si_addrinfo_v4_mapped(a1, 0LL, 3LL, 1LL, v10, a5, 0LL, a9);
        uint64_t v20 = si_list_add(v20, (uint64_t)v30);
      }

      si_item_release(v30);
    }
  }

  else
  {
    unsigned int v28 = 0LL;
  }

  int v31 = si_list_concat(v20, (uint64_t)v28);
  si_list_release((uint64_t)v28);
  return v31;
}

void **si_addrinfo_list_from_hostent( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t *a8)
{
  if (a8 && (unsigned int v14 = (void *)a8[3]) != 0LL && *v14)
  {
    int v16 = 0LL;
    uint64_t v17 = 8LL;
    do
    {
      __memcpy_chk();
      int v19 = si_addrinfo_list(a1, a2, v18, a4, 0LL, v27, a5, a6, 0LL, *a8);
      int v16 = si_list_concat(v16, (uint64_t)v19);
      si_list_release((uint64_t)v19);
      uint64_t v20 = *(void *)(a8[3] + v17);
      v17 += 8LL;
    }

    while (v20);
    if (!a7) {
      return v16;
    }
  }

  else
  {
    int v16 = 0LL;
    if (!a7) {
      return v16;
    }
  }

  uint64_t v21 = (void *)a7[3];
  if (v21 && *v21)
  {
    uint64_t v22 = 8LL;
    do
    {
      __memcpy_chk();
      uint64_t v24 = si_addrinfo_list(a1, a2, v23, a4, (uint64_t)v27, 0LL, a5, 0LL, *a7, 0LL);
      int v16 = si_list_concat(v16, (uint64_t)v24);
      si_list_release((uint64_t)v24);
      uint64_t v25 = *(void *)(a7[3] + v22);
      v22 += 8LL;
    }

    while (v25);
  }

  return v16;
}

uint64_t _gai_addr_sort(uint64_t a1, uint64_t a2)
{
  return si_destination_compare( (unsigned __int8 *)(*(void *)a2 + 52LL),  0,  (unsigned __int8 *)(*(void *)a1 + 52LL),  0,  1);
}

unsigned int *_gai_simple( uint64_t a1, uint64_t a2, const char *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  if ((a7 & 0x1000) != 0)
  {
    if (!a3)
    {
      if (a9)
      {
        uint64_t result = 0LL;
        int v14 = 3;
        goto LABEL_15;
      }

      return 0LL;
    }

    unsigned __int16 v20 = *(_WORD *)a3;
  }

  else if (_gai_serv_to_port(a3, a6, &v20))
  {
    if (a9)
    {
      uint64_t result = 0LL;
      int v14 = 108;
LABEL_15:
      *a9 = v14;
      return result;
    }

    return 0LL;
  }

  if ((a7 & 4) != 0)
  {
    if (a4 == 30)
    {
      int v16 = (unsigned int *)si_host_byaddr(a1);
      BOOL v15 = 0LL;
      goto LABEL_24;
    }

    if (a4 == 2) {
      BOOL v15 = (unsigned int *)si_host_byaddr(a1);
    }
    else {
      BOOL v15 = 0LL;
    }
LABEL_23:
    int v16 = 0LL;
    goto LABEL_24;
  }

  if ((a4 | 2) == 2) {
    BOOL v15 = (unsigned int *)si_host_byname(a1);
  }
  else {
    BOOL v15 = 0LL;
  }
  if (a4 != 30 && a4) {
    goto LABEL_23;
  }
  int v16 = (unsigned int *)si_host_byname(a1);
LABEL_24:
  if (v15) {
    uint64_t v17 = (uint64_t *)(v15 + 8);
  }
  else {
    uint64_t v17 = 0LL;
  }
  if (v16) {
    uint64_t v18 = (uint64_t *)(v16 + 8);
  }
  else {
    uint64_t v18 = 0LL;
  }
  int v19 = (unsigned int *)si_addrinfo_list_from_hostent(a1, a7, (uint64_t)a3, a6, v20, 0LL, v17, v18);
  si_item_release(v15);
  si_item_release(v16);
  return _gai_sort_list(v19, a7);
}

unsigned int *_gai_sort_list(unsigned int *a1, __int16 a2)
{
  int v2 = a1;
  if (a1)
  {
    unsigned int v3 = a1[1];
    if (v3)
    {
      int v4 = 0;
      int v5 = 0;
      uint64_t v6 = *((void *)a1 + 2);
      uint64_t v7 = a1[1];
      do
      {
        unsigned int v8 = *(_DWORD **)v6;
        if (*(_DWORD *)(*(void *)v6 + 36LL) == 30)
        {
          if (v8[15] || v8[16] || v8[17] != -65536) {
            ++v4;
          }
          else {
            ++v5;
          }
        }

        v6 += 8LL;
        --v7;
      }

      while (v7);
    }

    else
    {
      int v5 = 0;
      int v4 = 0;
    }

    BOOL v10 = (a2 & 0x100) == 0 && v4 != 0;
    if ((a2 & 0x800) == 0) {
      BOOL v10 = 1;
    }
    if (v10 && v5)
    {
      size_t v11 = v3 - v5;
      if (v3 == v5) {
        return 0LL;
      }
      int v14 = (unsigned int *)calloc(1uLL, 0x18uLL);
      if (!v14) {
        return v2;
      }
      int v12 = v14;
      *int v14 = *v2;
      v14[1] = v11;
      BOOL v15 = calloc(v11, 8uLL);
      *((void *)v12 + 2) = v15;
      if (!v15)
      {
        free(v12);
        return v2;
      }

      v12[2] = 0;
      unint64_t v16 = v2[1];
      if ((_DWORD)v16)
      {
        for (unint64_t i = 0LL; i < v16; ++i)
        {
          uint64_t v18 = *(unsigned int **)(*((void *)v2 + 2) + 8 * i);
          if (v18[9] != 30 || v18[15] || v18[16] || v18[17] != -65536)
          {
            uint64_t v19 = *((void *)v12 + 2);
            uint64_t v20 = v12[2];
            v12[2] = v20 + 1;
            *(void *)(v19 + 8 * v20) = v18;
          }

          else
          {
            si_item_release(v18);
            unint64_t v16 = v2[1];
          }
        }
      }

      v12[2] = 0;
      free(*((void **)v2 + 2));
      free(v2);
      unsigned int v3 = v12[1];
    }

    else
    {
      int v12 = a1;
    }

    qsort(*((void **)v12 + 2), v3, 8uLL, (int (__cdecl *)(const void *, const void *))_gai_addr_sort);
    return v12;
  }

  return v2;
}

uint64_t si_srv_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_wants_addrinfo(uint64_t a1)
{
  else {
    return 0LL;
  }
}

BOOL _gai_nat64_can_v4_address_be_synthesized(unsigned int *a1)
{
  if (!a1)
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    BOOL result = os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_FAULT);
    if (!result) {
      return result;
    }
    _gai_nat64_can_v4_address_be_synthesized_cold_1();
    return 0LL;
  }

  unsigned int v1 = bswap32(*a1);
  if ((v1 & 0xFF000000) == 0 || (v1 & 0xFF000000) == 2130706432) {
    return 0LL;
  }
  BOOL v4 = v1 >> 8 == 12605539 || (v1 & 0xFFFF0000) == -1442971648;
  if (v4 || (v1 & 0xFFFFFFF8) == -1073741824) {
    return 0LL;
  }
  unsigned int v6 = v1 >> 28;
  return *a1 != -1 && v6 != 14;
}

unsigned int *si_addrinfo( uint64_t a1, _BYTE *a2, _BYTE *a3, unsigned int a4, uint64_t a5, unsigned int a6, int a7, char *a8, int *a9)
{
  unsigned int v72 = 0;
  unsigned int v73 = a4;
  if (a9)
  {
    *a9 = 0;
    if (!a1)
    {
      BOOL result = 0LL;
      int v16 = 104;
LABEL_34:
      *a9 = v16;
      return result;
    }
  }

  else if (!a1)
  {
    return 0LL;
  }

  if (a2)
  {
    if (*a2) {
      uint64_t v17 = (uint64_t)a2;
    }
    else {
      uint64_t v17 = 0LL;
    }
    if (a3) {
      goto LABEL_10;
    }
LABEL_14:
    uint64_t v18 = 0LL;
    goto LABEL_15;
  }

  uint64_t v17 = 0LL;
  if (!a3) {
    goto LABEL_14;
  }
LABEL_10:
  if (*a3) {
    uint64_t v18 = (uint64_t)a3;
  }
  else {
    uint64_t v18 = 0LL;
  }
LABEL_15:
  if (!(v17 | v18)) {
    goto LABEL_16;
  }
  if (a4 > 0x1E || ((1 << a4) & 0x40000005) == 0)
  {
    if (a9)
    {
      BOOL result = 0LL;
      int v16 = 105;
      goto LABEL_34;
    }

    return 0LL;
  }

  if ((_DWORD)a5 == 2)
  {
    char v19 = 0;
    if (a6 && a6 != 17) {
      goto LABEL_32;
    }
  }

  else if ((_DWORD)a5 == 1)
  {
    char v19 = 1;
    if (a6 && a6 != 6)
    {
LABEL_32:
      if (a9)
      {
        BOOL result = 0LL;
        int v16 = 112;
        goto LABEL_34;
      }

      return 0LL;
    }
  }

  else
  {
    char v19 = 0;
  }

  if ((a7 & 5) == 0)
  {
    if (v17)
    {
      if (strcmp((const char *)v17, "localhost"))
      {
        if (strcmp((const char *)v17, "0.0.0.0"))
        {
          if (strcmp((const char *)v17, "127.0.0.1"))
          {
            if (strcmp((const char *)v17, "::"))
            {
              if (strcmp((const char *)v17, "::1"))
              {
                pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
                if (path_check) {
                  path_check(v17, v18);
                }
              }
            }
          }
        }
      }
    }
  }

  unsigned int v20 = a7 & 0xFFFFF5FF | 0x800;
  if ((a7 & 0x200) == 0) {
    unsigned int v20 = a7;
  }
  if (a4 == 30)
  {
    if ((v20 & 0x800) != 0) {
      uint64_t v21 = v20;
    }
    else {
      uint64_t v21 = v20 & 0xFFFFFEFF;
    }
  }

  else
  {
    uint64_t v21 = v20 & 0xFFFFF6FF;
  }

  if (a6) {
    BOOL v22 = 0;
  }
  else {
    BOOL v22 = (_DWORD)a5 == 2;
  }
  int v70 = 0;
  v69[0] = 0LL;
  v69[1] = 0LL;
  if (v22) {
    unsigned int v23 = 17;
  }
  else {
    unsigned int v23 = a6;
  }
  else {
    uint64_t v24 = v23;
  }
  unsigned __int16 v71 = 0;
  uint64_t v25 = v21;
  if ((v21 & 0x1000000) != 0)
  {
    int v30 = 0LL;
    if (v17 && v18)
    {
      asprintf(&v74, "%s.%s", (const char *)v18, (const char *)v17);
      int v31 = *(uint64_t (**)(uint64_t, char *, char *, int *))(*(void *)(a1 + 40) + 312LL);
      if (v31)
      {
        uint64_t v32 = v31(a1, v74, a8, a9);
        free(v74);
        if (v32)
        {
          unint64_t v34 = *(unsigned int *)(v32 + 4);
          if ((_DWORD)v34)
          {
            int v35 = -1;
            __int16 v66 = v25;
            LODWORD(v36) = v25;
            while (2)
            {
              unint64_t v37 = *(uint64_t **)(v32 + 16);
              int v38 = 0x7FFFFFFF;
              unint64_t v39 = v34;
              do
              {
                uint64_t v40 = *v37++;
                int v41 = *(unsigned __int16 *)(v40 + 32);
                if (v38 > v41 && v35 < v41) {
                  int v38 = v41;
                }
                --v39;
              }

              while (v39);
              if (v38 != 0x7FFFFFFF)
              {
                for (unint64_t i = 0LL; i < v34; ++i)
                {
                  uint64_t v44 = *(void *)(*(void *)(v32 + 16) + 8 * i);
                  int v46 = *(unsigned __int16 *)(v44 + 32);
                  uint64_t v45 = v44 + 32;
                  if (v38 == v46)
                  {
                    uint64_t v36 = v36 | 0x1000;
                    uint64_t v47 = _gai_simple( a1,  *(void *)(v45 + 8),  (const char *)(v45 + 4),  a4,  v33,  v24,  v36,  (uint64_t)a8,  a9);
                    if (v47)
                    {
                      int v30 = v47;
                      goto LABEL_119;
                    }

                    unint64_t v34 = *(unsigned int *)(v32 + 4);
                  }
                }

                int v35 = v38;
                if (v34) {
                  continue;
                }
              }

              break;
            }

            int v30 = 0LL;
LABEL_119:
            LOWORD(v25) = v66;
          }

          else
          {
            int v30 = 0LL;
          }

          si_list_release(v32);
          goto LABEL_122;
        }
      }

      else
      {
        free(v74);
      }

      int v30 = 0LL;
    }

LABEL_122:
    __darwin_time_t v58 = v30;
    __int16 v59 = v25;
    return _gai_sort_list(v58, v59);
  }

  unsigned int v68 = v24;
  int v26 = _gai_numericserv((const char *)v18, &v71);
  int v27 = v26;
  if ((v25 & 0x1000) != 0 && !v26) {
    goto LABEL_16;
  }
  if (!v18)
  {
    unint64_t v29 = 0LL;
LABEL_99:
    uint64_t v28 = v25;
    goto LABEL_100;
  }

  int v65 = v26;
  if (!strcmp((const char *)v18, "0"))
  {
    unint64_t v29 = 0LL;
    int v27 = v65;
    goto LABEL_99;
  }

  int v27 = v65;
  if (v65) {
    uint64_t v28 = v25 | 0x1000;
  }
  else {
    uint64_t v28 = v25;
  }
  if (v65) {
    unint64_t v29 = (const char *)&v71;
  }
  else {
    unint64_t v29 = (const char *)v18;
  }
LABEL_100:
  int v48 = v27;
  unsigned int v67 = v28;
  BOOL result = _gai_nat64_synthesis(a1, (const char *)v17, v29, v27, a4, a5, v68, v28, a8);
  if (!result)
  {
    int v49 = _gai_numerichost((char *)v17, (int *)&v73, v67, &v70, v69, &v72);
    if (v49 != -1 && ((v67 & 4) == 0 || v49))
    {
      if (v49 != 1)
      {
        uint64_t v60 = *(void *)(a1 + 40);
        if (*(void *)(v60 + 288) && (__darwin_time_t v61 = *(unsigned int (**)(uint64_t))(v60 + 296)) != 0LL && v61(a1))
        {
          uint64_t v62 = (void **)(*(uint64_t (**)(uint64_t, uint64_t, const char *, void, uint64_t, void, void, char *, int *))(*(void *)(a1 + 40) + 288LL))( a1,  v17,  v29,  v73,  a5,  v68,  v67,  a8,  a9);
          uint64_t v63 = _gai_nat64_second_pass((uint64_t)v62, a1, v18, a4, a5, v68, a7, (uint64_t)a8);
          if (v63)
          {
            uint64_t v64 = (uint64_t)v63;
            uint64_t v62 = si_list_concat(v62, (uint64_t)v63);
            si_list_release(v64);
          }

          __darwin_time_t v58 = (unsigned int *)v62;
        }

        else
        {
          __darwin_time_t v58 = _gai_simple(a1, v17, v29, v73, v51, v68, v67, (uint64_t)a8, a9);
        }

        __int16 v59 = v67;
        return _gai_sort_list(v58, v59);
      }

      unsigned int v52 = v67 | 4;
      unsigned int v53 = v73;
      if (v48) {
        goto LABEL_106;
      }
      if (!_gai_serv_to_port((const char *)v18, v68, &v71))
      {
        unsigned int v52 = v67 | 0x1004;
LABEL_106:
        if (v53 == 30) {
          __int128 v54 = 0LL;
        }
        else {
          __int128 v54 = &v70;
        }
        uint64_t v55 = "localhost";
        if (v17) {
          uint64_t v55 = 0LL;
        }
        if (v53 == 2) {
          unint64_t v56 = 0LL;
        }
        else {
          unint64_t v56 = (unsigned __int8 *)v69;
        }
        if (v53 == 2) {
          uint64_t v57 = v52;
        }
        else {
          uint64_t v57 = v52 | 0x800;
        }
        __darwin_time_t v58 = (unsigned int *)si_addrinfo_list( a1,  v57,  v50,  v68,  (uint64_t)v54,  v56,  v71,  v72,  (uint64_t)v55,  (uint64_t)v55);
        __int16 v59 = v57;
        return _gai_sort_list(v58, v59);
      }
    }

LABEL_16:
    if (a9)
    {
      BOOL result = 0LL;
      int v16 = 108;
      goto LABEL_34;
    }

    return 0LL;
  }

  return result;
}

unsigned int *_gai_nat64_synthesis( uint64_t a1, const char *a2, const char *a3, int a4, unsigned int a5, int a6, uint64_t a7, uint64_t a8, char *a9)
{
  BOOL result = 0LL;
  uint64_t v39 = *MEMORY[0x1895FEE08];
  if (!a2) {
    return result;
  }
  uint64_t v11 = a8;
  if ((a8 & 4) != 0) {
    return result;
  }
  if (a5 != 30 && a5 || inet_pton(2, a2, &v32) != 1 || !_gai_nat64_can_v4_address_be_synthesized(&v32)) {
    return 0LL;
  }
  int v31 = 0;
  int v16 = si_inet_config(0LL, &v31);
  BOOL result = 0LL;
  if (v16 < 0 || !v31) {
    return result;
  }
  unsigned int v30 = 0;
  if (a9)
  {
    unsigned int v30 = if_nametoindex(a9);
    if (!v30) {
      return 0LL;
    }
  }

  unsigned __int16 v29 = 0;
  if (a4)
  {
    if (a3) {
      unsigned __int16 v29 = *(_WORD *)a3;
    }
  }

  else
  {
    uint64_t v11 = v11 | 0x1000;
  }

  uint64_t v28 = 0LL;
  pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
  if (!nat64_v4_synthesize) {
    return 0LL;
  }
  int v17 = nat64_v4_synthesize(&v30, &v32, &v28);
  pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
  uint64_t v18 = (os_log_s *)_gai_log;
  if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109632;
    unsigned int v34 = v30;
    __int16 v35 = 1024;
    unsigned int v36 = v32;
    __int16 v37 = 1024;
    int v38 = v17;
    _os_log_debug_impl( &dword_1804BA000,  v18,  OS_LOG_TYPE_DEBUG,  "nat64_v4_synthesize(%d, %{network:in_addr}d, ...) returned %d",  buf,  0x14u);
  }

  BOOL result = 0LL;
  if (v17 && v28)
  {
    uint64_t v20 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = v17;
    do
    {
      unsigned int v23 = si_addrinfo_list(a1, v11, v19, a7, 0LL, (unsigned __int8 *)v28 + v20, v29, 0LL, 0LL, 0LL);
      if (v23)
      {
        uint64_t v24 = (uint64_t)v23;
        if (v21)
        {
          uint64_t v21 = si_list_concat(v21, (uint64_t)v23);
          si_list_release(v24);
        }

        else
        {
          uint64_t v21 = v23;
        }
      }

      v20 += 16LL;
      --v22;
    }

    while (v22);
    free(v28);
    if (v21)
    {
      if (!(v11 & 0x400 | a5) || a5 == 30 && (v11 & 0x900) == 0x900)
      {
        int v26 = si_addrinfo_list(a1, v11, v25, a7, (uint64_t)&v32, 0LL, v29, 0LL, 0LL, 0LL);
        if (v26)
        {
          uint64_t v27 = (uint64_t)v26;
          uint64_t v21 = si_list_concat(v21, (uint64_t)v26);
          si_list_release(v27);
        }
      }

      return _gai_sort_list((unsigned int *)v21, v11);
    }

    return 0LL;
  }

  return result;
}

uint64_t _gai_numerichost(char *a1, int *a2, int a3, int *a4, void *a5, unsigned int *a6)
{
  __int16 v8 = a3;
  if (!a1)
  {
    int v14 = *a2;
    if (*a2) {
      BOOL v15 = v14 == 2;
    }
    else {
      BOOL v15 = 1;
    }
    if (v15) {
      goto LABEL_14;
    }
    if (v14 != 30)
    {
LABEL_19:
      if (v14 != 30 && v14 != 0) {
        return 1LL;
      }
      *a5 = 0LL;
      a5[1] = 0LL;
      if ((a3 & 1) != 0) {
        return 1LL;
      }
      int v18 = 0x1000000;
      goto LABEL_39;
    }

    if ((~a3 & 0x900) == 0)
    {
LABEL_14:
      if ((a3 & 1) != 0) {
        int v16 = 0;
      }
      else {
        int v16 = 16777343;
      }
      *a4 = v16;
    }

    int v14 = *a2;
    goto LABEL_19;
  }

  int v12 = inet_pton(2, a1, a4);
  if (!v12) {
    int v12 = _inet_aton_check();
  }
  if (v12 == 1)
  {
    if (*a2 != 30)
    {
      if (!*a2)
      {
        int v13 = 2;
LABEL_45:
        *a2 = v13;
        return 1LL;
      }

      return 1LL;
    }

    if ((v8 & 0x800) != 0)
    {
      *a5 = 0LL;
      a5[1] = 0LL;
      *((_WORD *)a5 + 5) = -1;
      int v18 = *a4;
LABEL_39:
      *((_DWORD *)a5 + 3) = v18;
      return 1LL;
    }

    return 0xFFFFFFFFLL;
  }

  uint64_t result = inet_pton(30, a1, a5);
  if ((_DWORD)result != 1) {
    return result;
  }
  uint64_t v20 = strrchr(a1, 37);
  if (v20)
  {
    uint64_t v21 = v20;
    int v24 = v20[1];
    uint64_t v22 = v20 + 1;
    char v23 = v24;
    if (!v24) {
      goto LABEL_36;
    }
    uint64_t v25 = (unsigned __int8 *)(v21 + 2);
    do
    {
      unsigned int v26 = v23 - 48;
      int v27 = *v25++;
      char v23 = v27;
      if (v27) {
        BOOL v28 = v26 >= 0xA;
      }
      else {
        BOOL v28 = 1;
      }
    }

    while (!v28);
    if (v26 > 9) {
      unsigned int v29 = if_nametoindex(v22);
    }
    else {
LABEL_36:
    }
      unsigned int v29 = atoi(v22);
    *a6 = v29;
  }

  if (*a2 == 2) {
    return 0xFFFFFFFFLL;
  }
  if (!*a2)
  {
    int v13 = 30;
    goto LABEL_45;
  }

  return 1LL;
}

void **_gai_nat64_second_pass( uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 0LL;
  }
  __int16 v8 = 0LL;
  if ((a7 & 4) == 0)
  {
    uint64_t v10 = *(unsigned int *)(a1 + 4);
    if ((_DWORD)v10)
    {
      if (a4 == 30 || !a4)
      {
        uint64_t v15 = *(void *)(a1 + 16);
        do
        {
          int v16 = *(_DWORD **)v15;
          if (*(_DWORD *)(*(void *)v15 + 36LL) == 30 && (v16[15] || v16[16] || v16[17] != -65536)) {
            return 0LL;
          }
          v15 += 8LL;
          --v10;
        }

        while (v10);
        uint64_t v17 = 0LL;
        __int16 v8 = 0LL;
        unsigned int v28 = a7 & 0xFFFFF5FF;
        while (1)
        {
          uint64_t v18 = *(void *)(*(void *)(a1 + 16) + 8 * v17);
          uint64_t v19 = v18 + 32;
          int v20 = *(_DWORD *)(v18 + 36);
          if (v20 == 30)
          {
            uint64_t v21 = (int *)(v19 + 40);
          }

          else
          {
            if (v20 != 2) {
              goto LABEL_26;
            }
            uint64_t v21 = (int *)(v19 + 24);
          }

          pthread_once(&_gai_load_libnetwork_load_once, _gai_load_libnetwork_once);
          if (nat64_v4_requires_synthesis)
          {
            int v22 = nat64_v4_requires_synthesis(v21);
            pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
            char v23 = (os_log_s *)_gai_log;
            if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG))
            {
              int v26 = *v21;
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)&uint8_t buf[4] = v26;
              LOWORD(v32) = 1024;
              *(_DWORD *)((char *)&v32 + 2) = v22;
              _os_log_debug_impl( &dword_1804BA000,  v23,  OS_LOG_TYPE_DEBUG,  "nat64_v4_requires_synthesis(%{network:in_addr}d) == %{BOOL}d",  buf,  0xEu);
              if ((v22 & 1) == 0) {
                goto LABEL_26;
              }
            }

            else if (!v22)
            {
              goto LABEL_26;
            }

            *(void *)buf = 0LL;
            uint64_t v32 = 0LL;
            int v30 = 0;
            uint64_t v24 = si_addrinfo(a2, buf, a3, 30LL, a5, a6, v28, a8, &v30);
            if (!v24) {
              goto LABEL_26;
            }
            uint64_t v25 = v24;
            if (!v30)
            {
              if (!v8)
              {
                __int16 v8 = (void **)v24;
                goto LABEL_26;
              }

              __int16 v8 = si_list_concat(v8, v24);
            }

            si_list_release(v25);
          }

addrinfo *si_list_to_addrinfo(addrinfo *result)
{
  if (result)
  {
    unsigned int v1 = result;
    int ai_family = result->ai_family;
    if (!ai_family) {
      return 0LL;
    }
    uint64_t result = (addrinfo *)si_item_to_addrinfo(*(void *)(*(void *)&result->ai_addrlen + 8LL * (ai_family - 1)));
    unsigned int v3 = result;
    uint64_t v4 = (ai_family - 2);
    if ((int)v4 >= 0)
    {
      while (1)
      {
        uint64_t result = (addrinfo *)si_item_to_addrinfo(*(void *)(*(void *)&v1->ai_addrlen + 8 * v4));
        if (!result) {
          break;
        }
        result->ai_next = v3;
        unsigned int v3 = result;
        if (v4-- <= 0) {
          return result;
        }
      }

      freeaddrinfo(v3);
      return 0LL;
    }
  }

  return result;
}

void *si_item_to_addrinfo(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = calloc(1uLL, 0x30uLL);
  unsigned int v3 = v2;
  if (v2)
  {
    __int128 v5 = *(_OWORD *)(a1 + 32);
    uint64_t v4 = a1 + 32;
    *(_OWORD *)int v2 = v5;
    size_t v6 = *(unsigned int *)(v4 + 16);
    v2[4] = v6;
    uint64_t v7 = calloc(1uLL, v6);
    v3[4] = v7;
    if (!v7
      || (memcpy(v7, (const void *)(v4 + 20), *((unsigned int *)v3 + 4)), (__int16 v8 = *(const char **)(v4 + 152)) != 0LL)
      && (unsigned int v9 = strdup(v8), (v3[3] = v9) == 0LL))
    {
      free(v3);
      return 0LL;
    }
  }

  return v3;
}

uint64_t si_ipnode_byname(uint64_t a1, char *a2, int a3, __int16 a4, uint64_t a5, int *a6)
{
  uint64_t v9 = (uint64_t)a2;
  v60[2] = *MEMORY[0x1895FEE08];
  v57.in_addr_t s_addr = 0;
  __int128 v56 = 0uLL;
  if (a6) {
    *a6 = 0;
  }
  if (a3 != 2)
  {
    if (a3 != 30) {
      goto LABEL_74;
    }
    if (inet_pton(30, a2, &v56) == 1)
    {
      uint64_t v24 = *((void *)&v56 + 1);
      uint64_t v23 = v56;
      uint64_t v25 = a1;
      uint64_t v26 = v9;
    }

    else
    {
      if ((a4 & 0xA00) == 0) {
        goto LABEL_49;
      }
      *(void *)&__int128 v56 = 0LL;
      DWORD2(v56) = -65536;
      HIDWORD(v56) = v57;
      uint64_t v24 = *((void *)&v56 + 1);
      uint64_t v25 = a1;
      uint64_t v26 = v9;
      uint64_t v23 = 0LL;
    }

    hostent6 = make_hostent6(v25, v26, v23, v24, v19, v20, v21, v22);
    goto LABEL_14;
  }

  if (inet_aton(a2, &v57) == 1)
  {
    in_addr_t s_addr = v57.s_addr;
    if (!v9)
    {
LABEL_15:
      if (!a6 || v9) {
        return v9;
      }
      goto LABEL_76;
    }

    v60[0] = &s_addr;
    v60[1] = 0LL;
    uint64_t v59 = 0LL;
    hostent6 = LI_ils_create("L4488s*44a", v11, v12, v13, v14, v15, v16, v17, a1);
LABEL_14:
    uint64_t v9 = (uint64_t)hostent6;
    goto LABEL_15;
  }

LABEL_18:
  int v27 = 0;
  int v28 = 0;
  LODWORD(v60[0]) = 0;
  LODWORD(v59) = 0;
  if ((a4 & 0x400) != 0)
  {
    if ((si_inet_config(v60, &v59) & 0x80000000) != 0) {
      goto LABEL_74;
    }
    int v27 = v60[0];
    int v28 = v59;
  }

  if (a3 == 2)
  {
    BOOL v29 = 0;
    LOBYTE(v30) = 0;
    if ((a4 & 0x400) != 0 && !v27) {
      goto LABEL_74;
    }
  }

  else
  {
    if ((a4 & 0xA00) == 0)
    {
      LOBYTE(v30) = 0;
      int v31 = 1;
      BOOL v29 = 0;
      if ((a4 & 0x400) != 0 && !v28) {
        goto LABEL_74;
      }
      goto LABEL_32;
    }

    BOOL v29 = (a4 & 0x100) == 0;
    int v30 = (unsigned __int16)(a4 & 0x100) >> 8;
  }

  int v31 = 0;
  if (!v29 && (v30 & 1) == 0)
  {
    uint64_t v32 = 0LL;
    BOOL v29 = 0;
    int v33 = 0;
    goto LABEL_33;
  }

_OWORD *make_hostent6( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v9[5] = *MEMORY[0x1895FEE08];
  v9[0] = a3;
  v9[1] = a4;
  if (!a2) {
    return 0LL;
  }
  v9[3] = v9;
  v9[4] = 0LL;
  v9[2] = 0LL;
  return LI_ils_create("L4488s*44c", a2, a3, a4, a5, a6, a7, a8, a1);
}

const char *lower_case(const char *result)
{
  if (result)
  {
    unsigned int v1 = result;
    size_t v2 = strlen(result);
    uint64_t result = (const char *)malloc(v2 + 1);
    if (result)
    {
      int v3 = *(unsigned __int8 *)v1;
      if (*v1)
      {
        uint64_t v4 = 0LL;
        do
        {
          result[v4] = v3;
          uint64_t v5 = v4 + 1;
          int v3 = v1[++v4];
        }

        while (v3);
      }

      else
      {
        uint64_t v5 = 0LL;
      }

      result[v5] = 0;
    }
  }

  return result;
}

const char *merge_alias(const char *result, uint64_t a2)
{
  int v3 = *(const char **)a2;
  if (v3)
  {
    uint64_t v4 = result;
    uint64_t result = (const char *)strcmp(result, v3);
    if ((_DWORD)result)
    {
      int v5 = *(_DWORD *)(a2 + 32);
      if (v5 < 1)
      {
LABEL_7:
        if (v5) {
          uint64_t result = (const char *)reallocf(*(void **)(a2 + 8), 8LL * (v5 + 2));
        }
        else {
          uint64_t result = (const char *)calloc(2uLL, 8uLL);
        }
        *(void *)(a2 + 8) = result;
        if (result)
        {
          uint64_t result = lower_case(v4);
          uint64_t v8 = *(int *)(a2 + 32);
          *(void *)(*(void *)(a2 + 8) + 8 * v8) = result;
          *(_DWORD *)(a2 + 32) = v8 + 1;
          *(void *)(*(void *)(a2 + 8) + 8 * (v8 + 1)) = 0LL;
        }

        else
        {
          *(_DWORD *)(a2 + 32) = 0;
        }
      }

      else
      {
        size_t v6 = *(const char ***)(a2 + 8);
        uint64_t v7 = *(unsigned int *)(a2 + 32);
        while (1)
        {
          uint64_t result = (const char *)strcmp(v4, *v6);
          if (!(_DWORD)result) {
            break;
          }
          ++v6;
          if (!--v7) {
            goto LABEL_7;
          }
        }
      }
    }
  }

  return result;
}

_OWORD *append_addr(_OWORD *result, uint64_t a2)
{
  if (result)
  {
    int v3 = result;
    int v4 = *(_DWORD *)(a2 + 36);
    if (v4) {
      uint64_t result = reallocf(*(void **)(a2 + 24), 8LL * (v4 + 2));
    }
    else {
      uint64_t result = calloc(2uLL, 8uLL);
    }
    int v5 = result;
    *(void *)(a2 + 24) = result;
    if (result)
    {
      uint64_t result = malloc(0x10uLL);
      uint64_t v6 = *(int *)(a2 + 36);
      *((void *)v5 + v6) = result;
      uint64_t v7 = *(_OWORD **)(*(void *)(a2 + 24) + 8 * v6);
      if (v7)
      {
        *uint64_t v7 = *v3;
        uint64_t v8 = *(int *)(a2 + 36) + 1LL;
        *(_DWORD *)(a2 + 36) = v8;
        *(void *)(*(void *)(a2 + 24) + 8 * v8) = 0LL;
      }
    }

    else
    {
      *(_DWORD *)(a2 + 36) = 0;
    }
  }

  return result;
}

void free_build_hostent(void **a1)
{
  size_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  *a1 = 0LL;
  int v3 = (void **)a1[1];
  if (v3)
  {
    int v4 = *v3;
    if (*v3)
    {
      int v5 = v3 + 1;
      do
      {
        free(v4);
        uint64_t v6 = *v5++;
        int v4 = v6;
      }

      while (v6);
      int v3 = (void **)a1[1];
    }

    free(v3);
  }

  a1[1] = 0LL;
  uint64_t v7 = (void **)a1[3];
  if (v7)
  {
    uint64_t v8 = *v7;
    if (*v7)
    {
      unsigned int v9 = 1;
      do
      {
        free(v8);
        uint64_t v7 = (void **)a1[3];
        uint64_t v8 = v7[v9++];
      }

      while (v8);
    }

    free(v7);
  }

  free(a1);
}

uint64_t gai_log_init()
{
  _gai_log = (uint64_t)os_log_create("com.apple.network.libinfo", "getaddrinfo");
  return pthread_atfork(0LL, 0LL, gai_child_has_forked);
}

void gai_child_has_forked()
{
  _gai_log = MEMORY[0x189600830];
}

void _gai_load_libnetwork_once()
{
  if (nat64_v4_requires_synthesis) {
    BOOL v0 = 0;
  }
  else {
    BOOL v0 = nat64_v4_synthesize == 0LL;
  }
  if (v0 && path_check == 0LL)
  {
    pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
    if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_DEBUG)) {
      _gai_load_libnetwork_once_cold_5();
    }
    _gai_load_libnetwork_once_handle = (uint64_t)dlopen("/usr/lib/libnetwork.dylib", 5);
    if (_gai_load_libnetwork_once_handle)
    {
      if (!nat64_v4_requires_synthesis)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR)) {
          _gai_load_libnetwork_once_cold_4();
        }
      }

      if (!nat64_v4_synthesize)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR)) {
          _gai_load_libnetwork_once_cold_3();
        }
      }

      if (!path_check)
      {
        pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
        if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR)) {
          _gai_load_libnetwork_once_cold_2();
        }
      }
    }

    else
    {
      size_t v2 = dlerror();
      pthread_once(&gai_log_once, (void (*)(void))gai_log_init);
      int v3 = (os_log_s *)_gai_log;
      if (os_log_type_enabled((os_log_t)_gai_log, OS_LOG_TYPE_ERROR)) {
        _gai_load_libnetwork_once_cold_1(v2, v3);
      }
    }
  }

void OUTLINED_FUNCTION_0_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void *si_module_with_path(const char *a1, const char *a2)
{
  int v2 = 22;
  if (!a1 || !a2) {
    goto LABEL_14;
  }
  int v4 = dlopen(a1, 4);
  if (!v4) {
    return 0LL;
  }
  int v5 = v4;
  uint64_t v6 = (unsigned int (*)(void *))si_mod_dlsym(v4, a2, "init");
  if (!v6 || (uint64_t v7 = v6, !si_mod_dlsym(v5, a2, "close")))
  {
    dlclose(v5);
    goto LABEL_12;
  }

  uint64_t v8 = calloc(1uLL, 0x30uLL);
  unsigned int v9 = strdup(a2);
  uint64_t v10 = v9;
  if (!v8 || !v9)
  {
    free(v8);
    free(v10);
    dlclose(v5);
    int v2 = 12;
    goto LABEL_14;
  }

  *uint64_t v8 = v9;
  *(void *)((char *)v8 + 12) = 1LL;
  v8[3] = v5;
  if (v7(v8))
  {
    dlclose(v5);
    free(v8);
    free(v10);
LABEL_12:
    int v2 = 61;
LABEL_14:
    uint64_t v8 = 0LL;
    *__error() = v2;
  }

  return v8;
}

void *si_mod_dlsym(void *a1, const char *a2, const char *a3)
{
  if (!a3) {
    return 0LL;
  }
  __symbol = 0LL;
  asprintf(&__symbol, "%s_%s", a2, a3);
  if (!__symbol) {
    return 0LL;
  }
  int v4 = dlsym(a1, __symbol);
  free(__symbol);
  return v4;
}

void *si_module_with_name(char *__s1)
{
  int v2 = (const char *)si_module_with_name_modules;
  if (!si_module_with_name_modules) {
    goto LABEL_5;
  }
  int v3 = &qword_18C43C710;
  while (strcmp(__s1, v2))
  {
    int v2 = (const char *)v3[1];
    v3 += 3;
    if (!v2) {
      goto LABEL_5;
    }
  }

  int v4 = (void *)*v3;
  if (!*v3)
  {
    int v4 = (void *)((uint64_t (*)(void))*(v3 - 1))();
    uint64_t *v3 = (uint64_t)v4;
    if (!v4)
    {
LABEL_5:
      pthread_mutex_lock(&module_mutex);
      unsigned int v9 = 0LL;
      asprintf(&v9, "%s/%s.%s", "/usr/lib/info", __s1, "so");
      if (v9)
      {
        int v4 = si_module_with_path(v9, __s1);
        free(v9);
        if (v4)
        {
          uint64_t v5 = module_count;
          int v6 = module_count + 1;
          uint64_t v7 = reallocf((void *)module_list, 8LL * (module_count + 1));
          module_list = (uint64_t)v7;
          if (v7)
          {
            v7[v5] = v4;
            module_count = v6;
          }
        }
      }

      else
      {
        int v4 = 0LL;
        *__error() = 12;
      }

      pthread_mutex_unlock(&module_mutex);
    }
  }

  return v4;
}

uint64_t si_module_retain(uint64_t result)
{
  if (result && (*(_BYTE *)(result + 16) & 1) == 0)
  {
    unsigned int v1 = (unsigned int *)(result + 12);
    do
      unsigned int v2 = __ldaxr(v1);
    while (__stlxr(v2 + 1, v1));
  }

  return result;
}

void si_module_release(uint64_t a1)
{
  if (!a1) {
    return;
  }
  if ((*(_BYTE *)(a1 + 16) & 1) != 0) {
    return;
  }
  unsigned int v2 = (unsigned int *)(a1 + 12);
  do
  {
    unsigned int v3 = __ldaxr(v2);
    BOOL v4 = __OFSUB__(v3, 1);
    signed int v5 = v3 - 1;
  }

  while (__stlxr(v5, v2));
  if (!((v5 < 0) ^ v4 | (v5 == 0))) {
    return;
  }
  pthread_mutex_lock(&module_mutex);
  if (!module_count)
  {
LABEL_14:
    pthread_mutex_unlock(&module_mutex);
    return;
  }

  uint64_t v6 = 0LL;
  uint64_t v7 = (void *)module_list;
  uint64_t v8 = (void *)(module_list + 8);
  while (*(v8 - 1) != a1)
  {
    ++v6;
    ++v8;
    if (module_count == v6) {
      goto LABEL_14;
    }
  }

  if (module_count == 1)
  {
    free((void *)module_list);
    module_list = 0LL;
    module_count = 0;
    goto LABEL_14;
  }

  uint64_t v9 = (module_count - 1);
  if ((int)v6 + 1 < module_count)
  {
    uint64_t v10 = (module_count - 1) - v6;
    do
    {
      *(v8 - 1) = *v8;
      ++v8;
      --v10;
    }

    while (v10);
  }

  module_count = v9;
  module_list = (uint64_t)reallocf(v7, 8 * v9);
  if (!module_list) {
    module_count = 0;
  }
  pthread_mutex_unlock(&module_mutex);
  uint64_t v11 = **(void (***)(uint64_t))(a1 + 40);
  if (v11) {
    v11(a1);
  }
  uint64_t v12 = *(void **)(a1 + 24);
  if (v12) {
    dlclose(v12);
  }
  free(*(void **)a1);
  free((void *)a1);
}

uint64_t si_module_name(uint64_t result)
{
  if (result) {
    return *(void *)result;
  }
  return result;
}

uint64_t si_module_vers(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result + 8);
  }
  return result;
}

BOOL si_item_match(BOOL result, int a2, char *__s1, int a4, int a5)
{
  if (result)
  {
    if (a5)
    {
      uint64_t v7 = result;
      if (!__s1 && a5 == 1) {
        return 0LL;
      }
      uint64_t result = 0LL;
      switch(a2)
      {
        case 1:
        case 2:
          if (a5 == 1) {
            goto LABEL_21;
          }
          goto LABEL_52;
        case 3:
        case 5:
          if (a5 != 1) {
            return 0LL;
          }
          goto LABEL_21;
        case 6:
        case 7:
          if (*(_DWORD *)(v7 + 48) != a4) {
            return 0LL;
          }
          if (a5 == 1)
          {
            uint64_t v8 = *(const char ***)(v7 + 40);
            if (v8)
            {
              uint64_t v9 = *v8;
              if (*v8)
              {
                uint64_t v10 = v8 + 1;
                do
                {
                  if (!strcmp(__s1, v9)) {
                    return 1LL;
                  }
                  uint64_t v11 = *v10++;
                  uint64_t v9 = v11;
                }

                while (v11);
              }
            }

            return 0LL;
          }

          return a5 == 2 && !memcmp(__s1, **(const void ***)(v7 + 56), *(int *)(v7 + 52));
        case 8:
          if (a5 == 1)
          {
            uint64_t v13 = *(const char ***)(v7 + 40);
            if (v13)
            {
              uint64_t v14 = *v13;
              if (*v13)
              {
                uint64_t v15 = v13 + 1;
                do
                {
                  if (!strcmp(__s1, v14)) {
                    return 1LL;
                  }
                  uint64_t v16 = *v15++;
                  uint64_t v14 = v16;
                }

                while (v16);
              }
            }

            return 0LL;
          }

          if (a5 != 2) {
            return 0LL;
          }
          int v27 = *(_DWORD *)(v7 + 52);
          goto LABEL_54;
        case 9:
          if (a5 == 1)
          {
            if (a4 == 2)
            {
              uint64_t v17 = *(const char **)(v7 + 56);
              uint64_t v18 = "tcp";
            }

            else
            {
              if (a4 != 1) {
                goto LABEL_70;
              }
              uint64_t v17 = *(const char **)(v7 + 56);
              uint64_t v18 = "udp";
            }

            if (strcmp(v18, v17)) {
              return 0LL;
            }
LABEL_70:
            int v28 = *(const char ***)(v7 + 40);
            if (v28)
            {
              BOOL v29 = *v28;
              if (*v28)
              {
                int v30 = v28 + 1;
                do
                {
                  if (!strcmp(__s1, v29)) {
                    return 1LL;
                  }
                  int v31 = *v30++;
                  BOOL v29 = v31;
                }

                while (v31);
              }
            }

            return 0LL;
          }

LABEL_53:
          int v27 = *(_DWORD *)(v7 + 48);
LABEL_54:
          if (v27 != a4) {
            return 0LL;
          }
          break;
        case 10:
          if (a5 != 1) {
            goto LABEL_52;
          }
          uint64_t v19 = *(const char ***)(v7 + 40);
          if (!v19) {
            return 0LL;
          }
          uint64_t v20 = *v19;
          if (!*v19) {
            return 0LL;
          }
          uint64_t v21 = v19 + 1;
          while (strcmp(__s1, v20))
          {
            uint64_t v22 = *v21++;
            uint64_t v20 = v22;
            if (!v22) {
              return 0LL;
            }
          }

          return 1LL;
        case 11:
          if (a5 == 1)
          {
            uint64_t v23 = *(const char ***)(v7 + 40);
            if (v23)
            {
              uint64_t v24 = *v23;
              if (*v23)
              {
                uint64_t v25 = v23 + 1;
                do
                {
                  if (!strcmp(__s1, v24)) {
                    return 1LL;
                  }
                  uint64_t v26 = *v25++;
                  uint64_t v24 = v26;
                }

                while (v26);
              }
            }

            return 0LL;
          }

LABEL_52:
          if (a5 != 2) {
            return 0LL;
          }
          goto LABEL_53;
        case 12:
        case 13:
          if (a5 == 1)
          {
LABEL_21:
            uint64_t v12 = *(const char **)(v7 + 32);
          }

          else
          {
            if (a5 != 2) {
              return 0LL;
            }
            uint64_t v12 = *(const char **)(v7 + 40);
          }

          return !strcmp(__s1, v12);
        default:
          return result;
      }
    }

    return 1LL;
  }

  return result;
}

BOOL si_module_allows_caching(BOOL result)
{
  if (result) {
    return *(void *)(*(void *)(result + 40) + 8LL) != 0LL;
  }
  return result;
}

uint64_t si_item_is_valid(uint64_t *a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_user_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_user_byuid(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_user_byuuid(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_user_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_group_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_group_bygid(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_group_byuuid(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_group_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_grouplist(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_netgroup_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_in_netgroup(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_alias_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_alias_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_host_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_host_byaddr(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_host_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_mac_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_mac_bymac(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_mac_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_network_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_network_byaddr(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_network_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_service_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_service_byport(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_service_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_protocol_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_protocol_bynumber(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_protocol_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_rpc_byname(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_rpc_bynumber(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_rpc_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_fs_byspec(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_fs_byfile(uint64_t a1)
{
  else {
    return 0LL;
  }
}

uint64_t si_fs_all(uint64_t a1)
{
  else {
    return 0LL;
  }
}

_OWORD *si_item_call(uint64_t a1, int a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int *a8)
{
  if (!a1) {
    return 0LL;
  }
  switch(a2)
  {
    case 0:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 1:
      uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 24LL);
      if (!v11) {
        return 0LL;
      }
      return (_OWORD *)v11();
    case 3:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 48LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 4:
      uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 56LL);
      if (!v11) {
        return 0LL;
      }
      return (_OWORD *)v11();
    case 8:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 80LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 9:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 104LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 11:
      uint64_t v12 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 120LL);
      if (!v12) {
        return 0LL;
      }
      return (_OWORD *)v12();
    case 12:
      uint64_t v12 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 128LL);
      if (!v12) {
        return 0LL;
      }
      return (_OWORD *)v12();
    case 14:
    case 23:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 144LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 15:
      uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 152LL);
      if (!v11) {
        return 0LL;
      }
      return (_OWORD *)v11();
    case 17:
      uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 168LL);
      if (!v13) {
        return 0LL;
      }
      return (_OWORD *)v13();
    case 18:
      uint64_t v13 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 176LL);
      if (!v13) {
        return 0LL;
      }
      return (_OWORD *)v13();
    case 20:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 192LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 21:
      uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 200LL);
      if (!v11) {
        return 0LL;
      }
      return (_OWORD *)v11();
    case 24:
      uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 224LL);
      if (!v11) {
        return 0LL;
      }
      return (_OWORD *)v11();
    case 26:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 240LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 27:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 248LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 30:
      return si_nameinfo(a1, (uint64_t)a3, a6, a5, a8, a6, a7, (uint64_t)a8);
    case 31:
      return (_OWORD *)si_ipnode_byname(a1, a3, a6, a7, a5, a8);
    case 32:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 264LL);
      if (!v8) {
        return 0LL;
      }
      goto LABEL_16;
    case 33:
      uint64_t v8 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 272LL);
      if (!v8) {
        return 0LL;
      }
LABEL_16:
      uint64_t result = (_OWORD *)v8();
      break;
    case 35:
    case 36:
      uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 320LL);
      if (!v9) {
        return 0LL;
      }
      uint64_t result = (_OWORD *)v9();
      break;
    default:
      return 0LL;
  }

  return result;
}

unsigned int *si_list_call( uint64_t a1, int a2, _BYTE *a3, _BYTE *a4, char *a5, unsigned int a6, uint64_t a7, unsigned int a8, int a9, int *a10)
{
  if (!a1) {
    return 0LL;
  }
  if (a2 <= 9)
  {
    if (a2 == 2)
    {
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 40LL);
      if (v10) {
        return (unsigned int *)v10();
      }
    }

    else if (a2 == 5)
    {
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 72LL);
      if (v10) {
        return (unsigned int *)v10();
      }
    }

    return 0LL;
  }

  switch(a2)
  {
    case 10:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 112LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 11:
    case 12:
    case 14:
    case 15:
    case 17:
    case 18:
    case 20:
    case 21:
    case 23:
    case 24:
    case 26:
    case 27:
      return 0LL;
    case 13:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 136LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 16:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 160LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 19:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 184LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 22:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 208LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 25:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 232LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 28:
      uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 256LL);
      if (v10) {
        return (unsigned int *)v10();
      }
      return 0LL;
    case 29:
      uint64_t result = si_addrinfo(a1, a3, a4, a6, a7, a8, a9, a5, a10);
      break;
    default:
      if (a2 == 34)
      {
        uint64_t v10 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 280LL);
        if (v10) {
          return (unsigned int *)v10();
        }
      }

      return 0LL;
  }

  return result;
}

uint64_t si_async_call( uint64_t a1, uint64_t a2, char *__s1, char *a4, const char *a5, uint64_t a6, uint64_t a7, size_t __size, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t result = 0LL;
  if (!a1 || !a10) {
    return result;
  }
  unsigned int v13 = __size;
  int v14 = a7;
  int v15 = a6;
  uint64_t v17 = a4;
  unsigned int v19 = a2;
  uint64_t v20 = *(uint64_t (**)(uint64_t, uint64_t, char *, char *, const char *, uint64_t, uint64_t, size_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 40) + 336LL);
  if (v20) {
    return v20(a1, a2, __s1, a4, a5, a6, a7, __size, a9, a10, a11);
  }
  if ((_DWORD)a2 != 30 && (_DWORD)a2 != 12)
  {
    if (__s1)
    {
      uint64_t v22 = strdup(__s1);
      if (!v22) {
        return 0LL;
      }
      goto LABEL_14;
    }

LABEL_13:
    uint64_t v22 = 0LL;
    goto LABEL_14;
  }

  if (!(_DWORD)__size) {
    goto LABEL_13;
  }
  uint64_t v21 = (char *)calloc(1uLL, __size);
  if (!v21) {
    return 0LL;
  }
  uint64_t v22 = v21;
  memcpy(v21, __s1, v13);
LABEL_14:
  if (v17)
  {
    uint64_t v17 = strdup(v17);
    if (!v17)
    {
      if (v22)
      {
        uint64_t v24 = v22;
LABEL_43:
        free(v24);
      }

      return 0LL;
    }
  }

  if (a5)
  {
    uint64_t v23 = strdup(a5);
    if (!v23)
    {
      if (v22) {
        free(v22);
      }
      if (!v17) {
        return 0LL;
      }
      uint64_t v24 = v17;
      goto LABEL_43;
    }
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  uint64_t v25 = calloc(1uLL, 0x78uLL);
  if (!v25)
  {
    if (v22) {
      free(v22);
    }
    if (v17) {
      free(v17);
    }
    if (!v23) {
      return 0LL;
    }
    uint64_t v24 = v23;
    goto LABEL_43;
  }

  uint64_t v26 = (uint64_t)v25;
  *(void *)name = 0LL;
  int v31 = 0;
  if (mach_port_allocate(*MEMORY[0x1895FFD48], 1u, &name[1])
    || MEMORY[0x186DFD340](*MEMORY[0x1895FFD48], name[1], 21LL, name, &v31))
  {
    if (name[1]) {
      mach_port_mod_refs(*MEMORY[0x1895FFD48], name[1], 1u, -1);
    }
    if (v22) {
      free(v22);
    }
    if (v17) {
      free(v17);
    }
    if (v23) {
      free(v23);
    }
    uint64_t v24 = (void *)v26;
    goto LABEL_43;
  }

  int v27 = 0;
  *(void *)uint64_t v26 = a1;
  *(_DWORD *)(v26 + 8) = v19;
  *(void *)(v26 + 16) = v22;
  *(void *)(v26 + 24) = v17;
  *(void *)(v26 + 32) = v23;
  *(_DWORD *)(v26 + 40) = v15;
  *(_DWORD *)(v26 + 44) = v14;
  *(_DWORD *)(v26 + 48) = v13;
  *(_DWORD *)(v26 + 52) = a9;
  *(_DWORD *)(v26 + 64) = 2;
  if (v19 <= 0x22 && ((1LL << v19) & 0x432492464LL) != 0) {
    int v27 = 2;
  }
  *(_DWORD *)(v26 + 60) = v27;
  *(void *)(v26 + 72) = a10;
  *(void *)(v26 + 80) = a11;
  mach_port_name_t v28 = name[0];
  *(_DWORD *)(v26 + 88) = name[1];
  *(_DWORD *)(v26 + 92) = v28;
  pthread_mutex_lock(&module_mutex);
  *(void *)(v26 + 112) = si_async_worklist;
  si_async_worklist = v26;
  pthread_mutex_unlock(&module_mutex);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 2uLL);
  block[0] = MEMORY[0x1895FED80];
  block[1] = 0x40000000LL;
  block[2] = __si_async_call_block_invoke;
  block[3] = &__block_descriptor_tmp_3;
  block[4] = v26;
  dispatch_async(global_queue, block);
  return *(unsigned int *)(v26 + 88);
}

  if (!v6)
  {
    free(v7);
    uint64_t v6 = (void *)*((void *)v2 + 2);
    goto LABEL_18;
  }

  uint64_t result = (unsigned int *)calloc(1uLL, 0x10uLL);
  if (result)
  {
    uint64_t v8 = *((void *)v2 + 2);
    *(_DWORD *)(*((void *)v2 + 1) + 4 * v4) = a1;
    *(void *)(v8 + 8 * v4) = result;
    ++*v2;
  }

  return result;
}

void __si_async_call_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = (unsigned __int8 *)(v1 + 60);
  if ((*(_DWORD *)(v1 + 60) & 1) != 0) {
    goto LABEL_10;
  }
  uint64_t v3 = *(void *)v1;
  int v4 = *(_DWORD *)(v1 + 8);
  signed int v5 = *(char **)(v1 + 16);
  uint64_t v6 = *(_BYTE **)(v1 + 24);
  uint64_t v7 = *(char **)(v1 + 32);
  uint64_t v8 = *(unsigned int *)(v1 + 40);
  uint64_t v9 = *(unsigned int *)(v1 + 44);
  if ((*(_DWORD *)(v1 + 60) & 2) != 0) {
    *(void *)(v1 + 104) = si_list_call( v3,  v4,  v5,  v6,  v7,  v8,  v9,  *(_DWORD *)(v1 + 48),  *(_DWORD *)(v1 + 52),  (int *)(v1 + 56));
  }
  else {
    *(void *)(v1 + 96) = si_item_call(v3, v4, v5, (uint64_t)v6, (uint64_t)v7, v8, v9, (int *)(v1 + 56));
  }
  do
    unsigned __int8 v10 = __ldaxr(v2);
  while (__stlxr(v10 | 1, v2));
  if ((v10 & 1) != 0)
  {
LABEL_10:
    si_async_workunit_release(v1);
  }

  else
  {
    mach_port_t v11 = *(_DWORD *)(v1 + 92);
    *(_DWORD *)(v1 + 92) = 0;
    msg.msgh_local_port = 0;
    msg.msgh_voucher_port = 0;
    msg.msgh_remote_port = v11;
    *(void *)&msg.msgh_bits = 0x1800000012LL;
    msg.msgh_id = *(_DWORD *)(v1 + 8);
    si_async_workunit_release(v1);
  }

void si_async_cancel(int a1)
{
  uint64_t unit = si_async_worklist_find_unit(a1);
  if (unit)
  {
    uint64_t v2 = unit;
    uint64_t v3 = (unsigned __int8 *)(unit + 60);
    do
      unsigned __int8 v4 = __ldaxr(v3);
    while (__stlxr(v4 | 1, v3));
    signed int v5 = *(void (**)(void, uint64_t, void))(unit + 72);
    if (v5) {
      v5(0LL, 15LL, *(void *)(unit + 80));
    }
    si_async_workunit_release(v2);
  }

uint64_t si_async_worklist_find_unit(int a1)
{
  for (uint64_t i = si_async_worklist; i; uint64_t i = *(void *)(i + 112))
  {
    if (*(_DWORD *)(i + 88) == a1) {
      break;
    }
  }

  pthread_mutex_unlock(&module_mutex);
  return i;
}

void si_async_workunit_release(uint64_t a1)
{
  if (a1)
  {
    uint64_t v2 = (unsigned int *)(a1 + 64);
    do
    {
      unsigned int v3 = __ldaxr(v2);
      unsigned int v4 = v3 - 1;
    }

    while (__stlxr(v4, v2));
    if (!v4)
    {
      pthread_mutex_lock(&module_mutex);
      signed int v5 = &si_async_worklist;
      uint64_t v6 = si_async_worklist;
      if (si_async_worklist == a1)
      {
LABEL_9:
        uint64_t *v5 = *(void *)(a1 + 112);
      }

      else
      {
        while (v6)
        {
          uint64_t v7 = v6;
          uint64_t v6 = *(void *)(v6 + 112);
          if (v6 == a1)
          {
            signed int v5 = (uint64_t *)(v7 + 112);
            goto LABEL_9;
          }
        }
      }

      pthread_mutex_unlock(&module_mutex);
      uint64_t v8 = *(unsigned int **)(a1 + 96);
      if (v8) {
        si_item_release(v8);
      }
      uint64_t v9 = *(void *)(a1 + 104);
      if (v9) {
        si_list_release(v9);
      }
      unsigned __int8 v10 = *(void **)(a1 + 16);
      if (v10) {
        free(v10);
      }
      mach_port_t v11 = *(void **)(a1 + 24);
      if (v11) {
        free(v11);
      }
      uint64_t v12 = *(void **)(a1 + 32);
      if (v12) {
        free(v12);
      }
      mach_port_name_t v13 = *(_DWORD *)(a1 + 92);
      int v14 = (ipc_space_t *)MEMORY[0x1895FFD48];
      if (v13) {
        mach_port_deallocate(*MEMORY[0x1895FFD48], v13);
      }
      mach_port_mod_refs(*v14, *(_DWORD *)(a1 + 88), 1u, -1);
      free((void *)a1);
    }
  }

void si_async_handle_reply(uint64_t a1)
{
  uint64_t unit = si_async_worklist_find_unit(*(_DWORD *)(a1 + 12));
  if (unit)
  {
    uint64_t v2 = unit;
    if ((*(_DWORD *)(unit + 60) & 1) != 0)
    {
      unsigned int v3 = *(void (**)(void, void, void))(unit + 72);
      if (v3)
      {
        uint64_t v4 = 104LL;
        if ((*(_DWORD *)(unit + 60) & 2) == 0) {
          uint64_t v4 = 96LL;
        }
        v3(*(void *)(unit + v4), *(unsigned int *)(unit + 56), *(void *)(unit + 80));
        *(void *)(v2 + 96) = 0LL;
        *(void *)(v2 + 104) = 0LL;
      }

      si_async_workunit_release(v2);
    }
  }

char *si_standardize_mac_address(char *result)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  if (result)
  {
    uint64_t v1 = result;
    pthread_mutex_lock(&module_mutex);
    uint64_t v2 = ether_aton(v1);
    if (v2)
    {
      unsigned int v3 = v2;
      for (uint64_t i = 0LL; i != 18; i += 3LL)
      {
        unsigned int v5 = v3->octet[0];
        unsigned int v3 = (ether_addr *)((char *)v3 + 1);
        uint64_t v6 = &v8[i];
        if (v5 >= 0x10uLL) {
          sprintf(v6, "%x");
        }
        else {
          sprintf(v6, "0%x");
        }
      }

      pthread_mutex_unlock(&module_mutex);
      uint64_t v7 = 0LL;
      asprintf(&v7, "%s:%s:%s:%s:%s:%s", v8, v9, v10, v11, v12, v13);
      return v7;
    }

    else
    {
      pthread_mutex_unlock(&module_mutex);
      return 0LL;
    }
  }

  return result;
}

unsigned int *LI_get_thread_item(int a1)
{
  uint64_t result = LI_get_thread_info(a1);
  if (result) {
    return *(unsigned int **)result;
  }
  return result;
}

unsigned int *LI_get_thread_info(int a1)
{
  if (_info_key_ok != 1) {
    return 0LL;
  }
  uint64_t v2 = (unsigned int *)pthread_getspecific(_info_key);
  if (!v2)
  {
    uint64_t result = (unsigned int *)calloc(1uLL, 0x18uLL);
    if (!result) {
      return result;
    }
    uint64_t v2 = result;
    pthread_setspecific(_info_key, result);
  }

  uint64_t v4 = *v2;
  if ((_DWORD)v4)
  {
    for (uint64_t i = 0LL; i != v4; ++i)
    {
      if (*(_DWORD *)(*((void *)v2 + 1) + 4 * i) == a1) {
        return *(unsigned int **)(*((void *)v2 + 2) + 8 * i);
      }
    }

    *((void *)v2 + 1) = reallocf(*((void **)v2 + 1), 4LL * (v4 + 1));
    uint64_t v6 = reallocf(*((void **)v2 + 2), 8LL * (v4 + 1));
    *((void *)v2 + 2) = v6;
    uint64_t v7 = (void *)*((void *)v2 + 1);
    if (v7) {
      goto LABEL_13;
    }
    goto LABEL_18;
  }

  uint64_t v7 = malloc(4uLL);
  *((void *)v2 + 1) = v7;
  uint64_t v6 = malloc(8uLL);
  *((void *)v2 + 2) = v6;
  if (!v7)
  {
LABEL_18:
    *((void *)v2 + 1) = 0LL;
    if (v6) {
      free(v6);
    }
    uint64_t result = 0LL;
    *((void *)v2 + 2) = 0LL;
    return result;
  }

unsigned int *LI_get_thread_list(int a1)
{
  uint64_t result = LI_get_thread_info(a1);
  if (result) {
    return (unsigned int *)*((void *)result + 1);
  }
  return result;
}

void LI_set_thread_item(int a1, uint64_t a2)
{
  thread_info = LI_get_thread_info(a1);
  if (thread_info)
  {
    uint64_t v4 = thread_info;
    si_item_release(*(unsigned int **)thread_info);
    *(void *)uint64_t v4 = a2;
  }

uint64_t LI_set_thread_list(int a1, uint64_t a2)
{
  uint64_t result = (uint64_t)LI_get_thread_info(a1);
  if (result)
  {
    uint64_t v4 = result;
    si_list_release(*(void *)(result + 8));
    uint64_t result = si_list_reset(a2);
    *(void *)(v4 + 8) = a2;
  }

  return result;
}

uint64_t _LI_data_init()
{
  uint64_t result = pthread_key_create((pthread_key_t *)&_info_key, (void (__cdecl *)(void *))_LI_data_free);
  if (!(_DWORD)result) {
    _info_key_ok = 1;
  }
  return result;
}

void _LI_data_free(void *a1)
{
  if (a1)
  {
    unint64_t v2 = *(unsigned int *)a1;
    if ((_DWORD)v2)
    {
      for (unint64_t i = 0LL; i < v2; ++i)
      {
        uint64_t v4 = a1[2];
        uint64_t v5 = *(void *)(v4 + 8 * i);
        if (v5)
        {
          si_item_release(*(unsigned int **)v5);
          si_list_release(*(void *)(v5 + 8));
          free((void *)v5);
          uint64_t v4 = a1[2];
          unint64_t v2 = *(unsigned int *)a1;
        }

        *(void *)(v4 + 8 * i) = 0LL;
      }
    }

    uint64_t v6 = (void *)a1[1];
    if (v6) {
      free(v6);
    }
    a1[1] = 0LL;
    uint64_t v7 = (void *)a1[2];
    if (v7) {
      free(v7);
    }
    free(a1);
  }

uint64_t mbr_identifier_translate( unsigned int a1, gid_t *a2, uint64_t a3, unsigned int a4, char **a5, int *a6)
{
  uint64_t result = 5LL;
  if (a3 && a2 && a5)
  {
    if (a3 != -1)
    {
      if (a1 >= 2)
      {
        if (a1 == 6 && a3 != 16) {
          return 22LL;
        }
      }

      else if (a3 != 4)
      {
        return 22LL;
      }
    }

    uint64_t result = 5LL;
    if (a4 > 0x1F) {
      return result;
    }
    if (((1 << a4) & 0x40000003) != 0)
    {
      if (a1 != 6) {
        return result;
      }
      mach_port_t v11 = (char *)malloc(4uLL);
      if (v11)
      {
        uint64_t v12 = v11;
        if (parse_compatibility_uuid((uint64_t)a2, v11, a6))
        {
          uint64_t result = 0LL;
          *a5 = v12;
          return result;
        }

        free(v12);
        return 5LL;
      }
    }

    else
    {
      if (((1 << a4) & 0x80000030) != 0)
      {
        if (a1)
        {
          if (a1 != 1)
          {
            if (a1 != 6) {
              return result;
            }
            if (parse_compatibility_uuid((uint64_t)a2, &v20, &v21)
              && compatibility_name_for_id(v20, v21, a5))
            {
              if (a6) {
                *a6 = v21;
              }
              return 0LL;
            }

            return 5LL;
          }

          if (!compatibility_name_for_id(*a2, 2, a5)) {
            return 5LL;
          }
LABEL_40:
          if (a6)
          {
            uint64_t result = 0LL;
            int v16 = 2;
            goto LABEL_42;
          }

          return 0LL;
        }

        if (!compatibility_name_for_id(*a2, 1, a5)) {
          return 5LL;
        }
        if (!a6) {
          return 0LL;
        }
LABEL_33:
        uint64_t result = 0LL;
        int v16 = 1;
LABEL_42:
        *a6 = v16;
        return result;
      }

      if (a4 != 6) {
        return result;
      }
      if (a1 == 1)
      {
        unsigned int v17 = *a2;
        uint64_t v18 = (unsigned __int8 *)malloc(0x10uLL);
        if (v18)
        {
          unsigned int v19 = v18;
          uuid_copy(v18, _group_compat_prefix);
          *((_DWORD *)v19 + 3) = bswap32(v17);
          *a5 = (char *)v19;
          goto LABEL_40;
        }
      }

      else
      {
        if (a1) {
          return result;
        }
        unsigned int v13 = *a2;
        uint64_t v14 = (unsigned __int8 *)malloc(0x10uLL);
        if (v14)
        {
          int v15 = v14;
          uuid_copy(v14, _user_compat_prefix);
          *((_DWORD *)v15 + 3) = bswap32(v13);
          *a5 = (char *)v15;
          if (!a6) {
            return 0LL;
          }
          goto LABEL_33;
        }
      }
    }

    return 12LL;
  }

  return result;
}

uint64_t parse_compatibility_uuid(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  if (*(void *)a1 != 0xCCCCDDDDEEEEFFFFLL || *(_DWORD *)(a1 + 8) != -1431651397)
  {
    if (*(void *)a1 != 0xCDABEFCDABEFCDABLL || *(_DWORD *)(a1 + 8) != -271733777) {
      return 0LL;
    }
    *a2 = bswap32(*(_DWORD *)(a1 + 12));
    if (!a3) {
      return 1LL;
    }
    LODWORD(result) = 2;
LABEL_14:
    *a3 = result;
    return 1LL;
  }

  *a2 = bswap32(*(_DWORD *)(a1 + 12));
  uint64_t result = 1LL;
  if (a3) {
    goto LABEL_14;
  }
  return result;
}

BOOL compatibility_name_for_id(gid_t a1, int a2, char **a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (a2 == 2)
  {
    int v10 = MEMORY[0x1895FE128]();
    int v15 = 0LL;
    int v8 = getgrgid_r(a1, (group *)&v16, (char *)&v14 - ((v11 + 15) & 0x1FFFFFFF0LL), v10, (group **)&v15);
    goto LABEL_7;
  }

  if (a2 != 1) {
    return 0LL;
  }
  int v6 = MEMORY[0x1895FE128]();
  int v15 = 0LL;
  int v8 = getpwuid_r(a1, &v16, (char *)&v14 - ((v7 + 15) & 0x1FFFFFFF0LL), v6, &v15);
LABEL_7:
  if (v8) {
    BOOL v12 = 1;
  }
  else {
    BOOL v12 = v15 == 0LL;
  }
  if (v12) {
    return 0LL;
  }
  unsigned int v13 = strdup(v16.pw_name);
  *a3 = v13;
  return v13 != 0LL;
}

int mbr_uid_to_uuid(uid_t uid, uuid_t uu)
{
  uid_t identifier = uid;
  return mbr_identifier_to_uuid(0, &identifier, 4uLL, uu);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  int result = mbr_identifier_translate(id_type, (gid_t *)identifier, identifier_size, 6u, (char **)&src, 0LL);
  if (!result)
  {
LABEL_10:
    uuid_copy(uu, src);
    free(src);
    return 0;
  }

  if (result != 5) {
    return result;
  }
  if (id_type == 5)
  {
    uint64_t v11 = getgrnam((const char *)identifier);
    if (v11)
    {
      p_gr_gid = &v11->gr_gid;
      unsigned int v10 = 1;
LABEL_9:
      int result = mbr_identifier_translate(v10, p_gr_gid, 4LL, 6u, (char **)&src, 0LL);
      if (result) {
        return result;
      }
      goto LABEL_10;
    }
  }

  else if (id_type == 4)
  {
    int v8 = getpwnam((const char *)identifier);
    if (v8)
    {
      p_gr_gid = &v8->pw_uid;
      unsigned int v10 = 0;
      goto LABEL_9;
    }
  }

  return 5;
}

int mbr_gid_to_uuid(gid_t gid, uuid_t uu)
{
  gid_t identifier = gid;
  return mbr_identifier_to_uuid(1, &identifier, 4uLL, uu);
}

int mbr_uuid_to_id(const uuid_t uu, id_t *uid_or_gid, int *id_type)
{
  int v5 = mbr_identifier_translate(6u, (gid_t *)uu, 16LL, 0x1Eu, (char **)&v11, &v10);
  if (!v5)
  {
    if (v10 == 1) {
      int v6 = 0;
    }
    else {
      int v6 = -1;
    }
    if (v10 == 2) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
    *id_type = v7;
    int v8 = v11;
    *uid_or_gid = *(_DWORD *)v11;
    free(v8);
  }

  return v5;
}

int mbr_sid_to_uuid(const nt_sid_t *sid, uuid_t uu)
{
  return 5;
}

uint64_t mbr_uuid_to_sid_type()
{
  return 5LL;
}

int mbr_uuid_to_sid(const uuid_t uu, nt_sid_t *sid)
{
  return 5;
}

int mbr_check_membership(const uuid_t user, const uuid_t group, int *ismember)
{
  return 5;
}

uint64_t mbr_check_membership_ext()
{
  return 5LL;
}

uint64_t mbr_check_membership_refresh()
{
  return 5LL;
}

uint64_t mbr_check_membership_by_id()
{
  return 5LL;
}

uint64_t mbr_reset_cache()
{
  return 5LL;
}

uint64_t mbr_close_connections()
{
  return 5LL;
}

uint64_t mbr_user_name_to_uuid(void *identifier, uuid_t uu)
{
  return mbr_identifier_to_uuid(4, identifier, 0xFFFFFFFFFFFFFFFFLL, uu);
}

uint64_t mbr_group_name_to_uuid(void *identifier, uuid_t uu)
{
  return mbr_identifier_to_uuid(5, identifier, 0xFFFFFFFFFFFFFFFFLL, uu);
}

int mbr_check_service_membership(const uuid_t user, const char *servicename, int *ismember)
{
  return 5;
}

int mbr_sid_to_string(const nt_sid_t *sid, char *string)
{
  return 5;
}

int mbr_string_to_sid(const char *string, nt_sid_t *sid)
{
  return 5;
}

uint64_t mbr_uuid_to_string(const unsigned __int8 *a1, char *a2)
{
  return 0LL;
}

uint64_t mbr_set_identifier_ttl()
{
  return 5LL;
}

int getdomainname(char *a1, int a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  size_t v3 = a2;
  *(void *)uint64_t v4 = 0x1600000001LL;
  return sysctl(v4, 2u, a1, &v3, 0LL, 0LL);
}

int setdomainname(const char *a1, int a2)
{
  v3[1] = *MEMORY[0x1895FEE08];
  v3[0] = 0x1600000001LL;
  return sysctl((int *)v3, 2u, 0LL, 0LL, (void *)a1, a2);
}

int xdr_domainname(XDR *a1, domainname *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_keydat(XDR *a1, keydat *a2)
{
  return xdr_bytes(a1, &a2->keydat_val, &a2->keydat_len, 0x400u);
}

int xdr_mapname(XDR *a1, mapname *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_peername(XDR *a1, peername *a2)
{
  return xdr_string(a1, a2, 0x40u);
}

int xdr_valdat(XDR *a1, valdat *a2)
{
  return xdr_bytes(a1, &a2->valdat_val, &a2->valdat_len, 0x400u);
}

int xdr_ypbind_binding(XDR *a1, ypbind_binding *a2)
{
  int result = xdr_opaque(a1, a2->ypbind_binding_addr, 4u);
  if (result) {
    return xdr_opaque(a1, a2->ypbind_binding_port, 2u);
  }
  return result;
}

int xdr_ypbind_resp(XDR *a1, ypbind_resp *a2)
{
  if (!xdr_ypbind_resptype(a1, &a2->ypbind_status)) {
    return 0;
  }
  if (a2->ypbind_status != YPBIND_SUCC_VAL)
  {
    if (a2->ypbind_status == YPBIND_FAIL_VAL) {
      return xdr_u_int(a1, (unsigned int *)&a2->ypbind_resp_u);
    }
    return 0;
  }

  return xdr_ypbind_binding(a1, (ypbind_binding *)&a2->ypbind_resp_u);
}

int xdr_ypbind_setdom(XDR *a1, ypbind_setdom *a2)
{
  if (xdr_domainname(a1, &a2->ypsetdom_domain) && xdr_ypbind_binding(a1, &a2->ypsetdom_binding)) {
    return xdr_u_int(a1, &a2->ypsetdom_vers);
  }
  else {
    return 0;
  }
}

int xdr_ypmaplist(XDR *a1, ypmaplist *a2)
{
  int result = xdr_mapname(a1, &a2->map);
  if (result) {
    return xdr_pointer(a1, (char **)&a2->next, 0x10u, (xdrproc_t)xdr_ypmaplist);
  }
  return result;
}

int xdr_ypreq_key(XDR *a1, ypreq_key *a2)
{
  if (xdr_domainname(a1, &a2->domain) && xdr_mapname(a1, &a2->map)) {
    return xdr_keydat(a1, &a2->key);
  }
  else {
    return 0;
  }
}

int xdr_ypreq_nokey(XDR *a1, ypreq_nokey *a2)
{
  int result = xdr_domainname(a1, &a2->domain);
  if (result) {
    return xdr_mapname(a1, &a2->map);
  }
  return result;
}

int xdr_ypresp_all(XDR *a1, ypresp_all *a2)
{
  int result = xdr_BOOL(a1, &a2->more);
  if (result)
  {
    if (a2->more)
    {
      if (a2->more == 1) {
        return xdr_ypresp_key_val(a1, &a2->ypresp_all_u.val);
      }
      else {
        return 0;
      }
    }

    else
    {
      return 1;
    }
  }

  return result;
}

int xdr_ypresp_key_val(XDR *a1, ypresp_key_val *a2)
{
  if (xdr_ypstat(a1, &a2->stat) && xdr_valdat(a1, &a2->val)) {
    return xdr_keydat(a1, &a2->key);
  }
  else {
    return 0;
  }
}

int xdr_ypresp_maplist(XDR *a1, ypresp_maplist *a2)
{
  int result = xdr_ypstat(a1, &a2->stat);
  if (result) {
    return xdr_pointer(a1, (char **)&a2->maps, 0x10u, (xdrproc_t)xdr_ypmaplist);
  }
  return result;
}

int xdr_ypresp_master(XDR *a1, ypresp_master *a2)
{
  int result = xdr_ypstat(a1, &a2->stat);
  if (result) {
    return xdr_peername(a1, &a2->peer);
  }
  return result;
}

int xdr_ypresp_order(XDR *a1, ypresp_order *a2)
{
  int result = xdr_ypstat(a1, (ypstat *)a2);
  if (result) {
    return xdr_u_int(a1, &a2->ordernum);
  }
  return result;
}

int xdr_ypresp_val(XDR *a1, ypresp_val *a2)
{
  int result = xdr_ypstat(a1, &a2->stat);
  if (result) {
    return xdr_valdat(a1, &a2->val);
  }
  return result;
}

uint64_t xdr_ypresp_all_seq(XDR *a1, void *a2)
{
  while (1)
  {
    if (!xdr_ypresp_all(a1, &v14))
    {
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
      uint64_t v11 = 0LL;
      *a2 = -6LL;
      return v11;
    }

    if (!v14.more)
    {
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
      return 0LL;
    }

    uint64_t stat = v14.ypresp_all_u.val.stat;
    if (v14.ypresp_all_u.val.stat != YP_TRUE) {
      break;
    }
    size_t keydat_len = (int)v14.ypresp_all_u.val.key.keydat_len;
    int v6 = malloc((int)v14.ypresp_all_u.val.key.keydat_len + 1LL);
    int v7 = v6;
    if (v6)
    {
      memcpy(v6, v14.ypresp_all_u.val.key.keydat_val, keydat_len);
      v7[keydat_len] = 0;
    }

    size_t valdat_len = (int)v14.ypresp_all_u.val.val.valdat_len;
    uint64_t v9 = malloc((int)v14.ypresp_all_u.val.val.valdat_len + 1LL);
    int v10 = v9;
    if (!v9)
    {
      free(v7);
      xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
LABEL_16:
      free(v10);
      return 0LL;
    }

    memcpy(v9, v14.ypresp_all_u.val.val.valdat_val, valdat_len);
    *((_BYTE *)v10 + valdat_len) = 0;
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
    if (!v7) {
      goto LABEL_16;
    }
    uint64_t v11 = 1LL;
    int v12 = ypresp_allfn( 1LL,  v7,  v14.ypresp_all_u.val.key.keydat_len,  v10,  v14.ypresp_all_u.val.val.valdat_len,  ypresp_data);
    *a2 = 1LL;
    free(v7);
    free(v10);
    if (v12) {
      return v11;
    }
  }

  if (v14.ypresp_all_u.val.stat == YP_NOMORE)
  {
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
  }

  else
  {
    xdr_free((xdrproc_t)xdr_ypresp_all, &v14);
    *a2 = stat;
  }

  return 1LL;
}

int yp_all(const char *a1, const char *a2, ypall_callback *a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v6 = strlen(a1);
  int v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        size_t v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            if (_yp_dobind(a1, v15))
            {
              return 3;
            }

            else
            {
              int v13 = -1;
              sockaddr_in v16 = *(sockaddr_in *)((char *)v15[0] + 76);
              v16.sin_port = 0;
              int v10 = clnttcp_create(&v16, 0x186A4u, 2u, &v13, 0, 0);
              if (v10)
              {
                uint64_t v11 = v10;
                v15[1] = (dom_binding *)a1;
                v15[2] = (dom_binding *)a2;
                data = a3->data;
                ypresp_allfn = (uint64_t (*)(void, void, void, void, void, void))a3->foreach;
                ypresp_data = (uint64_t)data;
                ((void (*)(void))v10->cl_ops->cl_call)();
                ((void (*)(CLIENT *))v11->cl_ops->cl_destroy)(v11);
                if (*(void *)v14) {
                  int v7 = ypprot_err(v14[0]);
                }
                else {
                  int v7 = 0;
                }
              }

              else
              {
                puts("clnttcp_create failed");
                int v7 = 9;
              }

              _yp_unbind((uint64_t)v15[0]);
            }
          }
        }
      }
    }
  }

  return v7;
}

int _yp_dobind(const char *a1, dom_binding **a2)
{
  uint64_t v38 = *MEMORY[0x1895FEE08];
  __src = (char *)a1;
  int v5 = open_NOCANCEL();
  if (v5 == -1) {
    return 10;
  }
  if (flock(v5, 6) != -1 || *__error() != 35)
  {
    close_NOCANCEL();
    return 10;
  }

  close_NOCANCEL();
  pid_t v6 = getpid();
  int v7 = v6;
  if (_yp_dobind_pid != -1 && _yp_dobind_pid != v6)
  {
    size_t v8 = (void *)_ypbindlist;
    if (_ypbindlist)
    {
      do
      {
        uint64_t v9 = v8[13];
        if (v9) {
          (*(void (**)(void))(*(void *)(v9 + 8) + 32LL))();
        }
        int v10 = (void *)*v8;
        free(v8);
        size_t v8 = v10;
      }

      while (v10);
    }

    _ypbindlist = 0LL;
  }

  _yp_dobind_pid = v7;
  if (a2) {
    *a2 = 0LL;
  }
  if (!a1 || !*a1) {
    return 1;
  }
  uint64_t v11 = &_ypbindlist;
  while (1)
  {
    uint64_t v11 = (uint64_t *)*v11;
    if (!v11) {
      break;
    }
    if (!strcmp(a1, (const char *)v11 + 8))
    {
      int v12 = v11;
      goto LABEL_25;
    }
  }

  ypresp_all v14 = (uint64_t *)calloc(1uLL, 0x80uLL);
  if (!v14) {
    return 6;
  }
  int v12 = v14;
  *((_DWORD *)v14 + 24) = -1;
  v14[15] = 0LL;
LABEL_25:
  BOOL v29 = 0LL;
  int token = -1;
  pthread_t v15 = pthread_self();
  asprintf(&v29, "self.thread.%lu", v15);
  if (v29)
  {
    notify_register_plain();
    free(v29);
  }

  int v16 = 0;
  while (1)
  {
    if (token != -1)
    {
      uint64_t state64 = 0LL;
      notify_get_state(token, &state64);
      if (state64 == 4)
      {
        if (!v11) {
          free(v12);
        }
        int v28 = token;
        goto LABEL_70;
      }
    }

    uint64_t v17 = v12[15];
    *(void *)v37.sin_zero = 0LL;
    *(_DWORD *)&v37.sin_len = 528;
    v37.sin_addr.in_addr_t s_addr = 16777343;
    int v32 = -1;
    unsigned int v19 = clnttcp_create(&v37, 0x186A7u, 2u, &v32, 0, 0);
    if (!v19)
    {
      clnt_pcreateerror("clnttcp_create");
      goto LABEL_62;
    }

    gid_t v20 = v19;
    if ((v37.sin_port & 0xFC) != 0 || v37.sin_port == 5120)
    {
      ((void (*)(CLIENT *))v19->cl_ops->cl_destroy)(v19);
LABEL_62:
      if (!v11) {
        free(v12);
      }
      int v28 = token;
      if (token == -1) {
        return 10;
      }
LABEL_70:
      notify_cancel(v28);
      return 10;
    }

    v2 &= 0xFFFFFFFF00000000LL;
    if (!((unint64_t (*)(CLIENT *, uint64_t, int (__cdecl *)(XDR *, domainname *), char **, int (__cdecl *)(XDR *, ypbind_resp *), char *, void, uint64_t))v19->cl_ops->cl_call)( v19,  1LL,  xdr_domainname,  &__src,  xdr_ypbind_resp,  v33,  _yplib_timeout,  v2))
    {
      ((void (*)(CLIENT *))v20->cl_ops->cl_destroy)(v20);
      if ((v35 & 0xFC) != 0 || v35 == 5120) {
        goto LABEL_62;
      }
      *(uint64_t *)((char *)v12 + 76) = 0LL;
      *(uint64_t *)((char *)v12 + 84) = 0LL;
      *((_WORD *)v12 + 38) = 528;
      __int16 v21 = v35;
      *((_WORD *)v12 + 39) = v35;
      *((_DWORD *)v12 + 20) = v34;
      *((_WORD *)v12 + 46) = v21;
      v12[15] = 2LL;
      strncpy((char *)v12 + 8, __src, 0x40uLL);
      *((_BYTE *)v12 + 72) = 0;
      break;
    }

    if (v11 || v16) {
      fprintf((FILE *)*MEMORY[0x1895FEE10], "YP server for domain %s not responding, still trying\n", __src);
    }
    ++v16;
    ((void (*)(CLIENT *))v20->cl_ops->cl_destroy)(v20);
LABEL_57:
    uint64_t v27 = -2LL;
    if (v17 != -2) {
      uint64_t v27 = -1LL;
    }
    v12[15] = v27;
  }

  if (_yplib_timeout >= 0) {
    int v22 = _yplib_timeout;
  }
  else {
    int v22 = _yplib_timeout + 1;
  }
  uint64_t v23 = v12[13];
  if (v23) {
    (*(void (**)(void))(*(void *)(v23 + 8) + 32LL))();
  }
  v2 &= 0xFFFFFFFF00000000LL;
  *((_DWORD *)v12 + 24) = -1;
  if (v17 == -2)
  {
    uint64_t v24 = clnttcp_create((sockaddr_in *)((char *)v12 + 76), 0x186A4u, 2u, (int *)v12 + 24, 0, 0);
    v12[13] = (uint64_t)v24;
    if (v24) {
      goto LABEL_71;
    }
    uint64_t v25 = "clnttcp_create";
    goto LABEL_56;
  }

  v39.tv_sec = (uint64_t)v22 >> 1;
  *(void *)&v39.__darwin_suseconds_t tv_usec = v2;
  uint64_t v26 = clntudp_create((sockaddr_in *)((char *)v12 + 76), 0x186A4u, 2u, v39, (int *)v12 + 24);
  v12[13] = (uint64_t)v26;
  if (!v26)
  {
    uint64_t v25 = "clntudp_create";
LABEL_56:
    clnt_pcreateerror(v25);
    goto LABEL_57;
  }

LABEL_71:
  if (token != -1) {
    notify_cancel(token);
  }
  if (fcntl_NOCANCEL() == -1)
  {
    perror("fcntl: F_SETFD");
    if (!v11)
    {
LABEL_75:
      *int v12 = _ypbindlist;
      _ypbindlist = (uint64_t)v12;
    }
  }

  else if (!v11)
  {
    goto LABEL_75;
  }

  int result = 0;
  if (a2) {
    *a2 = (dom_binding *)v12;
  }
  return result;
}

uint64_t _yp_unbind(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 104);
  if (result) {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(result + 8) + 32LL))();
  }
  *(void *)(a1 + 104) = 0LL;
  *(_DWORD *)(a1 + 96) = -1;
  return result;
}

int yp_bind(const char *a1)
{
  return _yp_dobind(a1, 0LL);
}

void yp_unbind(const char *a1)
{
  uint64_t v2 = 0LL;
  size_t v3 = &_ypbindlist;
  while (1)
  {
    size_t v3 = (uint64_t *)*v3;
    if (!v3) {
      break;
    }
    uint64_t v4 = v2;
    int v5 = strcmp(a1, (const char *)v3 + 8);
    uint64_t v2 = v3;
    if (!v5)
    {
      uint64_t v6 = v3[13];
      if (v6) {
        (*(void (**)(void))(*(void *)(v6 + 8) + 32LL))();
      }
      if (v4) {
        int v7 = v4;
      }
      else {
        int v7 = &_ypbindlist;
      }
      *int v7 = *v3;
      free(v3);
      return;
    }
  }

int yp_first(const char *a1, const char *a2, char **a3, int *a4, char **a5, int *a6)
{
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v12 = strlen(a1);
  int v13 = 1;
  if (a2 && v12 <= 0x40 && *a2 && strlen(a2) <= 0x40)
  {
    *a5 = 0LL;
    *a3 = 0LL;
    *a6 = 0;
    *a4 = 0;
    if (_yp_dobind(a1, v23))
    {
      return 3;
    }

    else
    {
      int v15 = 0;
      int v13 = 3;
      while (1)
      {
        v23[1] = (dom_binding *)a1;
        _OWORD v23[2] = (dom_binding *)a2;
        *(_OWORD *)uint64_t v24 = 0u;
        *(_OWORD *)__src = 0u;
        uint64_t v26 = 0LL;
        if (v15) {
          clnt_perror(*((CLIENT **)v23[0] + 13), "yp_first: clnt_call");
        }
        if (yp_first_proto) {
          uint64_t v16 = -1LL;
        }
        else {
          uint64_t v16 = -2LL;
        }
        yp_first_proto ^= 1u;
        *((void *)v23[0] + 15) = v16;
        --v15;
        if (_yp_dobind(a1, v23)) {
          return v13;
        }
      }

      int v13 = ypprot_err(v24[0]);
      if (!v13)
      {
        size_t v17 = (int)v24[2];
        *a4 = v24[2];
        uint64_t v18 = (char *)malloc(v17 + 1);
        *a3 = v18;
        if (v18)
        {
          unsigned int v19 = v18;
          memcpy(v18, __src[0], v17);
          int v13 = 0;
          v19[v17] = 0;
        }

        else
        {
          int v13 = 7;
        }

        size_t v20 = SLODWORD(__src[1]);
        *a6 = (int)__src[1];
        __int16 v21 = (char *)malloc(v20 + 1);
        *a5 = v21;
        if (v21)
        {
          int v22 = v21;
          memcpy(v21, v26, v20);
          v22[v20] = 0;
        }

        else
        {
          int v13 = 7;
        }
      }

      xdr_free((xdrproc_t)xdr_ypresp_key_val, v24);
      _yp_unbind((uint64_t)v23[0]);
    }
  }

  return v13;
}

int yp_get_default_domain(char **a1)
{
  *a1 = 0LL;
  if (!_yp_domain && getdomainname(&_yp_domain, 256) < 0) {
    return 12;
  }
  int result = 0;
  *a1 = &_yp_domain;
  return result;
}

int yp_maplist(const char *a1, ypmaplist **a2)
{
  uint64_t v9 = a1;
  if (_yp_dobind(a1, &v8)) {
    return 3;
  }
  int v3 = 0;
  while ((**(unsigned int (***)(void))(*((void *)v8 + 13) + 8LL))())
  {
    if (v3) {
      clnt_perror(*((CLIENT **)v8 + 13), "yp_maplist: clnt_call");
    }
    if (yp_maplist_proto) {
      uint64_t v4 = -1LL;
    }
    else {
      uint64_t v4 = -2LL;
    }
    yp_maplist_proto ^= 1u;
    int v5 = v9;
    *((void *)v8 + 15) = v4;
    --v3;
    if (_yp_dobind(v5, &v8)) {
      return 3;
    }
  }

  int v7 = v8;
  *a2 = 0LL;
  _yp_unbind((uint64_t)v7);
  return ypprot_err(0);
}

int yp_master(const char *a1, const char *a2, char **a3)
{
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v6 = strlen(a1);
  int v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        size_t v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            if (_yp_dobind(a1, &v15))
            {
              return 3;
            }

            else
            {
              int v10 = 0;
              int v7 = 3;
              while (1)
              {
                *(void *)int v13 = 0LL;
                __s1 = 0LL;
                if (v10) {
                  clnt_perror(*((CLIENT **)v15 + 13), "yp_master: clnt_call");
                }
                if (yp_master_proto) {
                  uint64_t v11 = -1LL;
                }
                else {
                  uint64_t v11 = -2LL;
                }
                yp_master_proto ^= 1u;
                *((void *)v15 + 15) = v11;
                --v10;
                if (_yp_dobind(a1, &v15)) {
                  return v7;
                }
              }

              int v7 = ypprot_err(v13[0]);
              if (!v7)
              {
                size_t v12 = strdup(__s1);
                *a3 = v12;
                if (v12) {
                  int v7 = 0;
                }
                else {
                  int v7 = 7;
                }
              }

              xdr_free((xdrproc_t)xdr_ypresp_master, v13);
              _yp_unbind((uint64_t)v15);
            }
          }
        }
      }
    }
  }

  return v7;
}

int yp_order(const char *a1, const char *a2, int *a3)
{
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v6 = strlen(a1);
  int v7 = 1;
  if (a2)
  {
    if (v6 <= 0x40)
    {
      if (*a2)
      {
        size_t v8 = strlen(a2);
        if (a3)
        {
          if (v8 <= 0x40)
          {
            if (_yp_dobind(a1, &v14))
            {
              return 3;
            }

            else
            {
              int v10 = 0;
              int v7 = 3;
              while (1)
              {
                *(void *)int v13 = 0LL;
                int v11 = (**(uint64_t (***)(void, uint64_t))(*((void *)v14 + 13) + 8LL))( *((void *)v14 + 13),  10LL);
                if (!v11)
                {
                  *a3 = v13[1];
                  xdr_free((xdrproc_t)xdr_ypresp_order, v13);
                  int v7 = ypprot_err(v13[0]);
                  goto LABEL_24;
                }

                if (v11 == 10) {
                  break;
                }
                if (v10) {
                  clnt_perror(*((CLIENT **)v14 + 13), "yp_order: clnt_call");
                }
                if (yp_order_proto) {
                  uint64_t v12 = -1LL;
                }
                else {
                  uint64_t v12 = -2LL;
                }
                yp_order_proto ^= 1u;
                *((void *)v14 + 15) = v12;
                --v10;
                if (_yp_dobind(a1, &v14)) {
                  return v7;
                }
              }

              int v7 = 6;
LABEL_24:
              _yp_unbind((uint64_t)v14);
            }
          }
        }
      }
    }
  }

  return v7;
}

char *__cdecl yperr_string(int a1)
{
  uint64_t v1 = yperr_string_err;
  snprintf(yperr_string_err, 0x50uLL, "YP unknown error %d\n", a1);
  return v1;
}

int yp_match(const char *a1, const char *a2, const char *a3, int a4, char **a5, int *a6)
{
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v12 = strlen(a1);
  int v13 = 1;
  if (a2)
  {
    if (v12 <= 0x40)
    {
      if (*a2)
      {
        size_t v14 = strlen(a2);
        if (a4)
        {
          if (a3 && v14 <= 0x40)
          {
            *a5 = 0LL;
            *a6 = 0;
            if (_yp_dobind(a1, &v27))
            {
              return 3;
            }

            else
            {
              int v16 = 0;
              int v13 = 3;
              while (1)
              {
                v21[0] = a1;
                v21[1] = a2;
                uint64_t v23 = a3;
                *(void *)uint64_t v24 = 0LL;
                int v22 = a4;
                uint64_t v25 = 0LL;
                __src = 0LL;
                if (!(**(unsigned int (***)(void, uint64_t, int (__cdecl *)(XDR *, ypreq_key *), void *))(*((void *)v27 + 13) + 8LL))( *((void *)v27 + 13),  3LL,  xdr_ypreq_key,  v21)) {
                  break;
                }
                if (v16) {
                  clnt_perror(*((CLIENT **)v27 + 13), "yp_match: clnt_call");
                }
                uint64_t v17 = -2LL;
                if (yp_match_proto) {
                  uint64_t v17 = -1LL;
                }
                yp_match_proto ^= 1u;
                *((void *)v27 + 15) = v17;
                --v16;
                if (_yp_dobind(a1, &v27)) {
                  return v13;
                }
              }

              int v13 = ypprot_err(v24[0]);
              if (!v13)
              {
                size_t v18 = (int)v25;
                *a6 = v25;
                unsigned int v19 = (char *)malloc(v18 + 1);
                *a5 = v19;
                if (v19)
                {
                  size_t v20 = v19;
                  memcpy(v19, __src, v18);
                  int v13 = 0;
                  v20[v18] = 0;
                }

                else
                {
                  int v13 = 6;
                }
              }

              xdr_free((xdrproc_t)xdr_ypresp_val, v24);
              _yp_unbind((uint64_t)v27);
            }
          }
        }
      }
    }
  }

  return v13;
}

int yp_next(const char *a1, const char *a2, const char *a3, int a4, char **a5, int *a6, char **a7, int *a8)
{
  if (!a1 || !*a1) {
    return 1;
  }
  size_t v16 = strlen(a1);
  int v17 = 1;
  if (a2 && v16 <= 0x40 && *a2 && strlen(a2) <= 0x40)
  {
    *a7 = 0LL;
    *a5 = 0LL;
    *a8 = 0;
    *a6 = 0;
    if (_yp_dobind(a1, v27))
    {
      return 3;
    }

    else
    {
      int v19 = 0;
      int v17 = 3;
      while (1)
      {
        v27[1] = (dom_binding *)a1;
        v27[2] = (dom_binding *)a2;
        BOOL v29 = a3;
        int v28 = a4;
        *(_OWORD *)int v30 = 0u;
        *(_OWORD *)__src = 0u;
        int v32 = 0LL;
        if (v19) {
          clnt_perror(*((CLIENT **)v27[0] + 13), "yp_next: clnt_call");
        }
        uint64_t v20 = -2LL;
        if (yp_next_proto) {
          uint64_t v20 = -1LL;
        }
        yp_next_proto ^= 1u;
        *((void *)v27[0] + 15) = v20;
        --v19;
        if (_yp_dobind(a1, v27)) {
          return v17;
        }
      }

      int v17 = ypprot_err(v30[0]);
      if (!v17)
      {
        size_t v21 = (int)v30[2];
        *a6 = v30[2];
        int v22 = (char *)malloc(v21 + 1);
        *a5 = v22;
        if (v22)
        {
          uint64_t v23 = v22;
          memcpy(v22, __src[0], v21);
          int v17 = 0;
          v23[v21] = 0;
        }

        else
        {
          int v17 = 7;
        }

        size_t v24 = SLODWORD(__src[1]);
        *a8 = (int)__src[1];
        uint64_t v25 = (char *)malloc(v24 + 1);
        *a7 = v25;
        if (v25)
        {
          uint64_t v26 = v25;
          memcpy(v25, v32, v24);
          v26[v24] = 0;
        }

        else
        {
          int v17 = 7;
        }
      }

      xdr_free((xdrproc_t)xdr_ypresp_key_val, v30);
      _yp_unbind((uint64_t)v27[0]);
    }
  }

  return v17;
}

int xdr_x_passwd(XDR *a1, x_passwd *a2)
{
  int result = xdr_string(a1, &a2->pw_name, 0xFFFFFFFF);
  if (result)
  {
    int result = xdr_string(a1, &a2->pw_passwd, 0xFFFFFFFF);
    if (result)
    {
      int result = xdr_int(a1, &a2->pw_uid);
      if (result)
      {
        int result = xdr_int(a1, &a2->pw_gid);
        if (result)
        {
          int result = xdr_string(a1, &a2->pw_gecos, 0xFFFFFFFF);
          if (result)
          {
            int result = xdr_string(a1, &a2->pw_dir, 0xFFFFFFFF);
            if (result) {
              return xdr_string(a1, &a2->pw_shell, 0xFFFFFFFF) != 0;
            }
          }
        }
      }
    }
  }

  return result;
}

int xdr_yppasswd(XDR *a1, yppasswd *a2)
{
  int result = xdr_string(a1, &a2->oldpass, 0xFFFFFFFF);
  if (result) {
    return xdr_x_passwd(a1, &a2->newpw);
  }
  return result;
}

int ypprot_err(unsigned int a1)
{
  if (a1 + 8 > 0xA) {
    return 6;
  }
  else {
    return dword_1804DCC88[a1 + 8];
  }
}

AUTH *authnone_create(void)
{
  uint64_t v0 = authnone_private;
  if (!authnone_private)
  {
    uint64_t v1 = calloc(1uLL, 0x60uLL);
    uint64_t v0 = (uint64_t)v1;
    if (!v1) {
      return (AUTH *)v0;
    }
    authnone_private = (uint64_t)v1;
  }

  if (!*(_DWORD *)(v0 + 92))
  {
    __int128 v2 = *(_OWORD *)&_null_auth.oa_flavor;
    *(_OWORD *)(v0 + 24) = *(_OWORD *)&_null_auth.oa_flavor;
    uint64_t v3 = *(void *)&_null_auth.oa_length;
    *(void *)(v0 + 40) = *(void *)&_null_auth.oa_length;
    *(_OWORD *)uint64_t v0 = v2;
    *(void *)(v0 + 16) = v3;
    *(void *)(v0 + 56) = ops;
    xdrmem_create(&v6, (char *)(v0 + 72), 0x14u, XDR_ENCODE);
    xdr_opaque_auth(&v6, v0);
    xdr_opaque_auth(&v6, v0 + 24);
    *(_DWORD *)(v0 + 92) = ((uint64_t (*)(XDR *))v6.x_ops->x_getpostn)(&v6);
    x_destroy = v6.x_ops->x_destroy;
    if (x_destroy) {
      ((void (*)(XDR *))x_destroy)(&v6);
    }
  }

  return (AUTH *)v0;
}

uint64_t authnone_marshal(uint64_t a1, uint64_t a2)
{
  if (authnone_private) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a2 + 8) + 24LL))( a2,  authnone_private + 72,  *(unsigned int *)(authnone_private + 92));
  }
  else {
    return 0LL;
  }
}

uint64_t authnone_validate()
{
  return 1LL;
}

uint64_t authnone_refresh()
{
  return 0LL;
}

AUTH *__cdecl authunix_create(char *a1, int a2, int a3, int a4, int *a5)
{
  uint64_t v25 = *MEMORY[0x1895FEE08];
  int v10 = (char *)calloc(1uLL, 0x48uLL);
  if (!v10)
  {
    fwrite("authunix_create: out of memory\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
    return (AUTH *)v10;
  }

  int v11 = (char *)calloc(1uLL, 0x1C8uLL);
  if (!v11)
  {
    int v19 = v10;
LABEL_9:
    free(v19);
    fwrite("authunix_create: out of memory\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
    return 0LL;
  }

  size_t v12 = v11;
  *((void *)v10 + 7) = auth_unix_ops;
  *((void *)v10 + 8) = v11;
  __int128 v13 = *(_OWORD *)&_null_auth.oa_flavor;
  *(_OWORD *)(v11 + 24) = *(_OWORD *)&_null_auth.oa_flavor;
  uint64_t v14 = *(void *)&_null_auth.oa_length;
  *((void *)v11 + 5) = *(void *)&_null_auth.oa_length;
  *(_OWORD *)(v10 + 24) = v13;
  *((void *)v10 + 5) = v14;
  *((_DWORD *)v11 + 12) = 0;
  gettimeofday(&v22, 0LL);
  v23.aup_time = v22.tv_sec;
  v23.aup_machname = a1;
  v23.aup_uid = a2;
  v23.aup_gid = a3;
  v23.aup_len = a4;
  v23.aup_gids = a5;
  xdrmem_create(&v21, __src, 0x190u, XDR_ENCODE);
  if (!xdr_authunix_parms(&v21, &v23)) {
    abort();
  }
  unsigned int v15 = ((uint64_t (*)(XDR *))v21.x_ops->x_getpostn)(&v21);
  *((_DWORD *)v12 + 4) = v15;
  *(_DWORD *)size_t v12 = 1;
  size_t v16 = v15;
  int v17 = calloc(1uLL, v15);
  v12[1] = v17;
  if (!v17)
  {
    free(v10);
    int v19 = v12;
    goto LABEL_9;
  }

  memmove(v17, __src, v16);
  uint64_t v18 = v12[2];
  *(_OWORD *)int v10 = *(_OWORD *)v12;
  *((void *)v10 + 2) = v18;
  marshal_new_auth((uint64_t)v10);
  return (AUTH *)v10;
}

AUTH *authunix_create_default(void)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  if (gethostname(v6, 0xFFuLL) == -1 || (v6[255] = 0, v0 = geteuid(), v1 = getegid(), int v2 = getgroups(16, v5), v2 < 0)) {
    abort();
  }
  if (v2 >= maxgrplist) {
    int v3 = maxgrplist;
  }
  else {
    int v3 = v2;
  }
  return authunix_create(v6, v0, v1, v3, (int *)v5);
}

uint64_t authunix_marshal(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)(a2 + 8) + 24LL))( a2,  *(void *)(a1 + 64) + 52LL,  *(unsigned int *)(*(void *)(a1 + 64) + 452LL));
}

uint64_t authunix_validate(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a2 == 2)
  {
    int v3 = *(__int128 **)(a1 + 64);
    xdrmem_create(&v7, *(char **)(a2 + 8), *(_DWORD *)(a2 + 16), XDR_DECODE);
    uint64_t v4 = (void *)*((void *)v3 + 4);
    if (v4)
    {
      free(v4);
      *((void *)v3 + 4) = 0LL;
    }

    if (xdr_opaque_auth(&v7, (uint64_t)v3 + 24))
    {
      int v3 = (__int128 *)((char *)v3 + 24);
    }

    else
    {
      v7.x_op = XDR_FREE;
      xdr_opaque_auth(&v7, (uint64_t)v3 + 24);
      *((void *)v3 + 4) = 0LL;
    }

    __int128 v5 = *v3;
    *(void *)(a1 + 16) = *((void *)v3 + 2);
    *(_OWORD *)a1 = v5;
    marshal_new_auth(a1);
  }

  return 1LL;
}

uint64_t authunix_refresh(uint64_t a1)
{
  gid_t v1 = *(__int128 **)(a1 + 64);
  int v2 = (char *)*((void *)v1 + 1);
  ++*((_DWORD *)v1 + 12);
  v10.aup_machname = 0LL;
  v10.aup_gids = 0LL;
  xdrmem_create(&v8, v2, *((_DWORD *)v1 + 4), XDR_DECODE);
  if (xdr_authunix_parms(&v8, &v10))
  {
    gettimeofday(&v9, 0LL);
    v10.aup_time = v9.tv_sec;
    v8.x_op = XDR_ENCODE;
    ((void (*)(XDR *, void))v8.x_ops->x_setpostn)(&v8, 0LL);
    uint64_t v4 = xdr_authunix_parms(&v8, &v10);
    if ((_DWORD)v4)
    {
      __int128 v5 = *v1;
      *(void *)(a1 + 16) = *((void *)v1 + 2);
      *(_OWORD *)a1 = v5;
      marshal_new_auth(a1);
    }
  }

  else
  {
    uint64_t v4 = 0LL;
  }

  v8.x_op = XDR_FREE;
  xdr_authunix_parms(&v8, &v10);
  x_destroy = v8.x_ops->x_destroy;
  if (x_destroy) {
    ((void (*)(XDR *))x_destroy)(&v8);
  }
  return v4;
}

void authunix_destroy(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  free(*(void **)(v2 + 8));
  int v3 = *(void **)(v2 + 32);
  if (v3) {
    free(v3);
  }
  free(*(void **)(a1 + 64));
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4) {
    free(v4);
  }
  free((void *)a1);
}

void marshal_new_auth(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  xdrmem_create(&v4, (char *)(v2 + 52), 0x190u, XDR_ENCODE);
  else {
    perror("auth_none.c - Fatal marshalling problem");
  }
  x_destroy = v4.x_ops->x_destroy;
  if (x_destroy) {
    ((void (*)(XDR *))x_destroy)(&v4);
  }
}

int xdr_authunix_parms(XDR *a1, authunix_parms *a2)
{
  return xdr_u_long(a1, &a2->aup_time)
      && xdr_string(a1, &a2->aup_machname, 0xFFu)
      && xdr_int(a1, &a2->aup_uid)
}

uint64_t *si_module_static_muser()
{
  if (si_module_static_muser_once != -1) {
    dispatch_once(&si_module_static_muser_once, &__block_literal_global_2);
  }
  return &si_module_static_muser_si;
}

_OWORD *muser_user_byname(uint64_t a1, const char *a2)
{
  if (*a2 == 95) {
    return 0LL;
  }
  if (!_muser_available()) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4) {
    return 0LL;
  }
  __int128 v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "username");
  xpc_dictionary_set_string(v5, "query", a2);
  XDR v6 = (void *)_muser_call("getpwnam", v5);
  if (v6)
  {
    XDR v7 = v6;
    user = _muser_extract_user(a1, v6);
    xpc_release(v7);
  }

  else
  {
    user = 0LL;
  }

  xpc_release(v5);
  return user;
}

_OWORD *muser_user_byuid(uint64_t a1, unsigned int a2)
{
  if (a2 < 0x1F5) {
    return 0LL;
  }
  if (!_muser_available()) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4) {
    return 0LL;
  }
  __int128 v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "uid");
  xpc_dictionary_set_int64(v5, "query", a2);
  XDR v6 = (void *)_muser_call("getpwuid", v5);
  if (v6)
  {
    XDR v7 = v6;
    user = _muser_extract_user(a1, v6);
    xpc_release(v7);
  }

  else
  {
    user = 0LL;
  }

  xpc_release(v5);
  return user;
}

_OWORD *muser_group_byname(uint64_t a1, char *__s1)
{
  if (*__s1 == 95 && strcmp(__s1, "_analyticsusers") && strcmp(__s1, "_accessory_mobile_share")) {
    return 0LL;
  }
  if (!_muser_available()) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4) {
    return 0LL;
  }
  __int128 v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "groupname");
  xpc_dictionary_set_string(v5, "query", __s1);
  XDR v6 = (void *)_muser_call("getgrnam", v5);
  if (v6)
  {
    XDR v7 = v6;
    group = _muser_extract_group(a1, v6);
    xpc_release(v7);
  }

  else
  {
    group = 0LL;
  }

  xpc_release(v5);
  return group;
}

_OWORD *muser_group_bygid(uint64_t a1, unsigned int a2)
{
  if (a2 > 0x1F4 || (group = 0LL, a2 - 250 <= 0x31) && ((1LL << (a2 + 6)) & 0x2001000000001LL) != 0)
  {
    if (_muser_available() && (xpc_object_t v5 = xpc_dictionary_create(0LL, 0LL, 0LL)) != 0LL)
    {
      XDR v6 = v5;
      xpc_dictionary_set_string(v5, "reqtype", "gid");
      xpc_dictionary_set_int64(v6, "query", a2);
      XDR v7 = (void *)_muser_call("getgrgid", v6);
      if (v7)
      {
        XDR v8 = v7;
        group = _muser_extract_group(a1, v7);
        xpc_release(v8);
      }

      else
      {
        group = 0LL;
      }

      xpc_release(v6);
    }

    else
    {
      return 0LL;
    }
  }

  return group;
}

_OWORD *muser_grouplist(uint64_t a1, const char *a2)
{
  if (*a2 == 95) {
    return 0LL;
  }
  if (!_muser_available()) {
    return 0LL;
  }
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  if (!v4) {
    return 0LL;
  }
  xpc_object_t v5 = v4;
  xpc_dictionary_set_string(v4, "reqtype", "grouplist");
  xpc_dictionary_set_string(v5, "query", a2);
  XDR v6 = (void *)_muser_call("getgrouplist", v5);
  if (v6)
  {
    XDR v7 = v6;
    uint64_t v23 = 0LL;
    size_t v24 = &v23;
    uint64_t v25 = 0x2000000000LL;
    uint64_t v26 = 0LL;
    xpc_object_t value = xpc_dictionary_get_value(v6, "grouplist");
    if (value)
    {
      size_t v16 = value;
      if (MEMORY[0x186DFD7CC]() == MEMORY[0x189600958])
      {
        size_t count = xpc_array_get_count(v16);
        uint64_t v20 = calloc(count + 1, 4uLL);
        v24[3] = (uint64_t)v20;
        applier[0] = MEMORY[0x1895FED80];
        applier[1] = 0x40000000LL;
        applier[2] = ___muser_extract_grouplist_block_invoke;
        applier[3] = &unk_18965FEA8;
        applier[4] = &v23;
        xpc_array_apply(v16, applier);
      }
    }

    if (v24[3])
    {
      int v17 = LI_ils_create("L4488s4@", v9, v10, v11, v12, v13, v14, v15, a1);
      XDR v21 = (void *)v24[3];
    }

    else
    {
      XDR v21 = 0LL;
      int v17 = 0LL;
    }

    free(v21);
    _Block_object_dispose(&v23, 8);
    xpc_release(v7);
  }

  else
  {
    int v17 = 0LL;
  }

  xpc_release(v5);
  return v17;
}

uint64_t __si_module_static_muser_block_invoke()
{
  si_module_static_muser_sunint64_t i = (uint64_t)strdup("muser");
  uint64_t result = xpc_user_sessions_enabled();
  if (!(_DWORD)result || (uint64_t result = xpc_user_sessions_get_session_uid(), (_DWORD)result)) {
    qword_18C43C500 = (uint64_t)muser_is_valid;
  }
  return result;
}

const char *muser_is_valid(const char **a1, const char ***a2)
{
  uint64_t result = 0LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = *a1;
      if (*a1)
      {
        xpc_object_t v4 = *a2;
        if (*a2 && *v4) {
          return (const char *)(strcmp(result, *v4) == 0);
        }
        else {
          return 0LL;
        }
      }
    }
  }

  return result;
}

BOOL _muser_available()
{
  xpc_object_t v0 = _muser_xpc_pipe(0);
  if (v0) {
    xpc_release(v0);
  }
  return _si_muser_disabled == 0;
}

uint64_t _muser_call(const char *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1895FEE08];
  xpc_object_t v4 = _muser_xpc_pipe(0);
  if (!v4) {
    return 0LL;
  }
  xpc_object_t v5 = v4;
  xpc_dictionary_set_string(a2, "procname", a1);
  xpc_dictionary_set_uint64(a2, "version", 1uLL);
  char v6 = 0;
  XDR v7 = (os_log_s *)MEMORY[0x189600830];
  while (1)
  {
    int v8 = xpc_pipe_routine();
    int v9 = v8;
    if (v8 != 32 && v8 != 35) {
      break;
    }
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x189600830], OS_LOG_TYPE_ERROR)) {
        _muser_call_cold_1(v9);
      }
      goto LABEL_14;
    }

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      _muser_call_cold_2(buf, v9, &v14);
    }
    xpc_release(v5);
    char v6 = 1;
    xpc_object_t v5 = _muser_xpc_pipe(1);
    if (!v5) {
      return 0LL;
    }
  }

  if (!v8)
  {
    uint64_t v10 = v12;
    goto LABEL_15;
  }

_OWORD *_muser_extract_user(uint64_t a1, xpc_object_t xdict)
{
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x6000000000LL;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  int v16 = 3;
  v17[3] = "";
  v17[4] = "*";
  v17[5] = 0LL;
  v17[6] = 0LL;
  v17[7] = "";
  v17[8] = "";
  v17[9] = "/var/empty";
  v17[10] = "/usr/bin/false";
  v17[11] = 0LL;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___muser_extract_user_block_invoke;
  applier[3] = &unk_18965FE58;
  applier[4] = v17;
  void applier[5] = &v13;
  xpc_dictionary_apply(xdict, applier);
  uint64_t v10 = 0LL;
  if (!*((_DWORD *)v14 + 6)) {
    uint64_t v10 = LI_ils_create("L4488ss44LssssL", v3, v4, v5, v6, v7, v8, v9, a1);
  }
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(v17, 8);
  return v10;
}

xpc_object_t _muser_xpc_pipe(int a1)
{
  if (_muser_xpc_pipe_once != -1) {
    dispatch_once(&_muser_xpc_pipe_once, &__block_literal_global_7);
  }
  if (_si_muser_disabled != 1)
  {
    pthread_mutex_lock(&mutex);
    xpc_object_t v2 = (xpc_object_t)__muser_pipe;
    if (a1)
    {
      xpc_release((xpc_object_t)__muser_pipe);
      __muser_pipe = 0LL;
    }

    else if (__muser_pipe)
    {
LABEL_18:
      xpc_object_t v2 = xpc_retain(v2);
LABEL_19:
      pthread_mutex_unlock(&mutex);
      return v2;
    }

    if (xpc_user_sessions_enabled())
    {
      xpc_user_sessions_get_foreground_uid();
      uint64_t v3 = xpc_pipe_create_with_user_session_uid();
    }

    else
    {
      uint64_t v3 = xpc_pipe_create();
    }

    xpc_object_t v2 = (xpc_object_t)v3;
    __muser_pipe = v3;
    if (!_si_muser_disabled)
    {
      if (v3
        && (xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL),
            xpc_dictionary_set_string(v4, "reqtype", "available"),
            xpc_dictionary_set_int64(v4, "version", 1LL),
            int v5 = xpc_pipe_routine(),
            xpc_release(v4),
            !v5))
      {
        int v6 = xpc_dictionary_get_BOOL(0LL, "available");
        xpc_release(0LL);
      }

      else
      {
        int v6 = xpc_user_sessions_enabled();
      }

      _si_muser_disabled = v6 ^ 1;
      xpc_object_t v2 = (xpc_object_t)__muser_pipe;
    }

    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }

  return 0LL;
}

uint64_t ___muser_xpc_pipe_block_invoke()
{
  uint32_t multiuser_flags = 0;
  xpc_object_t v0 = getenv("XBS_DISABLE_LIBINFO");
  uint64_t result = issetugid();
  if (v0) {
    BOOL v2 = (_DWORD)result == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (!v2 || (uint64_t result = strcmp(v0, "YES"), (_DWORD)result))
  {
    host_t v3 = MEMORY[0x186DFD304](result);
    uint64_t result = host_get_multiuser_config_flags(v3, &multiuser_flags);
    if ((_DWORD)result || multiuser_flags >> 30) {
      return pthread_atfork( (void (*)(void))_muser_fork_prepare,  (void (*)(void))_muser_fork_parent,  (void (*)(void))_muser_fork_child);
    }
  }

  _si_muser_disabled = 1;
  return result;
}

uint64_t _muser_fork_prepare()
{
  return pthread_mutex_lock(&mutex);
}

uint64_t _muser_fork_parent()
{
  return pthread_mutex_unlock(&mutex);
}

uint64_t _muser_fork_child()
{
  if (__muser_pipe)
  {
    xpc_pipe_invalidate();
    __muser_pipe = 0LL;
  }

  return pthread_mutex_unlock(&mutex);
}

uint64_t ___muser_extract_user_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  if (!__s1) {
    return 1LL;
  }
  if (!strcmp(__s1, "pw_name"))
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!string_ptr) {
      return 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = string_ptr;
    goto LABEL_12;
  }

  if (strcmp(__s1, "pw_passwd"))
  {
    if (!strcmp(__s1, "pw_uid"))
    {
      if (MEMORY[0x186DFD7CC](a3) != MEMORY[0x1896009A8]) {
        return 1LL;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 4LI_set_thread_list(12, 0LL) = xpc_int64_get_value(a3);
    }

    else
    {
      if (strcmp(__s1, "pw_gid"))
      {
        if (!strcmp(__s1, "pw_dir"))
        {
          uint64_t v9 = xpc_string_get_string_ptr(a3);
          if (v9) {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 72LL) = v9;
          }
        }

        else if (!strcmp(__s1, "pw_shell"))
        {
          int v6 = xpc_string_get_string_ptr(a3);
          if (v6) {
            *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 8LI_set_thread_list(12, 0LL) = v6;
          }
        }

        return 1LL;
      }

      if (MEMORY[0x186DFD7CC](a3) != MEMORY[0x1896009A8]) {
        return 1LL;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 44LL) = xpc_int64_get_value(a3);
    }

_OWORD *_muser_extract_group(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3800000000LL;
  uint64_t v13 = 0LL;
  int v14 = &v13;
  uint64_t v15 = 0x2000000000LL;
  int v16 = 2;
  int v22 = 0;
  uint64_t v20 = "";
  XDR v21 = "*";
  uint64_t v23 = 0LL;
  applier[0] = MEMORY[0x1895FED80];
  applier[1] = 0x40000000LL;
  applier[2] = ___muser_extract_group_block_invoke;
  applier[3] = &unk_18965FE80;
  applier[4] = &v17;
  void applier[5] = &v13;
  xpc_dictionary_apply(xdict, applier);
  uint64_t v10 = 0LL;
  if (!*((_DWORD *)v14 + 6))
  {
    uint64_t v10 = LI_ils_create("L4488ss4*", v3, v4, v5, v6, v7, v8, v9, a1);
    free((void *)v18[6]);
  }

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  return v10;
}

uint64_t ___muser_extract_group_block_invoke(uint64_t a1, char *__s1, void *a3)
{
  if (!__s1) {
    return 1LL;
  }
  if (!strcmp(__s1, "gr_name"))
  {
    string_ptr = xpc_string_get_string_ptr(a3);
    if (!string_ptr) {
      return 1LL;
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = string_ptr;
LABEL_14:
    --*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
    return 1LL;
  }

  if (!strcmp(__s1, "gr_gid"))
  {
    if (MEMORY[0x186DFD7CC](a3) != MEMORY[0x1896009A8]) {
      return 1LL;
    }
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 4LI_set_thread_list(12, 0LL) = xpc_int64_get_value(a3);
    goto LABEL_14;
  }

  if (!strcmp(__s1, "gr_members") && MEMORY[0x186DFD7CC](a3) == MEMORY[0x189600958])
  {
    size_t count = xpc_array_get_count(a3);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) = malloc(8 * count + 8);
    *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) + 8 * count) = 0LL;
    if (count)
    {
      for (size_t i = 0LL; i != count; ++i)
        *(void *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 48LL) + 8 * i) = xpc_array_get_string(a3, i);
    }
  }

  return 1LL;
}

BOOL ___muser_extract_grouplist_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = MEMORY[0x186DFD7CC](a3);
  uint64_t v7 = MEMORY[0x1896009A8];
  if (v6 == MEMORY[0x1896009A8])
  {
    *(_DWORD *)(*(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) + 4 * a2) = xpc_int64_get_value(a3);
  }

  else
  {
    free(*(void **)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL));
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0LL;
  }

  return v6 == v7;
}

int bindresvport_sa(int a1, sockaddr *a2)
{
  uint64_t v19 = *MEMORY[0x1895FEE08];
  if (a2)
  {
    uint64_t v3 = a2;
    int sa_family = a2->sa_family;
  }

  else
  {
    socklen_t v15 = 128;
    if (getsockname(a1, &v18, &v15) == -1) {
      return -1;
    }
    int sa_family = v18.sa_family;
    uint64_t v3 = &v18;
    __memset_chk();
  }

  if (sa_family == 30)
  {
    socklen_t v6 = 28;
    socklen_t v15 = 28;
    int v16 = 2;
    int v7 = 14;
    int v5 = 41;
    goto LABEL_9;
  }

  if (sa_family != 2)
  {
    *__error() = 46;
    return -1;
  }

  int v5 = 0;
  socklen_t v6 = 16;
  socklen_t v15 = 16;
  int v16 = 2;
  int v7 = 19;
LABEL_9:
  int v8 = *(unsigned __int16 *)v3->sa_data;
  v3->int sa_family = sa_family;
  v3->sa_len = v6;
  if (v8) {
    return bind(a1, v3, v6);
  }
  socklen_t v14 = 4;
  int v9 = getsockopt(a1, v5, v7, v17, &v14);
  if ((v9 & 0x80000000) == 0)
  {
    int v9 = setsockopt(a1, v5, v7, &v16, 4u);
    if ((v9 & 0x80000000) == 0)
    {
      int v10 = bind(a1, v3, v15);
      int v12 = *__error();
      if (v10)
      {
        if ((setsockopt(a1, v5, v7, v17, 4u) & 0x80000000) == 0) {
          return v10;
        }
        uint64_t v13 = __error();
      }

      else
      {
        if (v3 == &v18 || (getsockname(a1, v3, &v15) & 0x80000000) == 0) {
          return 0;
        }
        uint64_t v13 = __error();
        int v10 = 0;
      }

      *uint64_t v13 = v12;
      return v10;
    }
  }

  return v9;
}

CLIENT *__cdecl clnt_create(char *a1, unsigned int a2, unsigned int a3, char *a4)
{
  uint64_t v13 = *MEMORY[0x1895FEE08];
  uint64_t result = (CLIENT *)gethostbyname(a1);
  if (!result)
  {
    rpc_createerr.cf_uint64_t stat = RPC_UNKNOWNHOST;
    return result;
  }

  if (LODWORD(result->cl_private) == 2)
  {
    *(void *)&v12.sin_len = 512LL;
    *(void *)v12.sin_zero = 0LL;
    __memmove_chk();
    uint64_t result = (CLIENT *)getprotobyname(a4);
    if (result)
    {
      int v11 = -1;
      int cl_private = (int)result->cl_private;
      if (cl_private == 6) {
        return clnttcp_create(&v12, a2, a3, &v11, 0, 0);
      }
      if (cl_private == 17)
      {
        v14.tv_sec = 5LL;
        *(void *)&v14.__darwin_suseconds_t tv_usec = 0LL;
        return clntudp_create(&v12, a2, a3, v14, &v11);
      }

      uint64_t result = 0LL;
      clnt_stat v10 = RPC_SYSTEMERROR;
    }

    else
    {
      clnt_stat v10 = RPC_UNKNOWNPROTO;
    }

    rpc_createerr.cf_uint64_t stat = v10;
    int v9 = 46;
  }

  else
  {
    uint64_t result = 0LL;
    rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
    int v9 = 47;
  }

  rpc_createerr.cf_error.ru.RE_errno = v9;
  return result;
}

char *__cdecl clnt_sperror(CLIENT *a1, char *a2)
{
  uint64_t v4 = (char *)buf;
  if (buf || (uint64_t v4 = (char *)malloc(0x100uLL), (buf = (uint64_t)v4) != 0))
  {
    ((void (*)(CLIENT *, int *))a1->cl_ops->cl_geterr)(a1, &v14);
    sprintf(v4, "%s: ", a2);
    size_t v5 = strlen(v4);
    uint64_t v6 = 0LL;
    int v7 = &v4[v5];
    int v8 = "RPC: (unknown error code)";
    while (rpc_errlist[v6] != v14)
    {
      v6 += 4LL;
      if (v6 == 72) {
        goto LABEL_8;
      }
    }

    int v8 = *(const char **)&rpc_errlist[v6 + 2];
LABEL_8:
    int v9 = strcpy(&v4[v5], v8);
    clnt_stat v10 = &v7[strlen(v9)];
    switch(v14)
    {
      case 0:
      case 1:
      case 2:
      case 5:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
        goto LABEL_21;
      case 3:
      case 4:
        strerror(__errnum);
        sprintf(v10, "; errno = %s");
        goto LABEL_20;
      case 6:
      case 9:
        sprintf(v10, "; low version = %u, high version = %u");
        goto LABEL_20;
      case 7:
        uint64_t v11 = 0LL;
        break;
      default:
        sprintf(v10, "; s1 = %u, s2 = %u");
        goto LABEL_20;
    }

    while (auth_errlist[v11] != __errnum)
    {
      v11 += 4LL;
      if (v11 == 32)
      {
        sockaddr_in v12 = 0LL;
        goto LABEL_17;
      }
    }

    sockaddr_in v12 = *(const char **)&auth_errlist[v11 + 2];
LABEL_17:
    strcpy(v10, "; why = ");
    v10 += strlen(v10);
    if (v12) {
      strcpy(v10, v12);
    }
    else {
      sprintf(v10, "(unknown authentication error - %d)");
    }
LABEL_20:
    v10 += strlen(v10);
LABEL_21:
    *(_WORD *)clnt_stat v10 = 10;
  }

  return v4;
}

char *__cdecl clnt_sperrno(clnt_stat a1)
{
  uint64_t v2 = 0LL;
  uint64_t result = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4LL;
    if (v2 == 72) {
      return result;
    }
  }

  return *(char **)&rpc_errlist[v2 + 2];
}

void clnt_perror(CLIENT *a1, char *a2)
{
  uint64_t v2 = (FILE *)*MEMORY[0x1895FEE10];
  uint64_t v3 = clnt_sperror(a1, a2);
  fputs(v3, v2);
}

void clnt_perrno(clnt_stat a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = "RPC: (unknown error code)";
  while (rpc_errlist[v2] != a1)
  {
    v2 += 4LL;
    if (v2 == 72) {
      goto LABEL_4;
    }
  }

  uint64_t v3 = *(const char **)&rpc_errlist[v2 + 2];
LABEL_4:
  fputs(v3, (FILE *)*MEMORY[0x1895FEE10]);
}

char *__cdecl clnt_spcreateerror(char *a1)
{
  uint64_t v2 = (char *)buf;
  if (buf || (uint64_t v2 = (char *)malloc(0x100uLL), (buf = (uint64_t)v2) != 0))
  {
    sprintf(v2, "%s: ", a1);
    uint64_t v3 = 0LL;
    uint64_t v4 = "RPC: (unknown error code)";
    while (rpc_errlist[v3] != rpc_createerr.cf_stat)
    {
      v3 += 4LL;
      if (v3 == 72) {
        goto LABEL_8;
      }
    }

    uint64_t v4 = *(const char **)&rpc_errlist[v3 + 2];
LABEL_8:
    strcat(v2, v4);
    if (rpc_createerr.cf_stat == RPC_SYSTEMERROR)
    {
      *(_DWORD *)&v2[strlen(v2)] = 2108704;
      if (rpc_createerr.cf_error.ru.RE_errno >= 1 && rpc_createerr.cf_error.ru.RE_errno < *MEMORY[0x1895FF3C8])
      {
        int v7 = strerror(rpc_createerr.cf_error.ru.RE_errno);
LABEL_21:
        strcat(v2, v7);
        goto LABEL_22;
      }

      size_t v9 = strlen(v2);
      sprintf(&v2[v9], "Error %d", rpc_createerr.cf_error.ru.RE_errno);
    }

    else if (rpc_createerr.cf_stat == RPC_PMAPFAILURE)
    {
      size_t v5 = strlen(v2);
      uint64_t v6 = 0LL;
      *(_DWORD *)&v2[v5] = 2108704;
      int v7 = "RPC: (unknown error code)";
      while (rpc_errlist[v6] != rpc_createerr.cf_error.re_status)
      {
        v6 += 4LL;
        if (v6 == 72) {
          goto LABEL_21;
        }
      }

      int v7 = *(char **)&rpc_errlist[v6 + 2];
      goto LABEL_21;
    }

void clnt_pcreateerror(char *a1)
{
  gid_t v1 = (FILE *)*MEMORY[0x1895FEE10];
  uint64_t v2 = clnt_spcreateerror(a1);
  fputs(v2, v1);
}

CLIENT *__cdecl clntraw_create(unsigned int a1, unsigned int a2)
{
  uint64_t v4 = clntraw_private;
  if (!clntraw_private)
  {
    size_t v5 = calloc(1uLL, 0x22C8uLL);
    uint64_t v4 = (uint64_t)v5;
    if (!v5) {
      return (CLIENT *)v4;
    }
    clntraw_private = (uint64_t)v5;
  }

  *(void *)&v8.rm_direction = 0x200000000LL;
  *(void *)(&v8.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a2, a1);
  xdrmem_create((XDR *)(v4 + 24), (char *)(v4 + 8872), 0x18u, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v4 + 24), &v8)) {
    perror("clnt_raw.c - Fatal header serialization error.");
  }
  *(_DWORD *)(v4 + 8896) = (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 32) + 32LL))(v4 + 24);
  uint64_t v6 = *(void (**)(uint64_t))(*(void *)(v4 + 32) + 56LL);
  if (v6) {
    v6(v4 + 24);
  }
  xdrmem_create((XDR *)(v4 + 24), (char *)(v4 + 72), 0x2260u, XDR_FREE);
  *(void *)(v4 + 8) = client_ops;
  *(void *)uint64_t v4 = authnone_create();
  return (CLIENT *)v4;
}

uint64_t clntraw_call( uint64_t a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, void), uint64_t a4, char *a5, char *a6)
{
  int v18 = a2;
  uint64_t v6 = clntraw_private;
  if (!clntraw_private) {
    return 16LL;
  }
  sockaddr_in v12 = (_DWORD *)(clntraw_private + 24);
  while (1)
  {
    *(_DWORD *)(v6 + 24) = 0;
    (*(void (**)(uint64_t, void))(*(void *)(v6 + 32) + 40LL))(v6 + 24, 0LL);
    ++*(_DWORD *)(v6 + 8872);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, void))(*(void *)(v6 + 32) + 24LL))( v6 + 24,  v6 + 8872,  *(unsigned int *)(v6 + 8896))
      || !(*(unsigned int (**)(uint64_t, int *))(*(void *)(v6 + 32) + 8LL))(v6 + 24, &v18)
      || !(*(unsigned int (**)(void))(*(void *)(*(void *)a1 + 56LL) + 8LL))()
      || !a3(v6 + 24, a4, 0LL))
    {
      return 1LL;
    }

    (*(void (**)(uint64_t))(*(void *)(v6 + 32) + 32LL))(v6 + 24);
    svc_getreq(1);
    *(_DWORD *)(v6 + 24) = 1;
    (*(void (**)(uint64_t, void))(*(void *)(v6 + 32) + 40LL))(v6 + 24, 0LL);
    v17.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v17.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = a6;
    v17.ru.RM_cmb.cb_verf.oa_base = a5;
    if (!xdr_replymsg((XDR *)(v6 + 24), &v17)) {
      return 2LL;
    }
    _seterr_reply(&v17, &v16);
    uint64_t re_status = v16.re_status;
    uint64_t v14 = *(void *)(*(void *)a1 + 56LL);
    if (v16.re_status == RPC_SUCCESS) {
      break;
    }
  }

  uint64_t re_status = 7LL;
  if ((*(unsigned int (**)(void))(v14 + 16))())
  {
    else {
      uint64_t re_status = 7LL;
    }
    if (v17.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
    {
      *sockaddr_in v12 = 2;
      xdr_opaque_auth((XDR *)(v6 + 24), (uint64_t)&v17.ru.RM_rmb.ru);
    }
  }

  return re_status;
}

uint64_t clntraw_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t v3 = clntraw_private;
  if (!clntraw_private) {
    return 16LL;
  }
  *(_DWORD *)(clntraw_private + 24) = 2;
  return a2(v3 + 24, a3, 0LL);
}

uint64_t clntraw_control()
{
  return 0LL;
}

void *clnttcp_create_timeout( sockaddr_in *a1, uint64_t a2, uint64_t a3, int *a4, unsigned int a5, unsigned int a6, uint64_t a7, _OWORD *a8)
{
  rpc_err v16 = calloc(1uLL, 0x18uLL);
  if (!v16)
  {
    rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
    int v22 = __error();
    rpc_msg v17 = 0LL;
LABEL_21:
    rpc_createerr.cf_error.ru.RE_errno = *v22;
    goto LABEL_22;
  }

  rpc_msg v17 = calloc(1uLL, 0x88uLL);
  if (!v17)
  {
    rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
    int v22 = __error();
    goto LABEL_21;
  }

  if (a1->sin_port) {
    goto LABEL_6;
  }
  v27.tv_sec = 6LL;
  *(void *)&v27.__darwin_suseconds_t tv_usec = a7;
  unsigned int v18 = pmap_getport_timeout(a1, a2, a3, v27);
  if (!v18)
  {
LABEL_22:
    free(v17);
    free(v16);
    return 0LL;
  }

  a1->sin_port = __rev16(v18);
LABEL_6:
  if (*a4 < 0)
  {
    int v24 = socket(2, 1, 6);
    *a4 = v24;
    bindresvport(v24, 0LL);
    if (*a4 < 0 || (connect_NOCANCEL() & 0x80000000) != 0)
    {
      rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
      rpc_createerr.cf_error.ru.RE_errno = *__error();
LABEL_30:
      close_NOCANCEL();
      goto LABEL_22;
    }

    int v19 = 1;
  }

  else
  {
    int v19 = 0;
  }

  v17[1] = v19;
  *rpc_msg v17 = *a4;
  *((void *)v17 + 1) = 60LL;
  _BYTE v17[4] = 0;
  v17[6] = 0;
  if (a8)
  {
    *(_OWORD *)(v17 + 2) = *a8;
    v17[6] = 1;
  }

  *(sockaddr_in *)(v17 + 7) = *a1;
  int v20 = open_NOCANCEL();
  if (v20 < 0 || read_NOCANCEL() != 4)
  {
    gettimeofday(&v26, 0LL);
    v25.rm_xid = getpid() ^ LODWORD(v26.tv_sec) ^ v26.tv_usec;
  }

  if (v20 >= 1) {
    close_NOCANCEL();
  }
  *(void *)&v25.rm_direction = 0x200000000LL;
  *(void *)(&v25.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a3, a2);
  xdrmem_create((XDR *)(v17 + 22), (char *)v17 + 56, 0x18u, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v17 + 22), &v25))
  {
    if (!v17[1]) {
      goto LABEL_22;
    }
    goto LABEL_30;
  }

  v17[20] = (*(uint64_t (**)(_DWORD *))(*((void *)v17 + 12) + 32LL))(v17 + 22);
  XDR v21 = *(void (**)(_DWORD *))(*((void *)v17 + 12) + 56LL);
  if (v21) {
    v21(v17 + 22);
  }
  xdrrec_create( (XDR *)(v17 + 22),  a5,  a6,  v17,  (int (__cdecl *)(void *, void *, int))readtcp,  (int (__cdecl *)(void *, void *, int))writetcp);
  v16[1] = tcp_ops;
  v16[2] = v17;
  void *v16 = authnone_create();
  return v16;
}

CLIENT *__cdecl clnttcp_create( sockaddr_in *a1, unsigned int a2, unsigned int a3, int *a4, unsigned int a5, unsigned int a6)
{
  return (CLIENT *)clnttcp_create_timeout(a1, *(uint64_t *)&a2, *(uint64_t *)&a3, a4, a5, a6, 0LL, 0LL);
}

uint64_t clnttcp_call( void *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, void), uint64_t a4, unsigned int (*a5)(uint64_t, uint64_t, void), uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v26 = a2;
  uint64_t v8 = a1[2];
  uint64_t v9 = v8 + 56;
  if (!*(_DWORD *)(v8 + 24))
  {
    *(void *)(v8 + 8) = a7;
    *(void *)(v8 + 16) = a8;
  }

  clnt_stat v10 = (_DWORD *)(v8 + 88);
  if (a5) {
    BOOL v11 = (a7 | a8) != 0;
  }
  else {
    BOOL v11 = 0;
  }
  sockaddr_in v12 = (unsigned int *)(v8 + 44);
  BOOL v21 = (a7 | a8) == 0;
  int v13 = 2;
  while (1)
  {
    *(_DWORD *)(v8 + 88) = 0;
    *(_DWORD *)(v8 + 44) = 0;
    unsigned int v14 = *(_DWORD *)(v8 + 56) - 1;
    *(_DWORD *)(v8 + 56) = v14;
    uint64_t v15 = v9;
    if (!(*(unsigned int (**)(uint64_t))(*(void *)(v8 + 96) + 24LL))(v8 + 88)
      || !(*(unsigned int (**)(uint64_t, int *))(*(void *)(v8 + 96) + 8LL))(v8 + 88, &v26)
      || !(*(unsigned int (**)(void))(*(void *)(*a1 + 56LL) + 8LL))()
      || !a3(v8 + 88, a4, 0LL))
    {
      if (!*v12) {
        *sockaddr_in v12 = 1;
      }
      xdrrec_endofrecord((XDR *)(v8 + 88), 1);
      return *v12;
    }

    if (!xdrrec_endofrecord((XDR *)(v8 + 88), v11))
    {
      uint64_t result = 3LL;
      goto LABEL_34;
    }

    if (!v11) {
      return 0LL;
    }
    if (v21) {
      break;
    }
    *clnt_stat v10 = 1;
    v25.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v25.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = 0LL;
    v25.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
    if (!xdrrec_skiprecord((XDR *)(v8 + 88))) {
      return *v12;
    }
    unsigned int v16 = bswap32(v14);
    while (1)
    {
      if (!xdr_replymsg((XDR *)(v8 + 88), &v25))
      {
        uint64_t result = *v12;
        if ((_DWORD)result) {
          return result;
        }
        goto LABEL_20;
      }

      if (v25.rm_xid == v16) {
        break;
      }
LABEL_20:
      v25.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
      v25.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = 0LL;
      v25.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
      if (!xdrrec_skiprecord((XDR *)(v8 + 88))) {
        return *v12;
      }
    }

    _seterr_reply(&v25, (rpc_err *)(v8 + 44));
    if (!*v12)
    {
      if ((*(unsigned int (**)(void))(*(void *)(*a1 + 56LL) + 16LL))())
      {
        if (!a5(v8 + 88, a6, 0LL) && !*v12) {
          *sockaddr_in v12 = 2;
        }
      }

      else
      {
        *(void *)sockaddr_in v12 = 0x600000007LL;
      }

      if (v25.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
      {
        *clnt_stat v10 = 2;
        xdr_opaque_auth((XDR *)(v8 + 88), (uint64_t)&v25.ru.RM_rmb.ru);
      }

      return *v12;
    }

    if (v13)
    {
      --v13;
      int v18 = (*(uint64_t (**)(void))(*(void *)(*a1 + 56LL) + 24LL))();
      uint64_t v9 = v15;
      if (v18) {
        continue;
      }
    }

    return *v12;
  }

  uint64_t result = 5LL;
LABEL_34:
  *sockaddr_in v12 = result;
  return result;
}

uint64_t clnttcp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(v2 + 44);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 52);
  *(void *)a2 = v3;
  return result;
}

uint64_t clnttcp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 88) = 2;
  return a2(v3 + 88, a3, 0LL);
}

void clnttcp_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  if (*(_DWORD *)(v2 + 4)) {
    close_NOCANCEL();
  }
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v2 + 96) + 56LL);
  if (v3) {
    v3(v2 + 88);
  }
  free((void *)v2);
  free(a1);
}

uint64_t clnttcp_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (a2 == 3)
  {
    __int128 v5 = *(_OWORD *)(v3 + 28);
LABEL_7:
    *a3 = v5;
    return 1LL;
  }

  if (a2 == 2)
  {
    __int128 v5 = *(_OWORD *)(v3 + 8);
    goto LABEL_7;
  }

  if (a2 != 1) {
    return 0LL;
  }
  *(_OWORD *)(v3 + 8) = *a3;
  uint64_t result = 1LL;
  *(_DWORD *)(v3 + 24) = 1;
  return result;
}

uint64_t readtcp(int *a1, uint64_t a2, int a3)
{
  if (!a3) {
    return 0LL;
  }
  memset(v8, 0, sizeof(v8));
  int v4 = *a1;
  if (__darwin_check_fd_set_overflow(*a1, v8, 0)) {
    *(_DWORD *)((char *)v8 + (((unint64_t)v4 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v4;
  }
  while (1)
  {
    int v5 = select_NOCANCEL();
    if (v5 != -1) {
      break;
    }
    if (*__error() != 4)
    {
      a1[11] = 4;
      a1[12] = *__error();
      return 0xFFFFFFFFLL;
    }
  }

  if (v5)
  {
    uint64_t result = read_NOCANCEL();
    if ((_DWORD)result == -1)
    {
      int v7 = *__error();
      a1[11] = 4;
      a1[12] = v7;
    }

    else
    {
      if ((_DWORD)result) {
        return result;
      }
      *(void *)(a1 + 11) = 0x3600000004LL;
    }
  }

  else
  {
    a1[11] = 5;
  }

  return 0xFFFFFFFFLL;
}

uint64_t writetcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if ((int)a3 >= 1)
  {
    int v6 = a3;
    while (1)
    {
      int v7 = write_NOCANCEL();
      if (v7 == -1) {
        break;
      }
      a2 += v7;
      BOOL v8 = __OFSUB__(v6, v7);
      v6 -= v7;
      if ((v6 < 0) ^ v8 | (v6 == 0)) {
        return v3;
      }
    }

    int v9 = *__error();
    *(_DWORD *)(a1 + 44) = 3;
    *(_DWORD *)(a1 + 48) = v9;
    return 0xFFFFFFFFLL;
  }

  return v3;
}

void *clntudp_bufcreate_timeout( sockaddr_in *a1, unsigned int a2, unsigned int a3, int *a4, int a5, int a6, _OWORD *a7, _OWORD *a8)
{
  unsigned int v16 = calloc(1uLL, 0x18uLL);
  if (!v16)
  {
    rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
    rpc_createerr.cf_error.ru.RE_errno = *__error();
    return v16;
  }

  uint64_t v17 = (a5 + 3) & 0xFFFFFFFC;
  uint64_t v18 = (a6 + 3) & 0xFFFFFFFC;
  unsigned int v31 = (a6 + 3) & 0xFFFFFFFC;
  int v19 = (int *)calloc(1uLL, v17 + v18 + 152);
  if (!v19)
  {
    rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
    rpc_createerr.cf_error.ru.RE_errno = *__error();
LABEL_26:
    free(v16);
    return 0LL;
  }

  int v20 = v19;
  *((void *)v19 + 17) = (char *)v19 + v18 + 148;
  if (!a1->sin_port)
  {
    unsigned int v21 = pmap_getport_timeout(a1);
    if (!v21)
    {
LABEL_25:
      free(v20);
      goto LABEL_26;
    }

    a1->sin_port = __rev16(v21);
  }

  v16[1] = udp_ops;
  v16[2] = v20;
  sockaddr_in v22 = *a1;
  *((void *)v20 + 4) = 1LL;
  *(sockaddr_in *)(v20 + 2) = v22;
  v20[6] = 16;
  v20[33] = v17;
  v20[36] = v18;
  v20[10] = 0;
  if (a7) {
    *((_OWORD *)v20 + 2) = *a7;
  }
  *((void *)v20 + 6) = -1LL;
  v20[14] = -1;
  if (a8) {
    *((_OWORD *)v20 + 3) = *a8;
  }
  int v23 = open_NOCANCEL();
  if (v23 < 0 || read_NOCANCEL() != 4)
  {
    gettimeofday(&v30, 0LL);
    v29.rm_xid = getpid() ^ LODWORD(v30.tv_sec) ^ v30.tv_usec;
  }

  if (v23 >= 1) {
    close_NOCANCEL();
  }
  *(void *)&v29.rm_direction = 0x200000000LL;
  *(void *)(&v29.ru.RM_rmb.rp_stat + 1) = __PAIR64__(a3, a2);
  xdrmem_create((XDR *)(v20 + 20), *((char **)v20 + 17), v17, XDR_ENCODE);
  if (!xdr_callhdr((XDR *)(v20 + 20), &v29)) {
    goto LABEL_25;
  }
  v20[32] = (*(uint64_t (**)(int *))(*((void *)v20 + 11) + 32LL))(v20 + 20);
  if (*a4 < 0)
  {
    int v26 = 1;
    int v24 = socket(2, 2, 17);
    *a4 = v24;
    if (v24 < 0)
    {
      rpc_createerr.cf_uint64_t stat = RPC_SYSTEMERROR;
      rpc_createerr.cf_error.ru.RE_errno = *__error();
    }

    else
    {
      bindresvport(v24, 0LL);
      ioctl(*a4, 0x8004667EuLL, &v26);
      v20[1] = 1;
      unsigned int v27 = 0;
      socklen_t v28 = 4;
      if (!getsockopt(*a4, 0xFFFF, 4098, &v27, &v28))
      {
        socklen_t v28 = 4;
      }

      close_NOCANCEL();
      *a4 = -1;
    }

    goto LABEL_25;
  }

  v20[1] = 0;
LABEL_18:
  int *v20 = *a4;
  void *v16 = authnone_create();
  return v16;
}

CLIENT *__cdecl clntudp_bufcreate( sockaddr_in *a1, unsigned int a2, unsigned int a3, timeval a4, int *a5, unsigned int a6, unsigned int a7)
{
  timeval v8 = a4;
  return (CLIENT *)clntudp_bufcreate_timeout(a1, a2, a3, a5, a6, a7, &v8, 0LL);
}

CLIENT *__cdecl clntudp_create(sockaddr_in *a1, unsigned int a2, unsigned int a3, timeval a4, int *a5)
{
  timeval v6 = a4;
  return (CLIENT *)clntudp_bufcreate_timeout(a1, a2, a3, a5, 8800, 8800, &v6, 0LL);
}

uint64_t clntudp_call( void *a1, int a2, unsigned int (*a3)(uint64_t, uint64_t, void), uint64_t a4, char *a5, char *a6, uint64_t a7, signed int a8)
{
  clnt_stat v10 = a1;
  uint64_t v61 = *MEMORY[0x1895FEE08];
  int v60 = a2;
  uint64_t v11 = a1[2];
  if (*(void *)(v11 + 48) != -1LL)
  {
    a8 = *(_DWORD *)(v11 + 56);
    a7 = *(void *)(v11 + 48);
  }

  uint64_t v38 = 0LL;
  signed int v33 = a8;
  if (a7) {
    BOOL v12 = 0;
  }
  else {
    BOOL v12 = a8 == 0;
  }
  char v13 = v12;
  char v36 = v13;
  signed int v37 = 0;
  int v34 = (rpc_err *)(v11 + 64);
  uint64_t v35 = a7;
  int v14 = 2;
LABEL_10:
  *(_DWORD *)(v11 + 80) = 0;
  (*(void (**)(uint64_t, void))(*(void *)(v11 + 88) + 40LL))(v11 + 80, *(unsigned int *)(v11 + 128));
  ++**(_WORD **)(v11 + 136);
  if (!(*(unsigned int (**)(uint64_t, int *))(*(void *)(v11 + 88) + 8LL))(v11 + 80, &v60)
    || !(*(unsigned int (**)(void))(*(void *)(*v10 + 56LL) + 8LL))()
    || !a3(v11 + 80, a4, 0LL))
  {
    uint64_t result = 1LL;
LABEL_48:
    v34->uint64_t re_status = result;
    return result;
  }

  int v32 = v14;
  uint64_t v15 = a3;
  uint64_t v16 = a4;
  uint64_t v17 = (*(int (**)(uint64_t))(*(void *)(v11 + 88) + 32LL))(v11 + 80);
  if (sendto_NOCANCEL() != v17)
  {
LABEL_46:
    int v29 = *__error();
    uint64_t result = 3LL;
    goto LABEL_44;
  }

  if ((v36 & 1) != 0)
  {
LABEL_47:
    uint64_t result = 5LL;
    goto LABEL_48;
  }

  while (1)
  {
    v42.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
    v42.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = a6;
    v42.ru.RM_cmb.cb_verf.oa_base = a5;
    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v49 = 0u;
    __int128 v50 = 0u;
    int v18 = *(_DWORD *)v11;
    if (__darwin_check_fd_set_overflow(*(_DWORD *)v11, &v43, 0)) {
      *(_DWORD *)((char *)&v43 + (((unint64_t)v18 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v18;
    }
LABEL_17:
    while (1)
    {
      __int128 v55 = v47;
      __int128 v56 = v48;
      __int128 v57 = v49;
      __int128 v58 = v50;
      __int128 v51 = v43;
      __int128 v52 = v44;
      __int128 v53 = v45;
      __int128 v54 = v46;
      int v19 = select_NOCANCEL();
      if (v19 != -1) {
        break;
      }
      if (*__error() != 4) {
        goto LABEL_43;
      }
    }

    if (v19) {
      break;
    }
    uint64_t v21 = *(void *)(v11 + 32);
    int v22 = *(_DWORD *)(v11 + 40);
    int v23 = v22 + v37;
    if (v22 + v37 <= 999999)
    {
      uint64_t v27 = v21 + v38;
      signed int v28 = v22 + v37;
    }

    else
    {
      uint64_t v24 = v38 + v21;
      int v25 = v37 + v22;
      if (v23 >= 1999999) {
        int v23 = 1999999;
      }
      unsigned int v26 = v25 + 999999 - v23;
      uint64_t v27 = v24 + v26 / 0xF4240 + 1;
      signed int v28 = v25 - 1000000 + v26 % 0xF4240 - v26;
    }

    if (v27 >= v35 && (v27 != v35 || v28 >= v33)) {
      goto LABEL_47;
    }
    signed int v37 = v28;
    uint64_t v38 = v27;
    if (sendto_NOCANCEL() != v17) {
      goto LABEL_46;
    }
  }

  do
  {
    int v59 = 16;
    unsigned int v20 = recvfrom_NOCANCEL();
    if ((v20 & 0x80000000) == 0)
    {
      if ((v20 & 0xFFFFFFFC) == 0 || *(_DWORD *)(v11 + 148) != **(_DWORD **)(v11 + 136)) {
        goto LABEL_17;
      }
      xdrmem_create(&v41, (char *)(v11 + 148), v20, XDR_DECODE);
      if (!xdr_replymsg(&v41, &v42))
      {
        v34->uint64_t re_status = RPC_CANTDECODERES;
        return v34->re_status;
      }

      _seterr_reply(&v42, v34);
      if (v34->re_status == RPC_SUCCESS)
      {
        if (v42.ru.RM_rmb.ru.RP_ar.ar_verf.oa_base)
        {
          *(_DWORD *)(v11 + 80) = 2;
          xdr_opaque_auth((XDR *)(v11 + 80), (uint64_t)&v42.ru.RM_rmb.ru);
        }

        return v34->re_status;
      }

      a4 = v16;
      a3 = v15;
      clnt_stat v10 = a1;
      if (!v32) {
        return v34->re_status;
      }
      int v14 = v32 - 1;
      goto LABEL_10;
    }
  }

  while (*__error() == 4);
  if (*__error() == 35) {
    goto LABEL_17;
  }
LABEL_43:
  int v29 = *__error();
  uint64_t result = 4LL;
LABEL_44:
  *(_DWORD *)(v11 + 64) = result;
  *(_DWORD *)(v11 + 68) = v29;
  return result;
}

uint64_t clntudp_geterr(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void *)(v2 + 64);
  *(_DWORD *)(a2 + 8) = *(_DWORD *)(v2 + 72);
  *(void *)a2 = v3;
  return result;
}

uint64_t clntudp_freeres(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 16);
  *(_DWORD *)(v3 + 80) = 2;
  return a2(v3 + 80, a3, 0LL);
}

void clntudp_destroy(void *a1)
{
  uint64_t v2 = a1[2];
  if (*(_DWORD *)(v2 + 4)) {
    close_NOCANCEL();
  }
  uint64_t v3 = *(void (**)(uint64_t))(*(void *)(v2 + 88) + 56LL);
  if (v3) {
    v3(v2 + 80);
  }
  free((void *)v2);
  free(a1);
}

uint64_t clntudp_control(uint64_t a1, int a2, _OWORD *a3)
{
  uint64_t v3 = *(_OWORD **)(a1 + 16);
  switch(a2)
  {
    case 1:
      v3[3] = *a3;
      goto LABEL_9;
    case 2:
      __int128 v5 = v3[3];
      goto LABEL_8;
    case 3:
      __int128 v5 = *(_OWORD *)((char *)v3 + 8);
      goto LABEL_8;
    case 4:
      void v3[2] = *a3;
      goto LABEL_9;
    case 5:
      __int128 v5 = v3[2];
LABEL_8:
      *a3 = v5;
LABEL_9:
      uint64_t result = 1LL;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

uint64_t si_destination_create_control_socket()
{
  uint64_t v18 = *MEMORY[0x1895FEE08];
  uint64_t v0 = socket(32, 2, 2);
  if ((_DWORD)v0 == -1)
  {
    uint64_t v2 = (os_log_s *)si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_create_control_socket_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
    return 0xFFFFFFFFLL;
  }

  uint64_t v1 = v0;
  int v15 = 1;
  if (setsockopt(v0, 0xFFFF, 4130, &v15, 4u))
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_create_control_socket_cold_7();
    }
LABEL_5:
    close_NOCANCEL();
    return 0xFFFFFFFFLL;
  }

  int v17 = 0;
  memset(v16, 0, sizeof(v16));
  __strlcpy_chk();
  if (ioctl(v1, 0xC0644E03uLL, v16) == -1)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_create_control_socket_cold_2();
    }
    goto LABEL_5;
  }

  v11[1] = 139296;
  in_addr v11[2] = v16[0];
  char v11[3] = 0;
  uint64_t v12 = 0LL;
  uint64_t v13 = 0LL;
  int v14 = 0;
  if (connect_NOCANCEL())
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_create_control_socket_cold_6();
    }
    goto LABEL_5;
  }

  v11[0] = 0x20000;
  if (setsockopt(v1, 0xFFFF, 4098, v11, 4u) && os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
    si_destination_create_control_socket_cold_5();
  }
  if (fcntl_NOCANCEL() == -1)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_create_control_socket_cold_3();
    }
  }

  else if (fcntl_NOCANCEL() == -1 && os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR))
  {
    si_destination_create_control_socket_cold_4();
  }

  return v1;
}

void set_loopback_ifindex()
{
  if ((getifaddrs(&v2) & 0x80000000) == 0)
  {
    if (v2)
    {
      uint64_t v0 = v2;
      while (1)
      {
        ifa_addr = v0->ifa_addr;
        if (ifa_addr)
        {
          if (ifa_addr->sa_family == 18 && (v0->ifa_flags & 8) != 0) {
            break;
          }
        }

        uint64_t v0 = v0->ifa_next;
        if (!v0) {
          goto LABEL_10;
        }
      }

      kLoopbackIndex = *(unsigned __int16 *)ifa_addr->sa_data;
    }

uint64_t si_destination_compare(unsigned __int8 *a1, int a2, unsigned __int8 *a3, int a4, int a5)
{
  uint64_t v144 = *MEMORY[0x1895FEE08];
  if (!a1)
  {
    v69 = (os_log_s *)si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT)) {
      si_destination_compare_cold_1(v69, v70, v71, v72, v73, v74, v75, v76);
    }
    return 0LL;
  }

  unint64_t v6 = 0x18C52C000uLL;
  if (!a3)
  {
    size_t v77 = (os_log_s *)si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT)) {
      si_destination_compare_cold_2(v77, v78, v79, v80, v81, v82, v83, v84);
    }
    return 0LL;
  }

  pthread_once(&si_destination_compare_init_cache_init, (void (*)(void))si_destination_compare_init_once);
  int v11 = a1[1];
  BOOL v12 = v11 == 2 || v11 == 30;
  if (v12)
  {
    int v21 = a3[1];
    if (v21 != 2 && v21 != 30)
    {
      uint64_t v24 = 1LL;
      if (v11 == 2 || v11 == 30) {
        goto LABEL_210;
      }
      goto LABEL_25;
    }

    int v13 = si_destination_lookup(a1, a2, v116);
    int v14 = si_destination_lookup(a3, a4, &v101);
    if (v13)
    {
      int v15 = v14;
      if (v14)
      {
        if (!a5)
        {
          int v25 = 0;
          goto LABEL_41;
        }

        pthread_once(&si_destination_compare_statistics_once, set_loopback_ifindex);
        unsigned int v16 = v132;
        unsigned int v17 = v112;
        if (v132)
        {
          if (v112)
          {
            if (v132 < v112)
            {
              if (si_compare_settings_0) {
                int v18 = 3200;
              }
              else {
                int v18 = 0;
              }
              unsigned int v98 = v18;
              if (v18 + v132 < v112)
              {
                int v19 = (os_log_s *)si_destination_log;
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218752;
                  double v137 = (double)v16 * 0.03125;
                  if (si_compare_settings_1) {
                    int v20 = 10;
                  }
                  else {
                    int v20 = 0;
                  }
                  __int16 v138 = 2048;
                  double v139 = (double)v17 * 0.03125;
                  __int16 v140 = 1024;
                  unsigned int v141 = v98 >> 5;
                  __int16 v142 = 1024;
                  int v143 = v20;
                  _os_log_debug_impl( &dword_1804BA000,  v19,  OS_LOG_TYPE_DEBUG,  "prefering 1, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u",  buf,  0x22u);
                }

                goto LABEL_209;
              }

              if (si_compare_settings_1) {
                int v46 = 320;
              }
              else {
                int v46 = 0;
              }
              unsigned int v94 = v46;
              unsigned int v47 = v46 + v132;
              loga = (os_log_s *)si_destination_log;
              BOOL v48 = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG);
              if (v47 < v17)
              {
                if (v48)
                {
                  *(_DWORD *)buf = 134218752;
                  double v137 = (double)v16 * 0.03125;
                  __int16 v138 = 2048;
                  double v139 = (double)v17 * 0.03125;
                  __int16 v140 = 1024;
                  unsigned int v141 = v98 >> 5;
                  __int16 v142 = 1024;
                  int v143 = v94 >> 5;
                  _os_log_debug_impl( &dword_1804BA000,  loga,  OS_LOG_TYPE_DEBUG,  "prefering 1 slightly, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u",  buf,  0x22u);
                }

                int v25 = 2;
                goto LABEL_133;
              }

              if (!v48)
              {
LABEL_132:
                int v25 = 0;
LABEL_133:
                unint64_t v6 = 0x18C52C000uLL;
                goto LABEL_134;
              }

              *(_DWORD *)buf = 134218752;
              double v137 = (double)v16 * 0.03125;
              __int16 v138 = 2048;
              double v139 = (double)v17 * 0.03125;
              __int16 v140 = 1024;
              unsigned int v141 = v98 >> 5;
              __int16 v142 = 1024;
              int v143 = v94 >> 5;
              uint64_t v63 = "not prefering 1, dst1 min rtt %f < dst2 min rtt %f, leeway %u small leeway %u";
LABEL_219:
              _os_log_debug_impl(&dword_1804BA000, loga, OS_LOG_TYPE_DEBUG, v63, buf, 0x22u);
              goto LABEL_132;
            }

            if (v132 > v112)
            {
              if (si_compare_settings_0) {
                int v43 = 3200;
              }
              else {
                int v43 = 0;
              }
              unsigned int v100 = v43;
              if (v132 > v43 + v112)
              {
                __int128 v44 = (os_log_s *)si_destination_log;
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 134218752;
                  double v137 = (double)v16 * 0.03125;
                  if (si_compare_settings_1) {
                    int v45 = 10;
                  }
                  else {
                    int v45 = 0;
                  }
                  __int16 v138 = 2048;
                  double v139 = (double)v17 * 0.03125;
                  __int16 v140 = 1024;
                  unsigned int v141 = v100 >> 5;
                  __int16 v142 = 1024;
                  int v143 = v45;
                  _os_log_debug_impl( &dword_1804BA000,  v44,  OS_LOG_TYPE_DEBUG,  "prefering 2, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u",  buf,  0x22u);
                }

                goto LABEL_138;
              }

              if (si_compare_settings_1) {
                int v60 = 320;
              }
              else {
                int v60 = 0;
              }
              unsigned int v95 = v60;
              unsigned int v61 = v60 + v112;
              loga = (os_log_s *)si_destination_log;
              BOOL v62 = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG);
              if (v16 > v61)
              {
                if (v62)
                {
                  *(_DWORD *)buf = 134218752;
                  double v137 = (double)v16 * 0.03125;
                  __int16 v138 = 2048;
                  double v139 = (double)v17 * 0.03125;
                  __int16 v140 = 1024;
                  unsigned int v141 = v100 >> 5;
                  __int16 v142 = 1024;
                  int v143 = v95 >> 5;
                  _os_log_debug_impl( &dword_1804BA000,  loga,  OS_LOG_TYPE_DEBUG,  "prefering 2 slightly, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u",  buf,  0x22u);
                }

                int v25 = -2;
                goto LABEL_133;
              }

              if (!v62) {
                goto LABEL_132;
              }
              *(_DWORD *)buf = 134218752;
              double v137 = (double)v16 * 0.03125;
              __int16 v138 = 2048;
              double v139 = (double)v17 * 0.03125;
              __int16 v140 = 1024;
              unsigned int v141 = v100 >> 5;
              __int16 v142 = 1024;
              int v143 = v95 >> 5;
              uint64_t v63 = "not prefering 2, dst1 min rtt %f > dst2 min rtt %f, leeway %u small leeway %u";
              goto LABEL_219;
            }

            __int128 v49 = (os_log_s *)si_destination_log;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_34(v16, v49);
            }
            int v25 = 0;
            unint64_t v6 = 0x18C52C000uLL;
          }

          else if (v114)
          {
            int v25 = 0;
          }

          else
          {
            int v25 = 0;
            uint64_t v51 = v113;
            unint64_t v52 = 10LL;
            if (!si_compare_settings_2) {
              unint64_t v52 = 0LL;
            }
            if (v113 && v52 < v113)
            {
              __int128 v53 = (os_log_s *)si_destination_log;
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_35(v51, v53, v54, v55, v56, v57, v58, v59);
              }
              goto LABEL_209;
            }
          }
        }

        else
        {
          int v25 = 0;
          if (v112 && !v134)
          {
            int v25 = 0;
            uint64_t v33 = v133;
            unint64_t v34 = 10LL;
            if (!si_compare_settings_2) {
              unint64_t v34 = 0LL;
            }
            if (v133 && v34 < v133)
            {
              uint64_t v35 = (os_log_s *)si_destination_log;
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_5(v33, v35, v36, v37, v38, v39, v40, v41);
              }
              goto LABEL_138;
            }
          }
        }

LABEL_134:
        if ((v135 & 1) != 0)
        {
          if ((v115 & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_27();
            }
            goto LABEL_209;
          }

          int v64 = (v135 >> 2) & 1;
          int v65 = (v115 >> 2) & 1;
          if (v64 != v65)
          {
            if (v65)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_33();
              }
              goto LABEL_209;
            }

            if (v64)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_32();
              }
              goto LABEL_138;
            }
          }

          if (v131 == kLoopbackIndex)
          {
            BOOL v66 = 1;
          }

          else
          {
            BOOL v66 = 0;
          }

          if (v111 == kLoopbackIndex)
          {
            BOOL v68 = 1;
          }

          else
          {
            BOOL v68 = 0;
            if (BYTE1(v101) == 30 && BYTE8(v101) == 254) {
              BOOL v68 = (BYTE9(v101) & 0xC0) == 0x80 && v102 == kLoopbackIndex;
            }
            if (v66 && !v68)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_31();
              }
              goto LABEL_209;
            }
          }

          if (v68 && !v66)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_30();
            }
            goto LABEL_138;
          }

          if ((v135 & 2) != 0)
          {
            if ((v115 & 2) == 0)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_29();
              }
              goto LABEL_209;
            }
          }

          else if ((v115 & 2) != 0)
          {
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_28();
            }
            goto LABEL_138;
          }
        }

        else if ((v115 & 1) != 0)
        {
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
            si_destination_compare_cold_26();
          }
LABEL_138:
          uint64_t v24 = 0xFFFFFFFFLL;
          goto LABEL_210;
        }

LABEL_41:
        int v26 = HIBYTE(v125);
        int v27 = v106;
        if (HIBYTE(v125))
        {
          if (!v106)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_25();
            }
            goto LABEL_209;
          }
        }

        else if (v106)
        {
          unint64_t v6 = 0x18C52C000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
            si_destination_compare_cold_24();
          }
          goto LABEL_138;
        }

        int v93 = v15;
        int v99 = a2;
        int log = a4;
        unsigned int v28 = v25;
        unsigned int v29 = rfc6724_scope_sa((uint64_t)v116);
        int v30 = rfc6724_scope_sa((uint64_t)&v125);
        unsigned int v31 = rfc6724_scope_sa((uint64_t)&v101);
        int v32 = rfc6724_scope_sa((uint64_t)&v105);
        if (v29 == v30)
        {
          a2 = v99;
          if (v31 != v32)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_22();
            }
            uint64_t v24 = 1LL;
LABEL_65:
            a4 = log;
            goto LABEL_210;
          }
        }

        else
        {
          a2 = v99;
          if (v31 == v32)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_23();
            }
            uint64_t v24 = 0xFFFFFFFFLL;
            goto LABEL_65;
          }
        }

        unsigned int v42 = v28;
        a4 = log;
        if ((v129 & 4) != (v109 & 4))
        {
          if ((v129 & 4) != 0)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_21();
            }
            goto LABEL_209;
          }

          if ((v109 & 4) != 0)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_20();
            }
            goto LABEL_138;
          }
        }

        if ((v129 & 8) != (v109 & 8))
        {
          if ((v129 & 8) != 0)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_19();
            }
            goto LABEL_209;
          }

          if ((v109 & 8) != 0)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_18();
            }
            goto LABEL_138;
          }
        }

        if ((unsigned __int16)v124 == v130)
        {
          if (v103 != v110)
          {
            unint64_t v6 = 0x18C52C000uLL;
            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_16();
            }
            goto LABEL_209;
          }
        }

        else if (v103 == v110)
        {
          unint64_t v6 = 0x18C52C000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
            si_destination_compare_cold_17();
          }
          goto LABEL_138;
        }

        if (HIWORD(v124) > v104)
        {
          unint64_t v6 = 0x18C52C000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
            si_destination_compare_cold_6();
          }
          goto LABEL_209;
        }

        if (v104 > HIWORD(v124))
        {
          unint64_t v6 = 0x18C52C000uLL;
          if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
            si_destination_compare_cold_7();
          }
          goto LABEL_138;
        }

        if (v26 == 30)
        {
          if (HIWORD(v126) == 544)
          {
            BOOL v67 = 0;
LABEL_188:
            if (v27 != 30)
            {
              BOOL v85 = 1;
              unint64_t v6 = 0x18C52C000LL;
              goto LABEL_199;
            }

            if (v107 == 544)
            {
              BOOL v85 = 0;
              unint64_t v6 = 0x18C52C000uLL;
            }

            else
            {
              unint64_t v6 = 0x18C52C000uLL;
              if (v107 != 288)
              {
                BOOL v85 = 1;
                goto LABEL_199;
              }

              BOOL v85 = v108 != 0;
            }

            if (v67 && !v85)
            {
              if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_15();
              }
              goto LABEL_209;
            }

LABEL_199:
            if (v85 && !v67)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 2832), OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_14();
              }
              goto LABEL_138;
            }

            if (v29 < v31)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 2832), OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_8();
              }
              goto LABEL_209;
            }

            if (v31 < v29)
            {
              if (os_log_type_enabled(*(os_log_t *)(v6 + 2832), OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_9();
              }
              goto LABEL_138;
            }

            if (v42 - 1 < 2)
            {
LABEL_209:
              uint64_t v24 = 1LL;
              goto LABEL_210;
            }

            if (v42 > 0xFFFFFFFD) {
              goto LABEL_221;
            }
            int v91 = common_prefix_length((uint64_t)v116, (uint64_t)&v125);
            int v92 = common_prefix_length((uint64_t)&v101, (uint64_t)&v105);
            if (v91 && v92)
            {
              if (v91 > v92)
              {
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                  si_destination_compare_cold_10();
                }
                goto LABEL_234;
              }

              if (v92 > v91)
              {
                if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
                  si_destination_compare_cold_11();
                }
LABEL_221:
                uint64_t v24 = 0xFFFFFFFFLL;
LABEL_235:
                a4 = log;
                a2 = v99;
                goto LABEL_210;
              }
            }

            if (v13 != 1 || v93 != 2)
            {
              if (v93 != 1)
              {
                uint64_t v24 = 0LL;
                goto LABEL_235;
              }

              BOOL v12 = v13 == 2;
              uint64_t v24 = 0LL;
              a4 = log;
              a2 = v99;
              if (!v12) {
                goto LABEL_210;
              }
              if (os_log_type_enabled(*(os_log_t *)(v6 + 2832), OS_LOG_TYPE_DEBUG)) {
                si_destination_compare_cold_13();
              }
              goto LABEL_221;
            }

            if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
              si_destination_compare_cold_12();
            }
LABEL_234:
            uint64_t v24 = 1LL;
            goto LABEL_235;
          }

          if (HIWORD(v126) == 288)
          {
            BOOL v67 = v127 != 0;
            goto LABEL_188;
          }
        }

        BOOL v67 = 1;
        goto LABEL_188;
      }

      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
        si_destination_compare_cold_4();
      }
    }

    else if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG))
    {
      si_destination_compare_cold_3();
    }

    uint64_t v24 = 0LL;
    goto LABEL_210;
  }

  int v21 = a3[1];
LABEL_25:
  int v23 = v21 == 2 || v21 == 30;
  uint64_t v24 = (v23 << 31 >> 31);
LABEL_210:
  int v86 = *(os_log_s **)(v6 + 2832);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    int v88 = *a1;
    int v89 = *a3;
    else {
      int v90 = 60;
    }
    if (!(_DWORD)v24) {
      int v90 = 61;
    }
    *(_DWORD *)v116 = 68159234;
    int v117 = v88;
    __int16 v118 = 2096;
    BOOL v119 = a1;
    __int16 v120 = 1024;
    int v121 = a2;
    *(_WORD *)v122 = 1024;
    *(_DWORD *)&v122[2] = v90;
    __int16 v123 = 1040;
    int v124 = v89;
    __int16 v125 = 2096;
    __int128 v126 = a3;
    __int16 v127 = 1024;
    int v128 = a4;
    _os_log_debug_impl( &dword_1804BA000,  v86,  OS_LOG_TYPE_DEBUG,  "%{network:sockaddr}.*P@%u %c %{network:sockaddr}.*P@%u",  v116,  0x34u);
  }

  return v24;
}

uint64_t si_destination_compare_no_dependencies(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      unsigned int v4 = rfc6724_precedence(a1);
      unsigned int v5 = rfc6724_precedence(a2);
      if (v4 > v5)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
          si_destination_compare_no_dependencies_cold_3();
        }
        return 1LL;
      }

      if (v5 > v4)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
          si_destination_compare_no_dependencies_cold_4();
        }
        return 0xFFFFFFFFLL;
      }

      unsigned int v7 = rfc6724_scope_sa(a1);
      unsigned int v8 = rfc6724_scope_sa(a2);
      if (v7 < v8)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
          si_destination_compare_no_dependencies_cold_5();
        }
        return 1LL;
      }

      if (v8 < v7)
      {
        if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
          si_destination_compare_no_dependencies_cold_6();
        }
        return 0xFFFFFFFFLL;
      }

      return 0LL;
    }

    unsigned int v17 = (os_log_s *)si_destination_log;
    uint64_t result = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      si_destination_compare_no_dependencies_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);
      return 0LL;
    }
  }

  else
  {
    uint64_t v9 = (os_log_s *)si_destination_log;
    uint64_t result = os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_FAULT);
    if ((_DWORD)result)
    {
      si_destination_compare_no_dependencies_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
      return 0LL;
    }
  }

  return result;
}

uint64_t rfc6724_precedence(uint64_t result)
{
  if (result)
  {
    int v1 = *(unsigned __int8 *)(result + 1);
    if (v1 != 2)
    {
      if (v1 != 30) {
        return 0LL;
      }
      unsigned int v2 = *(_DWORD *)(result + 8);
      if (v2)
      {
        if ((v2 & 0xFE) == 0xFC) {
          return 3LL;
        }
        if ((v2 & 0xC0FF) == 0xC0FE) {
          return 1LL;
        }
LABEL_15:
        else {
          return 40LL;
        }
      }

      if (*(_DWORD *)(result + 12)) {
        goto LABEL_14;
      }
      if (!*(_DWORD *)(result + 16) && *(_DWORD *)(result + 20) == 0x1000000) {
        return 50LL;
      }
      if (*(_DWORD *)(result + 16) != -65536)
      {
LABEL_14:
        if (!*(_DWORD *)(result + 12)
          && !*(_DWORD *)(result + 16)
          && (*(_DWORD *)(result + 20) | 0x1000000) != 0x1000000)
        {
          return 1LL;
        }

        goto LABEL_15;
      }
    }

    return 35LL;
  }

  return result;
}

uint64_t rfc6724_scope_sa(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 == 2)
  {
    unsigned int v8 = bswap32(*(_DWORD *)(a1 + 4));
    BOOL v7 = HIWORD(v8) == 43518 || HIBYTE(v8) == 127;
    unsigned int v6 = 14;
    goto LABEL_13;
  }

  if (v2 != 30) {
    return 0LL;
  }
  int v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 == 255)
  {
    uint64_t v10 = (*(_BYTE *)(a1 + 9) & 0xF) - 1LL;
    else {
      return dword_1804DCD48[v10];
    }
  }

  else
  {
    if (v3 == 254)
    {
      unsigned int v4 = *(unsigned __int8 *)(a1 + 9);
      int v5 = v4 & 0xC0;
      if (v4 <= 0xBF) {
        unsigned int v6 = 14;
      }
      else {
        unsigned int v6 = 5;
      }
      BOOL v7 = v5 == 128;
LABEL_13:
      if (v7) {
        return 2LL;
      }
      else {
        return v6;
      }
    }

    uint64_t v11 = *(void *)(a1 + 15);
    uint64_t result = 14LL;
    if (!(*(void *)(a1 + 8) | v11))
    {
      if (*(_BYTE *)(a1 + 23) == 1) {
        return 2LL;
      }
      else {
        return 14LL;
      }
    }
  }

  return result;
}

uint64_t si_destination_compare_init_once()
{
  cache_timespec timeout = 1000000000 * (unint64_t)info.denom / info.numer;
  si_destination_int log = (uint64_t)os_log_create("com.apple.network.libinfo", "si_destination_compare");
  si_compare_settings_0 = 1;
  si_compare_settings_1 = 1;
  si_compare_settings_2 = 1;
  return pthread_atfork(0LL, 0LL, si_destination_compare_child_has_forked);
}

void si_destination_compare_child_has_forked()
{
  cache_lock = 0;
  si_destination_int log = MEMORY[0x189600830];
}

uint64_t si_destination_lookup(unsigned __int8 *a1, int a2, _OWORD *a3)
{
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = cache;
  if (!cache)
  {
LABEL_29:
    unsigned int v23 = *a1;
    if (v23 < 0x1D)
    {
      int v25 = (char *)calloc(1uLL, 0x70uLL);
      if (v25)
      {
        uint64_t v26 = (uint64_t)v25;
        int v27 = (unsigned __int8 *)(v25 + 16);
        __memcpy_chk();
        *(_DWORD *)(v26 + 88) = a2;
        si_destination_fill_netsrc(v27);
        __int128 v28 = *(_OWORD *)(v26 + 32);
        *a3 = *(_OWORD *)(v26 + 16);
        a3[1] = v28;
        __int128 v29 = *(_OWORD *)(v26 + 48);
        __int128 v30 = *(_OWORD *)(v26 + 64);
        __int128 v31 = *(_OWORD *)(v26 + 96);
        a3[4] = *(_OWORD *)(v26 + 80);
        a3[5] = v31;
        a3[2] = v29;
        a3[3] = v30;
        uint64_t v32 = mach_absolute_time();
        uint64_t v33 = cache;
        *(void *)uint64_t v26 = v32;
        *(void *)(v26 + 8) = v33;
        cache = v26;
        uint64_t v22 = 2LL;
        goto LABEL_37;
      }

      unint64_t v34 = (os_log_s *)si_destination_log;
      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
        si_destination_lookup_cold_2(v34);
      }
    }

    else
    {
      uint64_t v24 = (os_log_s *)si_destination_log;
      if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
        si_destination_lookup_cold_1(v23, v24);
      }
    }

    uint64_t v22 = 0LL;
    goto LABEL_37;
  }

  uint64_t v8 = v6;
  char v9 = 0;
  unint64_t v10 = cache_timeout;
  uint64_t v11 = &cache;
  do
  {
    if (v8 - *(void *)v7 >= v10)
    {
      uint64_t *v11 = *(void *)(v7 + 8);
      *(_OWORD *)(v7 + 80) = 0u;
      *(_OWORD *)(v7 + 96) = 0u;
      *(_OWORD *)(v7 + 48) = 0u;
      *(_OWORD *)(v7 + 64) = 0u;
      *(_OWORD *)(v7 + 16) = 0u;
      *(_OWORD *)(v7 + 32) = 0u;
      *(_OWORD *)uint64_t v7 = 0u;
      free((void *)v7);
      unint64_t v10 = cache_timeout;
      goto LABEL_24;
    }

    if ((v9 & 1) != 0) {
      goto LABEL_5;
    }
    if (*(_DWORD *)(v7 + 88) != a2) {
      goto LABEL_22;
    }
    int v12 = a1[1];
    uint64_t v13 = (unsigned __int8 *)(v7 + 16);
    if (v12 == 30)
    {
      if (*((void *)a1 + 1) != *(void *)(v7 + 24) || *((void *)a1 + 2) != *(void *)(v7 + 32))
      {
LABEL_22:
        char v9 = 0;
        goto LABEL_23;
      }

      int v14 = *((_DWORD *)a1 + 6);
      int v15 = *(_DWORD *)(v7 + 40);
    }

    else
    {
      if (v12 != 2)
      {
        size_t v17 = *a1;
        goto LABEL_26;
      }

      int v14 = *((_DWORD *)a1 + 1);
      int v15 = *(_DWORD *)(v7 + 20);
    }

    if (v14 != v15) {
      goto LABEL_22;
    }
LABEL_26:
    __int128 v18 = *(_OWORD *)(v7 + 32);
    *a3 = *(_OWORD *)v13;
    a3[1] = v18;
    __int128 v19 = *(_OWORD *)(v7 + 48);
    __int128 v20 = *(_OWORD *)(v7 + 64);
    __int128 v21 = *(_OWORD *)(v7 + 96);
    a3[4] = *(_OWORD *)(v7 + 80);
    a3[5] = v21;
    a3[2] = v19;
    a3[3] = v20;
    uint64_t v7 = *v11;
LABEL_5:
    char v9 = 1;
LABEL_23:
    uint64_t v11 = (uint64_t *)(v7 + 8);
LABEL_24:
    uint64_t v7 = *v11;
  }

  while (*v11);
  if ((v9 & 1) == 0) {
    goto LABEL_29;
  }
  uint64_t v22 = 1LL;
LABEL_37:
  os_unfair_lock_unlock((os_unfair_lock_t)&cache_lock);
  return v22;
}

void si_destination_fill_netsrc(unsigned __int8 *a1)
{
  if (si_destination_fill_netsrc_netsrc_sockfd < 0)
  {
    si_destination_fill_netsrc_netsrc_sockfd = si_destination_create_control_socket();
    if (si_destination_fill_netsrc_netsrc_sockfd < 0) {
      return;
    }
  }

  uint64_t v33 = 0LL;
  uint64_t v32 = 0LL;
  int v35 = 0;
  uint64_t v34 = 0LL;
  if (si_destination_fill_netsrc_version) {
    int v2 = 1;
  }
  else {
    int v2 = 2;
  }
  int v3 = *((_DWORD *)a1 + 18);
  int v30 = v2;
  int v31 = v3;
  if (*a1 >= 0x1DuLL)
  {
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
      si_destination_fill_netsrc_cold_1();
    }
    return;
  }

  __memcpy_chk();
  if (send_NOCANCEL() == 36)
  {
    if (si_destination_fill_netsrc_version == 1)
    {
      if (recv_NOCANCEL() == 40)
      {
        *((_DWORD *)a1 + 8) = *(_DWORD *)&v25[6];
        if (__src[0] <= 0x1CuLL) {
          memcpy(a1 + 36, __src, __src[0]);
        }
        int v4 = *(_DWORD *)&v25[2];
        *((_DWORD *)a1 + 16) = *(unsigned __int16 *)v25;
        *((_DWORD *)a1 + 17) = v4;
        return;
      }

      uint64_t v16 = (os_log_s *)si_destination_log;
      if (!os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
        return;
      }
LABEL_25:
      si_destination_fill_netsrc_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      return;
    }

    if (recv_NOCANCEL() == 56)
    {
      int v13 = v27;
      *((_DWORD *)a1 + 8) = v28;
      *(_OWORD *)(a1 + 36) = *(_OWORD *)__src;
      *((_OWORD *)a1 + 3) = *(_OWORD *)&__src[12];
      *((_DWORD *)a1 + 19) = v29;
      int v15 = *(_DWORD *)&v25[8];
      unsigned __int8 v14 = v26;
      *((_DWORD *)a1 + 16) = v26;
      *((_DWORD *)a1 + 17) = v13;
      *((void *)a1 + 10) = *(void *)v25;
      *((_DWORD *)a1 + 22) = v15;
      a1[92] = a1[92] & 0xF8 | (v14 >> 5);
      return;
    }

    uint64_t v16 = (os_log_s *)si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_25;
    }
  }

  else
  {
    if (*__error() == 22 && (si_destination_fill_netsrc_version & 1) == 0)
    {
      si_destination_fill_netsrc_version = 1;
      si_destination_fill_netsrc(a1);
    }

    int v5 = (os_log_s *)si_destination_log;
    if (os_log_type_enabled((os_log_t)si_destination_log, OS_LOG_TYPE_ERROR)) {
      si_destination_fill_netsrc_cold_4(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }

uint64_t common_prefix_length(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 1) != 30 || *(_BYTE *)(a2 + 1) != 30) {
    return 0LL;
  }
  uint64_t result = 0LL;
  int v4 = (unsigned __int8 *)(a1 + 8);
  int v5 = (unsigned __int8 *)(a2 + 8);
  unint64_t v6 = a1 + 16;
  while (1)
  {
    int v7 = *v4 ^ *v5;
    if (v7) {
      break;
    }
    ++v4;
    ++v5;
    uint64_t result = (result + 8);
  }

  while ((v7 & 0x80) == 0)
  {
    uint64_t result = (result + 1);
    LOBYTE(v7) = 2 * v7;
  }

  return result;
}

void OUTLINED_FUNCTION_0_1( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_6( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

void OUTLINED_FUNCTION_8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_12( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_13( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void OUTLINED_FUNCTION_14( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

int getrpcport(char *a1, int a2, int a3, int a4)
{
  uint64_t v10 = *MEMORY[0x1895FEE08];
  int v7 = gethostbyname(a1);
  if (v7)
  {
    *(void *)&v9.sin_len = 512LL;
    *(void *)v9.sin_zero = 0LL;
    __memmove_chk();
    LODWORD(v7) = pmap_getport(&v9, a2, a3, a4);
  }

  return (int)v7;
}

int pmap_set(unsigned int a1, unsigned int a2, int a3, int a4)
{
  unsigned __int16 v4 = a4;
  uint64_t v18 = *MEMORY[0x1895FEE08];
  int v16 = -1;
  *(void *)&v17.sin_len = 0x100007F00000200LL;
  *(void *)v17.sin_zero = 0LL;
  uint64_t v8 = clntudp_bufcreate_timeout(&v17, 0x186A0u, 2u, &v16, 400, 400, &set_retry_timeout, &set_total_timeout);
  if (!v8) {
    return (int)v8;
  }
  sockaddr_in v9 = v8;
  unsigned int v12 = a1;
  unsigned int v13 = a2;
  int v14 = a3;
  int v15 = v4;
  if ((*(unsigned int (**)(void))v8[1])())
  {
LABEL_2:
    LODWORD(v8) = 0;
  }

  else
  {
    (*(void (**)(void *))(v9[1] + 32LL))(v9);
    close_NOCANCEL();
    LODWORD(v8) = v11;
  }

  return (int)v8;
}

int pmap_unset(unsigned int a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  int v12 = -1;
  if (pmap_wakeup())
  {
    LODWORD(v4) = 0;
  }

  else
  {
    *(void *)&v13.sin_len = 0x100007F00000200LL;
    *(void *)v13.sin_zero = 0LL;
    unsigned __int16 v4 = clntudp_bufcreate_timeout(&v13, 0x186A0u, 2u, &v12, 400, 400, &unset_retry_timeout, &unset_total_timeout);
    if (v4)
    {
      int v5 = v4;
      unsigned int v8 = a1;
      unsigned int v9 = a2;
      int v10 = 0;
      int v11 = 0;
      (*(void (**)(void))v4[1])();
      (*(void (**)(void *))(v5[1] + 32LL))(v5);
      close_NOCANCEL();
      LODWORD(v4) = v7;
    }
  }

  return (int)v4;
}

pmaplist *__cdecl pmap_getmaps(sockaddr_in *a1)
{
  unint64_t v6 = 0LL;
  int v5 = -1;
  a1->sin_port = 28416;
  int v2 = clnttcp_create(a1, 0x186A0u, 2u, &v5, 0x32u, 0x1F4u);
  if (v2)
  {
    int v3 = v2;
    ((void (*)(CLIENT *))v3->cl_ops->cl_destroy)(v3);
  }

  close_NOCANCEL();
  a1->sin_port = 0;
  return v6;
}

uint64_t pmap_getport_timeout(sockaddr_in *a1, uint64_t a2, uint64_t a3, timeval a4)
{
  if (*(void *)&a4.tv_usec) {
    a4 = *(timeval *)*(void *)&a4.tv_usec;
  }
  else {
    a4.tv_sec = 5LL;
  }
  unsigned __int16 v9 = 0;
  int v8 = -1;
  a1->sin_port = 28416;
  int v5 = clntudp_bufcreate(a1, 0x186A0u, 2u, a4, &v8, 0x190u, 0x190u);
  if (v5)
  {
    unint64_t v6 = v5;
    if (((uint64_t (*)(void))v5->cl_ops->cl_call)())
    {
      rpc_createerr.cf_uint64_t stat = RPC_PMAPFAILURE;
      ((void (*)(CLIENT *, rpc_err *))v6->cl_ops->cl_geterr)(v6, &rpc_createerr.cf_error);
    }

    else if (!v9)
    {
      rpc_createerr.cf_uint64_t stat = RPC_PROGNOTREGISTERED;
    }

    ((void (*)(CLIENT *))v6->cl_ops->cl_destroy)(v6);
  }

  close_NOCANCEL();
  a1->sin_port = 0;
  return v9;
}

unsigned __int16 pmap_getport(sockaddr_in *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v4 = 0LL;
  return pmap_getport_timeout(a1, *(uint64_t *)&a2, *(uint64_t *)&a3, *(timeval *)&a4);
}

int xdr_pmap(XDR *a1, pmap *a2)
{
  if (xdr_u_long(a1, &a2->pm_prog) && xdr_u_long(a1, &a2->pm_vers) && xdr_u_long(a1, &a2->pm_prot)) {
    return xdr_u_long(a1, &a2->pm_port);
  }
  else {
    return 0;
  }
}

int xdr_pmaplist(XDR *a1, pmaplist **a2)
{
  int v2 = (char **)a2;
  xdr_op x_op = a1->x_op;
  if (!a2) {
    goto LABEL_3;
  }
LABEL_2:
  for (BOOL i = *v2 == 0LL; ; BOOL i = 1)
  {
    int v8 = !i;
    int result = xdr_BOOL(a1, &v8);
    if (!result) {
      break;
    }
    if (!v8) {
      return 1;
    }
    if (x_op == XDR_FREE)
    {
      int v7 = *v2;
      int result = xdr_reference(a1, v2, 0x18u, (xdrproc_t)xdr_pmap);
      if (!result) {
        return result;
      }
    }

    else
    {
      int result = xdr_reference(a1, v2, 0x18u, (xdrproc_t)xdr_pmap);
      if (!result) {
        return result;
      }
      int v7 = *v2;
    }

    int v2 = (char **)(v7 + 16);
LABEL_3:
    ;
  }

  return result;
}

clnt_stat pmap_rmtcall( sockaddr_in *a1, unsigned int a2, unsigned int a3, unsigned int a4, xdrproc_t a5, caddr_t a6, xdrproc_t a7, caddr_t a8, timeval a9, unsigned int *a10)
{
  int v15 = -1;
  a1->sin_port = 28416;
  v16.tv_sec = 3LL;
  *(void *)&v16.__darwin_suseconds_t tv_usec = 0LL;
  int v11 = clntudp_create(a1, 0x186A0u, 2u, v16, &v15);
  if (v11)
  {
    int v12 = v11;
    clnt_stat v13 = ((uint64_t (*)(void))v11->cl_ops->cl_call)();
    ((void (*)(CLIENT *))v12->cl_ops->cl_destroy)(v12);
  }

  else
  {
    clnt_stat v13 = RPC_FAILED;
  }

  close_NOCANCEL();
  a1->sin_port = 0;
  return v13;
}

int xdr_rmtcall_args(XDR *a1, rmtcallargs *a2)
{
  int result = xdr_u_long(a1, &a2->prog);
  if (result)
  {
    int result = xdr_u_long(a1, &a2->vers);
    if (result)
    {
      int result = xdr_u_long(a1, &a2->proc);
      if (result)
      {
        uint64_t v5 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
        p_arglen = &a2->arglen;
        int result = xdr_u_long(a1, &a2->arglen);
        if (result)
        {
          int v7 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
          int result = ((uint64_t (*)(XDR *, caddr_t, void))a2->xdr_args)(a1, a2->args_ptr, 0LL);
          if (result)
          {
            uint64_t v8 = ((uint64_t (*)(XDR *))a1->x_ops->x_getpostn)(a1);
            unsigned int *p_arglen = v8 - v7;
            ((void (*)(XDR *, uint64_t))a1->x_ops->x_setpostn)(a1, v5);
            int result = xdr_u_long(a1, p_arglen);
            if (result)
            {
              ((void (*)(XDR *, uint64_t))a1->x_ops->x_setpostn)(a1, v8);
              return 1;
            }
          }
        }
      }
    }
  }

  return result;
}

int xdr_rmtcallres(XDR *a1, rmtcallres *a2)
{
  port_ptr = (char *)a2->port_ptr;
  int result = xdr_reference(a1, &port_ptr, 4u, (xdrproc_t)xdr_u_long);
  if (result)
  {
    int result = xdr_u_long(a1, &a2->resultslen);
    if (result)
    {
      a2->port_ptr = (unsigned int *)port_ptr;
      return ((uint64_t (*)(XDR *, caddr_t, void))a2->xdr_results)(a1, a2->results_ptr, 0LL);
    }
  }

  return result;
}

clnt_stat clnt_broadcast( unsigned int a1, unsigned int a2, unsigned int a3, xdrproc_t a4, char *a5, xdrproc_t a6, char *a7, int (*a8)(void))
{
  unsigned int v8 = MEMORY[0x1895FE128](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5, a6, a7, a8);
  __int128 v53 = v9;
  uint64_t v11 = v10;
  uint64_t v56 = v12;
  uint64_t v14 = v13;
  timeval v16 = v15;
  unsigned int v18 = v17;
  unsigned int v20 = v19;
  unsigned int v21 = v8;
  uint64_t v82 = *MEMORY[0x1895FEE08];
  uint64_t v55 = authunix_create_default();
  v72[0] = 1;
  int v22 = socket(2, 2, 17);
  unsigned int v23 = v22;
  if (v22 < 0)
  {
    uint64_t v33 = "Cannot create socket for broadcast rpc";
LABEL_63:
    perror(v33);
    clnt_stat v48 = RPC_CANTSEND;
    goto LABEL_64;
  }

  if (setsockopt(v22, 0xFFFF, 32, v72, 4u) < 0)
  {
    uint64_t v33 = "Cannot set socket option SO_BROADCAST";
    goto LABEL_63;
  }

  uint64_t v54 = v11;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v64 = 0u;
  __int128 v65 = 0u;
  if (__darwin_check_fd_set_overflow(v23, &v64, 0)) {
    *((_DWORD *)&v64 + (v23 >> 5)) |= 1 << v23;
  }
  LODWORD(v63[0]) = 8800;
  *(void *)((char *)v63 + 4) = v74;
  uint64_t v51 = v16;
  unint64_t v52 = v14;
  if (ioctl(v23, 0xC00C6924uLL, v63) < 0)
  {
    perror("broadcast: ioctl (get interface configuration)");
    goto LABEL_24;
  }

  if (SLODWORD(v63[0]) < 1)
  {
LABEL_24:
    int v24 = 0;
    goto LABEL_25;
  }

  int v24 = 0;
  int v25 = &v74[SLODWORD(v63[0])];
  int v26 = v74;
  do
  {
    if (v26[17] == 2)
    {
      __int128 v27 = *((_OWORD *)v26 + 1);
      __int128 v75 = *(_OWORD *)v26;
      __int128 v76 = v27;
      if (ioctl(v23, 0xC0206911uLL, &v75) < 0)
      {
        perror("broadcast: ioctl (get interface flags)");
      }

      else if ((~(unsigned __int16)v76 & 3) == 0)
      {
        if (ioctl(v23, 0xC0206923uLL, &v75) < 0)
        {
          v28.in_addr_t s_addr = *((_DWORD *)v26 + 5);
          in_addr_t v29 = inet_netof(v28);
          v81[v24] = inet_makeaddr(v29, 0).s_addr;
        }

        else
        {
          v81[v24] = DWORD1(v76);
        }

        ++v24;
      }
    }

    unsigned int v32 = v26[16];
    int v31 = v26 + 16;
    LODWORD(v30) = v32;
    if (v32 <= 0x10) {
      uint64_t v30 = 16LL;
    }
    else {
      uint64_t v30 = v30;
    }
    int v26 = &v31[v30];
  }

  while (v26 < v25);
LABEL_25:
  uint64_t v79 = 1862271488LL;
  uint64_t v80 = 0LL;
  int v34 = open_NOCANCEL();
  if (v34 < 0 || read_NOCANCEL() != 4)
  {
    gettimeofday(&v57, 0LL);
    unsigned int v62 = getpid() ^ LODWORD(v57.tv_sec) ^ v57.tv_usec;
  }

  if (v34 >= 1) {
    close_NOCANCEL();
  }
  v57.__darwin_suseconds_t tv_usec = 0;
  v58.rm_xid = v62;
  *(_OWORD *)&v58.rm_direction = xmmword_1804DCD60;
  v58.ru.RM_cmb.cb_proc = 5;
  uint64_t v35 = *(void *)&v55->ah_cred.oa_length;
  *(_OWORD *)(&v58.ru.RM_rmb.ru.RP_dr.ru.RJ_why + 1) = *(_OWORD *)&v55->ah_cred.oa_flavor;
  *((void *)&v58.ru.RM_rmb.ru.RP_dr + 3) = v35;
  uint64_t v36 = *(void *)&v55->ah_verf.oa_length;
  *((_OWORD *)&v58.ru.RM_rmb.ru.RP_dr + 2) = *(_OWORD *)&v55->ah_verf.oa_flavor;
  v60.prog = v21;
  v60.vers = v20;
  v60.proc = v18;
  v60.args_ptr = v52;
  v60.xdr_args = v51;
  *((void *)&v58.ru.RM_rmb + 7) = v36;
  v59[0] = &v61;
  v59[2] = v54;
  v59[3] = v56;
  xdrmem_create(&v73, (char *)&v75, 0x578u, XDR_ENCODE);
  if (xdr_callmsg(&v73, &v58) && xdr_rmtcall_args(&v73, &v60))
  {
    int v37 = ((uint64_t (*)(XDR *))v73.x_ops->x_getpostn)(&v73);
    x_destroy = v73.x_ops->x_destroy;
    if (x_destroy) {
      ((void (*)(XDR *))x_destroy)(&v73);
    }
    v57.__darwin_time_t tv_sec = 4LL;
    uint64_t v39 = v37;
    while (2)
    {
      if (v24 >= 1)
      {
        uint64_t v40 = v81;
        uint64_t v41 = v24;
        while (1)
        {
          int v42 = *v40++;
          HIDWORD(v79) = v42;
          if (sendto_NOCANCEL() != v39) {
            break;
          }
          if (!--v41) {
            goto LABEL_39;
          }
        }

        uint64_t v33 = "Cannot send broadcast packet";
        goto LABEL_63;
      }

LABEL_39:
      if (v53)
      {
        while (1)
        {
          while (1)
          {
            v58.ru.RM_rmb.ru.RP_ar.ar_verf = _null_auth;
            v58.ru.RM_rmb.ru.RP_ar.ru.AR_results.where = (caddr_t)v59;
            v58.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_rmtcallres;
            int v63[4] = v68;
            v63[5] = v69;
            v63[6] = v70;
            v63[7] = v71;
            v63[0] = v64;
            v63[1] = v65;
            v63[2] = v66;
            v63[3] = v67;
            int v43 = select_NOCANCEL();
            if (v43 != -1) {
              break;
            }
            if (*__error() != 4)
            {
              __int128 v49 = "Broadcast select problem";
LABEL_60:
              perror(v49);
              clnt_stat v48 = RPC_CANTRECV;
              goto LABEL_64;
            }
          }

          if (!v43) {
            break;
          }
          while (1)
          {
            v72[1] = 16;
            unsigned int v44 = recvfrom_NOCANCEL();
            if ((v44 & 0x80000000) == 0) {
              break;
            }
            if (*__error() != 4)
            {
              __int128 v49 = "Cannot receive reply to broadcast";
              goto LABEL_60;
            }
          }

          if ((v44 & 0xFFFFFFFC) != 0)
          {
            xdrmem_create(&v73, v74, v44, XDR_DECODE);
            int v45 = 0;
            if (xdr_replymsg(&v73, &v58)
              && v58.rm_xid == v62
              && !v58.ru.RM_cmb.cb_rpcvers
              && !v58.ru.RM_cmb.cb_cred.oa_length)
            {
              __int16 v78 = bswap32(v61) >> 16;
              int v45 = v53(v54, v77);
            }

            v73.xdr_op x_op = XDR_FREE;
            v58.ru.RM_cmb.cb_verf.oa_base = (caddr_t)xdr_void;
            xdr_replymsg(&v73, &v58);
            v56(&v73, v54, 0LL);
            int v46 = v73.x_ops->x_destroy;
            if (v46) {
              ((void (*)(XDR *))v46)(&v73);
            }
            if (v45) {
              goto LABEL_61;
            }
          }
        }

        __darwin_time_t tv_sec = v57.tv_sec;
        v57.tv_sec += 2LL;
        clnt_stat v48 = RPC_TIMEDOUT;
        if (tv_sec < 13) {
          continue;
        }
      }

      else
      {
LABEL_61:
        clnt_stat v48 = RPC_SUCCESS;
      }

      break;
    }
  }

  else
  {
    clnt_stat v48 = RPC_CANTENCODEARGS;
  }

uint64_t pmap_wakeup()
{
  if (socket(1, 1, 0) == -1) {
    return 0xFFFFFFFFLL;
  }
  if (connect_NOCANCEL() == -1)
  {
    uint64_t v0 = 0xFFFFFFFFLL;
  }

  else
  {
    read_NOCANCEL();
    uint64_t v0 = 0LL;
  }

  close_NOCANCEL();
  return v0;
}

int xdr_callmsg(XDR *a1, rpc_msg *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_ENCODE)
  {
    unsigned int oa_length = a2->ru.RM_cmb.cb_cred.oa_length;
    if (oa_length > 0x190) {
      return 0;
    }
    unsigned int v14 = a2->ru.RM_cmb.cb_verf.oa_length;
    if (v14 > 0x190) {
      return 0;
    }
    int v15 = (_DWORD *)((uint64_t (*)(XDR *, void))a1->x_ops->x_inline)( a1,  ((oa_length + 3) & 0xFFFFFFFC) + ((v14 + 3) & 0xFFFFFFFC) + 40);
    if (v15)
    {
      msg_type rm_direction = a2->rm_direction;
      *int v15 = bswap32(a2->rm_xid);
      v15[1] = bswap32(rm_direction);
      if (rm_direction) {
        return 0;
      }
      v15[2] = bswap32(a2->ru.RM_cmb.cb_rpcvers);
      if (a2->ru.RM_cmb.cb_rpcvers != 2) {
        return 0;
      }
      v15[3] = bswap32(a2->ru.RM_cmb.cb_prog);
      v15[4] = bswap32(a2->ru.RM_cmb.cb_vers);
      v15[5] = bswap32(a2->ru.RM_cmb.cb_proc);
      v15[6] = bswap32(a2->ru.RM_rmb.ru.RP_dr.ru.RJ_versions.high);
      unsigned int v17 = v15 + 8;
      v15[7] = bswap32(a2->ru.RM_cmb.cb_cred.oa_length);
      size_t v18 = a2->ru.RM_cmb.cb_cred.oa_length;
      if ((_DWORD)v18)
      {
        memmove(v15 + 8, a2->ru.RM_cmb.cb_cred.oa_base, v18);
        unsigned int v17 = (_DWORD *)((char *)v17 + ((a2->ru.RM_cmb.cb_cred.oa_length + 3) & 0xFFFFFFFC));
      }

      *unsigned int v17 = bswap32(a2->ru.RM_rmb.ru.RP_ar.ru.AR_versions.low);
      v17[1] = bswap32(a2->ru.RM_cmb.cb_verf.oa_length);
      size_t v19 = a2->ru.RM_cmb.cb_verf.oa_length;
      if ((_DWORD)v19)
      {
        caddr_t v20 = (caddr_t)(v17 + 2);
        caddr_t oa_base = a2->ru.RM_cmb.cb_verf.oa_base;
LABEL_46:
        memmove(v20, oa_base, v19);
      }

      return 1;
    }

    xdr_op x_op = a1->x_op;
  }

  if (x_op == XDR_DECODE
    && (uint64_t v5 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))a1->x_ops->x_inline)(a1, 32LL)) != 0LL)
  {
    a2->rm_xid = bswap32(*v5);
    unsigned int v6 = v5[1];
    a2->msg_type rm_direction = bswap32(v6);
    if (v6) {
      return 0;
    }
    unsigned int v7 = v5[2];
    a2->ru.RM_cmb.cb_rpcvers = bswap32(v7);
    if (v7 != 0x2000000) {
      return 0;
    }
    a2->ru.RM_cmb.cb_prog = bswap32(v5[3]);
    a2->ru.RM_cmb.cb_vers = bswap32(v5[4]);
    a2->ru.RM_cmb.cb_proc = bswap32(v5[5]);
    a2->ru.RM_cmb.cb_cred.oa_flavor = bswap32(v5[6]);
    unsigned int v8 = v5[7];
    size_t v9 = bswap32(v8);
    a2->ru.RM_cmb.cb_cred.unsigned int oa_length = v9;
    if (v8)
    {
      if (!a2->ru.RM_cmb.cb_cred.oa_base)
      {
        a2->ru.RM_cmb.cb_cred.caddr_t oa_base = (caddr_t)calloc(1uLL, v9);
        LODWORD(v9) = a2->ru.RM_cmb.cb_cred.oa_length;
      }

      uint64_t v10 = (const void *)((uint64_t (*)(XDR *, void))a1->x_ops->x_inline)( a1,  ((_DWORD)v9 + 3) & 0xFFFFFFFC);
      size_t v11 = a2->ru.RM_cmb.cb_cred.oa_length;
      if (v10)
      {
        memmove(a2->ru.RM_cmb.cb_cred.oa_base, v10, v11);
      }

      else
      {
        int result = xdr_opaque(a1, a2->ru.RM_cmb.cb_cred.oa_base, v11);
        if (!result) {
          return result;
        }
      }
    }

    int v22 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))a1->x_ops->x_inline)(a1, 8LL);
    if (v22)
    {
      a2->ru.RM_cmb.cb_verf.oa_flavor = bswap32(*v22);
      unsigned int v23 = bswap32(v22[1]);
      a2->ru.RM_cmb.cb_verf.unsigned int oa_length = v23;
      if (!v23) {
        return 1;
      }
      goto LABEL_35;
    }

    int result = xdr_enum(a1, &a2->ru.RM_cmb.cb_verf.oa_flavor);
    if (result)
    {
      int result = xdr_u_int(a1, &a2->ru.RM_cmb.cb_verf.oa_length);
      if (result)
      {
        unsigned int v23 = a2->ru.RM_cmb.cb_verf.oa_length;
        if (!v23) {
          return 1;
        }
LABEL_35:
        if (v23 > 0x190) {
          return 0;
        }
        if (!a2->ru.RM_cmb.cb_verf.oa_base)
        {
          a2->ru.RM_cmb.cb_verf.caddr_t oa_base = (caddr_t)calloc(1uLL, v23);
          unsigned int v23 = a2->ru.RM_cmb.cb_verf.oa_length;
        }

        uint64_t v24 = ((uint64_t (*)(XDR *, void))a1->x_ops->x_inline)(a1, (v23 + 3) & 0xFFFFFFFC);
        size_t v19 = a2->ru.RM_cmb.cb_verf.oa_length;
        if (v24)
        {
          int v25 = (char *)v24;
          caddr_t v20 = a2->ru.RM_cmb.cb_verf.oa_base;
          caddr_t oa_base = v25;
          goto LABEL_46;
        }

        int result = xdr_opaque(a1, a2->ru.RM_cmb.cb_verf.oa_base, v19);
        if (!result) {
          return result;
        }
        return 1;
      }
    }
  }

  else
  {
    int result = xdr_u_long(a1, &a2->rm_xid);
    if (result)
    {
      int result = xdr_enum(a1, (int *)&a2->rm_direction);
      if (result)
      {
        if (a2->rm_direction) {
          return 0;
        }
        int result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_rpcvers);
        if (!result) {
          return result;
        }
        if (a2->ru.RM_cmb.cb_rpcvers != 2) {
          return 0;
        }
        int result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_prog);
        if (result)
        {
          int result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_vers);
          if (result)
          {
            int result = xdr_u_long(a1, &a2->ru.RM_cmb.cb_proc);
            if (result)
            {
              int result = xdr_opaque_auth(a1, (uint64_t)&a2->ru.RM_rmb.ru.RP_ar.ar_verf.oa_base);
              if (result) {
                return xdr_opaque_auth(a1, (uint64_t)&a2->ru.RM_rmb.ru.RP_ar.ru.AR_results);
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t xdr_opaque_auth(XDR *a1, uint64_t a2)
{
  uint64_t result = xdr_enum(a1, (int *)a2);
  if ((_DWORD)result) {
    return xdr_bytes(a1, (char **)(a2 + 8), (unsigned int *)(a2 + 16), 0x190u);
  }
  return result;
}

int xdr_des_block(XDR *a1, des_block *a2)
{
  return xdr_opaque(a1, (char *)a2, 8u);
}

uint64_t xdr_accepted_reply(XDR *a1, uint64_t a2)
{
  uint64_t result = xdr_opaque_auth(a1, a2);
  if ((_DWORD)result)
  {
    uint64_t result = xdr_enum(a1, (int *)(a2 + 24));
    if ((_DWORD)result)
    {
      int v5 = *(_DWORD *)(a2 + 24);
      if (v5 == 2)
      {
        uint64_t result = xdr_u_long(a1, (unsigned int *)(a2 + 32));
        if ((_DWORD)result) {
          return xdr_u_long(a1, (unsigned int *)(a2 + 36));
        }
      }

      else if (v5)
      {
        return 1LL;
      }

      else
      {
        return (*(uint64_t (**)(XDR *, void, void))(a2 + 40))(a1, *(void *)(a2 + 32), 0LL);
      }
    }
  }

  return result;
}

uint64_t xdr_rejected_reply(XDR *a1, uint64_t a2)
{
  if (*(_DWORD *)a2 != 1)
  {
    return 0LL;
  }

  return xdr_enum(a1, (int *)(a2 + 4));
}

int xdr_replymsg(XDR *a1, rpc_msg *a2)
{
  else {
    return 0;
  }
}

int xdr_callhdr(XDR *a1, rpc_msg *a2)
{
  *(void *)&a2->msg_type rm_direction = 0x200000000LL;
  p_msg_type rm_direction = &a2->rm_direction;
  if (a1->x_op == XDR_ENCODE
    && xdr_u_long(a1, &a2->rm_xid)
    && xdr_enum(a1, (int *)p_rm_direction)
    && xdr_u_long(a1, (unsigned int *)p_rm_direction + 1)
    && xdr_u_long(a1, &a2->ru.RM_cmb.cb_prog))
  {
    return xdr_u_long(a1, &a2->ru.RM_cmb.cb_vers);
  }

  else
  {
    return 0;
  }

void _seterr_reply(rpc_msg *a1, rpc_err *a2)
{
  unsigned int cb_rpcvers = a1->ru.RM_cmb.cb_rpcvers;
  if (cb_rpcvers == 1)
  {
    unsigned int cb_vers = a1->ru.RM_cmb.cb_vers;
    if (cb_vers)
    {
      if (cb_vers == 1)
      {
        a2->uint64_t re_status = RPC_AUTHERROR;
        unsigned int cb_proc = a1->ru.RM_cmb.cb_proc;
LABEL_9:
        a2->ru.RE_errno = cb_proc;
        return;
      }

      *(void *)&a2->uint64_t re_status = 0x100000010LL;
    }

    else
    {
      a2->uint64_t re_status = RPC_VERSMISMATCH;
      a2->ru.RE_errno = a1->ru.RM_cmb.cb_proc;
      unsigned int cb_vers = a1->ru.RM_rmb.ru.RP_dr.ru.RJ_versions.high;
    }

void xprt_register(SVCXPRT *a1)
{
  unint64_t xp_sock = a1->xp_sock;
  int v3 = (void *)xports;
  if (!xports)
  {
    int v3 = calloc(1uLL, 0x2000uLL);
    xports = (uint64_t)v3;
  }

  if ((int)xp_sock <= 1023)
  {
    v3[xp_sock] = a1;
    if (__darwin_check_fd_set_overflow(xp_sock, &svc_fdset, 0)) {
      *(__int32_t *)((char *)svc_fdset.fds_bits + ((xp_sock >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << xp_sock;
    }
    int v4 = svc_maxfd;
    svc_maxfd = v4;
  }

void xprt_unregister(SVCXPRT *a1)
{
  uint64_t xp_sock = a1->xp_sock;
  if ((int)xp_sock <= 1023 && *(SVCXPRT **)(xports + 8LL * (int)xp_sock) == a1)
  {
    *(void *)(xports + 8LL * (int)xp_sock) = 0LL;
    if (__darwin_check_fd_set_overflow(xp_sock, &svc_fdset, 0)) {
      *(__int32_t *)((char *)svc_fdset.fds_bits + (((unint64_t)(int)xp_sock >> 3) & 0x1FFFFFFFFFFFFFFCLL)) &= ~(1 << xp_sock);
    }
    if ((_DWORD)xp_sock == svc_maxfd)
    {
      int v2 = (xp_sock & ((int)xp_sock >> 31)) - 1;
      uint64_t v3 = xp_sock - 1;
      while (1)
      {
        BOOL v4 = __OFSUB__((_DWORD)xp_sock, 1);
        LODWORD(xp_sock) = xp_sock - 1;
      }

      LODWORD(xp_sock) = v2;
LABEL_11:
      svc_maxfd = xp_sock;
    }
  }

int svc_register(SVCXPRT *a1, unsigned int a2, unsigned int a3, void (*a4)(void), int a5)
{
  uint64_t v10 = svc_head;
  if (svc_head)
  {
    while (*(_DWORD *)(v10 + 8) != a2 || *(_DWORD *)(v10 + 12) != a3)
    {
      uint64_t v10 = *(void *)v10;
      if (!v10) {
        goto LABEL_5;
      }
    }

    if (*(void (**)(void))(v10 + 16) != a4)
    {
      LODWORD(v11) = 0;
      return (int)v11;
    }
  }

  else
  {
LABEL_5:
    size_t v11 = calloc(1uLL, 0x18uLL);
    if (!v11) {
      return (int)v11;
    }
    in_addr v11[2] = a2;
    char v11[3] = a3;
    *((void *)v11 + 2) = a4;
    *(void *)size_t v11 = svc_head;
    svc_head = (uint64_t)v11;
  }

  if (a5) {
    LODWORD(v11) = pmap_set(a2, a3, a5, a1->xp_port);
  }
  else {
    LODWORD(v11) = 1;
  }
  return (int)v11;
}

void svc_unregister(unsigned int a1, unsigned int a2)
{
  int v2 = (uint64_t *)svc_head;
  if (svc_head)
  {
    int v5 = 0LL;
    while (1)
    {
      clnt_stat v6 = v2;
      if (*((_DWORD *)v2 + 2) == a1 && *((_DWORD *)v2 + 3) == a2) {
        break;
      }
      int v2 = (uint64_t *)*v2;
      int v5 = v6;
      if (!*v6) {
        return;
      }
    }

    if (!v5) {
      int v5 = &svc_head;
    }
    uint64_t *v5 = *v2;
    free(v2);
    pmap_unset(a1, a2);
  }

int svc_sendreply(SVCXPRT *a1, xdrproc_t a2, char *a3)
{
  return a1->xp_ops->xp_reply();
}

void svcerr_noproc(SVCXPRT *a1)
{
}

void svcerr_decode(SVCXPRT *a1)
{
}

void svcerr_systemerr(SVCXPRT *a1)
{
}

void svcerr_auth(SVCXPRT *a1, auth_stat a2)
{
}

void svcerr_weakauth(SVCXPRT *a1)
{
}

void svcerr_noprog(SVCXPRT *a1)
{
}

void svcerr_progvers(SVCXPRT *a1, unsigned int a2, unsigned int a3)
{
}

void svc_getreq(int a1)
{
  v1.fds_bits[0] = a1;
  svc_getreqset(&v1);
}

void svc_getreqset(fd_set *a1)
{
  v26[50] = *MEMORY[0x1895FEE08];
  v16.ru.RM_cmb.cb_cred.caddr_t oa_base = &v24;
  v16.ru.RM_cmb.cb_verf.caddr_t oa_base = (caddr_t)&v25;
  v15.rq_clntcred = (caddr_t)v26;
  int v1 = svc_maxfd;
  if ((svc_maxfd & 0x80000000) == 0)
  {
    int v2 = 0;
    while (1)
    {
      unsigned int v3 = a1->fds_bits[0];
      a1 = (fd_set *)((char *)a1 + 4);
      if (v3) {
        break;
      }
LABEL_32:
      v2 += 32;
      if (v2 > v1) {
        return;
      }
    }

    unsigned int v4 = __clz(__rbit32(v3));
    while ((int)((v2 | 1) + v4) <= svc_maxfd + 1)
    {
      uint64_t v5 = *(void *)(xports + 8LL * (int)(v4 | v2));
      if (v5)
      {
        clnt_stat v6 = (__int128 *)(v5 + 40);
        do
        {
          if ((**(unsigned int (***)(uint64_t, rpc_msg *))(v5 + 8))(v5, &v16))
          {
            v15.rq_xprt = (SVCXPRT *)v5;
            *(void *)&v15.rq_prog = *(void *)(&v16.ru.RM_rmb.rp_stat + 1);
            v15.rq_proc = v16.ru.RM_cmb.cb_proc;
            v15.rq_cred = v16.ru.RM_cmb.cb_cred;
            auth_stat v7 = _authenticate(&v15, &v16);
            if (v7)
            {
              uint64_t v18 = 0x100000001LL;
              LODWORD(v19) = 1;
              DWORD1(v19) = v7;
            }

            else
            {
              uint64_t v8 = svc_head;
              if (svc_head)
              {
                int v9 = 0;
                unsigned int v10 = 0;
                unsigned int v11 = -1;
                do
                {
                  if (*(_DWORD *)(v8 + 8) == v15.rq_prog)
                  {
                    unsigned int v12 = *(_DWORD *)(v8 + 12);
                    if (v12 == v15.rq_vers)
                    {
                      (*(void (**)(svc_req *, uint64_t))(v8 + 16))(&v15, v5);
                      goto LABEL_25;
                    }

                    if (v12 < v11) {
                      unsigned int v11 = *(_DWORD *)(v8 + 12);
                    }
                    if (v12 > v10) {
                      unsigned int v10 = *(_DWORD *)(v8 + 12);
                    }
                    int v9 = 1;
                  }

                  uint64_t v8 = *(void *)v8;
                }

                while (v8);
                if (!v9) {
                  goto LABEL_23;
                }
                uint64_t v18 = 1LL;
                __int128 v19 = *v6;
                uint64_t v20 = *(void *)(v5 + 56);
                int v21 = 2;
                unsigned int v22 = v11;
                unsigned int v23 = v10;
              }

              else
              {
LABEL_23:
                uint64_t v18 = 1LL;
                __int128 v19 = *v6;
                uint64_t v20 = *(void *)(v5 + 56);
                int v21 = 1;
              }
            }

            (*(void (**)(uint64_t, char *))(*(void *)(v5 + 8) + 24LL))(v5, v17);
          }

LABEL_25:
          int v13 = (*(uint64_t (**)(uint64_t))(*(void *)(v5 + 8) + 8LL))(v5);
        }

        while (v13 == 1);
        if (!v13) {
          (*(void (**)(uint64_t))(*(void *)(v5 + 8) + 40LL))(v5);
        }
      }

      v3 ^= 1 << v4;
      unsigned int v4 = __clz(__rbit32(v3));
      if (!v3)
      {
        int v1 = svc_maxfd;
        goto LABEL_32;
      }
    }
  }

auth_stat _authenticate(svc_req *a1, rpc_msg *a2)
{
  __int128 v4 = *(_OWORD *)(&a2->ru.RM_rmb.ru.RP_dr.ru.RJ_why + 1);
  *(void *)&a1->rq_cred.uint64_t oa_length = *((void *)&a2->ru.RM_rmb.ru.RP_dr + 3);
  *(_OWORD *)&a1->rq_cred.oa_flavor = v4;
  rq_xprt = a1->rq_xprt;
  rq_xprt->xp_verf.oa_flavor = _null_auth.oa_flavor;
  rq_xprt->xp_verf.uint64_t oa_length = 0;
  switch(a1->rq_cred.oa_flavor)
  {
    case 0:
      return 0;
    case 1:
      uint64_t v24 = v2;
      uint64_t v25 = v3;
      rq_clntcred = (authunix_parms *)a1->rq_clntcred;
      rq_clntcred->aup_machname = (char *)&rq_clntcred[1];
      rq_clntcred->aup_gids = &rq_clntcred[7].aup_uid;
      uint64_t oa_length = a2->ru.RM_cmb.cb_cred.oa_length;
      xdrmem_create(&v23, a2->ru.RM_cmb.cb_cred.oa_base, oa_length, XDR_DECODE);
      unsigned int v10 = (unsigned int *)((uint64_t (*)(XDR *, uint64_t))v23.x_ops->x_inline)(&v23, oa_length);
      if (v10)
      {
        rq_clntcred->aup_time = bswap32(*v10);
        size_t v11 = bswap32(v10[1]);
        unsigned int v12 = v10 + 2;
        memmove(rq_clntcred->aup_machname, v10 + 2, v11);
        rq_clntcred->aup_machname[v11] = 0;
        uint64_t v13 = ((_DWORD)v11 + 3) & 0xFFFFFFFC;
        rq_clntcred->aup_uid = bswap32(*(unsigned int *)((char *)v12 + v13));
        rq_clntcred->aup_gid = bswap32(*(unsigned int *)((char *)v12 + v13 + 4));
        unsigned int v14 = *(unsigned int *)((char *)v12 + v13 + 8);
        unsigned int v15 = bswap32(v14);
        if (v15 > 0x10) {
          goto LABEL_17;
        }
        rq_clntcred->aup_len = v15;
        if (v14)
        {
          rpc_msg v16 = (unsigned int *)((char *)v12 + v13 + 12);
          aup_gids = rq_clntcred->aup_gids;
          if (v15 <= 1) {
            uint64_t v18 = 1LL;
          }
          else {
            uint64_t v18 = v15;
          }
          do
          {
            unsigned int v19 = *v16++;
            *aup_gids++ = bswap32(v19);
            --v18;
          }

          while (v18);
        }

SVCXPRT *svcraw_create(void)
{
  uint64_t v0 = (char *)calloc(1uLL, 0x2470uLL);
  if (!v0) {
    return 0LL;
  }
  int v1 = (SVCXPRT *)(v0 + 8800);
  *((_DWORD *)v0 + 2200) = 0;
  *((_WORD *)v0 + 4402) = 0;
  *((void *)v0 + 1101) = server_ops;
  *((void *)v0 + 1106) = v0 + 8928;
  xdrmem_create((XDR *)v0 + 185, v0, 0x2260u, XDR_FREE);
  return v1;
}

uint64_t svcraw_recv()
{
  return 0LL;
}

uint64_t svcraw_getargs()
{
  return 0LL;
}

uint64_t svcraw_reply()
{
  return 0LL;
}

uint64_t svcraw_freeargs()
{
  return 0LL;
}

uint64_t svcraw_stat()
{
  return 2LL;
}

SVCXPRT *__cdecl svctcp_create(int a1, unsigned int a2, unsigned int a3)
{
  uint64_t v14 = *MEMORY[0x1895FEE08];
  socklen_t v12 = 16;
  int v6 = a1;
  if (a1 == -1)
  {
    int v6 = socket(2, 1, 6);
    if (v6 < 0)
    {
      perror("svctcp_.c - udp socket creation problem");
      return 0LL;
    }
  }

  *(void *)&v13.sin_len = 512LL;
  *(void *)v13.sin_zero = 0LL;
  if (bindresvport(v6, &v13))
  {
    v13.sin_port = 0;
    bind(v6, (const sockaddr *)&v13, 0x10u);
  }

  if (getsockname(v6, (sockaddr *)&v13, &v12) || listen(v6, 2))
  {
    perror("svctcp_.c - cannot getsockname or listen");
    if (a1 == -1) {
      close_NOCANCEL();
    }
    return 0LL;
  }

  auth_stat v7 = (char *)calloc(1uLL, 8uLL);
  if (!v7)
  {
    fwrite("svctcp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
    return 0LL;
  }

  uint64_t v8 = v7;
  *(_DWORD *)auth_stat v7 = a2;
  *((_DWORD *)v7 + 1) = a3;
  int v9 = (SVCXPRT *)calloc(1uLL, 0x50uLL);
  unsigned int v10 = v9;
  if (v9)
  {
    v9->xp_p2 = 0LL;
    v9->xp_verf = _null_auth;
    v9->xp_p1 = v8;
    v9->xp_ops = (SVCXPRT::xp_ops *)svctcp_rendezvous_op;
    v9->xp_port = bswap32(v13.sin_port) >> 16;
    v9->uint64_t xp_sock = v6;
    xprt_register(v9);
  }

  else
  {
    free(v8);
    fwrite("svctcp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
  }

  return v10;
}

uint64_t rendezvous_request(uint64_t a1)
{
  int v1 = *(unsigned int **)(a1 + 64);
  while (1)
  {
    int v2 = accept_NOCANCEL();
    if ((v2 & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 4) {
      return 0LL;
    }
  }

  uint64_t v3 = makefd_xprt(v2, *v1, v1[1]);
  v3->xp_raddr = v5;
  v3->xp_addrlen = 16;
  return 0LL;
}

void svctcp_destroy(SVCXPRT *a1)
{
  xp_p1 = a1->xp_p1;
  xprt_unregister(a1);
  close_NOCANCEL();
  if (a1->xp_port)
  {
    a1->xp_port = 0;
  }

  else
  {
    uint64_t v3 = *(void (**)(void *))(xp_p1[2] + 56LL);
    if (v3) {
      v3(xp_p1 + 1);
    }
  }

  free(xp_p1);
  free(a1);
}

uint64_t rendezvous_stat()
{
  return 2LL;
}

void rendezvous_abort()
{
}

SVCXPRT *makefd_xprt(int a1, unsigned int a2, unsigned int a3)
{
  int v6 = (SVCXPRT *)calloc(1uLL, 0x50uLL);
  if (v6)
  {
    auth_stat v7 = (char *)calloc(1uLL, 0x1C8uLL);
    if (v7)
    {
      uint64_t v8 = v7;
      *(_DWORD *)auth_stat v7 = 2;
      xdrrec_create( (XDR *)(v7 + 8),  a2,  a3,  v6,  (int (__cdecl *)(void *, void *, int))readtcp_0,  (int (__cdecl *)(void *, void *, int))writetcp_0);
      v6->xp_p1 = v8;
      v6->xp_p2 = 0LL;
      v6->xp_verf.caddr_t oa_base = v8 + 56;
      v6->xp_addrlen = 0;
      v6->xp_ops = (SVCXPRT::xp_ops *)svctcp_op;
      v6->xp_port = 0;
      v6->uint64_t xp_sock = a1;
      xprt_register(v6);
    }

    else
    {
      fwrite("svc_tcp: makefd_xprt: out of memory\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
      free(v6);
      return 0LL;
    }
  }

  else
  {
    fwrite("svc_tcp: makefd_xprt: out of memory\n", 0x24uLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
  }

  return v6;
}

uint64_t readtcp_0(int *a1)
{
  int v2 = *a1;
  int v3 = 1 << *a1;
  unint64_t v4 = (unint64_t)*a1 >> 5;
  do
  {
    while (1)
    {
      fd_set v6 = svc_fdset;
      if (__darwin_check_fd_set_overflow(v2, &v6, 0)) {
        v6.fds_bits[v4] |= v3;
      }
      if (*__error() != 4) {
        goto LABEL_11;
      }
    }
  }

  while (!__darwin_check_fd_set_overflow(v2, &v6, 0) || (v6.fds_bits[v4] & v3) == 0);
  uint64_t result = read_NOCANCEL();
  if ((int)result <= 0)
  {
LABEL_11:
    **((_DWORD **)a1 + 8) = 0;
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t writetcp_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  if ((int)a3 >= 1)
  {
    int v6 = a3;
    while (1)
    {
      unsigned int v7 = write_NOCANCEL();
      if ((v7 & 0x80000000) != 0) {
        break;
      }
      a2 += v7;
      BOOL v8 = __OFSUB__(v6, v7);
      v6 -= v7;
      if ((v6 < 0) ^ v8 | (v6 == 0)) {
        return v3;
      }
    }

    **(_DWORD **)(a1 + 64) = 0;
    return 0xFFFFFFFFLL;
  }

  return v3;
}

uint64_t svctcp_recv(uint64_t a1, rpc_msg *a2)
{
  uint64_t v3 = *(void *)(a1 + 64);
  *(_DWORD *)(v3 + 8) = 1;
  uint64_t result = xdrrec_skiprecord((XDR *)(v3 + 8));
  if ((_DWORD)result)
  {
    uint64_t result = xdr_callmsg((XDR *)(v3 + 8), a2);
    if ((_DWORD)result)
    {
      *(_DWORD *)(v3 + 4) = a2->rm_xid;
      return 1LL;
    }
  }

  return result;
}

uint64_t svctcp_stat(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  if (!*(_DWORD *)v1) {
    return 0LL;
  }
  if (xdrrec_eof((XDR *)(v1 + 8))) {
    return 2LL;
  }
  return 1LL;
}

uint64_t svctcp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  return a2(*(void *)(a1 + 64) + 8LL, a3, 0LL);
}

uint64_t svctcp_reply(uint64_t a1, rpc_msg *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  *(_DWORD *)(v2 + 8) = 0;
  v2 += 8LL;
  a2->rm_xid = *(_DWORD *)(v2 - 4);
  uint64_t v3 = xdr_replymsg((XDR *)v2, a2);
  xdrrec_endofrecord((XDR *)v2, 1);
  return v3;
}

uint64_t svctcp_freeargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 64);
  *(_DWORD *)(v3 + 8) = 2;
  return a2(v3 + 8, a3, 0LL);
}

SVCXPRT *__cdecl svcudp_bufcreate(int a1, unsigned int a2, unsigned int a3)
{
  uint64_t v17 = *MEMORY[0x1895FEE08];
  socklen_t v15 = 16;
  int v6 = a1;
  if (a1 == -1)
  {
    int v6 = socket(2, 2, 17);
    if (v6 < 0)
    {
      perror("svcudp_create: socket creation problem");
      return 0LL;
    }
  }

  *(void *)&v16.sin_len = 512LL;
  *(void *)v16.sin_zero = 0LL;
  if (bindresvport(v6, &v16))
  {
    v16.sin_port = 0;
    bind(v6, (const sockaddr *)&v16, 0x10u);
  }

  if (getsockname(v6, (sockaddr *)&v16, &v15))
  {
    perror("svcudp_create - cannot getsockname");
    if (a1 == -1) {
      close_NOCANCEL();
    }
    return 0LL;
  }

  unsigned int v7 = (SVCXPRT *)calloc(1uLL, 0x50uLL);
  if (!v7)
  {
    fwrite("svcudp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
    return v7;
  }

  BOOL v8 = calloc(1uLL, 0x1D0uLL);
  if (!v8)
  {
    sockaddr_in v13 = v7;
LABEL_16:
    free(v13);
    fwrite("svcudp_create: out of memory\n", 0x1DuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
    return 0LL;
  }

  int v9 = v8;
  if (a2 <= a3) {
    unsigned int v10 = a3;
  }
  else {
    unsigned int v10 = a2;
  }
  size_t v11 = (v10 + 3) & 0xFFFFFFFC;
  *BOOL v8 = v11;
  socklen_t v12 = (char *)calloc(1uLL, v11);
  v7->xp_p1 = v12;
  if (!v12)
  {
    free(v7);
    sockaddr_in v13 = (SVCXPRT *)v9;
    goto LABEL_16;
  }

  xdrmem_create((XDR *)(v9 + 2), v12, *v9, XDR_DECODE);
  *((void *)v9 + 57) = 0LL;
  v7->xp_p2 = (caddr_t)v9;
  v7->xp_verf.caddr_t oa_base = (caddr_t)(v9 + 14);
  v7->xp_ops = (SVCXPRT::xp_ops *)svcudp_op;
  v7->xp_port = bswap32(v16.sin_port) >> 16;
  v7->uint64_t xp_sock = v6;
  xprt_register(v7);
  return v7;
}

SVCXPRT *__cdecl svcudp_create(int a1)
{
  return svcudp_bufcreate(a1, 0x2260u, 0x2260u);
}

uint64_t svcudp_recv(uint64_t a1, rpc_msg *a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  sockaddr_in v5 = (_OWORD *)(a1 + 20);
  do
  {
    *(_DWORD *)(a1 + 16) = 16;
    int v6 = recvfrom_NOCANCEL();
  }

  while (v6 == -1 && *__error() == 4);
  if ((v6 & 0xFFFFFFF0) == 0) {
    return 0LL;
  }
  *(_DWORD *)(v4 + 8) = 1;
  (*(void (**)(uint64_t, void))(*(void *)(v4 + 16) + 40LL))(v4 + 8, 0LL);
  uint64_t result = xdr_callmsg((XDR *)(v4 + 8), a2);
  if ((_DWORD)result)
  {
    *(_DWORD *)(v4 + 4) = a2->rm_xid;
    if (*(void *)(v4 + 456))
    {
      uint64_t v8 = *(void *)(a1 + 72);
      uint64_t v9 = *(void *)(v8 + 456);
      uint64_t v10 = *(void *)(*(void *)(v9 + 8) + 8LL * (*(_DWORD *)(v8 + 4) % (4 * *(_DWORD *)v9)));
      if (v10)
      {
        while (*(_DWORD *)v10 != *(_DWORD *)(v8 + 4)
             || *(_DWORD *)(v10 + 4) != *(_DWORD *)(v9 + 36)
             || *(_DWORD *)(v10 + 8) != *(_DWORD *)(v9 + 32)
             || *(_DWORD *)(v10 + 12) != *(_DWORD *)(v9 + 28)
             || *(void *)(v10 + 16) != *(void *)(v9 + 40)
             || *(void *)(v10 + 24) != *(void *)(v9 + 48))
        {
          uint64_t v10 = *(void *)(v10 + 48);
          if (!v10) {
            goto LABEL_17;
          }
        }

        sendto_NOCANCEL();
      }

      else
      {
LABEL_17:
        *(_DWORD *)(v9 + 36) = a2->ru.RM_cmb.cb_proc;
        *(_DWORD *)(v9 + 32) = a2->ru.RM_cmb.cb_vers;
        *(_DWORD *)(v9 + 28) = a2->ru.RM_cmb.cb_prog;
        *(_OWORD *)(v9 + 40) = *v5;
      }
    }

    return 1LL;
  }

  return result;
}

uint64_t svcudp_stat()
{
  return 2LL;
}

uint64_t svcudp_getargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  return a2(*(void *)(a1 + 72) + 8LL, a3, 0LL);
}

uint64_t svcudp_reply(uint64_t a1, rpc_msg *a2)
{
  uint64_t v4 = *(void *)(a1 + 72);
  *(_DWORD *)(v4 + 8) = 0;
  (*(void (**)(uint64_t, void))(*(void *)(v4 + 16) + 40LL))(v4 + 8, 0LL);
  a2->rm_xid = *(_DWORD *)(v4 + 4);
  uint64_t result = xdr_replymsg((XDR *)(v4 + 8), a2);
  if ((_DWORD)result)
  {
    int v6 = (*(uint64_t (**)(uint64_t))(*(void *)(v4 + 16) + 32LL))(v4 + 8);
    uint64_t v7 = sendto_NOCANCEL();
    uint64_t result = 0LL;
    if (v7 == v6)
    {
      uint64_t result = 1LL;
      if ((v6 & 0x80000000) == 0)
      {
        if (*(void *)(v4 + 456))
        {
          uint64_t v8 = *(unsigned int **)(a1 + 72);
          uint64_t v9 = *((void *)v8 + 57);
          uint64_t v10 = *(char **)(*(void *)(v9 + 16) + 8LL * *(unsigned int *)(v9 + 24));
          if (v10)
          {
            size_t v11 = (void *)(*(void *)(v9 + 8) + 8LL * (*(_DWORD *)v10 % (4 * *(_DWORD *)v9)));
            do
            {
              socklen_t v12 = v11;
              sockaddr_in v13 = (char *)*v11;
              size_t v11 = (void *)(*v11 + 48LL);
              if (v13) {
                BOOL v14 = v13 == v10;
              }
              else {
                BOOL v14 = 1;
              }
            }

            while (!v14);
            if (v13)
            {
              *socklen_t v12 = *((void *)v10 + 6);
              socklen_t v15 = (char *)*((void *)v10 + 4);
LABEL_17:
              *((_DWORD *)v10 + 10) = v6;
              *((void *)v10 + 4) = *(void *)(a1 + 64);
              *(void *)(a1 + 64) = v15;
              xdrmem_create((XDR *)(v8 + 2), v15, *v8, XDR_ENCODE);
              unsigned int v18 = v8[1];
              *(_DWORD *)uint64_t v10 = v18;
              *(int32x2_t *)(v10 + 4) = vrev64_s32(*(int32x2_t *)(v9 + 32));
              *((_DWORD *)v10 + 3) = *(_DWORD *)(v9 + 28);
              *((_OWORD *)v10 + 1) = *(_OWORD *)(v9 + 40);
              unsigned int v19 = v18 % (4 * **(_DWORD **)(*(void *)(a1 + 72) + 456LL));
              uint64_t v20 = *(void *)(v9 + 8);
              *((void *)v10 + 6) = *(void *)(v20 + 8LL * v19);
              *(void *)(v20 + 8LL * v19) = v10;
              uint64_t v21 = *(unsigned int *)(v9 + 24);
              *(void *)(*(void *)(v9 + 16) + 8 * v21) = v10;
              *(_DWORD *)(v9 + 24) = (v21 + 1) % *(_DWORD *)v9;
              return 1LL;
            }

            unsigned int v22 = (FILE *)*MEMORY[0x1895FEE10];
            XDR v23 = "cache_set: victim not found";
          }

          else
          {
            sockaddr_in v16 = (char *)calloc(1uLL, 0x38uLL);
            if (v16)
            {
              uint64_t v10 = v16;
              uint64_t v17 = (char *)calloc(1uLL, *v8);
              if (v17)
              {
                socklen_t v15 = v17;
                goto LABEL_17;
              }

              free(v10);
              unsigned int v22 = (FILE *)*MEMORY[0x1895FEE10];
              XDR v23 = "cache_set: could not allocate new rpc_buffer";
            }

            else
            {
              unsigned int v22 = (FILE *)*MEMORY[0x1895FEE10];
              XDR v23 = "cache_set: victim alloc failed";
            }
          }

          fprintf(v22, "%s\n", v23);
          return 1LL;
        }
      }
    }
  }

  return result;
}

uint64_t svcudp_freeargs(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, void), uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 72);
  *(_DWORD *)(v3 + 8) = 2;
  return a2(v3 + 8, a3, 0LL);
}

void svcudp_destroy(SVCXPRT *a1)
{
  xp_p2 = a1->xp_p2;
  xprt_unregister(a1);
  close_NOCANCEL();
  uint64_t v3 = *(void (**)(void *))(xp_p2[2] + 56LL);
  if (v3) {
    v3(xp_p2 + 1);
  }
  free(a1->xp_p1);
  free(xp_p2);
  free(a1);
}

void xdr_free(xdrproc_t a1, void *a2)
{
  v2[0] = 2;
  ((void (*)(int *, void *, void))a1)(v2, a2, 0LL);
}

int xdr_void(void)
{
  return 1;
}

int xdr_int(XDR *a1, int *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_u_int(XDR *a1, unsigned int *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_long(XDR *a1, int *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE) {
    return ((uint64_t (*)(void))a1->x_ops->x_getlong)();
  }
  if (x_op) {
    return 0;
  }
  return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_u_long(XDR *a1, unsigned int *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE) {
    return ((uint64_t (*)(void))a1->x_ops->x_getlong)();
  }
  if (x_op) {
    return 0;
  }
  return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
}

int xdr_int32_t(XDR *a1, int32_t *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_u_int32_t(XDR *a1, u_int32_t *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_short(XDR *a1, __int16 *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_u_short(XDR *a1, unsigned __int16 *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_int16_t(XDR *a1, int16_t *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_u_int16_t(XDR *a1, u_int16_t *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_char(XDR *a1, char *a2)
{
  int v4 = *a2;
  int result = xdr_int(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }

  return result;
}

int xdr_u_char(XDR *a1, unsigned __int8 *a2)
{
  unsigned int v4 = *a2;
  int result = xdr_u_int(a1, &v4);
  if (result)
  {
    *a2 = v4;
    return 1;
  }

  return result;
}

int xdr_BOOL(XDR *a1, int *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *a2 = v5 != 0;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_opaque(XDR *a1, char *a2, unsigned int a3)
{
  if (!a3) {
    return 1;
  }
  unsigned int v4 = a3 & 3;
  xdr_op x_op = a1->x_op;
  if (a1->x_op)
  {
    if (x_op != XDR_FREE)
    {
      if (x_op != XDR_DECODE) {
        return 0;
      }
      int v6 = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getbytes)(a1, a2);
      int result = v6 != 0;
      if (v4)
      {
        if (v6) {
          return ((uint64_t (*)(XDR *, _BYTE *, void))a1->x_ops->x_getbytes)(a1, v9, 4 - v4);
        }
      }

      return result;
    }

    return 1;
  }

  int v8 = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putbytes)(a1, a2);
  int result = v8 != 0;
  if (v4 && v8) {
    return ((uint64_t (*)(XDR *, void *, void))a1->x_ops->x_putbytes)(a1, &xdr_zero, 4 - v4);
  }
  return result;
}

int xdr_bytes(XDR *a1, char **a2, unsigned int *a3, unsigned int a4)
{
  int v8 = *a2;
  int result = xdr_u_int(a1, a3);
  if (result)
  {
    size_t v10 = *a3;
    xdr_op x_op = a1->x_op;
    if (v10 > a4)
    {
      if (x_op != XDR_FREE) {
        return 0;
      }
      goto LABEL_12;
    }

    if (x_op)
    {
      if (x_op == XDR_FREE)
      {
LABEL_12:
        if (v8)
        {
          free(v8);
          *a2 = 0LL;
        }

        return 1;
      }

      if (x_op == XDR_DECODE)
      {
        if (!(_DWORD)v10) {
          return 1;
        }
        if (v8) {
          return xdr_opaque(a1, (char *)v8, v10);
        }
        int v8 = calloc(1uLL, v10);
        *a2 = (char *)v8;
        if (v8) {
          return xdr_opaque(a1, (char *)v8, v10);
        }
        warnx("xdr_bytes: out of memory");
      }

      return 0;
    }

    return xdr_opaque(a1, (char *)v8, v10);
  }

  return result;
}

int xdr_netobj(XDR *a1, netobj *a2)
{
  return xdr_bytes(a1, &a2->n_bytes, &a2->n_len, 0x400u);
}

int xdr_union(XDR *a1, int *a2, char *a3, const xdr_discrim *a4, xdrproc_t a5)
{
  if (xdr_long(a1, a2))
  {
    xdrproc_t proc = a4->proc;
    if (proc)
    {
      if (a4->value == *a2) {
        return ((uint64_t (*)(XDR *, char *, void))proc)(a1, a3, 0LL);
      }
      for (BOOL i = &a4[1].proc; ; i += 2)
      {
        xdrproc_t proc = *i;
        if (!*i) {
          break;
        }
        int v12 = *((_DWORD *)i - 2);
        if (v12 == *a2) {
          return ((uint64_t (*)(XDR *, char *, void))proc)(a1, a3, 0LL);
        }
      }
    }

    xdrproc_t proc = a5;
    if (a5) {
      return ((uint64_t (*)(void, void, void))proc)(a1, a3, 0LL);
    }
  }

  return 0;
}

int xdr_string(XDR *a1, char **a2, unsigned int a3)
{
  int v6 = *a2;
  if (a1->x_op == XDR_ENCODE)
  {
LABEL_4:
    unsigned int v10 = strlen(*a2);
    goto LABEL_5;
  }

  if (a1->x_op == XDR_FREE)
  {
    if (!v6) {
      return 1;
    }
    goto LABEL_4;
  }

LABEL_5:
  int result = xdr_u_int(a1, &v10);
  if (!result) {
    return result;
  }
  uint64_t v8 = v10;
  if (v10 > a3) {
    return 0;
  }
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_ENCODE) {
    return xdr_opaque(a1, v6, v8);
  }
  if (x_op == XDR_FREE)
  {
    free(v6);
    *a2 = 0LL;
  }

  else
  {
    if (x_op != XDR_DECODE) {
      return 0;
    }
    if (v10 != -1)
    {
      if (!v6)
      {
        int v6 = (char *)calloc(1uLL, v10 + 1);
        *a2 = v6;
        if (!v6)
        {
          warnx("xdr_string: out of memory");
          return 0;
        }
      }

      v6[v8] = 0;
      return xdr_opaque(a1, v6, v8);
    }
  }

  return 1;
}

int xdr_wrapstring(XDR *a1, char **a2)
{
  return xdr_string(a1, a2, 0xFFFFFFFF);
}

int xdr_int64_t(XDR *a1, int64_t *a2)
{
  v6[1] = *MEMORY[0x1895FEE08];
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op != XDR_DECODE)
  {
    if (x_op) {
      return 0;
    }
    v6[0] = __ROR8__(*a2, 32);
    int result = ((uint64_t (*)(XDR *, void *))a1->x_ops->x_putlong)(a1, v6);
    if (result) {
      return ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putlong)(a1, (char *)v6 + 4);
    }
    return result;
  }

  int result = ((uint64_t (*)(XDR *, void *))a1->x_ops->x_getlong)(a1, v6);
  if (result)
  {
    int result = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getlong)(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }

  return result;
}

int xdr_u_int64_t(XDR *a1, u_int64_t *a2)
{
  v6[1] = *MEMORY[0x1895FEE08];
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op != XDR_DECODE)
  {
    if (x_op) {
      return 0;
    }
    v6[0] = __ROR8__(*a2, 32);
    int result = ((uint64_t (*)(XDR *, void *))a1->x_ops->x_putlong)(a1, v6);
    if (result) {
      return ((uint64_t (*)(XDR *, char *))a1->x_ops->x_putlong)(a1, (char *)v6 + 4);
    }
    return result;
  }

  int result = ((uint64_t (*)(XDR *, void *))a1->x_ops->x_getlong)(a1, v6);
  if (result)
  {
    int result = ((uint64_t (*)(XDR *, char *))a1->x_ops->x_getlong)(a1, (char *)v6 + 4);
    if (result)
    {
      *a2 = HIDWORD(v6[0]) | ((unint64_t)LODWORD(v6[0]) << 32);
      return 1;
    }
  }

  return result;
}

int xdr_array(XDR *a1, char **a2, unsigned int *a3, unsigned int a4, unsigned int a5, xdrproc_t a6)
{
  int v12 = *a2;
  unsigned int v13 = *a3;
  if (v12) {
    goto LABEL_6;
  }
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (a1->x_op == XDR_DECODE)
  {
    if (v13)
    {
      unsigned int v18 = (char *)calloc(1uLL, v13 * a5);
      *a2 = v18;
      if (v18)
      {
        int v12 = v18;
        bzero(v18, v13 * a5);
LABEL_7:
        uint64_t v14 = a5;
        unsigned int v15 = 1;
        do
        {
          int v16 = ((uint64_t (*)(XDR *, char *, void))a6)(a1, v12, 0LL);
          int v17 = v16;
          if (v15 >= v13) {
            break;
          }
          v12 += v14;
          ++v15;
        }

        while (v16);
        goto LABEL_17;
      }

      warnx("xdr_array: out of memory");
      return 0;
    }

    return 1;
  }

LABEL_6:
  if (v13) {
    goto LABEL_7;
  }
  int v17 = 1;
LABEL_17:
  if (a1->x_op == XDR_FREE)
  {
    free(*a2);
    *a2 = 0LL;
  }

  return v17;
}

int xdr_vector(XDR *a1, char *a2, unsigned int a3, unsigned int a4, xdrproc_t a5)
{
  if (!a3) {
    return 1;
  }
  unsigned int v6 = a3;
  uint64_t v9 = a4;
  while (1)
  {
    int result = ((uint64_t (*)(XDR *, char *, void))a5)(a1, a2, 0LL);
    if (!result) {
      break;
    }
    a2 += v9;
    if (!--v6) {
      return 1;
    }
  }

  return result;
}

int xdr_float(XDR *a1, float *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op == XDR_DECODE)
  {
    int result = ((uint64_t (*)(void))a1->x_ops->x_getlong)();
    if (!result) {
      return result;
    }
    *(_DWORD *)a2 = v5;
    return 1;
  }

  if (x_op) {
    return 0;
  }
  else {
    return ((uint64_t (*)(void))a1->x_ops->x_putlong)();
  }
}

int xdr_double(XDR *a1, double *a2)
{
  xdr_op x_op = a1->x_op;
  if (a1->x_op == XDR_FREE) {
    return 1;
  }
  if (x_op != XDR_DECODE)
  {
    if (x_op) {
      return 0;
    }
    int v6 = *((_DWORD *)a2 + 1);
    int result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_putlong)(a1, &v6);
    if (result)
    {
      int v6 = *(_DWORD *)a2;
      return ((uint64_t (*)(XDR *, int *))a1->x_ops->x_putlong)(a1, &v6);
    }

    return result;
  }

  int result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_getlong)(a1, &v6);
  if (result)
  {
    *((_DWORD *)a2 + 1) = v6;
    int result = ((uint64_t (*)(XDR *, int *))a1->x_ops->x_getlong)(a1, &v6);
    if (result)
    {
      *(_DWORD *)a2 = v6;
      return 1;
    }
  }

  return result;
}

void xdrmem_create(XDR *a1, char *a2, unsigned int a3, xdr_op a4)
{
  a1->xdr_op x_op = a4;
  unsigned int v4 = xdrmem_ops_unaligned;
  a1->x_ops = (const __rpc_xdr::xdr_ops *)v4;
  a1->x_private = a2;
  a1->x_base = a2;
  a1->x_handy = a3;
}

uint64_t xdrmem_getlong_unaligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(void *)(a1 + 24) = v6 + 1;
  return 1LL;
}

uint64_t xdrmem_putlong_unaligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  **(_DWORD **)(a1 + 24) = bswap32(*a2);
  *(void *)(a1 + 24) += 4LL;
  return 1LL;
}

uint64_t xdrmem_getbytes(uint64_t a1, void *__dst, size_t __len)
{
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  BOOL v4 = v3 >= __len;
  int v5 = v3 - __len;
  if (!v4) {
    return 0LL;
  }
  unsigned int v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(__dst, *(const void **)(a1 + 24), __len);
  *(void *)(a1 + 24) += v7;
  return 1LL;
}

uint64_t xdrmem_putbytes(uint64_t a1, const void *a2, size_t __len)
{
  unsigned int v3 = *(_DWORD *)(a1 + 40);
  BOOL v4 = v3 >= __len;
  int v5 = v3 - __len;
  if (!v4) {
    return 0LL;
  }
  unsigned int v7 = __len;
  *(_DWORD *)(a1 + 40) = v5;
  memmove(*(void **)(a1 + 24), a2, __len);
  *(void *)(a1 + 24) += v7;
  return 1LL;
}

uint64_t xdrmem_getpos(uint64_t a1)
{
  else {
    return *(void *)(a1 + 24) - *(void *)(a1 + 32);
  }
}

uint64_t xdrmem_setpos(uint64_t a1, unsigned int a2)
{
  unint64_t v2 = *(void *)(a1 + 32) + a2;
  unint64_t v3 = *(void *)(a1 + 24) + *(unsigned int *)(a1 + 40);
  if (v2 > v3) {
    return 0LL;
  }
  *(void *)(a1 + 24) = v2;
  uint64_t v4 = v3 - v2;
  if (v4 > 0xFFFFFFFFLL) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  return 1LL;
}

uint64_t xdrmem_inline_unaligned()
{
  return 0LL;
}

uint64_t xdrmem_getlong_aligned(uint64_t a1, _DWORD *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(unsigned int **)(a1 + 24);
  *a2 = bswap32(*v6);
  *(void *)(a1 + 24) = v6 + 1;
  return 1LL;
}

uint64_t xdrmem_putlong_aligned(uint64_t a1, unsigned int *a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= 4;
  unsigned int v4 = v2 - 4;
  if (!v3) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  int v6 = *(_DWORD **)(a1 + 24);
  *int v6 = bswap32(*a2);
  *(void *)(a1 + 24) = v6 + 1;
  return 1LL;
}

uint64_t xdrmem_inline_aligned(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 40);
  BOOL v3 = v2 >= a2;
  unsigned int v4 = v2 - a2;
  if (!v3) {
    return 0LL;
  }
  *(_DWORD *)(a1 + 40) = v4;
  uint64_t v5 = *(void *)(a1 + 24);
  *(void *)(a1 + 24) = v5 + a2;
  return v5;
}

void xdrrec_create( XDR *a1, unsigned int a2, unsigned int a3, void *a4, int (__cdecl *a5)(void *, void *, int), int (__cdecl *a6)(void *, void *, int))
{
  int v12 = (void **)calloc(1uLL, 0x98uLL);
  if (v12)
  {
    unsigned int v13 = v12;
    if (a2 >= 0x64) {
      size_t v14 = (a2 + 3) & 0xFFFFFFFC;
    }
    else {
      size_t v14 = 4000LL;
    }
    *((_DWORD *)v12 + 26) = v14;
    unsigned int v15 = calloc(1uLL, v14);
    unsigned int v13[2] = v15;
    if (v15)
    {
      if (a3 >= 0x64) {
        size_t v16 = (a3 + 3) & 0xFFFFFFFC;
      }
      else {
        size_t v16 = 4000LL;
      }
      *((_DWORD *)v13 + 27) = v16;
      int v17 = (char *)calloc(1uLL, v16);
      v13[9] = v17;
      if (v17)
      {
        a1->x_ops = (const __rpc_xdr::xdr_ops *)xdrrec_ops;
        a1->x_private = v13;
        *unsigned int v13 = a4;
        v13[1] = a6;
        unsigned int v18 = (char *)v13[2];
        v13[5] = v18;
        char v13[3] = v18 + 4;
        v13[4] = &v18[v14];
        *((_DWORD *)v13 + 12) = 0;
        v13[7] = a5;
        v13[8] = (void *)v16;
        v13[10] = &v17[v16];
        v13[11] = &v17[v16];
        v13[12] = (void *)0x100000000LL;
        v13[16] = v13 + 15;
        v13[14] = 0LL;
        v13[17] = 0LL;
        *((_DWORD *)v13 + 36) = 0;
      }

      else
      {
        xdrrec_create_cold_1(v13 + 2, v13);
      }
    }

    else
    {
      warnx("xdrrec_create: out of memory");
      free(v13);
    }
  }

  else
  {
    warnx("xdrrec_create: out of memory");
  }

int xdrrec_skiprecord(XDR *a1)
{
  x_private = a1->x_private;
  if (x_private[28])
  {
    if (!__xdrrec_getrec((uint64_t)a1, &v5, 0)
      && (*((void *)x_private + 10) != *((void *)x_private + 11) || v5 != 1))
    {
      return 0;
    }

    x_private[24] = 0;
  }

  else
  {
    while (1)
    {
      int v4 = x_private[24];
      if (v4 <= 0)
      {
        if (x_private[25]) {
          break;
        }
      }

      int result = skip_input_bytes((uint64_t)x_private, v4);
      if (result)
      {
        x_private[24] = 0;
        if (x_private[25]) {
          continue;
        }
        int result = set_input_fragment(x_private);
        if (result) {
          continue;
        }
      }

      return result;
    }

    x_private[25] = 0;
  }

  return 1;
}

uint64_t __xdrrec_getrec(uint64_t a1, int *a2, int a3)
{
  int v5 = *(void **)(a1 + 24);
  if (!*((_DWORD *)v5 + 29))
  {
    uint64_t result = ((uint64_t (*)(void, void, void))v5[7])( *v5,  v5[16],  (4 - *((_DWORD *)v5 + 34)));
    if (!(_DWORD)result) {
      goto LABEL_11;
    }
    if ((result & 0x80000000) != 0) {
      goto LABEL_15;
    }
    v5[16] += (int)result;
    unsigned int v11 = *((_DWORD *)v5 + 34) + result;
    *((_DWORD *)v5 + 34) = v11;
    if (v11 < 4)
    {
LABEL_10:
      uint64_t result = 0LL;
      int v10 = 1;
      goto LABEL_16;
    }

    unsigned int v12 = bswap32(*((_DWORD *)v5 + 30));
    *((_DWORD *)v5 + 30) = v12;
    int v13 = v12 & 0x7FFFFFFF;
    if ((v12 & 0x7FFFFFFF) == 0
      || (int v14 = *((_DWORD *)v5 + 37), v13 > v14)
      || (unsigned int v15 = *((_DWORD *)v5 + 35) + v13, (int)v15 > v14))
    {
LABEL_15:
      int v10 = 0;
      uint64_t result = 0LL;
      goto LABEL_16;
    }

    *((_DWORD *)v5 + 35) = v15;
    if (v15 > *((_DWORD *)v5 + 27))
    {
      realloc_stream((void **)v5, v15);
      unsigned int v12 = *((_DWORD *)v5 + 30);
    }

    if ((v12 & 0x80000000) != 0)
    {
      *((_DWORD *)v5 + 30) = v12 & 0x7FFFFFFF;
      *((_DWORD *)v5 + 25) = 1;
    }
  }

  uint64_t result = ((uint64_t (*)(void, void, void))v5[7])( *v5,  v5[9] + *((int *)v5 + 36),  (*((_DWORD *)v5 + 35) - *((_DWORD *)v5 + 36)));
  if ((result & 0x80000000) != 0) {
    goto LABEL_15;
  }
  if (!(_DWORD)result)
  {
LABEL_11:
    int v10 = 2 * (a3 == 0);
    goto LABEL_16;
  }

  int v7 = *((_DWORD *)v5 + 35);
  int v8 = *((_DWORD *)v5 + 36) + result;
  *((_DWORD *)v5 + 36) = v8;
  if (v8 != v7) {
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 29) = 0;
  gid_t v5[16] = v5 + 15;
  *((_DWORD *)v5 + 34) = 0;
  if (!*((_DWORD *)v5 + 25)) {
    goto LABEL_10;
  }
  *((_DWORD *)v5 + 24) = v8;
  uint64_t v9 = v5[9];
  v5[10] = v9;
  v5[11] = v9 + v8;
  *((_DWORD *)v5 + 35) = 0;
  *((_DWORD *)v5 + 36) = 0;
  int v10 = 1;
  uint64_t result = 1LL;
LABEL_16:
  *a2 = v10;
  return result;
}

uint64_t skip_input_bytes(uint64_t a1, int a2)
{
  if (a2 < 1) {
    return 1LL;
  }
  for (int i = a2; i > 0; i -= v5)
  {
    while (1)
    {
      uint64_t v4 = *(void *)(a1 + 80);
      LODWORD(v5) = *(_DWORD *)(a1 + 88) - v4;
      if ((_DWORD)v5) {
        break;
      }
      uint64_t result = fill_input_buf(a1);
      if (!(_DWORD)result) {
        return result;
      }
    }

    else {
      uint64_t v5 = i;
    }
    *(void *)(a1 + 80) = v4 + v5;
  }

  return 1LL;
}

uint64_t set_input_fragment(_DWORD *a1)
{
  if (a1[28]) {
    return 0LL;
  }
  uint64_t result = get_input_bytes((uint64_t)a1, (char *)&__dst, 4);
  if ((_DWORD)result)
  {
    unsigned int v3 = __dst;
    unsigned int v4 = bswap32(__dst);
    a1[25] = v4 >> 31;
    if (v3)
    {
      a1[24] = v4 & 0x7FFFFFFF;
      return 1LL;
    }

    return 0LL;
  }

  return result;
}

int xdrrec_eof(XDR *a1)
{
  x_private = a1->x_private;
  while (1)
  {
    int v2 = x_private[24];
    if (v2 <= 0)
    {
      if (x_private[25]) {
        break;
      }
    }

    if (skip_input_bytes((uint64_t)x_private, v2))
    {
      x_private[24] = 0;
    }

    return 1;
  }

  return *((void *)x_private + 10) == *((void *)x_private + 11);
}

int xdrrec_endofrecord(XDR *a1, int a2)
{
  x_private = a1->x_private;
  if (a2
    || x_private[12]
    || (uint64_t v3 = *((void *)x_private + 3), (unint64_t)(v3 + 4) >= *((void *)x_private + 4)))
  {
    x_private[12] = 0;
    return flush_out((uint64_t)x_private, 1);
  }

  else
  {
    **((_DWORD **)x_private + 5) = bswap32((v3 - *((void *)x_private + 5) + 2147483644) | 0x80000000);
    *((void *)x_private + 5) = v3;
    *((void *)x_private + 3) = v3 + 4;
    return 1;
  }

uint64_t flush_out(uint64_t a1, int a2)
{
  int v3 = *(_DWORD *)(a1 + 24);
  **(_DWORD **)(a1 + 40) = bswap32((v3 - *(void *)(a1 + 40) - 4) | ((a2 == 1) << 31));
  int v4 = v3 - *(void *)(a1 + 16);
  uint64_t v5 = *(void *)(a1 + 16);
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 24) = v5 + 4;
  return 1LL;
}

void **realloc_stream(void **result, unsigned int a2)
{
  if (*((_DWORD *)result + 27) < a2)
  {
    int v3 = result;
    int v4 = (void *)(int)a2;
    uint64_t result = (void **)realloc(result[9], (int)a2);
    if (result)
    {
      v3[10] = (char *)v3[10] + (int)result - *((_DWORD *)v3 + 18);
      v3[11] = (char *)v4 + (void)result;
      *((_DWORD *)v3 + 27) = a2;
      v3[8] = v4;
      v3[9] = result;
    }
  }

  return result;
}

uint64_t xdrrec_getlong(uint64_t a1, _DWORD *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v3 + 96) < 4u || (int v4 = *(unsigned int **)(v3 + 80), *(void *)(v3 + 88) - (void)v4 < 4uLL))
  {
    uint64_t result = xdrrec_getbytes(a1, (char *)&__dst, 4u);
    if (!(_DWORD)result) {
      return result;
    }
    *a2 = bswap32(__dst);
  }

  else
  {
    *a2 = bswap32(*v4);
    *(_DWORD *)(v3 + 96) -= 4;
    *(void *)(v3 + 80) = v4 + 1;
  }

  return 1LL;
}

uint64_t xdrrec_putlong(uint64_t a1, unsigned int *a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  int v4 = *(_DWORD **)(v3 + 24);
  unint64_t v5 = *(void *)(v3 + 32);
  *(void *)(v3 + 24) = v4 + 1;
  if ((unint64_t)(v4 + 1) > v5)
  {
    *(void *)(v3 + 24) = v4;
    *(_DWORD *)(v3 + 48) = 1;
    uint64_t result = flush_out(v3, 0);
    if (!(_DWORD)result) {
      return result;
    }
    int v4 = *(_DWORD **)(v3 + 24);
    *(void *)(v3 + 24) = v4 + 1;
  }

  *int v4 = bswap32(*a2);
  return 1LL;
}

uint64_t xdrrec_getbytes(uint64_t a1, char *__dst, unsigned int a3)
{
  if (!a3) {
    return 1LL;
  }
  unsigned int v3 = a3;
  unint64_t v5 = *(_DWORD **)(a1 + 24);
  while (1)
  {
    while (1)
    {
      unsigned int v6 = v5[24];
      if (!v6) {
        break;
      }
      if (v3 >= v6) {
        int v8 = v5[24];
      }
      else {
        int v8 = v3;
      }
      uint64_t result = get_input_bytes((uint64_t)v5, __dst, v8);
      if ((_DWORD)result)
      {
        __dst += v8;
        v5[24] -= v8;
        uint64_t result = 1LL;
        v3 -= v8;
        if (v3) {
          continue;
        }
      }

      return result;
    }

    if (v5[25]) {
      break;
    }
    uint64_t result = set_input_fragment(v5);
    if (!(_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t xdrrec_putbytes(uint64_t a1, char *__src, unsigned int a3)
{
  uint64_t v3 = 1LL;
  if (a3)
  {
    unsigned int v4 = a3;
    uint64_t v6 = *(void *)(a1 + 24);
    while (1)
    {
      int v7 = *(void **)(v6 + 24);
      size_t v8 = *(void *)(v6 + 32) - (void)v7 >= (unint64_t)v4 ? v4 : *(void *)(v6 + 32) - (void)v7;
      memmove(v7, __src, v8);
      uint64_t v9 = *(void *)(v6 + 32);
      size_t v10 = *(void *)(v6 + 24) + v8;
      *(void *)(v6 + 24) = v10;
      if (v10 == v9)
      {
        *(_DWORD *)(v6 + 48) = 1;
      }

      __src += v8;
      v4 -= v8;
      if (!v4) {
        return 1LL;
      }
    }

    return 0LL;
  }

  return v3;
}

off_t xdrrec_getpos(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  off_t result = lseek(**(_DWORD **)v2, 0LL, 1);
  if (result != -1)
  {
    if (*(_DWORD *)a1 == 1)
    {
      return result - *(void *)(v2 + 88) + *(void *)(v2 + 80);
    }

    else if (*(_DWORD *)a1)
    {
      return -1LL;
    }

    else
    {
      return result + *(void *)(v2 + 24) - *(void *)(v2 + 16);
    }
  }

  return result;
}

uint64_t xdrrec_setpos(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = xdrrec_getpos(a1);
  if (v5 == -1) {
    return 0LL;
  }
  int v6 = v5 - a2;
  if (*(_DWORD *)a1 == 1)
  {
    int v8 = *(_DWORD *)(v4 + 96);
    BOOL v9 = __OFSUB__(v8, v6);
    int v10 = v8 - v6;
    if (!((v10 < 0) ^ v9 | (v10 == 0)))
    {
      unint64_t v11 = *(void *)(v4 + 80) - v6;
      if (v11 <= *(void *)(v4 + 88) && v11 >= *(void *)(v4 + 72))
      {
        *(void *)(v4 + 80) = v11;
        *(_DWORD *)(v4 + 96) = v10;
        return 1LL;
      }
    }

    return 0LL;
  }

  if (*(_DWORD *)a1) {
    return 0LL;
  }
  unint64_t v7 = *(void *)(v4 + 24) - v6;
  if (v7 <= *(void *)(v4 + 40) || v7 >= *(void *)(v4 + 32)) {
    return 0LL;
  }
  *(void *)(v4 + 24) = v7;
  return 1LL;
}

uint64_t xdrrec_inline(uint64_t a1, unsigned int a2)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)a1 != 1)
  {
    if (!*(_DWORD *)a1)
    {
      uint64_t result = *(void *)(v2 + 24);
      unint64_t v4 = result + a2;
      if (v4 <= *(void *)(v2 + 32))
      {
        *(void *)(v2 + 24) = v4;
        return result;
      }
    }

    return 0LL;
  }

  unsigned int v5 = *(_DWORD *)(v2 + 96);
  BOOL v6 = v5 >= a2;
  unsigned int v7 = v5 - a2;
  if (!v6) {
    return 0LL;
  }
  uint64_t result = *(void *)(v2 + 80);
  unint64_t v8 = result + a2;
  if (v8 > *(void *)(v2 + 88)) {
    return 0LL;
  }
  *(_DWORD *)(v2 + 96) = v7;
  *(void *)(v2 + 80) = v8;
  return result;
}

void xdrrec_destroy(uint64_t a1)
{
  uint64_t v1 = *(void ***)(a1 + 24);
  free(v1[2]);
  free(v1[9]);
  free(v1);
}

uint64_t get_input_bytes(uint64_t a1, char *__dst, int a3)
{
  int v3 = a3;
  if (*(_DWORD *)(a1 + 112))
  {
    BOOL v6 = *(const void **)(a1 + 80);
    memcpy(__dst, v6, a3);
    *(void *)(a1 + 80) += v3;
    return 1LL;
  }

  if (a3 < 1) {
    return 1LL;
  }
  do
  {
    while (1)
    {
      unint64_t v8 = *(const void **)(a1 + 80);
      unint64_t v9 = *(void *)(a1 + 88) - (void)v8;
      if (v9) {
        break;
      }
      uint64_t result = fill_input_buf(a1);
      if (!(_DWORD)result) {
        return result;
      }
    }

    else {
      size_t v10 = *(void *)(a1 + 88) - (void)v8;
    }
    memmove(__dst, v8, v10);
    *(void *)(a1 + 80) += v10;
    __dst += v10;
    v3 -= v10;
    uint64_t result = 1LL;
  }

  while (v3 >= 1);
  return result;
}

uint64_t fill_input_buf(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 112)) {
    return 0LL;
  }
  uint64_t v3 = *(void *)(a1 + 88) & 3LL;
  uint64_t v4 = *(void *)(a1 + 72) + v3;
  int v5 = (*(uint64_t (**)(void, uint64_t, void))(a1 + 56))( *(void *)a1,  v4,  (*(_DWORD *)(a1 + 64) - v3));
  if (v5 == -1) {
    return 0LL;
  }
  *(void *)(a1 + 80) = v4;
  *(void *)(a1 + 88) = v4 + v5;
  return 1LL;
}

int xdr_reference(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  unsigned int v7 = *a2;
  if (!*a2)
  {
    if (a1->x_op == XDR_FREE) {
      return 1;
    }
    if (a1->x_op == XDR_DECODE)
    {
      size_t v9 = a3;
      size_t v10 = (char *)calloc(1uLL, a3);
      *a2 = v10;
      if (!v10)
      {
        warnx("xdr_reference: out of memory");
        return 0;
      }

      unsigned int v7 = v10;
      bzero(v10, v9);
    }

    else
    {
      unsigned int v7 = 0LL;
    }
  }

  int v8 = ((uint64_t (*)(XDR *, char *, void))a4)(a1, v7, 0LL);
  if (a1->x_op == XDR_FREE)
  {
    free(v7);
    *a2 = 0LL;
  }

  return v8;
}

int xdr_pointer(XDR *a1, char **a2, unsigned int a3, xdrproc_t a4)
{
  int v9 = *a2 != 0LL;
  int result = xdr_BOOL(a1, &v9);
  if (result)
  {
    if (v9)
    {
      return xdr_reference(a1, a2, a3, a4);
    }

    else
    {
      *a2 = 0LL;
      return 1;
    }
  }

  return result;
}

void xdrstdio_create(XDR *a1, FILE *a2, xdr_op a3)
{
  a1->xdr_op x_op = a3;
  a1->x_ops = (const __rpc_xdr::xdr_ops *)xdrstdio_ops;
  a1->x_handy = 0;
  a1->x_private = a2;
  a1->x_base = 0LL;
}

size_t xdrstdio_getlong(uint64_t a1, _DWORD *a2)
{
  size_t result = fread(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24));
  if (result != 1) {
    return 0LL;
  }
  *a2 = bswap32(__ptr);
  return result;
}

BOOL xdrstdio_putlong(uint64_t a1, unsigned int *a2)
{
  unsigned int __ptr = bswap32(*a2);
  return fwrite(&__ptr, 4uLL, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_getbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fread(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

BOOL xdrstdio_putbytes(uint64_t a1, void *__ptr, size_t __size)
{
  return !(_DWORD)__size || fwrite(__ptr, __size, 1uLL, *(FILE **)(a1 + 24)) == 1;
}

uint64_t xdrstdio_getpos(uint64_t a1)
{
  uint64_t result = MEMORY[0x186DFD1CC](*(void *)(a1 + 24));
  if (result >= 0xFFFFFFFFLL) {
    return 0xFFFFFFFFLL;
  }
  return result;
}

BOOL xdrstdio_setpos(uint64_t a1, unsigned int a2)
{
  return fseek(*(FILE **)(a1 + 24), a2, 0) >= 0;
}

uint64_t xdrstdio_inline()
{
  return 0LL;
}

uint64_t xdrstdio_destroy(uint64_t a1)
{
  return fflush(*(FILE **)(a1 + 24));
}

uint64_t ntohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t htonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t ntohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t htons(unsigned int a1)
{
  return __rev16(a1);
}

int rcmd_af(char **a1, int a2, const char *a3, const char *a4, const char *a5, int *a6, int a7)
{
  uint64_t v76 = *MEMORY[0x1895FEE08];
  getpid();
  memset(&v70.ai_addrlen, 0, 32);
  v70.int ai_flags = 2;
  v70.int ai_family = a7;
  *(void *)&v70.uint64_t ai_socktype = 1LL;
  snprintf(__str, 8uLL, "%d", bswap32(a2) >> 16);
  int v14 = getaddrinfo(*a1, __str, &v70, &v69);
  unsigned int v15 = (FILE **)MEMORY[0x1895FEE10];
  if (v14)
  {
    int v16 = v14;
    int v17 = (FILE *)*MEMORY[0x1895FEE10];
    unsigned int v18 = gai_strerror(v14);
    fprintf(v17, "rcmd: getaddrinfo: %s\n", v18);
    if (v16 == 11)
    {
      unsigned int v19 = *v15;
      uint64_t v20 = __error();
      uint64_t v21 = strerror(*v20);
      fprintf(v19, "rcmd: getaddrinfo: %s\n", v21);
    }

    return -1;
  }

  ai_next = v69;
  ai_canonname = v69->ai_canonname;
  if (ai_canonname && strlen(v69->ai_canonname) + 1 <= 0x400) {
    *a1 = strncpy(rcmd_af_canonnamebuf, ai_canonname, 0x401uLL);
  }
  __int128 v65 = a5;
  __int128 v66 = a6;
  int v24 = 1;
  uint64_t v25 = ai_next;
  do
  {
    uint64_t v25 = v25->ai_next;
    --v24;
  }

  while (v25);
  int v26 = (FILE *)sigblock(0x8000);
  int v27 = 0;
  int v67 = 1023;
  int v28 = 1;
LABEL_10:
  in_addr_t v29 = ai_next;
  do
  {
    while (1)
    {
      int v30 = rresvport_af(&v67, v29->ai_family);
      if (v30 < 0) {
        break;
      }
      fcntl_NOCANCEL();
      if ((connect_NOCANCEL() & 0x80000000) == 0)
      {
        if (v66)
        {
          int v33 = rresvport_af(&v67, v29->ai_family);
          if ((v33 & 0x80000000) == 0)
          {
            int v34 = v33;
            listen(v33, 1);
            int v64 = v67;
            snprintf(__s, 8uLL, "%d", v67);
            strlen(__s);
            uint64_t v35 = write_NOCANCEL();
            if (v35 == strlen(__s) + 1)
            {
              if (v30 <= v34) {
                unsigned int v36 = v34;
              }
              else {
                unsigned int v36 = v30;
              }
              if (v36 <= 0x3FF)
              {
                int v48 = 1 << v34;
                uint64_t v49 = v34 >> 5;
                while (1)
                {
                  memset(v68, 0, sizeof(v68));
                  if (__darwin_check_fd_set_overflow(v30, v68, 0)) {
                    *((_DWORD *)v68 + (v30 >> 5)) |= 1 << v30;
                  }
                  if (__darwin_check_fd_set_overflow(v34, v68, 0)) {
                    *((_DWORD *)v68 + v49) |= v48;
                  }
                  *__error() = 0;
                  if ((int)select_NOCANCEL() < 1
                    || !__darwin_check_fd_set_overflow(v34, v68, 0)
                    || (*((_DWORD *)v68 + v49) & v48) == 0)
                  {
                    unint64_t v52 = __error();
                    __int128 v53 = (FILE *)*MEMORY[0x1895FEE10];
                    if (*v52)
                    {
                      uint64_t v54 = __error();
                      uint64_t v55 = strerror(*v54);
                      fprintf(v53, "rcmd: select (setting up stderr): %s\n", v55);
                    }

                    else
                    {
                      fwrite("select: protocol failure in circuit setup\n", 0x2AuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
                    }

                    goto LABEL_68;
                  }

                  int v50 = accept_NOCANCEL();
                  if (BYTE1(v74) != 30 && BYTE1(v74) != 2) {
                    break;
                  }
                  if (WORD1(v74) != 5120)
                  {
                    __int16 v57 = __rev16(WORD1(v74));
                    goto LABEL_75;
                  }

                  close_NOCANCEL();
                }

                __int16 v57 = 0;
LABEL_75:
                close_NOCANCEL();
                uint64_t v38 = v65;
                int v37 = v64;
                if (v50 < 0)
                {
                  rmtcallargs v60 = (FILE *)*MEMORY[0x1895FEE10];
                  unsigned __int16 v61 = __error();
                  unsigned int v62 = strerror(*v61);
                  fprintf(v60, "rcmd: accept: %s\n", v62);
                  goto LABEL_69;
                }

                *__int128 v66 = v50;
                if ((v57 & 0xFE00) == 0x200) {
                  goto LABEL_39;
                }
                fwrite("socket: protocol failure in circuit setup.\n", 0x2BuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
                if (!v64) {
                  goto LABEL_69;
                }
              }

              else
              {
                fwrite("rcmd: too many files\n", 0x15uLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
              }
            }

            else
            {
              uint64_t v39 = (FILE *)*MEMORY[0x1895FEE10];
              uint64_t v40 = __error();
              uint64_t v41 = strerror(*v40);
              fprintf(v39, "rcmd: write (setting up stderr): %s\n", v41);
            }

            goto LABEL_68;
          }
        }

        else
        {
          write_NOCANCEL();
          int v37 = 0;
          uint64_t v38 = v65;
LABEL_39:
          strlen(a3);
          write_NOCANCEL();
          strlen(a4);
          write_NOCANCEL();
          strlen(v38);
          write_NOCANCEL();
          if (read_NOCANCEL() == 1)
          {
            if (!__s[0])
            {
              sigsetmask((int)v26);
              freeaddrinfo(v69);
              return v30;
            }

            do
            {
              if (read_NOCANCEL() != 1) {
                break;
              }
              write_NOCANCEL();
            }

            while (__s[0] != 10);
          }

          else
          {
            int v42 = (int)v26;
            int v26 = (FILE *)*MEMORY[0x1895FEE10];
            int v43 = *a1;
            unsigned int v44 = __error();
            uint64_t v63 = strerror(*v44);
            int v45 = v26;
            LODWORD(v26) = v42;
            fprintf(v45, "rcmd: %s: %s\n", v43, v63);
          }

          if (v37) {
LABEL_68:
          }
            close_NOCANCEL();
        }

LABEL_69:
        close_NOCANCEL();
        sigsetmask((int)v26);
        freeaddrinfo(v69);
        return -1;
      }

      close_NOCANCEL();
      if (*__error() != 48)
      {
        if (*__error() == 61) {
          int v27 = 1;
        }
        ai_next = v29->ai_next;
        if (!ai_next && (!v27 || v28 >= 17))
        {
          rpc_msg v58 = (FILE *)*MEMORY[0x1895FEE10];
          uint64_t v59 = __error();
          strerror(*v59);
          fprintf(v58, "%s: %s\n");
          goto LABEL_63;
        }

        if (v24)
        {
          int v31 = v26;
          int v32 = *__error();
          getnameinfo(v29->ai_addr, v29->ai_addrlen, v72, 0x401u, 0LL, 0, 34);
          fprintf((FILE *)*MEMORY[0x1895FEE10], "connect to address %s: ", v72);
          *__error() = v32;
          int v26 = v31;
          perror(0LL);
          ai_next = v29->ai_next;
          if (ai_next)
          {
LABEL_25:
            if (!v24) {
              goto LABEL_10;
            }
LABEL_29:
            getnameinfo(ai_next->ai_addr, ai_next->ai_addrlen, v72, 0x401u, 0LL, 0, 34);
            fprintf((FILE *)*MEMORY[0x1895FEE10], "Trying %s...\n", v72);
            goto LABEL_10;
          }
        }

        else if (ai_next)
        {
          goto LABEL_25;
        }

        uint64_t v74 = v28;
        uint64_t v75 = 0LL;
        nanosleep_NOCANCEL();
        int v27 = 0;
        v28 *= 2;
        ai_next = v69;
        if (!v24) {
          goto LABEL_10;
        }
        goto LABEL_29;
      }

      --v67;
    }

    if (*__error() == 35) {
      break;
    }
    in_addr_t v29 = v29->ai_next;
  }

  while (v29);
  int v46 = __error();
  unsigned int v47 = (FILE *)*MEMORY[0x1895FEE10];
  if (*v46 == 35)
  {
    fwrite("rcmd: socket: All ports in use\n", 0x1FuLL, 1uLL, (FILE *)*MEMORY[0x1895FEE10]);
  }

  else
  {
    uint64_t v51 = __error();
    strerror(*v51);
    fprintf(v47, "rcmd: socket: %s\n");
  }

int rresvport_af(int *a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  memset(v6, 0, sizeof(v6));
  v6[0].int sa_family = a2;
  if (a2 == 30)
  {
    v6[0].sa_len = 28;
    *(in6_addr *)&v6[0].sa_data[6] = in6addr_any;
  }

  else
  {
    if (a2 != 2)
    {
      *__error() = 47;
      return -1;
    }

    v6[0].sa_len = 16;
  }

  int v3 = socket(a2, 1, 0);
  if (v3 < 0) {
    return -1;
  }
  int v4 = v3;
  *(_WORD *)v6[0].sa_data = 0;
  if (bindresvport_sa(v3, v6) == -1)
  {
    close_NOCANCEL();
    return -1;
  }

  *a1 = bswap32(*(unsigned __int16 *)v6[0].sa_data) >> 16;
  return v4;
}

int rcmd(char **a1, int a2, const char *a3, const char *a4, const char *a5, int *a6)
{
  return rcmd_af(a1, (unsigned __int16)a2, a3, a4, a5, a6, 2);
}

int rresvport(int *a1)
{
  return rresvport_af(a1, 2);
}

int iruserok_sa(const void *a1, int a2, int a3, const char *a4, const char *a5)
{
  socklen_t v9 = v8;
  uint64_t v26 = *MEMORY[0x1895FEE08];
  if (v8 > 0x80) {
    return -1;
  }
  unint64_t v11 = v7;
  unsigned int v12 = v6;
  int v13 = v5;
  __memcpy_chk();
  if (v13) {
    int v14 = 0LL;
  }
  else {
    int v14 = fopen("/etc/hosts.equiv", "r");
  }
  char v15 = 1;
  while (1)
  {
    if (v14)
    {
      if (!__ivaliduser_sa(v14, &v24, v9, v11, v12))
      {
        int v10 = 0;
        goto LABEL_27;
      }

      fclose(v14);
    }

    if ((v15 & 1) == 0) {
      return -1;
    }
    if (!(__check_rhosts_file | v13)) {
      return -1;
    }
    memset(&v21, 0, sizeof(v21));
    bzero(v23, 0x1985uLL);
    uint64_t v20 = 0LL;
    if (getpwnam_r(v11, &v21, v23, 0x1985uLL, &v20)) {
      return -1;
    }
    __strcpy_chk();
    __strcat_chk();
    uid_t v16 = geteuid();
    seteuid(v20->pw_uid);
    int v14 = fopen(v25, "r");
    seteuid(v16);
    if (!v14) {
      return -1;
    }
    if (lstat(v25, &v22) < 0)
    {
      unsigned int v18 = ".rhosts lstat failed";
      goto LABEL_26;
    }

    if ((v22.st_mode & 0xF000) != 0x8000)
    {
      unsigned int v18 = ".rhosts not regular file";
      goto LABEL_26;
    }

    int v17 = fileno(v14);
    if (fstat(v17, &v22) < 0)
    {
      unsigned int v18 = ".rhosts fstat failed";
      goto LABEL_26;
    }

    if (v22.st_uid && v22.st_uid != v20->pw_uid) {
      break;
    }
    char v15 = 0;
    if ((v22.st_mode & 0x12) != 0)
    {
      unsigned int v18 = ".rhosts writeable by other than owner";
      goto LABEL_26;
    }
  }

  unsigned int v18 = "bad .rhosts owner";
LABEL_26:
  __rcmd_errstr = (uint64_t)v18;
  int v10 = -1;
LABEL_27:
  fclose(v14);
  return v10;
}

uint64_t __ivaliduser_sa(FILE *a1, sockaddr *a2, socklen_t a3, const char *a4, const char *a5)
{
  *(void *)&v35[382] = *MEMORY[0x1895FEE08];
  getnameinfo(a2, a3, v32, 0x100u, 0LL, 0, 4);
  int v10 = 0;
  int v11 = 0;
  unsigned int v12 = &v34;
  int v13 = v35;
  do
  {
    while (1)
    {
LABEL_2:
      if (!fgets(&__s, 384, a1)) {
        return 0xFFFFFFFFLL;
      }
      if (strchr(&__s, 10)) {
        break;
      }
      do
        int v21 = getc(a1);
      while (v21 != 10 && v21 != -1);
    }

    __darwin_ct_rune_t v14 = __s;
  }

  while (__s == 10 || __s == 35);
  int v31 = v13;
  char v15 = v12;
  uid_t v16 = a4;
  int v17 = a5;
  p_s = &__s;
  int v30 = v15;
  unsigned int v19 = (char *)v15;
  while (v14 <= 9)
  {
    if (!v14) {
      goto LABEL_22;
    }
    if (v14 == 9) {
      goto LABEL_23;
    }
LABEL_13:
    if ((v14 & 0x80) == 0)
    {
LABEL_15:
      LOBYTE(v14) = __tolower(v14);
      goto LABEL_16;
    }

    if (__maskrune(v14, 0x8000uLL)) {
      goto LABEL_15;
    }
LABEL_16:
    char *p_s = v14;
    __darwin_ct_rune_t v20 = *++p_s;
    __darwin_ct_rune_t v14 = v20;
    ++v19;
  }

  if (v14 == 10)
  {
LABEL_22:
    stat v22 = p_s;
    goto LABEL_34;
  }

  if (v14 != 32) {
    goto LABEL_13;
  }
LABEL_23:
  char *p_s = 0;
  while (1)
  {
    int v23 = *v19;
    if (v23 != 32 && v23 != 9) {
      break;
    }
    ++v19;
  }

  stat v22 = v19;
  while (v23 > 0x20u || ((1LL << v23) & 0x100000601LL) == 0)
  {
    char v25 = *++v22;
    LOBYTE(v23) = v25;
  }

  p_s = v19;
LABEL_34:
  *stat v22 = 0;
  a5 = v17;
  if (__s == 45)
  {
    a4 = v16;
    if (v34 == 64)
    {
      unsigned int v12 = v30;
      if (!innetgr(v31, v32, 0LL, 0LL)) {
        goto LABEL_48;
      }
    }

    else
    {
      unsigned int v12 = v30;
    }
  }

  else
  {
    a4 = v16;
    if (__s == 43)
    {
      unsigned int v12 = v30;
      if (v34)
      {
        if (v34 == 64) {
          int v26 = innetgr(v31, v32, 0LL, 0LL);
        }
        else {
          int v26 = __icheckhost(a2, a3, v30);
        }
        int v11 = v26;
      }

      else
      {
        int v11 = 1;
      }
    }

    else
    {
      int v11 = __icheckhost(a2, a3, &__s);
      unsigned int v12 = v30;
    }

LABEL_48:
    int v27 = *p_s;
    if (v27 != 45)
    {
      if (v27 == 43)
      {
        int v28 = p_s + 1;
        if (!p_s[1])
        {
          int v10 = 1;
          goto LABEL_65;
        }

        if (p_s[1] == 64)
        {
          int v10 = innetgr(p_s + 2, 0LL, a5, 0LL);
          goto LABEL_65;
        }
      }

      else
      {
        if (!v11) {
          goto LABEL_65;
        }
        if (*p_s) {
          int v28 = p_s;
        }
        else {
          int v28 = a4;
        }
      }

      int v10 = strcmp(a5, v28) == 0;
      goto LABEL_65;
    }

    if (!v11) {
      goto LABEL_65;
    }
    if (p_s[1] != 64)
    {
      if (!p_s[1] || !strcmp(a5, p_s + 1)) {
        return 0xFFFFFFFFLL;
      }
LABEL_65:
      int v13 = v31;
      if (v11 && v10) {
        return 0LL;
      }
      goto LABEL_2;
    }

    if (!innetgr(p_s + 2, 0LL, a5, 0LL)) {
      goto LABEL_65;
    }
  }

  return 0xFFFFFFFFLL;
}

int ruserok(const char *a1, int a2, const char *a3, const char *a4)
{
  v12.uint64_t ai_socktype = 2;
  if (getaddrinfo(a1, "0", &v12, &v11)) {
    return -1;
  }
  unsigned int v8 = v11;
  if (v11)
  {
    while (iruserok_sa(v8->ai_addr, v8->ai_addrlen, a2, a3, a4))
    {
      unsigned int v8 = v8->ai_next;
      if (!v8)
      {
        int v7 = -1;
        goto LABEL_9;
      }
    }

    int v7 = 0;
LABEL_9:
    socklen_t v9 = v11;
  }

  else
  {
    socklen_t v9 = 0LL;
    int v7 = -1;
  }

  freeaddrinfo(v9);
  return v7;
}

int iruserok(unint64_t a1, int a2, const char *a3, const char *a4)
{
  uint64_t v7 = *MEMORY[0x1895FEE08];
  uint64_t v6 = 0LL;
  v5[0] = 528;
  v5[1] = a1;
  return iruserok_sa(v5, 16, a2, a3, a4);
}

uint64_t __icheckhost(sockaddr *a1, socklen_t a2, const char *a3)
{
  int v4 = a1;
  unsigned int v13[2] = *MEMORY[0x1895FEE08];
  if (a1->sa_family == 30
    && !*(_DWORD *)&a1->sa_data[6]
    && !*(_DWORD *)&a1->sa_data[10]
    && *(_DWORD *)&a1[1].sa_len == -65536)
  {
    v13[0] = 528LL;
    v13[1] = 0LL;
    HIDWORD(v13[0]) = *(_DWORD *)&a1[1].sa_data[2];
    int v4 = (sockaddr *)v13;
    a2 = 16;
  }

  __s1[0] = 0;
  uint64_t v5 = 0LL;
  if (!getnameinfo(v4, a2, __s1, 0x401u, 0LL, 0, 34))
  {
    memset(&v10, 0, sizeof(v10));
    v10.int ai_family = v4->sa_family;
    v10.uint64_t ai_socktype = 2;
    socklen_t v9 = 0LL;
    if (getaddrinfo(a3, "0", &v10, &v9))
    {
      return 0LL;
    }

    else
    {
      uint64_t v6 = v9;
      if (v9)
      {
        while (1)
        {
          __s2[0] = 0;
          if (!getnameinfo(v6->ai_addr, v6->ai_addrlen, __s2, 0x401u, 0LL, 0, 34) && !strcmp(__s1, __s2)) {
            break;
          }
          uint64_t v6 = v6->ai_next;
          if (!v6)
          {
            uint64_t v5 = 0LL;
            goto LABEL_16;
          }
        }

        uint64_t v5 = 1LL;
LABEL_16:
        uint64_t v7 = v9;
      }

      else
      {
        uint64_t v7 = 0LL;
        uint64_t v5 = 0LL;
      }

      freeaddrinfo(v7);
    }
  }

  return v5;
}

int ether_line(const char *a1, ether_addr *a2, char *a3)
{
  uint64_t v8 = *MEMORY[0x1895FEE08];
  int v4 = sscanf(a1, " %x:%x:%x:%x:%x:%x %s", v7, &v7[1], &v7[2], &v7[3], &v7[4], &v7[5], a3);
  if (v4 != 7) {
    return 7 - v4;
  }
  for (uint64_t i = 0LL; i != 6; ++i)
    a2->octet[i] = v7[i];
  return 0;
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  uint64_t result = (char *)ether_ntoa_s;
  if (ether_ntoa_s || (uint64_t result = (char *)malloc(0x12uLL), (ether_ntoa_s = (uint64_t)result) != 0))
  {
    *uint64_t result = 0;
    snprintf( result,  0x12uLL,  "%x:%x:%x:%x:%x:%x",  a1->octet[0],  a1->octet[1],  a1->octet[2],  a1->octet[3],  a1->octet[4],  a1->octet[5]);
    return (char *)ether_ntoa_s;
  }

  return result;
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  if (ether_aton_ep || (uint64_t result = (ether_addr *)calloc(1uLL, 6uLL), (ether_aton_ep = (uint64_t)result) != 0))
  {
    if (sscanf(a1, " %x:%x:%x:%x:%x:%x", v4, &v4[1], &v4[2], &v4[3], &v4[4], &v4[5]) == 6)
    {
      uint64_t v3 = 0LL;
      uint64_t result = (ether_addr *)ether_aton_ep;
      do
      {
        result->octet[v3] = v4[v3];
        ++v3;
      }

      while (v3 != 6);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

int getifmaddrs(ifmaddrs **a1)
{
  uint64_t v33 = *MEMORY[0x1895FEE08];
  *(_OWORD *)int v31 = xmmword_1804DCA60;
  uint64_t v32 = 6LL;
  if (sysctl(v31, 6u, 0LL, &__size, 0LL, 0LL) < 0) {
    return -1;
  }
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v3 = (unsigned __int16 *)malloc(__size);
    if (!v3) {
      return -1;
    }
    int v4 = v3;
    if ((sysctl(v31, 6u, v3, &__size, 0LL, 0LL) & 0x80000000) == 0) {
      break;
    }
    if (*__error() != 12 || i >= 4) {
      goto LABEL_50;
    }
    free(v4);
    if (sysctl(v31, 6u, 0LL, &__size, 0LL, 0LL) < 0) {
      return -1;
    }
  }

  int64_t v6 = __size;
  if ((uint64_t)__size < 1)
  {
    int v7 = 0;
    int v8 = 1;
  }

  else
  {
    int v7 = 0;
    int v8 = 1;
    socklen_t v9 = v4;
    do
    {
      if (*((_BYTE *)v9 + 2) == 5 && *((_BYTE *)v9 + 3) == 19 && (*((_DWORD *)v9 + 1) & 0x20) != 0)
      {
        int v10 = 0;
        int v11 = v9 + 10;
        do
        {
          if ((((*((_DWORD *)v9 + 1) & 0x32u) >> v10) & 1) != 0)
          {
            if (*v11) {
              uint64_t v12 = (*v11 + 3) & 0x1FC;
            }
            else {
              uint64_t v12 = 4LL;
            }
            v7 += v12;
            v11 += v12;
          }

          ++v10;
        }

        while (v10 != 8);
        ++v8;
      }

      socklen_t v9 = (unsigned __int16 *)((char *)v9 + *v9);
    }

    while (v9 < (unsigned __int16 *)((char *)v4 + __size));
  }

  size_t v13 = 32LL * v8;
  __darwin_ct_rune_t v14 = (ifmaddrs *)malloc(v13 + v7);
  if (!v14)
  {
LABEL_50:
    free(v4);
    return -1;
  }

  char v15 = v14;
  bzero(v14, v13);
  if (v6 <= 0)
  {
    free(v4);
    goto LABEL_54;
  }

  int v26 = v15;
  int v27 = a1;
  uid_t v16 = (char *)&v15[v13 / 0x20];
  int v17 = v15;
  unsigned int v18 = v4;
  do
  {
    if (*((_BYTE *)v18 + 2) == 5 && *((_BYTE *)v18 + 3) == 19 && (v18[2] & 0x20) != 0)
    {
      int v19 = 0;
      __darwin_ct_rune_t v20 = v18 + 10;
      int v28 = v17;
      p_ifma_addr = &v17->ifma_addr;
      p_ifma_name = &v17->ifma_name;
      p_ifma_lladdr = &v17->ifma_lladdr;
      while (((1 << v19) & 0x32 & *((_DWORD *)v18 + 1)) == 0)
      {
LABEL_45:
        if (++v19 == 8)
        {
          v28->ifma_next = v28 + 1;
          int64_t v6 = __size;
          int v17 = v28 + 1;
          goto LABEL_47;
        }
      }

      if (*v20) {
        size_t v23 = (*v20 + 3) & 0x1FC;
      }
      else {
        size_t v23 = 4LL;
      }
      sockaddr v24 = (char **)p_ifma_lladdr;
      if (v19 != 1)
      {
        if (v19 == 5)
        {
          sockaddr v24 = (char **)p_ifma_addr;
        }

        else
        {
          sockaddr v24 = (char **)p_ifma_name;
          if (v19 != 4) {
            goto LABEL_44;
          }
        }
      }

      *sockaddr v24 = v16;
      memcpy(v16, v20, v23);
LABEL_44:
      v16 += v23;
      v20 += v23;
      goto LABEL_45;
    }

LABEL_47:
    unsigned int v18 = (unsigned __int16 *)((char *)v18 + *v18);
  }

  while (v18 < (unsigned __int16 *)((char *)v4 + v6));
  free(v4);
  char v15 = v26;
  a1 = v27;
  if (v17 > v26)
  {
    int result = 0;
    v17[-1].ifma_next = 0LL;
    unsigned __int8 *v27 = v26;
    return result;
  }

LABEL_54:
  *a1 = 0LL;
  free(v15);
  return 0;
}

uint64_t getnameinfo_link(uint64_t a1, int a2, char *__str, size_t __size, _BYTE *a5, uint64_t a6)
{
  size_t v6 = __size;
  if (a5 && a6) {
    *a5 = 0;
  }
  uint64_t v8 = *(unsigned __int8 *)(a1 + 5);
  uint64_t v9 = *(unsigned __int8 *)(a1 + 6);
  if (*(_BYTE *)(a1 + 5))
  {
    *__str = 0;
    if ((_DWORD)v9)
    {
      uint64_t v10 = a1 + v8 + 8;
      goto LABEL_9;
    }

    return 0LL;
  }

  if (*(_BYTE *)(a1 + 6))
  {
    uint64_t v10 = a1 + v8 + 8;
    *__str = 0;
LABEL_9:
    uint64_t v11 = 0LL;
    uint64_t v12 = __str;
    while (1)
    {
      size_t v13 = v11 ? ":" : "";
      unsigned int v14 = snprintf(v12, v6, "%s%02x", v13, *(unsigned __int8 *)(v10 + v11));
      if ((v14 & 0x80000000) != 0 || v6 <= v14) {
        break;
      }
      v12 += v14;
      v6 -= v14;
      if (v9 == ++v11) {
        return 0LL;
      }
    }

    goto LABEL_20;
  }

  if (!*(_BYTE *)(a1 + 7))
  {
    if (snprintf(__str, __size, "link#%d", *(unsigned __int16 *)(a1 + 2)) > __size)
    {
LABEL_20:
      uint64_t result = 6LL;
      goto LABEL_21;
    }

    return 0LL;
  }

  uint64_t result = 0LL;
LABEL_21:
  *__str = 0;
  return result;
}

char *configuration_profile_create_notification_key(char *result)
{
  uint64_t v1 = 0LL;
  if (result)
  {
    if (*result == 47)
    {
      asprintf(&v1, "%s%s");
    }

    else
    {
      if (strchr(result + 1, 47)) {
        return 0LL;
      }
      asprintf(&v1, "%s%s/%s.plist");
    }

    return v1;
  }

  return result;
}

uint64_t configuration_profile_copy_property_list(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895FEE08];
  if (!a1) {
    return 0LL;
  }
  __str[0] = 0;
  if (*(_BYTE *)a1 == 47)
  {
    snprintf(__str, 0x400uLL, "%s");
  }

  else
  {
    snprintf(__str, 0x400uLL, "%s/%s.plist");
  }

  if (!__str[0]) {
    return 0LL;
  }
  int v1 = open_NOCANCEL();
  if (v1 < 0) {
    return 0LL;
  }
  int v2 = v1;
  memset(&v7, 0, sizeof(v7));
  if (fstat(v1, &v7) < 0 || (uint64_t v3 = mmap(0LL, v7.st_size, 1, 2, v2, 0LL), v3 == (void *)-1LL))
  {
    uint64_t v5 = 0LL;
  }

  else
  {
    int v4 = v3;
    uint64_t v5 = xpc_create_from_plist();
    munmap(v4, v7.st_size);
  }

  close_NOCANCEL();
  return v5;
}

void si_list_add_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0("si_item_retain", "si_data.c", a3, "rc >= 1");
}

void si_list_retain_cold_1()
{
  __assert_rtn("si_list_retain", "si_data.c", 138, "rc >= 1");
}

void si_list_release_cold_1()
{
  __assert_rtn("si_list_release", "si_data.c", 152, "rc >= 0");
}

void si_item_release_cold_1()
{
  __assert_rtn("si_item_release", "si_data.c", 189, "rc >= 0");
}

void si_set_nat64_v4_requires_synthesis_cold_1()
{
}

void si_set_nat64_v4_synthesize_cold_1()
{
}

void si_set_path_check_cold_1()
{
}

void _gai_nat64_can_v4_address_be_synthesized_cold_1()
{
}

void _gai_load_libnetwork_once_cold_1(const char *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895FEE08];
  uint64_t v2 = "?";
  if (a1) {
    uint64_t v2 = a1;
  }
  int v3 = 136446210;
  uint64_t v4 = v2;
  _os_log_error_impl( &dword_1804BA000,  a2,  OS_LOG_TYPE_ERROR,  "dlopen(...libnetwork.dylib) failed: %{public}s",  (uint8_t *)&v3,  0xCu);
}

void _gai_load_libnetwork_once_cold_2()
{
}

void _gai_load_libnetwork_once_cold_3()
{
}

void _gai_load_libnetwork_once_cold_4()
{
}

void _gai_load_libnetwork_once_cold_5()
{
}

void _muser_call_cold_1(int a1)
{
  uint64_t v2 = *MEMORY[0x1895FEE08];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl( &dword_1804BA000,  MEMORY[0x189600830],  OS_LOG_TYPE_ERROR,  "_muser_call: Failure (%d) with retry, bailing",  (uint8_t *)v1,  8u);
}

void _muser_call_cold_2(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_debug_impl( &dword_1804BA000,  MEMORY[0x189600830],  OS_LOG_TYPE_DEBUG,  "_muser_call: Error from xpc pipe (%d), retrying",  buf,  8u);
}

void _muser_xpc_pipe_cold_1(int a1)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  v1[0] = 67109378;
  v1[1] = a1;
  __int16 v2 = 2080;
  uint64_t v3 = xpc_strerror();
  _os_log_error_impl( &dword_1804BA000,  MEMORY[0x189600830],  OS_LOG_TYPE_ERROR,  "xpc_user_sessions_get_foreground_uid() failed with error %d - %s",  (uint8_t *)v1,  0x12u);
}

void si_destination_create_control_socket_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_create_control_socket_cold_2()
{
}

void si_destination_create_control_socket_cold_3()
{
}

void si_destination_create_control_socket_cold_4()
{
}

void si_destination_create_control_socket_cold_5()
{
}

void si_destination_create_control_socket_cold_6()
{
  OUTLINED_FUNCTION_7(&dword_1804BA000, v0, v1, "connect(%d, ...) ctl_id=%u, failed: %m", v2, v3);
  OUTLINED_FUNCTION_5();
}

void si_destination_create_control_socket_cold_7()
{
}

void si_destination_compare_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_cold_3()
{
}

void si_destination_compare_cold_4()
{
}

void si_destination_compare_cold_5( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_cold_6()
{
}

void si_destination_compare_cold_7()
{
}

void si_destination_compare_cold_8()
{
}

void si_destination_compare_cold_9()
{
}

void si_destination_compare_cold_10()
{
}

void si_destination_compare_cold_11()
{
}

void si_destination_compare_cold_12()
{
}

void si_destination_compare_cold_13()
{
}

void si_destination_compare_cold_14()
{
}

void si_destination_compare_cold_15()
{
}

void si_destination_compare_cold_16()
{
}

void si_destination_compare_cold_17()
{
}

void si_destination_compare_cold_18()
{
}

void si_destination_compare_cold_19()
{
}

void si_destination_compare_cold_20()
{
}

void si_destination_compare_cold_21()
{
}

void si_destination_compare_cold_22()
{
}

void si_destination_compare_cold_23()
{
}

void si_destination_compare_cold_24()
{
}

void si_destination_compare_cold_25()
{
}

void si_destination_compare_cold_26()
{
}

void si_destination_compare_cold_27()
{
}

void si_destination_compare_cold_28()
{
}

void si_destination_compare_cold_29()
{
}

void si_destination_compare_cold_30()
{
}

void si_destination_compare_cold_31()
{
}

void si_destination_compare_cold_32()
{
}

void si_destination_compare_cold_33()
{
}

void si_destination_compare_cold_34(unsigned int a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  int v2 = 134217984;
  double v3 = (double)a1 * 0.03125;
  _os_log_debug_impl(&dword_1804BA000, a2, OS_LOG_TYPE_DEBUG, "no preference, equal min rtt %f", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

void si_destination_compare_cold_35( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_no_dependencies_cold_1( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_no_dependencies_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_compare_no_dependencies_cold_3()
{
}

void si_destination_compare_no_dependencies_cold_4()
{
}

void si_destination_compare_no_dependencies_cold_5()
{
}

void si_destination_compare_no_dependencies_cold_6()
{
}

void si_destination_lookup_cold_1(unsigned __int8 a1, os_log_s *a2)
{
  uint64_t v3 = *MEMORY[0x1895FEE08];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl( &dword_1804BA000,  a2,  OS_LOG_TYPE_ERROR,  "(dst_sa->sa_len %u > sizeof(cache_entry->dce_entry.d_dst.addr))",  (uint8_t *)v2,  8u);
  OUTLINED_FUNCTION_1();
}

void si_destination_lookup_cold_2(os_log_t log)
{
  uint64_t v4 = *MEMORY[0x1895FEE08];
  int v1 = 134218242;
  uint64_t v2 = 112LL;
  __int16 v3 = 96;
  _os_log_error_impl(&dword_1804BA000, log, OS_LOG_TYPE_ERROR, "calloc(%zu) failed: %m", (uint8_t *)&v1, 0xEu);
  OUTLINED_FUNCTION_5();
}

void si_destination_fill_netsrc_cold_1()
{
}

void si_destination_fill_netsrc_cold_2( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void si_destination_fill_netsrc_cold_4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void svc_run(void)
{
  do
  {
    while (1)
    {
      do
      {
        memcpy(&v1, &svc_fdset, sizeof(v1));
        int v0 = select_NOCANCEL();
      }

      while (!v0);
      if (v0 == -1) {
        break;
      }
      svc_getreqset(&v1);
    }
  }

  while (*__error() == 4);
  perror("svc_run: - select failed");
}

void xdrrec_create_cold_1(void **a1, void *a2)
{
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return MEMORY[0x1895FF5C8](sdRef);
}

DNSServiceErrorType DNSServiceProcessResult(DNSServiceRef sdRef)
{
  return MEMORY[0x1895FF5D0](sdRef);
}

DNSServiceErrorType DNSServiceQueryRecordWithAttribute( DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t ifindex, const char *name, uint16_t rrtype, uint16_t rrclass, const DNSServiceAttribute *attr, DNSServiceQueryRecordReply callback, void *context)
{
  return MEMORY[0x1895FF5D8](sdRef, *(void *)&flags, *(void *)&ifindex, name, rrtype, rrclass, attr, callback);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

dnssd_sock_t DNSServiceRefSockFD(DNSServiceRef sdRef)
{
  return MEMORY[0x1895FF5E8](sdRef);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x1895FF6C0](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1895FF6D0]();
}

uint64_t __initgroups()
{
  return MEMORY[0x1895FF720]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895FEDD0](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895FEDD8]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1895FEDE0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895FEDE8]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1895FEE20]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1895FEE28]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895FEE30]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895FEE38]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895FEE48](*(void *)&a1);
}

uint64_t _inet_aton_check()
{
  return MEMORY[0x1895FEE50]();
}

void _os_log_debug_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl( void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

uint64_t accept_NOCANCEL()
{
  return MEMORY[0x1895FF900]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1895FEF38]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895FEF50](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1895FEF60](a1);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1895FF918](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x189600258](__count, __size);
}

uint64_t close_NOCANCEL()
{
  return MEMORY[0x1895FF968]();
}

int closedir(DIR *a1)
{
  return MEMORY[0x1895FEFB8](a1);
}

uint64_t connect_NOCANCEL()
{
  return MEMORY[0x1895FF978]();
}

char *__cdecl devname_r(dev_t a1, mode_t a2, char *buf, int len)
{
  return (char *)MEMORY[0x1895FEFD8](*(void *)&a1, a2, buf, *(void *)&len);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FE940](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x1895FEC70](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1895FEC78]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1895FEC80](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FEC88](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FF000](a1);
}

uint64_t fcntl_NOCANCEL()
{
  return MEMORY[0x1895FF9E0]();
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FF028](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FF030](a1, *(void *)&a2, a3);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FF038](a1);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1895FFA18](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FF068](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF070](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FF080](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF088](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FF090](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FFA50](*(void *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FF0A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FF0D8](__ptr, __size, __nitems, __stream);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FF0E0](a1);
}

gid_t getegid(void)
{
  return MEMORY[0x1895FFA98]();
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FF0E8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FFAA8]();
}

int getgroups(int a1, gid_t a2[])
{
  return MEMORY[0x1895FFAC0](*(void *)&a1, a2);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x1895FF0F0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1895FFAE0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x1895FFB00](*(void *)&a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return MEMORY[0x1895FFB08](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FF108](a1, a2);
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1895FFB48](*(void *)&host, multiuser_flags);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return MEMORY[0x1895FF118](a1, a2);
}

in_addr inet_makeaddr(in_addr_t a1, in_addr_t a2)
{
  return (in_addr)MEMORY[0x1895FF120](*(void *)&a1, *(void *)&a2);
}

in_addr_t inet_netof(in_addr a1)
{
  return MEMORY[0x1895FF128](*(void *)&a1.s_addr);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1895FF130](*(void *)&a1, a2, a3, *(void *)&a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return MEMORY[0x1895FF138](*(void *)&a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1895FFB78](*(void *)&a1, a2);
}

int issetugid(void)
{
  return MEMORY[0x1895FFB80]();
}

int kevent( int kq, const kevent *changelist, int nchanges, kevent *eventlist, int nevents, const timespec *timeout)
{
  return MEMORY[0x1895FFB90](*(void *)&kq, changelist, *(void *)&nchanges, eventlist, *(void *)&nevents, timeout);
}

int kqueue(void)
{
  return MEMORY[0x1895FFBD8]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x1895FFBE0](*(void *)&a1, *(void *)&a2);
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FFBF0](*(void *)&a1, a2, *(void *)&a3);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FFBF8](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FFC00]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

mach_msg_return_t mach_msg( mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1895FFC90]( msg,  *(void *)&option,  *(void *)&send_size,  *(void *)&rcv_size,  *(void *)&rcv_name,  *(void *)&timeout,  *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1895FFCB0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_extract_right( ipc_space_t task, mach_port_name_t name, mach_msg_type_name_t msgt_name, mach_port_t *poly, mach_msg_type_name_t *polyPoly)
{
  return MEMORY[0x1895FFCD0](*(void *)&task, *(void *)&name, *(void *)&msgt_name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs( ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1895FFD10](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FFD58](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x189600278]();
}

int malloc_make_nonpurgeable(void *ptr)
{
  return MEMORY[0x1896002A0](ptr);
}

void malloc_make_purgeable(void *ptr)
{
}

void *__cdecl malloc_zone_calloc(malloc_zone_t *zone, size_t num_items, size_t size)
{
  return (void *)MEMORY[0x1896002F0](zone, num_items, size);
}

malloc_zone_t *__cdecl malloc_zone_from_ptr(const void *ptr)
{
  return (malloc_zone_t *)MEMORY[0x1896002F8](ptr);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)MEMORY[0x189600300](zone, ptr, size);
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

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1895FFE30](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1895FFE48](a1, a2);
}

uint64_t nanosleep_NOCANCEL()
{
  return MEMORY[0x1895FF1B0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x189600358](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x189600360](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x189600368](*(void *)&token, state64);
}

uint64_t notify_peek()
{
  return MEMORY[0x189600378]();
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x189600388](name, out_token);
}

uint64_t notify_register_plain()
{
  return MEMORY[0x189600398]();
}

uint64_t open_NOCANCEL()
{
  return MEMORY[0x1895FFE60]();
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1895FF1C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x189600890](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1896008B0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void perror(const char *a1)
{
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x189600628](a1, a2, a3);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1896006B0](a1);
}

int pthread_is_threaded_np(void)
{
  return MEMORY[0x1896006C0]();
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1896006C8](a1, a2);
}

int pthread_main_np(void)
{
  return MEMORY[0x1896006E0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1896006E8](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1896006F0](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1896006F8](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x189600708](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x189600710](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x189600740]();
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x189600758](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1895FF1E8](a1);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t read_NOCANCEL()
{
  return MEMORY[0x1895FFF50]();
}

int readdir_r(DIR *a1, dirent *a2, dirent **a3)
{
  return MEMORY[0x1895FF218](a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600320](__ptr, __size);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x189600330](__ptr, __size);
}

uint64_t recv_NOCANCEL()
{
  return MEMORY[0x1895FF228]();
}

uint64_t recvfrom_NOCANCEL()
{
  return MEMORY[0x1895FFF60]();
}

uint64_t select_NOCANCEL()
{
  return MEMORY[0x1895FFF78]();
}

uint64_t send_NOCANCEL()
{
  return MEMORY[0x1895FF260]();
}

uint64_t sendto_NOCANCEL()
{
  return MEMORY[0x1895FFFB0]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1895FFFC0](*(void *)&a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x189600000](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int sigblock(int a1)
{
  return MEMORY[0x1895FF278](*(void *)&a1);
}

int sigsetmask(int a1)
{
  return MEMORY[0x1895FF288](*(void *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FF2A0](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x189600030](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF2A8](a1, a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1895FF2B8](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x189600040](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x189600048](a1, a2);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1895FF2D8](__s1, __s2);
}

char *__cdecl strchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF2E0](__s, *(void *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1895FF2F0](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1895FF300](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FF308](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FF330](__s);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x1895FF338](a1, a2, a3);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1895FF348](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FF350](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1895FF360](__big, __little, __len);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FF370](__s, *(void *)&__c);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FF3A0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FF3E0](*(void *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1895FF3E8](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FF3F0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FF410](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1895FF460](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1895FF478](a1, a2, a3);
}

void warnx(const char *a1, ...)
{
}

uint64_t write_NOCANCEL()
{
  return MEMORY[0x189600210]();
}

uint64_t writev_NOCANCEL()
{
  return MEMORY[0x189600220]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1896009F8](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x189600A08](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x189600A20](xarray, index);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x189600AF8]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x189600B30](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x189600B40](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x189600B60](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x189600BA0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x189600C10](object);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x189600C20](xint);
}

uint64_t xpc_pipe_create()
{
  return MEMORY[0x189600C38]();
}

uint64_t xpc_pipe_create_with_user_session_uid()
{
  return MEMORY[0x189600C40]();
}

uint64_t xpc_pipe_invalidate()
{
  return MEMORY[0x189600C48]();
}

uint64_t xpc_pipe_routine()
{
  return MEMORY[0x189600C50]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x189600C68](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x189600C70]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x189600C88](xstring);
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x189600CA8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x189600CB0]();
}