LABEL_156:
                      v45 = a1;
                      v46 = v37;
                      v47 = v16;
                      v48 = 0LL;
LABEL_157:
                      -[PBTextWriter _writeResult:forProperty:bracePrefix:]( v45,  *(void **)&v46,  v47,  v48,  v9,  v10,  v11,  v12,  v66);
                      continue;
                    }

LABEL_85:
                    v37 = 0.0;
                    goto LABEL_156;
                  }

                  v36 = ((char)v22 - 64);
                  if (((1LL << (v22 - 64)) & 0xA1258000A120CLL) != 0)
                  {
                    v37 = 0.0;
                    if ((char)v22 > 80)
                    {
                      switch((char)v22)
                      {
                        case 'c':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&v39 = COERCE_DOUBLE( [MEMORY[0x189607968] numberWithChar:SLOBYTE(v74)]);
                          goto LABEL_155;
                        case 'd':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithDouble:v75]);
                          goto LABEL_155;
                        case 'e':
                        case 'g':
                        case 'h':
                        case 'j':
                        case 'k':
                        case 'm':
                        case 'n':
                        case 'o':
                        case 'p':
                        case 'r':
                          goto LABEL_156;
                        case 'f':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          LODWORD(v53) = LODWORD(v74);
                          *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithFloat:v53]);
                          goto LABEL_155;
                        case 'i':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithInt:LODWORD(v74)]);
                          goto LABEL_155;
                        case 'l':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithLong:*(void *)&v75]);
                          goto LABEL_155;
                        case 'q':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithLongLong:*(void *)&v75]);
                          goto LABEL_155;
                        case 's':
                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v74];
                          v38 = *(void **)(v16 + 72);
                          if (v38) {
                            goto LABEL_117;
                          }
                          *(double *)&v39 = COERCE_DOUBLE( [MEMORY[0x189607968] numberWithShort:SLOWORD(v74)]);
                          goto LABEL_155;
                        default:
                          if ((char)v22 != 81)
                          {
                            [*(id *)(v16 + 48) invokeWithTarget:a2];
                            [*(id *)(v16 + 48) getReturnValue:&v74];
                            v38 = *(void **)(v16 + 72);
                            if (!v38)
                            {
                              *(double *)&v39 = COERCE_DOUBLE( [MEMORY[0x189607968] numberWithUnsignedShort:LOWORD(v74)]);
                              goto LABEL_155;
                            }

                            goto LABEL_117;
                          }

                          [*(id *)(v16 + 48) invokeWithTarget:a2];
                          [*(id *)(v16 + 48) getReturnValue:&v75];
                          v49 = *(void **)(v16 + 72);
                          if (v49) {
                            goto LABEL_120;
                          }
                          *(double *)&v39 = COERCE_DOUBLE( [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&v75]);
                          break;
                      }

                      goto LABEL_155;
                    }

                    if ((char)v22 > 72)
                    {
                      if ((char)v22 != 73)
                      {
                        [*(id *)(v16 + 48) invokeWithTarget:a2];
                        [*(id *)(v16 + 48) getReturnValue:&v75];
                        v49 = *(void **)(v16 + 72);
                        if (v49)
                        {
LABEL_120:
                          [v49 setArgument:&v75 atIndex:2];
                          [*(id *)(v16 + 72) invokeWithTarget:a2];
                          v74 = 0.0;
                          [*(id *)(v16 + 72) getReturnValue:&v74];
                          v37 = v74;
                          goto LABEL_156;
                        }

                        *(double *)&v39 = COERCE_DOUBLE( [MEMORY[0x189607968] numberWithUnsignedLong:*(void *)&v75]);
                        goto LABEL_155;
                      }

                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithUnsignedInt:LODWORD(v74)]);
                        goto LABEL_155;
                      }
                    }

                    else if ((char)v22 == 66)
                    {
                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithBool:LOBYTE(v74)]);
                        goto LABEL_155;
                      }
                    }

                    else
                    {
                      [*(id *)(v16 + 48) invokeWithTarget:a2];
                      [*(id *)(v16 + 48) getReturnValue:&v74];
                      v38 = *(void **)(v16 + 72);
                      if (!v38)
                      {
                        *(double *)&v39 = COERCE_DOUBLE([MEMORY[0x189607968] numberWithUnsignedChar:LOBYTE(v74)]);
LABEL_155:
                        v37 = *(double *)&v39;
                        goto LABEL_156;
                      }
                    }

LABEL_117:
                    [v38 setArgument:&v74 atIndex:2];
                    [*(id *)(v16 + 72) invokeWithTarget:a2];
                    v75 = 0.0;
                    v52 = *(void **)(v16 + 72);
                  }

                  else
                  {
                    if ((char)v22 != 64)
                    {
                      if (v36 != 30) {
                        continue;
                      }
                      goto LABEL_85;
                    }

                    v75 = 0.0;
                    [*(id *)(v16 + 48) invokeWithTarget:a2];
                    v52 = *(void **)(v16 + 48);
                  }

                  [v52 getReturnValue:&v75];
                  v37 = v75;
                  goto LABEL_156;
                }

LABEL_48:
                v29 = [*(id *)(v16 + 8) hasSuffix:@"s"];
                v30 = *(void **)(v16 + 8);
                if (v29) {
                  v30 = (void *)objc_msgSend(v30, "substringToIndex:", objc_msgSend(*(id *)(v16 + 8), "length") - 1);
                }
                if (!*(void *)(v16 + 88))
                {
                  v66 = *(void *)(v16 + 104);
                  v31 = dlsym( (void *)0xFFFFFFFFFFFFFFFELL,  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@DictionaryRepresentation"), "UTF8String"]);
                  *(void *)(v16 + 88) = v31;
                  if (!v31) {
                    goto LABEL_72;
                  }
                }

                if (*(_BYTE *)(v16 + 32) != 94)
                {
                  v40 = *(id *)(v16 + 120);
                  if (v40) {
                    v40 = (id)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:v40];
                  }
                  [*(id *)(v16 + 48) invokeWithTarget:a2];
                  objc_msgSend(*(id *)(v16 + 48), "getReturnValue:", objc_msgSend(v40, "mutableBytes"));
                  v34 = (id)(*(uint64_t (**)(uint64_t))(v16 + 88))([v40 bytes]);
                  goto LABEL_73;
                }

                v32 = -[_PBProperty getCountOfRepeatedValuesFromInstance:](v16, a2);
                if (v32)
                {
                  v33 = v32;
                  v75 = 0.0;
                  [*(id *)(v16 + 48) invokeWithTarget:a2];
                  [*(id *)(v16 + 48) getReturnValue:&v75];
                  v34 = (id)[objc_alloc(MEMORY[0x189603FA8]) initWithCapacity:v33];
                  v35 = v75;
                  do
                  {
                    [v34 addObject:(*(uint64_t (**)(double))(v16 + 88))(COERCE_DOUBLE(*(void *)&v35))];
                    *(void *)&v35 = *(void *)&v75 + *(void *)(v16 + 120);
                    v75 = v35;
                    --v33;
                  }

                  while (v33);
                }

                else
                {
LABEL_72:
                  v34 = 0LL;
                }

LABEL_73:
                v45 = a1;
                v46 = *(double *)&v34;
                v47 = v16;
                v48 = (uint64_t)v30;
                goto LABEL_157;
              }
            }

            else if (!*(void *)(v16 + 64) {
                   || -[_PBProperty getCountOfRepeatedValuesFromInstance:]( *(void *)(*((void *)&v70 + 1) + 8 * i),  a2))
            }
            {
              goto LABEL_41;
            }
          }
        }

        v13 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      }

      while (v13);
    }
  }

  return v68;
}

LABEL_28:
    v34 = v18;
    return -[PBTextWriter _printLine:format:](v12, 0LL, (uint64_t)@"%@: %@", v13, v14, v15, v16, v17, v34);
  }

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  result = [a2 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (result)
  {
    v19 = result;
    v20 = *(void *)v41;
    do
    {
      v21 = 0LL;
      do
      {
        if (*(void *)v41 != v20) {
          objc_enumerationMutation(a2);
        }
        -[PBTextWriter _writeResult:forProperty:bracePrefix:]( v12,  *(void *)(*((void *)&v40 + 1) + 8 * v21++),  a3,  a4);
      }

      while (v19 != v21);
      result = [a2 countByEnumeratingWithState:&v40 objects:v44 count:16];
      v19 = result;
    }

    while (result);
  }

  return result;
}

uint64_t PBReaderPlaceMark(void *a1, unint64_t *a2)
{
  v3 = a1;
  char v4 = 0;
  unsigned int v5 = 0;
  uint64_t v6 = 0LL;
  unint64_t v7 = v3[1];
  do
  {
    unint64_t v8 = v7 + 1;
    if (v7 == -1LL || v8 > v3[5]) {
      goto LABEL_9;
    }
    char v9 = *(_BYTE *)(v3[3] + v7);
    v3[1] = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0)
    {
      uint64_t v6 = v6;
      if (!*((_BYTE *)v3 + 16)) {
        goto LABEL_8;
      }
LABEL_11:
      uint64_t v12 = 0LL;
      goto LABEL_13;
    }

    v4 += 7;
    unint64_t v7 = v8;
  }

  while (v5++ < 9);
  uint64_t v6 = 0LL;
  if (*((_BYTE *)v3 + 16)) {
    goto LABEL_11;
  }
LABEL_8:
  unint64_t v11 = v8 + v6;
  if (v11 > v3[5])
  {
LABEL_9:
    uint64_t v12 = 0LL;
    *((_BYTE *)v3 + 16) = 1;
    goto LABEL_13;
  }

  *a2 = v11;
  a2[1] = v3[5];
  v3[5] = v3[1] + v6;
  uint64_t v12 = 1LL;
LABEL_13:

  return v12;
}

id PBReaderReadData(void *a1)
{
  id v1 = a1;
  v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0LL;
  unint64_t v6 = *((void *)v1 + 1);
  do
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1LL || v7 > *((void *)v1 + 5)) {
      goto LABEL_15;
    }
    char v8 = *(_BYTE *)(*((void *)v1 + 3) + v6);
    *((void *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((_BYTE *)v1 + 16)) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = v5;
      }
      if (*((_BYTE *)v1 + 16)) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }

    v3 += 7;
    unint64_t v6 = v7;
  }

  while (v4++ < 9);
  uint64_t v10 = 0LL;
  if (*((_BYTE *)v1 + 16))
  {
LABEL_8:
    unint64_t v11 = 0LL;
    goto LABEL_16;
  }

LABEL_13:
  if (__CFADD__(v7, v10) || v7 + v10 > *((void *)v1 + 5))
  {
LABEL_15:
    unint64_t v11 = 0LL;
    *((_BYTE *)v1 + 16) = 1;
  }

  else
  {
    objc_msgSend(*((id *)v1 + 4), "subdataWithRange:");
    unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    v2[1] += v10;
  }

  char v9 = __CFADD__(v7, v10);
  uint64_t v12 = v7 + v10;
  if (v9 || v12 > *((void *)v1 + 5))
  {
LABEL_15:
    unint64_t v11 = 0LL;
    *((_BYTE *)v1 + 16) = 1;
  }

  else
  {
    v14 = [*((id *)v1 + 4) bytes] + *((void *)v1 + 1);
    unint64_t v11 = (void *)[objc_alloc(NSString) initWithBytes:v14 length:v10 encoding:4];
    v2[1] += v10;
  }

    v20 = 0LL;
    goto LABEL_112;
  }

LABEL_16:
  return v11;
}

  return v11;
}

    unint64_t v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)v9, 2LL);
LABEL_17:
    --a3;
  }

  v16[0] = 34;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)v16, 1LL);
  std::stringbuf::str(this, &v14);
  v12[0] = *MEMORY[0x189614728];
  uint64_t v10 = *(void *)(MEMORY[0x189614728] + 72LL);
  *(void *)((char *)v12 + *(void *)(v12[0] - 24LL)) = *(void *)(MEMORY[0x189614728] + 64LL);
  v13 = v10;
  v14.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x186E22CE4](&v15);
}

id PBReaderReadString(void *a1)
{
  id v1 = a1;
  v2 = v1;
  char v3 = 0;
  unsigned int v4 = 0;
  uint64_t v5 = 0LL;
  unint64_t v6 = *((void *)v1 + 1);
  do
  {
    unint64_t v7 = v6 + 1;
    if (v6 == -1LL || v7 > *((void *)v1 + 5)) {
      goto LABEL_15;
    }
    char v8 = *(_BYTE *)(*((void *)v1 + 3) + v6);
    *((void *)v1 + 1) = v7;
    v5 |= (unint64_t)(v8 & 0x7F) << v3;
    if ((v8 & 0x80) == 0)
    {
      if (*((_BYTE *)v1 + 16)) {
        uint64_t v10 = 0LL;
      }
      else {
        uint64_t v10 = v5;
      }
      if (*((_BYTE *)v1 + 16)) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }

    v3 += 7;
    unint64_t v6 = v7;
    BOOL v9 = v4++ >= 9;
  }

  while (!v9);
  uint64_t v10 = 0LL;
  if (*((_BYTE *)v1 + 16))
  {
LABEL_8:
    unint64_t v11 = 0LL;
    goto LABEL_16;
  }

unint64_t PBReaderReadBigEndianFixed64(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFF7LL && (unint64_t v3 = v2 + 8, v2 + 8 <= v1[5]))
  {
    unint64_t v4 = *(void *)(v1[3] + v2);
    v1[1] = v3;
  }

  else
  {
    unint64_t v4 = 0LL;
    *((_BYTE *)v1 + 16) = 1;
  }

  unint64_t v5 = bswap64(v4);

  return v5;
}

uint64_t PBReaderReadBigEndianFixed32(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFBLL && (unint64_t v3 = v2 + 4, v2 + 4 <= v1[5]))
  {
    unsigned int v4 = *(_DWORD *)(v1[3] + v2);
    v1[1] = v3;
  }

  else
  {
    unsigned int v4 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }

  uint64_t v5 = bswap32(v4);

  return v5;
}

uint64_t PBReaderReadBigEndianFixed16(void *a1)
{
  id v1 = a1;
  unint64_t v2 = v1[1];
  if (v2 <= 0xFFFFFFFFFFFFFFFDLL && (unint64_t v3 = v2 + 2, v2 + 2 <= v1[5]))
  {
    unsigned int v4 = *(unsigned __int16 *)(v1[3] + v2);
    v1[1] = v3;
  }

  else
  {
    unsigned int v4 = 0;
    *((_BYTE *)v1 + 16) = 1;
  }

  uint64_t v5 = __rev16(v4);

  return v5;
}

uint64_t _PBReaderSkipValueWithTag(void *a1, int a2, int a3, uint64_t a4)
{
  unint64_t v7 = a1;
  char v8 = v7;
  uint64_t v9 = 0LL;
  switch(a3)
  {
    case 0:
      unsigned int v10 = 0;
      unint64_t v11 = v7[1];
      uint64_t v9 = 1LL;
      do
      {
        unint64_t v12 = v11 + 1;
        if (v11 == -1LL || v12 > v7[5]) {
          goto LABEL_43;
        }
        int v13 = *(char *)(v7[3] + v11);
        v7[1] = v12;
        if ((v13 & 0x80000000) == 0) {
          break;
        }
        unint64_t v11 = v12;
        BOOL v14 = v10++ > 8;
      }

      while (!v14);
      goto LABEL_46;
    case 1:
      unint64_t v15 = v7[1];
      if (v15 > 0xFFFFFFFFFFFFFFF7LL) {
        goto LABEL_43;
      }
      unint64_t v16 = v15 + 8;
      goto LABEL_42;
    case 2:
      char v17 = 0;
      unsigned int v18 = 0;
      uint64_t v19 = 0LL;
      uint64_t v20 = v7[1];
      while (2)
      {
        unint64_t v21 = v20 + 1;
        if (v20 == -1)
        {
          uint64_t v20 = -1LL;
          goto LABEL_38;
        }

        if (v21 > v7[5])
        {
LABEL_38:
          uint64_t v19 = 0LL;
          *((_BYTE *)v7 + 16) = 1;
          unint64_t v21 = v20;
          goto LABEL_41;
        }

        char v22 = *(_BYTE *)(v7[3] + v20);
        v7[1] = v21;
        v19 |= (unint64_t)(v22 & 0x7F) << v17;
        if (v22 < 0)
        {
          v17 += 7;
          uint64_t v20 = v21;
          BOOL v23 = v18++ >= 9;
          if (v23)
          {
            uint64_t v19 = 0LL;
            goto LABEL_41;
          }

          continue;
        }

        break;
      }

      uint64_t v19 = v19;
      if (*((_BYTE *)v7 + 16)) {
        uint64_t v19 = 0LL;
      }
LABEL_41:
      BOOL v23 = __CFADD__(v21, v19);
      unint64_t v16 = v21 + v19;
      if (v23) {
        goto LABEL_43;
      }
LABEL_42:
      if (v16 > v7[5])
      {
LABEL_43:
        uint64_t v9 = 1LL;
        *((_BYTE *)v8 + 16) = 1;
        goto LABEL_46;
      }

      v7[1] = v16;
LABEL_45:
      uint64_t v9 = 1LL;
LABEL_46:

      return v9;
    case 3:
      uint64_t v9 = 1LL;
      if (*((_BYTE *)v7 + 16)) {
        goto LABEL_46;
      }
      unint64_t v24 = a4 + 1;
      do
      {
        char v25 = 0;
        unsigned int v26 = 0;
        unint64_t v27 = 0LL;
        unint64_t v28 = v8[1];
        while (1)
        {
          unint64_t v29 = v28 + 1;
          if (v28 == -1LL || v29 > v8[5])
          {
            unint64_t v31 = 0LL;
            uint64_t v32 = 0LL;
            *((_BYTE *)v8 + 16) = 1;
            goto LABEL_32;
          }

          char v30 = *(_BYTE *)(v8[3] + v28);
          v8[1] = v29;
          v27 |= (unint64_t)(v30 & 0x7F) << v25;
          if ((v30 & 0x80) == 0) {
            break;
          }
          v25 += 7;
          unint64_t v28 = v29;
          BOOL v14 = v26++ > 8;
          if (v14)
          {
            unint64_t v31 = 0LL;
            uint64_t v32 = 0LL;
            goto LABEL_32;
          }
        }

        uint64_t v32 = v27 & 7;
        unint64_t v31 = v27 >> 3;
        if ((_DWORD)v32 == 4 && (_DWORD)v31 == a2) {
          goto LABEL_45;
        }
LABEL_32:
        if (v24 >= 0x41) {
          goto LABEL_43;
        }
        _PBReaderSkipValueWithTag(v8, v31, v32, v24);
      }

      while (!*((_BYTE *)v8 + 16));
      goto LABEL_46;
    case 5:
      unint64_t v34 = v7[1];
      if (v34 > 0xFFFFFFFFFFFFFFFBLL) {
        goto LABEL_43;
      }
      unint64_t v16 = v34 + 4;
      goto LABEL_42;
    default:
      goto LABEL_46;
  }
}

uint64_t PBReaderSkipValueWithTag(void *a1, int a2, int a3)
{
  return _PBReaderSkipValueWithTag(a1, a2, a3, 0LL);
}

uint64_t PBReaderRecallMark(uint64_t result, void *a2)
{
  *(void *)(result + 8) = *a2;
  *(void *)(result + 40) = a2[1];
  return result;
}

uint64_t PBReaderReadVarIntBuf(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  char v4 = 0;
  uint64_t v5 = 0LL;
  uint64_t v6 = 0LL;
  while (1)
  {
    if (a2 == v5) {
      return 0LL;
    }
    char v7 = *(_BYTE *)(a1 + v5);
    v6 |= (unint64_t)(v7 & 0x7F) << v4;
    ++v5;
    if ((v7 & 0x80) == 0) {
      break;
    }
    v4 += 7;
    if (v5 == 10)
    {
      uint64_t result = 0LL;
      *a4 = 11LL;
      *a3 = 0LL;
      return result;
    }
  }

  *a3 = v6;
  *a4 = v5;
  return 1LL;
}

void PBDataWriterWriteDataField(uint64_t a1, void *a2, int a3)
{
  id v18 = a2;
  uint64_t v5 = (const void *)[v18 bytes];
  size_t v6 = [v18 length];
  char v7 = *(void **)(a1 + 8);
  unint64_t v8 = v7[3];
  if (v8 < v7[1] + v6 + 16)
  {
    if (v8 - v7[2] <= v6 + 16) {
      uint64_t v9 = v6 + 16;
    }
    else {
      uint64_t v9 = v8 - v7[2];
    }
    -[PBMutableData _pb_growCapacityBy:](v7, v9);
    char v7 = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v10 = (8 * a3) | 2u;
    unint64_t v11 = (_BYTE *)v7[1];
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        unint64_t v12 = v10 >> 7;
        unint64_t v13 = v10 >> 14;
        v10 >>= 7;
      }

      while (v13);
    }

    *unint64_t v11 = v12;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v11 + 1;
    char v7 = *(void **)(a1 + 8);
  }

  BOOL v14 = (_BYTE *)v7[1];
  if (v6 < 0x80)
  {
    LOBYTE(v16) = v6;
  }

  else
  {
    size_t v15 = v6;
    do
    {
      *v14++ = v15 | 0x80;
      size_t v16 = v15 >> 7;
      size_t v17 = v15 >> 14;
      v15 >>= 7;
    }

    while (v17);
  }

  *BOOL v14 = v16;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v14 + 1;
  memcpy(*(void **)(*(void *)(a1 + 8) + 8LL), v5, v6);
  *(void *)(*(void *)(a1 + 8) + 8LL) += v6;
}

void PBDataWriterWriteStringField(uint64_t a1, void *a2, int a3)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  if ((unint64_t)[v5 length] <= 0xA5
    && (size_t __n = 0LL,
        objc_msgSend( v5,  "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:",  __src,  1000,  &__n,  4,  4,  0,  objc_msgSend(v5, "length"),  0)))
  {
    size_t v6 = __n;
    char v7 = *(void **)(a1 + 8);
    size_t v8 = v7[3];
    if (v8 < v7[1] + __n + 16)
    {
      if (v8 - v7[2] <= __n + 16) {
        uint64_t v9 = __n + 16;
      }
      else {
        uint64_t v9 = v8 - v7[2];
      }
      -[PBMutableData _pb_growCapacityBy:](v7, v9);
      char v7 = *(void **)(a1 + 8);
    }

    if (a3 != -1)
    {
      unint64_t v10 = (8 * a3) | 2u;
      unint64_t v11 = (_BYTE *)v7[1];
      if (v10 < 0x80)
      {
        LOBYTE(v12) = (8 * a3) | 2;
      }

      else
      {
        do
        {
          *v11++ = v10 | 0x80;
          unint64_t v12 = v10 >> 7;
          unint64_t v13 = v10 >> 14;
          v10 >>= 7;
        }

        while (v13);
      }

      *unint64_t v11 = v12;
      *(void *)(*(void *)(a1 + 8) + 8LL) = v11 + 1;
      char v7 = *(void **)(a1 + 8);
    }

    v38 = (_BYTE *)v7[1];
    if (v6 < 0x80)
    {
      LOBYTE(v40) = v6;
    }

    else
    {
      size_t v39 = v6;
      do
      {
        *v38++ = v39 | 0x80;
        size_t v40 = v39 >> 7;
        size_t v41 = v39 >> 14;
        v39 >>= 7;
      }

      while (v41);
    }

    _BYTE *v38 = v40;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v38 + 1;
    memcpy(*(void **)(*(void *)(a1 + 8) + 8LL), __src, v6);
    *(void *)(*(void *)(a1 + 8) + 8LL) += v6;
  }

  else
  {
    BOOL v14 = (void *)MEMORY[0x186E22E88]();
    [v5 dataUsingEncoding:4];
    size_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v15 length])
    {
      id v16 = v15;
      size_t v17 = (const void *)[v16 bytes];
      size_t v18 = [v16 length];
      uint64_t v19 = *(void **)(a1 + 8);
      unint64_t v20 = v19[3];
      if (v20 < v19[1] + v18 + 16)
      {
        if (v20 - v19[2] <= v18 + 16) {
          uint64_t v21 = v18 + 16;
        }
        else {
          uint64_t v21 = v20 - v19[2];
        }
        -[PBMutableData _pb_growCapacityBy:](v19, v21);
        uint64_t v19 = *(void **)(a1 + 8);
      }

      if (a3 != -1)
      {
        unint64_t v22 = (8 * a3) | 2u;
        BOOL v23 = (_BYTE *)v19[1];
        if (v22 < 0x80)
        {
          LOBYTE(v24) = (8 * a3) | 2;
        }

        else
        {
          do
          {
            *v23++ = v22 | 0x80;
            unint64_t v24 = v22 >> 7;
            unint64_t v25 = v22 >> 14;
            v22 >>= 7;
          }

          while (v25);
        }

        *BOOL v23 = v24;
        *(void *)(*(void *)(a1 + 8) + 8LL) = v23 + 1;
        uint64_t v19 = *(void **)(a1 + 8);
      }

      v33 = (_BYTE *)v19[1];
      if (v18 < 0x80)
      {
        LOBYTE(v35) = v18;
      }

      else
      {
        size_t v34 = v18;
        do
        {
          *v33++ = v34 | 0x80;
          size_t v35 = v34 >> 7;
          size_t v36 = v34 >> 14;
          v34 >>= 7;
        }

        while (v36);
      }

      _BYTE *v33 = v35;
      *(void *)(*(void *)(a1 + 8) + 8LL) = v33 + 1;
      memcpy(*(void **)(*(void *)(a1 + 8) + 8LL), v17, v18);
      *(void *)(*(void *)(a1 + 8) + 8LL) += v18;
    }

    else
    {
      unsigned int v26 = *(void **)(a1 + 8);
      unint64_t v27 = v26[3];
      if (v27 < v26[1] + 16LL)
      {
        if (v27 - v26[2] <= 0x10) {
          uint64_t v28 = 16LL;
        }
        else {
          uint64_t v28 = v27 - v26[2];
        }
        -[PBMutableData _pb_growCapacityBy:](v26, v28);
        unsigned int v26 = *(void **)(a1 + 8);
      }

      if (a3 != -1)
      {
        unint64_t v29 = (8 * a3) | 2u;
        char v30 = (_BYTE *)v26[1];
        if (v29 < 0x80)
        {
          LOBYTE(v31) = (8 * a3) | 2;
        }

        else
        {
          do
          {
            *v30++ = v29 | 0x80;
            unint64_t v31 = v29 >> 7;
            unint64_t v32 = v29 >> 14;
            v29 >>= 7;
          }

          while (v32);
        }

        *char v30 = v31;
        *(void *)(*(void *)(a1 + 8) + 8LL) = v30 + 1;
        unsigned int v26 = *(void **)(a1 + 8);
      }

      v37 = (_BYTE *)v26[1];
      _BYTE *v37 = 0;
      *(void *)(*(void *)(a1 + 8) + 8LL) = v37 + 1;
    }

    objc_autoreleasePoolPop(v14);
  }
}

void *PBDataWriterWriteSfixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24LL)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 8LL;
  return result;
}

void *PBDataWriterWriteSfixed32Field(uint64_t a1, int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20LL)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 4LL;
  return result;
}

void *PBDataWriterWriteFixed64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24LL)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 1u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 1;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(void *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 8LL;
  return result;
}

void *PBDataWriterWriteFixed32Field(uint64_t a1, int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20LL)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 5u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 5;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(_DWORD *)result[1] = a2;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 4LL;
  return result;
}

void *PBDataWriterWriteFloatField(uint64_t a1, int a2, float a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 20LL)
  {
    if (v7 - result[2] <= 0x14) {
      uint64_t v8 = 20LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 5u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 5;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(float *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 4LL;
  return result;
}

void *PBDataWriterWriteDoubleField(uint64_t a1, int a2, double a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 24LL)
  {
    if (v7 - result[2] <= 0x18) {
      uint64_t v8 = 24LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a2 != -1)
  {
    unint64_t v9 = (8 * a2) | 1u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a2) | 1;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  *(double *)result[1] = a3;
  *(void *)(*(void *)(a1 + 8) + 8LL) += 8LL;
  return result;
}

void *PBDataWriterWriteSint32Field(uint64_t a1, int a2, int a3)
{
  unint64_t v5 = (2 * a2) ^ (a2 >> 31);
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v13 = (_BYTE *)result[1];
  if (v5 < 0x80)
  {
    LOBYTE(v14) = v5;
  }

  else
  {
    do
    {
      *v13++ = v5 | 0x80;
      unint64_t v14 = v5 >> 7;
      unint64_t v15 = v5 >> 14;
      v5 >>= 7;
    }

    while (v15);
  }

  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v13 + 1;
  return result;
}

void *PBDataWriterWriteBOOLField(uint64_t a1, char a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v13 = (_BYTE *)result[1];
  *unint64_t v13 = a2;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v13 + 1;
  return result;
}

void *PBDataWriterWriteUint64Field(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }

  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }

    while (v15);
  }

  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v13 + 1;
  return result;
}

void *PBDataWriterWriteUint32Field(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16LL;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v10 = a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    unint64_t v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }

    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }

      while (v14);
    }

    *unint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v12 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }

  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }

    while (v17);
  }

  *unint64_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v15 + 1;
  return result;
}

void *PBDataWriterWriteInt64Field(uint64_t a1, unint64_t a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    if (v7 - result[2] <= 0x10) {
      uint64_t v8 = 16LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3);
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = 8 * a3;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v13 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v14) = a2;
  }

  else
  {
    do
    {
      *v13++ = a2 | 0x80;
      unint64_t v14 = a2 >> 7;
      unint64_t v15 = a2 >> 14;
      a2 >>= 7;
    }

    while (v15);
  }

  *unint64_t v13 = v14;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v13 + 1;
  return result;
}

void *PBDataWriterWriteInt32Field(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 16LL)
  {
    unint64_t v8 = v7 - result[2];
    if (v8 <= 0x10) {
      uint64_t v9 = 16LL;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v9);
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v10 = (int)a2;
  if (a3 != -1)
  {
    unint64_t v11 = (8 * a3);
    unint64_t v12 = (_BYTE *)result[1];
    if (v11 < 0x80)
    {
      LOBYTE(v13) = 8 * a3;
    }

    else
    {
      do
      {
        *v12++ = v11 | 0x80;
        unint64_t v13 = v11 >> 7;
        unint64_t v14 = v11 >> 14;
        v11 >>= 7;
      }

      while (v14);
    }

    *unint64_t v12 = v13;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v12 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v15 = (_BYTE *)result[1];
  if (a2 < 0x80)
  {
    LOBYTE(v16) = a2;
  }

  else
  {
    do
    {
      *v15++ = v10 | 0x80;
      unint64_t v16 = v10 >> 7;
      unint64_t v17 = v10 >> 14;
      v10 >>= 7;
    }

    while (v17);
  }

  *unint64_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v15 + 1;
  return result;
}

uint64_t PBDataWriterWriteBareVarint(_BYTE *a1, unint64_t a2)
{
  unint64_t v2 = a1;
  if (a2 < 0x80)
  {
    LOBYTE(v3) = a2;
  }

  else
  {
    do
    {
      *v2++ = a2 | 0x80;
      unint64_t v3 = a2 >> 7;
      unint64_t v4 = a2 >> 14;
      a2 >>= 7;
    }

    while (v4);
  }

  _BYTE *v2 = v3;
  return v2 - a1 + 1;
}

void *PBDataWriterWriteSint64Field(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6 = 2 * a2;
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v8 = result[3];
  if (v8 < result[1] + 16LL)
  {
    unint64_t v9 = v8 - result[2];
    if (v9 <= 0x10) {
      uint64_t v10 = 16LL;
    }
    else {
      uint64_t v10 = v9;
    }
    -[PBMutableData _pb_growCapacityBy:](result, v10);
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v11 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    unint64_t v12 = (8 * a3);
    unint64_t v13 = (_BYTE *)result[1];
    if (v12 < 0x80)
    {
      LOBYTE(v14) = 8 * a3;
    }

    else
    {
      do
      {
        *v13++ = v12 | 0x80;
        unint64_t v14 = v12 >> 7;
        unint64_t v15 = v12 >> 14;
        v12 >>= 7;
      }

      while (v15);
    }

    *unint64_t v13 = v14;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v13 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  unint64_t v16 = (_BYTE *)result[1];
  if (v11 < 0x80)
  {
    uint64_t v17 = v6 ^ (a2 >> 63);
  }

  else
  {
    do
    {
      *v16++ = v11 | 0x80;
      uint64_t v17 = v11 >> 7;
      unint64_t v18 = v11 >> 14;
      v11 >>= 7;
    }

    while (v18);
  }

  *unint64_t v16 = v17;
  *(void *)(*(void *)(a1 + 8) + 8LL) = v16 + 1;
  return result;
}

void PBDataWriterWriteSubgroup(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  uint64_t v6 = *(void **)(a1 + 8);
  unint64_t v7 = v6[3];
  id v22 = v5;
  if (v7 < v6[1] + 8LL)
  {
    unint64_t v8 = v7 - v6[2];
    if (v8 <= 8) {
      uint64_t v9 = 8LL;
    }
    else {
      uint64_t v9 = v8;
    }
    -[PBMutableData _pb_growCapacityBy:](v6, v9);
    id v5 = v22;
  }

  if (a3 != -1)
  {
    unint64_t v10 = (8 * a3) | 3u;
    unint64_t v11 = *(_BYTE **)(*(void *)(a1 + 8) + 8LL);
    if (v10 < 0x80)
    {
      LOBYTE(v12) = (8 * a3) | 3;
    }

    else
    {
      do
      {
        *v11++ = v10 | 0x80;
        unint64_t v12 = v10 >> 7;
        unint64_t v13 = v10 >> 14;
        v10 >>= 7;
      }

      while (v13);
    }

    *unint64_t v11 = v12;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v11 + 1;
  }

  [v5 writeTo:a1];
  unint64_t v14 = *(void **)(a1 + 8);
  unint64_t v15 = v14[3];
  if (v15 < v14[1] + 8LL)
  {
    unint64_t v16 = v15 - v14[2];
    if (v16 <= 8) {
      uint64_t v17 = 8LL;
    }
    else {
      uint64_t v17 = v16;
    }
    -[PBMutableData _pb_growCapacityBy:](v14, v17);
  }

  if (a3 != -1)
  {
    unint64_t v18 = (8 * a3) | 4u;
    uint64_t v19 = *(_BYTE **)(*(void *)(a1 + 8) + 8LL);
    if (v18 < 0x80)
    {
      LOBYTE(v20) = (8 * a3) | 4;
    }

    else
    {
      do
      {
        *v19++ = v18 | 0x80;
        unint64_t v20 = v18 >> 7;
        unint64_t v21 = v18 >> 14;
        v18 >>= 7;
      }

      while (v21);
    }

    *uint64_t v19 = v20;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v19 + 1;
  }
}

void *PBDataWriterWriteSubmessage(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  PBDataWriterPlaceMark(a1, &v7, a3);
  [v5 writeTo:a1];

  return PBDataWriterRecallMark(a1, &v7);
}

void *PBDataWriterPlaceMark(uint64_t a1, void *a2, int a3)
{
  uint64_t result = *(void **)(a1 + 8);
  unint64_t v7 = result[3];
  if (v7 < result[1] + 10LL)
  {
    if (v7 - result[2] <= 0xA) {
      uint64_t v8 = 10LL;
    }
    else {
      uint64_t v8 = v7 - result[2];
    }
    -[PBMutableData _pb_growCapacityBy:](result, v8);
    uint64_t result = *(void **)(a1 + 8);
  }

  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 2u;
    unint64_t v10 = (_BYTE *)result[1];
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        *v10++ = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    *unint64_t v10 = v11;
    *(void *)(*(void *)(a1 + 8) + 8LL) = v10 + 1;
    uint64_t result = *(void **)(a1 + 8);
  }

  ++result[1];
  *a2 = *(void *)(*(void *)(a1 + 8) + 8LL) - *(void *)(*(void *)(a1 + 8) + 16LL);
  return result;
}

void *PBDataWriterRecallMark(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *(void **)(a1 + 8);
  uint64_t v5 = result[1];
  uint64_t v6 = result[2];
  uint64_t v7 = *a2;
  size_t v8 = v5 - (*a2 + v6);
  unint64_t v9 = -1LL;
  unint64_t v10 = v8;
  do
  {
    ++v9;
    BOOL v11 = v10 > 0x7F;
    v10 >>= 7;
  }

  while (v11);
  if (v9)
  {
    unint64_t v12 = result[3];
    if (v12 < v5 + v9)
    {
      unint64_t v13 = v12 - v6;
      if (v13 <= v9) {
        uint64_t v14 = v9;
      }
      else {
        uint64_t v14 = v13;
      }
      -[PBMutableData _pb_growCapacityBy:](result, v14);
      uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16LL);
      uint64_t v7 = *a2;
    }

    uint64_t result = memmove((void *)(v6 + v7 + v9), (const void *)(v6 + v7), v8);
    uint64_t v6 = *(void *)(*(void *)(a1 + 8) + 16LL);
    uint64_t v7 = *a2;
  }

  unint64_t v15 = (_BYTE *)(v6 + v7 - 1);
  if (v8 < 0x80)
  {
    LOBYTE(v16) = v8;
  }

  else
  {
    do
    {
      *v15++ = v8 | 0x80;
      size_t v16 = v8 >> 7;
      size_t v17 = v8 >> 14;
      v8 >>= 7;
    }

    while (v17);
  }

  *unint64_t v15 = v16;
  *(void *)(*(void *)(a1 + 8) + 8LL) += v9;
  return result;
}

LABEL_108:
              if (!v48)
              {
                v93 = *(void *)(v3 + 32);
                v94 = *(void *)(a1 + 40);
                v95 = 20LL;
                if (v93 > 20) {
                  v95 = v93;
                }
                else {
                  v96 = v94 - v93;
                }
                v97 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v95 - 20, v96);
                v98 = v115;
                v108 = -[NSString camelCase](v115);
                v112 = v17;
                v106 = v97;
                v107 = v98;
                v101 = v93;
                v102 = v94;
                unint64_t v3 = a1;
                unint64_t v25 = @"unable to parse struct";
                goto LABEL_33;
              }

              if (*(void *)(v17 + 96)
                || (v75 = dlsym( (void *)0xFFFFFFFFFFFFFFFELL,  (const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@FromDictionaryRepresentation", *(void *)(v17 + 104)), "UTF8String"]),  (*(void *)(v17 + 96) = v75) != 0))
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  v127[0] = v48;
                  v48 = (id)[MEMORY[0x189603F18] arrayWithObjects:v127 count:1];
                }

                v123 = 0u;
                v124 = 0u;
                v121 = 0u;
                v122 = 0u;
                v76 = [v48 countByEnumeratingWithState:&v121 objects:v126 count:16];
                if (v76)
                {
                  v77 = v76;
                  v78 = *(void *)v122;
                  do
                  {
                    for (i = 0LL; i != v77; ++i)
                    {
                      if (*(void *)v122 != v78) {
                        objc_enumerationMutation(v48);
                      }
                      v80 = *(void *)(*((void *)&v121 + 1) + 8 * i);
                      v81 = *(id *)(v17 + 120);
                      if (v81) {
                        v81 = (id)[objc_alloc(MEMORY[0x189603FB8]) initWithLength:v81];
                      }
                      (*(void (**)(uint64_t, uint64_t))(v17 + 96))(v80, [v81 mutableBytes]);
                      v82 = (void *)[v81 bytes];
                      v120 = v82;
                      if (*(_BYTE *)(v17 + 32) == 94)
                      {
                        if (-[NSString hasPrefix:]( NSStringFromSelector((SEL)objc_msgSend(*(id *)(v17 + 40), "selector", v82)),  "hasPrefix:",  @"set"))
                        {
                          v83 = *(void **)(v17 + 40);
                          v82 = &v120;
                          goto LABEL_125;
                        }

                        v82 = v120;
                      }

                      v83 = *(void **)(v17 + 40);
LABEL_125:
                      [v83 setArgument:v82 atIndex:2];
                      [*(id *)(v17 + 40) invokeWithTarget:v2];
                    }

                    v77 = [v48 countByEnumeratingWithState:&v121 objects:v126 count:16];
                  }

                  while (v77);
                }
              }

              unint64_t v3 = a1;
            }

            break;
          case 2LL:
          case 5LL:
            return v2;
          case 3LL:
            uint64_t v28 = -[PBTextReader _readString](v3);
            if (!v28) {
              continue;
            }
            v126[0] = v28;
            if (!v17) {
              continue;
            }
            goto LABEL_43;
          case 4LL:
            unint64_t v29 = (void *)-[PBTextReader _readValue](v3);
            if (![v29 length]) {
              continue;
            }
            if ([v29 characterAtIndex:0] == 48
              || (v67 = objc_msgSend(v29, "rangeOfCharacterFromSet:", objc_msgSend(*(id *)(v3 + 24), "invertedSet")), v17)
              && *(void *)(v17 + 80)
              || v67 == 0x7FFFFFFFFFFFFFFFLL
              || (v68 = (id)[objc_alloc(MEMORY[0x189603F48]) initWithBase64EncodedString:v29 options:0],  !objc_msgSend(v68, "length")))
            {
              if (v17)
              {
                if (*(void *)(v17 + 80))
                {
                  char v30 = v17;
                  unint64_t v31 = v29;
LABEL_160:
                  -[_PBProperty setNumberValue:onInstance:](v30, v31, (uint64_t)v2);
                  continue;
                }

                v84 = 0LL;
                v85 = *(char *)(v17 + 32);
                v86 = *(_BYTE *)(v17 + 32);
                if (v85 <= 98)
                {
                  if (v85 > 80)
                  {
                    if (v85 == 81)
                    {
                      v84 = -1LL;
                    }

                    else if (v85 == 83)
                    {
                      v84 = 0xFFFFLL;
                    }
                  }

                  else if (v85 == 66)
                  {
                    v84 = 1LL;
                  }

                  else if (v85 == 73)
                  {
                    v84 = 0xFFFFFFFFLL;
                  }
                }

                else
                {
                  switch(*(_BYTE *)(v17 + 32))
                  {
                    case 'c':
                      v84 = 127LL;
                      break;
                    case 'd':
                    case 'f':
                      v84 = 0LL;
                      break;
                    case 'e':
                    case 'g':
                    case 'h':
                      break;
                    case 'i':
                      v84 = 0x7FFFFFFFLL;
                      break;
                    default:
                      if (v85 == 115)
                      {
                        v84 = 0x7FFFLL;
                      }

                      else if (v85 == 113)
                      {
                        v84 = 0x7FFFFFFFFFFFFFFFLL;
                      }

                      break;
                  }
                }
              }

              else
              {
                v84 = 0LL;
                v86 = 0;
              }

              v99 = -[PBTextReader _parseNumber:maxValue:isSigned:]( v29,  v84,  ((v86 - 67) > 0x30) | ((0x1FFFFFFFEBFBEuLL >> (v86 - 67)) & 1));
              if (!v99) {
                continue;
              }
              unint64_t v31 = v99;
              char v30 = v17;
              goto LABEL_160;
            }

            v126[0] = v68;
            if (v17) {
              goto LABEL_43;
            }
            continue;
          default:
            continue;
        }
      }

      if (![v15 length]) {
        goto LABEL_52;
      }
      size_t v16 = -[NSString camelCase](v15);
      size_t v17 = [v5 objectForKeyedSubscript:v16];
      if (v17) {
        goto LABEL_26;
      }
      unint64_t v18 = [v16 hasSuffix:@"s"]
          ? objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1)
          : [v16 stringByAppendingString:@"s"];
      size_t v17 = [v5 objectForKeyedSubscript:v18];
      if (v17) {
        goto LABEL_26;
      }
      unint64_t v15 = v115;
LABEL_52:
      unint64_t v32 = v3;
      v33 = *(void *)(v3 + 32);
      size_t v34 = *(void *)(v3 + 40);
      size_t v35 = *(void **)(v32 + 48);
      size_t v36 = 20LL;
      if (v33 > 20) {
        size_t v36 = v33;
      }
      else {
        v37 = v34 - v33;
      }
      v38 = objc_msgSend(v35, "substringWithRange:", v36 - 20, v37);
      size_t v39 = -[NSString camelCase](v15);
      NSLog( @"%@ (at %i/%i %@) tag: %@ / %@ for property: %@",  @"read unrecoginzed tag",  v33,  v34,  v38,  v15,  v39,  0LL);
      size_t v40 = a1;
      switch(v114)
      {
        case 1LL:
          size_t v41 = -[PBTextReader _readObject:](a1, 0LL);
          goto LABEL_62;
        case 2LL:
          return v2;
        case 3LL:
          size_t v41 = (uint64_t)-[PBTextReader _readString](a1);
          goto LABEL_62;
        case 4LL:
          size_t v41 = -[PBTextReader _readValue](a1);
          goto LABEL_62;
        default:
          size_t v41 = 0LL;
          size_t v40 = a1;
LABEL_62:
          v42 = [NSString stringWithFormat:@"     value: %@", v41];
          v43 = *(void *)(v40 + 32);
          uint64_t v44 = *(void *)(a1 + 40);
          v45 = 20LL;
          if (v43 > 20) {
            v45 = *(void *)(v40 + 32);
          }
          else {
            v46 = v44 - v43;
          }
          v47 = objc_msgSend(*(id *)(a1 + 48), "substringWithRange:", v45 - 20, v46);
          v109 = -[NSString camelCase](v15);
          v103 = v44;
          unint64_t v3 = a1;
          NSLog(@"%@ (at %i/%i %@) tag: %@ / %@ for property: %@", v42, v43, v103, v47, v15, v109, 0LL);
          break;
      }
    }
  }

  unint64_t v4 = NSStringFromClass(a2);
  uint64_t v5 = (id)[*(id *)(v3 + 56) objectForKeyedSubscript:v4];
  if (v5)
  {
LABEL_17:
    unint64_t v2 = (objc_class *)objc_alloc_init(v2);
    goto LABEL_19;
  }

  uint64_t v6 = +[_PBProperty getValidPropertiesForType:withCache:]((uint64_t)&OBJC_CLASS____PBProperty, v2, *(void **)(v3 + 64));
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v5 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(v6, "count"));
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    v119 = 0u;
    size_t v8 = [v7 countByEnumeratingWithState:&v116 objects:v125 count:16];
    if (v8)
    {
      unint64_t v9 = v8;
      unint64_t v10 = *(void *)v117;
      do
      {
        BOOL v11 = 0LL;
        do
        {
          if (*(void *)v117 != v10) {
            objc_enumerationMutation(v7);
          }
          unint64_t v12 = *(void *)(*((void *)&v116 + 1) + 8 * v11);
          if (v12) {
            unint64_t v13 = *(void *)(v12 + 8);
          }
          else {
            unint64_t v13 = 0LL;
          }
          [v5 setObject:v12 forKeyedSubscript:v13];
          ++v11;
        }

        while (v9 != v11);
        uint64_t v14 = [v7 countByEnumeratingWithState:&v116 objects:v125 count:16];
        unint64_t v9 = v14;
      }

      while (v14);
    }

    unint64_t v3 = a1;
    [*(id *)(a1 + 56) setObject:v5 forKeyedSubscript:v4];
    goto LABEL_17;
  }

  return 0LL;
}

LABEL_11:
  if ([a1 isEqualToString:@"true"])
  {
    uint64_t v7 = (void *)MEMORY[0x189604A88];
    if (!a2) {
      return v7;
    }
    goto LABEL_27;
  }

  if ([a1 isEqualToString:@"false"])
  {
    uint64_t v7 = (void *)MEMORY[0x189604A80];
    if (!a2) {
      return v7;
    }
    goto LABEL_27;
  }

  if ([a1 rangeOfString:@"."] == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3)
    {
      if ([v6 scanLongLong:&v13])
      {
        BOOL v11 = [MEMORY[0x189607968] numberWithLongLong:*(void *)&v13];
LABEL_25:
        uint64_t v7 = (void *)v11;
LABEL_26:
        if (!a2) {
          return v7;
        }
        goto LABEL_27;
      }
    }

    else if ([v6 scanUnsignedLongLong:&v13])
    {
      BOOL v11 = [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)&v13];
      goto LABEL_25;
    }
  }

  else if ([v6 scanDouble:&v13])
  {
    BOOL v11 = [MEMORY[0x189607968] numberWithDouble:v13];
    goto LABEL_25;
  }

  uint64_t v7 = 0LL;
  if (!a2) {
    return v7;
  }
LABEL_27:
  if ([v7 unsignedLongLongValue] > a2) {
    return 0LL;
  }
  return v7;
}

    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v14 = v6;
    [v5 dataUsingEncoding:4];
    unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    _textFormatData(v15, v14, a3);

    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _textFormatData(v5, v6, a3);
    goto LABEL_24;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    size_t v8 = v5;
    unint64_t v9 = v6;
    if (*(uint64_t *)a3 >= 1)
    {
      size_t v16 = 0LL;
      do
      {
        [*(id *)(a3 + 8) appendString:@"  "];
        ++v16;
      }

      while (v16 < *(void *)a3);
    }

    [*(id *)(a3 + 8) appendString:v9];
    [*(id *)(a3 + 8) appendString:@": "];
    size_t v17 = *(void **)(a3 + 8);
    [v8 description];
    unint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 appendString:v18];

    [*(id *)(a3 + 8) appendString:@"\n"];
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _textFormatDictionary(v5, v6, a3);
  }

  else
  {
    uint64_t v19 = objc_opt_class();
    NSLog(@"Unhandled value type %@", v19);
  }

        [v4 addObject:v8];
      }

LABEL_4:
  size_t v8 = v5;
LABEL_7:

  return v8;
}

void sub_183BC8D1C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
}

void _textFormatDictionary(void *a1, void *a2, uint64_t a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  if (v6)
  {
    if (*(uint64_t *)a3 >= 1)
    {
      uint64_t v7 = 0LL;
      do
      {
        [*(id *)(a3 + 8) appendString:@"  "];
        ++v7;
      }

      while (v7 < *(void *)a3);
    }

    [*(id *)(a3 + 8) appendString:v6];
    [*(id *)(a3 + 8) appendString:@" {\n"];
    ++*(void *)a3;
  }

  [v5 allKeys];
  size_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 sortedArrayUsingSelector:sel_compare_];
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v10);
        }
        unint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v15, (void)v19);
        size_t v16 = (void *)objc_claimAutoreleasedReturnValue();
        _textFormat(v16, v15, a3);
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v12);
  }

  if (v6)
  {
    uint64_t v17 = (*(void *)a3)--;
    if (v17 >= 2)
    {
      uint64_t v18 = 0LL;
      do
      {
        objc_msgSend(*(id *)(a3 + 8), "appendString:", @"  ", (void)v19);
        ++v18;
      }

      while (v18 < *(void *)a3);
    }

    objc_msgSend(*(id *)(a3 + 8), "appendString:", @"}\n", (void)v19);
  }
}

void _textFormat(void *a1, void *a2, uint64_t a3)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v7 = [v6 description];

    id v6 = (id)v7;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    id v8 = v5;
    id v9 = v6;
    __int128 v20 = 0u;
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v23 = 0u;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        uint64_t v13 = 0LL;
        do
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          _textFormat(*(void *)(*((void *)&v20 + 1) + 8 * v13++), v9, a3);
        }

        while (v11 != v13);
        uint64_t v11 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }

      while (v11);
    }

LABEL_24:
}

void _textFormatData(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  if (*(uint64_t *)a3 >= 1)
  {
    uint64_t v7 = 0LL;
    do
    {
      [*(id *)(a3 + 8) appendString:@"  "];
      ++v7;
    }

    while (v7 < *(void *)a3);
  }

  [*(id *)(a3 + 8) appendString:v6];
  [*(id *)(a3 + 8) appendString:@": "];
  id v16 = v5;
  id v8 = (unsigned __int8 *)[v16 bytes];
  uint64_t v9 = [v16 length];
  if (v9)
  {
    for (uint64_t i = v9; i; --i)
    {
      int v12 = *v8++;
      uint64_t v11 = v12;
      if (v12 <= 33)
      {
        switch((int)v11)
        {
          case 0:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\0";
            goto LABEL_21;
          case 7:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\a";
            goto LABEL_21;
          case 8:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\b";
            goto LABEL_21;
          case 9:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\t";
            goto LABEL_21;
          case 10:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\n";
            goto LABEL_21;
          case 12:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\f";
            goto LABEL_21;
          case 13:
            uint64_t v13 = *(void **)(a3 + 8);
            id v14 = @"\\r";
            goto LABEL_21;
          default:
            goto LABEL_24;
        }
      }

      switch((_DWORD)v11)
      {
        case '""':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\";
          break;
        case '\'':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\'";
          break;
        case '\\':
          uint64_t v13 = *(void **)(a3 + 8);
          id v14 = @"\\\\"";
          break;
        default:
LABEL_24:
          unint64_t v15 = *(void **)(a3 + 8);
          else {
            objc_msgSend(v15, "appendFormat:", @"\\%03hho", v11);
          }
          continue;
      }

LABEL_21:
      [v13 appendString:v14];
    }
  }

  [*(id *)(a3 + 8) appendString:@"\n"];
}

uint64_t PB::Base::formattedText@<X0>(PB::Base *this@<X0>, std::stringbuf::string_type *a2@<X8>)
{
  char v10 = 0;
  LOBYTE(__p) = 0;
  (*(void (**)(PB::Base *, void *, void))(*(void *)this + 32LL))(this, v6, 0LL);
  std::stringbuf::str(a2, &v7);
  if (v10 < 0) {
    operator delete(__p);
  }
  v6[0] = *MEMORY[0x189614728];
  uint64_t v4 = *(void *)(MEMORY[0x189614728] + 72LL);
  *(void *)((char *)v6 + *(void *)(v6[0] - 24LL)) = *(void *)(MEMORY[0x189614728] + 64LL);
  v6[2] = v4;
  v7.__vftable = (std::stringbuf_vtbl *)(MEMORY[0x189614750] + 16LL);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x186E22CE4](&v8);
}

void sub_183BC9554( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
}

void PB::TextFormatter::~TextFormatter(void **this)
{
  uint64_t v2 = MEMORY[0x189614728];
  uint64_t v3 = *MEMORY[0x189614728];
  *this = (void *)*MEMORY[0x189614728];
  uint64_t v4 = *(void **)(v2 + 72);
  *(void **)((char *)this + *(void *)(v3 - 24)) = *(void **)(v2 + 64);
  this[3] = (void *)(MEMORY[0x189614750] + 16LL);
  this[2] = v4;
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x186E22CE4](this + 16);
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::basic_stringstream[abi:ne180100]( uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614758];
  uint64_t v3 = MEMORY[0x189614758] + 104LL;
  *(void *)(a1 + 128) = MEMORY[0x189614758] + 104LL;
  *(void *)(a1 + 16) = v2 + 64;
  uint64_t v4 = a1 + 16;
  id v5 = (void *)MEMORY[0x189614728];
  uint64_t v6 = *(void *)(MEMORY[0x189614728] + 16LL);
  uint64_t v7 = *(void *)(MEMORY[0x189614728] + 24LL);
  *(void *)a1 = v6;
  *(void *)(a1 + *(void *)(v6 - 24)) = v7;
  *(void *)(a1 + 8) = 0LL;
  uint64_t v8 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0LL;
  v8[1].__fmtflags_ = -1;
  uint64_t v9 = v5[4];
  uint64_t v10 = v5[5];
  *(void *)(a1 + 16) = v9;
  *(void *)(v4 + *(void *)(v9 - 24)) = v10;
  uint64_t v11 = v5[1];
  *(void *)a1 = v11;
  *(void *)(a1 + *(void *)(v11 - 24)) = v5[6];
  *(void *)a1 = v2 + 24;
  *(void *)(a1 + 128) = v3;
  *(void *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(void *)(a1 + 24) = MEMORY[0x189614750] + 16LL;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_183BC9704(_Unwind_Exception *a1)
{
}

uint64_t std::basic_stringstream<char,std::char_traits<char>,std::allocator<char>>::~basic_stringstream( uint64_t a1)
{
  uint64_t v2 = MEMORY[0x189614728];
  uint64_t v3 = *MEMORY[0x189614728];
  *(void *)a1 = *MEMORY[0x189614728];
  uint64_t v4 = *(void *)(v2 + 72);
  *(void *)(a1 + *(void *)(v3 - 24)) = *(void *)(v2 + 64);
  *(void *)(a1 + 24) = MEMORY[0x189614750] + 16LL;
  *(void *)(a1 + 16) = v4;
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x186E22CE4](a1 + 128);
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_189D32088, MEMORY[0x1896141F8]);
}

void sub_183BC9804(_Unwind_Exception *a1)
{
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x189614778] + 16LL);
  return result;
}

PB::Data *PB::Data::Data(PB::Data *this, const unsigned __int8 *a2, uint64_t a3)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  PB::Data::assign(this, a2, &a2[a3]);
  return this;
}

{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  PB::Data::assign(this, a2, &a2[a3]);
  return this;
}

void PB::Data::assign(PB::Data *this, const unsigned __int8 *__src, const unsigned __int8 *a3)
{
  size_t v3 = a3 - __src;
  if (a3 >= __src)
  {
    uint64_t v6 = *(void **)this;
    if (*((void *)this + 1) >= v3)
    {
LABEL_5:
      *((void *)this + 1) = v3;
      memcpy(v6, __src, v3);
      return;
    }

    uint64_t v6 = realloc(v6, a3 - __src);
    if (v6)
    {
      *(void *)this = v6;
      goto LABEL_5;
    }

    free(*(void **)this);
    *(void *)this = 0LL;
    *((void *)this + 1) = 0LL;
  }

PB::Data *PB::Data::Data(PB::Data *this, const PB::Data *a2)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  uint64_t v3 = *((void *)a2 + 1);
  if (v3) {
    PB::Data::assign(this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(void *)a2 + v3));
  }
  return this;
}

{
  uint64_t v3;
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  uint64_t v3 = *((void *)a2 + 1);
  if (v3) {
    PB::Data::assign(this, *(const unsigned __int8 **)a2, (const unsigned __int8 *)(*(void *)a2 + v3));
  }
  return this;
}

void PB::Data::clear(void **this)
{
  *this = 0LL;
  this[1] = 0LL;
}

BOOL PB::Data::operator==(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

void *PBRepeatedDoubleAdd(void *result, double a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 16 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          *(double *)&result[v7] = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(double *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x40uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *(double *)&result[v6] = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedDoubleClear(uint64_t a1)
{
  size_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedDoubleNSArray(void *a1)
{
  size_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithDouble:*(double *)(*a1 + 8 * v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedDoubleSet(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 8 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedDoubleIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedDoubleHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void PBRepeatedDoubleCopy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedFloatAdd(void *result, float a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 8 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          *((float *)result + v7) = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(float *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x20uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((float *)result + v6) = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedFloatClear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedFloatNSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v4 = 0LL;
    do
    {
      LODWORD(v3) = *(_DWORD *)(*a1 + 4 * v4);
      [MEMORY[0x189607968] numberWithFloat:v3];
      uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v5];

      ++v4;
    }

    while (v4 < a1[1]);
  }

  return v2;
}

void PBRepeatedFloatSet(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 4 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedFloatIsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedFloatHash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedFloatCopy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedInt32Add(void *result, int a2)
{
  double v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 8 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x20uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedInt32Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedInt32NSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(*a1 + 4 * v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 4 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedInt32Copy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedInt64Add(void *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 16 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          result[v7] = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(void *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x40uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedInt64Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedInt64NSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithLongLong:*(void *)(*a1 + 8 * v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 8 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void PBRepeatedInt64Copy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedUInt32Add(void *result, int a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 8 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          *((_DWORD *)result + v7) = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(_DWORD *)(*result + 4 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x20uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((_DWORD *)result + v6) = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedUInt32Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedUInt32NSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedInt:*(unsigned int *)(*a1 + 4 * v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedUInt32Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 4 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 4 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 4 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedUInt32IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 4 * v2) == 0;
}

uint64_t PBRepeatedUInt32Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 4 * a1[1]);
}

void PBRepeatedUInt32Copy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedUInt64Add(void *result, uint64_t a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t result = realloc((void *)*result, 16 * v4);
        if (result)
        {
          uint64_t v7 = v3[1];
          result[v7] = a2;
          void *v3 = result;
          v3[1] = v7 + 1;
          v3[2] = 2 * v4;
        }
      }
    }

    else
    {
      *(void *)(*result + 8 * v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(0x40uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      result[v6] = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedUInt64Clear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedUInt64NSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithUnsignedLongLong:*(void *)(*a1 + 8 * v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedUInt64Set(uint64_t a1, void *__src, unint64_t a3)
{
  if (a3)
  {
    unint64_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= a3) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      unint64_t v8 = 8LL;
    }
    else {
      unint64_t v8 = v7;
    }
    if (v8 >= a3 && 8 * v8 >= v8)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, 8 * v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, 8 * a3);
      *(void *)(a1 + 8) = a3;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedUInt64IsEqual(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, 8 * v2) == 0;
}

uint64_t PBRepeatedUInt64Hash(uint64_t *a1)
{
  return PBHashBytes(*a1, 8 * a1[1]);
}

void PBRepeatedUInt64Copy(uint64_t a1, uint64_t a2)
{
}

void *PBRepeatedBOOLAdd(void *result, char a2)
{
  unint64_t v3 = result;
  uint64_t v4 = result[2];
  if (v4)
  {
    uint64_t v5 = result[1];
    if (v5 + 1 >= (unint64_t)v4)
    {
      if (v4 >= 1)
      {
        uint64_t v7 = 2 * v4;
        uint64_t result = realloc((void *)*result, 2 * v4);
        if (result)
        {
          uint64_t v8 = v3[1];
          *((_BYTE *)result + v8) = a2;
          void *v3 = result;
          v3[1] = v8 + 1;
          v3[2] = v7;
        }
      }
    }

    else
    {
      *(_BYTE *)(*result + v5) = a2;
      result[1] = v5 + 1;
    }
  }

  else
  {
    result[2] = 8LL;
    uint64_t result = malloc(8uLL);
    void *v3 = result;
    if (result)
    {
      uint64_t v6 = v3[1];
      *((_BYTE *)result + v6) = a2;
      v3[1] = v6 + 1;
    }

    else
    {
      v3[2] = 0LL;
    }
  }

  return result;
}

void PBRepeatedBOOLClear(uint64_t a1)
{
  uint64_t v2 = *(void **)a1;
  if (v2)
  {
    free(v2);
    *(void *)a1 = 0LL;
    *(void *)(a1 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
  }

id PBRepeatedBOOLNSArray(void *a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[1])
  {
    unint64_t v3 = 0LL;
    do
    {
      [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(*a1 + v3)];
      uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
      [v2 addObject:v4];

      ++v3;
    }

    while (v3 < a1[1]);
  }

  return v2;
}

void PBRepeatedBOOLSet(uint64_t a1, void *__src, size_t __n)
{
  if (__n)
  {
    size_t v6 = 1LL;
    while (1)
    {
      unint64_t v7 = v6;
      if (v6 >= __n) {
        break;
      }
      v6 *= 2LL;
      if ((v7 & 0x8000000000000000LL) != 0)
      {
        unint64_t v7 = -1LL;
        break;
      }
    }

    if (v7 <= 8) {
      size_t v8 = 8LL;
    }
    else {
      size_t v8 = v7;
    }
    if (v8 >= __n)
    {
      uint64_t v9 = *(void *)(a1 + 16);
      uint64_t v10 = *(void **)a1;
      if (v8 != v9)
      {
        uint64_t v10 = realloc(v10, v8);
        if (!v10) {
          return;
        }
        *(void *)a1 = v10;
        *(void *)(a1 + 16) = v8;
      }

      memcpy(v10, __src, __n);
      *(void *)(a1 + 8) = __n;
    }
  }

  else
  {
    uint64_t v11 = *(void **)a1;
    if (*(void *)a1)
    {
      free(v11);
      *(void *)a1 = 0LL;
      *(void *)(a1 + 8) = 0LL;
      *(void *)(a1 + 16) = 0LL;
    }
  }

BOOL PBRepeatedBOOLIsEqual(uint64_t a1, uint64_t a2)
{
  size_t v2 = *(void *)(a1 + 8);
  return v2 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v2) == 0;
}

uint64_t PBRepeatedBOOLHash(uint64_t *a1)
{
  return PBHashBytes(*a1, a1[1]);
}

void PBRepeatedBOOLCopy(uint64_t a1, uint64_t a2)
{
}

LABEL_12:
      if (++v5 >= [a2 length]) {
        goto LABEL_43;
      }
    }

    if ((int)v7 > 72)
    {
      if ((int)v7 > 80)
      {
        if ((_DWORD)v7 != 81 && (_DWORD)v7 != 83) {
          goto LABEL_29;
        }
      }

      else if ((_DWORD)v7 != 73 && (_DWORD)v7 != 76)
      {
        goto LABEL_29;
      }
    }

    else if ((v7 - 66) >= 2)
    {
      if ((_DWORD)v7 == 61 || (_DWORD)v7 == 63) {
        goto LABEL_12;
      }
LABEL_29:
      NSLog(&v6->isa, v7, a2);
      goto LABEL_12;
    }

    goto LABEL_11;
  }

  unint64_t v27 = 0LL;
LABEL_43:
  if (![v4 count]) {
    return 0LL;
  }
  uint64_t v17 = (id)objc_msgSend( objc_alloc(MEMORY[0x189607940]),  "initWithCapacity:",  objc_msgSend(a2, "length"));
  [v17 appendString:@"{?="];
  uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 98);
  unint64_t v29 = 0u;
  char v30 = 0u;
  unint64_t v31 = 0u;
  unint64_t v32 = 0u;
  uint64_t v19 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v19)
  {
    __int128 v20 = v19;
    __int128 v21 = *(void *)v30;
    do
    {
      for (j = 0LL; j != v20; ++j)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v4);
        }
        __int128 v23 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        if (([v23 isEqualToString:v18] & 1) == 0) {
          [v17 appendString:v23];
        }
      }

      __int128 v20 = [v4 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }

    while (v20);
  }

  if (v27) {
    objc_msgSend(v17, "appendFormat:", @"%c", 105);
  }
  [v17 appendString:@"}"];
  NSGetSizeAndAlignment((const char *)[v17 UTF8String], &sizep, 0);
  uint64_t v24 = [v4 copy];
  uint64_t v25 = sizep;
  *(void *)(a1 + 112) = v24;
  *(void *)(a1 + 120) = v25;
  if (*(_BYTE *)(a1 + 32) == 94) {
    [v17 insertString:@"^" atIndex:0];
  }
  return v17;
}

LABEL_44:
        id v16 = calloc(1uLL, 4uLL);
        *(_DWORD *)id v16 = v17;
        goto LABEL_51;
      }

      size_t v8 = *(void **)(a1 + 80);
      if (v8)
      {
LABEL_38:
        [v8 setArgument:&v18 atIndex:2];
        [*(id *)(a1 + 80) invokeWithTarget:a3];
        [*(id *)(a1 + 80) getReturnValue:&v17];
LABEL_50:
        id v16 = calloc(1uLL, 8uLL);
        *(void *)id v16 = v17;
        goto LABEL_51;
      }

      uint64_t v9 = [a2 unsignedLongValue];
LABEL_49:
      uint64_t v17 = v9;
      goto LABEL_50;
    }

    if ((char)v5 == 66)
    {
      size_t v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        unint64_t v7 = [a2 BOOLValue];
        goto LABEL_40;
      }
    }

    else
    {
      size_t v6 = *(void **)(a1 + 80);
      if (!v6)
      {
        unint64_t v7 = [a2 unsignedCharValue];
LABEL_40:
        LOBYTE(v17) = v7;
        goto LABEL_41;
      }
    }

LABEL_22:
    [v6 setArgument:&v18 atIndex:2];
    [*(id *)(a1 + 80) invokeWithTarget:a3];
    [*(id *)(a1 + 80) getReturnValue:&v17];
LABEL_41:
    id v16 = calloc(1uLL, 1uLL);
    *(_BYTE *)id v16 = v17;
LABEL_51:
    objc_msgSend(*(id *)(a1 + 40), "setArgument:atIndex:", v16, 2, v17, v18);
    [*(id *)(a1 + 40) invokeWithTarget:a3];
    free(v16);
  }

LABEL_49:
          if (v126)
          {
            v45 = 0LL;
            value = v113;
            v47 = v114;
            while (*v47->name != 71)
            {
              ++v45;
              ++v47;
              if (v126 == v45)
              {
                v45 = 0x7FFFFFFFFFFFFFFFLL;
                goto LABEL_56;
              }
            }

            value = v114[v45].value;
          }

          else
          {
            v45 = 0x7FFFFFFFFFFFFFFFLL;
            value = v113;
          }

    if (v28)
    {
      [v7 setObject:v28 forKey:v17];
    }

LABEL_56:
          v48 = (void *)[NSString stringWithUTF8String:value];
          if (!v29) {
            unint64_t v29 = v111;
          }
          v49 = sel_registerName((const char *)[v48 UTF8String]);
          if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v49))
          {
            if ([v29 length])
            {
              v50 = (void *)[NSString stringWithFormat:@"%@@:", v29];
              v51 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v50, "UTF8String"));
            }

            else
            {
              v51 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v49);
            }

            v52 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v51];
            [v52 setSelector:v49];
          }

          else
          {
            v52 = 0LL;
          }

          v20[6] = v52;
          v53 = v126;
          v54 = v114;
          if (v126)
          {
            while (*v54->name != 83)
            {
              ++v54;
              if (!--v53) {
                goto LABEL_67;
              }
            }

            v56 = sel_registerName((const char *)objc_msgSend( (id)objc_msgSend( NSString,  "stringWithUTF8String:",  v114[v45].value),  "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v56))
            {
              if ([v111 length])
              {
                v57 = (void *)[NSString stringWithFormat:@"v@:%@", v111];
                v58 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v57, "UTF8String"));
              }

              else
              {
                v58 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v56);
              }

              v68 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v58];
              [v68 setSelector:v56];
            }

            else
            {
              v68 = 0LL;
            }

            v20[5] = v68;
LABEL_92:
            v69 = sel_registerName((const char *)objc_msgSend( (id)objc_msgSend(v20[1], "stringByAppendingString:", @"Count"),  "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v69))
            {
              int v12 = v109;
              unint64_t v15 = 0x18C662000LL;
              id v16 = &selRef_delegate;
              if ([0 length])
              {
                v70 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                v71 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v70, "UTF8String"));
              }

              else
              {
                v71 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v69);
              }

              v72 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v71];
              [v72 setSelector:v69];
            }

            else
            {
              v72 = 0LL;
              int v12 = v109;
              unint64_t v15 = 0x18C662000LL;
              id v16 = &selRef_delegate;
            }

            v20[8] = v72;
            v73 = sel_registerName((const char *)objc_msgSend( (id)objc_msgSend( NSString,  "stringWithFormat:",  @"%sAsString:",  v113),  "UTF8String"));
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v73))
            {
              if ([0 length])
              {
                v74 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                v75 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v74, "UTF8String"));
              }

              else
              {
                v75 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v73);
              }

              v76 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v75];
              [v76 setSelector:v73];
            }

            else
            {
              v76 = 0LL;
            }

            v20[9] = v76;
            v77 = sel_registerName((const char *)[(id)objc_msgSend( NSString stringWithFormat:@"StringAs%@:", v112), "UTF8String"]);
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v77))
            {
              if ([0 length])
              {
                v78 = (void *)[NSString stringWithFormat:@"%@@:", 0];
                v79 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v78, "UTF8String"));
              }

              else
              {
                v79 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v77);
              }

              v80 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v79];
              [v80 setSelector:v77];
            }

            else
            {
              v80 = 0LL;
            }

            v20[10] = v80;
LABEL_111:
            free(v114);
            goto LABEL_112;
          }

LABEL_67:
          v55 = *((unsigned __int8 *)v20 + 32);
          if (v55 == 64)
          {
            if (([v20[2] isSubclassOfClass:objc_opt_class()] & 1) == 0) {
              goto LABEL_75;
            }
LABEL_74:
            v59 = @"add";
          }

          else
          {
            if (v55 == 94)
            {
              unint64_t v29 = (void *)[v29 substringFromIndex:1];
              goto LABEL_74;
            }

LABEL_75:
            v59 = @"set";
          }

          v60 = 1;
          v61 = (void *)v112;
          while (1)
          {
            v62 = sel_registerName((const char *)[(id)objc_msgSend( NSString stringWithFormat:@"%@%@:", v59, v61), "UTF8String"]);
            if (-[objc_class instancesRespondToSelector:](a2, "instancesRespondToSelector:", v62))
            {
              if ([v29 length])
              {
                v63 = (void *)[NSString stringWithFormat:@"v@:%@", v29];
                v64 = objc_msgSend(MEMORY[0x189603FA0], "signatureWithObjCTypes:", objc_msgSend(v63, "UTF8String"));
              }

              else
              {
                v64 = -[objc_class instanceMethodSignatureForSelector:](a2, "instanceMethodSignatureForSelector:", v62);
              }

              v65 = (void *)[MEMORY[0x189603F88] invocationWithMethodSignature:v64];
              [v65 setSelector:v62];
            }

            else
            {
              v65 = 0LL;
            }

            v66 = v65;
            v20[5] = v66;
            if (v66 != 0LL || (v60 & 1) == 0) {
              break;
            }
            else {
              v67 = [v61 stringByAppendingString:@"s"];
            }
            v61 = (void *)v67;
            v60 = 0;
          }

          goto LABEL_92;
        }

LABEL_33:
        NSLog(@"ignoring property %s: %@", Name, v27);
LABEL_34:
        __int128 v20 = 0LL;
        id v16 = &selRef_delegate;
        goto LABEL_111;
      }

      if (v30 > 122)
      {
        if (v30 == 125) {
          goto LABEL_33;
        }
        if (v30 != 123) {
          goto LABEL_40;
        }
        size_t v34 = (uint64_t)v20;
        unint64_t v31 = v28;
        size_t v35 = v28;
      }

      else
      {
        if (v30 == 64)
        {
          v110 = v27;
          v37 = (void *)[v27 substringFromIndex:1];
          if ((unint64_t)[v37 length] >= 3
            && [v37 characterAtIndex:0] == 34)
          {
            v37 = (void *)objc_msgSend(v37, "substringWithRange:", 1, objc_msgSend(v37, "length") - 2);
          }

          if (([v37 hasPrefix:@"<"] & 1) == 0)
          {
            unint64_t v29 = 0LL;
            v20[2] = NSClassFromString((NSString *)v37);
            uint64_t v28 = v110;
            goto LABEL_40;
          }

          goto LABEL_34;
        }

        if (v30 != 94) {
          goto LABEL_40;
        }
        unint64_t v31 = v27;
        unint64_t v32 = [v27 characterAtIndex:1];
        *((_BYTE *)v20 + 33) = v32;
        v33 = (v32 - 66);
        id v16 = &selRef_delegate;
        if (((1LL << (v32 - 66)) & 0x849600008481LL) != 0)
        {
          unint64_t v29 = 0LL;
          uint64_t v28 = v31;
          goto LABEL_40;
        }

        if (v33 != 57)
        {
LABEL_118:
          NSLog(@"ignoring property %s: %@", Name, v31);
          __int128 v20 = 0LL;
          goto LABEL_111;
        }

        size_t v35 = (void *)[v31 substringFromIndex:1];
        size_t v34 = (uint64_t)v20;
      }

      size_t v36 = -[_PBProperty _parseStructDefinition:](v34, v35);
      uint64_t v28 = v31;
      unint64_t v29 = v36;
      goto LABEL_40;
    }

LABEL_119:
  free(v12);
  [obj sortUsingComparator:&__block_literal_global_345];
  v82 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FC8]),  "initWithCapacity:",  objc_msgSend(obj, "count"));
  v83 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(obj, "count"));
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v84 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
  if (!v84) {
    goto LABEL_140;
  }
  v85 = v84;
  v86 = *(void *)v121;
  do
  {
    v87 = 0LL;
    do
    {
      if (*(void *)v121 != v86) {
        objc_enumerationMutation(obj);
      }
      v88 = *(void *)(*((void *)&v120 + 1) + 8 * v87);
      if (v88) {
        v89 = *(void **)(v88 + 8);
      }
      else {
        v89 = 0LL;
      }
      v90 = (void *)[v89 lowercaseString];
      if ([v90 hasPrefix:@"has"])
      {
        v91 = [v90 substringFromIndex:3];
        v92 = [v82 objectForKeyedSubscript:v91];
        if (v92)
        {
          v93 = v92;
          *(void *)(v92 + 56) = *(id *)(v88 + 48);
          [v83 addObject:v93];
          v94 = v82;
          v95 = (void *)v91;
LABEL_133:
          [v94 removeObjectForKey:v95];
          goto LABEL_135;
        }
      }

      else
      {
        if (v88) {
          v96 = *(void **)(v88 + 16);
        }
        else {
          v96 = 0LL;
        }
        if ([v96 isSubclassOfClass:objc_opt_class()])
        {
          [v83 addObject:v88];
          v94 = v82;
          v95 = v90;
          goto LABEL_133;
        }
      }

      [v82 setObject:v88 forKeyedSubscript:v90];
LABEL_135:
      ++v87;
    }

    while (v85 != v87);
    v97 = [obj countByEnumeratingWithState:&v120 objects:v129 count:16];
    v85 = v97;
  }

  while (v97);
LABEL_140:
  objc_msgSend(v83, "addObjectsFromArray:", objc_msgSend(v82, "allValues"));
  size_t v6 = (id)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithCapacity:",  objc_msgSend(v83, "count"));
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v98 = [v83 countByEnumeratingWithState:&v116 objects:v128 count:16];
  if (v98)
  {
    v99 = v98;
    v100 = *(void *)v117;
    do
    {
      v101 = 0LL;
      do
      {
        if (*(void *)v117 != v100) {
          objc_enumerationMutation(v83);
        }
        v102 = *(void **)(*((void *)&v116 + 1) + 8 * v101);
        if (v102) {
          v103 = v102[1];
        }
        else {
          v103 = 0LL;
        }
        ++v101;
      }

      while (v99 != v101);
      v104 = [v83 countByEnumeratingWithState:&v116 objects:v128 count:16];
      v99 = v104;
    }

    while (v104);
  }

  [v108 setObject:v6 forKeyedSubscript:v107];
  return v6;
}

uint64_t PB::Reader::Reader(uint64_t this, const unsigned __int8 *a2, uint64_t a3)
{
  *(void *)this = a2;
  *(void *)(this + 8) = 0LL;
  *(void *)(this + 16) = a3;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

{
  *(void *)this = a2;
  *(void *)(this + 8) = 0LL;
  *(void *)(this + 16) = a3;
  *(_BYTE *)(this + 24) = 0;
  return this;
}

uint64_t PB::Reader::placeMark(uint64_t *a1, unint64_t *a2)
{
  unint64_t v2 = a1[1];
  if (v2 < 0xFFFFFFFFFFFFFFF6LL && v2 + 10 <= a1[2])
  {
    char v9 = 0;
    unsigned int v10 = 0;
    uint64_t v5 = 0LL;
    uint64_t v11 = *a1;
    while (1)
    {
      unint64_t v6 = v2 + 1;
      a1[1] = v2 + 1;
      char v12 = *(_BYTE *)(v11 + v2);
      v5 |= (unint64_t)(v12 & 0x7F) << v9;
      if ((v12 & 0x80) == 0) {
        break;
      }
      v9 += 7;
      unint64_t v2 = v6;
      BOOL v8 = v10++ > 8;
      if (v8)
      {
LABEL_14:
        uint64_t v5 = 0LL;
        break;
      }
    }
  }

  else
  {
    char v3 = 0;
    unsigned int v4 = 0;
    uint64_t v5 = 0LL;
    while (1)
    {
      unint64_t v6 = v2 + 1;
      if (v2 == -1LL)
      {
        unint64_t v2 = -1LL;
LABEL_16:
        uint64_t v5 = 0LL;
        *((_BYTE *)a1 + 24) = 1;
        unint64_t v6 = v2;
        goto LABEL_19;
      }

      if (v6 > a1[2]) {
        goto LABEL_16;
      }
      char v7 = *(_BYTE *)(*a1 + v2);
      a1[1] = v6;
      v5 |= (unint64_t)(v7 & 0x7F) << v3;
      if ((v7 & 0x80) == 0) {
        break;
      }
      v3 += 7;
      unint64_t v2 = v6;
      BOOL v8 = v4++ > 8;
      if (v8) {
        goto LABEL_14;
      }
    }

    if (*((_BYTE *)a1 + 24)) {
      uint64_t v5 = 0LL;
    }
  }

LABEL_19:
  if (*((_BYTE *)a1 + 24)) {
    return 0LL;
  }
  unint64_t v14 = v6 + v5;
  if (__CFADD__(v6, v5) || (unint64_t v15 = a1[2], v14 > v15))
  {
    uint64_t v13 = 0LL;
    *((_BYTE *)a1 + 24) = 1;
  }

  else
  {
    *a2 = v14;
    a2[1] = v15;
    uint64_t v13 = 1LL;
    a1[2] = v14;
  }

  return v13;
}

__n128 PB::Reader::recallMark(uint64_t a1, __n128 *a2)
{
  __n128 result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  return result;
}

std::string *PB::Reader::read(std::string *result, std::string *this)
{
  unint64_t v2 = result;
  if ((char)this->__r_.__value_.__s.__size_ < 0)
  {
    *this->__r_.__value_.__l.__data_ = 0;
    this->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    this->__r_.__value_.__s.__data_[0] = 0;
    this->__r_.__value_.__s.__size_ = 0;
  }

  unint64_t size = result->__r_.__value_.__l.__size_;
  if (size < 0xFFFFFFFFFFFFFFF6LL && size + 10 <= result->__r_.__value_.__l.__cap_)
  {
    char v10 = 0;
    unsigned int v11 = 0;
    std::string::size_type v12 = 0LL;
    std::string::size_type v13 = result->__r_.__value_.__r.__words[0];
    while (1)
    {
      std::string::size_type v7 = size + 1;
      result->__r_.__value_.__l.__size_ = size + 1;
      char v14 = *(_BYTE *)(v13 + size);
      v12 |= (unint64_t)(v14 & 0x7F) << v10;
      if ((v14 & 0x80) == 0) {
        break;
      }
      v10 += 7;
      unint64_t size = v7;
      BOOL v9 = v11++ > 8;
      if (v9)
      {
LABEL_17:
        std::string::size_type v12 = 0LL;
        break;
      }
    }
  }

  else
  {
    char v4 = 0;
    unsigned int v5 = 0;
    std::string::size_type v6 = 0LL;
    while (1)
    {
      std::string::size_type v7 = size + 1;
      if (size == -1LL)
      {
        unint64_t size = -1LL;
LABEL_19:
        std::string::size_type v12 = 0LL;
        result[1].__r_.__value_.__s.__data_[0] = 1;
        std::string::size_type v7 = size;
        goto LABEL_23;
      }

      if (v7 > result->__r_.__value_.__l.__cap_) {
        goto LABEL_19;
      }
      char v8 = *(_BYTE *)(result->__r_.__value_.__r.__words[0] + size);
      result->__r_.__value_.__l.__size_ = v7;
      v6 |= (unint64_t)(v8 & 0x7F) << v4;
      if ((v8 & 0x80) == 0) {
        break;
      }
      v4 += 7;
      unint64_t size = v7;
      BOOL v9 = v5++ > 8;
      if (v9) {
        goto LABEL_17;
      }
    }

    if (result[1].__r_.__value_.__s.__data_[0]) {
      std::string::size_type v12 = 0LL;
    }
    else {
      std::string::size_type v12 = v6;
    }
  }

LABEL_23:
  if (!result[1].__r_.__value_.__s.__data_[0])
  {
    if (__CFADD__(v7, v12) || v7 + v12 > result->__r_.__value_.__l.__cap_)
    {
      result[1].__r_.__value_.__s.__data_[0] = 1;
    }

    else
    {
      __n128 result = std::string::insert( this,  0LL,  (const std::string::value_type *)(result->__r_.__value_.__r.__words[0] + v7),  v12);
      v2->__r_.__value_.__l.__size_ += v12;
    }
  }

  return result;
}

        unint64_t v27 = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedLongLong:v25];
        goto LABEL_48;
      case 2:
        unint64_t v27 = PBReaderReadData(v41);
        goto LABEL_48;
      case 3:
        uint64_t v28 = objc_alloc_init(MEMORY[0x189603FC8]);
        unint64_t v29 = v41;
        if (*((_BYTE *)v41 + 16)) {
          goto LABEL_49;
        }
        char v30 = 0;
        unint64_t v31 = 0;
        unint64_t v32 = 0LL;
        break;
      case 5:
        size_t v39 = v41[1];
        if (v39 <= 0xFFFFFFFFFFFFFFFBLL && v39 + 4 <= v41[5])
        {
          size_t v40 = *(unsigned int *)(v41[3] + v39);
          v41[1] = v39 + 4;
        }

        else
        {
          size_t v40 = 0LL;
          *((_BYTE *)v41 + 16) = 1;
        }

        unint64_t v27 = [objc_alloc(MEMORY[0x189607968]) initWithUnsignedLong:v40];
LABEL_48:
        uint64_t v28 = (id)v27;
        goto LABEL_49;
      default:
        goto LABEL_51;
    }

    while (1)
    {
      while (1)
      {
        v33 = v29[1];
        size_t v34 = v33 + 1;
        if (v33 != -1 && v34 <= v29[5]) {
          break;
        }
        size_t v35 = 0LL;
        size_t v36 = 0LL;
        *((_BYTE *)v29 + 16) = 1;
LABEL_30:
        _dictionaryRepresentation(v41, v35, v36, v28);
        unint64_t v29 = v41;
        char v30 = 0;
        unint64_t v31 = 0;
        unint64_t v32 = 0LL;
        if (*((_BYTE *)v41 + 16)) {
          goto LABEL_49;
        }
      }

      v37 = *(_BYTE *)(v29[3] + v33);
      v29[1] = v34;
      v32 |= (unint64_t)(v37 & 0x7F) << v30;
      if ((v37 & 0x80) == 0) {
        break;
      }
      v30 += 7;
      if (v31++ > 8)
      {
        size_t v35 = 0LL;
        size_t v36 = 0LL;
        goto LABEL_30;
      }
    }

    size_t v36 = v32 & 7;
    size_t v35 = v32 >> 3;
    if ((_DWORD)v36 != 4) {
      goto LABEL_30;
    }
    if ((_DWORD)a2 != (_DWORD)v35)
    {
      size_t v36 = 4LL;
      goto LABEL_30;
    }

void *PB::Reader::read(void *result, char **a2)
{
  char v3 = result;
  char v4 = *a2;
  a2[1] = *a2;
  unint64_t v5 = result[1];
  if (v5 < 0xFFFFFFFFFFFFFFF6LL && v5 + 10 <= result[2])
  {
    char v12 = 0;
    unsigned int v13 = 0;
    size_t v14 = 0LL;
    uint64_t v15 = *result;
    while (1)
    {
      unint64_t v9 = v5 + 1;
      result[1] = v5 + 1;
      char v16 = *(_BYTE *)(v15 + v5);
      v14 |= (unint64_t)(v16 & 0x7F) << v12;
      if ((v16 & 0x80) == 0) {
        break;
      }
      v12 += 7;
      unint64_t v5 = v9;
      BOOL v11 = v13++ > 8;
      if (v11)
      {
LABEL_14:
        size_t v14 = 0LL;
        break;
      }
    }
  }

  else
  {
    char v6 = 0;
    unsigned int v7 = 0;
    size_t v8 = 0LL;
    while (1)
    {
      unint64_t v9 = v5 + 1;
      if (v5 == -1LL)
      {
        unint64_t v5 = -1LL;
LABEL_16:
        size_t v14 = 0LL;
        *((_BYTE *)result + 24) = 1;
        unint64_t v9 = v5;
        goto LABEL_20;
      }

      if (v9 > result[2]) {
        goto LABEL_16;
      }
      char v10 = *(_BYTE *)(*result + v5);
      result[1] = v9;
      v8 |= (unint64_t)(v10 & 0x7F) << v6;
      if ((v10 & 0x80) == 0) {
        break;
      }
      v6 += 7;
      unint64_t v5 = v9;
      BOOL v11 = v7++ > 8;
      if (v11) {
        goto LABEL_14;
      }
    }

    if (*((_BYTE *)result + 24)) {
      size_t v14 = 0LL;
    }
    else {
      size_t v14 = v8;
    }
  }

LABEL_20:
  if (!*((_BYTE *)result + 24))
  {
    if (__CFADD__(v9, v14) || v9 + v14 > result[2])
    {
      *((_BYTE *)result + 24) = 1;
      return result;
    }

    uint64_t v17 = (const void *)(*result + v9);
    unint64_t v18 = (unint64_t)a2[2];
    if (v18 - (unint64_t)v4 >= v14)
    {
      if (!v14)
      {
LABEL_38:
        a2[1] = &v4[v14];
        v3[1] += v14;
        return result;
      }

      __int128 v21 = v4;
    }

    else
    {
      if (v4)
      {
        a2[1] = v4;
        operator delete(v4);
        unint64_t v18 = 0LL;
        *a2 = 0LL;
        a2[1] = 0LL;
        a2[2] = 0LL;
      }

      if ((v14 & 0x8000000000000000LL) != 0) {
        goto LABEL_40;
      }
      uint64_t v19 = 2 * v18;
      if (2 * v18 <= v14) {
        uint64_t v19 = v14;
      }
      size_t v20 = v18 >= 0x3FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v19;
      if ((v20 & 0x8000000000000000LL) != 0) {
LABEL_40:
      }
        std::vector<unsigned char>::__throw_length_error[abi:ne180100]();
      __int128 v21 = (char *)operator new(v20);
      char v4 = v21;
      *a2 = v21;
      a2[1] = v21;
      a2[2] = &v21[v20];
    }

    __n128 result = memmove(v21, v17, v14);
    goto LABEL_38;
  }

  return result;
}

  if (!*((_BYTE *)this + 24))
  {
    if (__CFADD__(v8, v13) || v8 + v13 > *((void *)this + 2))
    {
      *((_BYTE *)this + 24) = 1;
    }

    else
    {
      PB::Data::assign( (PB::Data *)a2,  (const unsigned __int8 *)(*(void *)this + v8),  (const unsigned __int8 *)(*(void *)this + v8 + v13));
      *((void *)this + 1) += v13;
    }
  }

void std::vector<unsigned char>::__throw_length_error[abi:ne180100]()
{
}

void PB::Reader::read(PB::Reader *this, void **a2)
{
  *a2 = 0LL;
  a2[1] = 0LL;
  unint64_t v4 = *((void *)this + 1);
  if (v4 < 0xFFFFFFFFFFFFFFF6LL && v4 + 10 <= *((void *)this + 2))
  {
    char v11 = 0;
    unsigned int v12 = 0;
    uint64_t v13 = 0LL;
    uint64_t v14 = *(void *)this;
    while (1)
    {
      unint64_t v8 = v4 + 1;
      *((void *)this + 1) = v4 + 1;
      char v15 = *(_BYTE *)(v14 + v4);
      v13 |= (unint64_t)(v15 & 0x7F) << v11;
      if ((v15 & 0x80) == 0) {
        break;
      }
      v11 += 7;
      unint64_t v4 = v8;
      BOOL v10 = v12++ > 8;
      if (v10)
      {
LABEL_14:
        uint64_t v13 = 0LL;
        break;
      }
    }
  }

  else
  {
    char v5 = 0;
    unsigned int v6 = 0;
    uint64_t v7 = 0LL;
    while (1)
    {
      unint64_t v8 = v4 + 1;
      if (v4 == -1LL)
      {
        unint64_t v4 = -1LL;
LABEL_16:
        uint64_t v13 = 0LL;
        *((_BYTE *)this + 24) = 1;
        unint64_t v8 = v4;
        goto LABEL_20;
      }

      if (v8 > *((void *)this + 2)) {
        goto LABEL_16;
      }
      char v9 = *(_BYTE *)(*(void *)this + v4);
      *((void *)this + 1) = v8;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        break;
      }
      v5 += 7;
      unint64_t v4 = v8;
      BOOL v10 = v6++ > 8;
      if (v10) {
        goto LABEL_14;
      }
    }

    if (*((_BYTE *)this + 24)) {
      uint64_t v13 = 0LL;
    }
    else {
      uint64_t v13 = v7;
    }
  }

uint64_t PB::Reader::skip(PB::Reader *this, int a2, int a3, int a4)
{
  uint64_t v4 = 0LL;
  switch(a3)
  {
    case 0:
      unint64_t v6 = *((void *)this + 1);
      if (v6 < 0xFFFFFFFFFFFFFFF6LL && v6 + 10 <= *((void *)this + 2))
      {
        unsigned int v36 = 0;
        uint64_t v37 = *(void *)this;
        uint64_t v4 = 1LL;
        do
        {
          *((void *)this + 1) = v6 + 1;
          ++v6;
          BOOL v10 = v36++ > 8;
        }

        while (!v10);
      }

      else
      {
        unsigned int v7 = 0;
        uint64_t v4 = 1LL;
        do
        {
          unint64_t v8 = v6 + 1;
          if (v6 == -1LL || v8 > *((void *)this + 2)) {
            goto LABEL_68;
          }
          int v9 = *(char *)(*(void *)this + v6);
          *((void *)this + 1) = v8;
          if ((v9 & 0x80000000) == 0) {
            break;
          }
          unint64_t v6 = v8;
          BOOL v10 = v7++ > 8;
        }

        while (!v10);
      }

      return v4;
    case 1:
      unint64_t v11 = *((void *)this + 1);
      if (v11 > 0xFFFFFFFFFFFFFFF7LL) {
        goto LABEL_68;
      }
      unint64_t v12 = v11 + 8;
      goto LABEL_67;
    case 2:
      unint64_t v13 = *((void *)this + 1);
      if (v13 < 0xFFFFFFFFFFFFFFF6LL && v13 + 10 <= *((void *)this + 2))
      {
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v16 = 0LL;
        uint64_t v40 = *(void *)this;
        do
        {
          unint64_t v17 = v13 + 1;
          *((void *)this + 1) = v13 + 1;
          char v41 = *(_BYTE *)(v40 + v13);
          v16 |= (unint64_t)(v41 & 0x7F) << v38;
          if ((v41 & 0x80) == 0) {
            goto LABEL_66;
          }
          v38 += 7;
          unint64_t v13 = v17;
          BOOL v10 = v39++ > 8;
        }

        while (!v10);
LABEL_61:
        uint64_t v16 = 0LL;
        goto LABEL_66;
      }

      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0LL;
      while (2)
      {
        unint64_t v17 = v13 + 1;
        if (v13 == -1LL)
        {
          unint64_t v13 = -1LL;
LABEL_63:
          uint64_t v16 = 0LL;
          *((_BYTE *)this + 24) = 1;
          unint64_t v17 = v13;
        }

        else
        {
          if (v17 > *((void *)this + 2)) {
            goto LABEL_63;
          }
          char v18 = *(_BYTE *)(*(void *)this + v13);
          *((void *)this + 1) = v17;
          v16 |= (unint64_t)(v18 & 0x7F) << v14;
          if (v18 < 0)
          {
            v14 += 7;
            unint64_t v13 = v17;
            BOOL v10 = v15++ > 8;
            if (v10) {
              goto LABEL_61;
            }
            continue;
          }

          if (*((_BYTE *)this + 24)) {
            uint64_t v16 = 0LL;
          }
        }

        break;
      }

LABEL_66:
      BOOL v42 = __CFADD__(v17, v16);
      unint64_t v12 = v17 + v16;
      if (v42) {
        goto LABEL_68;
      }
LABEL_67:
      if (v12 > *((void *)this + 2))
      {
LABEL_68:
        uint64_t v4 = 1LL;
        *((_BYTE *)this + 24) = 1;
        return v4;
      }

      *((void *)this + 1) = v12;
      return 1LL;
    case 3:
      uint64_t v4 = 1LL;
      if (!*((_BYTE *)this + 24)) {
        return v4;
      }
      int v21 = a4 + 1;
      break;
    case 5:
      unint64_t v35 = *((void *)this + 1);
      if (v35 > 0xFFFFFFFFFFFFFFFBLL) {
        goto LABEL_68;
      }
      unint64_t v12 = v35 + 4;
      goto LABEL_67;
    default:
      return v4;
  }

  while (1)
  {
    unint64_t v22 = *((void *)this + 1);
    if (v22 < 0xFFFFFFFFFFFFFFF6LL && v22 + 10 <= *((void *)this + 2)) {
      break;
    }
    unsigned int v23 = 0;
    while (1)
    {
      unint64_t v24 = v22 + 1;
      if (v22 == -1LL || v24 > *((void *)this + 2))
      {
        LODWORD(v25) = 0;
        unsigned __int8 v27 = 0;
        *((_BYTE *)this + 24) = 1;
        goto LABEL_34;
      }

      LODWORD(v25) = 0;
      int v26 = *(char *)(*(void *)this + v22);
      *((void *)this + 1) = v24;
      if ((v26 & 0x80000000) == 0) {
        break;
      }
      unint64_t v22 = v24;
      unsigned __int8 v27 = 0;
      BOOL v10 = v23++ > 8;
      if (v10) {
        goto LABEL_34;
      }
    }

    unsigned __int8 v27 = 0;
LABEL_34:
    if (a4 >= 64)
    {
      *((_BYTE *)this + 24) = 1;
      continue;
    }

    PB::Reader::skip(this, v25, v27, v21);
    if (!*((_BYTE *)this + 24)) {
      return 1LL;
    }
  }

  char v28 = 0;
  unsigned int v29 = 0;
  unint64_t v30 = 0LL;
  uint64_t v31 = *(void *)this;
  while (1)
  {
    unint64_t v32 = v22 + 1;
    *((void *)this + 1) = v22 + 1;
    char v33 = *(_BYTE *)(v31 + v22);
    v30 |= (unint64_t)(v33 & 0x7F) << v28;
    if ((v33 & 0x80) == 0) {
      break;
    }
    v28 += 7;
    unint64_t v22 = v32;
    BOOL v10 = v29++ > 8;
    if (v10)
    {
      LODWORD(v25) = 0;
      unsigned __int8 v27 = 0;
      goto LABEL_34;
    }
  }

  unsigned __int8 v27 = v30 & 7;
  unint64_t v25 = v30 >> 3;
  if ((v30 & 7) != 4 || (_DWORD)v25 != a2) {
    goto LABEL_34;
  }
  return 1LL;
}

uint64_t PBHashBytes(uint64_t a1, uint64_t a2)
{
  if ((int)a2 < 4)
  {
    unsigned int v2 = 0;
    LODWORD(v3) = a2;
  }

  else
  {
    unsigned int v2 = 0;
    uint64_t v3 = (int)a2;
    uint64_t v4 = (unsigned __int8 *)(a1 + 3);
    do
    {
      unsigned int v5 = *(v4 - 3) + 16 * v2;
      unsigned int v6 = *(v4 - 2) + 16 * (v5 ^ (16 * (v5 >> 28)));
      unsigned int v7 = *(v4 - 1) + 16 * (v6 ^ (16 * (v6 >> 28)));
      int v8 = *v4;
      v4 += 4;
      int v9 = v8 + 16 * (v7 ^ (16 * (v7 >> 28)));
      uint64_t v10 = v3;
      unsigned int v2 = (v9 ^ ((v9 & 0xF0000000) >> 24)) & ~(v9 & 0xF0000000);
      v3 -= 4LL;
    }

    while (v10 > 7);
  }

  switch((_DWORD)v3)
  {
    case 1:
      uint64_t v11 = a2 << 32;
LABEL_13:
      int v14 = *(unsigned __int8 *)(a1 + ((v11 - 0x100000000LL) >> 32)) + 16 * v2;
      return (v14 ^ ((v14 & 0xF0000000) >> 24)) & ~(v14 & 0xF0000000);
    case 3:
      uint64_t v11 = a2 << 32;
      int v12 = *(unsigned __int8 *)(a1 + (((a2 << 32) - 0x300000000LL) >> 32)) + 16 * v2;
      unsigned int v2 = (v12 ^ ((v12 & 0xF0000000) >> 24)) & ~(v12 & 0xF0000000);
      goto LABEL_12;
    case 2:
      uint64_t v11 = a2 << 32;
LABEL_12:
      int v13 = *(unsigned __int8 *)(a1 + ((v11 - 0x200000000LL) >> 32)) + 16 * v2;
      unsigned int v2 = (v13 ^ ((v13 & 0xF0000000) >> 24)) & ~(v13 & 0xF0000000);
      goto LABEL_13;
  }

  return v2;
}

std::string *PB::TextFormatter::indent(PB::TextFormatter *this)
{
  return std::string::append((std::string *)((char *)this + 280), "  ");
}

uint64_t PB::TextFormatter::dedent(PB::TextFormatter *this)
{
  if (*((char *)this + 303) < 0)
  {
    unint64_t v1 = *((void *)this + 36);
    if (v1 > 1) {
      goto LABEL_3;
    }
  }

  else
  {
    unint64_t v1 = *((unsigned __int8 *)this + 303);
    if (v1 >= 2)
    {
LABEL_3:
      unsigned int v2 = (std::string *)((char *)this + 280);
      uint64_t v3 = std::string::erase((std::string *)((char *)this + 280), v1 - 2, 0xFFFFFFFFFFFFFFFFLL);
      std::string::operator=(v2, v3);
      return 1LL;
    }
  }

  return 0LL;
}

std::string *PB::TextFormatter::beginObject(std::string *this, const char *a2)
{
  if (a2)
  {
    p_uint64_t cap = &this->__r_.__value_.__l.__cap_;
    uint64_t v4 = (std::string *)((char *)this + 280);
    int v5 = this[12].__r_.__value_.__s.__data_[15];
    if (v5 >= 0) {
      uint64_t cap = (uint64_t)&this[11].__r_.__value_.__l.__cap_;
    }
    else {
      uint64_t cap = this[11].__r_.__value_.__l.__cap_;
    }
    if (v5 >= 0) {
      uint64_t data = this[12].__r_.__value_.__s.__data_[15];
    }
    else {
      uint64_t data = (uint64_t)this[12].__r_.__value_.__l.__data_;
    }
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&this->__r_.__value_.__l.__cap_, cap, data);
    size_t v8 = strlen(a2);
    int v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(p_cap, (uint64_t)a2, v8);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)" {\n", 3LL);
    return std::string::append(v4, "  ");
  }

  return this;
}

void *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>( void *a1, uint64_t a2, uint64_t a3)
{
  if (v23[0])
  {
    unsigned int v6 = (char *)a1 + *(void *)(*a1 - 24LL);
    uint64_t v7 = *((void *)v6 + 5);
    int v8 = *((_DWORD *)v6 + 2);
    int v9 = *((_DWORD *)v6 + 36);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
      uint64_t v10 = std::locale::use_facet(&__b, MEMORY[0x189614558]);
      int v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32LL);
      std::locale::~locale(&__b);
      *((_DWORD *)v6 + 36) = v9;
    }

    uint64_t v11 = a2 + a3;
    if ((v8 & 0xB0) == 0x20) {
      uint64_t v12 = a2 + a3;
    }
    else {
      uint64_t v12 = a2;
    }
    if (!v7) {
      goto LABEL_29;
    }
    uint64_t v13 = *((void *)v6 + 3);
    BOOL v14 = v13 <= a3;
    uint64_t v15 = v13 - a3;
    size_t v16 = v14 ? 0LL : v15;
    if (v12 - a2 >= 1
      && (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96LL))(v7, a2, v12 - a2) != v12 - a2)
    {
      goto LABEL_29;
    }

    if ((uint64_t)v16 >= 1)
    {
      if (v16 >= 0x7FFFFFFFFFFFFFF8LL) {
        std::string::__throw_length_error[abi:ne180100]();
      }
      if (v16 >= 0x17)
      {
        uint64_t v18 = (v16 & 0xFFFFFFFFFFFFFFF8LL) + 8;
        if ((v16 | 7) != 0x17) {
          uint64_t v18 = v16 | 7;
        }
        uint64_t v19 = v18 + 1;
        p_b = (std::locale::__imp *)operator new(v18 + 1);
        size_t v25 = v16;
        int64_t v26 = v19 | 0x8000000000000000LL;
        __b.__locale_ = p_b;
      }

      else
      {
        HIBYTE(v26) = v16;
        p_b = (std::locale::__imp *)&__b;
      }

      memset(p_b, v9, v16);
      *((_BYTE *)p_b + v16) = 0;
      size_t v20 = v26 >= 0 ? &__b : (std::locale *)__b.__locale_;
      uint64_t v21 = (*(uint64_t (**)(uint64_t, std::locale *, size_t))(*(void *)v7 + 96LL))(v7, v20, v16);
      if (SHIBYTE(v26) < 0) {
        operator delete(__b.__locale_);
      }
      if (v21 != v16) {
        goto LABEL_29;
      }
    }

    if (v11 - v12 < 1
      || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v7 + 96LL))(v7, v12, v11 - v12) == v11 - v12)
    {
      *((void *)v6 + 3) = 0LL;
    }

    else
    {
LABEL_29:
      std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | 5);
    }
  }

  MEMORY[0x186E22C30](v23);
  return a1;
}

void sub_183BCDDBC( void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  MEMORY[0x186E22C30](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v17 + *(void *)(*v17 - 24LL)));
  __cxa_end_catch();
  JUMPOUT(0x183BCDD90LL);
}

void sub_183BCDE1C(_Unwind_Exception *a1)
{
}

void __clang_call_terminate(void *a1)
{
}

void *PB::TextFormatter::endObject(PB::TextFormatter *this)
{
  __n128 result = (void *)PB::TextFormatter::dedent(this);
  if ((_DWORD)result)
  {
    int v3 = *((char *)this + 303);
    if (v3 >= 0) {
      uint64_t v4 = (char *)this + 280;
    }
    else {
      uint64_t v4 = (char *)*((void *)this + 35);
    }
    if (v3 >= 0) {
      uint64_t v5 = *((unsigned __int8 *)this + 303);
    }
    else {
      uint64_t v5 = *((void *)this + 36);
    }
    unsigned int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v4, v5);
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"}\n", 2LL);
  }

  return result;
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2)
{
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2LL);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1LL);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2LL);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1LL);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2LL);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1LL);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2LL);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1LL);
}

{
  void *v3;
  int v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  void *v9;
  int v3 = (void *)((char *)this + 16);
  int v4 = *((char *)this + 303);
  if (v4 >= 0) {
    uint64_t v5 = (char *)this + 280;
  }
  else {
    uint64_t v5 = (char *)*((void *)this + 35);
  }
  if (v4 >= 0) {
    uint64_t v6 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v6 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v5, v6);
  size_t v7 = strlen(a2);
  int v8 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)a2, v7);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v8, (uint64_t)": ", 2LL);
  int v9 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)"\n", 1LL);
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, float a3)
{
  uint64_t v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    size_t v7 = (char *)this + 280;
  }
  else {
    size_t v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2LL);
  *(void *)((char *)v5 + *(void *)(*((void *)this + 2) - 24LL) + 16) = 6LL;
  uint64_t v11 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1LL);
}

void *PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, double a3)
{
  uint64_t v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    size_t v7 = (char *)this + 280;
  }
  else {
    size_t v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2LL);
  *(void *)((char *)v5 + *(void *)(*((void *)this + 2) - 24LL) + 16) = 15LL;
  uint64_t v11 = (void *)std::ostream::operator<<();
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, (uint64_t)"\n", 1LL);
}

void PB::TextFormatter::format(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v5 = (void *)(a1 + 16);
  int v6 = *(char *)(a1 + 303);
  if (v6 >= 0) {
    uint64_t v7 = a1 + 280;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 280);
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 303);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 16), v7, v8);
  size_t v9 = strlen(a2);
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2LL);
  int v11 = *(char *)(a3 + 23);
  if (v11 >= 0) {
    uint64_t v12 = (const unsigned __int8 *)a3;
  }
  else {
    uint64_t v12 = *(const unsigned __int8 **)a3;
  }
  if (v11 >= 0) {
    uint64_t v13 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    uint64_t v13 = *(void *)(a3 + 8);
  }
  PB::_formatBytes(&__p, v12, v13);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t size = __p.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t size = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)p_p, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1LL);
}

{
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  std::stringbuf::string_type *p_p;
  uint64_t size;
  std::stringbuf::string_type __p;
  uint64_t v5 = (void *)(a1 + 16);
  int v6 = *(char *)(a1 + 303);
  if (v6 >= 0) {
    uint64_t v7 = a1 + 280;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 280);
  }
  if (v6 >= 0) {
    uint64_t v8 = *(unsigned __int8 *)(a1 + 303);
  }
  else {
    uint64_t v8 = *(void *)(a1 + 288);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)(a1 + 16), v7, v8);
  size_t v9 = strlen(a2);
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2LL);
  PB::_formatBytes(&__p, *(const unsigned __int8 **)a3, *(void *)(a3 + 8) - *(void *)a3);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t size = __p.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t size = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)p_p, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1LL);
}

void sub_183BCE39C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t PB::_formatBytes(std::stringbuf::string_type *this, const unsigned __int8 *a2, uint64_t a3)
{
  v16[0] = 34;
  int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(&v13, (uint64_t)v16, 1LL);
  while (a3)
  {
    int v8 = *a2++;
    int v7 = v8;
    if (v8 <= 33)
    {
      size_t v9 = "\\a";
      switch(v7)
      {
        case 0:
          size_t v9 = "\\0";
          goto LABEL_16;
        case 7:
          goto LABEL_16;
        case 8:
          size_t v9 = "\\b";
          goto LABEL_16;
        case 9:
          size_t v9 = "\\t";
          goto LABEL_16;
        case 10:
          size_t v9 = "\\n";
          goto LABEL_16;
        case 12:
          size_t v9 = "\\f";
          goto LABEL_16;
        case 13:
          size_t v9 = "\\r";
          goto LABEL_16;
        default:
          goto LABEL_19;
      }
    }

    switch(v7)
    {
      case '""':
        size_t v9 = "\\";
        break;
      case '\'':
        size_t v9 = "\\'";
        break;
      case '\\':
        size_t v9 = "\\\\"";
        break;
      default:
LABEL_19:
        if ((v7 - 32) < 0x3C || (v7 - 93) <= 0x20)
        {
          v16[0] = v7;
          int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)v16, 1LL);
        }

        else
        {
          *(_DWORD *)((char *)&v14.__vftable + *(void *)(v13 - 24)) = *(_DWORD *)((_BYTE *)&v14.__vftable
                                                                                  + *(void *)(v13 - 24)) & 0xFFFFFFB5 | 0x40;
          v16[0] = v7;
          int v6 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)v16, 1LL);
          *(_DWORD *)((char *)&v14.__vftable + *(void *)(v13 - 24)) = *(_DWORD *)((_BYTE *)&v14.__vftable
                                                                                  + *(void *)(v13 - 24)) & 0xFFFFFFB5 | 2;
        }

        goto LABEL_17;
    }

void sub_183BCE600(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_183BCE6F0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void PB::TextFormatter::format(PB::TextFormatter *this, const char *a2, const PB::Data *a3)
{
  uint64_t v5 = (void *)((char *)this + 16);
  int v6 = *((char *)this + 303);
  if (v6 >= 0) {
    int v7 = (char *)this + 280;
  }
  else {
    int v7 = (char *)*((void *)this + 35);
  }
  if (v6 >= 0) {
    uint64_t v8 = *((unsigned __int8 *)this + 303);
  }
  else {
    uint64_t v8 = *((void *)this + 36);
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>((void *)this + 2, (uint64_t)v7, v8);
  size_t v9 = strlen(a2);
  uint64_t v10 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)a2, v9);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v10, (uint64_t)": ", 2LL);
  PB::_formatBytes(&__p, *(const unsigned __int8 **)a3, *((void *)a3 + 1));
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::stringbuf::string_type *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    uint64_t size = __p.__r_.__value_.__s.__size_;
  }
  else {
    uint64_t size = __p.__r_.__value_.__l.__size_;
  }
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)p_p, size);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v5, (uint64_t)"\n", 1LL);
}

void sub_183BCE7E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void _dictionaryRepresentation(void *a1, unint64_t a2, int a3, void *a4)
{
  char v41 = a1;
  id v7 = a4;
  uint64_t v8 = v41;
  unint64_t v9 = v41[1];
  unint64_t v10 = v41[5];
  if (v9 >= v10) {
    goto LABEL_52;
  }
  do
  {
    if (*((_BYTE *)v8 + 16)) {
      break;
    }
    if (a3 == 6)
    {
      char v11 = 0;
      unsigned int v12 = 0;
      unint64_t v13 = 0LL;
      while (v9 < v10)
      {
        unint64_t v14 = v9 + 1;
        char v15 = *(_BYTE *)(v8[3] + v9);
        v8[1] = v14;
        v13 |= (unint64_t)(v15 & 0x7F) << v11;
        if ((v15 & 0x80) == 0) {
          goto LABEL_11;
        }
        v11 += 7;
        unint64_t v9 = v14;
        BOOL v16 = v12++ >= 9;
        if (v16)
        {
          unint64_t v13 = 0LL;
          goto LABEL_11;
        }
      }

      unint64_t v13 = 0LL;
      *((_BYTE *)v8 + 16) = 1;
LABEL_11:
      a3 = v13 & 7;
      a2 = v13 >> 3;
    }

    unint64_t v17 = (void *)[objc_alloc(MEMORY[0x189607968]) initWithUnsignedInt:a2];
    switch(a3)
    {
      case 0:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0LL;
        uint64_t v21 = v41;
        unint64_t v22 = v41[1];
        while (1)
        {
          unint64_t v23 = v22 + 1;
          if (v22 == -1LL || v23 > v41[5]) {
            goto LABEL_22;
          }
          char v24 = *(_BYTE *)(v41[3] + v22);
          v41[1] = v23;
          v20 |= (unint64_t)(v24 & 0x7F) << v18;
          if ((v24 & 0x80) == 0)
          {
            if (*((_BYTE *)v41 + 16)) {
              uint64_t v25 = 0LL;
            }
            else {
              uint64_t v25 = v20;
            }
            goto LABEL_23;
          }

          v18 += 7;
          unint64_t v22 = v23;
          BOOL v16 = v19++ >= 9;
          if (v16)
          {
            uint64_t v25 = 0LL;
            goto LABEL_23;
          }
        }

      case 1:
        uint64_t v21 = v41;
        unint64_t v26 = v41[1];
        if (v26 <= 0xFFFFFFFFFFFFFFF7LL && v26 + 8 <= v41[5])
        {
          uint64_t v25 = *(void *)(v41[3] + v26);
          v41[1] = v26 + 8;
        }

        else
        {
LABEL_22:
          uint64_t v25 = 0LL;
          *((_BYTE *)v21 + 16) = 1;
        }

LABEL_51:
    uint64_t v8 = v41;
    unint64_t v9 = v41[1];
    unint64_t v10 = v41[5];
    a3 = 6;
  }

  while (v9 < v10);
LABEL_52:
}

uint64_t PBUnknownFieldsSetMaximumRecursionDepth(uint64_t result)
{
  _sMaximumRecursionDepth = result;
  return result;
}

BOOL PBUnknownFieldAdd(void *a1, int a2, int a3, void *a4)
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v7 = a1;
  id v8 = a4;
  uint64_t v9 = 0LL;
  unint64_t v10 = a3 & 7 | (8 * a2);
  unint64_t v11 = v10;
  do
  {
    ++v9;
    BOOL v12 = v11 > 0x7F;
    v11 >>= 7;
  }

  while (v12);
  if (!_makeSpace(v7, v9))
  {
LABEL_68:
    BOOL v17 = 0LL;
    *((_BYTE *)v8 + 16) = 1;
    goto LABEL_69;
  }

  unint64_t v13 = (_BYTE *)(v7[1] + v7[3]);
  unint64_t v14 = v13;
  if (v10 < 0x80)
  {
    LOBYTE(v15) = a3 & 7 | (8 * a2);
  }

  else
  {
    do
    {
      *v14++ = v10 | 0x80;
      unint64_t v15 = v10 >> 7;
      unint64_t v16 = v10 >> 14;
      v10 >>= 7;
    }

    while (v16);
  }

  BOOL v17 = 0LL;
  *unint64_t v14 = v15;
  v7[3] += v14 - v13 + 1;
  switch(a3)
  {
    case 0:
      uint64_t v18 = 0LL;
      uint64_t v19 = *((void *)v8 + 1);
      while (1)
      {
        if (v18 == 10) {
          goto LABEL_68;
        }
        unint64_t v20 = v19 + v18 + 1;
        if (v19 + v18 == -1 || v20 > *((void *)v8 + 5)) {
          break;
        }
        int v21 = *(char *)(*((void *)v8 + 3) + v19 + v18);
        *((void *)v8 + 1) = v20;
        __src[v18++] = v21;
        if ((v21 & 0x80000000) == 0) {
          goto LABEL_48;
        }
      }

      *((_BYTE *)v8 + 16) = 1;
      __src[v18] = 0;
      LOBYTE(v18) = v18 + 1;
LABEL_48:
      size_t v31 = v18;
      memcpy((void *)(v7[1] + v7[3]), __src, v31);
      goto LABEL_50;
    case 1:
      if (!_makeSpace(v7, 8LL)) {
        goto LABEL_68;
      }
      uint64_t v22 = v7[3];
      unint64_t v23 = *((void *)v8 + 1);
      if (v23 <= 0xFFFFFFFFFFFFFFF7LL && v23 + 8 <= *((void *)v8 + 5))
      {
        *(void *)(v7[1] + v22) = *(void *)(*((void *)v8 + 3) + v23);
        *((void *)v8 + 1) += 8LL;
        uint64_t v22 = v7[3];
      }

      else
      {
        *((_BYTE *)v8 + 16) = 1;
      }

      size_t v45 = v22 + 8;
      goto LABEL_74;
    case 2:
      char v24 = 0;
      unsigned int v25 = 0;
      uint64_t v26 = 0LL;
      uint64_t v27 = *((void *)v8 + 1);
      while (2)
      {
        unint64_t v28 = v27 + 1;
        if (v27 == -1)
        {
          uint64_t v27 = -1LL;
          goto LABEL_55;
        }

        if (v28 > *((void *)v8 + 5))
        {
LABEL_55:
          size_t v31 = 0LL;
          *((_BYTE *)v8 + 16) = 1;
          unint64_t v28 = v27;
          goto LABEL_59;
        }

        char v29 = *(_BYTE *)(*((void *)v8 + 3) + v27);
        *((void *)v8 + 1) = v28;
        v26 |= (unint64_t)(v29 & 0x7F) << v24;
        if (v29 < 0)
        {
          v24 += 7;
          uint64_t v27 = v28;
          BOOL v30 = v25++ >= 9;
          if (v30)
          {
            size_t v31 = 0LL;
            goto LABEL_59;
          }

          continue;
        }

        break;
      }

      if (*((_BYTE *)v8 + 16)) {
        size_t v31 = 0LL;
      }
      else {
        size_t v31 = v26;
      }
LABEL_59:
      uint64_t v47 = 0LL;
      unint64_t v48 = v31;
      do
      {
        ++v47;
        BOOL v12 = v48 > 0x7F;
        v48 >>= 7;
      }

      while (v12);
      BOOL v30 = __CFADD__(v28, v31);
      unint64_t v49 = v28 + v31;
      if (v30 || v49 > *((void *)v8 + 5) || !_makeSpace(v7, v47 + v31)) {
        goto LABEL_68;
      }
      uint64_t v50 = v7[1] + v7[3];
      if (v31 < 0x80)
      {
        v52 = (_BYTE *)(v7[1] + v7[3]);
        LOBYTE(v53) = v31;
      }

      else
      {
        size_t v51 = v31;
        v52 = (_BYTE *)(v7[1] + v7[3]);
        do
        {
          *v52++ = v51 | 0x80;
          size_t v53 = v51 >> 7;
          size_t v54 = v51 >> 14;
          v51 >>= 7;
        }

        while (v54);
      }

      _BYTE *v52 = v53;
      uint64_t v44 = (uint64_t)&v52[v7[3] - v50 + 1];
      v7[3] = v44;
      uint64_t v56 = *((void *)v8 + 1);
      if (__CFADD__(v56, v31) || v56 + v31 > *((void *)v8 + 5))
      {
        *((_BYTE *)v8 + 16) = 1;
      }

      else
      {
        memcpy((void *)(v7[1] + v44), (const void *)(*((void *)v8 + 3) + v56), v31);
        *((void *)v8 + 1) += v31;
LABEL_50:
        uint64_t v44 = v7[3];
      }

      size_t v45 = v44 + v31;
LABEL_74:
      v7[3] = v45;
LABEL_75:
      BOOL v17 = *((_BYTE *)v8 + 16) == 0;
LABEL_69:

      return v17;
    case 3:
      unint64_t v32 = v7[4] + 1LL;
      v7[4] = v32;
      if (v32 > _sMaximumRecursionDepth)
      {
        BOOL v17 = 0LL;
        goto LABEL_69;
      }

      while (2)
      {
        if (*((_BYTE *)v8 + 16)) {
          goto LABEL_52;
        }
        char v35 = 0;
        unsigned int v36 = 0;
        unint64_t v37 = 0LL;
        unint64_t v38 = *((void *)v8 + 1);
        while (2)
        {
          unint64_t v39 = v38 + 1;
          if (v38 == -1LL || v39 > *((void *)v8 + 5))
          {
            unint64_t v41 = 0LL;
            uint64_t v42 = 0LL;
            *((_BYTE *)v8 + 16) = 1;
          }

          else
          {
            char v40 = *(_BYTE *)(*((void *)v8 + 3) + v38);
            *((void *)v8 + 1) = v39;
            v37 |= (unint64_t)(v40 & 0x7F) << v35;
            if (v40 < 0)
            {
              v35 += 7;
              unint64_t v38 = v39;
              BOOL v12 = v36++ > 8;
              if (v12)
              {
                unint64_t v41 = 0LL;
                uint64_t v42 = 0LL;
                break;
              }

              continue;
            }

            uint64_t v42 = v37 & 7;
            unint64_t v41 = v37 >> 3;
            if ((_DWORD)v42 == 4 && (_DWORD)v41 == a2)
            {
LABEL_52:
              uint64_t v46 = v7[4];
              if (v46) {
                v7[4] = v46 - 1;
              }
              goto LABEL_75;
            }
          }

          break;
        }

        BOOL v17 = 0LL;
        if ((PBUnknownFieldAdd(v7, v41, v42, v8) & 1) != 0) {
          continue;
        }
        goto LABEL_69;
      }

    case 5:
      if (!_makeSpace(v7, 4LL)) {
        goto LABEL_68;
      }
      uint64_t v33 = v7[3];
      unint64_t v34 = *((void *)v8 + 1);
      if (v34 <= 0xFFFFFFFFFFFFFFFBLL && v34 + 4 <= *((void *)v8 + 5))
      {
        *(_DWORD *)(v7[1] + v33) = *(_DWORD *)(*((void *)v8 + 3) + v34);
        *((void *)v8 + 1) += 4LL;
        uint64_t v33 = v7[3];
      }

      else
      {
        *((_BYTE *)v8 + 16) = 1;
      }

      size_t v45 = v33 + 4;
      goto LABEL_74;
    default:
      goto LABEL_69;
  }

BOOL _makeSpace(void *a1, uint64_t a2)
{
  id v3 = a1;
  int v4 = v3;
  uint64_t v5 = *((void *)v3 + 3);
  BOOL v6 = __CFADD__(v5, a2);
  unint64_t v7 = v5 + a2;
  if (v6) {
    goto LABEL_3;
  }
  if (v7 <= *((void *)v3 + 2))
  {
    BOOL v8 = *((void *)v3 + 1) != 0LL;
    goto LABEL_15;
  }

  unint64_t v9 = 1LL;
  while (1)
  {
    unint64_t v10 = v9;
    if (v9 >= v7) {
      break;
    }
    v9 *= 2LL;
    if ((v10 & 0x8000000000000000LL) != 0)
    {
      unint64_t v10 = -1LL;
      break;
    }
  }

  size_t v11 = v10 <= 0x10 ? 16LL : v10;
  BOOL v12 = realloc(*((void **)v3 + 1), v11);
  if (!v12)
  {
LABEL_3:
    BOOL v8 = 0LL;
  }

  else
  {
    v4[1] = v12;
    v4[2] = v11;
    BOOL v8 = 1LL;
  }

LABEL_15:
  return v8;
}

PB::Writer *PB::Writer::Writer(PB::Writer *this)
{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

{
  *(void *)this = 0LL;
  *((void *)this + 1) = 0LL;
  *((void *)this + 2) = 0LL;
  PB::_grow((uint64_t *)this, 0x100uLL);
  return this;
}

char *PB::_grow(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = *a1;
  unint64_t v5 = a1[2] - v3;
  if (v5 <= a2) {
    unint64_t v6 = a2;
  }
  else {
    unint64_t v6 = a1[2] - v3;
  }
  unint64_t v7 = v6 + v5;
  __n128 result = (char *)realloc((void *)a1[1], v6 + v5);
  if (!result)
  {
    exception = (std::bad_alloc *)__cxa_allocate_exception(8uLL);
    unint64_t v10 = std::bad_alloc::bad_alloc(exception);
    __cxa_throw(v10, MEMORY[0x189614708], MEMORY[0x189614690]);
  }

  a1[1] = (uint64_t)result;
  a1[2] = (uint64_t)&result[v7];
  *a1 = (uint64_t)&result[v4 - v3];
  return result;
}

void PB::Writer::~Writer(void **this)
{
}

{
  free(this[1]);
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unsigned int a2, int a3)
{
  unint64_t v5 = this;
  unint64_t v6 = (int)a2;
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }

    else
    {
      do
      {
        BOOL v8 = (_BYTE *)(*v5)++;
        *BOOL v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }

      while (v10);
    }

    size_t v11 = (_BYTE *)(*v5)++;
    *size_t v11 = v9;
  }

  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }

  else
  {
    do
    {
      BOOL v12 = (_BYTE *)(*v5)++;
      *BOOL v12 = v6 | 0x80;
      unint64_t v13 = v6 >> 7;
      unint64_t v14 = v6 >> 14;
      v6 >>= 7;
    }

    while (v14);
  }

  unint64_t v15 = (_BYTE *)(*v5)++;
  *unint64_t v15 = v13;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  unint64_t v5 = this;
  unint64_t v6 = a2;
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3);
    if (v7 < 0x80)
    {
      LOBYTE(v9) = 8 * a3;
    }

    else
    {
      do
      {
        BOOL v8 = (_BYTE *)(*v5)++;
        *BOOL v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }

      while (v10);
    }

    size_t v11 = (_BYTE *)(*v5)++;
    *size_t v11 = v9;
  }

  if (a2 < 0x80)
  {
    LOBYTE(v13) = a2;
  }

  else
  {
    do
    {
      BOOL v12 = (_BYTE *)(*v5)++;
      *BOOL v12 = v6 | 0x80;
      unint64_t v13 = v6 >> 7;
      unint64_t v14 = v6 >> 14;
      v6 >>= 7;
    }

    while (v14);
  }

  unint64_t v15 = (_BYTE *)(*v5)++;
  *unint64_t v15 = v13;
  return this;
}

uint64_t *PB::Writer::writeVarInt(uint64_t *this, unint64_t a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }

  else
  {
    do
    {
      size_t v11 = (_BYTE *)(*v5)++;
      *size_t v11 = a2 | 0x80;
      unint64_t v12 = a2 >> 7;
      unint64_t v13 = a2 >> 14;
      a2 >>= 7;
    }

    while (v13);
  }

  unint64_t v14 = (_BYTE *)(*v5)++;
  *unint64_t v14 = v12;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v12;
  unint64_t v13;
  _BYTE *v14;
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  if (a2 < 0x80)
  {
    LOBYTE(v12) = a2;
  }

  else
  {
    do
    {
      size_t v11 = (_BYTE *)(*v5)++;
      *size_t v11 = a2 | 0x80;
      unint64_t v12 = a2 >> 7;
      unint64_t v13 = a2 >> 14;
      a2 >>= 7;
    }

    while (v13);
  }

  unint64_t v14 = (_BYTE *)(*v5)++;
  *unint64_t v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, int a2, int a3)
{
  uint64_t v4 = this;
  unint64_t v5 = (2 * a2) ^ (a2 >> 31);
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v4)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v4)++;
    *unint64_t v10 = v8;
  }

  if (v5 < 0x80)
  {
    LOBYTE(v12) = v5;
  }

  else
  {
    do
    {
      size_t v11 = (_BYTE *)(*v4)++;
      *size_t v11 = v5 | 0x80;
      unint64_t v12 = v5 >> 7;
      unint64_t v13 = v5 >> 14;
      v5 >>= 7;
    }

    while (v13);
  }

  unint64_t v14 = (_BYTE *)(*v4)++;
  *unint64_t v14 = v12;
  return this;
}

uint64_t *PB::Writer::writeSInt(uint64_t *this, uint64_t a2, int a3)
{
  unint64_t v5 = this;
  uint64_t v6 = 2 * a2;
  unint64_t v7 = v6 ^ (a2 >> 63);
  if (a3 != -1)
  {
    unint64_t v8 = (8 * a3);
    if (v8 < 0x80)
    {
      LOBYTE(v10) = 8 * a3;
    }

    else
    {
      do
      {
        unint64_t v9 = (_BYTE *)(*v5)++;
        *unint64_t v9 = v8 | 0x80;
        unint64_t v10 = v8 >> 7;
        unint64_t v11 = v8 >> 14;
        v8 >>= 7;
      }

      while (v11);
    }

    unint64_t v12 = (_BYTE *)(*v5)++;
    *unint64_t v12 = v10;
  }

  if (v7 < 0x80)
  {
    uint64_t v14 = v6 ^ (a2 >> 63);
  }

  else
  {
    do
    {
      unint64_t v13 = (_BYTE *)(*v5)++;
      *unint64_t v13 = v7 | 0x80;
      uint64_t v14 = v7 >> 7;
      unint64_t v15 = v7 >> 14;
      v7 >>= 7;
    }

    while (v15);
  }

  unint64_t v16 = (_BYTE *)(*v5)++;
  *unint64_t v16 = v14;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, int a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(_DWORD *)*unint64_t v5 = a2;
  *v5 += 4LL;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(_DWORD *)*unint64_t v5 = a2;
  *v5 += 4LL;
  return this;
}

uint64_t *PB::Writer::writeFixed(uint64_t *this, uint64_t a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(void *)*unint64_t v5 = a2;
  *v5 += 8LL;
  return this;
}

{
  uint64_t *v5;
  unint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(void *)*unint64_t v5 = a2;
  *v5 += 8LL;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, char a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3);
    if (v6 < 0x80)
    {
      LOBYTE(v8) = 8 * a3;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  unint64_t v11 = (_BYTE *)(*v5)++;
  *unint64_t v11 = a2;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, float a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 5u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 5;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(float *)*unint64_t v5 = a2;
  *v5 += 4LL;
  return this;
}

uint64_t *PB::Writer::write(uint64_t *this, double a2, int a3)
{
  unint64_t v5 = this;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 1u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 1;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  *(double *)*unint64_t v5 = a2;
  *v5 += 8LL;
  return this;
}

void *PB::Writer::write(uint64_t *a1, const void **a2, int a3)
{
  int v6 = *((char *)a2 + 23);
  unint64_t v7 = (const void **)*a2;
  if (v6 >= 0) {
    size_t v8 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v8 = (size_t)a2[1];
  }
  if (a1[2] < *a1 + v8 + 16) {
    PB::_grow(a1, v8 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v9 = (8 * a3) | 2u;
    if (v9 < 0x80)
    {
      LOBYTE(v11) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        unint64_t v10 = (_BYTE *)(*a1)++;
        *unint64_t v10 = v9 | 0x80;
        unint64_t v11 = v9 >> 7;
        unint64_t v12 = v9 >> 14;
        v9 >>= 7;
      }

      while (v12);
    }

    unint64_t v13 = (_BYTE *)(*a1)++;
    *unint64_t v13 = v11;
  }

  LOBYTE(v14) = v8;
  if (v8 >= 0x80)
  {
    size_t v15 = v8;
    do
    {
      unint64_t v16 = (_BYTE *)(*a1)++;
      *unint64_t v16 = v15 | 0x80;
      size_t v14 = v15 >> 7;
      size_t v17 = v15 >> 14;
      v15 >>= 7;
    }

    while (v17);
  }

  if (v6 >= 0) {
    uint64_t v18 = a2;
  }
  else {
    uint64_t v18 = v7;
  }
  uint64_t v19 = (_BYTE *)(*a1)++;
  *uint64_t v19 = v14;
  __n128 result = memcpy((void *)*a1, v18, v8);
  *a1 += v8;
  return result;
}

void *PB::Writer::write(uint64_t *a1, uint64_t a2, int a3)
{
  unint64_t v5 = *(const void **)a2;
  size_t v6 = *(void *)(a2 + 8) - *(void *)a2;
  if (a1[2] < *a1 + v6 + 16) {
    PB::_grow(a1, v6 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        size_t v8 = (_BYTE *)(*a1)++;
        *size_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }

      while (v10);
    }

    unint64_t v11 = (_BYTE *)(*a1)++;
    *unint64_t v11 = v9;
  }

  LOBYTE(v12) = v6;
  if (v6 >= 0x80)
  {
    size_t v13 = v6;
    do
    {
      size_t v14 = (_BYTE *)(*a1)++;
      *size_t v14 = v13 | 0x80;
      size_t v12 = v13 >> 7;
      size_t v15 = v13 >> 14;
      v13 >>= 7;
    }

    while (v15);
  }

  unint64_t v16 = (_BYTE *)(*a1)++;
  *unint64_t v16 = v12;
  __n128 result = memcpy((void *)*a1, v5, v6);
  *a1 += v6;
  return result;
}

void *PB::Writer::write(PB::Writer *this, const PB::Data *a2, int a3)
{
  size_t v6 = *(const void **)a2;
  size_t v5 = *((void *)a2 + 1);
  if (*((void *)this + 2) < *(void *)this + v5 + 16) {
    PB::_grow((uint64_t *)this, v5 + 16);
  }
  if (a3 != -1)
  {
    unint64_t v7 = (8 * a3) | 2u;
    if (v7 < 0x80)
    {
      LOBYTE(v9) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        size_t v8 = (_BYTE *)(*(void *)this)++;
        *size_t v8 = v7 | 0x80;
        unint64_t v9 = v7 >> 7;
        unint64_t v10 = v7 >> 14;
        v7 >>= 7;
      }

      while (v10);
    }

    unint64_t v11 = (_BYTE *)(*(void *)this)++;
    *unint64_t v11 = v9;
  }

  LOBYTE(v12) = v5;
  if (v5 >= 0x80)
  {
    size_t v13 = v5;
    do
    {
      size_t v14 = (_BYTE *)(*(void *)this)++;
      *size_t v14 = v13 | 0x80;
      size_t v12 = v13 >> 7;
      size_t v15 = v13 >> 14;
      v13 >>= 7;
    }

    while (v15);
  }

  unint64_t v16 = (_BYTE *)(*(void *)this)++;
  *unint64_t v16 = v12;
  __n128 result = memcpy(*(void **)this, v6, v5);
  *(void *)this += v5;
  return result;
}

char *PB::Writer::writeSubgroup(PB::Writer *this, const PB::Base *a2, int a3)
{
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 3u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 3;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*(void *)this)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*(void *)this)++;
    *unint64_t v10 = v8;
  }

  __n128 result = (char *)(*(uint64_t (**)(const PB::Base *, PB::Writer *))(*(void *)a2 + 24LL))(a2, this);
  if (a3 != -1)
  {
    unint64_t v12 = (8 * a3) | 4u;
    if (v12 < 0x80)
    {
      LOBYTE(v14) = (8 * a3) | 4;
    }

    else
    {
      do
      {
        size_t v13 = (_BYTE *)(*(void *)this)++;
        *size_t v13 = v12 | 0x80;
        unint64_t v14 = v12 >> 7;
        unint64_t v15 = v12 >> 14;
        v12 >>= 7;
      }

      while (v15);
    }

    unint64_t v16 = (_BYTE *)(*(void *)this)++;
    *unint64_t v16 = v14;
  }

  return result;
}

uint64_t *PB::Writer::placeMark(uint64_t *result, void *a2, int a3)
{
  size_t v5 = result;
  if (a3 != -1)
  {
    unint64_t v6 = (8 * a3) | 2u;
    if (v6 < 0x80)
    {
      LOBYTE(v8) = (8 * a3) | 2;
    }

    else
    {
      do
      {
        unint64_t v7 = (_BYTE *)(*v5)++;
        *unint64_t v7 = v6 | 0x80;
        unint64_t v8 = v6 >> 7;
        unint64_t v9 = v6 >> 14;
        v6 >>= 7;
      }

      while (v9);
    }

    unint64_t v10 = (_BYTE *)(*v5)++;
    *unint64_t v10 = v8;
  }

  uint64_t v11 = v5[1];
  uint64_t v12 = *v5 + 1;
  *size_t v5 = v12;
  *a2 = v12 - v11;
  return result;
}

uint64_t *PB::Writer::recallMark(uint64_t *result, uint64_t *a2)
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  uint64_t v5 = *a2;
  size_t v6 = *result - (*a2 + v4);
  unint64_t v7 = -1LL;
  unint64_t v8 = v6;
  do
  {
    ++v7;
    BOOL v9 = v8 > 0x7F;
    v8 >>= 7;
  }

  while (v9);
  if (v7)
  {
    if (result[2] < *result + v7)
    {
      PB::_grow(result, v7);
      uint64_t v4 = v3[1];
      uint64_t v5 = *a2;
    }

    __n128 result = (uint64_t *)memmove((void *)(v4 + v5 + v7), (const void *)(v4 + v5), v6);
    uint64_t v4 = v3[1];
    uint64_t v5 = *a2;
  }

  unint64_t v10 = (_BYTE *)(v4 + v5 - 1);
  if (v6 < 0x80)
  {
    LOBYTE(v11) = v6;
  }

  else
  {
    do
    {
      *v10++ = v6 | 0x80;
      size_t v11 = v6 >> 7;
      size_t v12 = v6 >> 14;
      v6 >>= 7;
    }

    while (v12);
  }

  *unint64_t v10 = v11;
  *v3 += v7;
  return result;
}

uint64_t *PB::Writer::writeSubmessage(PB::Writer *this, const PB::Base *a2, int a3)
{
  return PB::Writer::recallMark((uint64_t *)this, &v6);
}

LABEL_9:
}

void sub_183BD18B4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0LL;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x189607458](aClassName);
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x189603A50](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x189607700](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x189607718](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::stringbuf::string_type *__cdecl std::stringbuf::str( std::stringbuf::string_type *__return_ptr retstr, const std::stringbuf *this)
{
  return (std::stringbuf::string_type *)MEMORY[0x189614198](retstr, this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1896141C8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1896141D0](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1896141E0](this, a2);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1896142C8](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1896142D0](this, __s);
}

std::string *__cdecl std::string::insert( std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x189614310](this, __pos, __s, __n);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x189614358](this, __str);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1896143C8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1896143D0]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x1896143E8]();
}

{
  return MEMORY[0x1896143F0]();
}

{
  return MEMORY[0x1896143F8]();
}

{
  return MEMORY[0x189614400]();
}

{
  return MEMORY[0x189614408]();
}

{
  return MEMORY[0x189614430]();
}

{
  return MEMORY[0x189614438]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x189614448]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x189614470]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x189614478]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x189614638]();
}

std::bad_alloc *__cdecl std::bad_alloc::bad_alloc(std::bad_alloc *this)
{
  return (std::bad_alloc *)MEMORY[0x189614688](this);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_189D320C0(__sz);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1896147A0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1896147B8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A28](*(void *)&a1);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1895F8A30](*(void *)&a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void *__cdecl calloc(size_t __count, size_t __size)
{
  return (void *)MEMORY[0x1895F9710](__count, __size);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616488](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x189616490](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1895FAF78](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1895FBA98]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1895FBBF8](info);
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x189608FE8]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x189608FF0]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x189609008]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1896165B0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1896165C0]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1896165D8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1896165E8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1896165F0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x189616600]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x189616700](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x189616728](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x189616730]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x189616738]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x189616748]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x189616750]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x189616818](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x189616820](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x189616828](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x189616838](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x189616968](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1895FC470](oslog, type);
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1896169F0](property, outCount);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x189616A00](property);
}

objc_property_t *__cdecl protocol_copyPropertyList(Protocol *proto, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x189616A20](proto, outCount);
}

void *__cdecl realloc(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1895FCC68](__ptr, __size);
}

SEL sel_registerName(const char *str)
{
  return (SEL)MEMORY[0x189616A68](str);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1895FD0B8](__s);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD180](__str, __endptr, *(void *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1895FD1C8](__str, __endptr, *(void *)&__base);
}

uint64_t objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_( void *a1, const char *a2, ...)
{
  return MEMORY[0x189616718](a1, sel_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_);
}