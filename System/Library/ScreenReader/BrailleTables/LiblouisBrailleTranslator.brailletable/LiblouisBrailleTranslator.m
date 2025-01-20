void sub_3548( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3564(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL);
  uint64_t v9 = a3 - v8;
  if (a3 > v8)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(void **)(a1 + 48);
    id v12 = *(id *)(a1 + 40);
    id v13 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "substringWithRange:", v8, v9));
    [v12 appendString:v14];

    do
    {
      unint64_t v21 = v8;
      [v13 appendBytes:&v21 length:8];
      ++v8;
    }

    while (a3 != v8);
  }

  v15 = (void *)CEMEmojiTokenCopyName(a2, 1LL);
  if ([v15 length])
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([@":" stringByAppendingString:v15]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 stringByAppendingString:@":"]);

    v18 = (char *)[v17 length];
    [*(id *)(a1 + 40) appendString:v17];
    if (v18)
    {
      for (i = 0LL; i != v18; ++i)
      {
        unint64_t v21 = a3;
        [*(id *)(a1 + 48) appendBytes:&v21 length:8];
        __int16 v20 = 0;
        objc_msgSend(*(id *)(a1 + 56), "replaceBytesInRange:withBytes:length:", &i[a3], 1, &v20, 2);
      }
    }

    v15 = v17;
  }

  *(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = a3 + a4;
}

LABEL_5:
LABEL_6:
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData data](&OBJC_CLASS___NSMutableData, "data"));
  if ([v5 length])
  {
    v11 = 0LL;
    do
    {
      v63 = 0;
      [v10 appendBytes:&v63 length:2];
      ++v11;
    }

    while (v11 < (unint64_t)[v5 length]);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v50 = v7;
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 boldRanges]);
  id v13 = [v12 countByEnumeratingWithState:&v59 objects:v66 count:16];
  if (v13)
  {
    v14 = v13;
    v15 = *(void *)v60;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v60 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = (char *)[*(id *)(*((void *)&v59 + 1) + 8 * (void)i) rangeValue];
        if (v17 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v17;
          __int16 v20 = v18;
          unint64_t v21 = &v17[v18];
          if (&v17[v18] <= [v5 length])
          {
            v63 = 4;
            if (v19 < v21)
            {
              v22 = 2LL * (void)v19;
              do
              {
                objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v22, 2, &v63, 2);
                v22 += 2LL;
                --v20;
              }

              while (v20);
            }
          }
        }
      }

      v14 = [v12 countByEnumeratingWithState:&v59 objects:v66 count:16];
    }

    while (v14);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = (void *)objc_claimAutoreleasedReturnValue([v50 italicRanges]);
  v24 = [v23 countByEnumeratingWithState:&v55 objects:v65 count:16];
  if (v24)
  {
    v25 = v24;
    v26 = *(void *)v56;
    do
    {
      for (j = 0LL; j != v25; j = (char *)j + 1)
      {
        if (*(void *)v56 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = (char *)[*(id *)(*((void *)&v55 + 1) + 8 * (void)j) rangeValue];
        if (v28 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v30 = v28;
          v31 = v29;
          v32 = &v28[v29];
          if (&v28[v29] <= [v5 length] && v30 < v32)
          {
            v34 = 2LL * (void)v30;
            do
            {
              v63 = 0;
              objc_msgSend(v10, "getBytes:range:", &v63, v34, 2);
              v63 |= 1u;
              objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v34, 2, &v63, 2);
              v34 += 2LL;
              --v31;
            }

            while (v31);
          }
        }
      }

      v25 = [v23 countByEnumeratingWithState:&v55 objects:v65 count:16];
    }

    while (v25);
  }

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v35 = (void *)objc_claimAutoreleasedReturnValue([v50 underlineRanges]);
  v36 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
  if (v36)
  {
    v37 = v36;
    v38 = *(void *)v52;
    do
    {
      for (k = 0LL; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v52 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = (char *)[*(id *)(*((void *)&v51 + 1) + 8 * (void)k) rangeValue];
        if (v40 != (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v42 = v40;
          v43 = v41;
          v44 = &v40[v41];
          if (&v40[v41] <= [v5 length] && v42 < v44)
          {
            v46 = 2LL * (void)v42;
            do
            {
              v63 = 0;
              objc_msgSend(v10, "getBytes:range:", &v63, v46, 2);
              v63 |= 2u;
              objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", v46, 2, &v63, 2);
              v46 += 2LL;
              --v43;
            }

            while (v43);
          }
        }
      }

      v37 = [v35 countByEnumeratingWithState:&v51 objects:v64 count:16];
    }

    while (v37);
  }

  v7 = v50;
LABEL_52:

  return v10;
}

id LBTLog()
{
  if (qword_25118 != -1) {
    dispatch_once(&qword_25118, &stru_20338);
  }
  return (id)qword_25110;
}

void sub_3CB4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.Accessibility", "BRLTranslation.liblouis");
  v2 = (void *)qword_25110;
  qword_25110 = (uint64_t)v1;
}

void sub_3D58(int a1, uint64_t a2)
{
  if (a1 <= 29999)
  {
    if (!a1 || a1 == 10000)
    {
      id v5 = LBTLog();
      v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        sub_1B808();
      }
      goto LABEL_15;
    }

    if (a1 != 20000) {
      return;
    }
LABEL_13:
    id v6 = LBTLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      uint64_t v8 = a2;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v7, 0xCu);
    }

LABEL_15:
    return;
  }

  if (a1 == 30000) {
    goto LABEL_13;
  }
  if (a1 == 40000 || a1 == 50000)
  {
    id v3 = LBTLog();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1B868();
    }
    goto LABEL_15;
  }

              LODWORD(v15) = *(unsigned __int16 *)(v16 + 16LL * v15 + 12);
              if ((_DWORD)v15 == 0xFFFF) {
                goto LABEL_9;
              }
            }

            __int16 v20 = (unsigned __int16 *)(a4 + 31618 + 8 * v18);
            while (*(v20 - 1) != (unsigned __int16)v29[v14])
            {
              v20 += 2;
              if (!--v19) {
                goto LABEL_15;
              }
            }

            v15 = *v20;
            unint64_t v21 = *(unsigned int *)(v16 + 16 * v15 + 8);
            if ((_DWORD)v21)
            {
              v22 = (const char *)(a4 + 8 * v21 + 31616);
              v23 = strlen(v22);
              LODWORD(v24) = a2 + ~(_DWORD)v14 + v23;
              v24 = (int)v24 >= v23 ? v23 : v24;
              if ((int)v24 >= 1)
              {
                v25 = 0LL;
                v26 = &a3[v17 - v23];
                do
                {
                  v27 = v22[v25];
                  ++v25;
                }

                while (v25 < v24);
              }
            }
          }

          ++v14;
          ++v17;
        }

        while (v14 != a2 + 2);
      }

      a3[a2] = 0;
      free(v29);
      return 1LL;
    }
  }

  return result;
}
}

LABEL_38:
        v61 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v52,  v50));
        *v66 = v61;
        free(v52);
      }
    }

    if (v27) {
      free(v27);
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v23,  (int)v68));
    free(v23);
  }

  else
  {
    v62 = LBTLog();
    v63 = (os_log_s *)objc_claimAutoreleasedReturnValue(v62);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1BA5C();
    }

    free(v23);
    if (v27) {
      free(v27);
    }
    v46 = 0LL;
  }

LABEL_47:
  return v46;
}

              v50 = 1;
            }

LABEL_19:
      *a5 = (id)objc_claimAutoreleasedReturnValue( +[NSData dataWithBytes:length:]( &OBJC_CLASS___NSData,  "dataWithBytes:length:",  v28,  8LL * v26));
      free(v29);
      v26 = v40;
    }

    free(v16);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCharacters:length:]( &OBJC_CLASS___NSString,  "stringWithCharacters:length:",  v15,  v26));
  free(v15);
  v36 = LBTLog();
  v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_1BB84();
  }

LABEL_27:
  return v35;
}

      ++v24;
    }

    while (v24 != 3);
    if (v18 != 83)
    {
      v19 = (uint64_t)a1;
      if (v18 != 86)
      {
        __int16 v20 = *(_DWORD *)(a3 + 16);
        goto LABEL_30;
      }

      goto LABEL_24;
    }

void sub_4EC0(void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
}

  ;
}

void sub_4ED8( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

void sub_4EF0( void *a1, os_log_s *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
}

  ;
}

  ;
}

double _lou_resetPassVariables()
{
  qword_251E0 = 0LL;
  double result = 0.0;
  xmmword_251C0 = 0u;
  unk_251D0 = 0u;
  xmmword_251A0 = 0u;
  unk_251B0 = 0u;
  xmmword_25180 = 0u;
  unk_25190 = 0u;
  xmmword_25160 = 0u;
  unk_25170 = 0u;
  xmmword_25140 = 0u;
  unk_25150 = 0u;
  xmmword_25120 = 0u;
  *(_OWORD *)algn_25130 = 0u;
  return result;
}

uint64_t _lou_handlePassVariableTest(uint64_t a1, int *a2, _DWORD *a3)
{
  uint64_t v3 = 0LL;
  uint64_t v4 = *a2;
  unsigned int v5 = *(unsigned __int16 *)(a1 + 2 * v4);
  if (v5 <= 0x3D)
  {
    if (v5 == 60)
    {
    }

    else
    {
      if (v5 != 61) {
        return v3;
      }
    }

    goto LABEL_6;
  }

  switch(v5)
  {
    case 0x3Eu:
      goto LABEL_6;
    case 0x82u:
      goto LABEL_6;
    case 0x83u:
      if (*((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2LL * ((int)v4 + 1))) >= (int)*(unsigned __int16 *)(a1 + 2LL * ((int)v4 + 2)))
      {
LABEL_7:
        *a2 = v4 + 3;
        return 1LL;
      }

LABEL_6:
      *a3 = 0;
      LODWORD(v4) = *a2;
      goto LABEL_7;
  }

  return v3;
}

  sub_E6FC(a1, &v27, a4);
  id v12 = (uint64_t)*a4 + 8 * v27;
  *(_DWORD *)(v12 + 8992) = 0;
  *(_WORD *)(v12 + 8996) = a3;
  *(_WORD *)(v12 + 8998) = a2;
  double result = _lou_charHash(a3);
  v14 = (uint64_t)*a4 + 4 * result;
  v15 = *(unsigned int *)(v14 + 4500);
  if ((_DWORD)v15)
  {
    do
    {
      v16 = (uint64_t)*a4 + 8 * v15;
      v15 = *(unsigned int *)(v16 + 8992);
    }

    while ((_DWORD)v15);
    v17 = (unsigned int *)(v16 + 8992);
  }

  else
  {
    v17 = (unsigned int *)(v14 + 4500);
  }

  void *v17 = v27;
  return result;
}

uint64_t _lou_handlePassVariableAction(uint64_t a1, int *a2)
{
  uint64_t v2 = *a2;
  int v3 = *(unsigned __int16 *)(a1 + 2 * v2);
  switch(v3)
  {
    case '+':
      uint64_t v5 = *(unsigned __int16 *)(a1 + 2LL * ((int)v2 + 1));
      int v6 = *((_DWORD *)&xmmword_25120 + v5) + 1;
LABEL_9:
      *((_DWORD *)&xmmword_25120 + v5) = v6;
      int v4 = 2;
      goto LABEL_10;
    case '-':
      uint64_t v5 = *(unsigned __int16 *)(a1 + 2LL * ((int)v2 + 1));
      int v7 = *((_DWORD *)&xmmword_25120 + v5);
      if (v7 <= 1) {
        int v7 = 1;
      }
      int v6 = v7 - 1;
      goto LABEL_9;
    case '=':
      *((_DWORD *)&xmmword_25120 + *(unsigned __int16 *)(a1 + 2LL * ((int)v2 + 1))) = *(unsigned __int16 *)(a1 + 2LL * ((int)v2 + 2));
      int v4 = 3;
LABEL_10:
      *a2 = v2 + v4;
      return 1LL;
  }

  return 0LL;
}

char *lou_setDataPath(const char *a1)
{
  qword_259E8 = 0LL;
  if (!a1 || strlen(a1) > 0x7FF) {
    return 0LL;
  }
  uint64_t v2 = &byte_251E8;
  __strcpy_chk(&byte_251E8, a1, 2048LL);
  qword_259E8 = (uint64_t)&byte_251E8;
  return v2;
}

uint64_t lou_getDataPath()
{
  return qword_259E8;
}

uint64_t _lou_getALine(_DWORD *a1)
{
  a1[9] = 0;
  while (1)
  {
    do
      int v2 = sub_5240((uint64_t)a1);
    while (v2 == 13);
    if (v2 == -1 || v2 == 10) {
      break;
    }
    uint64_t v3 = a1[9];
    if ((int)v3 >= 2047)
    {
      *((_WORD *)a1 + v3 + 26) = 0;
      a1[10] = 0;
LABEL_11:
      ++a1[6];
      return 1LL;
    }

    a1[9] = v3 + 1;
    *((_WORD *)a1 + (int)v3 + 26) = v2;
  }

  uint64_t v4 = (int)a1[9];
  *((_WORD *)a1 + v4 + 26) = 0;
  a1[10] = 0;
  if (v2 != -1) {
    goto LABEL_11;
  }
  uint64_t result = 0LL;
  if ((_DWORD)v4) {
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_5240(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 28) != 3 || *(_DWORD *)(a1 + 32) != 2)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v3 = fgetc(*(FILE **)(a1 + 16));
        uint64_t v2 = v3;
        if ((_DWORD)v3 == -1) {
          return v2;
        }
        int v4 = *(_DWORD *)(a1 + 32);
        if (v4 <= 1)
        {
          *(_DWORD *)(a1 + 4LL * v4 + 44) = v3;
          int v4 = *(_DWORD *)(a1 + 32);
        }

        int v5 = v4 + 1;
        *(_DWORD *)(a1 + 32) = v5;
        if (v5 != 2) {
          break;
        }
        uint64_t v2 = *(unsigned int *)(a1 + 44);
        if ((_DWORD)v2 == 255)
        {
          if (*(_DWORD *)(a1 + 48) != 254) {
            goto LABEL_26;
          }
          int v6 = 2;
        }

        else
        {
          if ((_DWORD)v2 != 254)
          {
            if ((int)v2 <= 127 && *(int *)(a1 + 48) <= 127)
            {
              *(_DWORD *)(a1 + 28) = 3;
              return v2;
            }

LABEL_26:
            sub_7454(a1, "encoding is neither big-endian, little-endian nor ASCII 8.");
            return 0xFFFFFFFFLL;
          }

          if (*(_DWORD *)(a1 + 48) != 255) {
            goto LABEL_26;
          }
          int v6 = 1;
        }

        *(_DWORD *)(a1 + 28) = v6;
      }

      int v7 = *(_DWORD *)(a1 + 28);
      if (v7 == 3) {
        return v2;
      }
      if (v7 == 2) {
        break;
      }
      if (v7 == 1)
      {
        int v9 = fgetc(*(FILE **)(a1 + 16));
        BOOL v10 = v9 == -1;
        unsigned __int16 v11 = v9 | ((_WORD)v2 << 8);
        goto LABEL_20;
      }
    }

    int v8 = fgetc(*(FILE **)(a1 + 16));
    BOOL v10 = v8 == -1;
    unsigned __int16 v11 = v2 | ((_WORD)v8 << 8);
LABEL_20:
    if (v10) {
      return 0xFFFFFFFFLL;
    }
    else {
      return v11;
    }
  }

  *(_DWORD *)(a1 + 32) = 3;
  return *(unsigned int *)(a1 + 48);
}

            sub_7454(a1, "missing cell specification.");
            return 0LL;
          }

          continue;
        }

        sub_7454(a1, "dot specified more than once.");
        return 0LL;
      default:
LABEL_27:
        _lou_showString((uint64_t)&v9, 1, 0);
        sub_7454(a1, "invalid dot number %s.");
        return 0LL;
    }
  }

  if (!a3) {
    goto LABEL_28;
  }
LABEL_27:
  if (*a3)
  {
LABEL_28:
    if (!a4 || *a4) {
      return;
    }
    v44 = 0LL;
    v45 = 0LL;
    if (a3 && !*a3) {
      v16 = (void **)&v45;
    }
    else {
      v16 = 0LL;
    }
    goto LABEL_40;
  }

  v44 = 0LL;
  v45 = 0LL;
  v16 = (void **)&v45;
  if (!a4)
  {
LABEL_41:
    v17 = 0LL;
    if (__s) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }

uint64_t _lou_getDotsForChar(int a1, uint64_t a2)
{
  if (!a2) {
    return 0x8000LL;
  }
  int v4 = (unsigned int *)(a2 + 4 * _lou_charHash(a1) + 8);
  while (1)
  {
    uint64_t v5 = *v4;
    if (!(_DWORD)v5) {
      break;
    }
    int v4 = (unsigned int *)(a2 + 8 * v5 + 8992);
  }

  return 0x8000LL;
}

uint64_t _lou_getCharForDots(int a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  int v4 = (unsigned int *)(a2 + 4 * _lou_charHash(a1) + 4500);
  while (1)
  {
    uint64_t v5 = *v4;
    if (!(_DWORD)v5) {
      break;
    }
    int v4 = (unsigned int *)(a2 + 8 * v5 + 8992);
  }

  return 0LL;
}

uint64_t _lou_findOpcodeNumber(const char *a1)
{
  int v2 = dword_259F0;
  int v3 = strlen(a1);
  uint64_t v4 = dword_259F0;
  while (v3 != word_259F4[v4] || strcasecmp(a1, off_20358[v4]))
  {
    else {
      uint64_t v4 = 0LL;
    }
    if ((_DWORD)v4 == v2) {
      return 117LL;
    }
  }

  dword_259F0 = v4;
  return v4;
}

char *_lou_findOpcodeName(unsigned int a1)
{
  if (a1 < 0x75) {
    return off_20358[a1];
  }
  os_log_t v1 = byte_25ADE;
  __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", a1);
  return v1;
}

uint64_t _lou_extParseChars(_BYTE *a1, void *a2)
{
  LOBYTE(v3) = *a1;
  if (*a1)
  {
    unint64_t v4 = 0LL;
    do
    {
      v11[v4 + 1] = (char)v3;
      unint64_t v5 = v4 + 1;
      if (v4 > 0x7FD) {
        break;
      }
      int v3 = a1[++v4];
    }

    while (v3);
    __int16 v6 = v5;
  }

  else
  {
    __int16 v6 = 0;
    unint64_t v5 = 0LL;
  }

  v11[v5 + 1] = 0;
  v11[0] = v6;
  uint64_t v7 = v9;
  if (v9) {
    memcpy(a2, &v10, 2LL * v9);
  }
  return v7;
}

uint64_t sub_5640(uint64_t a1, _WORD *a2, _WORD *a3)
{
  int v4 = (unsigned __int16)*a3;
  if (*a3)
  {
    __int16 v7 = 0;
    int v8 = 0;
    int v9 = 0;
    while (1)
    {
      uint64_t v10 = v8;
      uint64_t v11 = v8 <= 2047 ? 2047LL : v8;
      LODWORD(v12) = v9;
      while (1)
      {
        uint64_t v13 = (int)v12;
        v14 = &a3[(int)v12];
        uint64_t v12 = (int)v12 + 1LL;
        unsigned int v15 = *((unsigned __int8 *)v14 + 2);
        if (v15 >= 0x80) {
          break;
        }
        if (v15 == 92)
        {
          unsigned int v15 = (unsigned __int16)a3[v12 + 1];
          v16 = "\\Zhhhhhhhh (with a capital 'Z') is deprecated.";
          switch(a3[v12 + 1])
          {
            case 'X':
              sub_7510(a1, "\\Xhhhh (with a capital 'X') is deprecated.");
              int v4 = (unsigned __int16)*a3;
              goto LABEL_11;
            case 'Y':
              v16 = "\\Yhhhhh (with a capital 'Y') is deprecated.";
              goto LABEL_24;
            case 'Z':
LABEL_24:
              sub_7510(a1, v16);
              goto LABEL_25;
            case '[':
            case ']':
            case '^':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'o':
            case 'p':
            case 'q':
            case 'u':
              goto LABEL_70;
            case '\\':
              goto LABEL_26;
            case 'e':
              LOWORD(v15) = 27;
              goto LABEL_26;
            case 'f':
              LOWORD(v15) = 12;
              goto LABEL_26;
            case 'n':
              LOWORD(v15) = 10;
              goto LABEL_26;
            case 'r':
              LOWORD(v15) = 13;
              goto LABEL_26;
            case 's':
              LOWORD(v15) = 32;
              goto LABEL_26;
            case 't':
              LOWORD(v15) = 9;
              goto LABEL_26;
            case 'v':
              LOWORD(v15) = 11;
              goto LABEL_26;
            case 'w':
              LOWORD(v15) = -1;
              goto LABEL_26;
            case 'x':
LABEL_11:
              int v17 = 0;
              v18 = &a3[v13 + 3];
              uint64_t v19 = 16LL;
              while (2)
              {
                int v21 = *v18++;
                int v20 = v21;
                if ((v21 - 48) < 0xA)
                {
                  int v22 = -48;
                  goto LABEL_19;
                }

                if ((v20 - 97) < 6)
                {
                  int v22 = -87;
                  goto LABEL_19;
                }

                if ((v20 - 65) < 6)
                {
                  int v22 = -55;
LABEL_19:
                  v19 -= 4LL;
                  v17 |= (v22 + v20) << v19;
                  if (!v19)
                  {
                    LOWORD(v15) = v17;
                    goto LABEL_39;
                  }

                  continue;
                }

                break;
              }

              sub_7454(a1, "invalid %d-digit hexadecimal number", 4);
              LOWORD(v15) = -1;
LABEL_39:
              LODWORD(v12) = v13 + 5;
              goto LABEL_26;
            case 'y':
            case 'z':
LABEL_25:
              sub_7454(a1, "liblouis has not been compiled for 32-bit Unicode");
              goto LABEL_26;
            default:
              if (v15 != 34)
              {
LABEL_70:
                sub_7454(a1, "invalid escape sequence '\\%c'", (unsigned __int16)a3[v12 + 1]);
                uint64_t result = 0LL;
                LOWORD(v8) = v7;
                goto LABEL_68;
              }

              LOWORD(v15) = 28;
LABEL_26:
              LODWORD(v12) = v12 + 1;
              break;
          }
        }

        if (v10 == v11)
        {
          sub_7454(a1, "Token too long");
          uint64_t result = 0LL;
          LOWORD(v8) = 2047;
          goto LABEL_68;
        }

        LOWORD(v8) = v10 + 1;
        a2[v10 + 1] = v15;
        int v4 = (unsigned __int16)*a3;
        ++v10;
      }

      int v23 = 7;
      while (dword_1CA80[--v23] > v15)
      {
        if (v23 <= 1)
        {
          int v23 = 0;
          break;
        }
      }

      unsigned int v24 = (255 - dword_1CA80[v23]) & v15;
      if (v23 < 1 || (int)v13 >= 2046)
      {
        int v9 = v12;
        int v25 = v10;
      }

      else
      {
        int v25 = v10;
        unsigned int v26 = 1;
        int v9 = v12;
        do
        {
          if (v25 >= 2047) {
            goto LABEL_69;
          }
          unsigned int v27 = (unsigned __int16)a3[v9 + 1];
          if (v27 >= 0x80 && (v27 & 0x40) == 0)
          {
            int v30 = v9;
            unsigned int v24 = v27 & 0x3F | (v24 << 6);
          }

          else
          {
            sub_7510(a1, "invalid UTF-8. Assuming Latin-1.");
            v29 = &a2[v25++];
            v29[1] = a3[(int)v12 + 1];
            int v30 = v12;
          }

          int v9 = v30 + 1;
          if (v26 >= v23) {
            break;
          }
          ++v26;
        }

        while (v30 < 2046);
      }

      if (v25 > 2046) {
        break;
      }
      if (v24 >= 0xFFFF) {
        __int16 v31 = -1;
      }
      else {
        __int16 v31 = v24;
      }
      int v8 = v25 + 1;
      a2[v25 + 1] = v31;
      int v4 = (unsigned __int16)*a3;
      __int16 v7 = v10;
      if (v9 >= v4) {
        goto LABEL_67;
      }
    }

LABEL_69:
    sub_7454(a1, "Token too long");
    uint64_t result = 0LL;
    LOWORD(v8) = v10;
  }

  else
  {
    LOWORD(v8) = 0;
LABEL_67:
    uint64_t result = 1LL;
  }

LABEL_68:
  *a2 = v8;
  return result;
}

uint64_t _lou_extParseDots(_BYTE *a1, void *a2)
{
  LOBYTE(v3) = *a1;
  if (*a1)
  {
    unint64_t v4 = 0LL;
    do
    {
      v12[v4 + 1] = (char)v3;
      unint64_t v5 = v4 + 1;
      if (v4 > 0x7FD) {
        break;
      }
      int v3 = a1[++v4];
    }

    while (v3);
    __int16 v6 = v5;
  }

  else
  {
    __int16 v6 = 0;
    unint64_t v5 = 0LL;
  }

  v12[v5 + 1] = 0;
  v12[0] = v6;
  sub_5AE0(0LL, &v10, v12);
  if (dword_262E0)
  {
    uint64_t v7 = 0LL;
    dword_262E0 = 0;
  }

  else
  {
    uint64_t v7 = v10;
    if (v10)
    {
      memcpy(a2, &v11, 2LL * v10);
      uint64_t v8 = v7;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *((_WORD *)a2 + v8) = 0;
  }

  return v7;
}

uint64_t sub_5AE0(uint64_t a1, _WORD *a2, _WORD *a3)
{
  unsigned int v4 = (unsigned __int16)*a3;
  if (!*a3) {
    goto LABEL_26;
  }
  uint64_t v5 = 0LL;
  int v6 = 0;
  while (2)
  {
    __int16 v9 = a3[v5 + 1];
    int v7 = 1;
    switch(v9)
    {
      case '0':
        if (!v5) {
          goto LABEL_24;
        }
        goto LABEL_27;
      case '1':
        goto LABEL_20;
      case '2':
        int v7 = 2;
        goto LABEL_20;
      case '3':
        int v7 = 4;
        goto LABEL_20;
      case '4':
        int v7 = 8;
        goto LABEL_20;
      case '5':
        int v7 = 16;
        goto LABEL_20;
      case '6':
        int v7 = 32;
        goto LABEL_20;
      case '7':
        int v7 = 64;
        goto LABEL_20;
      case '8':
        int v7 = 128;
        goto LABEL_20;
      case '9':
        int v7 = 256;
        goto LABEL_20;
      case 'A':
      case 'a':
        int v7 = 512;
        goto LABEL_20;
      case 'B':
      case 'b':
        int v7 = 1024;
        goto LABEL_20;
      case 'C':
      case 'c':
        int v7 = 2048;
        goto LABEL_20;
      case 'D':
      case 'd':
        int v7 = 4096;
        goto LABEL_20;
      case 'E':
      case 'e':
        int v7 = 0x2000;
        goto LABEL_20;
      case 'F':
      case 'f':
        int v7 = 0x4000;
LABEL_20:
        if (v5 && !v6) {
          goto LABEL_27;
        }
        if ((v7 & v6) == 0)
        {
          v6 |= v7;
LABEL_24:
          if (++v5 >= (unint64_t)v4)
          {
            if ((_DWORD)v5)
            {
              a2[1] = v6 | 0x8000;
              *a2 = 1;
              return 1LL;
            }

uint64_t lou_readCharFromFile(uint64_t result, _DWORD *a2)
{
  if (result)
  {
    if (*a2 == 1)
    {
      *a2 = 0;
      qword_262E8 = result;
      dword_26308 = 0;
      qword_26300 = 0LL;
      qword_262F8 = (uint64_t)fopen((const char *)result, "r");
      if (!qword_262F8)
      {
        _lou_logMessage(40000LL, "Cannot open file '%s'", (const char *)qword_262E8);
LABEL_8:
        *a2 = 1;
        return 0xFFFFFFFFLL;
      }
    }

    else if (!qword_262F8)
    {
      goto LABEL_8;
    }

    uint64_t result = sub_5240((uint64_t)&qword_262E8);
    if ((_DWORD)result != -1) {
      return result;
    }
    fclose((FILE *)qword_262F8);
    qword_262F8 = 0LL;
    goto LABEL_8;
  }

  return result;
}

char *_lou_getTablePath()
{
  v0 = getenv("LOUIS_TABLEPATH");
  if (v0)
  {
    os_log_t v1 = &v6;
    if (*v0)
    {
      int v2 = 0;
      os_log_t v1 = &v7[__sprintf_chk(&v6, 0, 0x800uLL, ",%s", v0) - 1];
    }

    else
    {
      int v2 = 1;
    }
  }

  else
  {
    int v2 = 1;
    os_log_t v1 = &v6;
  }

  if (qword_259E8) {
    BOOL v3 = byte_251E8 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3) {
    v1 += sprintf(v1, ",%s%c%s%c%s", (const char *)qword_259E8, 47LL, "liblouis", 47LL, "tables");
  }
  if (v2) {
    sprintf(v1, ",%s", "./tables");
  }
  if (v6) {
    unsigned int v4 = v7;
  }
  else {
    unsigned int v4 = ".";
  }
  return strdup(v4);
}

void **_lou_defaultTableResolver(const char *a1, const char *a2)
{
  TablePath = _lou_getTablePath();
  int v4 = 0;
  for (i = a1; *i == 44; ++i)
  {
    ++v4;
LABEL_6:
    ;
  }

  if (*i) {
    goto LABEL_6;
  }
  char v6 = (void **)calloc(v4 + 2, 8uLL);
  int v7 = v6;
  if (!v6) {
    _lou_outOfMemory();
  }
  uint64_t v8 = strdup(a1);
  uint64_t v9 = 0LL;
  for (j = v8; ; j = k)
  {
    for (k = j + 1; ; ++k)
    {
      int v12 = *((unsigned __int8 *)k - 1);
      if (!*(k - 1) || v12 == 44) {
        break;
      }
    }

    *((_BYTE *)k - 1) = 0;
    if (!j || !*j) {
      break;
    }
    uint64_t v33 = v9;
    uint64_t v13 = (char *)malloc(0x1000uLL);
    if (!a2) {
      goto LABEL_29;
    }
    if (strlen(a2) > 0xFFF) {
      goto LABEL_57;
    }
    __strcpy_chk(v13, a2, 4096LL);
    LODWORD(v14) = strlen(v13);
    if ((v14 & 0x80000000) == 0)
    {
      uint64_t v14 = v14;
      while (1)
      {
        int v15 = v13[v14];
        if (v15 == 47 || v15 == 92) {
          break;
        }
        if (v14-- <= 0)
        {
          LODWORD(v14) = -1;
          break;
        }
      }
    }

    v13[(int)v14 + 1] = 0;
    size_t v17 = strlen(v13);
    if (strlen(j) + v17 > 0xFFF) {
      goto LABEL_57;
    }
    __strcat_chk(v13, j, 4096LL);
    if (stat(v13, (stat *)&unk_273C0) || (word_273C4 & 0x4000) != 0)
    {
LABEL_29:
      if (strlen(j) > 0xFFF) {
        goto LABEL_57;
      }
      __strcpy_chk(v13, j, 4096LL);
      if (stat(v13, (stat *)&unk_273C0) || (word_273C4 & 0x4000) != 0)
      {
        if (*TablePath)
        {
          int v30 = v8;
          __int16 v31 = v7;
          v32 = TablePath;
          uint64_t v19 = strdup(TablePath);
          v29 = v19;
          while (1)
          {
            for (uint64_t m = 0LL; ; ++m)
            {
              int v21 = v19[m];
              if (!v19[m] || v21 == 44) {
                break;
              }
            }

            v19[m] = 0;
            int v22 = m ? v19 : ".";
            size_t v23 = strlen(v22);
            if (v23 + strlen(j) - 4095 < 0xFFFFFFFFFFFFF000LL) {
              break;
            }
            __sprintf_chk(v13, 0, 0x1000uLL, "%s%c%s", v22, 47LL, j);
            if (!stat(v13, (stat *)&unk_273C0) && (word_273C4 & 0x4000) == 0)
            {
LABEL_50:
              _lou_logMessage(10000LL, "found table %s", v13);
              free(v29);
              int v7 = v31;
              TablePath = v32;
              uint64_t v8 = v30;
              goto LABEL_51;
            }

            if (!v21) {
              break;
            }
            size_t v24 = strlen(v22);
            if (v24 + strlen(j) - 4079 < 0xFFFFFFFFFFFFF000LL) {
              break;
            }
            __sprintf_chk(v13, 0, 0x1000uLL, "%s%c%s%c%s%c%s", v22, 47LL, "liblouis", 47LL, "tables", 47LL, j);
            if (!stat(v13, (stat *)&unk_273C0) && (word_273C4 & 0x4000) == 0) {
              goto LABEL_50;
            }
            v19 += m + 1;
          }

          free(v29);
          int v7 = v31;
          TablePath = v32;
          uint64_t v8 = v30;
        }

LABEL_57:
        free(v13);
        LODWORD(v9) = v33;
        break;
      }

      _lou_logMessage(10000LL, "found table %s", v13);
LABEL_51:
      uint64_t v18 = v33;
      v7[v33] = v13;
      if (!v13) {
        goto LABEL_59;
      }
    }

    else
    {
      _lou_logMessage(10000LL, "found table %s", v13);
      uint64_t v18 = v9;
      v7[v9] = v13;
    }

    uint64_t v9 = v18 + 1;
    if (!v12)
    {
      free(TablePath);
      free(v8);
      v7[v9] = 0LL;
      return v7;
    }

    BOOL v25 = v18 == 0;
    unsigned int v26 = a2;
    if (v25) {
      unsigned int v26 = j;
    }
    a2 = v26;
  }

  v7[v9] = 0LL;
LABEL_59:
  _lou_logMessage(40000LL, "Cannot resolve table '%s'", j);
  unsigned int v27 = getenv("LOUIS_TABLEPATH");
  if (v27 && *v27) {
    _lou_logMessage(40000LL, "LOUIS_TABLEPATH=%s", v27);
  }
  free(TablePath);
  free(v8);
  sub_62B4(v7);
  return 0LL;
}

            v59 = v50;
            size_t v24 = v8 + 5;
            break;
          default:
            if (v22 != 64) {
              goto LABEL_18;
            }
LABEL_10:
            size_t v23 = *(unsigned __int16 *)(v21 + 2LL * v8 + 2);
            if (!*(_WORD *)(v21 + 2LL * v8 + 2))
            {
              size_t v24 = v8 + v23 + 2;
LABEL_59:
              v51 = 1;
              goto LABEL_61;
            }

            LODWORD(v25) = v8 + 2;
            size_t v24 = v8 + 2 + v23;
            BOOL v25 = (int)v25;
            unsigned int v26 = (unsigned __int16 *)(*(void *)(a3 + 8) + 2LL * (int)v16);
            while (1)
            {
              unsigned int v27 = *v26++;
              if (++v25 >= v24) {
                goto LABEL_59;
              }
            }

            v51 = 0;
LABEL_61:
            v59 = v51;
            LODWORD(v16) = v16 + v23;
            break;
        }

void sub_62B4(void **a1)
{
  if (a1)
  {
    int v2 = *a1;
    if (v2)
    {
      BOOL v3 = a1 + 1;
      do
      {
        free(v2);
        int v4 = *v3++;
        int v2 = v4;
      }

      while (v4);
    }

    free(a1);
  }

void *_lou_resolveTable(const char *a1, const char *a2)
{
  int v2 = ((void **(*)(const char *, const char *))off_24F70[0])(a1, a2);
  BOOL v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = -2LL;
    do
    {
      char v6 = v2[v4];
      ++v5;
      ++v4;
    }

    while (v6);
    int v7 = malloc((v4 * 8) & 0x7FFFFFFF8LL);
    v7[v4 - 1] = 0LL;
    if ((_DWORD)v5 != -1)
    {
      do
      {
        v7[v5] = strdup((const char *)v3[v5]);
        --v5;
      }

      while (v5 != -1);
    }
  }

  else
  {
    int v7 = 0LL;
  }

  return v7;
}

uint64_t (*lou_registerTableResolver(uint64_t (*result)()))()
{
  off_24F70[0] = result;
  return result;
}

void *lou_getEmphClasses(char *a1)
{
  uint64_t TranslationTable = _lou_getTranslationTable(a1);
  if (!TranslationTable) {
    return 0LL;
  }
  for (uint64_t i = 0LL; i != 10; ++i)
  {
    uint64_t v3 = *(void *)(TranslationTable + 1232 + 8 * i);
    if (!v3) {
      break;
    }
    v8[i] = v3;
  }

  v8[i] = 0LL;
  size_t v4 = (8 * i + 8);
  uint64_t v5 = malloc(v4);
  char v6 = v5;
  if (v5) {
    memcpy(v5, v8, v4);
  }
  return v6;
}

uint64_t _lou_getTranslationTable(char *a1)
{
  uint64_t result = v2;
  if (v2)
  {
    else {
      return 0LL;
    }
  }

  return result;
}

const char **_lou_getTable(char *a1, char *a2, uint64_t *a3, void *a4)
{
  uint64_t v8 = 0LL;
  getTable(a1, a2, &v9, &v8);
  uint64_t result = v9;
  if (v9)
  {
    uint64_t result = sub_6AF4((uint64_t)v9);
    uint64_t v7 = (uint64_t)v9;
    if (!(_DWORD)result) {
      uint64_t v7 = 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  *a3 = v7;
  *a4 = v8;
  return result;
}

void getTable(char *__s, char *a2, void *a3, void *a4)
{
  if (__s && *__s)
  {
    if (!a2) {
      goto LABEL_14;
    }
  }

  else
  {
    a3 = 0LL;
    if (!a2) {
      goto LABEL_14;
    }
  }

  if (*a2)
  {
    if (!a3) {
      goto LABEL_15;
    }
    goto LABEL_8;
  }

LABEL_14:
  a4 = 0LL;
  if (!a3)
  {
LABEL_15:
    if (a4) {
      goto LABEL_16;
    }
LABEL_25:
    int v12 = 0;
    goto LABEL_26;
  }

LABEL_8:
  int v4 = strlen(__s);
  *a3 = 0LL;
  uint64_t v9 = qword_27320;
  if (!qword_27320) {
    goto LABEL_15;
  }
  unsigned __int16 v10 = 0LL;
  while (1)
  {
    __int16 v11 = (uint64_t *)v9;
    uint64_t v9 = *v11;
    unsigned __int16 v10 = v11;
    if (!*v11) {
      goto LABEL_15;
    }
  }

  if (v10)
  {
    uint64_t *v10 = *v11;
    uint64_t *v11 = qword_27320;
    qword_27320 = (uint64_t)v11;
  }

  *a3 = v11[1];
  if (!a4) {
    goto LABEL_25;
  }
LABEL_16:
  int v12 = strlen(a2);
  *a4 = 0LL;
  uint64_t v13 = qword_27328;
  if (qword_27328)
  {
    uint64_t v14 = 0LL;
    while (1)
    {
      int v15 = (uint64_t *)v13;
      uint64_t v13 = *v15;
      uint64_t v14 = v15;
      if (!*v15) {
        goto LABEL_26;
      }
    }

    if (v14)
    {
      uint64_t *v14 = *v15;
      uint64_t *v15 = qword_27328;
      qword_27328 = (uint64_t)v15;
    }

    *a4 = v15[1];
    if (!a3) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }

LABEL_40:
  if (*a4) {
    goto LABEL_41;
  }
  unint64_t v17 = (unint64_t)&v44;
  if (__s) {
    goto LABEL_45;
  }
LABEL_44:
  if (v16)
  {
LABEL_106:
    _lou_logMessage(40000LL, "%s could not be compiled", __s);
    return;
  }

  *((_DWORD *)v3 + 15) = 1;
  return v3;
}

LABEL_45:
  if (v16) {
    char *v16 = 0LL;
  }
  if (v17) {
    *(void *)unint64_t v17 = 0LL;
  }
  v43 = (void **)v17;
  dword_27C50 = 0;
  dword_273B8 = 0;
  dword_262E0 = 0;
  if (!word_259F4[0])
  {
    for (uint64_t i = 0LL; i != 117; ++i)
      word_259F4[i] = strlen(off_20358[i]);
  }

  if (v16)
  {
    uint64_t v19 = *v16;
    int v20 = v43;
    if (!*v16)
    {
      int v21 = malloc(0xF710uLL);
      char *v16 = v21;
      if (!v21)
      {
        sub_7454(0LL, "Not enough memory");
        if (*v16) {
          free(*v16);
        }
        char *v16 = 0LL;
        _lou_outOfMemory();
      }

      bzero(v21, 0xF710uLL);
      uint64_t v19 = *v16;
      *(void *)char *v16 = 0x7B900000F710LL;
    }

    if (!v43)
    {
      v19[154] = 0LL;
      v19[1] = 0LL;
      v19[4] = 0LL;
      sub_72D0((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT", v16, 0LL);
      goto LABEL_86;
    }
  }

  else
  {
    int v20 = v43;
    if (!v43)
    {
      sub_72D0((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT", 0LL, 0LL);
      goto LABEL_94;
    }
  }

  if (!*v20)
  {
    int v22 = malloc(0x4650uLL);
    *int v20 = v22;
    if (!v22)
    {
      sub_7454(0LL, "Not enough memory");
      if (*v20) {
        free(*v20);
      }
      *int v20 = 0LL;
      _lou_outOfMemory();
    }

    bzero(v22, 0x4650uLL);
    *(void *)*int v20 = 0x233000004650LL;
  }

  if (v16)
  {
    size_t v23 = *v16;
    v23[154] = 0LL;
    v23[1] = 0LL;
    v23[4] = 0LL;
    sub_72D0((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT", v16, v20);
    if (!strcmp(__s, a2))
    {
      size_t v24 = (const char **)_lou_resolveTable(__s, 0LL);
      BOOL v25 = (void **)v24;
      if (v24)
      {
        unsigned int v26 = *v24;
        if (*v25)
        {
          uint64_t v27 = 1LL;
          do
          {
            unsigned int v26 = (const char *)v25[v27++];
          }

          while (v26);
        }

        goto LABEL_95;
      }

      goto LABEL_92;
    }
  }

  else
  {
    sub_72D0((void **)"space \\xffff 123456789abcdef LOU_ENDSEGMENT", 0LL, v20);
  }

  v28 = (const char **)_lou_resolveTable(a2, 0LL);
  BOOL v25 = (void **)v28;
  if (v28)
  {
    v29 = *v28;
    if (*v25)
    {
      uint64_t v30 = 1LL;
      while (sub_7AA8(v29, 0LL, (uint64_t)v20))
      {
        v29 = (const char *)v25[v30++];
        if (!v29) {
          goto LABEL_85;
        }
      }

      goto LABEL_95;
    }

LABEL_85:
    sub_62B4(v25);
    if (v16)
    {
LABEL_86:
      __int16 v31 = (const char **)_lou_resolveTable(__s, 0LL);
      BOOL v25 = (void **)v31;
      if (v31)
      {
        v32 = *v31;
        if (*v25)
        {
          uint64_t v33 = 1LL;
          do
          {
            if (!sub_7AA8(v32, v16, 0LL)) {
              break;
            }
            v32 = (const char *)v25[v33++];
          }

          while (v32);
        }

        goto LABEL_95;
      }

      goto LABEL_92;
    }

            uint64_t result = _lou_handlePassVariableAction(a8, &a9);
            if (!(_DWORD)result) {
              return result;
            }
            unsigned int v26 = a9;
            goto LABEL_109;
          }

          goto LABEL_46;
        }

        if (v32 != 42)
        {
          if (v32 != 59) {
            goto LABEL_85;
          }
          if (!v140) {
            return 0LL;
          }
          v65 = *v137;
          v66 = *v136;
          v67 = v24
              + ((8LL * *(unsigned __int8 *)(a8 + 2LL * v26 + 4)) | ((unint64_t)*(unsigned __int16 *)(a8 + 2LL * v26 + 2) << 19));
          v68 = *(_WORD *)(v67 + 31670 + 2 * v130);
          v69 = *(_WORD *)(v67 + 31670 + 2 * ((int)v130 | 1LL));
          if (v135 == 123)
          {
            v70 = 0;
            v71 = *(int *)(*a2 + 16);
            else {
              v72 = *(_DWORD *)(*a2 + 16);
            }
            v73 = (v145 >> 32) + 1;
            v74 = HIDWORD(v145);
            while (v73 < v71)
            {
              v75 = *(unsigned __int16 *)(*(void *)(*a2 + 8) + 2 * v73);
              v70 -= v75 == v65;
              if (v75 == v66) {
                ++v70;
              }
              ++v74;
              ++v73;
              if (v70 == 1) {
                goto LABEL_104;
              }
            }

            v74 = v72;
LABEL_104:
            if (v74 == (_DWORD)v71) {
              return 0LL;
            }
            v110 = *(_WORD *)(v67 + 31670 + 2 * v130);
            v127 = v30;
            v111 = sub_12D6C(v71);
            v112 = (void *)qword_29E60[v111];
            memcpy(v112, *(const void **)(*a2 + 8), 2LL * *(int *)(*a2 + 16));
            *((_WORD *)v112 + (v145 >> 32)) = v110;
            *((_WORD *)v112 + v74) = v69;
            v113 = *(_DWORD *)(*a2 + 16);
            dword_29E88 = v111;
            uint64_t v30 = v127;
            qword_29E90 = (uint64_t)v112;
            dword_29E98 = v113;
            *a2 = (uint64_t)&dword_29E88;
            __int16 v31 = v143;
            unsigned int v26 = a9;
            a8 = v124;
            a6 = v133;
          }

          else
          {
            if (v134 == 74)
            {
              v96 = v67 + 31616;
              v65 = *(unsigned __int16 *)(v140 + 58);
              v66 = *(unsigned __int16 *)(v140 + 60);
              v68 = *(_WORD *)(v96 + 58);
              v69 = *(_WORD *)(v96 + 60);
            }

            v97 = 0;
            v98 = *(void *)(a3 + 8);
            v99 = *(unsigned int *)(a3 + 20);
            *(_WORD *)(v98 + 2LL * (int)v99) = v69;
            v100 = v99;
            a6 = v133;
            do
            {
              v101 = v100 - 1;
              v102 = *(unsigned __int16 *)(v98 - 2 + 2 * v100);
              v97 -= v102 == v66;
              if (v102 == v65) {
                ++v97;
              }
              v100 = v101;
            }

            while (v97 != 1);
            *(_WORD *)(v98 + 2LL * v101) = v68;
            *(_DWORD *)(a3 + 20) = v99 + 1;
          }

          size_t v24 = v139;
          goto LABEL_107;
        }

        v89 = v138;
        if (v138 - v144 >= 1)
        {
          memmove( (void *)(*(void *)(a3 + 8) + 2LL * v144),  (const void *)(*(void *)(a3 + 8) + 2LL * v138),  2LL * (v138 - v144));
          *(_DWORD *)(a3 + 20) -= v138 - v144;
          v89 = v144;
        }

        __int16 v31 = v143;
        uint64_t result = sub_18988(v27, v143, v24, *a2, a3, a4, v134, v141, v142, v25);
        if (!(_DWORD)result) {
          return result;
        }
        v138 = v89;
        unsigned int v26 = ++a9;
        uint64_t v30 = v129;
LABEL_109:
      }

      if (*(unsigned __int16 *)(a8 + 2LL * v26) > 0x7Au)
      {
        if (v32 == 123)
        {
          v90 = a8 + 2LL * v26;
          v91 = *(unsigned __int16 *)(v90 + 2);
          v92 = *(unsigned __int16 *)(v90 + 4);
          *(_DWORD *)(a4 + 4LL * *(int *)(a3 + 20)) = v145;
          v79 = (8 * v92) | (v91 << 19);
          v80 = v131;
        }

        else
        {
          if (v32 != 125) {
            goto LABEL_85;
          }
          v76 = a8 + 2LL * v26;
          v77 = *(unsigned __int16 *)(v76 + 2);
          v78 = *(unsigned __int16 *)(v76 + 4);
          *(_DWORD *)(a4 + 4LL * *(int *)(a3 + 20)) = v145;
          v79 = (8 * v78) | (v77 << 19);
          v80 = v132;
        }

        v93 = *(_WORD *)(v80 + v79 + 31616);
        v94 = *(void *)(a3 + 8);
        v95 = *(int *)(a3 + 20);
        *(_DWORD *)(a3 + 20) = v95 + 1;
        *(_WORD *)(v94 + 2 * v95) = v93;
LABEL_107:
        v26 += 3;
      }

      else
      {
        if (v32 == 63)
        {
          if (v140)
          {
            v81 = *v137;
            v82 = *v136;
            if (v135 == 123)
            {
              v83 = 0;
              v84 = *(int *)(*a2 + 16);
              else {
                v85 = *(_DWORD *)(*a2 + 16);
              }
              v86 = (v145 >> 32) + 1;
              v87 = HIDWORD(v145);
              while (v86 < v84)
              {
                v88 = *(unsigned __int16 *)(*(void *)(*a2 + 8) + 2 * v86);
                v83 -= v88 == v81;
                if (v88 == v82) {
                  ++v83;
                }
                ++v87;
                ++v86;
                if (v83 == 1) {
                  goto LABEL_112;
                }
              }

              v87 = v85;
LABEL_112:
              if (v87 != (_DWORD)v84)
              {
                v114 = sub_12D6C(v84);
                v115 = qword_29E60[v114];
                v116 = *a2;
                v117 = *(unsigned int *)(*a2 + 16);
                if ((int)v117 < 1)
                {
                  v119 = 0;
                }

                else
                {
                  v118 = 0LL;
                  v119 = 0;
                  v120 = 2 * v117;
                  do
                  {
                    if (2LL * v87 != v118) {
                      *(_WORD *)(v115 + 2LL * v119++) = *(_WORD *)(*(void *)(v116 + 8) + v118);
                    }
                    v118 += 2LL;
                  }

                  while (v120 != v118);
                }

                dword_29EA0 = v114;
                qword_29EA8 = v115;
                dword_29EB0 = v119;
                *a2 = (uint64_t)&dword_29EA0;
                unsigned int v26 = a9;
              }
            }

            else
            {
              v103 = 0;
              v104 = *(int *)(a3 + 20);
              v105 = *(unsigned int *)(a3 + 20);
              v106 = -1LL;
              while (1)
              {
                v107 = v106;
                v108 = *(void *)(a3 + 8);
                v109 = *(unsigned __int16 *)(v108 + 2 * v105 + 2 * v106);
                v103 -= v109 == v82;
                if (v109 == v81) {
                  ++v103;
                }
                v106 = v107 - 1;
                if (v103 == 1)
                {
                  if ((int)v104 > (int)v105 + (int)v106 + 2)
                  {
                    do
                    {
                      *(_WORD *)(v108 + 2 * v104 + 2 * v107) = *(_WORD *)(v108 + 2 * v104 + 2 * v107 + 2);
                      ++v107;
                    }

                    while ((_DWORD)v107 != -1);
                  }

                  *(_DWORD *)(a3 + 20) = v105 - 1;
                  break;
                }
              }
            }
          }

          a9 = ++v26;
          size_t v24 = v139;
          goto LABEL_109;
        }

        if (v32 != 64) {
          goto LABEL_85;
        }
LABEL_46:
        v60 = *(unsigned __int16 *)(a8 + 2LL * v26 + 2);
        v61 = *(_DWORD *)(a3 + 20);
        if (*(_WORD *)(a8 + 2LL * v26 + 2))
        {
          v62 = 0LL;
          do
          {
            *(_DWORD *)(a4 + 4 * (v62 + *(int *)(a3 + 20))) = v27;
            ++v62;
          }

          while ((_DWORD)v60 != (_DWORD)v62);
          v61 = *(_DWORD *)(a3 + 20);
        }

        memcpy((void *)(*(void *)(a3 + 8) + 2LL * v61), (const void *)(a8 + 2LL * v26 + 4), 2 * v60);
        v63 = a9;
        v64 = *(unsigned __int16 *)(a8 + 2LL * (a9 + 1));
        *(_DWORD *)(a3 + 20) += v64;
        unsigned int v26 = v63 + v64 + 2;
      }

      a9 = v26;
      goto LABEL_109;
    }

    uint64_t v30 = a12;
LABEL_123:
    *a10 = v30;
    return 1LL;
  }

  return result;
}

LABEL_94:
    BOOL v25 = 0LL;
    goto LABEL_95;
  }

LABEL_92:
  ++dword_262E0;
LABEL_95:
  sub_62B4(v25);
  if (dword_273B8) {
    _lou_logMessage(30000LL, "%s: %d warnings issued", __s, dword_273B8);
  }
  if (dword_262E0)
  {
    _lou_logMessage(40000LL, "%d errors found.", dword_262E0);
    if (v16)
    {
      if (*v16) {
        sub_71DC((void **)*v16);
      }
      char *v16 = 0LL;
    }

    if (v20)
    {
      if (*v20) {
        free(*v20);
      }
      *int v20 = 0LL;
    }

    goto LABEL_106;
  }

  if (v16)
  {
    uint64_t v34 = 0LL;
    v35 = *v16;
    uint64_t v36 = (uint64_t)*v16 + 1992;
    do
    {
      if (!*(_DWORD *)(v36 + v34)) {
        *(_DWORD *)(v36 + v34) = 4;
      }
      v34 += 36LL;
    }

    while (v34 != 108);
    if (!v35[233]) {
      v35[233] = 1;
    }
  }

  uint64_t v37 = v45;
  if (v45)
  {
    v38 = malloc(v4 + 24);
    uint64_t v39 = (uint64_t)v38;
    if (!v38) {
      _lou_outOfMemory();
    }
    void *v38 = qword_27320;
    v38[1] = v37;
    *((_DWORD *)v38 + 4) = v4;
    memcpy((char *)v38 + 20, __s, v4);
    qword_27320 = v39;
    *a3 = v37;
  }

  uint64_t v40 = v44;
  if (v44)
  {
    v41 = malloc(v12 + 24);
    uint64_t v42 = (uint64_t)v41;
    if (!v41) {
      _lou_outOfMemory();
    }
    void *v41 = qword_27328;
    v41[1] = v40;
    *((_DWORD *)v41 + 4) = v12;
    memcpy((char *)v41 + 20, a2, v12);
    qword_27328 = v42;
    *a4 = v40;
  }

      v58 = v19 + 36LL * v37 + 1960;
      if (!*(_DWORD *)(v19 + 36LL * v37 + 1984))
      {
        __int16 v31 = a6;
        if (*(_DWORD *)(v19 + 36LL * v37 + 1980))
        {
          if (!*(_DWORD *)(v19 + 36LL * v37 + 1972)) {
            goto LABEL_369;
          }
          v61 = *(_DWORD *)(v30 + 16);
          if (v61 >= 1)
          {
            for (uint64_t i = 0LL; i < v61; ++i)
            {
              v63 = *(void *)(v32 + 8 * i);
              v64 = *(_DWORD *)(v36 + 16);
              if (((unsigned __int16)v64 & (unsigned __int16)v63) != 0)
              {
                v65 = v32 + 8 * i;
                v66 = *(void *)(v65 + 8);
                if ((v64 & WORD1(v66)) != 0)
                {
                  *(void *)(v32 + 8 * i) = v63 & 0xFFFFFFFFFFFF0000LL | ((unsigned __int16)v64 ^ 0xFFFF) & v63;
                  *(void *)(v65 + 8) = v66 & 0xFFFFFFFF0000FFFFLL | v66 & (~*(_DWORD *)(v36 + 16) << 16);
                  *(void *)(v32 + 8 * i) = v63 & 0xFFFFFFFF0000LL | ((unsigned __int16)v64 ^ 0xFFFF) & v63 | ((unint64_t)(unsigned __int16)(*(_WORD *)(v36 + 16) | HIWORD(v63)) << 48);
                  v61 = *(_DWORD *)(v30 + 16);
                }
              }
            }
          }
        }

        goto LABEL_409;
      }

      v59 = (_DWORD *)(v19 + 36LL * *(unsigned __int16 *)(v36 + 20));
      if (v59[490])
      {
        if (v59[492]) {
          v60 = 1;
        }
        else {
          v60 = v59[494] != 0;
        }
        v512 = v60;
      }

      else
      {
        v512 = 0;
      }

      v502 = v19 + 36LL * v37 + 1960;
      if (*(int *)(v30 + 16) < 1)
      {
        v74 = -1;
        goto LABEL_186;
      }

      v67 = 0LL;
      v68 = 0;
      v69 = 0;
      v70 = 0;
      v71 = v59[495];
      v72 = -1;
      v73 = -1LL;
      v74 = -1;
      v520 = v71;
      while (2)
      {
        v75 = *(void *)(v32 + 8 * v67);
        v76 = *(_DWORD *)(v36 + 16);
        if (v69)
        {
LABEL_119:
          if ((v76 & WORD1(v75)) != 0)
          {
            v69 = 0;
            *(void *)(v32 + 8 * v67) = v75 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v75) & ~v76) << 16);
            v79 = 1;
            if (v68 && (v72 & 0x80000000) == 0)
            {
              v80 = *(_DWORD *)(v36 + 16);
              v81 = *(void *)(v32 + 8LL * v72);
              if (v71 && v70 == 1)
              {
                v69 = 0;
                *(void *)(v32 + 8LL * v72) = v81 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v80 | HIWORD(v81)) << 48);
              }

              else
              {
                *(void *)(v32 + 8LL * v72) = v81 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(v80 | WORD2(v81)) << 32);
                v69 = 0;
                if ((*(_DWORD *)(j + 4 * v67) & 1) != 0)
                {
                  v100 = *(void *)(v32 + 8 * v67);
                  v101 = v100 & 0xFFFFFFFF0000FFFFLL | v100 & 0xFFFF0000 | (*(_DWORD *)(v36 + 16) << 16);
                  *(void *)(v32 + 8 * v67) = v101;
                  *(void *)(v32 + 8 * v67) = v101 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_WORD *)(v36 + 16) | WORD2(v100)) << 32);
                }
              }

              goto LABEL_127;
            }
          }

          else
          {
            v79 = 0;
            v69 = 1;
          }

          if (!v68) {
            goto LABEL_141;
          }
        }

        else
        {
          v77 = (unsigned __int16)*(_DWORD *)(v36 + 16);
          if ((v77 & v75) != 0)
          {
            v75 = v75 & 0xFFFFFFFFFFFF0000LL | (v77 ^ 0xFFFF) & v75;
            *(void *)(v32 + 8 * v67) = v75;
            if (v68) {
              v78 = v67;
            }
            else {
              v78 = v72;
            }
            if ((*(_DWORD *)(j + 4 * v67) & 1) != 0) {
              v72 = v78;
            }
            else {
              v72 = -1;
            }
            v76 = *(_DWORD *)(v36 + 16);
            goto LABEL_119;
          }

          v69 = 0;
          v79 = 1;
          if (!v68)
          {
LABEL_141:
            if ((*(_DWORD *)(j + 4 * v67) & 1) != 0)
            {
              if (sub_19718(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v67), v19, v36))
              {
                if (!v79) {
                  v72 = v67;
                }
                LODWORD(v88) = v74 + 1;
                if (v67 > (int)(v74 + 1))
                {
                  v88 = (int)v88;
                  do
                    *(_DWORD *)(j + 4 * v88++) &= ~1u;
                  while (v67 != v88);
                }

                v32 = a10;
                uint64_t v36 = v531;
                v71 = v520;
                if ((v74 & 0x80000000) == 0)
                {
                  v89 = *(void *)(a10 + 8LL * v74);
                  v90 = *(_DWORD *)(v531 + 16);
                  if (((unsigned __int16)v90 & HIWORD(v89)) == 0)
                  {
                    v91 = v90 & WORD1(v89);
                    v93 = (unint64_t *)(a10 + 8LL * v74);
                    if (v73 <= v74) {
                      v94 = v74;
                    }
                    else {
                      v94 = v73;
                    }
                    v95 = v94 - v74;
                    while (v95)
                    {
                      v97 = v93[1];
                      ++v93;
                      v96 = v97;
                      v98 = *(_DWORD *)(v531 + 16);
                      --v95;
                      if ((v98 & WORD1(v97)) != 0)
                      {
                        *v93 = v96 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v96) & ~v98) << 16);
                        *v93 = v96 & 0xFFFF00000000FFFFLL | ((WORD1(v96) & ~v98) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v96) & ~*(_WORD *)(v531 + 16)) << 32);
                        goto LABEL_127;
                      }
                    }
                  }
                }

                goto LABEL_127;
              }

              v32 = a10;
              uint64_t v36 = v531;
              v71 = v520;
            }

const char **sub_6AF4(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 924)) {
    return (const char **)(&dword_0 + 1);
  }
  uint64_t v3 = 0LL;
  while (1)
  {
    unsigned int v4 = *(_DWORD *)(a1 + 4 * v3 + 13608);
    if (v4) {
      break;
    }
LABEL_8:
    if (++v3 == 1123)
    {
      for (uint64_t i = 0LL; i != 1123; ++i)
      {
        for (uint64_t j = *(unsigned int *)(a1 + 4 * i + 13608); (_DWORD)j; uint64_t j = *(unsigned int *)(v7 + 12))
        {
          uint64_t v7 = a1 + 8 * j + 31616;
          if ((*(_BYTE *)(v7 + 24) & 2) != 0)
          {
            for (uint64_t k = *(unsigned int *)(v7 + 20); (_DWORD)k; uint64_t k = *(unsigned int *)(v9 + 16))
            {
              uint64_t v9 = a1 + 8 * k + 31616;
              if ((*(_DWORD *)(v9 + 44) & 0xFFFFFFFE) == 0x5A)
              {
                uint64_t v10 = *(int *)(a1 + 3192);
                if ((int)v10 <= 255)
                {
                  __int16 v11 = *(_WORD *)(v9 + 54);
                  *(_DWORD *)(a1 + 3192) = v10 + 1;
                  *(_WORD *)(a1 + 2 * v10 + 2680) = v11;
                }
              }
            }
          }
        }
      }

      for (uint64_t m = 0LL; m != 1123; ++m)
      {
        uint64_t v13 = (_DWORD *)(a1 + 4 * m + 22632);
        uint64_t v14 = *v13;
        if ((_DWORD)v14)
        {
          do
          {
            while (1)
            {
              uint64_t v15 = a1 + 8 * v14 + 31616;
              if (*(_DWORD *)(a1 + 8 * v14 + 31660) == 74)
              {
                uint64_t v16 = _lou_stringHash((unsigned __int16 *)(a1 + 8 * v14 + 31670), 1, a1);
                if (v16 != m) {
                  break;
                }
              }

              uint64_t v14 = *(unsigned int *)(v15 + 16);
              uint64_t v13 = (_DWORD *)(v15 + 16);
              if (!*(_DWORD *)(v15 + 16)) {
                goto LABEL_33;
              }
            }

            unint64_t v17 = (_DWORD *)(a1 + 4 * v16 + 22632);
            uint64_t v18 = *v17;
            if ((_DWORD)v18)
            {
              uint64_t v19 = a1 + 8 * v18 + 31616;
              for (int n = *(__int16 *)(a1 + 8 * v18 + 31666);
                    *(__int16 *)(v15 + 50) <= n
                 && (*(unsigned __int16 *)(v15 + 50) != (unsigned __int16)n || *(_DWORD *)(v19 + 44) != 83);
                    int n = *(__int16 *)(a1 + 8 * v18 + 31666))
              {
                uint64_t v18 = *(unsigned int *)(v19 + 16);
                unint64_t v17 = (_DWORD *)(v19 + 16);
                if (!*(_DWORD *)(v19 + 16)) {
                  break;
                }
                uint64_t v19 = a1 + 8 * v18 + 31616;
              }
            }

            uint64_t v14 = *(unsigned int *)(v15 + 16);
            *(_DWORD *)(v15 + 16) = v18;
            _DWORD *v17 = *v13;
            *uint64_t v13 = v14;
          }

          while (v14);
        }

LABEL_33:
        ;
      }

      uint64_t result = (const char **)(&dword_0 + 1);
      *(_DWORD *)(a1 + 924) = 1;
      return result;
    }
  }

  while (1)
  {
    uint64_t result = sub_75CC(a1, v4, 0);
    if (!result) {
      return result;
    }
    unsigned int v4 = *((_DWORD *)result + 3);
    if (!v4) {
      goto LABEL_8;
    }
  }

uint64_t lou_getTable(char *a1)
{
  if (v3) {
    BOOL v1 = v4 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1) {
    return 0LL;
  }
  else {
    return v4;
  }
}

uint64_t _lou_getDisplayTable(char *a1)
{
  return v2;
}

BOOL lou_checkTable(char *a1)
{
  if (v4) {
    BOOL v1 = v3 == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

uint64_t lou_getTypeformForEmphClass(char *a1, const char *a2)
{
  uint64_t TranslationTable = _lou_getTranslationTable(a1);
  if (TranslationTable)
  {
    uint64_t v4 = 0LL;
    uint64_t v5 = TranslationTable + 1232;
    do
    {
      char v6 = *(const char **)(v5 + 8 * v4);
      if (!v6) {
        break;
      }
      if (!strcmp(a2, v6)) {
        return (unsigned __int16)(1 << v4);
      }
      ++v4;
    }

    while (v4 != 10);
  }

  LOWORD(v7) = 0;
  return (unsigned __int16)v7;
}

void *_lou_allocMem(int a1, unsigned int a2, int a3, int a4)
{
  if (a3 <= 1024) {
    unsigned int v4 = 1024;
  }
  else {
    unsigned int v4 = a3;
  }
  if (a4 <= 1024) {
    int v5 = 1024;
  }
  else {
    int v5 = a4;
  }
  switch(a1)
  {
    case 0:
      uint64_t result = (void *)qword_27338;
      if (v5 > dword_27330)
      {
        if (qword_27338) {
          free((void *)qword_27338);
        }
        uint64_t result = malloc((2 * v5 + 8));
        qword_27338 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27330 = v5;
      }

      break;
    case 1:
      if (qword_27340) {
        free((void *)qword_27340);
      }
      uint64_t result = calloc(v4 + 4, 4uLL);
      qword_27340 = (uint64_t)result;
      if (!result) {
        _lou_outOfMemory();
      }
      return result;
    case 2:
      if (qword_27348) {
        free((void *)qword_27348);
      }
      uint64_t result = calloc(v4 + 4, 8uLL);
      qword_27348 = (uint64_t)result;
      if (!result) {
        _lou_outOfMemory();
      }
      return result;
    case 3:
      uint64_t result = (void *)qword_27358;
      if (v5 > dword_27350)
      {
        if (qword_27358) {
          free((void *)qword_27358);
        }
        uint64_t result = malloc((v5 + 4));
        qword_27358 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27350 = v5;
      }

      break;
    case 4:
      if (a2 >= 3)
      {
        _lou_logMessage(50000LL, "Index out of bounds: %d\n", a2);
        exit(3);
      }

      uint64_t v7 = a2;
      if (v5 > dword_27360[a2])
      {
        uint64_t v8 = (void *)qword_27370[a2];
        if (v8) {
          free(v8);
        }
        uint64_t v9 = malloc((2 * v5 + 8));
        qword_27370[v7] = v9;
        if (!v9) {
          _lou_outOfMemory();
        }
        dword_27360[v7] = v5;
      }

      uint64_t result = (void *)qword_27370[v7];
      break;
    case 5:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_27390;
      if (v5 > dword_27388)
      {
        if (qword_27390) {
          free((void *)qword_27390);
        }
        uint64_t result = malloc(4LL * (v5 + 4));
        qword_27390 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27388 = v5;
      }

      break;
    case 6:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_273A0;
      if (v5 > dword_27398)
      {
        if (qword_273A0) {
          free((void *)qword_273A0);
        }
        uint64_t result = malloc(4LL * (v5 + 4));
        qword_273A0 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_27398 = v5;
      }

      break;
    case 7:
      if (v4 > v5) {
        int v5 = v4;
      }
      uint64_t result = (void *)qword_273B0;
      if (v5 > dword_273A8)
      {
        if (qword_273B0) {
          free((void *)qword_273B0);
        }
        uint64_t result = malloc(4LL * (v5 + 4));
        qword_273B0 = (uint64_t)result;
        if (!result) {
          _lou_outOfMemory();
        }
        dword_273A8 = v5;
      }

      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void lou_free()
{
  v0 = (void ***)qword_27320;
  if (qword_27320)
  {
    do
    {
      sub_71DC(v0[1]);
      BOOL v1 = *v0;
      free(v0);
      v0 = (void ***)v1;
    }

    while (v1);
    qword_27320 = 0LL;
  }

  uint64_t v2 = (void **)qword_27328;
  if (qword_27328)
  {
    do
    {
      free(v2[1]);
      uint64_t v3 = (void **)*v2;
      free(v2);
      uint64_t v2 = v3;
    }

    while (v3);
    qword_27328 = 0LL;
  }

  if (qword_27338) {
    free((void *)qword_27338);
  }
  qword_27338 = 0LL;
  if (qword_27340) {
    free((void *)qword_27340);
  }
  qword_27340 = 0LL;
  if (qword_27348) {
    free((void *)qword_27348);
  }
  qword_27348 = 0LL;
  dword_27330 = 0;
  if (qword_27358) {
    free((void *)qword_27358);
  }
  uint64_t v4 = 0LL;
  qword_27358 = 0LL;
  dword_27350 = 0;
  do
  {
    int v5 = (void *)qword_27370[v4];
    if (v5) {
      free(v5);
    }
    qword_27370[v4] = 0LL;
    dword_27360[v4++] = 0;
  }

  while (v4 != 3);
  if (qword_27390) {
    free((void *)qword_27390);
  }
  qword_27390 = 0LL;
  dword_27388 = 0;
  if (qword_273A0) {
    free((void *)qword_273A0);
  }
  qword_273A0 = 0LL;
  dword_27398 = 0;
  if (qword_273B0) {
    free((void *)qword_273B0);
  }
  qword_273B0 = 0LL;
  dword_273A8 = 0;
  word_259F4[0] = 0;
}

void sub_71DC(void **a1)
{
  for (uint64_t i = 154LL; i != 164; ++i)
  {
    uint64_t v3 = a1[i];
    if (!v3) {
      break;
    }
    free(v3);
  }

  uint64_t v4 = a1[14];
  if (v4)
  {
    int v5 = a1 + 15;
    do
    {
      free(v4);
      char v6 = *v5++;
      uint64_t v4 = v6;
    }

    while (v6);
  }

  while (1)
  {
    uint64_t v7 = (void **)a1[1];
    if (!v7) {
      break;
    }
    a1[1] = *v7;
    free(v7);
  }

  while (1)
  {
    uint64_t v8 = (void **)a1[4];
    if (!v8) {
      break;
    }
    a1[4] = *v8;
    free(v8);
  }

  free(a1);
}

const char *lou_version()
{
  return "3.31.0";
}

uint64_t lou_charSize()
{
  return 2LL;
}

BOOL lou_compileString(char *a1, void **a2)
{
  return v5 && sub_72D0(a2, &v5, &v4) != 0;
}

void **sub_72D0(void **result, void **a2, void **a3)
{
  if (result)
  {
    int v5 = result;
    bzero(v8, 0x1030uLL);
    uint64_t v6 = 0LL;
    uint64_t v7 = v5;
    v8[4] = 1;
    v8[8] = 0;
    do
    {
      if (!*((_BYTE *)v5 + v6)) {
        break;
      }
      *((_WORD *)&v8[11] + v6) = *((char *)v5 + v6);
      ++v6;
    }

    while (v6 != 2047);
    *((_WORD *)&v8[11] + v6) = 0;
    v8[7] = v6;
    if (a2 && *a2 && *((_DWORD *)*a2 + 231))
    {
      sub_7454((uint64_t)&v7, "Table is finalized");
      return 0LL;
    }

    else
    {
      return sub_7C10((uint64_t)&v7, a2, a3, 0LL);
    }
  }

  return result;
}

void **_lou_compileTranslationRule(char *a1, void **a2)
{
  return sub_72D0(a2, &v4, 0LL);
}

void **_lou_compileDisplayRule(char *a1, void **a2)
{
  return sub_72D0(a2, 0LL, &v4);
}

void sub_7454(uint64_t a1, char *__format, ...)
{
  if (a1) {
    _lou_logMessage(40000LL, "%s:%d: error: %s");
  }
  else {
    _lou_logMessage(40000LL, "error: %s");
  }
  ++dword_262E0;
}

void sub_7510(uint64_t a1, char *__format, ...)
{
  if (a1) {
    _lou_logMessage(30000LL, "%s:%d: warning: %s");
  }
  else {
    _lou_logMessage(30000LL, "warning: %s");
  }
  ++dword_273B8;
}

const char **sub_75CC(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v3 = (const char **)(a1 + 8LL * a2 + 31616);
  uint64_t v4 = *(unsigned int *)(a1 + 8LL * a2 + 31664);
  if ((_DWORD)v4)
  {
    LODWORD(v5) = a3;
    unint64_t v8 = 0LL;
    uint64_t v9 = a1 + 8LL * a2 + 31616;
    do
    {
      if ((int)v5 > 6 || (int v10 = v4, (_DWORD)v4 == a2))
      {
        if (*v3) {
          snprintf((char *)qword_27450, 0x800uLL, "%s:%d", *v3, *((_DWORD *)v3 + 2));
        }
        else {
          strcpy((char *)qword_27450, "source unknown");
        }
        _lou_logMessage( 40000LL,  "%s: error: Character can not be (indirectly) based on itself.",  (const char *)qword_27450);
        uint64_t v3 = 0LL;
        ++dword_262E0;
        return v3;
      }

      uint64_t v5 = (v5 + 1);
      uint64_t v11 = *(void *)(v9 + 32);
      uint64_t v12 = sub_75CC(a1, v4, v5);
      uint64_t v9 = v12;
      uint64_t v13 = v3[4];
      if (((*(void *)(v12 + 32) | *(void *)(v12 + 24)) & (unint64_t)v13) != 0)
      {
        uint64_t v20 = a1 + 8;
        while (1)
        {
          uint64_t v20 = *(void *)v20;
          if (!v20) {
            break;
          }
          if (*(const char **)(v20 + 8) == v13)
          {
            int v21 = _lou_showString(v20 + 18, *(unsigned __int16 *)(v20 + 16), 0);
            int v22 = strdup(v21);
            goto LABEL_19;
          }
        }

        int v22 = 0LL;
LABEL_19:
        if (*v3) {
          snprintf((char *)qword_27450, 0x800uLL, "%s:%d", *v3, *((_DWORD *)v3 + 2));
        }
        else {
          strcpy((char *)qword_27450, "source unknown");
        }
        size_t v23 = _lou_showString(v9 + 44, 1, 0);
        size_t v24 = "?";
        if (v22) {
          size_t v24 = v22;
        }
        _lou_logMessage( 40000LL,  "%s: error: Base character %s can not have the %s attribute.",  (const char *)qword_27450,  v23,  v24);
        ++dword_262E0;
        free(v22);
        return 0LL;
      }

      v8 |= v11;
      uint64_t v4 = *(unsigned int *)(v12 + 48);
    }

    while ((_DWORD)v4);
    uint64_t v14 = a1 + 8LL * *(unsigned int *)(v12 + 16) + 31616;
    uint64_t v15 = *((unsigned int *)v3 + 4);
    if ((_DWORD)v15)
    {
      uint64_t v16 = a1 + 8 * v15 + 31616;
      int v17 = *(unsigned __int16 *)(a1 + 8 * v15 + 31668);
      if (v17 != *(unsigned __int16 *)(a1 + 8LL * *(unsigned int *)(v12 + 16) + 31668)
        || memcmp( (const void *)(v16 + 2LL * *(__int16 *)(v16 + 50) + 54),  (const void *)(v14 + 2LL * *(__int16 *)(v14 + 50) + 54),  2LL * (__int16)v17))
      {
        uint64_t v18 = *(unsigned int *)(v16 + 44);
        if (v18 < 0x75)
        {
          uint64_t v19 = off_20358[v18];
        }

        else
        {
          uint64_t v19 = byte_25ADE;
          __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", *(_DWORD *)(v16 + 44));
        }

        BOOL v25 = strdup(v19);
        if (*(_DWORD *)(v16 + 12) < *((_DWORD *)v3 + 14))
        {
          unsigned int v26 = *v3;
          int v27 = *((_DWORD *)v3 + 2);
          sub_79BC(*v3, *(char **)v16);
          _lou_logMessage( 10000LL,  "%s:%d: Character already defined (%s). The existing %s rule will take precedence over the new base rule.",  v26,  v27,  (const char *)qword_27450,  v25);
          free(v25);
          *((_DWORD *)v3 + 12) = 0;
          v3[4] = 0LL;
          *uint64_t v3 = *(const char **)v16;
          int v28 = *(_DWORD *)(v16 + 12);
          *((_DWORD *)v3 + 2) = *(_DWORD *)(v16 + 8);
          *((_DWORD *)v3 + 14) = v28;
          goto LABEL_40;
        }

        v29 = *(const char **)v16;
        int v30 = *(_DWORD *)(v16 + 8);
        sub_79BC(v29, (char *)*v3);
        _lou_logMessage( 10000LL,  "%s:%d: A base rule already exists for this character (%s). The existing base rule will take precedence over the new %s rule.",  v29,  v30,  (const char *)qword_27450,  v25);
        free(v25);
        *((_DWORD *)v3 + 4) = 0;
      }
    }

    *((_DWORD *)v3 + 12) = v10;
    unint64_t v31 = (unint64_t)v3[3] | v8;
    if ((v31 & 0x30) != 0) {
      v31 |= 2uLL;
    }
    v3[3] = (const char *)v31;
    v3[4] = (const char *)v8;
    if (*(_WORD *)(v14 + 52) == 1)
    {
      uint64_t v32 = sub_7A50(*(unsigned __int16 *)(v14 + 2LL * *(__int16 *)(v14 + 50) + 54), a1);
      if (v32)
      {
        unint64_t v33 = *(void *)(v32 + 24) | (unint64_t)v3[4];
        *(void *)(v32 + 24) = v33;
        if ((v33 & 0x30) != 0) {
          *(void *)(v32 + 24) = v33 | 2;
        }
      }
    }

    int v34 = *(_DWORD *)(v9 + 52);
    if (v34) {
      *((_DWORD *)v3 + 13) = v34;
    }
    *(_DWORD *)(v9 + 52) = a2;
  }

const char *sub_79BC(const char *result, char *__s2)
{
  if (__s2)
  {
    if (result && !strcmp(result, __s2)) {
      return (const char *)snprintf((char *)qword_27450, 0x800uLL, "line %d");
    }
    else {
      return (const char *)snprintf((char *)qword_27450, 0x800uLL, "%s:%d");
    }
  }

  else
  {
    strcpy((char *)qword_27450, "source unknown");
  }

  return result;
}

uint64_t sub_7A50(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if (!(_DWORD)v4) {
    return 0LL;
  }
  while (1)
  {
    uint64_t result = a2 + 8 * v4 + 31616;
    uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
    if (!(_DWORD)v4) {
      return 0LL;
    }
  }

  return result;
}

BOOL sub_7AA8(const char *a1, void *a2, uint64_t a3)
{
  v13[0] = a1;
  if (a2)
  {
    uint64_t v6 = (uint64_t *)(*a2 + 112LL);
    unsigned int v7 = -1;
    do
    {
      uint64_t v8 = *v6++;
      ++v7;
    }

    while (v8);
    if (v7 < 0x64)
    {
      uint64_t v9 = strdup(a1);
      *(v6 - 1) = (uint64_t)v9;
    }

    else
    {
      _lou_logMessage(30000LL, "Max number of source files (%i) reached", 100);
      uint64_t v9 = 0LL;
    }

    v13[1] = v9;
  }

  int v16 = 0;
  uint64_t v15 = 0LL;
  uint64_t v14 = fopen(a1, "rb");
  if (v14)
  {
    uint64_t v12 = 0LL;
    while (_lou_getALine(v13))
    {
      if (!sub_7C10(v13, a2, a3, &v12))
      {
        if (!dword_262E0) {
          sub_7454((uint64_t)v13, "Rule could not be compiled");
        }
        break;
      }
    }

    fclose(v14);
    sub_AEB4(v12);
    int v10 = dword_262E0;
  }

  else
  {
    _lou_logMessage(40000LL, "Cannot open table '%s'", a1);
    int v10 = ++dword_262E0;
  }

  return v10 == 0;
}

void **sub_7C10(uint64_t a1, void **a2, void **a3, uint64_t *a4)
{
  int v283 = 0;
  int v284 = 0;
  uint64_t v302 = 0LL;
  uint64_t v301 = 0LL;
  char v6 = 1;
  while (2)
  {
    char v7 = v6;
    v282 = a3;
    v286 = (const char **)a1;
    while (1)
    {
      uint64_t v8 = 1LL;
      if (v304[1] == 35 || v304[1] == 60) {
        return (void **)v8;
      }
      a1 = (uint64_t)v286;
      if (*((_DWORD *)v286 + 6) == 1)
      {
        uint64_t v9 = 0LL;
        while (v304[v9 + 1] == aIso[v9])
        {
          if (++v9 == 3)
          {
LABEL_41:
            if (a2)
            {
              sub_B078((uint64_t)v286, (uint64_t)v304, a2);
            }

            else
            {
            }

            return (void **)(&dword_0 + 1);
          }
        }

        uint64_t v10 = 0LL;
        while (v304[v10 + 1] == aUtf8[v10])
        {
          if (++v10 == 5) {
            goto LABEL_41;
          }
        }
      }

      int v11 = sub_B5A0(v304);
      int v12 = v11;
      if (v11 > 115) {
        break;
      }
      switch(v11)
      {
        case '6':
          if (v283)
          {
            int v16 = "nofor";
            goto LABEL_494;
          }

          int v283 = 0;
          int v284 = 1;
          goto LABEL_38;
        case '7':
          if (v284)
          {
            int v16 = "noback";
LABEL_494:
            v279 = (char *)v16;
            v53 = "%s already specified.";
LABEL_103:
            uint64_t v54 = a1;
            goto LABEL_579;
          }

          int v284 = 0;
          int v283 = 1;
LABEL_38:
          uint64_t v15 = (uint64_t)v286;
LABEL_34:
          break;
        case '8':
        case '9':
        case ':':
        case ';':
        case '<':
          goto LABEL_23;
        case '=':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 61;
          uint64_t v51 = 1LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case '>':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 62;
          uint64_t v51 = 4LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case '?':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 63;
          uint64_t v51 = 8LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case '@':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 64;
          uint64_t v51 = 64LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'A':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 65;
          uint64_t v51 = 128LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'B':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 66;
          uint64_t v51 = 2LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'C':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 67;
          uint64_t v51 = 16LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'D':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 68;
          uint64_t v51 = 32LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'E':
          return (void **)sub_B938((uint64_t)v286, v284, v283, (uint64_t *)a2, a3);
        case 'F':
          goto LABEL_55;
        case 'G':
          int v47 = v283;
          int v48 = v284;
          uint64_t v49 = (uint64_t)v286;
          int v50 = 71;
          uint64_t v51 = 256LL;
          return (void **)sub_B778(v49, v50, v51, v48, v47, (uint64_t *)a2, a3);
        case 'H':
          if (!a3) {
            return (void **)(&dword_0 + 1);
          }
          if ((unsigned __int16)v296 == 1 && LOWORD(v305[0]) == 1)
          {
            sub_BD30((uint64_t)v286, WORD1(v296), HIWORD(v305[0]), a3);
            return (void **)(&dword_0 + 1);
          }

          v53 = "Exactly one character and one cell are required.";
          goto LABEL_103;
        default:
          if (v11) {
            goto LABEL_23;
          }
          if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"include file name")
            || !sub_5640((uint64_t)v286, &v296, v304))
          {
            return 0LL;
          }

          return sub_B624(v286, &v296, a2, (uint64_t)a3);
      }
    }

    if (v11 != 117)
    {
      if (v11 == 116)
      {
        v53 = "Macro feature is disabled.";
        goto LABEL_103;
      }

LABEL_23:
      if (!a2) {
        return (void **)(&dword_0 + 1);
      }
      uint64_t v13 = &v302;
      switch(v11)
      {
        case 1:
          sub_7510((uint64_t)v286, "The locale opcode is not implemented. Use the locale meta data instead.");
          return (void **)(&dword_0 + 1);
        case 2:
          LODWORD(v296) = *((_DWORD *)*a2 + 239);
          if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"undefined character opcode",  2,  (unsigned int *)&v296,  v284,  v283,  a2)) {
            return 0LL;
          }
          *((_DWORD *)*a2 + 239) = v296;
          return (void **)(&dword_0 + 1);
        case 3:
        case 4:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
          if ((v11 - 3) > 7)
          {
            uint64_t v19 = (uint64_t)v286;
            uint64_t v45 = *a2;
            if (!*((void *)*a2 + 1))
            {
              uint64_t v45 = *a2;
            }

            v46 = sub_C964(v304, (uint64_t)v45);
            if (!v46)
            {
              v46 = sub_C9C4((uint64_t)v286, &v304[1], v304[0], v45, 1);
              if (!v46) {
                return 0LL;
              }
            }

            unint64_t v18 = v46[1];
            if (v18 > 0x100 || !v18 || v18 == 4)
            {
              uint64_t v20 = a2;
              uint64_t v71 = (uint64_t)*a2 + 1592;
              uint64_t v72 = -5LL;
              v73 = (int *)v71;
              while (1)
              {
                int v74 = *v73;
                v73 += 6;
                if (!v74 || *(void *)(v71 - 8) == v18) {
                  break;
                }
                uint64_t v71 = (uint64_t)v73;
                BOOL v75 = __CFADD__(v72++, 1LL);
                if (v75)
                {
                  v279 = (_BYTE *)(&dword_4 + 2);
                  v53 = "Max number of modes (%i) reached";
                  goto LABEL_151;
                }
              }

              unsigned int v17 = v72 + 6;
            }

            else
            {
              uint64_t v20 = a2;
              if (v18 != 16)
              {
                v53 = "mode must be uppercase, digit, or a custom attribute name.";
                goto LABEL_151;
              }

              unsigned int v17 = 0;
            }
          }

          else
          {
            unsigned int v17 = 0;
            int v12 = v11 + 8;
            unint64_t v18 = 16LL;
            uint64_t v20 = a2;
            uint64_t v19 = (uint64_t)v286;
          }

          int v21 = *v20;
          unsigned int v22 = v17;
          if (!*((_DWORD *)*v20 + 6 * v17 + 392))
          {
            size_t v23 = (char *)&v21[6 * v17];
            *((_WORD *)v23 + 776) = 0;
            *((void *)v23 + 195) = v18;
            *((_DWORD *)v23 + 392) = 1024 << v22;
            *((_WORD *)v23 + 786) = v22 + 10;
          }

          switch(v12)
          {
            case 11:
              LODWORD(v296) = v21[9 * v22 + 585];
              if (v22) {
                int v24 = 11;
              }
              else {
                int v24 = 3;
              }
              if (!sub_BEC8( v19,  (uint64_t)"single letter capital sign",  v24,  (unsigned int *)&v296,  v284,  v283,  v20)) {
                return 0LL;
              }
              *((_DWORD *)*v20 + 9 * v22 + 585) = v296;
              return (void **)(&dword_0 + 1);
            case 12:
              LODWORD(v296) = v21[9 * v22 + 586];
              if (v22) {
                int v80 = 12;
              }
              else {
                int v80 = 4;
              }
              *((_DWORD *)*v20 + 9 * v22 + 586) = v296;
              return (void **)(&dword_0 + 1);
            case 13:
              LODWORD(v296) = v21[9 * v22 + 587];
              if (v22) {
                int v81 = 13;
              }
              else {
                int v81 = 5;
              }
              if (!sub_BEC8( v19,  (uint64_t)"capital word stop",  v81,  (unsigned int *)&v296,  v284,  v283,  v20)) {
                return 0LL;
              }
              *((_DWORD *)*v20 + 9 * v22 + 587) = v296;
              return (void **)(&dword_0 + 1);
            case 14:
              LODWORD(v296) = v21[9 * v22 + 583];
              if (v22) {
                int v82 = 14;
              }
              else {
                int v82 = 6;
              }
              if (!sub_BEC8( v19,  (uint64_t)"first letter capital sign",  v82,  (unsigned int *)&v296,  v284,  v283,  v20)) {
                return 0LL;
              }
              *((_DWORD *)*v20 + 9 * v22 + 583) = v296;
              return (void **)(&dword_0 + 1);
            case 15:
              LODWORD(v296) = v21[9 * v22 + 584];
              if (v22) {
                int v83 = 15;
              }
              else {
                int v83 = 7;
              }
              if (!sub_BEC8( v19,  (uint64_t)"last letter capital sign",  v83,  (unsigned int *)&v296,  v284,  v283,  v20)) {
                return 0LL;
              }
              *((_DWORD *)*v20 + 9 * v22 + 584) = v296;
              return (void **)(&dword_0 + 1);
            case 16:
              LODWORD(v296) = v21[9 * v22 + 580];
              if (v22) {
                int v84 = 16;
              }
              else {
                int v84 = 8;
              }
              if (!sub_BEC8( v19,  (uint64_t)"first word capital sign",  v84,  (unsigned int *)&v296,  v284,  v283,  v20)) {
                return 0LL;
              }
              *((_DWORD *)*v20 + 9 * v22 + 580) = v296;
              return (void **)(&dword_0 + 1);
            case 17:
              int v85 = sub_CB6C(v19);
              if (v85 == 2)
              {
                unsigned int v223 = v22 + 10;
                if (*((_DWORD *)*v20 + 9 * v22 + 581))
                {
                  v53 = "Capital sign before last word already defined.";
                  goto LABEL_151;
                }

                LODWORD(v296) = *((_DWORD *)*v20 + 9 * v223 + 492);
                if (v22) {
                  int v255 = 17;
                }
                else {
                  int v255 = 119;
                }
                if (sub_BEC8( v19,  (uint64_t)"capital sign after last word",  v255,  (unsigned int *)&v296,  v284,  v283,  v20))
                {
                  *((_DWORD *)*v20 + 9 * v223 + 492) = v296;
                  return (void **)(&dword_0 + 1);
                }
              }

              else
              {
                if (v85 != 1)
                {
                  v53 = "Invalid lastword indicator location.";
                  goto LABEL_151;
                }

                unsigned int v86 = v22 + 10;
                if (*((_DWORD *)*v20 + 9 * v22 + 582))
                {
                  v53 = "Capital sign after last word already defined.";
                  goto LABEL_151;
                }

                LODWORD(v296) = *((_DWORD *)*v20 + 9 * v86 + 491);
                if (v22) {
                  int v254 = 17;
                }
                else {
                  int v254 = 118;
                }
                if (sub_BEC8( v19,  (uint64_t)"capital sign before last word",  v254,  (unsigned int *)&v296,  v284,  v283,  v20))
                {
                  *((_DWORD *)*v20 + 9 * v86 + 491) = v296;
                  return (void **)(&dword_0 + 1);
                }
              }

              break;
            case 18:
              uint64_t v8 = sub_CC4C(v19);
              *((_DWORD *)*v20 + 9 * v22 + 588) = v8;
              return (void **)v8;
            default:
              return 0LL;
          }

          return 0LL;
        case 19:
          LODWORD(v296) = *((_DWORD *)*a2 + 240);
          *((_DWORD *)*a2 + 240) = v296;
          return (void **)(&dword_0 + 1);
        case 20:
          v77 = v286;
          v87 = *a2;
          uint64_t v88 = *((int *)*a2 + 669);
          if ((_WORD)v296)
          {
            unint64_t v89 = 0LL;
            do
            {
              v87[v88 + 1274 + v89] = *((_WORD *)&v297[-4] + v89 + 1);
              ++v89;
            }

            while (v89 < (unsigned __int16)v296);
            *((_DWORD *)v87 + 669) = v88 + v89;
          }

          return (void **)(&dword_0 + 1);
        case 21:
          v77 = v286;
          v90 = *a2;
          uint64_t v91 = *((int *)*a2 + 798);
          if ((int)(v91 + (unsigned __int16)v296) > 256)
          {
            uint64_t v92 = 256LL;
            goto LABEL_271;
          }

          if ((_WORD)v296)
          {
            unint64_t v224 = 0LL;
            do
            {
              v90[v91 + 1340 + v224] = *((_WORD *)&v297[-4] + v224 + 1);
              ++v224;
            }

            while (v224 < (unsigned __int16)v296);
            *((_DWORD *)v90 + 798) = v91 + v224;
          }

          return (void **)(&dword_0 + 1);
        case 22:
          v77 = v286;
          v93 = *a2;
          uint64_t v94 = *((int *)*a2 + 831);
          if ((int)(v94 + (unsigned __int16)v296) > 64)
          {
LABEL_202:
            uint64_t v92 = 64LL;
            goto LABEL_271;
          }

          if ((_WORD)v296)
          {
            unint64_t v225 = 0LL;
            do
            {
              v93[v94 + 1598 + v225] = *((_WORD *)&v297[-4] + v225 + 1);
              ++v225;
            }

            while (v225 < (unsigned __int16)v296);
            *((_DWORD *)v93 + 831) = v94 + v225;
          }

          return (void **)(&dword_0 + 1);
        case 23:
          LODWORD(v296) = *((_DWORD *)*a2 + 241);
          *((_DWORD *)*a2 + 241) = v296;
          return (void **)(&dword_0 + 1);
        case 24:
          LODWORD(v296) = *((_DWORD *)*a2 + 243);
          if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"no number sign",  24,  (unsigned int *)&v296,  v284,  v283,  a2)) {
            return 0LL;
          }
          *((_DWORD *)*a2 + 243) = v296;
          return (void **)(&dword_0 + 1);
        case 25:
          unint64_t v95 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v96 = 0LL;
          BOOL v97 = 0;
          v98 = (unsigned int *)*a2;
          while (1)
          {
            v99 = (char *)&v297[-4] + 2 * v96;
            int v102 = *((unsigned __int16 *)v99 + 1);
            uint64_t v100 = (uint64_t)(v99 + 2);
            int v101 = v102;
            uint64_t v103 = v98[_lou_charHash(v102) + 3402];
            if (!(_DWORD)v103) {
              break;
            }
            while (1)
            {
              uint64_t v104 = (uint64_t)&v98[2 * v103 + 7904];
              uint64_t v103 = *(unsigned int *)(v104 + 12);
              if (!(_DWORD)v103) {
                goto LABEL_456;
              }
            }

            *(void *)(v104 + 24) |= 0x800uLL;
            v98 = (unsigned int *)*a2;
            *((_DWORD *)*a2 + 237) = 1;
            BOOL v97 = ++v96 >= v95;
            if (v96 == v95) {
              return (void **)1;
            }
          }

  if (a3 >= 1)
  {
    int v24 = 0LL;
    do
    {
      *(_DWORD *)(a8 + 4 * (v24 + *(int *)(a7 + 20))) = a5 + a4;
      ++v24;
    }

    while (a3 != (_DWORD)v24);
  }

  *(_DWORD *)(a7 + 20) += a3;
  return 1LL;
}

      v55[j] = v23;
    }

    int v28 = 0LL;
    for (uint64_t k = 0xFFFFFFFFLL; ; uint64_t k = 0xFFFFFFFFLL)
    {
      do
      {
        int v30 = v55[v28];
        if (v30 >= 1 && ((k & 0x80000000) != 0 || v30 < v55[k])) {
          uint64_t k = v28;
        }
        ++v28;
      }

      while (v28 != 10);
      if ((k & 0x80000000) != 0) {
        break;
      }
      v55[k] = 0;
      uint64_t result = sub_19DC8(a11, a5, a6 + 24 * k + 1312, a6, a7, a8, a9, a10, a12, a13);
      int v28 = 0LL;
    }
  }

  v52 = a7;
  int v31 = v50;
  if (!v50 || !a4) {
    goto LABEL_65;
  }
  int v32 = 0LL;
  uint64_t v33 = a5 + 1;
  do
  {
    int v34 = a6 + 24 * v32;
    v35 = *(_DWORD *)(v34 + 1328);
    if (!v35)
    {
LABEL_50:
      char v39 = 0;
      goto LABEL_53;
    }

    uint64_t v36 = *(void *)(a11 + 8LL * a5);
    if (((unsigned __int16)*(_DWORD *)(v34 + 1328) & (unsigned __int16)v36) != 0)
    {
      uint64_t v37 = *(_DWORD *)(a8 + 16);
      v38 = 0LL;
      char v39 = v37 - a5;
      uint64_t v40 = ~a5 + v37;
      while ((v35 & WORD1(*(void *)(a11 + 8 * v33 + 8 * v38))) == 0)
      {
        if (v40 == (_DWORD)++v38) {
          goto LABEL_53;
        }
      }

      char v39 = v38 + 1;
    }

    else
    {
      if ((int)v33 >= *(_DWORD *)(a8 + 16))
      {
LABEL_51:
        char v39 = 1;
        goto LABEL_53;
      }

      v41 = (_DWORD *)(v34 + 1328);
      char v39 = 1;
      uint64_t v42 = a5 + 1;
      do
      {
        if ((*v41 & WORD1(*(void *)(a11 + 8 * v42))) != 0) {
          break;
        }
        uint64_t result = (unint64_t)sub_16E60(*(unsigned __int16 *)(*(void *)(a8 + 8) + 2 * v42), a6);
        if ((*(_BYTE *)(result + 25) & 0x20) != 0) {
          break;
        }
        uint64_t result = sub_1966C(*(unsigned __int16 *)(*(void *)(a8 + 8) + 2 * v42), a6, a6 + 24 * v32 + 1312);
        if ((_DWORD)result) {
          break;
        }
        ++v39;
        ++v42;
      }

      while (v42 < *(int *)(a8 + 16));
    }

LABEL_456:
          _lou_showString(v100, 1, 0);
          sub_7454((uint64_t)v286, "Numeric mode character undefined: %s");
          return (void **)v97;
        case 26:
          unint64_t v105 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v106 = 0LL;
          BOOL v97 = 0;
          v107 = (unsigned int *)*a2;
          while (1)
          {
            v108 = (char *)&v297[-4] + 2 * v106;
            int v109 = *((unsigned __int16 *)v108 + 1);
            uint64_t v110 = v107[_lou_charHash(*((_WORD *)v108 + 1)) + 3402];
            if (!(_DWORD)v110) {
              break;
            }
            while (1)
            {
              uint64_t v111 = (uint64_t)&v107[2 * v110 + 7904];
              uint64_t v110 = *(unsigned int *)(v111 + 12);
              if (!(_DWORD)v110) {
                goto LABEL_457;
              }
            }

            *(void *)(v111 + 24) |= 0x4000000uLL;
            v107 = (unsigned int *)*a2;
            *((_DWORD *)*a2 + 237) = 1;
            BOOL v97 = ++v106 >= v105;
            if (v106 == v105) {
              return (void **)1;
            }
          }

LABEL_457:
          sub_7454((uint64_t)v286, "Midendnumeric mode character undefined");
          return (void **)v97;
        case 27:
          unint64_t v112 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v113 = 0LL;
          BOOL v97 = 0;
          v114 = (unsigned int *)*a2;
          while (1)
          {
            v115 = (char *)&v297[-4] + 2 * v113;
            int v116 = *((unsigned __int16 *)v115 + 1);
            uint64_t v117 = v114[_lou_charHash(*((_WORD *)v115 + 1)) + 3402];
            if (!(_DWORD)v117) {
              break;
            }
            while (1)
            {
              uint64_t v118 = (uint64_t)&v114[2 * v117 + 7904];
              uint64_t v117 = *(unsigned int *)(v118 + 12);
              if (!(_DWORD)v117) {
                goto LABEL_458;
              }
            }

            *(void *)(v118 + 24) |= 0x1000uLL;
            v114 = (unsigned int *)*a2;
            *((_DWORD *)*a2 + 237) = 1;
            BOOL v97 = ++v113 >= v112;
            if (v113 == v112) {
              return (void **)1;
            }
          }

LABEL_458:
          sub_7454((uint64_t)v286, "Numeric no contraction character undefined");
          return (void **)v97;
        case 28:
          unint64_t v119 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v120 = 0LL;
          BOOL v97 = 0;
          v121 = (unsigned int *)*a2;
          while (1)
          {
            v122 = (char *)&v297[-4] + 2 * v120;
            int v123 = *((unsigned __int16 *)v122 + 1);
            uint64_t v124 = v121[_lou_charHash(*((_WORD *)v122 + 1)) + 3402];
            if (!(_DWORD)v124) {
              break;
            }
            while (1)
            {
              uint64_t v125 = (uint64_t)&v121[2 * v124 + 7904];
              uint64_t v124 = *(unsigned int *)(v125 + 12);
              if (!(_DWORD)v124) {
                goto LABEL_459;
              }
            }

            *(void *)(v125 + 24) |= 0x2000uLL;
            v121 = (unsigned int *)*a2;
            *((_DWORD *)*a2 + 236) = 1;
            BOOL v97 = ++v120 >= v119;
            if (v120 == v119) {
              return (void **)1;
            }
          }

LABEL_459:
          sub_7454((uint64_t)v286, "Sequence delimiter character undefined");
          return (void **)v97;
        case 29:
          unint64_t v126 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v127 = 0LL;
          BOOL v97 = 0;
          while (1)
          {
            int v128 = *((unsigned __int16 *)&v297[-4] + v127 + 1);
            v129 = (unsigned int *)*a2;
            uint64_t v130 = v129[_lou_charHash(*((_WORD *)&v297[-4] + v127 + 1)) + 3402];
            if (!(_DWORD)v130) {
              break;
            }
            while (1)
            {
              uint64_t v131 = (uint64_t)&v129[2 * v130 + 7904];
              uint64_t v130 = *(unsigned int *)(v131 + 12);
              if (!(_DWORD)v130) {
                goto LABEL_460;
              }
            }

            *(void *)(v131 + 24) |= 0x4000uLL;
            BOOL v97 = ++v127 >= v126;
            if (v127 == v126) {
              return (void **)1;
            }
          }

LABEL_460:
          sub_7454((uint64_t)v286, "Sequence before character undefined");
          return (void **)v97;
        case 30:
          unint64_t v132 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v133 = 0LL;
          BOOL v97 = 0;
          while (1)
          {
            int v134 = *((unsigned __int16 *)&v297[-4] + v133 + 1);
            v135 = (unsigned int *)*a2;
            uint64_t v136 = v135[_lou_charHash(*((_WORD *)&v297[-4] + v133 + 1)) + 3402];
            if (!(_DWORD)v136) {
              break;
            }
            while (1)
            {
              uint64_t v137 = (uint64_t)&v135[2 * v136 + 7904];
              uint64_t v136 = *(unsigned int *)(v137 + 12);
              if (!(_DWORD)v136) {
                goto LABEL_461;
              }
            }

            *(void *)(v137 + 24) |= 0x8000uLL;
            BOOL v97 = ++v133 >= v132;
            if (v133 == v132) {
              return (void **)1;
            }
          }

LABEL_461:
          sub_7454((uint64_t)v286, "Sequence after character undefined");
          return (void **)v97;
        case 31:
          v77 = v286;
          v138 = *a2;
          int v139 = *((_DWORD *)*a2 + 424);
          if ((_WORD)v296)
          {
            unint64_t v140 = 0LL;
            do
            {
              v138[v139 + 488 + v140] = *((_WORD *)&v297[-4] + v140 + 1);
              ++v140;
            }

            while (v140 < (unsigned __int16)v296);
            v139 += v140;
          }

          *((_DWORD *)v138 + 424) = v139 + 1;
          v138[v139 + 488] = 0;
          return (void **)(&dword_0 + 1);
        case 32:
          v77 = v286;
          if ((unsigned __int16)v296 <= 0x7Fu)
          {
            v226 = *a2;
            if ((_WORD)v296)
            {
              unint64_t v227 = 0LL;
              do
              {
                v226[v227 + 850] = *((_WORD *)&v297[-4] + v227 + 1);
                ++v227;
                uint64_t v228 = (unsigned __int16)v296;
              }

              while (v227 < (unsigned __int16)v296);
            }

            else
            {
              uint64_t v228 = 0LL;
            }

            v226[v228 + 850] = 0;
            *((_DWORD *)v226 + 489) = (unsigned __int16)v296;
            return (void **)(&dword_0 + 1);
          }

LABEL_270:
          uint64_t v92 = 128LL;
LABEL_271:
          v279 = (char *)v92;
          v53 = "More than %d characters";
          goto LABEL_465;
        case 33:
          v77 = v286;
          if (!sub_AF0C((uint64_t)v286, v305, (uint64_t)"emphasis class"))
          {
            v53 = "emphclass must be followed by a valid class name.";
            goto LABEL_465;
          }

          uint64_t v141 = LOWORD(v305[0]);
          v142 = (char *)malloc(LOWORD(v305[0]) + 1LL);
          v143 = v142;
          if (v141)
          {
            v144 = (char *)v305 + 2;
            uint64_t v145 = v141;
            v146 = v142;
            v147 = a2;
            do
            {
              char v148 = *v144;
              v144 += 2;
              *v146++ = v148;
              --v145;
            }

            while (v145);
          }

          else
          {
            v147 = a2;
          }

          uint64_t v233 = 0LL;
          uint64_t v234 = 0LL;
          v142[v141] = 0;
          v235 = *v147;
          uint64_t v236 = (uint64_t)*v147 + 1232;
          while (2)
          {
            v237 = *(const char **)(v236 + 8 * v234);
            if (v237)
            {
              if (strcmp(v143, v237))
              {
                ++v234;
                v233 += 24LL;
                if (v233 == 240) {
                  goto LABEL_490;
                }
                continue;
              }

              _lou_logMessage(10000LL, "Duplicate emphasis class: %s", v143);
              free(v143);
              return (void **)(&dword_0 + 1);
            }

            break;
          }

          if ((int)v234 > 1)
          {
            if ((_DWORD)v234 == 2)
            {
              if (strcmp(v143, "bold"))
              {
                _lou_logMessage(40000LL, "Third emphasis class must be bold but got %s");
                goto LABEL_491;
              }
            }

            else if ((_DWORD)v234 == 10)
            {
LABEL_490:
              _lou_logMessage(40000LL, "Max number of emphasis classes (%i) reached");
LABEL_491:
              ++dword_262E0;
              v76 = v143;
              goto LABEL_136;
            }
          }

          else if ((_DWORD)v234)
          {
            if ((_DWORD)v234 == 1 && strcmp(v143, "underline"))
            {
              _lou_logMessage(40000LL, "Second emphasis class must be underline but got %s");
              goto LABEL_491;
            }
          }

          else if (strcmp(v143, "italic"))
          {
            _lou_logMessage(40000LL, "First emphasis class must be italic but got %s");
            goto LABEL_491;
          }

          v235[v234 + 154] = v143;
          v264 = (char *)*v147 + v233;
          uint64_t v8 = 1LL;
          *((_WORD *)v264 + 656) = 1 << v234;
          *((void *)v264 + 165) = 0LL;
          *((_DWORD *)v264 + 332) = 1 << v234;
          *((_WORD *)v264 + 666) = v234;
          return (void **)v8;
        case 34:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
        case 40:
        case 41:
        case 43:
        case 44:
          if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"emphasis class")
            || !sub_5640((uint64_t)v286, v305, v304))
          {
            return 0LL;
          }

          uint64_t v33 = LOWORD(v305[0]);
          int v34 = malloc(LOWORD(v305[0]) + 1LL);
          v35 = v34;
          if (v33)
          {
            uint64_t v36 = (char *)v305 + 2;
            uint64_t v37 = v33;
            v38 = v34;
            do
            {
              char v39 = *v36;
              v36 += 2;
              *v38++ = v39;
              --v37;
            }

            while (v37);
          }

          uint64_t v40 = 0LL;
          v34[v33] = 0;
          v41 = *a2;
          uint64_t v42 = 3328LL;
          uint64_t v43 = 8468LL;
          while (1)
          {
            uint64_t v44 = (const char *)v41[v40 + 154];
            ++v40;
            v42 += 514LL;
            v43 += 514LL;
            if (v40 == 10) {
              goto LABEL_135;
            }
          }

          if (!v41[v40 + 154])
          {
LABEL_135:
            _lou_logMessage(40000LL, "Emphasis class %s not declared", (const char *)v35);
            ++dword_262E0;
            v76 = (char *)v35;
LABEL_136:
            free(v76);
            return 0LL;
          }

          uint64_t v8 = 0LL;
          switch(v12)
          {
            case '""':
              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 495);
              if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"single letter",  34,  (unsigned int *)&v296,  v284,  v283,  a2)) {
                goto LABEL_589;
              }
              *((_DWORD *)*a2 + 9 * v40 + 495) = v296;
              goto LABEL_525;
            case '#':
              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 496);
              *((_DWORD *)*a2 + 9 * v40 + 496) = v296;
              goto LABEL_525;
            case '$':
              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 497);
              if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"word stop",  36,  (unsigned int *)&v296,  v284,  v283,  a2)) {
                goto LABEL_589;
              }
              *((_DWORD *)*a2 + 9 * v40 + 497) = v296;
              goto LABEL_525;
            case '%':
              if (*((_DWORD *)v41 + 9 * v40 + 496) || *((_DWORD *)v41 + 9 * v40 + 490))
              {
                v244 = "Cannot define emphasis for both no context and word or phrase context, i.e. cannot have both bege"
                       "mph and begemphword or begemphphrase.";
                goto LABEL_522;
              }

              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 493);
              if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"first letter",  37,  (unsigned int *)&v296,  v284,  v283,  a2)) {
                goto LABEL_589;
              }
              *((_DWORD *)*a2 + 9 * v40 + 493) = v296;
              goto LABEL_525;
            case '&':
              if (*((_DWORD *)v41 + 9 * v40 + 497)
                || *((_DWORD *)v41 + 9 * v40 + 491)
                || *((_DWORD *)v41 + 9 * v40 + 492))
              {
                v244 = "Cannot define emphasis for both no context and word or phrase context, i.e. cannot have both ende"
                       "mph and endemphword or endemphphrase.";
                goto LABEL_522;
              }

              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 494);
              if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"last letter",  38,  (unsigned int *)&v296,  v284,  v283,  a2)) {
                goto LABEL_589;
              }
              *((_DWORD *)*a2 + 9 * v40 + 494) = v296;
              goto LABEL_525;
            case '\'':
              LODWORD(v296) = *((_DWORD *)v41 + 9 * v40 + 490);
              if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"first word",  39,  (unsigned int *)&v296,  v284,  v283,  a2)) {
                goto LABEL_589;
              }
              *((_DWORD *)*a2 + 9 * v40 + 490) = v296;
              goto LABEL_525;
            case '(':
              v246 = v286;
              int v247 = sub_CB6C((uint64_t)v286);
              if (v247 == 2)
              {
                if (*((_DWORD *)*a2 + 9 * v40 + 491))
                {
                  v244 = "last word before already defined.";
                  goto LABEL_587;
                }

                LODWORD(v296) = *((_DWORD *)*a2 + 9 * v40 + 492);
                if (sub_BEC8( (uint64_t)v286,  (uint64_t)"last word after",  40,  (unsigned int *)&v296,  v284,  v283,  a2))
                {
                  *((_DWORD *)*a2 + 9 * v40 + 492) = v296;
                  goto LABEL_525;
                }
              }

              else
              {
                if (v247 != 1)
                {
                  v244 = "Invalid lastword indicator location.";
                  goto LABEL_587;
                }

                if (*((_DWORD *)*a2 + 9 * v40 + 492))
                {
                  v244 = "last word after already defined.";
                  goto LABEL_587;
                }

                LODWORD(v296) = *((_DWORD *)*a2 + 9 * v40 + 491);
                if (sub_BEC8( (uint64_t)v286,  (uint64_t)"last word before",  40,  (unsigned int *)&v296,  v284,  v283,  a2))
                {
                  *((_DWORD *)*a2 + 9 * v40 + 491) = v296;
                  goto LABEL_525;
                }
              }

              goto LABEL_589;
            case ')':
              int v248 = sub_CC4C((uint64_t)v286);
              *((_DWORD *)*a2 + 9 * v40 + 498) = v248;
              uint64_t v8 = v248 != 0;
              goto LABEL_590;
            case '+':
              v246 = v286;
              for (uint64_t i = 0LL; i != 256; ++i)
              {
              }

              if (!(_WORD)v296) {
                goto LABEL_525;
              }
              unint64_t v250 = 0LL;
              v251 = (char *)*a2 + 2 * i + v42;
              uint64_t v8 = 1LL;
              break;
            case ',':
              v246 = v286;
              for (uint64_t j = 0LL; j != 256; ++j)
              {
              }

              if (j + (unsigned __int16)v296 > 0x100)
              {
LABEL_546:
                v279 = (_BYTE *)(&stru_B8 + 72);
                v244 = "More than %d characters";
LABEL_587:
                uint64_t v245 = (uint64_t)v246;
                goto LABEL_588;
              }

              if (!(_WORD)v296) {
                goto LABEL_525;
              }
              unint64_t v260 = 0LL;
              v261 = (char *)*a2 + 2 * j + v43;
              uint64_t v8 = 1LL;
              while (1)
              {
                unsigned __int16 v262 = *((_WORD *)&v297[-4] + v260 + 1);
                *(_WORD *)&v261[2 * v260++] = v262;
              }

              v244 = "Character undefined";
              goto LABEL_522;
            default:
              goto LABEL_590;
          }

          while (1)
          {
            unsigned __int16 v252 = *((_WORD *)&v297[-4] + v250 + 1);
            *(_WORD *)&v251[2 * v250++] = v252;
          }

          v244 = "Emphasis mode character undefined";
LABEL_522:
          uint64_t v245 = (uint64_t)v286;
LABEL_588:
          sub_7454(v245, v244, v279);
LABEL_589:
          uint64_t v8 = 0LL;
LABEL_590:
          v221 = (unsigned __int16 *)v35;
LABEL_591:
          free(v221);
          return (void **)v8;
        case 42:
          unint64_t v149 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)1;
          }
          uint64_t v150 = 0LL;
          BOOL v97 = 0;
          v151 = (unsigned int *)*a2;
          while (1)
          {
            v152 = (char *)&v297[-4] + 2 * v150;
            int v153 = *((unsigned __int16 *)v152 + 1);
            uint64_t v154 = v151[_lou_charHash(*((_WORD *)v152 + 1)) + 3402];
            if (!(_DWORD)v154) {
              break;
            }
            while (1)
            {
              uint64_t v155 = (uint64_t)&v151[2 * v154 + 7904];
              uint64_t v154 = *(unsigned int *)(v155 + 12);
              if (!(_DWORD)v154) {
                goto LABEL_462;
              }
            }

            *(void *)(v155 + 24) |= 0x200uLL;
            v151 = (unsigned int *)*a2;
            *((_DWORD *)*a2 + 238) = 1;
            BOOL v97 = ++v150 >= v149;
            if (v150 == v149) {
              return (void **)1;
            }
          }

LABEL_462:
          sub_7454((uint64_t)v286, "Capital mode character undefined");
          return (void **)v97;
        case 45:
          LODWORD(v296) = *((_DWORD *)*a2 + 634);
          if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"begin computer braille",  45,  (unsigned int *)&v296,  v284,  v283,  a2)) {
            return 0LL;
          }
          *((_DWORD *)*a2 + 634) = v296;
          return (void **)(&dword_0 + 1);
        case 46:
          LODWORD(v296) = *((_DWORD *)*a2 + 635);
          if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"end computer braslle",  46,  (unsigned int *)&v296,  v284,  v283,  a2)) {
            return 0LL;
          }
          *((_DWORD *)*a2 + 635) = v296;
          return (void **)(&dword_0 + 1);
        case 47:
          LODWORD(v296) = *((_DWORD *)*a2 + 242);
          if (!sub_BEC8( (uint64_t)v286,  (uint64_t)"no contractions sign",  47,  (unsigned int *)&v296,  v284,  v283,  a2)) {
            return 0LL;
          }
          *((_DWORD *)*a2 + 242) = v296;
          return (void **)(&dword_0 + 1);
        case 48:
          LOWORD(v296) = 0;
          v156 = v286;
          if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"multiple braille indicators")
            || !sub_5AE0((uint64_t)v286, v305, v304))
          {
            return 0LL;
          }

          while (2)
          {
            if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"multind opcodes")) {
              return (void **)sub_BFF4( (uint64_t)v286,  48,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  a2);
            }
            int v157 = sub_B5A0(v304);
            if (v157 == 117)
            {
              v279 = _lou_showString((uint64_t)&v304[1], v304[0], 0);
              v53 = "opcode %s not defined.";
            }

            else
            {
              if ((v157 - 3) < 0x2D)
              {
                uint64_t v158 = (unsigned __int16)v296;
                LOWORD(v296) = v296 + 1;
                *((_WORD *)&v297[-4] + v158 + 1) = v157;
                if (*((_DWORD *)v286 + 10) >= *((_DWORD *)v286 + 9)) {
                  return (void **)sub_BFF4( (uint64_t)v286,  48,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  a2);
                }
                continue;
              }

              v53 = "Not a braille indicator opcode.";
            }

            break;
          }

LABEL_583:
          uint64_t v54 = (uint64_t)v156;
          goto LABEL_579;
        case 49:
        case 50:
          if ((unsigned __int16)v296 == 1)
          {
            if (v283 | v284) {
              sub_7510((uint64_t)v286, "nofor and noback not allowed on comp6 rules");
            }
            if (sub_BCA0((uint64_t)v286, v305)) {
              return (void **)sub_BFF4( (uint64_t)v286,  v12,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  v303,  0LL,  v284,  v283,  a2);
            }
          }

          else
          {
            sub_7454((uint64_t)v286, "first operand must be 1 character");
          }

          return 0LL;
        case 51:
          sub_7510((uint64_t)v286, "class is deprecated, use attribute instead");
          goto LABEL_300;
        case 52:
          goto LABEL_26;
        case 53:
          uint64_t v13 = &v301;
LABEL_26:
          if (!*((void *)*a2 + 1) && !sub_C848((uint64_t)*a2)
            || !sub_AF0C((uint64_t)v286, v304, (uint64_t)"attribute name"))
          {
            return 0LL;
          }

          uint64_t v14 = sub_C964(v304, (uint64_t)*a2);
          if (!v14)
          {
            v53 = "attribute not defined";
            goto LABEL_578;
          }

          *v13 |= (unint64_t)v14[1];
LABEL_33:
          uint64_t v15 = (uint64_t)v286;
          goto LABEL_34;
        case 56:
          v301 |= 0x2000000uLL;
          goto LABEL_33;
        case 57:
          v302 |= 0x2000000uLL;
          goto LABEL_33;
        case 58:
        case 59:
        case 60:
          return (void **)sub_E194((uint64_t)v286, v11, v284, v283, a2);
        case 73:
          if (sub_BC34((uint64_t)v286, &v296))
          {
            if (*((_DWORD *)v286 + 10) >= *((_DWORD *)v286 + 9)
              || (sub_BF88((uint64_t)v286, v305), HIWORD(v305[0]) == 35))
            {
              v305[0] = 0;
            }

            else if (HIWORD(v305[0]) == 92 && LOWORD(v305[1]) == 35)
            {
              uint64_t v243 = LOWORD(v305[0]);
              --LOWORD(v305[0]);
              __memmove_chk((char *)v305 + 2, &v305[1], 2 * v243, 4096LL);
            }
          }

          if ((_WORD)v296)
          {
            unint64_t v161 = 1LL;
            do
            {
              sub_CD64( (uint64_t)v286,  *((unsigned __int16 *)&v297[-4] + v161),  (uint64_t *)a2,  0LL,  *((_DWORD *)*a2 + 230));
              BOOL v75 = v161++ >= (unsigned __int16)v296;
            }

            while (!v75);
          }

          if (LOWORD(v305[0]))
          {
            unint64_t v162 = 1LL;
            do
            {
              sub_CD64((uint64_t)v286, *((unsigned __int16 *)v305 + v162), (uint64_t *)a2, 0LL, *((_DWORD *)*a2 + 230));
              BOOL v75 = v162++ >= LOWORD(v305[0]);
            }

            while (!v75);
          }

          return (void **)sub_BFF4( (uint64_t)v286,  73,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  a2);
        case 74:
          goto LABEL_328;
        case 75:
          *((_DWORD *)*a2 + 234) = 1;
          goto LABEL_328;
        case 76:
          v163 = *a2;
          int v164 = 2;
          goto LABEL_327;
        case 77:
          v163 = *a2;
          int v164 = 3;
          goto LABEL_327;
        case 78:
          v163 = *a2;
          int v164 = 4;
LABEL_327:
          v163[233] = v164;
LABEL_328:
          if (v283 | v284) {
            return (void **)sub_CE70((uint64_t)v286, v11, v284, v283, (uint64_t *)a2);
          }
          v279 = "nofor";
          v280 = "noback";
          v53 = "%s or %s must be specified.";
          goto LABEL_578;
        case 79:
        case 80:
        case 83:
        case 90:
        case 91:
        case 92:
        case 93:
        case 94:
        case 95:
        case 97:
        case 98:
        case 99:
        case 100:
        case 101:
        case 102:
        case 103:
        case 104:
        case 105:
        case 106:
        case 107:
        case 108:
          goto LABEL_347;
        case 81:
          uint64_t v165 = v289[0];
          int v166 = v289[0] - 2;
          if (v289[0] < 2u) {
            return 0LL;
          }
          uint64_t v167 = 0LL;
          uint64_t v168 = 0LL;
          uint64_t v169 = v289[0] - 1;
          while (v289[v168 + 1] != 44)
          {
            uint64_t v8 = 0LL;
            ++v168;
            ++v167;
            if (v169 == v168) {
              return (void **)v8;
            }
          }

          v289[0] = v168;
          uint64_t v256 = LOWORD(v305[0]);
          ++LOWORD(v305[0]);
          *((_WORD *)v305 + v256 + 1) = 44;
          if (v166 == (_DWORD)v168 && v289[v169 + 1] == 61)
          {
            uint64_t v257 = (unsigned __int16)v296;
            v258 = a2;
            if ((_WORD)v296)
            {
              for (uint64_t k = (unsigned __int16 *)&v296 + 1; ; ++k)
              {
                uint64_t v259 = sub_CCF8(*k, (uint64_t)*a2, 0LL);
                if (!v259 || !*(_DWORD *)(v259 + 16) && !*(_DWORD *)(v259 + 48)) {
                  break;
                }
                if (!--v257) {
                  return (void **)sub_BFF4( (uint64_t)v286,  81,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  v258);
                }
              }

LABEL_577:
              v279 = _lou_showString((uint64_t)k, 1, 0);
              v53 = "Character %s is not defined";
              goto LABEL_578;
            }
          }

          else
          {
            if ((int)v168 + 1 >= v165)
            {
              __int16 v263 = 0;
            }

            else
            {
              __int16 v263 = ~(_WORD)v168 + v165;
              memcpy((char *)v303 + 2, &v289[v167 + 2], ((2 * v165 - v167 * 2 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
            }

            LOWORD(v303[0]) = v263;
            if (sub_5AE0((uint64_t)v286, &v292, v303))
            {
              uint64_t v265 = v292;
              int v266 = LOWORD(v305[0]);
              if (v292)
              {
                v267 = v293;
                do
                {
                  __int16 v268 = *v267++;
                  __int16 v269 = v266 + 1;
                  *((_WORD *)v305 + (unsigned __int16)v266++ + 1) = v268;
                  --v265;
                }

                while (v265);
              }

              else
              {
                __int16 v269 = v305[0];
              }

              LOWORD(v305[0]) = v269;
            }

            v258 = a2;
          }

          return (void **)sub_BFF4( (uint64_t)v286,  81,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  v258);
        case 82:
          LODWORD(v296) = 6356993;
          *((_DWORD *)*a2 + 232) = v305[0];
          return (void **)(&dword_0 + 1);
        case 84:
          v156 = v286;
          if (WORD1(v296) != 64)
          {
            v53 = "The operand must begin with an at sign (@)";
            goto LABEL_583;
          }

          __int16 v170 = v296;
          if ((unsigned __int16)v296 >= 2uLL) {
            memcpy( (char *)v303 + 2,  (char *)&v296 + 4,  ((2LL * (unsigned __int16)v296 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
          }
          LOWORD(v303[0]) = v170 - 1;
          if (sub_5AE0((uint64_t)v286, v305, v303)) {
            return (void **)sub_BFF4( (uint64_t)v286,  84,  (__int16 *)&v296,  (__int16 *)v305,  v301,  v302,  0LL,  0LL,  v284,  v283,  a2);
          }
          return 0LL;
        case 85:
          char v6 = 0;
          a1 = (uint64_t)v286;
          if ((v7 & 1) != 0) {
            continue;
          }
          int v16 = "nocross";
          goto LABEL_494;
        case 86:
          *((_DWORD *)*a2 + 235) = 1;
LABEL_347:
          uint64_t v171 = (uint64_t)v286;
          if (LOWORD(v305[0])) {
            goto LABEL_350;
          }
          uint64_t v173 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            goto LABEL_350;
          }
          uint64_t v174 = 0LL;
          while (1)
          {
            v175 = (char *)&v297[-4] + 2 * v174;
            int v177 = *((unsigned __int16 *)v175 + 1);
            uint64_t k = (unsigned __int16 *)(v175 + 2);
            int v176 = v177;
            v178 = (unsigned int *)*a2;
            uint64_t v179 = v178[_lou_charHash(v177) + 3402];
            if (!(_DWORD)v179) {
              goto LABEL_577;
            }
            while (1)
            {
              uint64_t v180 = (uint64_t)&v178[2 * v179 + 7904];
              uint64_t v179 = *(unsigned int *)(v180 + 12);
              if (!(_DWORD)v179) {
                goto LABEL_577;
              }
            }

            if (!*(_DWORD *)(v180 + 16) && !*(_DWORD *)(v180 + 48)) {
              goto LABEL_577;
            }
            ++v174;
            uint64_t v171 = (uint64_t)v286;
            if (v174 == v173)
            {
LABEL_350:
              int v172 = sub_BFF4(v171, v12, (__int16 *)&v296, (__int16 *)v305, v302, v301, 0LL, &v290, v284, v283, a2);
              uint64_t v8 = v172 != 0;
              if (!((v172 == 0) | v7 & 1))
              {
                uint64_t v8 = 1LL;
                *(_BYTE *)(v290 + 48) = 1;
              }

              return (void **)v8;
            }
          }

        case 87:
        case 88:
        case 89:
        case 96:
          uint64_t v61 = (unsigned __int16)v296;
          if (!(_WORD)v296) {
            return (void **)sub_BFF4((uint64_t)v286, v12, (__int16 *)&v296, 0LL, v302, v301, 0LL, 0LL, v284, v283, a2);
          }
          uint64_t v62 = 0LL;
          while (1)
          {
            v63 = (char *)&v297[-4] + 2 * v62;
            int v66 = *((unsigned __int16 *)v63 + 1);
            uint64_t k = (unsigned __int16 *)(v63 + 2);
            int v65 = v66;
            v67 = (unsigned int *)*a2;
            uint64_t v68 = v67[_lou_charHash(v66) + 3402];
            if (!(_DWORD)v68) {
              goto LABEL_577;
            }
            while (1)
            {
              uint64_t v69 = (uint64_t)&v67[2 * v68 + 7904];
              uint64_t v68 = *(unsigned int *)(v69 + 12);
              if (!(_DWORD)v68) {
                goto LABEL_577;
              }
            }

            if (!*(_DWORD *)(v69 + 16) && !*(_DWORD *)(v69 + 48)) {
              goto LABEL_577;
            }
            if (++v62 == v61) {
              return (void **)sub_BFF4((uint64_t)v286, v12, (__int16 *)&v296, 0LL, v302, v301, 0LL, 0LL, v284, v283, a2);
            }
          }

        case 109:
        case 110:
          v77 = v286;
          if ((unsigned __int16)v296 == 1 && LOWORD(v305[0])) {
            return (void **)sub_BFF4( (uint64_t)v286,  v12,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  0LL,  0LL,  v284,  v283,  a2);
          }
          v53 = "One Unicode character and at least one cell are required.";
LABEL_465:
          uint64_t v54 = (uint64_t)v77;
          goto LABEL_579;
        case 112:
          v181 = (unsigned __int16 *)malloc(0xD890uLL);
          v182 = v181;
          if (!v181) {
            _lou_outOfMemory();
          }
          memset(v181, 255, 0xD890uLL);
          sub_BF88((uint64_t)v286, v303);
          sub_BC34((uint64_t)v286, &v296);
          sub_BF88((uint64_t)v286, &v292);
          sub_BCA0((uint64_t)v286, v305);
          if (!sub_BFF4( (uint64_t)v286,  112,  (__int16 *)&v296,  (__int16 *)v305,  v302,  v301,  &v294,  &v295,  1,  v283,  a2)) {
            goto LABEL_438;
          }
          BOOL v183 = LOWORD(v303[0]) == 1 && HIWORD(v303[0]) == 45;
          int v184 = v183 ? 0 : LOWORD(v303[0]);
          int v185 = _lou_pattern_compile((uint64_t)v303 + 2, v184, v182 + 1, 13841LL, (uint64_t)*a2, (uint64_t)v286);
          if (v185
            && ((v186 = v185 + 1, unsigned __int16 *v182 = v185 + 1, _lou_pattern_reverse((uint64_t)(v182 + 1)), v292 == 1)
              ? (BOOL v187 = v293[0] == 45)
              : (BOOL v187 = 0),
                !v187 ? (int v188 = v292) : (int v188 = 0),
                (int v189 = _lou_pattern_compile((uint64_t)v293, v188, &v182[v186], 13841LL, (uint64_t)*a2, (uint64_t)v286)) != 0))
          {
            int v190 = v189 + v186;
            size_t v191 = 2LL * v190;
            sub_C760((uint64_t)v286, &v291, 2 * v190, a2);
            uint64_t v192 = (uint64_t)*a2 + 31616;
            uint64_t v295 = v192 + 8LL * v294;
            memcpy((void *)(v192 + 8LL * v291), v182, v191);
            *(_DWORD *)(v295 + 40) = v291;
            uint64_t v8 = 1LL;
          }

          else
          {
LABEL_438:
            uint64_t v8 = 0LL;
          }

          v221 = v182;
          goto LABEL_591;
        case 113:
          v193 = malloc(0xD890uLL);
          v35 = v193;
          if (!v193) {
            _lou_outOfMemory();
          }
          memset(v193, 255, 0xD890uLL);
          sub_BF88((uint64_t)v286, v303);
          sub_BC34((uint64_t)v286, &v296);
          sub_BF88((uint64_t)v286, &v292);
          sub_BCA0((uint64_t)v286, v305);
          if (!sub_BFF4( (uint64_t)v286,  113,  (__int16 *)&v296,  (__int16 *)v305,  0LL,  0LL,  &v294,  &v295,  v284,  1,  a2)) {
            goto LABEL_589;
          }
          BOOL v194 = LOWORD(v303[0]) == 1 && HIWORD(v303[0]) == 45;
          int v195 = v194 ? 0 : LOWORD(v303[0]);
          int v196 = _lou_pattern_compile( (uint64_t)v303 + 2,  v195,  (unsigned __int16 *)v35 + 1,  13841LL,  (uint64_t)*a2,  (uint64_t)v286);
          if (!v196) {
            goto LABEL_589;
          }
          unsigned __int16 v197 = v196 + 1;
          *(_WORD *)v35 = v196 + 1;
          _lou_pattern_reverse((uint64_t)v35 + 2);
          BOOL v198 = v292 == 1 && v293[0] == 45;
          int v199 = v198 ? 0 : v292;
          int v200 = _lou_pattern_compile( (uint64_t)v293,  v199,  (unsigned __int16 *)v35 + v197,  13841LL,  (uint64_t)*a2,  (uint64_t)v286);
          if (!v200) {
            goto LABEL_589;
          }
          int v201 = v200 + v197;
          size_t v202 = 2LL * v201;
          sub_C760((uint64_t)v286, &v291, 2 * v201, a2);
          uint64_t v203 = (uint64_t)*a2 + 31616;
          uint64_t v295 = v203 + 8LL * v294;
          memcpy((void *)(v203 + 8LL * v291), v35, v202);
          *(_DWORD *)(v295 + 40) = v291;
LABEL_525:
          uint64_t v8 = 1LL;
          goto LABEL_590;
        case 114:
LABEL_300:
          a1 = (uint64_t)v286;
          if (v283 | v284) {
            sub_7510((uint64_t)v286, "nofor and noback not allowed before class/attribute");
          }
          if (v12 == 51)
          {
            v159 = *a2;
            if (*((_DWORD *)*a2 + 26) != 1)
            {
              int v160 = 2;
              goto LABEL_441;
            }
          }

          else
          {
            v159 = *a2;
            if (v12 != 114 || v159[26] != 2)
            {
              int v160 = 1;
LABEL_441:
              v159[26] = v160;
              if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"attribute name"))
              {
                v279 = "attribute name";
                v53 = "Expected %s";
                goto LABEL_103;
              }

              unsigned int v222 = v304[1] - 48;
              if (v222 >= 0xA) {
                unsigned int v222 = -1;
              }
              if ((v222 & 0x80000000) != 0)
              {
                v229 = *a2;
                v230 = sub_C964(v304, (uint64_t)*a2);
                if (!v230)
                {
                  v230 = sub_C9C4((uint64_t)v286, &v304[1], v304[0], v229, 1);
                  if (!v230) {
                    return 0LL;
                  }
                }

                unint64_t v231 = v230[1];
                v232 = (uint64_t *)a2;
                if (v231 == 32 || v231 == 16) {
                  v231 |= 2uLL;
                }
              }

              else
              {
                if (v12 == 51)
                {
                  v53 = "Invalid class name: may not contain digits, use attribute instead of class";
                  goto LABEL_103;
                }

                if (v222 > 7 || v304[0] >= 2u)
                {
                  v53 = "Invalid attribute name: must be a digit between 0 and 7 or a word containing only letters";
                  goto LABEL_103;
                }

                v232 = (uint64_t *)a2;
                v239 = *a2;
                uint64_t v240 = (uint64_t)*a2 + 8 * v222;
                unint64_t v242 = *(void *)(v240 + 40);
                v241 = (unint64_t *)(v240 + 40);
                unint64_t v231 = v242;
                if (!v242)
                {
                  unint64_t v231 = v239[3];
                  if (v231 <= 0x800000) {
                    v239[3] = 2 * v231;
                  }
                  else {
                    unint64_t v231 = 0LL;
                  }
                  unint64_t *v241 = v231;
                  v232 = (uint64_t *)a2;
                  a1 = (uint64_t)v286;
                }
              }

              uint64_t v270 = (unsigned __int16)v296;
              if ((_WORD)v296)
              {
                v271 = (unsigned __int16 *)&v296 + 1;
                do
                {
                  int v272 = *v271++;
                  uint64_t v273 = sub_CD64(a1, v272, v232, 0LL, *(_DWORD *)(*v232 + 920));
                  *(void *)(v273 + 24) |= v231;
                  uint64_t v274 = *(unsigned int *)(v273 + 48);
                  if ((_DWORD)v274) {
                    uint64_t v273 = *v232 + 8 * v274 + 31616;
                  }
                  uint64_t v275 = *(unsigned int *)(v273 + 16);
                  if ((_DWORD)v275)
                  {
                    uint64_t v276 = *v232 + 8 * v275 + 31616;
                    if (*(_WORD *)(v276 + 52) == 1)
                    {
                      uint64_t v277 = sub_7A50(*(unsigned __int16 *)(v276 + 2LL * *(__int16 *)(v276 + 50) + 54), *v232);
                      if (v277) {
                        *(void *)(v277 + 24) |= v231;
                      }
                    }
                  }

                  --v270;
                }

                while (v270);
              }

              v278 = (_DWORD *)*v232;
LABEL_626:
              ++v278[230];
              return (void **)(&dword_0 + 1);
            }
          }

          v53 = "attribute and class rules must not be both present in a table";
          goto LABEL_103;
        case 115:
          uint64_t v19 = (uint64_t)v286;
          if (v283 | v284) {
            sub_7510((uint64_t)v286, "nofor and noback not allowed before base");
          }
          if (!sub_AF0C((uint64_t)v286, v304, (uint64_t)"attribute name"))
          {
            v53 = "base opcode must be followed by a valid attribute name.";
            goto LABEL_151;
          }

          v204 = *a2;
          if (!*((void *)*a2 + 1))
          {
            v204 = *a2;
          }

          v205 = sub_C964(v304, (uint64_t)v204);
          if (!v205)
          {
            v205 = sub_C9C4((uint64_t)v286, &v304[1], v304[0], v204, 1);
            if (!v205) {
              return 0LL;
            }
          }

          unint64_t v206 = v205[1];
          if ((v206 > 0x10 || ((1LL << v206) & 0x10011) == 0) && v206 <= 0x100)
          {
            v53 = "base opcode must be followed by uppercase, digit, or a custom attribute name.";
            goto LABEL_151;
          }

          if (v304[0] != 1)
          {
            v53 = "Exactly one character followed by one base character is required.";
            goto LABEL_151;
          }

          sub_CD64((uint64_t)v286, v304[1], (uint64_t *)a2, &v288, *((_DWORD *)*a2 + 230));
          if (v304[0] != 1)
          {
            v53 = "Exactly one base character is required.";
            goto LABEL_151;
          }

          sub_CD64((uint64_t)v286, v304[1], (uint64_t *)a2, &v287, *((_DWORD *)*a2 + 230));
          uint64_t v207 = (uint64_t)*a2 + 8 * v288 + 31616;
          int v208 = *((_DWORD *)*a2 + 2 * v288 + 7916);
          if (v208)
          {
            if (v208 == v287 && *((void *)*a2 + v288 + 3956) == v205[1])
            {
              _lou_logMessage(10000LL, "%s:%d: Duplicate base rule.");
            }

            else
            {
              sub_79BC(v286[1], *(char **)v207);
              _lou_logMessage( 10000LL,  "%s:%d: A different base rule already exists for this character (%s). The existing rule will take precede nce over the new one.");
            }
          }

          else
          {
            *((_DWORD *)*a2 + 2 * v288 + 7916) = v287;
            *(void *)(v207 + 32) = v205[1];
            *(void *)uint64_t v207 = v286[1];
            *(_DWORD *)(v207 + 8) = *((_DWORD *)v286 + 6);
            *(_DWORD *)(v207 + 56) = *((_DWORD *)*a2 + 230);
          }

          v278 = *a2;
          goto LABEL_626;
        default:
          v53 = "unimplemented opcode.";
          goto LABEL_578;
      }
    }

    break;
  }

LABEL_55:
  if (!a4 || (uint64_t v25 = *a4) == 0)
  {
LABEL_63:
    if (v12 == 70)
    {
      v53 = "The uplow opcode is deprecated.";
    }

    else
    {
      v279 = _lou_showString((uint64_t)&v304[1], v304[0], 0);
      v53 = "opcode %s not defined.";
    }

LABEL_578:
    uint64_t v54 = (uint64_t)v286;
    goto LABEL_579;
  }

  while (1)
  {
    unsigned int v26 = *(const char ***)v25;
    int v27 = **(const char ***)v25;
    if (strlen(v27) == v304[0]) {
      break;
    }
LABEL_62:
    uint64_t v25 = *(void *)(v25 + 8);
    if (!v25) {
      goto LABEL_63;
    }
  }

  int v28 = &v304[1];
  uint64_t v29 = v304[0];
  if (v304[0])
  {
    do
    {
      int v31 = *(unsigned __int8 *)v27++;
      int v30 = v31;
      int v32 = *v28++;
      if (v32 != v30) {
        goto LABEL_62;
      }
    }

    while (--v29);
  }

  bzero(v297, 0x1028uLL);
  uint64_t v19 = (uint64_t)v286;
  __int128 v296 = *(_OWORD *)v286;
  v297[2] = *((_DWORD *)v286 + 6);
  uint64_t v299 = 0LL;
  uint64_t v298 = 0LL;
  v55 = (char *)*((int *)v26 + 9);
  v56 = (char *)malloc(4098LL * (void)v55);
  v57 = v56;
  if ((int)v55 < 1)
  {
    LODWORD(v58) = 0;
  }

  else
  {
    uint64_t v58 = 0LL;
    v59 = v56;
    do
    {
      int v60 = sub_AF0C((uint64_t)v286, v304, (uint64_t)"macro argument");
      v55 = (char *)*((unsigned int *)v26 + 9);
      if (!v60) {
        break;
      }
      ++v58;
      memcpy(v59, v304, 0x1002uLL);
      v59 += 4098;
    }

    while (v58 < (int)v55);
    uint64_t v19 = (uint64_t)v286;
  }

  if ((int)v58 >= (int)v55)
  {
    int v78 = *((_DWORD *)v26 + 8);
    if (v78 < 1) {
      v79 = (const char *)(v26 + 2);
    }
    else {
      v79 = v26[3];
    }
    int v209 = 0;
    uint64_t v210 = 0LL;
    int v211 = 0;
    for (int m = *(_DWORD *)v79; ; int m = *(_DWORD *)v220)
    {
      int v213 = m - v211;
      if (m > v211)
      {
        uint64_t v214 = 2LL * v211;
        while (1)
        {
          int v215 = *(unsigned __int16 *)&v26[1][v214];
          if (v215 == 10)
          {
            int v209 = 0;
            uint64_t v299 = 0LL;
          }

          else
          {
            if (v209 >= 2048)
            {
              v279 = (_BYTE *)(&stru_7D8 + 40);
              v53 = "Line exceeds %d characters (post macro expansion)";
              goto LABEL_578;
            }

            v216 = (char *)&v297[-4] + 2 * v209++;
            LODWORD(v299) = v209;
            *((_WORD *)v216 + 26) = v215;
          }

          v214 += 2LL;
          if (!--v213)
          {
            int v78 = *((_DWORD *)v26 + 8);
            int v211 = m;
            break;
          }
        }
      }

      if (v210 >= v78) {
        break;
      }
      v217 = v26[3];
      v218 = &v57[4098 * *(int *)&v217[8 * v210 + 4]];
      unsigned int v219 = *((unsigned __int16 *)v218 - 2049);
      memcpy(v305, v218 - 4096, 0x1000uLL);
      if (v219)
      {
        memcpy(&v300[v209], v305, 2LL * v219);
        v209 += v219;
        LODWORD(v299) = v209;
      }

      v220 = &v217[4 * (2 * ++v210)];
    }

    if (!sub_7C10(&v296, a2, v282, a4))
    {
LABEL_496:
      v238 = _lou_showString((uint64_t)v300, v299, 0);
      _lou_logMessage(40000LL, "result of macro expansion was: %s", v238);
      return 0LL;
    }

    return (void **)(&dword_0 + 1);
  }

  v279 = v55;
  v53 = "Expected %d arguments";
LABEL_151:
  uint64_t v54 = v19;
LABEL_579:
  sub_7454(v54, v53, v279, v280);
  return 0LL;
}

void sub_AEB4(void ***a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (*a1)
    {
      free(*v2);
      free(v2[1]);
      free(v2[3]);
      free(v2);
    }

    sub_AEB4(a1[1]);
    free(a1);
  }

uint64_t sub_AF0C(uint64_t a1, _WORD *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(a1 + 36);
  int v3 = *(_DWORD *)(a1 + 40);
  if (v3 < v4)
  {
    uint64_t v5 = a1 + 2LL * v3;
    if (*(unsigned __int16 *)(v5 + 52) <= 0x20u)
    {
      char v6 = (unsigned __int16 *)(v5 + 54);
      while (v4 - 1 != v3)
      {
        unsigned int v7 = *v6++;
        ++v3;
        if (v7 > 0x20)
        {
          *(_DWORD *)(a1 + 40) = v3;
          goto LABEL_7;
        }
      }

      *(_DWORD *)(a1 + 40) = v3 + 1;
      *a2 = 0;
      goto LABEL_22;
    }
  }

LABEL_7:
  *a2 = 0;
  if (v3 >= v4 || (unsigned int v8 = *(unsigned __int16 *)(a1 + 2LL * v3 + 52), v8 < 0x21))
  {
LABEL_22:
    if (a3) {
      sub_7454(a1, "%s not specified.");
    }
    return 0LL;
  }

  unsigned int v9 = 0;
  int v10 = v3;
  uint64_t v11 = 2LL * v3 + 54;
  do
  {
    if (v9 >= 0x800)
    {
      *(_DWORD *)(a1 + 40) = v10;
      sub_7454(a1, "more than %d characters (bytes)");
      return 0LL;
    }

    unsigned int v12 = v9 + 1;
    *a2 = v9 + 1;
    a2[v9 + 1] = v8;
    if (v4 - 1 == v3)
    {
      *(_DWORD *)(a1 + 40) = v3 + 1;
      a2[v12 + 1] = 0;
      return 1LL;
    }

    ++v10;
    unsigned int v8 = *(unsigned __int16 *)(a1 + v11);
    v11 += 2LL;
    ++v3;
    ++v9;
  }

  while (v8 >= 0x21);
  *(_DWORD *)(a1 + 40) = v3;
  if (!v12) {
    goto LABEL_22;
  }
  a2[v12 + 1] = 0;
  if (v3 < v4)
  {
    uint64_t v13 = (unsigned __int16 *)(a1 + 2LL * v3 + 52);
    do
    {
      unsigned int v14 = *v13++;
      if (v14 > 0x20) {
        break;
      }
      *(_DWORD *)(a1 + 40) = ++v3;
    }

    while (v4 != v3);
  }

  return 1LL;
}

void sub_B078(uint64_t a1, uint64_t a2, void **a3)
{
  uint64_t v3 = a1;
  sub_C760(a1, 0LL, 250000, a3);
  int v4 = malloc(0xFFF8uLL);
  uint64_t v5 = v4;
  if (!v4) {
    _lou_outOfMemory();
  }
  bzero(v4, 0xFFF8uLL);
  unsigned int v54 = 1;
  char v6 = (unsigned int *)malloc(0x10uLL);
  v55 = v6;
  if (!v6) {
    _lou_outOfMemory();
  }
  LOWORD(v7) = 0;
  uint64_t v49 = (_DWORD *)v3;
  *(void *)char v6 = 0LL;
  *((void *)v6 + 1) = 0xFFFF00000000LL;
  do
  {
    if (*(_WORD *)(a2 + 2) == 73)
    {
    }

    else
    {
      sub_5640(v3, &v58, v56);
    }

    uint64_t v8 = v58;
    if (v58 && v59 != 35 && v59 != 37 && v59 != 60)
    {
      int v9 = 0;
      v60[0] = 48;
      int v10 = (unsigned __int16 *)&v59;
      do
      {
        int v12 = *v10++;
        unsigned __int16 v11 = v12;
        if ((v12 - 48) > 9)
        {
          v56[++v9] = v11;
          LOBYTE(v11) = 48;
        }

        v60[v9] = v11;
        --v8;
      }

      while (v8);
      v56[v9 + 1] = 0;
      v56[0] = v9;
      uint64_t v13 = v60;
      v60[v9 + 1] = 0;
      LODWORD(v14) = v9 + 3;
      do
      {
        int v15 = *v13++;
        size_t v14 = (v14 - 1);
      }

      while (v15 == 48);
      unsigned int v16 = sub_E318((uint64_t)v5, v56);
      unsigned int v7 = v16;
      if (v16 == 0xFFFF) {
        unsigned int v7 = sub_E3D8((int *)&v54, (uint64_t)v5, v56);
      }
      if ((int)v14 >= 1)
      {
        unsigned int v17 = v13 - 1;
        unint64_t v18 = &v55[4 * v7];
        sub_C760((uint64_t)v49, v18 + 2, v14, a3);
        memcpy((char *)*a3 + 8 * v18[2] + 31616, v17, v14);
      }

      if (v16 == 0xFFFF)
      {
        do
        {
          __int16 v19 = v7;
          uint64_t v20 = (unsigned __int16)v9--;
          v56[0] = v9;
          unsigned __int16 v21 = v56[v20];
          unsigned int v22 = sub_E318((uint64_t)v5, v56);
          unsigned int v7 = v22;
          if (v22 == 0xFFFF) {
            unsigned int v7 = sub_E3D8((int *)&v54, (uint64_t)v5, v56);
          }
          size_t v23 = &v55[4 * v7];
          uint64_t v25 = (__int16 *)v23 + 7;
          uint64_t v24 = *((unsigned __int16 *)v23 + 7);
          if (*((_WORD *)v23 + 7))
          {
            unsigned int v26 = *(void **)v23;
            if ((((_DWORD)v24 - 1) & v24) != 0)
            {
              __int16 v27 = *((_WORD *)v23 + 7);
            }

            else
            {
              unsigned int v26 = realloc(v26, 8 * v24);
              *(void *)size_t v23 = v26;
              __int16 v27 = *v25;
            }
          }

          else
          {
            unsigned int v26 = malloc(4uLL);
            __int16 v27 = 0;
            *(void *)size_t v23 = v26;
          }

          *((_WORD *)v26 + 2 * v24) = v21;
          *(_WORD *)(*(void *)v23 + 4 * v24 + 2) = v19;
          *uint64_t v25 = v27 + 1;
        }

        while (v22 == 0xFFFF);
      }
    }

LABEL_34:
    uint64_t v3 = (uint64_t)v49;
  }

  while (_lou_getALine(v49));
  uint64_t v28 = 0LL;
  __srca = v55;
  do
  {
    uint64_t v50 = v28;
    for (uint64_t i = (uint64_t **)v5[v28]; i; uint64_t i = (uint64_t **)*i)
    {
      int v30 = i[1];
      unsigned int v31 = *(unsigned __int16 *)v30;
      if (*(_WORD *)v30)
      {
        unsigned __int16 v32 = v31 - 1;
        uint64_t v33 = 2LL * *(unsigned __int16 *)v30;
        int v34 = (char *)v30 + 4;
        unsigned int v35 = 1;
        while (1)
        {
          if (v35 >= v31)
          {
            unsigned __int16 v36 = 0;
          }

          else
          {
            memcpy(v57, v34, ((v33 + 0x1FFFFFFFCLL) & 0x1FFFFFFFELL) + 2);
            unsigned __int16 v36 = v32;
          }

          v56[0] = v36;
          int v37 = sub_E318((uint64_t)v5, v56);
          if (v37 != 0xFFFF) {
            break;
          }
          --v32;
          ++v35;
          v34 += 2;
          v33 -= 2LL;
          if (!v33)
          {
            LOWORD(v7) = -1;
            goto LABEL_46;
          }
        }

        LOWORD(v7) = v37;
      }

  *(_DWORD *)(a4 + 20) = 0;
  v545 = 0;
  _lou_resetPassVariables();
  unsigned int v31 = a6;
  int v30 = a3;
  if (*(_DWORD *)(v19 + 2340) && *(int *)(a3 + 16) >= 1)
  {
    uint64_t j = 0LL;
    do
    {
      ++j;
    }

    while (j < *(int *)(a3 + 16));
  }

  unsigned __int16 v32 = a10;
  if (*(_DWORD *)(v19 + 928) && *(int *)(a3 + 16) >= 1)
  {
    uint64_t j = 0LL;
    uint64_t v33 = 0;
    do
    {
      if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * j), v19) + 24) & 0x10) != 0)
      {
        int v34 = v33 + 1;
        if (v33 >= 1)
        {
          *(_WORD *)(a6 + 2 * j) |= 0x1000u;
          unsigned __int16 v32 = a10;
          if (v33 == 1)
          {
            *(_WORD *)(a6 + 2 * j - 2) |= 0x1000u;
            int v34 = 2;
          }

          goto LABEL_49;
        }
      }

      else
      {
        int v34 = 0;
      }

      unsigned __int16 v32 = a10;
LABEL_49:
      ++j;
      uint64_t v33 = v34;
    }

    while (j < *(int *)(a3 + 16));
  }

  unsigned int v35 = 0LL;
  while (2)
  {
    if (v35 >= 0xA) {
      unsigned __int16 v36 = v19 + 24LL * (v35 - 10) + 1552;
    }
    else {
      unsigned __int16 v36 = v19 + 24 * v35 + 1312;
    }
    if (*(_DWORD *)(v36 + 16))
    {
      int v37 = *(unsigned __int16 *)(v36 + 20);
      uint64_t j = a9;
      v505 = v35;
      v531 = v36;
      uint64_t v38 = 0LL;
      do
      {
        char v39 = sub_1966C(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v38), v19, v36);
        unsigned __int16 v36 = v531;
        *(_DWORD *)(a9 + 4 * v38) = (*(_DWORD *)(a9 + 4 * v38) & 0xFFFFFFFA | v39) ^ 1;
        ++v38;
        uint64_t v40 = *(int *)(v30 + 16);
      }

      while (v38 < v40);
      unsigned __int16 v32 = a10;
      uint64_t j = a9;
      v511 = v37;
      v41 = 0;
      int v42 = 0;
      v519 = *(_DWORD *)(v19 + 36LL * *(unsigned __int16 *)(v531 + 20) + 1960);
      uint64_t v43 = -1;
      uint64_t v44 = -1;
      uint64_t v45 = -1;
      while (2)
      {
        uint64_t v46 = *(_DWORD *)(j + 4LL * v41);
        if (v42) {
          int v47 = v41;
        }
        else {
          int v47 = v45;
        }
        if ((v46 & 1) != 0) {
          int v48 = v43;
        }
        else {
          int v48 = v41;
        }
        if ((v46 & 1) == 0)
        {
          int v42 = 0;
          uint64_t v45 = v47;
          goto LABEL_87;
        }

        uint64_t v49 = *(unsigned __int16 *)(*(void *)(v30 + 8) + 2LL * v41);
        uint64_t v50 = v19;
        uint64_t v51 = *(_WORD *)(a6 + 2LL * v41);
        v52 = sub_19718(v49, v50, v36);
        unsigned __int16 v36 = v531;
        if (v52)
        {
          unsigned int v53 = *(void *)(v531 + 8);
          if (v53)
          {
            unsigned int v54 = sub_16E60(v49, (uint64_t)a1);
            unsigned __int16 v36 = v531;
            v55 = (v54[3] & v53) != 0;
          }

          else
          {
            v55 = (unsigned __int16)(*(_WORD *)v531 & v51);
          }

          int v30 = a3;
          if (v55)
          {
            if ((v44 & 0x80000000) != 0) {
              uint64_t v44 = v41;
            }
            int v42 = 1;
            unsigned __int16 v32 = a10;
            __int16 v19 = (uint64_t)a1;
            goto LABEL_86;
          }
        }

        __int16 v19 = (uint64_t)a1;
        if (!sub_19718(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2LL * v41), (uint64_t)a1, v36)
          || (v44 & 0x80000000) != 0)
        {
          unsigned __int16 v32 = a10;
          uint64_t j = a9;
          unsigned __int16 v36 = v531;
        }

        else
        {
          unsigned __int16 v36 = v531;
          unsigned __int16 v32 = a10;
          *(_WORD *)(a10 + 8LL * v44) = *(_WORD *)(v531 + 16) | *(void *)(a10 + 8LL * v44);
          if (v42)
          {
            v56 = *(_DWORD *)(v531 + 16);
            if (v519 && (int)v44 < v43)
            {
              int v42 = 0;
              *(_WORD *)(a10 + 8LL * v45 + 2) = (*(void *)(a10 + 8LL * v45) | (v56 << 16)) >> 16;
              uint64_t v45 = -1;
              uint64_t v44 = -1;
              v41 = v43;
              goto LABEL_86;
            }

            int v42 = 0;
            v57 = a10 + 8LL * v41;
          }

          else
          {
            v56 = *(_DWORD *)(v531 + 16);
            v57 = a10 + 8LL * v45;
          }

          *(_WORD *)(v57 + 2) = (*(void *)v57 | (v56 << 16)) >> 16;
          uint64_t v45 = -1;
          uint64_t v44 = -1;
LABEL_86:
          uint64_t j = a9;
        }

LABEL_46:
      uint64_t v38 = *((int *)i + 4);
      if ((_DWORD)v38) {
        LOWORD(__srca[4 * v38 + 3]) = v7;
      }
    }

    uint64_t v28 = v50 + 1;
  }

  while (v50 != 8190);
  for (uint64_t j = 0LL; j != 0x1FFF; ++j)
  {
    uint64_t v40 = (void **)v5[j];
    if (v40)
    {
      do
      {
        v41 = (void **)*v40;
        free(v40[1]);
        free(v40);
        uint64_t v40 = v41;
      }

      while (v41);
    }
  }

  free(v5);
  int v42 = v54;
  if ((int)v54 >= 1)
  {
    uint64_t v43 = v54;
    uint64_t v44 = __srca;
    do
    {
      if (*((_WORD *)v44 + 7))
      {
        uint64_t v45 = *(void **)v44;
        sub_C760((uint64_t)v49, v44, 4 * *((unsigned __int16 *)v44 + 7), a3);
        memcpy((char *)*a3 + 8 * *v44 + 31616, v45, 4LL * *((unsigned __int16 *)v44 + 7));
        free(v45);
      }

      else
      {
        *uint64_t v44 = 0;
      }

      v44 += 4;
      --v43;
    }

    while (v43);
  }

  sub_C760((uint64_t)v49, &v53, 16 * v42, a3);
  uint64_t v46 = v53;
  int v47 = *a3;
  v47[636] = v53;
  memcpy(&v47[2 * v46 + 7904], __srca, 16LL * v42);
  free(__srca);
}

uint64_t sub_B5A0(unsigned __int16 *a1)
{
  unsigned int v3 = *a1;
  BOOL v1 = a1 + 1;
  uint64_t v2 = v3;
  uint64_t v4 = dword_27C54;
  while ((_DWORD)v2 != word_259F4[v4])
  {
LABEL_8:
    else {
      uint64_t v4 = 0LL;
    }
    if ((_DWORD)v4 == dword_27C54) {
      return 117LL;
    }
  }

  if ((_DWORD)v2)
  {
    uint64_t v5 = off_20358[v4];
    char v6 = v1;
    uint64_t v7 = v2;
    do
    {
      int v9 = *v5++;
      int v8 = v9;
      int v10 = *v6++;
      if (v10 != v8) {
        goto LABEL_8;
      }
    }

    while (--v7);
  }

  dword_27C54 = v4;
  return v4;
}

void **sub_B624(const char **a1, _WORD *a2, void *a3, uint64_t a4)
{
  uint64_t v7 = (unsigned __int16)*a2;
  if (*a2)
  {
    uint64_t v8 = 0LL;
    do
    {
      v12[v8] = a2[v8 + 1];
      ++v8;
    }

    while (v7 != v8);
    if (v7 >= 0x800)
    {
      sub_7454((uint64_t)a1, "Include statement too long: 'include %s'");
      return 0LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
  }

  v12[v7] = 0;
  uint64_t result = (void **)_lou_resolveTable(v12, *a1);
  if (result)
  {
    int v10 = result;
    if (result[1])
    {
      sub_62B4(result);
      sub_7454((uint64_t)a1, "Table list not supported in include statement: 'include %s'");
      return 0LL;
    }

    BOOL v11 = sub_7AA8((const char *)*result, a3, a4);
    sub_62B4(v10);
    if (!v11)
    {
      _lou_logMessage(40000LL, "%s:%d: Error in included file", *a1, *((_DWORD *)a1 + 6));
      return 0LL;
    }

    return (void **)(&dword_0 + 1);
  }

  else
  {
    ++dword_262E0;
  }

  return result;
}

uint64_t sub_B778(uint64_t a1, int a2, uint64_t a3, int a4, int a5, uint64_t *a6, void **a7)
{
  uint64_t result = sub_BC34(a1, &v22);
  if ((_DWORD)result)
  {
    uint64_t result = sub_BCA0(a1, v21);
    if ((_DWORD)result)
    {
      if (v22 == 1)
      {
        uint64_t v15 = (unsigned __int16)v21[0];
        if (v21[0])
        {
          if (a6)
          {
            if ((a3 & 0x30) != 0) {
              a3 |= 2uLL;
            }
            uint64_t v16 = sub_CD64(a1, v23, a6, 0LL, *(_DWORD *)(*a6 + 920));
            uint64_t v20 = a3;
            *(void *)(v16 + 24) |= a3;
            uint64_t v17 = v15;
            do
            {
              int v18 = (unsigned __int16)v21[v17];
              uint64_t v19 = sub_7A50(v18, *a6);
              if (!v19) {
                uint64_t v19 = sub_E528(a1, v18, a6, *(_DWORD *)(*a6 + 920));
              }
              --v17;
            }

            while ((unint64_t)(v17 + 1) > 1);
            if ((_DWORD)v15 != 1) {
              goto LABEL_18;
            }
            *(void *)(v19 + 24) |= v20;
          }

          if (a7)
          {
            if ((_DWORD)v15 == 1) {
              sub_BD30(a1, v23, (unsigned __int16)v21[1], a7);
            }
          }

          if (!a6) {
            return 1LL;
          }
LABEL_18:
          uint64_t result = sub_BFF4(a1, a2, &v22, v21, 0LL, 0LL, 0LL, 0LL, a4, a5, (void **)a6);
          if (!(_DWORD)result) {
            return result;
          }
          return 1LL;
        }

        sub_7454(a1, "At least one cell is required.");
      }

      else
      {
        sub_7454(a1, "Exactly one character is required.");
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t sub_B938(uint64_t a1, int a2, int a3, uint64_t *a4, void **a5)
{
  uint64_t result = sub_AF0C(a1, v26, (uint64_t)"name operand");
  if ((_DWORD)result)
  {
    uint64_t result = sub_BC34(a1, &v23);
    if ((_DWORD)result)
    {
      uint64_t result = sub_AF0C(a1, v22, (uint64_t)"dots operand");
      if ((_DWORD)result)
      {
        if (v22[0])
        {
          uint64_t v11 = 0LL;
          while (v22[v11 + 1] != 44)
          {
            if (v22[0] == ++v11) {
              goto LABEL_11;
            }
          }
        }

        else
        {
          LODWORD(v11) = 0;
        }

        if ((_DWORD)v11 == v22[0])
        {
LABEL_11:
          sub_7454(a1, "Dots operand must consist of two cells separated by a comma");
          return 0LL;
        }

        v22[v11 + 1] = 45;
        uint64_t result = sub_5AE0(a1, &v19, v22);
        if ((_DWORD)result)
        {
          if (v23 != 2 || v19 != 2)
          {
            sub_7454(a1, "two Unicode characters and two cells separated by a comma are needed.");
            return 0LL;
          }

          if (!a4) {
            goto LABEL_20;
          }
          uint64_t v12 = sub_CD64(a1, v24, a4, 0LL, *(_DWORD *)(*a4 + 920));
          *(void *)(v12 + 24) |= 0x40uLL;
          uint64_t v13 = sub_CD64(a1, v25, a4, 0LL, *(_DWORD *)(*a4 + 920));
          *(void *)(v13 + 24) |= 0x40uLL;
          uint64_t v14 = sub_E528(a1, v20, a4, *(_DWORD *)(*a4 + 920));
          *(void *)(v14 + 24) |= 0x40uLL;
          uint64_t v15 = sub_E528(a1, v21, a4, *(_DWORD *)(*a4 + 920));
          *(void *)(v15 + 24) |= 0x40uLL;
          uint64_t result = sub_BFF4(a1, 69, &v23, &v19, 0LL, 0LL, (unsigned int *)&v18, 0LL, a2, a3, (void **)a4);
          if ((_DWORD)result)
          {
            uint64_t result = sub_E61C(a1, v26, v18, *a4);
            if ((_DWORD)result)
            {
LABEL_20:
              if (a5)
              {
                sub_BD30(a1, v24, v20, a5);
                sub_BD30(a1, v25, v21, a5);
              }

              if (!a4) {
                return 1LL;
              }
              unsigned __int16 v16 = v25;
              unsigned __int16 v17 = v21;
              __int16 v19 = 1;
              __int16 v23 = 1;
              uint64_t result = sub_BFF4(a1, 64, &v23, &v19, 0LL, 0LL, 0LL, 0LL, a2, a3, (void **)a4);
              if ((_DWORD)result)
              {
                unsigned __int16 v24 = v16;
                unsigned __int16 v20 = v17;
                uint64_t result = sub_BFF4(a1, 64, &v23, &v19, 0LL, 0LL, 0LL, 0LL, a2, a3, (void **)a4);
                if ((_DWORD)result) {
                  return 1LL;
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

uint64_t sub_BC34(uint64_t a1, _WORD *a2)
{
  uint64_t result = sub_AF0C(a1, v5, (uint64_t)"Characters operand");
  if ((_DWORD)result) {
    return sub_5640(a1, a2, v5);
  }
  return result;
}

uint64_t sub_BCA0(uint64_t a1, _WORD *a2)
{
  uint64_t result = sub_AF0C(a1, v5, (uint64_t)"Dots operand");
  if ((_DWORD)result)
  {
    if (v5[0] == 1 && v5[1] == 61)
    {
      *a2 = 0;
      return 1LL;
    }

    else
    {
      return sub_5AE0(a1, a2, v5);
    }
  }

  return result;
}

uint64_t sub_BD30(uint64_t a1, int a2, int a3, void **a4)
{
  uint64_t v8 = (char *)*a4;
  if (*a4)
  {
    int v9 = &v8[4 * _lou_charHash(a2) + 8];
    while (1)
    {
      uint64_t v10 = *(unsigned int *)v9;
      if (!(_DWORD)v10) {
        break;
      }
      int v9 = &v8[8 * v10 + 8992];
      if (*((unsigned __int16 *)v9 + 2) == a2)
      {
        uint64_t v11 = (char *)*a4;
        if (*a4) {
          goto LABEL_13;
        }
        goto LABEL_6;
      }
    }
  }

  sub_E6FC(a1, &v28, a4);
  uint64_t v18 = (uint64_t)*a4 + 8 * v28;
  *(_DWORD *)(v18 + 8992) = 0;
  *(_WORD *)(v18 + 8996) = a2;
  *(_WORD *)(v18 + 8998) = a3;
  uint64_t v19 = _lou_charHash(a2);
  uint64_t v11 = (char *)*a4;
  uint64_t v20 = (uint64_t)*a4 + 4 * v19;
  unsigned int v23 = *(_DWORD *)(v20 + 8);
  __int16 v22 = (unsigned int *)(v20 + 8);
  uint64_t v21 = v23;
  if (v23)
  {
    do
    {
      unsigned __int16 v24 = &v11[8 * v21];
      uint64_t v21 = *((unsigned int *)v24 + 2248);
    }

    while ((_DWORD)v21);
    *((_DWORD *)v24 + 2248) = v28;
  }

  else
  {
    *__int16 v22 = v28;
  }

LABEL_13:
  uint64_t result = _lou_charHash(a3);
  unsigned __int16 v25 = &v11[4 * result + 4500];
  while (1)
  {
    uint64_t v26 = *(unsigned int *)v25;
    if (!(_DWORD)v26) {
      break;
    }
    unsigned __int16 v25 = &v11[8 * v26 + 8992];
  }

  v14[0] = v12;
  return sub_5AE0(a4, a3, v14);
}

uint64_t sub_BEC8(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, int a5, int a6, void **a7)
{
  uint64_t result = sub_AF0C(a1, v15, a2);
  if ((_DWORD)result)
  {
    uint64_t result = sub_5AE0(a1, v14, v15);
    if ((_DWORD)result) {
      return sub_BFF4(a1, a3, 0LL, v14, 0LL, 0LL, a4, 0LL, a5, a6, a7);
    }
  }

  return result;
}

uint64_t sub_BF88(uint64_t a1, _WORD *a2)
{
  uint64_t result = sub_AF0C(a1, v5, (uint64_t)"characters");
  if ((_DWORD)result) {
    return sub_5640(a1, a2, v5);
  }
  return result;
}

uint64_t sub_BFF4( uint64_t a1, int a2, __int16 *a3, __int16 *a4, uint64_t a5, uint64_t a6, unsigned int *a7, uint64_t *a8, int a9, int a10, void **a11)
{
  if (a3)
  {
    int v19 = 2 * (unsigned __int16)*a3 + 60;
    if (!a4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  int v19 = 60;
  if (a4) {
LABEL_3:
  }
    v19 += 2 * (unsigned __int16)*a4;
LABEL_4:
  sub_C760(a1, &v97, v19, a11);
  unsigned int v20 = v97;
  uint64_t v21 = (uint64_t)*a11 + 8 * v97 + 31616;
  if (a8) {
    *a8 = v21;
  }
  if (a7) {
    *a7 = v20;
  }
  *(void *)uint64_t v21 = *(void *)(a1 + 8);
  int v22 = *(_DWORD *)(a1 + 24);
  int v23 = *((_DWORD *)*a11 + 230);
  *((_DWORD *)*a11 + 230) = v23 + 1;
  *(_DWORD *)(v21 + 8) = v22;
  *(_DWORD *)(v21 + 12) = v23;
  *(_DWORD *)(v21 + 44) = a2;
  *(void *)(v21 + 24) = a5;
  *(void *)(v21 + 32) = a6;
  *(_BYTE *)(v21 + 48) = 0;
  if (a3)
  {
    uint64_t v24 = *a3;
    __int16 v25 = *a3;
    *(_WORD *)(v21 + 50) = v24;
    memcpy((void *)(v21 + 54), a3 + 1, 2 * v24);
    if (a4)
    {
LABEL_10:
      uint64_t v26 = *a4;
      *(_WORD *)(v21 + 52) = v26;
      memcpy((void *)(v21 + 2LL * v25 + 54), a4 + 1, 2 * v26);
      goto LABEL_15;
    }
  }

  else
  {
    __int16 v25 = 0;
    *(_WORD *)(v21 + 50) = 0;
    if (a4) {
      goto LABEL_10;
    }
  }

  *(_WORD *)(v21 + 52) = 0;
LABEL_15:
  if ((a2 - 58) >= 3)
  {
    if ((a2 - 74) > 4 || a2 == 74 && *(__int16 *)(v21 + 50) > 0)
    {
      if (a10)
      {
LABEL_20:
        if (!a9)
        {
          int v27 = *(_DWORD *)(v21 + 44);
          if (v27 == 74)
          {
            unsigned int v28 = (unsigned __int16 *)(v21 + 54);
            uint64_t v29 = (__int16 *)(v21 + 50);
          }

          else
          {
            unsigned int v28 = (unsigned __int16 *)(v21 + 2LL * *(__int16 *)(v21 + 50) + 54);
            uint64_t v29 = (__int16 *)(v21 + 52);
          }

          int v37 = *v29;
          if (v37 == 1)
          {
            if (v27 != 58 && v27 != 79)
            {
              uint64_t v38 = v97;
              uint64_t v39 = sub_E528(a1, *v28, (uint64_t *)a11, *(_DWORD *)(v21 + 12));
              uint64_t v40 = (__int16 *)*a11;
              uint64_t v41 = (uint64_t)*a11 + 8 * v38 + 31616;
              unsigned int v42 = *((_DWORD *)*a11 + 2 * v38 + 7915) - 61;
              if (v42 <= 8) {
                *(_DWORD *)(v39 + 16) = v38;
              }
              unsigned int v45 = *(_DWORD *)(v39 + 20);
              uint64_t v43 = (_DWORD *)(v39 + 20);
              uint64_t v44 = v45;
              if (v45)
              {
                int v46 = *(__int16 *)(v41 + 50);
                uint64_t v47 = (uint64_t)&v40[4 * v44 + 15808];
                if (v46 <= v40[4 * v44 + 15833])
                {
                  while (v40[4 * v44 + 15834])
                  {
                    uint64_t v44 = *(unsigned int *)(v47 + 20);
                    uint64_t v43 = (_DWORD *)(v47 + 20);
                    if (!*(_DWORD *)(v47 + 20)) {
                      break;
                    }
                    uint64_t v47 = (uint64_t)&v40[4 * v44 + 15808];
                    if (v46 > v40[4 * v44 + 15833]) {
                      break;
                    }
                  }
                }
              }

              *(_DWORD *)(v41 + 20) = v44;
              *uint64_t v43 = v38;
            }

            if (a8) {
              *a8 = (uint64_t)*a11 + 8 * v97 + 31616;
            }
          }

          else if (v37 >= 2)
          {
            unsigned int v53 = v97;
            unsigned int v54 = (char *)*a11;
            uint64_t v55 = _lou_stringHash(v28, 0, 0LL);
            int v56 = *(_DWORD *)(v21 + 44);
            if (v56 != 58)
            {
              v57 = &v54[4 * v55 + 27124];
              uint64_t v58 = *(unsigned int *)v57;
              if ((_DWORD)v58)
              {
                int v59 = *(__int16 *)(v21 + 50) + v37;
                uint64_t v60 = (uint64_t)&v54[8 * v58 + 31616];
                for (int i = *(__int16 *)&v54[8 * v58 + 31666] + *(__int16 *)&v54[8 * v58 + 31668];
                      v59 <= i;
                      int i = *(__int16 *)&v54[8 * v58 + 31666] + *(__int16 *)&v54[8 * v58 + 31668])
                {
                  if (i == v59 && v56 != 83 && *(_DWORD *)(v60 + 44) == 83) {
                    break;
                  }
                  uint64_t v58 = *(unsigned int *)(v60 + 20);
                  v57 = (char *)(v60 + 20);
                  if (!*(_DWORD *)(v60 + 20)) {
                    break;
                  }
                  uint64_t v60 = (uint64_t)&v54[8 * v58 + 31616];
                }
              }

              *(_DWORD *)(v21 + 20) = v58;
              *(_DWORD *)v57 = v53;
            }
          }
        }

        return 1LL;
      }

      int v30 = *(__int16 *)(v21 + 50);
      if (v30 != 1)
      {
        if (v30 >= 2)
        {
          unsigned int v48 = v97;
          uint64_t v49 = (char *)*a11;
          uint64_t v50 = &v49[4 * _lou_stringHash((unsigned __int16 *)(v21 + 54), 0, 0LL) + 22632];
          uint64_t v51 = *(unsigned int *)v50;
          if ((_DWORD)v51)
          {
            uint64_t v52 = (uint64_t)&v49[8 * v51 + 31616];
            if (*(__int16 *)(v21 + 50) <= *(__int16 *)&v49[8 * v51 + 31666])
            {
              int v85 = *(unsigned __int16 *)(v21 + 50);
              int v86 = *(unsigned __int16 *)&v49[8 * v51 + 31666];
              do
              {
                if (v85 == v86 && *(_DWORD *)(v52 + 44) == 83 && *(_DWORD *)(v21 + 44) != 83) {
                  break;
                }
                uint64_t v51 = *(unsigned int *)(v52 + 16);
                uint64_t v50 = (char *)(v52 + 16);
                if (!*(_DWORD *)(v52 + 16)) {
                  break;
                }
                uint64_t v52 = (uint64_t)&v49[8 * v51 + 31616];
                int v86 = *(unsigned __int16 *)&v49[8 * v51 + 31666];
              }

              while (*(__int16 *)&v49[8 * v51 + 31666] >= (__int16)v85);
            }
          }

          *(_DWORD *)(v21 + 16) = v51;
          *(_DWORD *)uint64_t v50 = v48;
        }

        goto LABEL_20;
      }

      uint64_t v31 = v97;
      int v32 = *(_DWORD *)(v21 + 44);
      if ((v32 - 76) <= 2)
      {
        uint64_t v33 = sub_E528(a1, *(unsigned __int16 *)(v21 + 54), (uint64_t *)a11, *(_DWORD *)(v21 + 12));
        uint64_t v34 = (uint64_t)*a11 + 8 * v31 + 31616;
        goto LABEL_102;
      }

      unsigned int v62 = v32 - 49;
      uint64_t v63 = sub_CD64(a1, *(unsigned __int16 *)(v21 + 54), (uint64_t *)a11, 0LL, *(_DWORD *)(v21 + 12));
      uint64_t v33 = v63;
      if (v62 <= 1)
      {
        *(_DWORD *)(v63 + 40) = v31;
LABEL_109:
        uint64_t v21 = (uint64_t)*a11 + 8 * v97 + 31616;
        if (a8) {
          *a8 = v21;
        }
        goto LABEL_20;
      }

      uint64_t v34 = (uint64_t)*a11 + 8 * v31 + 31616;
      unsigned int v64 = *((_DWORD *)*a11 + 2 * v31 + 7915);
      if (v64 - 61 > 8)
      {
LABEL_102:
        unsigned int v92 = *(_DWORD *)(v33 + 20);
        uint64_t v91 = (_DWORD *)(v33 + 20);
        uint64_t v90 = v92;
        if (v92)
        {
          for (uint64_t j = (uint64_t)*a11 + 8 * v90 + 31616; *((_WORD *)*a11 + 4 * v90 + 15833); uint64_t j = (uint64_t)*a11
                                                                                           + 8 * v90
                                                                                           + 31616)
          {
            uint64_t v90 = *(unsigned int *)(j + 16);
            uint64_t v91 = (_DWORD *)(j + 16);
            if (!*(_DWORD *)(j + 16)) {
              break;
            }
          }
        }

        *(_DWORD *)(v34 + 16) = v90;
        *uint64_t v91 = v31;
        goto LABEL_109;
      }

      uint64_t v65 = *(unsigned int *)(v63 + 16);
      if (!(_DWORD)v65)
      {
        *(_DWORD *)(v63 + 16) = v31;
        goto LABEL_102;
      }

      uint64_t v66 = (uint64_t)*a11 + 8 * v65;
      v67 = (char **)(v66 + 31616);
      uint64_t v68 = *(unsigned int *)(v66 + 31660);
      if (v68 <= 0x74)
      {
        unint64_t v95 = strdup(off_20358[v68]);
      }

      else
      {
        __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", v68);
        unsigned int v64 = *(_DWORD *)(v34 + 44);
        unint64_t v95 = strdup(byte_25ADE);
        if (v64 >= 0x75)
        {
          unsigned int v94 = v64;
          uint64_t v69 = byte_25ADE;
          __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", v94);
LABEL_101:
          v87 = strdup(v69);
          uint64_t v96 = *(const char **)a1;
          uint64_t v88 = *v67;
          int v89 = *(_DWORD *)(a1 + 24);
          sub_79BC(*(const char **)(a1 + 8), v88);
          _lou_logMessage( 10000LL,  "%s:%d: Character already defined (%s). The existing %s rule will take precedence over the new %s rule.",  v96,  v89,  (const char *)qword_27450,  v95,  v87);
          free(v95);
          free(v87);
          goto LABEL_102;
        }
      }

      uint64_t v69 = off_20358[v64];
      goto LABEL_101;
    }

    if (!a10)
    {
      unsigned int v35 = (char *)*a11;
      switch(*(_DWORD *)(v21 + 44))
      {
        case 'J':
          uint64_t v36 = 22596LL;
          goto LABEL_66;
        case 'K':
          uint64_t v36 = 22592LL;
          goto LABEL_66;
        case 'L':
          uint64_t v36 = 22600LL;
          goto LABEL_66;
        case 'M':
          uint64_t v36 = 22604LL;
          goto LABEL_66;
        case 'N':
          uint64_t v36 = 22608LL;
LABEL_66:
          v70 = &v35[v36];
          unsigned int v71 = v97;
          do
          {
            uint64_t v72 = v70;
            uint64_t v73 = *(unsigned int *)v70;
            if (!(_DWORD)v73) {
              break;
            }
            int v74 = &v35[8 * v73];
            int v75 = *((__int16 *)v74 + 15833);
            v70 = v74 + 31632;
          }

          while (*(__int16 *)(v21 + 50) <= v75);
          *(_DWORD *)(v21 + 16) = v73;
          *(_DWORD *)uint64_t v72 = v71;
          if (!a9) {
            goto LABEL_70;
          }
          return 1LL;
        default:
          return 0LL;
      }
    }

    if (!a9)
    {
LABEL_70:
      v76 = (char *)*a11;
      switch(*(_DWORD *)(v21 + 44))
      {
        case 'J':
          uint64_t v77 = 22616LL;
          break;
        case 'K':
          uint64_t v77 = 22612LL;
          break;
        case 'L':
          uint64_t v77 = 22620LL;
          break;
        case 'M':
          uint64_t v77 = 22624LL;
          break;
        case 'N':
          uint64_t v77 = 22628LL;
          break;
        default:
          return 0LL;
      }

      v79 = &v76[v77];
      unsigned int v80 = v97;
      do
      {
        int v81 = v79;
        uint64_t v82 = *(unsigned int *)v79;
        if (!(_DWORD)v82) {
          break;
        }
        int v83 = &v76[8 * v82];
        int v84 = *((__int16 *)v83 + 15833);
        v79 = v83 + 31636;
      }

      while (*(__int16 *)(v21 + 50) <= v84);
      *(_DWORD *)(v21 + 20) = v82;
      *(_DWORD *)int v81 = v80;
    }
  }

  return 1LL;
}

void sub_C760(uint64_t a1, _DWORD *a2, int a3, void **a4)
{
  unsigned int v5 = (a3 + 7) & 0xFFFFFFF8;
  char v6 = *a4;
  uint64_t v7 = *(unsigned int *)*a4;
  unsigned int v8 = *((_DWORD *)*a4 + 1) + v5;
  if (v8 > v7)
  {
    unsigned int v11 = v8 + (v8 >> 3);
    uint64_t v12 = realloc(*a4, v11);
    char v6 = v12;
    if (!v12)
    {
      sub_7454(a1, "Not enough memory for translation table.");
      _lou_outOfMemory();
    }

    bzero((char *)v12 + v7, v11 - v7);
    uint64_t v13 = (void *)qword_27320;
    if (qword_27320)
    {
      do
      {
        uint64_t v13 = (void *)*v13;
      }

      while (v13);
    }

    *char v6 = v11;
    *a4 = v6;
  }

  if (a2)
  {
    *a2 = ((unint64_t)v6[1] + 0x7FFFF8478LL) >> 3;
    v6[1] += v5;
  }

void *sub_C848(uint64_t a1)
{
  int v2 = 0;
  *(void *)(a1 + 8) = 0LL;
  *(_OWORD *)(a1 + 16) = xmmword_1CAB0;
  while (v2 != 9)
  {
    unsigned int v3 = off_20700[v2];
    int v4 = strlen(v3);
    if (v4 >= 1)
    {
      uint64_t v5 = v4;
      char v6 = v10;
      do
      {
        unsigned __int16 v7 = *v3++;
        *v6++ = v7;
        --v5;
      }

      while (v5);
    }

    unsigned int v8 = sub_C9C4(0LL, v10, v4, (void *)a1, 0);
    if (v8)
    {
      ++v2;
    }

    else
    {
      uint64_t result = *(void **)(a1 + 8);
      if (!result) {
        return result;
      }
      do
      {
        *(void *)(a1 + 8) = *result;
        free(result);
        uint64_t result = *(void **)(a1 + 8);
      }

      while (result);
    }

    if (!v8) {
      return 0LL;
    }
  }

  return (void *)(&dword_0 + 1);
}

uint64_t **sub_C964(unsigned __int16 *a1, uint64_t a2)
{
  int v2 = *(uint64_t ***)(a2 + 8);
  if (v2)
  {
    unsigned int v3 = a1 + 1;
    unsigned int v4 = *a1;
    do
    {
      int v2 = (uint64_t **)*v2;
    }

    while (v2);
  }

  return v2;
}

void *sub_C9C4(uint64_t a1, unsigned __int16 *a2, int a3, void *a4, int a5)
{
  if (a5)
  {
    if (a3 >= 1)
    {
      uint64_t v9 = a3;
      uint64_t v10 = a2;
      do
      {
        int v11 = *v10++;
        if ((v11 & 0xFFFFFFDF) - 65 >= 0x1A) {
          sub_7454(a1, "Invalid attribute name: must be a digit between 0 and 7 or a word containing only letters");
        }
        --v9;
      }

      while (v9);
    }

    uint64_t v12 = 0LL;
    while (1)
    {
      if (strlen(off_20750[v12]) == a3)
      {
        if (a3 < 1)
        {
          LODWORD(v13) = 0;
        }

        else
        {
          uint64_t v13 = 0LL;
          while (off_20750[v12][v13] == a2[v13])
          {
            if (a3 == ++v13) {
              goto LABEL_21;
            }
          }
        }

        if ((_DWORD)v13 == a3) {
          break;
        }
      }

      if (++v12 == 28) {
        goto LABEL_17;
      }
    }

LABEL_21:
    sub_7454(a1, "Attribute name is reserved: %s");
    return 0LL;
  }

LABEL_17:
  unint64_t v14 = a4[2];
  if (v14)
  {
    uint64_t v15 = 0x8000000LL;
    if (v14 != 256) {
      uint64_t v15 = 2 * v14;
    }
    a4[2] = v15;
  }

  else
  {
    unint64_t v14 = a4[3];
    if (v14 > 0x800000 || (a4[3] = 2 * v14, !v14))
    {
      sub_7454(a1, "character class table overflow.");
      return 0LL;
    }
  }

  uint64_t v16 = malloc(2LL * (a3 - 1) + 24);
  if (!v16) {
    _lou_outOfMemory();
  }
  unsigned __int16 v17 = v16;
  v16[1] = 0LL;
  v16[2] = 0LL;
  void *v16 = 0LL;
  *((_WORD *)v16 + 8) = a3;
  memcpy((char *)v16 + 18, a2, 2 * (unsigned __int16)a3);
  void *v17 = a4[1];
  v17[1] = v14;
  a4[1] = v17;
  return v17;
}

uint64_t sub_CB6C(uint64_t a1)
{
  uint64_t result = sub_AF0C(a1, v6, (uint64_t)"last word before or after");
  if ((_DWORD)result)
  {
    uint64_t result = sub_5640(a1, v5, v6);
    if ((_DWORD)result)
    {
      uint64_t v3 = 0LL;
      while (v5[v3 + 1] == aBefore[v3])
      {
        if (++v3 == 6) {
          return 1LL;
        }
      }

      uint64_t v4 = 0LL;
      while (v5[v4 + 1] == aAfter[v4])
      {
        if (++v4 == 5) {
          return 2LL;
        }
      }

      return 0LL;
    }
  }

  return result;
}

uint64_t sub_CC4C(uint64_t a1)
{
  uint64_t result = sub_AF0C(a1, &v7, (uint64_t)"number");
  if ((_DWORD)result)
  {
    unsigned __int16 v3 = v8;
    unsigned __int16 v4 = 0;
    uint64_t v5 = (unsigned __int16 *)v9;
    do
    {
      unsigned __int16 v4 = v3 + 10 * v4 - 48;
      int v6 = *v5++;
      unsigned __int16 v3 = v6;
    }

    while ((v6 - 48) < 0xA);
    if (v4)
    {
      return v4;
    }

    else
    {
LABEL_7:
      sub_7454(a1, "a nonzero positive number is required");
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_CCF8(int a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v6 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if (!(_DWORD)v6) {
    return 0LL;
  }
  while (1)
  {
    uint64_t result = a2 + 8 * v6 + 31616;
    uint64_t v6 = *(unsigned int *)(a2 + 8 * v6 + 31628);
    if (!(_DWORD)v6) {
      return 0LL;
    }
  }

  if (a3) {
    *a3 = v6;
  }
  return result;
}

uint64_t sub_CD64(uint64_t a1, int a2, uint64_t *a3, unsigned int *a4, int a5)
{
  unsigned __int16 v8 = a2;
  uint64_t v10 = sub_CCF8(a2, *a3, a4);
  if (!v10)
  {
    sub_C760(a1, &v16, 64, (void **)a3);
    uint64_t v11 = *a3 + 8LL * v16;
    uint64_t v10 = v11 + 31616;
    *(_OWORD *)(v11 + 31664) = 0u;
    *(_OWORD *)(v11 + 31648) = 0u;
    *(_OWORD *)(v11 + 31632) = 0u;
    *(_OWORD *)(v11 + 31616) = 0u;
    *(void *)(v11 + 31616) = *(void *)(a1 + 8);
    *(_DWORD *)(v11 + 31624) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(v11 + 31672) = a5;
    *(_WORD *)(v11 + 31660) = v8;
    uint64_t v12 = *a3 + 4 * _lou_charHash(v8);
    uint64_t v13 = *(unsigned int *)(v12 + 13608);
    if (!(_DWORD)v13)
    {
      *(_DWORD *)(v12 + 13608) = v16;
      if (!a4) {
        return v10;
      }
      goto LABEL_5;
    }

    do
    {
      uint64_t v14 = *a3 + 8 * v13 + 31616;
      uint64_t v13 = *(unsigned int *)(*a3 + 8 * v13 + 31628);
    }

    while ((_DWORD)v13);
    *(_DWORD *)(v14 + 12) = v16;
    if (a4) {
LABEL_5:
    }
      *a4 = v16;
  }

  return v10;
}

uint64_t sub_CE70(uint64_t a1, unsigned int a2, int a3, int a4, uint64_t *a5)
{
  word_27C58 = 0;
  uint64_t v7 = *(int *)(a1 + 36);
  uint64_t v6 = *(int *)(a1 + 40);
  unsigned __int16 v10 = 0;
  int v11 = 1;
  do
  {
    unsigned __int16 v12 = v11;
    uint64_t v13 = &v144[v10++ - 1];
    v13[1] = *(_WORD *)(a1 + 2 * v6++ + 52);
    ++v11;
  }

  while (v7 != v6);
  __int16 v143 = v10;
  if (!v10)
  {
LABEL_8:
    sub_7454(a1, "Invalid multipass operands");
    return 0LL;
  }

  uint64_t v14 = 0LL;
  while ((unsigned __int16)v144[v14] >= 0x21u)
  {
    if (v12 == ++v14) {
      goto LABEL_8;
    }
  }

  v144[v14] = 1;
  sub_5640(a1, v141, &v143);
  uint64_t v16 = v141[0];
  if (v141[0])
  {
    uint64_t v17 = 0LL;
    while (v141[v17 + 1] != 1)
    {
      if (v141[0] == ++v17)
      {
        LODWORD(v17) = v141[0];
        break;
      }
    }
  }

  else
  {
    LODWORD(v17) = 0;
  }

  int v18 = 0;
  uint64_t v136 = 0LL;
  int v137 = 0;
  int v19 = 0;
  v141[v17 + 1] = 32;
  uint64_t v134 = v16 - 1;
  while (2)
  {
    uint64_t v20 = v18;
    unsigned int v21 = v141[v18 + 1];
    if (v21 > 0x5A)
    {
      if (v141[v18 + 1] > 0x7Au)
      {
        if (v21 == 123 || v21 == 125)
        {
          uint64_t v25 = v18 + 1LL;
          int v26 = v141[v20 + 2];
          if ((v26 & 0xFFFFFFDF) - 65 > 0x19)
          {
            unsigned __int16 v27 = 0;
            int v30 = v20 + 1;
          }

          else
          {
            unsigned __int16 v27 = 0;
            if (v20 + 2 > v16) {
              int v28 = v20 + 2;
            }
            else {
              int v28 = v16;
            }
            while (1)
            {
              uint64_t v29 = &v144[v27++ - 1];
              v29[1] = v26;
              int v30 = v25 + 1;
              if (v25 + 1 >= v16) {
                break;
              }
              int v26 = v141[v25++ + 2];
              if ((v26 & 0xFFFFFFDF) - 65 > 0x19) {
                goto LABEL_107;
              }
            }

            int v30 = v28;
          }

LABEL_107:
          __int16 v143 = v27;
          int v140 = v30;
          uint64_t v57 = *a5;
          unsigned int v58 = sub_EAEC((char *)&v143, *a5);
          if (v58)
          {
            uint64_t v59 = v57 + 8LL * v58 + 31616;
          }

          else
          {
            uint64_t v59 = v136;
            if (!v136) {
              goto LABEL_279;
            }
          }

          if (*(_DWORD *)(v59 + 44) != 69)
          {
LABEL_279:
            int v127 = v27;
LABEL_280:
            _lou_showString((uint64_t)v144, v127, 0);
            sub_7454(a1, "%s is not a grouping name");
            return 0LL;
          }

          if (v19 >= 2048) {
            goto LABEL_278;
          }
          word_28C5A[v19 + 1] = v21;
          if (v19 == 2047) {
            goto LABEL_278;
          }
          uint64_t v136 = v59;
          uint64_t v60 = &word_28C5A[v19];
          v60[2] = HIWORD(v58);
          if (v19 > 2045) {
            goto LABEL_278;
          }
          v19 += 3;
          v60[3] = v58;
        }

        else
        {
          if (v21 != 126)
          {
LABEL_282:
            sub_7454(a1, "incorrect operator '%c ' in test part");
            return 0LL;
          }

          if (v19 >= 2048) {
            goto LABEL_278;
          }
          int v23 = &word_28C5A[v19];
          int v22 = v19 + 1;
          __int16 v24 = 126;
LABEL_101:
          v23[1] = v24;
          int v140 = v20 + 1;
LABEL_102:
          int v19 = v22;
        }
      }

      else
      {
        switch(v141[v18 + 1])
        {
          case '[':
            if (v137)
            {
              sub_7454(a1, "nested replacement statements");
              return 0LL;
            }

            if (v19 >= 2048) {
              goto LABEL_278;
            }
            int v22 = v19 + 1;
            word_28C5A[v19 + 1] = 91;
            int v140 = v18 + 1;
            int v137 = 1;
            goto LABEL_102;
          case ']':
            if (!v137)
            {
              sub_7454(a1, "unexpected end of replacement");
              return 0LL;
            }

            if (v19 >= 2048) {
              goto LABEL_278;
            }
            int v137 = 0;
            int v23 = &word_28C5A[v19];
            int v22 = v19 + 1;
            __int16 v24 = 93;
            goto LABEL_101;
          case '_':
            if (v19 >= 2048) {
              goto LABEL_278;
            }
            word_28C5A[v19 + 1] = 95;
            uint64_t v32 = v18 + 1LL;
            int v140 = v18 + 1;
            int v33 = v141[v32 + 1];
            __int16 v34 = 0;
            uint64_t v35 = v134 - v32;
            uint64_t v36 = &v141[v32 + 2];
            break;
            if (v19 >= 2048) {
              goto LABEL_278;
            }
            int v23 = &word_28C5A[v19];
            int v22 = v19 + 1;
            __int16 v24 = 96;
            goto LABEL_101;
          default:
            goto LABEL_282;
        }

        while (1)
        {
          __int16 v34 = v33 + 10 * v34 - 48;
          if (!v35) {
            break;
          }
          int v37 = *v36++;
          LOWORD(v33) = v37;
          --v35;
          LODWORD(v32) = v32 + 1;
        }

        LODWORD(v32) = v16;
LABEL_165:
        int v140 = v32;
        if (!v34) {
LABEL_166:
        }
          __int16 v34 = 1;
        __int16 v142 = v34;
        if (v19 >= 2047) {
          goto LABEL_278;
        }
        uint64_t v82 = v19 + 1LL;
        v19 += 2;
        word_28C5A[v82 + 1] = v34;
      }

      goto LABEL_186;
    }

    switch(v141[v18 + 1])
    {
      case ' ':
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        word_28C5A[v19 + 1] = 32;
        if (v137)
        {
          sub_7454(a1, "expected end of replacement");
          return 0LL;
        }

        int v137 = 0;
        ++v19;
        int v140 = v18 + 1;
        goto LABEL_186;
      case '!':
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        int v23 = &word_28C5A[v19];
        int v22 = v19 + 1;
        __int16 v24 = 33;
        goto LABEL_101;
      case '""':
        int v140 = v20 + 1;
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        word_28C5A[v19 + 1] = 34;
        sub_E944(v141, &v140, (unsigned __int16 *)&v143, a1);
        LODWORD(v31) = (unsigned __int16)v143;
        if (v143) {
          goto LABEL_61;
        }
        sub_7454(a1, "empty string in test part");
        return 0LL;
      case '#':
        int v140 = v18 + 1;
        int v42 = v140;
        int v43 = v141[v140 + 1];
        switch(v43)
        {
          case '<':
            int v61 = v140 + 1;
            if (v141[v140 + 2] == 61)
            {
              if (v19 > 2047) {
                goto LABEL_278;
              }
              __int16 v44 = 130;
LABEL_122:
              int v42 = v61;
              break;
            }

            if (v19 > 2047) {
              goto LABEL_278;
            }
            __int16 v44 = 60;
            break;
          case '>':
            int v61 = v140 + 1;
            if (v141[v140 + 2] == 61)
            {
              if (v19 > 2047) {
                goto LABEL_278;
              }
              __int16 v44 = 131;
              goto LABEL_122;
            }

            if (v19 > 2047) {
              goto LABEL_278;
            }
            __int16 v44 = 62;
            break;
          case '=':
            if (v19 > 2047) {
              goto LABEL_278;
            }
            __int16 v44 = 61;
            break;
          default:
            sub_7454(a1, "incorrect comparison operator");
            return 0LL;
        }

        word_28C5A[v19 + 1] = v44;
        if (v19 >= 2047) {
          goto LABEL_278;
        }
        __int16 v75 = 0;
        uint64_t v76 = v19;
        word_28C5A[v19 + 2] = v142;
        uint64_t v77 = v42 + 1LL;
        int v140 = v77;
        __int16 v142 = 0;
        if ((int)v77 < (int)v16)
        {
          int v78 = v141[v77 + 1];
          if ((v78 - 48) > 9)
          {
            __int16 v75 = 0;
          }

          else
          {
            __int16 v75 = 0;
            uint64_t v79 = v134 - v77;
            unsigned int v80 = &v141[v77 + 2];
            while (1)
            {
              __int16 v75 = v78 + 10 * v75 - 48;
              if (!v79) {
                break;
              }
              int v81 = *v80++;
              LOWORD(v78) = v81;
              --v79;
              LODWORD(v77) = v77 + 1;
            }

            LODWORD(v77) = v16;
          }

LABEL_170:
          int v140 = v77;
          __int16 v142 = v75;
        }

        if (v19 >= 2046) {
          goto LABEL_278;
        }
        v19 += 3;
        word_28C5A[v76 + 3] = v75;
        goto LABEL_186;
      case '$':
        uint64_t v45 = 0LL;
        LODWORD(v46) = v18 + 1;
        uint64_t v47 = &v141[v18 + 2];
        while (2)
        {
          int v49 = *v47++;
          int v48 = v49;
          if (v49 <= 96)
          {
            switch(v48)
            {
              case 'D':
                uint64_t v50 = v45 | 0x100;
                break;
              case 'S':
                uint64_t v50 = v45 | 0x80;
                break;
              case 'U':
                uint64_t v50 = v45 | 0x10;
                break;
              default:
                goto LABEL_103;
            }

        ++v67;
        __int16 v99 = *(int *)(v30 + 16);
        ++v73;
        if (v67 < v99) {
          continue;
        }
        break;
      }

      if (v69)
      {
        *(_WORD *)(v32 + 8 * v99 + 2) = (*(void *)(v32 + 8 * v99) & (~*(_DWORD *)(v36 + 16) << 16)) >> 16;
        unsigned __int16 v102 = v68 ^ 1;
        if ((v72 & 0x80000000) != 0) {
          unsigned __int16 v102 = 1;
        }
        unsigned int v58 = v502;
        if ((v102 & 1) == 0)
        {
          int v103 = *(void *)(v32 + 8LL * v72);
          if (v71 && v70 == 1)
          {
            uint64_t v104 = (unsigned __int16)*(_DWORD *)(v36 + 16) | HIWORD(v103);
            int v105 = 0xFFFFFFFFFFFFLL;
            uint64_t v106 = 48;
          }

          else
          {
            uint64_t v104 = (unsigned __int16)(*(_DWORD *)(v36 + 16) | WORD2(v103));
            int v105 = 0xFFFF0000FFFFFFFFLL;
            uint64_t v106 = 32;
          }

          *(void *)(v32 + 8LL * v72) = v105 & v103 | (v104 << v106);
        }
      }

      else
      {
        unsigned int v58 = v502;
      }

LABEL_91:
            LODWORD(v46) = v46 + 1;
            uint64_t v45 = v50;
            continue;
          }

          break;
        }

        int v51 = v48 - 97;
        uint64_t v50 = 0xFFFFFFFFLL;
        switch(v51)
        {
          case 0:
            goto LABEL_91;
          case 3:
            uint64_t v50 = v45 | 4;
            goto LABEL_91;
          case 11:
            uint64_t v50 = v45 | 2;
            goto LABEL_91;
          case 12:
            uint64_t v50 = v45 | 0x40;
            goto LABEL_91;
          case 15:
            uint64_t v50 = v45 | 8;
            goto LABEL_91;
          case 18:
            uint64_t v50 = v45 | 1;
            goto LABEL_91;
          case 20:
            uint64_t v50 = v45 | 0x20;
            goto LABEL_91;
          case 22:
            uint64_t v50 = v45 | 0x8000000;
            goto LABEL_91;
          case 23:
            uint64_t v50 = v45 | 0x10000000;
            goto LABEL_91;
          case 24:
            uint64_t v50 = v45 | 0x20000000;
            goto LABEL_91;
          case 25:
            uint64_t v50 = v45 | 0x40000000;
            goto LABEL_91;
          default:
            break;
        }

LABEL_103:
        int v140 = v46;
        if (!v45)
        {
          sub_7454(a1, "missing attribute");
          return 0LL;
        }

          if (++v54 == 3) {
            goto LABEL_107;
          }
          goto LABEL_85;
        }

        break;
      }

      while (1)
      {
        int v52 = (uint64_t)&v47[2 * v51 + 7904];
        unsigned __int16 v53 = v47[2 * v51 + 7915];
        if (sub_1729C( (uint64_t)v47,  v46,  (uint64_t)v50,  v53,  v52,  &v158,  &v157,  &v156,  (signed int *)&v153,  (unint64_t *)&v152,  &v151)) {
          break;
        }
        int v51 = *(unsigned int *)(v52 + 16);
        if (!(_DWORD)v51) {
          goto LABEL_83;
        }
      }

      int v19 = (int *)v52;
      LODWORD(v37) = v53;
LABEL_107:
      v159 = v19;
      if ((_DWORD)v37 == 75) {
        goto LABEL_110;
      }
      if ((_DWORD)v37 != 83)
      {
        int v49 = 1;
        goto LABEL_122;
      }

LABEL_127:
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        word_28C5A[v19 + 1] = 36;
        if (v19 == 2047) {
          goto LABEL_278;
        }
        unsigned int v64 = &word_28C5A[v19];
        v64[2] = HIWORD(v45);
        if (v19 >= 2046) {
          goto LABEL_278;
        }
        v64[3] = WORD2(v45);
        if (v19 == 2045) {
          goto LABEL_278;
        }
        word_28C5A[v19 + 4] = WORD1(v45);
        if (v19 >= 2044) {
          goto LABEL_278;
        }
        int v65 = v19 + 4;
        unsigned int v66 = 5;
LABEL_133:
        unint64_t v67 = v19 + (unint64_t)v66;
        word_28C5A[v65 + 1] = v45;
        int v68 = v141[(int)v46 + 1];
        if (v68 == 46)
        {
          int v140 = v46 + 1;
          uint64_t v69 = &word_28C5A[v67];
          v69[1] = 1;
          if ((_DWORD)v67 == 2047) {
            goto LABEL_278;
          }
          int v19 = v67 + 2;
          v69[2] = -1;
          goto LABEL_186;
        }

        __int16 v142 = 0;
        if ((v68 - 48) > 9)
        {
          int v140 = v46;
LABEL_183:
          word_28C5A[(int)v67 + 1] = 1;
          if ((_DWORD)v67 == 2047) {
            goto LABEL_278;
          }
          int v19 = v67 + 2;
          word_28C5A[(int)v67 + 2] = 1;
          goto LABEL_186;
        }

        __int16 v70 = 0;
        uint64_t v71 = v134 - (int)v46;
        uint64_t v72 = &v141[(int)v46 + 2];
        while (1)
        {
          __int16 v70 = v68 + 10 * v70 - 48;
          if (!v71) {
            break;
          }
          int v73 = *v72++;
          LOWORD(v68) = v73;
          --v71;
          LODWORD(v46) = v46 + 1;
        }

        LODWORD(v46) = v16;
LABEL_174:
        int v140 = v46;
        __int16 v142 = v70;
        if (!v70) {
          goto LABEL_183;
        }
        uint64_t v83 = (int)v67 + 1LL;
        word_28C5A[(int)v67 + 1] = v70;
        if (v141[(int)v46 + 1] == 45)
        {
          uint64_t v84 = (int)v46 + 1LL;
          int v85 = v141[v84 + 1];
          __int16 v70 = 0;
          uint64_t v86 = v134 - v84;
          v87 = &v141[v84 + 2];
          while (1)
          {
            __int16 v70 = v85 + 10 * v70 - 48;
            if (!v86) {
              break;
            }
            int v88 = *v87++;
            LOWORD(v85) = v88;
            --v86;
            LODWORD(v84) = v84 + 1;
          }

          LODWORD(v84) = v16;
LABEL_191:
          int v140 = v84;
          __int16 v142 = v70;
          if (!v70)
          {
LABEL_301:
            sub_7454(a1, "invalid range");
            return 0LL;
          }

          int v19 = v67 + 2;
          int v89 = &word_28C5A[(int)v83];
        }

        else
        {
          int v19 = v67 + 2;
          int v89 = &word_28C5A[v83];
        }

        v89[1] = v70;
LABEL_186:
        int v18 = v140;
        if (v140 < (int)v16)
        {
          uint64_t v90 = &v141[v140 + 1];
          while (1)
          {
            unsigned int v91 = *v90++;
            if (v91 > 0x20) {
              break;
            }
            if ((_DWORD)v16 == ++v18) {
              goto LABEL_288;
            }
          }
        }

        if (v18 >= (int)v16)
        {
LABEL_288:
          word_28C5A[0] = v19;
          int v128 = v139;
          if (v139)
          {
            __int16 v129 = v138;
            if (v138 < 1)
            {
              __int16 v129 = 0;
            }

            else
            {
              uint64_t v130 = &word_27C5A;
              uint64_t v131 = v138;
              do
              {
                __int16 v132 = *v128++;
                *v130++ = v132;
                --v131;
              }

              while (v131);
            }

            word_27C58 = v129;
          }

          return sub_BFF4(a1, a2, &word_27C58, word_28C5A, 0LL, 0LL, 0LL, 0LL, a3, a4, (void **)a5);
        }

        int v92 = v19;
        while (2)
        {
          unsigned int v93 = v141[v18 + 1];
          if (v93 < 0x21)
          {
            LOWORD(v19) = v92;
            goto LABEL_288;
          }

          if (v92 >= 2048)
          {
            sub_7454(a1, "Action part in multipass operand too long");
            return 0LL;
          }

          uint64_t v94 = v18;
          if (v141[v18 + 1] <= 0x3Eu)
          {
            switch(v141[v18 + 1])
            {
              case '""':
                int v140 = v94 + 1;
                word_28C5A[v92 + 1] = 34;
                sub_E944(v141, &v140, (unsigned __int16 *)&v143, a1);
                goto LABEL_214;
              case '#':
                int v140 = v18 + 1;
                uint64_t v106 = v140;
                int v107 = v141[v140 + 1];
                if (v107 == 43 || v107 == 45)
                {
                  ++v140;
                  word_28C5A[v92 + 1] = v107;
                  if (v92 >= 2047) {
                    goto LABEL_278;
                  }
                  int v19 = v92 + 2;
                  word_28C5A[v92 + 2] = v142;
                }

                else
                {
                  if (v107 != 61)
                  {
                    sub_7454(a1, "incorrect variable operator in action part");
                    return 0LL;
                  }

                  word_28C5A[v92 + 1] = 61;
                  if (v92 >= 2047) {
                    goto LABEL_278;
                  }
                  __int16 v108 = 0;
                  word_28C5A[v92 + 2] = v142;
                  uint64_t v109 = v106 + 1;
                  int v140 = v109;
                  __int16 v142 = 0;
                  if ((int)v109 < (int)v16)
                  {
                    int v110 = v141[v109 + 1];
                    if ((v110 - 48) > 9)
                    {
                      __int16 v108 = 0;
                    }

                    else
                    {
                      __int16 v108 = 0;
                      uint64_t v111 = v134 - v109;
                      unint64_t v112 = &v141[v109 + 2];
                      while (1)
                      {
                        __int16 v108 = v110 + 10 * v108 - 48;
                        if (!v111) {
                          break;
                        }
                        int v113 = *v112++;
                        LOWORD(v110) = v113;
                        --v111;
                        LODWORD(v109) = v109 + 1;
                      }

                      LODWORD(v109) = v16;
                    }

        if ((*(_DWORD *)(j + 4 * v67) & 1) == 0)
        {
          uint64_t v82 = v69 ^ 1;
          if ((v72 & 0x80000000) != 0) {
            uint64_t v82 = 1;
          }
          if ((v82 & 1) == 0)
          {
            uint64_t v83 = *(void *)(v32 + 8LL * v72);
            if (v71 && v70 == 1)
            {
              uint64_t v84 = (unsigned __int16)*(_DWORD *)(v36 + 16) | HIWORD(v83);
              int v85 = 0xFFFFFFFFFFFFLL;
              uint64_t v86 = 48;
            }

            else
            {
              uint64_t v84 = (unsigned __int16)(*(_DWORD *)(v36 + 16) | WORD2(v83));
              int v85 = 0xFFFF0000FFFFFFFFLL;
              uint64_t v86 = 32;
            }

            *(void *)(v32 + 8LL * v72) = v85 & v83 | (v84 << v86);
          }

          uint64_t v72 = -1;
          goto LABEL_168;
        }

        if (v67 == v72)
        {
          int v68 = 1;
          __int16 v70 = 1;
          uint64_t v74 = v67;
        }

        else
        {
          if (v512
            || (v87 = sub_19718(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v67), v19, v36),
                uint64_t v71 = v520,
                uint64_t v36 = v531,
                v87))
          {
            v70 += v79 ^ 1;
            int v68 = 1;
            uint64_t v74 = v67;
          }

          else
          {
            int v68 = 1;
          }

          uint64_t v32 = a10;
        }

LABEL_275:
                    int v140 = v109;
                    __int16 v142 = v108;
                  }

                  if (v92 >= 2046) {
                    goto LABEL_278;
                  }
                  int v19 = v92 + 3;
                  word_28C5A[v92 + 3] = v108;
                }

                break;
              case '$':
              case '&':
              case '\'':
              case '(':
              case ')':
                goto LABEL_303;
              case '%':
                uint64_t v114 = v18 + 1LL;
                int v115 = v141[v94 + 2];
                if ((v115 & 0xFFFFFFDF) - 65 > 0x19)
                {
                  unsigned __int16 v116 = 0;
                  int v119 = v94 + 1;
                }

                else
                {
                  unsigned __int16 v116 = 0;
                  if (v94 + 2 > v16) {
                    int v117 = v94 + 2;
                  }
                  else {
                    int v117 = v16;
                  }
                  while (1)
                  {
                    uint64_t v118 = &v144[v116++ - 1];
                    v118[1] = v115;
                    int v119 = v114 + 1;
                    if (v114 + 1 >= v16) {
                      break;
                    }
                    int v115 = v141[v114++ + 2];
                    if ((v115 & 0xFFFFFFDF) - 65 > 0x19) {
                      goto LABEL_263;
                    }
                  }

                  int v119 = v117;
                }

LABEL_263:
                __int16 v143 = v116;
                int v140 = v119;
                uint64_t v125 = *a5;
                unsigned int v123 = sub_EAEC((char *)&v143, *a5);
                if (v123)
                {
                  uint64_t v124 = v125 + 8LL * v123 + 31616;
                }

                else
                {
                  uint64_t v124 = v136;
                  if (!v136) {
                    goto LABEL_302;
                  }
                }

                if ((*(_DWORD *)(v124 + 44) - 58) > 2)
                {
LABEL_302:
                  _lou_showString((uint64_t)v144, v116, 0);
                  sub_7454(a1, "%s is not a swap name.");
                  return 0LL;
                }

                word_28C5A[v92 + 1] = 37;
                goto LABEL_268;
              case '*':
                int v19 = v92 + 1;
                uint64_t v120 = &word_28C5A[v92];
                __int16 v121 = 42;
                goto LABEL_252;
              default:
                if (v93 == 59) {
                  goto LABEL_224;
                }
                goto LABEL_303;
            }

            goto LABEL_271;
          }

          if (v141[v18 + 1] > 0x7Au)
          {
            if (v93 != 123 && v93 != 125)
            {
LABEL_303:
              sub_7454(a1, "incorrect operator in action part");
              return 0LL;
            }

LABEL_224:
            uint64_t v100 = v18 + 1LL;
            int v101 = v141[v94 + 2];
            if ((v101 & 0xFFFFFFDF) - 65 > 0x19)
            {
              unsigned __int16 v102 = 0;
              int v105 = v94 + 1;
            }

            else
            {
              unsigned __int16 v102 = 0;
              if (v94 + 2 > v16) {
                int v103 = v94 + 2;
              }
              else {
                int v103 = v16;
              }
              while (1)
              {
                uint64_t v104 = &v144[v102++ - 1];
                v104[1] = v101;
                int v105 = v100 + 1;
                if (v100 + 1 >= v16) {
                  break;
                }
                int v101 = v141[v100++ + 2];
                if ((v101 & 0xFFFFFFDF) - 65 > 0x19) {
                  goto LABEL_254;
                }
              }

              int v105 = v103;
            }

LABEL_254:
            __int16 v143 = v102;
            int v140 = v105;
            uint64_t v122 = *a5;
            unsigned int v123 = sub_EAEC((char *)&v143, *a5);
            if (v123)
            {
              uint64_t v124 = v122 + 8LL * v123 + 31616;
            }

            else
            {
              uint64_t v124 = v136;
              if (!v136) {
                goto LABEL_300;
              }
            }

            if (*(_DWORD *)(v124 + 44) != 69)
            {
LABEL_300:
              int v127 = v102;
              goto LABEL_280;
            }

            word_28C5A[v92 + 1] = v93;
LABEL_268:
            if (v92 >= 2047) {
              goto LABEL_278;
            }
            uint64_t v136 = v124;
            unint64_t v126 = &word_28C5A[v92];
            v126[2] = HIWORD(v123);
            if (v92 == 2046) {
              goto LABEL_278;
            }
            int v19 = v92 + 3;
            v126[3] = v123;
            goto LABEL_271;
          }

          if (v93 == 63)
          {
            int v19 = v92 + 1;
            uint64_t v120 = &word_28C5A[v92];
            __int16 v121 = 63;
LABEL_252:
            v120[1] = v121;
            int v140 = v94 + 1;
LABEL_271:
            int v18 = v140;
            int v92 = v19;
            continue;
          }

          break;
        }

        if (v93 != 64) {
          goto LABEL_303;
        }
        int v140 = v94 + 1;
        sub_E9CC(v141, &v140, &v143, a1);
        word_28C5A[v92 + 1] = 64;
        if (!v143)
        {
          sub_7454(a1, "expected dot pattern after @ operand in action part");
          return 0LL;
        }

LABEL_214:
        if (v92 >= 2047) {
          goto LABEL_281;
        }
        uint64_t v95 = (unsigned __int16)v143;
        int v19 = v92 + 2;
        word_28C5A[v92 + 2] = v143;
        if (!v95) {
          goto LABEL_271;
        }
        uint64_t v96 = (2046 - v92);
        unsigned int v97 = &word_28C5A[v19 + 1];
        v98 = v144;
        while (v96)
        {
          __int16 v99 = *v98++;
          *v97++ = v99;
          ++v19;
          --v96;
          if (!--v95) {
            goto LABEL_271;
          }
        }

LABEL_281:
        sub_7454(a1, "@ operand in action part of multipass operand too long");
        return 0LL;
      case '%':
        uint64_t v46 = v18 + 1LL;
        int v52 = v141[v46 + 1];
        if ((v52 & 0xFFFFFFDF) - 65 > 0x19)
        {
          unsigned __int16 v53 = 0;
          goto LABEL_125;
        }

        unsigned __int16 v53 = 0;
        if (v20 + 2 > v16) {
          int v54 = v20 + 2;
        }
        else {
          int v54 = v16;
        }
        while (1)
        {
          uint64_t v55 = &v144[v53++ - 1];
          v55[1] = v52;
          int v56 = v46 + 1;
          if (v46 + 1 >= v16) {
            break;
          }
          int v52 = v141[v46++ + 2];
          if ((v52 & 0xFFFFFFDF) - 65 > 0x19) {
            goto LABEL_124;
          }
        }

        int v56 = v54;
LABEL_124:
        LODWORD(v46) = v56;
LABEL_125:
        __int16 v143 = v53;
        int v140 = v46;
        uint64_t v62 = *a5;
        uint64_t v63 = sub_C964((unsigned __int16 *)&v143, *a5);
        if (v63)
        {
          uint64_t v45 = (uint64_t)v63[1];
          goto LABEL_127;
        }

        LODWORD(v45) = sub_EAEC((char *)&v143, v62);
        if ((_DWORD)v45)
        {
          uint64_t v74 = v62 + 8LL * v45 + 31616;
        }

        else
        {
          uint64_t v74 = v136;
          if (!v136) {
            goto LABEL_298;
          }
        }

        if ((*(_DWORD *)(v74 + 44) - 58) > 2)
        {
LABEL_298:
          _lou_showString((uint64_t)v144, v53, 0);
          sub_7454(a1, "%s is neither a class name nor a swap name.");
          return 0LL;
        }

        if (v19 >= 2048
          || (word_28C5A[v19 + 1] = 37, v19 == 2047)
          || (uint64_t v136 = v74, word_28C5A[v19 + 2] = WORD1(v45), v19 > 2045))
        {
LABEL_278:
          sub_7454(a1, "multipass operand too long");
          return 0LL;
        }

        int v65 = v19 + 2;
        unsigned int v66 = 3;
        goto LABEL_133;
      case '&':
      case '\'':
      case '(':
      case ')':
      case '*':
      case '+':
      case ',':
      case '-':
      case '.':
        goto LABEL_282;
      case '/':
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        int v23 = &word_28C5A[v19];
        int v22 = v19 + 1;
        __int16 v24 = 47;
        goto LABEL_101;
      default:
        if (v21 != 64) {
          goto LABEL_282;
        }
        int v140 = v20 + 1;
        if (v19 >= 2048) {
          goto LABEL_278;
        }
        word_28C5A[v19 + 1] = 64;
        sub_E9CC(v141, &v140, &v143, a1);
        LODWORD(v31) = (unsigned __int16)v143;
        if (!v143)
        {
          sub_7454(a1, "expected dot pattern after @ operand in test part");
          return 0LL;
        }

LABEL_61:
        if (v19 >= 2047) {
          goto LABEL_195;
        }
        uint64_t v38 = (2046 - v19);
        word_28C5C[v19 + 1] = v31;
        uint64_t v31 = v31;
        uint64_t v39 = &word_28C5C[v19 + 2];
        uint64_t v40 = v144;
        v19 += 2;
        do
        {
          if (!v38)
          {
LABEL_195:
            sub_7454(a1, "@ operand in test part of multipass operand too long");
            return 0LL;
          }

          unsigned __int16 v41 = *v40++;
          *v39++ = v41;
          ++v19;
          --v38;
          --v31;
        }

        while (v31);
        goto LABEL_186;
    }
  }

uint64_t sub_E194(uint64_t a1, int a2, int a3, int a4, void **a5)
{
  uint64_t result = sub_AF0C(a1, v14, (uint64_t)"name operand");
  if ((_DWORD)result)
  {
    uint64_t result = sub_AF0C(a1, v13, (uint64_t)"matches operand");
    if ((_DWORD)result)
    {
      uint64_t result = sub_AF0C(a1, v12, (uint64_t)"replacements operand");
      if ((_DWORD)result)
      {
        if ((a2 & 0xFFFFFFFE) == 0x3A)
        {
          uint64_t result = sub_5640(a1, v16, v13);
          if (!(_DWORD)result) {
            return result;
          }
        }

        else
        {
          uint64_t result = sub_ECCC(a1, v13, (unsigned __int16 *)v16);
          if (!(_DWORD)result) {
            return result;
          }
        }

        if (a2 == 58)
        {
          uint64_t result = sub_5640(a1, v15, v12);
          if (!(_DWORD)result) {
            return result;
          }
        }

        else
        {
          uint64_t result = sub_ECCC(a1, v12, (unsigned __int16 *)v15);
          if (!(_DWORD)result) {
            return result;
          }
        }

        uint64_t result = sub_BFF4(a1, a2, v16, v15, 0LL, 0LL, &v11, 0LL, a3, a4, a5);
        if ((_DWORD)result) {
          return sub_E61C(a1, v14, v11, (uint64_t)*a5) != 0;
        }
      }
    }
  }

  return result;
}

uint64_t sub_E318(uint64_t a1, _WORD *a2)
{
  if (!*a2) {
    return 0LL;
  }
  unsigned int v2 = 0;
  unsigned __int16 v3 = a2 + 1;
  uint64_t v4 = (unsigned __int16)*a2;
  do
  {
    int v5 = *v3++;
    unsigned int v2 = v5 + 16 * v2;
    if ((v2 & 0xF0000000) != 0) {
      unsigned int v2 = v2 & 0xFFFFFFF ^ ((v2 & 0xF0000000) >> 24);
    }
    --v4;
  }

  while (v4);
  uint64_t v6 = *(uint64_t ***)(a1 + 8LL * (v2 % 0x1FFF));
  if (!v6) {
    return 0xFFFFLL;
  }
  while (1)
  {
    uint64_t v7 = (unsigned __int16 *)v6[1];
LABEL_13:
    uint64_t v6 = (uint64_t **)*v6;
    if (!v6) {
      return 0xFFFFLL;
    }
  }

  unsigned __int16 v8 = v7 + 1;
  uint64_t v9 = a2 + 1;
  uint64_t v10 = (unsigned __int16)*a2;
  while (1)
  {
    int v12 = *v9++;
    int v11 = v12;
    int v13 = *v8++;
    if (v11 != v13) {
      break;
    }
    if (!--v10) {
      return *((unsigned int *)v6 + 4);
    }
  }

  if ((_DWORD)v10) {
    goto LABEL_13;
  }
  return *((unsigned int *)v6 + 4);
}

uint64_t sub_E3D8(int *a1, uint64_t a2, unsigned __int16 *a3)
{
  unsigned int v6 = *a3;
  if (*a3)
  {
    unsigned int v7 = 0;
    unsigned __int16 v8 = a3 + 1;
    uint64_t v9 = *a3;
    do
    {
      int v10 = *v8++;
      unsigned int v7 = v10 + 16 * v7;
      if ((v7 & 0xF0000000) != 0) {
        unsigned int v7 = v7 & 0xFFFFFFF ^ ((v7 & 0xF0000000) >> 24);
      }
      --v9;
    }

    while (v9);
    uint64_t v11 = v7 % 0x1FFF;
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  int v12 = *a1;
  int v13 = malloc(0x18uLL);
  uint64_t v14 = v13;
  if (!v13) {
    _lou_outOfMemory();
  }
  *int v13 = *(void *)(a2 + 8 * v11);
  uint64_t v15 = malloc(2LL * v6 + 2);
  v14[1] = v15;
  if (!v15) {
    _lou_outOfMemory();
  }
  _WORD *v15 = v6;
  if (v6) {
    memcpy(v15 + 1, a3 + 1, 2LL * v6);
  }
  *((_DWORD *)v14 + 4) = v12;
  *(void *)(a2 + 8 * v11) = v14;
  uint64_t v16 = (char *)*((void *)a1 + 1);
  if ((*a1 & (*a1 - 1)) == 0)
  {
    uint64_t v16 = (char *)realloc(v16, 32LL * *a1);
    *((void *)a1 + 1) = v16;
  }

  if (!v16) {
    _lou_outOfMemory();
  }
  uint64_t v17 = &v16[16 * *a1];
  *(void *)uint64_t v17 = 0LL;
  *((void *)v17 + 1) = 0xFFFF00000000LL;
  uint64_t result = *a1;
  *a1 = result + 1;
  return result;
}

uint64_t sub_E528(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  unsigned __int16 v6 = a2;
  uint64_t v8 = sub_7A50(a2, *a3);
  if (!v8)
  {
    sub_C760(a1, &v14, 64, (void **)a3);
    uint64_t v9 = *a3 + 8LL * v14;
    uint64_t v8 = v9 + 31616;
    *(_OWORD *)(v9 + 31664) = 0u;
    *(_OWORD *)(v9 + 31648) = 0u;
    *(_OWORD *)(v9 + 31632) = 0u;
    *(_OWORD *)(v9 + 31616) = 0u;
    *(void *)(v9 + 31616) = *(void *)(a1 + 8);
    *(_DWORD *)(v9 + 31624) = *(_DWORD *)(a1 + 24);
    *(_DWORD *)(v9 + 31672) = a4;
    *(_WORD *)(v9 + 31660) = v6;
    int v10 = (unsigned int *)(*a3 + 4 * _lou_charHash(v6) + 18100);
    uint64_t v11 = *v10;
    if ((_DWORD)v11)
    {
      do
      {
        uint64_t v12 = *a3 + 8 * v11 + 31616;
        uint64_t v11 = *(unsigned int *)(*a3 + 8 * v11 + 31628);
      }

      while ((_DWORD)v11);
      *(_DWORD *)(v12 + 12) = v14;
    }

    else
    {
      unsigned int *v10 = v14;
    }
  }

  return v8;
}

uint64_t sub_E61C(uint64_t a1, _WORD *a2, int a3, uint64_t a4)
{
  uint64_t v8 = (char *)malloc(2LL * (unsigned __int16)*a2 + 14);
  uint64_t v9 = v8;
  if (!v8)
  {
    sub_7454(a1, "not enough memory");
    _lou_outOfMemory();
  }

  *(void *)uint64_t v8 = 0LL;
  *((void *)v8 + 1) = 0LL;
  uint64_t v10 = (unsigned __int16)*a2;
  if (*a2)
  {
    uint64_t v11 = 0LL;
    while (1)
    {
      int v12 = (unsigned __int16)a2[v11 + 1];
      if ((v12 & 0xFFFFFFDF) - 65 > 0x19) {
        break;
      }
      *(_WORD *)&v8[v11 * 2 + 14] = v12;
      if (v10 == ++v11) {
        goto LABEL_7;
      }
    }

    sub_7454(a1, "a name may contain only letters");
    free(v9);
    return 0LL;
  }

  else
  {
LABEL_7:
    *((_WORD *)v8 + 6) = v10;
    *((_DWORD *)v8 + 2) = a3;
    *(void *)uint64_t v8 = *(void *)(a4 + 32);
    *(void *)(a4 + 32) = v8;
    return 1LL;
  }

void sub_E6FC(uint64_t a1, _DWORD *a2, void **a3)
{
  uint64_t v4 = *a3;
  uint64_t v5 = *(unsigned int *)*a3;
  unsigned int v6 = *((_DWORD *)*a3 + 1) + 8;
  if (v6 > v5)
  {
    unsigned int v9 = v6 + (v6 >> 3);
    uint64_t v10 = realloc(*a3, v9);
    uint64_t v4 = v10;
    if (!v10)
    {
      sub_7454(a1, "Not enough memory for display table.");
      _lou_outOfMemory();
    }

    bzero((char *)v10 + v5, v9 - v5);
    uint64_t v11 = (void *)qword_27328;
    if (qword_27328)
    {
      do
      {
        uint64_t v11 = (void *)*v11;
      }

      while (v11);
    }

    _DWORD *v4 = v9;
    *a3 = v4;
  }

  if (a2)
  {
    *a2 = ((unint64_t)v4[1] + 0x7FFFFDCD8LL) >> 3;
    v4[1] += 8;
  }

unsigned __int16 *sub_E7D4(unsigned __int16 *result, int *a2, _WORD *a3)
{
  uint64_t v3 = *a2;
  *a3 = 0;
  if ((int)v3 < *result)
  {
    int v4 = 0;
    int v5 = v3 + 1;
    do
    {
      int v6 = result[v3 + 1];
      ++v3;
      *a2 = v5;
      int v4 = v6 + 10 * v4 - 48;
      *a3 = v4;
      ++v5;
    }

    while (v3 < *result);
  }

  return result;
}

uint64_t sub_E830(uint64_t a1, unsigned int a2, int a3, int a4, int a5)
{
  int v5 = (a4 != 0) ^ (a5 != 0);
  if (a2 != 74) {
    int v5 = a2 != 75;
  }
  if (v5 == (a3 == 0)) {
    return 1LL;
  }
  if (a3) {
    uint64_t v8 = "strings";
  }
  else {
    uint64_t v8 = "dots";
  }
  if (a4) {
    unsigned int v9 = "action";
  }
  else {
    unsigned int v9 = "test";
  }
  if (a5) {
    uint64_t v10 = "backward";
  }
  else {
    uint64_t v10 = "forward";
  }
  if (a2 < 0x75)
  {
    uint64_t v11 = off_20358[a2];
  }

  else
  {
    uint64_t v11 = byte_25ADE;
    __sprintf_chk(byte_25ADE, 0, 0x800uLL, "%u", a2);
  }

  sub_7454(a1, "%s are not allowed in the %s part of a %s translation %s rule.", v8, v9, v10, v11);
  return 0LL;
}

void sub_E944(unsigned __int16 *a1, int *a2, unsigned __int16 *a3, uint64_t a4)
{
  *a3 = 0;
  uint64_t v4 = *a2;
  if ((int)v4 >= *a1)
  {
LABEL_9:
    sub_7454(a4, "unterminated string");
    return;
  }

  unsigned __int16 v5 = 0;
  int v6 = v4 + 1;
  while (1)
  {
    int v7 = a1[v4 + 1];
    if (v7 != 28) {
      break;
    }
    LOWORD(v7) = 34;
LABEL_8:
    uint64_t v8 = &a3[v5++];
    *a3 = v5;
    v8[1] = v7;
    ++v4;
    *a2 = v6++;
    if (v4 >= *a1) {
      goto LABEL_9;
    }
  }

  if (v7 != 34)
  {
    if (!a1[v4 + 1]) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  a3[v5 + 1] = 0;
  *a2 = v6;
}

uint64_t sub_E9CC(unsigned __int16 *a1, int *a2, _WORD *a3, uint64_t a4)
{
  int v4 = *a1;
  int v5 = *a2;
  if (*a2 >= v4)
  {
    unsigned __int16 v12 = 0;
  }

  else
  {
    unsigned __int16 v6 = 0;
    int v7 = &a1[v5 + 1];
    while (1)
    {
      int v9 = *v7++;
      int v8 = v9;
      unsigned int v10 = v9 - 48;
      BOOL v11 = v9 != 45 && v10 >= 0xA;
      if (v11 && (v8 | 0x20u) - 97 > 5) {
        break;
      }
      *a2 = ++v5;
      unsigned __int16 v12 = v6 + 1;
      v14[++v6] = v8;
      if (v4 == v5) {
        goto LABEL_13;
      }
    }

    unsigned __int16 v12 = v6;
  }

uint64_t sub_EA94(uint64_t a1, unsigned __int16 *a2, int *a3, _WORD *a4)
{
  return 0LL;
}

uint64_t sub_EAEC(char *__s1, uint64_t a2)
{
  unsigned int v2 = *(uint64_t ***)(a2 + 32);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = __s1 + 2;
  unsigned int v4 = *(unsigned __int16 *)__s1;
  while (v4 != *((unsigned __int16 *)v2 + 6) || memcmp(v3, (char *)v2 + 14, 2LL * v4))
  {
    unsigned int v2 = (uint64_t **)*v2;
    if (!v2) {
      return 0LL;
    }
  }

  return *((unsigned int *)v2 + 2);
}

uint64_t sub_EB54(uint64_t a1, int a2, void *a3, _DWORD *a4)
{
  *a3 = 0LL;
  *a4 = 0;
  if (a2 < 1) {
    return 1LL;
  }
  int v4 = 0;
  int v5 = 0;
  while (2)
  {
    uint64_t v6 = 1LL;
    switch(word_28C5A[v4 + 1])
    {
      case ' ':
      case '%':
      case ';':
        return v6;
      case '!':
      case '*':
      case '+':
      case '-':
      case '?':
        goto LABEL_9;
      case '""':
      case '@':
        int v7 = (unsigned __int16)word_28C5A[v4 + 1 + 1];
        int v8 = v4 + 2;
        if (v5 >= v7)
        {
          int v4 = v8 + v7;
          v5 -= v7;
LABEL_17:
          uint64_t v6 = 1LL;
          if (v4 >= a2) {
            return v6;
          }
          continue;
        }

        *a3 = &word_28C5A[v8 + 1 + v5];
        *a4 = v7 - v5;
        return 1LL;
      case '#':
      case '&':
      case '\'':
      case '(':
      case ')':
      case ',':
      case '.':
      case '/':
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
      case ':':
LABEL_19:
        sub_7454(a1, "unhandled test suboperand: \\x%02x", (unsigned __int16)word_28C5A[v4 + 1]);
        return 0LL;
      case '$':
        int v9 = word_28C5C[v4 + 6];
        if (word_28C5C[v4 + 5] != v9 || v5 < v9) {
          return 1LL;
        }
        v4 += 7;
        v5 -= v9;
        goto LABEL_17;
      case '<':
      case '=':
      case '>':
LABEL_7:
        LODWORD(v6) = 3;
LABEL_9:
        v4 += v6;
        if (v4 >= a2) {
          return 1LL;
        }
        continue;
      default:
        switch(word_28C5A[v4 + 1])
        {
          case 123:
          case 125:
            return v6;
          case 124:
          case 127:
          case 128:
          case 129:
            goto LABEL_19;
          case 126:
            goto LABEL_9;
          case 130:
          case 131:
            goto LABEL_7;
          default:
            switch(word_28C5A[v4 + 1])
            {
              case '[':
              case ']':
                goto LABEL_9;
              case '_':
                v5 += (unsigned __int16)word_28C5A[v4 + 1 + 1];
                v4 += 2;
                goto LABEL_17;
              default:
                goto LABEL_19;
            }
        }
    }
  }

uint64_t sub_ECCC(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3)
{
  unint64_t v6 = 0LL;
  int v7 = 0;
  *a3 = 0;
  v22[0] = 0;
  unint64_t v8 = *a2;
  do
  {
    if (v6 == v8 || (int v9 = a2[v6 + 1], v9 == 44))
    {
      uint64_t result = sub_5AE0(a1, &v20, v22);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v12 = v20;
      unsigned __int16 v13 = v20 + 1;
      uint64_t v14 = *a3;
      unsigned __int16 v15 = v14 + 1;
      *a3 = v14 + 1;
      a3[v14 + 1] = v13;
      if (v12)
      {
        uint64_t v16 = &v21;
        do
        {
          unsigned __int16 v17 = *v16++;
          int v18 = &a3[v15++];
          v18[1] = v17;
          --v12;
        }

        while (v12);
        *a3 = v15;
      }

      int v7 = 0;
      v22[0] = 0;
      unint64_t v8 = *a2;
    }

    else
    {
      unsigned int v10 = &v22[(unsigned __int16)v7++];
      v22[0] = v7;
      v10[1] = v9;
    }
  }

  while (v6++ < v8);
  return 1LL;
}

void _lou_logWidecharBuf(uint64_t a1, char *__s, unsigned __int16 *a3, int a4)
{
  int v8 = 9 * a4;
  size_t v9 = strlen(__s);
  unsigned int v10 = (char *)malloc(v8 + (int)v9 + 3);
  BOOL v11 = v10;
  uint64_t v12 = &v11[v9];
  if (a4 < 1)
  {
    *(_WORD *)uint64_t v12 = 8318;
    unsigned __int16 v17 = v12 + 2;
  }

  else
  {
    uint64_t v13 = a4;
    uint64_t v14 = a4;
    unsigned __int16 v15 = a3;
    do
    {
      int v16 = *v15++;
      v12 += sprintf(v12, "0x%04X ", v16);
      --v14;
    }

    while (v14);
    *(_WORD *)uint64_t v12 = 8318;
    unsigned __int16 v17 = v12 + 2;
    do
    {
      unsigned int v19 = *a3++;
      char v18 = v19;
      if (v19 >= 0x100) {
        char v18 = 32;
      }
      *v17++ = v18;
      --v13;
    }

    while (v13);
  }

  char *v17 = 0;
  _lou_logMessage(a1, "%s", v11);
  free(v11);
}

void _lou_logMessage(uint64_t a1, char *__format, ...)
{
  if (__format)
  {
    if (dword_24F80 <= a1 && off_24F78 != 0LL)
    {
      size_t v5 = vsnprintf(0LL, 0LL, __format, va) + 1LL;
      unint64_t v6 = (char *)malloc(v5);
      if (v6)
      {
        int v7 = v6;
        vsnprintf(v6, v5, __format, va);
        off_24F78(a1, v7);
        free(v7);
      }
    }
  }

const char *(*lou_registerLogCallback( const char *(*result)(uint64_t a1, const char *a2)))(uint64_t a1, const char *a2)
{
  BOOL v1 = sub_EFE4;
  if (result) {
    BOOL v1 = result;
  }
  off_24F78 = v1;
  return result;
}

const char *sub_EFE4(uint64_t a1, const char *a2)
{
  return lou_logPrint("%s", a2);
}

uint64_t lou_setLogLevel(uint64_t result)
{
  dword_24F80 = result;
  return result;
}

unint64_t lou_logFile(char *__s)
{
  unint64_t result = qword_29C60;
  if (qword_29C60)
  {
    unint64_t result = fclose((FILE *)qword_29C60);
    qword_29C60 = 0LL;
  }

  if (__s)
  {
    if (*__s)
    {
      unint64_t result = strlen(__s);
      if (result <= 0xFF)
      {
        if (!byte_29C68) {
          __strcpy_chk(&byte_29C68, __s, 256LL);
        }
        unint64_t result = (unint64_t)fopen(__s, "a");
        qword_29C60 = result;
        if (!result && byte_29C68)
        {
          unint64_t result = (unint64_t)fopen(&byte_29C68, "a");
          qword_29C60 = result;
        }

        if (!result)
        {
          unint64_t result = fprintf(__stderrp, "Cannot open log file %s\n", __s);
          qword_29C60 = (uint64_t)__stderrp;
        }
      }
    }
  }

  return result;
}

const char *lou_logPrint(const char *result, ...)
{
  if (result)
  {
    BOOL v1 = result;
    unsigned int v2 = (FILE *)qword_29C60;
    if (!qword_29C60)
    {
      unsigned int v2 = fopen(&byte_29C68, "a");
      qword_29C60 = (uint64_t)v2;
      if (!v2)
      {
        unsigned int v2 = __stderrp;
        qword_29C60 = (uint64_t)__stderrp;
      }
    }

    vfprintf(v2, v1, va);
    fputc(10, (FILE *)qword_29C60);
    return (const char *)fflush((FILE *)qword_29C60);
  }

  return result;
}

uint64_t lou_logEnd()
{
  uint64_t result = qword_29C60;
  if (qword_29C60) {
    BOOL v1 = qword_29C60 == (void)__stderrp;
  }
  else {
    BOOL v1 = 1;
  }
  if (!v1) {
    uint64_t result = fclose((FILE *)qword_29C60);
  }
  qword_29C60 = 0LL;
  return result;
}

uint64_t lou_backTranslateString( char *a1, unsigned __int16 *a2, _DWORD *a3, _WORD *a4, int *a5, void *a6, void *a7, unsigned int a8)
{
  return _lou_backTranslate(a1, a1, a2, a3, a4, a5, a6, a7, 0LL, 0LL, 0LL, a8, 0LL, 0LL);
}

uint64_t lou_backTranslate( char *a1, unsigned __int16 *a2, _DWORD *a3, _WORD *a4, int *a5, void *a6, void *a7, char *a8, uint64_t a9, int *a10, unsigned int a11)
{
  return _lou_backTranslate(a1, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, 0LL, 0LL);
}

uint64_t _lou_backTranslate( char *a1, char *a2, unsigned __int16 *a3, _DWORD *a4, _WORD *a5, int *a6, void *a7, void *a8, char *a9, uint64_t a10, int *a11, unsigned int a12, uint64_t a13, int *a14)
{
  uint64_t result = 0LL;
  if (!a1) {
    return result;
  }
  unsigned __int16 v17 = a3;
  if (!a3 || !a4 || !a5 || !a6) {
    return result;
  }
  if (!a2) {
    a2 = a1;
  }
  _lou_getTable(a1, a2, (uint64_t *)&v236, &v235);
  if (!v236) {
    return 0LL;
  }
  if (!_lou_isValidMode(a12)) {
    _lou_logMessage(40000LL, "Invalid mode parameter: %d", a12);
  }
  if ((byte_29D68 & 1) == 0) {
    byte_29D68 = 1;
  }
  dword_29D90 = 0;
  qword_29D88 = 0LL;
  uint64_t v21 = *a4;
  uint64_t v203 = a6;
  int v196 = a5;
  if ((int)v21 < 1)
  {
    LODWORD(v22) = 0;
  }

  else
  {
    uint64_t v22 = 0LL;
    while (v17[v22])
    {
      if (v21 == ++v22)
      {
        LODWORD(v22) = *a4;
        break;
      }
    }
  }

  unsigned int v23 = sub_10B38(v22);
  unsigned int v24 = v23;
  uint64_t v25 = qword_29D70[v23];
  if ((_DWORD)v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = v22;
    int v28 = (_WORD *)qword_29D70[v23];
    do
    {
      int v30 = *v17++;
      int v29 = v30;
      if ((a12 & 4) != 0) {
        __int16 DotsForChar = v29 | 0x8000;
      }
      else {
        __int16 DotsForChar = _lou_getDotsForChar(v29, v235);
      }
      *v28++ = DotsForChar;
      --v27;
    }

    while (v27);
  }

  else
  {
    uint64_t v26 = 0LL;
  }

  *(_WORD *)(v25 + 2 * v26) = _lou_getDotsForChar(32, v235);
  unsigned int v232 = v24;
  uint64_t v233 = (_WORD *)v25;
  int v234 = v22;
  uint64_t v32 = v203;
  unsigned int v33 = sub_10B38(*v203);
  __int16 v34 = (_WORD *)qword_29D70[v33];
  unsigned int v35 = *v203;
  unsigned int v229 = v33;
  v230 = v34;
  uint64_t v231 = v35;
  if (a11) {
    int v36 = *a11;
  }
  else {
    int v36 = -1;
  }
  int v227 = 0;
  int v228 = v36;
  int v37 = *v203;
  if (a7)
  {
    memset(a7, 48, v37);
    int v37 = *v203;
  }

  if (a8)
  {
    memset(a8, 42, v37);
    int v37 = *v203;
  }

  uint64_t result = (uint64_t)_lou_allocMem(5, 0, v22, v37);
  __src = (void *)result;
  if (!result) {
    return result;
  }
  if ((int)v236[233] > 1 || v236[234])
  {
    uint64_t result = (uint64_t)_lou_allocMem(6, 0, v22, *v203);
    uint64_t v198 = result;
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)_lou_allocMem(7, 0, v22, *v203);
    if (!result) {
      return result;
    }
  }

  uint64_t v38 = (uint64_t)__src;
  uint64_t v219 = 0LL;
  int v212 = 0;
  if (a13 && a14)
  {
    int v212 = *a14;
    uint64_t v219 = a13;
  }

  __dst = (unsigned int *)result;
  int v39 = 0;
  int v202 = v236[234] == 0;
  int v40 = v236[233];
  unsigned __int16 v41 = &word_28C5C[466];
LABEL_47:
  int v214 = v40;
  uint64_t v215 = v38;
  if (!v40)
  {
    uint64_t v127 = (uint64_t)v236;
    uint64_t v245 = 0LL;
    *(void *)&__int128 v246 = 0LL;
    DWORD2(v246) = 0;
    if (!v236[234]) {
      goto LABEL_389;
    }
    HIDWORD(v246) = 0;
    HIDWORD(v231) = 0;
    _lou_resetPassVariables();
    int v128 = v234;
    if (v234 < 1)
    {
      LODWORD(v25) = 0;
      goto LABEL_389;
    }

    uint64_t v129 = 0LL;
    BOOL v130 = 1;
    while (1)
    {
      int v221 = v39;
      v218 = v233;
      v226 = &v233[(int)v129];
      unint64_t v224 = (char *)sub_10BA8(*v226, v127);
      if (v130)
      {
        int v131 = sub_10C04(v127, v129, 0, (uint64_t)&v232, &v244, (uint64_t *)&v243, &v242, &v241, &v239);
        int v40 = v244;
        if (v131) {
          goto LABEL_328;
        }
        uint64_t v14 = (uint64_t)v243;
      }

      int v132 = 0;
      int v133 = v128 - v129;
      do
      {
        switch(v132)
        {
          case 0:
            if (v133 < 2) {
              break;
            }
            int v134 = sub_10D24(v127, (uint64_t)v224);
            v135 = sub_10BA8((unsigned __int16)v218[(int)v129 + 1], v127);
            int v136 = sub_10D24(v127, (uint64_t)v135);
            int v137 = (unsigned int *)(v127
                                  + 4LL
                                  * (v136
                                                 + (v134 << 8)
                                                 - 1123
LABEL_309:
            uint64_t v138 = *v137;
            if (!(_DWORD)v138) {
              break;
            }
LABEL_310:
            uint64_t v139 = v127 + 8 * v138;
            uint64_t v14 = v139 + 31616;
            int v40 = *(_DWORD *)(v139 + 31660);
            if (v132 == 1)
            {
LABEL_311:
              if (v40 == 75 && sub_10D84(v127, v129, (uint64_t)&v232, 75, v14, &v242, &v241, &v239))
              {
                int v40 = 75;
                goto LABEL_327;
              }
            }

            else
            {
              uint64_t v140 = *(__int16 *)(v139 + 31666);
              if (v133 >= (int)v140 && (_DWORD)v140 != 0)
              {
                uint64_t v142 = 8 * v138 + 31670;
                __int16 v143 = v226;
                while (1)
                {
                  v144 = sub_10BA8(*(unsigned __int16 *)(v127 + v142), v127);
                  int v145 = sub_10D24(v127, (uint64_t)v144);
                  int v146 = *v143++;
                  v147 = sub_10BA8(v146, v127);
                  v142 += 2LL;
                  if (!--v140) {
                    goto LABEL_311;
                  }
                }
              }
            }

            uint64_t v138 = *(unsigned int *)(v14 + 20);
            if (!(_DWORD)v138) {
              break;
            }
            goto LABEL_310;
          case 1:
            if (v133 < 1) {
              break;
            }
            int v133 = 1;
            int v137 = (unsigned int *)(v224 + 20);
            goto LABEL_309;
          case 2:
            int v40 = 83;
            goto LABEL_327;
        }

        ++v132;
      }

      while (v132 != 3);
LABEL_327:
      uint64_t v243 = (unsigned int *)v14;
      int v39 = v221;
      unsigned __int16 v41 = word_28C5C + 932;
      uint64_t v38 = v215;
LABEL_328:
      if (v40 == 75)
      {
        if (v219)
        {
          uint64_t v150 = v243;
          if (v39 < v212) {
            *(void *)(v219 + 8LL * v39++) = v243;
          }
        }

        else
        {
          uint64_t v150 = v243;
        }

        int v40 = 0;
        int v151 = sub_11258( v127,  (_DWORD *)&v246 + 3,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v38,  &v228,  &v227,  (unsigned int *)&v245,  75,  (uint64_t)v150,  v242,  v241,  v239,  v240);
        uint64_t v25 = HIDWORD(v246);
        if (!v151) {
          goto LABEL_389;
        }
      }

      else if (v40 == 83)
      {
        int v40 = 0;
        if (SHIDWORD(v231) >= (int)v231)
        {
          LODWORD(v25) = v129;
          goto LABEL_389;
        }

        *(_DWORD *)(v38 + 4LL * (int)v129) = HIDWORD(v231);
        uint64_t v25 = (v129 + 1);
        HIDWORD(v246) = v129 + 1;
        unsigned __int16 v148 = *v226;
        uint64_t v149 = SHIDWORD(v231);
        ++HIDWORD(v231);
        v230[v149] = v148;
      }

      else
      {
        uint64_t v25 = v129;
        int v40 = 0;
      }

      BOOL v130 = (int)v25 > (int)v129;
      int v128 = v234;
      uint64_t v129 = v25;
    }
  }

  if (v40 != 1)
  {
    uint64_t v152 = (uint64_t)v236;
    uint64_t v245 = 0LL;
    __int128 v246 = 0uLL;
    HIDWORD(v231) = 0;
    _lou_resetPassVariables();
    int v153 = v234;
    if (v234 < 1)
    {
      LODWORD(v25) = 0;
      goto LABEL_380;
    }

    int v154 = 0;
    BOOL v155 = 1;
    while (1)
    {
      if (v155
        && sub_10C04(v152, v154, v40, (uint64_t)&v232, &v244, (uint64_t *)&v243, &v242, &v241, &v239))
      {
        int v156 = v244;
        if ((v244 - 76) < 3)
        {
          if (v219)
          {
            int v157 = v243;
            if (v39 < v212) {
              *(void *)(v219 + 8LL * v39++) = v243;
            }
          }

          else
          {
            int v157 = v243;
          }

          int v158 = sub_11258( v152,  (_DWORD *)&v246 + 3,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v38,  &v228,  &v227,  (unsigned int *)&v245,  v156,  (uint64_t)v157,  v242,  v241,  v239,  v240);
          LODWORD(v25) = HIDWORD(v246);
          if (!v158)
          {
            int v153 = v234;
            goto LABEL_380;
          }

          goto LABEL_354;
        }

        if (v244 != 83) {
          goto LABEL_359;
        }
      }

      if (SHIDWORD(v231) >= (int)v231)
      {
LABEL_359:
        LODWORD(v25) = v154;
LABEL_380:
        if ((int)v25 < v153)
        {
          LOWORD(v168) = v41[1820];
          uint64_t v169 = &v233[(int)v25];
          while (1)
          {
            unsigned __int16 v170 = v168;
            int v171 = *v169++;
            int v168 = v171;
            if (v171 == v170)
            {
              if ((qword_29E40 & 1) == 0) {
                goto LABEL_389;
              }
            }

            else
            {
              qword_29E40 = *((void *)sub_116A8(v168, v152) + 3);
              char v172 = qword_29E40;
              v41[1820] = v168;
              if ((v172 & 1) == 0) {
                goto LABEL_389;
              }
            }

            LODWORD(v25) = v25 + 1;
            if (v153 == (_DWORD)v25)
            {
              LODWORD(v25) = v153;
              goto LABEL_389;
            }
          }
        }

        goto LABEL_390;
      }

      *(_DWORD *)(v38 + 4LL * v154) = HIDWORD(v231);
      LODWORD(v25) = v154 + 1;
      HIDWORD(v246) = v154 + 1;
      __int16 v159 = v233[v154];
      uint64_t v160 = SHIDWORD(v231);
      ++HIDWORD(v231);
      v230[v160] = v159;
LABEL_354:
      BOOL v155 = (int)v25 > v154;
      int v153 = v234;
      int v154 = v25;
    }
  }

  int v42 = v236;
  uint64_t v245 = 0LL;
  *(void *)&__int128 v246 = 0LL;
  DWORD2(v246) = 0;
  int v244 = 0;
  _lou_resetPassVariables();
  translation_directioint n = 0;
  HIDWORD(v231) = 0;
  HIDWORD(v246) = 0;
  int v43 = v234;
  if (v234 < 1)
  {
    LODWORD(v25) = 0;
    goto LABEL_372;
  }

  uint64_t v44 = 0LL;
  LODWORD(v25) = 0;
  int v207 = 0;
  int v208 = 117;
  while (2)
  {
    uint64_t v45 = HIDWORD(v231);
    if (HIDWORD(v231)) {
      int v46 = (unsigned __int16)v230[HIDWORD(v231) - 1];
    }
    else {
      int v46 = 32;
    }
    uint64_t v47 = *((void *)sub_10BA8(v46, (uint64_t)v42) + 3);
    if (HIDWORD(v245) == 2)
    {
      if ((v47 & 0x210) != 0) {
        goto LABEL_61;
      }
      int v48 = 0;
    }

    else
    {
      if (HIDWORD(v245) != 1 || (v47 & 0x10) == 0) {
        goto LABEL_61;
      }
      int v48 = 2;
    }

    HIDWORD(v245) = v48;
LABEL_61:
    int v220 = v39;
    uint64_t v14 = DWORD1(v246);
    if (DWORD1(v246) == 2 && (int)v45 >= 1 && (v47 & 0x4000900) == 0)
    {
      uint64_t v14 = 0LL;
      DWORD1(v246) = 0;
    }

    signed int v225 = v43;
    int v222 = DWORD2(v246);
    uint64_t v49 = (uint64_t)v233;
    uint64_t v50 = &v233[(int)v44];
    int v51 = (char *)sub_116A8((unsigned __int16)*v50, (uint64_t)v42);
    unsigned int v216 = v25;
    if (sub_11C10(v42, &v241, &v238, (uint64_t)&v243, &v244, v210))
    {
      int v52 = v50;
      goto LABEL_67;
    }

    uint64_t v201 = v45;
    int v53 = 0;
    int v54 = v225 - v44;
    uint64_t v211 = v47 & 9;
    BOOL v55 = v211 == 0;
    uint64_t v206 = v47 & 0xB;
    int v56 = (a12 >> 8) & 1;
    if ((v47 & 1) != 0) {
      int v57 = (a12 >> 8) & 1;
    }
    else {
      LOBYTE(v57) = 1;
    }
    char v200 = v57;
    if (v222) {
      LOBYTE(v56) = 1;
    }
    if ((_DWORD)v14) {
      BOOL v55 = 1;
    }
    char v199 = v56 | v55;
    int v213 = v230 - 1;
    uint64_t v58 = v49;
    uint64_t v59 = v47;
    uint64_t v223 = v58;
    int v52 = v50;
    uint64_t v60 = v51;
    unsigned int v217 = v14;
    while (v54 < 2 || (_DWORD)v14 && (v60[25] & 1) != 0)
    {
LABEL_181:
      while (++v53)
      {
        if (v53 == 1)
        {
          if (v54 > 0)
          {
            int v54 = 1;
            int v61 = (unsigned int *)(v51 + 20);
            goto LABEL_87;
          }
        }

        else if (v53 == 2)
        {
          uint64_t v243 = (unsigned int *)&unk_29D98;
          dword_29DC4 = 117;
          int v238 = 117;
          word_29DCC = 1;
          int v241 = 1;
          word_29DCE = *v52;
          word_29DCA = 0;
          goto LABEL_67;
        }
      }
    }

    int v62 = *((unsigned __int16 *)v60 + 22);
    uint64_t v63 = (unsigned __int16 *)sub_116A8(*(unsigned __int16 *)(v58 + 2 * ((int)v44 + 1LL)), (uint64_t)v42);
    uint64_t v60 = v51;
    unsigned int v64 = v63[22] + (v62 << 8);
    int v61 = &v42[(v64 - 1123 * ((3824548 * (unint64_t)v64) >> 32)) + 6781];
    uint64_t v58 = v223;
LABEL_87:
    uint64_t v65 = *v61;
    if (!(_DWORD)v65) {
      goto LABEL_181;
    }
    while (1)
    {
      unsigned int v66 = &v42[2 * v65];
      uint64_t v14 = (uint64_t)(v66 + 7904);
      uint64_t v243 = v66 + 7904;
      int v67 = v66[7915];
      int v238 = v67;
      if (v67 == 74)
      {
        int v68 = (unsigned __int16 *)v66 + 15835;
        uint64_t v69 = (__int16 *)(v14 + 50);
      }

      else
      {
        int v68 = (unsigned __int16 *)v66 + *((__int16 *)v66 + 15833) + 15835;
        uint64_t v69 = (__int16 *)(v14 + 52);
      }

      uint64_t v70 = *v69;
      int v241 = v70;
      BOOL v71 = !(_DWORD)v70 || v54 < (int)v70;
      if (!v71) {
        break;
      }
LABEL_96:
      uint64_t v72 = (_WORD *)v14;
LABEL_110:
      uint64_t v65 = *((unsigned int *)v72 + 5);
      if (!(_DWORD)v65)
      {
        uint64_t v14 = v217;
        uint64_t v58 = v223;
        goto LABEL_181;
      }
    }

    if ((int)v70 >= 1)
    {
      int v73 = v52;
      uint64_t v74 = v70;
      do
      {
        int v76 = (unsigned __int16)*v73++;
        int v75 = v76;
        int v77 = *v68++;
        if (v75 != v77) {
          goto LABEL_96;
        }
      }

      while (--v74);
    }

    else {
      int v78 = *(unsigned __int16 *)(v223 + 2LL * ((int)v44 + (int)v70));
    }
    uint64_t v79 = *((void *)sub_116A8(v78, (uint64_t)v42) + 3);
    uint64_t v80 = *(void *)(v14 + 24);
    if ((v80 & 0xFFFFFFFFFDFFFFFFLL) != 0 && (v80 & v59) == 0
      || (uint64_t v81 = *(void *)(v14 + 32), (v81 & 0xFFFFFFFFFDFFFFFFLL) != 0) && (v81 & v79) == 0)
    {
LABEL_108:
      uint64_t v72 = (_WORD *)v14;
LABEL_109:
      uint64_t v60 = v51;
      goto LABEL_110;
    }

    uint64_t v60 = v51;
    uint64_t v72 = (_WORD *)v14;
    switch(v67)
    {
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 23:
      case 37:
      case 38:
      case 45:
      case 46:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 73:
      case 79:
      case 84:
      case 90:
      case 110:
        goto LABEL_67;
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 20:
      case 21:
      case 22:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 69:
      case 70:
      case 72:
      case 75:
      case 76:
      case 77:
      case 78:
      case 80:
      case 81:
      case 82:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 111:
      case 112:
        goto LABEL_110;
      case 19:
      case 24:
        if ((v59 & 2) != 0) {
          goto LABEL_96;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 0x82) != 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 47:
        uint64_t v82 = 130LL;
        goto LABEL_176;
      case 48:
        int v244 = v70;
        if (!sub_11C10(v42, &v241, &v238, (uint64_t)&v243, &v244, v14))
        {
          uint64_t v72 = v243;
          uint64_t v210 = v14;
          goto LABEL_109;
        }

        uint64_t v210 = v14;
LABEL_67:
        if (v219)
        {
          int v39 = v220;
          if (v220 < v212)
          {
            *(void *)(v219 + 8LL * v220) = v243;
            int v39 = v220 + 1;
          }
        }

        else
        {
          int v39 = v220;
        }

        LODWORD(v25) = v216;
        int v91 = v238;
        if (v238 <= 36)
        {
          if (v238 <= 18)
          {
            switch(v238)
            {
              case 3:
                uint64_t v245 = 1LL;
                DWORD1(v246) = 0;
                int v93 = v241;
                if (v241 < 1) {
                  goto LABEL_247;
                }
                uint64_t v38 = v215;
                uint64_t v94 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v94++ = HIDWORD(v231);
                  --v93;
                }

                while (v93);
                break;
              case 4:
                HIDWORD(v245) = 1;
                DWORD1(v246) = 0;
                int v102 = v241;
                if (v241 < 1) {
                  goto LABEL_247;
                }
                uint64_t v38 = v215;
                int v103 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v103++ = HIDWORD(v231);
                  --v102;
                }

                while (v102);
                break;
              case 5:
                HIDWORD(v245) = 0;
                DWORD1(v246) = 0;
                int v104 = v241;
                if (v241 < 1) {
                  goto LABEL_247;
                }
                uint64_t v38 = v215;
                int v105 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v105++ = HIDWORD(v231);
                  --v104;
                }

                while (v104);
                break;
              case 6:
                *(void *)&__int128 v246 = 1LL;
                int v106 = v241;
                if (v241 < 1) {
                  goto LABEL_247;
                }
                uint64_t v38 = v215;
                int v107 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v107++ = HIDWORD(v231);
                  --v106;
                }

                while (v106);
                break;
              case 7:
                *(void *)&__int128 v246 = 0LL;
                int v108 = v241;
                if (v241 < 1) {
                  goto LABEL_247;
                }
                uint64_t v38 = v215;
                uint64_t v109 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v109++ = HIDWORD(v231);
                  --v108;
                }

                while (v108);
                break;
              default:
                goto LABEL_256;
            }

            goto LABEL_246;
          }

          if (v238 != 19)
          {
            if (v238 == 23)
            {
              DWORD1(v246) = 1;
              HIDWORD(v245) = 0;
              int v110 = v241;
              if (v241 >= 1)
              {
                uint64_t v38 = v215;
                uint64_t v111 = (_DWORD *)(v215 + 4LL * (int)v44);
                uint64_t v44 = (v44 + v241);
                do
                {
                  *v111++ = HIDWORD(v231);
                  --v110;
                }

                while (v110);
                goto LABEL_246;
              }

LABEL_247:
              unsigned __int16 v41 = word_28C5C + 932;
              uint64_t v38 = v215;
              goto LABEL_248;
            }

            if (v238 != 24) {
              goto LABEL_256;
            }
          }

LABEL_206:
          *(void *)((char *)&v246 + 4) = 0x100000000LL;
          int v98 = v241;
          if (v241 >= 1)
          {
            uint64_t v38 = v215;
            __int16 v99 = (_DWORD *)(v215 + 4LL * (int)v44);
            uint64_t v44 = (v44 + v241);
            do
            {
              *v99++ = HIDWORD(v231);
              --v98;
            }

            while (v98);
LABEL_246:
            unsigned __int16 v41 = word_28C5C + 932;
LABEL_248:
            HIDWORD(v246) = v44;
            uint64_t v100 = v44;
            goto LABEL_291;
          }

          goto LABEL_247;
        }

        if (v238 <= 70)
        {
          switch(v238)
          {
            case '%':
            case '&':
            case '.':
              break;
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
              goto LABEL_256;
            case '-':
              DWORD1(v246) = 0;
              break;
            case '/':
              goto LABEL_206;
            default:
              if (v238 == 61)
              {
                uint64_t v245 = 0LL;
                *(void *)((char *)&v246 + 4) = 0LL;
              }

              goto LABEL_256;
          }

          int v95 = v241;
          int v96 = v241 - 1;
          if (v241 < 1)
          {
            unsigned __int16 v41 = word_28C5C + 932;
            uint64_t v38 = v215;
          }

          else
          {
            uint64_t v38 = v215;
            unsigned int v97 = (_DWORD *)(v215 + 4LL * (int)v44);
            uint64_t v44 = (v44 + v241);
            do
            {
              *v97++ = HIDWORD(v231);
              --v95;
            }

            while (v95);
            int v96 = -1;
            unsigned __int16 v41 = word_28C5C + 932;
          }

          int v241 = v96;
          goto LABEL_248;
        }

        if (v238 <= 89)
        {
          if (v238 == 71)
          {
            int v92 = 2;
LABEL_250:
            DWORD1(v246) = v92;
LABEL_256:
            if (!*((_WORD *)v243 + 25))
            {
              uint64_t v14 = v216;
              int v115 = v241;
              uint64_t v100 = (v241 + v44);
              uint64_t v116 = (int)v44;
              unsigned __int16 v41 = word_28C5C + 932;
              uint64_t v38 = v215;
              while (sub_11828( (unsigned __int16)v233[v116],  (uint64_t)v42,  v44,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v215,  &v228,  &v227,  (unsigned int *)&v245))
              {
                LODWORD(v44) = v44 + 1;
                ++v116;
                if (!--v115)
                {
                  HIDWORD(v246) = v100;
                  LODWORD(v25) = v216;
                  goto LABEL_269;
                }
              }

              LODWORD(v100) = v44;
              LODWORD(v25) = v216;
              goto LABEL_362;
            }

            uint64_t v38 = v215;
            unsigned __int16 v41 = &word_28C5C[466];
            if (sub_11908( (unsigned __int16 *)v243 + 27,  *((__int16 *)v243 + 26),  *((__int16 *)v243 + 25),  (uint64_t)v42,  v44,  (uint64_t)&v232,  (uint64_t)&v229,  v215,  &v228,  &v227,  (unsigned int *)&v245))
            {
              uint64_t v100 = (v241 + v44);
              HIDWORD(v246) = v241 + v44;
              goto LABEL_269;
            }

LABEL_361:
            LODWORD(v100) = v44;
            goto LABEL_362;
          }

          if (v238 == 73)
          {
            int v112 = v241;
            int v113 = v241 - 1;
            if (v241 < 1)
            {
              unsigned __int16 v41 = word_28C5C + 932;
              uint64_t v38 = v215;
            }

            else
            {
              uint64_t v38 = v215;
              uint64_t v114 = (_DWORD *)(v215 + 4LL * (int)v44);
              uint64_t v44 = (v44 + v241);
              do
              {
                *v114++ = HIDWORD(v231);
                --v112;
              }

              while (v112);
              int v113 = -1;
              unsigned __int16 v41 = word_28C5C + 932;
            }

            int v241 = v113;
            HIDWORD(v246) = v44;
            if (*((__int16 *)v243 + 25) >= 1)
            {
              int v117 = (unsigned __int16 *)v243 + 27;
              uint64_t v118 = *((unsigned __int16 *)v243 + 25);
              do
              {
                unsigned int v119 = *v117++;
                if (!sub_11828( v119,  (uint64_t)v42,  v44,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v38,  &v228,  &v227,  (unsigned int *)&v245)) {
                  goto LABEL_361;
                }
              }

              while (--v118);
            }

            uint64_t v100 = v44;
LABEL_269:
            if ((v91 - 93) <= 1)
            {
              if (!sub_11B90( (uint64_t)v42,  v100,  (uint64_t)&v232,  (uint64_t)&v229,  (uint64_t)a8,  v38,  &v228,  &v227,  (unsigned int *)&v245)) {
                goto LABEL_362;
              }
              goto LABEL_276;
            }

LABEL_272:
            if (sub_10C04( (uint64_t)v42,  v100,  1,  (uint64_t)&v232,  &v238,  (uint64_t *)&v243,  &v242,  &v237,  &v239))
            {
              int v91 = v238;
              if (v238 == 74)
              {
                sub_11258( (uint64_t)v42,  (_DWORD *)&v246 + 3,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v38,  &v228,  &v227,  (unsigned int *)&v245,  74,  (uint64_t)v243,  v242,  v237,  v239,  v240);
                uint64_t v100 = HIDWORD(v246);
              }
            }

            else
            {
              int v91 = 83;
              int v238 = 83;
            }

        ++v126;
        v133 += 8LL;
        ++v132;
        break;
      }

      if (v127)
      {
        if (v522 && v128 == 1 && v134 != v131)
        {
          uint64_t v160 = *(void *)(v32 + 8LL * v134);
          int v161 = HIDWORD(v160);
          uint64_t v162 = v160 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v36 + 16) | HIWORD(v160)) << 48);
          *(void *)(v32 + 8LL * v134) = v162;
          *(void *)(v32 + 8LL * v134) = v162 & 0xFFFF0000FFFFFFFFLL | ((v161 & (unsigned __int16)~*(_WORD *)(v36 + 16)) << 32);
          *(_DWORD *)(j + 4LL * v134) &= ~4u;
          int v163 = *(void *)v133;
          int v164 = *(void *)v133 & 0xFFFFFFFF0000FFFFLL | *(void *)v133 & (~*(_DWORD *)(v36 + 16) << 16);
          *(void *)int v133 = v164;
          *(void *)int v133 = v164 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v163) & ~*(_WORD *)(v36 + 16)) << 32);
        }

        if (v129)
        {
          unsigned __int16 v165 = *(void *)v133;
          int v166 = *(void *)v133 & 0xFFFFFFFF0000FFFFLL | *(void *)v133 & (~*(_DWORD *)(v36 + 16) << 16);
          *(void *)int v133 = v166;
          *(void *)int v133 = v166 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v165) & ~*(_WORD *)(v36 + 16)) << 32);
        }
      }

LABEL_276:
            if ((int)v100 >= 1)
            {
              int v120 = (unsigned __int16)v233[(v100 - 1)];
              if (v41[1820] == v120)
              {
                LODWORD(v121) = qword_29E40;
              }

              else
              {
                uint64_t v121 = *((void *)sub_116A8(v120, (uint64_t)v42) + 3);
                qword_29E40 = v121;
                v41[1820] = v120;
              }

              BOOL v122 = v91 != 94;
              BOOL v123 = (v122 & v121) == 0;
              int v124 = v207;
              if (!v123) {
                int v124 = HIDWORD(v231);
              }
              int v207 = v124;
            }

            BOOL v125 = (v91 - 62) >= 0xA && (v91 - 83) >= 0x23;
            int v126 = v208;
            if (!v125) {
              int v126 = v91;
            }
            int v208 = v126;
LABEL_291:
            int v43 = v234;
            uint64_t v44 = v100;
            continue;
          }

          if (v238 != 74) {
            goto LABEL_256;
          }
          uint64_t v38 = v215;
          uint64_t result = sub_11258( (uint64_t)v42,  (_DWORD *)&v246 + 3,  a12,  (uint64_t)&v232,  (uint64_t)&v229,  v215,  &v228,  &v227,  (unsigned int *)&v245,  74,  (uint64_t)v243,  v242,  v237,  v239,  v240);
          if (!(_DWORD)result) {
            return result;
          }
          uint64_t v100 = HIDWORD(v246);
LABEL_219:
          unsigned __int16 v41 = &word_28C5C[466];
          goto LABEL_272;
        }

        if (v238 > 107)
        {
          if (v238 == 108)
          {
            DWORD1(v246) = 0;
            goto LABEL_256;
          }

          if (v238 != 117) {
            goto LABEL_256;
          }
          unsigned int v101 = (unsigned __int16)*v52;
          uint64_t v38 = v215;
          if (!sub_11B10(v101, a12, (uint64_t)&v229, v44, v215))
          {
            LODWORD(v100) = v44;
            unsigned __int16 v41 = word_28C5C + 932;
            goto LABEL_362;
          }

          uint64_t v100 = (v44 + 1);
          HIDWORD(v246) = v44 + 1;
          goto LABEL_219;
        }

        if (v238 != 90)
        {
          if (v238 == 106)
          {
            int v92 = 1;
            goto LABEL_250;
          }

          goto LABEL_256;
        }

        if (v208 != 90
          || sub_11B90( (uint64_t)v42,  v44,  (uint64_t)&v232,  (uint64_t)&v229,  (uint64_t)a8,  v215,  &v228,  &v227,  (unsigned int *)&v245))
        {
          goto LABEL_256;
        }

        LODWORD(v100) = v44;
        unsigned __int16 v41 = word_28C5C + 932;
        uint64_t v38 = v215;
LABEL_362:
        int v43 = v234;
LABEL_363:
        if (v207 && (int)v100 < v43)
        {
          int v161 = (unsigned __int16)v233[(int)v100];
          if (v41[1820] == v161)
          {
            LOBYTE(v162) = qword_29E40;
          }

          else
          {
            uint64_t v162 = *((void *)sub_116A8((unsigned __int16)v233[(int)v100], (uint64_t)v42) + 3);
            qword_29E40 = v162;
            v41[1820] = v161;
          }

          int v40 = v214;
          if ((v162 & 1) != 0) {
            LODWORD(v25) = v100;
          }
          else {
            HIDWORD(v231) = v207;
          }
        }

        else
        {
          LODWORD(v25) = v100;
          int v40 = v214;
        }

LABEL_372:
        if ((int)v25 < v43)
        {
          LOWORD(v163) = v41[1820];
          int v164 = &v233[(int)v25];
          do
          {
            unsigned __int16 v165 = v163;
            int v166 = *v164++;
            int v163 = v166;
            if (v166 == v165)
            {
              if ((qword_29E40 & 1) == 0) {
                goto LABEL_389;
              }
            }

            else
            {
              qword_29E40 = *((void *)sub_116A8(v163, (uint64_t)v42) + 3);
              char v167 = qword_29E40;
              v41[1820] = v163;
              if ((v167 & 1) == 0) {
                goto LABEL_389;
              }
            }

            LODWORD(v25) = v25 + 1;
          }

          while (v43 != (_DWORD)v25);
          LODWORD(v25) = v43;
        }

LABEL_389:
        uint64_t v32 = v203;
LABEL_390:
        *(_DWORD *)(v38 + 4LL * (int)v25) = HIDWORD(v231);
        if ((void *)v38 != __src)
        {
          memcpy(__dst, __src, 4LL * (int)*a4 + 4);
          if ((*a4 & 0x80000000) != 0) {
            goto LABEL_403;
          }
          uint64_t v173 = 0LL;
          int v174 = v234;
          while (1)
          {
            uint64_t v175 = __dst[v173];
            int v176 = (_DWORD *)v38;
            if ((v175 & 0x80000000) == 0)
            {
              if ((int)v175 >= (int)v25)
              {
                if ((_DWORD)v175 != (_DWORD)v25 || (int v176 = (_DWORD *)(v38 + 4LL * v25), (int)v25 < v174))
                {
                  *a4 = v173;
                  *((_DWORD *)__src + v173) = HIDWORD(v231);
                  goto LABEL_403;
                }
              }

              else
              {
                int v176 = (_DWORD *)(v38 + 4 * v175);
              }
            }

            *((_DWORD *)__src + v173) = *v176;
            BOOL v71 = v173++ < (int)*a4;
            if (!v71) {
              goto LABEL_403;
            }
          }
        }

        uint64_t v38 = v198;
        if ((int)v25 < v234)
        {
          *a4 = v25;
          uint64_t v38 = v198;
        }

LABEL_403:
        if (v40 > v202)
        {
          if (v232 <= 2) {
            *((_DWORD *)&qword_29D88 + v232) = 0;
          }
          --v40;
          unsigned int v232 = v229;
          uint64_t v233 = v230;
          int v234 = HIDWORD(v231);
          unsigned int v177 = sub_10B38(*v32);
          v178 = (_WORD *)qword_29D70[v177];
          unsigned int v179 = *v32;
          unsigned int v229 = v177;
          v230 = v178;
          uint64_t v231 = v179;
          goto LABEL_47;
        }

        int v180 = HIDWORD(v231);
        v181 = v196;
        if (SHIDWORD(v231) >= 1)
        {
          v182 = v230;
          uint64_t v183 = HIDWORD(v231);
          do
          {
            __int16 v184 = *v182++;
            *v181++ = v184;
            --v183;
          }

          while (v183);
        }

        int *v32 = v180;
        if (a10)
        {
          int v185 = *a4;
          if ((int)*a4 < 1)
          {
            int v188 = -1;
            int v187 = -1;
          }

          else
          {
            uint64_t v186 = 0LL;
            int v187 = -1;
            int v188 = -1;
            do
            {
              int v189 = *((_DWORD *)__src + v186);
              if (v189 > v187)
              {
                int v190 = v188 & ~(v188 >> 31);
                do
                {
                  if ((v187 & 0x80000000) == 0 && v187 < *v32)
                  {
                    *(_DWORD *)(a10 + 4LL * v187) = v190;
                    int v189 = *((_DWORD *)__src + v186);
                  }

                  ++v187;
                }

                while (v187 < v189);
                int v185 = *a4;
                int v188 = v186;
              }

              ++v186;
            }

            while (v186 < v185);
            int v180 = *v32;
          }

          uint64_t v191 = v187 & ~(v187 >> 31);
          if ((int)v191 < v180)
          {
            do
              *(_DWORD *)(a10 + 4 * v191++) = v188;
            while (*v32 > (int)v191);
          }
        }

        if (a9 && (int)*a4 >= 1)
        {
          uint64_t v192 = 0LL;
          do
          {
            int v193 = *((_DWORD *)__src + v192);
            if (v193 < 0)
            {
              int v193 = 0;
            }

            else if (v193 >= *v32)
            {
              int v193 = *v32 - 1;
            }

            *(_DWORD *)&a9[4 * v192++] = v193;
          }

          while (v192 < (int)*a4);
        }

        if (a11)
        {
          uint64_t v194 = *a11;
          if ((_DWORD)v194 != -1)
          {
            int v195 = (int *)&a9[4 * v194];
            if (!a9) {
              int v195 = &v228;
            }
            *a11 = *v195;
          }
        }

        if (a14) {
          *a14 = v39;
        }
        return 1LL;
      case 71:
        uint64_t v72 = (_WORD *)v14;
        if (!v217) {
          goto LABEL_110;
        }
        goto LABEL_67;
      case 74:
        int v83 = sub_10D84((uint64_t)v42, v44, (uint64_t)&v232, 74, v14, &v242, &v237, &v239);
        goto LABEL_157;
      case 83:
        if ((v59 & 0x100) != 0 && (v79 & 0x100) != 0)
        {
          uint64_t v72 = (_WORD *)v14;
        }

        goto LABEL_67;
      case 91:
        if ((v199 & 1) != 0) {
          goto LABEL_96;
        }
        goto LABEL_140;
      case 92:
        if ((v59 & 0x100) != 0) {
          goto LABEL_96;
        }
        if ((v59 & 2) != 0) {
          goto LABEL_67;
        }
        goto LABEL_151;
      case 93:
      case 94:
        if (!v211) {
          goto LABEL_96;
        }
        if ((a12 & 0x100) != 0) {
          goto LABEL_67;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 1) == 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 95:
        if ((v200 & 1) != 0 || v208 == 94) {
          goto LABEL_96;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 1) != 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 96:
        if (!v211) {
          goto LABEL_96;
        }
LABEL_140:
        if ((v79 & 1) != 0) {
          goto LABEL_67;
        }
        goto LABEL_156;
      case 97:
        uint64_t v72 = (_WORD *)v14;
        if (!v211) {
          goto LABEL_110;
        }
        goto LABEL_67;
      case 98:
        if (!v206) {
          goto LABEL_96;
        }
        goto LABEL_156;
      case 99:
        if (!v211) {
          goto LABEL_96;
        }
        goto LABEL_151;
      case 100:
        if (!v206) {
          goto LABEL_96;
        }
        goto LABEL_151;
      case 101:
        if ((v59 & 2) == 0) {
          goto LABEL_96;
        }
LABEL_151:
        int v84 = sub_11D38((uint64_t)v42, v44, a12, (uint64_t)&v232, v70);
        uint64_t v60 = v51;
        uint64_t v72 = (_WORD *)v14;
        if (!v84) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 102:
        uint64_t v72 = (_WORD *)v14;
        if ((v59 & 2) == 0) {
          goto LABEL_110;
        }
        goto LABEL_67;
      case 103:
        if ((v59 & 2) == 0) {
          goto LABEL_96;
        }
        goto LABEL_156;
      case 104:
        uint64_t v85 = v201;
        if (!(_DWORD)v201) {
          goto LABEL_67;
        }
        do
        {
          uint64_t v86 = v85 - 1;
          uint64_t v87 = *((void *)sub_10BA8((unsigned __int16)v213[v85], (uint64_t)v42) + 3);
          int v88 = (v87 & 0xC6) != 0;
          if ((v87 & 1) != 0) {
            int v88 = 2;
          }
          uint64_t v85 = v86;
        }

        while (!v88);
        if (v88 != 2) {
          goto LABEL_108;
        }
        goto LABEL_67;
      case 105:
LABEL_156:
        int v83 = sub_11D38((uint64_t)v42, v44, a12, (uint64_t)&v232, v70);
LABEL_157:
        uint64_t v60 = v51;
        uint64_t v72 = (_WORD *)v14;
        if (v83) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 106:
        if (!v211) {
          goto LABEL_96;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 0x180) != 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 107:
        if ((v59 & 4) == 0) {
          goto LABEL_96;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 0x100) != 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 108:
        if (!v217) {
          goto LABEL_96;
        }
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & 0x100) == 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 109:
        uint64_t v82 = 260LL;
LABEL_176:
        uint64_t v72 = (_WORD *)v14;
        if ((v79 & v82) != 0) {
          goto LABEL_67;
        }
        goto LABEL_110;
      case 113:
        int v89 = &v42[2 * *(unsigned int *)(v14 + 40)];
        BOOL v90 = _lou_pattern_check( v223,  v44 + *(__int16 *)(v14 + 52),  v225,  1LL,  (uint64_t)v89 + 2 * *((unsigned __int16 *)v89 + 15808) + 31616,  (uint64_t)v42);
        uint64_t v72 = (_WORD *)v14;
        uint64_t v60 = v51;
        if (v90) {
          goto LABEL_67;
        }
        goto LABEL_110;
      default:
        goto LABEL_96;
    }
  }

uint64_t sub_10B38(int a1)
{
  uint64_t v1 = 0LL;
  while (*((_DWORD *)&qword_29D88 + v1))
  {
    if (++v1 == 3) {
      _lou_outOfMemory();
    }
  }

  qword_29D70[v1] = _lou_allocMem(4, v1, 0, a1);
  *((_DWORD *)&qword_29D88 + v1) = 1;
  return v1;
}

void *sub_10BA8(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if ((_DWORD)v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!(_DWORD)v4) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t result = &unk_24F88;
    word_24FB4 = a1;
  }

  return result;
}

uint64_t sub_10C04( uint64_t a1, int a2, int a3, uint64_t a4, int *a5, uint64_t *a6, uint64_t *a7, int *a8, _DWORD *a9)
{
  uint64_t v9 = *(unsigned int *)(a1 + 4LL * a3 + 22612);
  if (!(_DWORD)v9) {
    return 0LL;
  }
  while (2)
  {
    uint64_t v17 = a1 + 8 * v9 + 31616;
    *a6 = v17;
    int v18 = *(_DWORD *)(v17 + 44);
    *a5 = v18;
    switch(v18)
    {
      case 'J':
        if (a3 == 1) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 'K':
        if (!a3) {
          goto LABEL_12;
        }
        goto LABEL_13;
      case 'L':
        if (a3 != 2) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 'M':
        if (a3 != 3) {
          goto LABEL_13;
        }
        goto LABEL_12;
      case 'N':
        if (a3 != 4) {
          goto LABEL_13;
        }
LABEL_12:
        if (!sub_10D84(a1, a2, a4, v18, *a6, a7, a8, a9))
        {
LABEL_13:
          uint64_t v9 = *(unsigned int *)(*a6 + 20);
          if (!(_DWORD)v9) {
            return 0LL;
          }
          continue;
        }

        return 1LL;
      default:
        goto LABEL_13;
    }
  }

uint64_t sub_10D24(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  if ((v2 & 0x10) == 0)
  {
LABEL_2:
    uint64_t v3 = a2;
    return *(unsigned __int16 *)(v3 + 44);
  }

  uint64_t v4 = *(unsigned int *)(a2 + 48);
  if ((_DWORD)v4) {
    uint64_t v3 = a1 + 8 * v4 + 31616;
  }
  else {
    uint64_t v3 = a2;
  }
  unint64_t v5 = v2 & 0xFFFFFFFFFFFFFFEFLL;
  if ((v5 & ~*(void *)(v3 + 32)) != 0)
  {
    while (1)
    {
      uint64_t v6 = *(unsigned int *)(v3 + 52);
      if (!(_DWORD)v6) {
        break;
      }
      uint64_t v7 = a1 + 8 * v6;
      uint64_t v3 = v7 + 31616;
      if ((v5 & ~*(void *)(v7 + 31648)) == 0) {
        return *(unsigned __int16 *)(v3 + 44);
      }
    }

    goto LABEL_2;
  }

  return *(unsigned __int16 *)(v3 + 44);
}

uint64_t sub_10D84(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5, uint64_t *a6, int *a7, _DWORD *a8)
{
  *a6 = a5 + 2LL * *(__int16 *)(a5 + 50) + 54;
  *a7 = 0;
  a8[3] = a2;
  *a8 = a2;
  a8[1] = -1;
  int v8 = *a7;
  int v9 = *(__int16 *)(a5 + 52);
  uint64_t v10 = 1LL;
  if (*a7 < v9)
  {
    BOOL v11 = a8;
    uint64_t v14 = a5;
    LODWORD(v16) = a2;
    uint64_t v17 = a1;
    BOOL v18 = 0;
    uint64_t v19 = a1 + 31670;
    do
    {
      int v59 = 1;
      int v20 = *(_DWORD *)(a3 + 16);
      uint64_t v21 = *a6;
      unsigned int v22 = *(unsigned __int16 *)(*a6 + 2LL * v8);
      if (v22 > 0x5A)
      {
        switch(*(_WORD *)(*a6 + 2LL * v8))
        {
          case '[':
            v11[1] = v16;
            goto LABEL_49;
          case '\\':
          case '^':
            goto LABEL_18;
          case ']':
            v11[2] = v16;
LABEL_49:
            int v24 = *a7 + 1;
            goto LABEL_76;
          case '_':
            LODWORD(v16) = v16 - *(unsigned __int16 *)(v21 + 2LL * v8 + 2);
            if ((int)v16 < 0)
            {
              LODWORD(v16) = 0;
              int v59 = 0;
            }

            int v24 = v8 + 2;
            goto LABEL_76;
            if ((_DWORD)v16) {
              goto LABEL_54;
            }
            goto LABEL_55;
          default:
            if (v22 == 126)
            {
              if ((_DWORD)v16 != v20) {
LABEL_54:
              }
                int v59 = 0;
LABEL_55:
              int v24 = v8 + 1;
              goto LABEL_76;
            }

LABEL_18:
            break;
        }
      }

      else
      {
        switch(*(_WORD *)(*a6 + 2LL * v8))
        {
          case ' ':
            *a7 = v8 + 1;
            v11[3] = v16;
            if (v11[1] == -1)
            {
              v11[1] = *v11;
              v11[2] = v16;
            }

            return 1LL;
          case '!':
            BOOL v18 = !v18;
            *a7 = ++v8;
            continue;
          case '""':
            goto LABEL_10;
          case '#':
            goto LABEL_18;
          case '$':
            uint64_t v56 = v19;
            uint64_t v57 = v14;
            int v28 = (unsigned __int16 *)(v21 + 2LL * v8);
            unint64_t v29 = v28[4] | ((((unint64_t)v28[1] << 32) | ((unint64_t)v28[2] << 16) | v28[3]) << 16);
            if (v28[5])
            {
              uint64_t v30 = v17;
              BOOL v55 = v11;
              unsigned int v31 = 0;
              uint64_t v32 = (int)v16;
              do
              {
                uint64_t v17 = v30;
                if (v32 >= *(int *)(a3 + 16)
                  || ((int v33 = *(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v32), a4 != 75)
                    ? (__int16 v34 = sub_116A8(v33, v30))
                    : (__int16 v34 = sub_10BA8(v33, v30)),
                      (v34[3] & v29) == 0))
                {
                  LODWORD(v16) = v16 + v31;
                  int v59 = 0;
                  BOOL v11 = v55;
                  goto LABEL_75;
                }

                ++v32;
                ++v31;
                uint64_t v21 = *a6;
                int v8 = *a7;
                unsigned int v35 = *(unsigned __int16 *)(*a6 + 2LL * (*a7 + 5));
              }

              while (v31 < v35);
              LODWORD(v16) = v16 + v31;
              if (!v59)
              {
                BOOL v11 = v55;
                goto LABEL_74;
              }

              BOOL v11 = v55;
            }

            else
            {
              uint64_t v30 = v17;
              unsigned int v35 = 0;
            }

            if (v35 < *(unsigned __int16 *)(v21 + 2LL * (v8 + 6)))
            {
              uint64_t v16 = (int)v16;
              do
              {
                int v52 = *(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v16);
                int v53 = a4 == 75 ? sub_10BA8(v52, v30) : sub_116A8(v52, v30);
                if ((v53[3] & v29) == 0) {
                  break;
                }
                ++v16;
                ++v35;
              }

              while (v35 < *(unsigned __int16 *)(*a6 + 2LL * *a7 + 12));
            }

LABEL_74:
            uint64_t v17 = v30;
LABEL_75:
            int v24 = *a7 + 7;
            uint64_t v19 = v56;
            uint64_t v14 = v57;
            break;
          case '%':
            int v36 = 0;
            uint64_t v37 = v21 + 2LL * v8;
            uint64_t v38 = *(unsigned __int16 *)(v37 + 4);
            unint64_t v39 = (8 * v38) | ((unint64_t)*(unsigned __int16 *)(v37 + 2) << 19);
            uint64_t v40 = *(__int16 *)(v17 + v39 + 31666);
            uint64_t v41 = (int)v16;
            do
            {
              if ((int)v40 < 1)
              {
                LODWORD(v42) = 0;
              }

              else
              {
                uint64_t v42 = 0LL;
                while (*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v41) != *(unsigned __int16 *)(v19 + v39 + 2 * v42))
                {
                  if (v40 == ++v42) {
                    goto LABEL_56;
                  }
                }
              }

              if ((_DWORD)v42 == (_DWORD)v40)
              {
LABEL_56:
                int v50 = 0;
                goto LABEL_57;
              }

              ++v41;
              ++v36;
            }

            while (v36 != 40);
            uint64_t v43 = v21 + 2LL * v8;
            if ((_DWORD)v38 == *(unsigned __int16 *)(v43 + 6) || (unsigned int v44 = *(unsigned __int16 *)(v43 + 8), v44 < 0x29))
            {
              int v50 = 1;
              LODWORD(v16) = v16 + 40;
            }

            else
            {
              uint64_t v16 = (int)v16 + 40;
              uint64_t v45 = (unsigned __int16 *)(v19 + v39);
              int v46 = 40;
              while ((int)v40 < 1)
              {
LABEL_46:
                ++v16;
                if (++v46 == v44) {
                  goto LABEL_47;
                }
              }

              uint64_t v47 = v45;
              uint64_t v48 = v40;
              while (1)
              {
                int v49 = *v47++;
                if (!--v48) {
                  goto LABEL_46;
                }
              }

LABEL_76:
        *a7 = v24;
      }

      if (!v18 != (v59 != 0)) {
        return 0LL;
      }
      BOOL v18 = 0;
      int v8 = *a7;
      LOWORD(v9) = *(_WORD *)(v14 + 52);
    }

    while (v8 < (__int16)v9);
    return 1LL;
  }

  return v10;
}

uint64_t sub_11258( uint64_t a1, _DWORD *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _DWORD *a8, unsigned int *a9, int a10, uint64_t a11, uint64_t a12, int a13, unint64_t a14, uint64_t a15)
{
  unsigned __int16 v15 = a8;
  uint64_t v16 = a7;
  uint64_t v17 = a6;
  uint64_t v19 = a4;
  char v20 = a3;
  int v22 = a13;
  uint64_t v23 = a14;
  unint64_t v24 = HIDWORD(a14);
  int v61 = *(_DWORD *)(a5 + 20);
  uint64_t result = sub_11708(a14, SHIDWORD(a14), a1, a3, a4, a5, a6, a7, a8, a9, a10);
  if ((_DWORD)result)
  {
    int v60 = *(_DWORD *)(a5 + 20);
    uint64_t v63 = a15;
    if ((int)v24 < (int)a15)
    {
      uint64_t v26 = (_DWORD *)(v17 + 4 * (v23 >> 32));
      uint64_t v27 = (int)a15 - (v23 >> 32);
      do
      {
        *v26++ = *(_DWORD *)(a5 + 20);
        --v27;
      }

      while (v27);
    }

    if (*(__int16 *)(a11 + 52) > v22)
    {
      uint64_t v55 = v23 >> 32;
      uint64_t v54 = a1 + 31616;
      int v59 = v63;
      uint64_t v28 = a11;
      int v53 = v16;
      uint64_t v56 = v17;
      uint64_t v58 = v19;
      char v57 = v20;
      while (1)
      {
        unsigned int v29 = *(unsigned __int16 *)(a12 + 2LL * v22);
        if (v29 <= 0x29)
        {
          if (v29 == 34) {
            goto LABEL_38;
          }
          if (v29 != 37)
          {
LABEL_46:
            uint64_t result = _lou_handlePassVariableAction(a12, &a13);
            if (!(_DWORD)result) {
              return result;
            }
            int v22 = a13;
            goto LABEL_52;
          }

          LODWORD(v30) = v24;
          if ((int)v24 < (int)v63)
          {
            int v31 = 0;
            uint64_t v32 = 0LL;
            unint64_t v33 = (8LL * *(unsigned __int16 *)(a12 + 2LL * v22 + 4)) | ((unint64_t)*(unsigned __int16 *)(a12 + 2LL * v22 + 2) << 19);
            unint64_t v34 = v54 + v33;
            __int16 v35 = *(_WORD *)(v54 + v33 + 50);
            uint64_t v36 = v54 + v33 + 2LL * v35 + 54;
            uint64_t v30 = v55;
            unint64_t v37 = a1 + 31670 + v33;
            while (1)
            {
              uint64_t v38 = v35;
              if ((int)v38 < 1)
              {
                LODWORD(v39) = 0;
              }

              else
              {
                uint64_t v39 = 0LL;
                while (*(unsigned __int16 *)(*(void *)(v58 + 8) + 2 * v30) != *(unsigned __int16 *)(v37 + 2 * v39))
                {
                  if (v38 == ++v39) {
                    goto LABEL_49;
                  }
                }
              }

              if ((_DWORD)v39 == (_DWORD)v38) {
                break;
              }
              else {
                uint64_t v40 = 0LL;
              }
              int v41 = *(__int16 *)(v34 + 52);
              if ((int)v40 < v41)
              {
                else {
                  int v42 = 0;
                }
                int v43 = v42 - 1;
                while ((_DWORD)v39 != ++v43)
                {
                  v40 += *(unsigned __int16 *)(v36 + 2 * v40);
                }

                int v52 = a2;
                unsigned int v44 = v15;
                uint64_t v45 = *(unsigned __int16 *)(v36 + 2 * v40) - 1LL;
                int v46 = *(_DWORD *)(a5 + 20);
                *(_DWORD *)(v56 + 4 * v30) = v46;
                memcpy( (void *)(*(void *)(a5 + 8) + 2LL * *(int *)(a5 + 20)),  (const void *)(v36 + 2 * v40 + 2),  2 * v45);
                *(_DWORD *)(a5 + 20) += v45;
                uint64_t v32 = v40;
                int v31 = v39;
                unsigned __int16 v15 = v44;
                a2 = v52;
              }

LABEL_36:
              if ((_DWORD)++v30 == (_DWORD)v63)
              {
                LODWORD(v30) = v63;
                break;
              }

              __int16 v35 = *(_WORD *)(v34 + 50);
            }

LABEL_49:
            uint64_t v16 = v53;
            uint64_t v17 = v56;
            uint64_t v19 = v58;
            uint64_t v28 = a11;
          }

          if (!(_DWORD)v30) {
            return 0LL;
          }
          int v22 = a13 + 3;
          a13 += 3;
          char v20 = v57;
        }

        else
        {
          if (v29 != 42)
          {
            if (v29 == 63)
            {
              ++v22;
            }

            else
            {
              if (v29 != 64) {
                goto LABEL_46;
              }
LABEL_38:
              uint64_t v47 = a12 + 2LL * v22;
              uint64_t v48 = *(unsigned __int16 *)(v47 + 2);
              uint64_t v49 = *(int *)(a5 + 20);
              memcpy((void *)(*(void *)(a5 + 8) + 2 * v49), (const void *)(v47 + 4), 2 * v48);
              int v50 = a13;
              int v51 = *(unsigned __int16 *)(a12 + 2LL * (a13 + 1));
              *(_DWORD *)(a5 + 20) += v51;
              int v22 = v50 + v51 + 2;
            }

            a13 = v22;
            goto LABEL_52;
          }

          if (v60 - v61 >= 1)
          {
            memmove( (void *)(*(void *)(a5 + 8) + 2LL * v61),  (const void *)(*(void *)(a5 + 8) + 2LL * v60),  2LL * (v60 - v61));
            *(_DWORD *)(a5 + 20) -= v60 - v61;
            int v60 = v61;
          }

          uint64_t v28 = a11;
          uint64_t result = sub_11708(v24, v63, a1, v20, v19, a5, v17, v16, v15, a9, a10);
          if (!(_DWORD)result) {
            return result;
          }
          int v22 = ++a13;
          int v59 = HIDWORD(v63);
        }

      uint64_t v45 = *(unsigned __int16 *)(a5 + 2 * a6 + 4);
    }

    if (*a2 == v51) {
      return 0LL;
    }
  }

  else {
    return a7;
  }
}

LABEL_52:
      }
    }

    int v59 = v63;
LABEL_55:
    *a2 = v59;
    return 1LL;
  }

  return result;
}

void *sub_116A8(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if ((_DWORD)v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!(_DWORD)v4) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t result = &unk_24FC8;
    word_24FF4 = a1;
  }

  return result;
}

uint64_t sub_11708( int a1, int a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, unsigned int *a10, int a11)
{
  int v14 = a1;
  if (a11 != 74)
  {
    if (a2 > a1)
    {
      int v20 = *(_DWORD *)(a6 + 20);
      if (a2 - a1 + v20 > *(_DWORD *)(a6 + 16)) {
        return 0LL;
      }
      uint64_t v21 = *(void *)(a6 + 8);
      int v22 = (_DWORD *)(a7 + 4LL * a1);
      uint64_t v23 = (__int16 *)(*(void *)(a5 + 8) + 2LL * a1);
      uint64_t v24 = a2 - (uint64_t)a1;
      do
      {
        *v22++ = v20;
        __int16 v25 = *v23++;
        uint64_t v26 = *(int *)(a6 + 20);
        *(_WORD *)(v21 + 2 * v26) = v25;
        int v20 = v26 + 1;
        *(_DWORD *)(a6 + 20) = v26 + 1;
        --v24;
      }

      while (v24);
    }

    return 1LL;
  }

  if (a2 <= a1) {
    return 1LL;
  }
  for (uint64_t i = 2LL * a1; ; i += 2LL)
  {
    uint64_t result = sub_11828(*(unsigned __int16 *)(*(void *)(a5 + 8) + i), a3, v14, a4, a5, a6, a7, a8, a9, a10);
    if (!(_DWORD)result) {
      break;
    }
    if (a2 == ++v14) {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_11828( unsigned int a1, uint64_t a2, int a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, _DWORD *a8, _DWORD *a9, unsigned int *a10)
{
  uint64_t v18 = *((unsigned int *)sub_116A8(a1, a2) + 4);
  if ((_DWORD)v18) {
    return sub_11908( (unsigned __int16 *)(a2 + 8 * v18 + 31670),  *(__int16 *)(a2 + 8 * v18 + 31668),  *(__int16 *)(a2 + 8 * v18 + 31666),  a2,  a3,  a5,  a6,  a7,  a8,  a9,  a10);
  }
  else {
    return sub_11B10(a1, a4, a6, a3, a7);
  }
}

uint64_t sub_11908( unsigned __int16 *a1, int a2, int a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, _DWORD *a10, unsigned int *a11)
{
  int v11 = *(_DWORD *)(a7 + 20);
  if (v11 + a3 > *(_DWORD *)(a7 + 16) || a5 + a2 > *(_DWORD *)(a6 + 16)) {
    return 0LL;
  }
  if (!*a10 && *a9 >= a5 && *a9 < a5 + a2)
  {
    if (a3 >= 0) {
      int v17 = a3;
    }
    else {
      int v17 = a3 + 1;
    }
    *a9 = v11 + (v17 >> 1);
    *a10 = 1;
  }

  if (a2 >= 1)
  {
    uint64_t v18 = a2;
    uint64_t v19 = (_DWORD *)(a8 + 4LL * a5);
    do
    {
      *v19++ = *(_DWORD *)(a7 + 20);
      --v18;
    }

    while (v18);
  }

  if (!a3) {
    return 0LL;
  }
  int v20 = *(_DWORD *)(a7 + 20);
  if (v20 + a3 > *(_DWORD *)(a7 + 16)) {
    return 0LL;
  }
  unsigned int v22 = *a11;
  if (*a11)
  {
    uint64_t v23 = sub_10BA8(*a1, a4);
    uint64_t v24 = *((unsigned int *)v23 + 12);
    if ((_DWORD)v24) {
      uint64_t v25 = a4 + 8 * v24 + 31616;
    }
    else {
      uint64_t v25 = (uint64_t)v23;
    }
    while (1)
    {
      uint64_t v26 = *(unsigned int *)(v25 + 52);
      if (!(_DWORD)v26) {
        break;
      }
      uint64_t v27 = a4 + 8 * v26;
      uint64_t v25 = v27 + 31616;
      if (((v23[4] | 0x10LL) & ~*(void *)(v27 + 31648)) == 0) {
        goto LABEL_27;
      }
    }

    uint64_t v25 = (uint64_t)v23;
LABEL_27:
    __int16 v28 = *(_WORD *)(v25 + 44);
    uint64_t v29 = *(void *)(a7 + 8);
    uint64_t v30 = *(int *)(a7 + 20);
    int v20 = v30 + 1;
    *(_DWORD *)(a7 + 20) = v30 + 1;
    *(_WORD *)(v29 + 2 * v30) = v28;
    *a11 = 0;
    unsigned int v22 = 1;
  }

  if (a11[1] || a11[2])
  {
    if (a3 > (int)v22)
    {
      uint64_t v31 = v22;
      do
      {
        uint64_t v32 = sub_10BA8(a1[v31], a4);
        uint64_t v33 = *((unsigned int *)v32 + 12);
        if ((_DWORD)v33) {
          uint64_t v34 = a4 + 8 * v33 + 31616;
        }
        else {
          uint64_t v34 = (uint64_t)v32;
        }
        while (1)
        {
          uint64_t v35 = *(unsigned int *)(v34 + 52);
          if (!(_DWORD)v35) {
            break;
          }
          uint64_t v36 = a4 + 8 * v35;
          uint64_t v34 = v36 + 31616;
          if (((v32[4] | 0x10LL) & ~*(void *)(v36 + 31648)) == 0) {
            goto LABEL_39;
          }
        }

        uint64_t v34 = (uint64_t)v32;
LABEL_39:
        __int16 v37 = *(_WORD *)(v34 + 44);
        uint64_t v38 = *(void *)(a7 + 8);
        uint64_t v39 = *(int *)(a7 + 20);
        *(_DWORD *)(a7 + 20) = v39 + 1;
        *(_WORD *)(v38 + 2 * v39) = v37;
        ++v31;
      }

      while (v31 != a3);
    }
  }

  else
  {
    uint64_t v40 = &a1[v22];
    unsigned int v41 = a3 - v22;
    memcpy((void *)(*(void *)(a7 + 8) + 2LL * v20), v40, 2LL * (int)(a3 - v22));
    *(_DWORD *)(a7 + 20) += v41;
  }

  return 1LL;
}

uint64_t sub_11B10(unsigned int a1, char a2, uint64_t a3, int a4, uint64_t a5)
{
  *(_DWORD *)(a5 + 4LL * a4) = *(_DWORD *)(a3 + 20);
  if ((a2 & 0x80) == 0)
  {
    uint64_t v6 = _lou_unknownDots(a1);
    size_t v7 = strlen(v6);
    uint64_t v8 = *(int *)(a3 + 20);
    if (v7)
    {
      uint64_t v10 = 0LL;
      uint64_t v11 = *(void *)(a3 + 8) + 2 * v8;
      int v12 = v8 + 1;
      do
      {
        __int16 v13 = v6[v10];
        *(_DWORD *)(a3 + 20) = v12 + v10;
        *(_WORD *)(v11 + 2 * v10++) = v13;
      }

      while (v7 > v10);
    }
  }

  return 1LL;
}

uint64_t sub_11B90( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _DWORD *a7, _DWORD *a8, unsigned int *a9)
{
  unsigned __int16 v12 = 32;
  uint64_t result = sub_11908(&v12, 1, 1, a1, a2, a3, a4, a6, a7, a8, a9);
  if ((_DWORD)result)
  {
    if (a5) {
      *(_BYTE *)(*(int *)(a4 + 20) + a5 - 1) = 49;
    }
    return 1LL;
  }

  return result;
}

uint64_t sub_11C10(unsigned int *a1, _DWORD *a2, _DWORD *a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  if (*a5)
  {
    uint64_t v6 = 0LL;
    unsigned int v7 = *(unsigned __int16 *)(a6 + 2LL * (*(__int16 *)(a6 + 50) - *a5) + 54);
    if (v7 <= 0x16)
    {
      if (*(unsigned __int16 *)(a6 + 2LL * (*(__int16 *)(a6 + 50) - *a5) + 54) > 4u)
      {
        if (v7 == 5)
        {
          uint64_t v6 = a1[587];
          if (!(_DWORD)v6) {
            goto LABEL_27;
          }
        }

        else
        {
          if (v7 != 19) {
            goto LABEL_27;
          }
          uint64_t v6 = a1[240];
          if (!(_DWORD)v6) {
            goto LABEL_27;
          }
        }
      }

      else if (v7 == 3)
      {
        uint64_t v6 = a1[585];
        if (!(_DWORD)v6) {
          goto LABEL_27;
        }
      }

      else
      {
        if (v7 != 4) {
          goto LABEL_27;
        }
        uint64_t v6 = a1[586];
        if (!(_DWORD)v6) {
          goto LABEL_27;
        }
      }
    }

    else if (*(unsigned __int16 *)(a6 + 2LL * (*(__int16 *)(a6 + 50) - *a5) + 54) <= 0x2Cu)
    {
      if (v7 == 23)
      {
        uint64_t v6 = a1[241];
        if (!(_DWORD)v6) {
          goto LABEL_27;
        }
      }

      else
      {
        if (v7 != 24) {
          goto LABEL_27;
        }
        uint64_t v6 = a1[243];
        if (!(_DWORD)v6) {
          goto LABEL_27;
        }
      }
    }

    else
    {
      switch(v7)
      {
        case '-':
          uint64_t v6 = a1[634];
          if (!(_DWORD)v6) {
            goto LABEL_27;
          }
          break;
        case '.':
          uint64_t v6 = a1[635];
          if (!(_DWORD)v6)
          {
LABEL_27:
            --*a5;
            return v6;
          }

          break;
        case '/':
          uint64_t v6 = a1[242];
          if (!(_DWORD)v6) {
            goto LABEL_27;
          }
          break;
        default:
          goto LABEL_27;
      }
    }

    uint64_t v8 = (uint64_t)&a1[2 * v6 + 7904];
    *(void *)a4 = v8;
    *a3 = *(_DWORD *)(v8 + 44);
    *a2 = *(__int16 *)(*(void *)a4 + 52LL);
    uint64_t v6 = 1LL;
    goto LABEL_27;
  }

  return 0LL;
}

uint64_t sub_11D38(uint64_t a1, int a2, __int16 a3, uint64_t a4, int a5)
{
  if ((a3 & 0x100) != 0) {
    return 0LL;
  }
  if (a5 + a2 >= *(_DWORD *)(a4 + 16)) {
    return 1LL;
  }
  uint64_t v7 = a5 + a2;
  do
  {
    uint64_t v8 = sub_116A8(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v7), a1);
    uint64_t v9 = v8[3];
    if ((v9 & 1) != 0) {
      return 1LL;
    }
    if ((v9 & 2) != 0) {
      return 0LL;
    }
    uint64_t v10 = *((unsigned int *)v8 + 5);
    if (!(_DWORD)v10) {
      goto LABEL_18;
    }
    int v11 = 0;
    int v12 = 0;
    do
    {
      uint64_t v13 = a1 + 8 * v10 + 31616;
      int v14 = *(_DWORD *)(v13 + 44);
      if (*(__int16 *)(v13 + 50) >= 2)
      {
        if (v14 == 99 || v14 == 101) {
          goto LABEL_13;
        }
        int v11 = 1;
      }

      if (v14 == 110) {
        return 1LL;
      }
LABEL_13:
      if (v14 == 105) {
        int v12 = 1;
      }
      uint64_t v10 = *(unsigned int *)(v13 + 20);
    }

    while ((_DWORD)v10);
    if (v11 && !v12) {
      return 0LL;
    }
LABEL_18:
    ++v7;
    uint64_t result = 1LL;
  }

  while (v7 < *(int *)(a4 + 16));
  return result;
}

_WORD *lou_translateString( char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, _BYTE *a7, int a8)
{
  return _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, 0LL, 0LL, 0LL, a8, 0LL, 0LL);
}

_WORD *lou_translate( char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, _BYTE *a7, void *__b, uint64_t a9, unsigned int *a10, int a11)
{
  return _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, __b, a9, a10, a11, 0LL, 0LL);
}

_WORD *_lou_translate( char *a1, char *a2, unsigned __int16 *a3, int *a4, unsigned __int16 *a5, int *a6, __int16 *a7, _BYTE *a8, void *__b, uint64_t a10, unsigned int *a11, int a12, uint64_t a13, int *a14)
{
  uint64_t result = 0LL;
  if (!a1) {
    return result;
  }
  if (!a3) {
    return result;
  }
  int v17 = a4;
  if (!a4) {
    return result;
  }
  if (!a5) {
    return result;
  }
  uint64_t v19 = a6;
  if (!a6) {
    return result;
  }
  char v22 = a12;
  _lou_logMessage(0LL, "Performing translation: tableList=%s, inlen=%d", a1, *a4);
  _lou_logWidecharBuf(0LL, "Inbuf=", a3, *v17);
  if (!_lou_isValidMode(a12)) {
    _lou_logMessage(40000LL, "Invalid mode parameter: %d", a12);
  }
  if (a2) {
    uint64_t v23 = a2;
  }
  else {
    uint64_t v23 = a1;
  }
  v135 = v23;
  _lou_getTable(a1, v23, (uint64_t *)&v150, &v149);
  if (!v150) {
    return 0LL;
  }
  uint64_t v24 = *v17;
  if ((v24 & 0x80000000) != 0) {
    return 0LL;
  }
  int v25 = *v19;
  if (*v19 < 0) {
    return 0LL;
  }
  if ((_DWORD)v24)
  {
    uint64_t v26 = 0LL;
    while (a3[v26])
    {
      if (v24 == ++v26)
      {
        LODWORD(v26) = *v17;
        break;
      }
    }
  }

  else
  {
    LODWORD(v26) = 0;
  }

  unsigned int v146 = -1;
  v147 = a3;
  int v148 = v26;
  uint64_t result = _lou_allocMem(0, 0, v26, v25);
  if (!result) {
    return result;
  }
  uint64_t v27 = v148;
  __dst = result;
  if (!a7)
  {
    bzero(result, 2LL * v148);
    goto LABEL_29;
  }

  if (v148 < 1)
  {
LABEL_29:
    int v28 = 0;
    goto LABEL_30;
  }

  int v28 = 0;
  uint64_t v29 = a7;
  uint64_t v30 = result;
  do
  {
    __int16 v31 = *v29++;
    *v30++ = v31;
    if ((v31 & 0x3FFF) != 0) {
      int v28 = 1;
    }
    --v27;
  }

  while (v27);
LABEL_30:
  uint64_t v32 = (int *)a11;
  if (!a8 || *a8 == 88) {
    a8 = 0LL;
  }
  if (__b && v148 >= 1)
  {
    int v33 = v28;
    memset(__b, 255, 4LL * v148);
    int v28 = v33;
    uint64_t v32 = (int *)a11;
  }

  int v124 = v32;
  int v129 = v28;
  if (!v32 || (uint64_t v34 = *v32, (v34 & 0x80000000) != 0))
  {
    LODWORD(v34) = -1;
    int v142 = -1;
    int v141 = 1;
  }

  else
  {
    int v141 = 0;
    int v142 = v34;
    if ((a12 & 0x22) != 0)
    {
      if ((*((_BYTE *)sub_16E60(v147[v34], (uint64_t)v150) + 24) & 1) != 0)
      {
        int v128 = v34;
        LODWORD(v34) = v34 + 1;
      }

      else
      {
        uint64_t v35 = v34;
        while ((*((_BYTE *)sub_16E60(v147[v35], (uint64_t)v150) + 24) & 1) == 0)
        {
          if (v35-- <= 0)
          {
            LODWORD(v35) = -1;
            break;
          }
        }

        int v128 = v35 + 1;
        if ((a12 & 0x20) == 0 && (int)v34 < v148)
        {
          uint64_t v34 = (int)v34;
          do
          {
            ++v34;
          }

          while (v34 < v148);
        }
      }

      goto LABEL_53;
    }

    LODWORD(v34) = -1;
  }

  int v128 = -1;
LABEL_53:
  uint64_t result = _lou_allocMem(5, 0, v148, *v19);
  if (!result) {
    return result;
  }
  __int16 v37 = (char *)result;
  if ((int)v150[233] > 1 || v150[234])
  {
    uint64_t result = _lou_allocMem(6, 0, v148, *v19);
    uint64_t v134 = (uint64_t)result;
    if (!result) {
      return result;
    }
    uint64_t result = _lou_allocMem(7, 0, v148, *v19);
    int v132 = result;
    if (!result) {
      return result;
    }
    int v125 = v34;
  }

  else
  {
    int v125 = v34;
  }

  uint64_t v38 = a14;
  if (a8)
  {
    uint64_t v39 = _lou_allocMem(3, 0, v148, *v19);
    if (v39)
    {
      __src = v39;
      memset(v39, 42, *v19);
    }

    else
    {
      __src = 0LL;
    }

    uint64_t v38 = a14;
  }

  else
  {
    __src = 0LL;
  }

  int v40 = 0;
  uint64_t v41 = 0LL;
  dword_29E48 = 0;
  if (a13 && v38)
  {
    int v40 = *v38;
    uint64_t v41 = a13;
  }

  qword_29E50 = v41;
  dword_29E58 = v40;
  if ((byte_29E5C & 1) == 0) {
    byte_29E5C = 1;
  }
  dword_29E80 = 0;
  qword_29E78 = 0LL;
  unsigned int v42 = sub_12D6C(*v19);
  int v43 = (unsigned __int16 *)qword_29E60[v42];
  uint64_t v44 = v150[234] == 0;
  unsigned int v45 = *v19;
  unsigned int v143 = v42;
  v144 = v43;
  uint64_t v145 = v45;
  uint64_t v46 = (uint64_t)v37;
  uint64_t v127 = v19;
  BOOL v130 = v17;
  int v131 = a8;
  int v137 = v37;
  while (1)
  {
    uint64_t v138 = v44;
    uint64_t v139 = v46;
    if ((_DWORD)v44 == 1)
    {
      int v67 = _lou_allocMem(1, 0, v148, v45);
      if (!v67) {
        return 0LL;
      }
      uint64_t v68 = (uint64_t)v67;
      uint64_t v69 = _lou_allocMem(2, 0, v148, *v19);
      if (!v69) {
        return 0LL;
      }
      sub_12DDC( v150,  v22,  (uint64_t)&v146,  (uint64_t)&v143,  v46,  (uint64_t)__dst,  (uint64_t)a8,  (uint64_t)__src,  v68,  (uint64_t)v69,  v129,  &v140,  &v142,  &v141,  v128,  v125);
      LODWORD(v46) = v140;
      goto LABEL_179;
    }

    if ((_DWORD)v44)
    {
      uint64_t v70 = v150;
      int v50 = &v146;
      v161[0] = (uint64_t)&v146;
      HIDWORD(v145) = 0;
      int v160 = 0;
      _lou_resetPassVariables();
      int v71 = v148;
      if (v148 < 1)
      {
        LODWORD(v46) = 0;
        goto LABEL_154;
      }

      signed int v72 = 0;
      int v73 = &v70[v44 + 5648];
      BOOL v74 = 1;
      while (1)
      {
        if (!v74) {
          goto LABEL_134;
        }
        uint64_t v75 = *v73;
        if (!(_DWORD)v75) {
          break;
        }
        while (1)
        {
          uint64_t v76 = (uint64_t)&v70[2 * v75 + 7904];
          int v77 = v70[2 * v75 + 7915];
          if (sub_1729C( (uint64_t)v70,  v72,  (uint64_t)v50,  v77,  v76,  &v158,  &v157,  &v156,  (signed int *)&v153,  (unint64_t *)&v152,  &v151)) {
            break;
          }
          uint64_t v75 = *(unsigned int *)(v76 + 16);
          if (!(_DWORD)v75) {
            goto LABEL_133;
          }
        }

        __int16 v159 = (int *)v76;
        if ((v77 - 76) >= 3)
        {
          if (v77 == 83)
          {
            __int16 v37 = (char *)v76;
            goto LABEL_134;
          }

          if (v77 != 74)
          {
LABEL_152:
            LODWORD(v46) = v72;
            goto LABEL_153;
          }
        }

        if (qword_29E50)
        {
          uint64_t v80 = dword_29E48;
          if (dword_29E48 < dword_29E58)
          {
            ++dword_29E48;
            *(void *)(qword_29E50 + 8 * v80) = v76;
          }
        }

        if (!sub_17E08( (uint64_t)v70,  v161,  (uint64_t)&v143,  v139,  v77,  (uint64_t)&v159,  v158,  v157,  v156,  &v160,  v153,  v154,  v155,  &v142,  &v141,  v152,  v151,  v123))
        {
          LODWORD(v46) = v160;
          int v50 = (unsigned int *)v161[0];
LABEL_153:
          int v71 = v50[4];
          uint64_t v19 = v127;
          __int16 v37 = v137;
LABEL_154:
          if ((int)v46 < v71)
          {
            uint64_t v83 = 2LL * (int)v46;
            do
            {
              LODWORD(v46) = v46 + 1;
              v83 += 2LL;
            }

            while ((_DWORD)v46 != v50[4]);
            int v160 = v46;
          }

          goto LABEL_173;
        }

        uint64_t v81 = v161[0];
        uint64_t v82 = *v50;
        LODWORD(v46) = v160;
        BOOL v74 = v160 != v72;
        int v50 = (unsigned int *)v81;
        __int16 v37 = (char *)v76;
LABEL_136:
        signed int v72 = v46;
      }

LABEL_133:
      __int16 v159 = (int *)v37;
LABEL_134:
      *(_DWORD *)(v139 + 4LL * SHIDWORD(v145)) = v72;
      uint64_t v78 = *((void *)v50 + 1);
      LODWORD(v46) = v72 + 1;
      int v160 = v72 + 1;
      LOWORD(v78) = *(_WORD *)(v78 + 2LL * v72);
      uint64_t v79 = SHIDWORD(v145);
      ++HIDWORD(v145);
      v144[v79] = v78;
      BOOL v74 = 1;
      goto LABEL_136;
    }

    uint64_t v47 = v150;
    v161[0] = (uint64_t)&v146;
    if (v150[234])
    {
      int v160 = 0;
      HIDWORD(v145) = 0;
      _lou_resetPassVariables();
      int v48 = v148;
      if (v148 < 1)
      {
        int v66 = 0;
        LODWORD(v46) = 0;
        int v50 = &v146;
        char v22 = a12;
LABEL_160:
        int v84 = malloc(2LL * v66);
        uint64_t v85 = v84;
        if (!v84) {
          _lou_outOfMemory();
        }
        if (v66 >= 1)
        {
          uint64_t v86 = v66;
          uint64_t v87 = (unsigned int *)v139;
          int v88 = v84;
          do
          {
            unsigned int v90 = *v87++;
            uint64_t v89 = v90;
            int v91 = __dst;
            if ((v90 & 0x80000000) == 0)
            {
              int v92 = v50[4];
              else {
                int v91 = &__dst[v89];
              }
            }

            *v88++ = *v91;
            --v86;
          }

          while (v86);
        }

        memcpy(__dst, v84, 2LL * v66);
        free(v85);
        goto LABEL_173;
      }

      LODWORD(v46) = 0;
      BOOL v49 = 1;
      int v50 = &v146;
      while (2)
      {
        if (!v49) {
          goto LABEL_84;
        }
        uint64_t v51 = v47[5648];
        if (!(_DWORD)v51)
        {
LABEL_83:
          __int16 v159 = v19;
LABEL_84:
          int v54 = 0;
          int v55 = v48 - v46;
LABEL_85:
          if (v54)
          {
            if (v54 != 1)
            {
              if (v54 == 2)
              {
                __int16 v159 = v19;
                goto LABEL_119;
              }

              goto LABEL_103;
            }

            if (v55 >= 1)
            {
              uint64_t v56 = (unsigned int *)((char *)sub_16E60( *(unsigned __int16 *)(*((void *)v50 + 1) + 2LL * (int)v46),  (uint64_t)v47)
                                   + 20);
              int v55 = 1;
LABEL_93:
              uint64_t v57 = *v56;
              if ((_DWORD)v57)
              {
                while (1)
                {
                  uint64_t v19 = &v47[2 * v57 + 7904];
                  LODWORD(v37) = v47[2 * v57 + 7915];
                  if (v54 != 1) {
                    break;
                  }
                  if (v49) {
                    goto LABEL_100;
                  }
LABEL_102:
                  uint64_t v57 = v19[4];
                  if (!(_DWORD)v57) {
                    goto LABEL_103;
                  }
                }

                int v58 = SHIWORD(v47[2 * v57 + 7916]);
                if (v55 < v58) {
                  goto LABEL_102;
                }
                int v59 = sub_171F8( (unsigned __int16 *)&v47[2 * v57 + 7917] + 1,  (unsigned __int16 *)(*((void *)v50 + 1) + 2LL * (int)v46),  v58,  (uint64_t)v47);
                if (!v49 || !v59) {
                  goto LABEL_102;
                }
LABEL_100:
                if ((_DWORD)v37 != 75
                  || !sub_1729C( (uint64_t)v47,  v46,  (uint64_t)v50,  75,  (uint64_t)v19,  &v158,  &v157,  &v156,  (signed int *)&v153,  (unint64_t *)&v152,  &v151))
                {
                  goto LABEL_102;
                }

                __int16 v159 = v19;
LABEL_110:
                char v22 = a12;
                __int16 v37 = v137;
                if (qword_29E50)
                {
                  uint64_t v60 = dword_29E48;
                  if (dword_29E48 < dword_29E58)
                  {
                    ++dword_29E48;
                    *(void *)(qword_29E50 + 8 * v60) = v19;
                  }
                }

                if (!sub_17E08( (uint64_t)v47,  v161,  (uint64_t)&v143,  v139,  75,  (uint64_t)&v159,  v158,  v157,  v156,  &v160,  v153,  v154,  v155,  &v142,  &v141,  v152,  v151,  v123))
                {
                  LODWORD(v46) = v160;
                  int v50 = (unsigned int *)v161[0];
                  uint64_t v19 = v127;
                  goto LABEL_173;
                }

                uint64_t v61 = v161[0];
                uint64_t v62 = *v50;
                int v63 = v160;
                BOOL v49 = v160 != v46;
                LODWORD(v37) = 75;
                int v50 = (unsigned int *)v61;
LABEL_121:
                LODWORD(v46) = v63;
LABEL_122:
                int v48 = v50[4];
                if ((int)v46 >= v48)
                {
                  int v66 = HIDWORD(v145);
                  uint64_t v19 = v127;
                  char v22 = a12;
                  __int16 v37 = v137;
                  goto LABEL_160;
                }

                continue;
              }
            }
          }

          else if (v55 >= 2)
          {
            goto LABEL_93;
          }

LABEL_119:
      if (SHIDWORD(v145) < (int)v145)
      {
        *(_DWORD *)(v139 + 4LL * SHIDWORD(v145)) = v46;
        unsigned __int16 v64 = *(_WORD *)(*((void *)v50 + 1) + 2LL * (int)v46);
        int v63 = v46 + 1;
        int v160 = v46 + 1;
        uint64_t v65 = SHIDWORD(v145);
        ++HIDWORD(v145);
        v144[v65] = v64;
        BOOL v49 = 1;
        LODWORD(v37) = 83;
        goto LABEL_121;
      }

      uint64_t v19 = v127;
      char v22 = a12;
      __int16 v37 = v137;
LABEL_173:
      int v140 = v46;
      uint64_t v93 = *v50;
      int v17 = v130;
      a8 = v131;
    }

LABEL_179:
    *(_DWORD *)(v139 + 4LL * SHIDWORD(v145)) = v46;
    uint64_t v95 = v134;
    if ((char *)v139 != v37)
    {
      memcpy(v132, v37, 4LL * *v19 + 4);
      if ((v145 & 0x8000000000000000LL) == 0)
      {
        uint64_t v96 = 0LL;
        uint64_t v97 = 4LL * HIDWORD(v145) + 4;
        do
        {
          *(_DWORD *)&v37[v96] = *((_DWORD *)v132
                                 + (*(_DWORD *)(v139 + v96) & ~(*(int *)(v139 + v96) >> 31)));
          v96 += 4LL;
        }

        while (v97 != v96);
      }

      uint64_t v95 = v139;
    }

    if (v146 <= 2) {
      *((_DWORD *)&qword_29E78 + v146) = 0;
    }
    uint64_t v44 = v138 + 1;
    unsigned int v146 = v143;
    v147 = v144;
    int v148 = HIDWORD(v145);
    unsigned int v98 = sub_12D6C(*v19);
    __int16 v99 = (unsigned __int16 *)qword_29E60[v98];
    unsigned int v45 = *v19;
    unsigned int v143 = v98;
    v144 = v99;
    uint64_t v145 = v45;
    uint64_t v46 = v95;
  }

  LODWORD(v100) = HIDWORD(v145);
  if (SHIDWORD(v145) < 1)
  {
    int *v17 = *(_DWORD *)&v37[4 * SHIDWORD(v145)];
    *uint64_t v19 = v100;
    uint64_t v109 = a5;
    int v110 = __b;
  }

  else
  {
    unsigned int v101 = v144;
    uint64_t v102 = HIDWORD(v145);
    int v103 = a7;
    int v104 = a7;
    int v105 = a5;
    do
    {
      if (v103)
      {
        if ((*v101 & 0xC0) != 0) {
          __int16 v106 = 56;
        }
        else {
          __int16 v106 = 48;
        }
        *int v104 = v106;
      }

      if ((v22 & 4) != 0)
      {
        unsigned __int16 v108 = *v101 | 0x2800;
        if ((v22 & 0x40) == 0) {
          unsigned __int16 v108 = *v101;
        }
        *int v105 = v108;
      }

      else
      {
        int CharForDots = _lou_getCharForDots(*v101, v149);
        *int v105 = CharForDots;
        if (!CharForDots)
        {
          uint64_t v118 = _lou_showDots((uint64_t)v101, 1);
          _lou_logMessage(40000LL, "%s: no mapping for dot pattern %s in display table", v135, v118);
          return 0LL;
        }
      }

      ++v101;
      ++v105;
      ++v104;
      --v102;
      int v103 = a7;
    }

    while (v102);
    __int16 v37 = v137;
    int v17 = v130;
    a8 = v131;
    *BOOL v130 = *(_DWORD *)&v137[4 * (int)v100];
    uint64_t v19 = v127;
    *uint64_t v127 = v100;
    uint64_t v109 = a5;
    int v110 = __b;
    if (a10)
    {
      uint64_t v111 = 0LL;
      do
      {
        int v112 = *(_DWORD *)&v137[4 * v111];
        if (v112 < 0)
        {
          int v112 = 0;
        }

        else if (v112 >= *v130)
        {
          int v112 = *v130 - 1;
        }

        *(_DWORD *)(a10 + 4 * v111++) = v112;
        uint64_t v100 = *v127;
      }

      while (v111 < v100);
    }
  }

  if (v110)
  {
    if ((int)v100 < 1)
    {
      int v115 = -1;
      int v114 = -1;
    }

    else
    {
      uint64_t v113 = 0LL;
      int v114 = -1;
      int v115 = -1;
      do
      {
        int v116 = *(_DWORD *)&v37[4 * v113];
        if (v116 > v115)
        {
          int v117 = v114 & ~(v114 >> 31);
          do
          {
            if ((v115 & 0x80000000) == 0 && v115 < *v17)
            {
              v110[v115] = v117;
              int v116 = *(_DWORD *)&v37[4 * v113];
            }

            ++v115;
          }

          while (v115 < v116);
          LODWORD(v100) = *v19;
          int v114 = v113;
        }

        ++v113;
      }

      while (v113 < (int)v100);
    }
  }

  if (__src)
  {
    uint64_t v120 = v148;
    memcpy(a8, __src, v148);
    a8[v120] = 0;
    int v110 = __b;
  }

  if (v124)
  {
    uint64_t v121 = *v124;
    if ((_DWORD)v121 != -1)
    {
      BOOL v122 = &v110[v121];
      if (!v110) {
        BOOL v122 = &v142;
      }
      *int v124 = *v122;
    }
  }

  if (a14) {
    *a14 = dword_29E48;
  }
  _lou_logMessage(0LL, "Translation complete: outlen=%d", *v19);
  _lou_logWidecharBuf(0LL, "Outbuf=", v109, *v19);
  return (_WORD *)(&dword_0 + 1);
}

uint64_t sub_12D6C(int a1)
{
  uint64_t v1 = 0LL;
  while (*((_DWORD *)&qword_29E78 + v1))
  {
    if (++v1 == 3) {
      _lou_outOfMemory();
    }
  }

  qword_29E60[v1] = _lou_allocMem(4, v1, 0, a1);
  *((_DWORD *)&qword_29E78 + v1) = 1;
  return v1;
}

void sub_12DDC( _DWORD *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int *a12, int *a13, _DWORD *a14, int a15, int a16)
{
  uint64_t v19 = (uint64_t)a1;
  v546 = (unsigned int *)a3;
  translation_directioint n = 1;
  if (!a1[235]) {
    goto LABEL_34;
  }
  int v20 = *(_DWORD *)(a3 + 16);
  if (v20 < 1) {
    goto LABEL_34;
  }
  uint64_t v21 = 0LL;
  LOWORD(v22) = 0;
  int v23 = 0;
  while (2)
  {
    int v24 = 0;
    int v25 = v20 - v23;
    uint64_t v26 = v23;
    do
    {
      if (v24)
      {
        if (v24 != 1)
        {
          if (v24 == 2) {
            goto LABEL_32;
          }
          goto LABEL_19;
        }

        if (v25 < 1) {
          goto LABEL_19;
        }
        int v25 = 1;
      }

      else
      {
        if (v25 < 2) {
          goto LABEL_19;
        }
        LODWORD(j) = (_DWORD)a1;
        uint64_t v27 = &a1[_lou_stringHash((unsigned __int16 *)(*(void *)(a3 + 8) + 2LL * v23), 1, (uint64_t)a1) + 5658];
      }

      uint64_t v28 = *v27;
      if ((_DWORD)v28)
      {
        while (1)
        {
          uint64_t j = (uint64_t)&a1[2 * v28 + 7904];
          int v18 = a1[2 * v28 + 7915];
          int v17 = SHIWORD(a1[2 * v28 + 7916]);
          if ((v24 == 1
             || v25 >= v17
             && sub_171F8( (unsigned __int16 *)&a1[2 * v28 + 7917] + 1,  (unsigned __int16 *)(*(void *)(a3 + 8) + 2LL * v23),  SHIWORD(a1[2 * v28 + 7916]),  (uint64_t)a1))
            && v18 == 86)
          {
            break;
          }

          uint64_t v28 = *(unsigned int *)(j + 16);
          if (!(_DWORD)v28) {
            goto LABEL_19;
          }
        }

        uint64_t v19 = (uint64_t)a1;
LABEL_24:
        int v20 = *(_DWORD *)(a3 + 16);
        if (v17 + v23 > v20) {
          goto LABEL_34;
        }
        int v22 = dword_1CC60[v21];
        uint64_t v21 = ~(_DWORD)v21 & 1LL;
        if (v17 > 0)
        {
          uint64_t v29 = 0LL;
          do
            *(_WORD *)(a6 + 2LL * v23 + 2 * v29++) |= v22;
          while (v17 != (_DWORD)v29);
          v23 += v29;
        }

        int v18 = 86;
        goto LABEL_30;
      }

LABEL_32:
    uint64_t v19 = (uint64_t)a1;
    int v20 = *(_DWORD *)(a3 + 16);
    if (v23 >= v20) {
      break;
    }
    ++v23;
    *(_WORD *)(a6 + 2 * v26) |= v22;
    int v18 = 83;
LABEL_30:
    if (v23 < v20) {
      continue;
    }
    break;
  }

LABEL_87:
        ++v41;
        int v43 = v48;
        if (v41 < *(_DWORD *)(v30 + 16)) {
          continue;
        }
        break;
      }

      unint64_t v35 = v505;
      unsigned int v37 = v511;
      if ((v44 & 0x80000000) == 0)
      {
        *(_WORD *)(v32 + 8LL * v44) = *(_WORD *)(v36 + 16) | *(void *)(v32 + 8LL * v44);
        if (v42) {
          int v45 = *(_DWORD *)(v30 + 16);
        }
        *(_WORD *)(v32 + 8LL * v45 + 2) = (*(void *)(v32 + 8LL * v45) | (*(_DWORD *)(v36 + 16) << 16)) >> 16;
      }

LABEL_168:
            int v68 = 0;
            if (v67 == v72)
            {
              int v70 = 1;
              unsigned int v74 = v67;
            }

            goto LABEL_170;
          }
        }

LABEL_186:
      LODWORD(v107) = v74 + 1;
      LODWORD(v108) = *(_DWORD *)(v30 + 16);
      if ((int)(v74 + 1) < (int)v108)
      {
        uint64_t v107 = (int)v107;
        do
        {
          *(_DWORD *)(j + 4 * v107++) &= ~1u;
          uint64_t v108 = *(int *)(v30 + 16);
        }

        while (v107 < v108);
      }

      if ((v74 & 0x80000000) == 0)
      {
        uint64_t v109 = *(void *)(v32 + 8LL * v74);
        int v110 = *(_DWORD *)(v36 + 16);
        if (((unsigned __int16)v110 & HIWORD(v109)) == 0)
        {
          unsigned int v111 = v110 & WORD1(v109);
          if (((unsigned __int16)*(_DWORD *)(v36 + 16) & WORD2(v109)) != 0 && v111 == 0)
          {
            *(void *)(v32 + 8LL * v74) = v109 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v36 + 16) | HIWORD(v109)) << 48);
            LODWORD(v108) = *(_DWORD *)(v30 + 16);
          }

          else {
            uint64_t v113 = v74;
          }
          int v114 = (unint64_t *)(v32 + 8LL * v74);
          uint64_t v115 = v113 - v74;
          while (v115)
          {
            unint64_t v117 = v114[1];
            ++v114;
            unint64_t v116 = v117;
            int v118 = *(_DWORD *)(v36 + 16);
            --v115;
            if ((v118 & WORD1(v117)) != 0)
            {
              unint64_t *v114 = v116 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v116) & ~v118) << 16);
              unint64_t *v114 = v116 & 0xFFFF00000000FFFFLL | ((WORD1(v116) & ~v118) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v116) & ~*(_WORD *)(v36 + 16)) << 32);
              LODWORD(v108) = *(_DWORD *)(v30 + 16);
              break;
            }
          }
        }
      }

      if ((int)v108 >= 1)
      {
        uint64_t v119 = 0LL;
        uint64_t v120 = j;
        uint64_t v121 = 0xFFFFFFFFLL;
        do
        {
          uint64_t v122 = *(void *)(v32 + 8 * v119);
          int v123 = *(_DWORD *)(v36 + 16);
          if (((unsigned __int16)v123 & HIWORD(v122)) != 0)
          {
            if ((!v119 || (*(_BYTE *)(v120 - 4) & 1) == 0)
              && (v119 + 1 == v108 || (*(_BYTE *)(v120 + 4) & 1) == 0))
            {
              *(_DWORD *)v120 |= 4u;
            }
          }

          else if (((unsigned __int16)v123 & WORD2(v122)) != 0)
          {
            if ((v123 & WORD1(v122)) != 0)
            {
              if ((v121 & 0x80000000) == 0 && (*(_BYTE *)v120 & 1) != 0) {
                *(_DWORD *)(j + 4 * v121) &= ~4u;
              }
              uint64_t v121 = 0xFFFFFFFFLL;
            }

            else
            {
              if (!v119 || (*(_BYTE *)(v120 - 4) & 1) == 0) {
                *(_DWORD *)v120 |= 4u;
              }
              uint64_t v121 = v119;
            }
          }

          ++v119;
          uint64_t v108 = *(int *)(v30 + 16);
          v120 += 4LL;
        }

        while (v119 < v108);
      }

      if (*(_DWORD *)(v58 + 32))
      {
        uint64_t v124 = v19 + 36LL * *(unsigned __int16 *)(v36 + 20);
        uint64_t v125 = v124 + 1960;
        if (*(_DWORD *)(v124 + 1968)) {
          BOOL v521 = 0;
        }
        else {
          BOOL v521 = *(_DWORD *)(v124 + 1976) == 0;
        }
        uint64_t v167 = 0LL;
        int v168 = 0;
        unsigned int v169 = 0;
        int v170 = 0;
        BOOL v171 = 0;
        LODWORD(v172) = -1;
        int v173 = -1;
        uint64_t v174 = 0xFFFFFFFFLL;
        uint64_t v175 = 0xFFFFFFFFLL;
        uint64_t v507 = v125;
        uint64_t v515 = 0xFFFFFFFFLL;
        while (1)
        {
          int v176 = *(_DWORD *)(j + 4 * v167);
          BOOL v177 = (v176 & 1) == 0;
          unsigned int v178 = (v176 & 1) != 0 ? v172 : v167;
          uint64_t v172 = v168 ? v178 : v172;
          if (v168)
          {
            BOOL v177 = (v176 & 1) == 0;
            int v168 = (v176 & 1) != 0;
          }

          else
          {
            int v168 = v176 & 1;
          }

          uint64_t v179 = *(void *)(v32 + 8 * v167);
          int v180 = *(_DWORD *)(v36 + 16);
          if (v171) {
            break;
          }
          int v183 = (unsigned __int16)(v180 & HIWORD(v179));
          if (v183)
          {
            uint64_t v175 = v167;
          }

          else
          {
            LODWORD(v179) = v180 & WORD1(v179);
          }

          BOOL v171 = v183 == 0;
          if (v170)
          {
            if (!*(void *)(v36 + 8) || (v176 & 4) != 0)
            {
              ++v169;
              uint64_t v174 = v167;
LABEL_327:
              char v182 = v171 || v177;
              if ((v182 & 1) != 0 || v167 == v175)
              {
                if (v167 == (_DWORD)v108 - 1 && v169 >= *(_DWORD *)(v125 + 32))
                {
                  uint64_t v187 = v174;
                  sub_19928(v515, v173, v174, a10, v531, (uint64_t)a1, j);
                  uint64_t v174 = v187;
                  uint64_t v19 = (uint64_t)a1;
                  uint64_t v36 = v531;
                  uint64_t v125 = v507;
                  uint64_t v32 = a10;
                }

                int v170 = 1;
                goto LABEL_359;
              }

              BOOL v171 = 0;
            }

            int v184 = v521;
            if (v173 == (_DWORD)v172) {
              int v184 = 0;
            }
            v169 -= v184;
            if (v169 >= *(_DWORD *)(v125 + 32))
            {
              uint64_t v185 = v174;
              sub_19928(v515, v173, v174, a10, v531, (uint64_t)a1, j);
              uint64_t v174 = v185;
              uint64_t v19 = (uint64_t)a1;
              uint64_t v36 = v531;
              uint64_t v125 = v507;
              uint64_t v32 = a10;
            }

LABEL_358:
            int v170 = 0;
            goto LABEL_359;
          }

LABEL_344:
          if (!v171 && v167 != v175)
          {
            BOOL v171 = 0;
            goto LABEL_358;
          }

          if (*(void *)(v36 + 8) && (v176 & 4) == 0) {
            goto LABEL_358;
          }
          int v173 = -1;
          int v170 = 1;
          uint64_t v174 = v167;
          uint64_t v515 = v167;
          unsigned int v169 = 1;
LABEL_359:
          ++v167;
          uint64_t v108 = *(int *)(v30 + 16);
          if (v167 >= v108) {
            goto LABEL_226;
          }
        }

        if (((unsigned __int16)v180 & WORD2(v179)) != 0)
        {
          if ((v180 & WORD1(v179)) == 0 && v167 != v172) {
            goto LABEL_326;
          }
        }

        else
        {
LABEL_365:
        }

        BOOL v171 = 0;
        if (v170) {
          int v173 = v167;
        }
LABEL_326:
        if (v170) {
          goto LABEL_327;
        }
        goto LABEL_344;
      }

LABEL_226:
      uint64_t v126 = 0LL;
      int v127 = 0;
      int v128 = 0;
      int v129 = 0;
      int v130 = 0;
      int v522 = *(_DWORD *)(v19 + 36LL * *(unsigned __int16 *)(v36 + 20) + 1980);
      int v131 = -1;
      int v132 = (_DWORD *)j;
      uint64_t v133 = v32;
      int v134 = -1;
      while (2)
      {
        unint64_t v135 = *(void *)v133;
        if (v130)
        {
          int v136 = *(_DWORD *)(v36 + 16);
          if ((v136 & WORD1(v135)) != 0) {
            goto LABEL_233;
          }
          if ((WORD2(v135) & (unsigned __int16)v136) != 0)
          {
            int v131 = v126;
            goto LABEL_233;
          }

          goto LABEL_234;
        }

        int v136 = *(_DWORD *)(v36 + 16);
LABEL_233:
        __int16 v137 = v136;
        if (((unsigned __int16)v136 & (unsigned __int16)v135) != 0)
        {
LABEL_234:
          int v130 = 1;
          goto LABEL_272;
        }

        if (v127)
        {
LABEL_236:
          if ((*v132 & 1) != 0
            && ((int v138 = *(_DWORD *)(v36 + 16), ((unsigned __int16)v138 & (unsigned __int16)WORD2(*(void *)v133)) != 0)
              ? (BOOL v139 = (v138 & WORD1(*(void *)v133)) == 0)
              : (BOOL v139 = 1),
                v139))
          {
            if ((*v132 & 2) != 0
              || (v140 = sub_197EC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v126), v19, v36), uint64_t v36 = v531, v140))
            {
              if (v522 && v128 == 1 && v134 != v131)
              {
                unint64_t v141 = *(void *)(a10 + 8LL * v134);
                unint64_t v142 = HIDWORD(v141);
                unint64_t v143 = v141 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v36 + 16) | HIWORD(v141)) << 48);
                *(void *)(a10 + 8LL * v134) = v143;
                *(void *)(a10 + 8LL * v134) = v143 & 0xFFFF0000FFFFFFFFLL | ((v142 & (unsigned __int16)~*(_WORD *)(v36 + 16)) << 32);
                *(_DWORD *)(j + 4LL * v134) &= ~4u;
              }

              if (sub_197EC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v126), v19, v36))
              {
                int v130 = 0;
                int v129 = 1;
                int v127 = 1;
                uint64_t v32 = a10;
                uint64_t v36 = v531;
                goto LABEL_272;
              }

              uint64_t v32 = a10;
              uint64_t v36 = v531;
              if (v134 == v131) {
                *(_WORD *)(a10 + 8LL * v131 + 4) = *(_DWORD *)(a10 + 8LL * v131 + 4) & ~*(_WORD *)(v531 + 16);
              }
              int v130 = 0;
              int v129 = 0;
              *(_WORD *)(v133 + 4) = *(_WORD *)(v531 + 16) | *(_DWORD *)(v133 + 4);
              int v131 = -1;
              int v128 = 1;
              int v134 = v126;
            }

            else
            {
              if (v129)
              {
                uint64_t v32 = a10;
                if (v134 == v131) {
                  *(_WORD *)(a10 + 8LL * v131 + 4) = *(_DWORD *)(a10 + 8LL * v131 + 4) & ~*(_WORD *)(v531 + 16);
                }
                int v128 = 0;
                *(_WORD *)(v133 + 4) = *(_WORD *)(v531 + 16) | *(_DWORD *)(v133 + 4);
                int v131 = -1;
                int v134 = v126;
              }

              else
              {
                uint64_t v32 = a10;
              }

              int v130 = 0;
              int v129 = 0;
              ++v128;
            }

            int v127 = 1;
          }

          else
          {
            if (v522 && v128 == 1 && v134 != v131)
            {
              unint64_t v144 = *(void *)(v32 + 8LL * v134);
              unint64_t v145 = HIDWORD(v144);
              unint64_t v146 = v144 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(*(_DWORD *)(v36 + 16) | HIWORD(v144)) << 48);
              *(void *)(v32 + 8LL * v134) = v146;
              *(void *)(v32 + 8LL * v134) = v146 & 0xFFFF0000FFFFFFFFLL | ((v145 & (unsigned __int16)~*(_WORD *)(v36 + 16)) << 32);
              *(_DWORD *)(j + 4LL * v134) &= ~4u;
              unint64_t v147 = *(void *)v133;
              unint64_t v148 = *(void *)v133 & 0xFFFFFFFF0000FFFFLL | *(void *)v133 & (~*(_DWORD *)(v36 + 16) << 16);
              *(void *)uint64_t v133 = v148;
              *(void *)uint64_t v133 = v148 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v147) & ~*(_WORD *)(v36 + 16)) << 32);
            }

            if (v129
              || (*(_BYTE *)v132 & 2) != 0
              || (v149 = sub_197EC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v126), v19, v36), uint64_t v36 = v531, v149))
            {
              unint64_t v150 = *(void *)v133;
              unint64_t v151 = *(void *)v133 & 0xFFFFFFFF0000FFFFLL | *(void *)v133 & (~*(_DWORD *)(v36 + 16) << 16);
              *(void *)uint64_t v133 = v151;
              *(void *)uint64_t v133 = v151 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v150) & ~*(_WORD *)(v36 + 16)) << 32);
            }

            int v130 = 0;
            int v127 = 0;
            if (v126 == v134)
            {
              *(_DWORD *)(j + 4LL * v134) &= ~4u;
              unint64_t v152 = *(void *)v133;
              unint64_t v153 = *(void *)v133 & 0xFFFFFFFF0000FFFFLL | *(void *)v133 & (~*(_DWORD *)(v36 + 16) << 16);
              *(void *)uint64_t v133 = v153;
              *(void *)uint64_t v133 = v153 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v152) & ~*(_WORD *)(v36 + 16)) << 32);
            }

            uint64_t v32 = a10;
          }
        }

        else
        {
          if (((unsigned __int16)v136 & WORD2(v135)) == 0)
          {
            unint64_t v157 = HIWORD(v135);
            if (((unsigned __int16)v136 & HIWORD(v135)) == 0)
            {
              int v130 = 0;
              int v127 = 0;
              goto LABEL_272;
            }

            if ((*(_BYTE *)v132 & 2) == 0)
            {
              int v514 = v128;
              uint64_t v158 = v36;
              if (!sub_197EC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v126), v19, v36))
              {
                int v130 = 0;
                int v127 = 0;
                uint64_t v32 = a10;
                uint64_t v36 = v158;
                int v128 = v514;
                goto LABEL_272;
              }

              int v136 = *(_DWORD *)(v158 + 16);
              unint64_t v135 = *(void *)v133;
              unint64_t v157 = HIWORD(*(void *)v133);
              uint64_t v32 = a10;
              uint64_t v36 = v158;
              int v128 = v514;
            }

            int v130 = 0;
            int v127 = 0;
            *(void *)uint64_t v133 = v135 & 0xFFFFFFFFFFFFLL | ((v157 & (unsigned __int16)~(_WORD)v136) << 48);
            goto LABEL_272;
          }

          if ((*(_BYTE *)v132 & 2) != 0)
          {
            if (!v522 || v126 == v131)
            {
              int v129 = 0;
              int v128 = 0;
              int v134 = v126;
              goto LABEL_236;
            }
          }

          else
          {
            int v513 = v128;
            uint64_t v154 = v36;
            if (!sub_197EC(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * v126), v19, v36)
              || v522 == 0
              || v126 == v131)
            {
              int v129 = 0;
              int v134 = v126;
              uint64_t v32 = a10;
              uint64_t v36 = v154;
              int v128 = 0;
              goto LABEL_236;
            }

            __int16 v137 = *(_WORD *)(v154 + 16);
            unint64_t v135 = *(void *)v133;
            uint64_t v32 = a10;
            uint64_t v36 = v154;
            int v128 = v513;
          }

          unint64_t v159 = v135 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v137 | HIWORD(v135)) << 48);
          *(void *)uint64_t v133 = v159;
          if ((v132[1] & 1) != 0)
          {
            *(_WORD *)(v133 + 12) = *(_DWORD *)(v36 + 16) | *(_DWORD *)(v133 + 12);
            if ((*(_BYTE *)v132 & 4) != 0)
            {
              v132[1] |= 4u;
              unint64_t v159 = *(void *)v133;
            }
          }

          int v130 = 0;
          int v127 = 0;
          *(void *)uint64_t v133 = v159 & 0xFFFF0000FFFFFFFFLL | ((unint64_t)(unsigned __int16)(WORD2(v159) & ~*(_WORD *)(v36 + 16)) << 32);
          *v132 &= ~4u;
        }

LABEL_368:
      uint64_t v31 = a6;
      unint64_t v35 = v505;
      if (!*(_DWORD *)(v502 + 28))
      {
LABEL_369:
        uint64_t v189 = v19 + 36LL * *(unsigned __int16 *)(v36 + 20);
        if (*(_DWORD *)(v189 + 1984))
        {
          if (!*(_DWORD *)(v189 + 1988) && *(int *)(v30 + 16) >= 1)
          {
            uint64_t v190 = 0LL;
            int v191 = 0;
            int v192 = 0;
            uint64_t v193 = 0xFFFFFFFFLL;
            while (1)
            {
              uint64_t v194 = *(void *)(v32 + 8 * v190);
              if (v192)
              {
                int v195 = *(_DWORD *)(v36 + 16);
              }

              else
              {
                int v195 = *(_DWORD *)(v36 + 16);
              }

              if (((unsigned __int16)v195 & (unsigned __int16)v194) == 0)
              {
                if (v191)
                {
                  uint64_t v197 = v193;
                  if (((unsigned __int16)v195 & WORD2(v194)) == 0)
                  {
LABEL_395:
                    int v192 = 0;
                    int v191 = *(_DWORD *)(j + 4 * v190) & 1;
                    goto LABEL_383;
                  }
                }

                else
                {
                  uint64_t v197 = v190;
                  if (((unsigned __int16)v195 & WORD2(v194)) == 0)
                  {
                    int v192 = 0;
                    int v191 = 0;
                    goto LABEL_383;
                  }
                }

                if ((v195 & WORD1(v194)) != 0)
                {
                  *(void *)(v32 + 8 * v190) = v194 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v194) & ~v195) << 16);
                  *(void *)(v32 + 8 * v190) = v194 & 0xFFFF00000000FFFFLL | ((WORD1(v194) & ~v195) << 16) | ((unint64_t)(unsigned __int16)(WORD2(v194) & ~*(_WORD *)(v36 + 16)) << 32);
                  *(_WORD *)(v32 + 8LL * (int)v197 + 4) = *(_DWORD *)(v32 + 8LL * (int)v197 + 4) & ~*(_WORD *)(v36 + 16);
                  if (v190 > (int)v197)
                  {
                    uint64_t v198 = (int)v197;
                    do
                      *(_WORD *)(v32 + 8 * v198++ + 6) |= *(_WORD *)(v36 + 16);
                    while (v190 != v198);
                  }

                  int v192 = 0;
                  int v191 = 0;
                  uint64_t v193 = v197;
                  goto LABEL_383;
                }

                uint64_t v193 = v197;
                goto LABEL_395;
              }

LABEL_382:
              int v192 = 1;
LABEL_383:
            }
          }

          goto LABEL_409;
        }

        uint64_t v199 = 0LL;
        int v200 = 0;
        while (2)
        {
          unint64_t v201 = *(void *)(v32 + 8 * v199);
          int v202 = *(_DWORD *)(v36 + 16);
          if (v200)
          {
            if ((v202 & WORD1(v201)) != 0)
            {
              int v200 = 0;
              unint64_t v203 = v201 & 0xFFFFFFFF0000FFFFLL | ((WORD1(v201) & ~v202) << 16);
              goto LABEL_405;
            }

LABEL_404:
            unint64_t v203 = v201 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)(v202 | HIWORD(v201)) << 48);
            int v200 = 1;
LABEL_405:
            *(void *)(v32 + 8 * v199) = v203;
          }

          else
          {
            if (((unsigned __int16)*(_DWORD *)(v36 + 16) & (unsigned __int16)v201) != 0)
            {
              unint64_t v201 = v201 & 0xFFFFFFFFFFFF0000LL | ((unsigned __int16)*(_DWORD *)(v36 + 16) ^ 0xFFFF) & v201;
              *(void *)(v32 + 8 * v199) = v201;
              LOWORD(v202) = *(_WORD *)(v36 + 16);
              goto LABEL_404;
            }

            int v200 = 0;
          }

          continue;
        }
      }

LABEL_409:
      if (*(void *)(v36 + 8) && *(int *)(v30 + 16) >= 1)
      {
        for (uint64_t j = 0LL; j < *(int *)(v30 + 16); ++j)
        {
          unint64_t v204 = *(void *)(v32 + 8 * j);
          uint64_t v205 = *(unsigned int *)(v36 + 16);
          if ((v205 & HIWORD(v204)) != 0)
          {
            uint64_t v206 = *(void *)(v36 + 8);
            if (v206 == 16)
            {
              if ((*(__int16 *)(v31 + 2 * j) & 0x80000000) == 0)
              {
                uint64_t v207 = HIWORD(v204) & (v205 ^ 0xFFFFFFFFLL);
LABEL_418:
                *(void *)(v32 + 8 * j) = v204 & 0xFFFFFFFFFFFFLL | ((unint64_t)(unsigned __int16)v207 << 48);
              }
            }

            else
            {
              int v208 = sub_16E60(*(unsigned __int16 *)(*(void *)(v30 + 8) + 2 * j), v19);
              uint64_t v36 = v531;
              uint64_t v32 = a10;
              if ((v208[3] & v206) == 0)
              {
                unint64_t v204 = *(void *)(a10 + 8 * j);
                uint64_t v207 = (*(unsigned int *)(v531 + 16) ^ 0xFFFFFFFFLL) & HIWORD(v204);
                goto LABEL_418;
              }
            }
          }
        }
      }
    }

    if (++v35 != 16) {
      continue;
    }
    break;
  }

  int v209 = 0;
  int v493 = 0;
  int v488 = 0;
  int v480 = 0;
  int v484 = a2 & 1;
  int v482 = a2 & 0x22;
  v478 = (unsigned int *)(v19 + 22596);
  uint64_t v491 = v19 + 31670;
  unint64_t v492 = 0LL;
  uint64_t v490 = a5 - 4;
  uint64_t v476 = v19 + 2550;
  uint64_t v477 = v19 + 2682;
  uint64_t v474 = v19 + 3198;
  int v483 = 117;
  BOOL v485 = 1;
  uint64_t v481 = 1LL;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        uint64_t v210 = (uint64_t)v546;
        while (2)
        {
          uint64_t v211 = v545;
          if (v545 > *(_DWORD *)(v210 + 16))
          {
            int v487 = v209;
            uint64_t v448 = (uint64_t)a1;
LABEL_1037:
            if (v493 <= (int)v211)
            {
              uint64_t v449 = (uint64_t)v546;
              int v450 = v493;
              do
              {
                sub_1911C(0LL, 1, 1, 0, v450, v448, v211, v449, a4, a5, a10, a13, a14);
                if (a11)
                {
                  sub_1911C(0LL, 1, 0, 1, v450, v448, v211, v449, a4, a5, a10, a13, a14);
                  sub_1911C(1uLL, 0, 0, 1, v450, v448, v211, v449, a4, a5, a10, a13, a14);
                }

                sub_1911C(1uLL, 0, 1, 0, v450++, v448, v211, v449, a4, a5, a10, a13, a14);
              }

              while ((_DWORD)v211 + 1 != v450);
            }

            int v209 = v487;
            goto LABEL_1043;
          }

          unsigned int v212 = v545 - 1;
          if (v545 < 1)
          {
            uint64_t v213 = (uint64_t)a1;
            uint64_t v214 = a4;
            goto LABEL_429;
          }

          uint64_t v213 = (uint64_t)a1;
          uint64_t v214 = a4;
          if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * v212), (uint64_t)a1) + 24) & 1) == 0)
          {
LABEL_429:
            int v215 = a16;
            goto LABEL_430;
          }

          int v215 = a16;
          if ((_DWORD)j != 94)
          {
            int v209 = *(_DWORD *)(a4 + 20);
            unint64_t v492 = __PAIR64__(v211, v493);
          }

LABEL_430:
          if ((_DWORD)v211 == *(_DWORD *)(v210 + 16)) {
            goto LABEL_1036;
          }
          BOOL v216 = (int)v211 >= a15 && (int)v211 < v215;
          if (v216)
          {
            int __src = 2;
            if (!sub_18EF4( v211,  v215,  v213,  &v545,  v210,  v214,  a5,  a10,  (uint64_t *)&v544,  a13,  &__src,  a2)) {
              goto LABEL_1043;
            }
            continue;
          }

          break;
        }

        if ((int)v211 < 2)
        {
          if ((_DWORD)v211)
          {
            uint64_t v217 = *(void *)(v210 + 8);
            goto LABEL_443;
          }

          int v219 = 32;
        }

        else
        {
          uint64_t v217 = *(void *)(v210 + 8);
          if (*(__int16 *)(v217 + 2LL * v212) == -1)
          {
            v218 = (unsigned __int16 *)(v217 + 2LL * (v211 - 2));
            goto LABEL_444;
          }

LABEL_443:
          v218 = (unsigned __int16 *)(v217 + 2LL * (int)v212);
LABEL_444:
          int v219 = *v218;
        }

        int v220 = sub_16E60(v219, v213);
        int v221 = *(_DWORD *)(v210 + 16);
        if ((int)v211 >= v221)
        {
LABEL_1036:
          uint64_t v448 = v213;
          int v487 = v209;
          goto LABEL_1037;
        }

        int v222 = v488;
        if (!v488) {
          int v222 = *(_WORD *)(v31 + 2LL * (int)v211) & 0x1000;
        }
        int v488 = v222;
        if ((*(_WORD *)(v31 + 2LL * (int)v211) & 0x800) != 0)
        {
          int v325 = *(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * (int)v211);
          LOWORD(__src) = 0x8000;
          uint64_t v326 = *((unsigned int *)sub_16E60(v325, v213) + 5);
          if ((_DWORD)v326)
          {
            while (1)
            {
              uint64_t v327 = v213 + 8 * v326 + 31616;
              uint64_t v326 = *(unsigned int *)(v327 + 16);
              if (!(_DWORD)v326) {
                goto LABEL_745;
              }
            }

            LOWORD(__src) = *(_WORD *)(v327 + 56);
          }

LABEL_745:
          int v493 = v211 + 1;
          int v545 = v211 + 1;
LABEL_747:
          BOOL v485 = 1;
          continue;
        }

        break;
      }

      uint64_t v471 = (v211 - 1);
      int v486 = v209;
      uint64_t v223 = v220[3];
      int v458 = *a13;
      int v460 = *(_DWORD *)(v214 + 16);
      uint64_t v469 = *(unsigned int *)(v214 + 20);
      int v495 = v221 - v211;
      unint64_t v224 = (char *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * (int)v211), v213);
      int v467 = 0;
      uint64_t v225 = 0LL;
      BOOL v226 = v483 == 84;
      if ((v223 & 4) == 0) {
        BOOL v226 = 1;
      }
      char v464 = v226;
      uint64_t v465 = v223 & 9;
      uint64_t v497 = v223;
      uint64_t v506 = 2LL * (int)v211;
      int v489 = v211 + 2;
      int v227 = v222 | v484;
      BOOL v228 = (a2 & 0x22) != 0 && (int)v211 <= a16;
      BOOL v229 = (int)v211 < a15;
      if (!v228) {
        BOOL v229 = 1;
      }
      int v230 = 0;
      int v473 = v222 | v484;
      char v463 = (v483 != 84) & ((v223 & 4) >> 2);
      if (v227) {
        BOOL v231 = 1;
      }
      else {
        BOOL v231 = (v223 & 2) == 0;
      }
      char v468 = v231;
      if (v227) {
        BOOL v232 = 1;
      }
      else {
        BOOL v232 = (v223 & 0xB) == 0;
      }
      char v466 = v232;
      if (v227) {
        BOOL v233 = 1;
      }
      else {
        BOOL v233 = (v223 & 9) == 0;
      }
      char v470 = v233;
      if (v227) {
        BOOL v234 = 1;
      }
      else {
        BOOL v234 = (v223 & 1) == 0;
      }
      if (v227) {
        BOOL v235 = 0;
      }
      else {
        BOOL v235 = v229;
      }
      BOOL v461 = v235;
      BOOL v462 = v234;
      v472 = (unsigned int *)(v224 + 20);
      uint64_t v236 = (int)v211;
      uint64_t v498 = v31 + 2LL * (int)v211;
      uint64_t v503 = (int)v211 + ~(uint64_t)(int)v211;
      uint64_t v494 = (int)v211 + 1LL;
      uint64_t v459 = 1LL - (v211 + 1);
      uint64_t v237 = a10;
      uint64_t v516 = v210;
      uint64_t v500 = v211;
      uint64_t v532 = (int)v211;
LABEL_479:
      if (v495 >= 2)
      {
        uint64_t v239 = _lou_stringHash((unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v532), 1, v213);
        uint64_t v236 = v532;
        uint64_t v237 = a10;
        int v238 = (unsigned int *)(v213 + 4 * v239 + 22632);
        goto LABEL_481;
      }

LABEL_482:
      if (!v225) {
        goto LABEL_733;
      }
      int v501 = v230;
LABEL_484:
      int v523 = *(_DWORD *)(v213 + 8 * v225 + 31660);
      uint64_t v526 = v213 + 8 * v225 + 31616;
      uint64_t v332 = *(__int16 *)(v213 + 8 * v225 + 31666);
      if (v230 != 1)
      {
        if (*(_WORD *)(v213 + 8 * v225 + 31666)) {
          BOOL v244 = v495 < (int)v332;
        }
        else {
          BOOL v244 = 1;
        }
        if (v244)
        {
LABEL_498:
          uint64_t v213 = (uint64_t)a1;
          uint64_t v214 = a4;
          v331 = (unsigned __int16 *)v526;
          goto LABEL_529;
        }

        if ((int)v332 >= 1)
        {
          uint64_t v246 = 0LL;
          LODWORD(v247) = 0;
          uint64_t v508 = (int)v500 + (int)v332;
          while (1)
          {
            int v248 = *(unsigned __int16 *)(*(void *)(v210 + 8) + v506 + 2 * v246);
            if (v248 == 0xFFFF) {
              break;
            }
            v249 = (_BYTE *)v332;
            unint64_t v250 = sub_16E60(v248, (uint64_t)a1);
            uint64_t v251 = (uint64_t)v250;
            LODWORD(v252) = v247;
            if (!v246) {
              uint64_t v252 = v250[3];
            }
            v253 = sub_16E60(*(unsigned __int16 *)(v491 + 8 * v225 + 2 * v246), (uint64_t)a1);
            int v254 = sub_10D24((uint64_t)a1, v251);
            if (v254 != sub_10D24((uint64_t)a1, (uint64_t)v253))
            {
              uint64_t v31 = a6;
              uint64_t v30 = a3;
              uint64_t v237 = a10;
              uint64_t v213 = (uint64_t)a1;
              uint64_t v214 = a4;
              uint64_t v210 = v516;
              goto LABEL_566;
            }

            uint64_t v31 = a6;
            uint64_t v30 = a3;
            uint64_t v236 = v532;
            uint64_t v237 = a10;
            uint64_t v210 = v516;
            if ((*(__int16 *)(a6 + 2 * v532) & 0x80000000) == 0
              && (*(unsigned __int16 *)(v498 + 2 * v246) | *(unsigned __int16 *)(a6 + 2 * v532)) != *(unsigned __int16 *)(a6 + 2 * v532))
            {
              goto LABEL_498;
            }

            uint64_t v247 = *(void *)(v251 + 24);
            if (v503 + v246)
            {
              BOOL v255 = v247 == 2 || (v252 & v247 & 2) == 0LL;
            }

            ++v246;
            uint64_t v332 = (uint64_t)v249;
            if (v532 + v246 >= v508) {
              goto LABEL_485;
            }
          }

          uint64_t v237 = a10;
          if ((_DWORD)v332 != 1)
          {
            uint64_t v213 = (uint64_t)a1;
            uint64_t v214 = a4;
LABEL_566:
            v331 = (unsigned __int16 *)v526;
LABEL_528:
            uint64_t v236 = v532;
            goto LABEL_529;
          }

          uint64_t v236 = v532;
          if ((_DWORD)v246) {
            goto LABEL_498;
          }
        }
      }

LABEL_485:
      v331 = (unsigned __int16 *)v526;
      if ((*(_BYTE *)(v526 + 35) & 2) != 0 && *(void *)(v237 + 8 * v236))
      {
        uint64_t v213 = (uint64_t)a1;
        uint64_t v214 = a4;
      }

      else
      {
        int v240 = v500 + v332;
        uint64_t v214 = a4;
        if ((*(_BYTE *)(v526 + 27) & 2) == 0 || !*(void *)(v237 + 8LL * v240))
        {
          int v241 = *(_DWORD *)(v210 + 16);
          if (v240 + 2 < v241 && (uint64_t v242 = *(void *)(v210 + 8), *(__int16 *)(v242 + 2 * v494) == -1))
          {
            int v243 = v489;
            uint64_t v213 = (uint64_t)a1;
            LODWORD(j) = v523;
LABEL_520:
            int v245 = *(unsigned __int16 *)(v242 + 2LL * v243);
          }

          else
          {
            uint64_t v213 = (uint64_t)a1;
            LODWORD(j) = v523;
            if (v240 < v241)
            {
              uint64_t v242 = *(void *)(v210 + 8);
              int v243 = v500 + v332;
              goto LABEL_520;
            }

            int v245 = 32;
          }

          uint64_t v257 = sub_16E60(v245, v213);
          uint64_t v258 = *(void *)(v526 + 24);
          unint64_t v259 = v258 & 0xFFFFFFFFFDFFFFFFLL;
          uint64_t v260 = v258 & v497;
          if (v259) {
            BOOL v261 = v260 == 0;
          }
          else {
            BOOL v261 = 0;
          }
          if (v261) {
            goto LABEL_527;
          }
          uint64_t v262 = v257[3];
          uint64_t v263 = *(void *)(v526 + 32);
          if ((v263 & 0xFFFFFFFFFDFFFFFFLL) != 0 && (v263 & v262) == 0) {
            goto LABEL_527;
          }
          if (*(_BYTE *)(v526 + 48))
          {
            int v264 = v500;
            if ((v500 & 0x80000000) == 0)
            {
              uint64_t v265 = v500;
              while ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v265), v213) + 24) & 2) != 0)
              {
                BOOL v216 = v265-- <= 0;
                if (v216)
                {
                  int v264 = -1;
                  goto LABEL_543;
                }
              }

              int v264 = v265 + 1;
            }

LABEL_543:
            int v266 = v332;
            LODWORD(v267) = *(_DWORD *)(v210 + 16);
            LODWORD(v332) = v500;
            if ((int)v267 > (int)v500)
            {
              uint64_t v332 = v532;
              while ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v332), v213) + 24) & 2) != 0)
              {
                ++v332;
                uint64_t v267 = *(int *)(v210 + 16);
                if (v332 >= v267) {
                  goto LABEL_549;
                }
              }

              LODWORD(v332) = v332 - 1;
              LODWORD(v267) = *(_DWORD *)(v210 + 16);
            }

LABEL_549:
            unsigned int v268 = v264 & ~(v264 >> 31);
            unsigned int v269 = v332 - v268 - ((_DWORD)v332 == (_DWORD)v267);
            int v270 = v269 + 1;
            uint64_t v332 = (uint64_t)calloc((int)(v269 + 2), 1uLL);
            int v271 = sub_16EBC((unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * v268), v270, (_BYTE *)v332, v213);
            uint64_t v30 = a3;
            if (v271)
            {
              uint64_t v272 = v494 - v268;
              do
              {
                char v273 = *(_BYTE *)(v332 + v272++);
              }

              while ((v273 & 1) == 0);
              free((void *)v332);
              goto LABEL_554;
            }

LABEL_555:
            free((void *)v332);
            LODWORD(v332) = v266;
            v331 = (unsigned __int16 *)v526;
            LODWORD(j) = v523;
          }

          uint64_t v237 = a10;
          uint64_t v236 = v532;
          switch((int)j)
          {
            case '=':
            case '>':
            case '?':
            case '@':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'G':
            case 'I':
            case 'T':
            case 'X':
            case 'Y':
            case 'n':
              goto LABEL_750;
            case 'E':
            case 'F':
            case 'H':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'R':
            case 'U':
            case 'o':
              goto LABEL_529;
            case 'J':
              if (!v485) {
                goto LABEL_529;
              }
              if (sub_1729C( v213,  v500,  v210,  74,  (uint64_t)v331,  &v543,  &v542,  &v541,  (signed int *)&v538,  (unint64_t *)&v537,  &v536)) {
                goto LABEL_742;
              }
              goto LABEL_527;
            case 'O':
              if (v461) {
                goto LABEL_742;
              }
              goto LABEL_527;
            case 'P':
            case 'Q':
              if (v473) {
                goto LABEL_529;
              }
              int v509 = v332;
              if ((int)v500 < 1)
              {
                int v276 = 1;
              }

              else
              {
                uint64_t v274 = 0LL;
                uint64_t v275 = v240;
                while (v275 + 1 <= *(int *)(v210 + 16)
                     && (*((_BYTE *)sub_16E60( *(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * (v471 + v274)),  v213)
                         + 24) & 2) != 0
                     && (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v275), v213) + 24) & 2) != 0)
                {
                  --v274;
                  ++v275;
                  if (v459 == v274)
                  {
                    int v276 = v494;
                    goto LABEL_697;
                  }
                }

                int v276 = 1 - v274;
              }

LABEL_697:
              int v312 = v276 - 1;
              while (2)
              {
                if (v312 < 1)
                {
LABEL_714:
                  uint64_t v30 = a3;
LABEL_554:
                  uint64_t v237 = a10;
                  goto LABEL_566;
                }

                uint64_t v313 = (int)v500 - v312;
                int v314 = sub_171F8( (unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v313),  (unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * v240),  v312,  v213);
                if (!v314)
                {
                  --v312;
LABEL_713:
                  if (v314) {
                    goto LABEL_714;
                  }
                  continue;
                }

                break;
              }

              uint64_t v315 = v469;
              while ((int)v315 > 0)
              {
                int v316 = *(_DWORD *)(v490 + 4 * v315);
                if (v316 == (_DWORD)v313) {
                  break;
                }
                --v315;
              }

              uint64_t v317 = v494 - v312;
              LODWORD(j) = v523;
              while (v317 < v240)
              {
                if (*(void *)(a10 + 8 * v317++)) {
                  goto LABEL_713;
                }
              }

              uint64_t v319 = v240 + 1LL;
              v331 = (unsigned __int16 *)v526;
              while (v319 < v312 + v240)
              {
                if (*(void *)(a10 + 8 * v319++)) {
                  goto LABEL_713;
                }
              }

              if ((int)v500 <= v312)
              {
                int v467 = v312;
                BOOL v311 = v523 == 81;
                uint64_t v30 = a3;
                uint64_t v237 = a10;
                LODWORD(v332) = v509;
                goto LABEL_725;
              }

              unsigned int v321 = *((_BYTE *)sub_16E60( *(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * ((int)v500 + ~v312)),  v213)
                     + 24) & 2;
              int v467 = v312;
              uint64_t v30 = a3;
              uint64_t v237 = a10;
              LODWORD(v332) = v509;
              uint64_t v236 = v532;
              if ((((v523 != 81) ^ (v321 >> 1)) & 1) == 0) {
                goto LABEL_529;
              }
LABEL_750:
              v544 = v331;
              if ((j & 0xFFFFFFFE) != 0x58) {
                goto LABEL_762;
              }
              int v209 = v486;
              if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v236), v213) + 24) & 1) == 0)
              {
                if (v486) {
                  int v328 = HIDWORD(v492);
                }
                else {
                  int v328 = 0;
                }
                int v329 = v500;
                if ((int)v500 < *(_DWORD *)(v210 + 16))
                {
                  uint64_t v330 = v532;
                  do
                  {
                    ++v330;
                  }

                  while (v330 < *(int *)(v210 + 16));
                  int v329 = v330;
                }

                int v545 = v328;
                *(_DWORD *)(a4 + 20) = v486;
                int v209 = v486;
                int v493 = v492;
                if (!sub_18EF4( v328,  v329,  (uint64_t)a1,  &v545,  v210,  a4,  a5,  a10,  (uint64_t *)&v544,  a13,  a14,  a2)) {
                  goto LABEL_1043;
                }
              }

              continue;
            case 'S':
            case 'V':
              uint64_t v277 = v494;
              while (v277 < v240)
              {
                if (*(void *)(a10 + 8 * v277++))
                {
                  int v279 = 1;
                  goto LABEL_572;
                }
              }

              int v279 = 0;
LABEL_572:
              if (v484 | v279 | v488) {
                goto LABEL_529;
              }
              LODWORD(j) = 83;
              goto LABEL_750;
            case 'W':
              if (!v473) {
                goto LABEL_742;
              }
              goto LABEL_527;
            case 'Z':
              if (v473) {
                goto LABEL_529;
              }
              v544 = v331;
              if (!v465 && !sub_19A90(v213, v500, v210, v497)
                || (v262 & 2) != 0
                || !((v483 == 90) | v262 & 1)
                || (LODWORD(j) = 90, !sub_19AF8(v213, v500, a2, v210, 90, v332, v458)))
              {
                LODWORD(j) = 83;
              }

              goto LABEL_743;
            case '[':
              if (v473) {
                goto LABEL_529;
              }
              uint64_t v280 = v494;
              while (v280 < v240)
              {
                if (*(void *)(a10 + 8 * v280++)) {
                  goto LABEL_529;
                }
              }

LABEL_588:
              if (!*(_DWORD *)(v213 + 944))
              {
                if (v465 && (v262 & 9) != 0) {
                  goto LABEL_750;
                }
                goto LABEL_529;
              }

              int v282 = j;
              uint64_t v283 = v500;
              while ((int)v283 >= 1)
              {
                uint64_t v284 = v283 - 1;
                v285 = sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v283 - 2), v213);
                uint64_t v236 = v532;
                uint64_t v237 = a10;
                uint64_t v283 = v284;
                if ((v285[25] & 0x40) == 0)
                {
                  v286 = sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v284), v213);
                  uint64_t v236 = v532;
                  uint64_t v237 = a10;
                  if ((v286[12] & 0x2001) == 0) {
                    goto LABEL_529;
                  }
                  break;
                }
              }

              int v287 = v500 + (__int16)v331[25];
              int v288 = *(_DWORD *)(v210 + 16);
              if (v287 >= v288)
              {
                LODWORD(j) = v282;
                goto LABEL_750;
              }

              while (2)
              {
                unint64_t v289 = *(unsigned int *)(v213 + 1696);
                if ((_DWORD)v289) {
                  BOOL v290 = v287 <= v288;
                }
                else {
                  BOOL v290 = 0;
                }
                if (!v290 || (int)v289 < 1)
                {
LABEL_602:
                  int v294 = v287;
                  goto LABEL_603;
                }

                int v292 = 0;
                uint64_t v293 = 488LL;
                int v294 = v287;
                while (2)
                {
                  if (!v292)
                  {
                    int v292 = *(unsigned __int16 *)(v213 + 2 * v293);
                    if (*(_WORD *)(v213 + 2 * v293))
                    {
LABEL_611:
                      if (*(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * v294) == v292)
                      {
                        int v292 = 1;
                      }

                      else
                      {
                        int v294 = v287 - 1;
                        int v292 = -1;
                      }
                    }

LABEL_617:
                    if (v294 >= v288) {
                      goto LABEL_602;
                    }
                    ++v294;
                    unint64_t v295 = v293 - 487;
                    ++v293;
                    if (v295 >= v289) {
                      goto LABEL_602;
                    }
                    continue;
                  }

                  break;
                }

                if (v292 != 1)
                {
                  if (*(_WORD *)(v213 + 2 * v293))
                  {
                    int v292 = -1;
                  }

                  else
                  {
                    int v294 = v287 - 1;
                    int v292 = 0;
                  }

                  goto LABEL_617;
                }

                int v292 = *(unsigned __int16 *)(v213 + 2 * v293);
                if (*(_WORD *)(v213 + 2 * v293)) {
                  goto LABEL_611;
                }
                if (v294 >= v288)
                {
LABEL_748:
                  uint64_t v237 = a10;
                  LODWORD(j) = v282;
                  goto LABEL_749;
                }

LABEL_603:
                uint64_t j = v294;
                if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2LL * v294), v213) + 25) & 0x80) != 0)
                {
                  int v287 = j + 1;
                  int v288 = *(_DWORD *)(v210 + 16);
                  continue;
                }

                break;
              }

              BOOL v311 = (*((_WORD *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * j), v213) + 12) & 0x2001) == 0;
              uint64_t v237 = a10;
              LODWORD(j) = v282;
LABEL_725:
              uint64_t v236 = v532;
              if (!v311) {
                goto LABEL_750;
              }
LABEL_529:
              uint64_t v225 = *((unsigned int *)v331 + 4);
              int v230 = v501;
              if (!(_DWORD)v225)
              {
                uint64_t v225 = 0LL;
                goto LABEL_733;
              }

              goto LABEL_484;
            case '\\':
              if (v473) {
                goto LABEL_529;
              }
              goto LABEL_527;
            case ']':
              char v296 = v470;
              if ((v262 & 1) == 0) {
                char v296 = 1;
              }
              uint64_t v297 = v240;
              do
              {
                uint64_t v298 = v297 + 1;
                uint64_t v299 = sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v297 + 2), v213);
                uint64_t v297 = v298;
              }

              while ((v299[24] & 1) != 0);
              LODWORD(j) = 93;
              goto LABEL_1034;
            case '^':
              char v300 = v470;
              if ((v262 & 1) == 0) {
                char v300 = 1;
              }
              if ((v300 & 1) != 0) {
                goto LABEL_529;
              }
              uint64_t v301 = v240 + 1LL;
              do
              {
                uint64_t v302 = *((void *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v301), v213) + 3);
                uint64_t v236 = v532;
                ++v301;
              }

              while ((v302 & 1) != 0);
              if ((v302 & 0x102) == 0)
              {
LABEL_694:
                uint64_t v237 = a10;
                goto LABEL_529;
              }

              LODWORD(j) = 94;
              if (sub_19AF8(v213, v500, a2, v210, 94, v332, v458))
              {
LABEL_1034:
                uint64_t v237 = a10;
LABEL_749:
                uint64_t v236 = v532;
                goto LABEL_750;
              }

              goto LABEL_527;
            case '_':
              if (v462 || v483 == 94) {
                goto LABEL_529;
              }
              if ((v262 & 1) != 0) {
                goto LABEL_742;
              }
              goto LABEL_527;
              goto LABEL_588;
            case 'a':
              BOOL v303 = (v262 & 0xB) == 0;
              goto LABEL_650;
            case 'b':
              BOOL v303 = (v262 & 9) == 0;
              goto LABEL_652;
            case 'c':
              BOOL v303 = (v262 & 2) == 0;
LABEL_650:
              char v304 = v470;
              goto LABEL_676;
            case 'd':
              BOOL v303 = (v262 & 2) == 0;
LABEL_652:
              char v304 = v466;
              goto LABEL_676;
            case 'e':
              BOOL v303 = (v262 & 2) == 0;
              goto LABEL_657;
            case 'f':
              uint64_t v305 = 11LL;
              goto LABEL_656;
            case 'g':
              uint64_t v305 = 9LL;
LABEL_656:
              BOOL v303 = (v262 & v305) == 0;
LABEL_657:
              char v304 = v468;
              goto LABEL_676;
            case 'h':
              if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v532), v213) + 24) & 8) == 0
                || (int)v500 >= 1
                && (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v471), v213) + 24) & 2) != 0
                || v240 >= *(_DWORD *)(v210 + 16))
              {
                goto LABEL_527;
              }

              uint64_t v306 = v532 + (int)v332;
              int v307 = v493;
              while ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v306), v213) + 24) & 6) == 0)
              {
                if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v306), v213) + 24) & 1) == 0
                  && ++v306 < *(int *)(v210 + 16))
                {
                  continue;
                }

                goto LABEL_527;
              }

              v544 = v331;
              LODWORD(j) = 104;
              goto LABEL_846;
            case 'i':
              if (*(_DWORD *)(v210 + 16) - 1 <= (int)v500)
              {
                int v307 = v493;
                if ((v500 & 0x80000000) != 0)
                {
LABEL_527:
                  uint64_t v237 = a10;
                  goto LABEL_528;
                }
              }

              else
              {
                v308 = sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v494), v213);
                int v307 = v493;
                if ((v500 & 0x80000000) != 0 || (v308[3] & 2) != 0) {
                  goto LABEL_527;
                }
              }

              uint64_t v322 = v500;
              while ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v322), v213) + 24) & 6) == 0)
              {
                v323 = sub_16E60(*(unsigned __int16 *)(*(void *)(v210 + 8) + 2 * v322), v213);
                if ((int)v322 >= 1)
                {
                  --v322;
                  if ((v323[3] & 1) == 0) {
                    continue;
                  }
                }

                goto LABEL_527;
              }

              v544 = v331;
              LODWORD(j) = 105;
LABEL_846:
              uint64_t v237 = a10;
              goto LABEL_763;
            case 'j':
              if (!v465) {
                goto LABEL_529;
              }
              if ((v262 & 4) != 0) {
                goto LABEL_742;
              }
              goto LABEL_527;
            case 'k':
              BOOL v303 = (v262 & 4) == 0;
              char v304 = v464;
LABEL_676:
              if (v303) {
                char v304 = 1;
              }
              if ((v304 & 1) == 0) {
                goto LABEL_742;
              }
              goto LABEL_527;
            case 'l':
              if ((v463 & 1) == 0) {
                goto LABEL_527;
              }
LABEL_742:
              v544 = v331;
LABEL_743:
              uint64_t v237 = a10;
              goto LABEL_762;
            case 'm':
              if ((v262 & 4) == 0) {
                goto LABEL_529;
              }
              v544 = v331;
              if ((v497 & 4) != 0) {
                LODWORD(j) = 107;
              }
              else {
                LODWORD(j) = 109;
              }
              goto LABEL_762;
            case 'p':
              if (v473) {
                goto LABEL_529;
              }
              uint64_t v309 = v494;
              while (v309 < v240)
              {
                if (*(void *)(a10 + 8 * v309++)) {
                  goto LABEL_529;
                }
              }

              uint64_t v324 = v213 + 8LL * *((unsigned int *)v331 + 10);
              if (!_lou_pattern_check(*(void *)(v210 + 8), v471, 0xFFFFFFFF, 0xFFFFFFFFLL, v324 + 31618, v213)
                || !_lou_pattern_check( *(void *)(v210 + 8),  v500 + (__int16)v331[25],  *(_DWORD *)(v210 + 16),  1LL,  v324 + 31616 + 2LL * *(unsigned __int16 *)(v324 + 31616),  v213))
              {
                goto LABEL_527;
              }

              LODWORD(j) = 112;
              goto LABEL_1034;
            default:
              goto LABEL_527;
          }
        }

        uint64_t v213 = (uint64_t)a1;
      }

      break;
    }

    int v230 = v501;
LABEL_733:
    if (!++v230) {
      goto LABEL_479;
    }
    if (v230 == 1)
    {
      if (v495 > 0)
      {
        int v495 = 1;
        int v238 = v472;
LABEL_481:
        uint64_t v225 = *v238;
        goto LABEL_482;
      }

      goto LABEL_482;
    }

    if (v230 != 2) {
      goto LABEL_482;
    }
    v331 = (unsigned __int16 *)&unk_29EB8;
    v544 = (unsigned __int16 *)&unk_29EB8;
    LODWORD(j) = 117;
    dword_29EE4 = 117;
    LODWORD(v332) = 1;
    word_29EEA = 1;
    word_29EEE = *(_WORD *)(*(void *)(v210 + 8) + 2 * v236);
    word_29EEC = 0;
LABEL_762:
    int v307 = v493;
LABEL_763:
    int v524 = j;
    int v510 = v332;
    if (v467)
    {
      int v333 = v332 + v500;
      int v545 = v332 + v500;
    }

    else
    {
      int v333 = v545;
    }

    if (v307 <= v333)
    {
      do
      {
        uint64_t v334 = v237;
        sub_1911C(0LL, 1, 1, 0, v307, v213, v333, v516, v214, a5, v237, a13, a14);
        if (a11)
        {
          sub_1911C(0LL, 1, 0, 1, v307, v213, v333, v516, v214, a5, v334, a13, a14);
          sub_1911C(1uLL, 0, 0, 1, v307, v213, v333, v516, v214, a5, v334, a13, a14);
        }

        if (v307 < v333) {
          sub_1911C(1uLL, 0, 1, 0, v307, v213, v333, v516, v214, a5, a10, a13, a14);
        }
        ++v307;
        uint64_t v237 = a10;
      }

      while (v333 + 1 != v307);
    }

    int v493 = v333 + 1;
    int v533 = v333;
    if ((_DWORD)j == 96)
    {
      uint64_t v335 = *(unsigned int *)(v213 + 968);
      int v209 = v486;
      v336 = (unsigned int *)v516;
      uint64_t v31 = a6;
      if ((_DWORD)v335) {
        sub_18BA0( (void *)(v213 + 8 * v335 + 31670),  0,  *(__int16 *)(v213 + 8 * v335 + 31668),  0,  v333,  v516,  v214,  a5,  a13,  a14);
      }
      uint64_t v337 = *(unsigned int *)(v213 + 960);
      if ((_DWORD)v337)
      {
        uint64_t v338 = v213 + 8 * v337;
        v339 = (void *)(v338 + 31670);
        int v340 = *(__int16 *)(v338 + 31668);
        goto LABEL_777;
      }

      goto LABEL_806;
    }

    uint64_t v341 = *(unsigned int *)(v213 + 960);
    int v209 = v486;
    v336 = (unsigned int *)v516;
    uint64_t v31 = a6;
    if (!(_DWORD)v341) {
      goto LABEL_806;
    }
    if (*(_DWORD *)(v516 + 16) <= v533) {
      goto LABEL_806;
    }
    v342 = sub_16E60(*(unsigned __int16 *)(*(void *)(v516 + 8) + 2LL * v533), v213);
    if ((v497 & 2) != 0) {
      goto LABEL_806;
    }
    if ((v342[3] & 2) == 0) {
      goto LABEL_806;
    }
    if (*(_DWORD *)(v516 + 16) > v493)
    {
      v343 = sub_16E60(*(unsigned __int16 *)(*(void *)(v516 + 8) + 2LL * v493), v213);
      if ((v497 & 4) == 0 && (v343[3] & 2) != 0) {
        goto LABEL_806;
      }
    }

    uint64_t v344 = *(void *)(v516 + 8);
    if (v533 >= 1)
    {
      unint64_t v345 = *(unsigned int *)(v213 + 2676);
      if ((int)v345 >= 1)
      {
        int v346 = *(unsigned __int16 *)(v344 + 2LL * (v533 - 1));
        unint64_t v347 = 0LL;
        do
        {
          if (v345 - 1 == v347) {
            goto LABEL_793;
          }
          int v348 = *(unsigned __int16 *)(v476 + 2 * v347++);
        }

        while (v348 != v346);
        if (v347 < v345) {
          goto LABEL_806;
        }
      }
    }

LABEL_793:
    unint64_t v349 = *(unsigned int *)(v213 + 3192);
    if ((int)v349 >= 1)
    {
      int v350 = *(unsigned __int16 *)(v344 + 2LL * v533);
      unint64_t v351 = 0LL;
      do
      {
        if (v349 - 1 == v351) {
          goto LABEL_799;
        }
        int v352 = *(unsigned __int16 *)(v477 + 2 * v351++);
      }

      while (v352 != v350);
      if (v351 < v349) {
        goto LABEL_806;
      }
    }

LABEL_799:
    if (v493 < *(_DWORD *)(v516 + 16))
    {
      unint64_t v353 = *(unsigned int *)(v213 + 3324);
      if ((int)v353 >= 1)
      {
        int v354 = *(unsigned __int16 *)(v344 + 2LL * v493);
        unint64_t v355 = 0LL;
        do
        {
          if (v353 - 1 == v355) {
            goto LABEL_984;
          }
          int v356 = *(unsigned __int16 *)(v474 + 2 * v355++);
        }

        while (v356 != v354);
        if (v355 < v353) {
          goto LABEL_806;
        }
      }
    }

LABEL_984:
    v339 = (void *)(v213 + 8 * v341 + 31670);
    int v340 = *(__int16 *)(v213 + 8 * v341 + 31668);
LABEL_777:
    if (sub_18BA0(v339, 0, v340, 0, v533, (uint64_t)v336, v214, a5, a13, a14))
    {
LABEL_806:
      sub_1911C(1uLL, 0, 1, 0, v533, v213, v533, (uint64_t)v336, v214, a5, a10, a13, a14);
      uint64_t v357 = *(unsigned int *)(v213 + 964);
      if (*(_DWORD *)(v213 + 948))
      {
        if (!*(_DWORD *)(v213 + 964)) {
          goto LABEL_849;
        }
      }

      else
      {
        if (!*(_DWORD *)(v213 + 964)) {
          goto LABEL_849;
        }
        if ((int)v336[4] > v533
          && (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2LL * v533), v213) + 24) & 4) != 0)
        {
          BOOL v359 = (v497 & 4) != 0 || v483 == 107;
          BOOL v360 = !v359;
          if ((v483 == 84 || v360)
            && !sub_18BA0( (void *)(v213 + 8 * v357 + 31670),  0,  *(__int16 *)(v213 + 8 * v357 + 31668),  0,  v533,  (uint64_t)v336,  v214,  a5,  a13,  a14))
          {
            break;
          }
        }

        if (!*(_DWORD *)(v213 + 948)) {
          goto LABEL_849;
        }
        uint64_t v357 = *(unsigned int *)(v213 + 964);
        if (!*(_DWORD *)(v213 + 964)) {
          goto LABEL_849;
        }
      }

      uint64_t v358 = *((void *)sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2LL * v533), v213) + 3);
      if (!v480)
      {
        if ((v358 & 0x104) == 0)
        {
          if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2LL * v533), v213) + 25) & 8) != 0)
          {
            uint64_t v368 = v533 + 1LL;
            do
            {
              v369 = sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2 * v368++), v213);
            }

            while ((v369[25] & 8) != 0);
          }

LABEL_842:
          int v480 = 0;
LABEL_843:
          LODWORD(j) = v524;
          goto LABEL_849;
        }

        uint64_t v361 = *(unsigned int *)(v213 + 968);
        if ((_DWORD)v361)
        {
          uint64_t v362 = *(unsigned int *)(v213 + 972);
          if ((_DWORD)v362)
          {
            uint64_t v363 = v213 + 8 * v361 + 31616;
            uint64_t v364 = v213 + 8 * v362 + 31616;
            int v365 = *(unsigned __int16 *)(v363 + 52);
            if (v365 == *(unsigned __int16 *)(v364 + 52))
            {
              int v366 = memcmp((const void *)(v363 + 54), (const void *)(v364 + 54), 2LL * (__int16)v365);
              int v367 = v488;
              if (!v366) {
                int v367 = 1;
              }
              int v488 = v367;
            }

            int v480 = 1;
          }

          else
          {
            int v480 = 1;
          }
        }

        else
        {
LABEL_844:
          int v480 = 1;
          LODWORD(j) = v524;
        }

LABEL_848:
        sub_18BA0( (void *)(v213 + 8 * v357 + 31670),  0,  *(__int16 *)(v213 + 8 * v357 + 31668),  0,  v533,  (uint64_t)v336,  v214,  a5,  a13,  a14);
        goto LABEL_849;
      }

      if ((v358 & 0x4000904) != 0) {
        goto LABEL_843;
      }
      uint64_t v357 = *(unsigned int *)(v213 + 972);
      if (!(_DWORD)v357) {
        goto LABEL_842;
      }
      int v480 = 0;
LABEL_849:
      if ((_DWORD)j != 74)
      {
        if (!v485) {
          goto LABEL_864;
        }
        v372 = v331;
        uint64_t v373 = *v478;
        if (!(_DWORD)v373)
        {
LABEL_863:
          v331 = v372;
          v544 = v372;
          v336 = (unsigned int *)v516;
LABEL_864:
          if (qword_29E50)
          {
            uint64_t v375 = dword_29E48;
            int v376 = v533;
            if (dword_29E48 < dword_29E58)
            {
              ++dword_29E48;
              *(void *)(qword_29E50 + 8 * v375) = v331;
            }
          }

          else
          {
            int v376 = v533;
          }

          int v377 = v510;
LABEL_869:
          uint64_t v378 = v376;
          else {
            int v379 = v488;
          }
          if ((int)j <= 107)
          {
            uint64_t v380 = v481;
            int v381 = v467;
            switch((int)j)
            {
              case 'O':
                goto LABEL_884;
              case 'P':
              case 'Q':
                uint64_t v380 = (v533 - (v467 + v377));
                goto LABEL_885;
              case 'R':
              case 'S':
              case 'T':
              case 'U':
              case 'V':
              case 'X':
              case 'Y':
                goto LABEL_885;
              case 'W':
                BOOL v485 = 1;
                LODWORD(j) = 87;
                if (v379) {
                  continue;
                }
                int v488 = 0;
                BOOL v485 = 1;
                if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2 * v378), (uint64_t)a1) + 24) & 1) != 0
                  || (a2 & 1) != 0)
                {
                  continue;
                }

                int v396 = HIDWORD(v492);
                if (!v209) {
                  int v396 = 0;
                }
                int v545 = v396;
                *(_DWORD *)(a4 + 20) = v209;
                int v488 = 1;
                int v493 = v492;
                goto LABEL_747;
              case 'Z':
                if (v483 != 90)
                {
                  LODWORD(j) = 90;
                  goto LABEL_932;
                }

                int v397 = *(_DWORD *)(a4 + 20);
                if (v397 > 0)
                {
                  v398 = v331;
                  int v399 = j;
                  int v400 = 0;
                  uint64_t v401 = *(void *)(a4 + 8);
                  do
                  {
                    if ((*((_BYTE *)sub_18730( *(unsigned __int16 *)(v401 + 2LL * (v397 - 1)),  (uint64_t)a1)
                          + 24) & 1) == 0)
                      break;
                    uint64_t v401 = *(void *)(a4 + 8);
                    int v402 = *(_DWORD *)(a4 + 20);
                    BOOL v403 = __OFSUB__(v402, 1);
                    int v397 = v402 - 1;
                    *(_DWORD *)(a4 + 20) = v397;
                  }

                  while (!((v397 < 0) ^ v403 | (v397 == 0)));
                  if (v400)
                  {
                    uint64_t v404 = *(int *)(a4 + 20);
                    *(_WORD *)(*(void *)(a4 + 8) + 2 * v404) = -1;
                    *(_DWORD *)(a4 + 20) = v404 + 1;
                  }

                  uint64_t v380 = v481;
                  LODWORD(j) = v399;
                  v331 = v398;
                  goto LABEL_885;
                }

                v388 = &v331[v377 + 27];
                int v389 = (__int16)v331[26];
                LODWORD(j) = 90;
                if (v331[26]) {
                  goto LABEL_934;
                }
                break;
              default:
                if ((_DWORD)j != 61) {
                  goto LABEL_885;
                }
LABEL_884:
                int v379 = 0;
                goto LABEL_885;
            }

LABEL_898:
            if (v377 >= 1)
            {
              v517 = v331;
              int v392 = j;
              int v393 = 0;
              uint64_t v394 = (uint64_t)v546;
              while (sub_18AA0( *(unsigned __int16 *)(*(void *)(v394 + 8) + 2 * v378),  (uint64_t)a1,  v533 + v393,  v394,  a4,  a5,  a13,  a14,  a2))
              {
                ++v378;
                ++v393;
                if (v378 >= *(int *)(v394 + 16) || v393 >= v377)
                {
                  int v382 = v533 + v393;
                  int v381 = v467;
                  LODWORD(j) = v392;
                  v331 = v517;
                  goto LABEL_930;
                }
              }

              int v545 = v533 + v393;
              break;
            }

            int v382 = v533;
LABEL_930:
            int v545 = v382;
LABEL_939:
            if ((int)j <= 92)
            {
              int v406 = v481;
              if ((_DWORD)j == 79)
              {
                uint64_t v423 = (uint64_t)v546;
                int v424 = v546[4] - v377;
                if (v424 > a15 && v482 != 0) {
                  int v424 = a15 - 1;
                }
                if (v382 <= v424)
                {
                  v426 = v331 + 27;
                  uint64_t v427 = v382;
                  uint64_t v428 = v424;
                  while (sub_171F8( v426,  (unsigned __int16 *)(*(void *)(v423 + 8) + 2 * v427),  v377,  (uint64_t)a1))
                  {
                    if (*a14)
                    {
                      uint64_t v429 = v427 + v377;
                    }

                    else
                    {
                      uint64_t v430 = *a13;
                      uint64_t v429 = v427 + v377;
                      if (v427 <= v430 && v429 > v430)
                      {
                        *a14 = 1;
                        *a13 = *(_DWORD *)(a4 + 20) - 1;
                      }
                    }

                    uint64_t v427 = v429;
                    if (v429 > v428) {
                      goto LABEL_1023;
                    }
                  }

                  LODWORD(v429) = v427;
LABEL_1023:
                  int v382 = v429;
                  int v209 = v486;
                }

                int v545 = v382;
                LODWORD(j) = 79;
              }

              else
              {
                int v527 = v379;
                int v407 = v382;
                if ((_DWORD)j == 80) {
                  goto LABEL_991;
                }
                if ((_DWORD)j == 81)
                {
                  size_t v408 = 0LL;
                  uint64_t v409 = 0LL;
                  uint64_t v410 = 0LL;
                  v411 = v331;
                  v412 = &v331[v377];
                  v413 = v412 + 27;
                  v414 = (char *)(v412 + 28);
                  do
                  {
                    uint64_t v415 = v410;
                    int v416 = *(unsigned __int16 *)&v414[v408];
                    --v410;
                    v409 += 0x100000000LL;
                    v408 += 2LL;
                  }

                  while (v416 != 44);
                  uint64_t v417 = *(unsigned int *)(a4 + 20);
                  if ((int)v417 > 0)
                  {
                    while (1)
                    {
                      int v418 = *(_DWORD *)(v490 + 4 * v417);
                      *(_WORD *)(*(void *)(a4 + 8) + 2 * v417 + 2LL * -(int)v410 - 2) = *(_WORD *)(*(void *)(a4 + 8) + 2 * v417 - 2);
                      *(_DWORD *)(v490 + 4LL * -(int)v410 + 4 * v417--) = v418;
                      if ((unint64_t)(v417 + 1) <= 1)
                      {
                        int v419 = 0;
                        goto LABEL_986;
                      }
                    }
                  }

                  int v419 = v417;
LABEL_986:
                  memcpy((void *)(*(void *)(a4 + 8) + 2LL * v419), v413, v408);
                  uint64_t v432 = 0LL;
                  do
                    *(_DWORD *)(a5 + 4LL * v419 + 4 * v432++) = *(_DWORD *)(a5 + 4LL * v419);
                  while (v415 + v432 != 1);
                  *(_DWORD *)(a4 + 20) -= v410;
                  int v406 = v481;
                  v331 = v411;
                  if (*a14 && *a13 >= v419) {
                    *a13 -= v410;
                  }
LABEL_991:
                  int v525 = j;
                  uint64_t v433 = (uint64_t)v546;
                  else {
                    int v435 = a15;
                  }
                  int v436 = v407 + v381;
                  if (v407 + v381 <= v435)
                  {
                    char v437 = 0;
                    uint64_t v534 = v406;
                    v518 = v331 + 27;
                    uint64_t v438 = *((void *)v546 + 1);
                    int v439 = v407 - 1;
                    do
                    {
                      if (!sub_171F8( (unsigned __int16 *)(v438 + 2 * v534),  (unsigned __int16 *)(v438 + 2LL * v407),  v381,  (uint64_t)a1)) {
                        break;
                      }
                      if ((v437 & 1) != 0)
                      {
                        uint64_t v440 = v439 + 1LL;
                        while (v440 < v407 + v381 - 1)
                        {
                          if (*(void *)(a10 + 8 * v440++)) {
                            goto LABEL_1017;
                          }
                        }
                      }

                      if (!*a14 && *a13 >= v407 - v377 && *a13 < v436)
                      {
                        *a14 = 1;
                        *a13 = *(_DWORD *)(a4 + 20) - 1;
                      }

                      int v407 = v436 + v377;
                      if (v436 + v377 > v435) {
                        break;
                      }
                      uint64_t v438 = *(void *)(v433 + 8);
                      int v443 = memcmp(v518, (const void *)(v438 + 2LL * v436), 2LL * v377);
                      int v436 = v407 + v381;
                      v439 += v381 + v377;
                      char v437 = 1;
                    }

                    while (!v443 && v436 <= v435);
                  }

LABEL_1017:
                  v407 -= v377;
                  int v545 = v407;
                  uint64_t v31 = a6;
                  uint64_t v30 = a3;
                  int v209 = v486;
                  LODWORD(j) = v525;
                }

                int v382 = v407;
                int v379 = v527;
              }

LABEL_1025:
              if (a7)
              {
                int v445 = *(unsigned __int8 *)(a7 + v382);
              }

              BOOL v446 = (j - 62) >= 0xA && (j - 83) >= 0x23;
              int v447 = v483;
              if (!v446) {
                int v447 = j;
              }
              int v483 = v447;
              BOOL v485 = 1;
              int v488 = v379;
              continue;
            }

            LODWORD(v383) = v382;
            int v420 = j;
            uint64_t v421 = (uint64_t)v546;
            if ((int)v383 < (int)v546[4])
            {
              uint64_t v383 = (int)v383;
              uint64_t v422 = *((void *)v546 + 1);
              do
              {
                uint64_t v422 = *(void *)(v421 + 8);
                ++v383;
              }

              while (v383 < *(int *)(v421 + 16));
            }

            int v545 = v383;
            LODWORD(j) = v420;
LABEL_957:
            int v382 = v383;
            goto LABEL_1025;
          }

          uint64_t v380 = v481;
          int v381 = v467;
          if ((_DWORD)j == 109)
          {
            if (!a1[237])
            {
              uint64_t v405 = a1[241];
              if ((_DWORD)v405)
              {
                if (!sub_18BA0( (char *)&a1[2 * v405 + 7917] + 2 * SHIWORD(a1[2 * v405 + 7916]) + 2,  SHIWORD(a1[2 * v405 + 7916]),  SLOWORD(a1[2 * v405 + 7917]),  0,  v533,  (uint64_t)v336,  a4,  a5,  a13,  a14)) {
                  break;
                }
              }
            }

            LODWORD(j) = 107;
LABEL_932:
            v388 = &v331[v377 + 27];
            int v389 = (__int16)v331[26];
          }

          else
          {
            if ((_DWORD)j == 108)
            {
              if (a1[240]
                && (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*((void *)v336 + 1) + 2 * v378), (uint64_t)a1) + 24) & 2) != 0)
              {
                --*(_DWORD *)(a4 + 20);
              }

              LODWORD(j) = 108;
              goto LABEL_932;
            }

LABEL_885:
            uint64_t v481 = v380;
            if ((_DWORD)j == 117)
            {
              if (!sub_18AA0( *(unsigned __int16 *)(*((void *)v546 + 1) + 2 * v378),  (uint64_t)a1,  v533,  (uint64_t)v546,  a4,  a5,  a13,  a14,  a2)) {
                break;
              }
              int v545 = v493;
              LODWORD(j) = 117;
              int v382 = v493;
              goto LABEL_1025;
            }

            if ((_DWORD)j == 73)
            {
              int v382 = v377 + v533;
              int v545 = v377 + v533;
              if ((__int16)v331[26] < 1)
              {
                LODWORD(j) = 73;
                goto LABEL_1025;
              }

              LODWORD(v383) = v377 + v533;
              v384 = &v331[v377 + 27];
              uint64_t v385 = v331[26];
              uint64_t v386 = (uint64_t)v546;
              do
              {
                int v387 = *v384++;
                --v385;
              }

              while (v385);
              LODWORD(j) = 73;
              goto LABEL_957;
            }

            v388 = &v331[v377 + 27];
            int v389 = (__int16)v331[26];
            if ((_DWORD)j == 81)
            {
              uint64_t v390 = 0LL;
              do
                int v391 = v331[v377 + 28 + v390++];
              while (v391 != 44);
              v388 += (v390 + 1);
              v389 += ~(_DWORD)v390;
              LODWORD(j) = 81;
              if (!v389) {
                goto LABEL_898;
              }
              goto LABEL_934;
            }
          }

          if (!v389) {
            goto LABEL_898;
          }
LABEL_934:
          if (v381)
          {
            int v382 = v533;
          }

          else
          {
            int v545 = v377 + v533;
            int v382 = v377 + v533;
          }

          goto LABEL_939;
        }

        while (1)
        {
          v331 = (unsigned __int16 *)(v213 + 8 * v373 + 31616);
          int v374 = *(_DWORD *)(v213 + 8 * v373 + 31660);
          if (sub_1729C( v213,  v533,  v516,  v374,  (uint64_t)v331,  &v543,  &v542,  &v541,  (signed int *)&v538,  (unint64_t *)&v537,  &v536)) {
            break;
          }
          uint64_t v373 = *((unsigned int *)v331 + 4);
          if (!(_DWORD)v373) {
            goto LABEL_863;
          }
        }

        v544 = v331;
        if (v374 != 74)
        {
          int v377 = 0;
          LODWORD(j) = v374;
          v336 = (unsigned int *)v516;
          int v376 = v533;
          goto LABEL_869;
        }

        v336 = (unsigned int *)v516;
        uint64_t v214 = a4;
      }

      if (qword_29E50)
      {
        uint64_t v370 = dword_29E48;
        if (dword_29E48 < dword_29E58)
        {
          ++dword_29E48;
          *(void *)(qword_29E50 + 8 * v370) = v331;
        }
      }

      if (!sub_17E08( v213,  (uint64_t *)&v546,  v214,  a5,  74,  (uint64_t)&v544,  v543,  v542,  v541,  &v545,  v538,  v539,  v540,  a13,  a14,  v537,  v536,  v457)) {
        break;
      }
      uint64_t v371 = *v336;
      BOOL v485 = v545 != v533;
      LODWORD(j) = 74;
      continue;
    }

    break;
  }

LABEL_1043:
  int v451 = v545;
  v452 = v546;
  if (v209)
  {
    uint64_t v453 = (uint64_t)a1;
    if (v545 < (int)v546[4]
      && (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*((void *)v546 + 1) + 2LL * v545), (uint64_t)a1) + 24) & 1) == 0)
    {
      *(_DWORD *)(a4 + 20) = v209;
      int v451 = HIDWORD(v492);
    }
  }

  else
  {
    uint64_t v453 = (uint64_t)a1;
  }

  if (v451 < (int)v452[4])
  {
    uint64_t v454 = 2LL * v451;
    do
    {
      ++v451;
      v454 += 2LL;
    }

    while (v451 != v452[4]);
  }

  *a12 = v451;
  uint64_t v455 = *v452;
}

uint64_t lou_translatePrehyphenated( char *a1, unsigned __int16 *a2, int *a3, unsigned __int16 *a4, int *a5, __int16 *a6, _BYTE *a7, void *__b, uint64_t a9, unsigned int *a10, uint64_t a11, uint64_t a12, int a13)
{
  unsigned __int16 v15 = a6;
  int v17 = a4;
  uint64_t v21 = a9;
  if (a11)
  {
    if (a12)
    {
      if (a9)
      {
        int v22 = 0LL;
      }

      else
      {
        uint64_t v32 = a7;
        int v24 = malloc(4LL * *a5);
        int v17 = a4;
        unsigned __int16 v15 = a6;
        a7 = v32;
        uint64_t v21 = (uint64_t)v24;
        int v22 = v24;
        if (!v24) {
          _lou_outOfMemory();
        }
      }

      int v33 = v22;
      if (_lou_translate(a1, a1, a2, a3, v17, a5, v15, a7, __b, v21, a10, a13, 0LL, 0LL) && *a5 >= 1)
      {
        uint64_t v25 = 0LL;
        int v26 = 0;
        while (1)
        {
          uint64_t v27 = *(unsigned int *)(v21 + 4 * v25);
          else {
            char v28 = *(_BYTE *)(a11 + v27);
          }
          *(_BYTE *)(a12 + v25++) = v28;
          int v26 = v27;
          if (v25 >= *a5) {
            goto LABEL_16;
          }
        }

        uint64_t v23 = 0LL;
      }

      else
      {
LABEL_16:
        uint64_t v23 = 1LL;
      }

      if (v33) {
        free(v33);
      }
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    _lou_translate(a1, a1, a2, a3, a4, a5, a6, a7, __b, a9, a10, a13, 0LL, 0LL);
    return 1LL;
  }

  return v23;
}

void sub_16B00()
{
}

uint64_t lou_hyphenate(char *a1, unsigned __int16 *a2, int a3, char *a4, int a5)
{
  uint64_t Table = lou_getTable(a1);
  uint64_t result = 0LL;
  if (a4)
  {
    if (a2)
    {
      if (Table)
      {
        uint64_t result = 0LL;
        if (a3 <= 99)
        {
          if (*(_DWORD *)(Table + 2544))
          {
            if (a5)
            {
              int v35 = a3;
              int v36 = 100;
              int v12 = malloc(0x190uLL);
              if (!lou_backTranslate(a1, a2, &v35, v37, &v36, 0LL, 0LL, 0LL, (uint64_t)v12, 0LL, 0))
              {
                free(v12);
                return 0LL;
              }

              uint64_t v32 = (int *)v12;
              int v13 = v36;
              int v14 = (char *)malloc(v36 + 1LL);
            }

            else
            {
              __memcpy_chk(v37, a2, 2LL * a3, 200LL);
              int v36 = a3;
              int v13 = a3;
              int v14 = a4;
            }

            __b = a4;
            int v33 = a5;
            if (v13 < 1)
            {
              uint64_t v15 = 0LL;
            }

            else
            {
              uint64_t v15 = v13;
              memset(v14, 48, v13);
            }

            LODWORD(v16) = 0;
            v14[v15] = 0;
            while (1)
            {
              if ((int)v16 < v13)
              {
                uint64_t v16 = (int)v16;
                do
                {
                  int v17 = sub_16E60(v37[v16], Table);
                  int v13 = v36;
                  if ((v17[24] & 2) != 0) {
                    break;
                  }
                  ++v16;
                }

                while (v16 < v36);
              }

              if ((_DWORD)v16 == v13) {
                break;
              }
              uint64_t v18 = (int)v16 + 1LL;
              LODWORD(v19) = v18;
              if ((int)v18 < v13)
              {
                uint64_t v19 = (int)v18;
                do
                {
                  if ((*((_BYTE *)sub_16E60(v37[v19], Table) + 24) & 2) == 0) {
                    break;
                  }
                  ++v19;
                }

                while (v19 < v36);
              }

              uint64_t result = sub_16EBC(&v37[(int)v16], (int)v19 - (int)v16, &v14[(int)v16], Table);
              if (!(_DWORD)result) {
                return result;
              }
              uint64_t v20 = *((unsigned int *)sub_16E60(v37[(v16 - 1)], Table) + 5);
              if (!(_DWORD)v20) {
                goto LABEL_30;
              }
              while (1)
              {
                uint64_t v21 = Table + 8 * v20 + 31616;
                if (*(_DWORD *)(v21 + 44) == 110) {
                  break;
                }
                uint64_t v20 = *(unsigned int *)(v21 + 20);
                if (!(_DWORD)v20) {
                  goto LABEL_30;
                }
              }

              else {
LABEL_30:
              }
                char v22 = 48;
              v14[(int)v16] = v22;
              if ((int)v18 < (int)v19)
              {
                uint64_t v23 = &v14[v18];
                int v24 = ~(_DWORD)v16 + v19;
                do
                {
                  *uint64_t v23 = *v23 & 1 | 0x30;
                  ++v23;
                  --v24;
                }

                while (v24);
              }

              int v13 = v36;
              if ((_DWORD)v19 == v36)
              {
                int v13 = v19;
                break;
              }

              v14[(int)v19] = 48;
              LODWORD(v16) = v19 + 1;
            }

            if (v33)
            {
              if (a3 < 1)
              {
                uint64_t v25 = 0LL;
              }

              else
              {
                uint64_t v25 = a3;
                memset(__b, 48, a3);
              }

              __b[v25] = 0;
              if (v13 >= 1)
              {
                int v26 = -1;
                uint64_t v27 = v32;
                char v28 = v14;
                uint64_t v29 = v13;
                do
                {
                  int v31 = *v27++;
                  uint64_t v30 = v31;
                  if (v31 > a3 || (v30 & 0x80000000) != 0) {
                    break;
                  }
                  if ((int)v30 > v26)
                  {
                    __b[v30] = *v28;
                    int v26 = v30;
                  }

                  ++v28;
                  --v29;
                }

                while (v29);
              }

              free(v14);
              free(v32);
            }

            return 1LL;
          }
        }
      }
    }
  }

  return result;
}

void *sub_16E60(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 13608);
  if ((_DWORD)v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!(_DWORD)v4) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t result = &unk_25048;
    word_25074 = a1;
  }

  return result;
}

uint64_t sub_16EBC(unsigned __int16 *a1, int a2, _BYTE *a3, uint64_t a4)
{
  uint64_t result = 0LL;
  if (a2 <= 2045)
  {
    uint64_t v7 = *(unsigned int *)(a4 + 2544);
    if ((_DWORD)v7)
    {
      uint64_t v29 = calloc(a2 + 3, 2uLL);
      _WORD *v29 = 46;
      if (a2 >= 1)
      {
        uint64_t v9 = a3;
        uint64_t v10 = v29 + 1;
        uint64_t v11 = a2;
        do
        {
          int v12 = *a1++;
          int v13 = sub_16E60(v12, a4);
          *v10++ = sub_10D24(a4, (uint64_t)v13);
          *v9++ = 48;
          --v11;
        }

        while (v11);
      }

      v29[a2 + 1] = 46;
      if (a2 >= -1)
      {
        uint64_t v14 = 0LL;
        LODWORD(v15) = 0;
        uint64_t v16 = a4 + 8 * v7 + 31616;
        int v17 = 1;
        do
        {
          if ((_DWORD)v15 == 0xFFFF)
          {
LABEL_9:
            LODWORD(v15) = 0;
          }

          else
          {
            while (1)
            {
              uint64_t v18 = *(unsigned int *)(v16 + 16LL * v15);
              if ((_DWORD)v18)
              {
                uint64_t v19 = *(unsigned __int16 *)(v16 + 16LL * v15 + 14);
              }

uint64_t lou_dotsToChar(char *a1, unsigned __int16 *a2, __int16 *a3, int a4)
{
  uint64_t result = 0LL;
  if (a1)
  {
    uint64_t v6 = a2;
    if (a2)
    {
      uint64_t v7 = a3;
      if (a3)
      {
        LODWORD(v8) = a4;
        Displayuint64_t Table = _lou_getDisplayTable(a1);
        uint64_t result = 0LL;
        if ((int)v8 >= 1)
        {
          if (DisplayTable)
          {
            uint64_t v8 = v8;
            do
            {
              int v11 = *v6++;
              int v10 = v11;
              int v12 = v11 | 0x8000;
              if ((v11 & 0xFF00) == 0x2800) {
                int v13 = v12;
              }
              else {
                int v13 = v10;
              }
              int CharForDots = _lou_getCharForDots(v13, DisplayTable);
              if (CharForDots) {
                __int16 v15 = CharForDots;
              }
              else {
                __int16 v15 = 32;
              }
              *v7++ = v15;
              --v8;
            }

            while (v8);
            return 1LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t lou_charToDots(char *a1, unsigned __int16 *a2, _WORD *a3, int a4, char a5)
{
  uint64_t result = 0LL;
  if (a1)
  {
    uint64_t v7 = a2;
    if (a2)
    {
      uint64_t v8 = a3;
      if (a3)
      {
        LODWORD(v10) = a4;
        Displayuint64_t Table = _lou_getDisplayTable(a1);
        uint64_t result = 0LL;
        if ((int)v10 >= 1)
        {
          if (DisplayTable)
          {
            uint64_t v10 = v10;
            do
            {
              int v12 = *v7++;
              __int16 DotsForChar = _lou_getDotsForChar(v12, DisplayTable);
              __int16 v14 = DotsForChar | 0x2800;
              if ((a5 & 0x40) == 0) {
                __int16 v14 = DotsForChar;
              }
              *v8++ = v14;
              --v10;
            }

            while (v10);
            return 1LL;
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_171F8(unsigned __int16 *a1, unsigned __int16 *a2, int a3, uint64_t a4)
{
  if (!a3) {
    return 0LL;
  }
  if (a3 < 1) {
    return 1LL;
  }
  uint64_t v7 = a3;
  while (1)
  {
    int v8 = *a1++;
    uint64_t v9 = sub_16E60(v8, a4);
    int v10 = sub_10D24(a4, (uint64_t)v9);
    int v11 = *a2++;
    int v12 = sub_16E60(v11, a4);
    if (!--v7) {
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_1729C( uint64_t a1, unsigned int a2, uint64_t a3, int a4, uint64_t a5, int *a6, uint64_t *a7, int *a8, signed int *a9, unint64_t *a10, _WORD *a11)
{
  uint64_t result = 0LL;
  unsigned int v117 = a2;
  *a10 = 0LL;
  *a7 = a5 + 2LL * *(__int16 *)(a5 + 50) + 54;
  *a8 = 0;
  *a6 = (a4 & 0xFFFFFFFE) != 74;
  int v13 = *a8;
  int v14 = *(__int16 *)(a5 + 52);
  if (*a8 >= v14) {
    return result;
  }
  __int16 v15 = a8;
  uint64_t v17 = a5;
  uint64_t v18 = a3;
  signed int v19 = a2;
  BOOL v20 = 0LL;
  unsigned int v21 = -1;
  uint64_t v109 = a1 + 31616;
  unsigned int v22 = -1;
  while (1)
  {
    uint64_t result = 0LL;
    BOOL v114 = 1;
    uint64_t v23 = v117;
    if ((v117 & 0x80000000) != 0) {
      return result;
    }
    LODWORD(v24) = *(_DWORD *)(v18 + 16);
    uint64_t v25 = *a7;
    unsigned int v26 = *(unsigned __int16 *)(*a7 + 2LL * v13);
    if (v26 <= 0x5A) {
      break;
    }
    if (*(unsigned __int16 *)(*a7 + 2LL * v13) <= 0x7Au)
    {
      switch(*(_WORD *)(*a7 + 2LL * v13))
      {
        case '[':
          int v27 = v13 + 1;
          unsigned int v22 = v117;
          goto LABEL_56;
        case ']':
          int v27 = v13 + 1;
          unsigned int v21 = v117;
          goto LABEL_56;
        case '_':
          v117 -= *(unsigned __int16 *)(v25 + 2LL * v13 + 2);
          BOOL v114 = (v117 & 0x80000000) == 0;
          int v27 = v13 + 2;
          goto LABEL_56;
          if (v117) {
            goto LABEL_50;
          }
          goto LABEL_51;
        default:
          goto LABEL_63;
      }
    }

    if (v26 == 123 || v26 == 125)
    {
      unint64_t v28 = v109
          + ((8LL * *(unsigned __int16 *)(v25 + 2LL * v13 + 4)) | ((unint64_t)*(unsigned __int16 *)(v25 + 2LL * v13 + 2) << 19));
      if (!v13 || v13 >= 1 && *(_WORD *)(v25 + 2LL * (v13 - 1)) == 91)
      {
        *a10 = v28;
        uint64_t v29 = *a7;
        *a11 = *(_WORD *)(*a7 + 2LL * v13);
        unsigned int v26 = *(unsigned __int16 *)(v29 + 2LL * v13);
      }

      BOOL v114 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v23) == *(unsigned __int16 *)(v28
                                                                                          + 2LL
                                                                                          * ((v26 != 123) | (2 * *a6))
                                                                                          + 54);
      unsigned int v117 = v23 + 1;
      int v27 = v13 + 3;
    }

    else
    {
      if (v26 != 126) {
        goto LABEL_63;
      }
      if (v117 != (_DWORD)v24) {
LABEL_50:
      }
        BOOL v114 = 0;
LABEL_51:
      int v27 = v13 + 1;
    }

LABEL_56:
    int *v15 = v27;
LABEL_57:
    if (!v20 != v114) {
      return 0LL;
    }
LABEL_58:
    BOOL v20 = 0LL;
    int v13 = *v15;
    LOWORD(v14) = *(_WORD *)(v17 + 52);
LABEL_59:
  }

  switch(*(_WORD *)(*a7 + 2LL * v13))
  {
    case ' ':
      goto LABEL_181;
    case '!':
      BOOL v20 = !v20;
      int *v15 = ++v13;
      goto LABEL_59;
    case '""':
      goto LABEL_22;
    case '#':
      goto LABEL_63;
    case '$':
      unsigned int v103 = v22;
      int v35 = v15;
      uint64_t v36 = a1;
      uint64_t v105 = v17;
      unsigned int v37 = (unsigned __int16 *)(v25 + 2LL * v13);
      unint64_t v38 = v37[4] | ((((unint64_t)v37[1] << 32) | ((unint64_t)v37[2] << 16) | v37[3]) << 16);
      if (v37[5])
      {
        unsigned int v101 = v21;
        signed int v100 = v19;
        uint64_t v39 = 0LL;
        uint64_t v40 = 2LL * v117;
        do
        {
          if (v23 + v39 >= *(int *)(v18 + 16)
            || (int v41 = *(unsigned __int16 *)(*(void *)(v18 + 8) + v40 + 2 * v39), v41 == 0xFFFF))
          {
LABEL_61:
            unsigned int v117 = v23 + v39;
            BOOL v114 = 0;
            signed int v19 = v100;
            unsigned int v21 = v101;
            goto LABEL_79;
          }

          BOOL v42 = v20;
          if (*a6) {
            int v43 = sub_18730(v41, v36);
          }
          else {
            int v43 = sub_16E60(v41, v36);
          }
          BOOL v20 = v42;
          if ((v43[3] & v38) != 0)
          {
            uint64_t v18 = a3;
            if (v42) {
              goto LABEL_61;
            }
          }

          else
          {
            uint64_t v18 = a3;
            if (!v42) {
              goto LABEL_61;
            }
          }

          uint64_t v25 = *a7;
          int v13 = *v35;
          unsigned int v44 = *(unsigned __int16 *)(*a7 + 2LL * (*v35 + 5));
          ++v39;
        }

        while (v39 < v44);
        LODWORD(v23) = v23 + v39;
        unsigned int v117 = v23;
        signed int v19 = v100;
        unsigned int v21 = v101;
        if (!v114) {
          goto LABEL_79;
        }
      }

      else
      {
        unsigned int v44 = 0;
      }

      if (v44 < *(unsigned __int16 *)(v25 + 2LL * (v13 + 6)))
      {
        uint64_t v23 = (int)v23;
        while (v23 < *(int *)(v18 + 16))
        {
          int v49 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v23);
          if (v49 == 0xFFFF)
          {
            unsigned int v117 = v23;
            BOOL v114 = 0;
            goto LABEL_79;
          }

          BOOL v50 = v20;
          if (*a6) {
            __int16 v51 = sub_18730(v49, v36);
          }
          else {
            __int16 v51 = sub_16E60(v49, v36);
          }
          BOOL v20 = v50;
          if ((v51[3] & v38) != 0)
          {
            uint64_t v18 = a3;
            if (v50) {
              break;
            }
          }

          else
          {
            uint64_t v18 = a3;
            if (!v50) {
              break;
            }
          }

          ++v23;
        }
      }

      unsigned int v117 = v23;
LABEL_79:
      *v35 += 7;
      uint64_t v17 = v105;
      a1 = v36;
      __int16 v15 = v35;
      unsigned int v22 = v103;
      if (!v114) {
        return 0LL;
      }
      goto LABEL_58;
    case '%':
      BOOL v45 = v20;
      int v46 = sub_18790(v13, (int *)&v117, a1, v18, *a7);
      LODWORD(v20) = v45;
      uint64_t v18 = a3;
      BOOL v114 = v46;
      int v27 = v13 + 5;
      goto LABEL_56;
    default:
      if (v26 == 64)
      {
LABEL_22:
        uint64_t v30 = v25 + 2LL * v13;
        int v31 = *(unsigned __int16 *)(v30 + 2);
        if (*(_WORD *)(v30 + 2))
        {
          int v27 = v13 + 2 + v31;
          uint64_t v32 = v13 + 2;
          else {
            uint64_t v24 = v24;
          }
          uint64_t v33 = v117;
          while (v24 != v33)
          {
            int v34 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2 * v33);
            if (v34 == 0xFFFF || *(unsigned __int16 *)(v25 + 2 * v32) != v34)
            {
              int v47 = 0;
              goto LABEL_55;
            }

            ++v33;
            if (++v32 >= v27) {
              break;
            }
          }
        }

        else
        {
          int v27 = v13 + v31 + 2;
        }

        int v47 = 1;
LABEL_55:
        BOOL v114 = v47;
        v117 += v31;
        goto LABEL_56;
      }

      if (v26 != 47)
      {
LABEL_63:
        BOOL v48 = v20;
        uint64_t result = _lou_handlePassVariableTest(*a7, v15, &v114);
        LODWORD(v20) = v48;
        uint64_t v18 = a3;
        if (!(_DWORD)result) {
          return result;
        }
        goto LABEL_57;
      }

      int v52 = 0;
      int v115 = 0;
      if ((int)v24 > (int)v117)
      {
        unsigned int v102 = v21;
        BOOL v53 = 0LL;
        int v54 = 0;
        int v98 = (unsigned __int16)*a11;
        int v55 = v13 + 1;
        BOOL v95 = *a10 == 0;
        unint64_t v107 = *a10;
        uint64_t v108 = *a6;
        uint64_t v113 = a1;
        uint64_t v99 = a1 + 31616;
        int v104 = v13 + 1;
        uint64_t v106 = v17;
        while (1)
        {
          int v115 = v23;
          int v116 = v55;
          int v56 = *(__int16 *)(v17 + 52);
          if (v55 >= v56) {
            goto LABEL_170;
          }
          __int16 v57 = *(_WORD *)(v17 + 52);
          int v58 = v55;
          do
          {
            v118[0] = 1;
            int v59 = v115;
            if (v115 >= *(_DWORD *)(v18 + 16)) {
              goto LABEL_171;
            }
            unsigned int v60 = *(unsigned __int16 *)(v25 + 2LL * v58);
            if (v60 > 0x3F)
            {
              if (*(unsigned __int16 *)(v25 + 2LL * v58) > 0x5Eu)
              {
                if (v60 == 125 || v60 == 123)
                {
                  unint64_t v68 = v99
                      + ((8LL * *(unsigned __int16 *)(v25 + 2LL * v58 + 4)) | ((unint64_t)*(unsigned __int16 *)(v25 + 2LL * v58 + 2) << 19));
                  int v69 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2LL * v115);
                  uint64_t v70 = (2 * v108) | 1;
                  if (v60 == 123) {
                    uint64_t v70 = 2 * (int)v108;
                  }
                  int v62 = v69 == *(unsigned __int16 *)(v68 + 2 * v70 + 54);
                  if (v107 && v98 == 123 && v68 == v107)
                  {
                    if (v69 == *(unsigned __int16 *)(v107 + 54 + 4LL * (_DWORD)v108))
                    {
                      --v54;
                    }

                    else if (v69 == *(unsigned __int16 *)(v107 + 54 + 2 * ((2 * v108) | 1)))
                    {
                      ++v54;
                    }
                  }

                  ++v115;
                  int v82 = v58 + 3;
                }

                else
                {
                  if (v60 != 95) {
                    goto LABEL_136;
                  }
                  v115 -= *(unsigned __int16 *)(v25 + 2LL * v58 + 2);
                  if (v115 < 0)
                  {
                    int v62 = 0;
                    int v115 = 0;
                    v118[0] = 0;
                  }

                  else
                  {
                    int v62 = 1;
                  }

                  int v82 = v58 + 2;
                }

LABEL_144:
                int v116 = v82;
              }

              else if (v60 == 64)
              {
LABEL_109:
                int v63 = *(unsigned __int16 *)(v25 + 2LL * v58 + 2);
                LODWORD(v64) = v58 + 2;
                if (*(_WORD *)(v25 + 2LL * v58 + 2))
                {
                  uint64_t v64 = (int)v64;
                  uint64_t v65 = (unsigned __int16 *)(*(void *)(v18 + 8) + 2LL * v115);
                  while (1)
                  {
                    int v67 = *v65++;
                    int v66 = v67;
                    if (++v64 >= v58 + 2 + v63) {
                      goto LABEL_114;
                    }
                  }

                  int v62 = 0;
                  v118[0] = 0;
                }

                else
                {
LABEL_114:
                  int v62 = 1;
                }

                v115 += v63;
                int v116 = v58 + 2 + v63;
              }

              else
              {
                if (v60 == 91 || v60 == 93)
                {
                  int v116 = v58 + 1;
LABEL_102:
                  if (v53) {
                    break;
                  }
LABEL_146:
                  int v58 = v116;
                  goto LABEL_147;
                }

LABEL_136:
                BOOL v83 = v53;
                BOOL v84 = v20;
                _lou_handlePassVariableTest(v25, &v116, v118);
                BOOL v53 = v83;
                BOOL v20 = v84;
                uint64_t v18 = a3;
                int v62 = v118[0];
              }

              if (!v53 != (v62 != 0)) {
                break;
              }
              goto LABEL_146;
            }

            switch(*(_WORD *)(v25 + 2LL * v58))
            {
              case ' ':
                int v61 = v54 != 1 || v95;
                int v52 = 1;
                unsigned int v21 = v102;
                if (!v107 || !v61) {
                  goto LABEL_172;
                }
                int v116 = v56;
                goto LABEL_102;
              case '!':
                BOOL v53 = !v53;
                int v116 = ++v58;
                goto LABEL_148;
              case '""':
                goto LABEL_109;
              case '$':
                int v71 = (unsigned __int16 *)(v25 + 2LL * v58);
                unint64_t v110 = v71[4] | ((((unint64_t)v71[1] << 32) | ((unint64_t)v71[2] << 16) | v71[3]) << 16);
                unsigned int v72 = v71[5];
                if (!v72) {
                  goto LABEL_151;
                }
                int v73 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2LL * v115);
                if (v73 == 0xFFFF) {
                  goto LABEL_168;
                }
                int v96 = v54;
                uint64_t v74 = 0LL;
                uint64_t v75 = 2LL * v115 + 2;
                break;
              case '%':
                BOOL v80 = v53;
                BOOL v81 = v20;
                int v62 = sub_18790(v58, &v115, v113, v18, v25);
                BOOL v53 = v80;
                BOOL v20 = v81;
                uint64_t v18 = a3;
                int v82 = v58 + 5;
                goto LABEL_144;
              default:
                goto LABEL_136;
            }

            while (1)
            {
              BOOL v76 = v53;
              BOOL v77 = v20;
              if ((_DWORD)v108) {
                unsigned int v78 = sub_18730((unsigned __int16)v73, v113);
              }
              else {
                unsigned int v78 = sub_16E60((unsigned __int16)v73, v113);
              }
              uint64_t v18 = a3;
              int v79 = v78[6] & v110;
              BOOL v53 = v76;
              if (v76) {
                int v79 = (v78[6] & v110) == 0;
              }
              v118[0] = v79;
              int v58 = v116;
              BOOL v20 = v77;
              if (!v79)
              {
                int v115 = v59 + v74 + 1;
                uint64_t v17 = v106;
                int v54 = v96;
LABEL_169:
                BOOL v53 = 0LL;
                int v116 = v58 + 7;
                goto LABEL_170;
              }

              unsigned int v72 = *(unsigned __int16 *)(v25 + 2LL * (v116 + 5));
              int v73 = *(unsigned __int16 *)(*(void *)(a3 + 8) + v75 + 2 * v74++);
              if (v73 == 0xFFFF)
              {
                v59 += v74;
                uint64_t v17 = v106;
                int v54 = v96;
                goto LABEL_168;
              }
            }

            v59 += v74 + 1;
            int v115 = v59;
            uint64_t v17 = v106;
            int v54 = v96;
LABEL_151:
            if (v72 >= *(unsigned __int16 *)(v25 + 2LL * (v58 + 6)))
            {
              v58 += 7;
              int v116 = v58;
              goto LABEL_147;
            }

            int v85 = *(unsigned __int16 *)(*(void *)(v18 + 8) + 2LL * v59);
            if (v85 == 0xFFFF)
            {
LABEL_168:
              int v115 = v59;
              v118[0] = 0;
              goto LABEL_169;
            }

            int v97 = v54;
            uint64_t v86 = 2LL * v59 + 2;
            unsigned int v87 = v72 + 1;
            while (1)
            {
              BOOL v88 = v53;
              BOOL v89 = v20;
              int v90 = (_DWORD)v108 ? sub_18730((unsigned __int16)v85, v113) : sub_16E60((unsigned __int16)v85, v113);
              BOOL v53 = v88;
              if ((v90[3] & v110) != 0)
              {
                uint64_t v18 = a3;
                BOOL v20 = v89;
                if (v88) {
                  break;
                }
              }

              else
              {
                uint64_t v18 = a3;
                BOOL v20 = v89;
                if (!v88) {
                  break;
                }
              }

              ++v59;
              int v58 = v116;
              int v85 = *(unsigned __int16 *)(*(void *)(v18 + 8) + v86);
              v86 += 2LL;
              ++v87;
              if (v85 == 0xFFFF)
              {
                uint64_t v17 = v106;
                int v54 = v97;
                goto LABEL_168;
              }
            }

            int v58 = v116 + 7;
            int v115 = v59;
            v116 += 7;
            uint64_t v17 = v106;
            int v54 = v97;
            if (!v118[0])
            {
              BOOL v53 = 0LL;
              break;
            }

LABEL_147:
            BOOL v53 = 0LL;
            __int16 v57 = *(_WORD *)(v17 + 52);
LABEL_148:
            int v56 = v57;
          }

          while (v58 < v57);
LABEL_170:
          LODWORD(v23) = v23 + 1;
          int v55 = v104;
          if ((int)v23 >= *(_DWORD *)(v18 + 16))
          {
LABEL_171:
            int v52 = 0;
            unsigned int v21 = v102;
            break;
          }
        }
      }

LABEL_172:
      uint64_t result = 0LL;
      BOOL v91 = !v20 || v52 == 0;
      char v92 = !v91;
      if (v52 | v20 && (v92 & 1) == 0)
      {
        LODWORD(v23) = v115;
        int v13 = v116;
LABEL_181:
        uint64_t result = 0LL;
        int *v15 = v13 + 1;
        if (v22 == -1) {
          signed int v93 = v19;
        }
        else {
          signed int v93 = v22;
        }
        if (v22 == -1) {
          unsigned int v94 = v23;
        }
        else {
          unsigned int v94 = v21;
        }
        if (v93 >= v19 && v94 != -1)
        {
          *a9 = v19;
          a9[1] = v93;
          uint64_t result = 1LL;
          a9[2] = v94;
          a9[3] = v23;
        }
      }

      return result;
  }

uint64_t sub_17E08( uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, int *a10, unint64_t a11, int a12, int a13, int *a14, _DWORD *a15, uint64_t a16, unsigned __int16 a17, char a18)
{
  uint64_t v24 = a1;
  char v25 = a18;
  int v26 = a9;
  unint64_t v27 = HIDWORD(a11);
  int v144 = *(_DWORD *)(a3 + 20);
  unint64_t v142 = a15;
  uint64_t v145 = a11;
  unint64_t v141 = a14;
  uint64_t result = sub_18988(a11, SHIDWORD(a11), a1, *a2, a3, a4, a5, a14, a15, a18);
  if ((_DWORD)result)
  {
    if (*(__int16 *)(*(void *)a6 + 52LL) > v26)
    {
      int v134 = a5;
      uint64_t v140 = a16;
      uint64_t v130 = 2LL * a7;
      uint64_t v29 = (int)v130 | 1LL;
      int v136 = (unsigned __int16 *)(a16 + 54 + 2 * v29);
      __int16 v137 = (unsigned __int16 *)(a16 + 54 + 4LL * a7);
      uint64_t v132 = v24 + 54 + 2 * v29;
      int v125 = v27 + 1;
      int v135 = a17;
      int v129 = a13;
      uint64_t v131 = v24 + 54 + 4LL * a7;
      uint64_t v123 = v24 + 31670;
      uint64_t v122 = v24 + 31676;
      int v138 = *(_DWORD *)(a3 + 20);
      uint64_t v121 = v24 + 31616;
      int v30 = a12;
      uint64_t v133 = a6;
      uint64_t v139 = v24;
      int v31 = a12;
      int v143 = a12;
      uint64_t v124 = a8;
      while (1)
      {
        unsigned int v32 = *(unsigned __int16 *)(a8 + 2LL * v26);
        if (v32 > 0x3E) {
          break;
        }
        if (*(unsigned __int16 *)(a8 + 2LL * v26) <= 0x29u)
        {
          if (v32 != 34)
          {
            if (v32 == 37)
            {
              int v126 = v30;
              unint64_t v33 = (8LL * *(unsigned __int16 *)(a8 + 2LL * v26 + 4)) | ((unint64_t)*(unsigned __int16 *)(a8 + 2LL * v26 + 2) << 19);
              unint64_t v34 = v121 + v33;
              uint64_t v35 = v121 + v33 + 2LL * *(__int16 *)(v121 + v33 + 50) + 54;
              uint64_t v36 = *a2;
              unint64_t v37 = v123 + v33;
              int v128 = (unsigned __int16 *)(v122 + v33);
              uint64_t v38 = v145 >> 32;
              while (1)
              {
                int v39 = *(_DWORD *)(v34 + 44);
                uint64_t v40 = *(__int16 *)(v34 + 50);
                if (v39 == 60)
                {
                  unint64_t v41 = (v40 - 2);
                  if ((int)v40 < 2)
                  {
                    LODWORD(v45) = 0;
                    int v46 = 0;
                  }

                  else
                  {
                    int v42 = *(unsigned __int16 *)(*(void *)(v36 + 8) + 2 * v38);
                    if (v42 == *(unsigned __int16 *)(v34 + 56))
                    {
                      LODWORD(v43) = 0;
                      int v44 = 0;
LABEL_26:
                      LODWORD(v45) = v43;
                      int v46 = v44;
                    }

                    else
                    {
                      int v44 = 0;
                      uint64_t v43 = 0LL;
                      LODWORD(v45) = (v41 >> 1) + 1;
                      int v46 = (v41 & 0xFFFFFFFE) + 2;
                      unint64_t v47 = v41 >> 1;
                      BOOL v48 = v128;
                      while (v47 != v43)
                      {
                        int v49 = *v48;
                        v48 += 2;
                        v44 += 2;
                        ++v43;
                        if (v42 == v49) {
                          goto LABEL_26;
                        }
                      }
                    }
                  }

                  if (v46 != (_DWORD)v40) {
                    goto LABEL_28;
                  }
                }

                else
                {
                  if ((int)v40 < 1)
                  {
                    LODWORD(v45) = 0;
                  }

                  else
                  {
                    uint64_t v45 = 0LL;
                    while (*(unsigned __int16 *)(*(void *)(v36 + 8) + 2 * v38) != *(unsigned __int16 *)(v37 + 2 * v45))
                    {
                      if (v40 == ++v45) {
                        goto LABEL_41;
                      }
                    }
                  }

                  if ((_DWORD)v45 != (_DWORD)v40)
                  {
LABEL_28:
                    for (unsigned int i = 0; (_DWORD)v45; LODWORD(v45) = v45 - 1)
                    {
                      if (v39 == 58) {
                        int v51 = 1;
                      }
                      else {
                        int v51 = *(unsigned __int16 *)(v35 + 2LL * i);
                      }
                      i += v51;
                    }

                    if (v39 == 58)
                    {
                      uint64_t v52 = *(int *)(a3 + 20);
                      *(_DWORD *)(a4 + 4 * v52) = v38;
                      __int16 v53 = *(_WORD *)(v35 + 2LL * (int)i);
                      uint64_t v54 = *(void *)(a3 + 8);
                      uint64_t v55 = *(int *)(a3 + 20);
                      *(_DWORD *)(a3 + 20) = v55 + 1;
                      *(_WORD *)(v54 + 2 * v55) = v53;
                    }

                    else
                    {
                      uint64_t v56 = *(unsigned __int16 *)(v35 + 2LL * (int)i);
                      int v57 = v56 - 1;
                      uint64_t v58 = *(int *)(a3 + 20);
                      uint64_t v59 = v56 - 1 + v58;
                      if (v56 >= 2)
                      {
                        do
                        {
                          *(_DWORD *)(a4 - 4 + 4 * v59) = v38;
                          uint64_t v58 = *(int *)(a3 + 20);
                          --v59;
                        }

                        while (v59 > v58);
                      }

                      if (!(_DWORD)v56) {
                        return 0LL;
                      }
                      memcpy( (void *)(*(void *)(a3 + 8) + 2LL * (int)v58),  (const void *)(v35 + 2LL * (int)i + 2),  (2 * v57));
                      *(_DWORD *)(a3 + 20) += v57;
                      int v31 = v143;
                    }
                  }
                }

LABEL_41:
                if ((_DWORD)++v38 == v31)
                {
                  int v26 = a9;
                  a8 = v124;
                  a6 = v133;
                  uint64_t v24 = v139;
                  int v30 = v126;
                  goto LABEL_107;
                }
              }
            }

      uint64_t v17 = v19;
      break;
    }
  }

  *a2 = v17;
  return 1LL;
}

void *sub_18730(int a1, uint64_t a2)
{
  uint64_t v4 = *(unsigned int *)(a2 + 4 * _lou_charHash(a1) + 18100);
  if ((_DWORD)v4)
  {
    while (1)
    {
      uint64_t result = (void *)(a2 + 8 * v4 + 31616);
      uint64_t v4 = *(unsigned int *)(a2 + 8 * v4 + 31628);
      if (!(_DWORD)v4) {
        goto LABEL_4;
      }
    }
  }

  else
  {
LABEL_4:
    uint64_t result = &unk_25008;
    word_25034 = a1;
  }

  return result;
}

uint64_t sub_18790(int a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *a2;
  uint64_t v6 = a1;
  uint64_t v7 = (unsigned __int16 *)(a5 + 2LL * a1);
  unint64_t v8 = (8LL * v7[2]) | ((unint64_t)v7[1] << 19);
  uint64_t v9 = a3 + v8 + 31616;
  unint64_t v10 = v7[3];
  uint64_t v11 = v5;
  while (v11 - v5 < v10)
  {
    if (v11 < *(int *)(a4 + 16))
    {
      uint64_t v12 = *(__int16 *)(a3 + v8 + 31666);
      if (*(_DWORD *)(a3 + v8 + 31660) == 60)
      {
        if (*(__int16 *)(a3 + v8 + 31666) < 2)
        {
          LODWORD(v15) = 1;
        }

        else
        {
          for (uint64_t i = 0LL;
                *(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v11) != *(unsigned __int16 *)(a3 + v8 + 31672 + 2 * i);
                i += 2LL)
          {
            unint64_t v14 = i + 3;
          }

          LODWORD(v15) = i + 1;
        }
      }

      else if ((int)v12 < 1)
      {
        LODWORD(v15) = 0;
      }

      else
      {
        uint64_t v15 = 0LL;
        while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v11) != *(unsigned __int16 *)(a3 + v8 + 31670 + 2 * v15))
        {
          if (v12 == ++v15) {
            return 0LL;
          }
        }
      }

      ++v11;
    }

    return 0LL;
  }

  int v17 = v5 + v10;
  uint64_t v18 = *(unsigned __int16 *)(a5 + 2 * v6 + 8);
  if (v10 < v18)
  {
    uint64_t v19 = v17;
    if (*(_DWORD *)(a4 + 16) > v17) {
      int v17 = *(_DWORD *)(a4 + 16);
    }
    uint64_t v20 = v5 + v18;
    uint64_t v21 = v8 + a3;
    uint64_t v22 = v8 + a3 + 31670;
    uint64_t v23 = v21 + 31672;
    while (v19 != v17)
    {
      uint64_t v24 = *(__int16 *)(v9 + 50);
      if (*(_DWORD *)(v9 + 44) == 60)
      {
        if (*(__int16 *)(v9 + 50) < 2)
        {
          LODWORD(v27) = 1;
        }

        else
        {
          uint64_t v25 = 0LL;
          while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v19) != *(unsigned __int16 *)(v23 + 2 * v25))
          {
            unint64_t v26 = v25 + 3;
            v25 += 2LL;
          }

          LODWORD(v27) = v25 + 1;
        }
      }

      else if ((int)v24 < 1)
      {
        LODWORD(v27) = 0;
      }

      else
      {
        uint64_t v27 = 0LL;
        while (*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v19) != *(unsigned __int16 *)(v22 + 2 * v27))
        {
          if (v24 == ++v27) {
            goto LABEL_41;
          }
        }
      }

uint64_t sub_18988( int a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, int *a8, _DWORD *a9, char a10)
{
  int v14 = a1;
  if (a7 != 74)
  {
    if (a2 > a1)
    {
      int v19 = *(_DWORD *)(a5 + 20);
      if (a2 - a1 + v19 > *(_DWORD *)(a5 + 16)) {
        return 0LL;
      }
      uint64_t v20 = *(void *)(a5 + 8);
      uint64_t v21 = (__int16 *)(*(void *)(a4 + 8) + 2LL * a1);
      uint64_t v22 = a2 - (uint64_t)a1;
      do
      {
        *(_DWORD *)(a6 + 4LL * v19) = v14;
        __int16 v23 = *v21++;
        uint64_t v24 = *(int *)(a5 + 20);
        *(_WORD *)(v20 + 2 * v24) = v23;
        int v19 = v24 + 1;
        *(_DWORD *)(a5 + 20) = v24 + 1;
        ++v14;
        --v22;
      }

      while (v22);
    }

    return 1LL;
  }

  if (a2 <= a1) {
    return 1LL;
  }
  for (uint64_t i = 2LL * a1; ; i += 2LL)
  {
    uint64_t result = sub_18AA0(*(unsigned __int16 *)(*(void *)(a4 + 8) + i), a3, v14, a4, a5, a6, a8, a9, a10);
    if (!(_DWORD)result) {
      break;
    }
    if (a2 == ++v14) {
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_18AA0( int a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, char a9)
{
  __int16 v16 = a1;
  int v17 = sub_16E60(a1, a2);
  unsigned int v18 = v17[4];
  if (v18) {
    return sub_18BA0( (void *)(a2 + 8LL * v18 + 31672),  1,  *(__int16 *)(a2 + 8LL * v18 + 31668),  0,  a3,  a4,  a5,  a6,  a7,  a8);
  }
  uint64_t v20 = v17[12];
  if ((_DWORD)v20 && (unsigned int v18 = *(_DWORD *)(a2 + 8 * v20 + 31632)) != 0) {
    return sub_18BA0( (void *)(a2 + 8LL * v18 + 31672),  1,  *(__int16 *)(a2 + 8LL * v18 + 31668),  0,  a3,  a4,  a5,  a6,  a7,  a8);
  }
  else {
    return sub_18CEC(v16, a2, a3, a4, a5, a6, a7, a8, a9);
  }
}

uint64_t sub_18BA0( void *__src, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v10 = *(int *)(a7 + 20);
  int v13 = a5 + a2;
  if (a5 + a2 > *(_DWORD *)(a6 + 16)) {
    return 0LL;
  }
  memcpy((void *)(*(void *)(a7 + 8) + 2 * v10), __src, 2LL * a3);
  if (*a10 == 2)
  {
    if (*a9 == a5) {
      *a9 = *(_DWORD *)(a7 + 20);
    }
    goto LABEL_23;
  }

  if (!*a10)
  {
    int v19 = *a9;
    if (*a9 >= a5 && v19 < v13)
    {
      int v23 = *(_DWORD *)(a7 + 20);
    }

    else
    {
      if (v19 != v13 || *(_WORD *)(*(void *)(a6 + 8) + 2LL * v19) != 0) {
        goto LABEL_23;
      }
      if (a3 >= 0) {
        int v22 = a3;
      }
      else {
        int v22 = a3 + 1;
      }
      int v23 = *(_DWORD *)(a7 + 20) + (v22 >> 1) + 1;
    }

    *a9 = v23;
    *a10 = 1;
  }

uint64_t sub_18CEC( __int16 a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, _DWORD *a8, char a9)
{
  __int16 v31 = a1;
  uint64_t v13 = *(unsigned int *)(a2 + 956);
  if ((_DWORD)v13) {
    return sub_18BA0( (void *)(a2 + 8 * v13 + 31616 + 2LL * *(__int16 *)(a2 + 8 * v13 + 31666) + 54),  *(__int16 *)(a2 + 8 * v13 + 31666),  *(__int16 *)(a2 + 8 * v13 + 31668),  0,  a3,  a4,  a5,  a6,  v25,  v26);
  }
  uint64_t v29 = a5;
  uint64_t v30 = a6;
  uint64_t v28 = a4;
  if (a9 < 0) {
    uint64_t v15 = (char *)&unk_1EF2A;
  }
  else {
    uint64_t v15 = _lou_showString((uint64_t)&v31, 1, 1);
  }
  size_t v16 = strlen(v15);
  uint64_t v27 = (uint64_t)&v27;
  uint64_t v17 = __chkstk_darwin(v16);
  int v19 = (char *)&v27 - v18;
  if (v17)
  {
    uint64_t v20 = 0LL;
    unsigned int v21 = 0;
    do
    {
      uint64_t v22 = *((unsigned int *)sub_16E60((unsigned __int16)v15[v20], a2) + 5);
      if (!(_DWORD)v22) {
        goto LABEL_12;
      }
      while (1)
      {
        uint64_t v23 = a2 + 8 * v22 + 31616;
        uint64_t v22 = *(unsigned int *)(v23 + 16);
        if (!(_DWORD)v22) {
          goto LABEL_12;
        }
      }

      int v24 = *(unsigned __int16 *)(v23 + 56);
      *(_WORD *)&v19[2 * v20] = v24;
      if (!v24) {
LABEL_12:
      }
        *(_WORD *)&v19[2 * v20] = _lou_charToFallbackDots((unsigned __int16)v15[v20]);
      uint64_t v20 = ++v21;
    }

    while (v16 > v21);
  }

  return sub_18BA0(v19, 1, v16, 0, a3, v28, v29, v30, a7, a8);
}

uint64_t sub_18EF4( int a1, int a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t *a9, int *a10, _DWORD *a11, char a12)
{
  LODWORD(v18) = a1;
  if (*a11 == 2
    || (uint64_t v19 = *(unsigned int *)(a3 + 2536), !(_DWORD)v19)
    || (uint64_t result = sub_18BA0( (void *)(a3 + 8 * v19 + 31670),  0,  *(__int16 *)(a3 + 8 * v19 + 31668),  0,  *a4,  a5,  a6,  a7,  a10,  a11),  (_DWORD)result))
  {
    if ((int)v18 >= a2)
    {
      int v25 = 0;
    }

    else
    {
      int v25 = 0;
      uint64_t v18 = (int)v18;
      do
      {
        *(void *)(a8 + 8 * v18) = 0LL;
        int v21 = *(unsigned __int16 *)(*(void *)(a5 + 8) + 2 * v18);
        if (v21 == 0xFFFF)
        {
          int v25 = 1;
        }

        else
        {
          *a4 = v18;
          uint64_t v22 = *((unsigned int *)sub_16E60(v21, a3) + 10);
          if ((_DWORD)v22)
          {
            uint64_t v23 = a3 + 8 * v22 + 31616;
            *a9 = v23;
            uint64_t result = sub_18BA0( (void *)(v23 + 2LL * *(__int16 *)(v23 + 50) + 54),  *(__int16 *)(v23 + 50),  *(__int16 *)(v23 + 52),  0,  *a4,  a5,  a6,  a7,  a10,  a11);
            if (!(_DWORD)result) {
              return result;
            }
          }

          else
          {
            uint64_t result = sub_18AA0(*(unsigned __int16 *)(*(void *)(a5 + 8) + 2 * v18), a3, *a4, a5, a6, a7, a10, a11, a12);
            if (!(_DWORD)result) {
              return result;
            }
          }
        }

        ++v18;
      }

      while (a2 != (_DWORD)v18);
    }

    if (*a11 == 2
      || (uint64_t v24 = *(unsigned int *)(a3 + 2540), !(_DWORD)v24)
      || (uint64_t result = sub_18BA0( (void *)(a3 + 8 * v24 + 31670),  0,  *(__int16 *)(a3 + 8 * v24 + 31668),  0,  *a4,  a5,  a6,  a7,  a10,  a11),  (_DWORD)result))
    {
      *a4 = a2;
      if (!v25) {
        return 1LL;
      }
      __int16 __src = -1;
      uint64_t result = sub_18BA0(&__src, 0, 1, 0, a2, a5, a6, a7, a10, a11);
      if ((_DWORD)result) {
        return 1LL;
      }
    }
  }

  return result;
}

unint64_t sub_1911C( unint64_t result, int a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int *a12, _DWORD *a13)
{
  int v50 = result;
  uint64_t v18 = a12;
  if (a2 && a3)
  {
    for (uint64_t i = 0LL; i != 144; i += 24LL)
    {
      unsigned int v20 = *(_DWORD *)(a6 + i + 1568);
      if (v20
        && ((HIWORD(*(void *)(a11 + 8LL * a5)) | WORD1(*(void *)(a11 + 8LL * a5)) | (unsigned __int16)(HIDWORD(*(void *)(a11 + 8LL * a5)) | *(void *)(a11 + 8LL * a5))) & v20) != 0)
      {
        uint64_t result = sub_19DC8(a11, a5, a6 + i + 1552, a6, a7, a8, a9, a10, a12, a13);
      }
    }
  }

  if (a2 && a4)
  {
    for (uint64_t j = 0LL; j != 10; ++j)
    {
      int v22 = *(_DWORD *)(a6 + 24 * j + 1328);
      if (v22)
      {
        int v23 = (unsigned __int16)(*(_WORD *)(a11 + 8LL * a5 + 2) & v22) != 0;
        if ((*(_WORD *)(a11 + 8LL * a5 + 2) & (unsigned __int16)v22) != 0 && a5 >= 1)
        {
          int v25 = 0;
          int v26 = (unsigned __int16)*(_DWORD *)(a6 + 24 * j + 1328);
          int v23 = 1;
          unsigned int v27 = a5 - 1;
          while (1)
          {
            uint64_t result = *(void *)(a11 + 8LL * v27);
            result >>= 32;
            ++v23;
            --v27;
            if (a5 == ++v25)
            {
              int v23 = a5 + 1;
              goto LABEL_23;
            }
          }

          int v23 = v25 + 1;
        }
      }

      else
      {
        int v23 = 0;
      }

LABEL_53:
    v55[v32++] = v39;
    uint64_t v18 = a12;
  }

  while (v32 != 10);
  uint64_t v43 = 9LL;
  for (int m = 9; ; int m = 9)
  {
    do
    {
      uint64_t v45 = v43;
      if (v55[m] < v55[v43]) {
        int m = v43;
      }
      --v43;
    }

    while (v45);
    if (!v55[m]) {
      break;
    }
    v55[m] = 0;
    uint64_t result = sub_19E50(a11, a5, a6 + 24LL * m + 1312, a6, v52, a8, a9, a10, a12, a13);
    uint64_t v43 = 9LL;
  }

  for (uint64_t n = 0LL; n != -240; n -= 24LL)
  {
  }

  int v31 = v50;
LABEL_65:
  if (v31 && a3)
  {
    for (iuint64_t i = 0LL; ii != -144; ii -= 24LL)
    {
      uint64_t v48 = a6 + ii;
      unsigned int v49 = *(_DWORD *)(a6 + ii + 1688);
      if (v49)
      {
        if (((HIWORD(*(void *)(a11 + 8LL * a5)) | WORD1(*(void *)(a11 + 8LL * a5)) | (unsigned __int16)(HIDWORD(*(void *)(a11 + 8LL * a5)) | *(void *)(a11 + 8LL * a5))) & v49) != 0)
        {
          uint64_t v54 = v48 + 1672;
          sub_19E50(a11, a5, v48 + 1672, a6, v52, a8, a9, a10, v18, a13);
          uint64_t result = sub_19F88(a11, a5, v54, a6, v52, a8, a9, a10, v18, a13);
        }
      }
    }
  }

  return result;
}

BOOL sub_1966C(int a1, uint64_t a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a2 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1984);
  if (*(void *)(a3 + 8) == 16LL && (!v6 || !*(_DWORD *)(a2 + 952))) {
    return *((_DWORD *)sub_16E60(a1, a2) + 6) & 1;
  }
  if (sub_19718(a1, a2, a3)) {
    return 0LL;
  }
  if (v6) {
    return sub_197EC(a1, a2, a3);
  }
  return 1LL;
}

BOOL sub_19718(int a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 8))
  {
    uint64_t v5 = (unsigned int *)sub_16E60(a1, a2);
    uint64_t v6 = v5[12];
    uint64_t v7 = a2 + 8 * v6 + 31616;
    if (!(_DWORD)v6) {
      uint64_t v7 = (uint64_t)v5;
    }
    uint64_t v8 = *(void *)(a3 + 8);
    if ((v8 & *(void *)(v7 + 24)) != 0)
    {
      return 1LL;
    }

    else
    {
      while (1)
      {
        uint64_t v9 = *(unsigned int *)(v7 + 52);
        if (!(_DWORD)v9) {
          break;
        }
        uint64_t v10 = a2 + 8 * v9;
        uint64_t v7 = v10 + 31616;
        if ((*(void *)(v10 + 31640) & v8) != 0) {
          return 1LL;
        }
      }

      return 0LL;
    }
  }

  else
  {
    uint64_t v12 = (_WORD *)(a2 + 514LL * *(unsigned __int16 *)(a3 + 20) + 8468);
    if (*v12)
    {
      do
      {
        int v14 = (unsigned __int16)*v12++;
        int v13 = v14;
        if (v14) {
          BOOL v15 = v13 == a1;
        }
        else {
          BOOL v15 = 1;
        }
      }

      while (!v15);
      return v13 == 0;
    }

    else
    {
      return (*((_DWORD *)sub_16E60(a1, a2) + 6) & 1) == 0;
    }
  }

BOOL sub_197EC(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a3 + 8);
  uint64_t v7 = sub_16E60(a1, a2);
  uint64_t v8 = v7[3];
  if (v6)
  {
    uint64_t v9 = *(void *)(a3 + 8);
    if ((v9 & v8) == 0)
    {
      uint64_t v10 = *((unsigned int *)v7 + 12);
      if ((_DWORD)v10) {
        uint64_t v11 = a2 + 8 * v10 + 31616;
      }
      else {
        uint64_t v11 = (uint64_t)v7;
      }
      for (uint64_t i = *(unsigned int *)(v11 + 52); (_DWORD)i; uint64_t i = *(unsigned int *)(v13 + 31668))
      {
        uint64_t v13 = a2 + 8 * i;
        if ((v7[4] & ~*(void *)(v13 + 31648)) == 0LL && (*(void *)(v13 + 31640) & v9) != 0) {
          return 0LL;
        }
      }

      if (v9 == 4)
      {
        int v14 = *((_DWORD *)sub_16E60(a1, a2) + 6);
        int v15 = 67111172;
      }

      else
      {
        if (v9 != 16) {
          return (*((_BYTE *)sub_16E60(a1, a2) + 24) & 2) == 0;
        }
        int v14 = *((unsigned __int16 *)sub_16E60(a1, a2) + 12);
        int v15 = 514;
      }

      return (v14 & v15) == 0;
    }

    return 0LL;
  }

  if ((v8 & 2) != 0) {
    return 0LL;
  }
  uint64_t v16 = a2 + 514LL * *(unsigned __int16 *)(a3 + 20);
  if (!*(_WORD *)(v16 + 3328)) {
    return *((_BYTE *)sub_16E60(a1, a2) + 24) & 1;
  }
  uint64_t v17 = (unsigned __int16 *)(v16 + 3328);
  do
  {
    int v19 = *v17++;
    int v18 = v19;
    BOOL result = v19 == 0;
    if (v19) {
      BOOL v21 = v18 == a1;
    }
    else {
      BOOL v21 = 1;
    }
  }

  while (!v21);
  return result;
}

uint64_t sub_19928(uint64_t result, int a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11 = (unsigned int *)(a6 + 36LL * *(unsigned __int16 *)(a5 + 20) + 1960);
  if ((int)result <= a2)
  {
    uint64_t v12 = (int)result;
    uint64_t v13 = (unint64_t *)(a4 + 8LL * (int)result);
    int v14 = a2 - result + 1;
    int v15 = (_DWORD *)(a7 + 4LL * (int)result);
    do
    {
      unint64_t v16 = HIDWORD(*v13);
      unint64_t v17 = *v13 & 0xFFFFFFFFFFFFLL | ((HIWORD(*v13) & (unsigned __int16)~(unsigned __int16)*(_DWORD *)(a5 + 16)) << 48);
      *uint64_t v13 = v17;
      *v13++ = v17 & 0xFFFF0000FFFFFFFFLL | ((v16 & (unsigned __int16)~*(_WORD *)(a5 + 16)) << 32);
      *v15++ &= ~4u;
      --v14;
    }

    while (v14);
  }

  else
  {
    uint64_t v12 = (int)result;
  }

  *(_WORD *)(a4 + 8 * v12) = *(_DWORD *)(a5 + 16) | *(void *)(a4 + 8 * v12);
  if (v11[4] || v11[2])
  {
    int v18 = *(_DWORD *)(a5 + 16);
    uint64_t v19 = a4 + 8LL * a2;
LABEL_8:
    *(_WORD *)(v19 + 2) = (*(void *)v19 | (v18 << 16)) >> 16;
    return result;
  }

  uint64_t v20 = v11[1];
  if ((_DWORD)v20)
  {
    uint64_t v21 = v11[6];
    if ((_DWORD)v21)
    {
      uint64_t v22 = a6 + 8 * v20 + 31616;
      uint64_t v23 = a6 + 8 * v21 + 31616;
      int v24 = *(unsigned __int16 *)(v22 + 52);
      if (v24 == *(unsigned __int16 *)(v23 + 52))
      {
        BOOL result = memcmp((const void *)(v22 + 54), (const void *)(v23 + 54), 2LL * (__int16)v24);
        if (!(_DWORD)result)
        {
          *(_WORD *)(a4 + 8LL * a3 + 4) = *(_DWORD *)(a5 + 16) | *(_DWORD *)(a4 + 8LL * a3 + 4);
          *(_DWORD *)(a7 + 4LL * a3) |= 4u;
          return result;
        }
      }
    }

    int v18 = *(_DWORD *)(a5 + 16);
    uint64_t v19 = a4 + 8LL * a3;
    goto LABEL_8;
  }

  return result;
}

uint64_t sub_19A90(uint64_t a1, int a2, uint64_t a3, char a4)
{
  if ((a4 & 1) == 0) {
    return 0LL;
  }
  uint64_t v5 = (a2 - 2);
  if (a2 < 2) {
    return 1LL;
  }
  while (1)
  {
    uint64_t v8 = *((void *)sub_16E60(*(unsigned __int16 *)(*(void *)(a3 + 8) + 2 * v5), a1) + 3);
    if ((v8 & 1) == 0) {
      break;
    }
    if (v5-- < 1) {
      return 1LL;
    }
  }

  return (v8 >> 1) & 1;
}

uint64_t sub_19AF8(uint64_t a1, int a2, char a3, uint64_t a4, int a5, int a6, int a7)
{
  if (a6 + a2 >= *(_DWORD *)(a4 + 16)) {
    return 1LL;
  }
  uint64_t v12 = a6 + (uint64_t)a2;
  do
  {
    uint64_t v13 = sub_16E60(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v12), a1);
    int v14 = *(_DWORD *)(a4 + 16);
    if ((v13[24] & 1) == 0) {
      break;
    }
    ++v12;
  }

  while (v12 < v14);
  if (v14 == (_DWORD)v12) {
    return 1LL;
  }
  if (a5 == 94)
  {
    if ((*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2LL * (int)v12), a1) + 24) & 6) == 0
      || (*((_BYTE *)sub_16E60(*(unsigned __int16 *)(*(void *)(a4 + 8) + (((v12 << 32) - 0x100000000LL) >> 31)), a1)
          + 24) & 1) == 0)
    {
      return 1LL;
    }

    int v14 = *(_DWORD *)(a4 + 16);
  }

  LODWORD(v16) = v12;
  if (v14 > (int)v12)
  {
    uint64_t v16 = (int)v12;
    do
    {
      ++v16;
    }

    while (v16 < *(int *)(a4 + 16));
  }

  uint64_t v17 = (int)v12;
  uint64_t v18 = 2LL * (int)v12;
  while (2)
  {
    char v34 = 0;
    int v19 = *(_DWORD *)(a4 + 16) - v17;
    char v20 = 1;
    uint64_t v31 = v17;
    do
    {
      char v21 = v20;
      if ((v20 & 1) != 0)
      {
        if (v19 < 2) {
          goto LABEL_44;
        }
        uint64_t v22 = (unsigned int *)(a1
      }

      else
      {
        if (v19 < 1) {
          break;
        }
        uint64_t v22 = (unsigned int *)((char *)sub_16E60(*(unsigned __int16 *)(*(void *)(a4 + 8) + 2 * v17), a1) + 20);
        int v19 = 1;
      }

      uint64_t v23 = *v22;
      if ((_DWORD)v23)
      {
        char v32 = v21;
        int v33 = v19;
        unint64_t v24 = v19;
        while (1)
        {
          uint64_t v25 = a1 + 8 * v23 + 31616;
          if (*(__int16 *)(a1 + 8 * v23 + 31666) < 1)
          {
            LODWORD(v26) = 0;
          }

          else
          {
            unint64_t v26 = 0LL;
            uint64_t v27 = a1 + 31670 + 8 * v23;
            do
            {
              uint64_t v28 = sub_16E60(*(unsigned __int16 *)(v27 + 2 * v26), a1);
              uint64_t v29 = sub_16E60(*(unsigned __int16 *)(*(void *)(a4 + 8) + v18 + 2 * v26), a1);
              LODWORD(v28) = sub_10D24(a1, (uint64_t)v28);
            }

            while ((uint64_t)++v26 < *(__int16 *)(v25 + 50) && v26 < v24);
          }

          uint64_t v23 = *(unsigned int *)(v25 + 16);
          if (!(_DWORD)v23)
          {
            uint64_t v17 = v31;
            char v21 = v32;
            int v19 = v33;
            break;
          }
        }
      }

LABEL_44:
      char v20 = 0;
      char v34 = 1;
    }

    while ((v21 & 1) != 0);
    ++v17;
    v18 += 2LL;
    uint64_t result = 1LL;
    if ((_DWORD)v16 != (_DWORD)v17) {
      continue;
    }
    return result;
  }

uint64_t sub_19DC8( uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v10 = *(void *)(result + 8LL * a2);
  int v11 = *(_DWORD *)(a3 + 16);
  if ((v11 & WORD1(v10)) != 0)
  {
    if (((unsigned __int16)v11 & WORD2(v10)) != 0)
    {
      unsigned int v12 = *(_DWORD *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1988);
      if (!v12) {
        return result;
      }
      goto LABEL_7;
    }

    unsigned int v12 = *(_DWORD *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1976);
    if (v12 || (unsigned int v12 = *(_DWORD *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1968)) != 0)
    {
LABEL_7:
      int v13 = -1;
      return sub_18BA0( (void *)(a4 + 8LL * v12 + 31670),  0,  *(__int16 *)(a4 + 8LL * v12 + 31668),  v13,  a5,  a6,  a7,  a8,  a9,  a10);
    }

    unsigned int v12 = *(_DWORD *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1964);
    if (v12)
    {
      int v13 = 0;
      return sub_18BA0( (void *)(a4 + 8LL * v12 + 31670),  0,  *(__int16 *)(a4 + 8LL * v12 + 31668),  v13,  a5,  a6,  a7,  a8,  a9,  a10);
    }
  }

  return result;
}

uint64_t sub_19E50( uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  uint64_t v11 = result;
  unsigned int v12 = (unsigned int *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1960);
  uint64_t v13 = a2;
  if ((*(void *)(result + 8LL * a2) & *(unsigned __int16 *)(a3 + 16)) != 0)
  {
    unsigned int v14 = *v12;
    if (*v12 || (unsigned int v14 = *(_DWORD *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1972)) != 0)
    {
      uint64_t v24 = a4;
      int v15 = a5;
      uint64_t v16 = a6;
      uint64_t v17 = a7;
      uint64_t v18 = a8;
      uint64_t result = sub_18BA0( (void *)(a4 + 8LL * v14 + 31670),  0,  *(__int16 *)(a4 + 8LL * v14 + 31668),  0,  a5,  a6,  a7,  a8,  a9,  a10);
      a4 = v24;
      a5 = v15;
      a6 = v16;
      a7 = v17;
      a8 = v18;
    }
  }

  uint64_t v19 = *(void *)(v11 + 8 * v13);
  int v20 = *(_DWORD *)(a3 + 16);
  unsigned int v21 = v20 & WORD1(v19);
  if (((unsigned __int16)v20 & WORD2(v19)) != 0 && v21 == 0)
  {
    uint64_t v23 = v12[6];
    if ((_DWORD)v23) {
      return sub_18BA0( (void *)(a4 + 8 * v23 + 31670),  0,  *(__int16 *)(a4 + 8 * v23 + 31668),  0,  a5,  a6,  a7,  a8,  a9,  a10);
    }
  }

  return result;
}

uint64_t sub_19F88( uint64_t result, int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, _DWORD *a10)
{
  if ((*(_DWORD *)(a3 + 16) & *(unsigned __int16 *)(result + 8LL * a2 + 6)) != 0)
  {
    uint64_t v10 = *(unsigned int *)(a4 + 36LL * *(unsigned __int16 *)(a3 + 20) + 1980);
    if ((_DWORD)v10) {
      return sub_18BA0( (void *)(a4 + 8 * v10 + 31670),  0,  *(__int16 *)(a4 + 8 * v10 + 31668),  0,  a5,  a6,  a7,  a8,  a9,  a10);
    }
  }

  return result;
}

uint64_t _lou_pattern_compile(uint64_t a1, int a2, unsigned __int16 *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v9 = 0;
  *(_DWORD *)a3 = 2;
  uint64_t result = sub_1A074(a1, a2, &v9, (uint64_t)a3, a4, a3, a3 + 1, a5, a6);
  if ((_DWORD)result)
  {
    *a3 += 3;
    uint64_t result = sub_1A1C0((uint64_t)a3, 2u, a4, a3);
    if ((_DWORD)result)
    {
      uint64_t result = sub_1A2EC((uint64_t)a3, 2u, a4, a3);
      if ((_DWORD)result) {
        return *a3;
      }
    }
  }

  return result;
}

uint64_t sub_1A074( uint64_t a1, int a2, int *a3, uint64_t a4, int a5, unsigned __int16 *a6, _WORD *a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9 = *a6;
  *(_WORD *)(a4 + 2 * v9) = 1;
  *(_WORD *)(a4 + 2LL * *a6 + 2) = -1;
  unsigned __int16 v14 = *a6 + 3;
  *a6 = v14;
  *(_WORD *)(a4 + 2 * v9 + 4) = v14;
  *(_WORD *)(a4 + 2LL * *a6) = -1;
  *(_WORD *)(a4 + 2LL * *a6 + 2) = v9;
  *(_WORD *)(a4 + 2LL * *a6 + 4) = -1;
  if (*a3 >= a2) {
    return *a6;
  }
  while (1)
  {
    uint64_t v18 = *a6;
    uint64_t result = sub_1A68C(a1, a2, a3, a4, a5, a6, a7, a8, a9);
    if (!(_DWORD)result) {
      break;
    }
    int v20 = *a6;
    if (v20 + 3 >= a5) {
      return 0LL;
    }
    *(_WORD *)(a4 + 2 * v18 + 4) = v20;
    *(_WORD *)(a4 + 2LL * *a6) = -1;
    *(_WORD *)(a4 + 2LL * *a6 + 2) = v18;
    *(_WORD *)(a4 + 2LL * *a6 + 4) = -1;
    if (*a3 >= a2) {
      return *a6;
    }
  }

  return result;
}

uint64_t sub_1A1C0(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4)
{
  for (uint64_t i = a2; ; uint64_t i = *(unsigned __int16 *)(a1 + 2 * i + 4))
  {
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    uint64_t result = sub_1A1C0(a1, *(unsigned __int16 *)(a1 + 2 * i + 6), a3, a4);
    if (!(_DWORD)result) {
      return result;
    }
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
LABEL_6:
    if ((v8 - 4) <= 2)
    {
      uint64_t v10 = (unsigned __int16)*a4;
      uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * (i + 1));
      if (*(_WORD *)(a1 + 2 * v11) == 1) {
        return 0LL;
      }
      uint64_t v12 = a1 + 2 * v11;
      uint64_t v13 = *(unsigned __int16 *)(v12 + 2);
      *(_WORD *)(a1 + 2 * v10) = 1;
      uint64_t v14 = a1 + 2 * v10;
      *(_WORD *)(v14 + 2) = -1;
      *(_WORD *)(v14 + 4) = v11;
      LOWORD(v14) = *a4 + 3;
      *a4 = v14;
      *(_WORD *)(a1 + 2LL * (unsigned __int16)v14) = -1;
      *(_WORD *)(a1 + 2LL * ((unsigned __int16)v14 + 1)) = v11;
      *(_WORD *)(a1 + 2LL * ((unsigned __int16)v14 + 2)) = i;
      *a4 += 3;
      *(_WORD *)(a1 + 2 * i + 6) = v10;
      *(_WORD *)(a1 + 2 * v13 + 4) = i;
      *(_WORD *)(a1 + 2 * (i + 1)) = v13;
      *(_WORD *)(v12 + 2) = v10;
      *(_WORD *)(v12 + 4) = v14;
    }
  }

  if (v8 != 0xFFFF) {
    goto LABEL_6;
  }
  return 1LL;
}

uint64_t sub_1A2EC(uint64_t a1, unsigned int a2, uint64_t a3, _WORD *a4)
{
  for (uint64_t i = a2; ; uint64_t i = *(unsigned __int16 *)(a1 + 2 * v16))
  {
    int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    if ((v8 - 2) >= 5)
    {
      if (v8 == 0xFFFF) {
        return 1LL;
      }
    }

    else
    {
      uint64_t result = sub_1A2EC(a1, *(unsigned __int16 *)(a1 + 2 * i + 6), a3, a4);
      if (!(_DWORD)result) {
        return result;
      }
      int v8 = *(unsigned __int16 *)(a1 + 2 * i);
    }

    if (v8 != 7)
    {
      uint64_t v16 = i + 2;
      continue;
    }

    uint64_t v10 = (unsigned __int16)*a4;
    uint64_t v11 = *(unsigned __int16 *)(a1 + 2 * (i + 1));
    if (*(_WORD *)(a1 + 2 * v11) == 1) {
      break;
    }
    LODWORD(v12) = *(unsigned __int16 *)(a1 + 2 * (i + 1));
    do
      uint64_t v12 = *(unsigned __int16 *)(a1 + 2LL * (v12 + 1));
    while (*(_WORD *)(a1 + 2 * v12) != 1);
    uint64_t v13 = a1 + 2 * v12;
    uint64_t v14 = *(unsigned __int16 *)(v13 + 4);
    *(_WORD *)(a1 + 2 * v10) = 1;
    uint64_t v15 = a1 + 2 * v10;
    *(_WORD *)(v15 + 2) = -1;
    *(_WORD *)(v15 + 4) = v14;
    LOWORD(v15) = *a4 + 3;
    *a4 = v15;
    *(_WORD *)(a1 + 2LL * (unsigned __int16)v15) = -1;
    *(_WORD *)(a1 + 2LL * ((unsigned __int16)v15 + 1)) = v11;
    *(_WORD *)(a1 + 2LL * ((unsigned __int16)v15 + 2)) = i;
    *a4 += 3;
    *(_WORD *)(a1 + 2 * i + 6) = v10;
    *(_WORD *)(v13 + 4) = i;
    *(_WORD *)(a1 + 2 * (i + 1)) = v12;
    *(_WORD *)(a1 + 2 * v14 + 2) = v10;
    *(_WORD *)(a1 + 2 * v11 + 4) = v15;
    uint64_t v16 = i + 2;
    uint64_t v17 = *(unsigned __int16 *)(a1 + 2 * (i + 2));
    int v18 = *(unsigned __int16 *)(a1 + 2 * v17);
    if (v18 == 7 || v18 == 0xFFFF) {
      break;
    }
    for (uint64_t j = *(unsigned __int16 *)(a1 + 2 * (i + 2)); ; uint64_t j = *(unsigned __int16 *)(a1 + 2 * j + 4))
    {
      int v21 = *(unsigned __int16 *)(a1 + 2 * j);
      if (v21 == 7 || v21 == 0xFFFF) {
        break;
      }
    }

    uint64_t v23 = a1 + 2 * j;
    uint64_t v24 = *(unsigned __int16 *)(v23 + 2);
    uint64_t v25 = (unsigned __int16)*a4;
    uint64_t v26 = a1 + 2 * v25;
    *(_DWORD *)uint64_t v26 = -65535;
    *(_WORD *)(v26 + 4) = v17;
    LOWORD(v26) = *a4 + 3;
    *a4 = v26;
    *(_WORD *)(a1 + 2LL * (unsigned __int16)v26) = -1;
    *(_WORD *)(a1 + 2LL * ((unsigned __int16)v26 + 1)) = v24;
    *(_WORD *)(a1 + 2LL * ((unsigned __int16)v26 + 2)) = i;
    *a4 += 3;
    uint64_t v27 = a1 + 2 * i;
    *(_WORD *)(v27 + 8) = v25;
    *(_WORD *)(v23 + 2) = i;
    *(_WORD *)(a1 + 2 * v16) = j;
    *(_WORD *)(a1 + 2 * v17 + 2) = v25;
    *(_WORD *)(a1 + 2 * v24 + 4) = v26;
    uint64_t result = sub_1A2EC(a1, *(unsigned __int16 *)(v27 + 8), a3, a4);
    if (!(_DWORD)result) {
      return result;
    }
  }

  return 0LL;
}

uint64_t _lou_pattern_reverse(uint64_t a1)
{
  return sub_1A504(a1, 2);
}

uint64_t sub_1A504(uint64_t result, int a2)
{
  uint64_t v2 = (a2 + 2);
  uint64_t v3 = *(unsigned __int16 *)(result + 2LL * v2);
  if (*(__int16 *)(result + 2 * v3) != -1)
  {
    uint64_t v5 = result;
    do
      uint64_t v3 = *(unsigned __int16 *)(result + 2LL * (v3 + 2));
    while (*(__int16 *)(result + 2 * v3) != -1);
    uint64_t v6 = *(unsigned __int16 *)(result + 2 * (v3 + 1));
    uint64_t v7 = v6 + 1;
    unsigned int v8 = *(unsigned __int16 *)(result + 2 * (v6 + 1));
    *(_WORD *)(result + 2 * v2) = v6;
    *(_WORD *)(result + 2 * (v6 + 1)) = a2;
    uint64_t v9 = v6 + 2;
    *(_WORD *)(result + 2 * (v6 + 2)) = v8;
    uint64_t result = sub_1AE24(result, v6);
    if (v8 != a2)
    {
      do
      {
        LOWORD(v6) = v8;
        unsigned int v10 = *(unsigned __int16 *)(v5 + 2LL * (v8 + 1));
        uint64_t result = sub_1AE24(v5, v8);
        *(_WORD *)(v5 + 2LL * (v8 + 1)) = *(_WORD *)(v5 + 2LL * (v8 + 2));
        *(_WORD *)(v5 + 2LL * (v8 + 2)) = v10;
        unsigned int v8 = v10;
      }

      while (v10 != a2);
      uint64_t v9 = (unsigned __int16)v6 + 2;
      uint64_t v7 = (unsigned __int16)v6 + 1;
    }

    *(_WORD *)(v5 + 2 * v7) = *(_WORD *)(v5 + 2 * v9);
    *(_WORD *)(v5 + 2 * v9) = v3;
    *(_WORD *)(v5 + 2 * (v3 + 1)) = v6;
  }

  return result;
}

BOOL _lou_pattern_check(uint64_t a1, int a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v15 = a2;
  size_t v11 = 4LL * *(unsigned __int16 *)(a5 + 2);
  uint64_t v12 = malloc(v11);
  bzero(v12, v11);
  BOOL v13 = sub_1AEA8(a1, &v15, a3, a4, a5, 2LL, 0LL, 0LL, (uint64_t)v12, a6);
  free(v12);
  return v13;
}

uint64_t sub_1A68C( uint64_t a1, int a2, int *a3, uint64_t a4, int a5, unsigned __int16 *a6, _WORD *a7, uint64_t a8, uint64_t a9)
{
  int v13 = *a3;
  unsigned int v14 = *(unsigned __int16 *)(a1 + 2LL * *a3);
  if (v14 > 0x3E)
  {
    if (*(unsigned __int16 *)(a1 + 2LL * *a3) > 0x5Bu)
    {
      switch(v14)
      {
        case '\\':
          *a3 = ++v13;
          if (v13 >= a2) {
            return 0;
          }
          break;
        case '^':
LABEL_26:
          uint64_t v31 = *a6;
          __int16 v32 = 12;
LABEL_38:
          *(_WORD *)(a4 + 2 * v31) = v32;
          *a3 = v13 + 1;
LABEL_39:
          __int16 v40 = *a6;
LABEL_40:
          unsigned __int16 v29 = v40 + 3;
LABEL_77:
          *a6 = v29;
          return v29;
        case '|':
          uint64_t v30 = *a6;
          *(_WORD *)(a4 + 2 * v30) = 7;
LABEL_74:
          int v59 = v13 + 1;
          goto LABEL_75;
      }
    }

    else
    {
      switch(v14)
      {
        case '?':
          uint64_t v51 = *a6;
          *(_WORD *)(a4 + 2 * v51) = 6;
          *a3 = v13 + 1;
          unsigned __int16 v29 = *a6 + 4;
          goto LABEL_77;
        case '@':
          int v52 = v13 + 1;
          *a3 = v13 + 1;
          if (v13 + 1 >= a2) {
            return 0;
          }
          int v53 = *(unsigned __int16 *)(a1 + 2LL * v52);
          int v54 = v13 + 2;
          if (v53 == 91)
          {
            *a3 = v54;
            if (v54 >= a2) {
              return 0;
            }
            uint64_t v55 = (unsigned __int16 *)(a1 + 2LL * v54);
            int v56 = v54;
            while (1)
            {
              int v57 = *v55++;
              if (v57 == 93) {
                break;
              }
              unsigned __int16 v29 = 0;
              if (a2 == ++v56) {
                return v29;
              }
            }

            int v52 = v54;
          }

          else
          {
            int v56 = v54;
          }

          uint64_t v76 = *a6;
          *(_WORD *)(a4 + 2 * v76) = 11;
          uint64_t v77 = (_WORD *)(a4 + 2LL * *a6 + 6);
          if (v52 >= v56)
          {
            LOWORD(v66) = 1;
          }

          else
          {
            int v78 = 0;
            uint64_t v79 = (unsigned __int16 *)(a1 + 2LL * v52);
            int v66 = 1;
            uint64_t v80 = v56 - (uint64_t)v52;
            do
            {
              int v82 = *v79++;
              int v81 = v82;
              if (v78 || v81 != 92)
              {
                int v78 = 0;
                v77[v66++] = v81;
              }

              else
              {
                int v78 = 1;
              }

              --v80;
            }

            while (v80);
            *a3 = v56;
            int v52 = v56;
          }

          *uint64_t v77 = v66 - 1;
          if (v53 == 91)
          {
            int v83 = v52 + 1;
            goto LABEL_133;
          }

LABEL_134:
          __int16 v40 = v66 + *a6;
          goto LABEL_40;
        case '[':
          uint64_t v24 = v13 + 1LL;
          *a3 = v24;
          uint64_t v25 = 0LL;
          int v26 = 0;
          while (1)
          {
            int v27 = *(unsigned __int16 *)(a1 + 2 * v24 + 2 * v25);
            if (v26 || v27 != 92)
            {
              int v28 = 0;
              if (!v26 && v27 == 93)
              {
                uint64_t v60 = *a6;
                int v61 = v25 + v24;
                *(_WORD *)(a4 + 2 * v60) = 10;
                uint64_t v62 = (_WORD *)(a4 + 2LL * *a6 + 6);
                if ((int)v24 >= v61)
                {
                  LOWORD(v66) = 1;
                }

                else
                {
                  int v63 = 0;
                  int v64 = (unsigned __int16 *)(a1 + 2 * v24);
                  uint64_t v65 = v61 - v24;
                  int v66 = 1;
                  do
                  {
                    int v68 = *v64++;
                    int v67 = v68;
                    if (v63 || v67 != 92)
                    {
                      int v63 = 0;
                      v62[v66++] = v67;
                    }

                    else
                    {
                      int v63 = 1;
                    }

                    --v65;
                  }

                  while (v65);
                  LODWORD(v24) = v61;
                }

                *uint64_t v62 = v66 - 1;
                int v83 = v24 + 1;
LABEL_133:
                *a3 = v83;
                goto LABEL_134;
              }
            }

            else
            {
              int v28 = 1;
            }

            unsigned __int16 v29 = 0;
            ++v25;
            int v26 = v28;
            if (!((_DWORD)v24 - a2 + (_DWORD)v25)) {
              return v29;
            }
          }
      }
    }

LABEL_71:
    uint64_t v58 = *a6;
    *(_WORD *)(a4 + 2 * v58) = 10;
    *(_WORD *)(a4 + 2LL * *a6 + 6) = 1;
    __int16 v50 = *(_WORD *)(a1 + 2LL * v13);
LABEL_73:
    *(_WORD *)(a4 + 2LL * *a6 + 8) = v50;
    goto LABEL_74;
  }

  switch(*(_WORD *)(a1 + 2LL * *a3))
  {
    case '!':
      uint64_t v15 = *a6;
      *a3 = v13 + 1;
      *(_WORD *)(a4 + 2 * v15) = 3;
      uint64_t v16 = *a6;
      *a6 = v16 + 4;
      *(_WORD *)(a4 + 2 * v16 + 6) = v16 + 4;
      uint64_t v17 = *a6;
      uint64_t v18 = a4 + 2 * v17;
      *(_DWORD *)uint64_t v18 = -65535;
      unsigned __int16 v19 = *a6 + 3;
      *a6 = v19;
      *(_WORD *)(v18 + 4) = v19;
      uint64_t v20 = *a6;
      int v21 = (_WORD *)(a4 + 2 * v20);
      *int v21 = 0;
      v21[1] = v17;
      *(_WORD *)(a4 + 2 * (v20 + 2)) = -1;
      int v22 = *a6;
      if (v22 + 3 >= a5) {
        return 0;
      }
      *(_WORD *)(a4 + 2 * (v20 + 2)) = v22;
      uint64_t v23 = (_WORD *)(a4 + 2LL * *a6);
      *uint64_t v23 = -1;
      v23[1] = v20;
      goto LABEL_7;
    case '$':
      goto LABEL_26;
    case '%':
      uint64_t v33 = *a6;
      int v34 = v13 + 1;
      *a3 = v13 + 1;
      if (v13 + 1 >= a2) {
        return 0;
      }
      int v35 = *(unsigned __int16 *)(a1 + 2LL * v34);
      int v36 = v13 + 2;
      if (v35 == 91)
      {
        *a3 = v36;
        if (v36 >= a2) {
          return 0;
        }
        int v37 = (unsigned __int16 *)(a1 + 2LL * v36);
        int v38 = v13 + 2;
        while (1)
        {
          int v39 = *v37++;
          if (v39 == 93) {
            break;
          }
          unsigned __int16 v29 = 0;
          if (a2 == ++v38) {
            return v29;
          }
        }

        *(_WORD *)(a4 + 2 * v33) = 9;
        if (v36 >= v38)
        {
          LOWORD(v70) = 0;
          LOWORD(v69) = 0;
          goto LABEL_116;
        }

        int v34 = v36;
      }

      else
      {
        *(_WORD *)(a4 + 2 * v33) = 9;
        int v38 = v13 + 2;
      }

      int v69 = 0;
      int v70 = 0;
      uint64_t v71 = (unsigned __int16 *)(a1 + 2LL * v34);
      while (2)
      {
        int v73 = *v71++;
        uint64_t v72 = v73;
        if (v73 > 93)
        {
          if ((int)v72 > 107)
          {
            switch((_DWORD)v72)
            {
              case 'l':
                v70 |= 0x20u;
                break;
              case 'u':
                v70 |= 0x10u;
                break;
              case '~':
                v70 |= 0x2000u;
                break;
              default:
                return 0;
            }
          }

          else
          {
            switch((_DWORD)v72)
            {
              case '^':
                v69 |= 0x100u;
                break;
              case '_':
                v70 |= 1u;
                break;
              case 'a':
                v70 |= 2u;
                break;
              default:
                return 0;
            }
          }

LABEL_96:
          *a3 = ++v34;
          if (v38 == v34)
          {
            int v36 = v38;
LABEL_116:
            *(_WORD *)(a4 + 2LL * *a6 + 6) = v69;
            *(_WORD *)(a4 + 2LL * *a6 + 8) = v70;
            if (v35 != 91) {
              goto LABEL_76;
            }
            int v59 = v36 + 1;
LABEL_75:
            *a3 = v59;
LABEL_76:
            unsigned __int16 v29 = *a6 + 5;
            goto LABEL_77;
          }

          continue;
        }

        break;
      }

      switch((int)v72)
      {
        case '#':
          v70 |= 4u;
          goto LABEL_96;
        case '$':
          v70 |= 0x80u;
          goto LABEL_96;
        case '.':
          v70 |= 8u;
          goto LABEL_96;
        case '0':
        case '1':
        case '2':
        case '3':
        case '4':
        case '5':
        case '6':
        case '7':
          int v74 = (unint64_t *)(a8 + 8 * v72 - 344);
          unint64_t v75 = *v74;
          if (*v74) {
            goto LABEL_95;
          }
          unint64_t v75 = *(void *)(a8 + 24);
          *int v74 = v75;
          if (v75 <= 0x800000)
          {
            *(void *)(a8 + 24) *= 2LL;
LABEL_95:
            v69 |= v75 >> 16;
            goto LABEL_96;
          }

          _lou_logMessage( 40000LL,  "%s:%d: error: Too many character attributes defined",  *(const char **)a9,  *(_DWORD *)(a9 + 24));
          return 0;
        case '<':
          v70 |= 0x4000u;
          goto LABEL_96;
        case '>':
          v70 |= 0x8000u;
          goto LABEL_96;
        default:
          return 0;
      }

    case '(':
      uint64_t v41 = *a6;
      int v42 = v13 + 1;
      *a3 = v13 + 1;
      if (v13 + 1 >= a2) {
        return 0;
      }
      int v43 = 0;
      int v44 = 0;
      uint64_t v45 = 2LL * v42;
      while (2)
      {
        int v46 = *(unsigned __int16 *)(a1 + v45);
        if (!v44 && v46 == 92)
        {
          int v47 = 1;
          goto LABEL_54;
        }

        if (!v44 && v46 == 40)
        {
          int v47 = 0;
          ++v43;
          goto LABEL_54;
        }

        int v47 = 0;
        if (v44 || v46 != 41) {
          goto LABEL_54;
        }
        if (v43)
        {
          int v47 = 0;
          --v43;
LABEL_54:
          unsigned __int16 v29 = 0;
          ++v42;
          v45 += 2LL;
          int v44 = v47;
          if (a2 == v42) {
            return v29;
          }
          continue;
        }

        break;
      }

      *(_WORD *)(a4 + 2 * v41) = 2;
      uint64_t v16 = *a6;
      *a6 = v16 + 4;
      *(_WORD *)(a4 + 2 * v16 + 6) = v16 + 4;
      uint64_t v84 = a4 + 2LL * *a6;
      *(_DWORD *)uint64_t v84 = -65536;
      *(_WORD *)(v84 + 4) = -1;
      ++*a3;
      uint64_t v23 = (_WORD *)(a4 + 2LL * *a6);
LABEL_7:
      v23[2] = v16;
      break;
    case '*':
      uint64_t v48 = *a6;
      __int16 v49 = 5;
      goto LABEL_60;
    case '+':
      uint64_t v48 = *a6;
      __int16 v49 = 4;
LABEL_60:
      *(_WORD *)(a4 + 2 * v48) = v49;
      __int16 v50 = (*a7)++;
      goto LABEL_73;
    case '.':
      uint64_t v31 = *a6;
      __int16 v32 = 8;
      goto LABEL_38;
    default:
      goto LABEL_71;
  }

  goto LABEL_39;
}

uint64_t sub_1AE24(uint64_t result, unsigned int a2)
{
  uint64_t v3 = result;
  int v4 = *(unsigned __int16 *)(result + 2LL * a2);
  if (v4 == 7)
  {
    unsigned int v5 = a2 + 3;
    sub_1A504(result, *(unsigned __int16 *)(result + 2LL * (a2 + 3)));
    __int16 v6 = *(_WORD *)(v3 + 2LL * v5);
    *(_WORD *)(v3 + 2LL * v5) = *(_WORD *)(v3 + 2LL * (a2 + 4));
    *(_WORD *)(v3 + 2LL * (a2 + 4)) = v6;
    return sub_1A504(v3, *(unsigned __int16 *)(v3 + 2LL * (a2 + 3)));
  }

  return result;
}

BOOL sub_1AEA8( uint64_t a1, int *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16 = a10;
  int v51 = *a2;
  int v17 = a4 * a3;
  uint64_t v50 = a5 + 2;
  while (1)
  {
LABEL_2:
    int v18 = *(unsigned __int16 *)(a5 + 2LL * a6);
    if (v18 == 0xFFFF) {
      return 1LL;
    }
    if (v18 == 12) {
      break;
    }
    int v19 = *a2;
    if (*a2 * (int)a4 >= v17)
    {
      BOOL result = 0LL;
      int v35 = v18 - 1;
      int v21 = 2;
      switch(v35)
      {
        case 0:
          break;
        case 1:
          goto LABEL_20;
        case 2:
LABEL_19:
          a7 = !a7;
LABEL_20:
          int v21 = 3;
          break;
        case 3:
        case 4:
LABEL_17:
          if ((_DWORD)a6 == (_DWORD)a8)
          {
            uint64_t v36 = *(unsigned __int16 *)(a5 + 2LL * (a8 + 4));
            ++*(_DWORD *)(a9 + 4 * v36);
          }

          else
          {
            uint64_t v37 = *(unsigned __int16 *)(a5 + 2LL * (a6 + 4));
            if (*(_DWORD *)(a9 + 4 * v37)) {
              goto LABEL_41;
            }
            *(_DWORD *)(a9 + 4 * v37) = 1;
            a8 = a6;
          }

          int v38 = *a2;
          if (sub_1AEA8( a1,  a2,  a3,  a4,  a5,  *(unsigned __int16 *)(a5 + 2LL * (a6 + 3)),  a7,  a8,  a9,  v16)) {
            return 1LL;
          }
          *a2 = v38;
          uint64_t v39 = *(unsigned __int16 *)(a5 + 2LL * (a8 + 4));
          int v40 = *(_DWORD *)(a9 + 4 * v39);
          *(_DWORD *)(a9 + 4 * v39) = v40 - 1;
          int v21 = 2;
          if (*(_WORD *)(a5 + 2LL * a6) == 4)
          {
            uint64_t v16 = a10;
            if (v40 < 2) {
              return 0LL;
            }
          }

          else
          {
LABEL_31:
            uint64_t v16 = a10;
          }

          break;
        case 5:
LABEL_21:
          if (sub_1AEA8( a1,  a2,  a3,  a4,  a5,  *(unsigned __int16 *)(a5 + 2LL * (a6 + 3)),  a7,  a8,  a9,  v16)) {
            return 1LL;
          }
          *a2 = v19;
          int v21 = 2;
          goto LABEL_31;
        case 6:
LABEL_23:
          if (sub_1AEA8( a1,  a2,  a3,  a4,  a5,  *(unsigned __int16 *)(a5 + 2LL * (a6 + 3)),  a7,  a8,  a9,  v16)) {
            return 1LL;
          }
          *a2 = v19;
          int v21 = 4;
          goto LABEL_31;
        case 8:
          return (*(_WORD *)(a5 + 2LL * (a6 + 3)) & 0x100) != 0 && !a7;
        default:
          return result;
      }
    }

    else
    {
      int v20 = v18 - 1;
      int v21 = 2;
      switch(v20)
      {
        case 0:
          goto LABEL_42;
        case 1:
          goto LABEL_20;
        case 2:
          goto LABEL_19;
        case 3:
        case 4:
          goto LABEL_17;
        case 5:
          goto LABEL_21;
        case 6:
          goto LABEL_23;
        case 7:
          goto LABEL_39;
        case 8:
          int v22 = *(unsigned __int16 *)(a1 + 2LL * v19);
          uint64_t v23 = (unsigned __int16 *)(a5 + 2LL * (a6 + 3));
          unsigned int v47 = a8;
          int v48 = *v23;
          uint64_t v49 = v23[1];
          int v24 = translation_direction;
          uint64_t v25 = _lou_charHash(v22);
          uint64_t v16 = a10;
          uint64_t v26 = a10 + 4 * v25;
          int v27 = (unsigned int *)(v26 + 13608);
          int v28 = (unsigned int *)(v26 + 18100);
          unsigned __int16 v29 = &unk_25090;
          if (!v24)
          {
            unsigned __int16 v29 = &unk_250D0;
            int v27 = v28;
          }

          uint64_t v30 = *v27;
          if (!(_DWORD)v30) {
            goto LABEL_11;
          }
          while (1)
          {
            uint64_t v31 = a10 + 8 * v30 + 31616;
            uint64_t v30 = *(unsigned int *)(v31 + 12);
            if (!(_DWORD)v30)
            {
LABEL_11:
              __int16 v32 = &unk_25090;
              if (!v24) {
                __int16 v32 = &unk_250D0;
              }
              v32[22] = v22;
              uint64_t v31 = (uint64_t)v29;
              break;
            }
          }

          a8 = v47;
          if (a7 == ((*(void *)(v31 + 24) & ((v48 << 16) & 0xFFFFFFFFFCFFFFFFLL | v49)) != 0)) {
            return 0LL;
          }
          int v33 = *a2 + a4;
          goto LABEL_40;
        case 9:
          uint64_t v41 = (a6 + 3);
          uint64_t v42 = *(unsigned __int16 *)(a5 + 2LL * v41);
          int v43 = (unsigned __int16 *)(v50 + 2 * v41);
          break;
        default:
          return 0LL;
      }

      do
      {
        int v44 = *v43++;
        if (v44 == *(unsigned __int16 *)(a1 + 2LL * v19))
        {
          if (a7 == ((_DWORD)v42 != 0)) {
            return 0LL;
          }
          goto LABEL_39;
        }

        --v42;
      }

      while (v42);
LABEL_36:
      if (!a7) {
        return 0LL;
      }
LABEL_39:
      int v33 = v19 + a4;
LABEL_40:
      *a2 = v33;
LABEL_41:
      int v21 = 2;
    }

LABEL_42:
    a6 = *(unsigned __int16 *)(a5 + 2LL * (a6 + v21));
    uint64_t v45 = a6;
    while (1)
    {
      a6 = *(unsigned __int16 *)(a5 + 2LL * (v45 + 2));
      if ((_DWORD)a6 == 0xFFFF)
      {
LABEL_50:
        a6 = v45;
        goto LABEL_2;
      }

      int v46 = *(unsigned __int16 *)(a5 + 2LL * *(unsigned __int16 *)(a5 + 2LL * (v45 + 2)));
      if (v46 == 3)
      {
        a7 = !a7;
        goto LABEL_49;
      }

uint64_t _lou_stringHash(unsigned __int16 *a1, int a2, uint64_t a3)
{
  int v4 = *a1;
  if (a2)
  {
    int v4 = sub_1B358(*a1, a3);
    int v6 = sub_1B358(a1[1], a3);
  }

  else
  {
    int v6 = a1[1];
  }

  return (v6 + (v4 << 8) - 1123 * ((3824548 * (unint64_t)(v6 + (v4 << 8))) >> 32));
}

uint64_t sub_1B358(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(unsigned int *)(a2
                       + 4LL
  if ((_DWORD)v2)
  {
    while (1)
    {
      uint64_t v3 = a2 + 8 * v2 + 31616;
      uint64_t v2 = *(unsigned int *)(v3 + 12);
      if (!(_DWORD)v2) {
        return result;
      }
    }

    uint64_t v4 = *(void *)(v3 + 32);
    if ((v4 & 0x10) != 0)
    {
      uint64_t v5 = *(unsigned int *)(v3 + 48);
      if ((_DWORD)v5) {
        uint64_t v3 = a2 + 8 * v5 + 31616;
      }
      unint64_t v6 = v4 & 0xFFFFFFFFFFFFFFEFLL;
      if ((v6 & ~*(void *)(v3 + 32)) != 0)
      {
        while (1)
        {
          uint64_t v7 = *(unsigned int *)(v3 + 52);
          if (!(_DWORD)v7) {
            break;
          }
          uint64_t v8 = a2 + 8 * v7;
          uint64_t v3 = v8 + 31616;
          if ((v6 & ~*(void *)(v8 + 31648)) == 0) {
            return *(unsigned __int16 *)(v3 + 44);
          }
        }
      }

      else
      {
        return *(unsigned __int16 *)(v3 + 44);
      }
    }
  }

  return result;
}

uint64_t _lou_charHash(unsigned __int16 a1)
{
  return a1 % 0x463u;
}

char *_lou_showString(uint64_t a1, int a2, int a3)
{
  byte_29F58[0] = 39;
  if (a2 >= 1)
  {
    uint64_t v5 = 0LL;
    unint64_t v6 = a2;
    int v7 = &dword_0 + 1;
    while (1)
    {
      int v8 = *(unsigned __int16 *)(a1 + 2 * v5);
      if (a3 || (v8 - 127) < 0xFFFFFFA1)
      {
        int v9 = __sprintf_chk(__src, 0, 0x14uLL, "%x", *(unsigned __int16 *)(a1 + 2 * v5));
        int v10 = v9;
        int v11 = v9 - 1;
        if ((v9 - 1) > 7)
        {
          unsigned int v13 = 0;
          LOBYTE(v12) = 63;
        }

        else
        {
          unint64_t v12 = 0x7A7A7A7978787878uLL >> (8 * v11);
          unsigned int v13 = dword_1CF04[v11];
        }

        unsigned int v14 = &byte_29F58[v7];
        char *v14 = 92;
        v14[1] = v12;
        if (v13)
        {
          memset(&byte_29F58[v7 + 2], 48, v13);
          v7 += v13 + 2;
        }

        else
        {
          v7 += 2;
        }

        if (v10 >= 1)
        {
          memcpy(&byte_29F58[v7], __src, v10);
          v7 += v10;
        }
      }

      else
      {
        byte_29F58[v7++] = v8;
      }

      if (++v5 >= v6 || v7 >= 2046) {
        goto LABEL_19;
      }
    }
  }

  int v7 = &dword_0 + 1;
LABEL_19:
  *(_WORD *)&byte_29F58[v7] = 39;
  return byte_29F58;
}

char *_lou_unknownDots(unsigned int a1)
{
  uint64_t v1 = 0LL;
  byte_2A758[0] = 92;
  uint64_t v2 = a1;
  uint64_t v3 = 1LL;
  int v4 = &dword_0 + 1;
  BOOL result = byte_2A758;
  do
  {
    if ((v3 & v2) != 0) {
      byte_2A758[v4++] = byte_1CCA8[v1 + 8];
    }
    uint64_t v3 = *(void *)&byte_1CCA8[v1 + 16];
    v1 += 16LL;
  }

  while (v1 != 240);
  if (v4 == 1)
  {
    LOBYTE(word_2A759) = 48;
    int v4 = &dword_0 + 2;
  }

  *(_WORD *)&byte_2A758[v4] = 47;
  return result;
}

char *_lou_showDots(uint64_t a1, int a2)
{
  BOOL result = byte_2A76C;
  if (a2 < 1)
  {
    int v5 = 0;
  }

  else
  {
    unint64_t v4 = 0LL;
    int v5 = 0;
    do
    {
      uint64_t v6 = 0LL;
      LOWORD(v7) = 1;
      do
      {
        uint64_t v7 = *(void *)&byte_1CCA8[v6 + 16];
        v6 += 16LL;
      }

      while (v6 != 240);
      if (v4 != a2 - 1 && v5 <= 2046) {
        byte_2A76C[v5++] = 45;
      }
      ++v4;
    }

    while (v4 < a2 && v5 < 2047);
  }

  byte_2A76C[v5] = 0;
  return result;
}

char *_lou_showAttributes(uint64_t a1)
{
  uint64_t v1 = 0LL;
  int v2 = 0;
  uint64_t v3 = 1LL;
  do
  {
    if ((v3 & a1) != 0 && v2 <= 2046) {
      byte_2AF6C[v2++] = byte_1CDA8[v1 + 8];
    }
    uint64_t v3 = *(void *)&byte_1CDA8[v1 + 16];
    v1 += 16LL;
  }

  while (v1 != 208);
  byte_2AF6C[v2] = 0;
  return byte_2AF6C;
}

void _lou_outOfMemory()
{
}

BOOL _lou_isValidMode(int a1)
{
  for (uint64_t i = 0LL; i != 7; ++i)
    a1 &= ~dword_1CE88[i];
  return a1 == 0;
}

uint64_t _lou_charToFallbackDots(unsigned int a1)
{
  if (a1 <= 0x7F) {
    unsigned int v1 = a1;
  }
  else {
    unsigned int v1 = 63;
  }
  int v2 = &unk_1CEA3;
  do
  {
    unsigned int v3 = v2[1];
    v2 += 4;
  }

  while (v1 < v3);
  return (unsigned __int16)(byte_1CEA4[v1 & (*(v2 - 2) ^ 0xFFFF) | (unint64_t)*(v2 - 1)] | *v2) | 0x8000u;
}

void sub_1B808()
{
}

void sub_1B868()
{
}

void sub_1B8CC()
{
}

void sub_1B92C(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 activeTable]);
  sub_4ECC();
  sub_4EC0(&dword_0, a2, v4, "Tried to translate technical text, but there is no technical table for %@.", v5);

  sub_4F08();
}

void sub_1B9AC(void *a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([a1 activeTable]);
  sub_4ECC();
  sub_4EC0(&dword_0, a2, v4, "Tried to translate text to braille, but couldn't find a table to use for %@", v5);

  sub_4F08();
}

void sub_1BA2C( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BA5C()
{
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Error translating text: '%@' result:%d", v2, 0x12u);
  sub_4EE8();
}

void sub_1BAD8( os_log_s *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1BB08()
{
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_0, v1, OS_LOG_TYPE_ERROR, "Couldn't set form type data correctly! %@ %@", v2, 0x16u);
  sub_4EE8();
}

void sub_1BB84()
{
}

void sub_1BBE8()
{
}

id objc_msgSend__printBrailleForText_table_locations_textPositionsRange_textFormattingRanges_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printBrailleForText:table:locations:textPositionsRange:textFormattingRanges:");
}

id objc_msgSend_printBrailleForText_mode_locations_textPositionsRange_textFormattingRanges_( void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printBrailleForText:mode:locations:textPositionsRange:textFormattingRanges:");
}

id objc_msgSend_underlineRanges(void *a1, const char *a2, ...)
{
  return [a1 underlineRanges];
}