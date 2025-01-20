BOOL in(BOOL __c, int a2)
{
  unsigned int v2;
  char *v3;
  unsigned int v4;
  unsigned int v5;
  BOOL v6;
  int v7;
  size_t v8;
  BOOL v10;
  if ((_DWORD)__c)
  {
    v2 = __c;
    switch(a2)
    {
      case 0:
        goto LABEL_52;
      case 1:
        goto LABEL_4;
      case 2:
        if (memchr("0123456789", __c, 0xBuLL)) {
          goto LABEL_80;
        }
LABEL_4:
        v3 = "IVXLCDM";
        goto LABEL_74;
      case 3:
        v4 = __c - 97;
        goto LABEL_53;
      case 4:
        goto LABEL_42;
      case 5:
        if (memchr("-.", __c, 3uLL)) {
          goto LABEL_80;
        }
LABEL_42:
        v3 = ",;:/?+=(*)";
        goto LABEL_88;
      case 6:
        goto LABEL_13;
      case 7:
        goto LABEL_80;
      case 8:
        v3 = "bcdfghjklmnpqrstvwxz";
        goto LABEL_50;
      case 9:
        goto LABEL_10;
      case 10:
        v5 = ((__c & 0xDF) - 65);
        goto LABEL_45;
      case 11:
        __c = 1LL;
LABEL_10:
        __c = 1LL;
        if ((vmaxv_u16((uint16x4_t)vceq_s16(vdup_n_s16(v2), (int16x4_t)0x9C009A008C008ALL)) & 1) != 0
          || v2 > 0xBF
          || (v2 - 65) < 0x1Au)
        {
          return __c;
        }

LABEL_13:
        v6 = v2 <= 0xDE && v2 - 97 >= 0x1A;
        return !v6;
      case 12:
        v3 = "MNmn";
        goto LABEL_63;
      case 13:
        v3 = ".!'><$CQXY\x7F";
        goto LABEL_19;
      case 14:
        v3 = ":+);=cqxy?(";
        v7 = v2;
        v8 = 12LL;
        goto LABEL_89;
      case 15:
LABEL_44:
        v5 = __c - 65;
LABEL_45:
        v6 = v5 >= 0x1A;
        return !v6;
      case 16:
        v3 = "'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB";
LABEL_19:
        v7 = v2;
        v8 = 13LL;
        goto LABEL_89;
      case 17:
        v3 = "[]\x82\x91\x92";
        goto LABEL_70;
      case 18:
        v3 = "\x84\x93\x94";
        goto LABEL_72;
      case 19:
        v3 = ".'\x82\x91\x92";
        goto LABEL_79;
      case 20:
        v3 = ".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB";
LABEL_50:
        v7 = v2;
        v8 = 21LL;
        goto LABEL_89;
      case 21:
        if (memchr(".:\x1E \xA0\xB0", __c, 7uLL)) {
          goto LABEL_80;
        }
LABEL_52:
        v4 = v2 - 48;
LABEL_53:
        v6 = v4 >= 0xA;
        return !v6;
      case 22:
        v3 = ",;:!?";
        goto LABEL_70;
      case 23:
        v3 = "()!?";
        goto LABEL_63;
      case 24:
        v3 = ".-'";
        goto LABEL_72;
      case 25:
        if (!memchr("*/:", __c, 4uLL)) {
          goto LABEL_60;
        }
        goto LABEL_80;
      case 26:
LABEL_60:
        v3 = "+-=";
        goto LABEL_72;
      case 27:
        v3 = "\xB9\xB2\xB3\xBC\xBD\xBE";
        goto LABEL_79;
      case 28:
        v3 = "_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5\xB6\xB9\xBA"
             "\xBC\xBD\xBE\xC5.:/h";
        v7 = v2;
        v8 = 36LL;
        goto LABEL_89;
      case 29:
        v3 = ".:/h";
LABEL_63:
        v7 = v2;
        v8 = 5LL;
        goto LABEL_89;
      case 30:
        v10 = __c == 176;
        if ((_DWORD)__c == 137) {
          v10 = 1;
        }
        return (_DWORD)__c == 37 || v10;
      case 31:
        v3 = "\x80$\xA5\xA2\xA3\xA4";
        goto LABEL_79;
      case 32:
        v3 = "({[<\x91";
        goto LABEL_70;
      case 33:
        v3 = ")}]>\x9B";
LABEL_70:
        v7 = v2;
        v8 = 6LL;
        goto LABEL_89;
      case 34:
        return (__c & 0xE0) == 64;
      case 35:
        return (char)__c > 95;
      case 36:
        __c = 1LL;
        if (v2 != 9 && v2 != 32) {
          return v2 == 160;
        }
        return __c;
      case 37:
        return __c < 0x21 || (_DWORD)__c == 160;
      case 38:
        v3 = ",;:";
LABEL_72:
        v7 = v2;
        v8 = 4LL;
        goto LABEL_89;
      case 39:
        v3 = "!'><$\x7F";
LABEL_74:
        v7 = v2;
        v8 = 8LL;
        goto LABEL_89;
      case 40:
        v3 = "#!'><$\x7F";
        v7 = v2;
        v8 = 9LL;
        goto LABEL_89;
      case 41:
        if ((__c & 0xF8) == 0x28 || (__c - 33) < 0x1F && ((0x7C00003Fu >> (__c - 33)) & 1) != 0)
        {
LABEL_80:
          __c = 1LL;
        }

        else
        {
LABEL_79:
          v7 = v2;
          v8 = 7LL;
LABEL_89:
          __c = memchr(v3, v7, v8) != 0LL;
        }

        break;
      case 42:
        return (__c - 96) < 0x1B || (__c & 0xFE) == 56;
      case 43:
        __c = 1LL;
        if (v2 != 9 && v2 != 32 && v2 != 125) {
          return v2 == 160;
        }
        return __c;
      case 44:
        v3 = "#0-1|4$k'\x7F";
        goto LABEL_88;
      case 45:
        v3 = "#123456789";
LABEL_88:
        v7 = v2;
        v8 = 11LL;
        goto LABEL_89;
      default:
        return 0LL;
    }
  }

  return __c;
}

  if (is_common_abbrev(v5) || is_url(v5)) {
    return 0LL;
  }
  create_buffer(1, (uint64_t)v5, 0LL);
  v7 = no_exception(1, byte_4786E, (unsigned __int8 *)byte_999D8);
  result = 0LL;
  if (!v7)
  {
    v9 = 0LL;
    while (1)
    {
      v10 = v5[v9 + 1];
      if ((!a3 || !memchr("bcdfghjklmnpqrstvwxz", v10 | 0x20u, 0x15uLL))
        && (!v10 || !memchr("bcdfghjklmnpqrstvwxz", v10, 0x15uLL)))
      {
        break;
      }

      result = 0LL;
      if (++v9 == 4) {
        return result;
      }
    }

    v11 = &v5[v9 + 1];
    v14 = (const char *)&v5[v9 + 2];
    if (!strncmp(v14, "'.", 2uLL)) {
      return is_separator(v11);
    }
    result = 0LL;
    v15 = *(unsigned __int8 *)v14;
    if (v15 != 39 && v15 != 46) {
      return is_separator(v11);
    }
  }

  return result;
}

uint64_t char_count(unsigned __int8 *a1, unsigned __int8 a2)
{
  uint64_t result = 0LL;
  unsigned int v4 = *a1;
  if (v4 >= 0x21 && v4 != 160)
  {
    LODWORD(result) = 0;
    v5 = a1 + 1;
    do
    {
      if (v4 == a2) {
        uint64_t result = (result + 1);
      }
      else {
        uint64_t result = result;
      }
      unsigned int v6 = *v5++;
      unsigned int v4 = v6;
    }

    while (v6 >= 0x21 && v4 != 160);
  }

  return result;
}

unsigned __int8 *find_in(unsigned __int8 *a1, int a2)
{
  unsigned __int8 v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  unsigned int v4 = a1;
  while (!in(v2, a2))
  {
    int v5 = *++v4;
    unsigned __int8 v2 = v5;
    if (!v5) {
      return 0LL;
    }
  }

  return v4;
}

uint64_t get_binary_dots(unsigned __int8 a1, uint64_t a2)
{
  int v2 = a1;
  uint64_t result = 0LL;
  if (a2)
  {
    while (*(unsigned __int8 *)(a2 + result) != v2)
    {
      if (++result == 256) {
        return 0LL;
      }
    }
  }

  else
  {
    while (brl_set_ansi[result] != v2)
    {
      if (++result == 256) {
        return 0LL;
      }
    }
  }

  return result;
}

uint64_t get_binary_char(unsigned __int8 a1, uint64_t a2)
{
  int v2 = &brl_set_ansi[a1];
  if (a2) {
    int v2 = (char *)(a2 + *v2);
  }
  return *v2;
}

uint64_t lower_digit(unsigned __int8 a1)
{
  else {
    v1 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * a1);
  }
  return *v1;
}

uint64_t antoine_digit(unsigned __int8 a1)
{
  else {
    v1 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * a1);
  }
  return *v1;
}

uint64_t equals_nocase(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    do
      int v2 = *a1++;
    while (v2 == 173 || v2 == 30);
    int v4 = *a2;
    if (((v4 ^ v2) & 0xFFFFFFDF) != 0) {
      break;
    }
    if (!*(a1 - 1) && v4 != 0) {
      break;
    }
    if (!*++a2) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t equals(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    do
      int v2 = *a1++;
    while (v2 == 173 || v2 == 30);
    if (v2 != *a2) {
      break;
    }
    if (!*++a2) {
      return 1LL;
    }
  }

  return 0LL;
}

unsigned __int8 **has_whitespace(unsigned __int8 **result, unsigned __int8 **a2)
{
  if (result != a2)
  {
    BOOL v3 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
    int v4 = 1;
    do
    {
      uint64_t result = (unsigned __int8 **)result[6];
      if (!result) {
        return result;
      }
      int v5 = **result;
      if (((_WORD)result[3] & 0x20E4) != 0)
      {
        if (v5 == 45) {
          goto LABEL_12;
        }
      }

      else
      {
        if (**result <= 0x2Cu)
        {
          if (v5 != 9 && v5 != 32) {
            continue;
          }
          goto LABEL_21;
        }

        if (v5 == 45)
        {
          if (nLangIDGlb != 9) {
            goto LABEL_26;
          }
LABEL_12:
          if ((nSubLangIDGlb & 0xFFFFFFFD) == 1) {
            continue;
          }
LABEL_21:
          if (v3)
          {
            if (v4 > 1) {
              return (unsigned __int8 **)(&dword_0 + 1);
            }
          }

          else
          {
LABEL_26:
            if (nLangIDGlb != 12 && nLangIDGlb != 9 || v4 > 2) {
              return (unsigned __int8 **)(&dword_0 + 1);
            }
          }

          ++v4;
          continue;
        }

        if (v5 == 160) {
          goto LABEL_21;
        }
      }
    }

    while (result != a2);
  }

  return 0LL;
}

BOOL zweiformig_enabled(int a1, uint64_t a2, uint64_t a3)
{
  int v3 = *(int *)((char *)&dword_8 + (void)pLangGlb);
  if ((v3 & 0x80000000) == 0)
  {
    int v4 = *pLangGlb + 4;
    int v5 = v3 + 1;
    while (*(v4 - 1) != (_BYTE *)&dword_0 + 2 || *(unsigned __int16 *)*(v4 - 3) != a1)
    {
      v4 += 5;
      if (!--v5) {
        goto LABEL_6;
      }
    }

    v12 = *v4;
    return ((unint64_t)v12 & (a3 | 0x80000000LL)) == 0;
  }

LABEL_6:
  int v6 = *(int *)((char *)&dword_18 + (void)pLangGlb);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = (char **)(*(void *)((char *)&dword_10 + (void)pLangGlb) + 56LL);
    int v8 = v6 + 1;
    while (*(v7 - 4) != (_BYTE *)&dword_0 + 2 || *(unsigned __int16 *)*(v7 - 6) != a1)
    {
      v7 += 8;
      if (!--v8) {
        goto LABEL_11;
      }
    }

    v12 = *v7;
    return ((unint64_t)v12 & (a3 | 0x80000000LL)) == 0;
  }

  if (v0 != 12) {
    return 1LL;
  }
  if (qword_99A18 == 0x2000)
  {
    int v2 = *(unsigned __int8 *)(qword_99A00 - 1);
  }

  uint64_t result = 1LL;
  if ((lFlags & 0x4000) == 0 && (byte_999EC & 1) == 0 && (byte_99A54 & 1) == 0)
  {
    int v5 = *(int *)((char *)&dword_8 + (void)pLangGlb);
    if ((v5 & 0x80000000) == 0)
    {
      int v6 = 0;
      v7 = (unsigned __int8 **)*pLangGlb;
      int v8 = qword_99A38;
      BOOL v9 = pBwdLangGlb;
      while ((*((_BYTE *)v7 + 33) & 0x40) == 0)
      {
LABEL_19:
        v7 += 5;
        v1 = v6++ == v5;
        if (v1) {
          return 1LL;
        }
      }

      BOOL v10 = v7[1];
      v11 = (unsigned __int8 *)v8;
      do
      {
        do
          v12 = *v11++;
        while (v12 == 173 || v12 == 30);
        if (v12 != *v10) {
          goto LABEL_19;
        }
      }

      while (*++v10);
      v15 = v7[3];
      v16 = v15[v8];
      if (v16 >= 0x21)
      {
        if (no_exception(1, "\t[=):;/,+?\x01", &v15[v8]) {
          && (v17 = &v15[v8], no_exception(1, "a+\x01", v17 - 1)))
        }
        {
          if (v16 == 45 || v17[1] < 0x21u) {
            goto LABEL_38;
          }
        }

        else if (v16 == 45)
        {
          goto LABEL_38;
        }
      }

LABEL_11:
  BOOL v9 = (a3 & 0x100) == 0;
  else {
    BOOL v10 = v9;
  }
  return a2 == 2 && v10;
}

BOOL equals_zweiformig(const char *a1, uint64_t a2)
{
  size_t v4 = strlen(a1);
  uint64_t v5 = v4;
  if (v4 == 2) {
    goto LABEL_9;
  }
  if (v4 != 3) {
    return 0LL;
  }
  unsigned __int8 v6 = a1[2];
  if (nLangIDGlb != 9)
  {
LABEL_9:
    int v7 = *(unsigned __int8 *)a1;
  }

  else
  {
    int v7 = *(unsigned __int8 *)a1;
    if ((v7 | 4) == 0x45) {
      return 0LL;
    }
  }

  int v9 = nLangIDGlb;
  int v10 = *((unsigned __int8 *)a1 + 1);
  if (v7 == 220 && nLangIDGlb == 7 && v10 == 72) {
    return 1LL;
  }
  v11 = *(unsigned __int16 **)((char *)&stru_20.vmsize + (void)pLangGlb);
  unsigned __int16 v12 = *v11;
  if (!*v11) {
    return 0LL;
  }
  int v13 = (char)v10;
  unsigned __int16 v14 = (char)(v7 | 0x20) | (unsigned __int16)((char)v10 << 8) | 0x2000;
  v15 = v11 + 1;
  while (v12 != v14 || !zweiformig_enabled(v14, v5, a2))
  {
    BOOL result = 0LL;
    int v16 = *v15++;
    unsigned __int16 v12 = v16;
    if (!v16) {
      return result;
    }
  }

  if (v9 != 7) {
    return 1LL;
  }
  return memchr("CQX", v13, 4uLL) == 0LL;
}

uint64_t equals_mehrformig(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if ((unint64_t)(v1 - 3) <= 1)
  {
    uint64_t v3 = 0LL;
    while (1)
    {
      char v4 = *(_BYTE *)(*(void *)a1 + v3);
      if (v1 == ++v3)
      {
        int v5 = *(int *)((char *)&dword_18 + (void)pLangGlb);
        if (v5 < 0) {
          return 0LL;
        }
        uint64_t v6 = *(void *)((char *)&dword_10 + (void)pLangGlb) + 56LL;
        int v7 = v5 + 1;
        while (v1 != *(void *)(v6 - 32)
             || (*(_BYTE *)(v6 + 1) & 0x80) != 0
             || !equals_nocase(*(unsigned __int8 **)a1, *(unsigned __int8 **)(v6 - 48)))
        {
          v6 += 64LL;
          if (!--v7) {
            return 0LL;
          }
        }

        return 1LL;
      }
    }
  }

  return 0LL;
}

BOOL is_url(unsigned __int8 *a1)
{
  if (nLangIDGlb == 10) {
    return 0LL;
  }
  int v2 = a1;
  if (equals_nocase(a1, "www"))
  {
    int v3 = 1;
    int v4 = -1;
  }

  else
  {
    int v3 = equals_nocase(v2, "ftp");
    int v4 = -v3;
  }

  int v5 = *v2;
  if (v5 != 160 && v5 > 0x20 || (v5 & 0xFE) == 30)
  {
    int v19 = 0;
    int v18 = 0;
    while (1)
    {
      if (v5 <= 90)
      {
        switch(v5)
        {
          case '(':
          case ')':
          case ',':
          case '/':
          case ';':
          case '<':
          case '>':
            goto LABEL_25;
          case '*':
          case '+':
          case '-':
          case '0':
          case '1':
          case '2':
          case '3':
          case '4':
          case '5':
          case '6':
          case '7':
          case '8':
          case '9':
          case '=':
          case '?':
            goto LABEL_38;
          case '.':
            if (v2[1] >= 0x21u && v2[2] > 0x20u) {
              ++v4;
            }
            goto LABEL_29;
          case ':':
            int v13 = v2;
            unsigned __int16 v14 = "//";
            break;
          case '@':
            int v4 = 0;
            if (v18 >= 1) {
              int v19 = 1;
            }
            ++v18;
            goto LABEL_29;
          default:
            goto LABEL_25;
        }

        while (1)
        {
          do
          {
            int v16 = *++v13;
            int v15 = v16;
          }

          while (v16 == 173 || v15 == 30);
          if (++v14 == "")
          {
            if (v19) {
              goto LABEL_29;
            }
            BOOL result = 0LL;
            if (v4 <= 0 && v18 <= 0)
            {
              int v19 = 0;
              ++v3;
              ++v4;
              goto LABEL_29;
            }

            return result;
          }
        }
      }

      char v8 = v5 - 123;
      if (((1LL << v8) & 0x4000018000000LL) == 0) {
        break;
      }
LABEL_29:
      int v10 = *++v2;
      int v5 = v10;
    }

    if (((1LL << v8) & 5) == 0)
    {
LABEL_24:
      if ((v5 - 91) >= 3)
      {
LABEL_38:
        goto LABEL_29;
      }
    }

LABEL_25:
    unsigned int v9 = v2[1];
    if (v9 >= 0x21 && v9 != 160 && !memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v9, 0x15uLL)) {
      int v19 = 1;
    }
    goto LABEL_29;
  }

  int v18 = 0;
  int v19 = 0;
LABEL_54:
  if (v3 > 0) {
    return v4 > 0;
  }
  BOOL result = 0LL;
  if (v18 >= 1 && !v19) {
    return v4 > 0;
  }
  return result;
}

    if (v1[1] == 30 && v1[2])
    {
      qword_99A38 = (uint64_t)(v1 + 1);
      qword_999F8 = 1LL;
      ++v1;
    }

    v0 = pBwdLangGlb;
    if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb), v1)
      && v1[1] >= 0x21u)
    {
      qword_99A18 = 0x4000000LL;
      qword_99A38 = (uint64_t)(v1 + 1);
      *int v7 = v1[1];
      qword_99A00 = (uint64_t)(v7 + 1);
      uint64_t v1 = (unsigned __int8 *)qword_99A38;
      int v13 = qword_99A38 + 1;
      unsigned __int16 v14 = *(unsigned __int8 *)(qword_99A38 + 1);
      v0 = pBwdLangGlb;
      if (v14 != 30) {
        goto LABEL_33;
      }
      if (*(_BYTE *)(qword_99A38 + 2))
      {
        ++qword_99A38;
        qword_999F8 = 1LL;
        unsigned __int16 v14 = v1[2];
        uint64_t v1 = (unsigned __int8 *)v13;
LABEL_33:
        if (v14 >= 0x21
          && !no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v1 + 1)
          && *(void *)(qword_99A30 + 24) == 0x4000000LL
          && !strcmp(*(const char **)qword_99A30, (const char *)qword_99A20))
        {
          qword_99A18 = 0x2000000LL;
        }
      }
    }
  }

uint64_t no_exception(int a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned int v4 = *a2;
  uint64_t result = v4 == 9;
  if (v4 == 9)
  {
    ++a2;
  }

  else if (v4 < 3)
  {
    return 1LL;
  }

  BOOL v6 = a1 == 0;
  uint64_t v7 = -1LL;
  if (!v6) {
    uint64_t v7 = 1LL;
  }
  do
  {
    if (nLangIDGlb == 9 && *a2 == 8)
    {
      if (nSubLangIDGlb != 1) {
        return v4 != 9;
      }
      ++a2;
    }

    unsigned int v8 = *a3;
    unsigned int v9 = a3;
    while (1)
    {
      if (v8 == 30 || v8 == 173) {
        goto LABEL_26;
      }
      unsigned int v10 = *a2;
      if (v10 != 91)
      {
        goto LABEL_25;
      }

      v11 = a2 + 1;
      int v12 = 1;
      do
      {
        a2 = v11;
        unsigned int v10 = *v11;
        if (v10 == 93) {
          break;
        }
        ++v11;
      }

      while (a2[1] > 2u);
      if (v12) {
        break;
      }
LABEL_25:
      ++a2;
LABEL_26:
      v9 += v7;
      unsigned int v8 = *v9;
      if (!*v9)
      {
        unsigned int v10 = *a2;
        if (v10 >= 3)
        {
          do
LABEL_34:
            unsigned int v13 = *++a2;
          while (v13 > 2);
          goto LABEL_35;
        }

LABEL_28:
        if (v10 != 2) {
          return result;
        }
        goto LABEL_35;
      }
    }

    if (v10 >= 3) {
      goto LABEL_34;
    }
    if (!v8) {
      goto LABEL_28;
    }
    if (v10) {
      return result;
    }
LABEL_35:
    ;
  }

  while (*++a2);
  return v4 != 9;
}

uint64_t init_index(uint64_t result, uint64_t a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = result - 1;
    int v3 = 1;
    do
    {
      seg_index[*(unsigned __int8 *)(v2 + a2)] = v3;
      seg_start[*(unsigned __int8 *)(v2 + a2)] = v2 + a2;
      ++v3;
      --a2;
    }

    while (a2);
  }

  return result;
}

unsigned __int8 *reset_index(unsigned __int8 *a1)
{
  unsigned int v3 = *a1;
  uint64_t result = a1 + 1;
  uint64_t v2 = v3;
  do
  {
    seg_index[v2] = 0;
    unsigned int v4 = *result++;
    uint64_t v2 = v4;
  }

  while (v4);
  return result;
}

uint64_t is_any_number(unsigned __int8 *a1)
{
  if (*a1 == 30) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = a1;
  }
  uint64_t v2 = *v1;
  if ((v2 | 0x80) == 0xA0)
  {
    uint64_t v3 = 1LL;
    if (v1[1] == 30) {
      uint64_t v3 = 2LL;
    }
    uint64_t v2 = v1[v3];
    if (v1[1] == 30) {
      v1 += 2;
    }
    else {
      ++v1;
    }
  }

  if (!in(v2, 2)) {
    goto LABEL_21;
  }
  do
  {
    unsigned int v4 = v1;
    int v5 = v1[1];
    BOOL v6 = v5 == 30;
    if (v5 == 30) {
      uint64_t v7 = 2LL;
    }
    else {
      uint64_t v7 = 1LL;
    }
    if (v6) {
      v1 += 2;
    }
    else {
      ++v1;
    }
    uint64_t v8 = v4[v7];
  }

  while (in(v8, 2));
  if (*v4 && (!memchr("IVXLCDM", *v4, 8uLL) || !in(v8, 9)))
  {
    if ((_DWORD)v8 == 30) {
      unsigned int v10 = v1 + 1;
    }
    else {
      unsigned int v10 = v1;
    }
    unsigned int v9 = *v10;
    if ((v9 | 0x80) == 0xA0)
    {
      uint64_t v11 = 1LL;
      if (v10[1] == 30) {
        uint64_t v11 = 2LL;
      }
      unsigned int v9 = v10[v11];
    }

    if (v9 <= 1) {
      LOBYTE(v9) = 1;
    }
  }

  else
  {
LABEL_21:
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

BOOL is_decimal_number(unsigned __int8 *a1)
{
  uint64_t v1 = a1 + 1;
  if (*a1 != 30) {
    uint64_t v1 = a1;
  }
  int v2 = *v1;
  if ((v2 | 0x80) == 0xA0)
  {
    uint64_t v3 = 1LL;
    if (v1[1] == 30) {
      uint64_t v3 = 2LL;
    }
    int v2 = v1[v3];
    if (v1[1] == 30) {
      v1 += 2;
    }
    else {
      ++v1;
    }
  }

  if ((v2 - 58) < 0xFFFFFFF6)
  {
LABEL_18:
    if ((v2 | 2) == 0x2E) {
      return v1[1] - 48 < 0xA;
    }
  }

  else
  {
    while (1)
    {
      int v4 = v1[1];
      BOOL v5 = v4 == 30;
      uint64_t v6 = v4 == 30 ? 2LL : 1LL;
      int v2 = v1[v6];
      if (v5) {
        v1 += 2;
      }
      else {
        ++v1;
      }
      if (!v2) {
        break;
      }
    }
  }

  return 0LL;
}

BOOL is_number(unsigned __int8 *a1)
{
  uint64_t v1 = a1 + 1;
  if (*a1 != 30) {
    uint64_t v1 = a1;
  }
  int v2 = *v1;
  if (!*v1) {
    goto LABEL_8;
  }
  if (v2 != 43 && v2 != 45)
  {
LABEL_8:
    if (v2 != stru_B8.segname[(void)pLangGlb]
      && v2 != stru_B8.segname[(void)pLangGlb + 2])
    {
      return 0LL;
    }
  }

  int v3 = v1[1];
  if (!v1[1]) {
    goto LABEL_14;
  }
  if (v3 == 30)
  {
    BOOL result = 1LL;
  }

  else
  {
LABEL_14:
    BOOL result = 0LL;
  }

  int v5 = stru_B8.segname[(void)pLangGlb];
  if (v3 == v5 || v3 == stru_B8.segname[(void)pLangGlb + 2])
  {
    int v6 = v1[2];
    if (v1[2])
    {
      if (v6 == 30)
      {
        int v7 = v1[3];
        if (v1[3])
        {
          unsigned int v8 = v7 - 58;
          BOOL v9 = (v7 - 58) > 0xFFFFFFF5;
          if (v8 >= 0xFFFFFFF6 || !result) {
            return v9;
          }
          int v11 = 30;
LABEL_28:
          if (v11 == v5 || v11 == stru_B8.segname[(void)pLangGlb + 2])
          {
            int v12 = v1[3];
            if (v1[3])
            {
              if ((v12 - 58) <= 0xFFFFFFF5)
              {
                if (v12 == 30) {
                  return v1[4] - 48 < 0xA;
                }
                return 0LL;
              }

              return 1LL;
            }
          }

          return 0LL;
        }
      }
    }
  }

  if (result)
  {
    int v11 = v1[2];
    goto LABEL_28;
  }

  return result;
}

void *is_roman_number(unsigned __int8 *a1)
{
  if (*a1 == 30) {
    uint64_t v1 = a1 + 1;
  }
  else {
    uint64_t v1 = a1;
  }
  if (!*v1) {
    return 0LL;
  }
  BOOL result = memchr("IVXLCDM", *v1, 8uLL);
  if (!result) {
    return result;
  }
  int v4 = v1 + 1;
  int v3 = v1[1];
  if (!v1[1]) {
    return &dword_0 + 1;
  }
  if (v3 == 30)
  {
    int v3 = v1[2];
    int v4 = v1 + 2;
  }

  if (!v3) {
    return 0LL;
  }
  BOOL result = memchr("IVXLCDM", v3, 8uLL);
  if (!result) {
    return result;
  }
  int v5 = v4[1];
  if (v4[1])
  {
    if (v5 == 30) {
      int v5 = v4[2];
    }
    if (v5) {
      return (void *)(memchr("IVXLCDM", v5, 8uLL) != 0LL);
    }
    return 0LL;
  }

  return &dword_0 + 1;
}

unint64_t is_figure(int a1, unsigned __int8 *a2, uint64_t a3, int a4)
{
  if ((uint64_t)&a2[-a3] < 0)
  {
    unint64_t v5 = 0LL;
LABEL_9:
    uint64_t v7 = *a2;
  }

  else
  {
    uint64_t v4 = 0LL;
    unint64_t v5 = 0LL;
    uint64_t v6 = -1LL;
    if (a1) {
      uint64_t v6 = 1LL;
    }
    while (a2[v4])
    {
      if (a2[v4] - 58 >= 0xFFFFFFF6)
      {
        ++v5;
        v4 += v6;
      }

      a2 += v4;
      goto LABEL_9;
    }

    uint64_t v7 = 0LL;
    a2 += v4;
  }

  if ((_DWORD)v7 == stru_B8.segname[(void)pLangGlb + 2])
  {
    unsigned int v8 = a2[1];
    if (v8 != 45 && v8 > 0x20) {
      return 0LL;
    }
  }

  if (!a1 && (_DWORD)v7 == stru_B8.segname[(void)pLangGlb])
  {
    unsigned int v9 = a2[1];
    if (v9 != 45 && v9 > 0x20) {
      return 0LL;
    }
  }

  if ((v7 | 2) == 0x2F)
  {
    if (a1 || v5 > 2 || a2[1] - 58 < 0xFFFFFFF6 || a2[2] - 58 < 0xFFFFFFF6)
    {
      if (a4) {
        return v5;
      }
    }

    else if (!a2[3] || a4 || a2[3] - 58 < 0xFFFFFFF6)
    {
      return v5;
    }
  }

  if (in(v7, 25)) {
    return 0LL;
  }
  return v5;
}

char *create_buffer(int a1, uint64_t a2, uint64_t a3)
{
  BOOL result = byte_999D8;
  if (a2 - a3 < 0)
  {
    unint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = 0LL;
    BOOL v9 = a1 == 0;
    uint64_t v7 = -1LL;
    if (!v9) {
      uint64_t v7 = 1LL;
    }
    do
    {
      unsigned int v8 = *(unsigned __int8 *)(a2 + v5);
      BOOL v9 = v8 > 0x20 || v8 == 30;
      if (!v9) {
        break;
      }
      if (v8 != 30 && v8 != 173)
      {
        if (v8 > 0x60) {
          LOBYTE(v8) = v8 & 0xDF;
        }
        byte_999D8[v6++] = v8;
      }

      if (v6 > 0xE) {
        break;
      }
      uint64_t v10 = v7 + a2 - a3 + v5;
      v5 += v7;
    }

    while ((v10 & 0x8000000000000000LL) == 0);
  }

  byte_999D8[v6] = 0;
  return result;
}

unint64_t is_generic_abbrev(unsigned __int8 *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  while (1)
  {
    int v4 = *a1;
    if ((!in(*a1, 9) || a1[1] != 46) && ((v4 | 0x80) != 0xA0 || !in(a1[1], 9) || a1[2] != 46)) {
      break;
    }
    if ((v4 | 0x80) == 0xA0) {
      uint64_t v5 = a1 + 1;
    }
    else {
      uint64_t v5 = a1;
    }
    if ((v4 | 0x80) == 0xA0) {
      unint64_t v6 = v3 + 1;
    }
    else {
      unint64_t v6 = v3;
    }
    unint64_t v3 = v6 + 2;
    a1 = v5 + 2;
  }

  if (v3 <= 3) {
    return 0LL;
  }
  else {
    return v3 - 1;
  }
}

uint64_t is_common_abbrev(unsigned __int8 *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0LL;
  }
  unint64_t v3 = *(_BYTE **)(*(void *)&stru_20.segname[(void)pLangGlb + 16] + 8LL * hash_map[*a1]);
  int v4 = *v3;
  if (!*v3) {
    return 0LL;
  }
  int v5 = a1[1];
  while (1)
  {
    if (v4 == 36) {
      ++v3;
    }
    int v6 = *v3;
    int v11 = a1 + 1;
    int v9 = a1[1];
    if (!*v3) {
      goto LABEL_33;
    }
LABEL_31:
    while (*++v3)
      ;
LABEL_36:
    int v19 = *++v3;
    int v4 = v19;
    if (!v19) {
      return 0LL;
    }
  }

  int v8 = 1;
  LOBYTE(v9) = a1[1];
  uint64_t v10 = a1 + 1;
  do
  {
    int v11 = v10 + 1;
    if (v6 == 46)
    {
      if ((*v11 | 0x80) == 0xA0) {
        int v11 = v10 + 2;
      }
      else {
        int v11 = v10 + 1;
      }
      int v12 = 0;
    }

    else
    {
      int v12 = v8 + 1;
      if (v8 >= 1)
      {
        if ((_BYTE)v9)
        {
          uint64_t result = 0LL;
        }
      }
    }

    int v14 = *++v3;
    int v6 = v14;
    int v9 = *v11;
    int v15 = (v9 ^ v14) & 0xDF;
    BOOL v16 = v14 == v9 || v15 == 0;
    int v8 = v12;
    uint64_t v10 = v11;
  }

  while (v16);
  if (v6) {
    goto LABEL_31;
  }
LABEL_33:
  if (v9 != 46) {
    goto LABEL_36;
  }
  unsigned int v18 = v11[1];
  if (v18 >= 0x41 && v18 != 160) {
    goto LABEL_36;
  }
  if (nLangIDGlb != 7
    || (v18 <= 0x2F && ((1LL << v18) & 0xA00100000000LL) != 0 || v18 == 160) && in(v11[2], 9) && in(v11[3], 9))
  {
    return v11 - a1;
  }

  create_buffer(1, (uint64_t)a1, 0LL);
  int v20 = no_exception(1, "\tIE\x01AU\x01\xC4\x55\x01EU\x01CH\x01SCH\x01ST\x01", (unsigned __int8 *)byte_999D8);
  uint64_t result = 0LL;
  if (!v20) {
    return v11 - a1;
  }
  return result;
}

BOOL is_separator(unsigned __int8 *a1)
{
  BOOL result = 0LL;
  int v3 = *a1;
  if (v3 != 30 && v3 != 173)
  {
    if (in(*a1, 9)) {
      return 0LL;
    }
    else {
      return !v3 || v3 != 46 && !memchr(",;:!?", v3, 6uLL) || !in(a1[1], 11);
    }
  }

  return result;
}

uint64_t is_measurement(unsigned __int8 *a1, int a2, int a3)
{
  int v5 = a1;
  if (!a3)
  {
    unsigned int v6 = *a1;
    if (!*a1) {
      return 0LL;
    }
    goto LABEL_10;
  }

  unsigned int v6 = *v5;
  if (!memchr("bcdfghjklmnpqrstvwxz", v6 | 0x20, 0x15uLL) || !memchr("bcdfghjklmnpqrstvwxz", v5[1] | 0x20u, 0x15uLL))
  {
    if (!v6) {
      return 0LL;
    }
LABEL_10:
    if (memchr("bcdfghjklmnpqrstvwxz", v6, 0x15uLL) && v5[1] && memchr("bcdfghjklmnpqrstvwxz", v5[1], 0x15uLL)) {
      goto LABEL_13;
    }
    if (!a3) {
      goto LABEL_27;
    }
    if ((v6 + 64) < 0x1Fu)
    {
LABEL_32:
      create_buffer(1, (uint64_t)v5, 0LL);
      if (no_exception( 1,  "\tAR\x01gy\x01HA\x01OZ\x01PA\x01UG\x01UL\x01YD\x01ZE\x01",  (unsigned __int8 *)byte_999D8)
        && is_separator(v5 + 2))
      {
        return 1LL;
      }

      create_buffer(1, (uint64_t)v5, 0LL);
      if (no_exception( 1,  "\tATM\x01IHT\x01IND\x01LER\x01RAD\x01KAT\x01MIN\x01MOL\x01SE[CK\x01YRD\x01",  (unsigned __int8 *)byte_999D8))
      {
        int v11 = v5 + 3;
        return is_separator(v11);
      }

      return 0LL;
    }

    if ((v6 - 91) <= 0xE5u)
    {
LABEL_27:
    }

    if (v6 <= 0x77 && (v6 - 97) >= 3u && v6 != 111 && v6 != 117)
    {
      unint64_t v12 = is_generic_abbrev(v5);
      if (a2)
      {
        if (!v12)
        {
          if (!strncmp((const char *)v5 + 1, "'.", 2uLL) || (int v13 = v5[1], v13 != 39) && v13 != 46)
          {
            if (is_separator(v5 + 1)) {
              return 1LL;
            }
          }
        }
      }
    }

    goto LABEL_32;
  }

uint64_t timespec_follows(_BYTE *a1)
{
  int v1 = *a1;
  if (!*a1) {
    return 0LL;
  }
  for (uint64_t i = (uint64_t)a1; ; ++i)
  {
    int v3 = memchr(".:\x1E \xA0\xB0", v1, 7uLL);
    int v4 = *(unsigned __int8 *)(i + 1);
    int v1 = v4;
    if (!v4) {
      return 0LL;
    }
  }

  if (v1 == 45
    && *(unsigned __int8 *)(i + 1) - 1 <= 0x1F
    && *(unsigned __int8 *)(i + 2) - 58 > 0xFFFFFFF5)
  {
    return 1LL;
  }

  unsigned int v6 = *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pLangGlb);
  create_buffer(1, i, 0LL);
  return no_exception(1, v6, (unsigned __int8 *)byte_999D8);
}

void *append_list_element(void *result, const char *a2, uint64_t a3)
{
  if (!bMemoryOverflow)
  {
    int v5 = result;
    uint64_t result = malloc(0x38uLL);
    if (result)
    {
      unsigned int v6 = result;
      *uint64_t result = a2;
      result[2] = 0LL;
      uint64_t result = (void *)strlen(a2);
      v6[1] = result;
      v6[3] = a3;
      v6[4] = 0LL;
      uint64_t v7 = v5[6];
      v6[5] = v5;
      v6[6] = v7;
      if (v7) {
        *(void *)(v7 + 40) = v6;
      }
      v5[6] = v6;
    }

    else
    {
      bMemoryOverflow = 1;
    }
  }

  return result;
}

void *terminate_upper(uint64_t a1)
{
  int v1 = *(unsigned __int8 **)(a1 + 48);
  int v2 = (unsigned __int8 *)*((void *)v1 + 6);
  if (v2)
  {
    while (1)
    {
      int v3 = **(unsigned __int8 **)v2;
      if ((v3 == 9 || v3 == 160 || v3 == 32) && (int v4 = (unsigned __int8 *)*((void *)v2 + 6)) != 0LL)
      {
        if ((v4[24] & 0xC0) != 0) {
          int v5 = (unsigned __int8 *)*((void *)v2 + 6);
        }
        else {
          int v5 = v1;
        }
        int v1 = (unsigned __int8 *)*((void *)v5 + 6);
        if (!v1) {
          return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2LL);
        }
      }

      else
      {
        int v5 = v1;
        int v1 = v2;
      }

      if ((v1[24] & 0xDC) != 0 || **(_BYTE **)v1 == 47)
      {
        int v2 = (unsigned __int8 *)*((void *)v1 + 6);
        int v5 = v1;
        if (v2) {
          continue;
        }
      }

      return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2LL);
    }
  }

  int v5 = *(unsigned __int8 **)(a1 + 48);
  return append_list_element(v5, *(const char **)&stru_68.segname[(void)pLangGlb], 2LL);
}

const char **uppersign_follows(uint64_t a1, const char *a2)
{
  if (!a1) {
    return 0LL;
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (!v2) {
    return 0LL;
  }
  int v3 = *(const char ***)(v2 + 48);
  if (!v3) {
    return v3;
  }
  int v5 = pLangGlb;
  int v6 = nLangIDGlb;
  while (1)
  {
    uint64_t v7 = (uint64_t)v3[3];
    if (v7 != 2) {
      goto LABEL_13;
    }
    int v8 = (unsigned __int8 *)v3[6];
    if (!v8 || *((void *)v8 + 1) != 1LL || (v8[35] & 8) == 0) {
      break;
    }
    int v3 = (const char **)*((void *)v8 + 6);
    if (!v3) {
      return 0LL;
    }
    uint64_t v7 = (uint64_t)v3[3];
LABEL_13:
    if ((v7 & 0x10DC) == 0) {
      goto LABEL_14;
    }
LABEL_24:
    int v3 = (const char **)v3[6];
    if (!v3) {
      return 0LL;
    }
  }

  uint64_t v7 = 2LL;
LABEL_14:
  uint64_t v9 = *v3;
  int v10 = *(unsigned __int8 *)*v3;
  if (v10 == 9 || v10 == 32 || v10 == 160) {
    goto LABEL_24;
  }
  BOOL v11 = (v10 - 45) <= 1 && v6 == 9;
  if (v11
    || !strcmp(*v3, *(const char **)&stru_68.segname[(void)v5 + 8])
    || !strcmp(v9, *(const char **)((char *)&stru_68.size + (void)v5))
    || v10 == 47)
  {
    goto LABEL_24;
  }

  if (v7 != 2 || !v3[6] || strcmp(v9, a2)) {
    return 0LL;
  }
  return v3;
}

uint64_t lowerchar_follows(uint64_t result, int a2)
{
  if (!result) {
    return result;
  }
  int v2 = a2;
  int v3 = (unsigned __int8 **)result;
  if (a2)
  {
    if (*(void *)(result + 48)) {
      goto LABEL_4;
    }
    return 1LL;
  }

  uint64_t v13 = *(void *)(result + 40);
  if (v13)
  {
    unint64_t v14 = *(void *)(v13 + 24);
    if (v14 == 64
      || v14 == 128
      || v14 <= 2 && (uint64_t v16 = *(void *)(v13 + 40)) != 0 && ((v17 = *(void *)(v16 + 24), v17 == 128) || v17 == 64))
    {
      int v15 = *(const char **)result;
    }
  }

  unsigned int v18 = v3[6];
  if (!v18 || *((void *)v18 + 3) == 64LL) {
    return 1LL;
  }
  int v19 = **(unsigned __int8 **)v18;
  if (**(_BYTE **)v18
    && memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", **(unsigned __int8 **)v18, 0x15uLL))
  {
    uint64_t result = 1LL;
    char v20 = v19 - 39;
    if (((1LL << v20) & 0x100000000000041LL) == 0)
    {
      if (((1LL << v20) & 0x100020) == 0) {
        return result;
      }
      goto LABEL_4;
    }

    v21 = (unsigned __int8 *)*((void *)v18 + 6);
  }

  do
  {
LABEL_4:
    int v3 = (unsigned __int8 **)v3[6];
    if (!v3) {
      return v2 == 0;
    }
  }

  while (v3[3] == (_BYTE *)&dword_0 + 2);
  while (1)
  {
    int v4 = (uint64_t *)v3[3];
    if (!v4) {
      goto LABEL_21;
    }
    if (v4 == &stru_3D8.fileoff) {
      break;
    }
    if (((unsigned __int16)v4 & 0xB00) != 0
      || (v4 & 1) != 0 && ((int v6 = **v3, v6 != 10) ? (v7 = v6 == 13) : (v7 = 1), v7))
    {
LABEL_37:
      int v2 = 0;
      return v2 == 0;
    }

    if ((v4 & 0xC0) == 0)
    {
      int v8 = *v3;
      uint64_t v9 = **v3;
      BOOL v10 = in(v9, 11);
      BOOL v11 = (_DWORD)v9 == 45 || !v10;
      if (!v11 && v8[(void)v3[1] - 1] != 46) {
        goto LABEL_37;
      }
      if (v4 == (uint64_t *)&stru_20)
      {
        uint64_t v12 = (uint64_t)v3[1];
        if (v12 == 1)
        {
          if (in(v9, 41)) {
            goto LABEL_37;
          }
        }

        else if (v12 >= 2 && (_DWORD)v9 == 39)
        {
          goto LABEL_37;
        }
      }

      else if (v2 && v4 == (uint64_t *)((char *)&dword_0 + 2))
      {
        return v2 == 0;
      }
    }

LABEL_21:
    int v3 = (unsigned __int8 **)v3[6];
    if (!v3) {
      return v2 == 0;
    }
  }

  if (!v2)
  {
    uint64_t v5 = (uint64_t)v3[1];
    if (**(_BYTE **)v3[5] == 47) {
      goto LABEL_21;
    }
  }

  v3[3] = (_BYTE *)(&stru_3D8 + 40);
  int v2 = 1;
  return v2 == 0;
}

uint64_t upperchar_follows(uint64_t a1, int a2)
{
  for (uint64_t i = (_BYTE *)(a1 + 3); ; ++i)
  {
    int v4 = *(i - 2);
    if (v4 != 173 && v4 != 30) {
      break;
    }
  }

  if (in(*(i - 2), 9))
  {
    for (uint64_t j = 1LL; ; uint64_t j = v8)
    {
      if (!(_BYTE)v4) {
        goto LABEL_17;
      }
      uint64_t v8 = 1LL;
      if (!a2 || (_DWORD)j) {
        return v8;
      }
LABEL_32:
      int v4 = *(i - 1);
      BOOL v11 = in(*(i - 1), 11) || v4 == 30;
      if (!v11 && v4 != 173) {
        return v8;
      }
      ++i;
    }

    if (v4 == 30 || v4 == 173)
    {
      uint64_t v8 = j;
      goto LABEL_32;
    }

LABEL_17:
    uint64_t v8 = 0LL;
    if (a2 && (_DWORD)j)
    {
      int v9 = *(i - 1);
      if (*(i - 1))
      {
        uint64_t v8 = 1LL;
      }

      if (v9 == 173 || v9 == 30)
      {
        uint64_t v10 = *i;
        if (*i)
        {
          uint64_t v8 = 1LL;
        }

        if (!in(v10, 11)) {
          return 1LL;
        }
      }

      uint64_t v8 = 0LL;
    }

    goto LABEL_32;
  }

  return 1LL;
}

uint64_t brl_add_exception(uint64_t result, int a2)
{
  if (!result || !*(_BYTE *)result) {
    return result;
  }
  if (a2)
  {
    int v3 = &bwd_exceptions;
    int v4 = 100;
    while (*v3)
    {
      v3 += 160;
      if (!--v4) {
        return result;
      }
    }
  }

  else
  {
    int v3 = &exceptions;
    int v5 = 100;
    while (*v3)
    {
      v3 += 160;
      if (!--v5) {
        return result;
      }
    }
  }

  *((void *)v3 + 19) = 122880LL;
  int v6 = *(unsigned __int8 *)result;
  if (!*(_BYTE *)result) {
    return result;
  }
  uint64_t v7 = 0LL;
  while (v6 <= 124)
  {
    if (v6 == 9 || v6 == 32) {
      goto LABEL_22;
    }
LABEL_20:
    uint64_t v8 = result + v7++;
    int v6 = *(unsigned __int8 *)(v8 + 1);
    if (!v6) {
      return result;
    }
  }

  if (v6 != 160 && v6 != 125) {
    goto LABEL_20;
  }
LABEL_22:
  *((void *)v3 + 17) = v7;
  uint64_t v9 = result + v7 + 2;
  uint64_t result = __strncpy_chk(v3);
  v3[*((void *)v3 + 17)] = 0;
  unsigned __int8 v10 = *v3;
  if (a2)
  {
    if (*v3)
    {
      BOOL v11 = (unsigned __int8 *)(v3 + 1);
      do
      {
        int v12 = *v11++;
        unsigned __int8 v10 = v12;
      }

      while (v12);
    }
  }

  else if (*v3)
  {
    uint64_t v13 = (unsigned __int8 *)(v3 + 1);
    do
    {
      int v14 = *v13++;
      unsigned __int8 v10 = v14;
    }

    while (v14);
  }

  while (2)
  {
    int v15 = *(unsigned __int8 *)(v9 - 1);
    if (v15 > 0x1F)
    {
      if (v15 != 160 && v15 != 32) {
        goto LABEL_59;
      }
      goto LABEL_38;
    }

    if (v15 == 9)
    {
LABEL_38:
      ++v9;
      continue;
    }

    break;
  }

  if (!*(_BYTE *)(v9 - 1))
  {
LABEL_45:
    uint64_t result = strlen((const char *)(v9 - 1));
    uint64_t v16 = result;
    *((void *)v3 + 18) = result;
    uint64_t i = &byte_25B92;
    goto LABEL_46;
  }

LABEL_59:
  uint64_t v16 = 0LL;
  while (2)
  {
    if (v15 <= 124)
    {
      if (v15 == 9 || v15 == 32) {
        break;
      }
      goto LABEL_66;
    }

    if (v15 != 160 && v15 != 125)
    {
LABEL_66:
      int v15 = *(unsigned __int8 *)(v9 + v16++);
      if (!v15) {
        goto LABEL_45;
      }
      continue;
    }

    break;
  }

  *((void *)v3 + 18) = v16;
  for (uint64_t i = (char *)(v9 + v16); ; ++i)
  {
    int v23 = *i;
    if (v23 != 9 && v23 != 160 && v23 != 32) {
      break;
    }
  }

  uint64_t v17 = 0;
LABEL_60:
  char v20 = 0;
  int v21 = *i;
  if (i - v1 <= 2 && v21 == 46) {
    char v20 = is_date(v1);
  }
  v59 = v20;
  uint64_t v22 = 0;
  int v23 = 1;
  v24 = 1;
  while (1)
  {
    v25 = v23;
    for (k = (uint64_t)&(v1++)[v2]; ; ++k)
    {
      v27 = *v1;
      ++v1;
    }

    v28 = v27 - 46;
    if (((1LL << v28) & 0xFFC) != 0)
    {
      if (!v25)
      {
        ++v24;
        uint64_t v22 = 1;
      }

      int v23 = v25 + 1;
    }

    else
    {
      if (((1LL << v28) & 0x400000000001003LL) == 0) {
        break;
      }
      if (v25) {
        v29 = 1;
      }
      else {
        v29 = v17;
      }
      if (v29 != 1) {
        return 0LL;
      }
      if (v21 == 47)
      {
        if ((_DWORD)v27 == 104) {
          goto LABEL_99;
        }
        v30 = v1[1];
        if (!v1[1]
          || (v30 - 58) <= 0xFFFFFFF5
          && (v30 != 173 && v30 != 30 || v1[2] - 58 < 0xFFFFFFF6))
        {
          return 0LL;
        }

        if ((_DWORD)v27 != 47) {
          goto LABEL_99;
        }
      }

      v31 = v1[1];
      if (!v1[1]) {
        goto LABEL_96;
      }
      int v23 = 0;
      if ((v31 - 58) <= 0xFFFFFFF5)
      {
        if (v31 != 173 && v31 != 30) {
          goto LABEL_96;
        }
        int v23 = 0;
      }
    }
  }

  if (v25 | v22) {
    v32 = 1;
  }
  else {
    v32 = v17;
  }
  if (v32 != 1) {
    return 0LL;
  }
LABEL_96:
  if (v21 > 57)
  {
    if (v21 == 104 || v21 == 58)
    {
      int v12 = 0LL;
      if ((_DWORD)v27 != 32 || nLangIDGlb != 10 || v24 > 2) {
        return v12;
      }
      if (qword_99A38 > (unint64_t)qword_99A40)
      {
        int v12 = 0LL;
        goto LABEL_160;
      }

      if (v21 == 104) {
        return 0LL;
      }
    }
  }

  else
  {
    if (v21 == 46)
    {
      v36 = qword_99A38;
      if ((uint64_t)&i[-qword_99A38] <= 2
        && v22
        && v24 == 2
        && (timespec_follows(v1)
         || (v36 = qword_99A38, v38 = qword_99A40, qword_99A38 - qword_99A40 >= 3)
         && *(_BYTE *)(qword_99A38 - 1) == 32
         && ((v39 = *(unsigned __int8 *)(qword_99A38 - 2), (v39 & 0xFE) == 0x2C) || in(v39, 21))
         && in(*(unsigned __int8 *)(v36 - 3), 21)
         || v36 > v38 && *(_BYTE *)(v36 - 1) == 91 && *v1 == 93))
      {
        if (v25 == 1) {
          v37 = timespec_follows(v1);
        }
        else {
          v37 = 0;
        }
        add_time(v37);
      }

      else if (v17 {
             || (v40 = stru_B8.segname[(void)pLangGlb], v40 == 46)
      }
             || v40 != *v1 && ((uint64_t)&i[-v36] > 3 || v25 != 3))
      {
        int v12 = 0LL;
        v41 = v24 > 1 || v17;
        v42 = v24 <= 2 && nLangIDGlb == 9;
        if (v42 || !v41) {
          return v12;
        }
        uint64_t v22 = 0;
        v44 = k <= 8 && v25 == 4 && v24 == 3;
        v45 = v59;
        if (!v44) {
          v45 = 0;
        }
        v59 = v45;
        goto LABEL_160;
      }

      return 0LL;
    }

    if (v21 == 47)
    {
LABEL_99:
      if ((v24 & 1) != 0)
      {
        if (nLangIDGlb != 10) {
          uint64_t v22 = 0;
        }
        goto LABEL_160;
      }

      if (*(_BYTE *)qword_99A38 != 48
        && v3[2] != 48
        && (v27 < 0x21 || in(v27, 25) || v1[1] - 58 <= 0xFFFFFFF5))
      {
        if (qword_99A48)
        {
          v33 = qword_99A30;
          if (*(void *)(qword_99A30 + 24) == 2LL && *(void *)(qword_99A30 + 8) == 1LL)
          {
            v34 = *(void *)(qword_99A30 + 40);
            if (v34)
            {
              if (*(void *)(v34 + 24) == 64LL)
              {
                v35 = *(const char **)v34;
                if (!strchr(*(const char **)v34, 44) && !strchr(v35, 46))
                {
                  if (byte_99A50 == 1) {
                    **(_BYTE **)v33 = 31;
                  }
                  else {
                    *(void *)(v33 + 24) = 0LL;
                  }
                }
              }
            }
          }
        }

        goto LABEL_160;
      }

      return 0LL;
    }
  }

LABEL_46:
  if ((unint64_t)(v16 - 65) <= 0xFFFFFFFFFFFFFFBFLL)
  {
    *int v3 = 0;
    return result;
  }

  unsigned int v18 = v3 + 65;
  __strncpy_chk(v3 + 65);
  v3[*((void *)v3 + 18) + 65] = 0;
  if (!a2)
  {
    char v19 = *v18;
    if (*v18)
    {
      char v20 = (unsigned __int8 *)(v3 + 66);
      do
      {
        int v21 = *v20++;
        char v19 = v21;
      }

      while (v21);
    }
  }

  uint64_t result = __tolower(*i);
  if ((int)result > 108)
  {
    if ((_DWORD)result == 109)
    {
      uint64_t v22 = 0x8000LL;
    }

    else
    {
      if ((_DWORD)result != 115) {
        return result;
      }
      uint64_t v22 = 0x2000LL;
    }

    goto LABEL_78;
  }

  if ((_DWORD)result == 98)
  {
    uint64_t v22 = 0x4000LL;
LABEL_78:
    *((void *)v3 + 19) = v22;
    return result;
  }

  if ((_DWORD)result == 101)
  {
    uint64_t v22 = 0x10000LL;
    goto LABEL_78;
  }

  return result;
}

      if ((uint64_t)&v1[-v10] < 2 || (unsigned int v18 = *(v1 - 1), v18 >= 0x21) && v18 != 160)
      {
LABEL_53:
        if ((v15 | 0x80) == 0xA0)
        {
          char v19 = v3[3];
          if (!v3[3] || (uint64_t v17 = 1, v19 != 45) && v19 <= 0xDE && v19 - 97 >= 0x1A)
          {
            create_buffer(1, (uint64_t)(v3 + 3), qword_99A40);
            uint64_t v17 = no_exception( 1,  "\tJAN\x01FEB\x01M[A\xC4\x5DR\x01APR\x01MA[IY\x01JU[NL\x01AUG\x01SEP\x01O[CK]T\x01NOV\x01DE[CZ\x01SE[ CK\x01MI\x01ST[DU\x01TAG\x01MO[NR\x01JAH\x01D[IO\x01FR\x01S[AO\x01ABE\x01NAC\x01TEIL\x01AUFL\x01ZEHN \x01HUNDERT\x01TAUSEND\x01MILLI\x01",  (unsigned __int8 *)byte_999D8) != 0;
          }

          goto LABEL_60;
        }

        goto LABEL_59;
      }

      if ((*(v1 - 2) - 44) >= 0x10u || ((0xC005u >> (*(v1 - 2) - 44)) & 1) == 0)
      {
        create_buffer(0, (uint64_t)(v1 - 2), v10);
        uint64_t v17 = 1;
        int v15 = v3[2];
        goto LABEL_53;
      }

void brl_clear_exceptions()
{
  v0 = &exceptions;
  uint64_t v1 = 100LL;
  do
  {
    char *v0 = 0;
    v0[65] = 0;
    *((void *)v0 + 17) = 0LL;
    *((void *)v0 + 18) = 0LL;
    v0 += 160;
    --v1;
  }

  while (v1);
  int v2 = &bwd_exceptions;
  uint64_t v3 = 100LL;
  do
  {
    *int v2 = 0;
    v2[65] = 0;
    *((void *)v2 + 17) = 0LL;
    *((void *)v2 + 18) = 0LL;
    v2 += 160;
    --v3;
  }

  while (v3);
}

uint64_t brl_get_table(__int16 a1)
{
  else {
    return (uint64_t)*(&off_8CCC0 + (__int16)(a1 - 3));
  }
}

uint64_t brl_set_language(int a1, uint64_t a2)
{
  int v2 = a1 & 0x3FF;
  nLangIDGlb = v2;
  int v3 = a1 >> 10;
  nSubLangIDGlb = a1 >> 10;
  switch(v2)
  {
    case 12:
      int v4 = &BWD_LANG_FR;
      int v5 = &LANG_FR;
      break;
    case 10:
      int v4 = &BWD_LANG_ES;
      int v5 = &LANG_ES;
      break;
    case 9:
      if (v3 == 1)
      {
        int v4 = &BWD_LANG_ENU;
        int v5 = &LANG_ENU;
      }

      else if (v3 == 3)
      {
        int v4 = &BWD_LANG_UEB;
        int v5 = &LANG_UEB;
      }

      else
      {
        int v4 = &BWD_LANG_EN;
        int v5 = &LANG_EN;
      }

      break;
    default:
      int v4 = &BWD_LANG_DE;
      int v5 = &LANG_DE;
      break;
  }

  pLangGlb = v5;
  pBwdLangGlb = v4;
  nEncodingGlb = a2;
  bUpShiftGlb = a2 & 0x10000;
  pCharmapGlb = brl_get_table(a2);
  return 0LL;
}

uint64_t brl_get_binary_dots(unsigned __int8 a1)
{
  int v1 = a1;
  if (pCharmapGlb)
  {
    uint64_t v2 = 0LL;
    while (*(unsigned __int8 *)(pCharmapGlb + v2) != a1)
    {
      if (++v2 == 256)
      {
        int v1 = 0;
        goto LABEL_7;
      }
    }

    int v1 = v2;
  }

LABEL_7:
  uint64_t result = 0LL;
  while (brl_set_ansi[result] != v1)
  {
    if (++result == 256) {
      return 0LL;
    }
  }

  return result;
}

uint64_t brl_convert_to_utf(_BYTE *a1, _BYTE *a2, int a3)
{
  if (!a1 || !a2 && a3 > 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1 != a2 && (a3 & 0x80000000) == 0)
  {
    unsigned int v5 = *a1;
    if (*a1)
    {
      int v6 = 0;
      do
      {
        if (v5 > 0x1F)
        {
          if (v6 >= a3 - 2)
          {
            if (a3 > 0) {
              return 4294967294LL;
            }
            v6 += 2;
          }

          else
          {
            if (pCharmapGlb)
            {
              uint64_t v7 = 0LL;
              while (*(unsigned __int8 *)(pCharmapGlb + v7) != v5)
              {
                if (++v7 == 256)
                {
                  unsigned int v5 = 0;
                  goto LABEL_24;
                }
              }

              unsigned int v5 = v7;
            }

LABEL_24:
            uint64_t v8 = 0LL;
            while (brl_set_ansi[v8] != v5)
            {
              if (++v8 == 256)
              {
                LODWORD(v8) = 0;
                break;
              }
            }

            uint64_t v9 = v6;
            unsigned __int8 v10 = &a2[v6];
            *unsigned __int8 v10 = -30;
            v9 += 2LL;
            v10[1] = (v8 >> 6) | 0xA0;
            a2[v9] = v8 & 0x3F | 0x80;
            int v6 = v9;
          }
        }

        else if (v6 >= a3)
        {
          if (a3 > 0) {
            return 4294967294LL;
          }
        }

        else
        {
          a2[v6] = v5;
        }

        unsigned int v11 = *++a1;
        unsigned int v5 = v11;
        int v12 = v6 + 1;
        if (!v11) {
          break;
        }
      }

      while (v6++ < 2147483643);
    }

    else
    {
      int v12 = 0;
    }

    if (v12 >= a3)
    {
      if (a3 > 0) {
        return 4294967294LL;
      }
    }

    else
    {
      a2[v12] = 0;
    }

    return (v12 + 1);
  }

  return v3;
}

    unsigned int v5 = v2 & 0xDF;
    if (!a2) {
      unsigned int v5 = **result;
    }
    goto LABEL_26;
  }

  uint64_t v7 = qword_99A00;
  uint64_t v8 = qword_99A00;
  *(_BYTE *)qword_99A00 = 46;
  qword_99A00 = v8 + 1;
  if (((*result)[1] | 0x80) != 0xA0)
  {
    if (byte_99A50) {
      uint64_t v9 = 31;
    }
    else {
      uint64_t v9 = 32;
    }
    *(_BYTE *)(v7 + 1) = v9;
    unsigned __int8 v10 = v7 + 2;
    goto LABEL_28;
  }

uint64_t brl_convert_from_utf(unsigned __int8 *a1, unsigned __int8 *a2, int a3)
{
  if (!a1 || !a2 && a3 > 0) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a1 != a2 && (a3 & 0x80000000) == 0)
  {
    unsigned __int8 v5 = *a1;
    if (!*a1)
    {
      LODWORD(v6) = 0;
LABEL_43:
      if ((int)v6 >= a3)
      {
        if (a3 > 0) {
          return 4294967294LL;
        }
      }

      else
      {
        a2[v6] = 0;
      }

      return (v6 + 1);
    }

    unint64_t v6 = 0LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3)
      {
        if (a3 > 0) {
          return 4294967294LL;
        }
        goto LABEL_36;
      }

      if (v5 - 192 >= 4)
      {
        if (v5 == 226)
        {
          unsigned __int8 v11 = a1[1];
          if ((v11 & 0xFC) == 0xA0 && (unsigned __int8 v12 = a1[2], (v12 & 0xC0) == 0x80))
          {
            uint64_t v13 = &brl_set_ansi[v12 & 0x3F | (v11 << 6)];
            if (pCharmapGlb) {
              uint64_t v13 = (char *)(pCharmapGlb + *v13);
            }
            a2[v7] = *v13;
            a1 += 2;
          }

          else
          {
            a2[v7] = 32;
            a1 += 2;
          }

          goto LABEL_36;
        }

        if ((v5 & 0xF0) == 0xE0)
        {
          uint64_t v8 = a1 + 2;
          int v9 = (char)a1[2];
        }

        else
        {
          if ((v5 & 0xF8) != 0xF0 || (char)a1[1] > -65 || (char)a1[2] > -65)
          {
LABEL_35:
            a2[v7] = v5;
            goto LABEL_36;
          }

          uint64_t v8 = a1 + 3;
          int v9 = (char)a1[3];
        }

        goto LABEL_13;
      }

      uint64_t v8 = a1 + 1;
      int v10 = (char)a1[1];
      if (v10 > -65) {
        goto LABEL_35;
      }
      a2[v7] = v10 & 0x7F | (v5 << 6);
LABEL_15:
      a1 = v8;
LABEL_36:
      int v14 = *++a1;
      unsigned __int8 v5 = v14;
      unint64_t v6 = v7 + 1;
      if (v14) {
        BOOL v15 = v7 >= 0x7FFFFFFD;
      }
      else {
        BOOL v15 = 1;
      }
      if (v15) {
        goto LABEL_43;
      }
    }

    uint64_t v8 = a1 + 1;
    int v9 = (char)a1[1];
LABEL_13:
    if (v9 > -65) {
      goto LABEL_35;
    }
    a2[v7] = 32;
    goto LABEL_15;
  }

  return v3;
}

void brl_process_command(unsigned __int8 *a1)
{
  if (!a1) {
    return;
  }
  int v2 = *a1;
  if (!*a1) {
    return;
  }
  uint64_t v3 = a1 + 1;
  while (v2 <= 124)
  {
    if (v2 == 9 || v2 == 32) {
      goto LABEL_13;
    }
LABEL_10:
    int v4 = *v3++;
    int v2 = v4;
    if (!v4)
    {
      uint64_t v3 = (unsigned __int8 *)&byte_25B92;
      goto LABEL_16;
    }
  }

  if (v2 != 160 && v2 != 125) {
    goto LABEL_10;
  }
LABEL_13:
  while (1)
  {
    int v5 = *v3;
    if (v5 != 9 && v5 != 160 && v5 != 32) {
      break;
    }
    ++v3;
  }

LABEL_16:
  if (equals_nocase(a1, "ETC"))
  {
    brl_clear_exceptions();
    return;
  }

  if (equals_nocase(a1, "ETA"))
  {
    uint64_t v6 = (uint64_t)v3;
    int v7 = 0;
    goto LABEL_22;
  }

  if (!equals_nocase(a1, "ETB"))
  {
    if (equals_nocase(a1, "FLN"))
    {
      if (equals_nocase(v3, "ch"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 7;
        nSubLangIDGlb = 2;
        pLangGlb = &LANG_DE;
        int v9 = off_91000;
        int v10 = &BWD_LANG_DE;
      }

      else if (equals_nocase(v3, "ueb"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 3;
        pLangGlb = &LANG_UEB;
        int v9 = off_91000;
        int v10 = &BWD_LANG_UEB;
      }

      else if (equals_nocase(v3, "enu"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 1;
        pLangGlb = &LANG_ENU;
        int v9 = off_91000;
        int v10 = &BWD_LANG_ENU;
      }

      else if (equals_nocase(v3, "en"))
      {
        int v8 = nEncodingGlb;
        nLangIDGlb = 9;
        nSubLangIDGlb = 2;
        pLangGlb = &LANG_EN;
        int v9 = off_91000;
        int v10 = &BWD_LANG_EN;
      }

      else
      {
        if (!equals_nocase(v3, "fr"))
        {
          int v34 = equals_nocase(v3, "es");
          uint64_t v35 = nEncodingGlb & 0x10000;
          uint64_t table = brl_get_table(nEncodingGlb);
          if (v34)
          {
            nLangIDGlb = 10;
            nSubLangIDGlb = 1;
            pLangGlb = &LANG_ES;
            v36 = &BWD_LANG_ES;
          }

          else
          {
            nLangIDGlb = 7;
            nSubLangIDGlb = 1;
            pLangGlb = &LANG_DE;
            v36 = &BWD_LANG_DE;
          }

          pBwdLangGlb = v36;
          bUpShiftGlb = v35;
          goto LABEL_73;
        }

        int v8 = nEncodingGlb;
        nLangIDGlb = 12;
        nSubLangIDGlb = 1;
        pLangGlb = &LANG_FR;
        int v9 = off_91000;
        int v10 = &BWD_LANG_FR;
      }

      v9[135] = (char *)v10;
      bUpShiftGlb = *(void *)&v8 & 0x10000LL;
      uint64_t table = brl_get_table(v8);
LABEL_73:
      pCharmapGlb = table;
      return;
    }

    if (!equals_nocase(a1, "TBL"))
    {
      if (equals_nocase(a1, "FGR"))
      {
        uint64_t v13 = lFlags;
        unint64_t v14 = lFlags & 0xFFFFFFFFFFFF0000LL;
        lFlags &= 0xFFFFFFFFFFFF0000LL;
        b8DotBraille = 0;
        BOOL v15 = "1.5";
        uint64_t v16 = v3;
        while (1)
        {
          do
            int v17 = *v16++;
          while (v17 == 173 || v17 == 30);
          if (++v15 == "")
          {
            uint64_t v19 = v14 | 0x7FFE;
            goto LABEL_67;
          }
        }

        for (uint64_t i = v3; ; ++i)
        {
          int v23 = *i;
          if (v23 != 30 && v23 != 173) {
            break;
          }
        }

        if (v23 != 49)
        {
          for (uint64_t j = v3; ; ++j)
          {
            int v25 = *j;
            if (v25 != 30 && v25 != 173) {
              break;
            }
          }

          if (v25 != 48)
          {
            unsigned int v29 = *v3 - 56;
            BOOL v30 = v29 > 0x2B;
            uint64_t v31 = (1LL << v29) & 0x80000000801LL;
            if (!v30 && v31 != 0) {
              b8DotBraille = 1;
            }
            return;
          }
        }

        uint64_t v19 = v13 | 0xFFFF;
      }

      else
      {
        char v20 = &qword_8CBF0;
        uint64_t v21 = 5LL;
        while (!equals_nocase(a1, (unsigned __int8 *)*(v20 - 1)))
        {
          v20 += 3;
          if (--v21 == -4) {
            return;
          }
        }

        int v26 = equals_nocase(v3, "ON");
        uint64_t v27 = *v20;
        else {
          uint64_t v19 = lFlags | v27;
        }
      }

LABEL_67:
      lFlags = v19;
      return;
    }

    if (equals_nocase(v3, "ANSI"))
    {
      int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
    }

    else
    {
      if (equals_nocase(v3, "IBM437"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 3LL;
        goto LABEL_82;
      }

      if (equals_nocase(v3, "IBM850"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 4LL;
        goto LABEL_82;
      }

      if (equals_nocase(v3, "US437"))
      {
        int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
        uint64_t v12 = 7LL;
        goto LABEL_82;
      }

      int v33 = equals_nocase(v3, "TBFR2007");
      int v11 = nLangIDGlb | (nSubLangIDGlb << 10);
      if (v33)
      {
        uint64_t v12 = 14LL;
        goto LABEL_82;
      }
    }

    uint64_t v12 = 0LL;
LABEL_82:
    brl_set_language(v11, v12);
    return;
  }

  uint64_t v6 = (uint64_t)v3;
  int v7 = 1;
LABEL_22:
  brl_add_exception(v6, v7);
}

uint64_t is_nemeth_enabled()
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2) {
    return 0LL;
  }
  else {
    return byte_999E8 & 1 | ((lFlags & 0x40000000) == 0);
  }
}

uint64_t is_antoine_enabled()
{
  if (nLangIDGlb == 12) {
    return byte_999E8 & 1 | ((lFlags & 0x40000000) == 0);
  }
  else {
    return 0LL;
  }
}

void enter_numeric_mode()
{
  BOOL v0 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
  if (v0 && (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
    byte_999EC = 1;
  }
}

void terminate_numeric_mode()
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
  {
    byte_999EC = 0;
    dword_999F0 = 0;
  }
}

uint64_t upper_digit(unsigned __int8 a1)
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
  {
    int v2 = "#123456789";
LABEL_17:
    uint64_t v3 = &v2[a1 - 48];
    return *v3;
  }

  if (((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && a1 - 58 >= 0xFFFFFFF6)
  {
    int v2 = "),;:/?+=(*";
    goto LABEL_17;
  }

LABEL_14:
  uint64_t v3 = *(const char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * a1);
  return *v3;
}

LABEL_15:
  uint64_t v6 = nLangIDGlb;
  if (nLangIDGlb != 9)
  {
    if (!v3) {
      goto LABEL_34;
    }
    goto LABEL_23;
  }

  if (v2 <= 0x2D
    && ((1LL << v2) & 0x209000000000LL) != 0
    && a1[2]
    && memchr(",;:/?+=(*)", a1[2], 0xBuLL))
  {
    return 1LL;
  }

  if ((v3 & 1) != 0)
  {
LABEL_23:
    int v7 = a1[2];
    if ((v7 == 39
       || v7 == stru_B8.segname[(void)pLangGlb + 1]
       || v7 == stru_B8.segname[(void)pLangGlb + 2])
      && a1[3] - 107 > 0xFFFFFFF5)
    {
      return 1LL;
    }

    int v8 = v3 ^ 1;
    if (v6 != 9) {
      int v8 = 1;
    }
    if ((v8 & 1) == 0
      && v7 <= 0x2D
      && ((1LL << v7) & 0x209000000000LL) != 0
      && a1[3]
      && memchr(",;:/?+=(*)", a1[3], 0xBuLL))
    {
      return 1LL;
    }
  }

uint64_t get_separator(int a1)
{
  if (a1 && (nLangIDGlb == 9 ? (BOOL v1 = nSubLangIDGlb == 3) : (BOOL v1 = 0), v1))
  {
    return 33;
  }

  else
  {
    if (nLangIDGlb != 9 || nSubLangIDGlb == 2) {
      return stru_B8.segname[(void)pLangGlb + 2];
    }
    char v2 = 39;
    if ((byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
      return stru_B8.segname[(void)pLangGlb + 2];
    }
  }

  return v2;
}

uint64_t std_char(uint64_t result)
{
  if (qword_999F8 <= 0)
  {
    BOOL v1 = (_BYTE *)qword_99A00;
    uint64_t v2 = qword_99A08;
  }

  else
  {
    BOOL v1 = (_BYTE *)qword_99A00;
    uint64_t v2 = qword_99A08;
    if (!--qword_999F8)
    {
      if (qword_99A00 == qword_99A08) {
        return result;
      }
      *(_BYTE *)qword_99A00 = 30;
      qword_99A00 = (uint64_t)++v1;
    }
  }

  if (v1 != (_BYTE *)v2)
  {
    _BYTE *v1 = result;
    qword_99A00 = (uint64_t)(v1 + 1);
  }

  return result;
}

uint64_t std_string(_BYTE *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = std_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }

  while (v4);
  return result;
}

void increment_cursor()
{
  if (qword_999F8 >= 2) {
    ++qword_999F8;
  }
}

uint64_t inc_char(uint64_t result)
{
  if (qword_999F8 >= 2) {
    ++qword_999F8;
  }
  return std_char(result);
}

uint64_t inc_string(_BYTE *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    if (qword_999F8 >= 2) {
      ++qword_999F8;
    }
    uint64_t result = std_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }

  while (v4);
  return result;
}

uint64_t map_char(uint64_t result)
{
  if ((_DWORD)result)
  {
    int v1 = result;
    uint64_t v2 = &OBJC_INSTANCE_METHODS_NSObject;
    if (result != 150 || (lFlags & 0x20000000) == 0)
    {
      uint64_t v3 = *(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb);
      int v4 = off_91000;
      if (*v3 != result)
      {
        if (result < 0xC0u || nLangIDGlb == 12 || (lFlags & 0x40000) == 0 || (byte_999E8 & 1) != 0)
        {
          uint64_t v3 = *(unsigned __int8 **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL
                                                                                          * result);
        }

        else
        {
          uint64_t v3 = *(unsigned __int8 **)(*(void *)&stru_20.segname[(void)pLangGlb + 8] + 8 * (result & 0x3F));
          if (nLangIDGlb == 9 && nSubLangIDGlb == 2 && *v3 == 34) {
            ++v3;
          }
        }
      }

      unsigned __int8 v7 = *v3;
      uint64_t v6 = v3 + 1;
      unsigned __int8 v5 = v7;
      while (v1 != 151 || v5 != 45 || (v2[422].entrysize & 0x20000000) == 0)
      {
        if (**(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb) != v5
          || (uint64_t v8 = qword_99A00, v9 = qword_99A00 - qword_99A10, qword_99A00 == qword_99A10))
        {
          if (*v6 && qword_999F8 >= 2) {
            ++qword_999F8;
          }
          goto LABEL_37;
        }

        int v11 = (unsigned __int8 *)(qword_99A00 - 1);
        int v10 = *(unsigned __int8 *)(qword_99A00 - 1);
        if (v10 != v5)
        {
          if (*v6 && qword_999F8 >= 2) {
            ++qword_999F8;
          }
          int v12 = *((_DWORD *)v4 + 268);
          if ((v12 == 12 || v12 == 9) && v10 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb))
          {
            int64_t v13 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb - 8]);
            unint64_t v14 = *(const char **)&stru_68.sectname[(void)pLangGlb];
            int64_t v15 = strlen(v14);
            if (v9 >= v13
              && (int v17 = (unsigned __int8 *)(qword_99A00 - v13),
                  !strncmp( (const char *)(qword_99A00 - v13),  *(const char **)&stru_68.segname[(void)pLangGlb - 8],  v13)))
            {
              int v11 = v17;
            }

            else if (v9 >= v15 && !strncmp((const char *)(v8 - v15), v14, v15))
            {
              int v11 = (unsigned __int8 *)(v8 - v15);
            }

            uint64_t v2 = &OBJC_INSTANCE_METHODS_NSObject;
            int v4 = off_91000;
            unsigned __int8 *v11 = v5;
            unsigned __int8 v5 = **(_BYTE **)((char *)&stru_20.filesize + (void)pLangGlb);
          }

          goto LABEL_37;
        }

LABEL_38:
        int v16 = *v6++;
        unsigned __int8 v5 = v16;
        if (!v16) {
          return result;
        }
      }

      unsigned __int8 v5 = -106;
LABEL_37:
      uint64_t result = std_char((char)v5);
      goto LABEL_38;
    }

    return std_char(4294967190LL);
  }

  return result;
}

      bwd_add_seg(0x2000LL);
      unsigned int v18 = *v7 + 1;
      uint64_t v19 = **v7;
      char v20 = (_BYTE *)qword_99A00;
      do
      {
        if (v19 == 39) {
          LOBYTE(v19) = 46;
        }
        *v20++ = v19;
        uint64_t v21 = *v18++;
        uint64_t v19 = v21;
      }

      while (v21);
      qword_99A00 = (uint64_t)v20;
      uint64_t v22 = (uint64_t)(v7[3] - 1);
      goto LABEL_62;
    }
  }

  return result;
}

uint64_t map_string(_BYTE *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = map_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }

  while (v4);
  return result;
}

uint64_t add_char(uint64_t result)
{
  uint64_t v1 = qword_99A00;
  *(_BYTE *)qword_99A00 = result;
  qword_99A00 = v1 + 1;
  return result;
}

unsigned __int8 *add_string(_BYTE *a1)
{
  uint64_t v1 = (_BYTE *)qword_99A00;
  char v4 = *a1;
  uint64_t result = a1 + 1;
  char v3 = v4;
  do
  {
    *v1++ = v3;
    int v5 = *result++;
    char v3 = v5;
  }

  while (v5);
  qword_99A00 = (uint64_t)v1;
  return result;
}

uint64_t number_precedes(int a1)
{
  uint64_t v2 = qword_99A18;
  if ((qword_99A18 & 0xC0) != 0)
  {
    if (a1) {
      return 1LL;
    }
    char v3 = (unsigned __int8 *)qword_99A20;
    goto LABEL_4;
  }

  if ((unint64_t)qword_99A18 < 3)
  {
    if ((qword_99A28 & 0xC0) == 0)
    {
      uint64_t v6 = (unsigned __int8 *)qword_99A30;
      if (qword_99A28 != 4) {
        goto LABEL_11;
      }
      if (**(_BYTE **)qword_99A30 != 46) {
        goto LABEL_12;
      }
      uint64_t v12 = *(void *)(qword_99A30 + 40);
      if (!v12 || *(void *)(v12 + 24) != 64LL) {
        goto LABEL_12;
      }
      return 1LL;
    }

    if (a1) {
      return 1LL;
    }
    char v3 = *(unsigned __int8 **)qword_99A30;
LABEL_4:
    int v4 = *v3;
    return 1LL;
  }

LABEL_10:
  uint64_t v6 = (unsigned __int8 *)qword_99A30;
LABEL_11:
  if (v6)
  {
LABEL_12:
    LODWORD(result) = v2 == 0x2000;
    do
    {
      uint64_t v7 = *((void *)v6 + 3);
      if (v7 > 127)
      {
        if (v7 == 128) {
          goto LABEL_32;
        }
        if (v7 == 1024 || v7 == 512)
        {
LABEL_21:
          if ((_DWORD)result) {
            BOOL v8 = **(unsigned __int8 **)v6 == 181;
          }
          else {
            BOOL v8 = 0;
          }
          if (!v8 && (_DWORD)result != 0) {
            return 0LL;
          }
LABEL_29:
          LODWORD(result) = 1;
          goto LABEL_30;
        }
      }

      else
      {
        if (v7 == 4 || v7 == 32) {
          goto LABEL_21;
        }
        if (v7 == 64)
        {
LABEL_32:
          if ((_DWORD)result == 1)
          {
            if (a1) {
              return 1LL;
            }
            int v10 = **(unsigned __int8 **)v6;
            unsigned __int8 v11 = upper_digit(0x30u);
            uint64_t result = 1LL;
            if (v10 != v11) {
              return result;
            }
          }

          else
          {
            LODWORD(result) = 0;
          }

          goto LABEL_30;
        }
      }

      if ((v7 & 0x1E000) != 0 && !(_DWORD)result) {
        goto LABEL_29;
      }
LABEL_30:
      uint64_t v6 = (unsigned __int8 *)*((void *)v6 + 5);
    }

    while (v6);
  }

  return 0LL;
}

BOOL number_follows(int a1)
{
  uint64_t v2 = 1LL;
  if (*(_BYTE *)(qword_99A38 + 1) == 30)
  {
    uint64_t v2 = 2LL;
    char v3 = (unsigned __int8 *)(qword_99A38 + 2);
  }

  else
  {
    char v3 = (unsigned __int8 *)(qword_99A38 + 1);
  }

  if ((*(unsigned __int8 *)(qword_99A38 + v2) | 0x80) == 0xA0)
  {
    int v4 = *++v3;
    if (v4 == 30) {
      ++v3;
    }
  }

  if (is_number(v3))
  {
    if (a1 || *v3 != 48) {
      return 1LL;
    }
    uint64_t v5 = 48LL;
  }

  else
  {
    uint64_t v5 = *v3;
  }

  if (in(v5, 9))
  {
    int v6 = v3[1];
    if (v3[1])
    {
      if (memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v3[1], 7uLL)
        || v6 == 30 && v3[2] && memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v3[2], 7uLL))
      {
        return 1LL;
      }
    }
  }

  if ((_DWORD)v5 != 35) {
    return 0LL;
  }
  int v8 = v3[1];
  BOOL result = 1LL;
  if (v8 != 46 && v8 != 44)
  {
    if (v8 == 30)
    {
      int v9 = v3[2];
      if (v9 != 46) {
        return v9 == 44;
      }
      return result;
    }

    return 0LL;
  }

  return result;
}

unsigned __int8 **escape_number(unsigned __int8 **result, char a2)
{
  if ((qword_99A28 & 0xC0) != 0)
  {
    uint64_t v2 = result;
    int v3 = **result;
    switch(**result)
    {
      case '!':
      case '*':
      case '/':
      case ':':
      case ';':
      case '?':
        if (((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && !dword_999F0)
        {
          if (qword_99A28 == 128
            || (v5 = *(const char **)result[5], (BOOL result = (unsigned __int8 **)strchr(v5, 44)) == 0LL)
            && (BOOL result = (unsigned __int8 **)strchr(v5, 46)) == 0LL)
          {
          }
        }

        break;
      case '(':
      case ')':
      case ',':
      case '=':
        if (((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) && !dword_999F0)
        {
          uint64_t v4 = *((void *)result[5] + 1) + *(void *)result[5];
          if (*(_BYTE *)(v4 - 1))
          {
            BOOL result = (unsigned __int8 **)memchr(",;:/?+=(*)", *(unsigned __int8 *)(v4 - 1), 0xBuLL);
            if (result) {
              goto LABEL_3;
            }
          }
        }

        break;
      case 'A':
      case 'B':
      case 'C':
      case 'D':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'J':
LABEL_3:
        if (qword_999F8 >= 2) {
          ++qword_999F8;
        }
        a2 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
        goto LABEL_8;
      case 'a':
      case 'b':
      case 'c':
      case 'd':
      case 'e':
      case 'f':
      case 'g':
      case 'h':
      case 'i':
      case 'j':
        if (qword_999F8 >= 2) {
          ++qword_999F8;
        }
LABEL_8:
        BOOL result = (unsigned __int8 **)map_char(a2);
        break;
      default:
        return result;
    }
  }

  return result;
}

uint64_t add_num(uint64_t result)
{
  int v1 = result;
  LOBYTE(result) = *(_BYTE *)qword_99A38;
  for (uint64_t i = qword_99A00 + 1; ; ++i)
  {
    if (result != 30 && result != 173)
    {
      if (v1)
      {
        LOBYTE(result) = upper_digit(result);
      }

      else
      {
        else {
          int v3 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * result);
        }
        LOBYTE(result) = *v3;
      }
    }

    *(_BYTE *)(i - 1) = result;
    uint64_t v4 = qword_99A38;
    BOOL result = *(unsigned __int8 *)++qword_99A38;
    if (*(_BYTE *)qword_99A38)
    {
      BOOL v5 = (result - 58) >= 0xF6u || (_DWORD)result == 30;
      if (v5 || (_DWORD)result == 173) {
        continue;
      }
    }

    break;
  }

  qword_99A00 = i;
  qword_99A38 = v4 + 2;
  return result;
}

uint64_t add_time(int a1)
{
  if (nLangIDGlb != 9)
  {
    uint64_t result = add_num(0LL);
    if (!a1) {
      return result;
    }
    goto LABEL_5;
  }

  uint64_t result = add_num(1LL);
  uint64_t v3 = qword_99A00;
  *(_BYTE *)qword_99A00 = 44;
  qword_99A00 = v3 + 1;
  if (a1)
  {
LABEL_5:
    uint64_t result = upper_digit(0x30u);
    uint64_t v4 = qword_99A00;
    *(_BYTE *)qword_99A00 = result;
    qword_99A00 = v4 + 1;
  }

  return result;
}

uint64_t is_newline(unsigned __int8 *a1)
{
  uint64_t v1 = (uint64_t)&a1[-qword_99A40];
  if ((uint64_t)&a1[-qword_99A40] >= 1)
  {
    unsigned __int8 v4 = *a1;
    uint64_t v2 = a1 - 1;
    unsigned __int8 v3 = v4;
    while (v3 >= 0x20u)
    {
      unsigned __int8 v3 = *v2;
      unsigned int v5 = *v2;
      if (v5 > 0x20 && v5 != 45 && v5 != 124 && v5 != 160) {
        return 0LL;
      }
      --v2;
      if (v1-- <= 1) {
        return 1LL;
      }
    }
  }

  return 1LL;
}

BOOL is_date(unsigned __int8 *a1)
{
  int v1 = *a1;
  int v2 = 0;
  do
  {
    int v3 = v1 - 48;
    for (uint64_t i = a1 + 2; ; ++i)
    {
      int v1 = *(i - 1);
      if (v1 != 173 && v1 != 30) {
        break;
      }
    }

    int v2 = v3 + 10 * v2;
    a1 = i - 1;
  }

  while ((v1 - 58) >= 0xFFFFFFF6);
  int v6 = *i;
  int v8 = 0;
  do
  {
    int v9 = v6 - 48;
    do
    {
      int v10 = *++i;
      int v6 = v10;
    }

    while (v10 == 173 || v6 == 30);
    int v8 = v9 + 10 * v8;
  }

  while ((v6 - 58) >= 0xFFFFFFF6);
  return (v8 - 1) < 0xC;
}

uint64_t is_lower_num(unsigned __int8 *a1)
{
  int v1 = a1;
  uint64_t v2 = -(uint64_t)a1;
  int v3 = a1;
  for (i = a1; ; int v3 = i)
  {
    int v6 = *++i;
    int v5 = v6;
    if (v6 != 30 && v5 != 173)
    {
      if (!v5) {
        return 0LL;
      }
    }

    --v2;
  }

  if (v5 == 46
    && (nLangIDGlb == 10
     || v3[2] && memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v3[2], 0xDuLL))
    || !memchr(".:/h", v5, 5uLL))
  {
    return 0LL;
  }

  for (uint64_t j = 2LL; ; ++j)
  {
    int v8 = v3[j];
    BOOL v9 = v8 == 173 || v8 == 30;
    if (!v9 && (v5 == 47 || v8 != v5))
    {
      if (!v3[j]) {
        goto LABEL_24;
      }
    }
  }

  if ((v8 | 2) == 0x2F) {
    return 0LL;
  }
LABEL_24:
  uint64_t v10 = qword_99A40;
  if (qword_99A40 < (unint64_t)v1)
  {
    int v11 = *(v1 - 1);
    if (v11 != v5)
    {
      uint64_t v12 = 0LL;
      BOOL v13 = v5 != 47 && v11 == 45;
      BOOL v14 = !v13;
      if (v11 == 47 || !v14) {
        return v12;
      }
    }
  }

  if (v5 == 46)
  {
    unsigned int v15 = v3[2];
    if (!v3[2])
    {
      goto LABEL_46;
    }

    if (v15 - 58 <= 0xFFFFFFF5)
    {
      if (memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v15, 0x15uLL))
      {
        unsigned int v16 = v3[3];
        BOOL v17 = 1;
        if (v16 < 0x21 || v16 == 160) {
          goto LABEL_60;
        }
      }

LABEL_45:
      BOOL v17 = 1;
      goto LABEL_60;
    }
  }

LABEL_160:
  uint64_t v46 = qword_99A00;
  *(_BYTE *)qword_99A00 = 35;
  qword_99A00 = v46 + 1;
  if (nLangIDGlb == 10) {
    int v47 = v22 == 0;
  }
  else {
    int v47 = v22;
  }
  BOOL v49 = nLangIDGlb == 9 || v47 != 0;
  add_num(v49);
  if (v24 > 1)
  {
    while (1)
    {
      if (nLangIDGlb == 9)
      {
        if (*i != 46 && (v24 & 1) == 0)
        {
          BOOL v51 = v47 != 0;
LABEL_181:
          uint64_t v53 = !v51;
          int v47 = !v51;
          goto LABEL_182;
        }
      }

      else
      {
        BOOL v51 = v47 != 0;
        if (!v59 || !v47 || nLangIDGlb != 7) {
          goto LABEL_181;
        }
      }

      uint64_t v52 = qword_99A00;
      *(_BYTE *)qword_99A00 = 35;
      qword_99A00 = v52 + 1;
      uint64_t v53 = 1LL;
LABEL_182:
      add_num(v53);
      int v54 = *(unsigned __int8 *)qword_99A38;
      if (*(_BYTE *)qword_99A38)
      {
        if ((v54 - 58) > 0xFFFFFFF5 || (v54 != 173 ? (BOOL v55 = v54 == 30) : (BOOL v55 = 1), v55))
        {
          int v56 = *i;
          if (*(unsigned __int8 *)(qword_99A38 - 1) == v56)
          {
            if ((v56 != 47) | v24 & 1) {
              continue;
            }
          }
        }
      }

      uint64_t v57 = qword_99A38 - 1;
      goto LABEL_193;
    }
  }

  uint64_t v57 = qword_99A38;
LABEL_193:
  qword_99A38 = v57 - 1;
  return 1LL;
}

unsigned __int8 *matching_brace_pos(unsigned __int8 *result)
{
  uint64_t v1 = 0LL;
  unsigned int v2 = 0;
  int v3 = *result;
  int v4 = v3;
  int v5 = v3;
  int v6 = v3;
  int v7 = v3;
  int v8 = v3;
  int v9 = v3;
  int v10 = v3;
  int v11 = v3;
  int v12 = v3;
  while (1)
  {
    if (v12 <= 90)
    {
      if (v6 == 60) {
        uint64_t v18 = v1 + 1;
      }
      else {
        uint64_t v18 = v1;
      }
      uint64_t v19 = v1 - (v7 == 60);
      if (v12 == 62) {
        int v20 = v7;
      }
      else {
        int v20 = v8;
      }
      if (v12 == 62) {
        int v21 = v7;
      }
      else {
        int v21 = v9;
      }
      if (v12 == 62) {
        int v22 = v7;
      }
      else {
        int v22 = v10;
      }
      if (v12 == 62) {
        int v23 = v7;
      }
      else {
        int v23 = v11;
      }
      if (v12 != 62) {
        uint64_t v19 = v1;
      }
      if (v12 == 60) {
        int v24 = v6;
      }
      else {
        int v24 = v7;
      }
      if (v12 == 60)
      {
        int v20 = v6;
        int v21 = v6;
        int v22 = v6;
        int v23 = v6;
      }

      else
      {
        uint64_t v18 = v19;
      }

      if (v4 == 40) {
        uint64_t v25 = v1 + 1;
      }
      else {
        uint64_t v25 = v1;
      }
      if (v12 == 41) {
        int v26 = v5;
      }
      else {
        int v26 = v6;
      }
      if (v12 == 41)
      {
        int v7 = v5;
        int v8 = v5;
        int v9 = v5;
        int v10 = v5;
        int v11 = v5;
        v1 -= v5 == 40;
      }

      if (v12 == 40) {
        int v27 = v4;
      }
      else {
        int v27 = v5;
      }
      if (v12 == 40)
      {
        int v26 = v4;
        int v7 = v4;
        int v8 = v4;
        int v9 = v4;
        int v10 = v4;
        int v11 = v4;
        uint64_t v1 = v25;
      }

      if (v12 > 59)
      {
        int v7 = v24;
        int v8 = v20;
        int v9 = v21;
        int v10 = v22;
        int v11 = v23;
        uint64_t v1 = v18;
      }

      else
      {
        int v5 = v27;
        int v6 = v26;
      }
    }

    else if (v12 <= 92)
    {
      if (v12 == 91)
      {
        if (v10 == 91) {
          ++v1;
        }
        int v11 = v10;
      }

      else if (v3 == 123)
      {
        int v29 = result[1];
        if (v29 == 125 || v29 == 123)
        {
          int v4 = 123;
          int v5 = 123;
          int v6 = 123;
          int v7 = 123;
          int v8 = 123;
          int v9 = 123;
          int v10 = 123;
          int v11 = 123;
          ++result;
        }

        else
        {
          int v4 = 123;
          int v5 = 123;
          int v6 = 123;
          int v7 = 123;
          int v8 = 123;
          int v9 = 123;
          int v10 = 123;
          int v11 = 123;
        }
      }

      else
      {
        int v4 = v3;
        int v5 = v3;
        int v6 = v3;
        int v7 = v3;
        int v8 = v3;
        int v9 = v3;
        int v10 = v3;
        int v11 = v3;
      }
    }

    else
    {
      uint64_t v13 = v1 - (v11 == 91);
      if (v8 == 123) {
        uint64_t v14 = v1 + 1;
      }
      else {
        uint64_t v14 = v1;
      }
      if (v12 == 125) {
        int v15 = v9;
      }
      else {
        int v15 = v10;
      }
      if (v12 == 125) {
        int v16 = v9;
      }
      else {
        int v16 = v11;
      }
      if (v12 == 125) {
        v1 -= v9 == 123;
      }
      int v17 = v12 == 123 ? v8 : v9;
      if (v12 == 123)
      {
        int v15 = v8;
        int v16 = v8;
        uint64_t v1 = v14;
      }

      if (v12 == 93)
      {
        uint64_t v1 = v13;
      }

      else
      {
        int v9 = v17;
        int v10 = v15;
        int v11 = v16;
      }
    }

    if (v2 >= 2 && !v1) {
      break;
    }
    ++v2;
    int v28 = *++result;
    int v12 = v28;
    if (!v28) {
      return 0LL;
    }
  }

  return result;
}

uint64_t add_basis_char(uint64_t result, int a2)
{
  BOOL v2 = qword_999F8 == 1;
  if (qword_999F8 >= 1)
  {
    --qword_999F8;
    if (v2)
    {
      uint64_t v3 = qword_99A00;
      *(_BYTE *)qword_99A00 = 30;
      qword_99A00 = v3 + 1;
    }
  }

  if ((result & 0x7F) == 0x20)
  {
    if (a2)
    {
      int v4 = (char *)qword_99A00;
      char v5 = 32;
    }

    else
    {
      if (byte_99A50 != 1) {
        return result;
      }
      int v4 = (char *)qword_99A00;
      char v5 = 31;
    }

    *int v4 = v5;
    qword_99A00 = (uint64_t)(v4 + 1);
  }

  else if ((_DWORD)result && ((result & 0xDF) - 91) >= 0xE6u)
  {
    uint64_t v6 = qword_99A00;
    *(_BYTE *)qword_99A00 = result | 0x20;
    qword_99A00 = v6 + 1;
  }

  else
  {
    return map_char(result);
  }

  return result;
}

void *insert_list_element(void *result, const char *a2, uint64_t a3)
{
  if (!bMemoryOverflow)
  {
    char v5 = result;
    uint64_t result = malloc(0x38uLL);
    if (result)
    {
      uint64_t v6 = result;
      *uint64_t result = a2;
      result[2] = 0LL;
      uint64_t result = (void *)strlen(a2);
      v6[1] = result;
      v6[3] = a3;
      v6[4] = 0LL;
      uint64_t v7 = v5[5];
      v6[5] = v7;
      v6[6] = v5;
      if (v7) {
        *(void *)(v7 + 48) = v6;
      }
      if ((void *)qword_99A48 == v5) {
        qword_99A48 = (uint64_t)v6;
      }
      v5[5] = v6;
    }

    else
    {
      bMemoryOverflow = 1;
    }
  }

  return result;
}

void add_list_element()
{
  if (!bMemoryOverflow)
  {
    uint64_t v0 = qword_99A48;
    uint64_t v1 = malloc(0x38uLL);
    if (v0)
    {
      uint64_t v2 = qword_99A30;
      *(void *)(qword_99A30 + 48) = v1;
      if (!v1) {
        goto LABEL_18;
      }
    }

    else
    {
      qword_99A48 = (uint64_t)v1;
      if (!v1)
      {
LABEL_18:
        bMemoryOverflow = 1;
        return;
      }

      uint64_t v2 = 0LL;
    }

    qword_99A30 = (uint64_t)v1;
    v1[5] = v2;
    v1[6] = 0LL;
    v1[2] = 0LL;
    int v3 = nLangIDGlb;
    BOOL v4 = nSubLangIDGlb == 2 && nLangIDGlb == 7;
    __int16 v5 = lFlags;
    unint64_t v6 = lFlags & 0xFFFFFFFF77FFFFFFLL ^ 0x90000000;
    if (v4) {
      unint64_t v6 = lFlags & 0xFFFFFFFF67FFFFFFLL | 0x80000000;
    }
    v1[4] = v6;
    if ((byte_999EC & 1) != 0 || byte_99A54)
    {
      if (v3 == 7 && (byte_999E8 & 1) == 0)
      {
        uint64_t v7 = v6 | 0x7FFE;
LABEL_29:
        v1[4] = v7;
        return;
      }

LABEL_22:
      uint64_t v7 = v6 | 0xFFFF;
      goto LABEL_29;
    }

    if (byte_99A58 == 1)
    {
      if (v3 != 7)
      {
        if (v3 != 12) {
          return;
        }
        goto LABEL_22;
      }

      uint64_t v8 = 12664LL;
LABEL_28:
      uint64_t v7 = v6 | v8;
      goto LABEL_29;
    }

    if (v3 == 7 && v5 != 12664LL && (byte_99A60 & 1) == 0)
    {
      uint64_t v8 = 10752LL;
      goto LABEL_28;
    }
  }

    if (!v3) {
      __int16 v5 = v4;
    }
LABEL_26:
    unint64_t v6 = (char *)qword_99A00;
    goto LABEL_27;
  }

  if (v2 != 46)
  {
    if (v2 == 52)
    {
      int v11 = 0LL;
      int v12 = qword_99A00;
      uint64_t v13 = 67;
      do
      {
        if (v13 == 39) {
          LOBYTE(v13) = 46;
        }
        *(_BYTE *)(v12 + v11) = v13;
        uint64_t v13 = aCh_4[++v11];
      }

      while (v11 != 2);
      int v10 = v12 + 2;
      goto LABEL_28;
    }

    if (v2 == 56)
    {
      int v3 = a2 == 0;
      BOOL v4 = -36;
      __int16 v5 = -4;
      goto LABEL_22;
    }

uint64_t set_list_element(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = qword_99A30;
  if (qword_99A30)
  {
    *(void *)qword_99A30 = result;
    *(void *)(v3 + 8) = a2;
    *(void *)(v3 + 24) = a3;
  }

  return result;
}

void open_math_passage()
{
  if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
  {
    if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
      goto LABEL_17;
    }
    if (nLangIDGlb == 7)
    {
      uint64_t v2 = 0LL;
      uint64_t v3 = qword_99A00;
      char v4 = 33;
      do
      {
        *(_BYTE *)(v3 + v2) = v4;
        char v4 = asc_20333[++v2];
      }

      while (v2 != 2);
      goto LABEL_23;
    }
  }

  else if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
  {
    if (nSubLangIDGlb == 3)
    {
      uint64_t v2 = 0LL;
      uint64_t v3 = qword_99A00;
      char v6 = 127;
      do
      {
        *(_BYTE *)(v3 + v2) = v6;
        char v6 = a3_5[++v2];
      }

      while (v2 != 3);
      goto LABEL_23;
    }
  }

  else if (nSubLangIDGlb == 3)
  {
LABEL_17:
    uint64_t v2 = 0LL;
    uint64_t v3 = qword_99A00;
    char v5 = 35;
    do
    {
      *(_BYTE *)(v3 + v2) = v5;
      char v5 = asc_260C9[++v2];
    }

    while (v2 != 3);
LABEL_23:
    qword_99A00 = v3 + v2;
  }

  byte_99A54 = 1;
  byte_999E8 = 1;
}

uint64_t close_math_passage(uint64_t result)
{
  BOOL v1 = nLangIDGlb != 9 || nSubLangIDGlb == 2;
  if (v1 || (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
  {
    uint64_t v2 = &byte_25B92;
    if (nLangIDGlb == 7) {
      uint64_t v2 = "'.";
    }
    if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
      char v4 = "#.";
    }
    else {
      char v4 = v2;
    }
    if ((_DWORD)result) {
      goto LABEL_16;
    }
  }

  else
  {
    if (nSubLangIDGlb == 3) {
      char v4 = " \x7F5";
    }
    else {
      char v4 = &byte_25B92;
    }
    if ((_DWORD)result)
    {
LABEL_16:
      char v7 = *v4;
      char v6 = (unsigned __int8 *)(v4 + 1);
      char v5 = v7;
      do
      {
        uint64_t result = std_char(v5);
        int v8 = *v6++;
        char v5 = v8;
      }

      while (v8);
      goto LABEL_26;
    }
  }

  int v9 = (char *)qword_99A00;
  char v12 = *v4;
  int v11 = (unsigned __int8 *)(v4 + 1);
  char v10 = v12;
  do
  {
    *v9++ = v10;
    int v13 = *v11++;
    char v10 = v13;
  }

  while (v13);
  qword_99A00 = (uint64_t)v9;
LABEL_26:
  byte_999E8 = 0;
  return result;
}

uint64_t is_decimal_braille(unint64_t a1)
{
  while (a1 > qword_99A20)
  {
    int v1 = *(unsigned __int8 *)--a1;
  }

  return 0LL;
}

BOOL is_upper_dash()
{
  if (dword_99A68 != 2) {
    return 0LL;
  }
  int v0 = *(unsigned __int8 *)(qword_99A20 + 1);
  if (!*(_BYTE *)(qword_99A20 + 1)) {
    return 0LL;
  }
  return 1LL;
}

void add_seg(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = &unk_99000;
  if ((a1 & 0x1C) == 0 && qword_99A18 == a1) {
    return;
  }
  uint64_t v3 = &unk_99000;
  char v4 = (_BYTE *)qword_99A00;
  char v5 = &unk_99000;
  char v6 = &unk_99000;
  char v7 = &unk_99000;
  uint64_t v8 = qword_99A00 - qword_99A20;
  if (qword_99A00 == qword_99A20)
  {
    int v13 = (unsigned __int8 **)qword_99A30;
    goto LABEL_363;
  }

  *(_BYTE *)qword_99A00 = 0;
  qword_99A00 = (uint64_t)(v4 + 1);
  add_list_element();
  uint64_t v9 = qword_99A18;
  if (qword_99A18 == 2048)
  {
    if ((lFlags & 0x4000000) != 0)
    {
LABEL_359:
      uint64_t v10 = v8;
      goto LABEL_360;
    }

    uint64_t v10 = v8;
    if (dword_99A80) {
      goto LABEL_360;
    }
    uint64_t v9 = 2048LL;
    uint64_t v14 = (unsigned __int8 *)qword_99A38;
    int v15 = "'.";
    while (1)
    {
      do
        int v16 = *v14++;
      while (v16 == 173 || v16 == 30);
      if (++v15 == "") {
        goto LABEL_360;
      }
    }

    unsigned int v21 = *(unsigned __int8 *)qword_99A38;
    uint64_t v9 = 2048LL;
    if (v21 >= 0x21 && v21 != 160)
    {
      uint64_t v22 = 0LL;
      uint64_t v23 = qword_99A00;
      uint64_t v24 = qword_99A00 - 1;
      char v25 = 39;
      do
      {
        *(_BYTE *)(v24 + v22) = v25;
        char v25 = asc_25B8C[++v22];
      }

      while (v22 != 2);
      uint64_t v10 = v8 + 2;
      *(_BYTE *)(v23 + 1) = 0;
      qword_99A00 = v23 + 2;
      uint64_t v9 = 2048LL;
    }

LABEL_360:
    int v13 = (unsigned __int8 **)qword_99A30;
    if (!qword_99A30) {
      goto LABEL_362;
    }
LABEL_361:
    *int v13 = (unsigned __int8 *)qword_99A20;
    v13[1] = (unsigned __int8 *)v10;
    v13[3] = (unsigned __int8 *)v9;
    goto LABEL_362;
  }

  if (qword_99A18 == 4096)
  {
    int v13 = (unsigned __int8 **)qword_99A30;
    qword_99A78 = qword_99A30;
    uint64_t v9 = 4096LL;
    uint64_t v10 = v8;
    if (!qword_99A30) {
      goto LABEL_362;
    }
    goto LABEL_361;
  }

  uint64_t v10 = v8;
  if (qword_99A18 != 0x2000) {
    goto LABEL_360;
  }
  if (nLangIDGlb == 9 && nSubLangIDGlb == 2)
  {
    if (byte_99A60 != 1 || (lFlags & 0x40000) == 0)
    {
      if (v8 != dword_99A68) {
        goto LABEL_52;
      }
      BOOL v11 = qword_99A28 == 64 || v1 == 64;
      if (!v11) {
        goto LABEL_52;
      }
      goto LABEL_17;
    }

    uint64_t v26 = qword_99A30;
    if (qword_99A30)
    {
      *(void *)qword_99A30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
      *(void *)(v26 + 8) = 1LL;
      *(void *)(v26 + 24) = 2LL;
    }

    add_list_element();
    goto LABEL_50;
  }

  if (nLangIDGlb == 12 && dword_99A68 == 1)
  {
    char v18 = *(_BYTE *)qword_99A70;
    if (*(_BYTE *)qword_99A70)
    {
      if (((v18 + 33) > 0xE0u || (v18 - 91) >= 0xE6u)
        && *(_BYTE *)(qword_99A70 - 1) == 32)
      {
        int v19 = *(unsigned __int8 *)(qword_99A70 - 2);
        if (!in(*(unsigned __int8 *)(qword_99A70 - 2), 9))
        {
          uint64_t v10 = v8;
          if (!v19) {
            goto LABEL_52;
          }
          int v20 = memchr(",;:", v19, 4uLL);
          uint64_t v10 = v8;
          if (!v20) {
            goto LABEL_52;
          }
LABEL_17:
          uint64_t v12 = qword_99A30;
          if (!qword_99A30) {
            goto LABEL_52;
          }
LABEL_51:
          *(void *)(v12 + 32) |= 0xFFFFuLL;
          goto LABEL_52;
        }

LABEL_50:
        uint64_t v12 = qword_99A30;
        uint64_t v10 = v8;
        if (!qword_99A30) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
  }

    if (v12 < 33)
    {
      LOBYTE(v12) = 32;
      *uint64_t v10 = 32;
      int v28 = 32;
    }

    else
    {
      *uint64_t v10 = v12;
      int v28 = 0;
      if ((_BYTE)v12)
      {
        if ((v12 - 58) <= 0xF5u)
        {
          int v28 = 0;
          if (v12 != 42)
          {
            BOOL v11 = v12;
          }
        }
      }
    }

LABEL_52:
  if (nLangIDGlb != 10)
  {
    int v28 = &unk_99000;
    if ((lFlags & 0x80000) != 0)
    {
      if (nLangIDGlb != 7)
      {
        char v35 = 0;
        goto LABEL_80;
      }
    }

    else if (nLangIDGlb != 7 || (byte_999E8 & 1) == 0)
    {
      goto LABEL_92;
    }

    char v35 = 1;
LABEL_80:
    char v36 = *(_BYTE *)qword_99A70;
    if (!*(_BYTE *)qword_99A70
      || (v36 + 33) <= 0xE0u && (v36 - 91) < 0xE6u
      || (v10 < 2 || dword_99A68 != 1 || dword_999F0)
      && ((lFlags & 0x100000) == 0 || (v35 & byte_999E8 & 1) != 0))
    {
      goto LABEL_92;
    }

    goto LABEL_88;
  }

  int v27 = *(unsigned __int8 *)qword_99A70;
  int v28 = (void *)&unk_99000;
  if (!*(_BYTE *)qword_99A70) {
    goto LABEL_92;
  }
  unsigned int v29 = (v27 + 64);
  unsigned int v30 = v27 - 65;
  BOOL v32 = v29 < 0x1F || v30 < 0x1A;
  if (v32 && dword_99A68 == 1)
  {
    if ((lFlags & 0x80000) == 0) {
      goto LABEL_92;
    }
LABEL_88:
    uint64_t v37 = qword_99A30;
    if (qword_99A30)
    {
      *(void *)qword_99A30 = *(uint64_t *)((char *)&stru_20.filesize + (void)pLangGlb);
      *(void *)(v37 + 8) = 1LL;
      *(void *)(v37 + 24) = 2LL;
    }

    goto LABEL_90;
  }

  if (dword_99A68 <= 1) {
    BOOL v32 = 0;
  }
  if (v32 && (lFlags & 0x100000) == 0)
  {
    uint64_t v34 = qword_99A30;
    if (qword_99A30)
    {
      *(void *)qword_99A30 = *(void *)&stru_68.sectname[(void)pLangGlb];
      *(void *)(v34 + 8) = 2LL;
      *(void *)(v34 + 24) = 2LL;
    }

            int v16 = *(unsigned __int8 *)qword_99A38;
            else {
              int v17 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v16);
            }
            char v18 = *v17;
            int v15 = qword_99A00;
            *(_BYTE *)qword_99A00 = v18;
LABEL_56:
            qword_99A00 = v15 + 1;
          }
        }

        else
        {
          if (nLangIDGlb != 7) {
            goto LABEL_47;
          }
LABEL_62:
          add_seg(64LL);
          unsigned int v21 = upper_digit(*(_BYTE *)qword_99A38);
          uint64_t v2 = 0;
          uint64_t v22 = qword_99A00;
          *(_BYTE *)qword_99A00 = v21;
          qword_99A00 = v22 + 1;
        }
      }
    }
  }

  uint64_t v26 = nLangIDGlb != 9 || nSubLangIDGlb == 2;
  if (!v26 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
  {
    add_seg(16LL);
    int v27 = qword_99A00;
    *(_BYTE *)qword_99A00 = 33;
    qword_99A00 = v27 + 1;
  }

LABEL_90:
    add_list_element();
    uint64_t v10 = v8;
    if (qword_99A30) {
      *(void *)(qword_99A30 + 32) = *(void *)(*(void *)(qword_99A30 + 40) + 32LL);
    }
  }

LABEL_92:
  uint64_t v204 = v1;
  if (v10 < 2 || !exceptions[0] || dword_99A68 > 1 || !qword_99A30 || (~*(_DWORD *)(qword_99A30 + 32) & 0x7FFELL) == 0)
  {
LABEL_136:
    uint64_t v64 = nLangIDGlb;
    if (nLangIDGlb != 7) {
      goto LABEL_144;
    }
    if ((unint64_t v65 = lFlags, v66 = byte_999E8, (lFlags & 0x100000) != 0) && !byte_999E8
      || (v67 = v10, v68 = nLangIDGlb, v69 = is_upper_dash(), v64 = v68, uint64_t v10 = v67, v69))
    {
      if (((v65 >> 19) & 1 | v66) != 1) {
        goto LABEL_144;
      }
      uint64_t v70 = v10;
      uint64_t v71 = v64;
      BOOL v72 = is_upper_dash();
      uint64_t v64 = v71;
      uint64_t v10 = v70;
      if (!v72) {
        goto LABEL_144;
      }
    }

    uint64_t v73 = dword_99A68;
    if (dword_99A68 <= 1 && v10 != dword_99A68)
    {
LABEL_144:
      int v13 = (unsigned __int8 **)qword_99A30;
      uint64_t v2 = (void *)&unk_99000;
      char v7 = &unk_99000;
      char v6 = (void *)&unk_99000;
      if (qword_99A30)
      {
        uint64_t v74 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
        if ((v74 & 0x80000000) != 0) {
          goto LABEL_232;
        }
        uint64_t v75 = 0LL;
        v196 = pLangGlb;
        v76 = (unsigned __int8 **)*pLangGlb;
        v77 = (_BYTE *)qword_99A38;
        uint64_t v194 = qword_99A28 & 0xD0;
        v198 = (unsigned __int8 *)(qword_99A38 + 1);
        __sa = (char *)(qword_99A28 & 0xC0);
        unint64_t v208 = qword_99A28;
        v78 = (unsigned __int8 *)qword_99A20;
        v79 = "";
        while (1)
        {
          if (v76[2] == (unsigned __int8 *)v10)
          {
            v80 = *v76;
            int v81 = *(unsigned __int16 *)*v76;
            if (*(unsigned __int16 *)v78 == v81)
            {
              v82 = (unsigned __int16 *)v76[4];
              if (((_DWORD)v13[4] & v82 & 0x9000FFFF) == 0)
              {
                v83 = v78;
                v84 = *v76;
                do
                {
                  do
                    int v85 = *v83++;
                  while (v85 == 173 || v85 == 30);
                  int v87 = *++v84;
                  LOBYTE(v81) = v87;
                }

                while (v87);
                if ((_DWORD)v64 == 12)
                {
                  uint64_t v88 = *v76[1];
                  if ((_DWORD)v88 != 46) {
                    goto LABEL_163;
                  }
                }

                uint64_t v88 = *v76[1];
                if (!*v76[1]) {
                  goto LABEL_174;
                }
                v89 = v77;
                unsigned int v200 = v64;
                uint64_t v90 = v10;
                if (!memchr(".-'", v88, 4uLL))
                {
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
LABEL_163:
                  if ((_DWORD)v88 == 40)
                  {
                    if (*v77 == 39) {
                      goto LABEL_150;
                    }
                    uint64_t v88 = 40LL;
                  }

                  else if (v204 == 8 && (_DWORD)v88 == 35)
                  {
                    goto LABEL_150;
                  }

LABEL_174:
                  if (((unsigned __int16)v82 & 0x8001) != 1LL || *v77 != 46)
                  {
                    if ((v82 & 0x800000) == 0
                      || v208 <= 2
                      && ((v108 = v13[5]) == 0LL
                       || **(unsigned __int8 **)v108 == *(unsigned __int8 *)v196[10]
                       || (v109 = (unsigned __int8 *)*((void *)v108 + 5)) == 0LL
                       || *((void *)v109 + 3) != 0x400000LL)
                      && ((unsigned int v110 = *v77, v110 < 0x21) || v110 == 160))
                    {
                      v93 = "US";
                      while (1)
                      {
                        do
                          int v94 = *v80++;
                        while (v94 == 173 || v94 == 30);
                        if (++v93 == v79)
                        {
                          if (*(v77 - 3) == 36 || *v77 == 36) {
                            goto LABEL_150;
                          }
                          break;
                        }
                      }

                      int v111 = *v77;
                      if (!*v77) {
                        goto LABEL_437;
                      }
                      uint64_t v112 = v10;
                      uint64_t v113 = v64;
                      v114 = v77;
                      int v201 = *v77;
                      v115 = memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v201, 0x15uLL);
                      int v111 = v201;
                      v79 = "";
                      v77 = v114;
                      uint64_t v64 = v113;
                      uint64_t v10 = v112;
                      if (!v115)
                      {
LABEL_437:
                        v116 = v13[5];
                        if (!v116) {
                          goto LABEL_438;
                        }
                        if (*((void *)v116 + 3) < 3uLL) {
                          goto LABEL_438;
                        }
                        v117 = *(_BYTE **)v116;
                        if (!*v117) {
                          goto LABEL_438;
                        }
                        uint64_t v118 = v10;
                        uint64_t v119 = v64;
                        v120 = v77;
                        int v202 = v111;
                        v121 = memchr( ".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                                 *v117,
                                 0x15uLL);
                        int v111 = v202;
                        v79 = "";
                        v77 = v120;
                        uint64_t v64 = v119;
                        uint64_t v10 = v118;
                        if (!v121)
                        {
LABEL_438:
                          if (!v111 || v111 != 9 && v111 != 160 && v111 != 32) {
                            goto LABEL_436;
                          }
                          uint64_t v122 = *v198;
                          if (!*v198) {
                            goto LABEL_439;
                          }
                          uint64_t v203 = v10;
                          uint64_t v123 = v64;
                          v124 = v77;
                          v125 = memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v198, 0x15uLL);
                          v79 = "";
                          v77 = v124;
                          uint64_t v64 = v123;
                          uint64_t v10 = v203;
                          if (!v125)
                          {
LABEL_439:
                            BOOL v126 = v122;
                            uint64_t v127 = v10;
                            uint64_t v128 = v64;
                            v129 = v77;
                            BOOL v130 = in(v126, 25);
                            v79 = "";
                            v77 = v129;
                            uint64_t v64 = v128;
                            uint64_t v10 = v127;
                            if (!v130)
                            {
                              BOOL v131 = is_url(v198);
                              v79 = "";
                              v77 = v129;
                              uint64_t v64 = v128;
                              uint64_t v10 = v127;
                              if (!v131)
                              {
LABEL_436:
                                if (!__sa) {
                                  goto LABEL_190;
                                }
                                BOOL v96 = v88;
                                uint64_t v97 = v10;
                                uint64_t v98 = v64;
                                v99 = v77;
                                v100 = v79;
                                BOOL v101 = in(v96, 5);
                                v79 = v100;
                                v77 = v99;
                                uint64_t v64 = v98;
                                uint64_t v10 = v97;
                                if (!v101)
                                {
LABEL_190:
                                  if ((_DWORD)v64 == 9 && (v82 & 0x40) != 0)
                                  {
                                    int v102 = *v77;
                                    if (v102 == 34)
                                    {
                                      uint64_t v135 = v10;
                                      uint64_t v136 = v64;
                                      v137 = v77;
                                      v138 = v79;
                                      BOOL v139 = in(*v198, 9);
                                      v79 = v138;
                                      v77 = v137;
                                      uint64_t v64 = v136;
                                      uint64_t v10 = v135;
                                      if (v139) {
                                        goto LABEL_150;
                                      }
                                    }

                                    else if (v102 == 39)
                                    {
                                      uint64_t v103 = v10;
                                      uint64_t v104 = v64;
                                      v105 = v77;
                                      v106 = v79;
                                      v107 = memchr("MNmn", (char)*v198, 5uLL);
                                      v79 = v106;
                                      v77 = v105;
                                      uint64_t v64 = v104;
                                      uint64_t v10 = v103;
                                      if (v107) {
                                        goto LABEL_150;
                                      }
                                    }

                                    if (v208 == 32 && **(_BYTE **)v13[5] == 46) {
                                      goto LABEL_150;
                                    }
                                  }

                                  if (qword_999F8 < 1)
                                  {
                                    v140 = &unk_99000;
                                  }

                                  else
                                  {
                                    v140 = (void *)&unk_99000;
                                    if (qword_999F8 <= v10)
                                    {
                                      qword_999F8 = 0LL;
                                      *int v13 = "\x1E";
                                      v13[1] = (_BYTE *)(&dword_0 + 1);
                                      v13[3] = (_BYTE *)(&dword_0 + 1);
                                      uint64_t v141 = v10;
                                      add_list_element();
                                      uint64_t v10 = v141;
                                      __sa = (char *)(qword_99A28 & 0xC0);
                                    }
                                  }

                                  if (__sa && *v76[1] - 107 >= 0xFFFFFFF6 && (uint64_t)v76[2] >= 2)
                                  {
                                    uint64_t v178 = v10;
                                    v179 = (void *)v140[326];
                                    if (v179)
                                    {
                                      void *v179 = "-";
                                      v179[1] = 1LL;
                                      v179[3] = 4LL;
                                    }

                                    add_list_element();
                                    uint64_t v10 = v178;
                                  }

                                  v180 = v76[3];
                                  int v13 = (unsigned __int8 **)v140[326];
                                  if (v13)
                                  {
                                    *int v13 = v76[1];
                                    v13[1] = v180;
                                    v13[3] = (_BYTE *)&stru_20;
                                  }

                                  v181 = (unsigned __int16 *)v76[4];
                                  if ((v181 & 0x400000) == 0)
                                  {
                                    if ((v181 & 0x200000) != 0)
                                    {
                                      v182 = v13[5];
                                      if (!v182 || (int v183 = **(unsigned __int8 **)v182, v183 != 45) && v183 != 151)
                                      {
                                        v184 = (unsigned __int8 *)qword_99A38;
                                        if (*(_BYTE *)qword_99A38 != 45)
                                        {
                                          v185 = " - ";
                                          while (1)
                                          {
                                            do
                                              int v186 = *v184++;
                                            while (v186 == 173 || v186 == 30);
                                            if (++v185 == "") {
                                              goto LABEL_426;
                                            }
                                          }

                                          v13[3] = (unsigned __int8 *)0x200000;
                                          if (v182)
                                          {
                                            if (*((void *)v182 + 3) == 2LL)
                                            {
                                              v190 = (unsigned __int8 *)*((void *)v182 + 5);
                                              if (v190)
                                              {
                                                if (*((void *)v190 + 3) == 0x200000LL) {
                                                  *((void *)v182 + 3) = 0LL;
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }

                                    goto LABEL_426;
                                  }

                                  uint64_t v188 = v10;
                                  v13[3] = (unsigned __int8 *)0x400000;
                                  int v189 = *(unsigned __int8 *)qword_99A38;
                                  if ((v189 == 9 || v189 == 160 || v189 == 32)
                                    && in(*(unsigned __int8 *)(qword_99A38 + 1), 11))
                                  {
                                    uint64_t v1 = 0LL;
                                  }

                                  else
                                  {
                                    if (v180 == (_BYTE *)&dword_0 + 1)
                                    {
                                      uint64_t v3 = (void *)&unk_99000;
                                      uint64_t v1 = v204;
                                      uint64_t v2 = (void *)&unk_99000;
                                      char v7 = (void *)&unk_99000;
                                      uint64_t v10 = v188;
                                      goto LABEL_232;
                                    }

LABEL_426:
                                    uint64_t v1 = v204;
                                  }

                                  uint64_t v2 = (void *)&unk_99000;
                                  char v7 = (void *)&unk_99000;
                                  char v6 = (void *)&unk_99000;
                                  if (nLangIDGlb == 7
                                    && ((_BYTE)v13[4] & 0x40) != 0
                                    && **v13 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
                                  {
                                    ++*v13;
                                  }

                                  if (v76[2] == (_BYTE *)&dword_0 + 1) {
                                    v13[4] = (unsigned __int8 *)((unint64_t)v13[4] | 0x8000000);
                                  }
                                  char v4 = (_BYTE *)qword_99A20;
                                  uint64_t v3 = &unk_99000;
                                  qword_99A00 = qword_99A20;
                                  goto LABEL_363;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }

                  goto LABEL_150;
                }

                if (*v89)
                {
                  unsigned int __ca = *v89;
                  v91 = memchr(".-'", __ca, 4uLL);
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
                  if (v91) {
                    goto LABEL_150;
                  }
                  BOOL v92 = in(__ca, 25);
                  v79 = "";
                  v77 = v89;
                  uint64_t v64 = v200;
                  uint64_t v10 = v90;
                }

                else
                {
                  BOOL v92 = in(0LL, 25);
                  uint64_t v10 = v90;
                  uint64_t v64 = v200;
                  v77 = v89;
                  v79 = "";
                }

                if (!v92)
                {
                  v132 = v13[5];
                  if (!v132
                    || (v133 = *(_BYTE **)v132, !*v133)
                    || (v134 = memchr(".-'", *v133, 4uLL),
                        v79 = "",
                        v77 = v89,
                        uint64_t v64 = v200,
                        uint64_t v10 = v90,
                        !v134))
                  {
                    if (!v194) {
                      goto LABEL_163;
                    }
                  }
                }
              }
            }
          }

LABEL_150:
          v76 += 5;
          BOOL v11 = v75++ == v74;
          if (v11)
          {
            uint64_t v3 = (void *)&unk_99000;
            uint64_t v1 = v204;
            uint64_t v2 = (void *)&unk_99000;
            char v7 = (void *)&unk_99000;
LABEL_232:
            char v5 = &unk_99000;
            if (v10 >= 2)
            {
              char v142 = *(_BYTE *)qword_99A20;
              if (*(_BYTE *)qword_99A20)
              {
                uint64_t v9 = 1163264LL;
                char v6 = (void *)&unk_99000;
                if ((v142 + 64) >= 0x1Fu)
                {
                  BOOL v143 = (v142 - 91) >= 0xE6u;
                  uint64_t v144 = 114688LL;
LABEL_266:
                  if (!v143) {
                    uint64_t v9 = v144;
                  }
                }

                goto LABEL_360;
              }

              uint64_t v9 = 114688LL;
LABEL_293:
              char v6 = (void *)&unk_99000;
              goto LABEL_360;
            }

            v13[4] = (unsigned __int8 *)((unint64_t)v13[4] | 0x8000000);
            int v145 = *(unsigned __int8 *)qword_99A20;
            if ((v145 - 91) >= 0xFFFFFFE6)
            {
              LOBYTE(v145) = v145 | 0x20;
              *(_BYTE *)qword_99A20 = v145;
            }

            if (nLangIDGlb == 12)
            {
              uint64_t v8 = v10;
              uint64_t v153 = qword_99A38;
              unsigned __int8 v154 = *(_BYTE *)qword_99A38;
              if (!memchr(".!?", *(char *)qword_99A38, 4uLL)
                || *(unsigned __int8 *)(v153 + 1) > 0x20u
                || *(unsigned __int8 *)(v153 - 2) >= 0x21u)
              {
                uint64_t v164 = *(unsigned __int8 *)(v153 - 2);
                if (*(_BYTE *)(v153 - 2))
                {
                  if (memchr("({[<\x91", *(unsigned __int8 *)(v153 - 2), 6uLL)
                    || memchr(")}]>\x9B", v164, 6uLL)
                    || in(v164, 25) && ((_DWORD)v164 != 45 || v154 == 45)
                    || memchr(".'\x82\x91\x92", v164, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }

                else if (in(0LL, 25))
                {
                  goto LABEL_355;
                }

                if (v154)
                {
                  if (memchr("({[<\x91", v154, 6uLL)
                    || memchr(")}]>\x9B", v154, 6uLL)
                    || in(v154, 25) && (v154 != 45 || (_DWORD)v164 == 45)
                    || memchr(".'\x82\x91\x92", v154, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }

                else if (in(0LL, 25))
                {
                  goto LABEL_355;
                }

                if (((_BYTE)v13[4] & 0x40) != 0) {
                  goto LABEL_355;
                }
              }

              uint64_t v9 = 4LL;
              uint64_t v3 = (void *)&unk_99000;
            }

            else
            {
              if (nLangIDGlb == 9)
              {
                uint64_t v8 = v10;
                v155 = (unsigned __int8 *)qword_99A38;
                uint64_t v156 = *(unsigned __int8 *)(qword_99A38 - 2);
                if (*(_BYTE *)(qword_99A38 - 2))
                {
                  v157 = memchr("({[<\x91", *(unsigned __int8 *)(qword_99A38 - 2), 6uLL);
                  int v158 = nSubLangIDGlb;
                  BOOL v159 = nSubLangIDGlb != 2;
                  if (v157) {
                    BOOL v160 = nSubLangIDGlb == 2;
                  }
                  else {
                    BOOL v160 = 1;
                  }
                  if (!v160)
                  {
                    int v161 = *v155;
                    if (v161 != 9 && v161 != 160 && v161 != 32) {
                      goto LABEL_355;
                    }
                  }

                  if (memchr(")}]>\x9B", v156, 6uLL))
                  {
                    if (v158 != 2)
                    {
                      int v162 = *v155;
                      if (v162 != 9 && v162 != 160 && v162 != 32) {
                        goto LABEL_355;
                      }
                    }
                  }

                  BOOL v163 = in(v156, 25);
                  if ((_DWORD)v156 != 45 && v163) {
                    goto LABEL_355;
                  }
                  if (memchr( "_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5 \xB6\xB9\xBA\xBC\xBD\xBE\xC5.:/h",  v156,  0x24uLL)
                    || memchr(".'\x82\x91\x92", v156, 7uLL))
                  {
                    goto LABEL_355;
                  }
                }

                else
                {
                  BOOL v159 = nSubLangIDGlb != 2;
                  if (in(0LL, 25)) {
                    goto LABEL_355;
                  }
                }

                uint64_t v169 = *v155;
                if (*v155)
                {
                  if (memchr("({[<\x91", *v155, 6uLL))
                    BOOL v170 = v159;
                  else {
                    BOOL v170 = 0;
                  }
                  if (v170 && (!(_DWORD)v156 || (_DWORD)v156 != 9 && (_DWORD)v156 != 160 && (_DWORD)v156 != 32)) {
                    goto LABEL_355;
                  }
                  BOOL v171 = memchr(")}]>\x9B", v169, 6uLL) && v159;
                  if (v171 && (!(_DWORD)v156 || (_DWORD)v156 != 9 && (_DWORD)v156 != 160 && (_DWORD)v156 != 32)) {
                    goto LABEL_355;
                  }
                  BOOL v172 = in(v169, 25);
                  if ((_DWORD)v169 != 45 && v172) {
                    goto LABEL_355;
                  }
                  if (memchr( "_#$%&\x80\x83\x86\x87\x89\x99\xA2\xA3\xA4\xA5\xA6\xA7\xA8\xA9\xAA\xAC\xAE\xAF\xB0\xB1\xB2\xB3\xB5 \xB6\xB9\xBA\xBC\xBD\xBE\xC5.:/h",  v169,  0x24uLL))
                  {
                    goto LABEL_355;
                  }

                  if ((_DWORD)v169 == 34) {
                    goto LABEL_355;
                  }
                  if ((_DWORD)v169 == 46)
                  {
                    unsigned int v173 = v155[1];
                    if (v173 >= 0x21 && v173 != 45) {
                      goto LABEL_355;
                    }
                  }
                }

                else if (in(0LL, 25))
                {
                  goto LABEL_355;
                }

                if (((_BYTE)v13[4] & 0x40) != 0) {
                  goto LABEL_355;
                }
                uint64_t v9 = 4LL;
              }

              else
              {
                if (nLangIDGlb != 7)
                {
                  uint64_t v9 = 4LL;
                  uint64_t v3 = (void *)&unk_99000;
                  goto LABEL_293;
                }

                uint64_t v8 = v10;
                if (*(_BYTE *)qword_99A38 != 39 && ((_BYTE)v13[4] & 0x40) == 0)
                {
                  uint64_t v9 = 4LL;
                  uint64_t v3 = (void *)&unk_99000;
                  char v6 = (void *)&unk_99000;
                  goto LABEL_359;
                }

LABEL_355:
                uint64_t v9 = 32LL;
                if ((v145 & 0x80u) != 0) {
                  uint64_t v9 = 4LL;
                }
              }

              uint64_t v3 = &unk_99000;
              uint64_t v2 = &unk_99000;
              char v7 = &unk_99000;
            }

            char v6 = &unk_99000;
            char v5 = &unk_99000;
            goto LABEL_359;
          }
        }
      }

      char v5 = (void *)&unk_99000;
LABEL_362:
      char v4 = (_BYTE *)v3[320];
      v5[324] = v4;
      goto LABEL_363;
    }

    char v5 = &unk_99000;
    v146 = (_BYTE *)qword_99A20;
    uint64_t v2 = (void *)&unk_99000;
    char v7 = (void *)&unk_99000;
    char v6 = (void *)&unk_99000;
    if (v10 >= 1)
    {
      uint64_t v147 = 0LL;
      uint64_t v148 = v10 - 1;
      while (1)
      {
        --v147;
        int v149 = *(unsigned __int8 *)(qword_99A38 + v147);
        if (v149 != 173 && v149 != 30)
        {
          v146[v148] = v149;
          BOOL v152 = v148-- <= 0;
          if (v152) {
            break;
          }
        }
      }
    }

    unsigned int v151 = *v146;
    if (v151 == 45)
    {
      unsigned int v151 = 151;
      _BYTE *v146 = -105;
    }

    BOOL v152 = v146[v10 - 1] != 45 || v10 < 3;
    if (!v152)
    {
      dword_99A68 = v73 + 1;
      uint64_t v73 = (int)v73 + 1;
    }

    if (v10 == v73)
    {
      if (v151)
      {
        BOOL v143 = v151 - 123 >= 0xFFFFFFE6 || v151 >= 0xDF;
        uint64_t v9 = 512LL;
        uint64_t v144 = 1024LL;
        goto LABEL_266;
      }

      uint64_t v9 = 1024LL;
    }

    else
    {
      uint64_t v9 = 512LL;
    }

    goto LABEL_360;
  }

  uint64_t v38 = 0LL;
  uint64_t v39 = (char *)v28[324];
  uint64_t v40 = qword_999F8;
  uint64_t v207 = qword_99A00;
  int v41 = 1;
  BOOL v42 = v39;
  uint64_t v43 = v10;
  *(void *)__c = v39;
  while (1)
  {
    BOOL v44 = &exceptions[160 * v38];
    uint64_t v45 = *((void *)v44 + 19);
    if ((v45 & 0x1C000) != 0)
    {
      uint64_t v46 = *(void *)&exceptions[160 * v38 + 136];
    }

    else
    {
      if (v42 != v39) {
        goto LABEL_132;
      }
      uint64_t v46 = v10;
      if (*(void *)&exceptions[160 * v38 + 136] != v10) {
        goto LABEL_132;
      }
    }

    if (v46 > v43) {
      goto LABEL_132;
    }
    uint64_t v47 = 0LL;
    v48 = &exceptions[160 * v38 + 136];
    int v49 = *v44;
    do
    {
      int v49 = exceptions[160 * v38 + 1 + v47++];
    }

    while (v49);
    if (v46 == v10) {
      break;
    }
    if ((v45 & 0x4000) != 0 && v42 == v39)
    {
LABEL_117:
      v50 = (char *)(v42 - v39);
      if (v40 <= v42 - v39)
      {
        uint64_t v197 = v40;
      }

      else
      {
        else {
          uint64_t v51 = v40 - v46 + *(void *)&exceptions[160 * v38 + 144];
        }
        uint64_t v197 = v51;
        qword_999F8 = v51;
      }

      __s = &v42[v47];
      uint64_t v52 = &exceptions[160 * v38];
      int64_t v55 = *((void *)v52 + 18);
      uint64_t v53 = (size_t *)(v52 + 144);
      int64_t v54 = v55;
      uint64_t v193 = v207;
      uint64_t v195 = v10;
      size_t v56 = v55;
      uint64_t v199 = v10;
      int64_t v57 = v55 - v46;
      if (v55 > v46)
      {
        uint64_t v195 = v57 + v10;
        uint64_t v193 = v207 + v57;
        qword_99A00 = v207 + v57;
        size_t v58 = strlen(__s);
        v48 = &exceptions[160 * v38 + 136];
        memmove(&v42[v54], __s, v58 + 1);
        size_t v56 = *v53;
      }

      memcpy(v42, &exceptions[160 * v38 + 65], v56);
      v43 -= *(void *)v48;
      v42 += *v53;
      if (__s <= v42)
      {
        int v41 = 0;
        uint64_t v10 = v195;
        uint64_t v207 = v193;
        uint64_t v3 = (void *)&unk_99000;
      }

      else
      {
        if (v46 <= v54) {
          uint64_t v59 = v54;
        }
        else {
          uint64_t v59 = v46;
        }
        size_t v60 = *v53 + v59 - v46;
        uint64_t v61 = v60 + v199 - v47;
        uint64_t v3 = &unk_99000;
        uint64_t v207 = v207 + v60 - v47;
        qword_99A00 = v207;
        size_t v62 = strlen(__s);
        memmove(v42, __s, v62 + 1);
        uint64_t v10 = v61;
        int v41 = 0;
      }

      uint64_t v39 = *(char **)__c;
      uint64_t v40 = v197;
      goto LABEL_132;
    }

    if (v42[v47])
    {
      if ((v45 & 0x8000) != 0 && v42 > v39) {
        goto LABEL_117;
      }
    }

    else if ((v45 & 0x10000) != 0)
    {
      goto LABEL_117;
    }

LABEL_132:
    if (++v38 == 100)
    {
      uint64_t v38 = 0LL;
      BOOL v11 = v41 == 0;
      uint64_t v63 = v41 != 0;
      if (!v11) {
        ++v42;
      }
      v43 -= v63;
      int v41 = 1;
      if (v43 <= 1) {
        goto LABEL_136;
      }
    }
  }

  if ((v45 & 0x2000) == 0) {
    goto LABEL_132;
  }
  char v6 = &unk_99000;
  int v13 = (unsigned __int8 **)qword_99A30;
  if (qword_999F8 >= 1 && qword_999F8 <= v10)
  {
    qword_999F8 = 0LL;
    uint64_t v2 = (void *)&unk_99000;
    v166 = &unk_99000;
    if (qword_99A30)
    {
      *(void *)qword_99A30 = "\x1E";
      v13[1] = (_BYTE *)(&dword_0 + 1);
      v13[3] = (_BYTE *)(&dword_0 + 1);
    }

    add_list_element();
    int v13 = (unsigned __int8 **)qword_99A30;
  }

  else
  {
    uint64_t v2 = (void *)&unk_99000;
    v166 = (void *)&unk_99000;
  }

  if (v13)
  {
    v167 = &exceptions[160 * v38];
    v168 = (unsigned __int8 *)*((void *)v167 + 18);
    *int v13 = (unsigned __int8 *)(v167 + 65);
    v13[1] = v168;
    v13[3] = (_BYTE *)&stru_20;
  }

  char v4 = (_BYTE *)v166[324];
  v3[320] = v4;
  char v7 = (void *)&unk_99000;
LABEL_363:
  uint64_t v174 = v6[319];
  if (v174 >= 1 && v13 != 0LL)
  {
    v13[2] = (unsigned __int8 *)v174;
    v6[319] = 0LL;
  }

  v7[325] = v2[323];
  v2[323] = v1;
  if (v1 > 255)
  {
    if (v1 == 256)
    {
      if (nLangIDGlb == 7)
      {
        *char v4 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
        v3[320] = v4 + 1;
      }

      return;
    }

    if (v1 != 0x2000) {
      return;
    }
LABEL_374:
    if (is_url((unsigned __int8 *)qword_99A38))
    {
      if ((lFlags & 0x200000) == 0)
      {
        uint64_t v176 = 0LL;
        v2[323] = 2048LL;
        char v177 = 39;
        do
        {
          v4[v176] = v177;
          char v177 = asc_25B8F[++v176];
        }

        while (v176 != 2);
        v3[320] = v4 + 2;
LABEL_389:
        dword_99A68 = 0;
        byte_99A60 = 0;
        qword_99A70 = qword_99A38;
        return;
      }

      if (nLangIDGlb == 12) {
        byte_999EC = 1;
      }
    }

    if (v1 == 64) {
      goto LABEL_384;
    }
    goto LABEL_389;
  }

  if (v1 == 64) {
    goto LABEL_374;
  }
  if (v1 != 128) {
    return;
  }
LABEL_384:
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
    byte_999EC = 1;
  }
}

void add_whitespace()
{
  for (uint64_t i = qword_99A00 + 1; ; ++i)
  {
    uint64_t v1 = (_BYTE *)(qword_99A38 + 1);
    int v2 = *(unsigned __int8 *)(qword_99A38 + 1);
    if (v2 != 9 && v2 != 160 && v2 != 32) {
      break;
    }
    ++qword_99A38;
    *(_BYTE *)(i - 1) = *v1;
    qword_99A00 = i;
  }

  if (byte_99A50 == 1)
  {
    *(_BYTE *)(i - 1) = 31;
    qword_99A00 = i;
  }

  byte_999EC = 0;
}

void skip_whitespace(int a1)
{
  uint64_t v1 = qword_99A38;
  if (*(_BYTE *)qword_99A38)
  {
    int v2 = *(unsigned __int8 *)(qword_99A38 + 1);
    if (v2 == 30)
    {
      ++qword_99A38;
      qword_999F8 = qword_99A00 - qword_99A20 + 1;
      int v2 = *(unsigned __int8 *)(v1 + 2);
      ++v1;
    }

    if (v2 == 32)
    {
      if (!a1 && (lFlags & 0x8000000) != 0) {
        return;
      }
    }

    else if (!a1 || v2 != 160)
    {
      return;
    }

    int v3 = *(unsigned __int8 *)(v1 + 2);
    if (v3 != 9 && v3 != 32 && v3 != 160)
    {
      qword_99A38 = v1 + 1;
      if (byte_99A50 == 1)
      {
        add_seg(2LL);
        uint64_t v4 = qword_99A00;
        *(_BYTE *)qword_99A00 = 31;
        qword_99A00 = v4 + 1;
      }
    }
  }

void remove_whitespace(int a1)
{
  if (qword_99A18 == 2 && (a1 || (lFlags & 0x8000000) == 0))
  {
    if (qword_99A00 - qword_99A20 == 1 || (qword_99A00 - qword_99A20 == 2 ? (BOOL v1 = byte_99A50 == 0) : (BOOL v1 = 1), !v1))
    {
      if (*(_BYTE *)qword_99A20 == 32)
      {
        qword_99A18 = 0LL;
        if (byte_99A50 == 1)
        {
          add_seg(2LL);
          uint64_t v2 = qword_99A00;
          *(_BYTE *)qword_99A00 = 31;
          qword_99A00 = v2 + 1;
        }
      }
    }
  }

uint64_t no_abbrev()
{
  BOOL v0 = nSubLangIDGlb == 3 && nLangIDGlb == 9;
  uint64_t result = 1LL;
  if (!v0)
  {
    uint64_t v2 = qword_99A18;
    if (qword_99A18 != 0x2000)
    {
      int v3 = (unsigned __int8 *)qword_99A38;
      if (nLangIDGlb == 7)
      {
        uint64_t v4 = "So.";
        char v5 = (unsigned __int8 *)qword_99A38;
        while (1)
        {
          do
            int v6 = *v5++;
          while (v6 == 173 || v6 == 30);
          if (++v4 == "")
          {
            if (*(unsigned __int8 *)(qword_99A38 + 3) < 0x41u)
            {
              BOOL v8 = 0;
              uint64_t v9 = 2LL;
              goto LABEL_34;
            }

            break;
          }
        }

        uint64_t v10 = "gen.";
        BOOL v11 = (unsigned __int8 *)qword_99A38;
        while (1)
        {
          do
            int v12 = *v11++;
          while (v12 == 173 || v12 == 30);
          if (++v10 == "")
          {
            int v14 = *(unsigned __int8 *)(qword_99A38 + 4);
            if (*(_BYTE *)(qword_99A38 + 4))
            {
              BOOL v8 = 0;
              uint64_t v9 = 3LL;
              if ((v14 | 0x80) == 0xA0)
              {
                char v15 = *(_BYTE *)(qword_99A38 + 5);
                if (v15)
                {
                  BOOL v8 = 0;
                  uint64_t v9 = 3LL;
                }
              }
            }

            break;
          }
        }
      }

      unint64_t v16 = is_generic_abbrev((unsigned __int8 *)qword_99A38);
      if (v16)
      {
        uint64_t v9 = v16;
        BOOL v8 = 0;
      }

      else
      {
        unint64_t v17 = is_common_abbrev(v3);
        if (!v17) {
          return 1LL;
        }
        uint64_t v9 = v17;
        BOOL v8 = v17 > 2;
        int v3 = (unsigned __int8 *)qword_99A38;
      }

LABEL_34:
      if (is_url(v3)) {
        return 1LL;
      }
      if (v2 == 2) {
        qword_99A18 = 1LL;
      }
      if (v8) {
        uint64_t v18 = 0x2000LL;
      }
      else {
        uint64_t v18 = 32LL;
      }
      add_seg(v18);
      do
      {
        int v19 = (_BYTE *)qword_99A38;
        if (v8 && in(*(unsigned __int8 *)qword_99A38, 9))
        {
          qword_99A38 = (uint64_t)(v19 + 1);
          uint64_t v20 = qword_99A00;
          *(_BYTE *)qword_99A00 = *v19 & 0xDF;
          qword_99A00 = v20 + 1;
        }

        else
        {
          qword_99A38 = (uint64_t)(v19 + 1);
          add_basis_char((char)*v19, 0);
        }

        --v9;
      }

      while (v9);
      add_basis_char(*(char *)qword_99A38, 0);
      if (*(_BYTE *)qword_99A38
        && *(_BYTE *)(qword_99A38 + 1) == 32
        && *(unsigned __int8 *)(qword_99A38 + 2) - 58 >= 0xFFFFFFF6)
      {
        skip_whitespace(0);
      }

      uint64_t result = 0LL;
      dword_999F0 = 0;
    }
  }

  return result;
}

  if (((v5 & 1) != 0
     || v2 == stru_B8.segname[(void)pLangGlb + 1]
     || v2 == stru_B8.segname[(void)pLangGlb + 2])
    && a1[2] == 30
    && a1[3] - 107 > 0xFFFFFFF5)
  {
    return 1LL;
  }

  if (v6 == 9)
  {
    if (v2 > 0x2D
      || ((1LL << v2) & 0x209000000000LL) == 0
      || a1[2] != 30
      || !a1[3]
      || !memchr(",;:/?+=(*)", a1[3], 0xBuLL))
    {
      goto LABEL_63;
    }

    return 1LL;
  }

  if (v6 != 7) {
    goto LABEL_63;
  }
  if (v2 == 45 && (a1[2] | 2) == 0x2E && a1[3] - 107 > 0xFFFFFFF5
    || v3
    && a1[2] == 45
    && (a1[3] | 2) == 0x2E
    && a1[4] - 107 > 0xFFFFFFF5)
  {
    return 1LL;
  }

  if (v2 != 45) {
    goto LABEL_63;
  }
  uint64_t v9 = a1[2];
  if (v9 == 46 || v9 == 44)
  {
  }

  else if (v9 == 30 && (a1[3] | 2) == 0x2E && a1[4] - 107 >= 0xFFFFFFF6)
  {
    return 1LL;
  }

uint64_t no_locution()
{
  uint64_t result = 1LL;
  if (nLangIDGlb == 12
    && qword_99A18 != 0x2000
    && (lFlags & 0x4000) == 0
    && (byte_999EC & 1) == 0
    && (byte_99A54 & 1) == 0)
  {
    int v1 = *(int *)((char *)&dword_8 + (void)pLangGlb);
    if ((v1 & 0x80000000) == 0)
    {
      uint64_t v2 = (unsigned __int8 *)qword_99A38;
      int v3 = *pLangGlb + 2;
      int v4 = v1 + 1;
      while ((*((_BYTE *)v3 + 17) & 0x40) == 0
           || !equals_nocase(v2, (unsigned __int8 *)*(v3 - 2))
           || (*v3)[(void)v2] > 0x40u)
      {
        v3 += 5;
        if (!--v4) {
          return 1LL;
        }
      }

      add_seg(0x2000LL);
      char v5 = *(v3 - 2);
      int v6 = (_BYTE *)qword_99A00;
      char v9 = *v5;
      char v7 = v5 + 1;
      char v8 = v9;
      do
      {
        *v6++ = v8;
        int v10 = *v7++;
        char v8 = v10;
      }

      while (v10);
      uint64_t result = 0LL;
      qword_99A00 = (uint64_t)v6;
      qword_99A38 = (uint64_t)&(*v3)[qword_99A38 - 1];
    }
  }

  return result;
}

BOOL is_mathematics()
{
  if (qword_99A18 == 0x2000) {
    return 0LL;
  }
  if ((byte_999E8 & 1) != 0) {
    return 1LL;
  }
  return strchr((const char *)(qword_99A38 + 1), 61) != 0LL;
}

uint64_t is_supersub()
{
  BOOL v0 = (unsigned __int8 *)(qword_99A38 + 1);
  int v1 = *(unsigned __int8 *)(qword_99A38 + 1);
  if (*(_BYTE *)(qword_99A38 + 1))
  {
    if ((v1 - 58) < 0xF6u && !in(*(unsigned __int8 *)(qword_99A38 + 1), 25))
    {
      uint64_t v2 = memchr("({[<\x91", v1, 6uLL);
      if (v1 != 30 && v2 == 0LL) {
        return 0LL;
      }
    }
  }

  else
  {
    uint64_t result = in(0LL, 25);
    if (!(_DWORD)result) {
      return result;
    }
  }

  return equals_nocase(v0, "<PT") ^ 1;
}

void process_dash(int a1, int a2)
{
  if (nLangIDGlb == 10 || nLangIDGlb == 12)
  {
    if (nLangIDGlb == 10 && qword_99A18 != 2)
    {
      uint64_t v6 = qword_99A00;
      *(_BYTE *)qword_99A00 = 32;
      qword_99A00 = v6 + 1;
    }
  }

  else if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
  {
    remove_whitespace(1);
  }

  if (*(_BYTE *)qword_99A38
    && (*(unsigned __int8 *)(qword_99A38 + 1) - 150 < 2 || *(_BYTE *)(qword_99A38 + 1) == 45))
  {
    ++qword_99A38;
  }

  if (a1 == 151
    || (nLangIDGlb == 9 ? (BOOL v8 = nSubLangIDGlb == 2) : (BOOL v8 = 1),
        v8 || (uint64_t v9 = 16LL, (byte_999E8 & 1) == 0) && (lFlags & 0x40000000) != 0))
  {
    uint64_t v9 = 4LL;
  }

  add_seg(v9);
  uint64_t v10 = qword_99A00;
  if (nLangIDGlb == 7) {
    char v11 = -105;
  }
  else {
    char v11 = a1;
  }
  *(_BYTE *)qword_99A00 = v11;
  qword_99A00 = v10 + 1;
  if (a2)
  {
    add_seg(4LL);
    uint64_t v12 = qword_99A00;
    *(_BYTE *)qword_99A00 = a1;
    qword_99A00 = v12 + 1;
  }

  int v13 = nLangIDGlb;
  BOOL v15 = nLangIDGlb == 7 || nLangIDGlb == 10;
  if (a1 == 151 && v15)
  {
    unsigned int v16 = *(unsigned __int8 *)(qword_99A38 + 1);
    if (v16 >= 0x21
      && v16 != 160
      && !memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *(unsigned __int8 *)(qword_99A38 + 1), 0x15uLL)
      && !memchr("({[<\x91", v16, 6uLL)
      && !memchr(")}]>\x9B", v16, 6uLL)
      && !memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v16, 0xDuLL))
    {
      add_seg(2LL);
      uint64_t v17 = qword_99A00;
      *(_BYTE *)qword_99A00 = 32;
      qword_99A00 = v17 + 1;
      return;
    }
  }

  if (v13 == 12)
  {
LABEL_53:
    if (a1 == 151) {
      return;
    }
LABEL_57:
    if (v13 == 9 && nSubLangIDGlb == 3) {
      return;
    }
LABEL_60:
    skip_whitespace(1);
    return;
  }

  if (v13 == 7)
  {
    goto LABEL_53;
  }

  if (a1 != 151 || v13 != 10) {
    goto LABEL_57;
  }
}

void process_quotes(char a1, int a2, char a3)
{
  char v3 = a3;
  char v4 = a2;
  char v5 = a1;
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
  {
    int v7 = *(unsigned __int8 *)qword_99A38;
    if (a2 == 39) {
      char v8 = 39;
    }
    else {
      char v8 = 34;
    }
    if (v7 == 34) {
      char v5 = 30;
    }
    else {
      char v5 = a1;
    }
    if (v7 == 34) {
      char v4 = v8;
    }
    else {
      char v4 = a2;
    }
    if (v7 == 34) {
      char v3 = 31;
    }
    else {
      char v3 = a3;
    }
  }

  add_seg(4LL);
  uint64_t v9 = qword_99A38;
  unsigned __int8 v10 = *(_BYTE *)qword_99A38;
  uint64_t v11 = qword_99A28;
  BOOL v12 = *(_BYTE *)qword_99A38 != 34 || (qword_99A28 | 2) == 2;
  if (v12 || (int v18 = *(unsigned __int8 *)(qword_99A38 + 1), v18 != 59) && v18 != 44 || *(_BYTE *)(qword_99A38 + 2) != 34)
  {
    if ((qword_99A28 & 0xFFFFFFFFFFFFFFFDLL) == 0) {
      goto LABEL_42;
    }
    int v14 = (unsigned __int8 *)(qword_99A38 + 1);
    int v13 = *(unsigned __int8 *)(qword_99A38 + 1);
    if (!in(*(unsigned __int8 *)(qword_99A38 + 1), 9) && !is_number((unsigned __int8 *)(v9 + 1)))
    {
      BOOL v15 = "..";
      while (1)
      {
        do
          int v16 = *v14++;
        while (v16 == 173 || v16 == 30);
        if (++v15 == "") {
          goto LABEL_42;
        }
      }

      if (v13 == v10 && v11 != 4)
      {
LABEL_42:
        if (!v11) {
          goto LABEL_45;
        }
        goto LABEL_43;
      }

      if (v13 && memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v13, 0xDuLL))
      {
        uint64_t v23 = (unsigned __int8 *)(v9 + 2);
        uint64_t v24 = "..";
        while (1)
        {
          do
            int v25 = *v23++;
          while (v25 == 173 || v25 == 30);
          if (++v24 == "") {
            goto LABEL_42;
          }
        }
      }

      if (!v11)
      {
        uint64_t v22 = (char *)qword_99A00;
LABEL_67:
        *uint64_t v22 = v3;
        goto LABEL_47;
      }

      if (!*(_BYTE *)(v9 - 1) || !memchr("({[<\x91", *(unsigned __int8 *)(v9 - 1), 6uLL))
      {
        uint64_t v22 = (char *)qword_99A00;
        int v27 = *(unsigned __int8 *)(qword_99A00 - 1);
        if (v27 != 145 && v27 != 171) {
          goto LABEL_67;
        }
      }
    }

LABEL_43:
    unsigned __int8 v21 = *(_BYTE *)(v9 - 1);
LABEL_46:
    uint64_t v22 = (char *)qword_99A00;
    *(_BYTE *)qword_99A00 = v4;
    goto LABEL_47;
  }

  uint64_t v19 = qword_99A00;
  *(_BYTE *)qword_99A00 = v3;
  qword_99A00 = v19 + 1;
  ++qword_99A38;
  add_seg(4LL);
  uint64_t v20 = qword_99A00;
  *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
  qword_99A00 = v20 + 1;
  ++qword_99A38;
  add_seg(4LL);
LABEL_45:
  uint64_t v22 = (char *)qword_99A00;
  *(_BYTE *)qword_99A00 = v5;
LABEL_47:
  qword_99A00 = (uint64_t)(v22 + 1);
}

            if (v8 == 12) {
              goto LABEL_51;
            }
LABEL_47:
            if (v8 == 9 && nSubLangIDGlb == 3 && (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
LABEL_51:
              int v14 = upper_digit(*(_BYTE *)qword_99A38);
              BOOL v15 = qword_99A00;
              *(_BYTE *)qword_99A00 = v14;
              goto LABEL_56;
            }

void process_supersub()
{
  int v0 = 0;
  int v1 = *(unsigned __int8 *)(qword_99A00 - 1);
  BOOL v9 = v1 == 51;
  BOOL v2 = v1 != 51;
  uint64_t v3 = 16LL;
  if (!v9) {
    uint64_t v3 = 128LL;
  }
  qword_99A18 = v3;
  while (1)
  {
    if (is_supersub())
    {
      uint64_t v4 = qword_99A38;
      goto LABEL_8;
    }

    if (v0 < 1) {
      break;
    }
    uint64_t v4 = qword_99A38;
    if (!*(_BYTE *)(qword_99A38 + 1)) {
      break;
    }
LABEL_8:
    char v5 = (unsigned __int8 *)(v4 + 1);
    qword_99A38 = v4 + 1;
    if (*(_BYTE *)(v4 + 1) == 30)
    {
      qword_999F8 = qword_99A00 - qword_99A20 + 1;
      char v5 = (unsigned __int8 *)(v4 + 2);
      qword_99A38 = v4 + 2;
    }

    if (!v2 || nLangIDGlb != 7)
    {
      uint64_t v7 = *v5;
      if (!*v5)
      {
LABEL_40:
        if (in(0LL, 25)) {
          goto LABEL_59;
        }
LABEL_41:
        uint64_t v12 = 32LL;
        goto LABEL_42;
      }

      goto LABEL_20;
    }

    if (((unint64_t)qword_99A28 < 3 || (qword_99A28 & 0x1E024) != 0) && (lFlags & 1) == 0)
    {
      uint64_t v6 = (_BYTE *)qword_99A00;
      if (qword_99A00 - qword_99A20 == 1 && !is_mathematics())
      {
        *uint64_t v6 = *(v6 - 1);
        qword_99A00 = (uint64_t)(v6 + 1);
        *(v6 - 1) = stru_B8.segname[(void)pLangGlb + 3];
        char v5 = (unsigned __int8 *)qword_99A38;
      }
    }

    uint64_t v7 = *v5;
    if ((_DWORD)v7 == 45)
    {
      if (is_decimal_number(v5 + 1)) {
        add_seg(32LL);
      }
      uint64_t v23 = qword_99A00;
      *(_BYTE *)qword_99A00 = -106;
      qword_99A00 = v23 + 1;
      BOOL v2 = 1;
    }

    else
    {
      if (!*v5) {
        goto LABEL_40;
      }
LABEL_20:
      if ((v7 - 58) < 0xF6u)
      {
        if (in(v7, 25) || memchr("\xB9\xB2\xB3\xBC\xBD\xBE", v7, 7uLL))
        {
LABEL_59:
          add_seg(16LL);
          int v19 = *(unsigned __int8 *)qword_99A38;
          uint64_t v20 = qword_99A00;
          BOOL v2 = 0;
          if (v19 == 45) {
            LOBYTE(v19) = -106;
          }
          *(_BYTE *)qword_99A00 = v19;
          qword_99A00 = v20 + 1;
        }

        else
        {
          if ((int)v7 <= 122)
          {
            if ((_DWORD)v7 == 60 || (_DWORD)v7 == 62) {
              goto LABEL_59;
            }
            goto LABEL_75;
          }

          if ((_DWORD)v7 == 123)
          {
            BOOL v2 = 0;
            ++v0;
          }

          else if ((_DWORD)v7 == 125)
          {
            BOOL v2 = 0;
            --v0;
          }

          else
          {
LABEL_75:
            if (memchr("({[<\x91", v7, 6uLL))
            {
              add_seg(16LL);
              BOOL v2 = 0;
              uint64_t v24 = qword_99A00;
              *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
              qword_99A00 = v24 + 1;
              ++v0;
            }

            else if (memchr(")}]>\x9B", v7, 6uLL))
            {
              add_seg(16LL);
              BOOL v2 = 0;
              uint64_t v25 = qword_99A00;
              *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
              qword_99A00 = v25 + 1;
              --v0;
            }

            else
            {
              if ((_DWORD)v7 != 9 && (_DWORD)v7 != 160 && (_DWORD)v7 != 32) {
                goto LABEL_41;
              }
              uint64_t v12 = 0LL;
LABEL_42:
              add_seg(v12);
              BOOL v2 = 0;
              uint64_t v13 = qword_99A00;
              *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
              qword_99A00 = v13 + 1;
            }
          }
        }
      }

      else
      {
        if (qword_99A18 != 128) {
          add_seg(64LL);
        }
        int v8 = nLangIDGlb;
        if (nLangIDGlb != 7)
        {
          BOOL v9 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
          BOOL v10 = v9;
          if (nLangIDGlb != 10 && !v10) {
            goto LABEL_43;
          }
        }

        if (v2 || qword_99A00 == qword_99A20)
        {
          if (is_lower_num((unsigned __int8 *)qword_99A38))
          {
            BOOL v2 = 0;
            qword_99A18 = 128LL;
          }

          else
          {
            int v8 = nLangIDGlb;
            if (nLangIDGlb == 7)
            {
              if (v2)
              {
                if (qword_99A18 != 64)
                {
                  add_seg(0LL);
                  uint64_t v11 = qword_99A00;
                  *(_BYTE *)qword_99A00 = 32;
                  qword_99A00 = v11 + 1;
                }
              }

              goto LABEL_62;
            }

uint64_t wh_forward_translate(char *__src, char *__dst, size_t __size, _DWORD *a4)
{
  uint64_t v4 = a4;
  int v5 = __size;
  uint64_t v7 = __src;
  if (a4) {
    *a4 = 0;
  }
  if (!__src) {
    return 87LL;
  }
  if (*__src == 123)
  {
    int v8 = matching_brace_pos((unsigned __int8 *)__src);
    if (v8 > (unsigned __int8 *)v7)
    {
      BOOL v9 = v8;
      while (1)
      {
        if (*v9 != 125) {
          goto LABEL_12;
        }
        brl_process_command((unsigned __int8 *)v7 + 1);
        int v12 = v9[1];
        uint64_t v11 = v9 + 1;
        int v10 = v12;
        uint64_t v7 = (char *)v11;
        if (v12 != 123) {
          break;
        }
        uint64_t v13 = matching_brace_pos(v11);
        BOOL v23 = v13 > v11;
        BOOL v9 = v13;
        if (!v23) {
          goto LABEL_12;
        }
      }

      if (!v10) {
        return 0LL;
      }
    }
  }

LABEL_12:
  if (!__dst) {
    return 87LL;
  }
  uint64_t result = 87LL;
  uint64_t v15 = (v5 - 1);
  if (v5 < 1 || v7 == __dst) {
    return result;
  }
  *__dst = 0;
  if (!*v7) {
    return 0LL;
  }
  bMemoryOverflow = 0;
  qword_99A38 = (uint64_t)v7;
  char v16 = *v7;
  if (*v7)
  {
    uint64_t v17 = 0LL;
    char v18 = (unsigned __int8 *)(v7 + 1);
    unsigned __int8 v19 = 32;
    while (1)
    {
      if (v19 == 32 && v16 >= 0x21u)
      {
        unsigned __int8 v19 = v16;
        unsigned __int8 v19 = 0;
      }

      else if (v19 >= 0x21u)
      {
LABEL_23:
        if (v16 == v19) {
          ++v17;
        }
        else {
          unsigned __int8 v19 = 0;
        }
      }

      qword_99A38 = (uint64_t)v18;
      int v20 = *v18++;
      char v16 = v20;
      if (!v20)
      {
        char v21 = (char *)(v18 - 1);
        goto LABEL_31;
      }
    }
  }

  uint64_t v17 = 0LL;
  unsigned __int8 v19 = 32;
  char v21 = v7;
LABEL_31:
  uint64_t v22 = v21 - v7;
  BOOL v23 = v17 > 3 && v19 > 0x20u;
  if (v23 || b8DotBraille)
  {
    if (v4)
    {
      if (v22 >= 1)
      {
        for (uint64_t i = 0LL; i != v22; ++i)
          v4[i] = i;
      }

      v4[v22] = v22 - 1;
    }

    strcpy(__dst, v7);
    return 0LL;
  }

  qword_99A40 = (uint64_t)v7;
  qword_99A10 = (uint64_t)__dst;
  qword_99A08 = (uint64_t)&__dst[v15];
  __dst[v15] = 0;
  pExcMapGlb = &brl_set_classmap;
  uint64_t v24 = malloc(v5);
  qword_99A88 = (uint64_t)v24;
  if (!v24) {
    return 8LL;
  }
  *uint64_t v24 = 0;
  v24[v15] = 0;
  uint64_t v25 = (unsigned __int8 **)&unk_99000;
  qword_99A20 = (uint64_t)(v24 + 1);
  qword_99A00 = (uint64_t)(v24 + 1);
  qword_99A78 = 0LL;
  qword_99A30 = 0LL;
  qword_99A48 = 0LL;
  byte_999E8 = 0;
  dword_99A80 = 0;
  byte_99A90 = 0;
  dword_999F0 = 0;
  byte_99A58 = 0;
  byte_99A54 = 0;
  byte_999EC = 0;
  byte_99A50 = v4 != 0LL;
  unint64_t v26 = lFlags;
  if (nLangIDGlb == 10)
  {
    unint64_t v27 = 0LL;
    unint64_t v26 = lFlags & 0xFFFFFFFFFBFFFFFFLL;
    lFlags &= ~0x4000000uLL;
  }

  else
  {
    unint64_t v27 = ((unint64_t)lFlags >> 15) & 0x800;
  }

  unsigned int v29 = &unk_99000;
  qword_99A18 = v27;
  qword_99A28 = 0LL;
  qword_999F8 = 0LL;
  if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && (v26 & 0x40000000) == 0) {
    lFlags = v26 & 0xFFFFFFFFF7FFFFFFLL;
  }
  qword_99A38 = (uint64_t)v7;
  unsigned __int8 v30 = *v7;
  if (*v7)
  {
    while (2)
    {
      unint64_t v31 = qword_99A18;
      if (qword_99A18 == 2048)
      {
        int v32 = lFlags;
        if ((lFlags & 0x4000000) != 0) {
          goto LABEL_108;
        }
        if (dword_99A80)
        {
          uint64_t v33 = v7;
          uint64_t v34 = "'.";
          while (1)
          {
            do
              int v35 = *v33++;
            while (v35 == 173 || v35 == 30);
            if (++v34 == "") {
              goto LABEL_64;
            }
          }

          int v50 = v30;
          if (v30 != 30) {
            goto LABEL_116;
          }
LABEL_144:
          qword_999F8 = qword_99A00 - (void)v25[324] + 1;
          goto LABEL_1645;
        }

LABEL_64:
        if (v30 >= 0x21u && v30 != 160)
        {
          uint64_t v37 = memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v30, 0x15uLL);
          unsigned int v29 = (void *)&unk_99000;
          if (!v37)
          {
            uint64_t v38 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v30, 0xDuLL);
            unsigned int v29 = (void *)&unk_99000;
            if (!v38)
            {
              uint64_t v39 = memchr("({[<\x91", v30, 6uLL);
              unsigned int v29 = (void *)&unk_99000;
              if (!v39)
              {
                uint64_t v40 = memchr(")}]>\x9B", v30, 6uLL);
                unsigned int v29 = (void *)&unk_99000;
                if (!v40) {
                  goto LABEL_108;
                }
              }
            }
          }

          unsigned int v41 = v7[1];
          if (v41 >= 0x21 && v41 != 160)
          {
            BOOL v42 = memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v7[1], 0x15uLL);
            unsigned int v29 = (void *)&unk_99000;
            if (!v42)
            {
              uint64_t v43 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v41, 0xDuLL);
              unsigned int v29 = &unk_99000;
              if (!v43)
              {
LABEL_108:
                int v50 = v30;
                if (v30 == 30) {
                  goto LABEL_1645;
                }
LABEL_116:
                if (v50 == 173 && (v32 & 0x20000000) == 0) {
                  goto LABEL_1645;
                }
                uint64_t v52 = qword_99A00;
                *(_BYTE *)qword_99A00 = v30;
                qword_99A00 = v52 + 1;
                int v53 = *(unsigned __int8 *)v29[327];
                if (v53 != 9 && v53 != 160 && v53 != 32) {
                  goto LABEL_1645;
                }
LABEL_121:
                add_whitespace();
LABEL_1644:
                unsigned int v29 = &unk_99000;
                goto LABEL_1645;
              }
            }
          }
        }
      }

      switch(v30)
      {
        case 0x1Bu:
          int v173 = v7[1];
          BOOL v172 = v7 + 1;
          if (!v173) {
            goto LABEL_1645;
          }
          v29[327] = v172;
          int v174 = *v172;
          if (v174 == 51) {
            goto LABEL_973;
          }
          if (v174 != 52) {
            goto LABEL_1645;
          }
LABEL_469:
          add_seg(4096LL);
          uint64_t v175 = qword_99A28;
          if (nLangIDGlb == 7 && qword_99A28 == 0x2000)
          {
            uint64_t v176 = qword_99A00;
            *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
            qword_99A00 = v176 + 1;
          }

          unsigned int v29 = &unk_99000;
          uint64_t v177 = qword_99A38;
          if (*(_BYTE *)qword_99A38)
          {
            uint64_t v178 = (_BYTE *)(qword_99A38 + 1);
            do
            {
              if (*v178 != 127) {
                break;
              }
              qword_99A38 = (uint64_t)v178;
            }

            while (*v178++);
            uint64_t v177 = (uint64_t)(v178 - 1);
          }

          v332 = "'.";
          uint64_t v333 = v177;
          while (1)
          {
            do
            {
              int v335 = *(unsigned __int8 *)++v333;
              int v334 = v335;
            }

            while (v335 == 173 || v334 == 30);
            if (++v332 == "")
            {
              qword_99A18 = 0LL;
LABEL_874:
              v337 = (unsigned __int8 *)(v177 + 3);
              v177 += 2LL;
              qword_99A38 = v177;
              v338 = "'.";
              while (1)
              {
                do
                  int v339 = *v337++;
                while (v339 == 173 || v339 == 30);
                if (++v338 == "") {
                  goto LABEL_874;
                }
              }
            }
          }

LABEL_882:
          if (nLangIDGlb != 12 || v175 == 0x2000)
          {
            char v342 = **(_BYTE **)&stru_68.segname[(void)pLangGlb + 8];
            v341 = (char *)qword_99A00;
          }

          else
          {
            v341 = (char *)qword_99A00;
            char v342 = 58;
          }

          char *v341 = v342;
          qword_99A00 = (uint64_t)(v341 + 1);
          BOOL v343 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
          if (v343 && v175 == 0x2000) {
            char v344 = 44;
          }
          else {
            char v344 = **(_BYTE **)&stru_68.segname[(void)pLangGlb + 8];
          }
          v341[1] = v344;
          qword_99A00 = (uint64_t)(v341 + 2);
          goto LABEL_1645;
        case 0x1Eu:
          goto LABEL_144;
        case 0x1Fu:
        case 0xADu:
          goto LABEL_1645;
        case 0x20u:
          BOOL v181 = v31 == 64 && (lFlags & 0x10000) == 0;
          if (!v181
            || (*(v7 - 1) | 2) == 0x2E
            || v7[1] - 58 < 0xFFFFFFF6)
          {
            goto LABEL_1436;
          }

          uint64_t v182 = qword_99A40;
          int v183 = *v25[324];
          unsigned __int8 v1041 = upper_digit(0x30u);
          BOOL v184 = v183 == v1041;
          unint64_t v185 = is_figure(0, (unsigned __int8 *)v7 - 1, v182, v184);
          unint64_t v186 = is_figure(1, (unsigned __int8 *)v7 + 1, v182, v184);
          if (v185 <= v186)
          {
            if (v186 >= 2) {
              goto LABEL_1431;
            }
          }

          else if (v186 >= 2 && v185 + ~v186 < 2)
          {
LABEL_1431:
            if (v186 < 5 || v183 == v1041 && is_figure(1, (unsigned __int8 *)v7 + 1, v182, 0) >= 4)
            {
              char separator = get_separator(1);
              uint64_t v529 = qword_99A00;
              uint64_t v530 = qword_99A00;
              *(_BYTE *)qword_99A00 = separator;
              qword_99A00 = v530 + 1;
              unsigned int v29 = (void *)&unk_99000;
              if (byte_99A50 != 1) {
                goto LABEL_1645;
              }
              *(_BYTE *)(v529 + 1) = 31;
              uint64_t v368 = v529 + 2;
              v366 = (void *)&unk_99000;
LABEL_969:
              v366[320] = v368;
              goto LABEL_1645;
            }
          }

LABEL_1436:
          if (byte_999EC == 1) {
            goto LABEL_1437;
          }
          if (nLangIDGlb != 7
            || (v31 & 0xC0) == 0
            && (byte_999E8 != 1 || (v31 & 0x2000) == 0 || dword_99A68 || qword_99A00 - (uint64_t)v25[324] > 4)
            || !is_measurement((unsigned __int8 *)v7 + 1, 1, 1)
            && ((uint64_t v7 = (char *)qword_99A38, v532 = *(unsigned __int8 *)(qword_99A38 + 1), v532 - 137 > 0x3C)
             || ((1LL << (v532 + 119)) & 0x1000108000000001LL) == 0)
            && (!*(_BYTE *)(qword_99A38 + 1)
             || v532 != 37
             && !memchr("\x80$\xA5\xA2\xA3\xA4", *(unsigned __int8 *)(qword_99A38 + 1), 7uLL)
             && (v532 <= 0xDE && v532 - 123 < 0xFFFFFFE6
              || (char v655 = v7[2]) == 0
              || (v655 + 33) <= 0xE0u && (v655 - 91) < 0xE6u)))
          {
            char v656 = qword_99A18;
            if (qword_99A18 == 32)
            {
              if (*(v7 - 1) != 46) {
                goto LABEL_1437;
              }
LABEL_1858:
              int v657 = v7[1];
              if (v7[1])
              {
                if (memchr(",;:!?", v7[1], 6uLL))
                {
                  if (v657 == 63) {
                    goto LABEL_1867;
                  }
                }

                else if (v657 != 46)
                {
                  goto LABEL_1867;
                }

                if ((byte_999E8 & 1) == 0 && v7[2] <= 0x20u)
                {
                  if (byte_99A50 == 1)
                  {
                    add_seg(32LL);
                    v292 = (char *)qword_99A00;
                    char v293 = 31;
                  }

                  else
                  {
                    add_seg(0LL);
LABEL_1890:
                    v292 = (char *)qword_99A00;
                    char v293 = 32;
                  }

                  goto LABEL_1419;
                }
              }
            }

            else if (qword_99A18 == 0x2000)
            {
              goto LABEL_1858;
            }

LABEL_1867:
            if ((v656 & 0xC0) == 0) {
              goto LABEL_1437;
            }
            unsigned int v658 = v7[1];
            if (v658 > 0x88)
            {
              if (v658 != 176 && v658 != 137) {
                goto LABEL_1876;
              }
            }

            else
            {
              if (!v7[1]) {
                goto LABEL_1437;
              }
              if (v658 != 37)
              {
LABEL_1876:
                if ((lFlags & 0x8000000) != 0
                  || v658 != 42
                  && (!memchr("+-=", v7[1], 4uLL)
                   || is_number((unsigned __int8 *)v7 + 1)
                   || !is_number((unsigned __int8 *)v7 + 2)
                   && (v658 == 45 && !strchr(v7 + 2, 61) || v7[2] != 32 || !is_number((unsigned __int8 *)v7 + 3))))
                {
LABEL_1437:
                  add_seg(2LL);
                  uint64_t v531 = qword_99A00;
                  *(_BYTE *)qword_99A00 = 32;
                  qword_99A00 = v531 + 1;
                  goto LABEL_121;
                }

                goto LABEL_1878;
              }
            }

            if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
              goto LABEL_1876;
            }
LABEL_1878:
            if (byte_99A50 == 1)
            {
              add_seg(2LL);
              uint64_t v659 = qword_99A00;
              *(_BYTE *)qword_99A00 = 31;
              qword_99A00 = v659 + 1;
            }

            unsigned int v29 = &unk_99000;
            if (byte_999E8 != 1) {
              goto LABEL_1645;
            }
            if (nLangIDGlb != 7) {
              goto LABEL_1645;
            }
            int v660 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (v660 != 37 && v660 != 176 && v660 != 137) {
              goto LABEL_1645;
            }
LABEL_457:
            add_seg(2LL);
            unsigned int v29 = (void *)&unk_99000;
            BOOL v160 = (char *)qword_99A00;
            char v161 = 127;
            goto LABEL_1463;
          }

          add_seg(2LL);
          if (byte_999E8 == 1)
          {
            v533 = (char *)qword_99A00;
            if (byte_99A50 == 1)
            {
              *(_BYTE *)qword_99A00 = 31;
              ++v533;
            }

            char v534 = 127;
            goto LABEL_1450;
          }

          if ((lFlags & 0x8000000) != 0)
          {
            int v535 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (v535 != 37 && v535 != 137 && v535 != 176) {
              goto LABEL_1890;
            }
          }

          unsigned int v29 = (void *)&unk_99000;
          if (byte_99A50 == 1)
          {
            BOOL v160 = (char *)qword_99A00;
            char v161 = 31;
LABEL_1463:
            *BOOL v160 = v161;
            qword_99A00 = (uint64_t)(v160 + 1);
            goto LABEL_1645;
          }

          goto LABEL_1645;
        case 0x21u:
        case 0x28u:
        case 0x29u:
        case 0x3Bu:
        case 0x3Fu:
        case 0xA9u:
        case 0xAEu:
          if (v30 == 63 || v30 == 40)
          {
            size_t v60 = (void *)&unk_99000;
            if (byte_999E8 == 1)
            {
              if (v30 != 40) {
LABEL_303:
              }
                remove_whitespace(0);
              if (nLangIDGlb == 7
                && (qword_99A18 & 0xC0) != 0
                && *(_BYTE *)qword_99A38 == 40
                && *(unsigned __int8 *)(qword_99A38 + 1) - 58 >= 0xFFFFFFF6)
              {
                uint64_t v118 = (unsigned __int8 *)v60[320];
                v385 = v118;
                while (v385 > v25[324])
                {
                  int v386 = *--v385;
                  if (v386 == stru_B8.segname[(void)pLangGlb + 1])
                  {
                    *uint64_t v118 = 50;
                    unsigned int v29 = (void *)&unk_99000;
                    goto LABEL_309;
                  }
                }
              }

              add_seg(16LL);
              unsigned int v29 = &unk_99000;
              uint64_t v118 = (unsigned __int8 *)v60[320];
              *uint64_t v118 = *(_BYTE *)qword_99A38;
LABEL_309:
              v60[320] = v118 + 1;
              if (*(_BYTE *)v29[327] != 41) {
                goto LABEL_1642;
              }
              goto LABEL_1645;
            }
          }

          else if (v30 == 33)
          {
            size_t v60 = &unk_99000;
            if (v7[1] == 44)
            {
              if (v31 < 3
                || (int v73 = *(v7 - 1), *(v7 - 1))
                && (memchr("({[<\x91", *(v7 - 1), 6uLL)
                 || (uint64_t v74 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v73, 0xDuLL),
                     unsigned int v29 = (void *)&unk_99000,
                     v74)))
              {
                add_seg(32LL);
                open_math_passage();
                unsigned int v29 = &unk_99000;
                goto LABEL_183;
              }
            }
          }

          else
          {
            size_t v60 = &unk_99000;
            if (v30 == 41 && (byte_999E8 & 1) != 0) {
              goto LABEL_303;
            }
          }

          BOOL v120 = nLangIDGlb == 9 && nSubLangIDGlb != 3;
          if (nLangIDGlb != 12 && !v120) {
            goto LABEL_319;
          }
          if (v30 == 40)
          {
            if (v31 == 0x2000 && dword_999F0) {
              goto LABEL_671;
            }
            goto LABEL_1115;
          }

          if (v30 == 41 && v31 == 0x2000 && dword_999F0)
          {
LABEL_671:
            unsigned int v265 = v7[1];
            if (v7[1])
            {
              if ((v265 + 33) > 0xE0u || (v265 - 91) >= 0xE6u)
              {
                v362 = (_BYTE *)v60[320];
                _BYTE *v362 = **(_BYTE **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * v30);
                v60[320] = v362 + 1;
                goto LABEL_1644;
              }

              if (v265 > 0xDE || (v265 - 123) >= 0xE6u)
              {
                v266 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
                v267 = (_BYTE *)v60[320];
                char v270 = *v266;
                v268 = v266 + 1;
                char v269 = v270;
                do
                {
                  *v267++ = v269;
                  int v271 = *v268++;
                  char v269 = v271;
                }

                while (v271);
                v60[320] = v267;
                dword_999F0 = 0;
              }
            }

            add_seg(32LL);
            unsigned int v29 = &unk_99000;
            goto LABEL_1121;
          }

LABEL_319:
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            goto LABEL_1115;
          }

          if (nLangIDGlb != 7)
          {
LABEL_1115:
            add_seg(8LL);
            unsigned int v29 = &unk_99000;
            int v428 = *(unsigned __int8 *)qword_99A38;
            v429 = (_BYTE *)v60[320];
            v430 = v429 + 1;
            if (nLangIDGlb == 10 && v428 == 33) {
              LOBYTE(v428) = -95;
            }
            _BYTE *v429 = v428;
            goto LABEL_1123;
          }

          if (v30 == 63 && v31 == 0x2000)
          {
            if (dword_99A68 > 1) {
              goto LABEL_396;
            }
            int v361 = *(v7 - 1);
            if (!*(v7 - 1)) {
              goto LABEL_1109;
            }
            if ((v361 + 33) > 0xE0u || (v361 - 91) >= 0xE6u)
            {
              char v426 = v7[1];
              if (v426)
              {
                unsigned int v29 = (void *)&unk_99000;
                if ((v426 + 33) > 0xE0u || (v426 - 91) >= 0xE6u)
                {
LABEL_396:
                  ++dword_99A68;
                  uint64_t v71 = (char *)v60[320];
                  char v72 = 63;
                  goto LABEL_386;
                }
              }
            }
          }

          else
          {
            if (v30 != 63) {
              goto LABEL_1109;
            }
            if (v31 < 3)
            {
LABEL_1104:
              int v427 = v7[1];
              if (v427 == 63 || v427 == 32)
              {
                add_seg(16LL);
                unsigned int v29 = &unk_99000;
                if ((unint64_t)qword_99A18 <= 2 && *(_BYTE *)(qword_99A38 + 1) == 63)
                {
                  uint64_t v71 = (char *)v60[320];
                  char v72 = 33;
                }

                else
                {
                  uint64_t v71 = (char *)v60[320];
                  char v72 = 126;
                }

LABEL_386:
                *uint64_t v71 = v72;
                v78 = v71 + 1;
LABEL_387:
                v60[320] = v78;
                goto LABEL_1645;
              }

              goto LABEL_1109;
            }

            int v361 = *(v7 - 1);
          }

          if (v361 == 63) {
            goto LABEL_1104;
          }
LABEL_1109:
          if ((byte_999E8 & 1) != 0) {
            goto LABEL_1120;
          }
          if ((v31 & 0xC) != 0 && memchr("!?", (char)v30, 3uLL) && v7[1] >= 0x21u)
          {
            if (v31 == 16 || (lFlags & 0x40) == 0)
            {
LABEL_1120:
              add_seg(32LL);
              v431 = (_BYTE *)v60[320];
              _BYTE *v431 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
              v60[320] = v431 + 1;
              add_seg(8LL);
              unsigned int v29 = &unk_99000;
              uint64_t v138 = qword_99A38;
LABEL_1121:
              LOBYTE(v138) = *(_BYTE *)v138;
              goto LABEL_1122;
            }
          }

          else if (v31 == 16)
          {
            goto LABEL_1120;
          }

          goto LABEL_1115;
        case 0x22u:
        case 0xABu:
        case 0xBBu:
          char v99 = -85;
          int v100 = 34;
          char v101 = -69;
          goto LABEL_862;
        case 0x23u:
          if (nLangIDGlb != 7)
          {
            if (nLangIDGlb != 9 || !number_follows(1)) {
              goto LABEL_1417;
            }
            if (nSubLangIDGlb == 3)
            {
              add_seg(4LL);
              v196 = (char *)qword_99A00;
              char v197 = 35;
              goto LABEL_516;
            }

            if (nSubLangIDGlb != 1)
            {
              add_seg(32LL);
              v196 = (char *)qword_99A00;
              char v197 = 34;
              goto LABEL_516;
            }

            if ((lFlags & 0x80000) != 0)
            {
              add_seg(2LL);
              uint64_t v188 = qword_99A00;
              *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.filesize + (void)pLangGlb);
              qword_99A00 = v188 + 1;
            }

            add_seg(32LL);
            uint64_t v189 = 0LL;
            uint64_t v190 = qword_99A00;
            char v191 = 110;
            do
            {
              *(_BYTE *)(v190 + v189) = v191;
              char v191 = aNo_0[++v189];
            }

            while (v189 != 3);
            v192 = (_BYTE *)(v190 + 3);
LABEL_623:
            qword_99A00 = (uint64_t)v192;
            goto LABEL_1644;
          }

          if (is_mathematics()
            || (int v357 = v7[1], in(v7[1], 25))
            || v357 == 32 && in(v7[2], 25)
            || (uint64_t v524 = (uint64_t)&v7[-qword_99A40], (unint64_t)v7 > qword_99A40)
            && in(*(v7 - 1), 25)
            || v524 >= 2 && *(v7 - 1) == 32 && in(*(v7 - 2), 25))
          {
            remove_whitespace(0);
          }

          else if ((v357 | 2) != 0x2E && (lFlags & 2) == 0)
          {
LABEL_1417:
            uint64_t v358 = 4LL;
            goto LABEL_1418;
          }

          uint64_t v358 = 32LL;
LABEL_1418:
          add_seg(v358);
          v292 = (char *)qword_99A00;
          char v293 = 35;
          goto LABEL_1419;
        case 0x24u:
          if (v7[1] == 36 && v7[2] >= 0x21u && (lFlags & 0x5000000) == 0)
          {
            add_seg(2048LL);
            unsigned int v29 = &unk_99000;
            uint64_t v453 = qword_99A00;
            *(_BYTE *)qword_99A00 = 36;
            qword_99A00 = v453 + 1;
            ++qword_99A38;
            dword_99A80 = 1;
            goto LABEL_1645;
          }

          if ((v31 & 0xC0) != 0 && byte_999E8 != 0 && nLangIDGlb == 7)
          {
            add_seg(2LL);
            uint64_t v195 = qword_99A00;
            *(_BYTE *)qword_99A00 = 127;
            qword_99A00 = v195 + 1;
          }

          add_seg(4LL);
          v196 = (char *)qword_99A00;
          char v197 = 36;
LABEL_516:
          char *v196 = v197;
          v192 = v196 + 1;
          goto LABEL_623;
        case 0x25u:
        case 0x89u:
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2)
          {
            v108 = (void *)&unk_99000;
            if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            {
              uint64_t v168 = 16LL;
LABEL_705:
              add_seg(v168);
              unsigned int v29 = &unk_99000;
              char v113 = *(_BYTE *)qword_99A38;
              uint64_t v112 = (char *)v108[320];
              goto LABEL_706;
            }

LABEL_704:
            uint64_t v168 = 4LL;
            goto LABEL_705;
          }

          if (nLangIDGlb != 12)
          {
            if ((v31 & 0xC0) != 0 && nLangIDGlb == 7) {
              int v280 = byte_999E8;
            }
            else {
              int v280 = 0;
            }
            v108 = &unk_99000;
            if (v280 == 1)
            {
              add_seg(2LL);
              uint64_t v281 = qword_99A00;
              *(_BYTE *)qword_99A00 = 127;
              qword_99A00 = v281 + 1;
            }

            goto LABEL_704;
          }

          if ((lFlags & 0x40000000) != 0) {
            int v107 = byte_999E8;
          }
          else {
            int v107 = 1;
          }
          v108 = &unk_99000;
          if (v107 != 1) {
            goto LABEL_704;
          }
          add_seg(32LL);
          uint64_t v109 = 0LL;
          uint64_t v110 = qword_99A00;
          char v111 = 39;
          do
          {
            *(_BYTE *)(v110 + v109) = v111;
            char v111 = asc_2612F[++v109];
          }

          while (v109 != 4);
          uint64_t v112 = (char *)(v110 + 4);
          qword_99A00 = v110 + 4;
          unsigned int v29 = &unk_99000;
          if (*(unsigned __int8 *)qword_99A38 == 137)
          {
            char v113 = 35;
LABEL_706:
            *uint64_t v112 = v113;
            v108[320] = v112 + 1;
          }

          if (*(_BYTE *)(qword_99A38 + 1) != 32) {
            goto LABEL_1645;
          }
          BOOL v117 = in(*(unsigned __int8 *)(qword_99A38 + 2), 25);
          goto LABEL_1641;
        case 0x27u:
          unsigned int v198 = v7[1];
          if (v198 == 46 && byte_99A54 != 0)
          {
            if (nSubLangIDGlb == 3 && nLangIDGlb == 9 || nLangIDGlb == 7) {
              uint64_t v299 = 32LL;
            }
            else {
              uint64_t v299 = 0LL;
            }
            add_seg(v299);
            if (byte_999E8 == 1)
            {
              close_math_passage(0LL);
              unsigned int v29 = (void *)&unk_99000;
LABEL_1167:
              ++v29[327];
              byte_99A54 = 0;
              goto LABEL_1645;
            }

            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              uint64_t v381 = 0LL;
              uint64_t v382 = qword_99A00;
              char v383 = 60;
              unsigned int v29 = (void *)&unk_99000;
              do
              {
                *(_BYTE *)(v382 + v381) = v383;
                char v383 = asc_26113[++v381];
              }

              while (v381 != 2);
            }

            else
            {
              unsigned int v29 = &unk_99000;
              if (nLangIDGlb != 7) {
                goto LABEL_1167;
              }
              uint64_t v445 = 0LL;
              uint64_t v382 = qword_99A00;
              char v446 = 39;
              do
              {
                *(_BYTE *)(v382 + v445) = v446;
                char v446 = asc_25B8C[++v445];
              }

              while (v445 != 2);
            }

            qword_99A00 = v382 + 2;
            goto LABEL_1167;
          }

          if (v198 == 46 && dword_99A80)
          {
            add_seg(32LL * (nLangIDGlb == 7));
            unsigned int v200 = *(_BYTE **)&stru_B8.segname[(void)pLangGlb - 8];
            int v201 = (_BYTE *)qword_99A00;
            char v204 = *v200;
            int v202 = v200 + 1;
            char v203 = v204;
            do
            {
              *v201++ = v203;
              int v205 = *v202++;
              char v203 = v205;
            }

            while (v205);
            qword_99A00 = (uint64_t)v201;
            unsigned int v29 = &unk_99000;
            ++qword_99A38;
            dword_99A80 = 0;
            goto LABEL_1645;
          }

          if (v198 == 46 && qword_99A78)
          {
LABEL_973:
            add_seg(0LL);
            qword_99A18 = 32LL;
            v369 = (void *)qword_99A78;
            if (qword_99A78
              && (qword_99A78 == qword_99A30
               || !has_whitespace( *(unsigned __int8 ***)(qword_99A78 + 48),  (unsigned __int8 **)qword_99A30)))
            {
              uint64_t v440 = v369[1] - 1LL;
              v371 = &unk_99000;
              v372 = off_91000;
              int v370 = 0;
              if (*(_BYTE *)(*v369 + v440) == 44)
              {
                unsigned int v29 = (void *)&unk_99000;
              }

              else
              {
                *(_BYTE *)(*v369 + v440) = 0;
                unsigned int v29 = &unk_99000;
                if (nLangIDGlb == 12)
                {
                  int v370 = 0;
                  *(_BYTE *)void *v369 = **(_BYTE **)&stru_68.segname[(void)pLangGlb + 8];
                }
              }
            }

            else
            {
              int v370 = 1;
              unsigned int v29 = (void *)&unk_99000;
              v371 = (void *)&unk_99000;
              v372 = off_91000;
            }

            v479 = (_BYTE *)v29[327];
            int v480 = v479[1];
            if (*v479 == 51)
            {
              if (v480 != 45 || *((_DWORD *)v372 + 268) == 9 && nSubLangIDGlb == 2)
              {
                BOOL v481 = in(v479[1], 11);
                unsigned int v29 = (void *)&unk_99000;
                if (!v481) {
                  goto LABEL_1302;
                }
LABEL_1304:
                v483 = *(_BYTE **)((char *)&stru_68.size + (void)pLangGlb);
                v484 = (_BYTE *)v371[320];
                char v487 = *v483;
                v485 = v483 + 1;
                char v486 = v487;
                do
                {
                  *v484++ = v486;
                  int v488 = *v485++;
                  char v486 = v488;
                }

                while (v488);
                v371[320] = v484;
                if (*((_DWORD *)v372 + 268) == 12) {
                  byte_999EC = 1;
                }
LABEL_1553:
                v561 = (_BYTE *)v29[327];
                if (*v561 == 39) {
                  v29[327] = ++v561;
                }
                if (v561[1] == 39)
                {
                  v562 = v561 + 2;
                  do
                  {
                    if (*v562 != 46) {
                      break;
                    }
                    v29[327] = v562;
                    int v563 = v562[1];
                    v562 += 2;
                  }

                  while (v563 == 39);
                }

                qword_99A78 = 0LL;
                goto LABEL_1645;
              }
            }

            else
            {
LABEL_1302:
              if (v480 == 46)
              {
                BOOL v482 = in(v479[2], 11);
                unsigned int v29 = (void *)&unk_99000;
                if (v482) {
                  goto LABEL_1304;
                }
              }
            }

            if (v370)
            {
              int v489 = *((_DWORD *)v372 + 268);
              if (v489 == 12 || v489 == 9 && nSubLangIDGlb == 1)
              {
                v490 = (void *)qword_99A30;
                v491 = *(void **)(qword_99A30 + 40);
                if (v491 && *v491 == *(uint64_t *)((char *)&stru_20.filesize + (void)pLangGlb))
                {
                  v492 = *(const char **)&stru_68.segname[(void)pLangGlb + 8];
                  v490 = *(void **)(qword_99A30 + 40);
                }

                else
                {
                  v492 = *(const char **)&stru_68.segname[(void)pLangGlb + 8];
                }

                insert_list_element(v490, v492, 4096LL);
              }

              else
              {
                v537 = *(_BYTE **)((char *)&stru_68.size + (void)pLangGlb);
                v538 = (_BYTE *)v371[320];
                char v541 = *v537;
                v539 = v537 + 1;
                char v540 = v541;
                do
                {
                  *v538++ = v540;
                  int v542 = *v539++;
                  char v540 = v542;
                }

                while (v542);
                qword_99A00 = (uint64_t)v538;
              }

              unsigned int v29 = &unk_99000;
            }

            goto LABEL_1553;
          }

          if ((v31 & 0x20E0) == 0 && is_number((unsigned __int8 *)v7 + 1))
          {
            add_seg(64LL);
            v292 = (char *)qword_99A00;
            char v293 = 39;
            goto LABEL_1419;
          }

          v1038 = v4;
          if (v198 < 0x21 || v198 == 160) {
            goto LABEL_1720;
          }
          if (v198 == 39)
          {
            unsigned int v444 = v7[2];
            if (v444 != 46 && v444 >= 0x21 && (v444 != 39 || v7[3] != 46)) {
              goto LABEL_1728;
            }
          }

          else if ((v198 - 58) < 0xF6u || !strstr(v7 + 2, "''"))
          {
LABEL_1728:
            int v612 = nLangIDGlb;
            int v613 = nSubLangIDGlb;
            BOOL v615 = nLangIDGlb == 9 && nSubLangIDGlb != 3;
            if (v31 == 0x2000 && v615)
            {
              v616 = (char *)qword_99A00;
              if (qword_99A00 - (void)v25[324] == 1
                && equals_nocase((unsigned __int8 *)v7 - 1, "O'CLOCK"))
              {
                char v617 = 39;
LABEL_1746:
                char *v616 = v617;
                qword_99A00 = (uint64_t)(v616 + 1);
LABEL_1904:
                uint64_t v4 = v1038;
                goto LABEL_1644;
              }

              BOOL v618 = 0;
              goto LABEL_1759;
            }

            BOOL v618 = nLangIDGlb == 12;
            if (v31 == 0x2000 && nLangIDGlb == 12)
            {
              v616 = (char *)qword_99A00;
              if (qword_99A00 - (void)v25[324] == 1
                && (equals_nocase((unsigned __int8 *)v7 + 1, "EN")
                 || equals_nocase((unsigned __int8 *)v7 + 1, "OR")
                 || equals_nocase((unsigned __int8 *)v7 + 1, "TR")))
              {
                char v617 = 46;
                goto LABEL_1746;
              }

              BOOL v618 = 1;
              goto LABEL_1759;
            }

            if (v31 != 64) {
              goto LABEL_1759;
            }
            if (!v198)
            {
LABEL_1807:
              add_seg(32LL);
              uint64_t v641 = qword_99A00;
              *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_108.offset
                                                 + *(void *)((char *)&stru_20.cmd + (void)pLangGlb));
              qword_99A00 = v641 + 1;
              goto LABEL_1904;
            }

            if ((v198 - 58) <= 0xF5u)
            {
LABEL_1759:
              if (v198 == 46)
              {
                if (v7[2] >= 0x20u && (lFlags & 0x800000) == 0 && (v31 < 3 || v31 == 0x2000))
                {
                  if (v613 == 3 && v612 == 9 || v612 == 7) {
                    uint64_t v626 = 32LL;
                  }
                  else {
                    uint64_t v626 = 0LL;
                  }
                  add_seg(v626);
                  uint64_t v627 = qword_99A00;
                  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                  {
                    uint64_t v628 = 0LL;
                    char v629 = 60;
                    do
                    {
                      *(_BYTE *)(v627 + v628) = v629;
                      char v629 = asc_2611F[++v628];
                    }

                    while (v628 != 2);
                  }

                  else
                  {
                    uint64_t v662 = 0LL;
                    char v663 = 39;
                    do
                    {
                      *(_BYTE *)(v627 + v662) = v663;
                      char v663 = asc_25B8C[++v662];
                    }

                    while (v662 != 2);
                  }

                  qword_99A00 = v627 + 2;
                  unsigned int v29 = &unk_99000;
                  ++qword_99A38;
                  byte_999EC = 1;
                  goto LABEL_1911;
                }
              }

              else if (v198 == 36 && (lFlags & 0x1000000) == 0 && (v31 < 3 || v31 == 0x2000))
              {
                add_seg(2048LL);
                uint64_t v630 = 0LL;
                uint64_t v631 = qword_99A00;
                char v632 = 39;
                do
                {
                  *(_BYTE *)(v631 + v630) = v632;
                  char v632 = asc_25B8F[++v630];
                }

                while (v630 != 2);
                qword_99A00 = v631 + 2;
                unsigned int v29 = &unk_99000;
                ++qword_99A38;
                goto LABEL_1911;
              }

              int v633 = dword_999F0;
              if (v198 && v31 == 0x2000 && (v615 || v618) && dword_999F0)
              {
                if (v198 > 0xDE || (v198 - 123) >= 0xE6u)
                {
                }

                else if ((v198 + 64) < 0x1Fu)
                {
                  goto LABEL_1808;
                }

                if ((v198 - 91) >= 0xE6u)
                {
LABEL_1808:
                  uint64_t v642 = qword_99A00;
                  *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_108.offset
                                                     + *(void *)((char *)&stru_20.cmd + (void)pLangGlb));
                  unsigned int v29 = &unk_99000;
                  *(_BYTE *)(v642 + 1) = *(_BYTE *)++qword_99A38 & 0xDF;
                  qword_99A00 = v642 + 2;
LABEL_1911:
                  uint64_t v4 = v1038;
                  goto LABEL_1645;
                }
              }

              int v634 = v612 == 9 || v618;
              if (v31 == 0x2000 && v634 && v633)
              {
                if (v612 != 9 || v613 != 3)
                {
                  v635 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
                  v636 = (_BYTE *)qword_99A00;
                  char v639 = *v635;
                  v637 = v635 + 1;
                  char v638 = v639;
                  do
                  {
                    *v636++ = v638;
                    int v640 = *v637++;
                    char v638 = v640;
                  }

                  while (v640);
                  qword_99A00 = (uint64_t)v636;
                }

                dword_999F0 = 0;
              }

              goto LABEL_1807;
            }

            char v619 = get_separator(0);
            uint64_t v620 = qword_99A00;
            *(_BYTE *)qword_99A00 = v619;
            uint64_t v621 = v620 + 1;
LABEL_1903:
            qword_99A00 = v621;
            goto LABEL_1904;
          }

LABEL_1720:
          if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
          {
            add_seg(32LL);
            if (*(_BYTE *)(qword_99A38 + 1) != 39 || byte_999E8 == 1 && *(_BYTE *)(qword_99A38 + 2) == 46)
            {
              uint64_t v609 = 0LL;
              uint64_t v610 = qword_99A00;
              char v611 = 60;
              do
              {
                *(_BYTE *)(v610 + v609) = v611;
                char v611 = aM_37[++v609];
              }

              while (v609 != 3);
            }

            else
            {
              uint64_t v609 = 0LL;
              ++qword_99A38;
              uint64_t v610 = qword_99A00;
              char v646 = 60;
              do
              {
                *(_BYTE *)(v610 + v609) = v646;
                char v646 = aSec_0[++v609];
              }

              while (v609 != 4);
            }

            goto LABEL_1902;
          }

          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            add_seg(32LL);
            if (*(_BYTE *)(qword_99A38 + 1) == 39 && (byte_999E8 != 1 || *(_BYTE *)(qword_99A38 + 2) != 46))
            {
              uint64_t v609 = 0LL;
              ++qword_99A38;
              uint64_t v610 = qword_99A00;
              char v661 = 39;
              do
              {
                *(_BYTE *)(v610 + v609) = v661;
                char v661 = asc_2034B[++v609];
              }

              while (v609 != 2);
LABEL_1902:
              uint64_t v621 = v610 + v609;
              goto LABEL_1903;
            }

            v622 = (char *)qword_99A00;
            char v623 = 46;
          }

          else
          {
            if (nLangIDGlb == 7 && byte_999E8)
            {
              add_seg(2LL);
              uint64_t v643 = qword_99A00;
              *(_BYTE *)qword_99A00 = 127;
              qword_99A00 = v643 + 1;
            }

            add_seg(32LL);
            if (nLangIDGlb == 9 || nLangIDGlb == 7)
            {
              uint64_t v644 = qword_99A00;
              *(_BYTE *)qword_99A00 = 34;
              qword_99A00 = v644 + 1;
            }

            if (*(_BYTE *)(qword_99A38 + 1) == 39 && (byte_999E8 != 1 || *(_BYTE *)(qword_99A38 + 2) != 46))
            {
              ++qword_99A38;
              uint64_t v645 = qword_99A00;
              *(_BYTE *)qword_99A00 = 42;
              qword_99A00 = v645 + 1;
            }

            v622 = (char *)qword_99A00;
            char v623 = 42;
          }

          char *v622 = v623;
          qword_99A00 = (uint64_t)(v622 + 1);
          goto LABEL_1904;
        case 0x2Au:
          if (v31 == 256) {
            goto LABEL_1241;
          }
          if (!v31 && is_number((unsigned __int8 *)v7 + 1))
          {
            add_seg(16LL);
            unsigned int v29 = (void *)&unk_99000;
            uint64_t v149 = qword_99A00;
            *(_BYTE *)qword_99A00 = 42;
            qword_99A00 = v149 + 1;
            goto LABEL_1645;
          }

          int v330 = v7[1];
          if (v330 == 30)
          {
            if (v7[2] == 42)
            {
              v331 = (unsigned __int8 *)(v7 + 3);
              goto LABEL_1052;
            }
          }

          else if (v330 == 42)
          {
            v331 = (unsigned __int8 *)(v7 + 2);
LABEL_1052:
            if (is_number(v331) || *v331 && memchr("({[<\x91", *v331, 6uLL))
            {
              add_seg(128LL);
              if (nLangIDGlb == 12)
              {
                uint64_t v402 = qword_99A00;
                *(_BYTE *)qword_99A00 = 34;
                qword_99A00 = v402 + 1;
                byte_999EC = 1;
                goto LABEL_1494;
              }

              if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
              {
                if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                {
                  char v456 = lFlags;
                  goto LABEL_1425;
                }

                if (nLangIDGlb != 7) {
                  goto LABEL_1492;
                }
                v546 = (char *)qword_99A00;
                char v547 = 124;
              }

              else
              {
                if ((byte_999E8 & 1) == 0)
                {
                  char v456 = lFlags;
                  if ((lFlags & 0x40000000) != 0)
                  {
                    if (nSubLangIDGlb != 3)
                    {
LABEL_1492:
                      v546 = (char *)qword_99A00;
                      char v547 = 48;
                      goto LABEL_1493;
                    }

LABEL_1425:
                    uint64_t v525 = qword_99A00;
                    if ((v456 & 4) == 0)
                    {
                      *(_BYTE *)qword_99A00 = 60;
                      ++v525;
                    }

                    uint64_t v526 = 0LL;
                    char v527 = 42;
                    do
                    {
                      *(_BYTE *)(v525 + v526) = v527;
                      char v527 = asc_26103[v526++ + 5];
                    }

                    while (v526 != 2);
                    qword_99A00 = v525 + 2;
                    goto LABEL_1494;
                  }
                }

                v546 = (char *)qword_99A00;
                char v547 = 62;
              }

LABEL_1493:
              char *v546 = v547;
              qword_99A00 = (uint64_t)(v546 + 1);
LABEL_1494:
              uint64_t v548 = qword_99A38++;
              if (*(_BYTE *)qword_99A38 == 30)
              {
                qword_999F8 = 1LL;
                qword_99A38 = v548 + 2;
              }

              goto LABEL_1496;
            }
          }

LABEL_1241:
          if (number_follows(1)
            || (int v469 = v7[1], v469 == 35)
            || v469 == 32 && v7[2] == 35
            || is_mathematics() && (unint64_t)v7 > qword_99A40 && *(v7 - 1) == 32)
          {
            if (number_precedes(1)
              || (unint64_t)v7 > qword_99A40 && *(v7 - 1) == 35
              || (uint64_t)&v7[-qword_99A40] >= 2 && *(v7 - 1) == 32 && *(v7 - 2) == 35
              || (BOOL v470 = is_mathematics(), v31) && v470)
            {
              remove_whitespace(0);
              add_seg(16LL);
              uint64_t v468 = qword_99A00;
              *(_BYTE *)qword_99A00 = 42;
              qword_99A00 = v468 + 1;
              goto LABEL_1642;
            }
          }

          add_seg(256LL);
          v471 = (_BYTE *)qword_99A00;
          if (nLangIDGlb == 9 && nSubLangIDGlb != 3)
          {
            if (qword_99A28 == 0x2000)
            {
              *(_BYTE *)qword_99A00 = 32;
              ++v471;
            }

            *v471++ = 42;
          }

          unsigned int v29 = &unk_99000;
          _BYTE *v471 = 42;
          qword_99A00 = (uint64_t)(v471 + 1);
          if (nLangIDGlb == 7)
          {
            __int16 v472 = lFlags;
            if ((lFlags & 6) == 0)
            {
              v473 = (unsigned __int8 *)(qword_99A38 + 1);
              int v474 = equals_nocase((unsigned __int8 *)(qword_99A38 + 1), "in");
              unsigned int v29 = (void *)&unk_99000;
              if (v474)
              {
                if ((v472 & 0x400) != 0 || (v475 = equals_nocase(v473, "interess"), unsigned int v29 = (void *)&unk_99000, !v475))
                {
                  v471[1] = 105;
                  qword_99A00 = (uint64_t)(v471 + 2);
LABEL_183:
                  ++v29[327];
                }
              }
            }
          }

          goto LABEL_1645;
        case 0x2Bu:
        case 0x3Du:
        case 0xB1u:
        case 0xD7u:
        case 0xF7u:
          if ((number_precedes(1) || (uint64_t)&v7[-qword_99A40] >= 2
                                                 && *(v7 - 1) == 32
                                                 && *(v7 - 2) == 35)
            && !is_number((unsigned __int8 *)v7)
            || is_mathematics())
          {
            remove_whitespace(0);
          }

          if (nLangIDGlb != 7
            || *(_BYTE *)qword_99A38 != 61
            || (lFlags & 0x20000) != 0
            || (byte_999E8 & 1) != 0
            || number_follows(1)
            || number_precedes(1))
          {
            add_seg(16LL);
            unsigned int v29 = &unk_99000;
            uint64_t v116 = qword_99A00;
            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
            qword_99A00 = v116 + 1;
          }

          else
          {
            add_seg(32LL);
            uint64_t v457 = 0LL;
            uint64_t v458 = qword_99A00;
            char v459 = 34;
            do
            {
              *(_BYTE *)(v458 + v457) = v459;
              char v459 = asc_26100[++v457];
            }

            while (v457 != 2);
            v460 = (_BYTE *)(v458 + 2);
            qword_99A00 = v458 + 2;
            unsigned int v29 = &unk_99000;
            v461 = (unsigned __int8 *)qword_99A38;
            if (*(_BYTE *)qword_99A38)
            {
              v462 = v25[324];
              do
              {
                int v464 = *++v461;
                int v463 = v464;
                if (v464 != 61 && v463 != 30) {
                  break;
                }
                qword_99A38 = (uint64_t)v461;
                int v466 = *v461;
                if (v466 == 30)
                {
                  qword_999F8 = v460 - v462 + 1;
                  int v467 = 30;
                }

                else
                {
                  *v460++ = v466;
                  qword_99A00 = (uint64_t)v460;
                  v461 = (unsigned __int8 *)qword_99A38;
                  int v467 = *(unsigned __int8 *)qword_99A38;
                }
              }

              while (v467);
            }
          }

          if (!v31) {
            goto LABEL_1645;
          }
          if (!number_follows(1)) {
            goto LABEL_300;
          }
          goto LABEL_1642;
        case 0x2Cu:
          if ((v31 & 0xC0) == 0)
          {
            BOOL v150 = is_number((unsigned __int8 *)v7);
            unsigned int v29 = (void *)&unk_99000;
            if (v150)
            {
              add_seg(64LL);
              unsigned int v29 = &unk_99000;
            }
          }

          int v151 = nLangIDGlb;
          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            uint64_t v153 = qword_99A18;
            uint64_t v51 = (void *)&unk_99000;
          }

          else
          {
            uint64_t v153 = qword_99A18;
            uint64_t v51 = &unk_99000;
            if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            {
              if ((qword_99A18 & 0xC0) != 0) {
                goto LABEL_989;
              }
              if (qword_99A18 == 16)
              {
LABEL_1212:
                add_seg(32LL);
                unsigned int v29 = (void *)&unk_99000;
LABEL_989:
                int64_t v57 = (char *)qword_99A00;
                char v58 = 39;
                goto LABEL_128;
              }

              if (qword_99A18 == 4)
              {
                if (*(_BYTE *)(v29[327] - 1LL) == 45 && qword_99A48 && *(void *)(qword_99A30 + 24) == 64LL) {
                  goto LABEL_1212;
                }
                goto LABEL_1213;
              }
            }
          }

          if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && v153 == 64) {
            goto LABEL_1214;
          }
          if ((v153 & 0xC0) != 0)
          {
            uint64_t v282 = v29[327];
            int v283 = *(unsigned __int8 *)(v282 + 1);
            if (*(_BYTE *)(v282 + 1))
            {
              if ((v283 - 58) > 0xFFFFFFF5)
              {
                v477 = (_BYTE *)v51[320];
                if (nLangIDGlb != 9) {
                  goto LABEL_1536;
                }
                _BYTE *v477 = get_separator(0);
                v478 = v477 + 1;
LABEL_1537:
                v51[320] = v478;
                goto LABEL_1644;
              }

              if (nLangIDGlb == 7 && v283 == 40 && *(unsigned __int8 *)(v282 + 2) - 58 >= 0xFFFFFFF6)
              {
                v477 = (_BYTE *)v51[320];
LABEL_1536:
                _BYTE *v477 = stru_B8.segname[(void)pLangGlb + 1];
                v478 = v477 + 1;
                goto LABEL_1537;
              }
            }
          }

          if (v153 == 64)
          {
            uint64_t v284 = v29[327];
            if ((*(_BYTE *)(v284 + 1) != 32
               || (int v285 = is_any_number((unsigned __int8 *)(v284 + 2))) == 0
               || (v285 + 33) <= 0xE0u && (v285 - 91) <= 0xE5u)
              && number_follows(1))
            {
              if (v151 == 9)
              {
                char v286 = get_separator(0);
                v287 = (_BYTE *)v51[320];
                _BYTE *v287 = v286;
                v288 = v287 + 1;
                goto LABEL_954;
              }

              v536 = (_BYTE *)v51[320];
              _BYTE *v536 = stru_B8.segname[(void)pLangGlb + 1];
              v51[320] = v536 + 1;
              goto LABEL_1644;
            }
          }

LABEL_1213:
          add_seg(8LL);
          unsigned int v29 = (void *)&unk_99000;
LABEL_1214:
          int64_t v57 = (char *)v51[320];
          char v58 = 44;
          goto LABEL_128;
        case 0x2Du:
          uint64_t v206 = v7[1];
          if ((_DWORD)v206 != 46)
          {
            add_seg(64LL);
            unsigned int v29 = (void *)&unk_99000;
            BOOL v160 = (char *)qword_99A00;
            char v161 = 45;
            goto LABEL_1463;
          }

          unsigned int v207 = v7[2];
          if (v207 >= 0x21
            && v207 != 160
            && !in(v7[2], 5)
            && (lFlags & 0x800000) == 0
            && (lFlags & 0x7FFE) != 0x7FFE)
          {
            if ((v207 - 58) < 0xF6u || nLangIDGlb != 9)
            {
              add_seg(32LL);
              uint64_t v543 = qword_99A00;
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                uint64_t v544 = 0LL;
                char v545 = 60;
                do
                {
                  *(_BYTE *)(v543 + v544) = v545;
                  char v545 = asc_260EF[++v544];
                }

                while (v544 != 3);
              }

              else
              {
                uint64_t v544 = 0LL;
                char v594 = 45;
                do
                {
                  *(_BYTE *)(v543 + v544) = v594;
                  char v594 = asc_25E4F[++v544];
                }

                while (v544 != 2);
              }

              qword_99A00 = v543 + v544;
              unsigned int v29 = &unk_99000;
              ++qword_99A38;
              byte_99A54 = 1;
              goto LABEL_1645;
            }

            uint64_t v208 = 4LL;
            goto LABEL_912;
          }

LABEL_764:
          if (v31 == 0x2000)
          {
            if (v206 < 0x21
              || (_DWORD)v206 == 160
              || (v300 = memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v206, 0x15uLL), (_DWORD)v206 != 45)
              && v300)
            {
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
                byte_999EC = 0;
              }
              goto LABEL_772;
            }
          }

          else if (v31 <= 8 && is_number((unsigned __int8 *)v7))
          {
            uint64_t v208 = 16LL;
LABEL_912:
            add_seg(v208);
            v292 = (char *)qword_99A00;
            char v293 = -106;
            goto LABEL_1419;
          }

          if (!number_follows(1)
            && (_DWORD)v206 != 35
            && ((_DWORD)v206 != 32 || v7[2] != 35)
            && ((BOOL v424 = is_mathematics(), v425 = qword_99A40, !v424)
             || (unint64_t)v7 <= qword_99A40
             || (*(v7 - 1) | 0x80) != 0xA0)
            || !number_precedes(1)
            && ((uint64_t v425 = qword_99A40, (unint64_t)v7 <= qword_99A40) || *(v7 - 1) != 35)
            && ((uint64_t)&v7[-qword_99A40] < 2 || (*(v7 - 1) | 0x80) != 0xA0 || *(v7 - 2) != 35)
            && ((BOOL v433 = is_mathematics(), !v31) || !v433))
          {
            v434 = v25;
            if ((_DWORD)v206 != 45) {
              goto LABEL_1502;
            }
            uint64_t v435 = v7[2];
            if ((_DWORD)v435 == 45)
            {
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                byte_999EC = 0;
                dword_999F0 = 0;
              }

              add_seg(32LL);
              uint64_t v436 = qword_99A00 + 2;
              unsigned int v29 = &unk_99000;
              do
              {
                uint64_t v437 = v436;
                *(_BYTE *)(v436 - 2) = 45;
                uint64_t v438 = qword_99A38++;
                if (!*(_BYTE *)qword_99A38) {
                  break;
                }
                int v439 = *(unsigned __int8 *)(v438 + 2);
                uint64_t v436 = v437 + 1;
              }

              while (v439 == 45);
              *(_BYTE *)(v437 - 1) = 45;
              qword_99A00 = v437;
              goto LABEL_2005;
            }

            if ((v31 & 0xC8) == 0)
            {
              if ((v435 < 0x21 || (_DWORD)v435 == 160 || in(v435, 9))
                && (*(unsigned __int8 *)(qword_99A00 - 1) | 2) != 0x2E)
              {
                if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                {
                  byte_999EC = 0;
                  dword_999F0 = 0;
                  goto LABEL_2007;
                }

                goto LABEL_2008;
              }

LABEL_1502:
              if (v31 == 2)
              {
                BOOL v549 = in(v206, 9);
                int v550 = nLangIDGlb;
                if (v549)
                {
                  if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
                  {
                    byte_999EC = 0;
                    goto LABEL_1673;
                  }

                  if (nLangIDGlb == 7)
                  {
                    add_seg(0x2000LL);
                    v595 = (char *)qword_99A00;
                    if ((lFlags & 8) == 0)
                    {
                      char v596 = -105;
                      goto LABEL_1675;
                    }
                  }

                  else
                  {
LABEL_1673:
                    add_seg(4LL);
                    v595 = (char *)qword_99A00;
                  }

                  char v596 = 45;
LABEL_1675:
                  char *v595 = v596;
                  qword_99A00 = (uint64_t)(v595 + 1);
                  dword_999F0 = 0;
LABEL_2004:
                  unsigned int v29 = (void *)&unk_99000;
LABEL_2005:
                  uint64_t v25 = v434;
                  goto LABEL_1645;
                }

LABEL_1513:
                BOOL v552 = v550 == 9 && nSubLangIDGlb == 3;
                int v553 = v552;
                if (v552)
                {
                  byte_999EC = 0;
                  dword_999F0 = 0;
                }

                if (v31 > 2)
                {
LABEL_1523:
                  add_seg(4LL);
                  v554 = (char *)qword_99A00;
                  char v555 = 45;
LABEL_2003:
                  char *v554 = v555;
                  qword_99A00 = (uint64_t)(v554 + 1);
                  goto LABEL_2004;
                }

                if (v31 == 1)
                {
                  if (*(v7 - 1) == 46) {
                    goto LABEL_1523;
                  }
                  if (!is_number((unsigned __int8 *)v7))
                  {
LABEL_2001:
                    if ((unint64_t)qword_99A28 <= 1)
                    {
                      add_seg(4LL);
                      v554 = (char *)qword_99A00;
                      char v555 = -105;
                      goto LABEL_2003;
                    }

                    if (v553)
                    {
LABEL_2007:
                      int v654 = 150;
                      goto LABEL_2009;
                    }

LABEL_2008:
                    int v654 = 151;
                    goto LABEL_2009;
                  }
                }

                else if (!is_number((unsigned __int8 *)v7))
                {
                  if (v31 != 2) {
                    goto LABEL_2001;
                  }
                  uint64_t v647 = v7[3];
                  if (v647 >= 0x21)
                  {
                    v690 = memchr(")}]>\x9B", v7[3], 6uLL);
                    if ((_DWORD)v647 != 46 && !v690)
                    {
                      if (!in(v647, 9)) {
                        goto LABEL_2001;
                      }
                      unsigned int v691 = v7[4];
                      if (v691 >= 0x21)
                      {
                        v692 = memchr(")}]>\x9B", v7[4], 6uLL);
                        if (v691 != 46 && !v692) {
                          goto LABEL_2001;
                        }
                      }
                    }
                  }

                  uint64_t v648 = (uint64_t)&v7[-v425];
                  if (v648 < 2) {
                    goto LABEL_2001;
                  }
                  int v649 = *(v7 - 2);
                  if (!in(*(v7 - 2), 9)
                    || v648 != 2
                    && (uint64_t v650 = *(v7 - 3), v650 >= 0x21)
                    && (!in(v650, 9) || v648 != 3 && *(v7 - 4) >= 0x21u))
                  {
                    if (!v649) {
                      goto LABEL_2001;
                    }
                    v651 = memchr(")}]>\x9B", v649, 6uLL);
                    if (v649 != 46 && !v651) {
                      goto LABEL_2001;
                    }
                    if (v648 != 2)
                    {
                      uint64_t v652 = *(v7 - 3);
                      if (v652 >= 0x21)
                      {
                        if (!in(v652, 9)) {
                          goto LABEL_2001;
                        }
                        if (v648 != 3)
                        {
                          uint64_t v653 = *(v7 - 4);
                          if (v653 >= 0x21
                            && (!in(v653, 9) || v648 != 4 && *(v7 - 5) > 0x20u))
                          {
                            goto LABEL_2001;
                          }
                        }
                      }
                    }
                  }

                  int v654 = 45;
LABEL_2009:
                  process_dash(v654, 0);
                  goto LABEL_2004;
                }

                add_seg(16LL);
                v554 = (char *)qword_99A00;
                char v555 = -106;
                goto LABEL_2003;
              }
            }

            int v550 = nLangIDGlb;
            if (v31 == 0x2000 && nLangIDGlb == 9)
            {
              v551 = v25[324];
              if (qword_99A00 - (void)v551 == 2 && ((uint64_t)&v7[-v425] < 3 || *(v7 - 3) <= 0x20u))
              {
                v597 = "TO";
                while (1)
                {
                  do
                    int v598 = *v551++;
                  while (v598 == 173 || v598 == 30);
                  if (++v597 == "")
                  {
                    int v600 = equals_nocase((unsigned __int8 *)v7 + 1, "DAY");
                    unsigned int v29 = (void *)&unk_99000;
                    if (v600) {
                      goto LABEL_1645;
                    }
                    int v601 = equals_nocase((unsigned __int8 *)v7 + 1, "NIGHT");
                    unsigned int v29 = (void *)&unk_99000;
                    if (v601) {
                      goto LABEL_1645;
                    }
                    int v602 = equals_nocase((unsigned __int8 *)v7 + 1, "MORROW");
                    unsigned int v29 = (void *)&unk_99000;
                    if (v602) {
                      goto LABEL_1645;
                    }
                    break;
                  }
                }
              }

              int v550 = 9;
            }

            goto LABEL_1513;
          }

          if (is_mathematics()
            || (_DWORD)v206 == 35
            || (_DWORD)v206 == 32 && v7[2] == 35
            || (unint64_t)v7 > qword_99A40 && *(v7 - 1) == 35
            || (uint64_t)&v7[-qword_99A40] >= 2 && *(v7 - 1) == 32 && *(v7 - 2) == 35)
          {
            remove_whitespace(0);
            add_seg(16LL);
            v276 = (char *)qword_99A00;
            char v277 = -106;
            goto LABEL_931;
          }

          if ((v206 | 0x80) == 0xA0)
          {
LABEL_806:
            int v313 = 45;
LABEL_807:
            int v314 = 0;
LABEL_808:
            process_dash(v313, v314);
            goto LABEL_1644;
          }

          if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
          {
            if (nLangIDGlb == 12)
            {
              uint64_t v447 = 16LL;
              if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
                goto LABEL_1717;
              }
              goto LABEL_1716;
            }
          }

          else
          {
            uint64_t v447 = 16LL;
            if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
              goto LABEL_1717;
            }
          }

          if (nLangIDGlb == 9 && nSubLangIDGlb == 1) {
            goto LABEL_772;
          }
LABEL_1716:
          uint64_t v447 = 4LL;
LABEL_1717:
          add_seg(v447);
LABEL_772:
          v292 = (char *)qword_99A00;
          char v293 = 45;
          goto LABEL_1419;
        case 0x2Eu:
          if (v31 - 1 > 1)
          {
            BOOL v211 = 0;
          }

          else
          {
            unsigned int v209 = v7[1];
            BOOL v211 = v209 < 0x21 || v209 == 160;
          }

          if ((v31 & 0x20C0) == 0)
          {
            BOOL v301 = is_number((unsigned __int8 *)v7);
            unsigned int v29 = (void *)&unk_99000;
            if (v301)
            {
              add_seg(64LL);
              unsigned int v29 = &unk_99000;
              unint64_t v31 = qword_99A18;
              uint64_t v7 = (char *)qword_99A38;
            }
          }

          unsigned int v302 = v7[1];
          if (v31 == 64 && (v302 - 48) <= 9u)
          {
            if (nLangIDGlb != 9)
            {
              if (nLangIDGlb == 12)
              {
                v303 = (_BYTE *)qword_99A00;
                if ((lFlags & 0x40000) != 0)
                {
                  *(_BYTE *)qword_99A00 = 47;
                  qword_99A00 = (uint64_t)(v303 + 1);
                  goto LABEL_1645;
                }
              }

              else
              {
                v303 = (_BYTE *)qword_99A00;
              }

              _BYTE *v303 = get_separator(0);
              qword_99A00 = (uint64_t)(v303 + 1);
              goto LABEL_1644;
            }

            if (nSubLangIDGlb == 2)
            {
              BOOL v160 = (char *)qword_99A00;
LABEL_1277:
              char v161 = stru_B8.segname[(void)pLangGlb + 1];
              goto LABEL_1463;
            }

            BOOL v160 = (char *)qword_99A00;
            if ((byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0) {
              goto LABEL_1277;
            }
            char v161 = 36;
            goto LABEL_1463;
          }

          if ((v302 | 2) == 0x2E)
          {
            if (nLangIDGlb != 7) {
              goto LABEL_1339;
            }
            if (v211) {
              goto LABEL_1337;
            }
            if ((v31 & 0xC) == 0 || v302 == 46) {
              goto LABEL_1339;
            }
          }

          else
          {
            if (v31 == 64)
            {
              if ((v302 | 0x80) != 0xA0) {
                goto LABEL_1280;
              }
            }

            else if (v31 == 2 && (v302 - 58) > 0xF5u)
            {
LABEL_1280:
              if (v211)
              {
LABEL_1286:
                if (number_follows(1) && number_precedes(1) || is_mathematics())
                {
                  remove_whitespace(0);
                  add_seg(16LL);
                  v276 = (char *)qword_99A00;
                  char v277 = 46;
LABEL_931:
                  char *v276 = v277;
                  qword_99A00 = (uint64_t)(v276 + 1);
LABEL_1642:
                  int v260 = 0;
LABEL_1643:
                  skip_whitespace(v260);
                  goto LABEL_1644;
                }
              }

              int v496 = nLangIDGlb;
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                if (v31 != 64 || byte_999E8 || (lFlags & 0x40000000) == 0)
                {
LABEL_1472:
                  uint64_t v520 = 8LL;
                  goto LABEL_1475;
                }

LABEL_1401:
                uint64_t v521 = qword_99A00;
                qword_99A00 = v521 + 1;
                goto LABEL_1644;
              }

LABEL_1471:
              if (v496 == 9) {
                goto LABEL_1472;
              }
LABEL_1474:
              uint64_t v520 = 4LL;
              goto LABEL_1475;
            }

            if (v211)
            {
              if (nLangIDGlb != 7)
              {
LABEL_1339:
                v498 = off_91000;
                if (v302 == 46) {
                  goto LABEL_1342;
                }
                goto LABEL_1340;
              }

LABEL_1337:
              if ((lFlags & 0x40) == 0)
              {
                add_seg(4LL);
                uint64_t v497 = qword_99A00;
                *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
                qword_99A00 = v497 + 1;
                uint64_t v7 = (char *)qword_99A38;
                unsigned int v302 = *(unsigned __int8 *)(qword_99A38 + 1);
              }

              goto LABEL_1339;
            }

            if (v302 == 46 || (v31 & 0xC) == 0 || nLangIDGlb != 7) {
              goto LABEL_1339;
            }
          }

          if (!in(v7[1], 5))
          {
            v498 = off_91000;
LABEL_1340:
            if (qword_99A18 != 32 || *(v7 - 1) != 46)
            {
              int v496 = *((_DWORD *)v498 + 268);
              BOOL v502 = v496 == 9 && nSubLangIDGlb != 3 || v496 == 12;
              if (qword_99A18 == 0x2000 && v502 && dword_999F0)
              {
                if (v302)
                {
                  if ((v302 + 33) <= 0xE0u && (v302 - 91) < 0xE6u)
                  {
                    if (v302 > 0xDE || (v302 - 123) >= 0xE6u)
                    {
                      v503 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
                      v504 = (_BYTE *)qword_99A00;
                      char v507 = *v503;
                      v505 = v503 + 1;
                      char v506 = v507;
                      do
                      {
                        *v504++ = v506;
                        int v508 = *v505++;
                        char v506 = v508;
                      }

                      while (v508);
                      qword_99A00 = (uint64_t)v504;
                      dword_999F0 = 0;
                      v498 = off_91000;
                    }

                    goto LABEL_1370;
                  }

                  if (v496 == 12)
                  {
                    v533 = (char *)qword_99A00;
                    if ((lFlags & 0x40000) == 0)
                    {
                      char v534 = 46;
LABEL_1450:
                      char *v533 = v534;
                      qword_99A00 = (uint64_t)(v533 + 1);
                      goto LABEL_1644;
                    }
                  }

                  else
                  {
                    v533 = (char *)qword_99A00;
                  }

                  char v534 = **(_BYTE **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
                  goto LABEL_1450;
                }

LABEL_1370:
                add_seg(32LL);
                if (*((_DWORD *)v498 + 268) != 12 || (lFlags & 0x40000) != 0) {
                  goto LABEL_1401;
                }
              }

              else
              {
                if (v496 != 9 || nSubLangIDGlb != 3)
                {
                  if (v496 != 12) {
                    goto LABEL_1471;
                  }
                  if ((lFlags & 0x40000) == 0)
                  {
                    uint64_t v520 = 32LL;
                    goto LABEL_1475;
                  }

                  goto LABEL_1474;
                }

                uint64_t v520 = 8LL;
                if (qword_99A18 == 64 && !byte_999E8 && (lFlags & 0x40000000) != 0) {
                  goto LABEL_1401;
                }
LABEL_1475:
                add_seg(v520);
              }

              v292 = (char *)qword_99A00;
              char v293 = 46;
LABEL_1419:
              char *v292 = v293;
              qword_99A00 = (uint64_t)(v292 + 1);
              goto LABEL_1644;
            }

LABEL_1342:
            if (*((_DWORD *)v498 + 268) == 9
              && nSubLangIDGlb == 3
              && ((BYTE3(lFlags) >> 6) & 1 & ~byte_999E8) == 0
              && qword_99A18 == 64)
            {
              int v499 = 9;
            }

            else
            {
              add_seg(32LL);
              int v499 = *((_DWORD *)v498 + 268);
              if (v499 == 12)
              {
                unsigned int v29 = &unk_99000;
                if ((lFlags & 0x40000) == 0)
                {
LABEL_1377:
                  v509 = (char *)qword_99A00;
                  char v510 = 46;
LABEL_1379:
                  char *v509 = v510;
                  v511 = v509 + 1;
                  v512 = (_BYTE *)v29[327];
                  if (!*v512)
                  {
LABEL_1395:
                    qword_99A00 = (uint64_t)v511;
                    goto LABEL_1645;
                  }

                  char v513 = byte_999E8 ^ 1;
                  uint64_t v514 = qword_99A18;
                  while (1)
                  {
                    int v516 = v512[1];
                    v515 = v512 + 1;
                    if (v516 != 46) {
                      goto LABEL_1395;
                    }
                    v29[327] = v515;
                    int v517 = *((_DWORD *)v498 + 268);
                    if (v517 == 12)
                    {
                      if ((lFlags & 0x40000) != 0) {
                        goto LABEL_1393;
                      }
                    }

                    else
                    {
                      BOOL v518 = v517 == 9 && nSubLangIDGlb == 3;
                      if (v518
                        && ((*(_DWORD *)&v513 & ((BYTE3(lFlags) & 0x40) >> 6) & 1) != 0 || v514 != 64))
                      {
LABEL_1393:
                        char v519 = **(_BYTE **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
                        goto LABEL_1394;
                      }
                    }

                    char v519 = 46;
LABEL_1394:
                    *v511++ = v519;
                    v512 = (_BYTE *)v29[327];
                    if (!*v512) {
                      goto LABEL_1395;
                    }
                  }
                }

LABEL_1378:
                char v510 = **(_BYTE **)&stru_158.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8];
                v509 = (char *)qword_99A00;
                goto LABEL_1379;
              }
            }

            unsigned int v29 = (void *)&unk_99000;
            if (v499 != 9
              || nSubLangIDGlb != 3
              || ((BYTE3(lFlags) >> 6) & 1 & ~byte_999E8) == 0 && qword_99A18 == 64)
            {
              goto LABEL_1377;
            }

            goto LABEL_1378;
          }

          goto LABEL_1337;
        case 0x2Fu:
          if (v31 == 2 && ((unsigned int v212 = v7[1], v213 = 1, v212 < 0x21) || v212 == 160)
            || (int v213 = 0, v214 = 0, is_mathematics()))
          {
            remove_whitespace(0);
            unint64_t v31 = qword_99A18;
            int v214 = v213;
          }

          if (!v31)
          {
            int v352 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (v352 != 9 && v352 != 160 && v352 != 32) {
              goto LABEL_935;
            }
          }

          int v215 = byte_999E8;
          if ((byte_999E8 & 1) != 0) {
            goto LABEL_550;
          }
          if (v31 == 64 && qword_99A48)
          {
            if (*(void *)(qword_99A30 + 24) == 4LL && **(_BYTE **)qword_99A30 == 47)
            {
LABEL_935:
              uint64_t v353 = 4LL;
              goto LABEL_936;
            }
          }

          else
          {
LABEL_550:
          }

          if (!is_mathematics()
            || v31 == 64 && nLangIDGlb == 9 && nSubLangIDGlb != 2 && is_number((unsigned __int8 *)(qword_99A38 + 1)))
          {
            BOOL v216 = number_follows(0);
            if (v216 && number_precedes(0))
            {
              v217 = &unk_99000;
              if (qword_99A48) {
                char v218 = v214;
              }
              else {
                char v218 = 1;
              }
              if ((v218 & 1) == 0)
              {
                v219 = (char **)qword_99A30;
                if (*(void *)(qword_99A30 + 24) == 2LL)
                {
                  uint64_t v220 = *(void *)(qword_99A30 + 8);
                  if (v220 == 1 || v220 == 2 && byte_99A50)
                  {
                    uint64_t v221 = *(void *)(qword_99A30 + 40);
                    if (v221)
                    {
                      if (*(void *)(v221 + 24) == 64LL)
                      {
                        v222 = *(char ***)(v221 + 40);
                        if (!v222 || !memchr("|/\xF7", **v222, 4uLL))
                        {
                          if (nLangIDGlb == 9 && nSubLangIDGlb != 2)
                          {
                            int v223 = (lFlags & 0x40000000) != 0 ? v215 : 1;
                            if (v223 == 1)
                            {
                              v219[3] = (_BYTE *)&stru_20;
                              v224 = *v219;
                              char v225 = 52;
LABEL_1899:
                              char *v224 = v225;
                              (*v219)[1] = 0;
                              goto LABEL_1913;
                            }
                          }

                          if (byte_99A50 == 1)
                          {
                            v224 = *v219;
                            char v225 = 31;
                            goto LABEL_1899;
                          }

                          v219[3] = 0LL;
                        }
                      }
                    }
                  }
                }
              }

LABEL_1913:
              if (nLangIDGlb == 9) {
                int v664 = v214 ^ 1;
              }
              else {
                int v664 = 0;
              }
              if (v664 == 1 && nSubLangIDGlb == 2)
              {
                v665 = (_BYTE *)qword_99A38;
                unsigned int v666 = *(unsigned __int8 *)(qword_99A38 + 1);
                if (v666 < 0x21 || v666 == 160)
                {
LABEL_1953:
                  remove_whitespace(1);
                  if (((v214 & 1) != 0 || qword_99A28 == 1 && v217[329] && **(_BYTE **)qword_99A30 == 11)
                    && (nLangIDGlb == 7 || nLangIDGlb == 9 && nSubLangIDGlb == 3)
                    && !strchr((const char *)(qword_99A38 + 1), 61))
                  {
                    uint64_t v681 = 4LL;
                  }

                  else
                  {
                    uint64_t v681 = 16LL;
                  }

                  add_seg(v681);
                  if (!v214)
                  {
                    uint64_t v686 = qword_99A00;
                    *(_BYTE *)qword_99A00 = 47;
                    int v687 = 1;
LABEL_2012:
                    qword_99A00 = v686 + 1;
                    skip_whitespace(v687);
                    goto LABEL_300;
                  }

                  BOOL v684 = nLangIDGlb == 9 && nSubLangIDGlb != 2;
                  if ((nLangIDGlb == 12 || v684) && !strchr((const char *)(qword_99A38 + 1), 61))
                  {
                    v455 = (char *)qword_99A00;
                    char v685 = 124;
                  }

                  else
                  {
                    v455 = (char *)qword_99A00;
                    char v685 = 47;
                  }

                  char *v455 = v685;
                  int v454 = 1;
LABEL_1979:
                  qword_99A00 = (uint64_t)(v455 + 1);
                  skip_whitespace(v454);
                  goto LABEL_1642;
                }

                int v667 = 0;
                uint64_t v668 = 2LL;
                do
                {
                  if (v666 == 47) {
                    ++v667;
                  }
                  unsigned int v666 = *(unsigned __int8 *)(qword_99A38 + v668);
                  if (v666 < 0x21) {
                    break;
                  }
                  ++v668;
                }

                while (v666 != 160);
                v217 = (void *)&unk_99000;
                if (v667 == 1 && qword_99A00 - (uint64_t)v25[324] <= 2)
                {
                  while (1)
                  {
                    int v669 = *v665;
                    if (v669 == 47)
                    {
                      add_seg(0LL);
                    }

                    else
                    {
                      if (!*v665 || (v669 - 58) < 0xFFFFFFF6)
                      {
                        qword_99A38 = (uint64_t)(v665 - 1);
                        if ((v214 & 1) != 0) {
                          goto LABEL_1642;
                        }
LABEL_300:
                        BOOL v117 = is_mathematics();
                        goto LABEL_1641;
                      }

                      add_seg(64LL);
                      char v670 = upper_digit(*(_BYTE *)qword_99A38);
                      uint64_t v671 = qword_99A00;
                      *(_BYTE *)qword_99A00 = v670;
                      qword_99A00 = v671 + 1;
                    }

                    v665 = (_BYTE *)++qword_99A38;
                  }
                }
              }

              if (nSubLangIDGlb == 2) {
                int v672 = 0;
              }
              else {
                int v672 = v664;
              }
              if (v672 == 1)
              {
                v673 = (_BYTE *)qword_99A38;
                unsigned int v674 = *(unsigned __int8 *)(qword_99A38 + 1);
                if (v674 < 0x21 || v674 == 160) {
                  goto LABEL_1959;
                }
                int v675 = 0;
                uint64_t v676 = 2LL;
                do
                {
                  if (v674 == 47) {
                    ++v675;
                  }
                  unsigned int v674 = *(unsigned __int8 *)(qword_99A38 + v676);
                  if (v674 < 0x21) {
                    break;
                  }
                  ++v676;
                }

                while (v674 != 160);
                if (v675 != 1 || qword_99A00 - (uint64_t)v25[324] > 2)
                {
LABEL_1959:
                  if ((lFlags & 0x20000) != 0)
                  {
                    v682 = (_BYTE *)qword_99A00;
                  }

                  else
                  {
                    v682 = (_BYTE *)qword_99A00;
                    if ((lFlags & 0x200) == 0 && nSubLangIDGlb != 3)
                    {
                      *(_BYTE *)qword_99A00 = stru_B8.segname[(void)pLangGlb + 3];
                      ++v682;
                    }
                  }

                  _BYTE *v682 = 124;
                  qword_99A00 = (uint64_t)(v682 + 1);
                  if ((v214 & 1) != 0) {
                    goto LABEL_1642;
                  }
                  goto LABEL_300;
                }

                uint64_t v677 = qword_99A00 + 1;
                v678 = &unk_99000;
                while (1)
                {
                  int v679 = *v673;
                  if (v679 == 47)
                  {
                    char v680 = 45;
                  }

                  else
                  {
                    if (!*v673 || (v679 - 58) < 0xF6u)
                    {
                      qword_99A38 = (uint64_t)(v673 - 1);
                      if ((v214 & 1) != 0) {
                        goto LABEL_1642;
                      }
                      goto LABEL_300;
                    }

                    char v680 = upper_digit(v679);
                    v678 = (void *)&unk_99000;
                  }

                  *(_BYTE *)(v677 - 1) = v680;
                  qword_99A00 = v677;
                  v673 = (_BYTE *)(v678[327] + 1LL);
                  v678[327] = v673;
                  ++v677;
                }
              }

              goto LABEL_1953;
            }

            int v387 = nLangIDGlb;
            BOOL v389 = nLangIDGlb == 9 && nSubLangIDGlb == 1;
            if (nLangIDGlb == 12 || v389)
            {
              if (v216 && number_precedes(0))
              {
                if ((v214 & 1) == 0)
                {
                  if ((lFlags & 0x8000000) == 0)
                  {
                    if (qword_99A48)
                    {
                      v557 = (void *)qword_99A30;
                      if (*(void *)(qword_99A30 + 24) == 2LL)
                      {
                        uint64_t v558 = *(void *)(qword_99A30 + 8);
                        if (v558 == 1 || v558 == 2 && byte_99A50)
                        {
                          uint64_t v559 = *(void *)(qword_99A30 + 40);
                          if (v559)
                          {
                            if (*(void *)(v559 + 24) == 64LL)
                            {
                              v560 = *(char ***)(v559 + 40);
                              if (!v560 || !memchr("|/\xF7", **v560, 4uLL))
                              {
                                if (byte_99A50 == 1)
                                {
                                  *(_BYTE *)void *v557 = 31;
                                  *(_BYTE *)(*v557 + 1LL) = 0;
                                }

                                else
                                {
                                  v557[3] = 0LL;
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }

                  add_seg(16LL);
                  int v687 = 0;
                  uint64_t v686 = qword_99A00;
                  *(_BYTE *)qword_99A00 = 124;
                  goto LABEL_2012;
                }

                add_seg(16LL);
                int v454 = 0;
                v455 = (char *)qword_99A00;
                *(_BYTE *)qword_99A00 = 124;
                goto LABEL_1979;
              }

              if (v387 == 12)
              {
                int v494 = byte_999EC;
                if ((lFlags & 0x40000) == 0)
                {
                  if ((lFlags & 0xE) != 0) {
                    int v494 = 1;
                  }
                  if (((v494 | byte_99A54) & 1) == 0)
                  {
                    if (v31 != 0x2000
                      || (v604 = v25[324], !*v604)
                      || (*v604 & 0xDFu) - 91 < 0xFFFFFFE6
                      || qword_99A00 - (void)v604 != 1)
                    {
                      uint64_t v495 = 32LL;
                      add_seg(32LL);
                      uint64_t v608 = qword_99A00;
                      *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
                      qword_99A00 = v608 + 1;
LABEL_1707:
                      add_seg(v495);
                      uint64_t v607 = qword_99A00;
                      *(_BYTE *)qword_99A00 = 47;
                      qword_99A00 = v607 + 1;
                      if ((v214 & 1) == 0) {
                        goto LABEL_300;
                      }
                      goto LABEL_1642;
                    }

                    add_list_element();
                    uint64_t v605 = qword_99A30;
                    if (qword_99A30)
                    {
                      *(void *)qword_99A30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
                      *(void *)(v605 + 8) = 1LL;
                      *(void *)(v605 + 24) = 32LL;
                    }

                    byte_999EC = 1;
                  }

                  uint64_t v495 = 32LL;
                  goto LABEL_1707;
                }

                if ((lFlags & 6) != 0) {
                  int v494 = 1;
                }
                if (((v494 | byte_99A54) & 1) == 0)
                {
                  if (v31 == 0x2000
                    && (v592 = v25[324], *v592)
                    && (*v592 & 0xDFu) - 91 >= 0xFFFFFFE6
                    && qword_99A00 - (void)v592 == 1)
                  {
                    add_list_element();
                    uint64_t v593 = qword_99A30;
                    if (qword_99A30)
                    {
                      *(void *)qword_99A30 = *(void *)((char *)&stru_20.maxprot + (void)pLangGlb);
                      *(void *)(v593 + 8) = 1LL;
                      *(void *)(v593 + 24) = 32LL;
                    }

                    byte_999EC = 1;
                  }

                  else
                  {
                    add_seg(32LL);
                    uint64_t v606 = qword_99A00;
                    *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
                    qword_99A00 = v606 + 1;
                  }
                }
              }
            }

            else
            {
              char v390 = v215 ^ 1;
              if (nLangIDGlb != 7) {
                char v390 = 1;
              }
              if ((v390 & 1) == 0)
              {
                uint64_t v353 = 16LL;
LABEL_936:
                add_seg(v353);
                uint64_t v354 = qword_99A00;
                *(_BYTE *)qword_99A00 = 47;
                qword_99A00 = v354 + 1;
                skip_whitespace(0);
                if ((v214 & 1) == 0) {
                  goto LABEL_300;
                }
                goto LABEL_1642;
              }
            }

            uint64_t v495 = 4LL;
            goto LABEL_1707;
          }

LABEL_1004:
          add_seg(16LL);
          uint64_t v384 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
          qword_99A00 = v384 + 1;
          if ((v214 & 1) == 0) {
            goto LABEL_300;
          }
          goto LABEL_1642;
        case 0x30u:
        case 0x31u:
        case 0x32u:
        case 0x33u:
        case 0x34u:
        case 0x35u:
        case 0x36u:
        case 0x37u:
        case 0x38u:
        case 0x39u:
          add_seg(64LL);
          if (qword_99A18 == 2048)
          {
            unsigned int v29 = &unk_99000;
            uint64_t v61 = (char *)qword_99A00;
            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
            size_t v62 = off_91000;
            goto LABEL_917;
          }

          unsigned int v29 = &unk_99000;
          size_t v62 = off_91000;
          if ((byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
          {
            unsigned __int8 v144 = *(_BYTE *)qword_99A38;
            goto LABEL_682;
          }

          int v87 = nLangIDGlb;
          if (nLangIDGlb != 7)
          {
            BOOL v88 = nLangIDGlb == 9 && nSubLangIDGlb == 2;
            BOOL v89 = v88;
            if (nLangIDGlb != 10 && !v89) {
              goto LABEL_226;
            }
          }

          if (!is_lower_num((unsigned __int8 *)qword_99A38))
          {
            int v87 = nLangIDGlb;
            unsigned int v29 = &unk_99000;
LABEL_226:
            if (v87 == 9 && nSubLangIDGlb == 1)
            {
              uint64_t v90 = *(unsigned __int8 *)qword_99A38;
              if ((v90 - 58) < 0xFFFFFFF6)
              {
                v91 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v90);
                goto LABEL_915;
              }

              v272 = &asc_25F4A[v90];
LABEL_914:
              v91 = v272 - 48;
              goto LABEL_915;
            }

            uint64_t v121 = *(unsigned __int8 *)qword_99A38;
            if (v87 == 12)
            {
              if ((v121 - 58) >= 0xF6u)
              {
                v272 = &a123456789[v121];
                goto LABEL_914;
              }

              v91 = *(char **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8 * v121);
LABEL_915:
              char v148 = *v91;
              uint64_t v61 = (char *)qword_99A00;
LABEL_916:
              *uint64_t v61 = v148;
LABEL_917:
              qword_99A00 = (uint64_t)(v61 + 1);
              goto LABEL_918;
            }

            unsigned __int8 v144 = *(_BYTE *)qword_99A38;
LABEL_682:
            char v273 = upper_digit(v144);
            unsigned int v29 = (void *)&unk_99000;
            uint64_t v61 = (char *)qword_99A00;
            *(_BYTE *)qword_99A00 = v273;
            goto LABEL_917;
          }

          qword_99A18 = 128LL;
          uint64_t v145 = qword_99A38;
          unsigned int v29 = &unk_99000;
          if (*(_BYTE *)qword_99A38 == 46)
          {
            int v146 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (!*(_BYTE *)(qword_99A38 + 1)
              || (v147 = memchr(",;:!?", *(unsigned __int8 *)(qword_99A38 + 1), 6uLL), unsigned int v29 = (void *)&unk_99000, !v147)
              && (v146 != 32 || *(_BYTE *)(v145 + 2) != 45 || *(_BYTE *)(v145 + 3) != 32))
            {
              add_seg(0LL);
              unsigned int v29 = (void *)&unk_99000;
              uint64_t v61 = (char *)qword_99A00;
              char v148 = 32;
              goto LABEL_916;
            }
          }

LABEL_918:
          if (*((_DWORD *)v62 + 268) != 9 || nSubLangIDGlb == 3 || (lFlags & 0x80) != 0) {
            goto LABEL_1645;
          }
          uint64_t v347 = v29[327];
          if (!equals_nocase((unsigned __int8 *)(v347 + 1), "ST")
            || in(*(unsigned __int8 *)(v347 + 3), 11))
          {
            int v348 = equals_nocase((unsigned __int8 *)(v347 + 1), "TH");
            unsigned int v29 = (void *)&unk_99000;
            if (!v348) {
              goto LABEL_1645;
            }
            BOOL v349 = in(*(unsigned __int8 *)(v347 + 3), 11);
            unsigned int v29 = &unk_99000;
            if (v349) {
              goto LABEL_1645;
            }
            uint64_t v350 = qword_99A00;
            *(_BYTE *)qword_99A00 = 52;
            qword_99A00 = v350 + 1;
            qword_99A38 += 2LL;
            add_seg(0LL);
            goto LABEL_1644;
          }

          uint64_t v351 = qword_99A00;
          *(_BYTE *)qword_99A00 = 124;
          qword_99A00 = v351 + 1;
          qword_99A38 += 2LL;
          add_seg(0LL);
          unsigned int v29 = &unk_99000;
          goto LABEL_1645;
        case 0x3Au:
          if (v31 == 2)
          {
            unsigned int v226 = v7[1];
            if (v226 < 0x21 || v226 == 160)
            {
              int v227 = 1;
              if (number_follows(1))
              {
                v228 = (void *)&unk_99000;
                goto LABEL_903;
              }

LABEL_902:
              v228 = &unk_99000;
              goto LABEL_903;
            }
          }

          else if ((v31 & 0xC0) != 0)
          {
            v228 = &unk_99000;
            int v227 = 0;
LABEL_903:
            if (!is_mathematics() || (unint64_t)v7 <= qword_99A40 || *(v7 - 1) != 32)
            {
              add_seg(8LL);
              v346 = (_BYTE *)v228[320];
              _BYTE *v346 = 58;
              v228[320] = v346 + 1;
              goto LABEL_1644;
            }

            if (v227)
            {
LABEL_907:
              remove_whitespace(0);
              int v345 = 1;
LABEL_1184:
              if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
              {
                add_seg(32LL);
                uint64_t v448 = 0LL;
                uint64_t v449 = v228[320];
                char v450 = 33;
                do
                {
                  *(_BYTE *)(v449 + v448) = v450;
                  char v450 = asc_20333[++v448];
                }

                while (v448 != 2);
                v228[320] = v449 + 2;
                unsigned int v29 = (void *)&unk_99000;
                if ((v345 & 1) != 0) {
                  goto LABEL_1642;
                }
              }

              else
              {
                add_seg(16LL);
                v451 = (_BYTE *)v228[320];
                _BYTE *v451 = 58;
                v228[320] = v451 + 1;
                unsigned int v29 = (void *)&unk_99000;
                if (v345) {
                  goto LABEL_1642;
                }
              }

              goto LABEL_1645;
            }

LABEL_960:
            if (!timespec_follows(v7 + 1))
            {
              if (is_mathematics())
              {
                int v345 = 0;
                goto LABEL_1184;
              }

              if (nLangIDGlb == 9 && nSubLangIDGlb != 2)
              {
LABEL_1530:
                if (v31 == 2 || (unsigned int v556 = *(unsigned __int8 *)(qword_99A38 + 1), v556 < 0x21) || v556 == 160) {
LABEL_1533:
                }
                  add_seg(8LL);
                v292 = (char *)qword_99A00;
                char v293 = 58;
                goto LABEL_1419;
              }

              if (nLangIDGlb == 12 && byte_999E8 & 1 | ((lFlags & 0x40000000) == 0)) {
                goto LABEL_1530;
              }
              goto LABEL_1533;
            }

            uint64_t v363 = 32LL;
            if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
            {
              if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0) {
                goto LABEL_967;
              }
              uint64_t v363 = 4LL;
            }

            add_seg(v363);
LABEL_967:
            v364 = (_BYTE *)v228[320];
            _BYTE *v364 = 58;
            v228[320] = v364 + 1;
            unsigned int v29 = &unk_99000;
            add_seg(64LL);
            char v365 = upper_digit(0x30u);
            unsigned int v29 = (void *)&unk_99000;
            v366 = &unk_99000;
            uint64_t v367 = qword_99A00;
            *(_BYTE *)qword_99A00 = v365;
            uint64_t v368 = v367 + 1;
            goto LABEL_969;
          }

          int v227 = 0;
          goto LABEL_902;
        case 0x3Cu:
          uint64_t v154 = v7[1];
          if ((_DWORD)v154 == 61)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_999E8 & 1) == 0)
            {
              add_seg(4LL);
              v229 = (char *)qword_99A00;
              char v443 = -117;
              goto LABEL_1271;
            }

            add_seg(16LL);
            v229 = (char *)qword_99A00;
            if (nLangIDGlb == 7) {
              char v230 = 57;
            }
            else {
              char v230 = 60;
            }
LABEL_1149:
            char *v229 = v230;
            uint64_t v156 = 32LL;
LABEL_1272:
            qword_99A00 = (uint64_t)(v229 + 1);
LABEL_1273:
            add_seg(v156);
            v441 = (char *)qword_99A00;
            char v442 = 61;
LABEL_1274:
            char *v441 = v442;
            qword_99A00 = (uint64_t)(v441 + 1);
            ++qword_99A38;
            goto LABEL_1639;
          }

          if ((_DWORD)v154 == 62)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && (byte_999E8 & 1) == 0)
            {
              add_seg(4LL);
              uint64_t v476 = qword_99A00;
              *(_BYTE *)qword_99A00 = -117;
              qword_99A00 = v476 + 1;
              add_seg(4LL);
              v441 = (char *)qword_99A00;
              char v442 = -101;
            }

            else
            {
              add_seg(16LL);
              uint64_t v155 = qword_99A00 + 1;
              if (nLangIDGlb == 7)
              {
                *(_BYTE *)qword_99A00 = 33;
                qword_99A00 = v155;
                uint64_t v156 = 32LL;
                goto LABEL_1273;
              }

              *(_BYTE *)qword_99A00 = 60;
              qword_99A00 = v155;
              add_seg(32LL);
              v441 = (char *)qword_99A00;
              char v442 = 62;
            }

            goto LABEL_1274;
          }

          char v355 = byte_999E8;
          if ((byte_999E8 & 1) != 0)
          {
            int v356 = nLangIDGlb;
LABEL_1028:
            if (v356 == 7)
            {
              if (equals_nocase((unsigned __int8 *)v7 + 1, "PT56>") && in(v7[6], 9))
              {
                if (v31 == 2)
                {
                  unsigned int v564 = *(unsigned __int8 *)(qword_99A00 - 1);
                  if (v564 <= 0x20 && ((1LL << v564) & 0x180000200LL) != 0 || v564 == 160)
                  {
                    if (qword_99A28 != 16)
                    {
                      remove_whitespace(1);
                      if (byte_999E8 == 1)
                      {
                        add_seg(2LL);
                        uint64_t v565 = qword_99A00;
                        *(_BYTE *)qword_99A00 = 127;
                        qword_99A00 = v565 + 1;
                      }
                    }

LABEL_1566:
                    add_seg(32LL);
                    unsigned int v29 = &unk_99000;
                    uint64_t v566 = qword_99A00;
                    *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                    qword_99A00 = v566 + 1;
                    uint64_t v567 = qword_99A38;
                    qword_99A38 += 5LL;
                    if (byte_999E8 == 1)
                    {
                      unsigned int v570 = *(unsigned __int8 *)(v567 + 6);
                      v568 = (char *)(v567 + 6);
                      unsigned int v569 = v570;
                      if (v570)
                      {
                        do
                        {
                          if (v569 <= 0xDE && v569 - 123 <= 0xFFFFFFE5 && v569 != 173 && v569 != 30) {
                            break;
                          }
                          qword_99A38 = (uint64_t)v568;
                          add_basis_char(*v568, 0);
                          unsigned int v29 = &unk_99000;
                          v568 = (char *)(qword_99A38 + 1);
                          unsigned int v569 = *(unsigned __int8 *)(qword_99A38 + 1);
                        }

                        while (*(_BYTE *)(qword_99A38 + 1));
                      }
                    }

                    goto LABEL_1645;
                  }
                }

                else if (v31 == 16 || v31 == 0x2000 && (*(_BYTE *)(qword_99A00 - 1) & 0xDFu) - 65 < 0x1A)
                {
                  goto LABEL_1566;
                }
              }

              int v356 = 7;
            }

            goto LABEL_1575;
          }

          int v391 = number_precedes(0);
          int v356 = nLangIDGlb;
          if (v391) {
            goto LABEL_1028;
          }
LABEL_1575:
          if (!equals_nocase((unsigned __int8 *)v7 + 1, "PT")
            || (int v572 = v7[3], v571 = v7 + 3, (v572 - 58) < 0xFFFFFFF6)
            || !strchr(v571, 62))
          {
            if ((v355 & 1) == 0)
            {
              goto LABEL_1620;
            }

            if (v356 != 7) {
              goto LABEL_1625;
            }
LABEL_1590:
            if (in(v154, 9))
            {
              if (v31 == 2)
              {
                unsigned int v584 = *(unsigned __int8 *)(qword_99A00 - 1);
                if (v584 <= 0x20 && ((1LL << v584) & 0x180000200LL) != 0 || v584 == 160)
                {
                  if (qword_99A28 != 16)
                  {
                    remove_whitespace(1);
                    if (byte_999E8 == 1)
                    {
                      add_seg(2LL);
                      uint64_t v585 = qword_99A00;
                      *(_BYTE *)qword_99A00 = 127;
                      qword_99A00 = v585 + 1;
                    }
                  }

LABEL_1611:
                  add_seg(32LL);
                  unsigned int v29 = &unk_99000;
                  uint64_t v586 = qword_99A00;
                  *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                  qword_99A00 = v586 + 1;
                  if (byte_999E8 == 1)
                  {
                    v587 = (char *)(qword_99A38 + 1);
                    for (unsigned int j = *(unsigned __int8 *)(qword_99A38 + 1);
                          *(_BYTE *)(qword_99A38 + 1);
                          unsigned int j = *(unsigned __int8 *)(qword_99A38 + 1))
                    {
                      if (j <= 0xDE && j - 123 <= 0xFFFFFFE5 && j != 173 && j != 30) {
                        break;
                      }
                      qword_99A38 = (uint64_t)v587;
                      add_basis_char(*v587, 0);
                      unsigned int v29 = &unk_99000;
                      v587 = (char *)(qword_99A38 + 1);
                    }
                  }

                  goto LABEL_1645;
                }
              }

              else if (v31 == 16 || v31 == 0x2000 && (*(_BYTE *)(qword_99A00 - 1) & 0xDFu) - 65 < 0x1A)
              {
                goto LABEL_1611;
              }
            }

            if ((v355 & 1) != 0)
            {
LABEL_1625:
              remove_whitespace(0);
              char v589 = byte_999E8;
              int v356 = nLangIDGlb;
              if (byte_999E8 != 1 || nLangIDGlb != 7) {
                goto LABEL_1632;
              }
              if (*(_BYTE *)(qword_99A38 + 1) != 61) {
                goto LABEL_1636;
              }
              add_seg(32LL);
              uint64_t v307 = qword_99A00;
              __int16 v308 = 14624;
LABEL_1629:
              *(_WORD *)uint64_t v307 = v308;
              ++qword_99A38;
              *(_BYTE *)(v307 + 2) = 61;
              uint64_t v590 = v307 + 3;
            }

            else
            {
LABEL_1620:
              if (!(_DWORD)v154
                || (_DWORD)v154 != 32
                && (_DWORD)v154 != 160
                && !memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", v154, 0x15uLL))
              {
                add_seg(4LL);
                v292 = (char *)qword_99A00;
                char v293 = -117;
                goto LABEL_1419;
              }

              char v589 = 0;
LABEL_1632:
              if ((v589 & 1) == 0 && v356 == 9 && nSubLangIDGlb == 3)
              {
                add_seg(4LL);
                v522 = (char *)qword_99A00;
                char v523 = -117;
                goto LABEL_1637;
              }

LABEL_1636:
              add_seg(16LL);
              v522 = (char *)qword_99A00;
              char v523 = 60;
LABEL_1637:
              char *v522 = v523;
              uint64_t v590 = (uint64_t)(v522 + 1);
            }

            qword_99A00 = v590;
LABEL_1639:
            if ((byte_999E8 & 1) != 0) {
              goto LABEL_1642;
            }
            BOOL v117 = number_follows(1);
LABEL_1641:
            unsigned int v29 = (void *)&unk_99000;
            if (v117) {
              goto LABEL_1642;
            }
            goto LABEL_1645;
          }

          add_seg(1LL);
          unint64_t v573 = 0LL;
          for (uint64_t k = (_BYTE *)(qword_99A38 + 3); ; ++k)
          {
            qword_99A38 = (uint64_t)k;
            int v575 = *k;
            if (!*k || v575 == 62) {
              break;
            }
            char v576 = v575 - 49;
            if ((v576 & 0xF8) != 0) {
              uint64_t v577 = 0LL;
            }
            else {
              uint64_t v577 = 1 << v576;
            }
            v573 |= v577;
          }

          v578 = &brl_set_ansi[v573];
          if (pCharmapGlb) {
            v578 = (char *)(pCharmapGlb + *v578);
          }
          if (*v578 <= 0x1Fu)
          {
            uint64_t v579 = qword_99A00;
            *(_BYTE *)qword_99A00 = 32;
            qword_99A00 = v579 + 1;
LABEL_1600:
            unsigned int v29 = (void *)&unk_99000;
            goto LABEL_1645;
          }

          char v580 = brl_set_ansi[v573];
          v581 = (_BYTE *)qword_99A00;
          uint64_t v582 = qword_99A00;
          *(_BYTE *)qword_99A00 = v580;
          qword_99A00 = v582 + 1;
          if (nLangIDGlb == 12 && v573 == 8)
          {
            int v583 = is_supersub();
            unsigned int v29 = (void *)&unk_99000;
            if (v583)
            {
              byte_999EC = 1;
LABEL_1496:
              process_supersub();
              goto LABEL_1644;
            }
          }

          else
          {
            if ((nLangIDGlb - 9) > 1 || v573 != 44)
            {
              unsigned int v29 = (void *)&unk_99000;
              if (nLangIDGlb != 7 || v573 > 0x29 || ((1LL << v573) & 0x20200001000LL) == 0) {
                goto LABEL_1645;
              }
              if (!is_supersub())
              {
                unsigned int v29 = &unk_99000;
                if (((unint64_t)qword_99A28 < 3 || (qword_99A28 & 0x1E024) != 0) && (lFlags & 1) == 0)
                {
                  BOOL v688 = in(*(unsigned __int8 *)(qword_99A38 + 1), 9);
                  unsigned int v29 = (void *)&unk_99000;
                  if (v688)
                  {
                    BOOL v689 = is_mathematics();
                    unsigned int v29 = (void *)&unk_99000;
                    if (!v689)
                    {
                      v581[1] = v580;
                      qword_99A00 = (uint64_t)(v581 + 2);
                      _BYTE *v581 = stru_B8.segname[(void)pLangGlb + 3];
                    }
                  }
                }

                goto LABEL_1645;
              }

              process_supersub();
              goto LABEL_1600;
            }

            int v591 = is_supersub();
            unsigned int v29 = (void *)&unk_99000;
            if (v591) {
              goto LABEL_1496;
            }
          }

LABEL_1645:
          uint64_t v7 = (char *)(v29[327] + 1LL);
          v29[327] = v7;
          unsigned __int8 v30 = *v7;
          if (!*v7) {
            break;
          }
          continue;
        case 0x3Eu:
          if (v7[1] != 61)
          {
            char v304 = byte_999E8 ^ 1;
            if (v31 == 2) {
              char v304 = 0;
            }
            if ((v304 & 1) != 0)
            {
              add_seg(4LL);
              unsigned int v29 = (void *)&unk_99000;
              BOOL v160 = (char *)qword_99A00;
              char v161 = -101;
              goto LABEL_1463;
            }

            if ((byte_999E8 & 1) != 0 || number_precedes(1))
            {
              remove_whitespace(0);
              char v305 = byte_999E8;
              int v306 = nLangIDGlb;
              if (byte_999E8 == 1 && nLangIDGlb == 7)
              {
                if (*(_BYTE *)(qword_99A38 + 1) == 61)
                {
                  add_seg(32LL);
                  uint64_t v307 = qword_99A00;
                  __int16 v308 = 28448;
                  goto LABEL_1629;
                }

LABEL_1407:
                add_seg(16LL);
                v522 = (char *)qword_99A00;
                char v523 = 62;
                goto LABEL_1637;
              }
            }

            else
            {
              char v305 = 0;
              int v306 = nLangIDGlb;
            }

            if ((v305 & 1) == 0 && v306 == 9 && nSubLangIDGlb == 3)
            {
              add_seg(4LL);
              v522 = (char *)qword_99A00;
              char v523 = -101;
              goto LABEL_1637;
            }

            goto LABEL_1407;
          }

          if (nLangIDGlb != 9 || nSubLangIDGlb != 3 || (byte_999E8 & 1) != 0)
          {
            add_seg(16LL);
            v229 = (char *)qword_99A00;
            if (nLangIDGlb == 7) {
              char v230 = 111;
            }
            else {
              char v230 = 62;
            }
            goto LABEL_1149;
          }

          add_seg(4LL);
          v229 = (char *)qword_99A00;
          char v443 = -101;
LABEL_1271:
          char *v229 = v443;
          uint64_t v156 = 16LL;
          goto LABEL_1272;
        case 0x41u:
        case 0x42u:
        case 0x43u:
        case 0x44u:
        case 0x45u:
        case 0x46u:
        case 0x47u:
        case 0x48u:
        case 0x49u:
        case 0x4Au:
        case 0x4Bu:
        case 0x4Cu:
        case 0x4Du:
        case 0x4Eu:
        case 0x4Fu:
        case 0x50u:
        case 0x51u:
        case 0x52u:
        case 0x53u:
        case 0x54u:
        case 0x55u:
        case 0x56u:
        case 0x57u:
        case 0x58u:
        case 0x59u:
        case 0x5Au:
        case 0x8Au:
        case 0x8Cu:
        case 0xC0u:
        case 0xC1u:
        case 0xC2u:
        case 0xC3u:
        case 0xC4u:
        case 0xC5u:
        case 0xC6u:
        case 0xC7u:
        case 0xC8u:
        case 0xC9u:
        case 0xCAu:
        case 0xCBu:
        case 0xCCu:
        case 0xCDu:
        case 0xCEu:
        case 0xCFu:
        case 0xD0u:
        case 0xD1u:
        case 0xD2u:
        case 0xD3u:
        case 0xD4u:
        case 0xD5u:
        case 0xD6u:
        case 0xD8u:
        case 0xD9u:
        case 0xDAu:
        case 0xDBu:
        case 0xDCu:
        case 0xDDu:
        case 0xDEu:
          if (v30 == 72 && v31 == 64 && v7[1] - 58 >= 0xFFFFFFF6)
          {
            if (nLangIDGlb != 9 || nSubLangIDGlb == 2)
            {
              size_t v60 = &unk_99000;
              if (nLangIDGlb != 12) {
                goto LABEL_173;
              }
              if ((byte_999E8 & 1) != 0) {
                goto LABEL_210;
              }
            }

            else
            {
              size_t v60 = &unk_99000;
              if ((byte_999E8 & 1) != 0)
              {
LABEL_210:
                uint64_t v71 = (char *)qword_99A00;
                char v72 = 104;
                goto LABEL_386;
              }
            }

            if ((lFlags & 0x40000000) != 0)
            {
LABEL_173:
              add_seg(8LL);
              unsigned int v29 = (void *)&unk_99000;
              uint64_t v71 = (char *)qword_99A00;
              char v72 = 58;
              goto LABEL_386;
            }

            goto LABEL_210;
          }

          uint64_t v44 = no_abbrev();
          unsigned int v29 = (void *)&unk_99000;
          if (!v44) {
            goto LABEL_1645;
          }
          int v45 = no_locution();
          unsigned int v29 = &unk_99000;
          if (!v45) {
            goto LABEL_1645;
          }
          if (qword_99A18 != 0x2000 && (qword_99A18 != 4 || *(_BYTE *)(qword_99A38 - 1) != 45)) {
            dword_999F0 = 0;
          }
          if (byte_999E8 == 1 && nLangIDGlb == 7 && (qword_99A18 & 0xC0) != 0)
          {
            int v46 = *(unsigned __int8 *)qword_99A38;
            if (v46 == 197 || v46 == 181)
            {
              add_seg(2LL);
              uint64_t v47 = qword_99A00;
              *(_BYTE *)qword_99A00 = 127;
              qword_99A00 = v47 + 1;
            }
          }

          add_seg(0x2000LL);
          unsigned int v29 = &unk_99000;
          if (qword_99A18 == 2048) {
            goto LABEL_1074;
          }
          if (nLangIDGlb == 12 || nLangIDGlb == 9)
          {
            if ((lFlags & 0x100000) != 0 || dword_999F0) {
              goto LABEL_1072;
            }
            int v48 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (!*(_BYTE *)(qword_99A38 + 1)) {
              goto LABEL_1065;
            }
            if ((v48 + 33) <= 0xE0u && (v48 - 91) <= 0xE5u)
            {
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
                goto LABEL_1065;
              }
              if (v48 != 46)
              {
                if (v48 == 39)
                {
                  char v49 = *(_BYTE *)(qword_99A38 + 2);
                  if (v49)
                  {
                  }
                }

LABEL_1065:
                v405 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
                v406 = (char *)qword_99A00;
                if ((unsigned __int8 *)qword_99A00 == v25[324])
                {
                  int v411 = upperchar_follows(qword_99A38, 0);
                  unsigned int v29 = (void *)&unk_99000;
                  if (v411) {
                    goto LABEL_1070;
                  }
LABEL_1072:
                  int v105 = dword_99A68 + 1;
                  goto LABEL_1073;
                }

LABEL_1066:
                char v409 = *v405;
                v408 = (unsigned __int8 *)(v405 + 1);
                char v407 = v409;
                do
                {
                  *v406++ = v407;
                  int v410 = *v408++;
                  char v407 = v410;
                }

                while (v410);
                qword_99A00 = (uint64_t)v406;
                goto LABEL_1072;
              }

              unsigned int v403 = *(unsigned __int8 *)(qword_99A38 + 2);
              if (!*(_BYTE *)(qword_99A38 + 2)
                || (v403 + 33) <= 0xE0u && (v403 - 91) < 0xE6u)
              {
                goto LABEL_1065;
              }

              if (*(_BYTE *)(qword_99A38 + 3) != 46) {
                goto LABEL_1065;
              }
              unsigned int v404 = *(unsigned __int8 *)(qword_99A38 + 4);
              if (*(_BYTE *)(qword_99A38 + 4))
              {
                if (v404 > 0xDE || v404 - 123 > 0xFFFFFFE5) {
                  goto LABEL_1065;
                }
              }

              if (v403 >= 0xDF) {
                goto LABEL_1065;
              }
            }

LABEL_1063:
            v405 = *(const char **)&stru_68.sectname[(void)pLangGlb];
            dword_999F0 = 1;
            v406 = (char *)qword_99A00;
            if ((unsigned __int8 *)qword_99A00 == v25[324])
            {
LABEL_1070:
              add_list_element();
              unsigned int v29 = (void *)&unk_99000;
              uint64_t v412 = qword_99A30;
              if (qword_99A30)
              {
                size_t v413 = strlen(v405);
                unsigned int v29 = &unk_99000;
                *(void *)qword_99A30 = v405;
                *(void *)(v412 + 8) = v413;
                *(void *)(v412 + 24) = 2LL;
              }

              goto LABEL_1072;
            }

            goto LABEL_1066;
          }

          uint64_t v102 = qword_99A00 - (void)v25[324];
          if (!v102)
          {
            int v105 = dword_99A68 + 2;
LABEL_1073:
            dword_99A68 = v105;
LABEL_1074:
            uint64_t v414 = qword_99A00;
            *(_BYTE *)qword_99A00 = *(_BYTE *)v29[327];
            v415 = (_BYTE *)(v414 + 1);
            qword_99A00 = (uint64_t)v415;
            if (dword_999F0)
            {
              uint64_t v416 = v29[327];
              if (*(_BYTE *)(v416 + 1) == 45)
              {
                unsigned int v417 = *(unsigned __int8 *)(v416 + 2);
                if (v417 && (v417 <= 0xDE ? (BOOL v418 = v417 - 123 > 0xFFFFFFE5) : (BOOL v418 = 1), v418))
                {
                  if (nLangIDGlb == 9 && (nSubLangIDGlb & 0xFFFFFFFE) != 2)
                  {
                    v419 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
                    char v422 = *v419;
                    v420 = v419 + 1;
                    char v421 = v422;
                    do
                    {
                      *v415++ = v421;
                      int v423 = *v420++;
                      char v421 = v423;
                    }

                    while (v423);
                    qword_99A00 = (uint64_t)v415;
                  }
                }

                else if (nLangIDGlb != 9 || nSubLangIDGlb != 2)
                {
                  goto LABEL_1645;
                }

                dword_999F0 = 0;
              }
            }

            goto LABEL_1645;
          }

          int v103 = dword_99A68;
          if (dword_99A68 > 1) {
            goto LABEL_265;
          }
          if (v102 < 4
            || (lFlags & 0x100000) != 0
            || (unsigned __int16)lFlags == 0xFFFFLL
            || (v104 = upperchar_follows(qword_99A38, 1), unsigned int v29 = (void *)&unk_99000, v104))
          {
            if (!v103)
            {
              int v105 = 2;
              goto LABEL_1073;
            }

LABEL_265:
            int v105 = v103 + 1;
            goto LABEL_1073;
          }

          add_seg(2LL);
          uint64_t v392 = qword_99A00;
          *(_BYTE *)qword_99A00 = 33;
          qword_99A00 = v392 + 1;
          int v393 = dword_99A68;
          v394 = (void *)qword_99A30;
          v395 = memchr("CQX", **(char **)qword_99A30, 4uLL);
          if (v393)
          {
            if (!v395 || (~(_WORD)lFlags & 0x7FFE) == 0) {
              goto LABEL_1320;
            }
            v396 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
          }

          else
          {
            if (v395 && (~(_WORD)lFlags & 0x7FFE) != 0)
            {
              insert_list_element(v394, *(const char **)((char *)&stru_20.maxprot + (void)pLangGlb), 2LL);
              v394 = (void *)qword_99A30;
            }

            v396 = *(const char **)((char *)&stru_20.maxprot + (void)pLangGlb);
          }

          insert_list_element(v394, v396, 2LL);
LABEL_1320:
          add_seg(0x2000LL);
          uint64_t v493 = qword_99A00;
          *(_BYTE *)qword_99A00 = 36;
          qword_99A00 = v493 + 1;
          int v105 = 1;
          unsigned int v29 = (void *)&unk_99000;
          goto LABEL_1073;
        case 0x5Bu:
          if ((lFlags & 0x2000000) != 0 && v7[1] - 58 <= 0xFFFFFFF5)
          {
            v231 = matching_brace_pos((unsigned __int8 *)v7);
            if (v231 > (unsigned __int8 *)v7 && *v231 == 93)
            {
              add_seg(0LL);
              byte_99A58 = 1;
              goto LABEL_1644;
            }
          }

          if (byte_999E8) {
            uint64_t v262 = 16LL;
          }
          else {
            uint64_t v262 = 4LL;
          }
          add_seg(v262);
          uint64_t v263 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
          qword_99A00 = v263 + 1;
          unsigned int v264 = *(unsigned __int8 *)(qword_99A38 + 1);
          if (v264 > 0x77)
          {
            if (v264 != 160 && v264 != 120) {
              goto LABEL_1642;
            }
          }

          else if (v264 != 9 && v264 != 32)
          {
            goto LABEL_1642;
          }

          if (*(_BYTE *)(qword_99A38 + 2) != 93) {
            goto LABEL_1642;
          }
          add_seg(1LL);
          ++qword_99A38;
          uint64_t v321 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
          qword_99A00 = v321 + 1;
          if (byte_999E8) {
            uint64_t v322 = 16LL;
          }
          else {
            uint64_t v322 = 4LL;
          }
          add_seg(v322);
          unsigned int v29 = &unk_99000;
          ++qword_99A38;
          uint64_t v323 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
          qword_99A00 = v323 + 1;
          goto LABEL_1645;
        case 0x5Du:
          if (byte_99A58 == 1)
          {
            add_seg(0LL);
            byte_99A58 = 0;
            goto LABEL_1644;
          }

          remove_whitespace(0);
          if (byte_999E8) {
            uint64_t v309 = 16LL;
          }
          else {
            uint64_t v309 = 4LL;
          }
          add_seg(v309);
          v292 = (char *)qword_99A00;
          char v293 = 93;
          goto LABEL_1419;
        case 0x5Fu:
          BOOL v234 = nLangIDGlb == 9 && nSubLangIDGlb != 3 || nLangIDGlb == 12;
          if (v31 != 0x2000 || (v234 ? (BOOL v235 = dword_999F0 == 0) : (BOOL v235 = 1), v235))
          {
            add_seg(4LL);
            v310 = (_BYTE *)qword_99A00;
            if (nLangIDGlb == 9)
            {
              unsigned int v29 = &unk_99000;
              if (nSubLangIDGlb == 3)
              {
                for (int m = *(unsigned __int8 *)(qword_99A38 + 1); m == 95; int m = *(unsigned __int8 *)(v312 + 2))
                {
                  *v310++ = 95;
                  uint64_t v312 = qword_99A38++;
                }
              }
            }

            else
            {
              unsigned int v29 = (void *)&unk_99000;
            }

            _BYTE *v310 = 95;
            uint64_t v378 = (uint64_t)(v310 + 1);
LABEL_1147:
            qword_99A00 = v378;
            goto LABEL_1645;
          }

          unsigned int v236 = v7[1];
          size_t v60 = &unk_99000;
          if (!v7[1]) {
            goto LABEL_621;
          }
          if ((v236 + 33) <= 0xE0u && (v236 - 91) < 0xE6u)
          {
            if (v236 > 0xDE || (v236 - 123) >= 0xE6u)
            {
              v237 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
              v238 = (_BYTE *)qword_99A00;
              char v241 = *v237;
              v239 = v237 + 1;
              char v240 = v241;
              do
              {
                *v238++ = v240;
                int v242 = *v239++;
                char v240 = v242;
              }

              while (v242);
              qword_99A00 = (uint64_t)v238;
              dword_999F0 = 0;
            }

LABEL_621:
            add_seg(32LL);
            v243 = *(_BYTE **)&stru_2E8.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb)];
            v192 = (_BYTE *)qword_99A00;
            char v246 = *v243;
            v244 = v243 + 1;
            char v245 = v246;
            do
            {
              *v192++ = v245;
              int v247 = *v244++;
              char v245 = v247;
            }

            while (v247);
            goto LABEL_623;
          }

          v397 = *(_BYTE **)&stru_2E8.segname[*(void *)((char *)&stru_20.cmd + (void)pLangGlb)];
          v78 = (_BYTE *)qword_99A00;
          char v400 = *v397;
          v398 = v397 + 1;
          char v399 = v400;
          do
          {
            *v78++ = v399;
            int v401 = *v398++;
            char v399 = v401;
          }

          while (v401);
          goto LABEL_387;
        case 0x61u:
        case 0x62u:
        case 0x63u:
        case 0x64u:
        case 0x65u:
        case 0x66u:
        case 0x67u:
        case 0x68u:
        case 0x69u:
        case 0x6Au:
        case 0x6Bu:
        case 0x6Cu:
        case 0x6Du:
        case 0x6Eu:
        case 0x6Fu:
        case 0x70u:
        case 0x71u:
        case 0x72u:
        case 0x73u:
        case 0x74u:
        case 0x75u:
        case 0x76u:
        case 0x77u:
        case 0x78u:
        case 0x79u:
        case 0x7Au:
        case 0x9Au:
        case 0x9Cu:
        case 0xE0u:
        case 0xE1u:
        case 0xE2u:
        case 0xE3u:
        case 0xE4u:
        case 0xE5u:
        case 0xE6u:
        case 0xE7u:
        case 0xE8u:
        case 0xE9u:
        case 0xEAu:
        case 0xEBu:
        case 0xECu:
        case 0xEDu:
        case 0xEEu:
        case 0xEFu:
        case 0xF0u:
        case 0xF1u:
        case 0xF2u:
        case 0xF3u:
        case 0xF4u:
        case 0xF5u:
        case 0xF6u:
        case 0xF8u:
        case 0xF9u:
        case 0xFAu:
        case 0xFBu:
        case 0xFCu:
        case 0xFDu:
        case 0xFEu:
          if (v30 == 226)
          {
            uint64_t v51 = &unk_99000;
            if ((v7[1] & 0xFC) == 0xA0 && (v7[2] & 0xC0) == 0x80)
            {
              add_seg(1LL);
              unsigned int v29 = &unk_99000;
              unint64_t v54 = *(_BYTE *)(qword_99A38 + 2) & 0x3F | ((unint64_t)(*(_BYTE *)(qword_99A38 + 1) & 3) << 6);
              qword_99A38 += 2LL;
              int64_t v55 = &brl_set_ansi[v54];
              size_t v56 = &brl_set_ansi[v54];
              if (pCharmapGlb) {
                size_t v56 = (char *)(pCharmapGlb + *v55);
              }
              goto LABEL_688;
            }
          }

          else
          {
            uint64_t v51 = &unk_99000;
            if (v30 == 239 && v7[1] == 187 && v7[2] == 191)
            {
              add_seg(0LL);
              unsigned int v29 = &unk_99000;
              qword_99A38 += 2LL;
LABEL_127:
              int64_t v57 = (char *)qword_99A00;
              char v58 = 32;
              goto LABEL_128;
            }
          }

          if (v31 == 2)
          {
            if (qword_99A28 == 64 || qword_99A28 == 128)
            {
              if (v30 != 120)
              {
LABEL_152:
                char v59 = 0;
                goto LABEL_153;
              }

LABEL_147:
              if (is_number((unsigned __int8 *)v7 + 2) || v7[2] == 35)
              {
                remove_whitespace(0);
                add_seg(16LL);
                uint64_t v64 = (char *)qword_99A00;
                char v65 = -41;
LABEL_151:
                *uint64_t v64 = v65;
                v51[320] = v64 + 1;
                goto LABEL_1642;
              }

              char v59 = 0;
            }

            else
            {
              BOOL v63 = is_mathematics();
              char v59 = 0;
              if (v30 == 120)
              {
                unsigned int v29 = (void *)&unk_99000;
                if (!v63) {
                  goto LABEL_153;
                }
                goto LABEL_147;
              }
            }

            unsigned int v29 = (void *)&unk_99000;
LABEL_153:
            if (nLangIDGlb != 7)
            {
              if (nLangIDGlb == 9 && v30 == 115 && !in(v7[1], 11))
              {
                char v66 = nSubLangIDGlb == 1 ? v59 : 0;
                if ((v66 & 1) != 0 || v31 == 0x2000 && dword_999F0)
                {
                  add_seg(32LL);
                  uint64_t v67 = 0LL;
                  uint64_t v68 = qword_99A00;
                  char v69 = 46;
                  do
                  {
                    *(_BYTE *)(v68 + v67) = v69;
                    char v69 = aS_30[++v67];
                  }

                  while (v67 != 2);
                  qword_99A00 = v68 + 2;
                  dword_999F0 = 0;
                  goto LABEL_1644;
                }
              }

LABEL_366:
              uint64_t v134 = no_abbrev();
              unsigned int v29 = (void *)&unk_99000;
              if (!v134) {
                goto LABEL_1645;
              }
              int v135 = no_locution();
              unsigned int v29 = &unk_99000;
              if (!v135) {
                goto LABEL_1645;
              }
              size_t v60 = &unk_99000;
              if (qword_99A18 != 0x2000)
              {
                dword_999F0 = 0;
                if (nLangIDGlb == 9 && (lFlags & 0x100000) == 0)
                {
                  char v136 = *(_BYTE *)(qword_99A38 + 1);
                  if (v136)
                  {
                    if ((v136 + 33) > 0xE0u || (v136 - 91) >= 0xE6u)
                    {
                      add_seg(32LL);
                      uint64_t v137 = qword_99A00;
                      *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
                      qword_99A00 = v137 + 1;
                    }
                  }
                }
              }

              add_seg(0x2000LL);
              unsigned int v29 = &unk_99000;
              LODWORD(v138) = *(unsigned __int8 *)qword_99A38;
              if (qword_99A18 != 2048)
              {
                if (dword_999F0)
                {
                  BOOL v139 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
                  uint64_t v138 = qword_99A00;
                  char v142 = *v139;
                  v140 = v139 + 1;
                  char v141 = v142;
                  do
                  {
                    *(_BYTE *)v138++ = v141;
                    int v143 = *v140++;
                    char v141 = v143;
                  }

                  while (v143);
                  qword_99A00 = v138;
                  dword_999F0 = 0;
                  LODWORD(v138) = *(unsigned __int8 *)qword_99A38;
                }

                if ((_DWORD)v138 == 156)
                {
                  uint64_t v71 = (char *)qword_99A00;
                  char v72 = -116;
                  goto LABEL_386;
                }

                if ((_DWORD)v138 == 154)
                {
                  uint64_t v71 = (char *)qword_99A00;
                  char v72 = -118;
                  goto LABEL_386;
                }

                LOBYTE(v138) = v138 & 0xDF;
              }

          if (qword_91448 != 0x4000) {
            goto LABEL_758;
          }
          uint64_t v154 = (unsigned __int8 *)qword_99A38;
          uint64_t v155 = "'.";
          do
          {
            do
              uint64_t v156 = *v154++;
            while (v156 == 173 || v156 == 30);
            ++v155;
          }

          while (v155 != "");
          if (*(unsigned __int8 *)(qword_99A38 + 2) >= 0x21u)
          {
            bwd_add_seg(0LL);
            uint64_t v158 = qword_99A38++;
            uint64_t v159 = *(unsigned __int8 *)(v158 + 2);
            if ((_DWORD)v159 == 46)
            {
              bwd_add_seg(32LL);
              BOOL v160 = qword_99A00;
              *(_BYTE *)qword_99A00 = 46;
              char v161 = (_BYTE *)(v160 + 1);
              for (unsigned int j = qword_99A38; ; unsigned int j = qword_99A38)
              {
                int v164 = *(unsigned __int8 *)(j + 1);
                BOOL v163 = j + 1;
                if (v164 != 46) {
                  break;
                }
                qword_99A38 = v163;
                *v161++ = 46;
              }

              uint64_t v34 = &unk_99000;
            }

            else
            {
              if (!in(v159, 5))
              {
                byte_999EC = 1;
                goto LABEL_1299;
              }

              bwd_add_seg(32LL);
              uint64_t v34 = &unk_99000;
              uint64_t v351 = qword_99A00;
              *(_BYTE *)qword_99A00 = 46;
              char v161 = (_BYTE *)(v351 + 1);
            }

            qword_99A00 = (uint64_t)v161;
            bwd_add_rightchars();
            goto LABEL_405;
          }
        }

LABEL_1122:
              v432 = (_BYTE *)v60[320];
              _BYTE *v432 = v138;
              v430 = v432 + 1;
LABEL_1123:
              v60[320] = v430;
              goto LABEL_1645;
            }

            if (v31 == 4)
            {
              if (*(v7 - 1) != 181 && (byte_999E8 & 1) != 0)
              {
                int v70 = 7;
                unint64_t v31 = 4LL;
LABEL_349:
                if (v70 == 7 && v31 <= 8)
                {
                  uint64_t v127 = (unsigned __int8 *)v29[327];
                  uint64_t v128 = "gen.";
                  v129 = v127;
                  while (1)
                  {
                    do
                      int v130 = *v129++;
                    while (v130 == 173 || v130 == 30);
                    if (++v128 == "")
                    {
                      if ((lFlags & 4) != 0) {
                        goto LABEL_366;
                      }
                      int v132 = v127[4];
                      if (!v127[4]) {
                        goto LABEL_366;
                      }
                      if ((v132 + 33) <= 0xE0u && (v132 - 91) <= 0xE5u)
                      {
                        if ((v132 | 0x80) != 0xA0) {
                          goto LABEL_366;
                        }
                        unsigned __int8 v133 = v127[5];
                      }

                      v29[327] = v127 + 3;
                      add_seg(32LL);
                      uint64_t v318 = 0LL;
                      uint64_t v319 = qword_99A00;
                      char v320 = 38;
                      do
                      {
                        *(_BYTE *)(v319 + v318) = v320;
                        char v320 = aN_37[++v318];
                      }

                      while (v318 != 3);
                      v288 = (_BYTE *)(v319 + 3);
LABEL_954:
                      v51[320] = v288;
                      goto LABEL_1644;
                    }
                  }
                }

                goto LABEL_366;
              }

LABEL_186:
              BOOL v76 = (v31 & 0xC) != 0 && (unint64_t)qword_99A28 < 0x21;
              if (v31 && !v76)
              {
LABEL_194:
                int v70 = 7;
                goto LABEL_349;
              }
            }

            else
            {
              if ((byte_999E8 & 1) != 0) {
                goto LABEL_194;
              }
              if ((v31 & 0xC2) == 0) {
                goto LABEL_186;
              }
            }

            int v92 = (v31 & 0xCC) != 0 || v31 == 2 && (qword_99A28 & 0xC0) != 0 || (lFlags & 0x40) == 0;
            if (is_measurement((unsigned __int8 *)v7, v92, 0))
            {
              add_seg(32LL);
              if ((byte_999E8 & 1) == 0
                && (!qword_99A28 || no_exception(1, byte_4797F, (unsigned __int8 *)qword_99A38)))
              {
                uint64_t v122 = qword_99A00;
                *(_BYTE *)qword_99A00 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
                qword_99A00 = v122 + 1;
              }

              add_basis_char(*(char *)qword_99A38, 0);
              unsigned int v29 = &unk_99000;
              for (uint64_t n = qword_99A38; ; uint64_t n = qword_99A38)
              {
                unsigned int v126 = *(unsigned __int8 *)(n + 1);
                v124 = (char *)(n + 1);
                unsigned int v125 = v126;
                if (!v126 || v125 <= 0xDE && v125 - 123 <= 0xFFFFFFE5 && v125 != 173 && v125 != 30) {
                  break;
                }
                qword_99A38 = (uint64_t)v124;
                add_basis_char(*v124, 0);
                unsigned int v29 = &unk_99000;
              }

              goto LABEL_1645;
            }

            int v70 = nLangIDGlb;
            unint64_t v31 = qword_99A18;
            unsigned int v29 = &unk_99000;
            goto LABEL_349;
          }

          if (v31 != 64) {
            goto LABEL_152;
          }
          if (v30 != 104 || v7[1] - 58 < 0xFFFFFFF6)
          {
            char v59 = 1;
            goto LABEL_153;
          }

          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 || nLangIDGlb == 12)
          {
            if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            {
              int64_t v57 = (char *)qword_99A00;
              char v58 = 104;
              goto LABEL_128;
            }
          }

          else if (nLangIDGlb == 9 && nSubLangIDGlb == 2 && (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
          {
            add_seg(0x2000LL);
            unsigned int v29 = &unk_99000;
            int64_t v55 = (char *)qword_99A38;
LABEL_688:
            uint64_t v274 = qword_99A00;
            *(_BYTE *)qword_99A00 = *v55;
            qword_99A00 = v274 + 1;
            goto LABEL_1645;
          }

          add_seg(8LL);
          unsigned int v29 = (void *)&unk_99000;
          int64_t v57 = (char *)qword_99A00;
          char v58 = 58;
LABEL_128:
          *int64_t v57 = v58;
          v51[320] = v57 + 1;
          goto LABEL_1645;
        case 0x7Bu:
          v157 = matching_brace_pos((unsigned __int8 *)v7);
          if (v157 > (unsigned __int8 *)v7)
          {
            uint64_t v158 = (uint64_t)v157;
            if (*v157 == 125)
            {
              add_seg(0LL);
              brl_process_command((unsigned __int8 *)(qword_99A38 + 1));
              unsigned int v29 = &unk_99000;
              qword_99A38 = v158;
              goto LABEL_1645;
            }
          }

          if (byte_999E8) {
            uint64_t v275 = 16LL;
          }
          else {
            uint64_t v275 = 4LL;
          }
          add_seg(v275);
          v276 = (char *)qword_99A00;
          char v277 = 123;
          goto LABEL_931;
        case 0x7Cu:
        case 0x7Eu:
          if (byte_999E8 == 1 && nLangIDGlb == 7)
          {
            remove_whitespace(0);
            add_seg(16LL);
            int v169 = *(unsigned __int8 *)qword_99A38;
            if (v169 == 126 && *(_BYTE *)(qword_99A38 + 1) == 126)
            {
              uint64_t v170 = qword_99A00;
              *(_BYTE *)qword_99A00 = 33;
              qword_99A00 = v170 + 1;
              ++qword_99A38;
              add_seg(32LL);
              BOOL v171 = (_BYTE *)qword_99A00;
              LOBYTE(v169) = 63;
            }

            else
            {
              BOOL v171 = (_BYTE *)qword_99A00;
            }

            *BOOL v171 = v169;
            qword_99A00 = (uint64_t)(v171 + 1);
            goto LABEL_1642;
          }

          uint64_t v115 = 4LL;
LABEL_459:
          add_seg(v115);
          unsigned int v29 = &unk_99000;
          uint64_t v167 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
          qword_99A00 = v167 + 1;
          goto LABEL_1645;
        case 0x7Du:
          remove_whitespace(0);
          if (byte_999E8) {
            uint64_t v159 = 16LL;
          }
          else {
            uint64_t v159 = 4LL;
          }
          add_seg(v159);
          unsigned int v29 = (void *)&unk_99000;
          BOOL v160 = (char *)qword_99A00;
          char v161 = 125;
          goto LABEL_1463;
        case 0x7Fu:
          goto LABEL_469;
        case 0x82u:
        case 0x91u:
        case 0x92u:
          if ((v31 & 0x20C0) == 0) {
            goto LABEL_846;
          }
          unsigned __int8 v93 = v7[1];
          int v94 = (unsigned __int8 *)(v7 + 2);
          while (2)
          {
            if (in(v93, 9)) {
              goto LABEL_248;
            }
            if (!v93) {
              goto LABEL_844;
            }
            if ((v93 - 58) >= 0xF6u)
            {
LABEL_248:
              unsigned __int8 v95 = *v94++;
              unsigned __int8 v93 = v95;
              continue;
            }

            break;
          }

          if (v93 - 130 > 0x10
            || ((1 << (v93 + 126)) & 0x18001) == 0
            || (char v324 = *v94, !in(*v94, 9)) && (v324 - 58) <= 0xF5u)
          {
LABEL_844:
            if (!qword_99A48
              || *(void *)(qword_99A30 + 24) != 4LL
              || (**(unsigned __int8 **)qword_99A30 - 130 <= 0x10
                ? (BOOL v325 = ((1 << (**(_BYTE **)qword_99A30 + 126)) & 0x18001) == 0)
                : (BOOL v325 = 1),
                  v325 || (uint64_t v326 = *(void *)(qword_99A30 + 40)) == 0 || (*(_DWORD *)(v326 + 24) & 0x1E0C0) == 0))
            {
              unsigned __int8 v30 = 39;
            }
          }

LABEL_846:
          int v100 = v30;
          char v99 = -111;
LABEL_847:
          char v101 = -110;
          goto LABEL_862;
        case 0x84u:
        case 0x93u:
        case 0x94u:
          if ((v31 & 0x20C0) == 0) {
            goto LABEL_861;
          }
          unsigned __int8 v96 = v7[1];
          uint64_t v97 = (unsigned __int8 *)(v7 + 2);
          while (2)
          {
            if (in(v96, 9)) {
              goto LABEL_256;
            }
            if (!v96) {
              goto LABEL_859;
            }
            if ((v96 - 58) >= 0xF6u)
            {
LABEL_256:
              unsigned __int8 v98 = *v97++;
              unsigned __int8 v96 = v98;
              continue;
            }

            break;
          }

          if (v96 - 132 > 0x10
            || ((1 << (v96 + 124)) & 0x18001) == 0
            || (char v327 = *v97, !in(*v97, 9)) && (v327 - 58) <= 0xF5u)
          {
LABEL_859:
            if (!qword_99A48
              || *(void *)(qword_99A30 + 24) != 4LL
              || (**(unsigned __int8 **)qword_99A30 - 132 <= 0x10
                ? (BOOL v328 = ((1 << (**(_BYTE **)qword_99A30 + 124)) & 0x18001) == 0)
                : (BOOL v328 = 1),
                  v328 || (uint64_t v329 = *(void *)(qword_99A30 + 40)) == 0 || (*(_DWORD *)(v329 + 24) & 0x1E0C0) == 0))
            {
              unsigned __int8 v30 = 34;
            }
          }

LABEL_861:
          int v100 = v30;
          char v99 = -109;
          char v101 = -108;
LABEL_862:
          process_quotes(v99, v100, v101);
          goto LABEL_1644;
        case 0x8Bu:
        case 0x9Bu:
          char v99 = -111;
          int v100 = 39;
          goto LABEL_847;
        case 0x96u:
          int v248 = nLangIDGlb;
          int v249 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            byte_999EC = 0;
            dword_999F0 = 0;
          }

          uint64_t v51 = (void *)&unk_99000;
          if (byte_999E8 == 1) {
            goto LABEL_649;
          }
          int v251 = v7[1];
          if ((v251 | 2) == 0x2E) {
            goto LABEL_953;
          }
          BOOL v253 = v248 != 9 || v249 != 3;
          if (v251 == 150) {
            goto LABEL_1201;
          }
          goto LABEL_1199;
        case 0x97u:
          int v248 = nLangIDGlb;
          int v254 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
          {
            byte_999EC = 0;
            dword_999F0 = 0;
          }

          uint64_t v51 = &unk_99000;
          if (byte_999E8 == 1)
          {
LABEL_649:
            remove_whitespace(0);
            add_seg(16LL);
            uint64_t v64 = (char *)v51[320];
            char v65 = -106;
            goto LABEL_151;
          }

          int v359 = v7[1];
          if ((v359 | 2) == 0x2E)
          {
LABEL_953:
            add_seg(32LL);
            v360 = (_BYTE *)v51[320];
            _BYTE *v360 = 45;
            v288 = v360 + 1;
            goto LABEL_954;
          }

          BOOL v253 = v248 != 9 || v254 != 3;
          if (v359 == 151) {
            goto LABEL_1201;
          }
LABEL_1199:
          if (!v253)
          {
            int v313 = 150;
            goto LABEL_807;
          }

LABEL_1201:
          int v314 = v248 != 7 && v253;
          int v313 = 151;
          goto LABEL_808;
        case 0xA0u:
          BOOL v162 = nLangIDGlb != 7 || byte_999E8 == 0;
          if (v162 || (v31 & 0xC0) == 0 && ((v31 & 0x2000) == 0 || dword_99A68 || qword_99A00 - (uint64_t)v25[324] > 4))
          {
            BOOL v163 = off_91000;
          }

          else
          {
            uint64_t v289 = is_measurement((unsigned __int8 *)v7 + 1, 1, 1);
            unsigned int v29 = &unk_99000;
            BOOL v163 = off_91000;
            if (v289
              || ((uint64_t v7 = (char *)qword_99A38, v290 = *(unsigned __int8 *)(qword_99A38 + 1), v290 - 137 <= 0x3C)
                ? (BOOL v291 = ((1LL << (v290 + 119)) & 0x1000108000000001LL) == 0)
                : (BOOL v291 = 1),
                  !v291))
            {
LABEL_738:
              add_seg(2LL);
              v292 = (char *)qword_99A00;
              if (byte_99A50 == 1)
              {
                *(_BYTE *)qword_99A00 = 31;
                ++v292;
              }

              char v293 = 127;
              goto LABEL_1419;
            }

            if (*(_BYTE *)(qword_99A38 + 1))
            {
              if ((v290 > 0xDE || v290 - 123 >= 0xFFFFFFE6) && (char v603 = v7[2]) != 0)
              {
                unsigned int v29 = (void *)&unk_99000;
              }

              else
              {
                unsigned int v29 = (void *)&unk_99000;
              }
            }
          }

          int v164 = *((_DWORD *)v163 + 268);
          if (v164 == 9 && nSubLangIDGlb == 3
            || (qword_99A18 & 0xC0) == 0
            || (int v165 = v7[1], v165 != 37) && v165 != 176 && v165 != 137)
          {
            add_seg(2LL);
            uint64_t v278 = qword_99A00;
            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
            qword_99A00 = v278 + 1;
            goto LABEL_121;
          }

          if (byte_99A50 == 1)
          {
            add_seg(2LL);
            unsigned int v29 = (void *)&unk_99000;
            uint64_t v166 = qword_99A00;
            *(_BYTE *)qword_99A00 = 31;
            qword_99A00 = v166 + 1;
            int v164 = *((_DWORD *)v163 + 268);
          }

          if (byte_999E8 == 1 && v164 == 7) {
            goto LABEL_457;
          }
          goto LABEL_1645;
        case 0xA7u:
          if (nLangIDGlb != 7)
          {
            BOOL v315 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
            size_t v60 = &unk_99000;
            if (!v315)
            {
              v316 = (unsigned __int8 *)(v7 + 1);
              do
              {
                if (*v316 != 167) {
                  break;
                }
                v29[327] = v316;
              }

              while (*v316++);
            }

            add_seg(4LL);
            unsigned int v29 = (void *)&unk_99000;
            uint64_t v71 = (char *)qword_99A00;
            char v72 = -89;
            goto LABEL_386;
          }

          v256 = v29;
          add_seg(32LL);
          uint64_t v51 = &unk_99000;
          uint64_t v257 = qword_99A00;
          uint64_t v258 = qword_99A00;
          *(_BYTE *)qword_99A00 = 48;
          qword_99A00 = v258 + 1;
          v259 = (unsigned __int8 *)(v256[327] + 1LL);
          if (is_any_number(v259) || *v259 == 167)
          {
            int v260 = 1;
            goto LABEL_1643;
          }

          *(_BYTE *)(v257 + 1) = 35;
          v288 = (_BYTE *)(v257 + 2);
          goto LABEL_954;
        case 0xB2u:
        case 0xB3u:
        case 0xB9u:
        case 0xBCu:
        case 0xBDu:
        case 0xBEu:
          if (qword_99A28 == 64)
          {
            remove_whitespace(1);
            unsigned int v29 = &unk_99000;
          }

          size_t v60 = &unk_99000;
          if (nLangIDGlb == 12
            && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
            && (qword_99A18 == 64 || qword_99A18 == 2 && qword_99A28 == 64)
            && **(unsigned __int8 **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb)
                                    + 8LL * *(unsigned __int8 *)v29[327]) == stru_B8.segname[(void)pLangGlb + 3])
          {
            add_seg(128LL);
            unsigned int v29 = &unk_99000;
            v78 = (_BYTE *)qword_99A00;
            char v79 = *(_BYTE *)(v77 + 1);
            v80 = (unsigned __int8 *)(v77 + 2);
            do
            {
              *v78++ = v79;
              int v81 = *v80++;
              char v79 = v81;
            }

            while (v81);
          }

          else
          {
            add_seg(128LL);
            unsigned int v29 = &unk_99000;
            v78 = (_BYTE *)qword_99A00;
            char v85 = *v82;
            v83 = v82 + 1;
            char v84 = v85;
            do
            {
              *v78++ = v84;
              int v86 = *v83++;
              char v84 = v86;
            }

            while (v86);
          }

          goto LABEL_387;
        case 0xDFu:
          if (v31 == 0x2000
            && nLangIDGlb == 7
            && (dword_99A68 > 1
             || (char v373 = *(v7 - 1)) != 0
             && ((v373 + 33) > 0xE0u || (v373 - 91) >= 0xE6u)
             && (char v374 = v7[1]) != 0
             && ((v374 + 33) > 0xE0u || (v374 - 91) >= 0xE6u)))
          {
            ++dword_99A68;
          }

          add_seg(0x2000LL);
          uint64_t v375 = qword_99A00;
          if (nSubLangIDGlb != 2)
          {
            *(_BYTE *)qword_99A00 = -33;
            qword_99A00 = v375 + 1;
            goto LABEL_1644;
          }

          uint64_t v376 = 0LL;
          char v377 = 83;
          unsigned int v29 = (void *)&unk_99000;
          do
          {
            *(_BYTE *)(v375 + v376) = v377;
            char v377 = aSs_0[++v376];
          }

          while (v376 != 2);
          uint64_t v378 = v375 + 2;
          goto LABEL_1147;
        case 0xFFu:
          uint64_t v115 = 0x2000LL;
          goto LABEL_459;
        default:
          if (v30 < 0x20u)
          {
            uint64_t v180 = 1LL;
LABEL_749:
            v296 = (void *)&unk_99000;
            goto LABEL_996;
          }

          if ((v31 & 0xC0) == 0 || byte_999E8 == 0 || nLangIDGlb != 7)
          {
            uint64_t v180 = 4LL;
            goto LABEL_749;
          }

          v296 = &unk_99000;
          if (v30 - 137 <= 0x3C && ((1LL << (v30 + 119)) & 0x1000108000000001LL) != 0
            || v30 == 37
            || memchr("\x80$\xA5\xA2\xA3\xA4", v30, 7uLL))
          {
            add_seg(2LL);
            uint64_t v379 = qword_99A00;
            *(_BYTE *)qword_99A00 = 127;
            qword_99A00 = v379 + 1;
          }

          uint64_t v180 = 4LL;
LABEL_996:
          add_seg(v180);
          unsigned int v29 = &unk_99000;
          v380 = (_BYTE *)v296[320];
          _BYTE *v380 = *(_BYTE *)qword_99A38;
          v296[320] = v380 + 1;
          byte_999EC = 0;
          goto LABEL_1645;
      }

      break;
    }
  }

  add_seg(0LL);
  qword_999F8 = 0LL;
  qword_99A00 = qword_99A10;
  qword_99A28 = 0LL;
  byte_99A94 = 0;
  dword_99A80 = 0;
  dword_999F0 = 0;
  uint64_t v693 = qword_99A48;
  qword_99A30 = qword_99A48;
  if (qword_99A48)
  {
    v1039 = v4;
    uint64_t v694 = 0LL;
    while (1)
    {
      v695 = *(unsigned __int8 **)v693;
      v25[324] = *(unsigned __int8 **)v693;
      uint64_t v696 = *(void *)(v693 + 16);
      qword_999F8 = v696;
      v697 = *(unsigned __int8 ***)(v693 + 48);
      if (v697) {
        uint64_t v698 = (uint64_t)v697[3];
      }
      else {
        uint64_t v698 = 0LL;
      }
      qword_99A98 = v698;
      uint64_t v699 = *(void *)(v693 + 24);
      if ((v699 & 0xFFFFFFFFFFFFDF0FLL) != 0) {
        byte_99A94 = 0;
      }
      if (v699 > 127) {
        break;
      }
      if (v699 <= 15)
      {
        switch(v699)
        {
          case 0LL:
            goto LABEL_2923;
          case 1LL:
            char v702 = *v695;
            v701 = v695 + 1;
            char v700 = v702;
            do
            {
              std_char(v700);
              int v703 = *v701++;
              char v700 = v703;
            }

            while (v703);
            goto LABEL_2923;
          case 2LL:
            int v710 = nLangIDGlb;
            int v711 = dword_999F0;
            if (nLangIDGlb != 7 || !dword_999F0) {
              goto LABEL_2217;
            }
            if (lowerchar_follows(v693, 1))
            {
              v712 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
              char v715 = *v712;
              v714 = v712 + 1;
              char v713 = v715;
              do
              {
                std_char(v713);
                int v716 = *v714++;
                char v713 = v716;
              }

              while (v716);
              int v711 = 0;
              dword_999F0 = 0;
              int v710 = nLangIDGlb;
            }

            else
            {
              int v710 = nLangIDGlb;
              int v711 = dword_999F0;
LABEL_2217:
              if (v710 == 10 && v711)
              {
                int v749 = *v25[324];
                if (v749 == 9 || v749 == 160 || v749 == 32)
                {
                  int v711 = 0;
                  dword_999F0 = 0;
                }

                int v710 = 10;
                goto LABEL_2388;
              }
            }

            switch(v710)
            {
              case 9:
                uint64_t v819 = *(void *)(qword_99A30 + 48);
                if (!v819 || *(void *)(v819 + 8) != 1LL || (*(_BYTE *)(v819 + 35) & 8) == 0)
                {
                  int v710 = 9;
                  goto LABEL_2388;
                }

                break;
              case 10:
                goto LABEL_2388;
              case 12:
                break;
              default:
                v750 = (const char *)v25[324];
LABEL_2399:
                char v831 = *v750;
                v830 = (unsigned __int8 *)(v750 + 1);
                char v829 = v831;
                do
                {
                  std_char(v829);
                  int v832 = *v830++;
                  char v829 = v832;
                }

                while (v832);
                goto LABEL_2923;
            }

            v750 = (const char *)v25[324];
            v751 = pLangGlb;
            v752 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
            if (!strcmp(v750, v752))
            {
              v927 = v752;
              if (v710 != 12) {
                v927 = *(const char **)&stru_68.sectname[(void)v751];
              }
              v928 = uppersign_follows(qword_99A30, v927);
              qword_99A78 = (uint64_t)v928;
              if (v928)
              {
                if ((byte_99A90 & 1) == 0 && !v711)
                {
                  if (v710 == 9)
                  {
                  }

                  else
                  {
                    v960 = uppersign_follows((uint64_t)v928, v752);
                    if (uppersign_follows((uint64_t)v960, v752))
                    {
                      inc_string(*(_BYTE **)&stru_68.segname[(void)v751 - 8]);
                      byte_99A90 = 1;
                      goto LABEL_2923;
                    }
                  }

                  char v963 = *v750;
                  v962 = (unsigned __int8 *)(v750 + 1);
                  char v961 = v963;
                  do
                  {
                    std_char(v961);
                    int v964 = *v962++;
                    char v961 = v964;
                  }

                  while (v964);
                }
              }

              else
              {
                byte_99A90 = 0;
                if (!v711)
                {
                  char v946 = *v750;
                  v945 = (unsigned __int8 *)(v750 + 1);
                  char v944 = v946;
                  do
                  {
                    std_char(v944);
                    int v947 = *v945++;
                    char v944 = v947;
                  }

                  while (v947);
                }
              }

              goto LABEL_2923;
            }

            if (((1 << v710) & 0x1600) == 0) {
              goto LABEL_2399;
            }
LABEL_2388:
            v750 = (const char *)v25[324];
            v751 = pLangGlb;
            v820 = *(const char **)&stru_68.sectname[(void)pLangGlb];
            if (strcmp(v750, v820)) {
              goto LABEL_2399;
            }
            uint64_t v821 = qword_99A30;
            v822 = uppersign_follows(qword_99A30, v820);
            qword_99A78 = (uint64_t)v822;
            if (v822)
            {
              if (v711) {
                goto LABEL_2923;
              }
              uint64_t v823 = (uint64_t)v822;
              if (v710 == 12 || v710 == 9 && nSubLangIDGlb != 3) {
                goto LABEL_2394;
              }
              if (uppersign_follows((uint64_t)v822, v820))
              {
LABEL_2842:
                inc_string(*(_BYTE **)&stru_68.segname[(void)v751 - 8]);
                dword_999F0 = 1;
                goto LABEL_2923;
              }

              if (v710 == 9)
              {
LABEL_2394:
                v824 = uppersign_follows(v823, v820);
              }

              char v827 = *v750;
              v826 = (unsigned __int8 *)(v750 + 1);
              char v825 = v827;
              do
              {
                std_char(v825);
                int v828 = *v826++;
                char v825 = v828;
              }

              while (v828);
            }

            else
            {
              if (v710 == 9 && v711)
              {
                terminate_upper(v821);
              }

              else
              {
                char v933 = *v750;
                v932 = (unsigned __int8 *)(v750 + 1);
                char v931 = v933;
                do
                {
                  std_char(v931);
                  int v934 = *v932++;
                  char v931 = v934;
                }

                while (v934);
              }

              dword_999F0 = 0;
            }

            goto LABEL_2923;
          case 4LL:
            if (nLangIDGlb == 7)
            {
              int v717 = *v695;
              if (!*v695)
              {
                LOBYTE(v742) = 0;
                goto LABEL_2895;
              }

              if (memchr("[]\x82\x91\x92", *v695, 6uLL)
                && v694 == v698
                && (v694 & 0x1E0E4) != 0
                && ***(_BYTE ***)(v693 + 40) != 46
                && **v697 != 46)
              {
                inc_string("''");
              }

              else if (memchr("\x84\x93\x94", v717, 4uLL) {
                     && v694 == v698
              }
                     && (v694 & 0x1E0E4) != 0
                     && ***(_BYTE ***)(v693 + 40) != 46
                     && **v697 != 46)
              {
                if (v696 >= 2) {
                  qword_999F8 = v696 + 1;
                }
                uint64_t v718 = 39LL;
LABEL_2137:
                std_char(v718);
              }
            }

            else if (nLangIDGlb == 9 {
                   && nSubLangIDGlb != 2
            }
                   && ((BYTE3(lFlags) >> 6) & 1 & ~byte_999E8) == 0
                   && (v694 & 0xD0) != 0)
            {
              v732 = *(_BYTE **)(*(void *)((char *)&stru_20.cmd + (void)pLangGlb) + 8LL * *v695);
              if (*v732)
              {
                if (memchr(",;:/?+=(*)", *v732, 0xBuLL))
                {
                  if (v696 >= 2) {
                    qword_999F8 = v696 + 1;
                  }
                  uint64_t v718 = 127LL;
                  goto LABEL_2137;
                }
              }
            }

            v948 = (char *)v25[324];
            int v742 = *v948;
            if (v742 == 223 && nLangIDGlb == 7)
            {
              if ((*(_BYTE *)(qword_99A30 + 32) & 0x40) == 0)
              {
                LOBYTE(v742) = -33;
                goto LABEL_2895;
              }

              uint64_t v743 = 126LL;
              goto LABEL_2922;
            }

            if (v742 == 196 || v742 == 214)
            {
              if (nLangIDGlb != 7) {
                goto LABEL_2895;
              }
            }

            else
            {
              if (v742 != 220 || nLangIDGlb != 7) {
                goto LABEL_2895;
              }
              LOBYTE(v742) = -36;
            }

            if ((*(_BYTE *)(qword_99A30 + 32) & 0x40) != 0) {
              goto LABEL_2895;
            }
            char v950 = **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
            if (qword_999F8 >= 2) {
              ++qword_999F8;
            }
            std_char(v950);
            uint64_t v746 = *v948;
            goto LABEL_2896;
          case 8LL:
            if (nLangIDGlb == 7)
            {
              int v719 = *v695;
              if (v719)
              {
                if (memchr("()!?", v719, 5uLL))
                {
                  uint64_t v720 = *(void *)(v693 + 32);
                  if ((v720 & 4) == 0)
                  {
                    if ((v694 & 0x1E0C0) != 0
                      || (v694 & 0x24) != 0
                      && ((v939 = **(_BYTE ***)(v693 + 40), !*v939)
                       || !memchr( ".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                             *v939,
                             0x15uLL)))
                    {
                      if ((v698 & 0x1E0C0) != 0
                        || (v698 & 0x24) != 0
                        && (!**v697 || !memchr(".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", **v697, 0x15uLL)))
                      {
                        goto LABEL_2799;
                      }
                    }
                  }

                  if ((v720 & 0x42) == 0)
                  {
                    if (!v694
                      || v694 == 2
                      && ((v941 = **(_BYTE ***)(v693 + 40), !*v941)
                       || !memchr( ".,:;!?-_'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB",
                             *v941,
                             0x15uLL)))
                    {
                      if (!v698 || v698 == 2 && (**v697 | 0x80) == 0xA0) {
                        goto LABEL_2799;
                      }
                    }
                  }
                }

                if (memchr(",;:!?", v719, 6uLL))
                {
                  if ((v698 & 0x1E020) != 0)
                  {
                    if (!**v697 || !memchr(".!'><$CQXY\x7F", **v697, 0xDuLL))
                    {
LABEL_2799:
                      map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
                      goto LABEL_2800;
                    }
                  }

                  else if (v698 == 2)
                  {
                    goto LABEL_2799;
                  }
                }
              }

              if ((v694 & 0xC) == 0) {
                goto LABEL_2791;
              }
              if ((v698 & 0xC) == 0) {
                goto LABEL_2791;
              }
              if ((*(_BYTE *)(v693 + 32) & 4) != 0) {
                goto LABEL_2791;
              }
              v940 = **(_BYTE ***)(v693 + 40);
              if (!*v940
                || !memchr("({[<\x91", *v940, 6uLL)
                || !**v697
                || !memchr(")}]>\x9B", **v697, 6uLL))
              {
                goto LABEL_2791;
              }

              goto LABEL_2799;
            }

            int v733 = nSubLangIDGlb;
            BOOL v734 = nLangIDGlb == 9;
            if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
            {
              int v735 = *v695;
              if (*v695)
              {
                if (memchr(",;:!?", *v695, 6uLL)) {
                  BOOL v736 = 1;
                }
                else {
                  BOOL v736 = v735 == 46;
                }
                BOOL v734 = 1;
                int v733 = 3;
                if (v736 && (v698 & 0x1E000) != 0) {
                  goto LABEL_2799;
                }
              }

              else
              {
                BOOL v734 = 1;
                int v733 = 3;
              }
            }

            if (!v734 || v733 == 2)
            {
              BOOL v917 = v733 == 2 && v734;
              if (!v917 || (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
              {
LABEL_2791:
                escape_number((unsigned __int8 **)v693, **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb));
                goto LABEL_2800;
              }

              int v733 = 2;
            }

            else if ((byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              goto LABEL_2791;
            }

            if ((v694 & 0xD0) == 0) {
              goto LABEL_2791;
            }
            if (v733 == 2)
            {
              if (v696 >= 2) {
                qword_999F8 = v696 + 1;
              }
              uint64_t v918 = 39LL;
            }

            else
            {
              if (v696 >= 2) {
                qword_999F8 = v696 + 1;
              }
              uint64_t v918 = 127LL;
            }

            std_char(v918);
LABEL_2800:
            uint64_t v746 = (char)*v25[324];
            break;
          default:
            goto LABEL_2119;
        }

        goto LABEL_2896;
      }

      if (v699 != 16)
      {
        if (v699 == 32) {
          goto LABEL_2051;
        }
        if (v699 != 64) {
          goto LABEL_2119;
        }
        if (nLangIDGlb == 12)
        {
          if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
          {
            if ((byte_99A94 & 1) == 0)
            {
              if (v696 >= 2) {
                qword_999F8 = v696 + 1;
              }
              uint64_t v704 = 39LL;
              goto LABEL_2480;
            }

            goto LABEL_2481;
          }

          goto LABEL_2159;
        }

        BOOL v737 = nLangIDGlb == 9;
        if (nLangIDGlb == 9 && nSubLangIDGlb != 2)
        {
          if ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)
          {
            if ((byte_99A94 & 1) == 0)
            {
              if (v696 >= 2) {
                qword_999F8 = v696 + 1;
              }
              uint64_t v704 = 35LL;
LABEL_2480:
              std_char(v704);
              byte_99A94 = 1;
            }

LABEL_2481:
            v864 = v25[324];
            unsigned __int8 v867 = *v864;
            v866 = v864 + 1;
            unsigned __int8 v865 = v867;
            do
            {
              std_char((char)v865);
              int v868 = *v866++;
              unsigned __int8 v865 = v868;
            }

            while (v868);
            goto LABEL_2923;
          }

          BOOL v737 = 1;
        }

        if (v737 && nSubLangIDGlb == 3)
        {
          if ((byte_999E8 & 1) != 0) {
            goto LABEL_2481;
          }
        }

        else
        {
LABEL_2159:
          if (v694 == 128) {
            goto LABEL_2481;
          }
        }

        if (v696 >= 2) {
          qword_999F8 = v696 + 1;
        }
        std_char(35LL);
        goto LABEL_2481;
      }

      int v723 = nLangIDGlb;
      if (nLangIDGlb == 12)
      {
        if ((lFlags & 0x20000) == 0
          && (*(_BYTE *)(v693 + 32) & 2) == 0
          && ((v694 & 0xD0) == 0 || (lFlags & 0x40000000) != 0 && (byte_999E8 & 1) == 0))
        {
          if (v696 >= 2) {
            qword_999F8 = v696 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
        }

        int v742 = *v695;
        if (v742 <= 0x2E)
        {
          if (v742 == 42 || v742 == 46)
          {
LABEL_2874:
            uint64_t v743 = 42LL;
            goto LABEL_2922;
          }
        }

        else
        {
          if (v742 == 47 || v742 == 247)
          {
            if ((lFlags & 0x40000) != 0) {
              uint64_t v743 = 58LL;
            }
            else {
              uint64_t v743 = 47LL;
            }
            goto LABEL_2922;
          }

          if (v742 == 124) {
            goto LABEL_2192;
          }
        }

        goto LABEL_2895;
      }

      if (nLangIDGlb == 7)
      {
        if ((lFlags & 0x20000) == 0
          && (byte_999E8 & 1) == 0
          && v694 != 16
          && (*v695 != 46 || v698 == 2 && **v697 == 32))
        {
          if (v696 >= 2) {
            qword_999F8 = v696 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
          goto LABEL_2864;
        }

        if (v693 == qword_99A48 || v694 == 32 || v694 == 16 || v694 == 2 && ***(_BYTE ***)(v693 + 40) != 31) {
          goto LABEL_2864;
        }
        if (byte_999E8 && *v695 == 47)
        {
LABEL_2879:
          uint64_t v743 = 56LL;
          goto LABEL_2922;
        }

        if ((v694 & 0x81) != 0)
        {
          int v747 = ***(unsigned __int8 ***)(v693 + 40);
          if (v747 == 34) {
            goto LABEL_2864;
          }
          int v748 = *v695;
          if (v748 == 51)
          {
            if (v747 == 124)
            {
              LOBYTE(v742) = 51;
LABEL_2878:
              uint64_t v743 = (char)v742;
              goto LABEL_2922;
            }

LABEL_2861:
            if (v696 >= 2) {
              qword_999F8 = v696 + 1;
            }
            std_char(32LL);
            v695 = v25[324];
LABEL_2864:
            int v742 = *v695;
            if (v742 <= 0x5A)
            {
              switch(*v695)
              {
                case '(':
                  uint64_t v743 = 50LL;
                  goto LABEL_2922;
                case ')':
                  uint64_t v743 = 96LL;
                  goto LABEL_2922;
                case '*':
                case '+':
                case ',':
                case '-':
                case '0':
                case '1':
                case '2':
                  goto LABEL_2895;
                case '.':
                case '3':
                  goto LABEL_2878;
                case '/':
                  goto LABEL_2879;
                default:
                  if (v742 == 33) {
                    goto LABEL_2874;
                  }
                  goto LABEL_2895;
              }
            }

            if (*v695 > 0x7Au)
            {
              switch(*v695)
              {
                case '{':
                  uint64_t v953 = 0LL;
                  char v954 = 33;
                  do
                  {
                    std_char(v954);
                    char v954 = asc_20399[++v953];
                  }

                  while (v953 != 2);
                  break;
                case '|':
                  goto LABEL_2879;
                case '}':
                  uint64_t v955 = 0LL;
                  char v956 = 33;
                  do
                  {
                    std_char(v956);
                    char v956 = asc_1CAF7[++v955];
                  }

                  while (v955 != 2);
                  break;
                case '~':
                  uint64_t v743 = 63LL;
                  goto LABEL_2922;
                default:
                  goto LABEL_2895;
              }

              goto LABEL_2923;
            }

            switch(v742)
            {
              case '[':
LABEL_2914:
                uint64_t v743 = 123LL;
                goto LABEL_2922;
              case ']':
LABEL_2920:
                uint64_t v743 = 125LL;
                goto LABEL_2922;
              case 'o':
                goto LABEL_2878;
            }

LABEL_2895:
            uint64_t v746 = (char)v742;
            goto LABEL_2896;
          }
        }

        else
        {
          int v748 = *v695;
        }

        if ((v748 - 91) <= 0x22 && ((1LL << (v748 - 91)) & 0x500000005LL) != 0
          || (v748 - 40) < 2)
        {
          goto LABEL_2864;
        }

        goto LABEL_2861;
      }

      int v744 = nSubLangIDGlb;
      if (nSubLangIDGlb == 1)
      {
        int v745 = lFlags;
      }

      else if (nLangIDGlb != 9 {
             || nSubLangIDGlb == 2
      }
             || (int v745 = lFlags, (byte_999E8 & 1) == 0) && (lFlags & 0x40000000) != 0)
      {
        if (nSubLangIDGlb != 3)
        {
          int v742 = *v695;
          if (v742 <= 0x95)
          {
            switch(*v695)
            {
              case '*':
              case '.':
                goto LABEL_2830;
              case '+':
                uint64_t v929 = 0LL;
                char v930 = 60;
                do
                {
                  std_char(v930);
                  char v930 = asc_2168D[++v929];
                }

                while (v929 != 2);
                break;
              case '/':
                goto LABEL_2804;
              default:
                goto LABEL_2895;
            }

            goto LABEL_2923;
          }

          switch(v742)
          {
            case 150:
              std_char(60LL);
              uint64_t v746 = 4294967190LL;
              goto LABEL_2896;
            case 215:
LABEL_2830:
              uint64_t v951 = 0LL;
              char v952 = 60;
              do
              {
                std_char(v952);
                char v952 = asc_2168A[++v951];
              }

              while (v951 != 2);
              goto LABEL_2923;
            case 247:
LABEL_2804:
              uint64_t v942 = 0LL;
              char v943 = 60;
              do
              {
                std_char(v943);
                char v943 = asc_216AC[++v942];
              }

              while (v942 != 2);
              goto LABEL_2923;
          }

          goto LABEL_2895;
        }

        if ((lFlags & 0x20000) == 0)
        {
          int v742 = *v695;
          if (v742 == 61) {
            goto LABEL_2895;
          }
          if (v696 >= 2) {
            qword_999F8 = v696 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
        }

        int v742 = *v695;
        if (v742 <= 0x7B)
        {
          switch(*v695)
          {
            case '*':
            case '.':
              goto LABEL_2897;
            case '+':
              uint64_t v743 = 43LL;
              goto LABEL_2922;
            case '/':
              goto LABEL_2192;
            default:
              goto LABEL_2895;
          }
        }

        if (*v695 > 0xD6u)
        {
          if (v742 == 215)
          {
LABEL_2897:
            uint64_t v743 = 40LL;
            goto LABEL_2922;
          }

          if (v742 == 247) {
            goto LABEL_2192;
          }
        }

        else
        {
          if (v742 == 124) {
            goto LABEL_2192;
          }
          if (v742 == 150)
          {
LABEL_2836:
            uint64_t v743 = 45LL;
            goto LABEL_2922;
          }
        }

        goto LABEL_2895;
      }

      int v742 = *v695;
      if ((v745 & 0x20000) == 0)
      {
        if (v742 == 61)
        {
LABEL_2197:
          if (v723 == 9 && v744 != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            if (qword_99A00 != qword_99A10)
            {
              int v957 = *(unsigned __int8 *)(qword_99A00 - 1);
              if (v957 != 9 && v957 != 32 && v957 != 160) {
                std_char(32LL);
              }
            }

            char v958 = 36;
            for (iuint64_t i = 1LL; ii != 4; ++ii)
            {
              std_char(v958);
              char v958 = aK_16[ii];
            }

            byte_99A94 = 0;
            goto LABEL_2923;
          }

          uint64_t v746 = 61LL;
          goto LABEL_2896;
        }

        BOOL v936 = v693 != qword_99A48 && v694 == 0;
        if ((v694 & 0xD0) != 0) {
          BOOL v936 = 1;
        }
        if (nLangIDGlb != 9 || !v936 || (v745 & 0x40000000) != 0 && (byte_999E8 & 1) == 0)
        {
          if (v696 >= 2) {
            qword_999F8 = v696 + 1;
          }
          std_char(stru_B8.segname[(void)pLangGlb + 3]);
          int v742 = *v695;
        }
      }

      if (v742 <= 61)
      {
        switch(v742)
        {
          case '!':
            if (nLangIDGlb != 9
              || nSubLangIDGlb == 2
              || (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0
              || (v695[1] == 61 || !v695[1])
              && (v695[1] || !v698 || (v698 & 0x22) != 0 || v698 == 16 && ***(_BYTE ***)(v693 + 48) == 61))
            {
              goto LABEL_2923;
            }

            uint64_t v743 = 33LL;
            goto LABEL_2922;
          case '""':
          case '#':
          case '$':
          case '&':
          case '\'':
          case ',':
          case '-':
            goto LABEL_2895;
          case '%':
            if (nLangIDGlb != 9 || nSubLangIDGlb == 2 || (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              uint64_t v746 = 37LL;
              goto LABEL_2896;
            }

            uint64_t v965 = 0LL;
            char v966 = 34;
            do
            {
              std_char(v966);
              char v966 = asc_203ED[++v965];
            }

            while (v965 != 2);
            goto LABEL_2923;
          case '(':
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
              goto LABEL_2914;
            }
            uint64_t v746 = 40LL;
            goto LABEL_2896;
          case ')':
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
              goto LABEL_2920;
            }
            uint64_t v746 = 41LL;
            goto LABEL_2896;
          case '*':
          case '.':
            goto LABEL_2837;
          case '+':
            uint64_t v743 = 48LL;
            goto LABEL_2922;
          case '/':
            goto LABEL_2765;
          default:
            if (v742 != 60)
            {
              if (v742 != 61) {
                goto LABEL_2895;
              }
              int v723 = nLangIDGlb;
              int v744 = nSubLangIDGlb;
              goto LABEL_2197;
            }

            if (nLangIDGlb != 9 || nSubLangIDGlb == 2 || (byte_999E8 & 1) == 0 && (lFlags & 0x40000000) != 0)
            {
              uint64_t v746 = 60LL;
              goto LABEL_2896;
            }

            uint64_t v979 = 0LL;
            char v980 = 33;
            do
            {
              std_char(v980);
              char v980 = aK_6[++v979];
            }

            while (v979 != 2);
            break;
        }

        goto LABEL_2923;
      }

      if (v742 <= 124)
      {
        if (v742 <= 92)
        {
          if (v742 == 62)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
            {
              uint64_t v975 = 0LL;
              char v976 = 36;
              do
              {
                std_char(v976);
                char v976 = asc_215F1[++v975];
              }

              while (v975 != 2);
              goto LABEL_2923;
            }

            uint64_t v746 = 62LL;
            goto LABEL_2896;
          }

          if (v742 == 91)
          {
            if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
            {
              uint64_t v967 = 0LL;
              char v968 = 34;
              do
              {
                std_char(v968);
                char v968 = asc_20427[++v967];
              }

              while (v967 != 2);
              goto LABEL_2923;
            }

            uint64_t v746 = 91LL;
            goto LABEL_2896;
          }
        }

        else
        {
          switch(v742)
          {
            case ']':
              if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
              {
                uint64_t v971 = 0LL;
                char v972 = 34;
                do
                {
                  std_char(v972);
                  char v972 = asc_20448[++v971];
                }

                while (v971 != 2);
                goto LABEL_2923;
              }

              uint64_t v746 = 93LL;
              goto LABEL_2896;
            case '{':
              if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
              {
                uint64_t v973 = 0LL;
                char v974 = 36;
                do
                {
                  std_char(v974);
                  char v974 = asc_2613F[++v973];
                }

                while (v973 != 2);
                goto LABEL_2923;
              }

              uint64_t v746 = 123LL;
              goto LABEL_2896;
            case '|':
              goto LABEL_2765;
          }
        }

        goto LABEL_2895;
      }

      if (v742 <= 149)
      {
        if (v742 == 125)
        {
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            uint64_t v977 = 0LL;
            char v978 = 36;
            do
            {
              std_char(v978);
              char v978 = asc_26142[++v977];
            }

            while (v977 != 2);
            goto LABEL_2923;
          }

          uint64_t v746 = 125LL;
          goto LABEL_2896;
        }

        if (v742 == 137)
        {
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            char v969 = 34;
            for (junsigned int j = 1LL; jj != 4; ++jj)
            {
              std_char(v969);
              char v969 = asc_2613B[jj];
            }

            goto LABEL_2923;
          }

          uint64_t v746 = 4294967177LL;
          goto LABEL_2896;
        }

        goto LABEL_2895;
      }

      if (v742 != 150)
      {
        if (v742 == 215)
        {
LABEL_2837:
          uint64_t v743 = 49LL;
          goto LABEL_2922;
        }

        if (v742 == 247)
        {
LABEL_2765:
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0))
          {
            uint64_t v937 = 0LL;
            char v938 = 36;
            do
            {
              std_char(v938);
              char v938 = asc_26134[++v937];
            }

            while (v937 != 2);
            goto LABEL_2923;
          }

LABEL_2192:
          uint64_t v743 = 124LL;
LABEL_2922:
          std_char(v743);
          goto LABEL_2923;
        }

        goto LABEL_2895;
      }

      if (nLangIDGlb == 9 && nSubLangIDGlb != 2 && ((byte_999E8 & 1) != 0 || (lFlags & 0x40000000) == 0)) {
        goto LABEL_2836;
      }
      uint64_t v746 = 45LL;
LABEL_2896:
      map_char(v746);
LABEL_2923:
      if (qword_999F8 >= 1)
      {
        qword_999F8 = 0LL;
        std_char(30LL);
      }

      uint64_t v694 = *(void *)(qword_99A30 + 24);
      qword_99A28 = v694;
      uint64_t v693 = *(void *)(qword_99A30 + 48);
      qword_99A30 = v693;
      if (!v693)
      {
        uint64_t v4 = v1039;
        if (dword_999F0)
        {
          v981 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
          char v984 = *v981;
          v983 = v981 + 1;
          char v982 = v984;
          do
          {
            std_char(v982);
            int v985 = *v983++;
            char v982 = v985;
          }

          while (v985);
          dword_999F0 = 0;
        }

        goto LABEL_2987;
      }
    }

    if (v699 <= 2047)
    {
      if (v699 <= 511)
      {
        if (v699 == 128 || v699 == 256) {
          goto LABEL_2051;
        }
LABEL_2119:
        uint64_t v726 = *(void *)(v693 + 8);
        if (v726 >= 1)
        {
          v727 = v695 - 1;
          int v728 = 1;
          uint64_t v729 = *(void *)(v693 + 8);
          do
          {
            seg_index[v727[v729]] = v728;
            seg_start[v727[v729]] = &v727[v729];
            ++v728;
            --v729;
          }

          while (v729);
        }

        if (nLangIDGlb == 12 && bMemoryOverflow == 0)
        {
          v738 = (char *)malloc(v726 + 1);
          if (v738)
          {
            v1042 = v738;
            strcpy(v738, (const char *)v695);
          }

          else
          {
            v1042 = 0LL;
            bMemoryOverflow = 1;
          }
        }

        else
        {
          v1042 = 0LL;
        }

        v753 = &unk_99000;
        if ((*(int *)((_BYTE *)&dword_18 + (void)pLangGlb) & 0x80000000) == 0)
        {
          uint64_t v754 = 0LL;
          v755 = *(unsigned __int8 ***)((char *)&dword_10 + (void)pLangGlb);
          while (1)
          {
            uint64_t v756 = (uint64_t)v755[2];
            v757 = *v755;
            uint64_t v758 = **v755;
            uint64_t v759 = (int)seg_index[v758];
            if (v756 <= v759)
            {
              if (seg_index[v757[v756 - 1]])
              {
                if (seg_index[v757[1]])
                {
                  uint64_t v760 = qword_99A30;
                  if ((*(_DWORD *)(qword_99A30 + 32) & (_DWORD)v755[7] & 0x9000FFFF) == 0) {
                    break;
                  }
                }
              }
            }

LABEL_2238:
            v755 += 8;
            BOOL v23 = v754++ < *(int *)((char *)&dword_18 + (void)pLangGlb);
            if (!v23) {
              goto LABEL_2359;
            }
          }

          v761 = (_BYTE *)seg_start[v758];
          v753[327] = v761;
          v762 = *v755;
LABEL_2241:
          while (2)
          {
            uint64_t v763 = 1LL;
            while (1)
            {
              int v764 = v762[v763];
              if (!v762[v763]) {
                break;
              }
              int v765 = v761[v763++];
              if (v765 != v764) {
                goto LABEL_2244;
              }
            }

            v768 = &v761[v763];
            uint64_t v1040 = v761 - v25[324];
            if (v1040) {
              goto LABEL_2249;
            }
            uint64_t v770 = qword_99A28;
            int v1028 = nLangIDGlb;
            if (nLangIDGlb != 7) {
              goto LABEL_2261;
            }
            if (qword_99A28 != 8)
            {
              if (qword_99A28 != 4)
              {
LABEL_2261:
                if ((v770 & 0xC0) != 0)
                {
                  *(void *)__cc = v760;
                  v774 = v768;
                  uint64_t v775 = v770;
                  BOOL v776 = in(*v755[1], 5);
                  uint64_t v770 = v775;
                  v768 = v774;
                  uint64_t v25 = (unsigned __int8 **)&unk_99000;
                  uint64_t v760 = *(void *)__cc;
                  if (v776)
                  {
                    v753 = (void *)&unk_99000;
                    goto LABEL_2244;
                  }
                }

LABEL_2272:
                v781 = v755[6];
                v753 = (void *)&unk_99000;
                if (!*v768)
                {
                  if (*v755[1] != 45)
                  {
                    v1029 = v755[6];
                    __s = v768;
                    goto LABEL_2308;
                  }

                  if ((v770 & 0x30) != 0) {
                    goto LABEL_2244;
                  }
                  v1029 = v755[6];
                  __s = v768;
                  if (v770 != 4) {
                    goto LABEL_2308;
                  }
                  *(void *)__c = v760;
                  v785 = **(_BYTE ***)(v760 + 40);
                  if (*v785)
                  {
                    int v786 = *v785;
                    if (memchr("({[<\x91", v786, 6uLL))
                    {
                      v753 = (void *)&unk_99000;
                      goto LABEL_2308;
                    }

                    v807 = memchr(")}]>\x9B", v786, 6uLL);
                    v753 = (void *)&unk_99000;
                    if (v807)
                    {
LABEL_2308:
                      unsigned int v793 = *v762;
                      v792 = v762 + 1;
                      uint64_t v791 = v793;
                      do
                      {
                        seg_index[v791] = 0;
                        unsigned int v794 = *v792++;
                        uint64_t v791 = v794;
                      }

                      while (v794);
                      if (qword_999F8 > v1040)
                      {
                        if (qword_999F8 <= v756 + v1040) {
                          uint64_t v795 = v1040 + 1;
                        }
                        else {
                          uint64_t v795 = (uint64_t)&v755[3][qword_999F8 - v756];
                        }
                        qword_999F8 = v795;
                      }

                      v796 = v761;
                      if ((lFlags & 0x20000000) != 0)
                      {
                        v796 = v761;
                        if (v1040 >= 2)
                        {
                          v796 = v761;
                          if ((v1029 & 0x20000) != 0)
                          {
                            v796 = v761;
                            if (*(v761 - 1) != 173)
                            {
                              if (nLangIDGlb != 12
                                || (int v797 = no_exception(0, byte_47A32, v761 - 1),
                                    v753 = &unk_99000,
                                    int v798 = v797,
                                    v796 = v761,
                                    v798))
                              {
                                _BYTE *v761 = -83;
                                v796 = (void *)(v753[327] + 1LL);
                                v753[327] = v796;
                              }
                            }
                          }
                        }
                      }

                      memcpy(v796, v755[1], (size_t)v755[3]);
                      v753 = &unk_99000;
                      v759 -= (uint64_t)v755[2];
                      v799 = (char *)&v755[3][qword_99A38];
                      qword_99A38 = (uint64_t)v799;
                      if ((lFlags & 0x20000000) != 0)
                      {
                        v800 = __s;
                        if (v1040 >= 2 && (v755[6] & 0x40000) != 0)
                        {
                          BOOL v801 = *(v799 - 1) == 173 || v759 < 2;
                          if (!v801 && *__s != 173)
                          {
                            char *v799 = -83;
                            v799 = (char *)++qword_99A38;
                          }
                        }
                      }

                      else
                      {
                        v800 = __s;
                      }

                      if (v800 > v799)
                      {
                        *(void *)(qword_99A30 + 8) = &v799[*(void *)(qword_99A30 + 8)] - v761 - v763;
                        size_t v802 = strlen(v800);
                        memmove(v799, v800, v802 + 1);
                        v753 = &unk_99000;
                      }

                      uint64_t v760 = qword_99A30;
                      uint64_t v803 = *(void *)(qword_99A30 + 8);
                      if (v803 >= 1)
                      {
                        uint64_t v804 = (uint64_t)(v25[324] - 1);
                        int v805 = 1;
                        do
                        {
                          seg_index[*(unsigned __int8 *)(v804 + v803)] = v805;
                          seg_start[*(unsigned __int8 *)(v804 + v803)] = v804 + v803;
                          ++v805;
                          --v803;
                        }

                        while (v803);
                      }

                      uint64_t v756 = (uint64_t)v755[2];
                      v762 = *v755;
                      v761 = (_BYTE *)qword_99A38;
                      goto LABEL_2244;
                    }
                  }

                  uint64_t v760 = *(void *)__c;
                  goto LABEL_2244;
                }

                int v782 = *v755[1];
                if (v782 == 45)
                {
                  if ((v770 & 0x30) != 0)
                  {
                    if (**(_BYTE **)v760 != 60) {
                      goto LABEL_2244;
                    }
                  }

                  else if (v770 == 4)
                  {
                    v1029 = v755[6];
                    __s = v768;
                    v806 = **(_BYTE ***)(v760 + 40);
                    if (!*v806) {
                      goto LABEL_2244;
                    }
                    uint64_t v769 = v760;
                    int __ca = *v806;
                    if (!memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", __ca, 0xDuLL)
                      && !memchr("({[<\x91", __ca, 6uLL)
                      && !memchr(")}]>\x9B", __ca, 6uLL))
                    {
                      goto LABEL_2253;
                    }

                    goto LABEL_2356;
                  }
                }

                __s = v768;
                v1029 = v755[6];
                if (v1028 == 7 && v770 == 32 && *v755[1])
                {
                  uint64_t v769 = v760;
                  if (***(_BYTE ***)(v760 + 40) != 39 || !memchr(":+);=cqxy?(", v782, 0xCuLL)) {
                    goto LABEL_2356;
                  }
LABEL_2253:
                  v753 = (void *)&unk_99000;
LABEL_2313:
                  uint64_t v760 = v769;
                  goto LABEL_2244;
                }

                uint64_t v769 = v760;
LABEL_2356:
                v787 = v755[5];
                v788 = &v761[v756];
                int v789 = 1;
LABEL_2307:
                int v790 = no_exception(v789, v787, v788);
                v753 = (void *)&unk_99000;
                if (!v790) {
                  goto LABEL_2313;
                }
                goto LABEL_2308;
              }

              v771 = **(_BYTE ***)(v760 + 40);
              if (!*v771) {
                goto LABEL_2272;
              }
              uint64_t v1030 = qword_99A28;
              *(void *)__cb = v760;
              v772 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v771, 0xDuLL);
              uint64_t v770 = v1030;
              uint64_t v760 = *(void *)__cb;
              v768 = &v761[v763];
              if (!v772) {
                goto LABEL_2272;
              }
            }

            break;
          }

          uint64_t v773 = *(void *)(*(void *)(v760 + 40) + 40LL);
          if (v773 && (*(_DWORD *)(v773 + 24) & 0x1C000) != 0)
          {
LABEL_2249:
            if (*v768)
            {
              v753 = (void *)&unk_99000;
              goto LABEL_2251;
            }

            int v777 = nLangIDGlb;
            if (nLangIDGlb == 7)
            {
              v753 = (void *)&unk_99000;
              if (qword_99A98 == 8
                || qword_99A98 == 4
                && (v778 = **(_BYTE ***)(v760 + 48), *v778)
                && (*(void *)__cd = v760,
                    __sa = v768,
                    v779 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", *v778, 0xDuLL),
                    uint64_t v760 = *(void *)__cd,
                    v768 = __sa,
                    v753 = (void *)&unk_99000,
                    v779))
              {
                uint64_t v780 = *(void *)(*(void *)(v760 + 48) + 48LL);
                if (v780)
                {
                  if ((*(_DWORD *)(v780 + 24) & 0x1C000) != 0)
                  {
LABEL_2251:
                    v1029 = v755[6];
                    __s = v768;
                    uint64_t v769 = v760;
                    goto LABEL_2306;
                  }
                }
              }
            }

            else
            {
              v753 = (void *)&unk_99000;
            }

            int v783 = *v755[1];
            if (v777 == 12 && v783 == 63 && qword_99A98 == 8)
            {
              if (***(_BYTE ***)(v760 + 48) == 63) {
                goto LABEL_2244;
              }
              goto LABEL_2305;
            }

            if (v777 != 12 || v783 != 47) {
              goto LABEL_2305;
            }
            if ((lFlags & 0x40000) != 0 && qword_99A98 == 4)
            {
              if (***(_BYTE ***)(v760 + 48) == 46) {
                goto LABEL_2244;
              }
              goto LABEL_2305;
            }

            if ((lFlags & 0x40000) != 0 || qword_99A98 != 32 || ***(_BYTE ***)(v760 + 48) != 47)
            {
LABEL_2305:
              v1029 = v755[6];
              __s = v768;
              uint64_t v769 = v760;
LABEL_2306:
              v787 = v755[4];
              v788 = v761 - 1;
              int v789 = 0;
              goto LABEL_2307;
            }

LABEL_2244:
            v766 = (unsigned __int16 *)(v761 + 1);
            while (v759 > v756)
            {
              --v759;
              v753[327] = v766;
              int v767 = *v766;
              v766 = (unsigned __int16 *)((char *)v766 + 1);
              v762 = *v755;
              if (v767 == *(unsigned __int16 *)*v755)
              {
                v761 = (char *)v766 - 1;
                goto LABEL_2241;
              }
            }

            goto LABEL_2238;
          }

          goto LABEL_2261;
        }

LABEL_2359:
        escape_number((unsigned __int8 **)qword_99A30, 45);
        if (qword_99A98 == 32
          && ((int v808 = ***(unsigned __int8 ***)(qword_99A30 + 48), v808 != 33)
            ? (BOOL v809 = v808 == **(unsigned __int8 **)((char *)&stru_108.offset
                                                   + *(void *)((char *)&stru_20.cmd + (void)pLangGlb)))
            : (BOOL v809 = 1),
              v809)
          || qword_99A28 == 32
          && ((int v810 = ***(unsigned __int8 ***)(qword_99A30 + 40), v810 != 33)
            ? (BOOL v811 = v810 == **(unsigned __int8 **)((char *)&stru_108.offset
                                                   + *(void *)((char *)&stru_20.cmd + (void)pLangGlb)))
            : (BOOL v811 = 1),
              v811))
        {
          char v812 = 0;
          v813 = off_91000;
          v814 = v1042;
        }

        else
        {
          __int16 v815 = lFlags;
          v814 = v1042;
          if ((lFlags & 0x1000) == 0 && equals_zweiformig(*(const char **)qword_99A30, lFlags)
            || (nLangIDGlb == 9 || nLangIDGlb == 12)
            && (v815 & 0x4000) == 0
            && equals_mehrformig(qword_99A30))
          {
            if (qword_999F8 >= 2) {
              ++qword_999F8;
            }
            map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
            v813 = off_91000;
            if (v1042)
            {
              v817 = (unsigned __int8 *)(v1042 + 1);
              char v816 = *v1042;
              do
              {
                map_char(v816);
                int v818 = *v817++;
                char v816 = v818;
              }

              while (v818);
              char v812 = 1;
            }

            else
            {
              char v812 = 0;
            }
          }

          else
          {
            char v812 = 0;
            v813 = off_91000;
          }
        }

        uint64_t v919 = qword_99A30;
        if (*(uint64_t *)(qword_99A30 + 8) < 1)
        {
LABEL_2703:
          if (v814) {
            free(v1042);
          }
          goto LABEL_2923;
        }

        uint64_t v920 = 0LL;
        v921 = v25[324];
        while (1)
        {
          seg_index[*v921] = 0;
          if ((v812 & 1) == 0)
          {
            int v922 = *((_DWORD *)v813 + 268);
            unsigned int v923 = *v921;
            if (v922 == 9 && nSubLangIDGlb == 3 && byte_999E8 != 0)
            {
              if (!*v921) {
                goto LABEL_2702;
              }
              if (v920 && (v923 - 97) <= 9u)
              {
                if (qword_999F8 >= 2) {
                  ++qword_999F8;
                }
                map_char(**(char **)((char *)&stru_20.maxprot + (void)pLangGlb));
                uint64_t v926 = (char)*v921;
LABEL_2699:
                map_char(v926);
                goto LABEL_2702;
              }
            }

            if (*v921 > 0x57u)
            {
              switch(v923)
              {
                case 0x58u:
                  if (v922 == 7 && (~*(_DWORD *)(v919 + 32) & 0x14LL) == 0)
                  {
                    uint64_t v926 = 120LL;
                    goto LABEL_2701;
                  }

                  uint64_t v926 = 88LL;
                  goto LABEL_2699;
                case 0x59u:
                  if (v922 == 7 && (~*(_DWORD *)(v919 + 32) & 0x84LL) == 0)
                  {
                    uint64_t v926 = 121LL;
                    goto LABEL_2701;
                  }

                  uint64_t v926 = 89LL;
                  goto LABEL_2699;
                case 0xDFu:
                  if (v922 == 7 && (~*(_DWORD *)(v919 + 32) & 0x1CLL) == 0)
                  {
                    uint64_t v926 = 126LL;
                    goto LABEL_2701;
                  }

                  uint64_t v926 = 4294967263LL;
                  goto LABEL_2699;
              }

LABEL_2692:
              uint64_t v926 = (char)v923;
              goto LABEL_2699;
            }

            if (*v921)
            {
              if (v923 == 67)
              {
                if (v922 == 7 && (*(_BYTE *)(v919 + 32) & 4) != 0)
                {
                  uint64_t v926 = 99LL;
                  goto LABEL_2701;
                }

                uint64_t v926 = 67LL;
                goto LABEL_2699;
              }

              if (v923 == 81)
              {
                if (v922 == 7 && (~*(_DWORD *)(v919 + 32) & 0xCLL) == 0)
                {
                  uint64_t v926 = 113LL;
LABEL_2701:
                  std_char(v926);
                  goto LABEL_2702;
                }

                uint64_t v926 = 81LL;
                goto LABEL_2699;
              }

              goto LABEL_2692;
            }
          }

LABEL_2702:
          v921 = v25[324] + 1;
          v25[324] = v921;
          uint64_t v919 = qword_99A30;
          if (++v920 >= *(void *)(qword_99A30 + 8)) {
            goto LABEL_2703;
          }
        }
      }

      if (v699 != 512)
      {
        if (v699 == 1024)
        {
          int v705 = dword_999F0;
          int v706 = lowerchar_follows(v693, dword_999F0);
          int v707 = v706;
          if (v705)
          {
            escape_number((unsigned __int8 **)v693, **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb));
          }

          else
          {
            if (v706) {
              v739 = *(_BYTE **)&stru_68.sectname[(void)pLangGlb];
            }
            else {
              v739 = *(_BYTE **)&stru_68.segname[(void)pLangGlb - 8];
            }
            inc_string(v739);
          }

          char v857 = *v695;
          do
          {
            add_basis_char(v857, 1);
            v858 = (char *)(v25[324] + 1);
            v25[324] = (unsigned __int8 *)v858;
            char v857 = *v858;
          }

          while (*v858);
          if (v707 && dword_999F0)
          {
            v859 = *(_BYTE **)&stru_68.segname[(void)pLangGlb];
            char v862 = *v859;
            v861 = v859 + 1;
            char v860 = v862;
            do
            {
              std_char(v860);
              int v863 = *v861++;
              char v860 = v863;
            }

            while (v863);
          }

          dword_999F0 = v707 == 0;
          goto LABEL_2923;
        }

        goto LABEL_2119;
      }

      unsigned int v724 = *v695;
      else {
        BOOL v725 = 0;
      }
      while (1)
      {
        if ((_BYTE)v724)
        {
          if ((v724 + 33) > 0xE0u || (v724 - 91) >= 0xE6u)
          {
            v844 = v695 + 1;
            int v843 = (char)v695[1];
            if (v695[1])
            {
              unsigned int v845 = v695[1];
              if ((v845 > 0xDE || (v843 - 123) >= 0xE6u)
                && v845 != 45
                && (v845 != 100 || (unsigned int v846 = v695[2]) != 0 && (v846 > 0xDE || v846 - 123 >= 0xFFFFFFE6))
                && (!memchr("bcdfgkpt", v843, 9uLL) || v695[2] != 114))
              {
                v847 = "ler";
                while (1)
                {
                  do
                    int v848 = *v844++;
                  while (v848 == 173 || v848 == 30);
                  if (++v847 == "") {
                    goto LABEL_2456;
                  }
                }

                v850 = (char *)(v695 + 2);
                while (v845 == 30 || v845 == 173)
                {
                  char v851 = *v850++;
                  LOBYTE(v845) = v851;
                }

                if (v845 != 115)
                {
                  v833 = *(_BYTE **)((char *)&stru_20.filesize + (void)pLangGlb);
                  char v836 = *v833;
                  v835 = v833 + 1;
                  char v834 = v836;
                  do
                  {
                    if (qword_999F8 >= 2) {
                      ++qword_999F8;
                    }
                    std_char(v834);
                    BOOL v725 = 0;
                    int v837 = *v835++;
                    char v834 = v837;
                  }

                  while (v837);
                  goto LABEL_2462;
                }
              }
            }

LABEL_2456:
            if (!v725)
            {
              v852 = *(_BYTE **)&stru_68.sectname[(void)pLangGlb];
              char v855 = *v852;
              v854 = v852 + 1;
              char v853 = v855;
              do
              {
                if (qword_999F8 >= 2) {
                  ++qword_999F8;
                }
                std_char(v853);
                int v856 = *v854++;
                char v853 = v856;
              }

              while (v856);
            }

LABEL_2461:
            BOOL v725 = 1;
            goto LABEL_2462;
          }

          if (v725)
          {
            goto LABEL_2461;
          }
        }

        else if (v725)
        {
LABEL_2428:
          v838 = *(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb);
          char v841 = *v838;
          v840 = v838 + 1;
          char v839 = v841;
          do
          {
            if (qword_999F8 >= 2) {
              ++qword_999F8;
            }
            std_char(v839);
            int v842 = *v840++;
            char v839 = v842;
          }

          while (v842);
          BOOL v725 = 0;
        }

LABEL_2462:
        add_basis_char((char)*v695, 1);
        v695 = v25[324] + 1;
        v25[324] = v695;
        LOBYTE(v724) = *v695;
        if (!*v695) {
          goto LABEL_2923;
        }
      }
    }

    if (v699 < 0x200000)
    {
      if (v699 != 2048)
      {
        if (v699 == 4096) {
          goto LABEL_2051;
        }
        goto LABEL_2119;
      }

      int v721 = *v695;
      if (v721 == 39 || v721 == 36)
      {
        v722 = off_91000;
        if (v695[1] == 36)
        {
          dword_99A80 = v721 == 36;
          if (nLangIDGlb != 12)
          {
            if (nLangIDGlb == 7)
            {
              std_char((char)*v695);
              std_char((char)v695[1]);
              v695 = v25[324];
LABEL_2508:
              v25[324] = v695 + 2;
              int v721 = v695[2];
              v695 += 2;
              goto LABEL_2509;
            }

            if (nLangIDGlb != 9 || nSubLangIDGlb == 1)
            {
              unsigned __int8 v869 = v695[2];
              if (v869 && ((v869 + 33) > 0xE0u || (v869 - 91) >= 0xE6u))
              {
                unsigned __int8 v870 = v695[3];
                if (v870)
                {
                }
              }
            }
          }

          BOOL v872 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
          if (v721 == 36)
          {
            if (v872) {
              inc_string("!{");
            }
            v873 = *(_BYTE **)((char *)&stru_68.reloff + (void)pLangGlb);
          }

          else
          {
            if (v872) {
              inc_string(">{");
            }
            v873 = *(_BYTE **)((char *)&stru_68.offset + (void)pLangGlb);
          }

          inc_string(v873);
          goto LABEL_2508;
        }
      }

      else
      {
        v722 = off_91000;
      }

LABEL_2509:
      if (v721)
      {
        int v874 = 0;
        do
        {
          if (v721 < 0x20u
            || v721 - 150 <= 0x17 && ((1 << (v721 + 106)) & 0x800403) != 0)
          {
            uint64_t v875 = (char)v721;
          }

          else
          {
            v876 = v695;
            v877 = "'.";
            while (1)
            {
              do
                int v878 = *v876++;
              while (v878 == 173 || v878 == 30);
              if (++v877 == "")
              {
                if (*((_DWORD *)v722 + 268) != 7)
                {
                  v25[324] = v695 + 1;
                  goto LABEL_2516;
                }

                v880 = pLangGlb;
                if (!*(void *)&stru_20.segname[(void)pLangGlb])
                {
LABEL_2551:
                  unint64_t v886 = 0LL;
                  while (brl_set_ansi[v886] != v721)
                  {
                    if (++v886 == 256)
                    {
                      LOBYTE(v886) = 0;
                      goto LABEL_2573;
                    }
                  }

                  if ((v886 & 0xC0) != 0)
                  {
                    uint64_t v895 = (v886 >> 2) & 0x20 | (v886 >> 3) & 8;
                    goto LABEL_2572;
                  }

                  if (v886 <= 0x28 && ((1LL << v886) & 0x10100000100LL) != 0)
                  {
                    v897 = v695;
                    v898 = "'.";
                    while (1)
                    {
                      do
                        int v899 = *v897++;
                      while (v899 == 173 || v899 == 30);
                      if (++v898 == "") {
                        goto LABEL_2573;
                      }
                    }

                    uint64_t v895 = v886 & 0x3F;
LABEL_2572:
                    std_char(brl_set_ansi[v895]);
                  }

LABEL_2573:
                  if (*v695 != 45 || (lFlags & 0x20000000) == 0)
                  {
                    uint64_t v875 = brl_set_ansi[v886 & 0x3F];
                    goto LABEL_2515;
                  }

LABEL_2576:
                  uint64_t v875 = 4294967190LL;
                  goto LABEL_2515;
                }

LABEL_2529:
                if (v874)
                {
                  if (v721 <= 0xDEu && (v721 - 123) < 0xE6u)
                  {
                    BOOL v881 = v721 > 0x20u;
                    int v874 = nSubLangIDGlb != 1 || v881;
                    goto LABEL_2565;
                  }

                  v888 = *(_BYTE **)&stru_B8.sectname[(void)v880];
LABEL_2563:
                  inc_string(v888);
LABEL_2564:
                  int v874 = 0;
                }

                else
                {
                  if (nSubLangIDGlb == 1)
                  {
                    unsigned __int8 v887 = v695[1];
                    if (!v887 || (v887 + 33) <= 0xE0u && (v887 - 91) < 0xE6u)
                    {
                      v888 = *(_BYTE **)((char *)&stru_68.reserved2 + (void)v880);
                      goto LABEL_2563;
                    }

                    v896 = *(_BYTE **)((char *)&stru_68.flags + (void)v880);
                  }

                  else
                  {
                    v896 = *(_BYTE **)((char *)&stru_68.reserved2 + (void)v880);
                  }

                  inc_string(v896);
                  int v874 = 1;
                }

LABEL_2565:
                uint64_t v889 = *v695;
                if (v889 == 45 && (lFlags & 0x20000000) != 0) {
                  goto LABEL_2576;
                }
                v890 = *(_BYTE **)(*(void *)&stru_20.segname[(void)pLangGlb] + 8 * v889);
                char v893 = *v890;
                v892 = v890 + 1;
                char v891 = v893;
                do
                {
                  std_char(v891);
                  int v894 = *v892++;
                  char v891 = v894;
                }

                while (v894);
                goto LABEL_2516;
              }
            }

            v880 = pLangGlb;
            if (*(void *)&stru_20.segname[(void)pLangGlb]) {
              goto LABEL_2529;
            }
            if (*((_DWORD *)v722 + 268) != 12) {
              goto LABEL_2551;
            }
            if ((v721 + 33) > 0xE0u || (v721 - 91) >= 0xE6u)
            {
              uint64_t v882 = 1LL;
              do
              {
                uint64_t v883 = v882;
                unsigned int v884 = v695[v882];
                if (!v695[v882])
                {
                  if (v882 < 3) {
                    goto LABEL_2597;
                  }
                  goto LABEL_2589;
                }

                ++v882;
              }

              while ((v884 - 58) > 0xF5u
                   || (v884 + 33) > 0xE0u
                   || (v884 - 91) > 0xE5u);
              if (v884 > 0xDE) {
                goto LABEL_2597;
              }
              do
              {
LABEL_2589:
                unsigned __int8 v901 = v695[v883];
                --v883;
              }

              while (v883);
              if (qword_999F8 >= 2) {
                ++qword_999F8;
              }
              std_char(36LL);
              LOBYTE(v721) = *v25[324];
            }

LABEL_2597:
            uint64_t v902 = 0LL;
            while (brl_set_tbfr2007[v902] != v721)
            {
              if (++v902 == 256)
              {
                LOBYTE(v902) = 0;
                break;
              }
            }

            uint64_t v903 = 0LL;
            while (brl_set_ansi[v903] != v902)
            {
              if (++v903 == 256) {
                goto LABEL_2516;
              }
            }

            int v904 = v903 & 0xC0;
            switch(v904)
            {
              case 192:
                uint64_t v875 = 33LL;
                break;
              case 128:
                uint64_t v875 = 34LL;
                break;
              case 64:
                uint64_t v875 = 36LL;
                break;
              default:
                goto LABEL_2516;
            }
          }

LABEL_2515:
          std_char(v875);
LABEL_2516:
          v695 = v25[324] + 1;
          v25[324] = v695;
          LOBYTE(v721) = *v695;
        }

        while (*v695);
      }

      unsigned int v905 = *((_DWORD *)v722 + 268);
      BOOL v23 = v905 > 0xC;
      int v906 = (1 << v905) & 0x1600;
      if (!v23 && v906 != 0)
      {
        v908 = *(_BYTE **)&stru_B8.segname[(void)pLangGlb - 8];
        char v911 = *v908;
        v910 = v908 + 1;
        char v909 = v911;
        do
        {
          std_char(v909);
          int v912 = *v910++;
          char v909 = v912;
        }

        while (v912);
        if (dword_99A80) {
          BOOL v913 = nLangIDGlb == 9;
        }
        else {
          BOOL v913 = 0;
        }
        if (v913 && nSubLangIDGlb == 3)
        {
          uint64_t v915 = 0LL;
          char v916 = 33;
          do
          {
            std_char(v916);
            char v916 = asc_1CAF7[++v915];
          }

          while (v915 != 2);
        }

        dword_99A80 = 0;
      }

      goto LABEL_2923;
    }

    if (v699 != 0x200000 && v699 != 0x400000) {
      goto LABEL_2119;
    }
LABEL_2051:
    escape_number((unsigned __int8 **)v693, **(_BYTE **)((char *)&stru_20.maxprot + (void)pLangGlb));
    if (nLangIDGlb == 7)
    {
      if (*(void *)(v693 + 24) == 32LL)
      {
        v708 = *(unsigned __int8 **)v693;
        if (byte_999E8 == 1)
        {
          v709 = "'.";
          goto LABEL_2060;
        }

        v731 = "!,";
        goto LABEL_2166;
      }
    }

    else
    {
      if (nLangIDGlb != 9 || nSubLangIDGlb != 3)
      {
        if (nLangIDGlb == 12 && *(void *)(v693 + 24) == 256LL)
        {
          if (qword_999F8 >= 2) {
            ++qword_999F8;
          }
          std_char(33LL);
        }

        goto LABEL_2168;
      }

      if (*(void *)(v693 + 24) == 32LL)
      {
        v708 = *(unsigned __int8 **)v693;
        if (byte_999E8 == 1)
        {
          v709 = "#.";
LABEL_2060:
          goto LABEL_2168;
        }

        v731 = "## ";
LABEL_2166:
        goto LABEL_2168;
      }
    }

    do
    {
LABEL_2168:
      BOOL v740 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
      if (v740 && *(void *)(qword_99A30 + 24) == 256LL)
      {
        if (qword_999F8 >= 2) {
          ++qword_999F8;
        }
        std_char(33LL);
      }

      v741 = (char *)v25[324];
      std_char(*v741);
      v25[324] = (unsigned __int8 *)(v741 + 1);
    }

    while (v741[1]);
    goto LABEL_2923;
  }

LABEL_2987:
  if (byte_99A54 == 1)
  {
    if (byte_999E8 == 1)
    {
      close_math_passage(1LL);
    }

    else if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
    {
      uint64_t v989 = 0LL;
      char v990 = 60;
      do
      {
        std_char(v990);
        char v990 = asc_26113[++v989];
      }

      while (v989 != 2);
    }

    else if (nLangIDGlb == 7)
    {
      uint64_t v987 = 0LL;
      char v988 = 39;
      do
      {
        std_char(v988);
        char v988 = asc_25B8C[++v987];
      }

      while (v987 != 2);
    }

    byte_99A54 = 0;
  }

  if (dword_99A80)
  {
    v991 = *(_BYTE **)&stru_B8.segname[(void)pLangGlb - 8];
    char v994 = *v991;
    v993 = v991 + 1;
    char v992 = v994;
    do
    {
      std_char(v992);
      int v995 = *v993++;
      char v992 = v995;
    }

    while (v995);
    dword_99A80 = 0;
  }

  uint64_t v996 = qword_99A48;
  if (qword_99A48)
  {
    do
    {
      v997 = (void *)v996;
      uint64_t v996 = *(void *)(v996 + 48);
      qword_99A48 = v996;
      free(v997);
    }

    while (v996);
    qword_99A30 = (uint64_t)v997;
  }

  free((void *)qword_99A88);
  qword_99A88 = 0LL;
  uint64_t v998 = qword_99A00;
  *(_BYTE *)qword_99A00 = 0;
  uint64_t v999 = qword_99A08;
  if (v998 == qword_99A08) {
    return 111LL;
  }
  if (bMemoryOverflow) {
    return 8LL;
  }
  v1000 = &unk_99000;
  if (v4)
  {
    qword_999F8 = 0LL;
    v1001 = (unsigned __int8 *)qword_99A40;
    qword_99A38 = qword_99A40;
    v1002 = (char *)qword_99A10;
    qword_99A00 = qword_99A10;
    if (qword_99A10 != qword_99A08)
    {
      uint64_t v1003 = 0LL;
      uint64_t v1004 = 0LL;
      uint64_t v1005 = 0LL;
      do
      {
        unsigned int v1006 = *v1002;
        if (!*v1002 || v1006 < 0x21 || v1006 == 160)
        {
          unsigned int v1008 = *v1001;
          if (*v1001)
          {
            int64_t v1009 = 0LL;
            v1010 = v1001 + 1;
            while (v1008 >= 0x21 && v1008 != 160)
            {
              v1000[327] = &v1010[v1009];
              int64_t v1011 = v1009 + 1;
              unsigned int v1008 = v1010[v1009++];
              if (!v1008) {
                goto LABEL_3028;
              }
            }

            int64_t v1011 = v1009;
          }

          else
          {
            int64_t v1011 = 0LL;
          }

LABEL_3028:
          v1012 = v4;
          unint64_t v1013 = v1011;
          if (v1004 >= 2) {
            unint64_t v1013 = v1011 / (v1004 - 1);
          }
          v1043 = (void *)v1004;
          uint64_t v1014 = v1003 + v1011;
          uint64_t v1015 = v1003 + v1011 - 1;
          if (v1013 <= 1) {
            uint64_t v1016 = 1LL;
          }
          else {
            uint64_t v1016 = v1013;
          }
          uint64_t v1017 = qword_99A10;
          v1018 = &v1002[-qword_99A10];
          while (v1005 < (uint64_t)v1018)
          {
            v1012[v1005] = v1003;
            if (!*(_BYTE *)(v1017 + v1005)
              || (v1019 = memchr("#!'><$\x7F", *(unsigned __int8 *)(v1017 + v1005), 9uLL),
                  v1000 = (void *)&unk_99000,
                  !v1019))
            {
              v1003 += v1016;
              qword_999F8 = v1003;
            }

            if (v1003 >= v1014)
            {
              qword_999F8 = v1015;
              uint64_t v1003 = v1015;
            }

            ++v1005;
          }

          uint64_t v4 = v1012;
          unsigned int v1020 = *v1002;
          if (!*v1002)
          {
LABEL_3061:
            v1012[v1005] = v1015;
            break;
          }

          while (v1020 < 0x21 || v1020 == 160)
          {
            if (v1020 == 31)
            {
              size_t v1021 = strlen(v1002);
              memmove(v1002, v1002 + 1, v1021);
              v1000 = (void *)&unk_99000;
              v1002 = (char *)qword_99A00;
            }

            else
            {
              LODWORD(v1015) = v1015 + 1;
              v1012[v1005++] = v1015;
              qword_99A00 = (uint64_t)++v1002;
            }

            unsigned int v1020 = *v1002;
            if (!*v1002) {
              goto LABEL_3061;
            }
          }

          v1001 = (unsigned __int8 *)v1000[327];
          unsigned int v1022 = *v1001;
          if (*v1001)
          {
            v1023 = v1001 + 1;
            do
            {
              if (v1022 >= 0x21 && v1022 != 160) {
                break;
              }
              v1000[327] = v1023;
              unsigned int v1024 = *v1023++;
              unsigned int v1022 = v1024;
            }

            while (v1024);
            v1001 = v1023 - 1;
          }

          uint64_t v1003 = (uint64_t)&v1001[-qword_99A40];
          qword_999F8 = (uint64_t)&v1001[-qword_99A40];
          uint64_t v999 = qword_99A08;
          uint64_t v1004 = 0LL;
        }

        else
        {
          v1007 = memchr("#!'><$\x7F", v1006, 9uLL);
          v1000 = (void *)&unk_99000;
          if (!v1007) {
            ++v1004;
          }
          qword_99A00 = (uint64_t)++v1002;
        }
      }

      while (v1002 != (char *)v999);
    }
  }

  if (!(nEncodingGlb | bUpShiftGlb)) {
    return 0LL;
  }
  v1025 = (_BYTE *)qword_99A10;
  unsigned int v1026 = *(unsigned __int8 *)qword_99A10;
  if (*(_BYTE *)qword_99A10)
  {
    do
    {
      if (pCharmapGlb
        && v1026 >= 0x21
        && v1026 != 160
        && (v1026 - 150 > 0x17 || ((1 << (v1026 + 106)) & 0x800003) == 0))
      {
        LOBYTE(v1026) = *(_BYTE *)(pCharmapGlb + v1026);
        _BYTE *v1025 = v1026;
      }

      if (bUpShiftGlb)
      {
      }

      unsigned int v1027 = *++v1025;
      unsigned int v1026 = v1027;
    }

    while (v1027);
  }

  uint64_t result = 0LL;
  qword_99A00 = (uint64_t)v1025;
  return result;
}

uint64_t backward_disabled(unsigned __int8 *a1)
{
  int v1 = *(int *)((char *)&dword_8 + (void)pBwdLangGlb);
  if (v1 < 0) {
    return 1LL;
  }
  uint64_t v3 = a1 - 1;
  uint64_t v4 = a1 + 1;
  int v5 = (unsigned __int8 **)(*pBwdLangGlb + 4);
  int v6 = v1 + 1;
  while (*(v5 - 2) != (_BYTE *)&dword_0 + 1
       || **(v5 - 4) != *a1
       || !no_exception(0, *v5, v3)
       || !no_exception(1, v5[1], v4))
  {
    v5 += 8;
    if (!--v6) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t bwd_fetch_char(char *a1, char *__s1, int a3, int a4)
{
  if (*__s1 == stru_B8.segname[(void)pLangGlb + 3])
  {
    int v8 = __s1[1];
    *a1 = v8;
    switch(nLangIDGlb)
    {
      case 12:
        if (v8 != 58)
        {
          if (v8 != 124) {
            goto LABEL_28;
          }
          char v9 = __s1[2];
          if (!memchr("123", v9, 4uLL) || __s1[3] && memchr("#123456789", __s1[3], 0xBuLL))
          {
            LOBYTE(v8) = 32;
          }

          else
          {
            if (v9 == 51) {
              char v21 = -77;
            }
            else {
              char v21 = -71;
            }
            if (v9 == 50) {
              LOBYTE(v8) = -78;
            }
            else {
              LOBYTE(v8) = v21;
            }
          }

          goto LABEL_27;
        }

        goto LABEL_24;
      case 9:
        if (nSubLangIDGlb == 1)
        {
          if (v8 <= 48)
          {
            if (v8 == 47)
            {
              LOBYTE(v8) = 36;
            }

            else
            {
              if (v8 != 48) {
                goto LABEL_28;
              }
              LOBYTE(v8) = 43;
            }

            goto LABEL_27;
          }

          if (v8 == 124) {
            goto LABEL_24;
          }
          if (v8 != 49)
          {
LABEL_28:
            goto LABEL_29;
          }

LABEL_26:
          LOBYTE(v8) = 42;
          goto LABEL_27;
        }

        break;
      case 7:
        if (v8 == 33)
        {
          if (__s1[2] != 40)
          {
            LOBYTE(v8) = 33;
            goto LABEL_28;
          }

          goto LABEL_26;
        }

        if (v8 == 56)
        {
LABEL_24:
          LOBYTE(v8) = 47;
LABEL_27:
          *a1 = v8;
          goto LABEL_28;
        }

        break;
      default:
        goto LABEL_28;
    }

    if (v8 != 40) {
      goto LABEL_28;
    }
    goto LABEL_26;
  }

LABEL_29:
  if (a4)
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = *(void *)((char *)&dword_10 + (void)pBwdLangGlb);
    do
    {
      if (!strcmp(__s1, *(const char **)(v11 + 8 * v10)))
      {
        char v22 = v10 - 64;
        goto LABEL_96;
      }

      ++v10;
    }

    while (v10 != 64);
  }

  for (unint64_t i = 30LL; i != 256; ++i)
  {
    if ((int)i <= 60)
    {
      if ((_DWORD)i == 30)
      {
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
        {
LABEL_83:
          char v22 = 34;
          goto LABEL_96;
        }

        goto LABEL_66;
      }

      if ((_DWORD)i == 31)
      {
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
          goto LABEL_83;
        }
        goto LABEL_66;
      }

      goto LABEL_60;
    }

    if ((int)i <= 138)
    {
      switch((_DWORD)i)
      {
        case 0x3D:
          if (nLangIDGlb == 12) {
            goto LABEL_83;
          }
          goto LABEL_66;
        case 0x5D:
          char v22 = 93;
          goto LABEL_96;
        case 0x82:
          char v22 = -111;
          goto LABEL_96;
      }

      goto LABEL_60;
    }

    if ((int)i > 145)
    {
      switch((_DWORD)i)
      {
        case 0x92:
          char v22 = -110;
          goto LABEL_96;
        case 0x94:
          goto LABEL_83;
        case 0x9B:
          char v22 = 62;
          goto LABEL_96;
      }

    BOOL v2 = 1;
    a1 += no_exception(1, v13, a1) + 1;
  }

  ++*result;
  return result;
}

LABEL_60:
      if ((_BYTE)i && (uint64_t v15 = memchr("'\x82\x84\x8B\x91\x92\x93\x94\x9B\xAB\xBB", i, 0xDuLL), i >= 0x80) && v15) {
        char v13 = 34;
      }
      else {
        char v13 = i;
      }
      goto LABEL_65;
    }

    if ((_DWORD)i != 139) {
      goto LABEL_60;
    }
    char v13 = 60;
LABEL_65:
    *a1 = v13;
LABEL_66:
    if (!a3) {
      return 1LL;
    }
    BOOL v17 = nLangIDGlb != 9 || nSubLangIDGlb != 3;
    uint64_t result = 1LL;
    if (nLangIDGlb == 10 || !v17) {
      return result;
    }
    a3 = 0;
  }

  if (a4) {
    return 0LL;
  }
  uint64_t v19 = 0LL;
  uint64_t v20 = *(void *)((char *)&dword_10 + (void)pBwdLangGlb);
  while (strcmp(__s1, *(const char **)(v20 + 8 * v19)))
  {
    if (++v19 == 64) {
      return 0LL;
    }
  }

  char v22 = v19 - 64;
LABEL_96:
  *a1 = v22;
  return 1LL;
}

BOOL bwd_fetch_ueb_char(_BYTE *a1, char *__s1)
{
  uint64_t v4 = *(void *)((char *)&stru_20.cmd + (void)pLangGlb);
  uint64_t v5 = 33LL;
  while (strcmp(__s1, *(const char **)(v4 + 8 * v5)))
  {
    if (++v5 == 256)
    {
      LOBYTE(v5) = __s1[2];
      BOOL result = in(v5, 9);
      if (!result) {
        return result;
      }
      break;
    }
  }

  *a1 = v5;
  return 1LL;
}

uint64_t bwd_rightchar_follows(unsigned __int8 *a1)
{
  char v2 = 0;
  uint64_t v3 = pBwdLangGlb;
  int v4 = nLangIDGlb;
  BOOL v5 = nLangIDGlb == 9 && nSubLangIDGlb == 3;
  char v6 = v5;
  char v7 = v6 ^ 1;
  while (1)
  {
    unsigned int v8 = *a1;
    if (v8 - 46 >= 2)
    {
      if (!*a1) {
        return v2 & (v8 < 0x21);
      }
    }

    else if (v8 == a1[1])
    {
      return v2 & (v8 < 0x21);
    }

    if (!no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)v3), a1)
      && !no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v3 + 8], a1))
    {
      return v2 & (v8 < 0x21);
    }

    if (v4 == 7)
    {
      char v9 = a1;
      uint64_t v10 = "'<=";
      while (1)
      {
        do
          int v11 = *v9++;
        while (v11 == 173 || v11 == 30);
        if (++v10 == "")
        {
          ++a1;
          char v13 = *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3);
          goto LABEL_29;
        }
      }
    }

    BOOL v5 = v8 == 39;
    char v13 = *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3);
    if (v5) {
      char v14 = v7;
    }
    else {
      char v14 = 1;
    }
    if ((v14 & 1) == 0
      && no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v3), a1 + 1))
    {
      ++a1;
    }

uint64_t bwd_char(uint64_t result)
{
  if (qword_999F8 <= 0)
  {
    int v1 = (_BYTE *)qword_99A00;
    uint64_t v2 = qword_99A08;
  }

  else
  {
    int v1 = (_BYTE *)qword_99A00;
    uint64_t v2 = qword_99A08;
    if (!--qword_999F8)
    {
      if (qword_99A00 == qword_99A08) {
        return result;
      }
      *(_BYTE *)qword_99A00 = 30;
      qword_99A00 = (uint64_t)++v1;
    }
  }

  if (v1 != (_BYTE *)v2)
  {
    _BYTE *v1 = result;
    qword_99A00 = (uint64_t)(v1 + 1);
  }

  return result;
}

uint64_t bwd_string(_BYTE *a1)
{
  uint64_t v2 = a1 + 1;
  char v1 = *a1;
  do
  {
    uint64_t result = bwd_char(v1);
    int v4 = *v2++;
    char v1 = v4;
  }

  while (v4);
  return result;
}

void bwd_increment_cursor()
{
  if (qword_999F8 >= 2) {
    ++qword_999F8;
  }
}

BOOL bwd_is_number(_BYTE *a1)
{
  if (*a1 != 35) {
    return 0LL;
  }
  unsigned int v2 = a1[1];
  if (a1[1])
  {
    if (v2 - 107 > 0xFFFFFFF5) {
      return 1LL;
    }
    int v3 = 0;
    if (v2 == 39)
    {
      char v5 = 1;
      goto LABEL_14;
    }

    if (v2 == 30)
    {
      int v3 = 1;
      BOOL result = 1LL;
    }
  }

  else
  {
    int v3 = 0;
  }

  if (v2 == stru_B8.segname[(void)pLangGlb + 1])
  {
    char v5 = 0;
  }

  else
  {
    char v5 = 0;
  }

LABEL_63:
  BOOL result = 0LL;
  if (v6 == 12 || (lFlags & 0x40000000) != 0) {
    return result;
  }
  if (!v2)
  {
    if (v3) {
      goto LABEL_73;
    }
    return 0LL;
  }

  uint64_t v10 = memchr(",;:/?+=(*)", v2, 0xBuLL);
  BOOL v11 = v10 == 0LL;
  BOOL result = v10 != 0LL;
  if (v11) {
    char v12 = v3;
  }
  else {
    char v12 = 0;
  }
  if ((v12 & 1) != 0)
  {
LABEL_73:
    if (a1[2]) {
      return memchr(",;:/?+=(*)", a1[2], 0xBuLL) != 0LL;
    }
    return 0LL;
  }

  return result;
}

uint64_t bwd_add_char(uint64_t result)
{
  uint64_t v1 = qword_99A00;
  *(_BYTE *)qword_99A00 = result;
  qword_99A00 = v1 + 1;
  return result;
}

unsigned __int8 *bwd_add_string(unsigned __int8 *a1)
{
  int v3 = *a1;
  BOOL result = a1 + 1;
  int v2 = v3;
  int v4 = (_BYTE *)qword_99A00;
  do
  {
    if (v2 == 39) {
      LOBYTE(v2) = 46;
    }
    *v4++ = v2;
    int v5 = *result++;
    int v2 = v5;
  }

  while (v5);
  qword_99A00 = (uint64_t)v4;
  return result;
}

void bwd_add_list_element()
{
  if (bMemoryOverflow) {
    return;
  }
  uint64_t v0 = qword_99A48;
  uint64_t v1 = malloc(0x38uLL);
  if (v0)
  {
    uint64_t v2 = qword_99A30;
    *(void *)(qword_99A30 + 48) = v1;
    if (!v1) {
      goto LABEL_12;
    }
  }

  else
  {
    qword_99A48 = (uint64_t)v1;
    if (!v1)
    {
LABEL_12:
      bMemoryOverflow = 1;
      return;
    }

    uint64_t v2 = 0LL;
  }

  qword_99A30 = (uint64_t)v1;
  v1[5] = v2;
  v1[6] = 0LL;
  v1[2] = 0LL;
  unint64_t v3 = lFlags & 0xFFFFFFFF7FEFFBFFLL;
  v1[4] = lFlags & 0xFFFFFFFF7FEFFBFFLL | 0x80000000;
  if ((byte_999EC & 1) != 0 || byte_99A54)
  {
    if (nLangIDGlb == 7) {
      uint64_t v4 = 2147516414LL;
    }
    else {
      uint64_t v4 = 2147549183LL;
    }
    v1[4] = v3 | v4;
  }

uint64_t bwd_set_list_element(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = qword_99A30;
  if (qword_99A30)
  {
    *(void *)qword_99A30 = result;
    *(void *)(v3 + 8) = a2;
    *(void *)(v3 + 24) = a3;
  }

  return result;
}

void bwd_add_space()
{
  uint64_t v0 = qword_99A00;
  if (byte_99A50) {
    char v1 = 31;
  }
  else {
    char v1 = 32;
  }
  *(_BYTE *)qword_99A00 = v1;
  qword_99A00 = v0 + 1;
}

uint64_t bwd_keep_contraction()
{
  uint64_t v0 = (unsigned __int8 *)qword_99A20;
  if (qword_99A00 - qword_99A20 < 2) {
    return 1LL;
  }
  if (nLangIDGlb == 7)
  {
    int v2 = *(unsigned __int8 *)(qword_99A00 - 2);
    return v2 == 44 || v2 == 33;
  }

  else
  {
    if (nLangIDGlb == 9 && nSubLangIDGlb != 3)
    {
      int v5 = "*+";
      while (1)
      {
        do
          int v6 = *v0++;
        while (v6 == 173 || v6 == 30);
        if (++v5 == "") {
          return 1LL;
        }
      }
    }

    if (nLangIDGlb == 12) {
      return no_exception(1, "\tq.\x01[82cklmntvx])\x01[bdlms]=\x01[9aekx]+\x01", (unsigned __int8 *)(qword_99A00 - 2));
    }
    else {
      return 0LL;
    }
  }

void bwd_add_seg(uint64_t a1)
{
  BOOL v1 = (a1 & 0x7000004) == 0 && qword_99A18 == a1;
  if (v1) {
    return;
  }
  uint64_t v2 = qword_99A38;
  uint64_t v3 = &unk_99000;
  uint64_t v143 = qword_99A38;
  if ((qword_99A18 & 0x102400) == 0)
  {
    int v5 = (unsigned __int8 *)qword_99A00;
    unint64_t v6 = qword_99A20;
    goto LABEL_45;
  }

  int v4 = bwd_keep_contraction();
  int v5 = (unsigned __int8 *)qword_99A00;
  unint64_t v6 = qword_99A20;
  if (v4) {
    goto LABEL_45;
  }
  unsigned int v7 = pBwdLangGlb;
  int v8 = nLangIDGlb;
  BOOL v9 = nLangIDGlb == 9;
  BOOL v10 = nSubLangIDGlb == 3 && nLangIDGlb == 9;
  BOOL __src = v10;
  if (nSubLangIDGlb == 3) {
    BOOL v9 = 0;
  }
  BOOL v134 = v9;
  uint64_t v137 = pLangGlb;
  BOOL v11 = *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb + 16];
  uint64_t v12 = v2;
  while (1)
  {
    char v13 = v5 - 1;
    if (!no_exception(0, v11, v5 - 1)
      && !no_exception(0, *(unsigned __int8 **)((char *)&dword_18 + (void)v7), v5 - 1))
    {
      break;
    }

    v3[320] = v13;
    uint64_t v14 = v12 - 1;
    qword_99A38 = v12 - 1;
    uint64_t v15 = (uint64_t)&v13[-v6];
    if (v8 == 7)
    {
      if (v15 <= 1) {
        goto LABEL_31;
      }
      char v16 = v5 - 3;
      BOOL v17 = "'<=";
      while (1)
      {
        do
          int v18 = *v16++;
        while (v18 == 173 || v18 == 30);
        if (++v17 == "") {
          goto LABEL_30;
        }
      }
    }

    BOOL v100 = v15 <= 1;
    BOOL v20 = __src;
    if (v100) {
      BOOL v20 = 0;
    }
    if (v20
      && *(v5 - 3) == 39
      && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v7 + 8], v5 - 3))
    {
LABEL_30:
      char v13 = v5 - 2;
      qword_99A00 = (uint64_t)(v5 - 2);
      uint64_t v14 = v12 - 2;
      qword_99A38 = v12 - 2;
    }

LABEL_31:
    int v5 = v13 - 1;
    if (no_exception(1, *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)v7), v13 - 1))
    {
      int v21 = *v5;
    }

    else if (!v134 || *v13 != 46 || (int v21 = *v5, v21 != 61))
    {
LABEL_40:
      int v5 = v13;
      goto LABEL_41;
    }

    if (v21 != *(unsigned __int8 *)v137[11]
      && !no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v7 + 8], v13 - 1))
    {
      goto LABEL_40;
    }

    qword_99A00 = (uint64_t)(v13 - 1);
    qword_99A38 = --v14;
LABEL_41:
    uint64_t v2 = v143;
    uint64_t v12 = v14;
    uint64_t v3 = (void *)&unk_99000;
  }

  uint64_t v2 = v143;
LABEL_45:
  uint64_t v22 = (uint64_t)&v5[-v6];
  unsigned __int8 *v5 = 0;
  v3[320] = v5 + 1;
  bwd_add_list_element();
  uint64_t v23 = qword_99A18;
  if (qword_99A18 != 0x2000)
  {
    uint64_t v25 = qword_99A30;
    goto LABEL_235;
  }

  unsigned __int8 v135 = (dword_99AA0 != 0) | byte_99A90;
  if (!((dword_99AA0 != 0) | byte_99A90 & 1))
  {
    uint64_t v24 = &unk_99000;
    if ((byte_99AA4 & 1) == 0 && !dword_999F0)
    {
      int v130 = 0;
      uint64_t v23 = 0x2000LL;
      goto LABEL_113;
    }

    byte_99AA4 = 0;
    if (nLangIDGlb != 7)
    {
      int v130 = 1;
      uint64_t v23 = 1024LL;
      goto LABEL_113;
    }

    unint64_t v26 = (unsigned __int8 *)qword_99A20;
    unint64_t v27 = (void *)qword_99A30;
    if (qword_99A30)
    {
      *(void *)qword_99A30 = qword_99A20;
      v27[1] = v22;
      v27[3] = 32LL;
    }

    int v28 = *v26;
    int v29 = **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb);
    BOOL v30 = v28 != v29;
    if (v27 && v28 != v29) {
      v27[4] = 0x100000LL;
    }
    v3[320] = v26;
    word_99AA6 = 0;
    unsigned __int8 v31 = *v26;
    int v32 = v26;
    while (1)
    {
      if ((char)v31 > 95)
      {
        if (v31 == 126)
        {
          unsigned __int8 v31 = -33;
          goto LABEL_69;
        }

        if (v31 == 96)
        {
          unsigned __int8 v31 = -28;
          goto LABEL_69;
        }
      }

      else
      {
        if (v31 == 56)
        {
          unsigned __int8 v31 = -4;
          goto LABEL_69;
        }

        if (v31 == 57)
        {
          unsigned __int8 v31 = -10;
LABEL_69:
          *int v32 = v31;
LABEL_70:
          uint64_t v33 = v32;
          goto LABEL_71;
        }
      }

      uint64_t v33 = v32 + 1;
      unsigned __int8 v43 = v32[1];
      if (!v43) {
        goto LABEL_70;
      }
      byte_99AA5 = v31;
      LOBYTE(word_99AA6) = v43;
      *((void *)v24 + 324) = v33;
      LOBYTE(word_99AA6) = 0;
      unsigned __int8 v31 = *v33;
      uint64_t v24 = &unk_99000;
LABEL_71:
      if (**(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb) == v31)
      {
        if (v33[1] != 126) {
          BOOL v30 = 0;
        }
        goto LABEL_110;
      }

      uint64_t v34 = v33;
      int v35 = *(unsigned __int8 **)&stru_68.sectname[(void)pLangGlb];
      while (1)
      {
        do
          int v36 = *v34++;
        while (v36 == 173 || v36 == 30);
        if (v36 != *v35) {
          break;
        }
        if (!*++v35)
        {
          uint64_t v33 = &v33[strlen(*(const char **)&stru_68.sectname[(void)pLangGlb]) - 1];
          BOOL v30 = 1;
          goto LABEL_104;
        }
      }

      uint64_t v39 = *(const char **)((char *)&stru_20.filesize + (void)pLangGlb);
      if (*(unsigned __int8 *)v39 != v31)
      {
        uint64_t v24 = &unk_99000;
        if (v31)
        {
          if (v31 > 0xDEu || (v31 - 123) >= 0xE6u)
          {
            if (v30) {
              v31 &= ~0x20u;
            }
          }

          else if (v31 <= 0xBFu && (v31 - 91) <= 0xE5u)
          {
            goto LABEL_100;
          }
        }

        else
        {
LABEL_100:
          byte_99AA5 = *v26;
          else {
            unsigned __int8 v31 = *v33;
          }
          uint64_t v24 = &unk_99000;
        }

        *v26++ = v31;
        v3[320] = v26;
        goto LABEL_110;
      }

      size_t v40 = strlen(v39);
      unsigned int v41 = v33[v40];
      if (v33[v40] && (v41 <= 0xDE ? (BOOL v42 = v41 - 123 >= 0xFFFFFFE6) : (BOOL v42 = 1), v42))
      {
        BOOL v30 = 0;
        v33[v40] = v41 & 0xDF;
      }

      else
      {
        BOOL v30 = 0;
      }

      uint64_t v33 = &v33[v40 - 1];
LABEL_104:
      uint64_t v24 = &unk_99000;
LABEL_110:
      int v32 = v33 + 1;
      *((void *)v24 + 324) = v33 + 1;
      unsigned __int8 v31 = v33[1];
      if (!v31)
      {
        *unint64_t v26 = 0;
        int v5 = v26 + 1;
        v3[320] = v5;
        *((void *)v24 + 324) = v5;
        goto LABEL_304;
      }
    }
  }

  int v130 = 0;
  dword_99AA0 = 0;
  uint64_t v23 = 0x100000LL;
  uint64_t v24 = &unk_99000;
LABEL_113:
  uint64_t v25 = qword_99A30;
  if (v22 < 2 || !bwd_exceptions[0])
  {
    uint64_t v44 = (uint64_t)&v5[-v6];
    if (!qword_99A30) {
      goto LABEL_212;
    }
    goto LABEL_118;
  }

  if ((~*(_DWORD *)(qword_99A30 + 32) & 0x7FFELL) == 0)
  {
    uint64_t v44 = (uint64_t)&v5[-v6];
    goto LABEL_122;
  }

  uint64_t v75 = 0LL;
  BOOL v76 = (char *)*((void *)v24 + 324);
  uint64_t v127 = qword_99A08;
  uint64_t v129 = v23;
  BOOL v131 = v76;
  uint64_t v133 = v3[320];
  int v77 = 1;
  v78 = v76;
  uint64_t v44 = v22;
  while (2)
  {
    while (2)
    {
      char v79 = &bwd_exceptions[160 * v75];
      uint64_t v82 = *((void *)v79 + 19);
      int v81 = v79 + 152;
      int v80 = v82;
      if ((v82 & 0x1C000) != 0)
      {
        uint64_t v83 = *(void *)&bwd_exceptions[160 * v75 + 136];
LABEL_176:
        if (v83 <= v22)
        {
          uint64_t v84 = 0LL;
          int v85 = bwd_exceptions[160 * v75];
          while (v78[v84] == v85)
          {
            int v85 = bwd_exceptions[160 * v75 + 1 + v84++];
            if (!v85)
            {
              if (v83 == v44)
              {
                if ((v80 & 0x2000) != 0)
                {
                  uint64_t v122 = (void *)qword_99A30;
                  if (qword_99A30)
                  {
                    uint64_t v123 = &bwd_exceptions[160 * v75 + 65];
                    uint64_t v124 = *(void *)&bwd_exceptions[160 * v75 + 144];
                    *(void *)qword_99A30 = v123;
                    v122[1] = v124;
                    v122[3] = 32LL;
                    if ((v80 & 0x600) == 0
                      && ((v135 & 1) != 0
                       || (char v125 = *v123) != 0
                       && ((v125 + 33) > 0xE0u || (v125 - 91) >= 0xE6u)))
                    {
                      v122[4] = 0x100000LL;
                    }
                  }

                  int v5 = (unsigned __int8 *)*((void *)v24 + 324);
                  goto LABEL_303;
                }
              }

              else
              {
                if ((v80 & 0x4000) == 0 || v78 != v76)
                {
                  if (v78[v84])
                  {
                    if ((v80 & 0x8000) == 0 || v78 <= v76) {
                      break;
                    }
                  }

                  else if ((v80 & 0x10000) == 0)
                  {
                    break;
                  }
                }

                int v86 = &bwd_exceptions[160 * v75];
                int64_t v89 = *((void *)v86 + 18);
                BOOL v88 = (size_t *)(v86 + 144);
                size_t v87 = v89;
                uint64_t v90 = v89 - v83;
                __srcb = &v78[v84];
                if (v89 <= v83 || v127 - v133 <= v90)
                {
                  uint64_t v139 = v44;
                }

                else
                {
                  uint64_t v139 = v90 + v44;
                  v133 += v90;
                  qword_99A00 = v133;
                  __dst = &v78[v87];
                  size_t v91 = strlen(&v78[v84]);
                  memmove(__dst, __srcb, v91 + 1);
                  size_t v87 = *v88;
                }

                memcpy(v78, &bwd_exceptions[160 * v75 + 65], v87);
                BOOL v76 = v131;
                if ((v81[1] & 6) == 0 && v78 != v131)
                {
                  char v92 = *v78;
                  if (*v78)
                  {
                  }
                }

                v22 -= *(void *)&bwd_exceptions[160 * v75 + 136];
                size_t v93 = *v88;
                v78 += *v88;
                uint64_t v44 = v139;
                if (__srcb <= v78)
                {
                  int v77 = 0;
                  uint64_t v3 = (void *)&unk_99000;
                }

                else
                {
                  uint64_t v94 = v139 + v93 - v84;
                  uint64_t v3 = &unk_99000;
                  uint64_t v133 = v133 + v93 - v84;
                  qword_99A00 = v133;
                  size_t v95 = strlen(__srcb);
                  memmove(v78, __srcb, v95 + 1);
                  BOOL v76 = v131;
                  uint64_t v44 = v94;
                  int v77 = 0;
                }

                uint64_t v24 = &unk_99000;
              }

              break;
            }
          }
        }
      }

      else if (v78 == v76)
      {
        uint64_t v83 = v44;
        if (*(void *)&bwd_exceptions[160 * v75 + 136] == v44) {
          goto LABEL_176;
        }
      }

      if (++v75 != 100) {
        continue;
      }
      break;
    }

    uint64_t v75 = 0LL;
    BOOL v1 = v77 == 0;
    uint64_t v96 = v77 != 0;
    if (!v1) {
      ++v78;
    }
    v22 -= v96;
    int v77 = 1;
    if (v22 > 1) {
      continue;
    }
    break;
  }

  uint64_t v25 = qword_99A30;
  uint64_t v2 = v143;
  uint64_t v23 = v129;
  if (!qword_99A30)
  {
LABEL_212:
    int v45 = nLangIDGlb;
    char v74 = 1;
    goto LABEL_214;
  }

LABEL_118:
  if ((v23 & 0x100400) != 0 && v44 <= 1 && ((qword_99A28 | a1) & 0xC0) != 0)
  {
    int v45 = nLangIDGlb;
    goto LABEL_224;
  }

LABEL_122:
  uint64_t v46 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
  int v45 = nLangIDGlb;
  if ((v46 & 0x80000000) != 0)
  {
    char v74 = 0;
LABEL_214:
    if (v44 >= 2)
    {
      uint64_t v97 = (void *)v25;
      uint64_t v98 = v44;
      char v99 = (char *)*((void *)v24 + 324);
      if (v45 == 9 && !no_exception(1, byte_47A7C, *((unsigned __int8 **)v24 + 324)))
      {
        uint64_t v44 = v98;
        uint64_t v25 = (uint64_t)v97;
        goto LABEL_225;
      }

      if (bwd_fetch_char((char *)&v144, v99, 0, 1))
      {
        if ((v74 & 1) == 0)
        {
          *uint64_t v97 = v99;
          v97[1] = 1LL;
          v97[3] = 32LL;
        }

        if (v97 != 0LL && (v135 & 1) != 0) {
          v97[4] = 0x100000LL;
        }
        *(_WORD *)char v99 = v144;
        int v5 = (unsigned __int8 *)(v99 + 2);
        qword_99A20 = (uint64_t)v5;
        v3[320] = v5;
        goto LABEL_238;
      }

      uint64_t v44 = v98;
      uint64_t v25 = (uint64_t)v97;
    }

LABEL_224:
    if (v45 != 9)
    {
LABEL_234:
      uint64_t v22 = v44;
LABEL_235:
      int v104 = &unk_99000;
      uint64_t v44 = v22;
      if (!v25)
      {
LABEL_237:
        int v5 = (unsigned __int8 *)v3[320];
        v104[324] = v5;
        goto LABEL_238;
      }

LABEL_236:
      *(void *)uint64_t v25 = v104[324];
      *(void *)(v25 + 8) = v44;
      *(void *)(v25 + 24) = v23;
      goto LABEL_237;
    }

LABEL_225:
    if (v2 - qword_99A38 >= 1)
    {
      BOOL v100 = *(_BYTE *)qword_99A38 != 47 || v44 < 3;
      if (!v100 && *(_BYTE *)(qword_99A38 - 2) == 47)
      {
        if ((v130 & 1) != 0
          || (uint64_t v101 = v44,
              uint64_t v102 = v25,
              int v103 = no_exception(0, byte_47A86, (unsigned __int8 *)(qword_99A38 - 1)),
              uint64_t v25 = v102,
              uint64_t v44 = v101,
              v103))
        {
          *(void *)(v25 + 32) |= 0x2000uLL;
          int v104 = (void *)&unk_99000;
          goto LABEL_236;
        }
      }
    }

    goto LABEL_234;
  }

  uint64_t v128 = v23;
  uint64_t v47 = 0LL;
  int v48 = *pLangGlb;
  int v5 = (unsigned __int8 *)*((void *)v24 + 324);
  __srca = (unsigned __int8 *)qword_99A38;
  int v138 = nSubLangIDGlb;
  unint64_t v132 = qword_99A28;
  uint64_t v49 = v44;
  uint64_t v50 = v25;
  uint64_t v51 = *(unsigned int *)((char *)&dword_8 + (void)pLangGlb);
  while (1)
  {
    uint64_t v52 = v48[3];
    if (v52 != v44)
    {
      if (v45 != 9) {
        goto LABEL_157;
      }
      int v54 = no_exception(1, "\t.[cdjlmnts", &v5[v52]);
      uint64_t v46 = v51;
      uint64_t v25 = v50;
      uint64_t v44 = v49;
      if (!v54) {
        goto LABEL_170;
      }
      goto LABEL_130;
    }

    if (v45 != 9) {
      break;
    }
LABEL_130:
    if (v52 > 1) {
      goto LABEL_135;
    }
    int v53 = *__srca;
    if ((v135 & (v53 == 35)) == 0) {
      goto LABEL_132;
    }
LABEL_170:
    v48 += 5;
    BOOL v1 = v47++ == v46;
    if (v1)
    {
      char v74 = 0;
      uint64_t v2 = v143;
      uint64_t v24 = &unk_99000;
      uint64_t v23 = v128;
      goto LABEL_214;
    }
  }

  if (v52 <= 1)
  {
    int v53 = *__srca;
LABEL_132:
    if (v53 == 45)
    {
      int v55 = __srca[1];
      if (v55 == 32 || v55 == 45)
      {
LABEL_157:
        if (v45 == 7)
        {
          uint64_t v66 = *(void *)(v25 + 32);
          if ((v66 & 2) != 0 && v44 == 1)
          {
            uint64_t v68 = (_BYTE *)v48[1];
            if (*v68 == 39)
            {
              char v69 = v68 + 1;
              int v70 = v5;
              while (1)
              {
                do
                  int v71 = *v70++;
                while (v71 == 173 || v71 == 30);
                if (v71 != *v69) {
                  break;
                }
                if (!*++v69)
                {
                  uint64_t v60 = v48[4];
                  goto LABEL_169;
                }
              }
            }
          }
        }

        goto LABEL_170;
      }
    }
  }

LABEL_135:
  if (v138 == 3)
  {
    unsigned int v56 = *(unsigned __int8 *)v48[1];
    if (*(_BYTE *)v48[1])
    {
      if (v56 > 0xDE || v56 - 123 >= 0xFFFFFFE6)
      {
        if ((v132 & 4) != 0)
        {
          int v58 = no_exception(1, byte_47A75, **(unsigned __int8 ***)(v25 + 40));
          uint64_t v46 = v51;
          uint64_t v25 = v50;
          uint64_t v44 = v49;
          if (!v58) {
            goto LABEL_157;
          }
        }

        int v59 = no_exception(1, "\x7F|\x01&\x01", __srca);
        uint64_t v46 = v51;
        uint64_t v25 = v50;
        uint64_t v44 = v49;
        if (!v59) {
          goto LABEL_157;
        }
      }
    }
  }

  uint64_t v60 = v48[4];
  if ((v60 & 0x800000) != 0)
  {
    if (v132 > 2) {
      goto LABEL_157;
    }
    unsigned int v67 = *__srca;
    if (v67 >= 0x21 && v67 != 160) {
      goto LABEL_157;
    }
  }

  uint64_t v61 = (unsigned __int8 *)v48[1];
  size_t v62 = v5;
  do
  {
    do
      int v63 = *v62++;
    while (v63 == 173 || v63 == 30);
    if (v63 != *v61) {
      goto LABEL_157;
    }
  }

  while (*++v61);
  uint64_t v66 = *(void *)(v25 + 32);
LABEL_169:
  uint64_t v116 = v48[2];
  *(void *)uint64_t v25 = *v48;
  *(void *)(v25 + 8) = v116;
  uint64_t v117 = 1024LL;
  if (v130) {
    uint64_t v117 = 0x100000LL;
  }
  if ((v135 & 1) != 0) {
    uint64_t v117 = 1049600LL;
  }
  *(void *)(v25 + 24) = 32LL;
  *(void *)(v25 + 32) = v117;
  if (v52 < v44)
  {
    bwd_add_list_element();
    uint64_t v118 = v48[3];
    uint64_t v119 = (_BYTE *)(qword_99A20 + v118);
    uint64_t v2 = v143;
    if ((v128 & 0x400) != 0 && v119[1] == 115)
    {
      uint64_t v120 = qword_99A30;
      if (qword_99A30)
      {
        uint64_t v121 = v49 + ~v118;
        *(void *)qword_99A30 = v119 + 1;
        goto LABEL_297;
      }
    }

    else
    {
      *uint64_t v119 = 39;
      uint64_t v120 = qword_99A30;
      if (qword_99A30)
      {
        uint64_t v121 = v49 - v48[3];
        *(void *)qword_99A30 = v119;
LABEL_297:
        *(void *)(v120 + 8) = v121;
        *(void *)(v120 + 24) = 32LL;
      }
    }

    int v5 = (unsigned __int8 *)v3[320];
    qword_99A20 = (uint64_t)v5;
    goto LABEL_238;
  }

LABEL_303:
  v3[320] = v5;
LABEL_304:
  uint64_t v2 = v143;
LABEL_238:
  int v105 = (unsigned __int8 *)qword_99A38;
  uint64_t v106 = v2 - qword_99A38;
  if (v2 - qword_99A38 < 1)
  {
    char v113 = (void *)qword_99A30;
  }

  else
  {
    do
    {
      int v107 = pBwdLangGlb;
      v108 = *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb);
      if (v106 == 1 || *v105 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
      {
        else {
          qword_99A18 = 0x4000000LL;
        }
      }

      else
      {
        if (no_exception(1, v108, v105 + 1))
        {
          qword_99A18 = 0x1000000LL;
          qword_99A38 = (uint64_t)++v105;
        }

        else
        {
          qword_99A18 = 0x4000000LL;
        }

        uint64_t v2 = v143;
      }

      else {
        BOOL v109 = 1;
      }
      if (v109)
      {
        uint64_t v110 = (void *)&unk_99000;
      }

      else
      {
        *v5++ = *v105;
        uint64_t v110 = &unk_99000;
        qword_99A00 = (uint64_t)v5;
        int v105 = (unsigned __int8 *)++qword_99A38;
      }

      unsigned __int8 *v5 = *v105;
      ++qword_99A38;
      uint64_t v111 = qword_99A20;
      v5[1] = 0;
      uint64_t v112 = v5 + 1;
      v110[320] = v112 + 1;
      bwd_add_list_element();
      char v113 = (void *)qword_99A30;
      if (qword_99A30)
      {
        uint64_t v114 = qword_99A18;
        *(void *)qword_99A30 = qword_99A20;
        v113[1] = &v112[-v111];
        v113[3] = v114;
      }

      int v5 = (unsigned __int8 *)v110[320];
      qword_99A20 = (uint64_t)v5;
      int v105 = (unsigned __int8 *)qword_99A38;
      uint64_t v106 = v2 - qword_99A38;
    }

    while (v2 - qword_99A38 > 0);
  }

  if (qword_999F8 >= 1 && v113)
  {
    v113[2] = qword_999F8;
    qword_999F8 = 0LL;
  }

  if (qword_99A18) {
    qword_99A28 = qword_99A18;
  }
  qword_99A18 = a1;
  uint64_t v115 = 0x4000LL;
  if (a1 > 127)
  {
    if (a1 >= 0x100000)
    {
      if (a1 == 0x4000000 || a1 == 0x2000000) {
        goto LABEL_279;
      }
      if (a1 != 0x100000) {
        goto LABEL_273;
      }
    }

    else
    {
      if (a1 == 128) {
        goto LABEL_279;
      }
      if (a1 != 1024 && a1 != 0x2000)
      {
LABEL_273:
        if ((qword_99A28 & 0x1024C0) != 0)
        {
          uint64_t v115 = 0x10000LL;
          goto LABEL_279;
        }

        return;
      }
    }

    uint64_t v115 = 0x8000LL;
    goto LABEL_279;
  }

  if ((unint64_t)a1 >= 3
    && ((unint64_t)(a1 - 4) > 0x3C || ((1LL << (a1 - 4)) & 0x1000000010000001LL) == 0))
  {
    goto LABEL_273;
  }

LABEL_279:
  qword_91448 = v115;
}

BOOL bwd_find_leftchar(uint64_t a1, char *__s2, int a3)
{
  if (a1)
  {
    uint64_t v5 = a1;
    do
    {
      uint64_t v6 = *(void *)(v5 + 24);
      if (v6 == 0x2000000)
      {
      }

      else if (v6 == 0x4000000 && !strcmp(*(const char **)v5, __s2))
      {
        break;
      }

      uint64_t v5 = *(void *)(v5 + 40);
    }

    while (v5);
  }

  unsigned int v7 = (unsigned __int8 *)(qword_99A38 + a3);
  uint64_t v8 = 1LL;
  return v8;
}

void bwd_resolve_nospace()
{
  BOOL v0 = nLangIDGlb != 9 || nSubLangIDGlb == 3;
  if (!v0 && qword_99A18 == 0x2000)
  {
    BOOL v1 = (unsigned __int8 *)qword_99A20;
    if (qword_99A00 - qword_99A20 == 1)
    {
      if ((*(unsigned __int8 *)qword_99A20 | 2) == 0x2B)
      {
LABEL_17:
        uint64_t v5 = qword_99A38;
        int v6 = *(char *)qword_99A38;
        if (!memchr(".,+(=", v6, 6uLL) && (!memchr("/;:", v6, 4uLL) || *(unsigned __int8 *)(v5 + 1) >= 0x21u))
        {
          bwd_add_seg(1LL);
          uint64_t v7 = qword_99A00;
          if (byte_99A50) {
            char v8 = 31;
          }
          else {
            char v8 = 32;
          }
          *(_BYTE *)qword_99A00 = v8;
          qword_99A00 = v7 + 1;
        }
      }
    }

    else if (qword_99A00 - qword_99A20 == 2)
    {
      uint64_t v2 = "*+";
      while (1)
      {
        do
          int v3 = *v1++;
        while (v3 == 173 || v3 == 30);
        if (++v2 == "") {
          goto LABEL_17;
        }
      }
    }
  }

uint64_t bwd_add_rightchars()
{
  BOOL v0 = pBwdLangGlb;
  BOOL v1 = (unsigned __int8 *)qword_99A38;
  while (1)
  {
    uint64_t v2 = *(unsigned __int8 **)((char *)&dword_18 + (void)v0);
    if (!no_exception(1, v2, v1 + 1))
    {
      uint64_t result = no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v0 + 8], v1 + 1);
      if (!(_DWORD)result) {
        return result;
      }
    }

    if (v1[1] == 30 && v1[2])
    {
      qword_999F8 = 1LL;
      ++v1;
    }

    qword_99A38 = (uint64_t)(v1 + 1);
    else {
      uint64_t v4 = 0x4000000LL;
    }
    bwd_add_seg(v4);
    uint64_t v5 = qword_99A00;
    uint64_t v6 = qword_99A00;
    *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
    uint64_t v7 = (_BYTE *)(v6 + 1);
    qword_99A00 = (uint64_t)v7;
    BOOL v1 = (unsigned __int8 *)qword_99A38;
    if (nLangIDGlb == 7)
    {
      char v8 = (unsigned __int8 *)qword_99A38;
      BOOL v9 = "'<=";
      while (1)
      {
        do
          int v10 = *v8++;
        while (v10 == 173 || v10 == 30);
        if (++v9 == "")
        {
          BOOL v1 = (unsigned __int8 *)++qword_99A38;
          goto LABEL_25;
        }
      }
    }

    if (nLangIDGlb == 9 && nSubLangIDGlb == 3 && *(_BYTE *)qword_99A38 == 39)
    {
      uint64_t v12 = (_BYTE *)(qword_99A38 + 1);
      if (no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  (unsigned __int8 *)(qword_99A38 + 1)))
      {
        if (v1[2] >= 0x21u)
        {
          qword_99A38 = (uint64_t)v12;
          *(_BYTE *)(v5 + 1) = *v12;
          uint64_t v7 = (_BYTE *)(v5 + 2);
          qword_99A00 = v5 + 2;
          BOOL v1 = (unsigned __int8 *)qword_99A38;
        }
      }
    }

uint64_t bwd_no_locution()
{
  int v0 = nLangIDGlb;
  BOOL v1 = nLangIDGlb != 9 || nSubLangIDGlb == 3;
  if (!v1)
  {
    if (qword_99A18 == 0x2000)
    {
      int v23 = *(unsigned __int8 *)(qword_99A00 - 1);
    }

    uint64_t v25 = qword_99A38;
    unint64_t v26 = "o.c";
    unint64_t v27 = (unsigned __int8 *)qword_99A38;
    do
    {
      do
        int v28 = *v27++;
      while (v28 == 173 || v28 == 30);
      ++v26;
    }

    while (v26 != "");
    unsigned int v30 = *(unsigned __int8 *)(qword_99A38 + 3);
    if (v30 < 0x21) {
      goto LABEL_57;
    }
    if (no_exception(1, "\t[/,:;+(\x01", (unsigned __int8 *)(qword_99A38 + 3)))
    {
    }

    else if (v30 == 45)
    {
LABEL_57:
      bwd_add_seg(0x2000LL);
      uint64_t v31 = 0LL;
      uint64_t v32 = qword_99A00;
      int v33 = 79;
      do
      {
        if (v33 == 39) {
          LOBYTE(v33) = 46;
        }
        *(_BYTE *)(v32 + v31) = v33;
        int v33 = aOClock[++v31];
      }

      while (v31 != 7);
      qword_99A00 = v32 + 7;
      uint64_t v22 = 2LL;
LABEL_62:
      qword_99A38 += v22;
      bwd_add_rightchars();
      return 0LL;
    }
  }

char **bwd_add_abbrev_char(char **result, int a2)
{
  int v2 = **result;
  if (v2 > 56)
  {
    switch(v2)
    {
      case '9':
        BOOL v3 = a2 == 0;
        char v4 = -42;
        char v5 = -10;
        break;
        BOOL v3 = a2 == 0;
        char v4 = -60;
        char v5 = -28;
        break;
      case '~':
        int v6 = (char *)qword_99A00;
        char v5 = -33;
LABEL_27:
        *int v6 = v5;
        uint64_t v10 = (uint64_t)(v6 + 1);
LABEL_28:
        qword_99A00 = v10;
        goto LABEL_29;
      default:
        goto LABEL_24;
    }

unint64_t bwd_generic_abbrev(_BYTE *a1)
{
  if (nLangIDGlb == 9 && nSubLangIDGlb == 3) {
    return 0LL;
  }
  int v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  unint64_t v3 = 0LL;
  do
  {
    char v4 = &a1[v3];
    if (a1[v3 + 1] != 46) {
      break;
    }
    v3 += 2LL;
    int v2 = v4[2];
  }

  while (v2);
  if (v3 <= 3) {
    return 0LL;
  }
  else {
    return v3 - 1;
  }
}

uint64_t bwd_no_abbrev(uint64_t a1)
{
  BOOL v2 = (nSubLangIDGlb != 3 || nLangIDGlb != 9) && dword_999F0 == 0;
  if (!v2 || (qword_99A18 & 0x1024C0) != 0) {
    return 1LL;
  }
  uint64_t v4 = qword_99A38;
  int v5 = *(char *)qword_99A38;
  switch(v5)
  {
    case '8':
      uint64_t v6 = 31LL;
      break;
      uint64_t v6 = 27LL;
      break;
    case '9':
      uint64_t v6 = 30LL;
      break;
    default:
      uint64_t v6 = hash_map[*(unsigned __int8 *)qword_99A38];
      break;
  }

  uint64_t v7 = *(char **)(a1 + 8 * v6);
  if (!*v7)
  {
LABEL_44:
    unint64_t v19 = bwd_generic_abbrev((_BYTE *)qword_99A38);
    if (!v19) {
      return 1LL;
    }
    unint64_t v20 = v19;
    unsigned int v21 = *(unsigned __int8 *)(v19 + v4 + 1);
    if (v21 > 0x40) {
      return 1LL;
    }
    int v22 = v21 == 32
       && *(unsigned __int8 *)(v19 + v4 + 2) == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)pLangGlb);
    bwd_add_seg(32LL);
    do
    {
      bwd_add_abbrev_char((char **)&qword_99A38, v22);
      --v20;
    }

    while (v20);
    uint64_t v30 = qword_99A00;
    *(_BYTE *)qword_99A00 = 46;
    qword_99A00 = v30 + 1;
    goto LABEL_64;
  }

  int v8 = *(unsigned __int8 *)(qword_99A38 + 1);
  while (1)
  {
    int v35 = v7;
    int v9 = *v7;
    uint64_t v10 = v9 == 36 ? v7 + 1 : v7;
    int v11 = *v10;
    uint64_t v12 = (unsigned __int8 *)(qword_99A38 + 1);
    if (v11 == v8 || ((v8 ^ v11) & 0xFFFFFFDF) == 0)
    {
      do
      {
        if (v11 == 46)
        {
          if ((v12[1] | 0x80) == 0xA0) {
            v12 += 2;
          }
          else {
            ++v12;
          }
        }

        else
        {
          ++v12;
        }

        int v14 = *++v10;
        int v11 = v14;
        int v15 = *v12;
        unsigned int v16 = (v15 ^ v14) & 0xFFFFFFDF;
      }

      while (v14 == v15 || v16 == 0);
      if (v11)
      {
LABEL_40:
        while (*++v10)
          ;
        goto LABEL_43;
      }
    }

    else
    {
      int v15 = v8;
      if (*v10) {
        goto LABEL_40;
      }
    }

    if (v15 == 46) {
      break;
    }
LABEL_43:
    uint64_t v7 = v10 + 1;
    if (!v10[1]) {
      goto LABEL_44;
    }
  }

  bwd_add_seg(32LL);
  int v23 = (unsigned __int8 *)qword_99A38;
  uint64_t v24 = "qf.";
  do
  {
    do
      int v25 = *v23++;
    while (v25 == 173 || v25 == 30);
    if (v25 != *v24)
    {
      bwd_add_abbrev_char((char **)&qword_99A38, v9 == 36);
      goto LABEL_66;
    }

    ++v24;
  }

  while (v24 != "");
  uint64_t v27 = 0LL;
  uint64_t v28 = qword_99A00;
  int v29 = 80;
  do
  {
    if (v29 == 39) {
      LOBYTE(v29) = 46;
    }
    *(_BYTE *)(v28 + v27) = v29;
    int v29 = aPro_0[++v27];
  }

  while (v27 != 3);
  qword_99A00 = v28 + 3;
LABEL_66:
  if (v9 == 36) {
    int v35 = ++v7;
  }
  if (*v7)
  {
    do
      bwd_add_abbrev_char(&v35, 0);
    while (*v35);
  }

  uint64_t v31 = qword_99A00;
  uint64_t v32 = qword_99A00;
  *(_BYTE *)qword_99A00 = 46;
  qword_99A00 = v32 + 1;
  qword_99A38 = (uint64_t)v12;
  unsigned int v33 = v12[1];
  if (v33 < 0x41 || v33 == 160)
  {
LABEL_64:
    bwd_add_rightchars();
    return 0LL;
  }

  uint64_t result = 0LL;
  if (byte_99A50) {
    char v34 = 31;
  }
  else {
    char v34 = 32;
  }
  *(_BYTE *)(v31 + 1) = v34;
  qword_99A00 = v31 + 2;
  return result;
}

uint64_t wh_backward_translate(_BYTE *a1, uint64_t a2, size_t __size, _DWORD *a4)
{
  unsigned int v4 = __size;
  if (a4) {
    *a4 = 0;
  }
  uint64_t result = 87LL;
  if (!a1) {
    return result;
  }
  if (!a2) {
    return result;
  }
  if ((_BYTE *)a2 == a1) {
    return result;
  }
  uint64_t v7 = (__size - 1);
  *(_BYTE *)a2 = 0;
  if (!*a1) {
    return 0LL;
  }
  bMemoryOverflow = 0;
  pExcMapGlb = &brl_set_classbwd;
  qword_99A10 = a2;
  int v8 = (_BYTE *)(a2 + v7);
  qword_99A08 = (uint64_t)v8;
  *int v8 = 0;
  int v9 = &unk_99000;
  qword_99A38 = (uint64_t)a1;
  uint64_t v10 = (_BYTE *)(a2 + 1);
  qword_99A00 = a2 + 1;
  int v11 = 32;
  unsigned __int8 v849 = 32;
  LOBYTE(v12) = *a1;
  BOOL __src = (_BYTE *)(a2 + 1);
  if (*a1)
  {
    uint64_t v13 = 0LL;
    int v14 = (_BYTE *)(a2 + 1);
    int v15 = a1;
    unsigned int v16 = a1;
    while (v10 == v8)
    {
      uint64_t v10 = v8;
LABEL_71:
      v9[327] = v16 + 1;
      LODWORD(v12) = *++v16;
      if (!(_DWORD)v12) {
        goto LABEL_74;
      }
    }

    *uint64_t v10 = v12;
    if (v12 == 35)
    {
      if (*(v10 - 1) == 30)
      {
        *(_WORD *)(v10 - 1) = 7715;
        goto LABEL_19;
      }
    }

    else
    {
      if (v12 == 30)
      {
        LOBYTE(v12) = *(v10 - 1);
        if ((_BYTE)v12)
        {
          if (memchr("!'><$\x7F", *(v10 - 1), 8uLL))
          {
            *uint64_t v10 = v12;
            *(v10 - 1) = 30;
          }

          else
          {
            LOBYTE(v12) = 30;
          }

          int v9 = (void *)&unk_99000;
LABEL_59:
          else {
            int v29 = 0;
          }
          else {
            uint64_t v30 = v13;
          }
          else {
            int v28 = v11;
          }
          goto LABEL_70;
        }

LABEL_19:
        LOBYTE(v12) = 30;
        goto LABEL_59;
      }

      if (v12 < 0x21u
        || v12 - 150 <= 0x17 && ((1 << (v12 + 106)) & 0x800403) != 0)
      {
        goto LABEL_59;
      }
    }

    BOOL v17 = (unsigned __int8 *)v9[327];
    int v18 = *v17;
    if (v18 == 226)
    {
      unsigned __int8 v20 = v17[1];
      if ((v20 & 0xFC) == 0xA0LL)
      {
        unsigned __int8 v23 = v17[2];
        unsigned int v21 = v17 + 2;
        unsigned __int8 v22 = v23;
        if ((v23 & 0xC0) == 0x80LL)
        {
          unint64_t v24 = v22 & 0x3F;
          if (b8DotBraille) {
            unint64_t v25 = v24 & 0xFFFFFFFFFFFFFF3FLL | ((unint64_t)(v20 & 3) << 6);
          }
          else {
            unint64_t v25 = v24;
          }
          uint64_t v12 = brl_set_ansi[v25];
          v9[327] = v21;
          goto LABEL_50;
        }
      }
    }

    else if (v18 == 239 && v17[1] == 187)
    {
      int v19 = v17[2];
      unsigned int v16 = v17 + 2;
      if (v19 == 191) {
        goto LABEL_71;
      }
    }

    if (pCharmapGlb)
    {
      uint64_t v26 = 0LL;
      while (*(unsigned __int8 *)(pCharmapGlb + v26) != v12)
      {
        if (++v26 == 256)
        {
          LODWORD(v26) = 0;
          break;
        }
      }

      uint64_t v12 = (int)v26;
    }

    else
    {
      uint64_t v12 = (char)v12;
    }

    if (!b8DotBraille)
    {
      uint64_t v27 = 0LL;
      while (brl_set_ansi[v27] != v12)
      {
        if (++v27 == 256) {
          goto LABEL_50;
        }
      }

      if ((v27 & 0xC0) != 0) {
        uint64_t v12 = brl_set_ansi[v27 & 0x3F];
      }
    }

LABEL_70:
    int v14 = v10 + 1;
    qword_99A00 = (uint64_t)(v10 + 1);
    unsigned int v16 = (unsigned __int8 *)v9[327];
    int v11 = v28;
    ++v10;
    goto LABEL_71;
  }

  int v15 = a1;
  uint64_t v13 = 0LL;
  int v14 = (_BYTE *)(a2 + 1);
LABEL_74:
  unsigned __int8 v849 = v11;
  *int v14 = 0;
  if (v14 == v8) {
    return 111LL;
  }
  uint64_t v847 = v13;
  if (v4 < 2LL * (v9[327] - (void)v15)) {
    return 111LL;
  }
  BOOL v31 = v13 > 3 && v849 > 0x20u;
  if (v31 || b8DotBraille)
  {
    if (a4)
    {
      uint64_t v518 = (uint64_t)&v14[~a2];
      if (v518 >= 1)
      {
        for (uint64_t i = 0LL; i != v518; ++i)
          a4[i] = i;
      }

      a4[v518] = v518 - 1;
    }

    memmove((void *)a2, __src, (size_t)&v14[-a2]);
    return 0LL;
  }

  uint64_t v32 = malloc(v4);
  qword_99A88 = (uint64_t)v32;
  unsigned int v33 = (void *)a2;
  if (!v32) {
    return 8LL;
  }
  uint64_t v839 = (uint64_t)v15;
  *uint64_t v32 = 0;
  v32[v7] = 0;
  qword_99A20 = (uint64_t)(v32 + 1);
  char v34 = &unk_99000;
  qword_99A00 = (uint64_t)(v32 + 1);
  byte_99BA8 = 0;
  byte_99BAC = 0;
  dword_999F0 = 0;
  byte_99AA4 = 0;
  byte_99A90 = 0;
  dword_99AA0 = 0;
  byte_99A54 = 0;
  byte_999EC = 0;
  int v35 = &unk_99000;
  qword_99A30 = 0LL;
  qword_99A48 = 0LL;
  qword_91448 = 0x4000LL;
  qword_99A28 = 0LL;
  int v36 = &unk_99000;
  qword_999F8 = 0LL;
  byte_99A50 = a4 != 0LL;
  qword_99A18 = ((unint64_t)lFlags >> 15) & 0x800;
  uint64_t k = (_BYTE **)&unk_99000;
  qword_99A38 = (uint64_t)__src;
  int v38 = *__src;
  if (!*__src) {
    goto LABEL_1310;
  }
  uint64_t v39 = __src;
  while (2)
  {
    if ((lFlags & 0x4000000) != 0) {
      goto LABEL_90;
    }
    switch(v38)
    {
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 31:
        uint64_t v40 = 1LL;
        goto LABEL_88;
      case 9:
      case 32:
      case 160:
        uint64_t v42 = 2LL;
        goto LABEL_96;
      case 30:
        BOOL v44 = (unint64_t)qword_99A18 >= 3 && (qword_99A18 & 0x7000004) == 0;
        if (!v44)
        {
          bwd_add_seg(1LL);
          int v45 = (char *)v34[320];
          char v46 = 30;
          goto LABEL_102;
        }

        unsigned int v72 = v39[1];
        if (v72 < 0x21
          || v72 == 160
          || no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v39 + 1)
          && ((unsigned int v73 = v39[2], v73 < 0x21) || v73 == 160))
        {
          bwd_add_seg(1LL);
          int v86 = (_BYTE *)v34[320];
          *int v86 = 30;
          v34[320] = v86 + 1;
          bwd_add_rightchars();
        }

        else
        {
          v36[319] = v34[320] - qword_99A20 + 1;
        }

        goto LABEL_485;
      case 35:
        if (!bwd_is_number(v39))
        {
          bwd_add_seg(0x2000LL);
          uint64_t k = (_BYTE **)&unk_99000;
          uint64_t v83 = (_BYTE *)v34[320];
          _BYTE *v83 = *(_BYTE *)qword_99A38;
          uint64_t v84 = v83 + 1;
          v34[320] = v84;
          if (nLangIDGlb == 12
            && &v84[-qword_99A20] == (_BYTE *)&dword_0 + 1
            && no_exception(1, "\t[=)/?\x01", (unsigned __int8 *)(qword_99A38 + 1)))
          {
            bwd_add_seg(4LL);
            LOBYTE(v38) = *(_BYTE *)++qword_99A38;
            goto LABEL_90;
          }

          goto LABEL_92;
        }

        bwd_resolve_nospace();
        char v57 = qword_99A18;
        if ((qword_99A18 & 0x102400) == 0) {
          goto LABEL_540;
        }
        int v58 = (unsigned __int8 *)qword_99A38;
        int v59 = (unsigned __int8 *)(qword_99A38 + 1);
        if (*(_BYTE *)(qword_99A38 + 1) == 44
          && *(unsigned __int8 *)(qword_99A38 + 2) - 107 >= 0xFFFFFFF6)
        {
          int v60 = *(unsigned __int8 *)(qword_99A38 - 1);
          if (!*(_BYTE *)(qword_99A38 - 1)
            || !memchr("bcdfghjklmnpqrstvwxz", *(unsigned __int8 *)(qword_99A38 - 1), 0x15uLL)
            && (v60 != 30 || !*(v58 - 2) || !memchr("bcdfghjklmnpqrstvwxz", *(v58 - 2), 0x15uLL)))
          {
            goto LABEL_540;
          }
        }

        if (nLangIDGlb != 7) {
          goto LABEL_537;
        }
        if ((byte_99AA4 & 1) != 0 || dword_999F0) {
          goto LABEL_540;
        }
        int v61 = *(v58 - 1);
        if (v61 == 115)
        {
          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_99000;
          int v36 = (void *)&unk_99000;
        }

        else if (v61 == 46)
        {
          unsigned int v33 = (void *)a2;
          char v34 = &unk_99000;
          int v36 = &unk_99000;
        }

        else
        {
          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_99000;
          int v36 = (void *)&unk_99000;
          if (v61 == 30
            && (*(v58 - 2) == 46 && *(v58 - 3) != stru_B8.segname[(void)pLangGlb + 3]
             || *(v58 - 2) == 115 && *(v58 - 3) == **(unsigned __int8 **)((char *)&stru_20.nsects + (void)pLangGlb)))
          {
            goto LABEL_540;
          }
        }

LABEL_537:
        if (!no_exception(0, "\t-\x01", v58 - 1)
          && !no_exception(1, "\t-\x01[abcdefghij]-\x01", v59)
          && !backward_disabled(v58))
        {
          bwd_add_seg(0x2000LL);
          uint64_t k = (_BYTE **)&unk_99000;
          goto LABEL_237;
        }

LABEL_540:
        if ((v57 & 0xC0) != 0) {
          goto LABEL_541;
        }
        if (nLangIDGlb == 7)
        {
          int v232 = *(unsigned __int8 *)(qword_99A38 - 1);
          if (v232 == 46)
          {
            int v233 = *(unsigned __int8 *)(qword_99A38 - 2);
          }

          else
          {
            if (v232 != 30 || *(_BYTE *)(qword_99A38 - 2) != 46) {
              goto LABEL_561;
            }
            int v233 = *(unsigned __int8 *)(qword_99A38 - 3);
          }

          if (v233 != stru_B8.segname[(void)pLangGlb + 3])
          {
LABEL_541:
            if ((lFlags & 0x40000000) == 0
              && nLangIDGlb == 7
              && (uint64_t v229 = qword_99A38, *(unsigned __int8 *)(qword_99A38 - 1) - 107 >= 0xFFFFFFF6)
              && *(unsigned __int8 *)(qword_99A38 - 2) - 107 >= 0xFFFFFFF6
              && *(_BYTE *)(qword_99A38 - 3)
              && memchr(",;:/?+=(*)", *(unsigned __int8 *)(qword_99A38 - 3), 0xBuLL)
              && *(_BYTE *)(v229 - 4)
              && memchr(",;:/?+=(*)", *(unsigned __int8 *)(v229 - 4), 0xBuLL))
            {
              bwd_add_seg(32LL);
              char v230 = (char *)v34[320];
              char v231 = 46;
            }

            else
            {
              bwd_add_seg(2LL);
              char v230 = (char *)v34[320];
              if (byte_99A50) {
                char v231 = 31;
              }
              else {
                char v231 = 32;
              }
            }

            *char v230 = v231;
            v34[320] = v230 + 1;
          }
        }

LABEL_561:
        bwd_add_seg(64LL);
        BOOL v234 = (_BYTE *)v34[320];
        *BOOL v234 = *(_BYTE *)qword_99A38;
        BOOL v235 = v234 + 1;
        v34[320] = v234 + 1;
        unsigned int v236 = (unsigned __int8 *)qword_99A38;
        uint64_t v238 = qword_99A38 + 1;
        unsigned int v237 = *(unsigned __int8 *)(qword_99A38 + 1);
        if (v237 == 30)
        {
          ++qword_99A38;
          v36[319] = &v235[-qword_99A20];
          unsigned int v237 = v236[2];
          unsigned int v236 = (unsigned __int8 *)v238;
        }

        if (v237 <= 0x2E && ((1LL << v237) & 0x608000000000LL) != 0)
        {
          qword_99A38 = (uint64_t)(v236 + 1);
          v234[1] = v236[1];
          BOOL v235 = v234 + 2;
          v34[320] = v234 + 2;
          unsigned int v236 = (unsigned __int8 *)qword_99A38;
        }

        uint64_t v239 = qword_99A20;
        while (1)
        {
          char v240 = v236 + 1;
          int v241 = v236[1];
          if (v236[1])
          {
          }

          v243 = pLangGlb;
          if (v241 == stru_B8.segname[(void)pLangGlb + 1]
            || v241 == stru_B8.segname[(void)pLangGlb + 2])
          {
            int v244 = v236[2];
            if (v236[2])
            {
            }
          }

          int v246 = nLangIDGlb;
          if (nLangIDGlb == 7)
          {
            if (v241 != 41) {
              goto LABEL_616;
            }
            int v247 = *v236;
            if (v247 != 106 && (v247 != 41 || *(v236 - 1) != 106)) {
              goto LABEL_616;
            }
            goto LABEL_620;
          }

          BOOL v248 = nLangIDGlb == 9;
          int v249 = nSubLangIDGlb;
          if (nLangIDGlb == 9 && nSubLangIDGlb != 2) {
            break;
          }
LABEL_605:
          BOOL v253 = v248 && v249 == 3;
          if ((!v253 || v241 != 33 && v241 != 124) && (!v248 || v241 != 124 && v241 != 52 || in(v236[2], 11)))
          {
LABEL_616:
            if (!v241 || v246 == 12 || (lFlags & 0x40000000) != 0 || !memchr(",;:/?+=(*)", v241, 0xBuLL))
            {
              int v256 = *(unsigned __int8 *)(qword_99A20 + 1);
              uint64_t v257 = pBwdLangGlb;
              if (no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb), v236)
                && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v257 + 8], v236 - 1))
              {
                v34[320] = v235 - 2;
                qword_99A38 = (uint64_t)(v236 - 1);
                bwd_add_seg(0x4000000LL);
                uint64_t v258 = (_BYTE *)v34[320];
                *uint64_t v258 = *(_BYTE *)qword_99A38;
                v34[320] = v258 + 1;
                ++qword_99A38;
                bwd_add_seg(0x1000000LL);
                v259 = (char *)qword_99A38;
                goto LABEL_651;
              }

              if (*(v236 - 1) - 107 >= 0xFFFFFFF6
                && ((int v260 = *v236, v260 == 61) || v260 == 44 || v260 == 41 && v256 != 106))
              {
                v34[320] = v235 - 1;
                bwd_add_seg(0x4000000LL);
                v259 = (char *)qword_99A38;
LABEL_651:
                char v264 = *v259;
                unsigned int v265 = (_BYTE *)v34[320];
                *unsigned int v265 = v264;
                uint64_t v262 = v265 + 1;
                unsigned int v33 = (void *)a2;
LABEL_652:
                v34[320] = v262;
              }

              else
              {
LABEL_640:
                BOOL v44 = v246 == 7;
                unsigned int v33 = (void *)a2;
                if (v44 && v241 == stru_B8.segname[(void)v243 + 3] && v236[2] == 42)
                {
                  unsigned int v261 = v236[3];
                  if (v261 < 0x21 || v261 == 42 && v236[4] <= 0x20u)
                  {
                    qword_99A38 = (uint64_t)(v236 + 1);
                    bwd_add_seg(32LL);
                    uint64_t v262 = (_BYTE *)v34[320];
                    uint64_t v263 = qword_99A38;
                    do
                    {
                      qword_99A38 = v263 + 1;
                      *v262++ = 39;
                      uint64_t v263 = qword_99A38;
                    }

                    while (*(_BYTE *)(qword_99A38 + 1) == 42);
                    goto LABEL_652;
                  }
                }
              }

              if (nLangIDGlb == 7
                && (uint64_t v266 = qword_99A38, v267 = *(unsigned __int8 *)(qword_99A38 + 1), *(_BYTE *)(qword_99A38 + 1))
                && ((v268 = memchr("!'><$\x7F", *(unsigned __int8 *)(qword_99A38 + 1), 8uLL), v267 != 33)
                  ? (BOOL v269 = v268 == 0LL)
                  : (BOOL v269 = 1),
                    !v269
                 && (v267 != stru_B8.segname[(void)pLangGlb + 3] || *(_BYTE *)(v266 + 2) != 41)
                 && (v267 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb)
                  || (unint64_t)qword_99A28 <= 2
                  && (char v270 = (_BYTE *)(v266 + 2),
                      no_exception( 1,  "arm\x01er\x01f[<8\x01fach\x01st\x01te\x01",  (unsigned __int8 *)(v266 + 2)))
                  && (unsigned int v271 = *v270, *v270)
                  && (v271 > 0xDE || v271 - 123 >= 0xFFFFFFE6))))
              {
                bwd_add_seg(2LL);
                v272 = (char *)v34[320];
                if (byte_99A50) {
                  char v273 = 31;
                }
                else {
                  char v273 = 32;
                }
                char *v272 = v273;
                v34[320] = v272 + 1;
              }

              else
              {
                bwd_add_rightchars();
              }

              goto LABEL_668;
            }
          }

LABEL_620:
          qword_99A38 = (uint64_t)(v236 + 1);
          int v254 = *v240;
          if (v254 == 30)
          {
            qword_999F8 = (uint64_t)&v235[-v239];
            int v255 = 30;
          }

          else
          {
            *v235++ = v254;
            v34[320] = v235;
            char v240 = (unsigned __int8 *)qword_99A38;
            int v255 = *(unsigned __int8 *)qword_99A38;
          }

          if (v255 == stru_B8.segname[(void)pLangGlb + 3]
            && v240[1]
            && v240[2] - 107 >= 0xFFFFFFF6)
          {
            qword_99A38 = (uint64_t)(v240 + 1);
            *v235++ = v240[1];
            v34[320] = v235;
            unsigned int v236 = (unsigned __int8 *)qword_99A38;
            int v255 = *(unsigned __int8 *)qword_99A38;
            if (*(_BYTE *)qword_99A38) {
              goto LABEL_627;
            }
          }

          else
          {
            unsigned int v236 = v240;
            if (v255)
            {
LABEL_627:
              if (memchr(",;:/?+=(*)", v255, 0xBuLL)) {
                qword_99A18 = 128LL;
              }
            }
          }
        }

        if ((lFlags & 0x40000000) == 0)
        {
          if (!v236[1])
          {
LABEL_599:
            if (v241 == stru_B8.segname[(void)v243 + 3]
              && v236[2] == 124
              && v236[3] - 107 >= 0xFFFFFFF6)
            {
              uint64_t v252 = v236[4];
            }

            BOOL v248 = 1;
            goto LABEL_605;
          }

          if (memchr("#0-1|4$k'\x7F", v236[1], 0xBuLL)) {
            goto LABEL_620;
          }
        }

        if ((v241 == 58 || v241 == 45) && v236[2] - 107 >= 0xFFFFFFF6)
        {
          uint64_t v251 = v236[3];
        }

        goto LABEL_599;
      case 41:
        if (nLangIDGlb == 7 && (unint64_t)qword_99A18 <= 8)
        {
          unsigned int v75 = v39[1];
          if (v75 > 0x28)
          {
            if (v75 != 41) {
              goto LABEL_462;
            }
            unsigned int v75 = v39[2];
            if (v75 == 30)
            {
              unsigned int v75 = v39[3];
              if (v75 != 62)
              {
LABEL_174:
                if (v75 != 35) {
                  goto LABEL_479;
                }
              }
            }

            else if (v75 != 35)
            {
              goto LABEL_462;
            }
          }

          else
          {
            if (v75 != 30) {
              goto LABEL_174;
            }
            int v99 = v39[2];
            if (v99 != 35)
            {
              if (v99 != 41)
              {
                unsigned int v33 = (void *)a2;
                char v34 = (void *)&unk_99000;
                int v36 = (void *)&unk_99000;
                int v35 = (void *)&unk_99000;
                if (v99 != 62) {
                  goto LABEL_479;
                }
                goto LABEL_463;
              }

              unsigned int v75 = v39[3];
              unsigned int v33 = (void *)a2;
              char v34 = &unk_99000;
              int v36 = (void *)&unk_99000;
              int v35 = (void *)&unk_99000;
              if (v75 != 35)
              {
LABEL_462:
                if (v75 != 62) {
                  goto LABEL_479;
                }
              }
            }
          }

LABEL_463:
          bwd_add_seg(32LL);
          uint64_t v196 = 0LL;
          uint64_t v197 = v34[320];
          int v198 = 65;
          do
          {
            if (v198 == 39) {
              LOBYTE(v198) = 46;
            }
            *(_BYTE *)(v197 + v196) = v198;
            int v198 = aArt[++v196];
          }

          while (v196 != 4);
          uint64_t v193 = (char *)(v197 + 4);
          v34[320] = v197 + 4;
          uint64_t v194 = (unsigned __int8 *)qword_99A38;
          int v199 = *(unsigned __int8 *)(qword_99A38 + 1);
          if (v199 == 30)
          {
            ++qword_99A38;
            *v193++ = 30;
            v34[320] = v193;
            uint64_t v194 = (unsigned __int8 *)qword_99A38;
            int v199 = *(unsigned __int8 *)(qword_99A38 + 1);
          }

          if (v199 == 41)
          {
            qword_99A38 = (uint64_t)(v194 + 1);
            int v199 = v194[2];
            ++v194;
          }

          if (v199 == 30)
          {
            qword_99A38 = (uint64_t)(v194 + 1);
            *v193++ = 30;
            v34[320] = v193;
            uint64_t v194 = (unsigned __int8 *)qword_99A38;
          }

          goto LABEL_473;
        }

        if (nLangIDGlb == 12 && qword_99A18 == 0x2000)
        {
          int v63 = (_BYTE *)v34[320];
          if (memchr("cklmntvx28", (char)*(v63 - 1), 0xBuLL) && !in(v39[1], 11))
          {
            *int v63 = 41;
            v34[320] = v63 + 1;
            goto LABEL_485;
          }
        }

        else if ((unint64_t)qword_99A18 < 9)
        {
          goto LABEL_479;
        }

        int v89 = *(v39 - 1);
        if (v89 != 33 && v89 != 44)
        {
          unsigned int v90 = v39[1];
          uint64_t v91 = 0x4000000LL;
          if (v90 < 0x21 || v90 == 160) {
            goto LABEL_480;
          }
        }

        goto LABEL_479;
      case 45:
        bwd_resolve_nospace();
        uint64_t v64 = (_BYTE *)v34[320];
        char v65 = (unsigned __int8 *)qword_99A20;
        uint64_t v66 = &v64[-qword_99A20];
        if (&v64[-qword_99A20] != (_BYTE *)&dword_0 + 1)
        {
          int v67 = nLangIDGlb;
          uint64_t v68 = qword_99A18;
          if (nLangIDGlb == 12 && qword_99A18 == 0x2000)
          {
            if (v66 != (_BYTE *)&dword_0 + 3)
            {
LABEL_204:
              uint64_t k = (_BYTE **)&unk_99000;
              if (no_exception(1, byte_47AAD, (unsigned __int8 *)(qword_99A38 + 1)))
              {
                bwd_add_seg(4LL);
                size_t v87 = (_BYTE *)v34[320];
                *size_t v87 = *(_BYTE *)qword_99A38;
                v34[320] = v87 + 1;
                ++qword_99A38;
LABEL_87:
                uint64_t v40 = 32LL;
LABEL_88:
                bwd_add_seg(v40);
LABEL_89:
                LOBYTE(v38) = *k[327];
LABEL_90:
                unsigned int v41 = (_BYTE *)v34[320];
LABEL_91:
                *unsigned int v41 = v38;
                v34[320] = v41 + 1;
                goto LABEL_92;
              }

              int v67 = 12;
              uint64_t v68 = 0x2000LL;
              goto LABEL_253;
            }

            char v69 = "\t*t(\x01";
LABEL_200:
            if (no_exception(1, (unsigned __int8 *)v69, v65))
            {
              int v85 = (_BYTE *)qword_99A38;
              if (no_exception(1, byte_47A99, (unsigned __int8 *)(qword_99A38 + 1)))
              {
                *uint64_t v64 = *v85;
                v34[320] = v64 + 1;
                goto LABEL_485;
              }
            }

            goto LABEL_204;
          }

          goto LABEL_251;
        }

        uint64_t v76 = qword_99A28;
        BOOL v77 = *(_BYTE *)qword_99A20 != 45 || qword_99A28 == 4;
        if (v77
          || (v78 = (_BYTE *)qword_99A38,
              char v79 = (_BYTE *)(qword_99A38 + 1),
              !no_exception(1, "-\x01ci\x01l[\xC0\x7B\x01", (unsigned __int8 *)(qword_99A38 + 1))))
        {
          int v67 = nLangIDGlb;
          uint64_t v68 = qword_99A18;
          if (nLangIDGlb == 12)
          {
            int v36 = (void *)&unk_99000;
            if (qword_99A18 == 0x2000)
            {
              char v69 = "\t[.*\x01";
              goto LABEL_200;
            }
          }

          else
          {
            int v36 = (void *)&unk_99000;
          }

LABEL_251:
          if (v67 != 12 && v67 != 7)
          {
            char v106 = 1;
            goto LABEL_431;
          }

LABEL_253:
          uint64_t v100 = qword_99A38;
          unsigned int v101 = *(unsigned __int8 *)(qword_99A38 - 1);
          if (v101 < 0x21 || (v101 != 36 ? (BOOL v102 = v68 == 0x2000000) : (BOOL v102 = 1), v102))
          {
            unsigned int v103 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (v103 < 0x21 || v103 == 160)
            {
              uint64_t k = (_BYTE **)&unk_99000;
              bwd_add_seg(0x2000LL);
              goto LABEL_270;
            }
          }

          if (v67 == 7)
          {
            int v104 = *(unsigned __int8 **)((char *)&stru_20.cmd + (void)pBwdLangGlb);
            if (!no_exception(1, v104, (unsigned __int8 *)(qword_99A38 - 1))
              || *(unsigned __int8 *)(v100 - 2) >= 0x21u
              && !no_exception(1, v104, (unsigned __int8 *)(v100 - 2))
              || (int v105 = *(unsigned __int8 *)(v100 + 1), !in(*(unsigned __int8 *)(v100 + 1), 41))
              && (!v105 || (v105 - 123) <= 0xE4u && (v105 & 0xFE) != 0x38))
            {
              if (v101 <= 0x20 && *(_BYTE *)(v100 + 1) == 46)
              {
LABEL_429:
                bwd_add_seg(0LL);
                uint64_t k = (_BYTE **)&unk_99000;
                ++qword_99A38;
                byte_99A54 = 1;
                goto LABEL_682;
              }

              char v106 = 0;
              unsigned int v33 = (void *)a2;
              char v34 = &unk_99000;
              int v36 = (void *)&unk_99000;
              int v35 = (void *)&unk_99000;
              goto LABEL_431;
            }

            qword_99A18 = 0x2000000LL;
            bwd_add_seg(0x2000LL);
            uint64_t k = (_BYTE **)&unk_99000;
LABEL_270:
            int v107 = (_BYTE *)v34[320];
            _BYTE *v107 = *k[327];
            v34[320] = v107 + 1;
            goto LABEL_403;
          }

          char v106 = 1;
          int v36 = (void *)&unk_99000;
LABEL_431:
          if ((v68 & 0x1024E0) != 0
            && (int v187 = *(unsigned __int8 *)(qword_99A38 - 1),
                int v188 = **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb),
                v187 != v188)
            && (v187 != 30 || *(unsigned __int8 *)(qword_99A38 - 2) != v188)
            || (v68 & 0x1024E1) == 0 && ((unsigned int v189 = *(unsigned __int8 *)(qword_99A38 + 1), v189 < 0x21) || v189 == 160))
          {
            uint64_t k = (_BYTE **)&unk_99000;
            uint64_t v42 = 4LL;
LABEL_96:
            bwd_add_seg(v42);
            unsigned __int8 v43 = (_BYTE *)v34[320];
            *unsigned __int8 v43 = *k[327];
            v34[320] = v43 + 1;
            byte_999EC = 0;
            byte_99AA4 = 0;
            byte_99BAC = 0;
            goto LABEL_92;
          }

          if (v66 != (_BYTE *)&dword_0 + 1) {
            char v106 = 1;
          }
          if ((v106 & 1) != 0
            || *v65 != **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb)
            || qword_99A28 != 64
            || !bwd_is_number((_BYTE *)(qword_99A38 + 1)))
          {
LABEL_479:
            uint64_t v91 = 0x2000LL;
LABEL_480:
            bwd_add_seg(v91);
            uint64_t k = (_BYTE **)&unk_99000;
            goto LABEL_89;
          }

          qword_99A18 = 0LL;
          bwd_add_seg(32LL);
          uint64_t v190 = (char *)v34[320];
          if (byte_99A50) {
            char v191 = 31;
          }
          else {
            char v191 = 32;
          }
          char *v190 = v191;
          uint64_t k = (_BYTE **)&unk_99000;
          v190[1] = *(_BYTE *)qword_99A38;
          v190[2] = v191;
          uint64_t v47 = v190 + 3;
LABEL_103:
          v34[320] = v47;
          goto LABEL_92;
        }

        if (nLangIDGlb == 7)
        {
          if (!*v79 || *v79 == 30 && !v78[2])
          {
            qword_99A18 = 0x2000LL;
            *uint64_t v64 = *v78;
            char v34 = &unk_99000;
            qword_99A00 = (uint64_t)(v64 + 1);
LABEL_405:
            unsigned int v33 = (void *)a2;
LABEL_668:
            uint64_t k = (_BYTE **)&unk_99000;
            goto LABEL_669;
          }

          qword_99A18 = 0LL;
          if ((unint64_t)(v76 - 1) >= 2 && **(_BYTE **)qword_99A30 == 30)
          {
            uint64_t v80 = *(void *)(qword_99A30 + 40);
            if (v80)
            {
              if (*(void *)(v80 + 24) == 2LL)
              {
                bwd_add_seg(2LL);
                uint64_t v81 = qword_99A00;
                if (byte_99A50) {
                  char v82 = 31;
                }
                else {
                  char v82 = 32;
                }
                *(_BYTE *)qword_99A00 = v82;
                qword_99A00 = v81 + 1;
              }
            }
          }
        }

        else
        {
          qword_99A18 = 0LL;
        }

        bwd_add_seg(4LL);
        char v34 = &unk_99000;
        uint64_t v109 = qword_99A00;
        *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
        qword_99A00 = v109 + 1;
        if (nLangIDGlb != 7) {
          goto LABEL_279;
        }
        uint64_t v110 = qword_99A38;
        uint64_t v111 = (unsigned __int8 *)(qword_99A38 + 1);
        if (no_exception( 1,  *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb),  (unsigned __int8 *)(qword_99A38 + 1))) {
          goto LABEL_279;
        }
        unsigned int v226 = *v111;
        if (v226 > 0x1F) {
          goto LABEL_528;
        }
        if (v226 == 9) {
          goto LABEL_279;
        }
        if (v226 != 30) {
          goto LABEL_530;
        }
        unsigned int v226 = *(unsigned __int8 *)(v110 + 2);
        if (v226 != 9)
        {
LABEL_528:
          if (v226 != 32 && v226 != 160)
          {
LABEL_530:
            bwd_add_seg(2LL);
            uint64_t v227 = qword_99A00;
            if (byte_99A50) {
              char v228 = 31;
            }
            else {
              char v228 = 32;
            }
            *(_BYTE *)qword_99A00 = v228;
            qword_99A00 = v227 + 1;
          }
        }

        goto LABEL_279;
      case 48:
        unsigned int v71 = v39[1];
        if (v71 > 0x2F)
        {
          if (v71 == 48)
          {
            unsigned int v71 = v39[2];
            if (v71 == 30)
            {
              unsigned int v71 = v39[3];
              if (v71 == 62) {
                goto LABEL_455;
              }
              goto LABEL_157;
            }

            if (v71 == 35) {
              goto LABEL_455;
            }
          }
        }

        else
        {
          if (v71 != 30)
          {
LABEL_157:
            if (v71 != 35) {
              goto LABEL_479;
            }
            goto LABEL_455;
          }

          int v98 = v39[2];
          if (v98 == 35) {
            goto LABEL_455;
          }
          if (v98 != 48)
          {
            unsigned int v33 = (void *)a2;
            char v34 = (void *)&unk_99000;
            int v36 = (void *)&unk_99000;
            int v35 = (void *)&unk_99000;
            if (v98 != 62) {
              goto LABEL_479;
            }
LABEL_455:
            bwd_add_seg(32LL);
            v192 = (_BYTE *)v34[320];
            _BYTE *v192 = -89;
            uint64_t v193 = v192 + 1;
            v34[320] = v192 + 1;
            uint64_t v194 = (unsigned __int8 *)qword_99A38;
            int v195 = *(unsigned __int8 *)(qword_99A38 + 1);
            if (v195 == 30)
            {
              ++qword_99A38;
              v192[1] = 30;
              uint64_t v193 = v192 + 2;
              v34[320] = v192 + 2;
              uint64_t v194 = (unsigned __int8 *)qword_99A38;
              int v195 = *(unsigned __int8 *)(qword_99A38 + 1);
            }

            if (v195 == 48)
            {
              qword_99A38 = (uint64_t)(v194 + 1);
              *v193++ = -89;
              v34[320] = v193;
              uint64_t v194 = (unsigned __int8 *)qword_99A38;
              int v195 = *(unsigned __int8 *)(qword_99A38 + 1);
            }

            if (v195 == 30)
            {
              qword_99A38 = (uint64_t)(v194 + 1);
              *v193++ = 30;
              v34[320] = v193;
              uint64_t v194 = (unsigned __int8 *)qword_99A38;
            }

LABEL_473:
            int v200 = v194[2];
            if (v194[2]
              && ((v200 - 107) > 0xFFFFFFF5 || v200 == 30 && v194[3] - 107 >= 0xFFFFFFF6))
            {
              if (byte_99A50) {
                char v203 = 31;
              }
              else {
                char v203 = 32;
              }
              *uint64_t v193 = v203;
              v34[320] = v193 + 1;
LABEL_485:
              uint64_t k = (_BYTE **)&unk_99000;
            }

            else
            {
              int v202 = v194[1];
              uint64_t v201 = (uint64_t)(v194 + 1);
              uint64_t k = (_BYTE **)&unk_99000;
              if (v202 == 35) {
                qword_99A38 = v201;
              }
            }

            goto LABEL_92;
          }

          unsigned int v71 = v39[3];
          unsigned int v33 = (void *)a2;
          char v34 = &unk_99000;
          int v36 = (void *)&unk_99000;
          int v35 = (void *)&unk_99000;
          if (v71 == 35) {
            goto LABEL_455;
          }
        }

        if (v71 != 62) {
          goto LABEL_479;
        }
        goto LABEL_455;
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
        goto LABEL_87;
      default:
        bwd_resolve_nospace();
        int v48 = nLangIDGlb;
        if (nLangIDGlb == 7)
        {
          uint64_t k = (_BYTE **)&unk_99000;
          uint64_t v49 = (unsigned __int8 *)qword_99A38;
          int v50 = *(unsigned __int8 *)qword_99A38;
          if (v50 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)pLangGlb))
          {
            unint64_t v51 = qword_99A18;
            if (*(_BYTE *)(qword_99A38 + 1) == 45 && (qword_99A18 == 0x2000 || qword_99A18 == 32))
            {
              bwd_add_seg(2LL);
              uint64_t v52 = (char *)v34[320];
              if (byte_99A50) {
                char v53 = 31;
              }
              else {
                char v53 = 32;
              }
              *uint64_t v52 = v53;
              v34[320] = v52 + 1;
              ++qword_99A38;
              bwd_add_seg(32LL);
              int v54 = (_BYTE *)v34[320];
              *int v54 = 45;
              v34[320] = v54 + 1;
              int v55 = (unsigned __int8 *)(qword_99A38 + 1);
              int v35 = (void *)&unk_99000;
              unsigned int v56 = pBwdLangGlb;
              if (no_exception( 1,  *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb),  (unsigned __int8 *)(qword_99A38 + 1))
                || no_exception(1, *(unsigned __int8 **)((char *)&stru_20.cmd + (void)v56), v55)
                || no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)v56 + 8], v55))
              {
                goto LABEL_92;
              }

              goto LABEL_116;
            }
          }

          else
          {
            unint64_t v51 = qword_99A18;
          }

          if (v50 == 39 && v51 == 0x2000)
          {
            if (*(_BYTE *)(qword_99A38 + 1) && memchr("!'><$\x7F", *(unsigned __int8 *)(qword_99A38 + 1), 8uLL))
            {
              if (v34[320] - qword_99A20 == 1) {
                qword_99A18 = 32LL;
              }
              uint64_t v88 = 2LL;
LABEL_236:
              bwd_add_seg(v88);
LABEL_237:
              uint64_t v97 = (_BYTE *)v34[320];
              *uint64_t v97 = *k[327];
              v34[320] = v97 + 1;
              goto LABEL_670;
            }

            goto LABEL_289;
          }

          if (v50 == 46)
          {
            if (v51 >= 3 && v51 != 64) {
              goto LABEL_289;
            }
            if (*(_BYTE *)(qword_99A38 + 1) == 35)
            {
              uint64_t v88 = 32LL;
              goto LABEL_236;
            }

            if (v51 >= 3) {
              goto LABEL_289;
            }
          }

          else
          {
            if (v51 >= 3) {
              goto LABEL_285;
            }
            if (!*(_BYTE *)qword_99A38) {
              goto LABEL_289;
            }
          }

          uint64_t v112 = memchr("!'><$\x7F", *(unsigned __int8 *)qword_99A38, 8uLL);
          if (v50 != 39 && v112 && v49[1] <= 0x20u)
          {
            bwd_add_seg(0LL);
            goto LABEL_670;
          }

LABEL_285:
          if (v50 == 33)
          {
            int v113 = v49[1];
            if (v113 == 123)
            {
              uint64_t v114 = "!{";
            }

            else
            {
              if (v113 != 61)
              {
                BOOL v116 = qword_91448 == 0x4000;
                goto LABEL_296;
              }

              uint64_t v114 = "!=";
            }

            int v35 = &unk_99000;
            else {
              uint64_t v282 = 0x2000000LL;
            }
            bwd_add_seg(v282);
            char v177 = *(_BYTE *)qword_99A38;
LABEL_402:
            char v34 = &unk_99000;
            uint64_t v178 = qword_99A00;
            *(_BYTE *)qword_99A00 = v177;
            *(_BYTE *)(v178 + 1) = *(_BYTE *)++qword_99A38;
            qword_99A00 = v178 + 2;
            bwd_add_rightchars();
            unsigned int v33 = (void *)a2;
LABEL_403:
            int v36 = (void *)&unk_99000;
            goto LABEL_92;
          }

LABEL_289:
          if (qword_91448 == 0x4000)
          {
            if (v50 == 34)
            {
              int v115 = v49[1];
              if (v115 == 111)
              {
                if (v49[2] == 44) {
                  goto LABEL_676;
                }
              }

              else if (v115 == 57 && v49[2] == 46)
              {
LABEL_676:
                bwd_add_seg(1LL);
                uint64_t v274 = qword_99A00;
                if (*(_BYTE *)(qword_99A38 + 1) == 111) {
                  char v275 = 62;
                }
                else {
                  char v275 = 60;
                }
                *(_BYTE *)qword_99A00 = v275;
                qword_99A00 = v274 + 1;
                uint64_t v276 = qword_99A38;
                qword_99A38 += 2LL;
                if (*(_BYTE *)(v276 + 3) == 35)
                {
                  *(_BYTE *)(v274 + 1) = 32;
                  qword_99A00 = v274 + 2;
                  *(_BYTE *)qword_99A38 = 32;
                }

                bwd_add_rightchars();
                goto LABEL_682;
              }
            }

            BOOL v116 = 1;
          }

          else
          {
            BOOL v116 = 0;
          }

LABEL_296:
          if (no_exception(1, "\t''[=()\x01", v49))
          {
            int v117 = v49[2];
            if (v117 == 40)
            {
              uint64_t v118 = 0x2000000LL;
            }

            else
            {
              if (v117 == 61)
              {
                int v35 = &unk_99000;
                else {
                  uint64_t v118 = 0x2000000LL;
                }
                goto LABEL_401;
              }

              uint64_t v118 = 0x4000000LL;
            }

            int v35 = (void *)&unk_99000;
LABEL_401:
            bwd_add_seg(v118);
            char v177 = *(_BYTE *)++qword_99A38;
            goto LABEL_402;
          }

          char v119 = !v116;
          if (v50 != 62) {
            char v119 = 1;
          }
          if ((v119 & 1) == 0)
          {
            int v120 = v49[1];
            if (v120 == 123)
            {
              uint64_t v121 = (const char *)(v49 + 2);
              uint64_t v122 = ">}";
LABEL_698:
              unsigned int v33 = (void *)a2;
              char v34 = &unk_99000;
              int v36 = (void *)&unk_99000;
              if (strstr(v121, v122))
              {
                bwd_add_seg(1LL);
                ++qword_99A38;
                int v283 = (char *)(qword_99A00 + 1);
                if (*(_BYTE *)qword_99A38 == 123)
                {
                  *(_BYTE *)qword_99A00 = 91;
                  while (1)
                  {
                    uint64_t v284 = (char *)(qword_99A38 + 1);
                    if (!*(_BYTE *)(qword_99A38 + 1)) {
                      goto LABEL_1297;
                    }
                    ++qword_99A38;
                    int v285 = v284;
                    char v286 = ">}";
                    while (1)
                    {
                      do
                        int v287 = *v285++;
                      while (v287 == 173 || v287 == 30);
                      if (++v286 == "")
                      {
                        char v350 = 93;
                        goto LABEL_843;
                      }
                    }

                    *v283++ = *v284;
                  }
                }

                *(_BYTE *)qword_99A00 = 47;
LABEL_714:
                uint64_t v289 = (char *)(qword_99A38 + 1);
                if (*(_BYTE *)(qword_99A38 + 1))
                {
                  ++qword_99A38;
                  unsigned int v290 = v289;
                  BOOL v291 = ">|";
                  do
                  {
                    do
                      int v292 = *v290++;
                    while (v292 == 173 || v292 == 30);
                    if (v292 != *v291)
                    {
                      *v283++ = *v289;
                      goto LABEL_714;
                    }

                    ++v291;
                  }

                  while (v291 != "");
                  char v350 = 47;
LABEL_843:
                  *int v283 = v350;
                  qword_99A00 = (uint64_t)(v283 + 1);
                  ++qword_99A38;
                }

                else
                {
LABEL_1297:
                  qword_99A00 = (uint64_t)v283;
                }

                goto LABEL_1298;
              }

              goto LABEL_309;
            }

            if (v120 == 124)
            {
              uint64_t v121 = (const char *)(v49 + 2);
              uint64_t v122 = ">|";
              goto LABEL_698;
            }
          }

          unsigned int v33 = (void *)a2;
          char v34 = (void *)&unk_99000;
          int v36 = (void *)&unk_99000;
LABEL_309:
          if ((byte_99BAC & 1) != 0 || byte_99BA8)
          {
            uint64_t v123 = (unsigned __int8 *)qword_99A38;
            uint64_t v124 = *(unsigned __int8 **)((char *)&stru_68.size + (void)pLangGlb);
            while (1)
            {
              do
                int v125 = *v123++;
              while (v125 == 173 || v125 == 30);
              if (v125 != *v124) {
                break;
              }
              if (!*++v124)
              {
                uint64_t k = (_BYTE **)&unk_99000;
                qword_99A38 = strlen(*(const char **)((char *)&stru_68.size + (void)pLangGlb)) + qword_99A38 - 1;
                byte_99BAC = 0;
                byte_99BA8 = 0;
                goto LABEL_682;
              }
            }

            unsigned int v33 = (void *)a2;
            char v34 = &unk_99000;
            int v36 = (void *)&unk_99000;
          }

          goto LABEL_320;
        }

        unint64_t v51 = qword_99A18;
        if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
        {
          char v92 = (char *)qword_99A38;
          int v93 = *(unsigned __int8 *)qword_99A38;
          if (v93 == 34)
          {
            int v94 = *(char *)(qword_99A38 + 1);
            size_t v95 = ":-01";
            size_t v96 = 5LL;
          }

          else
          {
            if (v93 != 62) {
              goto LABEL_320;
            }
            int v94 = *(char *)(qword_99A38 + 1);
            size_t v95 = ":&01367|";
            size_t v96 = 9LL;
          }

          if (memchr(v95, v94, v96) && v92[2] && bwd_fetch_ueb_char(&v849, v92))
          {
            bwd_add_seg(0x2000LL);
            v108 = (unsigned __int8 *)v34[320];
            unsigned __int8 *v108 = v849;
            v34[320] = v108 + 1;
            uint64_t k = (_BYTE **)&unk_99000;
            qword_99A38 += 2LL;
            goto LABEL_670;
          }
        }

        else if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
        {
          goto LABEL_309;
        }

LABEL_320:
        char v128 = byte_99AA4;
        int v129 = dword_999F0;
        if ((byte_99AA4 & 1) != 0 || dword_999F0)
        {
          unsigned __int8 v144 = (_BYTE *)qword_99A38;
          uint64_t v145 = (unsigned __int8 *)qword_99A38;
          int v146 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb];
          while (1)
          {
            do
              int v147 = *v145++;
            while (v147 == 173 || v147 == 30);
            if (v147 != *v146) {
              break;
            }
            if (!*++v146)
            {
              if ((v51 & 0x102400) != 0
                && (v48 == 12 || v48 == 9)
                && ((uint64_t v150 = *(unsigned __int8 *)(qword_99A38 + strlen(*(const char **)&stru_68.segname[(void)pLangGlb])),
                     in(v150, 11))
                 || in(v150, 41)))
              {
                int v151 = (_BYTE *)v34[320];
                *int v151 = *v144;
                v34[320] = v151 + 1;
              }

              else
              {
                bwd_add_seg(0LL);
                qword_99A38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb]) + qword_99A38 - 1;
              }

              dword_999F0 = 0;
              goto LABEL_405;
            }
          }
        }

        int v130 = byte_99A54;
        if (byte_99A54 == 1)
        {
          BOOL v131 = (unsigned __int8 *)qword_99A38;
          unint64_t v132 = "'.";
          while (1)
          {
            do
              int v133 = *v131++;
            while (v133 == 173 || v133 == 30);
            if (++v132 == "")
            {
              uint64_t k = (_BYTE **)&unk_99000;
              bwd_add_seg(0LL);
              ++qword_99A38;
              byte_99A54 = 0;
              goto LABEL_670;
            }
          }
        }

        if (dword_999F0) {
          int v130 = 1;
        }
        if (v48 == 7)
        {
          if (v130)
          {
            uint64_t v135 = qword_99A38;
            if (*(_BYTE *)qword_99A38 == 39
              && in(*(unsigned __int8 *)(qword_99A38 + 1), 9)
              && in(*(unsigned __int8 *)(v135 - 1), 9))
            {
              bwd_add_seg(32LL);
              uint64_t k = (_BYTE **)&unk_99000;
              char v136 = (_BYTE *)v34[320];
              *char v136 = *(_BYTE *)qword_99A38;
              v34[320] = v136 + 1;
              unsigned int v33 = (void *)a2;
              goto LABEL_670;
            }
          }
        }

        uint64_t v137 = qword_91448;
        if (qword_91448 == 0x4000)
        {
          int v138 = (unsigned __int8 *)qword_99A38;
          uint64_t v139 = (unsigned __int8 *)qword_99A38;
          v140 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb + 16];
          while (1)
          {
            do
              int v141 = *v139++;
            while (v141 == 173 || v141 == 30);
            if (v141 != *v140) {
              break;
            }
            if (!*++v140)
            {
              uint64_t k = (_BYTE **)&unk_99000;
              qword_99A38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb + 16]) + qword_99A38 - 1;
              byte_99BAC = 0;
              byte_99BA8 = 1;
              goto LABEL_348;
            }
          }

          BOOL v172 = *(unsigned __int8 **)&stru_68.segname[(void)pLangGlb - 8];
          int v173 = (unsigned __int8 *)qword_99A38;
          while (1)
          {
            do
              int v174 = *v173++;
            while (v174 == 173 || v174 == 30);
            if (v174 != *v172) {
              break;
            }
            if (!*++v172)
            {
              bwd_add_seg(0LL);
              uint64_t k = (_BYTE **)&unk_99000;
              qword_99A38 = strlen(*(const char **)&stru_68.segname[(void)pLangGlb - 8]) + qword_99A38 - 1;
              dword_999F0 = 1;
              goto LABEL_682;
            }
          }

          BOOL v152 = v48 == 12;
          if (v48 == 12)
          {
            int v183 = (unsigned __int8 *)qword_99A38;
            BOOL v184 = ":$";
            do
            {
              do
                int v185 = *v183++;
              while (v185 == 173 || v185 == 30);
              ++v184;
            }

            while (v184 != "");
            bwd_add_seg(0LL);
            uint64_t k = (_BYTE **)&unk_99000;
            ++qword_99A38;
            byte_99A90 = 1;
            dword_99AA0 = 1;
LABEL_682:
            unsigned int v33 = (void *)a2;
            goto LABEL_1300;
          }

LABEL_486:
          char v204 = *(unsigned __int8 **)&stru_68.sectname[(void)pLangGlb];
          do
          {
            do
              int v205 = *v138++;
            while (v205 == 173 || v205 == 30);
            if (v205 != *v204) {
              goto LABEL_363;
            }
          }

          while (*++v204);
          bwd_add_seg(0LL);
          uint64_t v208 = (_BYTE *)(qword_99A38 + strlen(*(const char **)&stru_68.sectname[(void)pLangGlb]));
          unsigned int v209 = v208 - 1;
          qword_99A38 = (uint64_t)(v208 - 1);
          if (!*v208
            || v208[1] != *((_BYTE *)&stru_20.filesize + (void)pBwdLangGlb)
            || ((v210 = v208[2] - 100, BOOL v31 = v210 > 0x1A, v211 = (1 << v210) & 0x4008001, !v31)
              ? (BOOL v212 = v211 == 0)
              : (BOOL v212 = 1),
                !v212 && v209[4] < 0x41u))
          {
            byte_99AA4 = 1;
            goto LABEL_1299;
          }

          dword_99AA0 = 1;
          bwd_add_seg(0x2000LL);
          uint64_t k = (_BYTE **)&unk_99000;
          ++qword_99A38;
          char v34 = &unk_99000;
          uint64_t v213 = qword_99A00;
          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38 & 0xDF;
          qword_99A00 = v213 + 1;
          bwd_add_seg(4LL);
          char v214 = *(_BYTE *)++qword_99A38;
LABEL_810:
          uint64_t v331 = qword_99A00;
          *(_BYTE *)qword_99A00 = v214;
          qword_99A00 = v331 + 1;
          goto LABEL_348;
        }

        BOOL v152 = v48 == 12;
LABEL_363:
        if (v48 == 7)
        {
          unsigned int v153 = *(unsigned __int8 *)(qword_99A38 - 1);
          if (v153 < 0x21 || v153 == 61)
          {
            v179 = (unsigned __int8 *)qword_99A38;
            uint64_t v180 = "!,";
            do
            {
              do
                int v181 = *v179++;
              while (v181 == 173 || v181 == 30);
              ++v180;
            }

            while (v180 != "");
          }

LABEL_379:
        if (qword_91448 != 0x4000) {
          goto LABEL_758;
        }
        int v165 = (unsigned __int8 *)qword_99A38;
        uint64_t v166 = pLangGlb;
        uint64_t v167 = *(unsigned __int8 **)((char *)&stru_68.reloff + (void)pLangGlb);
        uint64_t v168 = (unsigned __int8 *)qword_99A38;
        while (1)
        {
          do
            int v169 = *v165++;
          while (v169 == 173 || v169 == 30);
          if (v169 != *v167) {
            break;
          }
          if (!*++v167)
          {
LABEL_520:
            bwd_add_seg(2048LL);
            uint64_t v222 = qword_99A00;
            uint64_t v223 = qword_99A00;
            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
            v224 = (unsigned __int8 *)(v223 + 1);
            qword_99A00 = (uint64_t)v224;
            if ((int)strlen(*(const char **)((char *)&stru_68.reloff + (void)pLangGlb)) >= 2)
            {
              uint64_t v225 = 1LL;
              do
                *(_BYTE *)(v222 + v225++) = *(_BYTE *)++qword_99A38;
              while (v225 < (int)strlen(*(const char **)((char *)&stru_68.reloff + (void)pLangGlb)));
              v224 = (unsigned __int8 *)(v222 + v225);
LABEL_1284:
              qword_99A00 = (uint64_t)v224;
            }

            v512 = (unsigned __int8 *)(qword_99A38 + 1);
            if (*(_BYTE *)(qword_99A38 + 1))
            {
              ++qword_99A38;
              char v513 = *(unsigned __int8 **)&stru_B8.segname[(void)pLangGlb - 8];
              uint64_t v514 = v512;
              do
              {
                do
                  int v515 = *v514++;
                while (v515 == 173 || v515 == 30);
                if (v515 != *v513)
                {
                  *v224++ = *v512;
                  goto LABEL_1284;
                }
              }

              while (*++v513);
              unsigned __int8 *v224 = *v512;
              qword_99A00 = (uint64_t)(v224 + 1);
              uint64_t v310 = 1LL;
              do
                v224[v310++] = *(_BYTE *)++qword_99A38;
              while (v310 < (int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]));
              goto LABEL_1296;
            }

            goto LABEL_1298;
          }
        }

        BOOL v215 = v48 == 9 && nSubLangIDGlb == 1;
        int v216 = v215;
        if (v215)
        {
          v217 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
          char v218 = (unsigned __int8 *)qword_99A38;
          while (1)
          {
            do
              int v219 = *v218++;
            while (v219 == 173 || v219 == 30);
            if (v219 != *v217) {
              break;
            }
            if (!*++v217) {
              goto LABEL_520;
            }
          }
        }

        char v277 = *(unsigned __int8 **)((char *)&stru_68.offset + (void)pLangGlb);
        uint64_t v278 = (unsigned __int8 *)qword_99A38;
        do
        {
          do
            int v279 = *v278++;
          while (v279 == 173 || v279 == 30);
          if (v279 != *v277)
          {
            if (v216)
            {
              v294 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
              v295 = (unsigned __int8 *)qword_99A38;
              while (1)
              {
                do
                  int v296 = *v295++;
                while (v296 == 173 || v296 == 30);
                if (v296 != *v294) {
                  break;
                }
                if (!*++v294) {
                  goto LABEL_732;
                }
              }
            }

            int v311 = *(unsigned __int8 *)qword_99A38;
            if (v311 == **(unsigned __int8 **)&stru_68.segname[(void)pLangGlb + 8])
            {
              if (v48 != 7)
              {
                if (v48 != 9 || nSubLangIDGlb != 3)
                {
                  if (v48 != 9) {
                    goto LABEL_963;
                  }
                  int v395 = *(unsigned __int8 *)(qword_99A38 + 1);
                  BOOL v396 = nSubLangIDGlb == 1 && v395 == 107;
                  BOOL v397 = v396;
                  if (v395 != 61 && !v397) {
                    goto LABEL_963;
                  }
                }

                goto LABEL_780;
              }

              if (*(_BYTE *)(qword_99A38 + 1) != 108)
              {
LABEL_963:
                byte_99BAC = 1;
                byte_99BA8 = 0;
                goto LABEL_1299;
              }
            }

            else
            {
LABEL_758:
              if (v48 != 7)
              {
LABEL_778:
                uint64_t v168 = (unsigned __int8 *)qword_99A38;
                if (qword_91448 != 0x4000) {
                  goto LABEL_786;
                }
                int v311 = *(unsigned __int8 *)qword_99A38;
                uint64_t v166 = pLangGlb;
LABEL_780:
                if (v311 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v166))
                {
                  if (v48 != 9 || v168[1] != 61 || v168[2] <= 0x20u)
                  {
                    bwd_add_seg(0LL);
                    dword_99AA0 = 1;
                    byte_99A90 = 0;
                    goto LABEL_1299;
                  }

                  goto LABEL_799;
                }

                uint64_t v168 = (unsigned __int8 *)qword_99A38;
LABEL_786:
                if (v48 == 7)
                {
                  uint64_t v322 = v168;
                  uint64_t v323 = "!$";
                  do
                  {
                    do
                      int v324 = *v322++;
                    while (v324 == 173 || v324 == 30);
                    ++v323;
                  }

                  while (v323 != "");
                  if (v51 == 0x2000
                    && !dword_99AA0
                    && qword_99A00 - qword_99A20 >= 1
                    && *(unsigned __int8 *)qword_99A20 == **(unsigned __int8 **)((char *)&stru_20.maxprot
                                                                               + (void)pLangGlb))
                  {
                    memmove((void *)qword_99A20, (const void *)(qword_99A20 + 1), --qword_99A00 - qword_99A20);
                  }

                  else
                  {
                    dword_99AA0 = 1;
                  }

                  byte_99A90 = 0;
                  byte_99AA4 = 0;
                  dword_999F0 = 0;
                  uint64_t v347 = 0x2000LL;
                  goto LABEL_842;
                }

LABEL_799:
                if (v152)
                {
                  uint64_t v326 = v168;
                  char v327 = "?//";
                  while (1)
                  {
                    do
                      int v328 = *v326++;
                    while (v328 == 173 || v328 == 30);
                    if (++v327 == "") {
                      goto LABEL_807;
                    }
                  }
                }

                v332 = v168;
                uint64_t v333 = "..";
                do
                {
                  do
                    int v334 = *v332++;
                  while (v334 == 173 || v334 == 30);
                  ++v333;
                }

                while (v333 != "");
                if (*(v168 - 1) != 39)
                {
LABEL_828:
                  bwd_add_seg(32LL);
                  uint64_t v340 = qword_99A00;
                  *(_BYTE *)qword_99A00 = 46;
                  v341 = (_BYTE *)(v340 + 1);
                  uint64_t v342 = qword_99A38 + 1;
                  for (uint64_t k = (_BYTE **)&unk_99000;
                        *(unsigned __int8 *)(qword_99A38 + 1) == *(unsigned __int8 *)qword_99A38;
                        uint64_t v342 = qword_99A38 + 1)
                  {
                    qword_99A38 = v342;
                    *v341++ = 46;
                  }

                  char v34 = &unk_99000;
LABEL_831:
                  qword_99A00 = (uint64_t)v341;
                  bwd_add_rightchars();
LABEL_348:
                  unsigned int v33 = (void *)a2;
                  goto LABEL_669;
                }

LABEL_819:
                if (v48 == 12 || v48 == 9)
                {
                  v336 = v168;
                  v337 = "//";
                  while (1)
                  {
                    do
                      int v338 = *v336++;
                    while (v338 == 173 || v338 == 30);
                    if (++v337 == "") {
                      goto LABEL_828;
                    }
                  }
                }

                uint64_t v343 = qword_99A18;
                if (qword_99A18 == 0x2000 && v152)
                {
                  int v345 = *v168;
                  if (v345 == *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb))
                  {
                    v346 = (_BYTE *)qword_99A20;
                    if (qword_99A00 - qword_99A20 == 1
                      && no_exception(1, "\t[cdjlmnst\x01", (unsigned __int8 *)qword_99A20))
                    {
                      *v346 &= ~0x20u;
LABEL_851:
                      uint64_t v330 = 4LL;
                      goto LABEL_808;
                    }

                    uint64_t v352 = qword_99A20;
                    if (qword_99A00 - qword_99A20 == 2
                      && no_exception(1, "\t-[cdjlmnst\x01", (unsigned __int8 *)qword_99A20))
                    {
                      *(_BYTE *)(v352 + 1) &= ~0x20u;
                      goto LABEL_851;
                    }
                  }

                  if (no_exception(1, byte_47AB6, v168))
                  {
                    if (v168[1] == 115)
                    {
                      bwd_add_seg(4LL);
                      LOBYTE(v345) = *(_BYTE *)qword_99A38;
                    }

                    char v34 = &unk_99000;
                    uint64_t v353 = qword_99A00;
                    *(_BYTE *)qword_99A00 = v345;
                    qword_99A00 = v353 + 1;
                    uint64_t k = (_BYTE **)&unk_99000;
                    ++qword_99A38;
                    unsigned int v33 = (void *)a2;
                    int v36 = (void *)&unk_99000;
                    int v35 = (void *)&unk_99000;
                    if (!bwd_no_abbrev(*(void *)&stru_20.segname[(void)pLangGlb + 16])
                      || !bwd_no_locution())
                    {
                      goto LABEL_92;
                    }

                    bwd_add_seg(0LL);
                    if (*(_BYTE *)qword_99A38 == 115) {
                      uint64_t v40 = 32LL;
                    }
                    else {
                      uint64_t v40 = 0x2000LL;
                    }
                    goto LABEL_88;
                  }
                }

                if (v48 != 7)
                {
LABEL_878:
                  int v361 = nSubLangIDGlb;
                  if (v48 == 9 && nSubLangIDGlb != 3)
                  {
                    if (v137 != 0x4000 && (v343 & 0x2000003) == 0) {
                      goto LABEL_904;
                    }
                    v362 = v168;
                    uint64_t v363 = "'=";
                    do
                    {
                      do
                        int v364 = *v362++;
                      while (v364 == 173 || v364 == 30);
                      ++v363;
                    }

                    while (v363 != "");
                    if (v168[2] != 32)
                    {
                      uint64_t v347 = 0x2000000LL;
LABEL_842:
                      bwd_add_seg(v347);
                      uint64_t k = (_BYTE **)&unk_99000;
                      char v34 = &unk_99000;
                      uint64_t v348 = qword_99A00;
                      *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38++;
                      *(_BYTE *)(v348 + 1) = *(_BYTE *)qword_99A38;
                      BOOL v349 = (_BYTE *)(v348 + 2);
LABEL_929:
                      qword_99A00 = (uint64_t)v349;
                      goto LABEL_348;
                    }
                  }

LABEL_890:
                  if (v137 == 0x4000 || (v343 & 0x2000003) != 0)
                  {
                    uint64_t v384 = v168;
                    v385 = ".wh";
                    do
                    {
                      do
                        int v386 = *v384++;
                      while (v386 == 173 || v386 == 30);
                      ++v385;
                    }

                    while (v385 != "");
                    unsigned int v388 = v168[3];
                    BOOL v389 = v388 > 0x20 || ((1LL << v388) & 0x100000201LL) == 0;
                    if (!v389 || v388 == 160 || v388 <= 0x1F)
                    {
                      bwd_add_seg(1LL);
                      uint64_t v390 = 0LL;
                      uint64_t v391 = qword_99A00;
                      int v392 = 83;
                      do
                      {
                        if (v392 == 39) {
                          LOBYTE(v392) = 46;
                        }
                        *(_BYTE *)(v391 + v390) = v392;
                        int v392 = aSdg[++v390];
                      }

                      while (v390 != 3);
                      uint64_t v393 = v391 + 3;
                      goto LABEL_946;
                    }
                  }

LABEL_892:
                  if (v48 == 7)
                  {
                    v366 = v168;
                    uint64_t v367 = "!-";
                    do
                    {
                      do
                        int v368 = *v366++;
                      while (v368 == 173 || v368 == 30);
                      ++v367;
                    }

                    while (v367 != "");
                    bwd_add_seg(32LL);
                    char v34 = &unk_99000;
                    int v370 = (char *)qword_99A00;
                    if (v343) {
                      char v371 = 124;
                    }
                    else {
                      char v371 = 45;
                    }
                    goto LABEL_903;
                  }

LABEL_904:
                  if (v137 == 0x4000 || (v343 & 0x2000003) != 0)
                  {
                    int v373 = *(v168 - 1);
                    if (v373 != 33 && v373 != 44)
                    {
                      if ((int v438 = *v168, v438 != 61) && v438 != 40
                        || v343 != 0x2000000
                        && v373 != 45
                        && v168[1] != 45
                        && !bwd_rightchar_follows(v168 + 1))
                      {
                        char v439 = !v152;
                        if (v438 != 61) {
                          char v439 = 1;
                        }
                        if ((v439 & 1) != 0
                          || (int v440 = v168[1], (v440 - 46) >= 2) && v440 != 115
                          || (unsigned int v441 = v168[2], v441 >= 0x41) && v441 != 115)
                        {
                          if (no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.cmd + (void)pBwdLangGlb),  v168))
                          {
                            bwd_add_seg(0x2000000LL);
                            uint64_t v442 = qword_99A00;
                            uint64_t v443 = qword_99A00;
                            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                            unsigned int v444 = (_BYTE *)(v443 + 1);
                            qword_99A00 = (uint64_t)v444;
                            uint64_t v445 = (unsigned __int8 *)qword_99A38;
                            uint64_t v446 = qword_99A38 + 1;
                            if (*(_BYTE *)(qword_99A38 + 1) == 30)
                            {
                              ++qword_99A38;
                              qword_999F8 = 1LL;
                              uint64_t v445 = (unsigned __int8 *)v446;
                            }

                            if (nLangIDGlb == 7)
                            {
                              uint64_t v447 = v445;
                              uint64_t v448 = "'<=";
                              while (1)
                              {
                                do
                                  int v449 = *v447++;
                                while (v449 == 173 || v449 == 30);
                                if (++v448 == "")
                                {
                                  qword_99A38 = (uint64_t)++v445;
                                  goto LABEL_1143;
                                }
                              }
                            }

                            if (nLangIDGlb == 9
                              && nSubLangIDGlb == 3
                              && *v445 == 39
                              && no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  v445 + 1)
                              && v445[2] >= 0x21u)
                            {
                              qword_99A38 = (uint64_t)(v445 + 1);
                              *(_BYTE *)(v442 + 1) = v445[1];
                              unsigned int v444 = (_BYTE *)(v442 + 2);
                              qword_99A00 = v442 + 2;
                              uint64_t v445 = (unsigned __int8 *)qword_99A38;
                            }

LABEL_1143:
                            if (no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  v445)
                              && v445[1] >= 0x21u)
                            {
                              qword_99A38 = (uint64_t)(v445 + 1);
                              *unsigned int v444 = v445[1];
                              qword_99A00 = (uint64_t)(v444 + 1);
                              uint64_t v445 = (unsigned __int8 *)qword_99A38;
                            }

                            unsigned int v33 = (void *)a2;
                            uint64_t k = (_BYTE **)&unk_99000;
                            char v34 = (void *)&unk_99000;
                            int v36 = (void *)&unk_99000;
                            int v35 = (void *)&unk_99000;
                            if (v445[1] <= 0x20u) {
                              qword_99A18 = 0x2000LL;
                            }
                            goto LABEL_92;
                          }
                        }
                      }
                    }
                  }

                  if (v137 == 0x10000)
                  {
                    char v394 = 0;
                  }

                  else
                  {
                    if (v137 == 0x8000
                      && no_exception(1, *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb], v168))
                    {
                      bwd_add_seg(0x2000000LL);
                      char v374 = (unsigned __int8 *)qword_99A38;
                      uint64_t v375 = qword_99A38 + 1;
                      if (*(_BYTE *)(qword_99A38 + 1) == 30)
                      {
                        ++qword_99A38;
                        qword_999F8 = 1LL;
                        char v374 = (unsigned __int8 *)v375;
                      }

                      if (nLangIDGlb == 7)
                      {
                        unsigned int v376 = *v374;
                        if (v376 <= 0x28)
                        {
                          if (v376 == 34)
                          {
                            if (v374[1] != 62) {
                              goto LABEL_1262;
                            }
                            goto LABEL_1261;
                          }

                          if (v376 == 39)
                          {
                            int v379 = v374[1];
                            uint64_t v378 = (uint64_t)(v374 + 1);
                            int v377 = v379;
                            if (v379 == 40)
                            {
                              int v499 = (const char *)v378;
                              v500 = "')";
                              goto LABEL_1252;
                            }

                            if (v377 != 41)
                            {
                              if (v377 == 58) {
                                goto LABEL_1260;
                              }
                              v380 = (unsigned __int8 *)v378;
                              uint64_t v381 = "<=";
                              while (1)
                              {
                                do
                                  int v382 = *v380++;
                                while (v382 == 173 || v382 == 30);
                                if (++v381 == "") {
                                  goto LABEL_1261;
                                }
                              }

                              uint64_t v501 = qword_99A30;
                              int v499 = (const char *)v378;
                              v500 = "'=";
LABEL_1252:
                              if (!strstr(v499, v500)) {
                                qword_99A38 = v378;
                              }
                              goto LABEL_1262;
                            }

                            if (!bwd_find_leftchar(qword_99A30, "'(", 2)) {
LABEL_1260:
                            }
                              qword_99A38 = v378;
LABEL_1261:
                            bwd_add_seg(0x4000000LL);
                            goto LABEL_1262;
                          }

                          goto LABEL_1262;
                        }

                        if (v376 == 41) {
                          goto LABEL_1261;
                        }
                        if (v376 != 60)
                        {
LABEL_1262:
                          uint64_t v502 = qword_99A00;
                          uint64_t v503 = qword_99A00;
                          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                          v504 = (_BYTE *)(v503 + 1);
                          qword_99A00 = (uint64_t)v504;
                          v505 = (unsigned __int8 *)qword_99A38;
                          if (nLangIDGlb == 7)
                          {
                            char v506 = (unsigned __int8 *)qword_99A38;
                            char v507 = "'<=";
                            while (1)
                            {
                              do
                                int v508 = *v506++;
                              while (v508 == 173 || v508 == 30);
                              if (++v507 == "")
                              {
                                v505 = (unsigned __int8 *)++qword_99A38;
                                goto LABEL_1277;
                              }
                            }
                          }

                          if (nLangIDGlb == 9
                            && nSubLangIDGlb == 3
                            && *(_BYTE *)qword_99A38 == 39
                            && no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  (unsigned __int8 *)(qword_99A38 + 1))
                            && v505[2] >= 0x21u)
                          {
                            qword_99A38 = (uint64_t)(v505 + 1);
                            *(_BYTE *)(v502 + 1) = v505[1];
                            v504 = (_BYTE *)(v502 + 2);
                            qword_99A00 = v502 + 2;
                            v505 = (unsigned __int8 *)qword_99A38;
                          }

LABEL_1277:
                          if (no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  v505))
                          {
                            unsigned int v511 = v505[1];
                            char v510 = v505 + 1;
                            if (v511 >= 0x21)
                            {
                              qword_99A38 = (uint64_t)v510;
                              _BYTE *v504 = *v510;
                              qword_99A00 = (uint64_t)(v504 + 1);
                            }
                          }

                          goto LABEL_1298;
                        }

                        uint64_t v458 = qword_99A30;
                        char v459 = "<=";
                      }

                      else
                      {
                        if (nLangIDGlb != 9 || nSubLangIDGlb == 3) {
                          goto LABEL_1262;
                        }
                        unsigned int v456 = *v374;
                        if (v456 > 0x3B)
                        {
                          if (v456 != 127)
                          {
                            if (v456 == 60)
                            {
                              if (bwd_find_leftchar(qword_99A30, "=", 2))
                              {
                                bwd_add_seg(0x4000000LL);
                                uint64_t v461 = qword_99A38 + 1;
                              }

                              else
                              {
                                uint64_t v461 = (uint64_t)(v374 + 1);
                              }

                              qword_99A38 = v461;
                            }

                            goto LABEL_1262;
                          }

                          uint64_t v458 = qword_99A30;
                          char v459 = "\x7F=";
                        }

                        else
                        {
                          if (v456 != 36)
                          {
                            if (v456 != 41) {
                              goto LABEL_1262;
                            }
                            goto LABEL_1261;
                          }

                          uint64_t v458 = qword_99A30;
                          char v459 = "$=";
                        }
                      }

                      goto LABEL_1261;
                    }

                    char v394 = 1;
                    if (*(v168 - 1) != 150 && (v343 & 0xC0) == 0)
                    {
LABEL_993:
                      if (v152
                        && (lFlags & 0x40000000) == 0
                        && v343 != 0x2000
                        && *v168 == stru_B8.segname[(void)pLangGlb + 3]
                        && (v168[1] && memchr("#123456789", v168[1], 0xBuLL)
                         || no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb),  v168 + 1)))
                      {
                        if ((v343 & 0xC0) != 0)
                        {
                          bwd_add_seg(2LL);
                          uint64_t v411 = qword_99A00;
                          if (byte_99A50) {
                            char v412 = 31;
                          }
                          else {
                            char v412 = 32;
                          }
                          *(_BYTE *)qword_99A00 = v412;
                          qword_99A00 = v411 + 1;
                        }

                        bwd_add_seg(64LL);
                        unsigned __int8 v413 = *(_BYTE *)qword_99A38;
                        uint64_t v414 = (unsigned __int8 *)qword_99A00;
                        while (1)
                        {
                          *uint64_t v414 = v413;
                          qword_99A00 = (uint64_t)++v414;
                          v840 = (unsigned __int8 *)qword_99A38;
                          v415 = (unsigned __int8 *)(qword_99A38 + 1);
                          int v416 = *(unsigned __int8 *)(qword_99A38 + 1);
                          if (!*(_BYTE *)(qword_99A38 + 1)
                            || !memchr("#123456789", *(unsigned __int8 *)(qword_99A38 + 1), 0xBuLL))
                          {
                            unsigned int v417 = pBwdLangGlb;
                            if (!no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb),  v415)
                              && (v416 != 36 || *v840 != 35 || v840[2] != 35)
                              && (v416 != stru_B8.segname[(void)pLangGlb + 1]
                               && v416 != stru_B8.segname[(void)pLangGlb + 2]
                               || !v840[2]
                               || !memchr("#123456789", v840[2], 0xBuLL)))
                            {
                              break;
                            }
                          }

                          qword_99A38 = (uint64_t)v415;
                          unsigned __int8 v413 = *v415;
                        }

                        unsigned int v33 = (void *)a2;
                        uint64_t k = (_BYTE **)&unk_99000;
                        char v34 = &unk_99000;
                        int v36 = (void *)&unk_99000;
                        int v35 = (void *)&unk_99000;
                        if (!*(_BYTE *)(qword_99A20 + 1)
                          || !memchr("#123456789", *(unsigned __int8 *)(qword_99A20 + 1), 0xBuLL)
                          || !no_exception( 1,  *(unsigned __int8 **)((char *)&dword_18 + (void)v417),  v840)
                          || !no_exception( 1,  *(unsigned __int8 **)&stru_20.segname[(void)v417 + 8],  v840 - 1))
                        {
                          goto LABEL_92;
                        }

                        qword_99A00 = (uint64_t)(v414 - 2);
                        qword_99A38 = (uint64_t)(v840 - 1);
                        bwd_add_seg(0x4000000LL);
                        uint64_t v460 = qword_99A00;
                        *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                        qword_99A00 = v460 + 1;
                        ++qword_99A38;
                        uint64_t v40 = 0x1000000LL;
                        goto LABEL_88;
                      }

                      BOOL v418 = v48 != 9 || v361 == 2;
                      int v419 = !v418;
                      if (!v418 && (lFlags & 0x40000000) == 0)
                      {
                        v420 = v168;
                        char v421 = "$k ";
                        do
                        {
                          do
                            int v422 = *v420++;
                          while (v422 == 173 || v422 == 30);
                          ++v421;
                        }

                        while (v421 != "");
                        bwd_add_seg(32LL);
                        char v34 = &unk_99000;
                        uint64_t v424 = qword_99A00;
                        *(_BYTE *)qword_99A00 = 61;
                        uint64_t v393 = v424 + 1;
                        goto LABEL_947;
                      }

LABEL_1033:
                      int v425 = *v168;
                      char v841 = pLangGlb;
                      if (v425 != stru_B8.segname[(void)pLangGlb + 3]
                        || v152 && *(_BYTE *)qword_99A20 && (*(_BYTE *)qword_99A20 & 0xDFu) - 91 > 0xFFFFFFE5
                        || !no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)pBwdLangGlb),  v168 + 1))
                      {
                        if (v48 == 7)
                        {
                          char v426 = v168;
                          int v427 = "!(";
                          while (1)
                          {
                            do
                              int v428 = *v426++;
                            while (v428 == 173 || v428 == 30);
                            if (++v427 == "") {
                              goto LABEL_1055;
                            }
                          }
                        }

                        if (v419)
                        {
                          v430 = v168;
                          v431 = "$k";
                          while (1)
                          {
                            do
                              int v432 = *v430++;
                            while (v432 == 173 || v432 == 30);
                            if (++v431 == "") {
                              goto LABEL_1055;
                            }
                          }
                        }

                        if (v48 == 7 && v343 == 0x2000)
                        {
                          uint64_t v451 = qword_99A00;
                          if (qword_99A00 - qword_99A20 >= 3)
                          {
                            v452 = v168;
                            uint64_t v453 = "!,*nc";
                            while (1)
                            {
                              do
                                int v454 = *v452++;
                              while (v454 == 173 || v454 == 30);
                              if (++v453 == "") {
                                goto LABEL_1162;
                              }
                            }

                            v462 = v168;
                            int v463 = "!,*";
                            do
                            {
                              do
                                int v464 = *v462++;
                              while (v464 == 173 || v464 == 30);
                              ++v463;
                            }

                            while (v463 != "");
                            if (v168[3] <= 0x20u)
                            {
LABEL_1162:
                              *(_WORD *)qword_99A00 = 26916;
                              *(_BYTE *)(v451 + 2) = 110;
                              uint64_t v393 = v451 + 3;
LABEL_946:
                              char v34 = &unk_99000;
LABEL_947:
                              qword_99A00 = v393;
                              uint64_t k = (_BYTE **)&unk_99000;
                              uint64_t v372 = qword_99A38 + 2;
                              goto LABEL_948;
                            }
                          }
                        }

LABEL_1163:
                        if (v48 == 7 && v343 == 0x2000) {
                          char v467 = v128;
                        }
                        else {
                          char v467 = 1;
                        }
                        if ((v467 & 1) == 0 && !v129)
                        {
                          uint64_t v468 = v168;
                          int v469 = "'s";
                          do
                          {
                            do
                              int v470 = *v468++;
                            while (v470 == 173 || v470 == 30);
                            if (v470 != *v469)
                            {
                              __int16 v472 = v168;
                              v473 = "'n";
                              while (1)
                              {
                                do
                                  int v474 = *v472++;
                                while (v474 == 173 || v474 == 30);
                                if (++v473 == "") {
                                  goto LABEL_1186;
                                }
                              }
                            }

                            ++v469;
                          }

                          while (v469 != "");
LABEL_1186:
                          if (v168[2] < 0x21u
                            || (uint64_t v476 = pBwdLangGlb,
                                no_exception( 1,  *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb),  v168 + 2))
                            || no_exception( 1,  *(unsigned __int8 **)&stru_20.segname[(void)v476 + 8],  v168 + 2))
                          {
                            bwd_add_seg(32LL);
                            uint64_t k = (_BYTE **)&unk_99000;
                            char v34 = &unk_99000;
                            uint64_t v477 = qword_99A00;
                            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38++;
                            *(_BYTE *)(v477 + 1) = *(_BYTE *)qword_99A38;
                            v341 = (_BYTE *)(v477 + 2);
                            goto LABEL_831;
                          }
                        }

LABEL_1190:
                        BOOL v478 = v48 == 9 && v361 == 3;
                        int v479 = v478;
                        if (v478)
                        {
                          int v480 = v168;
                          BOOL v481 = "!*";
                          do
                          {
                            do
                              int v482 = *v480++;
                            while (v482 == 173 || v482 == 30);
                            ++v481;
                          }

                          while (v481 != "");
                          bwd_add_seg(32LL);
                          char v34 = &unk_99000;
                          int v370 = (char *)qword_99A00;
                          char v371 = 42;
LABEL_903:
                          *int v370 = v371;
                          qword_99A00 = (uint64_t)(v370 + 1);
                          uint64_t k = (_BYTE **)&unk_99000;
                          uint64_t v372 = qword_99A38 + 1;
LABEL_948:
                          qword_99A38 = v372;
                          goto LABEL_348;
                        }

LABEL_1206:
                        if (v48 == 9)
                        {
                          v484 = v168;
                          v485 = "****";
                          do
                          {
                            do
                              int v486 = *v484++;
                            while (v486 == 173 || v486 == 30);
                            ++v485;
                          }

                          while (v485 != "");
                          bwd_add_seg(0x2000LL);
                          uint64_t v488 = qword_99A00 + 1;
                          do
                          {
                            *(_BYTE *)(v488 - 1) = 42;
                            uint64_t v489 = qword_99A38++;
                            ++v488;
                          }

                          while (*(_BYTE *)(v489 + 2) == 42);
                          *(_BYTE *)(v488 - 1) = 42;
                          char v34 = &unk_99000;
                          qword_99A00 = v488;
LABEL_279:
                          bwd_add_seg(0LL);
                          goto LABEL_405;
                        }

LABEL_1217:
                        if (v48 == 7)
                        {
                          v490 = v168;
                          v491 = "'*";
                          while (1)
                          {
                            do
                              int v492 = *v490++;
                            while (v492 == 173 || v492 == 30);
                            if (++v491 == "")
                            {
                              bwd_add_seg(32LL);
                              int v494 = (_BYTE *)qword_99A00;
                              do
                              {
                                *v494++ = 42;
                                uint64_t v495 = qword_99A38++;
                              }

                              while (*(_BYTE *)(v495 + 2) == 42);
                              char v34 = &unk_99000;
                              qword_99A00 = (uint64_t)v494;
                              goto LABEL_405;
                            }
                          }

                          if (no_exception(1, byte_47AC8, v168))
                          {
                            bwd_add_seg(4LL);
                            uint64_t k = (_BYTE **)&unk_99000;
                            char v34 = &unk_99000;
                            uint64_t v496 = qword_99A00;
                            *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38++;
                            *(_BYTE *)(v496 + 1) = *(_BYTE *)qword_99A38;
                            qword_99A00 = v496 + 2;
                            byte_999EC = 0;
                            byte_99AA4 = 0;
                            byte_99BAC = 0;
                            goto LABEL_348;
                          }
                        }

                        if (v152 && no_exception(1, "\t<|\x01<| \x01", v168))
                        {
                          bwd_add_seg(4LL);
                          uint64_t k = (_BYTE **)&unk_99000;
                          ++qword_99A38;
                          char v34 = &unk_99000;
                          uint64_t v497 = qword_99A00;
                          *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                          qword_99A00 = v497 + 1;
                          unsigned int v33 = (void *)a2;
                          int v36 = (void *)&unk_99000;
                          int v35 = (void *)&unk_99000;
                          if (*(_BYTE *)(qword_99A38 + 1) != 117) {
                            goto LABEL_92;
                          }
                          unsigned int v498 = *(unsigned __int8 *)(qword_99A38 + 2);
                          bwd_add_seg(0x2000LL);
                          ++qword_99A38;
                          int v45 = (char *)qword_99A00;
                          char v46 = 85;
LABEL_102:
                          *int v45 = v46;
                          uint64_t v47 = v45 + 1;
                          goto LABEL_103;
                        }

                        if (v479)
                        {
                          if (v425 == *(unsigned __int8 *)v841[11]
                            && no_exception( 1,  *(unsigned __int8 **)((char *)&dword_18 + (void)pBwdLangGlb),  v168 + 1))
                          {
                            bwd_add_seg(0LL);
                            uint64_t k = (_BYTE **)&unk_99000;
                            ++qword_99A38;
                            bwd_add_seg(0x1000000LL);
                            goto LABEL_809;
                          }
                        }

                        else if (v48 != 9)
                        {
                          goto LABEL_1248;
                        }

                        if (no_exception(1, "\t\x7F[|l/\x7F\x01&\x01", v168))
                        {
LABEL_1247:
                          uint64_t v347 = 4LL;
                          goto LABEL_842;
                        }

LABEL_1248:
                        unsigned int v33 = (void *)a2;
                        uint64_t k = (_BYTE **)&unk_99000;
                        char v34 = (void *)&unk_99000;
                        int v36 = (void *)&unk_99000;
                        int v35 = (void *)&unk_99000;
                        uint64_t v40 = 0x2000LL;
                        goto LABEL_88;
                      }

LABEL_1055:
                      if ((v343 & 0xC0) != 0
                        && (lFlags & 0x8000000) == 0
                        && (v48 != 9 || v361 != 1 || v168[1] != 47)
                        && (!v152 || v168[1] != 124))
                      {
                        bwd_add_seg(2LL);
                        uint64_t v434 = qword_99A00;
                        if (byte_99A50) {
                          char v435 = 31;
                        }
                        else {
                          char v435 = 32;
                        }
                        *(_BYTE *)qword_99A00 = v435;
                        qword_99A00 = v434 + 1;
                      }

                      bwd_add_seg(4LL);
                      uint64_t v436 = qword_99A00;
                      *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38++;
                      *(_BYTE *)(v436 + 1) = *(_BYTE *)qword_99A38;
                      qword_99A00 = v436 + 2;
                      if (nLangIDGlb == 12)
                      {
                        if (*(_BYTE *)qword_99A38 == 124)
                        {
                          uint64_t v437 = (_BYTE *)(qword_99A38 + 1);
                          if (*(unsigned __int8 *)(qword_99A38 + 1) - 49 <= 2
                            && (!*(_BYTE *)(qword_99A38 + 2)
                             || !memchr("#123456789", *(unsigned __int8 *)(qword_99A38 + 2), 0xBuLL)))
                          {
                            goto LABEL_1070;
                          }
                        }
                      }

                      else if (nLangIDGlb == 7 && *(_BYTE *)qword_99A38 == 33)
                      {
                        uint64_t v437 = (_BYTE *)(qword_99A38 + 1);
LABEL_1070:
                        qword_99A38 = (uint64_t)v437;
                        *(_BYTE *)(v436 + 2) = *v437;
                        qword_99A00 = v436 + 3;
                      }

                      uint64_t k = (_BYTE **)&unk_99000;
                      uint64_t v457 = (_BYTE *)qword_99A38;
                      unsigned int v33 = (void *)a2;
                      char v34 = (void *)&unk_99000;
                      int v36 = (void *)&unk_99000;
                      int v35 = (void *)&unk_99000;
                      if (!bwd_is_number((_BYTE *)(qword_99A38 + 1))
                        || (lFlags & 0x8000000) != 0
                        || nLangIDGlb == 9 && nSubLangIDGlb == 1 && *v457 == 47)
                      {
                        goto LABEL_92;
                      }

LABEL_116:
                      bwd_add_seg(2LL);
                      unsigned int v41 = (_BYTE *)v34[320];
                      if (byte_99A50) {
                        LOBYTE(v38) = 31;
                      }
                      else {
                        LOBYTE(v38) = 32;
                      }
                      goto LABEL_91;
                    }
                  }

                  v398 = pBwdLangGlb;
                  if (no_exception( 1,  *(unsigned __int8 **)&stru_20.segname[(void)pBwdLangGlb + 8],  v168))
                  {
                    bwd_add_seg(0x4000000LL);
                    uint64_t v399 = qword_99A00;
                    uint64_t v400 = qword_99A00;
                    *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
                    int v401 = (_BYTE *)(v400 + 1);
                    qword_99A00 = (uint64_t)v401;
                    uint64_t v402 = (unsigned __int8 *)qword_99A38;
                    uint64_t v403 = qword_99A38 + 1;
                    if (*(_BYTE *)(qword_99A38 + 1) == 30)
                    {
                      ++qword_99A38;
                      qword_999F8 = 1LL;
                      uint64_t v402 = (unsigned __int8 *)v403;
                    }

                    if (nLangIDGlb == 7)
                    {
                      unsigned int v404 = v402;
                      v405 = "'<=";
                      while (1)
                      {
                        do
                          int v406 = *v404++;
                        while (v406 == 173 || v406 == 30);
                        if (++v405 == "")
                        {
                          qword_99A38 = (uint64_t)++v402;
                          goto LABEL_985;
                        }
                      }
                    }

                    if (nLangIDGlb == 9
                      && nSubLangIDGlb == 3
                      && *v402 == 39
                      && no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  v402 + 1)
                      && v402[2] >= 0x21u)
                    {
                      qword_99A38 = (uint64_t)(v402 + 1);
                      *(_BYTE *)(v399 + 1) = v402[1];
                      int v401 = (_BYTE *)(v399 + 2);
                      qword_99A00 = v399 + 2;
                      uint64_t v402 = (unsigned __int8 *)qword_99A38;
                    }

LABEL_985:
                    unsigned int v33 = (void *)a2;
                    uint64_t k = (_BYTE **)&unk_99000;
                    char v34 = &unk_99000;
                    int v36 = (void *)&unk_99000;
                    int v35 = (void *)&unk_99000;
                    if (no_exception( 1,  *(unsigned __int8 **)((char *)&stru_20.vmsize + (void)pBwdLangGlb),  v402))
                    {
                      unsigned int v409 = v402[1];
                      v408 = v402 + 1;
                      if (v409 >= 0x21)
                      {
                        qword_99A38 = (uint64_t)v408;
                        *int v401 = *v408;
                        qword_99A00 = (uint64_t)(v401 + 1);
                      }
                    }

                    goto LABEL_92;
                  }

                  if ((v343 & 0xC0) != 0) {
                    char v410 = 0;
                  }
                  else {
                    char v410 = v394;
                  }
                  if ((v410 & 1) == 0
                    && !in(v168[1], 9)
                    && no_exception(1, *(unsigned __int8 **)((char *)&dword_18 + (void)v398), v168))
                  {
LABEL_807:
                    uint64_t v330 = 0x1000000LL;
LABEL_808:
                    bwd_add_seg(v330);
                    uint64_t k = (_BYTE **)&unk_99000;
LABEL_809:
                    char v214 = *(_BYTE *)qword_99A38;
                    char v34 = &unk_99000;
                    goto LABEL_810;
                  }

                  goto LABEL_993;
                }

                if ((v343 & 0x20C0) != 0)
                {
                  if (no_exception(1, "\t[.,][.'$<>\x7F\x01'[.,\x01", v168))
                  {
LABEL_873:
                    if (*v168 == 39)
                    {
                      bwd_add_seg(0LL);
                      ++qword_99A38;
                    }
                  }

                  else
                  {
                    unsigned int v354 = *(v168 - 1);
                    if (v354 > 0x3D || ((1LL << v354) & 0x2000420000000000LL) == 0 || *v168 != 46) {
                      goto LABEL_866;
                    }
                  }

                  bwd_add_seg(0x1000000LL);
                  uint64_t k = (_BYTE **)&unk_99000;
                  char v359 = *(_BYTE *)qword_99A38;
                  BOOL v349 = (_BYTE *)qword_99A00;
                  while (1)
                  {
                    *v349++ = v359;
                    v360 = (char *)(qword_99A38 + 1);
                    ++qword_99A38;
                    char v359 = *v360;
                  }

                  char v34 = &unk_99000;
                  goto LABEL_929;
                }

LABEL_866:
                char v355 = v168;
                int v356 = "..";
                while (1)
                {
                  do
                    int v357 = *v355++;
                  while (v357 == 173 || v357 == 30);
                  if (++v356 == "") {
                    goto LABEL_873;
                  }
                }
              }

              uint64_t v168 = (unsigned __int8 *)qword_99A38;
              int v311 = *(unsigned __int8 *)qword_99A38;
            }

            if (v311 == 33)
            {
              BOOL v315 = v168 + 1;
              int v316 = v168[1];
              if (v316 == 46 || v316 == 127)
              {
LABEL_775:
                char v320 = v168 + 1;
                unsigned int v33 = (void *)a2;
                uint64_t k = (_BYTE **)&unk_99000;
                char v34 = (void *)&unk_99000;
                int v36 = (void *)&unk_99000;
                int v35 = (void *)&unk_99000;
                do
                {
                  qword_99A38 = (uint64_t)v320;
                  int v321 = *v320++;
                }

                while (v321 == 33);
                goto LABEL_92;
              }

              v317 = "!\x7F";
              while (1)
              {
                do
                  int v318 = *v315++;
                while (v318 == 173 || v318 == 30);
                if (++v317 == "") {
                  goto LABEL_775;
                }
              }
            }

            else if (v311 == 39 && v168[1] == 127)
            {
              BOOL v312 = v168[2] == 127;
              byte_99BAC = v168[2] != 127;
              byte_99BA8 = v312;
              uint64_t v313 = (uint64_t)(v168 + 1);
              unsigned int v33 = (void *)a2;
              uint64_t k = (_BYTE **)&unk_99000;
              char v34 = (void *)&unk_99000;
              int v36 = (void *)&unk_99000;
              int v35 = (void *)&unk_99000;
              do
              {
                qword_99A38 = v313;
                int v314 = *(unsigned __int8 *)++v313;
              }

              while (v314 == 127);
              goto LABEL_92;
            }

            goto LABEL_778;
          }
        }

        while (*++v277);
LABEL_732:
        bwd_add_seg(2048LL);
        uint64_t v299 = qword_99A00;
        uint64_t v300 = qword_99A00;
        *(_BYTE *)qword_99A00 = *(_BYTE *)qword_99A38;
        v224 = (unsigned __int8 *)(v300 + 1);
        qword_99A00 = (uint64_t)v224;
        if ((int)strlen(*(const char **)((char *)&stru_68.offset + (void)pLangGlb)) >= 2)
        {
          uint64_t v301 = 1LL;
          do
            *(_BYTE *)(v299 + v301++) = *(_BYTE *)++qword_99A38;
          while (v301 < (int)strlen(*(const char **)((char *)&stru_68.offset + (void)pLangGlb)));
          v224 = (unsigned __int8 *)(v299 + v301);
LABEL_736:
          qword_99A00 = (uint64_t)v224;
        }

        unsigned int v302 = (unsigned __int8 *)(qword_99A38 + 1);
        unsigned int v303 = *(unsigned __int8 *)(qword_99A38 + 1);
        BOOL v304 = v303 > 0x20 || ((1LL << v303) & 0x100000201LL) == 0;
        if (v304 && v303 != 160)
        {
          ++qword_99A38;
          char v305 = *(unsigned __int8 **)&stru_B8.segname[(void)pLangGlb - 8];
          int v306 = v302;
          do
          {
            do
              int v307 = *v306++;
            while (v307 == 173 || v307 == 30);
            if (v307 != *v305)
            {
              *v224++ = *v302;
              goto LABEL_736;
            }
          }

          while (*++v305);
          unsigned __int8 *v224 = *v302;
          qword_99A00 = (uint64_t)(v224 + 1);
          uint64_t v310 = 1LL;
          do
            v224[v310++] = *(_BYTE *)++qword_99A38;
          while (v310 < (int)strlen(*(const char **)&stru_B8.segname[(void)pLangGlb - 8]));
LABEL_1296:
          int v283 = (char *)&v224[v310];
          goto LABEL_1297;
        }

LABEL_1298:
        bwd_add_rightchars();
LABEL_1299:
        unsigned int v33 = (void *)a2;
        uint64_t k = (_BYTE **)&unk_99000;
LABEL_1300:
        char v34 = (void *)&unk_99000;
LABEL_669:
        int v36 = (void *)&unk_99000;
LABEL_670:
        int v35 = (void *)&unk_99000;
LABEL_92:
        uint64_t v39 = k[327] + 1;
        k[327] = v39;
        int v38 = *v39;
        if (*v39) {
          continue;
        }
LABEL_1310:
        bwd_add_seg(0LL);
        v36[319] = 0LL;
        v34[320] = v33;
        bwd_char(0LL);
        HIBYTE(word_99AA6) = 0;
        qword_99A28 = 0LL;
        uint64_t v520 = qword_99A48;
        v35[326] = qword_99A48;
        if (!v520)
        {
          v813 = a4;
          uint64_t v812 = v839;
          goto LABEL_2059;
        }

        uint64_t v521 = off_91000;
        v522 = &unk_99000;
        while (2)
        {
          char v523 = *(char **)v520;
          v522[324] = *(void *)v520;
          uint64_t v524 = *(void *)(v520 + 16);
          v36[319] = v524;
          uint64_t v525 = *(void *)(v520 + 48);
          if (v525) {
            uint64_t v526 = *(void *)(v525 + 24);
          }
          else {
            uint64_t v526 = 0LL;
          }
          qword_99A98 = v526;
          uint64_t v527 = *(void *)(v520 + 24);
          if (v527 > 127)
          {
            if (v527 > 0xFFFFFF)
            {
              if (v527 == 0x1000000 || v527 == 0x2000000 || v527 == 0x4000000)
              {
LABEL_1334:
                if (bwd_fetch_char((char *)&v849, v523, v527 == 0x4000000, 0))
                {
                  if (v849 != 34)
                  {
                    if (v849 == 63)
                    {
                      v522 = (void *)&unk_99000;
                      if (v527 == 0x1000000 || nLangIDGlb != 9 || nSubLangIDGlb == 3) {
                        uint64_t v652 = 63LL;
                      }
                      else {
                        uint64_t v652 = 34LL;
                      }
                    }

                    else
                    {
                      v522 = (void *)&unk_99000;
                      if (v849 == 133)
                      {
                        char v534 = 46;
                        for (uint64_t m = 1LL; m != 4; ++m)
                        {
                          bwd_char(v534);
                          char v534 = asc_203AB[m];
                        }

                        goto LABEL_2050;
                      }

                      uint64_t v652 = (char)v849;
                    }

                    bwd_char(v652);
                    goto LABEL_2050;
                  }

                  if (nLangIDGlb == 9
                    && nSubLangIDGlb == 3
                    && *v523 == 40
                    && (!v525 || v527 == 0x1000000 || *(void *)(v525 + 24) <= 2uLL))
                  {
                    uint64_t v544 = 63LL;
                  }

                  else
                  {
                    uint64_t v544 = 34LL;
                  }

LABEL_1607:
                  bwd_char(v544);
                }

                else
                {
                  char v547 = *v523;
                  v546 = (unsigned __int8 *)(v523 + 1);
                  char v545 = v547;
                  do
                  {
                    bwd_char(v545);
                    int v548 = *v546++;
                    char v545 = v548;
                  }

                  while (v548);
                }

LABEL_1608:
                v522 = (void *)&unk_99000;
                goto LABEL_2050;
              }

LABEL_1361:
              if (v524 >= 1)
              {
                v36[319] = 0LL;
                bwd_char(30LL);
                uint64_t v520 = v35[326];
                uint64_t v527 = *(void *)(v520 + 24);
              }

              dword_99AA0 = (v527 >> 20) & 1;
              dword_999F0 = (v527 >> 10) & 1;
              else {
                dword_99AA0 = byte_99A90 == 1;
              }
              BOOL v653 = 0;
              int v654 = *(unsigned __int8 **)v520;
              qword_99A20 = v34[320];
              while (1)
              {
                unsigned int v655 = *v654;
                if (v653)
                {
                  if (*v654)
                  {
                    if (v655 > 0xDE || (v655 - 123) >= 0xE6u)
                    {
                      LOBYTE(v655) = v655 & 0xDF;
                    }

                    else if (v655 == 124)
                    {
                      LOBYTE(v655) = -9;
                    }
                  }

                  bwd_char((char)v655);
                  BOOL v653 = *v654 != *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb);
                }

                else
                {
                  char v656 = v521[133];
                  if (v655 == **(unsigned __int8 **)((char *)&stru_20.maxprot + (void)v656))
                  {
                    int v657 = nLangIDGlb;
                    if (nLangIDGlb == 7)
                    {
                      if (v654 == *(unsigned __int8 **)v35[326] || memchr("cqxy~", (char)v654[1], 6uLL))
                      {
LABEL_1632:
                        int v657 = nLangIDGlb;
LABEL_1633:
                        BOOL v653 = v657 == 12;
LABEL_1640:
                        byte_99AA5 = v655;
                        LOBYTE(word_99AA6) = v654[1];
                        if (v654[1])
                        {
                          --*(void *)(v35[326] + 8LL);
                          ++v654;
                        }

                        while (v657 == 12 || v657 == 9)
                        {
                          int v660 = v521[133];
                          int v661 = *v654;
                          bwd_char((char)v661);
                          int v657 = nLangIDGlb;
                          ++v654;
                        }

                        if (!bwd_fetch_char((char *)&v849, &byte_99AA5, 0, 1))
                        {
                          unsigned int v662 = *v654;
                          unsigned __int8 v849 = *v654;
                          int v36 = (void *)&unk_99000;
                          v522 = &unk_99000;
                          goto LABEL_1655;
                        }

                        unsigned int v662 = v849;
                        v522 = (void *)&unk_99000;
                        if (v657 == 7)
                        {
                          int v36 = (void *)&unk_99000;
                          if (v849 == 36)
                          {
                            if (v654[1] && (v654[1] & 0xDFu) - 91 >= 0xFFFFFFE6)
                            {
                              unsigned int v662 = 154;
                              unsigned __int8 v849 = -102;
                            }

                            else
                            {
                              unsigned int v662 = 36;
                            }

                            goto LABEL_1656;
                          }

LABEL_1655:
                          if (v662)
                          {
LABEL_1656:
                          }
                        }

                        else
                        {
                          int v36 = (void *)&unk_99000;
                          if (v849) {
                            goto LABEL_1656;
                          }
                        }

                        bwd_char((char)v662);
                        goto LABEL_1660;
                      }
                    }

                    else
                    {
                      if (nLangIDGlb != 12 && nLangIDGlb != 9) {
                        goto LABEL_1633;
                      }
                      if (v654 == *(unsigned __int8 **)v35[326]
                        || *(v654 - 1) == *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb))
                      {
                        goto LABEL_1632;
                      }
                    }
                  }

                  int v657 = nLangIDGlb;
                  if (v655 == **(unsigned __int8 **)((char *)&stru_20.nsects + (void)v656) && nLangIDGlb != 12)
                  {
                    BOOL v653 = 0;
                    goto LABEL_1640;
                  }

                  bwd_char((char)v655);
                  BOOL v653 = 0;
                  int v36 = (void *)&unk_99000;
                }

                v522 = (void *)&unk_99000;
LABEL_1660:
                int v663 = *++v654;
                int v664 = &unk_99000;
                v665 = (unsigned __int8 *)v847;
                if (!v663)
                {
                  *(_BYTE *)v34[320] = 0;
                  unsigned int v666 = (char *)v522[324];
                  unsigned __int8 v843 = *(v666 - 1);
                  unsigned __int8 v849 = v843;
                  *(v666 - 1) = 0;
                  uint64_t v667 = v35[326];
                  uint64_t v668 = *(void *)(v667 + 8);
                  if (v668 >= 1)
                  {
                    int v669 = (unsigned __int8 *)(v666 - 1);
                    int v670 = 1;
                    do
                    {
                      seg_index[v669[v668]] = v670;
                      seg_start[v669[v668]] = &v669[v668];
                      ++v670;
                      --v668;
                    }

                    while (v668);
                  }

                  if ((*(int *)((_BYTE *)&dword_8 + (void)pBwdLangGlb) & 0x80000000) == 0)
                  {
                    uint64_t v671 = 0LL;
                    int v672 = (const char **)*pBwdLangGlb;
                    v673 = off_91000;
                    while (1)
                    {
                      unsigned int v674 = v672[2];
                      uint64_t v675 = *(unsigned __int8 *)*v672;
                      uint64_t v676 = (int)seg_index[v675];
                      if ((uint64_t)v674 > v676
                        || !seg_index[(*v672)[(void)v674 - 1]]
                        || (*(_DWORD *)(v667 + 32) & (_DWORD)v672[7] & 0x9000FFFF) != 0)
                      {
                        goto LABEL_1727;
                      }

                      uint64_t v677 = (unsigned __int8 *)seg_start[v675];
                      v664[327] = v677;
                      v678 = *v672;
LABEL_1674:
                      v665 = (unsigned __int8 *)v676;
                      while (1)
                      {
                        uint64_t v679 = 1LL;
                        while (1)
                        {
                          int v680 = v678[v679];
                          if (!v678[v679]) {
                            break;
                          }
                          int v681 = v677[v679++];
                          if (v681 != v680) {
                            goto LABEL_1721;
                          }
                        }

                        int v848 = v665;
                        v682 = &v677[v679];
                        int v683 = (char)*(v677 - 1);
                        if (v683 == 32) {
                          break;
                        }
                        int v685 = *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb);
                        if (v685 == v683
                          && !strchr(v678, v683)
                          && no_exception(1, byte_26C40, v677))
                        {
                          break;
                        }

                        int v686 = *v682;
                        if ((v686 | 0x20) == 0x20 || v686 == v685 && !strchr(v678, (char)v685))
                        {
                          if ((*((_BYTE *)v672 + 50) & 1) == 0) {
                            goto LABEL_1718;
                          }
                          int v687 = no_exception(0, (unsigned __int8 *)v672[4], v677 - 1);
                          unsigned int v33 = (void *)a2;
                        }

                        else
                        {
                          if ((*((_BYTE *)v672 + 49) & 0x80) == 0)
                          {
LABEL_1718:
                            unsigned int v33 = (void *)a2;
LABEL_1719:
                            int v664 = &unk_99000;
                            v665 = v848;
                            int v35 = &unk_99000;
                            goto LABEL_1720;
                          }

                          unsigned int v33 = (void *)a2;
                          if (!no_exception( 1,  (unsigned __int8 *)v672[5],  (unsigned __int8 *)&v674[(void)v677])) {
                            goto LABEL_1719;
                          }
                          int v687 = no_exception(0, (unsigned __int8 *)v672[4], v677 - 1);
                        }

                        int v35 = (void *)&unk_99000;
                        if (!v687) {
                          goto LABEL_1717;
                        }
LABEL_1695:
                        unsigned int v690 = *(unsigned __int8 *)v678;
                        BOOL v689 = (unsigned __int8 *)(v678 + 1);
                        uint64_t v688 = v690;
                        do
                        {
                          seg_index[v688] = 0;
                          unsigned int v691 = *v689++;
                          uint64_t v688 = v691;
                        }

                        while (v691);
                        int64_t v692 = (int64_t)v672[3];
                        uint64_t v693 = v692 - (void)v674;
                        if (v692 <= (uint64_t)v674)
                        {
                          v695 = v677;
                        }

                        else
                        {
                          uint64_t v694 = qword_99A00;
                          v695 = v677;
                          if (qword_99A08 - qword_99A00 > v693)
                          {
                            *(void *)(v667 + 8) += v693;
                            qword_99A00 = v694 + v693;
                            uint64_t v696 = &v677[v692];
                            size_t v697 = strlen((const char *)&v677[v679]);
                            memmove(v696, &v677[v679], v697 + 1);
                            v695 = (unsigned __int8 *)qword_99A38;
                            int64_t v692 = (int64_t)v672[3];
                          }
                        }

                        memcpy(v695, v672[1], v692);
                        uint64_t v699 = (unsigned __int8 *)v672[2];
                        uint64_t v698 = v672[3];
                        int v664 = &unk_99000;
                        uint64_t v700 = qword_99A38;
                        qword_99A38 += (uint64_t)v698;
                        v701 = (_BYTE *)qword_99A38;
                        if ((unint64_t)v682 > qword_99A38)
                        {
                          *(void *)(qword_99A30 + 8) = &v698[v700 + *(void *)(qword_99A30 + 8)]
                                                       - (const char *)v677
                                                       - v679;
                          qword_99A00 = &v701[qword_99A00] - v677 - v679;
                          size_t v702 = strlen((const char *)&v677[v679]);
                          memmove(v701, &v677[v679], v702 + 1);
                          int v664 = &unk_99000;
                        }

                        uint64_t v667 = qword_99A30;
                        uint64_t v703 = *(void *)(qword_99A30 + 8);
                        if (v703 >= 1)
                        {
                          uint64_t v704 = qword_99A20 - 1;
                          int v705 = 1;
                          do
                          {
                            seg_index[*(unsigned __int8 *)(v704 + v703)] = v705;
                            seg_start[*(unsigned __int8 *)(v704 + v703)] = v704 + v703;
                            ++v705;
                            --v703;
                          }

                          while (v703);
                        }

                        v665 = (unsigned __int8 *)(v848 - v699);
                        unsigned int v674 = v672[2];
                        uint64_t v521 = off_91000;
                        v673 = off_91000;
                        if ((uint64_t)v674 > v848 - v699)
                        {
                          int v35 = (void *)&unk_99000;
                          goto LABEL_1727;
                        }

                        v678 = *v672;
                        int v35 = (void *)&unk_99000;
                        uint64_t v677 = (unsigned __int8 *)qword_99A38;
                      }

                      int v684 = *v682;
                      unsigned int v33 = (void *)a2;
                      if ((v684 | 0x20) == 0x20
                        || *((unsigned __int8 *)&stru_20.filesize + (void)pBwdLangGlb) == v684
                        && !strchr(v678, (char)v684))
                      {
                        break;
                      }

                      int v35 = (void *)&unk_99000;
                      if ((*((_BYTE *)v672 + 49) & 0x40) != 0
                        && no_exception( 1,  (unsigned __int8 *)v672[5],  (unsigned __int8 *)&v674[(void)v677]))
                      {
                        goto LABEL_1695;
                      }

LABEL_1717:
                      int v664 = (void *)&unk_99000;
                      v665 = v848;
LABEL_1720:
                      uint64_t v521 = off_91000;
LABEL_1721:
                      int v706 = v677 + 1;
                      uint64_t v676 = (uint64_t)v665;
                      v673 = off_91000;
                      while (2)
                      {
                        if (v676 > (uint64_t)v674)
                        {
                          --v676;
                          v664[327] = v706;
                          int v707 = *v706++;
                          v678 = *v672;
                          uint64_t v677 = v706 - 1;
                          goto LABEL_1674;
                        }

                        break;
                      }

LABEL_1727:
                      v672 += 8;
                      BOOL v31 = v671++ < *(int *)((char *)&dword_8 + (void)v673[135]);
                      if (!v31)
                      {
                        v522 = &unk_99000;
                        unsigned int v666 = (char *)qword_99A20;
                        char v34 = &unk_99000;
                        int v36 = (void *)&unk_99000;
                        goto LABEL_1730;
                      }
                    }

                    int v35 = (void *)&unk_99000;
                    if ((*((_BYTE *)v672 + 49) & 0x20) == 0) {
                      goto LABEL_1717;
                    }
                    goto LABEL_1695;
                  }

LABEL_1730:
                  uint64_t v847 = (uint64_t)v665;
                  *(v666 - 1) = v843;
                  uint64_t v708 = *v666;
                  uint64_t v709 = 1LL;
                  do
                  {
                    seg_index[v708] = 0;
                    uint64_t v708 = v666[v709++];
                  }

                  while ((_DWORD)v708);
                  LOBYTE(word_99AA6) = 0;
                  while (2)
                  {
                    int v710 = v521[133];
                    int v711 = *(const char **)&stru_68.segname[(void)v710 - 8];
                    v712 = v666;
                    char v713 = v711;
                    while (1)
                    {
                      do
                        int v714 = *v712++;
                      while (v714 == 173 || v714 == 30);
                      if (!*(unsigned __int8 *)++v713)
                      {
LABEL_1748:
                        dword_999F0 = 1;
LABEL_1749:
                        size_t v722 = strlen(v711);
                        size_t v723 = strlen(v666) - v722 + 1;
                        unsigned int v724 = v666;
                        BOOL v725 = (unsigned __int8 *)&v666[v722];
                        uint64_t v521 = off_91000;
                        goto LABEL_1750;
                      }
                    }

                    int v711 = *(const char **)&stru_68.sectname[(void)v710];
                    int v717 = v666;
                    uint64_t v718 = v711;
                    while (1)
                    {
                      do
                        int v719 = *v717++;
                      while (v719 == 173 || v719 == 30);
                    }

                    int v711 = *(const char **)&stru_68.segname[(void)v710];
                    uint64_t v726 = v666;
                    v727 = v711;
                    while (1)
                    {
                      do
                        int v728 = *v726++;
                      while (v728 == 173 || v728 == 30);
                      if (!*(unsigned __int8 *)++v727)
                      {
                        dword_999F0 = 0;
                        goto LABEL_1749;
                      }
                    }

                    if (nLangIDGlb == 7)
                    {
                      v731 = v666;
                      v732 = "!$";
                      while (1)
                      {
                        do
                          int v733 = *v731++;
                        while (v733 == 173 || v733 == 30);
                        if (++v732 == "")
                        {
                          dword_99AA0 = 1;
                          byte_99A90 = 0;
LABEL_1786:
                          BOOL v736 = (unsigned __int8 *)(v666 + 2);
                          size_t v723 = strlen(v666) - 1;
                          goto LABEL_1787;
                        }
                      }
                    }

                    uint64_t v735 = *v666;
                    if ((_DWORD)v735 == **(unsigned __int8 **)((char *)&stru_20.filesize + (void)v710))
                    {
                      if (nLangIDGlb != 9
                        || nSubLangIDGlb == 3
                        || !equals_nocase((unsigned __int8 *)v666 - 1, "O'CLOCK"))
                      {
                        BOOL v736 = (unsigned __int8 *)(v666 + 1);
                        if (in(v666[1], 9))
                        {
                          dword_99AA0 = 1;
                          byte_99A90 = 0;
                          goto LABEL_1776;
                        }

                        v522[324] = v736;
LABEL_1751:
                        unsigned int v666 = (char *)v522[324];
                        if (!*v666)
                        {
                          v34[320] = v666;
                          goto LABEL_2050;
                        }

                        continue;
                      }

LABEL_1814:
                      uint64_t v746 = (uint64_t)(v666 + 1);
LABEL_1815:
                      v522[324] = v746;
                      goto LABEL_1751;
                    }

                    break;
                  }

                  if (nLangIDGlb == 12)
                  {
                    BOOL v737 = v666;
                    v738 = ":$";
                    while (1)
                    {
                      do
                        int v739 = *v737++;
                      while (v739 == 173 || v739 == 30);
                      if (++v738 == "")
                      {
                        dword_99AA0 = 1;
                        byte_99A90 = 1;
                        goto LABEL_1786;
                      }
                    }
                  }

                  if (nLangIDGlb == 9)
                  {
                    v741 = v666;
                    int v742 = "**";
                    while (1)
                    {
                      do
                        int v743 = *v741++;
                      while (v743 == 173 || v743 == 30);
                      if (++v742 == "")
                      {
                        size_t v745 = strlen(v666);
                        memmove(v666, v666 + 1, v745);
                        uint64_t v746 = v522[324] + 1LL;
                        goto LABEL_1815;
                      }
                    }

                    if (dword_999F0)
                    {
                      if ((*(_BYTE *)(v35[326] + 25LL) & 4) != 0 && !strcmp(v666, ".s"))
                      {
                        dword_999F0 = 0;
                        BOOL v736 = (unsigned __int8 *)(v666 + 1);
LABEL_1776:
                        size_t v723 = strlen(v666);
LABEL_1787:
                        unsigned int v724 = v666;
                        BOOL v725 = v736;
LABEL_1750:
                        memmove(v724, v725, v723);
                        goto LABEL_1751;
                      }

                      BOOL v747 = 1;
                      goto LABEL_1806;
                    }

                    BOOL v747 = 0;
                  }

                  else
                  {
                    BOOL v747 = dword_999F0 != 0;
                  }

                  if (nLangIDGlb == 12 && (_DWORD)v735 == 247)
                  {
                    *unsigned int v666 = 47;
                    v522[324] = v666 + 1;
                    goto LABEL_1751;
                  }

LABEL_1806:
                  if ((_DWORD)v735 == 150 || (_DWORD)v735 == 151 && (lFlags & 0x20000000) == 0)
                  {
                    char v748 = 45;
                    goto LABEL_1813;
                  }

                  if (in(v735, 41))
                  {
                    byte_99AA5 = v735;
                    char v748 = v849;
                    goto LABEL_1813;
                  }

                  if (dword_99AA0) {
                    int v749 = 1;
                  }
                  else {
                    int v749 = v747;
                  }
                  if (v749 != 1)
                  {
                    switch((_DWORD)v735)
                    {
                      case 0:
                        goto LABEL_1814;
                      case 0x8C:
                        char v748 = -100;
                        break;
                      case 0x8A:
                        char v748 = -102;
                        break;
                      default:
                        char v748 = v735 | 0x20;
                        break;
                    }

LABEL_1813:
                    *unsigned int v666 = v748;
                    goto LABEL_1814;
                  }

                  if ((_DWORD)v735)
                  {
                    if ((_DWORD)v735 == 154)
                    {
                      char v750 = -118;
                      goto LABEL_1834;
                    }

                    if ((_DWORD)v735 == 156)
                    {
                      char v750 = -116;
                      goto LABEL_1834;
                    }

                    if (v735 > 0xDE || (v735 - 123) >= 0xE6u)
                    {
                      char v750 = v735 & 0xDF;
LABEL_1834:
                      *unsigned int v666 = v750;
                    }
                  }

                  dword_99AA0 = 0;
                  goto LABEL_1814;
                }
              }
            }

            if (v527 == 128) {
              goto LABEL_1353;
            }
            if (v527 != 2048) {
              goto LABEL_1361;
            }
            v536 = v521[133];
            v522 = &unk_99000;
            if (nLangIDGlb == 9 && nSubLangIDGlb == 1)
            {
              v537 = *(const char **)((char *)&stru_68.flags + (void)v536);
              v538 = v523;
              v539 = v537;
              do
              {
                do
                  int v540 = *v538++;
                while (v540 == 173 || v540 == 30);
              }

              while (*(unsigned __int8 *)++v539);
              BOOL v543 = 1;
            }

            else
            {
LABEL_1399:
              BOOL v543 = 0;
              v537 = *(const char **)((char *)&stru_68.offset + (void)v536);
            }

            int v563 = &v523[strlen(v537)];
            qword_99A20 = (uint64_t)v563;
            LOBYTE(v564) = *v563;
            if (!*v563) {
              goto LABEL_2049;
            }
LABEL_1401:
            uint64_t v565 = *(void *)&stru_20.segname[(void)pLangGlb];
            if (!v565)
            {
              if (nLangIDGlb == 12)
              {
                switch(v564)
                {
                  case '!':
                    int v628 = v563[1];
                    uint64_t v627 = v563 + 1;
                    if (!v628)
                    {
                      uint64_t v573 = 4294967220LL;
                      goto LABEL_1591;
                    }

                    uint64_t v629 = 0LL;
                    qword_99A20 = (uint64_t)v627;
                    do
                    {
                      if (brl_set_ansi[v629] == *v627) {
                        goto LABEL_1531;
                      }
                      ++v629;
                    }

                    while (v629 != 256);
                    LOBYTE(v629) = 0;
LABEL_1531:
                    uint64_t v564 = brl_set_ansi[(v629 & 0x3F) + 192];
                    break;
                  case '""':
                    int v631 = v563[1];
                    uint64_t v630 = v563 + 1;
                    if (!v631)
                    {
                      uint64_t v573 = 94LL;
                      goto LABEL_1591;
                    }

                    uint64_t v632 = 0LL;
                    qword_99A20 = (uint64_t)v630;
                    do
                    {
                      if (brl_set_ansi[v632] == *v630) {
                        goto LABEL_1537;
                      }
                      ++v632;
                    }

                    while (v632 != 256);
                    LOBYTE(v632) = 0;
LABEL_1537:
                    uint64_t v564 = brl_set_ansi[(v632 & 0x7F) + 128];
                    break;
                  case '$':
                    if (v563[1] == 36)
                    {
                      qword_99A20 = (uint64_t)(v563 + 1);
                      unsigned int v644 = v563[2];
                      uint64_t v643 = (uint64_t)(v563 + 2);
                      unsigned int v642 = v644;
                      if (!v644) {
                        goto LABEL_1592;
                      }
                      while (1)
                      {
                        if (v642 - 58 <= 0xFFFFFFF5 && v642 <= 0xDE && v642 - 123 < 0xFFFFFFE6) {
                          goto LABEL_1592;
                        }
                        uint64_t v645 = 0LL;
                        qword_99A20 = v643;
                        do
                        {
                          ++v645;
                        }

                        while (v645 != 256);
                        LOBYTE(v645) = 0;
LABEL_1566:
                        bwd_char(brl_set_tbfr2007[brl_set_ansi[(v645 & 0xBF) + 64]]);
                        unsigned int v646 = *(unsigned __int8 *)++v643;
                        unsigned int v642 = v646;
                        if (!v646) {
                          goto LABEL_1592;
                        }
                      }
                    }

                    if (!v563[1])
                    {
                      uint64_t v573 = 4294967208LL;
LABEL_1591:
                      bwd_char(v573);
                      goto LABEL_1592;
                    }

                    uint64_t v647 = 0LL;
                    qword_99A20 = (uint64_t)(v563 + 1);
                    do
                    {
                      if (brl_set_ansi[v647] == v563[1]) {
                        goto LABEL_1572;
                      }
                      ++v647;
                    }

                    while (v647 != 256);
                    LOBYTE(v647) = 0;
LABEL_1572:
                    uint64_t v564 = brl_set_ansi[(v647 & 0xBF) + 64];
                    break;
                  default:
                    uint64_t v566 = *(const char **)&stru_B8.segname[(void)pLangGlb - 8];
                    int v633 = v563;
                    int v634 = v566;
                    while (1)
                    {
                      do
                        int v635 = *v633++;
                      while (v635 == 173 || v635 == 30);
                      if (!*(unsigned __int8 *)++v634)
                      {
LABEL_1409:
                        size_t v572 = (size_t)&v563[strlen(v566)];
                        goto LABEL_1525;
                      }
                    }

                    uint64_t v564 = v564;
                    break;
                }

                uint64_t v573 = brl_set_tbfr2007[v564];
                goto LABEL_1591;
              }

              switch(v564)
              {
                case '\'':
                  int v639 = v563[1];
                  uint64_t v585 = v563 + 1;
                  int v638 = v639;
                  if (v639 == 46)
                  {
                    qword_99A20 = (uint64_t)v585;
                    goto LABEL_1592;
                  }

                  if (v638 != 39)
                  {
                    if (!v638)
                    {
                      uint64_t v573 = 39LL;
                      goto LABEL_1591;
                    }

                    uint64_t v651 = 0LL;
                    qword_99A20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v651] == *v585) {
                        goto LABEL_1589;
                      }
                      ++v651;
                    }

                    while (v651 != 256);
                    LODWORD(v651) = 0;
LABEL_1589:
                    uint64_t v649 = (int)v651 | 0x80LL;
                    goto LABEL_1590;
                  }

                  break;
                case '$':
                  int v641 = v563[1];
                  uint64_t v585 = v563 + 1;
                  int v640 = v641;
                  if (v641 != 36)
                  {
                    if (!v640)
                    {
                      uint64_t v573 = 36LL;
                      goto LABEL_1591;
                    }

                    uint64_t v650 = 0LL;
                    qword_99A20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v650] == *v585) {
                        goto LABEL_1583;
                      }
                      ++v650;
                    }

                    while (v650 != 256);
                    LODWORD(v650) = 0;
LABEL_1583:
                    uint64_t v649 = (int)v650 | 0xC0LL;
                    goto LABEL_1590;
                  }

                  break;
                case '""':
                  int v586 = v563[1];
                  uint64_t v585 = v563 + 1;
                  int v584 = v586;
                  if (v586 != 34)
                  {
                    if (!v584)
                    {
                      uint64_t v573 = 34LL;
                      goto LABEL_1591;
                    }

                    uint64_t v648 = 0LL;
                    qword_99A20 = (uint64_t)v585;
                    do
                    {
                      if (brl_set_ansi[v648] == *v585) {
                        goto LABEL_1578;
                      }
                      ++v648;
                    }

                    while (v648 != 256);
                    LODWORD(v648) = 0;
LABEL_1578:
                    uint64_t v649 = (int)v648 | 0x40LL;
LABEL_1590:
                    uint64_t v573 = brl_set_ansi[v649];
                    goto LABEL_1591;
                  }

                  break;
                default:
                  uint64_t v573 = (char)v564;
                  goto LABEL_1591;
              }

              qword_99A20 = (uint64_t)v585;
              uint64_t v573 = (char)*v585;
              goto LABEL_1591;
            }

            uint64_t v566 = *(const char **)&stru_B8.segname[(void)pLangGlb - 8];
            uint64_t v567 = v563;
            v568 = v566;
            while (1)
            {
              do
                int v569 = *v567++;
              while (v569 == 173 || v569 == 30);
            }

            dword_99AA0 = 0;
            if (v543)
            {
              v574 = v563;
              int v575 = *(unsigned __int8 **)((char *)&stru_68.reserved2 + (void)pLangGlb);
              do
              {
                do
                  int v576 = *v574++;
                while (v576 == 173 || v576 == 30);
                if (v576 != *v575) {
                  goto LABEL_1438;
                }
              }

              while (*++v575);
              size_t v579 = strlen(*(const char **)((char *)&stru_68.reserved2 + (void)pLangGlb));
              char v580 = (unsigned __int8 *)&v563[v579];
              unsigned int v581 = v563[v579];
              if (v563[v579])
              {
                if (v581 > 0xDE || v581 - 123 >= 0xFFFFFFE6)
                {
                  unsigned int v583 = 0;
                  qword_99A20 = (uint64_t)&v563[v579];
                  BOOL v543 = 1;
LABEL_1489:
                  int v563 = (char *)v580;
LABEL_1494:
                  unsigned int v594 = *v563;
                  goto LABEL_1495;
                }
              }

LABEL_1438:
              v587 = v563;
              v588 = *(unsigned __int8 **)&stru_B8.sectname[(void)pLangGlb];
              do
              {
                do
                  int v589 = *v587++;
                while (v589 == 173 || v589 == 30);
                if (v589 != *v588) {
                  goto LABEL_1450;
                }
              }

              while (*++v588);
              char v580 = (unsigned __int8 *)&v563[strlen(*(const char **)&stru_B8.sectname[(void)pLangGlb])];
              unsigned int v592 = *v580;
              if (!*v580 || (v592 <= 0xDE ? (BOOL v593 = v592 - 123 >= 0xFFFFFFE6) : (BOOL v593 = 1), !v593))
              {
LABEL_1450:
                if (nSubLangIDGlb == 1)
                {
                  unsigned int v583 = 0;
                  unsigned int v594 = *v563;
                  BOOL v543 = v594 > 0x20;
LABEL_1495:
                  if (v594 < 0x21) {
                    goto LABEL_1592;
                  }
                  uint64_t v615 = 0LL;
                  while (1)
                  {
                    v616 = *(unsigned __int8 **)(v565 + 8 * v615);
                    char v617 = v563;
                    while (1)
                    {
                      do
                        int v618 = *v617++;
                      while (v618 == 173 || v618 == 30);
                      if (v618 != *v616) {
                        break;
                      }
                      if (!*++v616)
                      {
                        int v621 = v543 | v583;
                        BOOL v622 = (v615 - 91) >= 0xE6u || (v615 + 33) >= 0xE1u;
                        char v623 = v615 | 0x20;
                        if (!v622) {
                          char v623 = v615;
                        }
                        if (!(_BYTE)v615) {
                          char v623 = v615;
                        }
                        BOOL v624 = (v615 - 123) >= 0xE6u || v615 >= 0xDFu;
                        char v625 = v615 & 0xDF;
                        if (!v624) {
                          char v625 = v615;
                        }
                        if (!(_BYTE)v615) {
                          char v625 = v615;
                        }
                        if (v621 == 1) {
                          char v626 = v625;
                        }
                        else {
                          char v626 = v623;
                        }
                        bwd_char(v626);
LABEL_1525:
                        qword_99A20 = v572 - 1;
LABEL_1592:
                        int v563 = (char *)(qword_99A20 + 1);
                        qword_99A20 = (uint64_t)v563;
                        LOBYTE(v564) = *v563;
                        if (!*v563) {
                          goto LABEL_2049;
                        }
                        goto LABEL_1401;
                      }
                    }

                    if (++v615 == 256) {
                      goto LABEL_1592;
                    }
                  }
                }

                unsigned int v583 = 0;
                goto LABEL_1491;
              }
            }

            else
            {
              if (nSubLangIDGlb == 1)
              {
                v595 = v563;
                char v596 = *(unsigned __int8 **)((char *)&stru_68.flags + (void)pLangGlb);
                do
                {
                  do
                    int v597 = *v595++;
                  while (v597 == 173 || v597 == 30);
                  if (v597 != *v596) {
                    goto LABEL_1461;
                  }
                }

                while (*++v596);
                size_t v600 = strlen(*(const char **)((char *)&stru_68.flags + (void)pLangGlb));
                unsigned int v583 = 0;
                v563 += v600;
                qword_99A20 = (uint64_t)v563;
LABEL_1491:
                BOOL v543 = 1;
                goto LABEL_1494;
              }

LABEL_1461:
              int v601 = v563;
              int v602 = *(unsigned __int8 **)&stru_B8.sectname[(void)pLangGlb];
              do
              {
                do
                  int v603 = *v601++;
                while (v603 == 173 || v603 == 30);
                if (v603 != *v602) {
                  goto LABEL_1475;
                }
              }

              while (*++v602);
              char v580 = (unsigned __int8 *)&v563[strlen(*(const char **)&stru_B8.sectname[(void)pLangGlb])];
              unsigned int v606 = *v580;
              if (!*v580 || (v606 <= 0xDE ? (BOOL v607 = v606 - 123 >= 0xFFFFFFE6) : (BOOL v607 = 1), !v607))
              {
LABEL_1475:
                uint64_t v608 = v563;
                uint64_t v609 = *(unsigned __int8 **)((char *)&stru_68.reserved2 + (void)pLangGlb);
                do
                {
                  do
                    int v610 = *v608++;
                  while (v610 == 173 || v610 == 30);
                  if (v610 != *v609) {
                    goto LABEL_1492;
                  }
                }

                while (*++v609);
                size_t v613 = strlen(*(const char **)((char *)&stru_68.reserved2 + (void)pLangGlb));
                char v580 = (unsigned __int8 *)&v563[v613];
                unsigned int v583 = v563[v613];
                if (v563[v613])
                {
                  if (v583 > 0xDE || v583 - 123 >= 0xFFFFFFE6)
                  {
                    BOOL v543 = 0;
                    qword_99A20 = (uint64_t)&v563[v613];
                    unsigned int v583 = 1;
                    dword_99AA0 = 1;
                    goto LABEL_1489;
                  }

LABEL_1492:
                  unsigned int v583 = 0;
                }

                BOOL v543 = 0;
                goto LABEL_1494;
              }
            }

            unsigned int v583 = 0;
            BOOL v543 = 0;
            qword_99A20 = (uint64_t)v580;
            goto LABEL_1489;
          }

          if (v527 <= 3)
          {
            if ((unint64_t)(v527 - 1) >= 2)
            {
              if (v527) {
                goto LABEL_1361;
              }
            }

            else
            {
              char v530 = *v523;
              uint64_t v529 = (unsigned __int8 *)(v523 + 1);
              char v528 = v530;
              do
              {
                bwd_char(v528);
                int v531 = *v529++;
                char v528 = v531;
              }

              while (v531);
            }

            goto LABEL_1608;
          }

          if (v527 == 4) {
            goto LABEL_1334;
          }
          if (v527 != 32)
          {
            if (v527 != 64) {
              goto LABEL_1361;
            }
LABEL_1353:
            if ((nLangIDGlb != 12 || (lFlags & 0x40000000) != 0)
              && bwd_fetch_char((char *)&v849, v523, 0, 0))
            {
              uint64_t v544 = (char)v849;
              goto LABEL_1607;
            }

            v522 = &unk_99000;
            qword_99A20 = (uint64_t)(v523 + 1);
            if (v523[1] == 45)
            {
              qword_99A20 = (uint64_t)(v523 + 2);
              bwd_char(45LL);
              if (*(_BYTE *)qword_99A20 == 44)
              {
                ++qword_99A20;
                bwd_char(44LL);
              }
            }

            uint64_t v549 = qword_99A28;
            int v550 = nLangIDGlb;
            if ((unint64_t)qword_99A28 < 3)
            {
LABEL_1373:
              if (v550 == 9) {
                goto LABEL_1374;
              }
              BOOL v842 = 0;
            }

            else
            {
              if (nLangIDGlb != 9 || (lFlags & 0x40000000) != 0)
              {
                int v551 = *(unsigned __int8 *)qword_99A20;
                if ((v551 | 2) == 0x2E)
                {
                  ++qword_99A20;
                  bwd_char((char)v551);
                  int v550 = nLangIDGlb;
                }

                goto LABEL_1373;
              }

LABEL_1374:
              BOOL v842 = 0;
              unsigned int v552 = *(unsigned __int8 *)qword_99A20;
              int v550 = 9;
              if (v552 >= 0x21 && v552 != 160)
              {
                int v553 = 0;
                v554 = (unsigned __int8 *)(qword_99A20 + 1);
                char v555 = (unsigned __int8 *)(qword_99A20 + 1);
                unsigned int v556 = *(unsigned __int8 *)qword_99A20;
                do
                {
                  if (v556 == 45) {
                    ++v553;
                  }
                  unsigned int v557 = *v555++;
                  unsigned int v556 = v557;
                }

                while (v557 >= 0x21 && v556 != 160);
                if (v553 == 2)
                {
                  int v558 = 0;
                  do
                  {
                    if (v552 == 36) {
                      ++v558;
                    }
                    unsigned int v559 = *v554++;
                    unsigned int v552 = v559;
                  }

                  while (v559 >= 0x21 && v552 != 160);
                  BOOL v842 = v558 == 0;
                }

                else
                {
                  BOOL v842 = 0;
                }

                int v550 = 9;
              }
            }

            if (v550 == 12
              || (lFlags & 0x40000000) != 0
              || !*(_BYTE *)qword_99A20
              || !memchr(",;:/?+=(*)", *(unsigned __int8 *)qword_99A20, 0xBuLL))
            {
              int v754 = 1;
              uint64_t v755 = 64LL;
            }

            else
            {
              int v754 = 0;
              uint64_t v755 = 128LL;
            }

            uint64_t v756 = qword_99A30;
            *(void *)(qword_99A30 + 24) = v755;
            uint64_t v757 = qword_99A98;
            if (qword_99A98 == 2)
            {
              uint64_t v758 = *(uint64_t **)(*(void *)(v756 + 48) + 48LL);
              if (v758)
              {
                uint64_t v759 = *(unsigned __int8 **)((char *)&stru_20.fileoff + (void)v521[133]);
                create_buffer(1, *v758, 0LL);
                uint64_t v760 = ":";
                uint64_t v549 = qword_99A28;
                uint64_t v757 = qword_99A98;
                goto LABEL_1865;
              }

LABEL_1890:
              uint64_t v760 = ".";
            }

            else
            {
LABEL_1865:
              if (v549 != 0x2000000) {
                goto LABEL_1890;
              }
              uint64_t v760 = ".";
              if (v757 != 0x4000000) {
                goto LABEL_1891;
              }
              v761 = **(unsigned __int8 ***)(qword_99A30 + 40);
              v762 = "'=";
              do
              {
                do
                  int v763 = *v761++;
                while (v763 == 173 || v763 == 30);
                ++v762;
              }

              while (v762 != "");
              int v765 = **(unsigned __int8 ***)(qword_99A30 + 48);
              v766 = v765;
              int v767 = "'=";
              while (1)
              {
                do
                  int v768 = *v766++;
                while (v768 == 173 || v768 == 30);
                if (++v767 == "")
                {
                  uint64_t v760 = ":";
                  goto LABEL_1891;
                }
              }

              while (1)
              {
                int v770 = *v765;
                if (v770 != 173 && v770 != 30) {
                  break;
                }
                ++v765;
              }

              if (v770 == 58) {
                uint64_t v760 = ":";
              }
              else {
                uint64_t v760 = ".";
              }
            }

LABEL_1891:
            v772 = (char *)qword_99A20;
            unsigned __int8 v773 = *(_BYTE *)qword_99A20;
            while (2)
            {
              if (v773 == 30)
              {
                v36[319] = 0LL;
                uint64_t v774 = 30LL;
                goto LABEL_1924;
              }

              if (v773 == 39 && nLangIDGlb == 7)
              {
                uint64_t v774 = 39LL;
                goto LABEL_1924;
              }

              uint64_t v775 = pLangGlb;
              if (stru_B8.segname[(void)pLangGlb + 1] == v773)
              {
                int v776 = lFlags;
                if ((lFlags & 0x40000000) != 0) {
                  goto LABEL_1923;
                }
                int v777 = v772[1];
                if (nLangIDGlb == 12)
                {
                  if (!v772[1]
                    || !memchr("#123456789", v777, 0xBuLL)
                    || !*(v772 - 1)
                    || !memchr("#123456789", *(v772 - 1), 0xBuLL))
                  {
                    BOOL v778 = 0;
                    int v779 = nSubLangIDGlb;
                    if ((v776 & 0x40000000) != 0) {
                      goto LABEL_1931;
                    }
LABEL_1914:
                    if (v773 != 35)
                    {
                      int v36 = (void *)&unk_99000;
                      v522 = &unk_99000;
                      if (v773 != 58)
                      {
                        if (v773 == 124)
                        {
                          int v781 = v772[1];
                          if ((v781 - 49) <= 2
                            && (!v772[2] || !memchr("#123456789", v772[2], 0xBuLL)))
                          {
                            qword_99A20 = (uint64_t)(v772 + 1);
                            if (v781 == 51)
                            {
                              uint64_t v774 = 4294967219LL;
                            }

                            else if (v781 == 50)
                            {
                              uint64_t v774 = 4294967218LL;
                            }

                            else
                            {
                              uint64_t v774 = 4294967225LL;
                            }

LABEL_1924:
                            bwd_char(v774);
                            goto LABEL_1925;
                          }

LABEL_2007:
                          uint64_t v774 = 32LL;
                          goto LABEL_1924;
                        }

                        goto LABEL_2029;
                      }

                      goto LABEL_2037;
                    }

                    int v36 = (void *)&unk_99000;
                    v522 = &unk_99000;
                    if (v772[1] == 36 && v772[2] == 35)
                    {
                      if (v772[3] == 35)
                      {
                        bwd_char(4294967177LL);
                        uint64_t v795 = qword_99A20 + 3;
                      }

                      else
                      {
                        bwd_char(37LL);
                        uint64_t v795 = qword_99A20 + 2;
                      }

                      qword_99A20 = v795;
                      goto LABEL_1925;
                    }

LABEL_2016:
                    uint64_t v774 = 48LL;
                    goto LABEL_1924;
                  }

LABEL_1923:
                  uint64_t v774 = stru_B8.segname[(void)v775];
                  goto LABEL_1924;
                }

                if ((v777 - 107) >= 0xFFFFFFF6
                  && *(v772 - 1) - 107 >= 0xFFFFFFF6)
                {
                  goto LABEL_1923;
                }
              }

              BOOL v778 = nLangIDGlb == 9;
              int v779 = nSubLangIDGlb;
              if (nLangIDGlb == 9 && nSubLangIDGlb == 3)
              {
                if ((lFlags & 0x40000000) != 0)
                {
                  if (v773 == 33)
                  {
                    uint64_t v786 = 32LL;
                    goto LABEL_1989;
                  }

                  if (v773 == 124) {
                    goto LABEL_1955;
                  }
                }

                int v779 = 3;
                BOOL v778 = 1;
                goto LABEL_1931;
              }

              if (nLangIDGlb == 12 && (lFlags & 0x40000000) == 0) {
                goto LABEL_1914;
              }
LABEL_1931:
              if (v773)
              {
                BOOL v782 = (lFlags & 0x40000000) == 0;
                if ((v773 - 107) >= 0xF6u)
                {
                  if ((lFlags & 0x40000000) != 0)
                  {
                    int v36 = (void *)&unk_99000;
                    v522 = (void *)&unk_99000;
                  }

                  else
                  {
                    int v784 = *(v772 - 1);
                    int v36 = &unk_99000;
                    v522 = &unk_99000;
                    if (*(v772 - 1)
                      && *(unsigned __int8 *)(v34[320] - 1LL) != stru_B8.segname[(void)v775])
                    {
                      if (qword_999F8 >= 2) {
                        ++qword_999F8;
                      }
                      if (*(void *)(qword_99A30 + 24) == 64LL)
                      {
                        bwd_char(47LL);
                        v772 = (char *)qword_99A20;
                      }

                      else
                      {
                        char v802 = *v760;
                        uint64_t v803 = (unsigned __int8 *)(v760 + 1);
                        do
                        {
                          bwd_char(v802);
                          int v804 = *v803++;
                          char v802 = v804;
                        }

                        while (v804);
                      }
                    }
                  }

                  int v789 = *v772;
                  if (v789 == 106) {
                    uint64_t v790 = 48LL;
                  }
                  else {
                    uint64_t v790 = (char)(v789 - 48);
                  }
                  bwd_char(v790);
                  int v754 = 1;
                  goto LABEL_1925;
                }

                if ((lFlags & 0x40000000) == 0 && memchr(",;:/?+=(*)", v773, 0xBuLL))
                {
                  int v783 = *(v772 - 1);
                  if (*(v772 - 1))
                  {
                    int v36 = &unk_99000;
                    v522 = &unk_99000;
                    if ((v783 - 107) > 0xFFFFFFF5
                      || v783 == 30 && *(v772 - 2) - 107 >= 0xFFFFFFF6)
                    {
                      if (qword_999F8 >= 2) {
                        ++qword_999F8;
                      }
                      if (*(void *)(qword_99A30 + 24) == 64LL)
                      {
                        bwd_char(47LL);
                        v772 = (char *)qword_99A20;
                      }

                      else
                      {
                        char v798 = *v760;
                        v799 = (unsigned __int8 *)(v760 + 1);
                        do
                        {
                          bwd_char(v798);
                          int v800 = *v799++;
                          char v798 = v800;
                        }

                        while (v800);
                      }
                    }
                  }

                  else
                  {
                    int v36 = (void *)&unk_99000;
                    v522 = (void *)&unk_99000;
                  }

                  uint64_t v801 = 0LL;
                  while (*v772 != asc_25F4A[v801])
                  {
                    if (++v801 == 10) {
                      goto LABEL_1925;
                    }
                  }

                  if (v801)
                  {
                    uint64_t v774 = (char)(v801 + 48);
                    goto LABEL_1924;
                  }

                  goto LABEL_2016;
                }

                char v785 = !v842;
                if (v773 != 45) {
                  char v785 = 1;
                }
                if ((v785 & 1) == 0)
                {
LABEL_1955:
                  uint64_t v786 = 47LL;
                  goto LABEL_1989;
                }
              }

              else
              {
                BOOL v782 = (lFlags & 0x40000000) == 0;
              }

              if (v778)
              {
                if (v773 == 52)
                {
                  if (!v772[1])
                  {
                    int v36 = &unk_99000;
                    if (qword_999F8 >= 2) {
                      ++qword_999F8;
                    }
                    uint64_t v796 = 0LL;
                    char v797 = 116;
                    v522 = (void *)&unk_99000;
                    do
                    {
                      bwd_char(v797);
                      char v797 = aTh_3[++v796];
                    }

                    while (v796 != 2);
                    goto LABEL_1925;
                  }
                }

                else if (v773 == 124 && !v772[1])
                {
                  int v36 = &unk_99000;
                  if (qword_999F8 >= 2) {
                    ++qword_999F8;
                  }
                  uint64_t v787 = 0LL;
                  char v788 = 115;
                  v522 = (void *)&unk_99000;
                  do
                  {
                    bwd_char(v788);
                    char v788 = aSt_0[++v787];
                  }

                  while (v787 != 2);
                  goto LABEL_1925;
                }
              }

              if (bwd_fetch_char((char *)&v849, v772, 0, 0))
              {
                char v791 = v849;
                if (v849 == 149) {
                  char v791 = 46;
                }
                bwd_char(v791);
                v522 = &unk_99000;
                ++qword_99A20;
                int v36 = (void *)&unk_99000;
                goto LABEL_1925;
              }

              if (v773 && v778 && v779 != 2 && v782 && memchr("#0-1|4$k'\x7F", v773, 0xBuLL))
              {
                if (v773 > 0x30u)
                {
                  v522 = &unk_99000;
                  if (v773 <= 0x7Bu)
                  {
                    int v36 = (void *)&unk_99000;
                    if (v773 == 49)
                    {
                      uint64_t v774 = 42LL;
                      goto LABEL_1924;
                    }

                    if (v773 == 52) {
                      goto LABEL_2007;
                    }
                    goto LABEL_2029;
                  }

                  int v36 = (void *)&unk_99000;
                  if (v773 != 124)
                  {
                    if (v773 == 127)
                    {
                      int v807 = v772[1];
                      v806 = v772 + 1;
                      int v805 = v807;
                      if (v807 && memchr(",;:/?+=(*)", v805, 0xBuLL))
                      {
                        qword_99A20 = (uint64_t)v806;
                        else {
                          uint64_t v774 = (char)v805;
                        }
                        goto LABEL_1924;
                      }

LABEL_1925:
                      v772 = (char *)(v522[324] + 1LL);
                      v522[324] = v772;
                      unsigned __int8 v773 = *v772;
                      if (!*v772)
                      {
                        if (nLangIDGlb == 7)
                        {
                          BOOL v808 = *(void *)(qword_99A30 + 24) == 128LL && v754 == 0;
                          uint64_t v521 = off_91000;
                          if (v808) {
                            bwd_char(46LL);
                          }
                          int v35 = (void *)&unk_99000;
                          goto LABEL_2050;
                        }

                        int v35 = &unk_99000;
LABEL_2049:
                        uint64_t v521 = off_91000;
                        goto LABEL_2050;
                      }

                      continue;
                    }

                    goto LABEL_2029;
                  }
                }

                else
                {
                  v522 = &unk_99000;
                  if (v773 > 0x26u)
                  {
                    int v36 = (void *)&unk_99000;
                    if (v773 == 39)
                    {
                      uint64_t v774 = 44LL;
                      goto LABEL_1924;
                    }

                    if (v773 == 48)
                    {
                      uint64_t v774 = 43LL;
                      goto LABEL_1924;
                    }

                    goto LABEL_2029;
                  }

                  int v36 = (void *)&unk_99000;
                  if (v773 == 35) {
                    goto LABEL_2007;
                  }
                  if (v773 != 36)
                  {
LABEL_2029:
                    uint64_t v774 = (char)v773;
                    goto LABEL_1924;
                  }

                  int v794 = v772[1];
                  uint64_t v793 = (uint64_t)(v772 + 1);
                  int v792 = v794;
                  if (v794 != 124)
                  {
                    if (v792 == 107)
                    {
                      qword_99A20 = v793;
                      uint64_t v774 = 61LL;
                    }

                    else
                    {
                      uint64_t v774 = 46LL;
                    }

                    goto LABEL_1924;
                  }

                  qword_99A20 = v793;
                }

LABEL_2037:
                uint64_t v774 = 47LL;
                goto LABEL_1924;
              }

              break;
            }

            uint64_t v786 = (char)v773;
LABEL_1989:
            bwd_char(v786);
            int v36 = (void *)&unk_99000;
            v522 = (void *)&unk_99000;
            goto LABEL_1925;
          }

          int v560 = *v523;
          v522 = &unk_99000;
          if (in(*v523, 9))
          {
            if (v523[1] != 46)
            {
              if ((*(_BYTE *)(v520 + 34) & 0x10) == 0) {
                goto LABEL_1391;
              }
              LOBYTE(v560) = v560 & 0xDF;
            }
          }

          else
          {
LABEL_1391:
            BOOL v561 = (v560 - 91) >= 0xE6u || (v560 + 33) >= 0xE1u;
            char v562 = v560 | 0x20;
            if (!v561) {
              char v562 = v560;
            }
            if (v560) {
              LOBYTE(v560) = v562;
            }
            else {
              LOBYTE(v560) = 0;
            }
          }

          bwd_char((char)v560);
          v751 = (_BYTE *)(qword_99A20 + 1);
          qword_99A20 = (uint64_t)v751;
          LOBYTE(v752) = *v751;
          if (*v751)
          {
            uint64_t v753 = v35[326];
            do
            {
              if ((*(_BYTE *)(v753 + 33) & 4) != 0
                && ((v752 + 33) > 0xE0u || (v752 - 91) >= 0xE6u))
              {
                bwd_char((char)(v752 | 0x20));
                uint64_t v753 = v35[326];
                v751 = (_BYTE *)qword_99A20;
              }

              else
              {
                bwd_char((char)v752);
              }

              qword_99A20 = (uint64_t)(v751 + 1);
              int v752 = *++v751;
            }

            while (v752);
          }

LABEL_2050:
          if ((uint64_t)v36[319] >= 1)
          {
            v36[319] = 0LL;
            bwd_char(30LL);
          }

          uint64_t v809 = v35[326];
          qword_99A28 = *(void *)(v809 + 24);
          uint64_t v520 = *(void *)(v809 + 48);
          v35[326] = v520;
          if (v520) {
            continue;
          }
          break;
        }

        int v810 = &unk_99000;
        uint64_t v811 = qword_99A48;
        uint64_t v812 = v839;
        if (qword_99A48)
        {
          v813 = a4;
          do
          {
            v814 = (void *)v811;
            uint64_t v811 = *(void *)(v811 + 48);
            v810[329] = v811;
            free(v814);
            int v810 = (void *)&unk_99000;
          }

          while (v811);
          v35[326] = v814;
        }

        else
        {
          v813 = a4;
        }

LABEL_2059:
        free((void *)qword_99A88);
        qword_99A88 = 0LL;
        __int16 v815 = (_BYTE *)v34[320];
        *__int16 v815 = 0;
        if (v815 == (_BYTE *)qword_99A08) {
          return 111LL;
        }
        if (bMemoryOverflow) {
          return 8LL;
        }
        memmove(v33, __src, v815 - (_BYTE *)v33);
        if (v813)
        {
          v36[319] = 0LL;
          qword_99A40 = v812;
          qword_99A38 = v812;
          v34[320] = v33;
          uint64_t v816 = qword_99A08;
          if ((void *)qword_99A08 != v33)
          {
            int64_t v817 = 0LL;
            int v818 = 0LL;
            uint64_t v819 = (unsigned __int8 *)v33;
            while (1)
            {
              unsigned int v820 = *v819;
              uint64_t v821 = &unk_99000;
              if (*v819)
              {
                if (v820 == 31)
                {
                  *v819++ = 32;
                  ++v847;
LABEL_2071:
                  v34[320] = v819;
                  goto LABEL_2109;
                }

                if (v820 >= 0x21 && v820 != 160)
                {
                  ++v847;
                  ++v819;
                  goto LABEL_2071;
                }
              }

              v822 = (unsigned __int8 *)qword_99A38;
              unsigned int v823 = *(unsigned __int8 *)qword_99A38;
              if (!*(_BYTE *)qword_99A38) {
                break;
              }
              uint64_t v824 = 0LL;
              do
              {
                if (v823 < 0x21) {
                  break;
                }
                if (v823 == 160) {
                  break;
                }
                qword_99A38 = (uint64_t)&v822[++v824];
                unsigned int v823 = *(unsigned __int8 *)qword_99A38;
              }

              while (*(_BYTE *)qword_99A38);
              v822 += v824;
              uint64_t v825 = v824 - 1;
              if (!v824 || v824 >= v847) {
                goto LABEL_2081;
              }
              uint64_t v826 = v847 / (unint64_t)v824;
LABEL_2082:
              char v827 = &v818[v825];
              if (v817 >= v819 - (_BYTE *)v33)
              {
                int64_t v831 = v817;
              }

              else
              {
                uint64_t v828 = 0LL;
                char v829 = v818;
                do
                {
                  v813[v817 + v828++] = (_DWORD)v829;
                  if (v828 % v826) {
                    BOOL v830 = 0;
                  }
                  else {
                    BOOL v830 = (uint64_t)v829 < (uint64_t)v827;
                  }
                  if (v830) {
                    v36[319] = ++v829;
                  }
                  int64_t v831 = v817 + v828;
                }

                while (v817 + v828 < v819 - (_BYTE *)v33);
                uint64_t v821 = (void *)&unk_99000;
              }

              unsigned int v832 = *v819;
              if (!*v819)
              {
LABEL_2111:
                uint64_t result = 0LL;
                v813[v831] = (_DWORD)v827;
                return result;
              }

              v833 = v819 + 1;
              int v834 = v825 + (_DWORD)v818 + 1;
              int64_t v817 = v831;
              while (v832 < 0x21 || v832 == 160)
              {
                v813[v817] = v834;
                int64_t v831 = v817 + 1;
                v34[320] = v833;
                unsigned int v835 = *v833++;
                unsigned int v832 = v835;
                ++v834;
                ++v817;
                if (!v835)
                {
                  LODWORD(v827) = v834 - 1;
                  goto LABEL_2111;
                }
              }

              unsigned int v836 = *v822;
              if (*v822)
              {
                int v837 = v822 + 1;
                do
                {
                  if (v836 >= 0x21 && v836 != 160) {
                    break;
                  }
                  v821[327] = v837;
                  unsigned int v838 = *v837++;
                  unsigned int v836 = v838;
                }

                while (v838);
                v822 = v837 - 1;
              }

              uint64_t v847 = 0LL;
              uint64_t v819 = v833 - 1;
              int v818 = &v822[-v812];
              v36[319] = &v822[-v812];
LABEL_2109:
              uint64_t result = 0LL;
            }

            uint64_t v825 = -1LL;
LABEL_2081:
            uint64_t v826 = 1LL;
            goto LABEL_2082;
          }
        }

        return 0LL;
    }
  }

id sub_1B07C()
{
  if (qword_99BB8 != -1) {
    dispatch_once(&qword_99BB8, &stru_8CD48);
  }
  return (id)qword_99BB0;
}

void sub_1B82C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.accessibility", "BRLTranslation.RTFC");
  BOOL v2 = (void *)qword_99BB0;
  qword_99BB0 = (uint64_t)v1;
}

void sub_1B85C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
}

  ;
}

void sub_1B888( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

void sub_1B898( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void sub_1B8B8( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B91C( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B980( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1B9B0()
{
}

void sub_1BA10( uint64_t a1, os_log_s *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BA74()
{
}

void sub_1BAD4( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BB04()
{
}

id objc_msgSend_mergePreprocessorOutputLocationMap_outputToPreprocessedMap_outputLen_outputToTextMap_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergePreprocessorOutputLocationMap:outputToPreprocessedMap:outputLen:outputToTextMap:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}