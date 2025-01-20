XML_Parser XML_ParserCreate(const XML_Char *encoding)
{
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, 0LL, 0LL, 0LL);
}

XML_Parser XML_ParserCreate_MM( const XML_Char *encoding, const XML_Memory_Handling_Suite *memsuite, const XML_Char *namespaceSeparator)
{
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, (__int128 *)memsuite, namespaceSeparator, 0LL);
}

XML_Parser XML_ParserCreateNS(const XML_Char *encoding, XML_Char namespaceSeparator)
{
  v3[0] = namespaceSeparator;
  v3[1] = 0;
  return (XML_Parser)parserCreate((unsigned __int8 *)encoding, 0LL, v3, 0LL);
}

uint64_t parserCreate(unsigned __int8 *a1, __int128 *a2, _BYTE *a3, uint64_t a4)
{
  if (a2)
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t))a2)(1008LL);
    uint64_t v9 = v8;
    if (!v8) {
      return v9;
    }
    __int128 v10 = *a2;
    *(_OWORD *)(v8 + 24) = *a2;
    uint64_t v11 = *((void *)a2 + 2);
    v12 = (uint64_t (*)(uint64_t))v10;
  }

  else
  {
    v13 = malloc(0x3F0uLL);
    uint64_t v9 = (uint64_t)v13;
    if (!v13) {
      return v9;
    }
    v12 = MEMORY[0x1895FBC88];
    uint64_t v14 = MEMORY[0x1895FCC68];
    v13[3] = MEMORY[0x1895FBC88];
    v13[4] = v14;
    uint64_t v11 = MEMORY[0x1895FB398];
  }

  *(void *)(v9 + 40) = v11;
  *(void *)(v9 + 16) = 0LL;
  *(void *)(v9 + 64) = 0LL;
  *(_DWORD *)(v9 + 736) = 16;
  uint64_t v15 = v12(512LL);
  *(void *)(v9 + 752) = v15;
  if (!v15) {
    goto LABEL_21;
  }
  uint64_t v16 = (*(uint64_t (**)(uint64_t))(v9 + 24))(1024LL);
  *(void *)(v9 + 104) = v16;
  if (!v16)
  {
LABEL_20:
    (*(void (**)(void))(v9 + 40))(*(void *)(v9 + 752));
LABEL_21:
    (*(void (**)(uint64_t))(v9 + 40))(v9);
    return 0LL;
  }

  v17 = (uint64_t (**)(uint64_t))(v9 + 24);
  *(void *)(v9 + 112) = v16 + 1024;
  uint64_t v18 = a4;
  if (!a4)
  {
    uint64_t v18 = (*v17)(360LL);
    if (v18)
    {
      *(_OWORD *)(v18 + 160) = 0u;
      *(_OWORD *)(v18 + 176) = 0u;
      *(void *)(v18 + 192) = 0LL;
      *(void *)(v18 + 200) = v17;
      *(_OWORD *)(v18 + 208) = 0u;
      *(_OWORD *)(v18 + 224) = 0u;
      *(void *)(v18 + 240) = 0LL;
      *(void *)(v18 + 248) = v17;
      *(_BYTE *)(v18 + 8) = 0;
      *(void *)uint64_t v18 = 0LL;
      *(void *)(v18 + 16) = 0LL;
      *(void *)(v18 + 24) = 0LL;
      *(_BYTE *)(v18 + 48) = 0;
      *(void *)(v18 + 32) = v17;
      *(void *)(v18 + 40) = 0LL;
      *(void *)(v18 + 56) = 0LL;
      *(void *)(v18 + 64) = 0LL;
      *(_BYTE *)(v18 + 88) = 0;
      *(void *)(v18 + 72) = v17;
      *(void *)(v18 + 80) = 0LL;
      *(void *)(v18 + 96) = 0LL;
      *(void *)(v18 + 104) = 0LL;
      *(_BYTE *)(v18 + 128) = 0;
      *(void *)(v18 + 112) = v17;
      *(void *)(v18 + 120) = 0LL;
      *(void *)(v18 + 136) = 0LL;
      *(void *)(v18 + 144) = 0LL;
      *(void *)(v18 + 152) = v17;
      *(_BYTE *)(v18 + 272) = 0;
      *(void *)(v18 + 264) = 0LL;
      *(void *)(v18 + 280) = 0LL;
      *(void *)(v18 + 288) = 0LL;
      *(void *)(v18 + 296) = v17;
      *(void *)(v18 + 304) = 0LL;
      *(void *)(v18 + 312) = 0LL;
      *(_BYTE *)(v18 + 320) = 0;
      *(_OWORD *)(v18 + 328) = 0u;
      *(_OWORD *)(v18 + 344) = 0u;
      *(_DWORD *)(v18 + 256) = 1;
      goto LABEL_11;
    }

    *(void *)(v9 + 688) = 0LL;
    (*(void (**)(void))(v9 + 40))(*(void *)(v9 + 104));
    goto LABEL_20;
  }

LABEL_11:
  *(void *)(v9 + 688) = v18;
  *(void *)(v9 + 728) = 0LL;
  *(void *)(v9 + 712) = 0LL;
  *(void *)(v9 + 592) = 0LL;
  *(_DWORD *)(v9 + 904) = 0;
  *(void *)(v9 + 896) = 0LL;
  *(void *)(v9 + 264) = 0LL;
  *(void *)(v9 + 496) = 0LL;
  *(_BYTE *)(v9 + 908) = 33;
  *(_WORD *)(v9 + 472) = 0;
  *(void *)(v9 + 464) = 0LL;
  *(_OWORD *)(v9 + 800) = 0u;
  *(_OWORD *)(v9 + 816) = 0u;
  *(void *)(v9 + 832) = 0LL;
  *(_BYTE *)(v9 + 776) = 0;
  *(_OWORD *)(v9 + 760) = 0u;
  *(void *)(v9 + 840) = v17;
  *(void *)(v9 + 880) = 0LL;
  *(_OWORD *)(v9 + 848) = 0u;
  *(_OWORD *)(v9 + 864) = 0u;
  *(void *)(v9 + 888) = v17;
  parserInit(v9, a1);
  if (a1 && !*(void *)(v9 + 464))
  {
    if (a4) {
      *(void *)(v9 + 688) = 0LL;
    }
    XML_ParserFree((XML_Parser)v9);
    return 0LL;
  }

  if (a3)
  {
    *(_BYTE *)(v9 + 472) = 1;
    *(void *)(v9 + 456) = XmlGetUtf8InternalEncodingNS();
    *(_BYTE *)(v9 + 908) = *a3;
  }

  else
  {
    *(void *)(v9 + 456) = XmlGetUtf8InternalEncoding();
  }

  return v9;
}

    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
    goto LABEL_16;
  }

  if (a2 == 15) {
    return 3LL;
  }
  if (a2 != 17) {
    goto LABEL_11;
  }
  result = 8LL;
  v7 = prolog2;
LABEL_17:
  *(void *)a1 = v7;
  return result;
}

    result = 0xFFFFFFFFLL;
    __int128 v10 = error;
    goto LABEL_12;
  }

  result = 0LL;
  __int128 v10 = condSect1;
LABEL_12:
  *(void *)a1 = v10;
  return result;
}

    result = 0xFFFFFFFFLL;
    __int128 v10 = error;
    goto LABEL_12;
  }

  result = 17LL;
  __int128 v10 = notation3;
LABEL_12:
  *(void *)a1 = v10;
  return result;
}

XML_Bool XML_ParserReset(XML_Parser parser, const XML_Char *encoding)
{
  if (parser)
  {
    XML_Parser v2 = parser;
    if (*((void *)parser + 114))
    {
      LOBYTE(parser) = 0;
      return parser;
    }

    v4 = (void *)*((void *)parser + 88);
    if (v4)
    {
      v5 = (void *)*((void *)parser + 89);
      do
      {
        v6 = v4;
        v4 = (void *)*v4;
        void *v6 = v5;
        uint64_t v7 = v6[10];
        if (v7)
        {
          uint64_t v8 = *((void *)parser + 91);
          do
          {
            uint64_t v9 = v7;
            uint64_t v7 = *(void *)(v7 + 8);
            *(void *)(v9 + 8) = v8;
            uint64_t v8 = v9;
          }

          while (v7);
          *((void *)parser + 91) = v9;
        }

        v6[10] = 0LL;
        v5 = v6;
      }

      while (v4);
      *((void *)parser + 89) = v6;
    }

    uint64_t v10 = *((void *)parser + 73);
    if (v10)
    {
      uint64_t v11 = *((void *)parser + 74);
      do
      {
        uint64_t v12 = v10;
        uint64_t v10 = *(void *)(v10 + 16);
        *(void *)(v12 + 16) = v11;
        uint64_t v11 = v12;
      }

      while (v10);
      *((void *)parser + 74) = v12;
    }

    uint64_t v13 = *((void *)parser + 90);
    if (v13)
    {
      uint64_t v14 = *((void *)parser + 91);
      do
      {
        uint64_t v15 = v13;
        uint64_t v13 = *(void *)(v13 + 8);
        *(void *)(v15 + 8) = v14;
        uint64_t v14 = v15;
      }

      while (v13);
      *((void *)parser + 91) = v15;
    }

    (*((void (**)(void))parser + 5))(*((void *)parser + 60));
    uint64_t v16 = (void (*)(void))*((void *)v2 + 63);
    if (v16) {
      v16(*((void *)v2 + 61));
    }
    v17 = (void *)*((void *)v2 + 101);
    uint64_t v18 = (void *)*((void *)v2 + 100);
    if (v17)
    {
      if (!v18) {
        goto LABEL_28;
      }
      do
      {
        v19 = v18;
        uint64_t v18 = (void *)*v18;
        void *v19 = v17;
        v17 = v19;
      }

      while (v18);
    }

    else
    {
      v19 = (void *)*((void *)v2 + 100);
    }

    *((void *)v2 + 101) = v19;
LABEL_28:
    *((void *)v2 + 100) = 0LL;
    *((void *)v2 + 102) = 0LL;
    *((void *)v2 + 104) = 0LL;
    *((void *)v2 + 103) = 0LL;
    v20 = (void *)*((void *)v2 + 107);
    v21 = (void *)*((void *)v2 + 106);
    if (v20)
    {
      if (!v21) {
        goto LABEL_34;
      }
      do
      {
        v22 = v21;
        v21 = (void *)*v21;
        void *v22 = v20;
        v20 = v22;
      }

      while (v21);
    }

    else
    {
      v22 = (void *)*((void *)v2 + 106);
    }

    *((void *)v2 + 107) = v22;
LABEL_34:
    *((void *)v2 + 106) = 0LL;
    *((void *)v2 + 108) = 0LL;
    *((void *)v2 + 110) = 0LL;
    *((void *)v2 + 109) = 0LL;
    (*((void (**)(void))v2 + 5))(*((void *)v2 + 58));
    *((void *)v2 + 58) = 0LL;
    parserInit((uint64_t)v2, (unsigned __int8 *)encoding);
    uint64_t v23 = *((void *)v2 + 86);
    v24 = *(uint64_t **)(v23 + 40);
    if (v24) {
      v25 = &v24[*(void *)(v23 + 56)];
    }
    else {
      v25 = 0LL;
    }
    while (v24 != v25)
    {
      uint64_t v27 = *v24++;
      uint64_t v26 = v27;
      if (v27 && *(_DWORD *)(v26 + 28)) {
        (*((void (**)(void))v2 + 5))(*(void *)(v26 + 32));
      }
    }

    if (*(void *)(v23 + 16))
    {
      unint64_t v28 = 0LL;
      do
      {
        (*(void (**)(void))(*(void *)(v23 + 32) + 16LL))(*(void *)(*(void *)v23 + 8 * v28));
        *(void *)(*(void *)v23 + 8 * v28++) = 0LL;
      }

      while (v28 < *(void *)(v23 + 16));
    }

    *(void *)(v23 + 24) = 0LL;
    *(_BYTE *)(v23 + 259) = 0;
    if (*(void *)(v23 + 280))
    {
      unint64_t v29 = 0LL;
      do
      {
        (*(void (**)(void))(*(void *)(v23 + 296) + 16LL))(*(void *)(*(void *)(v23 + 264) + 8 * v29));
        *(void *)(*(void *)(v23 + 264) + 8 * v29++) = 0LL;
      }

      while (v29 < *(void *)(v23 + 280));
    }

    *(void *)(v23 + 288) = 0LL;
    if (*(void *)(v23 + 56))
    {
      unint64_t v30 = 0LL;
      do
      {
        (*(void (**)(void))(*(void *)(v23 + 72) + 16LL))(*(void *)(*(void *)(v23 + 40) + 8 * v30));
        *(void *)(*(void *)(v23 + 40) + 8 * v30++) = 0LL;
      }

      while (v30 < *(void *)(v23 + 56));
    }

    *(void *)(v23 + 64) = 0LL;
    if (*(void *)(v23 + 96))
    {
      unint64_t v31 = 0LL;
      do
      {
        (*(void (**)(void))(*(void *)(v23 + 112) + 16LL))(*(void *)(*(void *)(v23 + 80) + 8 * v31));
        *(void *)(*(void *)(v23 + 80) + 8 * v31++) = 0LL;
      }

      while (v31 < *(void *)(v23 + 96));
    }

    *(void *)(v23 + 104) = 0LL;
    if (*(void *)(v23 + 136))
    {
      unint64_t v32 = 0LL;
      do
      {
        (*(void (**)(void))(*(void *)(v23 + 152) + 16LL))(*(void *)(*(void *)(v23 + 120) + 8 * v32));
        *(void *)(*(void *)(v23 + 120) + 8 * v32++) = 0LL;
      }

      while (v32 < *(void *)(v23 + 136));
    }

    *(void *)(v23 + 144) = 0LL;
    v34 = *(void **)(v23 + 160);
    v33 = *(void **)(v23 + 168);
    if (v33)
    {
      if (!v34) {
        goto LABEL_62;
      }
      do
      {
        v35 = v34;
        v34 = (void *)*v34;
        void *v35 = v33;
        v33 = v35;
      }

      while (v34);
    }

    else
    {
      v35 = *(void **)(v23 + 160);
    }

    *(void *)(v23 + 168) = v35;
LABEL_62:
    *(void *)(v23 + 160) = 0LL;
    *(void *)(v23 + 184) = 0LL;
    *(void *)(v23 + 192) = 0LL;
    *(void *)(v23 + 176) = 0LL;
    v37 = *(void **)(v23 + 208);
    v36 = *(void **)(v23 + 216);
    if (v36)
    {
      if (!v37)
      {
LABEL_68:
        *(void *)(v23 + 208) = 0LL;
        *(void *)(v23 + 232) = 0LL;
        *(void *)(v23 + 240) = 0LL;
        *(void *)(v23 + 224) = 0LL;
        *(void *)(v23 + 304) = 0LL;
        *(void *)(v23 + 312) = 0LL;
        *(_BYTE *)(v23 + 320) = 0;
        (*((void (**)(void))v2 + 5))(*(void *)(v23 + 352));
        *(void *)(v23 + 352) = 0LL;
        (*((void (**)(void))v2 + 5))(*(void *)(v23 + 328));
        *(void *)(v23 + 328) = 0LL;
        *(void *)(v23 + 336) = 0LL;
        *(void *)(v23 + 344) = 0LL;
        LOBYTE(parser) = 1;
        *(_WORD *)(v23 + 256) = 1;
        *(_BYTE *)(v23 + 258) = 0;
        return parser;
      }

      do
      {
        v38 = v37;
        v37 = (void *)*v37;
        void *v38 = v36;
        v36 = v38;
      }

      while (v37);
    }

    else
    {
      v38 = *(void **)(v23 + 208);
    }

    *(void *)(v23 + 216) = v38;
    goto LABEL_68;
  }

  return parser;
}

unint64_t parserInit(uint64_t a1, unsigned __int8 *a2)
{
  *(void *)(a1 + 544) = prologInitProcessor;
  XmlPrologStateInit(a1 + 512);
  if (a2) {
    *(void *)(a1 + 464) = copyString(a2, (uint64_t (**)(size_t))(a1 + 24));
  }
  *(void *)(a1 + 696) = 0LL;
  XmlInitEncoding(a1 + 312, (void *)(a1 + 304), 0LL);
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  *(void *)(a1 + 248) = a1;
  *(void *)(a1 + 256) = 0LL;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  uint64_t v4 = *(void *)(a1 + 16);
  *(void *)(a1 + 48) = v4;
  *(void *)(a1 + 56) = v4;
  *(void *)(a1 + 88) = 0LL;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_BYTE *)(a1 + 96) = 1;
  *(_DWORD *)(a1 + 100) = 0;
  *(_OWORD *)(a1 + 608) = 0u;
  *(_OWORD *)(a1 + 624) = 0u;
  *(_OWORD *)(a1 + 640) = 0u;
  *(_OWORD *)(a1 + 656) = 0u;
  *(_OWORD *)(a1 + 666) = 0u;
  *(_OWORD *)(a1 + 784) = 0u;
  *(_DWORD *)(a1 + 552) = 0;
  *(_OWORD *)(a1 + 560) = 0u;
  *(_OWORD *)(a1 + 576) = 0u;
  *(_BYTE *)(a1 + 600) = 1;
  *(_DWORD *)(a1 + 604) = 0;
  *(void *)(a1 + 704) = 0LL;
  *(void *)(a1 + 720) = 0LL;
  *(_DWORD *)(a1 + 740) = 0;
  *(void *)(a1 + 504) = 0LL;
  *(void *)(a1 + 912) = 0LL;
  *(_DWORD *)(a1 + 920) = 0;
  *(_WORD *)(a1 + 928) = 0;
  *(_DWORD *)(a1 + 932) = 0;
  *(void *)(a1 + 936) = 0LL;
  *(void *)(a1 + 480) = 0LL;
  *(void *)(a1 + 488) = 0LL;
  *(_OWORD *)(a1 + 944) = 0u;
  *(_OWORD *)(a1 + 960) = 0u;
  *(void *)(a1 + 976) = 0LL;
  *(void *)(a1 + 960) = getDebugLevel("EXPAT_ACCOUNTING_DEBUG");
  *(_DWORD *)(a1 + 968) = 1120403456;
  *(void *)(a1 + 976) = 0x800000LL;
  *(void *)(a1 + 984) = 0LL;
  *(void *)(a1 + 1000) = 0LL;
  *(void *)(a1 + 992) = 0LL;
  unint64_t result = getDebugLevel("EXPAT_ENTITY_DEBUG");
  *(void *)(a1 + 1000) = result;
  return result;
}

XML_Status XML_SetEncoding(XML_Parser parser, const XML_Char *encoding)
{
  if (parser)
  {
    XML_Parser v2 = parser;
    if ((*((_DWORD *)parser + 230) | 2) == 3)
    {
      LODWORD(parser) = 0;
    }

    else
    {
      (*((void (**)(void))parser + 5))(*((void *)parser + 58));
      if (encoding)
      {
        parser = (XML_Parser)copyString((unsigned __int8 *)encoding, (uint64_t (**)(size_t))v2 + 3);
        *((void *)v2 + 58) = parser;
        if (!parser) {
          return parser;
        }
      }

      else
      {
        *((void *)v2 + 58) = 0LL;
      }

      LODWORD(parser) = 1;
    }
  }

  return parser;
}

void *copyString(unsigned __int8 *a1, uint64_t (**a2)(size_t))
{
  size_t v3 = 0LL;
  while (a1[v3++])
    ;
  v5 = (void *)(*a2)(v3);
  v6 = v5;
  if (v5) {
    memcpy(v5, a1, v3);
  }
  return v6;
}

XML_Parser XML_ExternalEntityParserCreate(XML_Parser parser, const XML_Char *context, const XML_Char *encoding)
{
  if (!parser) {
    return 0LL;
  }
  __int128 v64 = *(_OWORD *)((char *)parser + 136);
  __int128 v65 = *(_OWORD *)((char *)parser + 120);
  __int128 v62 = *(_OWORD *)((char *)parser + 168);
  __int128 v63 = *(_OWORD *)((char *)parser + 152);
  __int128 v60 = *(_OWORD *)((char *)parser + 216);
  __int128 v61 = *(_OWORD *)((char *)parser + 200);
  __int128 v58 = *((_OWORD *)parser + 16);
  __int128 v59 = *(_OWORD *)((char *)parser + 232);
  __int128 v56 = *((_OWORD *)parser + 18);
  __int128 v57 = *((_OWORD *)parser + 17);
  uint64_t v5 = *((void *)parser + 83);
  uint64_t v7 = *(void *)parser;
  uint64_t v6 = *((void *)parser + 1);
  char v8 = *((_BYTE *)parser + 600);
  uint64_t v9 = (XML_ParserStruct *)*((void *)parser + 31);
  int v68 = *((_DWORD *)parser + 233);
  int v66 = *((_DWORD *)parser + 134);
  char v10 = *((_BYTE *)parser + 473);
  uint64_t v11 = *((void *)parser + 117);
  char v12 = *((_BYTE *)parser + 96);
  uint64_t v71 = *((void *)parser + 86);
  if (context) {
    uint64_t v13 = 0LL;
  }
  else {
    uint64_t v13 = *((void *)parser + 86);
  }
  if (*((_BYTE *)parser + 472))
  {
    __int16 v72 = *((unsigned __int8 *)parser + 908);
    uint64_t v14 = (__int128 *)((char *)parser + 24);
    uint64_t v15 = &v72;
    uint64_t v16 = (unsigned __int8 *)encoding;
  }

  else
  {
    uint64_t v14 = (__int128 *)((char *)parser + 24);
    uint64_t v16 = (unsigned __int8 *)encoding;
    uint64_t v15 = 0LL;
  }

  uint64_t v17 = parserCreate(v16, v14, v15, v13);
  uint64_t v18 = v17;
  if (v17)
  {
    *(_OWORD *)(v17 + 120) = v65;
    *(_OWORD *)(v17 + 136) = v64;
    *(_OWORD *)(v17 + 152) = v63;
    *(_OWORD *)(v17 + 168) = v62;
    *(_OWORD *)(v17 + 200) = v61;
    *(_OWORD *)(v17 + 216) = v60;
    *(_OWORD *)(v17 + 232) = v59;
    *(_OWORD *)(v17 + 256) = v58;
    *(_OWORD *)(v17 + 272) = v57;
    *(_OWORD *)(v17 + 288) = v56;
    *(void *)(v17 + 664) = v5;
    if (v7 == v6) {
      uint64_t v19 = v7;
    }
    else {
      uint64_t v19 = v17;
    }
    *(void *)uint64_t v17 = v7;
    *(void *)(v17 + 8) = v19;
    if (v9 != parser) {
      *(void *)(v17 + 248) = v9;
    }
    *(_BYTE *)(v17 + 600) = v8;
    *(_BYTE *)(v17 + 473) = v10;
    *(void *)(v17 + 936) = v11;
    *(_BYTE *)(v17 + 96) = v12;
    *(void *)(v17 + 912) = parser;
    *(_DWORD *)(v17 + 932) = v68;
    *(_DWORD *)(v17 + 536) = v66;
    if (context)
    {
      uint64_t v20 = *(void *)(v17 + 688);
      v21 = *(char ****)(v71 + 120);
      if (v21) {
        v22 = &v21[*(void *)(v71 + 136)];
      }
      else {
        v22 = 0LL;
      }
      while (v21 != v22)
      {
        v25 = *v21++;
        v24 = v25;
        if (v25)
        {
          uint64_t v26 = (char *)poolCopyString((uint64_t *)(v20 + 160), *v24);
        }
      }

      unint64_t v28 = *(uint64_t **)(v71 + 80);
      if (v28) {
        unint64_t v29 = &v28[*(void *)(v71 + 96)];
      }
      else {
        unint64_t v29 = 0LL;
      }
      while (v28 != v29)
      {
        uint64_t v31 = *v28++;
        uint64_t v30 = v31;
        if (v31)
        {
          unint64_t v32 = *(_BYTE **)(v20 + 184);
          if (v32 == *(_BYTE **)(v20 + 176))
          {
            unint64_t v32 = *(_BYTE **)(v20 + 184);
          }

          *(void *)(v20 + 184) = v32 + 1;
          *unint64_t v32 = 0;
          uint64_t v33 = poolCopyString((uint64_t *)(v20 + 160), *(char **)v30);
          if (!v33) {
            goto LABEL_24;
          }
          v34 = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), (char *)(v33 + 1), 0x18uLL);
          if (!v34) {
            goto LABEL_24;
          }
          v35 = v34;
          *((_BYTE *)v34 + 16) = *(_BYTE *)(v30 + 16);
          v36 = *(char ***)(v30 + 8);
          if (v36)
          {
            *((_BYTE *)v34 + 17) = *(_BYTE *)(v30 + 17);
            v37 = (_OWORD *)(v20 + 304);
            *((void *)v35 + 1) = v37;
          }
        }
      }

      v38 = *(uint64_t **)(v71 + 40);
      if (v38) {
        v67 = &v38[*(void *)(v71 + 56)];
      }
      else {
        v67 = 0LL;
      }
      while (v38 != v67)
      {
        uint64_t v40 = *v38++;
        uint64_t v39 = v40;
        if (v40)
        {
          v69 = v38;
          v41 = (char *)poolCopyString((uint64_t *)(v20 + 160), *(char **)v39);
          if (!v41) {
            goto LABEL_24;
          }
          v42 = lookup((uint64_t)parser, (uint64_t *)(v20 + 40), v41, 0x28uLL);
          if (!v42) {
            goto LABEL_24;
          }
          v43 = v42;
          uint64_t v44 = *(int *)(v39 + 24);
          if ((_DWORD)v44)
          {
            uint64_t v45 = (*(uint64_t (**)(uint64_t))(v18 + 24))(24 * v44);
            *((void *)v43 + 4) = v45;
            if (!v45) {
              goto LABEL_24;
            }
          }

          v46 = *(char ***)(v39 + 16);
          if (v46) {
            *((void *)v43 + 2) = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), *v46, 0LL);
          }
          int v47 = *(_DWORD *)(v39 + 24);
          *((_DWORD *)v43 + 6) = v47;
          *((_DWORD *)v43 + 7) = v47;
          v48 = *(char ***)(v39 + 8);
          if (v48)
          {
            *((void *)v43 + 1) = lookup((uint64_t)parser, (uint64_t *)(v20 + 120), *v48, 0LL);
            int v47 = *((_DWORD *)v43 + 6);
          }

          v38 = v69;
          if (v47 >= 1)
          {
            uint64_t v49 = 0LL;
            uint64_t v50 = 0LL;
            do
            {
              v51 = lookup((uint64_t)parser, (uint64_t *)(v20 + 80), **(char ***)(*(void *)(v39 + 32) + v49), 0LL);
              uint64_t v52 = *((void *)v43 + 4) + v49;
              *(void *)uint64_t v52 = v51;
              uint64_t v53 = *(void *)(v39 + 32) + v49;
              *(_BYTE *)(v52 + 8) = *(_BYTE *)(v53 + 8);
              v54 = *(char **)(v53 + 16);
              if (v54)
              {
                uint64_t v55 = poolCopyString((uint64_t *)(v20 + 160), v54);
                *(void *)(*((void *)v43 + 4) + v49 + 16) = v55;
                if (!v55) {
                  goto LABEL_24;
                }
              }

              else
              {
                *(void *)(v52 + 16) = 0LL;
              }

              ++v50;
              v49 += 24LL;
            }

            while (v50 < *((int *)v43 + 6));
            v38 = v69;
          }
        }
      }

      if (!copyEntityTable((uint64_t)parser, (uint64_t *)v20, (uint64_t *)(v20 + 160), v71)
        || !copyEntityTable((uint64_t)parser, (uint64_t *)(v20 + 264), (uint64_t *)(v20 + 160), v71 + 264)
        || (*(_DWORD *)(v20 + 256) = *(_DWORD *)(v71 + 256),
            *(_BYTE *)(v20 + 320) = *(_BYTE *)(v71 + 320),
            *(void *)(v20 + 328) = *(void *)(v71 + 328),
            *(void *)(v20 + 336) = *(void *)(v71 + 336),
            *(_DWORD *)(v20 + 348) = *(_DWORD *)(v71 + 348),
            *(void *)(v20 + 352) = *(void *)(v71 + 352),
            !setContext(v18, context)))
      {
LABEL_24:
        XML_ParserFree((XML_Parser)v18);
        return 0LL;
      }

      uint64_t v23 = externalEntityInitProcessor;
    }

    else
    {
      *(_BYTE *)(v17 + 928) = 1;
      XmlPrologStateInitExternalEntity((void *)(v17 + 512));
      uint64_t v23 = externalParEntInitProcessor;
    }

    *(void *)(v18 + 544) = v23;
  }

  return (XML_Parser)v18;
}

uint64_t setContext(uint64_t a1, _BYTE *a2)
{
  if (!a2) {
    return 0LL;
  }
  XML_Parser v2 = a2;
  uint64_t v3 = 1LL;
  if (*a2)
  {
    uint64_t v5 = (uint64_t *)(a1 + 800);
    uint64_t v6 = *(uint64_t **)(a1 + 688);
    uint64_t v7 = (uint64_t *)(a1 + 720);
    char v8 = a2;
    while (1)
    {
      int v9 = *v2;
      if (*v2)
      {
        if (v9 == 61)
        {
          char v12 = *(_BYTE **)(a1 + 824);
          uint64_t v13 = v6 + 38;
          if (v12 == *(_BYTE **)(a1 + 832)) {
            goto LABEL_29;
          }
          if (v12 == *(_BYTE **)(a1 + 816))
          {
            char v12 = *(_BYTE **)(a1 + 824);
          }

          *(void *)(a1 + 824) = v12 + 1;
          *char v12 = 0;
          uint64_t v14 = (char **)lookup(a1, v6 + 15, *(char **)(a1 + 832), 0x10uLL);
          if (!v14) {
            return 0LL;
          }
          uint64_t v13 = v14;
          uint64_t v15 = *(char **)(a1 + 832);
          if (*v14 == v15)
          {
            uint64_t v16 = poolCopyString(v6 + 20, *v14);
            void *v13 = v16;
            if (!v16) {
              return 0LL;
            }
            uint64_t v15 = *(char **)(a1 + 832);
          }

          *(void *)(a1 + 824) = v15;
LABEL_29:
          while (1)
          {
            int v19 = *++v2;
            int v18 = v19;
            if (!v19 || v18 == 12) {
              break;
            }
            uint64_t v17 = *(_BYTE **)(a1 + 824);
            if (v17 == *(_BYTE **)(a1 + 816))
            {
              LOBYTE(v18) = *v2;
              uint64_t v17 = *(_BYTE **)(a1 + 824);
            }

            *(void *)(a1 + 824) = v17 + 1;
            _BYTE *v17 = v18;
          }

          v21 = *(_BYTE **)(a1 + 824);
          if (v21 == *(_BYTE **)(a1 + 816))
          {
            v21 = *(_BYTE **)(a1 + 824);
          }

          *(void *)(a1 + 824) = v21 + 1;
          _BYTE *v21 = 0;
          *(void *)(a1 + 824) = *(void *)(a1 + 832);
          if (*v2) {
            char v8 = v2 + 1;
          }
          else {
            char v8 = v2;
          }
          goto LABEL_41;
        }

        if (v9 != 12)
        {
          v22 = *(_BYTE **)(a1 + 824);
          if (v22 == *(_BYTE **)(a1 + 816))
          {
            LOBYTE(v9) = *v2;
            v22 = *(_BYTE **)(a1 + 824);
          }

          *(void *)(a1 + 824) = v22 + 1;
          _BYTE *v22 = v9;
          ++v2;
          goto LABEL_46;
        }
      }

      char v10 = *(_BYTE **)(a1 + 824);
      if (v10 == *(_BYTE **)(a1 + 816))
      {
        char v10 = *(_BYTE **)(a1 + 824);
      }

      *(void *)(a1 + 824) = v10 + 1;
      *char v10 = 0;
      uint64_t v11 = lookup(a1, v6, *(char **)(a1 + 832), 0LL);
      if (v11) {
        *((_BYTE *)v11 + 56) = 1;
      }
      if (*v2) {
        char v8 = v2 + 1;
      }
      else {
        char v8 = v2;
      }
      *(void *)(a1 + 824) = *(void *)(a1 + 832);
LABEL_41:
      XML_Parser v2 = v8;
LABEL_46:
      if (!*v8) {
        return 1LL;
      }
    }
  }

  return v3;
}

void XML_ParserFree(XML_Parser parser)
{
  if (parser)
  {
    XML_Parser v2 = (void *)*((void *)parser + 88);
    if (v2) {
      goto LABEL_5;
    }
    while (1)
    {
      XML_Parser v2 = (void *)*((void *)parser + 89);
      if (!v2) {
        break;
      }
      *((void *)parser + 89) = 0LL;
      do
      {
LABEL_5:
        uint64_t v3 = (void *)*v2;
        (*((void (**)(void))parser + 5))(v2[8]);
        uint64_t v4 = v2[10];
        if (v4)
        {
          do
          {
            uint64_t v5 = *(void *)(v4 + 8);
            (*((void (**)(void))parser + 5))(*(void *)(v4 + 32));
            (*((void (**)(uint64_t))parser + 5))(v4);
            uint64_t v4 = v5;
          }

          while (v5);
        }

        (*((void (**)(void *))parser + 5))(v2);
        XML_Parser v2 = v3;
      }

      while (v3);
    }

    uint64_t v6 = *((void *)parser + 73);
    if (v6) {
      goto LABEL_12;
    }
    while (1)
    {
      uint64_t v6 = *((void *)parser + 74);
      if (!v6) {
        break;
      }
      *((void *)parser + 74) = 0LL;
      do
      {
LABEL_12:
        uint64_t v7 = *(void *)(v6 + 16);
        (*((void (**)(void))parser + 5))();
        uint64_t v6 = v7;
      }

      while (v7);
    }

    uint64_t v8 = *((void *)parser + 91);
    if (v8)
    {
      do
      {
        uint64_t v9 = *(void *)(v8 + 8);
        (*((void (**)(void))parser + 5))(*(void *)(v8 + 32));
        (*((void (**)(uint64_t))parser + 5))(v8);
        uint64_t v8 = v9;
      }

      while (v9);
    }

    uint64_t v10 = *((void *)parser + 90);
    if (v10)
    {
      do
      {
        uint64_t v11 = *(void *)(v10 + 8);
        (*((void (**)(void))parser + 5))(*(void *)(v10 + 32));
        (*((void (**)(uint64_t))parser + 5))(v10);
        uint64_t v10 = v11;
      }

      while (v11);
    }

    poolDestroy((uint64_t)parser + 800);
    poolDestroy((uint64_t)parser + 848);
    (*((void (**)(void))parser + 5))(*((void *)parser + 58));
    if (!*((_BYTE *)parser + 928))
    {
      char v12 = (void *)*((void *)parser + 86);
      if (v12)
      {
        uint64_t v13 = (uint64_t *)v12[5];
        if (v13) {
          uint64_t v14 = &v13[v12[7]];
        }
        else {
          uint64_t v14 = 0LL;
        }
        uint64_t v15 = *((void *)parser + 114);
        while (v13 != v14)
        {
          uint64_t v17 = *v13++;
          uint64_t v16 = v17;
          if (v17 && *(_DWORD *)(v16 + 28)) {
            (*((void (**)(void))parser + 5))(*(void *)(v16 + 32));
          }
        }

        hashTableDestroy(v12);
        hashTableDestroy(v12 + 33);
        hashTableDestroy(v12 + 5);
        hashTableDestroy(v12 + 10);
        hashTableDestroy(v12 + 15);
        poolDestroy((uint64_t)(v12 + 20));
        poolDestroy((uint64_t)(v12 + 26));
        if (!v15)
        {
          (*((void (**)(void))parser + 5))(v12[44]);
          (*((void (**)(void))parser + 5))(v12[41]);
        }

        (*((void (**)(void *))parser + 5))(v12);
      }
    }

    (*((void (**)(void))parser + 5))(*((void *)parser + 94));
    (*((void (**)(void))parser + 5))(*((void *)parser + 112));
    (*((void (**)(void))parser + 5))(*((void *)parser + 2));
    (*((void (**)(void))parser + 5))(*((void *)parser + 13));
    (*((void (**)(void))parser + 5))(*((void *)parser + 95));
    (*((void (**)(void))parser + 5))(*((void *)parser + 60));
    int v18 = (void (*)(void))*((void *)parser + 63);
    if (v18) {
      v18(*((void *)parser + 61));
    }
    (*((void (**)(XML_Parser))parser + 5))(parser);
  }
}

uint64_t externalEntityInitProcessor(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(void *)(a1 + 544) = externalEntityInitProcessor2;
    return externalEntityInitProcessor2(a1, a2, a3, a4);
  }

  return result;
}

uint64_t externalParEntInitProcessor( uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(_BYTE *)(*(void *)(a1 + 688) + 259LL) = 1;
    if (*(_DWORD *)(a1 + 536))
    {
      *(void *)(a1 + 544) = entityValueInitProcessor;
      return entityValueInitProcessor(a1, a2, (uint64_t)a3, a4);
    }

    else
    {
      *(void *)(a1 + 544) = externalParEntProcessor;
      return externalParEntProcessor(a1, a2, a3, a4);
    }
  }

  return result;
}

void *poolDestroy(uint64_t a1)
{
  XML_Parser v2 = *(void **)a1;
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)*v2;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      XML_Parser v2 = v3;
    }

    while (v3);
  }

  uint64_t result = *(void **)(a1 + 8);
  if (result)
  {
    do
    {
      uint64_t v5 = (void *)*result;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
      uint64_t result = v5;
    }

    while (v5);
  }

  return result;
}

void XML_UseParserAsHandlerArg(XML_Parser parser)
{
  if (parser) {
    *((void *)parser + 1) = parser;
  }
}

XML_Error XML_UseForeignDTD(XML_Parser parser, XML_Bool useDTD)
{
  if (!parser) {
    return 41;
  }
  if ((*((_DWORD *)parser + 230) | 2) == 3) {
    return 26;
  }
  XML_Error result = XML_ERROR_NONE;
  *((_BYTE *)parser + 929) = useDTD;
  return result;
}

void XML_SetReturnNSTriplet(XML_Parser parser, int do_nst)
{
  if (parser)
  {
    if ((*((_DWORD *)parser + 230) | 2) != 3) {
      *((_BYTE *)parser + 473) = do_nst != 0;
    }
  }

void XML_SetUserData(XML_Parser parser, void *userData)
{
  if (parser)
  {
    uint64_t v3 = *(void *)parser;
    uint64_t v2 = *((void *)parser + 1);
    *(void *)parser = userData;
    if (v2 == v3) {
      *((void *)parser + 1) = userData;
    }
  }

XML_Status XML_SetBase(XML_Parser parser, const XML_Char *base)
{
  if (parser)
  {
    XML_Parser v2 = parser;
    if (base)
    {
      parser = (XML_Parser)poolCopyString((uint64_t *)(*((void *)parser + 86) + 160LL), (char *)base);
      if (!parser) {
        return parser;
      }
    }

    else
    {
      parser = 0LL;
    }

    *((void *)v2 + 87) = parser;
    LODWORD(parser) = 1;
  }

  return parser;
}

uint64_t poolCopyString(uint64_t *a1, char *a2)
{
  while (1)
  {
    uint64_t v4 = (_BYTE *)a1[3];
    if (v4 == (_BYTE *)a1[2]) {
      break;
    }
LABEL_4:
    char v5 = *a2;
    a1[3] = (uint64_t)(v4 + 1);
    _BYTE *v4 = v5;
    if (!*a2++)
    {
      uint64_t result = a1[4];
      a1[4] = a1[3];
      return result;
    }
  }

  if (poolGrow(a1))
  {
    uint64_t v4 = (_BYTE *)a1[3];
    goto LABEL_4;
  }

  return 0LL;
}

const XML_Char *__cdecl XML_GetBase(const XML_Char *parser)
{
  if (parser) {
    return (const XML_Char *)*((void *)parser + 87);
  }
  return parser;
}

int XML_GetSpecifiedAttributeCount(XML_Parser parser)
{
  if (parser) {
    return *((_DWORD *)parser + 185);
  }
  else {
    return -1;
  }
}

int XML_GetIdAttributeIndex(XML_Parser parser)
{
  if (parser) {
    return *((_DWORD *)parser + 186);
  }
  else {
    return -1;
  }
}

void XML_SetElementHandler(XML_Parser parser, XML_StartElementHandler start, XML_EndElementHandler end)
{
  if (parser)
  {
    *((void *)parser + 15) = start;
    *((void *)parser + 16) = end;
  }

void XML_SetStartElementHandler(XML_Parser parser, XML_StartElementHandler handler)
{
  if (parser) {
    *((void *)parser + 15) = handler;
  }
}

void XML_SetEndElementHandler(XML_Parser parser, XML_EndElementHandler handler)
{
  if (parser) {
    *((void *)parser + 16) = handler;
  }
}

void XML_SetCharacterDataHandler(XML_Parser parser, XML_CharacterDataHandler handler)
{
  if (parser) {
    *((void *)parser + 17) = handler;
  }
}

void XML_SetProcessingInstructionHandler(XML_Parser parser, XML_ProcessingInstructionHandler handler)
{
  if (parser) {
    *((void *)parser + 18) = handler;
  }
}

void XML_SetCommentHandler(XML_Parser parser, XML_CommentHandler handler)
{
  if (parser) {
    *((void *)parser + 19) = handler;
  }
}

void XML_SetCdataSectionHandler( XML_Parser parser, XML_StartCdataSectionHandler start, XML_EndCdataSectionHandler end)
{
  if (parser)
  {
    *((void *)parser + 20) = start;
    *((void *)parser + 21) = end;
  }

void XML_SetStartCdataSectionHandler(XML_Parser parser, XML_StartCdataSectionHandler start)
{
  if (parser) {
    *((void *)parser + 20) = start;
  }
}

void XML_SetEndCdataSectionHandler(XML_Parser parser, XML_EndCdataSectionHandler end)
{
  if (parser) {
    *((void *)parser + 21) = end;
  }
}

void XML_SetDefaultHandler(XML_Parser parser, XML_DefaultHandler handler)
{
  if (parser)
  {
    *((void *)parser + 22) = handler;
    *((_BYTE *)parser + 600) = 0;
  }

void XML_SetDefaultHandlerExpand(XML_Parser parser, XML_DefaultHandler handler)
{
  if (parser)
  {
    *((void *)parser + 22) = handler;
    *((_BYTE *)parser + 600) = 1;
  }

void XML_SetDoctypeDeclHandler( XML_Parser parser, XML_StartDoctypeDeclHandler start, XML_EndDoctypeDeclHandler end)
{
  if (parser)
  {
    *((void *)parser + 23) = start;
    *((void *)parser + 24) = end;
  }

void XML_SetStartDoctypeDeclHandler(XML_Parser parser, XML_StartDoctypeDeclHandler start)
{
  if (parser) {
    *((void *)parser + 23) = start;
  }
}

void XML_SetEndDoctypeDeclHandler(XML_Parser parser, XML_EndDoctypeDeclHandler end)
{
  if (parser) {
    *((void *)parser + 24) = end;
  }
}

void XML_SetUnparsedEntityDeclHandler(XML_Parser parser, XML_UnparsedEntityDeclHandler handler)
{
  if (parser) {
    *((void *)parser + 25) = handler;
  }
}

void XML_SetNotationDeclHandler(XML_Parser parser, XML_NotationDeclHandler handler)
{
  if (parser) {
    *((void *)parser + 26) = handler;
  }
}

void XML_SetNamespaceDeclHandler( XML_Parser parser, XML_StartNamespaceDeclHandler start, XML_EndNamespaceDeclHandler end)
{
  if (parser)
  {
    *((void *)parser + 27) = start;
    *((void *)parser + 28) = end;
  }

void XML_SetStartNamespaceDeclHandler(XML_Parser parser, XML_StartNamespaceDeclHandler start)
{
  if (parser) {
    *((void *)parser + 27) = start;
  }
}

void XML_SetEndNamespaceDeclHandler(XML_Parser parser, XML_EndNamespaceDeclHandler end)
{
  if (parser) {
    *((void *)parser + 28) = end;
  }
}

void XML_SetNotStandaloneHandler(XML_Parser parser, XML_NotStandaloneHandler handler)
{
  if (parser) {
    *((void *)parser + 29) = handler;
  }
}

void XML_SetExternalEntityRefHandler(XML_Parser parser, XML_ExternalEntityRefHandler handler)
{
  if (parser) {
    *((void *)parser + 30) = handler;
  }
}

void XML_SetExternalEntityRefHandlerArg(XML_Parser parser, void *arg)
{
  if (parser)
  {
    if (arg) {
      XML_Parser v2 = arg;
    }
    else {
      XML_Parser v2 = parser;
    }
    *((void *)parser + 31) = v2;
  }

void XML_SetSkippedEntityHandler(XML_Parser parser, XML_SkippedEntityHandler handler)
{
  if (parser) {
    *((void *)parser + 32) = handler;
  }
}

void XML_SetUnknownEncodingHandler( XML_Parser parser, XML_UnknownEncodingHandler handler, void *encodingHandlerData)
{
  if (parser)
  {
    *((void *)parser + 33) = handler;
    *((void *)parser + 62) = encodingHandlerData;
  }

void XML_SetElementDeclHandler(XML_Parser parser, XML_ElementDeclHandler eldecl)
{
  if (parser) {
    *((void *)parser + 34) = eldecl;
  }
}

void XML_SetAttlistDeclHandler(XML_Parser parser, XML_AttlistDeclHandler attdecl)
{
  if (parser) {
    *((void *)parser + 35) = attdecl;
  }
}

void XML_SetEntityDeclHandler(XML_Parser parser, XML_EntityDeclHandler handler)
{
  if (parser) {
    *((void *)parser + 36) = handler;
  }
}

void XML_SetXmlDeclHandler(XML_Parser parser, XML_XmlDeclHandler xmldecl)
{
  if (parser) {
    *((void *)parser + 37) = xmldecl;
  }
}

int XML_SetParamEntityParsing(XML_Parser parser, XML_ParamEntityParsing parsing)
{
  if (parser)
  {
    if ((*((_DWORD *)parser + 230) | 2) == 3)
    {
      LODWORD(parser) = 0;
    }

    else
    {
      *((_DWORD *)parser + 233) = parsing;
      LODWORD(parser) = 1;
    }
  }

  return (int)parser;
}

int XML_SetHashSalt(XML_Parser parser, unint64_t hash_salt)
{
  while (parser)
  {
    XML_Parser v2 = parser;
    parser = (XML_Parser)*((void *)parser + 114);
    if (!parser)
    {
      if ((*((_DWORD *)v2 + 230) | 2) == 3)
      {
        LODWORD(parser) = 0;
      }

      else
      {
        *((void *)v2 + 117) = hash_salt;
        LODWORD(parser) = 1;
      }

      return (int)parser;
    }
  }

  return (int)parser;
}

XML_Status XML_Parse(XML_Parser parser, const char *s, int len, int isFinal)
{
  if (!parser || len < 0)
  {
    if (!parser) {
      return 0;
    }
    goto LABEL_10;
  }

  if (!s && len)
  {
LABEL_10:
    int v9 = 41;
    goto LABEL_11;
  }

  int v8 = *((_DWORD *)parser + 230);
  if (v8)
  {
    if (v8 == 2)
    {
      int v9 = 36;
      goto LABEL_11;
    }

    if (v8 == 3)
    {
      int v9 = 33;
LABEL_11:
      *((_DWORD *)parser + 138) = v9;
      return 0;
    }
  }

  else if (!*((void *)parser + 114) && !startParsing((uint64_t)parser))
  {
    int v9 = 1;
    goto LABEL_11;
  }

  *((_DWORD *)parser + 230) = 1;
  Buffer = XML_GetBuffer(parser, len);
  if (!Buffer) {
    return 0;
  }
  if (len)
  {
    if (!s) {
      XML_Parse_cold_1();
    }
    memcpy(Buffer, s, len);
  }

  return XML_ParseBuffer(parser, len, isFinal);
}

uint64_t startParsing(uint64_t a1)
{
  if (!*(void *)(a1 + 936))
  {
    arc4random_buf(&__buf, 8uLL);
    uint64_t v2 = __buf;
    if (getDebugLevel("EXPAT_ENTROPY_DEBUG")) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "expat: Entropy: %s --> 0x%0*lx (%lu bytes)\n",  "arc4random_buf",  16,  v2,  8LL);
    }
    *(void *)(a1 + 936) = v2;
  }

  if (*(_BYTE *)(a1 + 472)) {
    return setContext(a1, "xml=http://www.w3.org/XML/1998/namespace");
  }
  else {
    return 1LL;
  }
}

void *__cdecl XML_GetBuffer(void *parser, int len)
{
  if (parser)
  {
    uint64_t v2 = parser;
    if (len < 0) {
      goto LABEL_56;
    }
    int v3 = *((_DWORD *)parser + 230);
    if (v3 == 2)
    {
      parser = 0LL;
      int v4 = 36;
      goto LABEL_58;
    }

    if (v3 == 3)
    {
      parser = 0LL;
      int v4 = 33;
LABEL_58:
      *((_DWORD *)v2 + 138) = v4;
      return parser;
    }

    *((_DWORD *)parser + 25) = len;
    uint64_t v5 = *((void *)parser + 8);
    if (v5)
    {
      uint64_t v6 = *((void *)parser + 7);
      if (v6) {
        uint64_t v7 = v5 - v6;
      }
      else {
        uint64_t v7 = 0LL;
      }
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    parser = (void *)*((void *)parser + 7);
    if (parser)
    {
      uint64_t v8 = *((void *)v2 + 6);
      int v9 = v8 ? (_DWORD)parser - v8 : 0;
    }

    else
    {
      int v9 = 0;
    }

    int v10 = v9 + len;
    if (v10 < 0) {
      goto LABEL_56;
    }
    uint64_t v11 = *((void *)v2 + 6);
    if (v11)
    {
      uint64_t v12 = *((void *)v2 + 2);
      int v13 = v12 ? v11 - v12 : 0;
    }

    else
    {
      int v13 = 0;
    }

    int v14 = v13 >= 1024 ? 1024 : v13;
    if (v14 > (v10 ^ 0x7FFFFFFF)) {
      goto LABEL_56;
    }
    int v15 = v14 + v10;
    uint64_t v16 = *((void *)v2 + 2);
    if (!v16) {
      goto LABEL_41;
    }
    if (v11)
    {
      LODWORD(v17) = v5 - v16;
      if (v5) {
        uint64_t v18 = v5 - v16;
      }
      else {
        uint64_t v18 = 0LL;
      }
      if (v18 >= v15)
      {
        if (v11 - v16 <= v14)
        {
LABEL_62:
          *((void *)v2 + 72) = 0LL;
          *((_OWORD *)v2 + 35) = 0u;
          return parser;
        }

        uint64_t v19 = (int)v11 - (int)v16 - (uint64_t)v14;
        memmove(*((void **)v2 + 2), (const void *)(v16 + v19), (size_t)parser + v14 - v11);
        uint64_t v20 = *((void *)v2 + 6);
        parser = (void *)(*((void *)v2 + 7) - v19);
        *((void *)v2 + 7) = parser;
        v21 = (char *)(v20 - v19);
LABEL_61:
        *((void *)v2 + 6) = v21;
        goto LABEL_62;
      }
    }

    else
    {
      LODWORD(v17) = v5 - v16;
    }

    if (!v5 || !(_DWORD)v17) {
LABEL_41:
    }
      LODWORD(v17) = 1024;
    do
      uint64_t v17 = (2 * v17);
    while ((int)v17 < v15 && (int)v17 > 0);
    if ((int)v17 <= 0)
    {
LABEL_56:
      parser = 0LL;
    }

    else
    {
      parser = (void *)(*((uint64_t (**)(uint64_t))v2 + 3))(v17);
      if (parser)
      {
        v21 = (char *)parser;
        *((void *)v2 + 8) = (char *)parser + v17;
        uint64_t v23 = *((void *)v2 + 6);
        if (v23)
        {
          v24 = (const void *)(v23 - v14);
          uint64_t v25 = *((void *)v2 + 7);
          uint64_t v26 = v25 - v23;
          if (!v25) {
            uint64_t v26 = 0LL;
          }
          memcpy(parser, v24, v26 + v14);
          (*((void (**)(void))v2 + 5))(*((void *)v2 + 2));
          *((void *)v2 + 2) = v21;
          uint64_t v27 = *((void *)v2 + 7);
          if (v27)
          {
            uint64_t v28 = *((void *)v2 + 6);
            v27 -= v28;
            if (!v28) {
              uint64_t v27 = 0LL;
            }
          }

          v21 += v14;
          parser = &v21[v27];
          *((void *)v2 + 7) = &v21[v27];
        }

        else
        {
          *((void *)v2 + 7) = parser;
          *((void *)v2 + 2) = parser;
        }

        goto LABEL_61;
      }
    }

    int v4 = 1;
    goto LABEL_58;
  }

  return parser;
}

XML_Status XML_ParseBuffer(XML_Parser parser, int len, int isFinal)
{
  if (parser)
  {
    if (len < 0)
    {
      XML_Status v7 = XML_STATUS_ERROR;
      int v8 = 41;
      goto LABEL_24;
    }

    int v6 = *((_DWORD *)parser + 230);
    if (v6)
    {
      if (v6 == 2)
      {
        XML_Status v7 = XML_STATUS_ERROR;
        int v8 = 36;
        goto LABEL_24;
      }

      if (v6 == 3)
      {
        XML_Status v7 = XML_STATUS_ERROR;
        int v8 = 33;
LABEL_24:
        *((_DWORD *)parser + 138) = v8;
        return v7;
      }
    }

    else
    {
      if (!*((void *)parser + 6))
      {
        XML_Status v7 = XML_STATUS_ERROR;
        int v8 = 42;
        goto LABEL_24;
      }

      if (!*((void *)parser + 114) && !startParsing((uint64_t)parser))
      {
        XML_Status v7 = XML_STATUS_ERROR;
        int v8 = 1;
        goto LABEL_24;
      }
    }

    *((_DWORD *)parser + 230) = 1;
    uint64_t v9 = *((void *)parser + 6);
    *((void *)parser + 72) = v9;
    uint64_t v10 = *((void *)parser + 7) + len;
    *((void *)parser + 7) = v10;
    *((void *)parser + 9) += len;
    *((void *)parser + 10) = v10;
    *((_BYTE *)parser + 924) = isFinal;
    int v11 = callProcessor((uint64_t)parser, v9, v10, (void *)parser + 6);
    *((_DWORD *)parser + 138) = v11;
    if (v11)
    {
      XML_Status v7 = XML_STATUS_ERROR;
      *((void *)parser + 71) = *((void *)parser + 70);
      *((void *)parser + 68) = errorProcessor;
      return v7;
    }

    unsigned int v12 = *((_DWORD *)parser + 230);
    if (v12 >= 2)
    {
      if (v12 == 3)
      {
        XML_Status v7 = XML_STATUS_SUSPENDED;
LABEL_22:
        (*(void (**)(void))(*((void *)parser + 38) + 96LL))();
        *((void *)parser + 72) = *((void *)parser + 6);
        return v7;
      }
    }

    else if (isFinal)
    {
      *((_DWORD *)parser + 230) = 2;
      return 1;
    }

    XML_Status v7 = XML_STATUS_OK;
    goto LABEL_22;
  }

  return 0;
}

uint64_t callProcessor(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  if (a3) {
    BOOL v7 = a2 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    unint64_t v8 = 0LL;
  }
  else {
    unint64_t v8 = a3 - a2;
  }
  if (!*(_BYTE *)(a1 + 96) || *(_BYTE *)(a1 + 924)) {
    goto LABEL_19;
  }
  unint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    uint64_t v10 = *(void *)(a1 + 16);
    v9 -= v10;
    if (!v10) {
      unint64_t v9 = 0LL;
    }
  }

  BOOL v11 = v9 >= 0x400;
  unint64_t v12 = v9 - 1024;
  if (!v11) {
    unint64_t v12 = 0LL;
  }
  uint64_t v13 = *(void *)(a1 + 64);
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 56);
    v13 -= v14;
    if (!v14) {
      uint64_t v13 = 0LL;
    }
  }

  if (v8 < 2LL * *(void *)(a1 + 88) && v13 + v12 >= *(int *)(a1 + 100))
  {
    uint64_t result = 0LL;
    *a4 = a2;
  }

  else
  {
LABEL_19:
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 544))(a1, a2);
    if (!(_DWORD)result)
    {
      uint64_t result = 0LL;
      if (*a4 == a2) {
        *(void *)(a1 + 88) = v8;
      }
      else {
        *(void *)(a1 + 88) = 0LL;
      }
    }
  }

  return result;
}

uint64_t errorProcessor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 552);
}

XML_Status XML_StopParser(XML_Parser parser, XML_Bool resumable)
{
  if (parser)
  {
    int v2 = *((_DWORD *)parser + 230);
    if (v2 == 2)
    {
      XML_Status v3 = XML_STATUS_ERROR;
      int v4 = 36;
      goto LABEL_11;
    }

    if (v2 == 3)
    {
      if (resumable)
      {
        XML_Status v3 = XML_STATUS_ERROR;
        int v4 = 33;
LABEL_11:
        *((_DWORD *)parser + 138) = v4;
        return v3;
      }
    }

    else if (resumable)
    {
      if (*((_BYTE *)parser + 928))
      {
        XML_Status v3 = XML_STATUS_ERROR;
        int v4 = 37;
        goto LABEL_11;
      }

      int v5 = 3;
LABEL_14:
      *((_DWORD *)parser + 230) = v5;
      return 1;
    }

    int v5 = 2;
    goto LABEL_14;
  }

  return 0;
}

XML_Status XML_ResumeParser(XML_Parser parser)
{
  if (!parser) {
    return 0;
  }
  if (*((_DWORD *)parser + 230) == 3)
  {
    *((_DWORD *)parser + 230) = 1;
    int v2 = callProcessor((uint64_t)parser, *((void *)parser + 6), *((void *)parser + 10), (void *)parser + 6);
    *((_DWORD *)parser + 138) = v2;
    if (!v2)
    {
      unsigned int v4 = *((_DWORD *)parser + 230);
      if (v4 >= 2)
      {
        if (v4 == 3) {
          XML_Status v3 = XML_STATUS_SUSPENDED;
        }
        else {
          XML_Status v3 = XML_STATUS_OK;
        }
      }

      else
      {
        if (*((_BYTE *)parser + 924))
        {
          *((_DWORD *)parser + 230) = 2;
          return 1;
        }

        XML_Status v3 = XML_STATUS_OK;
      }

      (*(void (**)(void))(*((void *)parser + 38) + 96LL))();
      *((void *)parser + 72) = *((void *)parser + 6);
      return v3;
    }

    XML_Status v3 = XML_STATUS_ERROR;
    *((void *)parser + 71) = *((void *)parser + 70);
    *((void *)parser + 68) = errorProcessor;
  }

  else
  {
    XML_Status v3 = XML_STATUS_ERROR;
    *((_DWORD *)parser + 138) = 34;
  }

  return v3;
}

void XML_GetParsingStatus(XML_Parser parser, XML_ParsingStatus *status)
{
  if (parser)
  {
    if (!status) {
      XML_GetParsingStatus_cold_1();
    }
    *status = *(XML_ParsingStatus *)((char *)parser + 920);
  }

XML_Error XML_GetErrorCode(XML_Parser parser)
{
  if (parser) {
    return *((_DWORD *)parser + 138);
  }
  else {
    return 41;
  }
}

XML_Index XML_GetCurrentByteIndex(XML_Parser parser)
{
  if (parser && (uint64_t v1 = *((void *)parser + 70)) != 0) {
    return *((void *)parser + 9) + v1 - *((void *)parser + 10);
  }
  else {
    return -1LL;
  }
}

int XML_GetCurrentByteCount(XML_Parser parser)
{
  if (parser)
  {
    uint64_t v1 = *((void *)parser + 71);
    if (v1)
    {
      uint64_t v2 = *((void *)parser + 70);
      int v3 = v1 - v2;
      if (v2) {
        LODWORD(parser) = v3;
      }
      else {
        LODWORD(parser) = 0;
      }
    }

    else
    {
      LODWORD(parser) = 0;
    }
  }

  return (int)parser;
}

const char *__cdecl XML_GetInputContext(const char *parser, int *offset, int *size)
{
  if (parser)
  {
    int v3 = parser;
    uint64_t v4 = *((void *)parser + 70);
    if (v4)
    {
      parser = (const char *)*((void *)parser + 2);
      if (parser)
      {
        if (offset) {
          *offset = v4 - (_DWORD)parser;
        }
        if (size) {
          *size = *((_DWORD *)v3 + 14) - (_DWORD)parser;
        }
      }
    }

    else
    {
      return 0LL;
    }
  }

  return parser;
}

XML_Size XML_GetCurrentLineNumber(XML_Size parser)
{
  if (parser)
  {
    uint64_t v1 = (void *)parser;
    unint64_t v2 = *(void *)(parser + 560);
    if (v2)
    {
      if (v2 >= *(void *)(parser + 576))
      {
        (*(void (**)(void))(*(void *)(parser + 304) + 96LL))();
        v1[72] = v1[70];
      }
    }

    return v1[98] + 1LL;
  }

  return parser;
}

XML_Size XML_GetCurrentColumnNumber(XML_Size parser)
{
  if (parser)
  {
    uint64_t v1 = (void *)parser;
    unint64_t v2 = *(void *)(parser + 560);
    if (v2)
    {
      if (v2 >= *(void *)(parser + 576))
      {
        (*(void (**)(void))(*(void *)(parser + 304) + 96LL))();
        v1[72] = v1[70];
      }
    }

    return v1[99];
  }

  return parser;
}

void XML_FreeContentModel(XML_Parser parser, XML_Content *model)
{
  if (parser) {
    (*((void (**)(XML_Content *))parser + 5))(model);
  }
}

void *__cdecl XML_MemMalloc(void *parser, size_t size)
{
  if (parser) {
    return (void *)(*((uint64_t (**)(size_t))parser + 3))(size);
  }
  return parser;
}

void *__cdecl XML_MemRealloc(void *parser, void *ptr, size_t size)
{
  if (parser) {
    return (void *)(*((uint64_t (**)(void *, size_t))parser + 4))(ptr, size);
  }
  return parser;
}

void XML_MemFree(XML_Parser parser, void *ptr)
{
  if (parser) {
    (*((void (**)(void *))parser + 5))(ptr);
  }
}

void XML_DefaultCurrent(XML_Parser parser)
{
  if (parser && *((void *)parser + 22))
  {
    uint64_t v1 = (uint64_t *)*((void *)parser + 73);
    if (v1)
    {
      uint64_t v2 = *((void *)parser + 57);
      uint64_t v3 = *v1;
      uint64_t v4 = v1[1];
    }

    else
    {
      uint64_t v2 = *((void *)parser + 38);
      uint64_t v3 = *((void *)parser + 70);
      uint64_t v4 = *((void *)parser + 71);
    }

    reportDefault((uint64_t)parser, v2, v3, v4);
  }

uint64_t reportDefault(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v13 = a3;
  if (*(_BYTE *)(a2 + 132)) {
    return (*(uint64_t (**)(void, uint64_t, void))(a1 + 176))( *(void *)(a1 + 8),  a3,  (a4 - a3));
  }
  if (*(void *)(a1 + 304) == a2)
  {
    unint64_t v8 = (void *)(a1 + 560);
    unint64_t v9 = (void *)(a1 + 568);
  }

  else
  {
    unint64_t v8 = *(void **)(a1 + 584);
    unint64_t v9 = v8 + 1;
  }

  do
  {
    uint64_t v10 = *(void *)(a1 + 112);
    uint64_t v12 = *(void *)(a1 + 104);
    unsigned int v11 = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t, uint64_t *, uint64_t))(a2 + 112))( a2,  &v13,  a4,  &v12,  v10);
    *unint64_t v9 = v13;
    uint64_t result = (*(uint64_t (**)(void, void, void))(a1 + 176))( *(void *)(a1 + 8),  *(void *)(a1 + 104),  v12 - *(void *)(a1 + 104));
    *unint64_t v8 = v13;
  }

  while (v11 > 1);
  return result;
}

const XML_LChar *__cdecl XML_ErrorString(XML_Error code)
{
  if (code - 1 > 0x2A) {
    return 0LL;
  }
  else {
    return off_189DAEE78[code - 1];
  }
}

const XML_LChar *XML_ExpatVersion(void)
{
  return "expat_2.6.3";
}

XML_Expat_Version XML_ExpatVersionInfo(void)
{
  uint64_t v0 = 0x600000002LL;
  int v1 = 3;
  result.major = v0;
  result.minor = HIDWORD(v0);
  result.micro = v1;
  return result;
}

const XML_Feature *XML_GetFeatureList(void)
{
  return (const XML_Feature *)&XML_GetFeatureList_features;
}

uint64_t XML_SetBillionLaughsAttackProtectionMaximumAmplification(uint64_t result, float a2)
{
  if (result)
  {
    if (*(void *)(result + 912) || a2 < 1.0)
    {
      return 0LL;
    }

    else
    {
      *(float *)(result + 968) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t XML_SetBillionLaughsAttackProtectionActivationThreshold(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (*(void *)(result + 912))
    {
      return 0LL;
    }

    else
    {
      *(void *)(result + 976) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t XML_SetReparseDeferralEnabled(uint64_t a1, unsigned int a2)
{
  uint64_t result = 0LL;
  if (a1)
  {
    if (a2 <= 1)
    {
      *(_BYTE *)(a1 + 96) = a2;
      return 1LL;
    }
  }

  return result;
}

uint64_t testingAccountingGetCountBytesDirect(uint64_t result)
{
  if (result) {
    return *(void *)(result + 944);
  }
  return result;
}

uint64_t testingAccountingGetCountBytesIndirect(uint64_t result)
{
  if (result) {
    return *(void *)(result + 952);
  }
  return result;
}

char *unsignedCharToPrintable(int a1)
{
  return off_189DAEFD0[a1 ^ 0x80u];
}

uint64_t prologInitProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t result = initializeEncoding(a1);
  if (!(_DWORD)result)
  {
    *(void *)(a1 + 544) = prologProcessor;
    return prologProcessor(a1, a2, a3, a4);
  }

  return result;
}

unint64_t getDebugLevel(const char *a1)
{
  int v1 = getenv(a1);
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  *__error() = 0;
  __endptr = 0LL;
  unint64_t v3 = strtoul(v2, &__endptr, 10);
  if (*__error() || __endptr == v2 || *__endptr)
  {
    unint64_t v3 = 0LL;
    *__error() = 0;
  }

  return v3;
}

uint64_t initializeEncoding(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 **)(a1 + 464);
  if (*(_BYTE *)(a1 + 472)) {
    int inited = XmlInitEncodingNS(a1 + 312, (void *)(a1 + 304), v2);
  }
  else {
    int inited = XmlInitEncoding(a1 + 312, (void *)(a1 + 304), v2);
  }
  if (inited) {
    return 0LL;
  }
  else {
    return handleUnknownEncoding(a1, *(void *)(a1 + 464));
  }
}

uint64_t prologProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t v10 = a2;
  uint64_t v8 = (**(uint64_t (***)(void))(a1 + 304))();
  return doProlog((void *)a1, *(void *)(a1 + 304), a2, a3, v8, v10, a4, *(_BYTE *)(a1 + 924) == 0, 1, 0);
}

uint64_t handleUnknownEncoding(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned int (**)(void, uint64_t, _BYTE *))(a1 + 264);
  if (!v2) {
    return 18LL;
  }
  memset(__b, 255, sizeof(__b));
  uint64_t v13 = 0LL;
  int v15 = 0LL;
  uint64_t v14 = 0LL;
  if (!v2(*(void *)(a1 + 496), a2, __b))
  {
LABEL_9:
    if (v15) {
      v15(v13);
    }
    return 18LL;
  }

  int v5 = *(uint64_t (**)(void))(a1 + 24);
  int v6 = XmlSizeOfUnknownEncoding();
  uint64_t v7 = v5(v6);
  *(void *)(a1 + 480) = v7;
  if (v7)
  {
    if (*(_BYTE *)(a1 + 472)) {
      uint64_t v8 = (uint64_t (*)(void))XmlInitUnknownEncodingNS;
    }
    else {
      uint64_t v8 = (uint64_t (*)(void))XmlInitUnknownEncoding;
    }
    uint64_t v9 = v8();
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t result = 0LL;
      *(void *)(a1 + 488) = v13;
      *(void *)(a1 + 504) = v15;
      *(void *)(a1 + 304) = v10;
      return result;
    }

    goto LABEL_9;
  }

  if (v15) {
    v15(v13);
  }
  return 1LL;
}

uint64_t doProlog( void *a1, uint64_t a2, unsigned __int8 *a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, unsigned __int8 **a7, int a8, char a9, int a10)
{
  uint64_t v13 = a2;
  uint64_t v14 = (uint64_t)a1;
  v166 = a6;
  uint64_t v15 = a1[86];
  if (a1[38] == a2)
  {
    v164 = (unsigned __int8 **)(a1 + 70);
    uint64_t v16 = (unsigned __int8 **)(a1 + 71);
  }

  else
  {
    v164 = (unsigned __int8 **)a1[73];
    uint64_t v16 = v164 + 1;
  }

  v165 = v16;
  uint64_t v17 = (unsigned int (**)(uint64_t, uint64_t, unsigned __int8 *, unsigned __int8 *, uint64_t))(a1 + 64);
  v160 = (uint64_t *)(v15 + 160);
  v157 = (uint64_t *)(v15 + 264);
  v158 = a1 + 81;
  v161 = a1 + 102;
  v162 = a1 + 100;
  while (2)
  {
    *v164 = a3;
    uint64_t v18 = v166;
    *v165 = v166;
    if ((int)a5 <= 0)
    {
      if (a8 && (_DWORD)a5)
      {
LABEL_355:
        uint64_t v19 = 0LL;
        *a7 = a3;
        return v19;
      }

      if ((_DWORD)a5 != -15)
      {
        uint64_t v19 = 5LL;
        switch((int)a5)
        {
          case -4:
            if (v13 == *(void *)(v14 + 304))
            {
              if (!*(_BYTE *)(v14 + 928)) {
                return 3LL;
              }
            }

            else if (!*(_BYTE *)(*(void *)(v14 + 584) + 36LL))
            {
              goto LABEL_355;
            }

            if ((*v17)(v14 + 512, 4294967292LL, a4, a4, v13) != -1) {
              goto LABEL_355;
            }
            uint64_t v19 = 29LL;
            break;
          case -2:
            return 6LL;
          case -1:
            return v19;
          case 0:
            *v164 = v18;
            return 4LL;
          default:
            a5 = -(int)a5;
            v166 = a4;
            uint64_t v18 = a4;
            goto LABEL_12;
        }

        return v19;
      }

      a5 = 15LL;
    }

LABEL_12:
    unsigned int v20 = (*v17)(v14 + 512, a5, a3, v18, v13);
    BOOL v21 = v20 > 0x39 || ((1LL << v20) & 0x200000000000006LL) == 0;
    if (v21 && !accountingDiffTolerated(v14, a5, a3, (unint64_t)v166, 4794, a10))
    {
      accountingReportStats((void *)v14, " ABORTING\n");
      return 43LL;
    }

    int v22 = 0;
    int v23 = 1;
    switch(v20)
    {
      case 0xFFFFFFFF:
        if ((_DWORD)a5 == 12) {
          unsigned int v152 = 17;
        }
        else {
          unsigned int v152 = 2;
        }
        if ((_DWORD)a5 == 28) {
          return 10LL;
        }
        else {
          return v152;
        }
      case 0u:
        if ((_DWORD)a5 != 14) {
          goto LABEL_338;
        }
        goto LABEL_340;
      case 1u:
        uint64_t v53 = v166;
        uint64_t v54 = v14;
        uint64_t v55 = 0LL;
        goto LABEL_255;
      case 2u:
        if (!*(_BYTE *)(v14 + 929)) {
          goto LABEL_387;
        }
        char v153 = *(_BYTE *)(v15 + 257);
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932) || !*(void *)(v14 + 240)) {
          goto LABEL_387;
        }
        v154 = lookup(v14, v157, "#", 0x40uLL);
        if (!v154) {
          return 1LL;
        }
        *((void *)v154 + 4) = *(void *)(v14 + 696);
        *(_BYTE *)(v15 + 259) = 0;
        if (*(_BYTE *)(v15 + 259))
        {
          if (!*(_BYTE *)(v15 + 258))
          {
            v155 = *(unsigned int (**)(void))(v14 + 232);
            if (v155)
            {
              if (!v155(*(void *)(v14 + 8))) {
                return 22LL;
              }
            }
          }
        }

        else
        {
          *(_BYTE *)(v15 + 257) = v153;
        }

          a3 = (unsigned __int8 *)v26;
          continue;
        }

        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = a3;
        }
        uint64_t v16 = 14LL;
LABEL_35:
        *(_DWORD *)(a1 + 536) = v13;
        return v16;
      default:
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = a3;
        }
        uint64_t v16 = 23LL;
        goto LABEL_35;
    }
  }

  *(_DWORD *)(v2 + 344) = v4 + 1;
  uint64_t v8 = *(_DWORD *)(v2 + 348);
  if (v8)
  {
    uint64_t v9 = *(int *)(*(void *)(v2 + 352) + 4LL * (v8 - 1));
    uint64_t v10 = v6 + 32 * v9;
    unsigned int v11 = (_DWORD *)(v10 + 20);
    uint64_t v12 = *(int *)(v10 + 20);
    if ((_DWORD)v12) {
      *(_DWORD *)(v6 + 32 * v12 + 28) = v4;
    }
    uint64_t v15 = *(_DWORD *)(v10 + 24);
    uint64_t v13 = (_DWORD *)(v10 + 24);
    uint64_t v14 = v15;
    if (!v15) {
      *(_DWORD *)(v6 + 32 * v9 + 16) = v4;
    }
    *unsigned int v11 = v4;
    uint64_t *v13 = v14 + 1;
  }

  uint64_t v16 = v6 + 32LL * (int)v4;
  *(void *)(v16 + 16) = 0LL;
  *(void *)(v16 + 24) = 0LL;
  return v4;
}

    uint64_t result = 0LL;
    *a4 = v6;
    return result;
  }

  if (v8 == -1)
  {
    if (*(_BYTE *)(a1 + 924))
    {
      *(void *)(a1 + 560) = v6;
      return 5LL;
    }

    goto LABEL_12;
  }

  if (v8 != 14)
  {
LABEL_7:
    *(void *)(a1 + 544) = externalEntityInitProcessor3;
    return externalEntityInitProcessor3(a1, (unint64_t)v6, a3, a4);
  }

  if (accountingDiffTolerated(a1, 14, v6, a2, 2724, 0))
  {
    int v6 = (unsigned __int8 *)a2;
    if (a2 != a3) {
      goto LABEL_7;
    }
    int v6 = (unsigned __int8 *)a3;
    if (*(_BYTE *)(a1 + 924)) {
      goto LABEL_7;
    }
    uint64_t result = 0LL;
    *a4 = a3;
  }

  else
  {
    accountingReportStats((void *)a1, " ABORTING\n");
    return 43LL;
  }

  return result;
}

    *(void *)a1 = error;
    return;
  }

  if ((_DWORD)a2 == -4)
  {
    if (!a1[4]) {
      return;
    }
    goto LABEL_12;
  }

  if ((_DWORD)a2 != 15) {
LABEL_14:
  }
    internalSubset(a1, a2, a3, a4);
}

LABEL_387:
        *(void *)(v14 + 544) = contentProcessor;
        return contentProcessor(v14, a3, (uint64_t)a4, a7);
      case 3u:
        if (!*(void *)(v14 + 184)) {
          goto LABEL_338;
        }
        goto LABEL_340;
      case 4u:
        if (!*(void *)(v14 + 184)) {
          goto LABEL_98;
        }
        uint64_t v56 = poolStoreString(v162, v13, (uint64_t)a3, (uint64_t)v166);
        *(void *)(v14 + 616) = v56;
        if (!v56) {
          return 1LL;
        }
        int v23 = 0;
        *(void *)(v14 + 832) = *(void *)(v14 + 824);
        *(void *)(v14 + 632) = 0LL;
LABEL_98:
        *(void *)(v14 + 624) = 0LL;
        goto LABEL_337;
      case 5u:
        *(_BYTE *)(v14 + 929) = 0;
        *(_BYTE *)(v15 + 257) = 1;
        if (*(void *)(v14 + 184))
        {
          uint64_t v57 = poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
          *(void *)(v14 + 624) = v57;
          if (!v57) {
            return 1LL;
          }
          int v23 = 0;
          *(void *)(v14 + 832) = *(void *)(v14 + 824);
        }

        else
        {
          *(void *)(v14 + 624) = "#";
        }

        if (!*(_BYTE *)(v15 + 258) && !*(_DWORD *)(v14 + 932))
        {
          v134 = *(unsigned int (**)(void))(v14 + 232);
          if (v134)
          {
            if (!v134(*(void *)(v14 + 8))) {
              return 22LL;
            }
          }
        }

        if (*(void *)(v14 + 608)) {
          goto LABEL_277;
        }
        v135 = lookup(v14, v157, "#", 0x40uLL);
        *(void *)(v14 + 608) = v135;
        if (!v135) {
          return 1LL;
        }
        *((void *)v135 + 5) = 0LL;
LABEL_277:
        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 608)) {
          goto LABEL_337;
        }
        uint64_t v136 = poolStoreString(v160, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        uint64_t v137 = *(void *)(v14 + 608);
        *(void *)(v137 + 24) = v136;
        if (!v136) {
          return 1LL;
        }
        *(void *)(v137 + 32) = *(void *)(v14 + 696);
        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        if (v20 == 13) {
          goto LABEL_281;
        }
        goto LABEL_337;
      case 6u:
        *(_BYTE *)(v14 + 929) = 0;
        __int128 v58 = lookup(v14, v157, "#", 0x40uLL);
        *(void *)(v14 + 608) = v58;
        uint64_t v19 = 1LL;
        if (!v58) {
          return v19;
        }
        *(_BYTE *)(v15 + 257) = 1;
        if (*(void *)(v14 + 184))
        {
          if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))( v13,  a3,  v166,  v164)) {
            return 32LL;
          }
          __int128 v59 = (_BYTE *)poolStoreString( v162,  v13,  (uint64_t)&a3[*(int *)(v13 + 128)],  (uint64_t)&v166[-*(int *)(v13 + 128)]);
          if (!v59) {
            return v19;
          }
          __int128 v60 = v59;
          normalizePublicId(v59);
          int v23 = 0;
          *(void *)(v14 + 832) = *(void *)(v14 + 824);
          *(void *)(v14 + 632) = v60;
        }

        else
        {
LABEL_107:
          if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))( v13,  a3,  v166,  v164)) {
            return 32LL;
          }
        }

        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 608)) {
          goto LABEL_337;
        }
        __int128 v61 = (_BYTE *)poolStoreString( v160,  v13,  (uint64_t)&a3[*(int *)(v13 + 128)],  (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v61) {
          return 1LL;
        }
        __int128 v62 = v61;
        normalizePublicId(v61);
        *(void *)(*(void *)(v14 + 608) + 40LL) = v62;
        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        if (v20 != 14) {
          goto LABEL_337;
        }
LABEL_281:
        if (!*(void *)(v14 + 288)) {
          goto LABEL_337;
        }
        goto LABEL_340;
      case 7u:
        __int128 v63 = *(void (**)(void, void, void, void, uint64_t))(v14 + 184);
        if (!v63) {
          goto LABEL_338;
        }
        v63(*(void *)(v14 + 8), *(void *)(v14 + 616), *(void *)(v14 + 624), *(void *)(v14 + 632), 1LL);
        *(void *)(v14 + 616) = 0LL;
        __int128 v64 = *(void **)(v14 + 808);
        uint64_t v44 = *(void **)(v14 + 800);
        if (!v64) {
          goto LABEL_266;
        }
        if (!v44) {
          goto LABEL_268;
        }
        do
        {
          uint64_t v45 = v44;
          uint64_t v44 = (void *)*v44;
          *uint64_t v45 = v64;
          __int128 v64 = v45;
        }

        while (v44);
        goto LABEL_267;
      case 8u:
        if (a9 != 1) {
          return 4LL;
        }
        uint64_t v65 = *(void *)(v14 + 616);
        if (!v65) {
          goto LABEL_302;
        }
        (*(void (**)(void, uint64_t, void, void, void))(v14 + 184))( *(void *)(v14 + 8),  v65,  *(void *)(v14 + 624),  *(void *)(v14 + 632),  0LL);
        int v66 = *(void **)(v14 + 808);
        v67 = *(void **)(v14 + 800);
        if (v66)
        {
          if (!v67) {
            goto LABEL_301;
          }
          do
          {
            int v68 = v67;
            v67 = (void *)*v67;
            *int v68 = v66;
            int v66 = v68;
          }

          while (v67);
        }

        else
        {
          int v68 = *(void **)(v14 + 800);
        }

        *(void *)(v14 + 808) = v68;
LABEL_301:
        int v23 = 0;
        uint64_t *v162 = 0LL;
        v161[1] = 0LL;
        v161[2] = 0LL;
        void *v161 = 0LL;
LABEL_302:
        if (!*(void *)(v14 + 624) && !*(_BYTE *)(v14 + 929)) {
          goto LABEL_335;
        }
        char v141 = *(_BYTE *)(v15 + 257);
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932) || !*(void *)(v14 + 240)) {
          goto LABEL_334;
        }
        v142 = lookup(v14, v157, "#", 0x40uLL);
        if (!v142) {
          return 1LL;
        }
        if (*(_BYTE *)(v14 + 929))
        {
          uint64_t v143 = *(void *)(v14 + 696);
          v142[4] = v143;
        }

        else
        {
          uint64_t v143 = v142[4];
        }

        *(_BYTE *)(v15 + 259) = 0;
        if (!(*(unsigned int (**)(void, void, uint64_t, void, void))(v14 + 240))( *(void *)(v14 + 248),  0LL,  v143,  v142[3],  v142[5])) {
          return 21LL;
        }
        if (*(_BYTE *)(v15 + 259))
        {
          if (!*(_BYTE *)(v15 + 258))
          {
            v148 = *(unsigned int (**)(void))(v14 + 232);
            if (v148)
            {
              if (!v148(*(void *)(v14 + 8))) {
                return 22LL;
              }
            }
          }
        }

        else if (!*(void *)(v14 + 624))
        {
          *(_BYTE *)(v15 + 257) = v141;
        }

LABEL_334:
        *(_BYTE *)(v14 + 929) = 0;
LABEL_335:
        v149 = *(void (**)(void))(v14 + 192);
        if (!v149) {
          goto LABEL_337;
        }
        v149(*(void *)(v14 + 8));
        goto LABEL_340;
      case 9u:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_135;
        }
        v69 = (char *)poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        if (!v69) {
          return 1LL;
        }
        v70 = v69;
        uint64_t v71 = lookup(v14, (uint64_t *)v15, v69, 0x40uLL);
        *(void *)(v14 + 608) = v71;
        if (!v71) {
          return 1LL;
        }
        if (*(char **)v71 != v70)
        {
LABEL_135:
          *(void *)(v15 + 184) = *(void *)(v15 + 192);
LABEL_136:
          *(void *)(v14 + 608) = 0LL;
          goto LABEL_338;
        }

        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        *((void *)v71 + 5) = 0LL;
        *((_BYTE *)v71 + 57) = 0;
        if (*(void *)(v14 + 912)) {
          BOOL v72 = 1;
        }
        else {
LABEL_310:
        }
          BOOL v72 = *(void *)(v14 + 584) != 0LL;
LABEL_311:
        *((_BYTE *)v71 + 58) = !v72;
LABEL_312:
        if (!*(void *)(v14 + 288)) {
          goto LABEL_338;
        }
        goto LABEL_340;
      case 0xAu:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_135;
        }
        v73 = (char *)poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        if (!v73) {
          return 1LL;
        }
        v74 = v73;
        uint64_t v71 = lookup(v14, v157, v73, 0x40uLL);
        *(void *)(v14 + 608) = v71;
        if (!v71) {
          return 1LL;
        }
        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        *((void *)v71 + 5) = 0LL;
        BOOL v72 = 1;
        *((_BYTE *)v71 + 57) = 1;
        if (!*(void *)(v14 + 912)) {
          goto LABEL_310;
        }
        goto LABEL_311;
      case 0xBu:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_338;
        }
        goto LABEL_312;
      case 0xCu:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_338;
        }
        uint64_t v19 = storeEntityValue(v14, v13, &a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)], 2);
        uint64_t v75 = *(void *)(v14 + 608);
        uint64_t v76 = *(void *)(v15 + 240);
        if (v75)
        {
          *(void *)(v75 + 8) = v76;
          uint64_t v77 = *(void *)(v15 + 232);
          *(_DWORD *)(v75 + 16) = v77 - v76;
          *(void *)(v15 + 240) = v77;
          if (*(void *)(v14 + 288))
          {
            *v165 = a3;
            (*(void (**)(void, void, void, void, void, void, void, void, void))(v14 + 288))( *(void *)(v14 + 8),  **(void **)(v14 + 608),  *(unsigned __int8 *)(*(void *)(v14 + 608) + 57LL),  *(void *)(*(void *)(v14 + 608) + 8LL),  *(unsigned int *)(*(void *)(v14 + 608) + 16LL),  *(void *)(v14 + 696),  0LL,  0LL,  0LL);
            int v23 = 0;
          }
        }

        else
        {
          *(void *)(v15 + 232) = v76;
        }

        if ((_DWORD)v19) {
          return v19;
        }
        goto LABEL_337;
      case 0xDu:
        goto LABEL_277;
      case 0xEu:
        goto LABEL_107;
      case 0xFu:
        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 608) || !*(void *)(v14 + 288)) {
          goto LABEL_338;
        }
        *v165 = a3;
        (*(void (**)(void, void, void, void, void, void, void, void, void))(v14 + 288))( *(void *)(v14 + 8),  **(void **)(v14 + 608),  *(unsigned __int8 *)(*(void *)(v14 + 608) + 57LL),  0LL,  0LL,  *(void *)(*(void *)(v14 + 608) + 32LL),  *(void *)(*(void *)(v14 + 608) + 24LL),  *(void *)(*(void *)(v14 + 608) + 40LL),  0LL);
        goto LABEL_340;
      case 0x10u:
        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 608)) {
          goto LABEL_338;
        }
        uint64_t v78 = poolStoreString(v160, v13, (uint64_t)a3, (uint64_t)v166);
        *(void *)(*(void *)(v14 + 608) + 48LL) = v78;
        if (!v78) {
          return 1LL;
        }
        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        if (*(void *)(v14 + 200))
        {
          *v165 = a3;
          (*(void (**)(void, void, void, void, void, void))(v14 + 200))( *(void *)(v14 + 8),  **(void **)(v14 + 608),  *(void *)(*(void *)(v14 + 608) + 32LL),  *(void *)(*(void *)(v14 + 608) + 24LL),  *(void *)(*(void *)(v14 + 608) + 40LL),  *(void *)(*(void *)(v14 + 608) + 48LL));
          goto LABEL_340;
        }

        if (!*(void *)(v14 + 288)) {
          goto LABEL_338;
        }
        *v165 = a3;
        (*(void (**)(void, void, void, void, void, void, void, void, void))(v14 + 288))( *(void *)(v14 + 8),  **(void **)(v14 + 608),  0LL,  0LL,  0LL,  *(void *)(*(void *)(v14 + 608) + 32LL),  *(void *)(*(void *)(v14 + 608) + 24LL),  *(void *)(*(void *)(v14 + 608) + 40LL),  *(void *)(*(void *)(v14 + 608) + 48LL));
        goto LABEL_340;
      case 0x11u:
        if (!*(void *)(v14 + 208)) {
          goto LABEL_338;
        }
        goto LABEL_340;
      case 0x12u:
        uint64_t *v158 = 0LL;
        v158[1] = 0LL;
        if (!*(void *)(v14 + 208)) {
          goto LABEL_338;
        }
        uint64_t v79 = poolStoreString(v162, v13, (uint64_t)a3, (uint64_t)v166);
        uint64_t *v158 = v79;
        if (!v79) {
          return 1LL;
        }
        goto LABEL_179;
      case 0x13u:
        if (!*v158 || !*(void *)(v14 + 208)) {
          goto LABEL_161;
        }
        uint64_t v80 = poolStoreString(v162, v13, (uint64_t)&a3[*(int *)(v13 + 128)], (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v80) {
          return 1LL;
        }
        *v165 = a3;
        (*(void (**)(void, void, void, uint64_t, void))(v14 + 208))( *(void *)(v14 + 8),  *(void *)(v14 + 648),  *(void *)(v14 + 696),  v80,  *(void *)(v14 + 656));
        int v23 = 0;
LABEL_161:
        v81 = *(void **)(v14 + 808);
        v35 = *(void **)(v14 + 800);
        if (!v81) {
          goto LABEL_172;
        }
        if (!v35) {
          goto LABEL_174;
        }
        do
        {
          v36 = v35;
          v35 = (void *)*v35;
          void *v36 = v81;
          v81 = v36;
        }

        while (v35);
        goto LABEL_173;
      case 0x14u:
        if (*(void *)(v14 + 656) && *(void *)(v14 + 208))
        {
          *v165 = a3;
          (*(void (**)(void, void, void, void, void))(v14 + 208))( *(void *)(v14 + 8),  *(void *)(v14 + 648),  *(void *)(v14 + 696),  0LL,  *(void *)(v14 + 656));
          int v23 = 0;
        }

        v82 = *(void **)(v14 + 808);
        v35 = *(void **)(v14 + 800);
        if (!v82) {
          goto LABEL_172;
        }
        if (!v35) {
          goto LABEL_174;
        }
        do
        {
          v36 = v35;
          v35 = (void *)*v35;
          void *v36 = v82;
          v82 = v36;
        }

        while (v35);
        goto LABEL_173;
      case 0x15u:
        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))(v13 + 104))( v13,  a3,  v166,  v164)) {
          return 32LL;
        }
        if (!*v158) {
          goto LABEL_338;
        }
        v83 = (_BYTE *)poolStoreString( v162,  v13,  (uint64_t)&a3[*(int *)(v13 + 128)],  (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v83) {
          return 1LL;
        }
        v84 = v83;
        normalizePublicId(v83);
        *(void *)(v14 + 656) = v84;
LABEL_179:
        *(void *)(v14 + 832) = *(void *)(v14 + 824);
        goto LABEL_340;
      case 0x16u:
        AttributeId = getAttributeId(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(void *)(v14 + 672) = AttributeId;
        if (!AttributeId) {
          return 1LL;
        }
        *(_WORD *)(v14 + 680) = 0;
        *(void *)(v14 + 640) = 0LL;
        goto LABEL_191;
      case 0x17u:
        *(_BYTE *)(v14 + 680) = 1;
        v86 = "CDATA";
        goto LABEL_190;
      case 0x18u:
        *(_BYTE *)(v14 + 681) = 1;
        v86 = "ID";
        goto LABEL_190;
      case 0x19u:
        v86 = "IDREF";
        goto LABEL_190;
      case 0x1Au:
        v86 = "IDREFS";
        goto LABEL_190;
      case 0x1Bu:
        v86 = "ENTITY";
        goto LABEL_190;
      case 0x1Cu:
        v86 = "ENTITIES";
        goto LABEL_190;
      case 0x1Du:
        v86 = "NMTOKEN";
        goto LABEL_190;
      case 0x1Eu:
        v86 = "NMTOKENS";
LABEL_190:
        *(void *)(v14 + 640) = v86;
        goto LABEL_191;
      case 0x1Fu:
      case 0x20u:
        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 280)) {
          goto LABEL_338;
        }
        v24 = "(";
        if (v20 == 32) {
          v24 = "NOTATION(";
        }
        if (*(void *)(v14 + 640)) {
          uint64_t v25 = "|";
        }
        else {
          uint64_t v25 = v24;
        }
        char v26 = *v25;
        if (!*v25) {
          goto LABEL_32;
        }
        uint64_t v27 = (unsigned __int8 *)(v25 + 1);
        do
        {
          uint64_t v28 = *(char **)(v14 + 824);
          if (v28 == *(char **)(v14 + 816))
          {
            uint64_t v28 = *(char **)(v14 + 824);
          }

          *(void *)(v14 + 824) = v28 + 1;
          *uint64_t v28 = v26;
          int v29 = *v27++;
          char v26 = v29;
        }

        while (v29);
LABEL_32:
        *(void *)(v14 + 640) = *(void *)(v14 + 832);
        goto LABEL_340;
      case 0x21u:
        goto LABEL_191;
      case 0x22u:
        ElementType = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(void *)(v14 + 664) = ElementType;
        if (!ElementType) {
          return 1LL;
        }
LABEL_191:
        if (!*(_BYTE *)(v15 + 256) || !*(void *)(v14 + 280)) {
          goto LABEL_338;
        }
        goto LABEL_340;
      case 0x23u:
      case 0x24u:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_50;
        }
        if (!defineAttribute( *(void *)(v14 + 664),  *(void *)(v14 + 672),  *(unsigned __int8 *)(v14 + 680),  *(unsigned __int8 *)(v14 + 681),  0LL,  v14)) {
          return 1LL;
        }
        if (!*(void *)(v14 + 280)) {
          goto LABEL_50;
        }
        uint64_t v30 = *(unsigned __int8 **)(v14 + 640);
        if (!v30) {
          goto LABEL_50;
        }
        int v31 = *v30;
        if (v31 != 40 && (v31 != 78 || v30[1] != 79)) {
          goto LABEL_49;
        }
        unint64_t v32 = *(_BYTE **)(v14 + 824);
        if (v32 != *(_BYTE **)(v14 + 816)) {
          goto LABEL_45;
        }
        unint64_t v32 = *(_BYTE **)(v14 + 824);
LABEL_45:
        *(void *)(v14 + 824) = v32 + 1;
        *unint64_t v32 = 41;
        uint64_t v33 = *(_BYTE **)(v14 + 824);
        if (v33 != *(_BYTE **)(v14 + 816)) {
          goto LABEL_48;
        }
        uint64_t v33 = *(_BYTE **)(v14 + 824);
LABEL_48:
        *(void *)(v14 + 824) = v33 + 1;
        _BYTE *v33 = 0;
        *(void *)(v14 + 640) = *(void *)(v14 + 832);
        *(void *)(v14 + 832) = *(void *)(v14 + 824);
LABEL_49:
        *v165 = a3;
        (*(void (**)(void, void, void, void, void, BOOL))(v14 + 280))( *(void *)(v14 + 8),  **(void **)(v14 + 664),  **(void **)(v14 + 672),  *(void *)(v14 + 640),  0LL,  v20 == 36);
        int v23 = 0;
LABEL_50:
        v34 = *(void **)(v14 + 808);
        v35 = *(void **)(v14 + 800);
        if (v34)
        {
          if (!v35) {
            goto LABEL_174;
          }
          do
          {
            v36 = v35;
            v35 = (void *)*v35;
            void *v36 = v34;
            v34 = v36;
          }

          while (v35);
        }

        else
        {
LABEL_172:
          v36 = v35;
        }

LABEL_173:
        *(void *)(v14 + 808) = v36;
LABEL_174:
        uint64_t *v162 = 0LL;
        v161[1] = 0LL;
        v161[2] = 0LL;
        void *v161 = 0LL;
        goto LABEL_337;
      case 0x25u:
      case 0x26u:
        if (!*(_BYTE *)(v15 + 256)) {
          goto LABEL_338;
        }
        uint64_t v37 = storeAttributeValue( v14,  v13,  *(unsigned __int8 *)(v14 + 680),  &a3[*(int *)(v13 + 128)],  (uint64_t)&v166[-*(int *)(v13 + 128)],  v160,  2);
        if ((_DWORD)v37) {
          return v37;
        }
        uint64_t v38 = *(void *)(v15 + 192);
        *(void *)(v15 + 192) = *(void *)(v15 + 184);
        if (!defineAttribute( *(void *)(v14 + 664),  *(void *)(v14 + 672),  *(unsigned __int8 *)(v14 + 680),  0,  v38,  v14)) {
          return 1LL;
        }
        if (!*(void *)(v14 + 280)) {
          goto LABEL_338;
        }
        uint64_t v39 = *(unsigned __int8 **)(v14 + 640);
        if (!v39) {
          goto LABEL_338;
        }
        int v40 = *v39;
        if (v40 != 40 && (v40 != 78 || v39[1] != 79)) {
          goto LABEL_69;
        }
        v41 = *(_BYTE **)(v14 + 824);
        if (v41 != *(_BYTE **)(v14 + 816)) {
          goto LABEL_65;
        }
        v41 = *(_BYTE **)(v14 + 824);
LABEL_65:
        *(void *)(v14 + 824) = v41 + 1;
        _BYTE *v41 = 41;
        v42 = *(_BYTE **)(v14 + 824);
        if (v42 != *(_BYTE **)(v14 + 816)) {
          goto LABEL_68;
        }
        v42 = *(_BYTE **)(v14 + 824);
LABEL_68:
        *(void *)(v14 + 824) = v42 + 1;
        _BYTE *v42 = 0;
        *(void *)(v14 + 640) = *(void *)(v14 + 832);
        *(void *)(v14 + 832) = *(void *)(v14 + 824);
LABEL_69:
        *v165 = a3;
        (*(void (**)(void, void, void, void, uint64_t, BOOL))(v14 + 280))( *(void *)(v14 + 8),  **(void **)(v14 + 664),  **(void **)(v14 + 672),  *(void *)(v14 + 640),  v38,  v20 == 38);
        v43 = *(void **)(v14 + 808);
        uint64_t v44 = *(void **)(v14 + 800);
        if (v43)
        {
          if (!v44) {
            goto LABEL_268;
          }
          do
          {
            uint64_t v45 = v44;
            uint64_t v44 = (void *)*v44;
            *uint64_t v45 = v43;
            v43 = v45;
          }

          while (v44);
        }

        else
        {
LABEL_266:
          uint64_t v45 = v44;
        }

LABEL_267:
        *(void *)(v14 + 808) = v45;
LABEL_268:
        uint64_t *v162 = 0LL;
        v161[1] = 0LL;
        v161[2] = 0LL;
        void *v161 = 0LL;
        goto LABEL_340;
      case 0x27u:
        goto LABEL_320;
      case 0x28u:
        if (!*(void *)(v14 + 272)) {
          goto LABEL_338;
        }
        v88 = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v166);
        *(void *)(v14 + 664) = v88;
        uint64_t v19 = 1LL;
        if (!v88) {
          return v19;
        }
        *(void *)(v15 + 344) = 0LL;
        *(_BYTE *)(v15 + 320) = 1;
        goto LABEL_340;
      case 0x29u:
      case 0x2Au:
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        if (!*(void *)(v14 + 272)) {
          goto LABEL_80;
        }
        uint64_t v46 = (*(uint64_t (**)(uint64_t))(v14 + 24))(32LL);
        uint64_t v19 = 1LL;
        if (!v46) {
          return v19;
        }
        *(void *)(v46 + 24) = 0LL;
        if (v20 == 41) {
          int v47 = 2;
        }
        else {
          int v47 = 1;
        }
        *(void *)(v46 + 12) = 0LL;
        *(void *)(v46 + 4) = 0LL;
        *(_DWORD *)uint64_t v46 = v47;
        *v165 = a3;
        (*(void (**)(void, void, uint64_t))(v14 + 272))( *(void *)(v14 + 8),  **(void **)(v14 + 664),  v46);
        int v23 = 0;
LABEL_80:
        *(_BYTE *)(v15 + 320) = 0;
        goto LABEL_337;
      case 0x2Bu:
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        uint64_t v89 = *(void *)(v15 + 328);
        uint64_t v90 = 32LL * *(int *)(*(void *)(v15 + 352) + 4LL * *(int *)(v15 + 348) - 4);
        int v91 = 3;
        goto LABEL_319;
      case 0x2Cu:
        unsigned int v92 = *(_DWORD *)(v14 + 904);
        if (*(_DWORD *)(v14 + 520) < v92) {
          goto LABEL_315;
        }
        if (v92)
        {
          if ((v92 & 0x80000000) != 0) {
            return 1LL;
          }
          v93 = *(uint64_t (**)(uint64_t))(v14 + 32);
          uint64_t v94 = *(void *)(v14 + 896);
          *(_DWORD *)(v14 + 904) = 2 * v92;
          uint64_t v95 = v93(v94);
          if (!v95)
          {
            *(_DWORD *)(v14 + 904) >>= 1;
            return 1LL;
          }

          *(void *)(v14 + 896) = v95;
          uint64_t v96 = *(void *)(v15 + 352);
          if (v96)
          {
            uint64_t v97 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 32))(v96, 4LL * *(unsigned int *)(v14 + 904));
            if (!v97) {
              return 1LL;
            }
            *(void *)(v15 + 352) = v97;
          }

          goto LABEL_315;
        }

        v144 = *(uint64_t (**)(uint64_t))(v14 + 24);
        *(_DWORD *)(v14 + 904) = 32;
        uint64_t v145 = v144(32LL);
        *(void *)(v14 + 896) = v145;
        if (v145)
        {
LABEL_315:
          *(_BYTE *)(*(void *)(v14 + 896) + *(unsigned int *)(v14 + 520)) = 0;
          if (!*(_BYTE *)(v15 + 320)) {
            goto LABEL_338;
          }
          unsigned int ScaffoldPart = nextScaffoldPart(v14);
          if ((ScaffoldPart & 0x80000000) != 0) {
            return 1LL;
          }
          uint64_t v147 = *(void *)(v15 + 352);
          if (!v147) {
            doProlog_cold_1();
          }
          *(_DWORD *)(v147 + 4LL * (int)(*(_DWORD *)(v15 + 348))++) = ScaffoldPart;
          uint64_t v89 = *(void *)(v15 + 328);
          uint64_t v90 = 32LL * ScaffoldPart;
          int v91 = 6;
LABEL_319:
          *(_DWORD *)(v89 + v90) = v91;
LABEL_320:
          if (!*(void *)(v14 + 272))
          {
LABEL_338:
            if (*(void *)(v14 + 176)) {
              reportDefault(v14, v13, (uint64_t)a3, (uint64_t)v166);
            }
          }

LABEL_340:
          int v150 = *(_DWORD *)(v14 + 920);
          if (v150 == 2) {
            return 35LL;
          }
          if (v150 == 3)
          {
            uint64_t v19 = 0LL;
            *a7 = v166;
            return v19;
          }

          a3 = v166;
          a5 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unsigned __int8 *, unsigned __int8 **))v13)( v13,  v166,  a4,  &v166);
          continue;
        }

        *(_DWORD *)(v14 + 904) = 0;
        return 1LL;
      case 0x2Du:
        goto LABEL_211;
      case 0x2Eu:
        int v22 = 2;
        goto LABEL_211;
      case 0x2Fu:
        int v22 = 1;
        goto LABEL_211;
      case 0x30u:
        int v22 = 3;
LABEL_211:
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        uint64_t v98 = *(void *)(v14 + 272);
        int v23 = v98 == 0;
        uint64_t v99 = *(int *)(v15 + 348) - 1LL;
        *(_DWORD *)(v15 + 348) = v99;
        *(_DWORD *)(*(void *)(v15 + 328) + 32LL * *(int *)(*(void *)(v15 + 352) + 4 * v99) + 4) = v22;
        if ((_DWORD)v99) {
          goto LABEL_337;
        }
        if (!v98) {
          goto LABEL_226;
        }
        uint64_t v100 = *(void *)(v14 + 688);
        uint64_t v101 = (*(uint64_t (**)(uint64_t))(v14 + 24))(*(unsigned int *)(v100 + 336) + 32LL
                                                                                             * *(unsigned int *)(v100 + 344));
        if (!v101) {
          return 1LL;
        }
        uint64_t v102 = *(unsigned int *)(v100 + 344);
        *(_DWORD *)(v101 + 16) = 0;
        if ((_DWORD)v102)
        {
          v103 = (_BYTE *)(v101 + 32 * v102);
          uint64_t v104 = v101 + 32;
          v105 = v103;
          unint64_t v106 = v101;
          do
          {
            uint64_t v107 = *(int *)(v106 + 16);
            uint64_t v108 = *(void *)(v100 + 328);
            uint64_t v109 = *(void *)(v108 + 32 * v107);
            *(void *)unint64_t v106 = v109;
            if ((_DWORD)v109 == 4)
            {
              *(void *)(v106 + 8) = v105;
              v110 = *(_BYTE **)(v108 + 32 * v107 + 8);
              do
                *v105++ = *v110;
              while (*v110++);
              *(_DWORD *)(v106 + 16) = 0;
              *(void *)(v106 + 24) = 0LL;
            }

            else
            {
              *(void *)(v106 + 8) = 0LL;
              uint64_t v112 = v108 + 32 * v107;
              int v113 = *(_DWORD *)(v112 + 24);
              *(_DWORD *)(v106 + 16) = v113;
              *(void *)(v106 + 24) = v104;
              if (v113)
              {
                unsigned int v114 = 0;
                v115 = (int *)(v112 + 16);
                do
                {
                  uint64_t v116 = *v115;
                  *(_DWORD *)(v104 + 16) = v116;
                  v104 += 32LL;
                  ++v114;
                  v115 = (int *)(v108 + 32 * v116 + 28);
                }

                while (v114 < *(_DWORD *)(v106 + 16));
              }
            }

            v106 += 32LL;
          }

          while (v106 < (unint64_t)v103);
        }

        *v165 = a3;
        (*(void (**)(void, void, uint64_t))(v14 + 272))( *(void *)(v14 + 8),  **(void **)(v14 + 664),  v101);
LABEL_226:
        *(_BYTE *)(v15 + 320) = 0;
        *(_DWORD *)(v15 + 336) = 0;
        goto LABEL_337;
      case 0x31u:
        uint64_t v117 = *(void *)(v14 + 896);
        uint64_t v118 = *(unsigned int *)(v14 + 520);
        if (*(_BYTE *)(v117 + v118) == 44) {
          return 2LL;
        }
        if (*(_BYTE *)(v117 + v118)) {
          BOOL v119 = 1;
        }
        else {
          BOOL v119 = *(_BYTE *)(v15 + 320) == 0;
        }
        if (!v119)
        {
          v120 = (_DWORD *)(*(void *)(v15 + 328)
                          + 32LL * *(int *)(*(void *)(v15 + 352) + 4LL * *(int *)(v15 + 348) - 4));
          if (*v120 != 3)
          {
            _DWORD *v120 = 5;
            int v23 = *(void *)(v14 + 272) == 0LL;
          }
        }

        *(_BYTE *)(v117 + v118) = 124;
        goto LABEL_337;
      case 0x32u:
        uint64_t v121 = *(void *)(v14 + 896);
        uint64_t v122 = *(unsigned int *)(v14 + 520);
        if (*(_BYTE *)(v121 + v122) == 124) {
          return 2LL;
        }
        *(_BYTE *)(v121 + v122) = 44;
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        goto LABEL_320;
      case 0x33u:
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        int v23 = 0;
        v123 = v166;
        goto LABEL_244;
      case 0x34u:
        int v23 = 2;
        goto LABEL_242;
      case 0x35u:
        goto LABEL_242;
      case 0x36u:
        int v23 = 3;
LABEL_242:
        if (!*(_BYTE *)(v15 + 320)) {
          goto LABEL_338;
        }
        v123 = &v166[-*(int *)(v13 + 128)];
LABEL_244:
        unsigned int v124 = nextScaffoldPart(v14);
        if ((v124 & 0x80000000) != 0) {
          return 1LL;
        }
        uint64_t v125 = v124;
        v126 = (_DWORD *)(*(void *)(v15 + 328) + 32LL * v124);
        _DWORD *v126 = 4;
        v126[1] = v23;
        v127 = getElementType(v14, v13, (uint64_t)a3, (uint64_t)v123);
        if (!v127) {
          return 1LL;
        }
        unint64_t v128 = 0LL;
        uint64_t v129 = *(void *)v127;
        *(void *)(*(void *)(v15 + 328) + 32 * v125 + 8) = *(void *)v127;
        int v131 = *(_DWORD *)(v15 + 336);
        *(_DWORD *)(v15 + 336) = v131 + v128;
        goto LABEL_320;
      case 0x37u:
        goto LABEL_340;
      case 0x38u:
        goto LABEL_340;
      case 0x39u:
        uint64_t v53 = v166;
        uint64_t v54 = v14;
        uint64_t v55 = 1LL;
LABEL_255:
        uint64_t v37 = processXmlDecl(v54, v55, a3, (unint64_t)v53);
        if ((_DWORD)v37) {
          return v37;
        }
        uint64_t v13 = *(void *)(v14 + 304);
        goto LABEL_340;
      case 0x3Au:
        if (*(void *)(v14 + 176)) {
          reportDefault(v14, v13, (uint64_t)a3, (uint64_t)v166);
        }
        uint64_t v37 = doIgnoreSection(v14, v13, &v166, (uint64_t)a4, a7, a8);
        if ((_DWORD)v37) {
          return v37;
        }
        if (v166) {
          goto LABEL_340;
        }
        uint64_t v19 = 0LL;
        *(void *)(v14 + 544) = ignoreSectionProcessor;
        return v19;
      case 0x3Bu:
      case 0x3Cu:
        *(_BYTE *)(v15 + 257) = 1;
        if (!*(_DWORD *)(v14 + 932))
        {
          int v132 = *(unsigned __int8 *)(v15 + 258);
          *(_BYTE *)(v15 + 256) = v132;
          if (v132) {
            goto LABEL_337;
          }
LABEL_263:
          v133 = *(unsigned int (**)(void))(v14 + 232);
          if (v133 && !v133(*(void *)(v14 + 8))) {
            return 22LL;
          }
          goto LABEL_337;
        }

        v48 = (char *)poolStoreString( v160,  v13,  (uint64_t)&a3[*(int *)(v13 + 128)],  (uint64_t)&v166[-*(int *)(v13 + 128)]);
        if (!v48) {
          return 1LL;
        }
        uint64_t v49 = v48;
        uint64_t v50 = lookup(v14, v157, v48, 0LL);
        uint64_t v51 = (uint64_t)v50;
        *(void *)(v15 + 184) = *(void *)(v15 + 192);
        if (!*(_DWORD *)(v14 + 532)) {
          goto LABEL_86;
        }
        if (*(_BYTE *)(v15 + 258))
        {
          if (!*(void *)(v14 + 584)) {
            goto LABEL_284;
          }
        }

        else if (!*(_BYTE *)(v15 + 257))
        {
LABEL_284:
          if (!v50) {
            return 11LL;
          }
          if (!*((_BYTE *)v50 + 58)) {
            return 24LL;
          }
          goto LABEL_286;
        }

LABEL_86:
        if (!v50)
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          if (v20 == 60)
          {
            uint64_t v52 = *(void (**)(void, char *, uint64_t))(v14 + 256);
            if (v52)
            {
              v52(*(void *)(v14 + 8), v49, 1LL);
              goto LABEL_340;
            }
          }

          goto LABEL_338;
        }

LABEL_286:
        if (*((_BYTE *)v50 + 56)) {
          return 12LL;
        }
        if (*((void *)v50 + 1))
        {
          uint64_t v37 = processInternalEntity(v14, (uint64_t)v50, v20 == 60);
          if ((_DWORD)v37) {
            return v37;
          }
          goto LABEL_340;
        }

        if (!*(void *)(v14 + 240))
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          goto LABEL_338;
        }

        *(_BYTE *)(v15 + 259) = 0;
        *((_BYTE *)v50 + 56) = 1;
        entityTrackingOnOpen(v14, (uint64_t)v50, 5548);
        int v138 = (*(uint64_t (**)(void, void, void, void, void))(v14 + 240))( *(void *)(v14 + 248),  0LL,  *(void *)(v51 + 32),  *(void *)(v51 + 24),  *(void *)(v51 + 40));
        uint64_t v139 = v14;
        if (!v138)
        {
          do
          {
            uint64_t v151 = v14;
            uint64_t v14 = *(void *)(v14 + 912);
          }

          while (v14);
          entityTrackingReportStats(v151, v51, "CLOSE", 5552);
          --*(_DWORD *)(v151 + 988);
          *(_BYTE *)(v51 + 56) = 0;
          return 21LL;
        }

        do
        {
          uint64_t v140 = v139;
          uint64_t v139 = *(void *)(v139 + 912);
        }

        while (v139);
        entityTrackingReportStats(v140, v51, "CLOSE", 5556);
        --*(_DWORD *)(v140 + 988);
        *(_BYTE *)(v51 + 56) = 0;
        if (!*(_BYTE *)(v15 + 259))
        {
          *(_BYTE *)(v15 + 256) = *(_BYTE *)(v15 + 258);
          goto LABEL_340;
        }

        int v23 = 0;
        if (!*(_BYTE *)(v15 + 258)) {
          goto LABEL_263;
        }
LABEL_337:
        if (!v23) {
          goto LABEL_340;
        }
        goto LABEL_338;
      default:
        goto LABEL_338;
    }
  }

uint64_t accountingDiffTolerated( uint64_t a1, int a2, unsigned __int8 *a3, unint64_t a4, int a5, int a6)
{
  uint64_t v9 = a3;
  if ((a2 + 4) >= 5)
  {
    if (a6 == 2) {
      return 1LL;
    }
  }

  else
  {
    BOOL v10 = 1LL;
    if (((0x1Du >> (a2 + 4)) & 1) != 0 || a6 == 2) {
      return v10;
    }
  }

  int v11 = -1;
  uint64_t v12 = a1;
  do
  {
    uint64_t v13 = v12;
    uint64_t v12 = *(void *)(v12 + 912);
    ++v11;
  }

  while (v12);
  uint64_t v14 = a4 - (void)a3;
  BOOL v15 = v13 == a1 && a6 == 0;
  uint64_t v16 = 952LL;
  if (v15) {
    uint64_t v16 = 944LL;
  }
  uint64_t v17 = *(void *)(v13 + v16);
  if (__CFADD__(v14, v17)) {
    return 0LL;
  }
  *(void *)(v13 + v16) = v17 + v14;
  unint64_t v18 = *(void *)(v13 + 952) + *(void *)(v13 + 944);
  float CurrentAmplification = accountingGetCurrentAmplification((void *)v13);
  BOOL v10 = v18 < *(void *)(v13 + 976) || CurrentAmplification <= *(float *)(v13 + 968);
  if (*(void *)(v13 + 960) >= 2uLL)
  {
    accountingReportStats((void *)v13, "");
    if (*(void *)(v13 + 912)) {
      accountingDiffTolerated_cold_1();
    }
    unsigned int v20 = (FILE **)MEMORY[0x1895F89D0];
    BOOL v21 = "EXP";
    if (!a6) {
      BOOL v21 = "DIR";
    }
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  " (+%6ld bytes %s|%d, xmlparse.c:%d) %*s",  a4 - (void)v9,  v21,  v11,  a5,  10,  "");
    if (v14 < 25 || *(void *)(v13 + 960) > 2uLL)
    {
      if ((unint64_t)v9 < a4)
      {
        do
        {
          int v29 = *v20;
          int v30 = *v9++;
          int v31 = unsignedCharToPrintable(v30);
          fputs(v31, v29);
          --v14;
        }

        while (v14);
      }
    }

    else
    {
      for (uint64_t i = 0LL; i != 10; ++i)
      {
        int v23 = *v20;
        v24 = unsignedCharToPrintable(v9[i]);
        fputs(v24, v23);
      }

      fwrite("[..]", 4uLL, 1uLL, *v20);
      uint64_t v25 = (unsigned __int8 *)(a4 - 10);
      do
      {
        char v26 = *v20;
        int v27 = *v25++;
        uint64_t v28 = unsignedCharToPrintable(v27);
        fputs(v28, v26);
      }

      while ((unint64_t)v25 < a4);
    }

    fwrite("\n", 2uLL, 1uLL, *v20);
  }

  return v10;
}

uint64_t processXmlDecl(uint64_t a1, uint64_t a2, unsigned __int8 *a3, unint64_t a4)
{
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v28 = 0LL;
  uint64_t v29 = 0LL;
  unsigned int v27 = -1;
  if (!accountingDiffTolerated(a1, 12, a3, a4, 4363, 0))
  {
    accountingReportStats((void *)a1, " ABORTING\n");
    return 43LL;
  }

  if (*(_BYTE *)(a1 + 472)) {
    uint64_t v8 = XmlParseXmlDeclNS;
  }
  else {
    uint64_t v8 = XmlParseXmlDecl;
  }
  uint64_t v9 = (uint64_t *)(a1 + 560);
  if (!v8( a2,  *(void *)(a1 + 304),  (uint64_t)a3,  a4,  (uint64_t *)(a1 + 560),  &v29,  &v28,  &v31,  &v30,  (int *)&v27))
  {
    if ((_DWORD)a2) {
      return 31LL;
    }
    else {
      return 30LL;
    }
  }

  if (!(_DWORD)a2 && v27 == 1)
  {
    *(_BYTE *)(*(void *)(a1 + 688) + 258LL) = 1;
    if (*(_DWORD *)(a1 + 932) == 1) {
      *(_DWORD *)(a1 + 932) = 0;
    }
  }

  if (*(void *)(a1 + 296))
  {
    uint64_t v10 = v31;
    if (v31)
    {
      uint64_t v11 = *(void *)(a1 + 304);
      int v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 56))(v11, v31);
      uint64_t v13 = poolStoreString((uint64_t *)(a1 + 848), v11, v10, v10 + v12);
      if (!v13) {
        return 1LL;
      }
      uint64_t v10 = v13;
      *(void *)(a1 + 880) = *(void *)(a1 + 872);
    }

    if (v29)
    {
      uint64_t v14 = poolStoreString( (uint64_t *)(a1 + 848),  *(void *)(a1 + 304),  v29,  v28 - *(int *)(*(void *)(a1 + 304) + 128LL));
      if (!v14) {
        return 1LL;
      }
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    (*(void (**)(void, uint64_t, uint64_t, void))(a1 + 296))(*(void *)(a1 + 8), v14, v10, v27);
  }

  else
  {
    if (*(void *)(a1 + 176)) {
      reportDefault(a1, *(void *)(a1 + 304), (uint64_t)a3, a4);
    }
    uint64_t v10 = 0LL;
    uint64_t v14 = 0LL;
  }

  if (*(void *)(a1 + 464)) {
    goto LABEL_27;
  }
  if (v30)
  {
    int v19 = *(_DWORD *)(v30 + 128);
    uint64_t v20 = *(void *)(a1 + 304);
    if (v19 != *(_DWORD *)(v20 + 128) || v19 == 2 && v30 != v20)
    {
      *uint64_t v9 = v31;
      return 19LL;
    }

    *(void *)(a1 + 304) = v30;
LABEL_27:
    if (!(v10 | v14)) {
      return 0LL;
    }
    uint64_t v16 = *(void **)(a1 + 856);
    uint64_t v17 = *(void **)(a1 + 848);
    if (v16)
    {
      if (!v17)
      {
LABEL_47:
        uint64_t result = 0LL;
        *(void *)(a1 + 848) = 0LL;
        *(void *)(a1 + 864) = 0LL;
        *(void *)(a1 + 880) = 0LL;
        *(void *)(a1 + 872) = 0LL;
        return result;
      }

      do
      {
        unint64_t v18 = v17;
        uint64_t v17 = (void *)*v17;
        *unint64_t v18 = v16;
        uint64_t v16 = v18;
      }

      while (v17);
    }

    else
    {
      unint64_t v18 = *(void **)(a1 + 848);
    }

    *(void *)(a1 + 856) = v18;
    goto LABEL_47;
  }

  uint64_t v21 = v31;
  if (!v31) {
    goto LABEL_27;
  }
  if (!v10)
  {
    uint64_t v22 = *(void *)(a1 + 304);
    int v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 56))(v22, v31);
    uint64_t v10 = poolStoreString((uint64_t *)(a1 + 848), v22, v21, v21 + v23);
    if (!v10) {
      return 1LL;
    }
  }

  uint64_t result = handleUnknownEncoding(a1, v10);
  v24 = *(void **)(a1 + 856);
  uint64_t v25 = *(void **)(a1 + 848);
  if (v24)
  {
    if (!v25) {
      goto LABEL_52;
    }
    do
    {
      char v26 = v25;
      uint64_t v25 = (void *)*v25;
      *char v26 = v24;
      v24 = v26;
    }

    while (v25);
  }

  else
  {
    char v26 = *(void **)(a1 + 848);
  }

  *(void *)(a1 + 856) = v26;
LABEL_52:
  *(void *)(a1 + 848) = 0LL;
  *(void *)(a1 + 864) = 0LL;
  *(void *)(a1 + 880) = 0LL;
  *(void *)(a1 + 872) = 0LL;
  if ((_DWORD)result == 18) {
    *uint64_t v9 = v31;
  }
  return result;
}

uint64_t poolStoreString(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = poolAppend(a1, a2, a3, a4);
  if (result)
  {
    int v6 = (_BYTE *)a1[3];
    if (v6 == (_BYTE *)a1[2])
    {
      int v6 = (_BYTE *)a1[3];
    }

    a1[3] = (uint64_t)(v6 + 1);
    _BYTE *v6 = 0;
    return a1[4];
  }

  return result;
}

_OWORD *lookup(uint64_t a1, uint64_t *a2, char *a3, size_t a4)
{
  if (!a2[2])
  {
    if (a4)
    {
      *((_BYTE *)a2 + 8) = 6;
      a2[2] = 64LL;
      uint64_t result = (_OWORD *)(*(uint64_t (**)(uint64_t))a2[4])(512LL);
      *a2 = (uint64_t)result;
      if (!result)
      {
        a2[2] = 0LL;
        return result;
      }

      result[30] = 0u;
      result[31] = 0u;
      result[28] = 0u;
      result[29] = 0u;
      result[26] = 0u;
      result[27] = 0u;
      result[24] = 0u;
      result[25] = 0u;
      result[22] = 0u;
      result[23] = 0u;
      result[20] = 0u;
      result[21] = 0u;
      result[18] = 0u;
      result[19] = 0u;
      result[16] = 0u;
      result[17] = 0u;
      result[14] = 0u;
      result[15] = 0u;
      result[12] = 0u;
      result[13] = 0u;
      result[10] = 0u;
      result[11] = 0u;
      result[8] = 0u;
      result[9] = 0u;
      result[6] = 0u;
      result[7] = 0u;
      result[4] = 0u;
      result[5] = 0u;
      result[2] = 0u;
      result[3] = 0u;
      *uint64_t result = 0u;
      result[1] = 0u;
      v8.n128_u64[0] = (unint64_t)hash(a1, a3);
      unint64_t v12 = (a2[2] - 1) & v40;
      goto LABEL_45;
    }

    return 0LL;
  }

  v8.n128_u64[0] = (unint64_t)hash(a1, a3);
  uint64_t v10 = v9;
  uint64_t v11 = a2[2];
  unint64_t v12 = (v11 - 1) & v9;
  uint64_t result = *(_OWORD **)(*a2 + 8 * v12);
  if (!result)
  {
LABEL_14:
    if (a4)
    {
      char v22 = *((_BYTE *)a2 + 8);
      if (!((unint64_t)a2[3] >> (v22 - 1)))
      {
LABEL_45:
        *(void *)(*a2 + 8 * v12) = (*(uint64_t (**)(size_t, __n128))a2[4])(a4, v8);
        uint64_t result = *(_OWORD **)(*a2 + 8 * v12);
        if (result)
        {
          bzero(result, a4);
          uint64_t v41 = *a2;
          **(void **)(*a2 + 8 * v12) = a3;
          ++a2[3];
          return *(_OWORD **)(v41 + 8 * v12);
        }

        return result;
      }

      char v23 = v22 + 1;
      unsigned int v24 = (v22 + 1);
      if (v24 <= 0x3C)
      {
        uint64_t result = (_OWORD *)(*(uint64_t (**)(uint64_t, __n128))a2[4])(8LL << v23, v8);
        if (!result) {
          return result;
        }
        uint64_t v25 = result;
        char v42 = v24;
        uint64_t v26 = 1LL << v23;
        unint64_t v27 = (1LL << v23) - 1;
        bzero(result, 8LL << v23);
        unint64_t v28 = a2[2];
        if (v28)
        {
          for (unint64_t i = 0LL; i < v28; ++i)
          {
            uint64_t v30 = *(char ***)(*a2 + 8 * i);
            if (v30)
            {
              hash(a1, *v30);
              unint64_t v32 = v31 & v27;
              if (*((void *)v25 + (v31 & v27)))
              {
                LODWORD(v33) = 0;
                do
                {
                  if ((_DWORD)v33) {
                    unint64_t v33 = v33;
                  }
                  else {
                    unint64_t v33 = ((v31 & (unint64_t)-v26) >> (v42 - 1)) & (v27 >> 2) | 1;
                  }
                  BOOL v34 = v32 >= v33;
                  unint64_t v35 = v32 - v33;
                  if (v34) {
                    uint64_t v36 = 0LL;
                  }
                  else {
                    uint64_t v36 = 1LL << v23;
                  }
                  unint64_t v32 = v35 + v36;
                }

                while (*((void *)v25 + v32));
              }

              *((void *)v25 + v32) = *(void *)(*a2 + 8 * i);
              unint64_t v28 = a2[2];
            }
          }
        }

        (*(void (**)(void))(a2[4] + 16))(*a2);
        *a2 = (uint64_t)v25;
        *((_BYTE *)a2 + 8) = v23;
        a2[2] = v26;
        unint64_t v12 = v27 & v10;
        if (*((void *)v25 + (v27 & v10)))
        {
          LODWORD(v37) = 0;
          do
          {
            if ((_DWORD)v37) {
              unint64_t v37 = v37;
            }
            else {
              unint64_t v37 = ((v10 & (unint64_t)-v26) >> (v42 - 1)) & (v27 >> 2) | 1;
            }
            unint64_t v38 = v12 - v37;
            if (v12 >= v37) {
              uint64_t v39 = 0LL;
            }
            else {
              uint64_t v39 = 1LL << v23;
            }
            unint64_t v12 = v38 + v39;
          }

          while (*((void *)v25 + v38 + v39));
        }

        goto LABEL_45;
      }
    }

    return 0LL;
  }

  unsigned int v14 = 0;
  while (*a3 != **(_BYTE **)result)
  {
LABEL_8:
    if (!v14) {
      unsigned int v14 = ((v10 & (unint64_t)-v11) >> (*((_BYTE *)a2 + 8) - 1)) & ((unint64_t)(v11 - 1) >> 2) | 1;
    }
    unint64_t v20 = v12 - v14;
    if (v12 >= v14) {
      uint64_t v21 = 0LL;
    }
    else {
      uint64_t v21 = a2[2];
    }
    unint64_t v12 = v20 + v21;
    uint64_t result = *(_OWORD **)(*a2 + 8 * (v20 + v21));
    if (!result) {
      goto LABEL_14;
    }
  }

  BOOL v15 = (unsigned __int8 *)(*(void *)result + 1LL);
  uint64_t v16 = (unsigned __int8 *)(a3 + 1);
  int v17 = *a3;
  while (v17)
  {
    int v18 = *v16++;
    int v17 = v18;
    int v19 = *v15++;
    if (v17 != v19) {
      goto LABEL_8;
    }
  }

  return result;
}

_BYTE *normalizePublicId(_BYTE *result)
{
  LOBYTE(v1) = *result;
  if (!*result) {
    goto LABEL_15;
  }
  uint64_t v2 = 1LL;
  unint64_t v3 = result;
  do
  {
    uint64_t v4 = v3;
    unint64_t v3 = result;
    if (v4 == result) {
      goto LABEL_10;
    }
    if (*(v4 - 1) != 32)
    {
      LOBYTE(v1) = 32;
LABEL_8:
      *v4++ = v1;
    }

    unint64_t v3 = v4;
LABEL_10:
    int v1 = result[v2++];
  }

  while (v1);
  if (v3 != result)
  {
    if (*(v3 - 1) == 32) {
      uint64_t result = v3 - 1;
    }
    else {
      uint64_t result = v3;
    }
  }

LABEL_15:
  *uint64_t result = 0;
  return result;
}

uint64_t contentProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v5 = doContent(a1, 0, *(void *)(a1 + 304), a2, a3, a4, *(_BYTE *)(a1 + 924) == 0, 0);
  return v5;
}

_OWORD *getElementType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(uint64_t **)(a1 + 688);
  int v6 = (char *)poolStoreString(v5 + 20, a2, a3, a4);
  if (!v6) {
    return 0LL;
  }
  uint64_t v7 = v6;
  __n128 v8 = lookup(a1, v5 + 5, v6, 0x28uLL);
  uint64_t v9 = v8;
  if (v8)
  {
    if (*(char **)v8 != v7)
    {
      v5[23] = v5[24];
      return v9;
    }

    v5[24] = v5[23];
    return 0LL;
  }

  return v9;
}

_OWORD *getAttributeId(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = *(void *)(a1 + 688);
  uint64_t v9 = *(_BYTE **)(v8 + 184);
  if (v9 == *(_BYTE **)(v8 + 176))
  {
    uint64_t v9 = *(_BYTE **)(v8 + 184);
  }

  *(void *)(v8 + 184) = v9 + 1;
  *uint64_t v9 = 0;
  uint64_t v10 = poolStoreString((uint64_t *)(v8 + 160), a2, a3, a4);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = (_BYTE *)v10;
  unint64_t v12 = (_BYTE *)(v10 + 1);
  uint64_t v13 = lookup(a1, (uint64_t *)(v8 + 80), (char *)(v10 + 1), 0x18uLL);
  unsigned int v14 = v13;
  if (v13)
  {
    if (*(_BYTE **)v13 != v12)
    {
      uint64_t v15 = *(void *)(v8 + 192);
LABEL_8:
      *(void *)(v8 + 184) = v15;
      return v14;
    }

    uint64_t v16 = *(_BYTE **)(v8 + 184);
    *(void *)(v8 + 192) = v16;
    if (!*(_BYTE *)(a1 + 472)) {
      return v14;
    }
    int v17 = *v12;
    if (v17 == 120 && v11[2] == 109 && v11[3] == 108 && v11[4] == 110 && v11[5] == 115)
    {
      if (v11[6] == 58)
      {
        int v18 = lookup(a1, (uint64_t *)(v8 + 120), v11 + 7, 0x10uLL);
        goto LABEL_38;
      }

      if (!v11[6])
      {
        int v18 = (_OWORD *)(v8 + 304);
LABEL_38:
        *((void *)v14 + 1) = v18;
        *((_BYTE *)v14 + 17) = 1;
        return v14;
      }
    }

    uint64_t v19 = 0LL;
    if (!*v12) {
      return v14;
    }
    while (v17 != 58)
    {
      int v17 = v11[v19++ + 2];
      if (!v17) {
        return v14;
      }
    }

    if (v19)
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        uint64_t v21 = *(_BYTE **)(v8 + 184);
        if (v21 == *(_BYTE **)(v8 + 176))
        {
          uint64_t v21 = *(_BYTE **)(v8 + 184);
        }

        char v22 = v12[i];
        *(void *)(v8 + 184) = v21 + 1;
        _BYTE *v21 = v22;
      }

      uint64_t v16 = *(_BYTE **)(v8 + 184);
    }

    if (v16 == *(_BYTE **)(v8 + 176))
    {
      uint64_t v16 = *(_BYTE **)(v8 + 184);
    }

    *(void *)(v8 + 184) = v16 + 1;
    *uint64_t v16 = 0;
    char v23 = lookup(a1, (uint64_t *)(v8 + 120), *(char **)(v8 + 192), 0x10uLL);
    *((void *)v14 + 1) = v23;
    if (v23)
    {
      uint64_t v15 = *(void *)(v8 + 192);
      if (*(void *)v23 == v15)
      {
        *(void *)(v8 + 192) = *(void *)(v8 + 184);
        return v14;
      }

      goto LABEL_8;
    }

    return 0LL;
  }

  return v14;
}

uint64_t poolAppend(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v9 = a3;
  uint64_t v7 = a1 + 3;
  if (a1[3]) {
    goto LABEL_3;
  }
  while (poolGrow(a1))
  {
LABEL_3:
    if ((*(unsigned int (**)(uint64_t, uint64_t *, uint64_t, uint64_t *, uint64_t))(a2 + 112))( a2,  &v9,  a4,  v7,  a1[2]) < 2) {
      return a1[4];
    }
  }

  return 0LL;
}

uint64_t defineAttribute(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  int v10 = *(_DWORD *)(a1 + 24);
  if (a4 || a5)
  {
    if (v10 >= 1)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      uint64_t v12 = *(unsigned int *)(a1 + 24);
      while (*v11 != a2)
      {
        v11 += 3;
        if (!--v12) {
          goto LABEL_7;
        }
      }

      return 1LL;
    }

LABEL_7:
    if (a4 && !*(void *)(a1 + 16) && !*(_BYTE *)(a2 + 17)) {
      *(void *)(a1 + 16) = a2;
    }
  }

  if (v10 != *(_DWORD *)(a1 + 28))
  {
    uint64_t result = *(void *)(a1 + 32);
LABEL_16:
    int v15 = *(_DWORD *)(a1 + 24);
    uint64_t v16 = result + 24LL * v15;
    *(void *)uint64_t v16 = a2;
    *(void *)(v16 + 16) = a5;
    *(_BYTE *)(v16 + 8) = a3;
    if (!a3) {
      *(_BYTE *)(a2 + 16) = 1;
    }
    *(_DWORD *)(a1 + 24) = v15 + 1;
    return 1LL;
  }

  int v13 = v10;
  if (!v10)
  {
    *(_DWORD *)(a1 + 28) = 8;
    uint64_t result = (*(uint64_t (**)(uint64_t))(a6 + 24))(192LL);
    *(void *)(a1 + 32) = result;
    if (!result)
    {
      *(_DWORD *)(a1 + 28) = 0;
      return result;
    }

    goto LABEL_16;
  }

  if (v10 > 0x3FFFFFFF) {
    return 0LL;
  }
  uint64_t result = (*(uint64_t (**)(void, uint64_t))(a6 + 32))(*(void *)(a1 + 32), 48LL * v10);
  if (result)
  {
    *(_DWORD *)(a1 + 28) = 2 * v13;
    *(void *)(a1 + 32) = result;
    goto LABEL_16;
  }

  return result;
}

      ++a4[1];
    }

    while (a3 - (uint64_t)a2 > 1);
  }

  return result;
}

      ++a4[1];
    }

    while (a3 - (uint64_t)a2 > 1);
  }

  return result;
}

uint64_t poolGrow(uint64_t *a1)
{
  uint64_t v2 = a1[1];
  if (!v2) {
    goto LABEL_5;
  }
  unint64_t v3 = (const void *)a1[4];
  if (!v3)
  {
    uint64_t v20 = *(void *)v2;
    *a1 = v2;
    a1[1] = v20;
    *(void *)uint64_t v2 = 0LL;
    a1[4] = v2 + 12;
    a1[2] = v2 + 12 + *(int *)(v2 + 8);
    a1[3] = v2 + 12;
    return 1LL;
  }

  int64_t v4 = a1[2] - (void)v3;
  if (v4 >= *(int *)(v2 + 8))
  {
LABEL_5:
    uint64_t v9 = a1[4];
    unsigned int v10 = *((_DWORD *)a1 + 4) - v9;
    if (*a1) {
      BOOL v11 = v9 == *a1 + 12;
    }
    else {
      BOOL v11 = 0;
    }
    if (v11)
    {
      unsigned int v14 = 2 * v10;
      if (((2 * v10) & 0x80000000) == 0 && v14 && (int)(v14 + 12) >= 1)
      {
        uint64_t v16 = a1[3];
        uint64_t result = (*(uint64_t (**)(void))(a1[5] + 8))();
        if (!result) {
          return result;
        }
        *a1 = result;
        *(_DWORD *)(result + 8) = v14;
        uint64_t v18 = result + 12 + v16 - v9;
        a1[4] = result + 12;
        uint64_t v19 = result + 12 + v14;
LABEL_28:
        a1[2] = v19;
        a1[3] = v18;
        return 1LL;
      }
    }

    else if ((v10 & 0x80000000) == 0)
    {
      if (v10 < 0x400)
      {
        unsigned int v12 = 1024;
        unsigned int v13 = 1036;
LABEL_23:
        uint64_t result = (*(uint64_t (**)(void))a1[5])(v13);
        if (!result) {
          return result;
        }
        uint64_t v21 = result;
        *(_DWORD *)(result + 8) = v12;
        *(void *)uint64_t result = *a1;
        *a1 = result;
        char v23 = (_BYTE *)a1[3];
        char v22 = (_BYTE *)a1[4];
        if (v23 == v22)
        {
          uint64_t v24 = a1[3];
        }

        else
        {
          memcpy((void *)(result + 12), v22, v23 - v22);
          uint64_t v24 = a1[3];
          char v23 = (_BYTE *)a1[4];
        }

        uint64_t v18 = v21 + 12 + v24 - (void)v23;
        a1[4] = v21 + 12;
        uint64_t v19 = v21 + 12 + v12;
        goto LABEL_28;
      }

      if (v10 <= 0x3FFFFFF9)
      {
        unsigned int v12 = 2 * v10;
        unsigned int v13 = 2 * v10 + 12;
        goto LABEL_23;
      }
    }

    return 0LL;
  }

  uint64_t v5 = *(void *)v2;
  *(void *)uint64_t v2 = *a1;
  *a1 = v2;
  a1[1] = v5;
  memcpy((void *)(v2 + 12), v3, v4);
  uint64_t v6 = *a1;
  uint64_t v7 = *a1 + 12;
  uint64_t v8 = v7 + a1[3] - a1[4];
  a1[4] = v7;
  a1[2] = v7 + *(int *)(v6 + 8);
  a1[3] = v8;
  return 1LL;
}

uint64_t storeAttributeValue( uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t *a6, int a7)
{
  int v8 = a3;
  uint64_t result = appendAttributeValue(a1, a2, a3, a4, a5, a6, a7);
  if (!(_DWORD)result)
  {
    unsigned int v10 = (_BYTE *)a6[3];
    if (!v8 && v10 != (_BYTE *)a6[4] && *(v10 - 1) == 32) {
      a6[3] = (uint64_t)--v10;
    }
    if (v10 == (_BYTE *)a6[2])
    {
      unsigned int v10 = (_BYTE *)a6[3];
    }

    uint64_t result = 0LL;
    a6[3] = (uint64_t)(v10 + 1);
    *unsigned int v10 = 0;
  }

  return result;
}

uint64_t storeEntityValue(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, int a5)
{
  unsigned int v10 = *(void **)(a1 + 688);
  uint64_t v12 = v10[26];
  BOOL v11 = v10 + 26;
  int v13 = *(_DWORD *)(a1 + 536);
  *(_DWORD *)(a1 + 536) = 1;
  while (2)
  {
    unint64_t v26 = (unint64_t)a3;
    int v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unint64_t *))(a2 + 40))( a2,  a3,  a4,  &v26);
    if (!accountingDiffTolerated(a1, v14, a3, v26, 6213, a5))
    {
      accountingReportStats((void *)a1, " ABORTING\n");
      uint64_t v16 = 43LL;
      goto LABEL_35;
    }

    int v15 = v14 + 4;
    uint64_t v16 = 0LL;
    switch(v15)
    {
      case 0:
        goto LABEL_35;
      case 1:
        unint64_t v26 = (unint64_t)&a3[*(int *)(a2 + 128)];
        goto LABEL_8;
      case 3:
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = a3;
        }
        goto LABEL_31;
      case 4:
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = v26;
        }
LABEL_31:
        uint64_t v16 = 4LL;
        goto LABEL_35;
      case 10:
      case 13:
        goto LABEL_12;
      case 11:
LABEL_8:
        int v17 = (_BYTE *)v10[29];
        if ((_BYTE *)v10[28] != v17) {
          goto LABEL_11;
        }
        int v17 = (_BYTE *)v10[29];
LABEL_11:
        v10[29] = v17 + 1;
        _BYTE *v17 = 10;
        goto LABEL_12;
      case 14:
        unsigned int v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a2 + 80))(a2, a3);
        if ((v18 & 0x80000000) == 0)
        {
          int v19 = XmlUtf8Encode(v18, v25);
          if (v19 >= 1)
          {
            uint64_t v20 = v19;
            uint64_t v21 = v25;
            do
            {
              char v22 = (_BYTE *)v10[29];
              if ((_BYTE *)v10[28] == v22)
              {
                if (!poolGrow(v11))
                {
LABEL_21:
                  uint64_t v16 = 1LL;
                  goto LABEL_35;
                }

                char v22 = (_BYTE *)v10[29];
              }

              char v23 = *v21++;
              v10[29] = v22 + 1;
              _BYTE *v22 = v23;
              --v20;
            }

            while (v20);
          }

uint64_t doIgnoreSection(uint64_t a1, uint64_t a2, unsigned __int8 **a3, uint64_t a4, void *a5, int a6)
{
  BOOL v11 = *a3;
  int v17 = *a3;
  if (*(void *)(a1 + 304) == a2)
  {
    uint64_t v12 = (void *)(a1 + 560);
    *(void *)(a1 + 560) = v11;
    int v13 = (unsigned __int8 **)(a1 + 568);
  }

  else
  {
    uint64_t v12 = *(void **)(a1 + 584);
    int v13 = (unsigned __int8 **)(v12 + 1);
  }

  *uint64_t v12 = v11;
  *a3 = 0LL;
  int v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unsigned __int8 **))(a2 + 24))( a2,  v11,  a4,  &v17);
  if (accountingDiffTolerated(a1, v14, v11, (unint64_t)v17, 4271, 0))
  {
    uint64_t v15 = (uint64_t)v17;
    _OWORD *v13 = v17;
    switch(v14)
    {
      case -4:
      case -1:
        if (a6) {
          goto LABEL_17;
        }
        uint64_t result = 2LL;
        break;
      case -3:
        goto LABEL_15;
      case -2:
        if (a6)
        {
LABEL_17:
          uint64_t result = 0LL;
          *a5 = v11;
        }

        else
        {
          uint64_t result = 6LL;
        }

        break;
      case 0:
        *uint64_t v12 = v15;
        uint64_t result = 4LL;
        break;
      default:
        if (v14 == 42)
        {
          if (*(void *)(a1 + 176))
          {
            reportDefault(a1, a2, (uint64_t)v11, v15);
            uint64_t v15 = (uint64_t)v17;
          }

          *a3 = (unsigned __int8 *)v15;
          *a5 = v15;
          if (*(_DWORD *)(a1 + 920) == 2) {
            uint64_t result = 35LL;
          }
          else {
            uint64_t result = 0LL;
          }
        }

        else
        {
LABEL_15:
          *uint64_t v12 = v15;
          uint64_t result = 23LL;
        }

        break;
    }
  }

  else
  {
    accountingReportStats((void *)a1, " ABORTING\n");
    return 43LL;
  }

  return result;
}

uint64_t ignoreSectionProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  uint64_t v9 = a2;
  uint64_t result = doIgnoreSection(a1, *(void *)(a1 + 304), &v9, a3, a4, *(_BYTE *)(a1 + 924) == 0);
  if (!(_DWORD)result)
  {
    int v8 = v9;
    if (v9)
    {
      *(void *)(a1 + 544) = prologProcessor;
      return prologProcessor(a1, v8, a3, a4);
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t nextScaffoldPart(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 688);
  if (!*(void *)(v2 + 352))
  {
    unint64_t v3 = (_DWORD *)(*(uint64_t (**)(uint64_t))(a1 + 24))(4LL * *(unsigned int *)(a1 + 904));
    *(void *)(v2 + 352) = v3;
    if (!v3) {
      return 0xFFFFFFFFLL;
    }
    *unint64_t v3 = 0;
  }

  uint64_t v4 = *(unsigned int *)(v2 + 344);
  unsigned int v5 = *(_DWORD *)(v2 + 340);
  uint64_t v6 = *(void *)(v2 + 328);
  if (v4 >= v5)
  {
    if (v6)
    {
      if ((v5 & 0x80000000) == 0)
      {
        uint64_t v6 = (*(uint64_t (**)(void))(a1 + 32))();
        if (v6)
        {
          int v7 = 2 * *(_DWORD *)(v2 + 340);
LABEL_11:
          *(_DWORD *)(v2 + 340) = v7;
          *(void *)(v2 + 328) = v6;
          uint64_t v4 = *(unsigned int *)(v2 + 344);
          goto LABEL_12;
        }
      }
    }

    else
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 24))(1024LL);
      if (v6)
      {
        int v7 = 32;
        goto LABEL_11;
      }
    }

    return 0xFFFFFFFFLL;
  }

uint64_t processInternalEntity(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6 = *(void *)(a1 + 592);
  if (v6)
  {
    *(void *)(a1 + 592) = *(void *)(v6 + 16);
  }

  else
  {
    uint64_t v6 = (*(uint64_t (**)(uint64_t))(a1 + 24))(40LL);
    if (!v6) {
      return 1LL;
    }
  }

  *(_BYTE *)(a2 + 56) = 1;
  entityTrackingOnOpen(a1, a2, 5841);
  *(_DWORD *)(a2 + 20) = 0;
  uint64_t v7 = *(void *)(a1 + 584);
  *(void *)(a1 + 584) = v6;
  *(void *)(v6 + 16) = v7;
  *(void *)(v6 + 24) = a2;
  uint64_t v8 = *(unsigned int *)(a1 + 604);
  *(_DWORD *)(v6 + 32) = v8;
  *(_BYTE *)(v6 + 36) = a3;
  *(void *)uint64_t v6 = 0LL;
  *(void *)(v6 + 8) = 0LL;
  uint64_t v9 = *(void *)(a2 + 8);
  uint64_t v10 = v9 + *(int *)(a2 + 16);
  uint64_t v16 = v9;
  BOOL v11 = *(uint64_t (***)(void, uint64_t, uint64_t, uint64_t *))(a1 + 456);
  if (*(_BYTE *)(a2 + 57))
  {
    uint64_t v12 = (*v11)(*(void *)(a1 + 456), v9, v10, &v16);
    uint64_t result = doProlog(a1, *(void *)(a1 + 456), v9, v10, v12, v16, &v16, 0LL, 0);
    if ((_DWORD)result) {
      return result;
    }
  }

  else
  {
    uint64_t result = doContent(a1, v8, v11, v9, v10, &v16, 0LL, 1LL);
    if ((_DWORD)result) {
      return result;
    }
  }

  if (v10 == v16 || *(_DWORD *)(a1 + 920) != 3)
  {
    if (*(void *)(*(void *)(a1 + 584) + 24LL) == a2)
    {
      uint64_t v14 = a1;
      do
      {
        uint64_t v15 = v14;
        uint64_t v14 = *(void *)(v14 + 912);
      }

      while (v14);
      entityTrackingReportStats(v15, a2, "CLOSE", 5874);
      uint64_t result = 0LL;
      --*(_DWORD *)(v15 + 988);
      *(_BYTE *)(a2 + 56) = 0;
      *(void *)(a1 + 584) = *(void *)(v6 + 16);
      *(void *)(v6 + 16) = *(void *)(a1 + 592);
      *(void *)(a1 + 592) = v6;
    }

    else
    {
      return 0LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    *(_DWORD *)(a2 + 20) = v16 - v9;
    *(void *)(a1 + 544) = internalEntityProcessor;
  }

  return result;
}

uint64_t entityTrackingOnOpen(uint64_t a1, uint64_t a2, int a3)
{
  do
  {
    uint64_t v4 = (_DWORD *)a1;
    a1 = *(void *)(a1 + 912);
  }

  while (a1);
  ++v4[246];
  unsigned int v5 = v4[247] + 1;
  v4[247] = v5;
  unsigned int v6 = v4[248];
  if (v5 > v6) {
    v4[248] = v6 + 1;
  }
  return entityTrackingReportStats((uint64_t)v4, a2, "OPEN ", a3);
}

uint64_t reportProcessingInstruction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 144))
  {
    uint64_t v7 = a3 + 2LL * *(int *)(a2 + 128);
    uint64_t v8 = v7 + (*(int (**)(uint64_t, uint64_t))(a2 + 56))(a2, v7);
    uint64_t result = poolStoreString((uint64_t *)(a1 + 800), a2, v7, v8);
    if (result)
    {
      uint64_t v10 = result;
      *(void *)(a1 + 832) = *(void *)(a1 + 824);
      uint64_t v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 64))(a2, v8);
      uint64_t result = poolStoreString((uint64_t *)(a1 + 800), a2, v11, a4 - 2LL * *(int *)(a2 + 128));
      if (result)
      {
        uint64_t v12 = result;
        normalizeLines((_BYTE *)result);
        (*(void (**)(void, uint64_t, uint64_t))(a1 + 144))(*(void *)(a1 + 8), v10, v12);
        int v13 = *(void **)(a1 + 808);
        uint64_t v14 = *(void **)(a1 + 800);
        if (v13)
        {
          if (!v14)
          {
LABEL_13:
            *(void *)(a1 + 800) = 0LL;
            *(void *)(a1 + 816) = 0LL;
            *(void *)(a1 + 832) = 0LL;
            uint64_t result = 1LL;
            *(void *)(a1 + 824) = 0LL;
            return result;
          }

          do
          {
            uint64_t v15 = v14;
            uint64_t v14 = (void *)*v14;
            *uint64_t v15 = v13;
            int v13 = v15;
          }

          while (v14);
        }

        else
        {
          uint64_t v15 = *(void **)(a1 + 800);
        }

        *(void *)(a1 + 808) = v15;
        goto LABEL_13;
      }
    }
  }

  else
  {
    if (*(void *)(a1 + 176)) {
      reportDefault(a1, a2, a3, a4);
    }
    return 1LL;
  }

  return result;
}

uint64_t reportComment(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a1 + 152))
  {
    uint64_t result = poolStoreString((uint64_t *)(a1 + 800), a2, a3 + 4LL * *(int *)(a2 + 128), a4 - 3LL * *(int *)(a2 + 128));
    if (!result) {
      return result;
    }
    uint64_t v6 = result;
    normalizeLines((_BYTE *)result);
    (*(void (**)(void, uint64_t))(a1 + 152))(*(void *)(a1 + 8), v6);
    uint64_t v7 = *(void **)(a1 + 808);
    uint64_t v8 = *(void **)(a1 + 800);
    if (v7)
    {
      if (!v8)
      {
LABEL_12:
        *(void *)(a1 + 800) = 0LL;
        *(void *)(a1 + 816) = 0LL;
        *(void *)(a1 + 832) = 0LL;
        uint64_t result = 1LL;
        *(void *)(a1 + 824) = 0LL;
        return result;
      }

      do
      {
        uint64_t v9 = v8;
        uint64_t v8 = (void *)*v8;
        *uint64_t v9 = v7;
        uint64_t v7 = v9;
      }

      while (v8);
    }

    else
    {
      uint64_t v9 = *(void **)(a1 + 800);
    }

    *(void *)(a1 + 808) = v9;
    goto LABEL_12;
  }

  if (*(void *)(a1 + 176)) {
    reportDefault(a1, a2, a3, a4);
  }
  return 1LL;
}

float accountingGetCurrentAmplification(void *a1)
{
  if (a1[114]) {
    accountingGetCurrentAmplification_cold_1();
  }
  unint64_t v1 = a1[118];
  uint64_t v2 = 22LL;
  if (v1) {
    uint64_t v2 = a1[118];
  }
  float v3 = (float)v1;
  if (!v1) {
    float v3 = 22.0;
  }
  return (float)(unint64_t)(a1[119] + v2) / v3;
}

void *accountingReportStats(void *result, const char *a2)
{
  do
  {
    float v3 = result;
    uint64_t result = (void *)result[114];
  }

  while (result);
  if (v3[120])
  {
    float CurrentAmplification = accountingGetCurrentAmplification(v3);
    return (void *)fprintf( (FILE *)*MEMORY[0x1895F89D0],  "expat: Accounting(%p): Direct %10llu, indirect %10llu, amplification %8.2f%s",  v3,  v3[118],  v3[119],  CurrentAmplification,  a2);
  }

  return result;
}

int8x8_t hash(uint64_t a1, char *a2)
{
  v11[3] = *MEMORY[0x1895F89C0];
  do
  {
    uint64_t v2 = a1;
    a1 = *(void *)(a1 + 912);
  }

  while (a1);
  uint64_t v3 = *(void *)(v2 + 936);
  v8.i64[0] = 0x736F6D6570736575LL;
  v8.i64[1] = v3 ^ 0x646F72616E646F6DLL;
  uint64_t v9 = 0x6C7967656E657261LL;
  uint64_t v10 = v3 ^ 0x7465646279746573LL;
  v11[1] = v11;
  v11[2] = 0LL;
  if (*a2)
  {
    uint64_t v4 = 0LL;
    do
      uint64_t v5 = v4 + 1;
    while (a2[++v4]);
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  sip24_update(v8.i64, a2, v5);
  return sip24_final(&v8);
}

uint64_t *sip24_update(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v3 = a2;
  unint64_t v5 = (unint64_t)&a2[a3];
  uint64_t v6 = (_BYTE **)(a1 + 5);
  uint64_t v7 = a1 + 4;
  uint64_t v8 = (uint64_t)&a2[a3 - 1];
  do
  {
    if ((unint64_t)v3 >= v5)
    {
      BOOL v13 = 0;
    }

    else
    {
      uint64_t v9 = *v6;
      if (*v6 >= (_BYTE *)v6)
      {
        BOOL v13 = 1;
      }

      else
      {
        uint64_t v10 = v8 - (void)v3;
        while (1)
        {
          uint64_t v11 = v3;
          char v12 = *v3++;
          char *v6 = v9 + 1;
          *uint64_t v9 = v12;
          if (!v10) {
            break;
          }
          uint64_t v9 = *v6;
          --v10;
          if (*v6 >= (_BYTE *)v6) {
            goto LABEL_11;
          }
        }

        uint64_t v3 = (char *)v5;
LABEL_11:
        BOOL v13 = (unint64_t)(v11 + 1) < v5;
      }
    }

    if (*v6 < (_BYTE *)v6) {
      break;
    }
    uint64_t v14 = a1[4];
    a1[3] ^= v14;
    sip_round(a1, 2);
    *a1 ^= v14;
    uint64_t v15 = a1[6] + 8;
    a1[5] = (uint64_t)v7;
    a1[6] = v15;
  }

  while (v13);
  return a1;
}

int8x8_t sip24_final(int8x16_t *a1)
{
  __int32 v2 = a1[2].i32[2] - ((_DWORD)a1 + 32);
  unint64_t v3 = (unint64_t)(v2 + a1[3].i32[0]) << 56;
  switch((char)v2)
  {
    case 1:
      goto LABEL_8;
    case 2:
      goto LABEL_7;
    case 3:
      goto LABEL_6;
    case 4:
      goto LABEL_5;
    case 5:
      goto LABEL_4;
    case 6:
      goto LABEL_3;
    case 7:
      v3 |= (unint64_t)a1[2].u8[6] << 48;
LABEL_3:
      v3 |= (unint64_t)a1[2].u8[5] << 40;
LABEL_4:
      v3 |= (unint64_t)a1[2].u8[4] << 32;
LABEL_5:
      v3 |= (unint64_t)a1[2].u8[3] << 24;
LABEL_6:
      v3 |= (unint64_t)a1[2].u8[2] << 16;
LABEL_7:
      v3 |= (unint64_t)a1[2].u8[1] << 8;
LABEL_8:
      v3 |= a1[2].u8[0];
      break;
    default:
      break;
  }

  a1[1].i64[1] ^= v3;
  sip_round(a1->i64, 2);
  a1->i64[0] ^= v3;
  a1[1].i64[0] ^= 0xFFuLL;
  sip_round(a1->i64, 4);
  int8x16_t v4 = veorq_s8(*a1, a1[1]);
  return veor_s8(*(int8x8_t *)v4.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v4, v4, 8uLL));
}

uint64_t *sip_round(uint64_t *result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = *result;
    uint64_t v3 = result[1];
    uint64_t v5 = result[2];
    uint64_t v4 = result[3];
    do
    {
      uint64_t v6 = v2 + v3;
      uint64_t v7 = v6 ^ __ROR8__(v3, 51);
      uint64_t v8 = v5 + v4;
      uint64_t v9 = __ROR8__(v4, 48);
      uint64_t v2 = (v8 ^ v9) + __ROR8__(v6, 32);
      uint64_t v4 = v2 ^ __ROR8__(v8 ^ v9, 43);
      uint64_t v10 = v8 + v7;
      uint64_t v3 = v10 ^ __ROR8__(v7, 47);
      uint64_t v5 = __ROR8__(v10, 32);
      --a2;
    }

    while (a2);
    *uint64_t result = v2;
    result[1] = v3;
    result[2] = v5;
    result[3] = v4;
  }

  return result;
}

uint64_t doContent( uint64_t a1, int a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 **a6, int a7, int a8)
{
  int v8 = a7;
  unsigned int v114 = a4;
  uint64_t v14 = *(void *)(a1 + 688);
  if (*(void *)(a1 + 304) == a3)
  {
    uint64_t v15 = (void *)(a1 + 560);
    uint64_t v16 = (void *)(a1 + 568);
  }

  else
  {
    uint64_t v15 = *(void **)(a1 + 584);
    uint64_t v16 = v15 + 1;
  }

  *uint64_t v15 = a4;
  uint64_t v107 = (void *)(a1 + 816);
  uint64_t v108 = (uint64_t *)(a1 + 800);
  uint64_t v104 = v14;
  v105 = (uint64_t *)(v14 + 160);
  while (2)
  {
    int v113 = v114;
    int v17 = (*(uint64_t (**)(uint64_t))(a3 + 8))(a3);
    int v18 = v17;
    if (v17 == -3 || v17 == -5)
    {
      uint64_t v20 = v114;
      if (v8) {
        uint64_t v21 = v114;
      }
      else {
        uint64_t v21 = (unsigned __int8 *)a5;
      }
    }

    else
    {
      uint64_t v21 = v113;
      uint64_t v20 = v114;
    }

    if (!accountingDiffTolerated(a1, v17, v20, (unint64_t)v21, 2848, a8))
    {
      accountingReportStats((void *)a1, " ABORTING\n");
      return 43LL;
    }

    char v22 = v113;
    *uint64_t v16 = v113;
    uint64_t v23 = 17LL;
    switch(v18)
    {
      case -5:
        if (v8) {
          goto LABEL_166;
        }
        uint64_t v96 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 136);
        if (v96)
        {
          if (*(_BYTE *)(a3 + 132))
          {
            uint64_t v97 = *(void *)(a1 + 8);
            uint64_t v98 = v114;
            uint64_t v99 = (a5 - (_DWORD)v114);
          }

          else
          {
            uint64_t v102 = *(void *)(a1 + 112);
            v111[0] = *(char **)(a1 + 104);
            (*(void (**)(uint64_t, unsigned __int8 **, uint64_t, char **, uint64_t))(a3 + 112))( a3,  &v114,  a5,  v111,  v102);
            uint64_t v96 = *(void (**)(uint64_t, unsigned __int8 *, uint64_t))(a1 + 136);
            uint64_t v97 = *(void *)(a1 + 8);
            uint64_t v98 = *(unsigned __int8 **)(a1 + 104);
            uint64_t v99 = (LODWORD(v111[0]) - (_DWORD)v98);
          }

          v96(v97, v98, v99);
        }

        else if (*(void *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v114, a5);
        }

        if (!a2)
        {
          *uint64_t v15 = a5;
          return 3LL;
        }

        if (*(_DWORD *)(a1 + 604) == a2) {
          goto LABEL_193;
        }
        *uint64_t v15 = a5;
        return 13LL;
      case -4:
        if (v8) {
          goto LABEL_166;
        }
        if (a2 < 1) {
          return 3LL;
        }
        if (*(_DWORD *)(a1 + 604) != a2) {
          return 13LL;
        }
LABEL_166:
        uint64_t v23 = 0LL;
        uint64_t v94 = v114;
        goto LABEL_167;
      case -3:
        if (v8) {
          goto LABEL_166;
        }
        *uint64_t v16 = a5;
        uint64_t v100 = *(void (**)(void, char **, uint64_t))(a1 + 136);
        if (v100)
        {
          LOBYTE(v111[0]) = 10;
          v100(*(void *)(a1 + 8), v111, 1LL);
        }

        else if (*(void *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v114, a5);
        }

        if (!a2) {
          return 3LL;
        }
        if (*(_DWORD *)(a1 + 604) != a2) {
          return 13LL;
        }
LABEL_193:
        uint64_t v23 = 0LL;
        *a6 = (unsigned __int8 *)a5;
        return v23;
      case -2:
        if (v8) {
          goto LABEL_166;
        }
        return 6LL;
      case -1:
        if (v8) {
          goto LABEL_166;
        }
        return 5LL;
      case 0:
        *uint64_t v15 = v22;
        return 4LL;
      case 1:
      case 2:
        uint64_t v24 = *(void *)(a1 + 712);
        int v106 = a2;
        if (v24)
        {
          *(void *)(a1 + 712) = *(void *)v24;
LABEL_69:
          *(void *)(v24 + 80) = 0LL;
          *(void *)uint64_t v24 = *(void *)(a1 + 704);
          *(void *)(a1 + 704) = v24;
          *(void *)(v24 + 32) = 0LL;
          *(void *)(v24 + 40) = 0LL;
          *(void *)(v24 + 8) = &v114[*(int *)(a3 + 128)];
          int v60 = (*(uint64_t (**)(uint64_t))(a3 + 56))(a3);
          *(_DWORD *)(v24 + 16) = v60;
          ++*(_DWORD *)(a1 + 604);
          unint64_t v61 = *(void *)(v24 + 8) + v60;
          unint64_t v112 = *(void *)(v24 + 8);
          uint64_t v62 = *(void *)(v24 + 72);
          v111[0] = *(char **)(v24 + 64);
          int v63 = (*(uint64_t (**)(uint64_t, unint64_t *, unint64_t, char **, uint64_t))(a3 + 112))( a3,  &v112,  v61,  v111,  v62 - 1);
          __int128 v64 = v111[0];
          uint64_t v65 = *(void *)(v24 + 64);
          int v66 = LODWORD(v111[0]) - v65;
          if (v112 < v61 && v63 != 1)
          {
            v103 = a6;
            do
            {
              uint64_t v67 = 2 * (*(_DWORD *)(v24 + 72) - (int)v65);
              uint64_t v68 = (*(uint64_t (**)(void))(a1 + 32))();
              if (!v68) {
                return 1LL;
              }
              *(void *)(v24 + 64) = v68;
              *(void *)(v24 + 72) = v68 + v67;
              v111[0] = (char *)(v68 + v66);
              int v69 = (*(uint64_t (**)(uint64_t, unint64_t *, unint64_t, char **, uint64_t))(a3 + 112))( a3,  &v112,  v61,  v111,  v68 + v67 - 1);
              __int128 v64 = v111[0];
              uint64_t v65 = *(void *)(v24 + 64);
              int v66 = LODWORD(v111[0]) - v65;
            }

            while (v112 < v61 && v69 != 1);
            a6 = v103;
          }

          *(_DWORD *)(v24 + 48) = v66;
          *(void *)(v24 + 24) = v65;
          *__int128 v64 = 0;
          uint64_t v71 = storeAtts(a1, a3, (uint64_t)v114, (char **)(v24 + 24), (uint64_t *)(v24 + 80), a8);
          if ((_DWORD)v71) {
            return v71;
          }
          BOOL v72 = *(void (**)(void, void, void))(a1 + 120);
          if (v72)
          {
            v72(*(void *)(a1 + 8), *(void *)(v24 + 24), *(void *)(a1 + 752));
            a2 = v106;
            int v8 = a7;
          }

          else
          {
            a2 = v106;
            int v8 = a7;
            if (*(void *)(a1 + 176)) {
              reportDefault(a1, a3, (uint64_t)v114, (uint64_t)v113);
            }
          }

          uint64_t v76 = *(void **)(a1 + 808);
          uint64_t v77 = *(void **)(a1 + 800);
          if (v76)
          {
            if (!v77)
            {
LABEL_100:
              *uint64_t v108 = 0LL;
              v107[1] = 0LL;
              v107[2] = 0LL;
              *uint64_t v107 = 0LL;
              goto LABEL_143;
            }

            do
            {
              uint64_t v78 = v77;
              uint64_t v77 = (void *)*v77;
              *uint64_t v78 = v76;
              uint64_t v76 = v78;
            }

            while (v77);
          }

          else
          {
            uint64_t v78 = *(void **)(a1 + 800);
          }

          *(void *)(a1 + 808) = v78;
          goto LABEL_100;
        }

        uint64_t v58 = (*(uint64_t (**)(uint64_t))(a1 + 24))(88LL);
        if (!v58) {
          return 1LL;
        }
        uint64_t v24 = v58;
        uint64_t v59 = (*(uint64_t (**)(uint64_t))(a1 + 24))(32LL);
        *(void *)(v24 + 64) = v59;
        if (v59)
        {
          *(void *)(v24 + 72) = v59 + 32;
          goto LABEL_69;
        }

        (*(void (**)(uint64_t))(a1 + 40))(v24);
        return 1LL;
      case 3:
      case 4:
        uint64_t v25 = (uint64_t)&v114[*(int *)(a3 + 128)];
        unint64_t v112 = 0LL;
        int v26 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 56))(a3, v25);
        v111[0] = (char *)poolStoreString(v108, a3, v25, v25 + v26);
        if (!v111[0]) {
          return 1LL;
        }
        *(void *)(a1 + 832) = *(void *)(a1 + 824);
        uint64_t v27 = storeAtts(a1, a3, (uint64_t)v114, v111, (uint64_t *)&v112, 2);
        if ((_DWORD)v27)
        {
          uint64_t v23 = v27;
          freeBindings(a1, v112);
          return v23;
        }

        *(void *)(a1 + 832) = *(void *)(a1 + 824);
        unint64_t v28 = *(void (**)(void, char *, void))(a1 + 120);
        if (v28)
        {
          v28(*(void *)(a1 + 8), v111[0], *(void *)(a1 + 752));
          uint64_t v29 = *(void (**)(void, char *))(a1 + 128);
          if (!v29) {
            goto LABEL_84;
          }
          if (*(void *)(a1 + 120))
          {
            *uint64_t v15 = *v16;
            (*(void (**)(void, char *))(a1 + 128))(*(void *)(a1 + 8), v111[0]);
            goto LABEL_84;
          }

LABEL_83:
          v29(*(void *)(a1 + 8), v111[0]);
          goto LABEL_84;
        }

        uint64_t v29 = *(void (**)(void, char *))(a1 + 128);
        if (v29) {
          goto LABEL_83;
        }
        if (*(void *)(a1 + 176)) {
          reportDefault(a1, a3, (uint64_t)v114, (uint64_t)v113);
        }
LABEL_84:
        v73 = *(void **)(a1 + 808);
        v74 = *(void **)(a1 + 800);
        if (v73)
        {
          if (!v74) {
            goto LABEL_90;
          }
          do
          {
            uint64_t v75 = v74;
            v74 = (void *)*v74;
            *uint64_t v75 = v73;
            v73 = v75;
          }

          while (v74);
        }

        else
        {
          uint64_t v75 = *(void **)(a1 + 800);
        }

        *(void *)(a1 + 808) = v75;
LABEL_90:
        *(void *)(a1 + 800) = 0LL;
        v107[1] = 0LL;
        v107[2] = 0LL;
        *uint64_t v107 = 0LL;
        freeBindings(a1, v112);
        if (!*(_DWORD *)(a1 + 604)) {
          goto LABEL_147;
        }
        goto LABEL_143;
      case 5:
        if (*(_DWORD *)(a1 + 604) == a2) {
          return 13LL;
        }
        uint64_t v30 = *(void *)(a1 + 704);
        uint64_t v31 = &v114[2 * *(int *)(a3 + 128)];
        int v32 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a3 + 56))(a3, v31);
        if (v32 != *(_DWORD *)(v30 + 16) || memcmp(*(const void **)(v30 + 8), v31, v32))
        {
          *uint64_t v15 = v31;
          return 7LL;
        }

        *(void *)(a1 + 704) = *(void *)v30;
        *(void *)uint64_t v30 = *(void *)(a1 + 712);
        *(void *)(a1 + 712) = v30;
        --*(_DWORD *)(a1 + 604);
        unint64_t v33 = *(void (**)(void, void))(a1 + 128);
        if (v33)
        {
          if (*(_BYTE *)(a1 + 472))
          {
            BOOL v34 = *(_BYTE **)(v30 + 32);
            if (v34)
            {
              unint64_t v35 = (_BYTE *)(*(void *)(v30 + 24) + *(int *)(v30 + 52));
              char v36 = *v34;
              if (*v34)
              {
                unint64_t v37 = v34 + 1;
                do
                {
                  *v35++ = v36;
                  int v38 = *v37++;
                  char v36 = v38;
                }

                while (v38);
              }

              uint64_t v39 = *(_BYTE **)(v30 + 40);
              if (*(_BYTE *)(a1 + 473)) {
                BOOL v40 = v39 == 0LL;
              }
              else {
                BOOL v40 = 1;
              }
              if (!v40)
              {
                *v35++ = *(_BYTE *)(a1 + 908);
                char v41 = *v39;
                if (*v39)
                {
                  char v42 = v39 + 1;
                  do
                  {
                    *v35++ = v41;
                    int v43 = *v42++;
                    char v41 = v43;
                  }

                  while (v43);
                }
              }

              _BYTE *v35 = 0;
              unint64_t v33 = *(void (**)(void, void))(a1 + 128);
            }
          }

          v33(*(void *)(a1 + 8), *(void *)(v30 + 24));
        }

        else if (*(void *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v114, (uint64_t)v113);
        }

        uint64_t v87 = *(void *)(v30 + 80);
        if (v87)
        {
          do
          {
            v88 = *(void (**)(void, void))(a1 + 224);
            uint64_t v89 = v87;
            if (v88)
            {
              v88(*(void *)(a1 + 8), **(void **)v87);
              uint64_t v89 = *(void *)(v30 + 80);
            }

            uint64_t v90 = *(void *)(v89 + 8);
            *(void *)(v30 + 80) = v90;
            *(void *)(v87 + 8) = *(void *)(a1 + 728);
            *(void *)(a1 + 728) = v87;
            *(void *)(*(void *)v87 + 8LL) = *(void *)(v87 + 16);
            uint64_t v87 = v90;
          }

          while (v90);
        }

        int v8 = a7;
        if (*(_DWORD *)(a1 + 604)) {
          goto LABEL_143;
        }
LABEL_147:
        int v95 = *(_DWORD *)(a1 + 920);
        if (v95 == 2)
        {
          *uint64_t v15 = v113;
          return 35LL;
        }

        else if (v95 == 3)
        {
          *(void *)(a1 + 544) = epilogProcessor;
          *uint64_t v15 = v113;
LABEL_145:
          uint64_t v23 = 0LL;
          uint64_t v94 = v113;
LABEL_167:
          *a6 = v94;
        }

        else
        {
          return epilogProcessor(a1, v113, a5, a6);
        }

        return v23;
      case 6:
        uint64_t v44 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
        if (v44)
        {
          if (*(_BYTE *)(a3 + 132))
          {
            uint64_t v45 = *(void *)(a1 + 8);
            uint64_t v46 = (char **)v114;
            uint64_t v47 = ((_DWORD)v22 - (_DWORD)v114);
            goto LABEL_60;
          }

          while (1)
          {
            uint64_t v48 = *(void *)(a1 + 112);
            v111[0] = *(char **)(a1 + 104);
            unsigned int v49 = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unsigned __int8 *, char **, uint64_t))(a3 + 112))( a3,  &v114,  v22,  v111,  v48);
            *uint64_t v16 = v114;
            v44(*(void *)(a1 + 8), *(char ***)(a1 + 104), LODWORD(v111[0]) - *(void *)(a1 + 104));
            if (v49 <= 1) {
              break;
            }
            *uint64_t v15 = v114;
            char v22 = v113;
          }

          goto LABEL_61;
        }

        int v8 = a7;
        if (!*(void *)(a1 + 176)) {
          goto LABEL_143;
        }
LABEL_102:
        uint64_t v79 = v114;
        uint64_t v80 = a1;
        uint64_t v81 = a3;
        v82 = v22;
        goto LABEL_142;
      case 7:
        uint64_t v50 = *(void (**)(void, char **, uint64_t))(a1 + 136);
        if (!v50) {
          goto LABEL_49;
        }
        LOBYTE(v111[0]) = 10;
        v50(*(void *)(a1 + 8), v111, 1LL);
        goto LABEL_143;
      case 8:
        uint64_t v51 = *(void (**)(void))(a1 + 160);
        if (v51)
        {
          v51(*(void *)(a1 + 8));
        }

        else if (*(void *)(a1 + 176))
        {
          reportDefault(a1, a3, (uint64_t)v114, (uint64_t)v22);
        }

        uint64_t v71 = doCdataSection(a1, a3, &v113, a5, a6, v8, a8);
        if ((_DWORD)v71) {
          return v71;
        }
        if (v113) {
          goto LABEL_143;
        }
        uint64_t v23 = 0LL;
        *(void *)(a1 + 544) = cdataSectionProcessor;
        return v23;
      case 9:
        LOBYTE(v111[0]) = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unsigned __int8 *))(a3 + 88))( a3,  &v114[*(int *)(a3 + 128)],  &v22[-*(int *)(a3 + 128)]);
        if (LOBYTE(v111[0]))
        {
          accountingDiffTolerated(a1, 9, (unsigned __int8 *)v111, (unint64_t)v111 + 1, 2914, 1);
          uint64_t v52 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
          if (v52)
          {
            uint64_t v53 = *(void *)(a1 + 8);
            uint64_t v54 = v111;
            uint64_t v55 = 1LL;
LABEL_56:
            v52(v53, v54, v55);
            goto LABEL_143;
          }

            uint64_t result = 0LL;
            *a4 = (uint64_t)v22;
            return result;
          case 0xF:
            uint64_t result = little2_checkPiTarget(a2, (uint64_t)&a2[v15 + 2], &v26);
            if (!(_DWORD)result)
            {
              *a4 = (uint64_t)&a2[v15 + 2];
              return result;
            }

            if (v5 - 2 < 2) {
              return 0xFFFFFFFFLL;
            }
            int v18 = (unsigned __int8 *)&a2[v15 + 4];
            if (!a2[v15 + 5] && *v18 == 62)
            {
              uint64_t v25 = (uint64_t)&a2[v15 + 6];
              goto LABEL_79;
            }

            goto LABEL_41;
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1B:
            goto LABEL_38;
          case 0x1D:
            goto LABEL_37;
          default:
            goto LABEL_40;
        }
      }

      if ((v17 - 216) < 4)
      {
LABEL_44:
        if ((unint64_t)v5 >= 4)
        {
LABEL_45:
          uint64_t result = 0LL;
          int v18 = (unsigned __int8 *)&a2[v15 + 2];
          goto LABEL_46;
        }

        return 4294967294LL;
      }

      goto LABEL_36;
    }

    if ((_DWORD)v17 == 255)
    {
      LODWORD(v16) = *(unsigned __int8 *)(v16 + 2);
      goto LABEL_37;
    }

            uint64_t result = 0LL;
            *a4 = (uint64_t)v22;
            return result;
          case 0xF:
            int v26 = &a2[v15];
            uint64_t result = big2_checkPiTarget(a2, (uint64_t)&a2[v15 + 2], &v27);
            if (!(_DWORD)result)
            {
              *a4 = (uint64_t)&a2[v15 + 2];
              return result;
            }

            if (v5 - 2 < 2) {
              return 0xFFFFFFFFLL;
            }
            int v18 = (uint64_t)(v26 + 4);
            if (!v26[4] && a2[v15 + 5] == 62)
            {
              uint64_t v25 = (uint64_t)&a2[v15 + 6];
              goto LABEL_79;
            }

            goto LABEL_41;
          case 0x16:
          case 0x18:
          case 0x19:
          case 0x1A:
          case 0x1B:
            goto LABEL_38;
          case 0x1D:
            goto LABEL_37;
          default:
            goto LABEL_40;
        }
      }

      if ((v16 - 216) < 4)
      {
LABEL_44:
        if ((unint64_t)v5 >= 4)
        {
LABEL_45:
          uint64_t result = 0LL;
          int v18 = (uint64_t)&a2[v15 + 2];
          goto LABEL_46;
        }

        return 4294967294LL;
      }

      goto LABEL_36;
    }

    if ((_DWORD)v16 == 255)
    {
      LODWORD(v17) = a2[v15 + 3];
      goto LABEL_37;
    }

LABEL_140:
          if (!*(void *)(a1 + 176)) {
            goto LABEL_143;
          }
LABEL_141:
          v82 = v113;
          uint64_t v79 = v114;
          uint64_t v80 = a1;
          uint64_t v81 = a3;
LABEL_142:
          reportDefault(v80, v81, (uint64_t)v79, (uint64_t)v82);
          goto LABEL_143;
        }

        v83 = (char *)poolStoreString(v105, a3, (uint64_t)&v114[*(int *)(a3 + 128)], (uint64_t)&v113[-*(int *)(a3 + 128)]);
        if (!v83) {
          return 1LL;
        }
        v84 = v83;
        v85 = lookup(a1, (uint64_t *)v104, v83, 0LL);
        v86 = v85;
        *(void *)(v104 + 184) = *(void *)(v104 + 192);
        if (!*(_BYTE *)(v104 + 257) || *(_BYTE *)(v104 + 258))
        {
          if (!v85) {
            return 11LL;
          }
          if (!*((_BYTE *)v85 + 58)) {
            return 24LL;
          }
LABEL_113:
          if (*((_BYTE *)v85 + 56)) {
            return 12LL;
          }
          if (*((void *)v85 + 6)) {
            return 15LL;
          }
          if (*((void *)v85 + 1))
          {
            if (*(_BYTE *)(a1 + 600))
            {
              uint64_t v71 = processInternalEntity(a1, (uint64_t)v85, 0);
              int v8 = a7;
              if ((_DWORD)v71) {
                return v71;
              }
              goto LABEL_143;
            }

            uint64_t v52 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 256);
            int v8 = a7;
            if (v52)
            {
              uint64_t v53 = *(void *)(a1 + 8);
              uint64_t v54 = *(char ***)v86;
              uint64_t v55 = 0LL;
              goto LABEL_56;
            }

            goto LABEL_140;
          }

          if (!*(void *)(a1 + 240)) {
            goto LABEL_136;
          }
          uint64_t v23 = 1LL;
          *((_BYTE *)v85 + 56) = 1;
          uint64_t Context = getContext(a1);
          *((_BYTE *)v86 + 56) = 0;
          int v8 = a7;
          if (!Context) {
            return v23;
          }
          if (!(*(unsigned int (**)(void, uint64_t, void, void, void))(a1 + 240))( *(void *)(a1 + 248),  Context,  *((void *)v86 + 4),  *((void *)v86 + 3),  *((void *)v86 + 5))) {
            return 21LL;
          }
          *(void *)(a1 + 824) = *(void *)(a1 + 832);
          goto LABEL_143;
        }

        if (v85) {
          goto LABEL_113;
        }
        unsigned int v92 = *(void (**)(void, char *, void))(a1 + 256);
        if (!v92)
        {
LABEL_136:
          int v8 = a7;
          if (!*(void *)(a1 + 176)) {
            goto LABEL_143;
          }
          goto LABEL_141;
        }

        v92(*(void *)(a1 + 8), v84, 0LL);
LABEL_61:
        int v8 = a7;
LABEL_143:
        int v93 = *(_DWORD *)(a1 + 920);
        unsigned int v114 = v113;
        *uint64_t v15 = v113;
        if (v93 == 2) {
          return 35LL;
        }
        if (v93 == 3) {
          goto LABEL_145;
        }
        continue;
      case 10:
        unsigned int v56 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a3 + 80))(a3, v114);
        if ((v56 & 0x80000000) != 0) {
          return 14LL;
        }
        uint64_t v44 = *(void (**)(uint64_t, char **, uint64_t))(a1 + 136);
        if (!v44) {
          goto LABEL_136;
        }
        uint64_t v57 = *(void *)(a1 + 8);
        uint64_t v47 = XmlUtf8Encode(v56, v111);
        uint64_t v46 = v111;
        uint64_t v45 = v57;
LABEL_60:
        v44(v45, v46, v47);
        goto LABEL_61;
      case 11:
        goto LABEL_143;
      case 12:
        return v23;
      case 13:
        goto LABEL_143;
      default:
LABEL_49:
        if (!*(void *)(a1 + 176)) {
          goto LABEL_143;
        }
        goto LABEL_102;
    }
  }

uint64_t storeRawNames(uint64_t a1)
{
  for (uint64_t i = *(uint64_t ***)(a1 + 704); i; uint64_t i = (uint64_t **)*i)
  {
    uint64_t v3 = *((int *)i + 12) + 1LL;
    uint64_t v4 = i[8];
    uint64_t v5 = (char *)v4 + v3;
    uint64_t v6 = i[1];
    size_t v7 = *((int *)i + 4);
    if ((char *)i[9] - (char *)v4 < (int)v7 + (int)v3)
    {
      uint64_t v8 = (int)v7 + (int)v3;
      uint64_t result = (*(uint64_t (**)(void))(a1 + 32))();
      if (!result) {
        return result;
      }
      uint64_t v10 = i[8];
      if (i[3] == v10) {
        i[3] = (uint64_t *)result;
      }
      uint64_t v11 = i[4];
      if (v11) {
        i[4] = (uint64_t *)(result + (char *)v11 - (char *)v10);
      }
      i[8] = (uint64_t *)result;
      i[9] = (uint64_t *)(result + v8);
      uint64_t v5 = (char *)(result + v3);
      uint64_t v6 = i[1];
      size_t v7 = *((int *)i + 4);
    }

    memcpy(v5, v6, v7);
    i[1] = (uint64_t *)v5;
  }

  return 1LL;
}

uint64_t getContext(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 688);
  uint64_t v3 = *(_BYTE **)(v2 + 312);
  if (v3)
  {
    uint64_t v4 = *(_BYTE **)(a1 + 824);
    if (v4 == *(_BYTE **)(a1 + 816))
    {
      uint64_t v4 = *(_BYTE **)(a1 + 824);
    }

    *(void *)(a1 + 824) = v4 + 1;
    _BYTE *v4 = 61;
    uint64_t v5 = *(_DWORD *)(*(void *)(v2 + 312) + 40LL) - (*(_BYTE *)(a1 + 908) != 0);
    if ((int)v5 >= 1)
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        size_t v7 = *(_BYTE **)(a1 + 824);
        if (v7 == *(_BYTE **)(a1 + 816))
        {
          size_t v7 = *(_BYTE **)(a1 + 824);
        }

        char v8 = *(_BYTE *)(*(void *)(*(void *)(v2 + 312) + 32LL) + i);
        *(void *)(a1 + 824) = v7 + 1;
        *size_t v7 = v8;
      }
    }

    LODWORD(v3) = 1;
  }

  uint64_t v9 = *(char ****)(v2 + 120);
  if (v9) {
    uint64_t v10 = &v9[*(void *)(v2 + 136)];
  }
  else {
    uint64_t v10 = 0LL;
  }
  while (v9 != v10)
  {
    uint64_t v11 = v9;
    BOOL v13 = *v9++;
    char v12 = v13;
    if (v13 && v12[1])
    {
      if ((_DWORD)v3)
      {
        uint64_t v14 = *(_BYTE **)(a1 + 824);
        if (v14 == *(_BYTE **)(a1 + 816))
        {
          uint64_t v14 = *(_BYTE **)(a1 + 824);
        }

        *(void *)(a1 + 824) = v14 + 1;
        *uint64_t v14 = 12;
      }

      char v15 = **v12;
      if (v15)
      {
        uint64_t v16 = (unsigned __int8 *)(*v12 + 1);
        do
        {
          int v17 = *(_BYTE **)(a1 + 824);
          if (v17 == *(_BYTE **)(a1 + 816))
          {
            char v15 = *(v16 - 1);
            int v17 = *(_BYTE **)(a1 + 824);
          }

          *(void *)(a1 + 824) = v17 + 1;
          _BYTE *v17 = v15;
          int v18 = *v16++;
          char v15 = v18;
        }

        while (v18);
      }

      uint64_t v3 = *(_BYTE **)(a1 + 824);
      if (v3 == *(_BYTE **)(a1 + 816))
      {
        uint64_t v3 = *(_BYTE **)(a1 + 824);
      }

      uint64_t v9 = v11 + 1;
      *(void *)(a1 + 824) = v3 + 1;
      *uint64_t v3 = 61;
      uint64_t v19 = *((_DWORD *)v12[1] + 10) - (*(_BYTE *)(a1 + 908) != 0);
      LODWORD(v3) = 1;
      if ((int)v19 >= 1)
      {
        for (uint64_t j = 0LL; j != v19; ++j)
        {
          uint64_t v21 = *(_BYTE **)(a1 + 824);
          if (v21 == *(_BYTE **)(a1 + 816))
          {
            uint64_t v21 = *(_BYTE **)(a1 + 824);
          }

          char v22 = *(_BYTE *)(*((void *)v12[1] + 4) + j);
          *(void *)(a1 + 824) = v21 + 1;
          _BYTE *v21 = v22;
        }

        LODWORD(v3) = 1;
      }
    }
  }

  uint64_t v23 = *(void **)v2;
  if (*(void *)v2) {
    uint64_t v24 = &v23[*(void *)(v2 + 16)];
  }
  else {
    uint64_t v24 = 0LL;
  }
  while (v23 != v24)
  {
    uint64_t v25 = v23;
    uint64_t v27 = (_BYTE *)*v23++;
    int v26 = v27;
    if (v27 && v26[56])
    {
      if ((_DWORD)v3)
      {
        unint64_t v28 = *(_BYTE **)(a1 + 824);
        if (v28 == *(_BYTE **)(a1 + 816))
        {
          unint64_t v28 = *(_BYTE **)(a1 + 824);
        }

        *(void *)(a1 + 824) = v28 + 1;
        *unint64_t v28 = 12;
      }

      uint64_t v23 = v25 + 1;
      char v29 = **(_BYTE **)v26;
      LODWORD(v3) = 1;
      if (v29)
      {
        uint64_t v30 = (unsigned __int8 *)(*(void *)v26 + 1LL);
        do
        {
          uint64_t v31 = *(_BYTE **)(a1 + 824);
          if (v31 == *(_BYTE **)(a1 + 816))
          {
            char v29 = *(v30 - 1);
            uint64_t v31 = *(_BYTE **)(a1 + 824);
          }

          *(void *)(a1 + 824) = v31 + 1;
          *uint64_t v31 = v29;
          int v32 = *v30++;
          char v29 = v32;
        }

        while (v32);
        LODWORD(v3) = 1;
      }
    }
  }

  unint64_t v33 = *(_BYTE **)(a1 + 824);
  if (v33 != *(_BYTE **)(a1 + 816)) {
    goto LABEL_60;
  }
  if (poolGrow((uint64_t *)(a1 + 800)))
  {
    unint64_t v33 = *(_BYTE **)(a1 + 824);
LABEL_60:
    *(void *)(a1 + 824) = v33 + 1;
    _BYTE *v33 = 0;
    return *(void *)(a1 + 832);
  }

  return 0LL;
}

uint64_t storeAtts(uint64_t a1, uint64_t a2, uint64_t a3, char **a4, uint64_t *a5, int a6)
{
  v145[3] = *MEMORY[0x1895F89C0];
  uint64_t v11 = *(void *)(a1 + 688);
  char v12 = lookup(a1, (uint64_t *)(v11 + 40), *a4, 0LL);
  if (!v12)
  {
    int v38 = (char *)poolCopyString((uint64_t *)(v11 + 160), *a4);
    if (!v38) {
      return 1LL;
    }
    uint64_t v39 = lookup(a1, (uint64_t *)(v11 + 40), v38, 0x28uLL);
    if (!v39) {
      return 1LL;
    }
    char v12 = v39;
    if (*(_BYTE *)(a1 + 472))
    {
    }
  }

  uint64_t v13 = *((unsigned int *)v12 + 6);
  uint64_t v14 = (*(uint64_t (**)(uint64_t, uint64_t, void, void))(a2 + 72))( a2,  a3,  *(unsigned int *)(a1 + 736),  *(void *)(a1 + 752));
  uint64_t v15 = v14;
  int v16 = *(_DWORD *)(a1 + 736);
  if ((int)v14 + (int)v13 > v16)
  {
    int v18 = v14 + v13 + 16;
    *(_DWORD *)(a1 + 736) = v18;
    uint64_t v19 = (*(uint64_t (**)(void, uint64_t))(a1 + 32))(*(void *)(a1 + 752), 32LL * v18);
    if (!v19)
    {
      *(_DWORD *)(a1 + 736) = v16;
      return 1LL;
    }

    *(void *)(a1 + 752) = v19;
  }

  v134 = a4;
  uint64_t v135 = v11;
  uint64_t v141 = *(void *)(a1 + 752);
  if ((int)v15 >= 1)
  {
    int v136 = a6;
    uint64_t v20 = 0LL;
    int v21 = 0;
    int v138 = 0;
    uint64_t v22 = v15;
    while (1)
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 752) + 32 * v20);
      int v24 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 56))(a2, v23);
      AttributeId = getAttributeId(a1, a2, v23, v23 + v24);
      if (!AttributeId) {
        return 1LL;
      }
      uint64_t v26 = (uint64_t)AttributeId;
      if (*(_BYTE *)(*(void *)AttributeId - 1LL))
      {
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = *(void *)(*(void *)(a1 + 752) + 32 * v20);
        }
        return 8LL;
      }

      *(_BYTE *)(*(void *)AttributeId - 1LL) = 1;
      uint64_t v27 = v21 + 1LL;
      *(void *)(v141 + 8LL * v21) = *(void *)AttributeId;
      uint64_t v28 = *(void *)(a1 + 752);
      uint64_t v29 = v28 + 32 * v20;
      if (*(_BYTE *)(v29 + 24))
      {
        uint64_t v30 = poolStoreString((uint64_t *)(a1 + 800), a2, *(void *)(v29 + 8), *(void *)(v29 + 16));
        uint64_t v31 = v141;
        *(void *)(v141 + 8LL * (int)v27) = v30;
        if (!v30) {
          return 1LL;
        }
      }

      else
      {
        if (*((_BYTE *)AttributeId + 16)) {
          BOOL v32 = (int)v13 < 1;
        }
        else {
          BOOL v32 = 1;
        }
        if (v32)
        {
LABEL_26:
          uint64_t v35 = 1LL;
        }

        else
        {
          unint64_t v33 = (unsigned __int8 *)(*((void *)v12 + 4) + 8LL);
          uint64_t v34 = v13;
          while (AttributeId != *((_OWORD **)v33 - 1))
          {
            v33 += 24;
            if (!--v34) {
              goto LABEL_26;
            }
          }

          uint64_t v35 = *v33;
        }

        uint64_t result = storeAttributeValue( a1,  a2,  v35,  *(unsigned __int8 **)(v28 + 32 * v20 + 8),  *(void *)(v28 + 32 * v20 + 16),  (uint64_t *)(a1 + 800),  v136);
        if ((_DWORD)result) {
          return result;
        }
        uint64_t v31 = v141;
        *(void *)(v141 + 8 * v27) = *(void *)(a1 + 832);
      }

      *(void *)(a1 + 832) = *(void *)(a1 + 824);
      unint64_t v37 = *(void **)(v26 + 8);
      if (v37)
      {
        if (*(_BYTE *)(v26 + 17))
        {
          uint64_t result = addBinding(a1, v37, v26, *(unsigned __int8 **)(v31 + 8LL * (int)v27), a5);
          if ((_DWORD)result) {
            return result;
          }
        }

        else
        {
          v21 += 2;
          ++v138;
          *(_BYTE *)(*(void *)v26 - 1LL) = 2;
        }
      }

      else
      {
        v21 += 2;
      }

      if (++v20 == v22) {
        goto LABEL_44;
      }
    }
  }

  int v138 = 0;
  int v21 = 0;
LABEL_44:
  *(_DWORD *)(a1 + 740) = v21;
  BOOL v40 = (uint64_t *)*((void *)v12 + 2);
  if (v40)
  {
    uint64_t v41 = *v40;
    uint64_t v42 = v141;
    int v43 = v138;
    if (*(_BYTE *)(*v40 - 1))
    {
      uint64_t v44 = v135;
      if (v21 < 1) {
        goto LABEL_58;
      }
      uint64_t v45 = 0LL;
      while (*(void *)(v141 + 8 * v45) != v41)
      {
        v45 += 2LL;
      }
    }

    else
    {
      LODWORD(v45) = -1;
      uint64_t v44 = v135;
    }
  }

  else
  {
    LODWORD(v45) = -1;
    uint64_t v44 = v135;
    uint64_t v42 = v141;
    int v43 = v138;
  }

  *(_DWORD *)(a1 + 744) = v45;
LABEL_58:
  if ((int)v13 >= 1)
  {
    uint64_t v46 = 0LL;
    uint64_t v47 = 24 * v13;
    do
    {
      uint64_t v48 = *((void *)v12 + 4);
      uint64_t v49 = *(void *)(v48 + v46);
      uint64_t v50 = *(void *)v49;
      if (!*(_BYTE *)(*(void *)v49 - 1LL))
      {
        uint64_t v51 = *(unsigned __int8 **)(v48 + v46 + 16);
        if (v51)
        {
          uint64_t v52 = *(void **)(v49 + 8);
          if (v52)
          {
            if (*(_BYTE *)(v49 + 17))
            {
              uint64_t result = addBinding(a1, v52, v49, v51, a5);
              uint64_t v42 = v141;
              if ((_DWORD)result) {
                return result;
              }
              goto LABEL_61;
            }

            *(_BYTE *)(v50 - 1) = 2;
            ++v43;
          }

          else
          {
            *(_BYTE *)(v50 - 1) = 1;
          }

          uint64_t v53 = (void *)(v42 + 8LL * v21);
          *uint64_t v53 = **(void **)(v48 + v46);
          v21 += 2;
          v53[1] = *(void *)(v48 + v46 + 16);
        }
      }

LABEL_61:
      v46 += 24LL;
    }

    while (v47 != v46);
  }

  uint64_t v54 = v21;
  *(void *)(v42 + 8LL * v21) = 0LL;
  if (!v43)
  {
LABEL_145:
    LODWORD(v64) = 0;
LABEL_146:
    if ((int)v64 < (int)v54)
    {
      uint64_t v110 = (int)v64;
      do
      {
        *(_BYTE *)(*(void *)(v42 + 8 * v110) - 1LL) = 0;
        v110 += 2LL;
      }

      while (v110 < v54);
    }

    for (uint64_t i = *a5; i; uint64_t i = *(void *)(i + 8))
      *(_BYTE *)(**(void **)(i + 24) - 1LL) = 0;
    if (*(_BYTE *)(a1 + 472))
    {
      uint64_t v112 = *((void *)v12 + 1);
      if (v112)
      {
        uint64_t v113 = *(void *)(v112 + 8);
        if (!v113) {
          return 27LL;
        }
        unsigned int v114 = *v134;
        do
          int v115 = *v114++;
        while (v115 != 58);
LABEL_159:
        uint64_t v116 = **(char ***)v113;
        if (*(_BYTE *)(a1 + 473)) {
          BOOL v117 = v116 == 0LL;
        }
        else {
          BOOL v117 = 1;
        }
        if (v117)
        {
          LODWORD(v118) = 0;
        }

        else
        {
          uint64_t v118 = 0LL;
          while (v116[v118++])
            ;
        }

        uint64_t v120 = 0LL;
        v134[1] = v114;
        signed int v121 = *(_DWORD *)(v113 + 40);
        v134[2] = v116;
        *((_DWORD *)v134 + 7) = v121;
        *((_DWORD *)v134 + 8) = v118;
        while (v114[v120++])
          ;
        int v123 = v120 + v118 + v121;
        if (v123 <= *(_DWORD *)(v113 + 44))
        {
          v126 = *(char **)(v113 + 32);
        }

        else
        {
          if (v123 > 2147483623) {
            return 1LL;
          }
          int v124 = v123 + 24;
          uint64_t v125 = (char *)(*(uint64_t (**)(void))(a1 + 24))(v123 + 24);
          if (!v125) {
            return 1LL;
          }
          v126 = v125;
          *(_DWORD *)(v113 + 44) = v124;
          memcpy(v125, *(const void **)(v113 + 32), *(int *)(v113 + 40));
          v127 = *(void **)(a1 + 704);
          for (uint64_t j = *(void *)(v113 + 32); v127; v127 = (void *)*v127)
          {
            if (v127[3] == j) {
              v127[3] = v126;
            }
          }

          (*(void (**)(uint64_t))(a1 + 40))(j);
          *(void *)(v113 + 32) = v126;
          signed int v121 = *(_DWORD *)(v113 + 40);
        }

        uint64_t v129 = &v126[v121];
        memcpy(v129, v114, v120);
        if ((_DWORD)v118)
        {
          v129[v120 - 1] = *(_BYTE *)(a1 + 908);
          memcpy(&v129[v120], **(const void ***)v113, (int)v118);
        }

        uint64_t result = 0LL;
        *v134 = *(char **)(v113 + 32);
        return result;
      }

      uint64_t v113 = *(void *)(v44 + 312);
      if (v113)
      {
        unsigned int v114 = *v134;
        goto LABEL_159;
      }
    }

    return 0LL;
  }

  unsigned int v55 = *(unsigned __int8 *)(a1 + 776);
  if (v55 > 0x1F) {
    return 1LL;
  }
  if ((2 * v43) >> v55)
  {
    unsigned __int8 v56 = *(_BYTE *)(a1 + 776);
    while (v43 >> v56++)
      ;
    *(_BYTE *)(a1 + 776) = v56;
    if (v56 > 2u)
    {
      if (v56 >= 0x20u) {
        goto LABEL_166;
      }
    }

    else
    {
      unsigned __int8 v56 = 3;
      *(_BYTE *)(a1 + 776) = 3;
    }

    uint64_t v60 = (*(uint64_t (**)(void, uint64_t))(a1 + 32))(*(void *)(a1 + 760), 24LL << v56);
    if (v60)
    {
      unsigned int v59 = 1 << v56;
      *(void *)(a1 + 760) = v60;
      uint64_t v42 = v141;
      goto LABEL_83;
    }

LABEL_166:
    *(_BYTE *)(a1 + 776) = v55;
    return 1LL;
  }

  uint64_t v58 = *(void *)(a1 + 768);
  unsigned int v59 = 1 << v55;
  if (v58) {
    goto LABEL_85;
  }
  uint64_t v60 = *(void *)(a1 + 760);
LABEL_83:
  uint64_t v61 = v59;
  uint64_t v62 = (void *)(v60 + 24LL * v59 - 24);
  uint64_t v58 = 0xFFFFFFFFLL;
  do
  {
    *uint64_t v62 = 0xFFFFFFFFLL;
    v62 -= 3;
    --v61;
  }

  while (v61);
LABEL_85:
  uint64_t v63 = v58 - 1;
  *(void *)(a1 + 768) = v58 - 1;
  uint64_t v64 = 0LL;
  uint64_t v65 = (uint64_t *)(v44 + 80);
  unint64_t v66 = v59 - 1;
  uint64_t v130 = ~v66;
  unint64_t v133 = v66;
  unint64_t v137 = v66 >> 2;
  uint64_t v139 = v63;
  unsigned int v131 = v59;
  int v132 = (uint64_t *)(v44 + 80);
  while (1)
  {
    uint64_t v67 = *(char **)(v42 + 8 * v64);
    if (*(v67 - 1) != 2)
    {
      *(v67 - 1) = 0;
      goto LABEL_143;
    }

    uint64_t v68 = a1;
    do
    {
      uint64_t v69 = v68;
      uint64_t v68 = *(void *)(v68 + 912);
    }

    while (v68);
    uint64_t v70 = *(void *)(v69 + 936);
    v142.i64[0] = 0x736F6D6570736575LL;
    v142.i64[1] = v70 ^ 0x646F72616E646F6DLL;
    uint64_t v143 = 0x6C7967656E657261LL;
    uint64_t v144 = v70 ^ 0x7465646279746573LL;
    v145[1] = v145;
    v145[2] = 0LL;
    *(v67 - 1) = 0;
    uint64_t v71 = lookup(a1, v65, v67, 0LL);
    if (!v71) {
      return 1LL;
    }
    uint64_t v72 = *((void *)v71 + 1);
    if (!v72) {
      return 1LL;
    }
    uint64_t v73 = *(void *)(v72 + 8);
    if (!v73) {
      return 27LL;
    }
    LODWORD(v74) = *(_DWORD *)(v73 + 40);
    if ((_DWORD)v74)
    {
      int v75 = v43;
      unint64_t v76 = 0LL;
      do
      {
        char v77 = *(_BYTE *)(*(void *)(v73 + 32) + v76);
        uint64_t v78 = *(_BYTE **)(a1 + 824);
        if (v78 == *(_BYTE **)(a1 + 816))
        {
          uint64_t v78 = *(_BYTE **)(a1 + 824);
        }

        *(void *)(a1 + 824) = v78 + 1;
        *uint64_t v78 = v77;
        ++v76;
        unint64_t v74 = *(unsigned int *)(v73 + 40);
      }

      while (v76 < v74);
      int v43 = v75;
      uint64_t v44 = v135;
    }

    sip24_update(v142.i64, *(char **)(v73 + 32), (int)v74);
    do
      int v79 = *v67++;
    while (v79 != 58);
    if (*v67)
    {
      uint64_t v80 = 0LL;
      do
        uint64_t v81 = &v67[v80++];
      while (v81[1]);
    }

    else
    {
      uint64_t v80 = 0LL;
    }

    sip24_update(v142.i64, v67, v80);
    do
    {
      v82 = *(char **)(a1 + 824);
      if (v82 == *(char **)(a1 + 816))
      {
        v82 = *(char **)(a1 + 824);
      }

      char v83 = *v67;
      *(void *)(a1 + 824) = v82 + 1;
      char *v82 = v83;
    }

    while (*v67++);
    sip24_final(&v142);
    uint64_t v86 = v85;
    unint64_t v87 = v85 & v133;
    uint64_t v88 = *(void *)(a1 + 760);
    uint64_t v89 = *(void *)(v88 + 24LL * (v85 & v133));
    uint64_t v90 = v139;
    if (v89 == v139) {
      break;
    }
    uint64_t v42 = v141;
LABEL_135:
    if (*(_BYTE *)(a1 + 473))
    {
      *(_BYTE *)(*(void *)(a1 + 824) - 1LL) = *(_BYTE *)(a1 + 908);
      uint64_t v104 = **(char ***)v73;
      do
      {
        v105 = *(_BYTE **)(a1 + 824);
        if (v105 == *(_BYTE **)(a1 + 816))
        {
          v105 = *(_BYTE **)(a1 + 824);
          uint64_t v42 = v141;
          uint64_t v90 = v139;
        }

        char v106 = *v104;
        *(void *)(a1 + 824) = v105 + 1;
        _BYTE *v105 = v106;
      }

      while (*v104++);
    }

    uint64_t v108 = *(void *)(a1 + 832);
    *(void *)(a1 + 832) = *(void *)(a1 + 824);
    *(void *)(v42 + 8 * v64) = v108;
    uint64_t v109 = (uint64_t *)(*(void *)(a1 + 760) + 24 * v87);
    *uint64_t v109 = v90;
    v109[1] = v86;
    v109[2] = v108;
    if (!--v43)
    {
      LODWORD(v64) = v64 + 2;
      goto LABEL_146;
    }

    uint64_t v65 = v132;
LABEL_143:
    v64 += 2LL;
  }

  unsigned int v91 = 0;
  uint64_t v42 = v141;
  while (1)
  {
    if (v86 == *(void *)(v88 + 24 * v87 + 8))
    {
      unsigned int v92 = *(_BYTE **)(a1 + 832);
      int v93 = *(unsigned __int8 **)(v88 + 24 * v87 + 16);
      BOOL v94 = *v92 == 0;
      if (*v92) {
        BOOL v95 = *v92 == *v93;
      }
      else {
        BOOL v95 = 0;
      }
      if (v95)
      {
        uint64_t v96 = v93 + 1;
        uint64_t v97 = v92 + 1;
        do
        {
          int v99 = *v97++;
          int v98 = v99;
          BOOL v94 = v99 == 0;
          int v101 = *v96++;
          int v100 = v101;
          if (v98) {
            BOOL v102 = v98 == v100;
          }
          else {
            BOOL v102 = 0;
          }
        }

        while (v102);
      }

      if (v94) {
        return 8LL;
      }
    }

    if (!v91) {
      unsigned int v91 = ((v86 & (unint64_t)v130) >> (*(_BYTE *)(a1 + 776) - 1)) & v137 | 1;
    }
    if (v87 >= v91) {
      uint64_t v103 = -(uint64_t)v91;
    }
    else {
      uint64_t v103 = v131 - v91;
    }
    v87 += v103;
    if (*(void *)(v88 + 24 * v87) != v139) {
      goto LABEL_135;
    }
  }

uint64_t freeBindings(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    uint64_t v3 = (void *)result;
    do
    {
      uint64_t v4 = (uint64_t (*)(void, void))v3[28];
      if (v4) {
        uint64_t result = v4(v3[1], **(void **)v2);
      }
      uint64_t v6 = *(void **)v2;
      uint64_t v5 = *(void *)(v2 + 8);
      *(void *)(v2 + 8) = v3[91];
      v3[91] = v2;
      v6[1] = *(void *)(v2 + 16);
      uint64_t v2 = v5;
    }

    while (v5);
  }

  return result;
}

uint64_t epilogProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v5 = a2;
  *(void *)(a1 + 544) = epilogProcessor;
  *(void *)(a1 + 560) = a2;
  while (1)
  {
    int v7 = (**(uint64_t (***)(void))(a1 + 304))();
    if (!accountingDiffTolerated(a1, v7, v5, 0LL, 5761, 0))
    {
      accountingReportStats((void *)a1, " ABORTING\n");
      return 43LL;
    }

    *(void *)(a1 + 568) = 0LL;
    uint64_t result = 9LL;
    if (v7 > 12)
    {
      if (v7 == 13)
      {
      }

      else
      {
        if (v7 != 15) {
          return result;
        }
        if (*(void *)(a1 + 176)) {
          reportDefault(a1, *(void *)(a1 + 304), (uint64_t)v5, 0LL);
        }
      }

      goto LABEL_12;
    }

    if (v7 != 11) {
      break;
    }
LABEL_12:
    uint64_t v5 = 0LL;
    *(void *)(a1 + 560) = 0LL;
    int v9 = *(_DWORD *)(a1 + 920);
    if (v9 == 2) {
      return 35LL;
    }
    if (v9 == 3)
    {
LABEL_26:
      uint64_t result = 0LL;
      *a4 = v5;
      return result;
    }
  }

  switch(v7)
  {
    case -4:
      goto LABEL_26;
    case -3:
      return result;
    case -2:
      if (!*(_BYTE *)(a1 + 924)) {
        goto LABEL_26;
      }
      return 6LL;
    case -1:
      if (!*(_BYTE *)(a1 + 924)) {
        goto LABEL_26;
      }
      return 5LL;
    case 0:
      *(void *)(a1 + 560) = 0LL;
      return 4LL;
    default:
      if (v7 != -15) {
        return result;
      }
      if (*(void *)(a1 + 176))
      {
        reportDefault(a1, *(void *)(a1 + 304), (uint64_t)v5, 0LL);
        if (*(_DWORD *)(a1 + 920) == 2) {
          return 35LL;
        }
      }

      uint64_t result = 0LL;
      *a4 = 0LL;
      break;
  }

  return result;
}

uint64_t doCdataSection( uint64_t a1, uint64_t a2, unsigned __int8 **a3, uint64_t a4, unsigned __int8 **a5, int a6, int a7)
{
  uint64_t v11 = *a3;
  uint64_t v30 = *a3;
  if (*(void *)(a1 + 304) == a2)
  {
    char v12 = (unsigned __int8 **)(a1 + 560);
    *(void *)(a1 + 560) = v11;
    uint64_t v13 = (unsigned __int8 **)(a1 + 568);
  }

  else
  {
    char v12 = *(unsigned __int8 ***)(a1 + 584);
    uint64_t v13 = v12 + 1;
  }

  *char v12 = v11;
  *a3 = 0LL;
  while (2)
  {
    uint64_t v29 = v30;
    int v14 = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
    if (!accountingDiffTolerated(a1, v14, v30, (unint64_t)v29, 4119, a7))
    {
      accountingReportStats((void *)a1, " ABORTING\n");
      return 43LL;
    }

    uint64_t v15 = v29;
    void *v13 = v29;
    switch(v14)
    {
      case -4:
      case -1:
        if (a6) {
          goto LABEL_29;
        }
        return 20LL;
      case -3:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        goto LABEL_27;
      case -2:
        if (a6)
        {
LABEL_29:
          uint64_t result = 0LL;
          uint64_t v22 = v30;
          goto LABEL_30;
        }

        return 6LL;
      case 0:
        *char v12 = v15;
        return 4LL;
      case 6:
        int v16 = *(void (**)(void, unsigned __int8 *, void))(a1 + 136);
        if (!v16) {
          goto LABEL_15;
        }
        if (*(_BYTE *)(a2 + 132))
        {
          v16(*(void *)(a1 + 8), v30, ((_DWORD)v15 - (_DWORD)v30));
        }

        else
        {
          while (1)
          {
            uint64_t v17 = *(void *)(a1 + 112);
            uint64_t v28 = *(void *)(a1 + 104);
            unsigned int v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 **, unsigned __int8 *, uint64_t *, uint64_t))(a2 + 112))( a2,  &v30,  v15,  &v28,  v17);
            void *v13 = v29;
            v16( *(void *)(a1 + 8),  *(unsigned __int8 **)(a1 + 104),  v28 - *(void *)(a1 + 104));
            if (v18 <= 1) {
              break;
            }
            *char v12 = v30;
            uint64_t v15 = v29;
          }
        }

        goto LABEL_17;
      case 7:
        uint64_t v19 = *(void (**)(void, uint64_t *, uint64_t))(a1 + 136);
        if (v19)
        {
          LOBYTE(v28) = 10;
          v19(*(void *)(a1 + 8), &v28, 1LL);
        }

        else
        {
LABEL_15:
          if (*(void *)(a1 + 176)) {
            reportDefault(a1, a2, (uint64_t)v30, (uint64_t)v15);
          }
        }

LABEL_17:
        uint64_t v30 = v29;
        *char v12 = v29;
        int v20 = *(_DWORD *)(a1 + 920);
        if (v20 == 2) {
          return 35LL;
        }
        if (v20 != 3) {
          continue;
        }
        uint64_t result = 0LL;
        uint64_t v22 = v29;
LABEL_30:
        *a5 = v22;
        return result;
      default:
        if (v14 == 40)
        {
          uint64_t v23 = *(void (**)(void))(a1 + 168);
          if (v23)
          {
            v23(*(void *)(a1 + 8));
            int v24 = a5;
          }

          else
          {
            int v24 = a5;
            if (*(void *)(a1 + 176)) {
              reportDefault(a1, a2, (uint64_t)v30, (uint64_t)v15);
            }
          }

          uint64_t v25 = v29;
          *a3 = v29;
          void *v24 = v25;
          if (*(_DWORD *)(a1 + 920) == 2) {
            return 35LL;
          }
          else {
            return 0LL;
          }
        }

        else
        {
LABEL_27:
          *char v12 = v15;
          return 23LL;
        }
    }
  }

uint64_t cdataSectionProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  int v9 = a2;
  uint64_t result = doCdataSection(a1, *(void *)(a1 + 304), &v9, a3, a4, *(_BYTE *)(a1 + 924) == 0, 0);
  if (!(_DWORD)result)
  {
    char v8 = v9;
    if (v9)
    {
      if (*(void *)(a1 + 912))
      {
        *(void *)(a1 + 544) = externalEntityContentProcessor;
        return externalEntityContentProcessor(a1, (uint64_t)v8, a3, (uint64_t)a4);
      }

      else
      {
        *(void *)(a1 + 544) = contentProcessor;
        return contentProcessor(a1);
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t setElementTypePrefix(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = 0LL;
  uint64_t v5 = *(void *)(a1 + 688);
  uint64_t v6 = *(char **)a2;
  while (1)
  {
    if (!v6[v4]) {
      return 1LL;
    }
    if (v6[v4] == 58) {
      break;
    }
    ++v4;
  }

  for (; v4; --v4)
  {
    int v7 = *(_BYTE **)(v5 + 184);
    if (v7 == *(_BYTE **)(v5 + 176))
    {
      uint64_t result = poolGrow((uint64_t *)(v5 + 160));
      if (!(_DWORD)result) {
        return result;
      }
      int v7 = *(_BYTE **)(v5 + 184);
    }

    char v9 = *v6++;
    *(void *)(v5 + 184) = v7 + 1;
    *int v7 = v9;
  }

  uint64_t v10 = *(_BYTE **)(v5 + 184);
  if (v10 == *(_BYTE **)(v5 + 176))
  {
    uint64_t result = poolGrow((uint64_t *)(v5 + 160));
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v10 = *(_BYTE **)(v5 + 184);
  }

  *(void *)(v5 + 184) = v10 + 1;
  *uint64_t v10 = 0;
  uint64_t result = (uint64_t)lookup(a1, (uint64_t *)(v5 + 120), *(char **)(v5 + 192), 0x10uLL);
  if (result)
  {
    uint64_t v11 = *(void *)(v5 + 192);
    if (*(void *)result == v11) {
      *(void *)(v5 + 192) = *(void *)(v5 + 184);
    }
    else {
      *(void *)(v5 + 184) = v11;
    }
    *(void *)(a2 + 8) = result;
    return 1LL;
  }

  return result;
}

uint64_t addBinding(uint64_t a1, void *a2, uint64_t a3, unsigned __int8 *a4, uint64_t *a5)
{
  unsigned __int8 v10 = *a4;
  uint64_t v11 = (_BYTE *)*a2;
  if (*a4)
  {
    if (v11)
    {
      if (*v11 == 120 && v11[1] == 109 && v11[2] == 108)
      {
        int v12 = v11[3];
        if (!v11[3])
        {
          LODWORD(v11) = 1;
          uint64_t result = 38LL;
LABEL_12:
          unint64_t v14 = 0LL;
          int v15 = 1;
          int v16 = 1;
          while (1)
          {
            unint64_t v17 = v14;
            if (v15) {
              int v18 = v12;
            }
            else {
              int v18 = 0;
            }
LABEL_27:
            unint64_t v14 = v17 + 1;
            unsigned __int8 v10 = a4[v17 + 1];
            if (!v10) {
              goto LABEL_28;
            }
          }

          switch(v10)
          {
            case '!':
            case '#':
            case '$':
            case '%':
            case '&':
            case '\'':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
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
            case ';':
            case '=':
            case '?':
            case '@':
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
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '[':
            case ']':
            case '_':
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
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
            case '~':
              goto LABEL_27;
            default:
              uint64_t result = 2LL;
              break;
          }

          return result;
        }

        if (v12 == 110 && v11[4] == 115 && !v11[5]) {
          return 39LL;
        }
      }

      LODWORD(v11) = 0;
    }

    int v12 = 1;
    uint64_t result = 40LL;
    goto LABEL_12;
  }

  if (v11) {
    return 28LL;
  }
  LODWORD(v14) = 0;
  int v16 = 1;
  uint64_t result = 40LL;
  int v15 = 1;
LABEL_28:
  if (v16) {
    BOOL v19 = (_DWORD)v14 == 36;
  }
  else {
    BOOL v19 = 0;
  }
  int v20 = v19;
  if ((_DWORD)v11 == v20)
  {
    if (v15 && (_DWORD)v14 == 29) {
      return 40LL;
    }
    if (*(_BYTE *)(a1 + 908)) {
      size_t v21 = (v14 + 1);
    }
    else {
      size_t v21 = v14;
    }
    uint64_t v22 = *(void *)(a1 + 728);
    if (v22)
    {
      if ((int)v21 <= *(_DWORD *)(v22 + 44))
      {
        uint64_t v23 = *(void **)(v22 + 32);
        goto LABEL_54;
      }

      if (v21 <= 0x7FFFFFE7)
      {
        uint64_t v23 = (void *)(*(uint64_t (**)(void, void))(a1 + 32))( *(void *)(v22 + 32),  (v21 + 24));
        if (v23)
        {
          *(void *)(v22 + 32) = v23;
          *(_DWORD *)(v22 + 44) = v21 + 24;
LABEL_54:
          *(void *)(a1 + 728) = *(void *)(v22 + 8);
          goto LABEL_55;
        }
      }
    }

    else
    {
      uint64_t v22 = (*(uint64_t (**)(uint64_t))(a1 + 24))(48LL);
      uint64_t result = 1LL;
      uint64_t v23 = (void *)(*(uint64_t (**)(void))(a1 + 24))((v21 + 24));
      *(void *)(v22 + 32) = v23;
      if (v23)
      {
        *(_DWORD *)(v22 + 44) = v21 + 24;
LABEL_55:
        *(_DWORD *)(v22 + 40) = v21;
        memcpy(v23, a4, v21);
        if (*(_BYTE *)(a1 + 908)) {
          *(_BYTE *)(*(void *)(v22 + 32) + (int)v21 - 1LL) = *(_BYTE *)(a1 + 908);
        }
        *(void *)uint64_t v22 = a2;
        *(void *)(v22 + 16) = a2[1];
        *(void *)(v22 + 24) = a3;
        if (!*a4 && (void *)(*(void *)(a1 + 688) + 304LL) == a2) {
          uint64_t v24 = 0LL;
        }
        else {
          uint64_t v24 = v22;
        }
        a2[1] = v24;
        *(void *)(v22 + 8) = *a5;
        *a5 = v22;
        if (a3)
        {
          uint64_t v25 = *(void (**)(void, void, unsigned __int8 *))(a1 + 216);
          if (v25)
          {
            if (a2[1]) {
              uint64_t v26 = a4;
            }
            else {
              uint64_t v26 = 0LL;
            }
            v25(*(void *)(a1 + 8), *a2, v26);
          }
        }

        return 0LL;
      }

      (*(void (**)(uint64_t))(a1 + 40))(v22);
    }

    return 1LL;
  }

  return result;
}

uint64_t externalEntityContentProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = doContent(a1, 1LL, *(void *)(a1 + 304), a2, a3, a4, *(_BYTE *)(a1 + 924) == 0, 1LL);
  return v5;
}

uint64_t appendAttributeValue( uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, uint64_t *a6, int a7)
{
  char v36 = (uint64_t *)(a1 + 848);
  uint64_t v34 = *(void *)(a1 + 688) + 160LL;
  uint64_t v35 = *(void *)(a1 + 688);
  while (2)
  {
    unint64_t v39 = (unint64_t)a4;
    int v14 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, uint64_t, unint64_t *))(a2 + 32))( a2,  a4,  a5,  &v39);
    if (!accountingDiffTolerated(a1, v14, a4, v39, 6000, a7))
    {
      accountingReportStats((void *)a1, " ABORTING\n");
      return 43LL;
    }

    uint64_t appended = 0LL;
    switch(v14)
    {
      case -4:
        return appended;
      case -3:
        unint64_t v39 = (unint64_t)&a4[*(int *)(a2 + 128)];
        goto LABEL_6;
      case -2:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 8:
        goto LABEL_57;
      case -1:
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = a4;
        }
        return 4LL;
      case 0:
        if (*(void *)(a1 + 304) == a2) {
          *(void *)(a1 + 560) = v39;
        }
        return 4LL;
      case 6:
        goto LABEL_22;
      case 7:
        goto LABEL_6;
      case 9:
        unsigned __int8 v37 = (*(uint64_t (**)(uint64_t, unsigned __int8 *, unint64_t))(a2 + 88))( a2,  &a4[*(int *)(a2 + 128)],  v39 - *(int *)(a2 + 128));
        if (v37)
        {
          accountingDiffTolerated(a1, 9, &v37, (unint64_t)v38, 6069, 1);
          int v16 = (unsigned __int8 *)a6[3];
          if (v16 == (unsigned __int8 *)a6[2])
          {
            int v16 = (unsigned __int8 *)a6[3];
          }

          unsigned __int8 v17 = v37;
          a6[3] = (uint64_t)(v16 + 1);
LABEL_21:
          *int v16 = v17;
LABEL_22:
          a4 = (unsigned __int8 *)v39;
          continue;
        }

        uint64_t v25 = (char *)poolStoreString(v36, a2, (uint64_t)&a4[*(int *)(a2 + 128)], v39 - *(int *)(a2 + 128));
        if (!v25) {
          return 1LL;
        }
        uint64_t v26 = lookup(a1, (uint64_t *)v35, v25, 0LL);
        uint64_t v27 = (uint64_t)v26;
        *(void *)(a1 + 872) = *(void *)(a1 + 880);
        if ((uint64_t *)v34 == a6)
        {
          if (!*(_DWORD *)(a1 + 532)) {
            goto LABEL_47;
          }
          if (*(_BYTE *)(v35 + 258))
          {
            if (*(void *)(a1 + 584)) {
              goto LABEL_47;
            }
          }

          else if (*(_BYTE *)(v35 + 257))
          {
            goto LABEL_47;
          }

LABEL_39:
          if (!v26) {
            return 11LL;
          }
          if (!*((_BYTE *)v26 + 58)) {
            return 24LL;
          }
        }

        else
        {
          if (!*(_BYTE *)(v35 + 257) || *(_BYTE *)(v35 + 258)) {
            goto LABEL_39;
          }
LABEL_47:
          if (!v26) {
            goto LABEL_22;
          }
        }

        if (!*((_BYTE *)v26 + 56))
        {
          if (*((void *)v26 + 6))
          {
            uint64_t v32 = *(void *)(a1 + 304);
            uint64_t appended = 15LL;
            goto LABEL_71;
          }

          uint64_t v28 = *((void *)v26 + 1);
          if (!v28)
          {
            uint64_t v32 = *(void *)(a1 + 304);
            uint64_t appended = 16LL;
            goto LABEL_71;
          }

          uint64_t v29 = v28 + *((int *)v26 + 4);
          *((_BYTE *)v26 + 56) = 1;
          entityTrackingOnOpen(a1, (uint64_t)v26, 6150);
          uint64_t appended = appendAttributeValue(a1, *(void *)(a1 + 456), a3, *(void *)(v27 + 8), v29, a6, 1LL);
          uint64_t v30 = a1;
          do
          {
            uint64_t v31 = v30;
            uint64_t v30 = *(void *)(v30 + 912);
          }

          while (v30);
          entityTrackingReportStats(v31, v27, "CLOSE", 6157);
          --*(_DWORD *)(v31 + 988);
          *(_BYTE *)(v27 + 56) = 0;
          if ((_DWORD)appended) {
            return appended;
          }
          goto LABEL_22;
        }

        uint64_t v32 = *(void *)(a1 + 304);
        uint64_t appended = 12LL;
LABEL_71:
        if (v32 == a2) {
          *(void *)(a1 + 560) = a4;
        }
        return appended;
      case 10:
        unsigned int v18 = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a2 + 80))(a2, a4);
        if ((v18 & 0x80000000) != 0)
        {
          if (*(void *)(a1 + 304) == a2) {
            *(void *)(a1 + 560) = a4;
          }
          return 14LL;
        }

        if ((_DWORD)a3 || v18 != 32 || (uint64_t v19 = a6[3], v19 != a6[4]) && *(_BYTE *)(v19 - 1) != 32)
        {
          int v20 = XmlUtf8Encode(v18, v38);
          if (v20 >= 1)
          {
            uint64_t v21 = v20;
            uint64_t v22 = v38;
            do
            {
              uint64_t v23 = (_BYTE *)a6[3];
              if (v23 == (_BYTE *)a6[2])
              {
                uint64_t v23 = (_BYTE *)a6[3];
              }

              char v24 = *v22++;
              a6[3] = (uint64_t)(v23 + 1);
              *uint64_t v23 = v24;
              --v21;
            }

            while (v21);
          }
        }

        goto LABEL_22;
      default:
        if (v14 != 39)
        {
LABEL_57:
          if (*(void *)(a1 + 304) == a2) {
            *(void *)(a1 + 560) = a4;
          }
          return 23LL;
        }

LABEL_6:
        int v16 = (unsigned __int8 *)a6[3];
        if (v16 == (unsigned __int8 *)a6[2])
        {
          int v16 = (unsigned __int8 *)a6[3];
        }

        a6[3] = (uint64_t)(v16 + 1);
        unsigned __int8 v17 = 32;
        goto LABEL_21;
    }
  }

    uint64_t v4 = a3 - (void)v7;
  }

  uint64_t result = 0LL;
  uint64_t v11 = v7;
  switch(*(_BYTE *)(a1 + *v7 + 136))
  {
    case 0:
    case 1:
    case 2:
    case 8:
      goto LABEL_105;
    case 3:
      uint64_t result = normal_scanRef(a1, v7 + 1, a3, &v26);
      if ((int)result >= 1)
      {
        int v7 = v26;
LABEL_41:
        unsigned int v18 = a3 - (void)v7;
        goto LABEL_26;
      }

      if (!(_DWORD)result)
      {
        uint64_t v11 = v26;
        goto LABEL_105;
      }

      return result;
    case 5:
      if (v18 < 2) {
        return 4294967294LL;
      }
      v7 += 2;
      goto LABEL_40;
    case 6:
      if (v18 < 3) {
        return 4294967294LL;
      }
      v7 += 3;
      goto LABEL_40;
    case 7:
      if (v18 < 4) {
        return 4294967294LL;
      }
      v7 += 4;
LABEL_40:
      uint64_t v26 = v7;
      goto LABEL_41;
    default:
      ++v7;
      goto LABEL_40;
  }

        a2 += 2;
      }

      else
      {
LABEL_3:
        a2 += 4;
      }

        a2 += 2;
      }

      else
      {
LABEL_3:
        a2 += 4;
      }

uint64_t internalEntityProcessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a1 + 584);
  if (!v4) {
    return 23LL;
  }
  uint64_t v9 = *(void *)(v4 + 24);
  uint64_t v10 = *(void *)(v9 + 8);
  uint64_t v11 = v10 + *(int *)(v9 + 20);
  uint64_t v12 = v10 + *(int *)(v9 + 16);
  uint64_t v22 = v11;
  if (*(_BYTE *)(v9 + 57))
  {
    uint64_t v13 = (**(uint64_t (***)(void))(a1 + 456))();
    uint64_t v14 = doProlog(a1, *(void *)(a1 + 456), v11, v12, v13, v22, &v22, 0LL, 1);
  }

  else
  {
    uint64_t v14 = doContent(a1, *(unsigned int *)(v4 + 32), *(void *)(a1 + 456), v11, v12, &v22, 0LL, 1LL);
  }

  uint64_t v15 = v14;
  if (!(_DWORD)v14)
  {
    uint64_t v17 = a1;
    if (v12 == v22 || (uint64_t v17 = a1, *(_DWORD *)(a1 + 920) != 3))
    {
      do
      {
        uint64_t v18 = v17;
        uint64_t v17 = *(void *)(v17 + 912);
      }

      while (v17);
      entityTrackingReportStats(v18, v9, "CLOSE", 5924);
      --*(_DWORD *)(v18 + 988);
      *(_BYTE *)(v9 + 56) = 0;
      uint64_t v19 = *(void *)(v4 + 16);
      *(void *)(a1 + 584) = v19;
      *(void *)(v4 + 16) = *(void *)(a1 + 592);
      *(void *)(a1 + 592) = v4;
      if (v19 && *(_DWORD *)(a1 + 920) == 3)
      {
        return 0LL;
      }

      else if (*(_BYTE *)(v9 + 57))
      {
        *(void *)(a1 + 544) = prologProcessor;
        uint64_t v20 = (**(uint64_t (***)(void))(a1 + 304))();
        LOBYTE(v21) = 1;
        return doProlog(a1, *(void *)(a1 + 304), a2, a3, v20, v22, a4, *(_BYTE *)(a1 + 924) == 0, v21);
      }

      else
      {
        *(void *)(a1 + 544) = contentProcessor;
        uint64_t v15 = doContent( a1,  *(void *)(a1 + 912) != 0LL,  *(void *)(a1 + 304),  a2,  a3,  a4,  *(_BYTE *)(a1 + 924) == 0,  0LL);
      }
    }

    else
    {
      uint64_t v15 = 0LL;
      *(_DWORD *)(v9 + 20) = v22 - *(_DWORD *)(v9 + 8);
    }
  }

  return v15;
}

uint64_t entityTrackingReportStats(uint64_t result, uint64_t a2, const char *a3, int a4)
{
  if (*(void *)(result + 912)) {
    entityTrackingReportStats_cold_1();
  }
  if (*(void *)(result + 1000))
  {
    uint64_t v4 = "%";
    if (!*(_BYTE *)(a2 + 57)) {
      uint64_t v4 = "&";
    }
    return fprintf( (FILE *)*MEMORY[0x1895F89D0],  "expat: Entities(%p): Count %9d, depth %2d/%2d %*s%s%s; %s length %d (xmlparse.c:%d)\n",
             (const void *)result,
             *(_DWORD *)(result + 984),
             *(_DWORD *)(result + 988),
             *(_DWORD *)(result + 992),
             2 * *(_DWORD *)(result + 988) - 2,
             "",
             v4,
             *(const char **)a2,
             a3,
             *(_DWORD *)(a2 + 16),
             a4);
  }

  return result;
}

_BYTE *normalizeLines(_BYTE *result)
{
  while (1)
  {
    int v1 = *result;
    if (!*result) {
      break;
    }
    if (v1 == 13)
    {
      uint64_t v2 = result;
      do
      {
        if (v1 == 13)
        {
          *uint64_t v2 = 10;
          int v3 = *++result;
          if (v3 == 10) {
            ++result;
          }
        }

        else
        {
          ++result;
          *uint64_t v2 = v1;
        }

        ++v2;
        int v1 = *result;
      }

      while (*result);
      *uint64_t v2 = 0;
      return result;
    }

    ++result;
  }

  return result;
}

uint64_t externalEntityInitProcessor2(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (unsigned __int8 *)a2;
  int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 8LL))();
  if (v8 == -2)
  {
    if (*(_BYTE *)(a1 + 924))
    {
      *(void *)(a1 + 560) = v6;
      return 6LL;
    }

uint64_t externalEntityInitProcessor3(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6 = (unsigned __int8 *)a2;
  *(void *)(a1 + 560) = a2;
  int v8 = (*(uint64_t (**)(void))(*(void *)(a1 + 304) + 8LL))();
  *(void *)(a1 + 568) = a2;
  switch(v8)
  {
    case -2:
      if (*(_BYTE *)(a1 + 924)) {
        return 6LL;
      }
LABEL_12:
      uint64_t result = 0LL;
      *a4 = v6;
      return result;
    case -1:
      if (*(_BYTE *)(a1 + 924)) {
        return 5LL;
      }
      goto LABEL_12;
    case 12:
      uint64_t result = processXmlDecl(a1, 1LL, v6, a2);
      if ((_DWORD)result) {
        return result;
      }
      int v10 = *(_DWORD *)(a1 + 920);
      if (v10 == 2) {
        return 35LL;
      }
      if (v10 == 3)
      {
        uint64_t result = 0LL;
        *a4 = a2;
        return result;
      }

      uint64_t v6 = (unsigned __int8 *)a2;
      break;
  }

  *(void *)(a1 + 544) = externalEntityContentProcessor;
  *(_DWORD *)(a1 + 604) = 1;
  return externalEntityContentProcessor(a1, (uint64_t)v6, a3, (uint64_t)a4);
}

uint64_t entityValueInitProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v6 = a2;
  *(void *)(a1 + 560) = a2;
  int v8 = (**(uint64_t (***)(void))(a1 + 304))();
  unint64_t v9 = (unint64_t)a2;
  *(void *)(a1 + 568) = a2;
  if (v8 >= 1)
  {
    int v10 = v6;
    while (1)
    {
      switch(v8)
      {
        case 14:
          if (!accountingDiffTolerated(a1, 14, v10, v9, 4570, 0))
          {
            accountingReportStats((void *)a1, " ABORTING\n");
            return 43LL;
          }

          unint64_t v9 = (unint64_t)a2;
          *a4 = a2;
          int v10 = a2;
          break;
        case 29:
          *a4 = (unsigned __int8 *)v9;
          return 2LL;
        case 12:
          uint64_t result = processXmlDecl(a1, 0LL, v6, v9);
          if (!(_DWORD)result)
          {
            if (*(_DWORD *)(a1 + 920) == 2)
            {
              return 35LL;
            }

            else
            {
              *a4 = a2;
              *(void *)(a1 + 544) = entityValueProcessor;
              return entityValueProcessor(a1, a2, a3, a4);
            }
          }

          return result;
      }

      uint64_t v6 = (unsigned __int8 *)v9;
      *(void *)(a1 + 560) = v9;
      int v8 = (**(uint64_t (***)(void))(a1 + 304))();
      unint64_t v9 = (unint64_t)a2;
      *(void *)(a1 + 568) = a2;
      if (v8 < 1) {
        goto LABEL_12;
      }
    }
  }

  int v10 = v6;
LABEL_12:
  if (v8) {
    BOOL v11 = *(_BYTE *)(a1 + 924) == 0;
  }
  else {
    BOOL v11 = 0;
  }
  if (v11)
  {
    uint64_t result = 0LL;
    *a4 = v10;
  }

  else if ((v8 + 2) >= 3)
  {
    return storeEntityValue(a1, *(void *)(a1 + 304), v10, a3, 0);
  }

  else
  {
    return (4 - v8);
  }

  return result;
}

uint64_t externalParEntProcessor(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  uint64_t v6 = a2;
  uint64_t v12 = a2;
  uint64_t v8 = (**(uint64_t (***)(void))(a1 + 304))();
  uint64_t v9 = v8;
  if ((int)v8 <= 0)
  {
    if ((_DWORD)v8) {
      BOOL v10 = *(_BYTE *)(a1 + 924) == 0;
    }
    else {
      BOOL v10 = 0;
    }
    if (!v10)
    {
      goto LABEL_11;
    }

    uint64_t result = 0LL;
    *a4 = v6;
  }

  else
  {
    if ((_DWORD)v8 != 14)
    {
LABEL_11:
      *(void *)(a1 + 544) = prologProcessor;
      return doProlog((void *)a1, *(void *)(a1 + 304), v6, a3, v9, v12, a4, *(_BYTE *)(a1 + 924) == 0, 1, 0);
    }

    if (accountingDiffTolerated(a1, 14, v6, (unint64_t)v12, 4623, 0))
    {
      uint64_t v6 = v12;
      uint64_t v9 = (**(uint64_t (***)(void))(a1 + 304))();
      goto LABEL_11;
    }

    accountingReportStats((void *)a1, " ABORTING\n");
    return 43LL;
  }

  return result;
}

uint64_t entityValueProcessor(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v8 = *(uint64_t (***)(void))(a1 + 304);
  for (int i = (*v8)(v8); i >= 1; int i = (*v8)(v8))
    ;
  if (i) {
    BOOL v10 = *(_BYTE *)(a1 + 924) == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10)
  {
    uint64_t result = 0LL;
    *a4 = a2;
  }

  else if ((i + 2) >= 3)
  {
    return storeEntityValue(a1, (uint64_t)v8, a2, a3, 0);
  }

  else
  {
    return (4 - i);
  }

  return result;
}

uint64_t hashTableDestroy(void *a1)
{
  if (a1[2])
  {
    unint64_t v2 = 0LL;
    do
      (*(void (**)(void))(a1[4] + 16LL))(*(void *)(*a1 + 8 * v2++));
    while (v2 < a1[2]);
  }

  return (*(uint64_t (**)(void))(a1[4] + 16LL))(*a1);
}

uint64_t copyEntityTable(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t a4)
{
  int v7 = *(uint64_t **)a4;
  if (*(void *)a4) {
    uint64_t v8 = &v7[*(void *)(a4 + 16)];
  }
  else {
    uint64_t v8 = 0LL;
  }
  uint64_t v9 = 0LL;
  uint64_t v10 = 0LL;
  while (1)
  {
    do
    {
      if (v7 == v8) {
        return 1LL;
      }
      uint64_t v12 = *v7++;
      uint64_t v11 = v12;
    }

    while (!v12);
    uint64_t result = poolCopyString(a3, *(char **)v11);
    if (!result) {
      return result;
    }
    uint64_t result = (uint64_t)lookup(a1, a2, (char *)result, 0x40uLL);
    if (!result) {
      return result;
    }
    uint64_t v14 = result;
    uint64_t v15 = *(char **)(v11 + 24);
    if (!v15) {
      break;
    }
    uint64_t result = poolCopyString(a3, v15);
    if (!result) {
      return result;
    }
    *(void *)(v14 + 24) = result;
    uint64_t v16 = *(void *)(v11 + 32);
    if (v16)
    {
      if (v16 != v10)
      {
        uint64_t result = poolCopyString(a3, *(char **)(v11 + 32));
        uint64_t v9 = result;
        uint64_t v10 = v16;
        if (!result) {
          return result;
        }
      }

      *(void *)(v14 + 32) = v9;
    }

    uint64_t v17 = *(char **)(v11 + 40);
    if (v17)
    {
      uint64_t result = poolCopyString(a3, v17);
      if (!result) {
        return result;
      }
      *(void *)(v14 + 40) = result;
    }

LABEL_28:
    char v24 = *(char **)(v11 + 48);
    if (v24)
    {
      uint64_t result = poolCopyString(a3, v24);
      if (!result) {
        return result;
      }
      *(void *)(v14 + 48) = result;
    }

    *(_WORD *)(v14 + 57) = *(_WORD *)(v11 + 57);
  }

  uint64_t v25 = a2;
  uint64_t v18 = *(char **)(v11 + 8);
  int v19 = *(_DWORD *)(v11 + 16);
  if (!a3[3])
  {
    uint64_t result = poolGrow(a3);
    if (!(_DWORD)result) {
      return result;
    }
  }

  if (v19 >= 1)
  {
    int v20 = v19 + 1;
    do
    {
      unsigned int v21 = (_BYTE *)a3[3];
      if (v21 == (_BYTE *)a3[2])
      {
        uint64_t result = poolGrow(a3);
        if (!(_DWORD)result) {
          return result;
        }
        unsigned int v21 = (_BYTE *)a3[3];
      }

      char v22 = *v18++;
      a3[3] = (uint64_t)(v21 + 1);
      _BYTE *v21 = v22;
      --v20;
    }

    while (v20 > 1);
  }

  uint64_t v23 = a3[4];
  a3[4] = a3[3];
  if (v23)
  {
    *(void *)(v14 + 8) = v23;
    *(_DWORD *)(v14 + 16) = *(_DWORD *)(v11 + 16);
    a2 = v25;
    goto LABEL_28;
  }

  return 0LL;
}

    LODWORD(v10) = a2[1];
LABEL_29:
    uint64_t v13 = v10 >> 5;
    uint64_t v14 = namingBitmap[(v10 >> 5) | (8 * nmstrtPages[v9])];
    uint64_t v15 = 1 << v10;
    if ((v15 & v14) != 0)
    {
      uint64_t result = 18LL;
    }

    else
    {
      if ((namingBitmap[v13 | (8 * namePages[v9])] & v15) == 0) {
        goto LABEL_16;
      }
LABEL_32:
      uint64_t result = 19LL;
    }

double XmlPrologStateInit(uint64_t a1)
{
  *(void *)a1 = prolog0;
  *(void *)&double result = 0x100000000LL;
  *(void *)(a1 + 16) = 0x100000000LL;
  *(_DWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t prolog0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  int v7 = prolog1;
  switch(a2)
  {
    case 11:
      uint64_t result = 55LL;
      goto LABEL_14;
    case 12:
      uint64_t result = 1LL;
      goto LABEL_14;
    case 13:
      uint64_t result = 56LL;
      goto LABEL_14;
    case 14:
      return result;
    case 15:
      goto LABEL_14;
    case 16:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + 2LL * *(int *)(a5 + 128),  a4,  "DOCTYPE")) {
        goto LABEL_12;
      }
      uint64_t result = 3LL;
      int v7 = doctype0;
      goto LABEL_14;
    default:
      if (a2 == 29)
      {
        uint64_t result = 2LL;
      }

      else
      {
        if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
          return 59LL;
        }
LABEL_12:
        uint64_t result = 0xFFFFFFFFLL;
      }

      int v7 = error;
LABEL_14:
      *(void *)a1 = v7;
      return result;
  }

void *XmlPrologStateInitExternalEntity(void *result)
{
  *uint64_t result = externalSubset0;
  result[2] = 0LL;
  return result;
}

void externalSubset0(_DWORD *a1, const xmlChar *a2, const xmlChar *a3, const xmlChar *a4)
{
  *(void *)a1 = externalSubset1;
  if ((_DWORD)a2 != 12) {
    externalSubset1(a1, a2, a3, a4);
  }
}

uint64_t prolog1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 0LL;
  switch(a2)
  {
    case 11:
      return 55LL;
    case 12:
      goto LABEL_5;
    case 13:
      return 56LL;
    case 14:
    case 15:
      return result;
    case 16:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + 2LL * *(int *)(a5 + 128),  a4,  "DOCTYPE")) {
        goto LABEL_11;
      }
      *(void *)a1 = doctype0;
      uint64_t result = 3LL;
      break;
    default:
      if (a2 == 29)
      {
        *(void *)a1 = error;
        uint64_t result = 2LL;
      }

      else
      {
LABEL_5:
        if (a2 != 28 || *(_DWORD *)(a1 + 20))
        {
LABEL_11:
          *(void *)a1 = error;
          uint64_t result = 0xFFFFFFFFLL;
        }

        else
        {
          uint64_t result = 59LL;
        }
      }

      break;
  }

  return result;
}

uint64_t doctype0(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 3LL;
  }
  uint64_t result = 4LL;
  uint64_t v4 = doctype1;
  if (a2 != 18 && a2 != 41)
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t error()
{
  return 0LL;
}

uint64_t doctype1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 > 17)
  {
    if (a2 == 18)
    {
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        uint64_t result = 3LL;
        int v7 = doctype3;
        goto LABEL_17;
      }

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        uint64_t result = 3LL;
        int v7 = doctype2;
        goto LABEL_17;
      }

LABEL_16:
      uint64_t result = 0xFFFFFFFFLL;
      int v7 = error;
      goto LABEL_17;
    }

    if (a2 == 25)
    {
      uint64_t result = 7LL;
      int v7 = internalSubset;
      goto LABEL_17;
    }

    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v10 = error;
    goto LABEL_17;
  }

  uint64_t result = 35LL;
LABEL_8:
  uint64_t v10 = attlist1;
LABEL_17:
  *(void *)a1 = v10;
  return result;
}

          int v7 = 0LL;
LABEL_17:
          a2 = v9;
          goto LABEL_8;
        }

        return 0xFFFFFFFFLL;
      }

      if (v8 == 22 || v8 == 24) {
        goto LABEL_27;
      }
      if (v8 != 29) {
        goto LABEL_8;
      }
    }
  }

void internalSubset(void *ctx, const xmlChar *name, const xmlChar *ExternalID, const xmlChar *SystemID)
{
  if ((int)name > 25)
  {
    if ((_DWORD)name == 26)
    {
      *(void *)ctx = doctype5;
    }

    else if ((_DWORD)name != 28)
    {
LABEL_17:
      *(void *)ctx = error;
    }
  }

  else
  {
    switch((int)name)
    {
      case 11:
      case 13:
      case 15:
        return;
      case 12:
      case 14:
        goto LABEL_17;
      case 16:
        uint64_t v6 = v4;
        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v4 + 48))( v4,  &ExternalID[2 * *(int *)(v4 + 128)],  SystemID,  "ENTITY"))
        {
          *(void *)ctx = entity0;
          return;
        }

        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))( v6,  &ExternalID[2 * *(int *)(v6 + 128)],  SystemID,  "ATTLIST"))
        {
          *(void *)ctx = attlist0;
          return;
        }

        if ((*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))( v6,  &ExternalID[2 * *(int *)(v6 + 128)],  SystemID,  "ELEMENT"))
        {
          *(void *)ctx = element0;
          return;
        }

        if (!(*(unsigned int (**)(uint64_t, const xmlChar *, const xmlChar *, const char *))(v6 + 48))( v6,  &ExternalID[2 * *(int *)(v6 + 128)],  SystemID,  "NOTATION")) {
          goto LABEL_17;
        }
        *(void *)ctx = notation0;
        break;
      default:
        if ((_DWORD)name != -4) {
          goto LABEL_17;
        }
        return;
    }
  }

uint64_t prolog2(uint64_t a1, int a2)
{
  HIDWORD(v3) = a2 - 11;
  LODWORD(v3) = a2 - 11;
  uint64_t result = 0LL;
  switch((v3 >> 1))
  {
    case 0u:
      uint64_t result = 55LL;
      break;
    case 1u:
      uint64_t result = 56LL;
      break;
    case 2u:
      return result;
    case 9u:
      *(void *)a1 = error;
      uint64_t result = 2LL;
      break;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(void *)a1 = error;
        uint64_t result = 0xFFFFFFFFLL;
      }

      else
      {
        uint64_t result = 59LL;
      }

      break;
  }

  return result;
}

uint64_t doctype3(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 3LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 5LL;
    uint64_t v4 = doctype4;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t doctype2(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 3LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 6LL;
    uint64_t v4 = doctype3;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity0(uint64_t a1, int a2)
{
  uint64_t result = 11LL;
  if (a2 != 15)
  {
    if (a2 == 22)
    {
      uint64_t v4 = entity1;
      goto LABEL_10;
    }

    if (a2 == 18)
    {
      uint64_t result = 9LL;
      uint64_t v4 = entity2;
LABEL_10:
      *(void *)a1 = v4;
      return result;
    }

    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20)) {
      goto LABEL_10;
    }
    return 59LL;
  }

  return result;
}

uint64_t attlist0(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 33LL;
  }
  uint64_t result = 34LL;
  uint64_t v4 = attlist1;
  if (a2 != 18 && a2 != 41)
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t element0(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 39LL;
  }
  uint64_t result = 40LL;
  uint64_t v4 = element1;
  if (a2 != 18 && a2 != 41)
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t notation0(uint64_t a1, uint64_t a2)
{
  if ((_DWORD)a2 == 15) {
    return 17LL;
  }
  if ((_DWORD)a2 == 18)
  {
    unint64_t v3 = notation1;
    uint64_t result = a2;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    unint64_t v3 = error;
    if ((_DWORD)a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v3;
  return result;
}

uint64_t doctype5(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 3LL;
  }
  if (a2 == 17)
  {
    uint64_t result = 8LL;
    uint64_t v4 = prolog2;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity1(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 18)
  {
    uint64_t result = 10LL;
    uint64_t v4 = entity7;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 15:
      return 11LL;
    case 27:
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 11;
      return 12LL;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        uint64_t v9 = entity4;
LABEL_13:
        *(void *)a1 = v9;
        return 11LL;
      }

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        uint64_t v9 = entity3;
        goto LABEL_13;
      }

      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
        return 59LL;
      }
      break;
  }

  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity7(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 15:
      return 11LL;
    case 27:
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 11;
      return 12LL;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
      {
        uint64_t v9 = entity9;
LABEL_13:
        *(void *)a1 = v9;
        return 11LL;
      }

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
      {
        uint64_t v9 = entity8;
        goto LABEL_13;
      }

      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
        return 59LL;
      }
      break;
  }

  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity9(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 13LL;
    uint64_t v4 = entity10;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity8(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 14LL;
    uint64_t v4 = entity9;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t declClose(uint64_t a1, int a2)
{
  if (a2 == 17)
  {
    if (*(_DWORD *)(a1 + 20)) {
      unint64_t v3 = internalSubset;
    }
    else {
      unint64_t v3 = externalSubset1;
    }
    *(void *)a1 = v3;
    return *(unsigned int *)(a1 + 12);
  }

  if (a2 == 15) {
    return *(unsigned int *)(a1 + 12);
  }
  if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
    return 59LL;
  }
  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t entity10(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 17)
  {
    if (*(_DWORD *)(a1 + 20)) {
      unint64_t v2 = internalSubset;
    }
    else {
      unint64_t v2 = externalSubset1;
    }
    uint64_t v3 = 15LL;
    goto LABEL_11;
  }

  uint64_t v3 = 0xFFFFFFFFLL;
  unint64_t v2 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
LABEL_11:
    *(void *)a1 = v2;
    return v3;
  }

  return 59LL;
}

void externalSubset1(_DWORD *a1, const xmlChar *a2, const xmlChar *a3, const xmlChar *a4)
{
  if ((int)a2 > 25)
  {
    if ((_DWORD)a2 != 26)
    {
      if ((_DWORD)a2 != 34)
      {
        if ((_DWORD)a2 == 33)
        {
          *(void *)a1 = condSect0;
          return;
        }

        goto LABEL_14;
      }

      int v4 = a1[4];
      if (v4)
      {
        a1[4] = v4 - 1;
        return;
      }
    }

uint64_t condSect0(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 == 15) {
    return 0LL;
  }
  if (a2 != 18)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
    goto LABEL_11;
  }

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "INCLUDE"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "IGNORE"))
    {
      uint64_t result = 0LL;
      uint64_t v10 = condSect2;
      goto LABEL_12;
    }

uint64_t condSect1(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 0LL;
  }
  if (a2 == 25)
  {
    uint64_t v2 = 0LL;
    *(void *)a1 = externalSubset1;
    ++*(_DWORD *)(a1 + 16);
  }

  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(void *)a1 = error;
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 59LL;
  }

  return v2;
}

uint64_t condSect2(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 0LL;
  }
  if (a2 == 25)
  {
    uint64_t result = 58LL;
    int v4 = externalSubset1;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity4(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 13LL;
    int v4 = entity5;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity3(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 14LL;
    int v4 = entity4;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t entity5(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 != 18)
  {
    if (a2 == 17)
    {
      uint64_t v6 = internalSubset;
      if (!*(_DWORD *)(a1 + 20)) {
        uint64_t v6 = externalSubset1;
      }
      uint64_t result = 15LL;
      goto LABEL_14;
    }

    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
    goto LABEL_13;
  }

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "NDATA"))
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    uint64_t v6 = error;
    goto LABEL_14;
  }

  uint64_t result = 11LL;
  uint64_t v6 = entity6;
LABEL_14:
  *(void *)a1 = v6;
  return result;
}

uint64_t entity6(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 11LL;
  }
  if (a2 == 18)
  {
    *(void *)a1 = declClose;
    *(_DWORD *)(a1 + 12) = 11;
    return 16LL;
  }

  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(void *)a1 = error;
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 59LL;
  }

uint64_t attlist1(uint64_t a1, int a2)
{
  if (a2 > 17)
  {
    uint64_t v3 = 22LL;
    uint64_t v2 = attlist2;
    if (a2 == 18 || a2 == 41) {
      goto LABEL_13;
    }
  }

  else
  {
    if (a2 == 15) {
      return 33LL;
    }
    if (a2 == 17)
    {
      if (*(_DWORD *)(a1 + 20)) {
        uint64_t v2 = internalSubset;
      }
      else {
        uint64_t v2 = externalSubset1;
      }
      uint64_t v3 = 33LL;
      goto LABEL_13;
    }
  }

  uint64_t v3 = 0xFFFFFFFFLL;
  uint64_t v2 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
LABEL_13:
    *(void *)a1 = v2;
    return v3;
  }

  return 59LL;
}

uint64_t attlist2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 15:
      return 33LL;
    case 23:
      uint64_t v11 = attlist3;
LABEL_14:
      *(void *)a1 = v11;
      return 33LL;
    case 18:
      for (uint64_t i = 0LL; i != 8; ++i)
      {
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, char *))(a5 + 48))( a5,  a3,  a4,  attlist2_types[i]))
        {
          *(void *)a1 = attlist8;
          return (i + 23);
        }
      }

      uint64_t v11 = attlist5;
      goto LABEL_14;
  }

  if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
    return 59LL;
  }
  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t attlist8(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 == 15) {
    return 33LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 37LL;
    goto LABEL_8;
  }

  if (a2 != 20)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
    goto LABEL_16;
  }

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + *(int *)(a5 + 128),  a4,  "IMPLIED"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + *(int *)(a5 + 128),  a4,  "REQUIRED"))
    {
      uint64_t result = 36LL;
      goto LABEL_8;
    }

    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + *(int *)(a5 + 128),  a4,  "FIXED"))
    {
      uint64_t result = 33LL;
      uint64_t v10 = (uint64_t (*)())attlist9;
      goto LABEL_17;
    }

uint64_t attlist5(uint64_t a1, int a2)
{
  uint64_t result = 33LL;
  if (a2 != 15)
  {
    if (a2 == 23)
    {
      int v4 = attlist6;
LABEL_8:
      *(void *)a1 = v4;
      return result;
    }

    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20)) {
      goto LABEL_8;
    }
    return 59LL;
  }

  return result;
}

uint64_t attlist3(uint64_t a1, int a2)
{
  uint64_t result = 31LL;
  int v4 = attlist4;
  if ((a2 - 18) < 2)
  {
LABEL_7:
    *(void *)a1 = v4;
    return result;
  }

  if (a2 != 15)
  {
    if (a2 != 41)
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v4 = error;
      if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
        return 59LL;
      }
    }

    goto LABEL_7;
  }

  return 33LL;
}

uint64_t attlist9(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 33LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 38LL;
    int v4 = attlist1;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t attlist6(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 33LL;
  }
  if (a2 == 18)
  {
    uint64_t result = 32LL;
    int v4 = attlist7;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t attlist7(uint64_t a1, int a2)
{
  uint64_t result = 33LL;
  if (a2 != 15)
  {
    if (a2 == 24)
    {
      int v4 = (uint64_t (*)())attlist8;
      goto LABEL_10;
    }

    if (a2 == 21)
    {
      int v4 = attlist6;
LABEL_10:
      *(void *)a1 = v4;
      return result;
    }

    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20)) {
      goto LABEL_10;
    }
    return 59LL;
  }

  return result;
}

uint64_t attlist4(uint64_t a1, int a2)
{
  uint64_t result = 33LL;
  if (a2 != 15)
  {
    if (a2 == 24)
    {
      int v4 = (uint64_t (*)())attlist8;
      goto LABEL_10;
    }

    if (a2 == 21)
    {
      int v4 = attlist3;
LABEL_10:
      *(void *)a1 = v4;
      return result;
    }

    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 != 28 || *(_DWORD *)(a1 + 20)) {
      goto LABEL_10;
    }
    return 59LL;
  }

  return result;
}

uint64_t element1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  switch(a2)
  {
    case 15:
      return 39LL;
    case 23:
      *(void *)a1 = element2;
      *(_DWORD *)(a1 + 8) = 1;
      return 44LL;
    case 18:
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "EMPTY"))
      {
        *(void *)a1 = declClose;
        *(_DWORD *)(a1 + 12) = 39;
        return 42LL;
      }

      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "ANY"))
      {
        *(void *)a1 = declClose;
        *(_DWORD *)(a1 + 12) = 39;
        return 41LL;
      }

      break;
    default:
      if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
        return 59LL;
      }
      break;
  }

  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t element2(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = 51LL;
  int v7 = element7;
  switch(a2)
  {
    case 18:
      goto LABEL_14;
    case 19:
    case 21:
    case 22:
    case 24:
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
      goto LABEL_6;
    case 20:
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))( a5,  a3 + *(int *)(a5 + 128),  a4,  "PCDATA")) {
        goto LABEL_13;
      }
      uint64_t result = 43LL;
      int v7 = element3;
      goto LABEL_14;
    case 23:
      *(_DWORD *)(a1 + 8) = 2;
      uint64_t result = 44LL;
      int v7 = element6;
      goto LABEL_14;
    case 30:
      uint64_t result = 53LL;
      goto LABEL_14;
    case 31:
      uint64_t result = 52LL;
      goto LABEL_14;
    case 32:
      uint64_t result = 54LL;
      goto LABEL_14;
    default:
      if (a2 == 15) {
        return 39LL;
      }
      if (a2 != 41)
      {
LABEL_6:
        if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
          return 59LL;
        }
LABEL_13:
        uint64_t result = 0xFFFFFFFFLL;
        int v7 = error;
      }

LABEL_14:
      *(void *)a1 = v7;
      return result;
  }

      int v7 = a3 + 2;
      goto LABEL_15;
    }

LABEL_15:
  a2 += 2;
  uint64_t v8 = a3 - (void)a2;
  while (1)
  {
    uint64_t v9 = a2[1];
    if (a2[1] <= 0xDBu) {
      break;
    }
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v10) = *a2;
      goto LABEL_26;
    }

      int v7 = a3 + 2;
      goto LABEL_15;
    }

LABEL_15:
  if (v5 < 2) {
    return 0xFFFFFFFFLL;
  }
  for (a2 += 4; ; a2 += 2)
  {
    uint64_t v9 = *(a2 - 2);
    if (*(a2 - 2) <= 0xDBu) {
      break;
    }
    if ((_DWORD)v9 != 255)
    {
LABEL_26:
      LODWORD(v10) = *(a2 - 1);
      goto LABEL_27;
    }

    LODWORD(v10) = *(a2 - 1);
LABEL_27:
LABEL_28:
    v5 -= 2LL;
    int v7 = 0xFFFFFFFFLL;
    if (v5 <= 1) {
      return v7;
    }
  }

  if (!*(a2 - 2))
  {
    uint64_t v10 = *(a2 - 1);
    uint64_t v11 = *(unsigned __int8 *)(a1 + v10 + 136);
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 0x12:
        int v7 = 28LL;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_42;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_28;
      case 0x1D:
        goto LABEL_27;
      default:
        if (v11 != 6)
        {
          if (v11 != 7) {
            goto LABEL_42;
          }
          goto LABEL_41;
        }

        break;
    }

    goto LABEL_42;
  }

uint64_t element3(uint64_t a1, int a2)
{
  if (a2 > 23)
  {
    if (a2 == 36)
    {
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 46LL;
    }

    if (a2 == 24)
    {
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 45LL;
    }
  }

  else
  {
    if (a2 == 15) {
      return 39LL;
    }
    if (a2 == 21)
    {
      *(void *)a1 = element4;
      return 39LL;
    }
  }

  if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
    return 59LL;
  }
  *(void *)a1 = error;
  return 0xFFFFFFFFLL;
}

uint64_t element6(uint64_t a1, int a2)
{
  if (a2 <= 22)
  {
    if (a2 == 15)
    {
      return 39LL;
    }

    else if (a2 == 18)
    {
LABEL_6:
      *(void *)a1 = element7;
      return 51LL;
    }

    else
    {
LABEL_8:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(void *)a1 = error;
        return 0xFFFFFFFFLL;
      }

      else
      {
        return 59LL;
      }
    }
  }

  else
  {
    switch(a2)
    {
      case 23:
        ++*(_DWORD *)(a1 + 8);
        uint64_t result = 44LL;
        break;
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
        goto LABEL_8;
      case 30:
        *(void *)a1 = element7;
        uint64_t result = 53LL;
        break;
      case 31:
        *(void *)a1 = element7;
        uint64_t result = 52LL;
        break;
      case 32:
        *(void *)a1 = element7;
        uint64_t result = 54LL;
        break;
      default:
        if (a2 != 41) {
          goto LABEL_8;
        }
        goto LABEL_6;
    }
  }

  return result;
}

uint64_t element7(uint64_t a1, int a2)
{
  if (a2 <= 34)
  {
    switch(a2)
    {
      case 15:
        return 39LL;
      case 21:
        *(void *)a1 = element6;
        return 49LL;
      case 24:
        int v4 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v4;
        if (!v4)
        {
          *(void *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }

        return 45LL;
      default:
LABEL_21:
        if (a2 != 28 || *(_DWORD *)(a1 + 20))
        {
          *(void *)a1 = error;
          return 0xFFFFFFFFLL;
        }

        else
        {
          return 59LL;
        }
    }
  }

  else
  {
    switch(a2)
    {
      case '#':
        int v2 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v2;
        if (!v2)
        {
          *(void *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }

        uint64_t result = 47LL;
        break;
      case '$':
        int v5 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v5;
        if (!v5)
        {
          *(void *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }

        uint64_t result = 46LL;
        break;
      case '%':
        int v6 = *(_DWORD *)(a1 + 8) - 1;
        *(_DWORD *)(a1 + 8) = v6;
        if (!v6)
        {
          *(void *)a1 = declClose;
          *(_DWORD *)(a1 + 12) = 39;
        }

        uint64_t result = 48LL;
        break;
      case '&':
        *(void *)a1 = element6;
        uint64_t result = 50LL;
        break;
      default:
        goto LABEL_21;
    }
  }

  return result;
}

uint64_t element4(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 39LL;
  }
  uint64_t result = 51LL;
  int v4 = element5;
  if (a2 != 18 && a2 != 41)
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t element5(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 15:
      return 39LL;
    case 21:
      *(void *)a1 = element4;
      return 39LL;
    case 36:
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 39;
      return 46LL;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(void *)a1 = error;
        return 0xFFFFFFFFLL;
      }

      else
      {
        return 59LL;
      }
  }

uint64_t notation1(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2 == 15) {
    return 17LL;
  }
  if (a2 != 18)
  {
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
    goto LABEL_11;
  }

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "SYSTEM"))
  {
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a5 + 48))(a5, a3, a4, "PUBLIC"))
    {
      uint64_t result = 17LL;
      uint64_t v10 = notation2;
      goto LABEL_12;
    }

uint64_t notation3(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 17LL;
  }
  if (a2 == 27)
  {
    *(void *)a1 = declClose;
    *(_DWORD *)(a1 + 12) = 17;
    return 19LL;
  }

  else if (a2 != 28 || *(_DWORD *)(a1 + 20))
  {
    *(void *)a1 = error;
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 59LL;
  }

uint64_t notation2(uint64_t a1, int a2)
{
  if (a2 == 15) {
    return 17LL;
  }
  if (a2 == 27)
  {
    uint64_t result = 21LL;
    int v4 = notation4;
  }

  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v4 = error;
    if (a2 == 28 && !*(_DWORD *)(a1 + 20)) {
      return 59LL;
    }
  }

  *(void *)a1 = v4;
  return result;
}

uint64_t notation4(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 15:
      return 17LL;
    case 17:
      if (*(_DWORD *)(a1 + 20)) {
        uint64_t v3 = internalSubset;
      }
      else {
        uint64_t v3 = externalSubset1;
      }
      *(void *)a1 = v3;
      return 20LL;
    case 27:
      *(void *)a1 = declClose;
      *(_DWORD *)(a1 + 12) = 17;
      return 19LL;
    default:
      if (a2 != 28 || *(_DWORD *)(a1 + 20))
      {
        *(void *)a1 = error;
        return 0xFFFFFFFFLL;
      }

      else
      {
        return 59LL;
      }
  }

uint64_t doctype4(uint64_t a1, int a2)
{
  switch(a2)
  {
    case 15:
      return 3LL;
    case 25:
      uint64_t v2 = 7LL;
      uint64_t v3 = internalSubset;
      goto LABEL_10;
    case 17:
      uint64_t v2 = 8LL;
      uint64_t v3 = prolog2;
LABEL_10:
      *(void *)a1 = v3;
      return v2;
  }

  uint64_t v2 = 0xFFFFFFFFLL;
  uint64_t v3 = error;
  if (a2 != 28 || *(_DWORD *)(a1 + 20)) {
    goto LABEL_10;
  }
  return 59LL;
}

unint64_t _INTERNAL_trim_to_complete_utf8_characters(unint64_t result, unint64_t *a2)
{
  unint64_t v2 = *a2;
  if (*a2 > result)
  {
    uint64_t v3 = 0LL;
    unint64_t v4 = *a2;
    while (1)
    {
      char v6 = *(_BYTE *)--v4;
      char v5 = v6;
      if ((v6 & 0xF8) == 0xF0)
      {
        if ((unint64_t)(v3 - 3) <= 0xFFFFFFFFFFFFFFFBLL)
        {
          v2 += 3LL;
          break;
        }
      }

      else if ((v5 & 0xF0) == 0xE0)
      {
        if ((unint64_t)(v3 - 2) <= 0xFFFFFFFFFFFFFFFCLL)
        {
          v2 += 2LL;
          break;
        }
      }

      else
      {
        if ((v5 & 0xE0) != 0xC0)
        {
          if ((v5 & 0x80) == 0) {
            break;
          }
          goto LABEL_12;
        }

        if ((unint64_t)(v3 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          ++v2;
          break;
        }
      }

      uint64_t v3 = 0LL;
LABEL_12:
      ++v3;
      unint64_t v2 = v4;
      if (v4 <= result)
      {
        unint64_t v2 = result;
        break;
      }
    }
  }

  *a2 = v2;
  return result;
}

uint64_t XmlUtf8Encode(unsigned int a1, _BYTE *a2)
{
  if ((a1 & 0x80000000) != 0) {
    return 0LL;
  }
  if (a1 <= 0x7F)
  {
    *a2 = a1;
    return 1LL;
  }

  if (a1 <= 0x7FF)
  {
    *a2 = (a1 >> 6) | 0xC0;
    a2[1] = a1 & 0x3F | 0x80;
    return 2LL;
  }

  if (!HIWORD(a1))
  {
    *a2 = (a1 >> 12) | 0xE0;
    a2[1] = (a1 >> 6) & 0x3F | 0x80;
    a2[2] = a1 & 0x3F | 0x80;
    return 3LL;
  }

  if (HIWORD(a1) > 0x10u) {
    return 0LL;
  }
  *a2 = (a1 >> 18) | 0xF0;
  a2[1] = (a1 >> 12) & 0x3F | 0x80;
  a2[2] = (a1 >> 6) & 0x3F | 0x80;
  a2[3] = a1 & 0x3F | 0x80;
  return 4LL;
}

uint64_t XmlUtf16Encode(unsigned int a1, _WORD *a2)
{
  if ((a1 & 0x80000000) != 0) {
    return 0LL;
  }
  if (!HIWORD(a1))
  {
    *a2 = a1;
    return 1LL;
  }

  if (HIWORD(a1) > 0x10u) {
    return 0LL;
  }
  *a2 = ((a1 + 67043328) >> 10) - 10240;
  a2[1] = a1 & 0x3FF | 0xDC00;
  return 2LL;
}

uint64_t XmlSizeOfUnknownEncoding()
{
  return 2016LL;
}

void *XmlInitUnknownEncoding(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  for (uint64_t i = 0LL; i != 128; ++i)
  {
    if (*((_BYTE *)&latin1_encoding[17] + i)) {
      BOOL v9 = *((_BYTE *)&latin1_encoding[17] + i) == 28;
    }
    else {
      BOOL v9 = 1;
    }
    if (!v9 && i != *(_DWORD *)(a2 + 4 * i)) {
      return 0LL;
    }
  }

  uint64_t v10 = 0LL;
  uint64_t v11 = 993LL;
  do
  {
    unint64_t v12 = *(unsigned int *)(a2 + 4 * v10);
    if ((_DWORD)v12 == -1)
    {
      *((_BYTE *)a1 + v10 + 136) = 1;
      goto LABEL_25;
    }

    if ((v12 & 0x80000000) != 0)
    {
      uint64_t result = 0LL;
      *((_BYTE *)a1 + v10 + 136) = 3 - v12;
      *((_BYTE *)a1 + v11 - 1) = 0;
      *((_WORD *)a1 + v10 + 240) = 0;
      goto LABEL_38;
    }

    if (v12 > 0x7F)
    {
      if ((checkCharRefNumber(*(unsigned int *)(a2 + 4 * v10)) & 0x80000000) == 0)
      {
        if (WORD1(v12)) {
          return 0LL;
        }
        int v19 = v12 >> 5;
        if ((namingBitmap[v19 | (8 * nmstrtPages[v12 >> 8])] & (1 << v12)) != 0)
        {
          int v20 = (char *)a1 + v10;
          char v21 = 22;
        }

        else
        {
          int v20 = (char *)a1 + v10;
          if ((namingBitmap[v19 | (8 * namePages[v12 >> 8])] & (1 << v12)) != 0) {
            char v21 = 26;
          }
          else {
            char v21 = 28;
          }
        }

        v20[136] = v21;
        *((_BYTE *)a1 + v11 - 1) = XmlUtf8Encode(v12, (_BYTE *)a1 + v11);
        *((_WORD *)a1 + v10 + 240) = v12;
        goto LABEL_38;
      }

      *((_BYTE *)a1 + v10 + 136) = 0;
LABEL_25:
      *((_WORD *)a1 + v10 + 240) = -1;
      *(_WORD *)((char *)a1 + v11 - 1) = 1;
      goto LABEL_38;
    }

    int v13 = *((unsigned __int8 *)&latin1_encoding[17] + v12);
    if (*((_BYTE *)&latin1_encoding[17] + v12)) {
      BOOL v14 = v13 == 28;
    }
    else {
      BOOL v14 = 1;
    }
    if (!v14 && v10 != v12) {
      return 0LL;
    }
    *((_BYTE *)a1 + v10 + 136) = v13;
    uint64_t v16 = (char *)a1 + v11;
    *(v16 - 1) = 1;
    *uint64_t v16 = v12;
    if ((_DWORD)v12) {
      __int16 v17 = v12;
    }
    else {
      __int16 v17 = -1;
    }
    *((_WORD *)a1 + v10 + 240) = v17;
LABEL_38:
    ++v10;
    v11 += 4LL;
  }

  while (v10 != 256);
  a1[58] = a3;
  a1[59] = a4;
  if (a3)
  {
    a1[49] = unknown_isName;
    a1[50] = unknown_isName;
    a1[51] = unknown_isName;
    a1[52] = unknown_isNmstrt;
    a1[53] = unknown_isNmstrt;
    a1[54] = unknown_isNmstrt;
    a1[55] = unknown_isInvalid;
    a1[56] = unknown_isInvalid;
    a1[57] = unknown_isInvalid;
  }

  a1[14] = unknown_toUtf8;
  a1[15] = unknown_toUtf16;
  return a1;
}

uint64_t checkCharRefNumber(uint64_t result)
{
  int v1 = (int)result >> 8;
  if (v1 == 255)
  {
  }

  else if (!v1 && !*((_BYTE *)&latin1_encoding[17] + (int)result))
  {
    return 0xFFFFFFFFLL;
  }

  return result;
}

uint64_t unknown_isName(uint64_t a1)
{
  unsigned int v1 = (*(uint64_t (**)(void))(a1 + 464))(*(void *)(a1 + 472));
  if (HIWORD(v1)) {
    return 0LL;
  }
  else {
    return namingBitmap[(v1 >> 5) | (8 * namePages[(unint64_t)v1 >> 8])] & (1 << v1);
  }
}

uint64_t unknown_isNmstrt(uint64_t a1)
{
  unsigned int v1 = (*(uint64_t (**)(void))(a1 + 464))(*(void *)(a1 + 472));
  if (HIWORD(v1)) {
    return 0LL;
  }
  else {
    return namingBitmap[(v1 >> 5) | (8 * nmstrtPages[(unint64_t)v1 >> 8])] & (1 << v1);
  }
}

uint64_t unknown_isInvalid(uint64_t a1)
{
  uint64_t v1 = (*(uint64_t (**)(void))(a1 + 464))(*(void *)(a1 + 472));
  if (WORD1(v1)) {
    return 1LL;
  }
  else {
    return checkCharRefNumber(v1) >> 31;
  }
}

uint64_t unknown_toUtf8(uint64_t a1, uint64_t *a2, unsigned __int8 *a3, void **a4, uint64_t a5)
{
  char v6 = (unsigned __int8 *)*a2;
  if (v6 == a3) {
    return 0LL;
  }
  while (1)
  {
    uint64_t v11 = a1 + 4LL * *v6;
    unsigned int v12 = *(char *)(v11 + 992);
    if (!*(_BYTE *)(v11 + 992)) {
      break;
    }
    int v13 = (_BYTE *)(v11 + 993);
    uint64_t v14 = (uint64_t)(v6 + 1);
LABEL_7:
    *a2 = v14;
    memcpy(*a4, v13, (int)v12);
    *a4 = (char *)*a4 + (int)v12;
    char v6 = (unsigned __int8 *)*a2;
  }

  unsigned int v15 = (*(uint64_t (**)(void))(a1 + 464))(*(void *)(a1 + 472));
  unsigned int v16 = XmlUtf8Encode(v15, v18);
  if (a5 - (uint64_t)*a4 >= v16)
  {
    unsigned int v12 = v16;
    uint64_t v14 = *(unsigned __int8 *)(a1 + *(unsigned __int8 *)*a2 + 136) + *a2 - 3;
    int v13 = v18;
    goto LABEL_7;
  }

  return 2LL;
}

uint64_t unknown_toUtf16(uint64_t a1, uint64_t *a2, unint64_t a3, void *a4, _WORD *a5)
{
  char v6 = (unsigned __int8 *)*a2;
  uint64_t v11 = (_WORD *)*a4;
  while (v11 < a5)
  {
    __int16 v12 = *(_WORD *)(a1 + 2LL * *v6 + 480);
    if (v12)
    {
      uint64_t v13 = (uint64_t)(v6 + 1);
    }

    else
    {
      __int16 v12 = (*(uint64_t (**)(void))(a1 + 464))(*(void *)(a1 + 472));
      uint64_t v13 = *(unsigned __int8 *)(a1 + *(unsigned __int8 *)*a2 + 136) + *a2 - 3;
    }

    *a2 = v13;
    uint64_t v14 = (_WORD *)*a4;
    *uint64_t v14 = v12;
    uint64_t v11 = v14 + 1;
    *a4 = v11;
    char v6 = (unsigned __int8 *)*a2;
    if (*a2 >= a3) {
      return 0LL;
    }
  }

  if (v11 == a5) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

uint64_t (**XmlGetUtf8InternalEncoding())()
{
  return internal_utf8_encoding;
}

void *XmlGetUtf16InternalEncoding()
{
  return &internal_little2_encoding;
}

uint64_t XmlInitEncoding(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  int EncodingIndex = getEncodingIndex(a3);
  if (EncodingIndex == -1) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 133) = EncodingIndex;
  *(void *)a1 = initScanProlog;
  *(void *)(a1 + 8) = initScanContent;
  *(void *)(a1 + 96) = initUpdatePosition;
  *(void *)(a1 + 136) = a2;
  *a2 = a1;
  return 1LL;
}

uint64_t getEncodingIndex(unsigned __int8 *a1)
{
  if (!a1) {
    return 6LL;
  }
  uint64_t v2 = 0LL;
  while (!streqci(a1, (unsigned __int8 *)getEncodingIndex_encodingNames[v2]))
  {
    if (++v2 == 6) {
      return 0xFFFFFFFFLL;
    }
  }

  return v2;
}

uint64_t initScanProlog(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  return initScan(encodings, a1, 0, a2, a3, a4);
}

uint64_t initScanContent(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  return initScan(encodings, a1, 1, a2, a3, a4);
}

uint64_t initUpdatePosition(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  return normal_updatePosition((uint64_t)utf8_encoding, a2, a3, a4);
}

uint64_t XmlParseXmlDecl( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void *a7, uint64_t *a8, void *a9, int *a10)
{
  return doParseXmlDecl( (uint64_t (*)(uint64_t, uint64_t, uint64_t))findEncoding,  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

uint64_t doParseXmlDecl( uint64_t (*a1)(uint64_t, uint64_t, uint64_t), int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6, uint64_t *a7, void *a8, uint64_t *a9, void *a10, int *a11)
{
  uint64_t v35 = 0LL;
  uint64_t v36 = 0LL;
  uint64_t v34 = 0LL;
  uint64_t v17 = *(int *)(a3 + 128);
  uint64_t v37 = a4 + 5 * v17;
  uint64_t v18 = a5 - 2 * v17;
  int v19 = parsePseudoAttribute(a3, v37, v18, &v35, (uint64_t)&v34, (uint64_t)&v36, &v37);
  uint64_t i = v35;
  if (v19) {
    BOOL v21 = v35 == 0;
  }
  else {
    BOOL v21 = 1;
  }
  if (v21) {
    goto LABEL_6;
  }
  uint64_t v23 = v34;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, v35, v34, "version"))
  {
    if (a7) {
      *a7 = v36;
    }
    uint64_t v25 = v37;
    if (a8) {
      *a8 = v37;
    }
    uint64_t i = v35;
    if (!v35)
    {
      if (!a2) {
        return 1LL;
      }
LABEL_6:
      uint64_t i = v37;
      goto LABEL_7;
    }

    uint64_t v23 = v34;
  }

  else if (!a2)
  {
    goto LABEL_7;
  }

  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, i, v23, "encoding"))
  {
LABEL_27:
    int v27 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))(a3, i, v23, "standalone");
    if (a2 || !v27) {
      goto LABEL_7;
    }
    uint64_t i = v36;
    uint64_t v28 = v37;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))( a3,  v36,  v37 - *(int *)(a3 + 128),  "yes"))
    {
      if (!a11)
      {
LABEL_38:
        for (uint64_t i = v28; ; i += *(int *)(a3 + 128))
        {
          uint64_t v40 = i;
          int v38 = &v39;
          (*(void (**)(uint64_t, uint64_t *, uint64_t, char **, uint64_t *))(a3 + 112))( a3,  &v40,  v18,  &v38,  &v40);
          unsigned int v30 = v38 == &v39 ? -1 : v39;
          BOOL v31 = v30 > 0x20;
          uint64_t v32 = (1LL << v30) & 0x100002600LL;
          if (v31 || v32 == 0) {
            break;
          }
        }

        if (i == v18) {
          return 1LL;
        }
LABEL_7:
        uint64_t result = 0LL;
        *a6 = i;
        return result;
      }

      int v29 = 1;
    }

    else
    {
      if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t, const char *))(a3 + 48))( a3,  i,  v28 - *(int *)(a3 + 128),  "no")) {
        goto LABEL_7;
      }
      if (!a11) {
        goto LABEL_38;
      }
      int v29 = 0;
    }

    *a11 = v29;
    goto LABEL_38;
  }

  uint64_t i = v36;
  uint64_t v40 = v36;
  int v38 = &v39;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, char **, uint64_t *))(a3 + 112))(a3, &v40, v18, &v38, &v40);
  if (v38 == &v39 || (v39 & 0xFFFFFFDF) - 65 > 0x19) {
    goto LABEL_7;
  }
  if (a9) {
    *a9 = i;
  }
  uint64_t v26 = v37;
  if (a10) {
    *a10 = a1(a3, i, v37 - *(int *)(a3 + 128));
  }
  uint64_t i = v35;
  if (v35)
  {
    uint64_t v23 = v34;
    goto LABEL_27;
  }

  return 1LL;
}

uint64_t (**findEncoding(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v4 = a1;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  int v7 = v9;
  uint64_t v8 = a2;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, _BYTE **, char *))(a1 + 112))( a1,  &v8,  a3,  &v7,  (char *)&v10 + 15);
  if (v8 != a3) {
    return 0LL;
  }
  *int v7 = 0;
  if (!streqci((unsigned __int8 *)v9, "UTF-16") || *(_DWORD *)(v4 + 128) != 2)
  {
    uint64_t v6 = 0LL;
    while (!streqci((unsigned __int8 *)v9, (unsigned __int8 *)getEncodingIndex_encodingNames[v6]))
    {
      if (++v6 == 6) {
        return 0LL;
      }
    }

    if (v6 != 0xFFFFFFFFLL) {
      return encodings[v6];
    }
    return 0LL;
  }

  return (uint64_t (**)())v4;
}

uint64_t (**XmlGetUtf8InternalEncodingNS())()
{
  return internal_utf8_encoding_ns;
}

void *XmlGetUtf16InternalEncodingNS()
{
  return &internal_little2_encoding_ns;
}

uint64_t XmlInitEncodingNS(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  int EncodingIndex = getEncodingIndex(a3);
  if (EncodingIndex == -1) {
    return 0LL;
  }
  *(_BYTE *)(a1 + 133) = EncodingIndex;
  *(void *)a1 = initScanPrologNS;
  *(void *)(a1 + 8) = initScanContentNS;
  *(void *)(a1 + 96) = initUpdatePosition;
  *(void *)(a1 + 136) = a2;
  *a2 = a1;
  return 1LL;
}

uint64_t initScanPrologNS(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  return initScan(encodingsNS, a1, 0, a2, a3, a4);
}

uint64_t initScanContentNS(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  return initScan(encodingsNS, a1, 1, a2, a3, a4);
}

uint64_t XmlParseXmlDeclNS( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void *a7, uint64_t *a8, void *a9, int *a10)
{
  return doParseXmlDecl( (uint64_t (*)(uint64_t, uint64_t, uint64_t))findEncodingNS,  a1,  a2,  a3,  a4,  a5,  a6,  a7,  a8,  a9,  a10);
}

uint64_t (**findEncodingNS(uint64_t a1, uint64_t a2, uint64_t a3))()
{
  uint64_t v4 = a1;
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v10 = 0u;
  memset(v9, 0, sizeof(v9));
  int v7 = v9;
  uint64_t v8 = a2;
  (*(void (**)(uint64_t, uint64_t *, uint64_t, _BYTE **, char *))(a1 + 112))( a1,  &v8,  a3,  &v7,  (char *)&v10 + 15);
  if (v8 != a3) {
    return 0LL;
  }
  *int v7 = 0;
  if (!streqci((unsigned __int8 *)v9, "UTF-16") || *(_DWORD *)(v4 + 128) != 2)
  {
    uint64_t v6 = 0LL;
    while (!streqci((unsigned __int8 *)v9, (unsigned __int8 *)getEncodingIndex_encodingNames[v6]))
    {
      if (++v6 == 6) {
        return 0LL;
      }
    }

    if (v6 != 0xFFFFFFFFLL) {
      return encodingsNS[v6];
    }
    return 0LL;
  }

  return (uint64_t (**)())v4;
}

void *XmlInitUnknownEncodingNS(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = XmlInitUnknownEncoding(a1, a2, a3, a4);
  if (result) {
    *((_BYTE *)result + 194) = 23;
  }
  return result;
}

uint64_t normal_prologTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, char **a4)
{
  if ((unint64_t)a2 < a3)
  {
    char v5 = a2;
    uint64_t v8 = 18LL;
    uint64_t v9 = 1LL;
    switch(*(_BYTE *)(a1 + *a2 + 136))
    {
      case 2:
        unsigned int v16 = (char *)(a2 + 1);
        int v17 = *(unsigned __int8 *)(a1 + *v16 + 136);
        switch(*(_BYTE *)(a1 + *v16 + 136))
        {
          case 0xF:
            return normal_scanPi((_BYTE *)a1, (char *)a2 + 2, a3, a4);
          case 0x10:
            return normal_scanDecl((_BYTE *)a1, a2 + 2, a3, (unsigned __int8 **)a4);
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x14:
          case 0x15:
          case 0x17:
            goto LABEL_154;
          case 0x16:
          case 0x18:
            goto LABEL_141;
          default:
LABEL_141:
            *a4 = (char *)a2;
            uint64_t v8 = 29LL;
            break;
        }

        return v8;
      case 4:
        int v19 = (char *)(a2 + 1);
        uint64_t v20 = a3 - (void)(a2 + 1);
        if (v20 < 1) {
          return 4294967270LL;
        }
        if (*v19 != 93) {
          goto LABEL_136;
        }
        if (a2[2] == 62)
        {
          *a4 = (char *)(a2 + 3);
          return 34LL;
        }

        else
        {
LABEL_136:
          *a4 = v19;
          return 26LL;
        }

      case 5:
        uint64_t v8 = 19LL;
LABEL_70:
        uint64_t v9 = 2LL;
        goto LABEL_4;
      case 6:
        uint64_t v8 = 19LL;
LABEL_76:
        uint64_t v9 = 3LL;
        goto LABEL_4;
      case 7:
        uint64_t v8 = 19LL;
LABEL_153:
        uint64_t v9 = 4LL;
LABEL_4:
        v5 += v9;
        unint64_t v10 = a3 - (void)v5;
        while (2)
        {
          switch(*(_BYTE *)(a1 + *v5 + 136))
          {
            case 5:
              if (v10 < 2) {
                return 4294967294LL;
              }
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5))
              {
                goto LABEL_134;
              }

              uint64_t v11 = (char *)(v5 + 2);
              goto LABEL_7;
            case 6:
              if (v10 < 3) {
                return 4294967294LL;
              }
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5))
              {
                goto LABEL_134;
              }

              uint64_t v11 = (char *)(v5 + 3);
              goto LABEL_7;
            case 7:
              if (v10 < 4) {
                return 4294967294LL;
              }
              if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
                || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5))
              {
                goto LABEL_134;
              }

              uint64_t v11 = (char *)(v5 + 4);
              goto LABEL_7;
            case 9:
            case 0xA:
            case 0xB:
            case 0x14:
            case 0x15:
            case 0x1E:
            case 0x20:
            case 0x23:
            case 0x24:
              goto LABEL_135;
            case 0xF:
              if ((_DWORD)v8 == 19) {
                goto LABEL_134;
              }
              *a4 = (char *)(v5 + 1);
              return 30LL;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              uint64_t v11 = (char *)(v5 + 1);
              goto LABEL_7;
            case 0x17:
              uint64_t v11 = (char *)(v5 + 1);
              if ((_DWORD)v8 == 41)
              {
                uint64_t v8 = 19LL;
                goto LABEL_7;
              }

              if ((_DWORD)v8 != 18) {
                goto LABEL_7;
              }
              unint64_t v12 = a3 - (void)v11;
              unsigned int v13 = *(unsigned __int8 *)(a1 + *v11 + 136);
              uint64_t v8 = 19LL;
              if (v13 > 0x15)
              {
                if (v13 - 24 >= 4 && v13 != 22)
                {
                  if (v13 == 29) {
                    goto LABEL_49;
                  }
LABEL_7:
                  unint64_t v10 = a3 - (void)v11;
                  char v5 = (unsigned __int8 *)v11;
                  continue;
                }

                uint64_t v11 = (char *)(v5 + 2);
LABEL_47:
                uint64_t v8 = 41LL;
                goto LABEL_7;
              }

              if (v13 == 5)
              {
                if (v12 < 2) {
                  return 4294967294LL;
                }
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5 + 1)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5 + 1))
                {
                  goto LABEL_49;
                }

                uint64_t v11 = (char *)(v5 + 3);
                goto LABEL_47;
              }

              if (v13 != 6)
              {
                if (v13 != 7) {
                  goto LABEL_7;
                }
                if (v12 < 4) {
                  return 4294967294LL;
                }
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5 + 1)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5 + 1))
                {
                  goto LABEL_49;
                }

                uint64_t v11 = (char *)(v5 + 5);
                goto LABEL_47;
              }

              if (v12 < 3) {
                return 4294967294LL;
              }
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5 + 1)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5 + 1))
              {
                uint64_t v11 = (char *)(v5 + 4);
                goto LABEL_47;
              }

LABEL_49:
              uint64_t v8 = 0LL;
              *a4 = v11;
              break;
            case 0x21:
              if ((_DWORD)v8 == 19) {
                goto LABEL_134;
              }
              *a4 = (char *)(v5 + 1);
              return 31LL;
            case 0x22:
              if ((_DWORD)v8 == 19) {
                goto LABEL_134;
              }
              *a4 = (char *)(v5 + 1);
              return 32LL;
            default:
              goto LABEL_134;
          }

          return v8;
        }

      case 9:
        *a4 = (char *)a3;
        return 4294967281LL;
      case 0xA:
      case 0x15:
LABEL_80:
        BOOL v21 = (char *)(a2 + 1);
        uint64_t v22 = a3 - (void)(a2 + 1);
        if (v22 < 1) {
          goto LABEL_91;
        }
        do
        {
          int v23 = *(unsigned __int8 *)(a1 + *v21 + 136);
          ++v21;
          --v22;
        }

        while (v22 > 0);
        BOOL v21 = (char *)a3;
LABEL_91:
        *a4 = v21;
        return 15LL;
      case 0xB:
        *a4 = (char *)(a2 + 1);
        return 17LL;
      case 0xC:
        uint64_t v26 = a2 + 1;
        int v27 = 12;
        return normal_scanLit(v27, (_BYTE *)a1, v26, a3, (unsigned __int8 **)a4);
      case 0xD:
        uint64_t v26 = a2 + 1;
        int v27 = 13;
        return normal_scanLit(v27, (_BYTE *)a1, v26, a3, (unsigned __int8 **)a4);
      case 0x13:
        char v5 = a2 + 1;
        unint64_t v28 = a3 - (void)(a2 + 1);
        uint64_t v8 = 0LL;
        unsigned int v29 = *(unsigned __int8 *)(a1 + *v5 + 136);
        if (v29 <= 6)
        {
          if (v29 == 5)
          {
            if (v28 >= 2)
            {
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v5))
              {
                uint64_t v31 = 2LL;
                goto LABEL_105;
              }

              goto LABEL_134;
            }
          }

          else
          {
            if (v29 != 6) {
              goto LABEL_135;
            }
            if (v28 >= 3)
            {
              if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v5))
              {
                uint64_t v31 = 3LL;
                goto LABEL_105;
              }

    int v7 = 6LL;
LABEL_50:
    a2 = v9;
LABEL_51:
    *a4 = a2;
    return v7;
  }

  return 0xFFFFFFFFLL;
}

        LODWORD(v19) = v16[1];
        goto LABEL_50;
      }

      int v19 = v16[1];
      switch(*(_BYTE *)(a1 + v19 + 136))
      {
        case 6:
          return 4294967294LL;
        case 7:
          goto LABEL_75;
        case 9:
        case 0xA:
        case 0xB:
        case 0x14:
        case 0x15:
        case 0x1E:
        case 0x20:
        case 0x23:
        case 0x24:
          goto LABEL_77;
        case 0xF:
          if ((_DWORD)result == 19) {
            goto LABEL_76;
          }
          *a4 = (uint64_t)(v16 + 2);
          return 30LL;
        case 0x16:
        case 0x18:
        case 0x19:
        case 0x1A:
        case 0x1B:
          goto LABEL_51;
        case 0x17:
          uint64_t v20 = v16 + 2;
          if ((_DWORD)result == 41) {
            goto LABEL_42;
          }
          if ((_DWORD)result != 18) {
            break;
          }
          BOOL v21 = v6 - (void)v20;
          uint64_t v22 = *v20;
          if (*v20 > 0xDBu)
          {
            if ((_DWORD)v22 == 255)
            {
              LODWORD(v23) = v16[3];
              if (v23 > 0xFD)
              {
LABEL_42:
                uint64_t result = 19LL;
                break;
              }

              goto LABEL_64;
            }

    int v7 = 6LL;
LABEL_50:
    a2 = v9;
LABEL_51:
    *a4 = a2;
    return v7;
  }

  return 0xFFFFFFFFLL;
}

LABEL_134:
              uint64_t v8 = 0LL;
LABEL_135:
              *a4 = (char *)v5;
              return v8;
            }
          }
        }

        else
        {
          if (v29 != 7)
          {
            if (v29 != 22 && v29 != 24) {
              goto LABEL_135;
            }
            uint64_t v31 = 1LL;
LABEL_105:
            v5 += v31;
            unint64_t v32 = a3 - (void)v5;
            do
            {
              uint64_t v8 = 0LL;
              uint64_t v33 = 1LL;
              switch(*(_BYTE *)(a1 + *v5 + 136))
              {
                case 5:
                  if (v32 < 2) {
                    return 4294967294LL;
                  }
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v5))
                  {
                    goto LABEL_134;
                  }

                  uint64_t v33 = 2LL;
                  break;
                case 6:
                  if (v32 < 3) {
                    return 4294967294LL;
                  }
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v5))
                  {
                    goto LABEL_134;
                  }

                  uint64_t v33 = 3LL;
                  break;
                case 7:
                  if (v32 < 4) {
                    return 4294967294LL;
                  }
                  if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
                    || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v5))
                  {
                    goto LABEL_134;
                  }

                  uint64_t v33 = 4LL;
                  break;
                case 9:
                case 0xA:
                case 0xB:
                case 0x15:
                case 0x1E:
                case 0x20:
                case 0x24:
                  uint64_t v8 = 20LL;
                  goto LABEL_135;
                case 0x16:
                case 0x18:
                case 0x19:
                case 0x1A:
                case 0x1B:
                  break;
                default:
                  goto LABEL_135;
              }

              v5 += v33;
              unint64_t v32 = a3 - (void)v5;
              uint64_t v8 = 4294967276LL;
            }

            while ((uint64_t)(a3 - (void)v5) > 0);
            return v8;
          }

          if (v28 >= 4)
          {
            if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v5)
              && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v5))
            {
              uint64_t v31 = 4LL;
              goto LABEL_105;
            }

            goto LABEL_134;
          }
        }

        return 4294967294LL;
      case 0x14:
        *a4 = (char *)(a2 + 1);
        return 25LL;
      case 0x16:
      case 0x18:
        goto LABEL_4;
      case 0x17:
      case 0x19:
      case 0x1A:
      case 0x1B:
        uint64_t v8 = 19LL;
        uint64_t v9 = 1LL;
        goto LABEL_4;
      case 0x1E:
        return normal_scanPercent(a1, a2 + 1, a3, (unsigned __int8 **)a4);
      case 0x1F:
        *a4 = (char *)(a2 + 1);
        return 23LL;
      case 0x20:
        unsigned int v16 = (char *)(a2 + 1);
        unsigned int v34 = *(unsigned __int8 *)(a1 + *v16 + 136);
        if (v34 > 0x1F)
        {
          switch(*(_BYTE *)(a1 + *v16 + 136))
          {
            case ' ':
            case '#':
            case '$':
              goto LABEL_143;
            case '!':
              *a4 = (char *)(a2 + 2);
              uint64_t v8 = 36LL;
              break;
            case '""':
              *a4 = (char *)(a2 + 2);
              uint64_t v8 = 37LL;
              break;
            default:
              goto LABEL_154;
          }

          return v8;
        }

        if (v34 - 9 < 3) {
          goto LABEL_143;
        }
        if (v34 == 15)
        {
          *a4 = (char *)(a2 + 2);
          return 35LL;
        }

        else
        {
          if (v34 == 21)
          {
LABEL_143:
            *a4 = v16;
            return 24LL;
          }

LABEL_154:
          uint64_t v8 = 0LL;
          *a4 = v16;
        }

        return v8;
      case 0x23:
        *a4 = (char *)(a2 + 1);
        return 38LL;
      case 0x24:
        *a4 = (char *)(a2 + 1);
        return 21LL;
      default:
        goto LABEL_134;
    }
  }

  return 4294967292LL;
}

uint64_t normal_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  uint64_t v6 = a2;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_3;
    case 2:
      unint64_t v10 = a2 + 1;
      unint64_t v11 = a3 - (void)(a2 + 1);
      uint64_t v12 = 1LL;
      switch(*(_BYTE *)(a1 + *v10 + 136))
      {
        case 5:
          if (v11 < 2) {
            return 4294967294LL;
          }
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6 + 1))
          {
            goto LABEL_98;
          }

          uint64_t v12 = 2LL;
          goto LABEL_9;
        case 6:
          if (v11 < 3) {
            return 4294967294LL;
          }
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6 + 1))
          {
            goto LABEL_98;
          }

          uint64_t v12 = 3LL;
          goto LABEL_9;
        case 7:
          if (v11 < 4) {
            return 4294967294LL;
          }
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2 + 1)
            || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6 + 1))
          {
            goto LABEL_98;
          }

          uint64_t v12 = 4LL;
LABEL_9:
          uint64_t v6 = &v10[v12];
          unint64_t v13 = a3 - (void)&v10[v12];
          int v14 = 0;
          while (2)
          {
            uint64_t v15 = 1LL;
            switch(*(_BYTE *)(a1 + *v6 + 136))
            {
              case 5:
                if (v13 < 2) {
                  return 4294967294LL;
                }
                if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6)
                  || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6))
                {
                  goto LABEL_3;
                }

                goto LABEL_40;
              case 6:
                if (v13 < 3) {
                  return 4294967294LL;
                }
                if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6)
                  && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6))
                {
                  goto LABEL_19;
                }

                goto LABEL_3;
              case 7:
                if (v13 < 4) {
                  return 4294967294LL;
                }
                if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6)
                  && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6))
                {
                  goto LABEL_23;
                }

                goto LABEL_3;
              case 9:
              case 0xA:
              case 0x15:
                unint64_t v31 = a3 - (void)++v6;
                uint64_t result = 0xFFFFFFFFLL;
                while (2)
                {
                  switch(*(_BYTE *)(a1 + *v6 + 136))
                  {
                    case 5:
                      if (v31 < 2) {
                        return 4294967294LL;
                      }
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6))
                      {
                        goto LABEL_3;
                      }

                      uint64_t v35 = 3LL;
                      break;
                    case 6:
                      if (v31 < 3) {
                        return 4294967294LL;
                      }
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6))
                      {
                        goto LABEL_3;
                      }

                      uint64_t v35 = 4LL;
                      break;
                    case 7:
                      if (v31 < 4) {
                        return 4294967294LL;
                      }
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6))
                      {
                        goto LABEL_3;
                      }

                      uint64_t v35 = 5LL;
                      break;
                    case 9:
                    case 0xA:
                    case 0x15:
                      ++v6;
                      return result;
                    case 0xB:
                      goto LABEL_162;
                    case 0x11:
                      goto LABEL_163;
                    case 0x16:
                    case 0x18:
                      uint64_t v35 = 2LL;
                      return normal_scanAtts(a1, &v6[v35 - 1], a3, a4);
                    default:
                      goto LABEL_3;
                  }

                  return normal_scanAtts(a1, &v6[v35 - 1], a3, a4);
                }

              case 0xB:
LABEL_162:
                *a4 = v6 + 1;
                return 2LL;
              case 0x11:
LABEL_163:
                int v19 = v6 + 1;
                if (*v19 != 62) {
                  goto LABEL_56;
                }
                *a4 = v6 + 2;
                return 4LL;
              case 0x16:
              case 0x18:
              case 0x19:
              case 0x1A:
              case 0x1B:
                goto LABEL_41;
              case 0x17:
                if (v14) {
                  goto LABEL_3;
                }
                unint64_t v10 = v6 + 1;
                unint64_t v16 = a3 - (void)(v6 + 1);
                unsigned int v17 = *(unsigned __int8 *)(a1 + *v10 + 136);
                if (v17 > 0x15)
                {
                  if (v17 != 22 && v17 != 24) {
                    goto LABEL_98;
                  }
                  int v14 = 1;
LABEL_40:
                  uint64_t v15 = 2LL;
                }

                else
                {
                  switch(v17)
                  {
                    case 5u:
                      if (v16 < 2) {
                        return 4294967294LL;
                      }
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v6 + 1)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6 + 1))
                      {
                        goto LABEL_98;
                      }

                      int v14 = 1;
LABEL_19:
                      uint64_t v15 = 3LL;
                      break;
                    case 6u:
                      if (v16 < 3) {
                        return 4294967294LL;
                      }
                      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 448))(a1, v6 + 1)
                        || !(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6 + 1))
                      {
                        goto LABEL_98;
                      }

                      int v14 = 1;
LABEL_23:
                      uint64_t v15 = 4LL;
                      break;
                    case 7u:
                      if (v16 >= 4)
                      {
                        if (!(*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v6 + 1)
                          && (*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6 + 1))
                        {
                          int v14 = 1;
                          uint64_t v15 = 5LL;
                          break;
                        }

LABEL_98:
                        uint64_t result = 0LL;
                        *a4 = v10;
                        return result;
                      }

                      return 4294967294LL;
                    default:
                      goto LABEL_98;
                  }
                }

LABEL_41:
                v6 += v15;
                unint64_t v13 = a3 - (void)v6;
                uint64_t result = 0xFFFFFFFFLL;
                continue;
              default:
                goto LABEL_3;
            }
          }

        case 0xF:
          return normal_scanPi((_BYTE *)a1, (char *)a2 + 2, a3, (char **)a4);
        case 0x10:
          int v19 = a2 + 2;
          int v23 = *(unsigned __int8 *)(a1 + *v19 + 136);
          if (v23 != 20)
          {
            if (v23 != 27) {
              goto LABEL_56;
            }
            return normal_scanComment((_BYTE *)a1, a2 + 3, a3, a4);
          }

          unsigned int v29 = a2 + 3;
          uint64_t v30 = 0LL;
          int v19 = a2 + 9;
          while (v29[v30] == big2_scanCdataSection_CDATA_LSQB[v30])
          {
            if (++v30 == 6)
            {
              uint64_t result = 8LL;
              goto LABEL_137;
            }
          }

          uint64_t result = 0LL;
          int v19 = &v29[v30];
          goto LABEL_137;
        case 0x11:
          uint64_t v6 = a2 + 2;
          unint64_t v24 = a3 - (void)(a2 + 2);
          uint64_t result = 0LL;
          unsigned int v25 = *(unsigned __int8 *)(a1 + *v6 + 136);
          if (v25 > 6)
          {
            if (v25 == 7)
            {
              if (v24 < 4) {
                return 4294967294LL;
              }
              uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6);
              if (!(_DWORD)result) {
                goto LABEL_4;
              }
              uint64_t v26 = 4LL;
            }

            else
            {
              uint64_t v26 = 1LL;
              if (v25 != 22 && v25 != 24) {
                goto LABEL_4;
              }
            }

            goto LABEL_121;
          }

          if (v25 == 5)
          {
            if (v24 < 2) {
              return 4294967294LL;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6);
            if (!(_DWORD)result) {
              goto LABEL_4;
            }
            uint64_t v26 = 2LL;
            goto LABEL_121;
          }

          if (v25 != 6) {
            goto LABEL_4;
          }
          if (v24 < 3) {
            return 4294967294LL;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6);
          if ((_DWORD)result)
          {
            uint64_t v26 = 3LL;
LABEL_121:
            v6 += v26;
            unint64_t v27 = a3 - (void)v6;
            while (2)
            {
              uint64_t result = 0LL;
              uint64_t v28 = 1LL;
              switch(*(_BYTE *)(a1 + *v6 + 136))
              {
                case 5:
                  if (v27 < 2) {
                    return 4294967294LL;
                  }
                  uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6);
                  if (!(_DWORD)result) {
                    goto LABEL_4;
                  }
                  uint64_t v28 = 2LL;
                  goto LABEL_123;
                case 6:
                  if (v27 < 3) {
                    return 4294967294LL;
                  }
                  uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6);
                  if (!(_DWORD)result) {
                    goto LABEL_4;
                  }
                  uint64_t v28 = 3LL;
                  goto LABEL_123;
                case 7:
                  if (v27 < 4) {
                    return 4294967294LL;
                  }
                  uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6);
                  if (!(_DWORD)result) {
                    goto LABEL_4;
                  }
                  uint64_t v28 = 4LL;
LABEL_123:
                  v6 += v28;
                  unint64_t v27 = a3 - (void)v6;
                  uint64_t result = 0xFFFFFFFFLL;
                  continue;
                case 9:
                case 0xA:
                case 0x15:
                  unint64_t v32 = a3 - (void)++v6;
                  uint64_t result = 0xFFFFFFFFLL;
                  break;
                case 0xB:
                  goto LABEL_192;
                case 0x16:
                case 0x17:
                case 0x18:
                case 0x19:
                case 0x1A:
                case 0x1B:
                  goto LABEL_123;
                default:
                  goto LABEL_4;
              }

              break;
            }

            while (1)
            {
              int v33 = *(unsigned __int8 *)(a1 + *v6 + 136);
              ++v6;
            }

            if (v33 == 11)
            {
LABEL_192:
              ++v6;
              uint64_t result = 5LL;
              goto LABEL_4;
            }

            goto LABEL_3;
          }

          break;
        case 0x16:
        case 0x18:
          goto LABEL_9;
        default:
          goto LABEL_98;
      }

      goto LABEL_4;
    case 3:
      return normal_scanRef(a1, a2 + 1, a3, a4);
    case 4:
      uint64_t v9 = a2 + 1;
      if (*v9 != 93) {
        goto LABEL_73;
      }
      int v19 = a2 + 2;
      if (*v19 == 62)
      {
LABEL_56:
        uint64_t result = 0LL;
        goto LABEL_137;
      }

      goto LABEL_73;
    case 5:
      uint64_t v9 = v6 + 2;
      goto LABEL_73;
    case 6:
      uint64_t v9 = v6 + 3;
      goto LABEL_73;
    case 7:
      if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, a2))
      {
LABEL_3:
        uint64_t result = 0LL;
LABEL_4:
        *a4 = v6;
        return result;
      }

      uint64_t v9 = v6 + 4;
LABEL_73:
      unint64_t v21 = a3 - (void)v9;
      if ((uint64_t)(a3 - (void)v9) < 1)
      {
        uint64_t v22 = v9;
LABEL_94:
        *a4 = v22;
        return 6LL;
      }

      break;
    case 9:
      uint64_t v20 = a2 + 1;
      if (*(_BYTE *)(a1 + a2[1] + 136) == 10) {
        uint64_t v20 = a2 + 2;
      }
LABEL_70:
      *a4 = v20;
      return 7LL;
    case 0xA:
      uint64_t v20 = a2 + 1;
      goto LABEL_70;
    default:
      uint64_t v9 = a2 + 1;
      goto LABEL_73;
  }

  while (2)
  {
    switch(*(_BYTE *)(a1 + *v9 + 136))
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 8:
      case 9:
      case 0xA:
        goto LABEL_92;
      case 4:
        if (v21 < 2) {
          goto LABEL_92;
        }
        uint64_t v22 = v9 + 1;
        if (v9[1] != 93) {
          goto LABEL_90;
        }
        if (v21 < 3)
        {
LABEL_92:
          *a4 = v9;
          return 6LL;
        }

        if (v9[2] != 62)
        {
LABEL_90:
          unint64_t v21 = a3 - (void)v22;
          uint64_t v9 = v22;
          continue;
        }

        uint64_t result = 0LL;
        int v19 = v9 + 2;
LABEL_137:
        *a4 = v19;
        return result;
      case 5:
        uint64_t v22 = v9 + 2;
        goto LABEL_90;
      case 6:
        uint64_t v22 = v9 + 3;
        goto LABEL_90;
      case 7:
        uint64_t v22 = v9 + 4;
        goto LABEL_90;
      default:
        uint64_t v22 = v9 + 1;
        goto LABEL_90;
    }
  }

LABEL_42:
  int v7 = 0LL;
  a2 -= 2;
LABEL_8:
  *a4 = a2;
  return v7;
}

uint64_t normal_cdataSectionTok(_BYTE *a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  uint64_t v6 = a2;
  int v8 = a1[*a2 + 136];
  uint64_t result = 0LL;
  switch(v8)
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_42;
    case 4:
      unint64_t v10 = a2 + 1;
      if (*v10 != 93) {
        goto LABEL_10;
      }
      if (a2[2] != 62) {
        goto LABEL_10;
      }
      uint64_t v6 = a2 + 3;
      uint64_t result = 40LL;
      goto LABEL_42;
    case 5:
      unint64_t v10 = v6 + 2;
      goto LABEL_10;
    case 6:
      unint64_t v10 = v6 + 3;
      goto LABEL_10;
    case 7:
      if ((uint64_t)(a3 - (void)a2) >= 4)
      {
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, a2))
        {
LABEL_41:
          uint64_t result = 0LL;
        }

        else
        {
          unint64_t v10 = v6 + 4;
LABEL_10:
          unint64_t v11 = a3 - (void)v10;
          if ((uint64_t)(a3 - (void)v10) < 1)
          {
            uint64_t result = 6LL;
            uint64_t v6 = v10;
          }

          else
          {
            uint64_t v6 = v10;
            while (2)
            {
              uint64_t v12 = 1LL;
              uint64_t result = 6LL;
              switch(a1[*v6 + 136])
              {
                case 0:
                case 1:
                case 4:
                case 8:
                case 9:
                case 0xA:
                  break;
                case 5:
                  if (v11 >= 2)
                  {
                    uint64_t v12 = 2LL;
                    goto LABEL_22;
                  }

                  break;
                case 6:
                  if (v11 >= 3)
                  {
                    uint64_t v12 = 3LL;
                    goto LABEL_22;
                  }

                  break;
                case 7:
                  if (v11 >= 4)
                  {
                    uint64_t v12 = 4LL;
                    goto LABEL_22;
                  }

                  break;
                default:
LABEL_22:
                  v6 += v12;
                  unint64_t v11 = a3 - (void)v6;
LABEL_23:
                  uint64_t result = 6LL;
                  break;
              }

              break;
            }
          }
        }

LABEL_42:
        *a4 = v6;
      }

      else
      {
LABEL_31:
        uint64_t result = 4294967294LL;
      }

      break;
    case 9:
      if (a1[a2[1] + 136] == 10) {
        uint64_t v6 = a2 + 2;
      }
      else {
        uint64_t v6 = a2 + 1;
      }
LABEL_37:
      uint64_t result = 7LL;
      goto LABEL_42;
    case 10:
      uint64_t v6 = a2 + 1;
      goto LABEL_37;
    default:
      unint64_t v10 = a2 + 1;
      goto LABEL_10;
  }

  return result;
}

uint64_t normal_ignoreSectionTok(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a3 - (void)a2;
  int v7 = a2;
  int v9 = 0;
  while (2)
  {
    uint64_t result = 0LL;
    switch(a1[*v7 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_31;
      case 2:
        unint64_t v11 = v7 + 1;
        if (*v11 != 33) {
          goto LABEL_26;
        }
        unint64_t v11 = v7 + 2;
        if (*v11 == 91)
        {
          unint64_t v11 = v7 + 3;
          ++v9;
        }

        goto LABEL_26;
      case 4:
        unint64_t v11 = v7 + 1;
        if (*v11 != 93) {
          goto LABEL_26;
        }
        unint64_t v11 = v7 + 2;
        if (*v11 != 62) {
          goto LABEL_26;
        }
        unint64_t v11 = v7 + 3;
        if (v9)
        {
          --v9;
LABEL_26:
          unint64_t v4 = a3 - (void)v11;
          int v7 = v11;
          continue;
        }

        uint64_t result = 42LL;
        v7 += 3;
LABEL_31:
        *a4 = v7;
        return result;
      case 5:
        if (v4 < 2) {
          return 4294967294LL;
        }
        unint64_t v11 = v7 + 2;
        goto LABEL_26;
      case 6:
        if (v4 < 3) {
          return 4294967294LL;
        }
        unint64_t v11 = v7 + 3;
        goto LABEL_26;
      case 7:
        if (v4 < 4) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a1 + 57))(a1, v7))
        {
LABEL_30:
          uint64_t result = 0LL;
          goto LABEL_31;
        }

        unint64_t v11 = v7 + 4;
        goto LABEL_26;
      default:
        unint64_t v11 = v7 + 1;
        goto LABEL_26;
    }
  }

uint64_t normal_attributeValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (2)
  {
    uint64_t v5 = 2LL;
    switch(*(_BYTE *)(a1 + *v4 + 136))
    {
      case 2:
        uint64_t result = 0LL;
        *a4 = v4;
        return result;
      case 3:
        if (v4 != a2) {
          goto LABEL_9;
        }
        return normal_scanRef(a1, a2 + 1, a3, a4);
      case 5:
        goto LABEL_8;
      case 6:
        uint64_t v5 = 3LL;
        goto LABEL_8;
      case 7:
        uint64_t v5 = 4LL;
        goto LABEL_8;
      case 9:
        if (v4 != a2) {
          goto LABEL_9;
        }
        int v7 = a2 + 1;
        if ((uint64_t)(a3 - (void)(a2 + 1)) < 1)
        {
          uint64_t result = 4294967293LL;
        }

        else
        {
          if (*(_BYTE *)(a1 + a2[1] + 136) == 10) {
            int v7 = a2 + 2;
          }
LABEL_22:
          *a4 = v7;
          uint64_t result = 7LL;
        }

        break;
      case 0xA:
        if (v4 != a2) {
          goto LABEL_9;
        }
        int v7 = a2 + 1;
        goto LABEL_22;
      case 0x15:
        if (v4 != a2) {
          goto LABEL_9;
        }
        *a4 = a2 + 1;
        return 39LL;
      default:
        uint64_t v5 = 1LL;
LABEL_8:
        v4 += v5;
LABEL_9:
        *a4 = v4;
        uint64_t result = 6LL;
        break;
    }

    return result;
  }

uint64_t normal_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (2)
  {
    uint64_t v5 = 2LL;
    switch(*(_BYTE *)(a1 + *v4 + 136))
    {
      case 3:
        if (v4 != a2) {
          goto LABEL_10;
        }
        return normal_scanRef(a1, a2 + 1, a3, a4);
      case 4:
      case 8:
        goto LABEL_8;
      case 5:
        goto LABEL_9;
      case 6:
        uint64_t v5 = 3LL;
        goto LABEL_9;
      case 7:
        uint64_t v5 = 4LL;
        goto LABEL_9;
      case 9:
        if (v4 != a2) {
          goto LABEL_10;
        }
        int v7 = a2 + 1;
        if (*(_BYTE *)(a1 + a2[1] + 136) == 10) {
          int v7 = a2 + 2;
        }
LABEL_23:
        *a4 = v7;
        return 7LL;
      case 0xA:
        if (v4 != a2) {
          goto LABEL_10;
        }
        int v7 = a2 + 1;
        goto LABEL_23;
      default:
        if (*(_BYTE *)(a1 + *v4 + 136) != 30)
        {
LABEL_8:
          uint64_t v5 = 1LL;
LABEL_9:
          v4 += v5;
          continue;
        }

        if (v4 == a2)
        {
          LODWORD(result) = normal_scanPercent(a1, a2 + 1, a3, a4);
          if ((_DWORD)result == 22) {
            return 0LL;
          }
          else {
            return result;
          }
        }

        else
        {
LABEL_10:
          *a4 = v4;
          return 6LL;
        }
    }
  }

BOOL normal_nameMatchesAscii(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _BYTE *a4)
{
  int v4 = *a4;
  if (!*a4) {
    return a2 == a3;
  }
  uint64_t v5 = a4 + 1;
  uint64_t v6 = a3 - a2;
  while (1)
  {
    BOOL v7 = v6-- < 1;
    if (v7 || *a2 != v4) {
      break;
    }
    ++a2;
    int v8 = *v5++;
    int v4 = v8;
    if (!v8) {
      return a2 == a3;
    }
  }

  return 0LL;
}

uint64_t normal_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  for (uint64_t i = a2; ; i += qword_185010F80[(char)v3])
  {
    unsigned int v3 = *(unsigned __int8 *)(a1 + *i + 136) - 5;
    if (v3 >= 0x19 || ((0x17E0007u >> v3) & 1) == 0) {
      break;
    }
  }

  return ((_DWORD)i - (_DWORD)a2);
}

unsigned __int8 *normal_skipS(uint64_t a1, unsigned __int8 *a2)
{
  while (1)
  {
    unsigned int v2 = *(unsigned __int8 *)(a1 + *a2 + 136);
    BOOL v3 = v2 > 0x15;
    int v4 = (1 << v2) & 0x200600;
    if (v3 || v4 == 0) {
      break;
    }
    ++a2;
  }

  return a2;
}

uint64_t normal_getAtts(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 0LL;
  int v6 = 0;
  uint64_t v7 = 1LL;
  while (2)
  {
    uint64_t v8 = a2;
    unsigned int v10 = *(unsigned __int8 *)++a2;
    unsigned int v9 = v10;
    uint64_t v11 = v7;
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 3:
        continue;
      case 5:
        if (!(_DWORD)v7)
        {
          uint64_t v11 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v13 = a4 + 32LL * (int)result;
            *(void *)uint64_t v13 = a2;
            *(_BYTE *)(v13 + 24) = 1;
          }
        }

        a2 = v8 + 2;
        uint64_t v7 = v11;
        continue;
      case 6:
        if (!(_DWORD)v7)
        {
          uint64_t v11 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v14 = a4 + 32LL * (int)result;
            *(void *)uint64_t v14 = a2;
            *(_BYTE *)(v14 + 24) = 1;
          }
        }

        a2 = v8 + 3;
        uint64_t v7 = v11;
        continue;
      case 7:
        if (!(_DWORD)v7)
        {
          uint64_t v11 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v15 = a4 + 32LL * (int)result;
            *(void *)uint64_t v15 = a2;
            *(_BYTE *)(v15 + 24) = 1;
          }
        }

        a2 = v8 + 4;
        uint64_t v7 = v11;
        continue;
      case 9:
      case 0xA:
        uint64_t v7 = 0LL;
        if ((_DWORD)v11 != 1)
        {
          uint64_t v7 = v11;
          if ((_DWORD)v11 == 2 && (int)result < a3)
          {
            *(_BYTE *)(a4 + 32LL * (int)result + 24) = 0;
            uint64_t v7 = 2LL;
          }
        }

        continue;
      case 0xB:
      case 0x11:
        uint64_t v7 = 2LL;
        if ((_DWORD)v11 == 2) {
          continue;
        }
        return result;
      case 0xC:
        if ((_DWORD)v7 == 2)
        {
          uint64_t v7 = 2LL;
          if (v6 == 12)
          {
            uint64_t v7 = 0LL;
            uint64_t result = (result + 1);
            int v6 = 12;
          }
        }

        else
        {
          int v6 = 12;
          uint64_t v7 = 2LL;
          if ((int)result < a3)
          {
            *(void *)(a4 + 32LL * (int)result + 8) = v8 + 2;
            int v6 = 12;
            uint64_t v7 = 2LL;
          }
        }

        continue;
      case 0xD:
        if ((_DWORD)v7 == 2)
        {
          uint64_t v7 = 2LL;
          if (v6 == 13)
          {
            uint64_t v7 = 0LL;
            uint64_t result = (result + 1);
            int v6 = 13;
          }
        }

        else
        {
          int v6 = 13;
          uint64_t v7 = 2LL;
          if ((int)result < a3)
          {
            *(void *)(a4 + 32LL * (int)result + 8) = v8 + 2;
            int v6 = 13;
            uint64_t v7 = 2LL;
          }
        }

        continue;
      case 0x15:
        uint64_t v7 = 0LL;
        if ((_DWORD)v11 != 1)
        {
          uint64_t v7 = v11;
          if ((_DWORD)v11 == 2 && (int)result < a3)
          {
            uint64_t v16 = a4 + 32LL * (int)result;
            int v18 = *(unsigned __int8 *)(v16 + 24);
            unsigned int v17 = (_BYTE *)(v16 + 24);
            uint64_t v7 = 2LL;
            if (v18)
            {
              if (v9 != 32
                || a2 == *(void *)(a4 + 32LL * (int)result + 8)
                || (uint64_t v19 = *(unsigned __int8 *)(v8 + 2), v19 == 32)
                || (v20 = *(unsigned __int8 *)(a1 + v19 + 136), uint64_t v7 = 2LL, v6 == v20))
              {
                _BYTE *v17 = 0;
                uint64_t v7 = 2LL;
              }
            }
          }
        }

        continue;
      case 0x16:
      case 0x18:
      case 0x1D:
        if (!(_DWORD)v7)
        {
          uint64_t v7 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v12 = a4 + 32LL * (int)result;
            *(void *)uint64_t v12 = a2;
            *(_BYTE *)(v12 + 24) = 1;
          }
        }

        continue;
      default:
        continue;
    }
  }

uint64_t normal_charRefNumber(uint64_t a1, unsigned __int8 *a2)
{
  int v2 = a2[2];
  if (v2 == 59)
  {
LABEL_4:
    uint64_t v4 = 0LL;
    return checkCharRefNumber(v4);
  }

  if (v2 == 120)
  {
    int v3 = a2[3];
    if (v3 == 59) {
      goto LABEL_4;
    }
    uint64_t v4 = 0LL;
    uint64_t v7 = a2 + 4;
    while (1)
    {
      unsigned int v8 = (char)v3 - 48;
      if (v8 <= 0x36)
      {
        if (((1LL << v8) & 0x3FF) != 0)
        {
          uint64_t v4 = v8 | (16 * (_DWORD)v4);
          goto LABEL_18;
        }

        if (((1LL << v8) & 0x7E0000) != 0)
        {
          uint64_t v4 = ((char)v3 + 16 * v4 - 55);
LABEL_18:
          goto LABEL_19;
        }

        if (((1LL << v8) & 0x7E000000000000LL) != 0)
        {
          uint64_t v4 = ((char)v3 + 16 * v4 - 87);
          goto LABEL_18;
        }
      }

LABEL_19:
      int v9 = *v7++;
      LOBYTE(v3) = v9;
      if (v9 == 59) {
        return checkCharRefNumber(v4);
      }
    }
  }

  LODWORD(v4) = 0;
  uint64_t v5 = a2 + 3;
  while (1)
  {
    uint64_t v4 = (10 * v4 + (char)v2 - 48);
    int v6 = *v5++;
    LOBYTE(v2) = v6;
    if (v6 == 59) {
      return checkCharRefNumber(v4);
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t normal_predefinedEntityName(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = a3 - (void)a2;
  if (a3 - (void)a2 == 4)
  {
    int v7 = (char)*a2;
    if (v7 == 97)
    {
      if (a2[1] == 112 && a2[2] == 111 && a2[3] == 115) {
        return 39LL;
      }
    }

    else if (v7 == 113 && a2[1] == 117 && a2[2] == 111 && a2[3] == 116)
    {
      return 34LL;
    }

    return 0LL;
  }

  if (v3 == 3)
  {
    if (*a2 == 97 && a2[1] == 109 && a2[2] == 112) {
      return 38LL;
    }
    return 0LL;
  }

  if (v3 != 2 || a2[1] != 116) {
    return 0LL;
  }
  int v4 = *a2;
  if (v4 == 103) {
    unsigned int v5 = 62;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v4 == 108) {
    return 60LL;
  }
  else {
    return v5;
  }
}

uint64_t normal_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      switch(*(_BYTE *)(result + *a2 + 136))
      {
        case 5:
          a2 += 2;
          goto LABEL_7;
        case 6:
          a2 += 3;
          goto LABEL_7;
        case 7:
          a2 += 4;
          goto LABEL_7;
        case 9:
          ++*a4;
          if (a3 - (uint64_t)(a2 + 1) < 1)
          {
            ++a2;
          }

          else if (*(_BYTE *)(result + a2[1] + 136) == 10)
          {
            a2 += 2;
          }

          else
          {
            ++a2;
          }

          a4[1] = 0LL;
          goto LABEL_8;
        case 0xA:
          ++*a4;
          a4[1] = 0LL;
          ++a2;
          goto LABEL_8;
        default:
          ++a2;
LABEL_7:
          ++a4[1];
LABEL_8:
          continue;
      }
    }
  }

  return result;
}

uint64_t normal_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4 = (unsigned __int8 *)(a2 + 1);
  uint64_t v5 = ~(a2 + 1) + a3;
  if (v5 >= 1)
  {
    do
    {
      uint64_t v6 = *v4;
      int v7 = (char)v6;
      uint64_t v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1LL << v8) & 0xFCB8FE600LL) != 0) {
          goto LABEL_4;
        }
        if (((1LL << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0) {
            goto LABEL_4;
          }
        }

        else if (v8 == 21)
        {
          if (v7 == 9) {
            goto LABEL_14;
          }
          goto LABEL_4;
        }
      }

      if (v7 != 64 && v7 != 36)
      {
LABEL_14:
        uint64_t result = 0LL;
        *a4 = v4;
        return result;
      }

LABEL_4:
      ++v4;
      --v5;
    }

    while (v5 > 0);
  }

  return 1LL;
}

    if (v5 < 4) {
      return 4294967294LL;
    }
    int v7 = a3 + 4;
LABEL_15:
    uint64_t v5 = a4 - (void)v7;
    a3 = v7;
  }

  if ((unint64_t)v4 >= 4)
  {
LABEL_7:
    uint64_t v6 = 0LL;
LABEL_8:
    *a4 = a2;
    return v6;
  }

  return 4294967294LL;
}

    if (v5 < 4) {
      return 4294967294LL;
    }
    int v7 = a3 + 4;
LABEL_15:
    uint64_t v5 = a4 - (void)v7;
    a3 = v7;
  }

uint64_t latin1_toUtf8(uint64_t a1, char **a2, char *a3, _BYTE **a4, _BYTE *a5)
{
  while (2)
  {
    for (uint64_t i = *a2; ; *a2 = i)
    {
      if (i == a3) {
        return 0LL;
      }
      int v6 = *i;
      int v7 = *a4;
      if ((v6 & 0x80000000) == 0) {
        break;
      }
      if (a5 - v7 < 2) {
        return 2LL;
      }
      *a4 = v7 + 1;
      *int v7 = (v6 >> 6) | 0xC0;
      char v8 = v6 & 0x3F | 0x80;
      int v9 = (*a4)++;
      *int v9 = v8;
      uint64_t i = *a2 + 1;
    }

    if (v7 != a5)
    {
      *a2 = i + 1;
      char v10 = *i;
      uint64_t v11 = (*a4)++;
      *uint64_t v11 = v10;
      continue;
    }

    break;
  }

  return 2LL;
}

uint64_t latin1_toUtf16(uint64_t a1, unint64_t *a2, unint64_t a3, void *a4, _WORD *a5)
{
  uint64_t v5 = (unsigned __int8 *)*a2;
  if (*a2 >= a3) {
    return 0LL;
  }
  int v6 = (_WORD *)*a4;
  while (v6 < a5)
  {
    *a2 = (unint64_t)(v5 + 1);
    int v7 = (_WORD *)*a4;
    *int v7 = *v5;
    int v6 = v7 + 1;
    *a4 = v6;
    uint64_t v5 = (unsigned __int8 *)*a2;
    if (*a2 >= a3) {
      return 0LL;
    }
  }

  if (v6 == a5) {
    return 2LL;
  }
  else {
    return 0LL;
  }
}

uint64_t normal_scanLit(int a1, _BYTE *a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5 = a4 - (void)a3;
  char v8 = a3;
  while (2)
  {
    int v11 = a2[*v8 + 136];
    switch(a2[*v8 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_19;
      case 5:
        if (v5 < 2) {
          return 4294967294LL;
        }
        v8 += 2;
        goto LABEL_16;
      case 6:
        if (v5 < 3) {
          return 4294967294LL;
        }
        v8 += 3;
        goto LABEL_16;
      case 7:
        if (v5 >= 4)
        {
          if ((*((unsigned int (**)(_BYTE *, unsigned __int8 *))a2 + 57))(a2, v8))
          {
LABEL_19:
            uint64_t result = 0LL;
            *a5 = v8;
            return result;
          }

          v8 += 4;
LABEL_16:
          unint64_t v5 = a4 - (void)v8;
          continue;
        }

        return 4294967294LL;
      case 0xC:
      case 0xD:
        ++v8;
        if (v11 != a1) {
          goto LABEL_16;
        }
        *a5 = v8;
        unsigned int v13 = a2[*v8 + 136];
        BOOL v14 = v13 > 0x1E;
        int v15 = (1 << v13) & 0x40300E00;
        if (v14 || v15 == 0) {
          return 0LL;
        }
        else {
          return 27LL;
        }
      default:
        ++v8;
        goto LABEL_16;
    }
  }

uint64_t normal_scanDecl(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  switch(a1[*a2 + 136])
  {
    case 0x14:
      *a4 = a2 + 1;
      uint64_t result = 33LL;
      break;
    case 0x16:
    case 0x18:
      int v4 = a2 + 1;
      uint64_t v5 = a3 - (void)(a2 + 1);
      if (v5 < 1) {
        return 0xFFFFFFFFLL;
      }
      while (2)
      {
        switch(a1[*v4 + 136])
        {
          case 0x15:
            goto LABEL_11;
          case 0x16:
          case 0x18:
            ++v4;
            if (--v5 <= 0) {
              return 0xFFFFFFFFLL;
            }
            continue;
          case 0x17:
          case 0x19:
          case 0x1A:
          case 0x1B:
          case 0x1C:
          case 0x1D:
            goto LABEL_17;
          case 0x1E:
            unsigned int v7 = a1[v4[1] + 136];
            BOOL v8 = v7 > 0x1E;
            int v9 = (1 << v7) & 0x40200600;
            if (!v8 && v9 != 0) {
              goto LABEL_17;
            }
            goto LABEL_11;
          default:
            if (a1[*v4 + 136] - 9 >= 2)
            {
LABEL_17:
              uint64_t result = 0LL;
              *a4 = v4;
            }

            else
            {
LABEL_11:
              *a4 = v4;
              uint64_t result = 16LL;
            }

            break;
        }

        break;
      }

      break;
    case 0x1B:
      uint64_t result = normal_scanComment(a1, a2 + 1, a3, a4);
      break;
    default:
      uint64_t result = 0LL;
      *a4 = a2;
      break;
  }

  return result;
}

uint64_t normal_scanPi(_BYTE *a1, char *a2, uint64_t a3, char **a4)
{
  unint64_t v6 = a3 - (void)a2;
  uint64_t v23 = v4;
  uint64_t v24 = v5;
  int v9 = a2;
  unsigned int v11 = a1[*a2 + 136];
  if (v11 > 0x15)
  {
    if (v11 != 22 && v11 != 24) {
      goto LABEL_33;
    }
    uint64_t v12 = 1LL;
  }

  else
  {
    switch(v11)
    {
      case 5u:
        if (v6 < 2) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 55))(a1, a2)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 52))(a1, v9))
        {
          goto LABEL_33;
        }

        uint64_t v12 = 2LL;
        break;
      case 6u:
        if (v6 < 3) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 56))(a1, a2)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 53))(a1, v9))
        {
          goto LABEL_33;
        }

        uint64_t v12 = 3LL;
        break;
      case 7u:
        if (v6 >= 4)
        {
          if (!(*((unsigned int (**)(_BYTE *, char *))a1 + 57))(a1, a2)
            && (*((unsigned int (**)(_BYTE *, char *))a1 + 54))(a1, v9))
          {
            uint64_t v12 = 4LL;
            break;
          }

LABEL_33:
          uint64_t result = 0LL;
          *a4 = v9;
          return result;
        }

        return 4294967294LL;
      default:
        goto LABEL_33;
    }
  }

  int v15 = &v9[v12];
  unint64_t v16 = a3 - (void)&v9[v12];
  while (2)
  {
    uint64_t v17 = 1LL;
    switch(a1[*v15 + 136])
    {
      case 5:
        if (v16 < 2) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 55))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 49))(a1, v15))
        {
          goto LABEL_43;
        }

        uint64_t v17 = 2LL;
        goto LABEL_19;
      case 6:
        if (v16 < 3) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 56))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 50))(a1, v15))
        {
          goto LABEL_43;
        }

        uint64_t v17 = 3LL;
        goto LABEL_19;
      case 7:
        if (v16 < 4) {
          return 4294967294LL;
        }
        if ((*((unsigned int (**)(_BYTE *, char *))a1 + 57))(a1, v15)
          || !(*((unsigned int (**)(_BYTE *, char *))a1 + 51))(a1, v15))
        {
          goto LABEL_43;
        }

        uint64_t v17 = 4LL;
LABEL_19:
        v15 += v17;
        unint64_t v16 = a3 - (void)v15;
        continue;
      case 9:
      case 0xA:
      case 0x15:
        uint64_t result = normal_checkPiTarget(v9, (uint64_t)v15, &v22);
        if (!(_DWORD)result) {
          goto LABEL_44;
        }
        int v9 = v15 + 1;
        unint64_t v18 = a3 - (void)(v15 + 1);
        if ((uint64_t)v18 >= 1)
        {
          while (2)
          {
            switch(a1[*v9 + 136])
            {
              case 0:
              case 1:
              case 8:
                goto LABEL_33;
              case 5:
                if (v18 < 2) {
                  return 4294967294LL;
                }
                uint64_t v19 = v9 + 2;
                goto LABEL_60;
              case 6:
                if (v18 < 3) {
                  return 4294967294LL;
                }
                uint64_t v19 = v9 + 3;
                goto LABEL_60;
              case 7:
                if (v18 < 4) {
                  return 4294967294LL;
                }
                uint64_t v19 = v9 + 4;
LABEL_60:
                unint64_t v18 = a3 - (void)v19;
                uint64_t result = 0xFFFFFFFFLL;
                int v9 = v19;
                continue;
              case 0xF:
                uint64_t v19 = v9 + 1;
                if (*v19 != 62) {
                  goto LABEL_60;
                }
                unint64_t v21 = (unsigned __int8 *)(v9 + 2);
                goto LABEL_71;
              default:
                uint64_t v19 = v9 + 1;
                goto LABEL_60;
            }
          }
        }

        return 0xFFFFFFFFLL;
      case 0xF:
        uint64_t result = normal_checkPiTarget(v9, (uint64_t)v15, &v22);
        if (!(_DWORD)result) {
          goto LABEL_44;
        }
        int v20 = v15 + 1;
        if (*v20 == 62)
        {
          unint64_t v21 = (unsigned __int8 *)(v15 + 2);
LABEL_71:
          *a4 = (char *)v21;
          uint64_t result = v22;
        }

        else
        {
LABEL_63:
          uint64_t result = 0LL;
          *a4 = v20;
        }

        break;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_19;
      case 0x1D:
LABEL_43:
        uint64_t result = 0LL;
LABEL_44:
        *a4 = v15;
        return result;
      default:
        int v20 = v15;
        goto LABEL_63;
    }

    return result;
  }

            if (v10 < 4) {
              goto LABEL_49;
            }
            uint64_t v12 = 4LL;
            goto LABEL_48;
          }

          goto LABEL_37;
        }

    unint64_t v16 = a2 + 2;
    uint64_t v17 = v6 - (void)(a2 + 2);
    if (v17 < 2) {
      return -(int)result;
    }
    while (1)
    {
      unint64_t v18 = *v16;
      if (*v16 > 0xDBu) {
        break;
      }
      if (*v16)
      {
        if ((v18 - 216) < 4)
        {
LABEL_75:
LABEL_76:
          uint64_t result = 0LL;
LABEL_77:
          *a4 = (uint64_t)v16;
          return result;
        }

            if (v10 < 4) {
              goto LABEL_49;
            }
            uint64_t v12 = 4LL;
            goto LABEL_48;
          }

          goto LABEL_37;
        }

uint64_t normal_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a3 - (void)a2;
  unint64_t v6 = a2;
  uint64_t result = 0LL;
  uint64_t v10 = 1LL;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 5:
      if (v4 < 2) {
        return 4294967294LL;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v6);
      if (!(_DWORD)result) {
        goto LABEL_17;
      }
      uint64_t v10 = 2LL;
      break;
    case 6:
      if (v4 < 3) {
        return 4294967294LL;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v6);
      if (!(_DWORD)result) {
        goto LABEL_17;
      }
      uint64_t v10 = 3LL;
      break;
    case 7:
      if (v4 < 4) {
        return 4294967294LL;
      }
      uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v6);
      if (!(_DWORD)result) {
        goto LABEL_17;
      }
      uint64_t v10 = 4LL;
      break;
    case 9:
    case 0xA:
    case 0x15:
      uint64_t result = 22LL;
      goto LABEL_17;
    case 0x16:
    case 0x18:
      break;
    default:
      goto LABEL_17;
  }

  v6 += v10;
  unint64_t v11 = a3 - (void)v6;
  while (1)
  {
    unsigned int v12 = *(unsigned __int8 *)(a1 + *v6 + 136);
    if (v12 > 0x11) {
      break;
    }
    switch(v12)
    {
      case 5u:
        if (v11 < 2) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v6);
        if (!(_DWORD)result) {
          goto LABEL_17;
        }
        uint64_t v13 = 2LL;
        break;
      case 6u:
        if (v11 < 3) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v6);
        if (!(_DWORD)result) {
          goto LABEL_17;
        }
        uint64_t v13 = 3LL;
        break;
      case 7u:
        if (v11 < 4) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v6);
        if (!(_DWORD)result) {
          goto LABEL_17;
        }
        uint64_t v13 = 4LL;
        break;
      default:
        goto LABEL_16;
    }

LABEL_44:
    v6 += v13;
    unint64_t v11 = a3 - (void)v6;
  }

  if (v12 - 24 < 4 || v12 == 22)
  {
    uint64_t v13 = 1LL;
    goto LABEL_44;
  }

  if (v12 != 18)
  {
LABEL_16:
    uint64_t result = 0LL;
    goto LABEL_17;
  }

  ++v6;
  uint64_t result = 28LL;
LABEL_17:
  *a4 = v6;
  return result;
}

uint64_t normal_scanComment(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v5 = a2;
  if (*a2 != 45)
  {
LABEL_22:
    uint64_t result = 0LL;
    goto LABEL_23;
  }

  uint64_t v5 = a2 + 1;
  unint64_t v7 = a3 - (void)(a2 + 1);
  while (2)
  {
    uint64_t result = 0LL;
    switch(a1[*v5 + 136])
    {
      case 0:
      case 1:
      case 8:
        goto LABEL_23;
      case 2:
      case 3:
      case 4:
        goto LABEL_12;
      case 5:
        if (v7 < 2) {
          return 4294967294LL;
        }
        uint64_t v10 = v5 + 2;
        goto LABEL_19;
      case 6:
        if (v7 < 3) {
          return 4294967294LL;
        }
        uint64_t v10 = v5 + 3;
        goto LABEL_19;
      case 7:
        if (v7 < 4) {
          return 4294967294LL;
        }
        uint64_t v10 = v5 + 4;
        goto LABEL_19;
      default:
        if (a1[*v5 + 136] != 27)
        {
LABEL_12:
          uint64_t v10 = v5 + 1;
LABEL_19:
          unint64_t v7 = a3 - (void)v10;
          uint64_t v5 = v10;
          continue;
        }

        uint64_t v10 = v5 + 1;
        if (*v10 != 45) {
          goto LABEL_19;
        }
        int v11 = v5[2];
        if (v11 == 62) {
          v5 += 3;
        }
        else {
          v5 += 2;
        }
        if (v11 == 62) {
          uint64_t result = 13LL;
        }
        else {
          uint64_t result = 0LL;
        }
LABEL_23:
        *a4 = v5;
        return result;
    }
  }

BOOL normal_checkPiTarget(char *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 11;
  if (a2 - (void)a1 != 3) {
    return 1LL;
  }
  int v3 = *a1;
  if (v3 == 120)
  {
    int v4 = 0;
  }

  else
  {
    if (v3 != 88) {
      return 1LL;
    }
    int v4 = 1;
  }

  int v5 = a1[1];
  if (v5 != 109)
  {
    if (v5 != 77) {
      return 1LL;
    }
    int v4 = 1;
  }

  int v6 = a1[2];
  if (v6 != 108) {
    return v6 != 76;
  }
  if (v4) {
    return 0LL;
  }
  *a3 = 12;
  return 1LL;
}

uint64_t normal_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a3 - (void)a2;
  unint64_t v7 = a2;
  uint64_t result = 0LL;
  unsigned int v10 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v10 <= 0x12)
  {
    switch(v10)
    {
      case 5u:
        if (v4 >= 2)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7);
          if (!(_DWORD)result) {
            goto LABEL_60;
          }
          uint64_t v11 = 2LL;
          goto LABEL_18;
        }

        break;
      case 6u:
        if (v4 >= 3)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7);
          if (!(_DWORD)result) {
            goto LABEL_60;
          }
          uint64_t v11 = 3LL;
          goto LABEL_18;
        }

        break;
      case 7u:
        if (v4 >= 4)
        {
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7);
          if (!(_DWORD)result) {
            goto LABEL_60;
          }
          uint64_t v11 = 4LL;
LABEL_18:
          v7 += v11;
          unint64_t v13 = a3 - (void)v7;
          if (a3 - (uint64_t)v7 >= 1)
          {
            while (1)
            {
              unsigned int v14 = *(unsigned __int8 *)(a1 + *v7 + 136);
              if (v14 > 0x11)
              {
                if (v14 - 24 >= 4 && v14 != 22)
                {
                  if (v14 == 18)
                  {
                    ++v7;
                    uint64_t result = 9LL;
                    goto LABEL_60;
                  }

LABEL_59:
                  uint64_t result = 0LL;
                  goto LABEL_60;
                }

                uint64_t v15 = 1LL;
              }

              else
              {
                switch(v14)
                {
                  case 5u:
                    if (v13 < 2) {
                      return 4294967294LL;
                    }
                    uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v7);
                    if (!(_DWORD)result) {
                      goto LABEL_60;
                    }
                    uint64_t v15 = 2LL;
                    break;
                  case 6u:
                    if (v13 < 3) {
                      return 4294967294LL;
                    }
                    uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v7);
                    if (!(_DWORD)result) {
                      goto LABEL_60;
                    }
                    uint64_t v15 = 3LL;
                    break;
                  case 7u:
                    if (v13 < 4) {
                      return 4294967294LL;
                    }
                    uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v7);
                    if (!(_DWORD)result) {
                      goto LABEL_60;
                    }
                    uint64_t v15 = 4LL;
                    break;
                  default:
                    goto LABEL_59;
                }
              }

              v7 += v15;
              unint64_t v13 = a3 - (void)v7;
            }
          }

          return 0xFFFFFFFFLL;
        }

        break;
      default:
        goto LABEL_60;
    }

    return 4294967294LL;
  }

  if (v10 != 19)
  {
    if (v10 == 22 || v10 == 24)
    {
      uint64_t v11 = 1LL;
      goto LABEL_18;
    }

LABEL_60:
    *a4 = v7;
    return result;
  }

  if (a3 - (uint64_t)(a2 + 1) >= 1)
  {
    uint64_t v17 = a2[1];
    if (v17 != 120)
    {
      if (*(_BYTE *)(a1 + v17 + 136) != 25)
      {
        uint64_t result = 0LL;
        unint64_t v7 = a2 + 1;
        goto LABEL_60;
      }

      unint64_t v7 = a2 + 2;
      uint64_t v20 = v4 - 2;
      while (v20-- >= 1)
      {
        unsigned int v22 = *v7++;
        int v23 = *(unsigned __int8 *)(a1 + v22 + 136);
        if (v23 != 25)
        {
          if (v23 != 18)
          {
            uint64_t result = 0LL;
            --v7;
            goto LABEL_60;
          }

          goto LABEL_77;
        }
      }

      return 0xFFFFFFFFLL;
    }

    if (a3 - (uint64_t)(a2 + 2) >= 1)
    {
      if ((*(_BYTE *)(a1 + a2[2] + 136) & 0xFE) != 0x18)
      {
        uint64_t result = 0LL;
        unint64_t v7 = a2 + 2;
        goto LABEL_60;
      }

      unint64_t v7 = a2 + 3;
      uint64_t v18 = a3 - (void)(a2 + 3);
      if (v18 >= 1)
      {
        uint64_t result = 0xFFFFFFFFLL;
        while (1)
        {
          int v19 = *(unsigned __int8 *)(a1 + *v7 + 136);
          ++v7;
          if (--v18 <= 0) {
            return result;
          }
        }

        if (v19 != 18) {
          goto LABEL_59;
        }
        ++v7;
LABEL_77:
        uint64_t result = 10LL;
        goto LABEL_60;
      }
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t normal_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v26 = a2;
  unint64_t v4 = a3 - (void)a2;
  unint64_t v7 = a2;
  int v9 = 0;
  uint64_t v25 = a3 - 2;
  while (1)
  {
    uint64_t result = 0LL;
    uint64_t v11 = v7;
    switch(*(_BYTE *)(a1 + *v7 + 136))
    {
      case 5:
        if (v4 < 2) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 392))(a1, v7);
        if (!(_DWORD)result) {
          goto LABEL_104;
        }
        v7 += 2;
        goto LABEL_5;
      case 6:
        if (v4 < 3) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 400))(a1, v7);
        if (!(_DWORD)result) {
          goto LABEL_104;
        }
        v7 += 3;
        goto LABEL_5;
      case 7:
        if (v4 < 4) {
          return 4294967294LL;
        }
        uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 408))(a1, v7);
        if (!(_DWORD)result) {
          goto LABEL_104;
        }
        v7 += 4;
        goto LABEL_5;
      case 8:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xF:
      case 0x10:
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x14:
        goto LABEL_105;
      case 9:
      case 0xA:
      case 0x15:
        uint64_t v12 = a3 - (void)++v7;
        while (1)
        {
          int v13 = *(unsigned __int8 *)(a1 + *v7 + 136);
          ++v7;
          if (--v12 <= 0) {
            return 0xFFFFFFFFLL;
          }
        }

        if (v13 != 14) {
          goto LABEL_103;
        }
        uint64_t v26 = v7;
LABEL_18:
        uint64_t v15 = v7 + 1;
        unsigned int v16 = *(unsigned __int8 *)(a1 + *v15 + 136);
        if ((v16 & 0xFE) != 0xC)
        {
          uint64_t v17 = v25 - (void)v7;
          while (1)
          {
            unint64_t v7 = v15;
            if (v16 > 0x15 || ((1 << v16) & 0x200600) == 0) {
              break;
            }
            if (v17 <= 0) {
              return 0xFFFFFFFFLL;
            }
            ++v15;
            unsigned int v16 = *(unsigned __int8 *)(a1 + v7[1] + 136);
            --v17;
            if ((v16 & 0xFE) == 0xC) {
              goto LABEL_25;
            }
          }

LABEL_103:
          uint64_t result = 0LL;
LABEL_104:
          uint64_t v11 = v7;
LABEL_105:
          *a4 = v11;
          return result;
        }

LABEL_25:
        v7 += 2;
        uint64_t v26 = v7;
        unint64_t v18 = a3 - (void)v7;
        break;
      case 0xE:
        goto LABEL_18;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        ++v7;
        goto LABEL_5;
      case 0x17:
        if (v9) {
          goto LABEL_103;
        }
        uint64_t v11 = v7 + 1;
        uint64_t v26 = v7 + 1;
        unint64_t v19 = a3 - (void)(v7 + 1);
        uint64_t result = 0LL;
        unsigned int v20 = *(unsigned __int8 *)(a1 + *v11 + 136);
        if (v20 <= 6)
        {
          if (v20 == 5)
          {
            if (v19 < 2) {
              return 4294967294LL;
            }
            if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 440))(a1, v7 + 1))
            {
LABEL_122:
              uint64_t result = 0LL;
              goto LABEL_105;
            }

            uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7 + 1);
            if (!(_DWORD)result) {
              goto LABEL_105;
            }
            v7 += 3;
          }

          else
          {
            if (v20 != 6) {
              goto LABEL_105;
            }
            if (v19 < 3) {
              return 4294967294LL;
            }
            uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7 + 1);
            if (!(_DWORD)result) {
              goto LABEL_105;
            }
            v7 += 4;
          }
        }

        else if (v20 == 7)
        {
          if (v19 < 4) {
            return 4294967294LL;
          }
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7 + 1);
          if (!(_DWORD)result) {
            goto LABEL_105;
          }
          v7 += 5;
        }

        else
        {
          if (v20 != 24 && v20 != 22) {
            goto LABEL_105;
          }
          v7 += 2;
        }

        uint64_t v26 = v7;
        int v9 = 1;
        goto LABEL_6;
      default:
        goto LABEL_104;
    }

    LODWORD(v10) = *a2;
LABEL_26:
LABEL_27:
    a2 += 2;
    v8 -= 2LL;
    int v6 = 0xFFFFFFFFLL;
    if (v8 <= 1) {
      return v6;
    }
  }

  if (!a2[1])
  {
    int v6 = 0LL;
    unsigned int v10 = *a2;
    uint64_t v11 = *(unsigned __int8 *)(a1 + v10 + 136);
    switch(*(_BYTE *)(a1 + v10 + 136))
    {
      case 0x12:
        a2 += 2;
        int v6 = 28LL;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_8;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_27;
      case 0x1D:
        goto LABEL_26;
      default:
        if (v11 != 6)
        {
          if (v11 != 7) {
            goto LABEL_8;
          }
          goto LABEL_40;
        }

        break;
    }

    goto LABEL_7;
  }

LABEL_26:
    uint64_t v11 = v7 + 1;
    uint64_t v26 = v7 + 1;
    uint64_t result = 0LL;
    unsigned int v22 = *(unsigned __int8 *)(a1 + *v11 + 136);
    if (v22 > 0xA)
    {
      if (v22 != 21)
      {
        if (v22 == 11)
        {
LABEL_111:
          ++v11;
          uint64_t result = 1LL;
          goto LABEL_105;
        }

        if (v22 != 17) {
          goto LABEL_105;
        }
LABEL_113:
        uint64_t v26 = v11 + 1;
        if (a3 - (uint64_t)(v11 + 1) >= 1)
        {
          int v24 = v11[1];
          if (v24 == 62) {
            v11 += 2;
          }
          else {
            ++v11;
          }
          if (v24 == 62) {
            uint64_t result = 3LL;
          }
          else {
            uint64_t result = 0LL;
          }
          goto LABEL_105;
        }

        return 0xFFFFFFFFLL;
      }
    }

    else if (v22 - 9 >= 2)
    {
      goto LABEL_105;
    }

    uint64_t v11 = v7 + 2;
    uint64_t v23 = a3 - (void)(v7 + 2);
    if (v23 < 1) {
      return 0xFFFFFFFFLL;
    }
    v7 += 6;
    while (2)
    {
      switch(*(_BYTE *)(a1 + *(v7 - 4) + 136))
      {
        case 5:
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 416))(a1, v7 - 4);
          if (!(_DWORD)result) {
            goto LABEL_105;
          }
          int v9 = 0;
          v7 -= 2;
          goto LABEL_5;
        case 6:
          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 424))(a1, v7 - 4);
          if (!(_DWORD)result) {
            goto LABEL_105;
          }
          int v9 = 0;
          --v7;
          goto LABEL_5;
        case 7:
          if ((*(unsigned int (**)(uint64_t, unsigned __int8 *))(a1 + 456))(a1, v7 - 4))
          {
            uint64_t result = 0LL;
            uint64_t v11 = v7 - 4;
            goto LABEL_105;
          }

          uint64_t result = (*(uint64_t (**)(uint64_t, unsigned __int8 *))(a1 + 432))(a1, v7 - 4);
          if (!(_DWORD)result) {
            goto LABEL_105;
          }
          int v9 = 0;
LABEL_5:
          uint64_t v26 = v7;
          break;
        case 9:
        case 0xA:
        case 0x15:
          ++v11;
          --v23;
          ++v7;
          uint64_t result = 0xFFFFFFFFLL;
          if (v23 <= 0) {
            return result;
          }
          continue;
        case 0xB:
          uint64_t v11 = v7 - 4;
          goto LABEL_111;
        case 0x11:
          uint64_t v11 = v7 - 4;
          goto LABEL_113;
        case 0x16:
        case 0x18:
          int v9 = 0;
          v7 -= 3;
          goto LABEL_5;
        default:
          uint64_t result = 0LL;
          uint64_t v11 = v7 - 4;
          goto LABEL_105;
      }

      break;
    }

uint64_t utf8_toUtf8(uint64_t a1, const void **a2, unint64_t a3, void **a4, uint64_t a5)
{
  unint64_t v6 = a3;
  unint64_t v14 = a3;
  BOOL v8 = *a2;
  int64_t v9 = a3 - (void)*a2;
  int64_t v10 = a5 - (void)*a4;
  if (v9 > v10)
  {
    unint64_t v6 = (unint64_t)v8 + v10;
    unint64_t v14 = (unint64_t)v8 + v10;
  }

  _INTERNAL_trim_to_complete_utf8_characters((unint64_t)v8, &v14);
  BOOL v11 = v14 < v6;
  size_t v12 = v14 - (void)*a2;
  memcpy(*a4, *a2, v12);
  *a2 = (char *)*a2 + v12;
  *a4 = (char *)*a4 + v12;
  if (v9 <= v10) {
    return v11;
  }
  else {
    return 2LL;
  }
}

uint64_t utf8_toUtf16(uint64_t a1, unint64_t *a2, unint64_t a3, _WORD **a4, unint64_t a5)
{
  int v5 = *a4;
  unint64_t v6 = (unsigned __int8 *)*a2;
  BOOL v7 = *a2 < a3;
  if (*a2 < a3 && (unint64_t)v5 < a5)
  {
    do
    {
      uint64_t v10 = *v6;
      int v11 = *(unsigned __int8 *)(a1 + v10 + 136);
      switch(v11)
      {
        case 7:
          if ((uint64_t)(a5 - (void)v5) < 4)
          {
            uint64_t result = 2LL;
            goto LABEL_25;
          }

          if ((uint64_t)(a3 - (void)v6) < 4)
          {
LABEL_23:
            uint64_t result = 1LL;
            goto LABEL_25;
          }

          unsigned __int8 v12 = v6[2];
          __int16 v13 = v6[3] & 0x3F;
          _WORD *v5 = (((((v6[1] & 0x3F) << 12) & 0xFFE3F03F | ((*v6 & 7) << 18) | ((v12 & 0x3F) << 6)) + 16711680) >> 10) | 0xD800;
          v5[1] = v13 & 0xF03F | ((v12 & 0x3F) << 6) | 0xDC00;
          v5 += 2;
          v6 += 4;
          break;
        case 6:
          *v5++ = ((_WORD)v10 << 12) | ((v6[1] & 0x3F) << 6) | v6[2] & 0x3F;
          v6 += 3;
          break;
        case 5:
          *v5++ = v6[1] & 0x3F | ((v10 & 0x1F) << 6);
          v6 += 2;
          break;
        default:
          ++v6;
          *v5++ = (char)v10;
          break;
      }

      BOOL v7 = (unint64_t)v6 < a3;
    }

    while ((unint64_t)v6 < a3 && (unint64_t)v5 < a5);
  }

  if (v7) {
    uint64_t result = 2LL;
  }
  else {
    uint64_t result = 0LL;
  }
LABEL_25:
  *a2 = (unint64_t)v6;
  *a4 = v5;
  return result;
}

uint64_t utf8_isName2(uint64_t a1, unsigned __int8 *a2)
{
  return (1 << a2[1]) & namingBitmap[(2 * (*a2 & 3)) | (8 * namePages[((unint64_t)*a2 >> 2) & 7]) | (a2[1] >> 5) & 1];
}

uint64_t utf8_isName3(uint64_t a1, _BYTE *a2)
{
  return (1 << a2[2]) & namingBitmap[(2 * (a2[1] & 3)) | (8
                                                                      * namePages[(16LL * (*a2 & 0xF)) | ((unint64_t)a2[1] >> 2) & 0xF]) | (a2[2] >> 5) & 1];
}

uint64_t isNever()
{
  return 0LL;
}

uint64_t utf8_isNmstrt2(uint64_t a1, unsigned __int8 *a2)
{
  return (1 << a2[1]) & namingBitmap[(2 * (*a2 & 3)) | (8
                                                                    * nmstrtPages[((unint64_t)*a2 >> 2) & 7]) | (a2[1] >> 5) & 1];
}

uint64_t utf8_isNmstrt3(uint64_t a1, _BYTE *a2)
{
  return (1 << a2[2]) & namingBitmap[(2 * (a2[1] & 3)) | (8
                                                                      * nmstrtPages[(16LL * (*a2 & 0xF)) | ((unint64_t)a2[1] >> 2) & 0xF]) | (a2[2] >> 5) & 1];
}

BOOL utf8_isInvalid2(uint64_t a1, unsigned __int8 *a2)
{
  if (*a2 < 0xC2u) {
    return 1LL;
  }
  if ((a2[1] & 0x80u) != 0) {
    return a2[1] > 0xBFu;
  }
  return 1LL;
}

BOOL utf8_isInvalid3(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v3 = a2[2];
  int v4 = *a2;
  if (v4 != 239)
  {
    if (v3 > 0xBF) {
      return 1LL;
    }
    unsigned int v5 = a2[1];
    if (v4 == 224) {
      return (v5 + 64) < 0xE0u;
    }
    goto LABEL_11;
  }

  unsigned int v5 = a2[1];
  if (v5 != 191)
  {
    if (v3 > 0xBF) {
      return 1LL;
    }
LABEL_11:
    if ((v5 & 0x80) != 0) {
      goto LABEL_12;
    }
    return 1LL;
  }

  if (v3 > 0xBD) {
    return 1LL;
  }
  unsigned int v5 = 191;
LABEL_12:
  if (v4 == 237) {
    unsigned int v6 = 159;
  }
  else {
    unsigned int v6 = 191;
  }
  return v5 > v6;
}

uint64_t utf8_isInvalid4(uint64_t a1, unsigned __int8 *a2)
{
  int v3 = *a2;
  unsigned int v4 = a2[1];
  if (v3 == 240) {
    return (v4 + 64) < 0xD0u;
  }
  if (v3 == 244) {
    unsigned int v5 = 143;
  }
  else {
    unsigned int v5 = 191;
  }
  BOOL v6 = v4 > v5;
  return (v4 & 0x80) == 0 || v6;
}

uint64_t little2_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t *a4)
{
  char v4 = a3 - (_BYTE)a2;
  unint64_t v5 = (a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v5) {
    BOOL v6 = ((a3 - (void)a2) & 1) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    a3 = (unint64_t)&a2[v5];
  }
  if ((v4 & 1) != 0 && !v5) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = a2[1];
  if (v9 > 0xDB)
  {
    if (v9 - 220 < 4 || v9 == 255 && *a2 > 0xFDu)
    {
LABEL_17:
      uint64_t v7 = 0LL;
      *a4 = (uint64_t)a2;
      return v7;
    }
  }

  else
  {
    if (v9 - 216 < 4)
    {
LABEL_14:
      uint64_t v10 = a2 + 4;
      goto LABEL_29;
    }

    if (!a2[1])
    {
      switch(*(_BYTE *)(a1 + *a2 + 136))
      {
        case 0:
        case 1:
        case 8:
          goto LABEL_17;
        case 2:
          int v11 = a2 + 2;
          uint64_t v12 = a3 - (void)(a2 + 2);
          if (v12 < 2) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v13 = a2[3];
          if (a2[3] > 0xDBu)
          {
            if ((_DWORD)v13 == 255)
            {
              LODWORD(v19) = *v11;
              goto LABEL_88;
            }
          }

          else
          {
            if ((v13 - 216) < 4)
            {
LABEL_24:
LABEL_78:
              uint64_t v7 = 0LL;
              goto LABEL_79;
            }

            if (!a2[3])
            {
              uint64_t v19 = *v11;
              switch(*(_BYTE *)(a1 + v19 + 136))
              {
                case 5:
                case 8:
                case 9:
                case 0xA:
                case 0xB:
                case 0xC:
                case 0xD:
                case 0xE:
                case 0x12:
                case 0x13:
                case 0x14:
                case 0x15:
                case 0x17:
                  goto LABEL_78;
                case 6:
                  return 4294967294LL;
                case 7:
                  goto LABEL_24;
                case 0xF:
                  return little2_scanPi(a1, (char *)a2 + 4, a3, a4);
                case 0x10:
                  int v11 = a2 + 4;
                  if (a2[5]) {
                    goto LABEL_78;
                  }
                  int v31 = *(unsigned __int8 *)(a1 + *v11 + 136);
                  if (v31 != 20)
                  {
                    if (v31 != 27) {
                      goto LABEL_78;
                    }
                    return little2_scanComment(a1, a2 + 6, a3, a4);
                  }

                  int v11 = a2 + 6;
                  uint64_t v38 = 0LL;
                  while (!v11[1] && *v11 == big2_scanCdataSection_CDATA_LSQB[v38])
                  {
                    ++v38;
                    v11 += 2;
                    if (v38 == 6)
                    {
                      uint64_t v7 = 8LL;
                      int v11 = a2 + 18;
                      goto LABEL_79;
                    }
                  }

                  goto LABEL_78;
                case 0x11:
                  int v11 = a2 + 4;
                  uint64_t v32 = a3 - (void)(a2 + 4);
                  if (v32 < 2) {
                    return 0xFFFFFFFFLL;
                  }
                  uint64_t v33 = a2[5];
                  if (a2[5] > 0xDBu)
                  {
                    if ((_DWORD)v33 == 255)
                    {
                      LODWORD(v34) = *v11;
                      goto LABEL_181;
                    }
                  }

                  else
                  {
                    if (!a2[5])
                    {
                      uint64_t v7 = 0LL;
                      uint64_t v34 = *v11;
                      unsigned int v37 = *(unsigned __int8 *)(a1 + v34 + 136);
                      if (v37 <= 0x15)
                      {
                        if (v37 == 6)
                        {
LABEL_203:
                          goto LABEL_78;
                        }

                        if (v37 != 7) {
                          goto LABEL_79;
                        }
LABEL_138:
                        goto LABEL_78;
                      }

                      if (v37 == 22 || v37 == 24) {
                        goto LABEL_182;
                      }
                      if (v37 != 29) {
                        goto LABEL_79;
                      }
LABEL_181:
LABEL_182:
                      int v11 = a2 + 6;
                      for (uint64_t i = a3 - (void)a2 - 8; ; i -= 2LL)
                      {
                        uint64_t v40 = v11[1];
                        if (v11[1] > 0xDBu) {
                          break;
                        }
                        if (v11[1])
                        {
                          if ((v40 - 216) < 4)
                          {
LABEL_209:
                            goto LABEL_78;
                          }

LABEL_195:
                          LODWORD(v41) = *v11;
                          goto LABEL_196;
                        }

                        uint64_t v41 = *v11;
                        int v42 = *(unsigned __int8 *)(a1 + v41 + 136);
                        if ((v42 - 22) >= 6)
                        {
                          if (v42 != 29)
                          {
                            uint64_t v7 = 0LL;
                            switch(*(_BYTE *)(a1 + v41 + 136))
                            {
                              case 6:
                                return 4294967294LL;
                              case 7:
                                goto LABEL_209;
                              case 8:
                                goto LABEL_79;
                              case 9:
                              case 0xA:
                                goto LABEL_215;
                              case 0xB:
                                goto LABEL_226;
                              default:
                                if (v42 != 21) {
                                  goto LABEL_79;
                                }
LABEL_215:
                                if (i < 2) {
                                  return 0xFFFFFFFFLL;
                                }
                                v11 += 2;
                                break;
                            }

                            while (1)
                            {
                              if (v11[1]) {
                                goto LABEL_78;
                              }
                              int v44 = *(unsigned __int8 *)(a1 + *v11 + 136);
                              v11 += 2;
                              i -= 2LL;
                              uint64_t v7 = 0xFFFFFFFFLL;
                              if (i <= 1) {
                                return v7;
                              }
                            }

                            if (v44 == 11)
                            {
LABEL_226:
                              v11 += 2;
                              uint64_t v7 = 5LL;
                              goto LABEL_79;
                            }

                            goto LABEL_78;
                          }

                          goto LABEL_196;
                        }

LABEL_197:
                        v11 += 2;
                        uint64_t v7 = 0xFFFFFFFFLL;
                        if (i <= 1) {
                          return v7;
                        }
                      }

                      if ((_DWORD)v40 != 255)
                      {
                        goto LABEL_195;
                      }

                      LODWORD(v41) = *v11;
LABEL_196:
                      goto LABEL_197;
                    }
                  }

                  LODWORD(v34) = *v11;
                  goto LABEL_181;
                case 0x16:
                case 0x18:
                  goto LABEL_89;
                default:
                  if (*(_BYTE *)(a1 + v19 + 136) != 29) {
                    goto LABEL_78;
                  }
                  goto LABEL_88;
              }
            }
          }

          LODWORD(v19) = *v11;
LABEL_88:
LABEL_89:
          int v11 = a2 + 4;
          uint64_t v20 = a3 - (void)(a2 + 4);
          if (v20 < 2) {
            return 0xFFFFFFFFLL;
          }
          int v21 = 0;
          while (1)
          {
            uint64_t v22 = v11[1];
            if (v11[1] > 0xDBu)
            {
              if ((_DWORD)v22 == 255)
              {
                LODWORD(v23) = *v11;
                goto LABEL_112;
              }
            }

            else
            {
              if (!v11[1])
              {
                uint64_t v23 = *v11;
                uint64_t v24 = 2LL;
                switch(*(_BYTE *)(a1 + v23 + 136))
                {
                  case 6:
                    return 4294967294LL;
                  case 7:
                    goto LABEL_125;
                  case 9:
                  case 0xA:
                  case 0x15:
                    v11 += 2;
                    uint64_t v32 = a3 - (void)v11;
                    while (2)
                    {
                      uint64_t v35 = v11[1];
                      if (!v11[1])
                      {
                        uint64_t v36 = *v11;
                        switch(*(_BYTE *)(a1 + v36 + 136))
                        {
                          case 6:
                            goto LABEL_203;
                          case 7:
                            goto LABEL_138;
                          case 9:
                          case 0xA:
                          case 0x15:
                            v11 += 2;
                            v32 -= 2LL;
                            uint64_t v7 = 0xFFFFFFFFLL;
                            if (v32 <= 1) {
                              return v7;
                            }
                            continue;
                          case 0xB:
                            goto LABEL_171;
                          case 0x11:
                            goto LABEL_172;
                          case 0x16:
                          case 0x18:
                            return little2_scanAtts(a1, v11 + 2, a3, (unsigned __int8 **)a4);
                          case 0x1D:
                            uint64_t v35 = 0LL;
                            goto LABEL_212;
                          default:
                            goto LABEL_78;
                        }
                      }

                      break;
                    }

                    if ((_DWORD)v35 == 255)
                    {
                      LODWORD(v36) = *v11;
                      uint64_t v35 = 0xFFu;
                    }

                    else
                    {
                      LODWORD(v36) = *v11;
                    }

LABEL_212:
                    return little2_scanAtts(a1, v11 + 2, a3, (unsigned __int8 **)a4);
                  case 0xB:
LABEL_171:
                    *a4 = (uint64_t)(v11 + 2);
                    return 2LL;
                  case 0x11:
LABEL_172:
                    uint64_t v17 = v11 + 2;
                    if (v11[3] || *v17 != 62) {
                      goto LABEL_63;
                    }
                    *a4 = (uint64_t)(v11 + 4);
                    return 4LL;
                  case 0x16:
                  case 0x18:
                  case 0x19:
                  case 0x1A:
                  case 0x1B:
                    goto LABEL_114;
                  case 0x17:
                    if (v21) {
                      goto LABEL_78;
                    }
                    uint64_t v25 = v11 + 2;
                    uint64_t v26 = a3 - (void)(v11 + 2);
                    if (v26 < 2) {
                      return 0xFFFFFFFFLL;
                    }
                    uint64_t v27 = v11[3];
                    if (v11[3] > 0xDBu)
                    {
                      if ((_DWORD)v27 == 255)
                      {
                        LODWORD(v28) = *v25;
                        goto LABEL_123;
                      }
                    }

                    else
                    {
                      if (!v11[3])
                      {
                        uint64_t v28 = *v25;
                        unsigned int v29 = *(unsigned __int8 *)(a1 + v28 + 136);
                        if (v29 <= 0x15)
                        {
                          if (v29 != 5)
                          {
                            if (v29 == 6)
                            {
                            }

                            else if (v29 == 7)
                            {
LABEL_147:
                            }
                          }

LABEL_179:
                          uint64_t v7 = 0LL;
                          *a4 = (uint64_t)v25;
                          return v7;
                        }

                        if (v29 == 22 || v29 == 24) {
                          goto LABEL_124;
                        }
                        if (v29 != 29) {
                          goto LABEL_179;
                        }
LABEL_123:
LABEL_124:
                        int v21 = 1;
                        uint64_t v24 = 4LL;
                        goto LABEL_114;
                      }
                    }

                    LODWORD(v28) = *v25;
                    goto LABEL_123;
                  case 0x1D:
                    goto LABEL_112;
                  default:
                    goto LABEL_78;
                }
              }

              if ((v22 - 216) < 4)
              {
LABEL_125:
                return 4294967294LL;
              }
            }

            LODWORD(v23) = *v11;
LABEL_112:
            uint64_t v24 = 2LL;
LABEL_114:
            v11 += v24;
            uint64_t v20 = a3 - (void)v11;
            uint64_t v7 = 0xFFFFFFFFLL;
          }

        case 3:
          return little2_scanRef(a1, a2 + 2, a3, a4);
        case 4:
          uint64_t v10 = a2 + 2;
          if (a2[3] || *v10 != 93) {
            goto LABEL_29;
          }
          uint64_t v17 = a2 + 4;
          if (!a2[5] && *v17 == 62)
          {
LABEL_63:
            uint64_t v7 = 0LL;
            *a4 = (uint64_t)v17;
            return v7;
          }

          goto LABEL_29;
        case 5:
          return 4294967294LL;
        case 6:
          uint64_t v10 = a2 + 3;
          goto LABEL_29;
        case 7:
          goto LABEL_14;
        case 9:
          unint64_t v18 = a2 + 2;
          if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10) {
            unint64_t v18 = a2 + 4;
          }
LABEL_74:
          *a4 = (uint64_t)v18;
          return 7LL;
        case 0xA:
          unint64_t v18 = a2 + 2;
          goto LABEL_74;
        default:
          break;
      }
    }
  }

  uint64_t v10 = a2 + 2;
LABEL_29:
  unint64_t v14 = a3 - (void)v10;
  if ((uint64_t)(a3 - (void)v10) < 2)
  {
    unsigned int v16 = v10;
LABEL_53:
    *a4 = (uint64_t)v16;
    return 6LL;
  }

  while (1)
  {
    unsigned int v15 = v10[1];
    if (v15 > 0xDB)
    {
      if (v15 == 255)
      {
        if (*v10 > 0xFDu) {
          goto LABEL_54;
        }
      }

      else if (v15 - 220 < 4)
      {
LABEL_54:
        *a4 = (uint64_t)v10;
        return 6LL;
      }

      goto LABEL_47;
    }

    if (v15 - 216 >= 4) {
      break;
    }
LABEL_32:
    if (v14 <= 3) {
      goto LABEL_54;
    }
    unsigned int v16 = v10 + 4;
LABEL_48:
    unint64_t v14 = a3 - (void)v16;
    uint64_t v10 = v16;
  }

  if (v10[1])
  {
LABEL_47:
    unsigned int v16 = v10 + 2;
    goto LABEL_48;
  }

  switch(*(_BYTE *)(a1 + *v10 + 136))
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 8:
    case 9:
    case 0xA:
      goto LABEL_54;
    case 4:
      if (v14 < 4) {
        goto LABEL_54;
      }
      unsigned int v16 = v10 + 2;
      if (v10[3] || *v16 != 93) {
        goto LABEL_48;
      }
      if (v14 < 6) {
        goto LABEL_54;
      }
      if (v10[5] || v10[4] != 62) {
        goto LABEL_48;
      }
      uint64_t v7 = 0LL;
      int v11 = v10 + 4;
      break;
    case 6:
      if (v14 <= 2) {
        goto LABEL_54;
      }
      unsigned int v16 = v10 + 3;
      goto LABEL_48;
    case 7:
      goto LABEL_32;
    default:
      goto LABEL_47;
  }

LABEL_79:
  *a4 = (uint64_t)v11;
  return v7;
}

                  *a4 = v25;
                  return v26;
                }

          a2 += 4;
          uint64_t v32 = a2;
          uint64_t v7 = 1;
          goto LABEL_24;
        }
      }

      LODWORD(v18) = *v15;
      goto LABEL_78;
    case 0x1D:
      goto LABEL_22;
    default:
      goto LABEL_107;
  }

                  *a4 = v25;
                  return v27;
                }

uint64_t little2_cdataSectionTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = (a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v4) {
    BOOL v5 = ((a3 - (void)a2) & 1) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = &a2[v4];
  if (v5) {
    BOOL v6 = (unsigned __int8 *)a3;
  }
  if ((((_BYTE)a3 - (_BYTE)a2) & 1) == 0 || v4)
  {
    unsigned int v8 = a2[1];
    if (v8 > 0xDB)
    {
      if (v8 - 220 < 4 || v8 == 255 && *a2 > 0xFDu)
      {
        uint64_t v7 = 0LL;
        goto LABEL_51;
      }
    }

    else
    {
      if (v8 - 216 < 4)
      {
LABEL_13:
        if (v6 - a2 < 4) {
          return 4294967294LL;
        }
        unsigned int v9 = a2 + 4;
        goto LABEL_30;
      }

      if (!a2[1])
      {
        uint64_t v7 = 0LL;
        switch(*(_BYTE *)(a1 + *a2 + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_51;
          case 4:
            unsigned int v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (a2[3] || *v9 != 93) {
              goto LABEL_30;
            }
            if (v6 - (a2 + 4) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (a2[5] || a2[4] != 62) {
              goto LABEL_30;
            }
            a2 += 6;
            uint64_t v7 = 40LL;
            goto LABEL_51;
          case 5:
            if (v6 - a2 >= 2) {
              goto LABEL_29;
            }
            return 4294967294LL;
          case 6:
            if (v6 - a2 < 3) {
              return 4294967294LL;
            }
            unsigned int v9 = a2 + 3;
            goto LABEL_30;
          case 7:
            goto LABEL_13;
          case 9:
            unsigned int v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (a2[3])
            {
              uint64_t v7 = 7LL;
              goto LABEL_50;
            }

            if (*(_BYTE *)(a1 + a2[2] + 136) == 10) {
              a2 += 4;
            }
            else {
              a2 += 2;
            }
LABEL_61:
            uint64_t v7 = 7LL;
            break;
          case 0xA:
            a2 += 2;
            goto LABEL_61;
          default:
            goto LABEL_29;
        }

        goto LABEL_51;
      }
    }

LABEL_29:
    unsigned int v9 = a2 + 2;
LABEL_30:
    unint64_t v10 = v6 - v9;
    if (v6 - v9 >= 2)
    {
      while (1)
      {
        unsigned int v11 = v9[1];
        if (v11 > 0xDB) {
          break;
        }
        if (v11 - 216 < 4) {
          goto LABEL_33;
        }
        uint64_t v12 = 2LL;
        if (!v9[1])
        {
          unsigned int v13 = *(unsigned __int8 *)(a1 + *v9 + 136);
          if (v13 <= 0xA)
          {
            if (v13 == 6)
            {
              if (v10 < 3) {
                goto LABEL_49;
              }
              uint64_t v12 = 3LL;
              goto LABEL_48;
            }

            if (v13 != 7)
            {
              uint64_t v12 = 2LL;
              if (((1 << v13) & 0x713) != 0) {
                goto LABEL_49;
              }
              goto LABEL_48;
            }

    unsigned int v9 = a2 + 2;
LABEL_30:
    unint64_t v10 = v6 - v9;
    if (v6 - v9 >= 2)
    {
      while (1)
      {
        unsigned int v11 = *v9;
        if (v11 > 0xDB) {
          break;
        }
        if (v11 - 216 < 4) {
          goto LABEL_33;
        }
        uint64_t v12 = 2LL;
        if (!*v9)
        {
          unsigned int v13 = *(unsigned __int8 *)(a1 + v9[1] + 136);
          if (v13 <= 0xA)
          {
            if (v13 == 6)
            {
              if (v10 < 3) {
                goto LABEL_49;
              }
              uint64_t v12 = 3LL;
              goto LABEL_48;
            }

            if (v13 != 7)
            {
              uint64_t v12 = 2LL;
              if (((1 << v13) & 0x713) != 0) {
                goto LABEL_49;
              }
              goto LABEL_48;
            }

LABEL_48:
        v9 += v12;
        unint64_t v10 = v6 - v9;
        if (v6 - v9 <= 1) {
          goto LABEL_49;
        }
      }

      if (v11 != 255)
      {
        uint64_t v12 = 2LL;
        if (v11 - 220 < 4) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }

      if (*v9 > 0xFDu) {
        goto LABEL_49;
      }
LABEL_37:
      uint64_t v12 = 2LL;
      goto LABEL_48;
    }

        v9 += v12;
        unint64_t v10 = v6 - v9;
        if (v6 - v9 <= 1) {
          goto LABEL_49;
        }
      }

      if (v11 != 255)
      {
        uint64_t v12 = 2LL;
        if (v11 - 220 < 4) {
          goto LABEL_49;
        }
        goto LABEL_48;
      }

      if (v9[1] > 0xFDu) {
        goto LABEL_49;
      }
LABEL_37:
      uint64_t v12 = 2LL;
      goto LABEL_48;
    }

uint64_t little2_ignoreSectionTok(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, unsigned __int8 **a4)
{
  unint64_t v4 = &a2[(a3 - a2) & 0xFFFFFFFFFFFFFFFELL];
  if (((a3 - a2) & 1) == 0) {
    unint64_t v4 = a3;
  }
  unint64_t v5 = v4 - a2;
  if (v4 - a2 < 2) {
    return 0xFFFFFFFFLL;
  }
  int v6 = 0;
  while (1)
  {
    unsigned int v7 = a2[1];
    if (v7 > 0xDB)
    {
      if (v7 == 255)
      {
        if (*a2 > 0xFDu) {
          goto LABEL_37;
        }
      }

      else if (v7 - 220 < 4)
      {
LABEL_37:
        uint64_t v9 = 0LL;
        goto LABEL_38;
      }

      goto LABEL_22;
    }

    if (v7 - 216 >= 4) {
      break;
    }
LABEL_7:
    if (v5 < 4) {
      return 4294967294LL;
    }
    unsigned int v8 = a2 + 4;
LABEL_23:
    unint64_t v5 = v4 - v8;
    a2 = v8;
    if (v4 - v8 <= 1) {
      return 0xFFFFFFFFLL;
    }
  }

  if (a2[1])
  {
LABEL_22:
    unsigned int v8 = a2 + 2;
    goto LABEL_23;
  }

  uint64_t v9 = 0LL;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_38;
    case 2:
      unsigned int v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (a2[3] || *v8 != 33) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (!a2[5] && *v8 == 91)
      {
        ++v6;
        unsigned int v8 = a2 + 6;
      }

      goto LABEL_23;
    case 4:
      unsigned int v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (a2[3] || *v8 != 93) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (a2[5] || *v8 != 62) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 6;
      if (v6)
      {
        --v6;
        goto LABEL_23;
      }

      uint64_t v9 = 42LL;
      a2 += 6;
LABEL_38:
      *a4 = a2;
      return v9;
    case 6:
      if (v5 < 3) {
        return 4294967294LL;
      }
      unsigned int v8 = a2 + 3;
      goto LABEL_23;
    case 7:
      goto LABEL_7;
    default:
      goto LABEL_22;
  }

uint64_t little2_attributeValueTok( uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (v4[1] - 216 < 4)
  {
LABEL_5:
    uint64_t v5 = 4LL;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (void)v4) <= 1)
    {
LABEL_27:
      *a4 = v4;
      return 6LL;
    }
  }

  if (v4[1])
  {
    uint64_t v5 = 2LL;
    goto LABEL_6;
  }

  uint64_t v5 = 2LL;
  switch(*(_BYTE *)(a1 + *v4 + 136))
  {
    case 2:
      uint64_t result = 0LL;
      *a4 = v4;
      return result;
    case 3:
      if (v4 != a2) {
        goto LABEL_27;
      }
      return little2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      uint64_t v5 = 3LL;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2) {
        goto LABEL_27;
      }
      unsigned int v7 = a2 + 2;
      if ((uint64_t)(a3 - (void)(a2 + 2)) < 2)
      {
        uint64_t result = 4294967293LL;
      }

      else
      {
        if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10) {
          unsigned int v7 = a2 + 4;
        }
LABEL_29:
        *a4 = v7;
        uint64_t result = 7LL;
      }

      break;
    case 0xA:
      if (v4 != a2) {
        goto LABEL_27;
      }
      unsigned int v7 = a2 + 2;
      goto LABEL_29;
    default:
      if (*(_BYTE *)(a1 + *v4 + 136) != 21) {
        goto LABEL_6;
      }
      if (v4 != a2) {
        goto LABEL_27;
      }
      *a4 = a2 + 2;
      uint64_t result = 39LL;
      break;
  }

  return result;
}

uint64_t little2_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (v4[1] - 216 < 4)
  {
LABEL_5:
    uint64_t v5 = 4LL;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (void)v4) <= 1)
    {
LABEL_28:
      *a4 = v4;
      return 6LL;
    }
  }

  if (v4[1])
  {
    uint64_t v5 = 2LL;
    goto LABEL_6;
  }

  uint64_t v5 = 2LL;
  switch(*(_BYTE *)(a1 + *v4 + 136))
  {
    case 3:
      if (v4 != a2) {
        goto LABEL_28;
      }
      return little2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      uint64_t v5 = 3LL;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2) {
        goto LABEL_28;
      }
      unsigned int v7 = a2 + 2;
      if ((uint64_t)(a3 - (void)(a2 + 2)) < 2)
      {
        uint64_t result = 4294967293LL;
      }

      else
      {
        if (!a2[3] && *(_BYTE *)(a1 + a2[2] + 136) == 10) {
          unsigned int v7 = a2 + 4;
        }
LABEL_31:
        *a4 = v7;
        uint64_t result = 7LL;
      }

      break;
    case 0xA:
      if (v4 != a2) {
        goto LABEL_28;
      }
      unsigned int v7 = a2 + 2;
      goto LABEL_31;
    default:
      if (*(_BYTE *)(a1 + *v4 + 136) != 30) {
        goto LABEL_6;
      }
      if (v4 != a2) {
        goto LABEL_28;
      }
      LODWORD(result) = little2_scanPercent(a1, a2 + 2, a3, a4);
      if ((_DWORD)result == 22) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = result;
      }
      break;
  }

  return result;
}

BOOL little2_nameMatchesAscii(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, _BYTE *a4)
{
  int v4 = *a4;
  if (!*a4) {
    return a2 == a3;
  }
  uint64_t v5 = a4 + 1;
  uint64_t v6 = a3 - a2;
  while (1)
  {
    BOOL v7 = v6 < 2;
    v6 -= 2LL;
    if (v7 || a2[1] || *a2 != v4) {
      break;
    }
    a2 += 2;
    int v8 = *v5++;
    int v4 = v8;
    if (!v8) {
      return a2 == a3;
    }
  }

  return 0LL;
}

uint64_t little2_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  for (uint64_t i = a2; ; i += v4)
  {
    unsigned int v3 = i[1];
    if (v3 > 0xDB)
    {
      if (v3 == 255)
      {
        if (*i > 0xFDu) {
          return ((_DWORD)i - (_DWORD)a2);
        }
        uint64_t v4 = 2LL;
      }

      else
      {
        uint64_t v4 = 2LL;
        if (v3 - 220 < 4) {
          return ((_DWORD)i - (_DWORD)a2);
        }
      }

      continue;
    }

    if (v3 - 216 < 4)
    {
      uint64_t v4 = 4LL;
      continue;
    }

    uint64_t v4 = 2LL;
    if (!i[1]) {
      break;
    }
LABEL_5:
    ;
  }

  unsigned int v5 = *(unsigned __int8 *)(a1 + *i + 136) - 5;
  if (v5 < 0x19 && ((0x17E0007u >> v5) & 1) != 0)
  {
    uint64_t v4 = qword_185011048[(char)v5];
    goto LABEL_5;
  }

  return ((_DWORD)i - (_DWORD)a2);
}

unsigned __int8 *little2_skipS(uint64_t a1, unsigned __int8 *a2)
{
  if (!a2[1])
  {
    while (1)
    {
      unsigned int v3 = *(unsigned __int8 *)(a1 + *a2 + 136);
      BOOL v4 = v3 > 0x15;
      int v5 = (1 << v3) & 0x200600;
      if (v4 || v5 == 0) {
        break;
      }
      int v2 = a2 + 2;
      int v7 = a2[3];
      a2 += 2;
      if (v7) {
        return v2;
      }
    }
  }

  return a2;
}

uint64_t little2_getAtts(uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4)
{
  uint64_t result = 0LL;
  int v6 = 0;
  uint64_t v7 = 1LL;
  while (1)
  {
    while (1)
    {
      uint64_t v8 = v7;
      unint64_t v10 = a2 + 3;
      unsigned int v9 = a2[3];
      unsigned int v11 = a2 + 2;
      if (v9 > 0xDB) {
        break;
      }
      uint64_t v12 = a2;
      if (v9 - 216 >= 4)
      {
        if (a2[3]) {
          goto LABEL_16;
        }
        uint64_t v14 = *v11;
        a2 += 2;
        switch(*(_BYTE *)(a1 + v14 + 136))
        {
          case 3:
            a2 = v11;
            if ((int)result < a3)
            {
              *(_BYTE *)(a4 + 32LL * (int)result + 24) = 0;
              a2 = v11;
            }

            continue;
          case 5:
          case 0x16:
          case 0x18:
          case 0x1D:
            goto LABEL_16;
          case 6:
            a2 = v10;
            if (!(_DWORD)v7)
            {
              uint64_t v7 = 1LL;
              a2 = v10;
              if ((int)result < a3)
              {
                uint64_t v17 = a4 + 32LL * (int)result;
                *(void *)uint64_t v17 = v11;
                *(_BYTE *)(v17 + 24) = 1;
                a2 = v10;
              }
            }

            continue;
          case 7:
            goto LABEL_4;
          case 9:
          case 0xA:
            uint64_t v7 = 0LL;
            a2 = v11;
            if ((_DWORD)v8 == 1) {
              continue;
            }
            a2 = v11;
            uint64_t v7 = v8;
            if ((_DWORD)v8 != 2) {
              continue;
            }
            a2 = v11;
            *(_BYTE *)(a4 + 32LL * (int)result + 24) = 0;
            goto LABEL_66;
          case 0xB:
          case 0x11:
            uint64_t v7 = 2LL;
            a2 = v11;
            if ((_DWORD)v8 == 2) {
              continue;
            }
            return result;
          case 0xC:
            if ((_DWORD)v7 == 2)
            {
              uint64_t v7 = 2LL;
              a2 = v11;
              if (v6 == 12)
              {
                uint64_t v7 = 0LL;
                uint64_t result = (result + 1);
                int v6 = 12;
                a2 = v11;
              }

              continue;
            }

            int v6 = 12;
            uint64_t v7 = 2LL;
            a2 = v11;
            *(void *)(a4 + 32LL * (int)result + 8) = v12 + 4;
            int v6 = 12;
            goto LABEL_66;
          case 0xD:
            if ((_DWORD)v7 == 2)
            {
              uint64_t v7 = 2LL;
              a2 = v11;
              if (v6 == 13)
              {
                uint64_t v7 = 0LL;
                uint64_t result = (result + 1);
                int v6 = 13;
                a2 = v11;
              }

              continue;
            }

            int v6 = 13;
            uint64_t v7 = 2LL;
            a2 = v11;
            *(void *)(a4 + 32LL * (int)result + 8) = v12 + 4;
            int v6 = 13;
            goto LABEL_66;
          case 0x15:
            uint64_t v7 = 0LL;
            a2 = v11;
            if ((_DWORD)v8 == 1) {
              continue;
            }
            a2 = v11;
            uint64_t v7 = v8;
            if ((_DWORD)v8 != 2) {
              continue;
            }
            a2 = v11;
            uint64_t v18 = a4 + 32LL * (int)result;
            int v20 = *(unsigned __int8 *)(v18 + 24);
            uint64_t v19 = (_BYTE *)(v18 + 24);
            uint64_t v7 = 2LL;
            a2 = v11;
            if (!v20) {
              continue;
            }
            unsigned int v21 = v12[5];
            if (v21 > 0xDB)
            {
              if (v21 - 220 < 4)
              {
                int v22 = 8;
                goto LABEL_64;
              }

              if (v21 == 255 && v12[4] > 0xFDu)
              {
                int v22 = 0;
                goto LABEL_64;
              }

LABEL_63:
              int v22 = 29;
              goto LABEL_64;
            }

            if (v21 - 216 < 4)
            {
              int v22 = 7;
              goto LABEL_64;
            }

            if (v12[5]) {
              goto LABEL_63;
            }
            uint64_t v23 = v12[4];
            if (v23 == 32) {
              goto LABEL_65;
            }
            int v22 = *(unsigned __int8 *)(a1 + v23 + 136);
LABEL_64:
            uint64_t v7 = 2LL;
            a2 = v11;
            if (v22 != v6) {
              continue;
            }
LABEL_65:
            _BYTE *v19 = 0;
LABEL_66:
            uint64_t v7 = 2LL;
            a2 = v11;
            break;
          default:
            continue;
        }
      }

      else
      {
LABEL_4:
        if (!(_DWORD)v7)
        {
          uint64_t v8 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v16 = a4 + 32LL * (int)result;
            *(void *)uint64_t v16 = v11;
            *(_BYTE *)(v16 + 24) = 1;
          }
        }

        a2 = v12 + 4;
        uint64_t v7 = v8;
      }
    }

    a2 += 2;
    if (v9 - 220 >= 4)
    {
      if (v9 == 255)
      {
        BOOL v13 = *v11 <= 0xFDu && (_DWORD)v7 == 0;
        a2 = v11;
        if (v13) {
          goto LABEL_17;
        }
      }

      else
      {
LABEL_16:
        a2 = v11;
        if (!(_DWORD)v7)
        {
LABEL_17:
          uint64_t v7 = 1LL;
          a2 = v11;
          if ((int)result < a3)
          {
            uint64_t v15 = a4 + 32LL * (int)result;
            *(void *)uint64_t v15 = v11;
            *(_BYTE *)(v15 + 24) = 1;
            a2 = v11;
          }
        }
      }
    }
  }

            LODWORD(v23) = v16[3];
            goto LABEL_64;
          }

          if (*v20)
          {
            goto LABEL_63;
          }

          uint64_t v23 = v16[3];
          uint64_t v24 = *(unsigned __int8 *)(a1 + v23 + 136);
          uint64_t result = 19LL;
          if (v24 > 0x17)
          {
            if (v24 - 24 >= 4)
            {
              if (v24 != 29) {
                break;
              }
LABEL_64:
            }

              int v22 = 29;
              goto LABEL_64;
            }

            if (v21 - 216 < 4)
            {
              int v22 = 7;
              goto LABEL_64;
            }

            if (v9[4]) {
              goto LABEL_63;
            }
            uint64_t v23 = v9[5];
            if (v23 == 32) {
              goto LABEL_65;
            }
            int v22 = *(unsigned __int8 *)(a1 + v23 + 136);
LABEL_64:
            uint64_t v7 = 2LL;
            a2 = v10;
            if (v22 != v6) {
              continue;
            }
LABEL_65:
            _BYTE *v19 = 0;
LABEL_66:
            uint64_t v7 = 2LL;
            a2 = v10;
            break;
          default:
            continue;
        }
      }

      else
      {
LABEL_4:
        if (!(_DWORD)v7)
        {
          uint64_t v8 = 1LL;
          if ((int)result < a3)
          {
            uint64_t v16 = a4 + 32LL * (int)result;
            *(void *)uint64_t v16 = v10;
            *(_BYTE *)(v16 + 24) = 1;
          }
        }

        a2 = v9 + 4;
        uint64_t v7 = v8;
      }
    }

    a2 += 2;
    if (v11 - 220 >= 4)
    {
      if (v11 == 255)
      {
        uint64_t v12 = v9[3] <= 0xFDu && (_DWORD)v7 == 0;
        a2 = v10;
        if (v12) {
          goto LABEL_17;
        }
      }

      else
      {
LABEL_16:
        a2 = v10;
        if (!(_DWORD)v7)
        {
LABEL_17:
          uint64_t v7 = 1LL;
          a2 = v10;
          if ((int)result < a3)
          {
            uint64_t v15 = a4 + 32LL * (int)result;
            *(void *)uint64_t v15 = v10;
            *(_BYTE *)(v15 + 24) = 1;
            a2 = v10;
          }
        }
      }
    }
  }

uint64_t little2_charRefNumber(uint64_t a1, _BYTE *a2)
{
  if (!a2[5] && a2[4] == 120)
  {
    uint64_t v2 = 0LL;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      if (!*i)
      {
        int v4 = (char)*(i - 1);
        if (v4 == 59) {
          return checkCharRefNumber(v2);
        }
        int v5 = v4 - 48;
        if ((v4 - 48) <= 0x36)
        {
          if (((1LL << v5) & 0x3FF) != 0)
          {
            uint64_t v2 = v5 | (16 * v2);
          }

          else if (((1LL << v5) & 0x7E0000) != 0)
          {
            uint64_t v2 = (v4 + 16 * v2 - 55);
          }

          else
          {
            if (((1LL << v5) & 0x7E000000000000LL) == 0) {
              continue;
            }
            uint64_t v2 = (v4 + 16 * v2 - 87);
          }
        }
      }
    }
  }

  uint64_t v2 = 0LL;
  for (uint64_t j = a2 + 5; *j; j += 2)
  {
    int v7 = -1;
LABEL_19:
    uint64_t v2 = (v7 + 10 * v2 - 48);
  }

  int v7 = (char)*(j - 1);
  if (v7 != 59) {
    goto LABEL_19;
  }
  return checkCharRefNumber(v2);
}

uint64_t little2_predefinedEntityName(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3 = (a3 - (uint64_t)a2) / 2;
  if (v3 == 4)
  {
    if (!a2[1])
    {
      int v7 = (char)*a2;
      if (v7 == 97)
      {
        if (!a2[3] && a2[2] == 112 && !a2[5] && a2[4] == 111 && !a2[7] && a2[6] == 115) {
          return 39LL;
        }
      }

      else if (v7 == 113 && !a2[3] && a2[2] == 117 && !a2[5] && a2[4] == 111 && !a2[7] && a2[6] == 116)
      {
        return 34LL;
      }
    }

    return 0LL;
  }

  if (v3 == 3)
  {
    if (!a2[1] && *a2 == 97 && !a2[3] && a2[2] == 109 && !a2[5] && a2[4] == 112) {
      return 38LL;
    }
    return 0LL;
  }

  if (v3 != 2 || a2[3] || a2[2] != 116 || a2[1]) {
    return 0LL;
  }
  int v4 = *a2;
  if (v4 == 103) {
    unsigned int v5 = 62;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v4 == 108) {
    return 60LL;
  }
  else {
    return v5;
  }
}

uint64_t little2_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (a3 - (uint64_t)a2 >= 2)
  {
    do
    {
      if (a2[1] - 216 >= 4)
      {
        if (!a2[1])
        {
          switch(*(_BYTE *)(result + *a2 + 136))
          {
            case 6:
              a2 += 3;
              goto LABEL_7;
            case 7:
              goto LABEL_3;
            case 9:
              ++*a4;
              int v4 = a2 + 2;
              a4[1] = 0LL;
              a2 = v4;
              break;
            case 0xA:
              ++*a4;
              a4[1] = 0LL;
              a2 += 2;
              break;
            default:
              goto LABEL_6;
          }

          continue;
        }

uint64_t little2_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4 = (unsigned __int8 *)(a2 + 2);
  uint64_t v5 = a3 - (a2 + 2) - 2;
  if (v5 >= 2)
  {
    do
    {
      if (v4[1])
      {
LABEL_15:
        uint64_t result = 0LL;
        *a4 = v4;
        return result;
      }

      uint64_t v6 = *v4;
      int v7 = (char)v6;
      uint64_t v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1LL << v8) & 0xFCB8FE600LL) != 0) {
          goto LABEL_5;
        }
        if (((1LL << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0) {
            goto LABEL_5;
          }
        }

        else if (v8 == 21)
        {
          if (v7 == 9) {
            goto LABEL_15;
          }
          goto LABEL_5;
        }
      }

      if (v7 != 64 && v7 != 36) {
        goto LABEL_15;
      }
LABEL_5:
      v4 += 2;
      v5 -= 2LL;
    }

    while (v5 > 1);
  }

  return 1LL;
}

uint64_t little2_toUtf8(uint64_t a1, unsigned __int8 **a2, uint64_t a3, _BYTE **a4, _BYTE *a5)
{
  uint64_t v5 = *a2;
  int64_t v6 = (a3 - (void)*a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v6 >= 1)
  {
    int v7 = &v5[v6];
    do
    {
      unsigned int v8 = *v5;
      int v9 = (char)v8;
      unsigned int v10 = v5[1];
      if (v10 - 1 >= 7)
      {
        if (v10 - 216 < 4)
        {
          uint64_t v16 = *a4;
          if (a5 - *a4 < 4) {
            goto LABEL_21;
          }
          if (v7 - v5 < 4)
          {
            uint64_t result = 1LL;
            goto LABEL_23;
          }

          unsigned int v17 = ((v8 >> 6) & 0xFFFFFFF3 | (4 * (v10 & 3))) + 1;
          *a4 = v16 + 1;
          *uint64_t v16 = (v17 >> 2) | 0xF0;
          LOBYTE(v17) = (v8 >> 2) & 0xF | (16 * (v17 & 3)) | 0x80;
          uint64_t v18 = (*a4)++;
          *uint64_t v18 = v17;
          unsigned int v19 = v5[2];
          v5 += 2;
          char v20 = (v19 >> 6) & 0xC3 | (16 * (v9 & 3)) | (4 * (v5[1] & 3)) | 0x80;
          unsigned int v21 = (*a4)++;
          _BYTE *v21 = v20;
          LOBYTE(v9) = v19 & 0x3F | 0x80;
          int v22 = *a4;
          goto LABEL_11;
        }

        if (v5[1])
        {
          uint64_t v23 = *a4;
          if (a5 - *a4 < 3)
          {
LABEL_21:
            uint64_t result = 2LL;
            goto LABEL_23;
          }

          *a4 = v23 + 1;
          *uint64_t v23 = (v10 >> 4) | 0xE0;
          char v13 = (4 * (v10 & 0xF)) | (v9 >> 6) | 0x80;
          unsigned int v11 = *a4;
          goto LABEL_6;
        }

        if (((char)v8 & 0x80000000) == 0)
        {
          int v22 = *a4;
          if (*a4 == a5) {
            goto LABEL_21;
          }
LABEL_11:
          *a4 = v22 + 1;
          _BYTE *v22 = v9;
          goto LABEL_12;
        }
      }

      unsigned int v11 = *a4;
      if (a5 - *a4 < 2) {
        goto LABEL_21;
      }
      HIDWORD(v12) = v5[1];
      LODWORD(v12) = v9 << 24;
      char v13 = (v12 >> 30) | 0xC0;
LABEL_6:
      *a4 = v11 + 1;
      *unsigned int v11 = v13;
      char v14 = v9 & 0x3F | 0x80;
      uint64_t v15 = (*a4)++;
      *uint64_t v15 = v14;
LABEL_12:
      v5 += 2;
    }

    while (v5 < v7);
  }

  uint64_t result = 0LL;
LABEL_23:
  *a2 = v5;
  return result;
}

uint64_t little2_toUtf16(uint64_t a1, char **a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v5 = *a2;
  int64_t v6 = (a3 - (void)*a2) & 0xFFFFFFFFFFFFFFFELL;
  int v7 = &(*a2)[v6];
  if (v6 <= (uint64_t)(a5 - *a4))
  {
    uint64_t result = 0LL;
  }

  else
  {
    uint64_t result = (*(v7 - 1) & 0xF8) == 216;
    uint64_t v9 = -2LL;
    if ((*(v7 - 1) & 0xF8) != 0xD8) {
      uint64_t v9 = 0LL;
    }
    v7 += v9;
  }

  while (v5 < v7)
  {
    unsigned int v10 = (_WORD *)*a4;
    if (*a4 >= a5)
    {
      if (*a4 == a5) {
        return 2LL;
      }
      return result;
    }

    *unsigned int v10 = *(_WORD *)v5;
    *a4 = (unint64_t)(v10 + 1);
    uint64_t v5 = *a2 + 2;
    *a2 = v5;
  }

  return result;
}

uint64_t little2_scanLit(int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5 = a4 - (void)a3;
  while (1)
  {
    unsigned int v6 = a3[1];
    if (v6 > 0xDB)
    {
      if (v6 == 255)
      {
        if (*a3 > 0xFDu) {
          goto LABEL_20;
        }
      }

      else if (v6 - 220 < 4)
      {
LABEL_20:
        uint64_t result = 0LL;
        *a5 = a3;
        return result;
      }

      goto LABEL_14;
    }

    if (v6 - 216 >= 4)
    {
      if (!a3[1])
      {
        switch(*(_BYTE *)(a2 + *a3 + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_20;
          case 6:
            if (v5 < 3) {
              return 4294967294LL;
            }
            int v7 = a3 + 3;
            goto LABEL_15;
          case 7:
            goto LABEL_4;
          case 0xC:
          case 0xD:
            int v7 = a3 + 2;
            *a5 = v7;
            if (a3[3]) {
              return 0LL;
            }
            unsigned int v9 = *(unsigned __int8 *)(a2 + *v7 + 136);
            BOOL v10 = v9 > 0x1E;
            int v11 = (1 << v9) & 0x40300E00;
            if (v10 || v11 == 0) {
              return 0LL;
            }
            else {
              return 27LL;
            }
          default:
            break;
        }
      }

uint64_t little2_scanDecl(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (!a2[1])
  {
    switch(*(_BYTE *)(a1 + *a2 + 136))
    {
      case 0x14:
        *a4 = a2 + 2;
        return 33LL;
      case 0x16:
      case 0x18:
        unint64_t v5 = a2 + 2;
        uint64_t v6 = a3 - (void)(a2 + 2);
        if (v6 < 2) {
          return 0xFFFFFFFFLL;
        }
        while (2)
        {
          if (v5[1])
          {
LABEL_20:
            uint64_t v4 = 0LL;
            *a4 = v5;
          }

          else
          {
            switch(*(_BYTE *)(a1 + *v5 + 136))
            {
              case 0x15:
                goto LABEL_13;
              case 0x16:
              case 0x18:
                v5 += 2;
                v6 -= 2LL;
                uint64_t v4 = 0xFFFFFFFFLL;
                if (v6 > 1) {
                  continue;
                }
                return v4;
              case 0x17:
              case 0x19:
              case 0x1A:
              case 0x1B:
              case 0x1C:
              case 0x1D:
                goto LABEL_20;
              case 0x1E:
                if (!v5[3])
                {
                  unsigned int v8 = *(unsigned __int8 *)(a1 + v5[2] + 136);
                  BOOL v9 = v8 > 0x1E;
                  int v10 = (1 << v8) & 0x40200600;
                  if (!v9 && v10 != 0) {
                    goto LABEL_20;
                  }
                }

                goto LABEL_13;
              default:
LABEL_13:
                *a4 = v5;
                uint64_t v4 = 16LL;
                break;
            }
          }

          return v4;
        }

      case 0x1B:
        return little2_scanComment(a1, a2 + 2, a3, a4);
      default:
        break;
    }
  }

  uint64_t v4 = 0LL;
  *a4 = a2;
  return v4;
}

uint64_t little2_scanPi(uint64_t a1, char *a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a3 - (void)a2 - 2;
  uint64_t v10 = a2[1];
  if (a2[1] > 0xDBu)
  {
    if ((_DWORD)v10 == 255)
    {
      LODWORD(v12) = *a2;
      goto LABEL_18;
    }

    goto LABEL_17;
  }

  if (a2[1])
  {
LABEL_17:
    LODWORD(v12) = *a2;
    goto LABEL_18;
  }

  uint64_t v12 = *a2;
  unsigned int v13 = *(unsigned __int8 *)(a1 + v12 + 136);
  if (v13 <= 0x15)
  {
    if (v13 == 5) {
      goto LABEL_7;
    }
    if (v13 == 6)
    {
      if (v4 < 3) {
        return 4294967294LL;
      }
      goto LABEL_7;
    }

    if (v13 != 7) {
      goto LABEL_7;
    }
LABEL_4:
    if (v4 < 4) {
      return 4294967294LL;
    }
LABEL_7:
    uint64_t result = 0LL;
    *a4 = (uint64_t)a2;
    return result;
  }

  if (v13 != 22 && v13 != 24)
  {
    if (v13 != 29) {
      goto LABEL_7;
    }
LABEL_18:
  }

  if (v5 < 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  while (1)
  {
    unint64_t v16 = (unint64_t)&a2[v15];
    uint64_t v17 = a2[v15 + 3];
    if (a2[v15 + 3] <= 0xDBu)
    {
      if (!a2[v15 + 3])
      {
        unint64_t v16 = *(unsigned __int8 *)(v16 + 2);
        switch(*(_BYTE *)(a1 + v16 + 136))
        {
          case 5:
            goto LABEL_45;
          case 6:
            return 4294967294LL;
          case 7:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0x15:
            unsigned int v19 = (unsigned __int8 *)&a2[v15];
            uint64_t v20 = (uint64_t)&a2[v15 + 2];
            uint64_t result = little2_checkPiTarget(a2, v20, &v26);
            if (!(_DWORD)result)
            {
              *a4 = v20;
              return result;
            }

            unint64_t v21 = v5 - 2;
            if (v5 - 2 < 2) {
              return 0xFFFFFFFFLL;
            }
            int v22 = v19 + 4;
            uint64_t result = 0xFFFFFFFFLL;
            while (2)
            {
              unsigned int v23 = v22[1];
              if (v23 <= 0xDB)
              {
                if (v23 - 216 < 4)
                {
LABEL_54:
                  if (v21 < 4) {
                    return 4294967294LL;
                  }
                  uint64_t v24 = v22 + 4;
LABEL_65:
                  unint64_t v21 = a3 - (void)v24;
                  int v22 = v24;
                  continue;
                }

                if (!v22[1])
                {
                  switch(*(_BYTE *)(a1 + *v22 + 136))
                  {
                    case 0:
                    case 1:
                    case 8:
                      goto LABEL_83;
                    case 6:
                      if (v21 < 3) {
                        return 4294967294LL;
                      }
                      uint64_t v24 = v22 + 3;
                      goto LABEL_65;
                    case 7:
                      goto LABEL_54;
                    case 0xF:
                      uint64_t v24 = v22 + 2;
                      if (v22[3] || *v24 != 62) {
                        goto LABEL_65;
                      }
                      uint64_t v25 = (uint64_t)(v22 + 4);
                      break;
                    default:
                      goto LABEL_64;
                  }

LABEL_64:
                uint64_t v24 = v22 + 2;
                goto LABEL_65;
              }

              break;
            }

            if (v23 == 255)
            {
              if (*v22 <= 0xFDu) {
                goto LABEL_64;
              }
            }

            else if (v23 - 220 >= 4)
            {
              goto LABEL_64;
            }

                uint64_t v24 = v22 + 2;
                goto LABEL_65;
              }

              break;
            }

            if (v23 == 255)
            {
              if (v22[1] <= 0xFDu) {
                goto LABEL_64;
              }
            }

            else if (v23 - 220 >= 4)
            {
              goto LABEL_64;
            }

LABEL_36:
    LODWORD(v16) = *(unsigned __int8 *)(v16 + 2);
LABEL_37:
LABEL_38:
    v5 -= 2LL;
    v15 += 2LL;
    if (v5 <= 1) {
      return result;
    }
  }

    LODWORD(v17) = a2[v15 + 3];
LABEL_37:
LABEL_38:
    v5 -= 2LL;
    v15 += 2LL;
    if (v5 <= 1) {
      return result;
    }
  }

LABEL_40:
  uint64_t v18 = (unsigned __int8 *)&a2[v15 + 2];
LABEL_41:
  uint64_t result = 0LL;
LABEL_46:
  *a4 = (uint64_t)v18;
  return result;
}

LABEL_7:
  uint64_t v6 = 0LL;
LABEL_8:
  *a4 = a2;
  return v6;
}

  return 4294967294LL;
}

  uint64_t v18 = (uint64_t)&a2[v15 + 2];
LABEL_41:
  uint64_t result = 0LL;
LABEL_46:
  *a4 = v18;
  return result;
}

  return 4294967294LL;
}

uint64_t little2_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
  }

  else
  {
    if (!a2[1])
    {
      uint64_t v6 = 0LL;
      unsigned int v7 = *(unsigned __int8 *)(a1 + *a2 + 136);
      if (v7 > 0x14)
      {
        switch(*(_BYTE *)(a1 + *a2 + 136))
        {
          case 0x15:
          case 0x1E:
            goto LABEL_35;
          case 0x16:
          case 0x18:
            goto LABEL_15;
          case 0x1D:
            goto LABEL_14;
          default:
            goto LABEL_8;
        }
      }

      if (v7 - 9 < 2)
      {
LABEL_35:
        uint64_t v6 = 22LL;
        goto LABEL_8;
      }

      if (v7 == 6)
      {
        if (v4 >= 3) {
          goto LABEL_7;
        }
        return 4294967294LL;
      }

      if (v7 != 7) {
        goto LABEL_8;
      }
LABEL_4:
      if (v4 >= 4) {
        goto LABEL_7;
      }
      return 4294967294LL;
    }
  }

uint64_t little2_scanPoundName(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
    goto LABEL_8;
  }

  if (a2[1]) {
    goto LABEL_21;
  }
  uint64_t v6 = 0LL;
  unsigned int v8 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v8 <= 0x15)
  {
    if (v8 != 6)
    {
      if (v8 == 7)
      {
LABEL_4:
        if (v4 >= 4) {
          goto LABEL_8;
        }
        return 4294967294LL;
      }

LABEL_9:
      *a4 = a2;
      return v6;
    }

    if (v4 < 3) {
      return 4294967294LL;
    }
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

  if (v8 == 22 || v8 == 24) {
    goto LABEL_22;
  }
  if (v8 != 29) {
    goto LABEL_9;
  }
LABEL_21:
LABEL_22:
  a2 += 2;
  uint64_t v10 = a3 - (void)a2;
  while (1)
  {
    uint64_t v11 = a2[1];
    if (a2[1] <= 0xDBu) {
      break;
    }
    if ((_DWORD)v11 == 255)
    {
      LODWORD(v12) = *a2;
      goto LABEL_33;
    }

      *a4 = a2;
      return v6;
    }

    if (v4 < 3) {
      return 4294967294LL;
    }
LABEL_8:
    uint64_t v6 = 0LL;
    goto LABEL_9;
  }

  if (v8 == 22 || v8 == 24) {
    goto LABEL_22;
  }
  if (v8 != 29) {
    goto LABEL_9;
  }
LABEL_21:
LABEL_22:
  a2 += 2;
  uint64_t v10 = a3 - (void)a2;
  while (1)
  {
    uint64_t v11 = *a2;
    if (*a2 <= 0xDBu) {
      break;
    }
    if ((_DWORD)v11 == 255)
    {
      LODWORD(v12) = a2[1];
      goto LABEL_33;
    }

LABEL_32:
    LODWORD(v12) = *a2;
LABEL_33:
LABEL_34:
    a2 += 2;
    v10 -= 2LL;
    uint64_t v6 = 4294967276LL;
    if (v10 <= 1) {
      return v6;
    }
  }

  if (!a2[1])
  {
    uint64_t v6 = 0LL;
    uint64_t v12 = *a2;
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 6:
        return 4294967294LL;
      case 7:
        goto LABEL_40;
      case 9:
      case 0xA:
      case 0xB:
      case 0x15:
      case 0x1E:
      case 0x20:
      case 0x24:
        uint64_t v6 = 20LL;
        goto LABEL_9;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_34;
      case 0x1D:
        goto LABEL_33;
      default:
        goto LABEL_9;
    }
  }

      if (v14 <= 3) {
        goto LABEL_54;
      }
      unint64_t v16 = v10 + 4;
LABEL_48:
      char v14 = a3 - (void)v16;
      uint64_t v10 = v16;
    }

    if (v15 == 255)
    {
      if (v10[1] > 0xFDu) {
        goto LABEL_54;
      }
    }

    else if (v15 - 220 < 4)
    {
LABEL_54:
      *a4 = v10;
      return 6LL;
    }

    LODWORD(v12) = a2[1];
LABEL_33:
LABEL_34:
    a2 += 2;
    v10 -= 2LL;
    uint64_t v6 = 4294967276LL;
    if (v10 <= 1) {
      return v6;
    }
  }

  if (!*a2)
  {
    uint64_t v6 = 0LL;
    uint64_t v12 = a2[1];
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 6:
        return 4294967294LL;
      case 7:
        goto LABEL_40;
      case 9:
      case 0xA:
      case 0xB:
      case 0x15:
      case 0x1E:
      case 0x20:
      case 0x24:
        uint64_t v6 = 20LL;
        goto LABEL_9;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_34;
      case 0x1D:
        goto LABEL_33;
      default:
        goto LABEL_9;
    }
  }

uint64_t little2_scanComment(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (a2[1] || *a2 != 45)
  {
LABEL_26:
    uint64_t v7 = 0LL;
    goto LABEL_27;
  }

  a2 += 2;
  unint64_t v4 = a3 - (void)a2;
  while (1)
  {
    unsigned int v5 = a2[1];
    if (v5 > 0xDB)
    {
      if (v5 == 255)
      {
        if (*a2 > 0xFDu) {
          goto LABEL_26;
        }
      }

      else if (v5 - 220 < 4)
      {
        goto LABEL_26;
      }

      goto LABEL_23;
    }

    if (v5 - 216 >= 4) {
      break;
    }
LABEL_7:
    if (v4 < 4) {
      return 4294967294LL;
    }
    uint64_t v6 = a2 + 4;
LABEL_24:
    unint64_t v4 = a3 - (void)v6;
    uint64_t v7 = 0xFFFFFFFFLL;
    a2 = v6;
  }

  if (a2[1])
  {
LABEL_23:
    uint64_t v6 = a2 + 2;
    goto LABEL_24;
  }

  uint64_t v7 = 0LL;
  switch(*(_BYTE *)(a1 + *a2 + 136))
  {
    case 0:
    case 1:
    case 8:
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_23;
    case 6:
      if (v4 < 3) {
        return 4294967294LL;
      }
      uint64_t v6 = a2 + 3;
      goto LABEL_24;
    case 7:
      goto LABEL_7;
    default:
      if (*(_BYTE *)(a1 + *a2 + 136) != 27) {
        goto LABEL_23;
      }
      uint64_t v6 = a2 + 2;
      if (a2[3] || *v6 != 45) {
        goto LABEL_24;
      }
      if (a2[5])
      {
        uint64_t v7 = 0LL;
        a2 += 4;
      }

      else
      {
        int v9 = a2[4];
        if (v9 == 62) {
          a2 += 6;
        }
        else {
          a2 += 4;
        }
        if (v9 == 62) {
          uint64_t v7 = 13LL;
        }
        else {
          uint64_t v7 = 0LL;
        }
      }

      break;
  }

LABEL_27:
  *a4 = a2;
  return v7;
}

  *a4 = a2;
  return v7;
}

  if (v5 < 2) {
    return 0xFFFFFFFFLL;
  }
  for (a2 += 4; ; a2 += 2)
  {
    uint64_t v11 = *(a2 - 2);
    if (*(a2 - 2) <= 0xDBu) {
      break;
    }
    if ((_DWORD)v11 != 255)
    {
LABEL_38:
      LODWORD(v12) = *(a2 - 1);
      goto LABEL_39;
    }

    LODWORD(v12) = *(a2 - 1);
LABEL_39:
LABEL_40:
    v5 -= 2LL;
    uint64_t v7 = 0xFFFFFFFFLL;
    if (v5 <= 1) {
      return v7;
    }
  }

  if (!*(a2 - 2))
  {
    uint64_t v12 = *(a2 - 1);
    unsigned int v13 = *(unsigned __int8 *)(a1 + v12 + 136);
    switch(*(_BYTE *)(a1 + v12 + 136))
    {
      case 0x12:
        uint64_t v7 = 9LL;
        goto LABEL_8;
      case 0x13:
      case 0x14:
      case 0x15:
      case 0x17:
      case 0x1C:
        goto LABEL_56;
      case 0x16:
      case 0x18:
      case 0x19:
      case 0x1A:
      case 0x1B:
        goto LABEL_40;
      case 0x1D:
        goto LABEL_39;
      default:
        if (v13 != 6)
        {
          if (v13 != 7) {
            goto LABEL_56;
          }
          goto LABEL_55;
        }

        break;
    }

    goto LABEL_56;
  }

BOOL little2_checkPiTarget(char *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 11;
  if (a2 - (void)a1 != 6 || a1[1]) {
    return 1LL;
  }
  int v4 = *a1;
  if (v4 == 120)
  {
    int v5 = 0;
  }

  else
  {
    if (v4 != 88) {
      return 1LL;
    }
    int v5 = 1;
  }

  if (a1[3]) {
    return 1LL;
  }
  int v6 = a1[2];
  if (v6 != 109)
  {
    if (v6 != 77) {
      return 1LL;
    }
    int v5 = 1;
  }

  if (a1[5]) {
    return 1LL;
  }
  int v7 = a1[4];
  if (v7 == 108)
  {
    if (v5) {
      return 0LL;
    }
    *a3 = 12;
    return 1LL;
  }

  return v7 != 76;
}

uint64_t little2_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  uint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a2[1];
  if (a2[1] > 0xDBu)
  {
    goto LABEL_26;
  }

  if (a2[1]) {
    goto LABEL_26;
  }
  uint64_t v6 = 0LL;
  unsigned int v7 = *(unsigned __int8 *)(a1 + *a2 + 136);
  if (v7 > 0x15)
  {
    if (v7 == 22 || v7 == 24) {
      goto LABEL_27;
    }
    if (v7 != 29) {
      goto LABEL_8;
    }
LABEL_26:
LABEL_27:
    a2 += 2;
    uint64_t v4 = a3 - (void)a2;
    while (1)
    {
      uint64_t v10 = a2[1];
      if (a2[1] > 0xDBu)
      {
        if ((_DWORD)v10 == 255)
        {
          LODWORD(v11) = *a2;
          goto LABEL_38;
        }
      }

      else
      {
        if (!a2[1])
        {
          uint64_t v6 = 0LL;
          uint64_t v11 = *a2;
          int v12 = *(unsigned __int8 *)(a1 + v11 + 136);
          switch(*(_BYTE *)(a1 + v11 + 136))
          {
            case 0x12:
              a2 += 2;
              uint64_t v6 = 9LL;
              goto LABEL_8;
            case 0x13:
            case 0x14:
            case 0x15:
            case 0x17:
            case 0x1C:
              goto LABEL_8;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              goto LABEL_39;
            case 0x1D:
              goto LABEL_38;
            default:
              if (v12 == 6) {
                goto LABEL_53;
              }
              if (v12 != 7) {
                goto LABEL_8;
              }
              goto LABEL_4;
          }
        }
      }

      LODWORD(v11) = *a2;
LABEL_38:
LABEL_39:
      a2 += 2;
      v4 -= 2LL;
      uint64_t v6 = 0xFFFFFFFFLL;
      if (v4 <= 1) {
        return v6;
      }
    }
  }

  if (v7 == 6)
  {
LABEL_53:
    goto LABEL_7;
  }

  if (v7 != 7)
  {
    if (v7 != 19) {
      goto LABEL_8;
    }
    unsigned int v8 = a2 + 2;
    if (a3 - (uint64_t)(a2 + 2) >= 2)
    {
      if (a2[3]) {
        goto LABEL_16;
      }
      uint64_t v13 = *v8;
      if (v13 == 120)
      {
        if (a3 - (uint64_t)(a2 + 4) >= 2)
        {
          if (a2[5] || (*(_BYTE *)(a1 + a2[4] + 136) & 0xFE) != 0x18)
          {
            uint64_t v6 = 0LL;
            a2 += 4;
            goto LABEL_8;
          }

          a2 += 6;
          uint64_t v14 = a3 - (void)a2;
          if (a3 - (uint64_t)a2 >= 2)
          {
            while (!a2[1])
            {
              int v15 = *(unsigned __int8 *)(a1 + *a2 + 136);
              if ((v15 - 24) >= 2)
              {
                if (v15 != 18) {
                  goto LABEL_7;
                }
                a2 += 2;
                uint64_t v6 = 10LL;
                goto LABEL_8;
              }

              a2 += 2;
              v14 -= 2LL;
              uint64_t v6 = 0xFFFFFFFFLL;
              if (v14 <= 1) {
                return v6;
              }
            }

            goto LABEL_7;
          }
        }
      }

      else
      {
        if (*(_BYTE *)(a1 + v13 + 136) != 25)
        {
LABEL_16:
          uint64_t v6 = 0LL;
LABEL_17:
          a2 = v8;
          goto LABEL_8;
        }

        unsigned int v8 = a2 + 4;
        uint64_t v16 = v4 - 4;
        while (1)
        {
          BOOL v17 = v16 < 2;
          v16 -= 2LL;
          if (v17) {
            break;
          }
          a2 = v8;
          if (v8[1]) {
            goto LABEL_7;
          }
          v8 += 2;
          int v18 = *(unsigned __int8 *)(a1 + *a2 + 136);
          if (v18 != 25)
          {
            if (v18 != 18) {
              goto LABEL_7;
            }
            uint64_t v6 = 10LL;
            goto LABEL_17;
          }
        }
      }
    }

    return 0xFFFFFFFFLL;
  }

uint64_t little2_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v32 = a2;
  unint64_t v4 = a3 - (void)a2;
  int v7 = 0;
  uint64_t v8 = a3 - 4;
  while (1)
  {
    uint64_t v9 = a2[1];
    if (a2[1] <= 0xDBu) {
      break;
    }
    if ((_DWORD)v9 != 255)
    {
LABEL_21:
      LODWORD(v11) = *a2;
      goto LABEL_22;
    }

    LODWORD(v11) = *a2;
LABEL_22:
LABEL_23:
    a2 += 2;
    uint64_t v32 = a2;
LABEL_24:
    unint64_t v4 = a3 - (void)a2;
  }

  if (a2[1])
  {
    if ((v9 - 216) < 4)
    {
LABEL_101:
      if (v4 >= 4)
      {
LABEL_106:
        uint64_t result = 0LL;
        goto LABEL_107;
      }

      return 4294967294LL;
    }

    goto LABEL_21;
  }

  uint64_t result = 0LL;
  uint64_t v11 = *a2;
  switch(*(_BYTE *)(a1 + v11 + 136))
  {
    case 6:
      if (v4 >= 3) {
        goto LABEL_106;
      }
      return 4294967294LL;
    case 7:
      goto LABEL_101;
    case 9:
    case 0xA:
    case 0x15:
      a2 += 2;
      uint64_t v12 = a3 - (void)a2;
      while (2)
      {
        if (a2[1]) {
          goto LABEL_106;
        }
        int v13 = *(unsigned __int8 *)(a1 + *a2 + 136);
        if ((v13 - 9) < 2 || v13 == 21)
        {
          a2 += 2;
          v12 -= 2LL;
          if (v12 <= 1) {
            return 0xFFFFFFFFLL;
          }
          continue;
        }

        break;
      }

      if (v13 != 14) {
        goto LABEL_106;
      }
      uint64_t v32 = a2;
LABEL_36:
      int v15 = a2 + 2;
      for (uint64_t i = v8 - (void)a2; ; i -= 2LL)
      {
        if (v15[1]) {
          goto LABEL_113;
        }
        unsigned int v21 = *(unsigned __int8 *)(a1 + *v15 + 136);
        if ((v21 & 0xFE) == 0xC) {
          break;
        }
        if (v21 > 0x15 || ((1 << v21) & 0x200600) == 0) {
          goto LABEL_113;
        }
        v15 += 2;
        uint64_t result = 0xFFFFFFFFLL;
        if (i <= 1) {
          return result;
        }
      }

      v15 += 2;
      uint64_t v32 = v15;
      if (i < 2) {
        return 0xFFFFFFFFLL;
      }
      while (2)
      {
        unsigned int v24 = v15[1];
        if (v24 > 0xDB)
        {
          if (v24 - 220 < 4)
          {
            int v25 = 8;
            goto LABEL_62;
          }

          if (v24 == 255 && *v15 > 0xFDu)
          {
            int v25 = 0;
            goto LABEL_62;
          }
        }

        else
        {
          if (v24 - 216 < 4)
          {
            int v25 = 7;
            goto LABEL_62;
          }

          if (!v15[1])
          {
            int v25 = *(unsigned __int8 *)(a1 + *v15 + 136);
            goto LABEL_62;
          }
        }

        int v25 = 29;
LABEL_62:
        if (v25 == v21)
        {
          a2 = v15 + 2;
          uint64_t v32 = v15 + 2;
          if (v15[3]) {
            goto LABEL_106;
          }
          uint64_t result = 0LL;
          unsigned int v27 = *(unsigned __int8 *)(a1 + *a2 + 136);
          if (v27 <= 0xA)
          {
            if (v27 - 9 >= 2) {
              goto LABEL_107;
            }
            goto LABEL_88;
          }

          if (v27 == 21)
          {
LABEL_88:
            a2 = v15 + 4;
            uint64_t v28 = a3 - (void)(v15 + 4);
            if (v28 < 2) {
              return 0xFFFFFFFFLL;
            }
            while (2)
            {
              int v29 = a2[1];
              if (!a2[1])
              {
                uint64_t result = 0LL;
                switch(*(_BYTE *)(a1 + *a2 + 136))
                {
                  case 6:
                    return 4294967294LL;
                  case 7:
                    goto LABEL_103;
                  case 9:
                  case 0xA:
                  case 0x15:
                    a2 += 2;
                    v28 -= 2LL;
                    uint64_t result = 0xFFFFFFFFLL;
                    if (v28 <= 1) {
                      return result;
                    }
                    continue;
                  case 0xB:
                    goto LABEL_128;
                  case 0x11:
                    goto LABEL_118;
                  case 0x16:
                  case 0x18:
                    goto LABEL_100;
                  case 0x1D:
                    goto LABEL_98;
                  default:
                    goto LABEL_107;
                }
              }

              break;
            }

            if ((v29 - 216) < 4)
            {
LABEL_103:
              return 4294967294LL;
            }

            if (v29 == 255)
            {
              uint64_t v32 = a2;
              unsigned int v30 = *a2;
              if (v30 > 0xFD) {
                goto LABEL_106;
              }
            }

            else
            {
LABEL_98:
              uint64_t v32 = a2;
              unsigned int v30 = *a2;
            }

LABEL_100:
            int v7 = 0;
            goto LABEL_23;
          }

          if (v27 == 11)
          {
LABEL_128:
            a2 += 2;
            uint64_t result = 1LL;
            goto LABEL_107;
          }

          if (v27 != 17)
          {
LABEL_107:
            *a4 = a2;
            return result;
          }

LABEL_118:
          int v15 = a2 + 2;
          uint64_t v32 = a2 + 2;
          if (a3 - (uint64_t)(a2 + 2) >= 2)
          {
            if (!a2[3])
            {
              int v31 = a2[2];
              if (v31 == 62) {
                a2 += 4;
              }
              else {
                a2 += 2;
              }
              if (v31 == 62) {
                uint64_t result = 3LL;
              }
              else {
                uint64_t result = 0LL;
              }
              goto LABEL_107;
            }

            goto LABEL_113;
          }

          return 0xFFFFFFFFLL;
        }

        switch(v25)
        {
          case 0:
          case 1:
          case 2:
          case 8:
            goto LABEL_113;
          case 3:
            unsigned int v26 = a4;
            uint64_t result = little2_scanRef(a1, v15 + 2, a3, &v32);
            if ((int)result >= 1)
            {
              int v15 = v32;
              a4 = v26;
LABEL_72:
              uint64_t i = a3 - (void)v15;
              uint64_t result = 0xFFFFFFFFLL;
              continue;
            }

            if (!(_DWORD)result)
            {
              a4 = v26;
              a2 = v32;
              goto LABEL_107;
            }

            return result;
          case 6:
            v15 += 3;
            goto LABEL_71;
          case 7:
            v15 += 4;
            goto LABEL_71;
          default:
            v15 += 2;
LABEL_71:
            uint64_t v32 = v15;
            goto LABEL_72;
        }
      }

    case 0xE:
      goto LABEL_36;
    case 0x16:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_23;
    case 0x17:
      if (v7) {
        goto LABEL_106;
      }
      int v15 = a2 + 2;
      uint64_t v32 = a2 + 2;
      uint64_t v16 = a3 - (void)(a2 + 2);
      if (v16 < 2) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v17 = a2[3];
      if (a2[3] > 0xDBu)
      {
        if ((_DWORD)v17 == 255)
        {
          LODWORD(v18) = *v15;
LABEL_78:
          goto LABEL_79;
        }
      }

      else
      {
        if (!a2[3])
        {
          uint64_t v18 = *v15;
          unsigned int v19 = *(unsigned __int8 *)(a1 + v18 + 136);
          if (v19 <= 0x17)
          {
            if (v19 != 22)
            {
              if (v19 == 6)
              {
              }

              else if (v19 == 7)
              {
LABEL_112:
              }

LABEL_113:
              uint64_t result = 0LL;
              a2 = v15;
              goto LABEL_107;
            }
          }

          else if (v19 != 24)
          {
            if (v19 != 29) {
              goto LABEL_113;
            }
            goto LABEL_78;
          }

BOOL streqci(unsigned __int8 *a1, unsigned __int8 *a2)
{
  do
  {
    int v3 = *a1++;
    int v2 = v3;
    int v5 = *a2++;
    int v4 = v5;
    else {
      int v6 = 1;
    }
  }

  while (!v6);
  return v6 == 2;
}

uint64_t initScan(void *a1, uint64_t a2, int a3, unsigned __int8 *a4, unsigned __int8 *a5, void *a6)
{
  if (a4 >= a5) {
    return 4294967292LL;
  }
  int v6 = *(uint64_t (****)(void))(a2 + 136);
  if (a4 + 1 == a5)
  {
    int v12 = *a4;
    if ((v12 - 239) <= 0x10 && ((1 << (v12 + 17)) & 0x18001) != 0)
    {
      uint64_t v10 = 0xFFFFFFFFLL;
      if (a3 != 1 || *(_BYTE *)(a2 + 133)) {
        return v10;
      }
    }

    else
    {
      uint64_t v10 = 0xFFFFFFFFLL;
      if (!*a4 || v12 == 60) {
        return v10;
      }
    }

LABEL_45:
    uint64_t v16 = (uint64_t (**)(void))a1[*(char *)(a2 + 133)];
    goto LABEL_46;
  }

  int v7 = a4[1] | (*a4 << 8);
  if (v7 > 65278)
  {
    if (v7 == 65534)
    {
      if (a3 != 1 || *(_BYTE *)(a2 + 133))
      {
        *a6 = a4 + 2;
        uint64_t v9 = (uint64_t (**)(void))a1[5];
        goto LABEL_32;
      }

      goto LABEL_45;
    }

    if (v7 == 65279)
    {
      if (a3 != 1 || *(_BYTE *)(a2 + 133))
      {
        *a6 = a4 + 2;
        uint64_t v9 = (uint64_t (**)(void))a1[4];
        goto LABEL_32;
      }

      goto LABEL_45;
    }
  }

  else
  {
    if (v7 == 15360)
    {
      int v13 = *(unsigned __int8 *)(a2 + 133);
      if (v13 == 4)
      {
        if (a3 == 1) {
          goto LABEL_45;
        }
      }

      else if (a3 == 1 && v13 == 3)
      {
        goto LABEL_45;
      }

      uint64_t v16 = (uint64_t (**)(void))a1[5];
LABEL_46:
      unsigned __int8 *v6 = v16;
      int v15 = v16[a3];
      return v15();
    }

    if (v7 == 61371)
    {
      if (a3 != 1 || (unsigned int v8 = *(unsigned __int8 *)(a2 + 133), v8 > 5) || ((1 << v8) & 0x39) == 0)
      {
        if (a4 + 2 != a5)
        {
          if (a4[2] == 191)
          {
            *a6 = a4 + 3;
            uint64_t v9 = (uint64_t (**)(void))a1[2];
LABEL_32:
            unsigned __int8 *v6 = v9;
            return 14LL;
          }

          goto LABEL_45;
        }

        return 0xFFFFFFFFLL;
      }

      goto LABEL_45;
    }
  }

  if (!*a4)
  {
    if (a3 != 1 || *(_BYTE *)(a2 + 133) != 5)
    {
      uint64_t v16 = (uint64_t (**)(void))a1[4];
      goto LABEL_46;
    }

    goto LABEL_45;
  }

  if (a3 == 1 || a4[1]) {
    goto LABEL_45;
  }
  uint64_t v14 = (uint64_t (**)(void))a1[5];
  unsigned __int8 *v6 = v14;
  int v15 = *v14;
  return v15();
}

uint64_t ascii_toUtf8(uint64_t a1, char **a2, unint64_t a3, unint64_t *a4, unint64_t a5)
{
  while (1)
  {
    int v5 = *a2;
    if (*a4 >= a5) {
      break;
    }
    *a2 = v5 + 1;
    char v6 = *v5;
    int v7 = (_BYTE *)(*a4)++;
    *int v7 = v6;
  }

  if (*a4 != a5) {
    return 0LL;
  }
  return 2LL;
}

uint64_t big2_prologTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, uint64_t *a4)
{
  if (((a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL) == 0 || ((a3 - (void)a2) & 1) == 0) {
    uint64_t v6 = a3;
  }
  else {
    uint64_t v6 = (uint64_t)&a2[(a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL];
  }
  if (a3 - (void)a2 == 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v10) = a2[1];
      goto LABEL_29;
    }

LABEL_65:
            uint64_t v20 = v16 + 4;
            uint64_t result = 41LL;
            break;
          }

          if (*(unsigned __int8 *)(a1 + v23 + 136) <= 0x15u)
          {
            switch(v24)
            {
              case 5u:
                goto LABEL_73;
              case 6u:
                if (v21 >= 3)
                {
LABEL_73:
                  uint64_t result = 0LL;
                  *a4 = (uint64_t)v20;
                  return result;
                }

                return 4294967294LL;
              case 7u:
LABEL_72:
                if (v21 >= 4) {
                  goto LABEL_73;
                }
                return 4294967294LL;
            }
          }

          else if (v24 == 22)
          {
            goto LABEL_65;
          }

          break;
        case 0x1D:
          goto LABEL_50;
        case 0x21:
          if ((_DWORD)result == 19) {
            goto LABEL_76;
          }
          *a4 = (uint64_t)(v16 + 2);
          return 31LL;
        case 0x22:
          if ((_DWORD)result == 19) {
            goto LABEL_76;
          }
          *a4 = (uint64_t)(v16 + 2);
          return 32LL;
        default:
          goto LABEL_76;
      }

LABEL_52:
      uint64_t v17 = v6 - (void)v20;
      uint64_t v16 = v20;
    }

    if ((_DWORD)v18 != 255)
    {
      goto LABEL_49;
    }

    LODWORD(v19) = v16[1];
LABEL_50:
LABEL_51:
    uint64_t v20 = v16 + 2;
    goto LABEL_52;
  }

  if ((v9 - 216) < 4)
  {
LABEL_13:
LABEL_16:
    uint64_t result = 0LL;
    *a4 = (uint64_t)a2;
    return result;
  }

  if (*a2) {
    goto LABEL_28;
  }
  uint64_t v10 = a2[1];
  uint64_t result = 18LL;
  switch(*(_BYTE *)(a1 + v10 + 136))
  {
    case 2:
      uint64_t v11 = a2 + 2;
      int v12 = *v11;
      if (!*v11)
      {
        int v35 = *(unsigned __int8 *)(a1 + a2[3] + 136);
        switch(*(_BYTE *)(a1 + a2[3] + 136))
        {
          case 0xF:
            uint64_t result = big2_scanPi(a1, a2 + 4, v6, a4);
            break;
          case 0x10:
            uint64_t result = big2_scanDecl(a1, a2 + 4, v6, a4);
            break;
          case 0x11:
          case 0x12:
          case 0x13:
          case 0x14:
          case 0x15:
          case 0x17:
            goto LABEL_112;
          case 0x16:
          case 0x18:
            goto LABEL_139;
          default:
            goto LABEL_112;
        }

        return result;
      }

      if (v12 != 255 || a2[3] <= 0xFDu)
      {
LABEL_139:
        *a4 = (uint64_t)a2;
        return 29LL;
      }

      goto LABEL_112;
    case 4:
      int v25 = a2 + 2;
      uint64_t v26 = v6 - (void)(a2 + 2);
      if (v26 < 2) {
        return 4294967270LL;
      }
      if (*v25 || a2[3] != 93) {
        goto LABEL_117;
      }
      if (a2[4] || a2[5] != 62)
      {
LABEL_117:
        *a4 = (uint64_t)v25;
        return 26LL;
      }

      else
      {
        *a4 = (uint64_t)(a2 + 6);
        return 34LL;
      }

    case 5:
      return 4294967294LL;
    case 6:
      return 4294967294LL;
    case 7:
      goto LABEL_13;
    case 9:
      *a4 = v6;
      return 4294967281LL;
    case 0xA:
    case 0x15:
LABEL_90:
      unsigned int v27 = a2 + 2;
      uint64_t v28 = v6 - (void)(a2 + 2);
      if (v28 >= 2)
      {
        do
        {
          if (*v27) {
            break;
          }
          int v29 = *(unsigned __int8 *)(a1 + v27[1] + 136);
          if (v29 != 21 && v29 != 10 && (v29 != 9 || v27 + 2 == (_BYTE *)v6)) {
            break;
          }
          v27 += 2;
          v28 -= 2LL;
        }

        while (v28 > 1);
      }

      *a4 = (uint64_t)v27;
      return 15LL;
    case 0xB:
      *a4 = (uint64_t)(a2 + 2);
      return 17LL;
    case 0xC:
      uint64_t v32 = a2 + 2;
      int v33 = 12;
      return big2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0xD:
      uint64_t v32 = a2 + 2;
      int v33 = 13;
      return big2_scanLit(v33, a1, v32, v6, (unsigned __int8 **)a4);
    case 0x13:
      return big2_scanPoundName(a1, a2 + 2, v6, a4);
    case 0x14:
      *a4 = (uint64_t)(a2 + 2);
      return 25LL;
    case 0x16:
    case 0x18:
      goto LABEL_33;
    case 0x17:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_32;
    case 0x1D:
      goto LABEL_29;
    case 0x1E:
      return big2_scanPercent(a1, a2 + 2, v6, a4);
    case 0x1F:
      *a4 = (uint64_t)(a2 + 2);
      return 23LL;
    case 0x20:
      uint64_t v11 = a2 + 2;
      if (*v11) {
        goto LABEL_112;
      }
      int v34 = *(unsigned __int8 *)(a1 + a2[3] + 136);
      if (v34 <= 31)
      {
        if ((v34 - 9) >= 3)
        {
          if (v34 == 15)
          {
            *a4 = (uint64_t)(a2 + 4);
            return 35LL;
          }

          if (v34 != 21)
          {
LABEL_112:
            uint64_t result = 0LL;
            *a4 = (uint64_t)v11;
            return result;
          }
        }

LABEL_133:
        *a4 = (uint64_t)v11;
        return 24LL;
      }

      switch(v34)
      {
        case ' ':
        case '#':
        case '$':
          goto LABEL_133;
        case '!':
          *a4 = (uint64_t)(a2 + 4);
          uint64_t result = 36LL;
          break;
        case '""':
          *a4 = (uint64_t)(a2 + 4);
          uint64_t result = 37LL;
          break;
        default:
          goto LABEL_112;
      }

      break;
    case 0x23:
      *a4 = (uint64_t)(a2 + 2);
      return 38LL;
    case 0x24:
      *a4 = (uint64_t)(a2 + 2);
      return 21LL;
    default:
      goto LABEL_16;
  }

  return result;
}

uint64_t big2_contentTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  char v4 = a3 - (_BYTE)a2;
  unint64_t v5 = (a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v5) {
    BOOL v6 = ((a3 - (void)a2) & 1) == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6) {
    a3 = (unint64_t)&a2[v5];
  }
  if ((v4 & 1) != 0 && !v5) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v9 = *a2;
  if (v9 > 0xDB)
  {
    if (v9 - 220 < 4 || v9 == 255 && a2[1] > 0xFDu)
    {
LABEL_17:
      uint64_t v7 = 0LL;
      *a4 = a2;
      return v7;
    }

    goto LABEL_28;
  }

  if (v9 - 216 < 4)
  {
LABEL_14:
    uint64_t v10 = a2 + 4;
    goto LABEL_29;
  }

  if (*a2)
  {
LABEL_28:
    uint64_t v10 = a2 + 2;
LABEL_29:
    unint64_t v14 = a3 - (void)v10;
    if ((uint64_t)(a3 - (void)v10) < 2)
    {
      uint64_t v16 = v10;
LABEL_53:
      *a4 = v16;
      return 6LL;
    }

    while (1)
    {
      unsigned int v15 = *v10;
      if (v15 > 0xDB) {
        break;
      }
      if (v15 - 216 >= 4)
      {
        if (!*v10)
        {
          switch(*(_BYTE *)(a1 + v10[1] + 136))
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 8:
            case 9:
            case 0xA:
              goto LABEL_54;
            case 4:
              if (v14 < 4) {
                goto LABEL_54;
              }
              uint64_t v16 = v10 + 2;
              if (v10[2] || v10[3] != 93) {
                goto LABEL_48;
              }
              if (v14 < 6) {
                goto LABEL_54;
              }
              if (v10[4] || v10[5] != 62) {
                goto LABEL_48;
              }
              uint64_t v7 = 0LL;
              uint64_t v11 = v10 + 4;
              break;
            case 6:
              if (v14 <= 2) {
                goto LABEL_54;
              }
              uint64_t v16 = v10 + 3;
              goto LABEL_48;
            case 7:
              goto LABEL_32;
            default:
              goto LABEL_47;
          }

          goto LABEL_79;
        }

        goto LABEL_47;
      }

LABEL_47:
    uint64_t v16 = v10 + 2;
    goto LABEL_48;
  }

  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_17;
    case 2:
      uint64_t v11 = a2 + 2;
      uint64_t v12 = a3 - (void)(a2 + 2);
      if (v12 < 2) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v13 = *v11;
      if (*v11 > 0xDBu)
      {
        if ((_DWORD)v13 == 255)
        {
          LODWORD(v19) = a2[3];
          goto LABEL_88;
        }

LABEL_87:
        LODWORD(v19) = a2[3];
LABEL_88:
LABEL_89:
        uint64_t v20 = a2 + 4;
        uint64_t v21 = a3 - (void)(a2 + 4);
        if (v21 < 2) {
          return 0xFFFFFFFFLL;
        }
        int v22 = 0;
        while (1)
        {
          uint64_t v23 = *v20;
          if (*v20 > 0xDBu) {
            break;
          }
          if (*v20)
          {
            if ((v23 - 216) < 4)
            {
LABEL_124:
              if ((unint64_t)v21 >= 4)
              {
LABEL_125:
                uint64_t v7 = 0LL;
                *a4 = v20;
                return v7;
              }

              return 4294967294LL;
            }

LABEL_109:
            LODWORD(v24) = v20[1];
            goto LABEL_110;
          }

          uint64_t v24 = v20[1];
          uint64_t v25 = 2LL;
          switch(*(_BYTE *)(a1 + v24 + 136))
          {
            case 6:
              return 4294967294LL;
            case 7:
              goto LABEL_124;
            case 9:
            case 0xA:
            case 0x15:
              uint64_t v35 = a3 - (void)v20 - 2;
              if (v35 < 2) {
                return 0xFFFFFFFFLL;
              }
              uint64_t v36 = v20 + 4;
              while (2)
              {
                uint64_t v37 = *(v36 - 2);
                if (!*(v36 - 2))
                {
                  uint64_t v38 = *(v36 - 1);
                  switch(*(_BYTE *)(a1 + v38 + 136))
                  {
                    case 6:
                      return 4294967294LL;
                    case 7:
                      goto LABEL_195;
                    case 9:
                    case 0xA:
                    case 0x15:
                      v35 -= 2LL;
                      v36 += 2;
                      uint64_t v7 = 0xFFFFFFFFLL;
                      if (v35 <= 1) {
                        return v7;
                      }
                      continue;
                    case 0xB:
                      uint64_t v20 = v36 - 2;
                      goto LABEL_211;
                    case 0x11:
                      uint64_t v20 = v36 - 2;
                      goto LABEL_213;
                    case 0x16:
                    case 0x18:
                      return big2_scanAtts(a1, v36, a3, a4);
                    case 0x1D:
                      uint64_t v37 = 0LL;
                      goto LABEL_218;
                    default:
                      goto LABEL_220;
                  }
                }

                break;
              }

              if ((v37 - 216) < 4)
              {
LABEL_195:
              }

              else
              {
                if ((_DWORD)v37 == 255)
                {
                  LODWORD(v38) = *(v36 - 1);
                  uint64_t v37 = 0xFFu;
                }

                else
                {
                  LODWORD(v38) = *(v36 - 1);
                }

LABEL_218:
              }

LABEL_220:
              uint64_t v7 = 0LL;
              uint64_t v11 = v36 - 2;
              goto LABEL_79;
            case 0xB:
LABEL_211:
              *a4 = v20 + 2;
              return 2LL;
            case 0x11:
LABEL_213:
              uint64_t v11 = v20 + 2;
              if (*v11 || v20[3] != 62) {
                goto LABEL_78;
              }
              *a4 = v20 + 4;
              return 4LL;
            case 0x16:
            case 0x18:
            case 0x19:
            case 0x1A:
            case 0x1B:
              break;
            case 0x17:
              if (v22) {
                goto LABEL_125;
              }
              uint64_t v26 = v20 + 2;
              uint64_t v27 = a3 - (void)(v20 + 2);
              if (v27 < 2) {
                return 0xFFFFFFFFLL;
              }
              uint64_t v28 = *v26;
              if (*v26 > 0xDBu)
              {
                if ((_DWORD)v28 == 255)
                {
                  LODWORD(v29) = v20[3];
                  goto LABEL_121;
                }

                goto LABEL_120;
              }

              if (*v26)
              {
LABEL_120:
                LODWORD(v29) = v20[3];
LABEL_121:
                int v22 = 1;
LABEL_123:
                uint64_t v25 = 4LL;
                break;
              }

              uint64_t v29 = v20[3];
              unsigned int v30 = *(unsigned __int8 *)(a1 + v29 + 136);
              if (v30 <= 0x15)
              {
                if (v30 != 5)
                {
                  if (v30 == 6)
                  {
                  }

                  else if (v30 == 7)
                  {
LABEL_146:
                  }
                }

LABEL_174:
                uint64_t v7 = 0LL;
                *a4 = v26;
                return v7;
              }

              int v22 = 1;
              if (v30 == 22) {
                goto LABEL_123;
              }
              uint64_t v25 = 4LL;
              if (v30 != 24)
              {
                if (v30 != 29) {
                  goto LABEL_174;
                }
                goto LABEL_121;
              }

              break;
            case 0x1D:
              goto LABEL_110;
            default:
              goto LABEL_125;
          }

LABEL_112:
          v20 += v25;
          uint64_t v21 = a3 - (void)v20;
          uint64_t v7 = 0xFFFFFFFFLL;
        }

        if ((_DWORD)v23 != 255)
        {
          goto LABEL_109;
        }

        LODWORD(v24) = v20[1];
LABEL_110:
        uint64_t v25 = 2LL;
        goto LABEL_112;
      }

      if ((v13 - 216) < 4)
      {
LABEL_24:
LABEL_78:
        uint64_t v7 = 0LL;
        goto LABEL_79;
      }

      if (*v11) {
        goto LABEL_87;
      }
      uint64_t v19 = a2[3];
      switch(*(_BYTE *)(a1 + v19 + 136))
      {
        case 5:
        case 8:
        case 9:
        case 0xA:
        case 0xB:
        case 0xC:
        case 0xD:
        case 0xE:
        case 0x12:
        case 0x13:
        case 0x14:
        case 0x15:
        case 0x17:
          goto LABEL_78;
        case 6:
          return 4294967294LL;
        case 7:
          goto LABEL_24;
        case 0xF:
          return big2_scanPi(a1, a2 + 4, a3, (uint64_t *)a4);
        case 0x10:
          uint64_t v11 = a2 + 4;
          if (*v11) {
            goto LABEL_78;
          }
          int v31 = *(unsigned __int8 *)(a1 + a2[5] + 136);
          if (v31 != 20)
          {
            if (v31 != 27) {
              goto LABEL_78;
            }
            return big2_scanComment(a1, a2 + 6, a3, a4);
          }

          uint64_t v11 = a2 + 6;
          uint64_t v40 = 0LL;
          while (!*v11 && v11[1] == big2_scanCdataSection_CDATA_LSQB[v40])
          {
            ++v40;
            v11 += 2;
            if (v40 == 6)
            {
              uint64_t v7 = 8LL;
              uint64_t v11 = a2 + 18;
              goto LABEL_79;
            }
          }

          goto LABEL_78;
        case 0x11:
          uint64_t v11 = a2 + 4;
          uint64_t v32 = a3 - (void)(a2 + 4);
          if (v32 < 2) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v33 = *v11;
          if (*v11 > 0xDBu)
          {
            if ((_DWORD)v33 == 255)
            {
              LODWORD(v34) = a2[5];
              goto LABEL_176;
            }

LABEL_175:
            LODWORD(v34) = a2[5];
            goto LABEL_176;
          }

          if ((v33 - 216) < 4)
          {
LABEL_137:
            goto LABEL_78;
          }

          if (*v11) {
            goto LABEL_175;
          }
          uint64_t v7 = 0LL;
          uint64_t v34 = a2[5];
          unsigned int v39 = *(unsigned __int8 *)(a1 + v34 + 136);
          if (v39 <= 0x15)
          {
            if (v39 == 6)
            {
              goto LABEL_78;
            }

            if (v39 != 7) {
              goto LABEL_79;
            }
            goto LABEL_137;
          }

          if (v39 != 22 && v39 != 24)
          {
            if (v39 != 29) {
              goto LABEL_79;
            }
LABEL_176:
          }

          uint64_t v41 = a3 - (void)a2 - 8;
          uint64_t v11 = a2 + 8;
          while (1)
          {
            uint64_t v42 = *(v11 - 2);
            if (*(v11 - 2) > 0xDBu)
            {
              if ((_DWORD)v42 == 255)
              {
                LODWORD(v43) = *(v11 - 1);
                goto LABEL_191;
              }

LABEL_190:
              LODWORD(v43) = *(v11 - 1);
              goto LABEL_191;
            }

            if (*(v11 - 2))
            {
              if ((v42 - 216) < 4)
              {
LABEL_206:
LABEL_207:
                uint64_t v7 = 0LL;
                v11 -= 2;
                goto LABEL_79;
              }

              goto LABEL_190;
            }

            uint64_t v43 = *(v11 - 1);
            int v44 = *(unsigned __int8 *)(a1 + v43 + 136);
            if (v44 != 29) {
              break;
            }
LABEL_191:
LABEL_192:
            v11 += 2;
            uint64_t v7 = 0xFFFFFFFFLL;
            BOOL v45 = v41 <= 1;
            v41 -= 2LL;
            if (v45) {
              return v7;
            }
          }

          switch(*(_BYTE *)(a1 + v43 + 136))
          {
            case 6:
              return 4294967294LL;
            case 7:
              goto LABEL_206;
            case 8:
              goto LABEL_207;
            case 9:
            case 0xA:
              goto LABEL_222;
            case 0xB:
              goto LABEL_233;
            default:
              if (v44 != 21) {
                goto LABEL_207;
              }
LABEL_222:
              if (v41 < 2) {
                return 0xFFFFFFFFLL;
              }
              break;
          }

          while (1)
          {
            if (*v11) {
              goto LABEL_78;
            }
            int v46 = *(unsigned __int8 *)(a1 + v11[1] + 136);
            v11 += 2;
            v41 -= 2LL;
            uint64_t v7 = 0xFFFFFFFFLL;
            if (v41 <= 1) {
              return v7;
            }
          }

          if (v46 != 11) {
            goto LABEL_78;
          }
          v11 += 2;
LABEL_233:
          uint64_t v7 = 5LL;
LABEL_79:
          *a4 = v11;
          return v7;
        case 0x16:
        case 0x18:
          goto LABEL_89;
        default:
          if (*(_BYTE *)(a1 + v19 + 136) != 29) {
            goto LABEL_78;
          }
          goto LABEL_88;
      }

    case 3:
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
      uint64_t v10 = a2 + 2;
      if (*v10 || a2[3] != 93) {
        goto LABEL_29;
      }
      uint64_t v17 = a2 + 4;
      if (!*v17 && a2[5] == 62)
      {
        uint64_t v7 = 0LL;
        *a4 = v17;
        return v7;
      }

      goto LABEL_29;
    case 5:
      return 4294967294LL;
    case 6:
      uint64_t v10 = a2 + 3;
      goto LABEL_29;
    case 7:
      goto LABEL_14;
    case 9:
      uint64_t v18 = a2 + 2;
      if (!*v18 && *(_BYTE *)(a1 + a2[3] + 136) == 10) {
        uint64_t v18 = a2 + 4;
      }
LABEL_74:
      *a4 = v18;
      return 7LL;
    case 0xA:
      uint64_t v18 = a2 + 2;
      goto LABEL_74;
    default:
      goto LABEL_28;
  }

uint64_t big2_cdataSectionTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = (a3 - (void)a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v4) {
    BOOL v5 = ((a3 - (void)a2) & 1) == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = &a2[v4];
  if (v5) {
    BOOL v6 = (unsigned __int8 *)a3;
  }
  if ((((_BYTE)a3 - (_BYTE)a2) & 1) == 0 || v4)
  {
    unsigned int v8 = *a2;
    if (v8 > 0xDB)
    {
      if (v8 - 220 < 4 || v8 == 255 && a2[1] > 0xFDu)
      {
        uint64_t v7 = 0LL;
        goto LABEL_51;
      }
    }

    else
    {
      if (v8 - 216 < 4)
      {
LABEL_13:
        if (v6 - a2 < 4) {
          return 4294967294LL;
        }
        unsigned int v9 = a2 + 4;
        goto LABEL_30;
      }

      if (!*a2)
      {
        uint64_t v7 = 0LL;
        switch(*(_BYTE *)(a1 + a2[1] + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_51;
          case 4:
            unsigned int v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (*v9 || a2[3] != 93) {
              goto LABEL_30;
            }
            if (v6 - (a2 + 4) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (a2[4] || a2[5] != 62) {
              goto LABEL_30;
            }
            a2 += 6;
            uint64_t v7 = 40LL;
            goto LABEL_51;
          case 5:
            if (v6 - a2 >= 2) {
              goto LABEL_29;
            }
            return 4294967294LL;
          case 6:
            if (v6 - a2 < 3) {
              return 4294967294LL;
            }
            unsigned int v9 = a2 + 3;
            goto LABEL_30;
          case 7:
            goto LABEL_13;
          case 9:
            unsigned int v9 = a2 + 2;
            if (v6 - (a2 + 2) < 2) {
              return 0xFFFFFFFFLL;
            }
            if (*v9)
            {
              uint64_t v7 = 7LL;
              goto LABEL_50;
            }

            if (*(_BYTE *)(a1 + a2[3] + 136) == 10) {
              a2 += 4;
            }
            else {
              a2 += 2;
            }
LABEL_61:
            uint64_t v7 = 7LL;
            break;
          case 0xA:
            a2 += 2;
            goto LABEL_61;
          default:
            goto LABEL_29;
        }

        goto LABEL_51;
      }
    }

uint64_t big2_ignoreSectionTok(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3, void *a4)
{
  unint64_t v4 = &a2[(a3 - a2) & 0xFFFFFFFFFFFFFFFELL];
  if (((a3 - a2) & 1) == 0) {
    unint64_t v4 = a3;
  }
  unint64_t v5 = v4 - a2;
  if (v4 - a2 < 2) {
    return 0xFFFFFFFFLL;
  }
  int v6 = 0;
  while (1)
  {
    unsigned int v7 = *a2;
    if (v7 > 0xDB)
    {
      if (v7 == 255)
      {
        if (a2[1] > 0xFDu) {
          goto LABEL_37;
        }
      }

      else if (v7 - 220 < 4)
      {
LABEL_37:
        uint64_t v9 = 0LL;
        goto LABEL_38;
      }

      goto LABEL_22;
    }

    if (v7 - 216 >= 4) {
      break;
    }
LABEL_7:
    if (v5 < 4) {
      return 4294967294LL;
    }
    unsigned int v8 = a2 + 4;
LABEL_23:
    unint64_t v5 = v4 - v8;
    a2 = v8;
    if (v4 - v8 <= 1) {
      return 0xFFFFFFFFLL;
    }
  }

  if (*a2)
  {
LABEL_22:
    unsigned int v8 = a2 + 2;
    goto LABEL_23;
  }

  uint64_t v9 = 0LL;
  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      goto LABEL_38;
    case 2:
      unsigned int v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (*v8 || a2[3] != 33) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (!*v8 && a2[5] == 91)
      {
        ++v6;
        unsigned int v8 = a2 + 6;
      }

      goto LABEL_23;
    case 4:
      unsigned int v8 = a2 + 2;
      if (v4 - (a2 + 2) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (*v8 || a2[3] != 93) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 4;
      if (v4 - (a2 + 4) < 2) {
        return 0xFFFFFFFFLL;
      }
      if (*v8 || a2[5] != 62) {
        goto LABEL_23;
      }
      unsigned int v8 = a2 + 6;
      if (v6)
      {
        --v6;
        goto LABEL_23;
      }

      uint64_t v9 = 42LL;
      a2 += 6;
LABEL_38:
      *a4 = a2;
      return v9;
    case 6:
      if (v5 < 3) {
        return 4294967294LL;
      }
      unsigned int v8 = a2 + 3;
      goto LABEL_23;
    case 7:
      goto LABEL_7;
    default:
      goto LABEL_22;
  }

uint64_t big2_attributeValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (*v4 - 216 < 4)
  {
LABEL_5:
    uint64_t v5 = 4LL;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (void)v4) <= 1)
    {
LABEL_27:
      *a4 = v4;
      return 6LL;
    }
  }

  if (*v4)
  {
    uint64_t v5 = 2LL;
    goto LABEL_6;
  }

  uint64_t v5 = 2LL;
  switch(*(_BYTE *)(a1 + v4[1] + 136))
  {
    case 2:
      uint64_t result = 0LL;
      *a4 = v4;
      return result;
    case 3:
      if (v4 != a2) {
        goto LABEL_27;
      }
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      uint64_t v5 = 3LL;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2) {
        goto LABEL_27;
      }
      unsigned int v7 = a2 + 2;
      if ((uint64_t)(a3 - (void)(a2 + 2)) < 2)
      {
        uint64_t result = 4294967293LL;
      }

      else
      {
        if (!*v7 && *(_BYTE *)(a1 + a2[3] + 136) == 10) {
          unsigned int v7 = a2 + 4;
        }
LABEL_29:
        *a4 = v7;
        uint64_t result = 7LL;
      }

      break;
    case 0xA:
      if (v4 != a2) {
        goto LABEL_27;
      }
      unsigned int v7 = a2 + 2;
      goto LABEL_29;
    default:
      if (*(_BYTE *)(a1 + v4[1] + 136) != 21) {
        goto LABEL_6;
      }
      if (v4 != a2) {
        goto LABEL_27;
      }
      *a4 = a2 + 2;
      uint64_t result = 39LL;
      break;
  }

  return result;
}

uint64_t big2_entityValueTok(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned __int8 **a4)
{
  unint64_t v4 = a2;
  while (*v4 - 216 < 4)
  {
LABEL_5:
    uint64_t v5 = 4LL;
LABEL_6:
    v4 += v5;
    if ((uint64_t)(a3 - (void)v4) <= 1)
    {
LABEL_28:
      *a4 = v4;
      return 6LL;
    }
  }

  if (*v4)
  {
    uint64_t v5 = 2LL;
    goto LABEL_6;
  }

  uint64_t v5 = 2LL;
  switch(*(_BYTE *)(a1 + v4[1] + 136))
  {
    case 3:
      if (v4 != a2) {
        goto LABEL_28;
      }
      return big2_scanRef(a1, a2 + 2, a3, a4);
    case 4:
    case 5:
    case 8:
      goto LABEL_6;
    case 6:
      uint64_t v5 = 3LL;
      goto LABEL_6;
    case 7:
      goto LABEL_5;
    case 9:
      if (v4 != a2) {
        goto LABEL_28;
      }
      unsigned int v7 = a2 + 2;
      if ((uint64_t)(a3 - (void)(a2 + 2)) < 2)
      {
        uint64_t result = 4294967293LL;
      }

      else
      {
        if (!*v7 && *(_BYTE *)(a1 + a2[3] + 136) == 10) {
          unsigned int v7 = a2 + 4;
        }
LABEL_31:
        *a4 = v7;
        uint64_t result = 7LL;
      }

      break;
    case 0xA:
      if (v4 != a2) {
        goto LABEL_28;
      }
      unsigned int v7 = a2 + 2;
      goto LABEL_31;
    default:
      if (*(_BYTE *)(a1 + v4[1] + 136) != 30) {
        goto LABEL_6;
      }
      if (v4 != a2) {
        goto LABEL_28;
      }
      LODWORD(result) = big2_scanPercent(a1, a2 + 2, a3, a4);
      if ((_DWORD)result == 22) {
        uint64_t result = 0LL;
      }
      else {
        uint64_t result = result;
      }
      break;
  }

  return result;
}

BOOL big2_nameMatchesAscii(uint64_t a1, _BYTE *a2, _BYTE *a3, _BYTE *a4)
{
  int v4 = *a4;
  if (!*a4) {
    return a2 == a3;
  }
  uint64_t v5 = a4 + 1;
  uint64_t v6 = a3 - a2;
  while (1)
  {
    BOOL v8 = __OFSUB__(v6, 2LL);
    BOOL v7 = v6 - 2 < 0;
    v6 -= 2LL;
    a2 += 2;
    int v9 = *v5++;
    int v4 = v9;
    if (!v9) {
      return a2 == a3;
    }
  }

  return 0LL;
}

uint64_t big2_nameLength(uint64_t a1, unsigned __int8 *a2)
{
  for (uint64_t i = a2; ; i += v4)
  {
    unsigned int v3 = *i;
    if (v3 > 0xDB)
    {
      if (v3 == 255)
      {
        if (i[1] > 0xFDu) {
          return ((_DWORD)i - (_DWORD)a2);
        }
        uint64_t v4 = 2LL;
      }

      else
      {
        uint64_t v4 = 2LL;
        if (v3 - 220 < 4) {
          return ((_DWORD)i - (_DWORD)a2);
        }
      }

      continue;
    }

    if (v3 - 216 < 4)
    {
      uint64_t v4 = 4LL;
      continue;
    }

    uint64_t v4 = 2LL;
    if (!*i) {
      break;
    }
LABEL_5:
    ;
  }

  unsigned int v5 = *(unsigned __int8 *)(a1 + i[1] + 136) - 5;
  if (v5 < 0x19 && ((0x17E0007u >> v5) & 1) != 0)
  {
    uint64_t v4 = qword_185011048[(char)v5];
    goto LABEL_5;
  }

  return ((_DWORD)i - (_DWORD)a2);
}

_BYTE *big2_skipS(uint64_t a1, _BYTE *a2)
{
  if (!*a2)
  {
    do
    {
      unsigned int v2 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      BOOL v3 = v2 > 0x15;
      int v4 = (1 << v2) & 0x200600;
      if (v3 || v4 == 0) {
        break;
      }
      int v6 = a2[2];
      a2 += 2;
    }

    while (!v6);
  }

  return a2;
}

uint64_t big2_getAtts(uint64_t a1, unsigned __int8 *a2, int a3, uint64_t a4)
{
  uint64_t result = 0LL;
  int v6 = 0;
  uint64_t v7 = 1LL;
  while (1)
  {
    while (1)
    {
      uint64_t v8 = v7;
      int v9 = a2;
      unint64_t v10 = a2 + 2;
      unsigned int v11 = a2[2];
      if (v11 > 0xDB) {
        break;
      }
      if (v11 - 216 >= 4)
      {
        if (a2[2]) {
          goto LABEL_16;
        }
        unint64_t v14 = a2 + 3;
        uint64_t v13 = a2[3];
        a2 += 2;
        switch(*(_BYTE *)(a1 + v13 + 136))
        {
          case 3:
            a2 = v10;
            if ((int)result < a3)
            {
              *(_BYTE *)(a4 + 32LL * (int)result + 24) = 0;
              a2 = v10;
            }

            continue;
          case 5:
          case 0x16:
          case 0x18:
          case 0x1D:
            goto LABEL_16;
          case 6:
            a2 = v9 + 3;
            if (!(_DWORD)v7)
            {
              uint64_t v7 = 1LL;
              a2 = v9 + 3;
              if ((int)result < a3)
              {
                uint64_t v17 = a4 + 32LL * (int)result;
                *(void *)uint64_t v17 = v10;
                *(_BYTE *)(v17 + 24) = 1;
                a2 = v14;
              }
            }

            continue;
          case 7:
            goto LABEL_4;
          case 9:
          case 0xA:
            uint64_t v7 = 0LL;
            a2 = v10;
            if ((_DWORD)v8 == 1) {
              continue;
            }
            a2 = v10;
            uint64_t v7 = v8;
            if ((_DWORD)v8 != 2) {
              continue;
            }
            a2 = v10;
            *(_BYTE *)(a4 + 32LL * (int)result + 24) = 0;
            goto LABEL_66;
          case 0xB:
          case 0x11:
            uint64_t v7 = 2LL;
            a2 = v10;
            if ((_DWORD)v8 == 2) {
              continue;
            }
            return result;
          case 0xC:
            if ((_DWORD)v7 == 2)
            {
              uint64_t v7 = 2LL;
              a2 = v10;
              if (v6 == 12)
              {
                uint64_t v7 = 0LL;
                uint64_t result = (result + 1);
                int v6 = 12;
                a2 = v10;
              }

              continue;
            }

            int v6 = 12;
            uint64_t v7 = 2LL;
            a2 = v10;
            *(void *)(a4 + 32LL * (int)result + 8) = v9 + 4;
            int v6 = 12;
            goto LABEL_66;
          case 0xD:
            if ((_DWORD)v7 == 2)
            {
              uint64_t v7 = 2LL;
              a2 = v10;
              if (v6 == 13)
              {
                uint64_t v7 = 0LL;
                uint64_t result = (result + 1);
                int v6 = 13;
                a2 = v10;
              }

              continue;
            }

            int v6 = 13;
            uint64_t v7 = 2LL;
            a2 = v10;
            *(void *)(a4 + 32LL * (int)result + 8) = v9 + 4;
            int v6 = 13;
            goto LABEL_66;
          case 0x15:
            uint64_t v7 = 0LL;
            a2 = v10;
            if ((_DWORD)v8 == 1) {
              continue;
            }
            a2 = v10;
            uint64_t v7 = v8;
            if ((_DWORD)v8 != 2) {
              continue;
            }
            a2 = v10;
            uint64_t v18 = a4 + 32LL * (int)result;
            int v20 = *(unsigned __int8 *)(v18 + 24);
            uint64_t v19 = (_BYTE *)(v18 + 24);
            uint64_t v7 = 2LL;
            a2 = v10;
            if (!v20) {
              continue;
            }
            unsigned int v21 = v9[4];
            if (v21 > 0xDB)
            {
              if (v21 - 220 < 4)
              {
                int v22 = 8;
                goto LABEL_64;
              }

              if (v21 == 255 && v9[5] > 0xFDu)
              {
                int v22 = 0;
                goto LABEL_64;
              }

uint64_t big2_charRefNumber(uint64_t a1, _BYTE *a2)
{
  if (!a2[4] && a2[5] == 120)
  {
    uint64_t v2 = 0LL;
    for (uint64_t i = a2 + 7; ; i += 2)
    {
      if (!*(i - 1))
      {
        int v4 = *i;
        if (v4 == 59) {
          return checkCharRefNumber(v2);
        }
        int v5 = v4 - 48;
        if ((v4 - 48) <= 0x36)
        {
          if (((1LL << v5) & 0x3FF) != 0)
          {
            uint64_t v2 = v5 | (16 * v2);
          }

          else if (((1LL << v5) & 0x7E0000) != 0)
          {
            uint64_t v2 = (v4 + 16 * v2 - 55);
          }

          else
          {
            if (((1LL << v5) & 0x7E000000000000LL) == 0) {
              continue;
            }
            uint64_t v2 = (v4 + 16 * v2 - 87);
          }
        }
      }
    }
  }

  uint64_t v2 = 0LL;
  for (uint64_t j = a2 + 5; *(j - 1); j += 2)
  {
    int v7 = -1;
LABEL_19:
    uint64_t v2 = (v7 + 10 * v2 - 48);
  }

  int v7 = *j;
  if (v7 != 59) {
    goto LABEL_19;
  }
  return checkCharRefNumber(v2);
}

uint64_t big2_predefinedEntityName(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v3 = (a3 - (uint64_t)a2) / 2;
  if (v3 == 4)
  {
    if (!*a2)
    {
      int v7 = (char)a2[1];
      if (v7 == 97)
      {
        if (!a2[2] && a2[3] == 112 && !a2[4] && a2[5] == 111 && !a2[6] && a2[7] == 115) {
          return 39LL;
        }
      }

      else if (v7 == 113 && !a2[2] && a2[3] == 117 && !a2[4] && a2[5] == 111 && !a2[6] && a2[7] == 116)
      {
        return 34LL;
      }
    }

    return 0LL;
  }

  if (v3 == 3)
  {
    if (!*a2 && a2[1] == 97 && !a2[2] && a2[3] == 109 && !a2[4] && a2[5] == 112) {
      return 38LL;
    }
    return 0LL;
  }

  if (v3 != 2 || a2[2] || a2[3] != 116 || *a2) {
    return 0LL;
  }
  int v4 = a2[1];
  if (v4 == 103) {
    unsigned int v5 = 62;
  }
  else {
    unsigned int v5 = 0;
  }
  if (v4 == 108) {
    return 60LL;
  }
  else {
    return v5;
  }
}

uint64_t big2_updatePosition(uint64_t result, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (a3 - (uint64_t)a2 >= 2)
  {
    do
    {
      if (*a2 - 216 >= 4)
      {
        if (!*a2)
        {
          switch(*(_BYTE *)(result + a2[1] + 136))
          {
            case 6:
              a2 += 3;
              goto LABEL_7;
            case 7:
              goto LABEL_3;
            case 9:
              ++*a4;
              int v4 = a2 + 2;
              a4[1] = 0LL;
              a2 = v4;
              break;
            case 0xA:
              ++*a4;
              a4[1] = 0LL;
              a2 += 2;
              break;
            default:
              goto LABEL_6;
          }

          continue;
        }

uint64_t big2_isPublicId(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  int v4 = (_BYTE *)(a2 + 2);
  uint64_t v5 = a3 - (a2 + 2) - 2;
  if (v5 >= 2)
  {
    do
    {
      if (*v4)
      {
LABEL_15:
        uint64_t result = 0LL;
        *a4 = v4;
        return result;
      }

      uint64_t v6 = v4[1];
      int v7 = (char)v6;
      uint64_t v8 = *(unsigned __int8 *)(a1 + v6 + 136);
      if (v8 <= 0x23)
      {
        if (((1LL << v8) & 0xFCB8FE600LL) != 0) {
          goto LABEL_5;
        }
        if (((1LL << v8) & 0x4400000) != 0)
        {
          if ((v7 & 0x80000000) == 0) {
            goto LABEL_5;
          }
        }

        else if (v8 == 21)
        {
          if (v7 == 9) {
            goto LABEL_15;
          }
          goto LABEL_5;
        }
      }

      if (v7 != 64 && v7 != 36) {
        goto LABEL_15;
      }
LABEL_5:
      v4 += 2;
      v5 -= 2LL;
    }

    while (v5 > 1);
  }

  return 1LL;
}

uint64_t big2_toUtf8(uint64_t a1, unsigned __int8 **a2, uint64_t a3, _BYTE **a4, _BYTE *a5)
{
  uint64_t v5 = *a2;
  int64_t v6 = (a3 - (void)*a2) & 0xFFFFFFFFFFFFFFFELL;
  if (v6 >= 1)
  {
    int v7 = &v5[v6];
    do
    {
      unsigned int v8 = v5[1];
      int v9 = (char)v8;
      unsigned int v10 = *v5;
      if (v10 - 1 >= 7)
      {
        if (v10 - 216 < 4)
        {
          uint64_t v16 = *a4;
          if (a5 - *a4 < 4) {
            goto LABEL_21;
          }
          if (v7 - v5 < 4)
          {
            uint64_t result = 1LL;
            goto LABEL_23;
          }

          unsigned int v17 = ((v8 >> 6) & 0xFFFFFFF3 | (4 * (v10 & 3))) + 1;
          *a4 = v16 + 1;
          *uint64_t v16 = (v17 >> 2) | 0xF0;
          LOBYTE(v17) = (v8 >> 2) & 0xF | (16 * (v17 & 3)) | 0x80;
          uint64_t v18 = (*a4)++;
          *uint64_t v18 = v17;
          unsigned __int8 v19 = v5[2];
          v5 += 2;
          LOBYTE(v18) = v5[1];
          int v20 = (*a4)++;
          _BYTE *v20 = (v18 >> 6) & 0xC3 | (16 * (v9 & 3)) | (4 * (v19 & 3)) | 0x80;
          LOBYTE(v9) = v18 & 0x3F | 0x80;
          unsigned int v21 = *a4;
          goto LABEL_11;
        }

        if (*v5)
        {
          int v22 = *a4;
          if (a5 - *a4 < 3)
          {
LABEL_21:
            uint64_t result = 2LL;
            goto LABEL_23;
          }

          *a4 = v22 + 1;
          _BYTE *v22 = (v10 >> 4) | 0xE0;
          char v13 = (4 * (v10 & 0xF)) | (v9 >> 6) | 0x80;
          unsigned int v11 = *a4;
          goto LABEL_6;
        }

        if (((char)v8 & 0x80000000) == 0)
        {
          unsigned int v21 = *a4;
          if (*a4 == a5) {
            goto LABEL_21;
          }
LABEL_11:
          *a4 = v21 + 1;
          _BYTE *v21 = v9;
          goto LABEL_12;
        }
      }

      unsigned int v11 = *a4;
      if (a5 - *a4 < 2) {
        goto LABEL_21;
      }
      HIDWORD(v12) = *v5;
      LODWORD(v12) = v9 << 24;
      char v13 = (v12 >> 30) | 0xC0;
LABEL_6:
      *a4 = v11 + 1;
      *unsigned int v11 = v13;
      char v14 = v9 & 0x3F | 0x80;
      uint64_t v15 = (*a4)++;
      *uint64_t v15 = v14;
LABEL_12:
      v5 += 2;
    }

    while (v5 < v7);
  }

  uint64_t result = 0LL;
LABEL_23:
  *a2 = v5;
  return result;
}

uint64_t big2_toUtf16( uint64_t a1, unsigned __int16 **a2, uint64_t a3, unint64_t *a4, unint64_t a5)
{
  uint64_t v5 = *a2;
  int64_t v6 = (a3 - (void)*a2) & 0xFFFFFFFFFFFFFFFELL;
  int v7 = (unsigned __int16 *)((char *)*a2 + v6);
  if (v6 <= (uint64_t)(a5 - *a4))
  {
    uint64_t result = 0LL;
  }

  else
  {
    int v8 = *(_BYTE *)(v7 - 1) & 0xF8;
    uint64_t result = v8 == 216;
    if (v8 == 216) {
      --v7;
    }
  }

  while (v5 < v7)
  {
    unsigned int v10 = (_WORD *)*a4;
    if (*a4 >= a5)
    {
      if (*a4 == a5) {
        return 2LL;
      }
      return result;
    }

    *unsigned int v10 = bswap32(*v5) >> 16;
    *a4 = (unint64_t)(v10 + 1);
    uint64_t v5 = *a2 + 1;
    *a2 = v5;
  }

  return result;
}

uint64_t big2_scanLit(int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 **a5)
{
  unint64_t v5 = a4 - (void)a3;
  while (1)
  {
    unsigned int v6 = *a3;
    if (v6 > 0xDB)
    {
      if (v6 == 255)
      {
        if (a3[1] > 0xFDu) {
          goto LABEL_20;
        }
      }

      else if (v6 - 220 < 4)
      {
LABEL_20:
        uint64_t result = 0LL;
        *a5 = a3;
        return result;
      }

      goto LABEL_14;
    }

    if (v6 - 216 >= 4)
    {
      if (!*a3)
      {
        switch(*(_BYTE *)(a2 + a3[1] + 136))
        {
          case 0:
          case 1:
          case 8:
            goto LABEL_20;
          case 6:
            if (v5 < 3) {
              return 4294967294LL;
            }
            int v7 = a3 + 3;
            goto LABEL_15;
          case 7:
            goto LABEL_4;
          case 0xC:
          case 0xD:
            int v7 = a3 + 2;
            *a5 = v7;
            if (*v7) {
              return 0LL;
            }
            unsigned int v9 = *(unsigned __int8 *)(a2 + a3[3] + 136);
            BOOL v10 = v9 > 0x1E;
            int v11 = (1 << v9) & 0x40300E00;
            if (v10 || v11 == 0) {
              return 0LL;
            }
            else {
              return 27LL;
            }
          default:
            break;
        }
      }

uint64_t big2_scanDecl(uint64_t a1, _BYTE *a2, uint64_t a3, void *a4)
{
  if (!*a2)
  {
    switch(*(_BYTE *)(a1 + a2[1] + 136))
    {
      case 0x14:
        *a4 = a2 + 2;
        return 33LL;
      case 0x16:
      case 0x18:
        unint64_t v5 = a2 + 2;
        uint64_t v6 = a3 - (void)(a2 + 2);
        if (v6 < 2) {
          return 0xFFFFFFFFLL;
        }
        while (2)
        {
          if (*v5)
          {
LABEL_20:
            uint64_t v4 = 0LL;
            *a4 = v5;
          }

          else
          {
            switch(*(_BYTE *)(a1 + v5[1] + 136))
            {
              case 0x15:
                goto LABEL_13;
              case 0x16:
              case 0x18:
                v5 += 2;
                v6 -= 2LL;
                uint64_t v4 = 0xFFFFFFFFLL;
                if (v6 > 1) {
                  continue;
                }
                return v4;
              case 0x17:
              case 0x19:
              case 0x1A:
              case 0x1B:
              case 0x1C:
              case 0x1D:
                goto LABEL_20;
              case 0x1E:
                if (!v5[2])
                {
                  unsigned int v8 = *(unsigned __int8 *)(a1 + v5[3] + 136);
                  BOOL v9 = v8 > 0x1E;
                  int v10 = (1 << v8) & 0x40200600;
                  if (!v9 && v10 != 0) {
                    goto LABEL_20;
                  }
                }

                goto LABEL_13;
              default:
LABEL_13:
                *a4 = v5;
                uint64_t v4 = 16LL;
                break;
            }
          }

          return v4;
        }

      case 0x1B:
        return big2_scanComment(a1, a2 + 2, a3, a4);
      default:
        break;
    }
  }

  uint64_t v4 = 0LL;
  *a4 = a2;
  return v4;
}

uint64_t big2_scanPi(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a3 - (void)a2 - 2;
  uint64_t v10 = *a2;
  if (*a2 > 0xDBu)
  {
    if ((_DWORD)v10 == 255)
    {
      LODWORD(v12) = a2[1];
      goto LABEL_18;
    }

    goto LABEL_17;
  }

  if (*a2)
  {
LABEL_17:
    LODWORD(v12) = a2[1];
    goto LABEL_18;
  }

  uint64_t v12 = a2[1];
  unsigned int v13 = *(unsigned __int8 *)(a1 + v12 + 136);
  if (v13 <= 0x15)
  {
    if (v13 == 5) {
      goto LABEL_7;
    }
    if (v13 == 6)
    {
      if (v4 < 3) {
        return 4294967294LL;
      }
      goto LABEL_7;
    }

    if (v13 != 7) {
      goto LABEL_7;
    }
LABEL_4:
    if (v4 < 4) {
      return 4294967294LL;
    }
LABEL_7:
    uint64_t result = 0LL;
    *a4 = (uint64_t)a2;
    return result;
  }

  if (v13 != 22 && v13 != 24)
  {
    if (v13 != 29) {
      goto LABEL_7;
    }
LABEL_18:
  }

  if (v5 < 2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v15 = 0LL;
  uint64_t result = 0xFFFFFFFFLL;
  while (1)
  {
    uint64_t v16 = a2[v15 + 2];
    if (a2[v15 + 2] <= 0xDBu)
    {
      if (!a2[v15 + 2])
      {
        uint64_t v17 = a2[v15 + 3];
        switch(*(_BYTE *)(a1 + v17 + 136))
        {
          case 5:
            goto LABEL_45;
          case 6:
            return 4294967294LL;
          case 7:
            goto LABEL_44;
          case 9:
          case 0xA:
          case 0x15:
            unsigned __int8 v19 = &a2[v15];
            uint64_t v20 = (uint64_t)&a2[v15 + 2];
            uint64_t result = big2_checkPiTarget(a2, v20, &v27);
            if (!(_DWORD)result)
            {
              *a4 = v20;
              return result;
            }

            unint64_t v21 = v5 - 2;
            if (v5 - 2 < 2) {
              return 0xFFFFFFFFLL;
            }
            int v22 = v19 + 4;
            uint64_t result = 0xFFFFFFFFLL;
            while (2)
            {
              unsigned int v23 = *v22;
              if (v23 <= 0xDB)
              {
                if (v23 - 216 < 4)
                {
LABEL_54:
                  if (v21 < 4) {
                    return 4294967294LL;
                  }
                  uint64_t v24 = v22 + 4;
LABEL_65:
                  unint64_t v21 = a3 - (void)v24;
                  int v22 = v24;
                  continue;
                }

                if (!*v22)
                {
                  switch(*(_BYTE *)(a1 + v22[1] + 136))
                  {
                    case 0:
                    case 1:
                    case 8:
                      goto LABEL_83;
                    case 6:
                      if (v21 < 3) {
                        return 4294967294LL;
                      }
                      uint64_t v24 = v22 + 3;
                      goto LABEL_65;
                    case 7:
                      goto LABEL_54;
                    case 0xF:
                      uint64_t v24 = v22 + 2;
                      if (*v24 || v22[3] != 62) {
                        goto LABEL_65;
                      }
                      uint64_t v25 = (uint64_t)(v22 + 4);
                      break;
                    default:
                      goto LABEL_64;
                  }

uint64_t big2_scanPercent(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a3 - (void)a2 - 2;
  uint64_t v6 = *a2;
  if (*a2 > 0xDBu)
  {
  }

  else
  {
    if (!*a2)
    {
      uint64_t v7 = 0LL;
      unsigned int v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      if (v8 > 0x14)
      {
        switch(*(_BYTE *)(a1 + a2[1] + 136))
        {
          case 0x15:
          case 0x1E:
            goto LABEL_36;
          case 0x16:
          case 0x18:
            goto LABEL_15;
          case 0x1D:
            goto LABEL_14;
          default:
            goto LABEL_8;
        }
      }

      if (v8 - 9 < 2)
      {
LABEL_36:
        uint64_t v7 = 22LL;
        goto LABEL_8;
      }

      if (v8 == 6)
      {
        if (v4 < 3) {
          return 4294967294LL;
        }
        goto LABEL_7;
      }

      if (v8 != 7) {
        goto LABEL_8;
      }
LABEL_4:
      if (v4 < 4) {
        return 4294967294LL;
      }
LABEL_7:
      uint64_t v7 = 0LL;
      goto LABEL_8;
    }
  }

uint64_t big2_scanPoundName(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = *a2;
  if (*a2 > 0xDBu)
  {
    goto LABEL_8;
  }

  if (*a2) {
    goto LABEL_21;
  }
  uint64_t v6 = 0LL;
  unsigned int v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
  if (v8 <= 0x15)
  {
    if (v8 != 6)
    {
      if (v8 == 7)
      {
LABEL_4:
        if (v4 >= 4) {
          goto LABEL_8;
        }
        return 4294967294LL;
      }

uint64_t big2_scanComment(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  if (*a2 || a2[1] != 45)
  {
LABEL_26:
    uint64_t v7 = 0LL;
    goto LABEL_27;
  }

  a2 += 2;
  unint64_t v4 = a3 - (void)a2;
  while (1)
  {
    unsigned int v5 = *a2;
    if (v5 > 0xDB)
    {
      if (v5 == 255)
      {
        if (a2[1] > 0xFDu) {
          goto LABEL_26;
        }
      }

      else if (v5 - 220 < 4)
      {
        goto LABEL_26;
      }

      goto LABEL_23;
    }

    if (v5 - 216 >= 4) {
      break;
    }
LABEL_7:
    if (v4 < 4) {
      return 4294967294LL;
    }
    uint64_t v6 = a2 + 4;
LABEL_24:
    unint64_t v4 = a3 - (void)v6;
    uint64_t v7 = 0xFFFFFFFFLL;
    a2 = v6;
  }

  if (*a2)
  {
LABEL_23:
    uint64_t v6 = a2 + 2;
    goto LABEL_24;
  }

  uint64_t v7 = 0LL;
  switch(*(_BYTE *)(a1 + a2[1] + 136))
  {
    case 0:
    case 1:
    case 8:
      break;
    case 2:
    case 3:
    case 4:
    case 5:
      goto LABEL_23;
    case 6:
      if (v4 < 3) {
        return 4294967294LL;
      }
      uint64_t v6 = a2 + 3;
      goto LABEL_24;
    case 7:
      goto LABEL_7;
    default:
      if (*(_BYTE *)(a1 + a2[1] + 136) != 27) {
        goto LABEL_23;
      }
      uint64_t v6 = a2 + 2;
      if (*v6 || a2[3] != 45) {
        goto LABEL_24;
      }
      if (a2[4])
      {
        uint64_t v7 = 0LL;
        a2 += 4;
      }

      else
      {
        int v9 = a2[5];
        if (v9 == 62) {
          a2 += 6;
        }
        else {
          a2 += 4;
        }
        if (v9 == 62) {
          uint64_t v7 = 13LL;
        }
        else {
          uint64_t v7 = 0LL;
        }
      }

      break;
  }

BOOL big2_checkPiTarget(_BYTE *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 11;
  if (a2 - (void)a1 != 6 || *a1) {
    return 1LL;
  }
  int v4 = (char)a1[1];
  if (v4 == 120)
  {
    int v5 = 0;
  }

  else
  {
    if (v4 != 88) {
      return 1LL;
    }
    int v5 = 1;
  }

  if (a1[2]) {
    return 1LL;
  }
  int v6 = (char)a1[3];
  if (v6 != 109)
  {
    if (v6 != 77) {
      return 1LL;
    }
    int v5 = 1;
  }

  if (a1[4]) {
    return 1LL;
  }
  int v7 = (char)a1[5];
  if (v7 == 108)
  {
    if (v5) {
      return 0LL;
    }
    *a3 = 12;
    return 1LL;
  }

  return v7 != 76;
}

uint64_t big2_scanRef(uint64_t a1, unsigned __int8 *a2, uint64_t a3, void *a4)
{
  unint64_t v4 = a3 - (void)a2;
  uint64_t v5 = a3 - (void)a2 - 2;
  uint64_t v6 = *a2;
  if (*a2 > 0xDBu)
  {
  }

  else
  {
    if (!*a2)
    {
      uint64_t v7 = 0LL;
      unsigned int v8 = *(unsigned __int8 *)(a1 + a2[1] + 136);
      if (v8 <= 0x15)
      {
        if (v8 == 6)
        {
          if (v4 < 3) {
            return 4294967294LL;
          }
          goto LABEL_7;
        }

        if (v8 == 7)
        {
LABEL_4:
          if (v4 < 4) {
            return 4294967294LL;
          }
LABEL_7:
          uint64_t v7 = 0LL;
          goto LABEL_8;
        }

        if (v8 != 19) {
          goto LABEL_8;
        }
        int v9 = a2 + 2;
        if (a3 - (uint64_t)(a2 + 2) >= 2)
        {
          if (*v9) {
            goto LABEL_16;
          }
          uint64_t v14 = a2[3];
          if (v14 == 120)
          {
            int v9 = a2 + 4;
            if (!*v9 && (*(_BYTE *)(a1 + a2[5] + 136) & 0xFE) == 0x18)
            {
              a2 += 6;
              uint64_t v15 = a3 - (void)a2;
              if (a3 - (uint64_t)a2 >= 2)
              {
                while (!*a2)
                {
                  int v16 = *(unsigned __int8 *)(a1 + a2[1] + 136);
                  if ((v16 - 24) >= 2)
                  {
                    if (v16 != 18) {
                      goto LABEL_7;
                    }
                    a2 += 2;
                    uint64_t v7 = 10LL;
                    goto LABEL_8;
                  }

                  a2 += 2;
                  v15 -= 2LL;
                  uint64_t v7 = 0xFFFFFFFFLL;
                  if (v15 <= 1) {
                    return v7;
                  }
                }

                goto LABEL_7;
              }

              return 0xFFFFFFFFLL;
            }
          }

          else if (*(_BYTE *)(a1 + v14 + 136) == 25)
          {
            int v9 = a2 + 4;
            uint64_t v17 = v4 - 4;
            while (1)
            {
              BOOL v18 = v17 < 2;
              v17 -= 2LL;
              if (v18) {
                return 0xFFFFFFFFLL;
              }
              a2 = v9;
              if (*v9) {
                goto LABEL_7;
              }
              int v19 = *(unsigned __int8 *)(a1 + v9[1] + 136);
              v9 += 2;
              if (v19 != 25)
              {
                if (v19 != 18) {
                  goto LABEL_7;
                }
                uint64_t v7 = 10LL;
                goto LABEL_17;
              }
            }
          }

LABEL_55:
LABEL_56:
  uint64_t v7 = 0LL;
  a2 -= 2;
LABEL_8:
  *a4 = a2;
  return v7;
}

uint64_t big2_scanAtts(uint64_t a1, unsigned __int8 *a2, uint64_t a3, unsigned __int8 **a4)
{
  uint64_t v33 = a2;
  unint64_t v4 = a3 - (void)a2;
  int v7 = 0;
  uint64_t v8 = a3 - 4;
  while (1)
  {
    uint64_t v9 = *a2;
    if (*a2 <= 0xDBu) {
      break;
    }
    if ((_DWORD)v9 == 255)
    {
      LODWORD(v11) = a2[1];
      goto LABEL_22;
    }

LABEL_21:
    LODWORD(v11) = a2[1];
LABEL_22:
LABEL_23:
    a2 += 2;
LABEL_24:
    uint64_t v33 = a2;
LABEL_25:
    unint64_t v4 = a3 - (void)a2;
  }

  if (*a2)
  {
    if ((v9 - 216) < 4)
    {
LABEL_103:
      if (v4 >= 4)
      {
LABEL_108:
        uint64_t result = 0LL;
        goto LABEL_109;
      }

      return 4294967294LL;
    }

    goto LABEL_21;
  }

  uint64_t result = 0LL;
  uint64_t v11 = a2[1];
  switch(*(_BYTE *)(a1 + v11 + 136))
  {
    case 6:
      if (v4 >= 3) {
        goto LABEL_108;
      }
      return 4294967294LL;
    case 7:
      goto LABEL_103;
    case 9:
    case 0xA:
    case 0x15:
      a2 += 2;
      uint64_t v12 = a3 - (void)a2;
      while (2)
      {
        if (*a2) {
          goto LABEL_108;
        }
        int v13 = *(unsigned __int8 *)(a1 + a2[1] + 136);
        if ((v13 - 9) < 2 || v13 == 21)
        {
          a2 += 2;
          v12 -= 2LL;
          if (v12 <= 1) {
            return 0xFFFFFFFFLL;
          }
          continue;
        }

        break;
      }

      if (v13 != 14) {
        goto LABEL_108;
      }
      uint64_t v33 = a2;
LABEL_37:
      uint64_t v15 = a2 + 2;
      for (uint64_t i = v8 - (void)a2; ; i -= 2LL)
      {
        if (*v15) {
          goto LABEL_115;
        }
        unsigned int v21 = *(unsigned __int8 *)(a1 + v15[1] + 136);
        if ((v21 & 0xFE) == 0xC) {
          break;
        }
        if (v21 > 0x15 || ((1 << v21) & 0x200600) == 0) {
          goto LABEL_115;
        }
        v15 += 2;
        uint64_t result = 0xFFFFFFFFLL;
        if (i <= 1) {
          return result;
        }
      }

      v15 += 2;
      uint64_t v33 = v15;
      if (i < 2) {
        return 0xFFFFFFFFLL;
      }
      while (2)
      {
        unsigned int v24 = *v15;
        if (v24 > 0xDB)
        {
          if (v24 - 220 < 4)
          {
            int v25 = 8;
            goto LABEL_63;
          }

          if (v24 == 255 && v15[1] > 0xFDu)
          {
            int v25 = 0;
            goto LABEL_63;
          }
        }

        else
        {
          if (v24 - 216 < 4)
          {
            int v25 = 7;
            goto LABEL_63;
          }

          if (!*v15)
          {
            int v25 = *(unsigned __int8 *)(a1 + v15[1] + 136);
            goto LABEL_63;
          }
        }

        int v25 = 29;
LABEL_63:
        if (v25 == v21)
        {
          a2 = v15 + 2;
          uint64_t v33 = v15 + 2;
          if (*a2) {
            goto LABEL_108;
          }
          uint64_t result = 0LL;
          unsigned int v27 = *(unsigned __int8 *)(a1 + v15[3] + 136);
          if (v27 <= 0xA)
          {
            if (v27 - 9 >= 2) {
              goto LABEL_109;
            }
            goto LABEL_89;
          }

          if (v27 == 21)
          {
LABEL_89:
            uint64_t v28 = v15 + 4;
            uint64_t v29 = a3 - (void)(v15 + 4);
            if (v29 < 2) {
              return 0xFFFFFFFFLL;
            }
            a2 = v15 + 6;
            while (2)
            {
              uint64_t v30 = *(a2 - 2);
              if (!*(a2 - 2))
              {
                switch(*(_BYTE *)(a1 + *(a2 - 1) + 136))
                {
                  case 6:
                    return 4294967294LL;
                  case 7:
                    goto LABEL_105;
                  case 9:
                  case 0xA:
                  case 0x15:
                    v28 += 2;
                    v29 -= 2LL;
                    a2 += 2;
                    uint64_t result = 0xFFFFFFFFLL;
                    if (v29 <= 1) {
                      return result;
                    }
                    continue;
                  case 0xB:
                    a2 -= 2;
                    goto LABEL_124;
                  case 0x11:
                    a2 -= 2;
                    goto LABEL_126;
                  case 0x16:
                  case 0x18:
                    goto LABEL_102;
                  case 0x1D:
                    goto LABEL_100;
                  default:
                    goto LABEL_106;
                }
              }

              break;
            }

            if ((v30 - 216) < 4)
            {
LABEL_105:
              if ((unint64_t)v29 >= 4)
              {
LABEL_106:
                uint64_t result = 0LL;
                a2 -= 2;
                goto LABEL_109;
              }

              return 4294967294LL;
            }

            if ((_DWORD)v30 == 255)
            {
              uint64_t v33 = a2 - 2;
              unsigned int v31 = *(a2 - 1);
              if (v31 >= 0xFE)
              {
                uint64_t result = 0LL;
                a2 -= 2;
                goto LABEL_109;
              }
            }

            else
            {
LABEL_100:
              uint64_t v33 = a2 - 2;
              unsigned int v31 = *(a2 - 1);
            }

            if (((namingBitmap[(v31 >> 5) | (8 * nmstrtPages[v30])] >> v31) & 1) == 0)
            {
              uint64_t result = 0LL;
              a2 = v28;
              goto LABEL_109;
            }

LABEL_102:
            int v7 = 0;
            goto LABEL_24;
          }

          if (v27 == 11)
          {
LABEL_124:
            a2 += 2;
            uint64_t result = 1LL;
            goto LABEL_109;
          }

          if (v27 != 17) {
            goto LABEL_109;
          }
LABEL_126:
          uint64_t v15 = a2 + 2;
          uint64_t v33 = a2 + 2;
          if (a3 - (uint64_t)(a2 + 2) >= 2)
          {
            if (!*v15)
            {
              int v32 = a2[3];
              if (v32 == 62) {
                a2 += 4;
              }
              else {
                a2 += 2;
              }
              if (v32 == 62) {
                uint64_t result = 3LL;
              }
              else {
                uint64_t result = 0LL;
              }
              goto LABEL_109;
            }

LABEL_115:
            uint64_t result = 0LL;
            a2 = v15;
LABEL_109:
            *a4 = a2;
            return result;
          }

          return 0xFFFFFFFFLL;
        }

        switch(v25)
        {
          case 0:
          case 1:
          case 2:
          case 8:
            goto LABEL_115;
          case 3:
            uint64_t v26 = a4;
            uint64_t result = big2_scanRef(a1, v15 + 2, a3, &v33);
            if ((int)result >= 1)
            {
              uint64_t v15 = v33;
              a4 = v26;
LABEL_73:
              uint64_t i = a3 - (void)v15;
              uint64_t result = 0xFFFFFFFFLL;
              continue;
            }

            if (!(_DWORD)result)
            {
              a4 = v26;
              a2 = v33;
              goto LABEL_109;
            }

            return result;
          case 6:
            v15 += 3;
            goto LABEL_72;
          case 7:
            v15 += 4;
            goto LABEL_72;
          default:
            v15 += 2;
LABEL_72:
            uint64_t v33 = v15;
            goto LABEL_73;
        }
      }

    case 0xE:
      goto LABEL_37;
    case 0x16:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
      goto LABEL_23;
    case 0x17:
      if (v7) {
        goto LABEL_108;
      }
      uint64_t v15 = a2 + 2;
      uint64_t v33 = a2 + 2;
      uint64_t v16 = a3 - (void)(a2 + 2);
      if (v16 < 2) {
        return 0xFFFFFFFFLL;
      }
      uint64_t v17 = *v15;
      if (*v15 > 0xDBu)
      {
        if ((_DWORD)v17 == 255)
        {
          LODWORD(v18) = a2[3];
LABEL_79:
          goto LABEL_80;
        }
      }

      else
      {
        if (!*v15)
        {
          uint64_t v18 = a2[3];
          unsigned int v19 = *(unsigned __int8 *)(a1 + v18 + 136);
          if (v19 <= 0x17)
          {
            if (v19 != 22)
            {
              if (v19 == 6)
              {
              }

              else if (v19 == 7)
              {
LABEL_114:
              }

              goto LABEL_115;
            }
          }

          else if (v19 != 24)
          {
            if (v19 != 29) {
              goto LABEL_115;
            }
            goto LABEL_79;
          }

LABEL_80:
          a2 += 4;
          uint64_t v33 = a2;
          int v7 = 1;
          goto LABEL_25;
        }
      }

      LODWORD(v18) = a2[3];
      goto LABEL_79;
    case 0x1D:
      goto LABEL_22;
    default:
      goto LABEL_109;
  }

uint64_t parsePseudoAttribute( uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (a2 == a3)
  {
    *a4 = 0LL;
    return 1LL;
  }

  else
  {
    uint64_t v10 = a2;
    (*(void (**)(uint64_t, uint64_t *))(a1 + 112))(a1, &v10);
    uint64_t result = 0LL;
    *a7 = a2;
  }

  return result;
}

void XML_Parse_cold_1()
{
  __assert_rtn("XML_Parse", "xmlparse.c", 2029, "s != NULL");
}

void XML_GetParsingStatus_cold_1()
{
  __assert_rtn("XML_GetParsingStatus", "xmlparse.c", 2306, "status != NULL");
}

void doProlog_cold_1()
{
  __assert_rtn("doProlog", "xmlparse.c", 5447, "dtd->scaffIndex != NULL");
}

void accountingDiffTolerated_cold_1()
{
}

void accountingGetCurrentAmplification_cold_1()
{
}

void entityTrackingReportStats_cold_1()
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void bzero(void *a1, size_t a2)
{
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1895FB378](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1895FB538](a1);
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