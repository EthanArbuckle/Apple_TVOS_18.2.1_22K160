uint64_t _citrus_iconv_std_iconv_init_shared(uint64_t a1)
{
  int32x2_t *v2;
  int32x2_t *v3;
  uint64_t v4;
  int32x2_t v5;
  int32x2_t *v6;
  uint64_t v7;
  int32x2_t v9;
  int32x2_t v10;
  int v11;
  void *v12;
  int v13;
  uint64_t v14;
  void v15[6];
  v2 = (int32x2_t *)malloc(0x38uLL);
  if (!v2) {
    return *__error();
  }
  v3 = v2;
  v4 = _citrus_esdb_open();
  if ((_DWORD)v4) {
    goto LABEL_11;
  }
  v4 = _citrus_esdb_open();
  if ((_DWORD)v4)
  {
LABEL_10:
    _citrus_esdb_close();
LABEL_11:
    free(v3);
    return v4;
  }

  v4 = _citrus_stdenc_open();
  if ((_DWORD)v4)
  {
LABEL_9:
    _citrus_esdb_close();
    goto LABEL_10;
  }

  v4 = _citrus_stdenc_open();
  if ((_DWORD)v4)
  {
LABEL_8:
    _citrus_stdenc_close();
    goto LABEL_9;
  }

  v5 = vrev64_s32((int32x2_t)v15[5]);
  v3[4] = 0LL;
  v6 = v3 + 4;
  v3[6] = v5;
  v3[2] = 0LL;
  v3[3] = (int32x2_t)0xFFFFFFFFLL;
  v3[5] = (int32x2_t)&v3[4];
  v7 = open_srcs((uint64_t)&v3[4], (uint64_t)&v14, (uint64_t)v15, &v13, (_DWORD *)&v3[3] + 1);
  if ((_DWORD)v7)
  {
    v4 = v7;
    _citrus_stdenc_close();
    goto LABEL_8;
  }

  if (v13 == 1)
  {
    v13 = 0;
    v9 = *v6;
    v10 = *(int32x2_t *)(*(void *)v6 + 16LL);
    if (v10)
    {
      v11 = 0;
      v12 = *(void **)(*(void *)v6 + 16LL);
      do
      {
        ++v11;
        v12 = (void *)*v12;
      }

      while (v12);
      v13 = v11;
      if (v11 == 1)
      {
        v3[2] = v10;
        v3[3].i32[0] = *(_DWORD *)(*(void *)&v9 + 32LL);
      }
    }
  }

  _citrus_esdb_close();
  _citrus_esdb_close();
  v4 = 0LL;
  *(void *)(a1 + 8) = v3;
  return v4;
}

void _citrus_iconv_std_iconv_uninit_shared(uint64_t a1)
{
  v1 = *(void **)(a1 + 8);
  if (v1)
  {
    _citrus_stdenc_close();
    _citrus_stdenc_close();
    close_srcs((uint64_t)v1 + 32);
    free(v1);
  }
}

uint64_t _citrus_iconv_std_iconv_init_context(void *a1)
{
  v2 = *(size_t ****)(*a1 + 8LL);
  v3 = v2[1];
  uint64_t v4 = *v3[3];
  uint64_t v5 = *(*v2)[3];
  v6 = (char *)malloc(2 * (v5 + v4) + 248);
  if (!v6) {
    return *__error();
  }
  v7 = v6;
  *(_OWORD *)(v6 + 184) = 0u;
  *(_OWORD *)(v6 + 168) = 0u;
  *(_OWORD *)(v6 + 152) = 0u;
  *(_OWORD *)(v6 + 136) = 0u;
  *(_OWORD *)(v6 + 120) = 0u;
  *(_OWORD *)(v6 + 104) = 0u;
  *(_OWORD *)(v6 + 88) = 0u;
  unint64_t v8 = (unint64_t)(v6 + 248);
  *(_OWORD *)(v6 + 72) = 0u;
  if (!v4)
  {
    *((void *)v6 + 29) = 0LL;
    *((void *)v6 + 30) = 0LL;
    *((void *)v6 + 28) = v3;
    if (v5) {
      goto LABEL_4;
    }
LABEL_7:
    v10 = *v2;
    *((void *)v7 + 26) = 0LL;
    *((void *)v7 + 27) = 0LL;
    *((void *)v7 + 25) = v10;
    goto LABEL_8;
  }

  init_encoding((size_t ***)v6 + 28, v3, v8, (size_t **)(v8 + v4));
  if (!v5) {
    goto LABEL_7;
  }
LABEL_4:
  init_encoding((size_t ***)v7 + 25, *v2, v8 + 2 * v4, (size_t **)(v8 + 2 * v4 + v5));
LABEL_8:
  uint64_t result = 0LL;
  a1[1] = v7;
  return result;
}

void _citrus_iconv_std_iconv_uninit_context(uint64_t a1)
{
}

uint64_t _citrus_iconv_std_iconv_convert( void *a1, unint64_t *a2, unint64_t *a3, uint64_t *a4, unint64_t *a5, char a6, void (**a7)(size_t **, uint64_t))
{
  v7 = a7;
  unint64_t v8 = a5;
  v9 = a4;
  uint64_t v214 = *MEMORY[0x1895F89C0];
  uint64_t v10 = a1[1];
  uint64_t v11 = *(void *)(*a1 + 8LL);
  v200 = 0LL;
  if (!a2 || (unint64_t v12 = *a2) == 0)
  {
    if (a4 && *a4)
    {
      v147 = *(const void **)(v10 + 232);
      if (v147) {
        memcpy(*(void **)(v10 + 240), v147, **(void **)(*(void *)(v10 + 224) + 24LL));
      }
      v148 = *(const void **)(v10 + 208);
      v173 = v7;
      if (v148)
      {
        memcpy(*(void **)(v10 + 216), v148, **(void **)(*(void *)(v10 + 200) + 24LL));
        uint64_t v149 = *(void *)(v10 + 208);
      }

      else
      {
        uint64_t v149 = 0LL;
      }

      unint64_t v198 = 0LL;
      unint64_t v156 = *v8;
      uint64_t v42 = (*(uint64_t (**)(void, uint64_t, unint64_t, uint64_t, unint64_t *))(**(void **)(v10 + 200) + 56LL))( *(void *)(v10 + 200),  *v9,  *v8,  v149,  &v198);
      if ((_DWORD)v42) {
        goto LABEL_278;
      }
      unint64_t v157 = v198;
      if (v198 == -2LL)
      {
LABEL_275:
        uint64_t v42 = 22LL;
        goto LABEL_278;
      }

      *v9 += v198;
      *unint64_t v8 = v156 - v157;
    }

    else
    {
      uint64_t v150 = *(void *)(v10 + 208);
      if (v150)
      {
        v151 = *(size_t ***)(v10 + 200);
        bzero(*(void **)(v10 + 208), *v151[3]);
        v152 = (void (*)(size_t **, uint64_t))(*v151)[2];
        if (v152) {
          v152(v151, v150);
        }
      }

      uint64_t v153 = *(void *)(v10 + 216);
      if (v153)
      {
        v154 = *(size_t ***)(v10 + 200);
        bzero(*(void **)(v10 + 216), *v154[3]);
        v155 = (void (*)(size_t **, uint64_t))(*v154)[2];
        if (v155) {
          v155(v154, v153);
        }
      }
    }

    uint64_t v161 = *(void *)(v10 + 232);
    if (v161)
    {
      v162 = *(size_t ***)(v10 + 224);
      bzero(*(void **)(v10 + 232), *v162[3]);
      v163 = (void (*)(size_t **, uint64_t))(*v162)[2];
      if (v163) {
        v163(v162, v161);
      }
    }

    uint64_t v164 = *(void *)(v10 + 240);
    if (v164)
    {
      v165 = *(size_t ***)(v10 + 224);
      bzero(*(void **)(v10 + 240), *v165[3]);
      v160 = (void (*)(size_t **, uint64_t))(*v165)[2];
      if (!v160)
      {
LABEL_292:
        uint64_t v42 = 0LL;
        goto LABEL_293;
      }

      v160(v165, v164);
    }

    v160 = 0LL;
    goto LABEL_292;
  }

  int v181 = 0;
  uint64_t v176 = v11;
  unint64_t v13 = *(void *)(*(void *)(*(void *)(v11 + 8) + 24LL) + 16LL);
  if (v13 <= 1) {
    unint64_t v13 = 1LL;
  }
  v173 = a7;
  unint64_t v174 = v13;
  v187 = (size_t ***)(v10 + 224);
  unint64_t v175 = v10 + 64;
  v170 = (uint64_t *)(v10 + 200);
  unint64_t v14 = *a3;
  uint64_t v15 = v10 + 2;
  int v169 = a6 & 1;
  uint64_t v195 = v10;
  v16 = a2;
  while (2)
  {
    while (2)
    {
      if (v14)
      {
        uint64_t v17 = (uint64_t)a1;
      }

      else
      {
        int v18 = (*(uint64_t (**)(void, void, void, mbstate_t *))(**(void **)(v10 + 224) + 64LL))( *(void *)(v10 + 224),  *(void *)(v10 + 232),  0LL,  &v213);
        int v19 = v181;
        if (!v18) {
          int v19 = *(_DWORD *)v213.__mbstate8;
        }
        uint64_t v17 = (uint64_t)a1;
        if ((v19 - 1) < 2)
        {
          uint64_t v42 = 0LL;
          v160 = v200;
          v7 = v173;
          goto LABEL_293;
        }

        int v181 = v19;
        unint64_t v12 = *v16;
      }

      unint64_t v201 = v12;
      unint64_t v198 = 0LL;
      uint64_t v199 = 0LL;
      int v196 = 32;
      unint64_t v188 = v14;
      if ((*(_BYTE *)(v17 + 24) & 1) == 0)
      {
        uint64_t v20 = mbtocsx( (uint64_t)v187,  (uint64_t)v212,  (uint64_t)v211,  (uint64_t)v210,  &v196,  &v201,  v14,  &v199,  *(void *)(*(void *)v17 + 80LL));
        int v21 = 0;
        LODWORD(v22) = v196;
        goto LABEL_51;
      }

      unint64_t v23 = *v8;
      unint64_t v198 = *v8;
      uint64_t v24 = *v9;
      *(_OWORD *)uint64_t v10 = 0u;
      *(_OWORD *)(v10 + 16) = 0u;
      *(_OWORD *)(v10 + 32) = 0u;
      *(_OWORD *)(v10 + 48) = 0u;
      uint64_t v26 = *(void *)(v17 + 8);
      uint64_t v25 = *(void *)(v17 + 16);
      __int128 v27 = *(_OWORD *)(v26 + 152);
      *((_OWORD *)&v213._mbstateL + 4) = *(_OWORD *)(v26 + 136);
      *((_OWORD *)&v213._mbstateL + 5) = v27;
      __int128 v28 = *(_OWORD *)(v26 + 184);
      *((_OWORD *)&v213._mbstateL + 6) = *(_OWORD *)(v26 + 168);
      *((_OWORD *)&v213._mbstateL + 7) = v28;
      __int128 v29 = *(_OWORD *)(v26 + 88);
      *(_OWORD *)v213.__mbstate8 = *(_OWORD *)(v26 + 72);
      *((_OWORD *)&v213._mbstateL + 1) = v29;
      __int128 v30 = *(_OWORD *)(v26 + 120);
      *((_OWORD *)&v213._mbstateL + 2) = *(_OWORD *)(v26 + 104);
      *((_OWORD *)&v213._mbstateL + 3) = v30;
      unint64_t v31 = v14 - 4;
      if (v14 < 4)
      {
        int v21 = 0;
        unint64_t v33 = 0LL;
        uint64_t v42 = 0LL;
        char v36 = 1;
        uint64_t v43 = v24;
LABEL_27:
        v9 = a4;
        goto LABEL_28;
      }

      unint64_t v32 = 0LL;
      unint64_t v33 = 0LL;
      uint64_t v34 = (v31 >> 2) + 1;
      while (1)
      {
        int v35 = ___mb_cur_max();
        char v36 = 1;
        if (v32 > 0x1F || v33 > 6LL - v35)
        {
          int v21 = 0;
          uint64_t v42 = 0LL;
          goto LABEL_26;
        }

        size_t v37 = wcrtomb((char *)(v26 + v33 + 64), *(_DWORD *)(v12 + 4 * v32), &v213);
        if (v37 == -1LL) {
          break;
        }
LABEL_21:
        v33 += v37;
        __int128 v38 = *((_OWORD *)&v213._mbstateL + 5);
        *(_OWORD *)(v26 + 136) = *((_OWORD *)&v213._mbstateL + 4);
        *(_OWORD *)(v26 + 152) = v38;
        __int128 v39 = *((_OWORD *)&v213._mbstateL + 7);
        *(_OWORD *)(v26 + 168) = *((_OWORD *)&v213._mbstateL + 6);
        *(_OWORD *)(v26 + 184) = v39;
        __int128 v40 = *((_OWORD *)&v213._mbstateL + 1);
        *(_OWORD *)(v26 + 72) = *(_OWORD *)v213.__mbstate8;
        *(_OWORD *)(v26 + 88) = v40;
        __int128 v41 = *((_OWORD *)&v213._mbstateL + 3);
        *(_OWORD *)(v26 + 104) = *((_OWORD *)&v213._mbstateL + 2);
        *(_OWORD *)(v26 + 120) = v41;
        *(_WORD *)(v195 + 2 * v32) = v33;
        v201 += 4LL;
        if (v34 == ++v32)
        {
          int v21 = 0;
          uint64_t v42 = 0LL;
          goto LABEL_23;
        }
      }

      if (*(_BYTE *)(*a1 + 72LL))
      {
        size_t v37 = 4LL;
        memset(&v213, 0, sizeof(v213));
        goto LABEL_21;
      }

      if (v33)
      {
        int v21 = 0;
        uint64_t v42 = 92LL;
LABEL_23:
        char v36 = 1;
LABEL_26:
        uint64_t v43 = v24;
        uint64_t v10 = v195;
        unint64_t v8 = a5;
        goto LABEL_27;
      }

      unint64_t v8 = a5;
      v9 = a4;
      if (v25
        && (v129 = *(void (**)(void, void *(*)(void *, size_t, uint64_t), uint64_t *, void))(v25 + 24)) != 0LL)
      {
        uint64_t v207 = 0LL;
        uint64_t v208 = 0LL;
        uint64_t v205 = v24;
        unint64_t v206 = v23;
        v129(*(unsigned int *)(v12 + 4 * v32), _citrus_iconv_std_write_mb, &v205, *(void *)(v25 + 32));
        uint64_t v42 = v208;
        if ((_DWORD)v208)
        {
          char v36 = 0;
          unint64_t v33 = 0LL;
          int v21 = 1;
          goto LABEL_204;
        }

        char v36 = 0;
        v201 += 4LL;
        int v21 = 1;
        uint64_t v43 = v205;
        unint64_t v33 = 4LL;
      }

      else
      {
        int v21 = 0;
        unint64_t v33 = 0LL;
        uint64_t v42 = 92LL;
        char v36 = 1;
LABEL_204:
        uint64_t v43 = v24;
      }

      uint64_t v10 = v195;
LABEL_28:
      v16 = a2;
      if (v33) {
        BOOL v44 = (_DWORD)v42 == 0;
      }
      else {
        BOOL v44 = 1;
      }
      if (v44 && (_DWORD)v42) {
        goto LABEL_278;
      }
      if ((v36 & 1) == 0)
      {
        uint64_t v42 = 0LL;
        v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
        unint64_t v198 = v43 - v24;
        goto LABEL_86;
      }

      unint64_t v209 = v175;
      uint64_t v17 = (uint64_t)a1;
      uint64_t v20 = mbtocsx( (uint64_t)v187,  (uint64_t)v212,  (uint64_t)v211,  (uint64_t)v210,  &v196,  &v209,  v33,  &v199,  *(void *)(*a1 + 80LL));
      uint64_t v22 = v196;
      if (v196 >= 1)
      {
        uint64_t v45 = 0LL;
        do
        {
          if ((v45 & 0xFFFFFFE0) != 0) {
            uint64_t v46 = v45;
          }
          else {
            uint64_t v46 = 31LL;
          }
          else {
            uint64_t v47 = v45;
          }
          unsigned int v48 = (unsigned __int16)v210[v45];
          uint64_t v49 = v45;
          while (v46 != v49)
          {
            int v50 = v49 + 1;
            BOOL v52 = v48 > (unsigned __int16)(*(_WORD *)(v15 + 2 * v49++) - 1);
            if (!v52)
            {
              __int16 v51 = v50 - 1;
              uint64_t v47 = (v50 - 1);
              goto LABEL_49;
            }
          }

          __int16 v51 = v47;
LABEL_49:
          v210[v45++] = 4 * v51 + 4;
        }

        while (v45 != v22);
      }

LABEL_51:
      int v186 = v22;
      BOOL v52 = v199 != -2 || (int)v22 < 1;
      int v53 = v22;
      if (!v52)
      {
        v54 = v8;
        int v55 = v21;
        uint64_t v56 = *(void *)(v10 + 232);
        if (v56)
        {
          v57 = *v187;
          bzero(*(void **)(v10 + 232), *(*v187)[3]);
          v58 = (void (*)(size_t **, uint64_t))(*v57)[2];
          if (v58) {
            v58(v57, v56);
          }
        }

        uint64_t v59 = *(void *)(v10 + 240);
        if (v59)
        {
          v60 = *v187;
          bzero(*(void **)(v10 + 240), *(*v187)[3]);
          v61 = (void (*)(size_t **, uint64_t))(*v60)[2];
          if (v61) {
            v61(v60, v59);
          }
        }

        int v53 = v196;
        uint64_t v199 = (unsigned __int16)v210[v196 - 1];
        unint64_t v201 = *v16 + v199;
        int v21 = v55;
        unint64_t v8 = v54;
        v9 = a4;
      }

      if ((_DWORD)v20 != 92 || !*(_BYTE *)(*(void *)v17 + 72LL))
      {
        if (!(_DWORD)v20 || v53)
        {
          if ((_DWORD)v20) {
            break;
          }
          goto LABEL_81;
        }

        unint64_t v198 = *v8;
        uint64_t v68 = iconv_std_early_fallback(v17, &v201, *v9, (uint64_t *)&v198);
        if ((_DWORD)v68)
        {
          uint64_t v42 = v68;
          if ((_DWORD)v68 == 2) {
            uint64_t v42 = v20;
          }
          goto LABEL_278;
        }

        v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
        v69 = *(void **)(v10 + 232);
        if (v69) {
          memcpy(v69, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24LL));
        }
LABEL_77:
        uint64_t v42 = 0LL;
        goto LABEL_86;
      }

      v201 += v174;
      uint64_t v62 = *(void *)(v10 + 232);
      if (v62)
      {
        v63 = *v187;
        bzero(*(void **)(v10 + 232), *(*v187)[3]);
        v64 = (void (*)(size_t **, uint64_t))(*v63)[2];
        if (v64) {
          v64(v63, v62);
        }
      }

      uint64_t v65 = *(void *)(v10 + 240);
      if (v65)
      {
        v66 = *v187;
        bzero(*(void **)(v10 + 240), *(*v187)[3]);
        v67 = (void (*)(size_t **, uint64_t))(*v66)[2];
        if (v67) {
          v67(v66, v65);
        }
      }

      if (!v196)
      {
        unint64_t v12 = v201;
        unint64_t v14 = *v16 - v201 + v188;
        *a3 = v14;
        unint64_t *v16 = v12;
        continue;
      }

      break;
    }

    v70 = *(void **)(v10 + 232);
    if (v70) {
      memcpy(v70, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24LL));
    }
LABEL_81:
    if (v199 == -2)
    {
      if (!(*(unsigned int (**)(void, void, void, mbstate_t *))(**(void **)(v10 + 224) + 64LL))( *(void *)(v10 + 224),  *(void *)(v10 + 232),  0LL,  &v213))
      {
        unint64_t v71 = v188;
        if ((*(_DWORD *)v213.__mbstate8 - 1) < 2)
        {
          int v181 = *(_DWORD *)v213.__mbstate8;
          uint64_t v42 = 0LL;
          goto LABEL_87;
        }
      }

      goto LABEL_275;
    }

    int v171 = v21;
    int v197 = 0;
    uint64_t v76 = v211[0];
    unsigned int v77 = do_conv(v17, v176, (uint64_t)v212, (uint64_t)v211, &v196, &v200, 0, &v197);
    unsigned int v78 = v77;
    if (v77 && v196)
    {
      unint64_t v201 = *v16 + (unsigned __int16)v210[v196 - 1];
      uint64_t v79 = *(void *)(v10 + 232);
      if (v79)
      {
        v80 = *v187;
        bzero(*(void **)(v10 + 232), *(*v187)[3]);
        v81 = (void (*)(size_t **, uint64_t))(*v80)[2];
        if (v81) {
          v81(v80, v79);
        }
      }

      uint64_t v82 = *(void *)(v10 + 240);
      if (v82)
      {
        v83 = *v187;
        bzero(*(void **)(v10 + 240), *(*v187)[3]);
        v84 = (void (*)(size_t **, uint64_t))(*v83)[2];
        if (v84) {
          v84(v83, v82);
        }
      }

      if (v201 <= *v16) {
        _citrus_iconv_std_iconv_convert_cold_8();
      }
LABEL_109:
      uint64_t v86 = *v9;
      unint64_t v172 = *v8;
      if ((*(_BYTE *)(v17 + 24) & 2) == 0)
      {
        uint64_t v87 = *(void *)(*(void *)v17 + 80LL);
        uint64_t v88 = *(void *)(v10 + 200);
        v89 = *(uint64_t (**)(uint64_t, uint64_t, unint64_t))(*(void *)v88 + 80LL);
        int v90 = v186;
        if (!v89 || (uint64_t v42 = v89(v88, v86, v172), (_DWORD)v42 == 102))
        {
          if (v196 < 1)
          {
            uint64_t v42 = 102LL;
          }

          else
          {
            uint64_t v91 = v86;
            uint64_t v92 = 0LL;
            unint64_t v93 = 0LL;
            uint64_t v189 = v91;
            unint64_t v94 = v172;
            while (1)
            {
              v95 = *(size_t ***)(v10 + 200);
              v96 = *(const void **)(v10 + 208);
              if (v96)
              {
                memcpy(*(void **)(v10 + 216), v96, *v95[3]);
                v95 = *(size_t ***)(v10 + 200);
                uint64_t v97 = *(void *)(v10 + 208);
              }

              else
              {
                uint64_t v97 = 0LL;
              }

              uint64_t v98 = ((uint64_t (*)(size_t **, uint64_t, unint64_t, void, void, uint64_t, mbstate_t *, uint64_t))(*v95)[4])( v95,  v91,  v94,  v212[v92],  v211[v92],  v97,  &v213,  v87);
              if ((_DWORD)v98)
              {
                uint64_t v42 = v98;
                int v196 = v92;
                goto LABEL_220;
              }

              v93 += v213._mbstateL;
              v94 -= v213._mbstateL;
              if (!v94 && v92 < v196 - 1LL) {
                break;
              }
              v91 += v213._mbstateL;
              if (++v92 >= v196) {
                goto LABEL_219;
              }
            }

            int v196 = v92 + 1;
LABEL_219:
            uint64_t v42 = 0LL;
            unint64_t v198 = v93;
LABEL_220:
            v16 = a2;
            int v90 = v186;
            uint64_t v86 = v189;
          }
        }

        if ((_DWORD)v42 != 92) {
          goto LABEL_244;
        }
        if (*(_BYTE *)(*a1 + 72LL)) {
          BOOL v131 = 0;
        }
        else {
          BOOL v131 = v196 == 0;
        }
        if (!v131) {
          goto LABEL_231;
        }
        v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
        uint64_t v132 = iconv_std_late_fallback((uint64_t)a1, v211[0], v86, (uint64_t *)&v198);
        if ((_DWORD)v132 == 2) {
          goto LABEL_231;
        }
        uint64_t v42 = v132;
        uint64_t v190 = v86;
        if ((_DWORD)v132) {
          goto LABEL_230;
        }
        unint64_t v201 = *v16 + v210[0];
        int v133 = v196;
        goto LABEL_246;
      }

      uint64_t v190 = *v9;
      uint64_t v100 = *(void *)(v17 + 8);
      uint64_t v99 = *(void *)(v17 + 16);
      uint64_t v191 = *(void *)v17;
      uint64_t v101 = *(void *)(*(void *)v17 + 8LL);
      memset(&v213, 0, sizeof(v213));
      unint64_t v102 = *(void *)(*(void *)(*(void *)v101 + 24LL) + 16LL);
      if (v102 <= 1) {
        unint64_t v102 = 1LL;
      }
      int v90 = v186;
      if (v102 >= 6) {
        _citrus_iconv_std_iconv_convert_cold_5();
      }
      size_t v203 = 0LL;
      int v177 = v196;
      if (v196 <= 0)
      {
        uint64_t v42 = 0LL;
        int v196 = 0;
        unint64_t v71 = v188;
        goto LABEL_201;
      }

      size_t v193 = v102;
      int v194 = 0;
      uint64_t v168 = v99;
      int v103 = 0;
      uint64_t v178 = v100 + 64;
      unint64_t v180 = v172;
      while (2)
      {
        int v202 = 1;
        v104 = &v212[v103];
        int v185 = v103;
        v105 = &v211[v103];
        uint64_t v106 = *(void *)(v191 + 80);
        uint64_t v107 = *(void *)(v100 + 200);
        v108 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v107 + 80LL);
        if (v108)
        {
          uint64_t v109 = v108(v107, v178, 6LL);
          LODWORD(v110) = v202;
          if ((_DWORD)v109 == 102)
          {
            if (v202 >= 1) {
              goto LABEL_130;
            }
            uint64_t v42 = 102LL;
          }

          else
          {
            uint64_t v42 = v109;
          }

          unint64_t v8 = a5;
        }

        else
        {
LABEL_130:
          uint64_t v110 = 0LL;
          size_t v111 = 0LL;
          uint64_t v112 = v100 + 64;
          uint64_t v113 = 6LL;
          while (1)
          {
            v114 = *(size_t ***)(v100 + 200);
            v115 = *(const void **)(v100 + 208);
            if (v115)
            {
              memcpy(*(void **)(v100 + 216), v115, *v114[3]);
              v114 = *(size_t ***)(v100 + 200);
              uint64_t v116 = *(void *)(v100 + 208);
            }

            else
            {
              uint64_t v116 = 0LL;
            }

            uint64_t v117 = ((uint64_t (*)(size_t **, uint64_t, uint64_t, void, void, uint64_t, unint64_t *, uint64_t))(*v114)[4])( v114,  v112,  v113,  v104[v110],  v105[v110],  v116,  &v209,  v106);
            if ((_DWORD)v117)
            {
              uint64_t v42 = v117;
              int v202 = v110;
              uint64_t v10 = v195;
              unint64_t v8 = a5;
              v9 = a4;
              int v90 = v186;
              goto LABEL_145;
            }

            v111 += v209;
            v113 -= v209;
            if (!v113 && v110 < v202 - 1LL) {
              break;
            }
            v112 += v209;
            if (++v110 >= v202)
            {
              LODWORD(v110) = v202;
              goto LABEL_144;
            }
          }

          LODWORD(v110) = v110 + 1;
          int v202 = v110;
LABEL_144:
          uint64_t v10 = v195;
          int v90 = v186;
          uint64_t v42 = 0LL;
          size_t v203 = v111;
          unint64_t v8 = a5;
          v9 = a4;
        }

LABEL_145:
        int v103 = v185;
        if ((_DWORD)v42) {
          BOOL v118 = (_DWORD)v110 == 0;
        }
        else {
          BOOL v118 = 0;
        }
        if (v118)
        {
          v16 = a2;
          goto LABEL_199;
        }

        size_t v119 = v203;
        if (!v203)
        {
          size_t v122 = 0LL;
          unint64_t v120 = v180;
          goto LABEL_173;
        }

        unint64_t v120 = v180;
        if (!v180)
        {
          size_t v122 = v203;
LABEL_173:
          v16 = a2;
          int v103 = v185;
          if (v122 && !v120)
          {
            uint64_t v42 = 7LL;
            int v90 = v186;
LABEL_199:
            int v196 = v103;
            unint64_t v71 = v188;
            if (v103 >= 1) {
              unint64_t v198 = 4LL * v194;
            }
LABEL_201:
            if (v171) {
              goto LABEL_202;
            }
LABEL_230:
            uint64_t v86 = v190;
            if ((_DWORD)v42 == 92)
            {
LABEL_231:
              if (*(_DWORD *)(v176 + 52))
              {
                uint64_t v134 = *(void *)(v10 + 208);
                if (v134)
                {
                  uint64_t v135 = *v170;
                  bzero(*(void **)(v10 + 208), **(void **)(*v170 + 24));
                  v136 = *(void (**)(uint64_t, uint64_t))(*(void *)v135 + 16LL);
                  if (v136) {
                    v136(v135, v134);
                  }
                }

                uint64_t v137 = *(void *)(v10 + 216);
                if (v137)
                {
                  uint64_t v138 = *v170;
                  bzero(*(void **)(v10 + 216), **(void **)(*v170 + 24));
                  v139 = *(void (**)(uint64_t, uint64_t))(*(void *)v138 + 16LL);
                  if (v139) {
                    v139(v138, v137);
                  }
                }

                v213._mbstateL = 0LL;
                int v140 = (*(uint64_t (**)(void, unint64_t, unint64_t, void, void, mbstate_t *, void))(**(void **)(v10 + 200) + 48LL))( *(void *)(v10 + 200),  v86 + v198,  v172 - v198,  *(unsigned int *)(v176 + 48),  *(void *)(v10 + 208),  &v213,  *(void *)(*a1 + 80LL));
                int v90 = v186;
                if (v140)
                {
                  uint64_t v42 = 92LL;
                  if (v140 != 7 && v140 != 92) {
                    _citrus_iconv_std_iconv_convert_cold_4();
                  }
                }

                else
                {
                  uint64_t v42 = 0LL;
                  ++v196;
                  v198 += v213._mbstateL;
                }
              }

              else
              {
                uint64_t v42 = 92LL;
              }
            }

LABEL_244:
            int v133 = v196;
            if ((_DWORD)v42 && !v196) {
              goto LABEL_278;
            }
LABEL_246:
            if (v133 < v90)
            {
              unint64_t v201 = *v16 + (unsigned __int16)v210[v133 - 1];
              uint64_t v141 = *(void *)(v10 + 232);
              if (v141)
              {
                v142 = *v187;
                bzero(*(void **)(v10 + 232), *(*v187)[3]);
                v143 = (void (*)(size_t **, uint64_t))(*v142)[2];
                if (v143) {
                  v143(v142, v141);
                }
              }

              uint64_t v144 = *(void *)(v10 + 240);
              if (v144)
              {
                v145 = *v187;
                bzero(*(void **)(v10 + 240), *(*v187)[3]);
                v146 = (void (*)(size_t **, uint64_t))(*v145)[2];
                if (v146) {
                  v146(v145, v144);
                }
              }
            }

            if (v201 <= *v16) {
              _citrus_iconv_std_iconv_convert_cold_3();
            }
            unint64_t v71 = *a3;
            goto LABEL_87;
          }

LABEL_182:
          v103 += v202;
          unint64_t v180 = v120;
          int v90 = v186;
          if (v103 >= v177) {
            goto LABEL_199;
          }
          continue;
        }

        break;
      }

      uint64_t v121 = 0LL;
      size_t v122 = v203;
      while (2)
      {
        if (v120 < 4) {
          goto LABEL_180;
        }
        size_t v123 = mbrtowc(&v204, (const char *)(v100 + v121 + 64), v122, &v213);
        if (v123 != -1LL)
        {
          size_t v124 = v193;
          if (v123 == -2LL) {
            _citrus_iconv_std_iconv_convert_cold_7();
          }
          size_t v125 = v203;
          if (v123 > v203) {
            _citrus_iconv_std_iconv_convert_cold_6();
          }
LABEL_159:
          if (v123 > v124) {
            size_t v124 = v123;
          }
          if (v124 >= v125) {
            size_t v124 = v125;
          }
          size_t v122 = v125 - v124;
          size_t v203 = v125 - v124;
          if (v123)
          {
            *(_DWORD *)(v190 + 4LL * v194) = v204;
            v120 -= 4LL;
            ++v194;
          }

          v121 += v124;
          if (v122) {
            BOOL v126 = v120 == 0;
          }
          else {
            BOOL v126 = 1;
          }
          if (v126) {
            goto LABEL_173;
          }
          continue;
        }

        break;
      }

      size_t v124 = v193;
      if (*(_BYTE *)(v191 + 72))
      {
        size_t v125 = v203;
        size_t v123 = v193;
        goto LABEL_159;
      }

      if (!v168)
      {
        uint64_t v42 = 92LL;
LABEL_180:
        v16 = a2;
LABEL_181:
        int v103 = v185;
        goto LABEL_182;
      }

      v127 = *(void (**)(uint64_t, size_t, int *(*)(int *, uint64_t, uint64_t), uint64_t *, void))(v168 + 16);
      v16 = a2;
      if (!v127)
      {
        uint64_t v42 = 92LL;
        goto LABEL_181;
      }

      uint64_t v207 = 0LL;
      uint64_t v208 = 0LL;
      uint64_t v205 = v190;
      unint64_t v206 = v180;
      v127(v178, v119, _citrus_iconv_std_write_wc, &v205, *(void *)(v168 + 32));
      uint64_t v42 = v208;
      if (!(_DWORD)v208) {
        unint64_t v198 = v205 - v190;
      }
      unint64_t v71 = v188;
LABEL_202:
      v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
LABEL_87:
      unint64_t v12 = v201;
      unint64_t v72 = v201 - *v16;
      BOOL v73 = v71 >= v72;
      unint64_t v14 = v71 - v72;
      if (!v73) {
        _citrus_iconv_std_iconv_convert_cold_1();
      }
      unint64_t v74 = v198;
      unint64_t v75 = *v8 - v198;
      if (*v8 < v198) {
        _citrus_iconv_std_iconv_convert_cold_2();
      }
      *a3 = v14;
      unint64_t *v16 = v12;
      *unint64_t v8 = v75;
      *v9 += v74;
      if ((_DWORD)v42) {
        goto LABEL_278;
      }
      continue;
    }

    break;
  }

  if (!v77) {
    goto LABEL_109;
  }
  if (v197 == 1) {
    v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
  }
  unint64_t v71 = v188;
  if (*(_BYTE *)(*(void *)v17 + 72LL))
  {
    v85 = *(void **)(v10 + 208);
    if (v85) {
      memcpy(v85, *(const void **)(v10 + 216), **(void **)(*(void *)(v10 + 200) + 24LL));
    }
    uint64_t v42 = 0LL;
    unint64_t v198 = 0LL;
    unint64_t v201 = *v16 + v210[0];
    goto LABEL_87;
  }

  unint64_t v128 = *v8;
  unint64_t v198 = *v8;
  if (v197 == 1)
  {
    if (v196) {
      _citrus_iconv_std_iconv_convert_cold_11();
    }
    unsigned int v77 = iconv_std_late_fallback(v17, v76, *v9, (uint64_t *)&v198);
    if (v77) {
      goto LABEL_208;
    }
    uint64_t v42 = 0LL;
    unint64_t v201 = *v16 + v210[0];
LABEL_86:
    unint64_t v71 = v188;
    goto LABEL_87;
  }

  if (v197 == 2)
  {
    if (v201 == *v16) {
      _citrus_iconv_std_iconv_convert_cold_10();
    }
    unint64_t v201 = *v16;
    unsigned int v77 = iconv_std_early_fallback(v17, &v201, *v9, (uint64_t *)&v198);
    if (!v77)
    {
      v200 = (void (*)(size_t **, uint64_t))((char *)v200 + 1);
      restore_encoding_state((uint64_t)v187);
      goto LABEL_77;
    }
  }

LABEL_208:
  uint64_t v130 = *(void *)v17;
  if (*(_BYTE *)(*(void *)v17 + 88LL))
  {
    init_encoding_state(v187);
    uint64_t v42 = 92LL;
    goto LABEL_278;
  }

  if (v77 == 2) {
    uint64_t v42 = v78;
  }
  else {
    uint64_t v42 = v77;
  }
  if ((_DWORD)v42 == 2 && !v169)
  {
    if (*(_BYTE *)(v130 + 72) || !*(_DWORD *)(v176 + 52))
    {
      uint64_t v42 = 2LL;
      goto LABEL_278;
    }

    uint64_t v42 = (*(uint64_t (**)(void, uint64_t, unint64_t, void, void, unint64_t *, void))(**(void **)(v10 + 200) + 48LL))( *(void *)(v10 + 200),  *v9,  v128,  *(unsigned int *)(v176 + 48),  *(void *)(v10 + 208),  &v198,  *(void *)(v130 + 80));
    if ((_DWORD)v42)
    {
      if (v196)
      {
        uint64_t v167 = (unsigned __int16)v210[v196 - 1];
        *a3 = v188 - v167;
        *v16 += v167;
      }

      goto LABEL_278;
    }

    goto LABEL_86;
  }

LABEL_278:
  v158 = *(void **)(v10 + 232);
  if (v158) {
    memcpy(v158, *(const void **)(v10 + 240), **(void **)(*(void *)(v10 + 224) + 24LL));
  }
  v159 = *(void **)(v10 + 208);
  v7 = v173;
  if (v159) {
    memcpy(v159, *(const void **)(v10 + 216), **(void **)(*(void *)(v10 + 200) + 24LL));
  }
  v160 = v200;
LABEL_293:
  char *v7 = v160;
  return v42;
}

uint64_t _citrus_iconv_std_iconv_getops(uint64_t a1)
{
  __int128 v1 = _citrus_iconv_std_iconv_ops;
  __int128 v2 = *(_OWORD *)&off_18C75EA28;
  *(void *)(a1 + 32) = off_18C75EA38;
  *(_OWORD *)a1 = v1;
  *(_OWORD *)(a1 + 16) = v2;
  return 0LL;
}

uint64_t open_srcs(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, _DWORD *a5)
{
  uint64_t v10 = malloc(0x28uLL);
  if (!v10) {
    return *__error();
  }
  uint64_t v11 = v10;
  __int128 v27 = a4;
  v10[2] = 0LL;
  v10[3] = v10 + 2;
  if (*(int *)(a2 + 24) < 1)
  {
    int v13 = 0;
LABEL_31:
    free(v11);
    if (v27 && v13) {
      *__int128 v27 = v13;
    }
    return 2 * (v13 == 0);
  }

  uint64_t v12 = 0LL;
  int v13 = 0;
  uint64_t v28 = a1;
  while (1)
  {
    unint64_t v14 = malloc(0x30uLL);
    if (!v14)
    {
      uint64_t v18 = *__error();
      if ((_DWORD)v18) {
        goto LABEL_37;
      }
      goto LABEL_22;
    }

    uint64_t v15 = v14;
LABEL_20:
    free(v15);
    a1 = v28;
LABEL_22:
    if (v11[2])
    {
      *((_DWORD *)v11 + 8) = *(_DWORD *)(*(void *)(a2 + 32) + 16 * v12);
      *uint64_t v11 = 0LL;
      uint64_t v24 = *(void **)(a1 + 8);
      v11[1] = v24;
      *uint64_t v24 = v11;
      *(void *)(a1 + 8) = v11;
      uint64_t v25 = malloc(0x28uLL);
      uint64_t v11 = v25;
      if (!v25)
      {
        uint64_t v18 = *__error();
        goto LABEL_37;
      }

      ++v13;
      v25[2] = 0LL;
      v25[3] = v25 + 2;
    }
  }

  uint64_t v16 = 0LL;
  while (1)
  {
    uint64_t v17 = _citrus_csmapper_open();
    if ((_DWORD)v17)
    {
      uint64_t v18 = v17;
      if ((_DWORD)v17 != 2) {
        goto LABEL_36;
      }
      goto LABEL_19;
    }

    int v19 = *(void **)(v31 + 24);
    if (v19[1] != 1LL || v19[2] != 1LL || *v19)
    {
      _citrus_mapper_close();
      uint64_t v18 = 22LL;
LABEL_36:
      a1 = v28;
      close_dsts((uint64_t)(v11 + 2));
      free(v15);
      goto LABEL_37;
    }

    v15[2] = v31;
    *((_DWORD *)v15 + 6) = *(_DWORD *)(*(void *)(a3 + 32) + 16 * v16);
    v15[4] = v30;
    *((_BYTE *)v15 + 40) = v29;
    *a5 |= *(_DWORD *)(v31 + 64);
    uint64_t v20 = v11 + 2;
    while (1)
    {
      uint64_t v20 = (void *)*v20;
      if (!v20) {
        break;
      }
      if (v20[4] > v30)
      {
        uint64_t v22 = v20 + 1;
        uint64_t v21 = v20[1];
        *uint64_t v15 = v20;
        v15[1] = v21;
        unint64_t v23 = (void *)v20[1];
        goto LABEL_18;
      }
    }

    uint64_t v22 = v11 + 3;
    unint64_t v23 = (void *)v11[3];
    *uint64_t v15 = 0LL;
    v15[1] = v23;
LABEL_18:
    *unint64_t v23 = v15;
    *uint64_t v22 = v15;
    uint64_t v15 = malloc(0x30uLL);
    if (!v15) {
      break;
    }
LABEL_19:
  }

  uint64_t v18 = *__error();
  close_dsts((uint64_t)(v11 + 2));
  a1 = v28;
  if (!(_DWORD)v18) {
    goto LABEL_22;
  }
LABEL_37:
  free(v11);
  close_srcs(a1);
  return v18;
}

void close_srcs(uint64_t a1)
{
  for (i = *(uint64_t **)a1; *(void *)a1; i = *(uint64_t **)a1)
  {
    uint64_t v3 = *i;
    uint64_t v4 = (void *)i[1];
    if (*i)
    {
      *(void *)(v3 + 8) = v4;
      uint64_t v4 = (void *)i[1];
    }

    else
    {
      *(void *)(a1 + 8) = v4;
    }

    *uint64_t v4 = v3;
    close_dsts((uint64_t)(i + 2));
    free(i);
  }

void close_dsts(uint64_t a1)
{
  for (i = *(uint64_t **)a1; *(void *)a1; i = *(uint64_t **)a1)
  {
    uint64_t v3 = *i;
    uint64_t v4 = (void *)i[1];
    if (*i)
    {
      *(void *)(v3 + 8) = v4;
      uint64_t v4 = (void *)i[1];
    }

    else
    {
      *(void *)(a1 + 8) = v4;
    }

    *uint64_t v4 = v3;
    _citrus_mapper_close();
    free(i);
  }

size_t ***init_encoding(size_t ***result, size_t **a2, unint64_t a3, size_t **a4)
{
  *uint64_t result = a2;
  result[1] = (size_t **)a3;
  result[2] = a4;
  if (a3 | (unint64_t)a4)
  {
    if (!a3 || !a4) {
      init_encoding_cold_1();
    }
    v6 = result;
    bzero((void *)a3, *a2[3]);
    v7 = (uint64_t (*)(size_t **, unint64_t))(*a2)[2];
    if (!v7 || (uint64_t result = (size_t ***)v7(a2, a3), !(_DWORD)result))
    {
      uint64_t result = (size_t ***)v6[2];
      if (result)
      {
        unint64_t v8 = v6[1];
        if (v8) {
          return (size_t ***)memcpy(result, v8, *(*v6)[3]);
        }
      }
    }
  }

  return result;
}

void *save_encoding_state(void *result)
{
  __int128 v1 = (const void *)*((void *)result + 1);
  if (v1) {
    return memcpy(*((void **)result + 2), v1, **(void **)(*(void *)result + 24LL));
  }
  return result;
}

void init_encoding_state(size_t ***a1)
{
  __int128 v2 = a1[1];
  if (v2)
  {
    uint64_t v3 = *a1;
    bzero(a1[1], *(*a1)[3]);
    uint64_t v4 = (void (*)(size_t **, size_t **))(*v3)[2];
    if (v4) {
      v4(v3, v2);
    }
  }

  uint64_t v5 = a1[2];
  if (v5)
  {
    v6 = *a1;
    bzero(v5, *v6[3]);
    v7 = (void (*)(size_t **, size_t **))(*v6)[2];
    if (v7) {
      v7(v6, v5);
    }
  }

uint64_t mbtocsx( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, unint64_t *a6, unint64_t a7, void *a8, uint64_t a9)
{
  uint64_t v14 = a3;
  uint64_t v15 = a2;
  uint64_t v17 = *(size_t ***)a1;
  uint64_t v18 = (uint64_t (*)(size_t **, uint64_t, uint64_t, uint64_t))(*v17)[9];
  if (!v18 || (uint64_t result = v18(v17, a2, a3, a4), (_DWORD)result == 102))
  {
    *a8 = 0LL;
    uint64_t v29 = 0LL;
    if (*a5 < 1 || a7 == 0)
    {
      LODWORD(v21) = 0;
      uint64_t result = 102LL;
    }

    else
    {
      uint64_t v28 = a4;
      uint64_t v21 = 0LL;
      unint64_t v22 = *a6;
      unint64_t v23 = *a6;
      while (1)
      {
        uint64_t v24 = *(size_t ***)a1;
        uint64_t v25 = *(const void **)(a1 + 8);
        if (v25)
        {
          memcpy(*(void **)(a1 + 16), v25, *v24[3]);
          unint64_t v26 = *a6;
          uint64_t v24 = *(size_t ***)a1;
          uint64_t v27 = *(void *)(a1 + 8);
        }

        else
        {
          uint64_t v27 = 0LL;
          unint64_t v26 = v23;
        }

        uint64_t result = ((uint64_t (*)(size_t **, uint64_t, uint64_t, unint64_t *, unint64_t, uint64_t, uint64_t *, uint64_t))(*v24)[3])( v24,  v15,  v14,  a6,  a7,  v27,  &v29,  a9);
        if ((_DWORD)result) {
          break;
        }
        if (v29 == -2)
        {
          uint64_t result = 0LL;
          *a8 = -2LL;
          break;
        }

        *a8 += v29;
        unint64_t v23 = *a6;
        if (*a6 < v26) {
          mbtocsx_cold_1();
        }
        uint64_t result = 0LL;
        *(_WORD *)(v28 + 2 * v21++) = v23 - v22;
        if (v21 < *a5)
        {
          v14 += 4LL;
          v15 += 4LL;
          a7 = a7 + v26 - v23;
          if (a7) {
            continue;
          }
        }

        break;
      }
    }
  }

  return result;
}

uint64_t iconv_std_early_fallback(uint64_t a1, void *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 2LL;
  }
  uint64_t v5 = *(void (**)(void, uint64_t, uint64_t (*)(uint64_t, unint64_t, void *), void *, void))v4;
  if (!*(void *)v4) {
    return 2LL;
  }
  uint64_t v9 = *a4;
  v11[0] = a3;
  v11[1] = v9;
  v11[2] = a1;
  uint64_t v12 = 0LL;
  v5(*a2, 1LL, _citrus_iconv_std_write_uc, v11, *(void *)(v4 + 32));
  uint64_t result = v12;
  if (!(_DWORD)v12)
  {
    ++*a2;
    *a4 = v11[0] - a3;
  }

  return result;
}

void *restore_encoding_state(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 8);
  if (result) {
    return memcpy(result, *(const void **)(a1 + 16), **(void **)(*(void *)a1 + 24LL));
  }
  return result;
}

uint64_t do_conv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, void *a6, int a7, int *a8)
{
  uint64_t v12 = a3;
  uint64_t v13 = a2;
  uint64_t v15 = *a5;
  int v43 = *a5;
  int v44 = 0;
  if (*(void *)(a2 + 16) && (a7 & 1) == 0)
  {
    if ((int)v15 >= 1)
    {
      uint64_t v16 = 0LL;
      while (*(_DWORD *)(a3 + 4 * v16) == *(_DWORD *)(a2 + 24))
      {
        if (v15 == ++v16) {
          goto LABEL_55;
        }
      }

      *a5 = v16;
      int v43 = v16;
      if (!(_DWORD)v16) {
        return 2LL;
      }
      LODWORD(v15) = v16;
LABEL_55:
      if ((int)v15 >= 1)
      {
        int v29 = 0;
        int v30 = 0;
        while (1)
        {
          uint64_t result = do_conv_map_one( *(void *)(v13 + 16),  (_DWORD *)(v12 + 4LL * v30),  (_DWORD *)(a4 + 4LL * v30),  &v43,  &v44,  a8);
          if ((_DWORD)result != 35) {
            break;
          }
          if (v43 <= 0) {
            do_conv_cold_6();
          }
          if (!*(_BYTE *)(*(void *)a1 + 73LL))
          {
            *a5 = v43 + v29 - 1;
            return 2LL;
          }

          v29 += v43;
          *(_DWORD *)(a4 + 4LL * (v29 - 1)) = v44;
          int v31 = *a5;
          int v43 = *a5 - v29;
          if (a6) {
            ++*a6;
          }
          v30 += v29;
          if (v31 <= v29) {
            return 2LL;
          }
        }

        if (!(_DWORD)result)
        {
          if (v43 + v29 != *a5) {
            do_conv_cold_5();
          }
          return 0LL;
        }

        if (v43 + v29 >= *a5) {
          do_conv_cold_4();
        }
        *a5 = v43 + v29;
        if ((_DWORD)result != 2) {
          return result;
        }
      }
    }

    return 2LL;
  }

  if (!(_DWORD)v15) {
    return 0LL;
  }
  int v17 = 0;
  int v18 = 0;
  int v19 = 0;
LABEL_10:
  while (2)
  {
    uint64_t v20 = (int *)(v12 + 4LL * v19);
    int v38 = v18;
    int v39 = v19;
    if ((a7 & 1) != 0)
    {
      int v40 = 0;
      LODWORD(v21) = v15;
    }

    else
    {
      int v40 = *v20;
      if ((int)v15 < 1)
      {
        LODWORD(v21) = 0;
      }

      else
      {
        uint64_t v21 = 0LL;
        do
        {
          if (v20[v21] != *v20) {
            break;
          }
          ++v21;
        }

        while (v19 + v21 < v19 + (int)v15);
      }
    }

    unint64_t v22 = *(uint64_t **)(v13 + 32);
    if (!v22)
    {
LABEL_70:
      *a5 = v38;
      return 2LL;
    }

    char v23 = 0;
    uint64_t v24 = (_DWORD *)(a4 + 4LL * v19);
    int v25 = v40;
    while ((a7 & 1) == 0 && *((_DWORD *)v22 + 8) != *v20)
    {
LABEL_43:
      unint64_t v22 = (uint64_t *)*v22;
      if (!v22)
      {
        if ((v23 & 1) != 0 && *(_BYTE *)(*(void *)a1 + 73LL))
        {
          *uint64_t v24 = v44;
          *uint64_t v20 = v40;
          if (a6) {
            ++*a6;
          }
          int v18 = v38 + 1;
          int v19 = v39 + 1;
          LODWORD(v15) = v15 - 1;
          uint64_t v13 = a2;
          uint64_t v12 = a3;
          if (!(_DWORD)v15) {
            return 0LL;
          }
          goto LABEL_10;
        }

        goto LABEL_70;
      }
    }

    unint64_t v26 = (void *)v22[2];
    if (!v26)
    {
LABEL_38:
      if ((v23 & 1) != 0)
      {
        char v23 = 1;
      }

      else
      {
        if (!a7 || v17) {
          goto LABEL_70;
        }
        char v23 = 0;
      }

      goto LABEL_43;
    }

    while (1)
    {
      if (a7)
      {
        if ((*(_BYTE *)(v26[2] + 64LL) & 1) == 0) {
          goto LABEL_37;
        }
        int v25 = *((_DWORD *)v22 + 8);
      }

      int v42 = v21;
      uint64_t result = do_conv_map_one((uint64_t)v26, v20, v24, &v42, &v44, a8);
      if ((_DWORD)result != 35 && (result & 0x7D) != 0)
      {
        *a5 = v42 + v38;
        return result;
      }

      int v28 = v42;
      if ((_DWORD)result)
      {
        if ((_DWORD)result == 35)
        {
          if (v42 <= 0) {
            do_conv_cold_3();
          }
          int v28 = --v42;
          char v23 = 1;
          int v40 = v25;
        }

        else if (v42 >= (int)v21)
        {
          do_conv_cold_2();
        }
      }

      else
      {
        if (v42 != (_DWORD)v21) {
          do_conv_cold_1();
        }
        char v23 = 0;
        int v28 = v21;
      }

      ++v17;
      if (v28 >= 1) {
        break;
      }
LABEL_37:
      unint64_t v26 = (void *)*v26;
      if (!v26) {
        goto LABEL_38;
      }
    }

    int v18 = v28 + v38;
    int v19 = v28 + v39;
    LODWORD(v15) = v15 - v28;
    uint64_t v13 = a2;
    uint64_t v12 = a3;
    if ((_DWORD)v15) {
      continue;
    }
    return 0LL;
  }

uint64_t iconv_std_late_fallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4) {
    return 2LL;
  }
  uint64_t v5 = *(void (**)(uint64_t, void *(*)(void *, size_t, uint64_t), void *, void))(v4 + 8);
  if (!v5) {
    return 2LL;
  }
  uint64_t v8 = *a4;
  v10[0] = a3;
  v10[1] = v8;
  v10[2] = a1;
  uint64_t v11 = 0LL;
  v5(a2, _citrus_iconv_std_write_mb, v10, *(void *)(v4 + 32));
  uint64_t result = v11;
  if (!(_DWORD)v11) {
    *a4 = v10[0] - a3;
  }
  return result;
}

void *_citrus_iconv_std_write_mb(void *__src, size_t __n, uint64_t a3)
{
  if (!*(_DWORD *)(a3 + 24))
  {
    if (*(void *)(a3 + 8) >= __n)
    {
      __src = memcpy(*(void **)a3, __src, __n);
      size_t v5 = *(void *)(a3 + 8) - __n;
      *(void *)a3 += __n;
      *(void *)(a3 + 8) = v5;
    }

    else
    {
      *(_DWORD *)(a3 + 24) = 7;
    }
  }

  return __src;
}

uint64_t _citrus_iconv_std_write_uc(uint64_t result, unint64_t a2, void *a3)
{
  if (!*((_DWORD *)a3 + 6))
  {
    unint64_t v4 = a2;
    if (a2 >> 31)
    {
      *((_DWORD *)a3 + 6) = 7;
      return result;
    }

    size_t v5 = (unsigned int *)result;
    v6 = (void *)a3[2];
    uint64_t v7 = v6[1];
    uint64_t v8 = *(_DWORD **)(*v6 + 8LL);
    if (v8[7] != 2)
    {
      int v11 = a2;
      uint64_t result = do_conv((uint64_t)v6, (uint64_t)v8, 0LL, result, &v11, 0LL, 1, 0LL);
      if ((_DWORD)result) {
        goto LABEL_6;
      }
      unint64_t v4 = v11;
    }

    if (v4)
    {
      while (1)
      {
        uint64_t v12 = 0LL;
        uint64_t result = (*(uint64_t (**)(void, void, void, void, void, uint64_t *, void))(**(void **)(v7 + 200) + 48LL))( *(void *)(v7 + 200),  *a3,  a3[1],  *v5,  *(void *)(v7 + 208),  &v12,  *(void *)(*v6 + 80LL));
        if ((_DWORD)result != 92) {
          goto LABEL_14;
        }
        if (!*(_BYTE *)(*v6 + 72LL)) {
          break;
        }
LABEL_16:
        ++v5;
        if (!--v4) {
          return result;
        }
      }

      uint64_t v9 = *a3;
      uint64_t v12 = a3[1];
      uint64_t result = iconv_std_late_fallback((uint64_t)v6, *v5, v9, &v12);
      if ((_DWORD)result == 2)
      {
        if (!v8[13])
        {
          uint64_t result = 2LL;
LABEL_6:
          *((_DWORD *)a3 + 6) = result;
          return result;
        }

        uint64_t result = (*(uint64_t (**)(void, void, void, void, void, uint64_t *, void))(**(void **)(v7 + 200) + 48LL))( *(void *)(v7 + 200),  *a3,  a3[1],  v8[12],  *(void *)(v7 + 208),  &v12,  *(void *)(*v6 + 80LL));
      }

LABEL_14:
      if ((_DWORD)result) {
        goto LABEL_6;
      }
      uint64_t v10 = a3[1] - v12;
      *a3 += v12;
      a3[1] = v10;
      goto LABEL_16;
    }
  }

  return result;
}

uint64_t do_conv_map_one(uint64_t a1, _DWORD *a2, _DWORD *a3, int *a4, _DWORD *a5, int *a6)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (*(_BYTE *)(a1 + 40))
  {
    if (*a4 >= 1)
    {
      uint64_t v9 = 0LL;
      do
        a2[v9++] = *(_DWORD *)(a1 + 24);
      while (v9 < *a4);
    }

    return 0LL;
  }

  else
  {
    uint64_t v13 = a3;
    v21[0] = v22;
    v21[1] = a3;
    v21[2] = a4;
    v21[3] = 0LL;
    unsigned int v14 = (*(uint64_t (**)(void, void *))(**(void **)(a1 + 16) + 16LL))(*(void *)(a1 + 16), v21);
    unint64_t v15 = (int)v14 & 0xFFFFFFFF9FFFFFFFLL;
    LODWORD(v16) = *a4;
    if ((_DWORD)v15 == 6)
    {
      LODWORD(v16) = v16 - 1;
      *a5 = v22[(int)v16];
      v22[(int)v16] = v13[(int)v16];
    }

    if ((int)v16 >= 1)
    {
      uint64_t v16 = v16;
      int v17 = v22;
      int v18 = a2;
      do
      {
        if (a2) {
          *int v18 = *(_DWORD *)(a1 + 24);
        }
        int v19 = *v17++;
        *v13++ = v19;
        ++v18;
        --v16;
      }

      while (v16);
    }

    if ((v14 & 0x9FFFFFFD) != 0 && (_DWORD)v15 != 3)
    {
      int v20 = (v14 >> 29) & 3;
      if (!v20) {
        do_conv_map_one_cold_1();
      }
      if ((((v14 >> 29) - 1) & v20) != 0) {
        do_conv_map_one_cold_2();
      }
      if (a6) {
        *a6 = v20;
      }
    }

    else {
      return dword_188FC3F2C[v15];
    }
  }

int *_citrus_iconv_std_write_wc(int *result, uint64_t a2, uint64_t a3)
{
  if (!*(_DWORD *)(a3 + 24))
  {
    unint64_t v3 = *(void *)(a3 + 8);
    if (v3 >= 4 * a2)
    {
      if (a2)
      {
        uint64_t v4 = 4 * a2;
        size_t v5 = *(_DWORD **)a3;
        do
        {
          int v6 = *result++;
          *v5++ = v6;
          --a2;
        }

        while (a2);
        *(void *)a3 = v5;
        *(void *)(a3 + 8) = v3 - v4;
      }
    }

    else
    {
      *(_DWORD *)(a3 + 24) = 7;
    }
  }

  return result;
}

void _citrus_iconv_std_iconv_convert_cold_1()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1916, "tmpin - *in <= *inbytes");
}

void _citrus_iconv_std_iconv_convert_cold_2()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1917, "szrout <= *outbytes");
}

void _citrus_iconv_std_iconv_convert_cold_3()
{
}

void _citrus_iconv_std_iconv_convert_cold_4()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1884, "nret == EILSEQ");
}

void _citrus_iconv_std_iconv_convert_cold_5()
{
}

void _citrus_iconv_std_iconv_convert_cold_6()
{
  __assert_rtn("iconv_std_mbtowc", "citrus_iconv_std.c", 484, "wcsz <= tmpsz");
}

void _citrus_iconv_std_iconv_convert_cold_7()
{
  __assert_rtn("iconv_std_mbtowc", "citrus_iconv_std.c", 446, "wcsz != (size_t)-2");
}

void _citrus_iconv_std_iconv_convert_cold_8()
{
}

void _citrus_iconv_std_iconv_convert_cold_9()
{
}

void _citrus_iconv_std_iconv_convert_cold_10()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1715, "tmpin != *in");
}

void _citrus_iconv_std_iconv_convert_cold_11()
{
  __assert_rtn("_citrus_iconv_std_iconv_convert", "citrus_iconv_std.c", 1725, "tmpcnt == 0");
}

void _citrus_iconv_std_iconv_convert_cold_12()
{
  __assert_rtn("iconv_std_delta_remap", "citrus_iconv_std.c", 258, "wcdelta[i] <= curmb");
}

void _citrus_iconv_std_iconv_convert_cold_13()
{
  __assert_rtn("iconv_std_delta_remap", "citrus_iconv_std.c", 264, "wcdelta[j] <= curmb");
}

void init_encoding_cold_1()
{
  __assert_rtn( "init_encoding",  "citrus_iconv_std.c",  578,  "(se->se_ps == NULL && se->se_pssaved == NULL) || (se->se_ps != NULL && se->se_pssaved != NULL)");
}

void mbtocsx_cold_1()
{
  __assert_rtn("mbtocsx", "citrus_iconv_std.c", 310, "*s >= last");
}

void do_conv_cold_1()
{
  __assert_rtn("do_conv", "citrus_iconv_std.c", 977, "elen == len");
}

void do_conv_cold_2()
{
}

void do_conv_cold_3()
{
}

void do_conv_cold_4()
{
}

void do_conv_cold_5()
{
  __assert_rtn("do_conv", "citrus_iconv_std.c", 884, "tmpcnt + total == *cnt");
}

void do_conv_cold_6()
{
}

void do_conv_map_one_cold_1()
{
  __assert_rtn("do_conv_map_one", "citrus_iconv_std.c", 816, "dir != 0");
}

void do_conv_map_one_cold_2()
{
}

int ___mb_cur_max(void)
{
  return MEMORY[0x1895F8828]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1895F8898]();
}

uint64_t _citrus_csmapper_open()
{
  return MEMORY[0x189615350]();
}

uint64_t _citrus_esdb_close()
{
  return MEMORY[0x189615380]();
}

uint64_t _citrus_esdb_open()
{
  return MEMORY[0x189615388]();
}

uint64_t _citrus_mapper_close()
{
  return MEMORY[0x189615398]();
}

uint64_t _citrus_stdenc_close()
{
  return MEMORY[0x1896153D0]();
}

uint64_t _citrus_stdenc_open()
{
  return MEMORY[0x1896153D8]();
}

void bzero(void *a1, size_t a2)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1895FBC88](__size);
}

size_t mbrtowc(__int32 *a1, const char *a2, size_t a3, mbstate_t *a4)
{
  return MEMORY[0x1895FBDC8](a1, a2, a3, a4);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}