uint64_t sub_1813AE200(uint64_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t result;
  sqlite3_int64 *v11;
  unsigned __int8 *v12;
  v4 = *((unsigned __int8 *)a1 + 9);
  if (*((_BYTE *)a1 + 9))
  {
    v5 = a1 + 8;
  }

  else if (*((_DWORD *)a1 + 9))
  {
    v5 = (uint64_t *)a1[6];
  }

  else
  {
    v5 = 0LL;
  }

  v6 = &a1[1 - v4];
  v9 = v6[11];
  v8 = v6 + 11;
  v7 = v9;
  if (v9)
  {
    result = 0LL;
LABEL_12:
    if (v5)
    {
    }

    return result;
  }

  if ((_DWORD)v4 == 1) {
    v11 = a1 + 9;
  }
  else {
    v11 = (sqlite3_int64 *)(a1[6] + 8);
  }
  result = sub_1813B05C0(*a1, *v11, 0LL, v8);
  v7 = *v8;
  if (!(_DWORD)result) {
    goto LABEL_12;
  }
  return result;
}

uint64_t sub_1813AE2FC(uint64_t a1, int a2, uint64_t *a3, uint64_t *a4)
{
  if (!*(_DWORD *)(a1 + 84))
  {
    v5 = a4;
    ++*(_DWORD *)(a1 + 64);
    memset(v78, 0, sizeof(v78));
    if (a2 < 2)
    {
LABEL_76:
      uint64_t v4 = 0LL;
      char v39 = 1;
      goto LABEL_77;
    }

    else {
      unint64_t v9 = (a2 - 4);
    }
    if (*(_BYTE *)(a1 + 38))
    {
      if ((int)v9 >= 1)
      {
        unint64_t v10 = 0LL;
        v11 = a3 + 4;
        v12 = (_DWORD *)((unint64_t)v78 | 0xC);
        while (1)
        {
          uint64_t v13 = *(v11 - 1);
          if (!v13) {
            break;
          }
          __int16 v14 = *(_WORD *)(v13 + 20);
          if ((v14 & 0x24) != 0)
          {
            double v15 = *(double *)v13;
            goto LABEL_15;
          }

          if ((v14 & 8) != 0)
          {
            double v19 = *(double *)v13;
            if (*(double *)v13 >= -9.22337204e18)
            {
              if (v19 <= 9.22337204e18) {
                *(void *)&double v15 = (uint64_t)v19;
              }
              else {
                LODWORD(v15) = -1;
              }
            }

            else
            {
              LODWORD(v15) = 0;
            }
          }

          else
          {
            if ((v14 & 0x12) == 0 || !*(void *)(v13 + 8)) {
              goto LABEL_14;
            }
            LODWORD(v15) = sub_181303DF0(v13);
          }

uint64_t sub_1813AEB8C(uint64_t a1)
{
  return 0LL;
}

uint64_t sub_1813AEBA0(uint64_t a1)
{
  *(_BYTE *)(a1 + 40) = 0;
  v1 = *(void **)(a1 + 112);
  if (v1 && !*(_DWORD *)(a1 + 80))
  {
    *(void *)(a1 + 112) = 0LL;
    v2 = (sqlite3_stmt *)v1[3];
    v3 = (void *)v1[4];
    uint64_t v4 = v3[3];
    if (v4) {
      xmmword_18C465400(v4);
    }
    sub_1812F20DC(v3, v1);
    uint64_t v5 = v3[3];
    if (v5) {
      xmmword_18C465410(v5);
    }
    sqlite3_finalize(v2);
  }

  return 0LL;
}

uint64_t sub_1813AEC1C(uint64_t a1, uint64_t a2)
{
  v3 = sqlite3_mprintf( "ALTER TABLE %Q.'%q_node'   RENAME TO %w_node;ALTER TABLE %Q.'%q_parent' RENAME TO %w_parent;ALTER TABLE"
         " %Q.'%q_rowid'  RENAME TO %w_rowid;",
         *(void *)(a1 + 48),
         *(void *)(a1 + 56),
         a2,
         *(void *)(a1 + 48),
         *(void *)(a1 + 56),
         a2,
         *(void *)(a1 + 48),
         *(void *)(a1 + 56),
         a2);
  if (!v3) {
    return 7LL;
  }
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(a1 + 112);
  if (v5 && !*(_BYTE *)(a1 + 40) && !*(_DWORD *)(a1 + 80))
  {
    *(void *)(a1 + 112) = 0LL;
    v6 = (sqlite3_stmt *)v5[3];
    v7 = (void *)v5[4];
    uint64_t v8 = v7[3];
    if (v8) {
      xmmword_18C465400(v8);
    }
    sub_1812F20DC(v7, v5);
    uint64_t v9 = v7[3];
    if (v9) {
      xmmword_18C465410(v9);
    }
    sqlite3_finalize(v6);
  }

  uint64_t v10 = sqlite3_exec(*(sqlite3 **)(a1 + 24), v4, 0LL, 0LL, 0LL);
  v11 = (void (**)(const char *))&off_18C4653A8;
  if (!dword_18C465380) {
    goto LABEL_15;
  }
  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v4);
  --qword_18C468B10;
  off_18C4653A8(v4);
  uint64_t v4 = (const char *)xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    v11 = (void (**)(const char *))&xmmword_18C465410;
LABEL_15:
    (*v11)(v4);
  }

  return v10;
}

uint64_t sub_1813AED80(uint64_t a1)
{
  char v2 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = 0;
  v3 = *(void **)(a1 + 112);
  if (v3 && !*(_DWORD *)(a1 + 80))
  {
    *(void *)(a1 + 112) = 0LL;
    uint64_t v4 = (sqlite3_stmt *)v3[3];
    uint64_t v5 = (void *)v3[4];
    uint64_t v6 = v5[3];
    if (v6) {
      xmmword_18C465400(v6);
    }
    sub_1812F20DC(v5, v3);
    uint64_t v7 = v5[3];
    if (v7) {
      xmmword_18C465410(v7);
    }
    sqlite3_finalize(v4);
  }

  *(_BYTE *)(a1 + 40) = v2;
  return 0LL;
}

uint64_t sub_1813AEE10(uint64_t result)
{
  if (result)
  {
    v1 = "node";
    for (i = (_BYTE *)result; ; ++i)
    {
      uint64_t v3 = *i;
      uint64_t v4 = *(unsigned __int8 *)v1;
      if ((_DWORD)v3 == (_DWORD)v4)
      {
        if (!*i) {
          return 1LL;
        }
      }

      else if (byte_1813C6343[v3] != byte_1813C6343[v4])
      {
        uint64_t v5 = "parent";
        for (j = (_BYTE *)result; ; ++j)
        {
          uint64_t v7 = *j;
          uint64_t v8 = *(unsigned __int8 *)v5;
          if ((_DWORD)v7 == (_DWORD)v8)
          {
            if (!*j) {
              return 1LL;
            }
          }

          else if (byte_1813C6343[v7] != byte_1813C6343[v8])
          {
            for (k = "rowid"; ; ++k)
            {
              uint64_t v10 = *(unsigned __int8 *)result;
              uint64_t v11 = *(unsigned __int8 *)k;
              if ((_DWORD)v10 == (_DWORD)v11)
              {
                if (!*(_BYTE *)result) {
                  return 1LL;
                }
              }

              else if (byte_1813C6343[v10] != byte_1813C6343[v11])
              {
                return 0LL;
              }

              ++result;
            }
          }

          ++v5;
        }
      }

      ++v1;
    }
  }

  return result;
}

uint64_t sub_1813AEEE8(sqlite3 *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, char **a6, int a7)
{
  uint64_t v7 = a6;
  pStmt[8] = *(sqlite3_stmt **)MEMORY[0x1895F89C0];
  if ((a3 - 104) <= 0xFFFFFF9D)
  {
    uint64_t v9 = 16LL;
    if (a3 > 5) {
      uint64_t v9 = 24LL;
    }
    *a6 = sqlite3_mprintf("%s", *(const char **)((char *)&unk_189B6F560 + v9));
    return 1LL;
  }

  sqlite3_vtab_config(a1, 1, 1LL);
  size_t v16 = strlen(*(const char **)(a4 + 8));
  int v17 = strlen(*(const char **)(a4 + 16));
  if (sqlite3_initialize()) {
    return 7LL;
  }
  int v88 = a7;
  v90 = a1;
  size_t v18 = v17;
  uint64_t v19 = (int)v16 + (uint64_t)v17 + 970;
  double v20 = (void *)sub_18126F0AC(v19);
  if (!v20) {
    return 7LL;
  }
  uint64_t v21 = (uint64_t)v20;
  v87 = a5;
  bzero(v20, v19);
  *(_DWORD *)(v21 + 64) = 1;
  *(void *)uint64_t v21 = &unk_18C550088;
  *(void *)(v21 + 48) = v21 + 968;
  *(void *)(v21 + 56) = v21 + 968 + ((uint64_t)((v16 << 32) + 0x100000000LL) >> 32);
  *(_BYTE *)(v21 + 38) = a2 != 0;
  memcpy((void *)(v21 + 968), *(const void **)(a4 + 8), (int)v16);
  memcpy((void *)(v21 + 968 + ((uint64_t)((v16 << 32) + 0x100000000LL) >> 32)), *(const void **)(a4 + 16), v18);
  v89 = v7;
  if (sqlite3_initialize() || (uint64_t v23 = sub_18126F0AC(32LL)) == 0)
  {
    v22 = (sqlite3_str *)&unk_18C54FA08;
  }

  else
  {
    v22 = (sqlite3_str *)v23;
    if (v90) {
      int v24 = *((_DWORD *)v90 + 34);
    }
    else {
      int v24 = 2147483645;
    }
    *(void *)uint64_t v23 = 0LL;
    *(void *)(v23 + 8) = 0LL;
    *(_DWORD *)(v23 + 16) = 0;
    *(_DWORD *)(v23 + 20) = v24;
    *(_DWORD *)(v23 + 24) = 0;
    *(_WORD *)(v23 + 28) = 0;
  }

  BOOL v25 = a2 != 0;
  double v26 = *(unsigned __int8 **)(a4 + 24);
  int v27 = sub_18126F280(v26, (int *)pStmt);
  sqlite3_str_appendf(v22, "CREATE TABLE x(%.*s INT", v27, (const char *)v26);
  BOOL v28 = 1;
  uint64_t v29 = 4LL;
  while (1)
  {
    float v30 = *(unsigned __int8 **)(a4 + 8 * v29);
    if (*v30 != 43) {
      break;
    }
    ++*(_BYTE *)(v21 + 41);
    sub_18126F280(v30 + 1, (int *)pStmt);
    sqlite3_str_appendf(v22, ",%.*s");
LABEL_17:
    BOOL v28 = ++v29 < (unint64_t)a3;
    if (a3 == v29) {
      goto LABEL_21;
    }
  }

  if (!*(_BYTE *)(v21 + 41))
  {
    ++*(_BYTE *)(v21 + 37);
    uint64_t v31 = off_189B6F588[v25];
    pAutoinc = (int *)sub_18126F280(v30, (int *)pStmt);
    sqlite3_str_appendf(v22, v31, pAutoinc, v30);
    goto LABEL_17;
  }

uint64_t sub_1813AFB8C(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 64) - 1;
  *(_DWORD *)(result + 64) = v1;
  if (v1) {
    return result;
  }
  uint64_t v2 = result;
  *(_BYTE *)(result + 40) = 0;
  uint64_t v3 = *(void **)(result + 112);
  if (v3 && !*(_DWORD *)(result + 80))
  {
    *(void *)(result + 112) = 0LL;
    uint64_t v4 = (sqlite3_stmt *)v3[3];
    uint64_t v5 = (void *)v3[4];
    uint64_t v6 = v5[3];
    if (v6) {
      xmmword_18C465400(v6);
    }
    sub_1812F20DC(v5, v3);
    uint64_t v7 = v5[3];
    if (v7) {
      xmmword_18C465410(v7);
    }
    sqlite3_finalize(v4);
  }

  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 120));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 128));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 136));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 144));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 152));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 160));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 168));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 176));
  sqlite3_finalize(*(sqlite3_stmt **)(v2 + 184));
  uint64_t v8 = *(void *)(v2 + 88);
  if (v8)
  {
    uint64_t v9 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_16:
      (*v9)(v8);
      goto LABEL_17;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v8);
    --qword_18C468B10;
    off_18C4653A8(v8);
    uint64_t v8 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v9 = &xmmword_18C465410;
      goto LABEL_16;
    }
  }

double sub_1813AFD68(uint64_t a1)
{
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = *(void *)(a1 + 24);
  if (!v3) {
    goto LABEL_22;
  }
  uint64_t v4 = 0LL;
  uint64_t v5 = 16LL;
  do
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 24) + v5);
    if (v6)
    {
      uint64_t v7 = *(void (**)(void))(v6 + 32);
      if (v7) {
        v7(*(void *)(v6 + 24));
      }
      uint64_t v8 = &off_18C4653A8;
      if (!dword_18C465380) {
        goto LABEL_4;
      }
      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8[0] -= (int)off_18C4653B8(v6);
      --qword_18C468B10;
      off_18C4653A8(v6);
      uint64_t v6 = xmmword_18C468B70;
      if ((void)xmmword_18C468B70)
      {
        uint64_t v8 = &xmmword_18C465410;
LABEL_4:
        (*v8)(v6);
      }
    }

    ++v4;
    v5 += 24LL;
  }

  while (v4 < *(int *)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
LABEL_15:
    uint64_t v9 = &off_18C4653A8;
    if (!dword_18C465380) {
      goto LABEL_20;
    }
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v3);
    --qword_18C468B10;
    off_18C4653A8(v3);
    uint64_t v3 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v9 = &xmmword_18C465410;
LABEL_20:
      (*v9)(v3);
    }
  }

  *(void *)(a1 + 24) = 0LL;
LABEL_22:
  sub_1813AFFD4(v2, *(void *)(a1 + 88));
  sub_1813AFFD4(v2, *(void *)(a1 + 96));
  sub_1813AFFD4(v2, *(void *)(a1 + 104));
  sub_1813AFFD4(v2, *(void *)(a1 + 112));
  sub_1813AFFD4(v2, *(void *)(a1 + 120));
  uint64_t v10 = *(void *)(a1 + 48);
  if (v10)
  {
    uint64_t v11 = &off_18C4653A8;
    if (!dword_18C465380) {
      goto LABEL_28;
    }
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v10);
    --qword_18C468B10;
    off_18C4653A8(v10);
    uint64_t v10 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v11 = &xmmword_18C465410;
LABEL_28:
      (*v11)(v10);
    }
  }

  uint64_t v12 = *(void *)(a1 + 56);
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(void *)(a1 + 288) = 0LL;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)a1 = v2;
  *(void *)(a1 + 56) = v12;
  return result;
}

uint64_t sub_1813AFFD4(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = a2;
  int v3 = *(_DWORD *)(a2 + 16) - 1;
  *(_DWORD *)(a2 + 16) = v3;
  if (v3) {
    return 0LL;
  }
  --*(_DWORD *)(a1 + 84);
  if (*(void *)(a2 + 8) == 1LL) {
    *(_DWORD *)(a1 + 44) = -1;
  }
  if (!*(void *)a2 || (uint64_t v4 = sub_1813AFFD4(a1), !(_DWORD)v4)) {
    uint64_t v4 = sub_1813B013C(a1, v2);
  }
  uint64_t v7 = *(void *)(v2 + 8);
  if (v7)
  {
    uint64_t v8 = (void *)(a1 + 8LL * (v7 % 0x61) + 192);
    do
    {
      uint64_t v9 = v8;
      uint64_t v10 = *v8;
      uint64_t v8 = (void *)(*v8 + 32LL);
    }

    while (v10 != v2);
    *uint64_t v9 = *(void *)(v2 + 32);
    *(void *)(v2 + 32) = 0LL;
  }

  uint64_t v11 = (void (**)(uint64_t))&off_18C4653A8;
  if (!dword_18C465380)
  {
LABEL_19:
    (*v11)(v2);
    return v4;
  }

  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v2);
  --qword_18C468B10;
  off_18C4653A8(v2);
  uint64_t v2 = xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    uint64_t v11 = (void (**)(uint64_t))&xmmword_18C465410;
    goto LABEL_19;
  }

  return v4;
}

uint64_t sub_1813B013C(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)(a2 + 20)) {
    return 0LL;
  }
  uint64_t v4 = *(uint64_t **)(a1 + 120);
  uint64_t v5 = *(void *)(a2 + 8);
  int v6 = sub_1812B2390((uint64_t)v4, 0);
  if (v5)
  {
    if (v6) {
      goto LABEL_12;
    }
    uint64_t v7 = v4[16];
    if ((*(_WORD *)(v7 + 20) & 0x9000) != 0)
    {
      sub_1813040AC(v7, v5);
    }

    else
    {
      *(void *)uint64_t v7 = v5;
      *(_WORD *)(v7 + 20) = 4;
    }
  }

  else if (v6)
  {
    goto LABEL_12;
  }

  uint64_t v9 = *(void *)(*v4 + 24);
  if (v9) {
    xmmword_18C465410(v9);
  }
LABEL_12:
  uint64_t v10 = *(unsigned int *)(a1 + 32);
  if ((v10 & 0x80000000) != 0)
  {
    sub_1812CF36C(98740);
  }

  else
  {
    uint64_t v11 = *(char **)(a2 + 24);
    if (!sub_1812B2390((uint64_t)v4, 1u))
    {
      if (v11)
      {
        unsigned int v12 = sub_181269368(v4[16] + 64, v11, v10, 0, 0LL);
        if (v12)
        {
          unsigned int v13 = v12;
          uint64_t v14 = *v4;
          *(_DWORD *)(v14 + 80) = v13;
          sub_1812FA264(v14, v13);
          sub_1813037C4(*v4, v13);
        }
      }

      uint64_t v15 = *(void *)(*v4 + 24);
      if (v15) {
        xmmword_18C465410(v15);
      }
    }
  }

  sqlite3_step((sqlite3_stmt *)v4);
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v8 = sqlite3_reset((sqlite3_stmt *)v4);
  if (!sub_1812B2390((uint64_t)v4, 1u))
  {
    uint64_t v16 = *(void *)(*v4 + 24);
    if (v16) {
      xmmword_18C465410(v16);
    }
  }

  if (!*(void *)(a2 + 8) && !(_DWORD)v8)
  {
    uint64_t v17 = *(void *)(a1 + 24);
    if (v17)
    {
      int v18 = *(unsigned __int8 *)(v17 + 113);
      switch(v18)
      {
        case 186:
          goto LABEL_29;
        case 118:
          uint64_t v20 = *(void *)(v17 + 56);
LABEL_34:
          uint64_t v8 = 0LL;
          *(void *)(a2 + 8) = v20;
          uint64_t v21 = a1 + 8LL * (v20 % 0x61);
          *(void *)(a2 + 32) = *(void *)(v21 + 192);
          *(void *)(v21 + 192) = a2;
          return v8;
        case 109:
LABEL_29:
          uint64_t v19 = "unopened";
          break;
        default:
          uint64_t v19 = "invalid";
          break;
      }
    }

    else
    {
      uint64_t v19 = "NULL";
    }

    sqlite3_log(21, "API call with %s database connection pointer", v19);
    sub_1812CF36C(186263);
    uint64_t v20 = 0LL;
    goto LABEL_34;
  }

  return v8;
}

uint64_t sub_1813B0374(uint64_t a1, uint64_t a2, uint64_t *a3, sqlite3_int64 *a4)
{
  *a3 = 0LL;
  uint64_t v8 = *(void **)(a1 + 136);
  if (!sub_1812B2390((uint64_t)v8, 0))
  {
    uint64_t v9 = v8[16];
    if ((*(_WORD *)(v9 + 20) & 0x9000) != 0)
    {
      sub_1813040AC(v9, a2);
    }

    else
    {
      *(void *)uint64_t v9 = a2;
      *(_WORD *)(v9 + 20) = 4;
    }

    uint64_t v10 = *(void *)(*v8 + 24LL);
    if (v10) {
      xmmword_18C465410(v10);
    }
  }

  int v11 = sqlite3_step(*(sqlite3_stmt **)(a1 + 136));
  unsigned int v12 = *(sqlite3_stmt **)(a1 + 136);
  if (v11 != 100) {
    return sqlite3_reset(v12);
  }
  sqlite3_int64 v13 = sqlite3_column_int64(v12, 0);
  if (a4) {
    *a4 = v13;
  }
  uint64_t v14 = sub_1813B05C0(a1, v13, 0LL, a3);
  sqlite3_reset(*(sqlite3_stmt **)(a1 + 136));
  return v14;
}

uint64_t sub_1813B0468(uint64_t a1, unsigned int a2, double a3)
{
  char v3 = a2;
  int v6 = *(unsigned __int8 *)(a1 + 9);
  if (!*(_BYTE *)(a1 + 9))
  {
    if (*(_DWORD *)(a1 + 36))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      ++*(_DWORD *)(a1 + 4LL * a2 + 128);
      if (v7) {
        goto LABEL_3;
      }
    }

    else
    {
      ++*(_DWORD *)(a1 + 4LL * a2 + 128);
    }

uint64_t sub_1813B05C0(uint64_t a1, sqlite3_int64 a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = *(void *)(a1 + 8LL * (a2 % 0x61) + 192);
  if (v8)
  {
    while (*(void *)(v8 + 8) != a2)
    {
      uint64_t v8 = *(void *)(v8 + 32);
      if (!v8) {
        goto LABEL_4;
      }
    }

    if (a3 && *(void *)v8 != a3) {
      return 267LL;
    }
    uint64_t v12 = 0LL;
    ++*(_DWORD *)(v8 + 16);
    goto LABEL_53;
  }

uint64_t sub_1813B0A38(uint64_t a1)
{
  uint64_t v64 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)a1;
  uint64_t v3 = a1 + 64;
  uint64_t v51 = (sqlite3_int64 *)(a1 + 72);
  uint64_t v52 = *(void *)a1;
  uint64_t v53 = *(unsigned int *)(a1 + 16);
  int v4 = *(unsigned __int8 *)(*(void *)a1 + 38LL);
  uint64_t v50 = a1 + 64;
  while (1)
  {
    uint64_t v5 = *(unsigned __int8 *)(a1 + 9);
    uint64_t v6 = v3;
    if (!*(_BYTE *)(a1 + 9) && (!*(_DWORD *)(a1 + 36) || (uint64_t v6 = *(void *)(a1 + 48)) == 0))
    {
      char v49 = 1;
      goto LABEL_98;
    }

    if (!*(_BYTE *)(v6 + 16))
    {
      char v49 = 0;
LABEL_98:
      uint64_t result = 0LL;
      *(_BYTE *)(a1 + 8) = v49;
      return result;
    }

    uint64_t v7 = a1 + 8 * (1 - v5);
    uint64_t v10 = *(void *)(v7 + 88);
    uint64_t v9 = (uint64_t *)(v7 + 88);
    uint64_t v8 = v10;
    if (!v10)
    {
      uint64_t v11 = v51;
      if ((_DWORD)v5 != 1) {
        uint64_t v11 = (sqlite3_int64 *)(*(void *)(a1 + 48) + 8LL);
      }
      uint64_t result = sub_1813B05C0(*(void *)a1, *v11, 0LL, v9);
      if ((_DWORD)result) {
        return result;
      }
      uint64_t v8 = *v9;
    }

    uint64_t v13 = *(void *)(v8 + 24);
    unsigned int v14 = __rev16(*(unsigned __int16 *)(v13 + 2));
    unsigned int v15 = *(unsigned __int8 *)(v6 + 18);
    if (v14 > v15) {
      break;
    }
LABEL_90:
    if (v14 <= v15) {
      sub_1813B12C4(a1);
    }
  }

  uint64_t v16 = (unsigned __int8 *)(v13 + *(unsigned __int8 *)(v6 + 18) * (unint64_t)*(unsigned __int8 *)(v2 + 39) + 4);
  uint64_t v17 = v16;
  while (2)
  {
    if ((int)v53 >= 1)
    {
      uint64_t v18 = 0LL;
      int v19 = 2;
      double v20 = -1.0;
      while (1)
      {
        uint64_t v21 = *(void *)(a1 + 24);
        int v22 = *(_DWORD *)(v21 + v18 + 4);
        if (v22 < 70)
        {
          int v25 = 4 * *(_DWORD *)(v21 + v18);
          if (*(_BYTE *)(v6 + 16) == 1)
          {
            float v26 = COERCE_FLOAT(bswap32(*(_DWORD *)&v17[v25 + 8]));
            double v27 = (double)SLODWORD(v26);
            if (v4 != 1) {
              double v27 = v26;
            }
            switch(v22)
            {
              case '?':
                goto LABEL_17;
              case '@':
                goto LABEL_73;
              case 'B':
                double v28 = *(double *)(v21 + v18 + 8);
                goto LABEL_64;
              case 'C':
                goto LABEL_17;
              case 'D':
                goto LABEL_17;
              case 'E':
                goto LABEL_17;
              default:
                goto LABEL_17;
            }
          }

          __int16 v32 = (unsigned int *)&v17[(v25 & 0x3F8) + 8];
          switch(v22)
          {
            case '?':
              goto LABEL_17;
            case '@':
              goto LABEL_73;
            case 'A':
              float v37 = COERCE_FLOAT(bswap32(*v32));
              double v38 = v37;
              if (v4 == 1) {
                double v38 = (double)SLODWORD(v37);
              }
              double v27 = *(double *)(v21 + v18 + 8);
              if (v27 < v38) {
                goto LABEL_73;
              }
              float v39 = COERCE_FLOAT(bswap32(v32[1]));
              double v28 = (double)SLODWORD(v39);
              if (v4 != 1) {
                double v28 = v39;
              }
LABEL_64:
              if (v27 > v28) {
                goto LABEL_73;
              }
              goto LABEL_17;
            case 'B':
            case 'C':
              float v33 = COERCE_FLOAT(bswap32(*v32));
              double v34 = (double)SLODWORD(v33);
              if (v4 != 1) {
                double v34 = v33;
              }
              goto LABEL_17;
            default:
              float v35 = COERCE_FLOAT(bswap32(v32[1]));
              double v36 = (double)SLODWORD(v35);
              if (v4 != 1) {
                double v36 = v35;
              }
              goto LABEL_17;
          }
        }

        uint64_t v23 = *(void *)(v21 + v18 + 16);
        if (v22 == 71 && *(_BYTE *)(v6 + 16) == 1) {
        if (v4 == 1)
        }
        {
          switch(*(_DWORD *)(v23 + 56))
          {
            case 4:
              goto LABEL_27;
            case 6:
              goto LABEL_26;
            case 8:
              goto LABEL_25;
            case 0xA:
              double v63 = (double)(int)bswap32(*((_DWORD *)v17 + 11));
              double v62 = (double)(int)bswap32(*((_DWORD *)v17 + 10));
LABEL_25:
              double v61 = (double)(int)bswap32(*((_DWORD *)v17 + 9));
              double v60 = (double)(int)bswap32(*((_DWORD *)v17 + 8));
LABEL_26:
              double v59 = (double)(int)bswap32(*((_DWORD *)v17 + 7));
              double v58 = (double)(int)bswap32(*((_DWORD *)v17 + 6));
LABEL_27:
              double v57 = (double)(int)bswap32(*((_DWORD *)v17 + 5));
              double v56 = (double)(int)bswap32(*((_DWORD *)v17 + 4));
              break;
            default:
              break;
          }

          double v55 = (double)(int)bswap32(*((_DWORD *)v17 + 3));
          double v24 = (double)(int)bswap32(*((_DWORD *)v17 + 2));
        }

        else
        {
          switch(*(_DWORD *)(v23 + 56))
          {
            case 4:
              goto LABEL_38;
            case 6:
              goto LABEL_37;
            case 8:
              goto LABEL_36;
            case 0xA:
              double v63 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 11)));
              double v62 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 10)));
LABEL_36:
              double v61 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 9)));
              double v60 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 8)));
LABEL_37:
              double v59 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 7)));
              double v58 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 6)));
LABEL_38:
              double v57 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 5)));
              double v56 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 4)));
              break;
            default:
              break;
          }

          double v55 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 3)));
          double v24 = COERCE_FLOAT(bswap32(*((_DWORD *)v17 + 2)));
        }

        double v54 = v24;
        if (v22 == 70)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t))(v21 + v18 + 8))(v23);
          int v19 = 0;
          double v20 = 0.0;
          if ((_DWORD)result) {
            return result;
          }
        }

        else
        {
          *(void *)(v23 + 40) = &v54;
          *(_DWORD *)(v23 + 60) = *(unsigned __int8 *)(v6 + 16) - 1;
          uint64_t v29 = *(void *)v6;
          *(void *)(v23 + 80) = *(void *)v6;
          *(void *)(v23 + 96) = v29;
          int v30 = *(unsigned __int8 *)(v6 + 17);
          *(_DWORD *)(v23 + 88) = v30;
          *(_DWORD *)(v23 + 92) = v30;
          uint64_t result = (*(uint64_t (**)(uint64_t))(v21 + v18 + 8))(v23);
          if (*(_DWORD *)(v23 + 92) < v19) {
            int v19 = *(_DWORD *)(v23 + 92);
          }
          if ((_DWORD)result) {
            return result;
          }
        }

        if (!v19) {
          break;
        }
LABEL_17:
        v18 += 24LL;
        if (24 * v53 == v18)
        {
          LOBYTE(v15) = *(_BYTE *)(v6 + 18);
          uint64_t v16 = v17;
          uint64_t v2 = v52;
          goto LABEL_77;
        }
      }

uint64_t sub_1813B1140(uint64_t a1, char a2, double a3)
{
  int v6 = *(_DWORD *)(a1 + 36);
  uint64_t v7 = *(int *)(a1 + 32);
  if (v6 >= (int)v7)
  {
    uint64_t v23 = *(void *)(a1 + 48);
    if (sqlite3_initialize()) {
      return 0LL;
    }
    uint64_t v25 = 2 * v7 + 8;
    uint64_t v8 = sub_18127D33C(v23, 24 * v25);
    if (!v8) {
      return 0LL;
    }
    *(void *)(a1 + 48) = v8;
    *(_DWORD *)(a1 + 32) = v25;
    int v6 = *(_DWORD *)(a1 + 36);
  }

  else
  {
    uint64_t v8 = *(void *)(a1 + 48);
  }

  *(_DWORD *)(a1 + 36) = v6 + 1;
  uint64_t v9 = v8 + 24LL * v6;
  *(double *)uint64_t v9 = a3;
  *(_BYTE *)(v9 + 16) = a2;
  if (v6 >= 1)
  {
    do
    {
      unsigned int v14 = v6 - 1;
      unsigned int v15 = (v6 - 1) >> 1;
      uint64_t v16 = *(void *)(a1 + 48);
      uint64_t v17 = (__int128 *)(v16 + 24LL * v15);
      if (*(double *)v9 >= *(double *)v17
        && (*(double *)v9 > *(double *)v17
         || *(unsigned __int8 *)(v9 + 16) >= *(unsigned __int8 *)(v16 + 24LL * v15 + 16)))
      {
        break;
      }

      uint64_t v9 = v16 + 24LL * v15;
      __int128 v18 = *v17;
      uint64_t v26 = *((void *)v17 + 2);
      uint64_t v19 = v16 + 24LL * v6;
      uint64_t v20 = *(void *)(v19 + 16);
      *(_OWORD *)uint64_t v9 = *(_OWORD *)v19;
      *(void *)(v9 + 16) = v20;
      uint64_t v21 = *(void *)(a1 + 48) + 24LL * v6;
      *(_OWORD *)uint64_t v21 = v18;
      *(void *)(v21 + 16) = v26;
      if (v6 <= 8)
      {
        if (v6 < 4)
        {
          uint64_t v10 = 8LL * (v15 + 1);
          uint64_t v11 = a1 + 88;
          uint64_t v12 = *(void *)(a1 + 88 + v10);
          uint64_t v13 = 8LL * (v6 + 1);
          *(void *)(v11 + v10) = *(void *)(a1 + 88 + v13);
          *(void *)(v11 + v13) = v12;
        }

        else
        {
          uint64_t v22 = a1 + 8LL * (v15 + 1);
          sub_1813AFFD4(*(void *)a1, *(void *)(v22 + 88));
          *(void *)(v22 + 88) = 0LL;
        }
      }

      int v6 = v14 >> 1;
    }

    while (v14 > 1);
  }

  return v9;
}

uint64_t sub_1813B12C4(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(unsigned __int8 *)(result + 9);
  uint64_t v3 = result + 8 * (1 - v2);
  uint64_t v6 = *(void *)(v3 + 88);
  uint64_t v5 = (void *)(v3 + 88);
  uint64_t v4 = v6;
  if (v6)
  {
    uint64_t result = sub_1813AFFD4(*(void *)result, v4);
    void *v5 = 0LL;
    LODWORD(v2) = *(unsigned __int8 *)(v1 + 9);
  }

  if ((_DWORD)v2)
  {
    uint64_t v7 = v1 + 4LL * *(unsigned __int8 *)(v1 + 80);
    --*(_DWORD *)(v7 + 128);
    *(_BYTE *)(v1 + 9) = 0;
    return result;
  }

  uint64_t v8 = *(int *)(v1 + 36);
  if ((_DWORD)v8)
  {
    uint64_t v9 = *(void *)(v1 + 48);
    uint64_t v10 = v1 + 4LL * *(unsigned __int8 *)(v9 + 16);
    --*(_DWORD *)(v10 + 128);
    int v11 = v8 - 1;
    *(_DWORD *)(v1 + 36) = v8 - 1;
    uint64_t v12 = v9 + 24LL * ((int)v8 - 1);
    uint64_t v13 = *(void *)(v12 + 16);
    *(_OWORD *)uint64_t v9 = *(_OWORD *)v12;
    *(void *)(v9 + 16) = v13;
    if ((int)v8 > 4
      || (uint64_t v14 = v1 + 8 * v8, *(void *)(v1 + 96) = *(void *)(v14 + 88), *(void *)(v14 + 88) = 0LL, (int)v8 >= 3))
    {
      int v15 = 0;
      int v16 = 0;
      int v17 = 1;
      do
      {
        int v23 = v15 + 2;
        uint64_t v24 = *(void *)(v1 + 48);
        uint64_t v25 = (__int128 *)(v24 + 24LL * v16);
        if (v15 + 2 >= v11)
        {
          int v29 = v17;
          double v28 = *(double *)(v24 + 24LL * v17);
        }

        else
        {
          uint64_t v26 = (__int128 *)(v24 + 24LL * v23);
          double v27 = *(double *)v26;
          double v28 = *(double *)(v24 + 24LL * v17);
          if (*(double *)v26 < v28
            || (int v29 = v17, *(double *)v26 <= v28)
            && *(unsigned __int8 *)(v24 + 24LL * v23 + 16) < *(unsigned __int8 *)(v24 + 24LL * v17 + 16))
          {
            if (v27 >= *(double *)v25
              && (v27 > *(double *)v25
               || *(unsigned __int8 *)(v24 + 24LL * v23 + 16) >= *(unsigned __int8 *)(v24 + 24LL * v16 + 16)))
            {
              return result;
            }

            __int128 v30 = *v25;
            uint64_t v31 = *((void *)v25 + 2);
            uint64_t v32 = *((void *)v26 + 2);
            *uint64_t v25 = *v26;
            *((void *)v25 + 2) = v32;
            uint64_t v33 = *(void *)(v1 + 48) + 24LL * v23;
            *(_OWORD *)uint64_t v33 = v30;
            *(void *)(v33 + 16) = v31;
            if (v16 <= 3)
            {
              uint64_t v34 = v16 + 1LL;
              if (v23 < 4)
              {
                int v18 = v15 + 3;
                uint64_t v19 = 8LL * (int)v34;
                uint64_t v20 = v1 + 88;
                uint64_t v21 = *(void *)(v1 + 88 + v19);
                uint64_t v22 = 8LL * v18;
                *(void *)(v20 + v19) = *(void *)(v1 + 88 + v22);
                *(void *)(v20 + v22) = v21;
              }

              else
              {
                uint64_t v35 = v1 + 8 * v34;
                uint64_t result = sub_1813AFFD4(*(void *)v1, *(void *)(v35 + 88));
                *(void *)(v35 + 88) = 0LL;
              }
            }

            int v17 = v23;
            goto LABEL_12;
          }
        }

        if (v28 >= *(double *)v25
          && (v28 > *(double *)v25
           || *(unsigned __int8 *)(v24 + 24LL * v29 + 16) >= *(unsigned __int8 *)(v24 + 24LL * v16 + 16)))
        {
          return result;
        }

        double v36 = (__int128 *)(v24 + 24LL * v29);
        __int128 v37 = *v25;
        uint64_t v38 = *((void *)v25 + 2);
        uint64_t v39 = *((void *)v36 + 2);
        *uint64_t v25 = *v36;
        *((void *)v25 + 2) = v39;
        uint64_t v40 = *(void *)(v1 + 48) + 24LL * v29;
        *(_OWORD *)uint64_t v40 = v37;
        *(void *)(v40 + 16) = v38;
        if (v16 <= 3)
        {
          uint64_t v41 = v16 + 1LL;
          if (v17 < 4)
          {
            uint64_t v43 = 8LL * (int)v41;
            uint64_t v44 = v1 + 88;
            uint64_t v45 = *(void *)(v1 + 88 + v43);
            uint64_t v46 = 8LL * v23;
            *(void *)(v44 + v43) = *(void *)(v1 + 88 + v46);
            *(void *)(v44 + v46) = v45;
          }

          else
          {
            uint64_t v42 = v1 + 8 * v41;
            uint64_t result = sub_1813AFFD4(*(void *)v1, *(void *)(v42 + 88));
            *(void *)(v42 + 88) = 0LL;
          }
        }

uint64_t sub_1813B1580(void *a1, unsigned int a2)
{
  pStmt = 0LL;
  uint64_t v4 = (unsigned __int8 *)sqlite3_mprintf("SELECT * FROM %Q.%Q", a1[6], a1[7]);
  if (!v4)
  {
    uint64_t v7 = 7LL;
    goto LABEL_14;
  }

  uint64_t v6 = v4;
  uint64_t v7 = sub_18126DFE0(a1[3], v4, 0xFFFFFFFFLL, 128LL, 0LL, &pStmt, 0LL, v5);
  uint64_t v8 = (uint64_t (**)(unsigned __int8 *))&off_18C4653A8;
  if (dword_18C465380)
  {
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v6);
    --qword_18C468B10;
    off_18C4653A8(v6);
    uint64_t v6 = (unsigned __int8 *)xmmword_18C468B70;
    if (!(void)xmmword_18C468B70) {
      goto LABEL_8;
    }
    uint64_t v8 = (uint64_t (**)(unsigned __int8 *))&xmmword_18C465410;
  }

  (*v8)(v6);
LABEL_8:
  if (!(_DWORD)v7)
  {
    if (a2)
    {
      sub_1812D8E78((uint64_t *)pStmt, a2, 0, 0);
      sub_1812D8E78((uint64_t *)pStmt, a2 + 1, 0, 0);
      uint64_t v9 = sqlite3_mprintf("rtree constraint failed: %s.(%s<=%s)");
    }

    else
    {
      sub_1812D8E78((uint64_t *)pStmt, 0, 0, 0);
      uint64_t v9 = sqlite3_mprintf("UNIQUE constraint failed: %s.%s");
    }

    a1[2] = v9;
    uint64_t v7 = 19LL;
  }

uint64_t sub_1813B1708(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  unsigned int v4 = sub_1813B05C0(a1, 1LL, 0LL, &v30);
  if (!v4)
  {
    unsigned int v4 = sub_1813B0374(a1, a2, &v31, 0LL);
    if (!v4)
    {
      uint64_t v15 = v31;
      if (v31)
      {
        uint64_t v16 = *(void *)(v31 + 24);
        uint64_t v17 = __rev16(*(unsigned __int16 *)(v16 + 2));
        if (!(_DWORD)v17)
        {
LABEL_36:
          sub_1813AFFD4(a1, v31);
          unsigned int v4 = 267;
          goto LABEL_2;
        }

        uint64_t v18 = 0LL;
        uint64_t v19 = (unsigned __int8 *)(v16 + 5);
        while ((((unint64_t)*(v19 - 1) << 56) | ((unint64_t)*v19 << 48) | ((unint64_t)v19[1] << 40) | ((unint64_t)v19[2] << 32) | ((unint64_t)v19[3] << 24) | ((unint64_t)v19[4] << 16) | ((unint64_t)v19[5] << 8))
              + v19[6] != a2)
        {
          v19 += *(unsigned __int8 *)(a1 + 39);
          if (v17 == ++v18) {
            goto LABEL_36;
          }
        }

        unsigned int v4 = sub_1813B3964(a1, v31, v18, 0);
        unsigned int v20 = sub_1813AFFD4(a1, v15);
        if (!v4) {
          unsigned int v4 = v20;
        }
      }
    }

    if (!v4)
    {
      uint64_t v21 = *(void **)(a1 + 152);
      if (!sub_1812B2390((uint64_t)v21, 0))
      {
        uint64_t v22 = v21[16];
        if ((*(_WORD *)(v22 + 20) & 0x9000) != 0)
        {
          sub_1813040AC(v22, a2);
        }

        else
        {
          *(void *)uint64_t v22 = a2;
          *(_WORD *)(v22 + 20) = 4;
        }

        uint64_t v23 = *(void *)(*v21 + 24LL);
        if (v23) {
          xmmword_18C465410(v23);
        }
      }

      sqlite3_step(*(sqlite3_stmt **)(a1 + 152));
      unsigned int v4 = sqlite3_reset(*(sqlite3_stmt **)(a1 + 152));
      if (!v4)
      {
        if (*(int *)(a1 + 44) >= 1
          && (uint64_t v24 = v30, v25 = *(void *)(v30 + 24), __rev16(*(unsigned __int16 *)(v25 + 2)) == 1))
        {
          v32[0] = 0LL;
          unsigned int v26 = sub_1813B05C0( a1,  (((unint64_t)*(unsigned __int8 *)(v25 + 4) << 56) | ((unint64_t)*(unsigned __int8 *)(v25 + 5) << 48) | ((unint64_t)*(unsigned __int8 *)(v25 + 6) << 40) | ((unint64_t)*(unsigned __int8 *)(v25 + 7) << 32) | ((unint64_t)*(unsigned __int8 *)(v25 + 8) << 24) | ((unint64_t)*(unsigned __int8 *)(v25 + 9) << 16) | ((unint64_t)*(unsigned __int8 *)(v25 + 10) << 8))
                + *(unsigned __int8 *)(v25 + 11),
                  v30,
                  v32);
          uint64_t v27 = v32[0];
          if (!v26) {
            unsigned int v26 = sub_1813B3B78(a1, v32[0], *(_DWORD *)(a1 + 44) - 1);
          }
          unsigned int v28 = sub_1813AFFD4(a1, v27);
          if (v26) {
            unsigned int v4 = v26;
          }
          else {
            unsigned int v4 = v28;
          }
          if (!v4)
          {
            unsigned int v29 = *(_DWORD *)(a1 + 44) - 1;
            *(_DWORD *)(a1 + 44) = v29;
            **(_WORD **)(v24 + 24) = bswap32(v29) >> 16;
            *(_DWORD *)(v24 + 20) = 1;
          }
        }

        else
        {
          unsigned int v4 = 0;
        }
      }
    }
  }

uint64_t sub_1813B1AF4(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v75 = 0LL;
  uint64_t v8 = sub_1813B05C0(a1, 1LL, 0LL, &v75);
  uint64_t v9 = v75;
  if (!(_DWORD)v8)
  {
    int v11 = 0;
    unsigned int v12 = (const float *)(a2 + 8);
    uint64_t v13 = a2 + 12;
    int v69 = a3;
    while (1)
    {
      if (v11 >= *(_DWORD *)(a1 + 44) - a3)
      {
        uint64_t v10 = 0LL;
        goto LABEL_85;
      }

      unsigned int v15 = __rev16(*(unsigned __int16 *)(*(void *)(v9 + 24) + 2LL));
      uint64_t v71 = 0LL;
      int v70 = v11;
      if (v15) {
        break;
      }
      sqlite3_int64 v14 = 0LL;
LABEL_5:
      uint64_t v10 = sub_1813B05C0(a1, v14, v9, &v71);
      sub_1813AFFD4(a1, v9);
      uint64_t v9 = v71;
      a3 = v69;
      int v11 = v70 + 1;
      if ((_DWORD)v10) {
        goto LABEL_85;
      }
    }

    int v16 = 0;
    sqlite3_int64 v14 = 0LL;
    double v17 = 0.0;
    double v18 = 0.0;
    while (1)
    {
      sub_1813AC7C8(a1, v9, v16, &v72);
      __int128 v76 = v72;
      __int128 v77 = v73;
      __int128 v78 = v74;
      int v19 = *(unsigned __int8 *)(a1 + 38);
      int v20 = *(unsigned __int8 *)(a1 + 36);
      double v21 = 1.0;
      if (!*(_BYTE *)(a1 + 38))
      {
        switch(*(_BYTE *)(a1 + 36))
        {
          case 2:
            goto LABEL_26;
          case 3:
            goto LABEL_25;
          case 4:
            goto LABEL_24;
          case 5:
            double v21 = (float)(*((float *)&v78 + 3) - *((float *)&v78 + 2));
LABEL_24:
            double v21 = v21 * (float)(*((float *)&v78 + 1) - *(float *)&v78);
LABEL_25:
            double v21 = v21 * (float)(*((float *)&v77 + 3) - *((float *)&v77 + 2));
LABEL_26:
            double v21 = v21 * (float)(*((float *)&v77 + 1) - *(float *)&v77);
            break;
          default:
            break;
        }

        uint64_t v27 = *((void *)&v76 + 1);
        unint64_t v28 = *(unsigned __int8 *)(a1 + 37);
        if (v28 <= 2) {
          unint64_t v29 = 2LL;
        }
        else {
          unint64_t v29 = *(unsigned __int8 *)(a1 + 37);
        }
        if (v29 >= 7)
        {
          unint64_t v45 = ((v29 - 1) >> 1) + 1;
          unint64_t v30 = 2 * (v45 & 0x7FFFFFFFFFFFFFFCLL);
          uint64_t v46 = v45 & 0x7FFFFFFFFFFFFFFCLL;
          double v47 = v12;
          uint64_t v48 = (float *)&v76 + 2;
          do
          {
            float32x4x2_t v79 = vld2q_f32(v48);
            float32x4x2_t v81 = vld2q_f32(v47);
            v47 += 8;
            v82.val[0] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v81.val[0], v79.val[0]),  (int8x16_t)v79.val[0],  (int8x16_t)v81.val[0]);
            v82.val[1] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v79.val[1], v81.val[1]),  (int8x16_t)v79.val[1],  (int8x16_t)v81.val[1]);
            vst2q_f32(v48, v82);
            v48 += 8;
            v46 -= 4LL;
          }

          while (v46);
          if (v45 != (v45 & 0x7FFFFFFFFFFFFFFCLL)) {
            goto LABEL_46;
          }
        }

        else
        {
          unint64_t v30 = 0LL;
LABEL_46:
          char v49 = (float *)(v13 + 4 * v30);
          uint64_t v50 = (float *)&v76 + v30 + 3;
          do
          {
            if (*(v50 - 1) >= *(v49 - 1)) {
              int v51 = *((_DWORD *)v49 - 1);
            }
            else {
              int v51 = *((_DWORD *)v50 - 1);
            }
            float v52 = *v50;
            float v53 = *v49;
            v49 += 2;
            float v54 = v53;
            if (*v50 <= v53) {
              float v52 = v54;
            }
            *((_DWORD *)v50 - 1) = v51;
            *uint64_t v50 = v52;
            v30 += 2LL;
            v50 += 2;
          }

          while (v30 < v28);
        }

        double v44 = (float)(*((float *)&v27 + 1) - *(float *)&v27);
        goto LABEL_54;
      }

      switch(*(_BYTE *)(a1 + 36))
      {
        case 2:
          goto LABEL_16;
        case 3:
          goto LABEL_15;
        case 4:
          goto LABEL_14;
        case 5:
          double v21 = (double)(SHIDWORD(v78) - (uint64_t)SDWORD2(v78));
LABEL_14:
          double v21 = v21 * (double)(SDWORD1(v78) - (uint64_t)(int)v78);
LABEL_15:
          double v21 = v21 * (double)(SHIDWORD(v77) - (uint64_t)SDWORD2(v77));
LABEL_16:
          double v21 = v21 * (double)(SDWORD1(v77) - (uint64_t)(int)v77);
          break;
        default:
          break;
      }

      uint64_t v23 = SDWORD2(v76);
      uint64_t v22 = SHIDWORD(v76);
      unint64_t v24 = *(unsigned __int8 *)(a1 + 37);
      unint64_t v25 = v24 <= 2 ? 2LL : *(unsigned __int8 *)(a1 + 37);
      if (v25 < 7) {
        break;
      }
      unint64_t v31 = ((v25 - 1) >> 1) + 1;
      unint64_t v26 = 2 * (v31 & 0x7FFFFFFFFFFFFFFCLL);
      uint64_t v32 = v31 & 0x7FFFFFFFFFFFFFFCLL;
      uint64_t v33 = (int32x4_t *)v12;
      uint64_t v34 = (int32x4_t *)((char *)&v76 + 8);
      do
      {
        int32x4_t v35 = v34[1];
        int32x4_t v36 = *v33;
        int32x4_t v37 = v33[1];
        v33 += 2;
        v80.val[0] = (float32x4_t)vuzp1q_s32(vminq_s32(*v34, v36), vminq_s32(v35, v37));
        v80.val[1] = (float32x4_t)vuzp2q_s32(vmaxq_s32(*v34, v36), vmaxq_s32(v35, v37));
        vst2q_f32((float *)v34->i32, v80);
        v34 += 2;
        v32 -= 4LL;
      }

      while (v32);
      if (v31 != (v31 & 0x7FFFFFFFFFFFFFFCLL)) {
        goto LABEL_35;
      }
LABEL_42:
      double v44 = (double)(v22 - v23);
LABEL_54:
      double v55 = v21 * v44;
      double v56 = 1.0;
      int v57 = v20 - 2;
      double v58 = 1.0;
      if (v19)
      {
        double v59 = 1.0;
        double v60 = 1.0;
        switch(v57)
        {
          case 0:
            goto LABEL_59;
          case 1:
            goto LABEL_58;
          case 2:
            goto LABEL_57;
          case 3:
            double v58 = (double)(SHIDWORD(v78) - (uint64_t)SDWORD2(v78));
LABEL_57:
            double v59 = v58 * (double)(SDWORD1(v78) - (uint64_t)(int)v78);
LABEL_58:
            double v60 = v59 * (double)(SHIDWORD(v77) - (uint64_t)SDWORD2(v77));
LABEL_59:
            double v58 = v60 * (double)(SDWORD1(v77) - (uint64_t)(int)v77);
            break;
          default:
            break;
        }

        switch(v57)
        {
          case 0:
            goto LABEL_64;
          case 1:
            goto LABEL_63;
          case 2:
            goto LABEL_62;
          case 3:
            double v56 = (double)(SHIDWORD(v74) - (uint64_t)SDWORD2(v74));
LABEL_62:
            double v56 = v56 * (double)(SDWORD1(v74) - (uint64_t)(int)v74);
LABEL_63:
            double v56 = v56 * (double)(SHIDWORD(v73) - (uint64_t)SDWORD2(v73));
LABEL_64:
            double v56 = v56 * (double)(SDWORD1(v73) - (uint64_t)(int)v73);
            break;
          default:
            break;
        }

        double v61 = v58 * (double)(SHIDWORD(v76) - (uint64_t)SDWORD2(v76));
        double v62 = (double)(SHIDWORD(v72) - (uint64_t)SDWORD2(v72));
      }

      else
      {
        double v63 = 1.0;
        double v64 = 1.0;
        switch(v57)
        {
          case 0:
            goto LABEL_70;
          case 1:
            goto LABEL_69;
          case 2:
            goto LABEL_68;
          case 3:
            double v58 = (float)(*((float *)&v78 + 3) - *((float *)&v78 + 2));
LABEL_68:
            double v63 = v58 * (float)(*((float *)&v78 + 1) - *(float *)&v78);
LABEL_69:
            double v64 = v63 * (float)(*((float *)&v77 + 3) - *((float *)&v77 + 2));
LABEL_70:
            double v58 = v64 * (float)(*((float *)&v77 + 1) - *(float *)&v77);
            break;
          default:
            break;
        }

        switch(v57)
        {
          case 0:
            goto LABEL_75;
          case 1:
            goto LABEL_74;
          case 2:
            goto LABEL_73;
          case 3:
            double v56 = (float)(*((float *)&v74 + 3) - *((float *)&v74 + 2));
LABEL_73:
            double v56 = v56 * (float)(*((float *)&v74 + 1) - *(float *)&v74);
LABEL_74:
            double v56 = v56 * (float)(*((float *)&v73 + 3) - *((float *)&v73 + 2));
LABEL_75:
            double v56 = v56 * (float)(*((float *)&v73 + 1) - *(float *)&v73);
            break;
          default:
            break;
        }

        double v61 = v58 * (float)(*((float *)&v76 + 3) - *((float *)&v76 + 2));
        double v62 = (float)(*((float *)&v72 + 3) - *((float *)&v72 + 2));
      }

      double v65 = v56 * v62;
      double v66 = v61 - v55;
      if (!v16 || v66 < v18 || (v66 == v18 ? (BOOL v67 = v65 < v17) : (BOOL v67 = 0), v67))
      {
        sqlite3_int64 v14 = v72;
        double v18 = v66;
        double v17 = v65;
      }

      if (++v16 == v15) {
        goto LABEL_5;
      }
    }

    unint64_t v26 = 0LL;
LABEL_35:
    uint64_t v38 = (int *)(v13 + 4 * v26);
    uint64_t v39 = (int *)&v76 + v26 + 3;
    do
    {
      if (*(v39 - 1) >= *(v38 - 1)) {
        int v40 = *(v38 - 1);
      }
      else {
        int v40 = *(v39 - 1);
      }
      int v41 = *v39;
      int v43 = *v38;
      v38 += 2;
      int v42 = v43;
      if (*v39 <= v43) {
        int v41 = v42;
      }
      *(v39 - 1) = v40;
      *uint64_t v39 = v41;
      v26 += 2LL;
      v39 += 2;
    }

    while (v26 < v24);
    goto LABEL_42;
  }

  uint64_t v10 = v8;
LABEL_85:
  *a4 = v9;
  return v10;
}

uint64_t sub_1813B208C(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v5 = (uint64_t)a3;
  uint64_t v324 = *MEMORY[0x1895F89C0];
  if (a4 >= 1)
  {
    unint64_t v8 = (1372618415 * (unint64_t)*a3) >> 32;
    uint64_t v9 = *(uint64_t **)(a1
                     + 8LL
                     * (*a3
    if (v9)
    {
      while (v9[1] != *a3)
      {
        uint64_t v9 = (uint64_t *)v9[4];
        if (!v9) {
          goto LABEL_9;
        }
      }

      sub_1813AFFD4(a1, *v9);
      if (a2) {
        ++*(_DWORD *)(a2 + 16);
      }
      *uint64_t v9 = a2;
    }
  }

uint64_t sub_1813B3964(uint64_t a1, uint64_t a2, int a3, int a4)
{
  unint64_t v8 = (uint64_t *)a2;
  while (1)
  {
    uint64_t v9 = v8[1];
    if (v9 == 1 || *v8) {
      break;
    }
    int v10 = *(void **)(a1 + 160);
    if (!sub_1812B2390((uint64_t)v10, 0))
    {
      uint64_t v11 = v10[16];
      if ((*(_WORD *)(v11 + 20) & 0x9000) != 0)
      {
        sub_1813040AC(v11, v9);
      }

      else
      {
        *(void *)uint64_t v11 = v9;
        *(_WORD *)(v11 + 20) = 4;
      }

      uint64_t v12 = *(void *)(*v10 + 24LL);
      if (v12) {
        xmmword_18C465410(v12);
      }
    }

    if (sqlite3_step(*(sqlite3_stmt **)(a1 + 160)) != 100) {
      goto LABEL_16;
    }
    sqlite3_int64 v13 = sqlite3_column_int64(*(sqlite3_stmt **)(a1 + 160), 0);
    if (a2)
    {
      uint64_t v14 = (void *)a2;
      while (v14[1] != v13)
      {
        uint64_t v14 = (void *)*v14;
        if (!v14) {
          goto LABEL_15;
        }
      }

uint64_t sub_1813B3B78(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = *(void *)a2;
  if (*(void *)a2)
  {
    uint64_t v7 = *(void *)(v6 + 24);
    uint64_t v8 = __rev16(*(unsigned __int16 *)(v7 + 2));
    if (!(_DWORD)v8)
    {
LABEL_6:
      sub_1813AFFD4(a1, 0LL);
      return 267LL;
    }

    uint64_t v9 = 0LL;
    int v10 = (unsigned __int8 *)(v7 + 5);
    while ((((unint64_t)*(v10 - 1) << 56) | ((unint64_t)*v10 << 48) | ((unint64_t)v10[1] << 40) | ((unint64_t)v10[2] << 32) | ((unint64_t)v10[3] << 24) | ((unint64_t)v10[4] << 16) | ((unint64_t)v10[5] << 8))
          + v10[6] != *(void *)(a2 + 8))
    {
      v10 += *(unsigned __int8 *)(a1 + 39);
      if (v8 == ++v9) {
        goto LABEL_6;
      }
    }
  }

  else
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }

  *(void *)a2 = 0LL;
  unsigned int v12 = sub_1813B3964(a1, v6, v9, (a3 + 1));
  LODWORD(result) = sub_1813AFFD4(a1, v6);
  if (v12) {
    uint64_t result = v12;
  }
  else {
    uint64_t result = result;
  }
  if (!(_DWORD)result)
  {
    sqlite3_int64 v13 = *(void **)(a1 + 128);
    uint64_t v14 = *(void *)(a2 + 8);
    if (!sub_1812B2390((uint64_t)v13, 0))
    {
      uint64_t v15 = v13[16];
      if ((*(_WORD *)(v15 + 20) & 0x9000) != 0)
      {
        sub_1813040AC(v15, v14);
      }

      else
      {
        *(void *)uint64_t v15 = v14;
        *(_WORD *)(v15 + 20) = 4;
      }

      uint64_t v16 = *(void *)(*v13 + 24LL);
      if (v16) {
        xmmword_18C465410(v16);
      }
    }

    sqlite3_step(*(sqlite3_stmt **)(a1 + 128));
    uint64_t result = sqlite3_reset(*(sqlite3_stmt **)(a1 + 128));
    if (!(_DWORD)result)
    {
      uint64_t v17 = *(void **)(a1 + 176);
      uint64_t v18 = *(void *)(a2 + 8);
      if (!sub_1812B2390((uint64_t)v17, 0))
      {
        uint64_t v19 = v17[16];
        if ((*(_WORD *)(v19 + 20) & 0x9000) != 0)
        {
          sub_1813040AC(v19, v18);
        }

        else
        {
          *(void *)uint64_t v19 = v18;
          *(_WORD *)(v19 + 20) = 4;
        }

        uint64_t v20 = *(void *)(*v17 + 24LL);
        if (v20) {
          xmmword_18C465410(v20);
        }
      }

      sqlite3_step(*(sqlite3_stmt **)(a1 + 176));
      uint64_t result = sqlite3_reset(*(sqlite3_stmt **)(a1 + 176));
      if (!(_DWORD)result)
      {
        uint64_t v21 = *(void *)(a2 + 8);
        if (v21)
        {
          uint64_t v22 = (void *)(a1 + 8LL * (v21 % 0x61) + 192);
          do
          {
            uint64_t v23 = v22;
            uint64_t v24 = *v22;
            uint64_t v22 = (void *)(*v22 + 32LL);
          }

          while (v24 != a2);
          void *v23 = *(void *)(a2 + 32);
        }

        uint64_t result = 0LL;
        *(void *)(a2 + 8) = a3;
        *(void *)(a2 + 32) = *(void *)(a1 + 96);
        ++*(_DWORD *)(a2 + 16);
        *(void *)(a1 + 96) = a2;
      }
    }
  }

  return result;
}

uint64_t sub_1813B3DCC(unsigned __int8 *a1, uint64_t *a2)
{
  if (!*a2) {
    return 0LL;
  }
  uint64_t v49 = *a2;
  unint64_t v4 = 0LL;
  uint64_t v5 = (unsigned __int8 *)a2[3];
  int v6 = v5[2];
  int v7 = v5[3];
  uint64_t v48 = a1[39];
  uint64_t v8 = (unsigned int *)(v5 + 12);
  unint64_t v9 = a1[37];
  do
  {
    int v10 = &v53[4 * v4 - 8];
    *((_DWORD *)v10 + 2) = bswap32(*v8);
    *((_DWORD *)v10 + 3) = bswap32(v8[1]);
    v8 += 2;
    v4 += 2LL;
  }

  while (v4 < v9);
  unsigned int v11 = v7 | (v6 << 8);
  if (v11 >= 2)
  {
    if (v9 <= 2) {
      unint64_t v12 = 2LL;
    }
    else {
      unint64_t v12 = v9;
    }
    unint64_t v13 = ((v12 - 1) >> 1) + 1;
    uint64_t v14 = v13 & 0x7FFFFFFFFFFFFFFCLL;
    for (int i = 1; i != v11; ++i)
    {
      sub_1813AC7C8((uint64_t)a1, (uint64_t)a2, i, &v50);
      if (a1[38])
      {
        if (v12 < 7)
        {
          unint64_t v16 = 0LL;
LABEL_18:
          uint64_t v24 = (int *)&v51[4 * v16 + 4];
          uint64_t v25 = (int *)&v53[4 * v16 + 4];
          do
          {
            int v26 = *(v25 - 1);
            if (v26 >= *(v24 - 1)) {
              int v26 = *(v24 - 1);
            }
            *(v25 - 1) = v26;
            int v27 = *v25;
            int v29 = *v24;
            v24 += 2;
            int v28 = v29;
            if (*v25 <= v29) {
              int v27 = v28;
            }
            *uint64_t v25 = v27;
            v25 += 2;
            v16 += 2LL;
          }

          while (v16 < v9);
          continue;
        }

        uint64_t v18 = v13 & 0x7FFFFFFFFFFFFFFCLL;
        uint64_t v19 = (int32x4_t *)v51;
        uint64_t v20 = (int32x4_t *)v53;
        do
        {
          int32x4_t v21 = v20[1];
          int32x4_t v22 = *v19;
          int32x4_t v23 = v19[1];
          v19 += 2;
          v56.val[0] = (float32x4_t)vuzp1q_s32(vminq_s32(*v20, v22), vminq_s32(v21, v23));
          v56.val[1] = (float32x4_t)vuzp2q_s32(vmaxq_s32(*v20, v22), vmaxq_s32(v21, v23));
          vst2q_f32((float *)v20->i32, v56);
          v20 += 2;
          v18 -= 4LL;
        }

        while (v18);
        unint64_t v16 = 2 * (v13 & 0x7FFFFFFFFFFFFFFCLL);
        if (v13 != v14) {
          goto LABEL_18;
        }
      }

      else
      {
        if (v12 < 7)
        {
          unint64_t v17 = 0LL;
LABEL_28:
          uint64_t v33 = (float *)&v51[4 * v17 + 4];
          unint64_t v34 = (float *)&v53[4 * v17 + 4];
          do
          {
            if (*(v34 - 1) >= *(v33 - 1)) {
              int v35 = *((_DWORD *)v33 - 1);
            }
            else {
              int v35 = *((_DWORD *)v34 - 1);
            }
            float v36 = *v34;
            float v37 = *v33;
            v33 += 2;
            float v38 = v37;
            if (*v34 <= v37) {
              float v36 = v38;
            }
            *((_DWORD *)v34 - 1) = v35;
            *unint64_t v34 = v36;
            v17 += 2LL;
            v34 += 2;
          }

          while (v17 < v9);
          continue;
        }

        uint64_t v30 = v13 & 0x7FFFFFFFFFFFFFFCLL;
        uint64_t v31 = (const float *)v51;
        uint64_t v32 = (float *)v53;
        do
        {
          float32x4x2_t v54 = vld2q_f32(v32);
          float32x4x2_t v55 = vld2q_f32(v31);
          v31 += 8;
          v57.val[0] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v55.val[0], v54.val[0]),  (int8x16_t)v54.val[0],  (int8x16_t)v55.val[0]);
          v57.val[1] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v54.val[1], v55.val[1]),  (int8x16_t)v54.val[1],  (int8x16_t)v55.val[1]);
          vst2q_f32(v32, v57);
          v32 += 8;
          v30 -= 4LL;
        }

        while (v30);
        unint64_t v17 = 2 * (v13 & 0x7FFFFFFFFFFFFFFCLL);
        if (v13 != v14) {
          goto LABEL_28;
        }
      }
    }
  }

  uint64_t v39 = *(void *)(v49 + 24);
  uint64_t v40 = __rev16(*(unsigned __int16 *)(v39 + 2));
  if (!(_DWORD)v40) {
    return 267LL;
  }
  unint64_t v41 = a2[1];
  __int128 v42 = (unsigned __int8 *)(v39 + 5);
  uint64_t v43 = 0x400000000LL;
  while ((((unint64_t)*(v42 - 1) << 56) | ((unint64_t)*v42 << 48) | ((unint64_t)v42[1] << 40) | ((unint64_t)v42[2] << 32) | ((unint64_t)v42[3] << 24) | ((unint64_t)v42[4] << 16) | ((unint64_t)v42[5] << 8))
        + v42[6] != v41)
  {
    v42 += v48;
    v43 += v48 << 32;
    if (!--v40) {
      return 267LL;
    }
  }

  int v45 = (void *)(v39 + (v43 >> 32));
  *int v45 = bswap64(v41);
  if (a1[37])
  {
    unint64_t v46 = 0LL;
    double v47 = v45 + 1;
    do
      *v47++ = bswap32(*(_DWORD *)&v53[4 * v46++]);
    while (v46 < a1[37]);
  }

  *(_DWORD *)(v49 + 20) = 1;
  return sub_1813B3DCC(a1);
}

uint64_t sub_1813B4134(uint64_t a1, void *a2, _DWORD *a3)
{
  if (*a2)
  {
    uint64_t v3 = *(void *)(*a2 + 24LL);
    uint64_t v4 = __rev16(*(unsigned __int16 *)(v3 + 2));
    if (!(_DWORD)v4) {
      return 267LL;
    }
    uint64_t v5 = 0LL;
    int v6 = (unsigned __int8 *)(v3 + 5);
    while ((((unint64_t)*(v6 - 1) << 56) | ((unint64_t)*v6 << 48) | ((unint64_t)v6[1] << 40) | ((unint64_t)v6[2] << 32) | ((unint64_t)v6[3] << 24) | ((unint64_t)v6[4] << 16) | ((unint64_t)v6[5] << 8))
          + v6[6] != a2[1])
    {
      v6 += *(unsigned __int8 *)(a1 + 39);
      if (v4 == ++v5) {
        return 267LL;
      }
    }
  }

  else
  {
    LODWORD(v5) = -1;
  }

  uint64_t result = 0LL;
  *a3 = v5;
  return result;
}

uint64_t sub_1813B41CC(uint64_t result, uint64_t a2, unint64_t *a3, int a4)
{
  uint64_t v4 = *(void *)(a2 + 24) + *(unsigned __int8 *)(result + 39) * (uint64_t)a4;
  *(void *)(v4 + 4) = bswap64(*a3);
  uint64_t v5 = v4 + 4;
  if (*(_BYTE *)(result + 37))
  {
    unint64_t v6 = 0LL;
    int v7 = (_DWORD *)(v5 + 8);
    do
    {
      *v7++ = bswap32(*((_DWORD *)a3 + v6 + 2));
      ++v6;
    }

    while (v6 < *(unsigned __int8 *)(result + 37));
  }

  *(_DWORD *)(a2 + 20) = 1;
  return result;
}

uint64_t sub_1813B4220(unsigned __int8 *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3 = *a2;
  if (!*a2) {
    return 0LL;
  }
  uint64_t v5 = (uint64_t)a2;
  int v7 = 0;
  uint64_t v8 = (int32x4_t *)(a3 + 8);
  uint64_t v9 = a3 + 12;
  do
  {
    if (v7 == 100) {
      return 267LL;
    }
    uint64_t v10 = v5;
    uint64_t v5 = v3;
    uint64_t v11 = *(void *)(v3 + 24);
    uint64_t v12 = __rev16(*(unsigned __int16 *)(v11 + 2));
    if (!(_DWORD)v12) {
      return 267LL;
    }
    uint64_t v13 = 0LL;
    ++v7;
    uint64_t v14 = *(void *)(v10 + 8);
    uint64_t v15 = (unsigned __int8 *)(v11 + 5);
    while ((((unint64_t)*(v15 - 1) << 56) | ((unint64_t)*v15 << 48) | ((unint64_t)v15[1] << 40) | ((unint64_t)v15[2] << 32) | ((unint64_t)v15[3] << 24) | ((unint64_t)v15[4] << 16) | ((unint64_t)v15[5] << 8))
          + v15[6] != v14)
    {
      v15 += a1[39];
      if (v12 == ++v13) {
        return 267LL;
      }
    }

    sub_1813AC7C8((uint64_t)a1, v5, v13, &v52);
    unint64_t v16 = a1[37];
    if (!a1[37]) {
      goto LABEL_37;
    }
    uint64_t v17 = 0LL;
    unint64_t v18 = 0LL;
    while (1)
    {
      uint64_t v19 = &v53[v17 - 8];
      uint64_t v20 = a3 + v17;
      if (a1[38] != 1) {
        break;
      }
      if (*(_DWORD *)(v20 + 8) < *((_DWORD *)v19 + 2) || *(_DWORD *)(a3 + v17 + 12) > *(_DWORD *)&v53[v17 + 4]) {
        goto LABEL_19;
      }
LABEL_11:
      v18 += 2LL;
      v17 += 8LL;
      if (v18 >= v16) {
        goto LABEL_37;
      }
    }

    if (a1[38])
    {
LABEL_19:
      unint64_t v21 = 2LL;
      if (v16 > 2) {
        unint64_t v21 = a1[37];
      }
      if (v21 >= 7)
      {
        unint64_t v23 = ((v21 - 1) >> 1) + 1;
        unint64_t v22 = 2 * (v23 & 0x7FFFFFFFFFFFFFFCLL);
        uint64_t v24 = v23 & 0x7FFFFFFFFFFFFFFCLL;
        uint64_t v25 = v8;
        int v26 = (int32x4_t *)v53;
        do
        {
          int32x4_t v27 = v26[1];
          int32x4_t v28 = *v25;
          int32x4_t v29 = v25[1];
          v25 += 2;
          v56.val[0] = (float32x4_t)vuzp1q_s32(vminq_s32(*v26, v28), vminq_s32(v27, v29));
          v56.val[1] = (float32x4_t)vuzp2q_s32(vmaxq_s32(*v26, v28), vmaxq_s32(v27, v29));
          vst2q_f32((float *)v26->i32, v56);
          v26 += 2;
          v24 -= 4LL;
        }

        while (v24);
        if (v23 == (v23 & 0x7FFFFFFFFFFFFFFCLL)) {
          goto LABEL_33;
        }
      }

      else
      {
        unint64_t v22 = 0LL;
      }

      uint64_t v30 = (int *)(v9 + 4 * v22);
      uint64_t v31 = (int *)&v53[4 * v22 + 4];
      do
      {
        if (*(v31 - 1) >= *(v30 - 1)) {
          int v32 = *(v30 - 1);
        }
        else {
          int v32 = *(v31 - 1);
        }
        int v33 = *v31;
        int v35 = *v30;
        v30 += 2;
        int v34 = v35;
        if (*v31 <= v35) {
          int v33 = v34;
        }
        *(v31 - 1) = v32;
        *uint64_t v31 = v33;
        v22 += 2LL;
        v31 += 2;
      }

      while (v22 < v16);
      goto LABEL_33;
    }

    unint64_t v39 = 2LL;
    if (v16 > 2) {
      unint64_t v39 = a1[37];
    }
    if (v39 >= 7)
    {
      unint64_t v41 = ((v39 - 1) >> 1) + 1;
      unint64_t v40 = 2 * (v41 & 0x7FFFFFFFFFFFFFFCLL);
      uint64_t v42 = v41 & 0x7FFFFFFFFFFFFFFCLL;
      uint64_t v43 = (const float *)v8;
      uint64_t v44 = (float *)v53;
      do
      {
        float32x4x2_t v54 = vld2q_f32(v44);
        float32x4x2_t v55 = vld2q_f32(v43);
        v43 += 8;
        v57.val[0] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v55.val[0], v54.val[0]),  (int8x16_t)v54.val[0],  (int8x16_t)v55.val[0]);
        v57.val[1] = (float32x4_t)vbslq_s8( (int8x16_t)vcgtq_f32(v54.val[1], v55.val[1]),  (int8x16_t)v54.val[1],  (int8x16_t)v55.val[1]);
        vst2q_f32(v44, v57);
        v44 += 8;
        v42 -= 4LL;
      }

      while (v42);
      if (v41 == (v41 & 0x7FFFFFFFFFFFFFFCLL)) {
        goto LABEL_33;
      }
    }

    else
    {
      unint64_t v40 = 0LL;
    }

    int v45 = (float *)(v9 + 4 * v40);
    unint64_t v46 = (float *)&v53[4 * v40 + 4];
    do
    {
      if (*(v46 - 1) >= *(v45 - 1)) {
        int v47 = *((_DWORD *)v45 - 1);
      }
      else {
        int v47 = *((_DWORD *)v46 - 1);
      }
      float v48 = *v46;
      float v49 = *v45;
      v45 += 2;
      float v50 = v49;
      if (*v46 <= v49) {
        float v48 = v50;
      }
      *((_DWORD *)v46 - 1) = v47;
      *unint64_t v46 = v48;
      v40 += 2LL;
      v46 += 2;
    }

    while (v40 < v16);
LABEL_33:
    float v36 = (void *)(*(void *)(v5 + 24) + (int)(v13 * a1[39] + 4));
    *float v36 = bswap64(v52);
    if (a1[37])
    {
      unint64_t v37 = 0LL;
      float v38 = v36 + 1;
      do
        *v38++ = bswap32(*(_DWORD *)&v53[4 * v37++]);
      while (v37 < a1[37]);
    }

    *(_DWORD *)(v5 + 20) = 1;
LABEL_37:
    uint64_t v3 = *(void *)v5;
  }

  while (*(void *)v5);
  return 0LL;
}

uint64_t sub_1813B458C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(a1 + 144);
  if (!sub_1812B2390((uint64_t)v6, 0))
  {
    uint64_t v7 = v6[16];
    if ((*(_WORD *)(v7 + 20) & 0x9000) != 0)
    {
      sub_1813040AC(v7, a2);
    }

    else
    {
      *(void *)uint64_t v7 = a2;
      *(_WORD *)(v7 + 20) = 4;
    }

    uint64_t v8 = *(void *)(*v6 + 24LL);
    if (v8) {
      xmmword_18C465410(v8);
    }
  }

  uint64_t v9 = *(void **)(a1 + 144);
  if (!sub_1812B2390((uint64_t)v9, 1u))
  {
    uint64_t v10 = v9[16];
    if ((*(_WORD *)(v10 + 84) & 0x9000) != 0)
    {
      sub_1813040AC(v10 + 64, a3);
    }

    else
    {
      *(void *)(v10 + 64) = a3;
      *(_WORD *)(v10 + 84) = 4;
    }

    uint64_t v11 = *(void *)(*v9 + 24LL);
    if (v11) {
      xmmword_18C465410(v11);
    }
  }

  sqlite3_step(*(sqlite3_stmt **)(a1 + 144));
  return sqlite3_reset(*(sqlite3_stmt **)(a1 + 144));
}

uint64_t sub_1813B4678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = *(void **)(a1 + 168);
  if (!sub_1812B2390((uint64_t)v6, 0))
  {
    uint64_t v7 = v6[16];
    if ((*(_WORD *)(v7 + 20) & 0x9000) != 0)
    {
      sub_1813040AC(v7, a2);
    }

    else
    {
      *(void *)uint64_t v7 = a2;
      *(_WORD *)(v7 + 20) = 4;
    }

    uint64_t v8 = *(void *)(*v6 + 24LL);
    if (v8) {
      xmmword_18C465410(v8);
    }
  }

  uint64_t v9 = *(void **)(a1 + 168);
  if (!sub_1812B2390((uint64_t)v9, 1u))
  {
    uint64_t v10 = v9[16];
    if ((*(_WORD *)(v10 + 84) & 0x9000) != 0)
    {
      sub_1813040AC(v10 + 64, a3);
    }

    else
    {
      *(void *)(v10 + 64) = a3;
      *(_WORD *)(v10 + 84) = 4;
    }

    uint64_t v11 = *(void *)(*v9 + 24LL);
    if (v11) {
      xmmword_18C465410(v11);
    }
  }

  sqlite3_step(*(sqlite3_stmt **)(a1 + 168));
  return sqlite3_reset(*(sqlite3_stmt **)(a1 + 168));
}

uint64_t sub_1813B4764(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  if (a4) {
    uint64_t v7 = sub_1813B4678;
  }
  else {
    uint64_t v7 = sub_1813B458C;
  }
  if (a4 < 1) {
    return v7(a1, a2, *(void *)(a3 + 8));
  }
  for (int i = *(uint64_t **)(a1 + 8LL * (a2 % 0x61) + 192); i; int i = (uint64_t *)i[4])
  {
    if (i[1] == a2) {
      break;
    }
  }

  if (a3)
  {
    uint64_t v9 = (uint64_t *)a3;
    do
    {
      if (v9 == i) {
        return 267LL;
      }
      uint64_t v9 = (uint64_t *)*v9;
    }

    while (v9);
    if (!i) {
      return v7(a1, a2, *(void *)(a3 + 8));
    }
    uint64_t v11 = v7;
    sub_1813AFFD4(a1, *i);
    uint64_t v7 = v11;
    if (a3) {
      ++*(_DWORD *)(a3 + 16);
    }
    goto LABEL_17;
  }

  if (i)
  {
    uint64_t v12 = v7;
    sub_1813AFFD4(a1, *i);
    uint64_t v7 = v12;
LABEL_17:
    uint64_t *i = a3;
  }

  return v7(a1, a2, *(void *)(a3 + 8));
}

float *sub_1813B4884(float *result, char *a2, unsigned int a3, uint64_t a4, uint64_t a5, void *a6)
{
  if ((int)a3 >= 2)
  {
    uint64_t v10 = result;
    signed int v11 = a3 >> 1;
    uint64_t v12 = a3 - (a3 >> 1);
    size_t v13 = 4LL * (a3 >> 1);
    uint64_t v14 = &a2[v13];
    ((void (*)(void))sub_1813B4884)();
    sub_1813B4884(v10, v14, v12, a4, a5, a6);
    memcpy(a6, a2, v13);
    signed int v15 = 0;
    int v16 = 0;
    int v17 = *((unsigned __int8 *)v10 + 38);
    uint64_t v18 = 8LL * (int)a4;
    uint64_t v19 = 4 * ((2 * (int)a4) | 1LL);
    while (1)
    {
      int v20 = *((_DWORD *)a6 + v15);
      uint64_t v21 = a5 + 48LL * v20 + 8;
      unint64_t v22 = (float *)(v21 + v18);
      uint64_t result = (float *)(v21 + v19);
      int v23 = *(_DWORD *)&v14[4 * v16];
      uint64_t v24 = a5 + 48LL * v23 + 8;
      uint64_t v25 = (float *)(v24 + v18);
      int v26 = (float *)(v24 + v19);
      if (v17)
      {
        double v27 = (double)*(int *)v22;
        double v28 = (double)*(int *)result;
        double v29 = (double)*(int *)v25;
        double v30 = (double)*(int *)v26;
        if (v15 == v11) {
          goto LABEL_13;
        }
LABEL_7:
        if (v16 != (_DWORD)v12 && v27 >= v29 && (v27 != v29 || v28 >= v30)) {
          goto LABEL_13;
        }
        *(_DWORD *)&a2[4 * v15 + 4 * v16] = v20;
        if (++v15 >= v11) {
          goto LABEL_16;
        }
      }

      else
      {
        double v27 = *v22;
        double v28 = *result;
        double v29 = *v25;
        double v30 = *v26;
        if (v15 != v11) {
          goto LABEL_7;
        }
LABEL_13:
        *(_DWORD *)&a2[4 * v15 + 4 * v16++] = v23;
        if (v15 >= v11)
        {
LABEL_16:
        }
      }
    }
  }

  return result;
}

char *sub_1813B4A1C(char *result, unsigned int a2, uint64_t a3, void *a4)
{
  if ((int)a2 >= 2)
  {
    unint64_t v6 = result;
    signed int v7 = a2 >> 1;
    uint64_t v8 = a2 - (a2 >> 1);
    size_t v9 = 4LL * (a2 >> 1);
    uint64_t v10 = &result[v9];
    ((void (*)(void))sub_1813B4A1C)();
    sub_1813B4A1C(v10, v8, a3, a4);
    uint64_t result = (char *)memcpy(a4, v6, v9);
    signed int v11 = 0;
    int v12 = 0;
    while (1)
    {
      if (v11 == v7)
      {
        *((_DWORD *)v6 + v7 + v12) = *(_DWORD *)&v10[4 * v12];
        ++v12;
        signed int v11 = v7;
LABEL_12:
      }

      else
      {
        int v13 = *((_DWORD *)a4 + v11);
        if (v12 == (_DWORD)v8)
        {
          *((_DWORD *)v6 + v11 + (int)v8) = v13;
          ++v11;
          int v12 = v8;
          if (v11 >= v7) {
            goto LABEL_12;
          }
        }

        else
        {
          uint64_t v14 = *(int *)&v10[4 * v12];
          uint64_t v15 = v11 + v12;
          if (*(double *)(a3 + 8LL * v13) >= *(double *)(a3 + 8 * v14))
          {
            *((_DWORD *)v6 + v15) = v14;
            ++v12;
            if (v11 >= v7) {
              goto LABEL_12;
            }
          }

          else
          {
            *((_DWORD *)v6 + v15) = v13;
            if (++v11 >= v7) {
              goto LABEL_12;
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1813B4B40(sqlite3 *a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, char **a6)
{
  if (a3 < 4)
  {
    int v12 = 0;
  }

  else
  {
    uint64_t v10 = *(const char **)(a4 + 24);
    int v16 = v10;
    if (v10) {
      int v11 = strlen(v10) & 0x3FFFFFFF;
    }
    else {
      int v11 = 0;
    }
    int v17 = v11;
    int v13 = sub_18131EDC8((uint64_t)a1, (uint64_t)&v16);
    if (v13 < 0)
    {
      *a6 = sqlite3_mprintf("no such database: %s", *(const char **)(a4 + 24));
      return 1LL;
    }

    int v12 = v13;
  }

  sqlite3_vtab_config(a1, 3);
  uint64_t result = sqlite3_declare_vtab( a1,  "CREATE TABLE x( name       TEXT, path       TEXT, pageno     INTEGER, pagetype   TEXT, ncell      INTEGER, payload    INTEGER, unused     INTEGER, mx_payload INTEGER, pgoffset   INTEGER, pgsize     INTEGER, schema TEXT HIDDEN, aggregate  BOOLEAN HIDDEN)");
  if ((_DWORD)result)
  {
    uint64_t v15 = 0LL;
  }

  else
  {
    if (sqlite3_initialize())
    {
      uint64_t v15 = 0LL;
    }

    else
    {
      uint64_t v15 = sub_18126F0AC(40LL);
      if (v15)
      {
        uint64_t result = 0LL;
        *(_OWORD *)uint64_t v15 = 0u;
        *(_OWORD *)(v15 + 16) = 0u;
        *(void *)(v15 + 24) = a1;
        *(void *)(v15 + 32) = 0LL;
        *(_DWORD *)(v15 + 32) = v12;
        goto LABEL_16;
      }
    }

    uint64_t result = 7LL;
  }

uint64_t sub_1813B4C48(uint64_t a1, unsigned int *a2)
{
  uint64_t v2 = *a2;
  uint64_t v3 = 0LL;
  uint64_t v4 = (_BYTE *)(*((void *)a2 + 1) + 5LL);
  unsigned int v5 = -1;
  unsigned int v6 = -1;
  unsigned int v7 = -1;
  do
  {
    if (*(v4 - 1) == 2)
    {
      if (!*v4) {
        return 19LL;
      }
      int v8 = *(_DWORD *)(v4 - 5);
      if (v8) {
        unsigned int v9 = v6;
      }
      else {
        unsigned int v9 = v3;
      }
      if (v8 == 10) {
        unsigned int v10 = v3;
      }
      else {
        unsigned int v10 = v7;
      }
      if (v8 == 10) {
        unsigned int v9 = v6;
      }
      if (v8 == 11)
      {
        unsigned int v5 = v3;
      }

      else
      {
        unsigned int v7 = v10;
        unsigned int v6 = v9;
      }
    }

    ++v3;
    v4 += 12;
  }

  while (v2 != v3);
  if ((v7 & 0x80000000) == 0)
  {
    uint64_t v11 = *((void *)a2 + 4) + 8LL * v7;
    int v12 = 1;
    *(_DWORD *)uint64_t v11 = 1;
    *(_BYTE *)(v11 + 4) = 1;
    a2[10] |= 1u;
    if ((v6 & 0x80000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }

  int v12 = 0;
  if ((v6 & 0x80000000) == 0)
  {
LABEL_19:
    *(_DWORD *)(*((void *)a2 + 4) + 8LL * v6) = ++v12;
    a2[10] |= 2u;
  }

uint64_t sub_1813B4DC4(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    uint64_t v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t sub_1813B4E70(uint64_t a1, void *a2)
{
  if (sqlite3_initialize()) {
    return 7LL;
  }
  unsigned int v5 = (_DWORD *)sub_18126F0AC(2152LL);
  if (!v5) {
    return 7LL;
  }
  unsigned int v6 = v5;
  bzero(v5, 0x868uLL);
  uint64_t result = 0LL;
  *(void *)unsigned int v6 = a1;
  v6[5] = *(_DWORD *)(a1 + 32);
  *a2 = v6;
  return result;
}

uint64_t sub_1813B4ED4(uint64_t a1)
{
  uint64_t v1 = a1;
  sub_1813B6264(a1);
  sqlite3_finalize(*(sqlite3_stmt **)(v1 + 8));
  uint64_t v2 = &off_18C4653A8;
  if (!dword_18C465380) {
    goto LABEL_6;
  }
  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v1);
  --qword_18C468B10;
  off_18C4653A8(v1);
  uint64_t v1 = xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    uint64_t v2 = &xmmword_18C465410;
LABEL_6:
    (*v2)(v1);
  }

  return 0LL;
}

uint64_t sub_1813B4F88(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *(void *)a1;
  sub_1813B6264(a1);
  sqlite3_finalize(*(sqlite3_stmt **)(a1 + 8));
  *(void *)(a1 + 8) = 0LL;
  if ((a2 & 1) == 0)
  {
    unsigned int v9 = 0;
    *(_DWORD *)(a1 + 20) = *(_DWORD *)(v8 + 32);
    if ((a2 & 2) == 0) {
      goto LABEL_3;
    }
    goto LABEL_40;
  }

  uint64_t v14 = *a5;
  if (!*a5) {
    goto LABEL_44;
  }
  int v15 = *(unsigned __int16 *)(v14 + 20);
  if ((~v15 & 0x202) != 0 || *(_BYTE *)(v14 + 22) != 1)
  {
    if ((v15 & 1) != 0) {
      goto LABEL_44;
    }
    uint64_t v16 = sub_181303998((int *)v14, 1);
    if (!v16) {
      goto LABEL_44;
    }
  }

  else
  {
    uint64_t v16 = *(void *)(v14 + 8);
    if (!v16) {
      goto LABEL_44;
    }
  }

  uint64_t v17 = *(void *)(v8 + 24);
  int v18 = *(_DWORD *)(v17 + 40);
  BOOL v19 = __OFSUB__(v18, 1);
  uint64_t v20 = (v18 - 1);
  if ((int)v20 < 0 != v19)
  {
LABEL_44:
    uint64_t v35 = 0LL;
    *(_DWORD *)(a1 + 20) = 0;
    *(_BYTE *)(a1 + 16) = 1;
    return v35;
  }

  uint64_t v21 = (_BYTE **)(*(void *)(v17 + 32) + 32 * v20);
  while (1)
  {
    unint64_t v22 = *v21;
    if (*v21)
    {
      for (int i = (unsigned __int8 *)v16; ; ++i)
      {
        uint64_t v24 = *v22;
        uint64_t v25 = *i;
        if ((_DWORD)v24 == (_DWORD)v25)
        {
          if (!*v22)
          {
            *(_DWORD *)(a1 + 20) = v20;
            if ((v20 & 0x80000000) == 0)
            {
              unsigned int v9 = 1;
              if ((a2 & 2) == 0) {
                goto LABEL_3;
              }
LABEL_40:
              unsigned int v32 = v9 + 1;
              uint64_t v33 = a5[v9];
              if (v33)
              {
                int v34 = *(unsigned __int16 *)(v33 + 20);
                if ((~v34 & 0x202) == 0 && *(_BYTE *)(v33 + 22) == 1)
                {
                  uint64_t v10 = *(void *)(v33 + 8);
LABEL_48:
                  unsigned int v9 = v32;
                  if ((a2 & 4) == 0) {
                    goto LABEL_49;
                  }
LABEL_4:
                  uint64_t v11 = a5[v9];
                  if (v11)
                  {
                    __int16 v12 = *(_WORD *)(v11 + 20);
                    if ((v12 & 8) != 0)
                    {
                      double v13 = *(double *)v11;
                    }

                    else if ((v12 & 0x24) != 0)
                    {
                      double v13 = (double)*(uint64_t *)v11;
                    }

                    else if ((v12 & 0x12) != 0)
                    {
                      double v13 = sub_181303DB8(v11);
                    }

                    else
                    {
                      double v13 = 0.0;
                    }
                  }

                  else
                  {
                    sub_1812CF36C(89752);
                    double v13 = 0.0;
                  }

                  BOOL v31 = v13 != 0.0;
                  goto LABEL_50;
                }

                if ((v34 & 1) == 0)
                {
                  uint64_t v10 = sub_181303998((int *)v33, 1);
                  goto LABEL_48;
                }
              }

              uint64_t v10 = 0LL;
              goto LABEL_48;
            }

            goto LABEL_44;
          }
        }

        else if (byte_1813C6343[v24] != byte_1813C6343[v25])
        {
          break;
        }

        ++v22;
      }
    }

    if (!(_DWORD)v20) {
      break;
    }
LABEL_25:
    v21 -= 4;
    BOOL v26 = (int)v20 <= 0;
    LODWORD(v20) = v20 - 1;
    if (v26) {
      goto LABEL_44;
    }
  }

  double v27 = (unsigned __int8 *)v16;
  for (j = "main"; ; ++j)
  {
    uint64_t v29 = *(unsigned __int8 *)j;
    uint64_t v30 = *v27;
    if ((_DWORD)v29 == (_DWORD)v30) {
      break;
    }
    if (byte_1813C6343[v29] != byte_1813C6343[v30]) {
      goto LABEL_25;
    }
LABEL_30:
    ++v27;
  }

  if (*j) {
    goto LABEL_30;
  }
  unsigned int v9 = 1;
  *(_DWORD *)(a1 + 20) = 0;
  if ((a2 & 2) != 0) {
    goto LABEL_40;
  }
LABEL_3:
  uint64_t v10 = 0LL;
  if ((a2 & 4) != 0) {
    goto LABEL_4;
  }
LABEL_49:
  BOOL v31 = 0;
LABEL_50:
  *(_BYTE *)(a1 + 17) = v31;
  uint64_t v36 = *(void *)(v8 + 24);
  if (sqlite3_initialize() || (uint64_t v38 = sub_18126F0AC(32LL)) == 0)
  {
    unint64_t v37 = (sqlite3_str *)&unk_18C54FA08;
  }

  else
  {
    unint64_t v37 = (sqlite3_str *)v38;
    if (v36) {
      int v39 = *(_DWORD *)(v36 + 136);
    }
    else {
      int v39 = 2147483645;
    }
    *(void *)uint64_t v38 = 0LL;
    *(void *)(v38 + 8) = 0LL;
    *(_DWORD *)(v38 + 16) = 0;
    *(_DWORD *)(v38 + 20) = v39;
    *(_DWORD *)(v38 + 24) = 0;
    *(_WORD *)(v38 + 28) = 0;
  }

  sqlite3_str_appendf( v37,  "SELECT * FROM (SELECT 'sqlite_schema' AS name,1 AS rootpage,'table' AS type UNION ALL SELECT name,rootpage,type FROM %w.sqlite_schema WHERE rootpage!=0)",  *(void *)(*(void *)(*(void *)(v8 + 24) + 32LL) + 32LL * *(int *)(a1 + 20)));
  if (v10) {
    sqlite3_str_appendf(v37, "WHERE name=%Q", v10);
  }
  if ((a2 & 8) != 0) {
    sqlite3_str_appendf(v37, " ORDER BY name");
  }
  unint64_t v40 = (unsigned __int8 *)sqlite3_str_finish(v37);
  if (!v40) {
    return 7LL;
  }
  uint64_t v42 = v40;
  uint64_t v35 = sub_18126DFE0(*(void *)(v8 + 24), v40, 0xFFFFFFFFLL, 128LL, 0LL, (void *)(a1 + 8), 0LL, v41);
  uint64_t v43 = (uint64_t (**)(unsigned __int8 *))&off_18C4653A8;
  if (!dword_18C465380) {
    goto LABEL_67;
  }
  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v42);
  --qword_18C468B10;
  off_18C4653A8(v42);
  uint64_t v42 = (unsigned __int8 *)xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    uint64_t v43 = (uint64_t (**)(unsigned __int8 *))&xmmword_18C465410;
LABEL_67:
    (*v43)(v42);
  }

  if (!(_DWORD)v35)
  {
    *(_DWORD *)(a1 + 2072) = -1;
    return sub_1813B537C(a1);
  }

  return v35;
}

uint64_t sub_1813B537C(uint64_t a1)
{
  uint64_t v148 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(*(void *)a1 + 24LL) + 32LL) + 32LL * *(int *)(a1 + 20) + 8);
  uint64_t v138 = **(void **)(v2 + 8);
  uint64_t v3 = *(void *)(a1 + 2088);
  if (v3)
  {
    uint64_t v4 = &off_18C4653A8;
    if (dword_18C465380)
    {
      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8[0] -= (int)off_18C4653B8(v3);
      --qword_18C468B10;
      off_18C4653A8(v3);
      uint64_t v3 = xmmword_18C468B70;
      if (!(void)xmmword_18C468B70) {
        goto LABEL_8;
      }
      uint64_t v4 = &xmmword_18C465410;
    }

    (*v4)(v3);
  }

uint64_t sub_1813B6078(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1813B6080(uint64_t a1, uint64_t *a2, int a3)
{
  switch(a3)
  {
    case 0:
      if (!a2) {
        goto LABEL_32;
      }
      uint64_t v5 = *(char **)(a1 + 2080);
      goto LABEL_9;
    case 1:
      if (*(_BYTE *)(a1 + 17)) {
        return 0LL;
      }
      if (!a2) {
        goto LABEL_32;
      }
      uint64_t v5 = *(char **)(a1 + 2088);
LABEL_9:
      uint64_t v7 = (uint64_t)a2;
      uint64_t v8 = -1LL;
      goto LABEL_44;
    case 2:
      if (*(_BYTE *)(a1 + 17))
      {
        if (a2)
        {
          uint64_t v6 = *(int *)(a1 + 2104);
          goto LABEL_36;
        }
      }

      else if (a2)
      {
        uint64_t v6 = *(unsigned int *)(a1 + 2076);
        goto LABEL_36;
      }

uint64_t sub_1813B6254(uint64_t a1, void *a2)
{
  *a2 = *(unsigned int *)(a1 + 2076);
  return 0LL;
}

uint64_t sub_1813B6264(uint64_t a1)
{
  for (uint64_t i = 0LL; i != 2048; i += 64LL)
  {
    uint64_t v3 = a1 + i;
    uint64_t v4 = *(void *)(a1 + i + 32);
    sub_1813B6458(a1 + i + 24);
    uint64_t v5 = *(void *)(a1 + i + 48);
    if (v5)
    {
      uint64_t v6 = &off_18C4653A8;
      if (dword_18C465380)
      {
        if ((void)xmmword_18C468B70) {
          xmmword_18C465400(xmmword_18C468B70);
        }
        qword_18C468AC8[0] -= (int)off_18C4653B8(v5);
        --qword_18C468B10;
        off_18C4653A8(v5);
        uint64_t v5 = xmmword_18C468B70;
        if (!(void)xmmword_18C468B70) {
          goto LABEL_11;
        }
        uint64_t v6 = &xmmword_18C465410;
      }

      (*v6)(v5);
    }

uint64_t sub_1813B6458(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 48);
  if (!v2) {
    goto LABEL_19;
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = 16LL;
  do
  {
    uint64_t v5 = *(void *)(*(void *)(v1 + 48) + v4);
    if (v5)
    {
      uint64_t v6 = &off_18C4653A8;
      if (!dword_18C465380) {
        goto LABEL_4;
      }
      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8 -= (int)off_18C4653B8(v5);
      --qword_18C468B10;
      uint64_t result = off_18C4653A8(v5);
      uint64_t v5 = xmmword_18C468B70;
      if ((void)xmmword_18C468B70)
      {
        uint64_t v6 = &xmmword_18C465410;
LABEL_4:
        uint64_t result = (*v6)(v5);
      }
    }

    ++v3;
    v4 += 32LL;
  }

  while (v3 < *(int *)(v1 + 36));
  uint64_t v2 = *(void *)(v1 + 48);
  if (v2)
  {
LABEL_13:
    uint64_t v7 = &off_18C4653A8;
    if (!dword_18C465380) {
      goto LABEL_18;
    }
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    uint64_t result = off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v7 = &xmmword_18C465410;
LABEL_18:
      uint64_t result = (*v7)(v2);
    }
  }

uint64_t sub_1813B65D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(int **)(a1 + 8);
  size_t v5 = v4[13];
  if (*(void *)(a3 + 8)) {
    goto LABEL_2;
  }
  int v8 = sqlite3_initialize();
  if ((int)v5 < -255 || v8 != 0)
  {
    *(void *)(a3 + 8) = 0LL;
    return 7LL;
  }

  uint64_t v10 = sub_18126F0AC((v5 + 256));
  *(void *)(a3 + 8) = v10;
  if (!v10) {
    return 7LL;
  }
  uint64_t v11 = (_OWORD *)(v10 + v5);
  v11[14] = 0u;
  v11[15] = 0u;
  v11[12] = 0u;
  v11[13] = 0u;
  v11[10] = 0u;
  v11[11] = 0u;
  v11[8] = 0u;
  v11[9] = 0u;
  v11[6] = 0u;
  v11[7] = 0u;
  v11[4] = 0u;
  v11[5] = 0u;
  v11[2] = 0u;
  v11[3] = 0u;
  _OWORD *v11 = 0u;
  v11[1] = 0u;
  uint64_t v4 = *(int **)(a1 + 8);
LABEL_2:
  uint64_t result = (*(uint64_t (**)(void))(*(void *)v4 + 288LL))();
  if (!(_DWORD)result)
  {
    memcpy(*(void **)(a3 + 8), MEMORY[8], v5);
    return 0LL;
  }

  return result;
}

uint64_t sub_1813B6708(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t result = sqlite3_declare_vtab( a1,  "CREATE TABLE x(key,value,type,atom,id,parent,fullkey,path,json HIDDEN,root HIDDEN)");
  if (!(_DWORD)result)
  {
    if (sqlite3_initialize())
    {
      *a5 = 0LL;
      return 7LL;
    }

    int v8 = (void *)sub_18126F0AC(24LL);
    *a5 = v8;
    if (!v8) {
      return 7LL;
    }
    *int v8 = 0LL;
    v8[1] = 0LL;
    v8[2] = 0LL;
    sqlite3_vtab_config(a1, 2);
    return 0LL;
  }

  return result;
}

uint64_t sub_1813B6774(uint64_t a1, uint64_t a2)
{
  v18[1] = *MEMORY[0x1895F89C0];
  v18[0] = -1LL;
  int v2 = *(_DWORD *)a2;
  if (*(int *)a2 < 1)
  {
    int v5 = 0;
    int v4 = 0;
  }

  else
  {
    int v3 = 0;
    int v4 = 0;
    int v5 = 0;
    uint64_t v6 = (_BYTE *)(*(void *)(a2 + 8) + 5LL);
    do
    {
      int v7 = *(_DWORD *)(v6 - 5);
      BOOL v8 = __OFSUB__(v7, 8);
      int v9 = v7 - 8;
      if (v9 < 0 == v8)
      {
        int v10 = 1 << v9;
        if (*v6)
        {
          if (*(v6 - 1) == 2)
          {
            *((_DWORD *)v18 + v9) = v3;
            v4 |= v10;
          }
        }

        else
        {
          v5 |= v10;
        }
      }

      ++v3;
      v6 += 12;
    }

    while (v2 != v3);
  }

  if (*(int *)(a2 + 16) >= 1
    && (uint64_t v11 = *(void *)(a2 + 24), (*(_DWORD *)v11 & 0x80000000) != 0)
    && !*(_BYTE *)(v11 + 4))
  {
    *(_DWORD *)(a2 + 60) = 1;
    if ((v5 & ~v4) != 0) {
      return 19LL;
    }
  }

  else if ((v5 & ~v4) != 0)
  {
    return 19LL;
  }

  uint64_t v13 = LODWORD(v18[0]);
  if ((v18[0] & 0x80000000) != 0)
  {
    int v16 = 0;
  }

  else
  {
    *(void *)(a2 + 64) = 0x3FF0000000000000LL;
    uint64_t v14 = *(void *)(a2 + 32);
    uint64_t v15 = v14 + 8 * v13;
    int v16 = 1;
    *(_DWORD *)uint64_t v15 = 1;
    *(_BYTE *)(v15 + 4) = 1;
    if ((v18[0] & 0x8000000000000000LL) == 0)
    {
      uint64_t v17 = v14 + 8LL * HIDWORD(v18[0]);
      *(_DWORD *)uint64_t v17 = 2;
      *(_BYTE *)(v17 + 4) = 1;
      int v16 = 3;
    }
  }

  uint64_t result = 0LL;
  *(_DWORD *)(a2 + 40) = v16;
  return result;
}

uint64_t sub_1813B68C8(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

double sub_1813B6974(uint64_t a1, void *a2)
{
  if (!sqlite3_initialize())
  {
    int v4 = (_OWORD *)sub_18126F0AC(128LL);
    if (v4)
    {
      double result = 0.0;
      v4[6] = 0u;
      v4[7] = 0u;
      v4[4] = 0u;
      v4[5] = 0u;
      v4[2] = 0u;
      v4[3] = 0u;
      *int v4 = 0u;
      v4[1] = 0u;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t sub_1813B69CC(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    int v3 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v3)(v2);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v3 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

uint64_t sub_1813B6B04(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v8 = *(void *)(a1 + 40);
  if (v8)
  {
    int v9 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v9)(v8);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v8);
    --qword_18C468B10;
    off_18C4653A8(v8);
    uint64_t v8 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v9 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

uint64_t sub_1813B71F4(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 25))
  {
    int v8 = *(unsigned __int8 *)(a1 + 24);
    if (v8 == 8)
    {
      uint64_t v12 = *(void *)(a1 + 56);
      int v13 = *(_DWORD *)(a1 + 16);
      else {
        int v14 = *(_DWORD *)(v12 + 16LL * (v13 + 1) + 4) + 2;
      }
      int v15 = v14 + v13;
    }

    else
    {
      if (v8 != 7)
      {
        *(_DWORD *)(a1 + 16) = *(_DWORD *)(a1 + 20);
        return 0LL;
      }

      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(unsigned int *)(a1 + 16);
      else {
        int v11 = *(_DWORD *)(v9 + 16 * v10 + 4) + 1;
      }
      int v15 = v11 + v10;
    }

    *(_DWORD *)(a1 + 16) = v15;
    ++*(_DWORD *)(a1 + 8);
    return 0LL;
  }

  uint64_t v1 = *(void *)(a1 + 56);
  unsigned int v2 = *(_DWORD *)(a1 + 20);
  int v3 = *(_DWORD *)(a1 + 16) + ((*(unsigned __int8 *)(v1 + 16LL * *(unsigned int *)(a1 + 16) + 1) >> 5) & 1);
  *(_DWORD *)(a1 + 16) = v3 + 1;
  ++*(_DWORD *)(a1 + 8);
  if (v3 + 1 >= v2) {
    return 0LL;
  }
  uint64_t v4 = *(unsigned int *)(*(void *)(a1 + 80) + 4LL * (v3 + 1));
  int v5 = *(unsigned __int8 *)(v1 + 16 * v4);
  *(_BYTE *)(a1 + 24) = v5;
  if (v5 != 7) {
    return 0LL;
  }
  uint64_t v6 = (_DWORD *)(v1 + 16 * v4 + 8);
  if ((_DWORD)v4 == v3) {
    _DWORD *v6 = 0;
  }
  else {
    ++*v6;
  }
  return 0LL;
}

BOOL sub_1813B7320(uint64_t a1)
{
  return *(_DWORD *)(a1 + 16) >= *(_DWORD *)(a1 + 20);
}

uint64_t sub_1813B7330(uint64_t a1, sqlite3_context *a2, int a3)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  uint64_t v6 = a1 + 48;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v8 = *(unsigned int *)(a1 + 16);
  uint64_t v9 = v7 + 16 * v8;
  switch(a3)
  {
    case 0:
      if (!(_DWORD)v8) {
        return 0LL;
      }
      int v10 = *(unsigned __int8 *)(a1 + 24);
      if (v10 == 7)
      {
        uint64_t v19 = (_DWORD *)(a1 + 8);
        if (*(_BYTE *)(a1 + 25))
        {
          if (!*v19) {
            return 0LL;
          }
          uint64_t v19 = (_DWORD *)(v7 + 16LL * *(unsigned int *)(*(void *)(a1 + 80) + 4 * v8) + 8);
        }

        sqlite3_result_int64(a2, *v19);
      }

      else if (v10 == 8)
      {
        int v11 = (unsigned __int8 *)(v7 + 16 * v8);
        goto LABEL_10;
      }

      return 0LL;
    case 1:
      int v11 = (unsigned __int8 *)(v9 + 16 * (((unint64_t)*(unsigned __int8 *)(v7 + 16 * v8 + 1) >> 5) & 1));
      goto LABEL_10;
    case 2:
      if (!a2) {
        goto LABEL_32;
      }
      uint64_t v12 = off_189B6EAD8[*(unsigned __int8 *)(v9
                                             + 16
                                             * (((unint64_t)*(unsigned __int8 *)(v7 + 16 * v8 + 1) >> 5) & 1))];
      goto LABEL_31;
    case 3:
      int v11 = (unsigned __int8 *)(v9 + 16 * (((unint64_t)*(unsigned __int8 *)(v7 + 16 * v8 + 1) >> 5) & 1));
      if (*v11 <= 6u) {
LABEL_10:
      }
        sub_18135C07C(v6, (uint64_t)v11, a2);
      return 0LL;
    case 4:
      if (!a2) {
        goto LABEL_33;
      }
      uint64_t v13 = (((unint64_t)*(unsigned __int8 *)(v7 + 16 * v8 + 1) >> 5) & 1) + v8;
      goto LABEL_17;
    case 5:
      if (a2)
      {
        uint64_t v13 = *(unsigned int *)(*(void *)(a1 + 80) + 4 * v8);
LABEL_17:
        uint64_t v14 = *(void *)a2;
        if ((*(_WORD *)(*(void *)a2 + 20LL) & 0x9000) != 0)
        {
          sub_1813040AC(v14, v13);
        }

        else
        {
          *(void *)uint64_t v14 = v13;
          *(_WORD *)(v14 + 20) = 4;
        }
      }

      else
      {
LABEL_33:
        sub_1812CF36C(97441);
      }

      return 0LL;
    case 6:
      int v22 = a2;
      uint64_t v23 = v26;
      __int128 v24 = xmmword_1813CDE10;
      __int16 v25 = 1;
      if (*(_BYTE *)(a1 + 25))
      {
        uint64_t v15 = a1;
LABEL_23:
        sub_1813B7854(v15, &v22, v8);
      }

      else
      {
        __int16 v16 = *(const void **)(a1 + 40);
        if (v16)
        {
          unsigned int v17 = strlen(*(const char **)(a1 + 40));
          if (v17)
          {
            uint64_t v18 = v17;
            if (v17 >= 0x64uLL)
            {
              sub_18135B8EC((uint64_t)&v22, v16, v17);
            }

            else
            {
              __memcpy_chk();
              *((void *)&v24 + 1) = v18;
            }
          }
        }

        else
        {
          *((void *)&v24 + 1) = 1LL;
          v26[0] = 36;
        }

        int v21 = *(unsigned __int8 *)(a1 + 24);
        if (v21 == 8)
        {
          sub_1813B79AC(&v22, v9);
        }

        else if (v21 == 7)
        {
          sub_18135BBCC(30, &v22, "[%d]", *(_DWORD *)(a1 + 8));
        }
      }

      sub_18135B44C((uint64_t)&v22);
      return 0LL;
    case 7:
      if (!*(_BYTE *)(a1 + 25)) {
        goto LABEL_25;
      }
      int v22 = a2;
      uint64_t v23 = v26;
      __int128 v24 = xmmword_1813CDE10;
      __int16 v25 = 1;
      LODWORD(v8) = *(_DWORD *)(*(void *)(a1 + 80) + 4 * v8);
      uint64_t v15 = a1;
      goto LABEL_23;
    case 8:
      if (!a2) {
        goto LABEL_32;
      }
      uint64_t v12 = *(char **)(a1 + 64);
      goto LABEL_31;
    default:
LABEL_25:
      if (a2)
      {
        if (*(void *)(a1 + 40)) {
          uint64_t v12 = *(char **)(a1 + 40);
        }
        else {
          uint64_t v12 = "$";
        }
LABEL_31:
        sub_1812D7A8C((uint64_t)a2, v12, -1, 1u, 0LL);
      }

      else
      {
LABEL_32:
        sub_1812CF36C(97498);
      }

      return 0LL;
  }

uint64_t sub_1813B7668(uint64_t a1, void *a2)
{
  *a2 = *(unsigned int *)(a1 + 8);
  return 0LL;
}

uint64_t sub_1813B7678(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    int v3 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v3)(v2);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v3 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

uint64_t sub_1813B773C(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = result;
  uint64_t v5 = *(void *)(result + 8);
  uint64_t v6 = (unsigned __int8 *)(v5 + 16LL * a2);
  *(_DWORD *)(*(void *)(result + 32) + 4LL * a2) = a3;
  int v7 = *v6;
  if (v7 == 7)
  {
    uint64_t v14 = v5 + 16LL * a2;
    int v16 = *(_DWORD *)(v14 + 4);
    uint64_t v15 = (_DWORD *)(v14 + 4);
    if (v16)
    {
      unsigned int v17 = 1;
      do
      {
        uint64_t result = sub_1813B773C(v4, v17 + a2, a2);
        unsigned int v19 = v17;
        if (v6[16 * v17] >= 7u) {
          int v18 = *(_DWORD *)&v6[16 * v17 + 4] + 1;
        }
        else {
          int v18 = 1;
        }
        v17 += v18;
      }

      while (v18 + v19 <= *v15);
    }
  }

  else if (v7 == 8)
  {
    uint64_t v8 = v5 + 16LL * a2;
    int v10 = *(_DWORD *)(v8 + 4);
    uint64_t v9 = (unsigned int *)(v8 + 4);
    if (v10)
    {
      unsigned int v11 = 1;
      do
      {
        *(_DWORD *)(*(void *)(v4 + 32) + 4LL * (v11 + a2)) = a2;
        uint64_t result = sub_1813B773C(v4, v11 + a2 + 1, a2);
        uint64_t v13 = &v6[16 * v11];
        if (v13[16] >= 7u) {
          int v12 = *((_DWORD *)v13 + 5) + 1;
        }
        else {
          int v12 = 1;
        }
        v11 += v12 + 1;
      }

      while (v11 <= *v9);
    }
  }

  return result;
}

uint64_t sub_1813B7854(uint64_t result, void *a2, unsigned int a3)
{
  if (a3)
  {
    uint64_t v5 = result;
    unsigned int v6 = *(_DWORD *)(*(void *)(result + 80) + 4LL * a3);
    sub_1813B7854();
    uint64_t v7 = *(void *)(v5 + 56);
    if (*(_BYTE *)(v7 + 16LL * v6) == 7)
    {
      return sub_18135BBCC(30, a2, "[%d]");
    }

    else
    {
      unint64_t v10 = v7 + 16LL * a3 + 16 * (((unint64_t)*(unsigned __int8 *)(v7 + 16LL * a3 + 1) >> 5) & 1);
      uint64_t v11 = *(void *)(v10 - 8);
      int v12 = *(_DWORD *)(v10 - 12);
      if ((*(_BYTE *)(v10 - 15) & 1) == 0 && v12 >= 3 && (byte_1813C6558[*(unsigned __int8 *)(v11 + 1)] & 2) != 0)
      {
        uint64_t v13 = (v12 - 1);
        uint64_t v14 = 2LL;
        if (v12 >= 4)
        {
          while ((byte_1813C6558[*(unsigned __int8 *)(v11 + v14)] & 6) != 0)
          {
            if (v13 == ++v14)
            {
              LODWORD(v14) = v12 - 1;
              break;
            }
          }
        }

        if ((_DWORD)v14 == (_DWORD)v13) {
          v12 -= 2;
        }
      }

      return sub_18135BBCC(v12 + 2, a2, ".%.*s");
    }
  }

  else
  {
    unint64_t v8 = a2[3];
    if (v8 >= a2[2])
    {
      return sub_18135BB8C((uint64_t)a2, 36);
    }

    else
    {
      uint64_t v9 = a2[1];
      a2[3] = v8 + 1;
      *(_BYTE *)(v9 + v8) = 36;
    }
  }

  return result;
}

uint64_t sub_1813B79AC(void *a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 8);
  int v3 = *(_DWORD *)(a2 + 4);
  if ((*(_BYTE *)(a2 + 1) & 1) == 0 && v3 >= 3 && (byte_1813C6558[*(unsigned __int8 *)(v2 + 1)] & 2) != 0)
  {
    uint64_t v4 = (v3 - 1);
    uint64_t v5 = 2LL;
    if (v3 >= 4)
    {
      while ((byte_1813C6558[*(unsigned __int8 *)(v2 + v5)] & 6) != 0)
      {
        if (v4 == ++v5)
        {
          LODWORD(v5) = v3 - 1;
          break;
        }
      }
    }

    if ((_DWORD)v5 == (_DWORD)v4)
    {
      v3 -= 2;
      ++v2;
    }
  }

  return sub_18135BBCC(v3 + 2, a1, ".%.*s", v3, (const char *)v2);
}

double sub_1813B7A50(uint64_t a1, uint64_t *a2)
{
  if (!sqlite3_initialize())
  {
    uint64_t v4 = sub_18126F0AC(128LL);
    if (v4)
    {
      double result = 0.0;
      *(_OWORD *)(v4 + 96) = 0u;
      *(_OWORD *)(v4 + 112) = 0u;
      *(_OWORD *)(v4 + 64) = 0u;
      *(_OWORD *)(v4 + 80) = 0u;
      *(_OWORD *)(v4 + 32) = 0u;
      *(_OWORD *)(v4 + 48) = 0u;
      *(_OWORD *)uint64_t v4 = 0u;
      *(_OWORD *)(v4 + 16) = 0u;
      *a2 = v4;
      *(_BYTE *)(v4 + 25) = 1;
    }
  }

  return result;
}

double sub_1813B7AB0(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (!sqlite3_declare_vtab(a1, off_189B6F5D8[a2 != 0]))
  {
    if (sqlite3_initialize())
    {
      *a5 = 0LL;
    }

    else
    {
      uint64_t v9 = sub_18126F0AC(40LL);
      *a5 = v9;
      if (v9)
      {
        double result = 0.0;
        *(_OWORD *)uint64_t v9 = 0u;
        *(_OWORD *)(v9 + 16) = 0u;
        *(void *)(v9 + 24) = a1;
        *(void *)(v9 + 32) = 0LL;
        *(_DWORD *)(v9 + 32) = 2 * (a2 != 0);
      }
    }
  }

  return result;
}

uint64_t sub_1813B7B40(uint64_t a1, unsigned int *a2)
{
  if (*(_DWORD *)(a1 + 32)) {
    int v2 = 4;
  }
  else {
    int v2 = 10;
  }
  *((void *)a2 + 8) = 0x4059000000000000LL;
  *((void *)a2 + 9) = 100LL;
  a2[10] = 0;
  uint64_t v3 = *a2;
  uint64_t v4 = 0LL;
  uint64_t v5 = *((void *)a2 + 1);
  uint64_t v6 = 8 * v3;
  uint64_t result = 19LL;
  do
  {
    if (*(_BYTE *)(v5 + 5))
    {
      int v8 = *(unsigned __int8 *)(v5 + 4);
      if (v8 == 71)
      {
        if (*(_DWORD *)v5 == v2)
        {
          *(_BYTE *)(*((void *)a2 + 4) + v4 + 4) = 1;
          a2[10] = 1;
        }
      }

      else if (v8 == 2 && *(_DWORD *)v5 == (v2 | 1))
      {
        uint64_t result = 0LL;
        uint64_t v9 = *((void *)a2 + 4) + v4;
        *(_BYTE *)(v9 + 4) = 1;
        *(_DWORD *)uint64_t v9 = 1;
      }
    }

    v5 += 12LL;
    v4 += 8LL;
  }

  while (v6 != v4);
  return result;
}

uint64_t sub_1813B7C08(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

double sub_1813B7CB4(uint64_t a1, uint64_t *a2)
{
  if (!sqlite3_initialize())
  {
    uint64_t v5 = sub_18126F0AC(136LL);
    if (v5)
    {
      double result = 0.0;
      *(_OWORD *)(v5 + 80) = 0u;
      *(_OWORD *)(v5 + 96) = 0u;
      *(_WORD *)(v5 + 92) = 1;
      *(void *)(v5 + 128) = 0LL;
      *(_OWORD *)(v5 + 112) = 0u;
      *(_OWORD *)(v5 + 48) = 0u;
      *(_OWORD *)(v5 + 64) = 0u;
      *(_OWORD *)(v5 + 16) = 0u;
      *(_OWORD *)(v5 + 32) = 0u;
      *(_OWORD *)uint64_t v5 = 0u;
      *(void *)(v5 + 96) = *(void *)(a1 + 24);
      *(_DWORD *)(v5 + 104) = 0;
      *a2 = v5;
    }
  }

  return result;
}

uint64_t sub_1813B7D2C(uint64_t a1)
{
  uint64_t v1 = a1;
  sub_1813B839C(a1);
  if (v1)
  {
    int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t sub_1813B7DDC(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int **a5)
{
  uint64_t v8 = *(void *)a1;
  sub_1813B839C(a1);
  *(void *)(a1 + 16) = 0LL;
  *(_DWORD *)(a1 + 28) = a2 == 0;
  unint64_t v10 = *a5;
  if (!*a5)
  {
    sub_1812CF36C(97220);
    unint64_t v10 = *a5;
    if (!*a5)
    {
      sub_1812CF36C(97118);
      uint64_t v13 = 0LL;
      goto LABEL_23;
    }

uint64_t sub_1813B7F80(uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[5];
  if (v3)
  {
    uint64_t v4 = &off_18C4653A8;
    if (dword_18C465380)
    {
      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8[0] -= (int)off_18C4653B8(v3);
      --qword_18C468B10;
      off_18C4653A8(v3);
      uint64_t v3 = xmmword_18C468B70;
      if (!(void)xmmword_18C468B70) {
        goto LABEL_8;
      }
      uint64_t v4 = &xmmword_18C465410;
    }

    (*v4)(v3);
LABEL_8:
    a1[5] = 0LL;
  }

  if (a1[8])
  {
    a1[6] = 0LL;
    a1[7] = 0LL;
    a1[8] = 0LL;
  }

  if (*((_DWORD *)a1 + 7)) {
    uint64_t v5 = (uint64_t)(a1 + 9);
  }
  else {
    uint64_t v5 = 0LL;
  }
  if (sub_1813040F4(a1[1], v5, *(unsigned int *)(v2 + 32), (int *)a1 + 4, (int *)a1 + 5, a1 + 4))
  {
    if ((*((_WORD *)a1 + 46) & 0x9000) != 0) {
      sub_181303888((int *)a1 + 18);
    }
    else {
      *((_WORD *)a1 + 46) = 1;
    }
    a1[4] = 0LL;
  }

  return 0LL;
}

BOOL sub_1813B80A8(uint64_t a1)
{
  return *(void *)(a1 + 32) == 0LL;
}

uint64_t sub_1813B80B8( uint64_t *a1, sqlite3_context *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  uint64_t v11 = *a1;
  uint64_t v12 = a1[4];
  uint64_t v13 = *((int *)a1 + 5);
  if (*(_DWORD *)(*a1 + 32))
  {
    if ((_DWORD)a3 == 4)
    {
LABEL_3:
      if (*((_DWORD *)a1 + 4) != (_DWORD)v13 + 1)
      {
        uint64_t v14 = *(void *)(v12 + 16);
        if (v14)
        {
          if (a2)
          {
            uint64_t v15 = (char *)(v14 + 3);
LABEL_46:
            sub_1812D7A8C((uint64_t)a2, v15, -1, 1u, 0LL);
          }

          else
          {
LABEL_47:
            sub_1812CF36C(97498);
          }
        }

        else
        {
          sqlite3_result_text(a2, "(FK)", 4, 0LL);
        }
      }

      return 0LL;
    }

    if ((int)a3 <= 2 && !a1[6])
    {
      int v16 = *(_DWORD *)(v12 + 40LL * (int)v13 + 8);
      unsigned int v17 = (uint64_t *)(*(void *)(*(void *)(v11 + 24) + 32LL) + 32LL * *(int *)(v12 + 40LL * (int)v13 + 12));
      uint64_t v18 = v17[3];
      a1[7] = *v17;
      unsigned int v19 = *(void **)(v18 + 16);
      if (v19)
      {
        while (1)
        {
          uint64_t v20 = v19[2];
          if (*(_BYTE *)(v20 + 63) != 1 && *(_DWORD *)(v20 + 40) == v16) {
            break;
          }
          unsigned int v19 = (void *)*v19;
          if (!v19) {
            goto LABEL_15;
          }
        }

        a1[8] = *(void *)v20;
        a1[6] = (uint64_t)"table";
      }

uint64_t sub_1813B838C(uint64_t a1, void *a2)
{
  *a2 = *(int *)(a1 + 16);
  return 0LL;
}

void sub_1813B839C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    uint64_t v3 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v3)(v2);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v3 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

void sub_1813B84BC()
{
  v0 = getenv("SQLITE_AUTO_PROFILE");
  if (v0)
  {
    uint64_t v1 = v0;
    BOOL v2 = 1;
    if (!strncasecmp("1", v0, 1uLL))
    {
      if (isatty(2)) {
        int v3 = 1;
      }
      else {
        int v3 = 2;
      }
    }

    else if (!strncasecmp("stderr", v1, 6uLL))
    {
      BOOL v2 = 1;
      int v3 = 1;
    }

    else
    {
      BOOL v2 = strncasecmp("syslog", v1, 6uLL) == 0;
      int v3 = 2 * v2;
    }
  }

  else
  {
    BOOL v2 = 0;
    int v3 = 0;
  }

  __int16 v4 = getenv("SQLITE_AUTO_TRACE");
  if (v4)
  {
    if (!strncasecmp("1", v4, 1uLL))
    {
      if (isatty(2)) {
        LODWORD(v4) = 1;
      }
      else {
        LODWORD(v4) = 2;
      }
LABEL_20:
LABEL_23:
      if ((os_variant_allows_internal_security_policies() & 1) == 0)
      {
        sqlite3_log(28, "Auto logging environment variable set, but process is restricted. Ignoring.");
        return;
      }

void sub_1813B8654(uint64_t a1, char *a2, unint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  if (qword_18C468CB8 != -1) {
    dispatch_once(&qword_18C468CB8, &unk_189B6CE88);
  }
  BOOL v5 = (os_log_s *)qword_18C468C88;
  if (os_log_type_enabled((os_log_t)qword_18C468C88, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = &byte_1813CEAEE;
    if (a2) {
      uint64_t v6 = a2;
    }
    int v7 = 136315394;
    int v8 = v6;
    __int16 v9 = 2048;
    unint64_t v10 = a3 / 0xF4240;
    _os_log_impl( &dword_181266000,  v5,  OS_LOG_TYPE_DEFAULT,  "Query: %s\n Execution Time: %llu ms\n",  (uint8_t *)&v7,  0x16u);
  }

void sub_1813B8758(uint64_t a1, char *a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (qword_18C468CB8 != -1) {
    dispatch_once(&qword_18C468CB8, &unk_189B6CE88);
  }
  __int16 v4 = (os_log_s *)qword_18C468C88;
  if (os_log_type_enabled((os_log_t)qword_18C468C88, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = &byte_1813CEAEE;
    if (a2) {
      BOOL v5 = a2;
    }
    int v6 = 134218242;
    uint64_t v7 = a1;
    __int16 v8 = 2080;
    __int16 v9 = v5;
    _os_log_impl(&dword_181266000, v4, OS_LOG_TYPE_DEFAULT, "TraceSQL(%p): %s\n", (uint8_t *)&v6, 0x16u);
  }

uint64_t sub_1813B8844(uint64_t a1)
{
  uint64_t v1 = a1;
  int v2 = *(_DWORD *)(a1 + 40);
  if (v2 >= 1)
  {
    for (uint64_t i = 0LL; i < v2; ++i)
    {
      uint64_t v4 = *(void *)(v1 + 48);
      uint64_t v5 = *(void *)(v4 + 8 * i);
      if (v5)
      {
        if ((*(_WORD *)(v5 + 20) & 0x9000) != 0 || *(_DWORD *)(v5 + 32)) {
          sub_181303838(*(void *)(v4 + 8 * i));
        }
        sub_1812F20DC(*(void **)(v5 + 24), (void *)v5);
        int v2 = *(_DWORD *)(v1 + 40);
      }
    }
  }

  int v6 = &off_18C4653A8;
  if (!dword_18C465380) {
    return (*v6)(v1);
  }
  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v1);
  --qword_18C468B10;
  uint64_t result = off_18C4653A8(v1);
  uint64_t v1 = xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    int v6 = &xmmword_18C465410;
    return (*v6)(v1);
  }

  return result;
}

uint64_t sub_1813B8954(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  if (sqlite3_initialize())
  {
    uint64_t v8 = 0LL;
  }

  else
  {
    uint64_t v10 = sub_18126F0AC(32LL);
    uint64_t v8 = v10;
    if (v10)
    {
      *(_OWORD *)uint64_t v10 = 0u;
      *(_OWORD *)(v10 + 16) = 0u;
      *(void *)(v10 + 24) = a2;
      uint64_t result = sqlite3_declare_vtab(a1, "CREATE TABLE x(value INTEGER PRIMARY KEY)");
      goto LABEL_6;
    }
  }

  uint64_t result = 7LL;
LABEL_6:
  *a5 = v8;
  return result;
}

uint64_t sub_1813B89C4()
{
  return 0LL;
}

uint64_t sub_1813B89CC(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t sub_1813B8A78(uint64_t a1, void *a2)
{
  if (sqlite3_initialize()) {
    return 7LL;
  }
  uint64_t v4 = sub_18126F0AC(16LL);
  if (!v4) {
    return 7LL;
  }
  uint64_t v5 = (void *)v4;
  uint64_t result = 0LL;
  void *v5 = 0LL;
  v5[1] = 0LL;
  *a2 = v5;
  return result;
}

uint64_t sub_1813B8AC0(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t sub_1813B8B6C(uint64_t a1)
{
  *(_DWORD *)(a1 + 8) = 0;
  return 0LL;
}

uint64_t sub_1813B8B78(uint64_t a1)
{
  return 0LL;
}

BOOL sub_1813B8B8C(_DWORD *a1)
{
  return a1[2] >= **(_DWORD **)(*(void *)a1 + 24LL);
}

uint64_t sub_1813B8BA8(unsigned int *a1, uint64_t *a2)
{
  uint64_t v2 = a1[2];
  if ((v2 & 0x80000000) == 0)
  {
    uint64_t v3 = *(void *)(*(void *)a1 + 24LL);
    if ((int)v2 < *(_DWORD *)v3)
    {
      if (a2)
      {
        uint64_t v4 = *(void *)(*(void *)(v3 + 8) + 8 * v2);
        uint64_t v5 = *a2;
        if ((*(_WORD *)(*a2 + 20) & 0x9000) != 0)
        {
          sub_1813040AC(v5, v4);
        }

        else
        {
          *(void *)uint64_t v5 = v4;
          *(_WORD *)(v5 + 20) = 4;
        }
      }

      else
      {
        sub_1812CF36C(97441);
      }
    }
  }

  return 0LL;
}

uint64_t sub_1813B8C20(uint64_t a1, void *a2)
{
  *a2 = *(int *)(a1 + 8);
  return 0LL;
}

uint64_t sub_1813B8C30(uint64_t a1, int a2, sqlite3_value **a3)
{
  *a3 = sqlite3_column_value(*(sqlite3_stmt **)a1, *(_DWORD *)(a1 + 12) + a2 + *(_DWORD *)(a1 + 8));
  return 0LL;
}

uint64_t sub_1813B8C6C(uint64_t a1, int a2, sqlite3_value **a3)
{
  *a3 = sqlite3_column_value(*(sqlite3_stmt **)a1, *(_DWORD *)(a1 + 8) + a2);
  return 0LL;
}

uint64_t sub_1813B8CA4(uint64_t a1)
{
  LODWORD(v2) = *(_DWORD *)(a1 + 12);
  if (!(_DWORD)v2)
  {
    uint64_t v2 = *(unsigned __int16 **)a1;
    if (*(void *)a1)
    {
      uint64_t v4 = *(void *)(*(void *)v2 + 24LL);
      if (v4)
      {
        xmmword_18C465400(v4);
        uint64_t v5 = *(void *)(*(void *)v2 + 24LL);
        LODWORD(v2) = v2[130];
        if (v5) {
          xmmword_18C465410(v5);
        }
      }

      else
      {
        LODWORD(v2) = v2[130];
      }
    }
  }

  return ((_DWORD)v2 - *(_DWORD *)(a1 + 8));
}

uint64_t sub_1813B8D18()
{
  return 0LL;
}

double sub_1813B8D20(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)&__int128 v4 = 0LL;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  __int128 v74 = 0u;
  if (*(_DWORD *)(a3 + 36) || sub_1812E8AFC(a3, a4)) {
    return *(double *)&v4;
  }
  int v9 = *(_DWORD *)(a4 + 16) - *(_DWORD *)(a4 + 24);
  uint64_t v10 = a3 + 96;
  if (v9 != (*(unsigned int (**)(void))(a3 + 120))(*(void *)(a3 + 96)))
  {
    int v11 = 17;
    goto LABEL_7;
  }

  if (sub_1813B97A8(a3, 0, a4))
  {
    int v11 = 7;
LABEL_7:
    *(_DWORD *)(a3 + 36) = v11;
    return *(double *)&v4;
  }

  if (*(_DWORD *)(a4 + 20))
  {
    __int128 v4 = *(_OWORD *)v10;
    __int128 v12 = *(_OWORD *)(a3 + 112);
    __int128 v74 = *(_OWORD *)v10;
    __int128 v75 = v12;
    *(void *)&__int128 v76 = *(void *)(a3 + 128);
    *((void *)&v76 + 1) = a3;
    *(void *)(a3 + 96) = &v74;
    *(void *)(a3 + 104) = sub_1813B9A50;
    *(void *)(a3 + 112) = sub_1813B99BC;
    *(void *)(a3 + 120) = sub_1813B9AE0;
    *(void *)(a3 + 128) = sub_1813B9AEC;
    if (!*(void *)(a3 + 72))
    {
      uint64_t v13 = sub_1812DEB68(0LL);
      if (!v13) {
        goto LABEL_203;
      }
      uint64_t v14 = v13;
      sub_181269368(v13, &byte_1813CEAEE, 0LL, 0, 0LL);
      *(void *)(a3 + 72) = v14;
    }
  }

  uint64_t v72 = (void *)(a3 + 96);
  if (*(_DWORD *)(a4 + 24))
  {
    unsigned int v15 = HIDWORD(a2) ^ a2 ^ (8 * a2);
LABEL_15:
    int v71 = v15 % *(_DWORD *)(a4 + 52);
    uint64_t v16 = *(void *)(*(void *)(a4 + 56) + 8LL * v71);
    if (v16)
    {
      uint64_t v17 = 104LL;
      if (a1 == 18) {
        uint64_t v17 = 112LL;
      }
      uint64_t v73 = v17;
      while (1)
      {
        uint64_t v18 = *(unsigned __int8 **)(v16 + 16);
        if (!*(_DWORD *)(a4 + 24)) {
          break;
        }
        if (*v18 == 1 && bswap64(*(void *)(v18 + 1)) == a2) {
          goto LABEL_116;
        }
LABEL_19:
        uint64_t v16 = *(void *)(v16 + 24);
        if (!v16) {
          goto LABEL_183;
        }
      }

      int v19 = *(_DWORD *)(a4 + 16);
      if (v19 >= 1)
      {
        uint64_t v20 = 0LL;
        while (1)
        {
          if (!*(_BYTE *)(*(void *)(a4 + 40) + v20))
          {
            int v24 = *v18;
            int v21 = 1;
            if (*v18) {
              BOOL v25 = v24 == 5;
            }
            else {
              BOOL v25 = 1;
            }
            if (!v25 && v24 != 255)
            {
              if ((v24 - 1) < 2)
              {
                int v21 = 9;
              }

              else
              {
                int v26 = v18[1];
                if ((v26 & 0x80) != 0)
                {
                  int v36 = v18[2];
                  if ((char)v18[2] < 0)
                  {
                    int v44 = (char)v18[3];
                    if (v44 < 0)
                    {
                      char v45 = sub_18129BD74((char *)v18 + 1, (unint64_t *)&v78);
                      else {
                        int v26 = (int)v78;
                      }
                      int v27 = (v45 + 1);
                    }

                    else
                    {
                      int v26 = v44 & 0x7F | (v26 << 14) & 0x1FC07F | ((v36 & 0x7F) << 7);
                      int v27 = 4;
                    }
                  }

                  else
                  {
                    int v26 = ((v26 & 0x7F) << 7) | v36;
                    int v27 = 3;
                  }
                }

                else
                {
                  int v27 = 2;
                }

                int v21 = v27 + v26;
              }
            }

            v18 += v21;
            goto LABEL_28;
          }

          uint64_t v22 = v18 + 1;
          int v23 = *v18;
          (*(void (**)(void, uint64_t, sqlite3_value **))(a3 + v73))(*(void *)(a3 + 96), v20, &v77);
          if (v77)
          {
            if (byte_1813C6455[*((_WORD *)v77 + 10) & 0x3F] != v23) {
              goto LABEL_19;
            }
          }

          else
          {
            sub_1812CF36C(97220);
            if (v23) {
              goto LABEL_19;
            }
          }

          if ((v23 - 1) > 1)
          {
            int v31 = *v22;
            if ((v31 & 0x80) != 0)
            {
              int v34 = v18[2];
              if ((char)v18[2] < 0)
              {
                int v35 = (char)v18[3];
                if (v35 < 0)
                {
                  unsigned int v37 = sub_18129BD74((char *)v18 + 1, (unint64_t *)&v78);
                  else {
                    int v31 = (int)v78;
                  }
                  uint64_t v32 = v37;
                }

                else
                {
                  int v31 = v35 & 0x7F | (v31 << 14) & 0x1FC07F | ((v34 & 0x7F) << 7);
                  uint64_t v32 = 3LL;
                }
              }

              else
              {
                int v31 = ((v31 & 0x7F) << 7) | v34;
                uint64_t v32 = 2LL;
              }
            }

            else
            {
              uint64_t v32 = 1LL;
            }

            if (!v77)
            {
              sub_1812CF36C(91138);
              goto LABEL_87;
            }

            __int16 v38 = *((_WORD *)v77 + 10);
            if ((v38 & 2) != 0 && *((_BYTE *)v77 + 22) == 1)
            {
              int v39 = *((_DWORD *)v77 + 4);
              goto LABEL_88;
            }

            if ((v38 & 0x10) != 0)
            {
              int v39 = *((_DWORD *)v77 + 4);
              if ((*((_WORD *)v77 + 10) & 0x400) != 0) {
                v39 += *(_DWORD *)v77;
              }
            }

            else
            {
              if ((v38 & 1) == 0)
              {
                int v39 = sub_181303970((uint64_t)v77, 1);
                goto LABEL_88;
              }

BOOL sub_1813B97A8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6 = *(int *)(a3 + 52);
  if ((_DWORD)v6)
  {
    int v7 = (int)v6 >= 0 ? *(_DWORD *)(a3 + 52) : v6 + 1;
    if (*(_DWORD *)(a3 + 48) < v7 >> 1) {
      return 0LL;
    }
  }

  if ((_DWORD)v6) {
    uint64_t v9 = 2 * v6;
  }
  else {
    uint64_t v9 = 256LL;
  }
  if (sqlite3_initialize())
  {
    if (!a1) {
      return *(_DWORD *)(a3 + 52) == 0;
    }
    uint64_t v10 = 0LL;
  }

  else
  {
    uint64_t v12 = sub_18126F0AC(8 * v9);
    uint64_t v10 = (char *)v12;
    if (!a1) {
      goto LABEL_18;
    }
    if (v12)
    {
      uint64_t v11 = (int)off_18C4653B8(v12);
      goto LABEL_17;
    }
  }

  uint64_t v11 = 0LL;
LABEL_17:
  *(void *)(a1 + 56) += v11;
LABEL_18:
  if (!v10) {
    return *(_DWORD *)(a3 + 52) == 0;
  }
  bzero(v10, 8 * v9);
  int v13 = *(_DWORD *)(a3 + 52);
  if (v13 >= 1)
  {
    for (uint64_t i = 0LL; i < v13; ++i)
    {
      uint64_t v15 = *(void *)(*(void *)(a3 + 56) + 8 * i);
      if (v15)
      {
        do
        {
          if (a2) {
            BOOL v16 = *(_BYTE *)v15 == 9;
          }
          else {
            BOOL v16 = 0;
          }
          int v17 = v16;
          int v18 = sub_1813BA254(a3, v17, *(unsigned __int8 **)(v15 + 16), v9);
          uint64_t v19 = *(void *)(v15 + 24);
          uint64_t v20 = 8LL * v18;
          *(void *)(v15 + 24) = *(void *)&v10[v20];
          *(void *)&v10[v20] = v15;
          uint64_t v15 = v19;
        }

        while (v19);
        int v13 = *(_DWORD *)(a3 + 52);
      }
    }
  }

  uint64_t v21 = *(void *)(a3 + 56);
  if (a1)
  {
    if (v21) {
      uint64_t v22 = (int)off_18C4653B8(*(void *)(a3 + 56));
    }
    else {
      uint64_t v22 = 0LL;
    }
    *(void *)(a1 + 56) -= v22;
  }

  if (!v21) {
    goto LABEL_44;
  }
  int v23 = &off_18C4653A8;
  if (dword_18C465380)
  {
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v21);
    --qword_18C468B10;
    off_18C4653A8(v21);
    uint64_t v21 = xmmword_18C468B70;
    if (!(void)xmmword_18C468B70) {
      goto LABEL_44;
    }
    int v23 = &xmmword_18C465410;
  }

  (*v23)(v21);
LABEL_44:
  BOOL result = 0LL;
  *(_DWORD *)(a3 + 52) = v9;
  *(void *)(a3 + 56) = v10;
  return result;
}

uint64_t sub_1813B99BC(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = a2;
  uint64_t v10 = 0LL;
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t *))(a1 + 16))(*(void *)a1, a2, &v10);
  uint64_t v7 = v6;
  uint64_t v8 = v10;
  if (v4 == 1 && !(_DWORD)v6)
  {
    if (v10)
    {
      if (((0xAAAAAAAAAAAAAAAALL >> *(_WORD *)(v10 + 20)) & 1) != 0) {
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 72LL);
      }
    }

    else
    {
      sub_1812CF36C(97220);
      uint64_t v8 = v10;
    }
  }

  *a3 = v8;
  return v7;
}

uint64_t sub_1813B9A50(uint64_t a1, uint64_t a2, void *a3)
{
  int v4 = a2;
  uint64_t v10 = 0LL;
  uint64_t v6 = (*(uint64_t (**)(void, uint64_t, uint64_t *))(a1 + 8))(*(void *)a1, a2, &v10);
  uint64_t v7 = v6;
  uint64_t v8 = v10;
  if (v4 == 1 && !(_DWORD)v6)
  {
    if (v10)
    {
      if (((0xAAAAAAAAAAAAAAAALL >> *(_WORD *)(v10 + 20)) & 1) != 0) {
        uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 72LL);
      }
    }

    else
    {
      sub_1812CF36C(97220);
      uint64_t v8 = v10;
    }
  }

  *a3 = v8;
  return v7;
}

uint64_t sub_1813B9AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 24))(*(void *)a1);
}

uint64_t sub_1813B9AEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))(*(void *)a1);
}

uint64_t sub_1813B9AF8(uint64_t a1, sqlite3_value *a2, void *a3)
{
  if (!a2)
  {
    if (a1) {
      *(_BYTE *)a1 = 0;
    }
LABEL_13:
    uint64_t v10 = 1LL;
    uint64_t result = 0LL;
    if (!a3) {
      return result;
    }
    goto LABEL_64;
  }

  uint64_t v6 = *((_WORD *)a2 + 10) & 0x3F;
  int v7 = byte_1813C6455[v6];
  if (a1) {
    *(_BYTE *)a1 = v7;
  }
  if ((v7 - 1) >= 2)
  {
    if (v7 == 5) {
      goto LABEL_13;
    }
    if (((0x4000000040004uLL >> v6) & 1) != 0)
    {
      int v14 = *((unsigned __int16 *)a2 + 10);
      if ((~v14 & 0x202) == 0 && *((_BYTE *)a2 + 22) == 1)
      {
        uint64_t v15 = (const void *)*((void *)a2 + 1);
        __int16 v16 = *((_WORD *)a2 + 10);
        if ((v16 & 2) == 0) {
          goto LABEL_40;
        }
        goto LABEL_37;
      }

      if ((v14 & 1) != 0)
      {
        uint64_t v15 = 0LL;
        __int16 v16 = *((_WORD *)a2 + 10);
        if ((v16 & 2) == 0) {
          goto LABEL_40;
        }
        goto LABEL_37;
      }

      uint64_t v12 = sub_181303998((int *)a2, 1);
    }

    else
    {
      uint64_t v12 = (uint64_t)sqlite3_value_blob(a2);
    }

    uint64_t v15 = (const void *)v12;
    __int16 v16 = *((_WORD *)a2 + 10);
    if ((v16 & 2) == 0) {
      goto LABEL_40;
    }
LABEL_37:
    if (*((_BYTE *)a2 + 22) == 1)
    {
      int v17 = *((_DWORD *)a2 + 4);
      if (v15) {
        goto LABEL_51;
      }
      goto LABEL_47;
    }

uint64_t sub_1813B9DFC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v37 = 2LL;
  if (*(_BYTE *)a4 == 18)
  {
    if (*(_DWORD *)(a3 + 24)) {
      uint64_t v37 = 11LL;
    }
    if (a1 != 9 && *(int *)(a3 + 16) >= 1)
    {
      uint64_t v7 = 0LL;
      do
      {
        __int16 v38 = 0LL;
        (*(void (**)(void, uint64_t, sqlite3_value **))(a2 + 112))(*(void *)(a2 + 96), v7, &v38);
        sub_1813B9AF8(0LL, v38, &v37);
        uint64_t v7 = (v7 + 1);
      }

      while ((int)v7 < *(_DWORD *)(a3 + 16));
    }

    goto LABEL_87;
  }

  if (a1 == 9)
  {
    uint64_t v8 = *(int *)(a4 + 8);
    uint64_t v37 = v8 + 2;
    uint64_t v9 = *(void *)(*(void *)a2 + 368LL);
    if (v9 && (*(_DWORD *)(v9 + 92) & 0x80000000) == 0)
    {
      uint64_t v10 = v8 + 2 + v8;
      goto LABEL_86;
    }

    goto LABEL_87;
  }

  uint64_t v11 = *(unsigned __int8 **)(a4 + 16);
  uint64_t v12 = *(int *)(a3 + 24);
  if ((_DWORD)v12)
  {
    uint64_t v37 = 12LL;
    v11 += 9;
  }

  while (1)
  {
    int v36 = 0LL;
    (*(void (**)(void, void, sqlite3_value **))(a2 + 112))( *(void *)(a2 + 96),  (v12 - *(_DWORD *)(a3 + 24)),  &v36);
    int v14 = v36;
    if (!v36) {
      return 7LL;
    }
    uint64_t v15 = v11 + 1;
    int v16 = *v11;
    if ((v16 - 1) >= 2)
    {
      if (v16 == 5)
      {
        int v20 = 0;
        unint64_t v21 = (0x5555555555555555uLL >> *((_WORD *)v36 + 10)) & 1;
        ++v11;
        goto LABEL_74;
      }

      int v22 = *v15;
      if ((v22 & 0x80) != 0)
      {
        int v25 = v11[2];
        if ((char)v11[2] < 0)
        {
          int v26 = (char)v11[3];
          if (v26 < 0)
          {
            unsigned int v23 = sub_18129BD74((char *)v11 + 1, (unint64_t *)&v38);
            else {
              int v22 = (int)v38;
            }
          }

          else
          {
            int v22 = v26 & 0x7F | (v22 << 14) & 0x1FC07F | ((v25 & 0x7F) << 7);
            unsigned int v23 = 3;
          }
        }

        else
        {
          int v22 = ((v22 & 0x7F) << 7) | v25;
          unsigned int v23 = 2;
        }
      }

      else
      {
        unsigned int v23 = 1;
      }

      double v28 = &v15[v23];
      __int16 v29 = *((_WORD *)v14 + 10);
      if (byte_1813C6455[v29 & 0x3F] != v16) {
        goto LABEL_72;
      }
      if ((v29 & 2) != 0 && *((_BYTE *)v14 + 22) == 1)
      {
        if (v22 != *((_DWORD *)v14 + 4)) {
          goto LABEL_72;
        }
      }

      else if ((v29 & 0x10) != 0)
      {
        int v30 = *((_DWORD *)v14 + 4);
        if ((*((_WORD *)v14 + 10) & 0x400) != 0) {
          v30 += *(_DWORD *)v14;
        }
        if (v22 != v30) {
          goto LABEL_72;
        }
      }

      else if ((v29 & 1) != 0)
      {
        if (v22) {
          goto LABEL_72;
        }
      }

      else if (v22 != sub_181303970((uint64_t)v14, 1))
      {
        goto LABEL_72;
      }

      if (!v22 || (int v31 = sqlite3_value_blob(v36), !memcmp(v28, v31, v22)))
      {
        LODWORD(v21) = 0;
LABEL_73:
        int v20 = v23 + v22;
        uint64_t v11 = &v28[v22];
        goto LABEL_74;
      }

uint64_t sub_1813BA254(uint64_t a1, int a2, unsigned __int8 *a3, unsigned int a4)
{
  uint64_t v5 = *(unsigned int *)(a1 + 16);
  if ((int)v5 >= 1)
  {
    uint64_t v8 = 0LL;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)(a1 + 40);
    while (1)
    {
      int v12 = *a3;
      if (a2 && !*(_BYTE *)(v10 + v8)) {
        goto LABEL_5;
      }
      if (!*(_BYTE *)(v10 + v8))
      {
        int v11 = 1;
        if (*a3) {
          BOOL v15 = v12 == 5;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15 && v12 != 255)
        {
          if ((v12 - 1) < 2)
          {
            int v11 = 9;
          }

          else
          {
            int v16 = a3[1];
            if ((v16 & 0x80) != 0)
            {
              int v21 = a3[2];
              if ((char)a3[2] < 0)
              {
                int v25 = (char)a3[3];
                if (v25 < 0)
                {
                  char v26 = sub_18129BD74((char *)a3 + 1, &v28);
                  if (HIDWORD(v28)) {
                    int v16 = -1;
                  }
                  else {
                    int v16 = v28;
                  }
                  int v17 = (v26 + 1);
                }

                else
                {
                  int v16 = v25 & 0x7F | (v16 << 14) & 0x1FC07F | ((v21 & 0x7F) << 7);
                  int v17 = 4;
                }
              }

              else
              {
                int v16 = ((v16 & 0x7F) << 7) | v21;
                int v17 = 3;
              }
            }

            else
            {
              int v17 = 2;
            }

            int v11 = v17 + v16;
          }
        }

        a3 += v11;
        goto LABEL_5;
      }

      int v13 = a3[1];
      v9 ^= v12 ^ (8 * v9);
      unsigned int v14 = bswap32(*(_DWORD *)(a3 + 5)) ^ (8 * v9) ^ v9;
      unsigned int v9 = _byteswap_ulong(*(_DWORD *)(a3 + 1)) ^ (8 * v14) ^ v14;
      a3 += 9;
LABEL_5:
      if (++v8 == v5) {
        return v9 % a4;
      }
    }

    if ((v13 & 0x80) != 0)
    {
      int v19 = a3[2];
      if ((char)a3[2] < 0)
      {
        int v20 = (char)a3[3];
        if (v20 < 0)
        {
          unsigned int v22 = sub_18129BD74((char *)a3 + 1, &v28);
          int v13 = v28;
          uint64_t v18 = v22;
          if (HIDWORD(v28))
          {
            int v13 = -1;
LABEL_31:
            a3 += v18 + v13 + 1;
            goto LABEL_5;
          }
        }

        else
        {
          int v13 = v20 & 0x7F | (v13 << 14) & 0x1FC07F | ((v19 & 0x7F) << 7);
          uint64_t v18 = 3LL;
        }
      }

      else
      {
        int v13 = ((v13 & 0x7F) << 7) | v19;
        uint64_t v18 = 2LL;
      }
    }

    else
    {
      uint64_t v18 = 1LL;
    }

    if (v13 >= 1)
    {
      uint64_t v23 = v13;
      double v24 = a3 + 1;
      do
      {
        v9 ^= v24[v18] ^ (8 * v9);
        ++v24;
        --v23;
      }

      while (v23);
    }

    goto LABEL_31;
  }

  unsigned int v9 = 0;
  return v9 % a4;
}

uint64_t sub_1813BA494(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 368);
  if (v1) {
    return *(unsigned __int16 *)(v1 + 38);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1813BA4AC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 368);
  if (v1) {
    return *(unsigned int *)(*(void *)v1 + 368LL);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1813BA4C8(uint64_t a1, int a2, uint64_t a3, _DWORD *a4)
{
  if (a2) {
    char v7 = 80;
  }
  else {
    char v7 = 84;
  }
  if (!*a4)
  {
    int v8 = *(_DWORD *)(a1 + 8);
    int v9 = *(_DWORD *)(a1 + 12);
    uint64_t v10 = v8;
    if (v8 >= v9)
    {
      if (!v9) {
        int v9 = 128;
      }
      uint64_t v12 = v9;
      do
      {
        uint64_t v13 = v12;
        v12 *= 2LL;
      }

      while (v12 <= v8);
      if (v13 >= 1073741696 && (uint64_t v12 = 2147483391LL, v8 >= 2147483391)
        || (uint64_t v14 = *(void *)a1, sqlite3_initialize())
        || (uint64_t v11 = sub_18127D33C(v14, v12)) == 0)
      {
        *a4 = 7;
        goto LABEL_16;
      }

      *(void *)a1 = v11;
      *(_DWORD *)(a1 + 12) = v12;
      if (*a4) {
        goto LABEL_16;
      }
      int v8 = *(_DWORD *)(a1 + 8);
      uint64_t v10 = v8;
    }

    else
    {
      uint64_t v11 = *(void *)a1;
    }

    *(_DWORD *)(a1 + 8) = v8 + 1;
    *(_BYTE *)(v11 + v10) = v7;
  }

uint64_t sub_1813BA5F4( uint64_t a1, int a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6, uint64_t a7, uint64_t a8, void *a9)
{
  unsigned int v40 = 0;
  v39[0] = 0LL;
  v39[1] = 0LL;
  v38[0] = 0LL;
  v38[1] = 0LL;
  if (a5) {
    size_t v16 = "_rowid_, *";
  }
  else {
    size_t v16 = "*";
  }
  v37[0] = 0LL;
  v37[1] = 0LL;
  sub_1813BB9F4((uint64_t)v39, ", 1", &v40);
  if (a4)
  {
    int v17 = "sqlite_stat1";
    for (uint64_t i = a4; ; ++i)
    {
      uint64_t v19 = *(unsigned __int8 *)v17;
      uint64_t v20 = *i;
      if ((_DWORD)v19 == (_DWORD)v20)
      {
        if (!*v17)
        {
          sub_1813BB9F4((uint64_t)v39, " AND (?6 OR ?3 IS stat)", &v40);
          sub_1813BB9F4((uint64_t)v38, "tbl, idx", &v40);
          sub_1813BB9F4((uint64_t)v37, "?1, (CASE WHEN ?2=X'' THEN NULL ELSE ?2 END)", &v40);
          size_t v16 = "tbl, ?2, stat";
          goto LABEL_17;
        }
      }

      else if (byte_1813C6343[v19] != byte_1813C6343[v20])
      {
        break;
      }

      ++v17;
    }
  }

  if (a6 >= 1)
  {
    uint64_t v36 = a1;
    uint64_t v21 = 0LL;
    unsigned int v22 = &byte_1813CEAEE;
    do
    {
      while (!*(_BYTE *)(a8 + v21))
      {
        sub_1813BBC4C( (char *)v39,  &v40,  " AND (?%d OR ?%d IS %w.%w)",  (v21 + 1 + a6),  v21 + 1,  a4,  *(void *)(a7 + 8 * v21));
        if (++v21 == a6) {
          goto LABEL_16;
        }
      }

      sub_1813BB9F4((uint64_t)v38, v22, &v40);
      sub_1813BB9F4((uint64_t)v37, v22, &v40);
      sub_1813BBB08((uint64_t)v38, *(char **)(a7 + 8 * v21++), &v40);
      sub_1813BBC4C((char *)v37, &v40, "?%d", v21);
      unsigned int v22 = ", ";
    }

    while (v21 != a6);
LABEL_16:
    a1 = v36;
  }

uint64_t sub_1813BAA70(sqlite3_stmt *a1, int a2, uint64_t a3, uint64_t a4)
{
  if (a2 < 1) {
    return 0LL;
  }
  v27[11] = v4;
  v27[12] = v5;
  uint64_t v8 = 0LL;
  int v9 = *(char **)(a4 + 16);
  unint64_t v10 = a2;
  uint64_t v11 = v9;
  do
  {
    int v12 = *v11++;
    uint64_t result = 0LL;
    switch(v12)
    {
      case 0:
      case 5:
        break;
      case 1:
        if (!*(_BYTE *)(a3 + v8)) {
          goto LABEL_12;
        }
        uint64_t result = sqlite3_bind_int64(a1, v8 + 1, bswap64(*(void *)(v9 + 1)));
        uint64_t v11 = v9 + 9;
        break;
      case 2:
        if (*(_BYTE *)(a3 + v8))
        {
          uint64_t result = sqlite3_bind_double(a1, v8 + 1, COERCE_DOUBLE(bswap64(*(void *)(v9 + 1))));
          uint64_t v11 = v9 + 9;
        }

        else
        {
LABEL_12:
          uint64_t result = 0LL;
          uint64_t v11 = v9 + 9;
        }

        break;
      case 3:
        int v14 = *v11;
        if ((v14 & 0x80) != 0)
        {
          int v18 = v9[2];
          if (v9[2] < 0)
          {
            int v20 = v9[3];
            if (v20 < 0)
            {
              unsigned int v22 = sub_18129BD74(v11, v27);
              if (HIDWORD(v27[0])) {
                int v14 = -1;
              }
              else {
                int v14 = v27[0];
              }
              uint64_t v15 = v22;
            }

            else
            {
              int v14 = v20 & 0x7F | (v14 << 14) & 0x1FC07F | ((v18 & 0x7F) << 7);
              uint64_t v15 = 3LL;
            }
          }

          else
          {
            int v14 = ((v14 & 0x7F) << 7) | v18;
            uint64_t v15 = 2LL;
          }
        }

        else
        {
          uint64_t v15 = 1LL;
        }

        uint64_t v23 = &v11[v15];
        uint64_t v24 = v14;
        if (*(_BYTE *)(a3 + v8))
        {
          uint64_t result = sub_1812B2220( (uint64_t *)a1,  (int)v8 + 1,  v23,  v14,  (uint64_t (*)(uint64_t))0xFFFFFFFFFFFFFFFFLL,  1u);
          uint64_t v11 = &v23[v24];
        }

        else
        {
          uint64_t result = 0LL;
          uint64_t v11 = &v23[v14];
        }

        break;
      default:
        int v16 = *v11;
        if ((v16 & 0x80) != 0)
        {
          int v19 = v9[2];
          if (v9[2] < 0)
          {
            int v21 = v9[3];
            if (v21 < 0)
            {
              unsigned int v25 = sub_18129BD74(v11, v27);
              if (HIDWORD(v27[0])) {
                int v16 = -1;
              }
              else {
                int v16 = v27[0];
              }
              uint64_t v17 = v25;
            }

            else
            {
              int v16 = v21 & 0x7F | (v16 << 14) & 0x1FC07F | ((v19 & 0x7F) << 7);
              uint64_t v17 = 3LL;
            }
          }

          else
          {
            int v16 = ((v16 & 0x7F) << 7) | v19;
            uint64_t v17 = 2LL;
          }
        }

        else
        {
          uint64_t v17 = 1LL;
        }

        char v26 = &v11[v17];
        if (*(_BYTE *)(a3 + v8))
        {
          if (v16 < 0) {
            uint64_t result = sub_1812CF36C(98740);
          }
          else {
            uint64_t result = sub_1812B2220( (uint64_t *)a1,  (int)v8 + 1,  v26,  v16,  (uint64_t (*)(uint64_t))0xFFFFFFFFFFFFFFFFLL,  0);
          }
        }

        else
        {
          uint64_t result = 0LL;
        }

        uint64_t v11 = &v26[v16];
        break;
    }

    if (++v8 >= v10) {
      break;
    }
    int v9 = v11;
  }

  while (!(_DWORD)result);
  return result;
}

uint64_t sub_1813BACD4(uint64_t result, sqlite3_stmt *a2, int iCol, _DWORD *a4)
{
  v21[1] = *MEMORY[0x1895F89C0];
  if (*a4) {
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = sqlite3_column_type(a2, iCol);
  int v8 = result;
  if (!*a4)
  {
    int v9 = *(_DWORD *)(v7 + 8);
    int v10 = *(_DWORD *)(v7 + 12);
    uint64_t v11 = v9;
    if (v9 < v10)
    {
      uint64_t result = *(void *)v7;
LABEL_5:
      *(_DWORD *)(v7 + 8) = v9 + 1;
      *(_BYTE *)(result + v11) = v8;
      goto LABEL_14;
    }

    if (!v10) {
      int v10 = 128;
    }
    uint64_t v12 = v10;
    do
    {
      uint64_t v13 = v12;
      v12 *= 2LL;
    }

    while (v12 <= v9);
    if (v13 >= 1073741696 && (uint64_t v12 = 2147483391LL, v9 >= 2147483391)
      || (uint64_t v14 = *(void *)v7, result = sqlite3_initialize(), (_DWORD)result)
      || (uint64_t result = sub_18127D33C(v14, v12)) == 0)
    {
      *a4 = 7;
    }

    else
    {
      *(void *)uint64_t v7 = result;
      *(_DWORD *)(v7 + 12) = v12;
      if (!*a4)
      {
        int v9 = *(_DWORD *)(v7 + 8);
        uint64_t v11 = v9;
        goto LABEL_5;
      }
    }
  }

uint64_t sub_1813BAF00(uint64_t a1, int a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5)
{
  __src = 0LL;
  unsigned int v62 = 0;
  size_t __n = 0LL;
  int v9 = *(unsigned __int8 **)(a4 + 16);
  int v11 = *(_DWORD *)(a1 + 8);
  int v10 = *(_DWORD *)(a1 + 12);
  uint64_t v12 = v11;
  int v58 = v11;
  if (v11 >= v10)
  {
    if (!v10) {
      int v10 = 128;
    }
    uint64_t v20 = v10;
    do
    {
      uint64_t v21 = v20;
      v20 *= 2LL;
    }

    while (v20 <= v11);
    if (v21 > 1073741695)
    {
      if (v11 > 2147483390) {
        goto LABEL_24;
      }
      uint64_t v20 = 2147483391LL;
    }

    uint64_t v22 = *(void *)a1;
    if (sqlite3_initialize()) {
      goto LABEL_24;
    }
    uint64_t v13 = sub_18127D33C(v22, v20);
    if (!v13) {
      goto LABEL_24;
    }
    *(void *)a1 = v13;
    *(_DWORD *)(a1 + 12) = v20;
    int v14 = *(_DWORD *)(a1 + 8);
    uint64_t v12 = v14;
  }

  else
  {
    uint64_t v13 = *(void *)a1;
    int v14 = v11;
  }

  *(_DWORD *)(a1 + 8) = v14 + 1;
  *(_BYTE *)(v13 + v12) = 23;
  char v15 = *(_BYTE *)(a4 + 1);
  int v16 = *(_DWORD *)(a1 + 8);
  int v17 = *(_DWORD *)(a1 + 12);
  uint64_t v18 = v16;
  if (v16 >= v17)
  {
    if (!v17) {
      int v17 = 128;
    }
    uint64_t v23 = v17;
    do
    {
      uint64_t v24 = v23;
      v23 *= 2LL;
    }

    while (v23 <= v16);
    if (v24 > 1073741695)
    {
      if (v16 > 2147483390) {
        goto LABEL_24;
      }
      uint64_t v23 = 2147483391LL;
    }

    uint64_t v25 = *(void *)a1;
    if (!sqlite3_initialize())
    {
      uint64_t v19 = sub_18127D33C(v25, v23);
      if (v19)
      {
        *(void *)a1 = v19;
        *(_DWORD *)(a1 + 12) = v23;
        int v16 = *(_DWORD *)(a1 + 8);
        uint64_t v18 = v16;
        goto LABEL_5;
      }
    }

uint64_t sub_1813BB530(uint64_t a1, int a2, uint64_t a3, int a4, _BYTE *a5)
{
  unsigned int v37 = 0;
  int v10 = *(_DWORD *)(a1 + 8);
  int v11 = *(_DWORD *)(a1 + 12);
  uint64_t v12 = v10;
  if (v10 >= v11)
  {
    if (!v11) {
      int v11 = 128;
    }
    uint64_t v19 = v11;
    do
    {
      uint64_t v20 = v19;
      v19 *= 2LL;
    }

    while (v19 <= v10);
    if (v20 > 1073741695)
    {
      if (v10 > 2147483390) {
        goto LABEL_25;
      }
      uint64_t v19 = 2147483391LL;
    }

    uint64_t v21 = *(void *)a1;
    if (sqlite3_initialize()) {
      goto LABEL_25;
    }
    uint64_t v13 = sub_18127D33C(v21, v19);
    if (!v13) {
      goto LABEL_25;
    }
    *(void *)a1 = v13;
    *(_DWORD *)(a1 + 12) = v19;
    int v10 = *(_DWORD *)(a1 + 8);
    uint64_t v12 = v10;
  }

  else
  {
    uint64_t v13 = *(void *)a1;
  }

  *(_DWORD *)(a1 + 8) = v10 + 1;
  *(_BYTE *)(v13 + v12) = 9;
  char v14 = *(_BYTE *)(a3 + 1);
  int v15 = *(_DWORD *)(a1 + 8);
  int v16 = *(_DWORD *)(a1 + 12);
  uint64_t v17 = v15;
  if (v15 < v16)
  {
    uint64_t v18 = *(void *)a1;
    goto LABEL_5;
  }

  if (!v16) {
    int v16 = 128;
  }
  uint64_t v22 = v16;
  do
  {
    uint64_t v23 = v22;
    v22 *= 2LL;
  }

  while (v22 <= v15);
  if (v23 > 1073741695)
  {
    if (v15 > 2147483390) {
      goto LABEL_25;
    }
    uint64_t v22 = 2147483391LL;
  }

  uint64_t v24 = *(void *)a1;
  if (sqlite3_initialize() || (uint64_t v18 = sub_18127D33C(v24, v22)) == 0)
  {
LABEL_25:
    unsigned int v37 = 7;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }

  *(void *)a1 = v18;
  *(_DWORD *)(a1 + 12) = v22;
  int v15 = *(_DWORD *)(a1 + 8);
  uint64_t v17 = v15;
LABEL_5:
  *(_DWORD *)(a1 + 8) = v15 + 1;
  *(_BYTE *)(v18 + v17) = v14;
  if (a2)
  {
LABEL_26:
    if (a4 < 1) {
      return v37;
    }
    uint64_t v25 = *(char **)(a3 + 16);
    uint64_t v26 = a4;
    int v27 = v25;
    while (1)
    {
      int v29 = *v27++;
      int v28 = v29;
      if ((v29 - 1) < 2)
      {
        int v27 = v25 + 9;
      }

      else
      {
        if (v28) {
          BOOL v30 = v28 == 5;
        }
        else {
          BOOL v30 = 1;
        }
        if (!v30)
        {
          int v31 = *v27;
          if ((v31 & 0x80) != 0)
          {
            int v33 = v25[2];
            if (v25[2] < 0)
            {
              int v34 = v25[3];
              if (v34 < 0)
              {
                unsigned int v35 = sub_18129BD74(v27, &v38);
                if (HIDWORD(v38)) {
                  int v31 = -1;
                }
                else {
                  int v31 = v38;
                }
                uint64_t v32 = v35;
              }

              else
              {
                int v31 = v34 & 0x7F | (v31 << 14) & 0x1FC07F | ((v33 & 0x7F) << 7);
                uint64_t v32 = 3LL;
              }
            }

            else
            {
              int v31 = ((v31 & 0x7F) << 7) | v33;
              uint64_t v32 = 2LL;
            }
          }

          else
          {
            uint64_t v32 = 1LL;
          }

          v27 += v32 + v31;
          if (!*a5) {
            goto LABEL_28;
          }
LABEL_38:
          sub_1813BB8F8(a1, v25, ((_DWORD)v27 - (_DWORD)v25), &v37);
          goto LABEL_28;
        }
      }

      if (*a5) {
        goto LABEL_38;
      }
LABEL_28:
      ++a5;
      uint64_t v25 = v27;
      if (!--v26) {
        return v37;
      }
    }
  }

uint64_t sub_1813BB7D4(uint64_t result, unsigned int a2, _DWORD *a3)
{
  if (*a3) {
    return result;
  }
  uint64_t v4 = result;
  uint64_t v5 = *(int *)(result + 8);
  uint64_t v6 = *(int *)(result + 12);
  if (v5 + 9 > v6)
  {
    if ((_DWORD)v6) {
      uint64_t v8 = *(int *)(result + 12);
    }
    else {
      uint64_t v8 = 128LL;
    }
    do
    {
      uint64_t v9 = v8;
      v8 *= 2LL;
    }

    while (v8 < v5 + 9);
    if (v9 >= 1073741696)
    {
      uint64_t v8 = 2147483391LL;
    }

    uint64_t v10 = *(void *)result;
    uint64_t result = sqlite3_initialize();
    if (!(_DWORD)result)
    {
      uint64_t result = sub_18127D33C(v10, v8);
      if (result)
      {
        *(void *)uint64_t v4 = result;
        *(_DWORD *)(v4 + 12) = v8;
        if (*a3) {
          return result;
        }
        uint64_t v5 = *(int *)(v4 + 8);
        goto LABEL_13;
      }
    }

uint64_t sub_1813BB8F8(uint64_t result, void *__src, size_t __n, _DWORD *a4)
{
  if ((int)__n >= 1 && !*a4)
  {
    int v5 = __n;
    uint64_t v7 = result;
    size_t v8 = __n;
    uint64_t v9 = *(int *)(result + 8);
    uint64_t v10 = *(int *)(result + 12);
    uint64_t v11 = v9 + __n;
    if (v11 <= v10)
    {
      uint64_t result = *(void *)result;
LABEL_13:
      uint64_t result = (uint64_t)memcpy((void *)(result + v9), __src, v8);
      *(_DWORD *)(v7 + 8) += v5;
      return result;
    }

    if ((_DWORD)v10) {
      uint64_t v12 = *(int *)(result + 12);
    }
    else {
      uint64_t v12 = 128LL;
    }
    do
    {
      uint64_t v13 = v12;
      v12 *= 2LL;
    }

    while (v12 < v11);
    if (v13 >= 1073741696 && (uint64_t v12 = 2147483391LL, v11 > 2147483391)
      || (uint64_t v14 = *(void *)result, result = sqlite3_initialize(), (_DWORD)result)
      || (uint64_t result = sub_18127D33C(v14, v12)) == 0)
    {
      *a4 = 7;
      return result;
    }

    *(void *)uint64_t v7 = result;
    *(_DWORD *)(v7 + 12) = v12;
    if (!*a4)
    {
      uint64_t v9 = *(int *)(v7 + 8);
      goto LABEL_13;
    }
  }

  return result;
}

uint64_t sub_1813BB9F4(uint64_t result, char *__s, _DWORD *a3)
{
  uint64_t v5 = result;
  if (__s)
  {
    uint64_t result = strlen(__s);
    unsigned int v6 = result & 0x3FFFFFFF;
    if (*a3) {
      return result;
    }
  }

  else
  {
    unsigned int v6 = 0;
    if (*a3) {
      return result;
    }
  }

  uint64_t v7 = *(int *)(v5 + 8);
  uint64_t v8 = *(int *)(v5 + 12);
  uint64_t v9 = v7 + v6 + 1;
  if (v9 <= v8)
  {
    uint64_t result = *(void *)v5;
LABEL_15:
    uint64_t result = (uint64_t)memcpy((void *)(result + v7), __s, v6);
    unint64_t v13 = *(int *)(v5 + 8) + (unint64_t)v6;
    *(_DWORD *)(v5 + 8) = v13;
    *(_BYTE *)(*(void *)v5 + v13) = 0;
    return result;
  }

  if ((_DWORD)v8) {
    uint64_t v10 = *(int *)(v5 + 12);
  }
  else {
    uint64_t v10 = 128LL;
  }
  do
  {
    uint64_t v11 = v10;
    v10 *= 2LL;
  }

  while (v10 < v9);
  if (v11 >= 1073741696 && (uint64_t v10 = 2147483391LL, v9 > 2147483391)
    || (uint64_t v12 = *(void *)v5, result = sqlite3_initialize(), (_DWORD)result)
    || (uint64_t result = sub_18127D33C(v12, v10)) == 0)
  {
    *a3 = 7;
    return result;
  }

  *(void *)uint64_t v5 = result;
  *(_DWORD *)(v5 + 12) = v10;
  if (!*a3)
  {
    uint64_t v7 = *(int *)(v5 + 8);
    goto LABEL_15;
  }

  return result;
}

uint64_t sub_1813BBB08(uint64_t result, char *__s, _DWORD *a3)
{
  uint64_t v4 = __s;
  uint64_t v5 = result;
  if (__s)
  {
    uint64_t result = strlen(__s);
    uint64_t v6 = 2 * (result & 0x3FFFFFFF) + 4;
    if (*a3) {
      return result;
    }
  }

  else
  {
    uint64_t v6 = 4LL;
    if (*a3) {
      return result;
    }
  }

  uint64_t v7 = *(int *)(v5 + 8);
  uint64_t v8 = *(int *)(v5 + 12);
  uint64_t v9 = v6 + v7;
  if (v9 <= v8)
  {
    uint64_t result = *(void *)v5;
LABEL_15:
    unint64_t v13 = (_BYTE *)(result + v7);
    *(_BYTE *)(result + v7) = 34;
    while (1)
    {
      int v14 = *v4;
      if (v14 == 34)
      {
        v13[1] = 34;
        v13 += 2;
        LOBYTE(v14) = *v4;
      }

      else
      {
        if (!*v4)
        {
          v13[1] = 34;
          uint64_t v15 = *(void *)v5;
          uint64_t v16 = (uint64_t)&v13[-*(void *)v5 + 2];
          *(_DWORD *)(v5 + 8) = v16;
          *(_BYTE *)(v15 + (int)v16) = 0;
          return result;
        }

        ++v13;
      }

      ++v4;
      *unint64_t v13 = v14;
    }
  }

  if ((_DWORD)v8) {
    uint64_t v10 = *(int *)(v5 + 12);
  }
  else {
    uint64_t v10 = 128LL;
  }
  do
  {
    uint64_t v11 = v10;
    v10 *= 2LL;
  }

  while (v10 < v9);
  if (v11 >= 1073741696 && (uint64_t v10 = 2147483391LL, v9 > 2147483391)
    || (uint64_t v12 = *(void *)v5, result = sqlite3_initialize(), (_DWORD)result)
    || (uint64_t result = sub_18127D33C(v12, v10)) == 0)
  {
    *a3 = 7;
    return result;
  }

  *(void *)uint64_t v5 = result;
  *(_DWORD *)(v5 + 12) = v10;
  if (!*a3)
  {
    uint64_t v7 = *(int *)(v5 + 8);
    goto LABEL_15;
  }

  return result;
}

char *sub_1813BBC4C(char *result, _DWORD *a2, char *a3, ...)
{
  if (!*a2)
  {
    uint64_t v4 = (uint64_t)result;
    uint64_t result = sqlite3_vmprintf(a3, va);
    if (result)
    {
      uint64_t v5 = result;
      sub_1813BB9F4(v4, result, a2);
      uint64_t v6 = (uint64_t (**)(char *))&off_18C4653A8;
      if (!dword_18C465380) {
        return (char *)(*v6)(v5);
      }
      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8[0] -= (int)off_18C4653B8(v5);
      --qword_18C468B10;
      uint64_t result = (char *)off_18C4653A8(v5);
      uint64_t v5 = (char *)xmmword_18C468B70;
      if ((void)xmmword_18C468B70)
      {
        uint64_t v6 = (uint64_t (**)(char *))&xmmword_18C465410;
        return (char *)(*v6)(v5);
      }
    }

    else
    {
      *a2 = 7;
    }
  }

  return result;
}

uint64_t sub_1813BBD3C(uint64_t a1, int a2)
{
  if (*(void *)(a1 + 48) && !*(_DWORD *)(a1 + 64))
  {
    uint64_t result = 0LL;
    int v5 = *(_DWORD *)(a1 + 24);
    while (1)
    {
      uint64_t v8 = *(unsigned int *)(a1 + 8);
      int v10 = dword_18C54FB18;
      int v19 = dword_18C54FB18;
      if (*(_DWORD *)a1)
      {
        LODWORD(v11) = *(_DWORD *)(a1 + 40);
      }

      else
      {
        LODWORD(v11) = *(_DWORD *)(a1 + 40);
        if (*(void *)(a1 + 48)) {
          BOOL v12 = (int)v8 < dword_18C54FB18;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          size_t v11 = (v11 - v8);
          if ((int)v11 >= 1)
          {
            memmove(*(void **)(a1 + 32), (const void *)(*(void *)(a1 + 32) + v8), v11);
            LODWORD(v11) = *(_DWORD *)(a1 + 40) - *(_DWORD *)(a1 + 8);
            int v10 = v19;
          }

          *(_DWORD *)(a1 + 40) = v11;
          *(_DWORD *)(a1 + 8) = 0;
          *(_DWORD *)(a1 + 24) = v11;
        }
      }

      uint64_t v14 = (int)v11;
      uint64_t v15 = (int)v11 + (uint64_t)v10;
      uint64_t v16 = *(int *)(a1 + 44);
      if (v15 <= v16)
      {
        uint64_t v13 = *(void *)(a1 + 32);
      }

      else
      {
        if ((_DWORD)v16) {
          uint64_t v17 = *(int *)(a1 + 44);
        }
        else {
          uint64_t v17 = 128LL;
        }
        do
        {
          uint64_t v18 = v17;
          v17 *= 2LL;
        }

        while (v17 < v15);
        if (v18 >= 1073741696 && (uint64_t v17 = 2147483391LL, v15 > 2147483391)
          || (uint64_t v6 = *(void *)(a1 + 32), sqlite3_initialize())
          || (uint64_t v13 = sub_18127D33C(v6, v17)) == 0)
        {
          uint64_t result = 7LL;
          goto LABEL_8;
        }

        *(void *)(a1 + 32) = v13;
        *(_DWORD *)(a1 + 44) = v17;
        uint64_t v14 = *(int *)(a1 + 40);
      }

      uint64_t result = (*(uint64_t (**)(void, uint64_t, int *))(a1 + 48))(*(void *)(a1 + 56), v13 + v14, &v19);
      if (!v19)
      {
        *(_DWORD *)(a1 + 64) = 1;
        *(void *)(a1 + 16) = *(void *)(a1 + 32);
        *(_DWORD *)(a1 + 24) = *(_DWORD *)(a1 + 40);
        return result;
      }

      *(_DWORD *)(a1 + 40) += v19;
LABEL_8:
      int v7 = *(_DWORD *)(a1 + 64);
      *(void *)(a1 + 16) = *(void *)(a1 + 32);
      int v5 = *(_DWORD *)(a1 + 40);
      *(_DWORD *)(a1 + 24) = v5;
      if (v7) {
        return result;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1813BBF04(uint64_t a1, int a2, int *a3)
{
  if (a2 < 1)
  {
    int v6 = 0;
    uint64_t result = 0LL;
  }

  else
  {
    int v6 = 0;
    int v7 = 1;
    do
    {
      uint64_t result = sub_1813BBD3C(a1, v6 + 10);
      if ((_DWORD)result) {
        break;
      }
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(int *)(a1 + 8);
      uint64_t v11 = v6 + 1LL;
      int v12 = *(unsigned __int8 *)(v9 + v10 + v6);
      if ((v12 - 3) > 1)
      {
        uint64_t result = 0LL;
        else {
          v6 += 9;
        }
      }

      else
      {
        uint64_t v13 = (char *)(v9 + v10 + v11);
        int v14 = *v13;
        if ((v14 & 0x80) != 0)
        {
          int v16 = v13[1];
          if (v13[1] < 0)
          {
            int v17 = v13[2];
            if (v17 < 0)
            {
              int v15 = sub_18129BD74(v13, &v19);
              if (HIDWORD(v19)) {
                int v14 = -1;
              }
              else {
                int v14 = v19;
              }
            }

            else
            {
              int v14 = v17 & 0x7F | (v14 << 14) & 0x1FC07F | ((v16 & 0x7F) << 7);
              int v15 = 3;
            }
          }

          else
          {
            int v14 = ((v14 & 0x7F) << 7) | v16;
            int v15 = 2;
          }
        }

        else
        {
          int v15 = 1;
        }

        int v6 = v14 + v11 + v15;
        uint64_t result = sub_1813BBD3C(a1, v6);
        if ((_DWORD)result) {
          break;
        }
      }
    }

    while (v7++ < a2);
  }

  *a3 = v6;
  return result;
}

uint64_t sub_1813BC054(uint64_t a1, int a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  if (a5) {
    *a5 = 1;
  }
  if (a2 >= 1)
  {
    uint64_t v9 = 0LL;
    unint64_t v10 = a2;
    while (1)
    {
      if (a3 && !*(_BYTE *)(a3 + v9)) {
        goto LABEL_16;
      }
      uint64_t v11 = sub_1813BBD3C(a1, 9);
      if ((_DWORD)v11) {
        return v11;
      }
      uint64_t v12 = *(int *)(a1 + 8);
      uint64_t v13 = *(void *)(a1 + 16);
      *(_DWORD *)(a1 + 8) = v12 + 1;
      unsigned int v14 = *(unsigned __int8 *)(v13 + v12);
      if (!*(_BYTE *)(v13 + v12))
      {
LABEL_16:
        uint64_t v20 = 0LL;
        goto LABEL_42;
      }

      if (a5) {
        *a5 = 0;
      }
      uint64_t v15 = sub_18126F0AC(64LL);
      if (!v15)
      {
        *(void *)(a4 + 8 * v9) = 0LL;
        return 7LL;
      }

      *(_OWORD *)(v15 + 32) = 0u;
      *(_OWORD *)(v15 + 48) = 0u;
      *(_OWORD *)uint64_t v15 = 0u;
      *(_OWORD *)(v15 + 16) = 0u;
      *(void *)(v15 + 24) = 0LL;
      *(void *)(a4 + 8 * v9) = v15;
      *(_WORD *)(v15 + 20) = 1;
      uint64_t v16 = *(int *)(a1 + 8);
      int v17 = (unsigned __int8 *)(*(void *)(a1 + 16) + v16);
      if (v14 - 3 > 1)
      {
        uint64_t v20 = 0LL;
        if (v14 > 2) {
          goto LABEL_42;
        }
      }

      else
      {
        unsigned int v18 = *v17;
        if ((v18 & 0x80) != 0)
        {
          int v21 = v17[1];
          if ((char)v17[1] < 0)
          {
            int v22 = (char)v17[2];
            if (v22 < 0)
            {
              int v19 = sub_18129BD74((char *)(*(void *)(a1 + 16) + v16), &v33);
              if (HIDWORD(v33)) {
                unsigned int v18 = -1;
              }
              else {
                unsigned int v18 = v33;
              }
            }

            else
            {
              unsigned int v18 = v22 & 0x7F | (v18 << 14) & 0x1FC07F | ((v21 & 0x7F) << 7);
              int v19 = 3;
            }
          }

          else
          {
            unsigned int v18 = ((v18 & 0x7F) << 7) | v21;
            int v19 = 2;
          }
        }

        else
        {
          int v19 = 1;
        }

        *(_DWORD *)(a1 + 8) = v19 + v16;
        uint64_t v20 = sub_1813BBD3C(a1, v18);
        if ((_DWORD)v20)
        {
          if (v14 > 2) {
            goto LABEL_42;
          }
        }

        else if ((v18 & 0x80000000) != 0 || (uint64_t v26 = *(int *)(a1 + 8), (int)v18 > *(_DWORD *)(a1 + 24) - (int)v26))
        {
          uint64_t v20 = sub_1812FBF50(233722);
          if (v14 > 2) {
            goto LABEL_42;
          }
        }

        else
        {
          __s = *(char **)(a1 + 16);
          uint64_t v32 = *(void *)(a4 + 8 * v9);
          if (sqlite3_initialize() || (int v27 = (char *)sub_18126F0AC(v18 + 1LL)) == 0LL)
          {
            uint64_t v20 = 7LL;
          }

          else
          {
            int v28 = &__s[v26];
            __sa = v27;
            memcpy(v27, v28, v18);
            if (v32) {
              sub_181269368(v32, __sa, v18, v14 == 3, (uint64_t (*)(uint64_t))sqlite3_free);
            }
            uint64_t v20 = 0LL;
          }

          *(_DWORD *)(a1 + 8) += v18;
          if (v14 > 2) {
            goto LABEL_42;
          }
        }
      }

      if (*(_DWORD *)(a1 + 24) - *(_DWORD *)(a1 + 8) <= 7) {
        return sub_1812FBF50(233732);
      }
      uint64_t v23 = bswap64(*(void *)v17);
      if (v14 == 1)
      {
        uint64_t v24 = *(void *)(a4 + 8 * v9);
        if ((*(_WORD *)(v24 + 20) & 0x9000) != 0)
        {
          sub_1813040AC(v24, v23);
        }

        else
        {
          *(void *)uint64_t v24 = v23;
          *(_WORD *)(v24 + 20) = 4;
        }
      }

      else
      {
        uint64_t v25 = *(void *)(a4 + 8 * v9);
        if ((*(_WORD *)(v25 + 20) & 0x9000) != 0) {
          sub_181303888(*(int **)(a4 + 8 * v9));
        }
        else {
          *(_WORD *)(v25 + 20) = 1;
        }
        *(void *)uint64_t v25 = v23;
        *(_WORD *)(v25 + 20) = 8;
      }

      *(_DWORD *)(a1 + 8) += 8;
LABEL_42:
      if (++v9 >= v10 || (_DWORD)v20) {
        return v20;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1813BC3CC(uint64_t a1, _DWORD *a2)
{
  uint64_t result = sub_1813BBD3C(a1, 9);
  if ((_DWORD)result)
  {
    int v5 = 0;
    goto LABEL_3;
  }

  int v6 = (char *)(*(void *)(a1 + 16) + *(int *)(a1 + 8));
  unsigned int v7 = *v6;
  if ((v7 & 0x80) == 0)
  {
    int v5 = 1;
    goto LABEL_8;
  }

  int v8 = v6[1];
  if ((v6[1] & 0x80000000) == 0)
  {
    unsigned int v7 = ((v7 & 0x7F) << 7) | v8;
    int v5 = 2;
    goto LABEL_8;
  }

  int v12 = v6[2];
  if (v12 < 0)
  {
    int v5 = sub_18129BD74(v6, &v13);
    unsigned int v7 = v13;
    if (HIDWORD(v13))
    {
LABEL_20:
      uint64_t result = sub_1812FBF50(233780);
      goto LABEL_3;
    }
  }

  else
  {
    unsigned int v7 = v12 & 0x7F | (v7 << 14) & 0x1FC07F | ((v8 & 0x7F) << 7);
    int v5 = 3;
  }

  if (v7 > 0x10000) {
    goto LABEL_20;
  }
LABEL_8:
  v5 += v7;
LABEL_9:
  while (1)
  {
    uint64_t result = sub_1813BBD3C(a1, v5 + 100);
    if ((_DWORD)result) {
      break;
    }
    uint64_t v9 = *(int *)(a1 + 8);
    uint64_t v10 = *(int *)(a1 + 24);
    if ((int)v9 + v5 < (int)v10)
    {
      uint64_t v11 = v9 + v5;
      while (*(_BYTE *)(*(void *)(a1 + 16) + (int)v9 + v5))
      {
        ++v5;
        if (++v11 >= v10) {
          goto LABEL_9;
        }
      }

      uint64_t result = 0LL;
      break;
    }
  }

uint64_t sub_1813BC4F4(uint64_t result, sqlite3_value *a2, _DWORD *a3)
{
  if (!*a3)
  {
    uint64_t v5 = result;
    uint64_t v13 = 0LL;
    uint64_t result = sub_1813B9AF8(0LL, a2, &v13);
    if ((_DWORD)result)
    {
LABEL_3:
      *a3 = result;
      return result;
    }

    uint64_t v6 = *(int *)(v5 + 8);
    uint64_t v7 = *(int *)(v5 + 12);
    uint64_t v8 = v13 + v6;
    if (v13 + v6 <= v7)
    {
      uint64_t v12 = *(void *)v5;
    }

    else
    {
      if ((_DWORD)v7) {
        uint64_t v9 = *(int *)(v5 + 12);
      }
      else {
        uint64_t v9 = 128LL;
      }
      do
      {
        uint64_t v10 = v9;
        v9 *= 2LL;
      }

      while (v9 < v8);
      if (v10 >= 1073741696 && (uint64_t v9 = 2147483391LL, v8 > 2147483391)
        || (uint64_t v11 = *(void *)v5, sqlite3_initialize())
        || (uint64_t v12 = sub_18127D33C(v11, v9)) == 0)
      {
        uint64_t result = 7LL;
        goto LABEL_3;
      }

      *(void *)uint64_t v5 = v12;
      *(_DWORD *)(v5 + 12) = v9;
      uint64_t v6 = *(int *)(v5 + 8);
    }

    uint64_t result = sub_1813B9AF8(v12 + v6, a2, 0LL);
    *(_DWORD *)(v5 + 8) += v13;
  }

  return result;
}

uint64_t sub_1813BC5F8( sqlite3 *a1, int a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t, uint64_t, uint64_t), uint64_t a6)
{
  int v6 = *(_DWORD *)(a4 + 96);
  if (v6)
  {
    uint64_t v11 = (void *)(a4 + 88);
    uint64_t v12 = qword_18C467E20 + 480;
    while (1)
    {
      uint64_t v13 = *(void *)(a4 + 88);
      void *v11 = 0LL;
      v11[1] = 0LL;
      int v14 = *(_DWORD *)(a4 + 80);
      if (!sqlite3_initialize()) {
        break;
      }
      uint64_t v15 = 7LL;
      if (!v13) {
        goto LABEL_32;
      }
LABEL_26:
      uint64_t v26 = &off_18C4653A8;
      if (dword_18C465380)
      {
        uint64_t v27 = v12[366];
        if (v27) {
          xmmword_18C465400(v27);
        }
        qword_18C468AC8[0] -= (int)off_18C4653B8(v13);
        --qword_18C468B10;
        off_18C4653A8(v13);
        uint64_t v13 = v12[366];
        if (!v13) {
          goto LABEL_32;
        }
        uint64_t v26 = &xmmword_18C465410;
      }

      (*v26)(v13);
LABEL_32:
      if ((_DWORD)v15) {
        return v15;
      }
      int v28 = *(_DWORD *)(a4 + 96);
      if (v28 >= v6) {
        *(_DWORD *)(a4 + 76) = 0;
      }
      int v6 = v28;
      if (!v28) {
        return 0LL;
      }
    }

    uint64_t v16 = sub_18126F0AC(152LL);
    if (!v16)
    {
      uint64_t v15 = 7LL;
      goto LABEL_25;
    }

    uint64_t v17 = v16;
    *(_OWORD *)(v16 + 64) = 0u;
    *(_OWORD *)(v16 + 80) = 0u;
    *(void *)(v16 + 144) = 0LL;
    *(_OWORD *)(v16 + 112) = 0u;
    *(_OWORD *)(v16 + 128) = 0u;
    *(_OWORD *)(v16 + 96) = 0u;
    *(_OWORD *)(v16 + 32) = 0u;
    *(_OWORD *)(v16 + 48) = 0u;
    *(_OWORD *)uint64_t v16 = 0u;
    *(_OWORD *)(v16 + 16) = 0u;
    *(void *)(v16 + 16) = v13;
    *(_DWORD *)(v16 + 24) = v6;
    *(void *)(v16 + 48) = 0LL;
    *(void *)(v16 + 56) = 0LL;
    *(_DWORD *)(v16 + 64) = 1;
    *(_DWORD *)(v16 + 96) = 1;
    uint64_t v18 = *(int *)(a4 + 32);
    size_t v19 = 16 * v18;
    *(_DWORD *)(v16 + 88) = a2;
    *(_DWORD *)(v16 + 92) = v14;
    *(_DWORD *)(v16 + 120) = v18;
    *(void *)(v16 + 136) = *(void *)(a4 + 48);
    uint64_t v20 = *(int *)(v16 + 84);
    uint64_t v21 = 16 * v18 + *(int *)(v16 + 80);
    *(void *)(v16 + 112) = a3;
    if (v21 <= v20)
    {
      uint64_t v24 = *(void **)(v16 + 72);
    }

    else
    {
      if ((_DWORD)v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = 128LL;
      }
      do
      {
        uint64_t v23 = v22;
        v22 *= 2LL;
      }

      while (v22 < v21);
      if (v23 >= 1073741696 && (uint64_t v22 = 2147483391LL, v21 > 2147483391)
        || (uint64_t v30 = *(void *)(v16 + 72), sqlite3_initialize())
        || (uint64_t v24 = (void *)sub_18127D33C(v30, v22)) == 0LL)
      {
        *(void *)(v17 + 144) = *(void *)(v17 + 72);
        uint64_t v15 = 7LL;
LABEL_23:
        sqlite3changeset_finalize(v17);
LABEL_25:
        uint64_t v12 = &qword_18C467E20[60];
        if (!v13) {
          goto LABEL_32;
        }
        goto LABEL_26;
      }

      *(void *)(v17 + 72) = v24;
      *(_DWORD *)(v17 + 84) = v22;
    }

    *(void *)(v17 + 144) = v24;
    bzero(v24, v19);
    while (sub_1812EADB4(v17, 0LL, 0LL, 0LL) == 100)
    {
      uint64_t v25 = sub_1813BCFF4(a1, v17, a4, a5, a6);
      if ((_DWORD)v25)
      {
        uint64_t v15 = v25;
        goto LABEL_23;
      }
    }

    uint64_t v15 = sqlite3changeset_finalize(v17);
    goto LABEL_25;
  }

  return 0LL;
}

uint64_t sub_1813BC898(uint64_t result)
{
  uint64_t v1 = result;
  uint64_t v2 = *(void *)(result + 64);
  if (v2)
  {
    do
    {
      uint64_t v3 = *(void *)(v2 + 16);
      sqlite3_finalize(*(sqlite3_stmt **)v2);
      uint64_t v4 = &off_18C4653A8;
      if (dword_18C465380)
      {
        if ((void)xmmword_18C468B70) {
          xmmword_18C465400(xmmword_18C468B70);
        }
        qword_18C468AC8[0] -= (int)off_18C4653B8(v2);
        --qword_18C468B10;
        uint64_t result = off_18C4653A8(v2);
        uint64_t v2 = xmmword_18C468B70;
        if (!(void)xmmword_18C468B70) {
          goto LABEL_4;
        }
        uint64_t v4 = &xmmword_18C465410;
      }

      uint64_t result = (*v4)(v2);
LABEL_4:
      uint64_t v2 = v3;
    }

    while (v3);
  }

  *(void *)(v1 + 64) = 0LL;
  uint64_t v5 = *(void *)(v1 + 56);
  if (v5)
  {
    int v6 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_16:
      uint64_t result = (*v6)(v5);
      goto LABEL_17;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v5);
    --qword_18C468B10;
    uint64_t result = off_18C4653A8(v5);
    uint64_t v5 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      int v6 = &xmmword_18C465410;
      goto LABEL_16;
    }
  }

uint64_t sub_1813BC9E8(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_1813BA5F4( a1,  *(unsigned __int8 *)(a2 + 122),  (uint64_t)"main",  "sqlite_stat1",  *(_DWORD *)(a2 + 124),  *(_DWORD *)(a2 + 32),  *(void *)(a2 + 40),  *(void *)(a2 + 48),  (void *)(a2 + 24));
  if (!(_DWORD)result)
  {
    uint64_t result = sub_18126DFE0( a1,  "INSERT INTO main.sqlite_stat1 VALUES(?1, CASE WHEN length(?2)=0 AND typeof(?2)='blob' THEN NULL ELSE ?2 END, ?3)",  0xFFFFFFFFLL,  128LL,  0LL,  (void *)(a2 + 16),  0LL,  v5);
    if (!(_DWORD)result) {
      return sub_18126DFE0( a1,  "DELETE FROM main.sqlite_stat1 WHERE tbl=?1 AND idx IS CASE WHEN length(?2)=0 AND typeof(?2)='blob' THEN N ULL ELSE ?2 END AND (?4 OR stat IS ?3)",  0xFFFFFFFFLL,  128LL,  0LL,  (void *)(a2 + 8),  0LL,  v6);
    }
  }

  return result;
}

uint64_t sub_1813BCA98(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  unsigned int v20 = 0;
  uint64_t v18 = 0LL;
  uint64_t v19 = 0LL;
  sub_1813BB9F4((uint64_t)&v18, "DELETE FROM main.", &v20);
  sub_1813BBB08((uint64_t)&v18, a2, &v20);
  sub_1813BB9F4((uint64_t)&v18, " WHERE ", &v20);
  int v8 = *(_DWORD *)(a3 + 32);
  if (v8 >= 1)
  {
    uint64_t v9 = 0LL;
    int v10 = 0;
    uint64_t v6 = &byte_1813CEAEE;
    do
    {
      while (*(_BYTE *)(*(void *)(a3 + 48) + v9))
      {
        ++v10;
        sub_1813BB9F4((uint64_t)&v18, v6, &v20);
        sub_1813BBB08((uint64_t)&v18, *(char **)(*(void *)(a3 + 40) + 8 * v9), &v20);
        sub_1813BB9F4((uint64_t)&v18, " = ?", &v20);
        sqlite3_snprintf(23, __s, "%d", ++v9);
        sub_1813BB9F4((uint64_t)&v18, __s, &v20);
        int v8 = *(_DWORD *)(a3 + 32);
        uint64_t v6 = " AND ";
        if (v9 >= v8) {
          goto LABEL_6;
        }
      }

      ++v9;
    }

    while (v9 < v8);
LABEL_6:
    if (v10 < v8)
    {
      sub_1813BB9F4((uint64_t)&v18, " AND (?", &v20);
      sqlite3_snprintf(23, __s, "%d", *(_DWORD *)(a3 + 32) + 1);
      sub_1813BB9F4((uint64_t)&v18, __s, &v20);
      sub_1813BB9F4((uint64_t)&v18, " OR ", &v20);
      int v11 = *(_DWORD *)(a3 + 32);
      if (v11 >= 1)
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = &byte_1813CEAEE;
        do
        {
          while (!*(_BYTE *)(*(void *)(a3 + 48) + v12))
          {
            sub_1813BB9F4((uint64_t)&v18, v13, &v20);
            sub_1813BBB08((uint64_t)&v18, *(char **)(*(void *)(a3 + 40) + 8 * v12), &v20);
            sub_1813BB9F4((uint64_t)&v18, " IS ?", &v20);
            sqlite3_snprintf(23, __s, "%d", ++v12);
            sub_1813BB9F4((uint64_t)&v18, __s, &v20);
            int v11 = *(_DWORD *)(a3 + 32);
            uint64_t v13 = "AND ";
            if (v12 >= v11) {
              goto LABEL_14;
            }
          }

          ++v12;
        }

        while (v12 < v11);
      }

uint64_t sub_1813BCDF4(uint64_t a1, char *a2, uint64_t a3)
{
  unsigned int v15 = 0;
  uint64_t v13 = 0LL;
  uint64_t v14 = 0LL;
  sub_1813BB9F4((uint64_t)&v13, "INSERT INTO main.", &v15);
  sub_1813BBB08((uint64_t)&v13, a2, &v15);
  sub_1813BB9F4((uint64_t)&v13, "(", &v15);
  if (*(int *)(a3 + 32) >= 1)
  {
    sub_1813BBB08((uint64_t)&v13, **(char ***)(a3 + 40), &v15);
    if (*(int *)(a3 + 32) >= 2)
    {
      uint64_t v6 = 1LL;
      do
      {
        sub_1813BB9F4((uint64_t)&v13, ", ", &v15);
        sub_1813BBB08((uint64_t)&v13, *(char **)(*(void *)(a3 + 40) + 8 * v6++), &v15);
      }

      while (v6 < *(int *)(a3 + 32));
    }
  }

  sub_1813BB9F4((uint64_t)&v13, ") VALUES(?", &v15);
  if (*(int *)(a3 + 32) > 1)
  {
    int v7 = 1;
    do
    {
      sub_1813BB9F4((uint64_t)&v13, ", ?", &v15);
      ++v7;
    }

    while (v7 < *(_DWORD *)(a3 + 32));
  }

  sub_1813BB9F4((uint64_t)&v13, ")", &v15);
  uint64_t v9 = v15;
  int v10 = v13;
  if (v15)
  {
    if (!v13) {
      return v9;
    }
  }

  else
  {
    uint64_t v9 = sub_18126DFE0(a1, v13, v14, 128LL, 0LL, (void *)(a3 + 16), 0LL, v8);
    if (!v10) {
      return v9;
    }
  }

  int v11 = (void (**)(unsigned __int8 *))&off_18C4653A8;
  if (!dword_18C465380)
  {
LABEL_17:
    (*v11)(v10);
    return v9;
  }

  if ((void)xmmword_18C468B70) {
    xmmword_18C465400(xmmword_18C468B70);
  }
  qword_18C468AC8[0] -= (int)off_18C4653B8(v10);
  --qword_18C468B10;
  off_18C4653A8(v10);
  int v10 = (unsigned __int8 *)xmmword_18C468B70;
  if ((void)xmmword_18C468B70)
  {
    int v11 = (void (**)(unsigned __int8 *))&xmmword_18C465410;
    goto LABEL_17;
  }

  return v9;
}

uint64_t sub_1813BCFF4( sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5)
{
  uint64_t v21 = 0LL;
  uint64_t v10 = sub_1813BD210(a2, a3, a4, a5, (_DWORD *)&v21 + 1, &v21);
  if (!(_DWORD)v10)
  {
    if ((_DWORD)v21) {
      return sub_1813BD210(a2, a3, a4, a5, 0LL, 0LL);
    }
    if (!HIDWORD(v21)) {
      return 0LL;
    }
    uint64_t v10 = sqlite3_exec(a1, "SAVEPOINT replace_op", 0LL, 0LL, 0LL);
    if (!(_DWORD)v10)
    {
      unint64_t v13 = *(unsigned int *)(a3 + 32);
      if ((int)v13 >= 1)
      {
        uint64_t v14 = 0LL;
        uint64_t v15 = *(void *)(a3 + 48);
        uint64_t v16 = *(sqlite3_stmt **)(a3 + 8);
        while (1)
        {
          if (v15 && !*(_BYTE *)(v15 + v14))
          {
            uint64_t v10 = 0LL;
          }

          else
          {
            int v17 = *(_DWORD *)(a2 + 124);
            BOOL v18 = v17 == 23 || v17 == 18;
            if (!v18
              || (v14 & 0x80000000) != 0
              || (int v19 = *(_DWORD *)(a2 + 120), v19 <= (int)v14)
              || (uint64_t v20 = *(void *)(*(void *)(a2 + 144) + 8LL * ((int)v14 + v19))) == 0)
            {
              uint64_t v10 = sub_1812FBF50(234851);
              goto LABEL_30;
            }

            if (byte_1813C6455[*(_WORD *)(v20 + 20) & 0x3F] - 3 <= 1 && !*(void *)(v20 + 8))
            {
              uint64_t v10 = 7LL;
              goto LABEL_30;
            }

            uint64_t v10 = sqlite3_bind_value(v16, v14 + 1, (const sqlite3_value *)v20);
            if ((_DWORD)v10) {
              goto LABEL_30;
            }
          }

          if (++v14 >= v13) {
            goto LABEL_30;
          }
        }
      }

      uint64_t v10 = 0LL;
LABEL_30:
      sqlite3_bind_int64(*(sqlite3_stmt **)(a3 + 8), *(_DWORD *)(a3 + 32) + 1, 1LL);
      if (!(_DWORD)v10)
      {
        sqlite3_step(*(sqlite3_stmt **)(a3 + 8));
        uint64_t v10 = sqlite3_reset(*(sqlite3_stmt **)(a3 + 8));
        if (!(_DWORD)v10)
        {
          uint64_t v10 = sub_1813BD210(a2, a3, a4, a5, 0LL, 0LL);
          if (!(_DWORD)v10) {
            return sqlite3_exec(a1, "RELEASE replace_op", 0LL, 0LL, 0LL);
          }
        }
      }
    }
  }

  return v10;
}

uint64_t sub_1813BD210( uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t), uint64_t a4, _DWORD *a5, _DWORD *a6)
{
  uint64_t v6 = a6;
  uint64_t v8 = a3;
  uint64_t v118 = *MEMORY[0x1895F89C0];
  unint64_t v12 = *(unsigned int *)(a1 + 120);
  int v11 = *(_DWORD *)(a1 + 124);
  if (v11 == 23)
  {
    if (a6) {
      BOOL v14 = *(_DWORD *)(a1 + 88) != 0;
    }
    else {
      BOOL v14 = 1;
    }
    BOOL v113 = v14;
    int v38 = v12 + 33;
    int v39 = v38 >> 5;
    unsigned int v40 = *(void **)(a2 + 56);
    if (v40) {
      goto LABEL_59;
    }
    int v64 = sqlite3_initialize();
    if ((int)v12 < -1 || v64)
    {
      *(void *)(a2 + 56) = 0LL;
    }

    else
    {
      unsigned int v40 = (void *)sub_18126F0AC((4 * v39));
      *(void *)(a2 + 56) = v40;
      if (v40)
      {
LABEL_59:
        uint64_t v112 = a4;
        size_t v41 = 4LL * v39;
        bzero(v40, v41);
        int v42 = *(_DWORD *)(a1 + 120);
        if (v42 < 1) {
          return 11LL;
        }
        int v110 = v6;
        LODWORD(v43) = 0;
        char v44 = 0;
        uint64_t v45 = *(void *)(a1 + 144);
        uint64_t v17 = 11LL;
        while (1)
        {
          uint64_t v43 = (int)v43;
          uint64_t v46 = v42;
          uint64_t v47 = v45 + 8LL * v42;
          while (!*(void *)(v47 + 8 * v43))
          {
            if (++v43 >= v46)
            {
              unsigned int v116 = v17;
              if ((v44 & 1) == 0)
              {
                uint64_t v53 = 0LL;
                goto LABEL_163;
              }

uint64_t sub_1813BDEC0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t), uint64_t a5, _DWORD *a6)
{
  if (!a6)
  {
    int v54 = 0;
    goto LABEL_10;
  }

  uint64_t result = sub_1813BE3B0(a3, a2);
  int v54 = result;
  if (!(_DWORD)result)
  {
LABEL_10:
    if ((_DWORD)a1 == 3 && *(_DWORD *)(a2 + 76))
    {
      sub_1813BB8F8( a2 + 88,  (void *)(*(void *)(a3 + 16) + *(int *)(a3 + 4)),  (*(_DWORD *)(a3 + 8) - *(_DWORD *)(a3 + 4)),  &v54);
      return 0LL;
    }

    int v17 = a4(a5, (a1 + 1), a3);
    if (v17 == 1) {
      return 21LL;
    }
    goto LABEL_21;
  }

  if ((_DWORD)result == 100)
  {
    if (!*(_BYTE *)(a2 + 122)) {
      goto LABEL_19;
    }
    uint64_t v13 = *(unsigned __int16 **)(a2 + 24);
    if (v13)
    {
      uint64_t v14 = *(void *)(*(void *)v13 + 24LL);
      if (v14)
      {
        xmmword_18C465400(v14);
        uint64_t v15 = *(void *)(*(void *)v13 + 24LL);
        int v16 = v13[130];
        if (v15) {
          xmmword_18C465410(v15);
        }
      }

      else
      {
        int v16 = v13[130];
      }
    }

    else
    {
      int v16 = 0;
    }

    if (sqlite3_column_int((sqlite3_stmt *)v13, v16 - 1))
    {
      int v17 = 0;
    }

    else
    {
LABEL_19:
      *(void *)(a3 + 104) = *(void *)(a2 + 24);
      int v17 = a4(a5, a1, a3);
      *(void *)(a3 + 104) = 0LL;
    }

    uint64_t result = sqlite3_reset(*(sqlite3_stmt **)(a2 + 24));
    int v54 = result;
    if (!(_DWORD)result)
    {
LABEL_21:
      switch(v17)
      {
        case 0:
          goto LABEL_25;
        case 2:
          return 4LL;
        case 1:
          *a6 = 1;
LABEL_25:
          unsigned int v55 = 0;
          if (!*(_BYTE *)(a2 + 121)) {
            return 0LL;
          }
          int v18 = *(_DWORD *)(a3 + 124);
          int v19 = *(_DWORD *)(a2 + 112);
          uint64_t v20 = v19;
          if (*(_BYTE *)(a2 + 120))
          {
            uint64_t v21 = (uint64_t *)(a2 + 104);
            BOOL v22 = v18 == 9;
            if (v18 == 9) {
              char v23 = 9;
            }
            else {
              char v23 = 18;
            }
            goto LABEL_30;
          }

          uint64_t v34 = *(char **)(a3 + 112);
          uint64_t v21 = (uint64_t *)(a2 + 104);
          int v35 = *(_DWORD *)(a2 + 116);
          if (v19 < v35)
          {
            uint64_t v36 = *v21;
LABEL_50:
            *(_DWORD *)(a2 + 112) = v19 + 1;
            *(_BYTE *)(v36 + v20) = 84;
LABEL_69:
            sub_1813BB7D4(a2 + 104, *(_DWORD *)(a2 + 32), &v55);
            sub_1813BB8F8(a2 + 104, *(void **)(a2 + 48), *(unsigned int *)(a2 + 32), &v55);
            int v43 = strlen(v34);
            sub_1813BB8F8(a2 + 104, v34, (v43 + 1), &v55);
            *(_BYTE *)(a2 + 120) = 1;
            uint64_t result = v55;
            BOOL v22 = v18 == 9;
            if (v18 == 9) {
              char v23 = 9;
            }
            else {
              char v23 = 18;
            }
            if (v55) {
              goto LABEL_73;
            }
            int v19 = *(_DWORD *)(a2 + 112);
            uint64_t v20 = v19;
LABEL_30:
            int v24 = *(_DWORD *)(a2 + 116);
            if (v19 >= v24)
            {
              if (!v24) {
                int v24 = 128;
              }
              uint64_t v31 = v24;
              do
              {
                uint64_t v32 = v31;
                v31 *= 2LL;
              }

              while (v31 <= v20);
              if (v32 > 1073741695)
              {
                if (v19 > 2147483390) {
                  goto LABEL_59;
                }
                uint64_t v31 = 2147483391LL;
              }

              uint64_t v33 = *v21;
              if (sqlite3_initialize()) {
                goto LABEL_59;
              }
              uint64_t v25 = sub_18127D33C(v33, v31);
              if (!v25) {
                goto LABEL_59;
              }
              *(void *)(a2 + 104) = v25;
              *(_DWORD *)(a2 + 116) = v31;
              int v19 = *(_DWORD *)(a2 + 112);
              uint64_t v20 = v19;
            }

            else
            {
              uint64_t v25 = *v21;
            }

            *(_DWORD *)(a2 + 112) = v19 + 1;
            *(_BYTE *)(v25 + v20) = v23;
            BOOL v26 = v17 == 1;
            int v28 = *(_DWORD *)(a2 + 112);
            int v27 = *(_DWORD *)(a2 + 116);
            uint64_t v29 = v28;
            if (v28 < v27)
            {
              uint64_t v30 = *v21;
LABEL_34:
              uint64_t result = 0LL;
              *(_DWORD *)(a2 + 112) = v28 + 1;
              *(_BYTE *)(v30 + v29) = v26;
LABEL_73:
              uint64_t v44 = 0LL;
              uint64_t v45 = 0LL;
              while (1)
              {
                if (v22 || v18 == 23 && *(_BYTE *)(*(void *)(a2 + 48) + v45))
                {
                  int v47 = *(_DWORD *)(a3 + 124);
                  BOOL v48 = v47 == 23 || v47 == 9;
                  if (v48 && v45 < *(int *)(a3 + 120))
                  {
                    uint64_t v49 = (sqlite3_value **)(*(void *)(a3 + 144) + v44);
LABEL_94:
                    uint64_t v46 = *v49;
                    goto LABEL_76;
                  }
                }

                else
                {
                  int v50 = *(_DWORD *)(a3 + 124);
                  if (v50 == 23 || v50 == 18)
                  {
                    uint64_t v52 = *(int *)(a3 + 120);
                    if (v45 < v52)
                    {
                      uint64_t v49 = (sqlite3_value **)(*(void *)(a3 + 144) + 8LL * ((int)v45 + (int)v52));
                      goto LABEL_94;
                    }
                  }
                }

                uint64_t v46 = 0LL;
LABEL_76:
                sub_1813BC4F4((uint64_t)v21, v46, &v55);
                ++v45;
                v44 += 8LL;
              }
            }

            if (!v27) {
              int v27 = 128;
            }
            uint64_t v37 = v27;
            do
            {
              uint64_t v38 = v37;
              v37 *= 2LL;
            }

            while (v37 <= v28);
            if (v38 > 1073741695)
            {
              if (v28 > 2147483390) {
                goto LABEL_59;
              }
              uint64_t v37 = 2147483391LL;
            }

            uint64_t v39 = *v21;
            if (!sqlite3_initialize())
            {
              uint64_t v53 = sub_18127D33C(v39, v37);
              if (v53)
              {
                uint64_t v30 = v53;
                *(void *)(a2 + 104) = v53;
                *(_DWORD *)(a2 + 116) = v37;
                int v28 = *(_DWORD *)(a2 + 112);
                uint64_t v29 = v28;
                goto LABEL_34;
              }
            }

uint64_t sub_1813BE3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(sqlite3_stmt **)(a2 + 24);
  if (v4)
  {
    uint64_t v5 = *(void *)(*(void *)v4 + 24LL);
    if (v5) {
      xmmword_18C465400(*(void *)(*(void *)v4 + 24LL));
    }
    int v6 = *((_DWORD *)v4 + 8);
    if (v6 >= 1)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = 0LL;
      uint64_t v9 = *((void *)v4 + 16);
      do
      {
        uint64_t v10 = v9 + v7;
        if ((*(_WORD *)(v9 + v7 + 20) & 0x9000) != 0 || *(_DWORD *)(v10 + 32))
        {
          sub_181303838(v10);
          uint64_t v9 = *((void *)v4 + 16);
          int v6 = *((_DWORD *)v4 + 8);
        }

        *(_WORD *)(v9 + v7 + 20) = 1;
        ++v8;
        v7 += 64LL;
      }

      while (v8 < v6);
    }

    if (*((_DWORD *)v4 + 93)) {
      *((_WORD *)v4 + 134) = *((_WORD *)v4 + 134) & 0xFFFC | 1;
    }
    if (v5) {
      xmmword_18C465410(v5);
    }
  }

  unint64_t v12 = *(unsigned int *)(a1 + 120);
  int v11 = *(_DWORD *)(a1 + 124);
  if (v11 == 18) {
    uint64_t v13 = (void (*)(uint64_t, uint64_t, sqlite3_value **))sqlite3changeset_new;
  }
  else {
    uint64_t v13 = (void (*)(uint64_t, uint64_t, sqlite3_value **))sqlite3changeset_old;
  }
  if ((int)v12 < 1)
  {
    uint64_t result = 0LL;
    if (v11 == 9) {
      goto LABEL_55;
    }
    goto LABEL_34;
  }

  uint64_t v14 = 0LL;
  uint64_t v15 = *(void *)(a2 + 48);
  while (1)
  {
    if (v15 && !*(_BYTE *)(v15 + v14))
    {
      uint64_t result = 0LL;
      goto LABEL_21;
    }

    BOOL v22 = 0LL;
    v13(a1, v14, &v22);
    if (v22) {
      break;
    }
    uint64_t result = sub_1812FBF50(234851);
    if ((_DWORD)result) {
      goto LABEL_31;
    }
LABEL_21:
    if (++v14 >= v12) {
      goto LABEL_31;
    }
  }

  if (byte_1813C6455[*((_WORD *)v22 + 10) & 0x3F] - 3 > 1 || *((void *)v22 + 1))
  {
    uint64_t result = sqlite3_bind_value(v4, v14 + 1, v22);
    if ((_DWORD)result) {
      goto LABEL_31;
    }
    goto LABEL_21;
  }

  uint64_t result = 7LL;
LABEL_31:
  if (v11 != 9)
  {
LABEL_34:
    if (!(_DWORD)result && *(_BYTE *)(a2 + 122) && (int)v12 >= 1)
    {
      uint64_t v17 = 0LL;
      do
      {
        if (*(_BYTE *)(*(void *)(a2 + 48) + v17))
        {
          uint64_t result = 0LL;
          ++v17;
        }

        else
        {
          int v18 = *(_DWORD *)(a1 + 124);
          BOOL v19 = v18 == 23 || v18 == 18;
          else {
            uint64_t v21 = 0LL;
          }
          sqlite3_bind_int64(v4, v12 + ++v17, v21 == 0);
          if (v21)
          {
            uint64_t result = sqlite3_bind_value(v4, v17, (const sqlite3_value *)v21);
            if ((_DWORD)result) {
              break;
            }
          }

          else
          {
            uint64_t result = 0LL;
          }
        }
      }

      while (v17 < (uint64_t)v12);
    }
  }

uint64_t sub_1813BE67C(uint64_t a1, int a2, char *__s1, int a4, char *__s2)
{
  uint64_t v5 = *(unsigned int *)(a1 + 16);
  uint64_t v10 = *(unsigned __int8 **)(a1 + 40);
  while (!*v10++)
  {
    if (a2)
    {
      if (!a4) {
        goto LABEL_25;
      }
      goto LABEL_5;
    }

    int v16 = *__s1;
    int v17 = 1;
    if (*__s1) {
      BOOL v18 = v16 == 5;
    }
    else {
      BOOL v18 = 1;
    }
    if (v18 || v16 == 255) {
      goto LABEL_24;
    }
    if ((v16 - 1) < 2)
    {
      int v17 = 9;
LABEL_24:
      __s1 += v17;
      if (!a4) {
        goto LABEL_25;
      }
      goto LABEL_5;
    }

    int v25 = __s1[1];
    if ((v25 & 0x80) != 0)
    {
      int v29 = __s1[2];
      if (__s1[2] < 0)
      {
        int v40 = __s1[3];
        if (v40 < 0)
        {
          char v42 = sub_18129BD74(__s1 + 1, &v44);
          if (HIDWORD(v44)) {
            int v25 = -1;
          }
          else {
            int v25 = v44;
          }
          int v26 = (v42 + 1);
        }

        else
        {
          int v25 = v40 & 0x7F | (v25 << 14) & 0x1FC07F | ((v29 & 0x7F) << 7);
          int v26 = 4;
        }
      }

      else
      {
        int v25 = ((v25 & 0x7F) << 7) | v29;
        int v26 = 3;
      }
    }

    else
    {
      int v26 = 2;
    }

    __s1 += v26 + v25;
    if (!a4)
    {
LABEL_25:
      int v19 = *__s2;
      int v11 = 1;
      if (*__s2 && v19 != 5 && v19 != 255)
      {
        if ((v19 - 1) < 2)
        {
          int v11 = 9;
        }

        else
        {
          int v20 = __s2[1];
          if ((v20 & 0x80) != 0)
          {
            int v28 = __s2[2];
            if (__s2[2] < 0)
            {
              int v39 = __s2[3];
              if (v39 < 0)
              {
                char v41 = sub_18129BD74(__s2 + 1, &v44);
                if (HIDWORD(v44)) {
                  int v20 = -1;
                }
                else {
                  int v20 = v44;
                }
                int v21 = (v41 + 1);
              }

              else
              {
                int v20 = v39 & 0x7F | (v20 << 14) & 0x1FC07F | ((v28 & 0x7F) << 7);
                int v21 = 4;
              }
            }

            else
            {
              int v20 = ((v20 & 0x7F) << 7) | v28;
              int v21 = 3;
            }
          }

          else
          {
            int v21 = 2;
          }

          int v11 = v21 + v20;
        }
      }

      __s2 += v11;
    }

void **sub_1813BE9E0(void **result, int a2, char *__src, char *a4)
{
  uint64_t v4 = result;
  uint64_t v5 = (char *)*result;
  if (a2 >= 1)
  {
    int v8 = a2;
    while (1)
    {
      int v12 = *__src;
      LODWORD(v11) = 1;
      if (*__src) {
        BOOL v13 = v12 == 5;
      }
      else {
        BOOL v13 = 1;
      }
      if (v13 || v12 == 255) {
        goto LABEL_13;
      }
      int v17 = __src[1];
      if ((v17 & 0x80) != 0)
      {
        int v20 = __src[2];
        if (__src[2] < 0)
        {
          int v22 = __src[3];
          if (v22 < 0)
          {
            char v24 = sub_18129BD74(__src + 1, &v25);
            if (HIDWORD(v25)) {
              int v17 = -1;
            }
            else {
              int v17 = v25;
            }
            int v18 = (v24 + 1);
          }

          else
          {
            int v17 = v22 & 0x7F | (v17 << 14) & 0x1FC07F | ((v20 & 0x7F) << 7);
            int v18 = 4;
          }
        }

        else
        {
          int v17 = ((v17 & 0x7F) << 7) | v20;
          int v18 = 3;
        }
      }

      else
      {
        int v18 = 2;
      }

      LODWORD(v11) = v18 + v17;
      int v14 = *a4;
      if (*a4)
      {
LABEL_14:
        int v9 = 1;
        if (v14 != 5 && v14 != 255)
        {
          if ((v14 - 1) < 2)
          {
            int v9 = 9;
          }

          else
          {
            int v15 = a4[1];
            if ((v15 & 0x80) != 0)
            {
              int v19 = a4[2];
              if (a4[2] < 0)
              {
                int v21 = a4[3];
                if (v21 < 0)
                {
                  char v23 = sub_18129BD74(a4 + 1, &v25);
                  if (HIDWORD(v25)) {
                    int v15 = -1;
                  }
                  else {
                    int v15 = v25;
                  }
                  int v16 = (v23 + 1);
                }

                else
                {
                  int v15 = v21 & 0x7F | (v15 << 14) & 0x1FC07F | ((v19 & 0x7F) << 7);
                  int v16 = 4;
                }
              }

              else
              {
                int v15 = ((v15 & 0x7F) << 7) | v19;
                int v16 = 3;
              }
            }

            else
            {
              int v16 = 2;
            }

            int v9 = v16 + v15;
          }
        }

        uint64_t v10 = v9;
        uint64_t result = (void **)memcpy(v5, a4, v9);
        uint64_t v11 = (int)v11;
        goto LABEL_5;
      }

uint64_t sub_1813BEBE4(_BYTE **a1, uint64_t a2, int a3, char *a4, char *a5, char *a6, uint64_t a7)
{
  BOOL v33 = a5;
  int v34 = a4;
  *(void *)&__n[1] = a7;
  int v32 = a6;
  int v12 = *a1;
  LODWORD(v13) = *(_DWORD *)(a2 + 16);
  if (a3) {
    goto LABEL_2;
  }
  uint64_t v28 = a7;
  uint64_t v22 = 0LL;
  int v23 = 0;
  do
  {
    char v24 = sub_1813BEDB8(&v34, &v33, __n);
    unint64_t v25 = sub_1813BEDB8(&v32, (char **)&__n[1], &v30);
    size_t v26 = __n[0];
    if (*(_BYTE *)(*(void *)(a2 + 40) + v22)) {
      goto LABEL_19;
    }
    if (__n[0] != v30 || memcmp(v24, v25, __n[0]))
    {
      int v23 = 1;
LABEL_19:
      memcpy(v12, v24, v26);
      v12 += v26;
      goto LABEL_20;
    }

    *v12++ = 0;
LABEL_20:
    ++v22;
    uint64_t v13 = *(int *)(a2 + 16);
  }

  while (v22 < v13);
  a7 = v28;
  if (!v23) {
    return 0LL;
  }
LABEL_2:
  BOOL v33 = a5;
  int v34 = a4;
  *(void *)&__n[1] = a7;
  int v32 = a6;
  if ((int)v13 >= 1)
  {
    uint64_t v14 = 0LL;
    int v15 = a1;
    while (1)
    {
      int v16 = sub_1813BEDB8(&v34, &v33, __n);
      int v17 = sub_1813BEDB8(&v32, (char **)&__n[1], &v30);
      if (a3) {
        break;
      }
      if (!*(_BYTE *)(*(void *)(a2 + 40) + v14))
      {
        int v18 = v30;
        int v20 = __n[0];
        if (__n[0] != v30) {
          goto LABEL_9;
        }
        int v21 = memcmp(v16, v17, __n[0]);
        int v18 = v20;
        if (v21) {
          goto LABEL_9;
        }
      }

      *v12++ = 0;
LABEL_6:
    }

    int v18 = v30;
LABEL_9:
    uint64_t v19 = v18;
    memcpy(v12, v17, v18);
    v12 += v19;
    goto LABEL_6;
  }

  int v15 = a1;
LABEL_24:
  *int v15 = v12;
  return 1LL;
}

char *sub_1813BEDB8(char **a1, char **a2, int *a3)
{
  uint64_t v5 = *a1;
  int v6 = *a2;
  if (*a2)
  {
    int v8 = *v6;
    int v9 = 1;
    if (*v6)
    {
      uint64_t v10 = *a2;
      if (v8 != 5 && v8 != 255)
      {
        if ((v8 - 1) >= 2)
        {
          int v11 = v6[1];
          if ((v11 & 0x80) != 0)
          {
            int v13 = v6[2];
            if (v6[2] < 0)
            {
              int v14 = v6[3];
              if (v14 < 0)
              {
                char v15 = sub_18129BD74(v6 + 1, &v25);
                if (HIDWORD(v25)) {
                  int v11 = -1;
                }
                else {
                  int v11 = v25;
                }
                int v12 = (v15 + 1);
              }

              else
              {
                int v11 = v14 & 0x7F | (v11 << 14) & 0x1FC07F | ((v13 & 0x7F) << 7);
                int v12 = 4;
              }
            }

            else
            {
              int v11 = ((v11 & 0x7F) << 7) | v13;
              int v12 = 3;
            }
          }

          else
          {
            int v12 = 2;
          }

          int v9 = v12 + v11;
        }

        else
        {
          int v9 = 9;
        }
      }

      *a3 = v9;
    }

    else
    {
      uint64_t v10 = 0LL;
    }

    *a2 = &v6[v9];
  }

  else
  {
    uint64_t v10 = 0LL;
  }

  int v16 = *v5;
  int v17 = 1;
  if (*v5) {
    BOOL v18 = v16 == 5;
  }
  else {
    BOOL v18 = 1;
  }
  if (!v18 && v16 != 255)
  {
    if ((v16 - 1) >= 2)
    {
      int v20 = v5[1];
      if ((v20 & 0x80) != 0)
      {
        int v22 = v5[2];
        if (v5[2] < 0)
        {
          int v23 = v5[3];
          if (v23 < 0)
          {
            char v24 = sub_18129BD74(v5 + 1, &v25);
            if (HIDWORD(v25)) {
              int v20 = -1;
            }
            else {
              int v20 = v25;
            }
            int v21 = (v24 + 1);
          }

          else
          {
            int v20 = v23 & 0x7F | (v20 << 14) & 0x1FC07F | ((v22 & 0x7F) << 7);
            int v21 = 4;
          }
        }

        else
        {
          int v20 = ((v20 & 0x7F) << 7) | v22;
          int v21 = 3;
        }
      }

      else
      {
        int v21 = 2;
      }

      int v17 = v21 + v20;
      if (!v10) {
        goto LABEL_30;
      }
      goto LABEL_31;
    }

    int v17 = 9;
  }

  if (!v10)
  {
LABEL_30:
    *a3 = v17;
    uint64_t v10 = v5;
  }

uint64_t sub_1813BEF8C(uint64_t result, int a2, char *__src, int a4, char *a5, int a6, _DWORD *a7)
{
  if (!*a7)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(int *)(result + 12);
    uint64_t v12 = *(int *)(result + 8) + (uint64_t)(a6 + a4);
    if (v12 <= v11) {
      goto LABEL_13;
    }
    if ((_DWORD)v11) {
      uint64_t v14 = *(int *)(result + 12);
    }
    else {
      uint64_t v14 = 128LL;
    }
    do
    {
      uint64_t v15 = v14;
      v14 *= 2LL;
    }

    while (v14 < v12);
    if (v15 >= 1073741696 && (uint64_t v14 = 2147483391LL, v12 > 2147483391)
      || (uint64_t v16 = *(void *)result, result = sqlite3_initialize(), (_DWORD)result)
      || (uint64_t result = sub_18127D33C(v16, v14)) == 0)
    {
      *a7 = 7;
      return result;
    }

    *(void *)uint64_t v10 = result;
    *(_DWORD *)(v10 + 12) = v14;
    if (!*a7)
    {
LABEL_13:
      uint64_t v17 = *(void *)v10;
      BOOL v18 = (char *)(*(void *)v10 + *(int *)(v10 + 8));
      if (a2 >= 1)
      {
        do
        {
          int v21 = *__src;
          LODWORD(v23) = 1;
          if (*__src) {
            BOOL v22 = v21 == 5;
          }
          else {
            BOOL v22 = 1;
          }
          if (!v22 && v21 != 255)
          {
            if ((v21 - 1) >= 2)
            {
              int v26 = __src[1];
              if ((v26 & 0x80) != 0)
              {
                int v28 = __src[2];
                if (__src[2] < 0)
                {
                  int v29 = __src[3];
                  if (v29 < 0)
                  {
                    char v30 = sub_18129BD74(__src + 1, &v38);
                    if (HIDWORD(v38)) {
                      int v26 = -1;
                    }
                    else {
                      int v26 = v38;
                    }
                    int v27 = (v30 + 1);
                  }

                  else
                  {
                    int v26 = v29 & 0x7F | (v26 << 14) & 0x1FC07F | ((v28 & 0x7F) << 7);
                    int v27 = 4;
                  }
                }

                else
                {
                  int v26 = ((v26 & 0x7F) << 7) | v28;
                  int v27 = 3;
                }
              }

              else
              {
                int v27 = 2;
              }

              LODWORD(v23) = v27 + v26;
            }

            else
            {
              LODWORD(v23) = 9;
            }
          }

          int v31 = *a5;
          int v19 = 1;
          if (*a5) {
            BOOL v32 = v31 == 5;
          }
          else {
            BOOL v32 = 1;
          }
          if (!v32 && v31 != 255)
          {
            if ((v31 - 1) < 2)
            {
              int v19 = 9;
            }

            else
            {
              int v33 = a5[1];
              if ((v33 & 0x80) != 0)
              {
                int v35 = a5[2];
                if (a5[2] < 0)
                {
                  int v36 = a5[3];
                  if (v36 < 0)
                  {
                    char v37 = sub_18129BD74(a5 + 1, &v38);
                    if (HIDWORD(v38)) {
                      int v33 = -1;
                    }
                    else {
                      int v33 = v38;
                    }
                    int v34 = (v37 + 1);
                  }

                  else
                  {
                    int v33 = v36 & 0x7F | (v33 << 14) & 0x1FC07F | ((v35 & 0x7F) << 7);
                    int v34 = 4;
                  }
                }

                else
                {
                  int v33 = ((v33 & 0x7F) << 7) | v35;
                  int v34 = 3;
                }
              }

              else
              {
                int v34 = 2;
              }

              int v19 = v34 + v33;
            }
          }

          if (v21 == 255 || v21 == 0)
          {
            uint64_t v24 = v19;
            uint64_t result = (uint64_t)memcpy(v18, a5, v19);
            uint64_t v23 = (int)v23;
            uint64_t v25 = v19;
          }

          else
          {
            uint64_t v23 = (int)v23;
            uint64_t result = (uint64_t)memcpy(v18, __src, (int)v23);
            uint64_t v24 = v19;
            uint64_t v25 = (int)v23;
          }

          v18 += v25;
          __src += v23;
          a5 += v24;
          --a2;
        }

        while (a2);
        uint64_t v17 = *(void *)v10;
      }

      *(_DWORD *)(v10 + 8) = (_DWORD)v18 - v17;
    }
  }

  return result;
}

uint64_t sub_1813BF23C(sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result = sqlite3_declare_vtab(a1, "CREATE TABLE x(value,pointer hidden,count hidden,ctype hidden)");
  if (!(_DWORD)result)
  {
    if (sqlite3_initialize())
    {
      *a5 = 0LL;
      return 7LL;
    }

    uint64_t v7 = sub_18126F0AC(24LL);
    *a5 = v7;
    if (!v7) {
      return 7LL;
    }
    int v8 = (void *)v7;
    uint64_t result = 0LL;
    *int v8 = 0LL;
    v8[1] = 0LL;
    v8[2] = 0LL;
  }

  return result;
}

uint64_t sub_1813BF29C(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = 0;
  uint64_t v3 = *(void *)(a2 + 8) + 5LL;
  unsigned int v4 = -1;
  unsigned int v5 = -1;
  unsigned int v6 = -1;
  uint64_t v7 = (unsigned __int8 *)v3;
  do
  {
    int v8 = *v7;
    v7 += 12;
    if (v8 && *(_BYTE *)(v3 - 1) == 2)
    {
      int v9 = *(_DWORD *)(v3 - 5);
      if (v9 == 1) {
        unsigned int v10 = v2;
      }
      else {
        unsigned int v10 = v6;
      }
      if (v9 == 2)
      {
        unsigned int v10 = v6;
        unsigned int v11 = v2;
      }

      else
      {
        unsigned int v11 = v5;
      }

      if (v9 == 3)
      {
        unsigned int v4 = v2;
      }

      else
      {
        unsigned int v6 = v10;
        unsigned int v5 = v11;
      }
    }

    ++v2;
    uint64_t v3 = (uint64_t)v7;
  }

  while (*(_DWORD *)a2 != v2);
  if ((v6 & 0x80000000) != 0)
  {
LABEL_19:
    *(void *)(a2 + 64) = 0x41DFFFFFFFC00000LL;
    *(void *)(a2 + 72) = 0x7FFFFFFFLL;
    *(_DWORD *)(a2 + 40) = 0;
  }

  else
  {
    uint64_t v12 = *(void *)(a2 + 32);
    uint64_t v13 = v12 + 8LL * v6;
    *(_DWORD *)uint64_t v13 = 1;
    *(_BYTE *)(v13 + 4) = 1;
    *(void *)(a2 + 64) = 0x3FF0000000000000LL;
    *(void *)(a2 + 72) = 100LL;
    *(_DWORD *)(a2 + 40) = 1;
    if ((v5 & 0x80000000) == 0)
    {
      uint64_t v14 = v12 + 8LL * v5;
      *(_DWORD *)uint64_t v14 = 2;
      *(_BYTE *)(v14 + 4) = 1;
      *(_DWORD *)(a2 + 40) = 2;
      if ((v4 & 0x80000000) == 0)
      {
        uint64_t v15 = v12 + 8LL * v4;
        *(_DWORD *)uint64_t v15 = 3;
        *(_BYTE *)(v15 + 4) = 1;
        *(_DWORD *)(a2 + 40) = 3;
        return 0LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1813BF398(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    unsigned int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      unsigned int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

double sub_1813BF444(uint64_t a1, uint64_t *a2)
{
  if (!sqlite3_initialize())
  {
    uint64_t v4 = sub_18126F0AC(40LL);
    if (v4)
    {
      *(void *)(v4 + 32) = 0LL;
      double result = 0.0;
      *(_OWORD *)uint64_t v4 = 0u;
      *(_OWORD *)(v4 + 16) = 0u;
      *a2 = v4;
    }
  }

  return result;
}

uint64_t sub_1813BF494(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = a1;
    unsigned int v2 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v2)(v1);
      return 0LL;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v1);
    --qword_18C468B10;
    off_18C4653A8(v1);
    uint64_t v1 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      unsigned int v2 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

  return 0LL;
}

uint64_t sub_1813BF540(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  *(void *)(a1 + 16) = 0LL;
  *(void *)(a1 + 24) = 0LL;
  int v8 = (void *)(a1 + 16);
  if (a2 - 2 >= 2)
  {
    if (a2 == 1)
    {
      uint64_t v14 = *a5;
      if (*a5)
      {
        if ((*(_WORD *)(v14 + 20) & 0xFBF) == 0xA01
          && *(_BYTE *)(v14 + 23) == 112
          && !strcmp(*(const char **)v14, "carray-bind"))
        {
          uint64_t v15 = *(void *)(v14 + 8);
          if (v15)
          {
            uint64_t v16 = *(int *)(v15 + 8);
            *(void *)(a1 + 16) = *(void *)v15;
            *(void *)(a1 + 24) = v16;
            char v17 = *(_BYTE *)(v15 + 12) & 7;
            goto LABEL_71;
          }
        }
      }

      else
      {
        sub_1812CF36C(97118);
      }
    }

    goto LABEL_72;
  }

  uint64_t v9 = *a5;
  if (!*a5)
  {
    sub_1812CF36C(97118);
LABEL_18:
    uint64_t v13 = 0LL;
    *int v8 = 0LL;
    goto LABEL_19;
  }

  uint64_t v10 = *(void *)(v9 + 8);
  *int v8 = v10;
  if (!v10)
  {
LABEL_54:
    uint64_t v13 = 0LL;
    goto LABEL_19;
  }

  uint64_t v11 = a5[1];
  if (!v11)
  {
    sub_1812CF36C(89717);
    uint64_t v13 = 0LL;
    goto LABEL_19;
  }

  __int16 v12 = *(_WORD *)(v11 + 20);
  if ((v12 & 0x24) != 0)
  {
    uint64_t v13 = *(void *)v11;
    goto LABEL_19;
  }

  if ((v12 & 8) == 0)
  {
    if ((v12 & 0x12) != 0 && *(void *)(v11 + 8))
    {
      uint64_t v13 = sub_181303DF0(v11);
      goto LABEL_19;
    }

    goto LABEL_54;
  }

  double v33 = *(double *)v11;
  if (*(double *)v11 >= -9.22337204e18)
  {
    if (v33 <= 9.22337204e18) {
      uint64_t v13 = (uint64_t)v33;
    }
    else {
      uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  else
  {
    uint64_t v13 = 0x8000000000000000LL;
  }

uint64_t sub_1813BF8D4(uint64_t a1)
{
  return 0LL;
}

BOOL sub_1813BF8E8(uint64_t a1)
{
  return *(void *)(a1 + 8) > *(void *)(a1 + 24);
}

uint64_t sub_1813BF8FC(uint64_t a1, int **a2, int a3)
{
  if (a3 != 1)
  {
    if (a3 != 3)
    {
      if (a3 == 2)
      {
        uint64_t v3 = *(void *)(a1 + 24);
        if (a2)
        {
LABEL_5:
          uint64_t v4 = (uint64_t)*a2;
          if (((*a2)[5] & 0x9000) != 0)
          {
            sub_1813040AC(v4, v3);
          }

          else
          {
            *(void *)uint64_t v4 = v3;
            *(_WORD *)(v4 + 20) = 4;
          }

          return 0LL;
        }

uint64_t sub_1813BFAF0(uint64_t a1, void *a2)
{
  *a2 = *(void *)(a1 + 8);
  return 0LL;
}

uint64_t sub_1813BFB04( sqlite3 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = (uint64_t *)a6;
  uint64_t v151 = *MEMORY[0x1895F89C0];
  memset(v146, 0, sizeof(v146));
  __int128 v147 = 0u;
  __int128 v148 = 0u;
  memset(v149, 0, sizeof(v149));
  uint64_t v150 = 0LL;
  uint64_t v143 = 0LL;
  int v144 = 0LL;
  int v145 = 0LL;
  if ((int)a3 < 4)
  {
LABEL_101:
    sub_1813C0F08( (uint64_t)v146,  "must specify either filename= or data= but not both",  a3,  a4,  (uint64_t)a5,  a6,  a7,  a8,  v138);
    unsigned int v81 = 0;
    goto LABEL_121;
  }

  uint64_t v10 = a3;
  int v142 = -99;
  uint64_t v11 = 0xFFFFFFFFLL;
  uint64_t v12 = MEMORY[0x1895F8770];
  for (uint64_t i = 3LL; i != v10; ++i)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(const char **)(a4 + 8 * i);
    uint64_t v16 = sub_1813C0F70("filename", 8, v15);
    if (v16)
    {
      uint64_t v23 = 0LL;
      uint64_t v24 = "filename";
      goto LABEL_9;
    }

    uint64_t v16 = sub_1813C0F70("data", 4, v15);
    if (v16)
    {
      uint64_t v23 = 1LL;
      uint64_t v24 = "data";
      goto LABEL_9;
    }

    uint64_t v16 = sub_1813C0F70("schema", 6, v15);
    if (v16)
    {
      uint64_t v24 = "schema";
      uint64_t v23 = 2LL;
LABEL_9:
      LOBYTE(v149[0]) = 0;
      if ((&v143)[v23])
      {
        char v138 = (char)v24;
        uint64_t v25 = "more than one '%s' parameter";
      }

      else
      {
        uint64_t v26 = sqlite3_mprintf("%s", (const char *)v16);
        (&v143)[v23] = v26;
        if (v26)
        {
          int v27 = v26;
          for (size_t j = strlen(v26); j; --j)
          {
            uint64_t v29 = v27[j];
            if (v27[j] < 0)
            {
              if (!__maskrune(v29, 0x4000uLL)) {
                break;
              }
            }

            else if ((*(_DWORD *)(v12 + 4 * v29 + 60) & 0x4000) == 0)
            {
              break;
            }
          }

          v27[j] = 0;
          int v30 = *(unsigned __int8 *)v27;
          if (v30 == 39 || v30 == 34)
          {
            size_t v31 = strlen(v27);
            if (v31 >= 2)
            {
              unint64_t v32 = v31 - 1;
              if (v27[v31 - 1] == v30)
              {
                if (v32 < 2)
                {
                  uint64_t v51 = 0LL;
                }

                else
                {
                  uint64_t v33 = 0LL;
                  for (unint64_t k = 1LL; k < v32; ++k)
                  {
                    int v36 = v27[k];
                    if (v36 == v30)
                    {
                      LOBYTE(v36) = v27[k];
                    }

                    unsigned int v35 = v33 + 1;
                    v27[v33++] = v36;
                  }

                  uint64_t v51 = v35;
                }

                v27[v51] = 0;
              }
            }
          }

LABEL_190:
  uint64_t v128 = 0LL;
  *(void *)(v90 + 24) = v80;
  *(void *)(v90 + 32) = v79;
  uint64_t v143 = 0LL;
  int v144 = 0LL;
  if ((_DWORD)v11 == 1)
  {
    if (v79)
    {
      uint64_t v128 = SDWORD2(v147);
    }

    else
    {
      int v129 = MEMORY[0x186E0A2D8](*(void *)&v146[0]);
      uint64_t v128 = v129 - (int)v148 + DWORD2(v147);
    }
  }

  *(void *)(v90 + 40) = v128;
  sub_1813C165C((uint64_t)v146);
  int v130 = sqlite3_declare_vtab(a1, v91);
  if (v130)
  {
    unsigned int v81 = v130;
    sqlite3_errmsg(a1);
    sub_1813C0F08((uint64_t)v146, "bad schema: '%s' - %s", v131, v132, v133, v134, v135, v136, (char)v91);
    goto LABEL_204;
  }

  uint64_t v137 = (void (**)(const char *))&off_18C4653A8;
  if (dword_18C465380)
  {
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v91);
    --qword_18C468B10;
    off_18C4653A8(v91);
    int v91 = (const char *)xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v137 = (void (**)(const char *))&xmmword_18C465410;
      goto LABEL_201;
    }
  }

  else
  {
LABEL_201:
    (*v137)(v91);
  }

  sqlite3_vtab_config(a1, 3);
  return 0LL;
}

uint64_t sub_1813C0718(uint64_t a1, uint64_t a2)
{
  *(void *)(a2 + 64) = 0x412E848000000000LL;
  return 0LL;
}

uint64_t sub_1813C072C(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2)
  {
    uint64_t v3 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v3)(v2);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v3 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

uint64_t sub_1813C08BC(uint64_t a1, void *a2)
{
  int v4 = *(_DWORD *)(a1 + 48);
  if (sqlite3_initialize()) {
    return 7LL;
  }
  uint64_t v6 = 12LL * v4 + 296;
  uint64_t v7 = (char *)sub_18126F0AC(v6);
  if (!v7) {
    return 7LL;
  }
  int v8 = v7;
  bzero(v7, v6);
  uint64_t v9 = (uint64_t)&v8[8 * *(int *)(a1 + 48) + 296];
  *((void *)v8 + 34) = v8 + 296;
  *((void *)v8 + 35) = v9;
  *a2 = v8;
  uint64_t result = sub_1813C1074((FILE **)v8 + 1, *(const char **)(a1 + 24), *(FILE **)(a1 + 32));
  if ((_DWORD)result)
  {
    uint64_t v10 = *(void *)(a1 + 16);
    if (v10)
    {
      uint64_t v11 = &off_18C4653A8;
      if (dword_18C465380)
      {
        if ((void)xmmword_18C468B70) {
          xmmword_18C465400(xmmword_18C468B70);
        }
        qword_18C468AC8[0] -= (int)off_18C4653B8(v10);
        --qword_18C468B10;
        off_18C4653A8(v10);
        uint64_t v10 = xmmword_18C468B70;
        if (!(void)xmmword_18C468B70) {
          goto LABEL_13;
        }
        uint64_t v11 = &xmmword_18C465410;
      }

      (*v11)(v10);
    }

uint64_t sub_1813C09F4(uint64_t *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = *a1;
  if (*(int *)(*a1 + 48) >= 1)
  {
    for (uint64_t i = 0LL; i < *(int *)(v2 + 48); ++i)
    {
      uint64_t v4 = *(void *)(v1[34] + 8 * i);
      if (v4)
      {
        unsigned int v5 = &off_18C4653A8;
        if (dword_18C465380)
        {
          if ((void)xmmword_18C468B70) {
            xmmword_18C465400(xmmword_18C468B70);
          }
          qword_18C468AC8[0] -= (int)off_18C4653B8(v4);
          --qword_18C468B10;
          off_18C4653A8(v4);
          uint64_t v4 = xmmword_18C468B70;
          if (!(void)xmmword_18C468B70) {
            goto LABEL_4;
          }
          unsigned int v5 = &xmmword_18C465410;
        }

        (*v5)(v4);
      }

uint64_t sub_1813C0B68( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)a1;
  *(void *)(a1 + 288) = 0LL;
  uint64_t v10 = (FILE **)(a1 + 8);
  uint64_t v11 = *(int *)(a1 + 24);
  if ((int)v11 >= *(_DWORD *)(a1 + 28) - 1)
  {
  }

  else
  {
    uint64_t v12 = *(void *)(a1 + 16);
    *(_DWORD *)(a1 + 24) = v11 + 1;
    *(_BYTE *)(v12 + v11) = 0;
  }

  uint64_t v14 = *(void *)(v9 + 40);
  if (*v10)
  {
    fseek(*v10, v14, 0);
    uint64_t v14 = 0LL;
    *(void *)(a1 + 56) = 0LL;
  }

  *(void *)(a1 + 48) = v14;
  sub_1813C0C04((uint64_t *)a1, v14, a3, a4, a5, a6, a7, a8);
  return 0LL;
}

uint64_t sub_1813C0C04( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9 = 0;
  uint64_t v10 = (uint64_t)(a1 + 1);
  uint64_t v11 = *a1;
  while (1)
  {
    uint64_t v13 = sub_1813C11BC(v10, a2, a3, a4, a5, a6, a7, a8);
    if (!v13)
    {
      if (v9) {
        goto LABEL_19;
      }
      a1[36] = -1LL;
      return 0LL;
    }

    if (v9 < *(_DWORD *)(v11 + 48)) {
      break;
    }
LABEL_4:
    if (*((_DWORD *)a1 + 10) != 44) {
      goto LABEL_19;
    }
  }

  uint64_t v14 = (const void *)v13;
  int v12 = *((_DWORD *)a1 + 6);
  if (*(_DWORD *)(a1[35] + 4LL * v9) > v12)
  {
LABEL_3:
    memcpy(*(void **)(a1[34] + 8LL * v9++), v14, v12 + 1);
    goto LABEL_4;
  }

  uint64_t v15 = *(void *)(a1[34] + 8LL * v9);
  if (!sqlite3_initialize())
  {
    uint64_t v22 = sub_18127D33C(v15, v12 + 1LL);
    if (v22)
    {
      *(void *)(a1[34] + 8LL * v9) = v22;
      *(_DWORD *)(a1[35] + 4LL * v9) = *((_DWORD *)a1 + 6) + 1;
      int v12 = *((_DWORD *)a1 + 6);
      goto LABEL_3;
    }
  }

  sub_1813C0F08(v10, "out of memory", v16, v17, v18, v19, v20, v21, v29);
  uint64_t v23 = *(void *)(v11 + 16);
  if (v23)
  {
    uint64_t v24 = &off_18C4653A8;
    if (!dword_18C465380) {
      goto LABEL_16;
    }
    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8[0] -= (int)off_18C4653B8(v23);
    --qword_18C468B10;
    off_18C4653A8(v23);
    uint64_t v23 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      uint64_t v24 = &xmmword_18C465410;
LABEL_16:
      (*v24)(v23);
    }
  }

  *(void *)(v11 + 16) = sqlite3_mprintf("%s", (const char *)a1 + 72);
LABEL_19:
  ++a1[36];
  if (v9 < *(_DWORD *)(v11 + 48))
  {
    for (uint64_t i = v9; i < *(int *)(v11 + 48); ++i)
    {
      uint64_t v26 = *(void *)(a1[34] + 8 * i);
      if (v26)
      {
        int v27 = &off_18C4653A8;
        if (dword_18C465380)
        {
          if ((void)xmmword_18C468B70) {
            xmmword_18C465400(xmmword_18C468B70);
          }
          qword_18C468AC8[0] -= (int)off_18C4653B8(v26);
          --qword_18C468B10;
          off_18C4653A8(v26);
          uint64_t v26 = xmmword_18C468B70;
          if (!(void)xmmword_18C468B70) {
            goto LABEL_22;
          }
          int v27 = &xmmword_18C465410;
        }

        (*v27)(v26);
      }

uint64_t sub_1813C0E8C(uint64_t a1)
{
  return *(void *)(a1 + 288) >> 63;
}

uint64_t sub_1813C0E98(void *a1, uint64_t a2, unsigned int a3)
{
  if ((a3 & 0x80000000) == 0 && *(_DWORD *)(*a1 + 48LL) > (signed int)a3)
  {
    uint64_t v3 = *(char **)(a1[34] + 8LL * a3);
    if (v3)
    {
      if (a2) {
        sub_1812D7A8C(a2, v3, -1, 1u, (uint64_t (*)(uint64_t))0xFFFFFFFFFFFFFFFFLL);
      }
      else {
        sub_1812CF36C(97498);
      }
    }
  }

  return 0LL;
}

uint64_t sub_1813C0EF8(uint64_t a1, void *a2)
{
  *a2 = *(void *)(a1 + 288);
  return 0LL;
}

void sub_1813C0F08( uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9 = (_BYTE *)(a1 + 64);
  if (a2)
  {
    v10[0] = 0LL;
    v10[1] = a1 + 64;
    int v11 = 200;
    uint64_t v12 = 0LL;
    __int16 v13 = 0;
    sqlite3_str_vappendf((sqlite3_str *)v10, a2, &a9);
    v9 += HIDWORD(v12);
  }

  else
  {
    sub_1812CF36C(32992);
  }

  *int v9 = 0;
}

unsigned __int8 *sub_1813C0F70(const char *a1, int a2, const char *a3)
{
  uint64_t v6 = MEMORY[0x1895F8770];
  do
  {
    while (1)
    {
      uint64_t v7 = *(unsigned __int8 *)a3;
      if ((*a3 & 0x80000000) == 0) {
        break;
      }
      ++a3;
      if (!__maskrune(v7, 0x4000uLL)) {
        goto LABEL_5;
      }
    }

    ++a3;
  }

  while ((*(_DWORD *)(v6 + 4 * v7 + 60) & 0x4000) != 0);
  if (strncmp(a1, a3 - 1, a2)) {
    return 0LL;
  }
LABEL_5:
  int v8 = (unsigned __int8 *)&a3[a2 - 2];
  do
  {
    while (1)
    {
      uint64_t v9 = v8[1];
      ++v8;
      if (!__maskrune(v9, 0x4000uLL)) {
        goto LABEL_10;
      }
    }

    ++v8;
  }

  while ((*(_DWORD *)(v6 + 4 * v9 + 60) & 0x4000) != 0);
LABEL_10:
  if (*v8 != 61) {
    return 0LL;
  }
  do
  {
    while (1)
    {
      uint64_t v11 = v8[1];
      ++v8;
      if (!__maskrune(v11, 0x4000uLL)) {
        return v8;
      }
    }

    ++v8;
  }

  while ((*(_DWORD *)(v6 + 4 * v11 + 60) & 0x4000) != 0);
  return v8;
}

uint64_t sub_1813C1074(FILE **a1, const char *a2, FILE *__s)
{
  if (!a2)
  {
    a1[7] = __s;
    size_t v12 = strlen((const char *)__s);
    uint64_t result = 0LL;
    a1[6] = (FILE *)v12;
    return result;
  }

  if (sqlite3_initialize())
  {
    a1[7] = 0LL;
LABEL_4:
    sub_1813C0F08((uint64_t)a1, "out of memory", v5, v6, v7, v8, v9, v10, v23);
    return 1LL;
  }

  uint64_t v13 = sub_18126F0AC(1024LL);
  a1[7] = (FILE *)v13;
  if (!v13) {
    goto LABEL_4;
  }
  uint64_t v14 = fopen(a2, "rb");
  *a1 = v14;
  if (!v14)
  {
    uint64_t v15 = a1[7];
    if (v15)
    {
      uint64_t v16 = (uint64_t (**)(FILE *))&off_18C4653A8;
      if (dword_18C465380)
      {
        if ((void)xmmword_18C468B70) {
          xmmword_18C465400(xmmword_18C468B70);
        }
        qword_18C468AC8[0] -= (int)off_18C4653B8(v15);
        --qword_18C468B10;
        off_18C4653A8(v15);
        uint64_t v15 = (FILE *)xmmword_18C468B70;
        if (!(void)xmmword_18C468B70) {
          goto LABEL_17;
        }
        uint64_t v16 = (uint64_t (**)(FILE *))&xmmword_18C465410;
      }

      (*v16)(v15);
    }

uint64_t sub_1813C11BC( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  while (1)
  {
    *(_DWORD *)(a1 + 16) = 0;
    unint64_t v9 = *(void *)(a1 + 40);
    if (v9 >= *(void *)(a1 + 48)) {
      break;
    }
    uint64_t v10 = *(void *)(a1 + 56);
    *(void *)(a1 + 40) = v9 + 1;
    int v11 = *(unsigned __int8 *)(v10 + v9);
    if (v11 == 34) {
      goto LABEL_27;
    }
LABEL_6:
    if (v11 == -1)
    {
LABEL_26:
      uint64_t result = 0LL;
      *(_DWORD *)(a1 + 32) = -1;
      return result;
    }

    if (v11 != 239 || *(_DWORD *)(a1 + 28))
    {
      while (1)
      {
LABEL_75:
        if (v11 <= 44)
        {
          switch(v11)
          {
            case -1:
              goto LABEL_88;
            case 10:
              ++*(_DWORD *)(a1 + 24);
              int v41 = *(_DWORD *)(a1 + 16);
              BOOL v42 = __OFSUB__(v41, 1);
              int v43 = v41 - 1;
LABEL_88:
              *(_DWORD *)(a1 + 32) = v11;
              goto LABEL_89;
            case 44:
              goto LABEL_88;
          }
        }

        uint64_t v38 = *(int *)(a1 + 16);
        if ((int)v38 >= *(_DWORD *)(a1 + 20) - 1)
        {
        }

        else
        {
          uint64_t v39 = *(void *)(a1 + 8);
          *(_DWORD *)(a1 + 16) = v38 + 1;
          *(_BYTE *)(v39 + v38) = v11;
        }

        unint64_t v40 = *(void *)(a1 + 40);
        if (v40 < *(void *)(a1 + 48))
        {
          uint64_t v37 = *(void *)(a1 + 56);
          *(void *)(a1 + 40) = v40 + 1;
          int v11 = *(unsigned __int8 *)(v37 + v40);
        }

        else
        {
          int v11 = -1;
          if (*(void *)a1) {
            int v11 = sub_1813C17B0(a1);
          }
        }
      }
    }

    uint64_t v12 = *(int *)(a1 + 16);
    if ((int)v12 >= *(_DWORD *)(a1 + 20) - 1)
    {
      sub_1813C17FC(a1, v11);
    }

    else
    {
      uint64_t v13 = *(void *)(a1 + 8);
      *(_DWORD *)(a1 + 16) = v12 + 1;
      *(_BYTE *)(v13 + v12) = v11;
    }

    unint64_t v14 = *(void *)(a1 + 40);
    if (v14 >= *(void *)(a1 + 48))
    {
      if (!*(void *)a1) {
        goto LABEL_73;
      }
      int v11 = sub_1813C17B0(a1);
    }

    else
    {
      uint64_t v15 = *(void *)(a1 + 56);
      *(void *)(a1 + 40) = v14 + 1;
      int v11 = *(unsigned __int8 *)(v15 + v14);
    }

    uint64_t v16 = *(int *)(a1 + 16);
    if ((int)v16 >= *(_DWORD *)(a1 + 20) - 1)
    {
      sub_1813C17FC(a1, v11);
    }

    else
    {
      uint64_t v17 = *(void *)(a1 + 8);
      *(_DWORD *)(a1 + 16) = v16 + 1;
      *(_BYTE *)(v17 + v16) = v11;
    }

    unint64_t v18 = *(void *)(a1 + 40);
    if (v18 >= *(void *)(a1 + 48))
    {
      if (!*(void *)a1)
      {
LABEL_73:
        int v11 = -1;
        goto LABEL_75;
      }

      int v11 = sub_1813C17B0(a1);
    }

    else
    {
      uint64_t v19 = *(void *)(a1 + 56);
      *(void *)(a1 + 40) = v18 + 1;
      int v11 = *(unsigned __int8 *)(v19 + v18);
    }

    *(_DWORD *)(a1 + 28) = 1;
    *(_DWORD *)(a1 + 16) = 0;
  }

  if (!*(void *)a1) {
    goto LABEL_26;
  }
  int v11 = sub_1813C17B0(a1);
  if (v11 != 34) {
    goto LABEL_6;
  }
LABEL_27:
  int v21 = 0;
  int v22 = 0;
  int v23 = *(_DWORD *)(a1 + 24);
  while (1)
  {
    unint64_t v25 = *(void *)(a1 + 40);
    if (v25 >= *(void *)(a1 + 48))
    {
      if (!*(void *)a1) {
        goto LABEL_50;
      }
      int v27 = sub_1813C17B0(a1);
    }

    else
    {
      uint64_t v26 = *(void *)(a1 + 56);
      *(void *)(a1 + 40) = v25 + 1;
      int v27 = *(unsigned __int8 *)(v26 + v25);
    }

    BOOL v28 = v21 == 34;
    if (v21 != 34 && v27 > 34)
    {
      int v22 = v21;
      int v21 = v27;
      goto LABEL_70;
    }

    if (v27 == 10) {
      goto LABEL_37;
    }
    char v29 = 0;
    if (v21 == 34 && v27 == 34)
    {
      unint64_t v30 = *(void *)(a1 + 40);
      if (v30 >= *(void *)(a1 + 48))
      {
        if (!*(void *)a1)
        {
          int v21 = 0;
LABEL_50:
          char v29 = 0;
          BOOL v28 = v21 == 34;
          int v27 = -1;
          goto LABEL_51;
        }

        int v21 = sub_1813C17B0(a1);
        if (v21 > 34)
        {
LABEL_47:
          int v22 = 0;
          goto LABEL_70;
        }
      }

      else
      {
        uint64_t v31 = *(void *)(a1 + 56);
        *(void *)(a1 + 40) = v30 + 1;
        int v21 = *(unsigned __int8 *)(v31 + v30);
      }

      BOOL v28 = 0;
      if (v21 != 10)
      {
        int v22 = 0;
        if (v21 == -1) {
          goto LABEL_98;
        }
        goto LABEL_70;
      }

      int v21 = 0;
LABEL_37:
      ++*(_DWORD *)(a1 + 24);
      char v29 = 1;
      int v27 = 10;
    }

double sub_1813C165C(uint64_t a1)
{
  uint64_t v2 = *(FILE **)a1;
  if (v2)
  {
    fclose(v2);
    uint64_t v3 = *(void *)(a1 + 56);
    if (v3)
    {
      uint64_t v4 = &off_18C4653A8;
      if (!dword_18C465380)
      {
LABEL_8:
        (*v4)(v3);
        goto LABEL_9;
      }

      if ((void)xmmword_18C468B70) {
        xmmword_18C465400(xmmword_18C468B70);
      }
      qword_18C468AC8[0] -= (int)off_18C4653B8(v3);
      --qword_18C468B10;
      off_18C4653A8(v3);
      uint64_t v3 = xmmword_18C468B70;
      if ((void)xmmword_18C468B70)
      {
        uint64_t v4 = &xmmword_18C465410;
        goto LABEL_8;
      }
    }
  }

uint64_t sub_1813C17B0(uint64_t a1)
{
  size_t v2 = fread(*(void **)(a1 + 56), 1uLL, 0x400uLL, *(FILE **)a1);
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  *(void *)(a1 + 40) = 1LL;
  *(void *)(a1 + 48) = v2;
  return **(char **)(a1 + 56);
}

uint64_t sub_1813C17FC(uint64_t a1, char a2)
{
  uint64_t v4 = *(int *)(a1 + 20);
  uint64_t v5 = *(void *)(a1 + 8);
  if (sqlite3_initialize() || (uint64_t v13 = 2 * v4 + 100, (v14 = sub_18127D33C(v5, v13)) == 0))
  {
    sub_1813C0F08(a1, "out of memory", v6, v7, v8, v9, v10, v11, v17);
    return 1LL;
  }

  else
  {
    uint64_t v15 = v14;
    uint64_t result = 0LL;
    *(void *)(a1 + 8) = v15;
    uint64_t v16 = *(int *)(a1 + 16);
    *(_DWORD *)(a1 + 16) = v16 + 1;
    *(_DWORD *)(a1 + 20) = v13;
    *(_BYTE *)(v15 + v16) = a2;
  }

  return result;
}

int8x16_t *sub_1813C1880(uint64_t a1, int8x16_t *a2, int a3, int a4)
{
  char v4 = a4;
  *(void *)&v80[12] = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    if (*(_BYTE *)(a1 + 68)) {
      return a2;
    }
    if (*(void *)(a1 + 96)) {
      goto LABEL_8;
    }
LABEL_11:
    if (*(_BYTE *)(a1 + 70)) {
      return 0LL;
    }
    uint64_t v61 = (3 * *(_DWORD *)(a1 + 76));
    int v62 = sqlite3_initialize();
    if ((int)v61 >= 1 && v62 == 0)
    {
      uint64_t v64 = sub_18126F0AC(v61);
      *(void *)(a1 + 96) = v64;
      if (v64)
      {
        size_t v65 = *(unsigned int *)(a1 + 76);
        *(void *)(a1 + 104) = v64 + v65;
        int v66 = (void *)(v64 + v65 + v65);
        *(void *)(a1 + 88) = v66;
        bzero(v66, v65);
        goto LABEL_8;
      }
    }

    else
    {
      *(void *)(a1 + 96) = 0LL;
    }

    a2 = 0LL;
    *(_BYTE *)(a1 + 70) = 1;
    return a2;
  }

  if (*(_BYTE *)(a1 + 34LL * (a4 & 1) + 1))
  {
    *(_BYTE *)(a1 + 68) = 1;
    return a2;
  }

  *(_BYTE *)(a1 + 68) = 0;
  if (!*(void *)(a1 + 96)) {
    goto LABEL_11;
  }
LABEL_8:
  int iv = a3;
  size_t v8 = *(unsigned __int8 *)(a1 + 69);
  if (*(_BYTE *)(a1 + 69))
  {
    if ((v4 & 4) != 0)
    {
      sqlite3_initialize();
      arc4random_buf(v80, v8);
      memcpy(&a2->i8[*(unsigned int *)(a1 + 80)], v80, *(unsigned __int8 *)(a1 + 69));
    }

    else
    {
      __memcpy_chk();
    }
  }

  uint64_t v9 = *(int *)(a1 + 72);
  dataOut = *(int8x16_t **)(a1 + 96);
  if ((v4 & 2) != 0)
  {
    uint64_t v11 = (unsigned __int8 *)(a1 + 34LL * (v4 & 1));
    int v13 = *v11;
    uint64_t v12 = v11 + 2;
    if (v13 == 32) {
      size_t v14 = 32LL;
    }
    else {
      size_t v14 = 16LL;
    }
    CCCrypt( 0,  0,  0,  v12,  v14,  &iv,  *(const void **)(a1 + 88),  *(unsigned int *)(a1 + 76),  dataOut,  *(unsigned int *)(a1 + 76),  0LL);
    dataOut = *(int8x16_t **)(a1 + 96);
  }

  uint64_t v15 = a2;
  if ((v4 & 4) != 0) {
    uint64_t v15 = *(int8x16_t **)(a1 + 104);
  }
  unsigned int v16 = *(_DWORD *)(a1 + 80);
  if ((int)v16 < 9)
  {
    char v17 = (uint64_t *)dataOut;
    unint64_t v18 = (uint64_t *)a2;
    uint64_t v19 = (uint64_t *)v15;
    int v20 = *(_DWORD *)(a1 + 80);
  }

  else
  {
    char v17 = (uint64_t *)dataOut;
    unint64_t v18 = (uint64_t *)a2;
    uint64_t v19 = (uint64_t *)v15;
    int v20 = *(_DWORD *)(a1 + 80);
    if ((((a2 | v15) | dataOut) & 7) == 0)
    {
      unsigned int v21 = v16 >= 0x10 ? v16 - 16 : 0;
      char v17 = (uint64_t *)dataOut;
      unint64_t v18 = (uint64_t *)a2;
      uint64_t v19 = (uint64_t *)v15;
      int v20 = *(_DWORD *)(a1 + 80);
      if (v21 < 0x41) {
        goto LABEL_35;
      }
      char v17 = (uint64_t *)dataOut;
      unint64_t v18 = (uint64_t *)a2;
      uint64_t v19 = (uint64_t *)v15;
      int v20 = *(_DWORD *)(a1 + 80);
      char v17 = (uint64_t *)dataOut;
      unint64_t v18 = (uint64_t *)a2;
      uint64_t v19 = (uint64_t *)v15;
      int v20 = *(_DWORD *)(a1 + 80);
      char v17 = (uint64_t *)dataOut;
      unint64_t v18 = (uint64_t *)a2;
      uint64_t v19 = (uint64_t *)v15;
      int v20 = *(_DWORD *)(a1 + 80);
      uint64_t v22 = ((v21 + 7) >> 3) + 1;
      uint64_t v23 = v22 & 0x3FFFFFFC;
      char v17 = &dataOut->i64[v23];
      unint64_t v18 = &a2->i64[v23];
      uint64_t v19 = &v15->i64[v23];
      int v20 = v16 - 8 * (v22 & 0x3FFFFFFC);
      uint64_t v24 = v15 + 1;
      unint64_t v25 = a2 + 1;
      uint64_t v26 = dataOut + 1;
      uint64_t v27 = v22 & 0x3FFFFFFC;
      do
      {
        int8x16_t v28 = veorq_s8(*v26, *v25);
        v24[-1] = veorq_s8(v26[-1], v25[-1]);
        *uint64_t v24 = v28;
        v24 += 2;
        v25 += 2;
        v26 += 2;
        v27 -= 4LL;
      }

      while (v27);
      if ((v22 & 0x3FFFFFFC) != v22)
      {
LABEL_35:
        unsigned int v29 = v20;
        do
        {
          uint64_t v31 = *v18++;
          uint64_t v30 = v31;
          uint64_t v32 = *v17++;
          *v19++ = v32 ^ v30;
          int v20 = v29 - 8;
          BOOL v33 = v29 > 0x10;
          v29 -= 8;
        }

        while (v33);
      }
    }
  }

  if ((v17 & 3) == 0 && v20 >= 5)
  {
    unsigned int v34 = v20 - 8;
    if (v34 < 0x29
      || (unint64_t)((char *)v19 - (char *)v17) < 0x20
      || (unint64_t)((char *)v19 - (char *)v18) < 0x20
      || (unint64_t)((char *)v19 - (char *)v17) < 0x20)
    {
      uint64_t v37 = v17;
      uint64_t v38 = v18;
      uint64_t v39 = v19;
    }

    else
    {
      uint64_t v35 = ((v34 + 3) >> 2) + 1;
      uint64_t v36 = 4 * (v35 & 0x7FFFFFF8);
      uint64_t v37 = (uint64_t *)((char *)v17 + v36);
      uint64_t v38 = (uint64_t *)((char *)v18 + v36);
      uint64_t v39 = (uint64_t *)((char *)v19 + v36);
      v20 -= 4 * (v35 & 0x7FFFFFF8);
      unint64_t v40 = (int8x16_t *)(v19 + 2);
      int v41 = (int8x16_t *)(v18 + 2);
      BOOL v42 = (int8x16_t *)(v17 + 2);
      uint64_t v43 = v35 & 0x7FFFFFF8;
      do
      {
        int8x16_t v44 = veorq_s8(*v42, *v41);
        v40[-1] = veorq_s8(v42[-1], v41[-1]);
        *unint64_t v40 = v44;
        v40 += 2;
        v41 += 2;
        v42 += 2;
        v43 -= 8LL;
      }

      while (v43);
      char v17 = v37;
      unint64_t v18 = v38;
      uint64_t v19 = v39;
      if ((v35 & 0x7FFFFFF8) == v35)
      {
LABEL_56:
        uint64_t v49 = v20 - (v20 != 0);
        if (v49 < 7
          || (unint64_t)((char *)v19 - (char *)v17) < 0x20
          || (unint64_t)((char *)v19 - (char *)v18) < 0x20
          || (unint64_t)((char *)v19 - (char *)v17) < 0x20)
        {
          uint64_t v52 = v17;
          uint64_t v53 = v18;
          uint64_t v54 = v19;
        }

        else
        {
          uint64_t v50 = v49 + 1;
          if (v49 < 0x1F)
          {
            uint64_t v51 = 0LL;
            goto LABEL_84;
          }

          uint64_t v51 = v50 & 0x1FFFFFFE0LL;
          BOOL v67 = (int8x16_t *)(v19 + 2);
          int v68 = (int8x16_t *)(v18 + 2);
          uint64_t v69 = (int8x16_t *)(v17 + 2);
          uint64_t v70 = v50 & 0x1FFFFFFE0LL;
          do
          {
            int8x16_t v71 = veorq_s8(*v69, *v68);
            v67[-1] = veorq_s8(v69[-1], v68[-1]);
            *BOOL v67 = v71;
            v67 += 2;
            v68 += 2;
            v69 += 2;
            v70 -= 32LL;
          }

          while (v70);
          if (v50 == v51) {
            goto LABEL_65;
          }
          if ((v50 & 0x18) != 0)
          {
LABEL_84:
            v20 -= v50 & 0xFFFFFFF8;
            uint64_t v52 = (uint64_t *)((char *)v17 + (v50 & 0x1FFFFFFF8LL));
            uint64_t v53 = (uint64_t *)((char *)v18 + (v50 & 0x1FFFFFFF8LL));
            uint64_t v54 = (uint64_t *)((char *)v19 + (v50 & 0x1FFFFFFF8LL));
            uint64_t v72 = (int8x8_t *)((char *)v19 + v51);
            int v73 = (int8x8_t *)((char *)v18 + v51);
            uint64_t v74 = (int8x8_t *)((char *)v17 + v51);
            uint64_t v75 = v51 - (v50 & 0x1FFFFFFF8LL);
            do
            {
              int8x8_t v76 = *v73++;
              int8x8_t v77 = v76;
              int8x8_t v78 = *v74++;
              *v72++ = veor_s8(v78, v77);
              v75 += 8LL;
            }

            while (v75);
            if (v50 == (v50 & 0x1FFFFFFF8LL)) {
              goto LABEL_65;
            }
            goto LABEL_63;
          }

          uint64_t v54 = (uint64_t *)((char *)v19 + v51);
          uint64_t v53 = (uint64_t *)((char *)v18 + v51);
          uint64_t v52 = (uint64_t *)((char *)v17 + v51);
          v20 -= v51;
        }

uint64_t sub_1813C1E7C(uint64_t result, int a2, int a3)
{
  if (a3 >= 12) {
    unsigned __int8 v3 = 12;
  }
  else {
    unsigned __int8 v3 = a3;
  }
  *(_BYTE *)(result + 69) = v3;
  *(_DWORD *)(result + 76) = a2;
  *(_DWORD *)(result + 80) = a2 - a3;
  *(_DWORD *)(result + 72) = 12 - v3;
  return result;
}

uint64_t sub_1813C1EA0(uint64_t a1)
{
  uint64_t v1 = (_OWORD *)a1;
  uint64_t v2 = *(void *)(a1 + 96);
  if (v2)
  {
    unsigned __int8 v3 = &off_18C4653A8;
    if (!dword_18C465380)
    {
LABEL_7:
      (*v3)(v2);
      goto LABEL_8;
    }

    if ((void)xmmword_18C468B70) {
      xmmword_18C465400(xmmword_18C468B70);
    }
    qword_18C468AC8 -= (int)off_18C4653B8(v2);
    --qword_18C468B10;
    off_18C4653A8(v2);
    uint64_t v2 = xmmword_18C468B70;
    if ((void)xmmword_18C468B70)
    {
      unsigned __int8 v3 = &xmmword_18C465410;
      goto LABEL_7;
    }
  }

uint64_t sub_1813C1FE0(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16)) {
    return 0LL;
  }
  uint64_t result = (*(uint64_t (**)(void))(*(void *)a1 + 56LL))();
  if (!(_DWORD)result)
  {
    if (!v8)
    {
      if (*(_BYTE *)(a1 + 9) == 5)
      {
        uint64_t result = 0LL;
        *(_BYTE *)(a1 + 9) = 0;
        return result;
      }

      return 0LL;
    }

    uint64_t v3 = *(void *)(a1 + 344);
    if (!v3 || *(__int16 *)(v3 + 60) < 0 || (LODWORD(v3) = *(_DWORD *)(v3 + 92), !(_DWORD)v3))
    {
      uint64_t v4 = **(void **)(a1 + 72);
      if (!v4)
      {
LABEL_19:
        uint64_t v5 = *(uint64_t (**)(void))(*(void *)a1 + 48LL);
        if (v5) {
          return v5();
        }
        return 0LL;
      }

      uint64_t result = (*(uint64_t (**)(void))(v4 + 48))();
      if ((_DWORD)result) {
        return result;
      }
      uint64_t v3 = (*(void *)(a1 + 200) - 1LL) / *(void *)(a1 + 200);
    }

    if (v3 > *(_DWORD *)(a1 + 188))
    {
      *(_DWORD *)(a1 + 188) = v3;
LABEL_17:
      if (*(_BYTE *)(a1 + 17)) {
        return 14LL;
      }
      if (!*(_BYTE *)(a1 + 8))
      {
        uint64_t v7 = **(void **)(a1 + 72);
      }

      uint64_t v6 = *(void *)(a1 + 80);
      if (*(void *)v6)
      {
        (*(void (**)(void))(*(void *)v6 + 8LL))(*(void *)(a1 + 80));
        *(void *)uint64_t v6 = 0LL;
      }

      uint64_t result = sub_1812FE900((uint64_t *)a1);
      if (!(_DWORD)result)
      {
        *(_BYTE *)(a1 + 9) = 5;
        *(_BYTE *)(a1 + 21) = 0;
      }

      return result;
    }

    if ((_DWORD)v3) {
      goto LABEL_17;
    }
    goto LABEL_19;
  }

  return result;
}

uint64_t sub_1813C2140(uint64_t a1, int8x8_t *a2, unsigned int a3)
{
  v39[1] = *MEMORY[0x1895F89C0];
  a2->i8[0] = 0;
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)a1 + 48LL))(a1, &v38);
  if ((_DWORD)result) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v38 < 16;
  }
  if (!v7)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)a1 + 16LL))( a1,  v39,  4LL,  v38 - 16);
    if (!(_DWORD)result)
    {
      uint64_t v8 = bswap32(v39[0]);
      uint64_t result = 0LL;
      if ((_DWORD)v8)
      {
        if (v38 - 16 >= v8)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)a1 + 16LL))( a1,  v39,  4LL,  v38 - 12);
          if (!(_DWORD)result)
          {
            unsigned int v9 = v39[0];
            uint64_t result = (*(uint64_t (**)(uint64_t, void *, uint64_t, uint64_t))(*(void *)a1 + 16LL))( a1,  v39,  8LL,  v38 - 8);
            if (!(_DWORD)result)
            {
              if (v39[0] != 0xD763A120F905D5D9LL) {
                return 0LL;
              }
              uint64_t result = (*(uint64_t (**)(uint64_t, int8x8_t *, uint64_t, uint64_t))(*(void *)a1 + 16LL))( a1,  a2,  v8,  v38 - v8 - 16);
              if (!(_DWORD)result)
              {
                unsigned int v10 = bswap32(v9);
                if (v8 < 8)
                {
                  uint64_t v11 = 0LL;
                  goto LABEL_26;
                }

                if (v8 >= 0x20)
                {
                  uint64_t v11 = v8 & 0xFFFFFFE0;
                  int32x4_t v12 = 0uLL;
                  int32x4_t v13 = (int32x4_t)v10;
                  size_t v14 = a2 + 2;
                  uint64_t v15 = v11;
                  int32x4_t v16 = 0uLL;
                  int32x4_t v17 = 0uLL;
                  int32x4_t v18 = 0uLL;
                  int32x4_t v19 = 0uLL;
                  int32x4_t v20 = 0uLL;
                  int32x4_t v21 = 0uLL;
                  do
                  {
                    int8x16_t v22 = *(int8x16_t *)v14[-2].i8;
                    int16x8_t v23 = vmovl_s8(*(int8x8_t *)v22.i8);
                    int16x8_t v24 = vmovl_high_s8(v22);
                    int16x8_t v25 = vmovl_s8(*v14);
                    int16x8_t v26 = vmovl_high_s8(*(int8x16_t *)v14->i8);
                    int32x4_t v17 = vsubw_high_s16(v17, v24);
                    int32x4_t v16 = vsubw_s16(v16, *(int16x4_t *)v24.i8);
                    int32x4_t v12 = vsubw_high_s16(v12, v23);
                    int32x4_t v13 = vsubw_s16(v13, *(int16x4_t *)v23.i8);
                    int32x4_t v21 = vsubw_high_s16(v21, v26);
                    int32x4_t v20 = vsubw_s16(v20, *(int16x4_t *)v26.i8);
                    int32x4_t v19 = vsubw_high_s16(v19, v25);
                    int32x4_t v18 = vsubw_s16(v18, *(int16x4_t *)v25.i8);
                    v14 += 4;
                    v15 -= 32LL;
                  }

                  while (v15);
                  unsigned int v10 = vaddvq_s32( vaddq_s32( vaddq_s32(vaddq_s32(v18, v13), vaddq_s32(v20, v16)),  vaddq_s32(vaddq_s32(v19, v12), vaddq_s32(v21, v17))));
                  if (v11 == v8) {
                    goto LABEL_28;
                  }
                  if ((v8 & 0x18) == 0)
                  {
LABEL_26:
                    unsigned int v34 = (char *)a2 + v11;
                    uint64_t v35 = v8 - v11;
                    do
                    {
                      int v36 = *v34++;
                      v10 -= v36;
                      --v35;
                    }

                    while (v35);
                    goto LABEL_28;
                  }
                }

                else
                {
                  uint64_t v11 = 0LL;
                }

                uint64_t v27 = v11;
                uint64_t v11 = v8 & 0xFFFFFFF8;
                int32x4_t v28 = 0uLL;
                int32x4_t v29 = (int32x4_t)v10;
                uint64_t v30 = (int8x8_t *)((char *)a2 + v27);
                uint64_t v31 = v27 - v11;
                do
                {
                  int8x8_t v32 = *v30++;
                  int16x8_t v33 = vmovl_s8(v32);
                  int32x4_t v28 = vsubw_high_s16(v28, v33);
                  int32x4_t v29 = vsubw_s16(v29, *(int16x4_t *)v33.i8);
                  v31 += 8LL;
                }

                while (v31);
                unsigned int v10 = vaddvq_s32(vaddq_s32(v29, v28));
                if (v11 != v8) {
                  goto LABEL_26;
                }
LABEL_28:
                uint64_t result = 0LL;
                if (v10) {
                  int v37 = 0;
                }
                else {
                  int v37 = v8;
                }
                a2->i8[v37] = 0;
                a2->i8[v37 + 1] = 0;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1813C23E0(uint64_t a1, int a2, _DWORD *a3, uint64_t *a4)
{
  uint64_t v4 = *(sqlite3 **)a1;
  uint64_t v71 = 0LL;
  uint64_t v72 = 0LL;
  *a3 = 0;
  *a4 = 0LL;
  uint64_t v5 = *(unsigned int *)(a1 + 36);
  if ((_DWORD)v5) {
    return v5;
  }
  uint64_t v9 = a1;
  uint64_t v5 = sqlite3_exec(*(sqlite3 **)a1, "SAVEPOINT changeset", 0LL, 0LL, 0LL);
  if ((_DWORD)v5) {
    return v5;
  }
  char v58 = a3;
  unsigned int v59 = a4;
  if (!v4)
  {
    uint64_t v11 = "NULL";
    goto LABEL_12;
  }

  int v10 = *((unsigned __int8 *)v4 + 113);
  if (v10 == 186)
  {
LABEL_7:
    uint64_t v11 = "unopened";
LABEL_12:
    sqlite3_log(21, "API call with %s database connection pointer", v11);
    sub_1812CF36C(186024);
    goto LABEL_13;
  }

  if (v10 != 118)
  {
    if (v10 != 109)
    {
      uint64_t v11 = "invalid";
      goto LABEL_12;
    }

    goto LABEL_7;
  }

  uint64_t v12 = *((void *)v4 + 3);
  if (v12) {
    xmmword_18C465400(v12);
  }
LABEL_13:
  uint64_t v13 = *(void *)(v9 + 88);
  if (!v13)
  {
    uint64_t v5 = 0LL;
    int v14 = 0;
    uint64_t v49 = a3;
    uint64_t v50 = v59;
    goto LABEL_102;
  }

  int v14 = 0;
  uint64_t v15 = &qword_18C467E20[60];
  int v64 = a2;
  uint64_t v60 = v9;
  uint64_t v61 = v4;
  do
  {
    if (!*(_DWORD *)(v13 + 48))
    {
      uint64_t v5 = 0LL;
      goto LABEL_36;
    }

    int32x4_t v16 = *(char **)(v13 + 8);
    int v69 = 0;
    uint64_t v67 = 0LL;
    __s1 = 0LL;
    pStmt = 0LL;
    int v65 = 0;
    int32x4_t v17 = (BOOL *)&v65;
    if (!*(_DWORD *)(v9 + 32)) {
      int32x4_t v17 = 0LL;
    }
    unsigned int v70 = sub_1812E8C64(0LL, v4, *(const char **)(v9 + 8), v16, &v69, 0LL, &v67, &__s1, v17);
    if (!v70)
    {
      size_t v18 = *(int *)(v13 + 16);
    }

    sub_1813BA4C8((uint64_t)&v71, a2, v13, &v70);
    uint64_t v5 = v70;
    int v63 = v14;
    if (v70)
    {
      int v19 = v72;
LABEL_25:
      int v14 = v19;
      goto LABEL_26;
    }

    uint64_t v23 = sub_1813BA5F4( (uint64_t)v4,  0,  *(void *)(v9 + 8),  (unsigned __int8 *)v16,  v65,  v69,  v67,  (uint64_t)__s1,  &pStmt);
    uint64_t v5 = v23;
    unsigned int v70 = v23;
    int v19 = v72;
    int v24 = *(_DWORD *)(v13 + 52);
    if (v24 < 1 || (_DWORD)v23) {
      goto LABEL_25;
    }
    int v62 = v72;
    uint64_t v25 = 0LL;
    int v26 = v69;
    uint64_t v27 = __s1;
    do
    {
      int32x4_t v28 = *(unsigned __int8 **)(*(void *)(v13 + 56) + 8 * v25);
      if (!v28)
      {
        int v29 = 0;
        goto LABEL_90;
      }

      do
      {
        uint64_t v30 = sub_1813BAA70(pStmt, v26, (uint64_t)v27, (uint64_t)v28);
        unsigned int v70 = v30;
        if ((_DWORD)v30) {
          break;
        }
        int v32 = sqlite3_step(pStmt);
        int v33 = *v28;
        if (v32 == 100)
        {
          if (v33 != 18)
          {
            uint64_t v39 = sub_1813BAF00((uint64_t)&v71, a2, (unsigned __int16 *)pStmt, (uint64_t)v28, (uint64_t)v27);
LABEL_59:
            uint64_t v5 = v39;
            unsigned int v70 = v39;
            if ((_DWORD)v39) {
              goto LABEL_89;
            }
            goto LABEL_45;
          }

          LODWORD(v34) = HIDWORD(v72);
          uint64_t v35 = (int)v72;
          if ((int)v72 < SHIDWORD(v72))
          {
            uint64_t v36 = v71;
            goto LABEL_54;
          }

          if (HIDWORD(v72)) {
            int v40 = HIDWORD(v72);
          }
          else {
            int v40 = 128;
          }
          uint64_t v34 = v40;
          do
          {
            uint64_t v41 = v34;
            v34 *= 2LL;
          }

          while (v34 <= (int)v72);
          if (v41 > 1073741695 && (uint64_t v34 = 2147483391LL, (int)v72 > 2147483390)
            || (uint64_t v42 = v71, sqlite3_initialize())
            || (uint64_t v47 = sub_18127D33C(v42, v34)) == 0)
          {
            unsigned int v70 = 7;
            if (v26 < 1) {
              goto LABEL_44;
            }
          }

          else
          {
            uint64_t v36 = v47;
            uint64_t v71 = v47;
            HIDWORD(v72) = v34;
LABEL_54:
            uint64_t v37 = v35 + 1;
            LODWORD(v72) = v35 + 1;
            *(_BYTE *)(v36 + v35) = 18;
            unsigned __int8 v38 = v28[1];
            if ((int)v35 + 1 >= (int)v34)
            {
              if ((_DWORD)v34) {
                int v43 = v34;
              }
              else {
                int v43 = 128;
              }
              uint64_t v44 = v43;
              do
              {
                uint64_t v45 = v44;
                v44 *= 2LL;
              }

              while (v44 <= v37);
              if (v45 <= 1073741695 || (uint64_t v44 = 2147483391LL, (int)v35 <= 2147483389))
              {
                if (!sqlite3_initialize())
                {
                  uint64_t v48 = sub_18127D33C(v36, v44);
                  if (v48)
                  {
                    uint64_t v36 = v48;
                    uint64_t v71 = v48;
                    HIDWORD(v72) = v44;
                    goto LABEL_55;
                  }
                }
              }

              unsigned int v70 = 7;
            }

            else
            {
LABEL_55:
              LODWORD(v72) = v35 + 2;
              *(_BYTE *)(v36 + v37) = v38;
            }

            a2 = v64;
            if (v26 < 1) {
              goto LABEL_44;
            }
          }

          for (int i = 0; i != v26; ++i)
            sub_1813BACD4((uint64_t)&v71, pStmt, i, &v70);
          goto LABEL_44;
        }

        if (v33 != 18)
        {
          uint64_t v39 = sub_1813BB530((uint64_t)&v71, a2, (uint64_t)v28, v26, v27);
          goto LABEL_59;
        }

uint64_t sub_1813C2A68( uint64_t result, uint64_t a2, unsigned int a3, int a4, unsigned int a5, int a6, uint64_t *a7)
{
  uint64_t v11 = result;
  uint64_t v13 = (_DWORD *)(result + 60);
  int v12 = *(_DWORD *)(result + 60);
  if (v12)
  {
    int v14 = 0;
  }

  else if ((a5 & 0x80000000) != 0)
  {
    if ((a3 & 0x40) != 0 || *(void *)(result + 24) == 0LL) {
      int v14 = *(_DWORD *)(a2 + 24);
    }
    else {
      int v14 = *(_DWORD *)(a2 + 24) + 1;
    }
  }

  else if (*(_DWORD *)(a2 + 16LL * a5 + 36) >= a6)
  {
    int v14 = a6;
  }

  else
  {
    int v14 = *(_DWORD *)(a2 + 16LL * a5 + 36);
  }

  int v16 = 2;
  do
  {
    unsigned int v17 = v16;
    v16 *= 2;
  }

  while ((int)v17 < v14);
  if (v12) {
    goto LABEL_40;
  }
  uint64_t v18 = 4LL * v17 + 136LL * (int)(v17 - 1) + 232;
  uint64_t result = sqlite3_initialize();
  if ((_DWORD)result || (uint64_t result = sub_18126F0AC(v18)) == 0)
  {
    if (v18 >= 1) {
      *uint64_t v13 = 7;
    }
    goto LABEL_40;
  }

  uint64_t v19 = result;
  bzero((void *)result, v18);
  *(void *)(v19 + 88) = v19 + 136LL * v17 + 96;
  *(void *)(v19 + 24) = v11;
  *(void *)(v19 + 56) = nullsub_14;
  *a7 = v19;
  *(_DWORD *)(v19 + 64) = v17;
  *(_DWORD *)(v19 + 68) = (a3 >> 1) & 1;
  *(_BYTE *)(v19 + 72) = (a3 & 0x10) != 0;
  *(void *)(v19 + 48) = 0LL;
  if ((a3 & 0x20) == 0) {
    sub_181395B94((uint64_t)v13, v19);
  }
  if (*v13) {
    goto LABEL_39;
  }
  if ((a5 & 0x80000000) != 0)
  {
    int v23 = 0;
    unint64_t v24 = a2 + 32;
    unint64_t v25 = a2 + 32 + 16LL * *(int *)(a2 + 28);
    if ((a3 & 0x40) == 0 && *(void *)(v11 + 24))
    {
      sub_181395CA0(v11, 0LL, a4, a3, v19 + 96);
      int v23 = 1;
    }

    for (; v24 < v25; v24 += 16LL)
    {
      uint64_t v26 = *(unsigned int *)(v24 + 4);
      if ((int)v26 >= 1)
      {
        unint64_t v27 = v26 + 1;
        uint64_t v28 = v19 + 96 + 136LL * v23;
        v23 += v26;
        do
        {
          sub_181395FD4((_DWORD *)v11, *(void *)(v24 + 8) + 56LL * (v27-- - 2), v28);
          v28 += 136LL;
        }

        while (v27 > 1);
      }
    }
  }

  else if (v14 >= 1)
  {
    uint64_t v20 = (void *)(a2 + 16LL * a5 + 40);
    uint64_t v21 = v14 - 1LL;
    uint64_t v22 = v19 + 96;
    do
    {
      sub_181395FD4((_DWORD *)v11, *v20 + 56LL * v21--, v22);
      v22 += 136LL;
    }

    while (v21 != -1);
  }

  if (*v13)
  {
LABEL_39:
    uint64_t result = sub_18138D5A4(v19);
LABEL_40:
    *a7 = 0LL;
    return result;
  }

  int v29 = *(_DWORD *)(v19 + 64);
  if (v29 >= 2)
  {
    do
    {
      int v31 = sub_18139176C(v19, v29 - 1);
      if (v31)
      {
        int v32 = v31;
        if (!*v13) {
          (*(void (**)(uint64_t, uint64_t, void))(v19 + 136LL * v31 + 152))(v11, v19 + 136LL * v31 + 96, 0LL);
        }
        int v33 = *(_DWORD *)(v19 + 64);
        BOOL v34 = __OFADD__(v33, v32);
        int v35 = v33 + v32;
        if (v35 < 0 != v34) {
          ++v35;
        }
        while (1)
        {
          int v36 = v35 >> 1;
          if (v35 >> 1 < v29 - 1 || *v13) {
            break;
          }
          int v37 = sub_18139176C(v19, v36);
          if (v37)
          {
            int v38 = v37;
            (*(void (**)(uint64_t, uint64_t, void))(v19 + 136LL * v37 + 152))( v11,  v19 + 136LL * v37 + 96,  0LL);
            int v36 = *(_DWORD *)(v19 + 64) + v38;
          }

          if (v36 >= 0) {
            int v35 = v36;
          }
          else {
            int v35 = v36 + 1;
          }
        }
      }
    }

    while (v29-- > 2);
  }

  unsigned int v39 = *(unsigned __int16 *)(*(void *)(v19 + 88) + 4LL);
  uint64_t v40 = v19 + 136LL * *(unsigned __int16 *)(*(void *)(v19 + 88) + 4LL);
  uint64_t v41 = *(void *)(v40 + 112);
  *(_BYTE *)(v19 + 20) = v41 == 0;
  *(void *)(v19 + 80) = *(void *)(v40 + 216);
  if (*(_BYTE *)(v19 + 72) && !*v13 && v41 && !*(_DWORD *)(v19 + 136LL * v39 + 224)) {
    return sub_1813903E0(v11, v19, 0, 0LL);
  }
  uint64_t result = sub_1813908F8(v19);
  if ((_DWORD)result) {
    return sub_1813903E0(v11, v19, 0, 0LL);
  }
  if (!*(_BYTE *)(v19 + 20)) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(v19 + 56))( v19,  v19 + 136LL * *(unsigned __int16 *)(*(void *)(v19 + 88) + 4LL) + 96);
  }
  return result;
}

void sub_1813C2E50( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_1813C2E68( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

uint64_t sub_1813C2E80(sqlite3 *a1)
{
  uint64_t result = sqlite3_create_function( a1,  "uuid",  0,  2097153,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_1813C2F3C,  0LL,  0LL);
  if (!(_DWORD)result)
  {
    uint64_t result = sqlite3_create_function( a1,  "uuid_str",  1,  2099201,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_1813C302C,  0LL,  0LL);
    if (!(_DWORD)result) {
      return sqlite3_create_function( a1,  "uuid_blob",  1,  2099201,  0LL,  (void (__cdecl *)(sqlite3_context *, int, sqlite3_value **))sub_1813C30FC,  0LL,  0LL);
    }
  }

  return result;
}

void sub_1813C2F3C(sqlite3_context *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  sqlite3_randomness(16, P);
  uint64_t v2 = 0LL;
  char v9 = v9 & 0xF | 0x40;
  char v10 = v10 & 0x3F | 0x80;
  unsigned int v3 = 1360;
  uint64_t v4 = v7;
  do
  {
    if ((v3 & 1) != 0) {
      *v4++ = 45;
    }
    unint64_t v5 = P[v2];
    char v6 = a0123456789abcd_1[v5 >> 4];
    LOBYTE(v5) = a0123456789abcd_1[v5 & 0xF];
    *uint64_t v4 = v6;
    v4[1] = v5;
    v4 += 2;
    ++v2;
    v3 >>= 1;
  }

  while (v2 != 16);
  *uint64_t v4 = 0;
  sqlite3_result_text(a1, v7, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void sub_1813C302C(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (unsigned __int8 *)sub_1813C3170(*a3, (uint64_t)v11);
  if (v4)
  {
    uint64_t v5 = 0LL;
    unsigned int v6 = 1360;
    BOOL v7 = v10;
    do
    {
      if ((v6 & 1) != 0) {
        *v7++ = 45;
      }
      unint64_t v8 = v4[v5];
      char v9 = a0123456789abcd_1[v8 >> 4];
      LOBYTE(v8) = a0123456789abcd_1[v8 & 0xF];
      char *v7 = v9;
      v7[1] = v8;
      v7 += 2;
      ++v5;
      v6 >>= 1;
    }

    while (v5 != 16);
    char *v7 = 0;
    sqlite3_result_text(a1, v10, 36, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }

void sub_1813C30FC(sqlite3_context *a1, uint64_t a2, sqlite3_value **a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v4 = sub_1813C3170(*a3, (uint64_t)v5);
  if (v4) {
    sqlite3_result_blob(a1, v4, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
}

const void *sub_1813C3170(sqlite3_value *a1, uint64_t a2)
{
  int v4 = sqlite3_value_type(a1);
  if (v4 == 4)
  {
    if (sqlite3_value_bytes(a1) == 16) {
      return sqlite3_value_blob(a1);
    }
  }

  else if (v4 == 3)
  {
    uint64_t v5 = sqlite3_value_text(a1);
    uint64_t v6 = 0LL;
    if (*v5 == 123) {
      BOOL v7 = v5 + 1;
    }
    else {
      BOOL v7 = v5;
    }
    uint64_t v8 = MEMORY[0x1895F8770];
    while (1)
    {
      if (*v7 == 45) {
        ++v7;
      }
      uint64_t v9 = *v7;
      if ((*(_DWORD *)(v8 + 4 * v9 + 60) & 0x10000) == 0) {
        break;
      }
      uint64_t v10 = v7[1];
      if ((*(_DWORD *)(v8 + 4 * v10 + 60) & 0x10000) == 0) {
        break;
      }
      *(_BYTE *)(a2 + v6) = ((((char)(2 * v10) >> 7) & 0xF9) + v10) & 0xF | (16
      v7 += 2;
      if (++v6 == 16)
      {
        uint64_t v11 = v7 + 1;
        if (*v7 != 125) {
          uint64_t v11 = v7;
        }
        if (*v11) {
          return 0LL;
        }
        else {
          return (const void *)a2;
        }
      }
    }
  }

  return 0LL;
}

void sub_1813C327C()
{
  if (getenv("SQLITE_SQLLOG_DIR"))
  {
    if ((os_variant_allows_internal_security_policies() & 1) != 0)
    {
      if (!sqlite3_config(21, sub_1813C3370, 0LL))
      {
        bzero(qword_18C550750, 0x2428uLL);
        dword_18C550760 = 1;
        if (getenv("SQLITE_SQLLOG_CONDITIONAL")) {
          dword_18C55075C = 1;
        }
      }
    }

    else if (qword_18C550748 != -1)
    {
      dispatch_once(&qword_18C550748, &unk_189B6F8E8);
    }
  }

void sub_1813C333C()
{
}

void sub_1813C3370(uint64_t a1, sqlite3 *a2, const char *a3, int a4)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  BOOL v7 = sqlite3_mutex_alloc(2);
  uint64_t v8 = v7;
  if (!a4)
  {
    sqlite3_mutex_enter(v7);
    if (!qword_18C550750[0]) {
      qword_18C550750[0] = (uint64_t)sqlite3_mutex_alloc(1);
    }
    sqlite3_mutex_leave(v8);
    sqlite3_mutex_enter((sqlite3_mutex *)qword_18C550750[0]);
    if (dword_18C550B6C) {
      goto LABEL_18;
    }
    if (dword_18C55075C && !sub_1813C3BB4(a2, "main", 0LL, __s))
    {
      int v25 = strlen(__s);
      if (v25 >= 505)
      {
        sqlite3_log(10, "sqllogTraceDb(): database name too long (%d bytes)", v25);
        goto LABEL_18;
      }

      *(void *)&__s[v25] = 0x676F6C6C71732DLL;
      if (access(__s, 0)) {
        goto LABEL_18;
      }
    }

    sqlite3_mutex_enter(v8);
    uint64_t v12 = dword_18C550758++;
    uint64_t v13 = &qword_18C550750[4 * v12];
    v13[136] = 0LL;
    v13[134] = (uint64_t)a2;
    LODWORD(v12) = dword_18C550B64++;
    *((_DWORD *)v13 + 270) = v12;
    sqlite3_mutex_leave(v8);
    if (v13[136]) {
      goto LABEL_17;
    }
    if (!byte_18C550764)
    {
      uint64_t v26 = getenv("SQLITE_SQLLOG_DIR");
      if (!v26) {
        goto LABEL_18;
      }
      unint64_t v27 = v26;
      if (strlen(v26) - 502 < 0xFFFFFFFFFFFFFE00LL) {
        goto LABEL_18;
      }
      pid_t v28 = getpid();
      sqlite3_snprintf(512, &byte_18C550764, "%s/sqllog_%05d", v27, v28);
      sqlite3_snprintf(512, byte_18C550964, "%s.idx", &byte_18C550764);
      int v29 = getenv("SQLITE_SQLLOG_REUSE_FILES");
      if (v29) {
        dword_18C550760 = atoi(v29);
      }
      uint64_t v30 = fopen(byte_18C550964, "w");
      if (v30) {
        fclose(v30);
      }
    }

    int v14 = sqlite3_mprintf("%s_%05d.sql", &byte_18C550764, *((_DWORD *)v13 + 270));
    v13[136] = (uint64_t)fopen(v14, "w");
    sqlite3_free(v14);
    if (v13[136] || (sqlite3_log(10, "sqllogOpenlog(): Failed to open log file"), v13[136])) {
LABEL_17:
    }
      sub_1813C3820((uint64_t)(v13 + 133), "main", 0);
LABEL_18:
    sqlite3_mutex_leave((sqlite3_mutex *)qword_18C550750[0]);
    return;
  }

  int v9 = dword_18C550758;
  if (dword_18C550758 < 1)
  {
    int v9 = 0;
    uint64_t v11 = 0LL;
    if (a4 == 2)
    {
LABEL_23:
      sqlite3_mutex_enter(v7);
      int v15 = dword_18C550758;
      if (v9 < dword_18C550758)
      {
        int v16 = (FILE *)v11[3];
        if (v16)
        {
          fclose(v16);
          int v15 = dword_18C550758;
        }

        v11[1] = 0LL;
        v11[3] = 0LL;
        dword_18C550758 = --v15;
      }

      if (v15)
      {
        if (v9 < v15)
        {
          unint64_t v17 = (char *)&qword_18C550750[4 * v15] - (char *)v11 + 1064;
        }
      }

      else
      {
        sqlite3_mutex_free((sqlite3_mutex *)qword_18C550750[0]);
        qword_18C550750[0] = 0LL;
      }

      uint64_t v18 = v8;
LABEL_33:
      sqlite3_mutex_leave(v18);
    }
  }

  else
  {
    uint64_t v10 = 0LL;
    uint64_t v11 = (uint64_t *)&unk_18C550B78;
    while ((sqlite3 *)v11[1] != a2)
    {
      ++v10;
      v11 += 4;
      if (dword_18C550758 == v10)
      {
        uint64_t v11 = &qword_18C550750[4 * (dword_18C550758 - 1) + 133];
        if (a4 == 2) {
          goto LABEL_23;
        }
        return;
      }
    }

    if (a4 == 2)
    {
      int v9 = v10;
      goto LABEL_23;
    }

    if (v11[3])
    {
      sqlite3_mutex_enter((sqlite3_mutex *)qword_18C550750[0]);
      if (!dword_18C550B6C)
      {
        for (int i = a3; ; ++i)
        {
          int v20 = *(unsigned __int8 *)i;
        }

        uint64_t v21 = 0LL;
        do
          unsigned int v22 = (i[v21++] & 0xDF) - 65;
        while (v22 < 0x1A);
        if ((_DWORD)v21 == 7 && !sqlite3_strnicmp("ATTACH", i, 6))
        {
          sub_1813C3820((uint64_t)v11, 0LL, 1);
        }

        else
        {
          int v23 = (FILE *)v11[3];
          int v24 = dword_18C550B70++;
          fprintf(v23, "%s; -- clock=%d\n", a3, v24);
        }
      }

      uint64_t v18 = (sqlite3_mutex *)qword_18C550750[0];
      goto LABEL_33;
    }
  }

void sub_1813C3820(uint64_t a1, const char *a2, int a3)
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  if (__s[0])
  {
    if (dword_18C550760)
    {
      uint64_t v5 = fopen(byte_18C550964, "r");
      if (v5)
      {
        uint64_t v6 = v5;
        if (feof(v5))
        {
LABEL_6:
          BOOL v7 = 0LL;
        }

        else
        {
          while (1)
          {
            if (fgets((char *)ppDb, 1029, v6))
            {
              char v37 = 0;
              int v14 = (char *)&v35 + 7;
              do
              {
                int v16 = *(unsigned __int8 *)++v14;
                int v15 = v16;
              }

              while ((v16 - 48) < 0xA);
              while (v15 == 32)
              {
                int v17 = *(unsigned __int8 *)++v14;
                int v15 = v17;
              }

              LODWORD(v18) = strlen(v14);
              if ((int)v18 >= 1)
              {
                uint64_t v18 = v18;
                while (1)
                {
                  uint64_t v19 = v18 - 1;
                  int v20 = v14[(v18 - 1)];
                  --v18;
                  if ((unint64_t)(v19 + 1) <= 1)
                  {
                    LODWORD(v18) = 0;
                    break;
                  }
                }
              }

              size_t v21 = (int)v18;
            }

            if (feof(v6)) {
              goto LABEL_6;
            }
          }

          uint64_t v35 = 0LL;
          uint64_t v34 = 0LL;
          char v22 = (char)ppDb[0];
          if (LOBYTE(ppDb[0]) - 48 <= 9)
          {
            int v23 = (unsigned __int8 *)ppDb + 1;
            int v24 = &v34;
            do
            {
              *(_BYTE *)int v24 = v22;
              int v24 = (uint64_t *)((char *)v24 + 1);
              int v25 = *v23++;
              char v22 = v25;
            }

            while ((v25 - 48) < 0xA);
          }

          BOOL v7 = sqlite3_mprintf("%s_%s.db", &byte_18C550764, (const char *)&v34);
        }

        if (ferror(v6)) {
          sqlite3_log(10, "sqllogFindFile(): error reading index file");
        }
        fclose(v6);
        if (v7) {
          goto LABEL_41;
        }
      }

      else
      {
        sqlite3_log(10, "sqllogFindFile(): error in fopen()");
      }
    }

    ppDb[0] = 0LL;
    int v8 = dword_18C550B68++;
    BOOL v7 = sqlite3_mprintf("%s_%02d.db", &byte_18C550764, v8);
    dword_18C550B6C = 1;
    int v9 = sqlite3_open(v7, ppDb);
    if (v9)
    {
      int v10 = v9;
      dword_18C550B6C = 0;
    }

    else
    {
      sqlite3_exec(ppDb[0], "PRAGMA synchronous = 0", 0LL, 0LL, 0LL);
      uint64_t v11 = sqlite3_backup_init(ppDb[0], "main", *(sqlite3 **)(a1 + 8), zSourceName);
      if (v11)
      {
        uint64_t v12 = v11;
        sqlite3_backup_step(v11, -1);
        int v13 = sqlite3_backup_finish(v12);
      }

      else
      {
        int v13 = sqlite3_errcode(ppDb[0]);
      }

      int v10 = v13;
      sqlite3_close(ppDb[0]);
      dword_18C550B6C = 0;
      if (!v10)
      {
        int v29 = fopen(byte_18C550964, "a");
        if (v29)
        {
          uint64_t v30 = v29;
          fprintf(v29, "%d %s\n", v8, __s);
          fclose(v30);
        }

        goto LABEL_41;
      }
    }

    sqlite3_log(v10, "sqllogCopydb(): error backing up database");
  }

  else
  {
    BOOL v7 = sqlite3_mprintf(&byte_1813CEAEE);
  }

uint64_t sub_1813C3BB4(sqlite3 *a1, const char *a2, void *a3, void *a4)
{
  dword_18C550B6C = 1;
  uint64_t v7 = sqlite3_prepare_v2(a1, "PRAGMA database_list", -1, &ppStmt, 0LL);
  if ((_DWORD)v7)
  {
    uint64_t v8 = v7;
    dword_18C550B6C = 0;
LABEL_10:
    sqlite3_log(v8, "sqllogFindAttached(): error in PRAGMA database_list");
    return v8;
  }

  while (sqlite3_step(ppStmt) == 100)
  {
    int v9 = sqlite3_column_text(ppStmt, 1);
    int v10 = sqlite3_column_bytes(ppStmt, 1);
    int v11 = v10;
    if (a3) {
      memcpy(a3, v9, v10 + 1);
    }
    uint64_t v12 = sqlite3_column_text(ppStmt, 2);
    int v13 = sqlite3_column_bytes(ppStmt, 2);
    memcpy(a4, v12, v13 + 1);
    if (a2)
    {
    }
  }

  uint64_t v8 = sqlite3_finalize(ppStmt);
  dword_18C550B6C = 0;
  if ((_DWORD)v8) {
    goto LABEL_10;
  }
  return v8;
}

void sub_1813C3CF4(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v2 = __error();
  unsigned int v3 = strerror(*v2);
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  _os_log_fault_impl( &dword_181266000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "Failed to open temporary file at path %s: %s",  (uint8_t *)&v4,  0x16u);
  sub_1813C2E78();
}

void sub_1813C3D90( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3DC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3DF8( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3E7C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3F04( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3F38( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3F6C( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1813C3FA0(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v3 = *(unsigned __int8 *)(a1 + 70);
  int v4 = *(unsigned __int8 *)(a1 + 66);
  v5[0] = 67109632;
  v5[1] = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  __int16 v8 = 1024;
  int v9 = v4;
  _os_log_error_impl( &dword_181266000,  log,  OS_LOG_TYPE_ERROR,  "locking protocol: lockstate:%d, bShmUnreliable:%d, readOnly:%d",  (uint8_t *)v5,  0x14u);
}

void sub_1813C4034()
{
}

void sub_1813C404C()
{
}

void sub_1813C4064()
{
}

void sub_1813C407C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  unint64_t v3 = *(unsigned __int8 *)(a1 + 33);
  if (v3 <= 3 && ((v5 = *(void *)(a1 + 40), uint64_t v4 = a1 + 40, v5) || *(void *)(a2 + 16 * v3 + 64) == v4)) {
    __int16 v6 = "unpinned";
  }
  else {
    __int16 v6 = "pinned";
  }
  int v7 = 136446466;
  __int16 v8 = v6;
  __int16 v9 = 1024;
  int v10 = a3;
  _os_log_fault_impl( &dword_181266000,  MEMORY[0x1895F8DA0],  OS_LOG_TYPE_FAULT,  "xRekey overwriting %{public}s page at index %d",  (uint8_t *)&v7,  0x12u);
}

CCCryptorStatus CCCrypt( CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1895F8090]( *(void *)&op,  *(void *)&alg,  *(void *)&options,  key,  keyLength,  iv,  dataIn,  dataInLength);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82D8](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1895F82E0](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1895F82E8](c, data, *(void *)&len);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1895F8720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t __mac_syscall()
{
  return MEMORY[0x1895F8910]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1895F8918](*(void *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1895F8930]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1895F8940]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895F89A0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1895F8A08]();
}

uint64_t _dispatch_is_fork_of_multithreaded_parent()
{
  return MEMORY[0x1895F8AD0]();
}

uint64_t _dispatch_is_multithreaded()
{
  return MEMORY[0x1895F8AD8]();
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

void _os_signpost_emit_with_name_impl( void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1895F9328](a1, *(void *)&a2);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1895F9540](a1, a2);
}

double atof(const char *a1)
{
  return result;
}

int atoi(const char *a1)
{
  return MEMORY[0x1895F95A0](a1);
}

uint64_t atoll(const char *a1)
{
  return MEMORY[0x1895F95B0](a1);
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

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1895FA5E8](*(void *)&a1, a2, a3);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1895FAA60](from, to, state, *(void *)&flags);
}

char *__cdecl dirname_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1895FAAE0](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(uint64_t identifier, unint64_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1895FAC40](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1895FAD80](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

uint64_t dispatch_source_cancel_and_wait()
{
  return MEMORY[0x1895FAE48]();
}

dispatch_source_t dispatch_source_create( dispatch_source_type_t type, uintptr_t handle, unint64_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1895FAE50](type, handle, mask, queue);
}

unint64_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1895FAE58](source);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x1895FAE60](source);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x1895FAFF0]();
}

uint64_t dyld_process_is_restricted()
{
  return MEMORY[0x1895FB058]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1895FB088]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1895FB210](*(void *)&a1, *(void *)&a2);
}

int fcopyfile(int from_fd, int to_fd, copyfile_state_t a3, copyfile_flags_t flags)
{
  return MEMORY[0x1895FB218](*(void *)&from_fd, *(void *)&to_fd, a3, *(void *)&flags);
}

int feof(FILE *a1)
{
  return MEMORY[0x1895FB248](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fgetattrlist(int a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1895FB278](*(void *)&a1, a2, a3, a4, *(void *)&a5);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1895FB290](a1, *(void *)&a2, a3);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1895FB2F0](*(void *)&a1, *(void *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1895FB418](a1, a2, a3, *(void *)&a4);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1895FB420](a1, a2, *(void *)&a3);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1895FB448](*(void *)&a1, a2);
}

int fstatfs(int a1, statfs *a2)
{
  return MEMORY[0x1895FB460](*(void *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1895FB468](*(void *)&a1);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1895FB470](a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1895FB480](*(void *)&a1, a2);
}

int futimes(int a1, const timeval *a2)
{
  return MEMORY[0x1895FB4C0](*(void *)&a1, a2);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1895FB540]();
}

pid_t getpid(void)
{
  return MEMORY[0x1895FB628]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1895FB638]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1895FB6E0](a1, a2);
}

uint64_t guarded_close_np()
{
  return MEMORY[0x1895FB730]();
}

uint64_t guarded_open_dprotected_np()
{
  return MEMORY[0x1895FB738]();
}

uint64_t guarded_open_np()
{
  return MEMORY[0x1895FB740]();
}

uint64_t guarded_pwrite_np()
{
  return MEMORY[0x1895FB748]();
}

uint64_t guarded_write_np()
{
  return MEMORY[0x1895FB750]();
}

int isatty(int a1)
{
  return MEMORY[0x1895FB868](*(void *)&a1);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1895FBA20](a1, a2);
}

double log(double a1)
{
  return result;
}

double log10(double a1)
{
  return result;
}

double log2(double a1)
{
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1895FBA80](*(void *)&a1, a2, *(void *)&a3);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1895FBAB0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

malloc_zone_t *__cdecl malloc_create_zone(vm_size_t start_size, unsigned int flags)
{
  return (malloc_zone_t *)MEMORY[0x1895FBC98](start_size, *(void *)&flags);
}

malloc_zone_t *malloc_default_zone(void)
{
  return (malloc_zone_t *)MEMORY[0x1895FBCA0]();
}

void malloc_set_zone_name(malloc_zone_t *zone, const char *name)
{
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1895FBCE0](ptr);
}

void malloc_zone_free(malloc_zone_t *zone, void *ptr)
{
}

void *__cdecl malloc_zone_malloc(malloc_zone_t *zone, size_t size)
{
  return (void *)MEMORY[0x1895FBD30](zone, size);
}

void *__cdecl malloc_zone_realloc(malloc_zone_t *zone, void *ptr, size_t size)
{
  return (void *)MEMORY[0x1895FBD48](zone, ptr, size);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

int mincore(const void *a1, size_t a2, char *a3)
{
  return MEMORY[0x1895FBEC8](a1, a2, a3);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1895FBF38](a1);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1895FBFB0](__rqtp, __rmtp);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1895FC248](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1895FC440](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1895FC600](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1895FC608](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1895FC610](log, ptr);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1895FC668]();
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x1895FC670](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1895FC688]();
}

uint64_t os_unfair_recursive_lock_trylock()
{
  return MEMORY[0x1895FC690]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1895FC6A0]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1895FC6A8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1895FC6C0]();
}

void perror(const char *a1)
{
}

int pipe(int a1[2])
{
  return MEMORY[0x1895FC7B0](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FC880](*(void *)&__fd, __buf, __nbyte, a4);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1895FCBA0](*(void *)&__fd, __buf, __nbyte, a4);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
}

uint64_t random(void)
{
  return MEMORY[0x1895FCBF8]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1895FCC38](*(void *)&a1, a2, a3);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

int rename(const char *__old, const char *__new)
{
  return MEMORY[0x1895FCD50](__old, __new);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1895FCF90](__str, __size, __format);
}

void srandomdev(void)
{
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1895FD010](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1895FD018](a1, a2);
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

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1895FD088](*(void *)&__errnum, __strerrbuf, __buflen);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0A0](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1895FD0B0](__dst, __source, __size);
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

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1895FD0F8](__s1, __n);
}

char *__cdecl strrchr(const char *__s, int __c)
{
  return (char *)MEMORY[0x1895FD120](__s, *(void *)&__c);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1895FD140](__s, __charset);
}

char *__cdecl strstr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1895FD148](__big, __little);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

uint64_t strtoll(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1A0](__str, __endptr, *(void *)&__base);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1895FD2A8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1895FD2B8](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1895FD400](a1);
}

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x1895FD430](a1, a2);
}

int unlink(const char *a1)
{
  return MEMORY[0x1895FD468](a1);
}

int utime(const char *a1, const utimbuf *a2)
{
  return MEMORY[0x1895FD498](a1, a2);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

void *__cdecl valloc(size_t a1)
{
  return (void *)MEMORY[0x1895FD508](a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1895FD548](*(void *)&target_task, address, size, *(void *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1895FD558](*(void *)&target_task, address, size);
}

kern_return_t vm_purgable_control( vm_map_t target_task, vm_address_t address, vm_purgable_t control, int *state)
{
  return MEMORY[0x1895FD5A0](*(void *)&target_task, address, *(void *)&control, state);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1895FD750](*(void *)&__fd, __buf, __nbyte);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1895FDAA8]();
}