void *BRLTRN_UnicodeStringInit(void *result, char *__s)
{
  void *v3;
  size_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  *result = 0LL;
  if (__s)
  {
    v3 = result;
    v4 = strlen(__s);
    result = malloc(4 * v4 + 4);
    *v3 = result;
    LOBYTE(v5) = *__s;
    if (*__s)
    {
      v6 = 0LL;
      do
      {
        *((_DWORD *)result + v6) = (char)v5;
        v7 = v6 + 1;
        v5 = __s[++v6];
      }

      while (v5);
    }

    else
    {
      v7 = 0LL;
    }

    *((_DWORD *)result + v7) = 0;
  }

  return result;
}

void *BRLTRN_UnicodeStringInitSize(void *result, uint64_t a2)
{
  *result = 0LL;
  if (a2)
  {
    v2 = result;
    result = malloc(4 * a2);
    void *v2 = result;
    if (result) {
      *(_DWORD *)result = 0;
    }
  }

  return result;
}

void BRLTRN_UnicodeStringFree(void **a1)
{
  v2 = *a1;
  if (v2) {
    free(v2);
  }
  *a1 = 0LL;
}

uint64_t BRLTRN_CreateA(char *__s, char *a2, uint64_t *a3, char *a4, char *a5)
{
  v9 = v17;
  v10 = v18;
  v11 = v15;
  v12 = v16;
  uint64_t v13 = BRLTRN_CreateW(v18, v17, a3, (uint64_t)v16, v15);
  if (!(_DWORD)v13 && *a3) {
    *(_DWORD *)*a3 = 1;
  }
  if (v10) {
    free(v10);
  }
  if (v9) {
    free(v9);
  }
  if (v12) {
    free(v12);
  }
  if (v11) {
    free(v11);
  }
  return v13;
}

uint64_t BRLTRN_TranslateString( _DWORD *a1, __int32 *a2, int *a3, unsigned int a4, unsigned int a5, _WORD *a6)
{
  unsigned __int16 v24 = 0;
  uint64_t v6 = 14LL;
  if (!a1 || !a2 || !a3 || !a4) {
    return v6;
  }
  if (a6)
  {
    uint64_t v13 = malloc(2LL * a4);
    if (!v13) {
      return 23LL;
    }
  }

  else
  {
    uint64_t v13 = 0LL;
  }

  if (!*a1)
  {
    unsigned __int16 v14 = wcslen(a2);
    uint64_t v6 = BRLTRN_TranslateStringEx((uint64_t)a1, 0LL, (unsigned int *)a2, a3, (uint64_t)v13, a4, &v24);
    goto LABEL_21;
  }

  unsigned __int16 v14 = strlen((const char *)a2);
  BRLTRN_UnicodeStringInit(&v23, (char *)a2);
  v15 = (int *)malloc(4LL * a4);
  v16 = v15;
  if (!v15)
  {
    uint64_t v6 = 23LL;
    v17 = v23;
    if (!v23) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  int *v15 = 0;
  v17 = v23;
  if (!v23)
  {
    v23 = 0LL;
    uint64_t v6 = 23LL;
    goto LABEL_20;
  }

  uint64_t v18 = BRLTRN_TranslateStringEx((uint64_t)a1, 0LL, (unsigned int *)v23, v15, (uint64_t)v13, a4, &v24);
  if ((_DWORD)v18)
  {
    uint64_t v6 = v18;
LABEL_16:
    free(v17);
    goto LABEL_17;
  }

  int v20 = *v16;
  if (*v16)
  {
    uint64_t v21 = 0LL;
    do
    {
      *((_BYTE *)a3 + v21) = v20;
      uint64_t v22 = v21 + 1;
      int v20 = v16[++v21];
    }

    while (v20);
  }

  else
  {
    uint64_t v22 = 0LL;
  }

  uint64_t v6 = 0LL;
  *((_BYTE *)a3 + v22) = 0;
  if (v17) {
    goto LABEL_16;
  }
LABEL_17:
  v23 = 0LL;
  if (v16) {
LABEL_20:
  }
    free(v16);
LABEL_21:
  if (v13)
  {
    if (a6 && !(_DWORD)v6)
    {
      if (a5 <= v14)
      {
        uint64_t v6 = 0LL;
        *a6 = BRLTRN_OutputPosFromArray((uint64_t)v13, v24, a5);
      }

      else
      {
        uint64_t v6 = 14LL;
      }
    }

    free(v13);
  }

  return v6;
}

LABEL_12:
  DBTAppendNSStringIntoWideCharBufferAtOffset(v9, (uint64_t)self->_inBuffer, a6);
  return (unint64_t)v10;
}
}

LABEL_26:
  v37 = v56;
  v38 = [v56 bytes];
  v39 = a4 - 1;
  v36 = v57;
  v35 = v54;
  if ((uint64_t)(a4 - 1) >= 0)
  {
    v40 = 0;
    v41 = 0;
    v42 = self->_inBuffer;
    v43 = a5;
    do
    {
      v44 = a4;
      a4 = v39;
      if (v39 && *(_DWORD *)&v17[4 * v39] == *(_DWORD *)&v17[4 * v44 - 8])
      {
        if (v39 >= 3 && v42[v44 - 2 + v10] == 31 && v42[v10 - 3 + v44] == 101 && v42[v10 - 4 + v44] != 28)
        {
          v45 = 0;
          v41 = 1;
        }

        else
        {
          v45 = 1;
        }
      }

      else
      {
        v45 = 0;
      }

      v46 = v42[v39 + v10];
      v47 = v40 | (v46 == 31) & v41;
      if ((v45 & 1) == 0 && (v47 & 1) == 0)
      {
        v48 = *(int *)&v17[4 * a4];
        if (v43 >= a5) {
          v43 = a5;
        }
        v49 = v43 > v48;
        v50 = v43 - v48;
        if (v49)
        {
          v51 = (unint64_t *)&v16[8 * v48];
          do
          {
            v52 = a4;
            if (v38) {
              v52 = v38[a4];
            }
            *v51++ = v52;
            --v50;
          }

          while (v50);
        }

        v43 = v48;
      }

      v41 &= v46 != 31;
      v40 = (v46 != 28) & v47;
      v39 = a4 - 1;
    }

    while ((uint64_t)a4 > 0);
  }

LABEL_50:
  *v36 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](&OBJC_CLASS___NSData, "dataWithBytes:length:", v16, v35));
  free(v16);
}

LABEL_16:
    length = v12 - v8;
  }

  v15 = v8;
  v16 = length;
  result.length = v16;
  result.location = v15;
  return result;
}

LABEL_10:
  v16 = objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _eightDotPrintBrailleForText:locations:textFormattingRanges:]( self,  "_eightDotPrintBrailleForText:locations:textFormattingRanges:",  v13,  a5,  v14));
LABEL_16:
  v17 = (void *)v16;

  return v17;
}

LABEL_15:
  v27 = v34;
  bzero(v15, v34);
LABEL_26:
  *a3 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v15,  v27,  v34));
  free(v15);
}

  if (v13) {
    fclose(v13);
  }
  if ((_DWORD)v11) {
    BRLTRN_Destroy((_DWORD *)v15);
  }
  else {
    *a3 = v15;
  }
  dxios_stream_destroy(v20);
  return v11;
}

        result = 0LL;
        v11 = 32;
        goto LABEL_23;
      }
    }
  }

  if ((result - 44032) >> 4 > 0x2BA)
  {
    v10 = chudi(result);
    result = chdids(v10, a2, &v16);
    v11 = v16;
LABEL_23:
    *a3 = v11;
    return result;
  }

  v12 = (unsigned __int16)(result + 21504) / 0x1Cu;
  uint64_t v13 = (unsigned __int16)(result + 21504) % 0x1Cu;
  switch(a2)
  {
    case 0:
    case 2:
      LOBYTE(v14) = -26;
      goto LABEL_21;
    case 1:
      unsigned __int16 v14 = (unsigned __int16)(result + 21504) / 0x24Cu + 48;
      goto LABEL_21;
    case 3:
      v15 = v12 - 21 * ((3121 * v12) >> 16) + 145;
      *a3 = v15;
      return (unsigned __int16)(result + 21504) % 0x1Cu != 0;
    case 4:
      LOBYTE(v14) = -25;
LABEL_21:
      *a3 = v14;
      result = 1LL;
      break;
    case 5:
      result = 0LL;
      v11 = v13 + 87;
      goto LABEL_23;
    default:
      goto LABEL_15;
  }

  return result;
}

LABEL_27:
  return v22;
}

LABEL_11:
    v10 = objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _textForPrintBraille:mode:locations:]( self,  "_textForPrintBraille:mode:locations:",  v8,  a4,  a5));
    goto LABEL_12;
  }

  if (!self->_supportsEightDot)
  {
    if (self->_contracted) {
      a4 = 3LL;
    }
    else {
      a4 = 1LL;
    }
    goto LABEL_11;
  }

  v4 = 0LL;
  for (i = 0LL; i != 256; ++i)
  {
    for (j = 0LL; j != 256; ++j)
    {
      if (*(void *)(*(void *)(chdiwa + 8 * i) + 8 * j)) {
        goto LABEL_14;
      }
      v8 = *(const char **)(*(void *)(chdiwa
      if (!v8) {
        goto LABEL_14;
      }
      v9 = (char *)chiini_strdup(v8);
      v10 = v9;
      if (*v9 == 123)
      {
        v11 = v9[1];
        if ((v11 & 0x80000000) == 0)
        {
          if ((_DefaultRuneLocale.__runetype[v11] & 0x8000) == 0) {
            goto LABEL_29;
          }
LABEL_28:
          v10[1] = __tolower(v11);
          goto LABEL_29;
        }

        if (__maskrune(v9[1], 0x8000uLL)) {
          goto LABEL_28;
        }
      }

LABEL_9:
  v10 = objc_claimAutoreleasedReturnValue( -[DBTDuxburyBrailleTranslator _eightDotTextForPrintBraille:locations:]( self,  "_eightDotTextForPrintBraille:locations:",  v8,  a5));
LABEL_12:
  v11 = (void *)v10;

  return v11;
}

  v7 = v2 > 27 && v2 != 32;
  if (v2 == 23 || v7)
  {
    v9 = *(_DWORD *)(result + 32336);
    if (v9 >= *(_DWORD *)(result + 32196))
    {
      result = (uint64_t)wdput((_DWORD *)result);
      if (*(_BYTE *)(v4 + 2616))
      {
        dxios_stream_putc(0x2Du, *(void **)(v3 + 32168));
        result = dxios_stream_putc(0xAu, *(void **)(v3 + 32168));
      }

      *(_BYTE *)(v4 + 2636) = 0;
      *(_DWORD *)(v4 + 2620) = 0;
      v9 = *(_DWORD *)(v4 + 2796);
    }

    *(_DWORD *)(v4 + 2796) = v9 + 1;
    *(_BYTE *)(v3 + v9 + 32200) = v2;
  }

  else if (v2 == 10)
  {
    wdput((_DWORD *)result);
    return nlput(v3);
  }

  else if (v2 == 32)
  {
    if (*(int *)(result + 32336) > 0 || (v8 = *(_DWORD *)(result + 32192), v8 >= 63))
    {
      result = (uint64_t)wdput((_DWORD *)result);
      v8 = *(_DWORD *)(v4 + 2652);
    }

    *(_DWORD *)(v4 + 2652) = v8 + 1;
  }

  return result;
}

LABEL_38:
  return v30;
}

void OUTLINED_FUNCTION_0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

void OUTLINED_FUNCTION_3( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

uint64_t ASCIIBrailleToUnicode(unsigned int a1)
{
  if (a1 > 0xFF) {
    return 0LL;
  }
  else {
    return (_Unicode[a1] + 10240);
  }
}

uint64_t UnicodeToASCIIBraille(unsigned int a1)
{
  if (a1 >> 8 == 40) {
    return _ASCIIBraille[a1 - 10240];
  }
  else {
    return 0LL;
  }
}

void *DBTWideCharBufferOfLength(size_t a1, int a2)
{
  if (a2) {
    return calloc(a1, 4uLL);
  }
  else {
    return malloc(4 * a1);
  }
}

void *DBTUniCharBufferOfLength(size_t a1, int a2)
{
  if (a2) {
    return calloc(a1, 2uLL);
  }
  else {
    return malloc(2 * a1);
  }
}

void DBTWideCharBufferFree(void *a1)
{
  if (a1) {
    free(a1);
  }
}

uint64_t DBTWideCharBufferLength(_DWORD *a1)
{
  if (!*a1) {
    return 0LL;
  }
  uint64_t v1 = 0LL;
  v2 = a1 + 1;
  do
    uint64_t result = v1 + 1;
  while (v2[v1++]);
  return result;
}

_DWORD *DBTWideCharBufferFromNSString(void *a1)
{
  id v1 = a1;
  id v2 = [v1 length];
  v3 = (unsigned __int16 *)malloc(2LL * (void)v2);
  objc_msgSend(v1, "getCharacters:range:", v3, 0, v2);
  v4 = malloc(4LL * (void)v2 + 4);
  v5 = v4;
  if (v2)
  {
    uint64_t v6 = v3;
    v7 = v4;
    v8 = (char *)v2;
    do
    {
      int v9 = *v6++;
      *v7++ = v9;
      --v8;
    }

    while (v8);
  }

  v4[(void)v2] = 0;
  free(v3);

  return v5;
}

id DBTNSStringFromWideCharBuffer(int *a1, uint64_t a2)
{
  v4 = malloc(2 * a2);
  v5 = v4;
  if (a2)
  {
    uint64_t v6 = v4;
    uint64_t v7 = a2;
    do
    {
      int v8 = *a1++;
      *v6++ = v8;
      --v7;
    }

    while (v7);
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v4,  a2));
  free(v5);
  return v9;
}

void DBTAppendNSStringIntoWideCharBufferAtOffset(void *a1, uint64_t a2, uint64_t a3)
{
  id v11 = a1;
  id v5 = [v11 length];
  uint64_t v6 = (unsigned __int16 *)malloc(2LL * (void)v5 + 2);
  objc_msgSend(v11, "getCharacters:range:", v6, 0, v5);
  if (v5)
  {
    uint64_t v7 = (_DWORD *)(a2 + 4 * a3);
    int v8 = v6;
    int v9 = (char *)v5;
    do
    {
      int v10 = *v8++;
      *v7++ = v10;
      --v9;
    }

    while (v9);
  }

  *(_DWORD *)(a2 + 4 * ((void)v5 + a3)) = 0;
  free(v6);
}

_DWORD *DBTWideCharBufferOfFullPath(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 stringByAppendingPathComponent:a2]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 stringByAppendingPathExtension:v5]);

  int v8 = DBTWideCharBufferFromNSString(v7);
  return v8;
}

void *allot(size_t a1)
{
  id v2 = malloc(a1);
  if (!v2)
  {
    if (dxc_allot_fail_hook) {
      dxc_allot_fail_hook(0LL, a1);
    }
    erm("allot", -1, 200, 0LL);
  }

  return v2;
}

void *reallot(void *a1, size_t a2)
{
  v4 = realloc(a1, a2);
  if (!v4)
  {
    if (dxc_allot_fail_hook) {
      dxc_allot_fail_hook(a1, a2);
    }
    erm("allot", -1, 200, 0LL);
  }

  return v4;
}

void *dxc_alloc(size_t a1)
{
  id v2 = malloc(a1);
  if (!v2 && dxc_allot_fail_hook) {
    dxc_allot_fail_hook(0LL, a1);
  }
  return v2;
}

void *dxc_realloc(void *a1, size_t a2)
{
  v3 = realloc(a1, a2);
  if (!v3 && dxc_allot_fail_hook) {
    dxc_allot_fail_hook(0LL, a2);
  }
  return v3;
}

void *bclrv(void *result, int a2)
{
  *result &= ~bmask[a2];
  return result;
}

uint64_t dxbin_engine_destroy(uint64_t a1)
{
  if (*(_DWORD *)a1) {
    return dxbin_engine_deactivate(a1);
  }
  return a1;
}

uint64_t dxbin_engine_deactivate(uint64_t a1)
{
  if (!*(_DWORD *)a1)
  {
    uint64_t v1 = 0xFFFFFFFFLL;
    goto LABEL_5;
  }

  if (*(int *)(a1 + 112) >= 1)
  {
    uint64_t v1 = 4294967294LL;
LABEL_5:
    *(_DWORD *)a1 = 0;
    goto LABEL_6;
  }

  int v3 = *(_DWORD *)(a1 + 116);
  *(_DWORD *)a1 = 0;
  if (v3 < 1) {
    return 0LL;
  }
  uint64_t v1 = 4294967293LL;
LABEL_6:
  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"biniq", v1);
  return v1;
}

double dxbin_engine_create(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 240) = 0LL;
  double result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = a2;
  return result;
}

uint64_t dxbin_engine_activate(uint64_t a1, uint64_t a2, int a3)
{
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 1LL;
  *(void *)(a1 + 112) = 0LL;
  *(_DWORD *)(a1 + 16) = a3;
  *(void *)(a1 + 120) = a2;
  if (!a3) {
    *(_DWORD *)(a1 + 16) = -1;
  }
  *(_DWORD *)a1 = 1;
  return 0LL;
}

uint64_t dxbin_engine_reactivate(uint64_t a1, uint64_t a2)
{
  return 0LL;
}

uint64_t dxbin_engine_getc(uint64_t a1)
{
  for (int i = *(_DWORD *)(a1 + 16); i == -1; int i = 0)
  {
    *(_DWORD *)(a1 + 200) = 0;
    *(_BYTE *)(a1 + 204) = 1;
    *(_BYTE *)(a1 + 128) = 0;
    *(void *)(a1 + 168) = 0xFF0000000000LL;
    *(_DWORD *)(a1 + 208) = lev1(a1);
    *(_DWORD *)(a1 + 232) = 0;
    *(_DWORD *)(a1 + 216) = 0;
    *(_BYTE *)(a1 + 240) = 0;
    int v3 = lev2(a1);
    *(_DWORD *)(a1 + 244) = v3;
    *(_DWORD *)(a1 + 16) = 0;
  }

  if (i == 2)
  {
    uint64_t v8 = *(void *)(a1 + 120);
    if (!v8) {
      goto LABEL_17;
    }
    uint64_t v9 = dxios_stream_getc(v8);
LABEL_15:
    if ((_DWORD)v9 != -1)
    {
      uint64_t v7 = v9;
      goto LABEL_18;
    }

LABEL_17:
    uint64_t v7 = 65280LL;
    goto LABEL_18;
  }

  if (i == 1)
  {
    uint64_t v10 = *(void *)(a1 + 120);
    if (!v10) {
      goto LABEL_17;
    }
    uint64_t v9 = dxios_stream_gcmt(v10);
    goto LABEL_15;
  }

  if (i) {
    return *(unsigned int *)(a1 + 96);
  }
  int v4 = *(_DWORD *)(a1 + 216);
  BOOL v5 = __OFSUB__(v4, 1);
  int v6 = v4 - 1;
  if (v6 < 0 != v5)
  {
    int v12 = *(_DWORD *)(a1 + 232);
    BOOL v5 = __OFSUB__(v12, 1);
    int v13 = v12 - 1;
    if (v13 < 0 == v5)
    {
      *(_DWORD *)(a1 + 232) = v13;
      uint64_t v7 = *(unsigned int *)(a1 + 4LL * v13 + 220);
      goto LABEL_18;
    }

    int v15 = *(_DWORD *)(a1 + 236);
    BOOL v5 = __OFSUB__(v15, 1);
    int v16 = v15 - 1;
    if (v16 < 0 != v5)
    {
      BOOL v17 = 0;
    }

    else
    {
      BOOL v17 = v16 == 0;
      *(_DWORD *)(a1 + 236) = v16;
    }

    uint64_t v7 = *(unsigned int *)(a1 + 244);
    uint64_t v18 = lev2(a1);
    *(_DWORD *)(a1 + 244) = v18;
    if (v7 >= 0xFF02)
    {
      int v19 = v7 - 65282;
      if (v18 < 0xFF02)
      {
        uint64_t v7 = v18;
      }

      else
      {
        LODWORD(v7) = v18;
        do
        {
          else {
            int v19 = v19 + v7 - 65532;
          }
          uint64_t v7 = lev2(a1);
          *(_DWORD *)(a1 + 244) = v7;
        }

        while (v7 > 0xFF01);
      }

      unsigned int v20 = *(_DWORD *)(a1 + 68);
      if ((_DWORD)v7 == 23 && v20 <= 1) {
        *(_DWORD *)(a1 + 236) = 3;
      }
      if (!v17 && v19)
      {
        int v21 = v19 - 1;
        if (v19 != 1)
        {
          uint64_t v7 = 32LL;
          switch(v20)
          {
            case 0u:
              goto LABEL_18;
            case 1u:
              if (!*(_BYTE *)(a1 + 240)) {
                goto LABEL_18;
              }
              *(_BYTE *)(a1 + 240) = 0;
              uint64_t v7 = *(unsigned int *)(a1 + 24);
              if ((_DWORD)v7 == 28)
              {
                *(_DWORD *)(a1 + 212) = 28;
                *(_DWORD *)(a1 + 216) = v21;
                goto LABEL_10;
              }

              *(_DWORD *)(a1 + 232) = 2;
              *(void *)(a1 + 220) = 0x2700000020LL;
              break;
            case 2u:
            case 4u:
              *(_DWORD *)(a1 + 212) = *(_DWORD *)(a1 + 24);
              *(_DWORD *)(a1 + 216) = v21;
              goto LABEL_18;
            case 3u:
              goto LABEL_52;
            default:
              goto LABEL_44;
          }

          goto LABEL_18;
        }

        if (v20 == 3)
        {
LABEL_52:
          *(_DWORD *)(a1 + 232) = 3;
          int v22 = *(_DWORD *)(a1 + 24);
          if (v22 == 28)
          {
            *(_DWORD *)(a1 + 232) = 2;
            *(void *)(a1 + 220) = 0x3E0000001FLL;
            uint64_t v7 = 28LL;
            goto LABEL_18;
          }

          *(_DWORD *)(a1 + 228) = v22;
          *(void *)(a1 + 220) = 0x3E00000020LL;
        }

        goto LABEL_10;
      }

            int v14 = 0;
          }

          else
          {
            int v16 = 88;
            switch(v11)
            {
              case 'X':
              case 'x':
                if (v9 == 108)
                {
                  int v16 = v11;
LABEL_103:
                  v42 = (unint64_t *)v68;
                  v68 += 2;
                  uint64_t v18 = *v42;
                  uint64_t v9 = 108;
                  id v11 = v16;
                  if (!*v42) {
                    goto LABEL_150;
                  }
                }

                else if (v9 == 104)
                {
                  BOOL v17 = v68;
                  v68 += 2;
                  uint64_t v18 = (int)*v17;
                  if (!*v17) {
                    goto LABEL_150;
                  }
                }

                else
                {
                  v43 = v68;
                  v68 += 2;
                  uint64_t v18 = *v43;
                  if (!*v43) {
                    goto LABEL_150;
                  }
                }

                v44 = 1LL;
                do
                {
                  v45 = v18 & 0xF | 0x30;
                  if (v45 <= 0x39) {
                    v46 = 0;
                  }
                  else {
                    v46 = v11 - 81;
                  }
                  v72[v44++ - 1] = v46 + v45;
                  v47 = v18 > 0xF;
                  v18 >>= 4;
                }

                while (v47);
                if ((v10 & 8) != 0)
                {
                  v72[v44 - 1] = v11;
                  v48 = v44 + 2;
                  ++v44;
                  goto LABEL_144;
                }

                goto LABEL_148;
              case 'Y':
              case 'Z':
              case '[':
              case '\\':
              case ']':
              case '^':
              case '_':
              case 'a':
              case 'b':
              case 'j':
              case 'k':
              case 'm':
              case 'q':
              case 'r':
              case 't':
              case 'v':
              case 'w':
                break;
              case 'c':
                if ((v10 & 0x50) == 0x40)
                {
                  int v22 = v15 - 1;
                  if (v15 != 1)
                  {
                    do
                    {
                      dxios_stream_putc(0x20u, a1);
                      --v22;
                    }

                    while (v22);
                  }

                  int v15 = 0LL;
                }

                v23 = v68;
                v68 += 2;
                dxios_stream_putc(*v23, a1);
                if ((v10 & 0x40) == 0) {
                  goto LABEL_17;
                }
                unsigned __int16 v24 = v15 - 1;
                if (v15 != 1)
                {
                  do
                  {
                    dxios_stream_putc(0x20u, a1);
                    --v24;
                  }

                  while (v24);
                }

                int v15 = 0LL;
                int v14 = 0;
                break;
              case 'd':
              case 'i':
                unsigned int v20 = v68;
                v68 += 2;
                if (v9 == 108) {
                  int v21 = *(void *)v20;
                }
                else {
                  int v21 = (int)*v20;
                }
                v10 |= (unint64_t)v21 >> 63;
                if (!v21) {
                  goto LABEL_150;
                }
                if (v21 >= 0) {
                  v49 = v21;
                }
                else {
                  v49 = -v21;
                }
                v44 = 1LL;
                do
                {
                  v72[v44++ - 1] = (v49 % 0xA) | 0x30;
                  v31 = v49 >= 0xA;
                  v49 /= 0xAuLL;
                }

                while (v31);
                goto LABEL_148;
              case 'e':
              case 'g':
                goto LABEL_49;
              case 'f':
                v25 = v67;
                if ((v10 & 0x80) == 0) {
                  v25 = 6;
                }
                v67 = v25;
                dbl_and_fcvt = dxios_get_dbl_and_fcvt();
                v27 = strlen(dbl_and_fcvt);
                if (v69) {
                  v28 = 2;
                }
                else {
                  v28 = 1;
                }
                v29 = v28 + v27;
                if ((v10 & 0x50) == 0x40)
                {
                  if (v15 != v29)
                  {
                    v30 = v29 - v15;
                    do
                    {
                      dxios_stream_putc(0x20u, a1);
                      v31 = __CFADD__(v30++, 1LL);
                    }

                    while (!v31);
                  }

                  int v15 = -1LL;
                }

                else
                {
                  v15 -= v29;
                }

                v47 = v70-- < 1;
                if (!v47)
                {
                  do
                  {
                    v50 = *dbl_and_fcvt++;
                    dxios_stream_putc(v50, a1);
                    v51 = v70--;
                  }

                  while (v51 > 0);
                }

                dxios_stream_putc(0x2Eu, a1);
                v52 = *dbl_and_fcvt;
                if (*dbl_and_fcvt)
                {
                  v53 = (unsigned __int8 *)(dbl_and_fcvt + 1);
                  do
                  {
                    dxios_stream_putc(v52, a1);
                    v54 = *v53++;
                    v52 = v54;
                  }

                  while (v54);
                }

                if ((v10 & 0x40) == 0) {
                  goto LABEL_170;
                }
                while (v15)
                {
                  --v15;
                  dxios_stream_putc(0x20u, a1);
                }

                goto LABEL_173;
              case 'h':
              case 'l':
                return 0LL;
              case 'n':
                int v14 = 0;
                v32 = v68;
                v68 += 2;
                **(_DWORD **)v32 = 0;
                break;
              case 'o':
                if (v9 == 108)
                {
                  v56 = (unint64_t *)v68;
                  v68 += 2;
                  v34 = *v56;
                  if (!*v56) {
                    goto LABEL_150;
                  }
                }

                else if (v9 == 104)
                {
                  v33 = v68;
                  v68 += 2;
                  v34 = (int)*v33;
                  if (!*v33) {
                    goto LABEL_150;
                  }
                }

                else
                {
                  v57 = v68;
                  v68 += 2;
                  v34 = *v57;
                  if (!*v57) {
                    goto LABEL_150;
                  }
                }

                v44 = 1LL;
                do
                {
                  v72[v44++ - 1] = v34 & 7 | 0x30;
                  v47 = v34 > 7;
                  v34 >>= 3;
                }

                while (v47);
                if ((v10 & 8) != 0)
                {
                  v48 = v44 + 1;
LABEL_144:
                  v72[v44 - 1] = 48;
                  v44 = v48;
                }

                goto LABEL_148;
              case 'p':
                goto LABEL_103;
              case 's':
                v35 = (const char **)v68;
                v68 += 2;
                v36 = *v35;
                v37 = strlen(*v35);
                if (((v67 < v37) & (v10 >> 7)) != 0) {
                  v38 = v67;
                }
                else {
                  v38 = v37;
                }
                if ((v10 & 0x50) != 0x40)
                {
                  v15 -= v38;
                  if (!v38) {
                    goto LABEL_133;
                  }
                  do
                  {
LABEL_132:
                    --v38;
                    v55 = *v36++;
                    dxios_stream_putc(v55, a1);
                  }

                  while (v38);
                  goto LABEL_133;
                }

                if (v15 != v38)
                {
                  v39 = v38 - v15;
                  do
                  {
                    dxios_stream_putc(0x20u, a1);
                    v31 = __CFADD__(v39++, 1LL);
                  }

                  while (!v31);
                }

                int v15 = -1LL;
                if (v38) {
                  goto LABEL_132;
                }
LABEL_133:
                if ((v10 & 0x40) != 0)
                {
                  while (v15)
                  {
                    --v15;
                    dxios_stream_putc(0x20u, a1);
                  }

LABEL_44:
      *(_DWORD *)(a1 + 244) = lev2(a1);
    }

    *(_BYTE *)(a1 + 240) = (_DWORD)v7 == *(_DWORD *)(a1 + 28);
    goto LABEL_18;
  }

  uint64_t v7 = *(unsigned int *)(a1 + 212);
  if ((_DWORD)v7 != 4)
  {
    int v14 = *(_DWORD *)(a1 + 24);
    if (v14 == 28)
    {
      *(_DWORD *)(a1 + 216) = v6;
      uint64_t v7 = 30LL;
    }

    else if ((_DWORD)v7 == v14)
    {
      *(_DWORD *)(a1 + 212) = 39;
    }

    else
    {
      *(_DWORD *)(a1 + 212) = v14;
      *(_DWORD *)(a1 + 216) = v6;
      uint64_t v7 = 39LL;
    }

    goto LABEL_18;
  }

  *(_DWORD *)(a1 + 216) = v6;
LABEL_10:
  uint64_t v7 = 32LL;
LABEL_18:
  *(_DWORD *)(a1 + 96) = v7;
  return v7;
}

uint64_t lev1(uint64_t a1)
{
  int v3 = (int *)(a1 + 172);
  uint64_t v2 = *(unsigned int *)(a1 + 172);
  if ((_DWORD)v2 == 12)
  {
    uint64_t v7 = *(int *)(a1 + 176);
    uint64_t v8 = v7 + 1;
    *(_DWORD *)(a1 + 176) = v7 + 1;
    uint64_t v2 = *(char *)(a1 + 44 + v7);
    LODWORD(v8) = *(unsigned __int8 *)(a1 + 44 + v8);
    uint64_t result = v2;
    if ((_DWORD)v8) {
      return result;
    }
    goto LABEL_10;
  }

  if ((_DWORD)v2 == 65281) {
    return v2;
  }
  if ((_DWORD)v2 != 65280)
  {
LABEL_10:
    int *v3 = 65280;
    return v2;
  }

  int v4 = lev0(a1);
  uint64_t result = 65281LL;
  if (v4 != 65281)
  {
    int v6 = 0;
    while (chibdi(v4, v6, (int *)&v19))
    {
      ++v6;
      int v4 = lev0(a1);
      uint64_t result = 65281LL;
      if (v4 == 65281) {
        return result;
      }
    }

    uint64_t result = v19;
    if (v19 < 0x21 || v19 == 65407)
    {
      *(_DWORD *)(a1 + 172) = v19;
      unsigned int v19 = 65282;
      while (1)
      {
        if ((int)result <= 11)
        {
          if ((_DWORD)result != 9)
          {
            if ((_DWORD)result == 10)
            {
              ++*(void *)(a1 + 104);
              uint64_t v2 = 10LL;
              if (*(_BYTE *)(a1 + 20)) {
                goto LABEL_10;
              }
            }

            goto LABEL_49;
          }

          int v11 = *(_DWORD *)(a1 + 72);
          if (v11 < 0)
          {
            int v14 = *(_DWORD *)(a1 + 116);
            if (v14 != 0x7FFFFFFF) {
              *(_DWORD *)(a1 + 116) = v14 + 1;
            }
LABEL_33:
            unsigned int v10 = v19;
            goto LABEL_34;
          }

          unsigned int v10 = v19 + v11;
        }

        else
        {
          if ((_DWORD)result == 12)
          {
            int v12 = *(char *)(a1 + 44);
            if (v12 > 31)
            {
              *(_DWORD *)(a1 + 176) = 0;
              uint64_t v18 = v19 + 1;
              uint64_t v2 = 12LL;
LABEL_50:
              uint64_t result = v18;
              if (v18 <= 0xFF02)
              {
                uint64_t result = v2;
              }

              return result;
            }

            if (v12 == 21)
            {
              int v13 = *(_DWORD *)(a1 + 112);
              if (v13 != 0x7FFFFFFF) {
                *(_DWORD *)(a1 + 112) = v13 + 1;
              }
            }

            goto LABEL_33;
          }

          if ((_DWORD)result != 32)
          {
            if ((_DWORD)result == 65407)
            {
              uint64_t result = 65280LL;
              int *v3 = 65280;
            }

LABEL_49:
            uint64_t v18 = v19;
            uint64_t v2 = result;
            goto LABEL_50;
          }

          unsigned int v10 = v19 + 1;
        }

        unsigned int v19 = v10;
LABEL_34:
        if (v10 >= 0xFFFC) {
          unsigned int v19 = v10 - 250;
        }
        int v15 = lev0(a1);
        if (v15 != 65281)
        {
          int v16 = 0;
          do
          {
            ++v16;
            int v15 = lev0(a1);
          }

          while (v15 != 65281);
        }

        uint64_t result = *v3;
      }
    }
  }

  return result;
}

        *v32 = 0;
        v37 = v10;
        v38 = 2 * v10;
        __chkstk_darwin();
        v40 = (char *)&v69 - v39;
        v41 = strlen(v30);
        if (dxios_stream_activate_buf((uint64_t)v83, 1u, (uint64_t)v30, v41))
        {
          uint64_t v7 = 5LL;
          v42 = v76;
        }

        else
        {
          v43 = dxios_stream_activate_buf((uint64_t)v82, 3u, (uint64_t)v40, (v38 - 1));
          v42 = v76;
          if (v43) {
            uint64_t v7 = 7LL;
          }
          else {
            uint64_t v7 = 8 * (dxbte_engine_process(a1 + 184, (uint64_t)v83, (uint64_t)v82, &v79) != 0);
          }
        }

        v84 = 0LL;
        if (v82[0])
        {
          dxios_stream_deactivate((uint64_t)v82, &v84);
          v44 = v84;
          v40[v84] = 0;
        }

        else
        {
          v44 = 0LL;
        }

        v45 = *(void *)(v42 + 24);
        if (v45)
        {
          v88 = 0LL;
          v86 = 0LL;
          dxios_stream_create((uint64_t)v89, *(void *)(v45 + 29480));
          dxios_stream_create((uint64_t)v87, *(void *)(v45 + 29480));
          dxbte_state_reset((uint64_t)v85);
          if (!dxios_stream_activate_buf((uint64_t)v89, 1u, (uint64_t)v40, v44)
            && !dxios_stream_activate_autobuf((uint64_t)v87, 3u, (v38 - 1), 0LL)
            && !dxbte_engine_process(v45, (uint64_t)v89, (uint64_t)v87, v85)
            && !dxios_stream_capture_buf((uint64_t)v87, &v88, 0, &v86))
          {
            v46 = v86;
            if (v86 > (v38 - 1))
            {
              v86 = (v38 - 1);
              v46 = v86;
            }

            memcpy(v40, (const void *)v88, v46);
          }

          dxios_stream_destroy(v89);
          dxios_stream_destroy(v87);
          v44 = v86;
          v84 = v86;
          v40[v86] = 0;
        }

        v47 = (unsigned __int16 *)v37;
        v48 = *(void *)(v42 + 16);
        if (v48)
        {
          v87[0] = 0LL;
          v88 = 0LL;
          dxios_stream_create((uint64_t)v85, *(void *)(v48 + 8));
          dxios_stream_create((uint64_t)v89, *(void *)(v48 + 8));
          if (!dxios_stream_activate_buf((uint64_t)v85, 1u, (uint64_t)v40, v44)
            && !dxios_stream_activate_autobuf((uint64_t)v89, 3u, (v38 - 1), 0LL)
            && !dxscb_engine_process(v48, (uint64_t)v89, (uint64_t)v85)
            && !dxios_stream_capture_buf((uint64_t)v89, v87, 0, &v88))
          {
            v49 = v88;
            if (v88 > (v38 - 1))
            {
              v88 = (v38 - 1);
              v49 = v88;
            }

            memcpy(v40, v87[0], v49);
          }

          dxios_stream_destroy(v85);
          dxios_stream_destroy(v89);
          v84 = v88;
          v40[v88] = 0;
        }

        v50 = 0;
        v85[0] = (uint64_t)v12;
        v51 = *v40;
        v72 = v47;
        if (v51)
        {
          v52 = (unint64_t)&v12[(void)v47 - 1];
          v53 = 0LL;
          if (v52 > (unint64_t)v12)
          {
            v54 = 0;
            v55 = 0;
            v53 = 0LL;
            v50 = 0;
            LODWORD(v75) = 0;
            int v12 = v78;
            do
            {
              if (v51 == 28)
              {
                if (v40[1] == 120 && v40[2] == 126 && v40[3] == 126 && v40[4] && v40[5] && v40[6] && v40[7] == 31)
                {
                  void *v12 = (char)((v40[4] << 6) + 8 * v40[5] + v40[6] + 80);
LABEL_111:
                  v61 = v77;
                  v60 = (uint64_t)v78;
                  goto LABEL_131;
                }
              }

              else if (v51 == 23 && v40[1])
              {
                if (!v54) {
                  v55 = v50;
                }
                v50 = v50 + (char)v40[1] - 96;
                v54 = 1;
                ++v40;
                goto LABEL_134;
              }

              v56 = strlen(v40);
              if (v56 < 5) {
                goto LABEL_109;
              }
              v57 = *(_DWORD *)v40 == 1768055580 && v40[4] == 31;
              if (v57 || (*(_DWORD *)v40 == 1769501724 ? (v58 = v40[4] == 31) : (v58 = 0), v58))
              {
                v54 = 0;
                v40 += 4;
                goto LABEL_134;
              }

              if (v56 >= 6 && (*(_DWORD *)v40 == 1852535580 ? (v59 = v40[4] == 48) : (v59 = 0), v59))
              {
                v54 = 0;
                v40 += 5;
              }

              else
              {
LABEL_109:
                if ((v51 & 0x80) == 0
                  && (v51 - 29) >= 2
                  && (_DefaultRuneLocale.__runetype[v51] & 0x200) != 0)
                {
                  void *v12 = v51;
                  goto LABEL_111;
                }

                v89[0] = 0;
                v62 = *v40;
                if (!*v40) {
                  goto LABEL_120;
                }
                v63 = 0LL;
                do
                {
                  v62 = v40[++v63];
                }

                while (v62);
                v40 += v63;
                LOWORD(v62) = v89[0];
                if (v89[0] != 29)
                {
                  if (v89[0] == 60481)
                  {
                    void *v12 = 45;
                    v61 = v77;
                  }

                  else
                  {
LABEL_120:
                    v61 = v77;
                    v64 = chdiu(v62);
                    void *v12 = v64;
                    if (*(_DWORD *)(v76 + 36))
                    {
                      if (v64 == 28)
                      {
                        LODWORD(v75) = 1;
                      }

                      else if (v64 == 31)
                      {
                        LODWORD(v75) = 0;
                      }

                      else if (v64 >= 32 && v64 <= 0x7E && !(_DWORD)v75)
                      {
                        LODWORD(v75) = 0;
                        void *v12 = unicodeBraille[v64];
                      }
                    }
                  }

                  v60 = (uint64_t)v78;
LABEL_131:
                  compound_korean_glyphs(v85, v60);
                  if (v61) {
                    *(_WORD *)(v61 + 2 * v53++) = v55;
                  }
                  v54 = 0;
                  int v12 = (int *)(v85[0] + 4);
                  v85[0] += 4LL;
                  goto LABEL_134;
                }

                v54 = 0;
              }

        if (!*v21) {
          return 1LL;
        }
LABEL_50:
        unsigned __int16 v24 = "cb";
        if (*a2)
        {
          v25 = 0LL;
          v26 = *a2;
          while (v25 != 2)
          {
            v26 = a2[++v25];
            if (!v26)
            {
              unsigned __int16 v24 = &aCb[v25];
              goto LABEL_56;
            }
          }

          return 1LL;
        }

uint64_t lev2(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 200);
  if (v2 > 0)
  {
    unsigned int v3 = v2 - 1;
    *(_DWORD *)(a1 + 200) = v3;
    return *(unsigned int *)(a1 + 4LL * v3 + 180);
  }

  while (1)
  {
    while (1)
    {
      uint64_t v4 = *(unsigned int *)(a1 + 208);
      if (*(_BYTE *)(a1 + 204)) {
        break;
      }
      int v6 = lev1(a1);
      *(_DWORD *)(a1 + 208) = v6;
      if ((_DWORD)v4 == 10)
      {
        *(_BYTE *)(a1 + 204) = 1;
        int v7 = *(_DWORD *)(a1 + 32);
        if (v7 == 1) {
          return 65283LL;
        }
        if (v7 == 2)
        {
          *(_DWORD *)(a1 + 200) = 3;
          *(_DWORD *)(a1 + 188) = *(_DWORD *)(a1 + 24);
          *(void *)(a1 + 180) = 0x3C0000FF03LL;
          return 65283LL;
        }
      }

      else
      {
        int v8 = *(_DWORD *)(a1 + 64);
        if (v8 < 1 || (_DWORD)v4 != 45) {
          return v4;
        }
        if (v6 != 10)
        {
          uint64_t v4 = 45LL;
          if (v6 == 45 && v8 == 2)
          {
            *(_DWORD *)(a1 + 208) = lev1(a1);
            *(_DWORD *)(a1 + 200) = 1;
            *(_DWORD *)(a1 + 180) = 45;
          }

          return v4;
        }

        *(_DWORD *)(a1 + 208) = lev1(a1);
      }
    }

    if ((_DWORD)v4 != 10) {
      break;
    }
    if ((*(_DWORD *)(a1 + 60) | 2) == 3) {
      goto LABEL_20;
    }
LABEL_15:
    *(_BYTE *)(a1 + 204) = 0;
  }

  do
  {
    do
    {
LABEL_20:
      unsigned int v9 = lev1(a1);
      *(_DWORD *)(a1 + 208) = v9;
    }

    while (v9 == 10);
  }

  while (v9 > 0xFF01);
  *(_BYTE *)(a1 + 204) = 0;
  int v10 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)(a1 + 200) = v10 + 2;
  *(_DWORD *)(a1 + 180 + 4LL * (v10 + 1)) = *(_DWORD *)(a1 + 24);
  uint64_t v4 = 65283LL;
  *(_DWORD *)(a1 + 180) = 65283;
  uint64_t v11 = *(unsigned int *)(a1 + 40);
  if ((int)v11 >= 1)
  {
    uint64_t v12 = (v11 + 1);
    int v13 = (unsigned __int8 *)(v11 + a1 + 35);
    int v14 = (_DWORD *)(a1 + 184);
    uint64_t v15 = v12 - 1;
    do
    {
      int v16 = *v13--;
      *v14++ = v16;
      --v15;
    }

    while (v15);
    return 65283LL;
  }

  return v4;
}

uint64_t dxbin_code_in_str(uint64_t a1, _BYTE *a2, char *a3, int a4)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v4 = a2;
  LOBYTE(v5) = *a2;
  if (!*a2) {
    return 0LL;
  }
  do
  {
    ++v4;
    while (1)
    {
      BOOL v9 = *(char *)(a1 + 24) == (char)v5;
      int v5 = *v4;
      if (v9) {
        break;
      }
      ++v4;
      if (!v5) {
        return 0LL;
      }
    }

    for (int i = a3; ; ++i)
    {
      __darwin_ct_rune_t v11 = __tolower((char)v5);
      char v12 = *i;
      if (v11 != __tolower(*i)) {
        break;
      }
      int v13 = *++v4;
      int v5 = v13;
      if (a4 == 1 && v5 == 126) {
        return 1LL;
      }
    }

    if (!a4 && !v12) {
      return 1LL;
    }
    if (!v12)
    {
      uint64_t result = 1LL;
    }

    uint64_t result = 0LL;
    LOBYTE(v5) = *v4;
  }

  while (*v4);
  return result;
}

uint64_t lev0(uint64_t a1)
{
  void (*v8)(void *__return_ptr, void, uint64_t, void, void);
  char v9;
  void v11[4];
  if (!*(_BYTE *)(a1 + 128))
  {
    uint64_t v3 = dxios_stream_gcmt(*(void *)(a1 + 120));
    uint64_t v1 = v3;
    int v4 = *(_DWORD *)(a1 + 168);
    switch(v4)
    {
      case 0:
        if ((_DWORD)v3 == *(_DWORD *)(a1 + 24))
        {
          int v6 = 1;
          goto LABEL_8;
        }

        return v1;
      case 1:
      case 2:
      case 3:
        __darwin_ct_rune_t v5 = lnb[v4 - 1];
        if ((_DWORD)v1 == v5) {
          goto LABEL_7;
        }
        if ((_DWORD)v1 == __toupper(v5))
        {
          int v4 = *(_DWORD *)(a1 + 168);
LABEL_7:
          int v6 = v4 + 1;
          goto LABEL_8;
        }

        if (v4 != 1 || (v1 & 0xFFFFFFDF) != 0x45) {
          goto LABEL_28;
        }
        int v6 = 5;
        goto LABEL_8;
      case 4:
        *(_BYTE *)(a1 + 128) = 1;
        goto LABEL_28;
      case 5:
        if ((v3 & 0xFFFFFFDF) == 0x45)
        {
          int v6 = 7;
        }

        else
        {
          if ((v3 & 0xFFFFFFDF) != 0x53)
          {
LABEL_28:
            *(_DWORD *)(a1 + 168) = 0;
            return v1;
          }

          int v6 = 6;
        }

LABEL_8:
        *(_DWORD *)(a1 + 168) = v6;
        return v1;
      case 6:
      case 7:
        if ((_DWORD)v3 != 126) {
          goto LABEL_28;
        }
        *(_DWORD *)(a1 + 164) = 0;
        *(_DWORD *)(a1 + 168) = v4 + 2;
        return v1;
      case 8:
      case 9:
        uint64_t v7 = *(int *)(a1 + 164);
        if ((int)v3 <= 31)
        {
          *(_BYTE *)(a1 + v7 + 129) = 0;
          int v8 = *(void (**)(void *__return_ptr, void, uint64_t, void, void))(a1 + 80);
          if (v8)
          {
            v8(v11, *(void *)(a1 + 88), a1 + 129, (*(_DWORD *)(a1 + 168) - 8), 0LL);
            BOOL v9 = dxbin_code_in_str(a1, (_BYTE *)v11[3], "lnb", 1);
          }

          else
          {
            BOOL v9 = 0;
          }

          *(_BYTE *)(a1 + 128) = v9;
          goto LABEL_28;
        }

        *(_DWORD *)(a1 + 164) = v7 + 1;
        *(_BYTE *)(a1 + v7 + 129) = v3;
        return v1;
      default:
        goto LABEL_28;
    }
  }

  return 65281LL;
}

    if (a4)
    {
      if (v11 - (_BYTE *)a2 < v9) {
        *v11++ = v8;
      }
LABEL_37:
      a4 = 1;
      goto LABEL_42;
    }

    if (!strncmp(a1, "COMBINING", 9uLL))
    {
      if (v11 - (_BYTE *)a2 < v10) {
        *(_DWORD *)__darwin_ct_rune_t v11 = 1;
      }
      int v13 = a1 + 9;
    }

    else
    {
      if (v11 - (_BYTE *)a2 > v10) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)__darwin_ct_rune_t v11 = strtol(a1, &__endptr, 16);
      int v13 = __endptr;
      if (__endptr == a1) {
        return 0xFFFFFFFFLL;
      }
    }

    a4 = 0;
    v11 += 4;
    a1 = v13 - 1;
LABEL_42:
    int v14 = *++a1;
    int v8 = v14;
    if (!v14) {
      return 0LL;
    }
  }

  if (v8 == 123) {
    goto LABEL_16;
  }
  if (v8 != 124)
  {
    if (v8 != 125) {
      goto LABEL_8;
    }
LABEL_14:
    if (v11 - (_BYTE *)a2 >= v9)
    {
      a4 = 0;
      goto LABEL_42;
    }

    a4 = 0;
LABEL_19:
    *v11++ = v8;
    goto LABEL_42;
  }

  if (!a4) {
    goto LABEL_42;
  }
  char v12 = a1[1];
  if ((v12 | 2) == 0x7E)
  {
    if (v11 - (_BYTE *)a2 < v9) {
      *v11++ = v12;
    }
    a4 = 1;
    ++a1;
    goto LABEL_42;
  }

  if ((v11[1] - 48) <= 9 && (v11[2] - 48) <= 9 && (v11[3] - 48) <= 9)
  {
    if (v11 - (_BYTE *)a2 < v9) {
      *v11++ = 10 * a1[2] + 100 * v12 + a1[3] + 48;
    }
    a1 += 3;
    goto LABEL_37;
  }

  return 0xFFFFFFFFLL;
}

uint64_t BRLDISP_Create( void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, __int32 *a6, __int32 *a7, __int32 *a8)
{
  int v13 = 0LL;
  if (!a1 || *a1) {
    return 14LL;
  }
  uint64_t result = BRLTRN_CreateW(a6, a7, (uint64_t *)&v13, a5, a8);
  if (!(_DWORD)result)
  {
    __darwin_ct_rune_t v11 = (char *)malloc(0x18uLL);
    if (v11)
    {
      char v12 = v11;
      *((_DWORD *)v11 + 5) = 0;
      *(void *)(v11 + 12) = 0LL;
      *(void *)__darwin_ct_rune_t v11 = v13;
      *((_DWORD *)v11 + 2) = a4;
      LoadEightDotTable(v11);
      uint64_t result = 0LL;
      *a1 = v12;
    }

    else
    {
      BRLTRN_Destroy(v13);
      return 23LL;
    }
  }

  return result;
}

void *LoadEightDotTable(void *a1)
{
  for (int i = 0; i != 256; ++i)
    LoadEightDotPatternBin(a1, i + 10240, i + 10240);
  LoadEightDotPattern(a1, 32, "");
  LoadEightDotPattern(a1, 33, "2346");
  LoadEightDotPattern(a1, 34, "5");
  LoadEightDotPattern(a1, 35, "3456");
  LoadEightDotPattern(a1, 36, "1246");
  LoadEightDotPattern(a1, 37, "146");
  LoadEightDotPattern(a1, 38, "12346");
  LoadEightDotPattern(a1, 39, "3");
  LoadEightDotPattern(a1, 40, "12356");
  LoadEightDotPattern(a1, 41, "23456");
  LoadEightDotPattern(a1, 42, "16");
  LoadEightDotPattern(a1, 43, "346");
  LoadEightDotPattern(a1, 44, "6");
  LoadEightDotPattern(a1, 45, "36");
  LoadEightDotPattern(a1, 46, "46");
  LoadEightDotPattern(a1, 47, "34");
  LoadEightDotPattern(a1, 48, "356");
  LoadEightDotPattern(a1, 49, "2");
  LoadEightDotPattern(a1, 50, "23");
  LoadEightDotPattern(a1, 51, "25");
  LoadEightDotPattern(a1, 52, "256");
  LoadEightDotPattern(a1, 53, "26");
  LoadEightDotPattern(a1, 54, "235");
  LoadEightDotPattern(a1, 55, "2356");
  LoadEightDotPattern(a1, 56, "236");
  LoadEightDotPattern(a1, 57, "35");
  LoadEightDotPattern(a1, 58, "156");
  LoadEightDotPattern(a1, 59, "56");
  LoadEightDotPattern(a1, 60, "126");
  LoadEightDotPattern(a1, 61, "123456");
  LoadEightDotPattern(a1, 62, "345");
  LoadEightDotPattern(a1, 63, "1456");
  LoadEightDotPattern(a1, 64, "47");
  LoadEightDotPattern(a1, 65, "17");
  LoadEightDotPattern(a1, 66, "127");
  LoadEightDotPattern(a1, 67, "147");
  LoadEightDotPattern(a1, 68, "1457");
  LoadEightDotPattern(a1, 69, "157");
  LoadEightDotPattern(a1, 70, "1247");
  LoadEightDotPattern(a1, 71, "12457");
  LoadEightDotPattern(a1, 72, "1257");
  LoadEightDotPattern(a1, 73, "247");
  LoadEightDotPattern(a1, 74, "2457");
  LoadEightDotPattern(a1, 75, "137");
  LoadEightDotPattern(a1, 76, "1237");
  LoadEightDotPattern(a1, 77, "1347");
  LoadEightDotPattern(a1, 78, "13457");
  LoadEightDotPattern(a1, 79, "1357");
  LoadEightDotPattern(a1, 80, "12347");
  LoadEightDotPattern(a1, 81, "123457");
  LoadEightDotPattern(a1, 82, "12357");
  LoadEightDotPattern(a1, 83, "2347");
  LoadEightDotPattern(a1, 84, "23457");
  LoadEightDotPattern(a1, 85, "1367");
  LoadEightDotPattern(a1, 86, "12367");
  LoadEightDotPattern(a1, 87, "24567");
  LoadEightDotPattern(a1, 88, "13467");
  LoadEightDotPattern(a1, 89, "134567");
  LoadEightDotPattern(a1, 90, "13567");
  LoadEightDotPattern(a1, 91, "2467");
  LoadEightDotPattern(a1, 92, "12567");
  LoadEightDotPattern(a1, 93, "124567");
  LoadEightDotPattern(a1, 94, "457");
  LoadEightDotPattern(a1, 95, "4567");
  LoadEightDotPattern(a1, 96, "4");
  LoadEightDotPattern(a1, 97, "1");
  LoadEightDotPattern(a1, 98, "12");
  LoadEightDotPattern(a1, 99, "14");
  LoadEightDotPattern(a1, 100, "145");
  LoadEightDotPattern(a1, 101, "15");
  LoadEightDotPattern(a1, 102, "124");
  LoadEightDotPattern(a1, 103, "1245");
  LoadEightDotPattern(a1, 104, "125");
  LoadEightDotPattern(a1, 105, "24");
  LoadEightDotPattern(a1, 106, "245");
  LoadEightDotPattern(a1, 107, "13");
  LoadEightDotPattern(a1, 108, "123");
  LoadEightDotPattern(a1, 109, "134");
  LoadEightDotPattern(a1, 110, "1345");
  LoadEightDotPattern(a1, 111, "135");
  LoadEightDotPattern(a1, 112, "1234");
  LoadEightDotPattern(a1, 113, "12345");
  LoadEightDotPattern(a1, 114, "1235");
  LoadEightDotPattern(a1, 115, "234");
  LoadEightDotPattern(a1, 116, "2345");
  LoadEightDotPattern(a1, 117, "136");
  LoadEightDotPattern(a1, 118, "1236");
  LoadEightDotPattern(a1, 119, "2456");
  LoadEightDotPattern(a1, 120, "1346");
  LoadEightDotPattern(a1, 121, "13456");
  LoadEightDotPattern(a1, 122, "1356");
  LoadEightDotPattern(a1, 123, "246");
  LoadEightDotPattern(a1, 124, "1256");
  LoadEightDotPattern(a1, 125, "12456");
  LoadEightDotPattern(a1, 126, "45");
  LoadEightDotPattern(a1, 127, "456");
  LoadEightDotPattern(a1, 129, "12568");
  LoadEightDotPattern(a1, 134, "1248");
  LoadEightDotPattern(a1, 137, "248");
  LoadEightDotPattern(a1, 141, "257");
  LoadEightDotPattern(a1, 143, "12467");
  LoadEightDotPattern(a1, 144, "124678");
  LoadEightDotPattern(a1, 151, "368");
  LoadEightDotPattern(a1, 155, "12345");
  LoadEightDotPattern(a1, 157, "468");
  LoadEightDotPattern(a1, 158, "235678");
  LoadEightDotPattern(a1, 160, "");
  LoadEightDotPattern(a1, 161, "235");
  LoadEightDotPattern(a1, 162, "58");
  LoadEightDotPattern(a1, 163, "467");
  LoadEightDotPattern(a1, 164, "4678");
  LoadEightDotPattern(a1, 165, "468");
  LoadEightDotPattern(a1, 166, "158");
  LoadEightDotPattern(a1, 167, "357");
  LoadEightDotPattern(a1, 168, "48");
  LoadEightDotPattern(a1, 169, "123468");
  LoadEightDotPattern(a1, 170, "1258");
  LoadEightDotPattern(a1, 171, "1235678");
  LoadEightDotPattern(a1, 172, "25678");
  LoadEightDotPattern(a1, 173, "368");
  LoadEightDotPattern(a1, 174, "12358");
  LoadEightDotPattern(a1, 175, "458");
  LoadEightDotPattern(a1, 176, "4568");
  LoadEightDotPattern(a1, 177, "23578");
  LoadEightDotPattern(a1, 178, "128");
  LoadEightDotPattern(a1, 179, "148");
  LoadEightDotPattern(a1, 180, "568");
  LoadEightDotPattern(a1, 181, "1348");
  LoadEightDotPattern(a1, 182, "1458");
  LoadEightDotPattern(a1, 183, "37");
  LoadEightDotPattern(a1, 184, "68");
  LoadEightDotPattern(a1, 185, "18");
  LoadEightDotPattern(a1, 186, "2458");
  LoadEightDotPattern(a1, 187, "2345678");
  LoadEightDotPattern(a1, 188, "1368");
  LoadEightDotPattern(a1, 189, "12368");
  LoadEightDotPattern(a1, 190, "13468");
  LoadEightDotPattern(a1, 191, "38");
  LoadEightDotPattern(a1, 192, "23678");
  LoadEightDotPattern(a1, 193, "1235678");
  LoadEightDotPattern(a1, 194, "167");
  LoadEightDotPattern(a1, 195, "3467");
  LoadEightDotPattern(a1, 196, "567");
  LoadEightDotPattern(a1, 197, "34567");
  LoadEightDotPattern(a1, 198, "3457");
  LoadEightDotPattern(a1, 199, "123467");
  LoadEightDotPattern(a1, 200, "3578");
  LoadEightDotPattern(a1, 201, "238");
  LoadEightDotPattern(a1, 202, "1267");
  LoadEightDotPattern(a1, 203, "2358");
  LoadEightDotPattern(a1, 204, "57");
  LoadEightDotPattern(a1, 205, "3478");
  LoadEightDotPattern(a1, 206, "1467");
  LoadEightDotPattern(a1, 207, "23568");
  LoadEightDotPattern(a1, 13, "1458");
  LoadEightDotPattern(a1, 208, "3567");
  LoadEightDotPattern(a1, 209, "2567");
  LoadEightDotPattern(a1, 210, "578");
  LoadEightDotPattern(a1, 211, "34678");
  LoadEightDotPattern(a1, 212, "14567");
  LoadEightDotPattern(a1, 213, "267");
  LoadEightDotPattern(a1, 214, "358");
  LoadEightDotPattern(a1, 215, "2348");
  LoadEightDotPattern(a1, 216, "2467");
  LoadEightDotPattern(a1, 217, "35678");
  LoadEightDotPattern(a1, 218, "2345678");
  LoadEightDotPattern(a1, 219, "1567");
  LoadEightDotPattern(a1, 220, "2368");
  LoadEightDotPattern(a1, 221, "124568");
  LoadEightDotPattern(a1, 222, "2357");
  LoadEightDotPattern(a1, 223, "34568");
  LoadEightDotPattern(a1, 224, "123568");
  LoadEightDotPattern(a1, 225, "168");
  LoadEightDotPattern(a1, 226, "1678");
  LoadEightDotPattern(a1, 227, "34678");
  LoadEightDotPattern(a1, 228, "3458");
  LoadEightDotPattern(a1, 229, "345678");
  LoadEightDotPattern(a1, 230, "34578");
  LoadEightDotPattern(a1, 231, "1234678");
  LoadEightDotPattern(a1, 232, "23468");
  LoadEightDotPattern(a1, 233, "1268");
  LoadEightDotPattern(a1, 234, "12678");
  LoadEightDotPattern(a1, 235, "12468");
  LoadEightDotPattern(a1, 236, "348");
  LoadEightDotPattern(a1, 237, "1468");
  LoadEightDotPattern(a1, 238, "14678");
  LoadEightDotPattern(a1, 239, "124568");
  LoadEightDotPattern(a1, 240, "23458");
  LoadEightDotPattern(a1, 241, "13458");
  LoadEightDotPattern(a1, 242, "34578");
  LoadEightDotPattern(a1, 243, "14568");
  LoadEightDotPattern(a1, 244, "145678");
  LoadEightDotPattern(a1, 245, "1358");
  LoadEightDotPattern(a1, 246, "2468");
  LoadEightDotPattern(a1, 247, "3478");
  LoadEightDotPattern(a1, 248, "24678");
  LoadEightDotPattern(a1, 249, "234568");
  LoadEightDotPattern(a1, 250, "1568");
  LoadEightDotPattern(a1, 251, "15678");
  LoadEightDotPattern(a1, 252, "12568");
  LoadEightDotPattern(a1, 253, "1245678");
  LoadEightDotPattern(a1, 254, "12348");
  LoadEightDotPattern(a1, 255, "134568");
  LoadEightDotPattern(a1, 884, "3456");
  LoadEightDotPattern(a1, 885, "5678");
  LoadEightDotPattern(a1, 894, "26");
  LoadEightDotPattern(a1, 900, "4");
  LoadEightDotPattern(a1, 901, "45");
  LoadEightDotPattern(a1, 902, "34578");
  LoadEightDotPattern(a1, 903, "46");
  LoadEightDotPattern(a1, 904, "124678");
  LoadEightDotPattern(a1, 905, "12345678");
  LoadEightDotPattern(a1, 906, "1245678");
  LoadEightDotPattern(a1, 908, "24678");
  LoadEightDotPattern(a1, 910, "125678");
  LoadEightDotPattern(a1, 911, "24578");
  LoadEightDotPattern(a1, 912, "248");
  LoadEightDotPattern(a1, 913, "178");
  LoadEightDotPattern(a1, 914, "1278");
  LoadEightDotPattern(a1, 915, "124578");
  LoadEightDotPattern(a1, 916, "14578");
  LoadEightDotPattern(a1, 917, "1578");
  LoadEightDotPattern(a1, 918, "135678");
  LoadEightDotPattern(a1, 919, "15678");
  LoadEightDotPattern(a1, 920, "145678");
  LoadEightDotPattern(a1, 921, "248");
  LoadEightDotPattern(a1, 922, "1378");
  LoadEightDotPattern(a1, 923, "12378");
  LoadEightDotPattern(a1, 924, "13478");
  LoadEightDotPattern(a1, 925, "134578");
  LoadEightDotPattern(a1, 926, "134678");
  LoadEightDotPattern(a1, 927, "13578");
  LoadEightDotPattern(a1, 928, "123478");
  LoadEightDotPattern(a1, 929, "123578");
  LoadEightDotPattern(a1, 931, "23478");
  LoadEightDotPattern(a1, 932, "234578");
  LoadEightDotPattern(a1, 933, "13678");
  LoadEightDotPattern(a1, 934, "12478");
  LoadEightDotPattern(a1, 935, "1234678");
  LoadEightDotPattern(a1, 936, "1345678");
  LoadEightDotPattern(a1, 937, "245678");
  LoadEightDotPattern(a1, 938, "2478");
  LoadEightDotPattern(a1, 939, "1345678");
  LoadEightDotPattern(a1, 940, "3458");
  LoadEightDotPattern(a1, 941, "12468");
  LoadEightDotPattern(a1, 942, "1234568");
  LoadEightDotPattern(a1, 943, "124568");
  LoadEightDotPattern(a1, 944, "134568");
  LoadEightDotPattern(a1, 945, "18");
  LoadEightDotPattern(a1, 946, "128");
  LoadEightDotPattern(a1, 947, "12458");
  LoadEightDotPattern(a1, 948, "1458");
  LoadEightDotPattern(a1, 949, "158");
  LoadEightDotPattern(a1, 950, "13568");
  LoadEightDotPattern(a1, 951, "1568");
  LoadEightDotPattern(a1, 952, "14568");
  LoadEightDotPattern(a1, 953, "248");
  LoadEightDotPattern(a1, 954, "138");
  LoadEightDotPattern(a1, 955, "1238");
  LoadEightDotPattern(a1, 956, "1348");
  LoadEightDotPattern(a1, 957, "13458");
  LoadEightDotPattern(a1, 958, "13468");
  LoadEightDotPattern(a1, 959, "1358");
  LoadEightDotPattern(a1, 960, "12348");
  LoadEightDotPattern(a1, 961, "12358");
  LoadEightDotPattern(a1, 962, "2348");
  LoadEightDotPattern(a1, 963, "2348");
  LoadEightDotPattern(a1, 964, "23458");
  LoadEightDotPattern(a1, 965, "1368");
  LoadEightDotPattern(a1, 966, "1248");
  LoadEightDotPattern(a1, 967, "123468");
  LoadEightDotPattern(a1, 968, "13456");
  LoadEightDotPattern(a1, 969, "24568");
  LoadEightDotPattern(a1, 970, "348");
  LoadEightDotPattern(a1, 971, "234568");
  LoadEightDotPattern(a1, 972, "2468");
  LoadEightDotPattern(a1, 973, "12568");
  LoadEightDotPattern(a1, 974, "2458");
  LoadEightDotPattern(a1, 976, "1278");
  LoadEightDotPattern(a1, 977, "145678");
  LoadEightDotPattern(a1, 978, "12368");
  LoadEightDotPattern(a1, 979, "23456");
  LoadEightDotPattern(a1, 980, "1368");
  LoadEightDotPattern(a1, 981, "12478");
  LoadEightDotPattern(a1, 982, "123478");
  LoadEightDotPattern(a1, 983, "12346");
  LoadEightDotPattern(a1, 984, "1234578");
  LoadEightDotPattern(a1, 985, "123458");
  LoadEightDotPattern(a1, 986, "123678");
  LoadEightDotPattern(a1, 987, "12368");
  LoadEightDotPattern(a1, 988, "145678");
  LoadEightDotPattern(a1, 989, "12368");
  LoadEightDotPattern(a1, 990, "1234578");
  LoadEightDotPattern(a1, 991, "123458");
  LoadEightDotPattern(a1, 992, "234678");
  LoadEightDotPattern(a1, 993, "23468");
  LoadEightDotPattern(a1, 1008, "1234578");
  LoadEightDotPattern(a1, 1009, "123578");
  LoadEightDotPattern(a1, 1010, "23478");
  LoadEightDotPattern(a1, 1012, "145678");
  LoadEightDotPattern(a1, 1013, "1578");
  LoadEightDotPattern(a1, 1018, "234678");
  LoadEightDotPattern(a1, 1019, "23468");
  LoadEightDotPattern(a1, 984, "12678");
  LoadEightDotPattern(a1, 985, "1268");
  LoadEightDotPattern(a1, 992, "34578");
  LoadEightDotPattern(a1, 993, "3458");
  LoadEightDotPattern(a1, 1072, "18");
  LoadEightDotPattern(a1, 1040, "178");
  LoadEightDotPattern(a1, 1073, "128");
  LoadEightDotPattern(a1, 1041, "1278");
  LoadEightDotPattern(a1, 1074, "24568");
  LoadEightDotPattern(a1, 1042, "245678");
  LoadEightDotPattern(a1, 1075, "12458");
  LoadEightDotPattern(a1, 1043, "124578");
  LoadEightDotPattern(a1, 1076, "1458");
  LoadEightDotPattern(a1, 1044, "14578");
  LoadEightDotPattern(a1, 1077, "158");
  LoadEightDotPattern(a1, 1045, "1578");
  LoadEightDotPattern(a1, 1078, "2458");
  LoadEightDotPattern(a1, 1046, "24578");
  LoadEightDotPattern(a1, 1079, "13568");
  LoadEightDotPattern(a1, 1047, "135678");
  LoadEightDotPattern(a1, 1080, "248");
  LoadEightDotPattern(a1, 1048, "2478");
  LoadEightDotPattern(a1, 1081, "123468");
  LoadEightDotPattern(a1, 1049, "1234678");
  LoadEightDotPattern(a1, 1082, "138");
  LoadEightDotPattern(a1, 1050, "1378");
  LoadEightDotPattern(a1, 1083, "1238");
  LoadEightDotPattern(a1, 1051, "12378");
  LoadEightDotPattern(a1, 1084, "1348");
  LoadEightDotPattern(a1, 1052, "13478");
  LoadEightDotPattern(a1, 1085, "13458");
  LoadEightDotPattern(a1, 1053, "134578");
  LoadEightDotPattern(a1, 1086, "1358");
  LoadEightDotPattern(a1, 1054, "13578");
  LoadEightDotPattern(a1, 1087, "12348");
  LoadEightDotPattern(a1, 1055, "123478");
  LoadEightDotPattern(a1, 1088, "12358");
  LoadEightDotPattern(a1, 1056, "123578");
  LoadEightDotPattern(a1, 1089, "2348");
  LoadEightDotPattern(a1, 1057, "23478");
  LoadEightDotPattern(a1, 1090, "23458");
  LoadEightDotPattern(a1, 1058, "234578");
  LoadEightDotPattern(a1, 1091, "1368");
  LoadEightDotPattern(a1, 1059, "13678");
  LoadEightDotPattern(a1, 1092, "1248");
  LoadEightDotPattern(a1, 1060, "12478");
  LoadEightDotPattern(a1, 1093, "1258");
  LoadEightDotPattern(a1, 1061, "12578");
  LoadEightDotPattern(a1, 1094, "148");
  LoadEightDotPattern(a1, 1062, "1478");
  LoadEightDotPattern(a1, 1095, "123458");
  LoadEightDotPattern(a1, 1063, "1234578");
  LoadEightDotPattern(a1, 1096, "1568");
  LoadEightDotPattern(a1, 1064, "15678");
  LoadEightDotPattern(a1, 1097, "13468");
  LoadEightDotPattern(a1, 1065, "134678");
  LoadEightDotPattern(a1, 1098, "123568");
  LoadEightDotPattern(a1, 1066, "1235678");
  LoadEightDotPattern(a1, 1099, "23468");
  LoadEightDotPattern(a1, 1067, "234678");
  LoadEightDotPattern(a1, 1100, "234568");
  LoadEightDotPattern(a1, 1068, "2345678");
  LoadEightDotPattern(a1, 1101, "2468");
  LoadEightDotPattern(a1, 1069, "24678");
  LoadEightDotPattern(a1, 1102, "12568");
  LoadEightDotPattern(a1, 1070, "125678");
  LoadEightDotPattern(a1, 1103, "12468");
  LoadEightDotPattern(a1, 1071, "124678");
  LoadEightDotPattern(a1, 1104, "158");
  LoadEightDotPattern(a1, 1024, "1578");
  LoadEightDotPattern(a1, 1105, "168");
  LoadEightDotPattern(a1, 1025, "1678");
  LoadEightDotPattern(a1, 1106, "14568");
  LoadEightDotPattern(a1, 1026, "145678");
  LoadEightDotPattern(a1, 1107, "3458");
  LoadEightDotPattern(a1, 1027, "34578");
  LoadEightDotPattern(a1, 1108, "3458");
  LoadEightDotPattern(a1, 1028, "34578");
  LoadEightDotPattern(a1, 1109, "12568");
  LoadEightDotPattern(a1, 1029, "125678");
  LoadEightDotPattern(a1, 1110, "134568");
  LoadEightDotPattern(a1, 1030, "1345678");
  LoadEightDotPattern(a1, 1111, "14568");
  LoadEightDotPattern(a1, 1031, "145678");
  LoadEightDotPattern(a1, 1112, "2458");
  LoadEightDotPattern(a1, 1032, "24578");
  LoadEightDotPattern(a1, 1113, "1268");
  LoadEightDotPattern(a1, 1033, "12678");
  LoadEightDotPattern(a1, 1114, "12468");
  LoadEightDotPattern(a1, 1034, "124678");
  LoadEightDotPattern(a1, 1115, "1468");
  LoadEightDotPattern(a1, 1035, "14678");
  LoadEightDotPattern(a1, 1116, "348");
  LoadEightDotPattern(a1, 1036, "3478");
  LoadEightDotPattern(a1, 1117, "248");
  LoadEightDotPattern(a1, 1037, "2478");
  LoadEightDotPattern(a1, 1118, "3468");
  LoadEightDotPattern(a1, 1038, "34678");
  LoadEightDotPattern(a1, 1119, "124568");
  LoadEightDotPattern(a1, 1039, "1245678");
  LoadEightDotPattern(a1, 1123, "3458");
  LoadEightDotPattern(a1, 1122, "34578");
  LoadEightDotPattern(a1, 1127, "18");
  LoadEightDotPattern(a1, 1126, "178");
  LoadEightDotPattern(a1, 1131, "124568");
  LoadEightDotPattern(a1, 1130, "1245678");
  LoadEightDotPattern(a1, 1145, "3468");
  LoadEightDotPattern(a1, 1144, "34678");
  LoadEightDotPattern(a1, 1156, "48");
  LoadEightDotPattern(a1, 1163, "123468");
  LoadEightDotPattern(a1, 1162, "1234678");
  LoadEightDotPattern(a1, 1165, "234568");
  LoadEightDotPattern(a1, 1164, "2345678");
  LoadEightDotPattern(a1, 1167, "12358");
  LoadEightDotPattern(a1, 1166, "123578");
  LoadEightDotPattern(a1, 1169, "124568");
  LoadEightDotPattern(a1, 1168, "1245678");
  LoadEightDotPattern(a1, 1171, "124568");
  LoadEightDotPattern(a1, 1170, "1245678");
  LoadEightDotPattern(a1, 1173, "12458");
  LoadEightDotPattern(a1, 1172, "124578");
  LoadEightDotPattern(a1, 1175, "2458");
  LoadEightDotPattern(a1, 1174, "24578");
  LoadEightDotPattern(a1, 1177, "13568");
  LoadEightDotPattern(a1, 1176, "135678");
  LoadEightDotPattern(a1, 1179, "14568");
  LoadEightDotPattern(a1, 1178, "145678");
  LoadEightDotPattern(a1, 1181, "138");
  LoadEightDotPattern(a1, 1180, "1378");
  LoadEightDotPattern(a1, 1183, "138");
  LoadEightDotPattern(a1, 1182, "1378");
  LoadEightDotPattern(a1, 1185, "138");
  LoadEightDotPattern(a1, 1184, "1378");
  LoadEightDotPattern(a1, 1187, "1468");
  LoadEightDotPattern(a1, 1186, "14678");
  LoadEightDotPattern(a1, 1189, "1345 12458");
  LoadEightDotPattern(a1, 1188, "1345 124578");
  LoadEightDotPattern(a1, 1191, "12348");
  LoadEightDotPattern(a1, 1190, "123478");
  LoadEightDotPattern(a1, 1193, "1258");
  LoadEightDotPattern(a1, 1192, "12578");
  LoadEightDotPattern(a1, 1195, "2348");
  LoadEightDotPattern(a1, 1194, "23478");
  LoadEightDotPattern(a1, 1197, "23458");
  LoadEightDotPattern(a1, 1196, "234578");
  LoadEightDotPattern(a1, 1199, "348");
  LoadEightDotPattern(a1, 1198, "3478");
  LoadEightDotPattern(a1, 1201, "3468");
  LoadEightDotPattern(a1, 1200, "34678");
  LoadEightDotPattern(a1, 1203, "1258");
  LoadEightDotPattern(a1, 1202, "12578");
  LoadEightDotPattern(a1, 1205, "2345 148");
  LoadEightDotPattern(a1, 1204, "2345 1478");
  LoadEightDotPattern(a1, 1207, "123458");
  LoadEightDotPattern(a1, 1206, "1234578");
  LoadEightDotPattern(a1, 1209, "123458");
  LoadEightDotPattern(a1, 1208, "1234578");
  LoadEightDotPattern(a1, 1211, "12368");
  LoadEightDotPattern(a1, 1210, "123678");
  LoadEightDotPattern(a1, 1213, "123458");
  LoadEightDotPattern(a1, 1212, "1234578");
  LoadEightDotPattern(a1, 1215, "123458");
  LoadEightDotPattern(a1, 1214, "1234578");
  LoadEightDotPattern(a1, 1216, "248");
  LoadEightDotPattern(a1, 1218, "2458");
  LoadEightDotPattern(a1, 1217, "24578");
  LoadEightDotPattern(a1, 1220, "138");
  LoadEightDotPattern(a1, 1219, "1378");
  LoadEightDotPattern(a1, 1222, "1238");
  LoadEightDotPattern(a1, 1221, "12378");
  LoadEightDotPattern(a1, 1224, "13458");
  LoadEightDotPattern(a1, 1223, "134578");
  LoadEightDotPattern(a1, 1226, "13458");
  LoadEightDotPattern(a1, 1225, "134578");
  LoadEightDotPattern(a1, 1228, "123458");
  LoadEightDotPattern(a1, 1227, "1234578");
  LoadEightDotPattern(a1, 1230, "1348");
  LoadEightDotPattern(a1, 1229, "13478");
  LoadEightDotPattern(a1, 1231, "248");
  LoadEightDotPattern(a1, 1233, "18");
  LoadEightDotPattern(a1, 1232, "178");
  LoadEightDotPattern(a1, 1235, "18");
  LoadEightDotPattern(a1, 1234, "178");
  LoadEightDotPattern(a1, 1237, "1 158");
  LoadEightDotPattern(a1, 1236, "1 1578");
  LoadEightDotPattern(a1, 1239, "158");
  LoadEightDotPattern(a1, 1238, "1578");
  LoadEightDotPattern(a1, 1241, "3458");
  LoadEightDotPattern(a1, 1240, "34578");
  LoadEightDotPattern(a1, 1243, "3458");
  LoadEightDotPattern(a1, 1242, "34578");
  LoadEightDotPattern(a1, 1245, "2458");
  LoadEightDotPattern(a1, 1244, "24578");
  LoadEightDotPattern(a1, 1247, "13568");
  LoadEightDotPattern(a1, 1246, "135678");
  LoadEightDotPattern(a1, 1249, "12568");
  LoadEightDotPattern(a1, 1248, "125678");
  LoadEightDotPattern(a1, 1251, "248");
  LoadEightDotPattern(a1, 1250, "2478");
  LoadEightDotPattern(a1, 1253, "248");
  LoadEightDotPattern(a1, 1252, "2478");
  LoadEightDotPattern(a1, 1255, "1358");
  LoadEightDotPattern(a1, 1254, "13578");
  LoadEightDotPattern(a1, 1257, "1268");
  LoadEightDotPattern(a1, 1256, "12678");
  LoadEightDotPattern(a1, 1259, "1268");
  LoadEightDotPattern(a1, 1258, "12678");
  LoadEightDotPattern(a1, 1261, "158");
  LoadEightDotPattern(a1, 1260, "1578");
  LoadEightDotPattern(a1, 1263, "1368");
  LoadEightDotPattern(a1, 1262, "13678");
  LoadEightDotPattern(a1, 1265, "1368");
  LoadEightDotPattern(a1, 1264, "13678");
  LoadEightDotPattern(a1, 1267, "1368");
  LoadEightDotPattern(a1, 1266, "13678");
  LoadEightDotPattern(a1, 1269, "123458");
  LoadEightDotPattern(a1, 1268, "1234578");
  LoadEightDotPattern(a1, 1271, "12458");
  LoadEightDotPattern(a1, 1270, "124578");
  LoadEightDotPattern(a1, 1273, "23468");
  LoadEightDotPattern(a1, 1272, "234678");
  LoadEightDotPattern(a1, 1275, "124568");
  LoadEightDotPattern(a1, 1274, "1245678");
  LoadEightDotPattern(a1, 1277, "1258");
  LoadEightDotPattern(a1, 1276, "12578");
  LoadEightDotPattern(a1, 1279, "1258");
  LoadEightDotPattern(a1, 1278, "12578");
  LoadEightDotPattern(a1, 1370, "38");
  LoadEightDotPattern(a1, 1372, "2358");
  LoadEightDotPattern(a1, 1373, "28");
  LoadEightDotPattern(a1, 1374, "2368");
  LoadEightDotPattern(a1, 1377, "18");
  LoadEightDotPattern(a1, 1329, "178");
  LoadEightDotPattern(a1, 1378, "128");
  LoadEightDotPattern(a1, 1330, "1278");
  LoadEightDotPattern(a1, 1379, "12458");
  LoadEightDotPattern(a1, 1331, "124578");
  LoadEightDotPattern(a1, 1380, "1458");
  LoadEightDotPattern(a1, 1332, "14578");
  LoadEightDotPattern(a1, 1381, "2458");
  LoadEightDotPattern(a1, 1333, "24578");
  LoadEightDotPattern(a1, 1382, "23468");
  LoadEightDotPattern(a1, 1334, "234678");
  LoadEightDotPattern(a1, 1383, "158");
  LoadEightDotPattern(a1, 1335, "1578");
  LoadEightDotPattern(a1, 1384, "348");
  LoadEightDotPattern(a1, 1336, "3478");
  LoadEightDotPattern(a1, 1385, "3458");
  LoadEightDotPattern(a1, 1337, "34578");
  LoadEightDotPattern(a1, 1386, "234568");
  LoadEightDotPattern(a1, 1338, "2345678");
  LoadEightDotPattern(a1, 1387, "248");
  LoadEightDotPattern(a1, 1339, "2478");
  LoadEightDotPattern(a1, 1388, "1238");
  LoadEightDotPattern(a1, 1340, "12378");
  LoadEightDotPattern(a1, 1389, "14568");
  LoadEightDotPattern(a1, 1341, "145678");
  LoadEightDotPattern(a1, 1390, "148");
  LoadEightDotPattern(a1, 1342, "1478");
  LoadEightDotPattern(a1, 1391, "138");
  LoadEightDotPattern(a1, 1343, "1378");
  LoadEightDotPattern(a1, 1392, "1258");
  LoadEightDotPattern(a1, 1344, "12578");
  LoadEightDotPattern(a1, 1393, "1268");
  LoadEightDotPattern(a1, 1345, "12678");
  LoadEightDotPattern(a1, 1394, "124568");
  LoadEightDotPattern(a1, 1346, "1245678");
  LoadEightDotPattern(a1, 1395, "1468");
  LoadEightDotPattern(a1, 1347, "14678");
  LoadEightDotPattern(a1, 1396, "1348");
  LoadEightDotPattern(a1, 1348, "13478");
  LoadEightDotPattern(a1, 1397, "134568");
  LoadEightDotPattern(a1, 1349, "1345678");
  LoadEightDotPattern(a1, 1398, "13458");
  LoadEightDotPattern(a1, 1350, "134578");
  LoadEightDotPattern(a1, 1399, "1568");
  LoadEightDotPattern(a1, 1351, "15678");
  LoadEightDotPattern(a1, 1400, "12368");
  LoadEightDotPattern(a1, 1352, "123678");
  LoadEightDotPattern(a1, 1401, "123458");
  LoadEightDotPattern(a1, 1353, "1234578");
  LoadEightDotPattern(a1, 1402, "12348");
  LoadEightDotPattern(a1, 1354, "123478");
  LoadEightDotPattern(a1, 1403, "13468");
  LoadEightDotPattern(a1, 1355, "134678");
  LoadEightDotPattern(a1, 1404, "123568");
  LoadEightDotPattern(a1, 1356, "1235678");
  LoadEightDotPattern(a1, 1405, "2348");
  LoadEightDotPattern(a1, 1357, "23478");
  LoadEightDotPattern(a1, 1406, "24568");
  LoadEightDotPattern(a1, 1358, "245678");
  LoadEightDotPattern(a1, 1407, "23458");
  LoadEightDotPattern(a1, 1359, "234578");
  LoadEightDotPattern(a1, 1408, "12358");
  LoadEightDotPattern(a1, 1360, "123578");
  LoadEightDotPattern(a1, 1409, "13568");
  LoadEightDotPattern(a1, 1361, "135678");
  LoadEightDotPattern(a1, 1410, "1368");
  LoadEightDotPattern(a1, 1362, "13678");
  LoadEightDotPattern(a1, 1411, "134568");
  LoadEightDotPattern(a1, 1363, "1345678");
  LoadEightDotPattern(a1, 1412, "123468");
  LoadEightDotPattern(a1, 1364, "1234678");
  LoadEightDotPattern(a1, 1413, "1358");
  LoadEightDotPattern(a1, 1365, "13578");
  LoadEightDotPattern(a1, 1414, "1248");
  LoadEightDotPattern(a1, 1366, "12478");
  LoadEightDotPattern(a1, 1417, "2568");
  LoadEightDotPattern(a1, 1418, "368");
  LoadEightDotPattern(a1, 1425, "238");
  LoadEightDotPattern(a1, 1426, "158");
  LoadEightDotPattern(a1, 1428, "28");
  LoadEightDotPattern(a1, 1431, "56 1235 24 1236 58");
  LoadEightDotPattern(a1, 1436, "56 1245 15 1235 58");
  LoadEightDotPattern(a1, 1443, "56 134 136 1345 58");
  LoadEightDotPattern(a1, 1456, "3");
  LoadEightDotPattern(a1, 1457, "26");
  LoadEightDotPattern(a1, 1458, "25");
  LoadEightDotPattern(a1, 1459, "345");
  LoadEightDotPattern(a1, 1460, "35");
  LoadEightDotPattern(a1, 1461, "34");
  LoadEightDotPattern(a1, 1462, "15");
  LoadEightDotPattern(a1, 1463, "14");
  LoadEightDotPattern(a1, 1464, "126");
  LoadEightDotPattern(a1, 1465, "246");
  LoadEightDotPattern(a1, 1467, "346");
  LoadEightDotPattern(a1, 1468, "5");
  LoadEightDotPattern(a1, 1469, "4");
  LoadEightDotPattern(a1, 1470, "36");
  LoadEightDotPattern(a1, 1471, "16");
  LoadEightDotPattern(a1, 1472, "168");
  LoadEightDotPattern(a1, 1475, "2568");
  LoadEightDotPattern(a1, 1476, "168");
  LoadEightDotPattern(a1, 1488, "18");
  LoadEightDotPattern(a1, 1489, "12368");
  LoadEightDotPattern(a1, 1490, "12458");
  LoadEightDotPattern(a1, 1491, "1458");
  LoadEightDotPattern(a1, 1492, "1258");
  LoadEightDotPattern(a1, 1493, "24568");
  LoadEightDotPattern(a1, 1494, "13568");
  LoadEightDotPattern(a1, 1495, "13468");
  LoadEightDotPattern(a1, 1496, "23458");
  LoadEightDotPattern(a1, 1497, "2458");
  LoadEightDotPattern(a1, 1498, "168");
  LoadEightDotPattern(a1, 1499, "168");
  LoadEightDotPattern(a1, 1500, "1238");
  LoadEightDotPattern(a1, 1501, "1348");
  LoadEightDotPattern(a1, 1502, "1348");
  LoadEightDotPattern(a1, 1503, "13458");
  LoadEightDotPattern(a1, 1504, "13458");
  LoadEightDotPattern(a1, 1505, "2348");
  LoadEightDotPattern(a1, 1506, "12468");
  LoadEightDotPattern(a1, 1507, "1248");
  LoadEightDotPattern(a1, 1508, "1248");
  LoadEightDotPattern(a1, 1509, "23468");
  LoadEightDotPattern(a1, 1510, "23468");
  LoadEightDotPattern(a1, 1511, "123458");
  LoadEightDotPattern(a1, 1512, "12358");
  LoadEightDotPattern(a1, 1513, "1468");
  LoadEightDotPattern(a1, 1514, "14568");
  LoadEightDotPattern(a1, 1520, "168");
  LoadEightDotPattern(a1, 1521, "168");
  LoadEightDotPattern(a1, 1522, "168");
  LoadEightDotPattern(a1, 1523, "168");
  LoadEightDotPattern(a1, 1524, "168");
  LoadEightDotPattern(a1, 1536, "34568");
  LoadEightDotPattern(a1, 1548, "28");
  LoadEightDotPattern(a1, 1549, "36 368");
  LoadEightDotPattern(a1, 1550, "36 368");
  LoadEightDotPattern(a1, 1551, "36 368");
  LoadEightDotPattern(a1, 1563, "238");
  LoadEightDotPattern(a1, 1566, "3 3 38");
  LoadEightDotPattern(a1, 1567, "2368");
  LoadEightDotPattern(a1, 1569, "38");
  LoadEightDotPattern(a1, 1570, "3458");
  LoadEightDotPattern(a1, 1571, "348");
  LoadEightDotPattern(a1, 1572, "12568");
  LoadEightDotPattern(a1, 1573, "348");
  LoadEightDotPattern(a1, 1574, "134568");
  LoadEightDotPattern(a1, 1575, "18");
  LoadEightDotPattern(a1, 1576, "128");
  LoadEightDotPattern(a1, 1577, "168");
  LoadEightDotPattern(a1, 1578, "23458");
  LoadEightDotPattern(a1, 1579, "14568");
  LoadEightDotPattern(a1, 1580, "2458");
  LoadEightDotPattern(a1, 1581, "1568");
  LoadEightDotPattern(a1, 1582, "13468");
  LoadEightDotPattern(a1, 1583, "1458");
  LoadEightDotPattern(a1, 1584, "23468");
  LoadEightDotPattern(a1, 1585, "12358");
  LoadEightDotPattern(a1, 1586, "13568");
  LoadEightDotPattern(a1, 1587, "2348");
  LoadEightDotPattern(a1, 1588, "1468");
  LoadEightDotPattern(a1, 1589, "123468");
  LoadEightDotPattern(a1, 1590, "12468");
  LoadEightDotPattern(a1, 1591, "234568");
  LoadEightDotPattern(a1, 1592, "1234568");
  LoadEightDotPattern(a1, 1593, "123568");
  LoadEightDotPattern(a1, 1594, "1268");
  LoadEightDotPattern(a1, 1601, "1248");
  LoadEightDotPattern(a1, 1602, "123458");
  LoadEightDotPattern(a1, 1603, "138");
  LoadEightDotPattern(a1, 1604, "1238");
  LoadEightDotPattern(a1, 1605, "1348");
  LoadEightDotPattern(a1, 1606, "13458");
  LoadEightDotPattern(a1, 1607, "1258");
  LoadEightDotPattern(a1, 1608, "24568");
  LoadEightDotPattern(a1, 1609, "1358");
  LoadEightDotPattern(a1, 1610, "248");
  LoadEightDotPattern(a1, 1611, "238");
  LoadEightDotPattern(a1, 1612, "268");
  LoadEightDotPattern(a1, 1613, "358");
  LoadEightDotPattern(a1, 1614, "28");
  LoadEightDotPattern(a1, 1615, "1368");
  LoadEightDotPattern(a1, 1616, "158");
  LoadEightDotPattern(a1, 1617, "68");
  LoadEightDotPattern(a1, 1618, "258");
  LoadEightDotPattern(a1, 1620, "38");
  LoadEightDotPattern(a1, 1632, "2458");
  LoadEightDotPattern(a1, 1633, "18");
  LoadEightDotPattern(a1, 1634, "128");
  LoadEightDotPattern(a1, 1635, "148");
  LoadEightDotPattern(a1, 1636, "1458");
  LoadEightDotPattern(a1, 1637, "158");
  LoadEightDotPattern(a1, 1638, "1248");
  LoadEightDotPattern(a1, 1639, "12458");
  LoadEightDotPattern(a1, 1640, "1258");
  LoadEightDotPattern(a1, 1641, "248");
  LoadEightDotPattern(a1, 1642, "25 12348");
  LoadEightDotPattern(a1, 1643, "2568");
  LoadEightDotPattern(a1, 1644, "28");
  LoadEightDotPattern(a1, 1645, "35 4 134568");
  LoadEightDotPattern(a1, 1646, "128");
  LoadEightDotPattern(a1, 1647, "123458");
  LoadEightDotPattern(a1, 1648, "35 123468");
  LoadEightDotPattern(a1, 1649, "35 123568");
  LoadEightDotPattern(a1, 1650, "12568");
  LoadEightDotPattern(a1, 1651, "348");
  LoadEightDotPattern(a1, 1652, "38");
  LoadEightDotPattern(a1, 1653, "12568");
  LoadEightDotPattern(a1, 1654, "2456 38");
  LoadEightDotPattern(a1, 1655, "2456 38");
  LoadEightDotPattern(a1, 1656, "24 38");
  LoadEightDotPattern(a1, 1657, "2468");
  LoadEightDotPattern(a1, 1658, "2468");
  LoadEightDotPattern(a1, 1659, "2468");
  LoadEightDotPattern(a1, 1660, "23458");
  LoadEightDotPattern(a1, 1661, "23458");
  LoadEightDotPattern(a1, 1662, "12348");
  LoadEightDotPattern(a1, 1663, "23458");
  LoadEightDotPattern(a1, 1664, "128");
  LoadEightDotPattern(a1, 1665, "1568");
  LoadEightDotPattern(a1, 1666, "1568");
  LoadEightDotPattern(a1, 1667, "1568");
  LoadEightDotPattern(a1, 1668, "1568");
  LoadEightDotPattern(a1, 1669, "1568");
  LoadEightDotPattern(a1, 1670, "148");
  LoadEightDotPattern(a1, 1671, "1568");
  LoadEightDotPattern(a1, 1672, "3468");
  LoadEightDotPattern(a1, 1673, "1458");
  LoadEightDotPattern(a1, 1674, "1458");
  LoadEightDotPattern(a1, 1675, "1458");
  LoadEightDotPattern(a1, 1676, "1458");
  LoadEightDotPattern(a1, 1677, "1458");
  LoadEightDotPattern(a1, 1678, "1458");
  LoadEightDotPattern(a1, 1679, "1458");
  LoadEightDotPattern(a1, 1680, "1458");
  LoadEightDotPattern(a1, 1681, "124568");
  LoadEightDotPattern(a1, 1682, "12358");
  LoadEightDotPattern(a1, 1683, "12358");
  LoadEightDotPattern(a1, 1684, "12358");
  LoadEightDotPattern(a1, 1685, "12358");
  LoadEightDotPattern(a1, 1686, "12358");
  LoadEightDotPattern(a1, 1687, "12358");
  LoadEightDotPattern(a1, 1688, "5 13568");
  LoadEightDotPattern(a1, 1689, "12358");
  LoadEightDotPattern(a1, 1690, "2348");
  LoadEightDotPattern(a1, 1691, "2348");
  LoadEightDotPattern(a1, 1692, "2348");
  LoadEightDotPattern(a1, 1693, "123468");
  LoadEightDotPattern(a1, 1694, "123468");
  LoadEightDotPattern(a1, 1695, "123468");
  LoadEightDotPattern(a1, 1696, "123468");
  LoadEightDotPattern(a1, 1697, "1248");
  LoadEightDotPattern(a1, 1698, "1248");
  LoadEightDotPattern(a1, 1699, "1248");
  LoadEightDotPattern(a1, 1700, "12368");
  LoadEightDotPattern(a1, 1701, "1248");
  LoadEightDotPattern(a1, 1702, "1248");
  LoadEightDotPattern(a1, 1703, "123458");
  LoadEightDotPattern(a1, 1704, "123458");
  LoadEightDotPattern(a1, 1705, "138");
  LoadEightDotPattern(a1, 1706, "138");
  LoadEightDotPattern(a1, 1707, "138");
  LoadEightDotPattern(a1, 1708, "138");
  LoadEightDotPattern(a1, 1709, "138");
  LoadEightDotPattern(a1, 1710, "138");
  LoadEightDotPattern(a1, 1711, "12458");
  LoadEightDotPattern(a1, 1712, "12458");
  LoadEightDotPattern(a1, 1713, "12458");
  LoadEightDotPattern(a1, 1714, "12458");
  LoadEightDotPattern(a1, 1715, "12458");
  LoadEightDotPattern(a1, 1716, "12458");
  LoadEightDotPattern(a1, 1717, "1238");
  LoadEightDotPattern(a1, 1718, "1238");
  LoadEightDotPattern(a1, 1719, "1238");
  LoadEightDotPattern(a1, 1720, "1238");
  LoadEightDotPattern(a1, 1721, "568");
  LoadEightDotPattern(a1, 1722, "568");
  LoadEightDotPattern(a1, 1723, "568");
  LoadEightDotPattern(a1, 1724, "568");
  LoadEightDotPattern(a1, 1725, "568");
  LoadEightDotPattern(a1, 1726, "1258");
  LoadEightDotPattern(a1, 1727, "1258");
  LoadEightDotPattern(a1, 1728, "1258");
  LoadEightDotPattern(a1, 1729, "1258");
  LoadEightDotPattern(a1, 1730, "1258");
  LoadEightDotPattern(a1, 1731, "168");
  LoadEightDotPattern(a1, 1732, "24568");
  LoadEightDotPattern(a1, 1733, "24568");
  LoadEightDotPattern(a1, 1734, "24568");
  LoadEightDotPattern(a1, 1735, "24568");
  LoadEightDotPattern(a1, 1736, "24568");
  LoadEightDotPattern(a1, 1737, "24568");
  LoadEightDotPattern(a1, 1738, "24568");
  LoadEightDotPattern(a1, 1739, "12368");
  LoadEightDotPattern(a1, 1740, "248");
  LoadEightDotPattern(a1, 1741, "248");
  LoadEightDotPattern(a1, 1742, "248");
  LoadEightDotPattern(a1, 1743, "24568");
  LoadEightDotPattern(a1, 1744, "248");
  LoadEightDotPattern(a1, 1745, "248");
  LoadEightDotPattern(a1, 1746, "348");
  LoadEightDotPattern(a1, 1747, "348");
  LoadEightDotPattern(a1, 1748, "2568");
  LoadEightDotPattern(a1, 1749, "1 158");
  LoadEightDotPattern(a1, 1750, "234 123 1358");
  LoadEightDotPattern(a1, 1751, "12345 123 1358");
  LoadEightDotPattern(a1, 1752, "1348");
  LoadEightDotPattern(a1, 1753, "123 18");
  LoadEightDotPattern(a1, 1754, "2458");
  LoadEightDotPattern(a1, 1756, "18");
  LoadEightDotPattern(a1, 1757, "35 35 35 358");
  LoadEightDotPattern(a1, 1758, "35 35 35 358");
  LoadEightDotPattern(a1, 1761, "1568");
  LoadEightDotPattern(a1, 1762, "1348");
  LoadEightDotPattern(a1, 1763, "2348");
  LoadEightDotPattern(a1, 1765, "24568");
  LoadEightDotPattern(a1, 1766, "248");
  LoadEightDotPattern(a1, 1767, "248");
  LoadEightDotPattern(a1, 1768, "13458");
  LoadEightDotPattern(a1, 1769, "35 35 35 358");
  LoadEightDotPattern(a1, 1770, "2568");
  LoadEightDotPattern(a1, 1771, "2568");
  LoadEightDotPattern(a1, 1772, "2568");
  LoadEightDotPattern(a1, 1773, "1348");
  LoadEightDotPattern(a1, 1774, "1458");
  LoadEightDotPattern(a1, 1775, "12358");
  LoadEightDotPattern(a1, 1776, "2458");
  LoadEightDotPattern(a1, 1777, "18");
  LoadEightDotPattern(a1, 1778, "128");
  LoadEightDotPattern(a1, 1779, "148");
  LoadEightDotPattern(a1, 1780, "1458");
  LoadEightDotPattern(a1, 1781, "158");
  LoadEightDotPattern(a1, 1782, "1248");
  LoadEightDotPattern(a1, 1783, "12458");
  LoadEightDotPattern(a1, 1784, "1258");
  LoadEightDotPattern(a1, 1785, "248");
  LoadEightDotPattern(a1, 1786, "1468");
  LoadEightDotPattern(a1, 1787, "12468");
  LoadEightDotPattern(a1, 1788, "1268");
  LoadEightDotPattern(a1, 1789, "35 35 35 358");
  LoadEightDotPattern(a1, 1790, "35 35 35 358");
  LoadEightDotPattern(a1, 1791, "1258");
  LoadEightDotPattern(a1, 2305, "38");
  LoadEightDotPattern(a1, 2306, "568");
  LoadEightDotPattern(a1, 2307, "68");
  LoadEightDotPattern(a1, 2309, "18");
  LoadEightDotPattern(a1, 2310, "3458");
  LoadEightDotPattern(a1, 2311, "248");
  LoadEightDotPattern(a1, 2312, "358");
  LoadEightDotPattern(a1, 2313, "1368");
  LoadEightDotPattern(a1, 2314, "12568");
  LoadEightDotPattern(a1, 2315, "5 12358");
  LoadEightDotPattern(a1, 2316, "4 123 5 12358");
  LoadEightDotPattern(a1, 2317, "268");
  LoadEightDotPattern(a1, 2318, "4 12358");
  LoadEightDotPattern(a1, 2319, "158");
  LoadEightDotPattern(a1, 2320, "348");
  LoadEightDotPattern(a1, 2321, "3458");
  LoadEightDotPattern(a1, 2322, "68");
  LoadEightDotPattern(a1, 2323, "1358");
  LoadEightDotPattern(a1, 2324, "2468");
  LoadEightDotPattern(a1, 2325, "138");
  LoadEightDotPattern(a1, 2326, "468");
  LoadEightDotPattern(a1, 2327, "12458");
  LoadEightDotPattern(a1, 2328, "1268");
  LoadEightDotPattern(a1, 2329, "3468");
  LoadEightDotPattern(a1, 2330, "148");
  LoadEightDotPattern(a1, 2331, "168");
  LoadEightDotPattern(a1, 2332, "2458");
  LoadEightDotPattern(a1, 2333, "3568");
  LoadEightDotPattern(a1, 2334, "258");
  LoadEightDotPattern(a1, 2335, "234568");
  LoadEightDotPattern(a1, 2336, "24568");
  LoadEightDotPattern(a1, 2337, "12468");
  LoadEightDotPattern(a1, 2338, "1234568");
  LoadEightDotPattern(a1, 2339, "34568");
  LoadEightDotPattern(a1, 2340, "23458");
  LoadEightDotPattern(a1, 2341, "14568");
  LoadEightDotPattern(a1, 2342, "1458");
  LoadEightDotPattern(a1, 2343, "23468");
  LoadEightDotPattern(a1, 2344, "13458");
  LoadEightDotPattern(a1, 2345, "34568");
  LoadEightDotPattern(a1, 2346, "12348");
  LoadEightDotPattern(a1, 2347, "2358");
  LoadEightDotPattern(a1, 2348, "128");
  LoadEightDotPattern(a1, 2349, "458");
  LoadEightDotPattern(a1, 2350, "1348");
  LoadEightDotPattern(a1, 2351, "134568");
  LoadEightDotPattern(a1, 2352, "12358");
  LoadEightDotPattern(a1, 2353, "12358");
  LoadEightDotPattern(a1, 2354, "1238");
  LoadEightDotPattern(a1, 2355, "4568");
  LoadEightDotPattern(a1, 2356, "5 4568");
  LoadEightDotPattern(a1, 2357, "12368");
  LoadEightDotPattern(a1, 2358, "1468");
  LoadEightDotPattern(a1, 2359, "123468");
  LoadEightDotPattern(a1, 2360, "2348");
  LoadEightDotPattern(a1, 2361, "1258");
  LoadEightDotPattern(a1, 2365, "28");
  LoadEightDotPattern(a1, 2366, "3458");
  LoadEightDotPattern(a1, 2367, "248");
  LoadEightDotPattern(a1, 2368, "358");
  LoadEightDotPattern(a1, 2369, "1368");
  LoadEightDotPattern(a1, 2370, "12568");
  LoadEightDotPattern(a1, 2371, "5 12358");
  LoadEightDotPattern(a1, 2372, "4 123 5 12358");
  LoadEightDotPattern(a1, 2373, "268");
  LoadEightDotPattern(a1, 2374, "4 12358");
  LoadEightDotPattern(a1, 2375, "158");
  LoadEightDotPattern(a1, 2376, "348");
  LoadEightDotPattern(a1, 2377, "3458");
  LoadEightDotPattern(a1, 2378, "4 1235 3458");
  LoadEightDotPattern(a1, 2379, "1358");
  LoadEightDotPattern(a1, 2380, "2468");
  LoadEightDotPattern(a1, 2381, "48");
  LoadEightDotPattern(a1, 2384, "1 1256 38");
  LoadEightDotPattern(a1, 2385, "48");
  LoadEightDotPattern(a1, 2386, "58");
  LoadEightDotPattern(a1, 2392, "138");
  LoadEightDotPattern(a1, 2393, "468");
  LoadEightDotPattern(a1, 2394, "12458");
  LoadEightDotPattern(a1, 2395, "2458");
  LoadEightDotPattern(a1, 2396, "124568");
  LoadEightDotPattern(a1, 2397, "5 124568");
  LoadEightDotPattern(a1, 2398, "2358");
  LoadEightDotPattern(a1, 2399, "134568");
  LoadEightDotPattern(a1, 2400, "6 12358");
  LoadEightDotPattern(a1, 2401, "6 1238");
  LoadEightDotPattern(a1, 2402, "5 1238");
  LoadEightDotPattern(a1, 2403, "6 1238");
  LoadEightDotPattern(a1, 2404, "2568");
  LoadEightDotPattern(a1, 2405, "256 2568");
  LoadEightDotPattern(a1, 2406, "2458");
  LoadEightDotPattern(a1, 2407, "18");
  LoadEightDotPattern(a1, 2408, "128");
  LoadEightDotPattern(a1, 2409, "148");
  LoadEightDotPattern(a1, 2410, "1458");
  LoadEightDotPattern(a1, 2411, "158");
  LoadEightDotPattern(a1, 2412, "1248");
  LoadEightDotPattern(a1, 2413, "12458");
  LoadEightDotPattern(a1, 2414, "1258");
  LoadEightDotPattern(a1, 2415, "248");
  LoadEightDotPattern(a1, 2416, "2568");
  LoadEightDotPattern(a1, 2433, "38");
  LoadEightDotPattern(a1, 2434, "568");
  LoadEightDotPattern(a1, 2435, "68");
  LoadEightDotPattern(a1, 2437, "18");
  LoadEightDotPattern(a1, 2438, "3458");
  LoadEightDotPattern(a1, 2439, "248");
  LoadEightDotPattern(a1, 2440, "358");
  LoadEightDotPattern(a1, 2441, "1368");
  LoadEightDotPattern(a1, 2442, "12568");
  LoadEightDotPattern(a1, 2443, "5 12358");
  LoadEightDotPattern(a1, 2444, "5 1238");
  LoadEightDotPattern(a1, 2447, "158");
  LoadEightDotPattern(a1, 2448, "348");
  LoadEightDotPattern(a1, 2451, "1358");
  LoadEightDotPattern(a1, 2452, "2468");
  LoadEightDotPattern(a1, 2453, "138");
  LoadEightDotPattern(a1, 2454, "468");
  LoadEightDotPattern(a1, 2455, "12458");
  LoadEightDotPattern(a1, 2456, "1268");
  LoadEightDotPattern(a1, 2457, "3468");
  LoadEightDotPattern(a1, 2458, "148");
  LoadEightDotPattern(a1, 2459, "168");
  LoadEightDotPattern(a1, 2460, "2458");
  LoadEightDotPattern(a1, 2461, "3568");
  LoadEightDotPattern(a1, 2462, "258");
  LoadEightDotPattern(a1, 2463, "234568");
  LoadEightDotPattern(a1, 2464, "24568");
  LoadEightDotPattern(a1, 2465, "12468");
  LoadEightDotPattern(a1, 2466, "1234568");
  LoadEightDotPattern(a1, 2467, "34568");
  LoadEightDotPattern(a1, 2468, "23458");
  LoadEightDotPattern(a1, 2469, "14568");
  LoadEightDotPattern(a1, 2470, "1458");
  LoadEightDotPattern(a1, 2471, "23468");
  LoadEightDotPattern(a1, 2472, "13458");
  LoadEightDotPattern(a1, 2474, "12348");
  LoadEightDotPattern(a1, 2475, "2358");
  LoadEightDotPattern(a1, 2476, "128");
  LoadEightDotPattern(a1, 2477, "458");
  LoadEightDotPattern(a1, 2478, "1348");
  LoadEightDotPattern(a1, 2479, "134568");
  LoadEightDotPattern(a1, 2480, "12358");
  LoadEightDotPattern(a1, 2482, "1238");
  LoadEightDotPattern(a1, 2486, "1468");
  LoadEightDotPattern(a1, 2487, "123468");
  LoadEightDotPattern(a1, 2488, "2348");
  LoadEightDotPattern(a1, 2489, "1258");
  LoadEightDotPattern(a1, 2493, "28");
  LoadEightDotPattern(a1, 2494, "3458");
  LoadEightDotPattern(a1, 2495, "248");
  LoadEightDotPattern(a1, 2496, "358");
  LoadEightDotPattern(a1, 2497, "1368");
  LoadEightDotPattern(a1, 2498, "12568");
  LoadEightDotPattern(a1, 2499, "5 12358");
  LoadEightDotPattern(a1, 2500, "6 12358");
  LoadEightDotPattern(a1, 2503, "158");
  LoadEightDotPattern(a1, 2504, "348");
  LoadEightDotPattern(a1, 2507, "1358");
  LoadEightDotPattern(a1, 2508, "2468");
  LoadEightDotPattern(a1, 2509, "48");
  LoadEightDotPattern(a1, 2510, "4 23458");
  LoadEightDotPattern(a1, 2524, "124568");
  LoadEightDotPattern(a1, 2525, "5 124568");
  LoadEightDotPattern(a1, 2527, "468");
  LoadEightDotPattern(a1, 2528, "6 12358");
  LoadEightDotPattern(a1, 2529, "6 1238");
  LoadEightDotPattern(a1, 2530, "4 1238");
  LoadEightDotPattern(a1, 2531, "6 1238");
  LoadEightDotPattern(a1, 2534, "2458");
  LoadEightDotPattern(a1, 2535, "18");
  LoadEightDotPattern(a1, 2536, "128");
  LoadEightDotPattern(a1, 2537, "148");
  LoadEightDotPattern(a1, 2538, "1458");
  LoadEightDotPattern(a1, 2539, "158");
  LoadEightDotPattern(a1, 2540, "1248");
  LoadEightDotPattern(a1, 2541, "12458");
  LoadEightDotPattern(a1, 2542, "1258");
  LoadEightDotPattern(a1, 2543, "248");
  LoadEightDotPattern(a1, 2544, "12358");
  LoadEightDotPattern(a1, 2545, "12368");
  LoadEightDotPattern(a1, 2546, "1235 15 2568");
  LoadEightDotPattern(a1, 2547, "1235 15 2568");
  LoadEightDotPattern(a1, 2548, "18");
  LoadEightDotPattern(a1, 2549, "128");
  LoadEightDotPattern(a1, 2550, "148");
  LoadEightDotPattern(a1, 2551, "1458");
  LoadEightDotPattern(a1, 2552, "168");
  LoadEightDotPattern(a1, 2553, "1 1248");
  LoadEightDotPattern(a1, 2554, "168");
  LoadEightDotPattern(a1, 2561, "38");
  LoadEightDotPattern(a1, 2562, "568");
  LoadEightDotPattern(a1, 2563, "68");
  LoadEightDotPattern(a1, 2565, "18");
  LoadEightDotPattern(a1, 2566, "3458");
  LoadEightDotPattern(a1, 2567, "248");
  LoadEightDotPattern(a1, 2568, "358");
  LoadEightDotPattern(a1, 2569, "1368");
  LoadEightDotPattern(a1, 2570, "12568");
  LoadEightDotPattern(a1, 2575, "158");
  LoadEightDotPattern(a1, 2576, "348");
  LoadEightDotPattern(a1, 2579, "1358");
  LoadEightDotPattern(a1, 2580, "2468");
  LoadEightDotPattern(a1, 2581, "138");
  LoadEightDotPattern(a1, 2582, "468");
  LoadEightDotPattern(a1, 2583, "12458");
  LoadEightDotPattern(a1, 2584, "1268");
  LoadEightDotPattern(a1, 2585, "3468");
  LoadEightDotPattern(a1, 2586, "148");
  LoadEightDotPattern(a1, 2587, "168");
  LoadEightDotPattern(a1, 2588, "2458");
  LoadEightDotPattern(a1, 2589, "3568");
  LoadEightDotPattern(a1, 2590, "258");
  LoadEightDotPattern(a1, 2591, "234568");
  LoadEightDotPattern(a1, 2592, "24568");
  LoadEightDotPattern(a1, 2593, "12468");
  LoadEightDotPattern(a1, 2594, "1234568");
  LoadEightDotPattern(a1, 2595, "34568");
  LoadEightDotPattern(a1, 2596, "23458");
  LoadEightDotPattern(a1, 2597, "14568");
  LoadEightDotPattern(a1, 2598, "1458");
  LoadEightDotPattern(a1, 2599, "23468");
  LoadEightDotPattern(a1, 2600, "13458");
  LoadEightDotPattern(a1, 2602, "12348");
  LoadEightDotPattern(a1, 2603, "2358");
  LoadEightDotPattern(a1, 2604, "128");
  LoadEightDotPattern(a1, 2605, "458");
  LoadEightDotPattern(a1, 2606, "1348");
  LoadEightDotPattern(a1, 2607, "134568");
  LoadEightDotPattern(a1, 2608, "12358");
  LoadEightDotPattern(a1, 2610, "1238");
  LoadEightDotPattern(a1, 2611, "4568");
  LoadEightDotPattern(a1, 2613, "12368");
  LoadEightDotPattern(a1, 2614, "1468");
  LoadEightDotPattern(a1, 2616, "2348");
  LoadEightDotPattern(a1, 2617, "1258");
  LoadEightDotPattern(a1, 2621, "28");
  LoadEightDotPattern(a1, 2622, "3458");
  LoadEightDotPattern(a1, 2623, "248");
  LoadEightDotPattern(a1, 2624, "358");
  LoadEightDotPattern(a1, 2625, "1368");
  LoadEightDotPattern(a1, 2626, "12568");
  LoadEightDotPattern(a1, 2631, "158");
  LoadEightDotPattern(a1, 2632, "348");
  LoadEightDotPattern(a1, 2635, "1358");
  LoadEightDotPattern(a1, 2636, "2468");
  LoadEightDotPattern(a1, 2637, "48");
  LoadEightDotPattern(a1, 2641, "48");
  LoadEightDotPattern(a1, 2649, "13468");
  LoadEightDotPattern(a1, 2650, "5 12458");
  LoadEightDotPattern(a1, 2651, "13568");
  LoadEightDotPattern(a1, 2652, "124568");
  LoadEightDotPattern(a1, 2653, "123456 48");
  LoadEightDotPattern(a1, 2654, "1248");
  LoadEightDotPattern(a1, 2655, "13456 48");
  LoadEightDotPattern(a1, 2660, "2568");
  LoadEightDotPattern(a1, 2661, "256 2568");
  LoadEightDotPattern(a1, 2662, "2458");
  LoadEightDotPattern(a1, 2663, "18");
  LoadEightDotPattern(a1, 2664, "128");
  LoadEightDotPattern(a1, 2665, "148");
  LoadEightDotPattern(a1, 2666, "1458");
  LoadEightDotPattern(a1, 2667, "158");
  LoadEightDotPattern(a1, 2668, "1248");
  LoadEightDotPattern(a1, 2669, "12458");
  LoadEightDotPattern(a1, 2670, "1258");
  LoadEightDotPattern(a1, 2671, "248");
  LoadEightDotPattern(a1, 2672, "168");
  LoadEightDotPattern(a1, 2673, "168");
  LoadEightDotPattern(a1, 2674, "168");
  LoadEightDotPattern(a1, 2675, "168");
  LoadEightDotPattern(a1, 2676, "168");
  LoadEightDotPattern(a1, 2689, "38");
  LoadEightDotPattern(a1, 2690, "568");
  LoadEightDotPattern(a1, 2691, "68");
  LoadEightDotPattern(a1, 2693, "18");
  LoadEightDotPattern(a1, 2694, "3458");
  LoadEightDotPattern(a1, 2695, "248");
  LoadEightDotPattern(a1, 2696, "358");
  LoadEightDotPattern(a1, 2697, "1368");
  LoadEightDotPattern(a1, 2698, "12568");
  LoadEightDotPattern(a1, 2699, "5 12358");
  LoadEightDotPattern(a1, 2700, "5 1238");
  LoadEightDotPattern(a1, 2701, "268");
  LoadEightDotPattern(a1, 2703, "158");
  LoadEightDotPattern(a1, 2704, "348");
  LoadEightDotPattern(a1, 2705, "13468");
  LoadEightDotPattern(a1, 2707, "1358");
  LoadEightDotPattern(a1, 2708, "2468");
  LoadEightDotPattern(a1, 2709, "138");
  LoadEightDotPattern(a1, 2710, "468");
  LoadEightDotPattern(a1, 2711, "12458");
  LoadEightDotPattern(a1, 2712, "1268");
  LoadEightDotPattern(a1, 2713, "3468");
  LoadEightDotPattern(a1, 2714, "148");
  LoadEightDotPattern(a1, 2715, "168");
  LoadEightDotPattern(a1, 2716, "2458");
  LoadEightDotPattern(a1, 2717, "3568");
  LoadEightDotPattern(a1, 2718, "258");
  LoadEightDotPattern(a1, 2719, "234568");
  LoadEightDotPattern(a1, 2720, "24568");
  LoadEightDotPattern(a1, 2721, "12468");
  LoadEightDotPattern(a1, 2722, "1234568");
  LoadEightDotPattern(a1, 2723, "34568");
  LoadEightDotPattern(a1, 2724, "23458");
  LoadEightDotPattern(a1, 2725, "14568");
  LoadEightDotPattern(a1, 2726, "1458");
  LoadEightDotPattern(a1, 2727, "23468");
  LoadEightDotPattern(a1, 2728, "13458");
  LoadEightDotPattern(a1, 2730, "12348");
  LoadEightDotPattern(a1, 2731, "2358");
  LoadEightDotPattern(a1, 2732, "128");
  LoadEightDotPattern(a1, 2733, "458");
  LoadEightDotPattern(a1, 2734, "1348");
  LoadEightDotPattern(a1, 2735, "134568");
  LoadEightDotPattern(a1, 2736, "12358");
  LoadEightDotPattern(a1, 2738, "1238");
  LoadEightDotPattern(a1, 2739, "4568");
  LoadEightDotPattern(a1, 2741, "12368");
  LoadEightDotPattern(a1, 2742, "1468");
  LoadEightDotPattern(a1, 2743, "123468");
  LoadEightDotPattern(a1, 2744, "2348");
  LoadEightDotPattern(a1, 2745, "1258");
  LoadEightDotPattern(a1, 2749, "28");
  LoadEightDotPattern(a1, 2750, "3458");
  LoadEightDotPattern(a1, 2751, "248");
  LoadEightDotPattern(a1, 2752, "358");
  LoadEightDotPattern(a1, 2753, "1368");
  LoadEightDotPattern(a1, 2754, "12568");
  LoadEightDotPattern(a1, 2755, "5 12358");
  LoadEightDotPattern(a1, 2756, "6 12358");
  LoadEightDotPattern(a1, 2757, "268");
  LoadEightDotPattern(a1, 2759, "158");
  LoadEightDotPattern(a1, 2760, "348");
  LoadEightDotPattern(a1, 2761, "13468");
  LoadEightDotPattern(a1, 2763, "1358");
  LoadEightDotPattern(a1, 2764, "2468");
  LoadEightDotPattern(a1, 2765, "48");
  LoadEightDotPattern(a1, 2768, "135 4 1348");
  LoadEightDotPattern(a1, 2784, "6 12358");
  LoadEightDotPattern(a1, 2785, "6 1238");
  LoadEightDotPattern(a1, 2786, "5 1238");
  LoadEightDotPattern(a1, 2787, "6 1238");
  LoadEightDotPattern(a1, 2790, "2458");
  LoadEightDotPattern(a1, 2791, "18");
  LoadEightDotPattern(a1, 2792, "128");
  LoadEightDotPattern(a1, 2793, "148");
  LoadEightDotPattern(a1, 2794, "1458");
  LoadEightDotPattern(a1, 2795, "158");
  LoadEightDotPattern(a1, 2796, "1248");
  LoadEightDotPattern(a1, 2797, "12458");
  LoadEightDotPattern(a1, 2798, "1258");
  LoadEightDotPattern(a1, 2799, "248");
  LoadEightDotPattern(a1, 2801, "1235 1256 2568");
  LoadEightDotPattern(a1, 2817, "38");
  LoadEightDotPattern(a1, 2818, "568");
  LoadEightDotPattern(a1, 2819, "68");
  LoadEightDotPattern(a1, 2821, "18");
  LoadEightDotPattern(a1, 2822, "3458");
  LoadEightDotPattern(a1, 2823, "248");
  LoadEightDotPattern(a1, 2824, "358");
  LoadEightDotPattern(a1, 2825, "1368");
  LoadEightDotPattern(a1, 2826, "12568");
  LoadEightDotPattern(a1, 2827, "5 12358");
  LoadEightDotPattern(a1, 2828, "5 1238");
  LoadEightDotPattern(a1, 2831, "158");
  LoadEightDotPattern(a1, 2832, "348");
  LoadEightDotPattern(a1, 2835, "1358");
  LoadEightDotPattern(a1, 2836, "2468");
  LoadEightDotPattern(a1, 2837, "138");
  LoadEightDotPattern(a1, 2838, "468");
  LoadEightDotPattern(a1, 2839, "12458");
  LoadEightDotPattern(a1, 2840, "1268");
  LoadEightDotPattern(a1, 2841, "3468");
  LoadEightDotPattern(a1, 2842, "148");
  LoadEightDotPattern(a1, 2843, "168");
  LoadEightDotPattern(a1, 2844, "2458");
  LoadEightDotPattern(a1, 2845, "3568");
  LoadEightDotPattern(a1, 2846, "258");
  LoadEightDotPattern(a1, 2847, "234568");
  LoadEightDotPattern(a1, 2848, "24568");
  LoadEightDotPattern(a1, 2849, "12468");
  LoadEightDotPattern(a1, 2850, "1234568");
  LoadEightDotPattern(a1, 2851, "34568");
  LoadEightDotPattern(a1, 2852, "23458");
  LoadEightDotPattern(a1, 2853, "14568");
  LoadEightDotPattern(a1, 2854, "1458");
  LoadEightDotPattern(a1, 2855, "23468");
  LoadEightDotPattern(a1, 2856, "13458");
  LoadEightDotPattern(a1, 2858, "12348");
  LoadEightDotPattern(a1, 2859, "2358");
  LoadEightDotPattern(a1, 2860, "128");
  LoadEightDotPattern(a1, 2861, "458");
  LoadEightDotPattern(a1, 2862, "1348");
  LoadEightDotPattern(a1, 2863, "134568");
  LoadEightDotPattern(a1, 2864, "12358");
  LoadEightDotPattern(a1, 2866, "1238");
  LoadEightDotPattern(a1, 2867, "4568");
  LoadEightDotPattern(a1, 2869, "12368");
  LoadEightDotPattern(a1, 2870, "1468");
  LoadEightDotPattern(a1, 2871, "123468");
  LoadEightDotPattern(a1, 2872, "2348");
  LoadEightDotPattern(a1, 2873, "1258");
  LoadEightDotPattern(a1, 2877, "28");
  LoadEightDotPattern(a1, 2878, "3458");
  LoadEightDotPattern(a1, 2879, "248");
  LoadEightDotPattern(a1, 2880, "358");
  LoadEightDotPattern(a1, 2881, "1368");
  LoadEightDotPattern(a1, 2882, "12568");
  LoadEightDotPattern(a1, 2883, "5 12358");
  LoadEightDotPattern(a1, 2884, "6 12358");
  LoadEightDotPattern(a1, 2887, "158");
  LoadEightDotPattern(a1, 2888, "348");
  LoadEightDotPattern(a1, 2891, "1358");
  LoadEightDotPattern(a1, 2892, "2468");
  LoadEightDotPattern(a1, 2893, "48");
  LoadEightDotPattern(a1, 2908, "1246 48");
  LoadEightDotPattern(a1, 2909, "123456 48");
  LoadEightDotPattern(a1, 2911, "468");
  LoadEightDotPattern(a1, 2912, "6 12358");
  LoadEightDotPattern(a1, 2913, "6 1238");
  LoadEightDotPattern(a1, 2914, "4 1238");
  LoadEightDotPattern(a1, 2915, "6 1238");
  LoadEightDotPattern(a1, 2916, "2568");
  LoadEightDotPattern(a1, 2917, "256 2568");
  LoadEightDotPattern(a1, 2918, "2458");
  LoadEightDotPattern(a1, 2919, "18");
  LoadEightDotPattern(a1, 2920, "128");
  LoadEightDotPattern(a1, 2921, "148");
  LoadEightDotPattern(a1, 2922, "1458");
  LoadEightDotPattern(a1, 2923, "158");
  LoadEightDotPattern(a1, 2924, "1248");
  LoadEightDotPattern(a1, 2925, "12458");
  LoadEightDotPattern(a1, 2926, "1258");
  LoadEightDotPattern(a1, 2927, "248");
  LoadEightDotPattern(a1, 2928, "168");
  LoadEightDotPattern(a1, 2929, "168");
  LoadEightDotPattern(a1, 2946, "568");
  LoadEightDotPattern(a1, 2947, "68");
  LoadEightDotPattern(a1, 2949, "18");
  LoadEightDotPattern(a1, 2950, "3458");
  LoadEightDotPattern(a1, 2951, "248");
  LoadEightDotPattern(a1, 2952, "358");
  LoadEightDotPattern(a1, 2953, "1368");
  LoadEightDotPattern(a1, 2954, "12568");
  LoadEightDotPattern(a1, 2958, "268");
  LoadEightDotPattern(a1, 2959, "158");
  LoadEightDotPattern(a1, 2960, "348");
  LoadEightDotPattern(a1, 2962, "13468");
  LoadEightDotPattern(a1, 2963, "1358");
  LoadEightDotPattern(a1, 2964, "2468");
  LoadEightDotPattern(a1, 2965, "138");
  LoadEightDotPattern(a1, 2969, "3468");
  LoadEightDotPattern(a1, 2970, "148");
  LoadEightDotPattern(a1, 2972, "2458");
  LoadEightDotPattern(a1, 2974, "258");
  LoadEightDotPattern(a1, 2975, "234568");
  LoadEightDotPattern(a1, 2979, "34568");
  LoadEightDotPattern(a1, 2980, "23458");
  LoadEightDotPattern(a1, 2984, "13458");
  LoadEightDotPattern(a1, 2985, "568");
  LoadEightDotPattern(a1, 2986, "12348");
  LoadEightDotPattern(a1, 2990, "1348");
  LoadEightDotPattern(a1, 2991, "134568");
  LoadEightDotPattern(a1, 2992, "12358");
  LoadEightDotPattern(a1, 2993, "124568");
  LoadEightDotPattern(a1, 2994, "1238");
  LoadEightDotPattern(a1, 2995, "4568");
  LoadEightDotPattern(a1, 2996, "123568");
  LoadEightDotPattern(a1, 2997, "12368");
  LoadEightDotPattern(a1, 2998, "1468");
  LoadEightDotPattern(a1, 2999, "123468");
  LoadEightDotPattern(a1, 3000, "2348");
  LoadEightDotPattern(a1, 3001, "1258");
  LoadEightDotPattern(a1, 3006, "3458");
  LoadEightDotPattern(a1, 3007, "248");
  LoadEightDotPattern(a1, 3008, "358");
  LoadEightDotPattern(a1, 3009, "1368");
  LoadEightDotPattern(a1, 3010, "12568");
  LoadEightDotPattern(a1, 3014, "268");
  LoadEightDotPattern(a1, 3015, "158");
  LoadEightDotPattern(a1, 3016, "348");
  LoadEightDotPattern(a1, 3018, "13468");
  LoadEightDotPattern(a1, 3019, "1358");
  LoadEightDotPattern(a1, 3020, "2468");
  LoadEightDotPattern(a1, 3021, "48");
  LoadEightDotPattern(a1, 3024, "135 4 1348");
  LoadEightDotPattern(a1, 3046, "2458");
  LoadEightDotPattern(a1, 3047, "18");
  LoadEightDotPattern(a1, 3048, "128");
  LoadEightDotPattern(a1, 3049, "148");
  LoadEightDotPattern(a1, 3050, "1458");
  LoadEightDotPattern(a1, 3051, "158");
  LoadEightDotPattern(a1, 3052, "1248");
  LoadEightDotPattern(a1, 3053, "12458");
  LoadEightDotPattern(a1, 3054, "1258");
  LoadEightDotPattern(a1, 3055, "248");
  LoadEightDotPattern(a1, 3056, "2458");
  LoadEightDotPattern(a1, 3057, "245 2458");
  LoadEightDotPattern(a1, 3058, "245 245 2458");
  LoadEightDotPattern(a1, 3059, "348");
  LoadEightDotPattern(a1, 3060, "348");
  LoadEightDotPattern(a1, 3061, "348");
  LoadEightDotPattern(a1, 3062, "368");
  LoadEightDotPattern(a1, 3063, "3468");
  LoadEightDotPattern(a1, 3064, "58");
  LoadEightDotPattern(a1, 3065, "1235 15 2568");
  LoadEightDotPattern(a1, 3066, "58");
  LoadEightDotPattern(a1, 3073, "38");
  LoadEightDotPattern(a1, 3074, "568");
  LoadEightDotPattern(a1, 3075, "68");
  LoadEightDotPattern(a1, 3077, "18");
  LoadEightDotPattern(a1, 3078, "3458");
  LoadEightDotPattern(a1, 3079, "248");
  LoadEightDotPattern(a1, 3080, "358");
  LoadEightDotPattern(a1, 3081, "1368");
  LoadEightDotPattern(a1, 3082, "12568");
  LoadEightDotPattern(a1, 3083, "5 12358");
  LoadEightDotPattern(a1, 3084, "5 1238");
  LoadEightDotPattern(a1, 3086, "268");
  LoadEightDotPattern(a1, 3087, "158");
  LoadEightDotPattern(a1, 3088, "348");
  LoadEightDotPattern(a1, 3090, "13468");
  LoadEightDotPattern(a1, 3091, "1358");
  LoadEightDotPattern(a1, 3092, "2468");
  LoadEightDotPattern(a1, 3093, "138");
  LoadEightDotPattern(a1, 3094, "468");
  LoadEightDotPattern(a1, 3095, "12458");
  LoadEightDotPattern(a1, 3096, "1268");
  LoadEightDotPattern(a1, 3097, "3468");
  LoadEightDotPattern(a1, 3098, "148");
  LoadEightDotPattern(a1, 3099, "168");
  LoadEightDotPattern(a1, 3100, "2458");
  LoadEightDotPattern(a1, 3101, "3568");
  LoadEightDotPattern(a1, 3102, "258");
  LoadEightDotPattern(a1, 3103, "234568");
  LoadEightDotPattern(a1, 3104, "24568");
  LoadEightDotPattern(a1, 3105, "12468");
  LoadEightDotPattern(a1, 3106, "1234568");
  LoadEightDotPattern(a1, 3107, "34568");
  LoadEightDotPattern(a1, 3108, "23458");
  LoadEightDotPattern(a1, 3109, "14568");
  LoadEightDotPattern(a1, 3110, "1458");
  LoadEightDotPattern(a1, 3111, "23468");
  LoadEightDotPattern(a1, 3112, "13458");
  LoadEightDotPattern(a1, 3114, "12348");
  LoadEightDotPattern(a1, 3115, "2358");
  LoadEightDotPattern(a1, 3116, "128");
  LoadEightDotPattern(a1, 3117, "458");
  LoadEightDotPattern(a1, 3118, "1348");
  LoadEightDotPattern(a1, 3119, "134568");
  LoadEightDotPattern(a1, 3120, "12358");
  LoadEightDotPattern(a1, 3121, "124568");
  LoadEightDotPattern(a1, 3122, "1238");
  LoadEightDotPattern(a1, 3123, "4568");
  LoadEightDotPattern(a1, 3125, "12368");
  LoadEightDotPattern(a1, 3126, "1468");
  LoadEightDotPattern(a1, 3127, "123468");
  LoadEightDotPattern(a1, 3128, "2348");
  LoadEightDotPattern(a1, 3129, "1258");
  LoadEightDotPattern(a1, 3133, "28");
  LoadEightDotPattern(a1, 3134, "3458");
  LoadEightDotPattern(a1, 3135, "248");
  LoadEightDotPattern(a1, 3136, "358");
  LoadEightDotPattern(a1, 3137, "1368");
  LoadEightDotPattern(a1, 3138, "12568");
  LoadEightDotPattern(a1, 3139, "5 12358");
  LoadEightDotPattern(a1, 3140, "6 12358");
  LoadEightDotPattern(a1, 3142, "268");
  LoadEightDotPattern(a1, 3143, "158");
  LoadEightDotPattern(a1, 3144, "348");
  LoadEightDotPattern(a1, 3146, "13468");
  LoadEightDotPattern(a1, 3147, "1358");
  LoadEightDotPattern(a1, 3148, "2468");
  LoadEightDotPattern(a1, 3149, "48");
  LoadEightDotPattern(a1, 3168, "6 12358");
  LoadEightDotPattern(a1, 3169, "6 1238");
  LoadEightDotPattern(a1, 3170, "4 1238");
  LoadEightDotPattern(a1, 3171, "6 1238");
  LoadEightDotPattern(a1, 3172, "2568");
  LoadEightDotPattern(a1, 3173, "256 2568");
  LoadEightDotPattern(a1, 3174, "2458");
  LoadEightDotPattern(a1, 3175, "18");
  LoadEightDotPattern(a1, 3176, "128");
  LoadEightDotPattern(a1, 3177, "148");
  LoadEightDotPattern(a1, 3178, "1458");
  LoadEightDotPattern(a1, 3179, "158");
  LoadEightDotPattern(a1, 3180, "1248");
  LoadEightDotPattern(a1, 3181, "12458");
  LoadEightDotPattern(a1, 3182, "1258");
  LoadEightDotPattern(a1, 3183, "248");
  LoadEightDotPattern(a1, 3192, "2458");
  LoadEightDotPattern(a1, 3193, "18");
  LoadEightDotPattern(a1, 3194, "128");
  LoadEightDotPattern(a1, 3195, "148");
  LoadEightDotPattern(a1, 3196, "2458");
  LoadEightDotPattern(a1, 3197, "18");
  LoadEightDotPattern(a1, 3198, "128");
  LoadEightDotPattern(a1, 3199, "148");
  LoadEightDotPattern(a1, 3202, "568");
  LoadEightDotPattern(a1, 3203, "68");
  LoadEightDotPattern(a1, 3205, "18");
  LoadEightDotPattern(a1, 3206, "3458");
  LoadEightDotPattern(a1, 3207, "248");
  LoadEightDotPattern(a1, 3208, "358");
  LoadEightDotPattern(a1, 3209, "1368");
  LoadEightDotPattern(a1, 3210, "12568");
  LoadEightDotPattern(a1, 3211, "5 12358");
  LoadEightDotPattern(a1, 3212, "5 1238");
  LoadEightDotPattern(a1, 3214, "268");
  LoadEightDotPattern(a1, 3215, "158");
  LoadEightDotPattern(a1, 3216, "348");
  LoadEightDotPattern(a1, 3218, "13468");
  LoadEightDotPattern(a1, 3219, "1358");
  LoadEightDotPattern(a1, 3220, "2468");
  LoadEightDotPattern(a1, 3221, "138");
  LoadEightDotPattern(a1, 3222, "468");
  LoadEightDotPattern(a1, 3223, "12458");
  LoadEightDotPattern(a1, 3224, "1268");
  LoadEightDotPattern(a1, 3225, "3468");
  LoadEightDotPattern(a1, 3226, "148");
  LoadEightDotPattern(a1, 3227, "168");
  LoadEightDotPattern(a1, 3228, "2458");
  LoadEightDotPattern(a1, 3229, "3568");
  LoadEightDotPattern(a1, 3230, "258");
  LoadEightDotPattern(a1, 3231, "234568");
  LoadEightDotPattern(a1, 3232, "24568");
  LoadEightDotPattern(a1, 3233, "12468");
  LoadEightDotPattern(a1, 3234, "1234568");
  LoadEightDotPattern(a1, 3235, "34568");
  LoadEightDotPattern(a1, 3236, "23458");
  LoadEightDotPattern(a1, 3237, "14568");
  LoadEightDotPattern(a1, 3238, "1458");
  LoadEightDotPattern(a1, 3239, "23468");
  LoadEightDotPattern(a1, 3240, "13458");
  LoadEightDotPattern(a1, 3242, "12348");
  LoadEightDotPattern(a1, 3243, "2358");
  LoadEightDotPattern(a1, 3244, "128");
  LoadEightDotPattern(a1, 3245, "458");
  LoadEightDotPattern(a1, 3246, "1348");
  LoadEightDotPattern(a1, 3247, "134568");
  LoadEightDotPattern(a1, 3248, "12358");
  LoadEightDotPattern(a1, 3249, "124568");
  LoadEightDotPattern(a1, 3250, "1238");
  LoadEightDotPattern(a1, 3251, "4568");
  LoadEightDotPattern(a1, 3253, "12368");
  LoadEightDotPattern(a1, 3254, "1468");
  LoadEightDotPattern(a1, 3255, "123468");
  LoadEightDotPattern(a1, 3256, "2348");
  LoadEightDotPattern(a1, 3257, "1258");
  LoadEightDotPattern(a1, 3261, "28");
  LoadEightDotPattern(a1, 3262, "3458");
  LoadEightDotPattern(a1, 3263, "248");
  LoadEightDotPattern(a1, 3264, "358");
  LoadEightDotPattern(a1, 3265, "1368");
  LoadEightDotPattern(a1, 3266, "12568");
  LoadEightDotPattern(a1, 3267, "5 12358");
  LoadEightDotPattern(a1, 3268, "6 12358");
  LoadEightDotPattern(a1, 3270, "268");
  LoadEightDotPattern(a1, 3271, "158");
  LoadEightDotPattern(a1, 3272, "348");
  LoadEightDotPattern(a1, 3274, "13468");
  LoadEightDotPattern(a1, 3275, "1358");
  LoadEightDotPattern(a1, 3276, "2468");
  LoadEightDotPattern(a1, 3277, "48");
  LoadEightDotPattern(a1, 3294, "123568");
  LoadEightDotPattern(a1, 3296, "6 12358");
  LoadEightDotPattern(a1, 3297, "6 1238");
  LoadEightDotPattern(a1, 3298, "4 1238");
  LoadEightDotPattern(a1, 3299, "6 1238");
  LoadEightDotPattern(a1, 3300, "2568");
  LoadEightDotPattern(a1, 3301, "256 2568");
  LoadEightDotPattern(a1, 3302, "2458");
  LoadEightDotPattern(a1, 3303, "18");
  LoadEightDotPattern(a1, 3304, "128");
  LoadEightDotPattern(a1, 3305, "148");
  LoadEightDotPattern(a1, 3306, "1458");
  LoadEightDotPattern(a1, 3307, "158");
  LoadEightDotPattern(a1, 3308, "1248");
  LoadEightDotPattern(a1, 3309, "12458");
  LoadEightDotPattern(a1, 3310, "1258");
  LoadEightDotPattern(a1, 3311, "248");
  LoadEightDotPattern(a1, 3313, "168");
  LoadEightDotPattern(a1, 3314, "168");
  LoadEightDotPattern(a1, 3330, "568");
  LoadEightDotPattern(a1, 3331, "68");
  LoadEightDotPattern(a1, 3333, "18");
  LoadEightDotPattern(a1, 3334, "3458");
  LoadEightDotPattern(a1, 3335, "248");
  LoadEightDotPattern(a1, 3336, "358");
  LoadEightDotPattern(a1, 3337, "1368");
  LoadEightDotPattern(a1, 3338, "12568");
  LoadEightDotPattern(a1, 3339, "5 12358");
  LoadEightDotPattern(a1, 3340, "5 1238");
  LoadEightDotPattern(a1, 3342, "268");
  LoadEightDotPattern(a1, 3343, "158");
  LoadEightDotPattern(a1, 3344, "348");
  LoadEightDotPattern(a1, 3346, "13468");
  LoadEightDotPattern(a1, 3347, "1358");
  LoadEightDotPattern(a1, 3348, "2468");
  LoadEightDotPattern(a1, 3349, "138");
  LoadEightDotPattern(a1, 3350, "468");
  LoadEightDotPattern(a1, 3351, "12458");
  LoadEightDotPattern(a1, 3352, "1268");
  LoadEightDotPattern(a1, 3353, "3468");
  LoadEightDotPattern(a1, 3354, "148");
  LoadEightDotPattern(a1, 3355, "168");
  LoadEightDotPattern(a1, 3356, "2458");
  LoadEightDotPattern(a1, 3357, "3568");
  LoadEightDotPattern(a1, 3358, "258");
  LoadEightDotPattern(a1, 3359, "234568");
  LoadEightDotPattern(a1, 3360, "24568");
  LoadEightDotPattern(a1, 3361, "12468");
  LoadEightDotPattern(a1, 3362, "1234568");
  LoadEightDotPattern(a1, 3363, "34568");
  LoadEightDotPattern(a1, 3364, "23458");
  LoadEightDotPattern(a1, 3365, "14568");
  LoadEightDotPattern(a1, 3366, "1458");
  LoadEightDotPattern(a1, 3367, "23468");
  LoadEightDotPattern(a1, 3368, "13458");
  LoadEightDotPattern(a1, 3370, "12348");
  LoadEightDotPattern(a1, 3371, "2358");
  LoadEightDotPattern(a1, 3372, "128");
  LoadEightDotPattern(a1, 3373, "458");
  LoadEightDotPattern(a1, 3374, "1348");
  LoadEightDotPattern(a1, 3375, "134568");
  LoadEightDotPattern(a1, 3376, "12358");
  LoadEightDotPattern(a1, 3377, "124568");
  LoadEightDotPattern(a1, 3378, "1238");
  LoadEightDotPattern(a1, 3379, "4568");
  LoadEightDotPattern(a1, 3380, "123568");
  LoadEightDotPattern(a1, 3381, "12368");
  LoadEightDotPattern(a1, 3382, "1468");
  LoadEightDotPattern(a1, 3383, "123468");
  LoadEightDotPattern(a1, 3384, "2348");
  LoadEightDotPattern(a1, 3385, "1258");
  LoadEightDotPattern(a1, 3389, "28");
  LoadEightDotPattern(a1, 3390, "3458");
  LoadEightDotPattern(a1, 3391, "248");
  LoadEightDotPattern(a1, 3392, "358");
  LoadEightDotPattern(a1, 3393, "1368");
  LoadEightDotPattern(a1, 3394, "12568");
  LoadEightDotPattern(a1, 3395, "5 12358");
  LoadEightDotPattern(a1, 3398, "268");
  LoadEightDotPattern(a1, 3399, "158");
  LoadEightDotPattern(a1, 3400, "348");
  LoadEightDotPattern(a1, 3402, "13468");
  LoadEightDotPattern(a1, 3403, "1358");
  LoadEightDotPattern(a1, 3404, "2468");
  LoadEightDotPattern(a1, 3405, "48");
  LoadEightDotPattern(a1, 3424, "6 12358");
  LoadEightDotPattern(a1, 3425, "6 1238");
  LoadEightDotPattern(a1, 3426, "4 1238");
  LoadEightDotPattern(a1, 3427, "6 1238");
  LoadEightDotPattern(a1, 3428, "2568");
  LoadEightDotPattern(a1, 3429, "256 2568");
  LoadEightDotPattern(a1, 3430, "2458");
  LoadEightDotPattern(a1, 3431, "18");
  LoadEightDotPattern(a1, 3432, "128");
  LoadEightDotPattern(a1, 3433, "148");
  LoadEightDotPattern(a1, 3434, "1458");
  LoadEightDotPattern(a1, 3435, "158");
  LoadEightDotPattern(a1, 3436, "1248");
  LoadEightDotPattern(a1, 3437, "12458");
  LoadEightDotPattern(a1, 3438, "1258");
  LoadEightDotPattern(a1, 3439, "248");
  LoadEightDotPattern(a1, 3458, "568");
  LoadEightDotPattern(a1, 3459, "68");
  LoadEightDotPattern(a1, 3461, "18");
  LoadEightDotPattern(a1, 3462, "3458");
  LoadEightDotPattern(a1, 3463, "123568");
  LoadEightDotPattern(a1, 3464, "124568");
  LoadEightDotPattern(a1, 3465, "248");
  LoadEightDotPattern(a1, 3466, "358");
  LoadEightDotPattern(a1, 3467, "1368");
  LoadEightDotPattern(a1, 3468, "12568");
  LoadEightDotPattern(a1, 3469, "5 12358");
  LoadEightDotPattern(a1, 3470, "6 12358");
  LoadEightDotPattern(a1, 3471, "4 1238");
  LoadEightDotPattern(a1, 3472, "123 1238");
  LoadEightDotPattern(a1, 3473, "158");
  LoadEightDotPattern(a1, 3474, "268");
  LoadEightDotPattern(a1, 3475, "348");
  LoadEightDotPattern(a1, 3476, "13468");
  LoadEightDotPattern(a1, 3477, "1358");
  LoadEightDotPattern(a1, 3478, "2468");
  LoadEightDotPattern(a1, 3482, "138");
  LoadEightDotPattern(a1, 3483, "468");
  LoadEightDotPattern(a1, 3484, "12458");
  LoadEightDotPattern(a1, 3485, "1268");
  LoadEightDotPattern(a1, 3486, "3468");
  LoadEightDotPattern(a1, 3487, "5 3468");
  LoadEightDotPattern(a1, 3488, "148");
  LoadEightDotPattern(a1, 3489, "168");
  LoadEightDotPattern(a1, 3490, "2458");
  LoadEightDotPattern(a1, 3491, "3568");
  LoadEightDotPattern(a1, 3492, "258");
  LoadEightDotPattern(a1, 3493, "123458");
  LoadEightDotPattern(a1, 3494, "268");
  LoadEightDotPattern(a1, 3495, "234568");
  LoadEightDotPattern(a1, 3496, "24568");
  LoadEightDotPattern(a1, 3497, "12468");
  LoadEightDotPattern(a1, 3498, "1234568");
  LoadEightDotPattern(a1, 3499, "13568");
  LoadEightDotPattern(a1, 3500, "5 13568");
  LoadEightDotPattern(a1, 3501, "23458");
  LoadEightDotPattern(a1, 3502, "14568");
  LoadEightDotPattern(a1, 3503, "1458");
  LoadEightDotPattern(a1, 3504, "23468");
  LoadEightDotPattern(a1, 3505, "13458");
  LoadEightDotPattern(a1, 3507, "5 1458");
  LoadEightDotPattern(a1, 3508, "12348");
  LoadEightDotPattern(a1, 3509, "1568");
  LoadEightDotPattern(a1, 3510, "128");
  LoadEightDotPattern(a1, 3511, "458");
  LoadEightDotPattern(a1, 3512, "1348");
  LoadEightDotPattern(a1, 3513, "23 128");
  LoadEightDotPattern(a1, 3514, "134568");
  LoadEightDotPattern(a1, 3515, "12358");
  LoadEightDotPattern(a1, 3517, "1238");
  LoadEightDotPattern(a1, 3520, "12368");
  LoadEightDotPattern(a1, 3521, "123468");
  LoadEightDotPattern(a1, 3522, "1468");
  LoadEightDotPattern(a1, 3523, "2348");
  LoadEightDotPattern(a1, 3524, "1258");
  LoadEightDotPattern(a1, 3525, "4568");
  LoadEightDotPattern(a1, 3526, "1248");
  LoadEightDotPattern(a1, 3530, "13468");
  LoadEightDotPattern(a1, 3535, "3458");
  LoadEightDotPattern(a1, 3536, "123568");
  LoadEightDotPattern(a1, 3537, "124568");
  LoadEightDotPattern(a1, 3538, "248");
  LoadEightDotPattern(a1, 3539, "358");
  LoadEightDotPattern(a1, 3540, "1368");
  LoadEightDotPattern(a1, 3542, "12568");
  LoadEightDotPattern(a1, 3544, "5 12358");
  LoadEightDotPattern(a1, 3545, "158");
  LoadEightDotPattern(a1, 3546, "268");
  LoadEightDotPattern(a1, 3547, "348");
  LoadEightDotPattern(a1, 3548, "15 3458");
  LoadEightDotPattern(a1, 3549, "15 345 13468");
  LoadEightDotPattern(a1, 3550, "15 4 1238");
  LoadEightDotPattern(a1, 3551, "4 1238");
  LoadEightDotPattern(a1, 3570, "6 12358");
  LoadEightDotPattern(a1, 3571, "123 1238");
  LoadEightDotPattern(a1, 3572, "256 2568");
  LoadEightDotPattern(a1, 3585, "12458");
  LoadEightDotPattern(a1, 3586, "138");
  LoadEightDotPattern(a1, 3587, "356 138");
  LoadEightDotPattern(a1, 3588, "1368");
  LoadEightDotPattern(a1, 3589, "36 1368");
  LoadEightDotPattern(a1, 3590, "6 1368");
  LoadEightDotPattern(a1, 3591, "124568");
  LoadEightDotPattern(a1, 3592, "2458");
  LoadEightDotPattern(a1, 3593, "348");
  LoadEightDotPattern(a1, 3594, "3468");
  LoadEightDotPattern(a1, 3595, "23468");
  LoadEightDotPattern(a1, 3596, "3468");
  LoadEightDotPattern(a1, 3597, "6 134568");
  LoadEightDotPattern(a1, 3598, "6 1458");
  LoadEightDotPattern(a1, 3599, "6 12568");
  LoadEightDotPattern(a1, 3600, "6 23458");
  LoadEightDotPattern(a1, 3601, "6 234568");
  LoadEightDotPattern(a1, 3602, "36 234568");
  LoadEightDotPattern(a1, 3603, "6 13458");
  LoadEightDotPattern(a1, 3604, "1458");
  LoadEightDotPattern(a1, 3605, "12568");
  LoadEightDotPattern(a1, 3606, "23458");
  LoadEightDotPattern(a1, 3607, "234568");
  LoadEightDotPattern(a1, 3608, "356 234568");
  LoadEightDotPattern(a1, 3609, "13458");
  LoadEightDotPattern(a1, 3610, "12368");
  LoadEightDotPattern(a1, 3611, "123468");
  LoadEightDotPattern(a1, 3612, "12348");
  LoadEightDotPattern(a1, 3613, "13468");
  LoadEightDotPattern(a1, 3614, "14568");
  LoadEightDotPattern(a1, 3615, "12468");
  LoadEightDotPattern(a1, 3616, "6 14568");
  LoadEightDotPattern(a1, 3617, "1348");
  LoadEightDotPattern(a1, 3618, "134568");
  LoadEightDotPattern(a1, 3619, "12358");
  LoadEightDotPattern(a1, 3620, "1235 28");
  LoadEightDotPattern(a1, 3621, "1238");
  LoadEightDotPattern(a1, 3622, "123 28");
  LoadEightDotPattern(a1, 3623, "24568");
  LoadEightDotPattern(a1, 3624, "6 2348");
  LoadEightDotPattern(a1, 3625, "36 2348");
  LoadEightDotPattern(a1, 3626, "2348");
  LoadEightDotPattern(a1, 3627, "1258");
  LoadEightDotPattern(a1, 3628, "6 1238");
  LoadEightDotPattern(a1, 3629, "1358");
  LoadEightDotPattern(a1, 3630, "1234568");
  LoadEightDotPattern(a1, 3631, "56 238");
  LoadEightDotPattern(a1, 3632, "18");
  LoadEightDotPattern(a1, 3633, "3458");
  LoadEightDotPattern(a1, 3634, "168");
  LoadEightDotPattern(a1, 3635, "13568");
  LoadEightDotPattern(a1, 3636, "128");
  LoadEightDotPattern(a1, 3637, "238");
  LoadEightDotPattern(a1, 3638, "2468");
  LoadEightDotPattern(a1, 3639, "268");
  LoadEightDotPattern(a1, 3640, "148");
  LoadEightDotPattern(a1, 3641, "258");
  LoadEightDotPattern(a1, 3642, "38");
  LoadEightDotPattern(a1, 3647, "45 168");
  LoadEightDotPattern(a1, 3648, "1248");
  LoadEightDotPattern(a1, 3649, "1268");
  LoadEightDotPattern(a1, 3650, "248");
  LoadEightDotPattern(a1, 3651, "156 28");
  LoadEightDotPattern(a1, 3652, "1568");
  LoadEightDotPattern(a1, 3653, "168");
  LoadEightDotPattern(a1, 3654, "28");
  LoadEightDotPattern(a1, 3655, "38");
  LoadEightDotPattern(a1, 3656, "358");
  LoadEightDotPattern(a1, 3657, "2568");
  LoadEightDotPattern(a1, 3658, "23568");
  LoadEightDotPattern(a1, 3659, "2368");
  LoadEightDotPattern(a1, 3660, "3568");
  LoadEightDotPattern(a1, 3661, "58");
  LoadEightDotPattern(a1, 3662, "168");
  LoadEightDotPattern(a1, 3663, "168");
  LoadEightDotPattern(a1, 3664, "2458");
  LoadEightDotPattern(a1, 3665, "18");
  LoadEightDotPattern(a1, 3666, "128");
  LoadEightDotPattern(a1, 3667, "148");
  LoadEightDotPattern(a1, 3668, "1458");
  LoadEightDotPattern(a1, 3669, "158");
  LoadEightDotPattern(a1, 3670, "1248");
  LoadEightDotPattern(a1, 3671, "12458");
  LoadEightDotPattern(a1, 3672, "1258");
  LoadEightDotPattern(a1, 3673, "248");
  LoadEightDotPattern(a1, 3674, "168");
  LoadEightDotPattern(a1, 3675, "168");
  LoadEightDotPattern(a1, 3713, "12458");
  LoadEightDotPattern(a1, 3714, "138");
  LoadEightDotPattern(a1, 3716, "1368");
  LoadEightDotPattern(a1, 3719, "124568");
  LoadEightDotPattern(a1, 3720, "2458");
  LoadEightDotPattern(a1, 3722, "23468");
  LoadEightDotPattern(a1, 3725, "134568");
  LoadEightDotPattern(a1, 3732, "1458");
  LoadEightDotPattern(a1, 3733, "12568");
  LoadEightDotPattern(a1, 3734, "23458");
  LoadEightDotPattern(a1, 3735, "234568");
  LoadEightDotPattern(a1, 3737, "13458");
  LoadEightDotPattern(a1, 3738, "12368");
  LoadEightDotPattern(a1, 3739, "123468");
  LoadEightDotPattern(a1, 3740, "12348");
  LoadEightDotPattern(a1, 3741, "13468");
  LoadEightDotPattern(a1, 3742, "14568");
  LoadEightDotPattern(a1, 3743, "12468");
  LoadEightDotPattern(a1, 3745, "1348");
  LoadEightDotPattern(a1, 3746, "6 134568");
  LoadEightDotPattern(a1, 3747, "12358");
  LoadEightDotPattern(a1, 3749, "1238");
  LoadEightDotPattern(a1, 3751, "2468");
  LoadEightDotPattern(a1, 3754, "2348");
  LoadEightDotPattern(a1, 3755, "1258");
  LoadEightDotPattern(a1, 3757, "1358");
  LoadEightDotPattern(a1, 3758, "1234568");
  LoadEightDotPattern(a1, 3760, "18");
  LoadEightDotPattern(a1, 3761, "3458");
  LoadEightDotPattern(a1, 3762, "168");
  LoadEightDotPattern(a1, 3763, "13568");
  LoadEightDotPattern(a1, 3764, "128");
  LoadEightDotPattern(a1, 3765, "238");
  LoadEightDotPattern(a1, 3766, "2468");
  LoadEightDotPattern(a1, 3767, "268");
  LoadEightDotPattern(a1, 3768, "368");
  LoadEightDotPattern(a1, 3769, "258");
  LoadEightDotPattern(a1, 3771, "148");
  LoadEightDotPattern(a1, 3773, "4568");
  LoadEightDotPattern(a1, 3776, "1248");
  LoadEightDotPattern(a1, 3777, "1268");
  LoadEightDotPattern(a1, 3778, "248");
  LoadEightDotPattern(a1, 3779, "156 28");
  LoadEightDotPattern(a1, 3780, "1568");
  LoadEightDotPattern(a1, 3782, "28");
  LoadEightDotPattern(a1, 3784, "358");
  LoadEightDotPattern(a1, 3785, "2568");
  LoadEightDotPattern(a1, 3786, "23568");
  LoadEightDotPattern(a1, 3787, "2368");
  LoadEightDotPattern(a1, 3789, "1358");
  LoadEightDotPattern(a1, 3792, "2458");
  LoadEightDotPattern(a1, 3793, "18");
  LoadEightDotPattern(a1, 3794, "128");
  LoadEightDotPattern(a1, 3795, "148");
  LoadEightDotPattern(a1, 3796, "1458");
  LoadEightDotPattern(a1, 3797, "158");
  LoadEightDotPattern(a1, 3798, "1248");
  LoadEightDotPattern(a1, 3799, "12458");
  LoadEightDotPattern(a1, 3800, "1258");
  LoadEightDotPattern(a1, 3801, "248");
  LoadEightDotPattern(a1, 3804, "125 13458");
  LoadEightDotPattern(a1, 3805, "125 1348");
  LoadEightDotPattern(a1, 3840, "1 135 1348");
  LoadEightDotPattern(a1, 3841, "18");
  LoadEightDotPattern(a1, 3842, "1246 136 12568");
  LoadEightDotPattern(a1, 3843, "1246 136 12568");
  LoadEightDotPattern(a1, 3853, "238");
  LoadEightDotPattern(a1, 3854, "23 238");
  LoadEightDotPattern(a1, 3872, "2458");
  LoadEightDotPattern(a1, 3873, "18");
  LoadEightDotPattern(a1, 3874, "128");
  LoadEightDotPattern(a1, 3875, "148");
  LoadEightDotPattern(a1, 3876, "1458");
  LoadEightDotPattern(a1, 3877, "158");
  LoadEightDotPattern(a1, 3878, "1248");
  LoadEightDotPattern(a1, 3879, "12458");
  LoadEightDotPattern(a1, 3880, "1258");
  LoadEightDotPattern(a1, 3881, "248");
  LoadEightDotPattern(a1, 3882, "245 46 158");
  LoadEightDotPattern(a1, 3883, "1 46 2458");
  LoadEightDotPattern(a1, 3884, "12 46 2458");
  LoadEightDotPattern(a1, 3885, "14 46 2458");
  LoadEightDotPattern(a1, 3886, "145 46 2458");
  LoadEightDotPattern(a1, 3887, "15 46 2458");
  LoadEightDotPattern(a1, 3888, "124 46 2458");
  LoadEightDotPattern(a1, 3889, "1245 46 2458");
  LoadEightDotPattern(a1, 3890, "125 46 158");
  LoadEightDotPattern(a1, 3891, "24 46 158");
  LoadEightDotPattern(a1, 3904, "138");
  LoadEightDotPattern(a1, 3905, "148");
  LoadEightDotPattern(a1, 3906, "12458");
  LoadEightDotPattern(a1, 3907, "1245 2368");
  LoadEightDotPattern(a1, 3908, "23568");
  LoadEightDotPattern(a1, 3909, "14568");
  LoadEightDotPattern(a1, 3910, "134568");
  LoadEightDotPattern(a1, 3911, "123458");
  LoadEightDotPattern(a1, 3913, "3458");
  LoadEightDotPattern(a1, 3914, "12568");
  LoadEightDotPattern(a1, 3915, "123568");
  LoadEightDotPattern(a1, 3916, "1248");
  LoadEightDotPattern(a1, 3917, "124 2368");
  LoadEightDotPattern(a1, 3918, "5 13458");
  LoadEightDotPattern(a1, 3919, "23458");
  LoadEightDotPattern(a1, 3920, "234568");
  LoadEightDotPattern(a1, 3921, "1458");
  LoadEightDotPattern(a1, 3922, "145 2368");
  LoadEightDotPattern(a1, 3923, "13458");
  LoadEightDotPattern(a1, 3924, "12348");
  LoadEightDotPattern(a1, 3925, "123468");
  LoadEightDotPattern(a1, 3926, "128");
  LoadEightDotPattern(a1, 3927, "12 2368");
  LoadEightDotPattern(a1, 3928, "1348");
  LoadEightDotPattern(a1, 3929, "13468");
  LoadEightDotPattern(a1, 3930, "13568");
  LoadEightDotPattern(a1, 3931, "1234568");
  LoadEightDotPattern(a1, 3932, "123456 2368");
  LoadEightDotPattern(a1, 3933, "24568");
  LoadEightDotPattern(a1, 3934, "1468");
  LoadEightDotPattern(a1, 3935, "2348");
  LoadEightDotPattern(a1, 3936, "12468");
  LoadEightDotPattern(a1, 3937, "2458");
  LoadEightDotPattern(a1, 3938, "12358");
  LoadEightDotPattern(a1, 3939, "1238");
  LoadEightDotPattern(a1, 3940, "1568");
  LoadEightDotPattern(a1, 3941, "5 1568");
  LoadEightDotPattern(a1, 3942, "23468");
  LoadEightDotPattern(a1, 3943, "1258");
  LoadEightDotPattern(a1, 3944, "18");
  LoadEightDotPattern(a1, 3945, "13 6 5 1568");
  LoadEightDotPattern(a1, 3946, "12358");
  LoadEightDotPattern(a1, 3953, "6 12568");
  LoadEightDotPattern(a1, 3954, "248");
  LoadEightDotPattern(a1, 3955, "24 6 12568");
  LoadEightDotPattern(a1, 3956, "1368");
  LoadEightDotPattern(a1, 3957, "6 1256 1368");
  LoadEightDotPattern(a1, 3958, "145 235 5 248");
  LoadEightDotPattern(a1, 3959, "145 235 5 24 6 12568");
  LoadEightDotPattern(a1, 3960, "1236 6 1256 5 248");
  LoadEightDotPattern(a1, 3961, "1236 6 1256 5 248");
  LoadEightDotPattern(a1, 3962, "158");
  LoadEightDotPattern(a1, 3963, "15 158");
  LoadEightDotPattern(a1, 3964, "1358");
  LoadEightDotPattern(a1, 3965, "135 1358");
  LoadEightDotPattern(a1, 3966, "1348");
  LoadEightDotPattern(a1, 3968, "5 248");
  LoadEightDotPattern(a1, 3969, "6 1256 5 248");
  LoadEightDotPattern(a1, 3984, "6 138");
  LoadEightDotPattern(a1, 3985, "6 148");
  LoadEightDotPattern(a1, 3986, "6 12458");
  LoadEightDotPattern(a1, 3987, "6 1245 2368");
  LoadEightDotPattern(a1, 3988, "6 23568");
  LoadEightDotPattern(a1, 3989, "6 14568");
  LoadEightDotPattern(a1, 3990, "6 134568");
  LoadEightDotPattern(a1, 3991, "6 123458");
  LoadEightDotPattern(a1, 3993, "6 3458");
  LoadEightDotPattern(a1, 3994, "12568");
  LoadEightDotPattern(a1, 3995, "123568");
  LoadEightDotPattern(a1, 3996, "1248");
  LoadEightDotPattern(a1, 3997, "6 124 2368");
  LoadEightDotPattern(a1, 3998, "6 5 13568");
  LoadEightDotPattern(a1, 3999, "6 12458");
  LoadEightDotPattern(a1, 4000, "6 234568");
  LoadEightDotPattern(a1, 4001, "6 1458");
  LoadEightDotPattern(a1, 4002, "6 145 2368");
  LoadEightDotPattern(a1, 4003, "6 13458");
  LoadEightDotPattern(a1, 4004, "6 12348");
  LoadEightDotPattern(a1, 4005, "6 123468");
  LoadEightDotPattern(a1, 4006, "6 128");
  LoadEightDotPattern(a1, 4007, "6 12 2368");
  LoadEightDotPattern(a1, 4008, "6 1348");
  LoadEightDotPattern(a1, 4009, "6 13468");
  LoadEightDotPattern(a1, 4010, "6 13568");
  LoadEightDotPattern(a1, 4011, "6 1234568");
  LoadEightDotPattern(a1, 4012, "6 123456 2368");
  LoadEightDotPattern(a1, 4013, "2568");
  LoadEightDotPattern(a1, 4014, "6 1468");
  LoadEightDotPattern(a1, 4015, "6 2348");
  LoadEightDotPattern(a1, 4016, "6 12468");
  LoadEightDotPattern(a1, 4017, "3568");
  LoadEightDotPattern(a1, 4018, "2358");
  LoadEightDotPattern(a1, 4019, "12368");
  LoadEightDotPattern(a1, 4020, "6 1568");
  LoadEightDotPattern(a1, 4021, "6 5 1568");
  LoadEightDotPattern(a1, 4022, "6 23468");
  LoadEightDotPattern(a1, 4023, "2368");
  LoadEightDotPattern(a1, 4024, "6 18");
  LoadEightDotPattern(a1, 4025, "6 13 6 5 1568");
  LoadEightDotPattern(a1, 4026, "6 24568");
  LoadEightDotPattern(a1, 4027, "6 2458");
  LoadEightDotPattern(a1, 4028, "6 12358");
  LoadEightDotPattern(a1, 3849, "1234568");
  LoadEightDotPattern(a1, 3850, "123456 1368");
  LoadEightDotPattern(a1, 3851, "2  356 23 236 234 13 1345 356  356 25 28");
  LoadEightDotPattern(a1, 3898, "123568");
  LoadEightDotPattern(a1, 3899, "234568");
  LoadEightDotPattern(a1, 3900, "123568");
  LoadEightDotPattern(a1, 3901, "234568");
  LoadEightDotPattern(a1, 3902, "123568");
  LoadEightDotPattern(a1, 3903, "234568");
  LoadEightDotPattern(a1, 4048, "123456 158");
  LoadEightDotPattern(a1, 4049, "123456 4568");
  LoadEightDotPattern(a1, 4050, "123456 158");
  LoadEightDotPattern(a1, 4096, "138");
  LoadEightDotPattern(a1, 4097, "468");
  LoadEightDotPattern(a1, 4098, "12458");
  LoadEightDotPattern(a1, 4099, "123458");
  LoadEightDotPattern(a1, 4100, "348");
  LoadEightDotPattern(a1, 4101, "2348");
  LoadEightDotPattern(a1, 4102, "2358");
  LoadEightDotPattern(a1, 4103, "13568");
  LoadEightDotPattern(a1, 4104, "23468");
  LoadEightDotPattern(a1, 4105, "12368");
  LoadEightDotPattern(a1, 4106, "123568");
  LoadEightDotPattern(a1, 4107, "12568");
  LoadEightDotPattern(a1, 4108, "124568");
  LoadEightDotPattern(a1, 4109, "234568");
  LoadEightDotPattern(a1, 4110, "1234568");
  LoadEightDotPattern(a1, 4111, "12468");
  LoadEightDotPattern(a1, 4112, "23458");
  LoadEightDotPattern(a1, 4114, "1458");
  LoadEightDotPattern(a1, 4115, "1248");
  LoadEightDotPattern(a1, 4116, "13458");
  LoadEightDotPattern(a1, 4117, "12348");
  LoadEightDotPattern(a1, 4118, "458");
  LoadEightDotPattern(a1, 4119, "1468");
  LoadEightDotPattern(a1, 4120, "128");
  LoadEightDotPattern(a1, 4121, "1348");
  LoadEightDotPattern(a1, 4122, "134568");
  LoadEightDotPattern(a1, 4123, "12358");
  LoadEightDotPattern(a1, 4124, "1238");
  LoadEightDotPattern(a1, 4125, "24568");
  LoadEightDotPattern(a1, 4126, "14568");
  LoadEightDotPattern(a1, 4127, "1258");
  LoadEightDotPattern(a1, 4128, "4568");
  LoadEightDotPattern(a1, 4129, "3458");
  LoadEightDotPattern(a1, 4131, "56 248");
  LoadEightDotPattern(a1, 4132, "56 2468");
  LoadEightDotPattern(a1, 4133, "56 158");
  LoadEightDotPattern(a1, 4134, "56 1368");
  LoadEightDotPattern(a1, 4135, "56 1568");
  LoadEightDotPattern(a1, 4137, "56 1358");
  LoadEightDotPattern(a1, 4138, "268");
  LoadEightDotPattern(a1, 4139, "56 18");
  LoadEightDotPattern(a1, 4140, "18");
  LoadEightDotPattern(a1, 4141, "248");
  LoadEightDotPattern(a1, 4142, "2468");
  LoadEightDotPattern(a1, 4143, "158");
  LoadEightDotPattern(a1, 4144, "1368");
  LoadEightDotPattern(a1, 4145, "1568");
  LoadEightDotPattern(a1, 4146, "168");
  LoadEightDotPattern(a1, 4150, "148");
  LoadEightDotPattern(a1, 4151, "28");
  LoadEightDotPattern(a1, 4152, "238");
  LoadEightDotPattern(a1, 4153, "38");
  LoadEightDotPattern(a1, 4160, "2458");
  LoadEightDotPattern(a1, 4161, "18");
  LoadEightDotPattern(a1, 4162, "128");
  LoadEightDotPattern(a1, 4163, "148");
  LoadEightDotPattern(a1, 4164, "1458");
  LoadEightDotPattern(a1, 4165, "158");
  LoadEightDotPattern(a1, 4166, "1248");
  LoadEightDotPattern(a1, 4167, "12458");
  LoadEightDotPattern(a1, 4168, "1258");
  LoadEightDotPattern(a1, 4169, "248");
  LoadEightDotPattern(a1, 4170, "2568");
  LoadEightDotPattern(a1, 4171, "256 2568");
  LoadEightDotPattern(a1, 4172, "2368");
  LoadEightDotPattern(a1, 4173, "123468");
  LoadEightDotPattern(a1, 4174, "3468");
  LoadEightDotPattern(a1, 4175, "1358");
  LoadEightDotPattern(a1, 4176, "1468");
  LoadEightDotPattern(a1, 4177, "123468");
  LoadEightDotPattern(a1, 4178, "5 12358");
  LoadEightDotPattern(a1, 4179, "6 12358");
  LoadEightDotPattern(a1, 4180, "5 1238");
  LoadEightDotPattern(a1, 4181, "46 1238");
  LoadEightDotPattern(a1, 4182, "5 12358");
  LoadEightDotPattern(a1, 4183, "6 12358");
  LoadEightDotPattern(a1, 4184, "5 1238");
  LoadEightDotPattern(a1, 4185, "6 1238");
  LoadEightDotPattern(a1, 4304, "18");
  LoadEightDotPattern(a1, 4305, "128");
  LoadEightDotPattern(a1, 4306, "12458");
  LoadEightDotPattern(a1, 4307, "1458");
  LoadEightDotPattern(a1, 4308, "158");
  LoadEightDotPattern(a1, 4309, "24568");
  LoadEightDotPattern(a1, 4310, "13568");
  LoadEightDotPattern(a1, 4311, "1248");
  LoadEightDotPattern(a1, 4312, "248");
  LoadEightDotPattern(a1, 4313, "138");
  LoadEightDotPattern(a1, 4314, "1238");
  LoadEightDotPattern(a1, 4315, "1348");
  LoadEightDotPattern(a1, 4316, "13458");
  LoadEightDotPattern(a1, 4317, "1358");
  LoadEightDotPattern(a1, 4318, "12348");
  LoadEightDotPattern(a1, 4319, "2458");
  LoadEightDotPattern(a1, 4320, "12358");
  LoadEightDotPattern(a1, 4321, "2348");
  LoadEightDotPattern(a1, 4322, "23458");
  LoadEightDotPattern(a1, 4323, "1368");
  LoadEightDotPattern(a1, 4324, "12368");
  LoadEightDotPattern(a1, 4325, "124568");
  LoadEightDotPattern(a1, 4326, "12468");
  LoadEightDotPattern(a1, 4327, "23468");
  LoadEightDotPattern(a1, 4328, "1568");
  LoadEightDotPattern(a1, 4329, "123458");
  LoadEightDotPattern(a1, 4330, "148");
  LoadEightDotPattern(a1, 4331, "134568");
  LoadEightDotPattern(a1, 4332, "14568");
  LoadEightDotPattern(a1, 4333, "13468");
  LoadEightDotPattern(a1, 4334, "1258");
  LoadEightDotPattern(a1, 4335, "2468");
  LoadEightDotPattern(a1, 4336, "123468");
  LoadEightDotPattern(a1, 4345, "12458");
  LoadEightDotPattern(a1, 4347, "34 34 8");
  LoadEightDotPattern(a1, 4348, "13458");
  LoadEightDotPattern(a1, 4352, "48");
  LoadEightDotPattern(a1, 4353, "6 48");
  LoadEightDotPattern(a1, 4354, "148");
  LoadEightDotPattern(a1, 4355, "248");
  LoadEightDotPattern(a1, 4356, "6 248");
  LoadEightDotPattern(a1, 4357, "58");
  LoadEightDotPattern(a1, 4358, "158");
  LoadEightDotPattern(a1, 4359, "458");
  LoadEightDotPattern(a1, 4360, "6 458");
  LoadEightDotPattern(a1, 4361, "68");
  LoadEightDotPattern(a1, 4362, "6 1238");
  LoadEightDotPattern(a1, 4364, "468");
  LoadEightDotPattern(a1, 4365, "6 468");
  LoadEightDotPattern(a1, 4366, "568");
  LoadEightDotPattern(a1, 4367, "1248");
  LoadEightDotPattern(a1, 4368, "1258");
  LoadEightDotPattern(a1, 4369, "1458");
  LoadEightDotPattern(a1, 4370, "2458");
  LoadEightDotPattern(a1, 4371, "14 48");
  LoadEightDotPattern(a1, 4372, "14 148");
  LoadEightDotPattern(a1, 4373, "14 248");
  LoadEightDotPattern(a1, 4374, "14 458");
  LoadEightDotPattern(a1, 4375, "24 48");
  LoadEightDotPattern(a1, 4376, "5 148");
  LoadEightDotPattern(a1, 4377, "5 58");
  LoadEightDotPattern(a1, 4378, "5 2458");
  LoadEightDotPattern(a1, 4379, "58");
  LoadEightDotPattern(a1, 4380, "15 458");
  LoadEightDotPattern(a1, 4381, "158");
  LoadEightDotPattern(a1, 4382, "45 48");
  LoadEightDotPattern(a1, 4383, "45 148");
  LoadEightDotPattern(a1, 4384, "45 248");
  LoadEightDotPattern(a1, 4385, "45 68");
  LoadEightDotPattern(a1, 4386, "48");
  LoadEightDotPattern(a1, 4387, "248");
  LoadEightDotPattern(a1, 4388, "458");
  LoadEightDotPattern(a1, 4389, "45 6 68");
  LoadEightDotPattern(a1, 4390, "45 468");
  LoadEightDotPattern(a1, 4391, "45 468");
  LoadEightDotPattern(a1, 4392, "45 568");
  LoadEightDotPattern(a1, 4393, "45 1258");
  LoadEightDotPattern(a1, 4394, "45 1458");
  LoadEightDotPattern(a1, 4395, "458");
  LoadEightDotPattern(a1, 4396, "6 458");
  LoadEightDotPattern(a1, 4397, "6 48");
  LoadEightDotPattern(a1, 4398, "6 148");
  LoadEightDotPattern(a1, 4399, "6 248");
  LoadEightDotPattern(a1, 4400, "6 58");
  LoadEightDotPattern(a1, 4401, "6 158");
  LoadEightDotPattern(a1, 4402, "6 458");
  LoadEightDotPattern(a1, 4403, "SPACE 125 1458");
  LoadEightDotPattern(a1, 4404, "6 6 68");
  LoadEightDotPattern(a1, 4405, "68");
  LoadEightDotPattern(a1, 4406, "6 468");
  LoadEightDotPattern(a1, 4407, "6 568");
  LoadEightDotPattern(a1, 4408, "6 1248");
  LoadEightDotPattern(a1, 4409, "6 1258");
  LoadEightDotPattern(a1, 4410, "6 1458");
  LoadEightDotPattern(a1, 4411, "6 2458");
  LoadEightDotPattern(a1, 4417, "48");
  LoadEightDotPattern(a1, 4418, "248");
  LoadEightDotPattern(a1, 4419, "158");
  LoadEightDotPattern(a1, 4420, "458");
  LoadEightDotPattern(a1, 4421, "68");
  LoadEightDotPattern(a1, 4424, "SPACE 468");
  LoadEightDotPattern(a1, 4425, "SPACE 568");
  LoadEightDotPattern(a1, 4426, "SPACE 1258");
  LoadEightDotPattern(a1, 4427, "SPACE 1458");
  LoadEightDotPattern(a1, 4429, "468");
  LoadEightDotPattern(a1, 4434, "56 1248");
  LoadEightDotPattern(a1, 4435, "56 2458");
  LoadEightDotPattern(a1, 4438, "145 458");
  LoadEightDotPattern(a1, 4439, "1458");
  LoadEightDotPattern(a1, 4440, "145 2458");
  LoadEightDotPattern(a1, 4449, "1268");
  LoadEightDotPattern(a1, 4450, "12358");
  LoadEightDotPattern(a1, 4451, "3458");
  LoadEightDotPattern(a1, 4452, "345 12358");
  LoadEightDotPattern(a1, 4453, "2348");
  LoadEightDotPattern(a1, 4454, "13458");
  LoadEightDotPattern(a1, 4455, "1568");
  LoadEightDotPattern(a1, 4456, "348");
  LoadEightDotPattern(a1, 4457, "1368");
  LoadEightDotPattern(a1, 4458, "12368");
  LoadEightDotPattern(a1, 4459, "1236 12358");
  LoadEightDotPattern(a1, 4460, "134568");
  LoadEightDotPattern(a1, 4461, "3468");
  LoadEightDotPattern(a1, 4462, "1348");
  LoadEightDotPattern(a1, 4463, "12348");
  LoadEightDotPattern(a1, 4464, "1234 12358");
  LoadEightDotPattern(a1, 4465, "134 12358");
  LoadEightDotPattern(a1, 4466, "1468");
  LoadEightDotPattern(a1, 4467, "2468");
  LoadEightDotPattern(a1, 4468, "24568");
  LoadEightDotPattern(a1, 4469, "1358");
  LoadEightDotPattern(a1, 4470, "126 1368");
  LoadEightDotPattern(a1, 4471, "126 1348");
  LoadEightDotPattern(a1, 4472, "345 1368");
  LoadEightDotPattern(a1, 4473, "345 3468");
  LoadEightDotPattern(a1, 4474, "234 1368");
  LoadEightDotPattern(a1, 4475, "234 1348");
  LoadEightDotPattern(a1, 4476, "234 2468");
  LoadEightDotPattern(a1, 4477, "156 1368");
  LoadEightDotPattern(a1, 4478, "156 1348");
  LoadEightDotPattern(a1, 4479, "136 2348");
  LoadEightDotPattern(a1, 4480, "1358");
  LoadEightDotPattern(a1, 4481, "136 348");
  LoadEightDotPattern(a1, 4482, "136 1368");
  LoadEightDotPattern(a1, 4483, "136 1348");
  LoadEightDotPattern(a1, 4484, "346 3458");
  LoadEightDotPattern(a1, 4485, "1358");
  LoadEightDotPattern(a1, 4486, "346 1568");
  LoadEightDotPattern(a1, 4487, "346 1368");
  LoadEightDotPattern(a1, 4488, "346 1358");
  LoadEightDotPattern(a1, 4489, "134 1268");
  LoadEightDotPattern(a1, 4490, "1358");
  LoadEightDotPattern(a1, 4491, "1234 2468");
  LoadEightDotPattern(a1, 4492, "134 348");
  LoadEightDotPattern(a1, 4493, "134 1348");
  LoadEightDotPattern(a1, 4494, "146 1268");
  LoadEightDotPattern(a1, 4495, "146 2348");
  LoadEightDotPattern(a1, 4496, "1358");
  LoadEightDotPattern(a1, 4497, "146 1568");
  LoadEightDotPattern(a1, 4498, "146 348");
  LoadEightDotPattern(a1, 4499, "146 1348");
  LoadEightDotPattern(a1, 4500, "146 1358");
  LoadEightDotPattern(a1, 4501, "246 1348");
  LoadEightDotPattern(a1, 4502, "246 2468");
  LoadEightDotPattern(a1, 4503, "2456 1348");
  LoadEightDotPattern(a1, 4504, "135 1268");
  LoadEightDotPattern(a1, 4505, "135 3458");
  LoadEightDotPattern(a1, 4506, "135 1368");
  LoadEightDotPattern(a1, 4507, "135 1348");
  LoadEightDotPattern(a1, 4508, "135 2468");
  LoadEightDotPattern(a1, 4509, "1358");
  LoadEightDotPattern(a1, 4511, "2348");
  LoadEightDotPattern(a1, 4512, "1348");
  LoadEightDotPattern(a1, 4513, "1358");
  LoadEightDotPattern(a1, 4520, "18");
  LoadEightDotPattern(a1, 4521, "1 18");
  LoadEightDotPattern(a1, 4522, "1 38");
  LoadEightDotPattern(a1, 4523, "258");
  LoadEightDotPattern(a1, 4524, "25 138");
  LoadEightDotPattern(a1, 4525, "25 3568");
  LoadEightDotPattern(a1, 4526, "358");
  LoadEightDotPattern(a1, 4527, "28");
  LoadEightDotPattern(a1, 4528, "2 18");
  LoadEightDotPattern(a1, 4529, "2 268");
  LoadEightDotPattern(a1, 4530, "2 458");
  LoadEightDotPattern(a1, 4531, "2 38");
  LoadEightDotPattern(a1, 4532, "2 2368");
  LoadEightDotPattern(a1, 4533, "2 2568");
  LoadEightDotPattern(a1, 4534, "2 3568");
  LoadEightDotPattern(a1, 4535, "268");
  LoadEightDotPattern(a1, 4536, "128");
  LoadEightDotPattern(a1, 4537, "12 38");
  LoadEightDotPattern(a1, 4538, "38");
  LoadEightDotPattern(a1, 4539, "348");
  LoadEightDotPattern(a1, 4540, "23568");
  LoadEightDotPattern(a1, 4541, "138");
  LoadEightDotPattern(a1, 4542, "238");
  LoadEightDotPattern(a1, 4543, "2358");
  LoadEightDotPattern(a1, 4544, "2368");
  LoadEightDotPattern(a1, 4545, "2568");
  LoadEightDotPattern(a1, 4546, "3568");
  LoadEightDotPattern(a1, 4547, "1 28");
  LoadEightDotPattern(a1, 4548, "1 3 18");
  LoadEightDotPattern(a1, 4549, "25 18");
  LoadEightDotPattern(a1, 4550, "25 358");
  LoadEightDotPattern(a1, 4551, "25 38");
  LoadEightDotPattern(a1, 4552, "258");
  LoadEightDotPattern(a1, 4553, "25 2368");
  LoadEightDotPattern(a1, 4554, "35 18");
  LoadEightDotPattern(a1, 4555, "35 28");
  LoadEightDotPattern(a1, 4556, "2 1 38");
  LoadEightDotPattern(a1, 4557, "2 258");
  LoadEightDotPattern(a1, 4558, "2 358");
  LoadEightDotPattern(a1, 4559, "3568");
  LoadEightDotPattern(a1, 4560, "2 28");
  LoadEightDotPattern(a1, 4561, "2 26 18");
  LoadEightDotPattern(a1, 4562, "2 26 38");
  LoadEightDotPattern(a1, 4563, "2 45 38");
  LoadEightDotPattern(a1, 4564, "2 45 3568");
  LoadEightDotPattern(a1, 4565, "2 45 23568");
  LoadEightDotPattern(a1, 4566, "2 3 38");
  LoadEightDotPattern(a1, 4567, "28");
  LoadEightDotPattern(a1, 4568, "2 2358");
  LoadEightDotPattern(a1, 4569, "28");
  LoadEightDotPattern(a1, 4570, "26 18");
  LoadEightDotPattern(a1, 4571, "26 28");
  LoadEightDotPattern(a1, 4572, "26 128");
  LoadEightDotPattern(a1, 4573, "26 38");
  LoadEightDotPattern(a1, 4574, "38");
  LoadEightDotPattern(a1, 4575, "268");
  LoadEightDotPattern(a1, 4576, "26 238");
  LoadEightDotPattern(a1, 4577, "26 3568");
  LoadEightDotPattern(a1, 4578, "26 23568");
  LoadEightDotPattern(a1, 4579, "12 28");
  LoadEightDotPattern(a1, 4580, "12 2568");
  LoadEightDotPattern(a1, 4581, "12 3568");
  LoadEightDotPattern(a1, 4582, "12 23568");
  LoadEightDotPattern(a1, 4583, "3 18");
  LoadEightDotPattern(a1, 4584, "3 358");
  LoadEightDotPattern(a1, 4585, "3 28");
  LoadEightDotPattern(a1, 4586, "3 128");
  LoadEightDotPattern(a1, 4588, "18");
  LoadEightDotPattern(a1, 4589, "18");
  LoadEightDotPattern(a1, 4591, "2358");
  LoadEightDotPattern(a1, 4593, "38");
  LoadEightDotPattern(a1, 4595, "256 128");
  LoadEightDotPattern(a1, 4596, "256 23568");
  LoadEightDotPattern(a1, 4597, "356 258");
  LoadEightDotPattern(a1, 4598, "356 28");
  LoadEightDotPattern(a1, 4599, "356 268");
  LoadEightDotPattern(a1, 4600, "356 128");
  LoadEightDotPattern(a1, 4608, "125 268");
  LoadEightDotPattern(a1, 4609, "125 1368");
  LoadEightDotPattern(a1, 4610, "125 248");
  LoadEightDotPattern(a1, 4611, "125 18");
  LoadEightDotPattern(a1, 4612, "125 158");
  LoadEightDotPattern(a1, 4613, "1258");
  LoadEightDotPattern(a1, 4614, "125 1358");
  LoadEightDotPattern(a1, 4615, "125 135 18");
  LoadEightDotPattern(a1, 4616, "123 268");
  LoadEightDotPattern(a1, 4617, "123 1368");
  LoadEightDotPattern(a1, 4618, "123 248");
  LoadEightDotPattern(a1, 4619, "123 18");
  LoadEightDotPattern(a1, 4620, "123 158");
  LoadEightDotPattern(a1, 4621, "1238");
  LoadEightDotPattern(a1, 4622, "123 1358");
  LoadEightDotPattern(a1, 4623, "123 13468");
  LoadEightDotPattern(a1, 4624, "126 268");
  LoadEightDotPattern(a1, 4625, "126 1368");
  LoadEightDotPattern(a1, 4626, "126 248");
  LoadEightDotPattern(a1, 4627, "126 18");
  LoadEightDotPattern(a1, 4628, "126 158");
  LoadEightDotPattern(a1, 4629, "1268");
  LoadEightDotPattern(a1, 4630, "126 1358");
  LoadEightDotPattern(a1, 4631, "126 13468");
  LoadEightDotPattern(a1, 4632, "134 268");
  LoadEightDotPattern(a1, 4633, "134 1368");
  LoadEightDotPattern(a1, 4634, "134 248");
  LoadEightDotPattern(a1, 4635, "134 18");
  LoadEightDotPattern(a1, 4636, "134 158");
  LoadEightDotPattern(a1, 4637, "1348");
  LoadEightDotPattern(a1, 4638, "134 1358");
  LoadEightDotPattern(a1, 4639, "134 13468");
  LoadEightDotPattern(a1, 4640, "1456 268");
  LoadEightDotPattern(a1, 4641, "1456 1368");
  LoadEightDotPattern(a1, 4642, "1456 248");
  LoadEightDotPattern(a1, 4643, "1456 18");
  LoadEightDotPattern(a1, 4644, "1456 158");
  LoadEightDotPattern(a1, 4645, "14568");
  LoadEightDotPattern(a1, 4646, "1456 1358");
  LoadEightDotPattern(a1, 4647, "234 13468");
  LoadEightDotPattern(a1, 4648, "1235 268");
  LoadEightDotPattern(a1, 4649, "1235 1368");
  LoadEightDotPattern(a1, 4650, "1235 248");
  LoadEightDotPattern(a1, 4651, "1235 18");
  LoadEightDotPattern(a1, 4652, "1235 158");
  LoadEightDotPattern(a1, 4653, "12358");
  LoadEightDotPattern(a1, 4654, "1235 1358");
  LoadEightDotPattern(a1, 4655, "1235 13468");
  LoadEightDotPattern(a1, 4656, "234 268");
  LoadEightDotPattern(a1, 4657, "234 1368");
  LoadEightDotPattern(a1, 4658, "234 248");
  LoadEightDotPattern(a1, 4659, "234 18");
  LoadEightDotPattern(a1, 4660, "234 158");
  LoadEightDotPattern(a1, 4661, "2348");
  LoadEightDotPattern(a1, 4662, "234 1358");
  LoadEightDotPattern(a1, 4663, "234 13468");
  LoadEightDotPattern(a1, 4664, "146 268");
  LoadEightDotPattern(a1, 4665, "146 1368");
  LoadEightDotPattern(a1, 4666, "146 248");
  LoadEightDotPattern(a1, 4667, "146 18");
  LoadEightDotPattern(a1, 4668, "146 158");
  LoadEightDotPattern(a1, 4669, "1468");
  LoadEightDotPattern(a1, 4670, "146 1358");
  LoadEightDotPattern(a1, 4671, "146 13468");
  LoadEightDotPattern(a1, 4672, "12345 268");
  LoadEightDotPattern(a1, 4673, "12345 1368");
  LoadEightDotPattern(a1, 4674, "12345 248");
  LoadEightDotPattern(a1, 4675, "12345 18");
  LoadEightDotPattern(a1, 4676, "12345 158");
  LoadEightDotPattern(a1, 4677, "123458");
  LoadEightDotPattern(a1, 4678, "12345 1358");
  LoadEightDotPattern(a1, 4679, "12345 135 18");
  LoadEightDotPattern(a1, 4680, "12345 2456 268");
  LoadEightDotPattern(a1, 4682, "12345 2456 248");
  LoadEightDotPattern(a1, 4683, "12345 13468");
  LoadEightDotPattern(a1, 4684, "12345 2456 158");
  LoadEightDotPattern(a1, 4685, "12345 2456 1368");
  LoadEightDotPattern(a1, 4688, "12345 125 268");
  LoadEightDotPattern(a1, 4689, "12345 125 1368");
  LoadEightDotPattern(a1, 4690, "12345 125 248");
  LoadEightDotPattern(a1, 4691, "12345 125 18");
  LoadEightDotPattern(a1, 4692, "12345 125 158");
  LoadEightDotPattern(a1, 4693, "12345 1258");
  LoadEightDotPattern(a1, 4694, "12345 125 1358");
  LoadEightDotPattern(a1, 4696, "12345 125 13468");
  LoadEightDotPattern(a1, 4698, "12345 125 2456 248");
  LoadEightDotPattern(a1, 4699, "12345 125 2456 1 18");
  LoadEightDotPattern(a1, 4700, "12345 125 2456 1368");
  LoadEightDotPattern(a1, 4701, "12345 1258");
  LoadEightDotPattern(a1, 4704, "12 268");
  LoadEightDotPattern(a1, 4705, "12 1368");
  LoadEightDotPattern(a1, 4706, "12 248");
  LoadEightDotPattern(a1, 4707, "12 18");
  LoadEightDotPattern(a1, 4708, "12 158");
  LoadEightDotPattern(a1, 4709, "128");
  LoadEightDotPattern(a1, 4710, "12 1358");
  LoadEightDotPattern(a1, 4711, "12 13468");
  LoadEightDotPattern(a1, 4712, "1236 268");
  LoadEightDotPattern(a1, 4713, "1236 1368");
  LoadEightDotPattern(a1, 4714, "1236 248");
  LoadEightDotPattern(a1, 4715, "1236 18");
  LoadEightDotPattern(a1, 4716, "1236 158");
  LoadEightDotPattern(a1, 4717, "12368");
  LoadEightDotPattern(a1, 4718, "1236 1358");
  LoadEightDotPattern(a1, 4719, "1236 13468");
  LoadEightDotPattern(a1, 4720, "2345 268");
  LoadEightDotPattern(a1, 4721, "2345 1368");
  LoadEightDotPattern(a1, 4722, "2345 248");
  LoadEightDotPattern(a1, 4723, "2345 18");
  LoadEightDotPattern(a1, 4724, "2345 158");
  LoadEightDotPattern(a1, 4725, "23458");
  LoadEightDotPattern(a1, 4726, "2345 1358");
  LoadEightDotPattern(a1, 4727, "2345 13468");
  LoadEightDotPattern(a1, 4728, "16 268");
  LoadEightDotPattern(a1, 4729, "16 1368");
  LoadEightDotPattern(a1, 4730, "16 248");
  LoadEightDotPattern(a1, 4731, "16 18");
  LoadEightDotPattern(a1, 4732, "16 158");
  LoadEightDotPattern(a1, 4733, "168");
  LoadEightDotPattern(a1, 4734, "16 1358");
  LoadEightDotPattern(a1, 4735, "16 13468");
  LoadEightDotPattern(a1, 4736, "156 268");
  LoadEightDotPattern(a1, 4737, "156 1368");
  LoadEightDotPattern(a1, 4738, "156 248");
  LoadEightDotPattern(a1, 4739, "156 18");
  LoadEightDotPattern(a1, 4740, "156 158");
  LoadEightDotPattern(a1, 4741, "1568");
  LoadEightDotPattern(a1, 4742, "156 1358");
  LoadEightDotPattern(a1, 4743, "156 135 18");
  LoadEightDotPattern(a1, 4744, "156 2456 268");
  LoadEightDotPattern(a1, 4746, "156 2456 248");
  LoadEightDotPattern(a1, 4747, "156 13468");
  LoadEightDotPattern(a1, 4748, "156 2456 158");
  LoadEightDotPattern(a1, 4749, "156 2456 1368");
  LoadEightDotPattern(a1, 4752, "1345 268");
  LoadEightDotPattern(a1, 4753, "1345 1368");
  LoadEightDotPattern(a1, 4754, "1345 248");
  LoadEightDotPattern(a1, 4755, "1345 18");
  LoadEightDotPattern(a1, 4756, "1345 158");
  LoadEightDotPattern(a1, 4757, "13458");
  LoadEightDotPattern(a1, 4758, "1345 1358");
  LoadEightDotPattern(a1, 4759, "1345 13468");
  LoadEightDotPattern(a1, 4760, "346 268");
  LoadEightDotPattern(a1, 4761, "346 1368");
  LoadEightDotPattern(a1, 4762, "346 248");
  LoadEightDotPattern(a1, 4763, "346 18");
  LoadEightDotPattern(a1, 4764, "346 158");
  LoadEightDotPattern(a1, 4765, "3468");
  LoadEightDotPattern(a1, 4766, "346 1358");
  LoadEightDotPattern(a1, 4767, "346 13468");
  LoadEightDotPattern(a1, 4768, "12356 268");
  LoadEightDotPattern(a1, 4769, "12356 1368");
  LoadEightDotPattern(a1, 4770, "12356 248");
  LoadEightDotPattern(a1, 4771, "12356 18");
  LoadEightDotPattern(a1, 4772, "12356 158");
  LoadEightDotPattern(a1, 4773, "123568");
  LoadEightDotPattern(a1, 4774, "12356 1358");
  LoadEightDotPattern(a1, 4775, "2 12356 268");
  LoadEightDotPattern(a1, 4776, "13 268");
  LoadEightDotPattern(a1, 4777, "13 1368");
  LoadEightDotPattern(a1, 4778, "13 248");
  LoadEightDotPattern(a1, 4779, "13 18");
  LoadEightDotPattern(a1, 4780, "13 158");
  LoadEightDotPattern(a1, 4781, "138");
  LoadEightDotPattern(a1, 4782, "13 1358");
  LoadEightDotPattern(a1, 4783, "13 135 18");
  LoadEightDotPattern(a1, 4784, "13 2456 268");
  LoadEightDotPattern(a1, 4786, "13 2456 248");
  LoadEightDotPattern(a1, 4787, "13 13468");
  LoadEightDotPattern(a1, 4788, "13 2456 158");
  LoadEightDotPattern(a1, 4789, "13 2456 1368");
  LoadEightDotPattern(a1, 4792, "236 268");
  LoadEightDotPattern(a1, 4793, "236 1368");
  LoadEightDotPattern(a1, 4794, "236 248");
  LoadEightDotPattern(a1, 4795, "236 18");
  LoadEightDotPattern(a1, 4796, "236 158");
  LoadEightDotPattern(a1, 4797, "2368");
  LoadEightDotPattern(a1, 4798, "236 1358");
  LoadEightDotPattern(a1, 4800, "236 13468");
  LoadEightDotPattern(a1, 4802, "236 2456 248");
  LoadEightDotPattern(a1, 4803, "236 2456 1 18");
  LoadEightDotPattern(a1, 4804, "236 2456 158");
  LoadEightDotPattern(a1, 4805, "236 24568");
  LoadEightDotPattern(a1, 4808, "2456 268");
  LoadEightDotPattern(a1, 4809, "2456 1368");
  LoadEightDotPattern(a1, 4810, "2456 248");
  LoadEightDotPattern(a1, 4811, "2456 18");
  LoadEightDotPattern(a1, 4812, "2456 158");
  LoadEightDotPattern(a1, 4813, "24568");
  LoadEightDotPattern(a1, 4814, "2456 1358");
  LoadEightDotPattern(a1, 4815, "2456 135 18");
  LoadEightDotPattern(a1, 4816, "1256 268");
  LoadEightDotPattern(a1, 4817, "1256 1368");
  LoadEightDotPattern(a1, 4818, "1256 248");
  LoadEightDotPattern(a1, 4819, "1256 18");
  LoadEightDotPattern(a1, 4820, "1256 158");
  LoadEightDotPattern(a1, 4821, "12568");
  LoadEightDotPattern(a1, 4822, "1256 1358");
  LoadEightDotPattern(a1, 4824, "1356 268");
  LoadEightDotPattern(a1, 4825, "1356 1368");
  LoadEightDotPattern(a1, 4826, "1356 248");
  LoadEightDotPattern(a1, 4827, "1356 18");
  LoadEightDotPattern(a1, 4828, "1356 158");
  LoadEightDotPattern(a1, 4829, "13568");
  LoadEightDotPattern(a1, 4830, "1356 1358");
  LoadEightDotPattern(a1, 4831, "1356 13468");
  LoadEightDotPattern(a1, 4832, "356 268");
  LoadEightDotPattern(a1, 4833, "356 1368");
  LoadEightDotPattern(a1, 4834, "356 248");
  LoadEightDotPattern(a1, 4835, "356 18");
  LoadEightDotPattern(a1, 4836, "356 158");
  LoadEightDotPattern(a1, 4837, "3568");
  LoadEightDotPattern(a1, 4838, "356 1358");
  LoadEightDotPattern(a1, 4839, "356 13468");
  LoadEightDotPattern(a1, 4840, "13456 268");
  LoadEightDotPattern(a1, 4841, "13456 1368");
  LoadEightDotPattern(a1, 4842, "13456 248");
  LoadEightDotPattern(a1, 4843, "13456 18");
  LoadEightDotPattern(a1, 4844, "13456 158");
  LoadEightDotPattern(a1, 4845, "134568");
  LoadEightDotPattern(a1, 4846, "13456 1358");
  LoadEightDotPattern(a1, 4847, "13456 135 18");
  LoadEightDotPattern(a1, 4848, "145 268");
  LoadEightDotPattern(a1, 4849, "145 1368");
  LoadEightDotPattern(a1, 4850, "145 248");
  LoadEightDotPattern(a1, 4851, "145 18");
  LoadEightDotPattern(a1, 4852, "145 158");
  LoadEightDotPattern(a1, 4853, "1458");
  LoadEightDotPattern(a1, 4854, "1458");
  LoadEightDotPattern(a1, 4855, "145 13468");
  LoadEightDotPattern(a1, 4856, "145 145 268");
  LoadEightDotPattern(a1, 4857, "145 145 1368");
  LoadEightDotPattern(a1, 4858, "145 145 248");
  LoadEightDotPattern(a1, 4859, "145 145 18");
  LoadEightDotPattern(a1, 4860, "145 145 158");
  LoadEightDotPattern(a1, 4861, "145 1458");
  LoadEightDotPattern(a1, 4862, "145 145 1358");
  LoadEightDotPattern(a1, 4863, "145 145 13468");
  LoadEightDotPattern(a1, 4864, "245 268");
  LoadEightDotPattern(a1, 4865, "245 1368");
  LoadEightDotPattern(a1, 4866, "245 248");
  LoadEightDotPattern(a1, 4867, "245 18");
  LoadEightDotPattern(a1, 4868, "245 158");
  LoadEightDotPattern(a1, 4869, "2458");
  LoadEightDotPattern(a1, 4870, "245 1358");
  LoadEightDotPattern(a1, 4871, "245 13468");
  LoadEightDotPattern(a1, 4872, "1245 268");
  LoadEightDotPattern(a1, 4873, "1245 1368");
  LoadEightDotPattern(a1, 4874, "1245 248");
  LoadEightDotPattern(a1, 4875, "1245 18");
  LoadEightDotPattern(a1, 4876, "1245 158");
  LoadEightDotPattern(a1, 4877, "12458");
  LoadEightDotPattern(a1, 4878, "1245 1358");
  LoadEightDotPattern(a1, 4879, "1245 135 18");
  LoadEightDotPattern(a1, 4880, "1245 2456 268");
  LoadEightDotPattern(a1, 4882, "1245 2456 248");
  LoadEightDotPattern(a1, 4883, "1245 13468");
  LoadEightDotPattern(a1, 4884, "1245 2456 158");
  LoadEightDotPattern(a1, 4885, "1245 2456 1368");
  LoadEightDotPattern(a1, 4888, "1245 1245 268");
  LoadEightDotPattern(a1, 4889, "1245 1245 1368");
  LoadEightDotPattern(a1, 4890, "1245 1245 248");
  LoadEightDotPattern(a1, 4891, "1245 1245 18");
  LoadEightDotPattern(a1, 4892, "1245 1245 158");
  LoadEightDotPattern(a1, 4893, "1245 12458");
  LoadEightDotPattern(a1, 4894, "1245 1245 1358");
  LoadEightDotPattern(a1, 4895, "1245 1245 2456 1 18");
  LoadEightDotPattern(a1, 4896, "23456 268");
  LoadEightDotPattern(a1, 4897, "23456 1368");
  LoadEightDotPattern(a1, 4898, "23456 248");
  LoadEightDotPattern(a1, 4899, "23456 18");
  LoadEightDotPattern(a1, 4900, "23456 158");
  LoadEightDotPattern(a1, 4901, "234568");
  LoadEightDotPattern(a1, 4902, "23456 1358");
  LoadEightDotPattern(a1, 4903, "23456 13468");
  LoadEightDotPattern(a1, 4904, "14 268");
  LoadEightDotPattern(a1, 4905, "14 1368");
  LoadEightDotPattern(a1, 4906, "14 248");
  LoadEightDotPattern(a1, 4907, "14 18");
  LoadEightDotPattern(a1, 4908, "14 158");
  LoadEightDotPattern(a1, 4909, "148");
  LoadEightDotPattern(a1, 4910, "14 1358");
  LoadEightDotPattern(a1, 4911, "14 13468");
  LoadEightDotPattern(a1, 4912, "235 268");
  LoadEightDotPattern(a1, 4913, "235 1368");
  LoadEightDotPattern(a1, 4914, "235 248");
  LoadEightDotPattern(a1, 4915, "235 18");
  LoadEightDotPattern(a1, 4916, "235 158");
  LoadEightDotPattern(a1, 4917, "2358");
  LoadEightDotPattern(a1, 4918, "235 1358");
  LoadEightDotPattern(a1, 4919, "235 13468");
  LoadEightDotPattern(a1, 4920, "2346 268");
  LoadEightDotPattern(a1, 4921, "2346 1368");
  LoadEightDotPattern(a1, 4922, "2346 248");
  LoadEightDotPattern(a1, 4923, "2346 18");
  LoadEightDotPattern(a1, 4924, "2346 158");
  LoadEightDotPattern(a1, 4925, "23468");
  LoadEightDotPattern(a1, 4926, "2346 1358");
  LoadEightDotPattern(a1, 4927, "2346 13468");
  LoadEightDotPattern(a1, 4928, "12346 268");
  LoadEightDotPattern(a1, 4929, "12346 1368");
  LoadEightDotPattern(a1, 4930, "12346 248");
  LoadEightDotPattern(a1, 4931, "12346 18");
  LoadEightDotPattern(a1, 4932, "12346 158");
  LoadEightDotPattern(a1, 4933, "123468");
  LoadEightDotPattern(a1, 4934, "12346 1358");
  LoadEightDotPattern(a1, 4935, "12346 135 18");
  LoadEightDotPattern(a1, 4936, "124 268");
  LoadEightDotPattern(a1, 4937, "124 1368");
  LoadEightDotPattern(a1, 4938, "124 248");
  LoadEightDotPattern(a1, 4939, "124 18");
  LoadEightDotPattern(a1, 4940, "124 158");
  LoadEightDotPattern(a1, 4941, "1248");
  LoadEightDotPattern(a1, 4942, "124 1358");
  LoadEightDotPattern(a1, 4943, "124 13468");
  LoadEightDotPattern(a1, 4944, "1234 268");
  LoadEightDotPattern(a1, 4945, "1234 1368");
  LoadEightDotPattern(a1, 4946, "1234 248");
  LoadEightDotPattern(a1, 4947, "1234 18");
  LoadEightDotPattern(a1, 4948, "1234 158");
  LoadEightDotPattern(a1, 4949, "12348");
  LoadEightDotPattern(a1, 4950, "1234 1358");
  LoadEightDotPattern(a1, 4951, "1234 13456 268");
  LoadEightDotPattern(a1, 4952, "1235 13456 268");
  LoadEightDotPattern(a1, 4953, "134 13456 268");
  LoadEightDotPattern(a1, 4954, "124 13456 268");
  LoadEightDotPattern(a1, 4959, "16 16 16 136 2 25 26 124 168");
  LoadEightDotPattern(a1, 4960, "16 16 16 136 2 25 235 356 168");
  LoadEightDotPattern(a1, 4962, "2568");
  LoadEightDotPattern(a1, 4963, "28");
  LoadEightDotPattern(a1, 4964, "238");
  LoadEightDotPattern(a1, 4965, "258");
  LoadEightDotPattern(a1, 4966, "16 16 16 136 2 25 235 235 168");
  LoadEightDotPattern(a1, 4967, "2368");
  LoadEightDotPattern(a1, 4968, "16 16 16 136 2 25 235 236 168");
  LoadEightDotPattern(a1, 4969, "123456 18");
  LoadEightDotPattern(a1, 4970, "123456 128");
  LoadEightDotPattern(a1, 4971, "123456 148");
  LoadEightDotPattern(a1, 4972, "123456 1458");
  LoadEightDotPattern(a1, 4973, "123456 158");
  LoadEightDotPattern(a1, 4974, "123456 1248");
  LoadEightDotPattern(a1, 4975, "123456 12458");
  LoadEightDotPattern(a1, 4976, "123456 1258");
  LoadEightDotPattern(a1, 4977, "123456 248");
  LoadEightDotPattern(a1, 4978, "123456 1 2458");
  LoadEightDotPattern(a1, 4979, "123456 12 2458");
  LoadEightDotPattern(a1, 4980, "123456 14 2458");
  LoadEightDotPattern(a1, 4981, "123456 145 2458");
  LoadEightDotPattern(a1, 4982, "123456 15 2458");
  LoadEightDotPattern(a1, 4983, "123456 124 2458");
  LoadEightDotPattern(a1, 4984, "123456 1245 2458");
  LoadEightDotPattern(a1, 4985, "123456 125 2458");
  LoadEightDotPattern(a1, 4986, "123456 24 2458");
  LoadEightDotPattern(a1, 4987, "123456 1 245 2458");
  LoadEightDotPattern(a1, 4988, "123456 1 245 245 245 2458");
  LoadEightDotPattern(a1, 4992, "16 16 16 136 2 25 236 356 168");
  LoadEightDotPattern(a1, 4993, "16 16 16 136 2 25 236 2 168");
  LoadEightDotPattern(a1, 4994, "16 16 16 136 2 25 236 23 168");
  LoadEightDotPattern(a1, 4995, "16 16 16 136 2 25 236 25 168");
  LoadEightDotPattern(a1, 4996, "16 16 16 136 2 25 236 256 168");
  LoadEightDotPattern(a1, 4997, "16 16 16 136 2 25 236 26 168");
  LoadEightDotPattern(a1, 4998, "16 16 16 136 2 25 236 235 168");
  LoadEightDotPattern(a1, 4999, "16 16 16 136 2 25 236 2356 168");
  LoadEightDotPattern(a1, 5000, "16 16 16 136 2 25 236 236 168");
  LoadEightDotPattern(a1, 5001, "16 16 16 136 2 25 236 35 168");
  LoadEightDotPattern(a1, 5002, "16 16 16 136 2 25 236 1 168");
  LoadEightDotPattern(a1, 5003, "16 16 16 136 2 25 236 12 168");
  LoadEightDotPattern(a1, 5004, "16 16 16 136 2 25 236 14 168");
  LoadEightDotPattern(a1, 5005, "16 16 16 136 2 25 236 145 168");
  LoadEightDotPattern(a1, 5006, "16 16 16 136 2 25 236 15 168");
  LoadEightDotPattern(a1, 5007, "16 16 16 136 2 25 236 124 168");
  LoadEightDotPattern(a1, 5008, "16 16 16 136 2 25 35 356 168");
  LoadEightDotPattern(a1, 5009, "16 16 16 136 2 25 35 2 168");
  LoadEightDotPattern(a1, 5010, "16 16 16 136 2 25 35 23 168");
  LoadEightDotPattern(a1, 5011, "16 16 16 136 2 25 35 25 168");
  LoadEightDotPattern(a1, 5012, "16 16 16 136 2 25 35 256 168");
  LoadEightDotPattern(a1, 5013, "16 16 16 136 2 25 35 26 168");
  LoadEightDotPattern(a1, 5014, "16 16 16 136 2 25 35 235 168");
  LoadEightDotPattern(a1, 5015, "16 16 16 136 2 25 35 2356 168");
  LoadEightDotPattern(a1, 5016, "16 16 16 136 2 25 35 236 168");
  LoadEightDotPattern(a1, 6016, "12458");
  LoadEightDotPattern(a1, 6017, "138");
  LoadEightDotPattern(a1, 6018, "6 12458");
  LoadEightDotPattern(a1, 6019, "6 138");
  LoadEightDotPattern(a1, 6020, "124568");
  LoadEightDotPattern(a1, 6021, "2458");
  LoadEightDotPattern(a1, 6022, "3468");
  LoadEightDotPattern(a1, 6023, "6 2458");
  LoadEightDotPattern(a1, 6024, "6 3468");
  LoadEightDotPattern(a1, 6025, "6 14568");
  LoadEightDotPattern(a1, 6026, "1458");
  LoadEightDotPattern(a1, 6027, "36 234568");
  LoadEightDotPattern(a1, 6028, "6 1458");
  LoadEightDotPattern(a1, 6029, "356 234568");
  LoadEightDotPattern(a1, 6030, "13458");
  LoadEightDotPattern(a1, 6031, "23458");
  LoadEightDotPattern(a1, 6032, "234568");
  LoadEightDotPattern(a1, 6033, "6 23458");
  LoadEightDotPattern(a1, 6034, "6 234568");
  LoadEightDotPattern(a1, 6035, "6 13458");
  LoadEightDotPattern(a1, 6036, "128");
  LoadEightDotPattern(a1, 6037, "12348");
  LoadEightDotPattern(a1, 6038, "123468");
  LoadEightDotPattern(a1, 6039, "6 12348");
  LoadEightDotPattern(a1, 6040, "1348");
  LoadEightDotPattern(a1, 6041, "6 134568");
  LoadEightDotPattern(a1, 6042, "12358");
  LoadEightDotPattern(a1, 6043, "6 1238");
  LoadEightDotPattern(a1, 6044, "24568");
  LoadEightDotPattern(a1, 6045, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6046, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6047, "2348");
  LoadEightDotPattern(a1, 6048, "1258");
  LoadEightDotPattern(a1, 6049, "1238");
  LoadEightDotPattern(a1, 6050, "1358");
  LoadEightDotPattern(a1, 6051, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6052, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6053, "6 348");
  LoadEightDotPattern(a1, 6054, "15 18");
  LoadEightDotPattern(a1, 6055, "14 18");
  LoadEightDotPattern(a1, 6056, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6057, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6058, "12568");
  LoadEightDotPattern(a1, 6059, "6 13468");
  LoadEightDotPattern(a1, 6060, "1346 18");
  LoadEightDotPattern(a1, 6061, "14568");
  LoadEightDotPattern(a1, 6062, "1456 18");
  LoadEightDotPattern(a1, 6063, "58");
  LoadEightDotPattern(a1, 6064, "124 18");
  LoadEightDotPattern(a1, 6065, "156 18");
  LoadEightDotPattern(a1, 6066, "156 18");
  LoadEightDotPattern(a1, 6067, "456 148");
  LoadEightDotPattern(a1, 6068, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6069, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6070, "168");
  LoadEightDotPattern(a1, 6071, "348");
  LoadEightDotPattern(a1, 6072, "56 158");
  LoadEightDotPattern(a1, 6073, "2468");
  LoadEightDotPattern(a1, 6074, "268");
  LoadEightDotPattern(a1, 6075, "56 148");
  LoadEightDotPattern(a1, 6076, "258");
  LoadEightDotPattern(a1, 6077, "238");
  LoadEightDotPattern(a1, 6078, "1468");
  LoadEightDotPattern(a1, 6079, "123458");
  LoadEightDotPattern(a1, 6080, "123568");
  LoadEightDotPattern(a1, 6081, "56 1248");
  LoadEightDotPattern(a1, 6082, "1268");
  LoadEightDotPattern(a1, 6083, "56 248");
  LoadEightDotPattern(a1, 6084, "1568");
  LoadEightDotPattern(a1, 6085, "4568");
  LoadEightDotPattern(a1, 6086, "134568");
  LoadEightDotPattern(a1, 6087, "56 18");
  LoadEightDotPattern(a1, 6088, "458");
  LoadEightDotPattern(a1, 6089, "48");
  LoadEightDotPattern(a1, 6090, "368");
  LoadEightDotPattern(a1, 6091, "358");
  LoadEightDotPattern(a1, 6092, "23568");
  LoadEightDotPattern(a1, 6093, "3568");
  LoadEightDotPattern(a1, 6094, "68");
  LoadEightDotPattern(a1, 6095, "38");
  LoadEightDotPattern(a1, 6096, "3458");
  LoadEightDotPattern(a1, 6097, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6098, "12368");
  LoadEightDotPattern(a1, 6099, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6100, "1234568");
  LoadEightDotPattern(a1, 6101, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6102, "46 348");
  LoadEightDotPattern(a1, 6103, "28");
  LoadEightDotPattern(a1, 6104, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6105, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6106, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6107, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6108, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6109, "16 1456 1456 168");
  LoadEightDotPattern(a1, 6112, "2458");
  LoadEightDotPattern(a1, 6113, "18");
  LoadEightDotPattern(a1, 6114, "128");
  LoadEightDotPattern(a1, 6115, "148");
  LoadEightDotPattern(a1, 6116, "1458");
  LoadEightDotPattern(a1, 6117, "158");
  LoadEightDotPattern(a1, 6118, "1248");
  LoadEightDotPattern(a1, 6119, "12458");
  LoadEightDotPattern(a1, 6120, "1258");
  LoadEightDotPattern(a1, 6121, "248");
  LoadEightDotPattern(a1, 6128, "2458");
  LoadEightDotPattern(a1, 6129, "18");
  LoadEightDotPattern(a1, 6130, "128");
  LoadEightDotPattern(a1, 6131, "148");
  LoadEightDotPattern(a1, 6132, "1458");
  LoadEightDotPattern(a1, 6133, "158");
  LoadEightDotPattern(a1, 6134, "1248");
  LoadEightDotPattern(a1, 6135, "12458");
  LoadEightDotPattern(a1, 6136, "1258");
  LoadEightDotPattern(a1, 6137, "248");
  LoadEightDotPattern(a1, 12295, "2458");
  LoadEightDotPattern(a1, 12321, "18");
  LoadEightDotPattern(a1, 12322, "128");
  LoadEightDotPattern(a1, 12323, "148");
  LoadEightDotPattern(a1, 12324, "1458");
  LoadEightDotPattern(a1, 12325, "158");
  LoadEightDotPattern(a1, 12326, "1248");
  LoadEightDotPattern(a1, 12327, "23568");
  LoadEightDotPattern(a1, 12328, "1258");
  LoadEightDotPattern(a1, 12329, "248");
  LoadEightDotPattern(a1, 12344, "1 2458");
  LoadEightDotPattern(a1, 12345, "12 2458");
  LoadEightDotPattern(a1, 12346, "14 2458");
  LoadEightDotPattern(a1, 12353, "18");
  LoadEightDotPattern(a1, 12354, "18");
  LoadEightDotPattern(a1, 12355, "128");
  LoadEightDotPattern(a1, 12356, "128");
  LoadEightDotPattern(a1, 12357, "148");
  LoadEightDotPattern(a1, 12358, "148");
  LoadEightDotPattern(a1, 12359, "1248");
  LoadEightDotPattern(a1, 12360, "1248");
  LoadEightDotPattern(a1, 12361, "248");
  LoadEightDotPattern(a1, 12362, "248");
  LoadEightDotPattern(a1, 12363, "168");
  LoadEightDotPattern(a1, 12364, "5 168");
  LoadEightDotPattern(a1, 12365, "1268");
  LoadEightDotPattern(a1, 12366, "5 1268");
  LoadEightDotPattern(a1, 12367, "1468");
  LoadEightDotPattern(a1, 12368, "5 1468");
  LoadEightDotPattern(a1, 12369, "12468");
  LoadEightDotPattern(a1, 12370, "5 12468");
  LoadEightDotPattern(a1, 12371, "2468");
  LoadEightDotPattern(a1, 12372, "5 2468");
  LoadEightDotPattern(a1, 12373, "1568");
  LoadEightDotPattern(a1, 12374, "5 1568");
  LoadEightDotPattern(a1, 12375, "12568");
  LoadEightDotPattern(a1, 12376, "5 12568");
  LoadEightDotPattern(a1, 12377, "14568");
  LoadEightDotPattern(a1, 12378, "5 14568");
  LoadEightDotPattern(a1, 12379, "124568");
  LoadEightDotPattern(a1, 12380, "5 124568");
  LoadEightDotPattern(a1, 12381, "24568");
  LoadEightDotPattern(a1, 12382, "5 24568");
  LoadEightDotPattern(a1, 12383, "1358");
  LoadEightDotPattern(a1, 12384, "5 1358");
  LoadEightDotPattern(a1, 12385, "12358");
  LoadEightDotPattern(a1, 12386, "5 12358");
  LoadEightDotPattern(a1, 12387, "28");
  LoadEightDotPattern(a1, 12388, "13458");
  LoadEightDotPattern(a1, 12389, "5 13458");
  LoadEightDotPattern(a1, 12390, "123458");
  LoadEightDotPattern(a1, 12391, "5 123458");
  LoadEightDotPattern(a1, 12392, "23458");
  LoadEightDotPattern(a1, 12393, "5 23458");
  LoadEightDotPattern(a1, 12394, "138");
  LoadEightDotPattern(a1, 12395, "1238");
  LoadEightDotPattern(a1, 12396, "1348");
  LoadEightDotPattern(a1, 12397, "12348");
  LoadEightDotPattern(a1, 12398, "2348");
  LoadEightDotPattern(a1, 12399, "1368");
  LoadEightDotPattern(a1, 12400, "5 1368");
  LoadEightDotPattern(a1, 12401, "6 1368");
  LoadEightDotPattern(a1, 12402, "12368");
  LoadEightDotPattern(a1, 12403, "5 12368");
  LoadEightDotPattern(a1, 12404, "6 12368");
  LoadEightDotPattern(a1, 12405, "13468");
  LoadEightDotPattern(a1, 12406, "5 13468");
  LoadEightDotPattern(a1, 12407, "6 13468");
  LoadEightDotPattern(a1, 12408, "123468");
  LoadEightDotPattern(a1, 12409, "5 123468");
  LoadEightDotPattern(a1, 12410, "6 123468");
  LoadEightDotPattern(a1, 12411, "23468");
  LoadEightDotPattern(a1, 12412, "5 23468");
  LoadEightDotPattern(a1, 12413, "6 23468");
  LoadEightDotPattern(a1, 12414, "13568");
  LoadEightDotPattern(a1, 12415, "123568");
  LoadEightDotPattern(a1, 12416, "134568");
  LoadEightDotPattern(a1, 12417, "1234568");
  LoadEightDotPattern(a1, 12418, "234568");
  LoadEightDotPattern(a1, 12419, "348");
  LoadEightDotPattern(a1, 12420, "348");
  LoadEightDotPattern(a1, 12421, "3468");
  LoadEightDotPattern(a1, 12422, "3468");
  LoadEightDotPattern(a1, 12423, "3458");
  LoadEightDotPattern(a1, 12424, "3458");
  LoadEightDotPattern(a1, 12425, "158");
  LoadEightDotPattern(a1, 12426, "1258");
  LoadEightDotPattern(a1, 12427, "1458");
  LoadEightDotPattern(a1, 12428, "12458");
  LoadEightDotPattern(a1, 12429, "2458");
  LoadEightDotPattern(a1, 12430, "38");
  LoadEightDotPattern(a1, 12431, "38");
  LoadEightDotPattern(a1, 12432, "238");
  LoadEightDotPattern(a1, 12433, "2358");
  LoadEightDotPattern(a1, 12434, "358");
  LoadEightDotPattern(a1, 12435, "3568");
  LoadEightDotPattern(a1, 12436, "5 148");
  LoadEightDotPattern(a1, 12437, "168");
  LoadEightDotPattern(a1, 12438, "12468");
  LoadEightDotPattern(a1, 12442, "2568");
  LoadEightDotPattern(a1, 12443, "58");
  LoadEightDotPattern(a1, 12444, "68");
  LoadEightDotPattern(a1, 12448, "36 368");
  LoadEightDotPattern(a1, 12449, "18");
  LoadEightDotPattern(a1, 12450, "18");
  LoadEightDotPattern(a1, 12451, "128");
  LoadEightDotPattern(a1, 12452, "128");
  LoadEightDotPattern(a1, 12453, "148");
  LoadEightDotPattern(a1, 12454, "148");
  LoadEightDotPattern(a1, 12455, "1248");
  LoadEightDotPattern(a1, 12456, "1248");
  LoadEightDotPattern(a1, 12457, "248");
  LoadEightDotPattern(a1, 12458, "248");
  LoadEightDotPattern(a1, 12459, "168");
  LoadEightDotPattern(a1, 12460, "5 168");
  LoadEightDotPattern(a1, 12461, "1268");
  LoadEightDotPattern(a1, 12462, "5 1268");
  LoadEightDotPattern(a1, 12463, "1468");
  LoadEightDotPattern(a1, 12464, "5 1468");
  LoadEightDotPattern(a1, 12465, "12468");
  LoadEightDotPattern(a1, 12466, "5 12468");
  LoadEightDotPattern(a1, 12467, "2468");
  LoadEightDotPattern(a1, 12468, "5 2468");
  LoadEightDotPattern(a1, 12469, "1568");
  LoadEightDotPattern(a1, 12470, "5 1568");
  LoadEightDotPattern(a1, 12471, "12568");
  LoadEightDotPattern(a1, 12472, "5 12568");
  LoadEightDotPattern(a1, 12473, "14568");
  LoadEightDotPattern(a1, 12474, "5 14568");
  LoadEightDotPattern(a1, 12475, "124568");
  LoadEightDotPattern(a1, 12476, "5 124568");
  LoadEightDotPattern(a1, 12477, "24568");
  LoadEightDotPattern(a1, 12478, "5 24568");
  LoadEightDotPattern(a1, 12479, "1358");
  LoadEightDotPattern(a1, 12480, "5 1358");
  LoadEightDotPattern(a1, 12481, "12358");
  LoadEightDotPattern(a1, 12482, "5 12358");
  LoadEightDotPattern(a1, 12483, "28");
  LoadEightDotPattern(a1, 12484, "13458");
  LoadEightDotPattern(a1, 12485, "5 13458");
  LoadEightDotPattern(a1, 12486, "123458");
  LoadEightDotPattern(a1, 12487, "5 123458");
  LoadEightDotPattern(a1, 12488, "23458");
  LoadEightDotPattern(a1, 12489, "5 23458");
  LoadEightDotPattern(a1, 12490, "138");
  LoadEightDotPattern(a1, 12491, "1238");
  LoadEightDotPattern(a1, 12492, "1348");
  LoadEightDotPattern(a1, 12493, "12348");
  LoadEightDotPattern(a1, 12494, "2348");
  LoadEightDotPattern(a1, 12495, "1368");
  LoadEightDotPattern(a1, 12496, "5 1368");
  LoadEightDotPattern(a1, 12497, "6 1368");
  LoadEightDotPattern(a1, 12498, "12368");
  LoadEightDotPattern(a1, 12499, "5 12368");
  LoadEightDotPattern(a1, 12500, "6 12368");
  LoadEightDotPattern(a1, 12501, "13468");
  LoadEightDotPattern(a1, 12502, "5 13468");
  LoadEightDotPattern(a1, 12503, "6 13468");
  LoadEightDotPattern(a1, 12504, "123468");
  LoadEightDotPattern(a1, 12505, "5 123468");
  LoadEightDotPattern(a1, 12506, "6 123468");
  LoadEightDotPattern(a1, 12507, "23468");
  LoadEightDotPattern(a1, 12508, "5 23468");
  LoadEightDotPattern(a1, 12509, "6 23468");
  LoadEightDotPattern(a1, 12510, "13568");
  LoadEightDotPattern(a1, 12511, "123568");
  LoadEightDotPattern(a1, 12512, "134568");
  LoadEightDotPattern(a1, 12513, "1234568");
  LoadEightDotPattern(a1, 12514, "234568");
  LoadEightDotPattern(a1, 12515, "348");
  LoadEightDotPattern(a1, 12516, "348");
  LoadEightDotPattern(a1, 12517, "3468");
  LoadEightDotPattern(a1, 12518, "3468");
  LoadEightDotPattern(a1, 12519, "3458");
  LoadEightDotPattern(a1, 12520, "3458");
  LoadEightDotPattern(a1, 12521, "158");
  LoadEightDotPattern(a1, 12522, "1258");
  LoadEightDotPattern(a1, 12523, "1458");
  LoadEightDotPattern(a1, 12524, "12458");
  LoadEightDotPattern(a1, 12525, "2458");
  LoadEightDotPattern(a1, 12526, "38");
  LoadEightDotPattern(a1, 12527, "38");
  LoadEightDotPattern(a1, 12528, "238");
  LoadEightDotPattern(a1, 12529, "2358");
  LoadEightDotPattern(a1, 12530, "358");
  LoadEightDotPattern(a1, 12531, "3568");
  LoadEightDotPattern(a1, 12532, "5 148");
  LoadEightDotPattern(a1, 12533, "168");
  LoadEightDotPattern(a1, 12534, "12468");
  LoadEightDotPattern(a1, 12535, "256 1368");
  LoadEightDotPattern(a1, 12536, "256 12368");
  LoadEightDotPattern(a1, 12537, "256 123468");
  LoadEightDotPattern(a1, 12538, "256 23468");
  LoadEightDotPattern(a1, 12539, "58");
  LoadEightDotPattern(a1, 12540, "258");
  LoadEightDotPattern(a1, 12549, "128");
  LoadEightDotPattern(a1, 12550, "12348");
  LoadEightDotPattern(a1, 12551, "1348");
  LoadEightDotPattern(a1, 12552, "1248");
  LoadEightDotPattern(a1, 12553, "1458");
  LoadEightDotPattern(a1, 12554, "23458");
  LoadEightDotPattern(a1, 12555, "13458");
  LoadEightDotPattern(a1, 12556, "1238");
  LoadEightDotPattern(a1, 12557, "12458");
  LoadEightDotPattern(a1, 12558, "138");
  LoadEightDotPattern(a1, 12559, "1258");
  LoadEightDotPattern(a1, 12560, "12458");
  LoadEightDotPattern(a1, 12561, "138");
  LoadEightDotPattern(a1, 12562, "1258");
  LoadEightDotPattern(a1, 12563, "348");
  LoadEightDotPattern(a1, 12564, "123458");
  LoadEightDotPattern(a1, 12565, "1568");
  LoadEightDotPattern(a1, 12566, "2458");
  LoadEightDotPattern(a1, 12567, "13568");
  LoadEightDotPattern(a1, 12568, "148");
  LoadEightDotPattern(a1, 12569, "2348");
  LoadEightDotPattern(a1, 12570, "358");
  LoadEightDotPattern(a1, 12571, "268");
  LoadEightDotPattern(a1, 12572, "268");
  LoadEightDotPattern(a1, 12574, "2468");
  LoadEightDotPattern(a1, 12575, "23468");
  LoadEightDotPattern(a1, 12576, "2358");
  LoadEightDotPattern(a1, 12577, "123568");
  LoadEightDotPattern(a1, 12578, "12368");
  LoadEightDotPattern(a1, 12579, "3568");
  LoadEightDotPattern(a1, 12580, "2368");
  LoadEightDotPattern(a1, 12581, "34568");
  LoadEightDotPattern(a1, 12582, "12358");
  LoadEightDotPattern(a1, 12583, "248");
  LoadEightDotPattern(a1, 12584, "1368");
  return LoadEightDotPattern(a1, 12585, "1368");
}

uint64_t BRLDISP_Translate( uint64_t a1, __int16 a2, __int32 *a3, int *a4, unsigned int a5, unsigned int a6, _WORD *a7)
{
  uint64_t v7 = a4;
  if ((a2 & 0x1000) != 0)
  {
    unint64_t v13 = (unint64_t)&a4[a5 - 1];
    __int32 v14 = *a3;
    if (*a3) {
      BOOL v15 = v13 > (unint64_t)a4;
    }
    else {
      BOOL v15 = 0;
    }
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 16);
      int v17 = *(_DWORD *)(a1 + 8);
      uint64_t v18 = a3 + 1;
      do
      {
        uint64_t v19 = *(void *)(v16 + 8LL * BYTE1(v14));
        int v20 = v17;
        if (v19) {
          int v20 = *(_DWORD *)(v19 + 4LL * v14);
        }
        *v7++ = v20;
        int v21 = *v18++;
        LOWORD(v14) = v21;
        if (v21) {
          BOOL v22 = (unint64_t)v7 >= v13;
        }
        else {
          BOOL v22 = 1;
        }
      }

      while (!v22);
    }

    uint64_t result = 0LL;
    int *v7 = 0;
  }

  else
  {
    uint64_t result = BRLTRN_TranslateString(*(_DWORD **)a1, a3, a4, a5, a6, a7);
    if (!(_DWORD)result)
    {
      unint64_t v9 = *v7;
      if ((_DWORD)v9)
      {
        int v10 = (unsigned int *)(v7 + 1);
        do
        {
          if (v9 > 0xFF) {
            unsigned int v11 = 0;
          }
          else {
            unsigned int v11 = (wcUnicode[v9] & 0xFFFFFF3F) + 10240;
          }
          *(v10 - 1) = v11;
          unsigned int v12 = *v10++;
          unint64_t v9 = v12;
        }

        while (v12);
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t BRLDISP_LocateSource(uint64_t a1, __int16 a2, __int32 *a3, int a4, _WORD *a5)
{
  uint64_t result = 14LL;
  if (a1 && a3 && a5)
  {
    if ((a2 & 0x1000) == 0)
    {
      if (*a3)
      {
        unsigned __int16 v11 = 0;
        int v12 = -1;
        do
        {
          else {
            unsigned __int16 v13 = v18[0];
          }
          int v14 = v13;
          if (v12 < v13) {
            *(_DWORD *)&v18[2 * v13 + 1] = v11;
          }
          if (v12 + 1 < v13)
          {
            BOOL v15 = &v18[2 * v12 + 3];
            uint64_t v16 = ~(uint64_t)v12 + v14;
            do
            {
              if (v12 < 0) {
                int v17 = 0;
              }
              else {
                int v17 = *(_DWORD *)&v18[2 * v12 + 1];
              }
              *v15++ = v17;
              ++v12;
              --v16;
            }

            while (v16);
          }

          ++v11;
          int v12 = v14;
        }

        while (a3[v11]);
      }

      else
      {
        int v14 = -1;
      }

      if (v14 >= a4) {
        LOWORD(v14) = a4;
      }
      a4 = *(_DWORD *)&v18[2 * (unsigned __int16)v14 + 1];
    }

    uint64_t result = 0LL;
    *a5 = a4;
  }

  return result;
}

uint64_t BRLDISP_LocateSourceLinear(uint64_t a1, __int16 a2, __int32 *a3, int a4, _WORD *a5)
{
  uint64_t result = 14LL;
  if (a1 && a3 && a5)
  {
    if ((a2 & 0x1000) == 0)
    {
      if (*a3)
      {
        unsigned __int16 v11 = 0;
        int v12 = -1;
        do
        {
          else {
            unsigned __int16 v13 = v18[0];
          }
          int v14 = v13;
          if (v12 < v13) {
            *(_DWORD *)&v18[2 * v13 + 1] = v11;
          }
          if (v12 + 1 < v13)
          {
            BOOL v15 = &v18[2 * v12 + 3];
            uint64_t v16 = ~(uint64_t)v12 + v14;
            do
            {
              if (v12 < 0) {
                int v17 = 0;
              }
              else {
                int v17 = *(_DWORD *)&v18[2 * v12 + 1];
              }
              *v15++ = v17;
              ++v12;
              --v16;
            }

            while (v16);
          }

          ++v11;
          int v12 = v14;
        }

        while (a3[v11]);
      }

      else
      {
        int v14 = -1;
      }

      if (v14 >= a4) {
        LOWORD(v14) = a4;
      }
      a4 = *(_DWORD *)&v18[2 * (unsigned __int16)v14 + 1];
    }

    uint64_t result = 0LL;
    *a5 = a4;
  }

  return result;
}

uint64_t BRLDISP_Destroy(_DWORD **a1)
{
  if (!a1) {
    return 14LL;
  }
  uint64_t v2 = BRLTRN_Destroy(*a1);
  free(a1);
  return v2;
}

uint64_t BRLDISP_PrintDots(int *a1, __int16 a2, FILE *a3, FILE *a4)
{
  int v8 = *a1;
  if (*a1)
  {
    unint64_t v9 = a1 + 1;
    do
    {
      if ((v8 & 8) != 0) {
        uint64_t v10 = 42LL;
      }
      else {
        uint64_t v10 = 32LL;
      }
      if ((v8 & 1) != 0) {
        uint64_t v11 = 42LL;
      }
      else {
        uint64_t v11 = 32LL;
      }
      fprintf(a3, "%c%c ", v11, v10);
      int v12 = *v9++;
      LOBYTE(v8) = v12;
    }

    while (v12);
  }

  fputc(10, a3);
  int v13 = *a1;
  if (*a1)
  {
    int v14 = a1 + 1;
    do
    {
      if ((v13 & 0x10) != 0) {
        uint64_t v15 = 42LL;
      }
      else {
        uint64_t v15 = 32LL;
      }
      if ((v13 & 2) != 0) {
        uint64_t v16 = 42LL;
      }
      else {
        uint64_t v16 = 32LL;
      }
      fprintf(a3, "%c%c ", v16, v15);
      int v17 = *v14++;
      LOBYTE(v13) = v17;
    }

    while (v17);
  }

  fputc(10, a3);
  int v18 = *a1;
  if (*a1)
  {
    uint64_t v19 = a1 + 1;
    do
    {
      if ((v18 & 0x20) != 0) {
        uint64_t v20 = 42LL;
      }
      else {
        uint64_t v20 = 32LL;
      }
      if ((v18 & 4) != 0) {
        uint64_t v21 = 42LL;
      }
      else {
        uint64_t v21 = 32LL;
      }
      fprintf(a3, "%c%c ", v21, v20);
      int v22 = *v19++;
      LOBYTE(v18) = v22;
    }

    while (v22);
  }

  fputc(10, a3);
  int v23 = *a1;
  if ((a2 & 0x1000) != 0)
  {
    if (v23)
    {
      v26 = a1 + 1;
      do
      {
        if ((v23 & 0x80) != 0) {
          uint64_t v27 = 42LL;
        }
        else {
          uint64_t v27 = 32LL;
        }
        if ((v23 & 0x40) != 0) {
          uint64_t v28 = 42LL;
        }
        else {
          uint64_t v28 = 32LL;
        }
        fprintf(a3, "%c%c ", v28, v27);
        int v29 = *v26++;
        LOBYTE(v23) = v29;
      }

      while (v29);
    }

    fputc(10, a3);
  }

  else if (v23)
  {
    unsigned __int16 v24 = a1 + 1;
    while ((v23 & 0xC0) == 0)
    {
      int v25 = *v24++;
      LOBYTE(v23) = v25;
      if (!v25) {
        return 0LL;
      }
    }

    fwrite("     ****WARNING**** Lower dot(s) present in expected six-dot output\n", 0x45uLL, 1uLL, a4);
  }

  return 0LL;
}

uint64_t BRLDISP_PrintAlignmentSpacing(int a1, FILE *__stream)
{
  if (a1 >= 1)
  {
    int v3 = a1;
    do
    {
      fwrite("   ", 3uLL, 1uLL, __stream);
      --v3;
    }

    while (v3);
  }

  return 0LL;
}

uint64_t BRLDISP_PrintSeparator(int a1, FILE *__stream)
{
  if (a1 >= 1)
  {
    int v3 = a1;
    do
    {
      fwrite("---", 3uLL, 1uLL, __stream);
      --v3;
    }

    while (v3);
  }

  fputc(10, __stream);
  return 0LL;
}

void *LoadEightDotPatternBin(void *result, __int16 a2, int a3)
{
  __darwin_ct_rune_t v5 = result;
  int v6 = (void *)result[2];
  if (v6 || (result = calloc(0x100uLL, 8uLL), int v6 = result, (v5[2] = result) != 0LL))
  {
    uint64_t v7 = v6[HIBYTE(a2)];
    if (!v7)
    {
      uint64_t result = malloc(0x400uLL);
      v6[HIBYTE(a2)] = result;
      uint64_t v7 = *(void *)(v5[2] + 8LL * HIBYTE(a2));
      if (!v7) {
        return result;
      }
      for (uint64_t i = 0LL; i != 1024; i += 4LL)
        *(_DWORD *)(v7 + i) = *((_DWORD *)v5 + 2);
    }

    *(_DWORD *)(v7 + 4LL * a2) = a3;
  }

  return result;
}

void *LoadEightDotPattern(void *a1, __int16 a2, char *a3)
{
  int v3 = 0;
  int v4 = 10240;
  while (2)
  {
    int v6 = *a3++;
    int v5 = v6;
    switch(v6)
    {
      case '1':
        v4 |= 1u;
        continue;
      case '2':
        v4 |= 2u;
        continue;
      case '3':
        v4 |= 4u;
        continue;
      case '4':
        v4 |= 8u;
        continue;
      case '5':
        v4 |= 0x10u;
        continue;
      case '6':
        v4 |= 0x20u;
        continue;
      case '7':
        v4 |= 0x40u;
        continue;
      case '8':
        if (!v3) {
          v4 |= 0x80u;
        }
        continue;
      default:
        if (v5)
        {
          ++v3;
          int v4 = 10240;
          continue;
        }

        return LoadEightDotPatternBin(a1, a2, v4);
    }
  }

uint64_t BRLTRN_Version(_WORD *a1, _WORD *a2)
{
  uint64_t result = 14LL;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0LL;
      *a1 = 8;
      *a2 = 1;
    }
  }

  return result;
}

uint64_t BRLTRN_GetStateArraySize(_WORD *a1)
{
  if (!a1) {
    return 14LL;
  }
  uint64_t result = 0LL;
  *a1 = 2;
  return result;
}

double BRLTRN_ResetStateArray(uint64_t a1, _OWORD *a2)
{
  if (a1)
  {
    if (a2)
    {
      dxbte_state_reset((uint64_t)v4);
      double result = v5[0];
      *a2 = *(_OWORD *)v5;
    }
  }

  return result;
}

uint64_t BRLTRN_CreateTableBytes(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10 = 1LL;
  uint64_t v11 = calloc(0x8880uLL, 1uLL);
  *a1 = v11;
  dxerr_report_create((uint64_t)(v11 + 4350));
  dxios_stream_create((uint64_t)(v11 + 12), (uint64_t)(v11 + 4350));
  dxios_stream_create((uint64_t)(v11 + 1), (uint64_t)(v11 + 4350));
  dxbte_engine_create(v11 + 23, (uint64_t)(v11 + 4350));
  if (a2)
  {
    uint64_t v10 = 1LL;
    if (!dxios_stream_activate_buf((uint64_t)(v11 + 1), 1u, a2, a3))
    {
      else {
        uint64_t v10 = 3LL;
      }
    }
  }

  dxios_stream_destroy(v13);
  return v10;
}

uint64_t BRLTRN_CreateW(__int32 *a1, __int32 *a2, uint64_t *a3, uint64_t a4, __int32 *a5)
{
  if ((BRLTRN_CreateW_chi_initialized & 1) == 0)
  {
    unint64_t v9 = dxios_search_open_w(a5, 0LL, 0LL, 0LL, 256);
    int v10 = chiini_stream((uint64_t)v9);
    if (v9) {
      dxios_close(v9);
    }
    if (v10) {
      return 11LL;
    }
    BRLTRN_CreateW_chi_initialized = 1;
  }

  int v12 = dx_wfopen(a1, dword_2EE64);
  int v13 = dx_wfopen(a2, (const __int32 *)&unk_2EE70);
  int v14 = (char *)calloc(0x8880uLL, 1uLL);
  uint64_t v15 = (uint64_t)v14;
  if (v14)
  {
    uint64_t v16 = (uint64_t *)(v14 + 34872);
    dxerr_report_create((uint64_t)(v14 + 34800));
    dxios_stream_create(v15 + 96, v15 + 34800);
    dxios_stream_create(v15 + 8, v15 + 34800);
    dxbte_engine_create((void *)(v15 + 184), v15 + 34800);
    *(void *)(v15 + 34888) = 0LL;
    uint64_t v11 = 1LL;
    if (v12)
    {
      if (dxios_stream_activate_fp(v15 + 8, (uint64_t)v12, 1u, 0))
      {
LABEL_14:
        fclose(v12);
        goto LABEL_15;
      }

      if (!v13 || dxios_stream_activate_fp(v15 + 96, (uint64_t)v13, 0, 0))
      {
        uint64_t v11 = 3LL;
        goto LABEL_14;
      }

      uint64_t v11 = initialize_engine_helper(v15, (uint64_t)v20);
      if ((_DWORD)v11) {
        goto LABEL_14;
      }
      int v18 = dxchi_unimap_create();
      uint64_t *v16 = (uint64_t)v18;
      brltrn_unimap_read((uint64_t)v18, a5, dword_2EE78);
      if (is_basename_equal(a1, dword_2EEA4))
      {
        uint64_t v19 = (int *)&unk_2EED0;
      }

      else if (is_basename_equal(a1, dword_2EEF0))
      {
        uint64_t v19 = (int *)&unk_2EF1C;
      }

      else if (is_basename_equal(a1, dword_2EF3C))
      {
        uint64_t v19 = (int *)&unk_2EF68;
      }

      else
      {
        if (!is_basename_equal(a1, dword_2EF9C))
        {
LABEL_32:
          uint64_t v11 = 0LL;
          goto LABEL_14;
        }

        uint64_t v19 = (int *)&unk_2EFC8;
      }

      brltrn_unimap_read(*v16, a5, v19);
      goto LABEL_32;
    }
  }

  else
  {
    uint64_t v11 = 0LL;
    if (v12) {
      goto LABEL_14;
    }
  }

_DWORD *brltrn_unimap_read(uint64_t a1, int *a2, int *a3)
{
  int v5 = wcsrchr(v8, 47);
  if (v5)
  {
    v5[1] = 0;
    wcscax((uint64_t)v8, a3, 256);
  }

  else
  {
    wcscpx(v8, a3, 256LL);
  }

  double result = dxios_search_open_w(v8, 0LL, 0LL, 0LL, 256);
  if (result)
  {
    uint64_t v7 = result;
    dxchi_unimap_read(a1, (uint64_t)result);
    return (_DWORD *)dxios_close(v7);
  }

  return result;
}

uint64_t is_basename_equal(const __int32 *a1, const __int32 *a2)
{
  int v4 = wcsrchr(a1, 47);
  int v5 = wcsrchr(a2, 47);
  int v6 = (unsigned int *)(v4 + 1);
  if (!v4) {
    int v6 = (unsigned int *)a1;
  }
  uint64_t v7 = (unsigned int *)(v5 + 1);
  if (!v5) {
    uint64_t v7 = (unsigned int *)a2;
  }
  unsigned int v8 = *v6;
  unsigned int v9 = *v7;
  if (!(*v6 | *v7)) {
    return 1LL;
  }
  int v10 = v6 + 1;
  for (uint64_t i = v7 + 1; ; ++i)
  {
    if (v8 <= 0x7F && (_DefaultRuneLocale.__runetype[v8] & 0x8000) != 0) {
      unsigned int v8 = __tolower(v8);
    }
    if (v9 <= 0x7F && (_DefaultRuneLocale.__runetype[v9] & 0x8000) != 0) {
      unsigned int v9 = __tolower(v9);
    }
    if (v8 != v9) {
      break;
    }
    unsigned int v12 = *v10++;
    unsigned int v8 = v12;
    unsigned int v13 = *i;
    unsigned int v9 = v13;
    if (!(v8 | v13)) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t BRLTRN_Destroy(_DWORD *a1)
{
  if (a1)
  {
    uint64_t v2 = a1 + 8718;
    dxbte_engine_destroy((uint64_t)(a1 + 46));
    dxios_stream_destroy(a1 + 2);
    dxios_stream_destroy(a1 + 24);
    dxchi_unimap_destroy(*(void **)v2);
    *(void *)uint64_t v2 = 0LL;
    uint64_t v3 = *((void *)v2 + 3);
    if (v3)
    {
      dxbte_engine_destroy(v3);
      free(*((void **)v2 + 3));
      *((void *)v2 + 3) = 0LL;
    }

    uint64_t v4 = *((void *)v2 + 2);
    if (v4)
    {
      dxscb_engine_destroy(v4);
      free(*((void **)v2 + 2));
      *((void *)v2 + 2) = 0LL;
    }

    int v5 = (void *)*((void *)v2 + 7);
    if (v5) {
      free(v5);
    }
    int v6 = (void *)*((void *)v2 + 8);
    if (v6) {
      free(v6);
    }
    free(a1);
  }

  return 0LL;
}

uint64_t BRLTRN_SetStateBitmapVariableArray(uint64_t a1, void *a2)
{
  if (a1)
  {
    *(void *)(a1 + 34880) = a2;
    *a2 = 0LL;
    a2[1] = 0LL;
  }

  return 0LL;
}

uint64_t BRLTRN_Map2800(uint64_t a1, int a2, int a3)
{
  if (a1)
  {
    *(_DWORD *)(a1 + 34904) = a2;
    *(_DWORD *)(a1 + 34908) = a3;
  }

  return 0LL;
}

uint64_t BRLTRN_AddScrub(uint64_t a1, __int32 *a2, uint64_t a3, int a4)
{
  if (!a1) {
    return 14LL;
  }
  dxios_stream_create((uint64_t)v12, a1 + 34800);
  dxios_stream_activate_autobuf((uint64_t)v12, 3u, 4096LL, 4096LL);
  size_t table_bytes = read_table_bytes(v12, a2, (const __int32 *)&unk_2EE70, 0xFuLL);
  if (!(_DWORD)table_bytes)
  {
    dxios_stream_capture_buf((uint64_t)v12, &v11, 0, (size_t *)&v10);
    size_t table_bytes = BRLTRN_AddScrubTableBytes(a1, v11, v10, v8, a4);
  }

  dxios_stream_destroy(v12);
  return table_bytes;
}

size_t read_table_bytes(void *a1, __int32 *a2, const __int32 *a3, size_t a4)
{
  int v6 = dx_wfopen(a2, a3);
  if (v6)
  {
    uint64_t v7 = v6;
    while (1)
    {
      a4 = fread(__ptr, 1uLL, 0x200uLL, v7);
      if (!a4) {
        break;
      }
    }

    fclose(v7);
  }

  return a4;
}

uint64_t BRLTRN_AddScrubTableBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  if (a1)
  {
    unsigned int v9 = (uint64_t *)malloc(0x2E8uLL);
    if (v9)
    {
      uint64_t v10 = v9;
      dxscb_engine_create(v9, a1 + 34800);
      dxios_stream_create((uint64_t)v14, v10[1]);
      unsigned __int16 v11 = dxios_stream_activate_buf((uint64_t)v14, 1u, a2, a3);
      if (!v11) {
        unsigned __int16 v11 = (unsigned __int16)dxscb_engine_activate((uint64_t)v10, (uint64_t)v14);
      }
      dxios_stream_destroy(v14);
      if (v11)
      {
        dxscb_engine_destroy((uint64_t)v10);
        free(v10);
      }

      else
      {
        if (a5 <= 1) {
          int v12 = 1;
        }
        else {
          int v12 = a5;
        }
        dxscb_engine_set_initial_state(v10, v12);
        unsigned __int16 v11 = 0;
        *(void *)(a1 + 34888) = v10;
      }
    }

    else
    {
      return 23;
    }
  }

  else
  {
    return 14;
  }

  return v11;
}

uint64_t BRLTRN_AddSecondaryTranslator(uint64_t a1, __int32 *a2, __int32 *a3)
{
  if (!a1) {
    return 14LL;
  }
  dxios_stream_create((uint64_t)v13, a1 + 34800);
  dxios_stream_activate_autobuf((uint64_t)v13, 3u, 4096LL, 4096LL);
  size_t table_bytes = read_table_bytes(v13, a2, dword_2EE64, 1uLL);
  if (!(_DWORD)table_bytes)
  {
    dxios_stream_capture_buf((uint64_t)v13, &v12, 0, (size_t *)&v11);
    dxios_stream_deactivate((uint64_t)v13, &v8);
    dxios_stream_activate_autobuf((uint64_t)v13, 3u, 4096LL, 4096LL);
    size_t table_bytes = read_table_bytes(v13, a3, (const __int32 *)&unk_2EE70, 3uLL);
    if (!(_DWORD)table_bytes)
    {
      dxios_stream_capture_buf((uint64_t)v13, &v10, 0, (size_t *)&v9);
      size_t table_bytes = BRLTRN_AddSecondaryTranslatorTableBytes(a1, v12, v11, v10, v9);
    }
  }

  dxios_stream_destroy(v13);
  return table_bytes;
}

uint64_t BRLTRN_AddSecondaryTranslatorTableBytes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a1)
  {
    uint64_t v10 = (uint64_t *)malloc(0x8738uLL);
    if (v10)
    {
      uint64_t v11 = v10;
      dxbte_engine_create(v10, a1 + 34800);
      dxios_stream_create((uint64_t)v15, a1 + 34800);
      dxios_stream_create((uint64_t)v14, a1 + 34800);
      unsigned __int16 v12 = 1;
      if (a2 && !dxios_stream_activate_buf((uint64_t)v14, 1u, a2, a3))
      {
        if (a4 && !dxios_stream_activate_buf((uint64_t)v15, 0, a4, a5))
        {
          unsigned __int16 v12 = dxbte_engine_activate(v11, 2, 3, (uint64_t)gsty, 0LL, 0LL, 0LL, 0, 0, (uint64_t)v14, (uint64_t)v15, 1);
          dxios_stream_destroy(v15);
          dxios_stream_destroy(v14);
          if (!v12)
          {
            unsigned __int16 v12 = 0;
            *(void *)(a1 + 34896) = v11;
            return v12;
          }
        }

        else
        {
          unsigned __int16 v12 = 3;
        }
      }

      dxbte_engine_destroy((uint64_t)v11);
      free(v11);
    }

    else
    {
      return 23;
    }
  }

  else
  {
    return 14;
  }

  return v12;
}

uint64_t BRLTRN_TranslateAutoString(uint64_t a1, __int128 *a2, __int32 *a3, unsigned __int16 *a4)
{
  uint64_t result = 14LL;
  if (a1 && a3)
  {
    uint64_t v9 = (void *)(a1 + 34912);
    size_t v10 = wcslen(a3);
    size_t v11 = v10;
    if (a2) {
      __int128 v18 = *a2;
    }
    unsigned __int16 v12 = 0;
    unint64_t v13 = 4 * v10;
    do
    {
      unint64_t v14 = *v9 + v12;
      if (v14 <= v13) {
        unint64_t v14 = 4 * v11;
      }
      if (v14 <= *(void *)(a1 + 34920)) {
        unint64_t v14 = *(void *)(a1 + 34920);
      }
      if (v14 <= 0xC8) {
        unsigned __int16 v15 = 200;
      }
      else {
        unsigned __int16 v15 = v14;
      }
      if (*v9 < (unint64_t)v15)
      {
        uint64_t v16 = realloc(*(void **)(a1 + 34928), 4LL * v15);
        int v17 = realloc(*(void **)(a1 + 34936), 2LL * v15);
        if (!v16)
        {
          if (v17) {
            *(void *)(a1 + 34936) = v17;
          }
          return 23LL;
        }

        *(void *)(a1 + 34928) = v16;
        if (!v17) {
          return 23LL;
        }
        *(void *)(a1 + 34936) = v17;
        void *v9 = v15;
      }

      if (a2) {
        *a2 = v18;
      }
      uint64_t result = BRLTRN_TranslateStringEx(a1, (int)a2, a3);
      unsigned __int16 v12 = v11;
    }

    while (v15 - 100 <= v19);
    if (!(_DWORD)result)
    {
      *(void *)(a1 + 34920) = v19;
      uint64_t result = 0LL;
      if (a4) {
        *a4 = v19;
      }
    }
  }

  return result;
}

uint64_t BRLTRN_TranslateStringEx( uint64_t a1, __int128 *a2, unsigned int *a3, int *a4, uint64_t a5, unsigned int a6, unsigned __int16 *a7)
{
  uint64_t v7 = 14LL;
  if (a1)
  {
    uint64_t v8 = a3;
    if (a3)
    {
      uint64_t v9 = a7;
      unsigned int v10 = a6;
      unsigned __int16 v12 = a4;
      unint64_t v13 = a2;
      if (!a4 && !a5 && !a6) {
        return BRLTRN_TranslateAutoString(a1, a2, (__int32 *)a3, a7);
      }
      if (a4 && a6)
      {
        uint64_t v76 = a1 + 34872;
        dxerr_report_create((uint64_t)v90);
        dxios_stream_create((uint64_t)v83, (uint64_t)v90);
        dxios_stream_create((uint64_t)v82, (uint64_t)v90);
        dxbte_state_reset((uint64_t)&v79);
        if (v13 || (unint64_t v13 = *(__int128 **)(v76 + 8)) != 0LL)
        {
          int v73 = 0;
          uint64_t v80 = *(void *)v13;
          uint64_t v81 = *((void *)v13 + 1);
        }

        else
        {
          int v73 = 1;
        }

        unsigned int v16 = *v8;
        uint64_t v77 = a5;
        v78 = v12;
        v74 = v13;
        if (v16)
        {
          unsigned int v71 = v10;
          v72 = v9;
          uint64_t v17 = 0LL;
          uint64_t v18 = *(void *)v76;
          uint64_t v19 = *(void *)(v76 + 16);
          uint64_t v20 = v8;
          do
          {
            if (v19) {
              uint64_t v21 = v17;
            }
            else {
              uint64_t v21 = v17 + 2;
            }
            if (v16 <= 0x7F && (_DefaultRuneLocale.__runetype[v16] & 0x200) != 0)
            {
              uint64_t v22 = 1LL;
            }

            else
            {
              chudi(v16);
              uint64_t v22 = 0LL;
            }

            uint64_t v17 = v22 + v21;
            unsigned int v24 = v20[1];
            ++v20;
            unsigned int v16 = v24;
          }

          while (v24);
          uint64_t v25 = *(void *)v76;
          uint64_t v75 = *(void *)(v76 + 16);
          uint64_t v26 = *v8;
          __chkstk_darwin();
          unint64_t v29 = (v28 + 18) & 0xFFFFFFFFFFFFFFF0LL;
          v30 = (char *)&v69 - v29;
          if ((_DWORD)v26)
          {
            int v31 = 0;
            v32 = (char *)&v69 - v29;
            int v33 = *(_DWORD *)(v27 + 32);
            char v34 = 1;
            v70 = (char *)&v69 - v29;
            while (1)
            {
              if (v31)
              {
                ++v34;
              }

              else if (!v75)
              {
                char *v32 = 23;
                v32[1] = v34 + 96;
                v32 += 2;
                uint64_t v26 = *v8;
                char v34 = 1;
              }

              if ((_DWORD)v26 == 28)
              {
                char v34 = 1;
                int v31 = 1;
              }

              else if ((_DWORD)v26 == 31)
              {
                int v31 = 0;
              }

              else if (v26 > 0x7F)
              {
                goto LABEL_36;
              }

              if ((_DefaultRuneLocale.__runetype[v26] & 0x200) == 0)
              {
LABEL_36:
                if (v33 && (v26 & 0xFFFFFF00) == 0x2800) {
                  uint64_t v26 = asciiBrl[v26 & 0x3F];
                }
                if (chuds(v26, 0, (char *)v85, v25))
                {
                  uint64_t v35 = 0LL;
                  do
                    v32[v35++] = v85[0];
                  while (chuds(v26, v35, (char *)v85, v25));
                  v32 += v35;
                }

                char *v32 = v85[0];
                goto LABEL_45;
              }

              char *v32 = v26;
LABEL_45:
              ++v32;
              unsigned int v36 = v8[1];
              ++v8;
              uint64_t v26 = v36;
              if (!v36)
              {
                uint64_t v9 = v72;
                unsigned __int16 v12 = v78;
                unsigned int v10 = v71;
                v30 = v70;
                goto LABEL_49;
              }
            }
          }

          v32 = (char *)&v69 - v29;
          uint64_t v9 = v72;
          unsigned __int16 v12 = v78;
          unsigned int v10 = v71;
        }

        else
        {
          __chkstk_darwin();
          v30 = v68;
          v32 = v68;
        }

LABEL_134:
              int v65 = *++v40;
              int v51 = v65;
            }

            while (v65 && (unint64_t)v12 < v52);
          }
        }

        else
        {
          unint64_t v53 = 0LL;
        }

        int *v12 = 0;
        v85[0] = (uint64_t)(v12 + 1);
        int v66 = (int)v78;
        compound_korean_glyphs(v85, (uint64_t)v78);
        if (v83[0]) {
          dxios_stream_deactivate((uint64_t)v83, 0LL);
        }
        v67 = v74;
        if ((v73 & 1) == 0)
        {
          *(void *)v74 = v80;
          *((void *)v67 + 1) = v81;
        }

        if (v9) {
          unsigned __int16 *v9 = (LODWORD(v85[0]) - v66) >> 2;
        }
        dxios_stream_destroy(v82);
        dxios_stream_destroy(v83);
      }
    }
  }

  return v7;
}

                      if (*v57)
                      {
LABEL_135:
                        uint64_t v60 = "im";
                        if (*a2)
                        {
                          uint64_t v61 = 0LL;
                          int v62 = *a2;
                          while (v61 != 2)
                          {
                            int v62 = a2[++v61];
                            if (!v62)
                            {
                              uint64_t v60 = &aIm[v61];
                              goto LABEL_141;
                            }
                          }

                          return 1LL;
                        }

uint64_t BRLTRN_CopyDynamicResults(uint64_t a1, void *__dst, void *a3, unsigned int a4)
{
  if (!a1) {
    return 14LL;
  }
  uint64_t v4 = a1 + 34920;
  if (*(void *)(a1 + 34920) + 1LL != a4) {
    return 14LL;
  }
  if (!*(void *)(a1 + 34928) || !*(void *)(a1 + 34936)) {
    return 16LL;
  }
  uint64_t v6 = a4;
  if (__dst) {
    memcpy(__dst, *(const void **)(a1 + 34928), 4LL * a4);
  }
  if (a3) {
    memcpy(a3, *(const void **)(v4 + 16), 2 * v6);
  }
  return 0LL;
}

uint64_t *compound_korean_glyphs(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  if (*result >= (unint64_t)(a2 + 12))
  {
    int v3 = *(_DWORD *)(v2 - 12);
    if ((v3 - 4371) >= 0xFFFFFFED)
    {
      int v4 = *(_DWORD *)(v2 - 8);
      if ((v4 - 4470) >= 0xFFFFFFEB)
      {
        int v5 = *(_DWORD *)(v2 - 4);
        int v6 = v4 - 4449;
        int v7 = 588 * v3;
        if ((v5 - 4547) >= 0xFFFFFFE5)
        {
          *(_DWORD *)(v2 - 12) = v7 + 28 * v6 + v5 - 2519463;
          v2 -= 8LL;
        }

        else
        {
          *(_DWORD *)(v2 - 12) = v7 + 28 * v6 - 2514944;
          *(_DWORD *)(v2 - 8) = v5;
          v2 -= 4LL;
        }
      }
    }
  }

  *uint64_t result = v2;
  return result;
}

uint64_t BRLTRN_InputPosFromOutputPos(uint64_t a1, unsigned int *a2, unsigned int a3, _WORD *a4)
{
  uint64_t result = 14LL;
  if (a1 && a2 && a4)
  {
    uint64_t v8 = (void *)(a1 + 34880);
    uint64_t v9 = *(void *)(a1 + 34880);
    *(void *)(a1 + 34880) = 0LL;
    uint64_t result = BRLTRN_TranslateStringEx(a1, 0LL, a2, 0LL, 0LL, 0, 0LL);
    void *v8 = v9;
    uint64_t v10 = v8[7];
    if (v10 && v8[5] >= (unint64_t)a3)
    {
      if (!(_DWORD)result) {
        *a4 = *(_WORD *)(v10 + 2LL * a3);
      }
    }

    else
    {
      return 8LL;
    }
  }

  return result;
}

uint64_t BRLTRN_OutputPosFromArray(uint64_t a1, int a2, unsigned int a3)
{
  if (a2)
  {
    uint64_t v3 = 0LL;
    unsigned __int16 v4 = 0;
    unsigned __int16 v5 = 0;
    do
    {
      unsigned int v6 = *(unsigned __int16 *)(a1 + 2 * v3);
      if (v6 <= a3 && v6 > v5) {
        unsigned __int16 v4 = v3;
      }
      if (v6 >= a3) {
        break;
      }
      if (v6 <= a3 && v6 > v5) {
        unsigned __int16 v5 = *(_WORD *)(a1 + 2 * v3);
      }
      ++v3;
    }

    while (a2 != v3);
  }

  else
  {
    return 0;
  }

  return v4;
}

uint64_t initialize_engine_helper(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)(a1 + 34928) = 0u;
  *(_OWORD *)(a1 + 34912) = 0u;
  uint64_t v3 = 2LL;
  if (!dxbte_engine_activate( (uint64_t *)(a1 + 184),  2,  3,  (uint64_t)gsty,  0LL,  0LL,  0LL,  0,  0,  a1 + 8,  a1 + 96,  1))
  {
    uint64_t v3 = 0LL;
    *(void *)(a1 + 34904) = 0LL;
  }

  return v3;
}

void gsty(uint64_t a1@<X1>, void *a2@<X3>, _OWORD *a3@<X8>)
{
  *a3 = 0u;
  a3[1] = 0u;
  if (a2) {
    *a2 = a1;
  }
}

void *bsetv(void *result, int a2)
{
  *result |= bmask_0[a2];
  return result;
}

BOOL btestv(void *a1, int a2)
{
  return (bmask_1[a2] & *a1) != 0LL;
}

BOOL chall(unsigned int a1)
{
  if (a1 > 0xFF) {
    return *(_DWORD *)(*(void *)(chilu + 8LL * BYTE1(a1)) + 4LL * a1) != 0;
  }
  else {
    return (dusci[12 * a1] >> 2) & 1;
  }
}

BOOL chalu(unsigned int a1)
{
  if (a1 <= 0xFF) {
    return (dusci[12 * a1] >> 3) & 1;
  }
  if (a1 >> 8 == 156) {
    return (dusci[12 * a1] >> 1) & 1;
  }
  return *(_DWORD *)(*(void *)(chiul + 8LL * BYTE1(a1)) + 4LL * a1) > 0x60u;
}

uint64_t dxchi_map_set_single(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = 0LL;
  if (a2 && a3)
  {
    unsigned __int8 v6 = a2;
    if (HIWORD(a2)) {
      return 0xFFFFFFFFLL;
    }
    uint64_t v7 = a2 >> 8;
    uint64_t v8 = *(_DWORD **)(a1 + 8LL * v7);
    if (v8 == (_DWORD *)chicp)
    {
      uint64_t v8 = calloc(0x100uLL, 4uLL);
      *(void *)(a1 + 8 * v7) = v8;
      if (!v8)
      {
        *(void *)(a1 + 8 * v7) = chicp;
        return 0xFFFFFFFFLL;
      }
    }

    uint64_t result = 0LL;
    if (!v8[v6]) {
      v8[v6] = a3;
    }
  }

  return result;
}

uint64_t dxchi_map_set_multiple(uint64_t a1, unsigned int a2, char *__s, int a4, int a5)
{
  uint64_t result = 0LL;
  if (a2 && __s)
  {
    unsigned __int8 v10 = a2;
    uint64_t v11 = a2 >> 8;
    unsigned __int16 v12 = *(void **)(a1 + 8LL * v11);
    if (v12 == (void *)chicp && (unsigned __int16 v12 = calloc(0x100uLL, 8uLL), (*(void *)(a1 + 8 * v11) = v12) == 0LL))
    {
      *(void *)(a1 + 8 * v11) = chicp;
    }

    else
    {
      if (v12[v10]) {
        return 0LL;
      }
      unint64_t v13 = __s;
      if (a5)
      {
        size_t v14 = strlen(__s);
        unint64_t v13 = (char *)malloc((v14 | 3) + 1);
        if (v13)
        {
          unint64_t v13 = strcpy(v13, __s);
          unsigned __int16 v12 = *(void **)(a1 + 8 * v11);
        }
      }

      v12[v10] = v13;
      if (*(void *)(*(void *)(a1 + 8 * v11) + 8LL * v10))
      {
        if (!a4) {
          return 0LL;
        }
        if (chiisc((uint64_t)__s))
        {
          uint64_t result = 0LL;
          unsigned __int16 v15 = *(_DWORD **)(*(void *)(a1 + 8 * v11) + 8LL * v10);
          *v15 += a4;
          return result;
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t dxchi_map_init(int a1, uint64_t a2, void *a3)
{
  if ((a1 & 0xFFFFFFFE) == 2) {
    uint64_t v3 = 1LL;
  }
  else {
    uint64_t v3 = 256LL;
  }
  if (!a3) {
    return 0xFFFFFFFFLL;
  }
  *a3 = chicp;
  unsigned __int16 v5 = malloc((8 * v3));
  if (!v5) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = chicp;
  do
    v5[v6++] = v7;
  while (v3 != v6);
  uint64_t v8 = 0LL;
  *a3 = v5;
  return v8;
}

BOOL chcmb(unsigned int a1)
{
  return *(_DWORD *)(*(void *)(chiul + 8LL * (a1 >> 8)) + 4LL * a1) == 1;
}

void *BRLTRN_UnicodeStringInit_Apple(void *result, char *__s)
{
  *uint64_t result = 0LL;
  if (__s)
  {
    uint64_t v3 = result;
    size_t v4 = strlen(__s);
    uint64_t result = malloc(4 * v4 + 4);
    void *v3 = result;
    LOBYTE(v5) = *__s;
    if (*__s)
    {
      uint64_t v6 = 0LL;
      do
      {
        *((_DWORD *)result + v6) = (char)v5;
        uint64_t v7 = v6 + 1;
        int v5 = __s[++v6];
      }

      while (v5);
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    *((_DWORD *)result + v7) = 0;
  }

  return result;
}

void *BRLTRN_UnicodeStringInitSize_Apple(void *result, uint64_t a2)
{
  *uint64_t result = 0LL;
  if (a2)
  {
    uint64_t v2 = result;
    uint64_t result = malloc(4 * a2);
    void *v2 = result;
    if (result) {
      *(_DWORD *)uint64_t result = 0;
    }
  }

  return result;
}

void BRLTRN_UnicodeStringFree_Apple(void **a1)
{
  uint64_t v2 = *a1;
  if (v2) {
    free(v2);
  }
  *a1 = 0LL;
}

_WORD *BRLTRN_OutputPosForInputPosFromArray(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6 = malloc(2LL * a3 + 2);
  uint64_t v7 = v6;
  unsigned int v8 = a2 - 1;
  if (a2 < 2)
  {
LABEL_5:
    if (a2)
    {
      int v11 = 0;
      int v12 = 0;
      do
      {
        __int16 v13 = v12;
        size_t v14 = (unsigned __int16 *)(a1 + 2 + 2LL * (unsigned __int16)v12);
        while (1)
        {
          unsigned int v16 = *v14++;
          uint64_t v15 = v16;
        }

        if (v15 > (unsigned __int16)v11)
        {
          uint64_t v17 = &v6[(unsigned __int16)v11];
          uint64_t v18 = v15 - (unsigned __int16)v11;
          do
          {
            *v17++ = v13;
            --v18;
          }

          while (v18);
          int v11 = v15;
        }

        ++v12;
      }

      while (a2 > (unsigned __int16)v12);
LABEL_18:
    }

    else
    {
      __int16 v13 = 0;
      int v11 = 0;
    }

    do
      v6[(unsigned __int16)v11++] = v13;
    while (a3 >= (unsigned __int16)v11);
    return v7;
  }

  unsigned int v9 = 0;
  uint64_t v10 = 2LL;
  while (*(unsigned __int16 *)(a1 + 2LL * v9) <= *(unsigned __int16 *)(a1 + v10))
  {
    ++v9;
    v10 += 2LL;
  }

  int v19 = 0;
  do
  {
    v7[(unsigned __int16)v19] = BRLTRN_OutputPosFromArray(a1, a2, (unsigned __int16)v19);
    ++v19;
  }

  while (a3 >= (unsigned __int16)v19);
  return v7;
}

uint64_t BRLTRN_TranslateStringAndGetLocationMap( _DWORD *a1, __int32 *a2, int *a3, unsigned int a4, void *a5)
{
  unsigned __int16 v22 = 0;
  uint64_t v5 = 14LL;
  if (!a1 || !a2 || !a3 || !a4) {
    return v5;
  }
  if (a5)
  {
    int v11 = malloc(2LL * a4);
    if (!v11) {
      return 23LL;
    }
  }

  else
  {
    int v11 = 0LL;
  }

  if (!*a1)
  {
    unsigned __int16 v12 = wcslen(a2);
    uint64_t v5 = BRLTRN_TranslateStringEx((uint64_t)a1, 0LL, (unsigned int *)a2, a3, (uint64_t)v11, a4, &v22);
    goto LABEL_21;
  }

  unsigned __int16 v12 = strlen((const char *)a2);
  BRLTRN_UnicodeStringInit_Apple(&v21, (char *)a2);
  __int16 v13 = (int *)malloc(4LL * a4);
  size_t v14 = v13;
  if (!v13)
  {
    uint64_t v5 = 23LL;
    uint64_t v15 = v21;
    if (!v21) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }

  *__int16 v13 = 0;
  uint64_t v15 = v21;
  if (!v21)
  {
    uint64_t v21 = 0LL;
    uint64_t v5 = 23LL;
    goto LABEL_20;
  }

  uint64_t v16 = BRLTRN_TranslateStringEx((uint64_t)a1, 0LL, (unsigned int *)v21, v13, (uint64_t)v11, a4, &v22);
  if ((_DWORD)v16)
  {
    uint64_t v5 = v16;
LABEL_16:
    free(v15);
    goto LABEL_17;
  }

  int v18 = *v14;
  if (*v14)
  {
    uint64_t v19 = 0LL;
    do
    {
      *((_BYTE *)a3 + v19) = v18;
      uint64_t v20 = v19 + 1;
      int v18 = v14[++v19];
    }

    while (v18);
  }

  else
  {
    uint64_t v20 = 0LL;
  }

  uint64_t v5 = 0LL;
  *((_BYTE *)a3 + v20) = 0;
  if (v15) {
    goto LABEL_16;
  }
LABEL_17:
  uint64_t v21 = 0LL;
  if (v14) {
LABEL_20:
  }
    free(v14);
LABEL_21:
  if (v11)
  {
    if (a5) {
      *a5 = BRLTRN_OutputPosForInputPosFromArray((uint64_t)v11, v22, v12);
    }
    free(v11);
  }

  return v5;
}

BOOL chdids(unsigned int a1, int a2, unsigned int *a3)
{
  unsigned int v3 = a1;
  if (!a2) {
    unsigned int v3 = a1 >> 8;
  }
  if (a1 >= 0x100)
  {
    BOOL result = a2 == 0;
  }

  else
  {
    unsigned int v3 = a1;
    BOOL result = 0LL;
  }

  *a3 = v3;
  return result;
}

BOOL chdimrm(unsigned int a1, int a2, char *a3)
{
  uint64_t v5 = *(char **)(*(void *)(chdimr + 8LL * (a1 >> 8)) + 8LL * a1);
  if (!v5)
  {
    uint64_t v5 = v8;
    __sprintf_chk(v8, 0, 0x21uLL, "{D+%04x}", a1);
  }

  uint64_t v6 = &v5[a2];
  *a3 = *v6;
  return v6[1] != 0;
}

uint64_t chdimrs(uint64_t result, _BYTE *a2)
{
  uint64_t v2 = result >> 8;
  LODWORD(v3) = *(_DWORD *)(*(void *)(chdimrs_t + 8LL * v2) + 4LL * result);
  if (!(_DWORD)v3)
  {
    unsigned int v3 = *(_BYTE **)(*(void *)(chdimr + 8 * v2) + 8LL * result);
    if (v3)
    {
      if (v3[1]) {
        LOBYTE(v3) = 35;
      }
      else {
        LOBYTE(v3) = *v3;
      }
    }

    else
    {
      LOBYTE(v3) = 42;
    }
  }

  *a2 = (_BYTE)v3;
  return result;
}

uint64_t chdiu(__int16 a1)
{
  else {
    return 42LL;
  }
}

uint64_t dxscb_engine_deactivate(uint64_t a1)
{
  if (*(_DWORD *)a1)
  {
    if (*(void *)(a1 + 16))
    {
      for (uint64_t i = 0LL; i != 258; ++i)
      {
        unsigned int v3 = *(void **)(*(void *)(a1 + 16) + 8 * i);
        if (v3)
        {
          do
          {
            size_t v4 = (void *)*v3;
            free(v3);
            unsigned int v3 = v4;
          }

          while (v4);
        }
      }

      free(*(void **)(a1 + 16));
      *(void *)(a1 + 16) = 0LL;
    }

    uint64_t v5 = 0LL;
    *(_DWORD *)a1 = 0;
  }

  else
  {
    uint64_t v5 = 300LL;
    dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"scrub", 300);
  }

  return v5;
}

uint64_t dxscb_engine_destroy(uint64_t a1)
{
  if (*(_DWORD *)a1) {
    return dxscb_engine_deactivate(a1);
  }
  return a1;
}

_BYTE *dxscb_engine_activate_tablename(uint64_t a1, char *a2)
{
  unsigned int v3 = dxios_search_open(a2, 0LL, 0LL, 0LL, 512);
  if (v3)
  {
    size_t v4 = v3;
    uint64_t v5 = dxscb_engine_activate(a1, (uint64_t)v3);
    dxios_close(v4);
    if (!(_DWORD)v5) {
      return v5;
    }
  }

  else
  {
    uint64_t v5 = (_BYTE *)(&stru_68 + 36);
  }

  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"scrub", (int)v5);
  return v5;
}

_BYTE *dxscb_engine_activate(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1)
  {
    unsigned int v3 = (_BYTE *)(&stru_108 + 46);
  }

  else
  {
    uint64_t v6 = calloc(0x102uLL, 8uLL);
    if (v6)
    {
      *(_DWORD *)a1 = 1;
      *(void *)(a1 + 16) = v6;
      *(void *)(a1 + 128) = dxios_stream_getc;
      *(void *)(a1 + 136) = dxios_stream_putc;
      unsigned int v3 = readtable(a1, a2, 0LL, 0LL);
      if (!(_DWORD)v3)
      {
        *(_DWORD *)(a1 + 32) = 1;
        return v3;
      }
    }

    else
    {
      unsigned int v3 = (_BYTE *)(&stru_108 + 6);
    }
  }

  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"scrub", (int)v3);
  dxscb_engine_deactivate(a1);
  return v3;
}

_BYTE *dxscb_engine_activate_additional_tablename(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = dxios_search_open(a2, 0LL, 0LL, 0LL, 512);
  if (v7)
  {
    unsigned int v8 = v7;
    unsigned int v9 = dxscb_engine_activate_additional(a1, (uint64_t)v7, a3, a4);
    dxios_close(v8);
    if (!(_DWORD)v9) {
      return v9;
    }
  }

  else
  {
    unsigned int v9 = (_BYTE *)(&stru_68 + 36);
  }

  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"scrub", (int)v9);
  return v9;
}

_BYTE *dxscb_engine_activate_additional(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)a1)
  {
    uint64_t v5 = readtable(a1, a2, a3, a4);
    if (!(_DWORD)v5) {
      return v5;
    }
  }

  else
  {
    uint64_t v5 = (_BYTE *)(&stru_108 + 36);
  }

  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"scrub", (int)v5);
  return v5;
}

_BYTE *readtable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a1 + 16);
  readline_fno = 1;
  readline_fch = 32;
  readline_fsg = 1;
  readline_fvl = 0;
  BOOL result = dxios_fgl(__s, 8209, a2);
  if (!result) {
    return result;
  }
  uint64_t v63 = v7;
  uint64_t v64 = a1;
  if (*(unsigned __int16 *)__s == 48111 && v73 == 191)
  {
    size_t v10 = strlen(v74);
    __memmove_chk(__s, v74, v10 + 1, 8209LL);
  }

  do
  {
    char v11 = __s[0];
    unsigned __int16 v12 = &dusci[1232];
    __int16 v13 = &dusci[1232];
    size_t v14 = &dusci[1232];
    uint64_t v15 = &dusci[1232];
    if (!__s[0] || __s[0] == 32 && !__s[1])
    {
LABEL_66:
      *((_DWORD *)v12 + 486) = 1;
      v13[1948] = 32;
      *((_DWORD *)v14 + 488) = 1;
      goto LABEL_67;
    }

    uint64_t v16 = 0LL;
    uint64_t v17 = 0LL;
    int v18 = 0;
    int v19 = readline_fno;
    char v20 = readline_fch;
    char v21 = 32;
    uint64_t v22 = 0xFFFFFFFFLL;
    int v23 = readline_fsg;
    uint64_t v24 = a4;
    uint64_t v25 = a3;
    int v26 = readline_fvl;
    uint64_t v27 = 0xFFFFFFFFLL;
    while (1)
    {
      uint64_t v28 = v18 + 1LL;
      if (v11 == 124) {
        break;
      }
      if (v11 == 126)
      {
        uint64_t v39 = v17;
        switch(v19)
        {
          case 1:
            goto LABEL_41;
          case 2:
            uint64_t v22 = (v17 - v27);
            goto LABEL_39;
          case 3:
            uint64_t v25 = (v23 * v26);
            goto LABEL_39;
          case 4:
            uint64_t v24 = (v23 * v26);
LABEL_39:
            uint64_t v39 = v27;
            goto LABEL_41;
          case 5:
            uint64_t v39 = v27;
            char v21 = v20;
LABEL_41:
            int v26 = 0;
            *((_DWORD *)v12 + 486) = ++v19;
            char v20 = 32;
            v13[1948] = 32;
            int v23 = 1;
            *((_DWORD *)v14 + 488) = 1;
            *((_DWORD *)v15 + 489) = 0;
            uint64_t v27 = v39;
            goto LABEL_42;
          default:
            return (_BYTE *)(&stru_B8 + 36);
        }
      }

      if (!v11) {
        goto LABEL_56;
      }
      if (v19 <= 2)
      {
        __s[(int)v17] = v11;
LABEL_34:
        uint64_t v17 = (v17 + 1);
        goto LABEL_42;
      }

      if (v19 > 4)
      {
        if (v11 != 32)
        {
          v13[1948] = v11;
          char v20 = v11;
        }
      }

      else if (v11 != 32)
      {
        if (v11 == 45)
        {
          int v23 = -v23;
          *((_DWORD *)v14 + 488) = v23;
        }

        else
        {
          if (v26 > 214748362) {
            return (_BYTE *)(&stru_B8 + 46);
          }
          int v26 = v11 + 10 * v26 - 48;
          *((_DWORD *)v15 + 489) = v26;
        }
      }

LABEL_42:
      char v11 = __s[(int)v28];
      int v18 = v28;
    }

    int v29 = __s[v28];
    if (!__s[v28]) {
      goto LABEL_56;
    }
    LODWORD(v28) = v18 + 2;
    if ((v29 - 48) <= 9)
    {
      uint64_t v30 = 0LL;
      readline_fld[0] = v29;
      do
      {
        int v31 = __s[(int)v28 + v30];
        readline_fld[v30 + 1] = v31;
        ++v30;
      }

      while (v30 != 2);
      uint64_t v32 = v22;
      uint64_t v33 = v16;
      unsigned int v34 = a3;
      uint64_t v35 = v25;
      unsigned int v36 = a4;
      uint64_t v37 = v24;
      unsigned int v68 = v34;
      int v66 = v26;
      unsigned int v67 = v36;
      int v65 = v28 + 2;
      byte_3C797 = 0;
      int v38 = atoi(readline_fld);
      if ((v38 & 0xFFFFFFFE) == 0x100)
      {
        unsigned __int16 v12 = dusci + 1232;
        __int16 v13 = dusci + 1232;
        size_t v14 = dusci + 1232;
        uint64_t v15 = dusci + 1232;
        if ((_DWORD)v17) {
          return (_BYTE *)(&stru_B8 + 76);
        }
        uint64_t v24 = v37;
        uint64_t v25 = v35;
        uint64_t v22 = v32;
        __s[0] = v38;
        uint64_t v16 = 1LL;
        uint64_t v17 = 1LL;
      }

      else
      {
        unsigned __int16 v12 = dusci + 1232;
        __int16 v13 = dusci + 1232;
        size_t v14 = dusci + 1232;
        uint64_t v15 = dusci + 1232;
        uint64_t v24 = v37;
        uint64_t v25 = v35;
        uint64_t v22 = v32;
        if (v38 != 258)
        {
          if (v38 > 257) {
            return (_BYTE *)(&stru_B8 + 26);
          }
          uint64_t v16 = v33;
          __s[(int)v17] = v38;
          uint64_t v17 = (v17 + 1);
          LODWORD(v28) = v65;
          a4 = v67;
          a3 = v68;
          goto LABEL_53;
        }

        __s[(int)v17] = 10;
        uint64_t v16 = v33;
        if (v19 != 1)
        {
          int v26 = v66;
          if (v19 == 2) {
            *(void *)(v64 + 136) = dxios_stream_pcmt;
          }
          uint64_t v17 = (v17 + 1);
          LODWORD(v28) = v65;
          a4 = v67;
          a3 = v68;
          goto LABEL_42;
        }

        *(void *)(v64 + 128) = dxios_stream_gcmt;
        uint64_t v17 = (v17 + 1);
      }

      LODWORD(v28) = v65;
      a4 = v67;
      a3 = v68;
LABEL_53:
      int v26 = v66;
      goto LABEL_42;
    }

    if (v29 != 32)
    {
      __s[(int)v17] = v29;
      goto LABEL_34;
    }

    if (!(_DWORD)v17) {
      goto LABEL_66;
    }
LABEL_56:
    BOOL result = (_BYTE *)(&stru_B8 + 66);
    if (v26 || v20 != 32) {
      return result;
    }
    if ((int)v27 <= 0)
    {
      if ((int)v22 >= 1)
      {
        __s[v22] = 0;
        uint64_t v53 = v25;
        uint64_t v54 = v24;
        int v55 = dxscb_engine_deferred_table_add(v64, __s, v25, v24);
        uint64_t v15 = dusci + 1232;
        unint64_t v52 = dusci + 1232;
        int v51 = dusci + 1232;
        if (!v55) {
          goto LABEL_92;
        }
        int v56 = dxscb_engine_activate_additional_tablename(v64, __s, v53, v54);
        uint64_t v15 = dusci + 1232;
        unint64_t v52 = dusci + 1232;
        int v51 = dusci + 1232;
        if (!v56) {
          goto LABEL_92;
        }
      }

      return (_BYTE *)(&stru_20 + 68);
    }

    if ((v22 & 0x80000000) != 0) {
      return (_BYTE *)(&stru_68 + 16);
    }
    char v40 = v16;
    int v41 = v25;
    uint64_t v42 = a4;
    int v43 = v24;
    size_t v44 = v22;
    int v45 = v22;
    size_t v46 = malloc(v22 + (unint64_t)v27 + 47);
    if (!v46) {
      return (_BYTE *)(&stru_108 + 6);
    }
    v47 = v46;
    v46[2] = v27;
    v46[3] = v45;
    v46[4] = v41;
    v46[5] = v43;
    *((_BYTE *)v46 + 24) = v40;
    *((_BYTE *)v46 + 25) = v21;
    *(_DWORD *)((char *)v46 + 26) = v70;
    *((_WORD *)v46 + 15) = v71;
    uint64_t v48 = (char *)(v46 + 12);
    unint64_t v49 = &v48[v27 - 1];
    *((void *)v47 + 4) = v48;
    *((void *)v47 + 5) = v49;
    memcpy(v48, &__s[1], (v27 - 1));
    memcpy(v49, &__s[v27], v44);
    unint64_t v50 = __s[0];
    if (__s[0] == 1)
    {
      unint64_t v50 = 257LL;
      if (!*((_BYTE *)v47 + 24)) {
        unint64_t v50 = 1LL;
      }
      int v51 = &dusci[1232];
      unint64_t v52 = &dusci[1232];
      uint64_t v15 = dusci + 1232;
      a4 = v42;
    }

    else
    {
      int v51 = dusci + 1232;
      unint64_t v52 = dusci + 1232;
      uint64_t v15 = dusci + 1232;
      a4 = v42;
      if (!__s[0]) {
        unint64_t v50 = (unint64_t)(*((_BYTE *)v47 + 24) != 0) << 8;
      }
    }

    BOOL v57 = (uint64_t **)(v63 + 8 * v50);
    BOOL v58 = *v57;
    if (!*v57)
    {
      BOOL v59 = 0LL;
      goto LABEL_91;
    }

    BOOL v59 = 0LL;
    while (2)
    {
      uint64_t v60 = v59;
      BOOL v59 = (uint64_t **)v58;
      int v61 = *((_DWORD *)v58 + 4);
      if (v61)
      {
        int v62 = v47[4];
        if ((v61 & 0x80000000) == 0 || v62) {
          goto LABEL_83;
        }
        goto LABEL_86;
      }

      int v62 = v47[4];
      if (v62 < 0) {
        break;
      }
LABEL_83:
      if (v61 > v62 || v61 == v62 && *((_DWORD *)v59 + 2) > v47[2])
      {
LABEL_86:
        BOOL v58 = *v59;
        if (!*v59)
        {
          uint64_t v60 = v59;
          BOOL v59 = 0LL;
          goto LABEL_90;
        }

        continue;
      }

      break;
    }

    if (!v60) {
      goto LABEL_91;
    }
LABEL_90:
    BOOL v57 = v60;
LABEL_91:
    *BOOL v57 = (uint64_t *)v47;
    *(void *)v47 = v59;
LABEL_92:
    *((_DWORD *)v51 + 486) = 1;
    readline_fch = 32;
    *((_DWORD *)v52 + 488) = 1;
LABEL_67:
    *((_DWORD *)v15 + 489) = 0;
    BOOL result = dxios_fgl(__s, 8209, a2);
  }

  while (result);
  return result;
}

      if (*v18)
      {
LABEL_43:
        char v21 = "ca";
        if (*a2)
        {
          uint64_t v22 = 0LL;
          int v23 = *a2;
          while (v22 != 2)
          {
            int v23 = a2[++v22];
            if (!v23)
            {
              char v21 = &aCa[v22];
              goto LABEL_49;
            }
          }

          return 1LL;
        }

  uint64_t v17 = *(_DWORD *)(a1 + 30840);
  if (!v17)
  {
    linecq(a1, v12);
    return;
  }

  switch(v12)
  {
    case 16:
      int v19 = 3;
LABEL_49:
      void *v4 = v19;
      return;
    case 28:
      int v18 = 1;
      goto LABEL_51;
    case 31:
      int v18 = 0;
LABEL_51:
      *(_BYTE *)(a1 + 32092) = v18;
      break;
  }

  if (v17 != 3)
  {
    if (v17 != 2)
    {
      if (v17 != 1) {
        return;
      }
      if (v12 >= 28)
      {
        if (v12 >= 0x20 && !*(_BYTE *)(a1 + 32092) && *(_DWORD *)(a1 + 32052) == 1)
        {
          sgose(a1);
          *(_DWORD *)(a1 + 32052) = 0;
        }

        linecq(a1, v12);
        if (v12 >= 0x20
          && (*(_DWORD *)&dusci[12 * v12] & 0x20) == 0
          && !*(_BYTE *)(a1 + 32092)
          && *(_DWORD *)(a1 + 32052) == 2)
        {
          sgose(a1);
          *(_DWORD *)(a1 + 32052) = 0;
        }

        return;
      }

      if (v12 != 23)
      {
        if (v12 == 17)
        {
          *(_DWORD *)(a1 + 30840) = 2;
          *(void *)(a1 + 32096) = 0xFFFFFFFF00000001LL;
          *(_DWORD *)(a1 + 32104) = -1;
          return;
        }

        goto LABEL_70;
      }

      goto LABEL_80;
    }

    if (v12 == 23)
    {
      linecq(a1, 23);
      void *v4 = 1;
      goto LABEL_70;
    }

    if (v12 < 28 || v12 == 32)
    {
      if (v12 <= 18)
      {
        if (v12 == 17)
        {
          scltb(a1, -1);
          *(_DWORD *)(a1 + 30840) = 2;
          *(void *)(a1 + 32096) = 0xFFFFFFFF00000001LL;
          *(_DWORD *)(a1 + 32104) = -1;
          return;
        }

        if (v12 == 18)
        {
          scswp(a1);
          return;
        }

        goto LABEL_70;
      }

      if (v12 == 19) {
        return;
      }
      if (v12 != 32)
      {
LABEL_70:
        int v23 = *(_DWORD *)(a1 + 34428);
        if (v23 <= 14)
        {
          *(_DWORD *)(a1 + 4LL * v23 + 34432) = v12;
          int v23 = *(_DWORD *)(a1 + 34428);
        }

        if (v23 != 0x7FFFFFFF) {
          *(_DWORD *)(a1 + 34428) = v23 + 1;
        }
        return;
      }

      if (*(int *)(a1 + 32096) < 2)
      {
        int v26 = *(int *)(a1 + 32148);
        if ((int)v26 <= 39)
        {
          *(_BYTE *)(a1 + v26 + 32108) = 32;
          uint64_t v27 = *(_DWORD *)(a1 + 32148);
          *(_DWORD *)(a1 + 32100) = v27;
          *(_DWORD *)(a1 + 32148) = v27 + 1;
          ++*(_DWORD *)(a1 + 32096);
          return;
        }
      }

      uint64_t v28 = a1;
      int v29 = 32;
    }

    else
    {
      uint64_t v24 = *(int *)(a1 + 32148);
      if ((int)v24 <= 39)
      {
        *(_BYTE *)(a1 + v24 + 32108) = v12;
        if (*v6 == 2)
        {
          uint64_t v25 = *(_DWORD *)(a1 + 32148);
          if (*(_DWORD *)(a1 + 32104) == -1) {
LABEL_104:
          }
            *(_DWORD *)(a1 + 32104) = v25;
        }

        else
        {
          if (v12 != 35)
          {
            uint64_t v25 = *(_DWORD *)(a1 + 32148);
            goto LABEL_109;
          }

          uint64_t v25 = *(_DWORD *)(a1 + 32148);
          if (*(_DWORD *)(a1 + 32096) == 1) {
            goto LABEL_104;
          }
        }

void dxscb_engine_create(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  *((void *)a1 + 1) = a2;
  *((void *)a1 + 2) = 0LL;
  *((void *)a1 + 3) = 0LL;
  *((void *)a1 + 4) = 0LL;
  a1[10] = 0;
}

uint64_t dxscb_engine_set_initial_state(_DWORD *a1, int a2)
{
  if (!*a1) {
    return 300LL;
  }
  uint64_t result = 0LL;
  a1[8] = a2;
  return result;
}

uint64_t dxscb_engine_deferred_table_add(uint64_t a1, char *__s, int a3, int a4)
{
  unsigned int v7 = a3 - 1;
  uint64_t v8 = a1 + 60LL * (a3 - 1);
  int v10 = *(unsigned __int8 *)(v8 + 144);
  uint64_t v9 = v8 + 144;
  if (v10 || strlen(__s) > 0x31) {
    return 1LL;
  }
  __strcpy_chk(v9, __s, 50LL);
  uint64_t result = 0LL;
  uint64_t v13 = a1 + 60LL * v7;
  *(_DWORD *)(v13 + 196) = a3;
  *(_DWORD *)(v13 + 200) = a4;
  return result;
}

_BYTE *dxscb_engine_deferred_table_load(uint64_t a1, int a2)
{
  uint64_t v2 = a1 + 60LL * (a2 - 1);
  int v4 = *(unsigned __int8 *)(v2 + 144);
  uint64_t v3 = v2 + 144;
  if (!v4) {
    return (_BYTE *)(&dword_0 + 1);
  }
  uint64_t result = dxscb_engine_activate_additional_tablename( a1,  (char *)v3,  *(unsigned int *)(a1 + 60LL * (a2 - 1) + 196),  *(unsigned int *)(a1 + 60LL * (a2 - 1) + 200));
  *(_OWORD *)uint64_t v3 = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 44) = 0u;
  return result;
}

BOOL chdiwam(unsigned int a1, int a2, char *a3)
{
  uint64_t v5 = *(char **)(*(void *)(chdiwa + 8LL * (a1 >> 8)) + 8LL * a1);
  if (!v5)
  {
    uint64_t v5 = v8;
    __sprintf_chk(v8, 0, 0xAuLL, "{D+%04x}", a1);
  }

  uint64_t v6 = &v5[a2];
  *a3 = *v6;
  return v6[1] != 0;
}

uint64_t chdiwas(uint64_t result, _BYTE *a2)
{
  uint64_t v2 = result >> 8;
  LODWORD(v3) = *(_DWORD *)(*(void *)(chdiwas_t + 8LL * v2) + 4LL * result);
  if (!(_DWORD)v3)
  {
    uint64_t v3 = *(_BYTE **)(*(void *)(chdiwa + 8 * v2) + 8LL * result);
    if (v3)
    {
      if (v3[1]) {
        LOBYTE(v3) = 35;
      }
      else {
        LOBYTE(v3) = *v3;
      }
    }

    else
    {
      LOBYTE(v3) = 42;
    }
  }

  *a2 = (_BYTE)v3;
  return result;
}

uint64_t chdsdi(int a1, int a2, int *a3)
{
  if (a1 == -1)
  {
    uint64_t v3 = 0LL;
    a1 = 65407;
  }

  else if ((dusci[12 * a1] & 0x20) != 0)
  {
    a1 = a1 << 8;
    uint64_t v3 = 1LL;
  }

  else
  {
    uint64_t v3 = 0LL;
    if (a2) {
      a1 |= *a3;
    }
  }

  *a3 = a1;
  return v3;
}

uint64_t chibdi(int a1, int a2, int *a3)
{
  if (a1 == -1)
  {
    uint64_t v3 = 0LL;
    a1 = 65407;
  }

  else if ((dusci[12 * a1] & 0x20) != 0)
  {
    a1 = a1 << 8;
    uint64_t v3 = 1LL;
  }

  else if (a2)
  {
    if (*a3 == 39936)
    {
      uint64_t v3 = 0LL;
      if (*(_DWORD *)&dusci[12 * a1 + 8] == 156) {
        a1 |= 0x9C00u;
      }
      else {
        a1 = *(_DWORD *)&dusci[12 * a1 + 8];
      }
    }

    else
    {
      uint64_t v3 = 0LL;
      a1 |= *a3;
    }
  }

  else
  {
    uint64_t v3 = 0LL;
  }

  *a3 = a1;
  return v3;
}

void *chiini_strdup(const char *a1)
{
  size_t v2 = strlen(a1) + 1;
  uint64_t v3 = malloc(v2);
  int v4 = v3;
  if (v3) {
    memcpy(v3, a1, v2);
  }
  return v4;
}

_BYTE *is_text(_BYTE *result)
{
  if (result)
  {
    int v1 = *result;
    if (*result)
    {
      size_t v2 = result + 1;
      while ((v1 - 127) > 0xFFFFFFA0)
      {
        int v3 = *v2++;
        int v1 = v3;
        if (!v3) {
          return (_BYTE *)(&dword_0 + 1);
        }
      }

      return 0LL;
    }

    else
    {
      return (_BYTE *)(&dword_0 + 1);
    }
  }

  return result;
}

BOOL chiini_succeeded()
{
  return chicp != 0;
}

uint64_t chiini(char *a1)
{
  int v1 = a1;
  if (!a1) {
    a1 = "chitab.txt";
  }
  size_t v2 = dxios_search_open(a1, 0LL, 0LL, 0LL, 512);
  int v3 = v2;
  if (v1 && !v2) {
    int v3 = dxios_search_open(v1, 0LL, 0LL, 0LL, 256);
  }
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v4 = chiini_stream((uint64_t)v3);
  dxios_close(v3);
  return v4;
}

uint64_t chiini_stream(uint64_t a1)
{
  if (chicp) {
    return 0LL;
  }
  chicp = (uint64_t)calloc(8uLL, 0x100uLL);
  dxchi_map_init(0, 0LL, &chilu);
  dxchi_map_init(0, 0LL, &chiul);
  dxchi_map_init(0, 4LL, &chdiwa);
  dxchi_map_init(0, 2LL, &chdiwas_t);
  dxchi_map_init(0, 5LL, &chdimr);
  dxchi_map_init(0, 3LL, &chdimrs_t);
  dxchi_map_init(0, 6LL, &chdiu_t);
  dxchi_map_init(6, 0LL, &chudi_t);
  if (chudi_t == chicp) {
    return 0xFFFFFFFFLL;
  }
  xmmword_3CF20 = 0u;
  unk_3CF30 = 0u;
  xmmword_3CF00 = 0u;
  unk_3CF10 = 0u;
  xmmword_3CEE0 = 0u;
  unk_3CEF0 = 0u;
  xmmword_3CEC0 = 0u;
  unk_3CED0 = 0u;
  xmmword_3CEA0 = 0u;
  unk_3CEB0 = 0u;
  xmmword_3CE80 = 0u;
  unk_3CE90 = 0u;
  xmmword_3CE60 = 0u;
  unk_3CE70 = 0u;
  xmmword_3CE40 = 0u;
  unk_3CE50 = 0u;
  xmmword_3CE20 = 0u;
  unk_3CE30 = 0u;
  xmmword_3CE00 = 0u;
  unk_3CE10 = 0u;
  xmmword_3CDE0 = 0u;
  unk_3CDF0 = 0u;
  xmmword_3CDC0 = 0u;
  unk_3CDD0 = 0u;
  xmmword_3CDA0 = 0u;
  unk_3CDB0 = 0u;
  xmmword_3CD80 = 0u;
  unk_3CD90 = 0u;
  xmmword_3CD60 = 0u;
  unk_3CD70 = 0u;
  waduint64_t i = 0u;
  *(_OWORD *)algn_3CD50 = 0u;
  xmmword_3D120 = 0u;
  unk_3D130 = 0u;
  xmmword_3D100 = 0u;
  unk_3D110 = 0u;
  xmmword_3D0E0 = 0u;
  unk_3D0F0 = 0u;
  xmmword_3D0C0 = 0u;
  unk_3D0D0 = 0u;
  xmmword_3D0A0 = 0u;
  unk_3D0B0 = 0u;
  xmmword_3D080 = 0u;
  unk_3D090 = 0u;
  xmmword_3D060 = 0u;
  unk_3D070 = 0u;
  xmmword_3D040 = 0u;
  unk_3D050 = 0u;
  xmmword_3D020 = 0u;
  unk_3D030 = 0u;
  xmmword_3D000 = 0u;
  unk_3D010 = 0u;
  xmmword_3CFE0 = 0u;
  unk_3CFF0 = 0u;
  xmmword_3CFC0 = 0u;
  unk_3CFD0 = 0u;
  xmmword_3CFA0 = 0u;
  unk_3CFB0 = 0u;
  xmmword_3CF80 = 0u;
  unk_3CF90 = 0u;
  xmmword_3CF60 = 0u;
  unk_3CF70 = 0u;
  mrduint64_t i = 0u;
  *(_OWORD *)algn_3CF50 = 0u;
  dxerr_report_create((uint64_t)v45);
  dxtbl_lintbl_create((uint64_t)v40, (uint64_t)v45);
  if (!a1 || dxtbl_lintbl_activate((uint64_t)v40, a1, "-chitab 2"))
  {
LABEL_6:
    uint64_t v1 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }

  if (!dxios_stream_eof(a1))
  {
    while (1)
    {
      dxtbl_lintbl_read((uint64_t)v40, &v46, 0xC8uLL);
      char v12 = v46;
      if (v46 != 124 && v46 != 0)
      {
        int v14 = 0;
        memset(v41, 0, sizeof(v41));
        memset(v42, 0, sizeof(v42));
        __int128 v43 = 0u;
        v44[0] = 0;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        uint64_t v15 = &v46;
        uint64_t v16 = v47;
        uint64_t v17 = &v46;
        __int128 v48 = 0u;
        while (1)
        {
          int v18 = v16 - 1;
          if (v12 == 124) {
            break;
          }
          if (v12 == 126)
          {
            if (v14 == 10) {
              goto LABEL_6;
            }
            if (v18 > v17) {
              *((void *)&v48 + v14) = v17;
            }
            char *v18 = 0;
            ++v14;
            uint64_t v17 = v16;
          }

LABEL_51:
          ++v15;
          int v19 = *v16++;
          char v12 = v19;
          if (!v19)
          {
            uint64_t v15 = v16 - 1;
            goto LABEL_54;
          }
        }

        uint64_t v15 = v16 - 1;
LABEL_54:
        if (v15 > v17 && v14 <= 9) {
          *((void *)&v48 + v14) = v17;
        }
        if (get_next_val((char *)v48, v41, 0x50u, 0)
          || get_next_val(*((char **)&v48 + 1), v42, 4u, 0)
          || get_next_val((char *)v49, (char *)v42 + 4, 0x50u, 0)
          || get_next_val(*((char **)&v49 + 1), (char *)&v42[5] + 4, 4u, 1u)
          || get_next_val((char *)v50, (char *)&v42[5] + 8, 0x50u, 0)
          || get_next_val(*((char **)&v50 + 1), (char *)&v43 + 8, 4u, 1u)
          || get_next_val((char *)v51, (char *)&v43 + 12, 4u, 0)
          || get_next_val(*((char **)&v51 + 1), v44, 4u, 0))
        {
          goto LABEL_6;
        }

        int v20 = v44[0] <= 1 ? 1 : v44[0];
        if (v20 >= 1) {
          break;
        }
      }

      ++v4;
    }

    while (!dxios_stream_eof(a2));
  }

  return 0LL;
}

LABEL_40:
      if (dxios_stream_eof(a1)) {
        goto LABEL_11;
      }
    }

    int v21 = 0;
    while (!chiisc((uint64_t)v41))
    {
LABEL_103:
      if (++v21 == v20) {
        goto LABEL_40;
      }
    }

    unsigned int v22 = LODWORD(v41[0]) + v21;
    if (LODWORD(v42[0]))
    {
      BOOL v23 = v22 < 0x61 || LODWORD(v42[0]) > 0x60;
      int v24 = v23 ? v21 : 0;
      unsigned int v25 = v24 + LODWORD(v42[0]);
      dxchi_map_set_single(chiul, LODWORD(v41[0]) + v21, v24 + LODWORD(v42[0]));
      if (v25 >= 0x61) {
        dxchi_map_set_single(chilu, v25, v22);
      }
    }

    if (BYTE4(v42[0])) {
      dxchi_map_set_multiple(chdiwa, v22, (char *)v42 + 4, v21, 1);
    }
    if (DWORD1(v42[5]))
    {
      uint64_t v26 = chdiwas_t;
      int v27 = DWORD1(v42[5]) + v21;
      unsigned int v28 = v22;
    }

    else
    {
      if (BYTE4(v42[0]))
      {
LABEL_86:
        if (BYTE8(v42[5]))
        {
          uint64_t v29 = chdimr;
          unsigned int v30 = v22;
          int v31 = (char *)&v42[5] + 8;
          int v32 = v21;
          int v33 = 1;
        }

        else
        {
          int v34 = BYTE4(v42[0]);
          uint64_t v35 = (unsigned __int8 *)v42 + 5;
          if (BYTE4(v42[0]))
          {
            while ((v34 - 127) >= 0xFFFFFFA1)
            {
              int v36 = *v35++;
              int v34 = v36;
              if (!v36) {
                goto LABEL_91;
              }
            }

          __int16 v71 = 0;
          if (v11 <= 75)
          {
            if (v11 != 37)
            {
              if (v11 != 69 && v11 != 71) {
                goto LABEL_174;
              }
LABEL_49:
              int v19 = v67;
              if ((v10 & 0x80) == 0) {
                int v19 = 6;
              }
              unsigned int v67 = v19;
              while (v15)
              {
                --v15;
                dxios_stream_putc(0x30u, a1);
              }

              goto LABEL_173;
            }

            if ((v10 & 0x50) == 0x40)
            {
              while (v15)
              {
                --v15;
                dxios_stream_putc(0x20u, a1);
              }

              uint64_t v15 = -1LL;
            }

            dxios_stream_putc(0x25u, a1);
            if ((v10 & 0x40) != 0)
            {
              while (v15)
              {
                --v15;
                dxios_stream_putc(0x20u, a1);
              }

              goto LABEL_173;
            }

  size_t v86 = 0u;
  v87 = 0u;
  unint64_t v84 = 0u;
  v85 = 0u;
  __int128 v49 = [(id)objc_opt_class(self) allCodeNodes];
  int v18 = (void *)objc_claimAutoreleasedReturnValue(v49);
  __int128 v50 = [v18 countByEnumeratingWithState:&v84 objects:v100 count:16];
  if (!v50) {
    goto LABEL_68;
  }
  __int128 v51 = v50;
  __int128 v52 = *(void *)v85;
  while (2)
  {
    uint64_t v53 = 0LL;
    while (2)
    {
      if (*(void *)v85 != v52) {
        objc_enumerationMutation(v18);
      }
      uint64_t v54 = *(objc_class **)(*((void *)&v84 + 1) + 8 * v53);
      int v55 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class beginCode](v54, "beginCode"));
      int v56 = [v55 isEqualToString:v17];

      if (v56)
      {
        BOOL v59 = (void *)objc_claimAutoreleasedReturnValue(+[DBTDuxburyFormatENode innerCodes](&OBJC_CLASS___DBTDuxburyFormatENode, "innerCodes"));
        uint64_t v60 = [v59 containsObject:v17];

        if ((v60 & 1) == 0) {
          -[DBTDuxburyFormatParser closeENodeIfNeeded](self, "closeENodeIfNeeded");
        }
        int v61 = objc_alloc_init(v54);
        int v62 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parserStack, "lastObject"));
        [v62 addChild:v61];

        uint64_t v63 = [(id)objc_opt_class(v61) endCode];
        uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
        uint64_t v6 = v80;
        int v7 = v81;
        __darwin_ct_rune_t v11 = v82;
        if (v64)
        {
        }

        else
        {
          int v65 = objc_opt_class(&OBJC_CLASS___DBTDuxburyFormatENode);
          if ((objc_opt_isKindOfClass(v61, v65) & 1) == 0)
          {
LABEL_56:

            goto LABEL_31;
          }
        }

        -[NSMutableArray addObject:](self->_parserStack, "addObject:", v61);
        goto LABEL_56;
      }

      BOOL v57 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class endCode](v54, "endCode"));
      BOOL v58 = [v57 isEqualToString:v17];

      if ((v58 & 1) != 0) {
        goto LABEL_30;
      }
      if (v51 != (id)++v53) {
        continue;
      }
      break;
    }

    __int128 v51 = [v18 countByEnumeratingWithState:&v84 objects:v100 count:16];
    if (v51) {
      continue;
    }
    break;
  }

LABEL_93:
            if (DWORD2(v43))
            {
              uint64_t v37 = chdimrs_t;
              int v38 = DWORD2(v43) + v21;
            }

            else
            {
              if (DWORD1(v42[5]) < 0x21) {
                goto LABEL_101;
              }
              uint64_t v37 = chdimrs_t;
              if (DWORD1(v42[5]) == 35) {
                int v39 = 0;
              }
              else {
                int v39 = v21;
              }
              int v38 = v39 + DWORD1(v42[5]);
            }

            dxchi_map_set_single(v37, v22, v38);
LABEL_101:
            if (HIDWORD(v43))
            {
              dxchi_map_set_single(chdiu_t, v22, HIDWORD(v43) + v21);
              dxchi_map_set_single(chudi_t, HIDWORD(v43) + v21, v22);
            }

            goto LABEL_103;
          }

LABEL_91:
          uint64_t v29 = chdimr;
          int v31 = *(char **)(*(void *)(chdiwa + 8LL * (v22 >> 8)) + 8LL * v22);
          unsigned int v30 = v22;
          int v32 = 0;
          int v33 = 0;
        }

        dxchi_map_set_multiple(v29, v30, v31, v32, v33);
        goto LABEL_93;
      }

      uint64_t v26 = chdiwas_t;
      unsigned int v28 = v22;
      int v27 = 35;
    }

    dxchi_map_set_single(v26, v28, v27);
    goto LABEL_86;
  }

              if (!*v39) {
                return 1LL;
              }
LABEL_92:
              uint64_t v42 = "fr";
              if (*a2)
              {
                __int128 v43 = 0LL;
                size_t v44 = *a2;
                while (v43 != 2)
                {
                  size_t v44 = a2[++v43];
                  if (!v44)
                  {
                    uint64_t v42 = &aFr[v43];
                    goto LABEL_98;
                  }
                }

                return 1LL;
              }

LABEL_29:
      dxchi_map_set_multiple(chdiwa, v4 + j, v10, 0, 0);
      if (!*(void *)(*(void *)(chdimr + 8 * i) + 8 * j)) {
        dxchi_map_set_multiple(chdimr, v4 + j, v10, 0, 0);
      }
LABEL_14:
      if (!*(void *)(*(void *)(chdiwa + 8 * i) + 8 * j)
        && !*(_DWORD *)(*(void *)(chdiwas_t + 8 * i) + 4 * j)
        && *(_DWORD *)(*(void *)(chilu + 8 * i) + 4 * j))
      {
        dxchi_map_set_single(chdiwas_t, v4 + j, 35);
      }

      int v7 = v4 + j;
      chdiwas(v4 + j, &v48);
      chdimrs(v4 + j, &v48);
    }

    v4 += 256LL;
  }

  uint64_t v1 = 0LL;
LABEL_7:
  dxtbl_lintbl_deactivate((uint64_t)v40);
  dxtbl_lintbl_destroy((uint64_t)v40);
  return v1;
}

          int v21 = (uint64_t *)*v21;
          if (!v21)
          {
            v7[v19] = (*(uint64_t (**)(uint64_t))(a1 + 128))(a3);
            goto LABEL_45;
          }
        }

        BOOL v23 = 0LL;
        int v24 = *((_DWORD *)v21 + 2);
        if (v24 <= 1) {
          unsigned int v25 = 1;
        }
        else {
          unsigned int v25 = *((_DWORD *)v21 + 2);
        }
        uint64_t v26 = v25 - 1;
        while (v26 != (_DWORD)v23)
        {
          int v27 = v7[((_WORD)v19 + (_WORD)v23 + 1) & 0xFFF];
          unsigned int v28 = *(unsigned __int8 *)(v21[4] + v23++);
          if (v27 != v28) {
            goto LABEL_29;
          }
        }

        if (*((int *)v21 + 3) >= 1)
        {
          uint64_t v29 = 0LL;
          unsigned int v30 = *(void (**)(void, uint64_t))(a1 + 136);
          do
            v30(*(char *)(v21[5] + v29++), a2);
          while (v29 < *((int *)v21 + 3));
        }

        if (v24 >= 1)
        {
          do
          {
            v7[v19] = (*(uint64_t (**)(uint64_t))(a1 + 128))(a3);
            int v19 = (v19 + 1) & 0xFFF;
            --v24;
          }

          while (v24);
        }

        int v31 = *((unsigned __int8 *)v21 + 25);
        if (v31 == 41)
        {
          int v34 = *(_DWORD *)(a1 + 40);
          uint64_t v35 = __OFSUB__(v34, 1);
          int v36 = v34 - 1;
          if (v36 < 0 == v35)
          {
            *(_DWORD *)(a1 + 36) = *(_DWORD *)(a1 + 4LL * v36 + 44);
            *(_DWORD *)(a1 + 40) = v36;
          }
        }

        else if (v31 == 40)
        {
          int v32 = *(int *)(a1 + 40);
          if ((int)v32 <= 19)
          {
            int v33 = *(_DWORD *)(a1 + 36);
            *(_DWORD *)(a1 + 40) = v32 + 1;
            *(_DWORD *)(a1 + 4 * v32 + 44) = v33;
          }
        }

        uint64_t v37 = *((_DWORD *)v21 + 5);
        if (v37)
        {
          if (v37 != *(_DWORD *)(a1 + 36))
          {
            *(_DWORD *)(a1 + 36) = v37;
            if (v37 <= 0xA) {
              dxscb_engine_deferred_table_load(a1, v37);
            }
          }
        }

        ++*(void *)(a1 + 24);
      }

      else
      {
        *int v20 = (*(uint64_t (**)(uint64_t))(a1 + 128))(a3);
LABEL_45:
        int v19 = (v19 + 1) & 0xFFF;
      }

      int v20 = &v7[v19];
      int v18 = *v20;
    }

    while ((*v20 & 0x80000000) == 0);
  }

  int v38 = *(uint64_t **)(*(void *)(a1 + 16) + 2056LL);
  if (v38)
  {
    while (1)
    {
      if (*((_BYTE *)v38 + 24) == 1)
      {
        int v39 = *((_DWORD *)v38 + 4);
        if (!v39 || v39 == *(_DWORD *)(a1 + 36)) {
          break;
        }
      }

      int v38 = (uint64_t *)*v38;
      if (!v38) {
        goto LABEL_64;
      }
    }

    if (*((int *)v38 + 3) >= 1)
    {
      int v41 = 0LL;
      uint64_t v42 = *(void (**)(void, uint64_t))(a1 + 136);
      do
        v42(*(char *)(v38[5] + v41++), a2);
      while (v41 < *((int *)v38 + 3));
    }
  }

uint64_t chiini_fp(uint64_t a1)
{
  uint64_t v2 = chiini_stream((uint64_t)v4);
  dxios_stream_destroy(v4);
  return v2;
}

uint64_t get_next_val(char *a1, void *a2, unsigned int a3, unsigned int a4)
{
  if (!a1) {
    return 0LL;
  }
  char v8 = *a1;
  if (!*a1) {
    return 0LL;
  }
  int64_t v9 = a3 - 1;
  int64_t v10 = a3 - 4;
  __darwin_ct_rune_t v11 = (char *)a2;
  while (v8 <= 122)
  {
    switch(v8)
    {
      case '""':
        a4 ^= 1u;
        goto LABEL_42;
      case '[':
LABEL_16:
        if (a4 <= 1) {
          a4 = 1;
        }
        if (v11 - (_BYTE *)a2 >= v9) {
          goto LABEL_42;
        }
        goto LABEL_19;
      case ']':
        goto LABEL_14;
    }

BOOL chiisc(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 1)) {
    return 1LL;
  }
  if (*(_BYTE *)(a1 + 2)) {
    return 0LL;
  }
  return chdids(*(_DWORD *)a1, 0, &v2);
}

uint64_t chlwc(uint64_t result)
{
  if (result <= 0xFF)
  {
    uint64_t v1 = &dusci[12 * result];
    return *((unsigned int *)v1 + 1);
  }

  if (result >> 8 == 156)
  {
    uint64_t v1 = &dusci[12 * result];
    return *((unsigned int *)v1 + 1);
  }

  unsigned int v2 = *(_DWORD *)(*(void *)(chiul + 8LL * (result >> 8)) + 4LL * result);
  if (v2 <= 0x61) {
    return result;
  }
  else {
    return v2;
  }
}

uint64_t chudi(int a1)
{
  if (a1 >= 0x10000) {
    return 62762LL;
  }
  unsigned __int8 v2 = a1;
  uint64_t v3 = *(void *)(chudi_t + 8LL * (a1 >> 8));
  uint64_t result = 62762LL;
  if (v3)
  {
    unsigned int v4 = *(_DWORD *)(v3 + 4LL * v2);
    if (v4) {
      return v4;
    }
    else {
      return 62762LL;
    }
  }

  return result;
}

uint64_t chuds(uint64_t result, int a2, char *a3, uint64_t a4)
{
  if (!(_DWORD)result)
  {
    *a3 = 0;
    return result;
  }

  if (((int)result / 256) <= 0xFF && a4 != 0)
  {
    uint64_t v7 = *(void *)(a4 + 8LL * ((int)result / 256));
    if (v7)
    {
      uint64_t v8 = *(void *)(v7 + 8LL * result);
      if (v8)
      {
        size_t v9 = strlen(*(const char **)(v7 + 8LL * result));
        if (v9 > a2)
        {
          *a3 = *(_BYTE *)(v8 + a2);
          return v9 - 1 > a2;
        }

void *dxchi_unimap_create()
{
  return calloc(1uLL, 0x800uLL);
}

void dxchi_unimap_destroy(void *a1)
{
  if (a1)
  {
    for (uint64_t i = 0LL; i != 256; ++i)
    {
      if (a1[i])
      {
        for (uint64_t j = 0LL; j != 2048; j += 8LL)
        {
          unsigned int v4 = *(void **)(a1[i] + j);
          if (v4) {
            free(v4);
          }
        }

        free((void *)a1[i]);
      }
    }

    free(a1);
  }

uint64_t dxchi_unimap_read(uint64_t a1, uint64_t a2)
{
  if (a1 && !dxios_stream_eof(a2))
  {
    int v4 = 1;
    do
    {
      if (!dxios_fgl(&v24, 512, a2)) {
        goto LABEL_51;
      }
      int v5 = v24;
      if (v4 == 1 && v24 == 239 && v25 == 187 && v26 == 191)
      {
        size_t v6 = strlen((const char *)&v27);
        __memmove_chk(&v24, &v27, v6 + 1, 512LL);
        int v5 = v24;
      }

      if (v5 != 85 || v25 != 43) {
        goto LABEL_51;
      }
      if (v26 - 48 >= 0xA)
      {
        if (v26 - 97 >= 6)
        {
          __int16 v7 = -55;
        }

        else
        {
          __int16 v7 = -87;
        }
      }

      else
      {
        __int16 v7 = -48;
      }

      if (v27 - 48 >= 0xA)
      {
        if (v27 - 97 >= 6)
        {
          __int16 v8 = -55;
        }

        else
        {
          __int16 v8 = -87;
        }
      }

      else
      {
        __int16 v8 = -48;
      }

      if (v28 - 48 >= 0xA)
      {
        if (v28 - 97 >= 6)
        {
          __int16 v9 = -55;
        }

        else
        {
          __int16 v9 = -87;
        }
      }

      else
      {
        __int16 v9 = -48;
      }

      if (v29 - 48 < 0xA)
      {
        __int16 v10 = -48;
        goto LABEL_36;
      }

      if (v29 - 97 < 6)
      {
        __int16 v10 = -87;
        goto LABEL_36;
      }

      if (v29 - 65 <= 5)
      {
        __int16 v10 = -55;
LABEL_36:
        if (v30 == 58)
        {
          __int16 v11 = v29 + 16 * (((v7 + v26) << 8) + 16 * (v8 + v27) + v28 + v9) + v10;
          unsigned int v12 = &v30;
          do
            int v13 = *++v12;
          while (v13 == 32);
          unsigned int v14 = strstr(v12, "| ");
          if (!v14)
          {
            unsigned int v14 = &v12[strlen(v12)];
            goto LABEL_42;
          }

          do
          {
            *unsigned int v14 = 0;
LABEL_42:
            if (v14 <= v12) {
              break;
            }
            int v15 = *--v14;
          }

          while (v15 == 32);
          uint64_t v16 = HIBYTE(v11);
          uint64_t v17 = *(void **)(a1 + 8LL * HIBYTE(v11));
          if (v17 || (uint64_t v17 = calloc(0x100uLL, 8uLL), (*(void *)(a1 + 8LL * HIBYTE(v11)) = v17) != 0LL))
          {
            uint64_t v18 = v11;
            int v19 = (void *)v17[v11];
            if (v19)
            {
              free(v19);
              *(void *)(*(void *)(a1 + 8LL * HIBYTE(v11)) + 8LL * v11) = 0LL;
            }

            uint64_t mapping = unimap_read_mapping((unsigned __int8 *)v12, 0LL);
            if (mapping)
            {
              uint64_t v21 = mapping;
              *(void *)(*(void *)(a1 + 8 * v16) + 8 * v18) = malloc(mapping + 1);
              uint64_t v22 = *(void *)(*(void *)(a1 + 8 * v16) + 8 * v18);
              if (v22)
              {
                unimap_read_mapping((unsigned __int8 *)v12, v22);
                *(_BYTE *)(*(void *)(*(void *)(a1 + 8 * v16) + 8 * v18) + v21) = 0;
              }
            }
          }
        }
      }

uint64_t unimap_read_mapping(unsigned __int8 *a1, uint64_t a2)
{
  if (a1)
  {
    int v3 = *a1;
    if ((v3 - 32) <= 0x5E)
    {
      uint64_t v5 = 0LL;
      uint64_t v6 = 0LL;
      while (1)
      {
        uint64_t v7 = v6 + 1;
        if (v3 != 123 || a1[v7] != 85 || a1[v6 + 2] != 43) {
          break;
        }
        int v8 = a1[v6 + 3];
        if ((v8 - 48) >= 0xA)
        {
          if ((v8 - 97) >= 6)
          {
            int v9 = -55;
          }

          else
          {
            int v9 = -87;
          }
        }

        else
        {
          int v9 = -48;
        }

        int v10 = a1[v6 + 4];
        if ((v10 - 48) >= 0xA)
        {
          if ((v10 - 97) >= 6)
          {
            int v11 = -55;
          }

          else
          {
            int v11 = -87;
          }
        }

        else
        {
          int v11 = -48;
        }

        int v12 = a1[v6 + 5];
        if ((v12 - 48) >= 0xA)
        {
          if ((v12 - 97) >= 6)
          {
            int v13 = -55;
          }

          else
          {
            int v13 = -87;
          }
        }

        else
        {
          int v13 = -48;
        }

        int v14 = a1[v6 + 6];
        if ((v14 - 48) >= 0xA)
        {
          if ((v14 - 97) >= 6)
          {
            int v15 = -55;
          }

          else
          {
            int v15 = -87;
          }
        }

        else
        {
          int v15 = -48;
        }

        if (a1[v6 + 7] != 125) {
          break;
        }
        unsigned int v16 = chudi(v14 + 16 * (((v9 + v8) << 8) + 16 * (v11 + v10) + v12 + v13) + v15);
        uint64_t v17 = 0LL;
        do
        {
          BOOL v18 = chdids(v16, v17, &v20);
          if (a2) {
            *(_BYTE *)(a2 + v5 + v17) = v20;
          }
          ++v17;
        }

        while (v18);
        uint64_t v7 = v6 + 8;
        v5 += v17;
LABEL_44:
        int v3 = a1[v7];
        uint64_t v6 = v7;
      }

      if (a2)
      {
        if (v3 == 91) {
          int v3 = 28;
        }
        if (v3 == 93) {
          LOBYTE(v3) = 31;
        }
        *(_BYTE *)(a2 + v5) = v3;
      }

      ++v5;
      goto LABEL_44;
    }
  }

  return 0LL;
}

uint64_t chupc(unsigned int a1)
{
  if (a1 > 0xFF)
  {
    LODWORD(v1) = *(_DWORD *)(*(void *)(chilu + 8LL * (a1 >> 8)) + 4LL * a1);
    if ((_DWORD)v1) {
      return v1;
    }
    else {
      return a1;
    }
  }

  else
  {
    uint64_t v1 = *(unsigned int *)&dusci[12 * a1 + 8];
    if ((_DWORD)v1 == 156) {
      return *(_DWORD *)&dusci[12 * a1 + 4] | 0x9C00u;
    }
  }

  return v1;
}

uint64_t chwadi(uint64_t result)
{
  if ((_DWORD)result == -1) {
    return 65407LL;
  }
  if ((result & 0x80000000) != 0) {
    return 62762LL;
  }
  return *((unsigned int *)&wadi + (result - 128));
}

void dxcfif ()
{
}

void dxcfin()
{
  if (dxcmel <= 29) {
    exit(0);
  }
  exit(4);
}

unsigned __int8 *dxxins()
{
  v0 = getenv("DUXSPEC");
  if (v0)
  {
    for (uint64_t i = 0LL; i != 766; ++i)
    {
      int v2 = v0[i];
      if (v2 == 59)
      {
        LOBYTE(v2) = 0;
      }

      else if (!v0[i])
      {
        break;
      }

      *((_BYTE *)&dxcprl + i) = v2;
    }

    *(__int16 *)((char *)&dxcprl + i) = 0;
  }

  remove_trailing_spaces((const char *)&dxcprl);
  uint64_t result = (unsigned __int8 *)getenv("DUXTEMP");
  if (result)
  {
    strcpx(dxcptl, result, 65LL);
    if (dxcptl[0] == 59) {
      dxcptl[0] = 0;
    }
    return (unsigned __int8 *)remove_trailing_spaces(dxcptl);
  }

  return result;
}

uint64_t remove_trailing_spaces(const char *a1)
{
  uint64_t result = strlen(a1);
  if (result >= 1)
  {
    int v3 = &a1[result];
    do
    {
      __darwin_ct_rune_t v5 = *--v3;
      __darwin_ct_rune_t v4 = v5;
      if (v5 < 0)
      {
        uint64_t result = __maskrune(v4, 0x4000uLL);
        if (!(_DWORD)result) {
          return result;
        }
      }

      else
      {
        uint64_t result = _DefaultRuneLocale.__runetype[v4] & 0x4000;
        if (!(_DWORD)result) {
          return result;
        }
      }

      const char *v3 = 0;
    }

    while (v3 > a1);
  }

  return result;
}

uint64_t dxcini(const char *a1, unsigned __int8 *a2, int a3, int a4, int a5, uint64_t a6)
{
  dxcdmo = 0;
  dxcmel = 0;
  dxcrif = 0LL;
  dxcrtb = 0LL;
  __strcpy_chk(&dxcmpn, a1, 7LL);
  ermini();
  dxcumf = 1;
  dxcnps = 0;
  dxcnpm = 0;
  int v10 = fopes("dxprls.dxr", "r", 0LL);
  if (!v10) {
    goto LABEL_59;
  }
  int v11 = v10;
  int v12 = 0LL;
  int v13 = 2;
  while (1)
  {
    do
    {
      if (!fgl(__s, 255, v11))
      {
        fclose(v11);
        goto LABEL_59;
      }

      int v14 = __s[0];
    }

    while (__s[0] == 59);
    uint64_t v42 = a1;
    size_t v15 = strlen(__s);
    if (v15)
    {
      do
      {
        if (__s[v15 - 1] != 32) {
          break;
        }
        __s[--v15] = 0;
      }

      while (v15);
      int v14 = __s[0];
    }

    if (v15 >= 4 && v14 == 46 && __s[1] == 46 && __s[2] == 46)
    {
      int v16 = atoi(&__s[3]);
      int v13 = v16;
      if (v16 != 102)
      {
        a1 = v42;
        if (v16 == 101)
        {
          if (__s[6] == 58) {
            int v21 = atoi(&__s[7]);
          }
          else {
            int v21 = 16;
          }
          dxcnpm = v21;
          dxcnpl = (uint64_t)malloc(17LL * v21);
          if (!dxcnpl) {
            erm("dxcini", -7, 200, 0LL);
          }
          int v13 = 101;
        }

        else if (v16 == 100)
        {
          int v12 = (char *)&dxcprl;
          LOBYTE(dxcprl) = 0;
        }

        goto LABEL_56;
      }

      int v12 = dxcptl;
      dxcptl[0] = 0;
      goto LABEL_53;
    }

    if (v13 <= 98)
    {
      switch(v13)
      {
        case 2:
          if (*(void *)__s == 0x2063786420726F66LL && v47 == 49)
          {
            int v13 = 2;
          }

          else
          {
            erm("dxcini", -5, 50, __s);
            int v13 = 2147483646;
          }

          break;
        case 3:
          dxcepl = atoi(__s);
          int v13 = 3;
          break;
        case 4:
          LOBYTE(dxcyep) = __tolower((char)v14);
          dxcyep = dxcyep;
          int v13 = 4;
          break;
        case 5:
          LOBYTE(dxcnop) = __tolower((char)v14);
          dxcnop = dxcnop;
          int v13 = 5;
          break;
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
          uint64_t v17 = dxcp06;
          if (dxcp06)
          {
            BOOL v18 = malloc(v15 + 1);
            uint64_t v19 = (v13 - 6);
            *(void *)(v17 + 8LL * v19) = v18;
            if (v18) {
              strcpy(*(char **)(dxcp06 + 8 * v19), __s);
            }
          }

          break;
        default:
          break;
      }

      a1 = v42;
      ++v13;
      goto LABEL_56;
    }

    if (v13 == 102)
    {
      strcpx(v12, (unsigned __int8 *)__s, 65LL);
      goto LABEL_53;
    }

    if (v13 == 101)
    {
      if ((char)v14 == 46)
      {
        getprm(__s, 0);
        int v13 = 101;
      }

      else
      {
        unsigned __int8 v22 = dxcmpn;
        __darwin_ct_rune_t v23 = __tolower(dxcmpn);
        unsigned __int8 v24 = __s[0];
        if (v23 == __tolower(__s[0]))
        {
          unsigned __int8 v25 = __s;
          int v12 = &dxcmpn;
          do
          {
            __darwin_ct_rune_t v27 = *++v12;
            unsigned __int8 v26 = v27;
            __darwin_ct_rune_t v28 = __tolower(v27);
            __darwin_ct_rune_t v30 = *++v25;
            unsigned __int8 v29 = v30;
          }

          while (v28 == __tolower(v30));
          int v31 = v26;
          int v32 = v29;
        }

        else
        {
          int v31 = v22;
          int v32 = v24;
          unsigned __int8 v25 = __s;
          int v12 = &dxcmpn;
        }

        int v13 = 101;
        if (!v31 && v32 == 46) {
          getprm(v25, 0x80u);
        }
      }

      goto LABEL_53;
    }

    if (v13 == 100) {
      break;
    }
LABEL_53:
    a1 = v42;
LABEL_56:
    if (v13 == 0x7FFFFFFF) {
      goto LABEL_59;
    }
  }

  if (v12 - (char *)&dxcprl + v15 < 0x2FF)
  {
    strcpy(v12, __s);
    unsigned int v20 = &v12[v15];
    v20[1] = 0;
    int v12 = v20 + 1;
    int v13 = 100;
    goto LABEL_53;
  }

  fclose(v11);
  erm("dxcini", -4, 50, __s);
  a1 = v42;
LABEL_59:
  dxcmac = a5;
  dxcmau = 1;
  dxcmav = a6;
  stdcin = (uint64_t)__stdinp;
  int v34 = v45;
  uint64_t result = (uint64_t)strcpx(v45, a2, 17LL);
  while (*v34)
  {
    if (*v34 == 47)
    {
      *int v34 = 0;
      break;
    }

    ++v34;
  }

  if (a5 <= 1)
  {
    dxcdmo = 2;
    goto LABEL_91;
  }

  unsigned int v36 = **(unsigned __int8 **)(dxcmav + 8);
  if (v36 <= 0x3E)
  {
    if (v36 != 33)
    {
      if (v36 == 58)
      {
        uint64_t result = (uint64_t)preder();
        dxcdmo = 1;
        int v37 = 2;
LABEL_88:
        dxcmau = v37;
        goto LABEL_91;
      }

LABEL_87:
      int v37 = 1;
      dxcdmo = 1;
      goto LABEL_88;
    }

LABEL_79:
    fprintf(__stderrp, "%s %s - dxc %s - ", a1, (const char *)a2, "1;27");
    if (a3 >= 1984) {
      int v39 = 1984;
    }
    else {
      int v39 = a3;
    }
    if (a4 <= 1995) {
      int v40 = 1995;
    }
    else {
      int v40 = a4;
    }
    fprintf(__stderrp, "Copyright %d-%d Duxbury Systems, Inc.\n", v39, v40);
    if (dxcprs) {
      fprintf(__stderrp, "%s\n", (const char *)dxcprs);
    }
    else {
      fwrite("All rights reserved.\n", 0x15uLL, 1uLL, __stderrp);
    }
    erm(&dxcmpn, 1, 10, "");
    dxcfin();
  }

  if (v36 == 63) {
    goto LABEL_79;
  }
  if (v36 != 64) {
    goto LABEL_87;
  }
  preder();
  dxcdmo = 3;
  if (a4 <= 1995) {
    int v38 = 1995;
  }
  else {
    int v38 = a4;
  }
  fprintf(__stderrp, "%s %s  Copyright %d Duxbury\n", a1, v45, v38);
  uint64_t result = (uint64_t)fopes(*(char **)(dxcmav + 16), "r", 0LL);
  dxcrif = result;
  if (!result) {
    uint64_t result = erm("dxcini", -3, 200, *(const char **)(dxcmav + 16));
  }
LABEL_91:
  if ((dxcinf & 1) == 0 && dxcdmo != 3)
  {
    if (a4 <= 1995) {
      int v41 = 1995;
    }
    else {
      int v41 = a4;
    }
    uint64_t result = fprintf(__stderrp, "%s %s  Copyright %d Duxbury\n", a1, v45, v41);
    if (dxcdmo == 2) {
      return erm("dxcini", -6, 10, "");
    }
  }

  return result;
}

const char *getprm(const char *result, unsigned int a2)
{
  int v2 = result;
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = v4;
    uint64_t v6 = &result[v4];
    int v7 = *((unsigned __int8 *)v6 + 1);
    if (!v6[1] || v7 == 58) {
      break;
    }
    uint64_t v4 = v5 + 1;
    v24[v5] = v7;
    if (v5 == 6)
    {
      int v8 = (unsigned __int8 *)&v24[v4];
      goto LABEL_9;
    }
  }

  int v8 = (unsigned __int8 *)&v24[v5];
LABEL_9:
  unsigned __int8 *v8 = 0;
  uint64_t v9 = (uint64_t)&result[v5 + 2];
  while (1)
  {
    int v10 = *(unsigned __int8 *)(v9 - 1);
    if (!*(_BYTE *)(v9 - 1)) {
      break;
    }
    ++v9;
    if (v10 == 58)
    {
      while (1)
      {
        int v11 = *(unsigned __int8 *)(v9 - 1);
        if (v11 != 9 && v11 != 32) {
          break;
        }
        ++v9;
      }

      if (*(_BYTE *)(v9 - 1))
      {
        uint64_t v13 = 0LL;
        while (1)
        {
          v22[v13] = v11;
          if (v13 == 6) {
            break;
          }
          int v11 = *(unsigned __int8 *)(v9 + v13++);
          if (!v11)
          {
            int v12 = &v22[v13];
            goto LABEL_23;
          }
        }

        int v12 = (unsigned __int8 *)&v23;
      }

      else
      {
        int v12 = v22;
      }

LABEL_23:
      unsigned __int8 *v12 = 0;
      break;
    }
  }

  int v14 = dxcnps;
  int v15 = dxcnpm;
  if (dxcnps >= dxcnpm) {
    int v16 = dxcnpm;
  }
  else {
    int v16 = dxcnps;
  }
  if (v16 < 1)
  {
    uint64_t v18 = 0LL;
LABEL_36:
    if (v14 >= v15)
    {
      if (v14 == v15) {
        uint64_t result = (const char *)erm("dxcini", -8, 30, v2);
      }
    }

    else
    {
      uint64_t v20 = 17 * v18;
      strcpx((_BYTE *)(dxcnpl + v20), (unsigned __int8 *)v24, 8LL);
      uint64_t result = strcpx((_BYTE *)(dxcnpl + v20 + 8), v22, 8LL);
      *(_BYTE *)(dxcnpl + v20 + 16) = a2;
    }

    ++dxcnps;
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    while (1)
    {
      uint64_t result = (const char *)strcic(v24, (char *)(dxcnpl + v17));
      if (!(_DWORD)result) {
        break;
      }
      ++v18;
      int v14 = dxcnps;
      int v15 = dxcnpm;
      if (dxcnps >= dxcnpm) {
        int v19 = dxcnpm;
      }
      else {
        int v19 = dxcnps;
      }
      v17 += 17LL;
      if (v18 >= v19) {
        goto LABEL_36;
      }
    }

    unsigned int v21 = *(unsigned __int8 *)(dxcnpl + v17 + 16);
    if (v21 >= a2)
    {
      if (v21 == a2) {
        return (const char *)erm("dxcini", -9, 30, v2);
      }
    }

    else
    {
      return strcpx((_BYTE *)(dxcnpl + v17 + 8), v22, 8LL);
    }
  }

  return result;
}

FILE *preder()
{
  uint64_t result = (FILE *)strlen(*(const char **)(dxcmav + 8));
  return result;
}

uint64_t erm(const char *a1, int a2, int a3, const char *a4)
{
  if (dxcmel < a3) {
    dxcmel = a3;
  }
  if (a3 < 1)
  {
    uint64_t v8 = 45LL;
  }

  else if (a3 >= 0xB)
  {
    if (a3 >= 0x1F)
    {
      uint64_t v8 = 35LL;
      if (a3 >= 0x64)
      {
        else {
          uint64_t v8 = 35LL;
        }
      }
    }

    else
    {
      uint64_t v8 = 63LL;
    }
  }

  else
  {
    uint64_t v8 = 42LL;
  }

  fprintf(__stderrp, "%c ", v8);
  erm_line1 = 1;
  erm_llen = 1LL;
  if (a3 >= 1 && dxcepl >= 1)
  {
    if (a2 < 0) {
      int v10 = "dxc";
    }
    else {
      int v10 = &dxcmpn;
    }
    fputs(v10, __stderrp);
    erm_llen += 8LL;
    if (dxcepl >= 2)
    {
      fprintf(__stderrp, "/%s", a1);
      erm_llen += 7LL;
    }

    fwrite(": ", 2uLL, 1uLL, __stderrp);
  }

  erm_disp_no = 1;
  if (a2 < -20000 || (dxcumf & 1) == 0)
  {
LABEL_33:
    fprintf(__stderrp, "%s message #%d\n", a1, a2);
    erm_llen = 0LL;
    goto LABEL_34;
  }

  ermgmg(a1, a2);
  if (ermloc < -1)
  {
    if (erm_disp_no != 1) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }

  for (; ermnxl(0LL, 81); erm_line1 = 0)
  {
    if ((erm_line1 & 1) == 0)
    {
      fputc(10, __stderrp);
      erm_llen = 0LL;
    }

    fputs(ermlin, __stderrp);
    erm_llen += strlen(ermlin);
  }

  erm_disp_no = 0;
LABEL_34:
  if (a4)
  {
    if (strlen(a4) + erm_llen >= 0x4E) {
      int v11 = 10;
    }
    else {
      int v11 = 32;
    }
    fputc(v11, __stderrp);
    fputs(a4, __stderrp);
  }

  if (a3)
  {
    uint64_t result = fputc(10, __stderrp);
  }

  else
  {
    fwrite("?:", 2uLL, 1uLL, __stderrp);
    return fputc(10, __stderrp);
  }

  return result;
}

uint64_t ermgmg(const char *a1, int a2)
{
  uint64_t v3 = ercusd;
  if (ercusd >= 1)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = ercmps;
    do
    {
      uint64_t result = strcmp(ermgmg_cmp_lin, v5);
      if (!(_DWORD)result) {
        goto LABEL_41;
      }
      ++v4;
      v5 += 15;
    }

    while (v3 != v4);
  }

  ermgmg_pass1 = 1;
  if (a2 < 0)
  {
    if (ermfop == 1) {
      goto LABEL_18;
    }
    if (ermfop == 2)
    {
      fclose((FILE *)msgfil);
      ermfop = 0;
      ercmle = 0;
    }

    uint64_t result = (uint64_t)fopes("dxc.erm", "r", 0LL);
    msgfil = result;
    if (result)
    {
      int v7 = 1;
      goto LABEL_16;
    }
  }

  else
  {
    ermgmg_pgmfiln = 0;
    __strcat_chk(&ermgmg_pgmfiln, &dxcmpn, 255LL);
    __strcat_chk(&ermgmg_pgmfiln, ".erm", 255LL);
    if (ermfop == 2) {
      goto LABEL_18;
    }
    if (ermfop == 1)
    {
      fclose((FILE *)msgfil);
      ermfop = 0;
      ercmle = 0;
    }

    uint64_t result = (uint64_t)fopes(&ermgmg_pgmfiln, "r", 0LL);
    msgfil = result;
    if (result)
    {
      int v7 = 2;
LABEL_16:
      ermfop = v7;
      goto LABEL_18;
    }
  }

  if (ermfop <= 0)
  {
LABEL_38:
    LODWORD(v4) = -2;
    goto LABEL_41;
  }

LABEL_18:
  while ((ercmle & 1) == 0)
  {
    if (fgl(ermlin, 81, (FILE *)msgfil))
    {
      if (ercmle != 1) {
        goto LABEL_22;
      }
      break;
    }

    if (ermgmg_pass1 != 1)
    {
      uint64_t result = fclose((FILE *)msgfil);
LABEL_37:
      ermfop = 0;
      goto LABEL_38;
    }

    ermgmg_pass1 = 0;
    uint64_t result = fclose((FILE *)msgfil);
    if (ermfop == 2)
    {
      uint64_t v8 = &ermgmg_pgmfiln;
    }

    else
    {
      if (ermfop != 1) {
        goto LABEL_37;
      }
      uint64_t v8 = "dxc.erm";
    }

    uint64_t result = (uint64_t)fopes(v8, "r", 0LL);
    msgfil = result;
    if (!result) {
      goto LABEL_37;
    }
LABEL_23:
    if (ermfop <= 0) {
      goto LABEL_38;
    }
  }

  __strcpy_chk(ermlin, &ercmlr, 81LL);
  ercmle = 0;
LABEL_22:
  uint64_t result = strcmp(ermlin, ermgmg_cmp_lin);
  if ((_DWORD)result) {
    goto LABEL_23;
  }
  int v9 = ercusd;
  if (ercusd > 2)
  {
    if (ercnxu >= 2)
    {
      int v9 = 0;
      ercnxu = 0;
    }

    else
    {
      int v9 = ++ercnxu;
    }
  }

  else
  {
    ercnxu = ercusd++;
  }

  uint64_t result = (uint64_t)strcpy(&ercmps[16 * v9 - v9], ermgmg_cmp_lin);
  *(_WORD *)&ercmps[16 * ercnxu - ercnxu] = 90;
  ermltm = 0;
  LODWORD(v4) = -1;
LABEL_41:
  ermloc = v4;
  return result;
}

uint64_t ermnxl(char *a1, int a2)
{
  uint64_t v3 = a1;
  if (ermloc < 0)
  {
    if (ermloc != -1) {
      return 0LL;
    }
    do
    {
      if (!fgl(ermlin, 81, (FILE *)msgfil))
      {
        fclose((FILE *)msgfil);
        uint64_t result = 0LL;
        ermfop = 0;
        ercmle = 0;
        goto LABEL_14;
      }
    }

    while (ermlin[0] == 59);
    if (ermlin[0] == 62)
    {
      ercmle = 1;
      strcpx(ercmlr, (unsigned __int8 *)ermlin, 15LL);
      uint64_t result = 0LL;
LABEL_14:
      ermloc = -2;
      return result;
    }

    if (ermltm++) {
      *(_WORD *)&ercmps[16 * ercnxu - ercnxu] = 88;
    }
    else {
      strcpy(&ercache[81 * ercnxu], ermlin);
    }
    if (v3) {
      strcpx(v3, (unsigned __int8 *)ermlin, a2);
    }
  }

  else
  {
    if (a1)
    {
      uint64_t v4 = a2;
    }

    else
    {
      a1 = ermlin;
      uint64_t v4 = 81LL;
    }

    strcpx(a1, (unsigned __int8 *)&ercache[81 * ermloc], v4);
    ermloc = -2;
  }

  return 1LL;
}

uint64_t ermclo()
{
  if (ermfop) {
    uint64_t result = fclose((FILE *)msgfil);
  }
  ermfop = 0;
  ercmle = 0;
  return result;
}

void ermini()
{
  ercnxu = 0;
  ercusd = 0;
  ercmle = 0;
  ermfop = 0;
  ermloc = -2;
  ermltm = 0;
}

uint64_t dxerr_report_get_errno(_DWORD *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1) {
    return a1[4];
  }
  return 4294967293LL;
}

double dxerr_report_create(uint64_t a1)
{
  if (a1)
  {
    double result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(void *)(a1 + 64) = 0LL;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 13) = 0LL;
  }

  return result;
}

uint64_t dxerr_report_activate(uint64_t a1, uint64_t a2, int a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)a1) {
    return 4294967294LL;
  }
  uint64_t result = 0LL;
  *(_DWORD *)a1 = 1;
  *(void *)(a1 + 8) = a2;
  *(_DWORD *)(a1 + 16) = a3;
  return result;
}

_BYTE *fgl(_BYTE *a1, int a2, FILE *a3)
{
  int v6 = a2;
  int v7 = a1;
  while (1)
  {
    int v8 = getc(a3);
    int v9 = v8;
    if (v8 == -1) {
      break;
    }
    if (v6 < 2)
    {
      --v6;
      break;
    }

    if (v8 != 13)
    {
      if (v8 == 10) {
        goto LABEL_11;
      }
      --v6;
      *v7++ = v8;
    }
  }

  if (a2 >= 1 && v6 <= 0) {
    ungetc(v8, a3);
  }
LABEL_11:
  BOOL v10 = v7 == a1 && v9 == -1;
  _BYTE *v7 = 0;
  if (v10) {
    return 0LL;
  }
  else {
    return a1;
  }
}

_BYTE *dxios_fgl(_BYTE *a1, int a2, uint64_t a3)
{
  uint64_t v6 = dxios_stream_gcmt(a3);
  BOOL v7 = (_DWORD)v6 == -1;
  int v8 = a1;
  if ((_DWORD)v6 == -1)
  {
    int v10 = a2;
  }

  else
  {
    int v9 = a2;
    while (v9 >= 2 && (_DWORD)v6 != 10)
    {
      *v8++ = v6;
      uint64_t v6 = dxios_stream_gcmt(a3);
      --v9;
      if ((_DWORD)v6 == -1)
      {
        BOOL v7 = 1;
        goto LABEL_12;
      }
    }

    int v10 = v9 - 1;
  }

  if (a2 >= 1 && v10 <= 0) {
    dxios_stream_ungetc(v6, a3);
  }
LABEL_12:
  _BYTE *v8 = 0;
  if (v7 && v8 == a1) {
    return 0LL;
  }
  else {
    return a1;
  }
}

FILE *fopes(char *a1, char *a2, char *a3)
{
  if (a3) {
    strcpy(a3, a1);
  }
  if (!strcmp(a2, "w") || !strcmp(a2, "wb")) {
    BOOL v7 = &__stdoutp;
  }
  else {
    BOOL v7 = &__stdinp;
  }
  return *v7;
}

FILE *fopes_w(__int32 *a1, const __int32 *a2, _DWORD *a3)
{
  return dxios_search_fopen_w(a1, a3, 255LL, a2, 288);
}

FILE *fopes_skip_unprefixed(char *a1, char *__mode, _BYTE *a3)
{
  return dxios_search_fopen(a1, a3, 255LL, __mode, 512);
}

FILE *fopes_skip_unprefixed_w(__int32 *a1, const __int32 *a2, _DWORD *a3)
{
  return dxios_search_fopen_w(a1, a3, 255LL, a2, 512);
}

double dxios_stream_create(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(void *)(a1 + 80) = 0LL;
  double result = NAN;
  *(void *)a1 = 0xFFFFFFFF00000000LL;
  *(_DWORD *)(a1 + 8) = -1;
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 32) = 0LL;
  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  return result;
}

_DWORD *dxios_stream_destroy(_DWORD *result)
{
  if (*result) {
    return (_DWORD *)dxios_stream_deactivate((uint64_t)result, 0LL);
  }
  return result;
}

uint64_t dxios_stream_deactivate(uint64_t a1, void *a2)
{
  if (*(_DWORD *)a1)
  {
    uint64_t v4 = *(uint64_t (**)(void, void))(a1 + 40);
    if (v4)
    {
      uint64_t v5 = v4(*(void *)(a1 + 32), *(void *)(a1 + 16));
      *(void *)(a1 + 32) = 0LL;
      if (!a2) {
        goto LABEL_5;
      }
    }

    else
    {
      uint64_t v5 = 0LL;
      if (!a2)
      {
LABEL_5:
        *(_DWORD *)a1 = 0;
        if (!(_DWORD)v5) {
          return v5;
        }
        goto LABEL_8;
      }
    }

    *a2 = *(void *)(a1 + 24);
    goto LABEL_5;
  }

  uint64_t v5 = 4294967293LL;
LABEL_8:
  dxerr_report_activate(*(void *)(a1 + 16), (uint64_t)dxios_pg_name, v5);
  return v5;
}

uint64_t dxios_stream_activate( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(_DWORD *)a1)
  {
    uint64_t v9 = 0xFFFFFFFFLL;
    dxerr_report_activate(*(void *)(a1 + 16), (uint64_t)dxios_pg_name, -1);
    dxios_stream_deactivate(a1, 0LL);
  }

  else
  {
    uint64_t v9 = 0LL;
    *(void *)a1 = 0xFFFFFFFF00000001LL;
    *(_DWORD *)(a1 + 8) = -1;
    *(void *)(a1 + 24) = 0LL;
    *(void *)(a1 + 32) = a2;
    *(void *)(a1 + 40) = a3;
    *(void *)(a1 + 48) = a4;
    *(void *)(a1 + 56) = a5;
    *(void *)(a1 + 64) = a6;
    *(void *)(a1 + 72) = a7;
    *(void *)(a1 + 80) = a8;
  }

  return v9;
}

unint64_t dxios_stream_read(_BYTE *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3 * a2;
  int v6 = *(_DWORD *)(a4 + 4);
  if (v5) {
    BOOL v7 = v6 == -1;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    int v8 = *(_DWORD *)(a4 + 8);
    if (v5) {
      BOOL v9 = v8 == -1;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      unint64_t v10 = 0LL;
      goto LABEL_13;
    }

    *a1 = v8;
    *(_DWORD *)(a4 + 8) = -1;
  }

  else
  {
    *a1 = v6;
    *(_DWORD *)(a4 + 4) = -1;
  }

  --v5;
  unint64_t v10 = 1LL;
LABEL_13:
  int v11 = *(void (**)(_BYTE *, void))(a4 + 56);
  if (v5) {
    BOOL v12 = v11 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  if (!v12) {
    v11(a1, *(void *)(a4 + 16));
  }
  return v10 / a2;
}

unint64_t dxios_stream_write(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  int v8 = 0LL;
  unint64_t v6 = a4[8];
  if (v6)
  {
    ((void (*)(uint64_t, void, unint64_t, void, void *))v6)(a1, a4[2], a3 * a2, &v8, a4);
    unint64_t v6 = (unint64_t)v8;
  }

  a4[3] += v6;
  return v6 / a2;
}

uint64_t dxios_stream_ungetc(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)(a2 + 4) = result;
  return result;
}

uint64_t dxios_stream_rewind(uint64_t a1, uint64_t a2)
{
  if (!*(_DWORD *)a1)
  {
    uint64_t v5 = 4294967293LL;
LABEL_8:
    dxerr_report_activate(*(void *)(a1 + 16), (uint64_t)dxios_pg_name, v5);
    return v5;
  }

  uint64_t v3 = *(uint64_t (**)(void, void, uint64_t))(a1 + 48);
  if (v3)
  {
    uint64_t v4 = v3(*(void *)(a1 + 32), *(void *)(a1 + 16), a2);
  }

  else
  {
    unint64_t v6 = *(uint64_t (**)(void, void, void))(a1 + 72);
    if (!v6) {
      return 0LL;
    }
    uint64_t v4 = v6(*(void *)(a1 + 32), *(void *)(a1 + 16), 0LL);
  }

  uint64_t v5 = v4;
  if ((_DWORD)v4) {
    goto LABEL_8;
  }
  return v5;
}

unint64_t dxios_stream_gpbw(_BYTE *a1, unint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v5 = (unsigned int (*)(void, void, uint64_t *))a4[10];
  if (!v5) {
    return 0LL;
  }
  if (v5(a4[4], a4[2], &v15)) {
    return 0LL;
  }
  uint64_t v13 = (unsigned int (*)(void, void, uint64_t))a4[9];
  if (!v13 || !a4[7] || v13(a4[4], a4[2], a5)) {
    return 0LL;
  }
  unint64_t v11 = dxios_stream_read(a1, a2, a3, (uint64_t)a4);
  int v14 = (void (*)(void, void, uint64_t))a4[9];
  if (v14 && a4[7]) {
    v14(a4[4], a4[2], v15);
  }
  return v11;
}

uint64_t dxios_stream_tell(void *a1, uint64_t a2)
{
  int v2 = (uint64_t (*)(void, void, uint64_t))a1[10];
  if (v2) {
    return v2(a1[4], a1[2], a2);
  }
  else {
    return 4294967288LL;
  }
}

uint64_t dxios_stream_seek_set(void *a1, uint64_t a2)
{
  int v2 = (uint64_t (*)(void, void, uint64_t))a1[9];
  if (!v2) {
    return 4294967288LL;
  }
  if (a1[7]) {
    return v2(a1[4], a1[2], a2);
  }
  return 4294967285LL;
}

BOOL dxios_stream_eof(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 4) != -1 || *(_DWORD *)(a1 + 8) != -1) {
    return 0LL;
  }
  unint64_t v3 = dxios_stream_read(&v4, 1uLL, 1LL, a1);
  if (v3 == 1) {
    *(_DWORD *)(a1 + 4) = v4;
  }
  return v3 != 1;
}

uint64_t dxios_stream_gcmt(uint64_t a1)
{
  if (dxios_stream_read(&v9, 1uLL, 1LL, a1) == 1) {
    uint64_t v2 = v9;
  }
  else {
    uint64_t v2 = 0xFFFFFFFFLL;
  }
  if ((_DWORD)v2 == 13 || (_DWORD)v2 == 10)
  {
    unint64_t v4 = dxios_stream_read(&v10, 1uLL, 1LL, a1);
    int v5 = v10;
    if (v4 != 1) {
      int v5 = -1;
    }
    if (v5 != 13 && v5 != 10 || v5 == (_DWORD)v2) {
      *(_DWORD *)(a1 + 8) = v5;
    }
    return 10LL;
  }

  return v2;
}

uint64_t dxios_stream_getc(uint64_t a1)
{
  if (dxios_stream_read(&v2, 1uLL, 1LL, a1) == 1) {
    return v2;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t dxios_stream_pcmt(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  return v2;
}

uint64_t dxios_stream_putc(unsigned int a1, void *a2)
{
  uint64_t v8 = 0LL;
  uint64_t v2 = (void (*)(char *, void, uint64_t, uint64_t *, void *))a2[8];
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  char v7 = a1;
  v2(&v7, a2[2], 1LL, &v8, a2);
  uint64_t v5 = v8;
  a2[3] += v8;
  if (v5 == 1) {
    return a1;
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t dxios_stream_puts(_BYTE *a1, void *a2)
{
  while (1)
  {
    unsigned int v4 = (char)*a1;
    if (!*a1) {
      break;
    }
    ++a1;
  }

  return 0LL;
}

uint64_t dxios_stream_printf( void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  unsigned int v68 = (unsigned int *)&a9;
  char v11 = *a2;
  if (*a2)
  {
    BOOL v12 = a2;
    int v14 = 0;
    uint64_t v15 = 0LL;
    while (1)
    {
      switch(v14)
      {
        case 0:
          if (v11 == 37)
          {
            int v9 = 0;
            unsigned int v10 = 0;
            goto LABEL_29;
          }

          dxios_stream_putc(v11, a1);
          goto LABEL_17;
        case 1:
          if (v11 <= 42)
          {
            if (v11 == 32)
            {
              v10 |= 4u;
              goto LABEL_29;
            }

            if (v11 == 35)
            {
              v10 |= 8u;
              goto LABEL_29;
            }
          }

          else
          {
            switch(v11)
            {
              case '+':
                v10 |= 2u;
                goto LABEL_29;
              case '0':
                v10 |= 0x20u;
                goto LABEL_29;
              case '-':
                v10 |= 0x10u;
LABEL_29:
                int v14 = 1;
                goto LABEL_174;
            }
          }

          if ((v11 - 48) <= 9u)
          {
            uint64_t v15 = (v11 - 48);
            v10 |= 0x40u;
            goto LABEL_32;
          }

          if (v11 > 0x67u)
          {
            if (v11 == 104 || v11 == 108) {
              goto LABEL_39;
            }
          }

          else
          {
            if (v11 == 46)
            {
LABEL_12:
              int v67 = 0;
              v10 |= 0x80u;
LABEL_15:
              int v14 = 3;
              goto LABEL_174;
            }

            if (v11 == 76)
            {
LABEL_39:
              int v9 = v11;
              int v14 = 5;
              goto LABEL_174;
            }
          }

LABEL_173:
                  int v14 = 0;
                  uint64_t v15 = -1LL;
                  break;
                }

LABEL_170:
                int v14 = 0;
                break;
              case 'u':
                if (v9 == 108)
                {
                  BOOL v58 = (unint64_t *)v68;
                  v68 += 2;
                  unint64_t v41 = *v58;
                  if (!*v58) {
                    goto LABEL_150;
                  }
                }

                else if (v9 == 104)
                {
                  int v40 = v68;
                  v68 += 2;
                  unint64_t v41 = (int)*v40;
                  if (!*v40) {
                    goto LABEL_150;
                  }
                }

                else
                {
                  uint64_t v60 = v68;
                  v68 += 2;
                  unint64_t v41 = *v60;
                  if (!*v60)
                  {
LABEL_150:
                    v72[0] = 48;
                    v10 &= 0xFFFDu;
                    BOOL v59 = &v73;
                    goto LABEL_151;
                  }
                }

                uint64_t v44 = 1LL;
                do
                {
                  v72[v44++ - 1] = (v41 % 0xA) | 0x30;
                  BOOL v31 = v41 >= 0xA;
                  v41 /= 0xAuLL;
                }

                while (v31);
LABEL_148:
                BOOL v59 = (uint64_t *)&v72[v44 - 1];
LABEL_151:
                uint64_t v15 = v15 - ((v10 & 7) != 0) + v72 - (_BYTE *)v59;
                if ((v10 & 0x70) == 0x40)
                {
                  while (v15)
                  {
                    --v15;
                    dxios_stream_putc(0x20u, a1);
                  }

                  uint64_t v15 = -1LL;
                }

                if ((v10 & 1) != 0)
                {
                  unsigned int v61 = 45;
                }

                else if ((v10 & 2) != 0)
                {
                  unsigned int v61 = 43;
                }

                else
                {
                  if ((v10 & 4) == 0) {
                    goto LABEL_162;
                  }
                  unsigned int v61 = 32;
                }

                dxios_stream_putc(v61, a1);
LABEL_162:
                if ((~v10 & 0x60) == 0)
                {
                  while (v15)
                  {
                    --v15;
                    dxios_stream_putc(0x30u, a1);
                  }

                  uint64_t v15 = -1LL;
                }

                char v62 = *((_BYTE *)v59 - 1);
                if (v62)
                {
                  uint64_t v63 = (unsigned __int8 *)v59 - 2;
                  do
                  {
                    dxios_stream_putc(v62, a1);
                    int v64 = *v63--;
                    char v62 = v64;
                  }

                  while (v64);
                }

                if ((v10 & 0x40) == 0) {
                  goto LABEL_170;
                }
                while (v15)
                {
                  --v15;
                  dxios_stream_putc(0x20u, a1);
                }

                goto LABEL_173;
              default:
                if (v11 != 76) {
                  break;
                }
                return 0LL;
            }
          }

LABEL_174:
          int v65 = *++v12;
          char v11 = v65;
          if (!v65) {
            return 0LL;
          }
          break;
        case 2:
          if (v11 == 46) {
            goto LABEL_12;
          }
          if ((v11 - 48) <= 9u)
          {
            uint64_t v15 = (v11 - 48) + 10 * v15;
LABEL_32:
            int v14 = 2;
            goto LABEL_174;
          }

LABEL_20:
          int v14 = 5;
          int v9 = v11;
          goto LABEL_174;
        case 3:
          int v67 = v11 + 10 * v67 - 48;
          goto LABEL_15;
        case 4:
          goto LABEL_20;
        case 5:
          goto LABEL_40;
        default:
          goto LABEL_174;
      }
    }
  }

  return 0LL;
}

BOOL dxios_mode_is_for_reading(unsigned int a1)
{
  return a1 < 2;
}

uint64_t dxios_close(void *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  free(a1);
  return 0LL;
}

uint64_t dxios_mapped_mode(uint64_t a1, char *__s)
{
  uint64_t v2 = a1;
  if ((a1 & 0xFFFFFFFE) == 4)
  {
    strcpy(v6, ".txt");
    if (__s && (size_t v4 = strlen(__s), v4 >= 5) && !strcic(&__s[v4 - 4], v6))
    {
      return 2 * ((_DWORD)v2 != 4);
    }

    else if ((_DWORD)v2 == 4)
    {
      return 1LL;
    }

    else
    {
      return 3LL;
    }
  }

  return v2;
}

char *dxios_fopen_mode(unsigned int a1)
{
  if (a1 > 3) {
    return 0LL;
  }
  else {
    return off_34520[a1];
  }
}

uint64_t dxios_fopen_mode_w(unsigned int a1)
{
  if (a1 > 3) {
    return 0LL;
  }
  else {
    return (uint64_t)*(&off_34540 + (int)a1);
  }
}

uint64_t dxios_stream_activate_autobuf(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (!dxios_mode_is_for_reading(a2))
  {
    autobuf_create(a3, a4);
    if (v8)
    {
      int v9 = (void *)v8;
      uint64_t v7 = dxios_stream_activate( a1,  v8,  (uint64_t)dxios_buf_close,  0LL,  0LL,  (uint64_t)dxios_buf_write,  (uint64_t)dxios_buf_seek_set,  (uint64_t)dxios_buf_tell);
      if (!(_DWORD)v7) {
        return v7;
      }
      free(v9);
    }

    else
    {
      uint64_t v7 = 4294967294LL;
    }

    dxerr_report_activate(*(void *)(a1 + 16), (uint64_t)dxios_pg_name, v7);
    return v7;
  }

  return 4294967290LL;
}

double autobuf_create(uint64_t a1, uint64_t a2)
{
  size_t v4 = dxc_alloc(a1 + 32);
  if (v4)
  {
    double result = 0.0;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
    *(void *)size_t v4 = v4 + 2;
    *((void *)v4 + 1) = v4 + 2;
    *((void *)v4 + 2) = a1;
    *((void *)v4 + 3) = a2;
  }

  return result;
}

uint64_t dxios_buf_close(void *a1)
{
  if (a1) {
    free(a1);
  }
  return 0LL;
}

uint64_t dxios_buf_write(void *__src, int a2, size_t __n, size_t *a4, uint64_t a5)
{
  if (!a5) {
    return 0LL;
  }
  unint64_t v6 = *(void **)(a5 + 32);
  if (!v6) {
    return 0LL;
  }
  size_t v8 = __n;
  unsigned int v10 = (char *)v6[1];
  char v11 = &v10[-*v6];
  BOOL v12 = &v11[__n];
  unint64_t v13 = v6[2];
  int v14 = &v11[__n - v13];
  if ((unint64_t)&v11[__n] < v13 || (uint64_t v15 = (char *)v6[3]) == 0LL)
  {
LABEL_9:
    *a4 = v8;
    int v19 = (char *)v6[2];
    if (v12 >= v19)
    {
      size_t v8 = v19 - v11;
      *a4 = v19 - v11;
    }

    if (v8)
    {
      memcpy(v10, __src, v8);
      uint64_t result = 0LL;
      v6[1] += *a4;
      return result;
    }

    return 0LL;
  }

  if (v14 <= v15) {
    int v14 = (char *)v6[3];
  }
  char v16 = &v14[v13];
  uint64_t v17 = dxc_realloc(*(void **)(a5 + 32), (size_t)&v14[v13 + 32]);
  if (v17)
  {
    unint64_t v6 = v17;
    *((void *)v17 + 2) = v16;
    unint64_t v18 = (char *)v17 + 32;
    unsigned int v10 = &v11[(void)v17 + 32];
    *unint64_t v6 = v18;
    v6[1] = v10;
    *(void *)(a5 + 32) = v6;
    goto LABEL_9;
  }

  return 4294967294LL;
}

uint64_t dxios_buf_seek_set(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 4294967286LL;
  if (a1 && (a3 & 0x8000000000000000LL) == 0 && a1[2] >= a3)
  {
    uint64_t result = 0LL;
    a1[1] = *a1 + a3;
  }

  return result;
}

uint64_t dxios_buf_tell(void *a1, uint64_t a2, void *a3)
{
  if (a1) {
    *a3 = a1[1] - *a1;
  }
  return 0LL;
}

uint64_t dxios_stream_capture_buf(uint64_t a1, void *a2, int a3, size_t *a4)
{
  if (!a2) {
    return 4294967282LL;
  }
  *a2 = 0LL;
  if (!a1 || !*(_DWORD *)a1) {
    return 4294967293LL;
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (!v6) {
    return 4294967284LL;
  }
  uint64_t v9 = *(void *)(v6 + 8);
  size_t v10 = v9 - *(void *)v6;
  if (a3) {
    size_t v11 = v10 + 1;
  }
  else {
    size_t v11 = v9 - *(void *)v6;
  }
  BOOL v12 = malloc(v11);
  *a2 = v12;
  if (!v12) {
    return 4294967294LL;
  }
  unint64_t v13 = v12;
  memcpy(v12, *(const void **)v6, v10);
  if (a3) {
    v13[v10] = 0;
  }
  uint64_t result = 0LL;
  if (a4) {
    *a4 = v10;
  }
  return result;
}

uint64_t dxios_stream_activate_buf(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  if (dxios_mode_is_for_reading(a2)) {
    size_t v8 = dxios_buf_read;
  }
  else {
    size_t v8 = 0LL;
  }
  if (dxios_mode_is_for_reading(a2)) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = dxios_buf_write;
  }
  if (*(_DWORD *)a1)
  {
    uint64_t v10 = 0xFFFFFFFFLL;
  }

  else
  {
    BOOL v12 = dxc_alloc(0x20uLL);
    if (v12)
    {
      unint64_t v13 = v12;
      _OWORD *v12 = 0u;
      v12[1] = 0u;
      *(void *)BOOL v12 = a3;
      *((void *)v12 + 1) = a3;
      *((void *)v12 + 2) = a4;
      *((void *)v12 + 3) = 0LL;
      uint64_t v10 = dxios_stream_activate( a1,  (uint64_t)v12,  (uint64_t)dxios_buf_close,  0LL,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)dxios_buf_seek_set,  (uint64_t)dxios_buf_tell);
      if (!(_DWORD)v10) {
        return v10;
      }
      free(v13);
    }

    else
    {
      uint64_t v10 = 4294967294LL;
    }
  }

  dxerr_report_activate(*(void *)(a1 + 16), (uint64_t)dxios_pg_name, v10);
  return v10;
}

uint64_t dxios_buf_read(void *a1, uint64_t a2, size_t a3, size_t *a4, void *a5)
{
  if (a5)
  {
    uint64_t v7 = (const void *)a5[1];
    if (a5[2] - (void)v7 + *a5 < a3) {
      a3 = a5[2] - (void)v7 + *a5;
    }
    *a4 = a3;
    memcpy(a1, v7, a3);
    a5[1] += *a4;
  }

  return 0LL;
}

uint64_t dxios_series_activate_ram(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_DWORD *)a1)
  {
    uint64_t v4 = 4294967276LL;
    goto LABEL_6;
  }

  if (*(_DWORD *)(a1 + 16) || *(_DWORD *)(a1 + 104))
  {
    uint64_t v4 = 4294967272LL;
    goto LABEL_6;
  }

  autobuf_create(a2, a3);
  if (!v8)
  {
LABEL_15:
    uint64_t v4 = 4294967271LL;
    goto LABEL_6;
  }

  uint64_t v9 = (void *)v8;
  uint64_t v10 = dxios_stream_activate( a1 + 16,  v8,  (uint64_t)dxios_buf_close,  (uint64_t)dxios_buf_rewind,  (uint64_t)dxios_buf_read,  0LL,  (uint64_t)dxios_buf_seek_set,  (uint64_t)dxios_buf_tell);
  if ((_DWORD)v10)
  {
    uint64_t v4 = v10;
    free(v9);
    goto LABEL_6;
  }

  autobuf_create(a2, a3);
  if (!v11)
  {
    dxios_stream_deactivate(a1 + 16, 0LL);
    goto LABEL_15;
  }

  BOOL v12 = (void *)v11;
  uint64_t v4 = dxios_stream_activate( a1 + 104,  v11,  (uint64_t)dxios_buf_close,  (uint64_t)dxios_buf_rewind,  0LL,  (uint64_t)dxios_buf_write,  (uint64_t)dxios_buf_seek_set,  (uint64_t)dxios_buf_tell);
  if (!(_DWORD)v4)
  {
    *(_DWORD *)a1 = 1;
    return v4;
  }

  free(v12);
  dxios_stream_deactivate(a1 + 16, 0LL);
LABEL_6:
  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)dxios_pg_name, v4);
  return v4;
}

uint64_t dxios_buf_rewind(uint64_t *a1, uint64_t a2, unsigned int a3)
{
  if (a1)
  {
    BOOL v4 = dxios_mode_is_for_reading(a3);
    uint64_t v5 = *a1;
    if (v4) {
      a1[2] = a1[1] - v5;
    }
    a1[1] = v5;
  }

  return 0LL;
}

uint64_t dxios_stream_activate_fp(uint64_t a1, uint64_t a2, unsigned int a3, int a4)
{
  if (dxios_mode_is_for_reading(a3)) {
    uint64_t v8 = dxios_fread;
  }
  else {
    uint64_t v8 = 0LL;
  }
  if (dxios_mode_is_for_reading(a3)) {
    uint64_t v9 = 0LL;
  }
  else {
    uint64_t v9 = dxios_fwrite;
  }
  if (a4) {
    uint64_t v10 = dxios_fclose;
  }
  else {
    uint64_t v10 = 0LL;
  }
  return dxios_stream_activate( a1,  a2,  (uint64_t)v10,  0LL,  (uint64_t)v8,  (uint64_t)v9,  (uint64_t)dxios_fseek_set,  (uint64_t)dxios_ftell);
}

uint64_t dxios_fread(void *a1, uint64_t a2, size_t a3, size_t *a4, FILE *__stream)
{
  *a4 = fread(a1, 1uLL, a3, __stream);
  uint64_t v7 = ferror(__stream);
  if ((_DWORD)v7) {
    dxerr_report_activate(a2, 0LL, v7);
  }
  return v7;
}

uint64_t dxios_fwrite(const void *a1, uint64_t a2, size_t a3, size_t *a4, uint64_t a5)
{
  *a4 = fwrite(a1, 1uLL, a3, *(FILE **)(a5 + 32));
  uint64_t v7 = ferror(*(FILE **)(a5 + 32));
  if ((_DWORD)v7) {
    dxerr_report_activate(a2, 0LL, v7);
  }
  return v7;
}

uint64_t dxios_fclose(FILE *a1, uint64_t a2)
{
  uint64_t v3 = fclose(a1);
  if ((_DWORD)v3) {
    dxerr_report_activate(a2, 0LL, v3);
  }
  return v3;
}

uint64_t dxios_fseek_set(FILE *a1, uint64_t a2, uint64_t a3)
{
  if (!fseek(a1, a3, 0)) {
    return 0LL;
  }
  uint64_t v5 = ferror(a1);
  if ((_DWORD)v5)
  {
    uint64_t v6 = a2;
    uint64_t v7 = 0LL;
    int v8 = v5;
  }

  else
  {
    uint64_t v7 = dxios_pg_name;
    uint64_t v6 = a2;
    int v8 = -10;
  }

  dxerr_report_activate(v6, (uint64_t)v7, v8);
  return v5;
}

uint64_t dxios_ftell(FILE *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = ftell(a1);
  if (v5 == -1)
  {
    uint64_t v6 = *__error();
    dxerr_report_activate(a2, 0LL, v6);
  }

  else
  {
    uint64_t v6 = 0LL;
    *a3 = v5;
  }

  return v6;
}

const char *dxios_get_dbl_and_fcvt()
{
  return "error";
}

LABEL_7:
    uint64_t v6 = -1LL;
    goto LABEL_8;
  }

  if (!*v3) {
    return 1LL;
  }
LABEL_8:
  uint64_t v6 = ":";
  if (*a2)
  {
    uint64_t v7 = 0LL;
    int v8 = *a2;
    while (v7 != 1)
    {
      int v8 = a2[++v7];
      if (!v8)
      {
        uint64_t v6 = &asc_33103[v7];
        goto LABEL_14;
      }
    }

    return 1LL;
  }

LABEL_5:
  uint64_t v6 = 1LL;
LABEL_8:

  return v6;
}

const char *strcat_lower(const char *a1, _BYTE *a2)
{
  BOOL v4 = (char *)&a1[strlen(a1)];
  char v5 = *a2;
  if (*a2)
  {
    uint64_t v6 = a2 + 1;
    do
    {
      if ((v5 & 0x80) == 0 && (_DefaultRuneLocale.__runetype[v5] & 0x8000) != 0) {
        char v5 = __tolower(v5);
      }
      *v4++ = v5;
      int v7 = *v6++;
      char v5 = v7;
    }

    while (v7);
  }

  char *v4 = 0;
  return a1;
}

const __int32 *wcscat_lower(const __int32 *a1, unsigned int *a2)
{
  BOOL v4 = (unsigned int *)&a1[wcslen(a1)];
  unsigned int v5 = *a2;
  if (*a2)
  {
    uint64_t v6 = a2 + 1;
    do
    {
      if (v5 <= 0x7F && (_DefaultRuneLocale.__runetype[v5] & 0x8000) != 0) {
        unsigned int v5 = __tolower(v5);
      }
      *v4++ = v5;
      unsigned int v7 = *v6++;
      unsigned int v5 = v7;
    }

    while (v7);
  }

  unsigned int *v4 = 0;
  return a1;
}

uint64_t dxios_search_add_cache(void *a1, uint64_t a2, void *a3, void *a4)
{
  if (a3) {
    *a3 = gActivateCachedStream;
  }
  if (a4) {
    *a4 = gActivateCachedStreamParam;
  }
  gActivateCachedStream = a1;
  gActivateCachedStreamParam = a2;
  return 0LL;
}

FILE *dxios_search_fopen(char *__s, _BYTE *a2, uint64_t a3, char *__mode, int a5)
{
  unsigned int v9 = 0;
  while (1)
  {
    int v10 = (a5 >> (8 - 4 * v9)) & 0xF;
    if (v10 == 2)
    {
      size_t v13 = strlen(__s);
      if ((_BYTE)dxcprl)
      {
        size_t v14 = v13;
        uint64_t v15 = (const char *)&dxcprl;
        while (1)
        {
          size_t v16 = strlen(v15);
          if (v16 + v14 <= 0xFE)
          {
            __strcpy_chk(__filename, v15, 255LL);
            strcat_lower(__filename, __s);
            uint64_t v17 = fopen(__filename, __mode);
            if (v17) {
              break;
            }
          }

          unint64_t v18 = &v15[v16];
          int v19 = *((unsigned __int8 *)v18 + 1);
          uint64_t v15 = v18 + 1;
          if (!v19) {
            goto LABEL_12;
          }
        }

        BOOL v12 = v17;
        if (a2) {
          strcpx(a2, (unsigned __int8 *)__filename, a3);
        }
      }

      else
      {
LABEL_12:
        BOOL v12 = 0LL;
        if (a2) {
          *a2 = 0;
        }
      }

      goto LABEL_15;
    }

    if (v10 == 1) {
      break;
    }
    BOOL v12 = 0LL;
LABEL_15:
    if (v9 <= 1)
    {
      ++v9;
      if (!v12) {
        continue;
      }
    }

    return v12;
  }

  uint64_t v11 = fopen(__s, __mode);
  BOOL v12 = v11;
  if (!a2 || !v11) {
    goto LABEL_15;
  }
  strcpx(a2, (unsigned __int8 *)__s, a3);
  return v12;
}

FILE *dxios_search_fopen_w(__int32 *a1, _DWORD *a2, uint64_t a3, const __int32 *a4, int a5)
{
  unsigned int v9 = 0;
  while (1)
  {
    int v10 = (a5 >> (8 - 4 * v9)) & 0xF;
    if (v10 == 2)
    {
      size_t v13 = wcslen(a1);
      if ((_BYTE)dxcprl)
      {
        size_t v14 = v13;
        uint64_t v15 = (const char *)&dxcprl;
        while (1)
        {
          size_t v16 = strlen(v15);
          if (v16 + v14 <= 0xFE)
          {
            mbstowcs(v22, v15, 0xFFuLL);
            wcscat_lower(v22, (unsigned int *)a1);
            uint64_t v17 = dx_wfopen(v22, a4);
            if (v17) {
              break;
            }
          }

          unint64_t v18 = &v15[v16];
          int v19 = *((unsigned __int8 *)v18 + 1);
          uint64_t v15 = v18 + 1;
          if (!v19) {
            goto LABEL_12;
          }
        }

        BOOL v12 = v17;
        if (a2) {
          wcscpx(a2, v22, a3);
        }
      }

      else
      {
LABEL_12:
        BOOL v12 = 0LL;
        if (a2) {
          *a2 = 0;
        }
      }

      goto LABEL_15;
    }

    if (v10 == 1) {
      break;
    }
    BOOL v12 = 0LL;
LABEL_15:
    if (v9 <= 1)
    {
      ++v9;
      if (!v12) {
        continue;
      }
    }

    return v12;
  }

  uint64_t v11 = dx_wfopen(a1, a4);
  BOOL v12 = v11;
  if (!a2 || !v11) {
    goto LABEL_15;
  }
  wcscpx(a2, a1, a3);
  return v12;
}

_DWORD *dxios_search_open(char *a1, _BYTE *a2, uint64_t a3, uint64_t a4, int a5)
{
  int v10 = malloc(0x58uLL);
  uint64_t v11 = v10;
  if (v10)
  {
    dxios_stream_create((uint64_t)v10, 0LL);
    if (dxios_stream_activate_filename_search(v11, a1, a2, a3, a4, a5))
    {
      dxios_stream_destroy(v11);
      free(v11);
      return 0LL;
    }
  }

  return v11;
}

uint64_t dxios_stream_activate_filename_search( _DWORD *a1, char *a2, _BYTE *a3, uint64_t a4, uint64_t a5, int a6)
{
  if (a3) {
    unsigned int v7 = a3;
  }
  else {
    unsigned int v7 = v19;
  }
  if (a3) {
    uint64_t v8 = a4;
  }
  else {
    uint64_t v8 = 256LL;
  }
  if (*a1) {
    goto LABEL_8;
  }
  unsigned int v13 = 0;
  int v18 = a6 & 0xF000;
  char v14 = 8;
  while (1)
  {
    uint64_t v15 = (a6 >> v14) & 0xF;
    if ((a6 & 0x2000) == 0
      && gActivateCachedStream
      && !gActivateCachedStream(gActivateCachedStreamParam, 0LL, a1, a5, 0LL, 1LL, a2, v15, v7, v8))
    {
      if (*a1 || v13 >= 2) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }

    size_t v16 = dxios_fopen_mode(a5);
    uint64_t v17 = dxios_search_fopen(a2, v7, v8, v16, v15 | v18);
    if (gActivateCachedStream)
    {
      if (!gActivateCachedStream(gActivateCachedStreamParam, 1LL, a1, a5, v17, 1LL, a2, v15, v7, v8)
        && *a1)
      {
        break;
      }
    }

    if (v17)
    {
      fclose(v17);
    }

    if (v13 > 1) {
      goto LABEL_8;
    }
LABEL_23:
    ++v13;
    v14 -= 4;
    if (*a1) {
      goto LABEL_8;
    }
  }

  fclose(v17);
LABEL_8:
  if (*a1) {
    return 0LL;
  }
  else {
    return 4294967292LL;
  }
}

_DWORD *dxios_search_open_w(__int32 *a1, _DWORD *a2, uint64_t a3, uint64_t a4, int a5)
{
  int v10 = malloc(0x58uLL);
  uint64_t v11 = v10;
  if (v10)
  {
    dxios_stream_create((uint64_t)v10, 0LL);
    if (dxios_stream_activate_filename_search_w(v11, a1, a2, a3, a4, a5))
    {
      dxios_stream_destroy(v11);
      free(v11);
      return 0LL;
    }
  }

  return v11;
}

uint64_t dxios_stream_activate_filename_search_w( _DWORD *a1, __int32 *a2, _DWORD *a3, uint64_t a4, uint64_t a5, int a6)
{
  if (!a3)
  {
    a3 = v18;
    a4 = 256LL;
  }

  if (!*a1)
  {
    unsigned int v13 = 0;
    char v14 = 8;
    do
    {
      uint64_t v15 = (a6 >> v14) & 0xF;
      if ((a6 & 0x2000) != 0
        || !gActivateCachedStream
        || gActivateCachedStream(gActivateCachedStreamParam, 0LL, a1, a5, 0LL, 4LL, a2, v15, a3, a4))
      {
        size_t v16 = (const __int32 *)dxios_fopen_mode_w(a5);
        uint64_t v17 = dxios_search_fopen_w(a2, a3, a4, v16, v15 | a6 & 0xF000);
        if (gActivateCachedStream
          && !gActivateCachedStream(gActivateCachedStreamParam, 1LL, a1, a5, v17, 4LL, a2, v15, a3, a4)
          && *a1)
        {
          fclose(v17);
          break;
        }

        if (v17)
        {
          fclose(v17);
        }

        if (v13 > 1) {
          break;
        }
      }

      else if (*a1 || v13 >= 2)
      {
        break;
      }

      ++v13;
      v14 -= 4;
    }

    while (!*a1);
  }

  if (*a1) {
    return 0LL;
  }
  else {
    return 4294967292LL;
  }
}

void jreaf(void **a1)
{
}

uint64_t jreaq(uint64_t a1, uint64_t a2)
{
  BOOL v4 = (int *)(a1 + 29544);
  *(_DWORD *)(a1 + 29544) = dxios_stream_mdri(a2);
  if (v4[23] > 12) {
    size_t v5 = dxios_stream_mdrl(a2);
  }
  else {
    size_t v5 = dxios_stream_mdri(a2);
  }
  *(void *)(a1 + 29552) = v5;
  uint64_t v6 = *v4;
  unsigned int v7 = malloc(8 * v6);
  *(void *)(a1 + 29560) = v7;
  if (!v7) {
    return 1LL;
  }
  uint64_t v8 = malloc(4 * v6);
  *(void *)(a1 + 29568) = v8;
  if (!v8) {
    return 1LL;
  }
  unsigned int v9 = malloc(4 * v6);
  *(void *)(a1 + 29576) = v9;
  if (!v9) {
    return 1LL;
  }
  int v10 = malloc(v5);
  *(void *)(a1 + 29584) = v10;
  if (!v10) {
    return 1LL;
  }
  if (v4[23] >= 13)
  {
    if ((int)v6 >= 1)
    {
      uint64_t v14 = 0LL;
      do
      {
        *(void *)(*(void *)(a1 + 29560) + 8 * v14++) = dxios_stream_mdrl(a2);
        uint64_t v12 = *v4;
      }

      while (v14 < v12);
      goto LABEL_17;
    }
  }

  else if ((int)v6 >= 1)
  {
    uint64_t v11 = 0LL;
    do
    {
      *(void *)(*(void *)(a1 + 29560) + 8 * v11++) = dxios_stream_mdri(a2);
      uint64_t v12 = *v4;
    }

    while (v11 < v12);
LABEL_17:
    if ((int)v12 >= 1)
    {
      for (uint64_t i = 0LL; i < v12; ++i)
      {
        *(_DWORD *)(*(void *)(a1 + 29568) + 4 * i) = dxios_stream_mdri(a2);
        uint64_t v12 = *v4;
      }
    }

    if (v4[23] >= 13)
    {
      if ((int)v12 >= 1)
      {
        uint64_t v18 = 0LL;
        do
          *(_DWORD *)(*(void *)(a1 + 29576) + 4 * v18++) = dxios_stream_mdri(a2);
        while (v18 < *v4);
      }
    }

    else if ((int)v12 >= 1)
    {
      uint64_t v16 = 0LL;
      do
      {
        int v17 = dxios_stream_mdri(a2);
        *(_DWORD *)(*(void *)(a1 + 29576) + 4 * v16++) = (v17 << 10) & 0xC000 | v17 & 0xFFCF;
      }

      while (v16 < *v4);
    }
  }

  if (*(uint64_t *)(a1 + 29552) >= 1)
  {
    uint64_t v19 = 0LL;
    do
      *(_BYTE *)(*(void *)(a1 + 29584) + v19++) = dxios_stream_getc(a2);
    while (v19 < *(void *)(a1 + 29552));
  }

  return 0LL;
}

double jreaqi(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)(a1 + 29560) = 0u;
  *(_OWORD *)(a1 + 29576) = 0u;
  return result;
}

_DWORD *lfiniq(_DWORD *result)
{
  uint64_t v1 = result + 7385;
  if (result[7385] != 3)
  {
    uint64_t v2 = (uint64_t)result;
    double result = wdput(result);
    if (*((_BYTE *)v1 + 2636)) {
      return (_DWORD *)nlput(v2);
    }
  }

  return result;
}

_DWORD *wdput(_DWORD *result)
{
  uint64_t v1 = result;
  uint64_t v2 = result + 8040;
  int v3 = result[8048];
  if (v3 >= 1)
  {
    if (result[8084] + v3 + result[8040] < 66
      || (double result = (_DWORD *)nlput((uint64_t)result),
          int v4 = v2[8],
          BOOL v5 = __OFSUB__(v4, 1),
          --v4,
          v2[8] = v4,
          !((v4 < 0) ^ v5 | (v4 == 0))))
    {
      int v6 = 0;
      do
      {
        double result = (_DWORD *)dxios_stream_putc(0x20u, *((void **)v1 + 4021));
        int v7 = v2[8];
        ++v6;
      }

      while (v6 < v7);
      *((_BYTE *)v2 + 16) = 32;
      *v2 += v7;
      v2[8] = 0;
    }
  }

  uint64_t v8 = v2[44];
  if ((int)v8 >= 1)
  {
    *((_BYTE *)v1 + v8 + 32200) = 0;
    double result = (_DWORD *)dxios_stream_puts((_BYTE *)v1 + 32200, *((void **)v1 + 4021));
    uint64_t v9 = (int)v2[44];
    *((_BYTE *)v2 + 16) = *((_BYTE *)v1 + v9 + 32199);
    *v2 += v9;
    v2[44] = 0;
  }

  return result;
}

uint64_t nlput(uint64_t a1)
{
  uint64_t v2 = a1 + 29488;
  if ((*(_BYTE *)(a1 + 29488) & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 32156))
    {
      int v4 = *(unsigned __int8 *)(a1 + 32176);
      if (v4 == 45 || v4 == 32)
      {
        dxios_stream_putc(0x20u, *(void **)(a1 + 32168));
        dxios_stream_putc(0x2Du, *(void **)(a1 + 32168));
      }
    }

    unsigned int v3 = 10;
  }

  else
  {
    unsigned int v3 = 32;
  }

  uint64_t result = dxios_stream_putc(v3, *(void **)(a1 + 32168));
  *(_BYTE *)(v2 + 2688) = 0;
  *(_DWORD *)(v2 + 2672) = 0;
  return result;
}

uint64_t linecq(uint64_t result, int a2)
{
  int v2 = a2;
  uint64_t v3 = result;
  uint64_t v4 = result + 29540;
  if (*(_DWORD *)(result + 29540) == 3) {
    return dxios_stream_putc((char)a2, *(void **)(result + 32168));
  }
  if (*(_BYTE *)(result + 32184))
  {
    if (a2 == 31)
    {
      BOOL v5 = (int *)(result + 32180);
    }

    else
    {
      if (a2 != 28) {
        goto LABEL_9;
      }
      BOOL v5 = (int *)(result + 32188);
    }

    int v2 = *v5;
  }

uint64_t linitq(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  *(void *)(a1 + 32168) = a3;
  int v4 = *(_DWORD *)(a4 + 288);
  *(_DWORD *)(a1 + 29536) = v4;
  if (a2 < 0) {
    a2 = *(_DWORD *)(a1 + 29540);
  }
  else {
    *(_DWORD *)(a1 + 29540) = a2;
  }
  switch(a2)
  {
    case 0:
    case 2:
      *(_DWORD *)(a1 + 32196) = 130;
      *(_BYTE *)(a1 + 32156) = 1;
      goto LABEL_7;
    case 4:
      if (v4 == 28) {
        goto LABEL_5;
      }
      *(_DWORD *)(a1 + 32196) = 130;
      *(_BYTE *)(a1 + 32156) = 1;
      *(_BYTE *)(a1 + 32184) = 1;
      if (v4 == 36) {
        int v5 = 124;
      }
      else {
        int v5 = 36;
      }
LABEL_14:
      *(_DWORD *)(a1 + 32188) = v5;
      *(_DWORD *)(a1 + 32180) = 32;
      break;
    case 6:
      *(_DWORD *)(a1 + 32196) = 130;
      *(_BYTE *)(a1 + 32156) = 1;
      *(_BYTE *)(a1 + 32184) = 1;
      int v5 = 124;
      goto LABEL_14;
    case 7:
      *(_DWORD *)(a1 + 32196) = 130;
      *(_BYTE *)(a1 + 32156) = 1;
      *(_BYTE *)(a1 + 32184) = 1;
      int v5 = 36;
      goto LABEL_14;
    default:
LABEL_5:
      *(_DWORD *)(a1 + 32196) = 131;
      *(_BYTE *)(a1 + 32156) = 0;
LABEL_7:
      *(_BYTE *)(a1 + 32184) = 0;
      break;
  }

  *(_DWORD *)(a1 + 32160) = 0;
  *(_BYTE *)(a1 + 32176) = 0;
  *(_DWORD *)(a1 + 32192) = 0;
  return 0LL;
}

uint64_t mdri(FILE *a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  char v4 = 1;
  do
  {
    char v5 = v4;
    unsigned __int8 v6 = getc(a1);
    char v4 = 0;
    v2 |= (unint64_t)v6 << v3;
    v3 += 8LL;
  }

  while ((v5 & 1) != 0);
  if ((v2 & 0x8000) != 0) {
    return v2 | 0xFFFF0000;
  }
  else {
    return v2;
  }
}

uint64_t dxios_stream_mdri(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  char v4 = 1;
  do
  {
    char v5 = v4;
    unsigned __int8 v6 = dxios_stream_getc(a1);
    char v4 = 0;
    v2 |= (unint64_t)v6 << v3;
    v3 += 8LL;
  }

  while ((v5 & 1) != 0);
  if ((v2 & 0x8000) != 0) {
    return v2 | 0xFFFF0000;
  }
  else {
    return v2;
  }
}

unint64_t mdrl(FILE *a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  do
  {
    v2 |= (unint64_t)getc(a1) << v3;
    v3 += 8LL;
  }

  while ((_DWORD)v3 != 32);
  else {
    return v2;
  }
}

unint64_t dxios_stream_mdrl(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  do
  {
    v2 |= (unint64_t)dxios_stream_getc(a1) << v3;
    v3 += 8LL;
  }

  while ((_DWORD)v3 != 32);
  else {
    return v2;
  }
}

uint64_t mdrv(FILE *a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  do
  {
    v3 |= (unint64_t)getc(a1) << v2;
    v2 += 8LL;
  }

  while ((_DWORD)v2 != 64);
  return v3;
}

uint64_t dxios_stream_mdrv(uint64_t a1)
{
  uint64_t v2 = 0LL;
  uint64_t v3 = 0LL;
  do
  {
    v3 |= (unint64_t)dxios_stream_getc(a1) << v2;
    v2 += 8LL;
  }

  while ((_DWORD)v2 != 64);
  return v3;
}

uint64_t dxnin_engine_destroy(_DWORD *a1)
{
  if (*a1) {
    dxnin_engine_deactivate((uint64_t)a1);
  }
  return dxbin_engine_destroy((uint64_t)(a1 + 10));
}

uint64_t dxnin_engine_deactivate(uint64_t a1)
{
  if (!*(_DWORD *)a1)
  {
    uint64_t v3 = 4294967292LL;
LABEL_8:
    dxerr_report_activate(*(void *)(a1 + 32), (uint64_t)"niniq", v3);
    return v3;
  }

  uint64_t v2 = dxbin_engine_deactivate(a1 + 40);
  uint64_t v3 = v2;
  if (*(_DWORD *)a1)
  {
    free(*(void **)(a1 + 376));
    *(_DWORD *)a1 = 0;
    if (!(_DWORD)v3) {
      return v3;
    }
    goto LABEL_7;
  }

  if ((_DWORD)v2)
  {
LABEL_7:
    uint64_t v3 = 4294967294LL;
    goto LABEL_8;
  }

  return v3;
}

double dxnin_engine_create(_DWORD *a1, uint64_t a2)
{
  *a1 = 0;
  *((void *)a1 + 4) = a2;
  *((_BYTE *)a1 + 4) = 0;
  *(void *)(a1 + 79) = 0LL;
  *(void *)(a1 + 77) = 0LL;
  return dxbin_engine_create((uint64_t)(a1 + 10), a2);
}

uint64_t dxnin_engine_activate(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  *(_DWORD *)(a1 + 24) = 0;
  *(void *)(a1 + 288) = 0LL;
  *(void *)(a1 + 296) = 0LL;
  *(_DWORD *)(a1 + 304) = 0;
  *(void *)(a1 + 120) = a5;
  *(void *)(a1 + 128) = a6;
  int v10 = (const void *)(a1 + 352);
  *(void *)(a1 + 328) = a5;
  *(void *)(a1 + 336) = a6;
  bzero((void *)(a1 + 352), 0x38E0uLL);
  *(void *)(a1 + 352) = 0LL;
  *(_BYTE *)(a1 + 368) = 0;
  *(_BYTE *)(a1 + 432) = 0;
  *(_DWORD *)(a1 + 436) = 0;
  *(_DWORD *)(a1 + 644) = 0;
  dxtbl_lintbl_create((uint64_t)v28, *(void *)(a1 + 32));
  if (dxtbl_lintbl_activate((uint64_t)v28, a2, "-ninit 6")
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, &v30))
  {
    goto LABEL_14;
  }

  if ((a4 & 0x80000000) == 0) {
    *(_DWORD *)(a1 + 56) = a4;
  }
  if (dxtbl_lintbl_readBOOLean((uint64_t)v28, (BOOL *)(a1 + 60))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 64))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 68))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 72))
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 84), 0xFuLL)
    || read_bscpc((uint64_t)v28, a1)
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 100))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 104))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 108)))
  {
    goto LABEL_14;
  }

  int v11 = -1;
  if (dxtbl_lintbl_readint((uint64_t)v28, 0, 1, (int *)(a1 + 464))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 2, (int *)(a1 + 456))
    || (uint64_t v15 = (unsigned int *)(a1 + 460), dxtbl_lintbl_readint((uint64_t)v28, 0, 2, (int *)(a1 + 460)))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 1, (int *)(a1 + 468))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 1, &v27)
    || readfonts((uint64_t)v28, (uint64_t)v10)
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 3, (int *)(a1 + 452))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 1, (int *)&v29)
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 1, (int *)(a1 + 320))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 300))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 296))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 292))
    || dxtbl_lintbl_readchic((uint64_t)v28, (_DWORD *)(a1 + 304))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 1, (int *)(a1 + 384))
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 472), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 487), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 502), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 517), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 532), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 547), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 562), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 577), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 592), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 607), 0xFuLL)
    || dxtbl_lintbl_read((uint64_t)v28, (const char *)(a1 + 622), 0xFuLL)
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 13500))
    || dxtbl_lintbl_readint((uint64_t)v28, 0, 0x7FFFFFFF, (int *)(a1 + 360))
    || dxtbl_lintbl_deactivate((uint64_t)v28))
  {
LABEL_14:
    int v11 = -1;
LABEL_15:
    dxerr_report_activate(*(void *)(a1 + 32), (uint64_t)"niniq", v11);
    *(_BYTE *)(a1 + 389) = 0;
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = 0xFFFFFFFFLL;
    dxerr_report_activate(v12, (uint64_t)"niniq", -1);
    return v13;
  }

  unsigned int v16 = 0x1000100u >> (8 * v29);
  if (v29 >= 4) {
    char v17 = 0;
  }
  else {
    char v17 = 0x1010000u >> (8 * v29);
  }
  if (v29 >= 4) {
    LOBYTE(v16) = 0;
  }
  *(_BYTE *)(a1 + 13505) = v17;
  *(_BYTE *)(a1 + 13504) = v16;
  int v18 = *(_DWORD *)(a1 + 360);
  if (v18) {
    int v19 = v18 + 1;
  }
  else {
    int v19 = 0;
  }
  *(_DWORD *)(a1 + 364) = v19;
  *(_DWORD *)(a1 + 288) = *(_DWORD *)(a1 + 64);
  unsigned int v20 = *(_DWORD *)(a1 + 308) - 1;
  if (v20 <= 2) {
    *(_DWORD *)(a1 + 456) = v20;
  }
  unsigned int v21 = *(_DWORD *)(a1 + 312) - 1;
  if (v21 <= 2) {
    unsigned int *v15 = v21;
  }
  unsigned int v22 = *(_DWORD *)(a1 + 316) - 1;
  if (v22 <= 1) {
    *(_DWORD *)(a1 + 468) = v22;
  }
  if (v27 == 1) {
    int v23 = 96;
  }
  else {
    int v23 = 97;
  }
  if (v27 == 1) {
    int v24 = 126;
  }
  else {
    int v24 = 122;
  }
  *(_DWORD *)(a1 + 408) = v23;
  *(_DWORD *)(a1 + 404) = v24;
  if (dxbin_engine_activate(a1 + 40, a3, v30))
  {
    int v11 = -2;
    goto LABEL_15;
  }

  if (*(_DWORD *)(a1 + 464) == 1)
  {
    int v25 = 14;
  }

  else
  {
    BOOL v26 = *v15 != 2 && *(_DWORD *)(a1 + 292) != 0;
    *(_BYTE *)(a1 + 388) = v26;
    *(_DWORD *)(a1 + 440) = 32;
    if (((*(_DWORD *)(a1 + 452) - 1) & 0xFFFFFFFD) != 0) {
      int v25 = 4;
    }
    else {
      int v25 = 23;
    }
  }

  *(_DWORD *)(a1 + 416) = v25;
  *(_BYTE *)(a1 + 389) = 0;
  *(_DWORD *)a1 = 1;
  memcpy((void *)(a1 + 14912), v10, 0x38E0uLL);
  return 0LL;
}

uint64_t dxnin_engine_activate_tablename(uint64_t a1, char *a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  int v11 = dxios_search_open(a2, 0LL, 255LL, 0LL, 288);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = dxnin_engine_activate(a1, (uint64_t)v11, a3, a4, a5, a6);
    dxios_close(v12);
    return v13;
  }

  else
  {
    dxerr_report_activate(*(void *)(a1 + 32), (uint64_t)"niniq", -5);
    return 4294967291LL;
  }

uint64_t dxnin_engine_reactivate(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a1 + 640);
  if ((int)v4 >= 1)
  {
    char v5 = (_DWORD *)(*(void *)(a1 + 376) + 40LL);
    do
    {
      _DWORD *v5 = 0;
      v5 += 11;
      --v4;
    }

    while (v4);
  }

  return dxbin_engine_reactivate(a1 + 40, a2);
}

uint64_t extract_styname(uint64_t result, uint64_t a2, int a3)
{
  if (a3 < 2)
  {
    LODWORD(v4) = 0;
  }

  else
  {
    uint64_t v3 = 0LL;
    uint64_t v4 = (a3 - 1);
    while (1)
    {
      unsigned int v5 = *(_DWORD *)(result + 16 + 4 * v3);
      BOOL v6 = v5 > 0x20 || ((1LL << v5) & 0x180000001LL) == 0;
      if (!v6 || v5 == 96) {
        break;
      }
      *(_BYTE *)(a2 + v3++) = v5;
      if (v4 == v3) {
        goto LABEL_13;
      }
    }

    LODWORD(v4) = v3;
  }

LABEL_13:
  *(_BYTE *)(a2 + v4) = 0;
  return result;
}

uint64_t dxnin_engine_getc(uint64_t a1)
{
  void (*v57)(uint64_t *__return_ptr, uint64_t, void *, BOOL, void);
  BOOL v58;
  _BYTE *v59;
  int v60;
  int v61;
  uint64_t v62;
  int v63;
  BOOL v64;
  int v65;
  int v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  int v70;
  char v71;
  BOOL v72;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  uint64_t v81;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  int v95;
  int v96;
  BOOL v97;
  int v98;
  _BYTE *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int v104;
  void (*v106)(void *__return_ptr, uint64_t, _BYTE *, BOOL, void);
  uint64_t v107;
  BOOL v108;
  int v109;
  BOOL v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  _DWORD *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  int v128;
  int v129;
  uint64_t v131;
  int v132;
  uint64_t v133;
  int hyp;
  int v135;
  int v136;
  int v137;
  int *v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  char v144;
  int v145;
  int v146;
  uint64_t v147;
  int v149;
  uint64_t v150;
  unsigned int v151;
  int v152;
  int v153;
  unsigned int v154;
  int v155;
  int v156;
  uint64_t v157;
  int v158;
  unsigned int v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  _BYTE *v163;
  uint64_t v164;
  unsigned int *v165;
  uint64_t v166[3];
  _BYTE *v167;
  _BYTE v168[5];
  _BYTE v169[40];
  void v170[5];
  uint64_t v2 = (char *)(a1 + 648);
  int v3 = *(_DWORD *)(a1 + 656);
  if (v3)
  {
    uint64_t v4 = *(int *)(a1 + 648);
    uint64_t result = v2[v4 + 12];
    *(_DWORD *)(a1 + 656) = v3 - 1;
    *(_DWORD *)(a1 + 648) = v4 + 1;
    return result;
  }

  BOOL v6 = (_BYTE *)(a1 + 13504);
  BOOL v7 = (unsigned int *)(a1 + 344);
  *(_DWORD *)(a1 + 648) = 0;
  switch(*(_DWORD *)(a1 + 416))
  {
    case 3:
      unsigned int v8 = *(_DWORD *)(a1 + 448);
      int v9 = *(_DWORD *)(a1 + 396);
      *(_DWORD *)(a1 + 396) = v9 + 1;
      return *v7;
    case 5:
      goto LABEL_365;
    case 6:
      int v10 = *(_BYTE **)(a1 + 8);
      goto LABEL_238;
    case 9:
      goto LABEL_399;
    case 0xA:
      goto LABEL_255;
    case 0xB:
      goto LABEL_239;
    case 0xC:
      uint64_t v11 = *(void *)(a1 + 16);
      *(_DWORD *)(a1 + 448) = *(_DWORD *)(v11 + 32);
      *(_DWORD *)(a1 + 416) = 11;
      *(_DWORD *)(v11 + 40) = 3;
      goto LABEL_16;
    case 0xD:
      goto LABEL_317;
    case 0xE:
      dxbin_engine_getc(a1 + 40);
      uint64_t result = *(unsigned int *)(a1 + 136);
      unsigned int *v7 = result;
      return result;
    case 0xF:
      uint64_t v12 = *(void *)(a1 + 8);
      goto LABEL_262;
    case 0x17:
      int v13 = 24;
      goto LABEL_321;
    case 0x18:
      *(_DWORD *)(a1 + 416) = 4;
      return 128LL;
    case 0x1A:
      *(_DWORD *)(a1 + 416) = 13;
      return 127LL;
    default:
      goto LABEL_18;
  }

  while (1)
  {
LABEL_18:
    if (*(_BYTE *)(a1 + 368))
    {
      int v14 = *(_DWORD *)(a1 + 644);
      if (v14) {
        goto LABEL_226;
      }
LABEL_316:
      if (*(int *)(a1 + 452) >= 2)
      {
        int v13 = 26;
LABEL_321:
        *(_DWORD *)(a1 + 416) = v13;
        return 255LL;
      }

      else
      {
LABEL_317:
        uint64_t result = 256LL;
        *(_DWORD *)(a1 + 344) = 256;
        *(_DWORD *)(a1 + 416) = 13;
      }

      return result;
    }

    v165 = v7;
    uint64_t v15 = 0LL;
LABEL_22:
    char v16 = 1;
LABEL_23:
    if ((v16 & 1) == 0) {
      goto LABEL_35;
    }
    int v14 = *(_DWORD *)(a1 + 644);
    if (*(_BYTE *)(a1 + 368)) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v14 == 25;
    }
    if (!v17)
    {
      int v18 = *(_DWORD *)(a1 + 356);
      int v19 = *(_DWORD *)(a1 + 56LL * v18 + 13552);
      int v20 = *(_DWORD *)(a1 + 436);
      if ((!v14 || v19 < v20 || v19 - v20 >= 1321) && (v19 < v20 || !v14 || !*(_BYTE *)(a1 + 4)))
      {
        *(_DWORD *)(a1 + 644) = v14 + 1;
        uint64_t v21 = a1 + 352 + 56LL * ((v18 + v14) % 25);
        uint64_t v15 = v21 + 13160;
        *(_DWORD *)(v21 + 13200) = v20;
        *(void *)(v21 + 13192) = a1 + 352 + 4LL * v20 + 348;
LABEL_35:
        *(_WORD *)(v15 + 44) = -1;
        *(_BYTE *)uint64_t v15 = 0;
        *(_DWORD *)(v15 + 4) = 0;
        *(_DWORD *)(v15 + 12) = 0;
        *(_DWORD *)(v15 + 16) = 0;
        int v22 = *(unsigned __int8 *)(a1 + 432);
        *(_BYTE *)(a1 + 432) = 0;
        int v23 = *(_DWORD *)(a1 + 440);
        if ((v23 - 31) < 2 || *(_DWORD *)(a1 + 24))
        {
          *(_DWORD *)(a1 + 24) = 0;
          *(_DWORD *)(v15 + 20) = 0;
          *(_WORD *)(v15 + 46) = 1;
        }

        else
        {
          *(_DWORD *)(v15 + 20) = 1;
          **(_DWORD **)(v15 + 32) = v23;
          *(_WORD *)(v15 + 46) = 0;
          if (chalu(*(_DWORD *)(a1 + 440)))
          {
            *(_WORD *)(v15 + 44) = 1;
          }

          else if (chall(*(_DWORD *)(a1 + 440)))
          {
            *(_WORD *)(v15 + 44) = 0;
          }
        }

        int v24 = 0;
        while (1)
        {
          signed int v25 = dxbin_engine_getc(a1 + 40);
          *(_DWORD *)(a1 + 440) = v25;
          if (v25 > 30)
          {
            if (v25 == 31)
            {
              *(_BYTE *)(a1 + 4) = 0;
              unsigned int v51 = 31;
              goto LABEL_139;
            }

            if (v25 == 32)
            {
LABEL_132:
              unsigned int v51 = *(_DWORD *)(a1 + 440);
              if (v51 >> 1 == 32640) {
                *(_BYTE *)(a1 + 368) = 1;
              }
LABEL_139:
              *(_DWORD *)(v15 + 24) = v51;
              *(_DWORD *)(*(void *)(v15 + 32) + 4LL * *(int *)(v15 + 20)) = 0;
              if (wcmp(v15, a1 + 472))
              {
                if (wcmp(v15, a1 + 487))
                {
                  if (wcmp(v15, a1 + 502))
                  {
                    if (wcmp(v15, a1 + 517))
                    {
                      if (wcmp(v15, a1 + 532))
                      {
                        if (wcmp(v15, a1 + 547))
                        {
                          if (wcmp(v15, a1 + 562))
                          {
                            if (wcmp(v15, a1 + 577))
                            {
                              if (wcmp(v15, a1 + 592))
                              {
                                if (wcmp(v15, a1 + 607))
                                {
                                  if (wcmp(v15, a1 + 622))
                                  {
                                    if (wcmp(v15, (uint64_t)"nwncb"))
                                    {
                                      if (wcmp(v15, (uint64_t)"cpe-l"))
                                      {
                                        if (wcmp(v15, (uint64_t)"cpe-fts"))
                                        {
                                          if (!wcmp(v15, (uint64_t)"cpe-fts-off"))
                                          {
LABEL_156:
                                            char v16 = 0;
                                            v6[1] = 0;
                                            goto LABEL_23;
                                          }

                                          if (*(_DWORD *)(a1 + 13500))
                                          {
                                            *(_BYTE *)(v15 + 48) = 0;
                                            if (*(void *)(a1 + 328)
                                              && chlwc(*(unsigned int *)(*(void *)(v15 + 32) + 4LL)) == 101
                                              && (chlwc(*(unsigned int *)(*(void *)(v15 + 32) + 8LL)) == 115
                                               || chlwc(*(unsigned int *)(*(void *)(v15 + 32) + 8LL)) == 101))
                                            {
                                              uint64_t v52 = *(void *)(v15 + 32);
                                              if (*(_DWORD *)(v52 + 12) == 126)
                                              {
                                                uint64_t v53 = 0LL;
                                                uint64_t v54 = v52 + 16;
                                                do
                                                {
                                                  unsigned int v55 = *(_DWORD *)(v54 + 4 * v53);
                                                  if (v55 <= 0x20 && ((1LL << v55) & 0x180000001LL) != 0) {
                                                    break;
                                                  }
                                                  if (v55 == 96) {
                                                    break;
                                                  }
                                                  *((_BYTE *)v170 + v53++) = v55;
                                                }

                                                while (v53 != 39);
                                                *((_BYTE *)v170 + v53) = 0;
                                                BOOL v57 = *(void (**)(uint64_t *__return_ptr, uint64_t, void *, BOOL, void))(a1 + 328);
                                                v162 = *(void *)(a1 + 336);
                                                BOOL v58 = chlwc(*(unsigned int *)(*(void *)(v15 + 32) + 8LL)) == 101;
                                                v57(v166, v162, v170, v58, 0LL);
                                                BOOL v59 = v167;
                                                if (v167)
                                                {
                                                  uint64_t v60 = *v167;
                                                  if (*v167)
                                                  {
                                                    unsigned int v61 = *(unsigned __int8 *)(v15 + 48);
                                                    do
                                                    {
                                                      if (v61) {
                                                        break;
                                                      }
                                                      if (v60 == 28)
                                                      {
                                                        char v62 = 0LL;
                                                        v163 = v59 + 1;
                                                        do
                                                        {
                                                          uint64_t v63 = v163[v62];
                                                          if (v163[v62]) {
                                                            int v64 = v63 == 31;
                                                          }
                                                          else {
                                                            int v64 = 1;
                                                          }
                                                          if (v64) {
                                                            break;
                                                          }
                                                          if (v63 == 126) {
                                                            break;
                                                          }
                                                          v168[v62++] = __tolower((char)v63);
                                                        }

                                                        while (v62 != 4);
                                                        v168[v62] = 0;
                                                        int v65 = wcapsend(a1, v168);
                                                        *(_BYTE *)(v15 + 48) = v65;
                                                        BOOL v59 = &v163[v62];
                                                        if (v65) {
                                                          break;
                                                        }
                                                      }

                                                      unsigned int v61 = 0;
                                                      int v66 = *++v59;
                                                      uint64_t v60 = v66;
                                                    }

                                                    while (v66);
                                                  }
                                                }

                                                goto LABEL_212;
                                              }
                                            }

                                            int v67 = 0LL;
                                            unsigned int v68 = 1LL;
                                            while (1)
                                            {
                                              v164 = v68;
                                              int v69 = chlwc(*(unsigned int *)(*(void *)(v15 + 32) + 4 * v67 + 4));
                                              if (v69 > 0xFF) {
                                                break;
                                              }
                                              if (v69 - 31 < 2 || v69 == 126)
                                              {
                                                int v70 = v67 + 1;
                                                goto LABEL_210;
                                              }

                                              v168[v67] = v69;
                                              unsigned int v68 = v164 + 1;
                                              if (++v67 == 4)
                                              {
                                                int v70 = 5;
                                                goto LABEL_210;
                                              }
                                            }

                                            int v70 = v164;
LABEL_210:
                                            v168[v70 - 1] = 0;
                                            char v71 = wcapsend(a1, v168);
                                          }

                                          else
                                          {
                                            char v71 = 1;
                                          }

                                          *(_BYTE *)(v15 + 48) = v71;
LABEL_212:
                                          if (*(_DWORD *)(a1 + 384)) {
                                            v72 = v22 == 0;
                                          }
                                          else {
                                            v72 = 0;
                                          }
                                          if (v72 && v24 == -1) {
                                            *(_BYTE *)uint64_t v15 = 1;
                                          }
                                          v74 = *(_DWORD *)(v15 + 20) + *(_DWORD *)(a1 + 436);
                                          if (v74 + 1 <= 1877) {
                                            uint64_t v75 = v74 + 1;
                                          }
                                          else {
                                            uint64_t v75 = 0;
                                          }
                                          *(_DWORD *)(a1 + 436) = v75;
                                          goto LABEL_22;
                                        }

                                        char v16 = 0;
                                        *BOOL v6 = 1;
                                      }

                                      else
                                      {
                                        char v16 = 0;
                                        v6[1] = 1;
                                      }
                                    }

                                    else
                                    {
                                      char v16 = 0;
                                      *(_BYTE *)(a1 + 432) = 1;
                                    }
                                  }

                                  else
                                  {
                                    char v16 = 0;
                                    *(_DWORD *)(a1 + 100) = 2;
                                  }
                                }

                                else
                                {
                                  char v16 = 0;
                                  *(_DWORD *)(a1 + 100) = 1;
                                }
                              }

                              else
                              {
                                char v16 = 0;
                                *(_DWORD *)(a1 + 100) = 0;
                              }
                            }

                            else
                            {
                              char v16 = 0;
                              *(_DWORD *)(a1 + 100) = 3;
                            }
                          }

                          else
                          {
                            char v16 = 0;
                            *(_DWORD *)(a1 + 108) = 3;
                          }
                        }

                        else
                        {
                          char v16 = 0;
                          *(_DWORD *)(a1 + 108) = 1;
                        }
                      }

                      else
                      {
                        char v16 = 0;
                        *(_DWORD *)(a1 + 108) = 0;
                      }
                    }

                    else
                    {
                      char v16 = 0;
                      *(_DWORD *)(a1 + 108) = 2;
                    }
                  }

                  else
                  {
                    char v16 = 0;
                    *(_DWORD *)(a1 + 72) = 2;
                  }
                }

                else
                {
                  char v16 = 0;
                  *(_DWORD *)(a1 + 72) = 1;
                }
              }

              else
              {
                char v16 = 0;
                *(_DWORD *)(a1 + 72) = 0;
              }

              goto LABEL_23;
            }
          }

          else if (v25 == 28)
          {
            *(_BYTE *)(a1 + 4) = 1;
          }

          int v26 = *(unsigned __int16 *)(v15 + 44);
          if (v26 != 3)
          {
            if (v26 == 2 && v25 == 96)
            {
              *(_DWORD *)(a1 + 24) = 1;
              unsigned int v51 = 96;
              goto LABEL_139;
            }

            goto LABEL_89;
          }

          int v27 = *(_DWORD *)(v15 + 20);
          if (v27 == 2) {
            goto LABEL_132;
          }
LABEL_90:
          if (*(_DWORD *)(v15 + 40) + v27 > 3198) {
            goto LABEL_132;
          }
          int v36 = *(unsigned __int16 *)(v15 + 44);
          if (v36 != 1)
          {
            if (v36 != 0xFFFF) {
              goto LABEL_111;
            }
            unsigned int v37 = *(_DWORD *)(a1 + 440);
            BOOL v38 = __OFSUB__(v27, 1);
            int v39 = v27 - 1;
            if (v37 == 23) {
              goto LABEL_111;
            }
            if (chalu(v37))
            {
              __int16 v40 = 1;
LABEL_110:
              *(_WORD *)(v15 + 44) = v40;
              goto LABEL_111;
            }

            unsigned int v41 = *(_DWORD *)(a1 + 440);
LABEL_108:
            if (!chall(v41)) {
              goto LABEL_111;
            }
            __int16 v40 = 0;
            goto LABEL_110;
          }

          unsigned int v41 = *(_DWORD *)(a1 + 440);
          BOOL v38 = __OFSUB__(v27, 1);
          int v42 = v27 - 1;
          if (v42 < 0 == v38)
          {
            goto LABEL_108;
          }

          if (v41 != 23) {
            goto LABEL_108;
          }
LABEL_111:
          int v44 = *(_DWORD *)(a1 + 440);
          uint64_t v45 = *(void *)(v15 + 32);
          uint64_t v46 = *(int *)(v15 + 20);
          *(_DWORD *)(v15 + 20) = v46 + 1;
          *(_DWORD *)(v45 + 4 * v46) = v44;
          int v47 = *(_DWORD *)(a1 + 440);
          if (v47 != 23)
          {
            int v48 = *(_DWORD *)(v15 + 20);
            if (v48 == 1 || *(_DWORD *)(v45 + 4LL * (v48 - 2)) != 23)
            {
              if (v47 == 45)
              {
                if (*(_DWORD *)(a1 + 360))
                {
                  int v49 = *(_DWORD *)(v15 + 4);
                  ++*(_DWORD *)(v15 + 8);
                  if (!v49) {
                    *(_DWORD *)(v15 + 4) = v48;
                  }
                }
              }

              if (*(_DWORD *)(a1 + 384)) {
                int v50 = v24 + 1;
              }
              else {
                int v50 = v24;
              }
              switch(v50)
              {
                case 1:
                case 4:
                  if (v47 == 64) {
                    goto LABEL_127;
                  }
                  if (v47 == 58 && !v24) {
LABEL_127:
                  }
                    int v24 = 1;
                  break;
                case 2:
                  if (v47 == 46) {
                    int v24 = 2;
                  }
                  break;
                case 3:
                  int v24 = -1;
                  break;
                default:
                  continue;
              }
            }
          }
        }

        int v27 = *(_DWORD *)(v15 + 20);
        unsigned int v28 = v27 - 1;
        if (v27 == 1)
        {
          unsigned int v29 = *(int **)(v15 + 32);
          int v30 = *v29;
          int v31 = *(_DWORD *)(a1 + 288);
          if (*v29 == v31)
          {
            if (v30 == 28)
            {
              int v32 = *(_DWORD *)&dusci[12 * v25];
            }

            else
            {
              if (v25 <= 0x7F)
              {
                if ((v25 | 2) == 0x2E) {
                  goto LABEL_89;
                }
              }

              else if (v25 != 248)
              {
                goto LABEL_89;
              }

              int v32 = *(_DWORD *)&dusci[12 * v25];
              if ((v32 & 1) != 0) {
                goto LABEL_89;
              }
            }

            if ((v32 & 2) != 0)
            {
              __int16 v33 = 2;
            }

            else
            {
              __int16 v33 = 2;
              if (v25 != 35)
              {
                unint64_t v34 = (int *)(a1 + 300);
                if (v25 != 248)
                {
                  if (v30 == 28) {
                    __int16 v33 = 2;
                  }
                  else {
                    __int16 v33 = 3;
                  }
                  if (v30 == 28) {
                    unint64_t v34 = (int *)(a1 + 300);
                  }
                  else {
                    unint64_t v34 = (int *)(a1 + 296);
                  }
                }

                goto LABEL_82;
              }
            }

            unint64_t v34 = (int *)(a1 + 300);
LABEL_82:
            *(_WORD *)(v15 + 44) = v33;
            *unsigned int v29 = *v34;
LABEL_89:
            int v27 = *(_DWORD *)(v15 + 20);
            goto LABEL_90;
          }
        }

        else
        {
          if (v27 < 1) {
            goto LABEL_90;
          }
          int v31 = *(_DWORD *)(a1 + 288);
        }

        if (*(_DWORD *)(a1 + 468) == 1 && v25 != 23 && *(_DWORD *)(*(void *)(v15 + 32) + 4LL * v28) != 23)
        {
          BOOL v35 = chall(v25);
          if (v26 == 0xFFFF)
          {
            if (v35 || chalu(*(_DWORD *)(a1 + 440))) {
              goto LABEL_132;
            }
          }

          else if (!v35 && !chalu(*(_DWORD *)(a1 + 440)) && *(_DWORD *)(a1 + 440) == 39)
          {
            goto LABEL_132;
          }
        }

        goto LABEL_89;
      }
    }

    BOOL v7 = v165;
LABEL_226:
    uint64_t v76 = *(_DWORD *)(a1 + 356);
    int v10 = (_BYTE *)(a1 + 56LL * v76 + 13512);
    *(void *)(a1 + 8) = v10;
    *(_DWORD *)(a1 + 356) = (v76 + 1) % 25;
    *(_DWORD *)(a1 + 644) = v14 - 1;
    *(_DWORD *)(a1 + 392) = 0;
    uint64_t v77 = *(unsigned __int16 *)(a1 + 56LL * v76 + 13556);
    if (v77 == 1) {
      break;
    }
    if (v77 != 3)
    {
      if (v77 == 2)
      {
        v99 = 0LL;
        if (*(void *)(a1 + 328))
        {
          v99 = 0LL;
          if (chlwc(*(unsigned int *)(*(void *)(a1 + 56LL * v76 + 13544) + 4LL)) == 101)
          {
            if (chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 8LL)) == 115
              || (v99 = 0LL, chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 8LL)) == 101))
            {
              v99 = 0LL;
              v100 = *(void *)(a1 + 8);
              v101 = *(void *)(v100 + 32);
              if (*(_DWORD *)(v101 + 12) == 126)
              {
                v102 = 0LL;
                v103 = v101 + 16;
                do
                {
                  v104 = *(_DWORD *)(v103 + 4 * v102);
                  if (v104 <= 0x20 && ((1LL << v104) & 0x180000001LL) != 0) {
                    break;
                  }
                  if (v104 == 96) {
                    break;
                  }
                  v169[v102++] = v104;
                }

                while (v102 != 39);
                v169[v102] = 0;
                v106 = *(void (**)(void *__return_ptr, uint64_t, _BYTE *, BOOL, void))(a1 + 328);
                v107 = *(void *)(a1 + 336);
                v108 = chlwc(*(unsigned int *)(*(void *)(v100 + 32) + 8LL)) == 101;
                v106(v170, v107, v169, v108, 0LL);
                v99 = (_BYTE *)v170[3];
              }
            }
          }
        }

        v109 = chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 4LL));
        v110 = 0;
        if (v109 == 108)
        {
          v111 = chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 8LL));
          v110 = 0;
          if (v111 == 103) {
            v110 = *(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 12LL) == 126;
          }
        }

        *(_BYTE *)(a1 + 389) = v110;
        if (*(int *)(a1 + 640) >= 1)
        {
          v112 = 0LL;
          do
          {
            v113 = *(void *)(a1 + 376) + 44 * v112;
            *(void *)(a1 + 16) = v113;
            if (!wcmp(*(void *)(a1 + 8), v113)
              || dxbin_code_in_str(a1 + 40, v99, *(char **)(a1 + 16), 2))
            {
              v114 = *(int *)(a1 + 356);
              v115 = a1 + 13544 + 56LL * (int)v114;
              v116 = v114 + 1;
              while (*(__int16 *)(v115 + 12) > 1)
              {
                v115 += 56LL;
                BOOL v17 = (_DWORD)v116++ == 25;
                if (v17) {
                  goto LABEL_298;
                }
              }

              if (**(_DWORD **)v115 != 95)
              {
LABEL_298:
                v117 = *(void *)(a1 + 16);
                v118 = *(_DWORD *)(v117 + 36);
                if (v118)
                {
                  else {
                    v119 = 2;
                  }
                  v117 = *(void *)(a1 + 16);
                }

                else
                {
                  v119 = 1;
                }

                *(_DWORD *)(v117 + 40) = v119;
              }
            }

            ++v112;
          }

          while (v112 < *(int *)(a1 + 640));
        }

        if (*(_DWORD *)(a1 + 320))
        {
          v120 = dxbin_code_in_str(a1 + 40, v99, "cb", 0);
          v121 = 0;
          if (v120) {
            goto LABEL_311;
          }
          if (chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 4LL)) == 99)
          {
            v122 = chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 8LL));
            v121 = 0;
            if (v122 == 98) {
              goto LABEL_311;
            }
          }

          v123 = dxbin_code_in_str(a1 + 40, v99, "tx", 0);
          v121 = 1;
          if (v123
            || chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 4LL)) == 116
            && (v146 = chlwc(*(unsigned int *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 8LL)), v121 = 1, v146 == 120))
          {
LABEL_311:
            *(_DWORD *)(a1 + 468) = v121;
          }
        }
      }

LABEL_365:
      v147 = *(int *)(a1 + 392);
      *(_DWORD *)(a1 + 392) = v147 + 1;
      uint64_t v12 = *(void *)(a1 + 8);
      if ((int)v147 < *(_DWORD *)(v12 + 20))
      {
        if ((int)v147 < 4 || *(_BYTE *)(a1 + 389) == 0)
        {
          v149 = *(_DWORD *)(a1 + 456);
          if (v149 == 1)
          {
            v152 = chlwc(*(unsigned int *)(*(void *)(v12 + 32) + 4 * v147));
            uint64_t v12 = *(void *)(a1 + 8);
            *(_DWORD *)(*(void *)(v12 + 32) + 4LL * *(int *)(a1 + 392) - 4) = v152;
          }

          else if (!v149)
          {
            v150 = *(void *)(v12 + 32);
            v151 = *(_DWORD *)(v150 + 4 * v147);
            if (v151 >= *(_DWORD *)(a1 + 408) && v151 <= *(_DWORD *)(a1 + 404)) {
              *(_DWORD *)(v150 + 4 * v147) = v151 - 32;
            }
          }
        }

        *(_DWORD *)(a1 + 448) = *(_DWORD *)(*(void *)(v12 + 32) + 4LL * *(int *)(a1 + 392) - 4);
        v83 = 5;
        goto LABEL_409;
      }

      goto LABEL_260;
    }

    v124 = *(_DWORD **)(a1 + 56LL * v76 + 13544);
    if (v124[1] != 36) {
      goto LABEL_365;
    }
    *v124 = *(_DWORD *)(a1 + 288);
    *(_DWORD *)(a1 + 56LL * v76 + 13532) = 1;
    *(_WORD *)(a1 + 56LL * v76 + 13556) = 0;
    *(_BYTE *)(a1 + 412) = 0;
LABEL_255:
    uint64_t v12 = *(void *)(a1 + 8);
    v95 = *(_DWORD *)(a1 + 392);
    v96 = *(_DWORD *)(v12 + 20);
    if (*(_DWORD *)(v12 + 16)) {
      v97 = v95 == v96;
    }
    else {
      v97 = 0;
    }
    if (v97)
    {
      *(_DWORD *)(a1 + 416) = 10;
      *(_DWORD *)(v12 + 12) = 0;
      *(_DWORD *)(v12 + 16) = 0;
      *(_DWORD *)(a1 + 448) = *(_DWORD *)(a1 + 364);
      goto LABEL_16;
    }

    if (v95 != v96)
    {
      v127 = *(void *)(v12 + 32);
      v128 = v95 + 1;
      *(_DWORD *)(a1 + 392) = v95 + 1;
      v129 = *(_DWORD *)(v127 + 4LL * v95);
      *(_DWORD *)(a1 + 444) = v129;
      if (v129 == 23 && v128 < v96)
      {
        *(_DWORD *)(a1 + 392) = v95 + 2;
        v131 = *(int *)(a1 + 656);
        if ((int)v131 <= 39)
        {
          v144 = *(_DWORD *)(v127 + 4LL * v128);
          *(_DWORD *)(a1 + 656) = v131 + 1;
          *(_BYTE *)(a1 + v131 + 660) = v144;
          v132 = *(_DWORD *)(a1 + 444);
        }

        else
        {
          v132 = 23;
        }

        *(_DWORD *)(a1 + 448) = v132;
        goto LABEL_408;
      }

      if (v128 == v96 && *(_BYTE *)v12 && (v129 | 2) == 0x2E)
      {
        *(_DWORD *)(a1 + 416) = 10;
        *(_BYTE *)uint64_t v12 = 0;
        *(_DWORD *)(a1 + 392) = v95;
LABEL_325:
        v126 = "\x0E/c\x0F";
        return queue_addstr(v2, v126);
      }

      v133 = *(int *)(v12 + 4);
      if ((_DWORD)v133)
      {
        if (chall(*(_DWORD *)(v127 + 4 * v133))
          || chalu(*(_DWORD *)(*(void *)(*(void *)(a1 + 8) + 32LL) + 4LL * *(int *)(*(void *)(a1 + 8) + 4LL))))
        {
          hyp = get_hyp(*(void *)(a1 + 8));
          uint64_t v12 = *(void *)(a1 + 8);
          *(_DWORD *)(v12 + 12) = hyp;
        }

        else
        {
          uint64_t v12 = *(void *)(a1 + 8);
        }
      }

      v135 = *(_DWORD *)(v12 + 12);
      if (v135 <= 1)
      {
        if (*(int *)(v12 + 8) < 2)
        {
LABEL_378:
          *(_DWORD *)(v12 + 12) = 0;
          *(_DWORD *)(v12 + 4) = 0;
          goto LABEL_379;
        }

        while (v135 <= 1)
        {
          v136 = *(_DWORD *)(v12 + 4);
          v137 = *(_DWORD *)(v12 + 20);
          if (v136 < v137)
          {
            v138 = (int *)(*(void *)(v12 + 32) + 4LL * v136);
            while (1)
            {
              v139 = *v138++;
              if (v139 == 45) {
                break;
              }
              if (v137 == ++v136) {
                goto LABEL_351;
              }
            }

            *(_DWORD *)(v12 + 4) = v136 + 1;
          }

LABEL_351:
          v135 = get_hyp(v12);
          uint64_t v12 = *(void *)(a1 + 8);
          v140 = *(_DWORD *)(v12 + 8);
          BOOL v38 = __OFSUB__(v140--, 1);
          *(_DWORD *)(v12 + 8) = v140;
          *(_DWORD *)(v12 + 12) = v135;
          if ((v140 < 0) ^ v38 | (v140 == 0))
          {
            if (v135 < 2) {
              goto LABEL_378;
            }
            break;
          }
        }
      }

      v141 = *(_DWORD *)(v12 + 4);
      if (v141)
      {
        v142 = *(_DWORD *)(a1 + 392);
        if (v142 == v141 - v135)
        {
          *(_DWORD *)(v12 + 16) = v141;
          *(_DWORD *)(v12 + 4) = 0;
          *(_DWORD *)(a1 + 416) = 10;
          v143 = *(_DWORD *)(a1 + 360);
LABEL_362:
          *(_DWORD *)(a1 + 448) = v143;
          *(_DWORD *)(a1 + 392) = v142 - 1;
          goto LABEL_16;
        }
      }

      v145 = *(_DWORD *)(v12 + 16);
      if (v145)
      {
        v142 = *(_DWORD *)(a1 + 392);
        if (v142 == v135 + v145 + 1)
        {
          *(void *)(v12 + 12) = 0LL;
          *(_DWORD *)(a1 + 416) = 10;
          v143 = *(_DWORD *)(a1 + 364);
          goto LABEL_362;
        }
      }

LABEL_379:
      v153 = *(unsigned __int8 *)(a1 + 412);
      v154 = *(_DWORD *)(a1 + 460);
      if (*(_BYTE *)(a1 + 412))
      {
        if (v154 <= 1)
        {
          if (!chall(*(_DWORD *)(a1 + 444)))
          {
            if (*(_DWORD *)(a1 + 468) == 1
              && !chalu(*(_DWORD *)(a1 + 444))
              && !chcmb(*(_DWORD *)(a1 + 444))
              && *(_BYTE *)(a1 + 412) == 1)
            {
              *(_BYTE *)(a1 + 412) = 0;
            }

            goto LABEL_399;
          }

          v153 = *(unsigned __int8 *)(a1 + 412);
        }

        if (v153 == 1) {
          *(_BYTE *)(a1 + 412) = 0;
        }
        v155 = *(_DWORD *)(a1 + 304);
        if (v155) {
          goto LABEL_386;
        }
      }

      else if (v154 <= 1 && chalu(*(_DWORD *)(a1 + 444)) && *(_BYTE *)(a1 + 388))
      {
        v156 = *(_DWORD *)(a1 + 392);
        v157 = *(void *)(a1 + 8);
        if (v156 != *(_DWORD *)(v157 + 20) && (*(_DWORD *)(a1 + 460) > 1u || !nmucc(v157, v156)))
        {
          v160 = *(_DWORD *)(a1 + 292);
          *(_DWORD *)(a1 + 448) = v160;
          *(_DWORD *)(a1 + 416) = 9;
          *(_BYTE *)(a1 + 412) = 1;
          v161 = *(int *)(a1 + 656);
          if ((int)v161 <= 39)
          {
            *(_DWORD *)(a1 + 656) = v161 + 1;
            *(_BYTE *)(a1 + v161 + 660) = v160;
          }

          goto LABEL_16;
        }

        v155 = *(_DWORD *)(a1 + 292);
LABEL_386:
        *(_DWORD *)(a1 + 448) = v155;
        v83 = 9;
        goto LABEL_409;
      }

LABEL_399:
      v158 = *(_DWORD *)(a1 + 460);
      if (v158)
      {
        if (v158 != 1)
        {
          v159 = *(_DWORD *)(a1 + 444);
          goto LABEL_407;
        }

        v159 = chlwc(*(unsigned int *)(a1 + 444));
      }

      else
      {
        v159 = *(_DWORD *)(a1 + 444);
        if (v159 < *(_DWORD *)(a1 + 408) || v159 > *(_DWORD *)(a1 + 404)) {
          goto LABEL_407;
        }
        v159 -= 32;
      }

      *(_DWORD *)(a1 + 444) = v159;
LABEL_407:
      *(_DWORD *)(a1 + 448) = v159;
LABEL_408:
      v83 = 10;
      goto LABEL_409;
    }

LABEL_260:
    if (*(_BYTE *)(a1 + 412) == 2 && looklc(a1, 1))
    {
      *(_DWORD *)(a1 + 448) = *(_DWORD *)(a1 + 304);
      *(_DWORD *)(a1 + 416) = 15;
      *(_BYTE *)(a1 + 412) = 0;
      goto LABEL_16;
    }

LABEL_262:
    if (*(_BYTE *)v12)
    {
      *(_DWORD *)(a1 + 416) = 15;
      *(_BYTE *)uint64_t v12 = 0;
      goto LABEL_325;
    }

    *(_BYTE *)(a1 + 348) = 1;
    v98 = *(_DWORD *)(v12 + 24);
    if (v98 == 96)
    {
LABEL_266:
      *(_DWORD *)(a1 + 448) = v98;
      *(_BYTE *)(a1 + 389) = 0;
      v83 = 4;
      goto LABEL_409;
    }
  }

  v78 = *(_DWORD *)(a1 + 13500);
  if (v78 && *(_BYTE *)(a1 + 412) != 2 && !looklc(a1, v78))
  {
    *(_BYTE *)(a1 + 412) = 2;
    uint64_t v79 = *(_DWORD *)(a1 + 292);
    *(_DWORD *)(a1 + 448) = v79;
    if (*(int *)(a1 + 656) <= 38)
    {
      uint64_t v80 = -2;
      do
      {
        uint64_t v81 = *(int *)(a1 + 656);
        *(_DWORD *)(a1 + 656) = v81 + 1;
        *(_BYTE *)(a1 + v81 + 660) = v79;
      }

      while (!__CFADD__(v80++, 1));
    }

    v83 = 6;
    goto LABEL_409;
  }

LABEL_236:
  if (*(_BYTE *)(a1 + 412) == 1) {
    *(_BYTE *)(a1 + 412) = 0;
  }
LABEL_238:
  if (*v10)
  {
    *(_DWORD *)(a1 + 416) = 11;
    v126 = "\x0Ec\x0F";
    return queue_addstr(v2, v126);
  }

LABEL_239:
  unint64_t v84 = *(_DWORD *)(a1 + 640);
  if (v84 < 1)
  {
LABEL_244:
    unint64_t v88 = *(int *)(a1 + 352);
    if ((int)v88 < v84)
    {
      v89 = v88 + 1;
      v90 = 44LL * (int)v88;
      while (1)
      {
        v91 = *(void *)(a1 + 376);
        v92 = v91 + v90;
        *(void *)(a1 + 16) = v91 + v90;
        v93 = *(_DWORD *)(v91 + v90 + 40);
        if (*(_WORD *)(*(void *)(a1 + 8) + 46LL) && v93 == 1) {
          break;
        }
        if (v93 == 3)
        {
          if (lookcw(a1, (char *)(v91 + v90 + 15), 1))
          {
            v125 = *(void *)(a1 + 16);
            *(_DWORD *)(a1 + 448) = *(_DWORD *)(v125 + 32);
            *(_DWORD *)(v125 + 40) = 0;
            *(_DWORD *)(a1 + 352) = v89;
            goto LABEL_319;
          }

          unint64_t v84 = *(_DWORD *)(a1 + 640);
        }

        ++v88;
        ++v89;
        v90 += 44LL;
        if (v88 >= v84) {
          goto LABEL_254;
        }
      }

      *(_DWORD *)(a1 + 448) = *(_DWORD *)(v92 + 32);
      *(_DWORD *)(a1 + 352) = v89;
LABEL_319:
      v83 = 11;
      goto LABEL_409;
    }

LABEL_254:
    *(_DWORD *)(a1 + 352) = 0;
    goto LABEL_255;
  }

  v85 = *(void *)(a1 + 376);
  size_t v86 = v85 + 44LL * (v84 - 1);
  v87 = *(unsigned int *)(a1 + 640);
  while (*(_DWORD *)(v85 + 40) != 2)
  {
    v85 += 44LL;
    if (!--v87)
    {
      *(void *)(a1 + 16) = v86;
      goto LABEL_244;
    }
  }

  *(void *)(a1 + 16) = v85;
  *(_DWORD *)(a1 + 448) = *(_DWORD *)(v85 + 32);
  v83 = 12;
LABEL_409:
  *(_DWORD *)(a1 + 416) = v83;
LABEL_16:
  if (!chdids(*(_DWORD *)(a1 + 448), 0, v7)) {
    return *v7;
  }
  *(_DWORD *)(a1 + 400) = *(_DWORD *)(a1 + 416);
  *(_DWORD *)(a1 + 416) = 3;
  *(_DWORD *)(a1 + 396) = 1;
  return *(unsigned int *)(a1 + 344);
}

                                                    if (*v110)
                                                    {
LABEL_255:
                                                      v113 = "pi";
                                                      if (*a2)
                                                      {
                                                        v114 = 0LL;
                                                        v115 = *a2;
                                                        while (v114 != 2)
                                                        {
                                                          v115 = a2[++v114];
                                                          if (!v115)
                                                          {
                                                            v113 = &aPi[v114];
                                                            goto LABEL_261;
                                                          }
                                                        }

                                                        return 1LL;
                                                      }

uint64_t looklc(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 644);
  if (!v2) {
    return 1LL;
  }
  int v3 = 0;
  for (int i = *(_DWORD *)(a1 + 356); ; ++i)
  {
    if (*(__int16 *)(a1 + 56LL * (i % 25) + 13556) > 1)
    {
      if (*(_BYTE *)(a1 + 56LL * (i % 25) + 13560)) {
        return 1LL;
      }
      goto LABEL_10;
    }

    if (*(_WORD *)(a1 + 56LL * (i % 25) + 13556) != 1)
    {
      if (!*(_WORD *)(a1 + 56LL * (i % 25) + 13556)) {
        return 1LL;
      }
      goto LABEL_10;
    }

    if (++v3 == a2) {
      break;
    }
LABEL_10:
    if (!--v2) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t wcmp(uint64_t a1, uint64_t a2)
{
  if (*(int *)(a1 + 20) < 1)
  {
    unsigned int v5 = 0;
LABEL_10:
    int v9 = 0;
    return v5 - v9;
  }

  uint64_t v4 = *(void *)(a1 + 32);
  unsigned int v5 = chlwc(*(unsigned int *)(v4 + 4));
  if (v5 > 0xFF) {
    goto LABEL_10;
  }
  uint64_t v6 = 0LL;
  uint64_t v7 = v4 + 8;
  while (1)
  {
    unsigned __int8 v8 = __tolower(*(char *)(a2 + v6));
    if (v5 != v8)
    {
LABEL_8:
      int v9 = (char)v8;
      return v5 - v9;
    }

    if (!v5) {
      return 0LL;
    }
    if ((int)v6 + 1 < *(_DWORD *)(a1 + 20))
    {
      unsigned int v5 = chlwc(*(unsigned int *)(v7 + 4 * v6++));
      if (v5 <= 0xFF) {
        continue;
      }
    }

    goto LABEL_8;
  }

uint64_t lookcw(uint64_t a1, char *a2, int a3)
{
  int v5 = 0;
  int v6 = 0;
  uint64_t v20 = a1 + 40;
  int v7 = *(_DWORD *)(a1 + 644);
  while (v5 != v7)
  {
    int v8 = *(_DWORD *)(a1 + 356) + v5++;
    uint64_t v9 = v8 % 25;
    int v10 = *(__int16 *)(a1 + 56 * v9 + 13556);
    if (v10 > 1)
    {
      if (v10 == 2)
      {
        if (*(void *)(a1 + 328))
        {
          uint64_t v11 = a1 + 56LL * (int)v9;
          if (chlwc(*(unsigned int *)(*(void *)(v11 + 13544) + 4LL)) == 101)
          {
            uint64_t v12 = v11 + 13544;
            if (chlwc(*(unsigned int *)(*(void *)v12 + 8LL)) == 101
              && *(_DWORD *)(*(void *)v12 + 12LL) == 126)
            {
              uint64_t v13 = 0LL;
              uint64_t v14 = *(void *)v12 + 16LL;
              do
              {
                unsigned int v15 = *(_DWORD *)(v14 + 4 * v13);
                if (v15 <= 0x20 && ((1LL << v15) & 0x180000001LL) != 0) {
                  break;
                }
                if (v15 == 96) {
                  break;
                }
                v22[v13++] = v15;
              }

              while (v13 != 39);
              v22[v13] = 0;
              uint64_t v18 = 1LL;
              (*(void (**)(void *__return_ptr, void, _BYTE *, uint64_t, void))(a1 + 328))( v21,  *(void *)(a1 + 336),  v22,  1LL,  0LL);
            }
          }
        }

        int v7 = *(_DWORD *)(a1 + 644);
      }
    }

    else if (*(_WORD *)(a1 + 56LL * (int)v9 + 13558))
    {
      if (++v6 == a3) {
        return 0LL;
      }
    }
  }

  return 1LL;
}

uint64_t queue_addstr(char *a1, char *__s)
{
  int v4 = strlen(__s);
  uint64_t v5 = *((int *)a1 + 2);
  strcpy(&a1[v5 + 12], __s);
  int v7 = *((_DWORD *)a1 + 2) + v4;
  *((_DWORD *)a1 + 2) = v7;
  uint64_t v8 = *(int *)a1;
  uint64_t result = a1[v8 + 12];
  *((_DWORD *)a1 + 2) = v7 - 1;
  *(_DWORD *)a1 = v8 + 1;
  return result;
}

uint64_t get_hyp(uint64_t a1)
{
  unsigned int v2 = *(_DWORD *)(a1 + 4);
  unsigned int v3 = *(_DWORD *)(a1 + 20) - v2;
  int v4 = v3 + 1;
  unsigned int v5 = v3 + 2;
  else {
    uint64_t v6 = v5;
  }
  if ((int)v6 >= 2)
  {
    int v7 = -2;
    for (uint64_t i = 1LL; i != v6; ++i)
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      do
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = *(void *)(a1 + 32);
        uint64_t v14 = *(int *)(a1 + 4);
        uint64_t v15 = v11;
        int v16 = v7 + v11 + v14;
        while (1)
        {
          uint64_t v17 = *(unsigned int *)(v13 + 4LL * (v16 + (int)v12));
          if ((_DWORD)v17 != 23) {
            break;
          }
          v12 += 2LL;
          if (v15 + v12 >= i) {
            goto LABEL_23;
          }
        }

        uint64_t v18 = v10;
        while (*(_DWORD *)(v13 + 4 * v14 + 4 * v18) == 23)
        {
          v18 += 2LL;
        }

        int v19 = chlwc(v17);
        if (v19 != chlwc(*(unsigned int *)(*(void *)(a1 + 32) + 4LL * (*(_DWORD *)(a1 + 4) + (int)v18)))
          || chlwc(*(unsigned int *)(*(void *)(a1 + 32)
                                                 + 4LL * (*(_DWORD *)(a1 + 4) + v7 + (int)v15 + (int)v12))) == 45
          || !chall(*(_DWORD *)(*(void *)(a1 + 32) + 4LL * (*(_DWORD *)(a1 + 4) + v7 + (int)v15 + (int)v12)))
          && !chalu(*(_DWORD *)(*(void *)(a1 + 32) + 4LL * (*(_DWORD *)(a1 + 4) + v7 + (int)v15 + (int)v12))))
        {
          int v9 = 1;
        }

        int v11 = v12 + v15 + 1;
        int v10 = v18 + 1;
      }

      while (i > v11);
LABEL_23:
      if (!v9) {
        *(_DWORD *)(a1 + 12) = i;
      }
      --v7;
    }
  }

  return *(unsigned int *)(a1 + 12);
}

BOOL nmucc(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 20);
  if (v2 <= a2) {
    return 0LL;
  }
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = a2;
  unsigned int v6 = *(_DWORD *)(v4 + 4LL * a2);
  if (v6 == 23)
  {
    uint64_t v5 = a2 + 2LL;
    unsigned int v6 = *(_DWORD *)(v4 + 4 * v5);
  }

  if (chalu(v6)) {
    return 0LL;
  }
  return !chcmb(*(_DWORD *)(*(void *)(a1 + 32) + 4 * v5));
}

uint64_t read_bscpc(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = dxtbl_lintbl_read(a1, __s, 4uLL);
  if (!(_DWORD)v3)
  {
    int v4 = strlen(__s);
    *(_DWORD *)(a2 + 80) = v4;
    memmove((void *)(a2 + 76), __s, v4);
  }

  return v3;
}

uint64_t readfonts(uint64_t a1, uint64_t a2)
{
  int v4 = (unsigned int *)(a2 + 288);
  dxtbl_lintbl_readint(a1, 0, 0x7FFFFFFF, (int *)(a2 + 288));
  int v5 = *(_DWORD *)(a2 + 288);
  if (v5)
  {
    *(void *)(a2 + 24) = malloc(44LL * v5);
    if (v5 >= 1)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      do
      {
        uint64_t v8 = *(void *)(a2 + 24) + v6;
        dxtbl_lintbl_read(a1, v12, 0x28uLL);
        if (sscanf(v12, "%s %s %d %d", v8, v8 + 15, v8 + 36, v8 + 32) < 4) {
          return 1LL;
        }
        ++v7;
        v6 += 44LL;
      }

      while (v7 < (int)*v4);
      uint64_t v9 = *v4;
      if ((int)v9 >= 1)
      {
        int v10 = (_DWORD *)(*(void *)(a2 + 24) + 40LL);
        do
        {
          _DWORD *v10 = 0;
          v10 += 11;
          --v9;
        }

        while (v9);
      }
    }
  }

  return 0LL;
}

uint64_t wcapsend(uint64_t a1, _BYTE *a2)
{
  int v2 = *a2;
  uint64_t v3 = "#";
  if (*a2)
  {
    uint64_t v4 = 0LL;
    int v5 = *a2;
    while (v4 != 1)
    {
      int v5 = a2[++v4];
      if (!v5)
      {
        uint64_t v3 = &asc_33101[v4];
        goto LABEL_7;
      }
    }

    return 1LL;
  }

LABEL_14:
  if (*v6)
  {
LABEL_15:
    uint64_t v9 = ";";
    if (*a2)
    {
      uint64_t v10 = 0LL;
      int v11 = *a2;
      while (v10 != 1)
      {
        int v11 = a2[++v10];
        if (!v11)
        {
          uint64_t v9 = &asc_33105[v10];
          goto LABEL_21;
        }
      }

      return 1LL;
    }

LABEL_21:
    if (!*v9) {
      return 1LL;
    }
LABEL_22:
    uint64_t v12 = "<";
    if (*a2)
    {
      uint64_t v13 = 0LL;
      int v14 = *a2;
      while (v13 != 1)
      {
        int v14 = a2[++v13];
        if (!v14)
        {
          uint64_t v12 = &asc_33107[v13];
          goto LABEL_28;
        }
      }

      return 1LL;
    }

LABEL_28:
    if (*v12)
    {
LABEL_29:
      uint64_t v15 = ">";
      if (*a2)
      {
        uint64_t v16 = 0LL;
        int v17 = *a2;
        while (v16 != 1)
        {
          int v17 = a2[++v16];
          if (!v17)
          {
            uint64_t v15 = &asc_33109[v16];
            goto LABEL_35;
          }
        }

        return 1LL;
      }

LABEL_35:
      if (!*v15) {
        return 1LL;
      }
LABEL_36:
      uint64_t v18 = "aln";
      if (*a2)
      {
        uint64_t v19 = 0LL;
        int v20 = *a2;
        while (v19 != 3)
        {
          int v20 = a2[++v19];
          if (!v20)
          {
            uint64_t v18 = &aAln[v19];
            goto LABEL_42;
          }
        }

        return 1LL;
      }

LABEL_56:
        if (*v24)
        {
LABEL_57:
          int v27 = "cp";
          if (*a2)
          {
            uint64_t v28 = 0LL;
            int v29 = *a2;
            while (v28 != 2)
            {
              int v29 = a2[++v28];
              if (!v29)
              {
                int v27 = &aCp[v28];
                goto LABEL_63;
              }
            }

            return 1LL;
          }

LABEL_63:
          if (!*v27) {
            return 1LL;
          }
LABEL_64:
          int v30 = "cu";
          if (*a2)
          {
            uint64_t v31 = 0LL;
            int v32 = *a2;
            while (v31 != 2)
            {
              int v32 = a2[++v31];
              if (!v32)
              {
                int v30 = &aCu[v31];
                goto LABEL_70;
              }
            }

            return 1LL;
          }

LABEL_70:
          if (*v30)
          {
LABEL_71:
            __int16 v33 = "cz";
            if (*a2)
            {
              uint64_t v34 = 0LL;
              int v35 = *a2;
              while (v34 != 2)
              {
                int v35 = a2[++v34];
                if (!v35)
                {
                  __int16 v33 = &aCz[v34];
                  goto LABEL_77;
                }
              }

              return 1LL;
            }

LABEL_77:
            if (!*v33) {
              return 1LL;
            }
LABEL_78:
            int v36 = "d";
            if (*a2)
            {
              uint64_t v37 = 0LL;
              int v38 = *a2;
              while (v37 != 1)
              {
                int v38 = a2[++v37];
                if (!v38)
                {
                  int v36 = &aD[v37];
                  goto LABEL_84;
                }
              }

              return 1LL;
            }

LABEL_84:
            if (*v36)
            {
LABEL_85:
              int v39 = "fc";
              if (*a2)
              {
                uint64_t v40 = 0LL;
                int v41 = *a2;
                while (v40 != 2)
                {
                  int v41 = a2[++v40];
                  if (!v41)
                  {
                    int v39 = &aFc[v40];
                    goto LABEL_91;
                  }
                }

                return 1LL;
              }

LABEL_98:
              if (*v42)
              {
LABEL_99:
                if (!*(_BYTE *)(a1 + 13504)) {
                  goto LABEL_114;
                }
                uint64_t v45 = "fte";
                if (*a2)
                {
                  uint64_t v46 = 0LL;
                  int v47 = *a2;
                  while (v46 != 3)
                  {
                    int v47 = a2[++v46];
                    if (!v47)
                    {
                      uint64_t v45 = &aFte[v46];
                      goto LABEL_106;
                    }
                  }

                  return 1LL;
                }

LABEL_106:
                if (!*v45) {
                  return 1LL;
                }
LABEL_107:
                int v48 = "fts";
                if (*a2)
                {
                  uint64_t v49 = 0LL;
                  int v50 = *a2;
                  while (v49 != 3)
                  {
                    int v50 = a2[++v49];
                    if (!v50)
                    {
                      int v48 = &aFts[v49];
                      goto LABEL_113;
                    }
                  }

                  return 1LL;
                }

            uint64_t v61 = v218;
          }

          int v29 = v61 + 1;
          int v217 = 1;
          uint64_t v28 = v59;
          goto LABEL_54;
        }

        uint64_t v28 = v219;
        if ((_DWORD)v33 != (_DWORD)v219)
        {
          uint64_t v60 = v217;
          if (v29 == v218 + 1) {
            uint64_t v28 = v219;
          }
          else {
            uint64_t v28 = (v219 + 1);
          }
          if (v29 == v218 + 1) {
            uint64_t v60 = 1;
          }
          int v217 = v60;
          int v29 = v218 + 1;
          goto LABEL_54;
        }
      }
    }

    uint64_t v18 = 0;
    *(_DWORD *)(v8 + 34004) = 0;
    *(_DWORD *)(v8 + 32340) = 0;
    do
    {
      *(_DWORD *)(v8 + 4LL * v18 + 32344) = *(_DWORD *)(v8 + 4LL * v18 + 34012);
      uint64_t v19 = *(_DWORD *)(v8 + 32340);
      uint64_t v18 = v19 + 1;
      *(_DWORD *)(v8 + 32340) = v19 + 1;
    }

    while (v19 < 63);
    int v20 = *(int *)(v8 + 34008);
    *(_DWORD *)(v8 + 32340) = v20;
    uint64_t v16 = *(_DWORD *)(v8 + 4 * v20 + 32344);
    if (!*(_DWORD *)(v8 + 30792))
    {
      while (v16 == 23)
      {
        ttmark(v8);
        uint64_t v16 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344);
      }
    }

    uint64_t v21 = *(_DWORD *)(v8 + 34360);
    if ((v21 & 0x80000000) == 0)
    {
      ttgesp(v8, 1, v21);
      *(_DWORD *)(v8 + 34360) = -2;
    }
  }

  stacq(v8, 256);
  if ((unint64_t)*v214 <= 8)
  {
    v203 = &v214[3 * *v214];
    *(v203 - 2) = *(void *)(v8 + 32888);
    *(v203 - 1) = *(void *)(v8 + 32896);
  }

  return 0LL;
}

LABEL_113:
                if (*v48)
                {
LABEL_114:
                  unsigned int v51 = "gd";
                  if (*a2)
                  {
                    uint64_t v52 = 0LL;
                    int v53 = *a2;
                    while (v52 != 2)
                    {
                      int v53 = a2[++v52];
                      if (!v53)
                      {
                        unsigned int v51 = &aGd[v52];
                        goto LABEL_120;
                      }
                    }

                    return 1LL;
                  }

LABEL_120:
                  if (*v51)
                  {
LABEL_121:
                    uint64_t v54 = "h";
                    if (*a2)
                    {
                      uint64_t v55 = 0LL;
                      int v56 = *a2;
                      while (v55 != 1)
                      {
                        int v56 = a2[++v55];
                        if (!v56)
                        {
                          uint64_t v54 = &aH[v55];
                          goto LABEL_127;
                        }
                      }

                      return 1LL;
                    }

LABEL_127:
                    if (*v54)
                    {
LABEL_128:
                      BOOL v57 = "if";
                      if (*a2)
                      {
                        uint64_t v58 = 0LL;
                        int v59 = *a2;
                        while (v58 != 2)
                        {
                          int v59 = a2[++v58];
                          if (!v59)
                          {
                            BOOL v57 = &aIf[v58];
                            goto LABEL_134;
                          }
                        }

                        return 1LL;
                      }

LABEL_141:
                        if (*v60)
                        {
LABEL_142:
                          uint64_t v63 = "ind";
                          if (*a2)
                          {
                            uint64_t v64 = 0LL;
                            int v65 = *a2;
                            while (v64 != 3)
                            {
                              int v65 = a2[++v64];
                              if (!v65)
                              {
                                uint64_t v63 = &aInd[v64];
                                goto LABEL_148;
                              }
                            }

                            return 1LL;
                          }

LABEL_148:
                          if (*v63)
                          {
LABEL_149:
                            int v66 = "iq";
                            if (*a2)
                            {
                              uint64_t v67 = 0LL;
                              int v68 = *a2;
                              while (v67 != 2)
                              {
                                int v68 = a2[++v67];
                                if (!v68)
                                {
                                  int v66 = &aIq[v67];
                                  goto LABEL_155;
                                }
                              }

                              return 1LL;
                            }

LABEL_155:
                            if (*v66)
                            {
LABEL_156:
                              int v69 = "kb";
                              if (*a2)
                              {
                                uint64_t v70 = 0LL;
                                int v71 = *a2;
                                while (v70 != 2)
                                {
                                  int v71 = a2[++v70];
                                  if (!v71)
                                  {
                                    int v69 = &aKb[v70];
                                    goto LABEL_162;
                                  }
                                }

                                return 1LL;
                              }

LABEL_162:
                              if (*v69)
                              {
LABEL_163:
                                v72 = "kd";
                                if (*a2)
                                {
                                  uint64_t v73 = 0LL;
                                  int v74 = *a2;
                                  while (v73 != 2)
                                  {
                                    int v74 = a2[++v73];
                                    if (!v74)
                                    {
                                      v72 = &aKd[v73];
                                      goto LABEL_169;
                                    }
                                  }

                                  return 1LL;
                                }

LABEL_169:
                                if (*v72)
                                {
LABEL_170:
                                  uint64_t v75 = "kp";
                                  if (*a2)
                                  {
                                    uint64_t v76 = 0LL;
                                    int v77 = *a2;
                                    while (v76 != 2)
                                    {
                                      int v77 = a2[++v76];
                                      if (!v77)
                                      {
                                        uint64_t v75 = &aKp[v76];
                                        goto LABEL_176;
                                      }
                                    }

                                    return 1LL;
                                  }

LABEL_176:
                                  if (*v75)
                                  {
LABEL_177:
                                    if (*(_BYTE *)(a1 + 13505))
                                    {
                                      if (*a2)
                                      {
                                        v78 = a2 + 1;
                                        uint64_t v79 = "l";
                                        int v80 = *a2;
                                        while (v80 == *(unsigned __int8 *)v79)
                                        {
                                          ++v79;
                                          int v81 = *v78++;
                                          int v80 = v81;
                                          if (!v81) {
                                            goto LABEL_184;
                                          }
                                        }
                                      }

                                      else
                                      {
                                        uint64_t v79 = "l";
LABEL_184:
                                        if (!*v79) {
                                          return 1LL;
                                        }
                                      }
                                    }

                                    v82 = "ld";
                                    if (*a2)
                                    {
                                      uint64_t v83 = 0LL;
                                      int v84 = *a2;
                                      while (v83 != 2)
                                      {
                                        int v84 = a2[++v83];
                                        if (!v84)
                                        {
                                          v82 = &aLd[v83];
                                          goto LABEL_191;
                                        }
                                      }

                                      return 1LL;
                                    }

LABEL_191:
                                    if (*v82)
                                    {
LABEL_192:
                                      v85 = "lg";
                                      if (*a2)
                                      {
                                        uint64_t v86 = 0LL;
                                        int v87 = *a2;
                                        while (v86 != 2)
                                        {
                                          int v87 = a2[++v86];
                                          if (!v87)
                                          {
                                            v85 = &aLg[v86];
                                            goto LABEL_198;
                                          }
                                        }

                                        return 1LL;
                                      }

LABEL_198:
                                      if (*v85)
                                      {
LABEL_199:
                                        unint64_t v88 = "line";
                                        if (*a2)
                                        {
                                          uint64_t v89 = 0LL;
                                          int v90 = *a2;
                                          while (v89 != 4)
                                          {
                                            int v90 = a2[++v89];
                                            if (!v90)
                                            {
                                              unint64_t v88 = &aLine[v89];
                                              goto LABEL_205;
                                            }
                                          }

                                          return 1LL;
                                        }

LABEL_205:
                                        if (*v88)
                                        {
LABEL_206:
                                          v91 = "lnb";
                                          if (*a2)
                                          {
                                            uint64_t v92 = 0LL;
                                            int v93 = *a2;
                                            while (v92 != 3)
                                            {
                                              int v93 = a2[++v92];
                                              if (!v93)
                                              {
                                                v91 = &aLnb[v92];
                                                goto LABEL_212;
                                              }
                                            }

                                            return 1LL;
                                          }

LABEL_212:
                                          if (*v91)
                                          {
LABEL_213:
                                            v94 = "lpr";
                                            if (*a2)
                                            {
                                              uint64_t v95 = 0LL;
                                              int v96 = *a2;
                                              while (v95 != 3)
                                              {
                                                int v96 = a2[++v95];
                                                if (!v96)
                                                {
                                                  v94 = &aLpr[v95];
                                                  goto LABEL_219;
                                                }
                                              }

                                              return 1LL;
                                            }

LABEL_219:
                                            if (*v94)
                                            {
LABEL_220:
                                              v97 = "me";
                                              if (*a2)
                                              {
                                                uint64_t v98 = 0LL;
                                                int v99 = *a2;
                                                while (v98 != 2)
                                                {
                                                  int v99 = a2[++v98];
                                                  if (!v99)
                                                  {
                                                    v97 = &aMe[v98];
                                                    goto LABEL_226;
                                                  }
                                                }

                                                return 1LL;
                                              }

LABEL_226:
                                              if (*v97)
                                              {
LABEL_227:
                                                v100 = "mfc";
                                                if (*a2)
                                                {
                                                  uint64_t v101 = 0LL;
                                                  int v102 = *a2;
                                                  while (v101 != 3)
                                                  {
                                                    int v102 = a2[++v101];
                                                    if (!v102)
                                                    {
                                                      v100 = &aMfc[v101];
                                                      goto LABEL_233;
                                                    }
                                                  }

                                                  return 1LL;
                                                }

LABEL_233:
                                                if (*v100)
                                                {
LABEL_234:
                                                  v103 = "musi";
                                                  if (*a2)
                                                  {
                                                    uint64_t v104 = 0LL;
                                                    int v105 = *a2;
                                                    while (v104 != 4)
                                                    {
                                                      int v105 = a2[++v104];
                                                      if (!v105)
                                                      {
                                                        v103 = &aMusi[v104];
                                                        goto LABEL_240;
                                                      }
                                                    }

                                                    return 1LL;
                                                  }

LABEL_240:
                                                  if (*v103)
                                                  {
LABEL_241:
                                                    if (*a2)
                                                    {
                                                      v106 = a2 + 1;
                                                      v107 = "p";
                                                      int v108 = *a2;
                                                      while (v108 == *(unsigned __int8 *)v107)
                                                      {
                                                        ++v107;
                                                        int v109 = *v106++;
                                                        int v108 = v109;
                                                        if (!v109) {
                                                          goto LABEL_247;
                                                        }
                                                      }
                                                    }

                                                    else
                                                    {
                                                      v107 = "p";
LABEL_247:
                                                      if (!*v107) {
                                                        return 1LL;
                                                      }
                                                    }

                                                    v110 = "pg";
                                                    if (*a2)
                                                    {
                                                      uint64_t v111 = 0LL;
                                                      int v112 = *a2;
                                                      while (v111 != 2)
                                                      {
                                                        int v112 = a2[++v111];
                                                        if (!v112)
                                                        {
                                                          v110 = &aPg[v111];
                                                          goto LABEL_254;
                                                        }
                                                      }

                                                      return 1LL;
                                                    }

LABEL_261:
                                                      if (*v113)
                                                      {
LABEL_262:
                                                        v116 = "pl";
                                                        if (*a2)
                                                        {
                                                          uint64_t v117 = 0LL;
                                                          int v118 = *a2;
                                                          while (v117 != 2)
                                                          {
                                                            int v118 = a2[++v117];
                                                            if (!v118)
                                                            {
                                                              v116 = &aPl[v117];
                                                              goto LABEL_268;
                                                            }
                                                          }

                                                          return 1LL;
                                                        }

LABEL_268:
                                                        if (*v116)
                                                        {
LABEL_269:
                                                          v119 = "pm";
                                                          if (*a2)
                                                          {
                                                            uint64_t v120 = 0LL;
                                                            int v121 = *a2;
                                                            while (v120 != 2)
                                                            {
                                                              int v121 = a2[++v120];
                                                              if (!v121)
                                                              {
                                                                v119 = &aPm[v120];
                                                                goto LABEL_275;
                                                              }
                                                            }

                                                            return 1LL;
                                                          }

LABEL_275:
                                                          if (*v119)
                                                          {
LABEL_276:
                                                            v122 = "psa";
                                                            if (*a2)
                                                            {
                                                              uint64_t v123 = 0LL;
                                                              int v124 = *a2;
                                                              while (v123 != 3)
                                                              {
                                                                int v124 = a2[++v123];
                                                                if (!v124)
                                                                {
                                                                  v122 = &aPsa[v123];
                                                                  goto LABEL_282;
                                                                }
                                                              }

                                                              return 1LL;
                                                            }

LABEL_282:
                                                            if (*v122)
                                                            {
LABEL_283:
                                                              v125 = "psc";
                                                              if (*a2)
                                                              {
                                                                uint64_t v126 = 0LL;
                                                                int v127 = *a2;
                                                                while (v126 != 3)
                                                                {
                                                                  int v127 = a2[++v126];
                                                                  if (!v127)
                                                                  {
                                                                    v125 = &aPsc[v126];
                                                                    goto LABEL_289;
                                                                  }
                                                                }

                                                                return 1LL;
                                                              }

LABEL_289:
                                                              if (*v125)
                                                              {
LABEL_290:
                                                                v128 = "pst";
                                                                if (*a2)
                                                                {
                                                                  uint64_t v129 = 0LL;
                                                                  int v130 = *a2;
                                                                  while (v129 != 3)
                                                                  {
                                                                    int v130 = a2[++v129];
                                                                    if (!v130)
                                                                    {
                                                                      v128 = &aPst[v129];
                                                                      goto LABEL_296;
                                                                    }
                                                                  }

                                                                  return 1LL;
                                                                }

LABEL_296:
                                                                if (*v128)
                                                                {
LABEL_297:
                                                                  v131 = "pty";
                                                                  if (*a2)
                                                                  {
                                                                    uint64_t v132 = 0LL;
                                                                    int v133 = *a2;
                                                                    while (v132 != 3)
                                                                    {
                                                                      int v133 = a2[++v132];
                                                                      if (!v133)
                                                                      {
                                                                        v131 = &aPty[v132];
                                                                        goto LABEL_303;
                                                                      }
                                                                    }

                                                                    return 1LL;
                                                                  }

LABEL_303:
                                                                  if (*v131)
                                                                  {
LABEL_304:
                                                                    v134 = "q";
                                                                    if (*a2)
                                                                    {
                                                                      uint64_t v135 = 0LL;
                                                                      int v136 = *a2;
                                                                      while (v135 != 1)
                                                                      {
                                                                        int v136 = a2[++v135];
                                                                        if (!v136)
                                                                        {
                                                                          v134 = &aQ[v135];
                                                                          goto LABEL_310;
                                                                        }
                                                                      }

                                                                      return 1LL;
                                                                    }

LABEL_310:
                                                                    if (*v134)
                                                                    {
LABEL_311:
                                                                      v137 = "rd";
                                                                      if (*a2)
                                                                      {
                                                                        uint64_t v138 = 0LL;
                                                                        int v139 = *a2;
                                                                        while (v138 != 2)
                                                                        {
                                                                          int v139 = a2[++v138];
                                                                          if (!v139)
                                                                          {
                                                                            v137 = &aRd[v138];
                                                                            goto LABEL_317;
                                                                          }
                                                                        }

                                                                        return 1LL;
                                                                      }

LABEL_317:
                                                                      if (*v137)
                                                                      {
LABEL_318:
                                                                        v140 = "remw";
                                                                        if (*a2)
                                                                        {
                                                                          uint64_t v141 = 0LL;
                                                                          int v142 = *a2;
                                                                          while (v141 != 4)
                                                                          {
                                                                            int v142 = a2[++v141];
                                                                            if (!v142)
                                                                            {
                                                                              v140 = &aRemw[v141];
                                                                              goto LABEL_324;
                                                                            }
                                                                          }

                                                                          return 1LL;
                                                                        }

LABEL_324:
                                                                        if (*v140)
                                                                        {
LABEL_325:
                                                                          v143 = "rfe";
                                                                          if (*a2)
                                                                          {
                                                                            uint64_t v144 = 0LL;
                                                                            int v145 = *a2;
                                                                            while (v144 != 3)
                                                                            {
                                                                              int v145 = a2[++v144];
                                                                              if (!v145)
                                                                              {
                                                                                v143 = &aRfe[v144];
                                                                                goto LABEL_331;
                                                                              }
                                                                            }

                                                                            return 1LL;
                                                                          }

LABEL_331:
                                                                          if (*v143)
                                                                          {
LABEL_332:
                                                                            v146 = "rfs";
                                                                            if (*a2)
                                                                            {
                                                                              uint64_t v147 = 0LL;
                                                                              int v148 = *a2;
                                                                              while (v147 != 3)
                                                                              {
                                                                                int v148 = a2[++v147];
                                                                                if (!v148)
                                                                                {
                                                                                  v146 = &aRfs[v147];
                                                                                  goto LABEL_338;
                                                                                }
                                                                              }

                                                                              return 1LL;
                                                                            }

LABEL_338:
                                                                            if (*v146)
                                                                            {
LABEL_339:
                                                                              v149 = "rn";
                                                                              if (*a2)
                                                                              {
                                                                                uint64_t v150 = 0LL;
                                                                                int v151 = *a2;
                                                                                while (v150 != 2)
                                                                                {
                                                                                  int v151 = a2[++v150];
                                                                                  if (!v151)
                                                                                  {
                                                                                    v149 = &aRn[v150];
                                                                                    goto LABEL_345;
                                                                                  }
                                                                                }

                                                                                return 1LL;
                                                                              }

LABEL_345:
                                                                              if (*v149)
                                                                              {
LABEL_346:
                                                                                v152 = "rp";
                                                                                if (*a2)
                                                                                {
                                                                                  uint64_t v153 = 0LL;
                                                                                  int v154 = *a2;
                                                                                  while (v153 != 2)
                                                                                  {
                                                                                    int v154 = a2[++v153];
                                                                                    if (!v154)
                                                                                    {
                                                                                      v152 = &aRp[v153];
                                                                                      goto LABEL_352;
                                                                                    }
                                                                                  }

                                                                                  return 1LL;
                                                                                }

LABEL_352:
                                                                                if (*v152)
                                                                                {
LABEL_353:
                                                                                  if (*a2)
                                                                                  {
                                                                                    v155 = a2 + 1;
                                                                                    v156 = "sc";
                                                                                    int v157 = *a2;
                                                                                    while (v157 == *(unsigned __int8 *)v156)
                                                                                    {
                                                                                      ++v156;
                                                                                      int v158 = *v155++;
                                                                                      int v157 = v158;
                                                                                      if (!v158) {
                                                                                        goto LABEL_359;
                                                                                      }
                                                                                    }
                                                                                  }

                                                                                  else
                                                                                  {
                                                                                    v156 = "sc";
LABEL_359:
                                                                                    if (!*v156) {
                                                                                      return 1LL;
                                                                                    }
                                                                                  }

                                                                                  v159 = "sd";
                                                                                  if (*a2)
                                                                                  {
                                                                                    uint64_t v160 = 0LL;
                                                                                    int v161 = *a2;
                                                                                    while (v160 != 2)
                                                                                    {
                                                                                      int v161 = a2[++v160];
                                                                                      if (!v161)
                                                                                      {
                                                                                        v159 = &aSd[v160];
                                                                                        goto LABEL_366;
                                                                                      }
                                                                                    }

                                                                                    return 1LL;
                                                                                  }

LABEL_366:
                                                                                  if (*v159)
                                                                                  {
LABEL_367:
                                                                                    v162 = "si";
                                                                                    if (*a2)
                                                                                    {
                                                                                      uint64_t v163 = 0LL;
                                                                                      int v164 = *a2;
                                                                                      while (v163 != 2)
                                                                                      {
                                                                                        int v164 = a2[++v163];
                                                                                        if (!v164)
                                                                                        {
                                                                                          v162 = &aSi[v163];
                                                                                          goto LABEL_373;
                                                                                        }
                                                                                      }

                                                                                      return 1LL;
                                                                                    }

LABEL_373:
                                                                                    if (*v162)
                                                                                    {
LABEL_374:
                                                                                      if (*a2)
                                                                                      {
                                                                                        v165 = a2 + 1;
                                                                                        v166 = "sk";
                                                                                        int v167 = *a2;
                                                                                        while (v167 == *(unsigned __int8 *)v166)
                                                                                        {
                                                                                          ++v166;
                                                                                          int v168 = *v165++;
                                                                                          int v167 = v168;
                                                                                          if (!v168) {
                                                                                            goto LABEL_380;
                                                                                          }
                                                                                        }
                                                                                      }

                                                                                      else
                                                                                      {
                                                                                        v166 = "sk";
LABEL_380:
                                                                                        if (!*v166) {
                                                                                          return 1LL;
                                                                                        }
                                                                                      }

                                                                                      v169 = "sl";
                                                                                      if (*a2)
                                                                                      {
                                                                                        uint64_t v170 = 0LL;
                                                                                        int v171 = *a2;
                                                                                        while (v170 != 2)
                                                                                        {
                                                                                          int v171 = a2[++v170];
                                                                                          if (!v171)
                                                                                          {
                                                                                            v169 = &aSl[v170];
                                                                                            goto LABEL_387;
                                                                                          }
                                                                                        }

                                                                                        return 1LL;
                                                                                      }

LABEL_387:
                                                                                      if (*v169)
                                                                                      {
LABEL_388:
                                                                                        if (*a2)
                                                                                        {
                                                                                          v172 = a2 + 1;
                                                                                          v173 = "st";
                                                                                          int v174 = *a2;
                                                                                          while (v174 == *(unsigned __int8 *)v173)
                                                                                          {
                                                                                            ++v173;
                                                                                            int v175 = *v172++;
                                                                                            int v174 = v175;
                                                                                            if (!v175) {
                                                                                              goto LABEL_394;
                                                                                            }
                                                                                          }
                                                                                        }

                                                                                        else
                                                                                        {
                                                                                          v173 = "st";
LABEL_394:
                                                                                          if (!*v173) {
                                                                                            return 1LL;
                                                                                          }
                                                                                        }

                                                                                        v176 = "ta";
                                                                                        if (*a2)
                                                                                        {
                                                                                          uint64_t v177 = 0LL;
                                                                                          int v178 = *a2;
                                                                                          while (v177 != 2)
                                                                                          {
                                                                                            int v178 = a2[++v177];
                                                                                            if (!v178)
                                                                                            {
                                                                                              v176 = &aTa[v177];
                                                                                              goto LABEL_401;
                                                                                            }
                                                                                          }
                                                                                        }

                                                                                        else
                                                                                        {
LABEL_401:
                                                                                          if (*v176)
                                                                                          {
LABEL_402:
                                                                                            v179 = "te";
                                                                                            if (*a2)
                                                                                            {
                                                                                              uint64_t v180 = 0LL;
                                                                                              int v181 = *a2;
                                                                                              while (v180 != 2)
                                                                                              {
                                                                                                int v181 = a2[++v180];
                                                                                                if (!v181)
                                                                                                {
                                                                                                  v179 = &aTe[v180];
                                                                                                  goto LABEL_408;
                                                                                                }
                                                                                              }
                                                                                            }

                                                                                            else
                                                                                            {
LABEL_408:
                                                                                              if (*v179)
                                                                                              {
LABEL_409:
                                                                                                v182 = "tlc";
                                                                                                if (*a2)
                                                                                                {
                                                                                                  uint64_t v183 = 0LL;
                                                                                                  int v184 = *a2;
                                                                                                  while (v183 != 3)
                                                                                                  {
                                                                                                    int v184 = a2[++v183];
                                                                                                    if (!v184)
                                                                                                    {
                                                                                                      v182 = &aTlc[v183];
                                                                                                      goto LABEL_415;
                                                                                                    }
                                                                                                  }
                                                                                                }

                                                                                                else
                                                                                                {
LABEL_415:
                                                                                                  if (*v182)
                                                                                                  {
LABEL_416:
                                                                                                    v185 = "tle";
                                                                                                    if (*a2)
                                                                                                    {
                                                                                                      uint64_t v186 = 0LL;
                                                                                                      int v187 = *a2;
                                                                                                      while (v186 != 3)
                                                                                                      {
                                                                                                        int v187 = a2[++v186];
                                                                                                        if (!v187)
                                                                                                        {
                                                                                                          v185 = &aTle[v186];
                                                                                                          goto LABEL_422;
                                                                                                        }
                                                                                                      }
                                                                                                    }

                                                                                                    else
                                                                                                    {
LABEL_422:
                                                                                                      if (*v185)
                                                                                                      {
LABEL_423:
                                                                                                        v188 = "tlp";
                                                                                                        if (*a2)
                                                                                                        {
                                                                                                          uint64_t v189 = 0LL;
                                                                                                          int v190 = *a2;
                                                                                                          while (v189 != 3)
                                                                                                          {
                                                                                                            int v190 = a2[++v189];
                                                                                                            if (!v190)
                                                                                                            {
                                                                                                              v188 = &aTlp[v189];
                                                                                                              goto LABEL_429;
                                                                                                            }
                                                                                                          }
                                                                                                        }

                                                                                                        else
                                                                                                        {
LABEL_429:
                                                                                                          if (*v188)
                                                                                                          {
LABEL_430:
                                                                                                            v191 = "tls";
                                                                                                            if (*a2)
                                                                                                            {
                                                                                                              uint64_t v192 = 0LL;
                                                                                                              int v193 = *a2;
                                                                                                              while (v192 != 3)
                                                                                                              {
                                                                                                                int v193 = a2[++v192];
                                                                                                                if (!v193)
                                                                                                                {
                                                                                                                  v191 = &aTls[v192];
                                                                                                                  goto LABEL_436;
                                                                                                                }
                                                                                                              }
                                                                                                            }

                                                                                                            else
                                                                                                            {
LABEL_436:
                                                                                                              if (*v191)
                                                                                                              {
LABEL_437:
                                                                                                                v194 = "tn";
                                                                                                                if (*a2)
                                                                                                                {
                                                                                                                  uint64_t v195 = 0LL;
                                                                                                                  int v196 = *a2;
                                                                                                                  while (v195 != 2)
                                                                                                                  {
                                                                                                                    int v196 = a2[++v195];
                                                                                                                    if (!v196)
                                                                                                                    {
                                                                                                                      v194 = &aTn[v195];
                                                                                                                      goto LABEL_443;
                                                                                                                    }
                                                                                                                  }
                                                                                                                }

                                                                                                                else
                                                                                                                {
LABEL_443:
                                                                                                                  if (*v194)
                                                                                                                  {
LABEL_444:
                                                                                                                    v197 = "top";
                                                                                                                    if (*a2)
                                                                                                                    {
                                                                                                                      uint64_t v198 = 0LL;
                                                                                                                      int v199 = *a2;
                                                                                                                      while (v198 != 3)
                                                                                                                      {
                                                                                                                        int v199 = a2[++v198];
                                                                                                                        if (!v199)
                                                                                                                        {
                                                                                                                          v197 = &aTop[v198];
                                                                                                                          goto LABEL_450;
                                                                                                                        }
                                                                                                                      }
                                                                                                                    }

                                                                                                                    else
                                                                                                                    {
LABEL_450:
                                                                                                                      if (*v197)
                                                                                                                      {
LABEL_451:
                                                                                                                        v200 = "ts";
                                                                                                                        if (*a2)
                                                                                                                        {
                                                                                                                          uint64_t v201 = 0LL;
                                                                                                                          int v202 = *a2;
                                                                                                                          while (v201 != 2)
                                                                                                                          {
                                                                                                                            int v202 = a2[++v201];
                                                                                                                            if (!v202)
                                                                                                                            {
                                                                                                                              v200 = &aTs[v201];
                                                                                                                              goto LABEL_457;
                                                                                                                            }
                                                                                                                          }
                                                                                                                        }

                                                                                                                        else
                                                                                                                        {
LABEL_457:
                                                                                                                          if (*v200)
                                                                                                                          {
LABEL_458:
                                                                                                                            v203 = "tt";
                                                                                                                            if (*a2)
                                                                                                                            {
                                                                                                                              uint64_t v204 = 0LL;
                                                                                                                              int v205 = *a2;
                                                                                                                              while (v204 != 2)
                                                                                                                              {
                                                                                                                                int v205 = a2[++v204];
                                                                                                                                if (!v205)
                                                                                                                                {
                                                                                                                                  v203 = &aTt[v204];
                                                                                                                                  goto LABEL_464;
                                                                                                                                }
                                                                                                                              }
                                                                                                                            }

                                                                                                                            else
                                                                                                                            {
LABEL_464:
                                                                                                                              if (*v203)
                                                                                                                              {
LABEL_465:
                                                                                                                                v206 = "tx";
                                                                                                                                if (*a2)
                                                                                                                                {
                                                                                                                                  uint64_t v207 = 0LL;
                                                                                                                                  int v208 = *a2;
                                                                                                                                  while (v207 != 2)
                                                                                                                                  {
                                                                                                                                    int v208 = a2[++v207];
                                                                                                                                    if (!v208)
                                                                                                                                    {
                                                                                                                                      v206 = &aTx[v207];
                                                                                                                                      goto LABEL_471;
                                                                                                                                    }
                                                                                                                                  }
                                                                                                                                }

                                                                                                                                else
                                                                                                                                {
LABEL_471:
                                                                                                                                  if (*v206)
                                                                                                                                  {
LABEL_472:
                                                                                                                                    v209 = "uce";
                                                                                                                                    if (*a2)
                                                                                                                                    {
                                                                                                                                      uint64_t v210 = 0LL;
                                                                                                                                      int v211 = *a2;
                                                                                                                                      while (v210 != 3)
                                                                                                                                      {
                                                                                                                                        int v211 = a2[++v210];
                                                                                                                                        if (!v211)
                                                                                                                                        {
                                                                                                                                          v209 = &aUce[v210];
                                                                                                                                          goto LABEL_478;
                                                                                                                                        }
                                                                                                                                      }
                                                                                                                                    }

                                                                                                                                    else
                                                                                                                                    {
LABEL_478:
                                                                                                                                      if (*v209)
                                                                                                                                      {
LABEL_479:
                                                                                                                                        v212 = "ucs";
                                                                                                                                        if (*a2)
                                                                                                                                        {
                                                                                                                                          uint64_t v213 = 0LL;
                                                                                                                                          int v214 = *a2;
                                                                                                                                          while (v213 != 3)
                                                                                                                                          {
                                                                                                                                            int v214 = a2[++v213];
                                                                                                                                            if (!v214)
                                                                                                                                            {
                                                                                                                                              v212 = &aUcs[v213];
                                                                                                                                              goto LABEL_485;
                                                                                                                                            }
                                                                                                                                          }
                                                                                                                                        }

                                                                                                                                        else
                                                                                                                                        {
LABEL_485:
                                                                                                                                          if (*v212)
                                                                                                                                          {
LABEL_486:
                                                                                                                                            v215 = "vc";
                                                                                                                                            if (*a2)
                                                                                                                                            {
                                                                                                                                              uint64_t v216 = 0LL;
                                                                                                                                              int v217 = *a2;
                                                                                                                                              while (v216 != 2)
                                                                                                                                              {
                                                                                                                                                int v217 = a2[++v216];
                                                                                                                                                if (!v217)
                                                                                                                                                {
                                                                                                                                                  v215 = &aVc[v216];
                                                                                                                                                  goto LABEL_492;
                                                                                                                                                }
                                                                                                                                              }
                                                                                                                                            }

                                                                                                                                            else
                                                                                                                                            {
LABEL_492:
                                                                                                                                              if (*v215)
                                                                                                                                              {
LABEL_493:
                                                                                                                                                v218 = "vs";
                                                                                                                                                if (*a2)
                                                                                                                                                {
                                                                                                                                                  uint64_t v219 = 0LL;
                                                                                                                                                  int v220 = *a2;
                                                                                                                                                  while (v219 != 2)
                                                                                                                                                  {
                                                                                                                                                    int v220 = a2[++v219];
                                                                                                                                                    if (!v220)
                                                                                                                                                    {
                                                                                                                                                      v218 = &aVs[v219];
                                                                                                                                                      goto LABEL_499;
                                                                                                                                                    }
                                                                                                                                                  }
                                                                                                                                                }

                                                                                                                                                else
                                                                                                                                                {
LABEL_499:
                                                                                                                                                  if (*v218)
                                                                                                                                                  {
LABEL_500:
                                                                                                                                                    v221 = "wl";
                                                                                                                                                    if (*a2)
                                                                                                                                                    {
                                                                                                                                                      uint64_t v222 = 0LL;
                                                                                                                                                      int v223 = *a2;
                                                                                                                                                      while (v222 != 2)
                                                                                                                                                      {
                                                                                                                                                        int v223 = a2[++v222];
                                                                                                                                                        if (!v223)
                                                                                                                                                        {
                                                                                                                                                          v221 = &aWl[v222];
                                                                                                                                                          goto LABEL_506;
                                                                                                                                                        }
                                                                                                                                                      }
                                                                                                                                                    }

                                                                                                                                                    else
                                                                                                                                                    {
LABEL_506:
                                                                                                                                                      if (*v221)
                                                                                                                                                      {
LABEL_507:
                                                                                                                                                        v224 = "xcs";
                                                                                                                                                        if (*a2)
                                                                                                                                                        {
                                                                                                                                                          uint64_t v225 = 0LL;
                                                                                                                                                          int v226 = *a2;
                                                                                                                                                          while (v225 != 3)
                                                                                                                                                          {
                                                                                                                                                            int v226 = a2[++v225];
                                                                                                                                                            if (!v226)
                                                                                                                                                            {
                                                                                                                                                              v224 = &aXcs[v225];
                                                                                                                                                              goto LABEL_513;
                                                                                                                                                            }
                                                                                                                                                          }
                                                                                                                                                        }

                                                                                                                                                        else
                                                                                                                                                        {
LABEL_513:
                                                                                                                                                          if (*v224)
                                                                                                                                                          {
LABEL_514:
                                                                                                                                                            v227 = "\uFFFD";
                                                                                                                                                            if (*a2)
                                                                                                                                                            {
                                                                                                                                                              uint64_t v228 = 0LL;
                                                                                                                                                              while (v228 != 3)
                                                                                                                                                              {
                                                                                                                                                                int v2 = a2[++v228];
                                                                                                                                                                if (!v2)
                                                                                                                                                                {
                                                                                                                                                                  v227 = &asc_331E1[v228];
                                                                                                                                                                  goto LABEL_520;
                                                                                                                                                                }
                                                                                                                                                              }
                                                                                                                                                            }

                                                                                                                                                            else
                                                                                                                                                            {
LABEL_520:
                                                                                                                                                              if (*v227) {
                                                                                                                                                                return 0LL;
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
              }
            }
          }
        }
      }
    }
  }

  return 1LL;
}

LABEL_34:
  }

  v82 = v11;
  uint64_t v15 = [v12 rangeAtIndex:1];
  int v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v15, v16));
  uint64_t v92 = 0u;
  int v93 = 0u;
  v94 = 0u;
  uint64_t v95 = 0u;
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_parserStack, "reverseObjectEnumerator"));
  uint64_t v19 = [v18 countByEnumeratingWithState:&v92 objects:v102 count:16];
  if (v19)
  {
    int v20 = v19;
    uint64_t v21 = *(void *)v93;
LABEL_10:
    uint64_t v22 = 0LL;
    while (1)
    {
      if (*(void *)v93 != v21) {
        objc_enumerationMutation(v18);
      }
      int v23 = *(void **)(*((void *)&v92 + 1) + 8 * v22);
      int v24 = [(id)objc_opt_class(v23) endCode];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if ([v17 isEqualToString:v25])
      {
        int v26 = [v23 isClosed];

        if ((v26 & 1) == 0)
        {
          [v23 foundEndCode:v17];
          -[NSMutableArray removeObject:](self->_parserStack, "removeObject:", v23);
LABEL_30:
          uint64_t v6 = v80;
          uint64_t v7 = v81;
          int v11 = v82;
LABEL_31:

          goto LABEL_32;
        }
      }

      else
      {
      }

      if (v20 == (id)++v22)
      {
        int v20 = [v18 countByEnumeratingWithState:&v92 objects:v102 count:16];
        if (!v20) {
          break;
        }
        goto LABEL_10;
      }
    }
  }

  int v90 = 0u;
  v91 = 0u;
  unint64_t v88 = 0u;
  uint64_t v89 = 0u;
  int v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray reverseObjectEnumerator](self->_parserStack, "reverseObjectEnumerator"));
  uint64_t v28 = [v27 countByEnumeratingWithState:&v88 objects:v101 count:16];
  if (!v28) {
    goto LABEL_27;
  }
  int v29 = v28;
  int v30 = *(void *)v89;
LABEL_21:
  uint64_t v31 = 0LL;
  while (1)
  {
    if (*(void *)v89 != v30) {
      objc_enumerationMutation(v27);
    }
    int v32 = *(void **)(*((void *)&v88 + 1) + 8 * v31);
    __int16 v33 = [(id)objc_opt_class(v32) innerCodes];
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    int v35 = [v34 containsObject:v17];

    if (v35) {
      break;
    }
    if (v29 == (id)++v31)
    {
      int v29 = [v27 countByEnumeratingWithState:&v88 objects:v101 count:16];
      if (!v29)
      {
LABEL_27:

        goto LABEL_40;
      }

      goto LABEL_21;
    }
  }

  int v47 = [v32 foundInnerCode:v17];
  while (1)
  {
    int v48 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_parserStack, "lastObject"));

    if (v48 == v32) {
      break;
    }
    -[NSMutableArray removeLastObject](self->_parserStack, "removeLastObject");
  }

  uint64_t v6 = v80;
  uint64_t v7 = v81;
  int v11 = v82;
  if ((v47 & 1) != 0)
  {
LABEL_32:
    int v44 = [v12 range];
    uint64_t v13 = (unint64_t)v44 + v45;
    [v12 range];
    uint64_t v43 = v46;
    goto LABEL_33;
  }

LABEL_68:
  if (v79)
  {
    uint64_t v98 = NSLocalizedDescriptionKey;
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Found unexpected Duxbury format code: %@",  v17));
    int v99 = v76;
    int v77 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v99,  &v98,  1LL));

    v78 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError, "errorWithDomain:code:userInfo:", @"com.apple.accessibility.duxbury.dbtParserErrorDomain", 1LL, v77));
    *uint64_t v79 = v78;
  }

  uint64_t v10 = 0LL;
  uint64_t v6 = v80;
  uint64_t v7 = v81;
  uint64_t v9 = 0LL;
LABEL_66:

LABEL_67:
  return v10;
}

uint64_t dxscb_engine_process(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (unsigned int *)malloc(0x4004uLL);
  if (!v6) {
    return 270LL;
  }
  uint64_t v7 = v6;
  uint64_t v8 = 0LL;
  do
  {
    unsigned int v9 = (*(uint64_t (**)(uint64_t))(a1 + 128))(a3);
    v7[v8] = v9;
    if (v9 == -1) {
      break;
    }
  }

  while (v8++ != 4095);
  *(void *)(a1 + 24) = 0LL;
  int v11 = *(_DWORD *)(a1 + 32);
  *(_DWORD *)(a1 + 36) = v11;
  dxscb_engine_deferred_table_load(a1, v11);
  uint64_t v12 = *(void *)(*(void *)(a1 + 16) + 2048LL);
  if (v12)
  {
    if (*(int *)(v12 + 12) >= 1)
    {
      uint64_t v13 = 0LL;
      int v14 = *(void (**)(void, uint64_t))(a1 + 136);
      do
        v14(*(char *)(*(void *)(v12 + 40) + v13++), a2);
      while (v13 < *(int *)(v12 + 12));
    }

    if (*(_BYTE *)(v12 + 25) == 40)
    {
      uint64_t v15 = *(int *)(a1 + 40);
      if ((int)v15 <= 19)
      {
        int v16 = *(_DWORD *)(a1 + 36);
        *(_DWORD *)(a1 + 40) = v15 + 1;
        *(_DWORD *)(a1 + 4 * v15 + 44) = v16;
      }
    }

    unsigned int v17 = *(_DWORD *)(v12 + 20);
    if (v17)
    {
      if (v17 != *(_DWORD *)(a1 + 36))
      {
        *(_DWORD *)(a1 + 36) = v17;
        if (v17 <= 0xA) {
          dxscb_engine_deferred_table_load(a1, v17);
        }
      }
    }
  }

  unsigned int v18 = *v7;
  if ((*v7 & 0x80000000) == 0)
  {
    int v19 = 0;
    int v20 = v7;
    do
    {
      uint64_t v21 = *(uint64_t **)(*(void *)(a1 + 16) + 8LL * v18);
      if (v21)
      {
        while (1)
        {
          if (*((_BYTE *)v21 + 24) != 1)
          {
            int v22 = *((_DWORD *)v21 + 4);
            if (!v22 || v22 == *(_DWORD *)(a1 + 36)) {
              break;
            }
          }

LABEL_64:
  free(v7);
  return 0LL;
}

void prdtf(void **a1)
{
}

id DBTLog()
{
  if (DBTLog_onceToken != -1) {
    dispatch_once(&DBTLog_onceToken, &__block_literal_global_1);
  }
  return (id)DBTLog_log;
}

id DBTLogFormatParser()
{
  if (DBTLogFormatParser_onceToken != -1) {
    dispatch_once(&DBTLogFormatParser_onceToken, &__block_literal_global_3);
  }
  return (id)DBTLogFormatParser_log;
}

uint64_t prdtqr(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = a1 + 29540;
  uint64_t v6 = a1 + 29592;
  do
    *(_BYTE *)(v6 + v4++) = dxios_stream_getc(a2);
  while (v4 != 40);
  *(_BYTE *)(v5 + 92) = 0;
  int v7 = 68;
  do
  {
    dxios_stream_getc(a2);
    --v7;
  }

  while (v7);
  unsigned int v8 = dxios_stream_mdri(a2);
  *(_DWORD *)(v5 + 96) = v8;
  if (v8 - 20 < 0xFFFFFFF6) {
    return 3LL;
  }
  if (v8 < 0x12) {
    int v10 = 1;
  }
  else {
    int v10 = dxios_stream_mdri(a2);
  }
  *(_DWORD *)(v5 + 3344) = v10;
  *(void *)(a1 + 30712) = 0LL;
  int v11 = (void *)(a1 + 30776);
  *(_OWORD *)(a1 + 30680) = 0u;
  *(_OWORD *)(a1 + 30696) = 0u;
  *(_OWORD *)(a1 + 30728) = 0u;
  *(_OWORD *)(a1 + 30752) = 0u;
  *(_OWORD *)(a1 + 30776) = 0u;
  *(void *)(a1 + 30808) = 0LL;
  *(void *)(a1 + 30824) = 0LL;
  *(void *)(a1 + 30816) = 0LL;
  jreaqi(a1);
  *(_DWORD *)(v5 + 1132) = dxios_stream_mdri(a2);
  *(_DWORD *)(v5 + 1180) = dxios_stream_mdri(a2);
  *(_DWORD *)(v5 + 1204) = dxios_stream_mdri(a2);
  int v12 = dxios_stream_mdri(a2);
  *(_DWORD *)(v5 + 1228) = v12;
  size_t v13 = *(int *)(v5 + 1132);
  int v14 = malloc(v13);
  *(void *)(a1 + 30680) = v14;
  if (!v14) {
    goto LABEL_84;
  }
  uint64_t v15 = malloc(8 * v13);
  *(void *)(a1 + 30688) = v15;
  if (!v15) {
    goto LABEL_84;
  }
  int v16 = malloc(4 * v13);
  *(void *)(a1 + 30696) = v16;
  if (!v16) {
    goto LABEL_84;
  }
  unsigned int v17 = malloc(v13);
  *(void *)(a1 + 30704) = v17;
  if (!v17) {
    goto LABEL_84;
  }
  unsigned int v18 = malloc(4 * v13);
  *(void *)(a1 + 30712) = v18;
  if (!v18) {
    goto LABEL_84;
  }
  size_t v19 = 4LL * *(int *)(v5 + 1180);
  int v20 = malloc(v19);
  *(void *)(a1 + 30728) = v20;
  if (!v20) {
    goto LABEL_84;
  }
  uint64_t v21 = malloc(v19);
  *(void *)(a1 + 30736) = v21;
  if (!v21) {
    goto LABEL_84;
  }
  int v22 = (void *)(a1 + 30752);
  int v23 = *(_DWORD *)(v5 + 3344);
  size_t v24 = 8LL * v23 * *(_DWORD *)(v5 + 1204);
  int v25 = malloc(v24);
  *(void *)(a1 + 30752) = v25;
  if (!v25) {
    goto LABEL_84;
  }
  int v26 = malloc(v24);
  *(void *)(a1 + 30760) = v26;
  if (!v26) {
    goto LABEL_84;
  }
  size_t v27 = 8LL * v23 * v12;
  int v28 = malloc(v27);
  void *v11 = v28;
  if (!v28) {
    goto LABEL_84;
  }
  uint64_t v29 = malloc(v27);
  *(void *)(a1 + 30784) = v29;
  if (!v29) {
    goto LABEL_84;
  }
  if ((int)v13 >= 1)
  {
    uint64_t v30 = 0LL;
    do
    {
      *(_BYTE *)(*(void *)(a1 + 30680) + v30) = dxios_stream_getc(a2);
      int v31 = *(_DWORD *)(v5 + 96);
      if (v31 > 10)
      {
        else {
          unint64_t v32 = dxios_stream_mdrl(a2);
        }
      }

      else
      {
        unint64_t v32 = (int)dxios_stream_mdri(a2);
      }

      *(void *)(*(void *)(a1 + 30688) + 8 * v30) = v32;
      *(_DWORD *)(*(void *)(a1 + 30696) + 4 * v30) = dxios_stream_mdri(a2);
      *(_BYTE *)(*(void *)(a1 + 30704) + v30) = dxios_stream_getc(a2);
      *(_DWORD *)(*(void *)(a1 + 30712) + 4 * v30++) = dxios_stream_mdri(a2);
    }

    while (v30 < *(int *)(v5 + 1132));
  }

  int v33 = dxios_stream_mdri(a2);
  if (v33 > 256)
  {
    prdtf((void **)a1);
    return 4LL;
  }

  int v34 = v33;
  if (v33 < 1) {
    goto LABEL_37;
  }
  uint64_t v35 = v33;
  int v36 = (_DWORD *)(v5 + 104);
  do
  {
    *v36++ = dxios_stream_mdri(a2);
    --v35;
  }

  while (v35);
  if (v34 <= 255) {
LABEL_37:
  }
    bzero((void *)(a1 + 4LL * v34 + 29644), 4LL * (255 - v34) + 4);
  if (*(int *)(v5 + 96) > 11)
  {
    *(_DWORD *)(v5 + 1264) = dxios_stream_mdri(a2);
    *(_DWORD *)(v5 + 1296) = dxios_stream_mdri(a2);
    int v49 = dxios_stream_mdri(a2);
    *(_DWORD *)(v5 + 1292) = v49;
    int v50 = malloc(*(int *)(v5 + 1264));
    *(void *)(a1 + 30808) = v50;
    if (!v50) {
      goto LABEL_84;
    }
    unsigned int v51 = malloc(8LL * (v49 + 1));
    *(void *)(a1 + 30824) = v51;
    if (!v51) {
      goto LABEL_84;
    }
    uint64_t v52 = *(int *)(v5 + 1296);
    int v53 = malloc(8 * v52);
    *(void *)(a1 + 30816) = v53;
    if (!v53) {
      goto LABEL_84;
    }
    if ((v49 & 0x80000000) == 0)
    {
      uint64_t v54 = 0LL;
      do
        *(_DWORD *)(*(void *)(a1 + 30824) + 4 * v54) = dxios_stream_mdri(a2);
      while (v54++ < *(int *)(v5 + 1292));
      LODWORD(v52) = *(_DWORD *)(v5 + 1296);
    }

    if ((int)v52 >= 1)
    {
      uint64_t v56 = 0LL;
      do
        *(_DWORD *)(*(void *)(a1 + 30816) + 4 * v56++) = dxios_stream_mdri(a2);
      while (v56 < *(int *)(v5 + 1296));
    }

    if (*(int *)(v5 + 1264) >= 1)
    {
      uint64_t v57 = 0LL;
      do
        *(_BYTE *)(*(void *)(a1 + 30808) + v57++) = dxios_stream_getc(a2);
      while (v57 < *(int *)(v5 + 1264));
    }
  }

  else
  {
    *(_DWORD *)(a1 + 30836) = 0;
    *(_OWORD *)(a1 + 30804) = 0u;
    *(_OWORD *)(a1 + 30820) = 0u;
  }

  if (jreaq(a1, a2))
  {
LABEL_84:
    prdtf((void **)a1);
    return 5LL;
  }

  if (*(int *)(v5 + 1180) >= 1)
  {
    uint64_t v37 = 0LL;
    do
    {
      *(_DWORD *)(*(void *)(a1 + 30728) + 4 * v37) = dxios_stream_mdri(a2);
      *(_DWORD *)(*(void *)(a1 + 30736) + 4 * v37++) = dxios_stream_mdri(a2);
    }

    while (v37 < *(int *)(v5 + 1180));
  }

  if (*(int *)(v5 + 1204) >= 1)
  {
    int v38 = 0;
    while (1)
    {
      int v39 = *(_DWORD *)(v5 + 96);
      if (v39 <= 10) {
        break;
      }
      if (v39 <= 0xC)
      {
        unint64_t v40 = dxios_stream_mdrl(a2);
        goto LABEL_52;
      }

      if (v39 < 0x12)
      {
        unint64_t v40 = dxios_stream_mdrv(a2);
        goto LABEL_52;
      }

      int v41 = *(_DWORD *)(v5 + 3344);
      if (v41 >= 1)
      {
        uint64_t v44 = 0LL;
        do
        {
          uint64_t v45 = dxios_stream_mdrv(a2);
          int v41 = *(_DWORD *)(v5 + 3344);
          *(void *)(*v22 + 8 * (v44 + v38 * v41)) = v45;
          ++v44;
        }

        while ((int)v44 < v41);
      }

LABEL_53:
      int v42 = *(_DWORD *)(v5 + 96);
      if (v42 > 10)
      {
        if (v42 > 0xC)
        {
          if (v42 >= 0x12)
          {
            if (v41 >= 1)
            {
              uint64_t v46 = 0LL;
              do
              {
                uint64_t v47 = dxios_stream_mdrv(a2);
                int v48 = *(_DWORD *)(v5 + 3344);
                *(void *)(*(void *)(a1 + 30760) + 8 * (v46 + v38 * v48)) = v47;
                ++v46;
              }

              while ((int)v46 < v48);
            }

            goto LABEL_60;
          }

          unint64_t v43 = dxios_stream_mdrv(a2);
        }

        else
        {
          unint64_t v43 = dxios_stream_mdrl(a2);
        }
      }

      else
      {
        unint64_t v43 = (int)dxios_stream_mdri(a2);
      }

      *(void *)(*(void *)(a1 + 30760) + 8LL * *(_DWORD *)(v5 + 3344) * v38) = v43;
LABEL_60:
      if (++v38 >= *(_DWORD *)(v5 + 1204)) {
        goto LABEL_85;
      }
    }

    unint64_t v40 = (int)dxios_stream_mdri(a2);
LABEL_52:
    int v41 = *(_DWORD *)(v5 + 3344);
    *(void *)(*v22 + 8LL * v41 * v38) = v40;
    goto LABEL_53;
  }

LABEL_85:
  if (*(int *)(v5 + 1228) >= 1)
  {
    int v58 = 0;
    while (1)
    {
      int v59 = *(_DWORD *)(v5 + 96);
      if (v59 <= 10) {
        break;
      }
      if (v59 <= 0xC)
      {
        unint64_t v60 = dxios_stream_mdrl(a2);
        goto LABEL_93;
      }

      if (v59 < 0x12)
      {
        unint64_t v60 = dxios_stream_mdrv(a2);
        goto LABEL_93;
      }

      int v61 = *(_DWORD *)(v5 + 3344);
      if (v61 >= 1)
      {
        uint64_t v64 = 0LL;
        do
        {
          uint64_t v65 = dxios_stream_mdrv(a2);
          int v61 = *(_DWORD *)(v5 + 3344);
          *(void *)(*v11 + 8 * (v64 + v58 * v61)) = v65;
          ++v64;
        }

        while ((int)v64 < v61);
      }

LABEL_94:
      int v62 = *(_DWORD *)(v5 + 96);
      if (v62 > 10)
      {
        if (v62 > 0xC)
        {
          if (v62 >= 0x12)
          {
            if (v61 >= 1)
            {
              uint64_t v66 = 0LL;
              do
              {
                uint64_t v67 = dxios_stream_mdrv(a2);
                int v68 = *(_DWORD *)(v5 + 3344);
                *(void *)(*(void *)(a1 + 30784) + 8 * (v66 + v58 * v68)) = v67;
                ++v66;
              }

              while ((int)v66 < v68);
            }

            goto LABEL_101;
          }

          unint64_t v63 = dxios_stream_mdrv(a2);
        }

        else
        {
          unint64_t v63 = dxios_stream_mdrl(a2);
        }
      }

      else
      {
        unint64_t v63 = (int)dxios_stream_mdri(a2);
      }

      *(void *)(*(void *)(a1 + 30784) + 8LL * *(_DWORD *)(v5 + 3344) * v58) = v63;
LABEL_101:
      if (++v58 >= *(_DWORD *)(v5 + 1228)) {
        goto LABEL_111;
      }
    }

    unint64_t v60 = (int)dxios_stream_mdri(a2);
LABEL_93:
    int v61 = *(_DWORD *)(v5 + 3344);
    *(void *)(*v11 + 8LL * v61 * v58) = v60;
    goto LABEL_94;
  }

LABEL_111:
  *(_BYTE *)(v5 + 1260) = dxios_stream_getc(a2);
  *(_DWORD *)(v5 + 1252) = dxios_stream_mdri(a2);
  *(_DWORD *)(v5 + 100) = dxios_stream_mdri(a2);
  *(_DWORD *)uint64_t v5 = dxios_stream_mdri(a2);
  dxios_stream_mdri(a2);
  dxios_stream_mdri(a2);
  dxios_stream_mdri(a2);
  unsigned int v69 = dxios_stream_mdri(a2);
  uint64_t result = 0LL;
  if (v69 <= 1) {
    unsigned int v69 = 1;
  }
  *(_DWORD *)(v5 + 1256) = v69;
  return result;
}

double dxtbl_lintbl_create(uint64_t a1, uint64_t a2)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)a1 = 0;
  *(void *)(a1 + 8) = a2;
  *(void *)(a1 + 16) = 0LL;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t dxtbl_lintbl_destroy(uint64_t a1)
{
  if (*(_DWORD *)a1) {
    return dxtbl_lintbl_deactivate(a1);
  }
  return a1;
}

uint64_t dxtbl_lintbl_deactivate(uint64_t a1)
{
  if (!*(_DWORD *)a1) {
    return 4294967096LL;
  }
  *(_DWORD *)a1 = 0;
  if (!dxtbl_lintbl_read(a1, (const char *)dxtbl_lintbl_deactivate_sentinel, 0x12CuLL)
    && dxtbl_lintbl_deactivate_sentinel[0] == 2763306)
  {
    return 0LL;
  }

  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = 4294967196LL;
  dxerr_report_activate(v2, (uint64_t)"rtbl", -100);
  return v3;
}

uint64_t dxtbl_lintbl_readint(uint64_t a1, int a2, int a3, int *a4)
{
  int v8 = atoi(v12);
  *a4 = v8;
  if (v8 >= a2 && v8 <= a3) {
    return 0LL;
  }
  uint64_t v11 = *(void *)(a1 + 8);
  uint64_t v9 = 4294967136LL;
  dxerr_report_activate(v11, (uint64_t)"rtbl", -160);
  return v9;
}

uint64_t dxtbl_lintbl_read(uint64_t a1, const char *a2, unint64_t a3)
{
LABEL_1:
  *a2 = 0;
  ++*(_DWORD *)(a1 + 24);
  if (a3)
  {
    unint64_t v6 = a3;
    int v7 = (char *)a2;
    while (1)
    {
      do
        int v8 = read_char(a1);
      while (v8 == 13);
      if (v8 == 10)
      {
        char *v7 = 0;
        unint64_t v9 = v7 - a2 + 1;
        goto LABEL_13;
      }

      if (v8 == 257)
      {
        char *v7 = 0;
        unint64_t v9 = v7 - a2 + 1;
        if (v9 == 1) {
          goto LABEL_1;
        }
        goto LABEL_13;
      }

      if (v8 == 256) {
        break;
      }
      *v7++ = v8;
      if (!--v6) {
        goto LABEL_22;
      }
    }

    unint64_t v9 = v7 - a2;
    if (v9) {
      goto LABEL_13;
    }
    return 0LL;
  }

  else
  {
    int v7 = (char *)a2;
LABEL_22:
    *(v7 - 1) = 0;
    unint64_t v9 = v7 - a2;
    do
    {
      ++v9;
      int v14 = read_char(a1);
    }

    while ((v14 - 256) >= 2 && v14 != 10);
LABEL_13:
    if (v9 <= a3)
    {
      uint64_t v11 = &a2[strlen(a2)];
      do
      {
        int v12 = v11;
        if (v11 <= a2) {
          break;
        }
        --v11;
      }

      while (*(v12 - 1) == 32);
      uint64_t v10 = 0LL;
      const char *v12 = 0;
    }

    else
    {
      uint64_t v10 = 4294967221LL;
      dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"rtbl", -75);
    }
  }

  return v10;
}

uint64_t dxtbl_lintbl_readchic(uint64_t a1, _DWORD *a2)
{
  return 0LL;
}

uint64_t dxtbl_lintbl_readBOOLean(uint64_t a1, BOOL *a2)
{
  return 0LL;
}

uint64_t dxtbl_lintbl_activate(uint64_t a1, uint64_t a2, const char *a3)
{
  if (*(_DWORD *)a1)
  {
    uint64_t v4 = 4294967095LL;
  }

  else
  {
    *(_DWORD *)a1 = 1;
    *(void *)(a1 + 16) = a2;
    *(_DWORD *)(a1 + 24) = 0;
    if (!dxtbl_lintbl_read(a1, dxtbl_lintbl_activate_sentinel, 0x12CuLL)
      && !strcmp(a3, dxtbl_lintbl_activate_sentinel))
    {
      return 0LL;
    }

    *(_DWORD *)a1 = 0;
    uint64_t v4 = 4294967215LL;
  }

  dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"rtbl", v4);
  return v4;
}

uint64_t read_char(uint64_t a1)
{
  LODWORD(result) = dxios_stream_getc(*(void *)(a1 + 16));
  if ((_DWORD)result == 124)
  {
    int v3 = dxios_stream_getc(*(void *)(a1 + 16));
    if (v3 == 10) {
      return 257LL;
    }
    char v4 = v3;
    if (v3 != 124)
    {
      if (v3 == 32)
      {
        uint64_t v5 = *(void *)(a1 + 16);
        do
          int v6 = dxios_stream_getc(v5);
        while (v6 != -1 && v6 != 10);
        return 257LL;
      }

      v11[0] = v3;
      if ((_BYTE)v3 == 0xFF
        || (char v7 = dxios_stream_getc(*(void *)(a1 + 16)), v11[1] = v7, v7 == -1)
        || (v8 = v7, int v9 = dxios_stream_getc(*(void *)(a1 + 16)), v11[2] = v9, v9 << 24 == -16777216)
        || (v4 - 48) > 9)
      {
        int v10 = -60;
      }

      else
      {
        int v10 = -60;
        if ((v8 - 48) <= 9 && ((char)v9 - 48) <= 9)
        {
          v11[3] = 0;
          uint64_t result = atoi(v11);
          int v10 = -70;
        }
      }

      dxerr_report_activate(*(void *)(a1 + 8), (uint64_t)"rtbl", v10);
    }

    return 124LL;
  }

  else if ((_DWORD)result == -1)
  {
    return 256LL;
  }

  else
  {
    return result;
  }

double siniq(uint64_t a1)
{
  *(_DWORD *)(a1 + 30840) = *(_DWORD *)(a1 + 29640) != 3;
  *(_DWORD *)(a1 + 30844) = 0;
  double result = 0.0;
  *(void *)(a1 + 32148) = 0LL;
  *(void *)(a1 + 32048) = 0LL;
  *(_BYTE *)(a1 + 32092) = 0;
  return result;
}

void stacq(uint64_t a1, int a2)
{
  if (a2 == 256)
  {
    scltb(a1, -1);
    lfiniq((_DWORD *)a1);
    return;
  }

  char v4 = (int *)(a1 + 30844);
  int v5 = *(_DWORD *)(a1 + 30844);
  if (v5 == 1)
  {
    linecq(a1, a2);
    int *v4 = 0;
    return;
  }

  int v6 = (_DWORD *)(a1 + 29640);
  if (v5 == 3)
  {
    int *v4 = 0;
    switch(a2)
    {
      case 'a':
        *(_DWORD *)(a1 + 30840) = 3;
        *(_BYTE *)(a1 + *(int *)(a1 + 32048) + 32056) = 0;
        int v11 = *(_DWORD *)(a1 + 32048);
        if (v11 <= 29) {
          *(_DWORD *)(a1 + 32048) = v11 + 1;
        }
        return;
      case 'b':
        goto LABEL_28;
      case 'c':
        sgose(a1);
LABEL_28:
        *(_DWORD *)(a1 + 30840) = 1;
        return;
      case 'd':
        int v15 = 2;
        goto LABEL_31;
      case 'e':
        int v15 = 1;
LABEL_31:
        *(_DWORD *)(a1 + 32052) = v15;
        break;
      default:
        return;
    }

    return;
  }

  if (v5 == 2)
  {
    int *v4 = 0;
    unsigned int v7 = chupc(a2 | (*(_DWORD *)(a1 + 32088) << 8));
    unsigned __int8 v8 = v7;
    int v9 = *(_DWORD *)(a1 + 32152);
    *(_DWORD *)(a1 + 32152) = 0;
    if (v7 >= 0x100) {
      stacq(a1, v7 >> 8);
    }
    stacq(a1, v8);
    if (v9 == 1) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
    *(_DWORD *)(a1 + 32152) = v10;
    return;
  }

  if (*v6 != 2) {
    goto LABEL_41;
  }
  if (a2 > 31)
  {
    int v14 = *(_DWORD *)&dusci[12 * a2];
    if ((v14 & 2) != 0)
    {
      int v16 = *(_DWORD *)(a1 + 32152);
      if (v16 >= 1)
      {
        if (v16 == 1) {
          *(_DWORD *)(a1 + 32152) = 0;
        }
        int v12 = *(_DWORD *)&dusci[12 * a2 + 8];
        if (v12 != 156) {
          goto LABEL_42;
        }
        stacq(a1, 4294967294LL);
      }
    }

    else if ((v14 & 0x20) != 0 && *(int *)(a1 + 32152) >= 1)
    {
      int *v4 = 2;
      *(_DWORD *)(a1 + 32088) = a2;
      return;
    }

LABEL_41:
    int v12 = a2;
    goto LABEL_42;
  }

  if (a2 > 14)
  {
    if (a2 == 15)
    {
      *(_DWORD *)(a1 + 32152) = 0;
      return;
    }

    if (a2 == 28)
    {
      *(_BYTE *)(a1 + 32092) = 1;
      int v12 = 28;
    }

    else
    {
      int v12 = a2;
      if (a2 == 31) {
        *(_BYTE *)(a1 + 32092) = 0;
      }
    }
  }

  else if (a2 == -2)
  {
    int v12 = 156;
  }

  else
  {
    if (a2 == 2)
    {
      int v13 = 1;
      goto LABEL_89;
    }

    int v12 = a2;
    if (a2 == 14)
    {
      int v13 = 2;
LABEL_89:
      *(_DWORD *)(a1 + 32152) = v13;
      return;
    }
  }

LABEL_109:
        *(_DWORD *)(a1 + 32148) = v25 + 1;
        return;
      }

      uint64_t v28 = a1;
      int v29 = v12;
    }

    scltb(v28, v29);
    return;
  }

  if (v12 < 28)
  {
    if (v12 != 23) {
      goto LABEL_70;
    }
LABEL_80:
    linecq(a1, 23);
    int v19 = 1;
    goto LABEL_49;
  }

  uint64_t v20 = *(int *)(a1 + 32048) - 1LL;
  uint64_t v21 = (_BYTE *)(a1 + 32056 + v20);
  *(_BYTE *)(a1 + 40 * v20 + (char)*v21 + 30848) = v12;
  int v22 = (char)*v21;
  if (v22 <= 39) {
    *uint64_t v21 = v22 + 1;
  }
}

double scltb(uint64_t a1, int a2)
{
  char v4 = (_DWORD *)(a1 + 29640);
  if (*(int *)(a1 + 32148) >= 1)
  {
    uint64_t v5 = 0LL;
    do
      linecq(a1, *(unsigned __int8 *)(a1 + 32108 + v5++));
    while (v5 < (int)v4[627]);
  }

  v4[627] = 0;
  if (a2 >= 1) {
    linecq(a1, a2);
  }
  if (*v4 != 3)
  {
    *(void *)&double result = 1LL;
    *(void *)(a1 + 30840) = 1LL;
  }

  return result;
}

uint64_t sgose(uint64_t result)
{
  unsigned __int8 v8 = (_DWORD *)(result + 32048);
  uint64_t v1 = *(unsigned int *)(result + 32048);
  if ((int)v1 >= 1)
  {
    uint64_t v2 = result;
    uint64_t v3 = result + 30848;
    unsigned int v4 = v1 - 1;
    do
    {
      uint64_t v5 = (char *)(v2 + (v1 - 1) + 32056);
      if (*v5 >= 1)
      {
        uint64_t v6 = 0LL;
        do
          double result = linecq(v2, *(unsigned __int8 *)(v3 + 40LL * v4 + v6++));
        while (v6 < *v5);
      }

      --v4;
    }

    while (v1-- >= 2);
  }

  _DWORD *v8 = 0;
  return result;
}

double scswp(uint64_t a1)
{
  uint64_t v2 = (_DWORD *)(a1 + 29640);
  if (*(_DWORD *)(a1 + 32096) != 2) {
    return scltb(a1, -1);
  }
  int v3 = *(_DWORD *)(a1 + 32100);
  if (v3 < 0) {
    return scltb(a1, -1);
  }
  LODWORD(v4) = *(_DWORD *)(a1 + 32104);
  if ((v4 & 0x80000000) != 0) {
    return scltb(a1, -1);
  }
  if ((_DWORD)v4)
  {
    uint64_t v5 = 0LL;
    do
    {
      linecq(a1, *(unsigned __int8 *)(a1 + 32108 + v5));
      uint64_t v4 = (int)v2[616];
      ++v5;
    }

    while (v5 < v4);
    int v3 = v2[615];
  }

  if (v3 + 2 <= v2[627])
  {
    uint64_t v7 = v3;
    do
    {
      linecq(a1, *(unsigned __int8 *)(a1 + 32109 + v7));
      uint64_t v8 = v7 + 2;
      ++v7;
    }

    while (v8 < (int)v2[627]);
    LODWORD(v4) = v2[616];
  }

  if (*v2 == 2 && *(_BYTE *)(a1 + (int)v4 + 32108) != 37)
  {
    linecq(a1, 32);
    LODWORD(v4) = v2[616];
  }

  if ((int)v4 < v2[615])
  {
    uint64_t v4 = (int)v4;
    do
    {
      uint64_t v9 = v4 + 1;
      linecq(a1, *(unsigned __int8 *)(a1 + 32108 + v4));
      uint64_t v4 = v9;
    }

    while (v9 < (int)v2[615]);
  }

  v2[627] = 0;
  if (*v2 != 3)
  {
    *(void *)&double result = 1LL;
    *(void *)(a1 + 30840) = 1LL;
  }

  return result;
}

uint64_t strcic(char *a1, char *a2)
{
  __darwin_ct_rune_t v4 = __tolower(*a1);
  int v5 = (char)v4;
  char v6 = __tolower(*a2);
  __darwin_ct_rune_t v7 = v4 << 24;
  uint64_t v8 = a1 + 1;
  uint64_t v9 = a2 + 1;
  while (v7)
  {
    __darwin_ct_rune_t v10 = *v8++;
    __darwin_ct_rune_t v11 = __tolower(v10);
    __darwin_ct_rune_t v7 = v11 << 24;
    int v5 = (char)v11;
    __darwin_ct_rune_t v12 = *v9++;
    char v6 = __tolower(v12);
    if (v5 != v6) {
      return (v5 - v6);
    }
  }

  return 0LL;
}

_BYTE *strcpx(_BYTE *result, unsigned __int8 *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    __darwin_ct_rune_t v4 = result;
    while (1)
    {
      int v5 = *a2++;
      _BYTE *v4 = v5;
      if (!v5) {
        break;
      }
      ++v4;
      if (!--v3) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    result[a3 - 1] = 0;
  }

  return result;
}

void dxbte_engine_create(void *a1, uint64_t a2)
{
  __darwin_ct_rune_t v4 = a1 + 3684;
  bzero(a1, 0x8738uLL);
  dxnin_engine_create(a1, a2);
  _DWORD *v4 = 0;
  a1[3685] = a2;
  v4[300] = 0;
  v4[1223] = 0;
  v4[1239] = 0;
  v4[1255] = 0;
}

uint64_t dxbte_engine_destroy(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 29472)) {
    return dxbte_engine_deactivate(a1);
  }
  return a1;
}

uint64_t dxbte_engine_deactivate(uint64_t a1)
{
  uint64_t v2 = a1 + 29472;
  if (*(_DWORD *)(a1 + 29472))
  {
    if (*(void *)(a1 + 34560))
    {
      dxbte_engine_deactivate();
      free(*(void **)(v2 + 5088));
      *(void *)(v2 + 5088) = 0LL;
    }

    prdtf((void **)a1);
    dxnin_engine_deactivate(a1);
    uint64_t v3 = 0LL;
    *(_DWORD *)uint64_t v2 = 0;
  }

  else
  {
    uint64_t v3 = 100LL;
    dxerr_report_activate(*(void *)(a1 + 29480), (uint64_t)&dxbte_pg_name, 100);
  }

  return v3;
}

uint64_t dxbte_engine_activate_tablename( uint64_t *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9, char *a10, char *a11, int a12)
{
  uint64_t v19 = 1LL;
  uint64_t v20 = dxios_search_open(a10, 0LL, 255LL, 1LL, 288);
  if (v20)
  {
    uint64_t v21 = v20;
    int v22 = a8;
    int v23 = dxios_search_open(a11, 0LL, 255LL, 0LL, 288);
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v19 = dxbte_engine_activate(a1, a2, a3, a4, a5, a6, a7, v22, a9, (uint64_t)v21, (uint64_t)v23, a12);
      dxios_close(v21);
      dxios_close(v24);
      if (!(_DWORD)v19) {
        return v19;
      }
    }

    else
    {
      dxios_close(v21);
      uint64_t v19 = 6LL;
    }
  }

  dxerr_report_activate(a1[3685], (uint64_t)&dxbte_pg_name, v19);
  return v19;
}

uint64_t dxbte_engine_activate( uint64_t *a1, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8, int a9, uint64_t a10, uint64_t a11, int a12)
{
  uint64_t v20 = a1 + 3684;
  dxios_stream_create((uint64_t)v24, a1[3685]);
  dxios_stream_activate_buf((uint64_t)v24, 1u, (uint64_t)"", 0LL);
  if (*(_DWORD *)v20)
  {
    uint64_t v21 = 110LL;
  }

  else
  {
    uint64_t v21 = dxnin_engine_activate((uint64_t)a1, a11, (uint64_t)v24, a2, a4, a5);
    if (!(_DWORD)v21)
    {
      *(_DWORD *)uint64_t v20 = 1;
      *((_DWORD *)v20 + 5) = a8;
      *((_DWORD *)v20 + 6) = a9;
      *((_DWORD *)v20 + 12) = a3;
      a1[3688] = a6;
      a1[3689] = a7;
      a1[3691] = 0LL;
      int v22 = dummy_style_func;
      if (a4) {
        int v22 = (void (*)(uint64_t@<X1>, void *@<X3>, void *@<X8>))a4;
      }
      v20[609] = (uint64_t)v22;
      v20[610] = a5;
      *((_DWORD *)v20 + 4) = a12;
      uint64_t v21 = prdtqr((uint64_t)a1, a10);
      *((_DWORD *)v20 + 299) = *((_DWORD *)v20 + 75);
      siniq((uint64_t)a1);
      if ((_DWORD)v21)
      {
        dxerr_report_activate(a1[3685], (uint64_t)&dxbte_pg_name, v21);
        dxbte_engine_deactivate((uint64_t)a1);
      }
    }
  }

  dxios_stream_destroy(v24);
  return v21;
}

void dummy_style_func(uint64_t a1@<X1>, void *a2@<X3>, void *a3@<X8>)
{
  a3[2] = 0LL;
  a3[3] = 0LL;
  *a3 = a1;
  a3[1] = 0LL;
  if (a2) {
    *a2 = a1;
  }
}

uint64_t dxbte_engine_get_trnmod(uint64_t a1, _DWORD *a2)
{
  uint64_t v2 = a1 + 29472;
  if (!*(_DWORD *)(a1 + 29472)) {
    return 100LL;
  }
  if (!a2) {
    return 120LL;
  }
  uint64_t result = 0LL;
  *a2 = *(_DWORD *)(v2 + 1320);
  return result;
}

uint64_t dxbte_engine_process(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = a1 + 29488;
  int v7 = *(_DWORD *)(a1 + 29496);
  if (*(_DWORD *)(a1 + 29492)) {
    whrini();
  }
  if (a4)
  {
    uint64_t v8 = a1;
    int v214 = a4;
    unint64_t v9 = *a4 - 1;
    uint64_t v10 = a4[3 * v9 + 3];
    uint64_t v8 = a1;
    if (!v10) {
      goto LABEL_13;
    }
    uint64_t v8 = a1;
    while (1)
    {
      uint64_t v8 = *(void *)(v8 + 34560);
      if (!v8) {
        break;
      }
      if (!--v10) {
        goto LABEL_12;
      }
    }

    uint64_t v8 = a1;
LABEL_12:
    if (v9 >= 8)
    {
LABEL_14:
      *(_OWORD *)(v8 + 32888) = 0u;
    }

    else
    {
LABEL_13:
      __darwin_ct_rune_t v11 = &a4[3 * v9];
      *(void *)(v8 + 32888) = v11[1];
      *(void *)(v8 + 32896) = v11[2];
    }
  }

  else
  {
    __int128 v233 = 0u;
    __int128 v232 = 0u;
    __int128 v231 = 0u;
    __int128 v230 = 0u;
    __int128 v229 = 0u;
    __int128 v228 = 0u;
    __int128 v227 = 0u;
    __int128 v226 = 0u;
    __int128 v225 = 0u;
    __int128 v224 = 0u;
    __int128 v222 = 0u;
    __int128 v223 = 0u;
    uint64_t v221 = 1LL;
    int v214 = &v221;
    uint64_t v8 = a1;
  }

  siniq(a1);
  *(_DWORD *)(v8 + 34004) = 0;
  uint64_t v207 = (char *)(a1 + 34272);
  *(_DWORD *)(v8 + 34360) = -2;
  uint64_t v205 = v6;
  v206 = (void *)(v6 + 3400);
  *(_DWORD *)(v8 + 34268) = -1;
  *(_DWORD *)(v8 + 32336) = 0;
LABEL_16:
  __darwin_ct_rune_t v12 = (_DWORD *)(v8 + 29492);
  dxnin_engine_reactivate(v8, a2);
  *(void *)(v8 + 29528) = a3;
  linitq(v8, *(_DWORD *)(v8 + 29520), a3, v8);
  uint64_t v13 = 0LL;
  __b = (__int128 *)(v8 + 32344);
  else {
    uint64_t v14 = v8 + 34012;
  }
  do
  {
    *(_DWORD *)(v14 + v13) = dxnin_engine_getc(v8);
    v13 += 4LL;
  }

  while (v13 != 256);
  else {
    *(_DWORD *)(v8 + 34008) = 0;
  }
  if (v7)
  {
    for (uint64_t i = 0LL; i != 22; ++i)
      stacq(v8, pg_wdemo[i]);
    stacq(v8, 32);
  }

  uint64_t v208 = v8 + 34272;
  v209 = (__int128 *)(v8 + 34304);
  uint64_t v220 = v8 + 32600;
LABEL_28:
  int v16 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344);
  if (*(_DWORD *)(v8 + 30792)) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v16 == 23;
  }
  if (v17)
  {
    do
    {
      ttmark(v8);
      int v16 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344);
    }

    while (v16 == 23);
  }

  while (1)
  {
    if (v16 != 256)
    {
      int v22 = *(_DWORD *)(v8 + 4LL * v16 + 29644);
      if (v22 <= 0)
      {
        int v24 = *(_DWORD *)(v8 + 34364);
        if (v24 <= 14)
        {
          *(_DWORD *)(v8 + 4LL * v24 + 34368) = v16;
          int v24 = *(_DWORD *)(v8 + 34364);
        }

        if (v24 != 0x7FFFFFFF) {
          *(_DWORD *)(v8 + 34364) = v24 + 1;
        }
        int v25 = *(_DWORD *)(v8 + 4LL * *(unsigned __int8 *)(v8 + 30800) + 29644);
        int v26 = *(_DWORD *)(v8 + 30796);
        if (v26 != 1)
        {
          if (v26 > 1)
          {
            int v69 = *(_DWORD *)(v8 + 32340);
            goto LABEL_248;
          }

          goto LABEL_251;
        }

        int v215 = *(_DWORD *)(v8 + 4LL * *(unsigned __int8 *)(v8 + 30800) + 29644);
        int v23 = (int *)(*(void *)(v8 + 30712) + 4LL * (v25 - 1));
      }

      else
      {
        int v215 = *(_DWORD *)(v8 + 4LL * v16 + 29644);
        int v23 = (int *)(*(void *)(v8 + 30712) + 4LL * (v22 - 1));
      }

      int v27 = *v23;
      if (*v23 < 1)
      {
LABEL_122:
        int v26 = *(_DWORD *)(v8 + 30796);
        if (v26 <= 1)
        {
          int v25 = v215;
          goto LABEL_251;
        }

        int v69 = *(_DWORD *)(v8 + 32340);
        if ((v27 & 0x80000000) == 0)
        {
          int v25 = v215;
          if ((dusci[12 * *(int *)(v8 + 4LL * v69 + 32344)] & 0x20) == 0)
          {
LABEL_251:
            if (*(int *)(v8 + 34004) < 1)
            {
              int v130 = dxnin_engine_getc(v8);
            }

            else
            {
              uint64_t v128 = *(int *)(v8 + 34336);
              if ((int)v128 >= *(_DWORD *)(v8 + 34340))
              {
                int v130 = 256;
              }

              else
              {
                uint64_t v129 = *(void *)(v8 + 34328);
                *(_DWORD *)(v8 + 34336) = v128 + 1;
                int v130 = *(unsigned __int8 *)(v129 + v128);
              }
            }

            *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344) = v130;
            unsigned int v143 = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
            *(_DWORD *)(v8 + 32340) = v143;
            uint64_t v144 = v25 - 1LL;
            unsigned int v145 = *(unsigned __int8 *)(*(void *)(v8 + 30704) + v144);
            if (v145 > 0x1F || *(_DWORD *)(v8 + 30792))
            {
LABEL_283:
              if (*(_DWORD *)(v8 + 34004) <= 1u) {
                stacq(v8, v145);
              }
            }

            else
            {
              switch(*(_BYTE *)(*(void *)(v8 + 30704) + v144))
              {
                case 0xC:
                case 0xD:
                case 0x16:
                case 0x1B:
                  break;
                case 0xE:
                case 0xF:
                case 0x10:
                case 0x11:
                case 0x12:
                case 0x13:
                case 0x17:
                  goto LABEL_283;
                case 0x14:
                  tttbl(v8);
                  break;
                case 0x15:
                  goto LABEL_322;
                case 0x18:
                  int v165 = *(_DWORD *)(v8 + 4LL * v143 + 32344);
                  goto LABEL_320;
                case 0x19:
LABEL_320:
                  ttsh1(v8);
                  break;
                case 0x1A:
                  ttshnd(v8, 1);
                  break;
                default:
                  if (v145 != 1) {
                    goto LABEL_283;
                  }
                  ttsng(v8);
                  break;
              }
            }

            v125 = (int *)(*(void *)(v8 + 30696) + 4 * v144);
            goto LABEL_307;
          }
        }

LABEL_248:
        int v126 = *(_DWORD *)(v8 + 4LL * v69 + 32344);
        if (v126 == 256)
        {
          int v127 = 256;
        }

        else
        {
          int v127 = *(_DWORD *)(v8 + 4LL * v69 + 32344);
          do
          {
            if (*(int *)(v8 + 34004) < 1)
            {
              int v133 = dxnin_engine_getc(v8);
              int v69 = *(_DWORD *)(v8 + 32340);
            }

            else
            {
              uint64_t v131 = *(int *)(v8 + 34336);
              if ((int)v131 >= *(_DWORD *)(v8 + 34340))
              {
                int v133 = 256;
              }

              else
              {
                uint64_t v132 = *(void *)(v8 + 34328);
                *(_DWORD *)(v8 + 34336) = v131 + 1;
                int v133 = *(unsigned __int8 *)(v132 + v131);
              }
            }

            *(_DWORD *)(v8 + 4LL * v69 + 32344) = v133;
            int v69 = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
            *(_DWORD *)(v8 + 32340) = v69;
            if ((dusci[12 * v126] & 0x20) == 0) {
              break;
            }
            int v126 = *(_DWORD *)(v8 + 4LL * v69 + 32344);
            int v127 = v126 + (v127 << 8);
          }

          while (v126 != 256);
          int v26 = *(_DWORD *)(v8 + 30796);
        }

        if (v26 == 2 || (stacq(v8, 32), *(_DWORD *)(v8 + 30796) != 4)) {
          int v134 = 64;
        }
        else {
          int v134 = 59;
        }
        stacq(v8, v134);
        stacq(v8, 36);
        chdiu(v127);
        if (v127 == 62762)
        {
          for (uint64_t j = 0LL; j != 11; ++j)
            stacq(v8, unsupp[j]);
LABEL_306:
          stacq(v8, 32);
          v125 = (int *)(*(void *)(v8 + 30696) + 4LL * *(int *)(v8 + 29772) - 4);
          goto LABEL_307;
        }

        int v136 = chdiu(v127);
        BOOL v137 = v136 == 42;
        BOOL v138 = v127 != 42;
        if (v137 && v138) {
          int v139 = 100;
        }
        else {
          int v139 = 117;
        }
        if (v137 && v138) {
          int v140 = v127;
        }
        else {
          int v140 = v136;
        }
        stacq(v8, v139);
        int v141 = *(_DWORD *)(v8 + 30796);
        if (v141 == 4)
        {
          int v142 = 43;
        }

        else
        {
          if (v141 <= 3) {
            stacq(v8, 34);
          }
          int v142 = 54;
        }

        stacq(v8, v142);
        int v146 = 1;
        do
        {
          unsigned int v147 = v146;
          int v148 = v140 / v146;
          v146 *= 16;
        }

        while (v148 > 15);
        int v149 = 0;
        while (2)
        {
          int v150 = *(_DWORD *)(v8 + 30796);
          int v151 = v140 / (int)v147;
          if (v150 > 3)
          {
            BOOL v17 = v150 == 4;
            int v154 = &ahdig[v151];
            if (v17) {
              int v154 = &lhdig[v151];
            }
          }

          else
          {
            if (v151 < 10)
            {
              int v152 = 1;
              if (!v149)
              {
                int v153 = 35;
LABEL_303:
                stacq(v8, v153);
              }
            }

            else
            {
              int v152 = 0;
              if (v149)
              {
                int v153 = 59;
                goto LABEL_303;
              }
            }

            int v154 = &uhdig[v151];
            int v149 = v152;
          }

          stacq(v8, *v154);
          v140 %= (int)v147;
          BOOL v102 = v147 > 0xF;
          v147 >>= 4;
          if (!v102) {
            goto LABEL_306;
          }
          continue;
        }
      }

      int v217 = 0;
      *(_DWORD *)(v8 + 32864) = *(_DWORD *)(v8 + 32340);
      *(void *)(v8 + 32856) = 0LL;
      uint64_t v28 = 1LL;
      int v29 = v27;
      int v211 = v27;
LABEL_54:
      uint64_t v216 = (int)v28;
      uint64_t v219 = v28;
      while (1)
      {
        uint64_t v30 = *(void *)(v8 + 29560);
        int v218 = v29;
        uint64_t v31 = *(void *)(v30 + 8LL * (v29 - 1));
        unsigned int v32 = *(_DWORD *)(*(void *)(v8 + 29576) + 4LL * (v29 - 1));
        int v29 = *(_DWORD *)(*(void *)(v8 + 29568) + 4LL * (v29 - 1));
        uint64_t v33 = v28;
        if ((v32 & 0x3F) != 0)
        {
          if (!(_BYTE)v217)
          {
            uint64_t v34 = (int)((v32 & 0x3F) + v219);
            uint64_t v33 = v216;
            while ((v33 <= *(int *)(v8 + 32860) || trcedbc(v8, v33))
                 && *(_DWORD *)(v220 + 4 * v33) == *(unsigned __int8 *)(*(void *)(v8 + 29584) + v31 - 1))
            {
              ++v31;
              if (++v33 >= v34) {
                goto LABEL_65;
              }
            }
          }

          goto LABEL_57;
        }

LABEL_65:
        int v35 = v32 & 0xC0;
        if (v35 != 192)
        {
          int v39 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 4LL * (int)v33 + 32600) + 29644);
          unsigned int v40 = v39 - 1;
          if (v39 < 1) {
            goto LABEL_57;
          }
          uint64_t v41 = *(void *)(v8 + 29584);
          int v42 = *(unsigned __int8 *)(v31 + v41 - 1);
          if (v35 == 128 || v42 == 254)
          {
            *(_OWORD *)(v8 + 32868) = xmmword_2F820;
            int v56 = v42 | (*(unsigned __int8 *)(v41 + v31) << 8);
            if (v35 == 128) {
              unsigned int v57 = v56;
            }
            else {
              unsigned int v57 = *(unsigned __int8 *)(v41 + v31);
            }
            if ((int)trcck(v8, v33, v57) < 1)
            {
              *(_DWORD *)(v8 + 32868) = -2;
              goto LABEL_57;
            }

            v31 += 2LL;
            int v58 = *(_DWORD *)(v8 + 32868);
            if ((v58 & 0x80000000) == 0) {
              *(_DWORD *)(v8 + 32868) = v58 + ~(_DWORD)v33 + *(_DWORD *)(v8 + 32872);
            }
          }

          else
          {
            if ((v32 & 0x40) != 0)
            {
              ++v31;
            }

            else
            {
              int v43 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 4 * ((int)v33 + 1LL) + 32600) + 29644);
              BOOL v44 = __OFSUB__(v43, 1);
              int v45 = v43 - 1;
              if (v45 < 0 != v44
                || !btestv( (void *)(*(void *)(v8 + 30688) + 8LL * v45),  *(char *)(*(void *)(v8 + 29584) + v31)))
              {
                goto LABEL_57;
              }

              v31 += 2LL;
            }
          }
        }

        int v36 = 1;
        *(_DWORD *)(v8 + 33928) = 1;
        if ((v32 & 0x8000) == 0)
        {
          uint64_t v37 = *(void *)(v8 + 29584);
          int v36 = *(unsigned __int8 *)(v31 + v37 - 1);
          *(_DWORD *)(v8 + 33928) = v36;
          if (*(int *)(v8 + 29636) < 15)
          {
            ++v31;
          }

          else
          {
            int v38 = *(unsigned __int8 *)(v37 + v31);
            v31 += 2LL;
            v36 |= v38 << 8;
            *(_DWORD *)(v8 + 33928) = v36;
          }
        }

        uint64_t v46 = *(unsigned int *)(v8 + 32884);
        if ((int)v46 < 1)
        {
LABEL_115:
          int v64 = 2;
          *(_DWORD *)(v8 + 33932) = 2;
          if ((v32 & 0x4000) == 0)
          {
            uint64_t v65 = v31 + *(void *)(v8 + 29584);
            ++v31;
            int v64 = *(unsigned __int8 *)(v65 - 1);
            *(_DWORD *)(v8 + 33932) = v64;
          }

          LODWORD(v66) = (v32 >> 8) & 0x3F;
          *(_DWORD *)(v8 + 33936) = v66;
          if ((_DWORD)v66)
          {
            uint64_t v67 = 0LL;
            uint64_t v68 = *(void *)(v8 + 29584) + v31 - 1;
            do
            {
              *(_BYTE *)(v8 + 33940 + v67) = *(_BYTE *)(v68 + v67);
              uint64_t v66 = *(int *)(v8 + 33936);
              ++v67;
            }

            while (v67 < v66);
            if (!v64) {
              goto LABEL_186;
            }
          }

          else if (!v64)
          {
            goto LABEL_186;
          }

          int v70 = 0;
          do
          {
            if (!*(_DWORD *)(v8 + 30792))
            {
              if (v70 >= 1)
              {
                do
                {
                  uint64_t v71 = *(int *)(v8 + 32340);
                  if (*(_DWORD *)(v8 + 4 * v71 + 32344) != 28) {
                    break;
                  }
                  if (*(_DWORD *)(v8 + 4LL * (((_BYTE)v71 + 1) & 0x3F) + 32344) != 101) {
                    break;
                  }
                  int v72 = *(_DWORD *)(v8 + 4LL * (((_BYTE)v71 + 2) & 0x3F) + 32344);
                  if (v72 != 115 && v72 != 101) {
                    break;
                  }
                  if (*(_DWORD *)(v8 + 4LL * (((_BYTE)v71 + 3) & 0x3F) + 32344) != 126) {
                    break;
                  }
                  int v73 = 4;
                  do
                  {
                    if (*(int *)(v8 + 34004) < 1)
                    {
                      int v76 = dxnin_engine_getc(v8);
                      LODWORD(v71) = *(_DWORD *)(v8 + 32340);
                    }

                    else
                    {
                      uint64_t v74 = *(int *)(v8 + 34336);
                      if ((int)v74 >= *(_DWORD *)(v8 + 34340))
                      {
                        int v76 = 256;
                      }

                      else
                      {
                        uint64_t v75 = *(void *)(v8 + 34328);
                        *(_DWORD *)(v8 + 34336) = v74 + 1;
                        int v76 = *(unsigned __int8 *)(v75 + v74);
                      }
                    }

                    *(_DWORD *)(v8 + 4LL * (int)v71 + 32344) = v76;
                    LODWORD(v71) = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
                    *(_DWORD *)(v8 + 32340) = v71;
                    --v73;
                  }

                  while (v73);
                  BOOL v77 = v72 != 115;
                  int v78 = *(_DWORD *)(v8 + 4LL * v71 + 32344);
                  if ((v78 - 31) >= 2)
                  {
                    unint64_t v79 = 0LL;
                    do
                    {
                      if (v78 == 96 || v79 > 0x1E) {
                        break;
                      }
                      v234[v79] = v78;
                      if (*(int *)(v8 + 34004) < 1)
                      {
                        int v82 = dxnin_engine_getc(v8);
                        LODWORD(v71) = *(_DWORD *)(v8 + 32340);
                      }

                      else
                      {
                        uint64_t v80 = *(int *)(v8 + 34336);
                        if ((int)v80 >= *(_DWORD *)(v8 + 34340))
                        {
                          int v82 = 256;
                        }

                        else
                        {
                          uint64_t v81 = *(void *)(v8 + 34328);
                          *(_DWORD *)(v8 + 34336) = v80 + 1;
                          int v82 = *(unsigned __int8 *)(v81 + v80);
                        }
                      }

                      *(_DWORD *)(v8 + 32344 + 4LL * (int)v71) = v82;
                      LODWORD(v71) = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
                      *(_DWORD *)(v8 + 32340) = v71;
                      int v78 = *(_DWORD *)(v8 + 32344 + 4LL * v71);
                      ++v79;
                    }

                    while ((v78 - 31) > 1);
                  }

                  else
                  {
                    unint64_t v79 = 0LL;
                  }

                  v234[v79] = 0;
                  if (*(int *)(v8 + 34004) < 1)
                  {
                    int v85 = dxnin_engine_getc(v8);
                    LODWORD(v71) = *(_DWORD *)(v8 + 32340);
                  }

                  else
                  {
                    uint64_t v83 = *(int *)(v8 + 34336);
                    if ((int)v83 >= *(_DWORD *)(v8 + 34340))
                    {
                      int v85 = 256;
                    }

                    else
                    {
                      uint64_t v84 = *(void *)(v8 + 34328);
                      *(_DWORD *)(v8 + 34336) = v83 + 1;
                      int v85 = *(unsigned __int8 *)(v84 + v83);
                    }
                  }

                  *(_DWORD *)(v8 + 4LL * (int)v71 + 32344) = v85;
                  *(_DWORD *)(v8 + 32340) = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
                  (*(void (**)(__int128 *__return_ptr, void, char *, BOOL, void))(v8 + 34344))( &v235,  *(void *)(v8 + 34352),  v234,  v77,  0LL);
                  uint64_t v86 = *((void *)&v236 + 1);
                  if (*((void *)&v236 + 1))
                  {
                    int v87 = strlen(*((const char **)&v236 + 1));
                    if (v87 >= 1)
                    {
                      int v88 = v70 + v87;
                      int v89 = *(_DWORD *)(v8 + 33932);
                      if (v70 + v87 > v89)
                      {
                        int v90 = 0;
                        *(_DWORD *)(v8 + 34008) = 0;
                        do
                        {
                          *(_DWORD *)(v8 + 4LL * v90 + 34012) = *(_DWORD *)(v8 + 4LL * v90 + 32344);
                          int v91 = *(_DWORD *)(v8 + 34008);
                          int v90 = v91 + 1;
                          *(_DWORD *)(v8 + 34008) = v91 + 1;
                        }

                        while (v91 < 63);
                        int v92 = 0;
                        int v93 = 0;
                        *(_DWORD *)(v8 + 34008) = *(_DWORD *)(v8 + 32340);
                        *(_DWORD *)(v8 + 34004) = 2;
                        *(_DWORD *)(v8 + 34360) = -2;
                        *(_DWORD *)(v8 + 32340) = 0;
                        do
                        {
                          if (v92 >= v87) {
                            int v94 = 256;
                          }
                          else {
                            int v94 = *(unsigned __int8 *)(v86 + v92++);
                          }
                          *(_DWORD *)(v8 + 4LL * v93 + 32344) = v94;
                          int v95 = *(_DWORD *)(v8 + 32340);
                          int v93 = v95 + 1;
                          *(_DWORD *)(v8 + 32340) = v95 + 1;
                        }

                        while (v95 < 63);
                        int v96 = *(_DWORD *)(v8 + 33932);
                        *(_DWORD *)(v8 + 32340) = v96 - v70;
                        if (v96 - v70 < 1)
                        {
                          int v70 = v96;
                        }

                        else
                        {
                          memset_pattern16(__b, &unk_2F830, 4LL * (v96 + ~v70) + 4);
                          int v70 = *(_DWORD *)(v8 + 33932);
                        }

                        break;
                      }

                      v70 += v87;
                      if (v88 >= v89) {
                        break;
                      }
                    }
                  }
                }

                while (v70 > 0);
              }

              if (v70 >= *(_DWORD *)(v8 + 33932)) {
                break;
              }
            }

            if (*(int *)(v8 + 34004) < 1)
            {
              int v99 = dxnin_engine_getc(v8);
            }

            else
            {
              uint64_t v97 = *(int *)(v8 + 34336);
              if ((int)v97 >= *(_DWORD *)(v8 + 34340))
              {
                int v99 = 256;
              }

              else
              {
                uint64_t v98 = *(void *)(v8 + 34328);
                *(_DWORD *)(v8 + 34336) = v97 + 1;
                int v99 = *(unsigned __int8 *)(v98 + v97);
              }
            }

            *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344) = v99;
            *(_DWORD *)(v8 + 32340) = (*(_DWORD *)(v8 + 32340) + 1) & 0x3F;
            ++v70;
          }

          while (v70 < *(_DWORD *)(v8 + 33932));
          LODWORD(v66) = *(_DWORD *)(v8 + 33936);
LABEL_186:
          if ((int)v66 >= 1)
          {
            int v100 = 1;
            while (1)
            {
              unsigned int v101 = *(unsigned __int8 *)(v8 + v100 + 33939);
              if (v101 <= 0x1F && !*(_DWORD *)(v8 + 30792)) {
                break;
              }
LABEL_190:
              if (*(_DWORD *)(v8 + 34004) <= 1u) {
                stacq(v8, v101);
              }
LABEL_192:
              LODWORD(v66) = *(_DWORD *)(v8 + 33936);
              BOOL v102 = v100++ < (int)v66;
              if (!v102) {
                goto LABEL_245;
              }
            }

            uint64_t v103 = v100;
            switch(*(_BYTE *)(v8 + v100 + 33939))
            {
              case 0xC:
                if (v100 < (int)v66)
                {
                  ++v100;
                  int v104 = *(unsigned __int8 *)(v8 + v103 + 33940);
                  if ((v104 - 129) >= 0xFFFFFF80)
                  {
                    unsigned int v105 = v104 - 1;
                    uint64_t v106 = v8 + 8LL * v105;
                    *(void *)(v106 + 32904) *= 2LL;
                    *(void *)(v106 + 32904) |= btestv((void *)(v8 + 8LL * (v105 >> 6) + 32888), v105 & 0x3F);
                  }
                }

                goto LABEL_192;
              case 0xD:
                if (v100 < (int)v66)
                {
                  ++v100;
                  int v107 = *(unsigned __int8 *)(v8 + v103 + 33940);
                  if ((v107 - 129) >= 0xFFFFFF80)
                  {
                    unsigned int v108 = v107 - 1;
                    int v109 = (uint64_t *)(v8 + 8LL * v108 + 32904);
                    v110 = (void *)(v8 + 8LL * (v108 >> 6) + 32888);
                    int v111 = v108 & 0x3F;
                    if ((*v109 & 1) != 0) {
                      bsetv(v110, v111);
                    }
                    else {
                      bclrv(v110, v111);
                    }
                    *v109 >>= 1;
                  }
                }

                goto LABEL_192;
              case 0xE:
              case 0xF:
              case 0x10:
              case 0x11:
              case 0x12:
              case 0x13:
              case 0x17:
                goto LABEL_190;
              case 0x14:
                tttbl(v8);
                goto LABEL_192;
              case 0x15:
LABEL_322:
                void *v206 = 0LL;
                v206[1] = 0LL;
                uint64_t v166 = *(unsigned int *)(v8 + 34268);
                if ((int)v166 >= 1)
                {
                  *(_BYTE *)(v8 + v166 + 34272) = 0;
                  int v167 = *(unsigned int (**)(void, uint64_t, char *, uint64_t, __int128 *, uint64_t))(v8 + 29504);
                  if (v167 && v167(*(void *)(v8 + 29512), v208, v234, 40LL, &v235, 40LL))
                  {
                    uint64_t v168 = a1;
                    do
                    {
                      uint64_t v169 = v168;
                      uint64_t v168 = *(void *)(v168 + 34568);
                    }

                    while (v168);
                    uint64_t v170 = a1;
                    do
                    {
                      uint64_t v171 = v170;
                      v172 = (char **)(v170 + 34560);
                      uint64_t v170 = *(void *)(v170 + 34560);
                    }

                    while (v170);
                    if (v169)
                    {
                      v173 = (char *)v169;
                      while (strcic(v173 + 34584, v207))
                      {
                        v173 = (char *)*((void *)v173 + 4320);
                        if (!v173) {
                          goto LABEL_333;
                        }
                      }

LABEL_336:
                      uint64_t v169 = (uint64_t)v173;
                    }

                    else
                    {
LABEL_333:
                      int v174 = (char *)malloc(0x8738uLL);
                      if (v174)
                      {
                        v173 = v174;
                        dxbte_engine_create(v174, *(void *)(a1 + 29480));
                        if (!dxbte_engine_activate_tablename( (uint64_t *)v173,  *(_DWORD *)(a1 + 56),  *(_DWORD *)(v205 + 32),  *(void *)(v205 + 4856),  *(void *)(v205 + 4864),  *(void *)(a1 + 29504),  *(void *)(a1 + 29512),  *(_DWORD *)(v205 + 4),  0,  v234,  (char *)&v235,  *(_DWORD *)v205))
                        {
                          *((void *)v173 + 4321) = v171;
                          unsigned __int8 *v172 = v173;
                          strcpx(v173 + 34584, (unsigned __int8 *)v207, 30LL);
                          goto LABEL_336;
                        }
                      }
                    }

                    unint64_t v175 = (*v214)++;
                    uint64_t v176 = a1;
                    if (v175 > 7) {
                      goto LABEL_354;
                    }
                    uint64_t v177 = &v214[3 * v175];
                    v177[1] = *(void *)(v169 + 32888);
                    v177[2] = *(void *)(v169 + 32896);
                    uint64_t v178 = a1;
                    if (v169 != a1)
                    {
                      LODWORD(v179) = 0;
                      while (v178)
                      {
                        LODWORD(v179) = v179 + 1;
                        uint64_t v178 = *(void *)(v178 + 34560);
                        if (v178 == v169) {
                          goto LABEL_352;
                        }
                      }
                    }

                    LODWORD(v179) = 0;
LABEL_352:
                    uint64_t v179 = (int)v179;
                    uint64_t v180 = v214;
                  }

                  else
                  {
                    unint64_t v175 = (*v214)++;
                    uint64_t v176 = a1;
                    if (v175 > 7) {
                      goto LABEL_354;
                    }
                    uint64_t v179 = 0LL;
                    uint64_t v180 = v214;
                    int v181 = &v214[3 * v175];
                    v181[1] = *(void *)(v205 + 3400);
                    v181[2] = *(void *)(v205 + 3408);
                    uint64_t v169 = a1;
                  }

                  v180[3 * v175 + 3] = v179;
                  uint64_t v176 = v169;
                  goto LABEL_354;
                }

                uint64_t v182 = *v214;
                uint64_t v176 = a1;
                if ((unint64_t)*v214 >= 2)
                {
                  *int v214 = v182 - 1;
                  uint64_t v176 = a1;
                  if ((unint64_t)(v182 - 10) >= 0xFFFFFFFFFFFFFFF8LL)
                  {
                    uint64_t v183 = v214[3 * v182 - 3];
                    uint64_t v176 = a1;
                    if (v183)
                    {
                      while (1)
                      {
                        uint64_t v176 = *(void *)(v176 + 34560);
                        if (!v176) {
                          break;
                        }
                        if (!--v183) {
                          goto LABEL_354;
                        }
                      }

                      uint64_t v176 = a1;
                    }
                  }
                }

LABEL_354:
                int v7 = 0;
                *(void *)(v176 + 29528) = *(void *)(v8 + 29528);
                *(_DWORD *)(v176 + 34004) = *(_DWORD *)(v8 + 34004);
                *(_DWORD *)(v176 + 34360) = -2;
                *(void *)(v176 + 34336) = *(void *)(v8 + 34336);
                __int128 v184 = *v209;
                *(_OWORD *)(v176 + 34320) = *(_OWORD *)(v8 + 34320);
                *(_OWORD *)(v176 + 34304) = v184;
                __int128 v185 = *(_OWORD *)(v8 + 32456);
                __int128 v187 = *(_OWORD *)(v8 + 32408);
                __int128 v186 = *(_OWORD *)(v8 + 32424);
                *(_OWORD *)(v176 + 32440) = *(_OWORD *)(v8 + 32440);
                *(_OWORD *)(v176 + 32456) = v185;
                *(_OWORD *)(v176 + 32408) = v187;
                *(_OWORD *)(v176 + 32424) = v186;
                __int128 v188 = *(_OWORD *)(v8 + 32520);
                __int128 v190 = *(_OWORD *)(v8 + 32472);
                __int128 v189 = *(_OWORD *)(v8 + 32488);
                *(_OWORD *)(v176 + 32504) = *(_OWORD *)(v8 + 32504);
                *(_OWORD *)(v176 + 32520) = v188;
                *(_OWORD *)(v176 + 32472) = v190;
                *(_OWORD *)(v176 + 32488) = v189;
                __int128 v191 = *(_OWORD *)(v8 + 32584);
                __int128 v193 = *(_OWORD *)(v8 + 32536);
                __int128 v192 = *(_OWORD *)(v8 + 32552);
                *(_OWORD *)(v176 + 32568) = *(_OWORD *)(v8 + 32568);
                *(_OWORD *)(v176 + 32584) = v191;
                *(_OWORD *)(v176 + 32536) = v193;
                *(_OWORD *)(v176 + 32552) = v192;
                __int128 v194 = *__b;
                __int128 v195 = *(_OWORD *)(v8 + 32360);
                __int128 v196 = *(_OWORD *)(v8 + 32392);
                *(_OWORD *)(v176 + 32376) = *(_OWORD *)(v8 + 32376);
                *(_OWORD *)(v176 + 32392) = v196;
                *(_OWORD *)(v176 + 32344) = v194;
                *(_OWORD *)(v176 + 32360) = v195;
                *(_DWORD *)(v176 + 32340) = *(_DWORD *)(v8 + 32340);
                *(_OWORD *)(v176 + 32200) = *(_OWORD *)(v8 + 32200);
                __int128 v197 = *(_OWORD *)(v8 + 32216);
                __int128 v198 = *(_OWORD *)(v8 + 32232);
                __int128 v199 = *(_OWORD *)(v8 + 32264);
                *(_OWORD *)(v176 + 32248) = *(_OWORD *)(v8 + 32248);
                *(_OWORD *)(v176 + 32264) = v199;
                *(_OWORD *)(v176 + 32216) = v197;
                *(_OWORD *)(v176 + 32232) = v198;
                __int128 v200 = *(_OWORD *)(v8 + 32280);
                __int128 v201 = *(_OWORD *)(v8 + 32296);
                __int128 v202 = *(_OWORD *)(v8 + 32312);
                *(void *)(v176 + 32325) = *(void *)(v8 + 32325);
                *(_OWORD *)(v176 + 32296) = v201;
                *(_OWORD *)(v176 + 32312) = v202;
                *(_OWORD *)(v176 + 32280) = v200;
                *(_DWORD *)(v176 + 32336) = *(_DWORD *)(v8 + 32336);
                *(_OWORD *)(v176 + 32888) = 0u;
                uint64_t v8 = v176;
                break;
              case 0x16:
                if (v100 < (int)v66 - 1)
                {
                  int v112 = (unsigned __int8 *)(v8 + v100 + 33940);
                  v100 += 2;
                  ttgesp(v8, *v112, v112[1]);
                }

                goto LABEL_192;
              case 0x18:
                int v113 = *(_DWORD *)(v8 + 4LL * *(int *)(v8 + 32340) + 32344);
                goto LABEL_209;
              case 0x19:
LABEL_209:
                ttsh1(v8);
                goto LABEL_192;
              case 0x1A:
                ttshnd(v8, 1);
                goto LABEL_192;
              case 0x1B:
                if (v100 < (int)v66)
                {
                  ++v100;
                  if (*(unsigned __int8 *)(v8 + v103 + 33940) <= 1u && *(int *)(v8 + 34004) <= 0)
                  {
                    *(_BYTE *)(v8 + (*(_DWORD *)(v8 + 34268) & ~(*(int *)(v8 + 34268) >> 31)) + 34272) = 0;
                    (*(void (**)(__int128 *__return_ptr, void, uint64_t))(v8 + 34344))( &v235,  *(void *)(v8 + 34352),  v208);
                    __int128 v115 = v236;
                    __int128 *v209 = v235;
                    *(_OWORD *)(v8 + 34320) = v115;
                    uint64_t v116 = *(void *)(v8 + 34328);
                    if (v116)
                    {
                      int v117 = strlen(*(const char **)(v8 + 34328));
                      *(_DWORD *)(v8 + 34340) = v117;
                      if (v117 >= 1)
                      {
                        int v118 = 0;
                        *(_DWORD *)(v8 + 34008) = 0;
                        do
                        {
                          *(_DWORD *)(v8 + 4LL * v118 + 34012) = *(_DWORD *)(v8 + 4LL * v118 + 32344);
                          int v119 = *(_DWORD *)(v8 + 34008);
                          int v118 = v119 + 1;
                          *(_DWORD *)(v8 + 34008) = v119 + 1;
                        }

                        while (v119 < 63);
                        int v120 = 0;
                        *(_DWORD *)(v8 + 34008) = *(_DWORD *)(v8 + 32340);
                        *(_DWORD *)(v8 + 34004) = 2;
                        *(_DWORD *)(v8 + 34360) = -2;
                        *(_DWORD *)(v8 + 34336) = 0;
                        *(_DWORD *)(v8 + 32340) = 0;
                        do
                        {
                          uint64_t v121 = *(int *)(v8 + 34336);
                          if ((int)v121 >= *(_DWORD *)(v8 + 34340))
                          {
                            int v122 = 256;
                          }

                          else
                          {
                            *(_DWORD *)(v8 + 34336) = v121 + 1;
                            int v122 = *(unsigned __int8 *)(v116 + v121);
                          }

                          *(_DWORD *)(v8 + 4LL * v120 + 32344) = v122;
                          int v123 = *(_DWORD *)(v8 + 32340);
                          int v120 = v123 + 1;
                          *(_DWORD *)(v8 + 32340) = v123 + 1;
                        }

                        while (v123 < 63);
                        *(_DWORD *)(v8 + 32340) = 0;
                      }
                    }
                  }

                  else
                  {
                    switch(*(_BYTE *)(v8 + v103 + 33940))
                    {
                      case 2:
                        if (*(int *)(v8 + 34004) >= 1)
                        {
                          int v114 = 1;
                          goto LABEL_235;
                        }

                        break;
                      case 3:
                        if (*(int *)(v8 + 34004) >= 1)
                        {
                          int v114 = 2;
                          goto LABEL_235;
                        }

                        break;
                      case 4:
                        if (*(int *)(v8 + 34004) <= 0)
                        {
                          if (*(_DWORD *)(v8
                                         + 4LL
                                         * ((*(_DWORD *)(v8 + 32868)
                                           + *(_DWORD *)(v8 + 32340)) & 0x3F)
                                         + 32344) == 28)
                          {
                            do
                            {
                              int v124 = ttshnd(v8, *(_DWORD *)(v8 + 32868));
                              if (*(_DWORD *)(v8 + 34004) <= 1u) {
                                stacq(v8, v124);
                              }
                            }

                            while ((v124 - 31) >= 2 && v124 != 96 && v124 != 256);
                          }
                        }

                        else
                        {
                          *(_DWORD *)(v8 + 34360) = *(_DWORD *)(v8 + 32868);
                        }

                        break;
                      case 5:
                        if (*(int *)(v8 + 34004) <= 0)
                        {
                          int v114 = -1;
LABEL_235:
                          *(_DWORD *)(v8 + 34004) = v114;
                        }

                        break;
                      case 6:
                        break;
                      default:
                        goto LABEL_192;
                    }
                  }
                }

                goto LABEL_192;
              default:
                if (v101 != 1) {
                  goto LABEL_190;
                }
                ttsng(v8);
                goto LABEL_192;
            }

            goto LABEL_16;
          }

LABEL_245:
          v125 = (int *)(*(void *)(v8 + 30736) + 4LL * *(int *)(v8 + 33928) - 4);
LABEL_307:
          int v155 = *v125;
          if (*v12 && (int)whrani() < *v12)
          {
            unint64_t v156 = (int)((int)whrani() / 0xE38uLL);
            if (v156 >= 8) {
              unint64_t v156 = 8LL;
            }
            stacq(v8, dword_2F878[v156]);
          }

          uint64_t v157 = *(unsigned int *)(v8 + 32884);
          if ((int)v157 >= 1)
          {
            int v158 = v157 * (v155 - 1);
            v159 = (uint64_t *)(*(void *)(v8 + 30784) + 8LL * v158);
            uint64_t v160 = (uint64_t *)(*(void *)(v8 + 30776) + 8LL * v158);
            int v161 = (uint64_t *)(v8 + 32888);
            do
            {
              uint64_t v163 = *v160++;
              uint64_t v162 = v163;
              uint64_t v164 = *v159++;
              *int v161 = (*v161 ^ v164) & ~v162 | v164 & v162;
              ++v161;
              --v157;
            }

            while (v157);
          }

          goto LABEL_28;
        }

        int v47 = (*(_DWORD *)(*(void *)(v8 + 30728) + 4LL * (v36 - 1)) - 1) * v46;
        int v48 = (uint64_t *)(*(void *)(v8 + 30760) + 8LL * v47);
        int v49 = (uint64_t *)(*(void *)(v8 + 30752) + 8LL * v47);
        int v50 = (uint64_t *)(v8 + 32888);
        while (1)
        {
          uint64_t v52 = *v49++;
          uint64_t v51 = v52;
          uint64_t v54 = *v48++;
          uint64_t v53 = v54;
          uint64_t v55 = *v50++;
          if (((v55 ^ v53) & v51) != 0) {
            break;
          }
          if (!--v46) {
            goto LABEL_115;
          }
        }

LABEL_57:
        if (v29 <= 0)
        {
          int v27 = v211;
          if (!v29) {
            goto LABEL_122;
          }
          uint64_t v59 = -v29;
          if ((_DWORD)v33 == (_DWORD)v219)
          {
            int v61 = v218;
            do
            {
              ++v61;
              while (1)
              {
                uint64_t v62 = *(void *)(v8 + 29568);
                int v63 = *(_DWORD *)(v62 + 4LL * (v61 - 1));
                if (v63 < 0) {
                  break;
                }
                int v61 = *(_DWORD *)(v62 + 4LL * (v61 - 1));
                if (!v63) {
                  goto LABEL_122;
                }
              }

              uint64_t v59 = -v63;
            }

            while ((int)v219 <= (int)v59);
          }

          else
          {
            if ((int)v219 <= (int)v59)
            {
              int v29 = v218 + 1;
              uint64_t v28 = v59;
              goto LABEL_54;
            }

uint64_t dxbte_state_reset(uint64_t a1)
{
  if (a1)
  {
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(void *)(a1 + 192) = 0LL;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(void *)(a1 + 16) = 0LL;
    *(void *)(a1 + 24) = 0LL;
    *(void *)a1 = 1LL;
    *(void *)(a1 + 8) = 0LL;
  }

  return 0LL;
}

uint64_t dxbte_state_equals(unint64_t a1, unint64_t a2)
{
  if (!(a1 | a2)) {
    return 1LL;
  }
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)a1;
    BOOL v5 = a1 == a2;
    if (!v4) {
      BOOL v5 = 1;
    }
    return v4 == *(void *)a2 && v5;
  }

  return result;
}

uint64_t ttmark(uint64_t a1)
{
  uint64_t v2 = a1 + 32344;
  stacq(a1, *(_DWORD *)(a1 + 32344 + 4LL * *(int *)(a1 + 32340)));
  ttsh1(a1);
  stacq(a1, *(_DWORD *)(v2 + 4LL * *(int *)(a1 + 32340)));
  return ttsh1(a1);
}

void ttgesp(uint64_t a1, int a2, int a3)
{
  BOOL v5 = (_DWORD *)(a1 + 32340);
  if (a2 == 2)
  {
    if (*(int *)(a1 + 34004) <= 0)
    {
      int v7 = *(_DWORD *)(a1 + 32344 + 4LL * ((*v5 + (_BYTE)a3) & 0x3F));
      unsigned int v8 = (*v5 + (_BYTE)a3 + 1) & 0x3F;
      *(_DWORD *)(a1 + 32344 + 4LL * ((*v5 + (_BYTE)a3) & 0x3F)) = *(_DWORD *)(a1
                                                                                              + 32344
                                                                                              + 4LL
                                                                                              * ((*v5
                                                                                                + (_BYTE)a3
                                                                                                + 1) & 0x3F));
      *(_DWORD *)(a1 + 32344 + 4LL * v8) = v7;
    }
  }

  else if (a2 == 1)
  {
    if (*(int *)(a1 + 34004) <= 0)
    {
      if (*(_DWORD *)(a1 + 4LL * ((*v5 + (_BYTE)a3) & 0x3F) + 32344) == 28)
      {
        do
        {
          int v9 = ttshnd(a1, a3);
          if (v5[416] <= 1u) {
            stacq(a1, v9);
          }
        }

        while ((v9 - 31) >= 2 && v9 != 96 && v9 != 256);
      }
    }

    else
    {
      *(_DWORD *)(a1 + 34360) = a3;
    }
  }

  else if (!a2 && *(int *)(a1 + 34004) <= 0)
  {
    int v6 = ttshnd(a1, a3);
    if ((v5[416] & 0x80000000) == 0) {
      stacq(a1, v6);
    }
  }

uint64_t tttbl(uint64_t result)
{
  uint64_t v1 = (unsigned int *)(result + 32340);
  *(_DWORD *)(result + 34268) = -1;
  int v2 = *(_DWORD *)(result + 4LL * *(int *)(result + 32340) + 32344);
  if (v2 >= 33)
  {
    uint64_t v3 = result;
    uint64_t v4 = result + 34328;
    uint64_t v5 = result + 32344;
    do
    {
      if (v2 > 125)
      {
        if (v2 != 126)
        {
          if (v2 == 256) {
            return result;
          }
          goto LABEL_20;
        }
      }

      else if (v2 != 61)
      {
        if (v2 == 96) {
          return result;
        }
LABEL_20:
        uint64_t v10 = v1[482];
        if (v10 <= 0x1E)
        {
          v1[482] = v10 + 1;
          *(_BYTE *)(v3 + v10 + 34272) = v2;
        }

        goto LABEL_10;
      }

      v1[482] = 0;
LABEL_10:
      int v6 = v1[416];
      if (v6 <= 1)
      {
        stacq(v3, v2);
        int v6 = v1[416];
      }

      if (v6 < 1)
      {
        uint64_t result = dxnin_engine_getc(v3);
      }

      else
      {
        uint64_t v7 = *(int *)(v4 + 8);
        if ((int)v7 >= *(_DWORD *)(v4 + 12))
        {
          uint64_t result = 256LL;
        }

        else
        {
          uint64_t v8 = *(void *)v4;
          *(_DWORD *)(v4 + 8) = v7 + 1;
          uint64_t result = *(unsigned __int8 *)(v8 + v7);
        }
      }

      *(_DWORD *)(v5 + 4LL * (int)*v1) = result;
      unsigned int v9 = (*v1 + 1) & 0x3F;
      *uint64_t v1 = v9;
      int v2 = *(_DWORD *)(v5 + 4LL * v9);
    }

    while (v2 > 32);
  }

  return result;
}

uint64_t ttsng(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 4LL * *(int *)(result + 32340) + 32344);
  if (v1 >= 31 && v1 != 256)
  {
    uint64_t v2 = result;
    if (*(_DWORD *)(result + 34004) <= 1u) {
      stacq(result, v1);
    }
    return ttsh1(v2);
  }

  return result;
}

uint64_t ttsh1(uint64_t a1)
{
  uint64_t v2 = (int *)(a1 + 32340);
  if (*(int *)(a1 + 34004) < 1)
  {
    uint64_t result = dxnin_engine_getc(a1);
  }

  else
  {
    uint64_t v3 = *(int *)(a1 + 34336);
    if ((int)v3 >= *(_DWORD *)(a1 + 34340))
    {
      uint64_t result = 256LL;
    }

    else
    {
      uint64_t v4 = *(void *)(a1 + 34328);
      *(_DWORD *)(a1 + 34336) = v3 + 1;
      uint64_t result = *(unsigned __int8 *)(v4 + v3);
    }
  }

  *(_DWORD *)(a1 + 4LL * *v2 + 32344) = result;
  int *v2 = (*v2 + 1) & 0x3F;
  return result;
}

uint64_t ttshnd(uint64_t a1, int a2)
{
  uint64_t v4 = (unsigned int *)(a1 + 32340);
  if (*(int *)(a1 + 34004) < 1)
  {
    int v7 = dxnin_engine_getc(a1);
  }

  else
  {
    uint64_t v5 = *(int *)(a1 + 34336);
    if ((int)v5 >= *(_DWORD *)(a1 + 34340))
    {
      int v7 = 256;
    }

    else
    {
      uint64_t v6 = *(void *)(a1 + 34328);
      *(_DWORD *)(a1 + 34336) = v5 + 1;
      int v7 = *(unsigned __int8 *)(v6 + v5);
    }
  }

  uint64_t v8 = (int)*v4;
  unsigned int v9 = ((_BYTE)v8 + (_BYTE)a2) & 0x3F;
  uint64_t v10 = *(unsigned int *)(a1 + 4LL * (((_BYTE)v8 + (_BYTE)a2) & 0x3F) + 32344);
  if (a2)
  {
    do
    {
      unsigned int v11 = v9;
      unsigned int v9 = ((_BYTE)v9 - 1) & 0x3F;
      *(_DWORD *)(a1 + 32344 + 4LL * v11) = *(_DWORD *)(a1 + 32344 + 4LL * v9);
    }

    while (v9 != (_DWORD)v8);
    *(_DWORD *)(a1 + 4LL * v8 + 32344) = v7;
  }

  else
  {
    *(_DWORD *)(a1 + 4 * v8 + 32344) = v7;
    unsigned int v11 = (*v4 + 1) & 0x3F;
  }

  unsigned int *v4 = v11;
  return v10;
}

BOOL trcedbc(uint64_t a1, int a2)
{
  uint64_t v3 = a1 + 30792;
  int v4 = *(_DWORD *)(a1 + 32860);
  if (v4 >= a2) {
    return 1LL;
  }
  LODWORD(v7) = 0;
  uint64_t v8 = a1 + 32344;
  uint64_t v9 = a1 + 34012;
  while (1)
  {
    int v10 = *(_DWORD *)(v3 + 2064);
    int v11 = *(_DWORD *)(v3 + 2072);
    int v12 = ((_BYTE)v11 + 1) & 0x3F;
    if (v10)
    {
      LODWORD(v13) = *(_DWORD *)(v3 + 3216);
      if (v12 == (_DWORD)v13) {
        return 0LL;
      }
      uint64_t v14 = (int *)(a1 + 34012 + 4LL * (((_BYTE)v11 + 1) & 0x3F));
      int v15 = (_DWORD *)(a1 + 34012 + 4LL * (((_BYTE)v11 + 2) & 0x3F));
      int v16 = (int *)(a1 + 34012 + 4LL * (((_BYTE)v11 + 3) & 0x3F));
      BOOL v17 = (_DWORD *)(a1 + 34012 + 4LL * (((_BYTE)v11 + 4) & 0x3F));
    }

    else
    {
      LODWORD(v13) = *(_DWORD *)(v3 + 1548);
      if (v12 == (_DWORD)v13) {
        return 0LL;
      }
      uint64_t v14 = (int *)(v8 + 4LL * (((_BYTE)v11 + 1) & 0x3F));
      int v15 = (_DWORD *)(v8 + 4LL * (((_BYTE)v11 + 2) & 0x3F));
      int v16 = (int *)(v8 + 4LL * (((_BYTE)v11 + 3) & 0x3F));
      BOOL v17 = (_DWORD *)(v8 + 4LL * (((_BYTE)v11 + 4) & 0x3F));
    }

    int v18 = *v14;
    if (v18 == 256) {
      break;
    }
LABEL_13:
    if (*(_DWORD *)v3)
    {
      if (v4 > 62) {
        return 0LL;
      }
      goto LABEL_15;
    }

    if (v18 == 23)
    {
      int v20 = ((_BYTE)v12 + 1) & 0x3F;
      if (v20 == (_DWORD)v13 || (((_BYTE)v12 + 2) & 0x3F) == (_DWORD)v13) {
        return 0LL;
      }
      *(_DWORD *)(v3 + 2072) = v20;
      goto LABEL_20;
    }

    if (!(_DWORD)v7)
    {
      BOOL v27 = v18 != 28 || (((_BYTE)v12 + 1) & 0x3F) == (_DWORD)v13 || (((_BYTE)v12 + 2) & 0x3F) == (_DWORD)v13;
      int v28 = ((_BYTE)v12 + 3) & 0x3F;
      BOOL v31 = v27
         || v28 == (_DWORD)v13
         || (((_BYTE)v12 + 4) & 0x3F) == (_DWORD)v13
         || (((_BYTE)v12 + 5) & 0x3F) == (_DWORD)v13;
      if (!v31 && *v15 == 101)
      {
        int v32 = *v16;
        BOOL v33 = *v16 == 101 || v32 == 115;
        if (v33 && *v17 == 126)
        {
          int v2 = 0;
          BOOL v38 = v32 != 115;
          *(_DWORD *)(v3 + 2072) = v28;
          *(_DWORD *)(v3 + 2064) = v10;
LABEL_54:
          LODWORD(v7) = 1;
          goto LABEL_21;
        }
      }

      if (v4 > 62) {
        return 0LL;
      }
      LODWORD(v7) = 0;
LABEL_15:
      uint64_t v19 = v4 + 1LL;
      *(_DWORD *)(v3 + 2068) = v19;
      *(_DWORD *)(a1 + 4 * v19 + 32600) = v18;
      *(_DWORD *)(v3 + 2072) = v12;
LABEL_20:
      *(_DWORD *)(v3 + 2064) = v10;
      goto LABEL_21;
    }

    *(_DWORD *)(v3 + 2072) = v12;
    *(_DWORD *)(v3 + 2064) = v10;
    if ((v18 - 31) >= 2 && v18 != 96)
    {
      if (v2 <= 30) {
        v41[v2++] = v18;
      }
      goto LABEL_54;
    }

    v41[v2] = 0;
    (*(void (**)(void *__return_ptr, void, _BYTE *, BOOL, void))(v3 + 3552))( v39,  *(void *)(v3 + 3560),  v41,  v38,  0LL);
    int v21 = __s;
    if (__s)
    {
      int v22 = strlen(__s);
      if (v22 >= 1)
      {
        *(_DWORD *)(v3 + 2080) += *(_DWORD *)(v3 + 2084);
        *(_DWORD *)(v3 + 2084) = v2 - v22 + 5;
        uint64_t v7 = v22;
        while (1)
        {
          int v23 = *(_DWORD *)(v3 + 2068);
          if (v23 >= 63) {
            break;
          }
          int v24 = v23 + 1;
          *(_DWORD *)(v3 + 2068) = v24;
          int v25 = *v21++;
          *(_DWORD *)(a1 + 4LL * v24 + 32600) = v25;
          if (!--v7) {
            goto LABEL_21;
          }
        }

        BOOL v35 = v23 < a2;
        return !v35;
      }
    }

    LODWORD(v7) = 0;
LABEL_21:
    int v4 = *(_DWORD *)(v3 + 2068);
    if (v4 >= a2) {
      return 1LL;
    }
  }

  if (v10 == 1 || *(int *)(v3 + 3212) <= 0)
  {
    if (v4 <= 62)
    {
      uint64_t v36 = v4 + 1LL;
      *(_DWORD *)(v3 + 2068) = v36;
      *(_DWORD *)(a1 + 4 * v36 + 32600) = 256;
      *(_DWORD *)(v3 + 2072) = v12;
      goto LABEL_70;
    }

    return 0LL;
  }

  uint64_t v13 = *(int *)(v3 + 3216);
  int v18 = *(_DWORD *)(v9 + 4 * v13);
  if (v18 != 256)
  {
    int v15 = (_DWORD *)(v9 + 4LL * (((_BYTE)v13 + 1) & 0x3F));
    int v16 = (int *)(v9 + 4LL * (((_BYTE)v13 + 2) & 0x3F));
    int v10 = 1;
    int v12 = *(_DWORD *)(v3 + 3216);
    BOOL v17 = (_DWORD *)(v9 + 4LL * (((_BYTE)v13 + 3) & 0x3F));
    goto LABEL_13;
  }

  if (v4 > 62) {
    return 0LL;
  }
  uint64_t v37 = v4 + 1LL;
  *(_DWORD *)(v3 + 2068) = v37;
  *(_DWORD *)(a1 + 4 * v37 + 32600) = 256;
  *(_DWORD *)(v3 + 2072) = v13;
  *(_DWORD *)(v3 + 2064) = 1;
LABEL_70:
  BOOL v35 = *(_DWORD *)(v3 + 2068) < a2;
  return !v35;
}

uint64_t trcck(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v4 = (int *)(a1 + 29636);
  unsigned int v5 = a3 + 1;
  int v6 = *(_DWORD *)(a1 + 32880);
  if (v6 > 69)
  {
    int v24 = *(_DWORD *)(a1 + 34492);
    if (v24 <= 14)
    {
      *(_DWORD *)(a1 + 4LL * v24 + 34496) = v5;
      int v24 = *(_DWORD *)(a1 + 34492);
    }

    uint64_t result = 0LL;
    if (v24 != 0x7FFFFFFF) {
      v4[1214] = v24 + 1;
    }
    return result;
  }

  uint64_t v7 = *(void *)(a1 + 30824);
  int v8 = *(_DWORD *)(v7 + 4LL * v5);
  *(_DWORD *)(a1 + 32880) = v6 + 1;
  uint64_t v9 = *(int *)(v7 + 4LL * a3);
  do
  {
    uint64_t v11 = *(int *)(*(void *)(a1 + 30816) + 4 * v9);
    uint64_t v12 = *(void *)(a1 + 30808);
    int v13 = *(unsigned __int8 *)(v12 + v11);
    uint64_t v14 = a2;
    if (v13 == 252)
    {
LABEL_37:
      --v4[811];
      return (v14 - a2);
    }

    while ((int)v14 <= 63)
    {
      if (v13 == 253)
      {
        if ((int)v14 > v4[806])
        {
          if (!trcedbc(a1, v14)) {
            break;
          }
          uint64_t v12 = *(void *)(a1 + 30808);
        }

        int v18 = *(char *)(v12 + (int)v11 + 1);
        int v19 = *(_DWORD *)(a1 + 4LL * (int)v14 + 32600);
        if (v19 << 24 == 469762048) {
          v4[808] = v14;
        }
        LODWORD(v11) = v11 + 2;
        goto LABEL_20;
      }

      if (v13 != 254)
      {
        if (v13 != 255)
        {
          int v15 = *(_DWORD *)(a1 + 4LL * *(int *)(a1 + 4LL * (int)v14 + 32600) + 29644);
          BOOL v16 = __OFSUB__(v15, 1);
          int v17 = v15 - 1;
        }

        LODWORD(v11) = v11 + 1;
LABEL_20:
        uint64_t v14 = (v14 + 1);
        goto LABEL_28;
      }

      uint64_t v20 = *(unsigned __int8 *)(v12 + (int)v11 + 1);
      if (*v4 >= 18) {
        uint64_t v20 = v20 | (*(unsigned __int8 *)((int)v11 + v12 + 2) << 8);
      }
      int v21 = trcck(a1, v14, v20);
      if (v21 < 1) {
        break;
      }
      if (*v4 <= 17) {
        int v22 = 2;
      }
      else {
        int v22 = 3;
      }
      LODWORD(v11) = v22 + v11;
      uint64_t v14 = (v21 + v14);
LABEL_28:
      uint64_t v12 = *(void *)(a1 + 30808);
      int v13 = *(unsigned __int8 *)(v12 + (int)v11);
      if (v13 == 252) {
        goto LABEL_37;
      }
    }

    ++v9;
  }

  while (v8 != (_DWORD)v9);
  int v6 = v4[811] - 1;
LABEL_32:
  uint64_t result = 0LL;
  v4[811] = v6;
  return result;
}

_DWORD *wcscpx(_DWORD *result, int *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = a3;
    int v4 = result;
    while (1)
    {
      int v5 = *a2++;
      _DWORD *v4 = v5;
      if (!v5) {
        break;
      }
      ++v4;
      if (!--v3) {
        goto LABEL_5;
      }
    }
  }

  else
  {
LABEL_5:
    result[a3 - 1] = 0;
  }

  return result;
}

FILE *dx_wfopen(__int32 *a1, const __int32 *a2)
{
  return fopen(__filename, __mode);
}

FILE *dx_wfreopen(__int32 *a1, const __int32 *a2, FILE *a3)
{
  return freopen(v7, v6, a3);
}

uint64_t whrani()
{
  int v0 = 171 * (ix % 177) - 2 * (ix / 177);
  ix = v0 + (v0 < 0 ? 0x763D : 0);
  int v1 = -35 * (iy / 176) + 172 * (iy % 176);
  iy = v1 + (v1 < 0 ? 0x7663 : 0);
  int v2 = -63 * (iz / 178) + 170 * (iz % 178);
  iz = v2 + (v2 < 0 ? 0x7673 : 0);
  return iy ^ iz ^ ix ^ ((iy ^ iz ^ ix) >> 31);
}

uint64_t whraii(uint64_t result, int a2, int a3)
{
  else {
    int v3 = -(int)result;
  }
  if (v3 <= 1) {
    int v3 = 1;
  }
  if (v3 >= 30000) {
    int v4 = 30000;
  }
  else {
    int v4 = v3;
  }
  ix = v3 - 30000 * ((v3 - v4 + 29999) / 0x7530u);
  if (a2 >= 0) {
    int v5 = a2;
  }
  else {
    int v5 = -a2;
  }
  if (v5 <= 1) {
    int v5 = 1;
  }
  if (v5 >= 30000) {
    int v6 = 30000;
  }
  else {
    int v6 = v5;
  }
  iy = v5 - 30000 * ((v5 - v6 + 29999) / 0x7530u);
  if (a3 >= 0) {
    int v7 = a3;
  }
  else {
    int v7 = -a3;
  }
  if (v7 <= 1) {
    int v7 = 1;
  }
  if (v7 >= 30000) {
    int v8 = 30000;
  }
  else {
    int v8 = v7;
  }
  iz = v7 - 30000 * ((v7 - v8 + 29999) / 0x7530u);
  return result;
}

_DWORD *whravi(_DWORD *result, _DWORD *a2, _DWORD *a3)
{
  *uint64_t result = ix;
  *a2 = iy;
  *a3 = iz;
  return result;
}

uint64_t whrini()
{
  time_t v8 = time(0LL);
  if (v8 == -1 || (int v0 = localtime(&v8)) == 0LL)
  {
    int v6 = 42;
    int v5 = 15;
    uint64_t v4 = 2LL;
  }

  else
  {
    int v1 = v0;
    int tm_min = v0->tm_min;
    int tm_mon = v0->tm_mon;
    uint64_t v4 = (v0->tm_year + v0->tm_sec);
    int v5 = tm_mon + tm_min;
    int v6 = v1->tm_mday + v1->tm_hour;
  }

  return whraii(v4, v5, v6);
}

uint64_t wcscax(uint64_t result, int *a2, int a3)
{
  if (a3 < 1)
  {
    LODWORD(v3) = 0;
  }

  else
  {
    uint64_t v3 = 0LL;
    while (*(_DWORD *)(result + 4 * v3))
    {
      if (a3 == ++v3) {
        goto LABEL_11;
      }
    }
  }

  uint64_t v4 = (a3 - v3);
  if (a3 <= (int)v3)
  {
LABEL_11:
    *(_DWORD *)(result + 4LL * (a3 - 1)) = 0;
  }

  else
  {
    int v5 = (_DWORD *)(result + 4LL * v3);
    while (1)
    {
      int v6 = *a2++;
      _DWORD *v5 = v6;
      if (!v6) {
        break;
      }
      ++v5;
      if (!--v4) {
        goto LABEL_11;
      }
    }
  }

  return result;
}

void sub_2BD70(_Unwind_Exception *a1)
{
}

uint64_t dxlog_printf_standard_implementation( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return dxlog_vprintf(a1, a2, &a9);
}

uint64_t (*dxlog_setup(uint64_t (*result)()))()
{
  uint64_t v1 = (uint64_t (*)())dxlog_printf_standard_implementation;
  if (!result) {
    uint64_t v1 = dxlog_printf_null_implementation;
  }
  int v2 = dxlog_vprintf_null_implementation;
  if (result) {
    int v2 = result;
  }
  dxlog_printf[0] = v1;
  dxlog_vprintf = (uint64_t (*)(void, void, void))v2;
  return result;
}

id objc_msgSend__populatePrintBrailleForTextLocations_inLength_outLength_translationHandle_offsetToBraille_prefixCodeLength_preprocessedMap_optimize_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_populatePrintBrailleForTextLocations:inLength:outLength:translationHandle:offsetToBraille:prefixCodeLength:p reprocessedMap:optimize:");
}

id objc_msgSend__populateTextForPrintBrailleLocations_inLength_outLength_offsetToBraille_prefixLength_optimize_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_populateTextForPrintBrailleLocations:inLength:outLength:offsetToBraille:prefixLength:optimize:");
}

id objc_msgSend__printBrailleForText_mode_locations_textPositionsRange_textFormattingRanges_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:");
}

id objc_msgSend__printBrailleForText_mode_locations_textPositionsRange_textFormattingRanges_optimize_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:optimize:");
}

id objc_msgSend__scrubDollarCodesInBuffer_originalLength_originalLocations_newLocations_convertASCIIBrailleToUnicode_limitRange_( void *a1, const char *a2, ...)
{
  return objc_msgSend( a1,  "_scrubDollarCodesInBuffer:originalLength:originalLocations:newLocations:convertASCIIBrailleToUnicode:limitRange:");
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithRange:");
}