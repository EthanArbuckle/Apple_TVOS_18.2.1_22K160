char *__cdecl ipsec_dump_policy(caddr_t a1, char *a2)
{
  return ipsec_dump_policy1();
}

char *ipsec_dump_policy1()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (!v0) {
    return 0LL;
  }
  v3 = (unsigned __int16 *)v0;
  if (*(_WORD *)(v0 + 2) != 18)
  {
    v13 = 0LL;
    int v31 = 12;
LABEL_40:
    __ipsec_errcode = v31;
    return v13;
  }

  if (v1) {
    v4 = v1;
  }
  else {
    v4 = " ";
  }
  unint64_t v5 = *(unsigned __int8 *)(v0 + 6);
  if (v5 >= 3)
  {
    v13 = 0LL;
    int v31 = 17;
    goto LABEL_40;
  }

  unint64_t v6 = *(unsigned __int16 *)(v0 + 4);
  if (v6 >= 6)
  {
    v13 = 0LL;
    int v31 = 5;
    goto LABEL_40;
  }

  int v7 = v2;
  v8 = (&ipsp_dir_strs)[v5];
  size_t v9 = strlen(v8);
  v10 = (&ipsp_policy_strs)[v6];
  size_t v11 = v9 + strlen(v10) + 2;
  v12 = (char *)malloc(v11);
  v13 = v12;
  if (!v12)
  {
    int v31 = 21;
    goto LABEL_40;
  }

  snprintf(v12, v11, "%s %s", v8, v10);
  if (v3[2] == 2)
  {
    unsigned int v14 = *v3;
    if (v14 >= 3)
    {
      unint64_t v15 = 8LL * *v3;
      unint64_t v16 = 16LL;
      do
        v16 += *(unsigned __int16 *)((char *)v3 + v16);
      while (v16 < v15);
      if (v16 == v15)
      {
        unint64_t v17 = 16LL;
        while (1)
        {
          v18 = (char *)v3 + v17;
          unint64_t v19 = v15 - v17;
          unint64_t v20 = *(unsigned __int16 *)((char *)v3 + v17);
          if (v19 < v20) {
            break;
          }
          int v21 = *((unsigned __int16 *)v18 + 1);
          switch(v21)
          {
            case '2':
              v22 = "esp";
              break;
            case 'l':
              v22 = "ipcomp";
              break;
            case '3':
              v22 = "ah";
              break;
            default:
              goto LABEL_51;
          }

          if ((unint64_t)v18[4] > 2)
          {
            int v34 = 8;
            goto LABEL_54;
          }

          __str[0] = 0;
          if (v20 >= 9)
          {
            uint64_t v23 = v18[8];
            v24 = (sockaddr *)&v18[v23 + 8];
            if (v23 + v24->sa_len + 8 != v20
              || !set_address(v38, (sockaddr *)(v18 + 8), v7)
              || !set_address(__s, v24, v7)
              || (size_t v25 = strlen(v38), v25 + strlen(__s) - 2051 < 0xFFFFFFFFFFFFF7FBLL))
            {
              int v34 = 6;
LABEL_54:
              __ipsec_errcode = v34;
              goto LABEL_47;
            }

            snprintf(__str, 0x804uLL, "%s-%s", v38, __s);
          }

          if ((unint64_t)v18[5] > 3)
          {
            int v34 = 9;
            goto LABEL_54;
          }

          if (*((_WORD *)v18 + 3)) {
            snprintf(v35, 0x400uLL, "%s/%s/%s/%s%c%u", v22);
          }
          else {
            snprintf(v35, 0x400uLL, "%s/%s/%s/%s");
          }
          int v26 = strlen(v13);
          size_t v27 = strlen(v4);
          size_t v28 = v27 + v26 + strlen(v35) + 1;
          v29 = (char *)realloc(v13, v28);
          if (!v29)
          {
            int v32 = 21;
            goto LABEL_46;
          }

          v30 = v29;
          snprintf(&v29[v26], v28 - v26, "%s%s", v4, v35);
          v17 += *(unsigned __int16 *)((char *)v3 + v17);
          unint64_t v15 = 8LL * *v3;
          v13 = v30;
          if (v17 >= v15) {
            goto LABEL_44;
          }
        }

LABEL_51:
        int v34 = 7;
        goto LABEL_54;
      }

      goto LABEL_45;
    }

    if (v14 != 2)
    {
LABEL_45:
      int v32 = 3;
LABEL_46:
      __ipsec_errcode = v32;
LABEL_47:
      free(v13);
      return 0LL;
    }

    v30 = v13;
LABEL_44:
    __ipsec_errcode = 0;
    return v30;
  }

  else
  {
    __ipsec_errcode = 0;
  }

  return v13;
}

char *ipsec_dump_policy_withports()
{
  return ipsec_dump_policy1();
}

char *set_address(char *a1, sockaddr *a2, int a3)
{
  v4 = a1;
  uint64_t v8 = *MEMORY[0x1895F89C0];
  *a1 = 0;
  if (getnameinfo(a2, a2->sa_len, v7, 0x401u, v6, 0x20u, 10)) {
    return 0LL;
  }
  if (a3) {
    snprintf(v4, 0x401uLL, "%s[%s]");
  }
  else {
    snprintf(v4, 0x401uLL, "%s");
  }
  return v4;
}

int ipsec_get_policylen(caddr_t a1)
{
  if (a1) {
    return 8 * *(unsigned __int16 *)a1;
  }
  else {
    return -1;
  }
}

const char *ipsec_strerror(void)
{
  int v0 = __ipsec_errcode;
  if (__ipsec_errcode >= 0x1F)
  {
    int v0 = 30;
    __ipsec_errcode = 30;
  }

  return ipsec_errlist[v0];
}

uint64_t __ipsec_set_strerror(uint64_t result)
{
  __ipsec_errcode = 26;
  qword_18C7494B0 = result;
  return result;
}

uint64_t __libipsecparse()
{
  int v0 = 0u;
  v1 = v45;
  uint64_t v2 = 200LL;
  uint64_t v47 = *MEMORY[0x1895F89C0];
  __libipsecnerrs = 0;
  __libipsecchar = -2;
  unint64_t v3 = 0x18C749000LL;
  v4 = v46;
  unint64_t v5 = v46;
  unint64_t v6 = v45;
  while (1)
  {
    *(_WORD *)unint64_t v5 = v0;
    if (&v4[2 * v2 - 2] <= v5)
    {
      if ((unint64_t)v2 >> 4 > 0x270
        || ((unint64_t)(2 * v2) >= 0x2710 ? (uint64_t v2 = 10000LL) : (v2 *= 2LL), (v7 = malloc(18 * v2 + 15)) == 0LL))
      {
        uint64_t v39 = 2LL;
        v40 = "memory exhausted";
LABEL_87:
        fprintf((FILE *)*MEMORY[0x1895F89D0], "libipsec: %s while parsing %s\n", v40, (const char *)__libipsectext);
        goto LABEL_88;
      }

      uint64_t v8 = v7;
      uint64_t v9 = (v5 - v4) >> 1;
      uint64_t v10 = v9 + 1;
      memcpy(v7, v4, 2 * (v9 + 1));
      memcpy(&v8[(2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0LL], v1, 16 * (v9 + 1));
      if (v4 != v46) {
        free(v4);
      }
      if (v2 <= v10)
      {
        uint64_t v39 = 1LL;
        goto LABEL_91;
      }

      unint64_t v5 = &v8[2 * v9];
      unint64_t v6 = &v8[16 * v10 - 16 + ((2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0LL)];
      v4 = v8;
      v1 = &v8[(2 * v2 + 15) & 0xFFFFFFFFFFFFFFF0LL];
      unint64_t v3 = 0x18C749000uLL;
    }

    if (((0xAE38802D57A2A30uLL >> v0) & 1) == 0)
    {
      int v11 = yypact[v0];
      int v12 = __libipsecchar;
      if (__libipsecchar == -2)
      {
        int v12 = __libipseclex();
        __libipsecchar = v12;
      }

      if (v12 <= 0)
      {
        int v13 = 0;
        __libipsecchar = 0;
      }

      else
      {
        int v13 = v12 > 0x111 ? 2 : yytranslate[v12];
      }

      uint64_t v14 = (v13 + v11);
    }

    if (((0x5187380000555CDuLL >> v0) & 1) != 0)
    {
LABEL_86:
      ++__libipsecnerrs;
      uint64_t v39 = 1LL;
      v40 = "syntax error";
      goto LABEL_87;
    }

    uint64_t v15 = yydefact[v0];
    uint64_t v16 = yyr2[v15];
    __int128 v44 = *(_OWORD *)&v6[16 * (1 - v16)];
    switch((int)v15)
    {
      case 2:
        p_dir = *((_DWORD *)v6 - 4);
        p_type = *(_DWORD *)v6;
        goto LABEL_46;
      case 4:
        p_dir = *((_DWORD *)v6 - 12);
        p_type = *(_DWORD *)v6;
        size_t v17 = *((int *)v6 - 4) + 2LL;
        v18 = (char *)malloc(v17);
        if (!v18) {
          goto LABEL_97;
        }
        unint64_t v19 = v18;
        snprintf(v18, v17, "-%s", *((const char **)v6 - 1));
        *__error() = 0;
        unint64_t v3 = 0x18C749000uLL;
        p_priority_offset = atol(v19);
        free(v19);
        if (*__error() || (LODWORD(v20) = p_priority_offset, p_priority_offset <= (uint64_t)0xFFFFFFFF7FFFFFFFLL))
        {
LABEL_96:
          int v41 = 27;
          goto LABEL_102;
        }

LABEL_36:
        int v21 = v20 ^ 0x80000000;
LABEL_44:
        p_priority = v21;
LABEL_47:
        goto LABEL_80;
      case 6:
        p_dir = *((_DWORD *)v6 - 16);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1336) = atol(*((const char **)v6 - 1));
        if (!*__error())
        {
          uint64_t v20 = *(void *)(v3 + 1336);
          if (v20 < 0x80000000LL) {
            goto LABEL_36;
          }
        }

        goto LABEL_96;
      case 8:
        p_dir = *((_DWORD *)v6 - 12);
        p_type = *(_DWORD *)v6;
        int v21 = *((_DWORD *)v6 - 4);
        goto LABEL_44;
      case 10:
        p_dir = *((_DWORD *)v6 - 20);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1336) = atol(*((const char **)v6 - 1));
        if (*__error()) {
          goto LABEL_94;
        }
        uint64_t v22 = *(void *)(v3 + 1336);
        if (v22 >= 1073741825) {
          goto LABEL_94;
        }
        int v21 = *((_DWORD *)v6 - 12) - v22;
        goto LABEL_44;
      case 12:
        p_dir = *((_DWORD *)v6 - 20);
        p_type = *(_DWORD *)v6;
        *__error() = 0;
        *(void *)(v3 + 1336) = atol(*((const char **)v6 - 1));
        if (*__error() || (uint64_t v23 = *(void *)(v3 + 1336), v23 >= 0x40000000))
        {
LABEL_94:
          int v41 = 28;
          goto LABEL_102;
        }

        int v21 = *((_DWORD *)v6 - 12) + v23;
        goto LABEL_44;
      case 14:
        p_dir = *(_DWORD *)v6;
        p_type = 0;
LABEL_46:
        p_priority = 0;
        goto LABEL_47;
      case 16:
        v43 = v1;
        if (p_type == 2)
        {
          if (!p_protocol)
          {
            int v41 = 19;
            goto LABEL_102;
          }

          if ((p_mode - 3) < 0xFFFFFFFE)
          {
            int v41 = 8;
            goto LABEL_102;
          }

          v24 = (unsigned __int8 *)p_src;
          size_t v25 = (unsigned __int8 *)p_dst;
          if (__PAIR128__(p_dst, p_src) == 0)
          {
            if (p_mode == 1)
            {
              v24 = 0LL;
              size_t v25 = 0LL;
              int v26 = 0;
              __ipsec_errcode = 0;
              int v27 = 8;
              goto LABEL_78;
            }

            int v41 = 6;
LABEL_102:
            __ipsec_errcode = v41;
            return 0xFFFFFFFFLL;
          }

          if (*(unsigned __int8 *)(p_src + 1) != *(unsigned __int8 *)(p_dst + 1))
          {
            int v41 = 24;
            goto LABEL_102;
          }

          __ipsec_errcode = 0;
        }

        else
        {
          size_t v25 = (unsigned __int8 *)p_dst;
          v24 = (unsigned __int8 *)p_src;
          __ipsec_errcode = 0;
          if (!p_src)
          {
            int v27 = 8;
            if (!p_dst) {
              goto LABEL_73;
            }
            goto LABEL_77;
          }
        }

        int v27 = *v24 + 8;
        if (!v25)
        {
LABEL_73:
          int v26 = 0;
          goto LABEL_78;
        }

LABEL_77:
        int v26 = *v25;
LABEL_78:
        uint64_t v32 = (v26 + v27);
        size_t v33 = tlen + v32;
        tlen += v32;
        int v34 = (char *)realloc((void *)pbuf, v33);
        if (!v34)
        {
LABEL_97:
          int v41 = 21;
          goto LABEL_102;
        }

        pbuf = (uint64_t)v34;
        int v35 = offset;
        v36 = &v34[offset];
        *(_WORD *)v36 = v32;
        *((_WORD *)v36 + 1) = p_protocol;
        v36[4] = p_mode;
        v36[5] = p_level;
        *((_WORD *)v36 + 3) = p_reqid;
        offset = v35 + 8;
        set_sockaddr(v24);
        set_sockaddr(v25);
        __ipsec_errcode = 0;
        policy_parse_request_init();
        unint64_t v3 = 0x18C749000LL;
        v1 = v43;
LABEL_80:
        v5 -= 2 * v16;
        unint64_t v6 = &v6[-16 * v16 + 16];
        *(_OWORD *)unint64_t v6 = v44;
        uint64_t v37 = yyr1[v15] - 19LL;
        uint64_t v38 = (*(__int16 *)v5 + yypgoto[v37]);
        else {
          int v0 = yydefgoto[v37];
        }
LABEL_84:
        v5 += 2;
        break;
      case 23:
      case 24:
        int v41 = 25;
        goto LABEL_102;
      case 25:
        p_protocol = *(_DWORD *)v6;
        goto LABEL_80;
      case 26:
        p_mode = *(_DWORD *)v6;
        goto LABEL_80;
      case 27:
        p_level = *(_DWORD *)v6;
        p_reqid = 0;
        goto LABEL_80;
      case 28:
        p_level = 3;
        p_reqid = atol(*((const char **)v6 + 1));
        goto LABEL_80;
      case 29:
        size_t v28 = (const char **)v6;
        v29 = 0LL;
        goto LABEL_62;
      case 30:
        v30 = (const char **)v6;
        int v31 = 0LL;
        goto LABEL_65;
      case 31:
        size_t v28 = (const char **)(v6 - 16);
        v29 = (const char **)v6;
LABEL_62:
        p_src = (uint64_t)parse_sockaddr(v28, v29);
        if (!p_src) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_80;
      case 32:
        v30 = (const char **)(v6 - 16);
        int v31 = (const char **)v6;
LABEL_65:
        p_dst = (uint64_t)parse_sockaddr(v30, v31);
        if (!p_dst) {
          return 0xFFFFFFFFLL;
        }
        goto LABEL_80;
      case 33:
        if (p_dir != 2) {
          goto LABEL_95;
        }
        goto LABEL_80;
      case 34:
        if (p_dir == 1) {
          goto LABEL_80;
        }
LABEL_95:
        int v41 = 17;
        goto LABEL_102;
      default:
        goto LABEL_80;
    }
  }

  if ((_DWORD)v14 != 4)
  {
    if (v12 >= 1) {
      __libipsecchar = -2;
    }
    int v0 = yytable[v14];
    *((_OWORD *)v6 + 1) = __libipseclval;
    v6 += 16;
    goto LABEL_84;
  }

  uint64_t v39 = 0LL;
LABEL_88:
  uint64_t v8 = v4;
  if (v4 != v46) {
LABEL_91:
  }
    free(v8);
  return v39;
}

uint64_t init_x_policy()
{
  if (pbuf)
  {
    free((void *)pbuf);
    tlen = 0;
  }

  int v0 = malloc(0x10uLL);
  pbuf = (uint64_t)v0;
  if (v0)
  {
    tlen = 16;
    *int v0 = 0LL;
    v0[1] = 0LL;
    *((_WORD *)v0 + 1) = 18;
    *((_WORD *)v0 + 2) = p_type;
    *((_BYTE *)v0 + 6) = p_dir;
    int v1 = p_priority;
    if (p_priority)
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v1 = 29;
    }

    else
    {
      uint64_t result = 0LL;
      offset = 16;
    }
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v1 = 21;
  }

  __ipsec_errcode = v1;
  return result;
}

void policy_parse_request_init()
{
  p_protocol = 0;
  p_mode = 0;
  p_level = 0;
  p_reqid = 0;
  if (p_src)
  {
    free((void *)p_src);
    p_src = 0LL;
  }

  if (p_dst)
  {
    free((void *)p_dst);
    p_dst = 0LL;
  }
}

char *parse_sockaddr(const char **a1, const char **a2)
{
  size_t v4 = *(int *)a1 + 1LL;
  unint64_t v5 = (char *)malloc(v4);
  unint64_t v6 = v5;
  if (v5)
  {
    if (a2)
    {
      size_t v7 = *(int *)a2 + 1LL;
      uint64_t v8 = (char *)malloc(v7);
      if (!v8)
      {
        free(v6);
        fprintf( (FILE *)*MEMORY[0x1895F89D0],  "libipsec: %s while parsing %s\n",  "malloc failed",  (const char *)__libipsectext);
        unint64_t v19 = __error();
        uint64_t v14 = strerror(*v19);
        goto LABEL_16;
      }

      uint64_t v9 = v8;
      strlcpy(v6, a1[1], v4);
      strlcpy(v9, a2[1], v7);
    }

    else
    {
      strlcpy(v5, a1[1], v4);
      uint64_t v9 = 0LL;
    }

    memset(&v22, 0, sizeof(v22));
    v22.ai_flags = 4;
    v22.ai_socktype = 2;
    int v12 = getaddrinfo(v6, v9, &v22, &v21);
    free(v6);
    if (v9) {
      free(v9);
    }
    if (v12)
    {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "libipsec: %s while parsing %s\n",  "invalid IP address",  (const char *)__libipsectext);
      int v13 = v12;
LABEL_11:
      uint64_t v14 = (void *)gai_strerror(v13);
LABEL_16:
      __ipsec_set_strerror((uint64_t)v14);
      return 0LL;
    }

    uint64_t v15 = v21;
    ai_addr = v21->ai_addr;
    if (!ai_addr)
    {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "libipsec: %s while parsing %s\n",  "invalid IP address",  (const char *)__libipsectext);
      int v13 = 0;
      goto LABEL_11;
    }

    size_t ai_addrlen = v21->ai_addrlen;
    v18 = (char *)malloc(ai_addrlen);
    unint64_t v6 = v18;
    if (v18)
    {
      memcpy(v18, ai_addr, ai_addrlen);
      freeaddrinfo(v15);
      __ipsec_errcode = 0;
    }

    else
    {
      __ipsec_errcode = 21;
      freeaddrinfo(v15);
    }
  }

  else
  {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "libipsec: %s while parsing %s\n",  "malloc failed",  (const char *)__libipsectext);
    uint64_t v10 = __error();
    int v11 = strerror(*v10);
    __ipsec_set_strerror((uint64_t)v11);
  }

  return v6;
}

uint64_t __libipsecerror(const char *a1)
{
  return fprintf((FILE *)*MEMORY[0x1895F89D0], "libipsec: %s while parsing %s\n", a1, (const char *)__libipsectext);
}

caddr_t ipsec_set_policy(char *a1, int a2)
{
  pbuf = 0LL;
  tlen = 0;
  p_dir = 4;
  p_type = 0;
  policy_parse_request_init();
  __policy__strbuffer__init__(a1);
  LODWORD(a1) = __libipsecparse();
  __policy__strbuffer__free__();
  if (!(_DWORD)a1)
  {
    int v4 = 0;
    caddr_t result = (caddr_t)pbuf;
    *(_WORD *)pbuf = tlen >> 3;
    goto LABEL_7;
  }

  if (pbuf) {
    free((void *)pbuf);
  }
  caddr_t result = 0LL;
  if (!__ipsec_errcode)
  {
    int v4 = 2;
LABEL_7:
    __ipsec_errcode = v4;
  }

  return result;
}

unsigned __int8 *set_sockaddr(unsigned __int8 *__src)
{
  if (__src)
  {
    int v1 = __src;
    int v2 = offset;
    __src = (unsigned __int8 *)memcpy((void *)(pbuf + offset), v1, *v1);
    offset = v2 + *v1;
  }

  __ipsec_errcode = 0;
  return __src;
}

uint64_t __libipseclex()
{
  unint64_t v0 = 0x18C749000uLL;
  unint64_t v1 = 0x18C749000uLL;
  if ((yy_init & 1) == 0)
  {
    yy_init = 1;
    if ((yy_start & 1) == 0) {
      yy_start = 1;
    }
    if (!__libipsecin) {
      __libipsecin = *MEMORY[0x1895F89D8];
    }
    if (!__libipsecout) {
      __libipsecout = *MEMORY[0x1895F89E0];
    }
    uint64_t v2 = yy_buffer_stack;
    if (!yy_buffer_stack
      || (uint64_t v3 = yy_buffer_stack_top, (buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0))
    {
      __libipsecensure_buffer_stack();
      uint64_t buffer = __libipsec_create_buffer((FILE *)__libipsecin, 0x4000);
      uint64_t v2 = yy_buffer_stack;
      uint64_t v3 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
    }

    yy_n_chars = *(void *)(buffer + 32);
    yy_c_buf_p = *(void *)(buffer + 16);
    __libipsectext = yy_c_buf_p;
    __libipsecin = **(void **)(v2 + 8 * v3);
    yy_hold_char = *(_BYTE *)yy_c_buf_p;
  }

  unint64_t v5 = 0x18C749000uLL;
  unint64_t v6 = 0x18C749000uLL;
LABEL_13:
  uint64_t v7 = yy_c_buf_p;
  *(_BYTE *)yy_c_buf_p = *(_BYTE *)(v0 + 1424);
  LODWORD(v8) = *(unsigned __int8 *)(v1 + 1396);
  uint64_t v66 = v7;
  while (1)
  {
    do
    {
LABEL_14:
      uint64_t v9 = yy_ec[*(unsigned __int8 *)v7];
      if (yy_accept[(int)v8])
      {
        *(_DWORD *)(v6 + 1428) = v8;
        *(void *)(v5 + 1432) = v7;
      }

      uint64_t v10 = (int)v8;
      uint64_t v11 = yy_base[(int)v8] + v9;
      if ((_DWORD)v8 != (__int16)yy_chk[v11])
      {
        do
        {
          uint64_t v10 = yy_def[v10];
          if (v10 >= 129) {
            uint64_t v9 = *((unsigned __int8 *)&yy_meta + v9);
          }
          uint64_t v11 = yy_base[v10] + v9;
        }

        while (yy_chk[v11] != (unsigned __int16)v10);
      }

      uint64_t v8 = yy_nxt[v11];
      ++v7;
    }

    while (yy_base[v8] != 251);
    while (2)
    {
      __int16 v12 = yy_accept[(int)v8];
      if (!v12)
      {
        uint64_t v7 = *(void *)(v5 + 1432);
        __int16 v12 = yy_accept[*(int *)(v6 + 1428)];
      }

      int v13 = v12;
      __libipsectext = v66;
      __libipsecleng = v7 - v66;
      *(_BYTE *)(v0 + 1424) = *(_BYTE *)v7;
      *(_BYTE *)uint64_t v7 = 0;
      uint64_t v14 = (char *)v7;
LABEL_24:
      yy_c_buf_p = (uint64_t)v14;
      switch(v13)
      {
        case 0:
          *(_BYTE *)uint64_t v7 = *(_BYTE *)(v0 + 1424);
          uint64_t v7 = *(void *)(v5 + 1432);
          LODWORD(v8) = *(_DWORD *)(v6 + 1428);
          continue;
        case 1:
        case 3:
          int v57 = 1;
          goto LABEL_95;
        case 2:
          int v57 = 2;
LABEL_95:
          LODWORD(__libipseclval) = v57;
          return 258LL;
        case 4:
        case 5:
          return 259LL;
        case 6:
          unsigned int v59 = -1073741824;
          goto LABEL_99;
        case 7:
          unsigned int v59 = 0x80000000;
          goto LABEL_99;
        case 8:
          unsigned int v59 = 0x40000000;
LABEL_99:
          LODWORD(__libipseclval) = v59;
          return 261LL;
        case 9:
          return 260LL;
        case 10:
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext);
          *((void *)&__libipseclval + 1) = __libipsectext;
          return 262LL;
        case 11:
          LODWORD(__libipseclval) = 0;
          return 263LL;
        case 12:
          int v60 = 5;
          goto LABEL_108;
        case 13:
          int v60 = 1;
          goto LABEL_108;
        case 14:
          int v60 = 2;
          goto LABEL_108;
        case 15:
          int v60 = 4;
          goto LABEL_108;
        case 16:
          int v60 = 3;
LABEL_108:
          LODWORD(__libipseclval) = v60;
          return 263LL;
        case 17:
          int v61 = 50;
          goto LABEL_113;
        case 18:
          int v61 = 51;
          goto LABEL_113;
        case 19:
          int v61 = 108;
LABEL_113:
          LODWORD(__libipseclval) = v61;
          return 264LL;
        case 20:
          int v62 = 1;
          goto LABEL_116;
        case 21:
          int v62 = 2;
LABEL_116:
          LODWORD(__libipseclval) = v62;
          return 265LL;
        case 22:
          return 270LL;
        case 23:
          return 271LL;
        case 24:
          LODWORD(__libipseclval) = 0;
          return 266LL;
        case 25:
          int v63 = 1;
          goto LABEL_124;
        case 26:
          int v63 = 2;
          goto LABEL_124;
        case 27:
          LODWORD(__libipseclval) = strlen((const char *)(__libipsectext + 7));
          *((void *)&__libipseclval + 1) = __libipsectext + 7;
          return 267LL;
        case 28:
          int v63 = 3;
LABEL_124:
          LODWORD(__libipseclval) = v63;
          return 266LL;
        case 29:
          return 272LL;
        case 30:
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext);
          *((void *)&__libipseclval + 1) = __libipsectext;
          return 268LL;
        case 31:
          return 273LL;
        case 32:
          *((void *)&__libipseclval + 1) = __libipsectext + 1;
          LODWORD(__libipseclval) = strlen((const char *)__libipsectext) - 2;
          return 269LL;
        case 33:
        case 34:
          goto LABEL_13;
        case 35:
          fwrite((const void *)__libipsectext, __libipsecleng, 1uLL, (FILE *)__libipsecout);
          unint64_t v6 = 0x18C749000LL;
          unint64_t v5 = 0x18C749000LL;
          goto LABEL_13;
        case 36:
          int v15 = __libipsectext;
          *(_BYTE *)uint64_t v7 = *(_BYTE *)(v0 + 1424);
          uint64_t v16 = yy_buffer_stack;
          uint64_t v17 = yy_buffer_stack_top;
          uint64_t v18 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
          if (*(_DWORD *)(v18 + 64))
          {
            uint64_t v19 = yy_n_chars;
          }

          else
          {
            uint64_t v19 = *(void *)(v18 + 32);
            yy_n_chars = v19;
            *(void *)uint64_t v18 = __libipsecin;
            uint64_t v18 = *(void *)(v16 + 8 * v17);
            *(_DWORD *)(v18 + 64) = 1;
          }

          int v20 = yy_c_buf_p;
          int v21 = *(_BYTE **)(v18 + 8);
          if (yy_c_buf_p <= (unint64_t)&v21[v19])
          {
            uint64_t v7 = __libipsectext + ~v15 + (int)v7;
            yy_c_buf_p = v7;
            LODWORD(v8) = yy_get_previous_state();
            unint64_t v6 = 0x18C749000uLL;
            unint64_t v5 = 0x18C749000uLL;
            if (yy_accept[(int)v8])
            {
              yy_last_accepting_state = v8;
              yy_last_accepting_cpos = v7;
            }

            uint64_t v53 = (int)v8;
            uint64_t v54 = yy_base[(int)v8] + 1LL;
            unint64_t v0 = 0x18C749000LL;
            unint64_t v1 = 0x18C749000LL;
            if ((_DWORD)v8 != (__int16)yy_chk[v54])
            {
              do
              {
                int v55 = (unsigned __int16)yy_def[v53];
                uint64_t v53 = (__int16)v55;
                uint64_t v54 = yy_base[(__int16)v55] + 1LL;
              }

              while (v55 != yy_chk[v54]);
            }

            uint64_t v66 = __libipsectext;
            if (v54)
            {
              int v56 = (unsigned __int16)yy_nxt[v54];
              if (v56 != 128)
              {
                LODWORD(v8) = (__int16)v56;
                yy_c_buf_p = ++v7;
                goto LABEL_14;
              }
            }

            continue;
          }

          int v65 = v15;
          uint64_t v14 = (char *)__libipsectext;
          if (!*(_DWORD *)(v18 + 60))
          {
            int v13 = 37;
            unint64_t v0 = 0x18C749000LL;
            unint64_t v1 = 0x18C749000LL;
            if (yy_c_buf_p - __libipsectext == 1) {
              goto LABEL_24;
            }
            goto LABEL_81;
          }

          int v22 = ~(_DWORD)__libipsectext + yy_c_buf_p;
          if (v22 >= 1)
          {
            int v23 = ~(_DWORD)__libipsectext + yy_c_buf_p;
            do
            {
              char v24 = *v14++;
              *v21++ = v24;
              --v23;
            }

            while (v23);
            uint64_t v18 = *(void *)(v16 + 8 * v17);
          }

          if (*(_DWORD *)(v18 + 64) == 2)
          {
            yy_n_chars = 0LL;
            unint64_t v25 = 0x18C749000LL;
            goto LABEL_37;
          }

          int v28 = ~v22;
          int v29 = *(_DWORD *)(v18 + 24);
          unsigned int v30 = v29 + ~v22;
          int v64 = v22;
          if (!v30)
          {
            do
            {
              if (!*(_DWORD *)(v18 + 40))
              {
                *(void *)(v18 + 8) = 0LL;
LABEL_133:
                yy_fatal_error("fatal error - scanner input buffer overflow");
              }

              int v31 = v20;
              uint64_t v32 = v17;
              uint64_t v33 = v16;
              int v34 = *(void **)(v18 + 8);
              int v35 = 2 * v29;
              *(_DWORD *)(v18 + 24) = v35;
              uint64_t v36 = v18;
              uint64_t v37 = realloc(v34, v35 + 2);
              *(void *)(v36 + 8) = v37;
              if (!v37) {
                goto LABEL_133;
              }
              int v20 = (_DWORD)v37 + v31 - (_DWORD)v34;
              yy_c_buf_p = (uint64_t)v37 + v31 - (int)v34;
              uint64_t v16 = v33;
              uint64_t v17 = v32;
              uint64_t v18 = *(void *)(v16 + 8 * v32);
              int v29 = *(_DWORD *)(v18 + 24);
              unsigned int v30 = v29 + v28;
            }

            while (!(v29 + v28));
            int v22 = v64;
          }

          if (v30 >= 0x2000) {
            size_t v38 = 0x2000LL;
          }
          else {
            size_t v38 = v30;
          }
          uint64_t v39 = v22;
          unint64_t v25 = 0x18C749000uLL;
          unint64_t v40 = 0x18C749000uLL;
          if (*(_DWORD *)(v18 + 44))
          {
            unint64_t v26 = 0LL;
            while (1)
            {
              int v41 = getc((FILE *)__libipsecin);
              if (v41 == -1 || v41 == 10) {
                break;
              }
              *(_BYTE *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8LL) + v39 + v26++) = v41;
              if (v38 == v26)
              {
                unint64_t v26 = v38;
                break;
              }
            }

            if (v41 == -1)
            {
              int v46 = ferror((FILE *)__libipsecin);
              unint64_t v5 = 0x18C749000LL;
              unint64_t v6 = 0x18C749000LL;
              if (v46) {
LABEL_136:
              }
                yy_fatal_error("input in flex scanner failed");
            }

            else
            {
              if (v41 == 10) {
                *(_BYTE *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8LL) + v39 + v26++) = 10;
              }
              unint64_t v5 = 0x18C749000LL;
              unint64_t v6 = 0x18C749000LL;
            }

            yy_n_chars = v26;
          }

          else
          {
            int v43 = v22;
            *__error() = 0;
            size_t v44 = fread( (void *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8LL) + v43),  1uLL,  v38,  (FILE *)__libipsecin);
            unint64_t v26 = (int)v44;
            yy_n_chars = (int)v44;
            unint64_t v5 = 0x18C749000LL;
            unint64_t v6 = 0x18C749000LL;
            if (!(v44 << 32))
            {
              while (ferror((FILE *)__libipsecin))
              {
                if (*__error() != 4) {
                  goto LABEL_136;
                }
                *__error() = 0;
                clearerr((FILE *)__libipsecin);
                size_t v45 = fread( (void *)(*(void *)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8LL) + v39),  1uLL,  v38,  (FILE *)__libipsecin);
                unint64_t v26 = (int)v45;
                yy_n_chars = (int)v45;
                if (v45 << 32)
                {
                  unint64_t v5 = 0x18C749000LL;
                  unint64_t v6 = 0x18C749000LL;
                  unint64_t v40 = 0x18C749000LL;
                  goto LABEL_68;
                }
              }

              uint64_t v16 = yy_buffer_stack;
              uint64_t v17 = yy_buffer_stack_top;
              uint64_t v18 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
              unint64_t v5 = 0x18C749000LL;
              unint64_t v6 = 0x18C749000LL;
              int v22 = v64;
LABEL_37:
              *(void *)(v18 + 32) = 0LL;
              if (v22) {
                goto LABEL_38;
              }
              goto LABEL_71;
            }
          }

LABEL_68:
          uint64_t v16 = yy_buffer_stack;
          uint64_t v17 = *(void *)(v40 + 1408);
          uint64_t v18 = *(void *)(yy_buffer_stack + 8 * v17);
          *(void *)(v18 + 32) = v26;
          if (v26)
          {
            int v27 = 0;
            int v22 = v64;
            goto LABEL_72;
          }

          int v22 = v64;
          if (v64)
          {
LABEL_38:
            unint64_t v26 = 0LL;
            int v27 = 2;
            *(_DWORD *)(v18 + 64) = 2;
            goto LABEL_72;
          }

LABEL_71:
          int v47 = v22;
          __libipsecrestart((FILE *)__libipsecin);
          int v22 = v47;
          unint64_t v6 = 0x18C749000LL;
          unint64_t v5 = 0x18C749000LL;
          unint64_t v26 = yy_n_chars;
          uint64_t v16 = *(void *)(v25 + 1400);
          uint64_t v17 = yy_buffer_stack_top;
          uint64_t v18 = *(void *)(v16 + 8 * yy_buffer_stack_top);
          int v27 = 1;
LABEL_72:
          unint64_t v48 = v26 + v22;
          if (v48 <= *(int *)(v18 + 24))
          {
            uint64_t v52 = *(void *)(v18 + 8);
            unint64_t v0 = 0x18C749000LL;
          }

          else
          {
            size_t v49 = v48 + (v26 >> 1);
            uint64_t v50 = v16;
            *(void *)(*(void *)(v16 + 8 * v17) + 8LL) = realloc(*(void **)(v18 + 8), v49);
            uint64_t v51 = *(void *)(v50 + 8 * v17);
            uint64_t v52 = *(void *)(v51 + 8);
            if (!v52) {
              yy_fatal_error("out of dynamic memory in yy_get_next_buffer()");
            }
            uint64_t v16 = v50;
            *(_DWORD *)(v51 + 24) = v49 - 2;
            unint64_t v0 = 0x18C749000LL;
            unint64_t v5 = 0x18C749000LL;
            unint64_t v6 = 0x18C749000LL;
          }

          yy_n_chars = v48;
          *(_BYTE *)(v52 + v48) = 0;
          *(_BYTE *)(v48 + *(void *)(*(void *)(v16 + 8 * v17) + 8LL) + 1) = 0;
          uint64_t v14 = *(char **)(*(void *)(v16 + 8 * v17) + 8LL);
          __libipsectext = (uint64_t)v14;
          int v13 = 37;
          unint64_t v1 = 0x18C749000LL;
          if (v27 == 1) {
            goto LABEL_24;
          }
          if (v27)
          {
            int v21 = *(_BYTE **)(*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) + 8LL);
            uint64_t v19 = yy_n_chars;
LABEL_81:
            uint64_t v7 = (uint64_t)&v21[v19];
            yy_c_buf_p = (uint64_t)&v21[v19];
            LODWORD(v8) = yy_get_previous_state();
            unint64_t v6 = 0x18C749000LL;
            unint64_t v5 = 0x18C749000LL;
            uint64_t v66 = __libipsectext;
            continue;
          }

          uint64_t v7 = (uint64_t)&v14[~v65 + (int)v7];
          yy_c_buf_p = v7;
          LODWORD(v8) = yy_get_previous_state();
          unint64_t v6 = 0x18C749000LL;
          unint64_t v5 = 0x18C749000LL;
          uint64_t v66 = __libipsectext;
          break;
        case 37:
          return 0LL;
        default:
          yy_fatal_error("fatal flex scanner internal error--no action found");
      }

      break;
    }
  }

void *__libipsecensure_buffer_stack()
{
  caddr_t result = (void *)yy_buffer_stack;
  if (yy_buffer_stack)
  {
    uint64_t v1 = yy_buffer_stack_max;
    if (yy_buffer_stack_top >= (unint64_t)(yy_buffer_stack_max - 1))
    {
      caddr_t result = realloc((void *)yy_buffer_stack, 8 * (yy_buffer_stack_max + 8));
      yy_buffer_stack = (uint64_t)result;
      if (result)
      {
        uint64_t v2 = &result[v1];
        v2[2] = 0u;
        v2[3] = 0u;
        *uint64_t v2 = 0u;
        v2[1] = 0u;
        yy_buffer_stack_max = v1 + 8;
        return result;
      }

LABEL_8:
      yy_fatal_error("out of dynamic memory in yyensure_buffer_stack()");
    }
  }

  else
  {
    caddr_t result = malloc(8uLL);
    yy_buffer_stack = (uint64_t)result;
    if (!result) {
      goto LABEL_8;
    }
    *caddr_t result = 0LL;
    yy_buffer_stack_max = 1LL;
    yy_buffer_stack_top = 0LL;
  }

  return result;
}

uint64_t __libipsec_create_buffer(FILE *a1, int a2)
{
  int v4 = malloc(0x48uLL);
  *(_DWORD *)(v5 + 40) = 1;
  __libipsec_init_buffer(v5, a1);
  return v5;
}

uint64_t yy_get_previous_state()
{
  uint64_t result = yy_start;
  uint64_t v1 = (_BYTE *)__libipsectext;
  if (__libipsectext < (unint64_t)yy_c_buf_p)
  {
    do
    {
      if (*v1) {
        uint64_t v2 = yy_ec[*v1];
      }
      else {
        uint64_t v2 = 1u;
      }
      if (yy_accept[(int)result])
      {
        yy_last_accepting_state = result;
        yy_last_accepting_cpos = (uint64_t)v1;
      }

      uint64_t v3 = (int)result;
      uint64_t v4 = yy_base[(int)result] + v2;
      if ((_DWORD)result != (__int16)yy_chk[v4])
      {
        do
        {
          uint64_t v3 = yy_def[v3];
          if (v3 >= 129) {
            uint64_t v2 = *((unsigned __int8 *)&yy_meta + v2);
          }
          uint64_t v4 = yy_base[v3] + v2;
        }

        while (yy_chk[v4] != (unsigned __int16)v3);
      }

      uint64_t result = yy_nxt[v4];
      ++v1;
    }

    while (v1 != (_BYTE *)yy_c_buf_p);
  }

  return result;
}

void yy_fatal_error(const char *a1)
{
}

int *__libipsecrestart(FILE *a1)
{
  if (!yy_buffer_stack || (uint64_t buffer = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top)) == 0)
  {
    __libipsecensure_buffer_stack();
    uint64_t buffer = __libipsec_create_buffer((FILE *)__libipsecin, 0x4000);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = buffer;
  }

  uint64_t result = __libipsec_init_buffer(buffer, a1);
  uint64_t v4 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  uint64_t v5 = *(void *)(v4 + 32);
  yy_c_buf_p = *(void *)(v4 + 16);
  __libipsectext = yy_c_buf_p;
  unint64_t v6 = *(uint64_t **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  yy_n_chars = v5;
  __libipsecin = *v6;
  yy_hold_char = *(_BYTE *)yy_c_buf_p;
  return result;
}

int *__libipsec_init_buffer(uint64_t a1, FILE *a2)
{
  int v4 = *__error();
  __libipsec_flush_buffer(a1);
  *(void *)a1 = a2;
  *(_DWORD *)(a1 + 60) = 1;
  uint64_t v5 = yy_buffer_stack;
  if (yy_buffer_stack) {
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
  }
  if (v5 != a1) {
    *(void *)(a1 + 52) = 1LL;
  }
  if (a2)
  {
    int v6 = fileno(a2);
    BOOL v7 = isatty(v6) > 0;
  }

  else
  {
    BOOL v7 = 0;
  }

  *(_DWORD *)(a1 + 44) = v7;
  uint64_t result = __error();
  *uint64_t result = v4;
  return result;
}

void *__libipsec_switch_to_buffer(uint64_t a1)
{
  uint64_t result = __libipsecensure_buffer_stack();
  uint64_t v3 = yy_buffer_stack;
  if (yy_buffer_stack)
  {
    uint64_t v4 = yy_buffer_stack_top;
    uint64_t v5 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v5 == a1) {
      return result;
    }
    if (v5)
    {
      uint64_t v6 = yy_c_buf_p;
      *(_BYTE *)yy_c_buf_p = yy_hold_char;
      *(void *)(*(void *)(v3 + 8 * v4) + 16LL) = v6;
      *(void *)(*(void *)(v3 + 8 * v4) + 32LL) = yy_n_chars;
    }
  }

  else
  {
    if (!a1) {
      return result;
    }
    uint64_t v4 = yy_buffer_stack_top;
  }

  *(void *)(v3 + 8 * v4) = a1;
  yy_n_chars = *(void *)(a1 + 32);
  yy_c_buf_p = *(void *)(a1 + 16);
  __libipsectext = yy_c_buf_p;
  __libipsecin = **(void **)(v3 + 8 * v4);
  yy_hold_char = *(_BYTE *)yy_c_buf_p;
  return result;
}

void __libipsec_delete_buffer(void **a1)
{
  if (a1)
  {
    if (yy_buffer_stack) {
      uint64_t v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v2 = 0LL;
    }
    if (v2 == a1) {
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0LL;
    }
    if (*((_DWORD *)a1 + 10)) {
      free(a1[1]);
    }
    free(a1);
  }

uint64_t __libipsec_flush_buffer(uint64_t result)
{
  if (result)
  {
    *(void *)(result + 32) = 0LL;
    **(_BYTE **)(result + 8) = 0;
    *(_BYTE *)(*(void *)(result + 8) + 1LL) = 0;
    *(void *)(result + 16) = *(void *)(result + 8);
    *(_DWORD *)(result + 48) = 1;
    *(_DWORD *)(result + 64) = 0;
    if (yy_buffer_stack) {
      uint64_t v1 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    }
    else {
      uint64_t v1 = 0LL;
    }
    if (v1 == result)
    {
      uint64_t v2 = *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_n_chars = *(void *)(v2 + 32);
      yy_c_buf_p = *(void *)(v2 + 16);
      __libipsectext = yy_c_buf_p;
      __libipsecin = **(void **)(yy_buffer_stack + 8 * yy_buffer_stack_top);
      yy_hold_char = *(_BYTE *)yy_c_buf_p;
    }
  }

  return result;
}

void *__libipsecpush_buffer_state(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = __libipsecensure_buffer_stack();
    uint64_t v2 = yy_buffer_stack;
    uint64_t v3 = yy_buffer_stack_top;
    if (yy_buffer_stack)
    {
      if (*(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top))
      {
        uint64_t v4 = yy_c_buf_p;
        *(_BYTE *)yy_c_buf_p = yy_hold_char;
        *(void *)(*(void *)(v2 + 8 * v3) + 16LL) = v4;
        *(void *)(*(void *)(v2 + 8 * v3++) + 32LL) = yy_n_chars;
        yy_buffer_stack_top = v3;
      }
    }

    *(void *)(v2 + 8 * v3) = v1;
    uint64_t v5 = v1[4];
    yy_c_buf_p = v1[2];
    __libipsectext = yy_c_buf_p;
    uint64_t v6 = *(uint64_t **)(v2 + 8 * v3);
    yy_n_chars = v5;
    __libipsecin = *v6;
    yy_hold_char = *(_BYTE *)yy_c_buf_p;
  }

  return result;
}

void __libipsecpop_buffer_state()
{
  if (yy_buffer_stack)
  {
    unint64_t v0 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v0)
    {
      __libipsec_delete_buffer(v0);
      uint64_t v1 = yy_buffer_stack;
      uint64_t v2 = yy_buffer_stack_top;
      *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0LL;
      if (v2)
      {
        uint64_t v3 = v2 - 1;
        yy_buffer_stack_top = v3;
        uint64_t v4 = *(void *)(v1 + 8 * v3);
        if (v4)
        {
          yy_n_chars = *(void *)(v4 + 32);
          yy_c_buf_p = *(void *)(v4 + 16);
          __libipsectext = yy_c_buf_p;
          __libipsecin = **(void **)(v1 + 8 * v3);
          yy_hold_char = *(_BYTE *)yy_c_buf_p;
        }
      }
    }
  }

char *__libipsec_scan_buffer(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = a2 - 2;
  if (a2 < 2 || *(_BYTE *)(a1 + v2) || *(_BYTE *)(a2 + a1 - 1)) {
    return 0LL;
  }
  uint64_t v6 = (char *)malloc(0x48uLL);
  if (!v6) {
    yy_fatal_error("out of dynamic memory in yy_scan_buffer()");
  }
  uint64_t v4 = v6;
  *((_DWORD *)v6 + 6) = v2;
  *((void *)v6 + 1) = a1;
  *((void *)v6 + 2) = a1;
  *(void *)uint64_t v6 = 0LL;
  *((void *)v6 + 4) = (int)v2;
  *((void *)v6 + 5) = 0LL;
  *((_DWORD *)v6 + 12) = 1;
  *(void *)(v6 + 60) = 0LL;
  __libipsec_switch_to_buffer((uint64_t)v6);
  return v4;
}

char *__libipsec_scan_string(const char *a1)
{
  size_t v2 = (int)strlen(a1);
  return __libipsec_scan_bytes(a1, v2);
}

char *__libipsec_scan_bytes(const void *a1, size_t a2)
{
  unint64_t v4 = a2 + 2;
  uint64_t v5 = malloc(a2 + 2);
  if (!v5) {
    yy_fatal_error("out of dynamic memory in yy_scan_bytes()");
  }
  uint64_t v6 = (uint64_t)v5;
  if (a2) {
    memcpy(v5, a1, a2);
  }
  *(_WORD *)(v6 + a2) = 0;
  uint64_t result = __libipsec_scan_buffer(v6, v4);
  if (!result) {
    yy_fatal_error("bad buffer in yy_scan_bytes()");
  }
  *((_DWORD *)result + 10) = 1;
  return result;
}

uint64_t __libipsecget_lineno()
{
  return __libipseclineno;
}

uint64_t __libipsecget_in()
{
  return __libipsecin;
}

uint64_t __libipsecget_out()
{
  return __libipsecout;
}

uint64_t __libipsecget_leng()
{
  return __libipsecleng;
}

uint64_t __libipsecget_text()
{
  return __libipsectext;
}

uint64_t __libipsecset_lineno(uint64_t result)
{
  __libipseclineno = result;
  return result;
}

uint64_t __libipsecset_in(uint64_t result)
{
  __libipsecin = result;
  return result;
}

uint64_t __libipsecset_out(uint64_t result)
{
  __libipsecout = result;
  return result;
}

uint64_t __libipsecget_debug()
{
  return __libipsec_flex_debug;
}

uint64_t __libipsecset_debug(uint64_t result)
{
  __libipsec_flex_debug = result;
  return result;
}

uint64_t __libipseclex_destroy()
{
  for (i = (void *)yy_buffer_stack; yy_buffer_stack; i = (void *)yy_buffer_stack)
  {
    if (!i[yy_buffer_stack_top]) {
      break;
    }
    __libipsec_delete_buffer((void **)i[yy_buffer_stack_top]);
    *(void *)(yy_buffer_stack + 8 * yy_buffer_stack_top) = 0LL;
    __libipsecpop_buffer_state();
  }

  free(i);
  yy_buffer_stack = 0LL;
  yy_buffer_stack_top = 0LL;
  yy_buffer_stack_max = 0LL;
  yy_c_buf_p = 0LL;
  yy_init = 0;
  yy_start = 0;
  __libipsecin = 0LL;
  __libipsecout = 0LL;
  return 0LL;
}

void *__policy__strbuffer__init__(char *__s)
{
  if (yy_buffer_stack)
  {
    size_t v2 = *(void ***)(yy_buffer_stack + 8 * yy_buffer_stack_top);
    if (v2) {
      __libipsec_delete_buffer(v2);
    }
  }

  int v3 = strlen(__s);
  struint64_t buffer = (uint64_t)__libipsec_scan_bytes(__s, v3);
  return __libipsec_switch_to_buffer(strbuffer);
}

void __policy__strbuffer__free__()
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1895F95A8](a1);
}

void clearerr(FILE *a1)
{
}

void exit(int a1)
{
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1895FB2A0](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return (const char *)MEMORY[0x1895FB4D8](*(void *)&a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x1895FB4E0](a1, a2, a3, a4);
}

int getc(FILE *a1)
{
  return MEMORY[0x1895FB518](a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return MEMORY[0x1895FB5D8](a1, *(void *)&a2, a3, *(void *)&a4, a5, *(void *)&a6, *(void *)&a7);
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1895FD080](*(void *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
}