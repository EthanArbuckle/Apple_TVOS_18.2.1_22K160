uint64_t matchExec(uint64_t a1, unint64_t *a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  void *__dst;
  unsigned int v26;
  size_t __n;
  __int16 v28;
  _BYTE *v29;
  int v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  _BYTE v37[256];
  void v38[66];
  v38[64] = *MEMORY[0x1895F89C0];
  if (a3 && *a3 - 256 < 0xFFFFFF01) {
    return 4294967293LL;
  }
  v9 = *(uint64_t **)(a1 + 56);
  if (!v9)
  {
    result = matchPack(a1, 0LL, 0LL);
    if ((_DWORD)result) {
      return result;
    }
    v9 = *(uint64_t **)(a1 + 56);
  }

  __dst = a2;
  if (a3)
  {
    v26 = *a3;
    __n = 16LL * v26;
    v35 = *((_WORD *)v9 + 8);
    if (v26)
    {
      v10 = 0x100 / ((16LL * v26) | 0xAuLL);
      goto LABEL_12;
    }
  }

  else
  {
    v26 = 0;
    __n = 0LL;
    v35 = *((_WORD *)v9 + 8);
  }

  LODWORD(v10) = 25;
LABEL_12:
  v28 = v10;
  v33 = a1;
  v34 = *v9;
  v36 = v9[1];
  v29 = v37;
  v30 = 0;
  v31 = v38;
  v32 = 0;
  v11 = a2;
  if (!(_DWORD)v10)
  {
    v11 = __dst;
  }

  v12 = a2[1];
  v23 = *a2;
  v13 = v23;
  v24 = v12;
  *v11 = 0LL;
  *((void *)__dst + 1) = v12 - v13;
  if (v26 >= 2) {
    memset((char *)__dst + 16, 255, 16LL * (v26 - 1));
  }
  v30 = 0;
  v14 = v24;
  *(_DWORD *)(v29 + 6) = 0;
  if (v13 <= v14) {
    __asm { BR              X9 }
  }

  *a4 = 0;
  if (a3) {
    *a3 = v26;
  }
  if (v26)
  {
    v15 = 0LL;
    v16 = (unint64_t *)__dst;
    v17 = v23;
    v18 = v24 - v23;
    v19 = v26;
    do
    {
      v20 = *v16;
      if (*v16 > v18 || ((v21 = v16[1], v21 <= v18) ? (v22 = v20 > v21) : (v22 = 1), v22))
      {
        *v16 = 0LL;
        v16[1] = 0LL;
      }

      else
      {
        *v16 = v17 + v20;
        v16[1] = v17 + v21;
      }

      ++v15;
      v16 += 2;
    }

    while (v15 < v19);
  }

  if (v29 != v37) {
    (*(void (**)(_BYTE *, void))(a1 + 16))(v29, *(void *)(a1 + 24));
  }
  return 0LL;
}

uint64_t expandBuffers(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 32) + 10LL;
  uint64_t v2 = *(unsigned __int16 *)(a1 + 96);
  uint64_t result = (*(uint64_t (**)(unint64_t, void))(*(void *)(a1 + 80) + 8LL))( 2 * v1 * v2,  *(void *)(*(void *)(a1 + 80) + 24LL));
  if (result)
  {
    uint64_t v5 = result;
    memcpy((void *)result, *(const void **)(a1 + 48), v1 * *(unsigned int *)(a1 + 56));
    *(void *)(a1 + 48) = v5;
    v6 = (void *)(v5 + v1 * v2);
    memcpy(v6, *(const void **)(a1 + 64), v1 * *(unsigned int *)(a1 + 72));
    *(void *)(a1 + 64) = v6;
    *(_WORD *)(a1 + 40) = v2;
    return 1LL;
  }

  return result;
}

uint64_t addNodeToList(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, int a5)
{
  __int16 v6 = a4;
  size_t v10 = *(void *)(a1 + 32);
  size_t v11 = v10 + 10;
  uint64_t v12 = *a2;
  uint64_t v13 = *((unsigned int *)a2 + 2);
  if ((_DWORD)v13)
  {
    v14 = (_DWORD *)(v12 + 2);
    uint64_t v15 = *((unsigned int *)a2 + 2);
    while (*((unsigned __int16 *)v14 - 1) != a4 || *v14 != a5)
    {
      v14 = (_DWORD *)((char *)v14 + v11);
      if (!--v15) {
        goto LABEL_6;
      }
    }
  }

  else
  {
LABEL_6:
    if (v13 >= *(unsigned __int16 *)(a1 + 40))
    {
      uint64_t result = expandBuffers(a1);
      if (!(_DWORD)result) {
        return result;
      }
      uint64_t v12 = *a2;
      int v16 = *((_DWORD *)a2 + 2);
      size_t v10 = *(void *)(a1 + 32);
    }

    else
    {
      int v16 = *((_DWORD *)a2 + 2);
    }

    size_t v18 = v12 + v11 * v13;
    *((_DWORD *)a2 + 2) = v16 + 1;
    *(_WORD *)size_t v18 = v6;
    *(_DWORD *)(v18 + 2) = a5;
    *(_DWORD *)(v18 + 6) = *(_DWORD *)(a3 + 6);
    if (v10) {
      memcpy((void *)(v18 + 10), (const void *)(a3 + 10), v10);
    }
  }

  return 1LL;
}

uint64_t matchOptimize(uint64_t a1, int a2)
{
  uint64_t v196 = *MEMORY[0x1895F89C0];
  if (!a2) {
    return 0LL;
  }
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(unsigned int *)(v3 + 36);
  uint64_t v5 = (int *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(16 * v4, *(void *)(a1 + 24));
  if (!v5) {
    return 4294967292LL;
  }
  __int16 v6 = v5;
  bzero(v5, 16 * v4);
  v7 = &v6[2 * v4];
  *(void *)(v3 + 16) = v7;
  uint64_t v8 = v3 + 16;
  *(void *)(v8 + 8) = &v7[v4];
  *(_DWORD *)(v8 + 16) = 0;
  uint64_t v9 = *(void *)(v2 + 64);
  *(_DWORD *)(*(void *)(v9 + 16) + 4LL * *(unsigned int *)(v9 + 8)) = 1;
  if (*(_DWORD *)(v9 + 12))
  {
    unsigned int v10 = 0;
    do
      nodeModRefs(v2, v10++, 1);
    while (v10 < *(_DWORD *)(v9 + 12));
  }

  simplifyBranches(v2, v6);
  uint64_t v11 = *(void *)(v2 + 64);
  __src = &v6[*(unsigned int *)(v11 + 36)];
  uint64_t v192 = *(void *)(v11 + 16);
  uint64_t v12 = v6;
  uint64_t v174 = v8;
  uint64_t v188 = v2;
  v176 = v6;
  do
  {
    uint64_t v13 = *(unsigned int *)(v11 + 12);
    if (!(_DWORD)v13) {
      break;
    }
    uint64_t v14 = 0LL;
    char v171 = 0;
    uint64_t v172 = *(unsigned int *)(v11 + 12);
    do
    {
      uint64_t v15 = v11 + 16 * v14;
      v185 = (_BYTE *)(v15 + 40);
      if (*(_BYTE *)(v15 + 40) != 39) {
        goto LABEL_39;
      }
      size_t v18 = *(_DWORD **)(v15 + 48);
      int v16 = (void *)(v15 + 48);
      v17 = v18;
      unint64_t v19 = v18[1];
      if (!(_DWORD)v19)
      {
        __int16 v6 = v176;
        goto LABEL_39;
      }

      v189 = v12;
      unint64_t v20 = 0LL;
      uint64_t v173 = v14;
      v179 = (_BYTE *)(v11 + 16 * v14 + 41);
      v182 = v16;
      unint64_t v21 = 1LL;
      while (1)
      {
        uint64_t v22 = v17[v20 + 2];
        uint64_t v23 = v11 + 16 * v22;
        unsigned int v25 = *(unsigned __int8 *)(v23 + 40);
        v24 = (unsigned __int8 *)(v23 + 40);
        uint64_t v26 = (1LL << v25) & 0x1D000000010000LL;
        BOOL v27 = v25 > 0x34 || v26 == 0;
        if (v27 || v20 + 1 >= v19) {
          goto LABEL_35;
        }
        int v175 = v17[v20 + 2];
        v29 = v17 + 1;
        unsigned int v30 = 1;
        unint64_t v177 = v21;
        while (1)
        {
          unint64_t v31 = v21++;
          while (1)
          {
            uint64_t v32 = v17[v31 + 2];
            uint64_t v33 = v11;
            v34 = (unsigned __int8 *)(v11 + 16 * v32 + 40);
            v189[v30] = v32;
            if (*v17 >= 2u)
            {
              size_t v35 = 4LL * (*v29 - 1) + 8;
              v36 = (_DWORD *)(*(uint64_t (**)(size_t, void))(v188 + 8))(v35, *(void *)(v188 + 24));
              if (!v36) {
                goto LABEL_192;
              }
              v37 = v36;
              memcpy(v36, v17, v35);
              _DWORD *v37 = 1;
              _BYTE *v185 = 39;
              _BYTE *v179 = 126;
              v17 = v37;
              void *v182 = v37;
            }

            v29 = v17 + 1;
            int v38 = v17[1] - 1;
            v17[1] = v38;
            memmove(&v17[v31 + 2], &v17[v21 + 2], 4LL * (v38 - v31));
            ++v30;
            uint64_t v11 = v33;
          }

          if (nodesMightOverlap(v24, v34)) {
            break;
          }
          v29 = v17 + 1;
          uint64_t v11 = v33;
        }

        uint64_t v11 = v33;
LABEL_33:
        if (v30 >= 2) {
          break;
        }
        unint64_t v21 = v177;
LABEL_35:
        ++v20;
        unint64_t v19 = v17[1];
        ++v21;
        if (v20 >= v19)
        {
          uint64_t v2 = v188;
          uint64_t v12 = v189;
          __int16 v6 = v176;
          goto LABEL_37;
        }
      }

      int *v189 = v175;
      if (*v29 == 1)
      {
        _BYTE *v185 = 49;
        *(_DWORD *)(v11 + 16 * v173 + 44) = v17[2];
        (*(void (**)(_DWORD *, void))(v188 + 16))(v17, *(void *)(v188 + 24));
      }

      uint64_t v39 = v30;
      v40 = __src;
      uint64_t v41 = v174;
      if (*v24 != 34)
      {
        while (2)
        {
          uint64_t v43 = 0LL;
          v44 = v40;
          v40 = v189;
          do
          {
            v44[v43] = *(_DWORD *)(v11 + 16LL * v189[v43] + 44);
            if (v43)
            {
              *(_DWORD *)(v192 + 4LL * v189[v43]) = 0;
              uint64_t v45 = v189[v43];
              uint64_t v46 = *(void *)(v188 + 64);
              uint64_t v47 = v46 + 16 * v45;
              *(_BYTE *)(v47 + 40) = -1;
              *(_DWORD *)(v47 + 44) = -1;
              uint64_t v48 = *(void *)(v46 + 24);
              uint64_t v49 = *(unsigned int *)(v46 + 32);
              *(_DWORD *)(v46 + 32) = v49 + 1;
              *(_DWORD *)(v48 + 4 * v49) = v45;
            }

            ++v43;
          }

          while (v30 != v43);
          uint64_t v50 = 0LL;
          v51 = (unsigned __int8 *)(v11 + 16LL * *v44 + 40);
          do
          {
            uint64_t v52 = v44[v50];
            if (*(_DWORD *)(v192 + 4 * v52) > 1u
              || nodeCmp(v51, (unsigned __int8 *)(v11 + 16 * v52 + 40)))
            {
              uint64_t v53 = *(void *)(v188 + 64);
              uint64_t v54 = *(unsigned int *)(v53 + 12);
              if (v54 >= *(_DWORD *)(v53 + 36))
              {
                uint64_t v95 = 0xFFFFFFFFLL;
                goto LABEL_194;
              }

              __src = v44;
              *(_DWORD *)(v53 + 12) = v54 + 1;
              *(_DWORD *)(*(void *)(v53 + 16) + 4 * v54) = 1;
              uint64_t v55 = v11;
              uint64_t v56 = v11 + 16 * v54;
              v57 = (_BYTE *)(v56 + 40);
              v58 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v188 + 8))( 4LL * v30 + 8,  *(void *)(v188 + 24));
              if (!v58)
              {
                _BYTE *v57 = 34;
                *(_DWORD *)(v56 + 44) = -1;
                uint64_t v95 = 4294967292LL;
                goto LABEL_194;
              }

              _BYTE *v57 = 39;
              uint64_t v59 = v55 + 40 + 16 * v54;
              *(_BYTE *)(v59 + 1) = 33;
              *(_DWORD *)(v59 + 4) = -1;
              *(void *)(v59 + 8) = v58;
              char v171 = 1;
              _DWORD *v58 = 1;
              v58[1] = v30;
              memcpy(v58 + 2, __src, 4LL * v30);
              *(_DWORD *)(v55 + 40 + 16LL * *v189 + 4) = v54;
              uint64_t v12 = v189;
              uint64_t v2 = v188;
              __int16 v6 = v176;
              uint64_t v11 = v55;
              goto LABEL_37;
            }

            ++v50;
          }

          while (v30 != v50);
          v189 = v44;
          if (*v51 != 34) {
            continue;
          }
          break;
        }
      }

      uint64_t v42 = 1LL;
      uint64_t v2 = v188;
      uint64_t v12 = v189;
      __int16 v6 = v176;
      do
        nodeModRefCount(v188, v189[v42++], -1);
      while (v39 != v42);
      char v171 = 1;
      __src = v40;
LABEL_37:
      uint64_t v13 = v172;
      uint64_t v14 = v173;
LABEL_39:
      ++v14;
    }

    while (v14 != v13);
  }

  while ((v171 & 1) != 0);
  simplifyBranches(v2, v6);
  uint64_t v60 = *(void *)(v2 + 64);
  uint64_t v61 = *(unsigned int *)(v60 + 12);
  memset(v6, 255, 4 * v61);
  if ((_DWORD)v61)
  {
    uint64_t v63 = 0LL;
    uint64_t v64 = v60 + 40;
    do
    {
      if (*(_BYTE *)(v64 + 16 * v63) == 39)
      {
        uint64_t v65 = v64 + 16 * v63;
        *(_DWORD *)(v65 + 4) = -1;
        uint64_t v66 = v65 + 4;
        uint64_t v67 = *(void *)(v66 + 4);
        uint64_t v68 = *(unsigned int *)(v67 + 4);
        if ((_DWORD)v68)
        {
          v69 = (unsigned int *)(v67 + 8);
          int v70 = -1;
          do
          {
            unsigned int v72 = *v69++;
            uint64_t v71 = v72;
            LODWORD(v62) = *(unsigned __int8 *)(v64 + 16LL * v72) | 4;
            if ((_DWORD)v62 == 52)
            {
              uint64_t v62 = *(unsigned int *)(v64 + 16 * v71 + 4);
              if (v63 == v62)
              {
                if (v70 != -1)
                {
                  *(_DWORD *)uint64_t v66 = -1;
                  break;
                }

                *(_DWORD *)uint64_t v66 = v71;
                int v70 = v71;
              }
            }

            --v68;
          }

          while (v68);
        }
      }

      ++v63;
    }

    while (v63 != v61);
  }

  uint64_t v73 = *(void *)(v2 + 64);
  uint64_t v74 = *(unsigned int *)(v73 + 12);
  if (!(_DWORD)v74) {
    goto LABEL_190;
  }
  uint64_t v75 = 0LL;
  uint64_t v76 = *(void *)(v73 + 16);
  uint64_t v183 = *(unsigned int *)(v73 + 12);
  while (2)
  {
    uint64_t v77 = v73 + 16 * v75;
    int v79 = *(unsigned __int8 *)(v77 + 40);
    v78 = (unsigned __int8 *)(v77 + 40);
    if (v79 == 39)
    {
      uint64_t v80 = *(void *)(v73 + 16 * v75 + 48);
      memset(v195, 0, sizeof(v195));
      uint64_t v81 = *(unsigned int *)(v80 + 4);
      if ((_DWORD)v81)
      {
        uint64_t v82 = 0LL;
        char v83 = 0;
        uint64_t v84 = v80 + 8;
        while (1)
        {
          uint64_t v85 = *(unsigned int *)(v84 + 4 * v82);
          int v86 = *(unsigned __int8 *)(v73 + 16LL * v85 + 40);
          if (v86 == 16)
          {
            unint64_t v87 = *(unsigned __int8 *)(v73 + 16 * v85 + 48);
            unint64_t v88 = v87 >> 3;
            int v89 = *((unsigned __int8 *)v195 + (v87 >> 3));
            int v90 = 1 << (v87 & 7);
            if ((v90 & v89) != 0) {
              goto LABEL_93;
            }
            *((_BYTE *)v195 + v88) = v89 | v90;
          }

          else
          {
            if ((v83 & 1) != 0)
            {
              char v83 = 1;
              goto LABEL_93;
            }

            BOOL v91 = v86 != 48 || *(_DWORD *)(v73 + 16 * v75 + 44) == -1;
            if (v91 || v75 != *(_DWORD *)(v73 + 16 * v85 + 44)) {
              goto LABEL_92;
            }
            char v83 = 1;
            LODWORD(v62) = *(_DWORD *)(v84 + 4 * v82);
          }

          if (v81 == ++v82) {
            goto LABEL_94;
          }
        }
      }

      LODWORD(v82) = 0;
LABEL_92:
      char v83 = 0;
LABEL_93:
      if ((_DWORD)v82 == (_DWORD)v81)
      {
LABEL_94:
        unsigned int v92 = v81 - (v83 & 1);
        if (v92 - 16 >= 0xFFFFFFF2)
        {
          unsigned int v190 = v62;
          if ((v83 & 1) == 0)
          {
            uint64_t v186 = (uint64_t)v78;
            goto LABEL_108;
          }

          if ((_DWORD)v81)
          {
            uint64_t v93 = 0LL;
            while (1)
            {
              uint64_t v94 = *(unsigned int *)(v80 + 8 + 4 * v93);
              if (*(_BYTE *)(v73 + 16 * v94 + 40) == 16
                && !isStraightLineUntilDotStar(v73 + 40, v94, (uint64_t)v176))
              {
                break;
              }

              if (v81 == ++v93) {
                goto LABEL_106;
              }
            }
          }

          else
          {
            LODWORD(v93) = 0;
          }

          if ((_DWORD)v93 == (_DWORD)v81)
          {
LABEL_106:
            uint64_t v95 = 0xFFFFFFFFLL;
            nodeModRefCount(v188, v190, -1);
            uint64_t v96 = *(unsigned int *)(v73 + 12);
            *(_DWORD *)(v73 + 12) = v96 + 1;
            *(_DWORD *)(*(void *)(v73 + 16) + 4 * v96) = 1;
            unsigned __int8 *v78 = 56;
            *(_DWORD *)(v73 + 40 + 16 * v75 + 4) = v96;
            uint64_t v186 = v73 + 40 + 16 * v96;
            LODWORD(v81) = *(_DWORD *)(v80 + 4);
LABEL_108:
            uint64_t v97 = 8LL * v81 + 8;
            uint64_t v98 = *(void *)(v188 + 24);
            uint64_t v99 = (*(uint64_t (**)(uint64_t, uint64_t))(v188 + 8))(v97, v98);
            if (!v99) {
              goto LABEL_192;
            }
            v100 = (_BYTE *)v99;
            *(_DWORD *)uint64_t v99 = 1;
            *(_WORD *)(v99 + 4) = 255;
            *(_BYTE *)(v99 + 6) = v92;
            if (v92 > 0xFF)
            {
              uint64_t v95 = 0xFFFFFFFFLL;
LABEL_193:
              uint64_t v41 = v174;
LABEL_194:
              __int16 v6 = v176;
              goto LABEL_195;
            }

            if (*(_DWORD *)(v80 + 4))
            {
              uint64_t v180 = v98;
              unint64_t v101 = 0LL;
              int v102 = 0;
              do
              {
                uint64_t v103 = *(unsigned int *)(v80 + 8 + 4 * v101);
                uint64_t v104 = v73 + 16LL * v103;
                int v106 = *(unsigned __int8 *)(v104 + 40);
                v105 = (_BYTE *)(v104 + 40);
                if (v106 == 16)
                {
                  unsigned int v107 = *(unsigned __int8 *)(v73 + 16 * v103 + 48);
                  v108 = &v100[8 * v102];
                  v108[8] = v107;
                  uint64_t v109 = v73 + 16 * v103;
                  int v111 = *(_DWORD *)(v109 + 44);
                  v110 = (unsigned int *)(v109 + 44);
                  *((_DWORD *)v108 + 3) = v111;
                  ++v102;
                  LODWORD(v108) = *(_DWORD *)(v76 + 4 * v103) - 1;
                  *(_DWORD *)(v76 + 4 * v103) = (_DWORD)v108;
                  if ((_DWORD)v108)
                  {
                    nodeModRefCount(v188, *v110, 1);
                  }

                  else
                  {
                    _BYTE *v105 = -1;
                    unsigned int *v110 = -1;
                    uint64_t v112 = *(void *)(v73 + 24);
                    uint64_t v113 = *(unsigned int *)(v73 + 32);
                    *(_DWORD *)(v73 + 32) = v113 + 1;
                    *(_DWORD *)(v112 + 4 * v113) = v103;
                  }
                }

                ++v101;
              }

              while (v101 < *(unsigned int *)(v80 + 4));
              size_t v114 = v100[6];
              uint64_t v98 = v180;
            }

            else
            {
              size_t v114 = v92;
            }

            qsort(v100 + 8, v114, 8uLL, (int (__cdecl *)(const void *, const void *))charAltEntryCmp);
            nodeModPtrRefs(v78, -1, *(uint64_t (**)(void, uint64_t))(v188 + 16), v98);
            uint64_t v74 = v183;
            *(_BYTE *)uint64_t v186 = 18;
            *(_DWORD *)(v186 + 4) = -1;
            *(void *)(v186 + 8) = v100;
          }

          else
          {
            uint64_t v74 = v183;
          }

          LODWORD(v62) = v190;
        }
      }
    }

    if (++v75 != v74) {
      continue;
    }
    break;
  }

  uint64_t v115 = *(void *)(v188 + 64);
  __int16 v6 = v176;
  uint64_t v193 = *(unsigned int *)(v115 + 12);
  if (!(_DWORD)v193)
  {
LABEL_190:
    uint64_t v95 = splitAltNodes(v188);
    goto LABEL_191;
  }

  uint64_t v116 = 0LL;
  uint64_t v178 = *(void *)(v115 + 16);
  uint64_t v181 = *(void *)(v188 + 64);
  uint64_t v117 = v115 + 40;
  v191 = &loc_188B42000;
  while (1)
  {
    uint64_t v118 = v117 + 16 * v116;
    if (*(_BYTE *)v118 != 39) {
      goto LABEL_167;
    }
    v120 = (unsigned int *)(v118 + 4);
    uint64_t v119 = *(unsigned int *)(v118 + 4);
    if ((_DWORD)v119 == -1) {
      goto LABEL_167;
    }
    uint64_t v121 = v117 + 16 * v116;
    v124 = *(_DWORD **)(v121 + 8);
    v122 = (void *)(v121 + 8);
    v123 = v124;
    int v125 = *(unsigned __int8 *)(v117 + 16 * v119);
    if (v125 != 48) {
      break;
    }
    if (v123[1] == 2)
    {
      unsigned int v130 = v123[2];
      if (v130 == (_DWORD)v119) {
        unsigned int v130 = v123[3];
      }
      int v131 = *(unsigned __int8 *)(v117 + 16LL * v130);
      LODWORD(v191) = v130;
      if ((v131 - 16) < 3 || v131 == 52)
      {
        if (isStraightLineUntilDotStar(v117, v130, (uint64_t)v176))
        {
          *(_BYTE *)uint64_t v118 = 56;
          unsigned int *v120 = v130;
          uint64_t v132 = v188;
          goto LABEL_166;
        }
      }

      else if (v131 == 34)
      {
        nodeModPtrRefs( (unsigned __int8 *)(v117 + 16 * v116),  -1,  *(uint64_t (**)(void, uint64_t))(v188 + 16),  *(void *)(v188 + 24));
        nodeModRefCount(v188, v119, -1);
        *(_BYTE *)uint64_t v118 = 49;
        unsigned int *v120 = v130;
      }
    }

LABEL_167:
    if (++v116 == v193)
    {
      uint64_t v144 = *(void *)(v188 + 64);
      uint64_t v145 = *(unsigned int *)(v144 + 12);
      __int16 v6 = v176;
      if ((_DWORD)v145)
      {
        uint64_t v146 = 0LL;
        uint64_t v147 = *(void *)(v144 + 16);
        uint64_t v194 = *(unsigned int *)(v144 + 12);
        do
        {
          uint64_t v148 = v144 + 16 * v146;
          int v150 = *(unsigned __int8 *)(v148 + 40);
          v149 = (_BYTE *)(v148 + 40);
          if (v150 == 16)
          {
            uint64_t v151 = v144 + 40 + 16 * v146;
            unsigned int v153 = *(_DWORD *)(v151 + 4);
            v152 = (_DWORD *)(v151 + 4);
            int v154 = *(_BYTE *)(v144 + 40 + 16LL * v153) & 0xFE;
            if (v154 == 16)
            {
              int v155 = 0;
              unsigned int v156 = 0;
              v157 = v149;
              while (1)
              {
                if (v154 == 16 && v156 <= 0x3E)
                {
                  *((_BYTE *)v6 + v156++) = v157[8];
                }

                else
                {
                  if (v154 != 17) {
                    goto LABEL_181;
                  }
                  memcpy( (char *)v6 + v156,  (const void *)(*((void *)v157 + 1) + 8LL),  *(unsigned int *)(*((void *)v157 + 1) + 4LL));
                  v156 += *(_DWORD *)(*((void *)v157 + 1) + 4LL);
                }

                uint64_t v158 = *((unsigned int *)v157 + 1);
                if (*(_DWORD *)(v147 + 4 * v158) > 1u) {
                  break;
                }
                uint64_t v159 = v144 + 16 * v158;
                int v160 = *(unsigned __int8 *)(v159 + 40);
                v157 = (_BYTE *)(v159 + 40);
                int v154 = v160;
                ++v155;
              }

              ++v155;
LABEL_181:
              uint64_t v145 = v194;
              if (v156 >= 4)
              {
                v161 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v188 + 8))( v156 + 8LL,  *(void *)(v188 + 24));
                if (!v161) {
                  goto LABEL_192;
                }
                v162 = v161;
                _DWORD *v161 = 1;
                v161[1] = v156;
                memcpy(v161 + 2, v176, v156);
                uint64_t v163 = *v152;
                int v164 = v155 - 1;
                if (v155 == 1)
                {
                  LODWORD(v167) = *v152;
                }

                else
                {
                  uint64_t v165 = *(void *)(v144 + 24);
                  do
                  {
                    *(_DWORD *)(v147 + 4 * v163) = 0;
                    uint64_t v166 = v144 + 16 * v163;
                    uint64_t v167 = *(unsigned int *)(v166 + 44);
                    *(_BYTE *)(v166 + 40) = -1;
                    *(_DWORD *)(v166 + 44) = -1;
                    uint64_t v168 = *(unsigned int *)(v144 + 32);
                    *(_DWORD *)(v144 + 32) = v168 + 1;
                    *(_DWORD *)(v165 + 4 * v168) = v163;
                    uint64_t v163 = v167;
                    --v164;
                  }

                  while (v164);
                }

                _BYTE *v149 = 17;
                *(void *)(v144 + 16 * v146 + 48) = v162;
                _DWORD *v152 = v167;
                __int16 v6 = v176;
                uint64_t v145 = v194;
              }
            }
          }

          ++v146;
        }

        while (v146 != v145);
      }

      goto LABEL_190;
    }
  }

  if (v125 != 52) {
    goto LABEL_167;
  }
  v184 = v123;
  v187 = v122;
  uint64_t v126 = v123[1];
  if (!(_DWORD)v126)
  {
    LODWORD(v127) = 0;
    goto LABEL_154;
  }

  uint64_t v127 = 0LL;
  v128 = v123 + 2;
  while (2)
  {
    uint64_t v129 = v128[v127];
    if ((_DWORD)v129 == (_DWORD)v119)
    {
LABEL_141:
      if (v126 == ++v127) {
        goto LABEL_155;
      }
      continue;
    }

    break;
  }

  if (!nodesMightOverlap((unsigned __int8 *)(v117 + 16 * v119), (unsigned __int8 *)(v117 + 16 * v129)))
  {
    LODWORD(v191) = v129;
    goto LABEL_141;
  }

  LODWORD(v191) = v129;
LABEL_154:
  if ((_DWORD)v127 != (_DWORD)v126) {
    goto LABEL_167;
  }
LABEL_155:
  if ((_DWORD)v126 == 2)
  {
    uint64_t v133 = v188;
    unsigned int *v120 = v191;
    uint64_t v134 = *(void *)(v188 + 24);
    v135 = v187;
    goto LABEL_165;
  }

  uint64_t v134 = *(void *)(v188 + 24);
  uint64_t v136 = (*(uint64_t (**)(uint64_t, uint64_t))(v188 + 8))(4LL * (v126 - 1) + 8, v134);
  if (!v136)
  {
LABEL_192:
    uint64_t v95 = 4294967292LL;
    goto LABEL_193;
  }

  uint64_t v137 = *(unsigned int *)(v181 + 12);
  __int16 v6 = v176;
  if (v137 < *(_DWORD *)(v181 + 36))
  {
    *(_DWORD *)(v181 + 12) = v137 + 1;
    *(_DWORD *)(*(void *)(v181 + 16) + 4 * v137) = 1;
    uint64_t v138 = v117 + 16 * v137;
    *(_BYTE *)uint64_t v138 = 39;
    *(_DWORD *)(v138 + 4) = -1;
    *(void *)(v138 + 8) = v136;
    *(void *)uint64_t v136 = 1LL;
    v135 = v187;
    unint64_t v139 = v184[1];
    if ((_DWORD)v139)
    {
      unsigned int v140 = 0;
      for (unint64_t i = 0LL; i < v139; ++i)
      {
        int v142 = v184[i + 2];
        if (v142 != (_DWORD)v119)
        {
          uint64_t v143 = v136 + 4LL * v140++;
          *(_DWORD *)(v136 + 4) = v140;
          *(_DWORD *)(v143 + 8) = v142;
          unint64_t v139 = v184[1];
        }
      }
    }

    unsigned int *v120 = v137;
    *(_DWORD *)(v178 + 4 * v137) = 1;
    uint64_t v133 = v188;
LABEL_165:
    nodeModPtrRefs( (unsigned __int8 *)(v117 + 16 * v116),  -1,  *(uint64_t (**)(void, uint64_t))(v133 + 16),  v134);
    *(_BYTE *)uint64_t v118 = 54;
    void *v135 = *(void *)(v117 + 16 * v119 + 8);
    nodeModPtrRefs((unsigned __int8 *)(v117 + 16 * v116), 1, 0LL, 0LL);
    uint64_t v132 = v133;
LABEL_166:
    nodeModRefCount(v132, v119, -1);
    goto LABEL_167;
  }

  uint64_t v95 = 0xFFFFFFFFLL;
LABEL_191:
  uint64_t v41 = v174;
LABEL_195:
  (*(void (**)(int *, void))(v188 + 16))(v6, *(void *)(v188 + 24));
  *(void *)uint64_t v41 = 0LL;
  *(void *)(v41 + 8) = 0LL;
  *(_DWORD *)(v41 + 16) = 0;
  return v95;
}

uint64_t simplifyBranches(uint64_t result, int *a2)
{
  uint64_t v2 = *(void *)(result + 64);
  int v3 = *(_DWORD *)(v2 + 12);
  if (v3)
  {
    uint64_t v5 = result;
    unsigned int v6 = v3 - 1;
    uint64_t v7 = 16LL * (v3 - 1);
    uint64_t v8 = 40LL;
    do
    {
      uint64_t v9 = v2 + v7;
      int v10 = *(unsigned __int8 *)(v2 + v7 + 40);
      if ((v10 - 38) >= 2)
      {
        if (v10 == 49)
        {
LABEL_7:
          unsigned int v18 = 0;
          recurseThroughBranches(v5, a2, &v18, v6, 1);
          uint64_t v11 = v18;
          if (v18 == 1)
          {
            uint64_t v12 = *a2;
            uint64_t v13 = *(void *)(v5 + 64);
            uint64_t v14 = (unsigned __int8 *)(v13 + v7 + v8);
            *(_OWORD *)uint64_t v14 = *(_OWORD *)(v13 + 16 * v12 + 40);
            nodeModPtrRefs(v14, 1, 0LL, 0LL);
            nodeModRefs(v5, v6, 1);
            uint64_t result = nodeModRefCount(v5, v12, -1);
          }

          else
          {
            *(_BYTE *)(v9 + 40) = 39;
            uint64_t v15 = v2 + v7;
            *(_BYTE *)(v15 + 41) = 126;
            *(_DWORD *)(v15 + 44) = -1;
            int v16 = (_DWORD *)(*(uint64_t (**)(uint64_t, void))(v5 + 8))(4 * v11 + 8, *(void *)(v5 + 24));
            *int v16 = 1;
            uint64_t v17 = v18;
            v16[1] = v18;
            uint64_t result = (uint64_t)memcpy(v16 + 2, a2, 4 * v17);
            *(void *)(v15 + 48) = v16;
          }
        }
      }

      else if (*(_BYTE *)(v9 + 41) != 126)
      {
        goto LABEL_7;
      }

      v2 -= 16LL;
      --v6;
      v8 -= 16LL;
    }

    while (v6 != -1);
  }

  return result;
}

uint64_t splitAltNodes(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 64);
  unint64_t v2 = *(unsigned int *)(v1 + 12);
  if (!(_DWORD)v2) {
    return 0LL;
  }
  uint64_t v4 = 0LL;
  while (1)
  {
    uint64_t v5 = v1 + 16 * v4;
    uint64_t v23 = (unsigned __int8 *)(v5 + 40);
    if (*(_BYTE *)(v5 + 40) == 39)
    {
      uint64_t v8 = *(void *)(v5 + 48);
      unsigned int v6 = (uint64_t *)(v5 + 48);
      uint64_t v7 = v8;
      uint64_t v9 = (_DWORD *)(v8 + 4);
      if (*(_DWORD *)(v8 + 4) >= 0x10u) {
        break;
      }
    }

LABEL_11:
    if (++v4 >= v2) {
      return 0LL;
    }
  }

  uint64_t v22 = v4;
  while (1)
  {
    uint64_t v10 = *(unsigned int *)(v1 + 12);
    *(_DWORD *)(v1 + 12) = v10 + 1;
    *(_DWORD *)(*(void *)(v1 + 16) + 4 * v10) = 1;
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8);
    uint64_t v12 = *(void *)(a1 + 24);
    uint64_t v13 = v11(68LL, v12);
    if (!v13) {
      return 4294967292LL;
    }
    uint64_t v14 = v13;
    uint64_t v15 = (_DWORD *)v11(4LL * (*v9 - 14) + 8, v12);
    if (!v15)
    {
      (*(void (**)(uint64_t, uint64_t))(a1 + 16))(v14, v12);
      return 4294967292LL;
    }

    int v16 = v15;
    *(void *)uint64_t v14 = 0xF00000001LL;
    __int128 v17 = *(_OWORD *)(v7 + 8);
    __int128 v18 = *(_OWORD *)(v7 + 24);
    __int128 v19 = *(_OWORD *)(v7 + 40);
    *(void *)(v14 + 56) = *(void *)(v7 + 56);
    *(_OWORD *)(v14 + 40) = v19;
    *(_OWORD *)(v14 + 24) = v18;
    *(_OWORD *)(v14 + 8) = v17;
    *(_DWORD *)(v14 + 64) = v10;
    int v20 = *v9 - 14;
    *uint64_t v15 = 1;
    v15[1] = v20;
    memcpy(v15 + 2, (const void *)(v7 + 64), 4LL * (*v9 - 14));
    *(_BYTE *)(v1 + 16 * v10 + 40) = 39;
    *(void *)(v1 + 16 * v10 + 48) = v16;
    nodeModPtrRefs(v23, -1, *(uint64_t (**)(void, uint64_t))(a1 + 16), v12);
    uint64_t *v6 = v14;
    uint64_t v9 = (_DWORD *)(v14 + 4);
    uint64_t v7 = v14;
    if (*(_DWORD *)(v14 + 4) <= 0xFu)
    {
      unint64_t v2 = *(unsigned int *)(v1 + 12);
      uint64_t v4 = v22;
      goto LABEL_11;
    }
  }
}

uint64_t nodeModRefs(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v4 = result;
  uint64_t v5 = *(void *)(result + 64);
  uint64_t v6 = a2;
  uint64_t v7 = v5 + 16LL * a2;
  unsigned int v10 = *(unsigned __int8 *)(v7 + 40);
  uint64_t v9 = (unsigned __int8 *)(v7 + 40);
  unsigned int v8 = v10;
  uint64_t v11 = (1LL << v10) & 0x8400040000LL;
  BOOL v12 = v10 > 0x27 || v11 == 0;
  if (v12 && v8 != 255)
  {
    uint64_t result = nodeModRefCount(result, *(_DWORD *)(v5 + 16LL * a2 + 44), a3);
    unsigned int v8 = *v9;
  }

  switch(v8)
  {
    case 0x12u:
      uint64_t v13 = *(void *)(v5 + 16 * v6 + 48);
      if (*(_BYTE *)(v13 + 6))
      {
        unint64_t v14 = 0LL;
        uint64_t v15 = (unsigned int *)(v13 + 12);
        do
        {
          unsigned int v16 = *v15;
          v15 += 2;
          uint64_t result = nodeModRefCount(v4, v16, a3);
          ++v14;
        }

        while (v14 < *(unsigned __int8 *)(v13 + 6));
      }

      break;
    case 0x27u:
      uint64_t v17 = *(void *)(v5 + 16 * v6 + 48);
      if (*(_DWORD *)(v17 + 4))
      {
        unint64_t v18 = 0LL;
        do
          uint64_t result = nodeModRefCount(v4, *(_DWORD *)(v17 + 8 + 4 * v18++), a3);
        while (v18 < *(unsigned int *)(v17 + 4));
      }

      break;
    case 0x26u:
      return nodeModRefCount(v4, *(_DWORD *)(v5 + 16 * v6 + 48), a3);
  }

  return result;
}

uint64_t nodeModRefCount(uint64_t result, unsigned int a2, int a3)
{
  uint64_t v3 = *(void *)(result + 64);
  uint64_t v4 = *(void *)(v3 + 16);
  int v5 = *(_DWORD *)(v4 + 4LL * a2) + a3;
  *(_DWORD *)(v4 + 4LL * a2) = v5;
  if (!v5)
  {
    uint64_t v7 = a2;
    uint64_t result = nodeModRefs();
    uint64_t v8 = v3 + 16 * v7;
    *(_BYTE *)(v8 + 40) = -1;
    *(_DWORD *)(v8 + 44) = -1;
    uint64_t v9 = *(void *)(v3 + 24);
    uint64_t v10 = *(unsigned int *)(v3 + 32);
    *(_DWORD *)(v3 + 32) = v10 + 1;
    *(_DWORD *)(v9 + 4 * v10) = a2;
  }

  return result;
}

uint64_t recurseThroughBranches(uint64_t result, int *a2, _DWORD *a3, unsigned int a4, int a5)
{
  uint64_t v8 = *(void *)(result + 64);
  if (*(_DWORD *)(*(void *)(v8 + 16) + 4LL * a4) >= 2u && a5 == 0) {
    goto LABEL_12;
  }
  char v10 = a5;
  uint64_t v11 = result;
  uint64_t v12 = v8 + 16LL * a4;
  int v13 = *(unsigned __int8 *)(v12 + 40);
  switch(v13)
  {
    case '&':
      recurseThroughBranches(result, a2, a3, *(unsigned int *)(v12 + 44), 0LL);
      v24 = (unsigned int *)(v12 + 48);
LABEL_21:
      uint64_t result = recurseThroughBranches(v11, a2, a3, *v24, 0LL);
LABEL_22:
      if ((v10 & 1) != 0) {
        return result;
      }
      --*(_DWORD *)(*(void *)(v8 + 16) + 4LL * a4);
      uint64_t v25 = *(void *)(v11 + 64);
      uint64_t v26 = v25 + 16LL * a4;
      *(_BYTE *)(v26 + 40) = -1;
      *(_DWORD *)(v26 + 44) = -1;
      uint64_t v27 = *(void *)(v25 + 24);
      uint64_t v28 = *(unsigned int *)(v25 + 32);
      *(_DWORD *)(v25 + 32) = v28 + 1;
      uint64_t v23 = (unsigned int *)(v27 + 4 * v28);
      goto LABEL_24;
    case '1':
      v24 = (unsigned int *)(v8 + 16LL * a4 + 44);
      goto LABEL_21;
    case '\'':
      uint64_t v14 = v8 + 16LL * a4;
      uint64_t v17 = *(void *)(v14 + 48);
      unsigned int v16 = (uint64_t *)(v14 + 48);
      uint64_t v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        unint64_t v18 = 0LL;
        do
        {
          uint64_t result = recurseThroughBranches(v11, a2, a3, *(unsigned int *)(v15 + 4 * v18++ + 8), 0LL);
          uint64_t v15 = *v16;
        }

        while (v18 < *(unsigned int *)(*v16 + 4));
      }

      goto LABEL_22;
  }

LABEL_12:
  if (!*a3)
  {
    uint64_t v22 = 0LL;
LABEL_18:
    ++*a3;
    uint64_t v23 = (unsigned int *)&a2[v22];
LABEL_24:
    *uint64_t v23 = a4;
    return result;
  }

  uint64_t v19 = *a3;
  int v20 = a2;
  while (1)
  {
    int v21 = *v20++;
    if (v21 == a4) {
      return result;
    }
    if (!--v19)
    {
      uint64_t v22 = *a3;
      goto LABEL_18;
    }
  }

uint64_t nodeCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (a1 == a2) {
    return 0LL;
  }
  int v3 = *a1;
  int v4 = *a2;
  uint64_t result = (v3 - v4);
  if (v3 == v4)
  {
    int v6 = a1[1];
    int v7 = a2[1];
    uint64_t result = (v6 - v7);
    if (v6 == v7)
    {
      uint64_t result = 0LL;
      switch(v3)
      {
        case ' ':
        case '!':
        case '0':
        case '1':
        case '2':
        case '3':
          return result;
        case '""':
        case '#':
        case '$':
          int v8 = *((_DWORD *)a1 + 2);
          int v9 = *((_DWORD *)a2 + 2);
          goto LABEL_8;
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
          goto LABEL_11;
        case '4':
          uint64_t v10 = *((void *)a1 + 1);
          uint64_t v11 = *((void *)a2 + 1);
          size_t v12 = *(unsigned int *)(v10 + 4);
          int v13 = *(_DWORD *)(v11 + 4);
          uint64_t result = (v12 - v13);
          if ((_DWORD)v12 == v13) {
            return memcmp((const void *)(v10 + 8), (const void *)(v11 + 8), v12);
          }
          return result;
        default:
          if (v3 == 16)
          {
            int v8 = a1[8];
            int v9 = a2[8];
LABEL_8:
            uint64_t result = (v8 - v9);
          }

          else
          {
LABEL_11:
            uint64_t result = 1LL;
          }

          break;
      }
    }
  }

  return result;
}

BOOL nodesMightOverlap(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v2 = *a1;
  if (v2 != 52)
  {
    if (v2 == 16)
    {
      int v3 = *a2;
      if (v3 != 52)
      {
        if (v3 == 16) {
          return a1[8] == a2[8];
        }
        return 1LL;
      }

      uint64_t v13 = *((void *)a2 + 1);
      unsigned int v14 = *(_DWORD *)(v13 + 4);
      if (v14)
      {
        int v15 = a1[8];
        unsigned int v16 = 2;
        uint64_t v17 = v13 + 8;
        do
        {
          int v18 = *(unsigned __int8 *)(v17 + v16 - 2);
          unsigned __int8 v19 = *(_BYTE *)(v17 + v16 - 1) - v18;
          int v20 = v15 - v18;
          BOOL result = v20 <= v19;
          if (v16 >= v14) {
            break;
          }
          v16 += 2;
        }

        while (v20 > v19);
        return result;
      }

      return 0LL;
    }

    return 1LL;
  }

  int v5 = *a2;
  if (v5 == 52)
  {
    uint64_t v21 = *((void *)a1 + 1);
    unsigned int v22 = *(_DWORD *)(v21 + 4);
    if (!v22) {
      return 0LL;
    }
    unsigned int v23 = 0;
    uint64_t v24 = *((void *)a2 + 1);
    uint64_t v25 = v21 + 8;
    while (1)
    {
      char v26 = *(_BYTE *)(v25 + v23);
      uint64_t v27 = v23 | 1;
      char v28 = *(_BYTE *)(v24 + v23 + 8);
      if ((v28 - v26) <= (*(_BYTE *)(v25 + v27) - v26)
        || (v26 - v28) <= (*(_BYTE *)(v24 + v27 + 8) - v28))
      {
        break;
      }

      for (unsigned int i = 0; i < v22; i += 2)
        ;
      BOOL result = 0LL;
      v23 += 2;
      if (v23 >= v22) {
        return result;
      }
    }

    return 1LL;
  }

  if (v5 != 16) {
    return 1LL;
  }
  uint64_t v6 = *((void *)a1 + 1);
  unsigned int v7 = *(_DWORD *)(v6 + 4);
  if (!v7) {
    return 0LL;
  }
  unsigned int v8 = 2;
  uint64_t v9 = v6 + 8;
  do
  {
    int v10 = *(unsigned __int8 *)(v9 + v8 - 2);
    unsigned __int8 v11 = *(_BYTE *)(v9 + v8 - 1) - v10;
    int v12 = a2[8] - v10;
    BOOL result = v12 <= v11;
    if (v8 >= v7) {
      break;
    }
    v8 += 2;
  }

  while (v12 > v11);
  return result;
}

uint64_t isStraightLineUntilDotStar(uint64_t a1, unsigned int a2, uint64_t a3)
{
  int v3 = *(_DWORD *)(a3 + 4LL * a2);
  if (v3 == -2) {
    return 1LL;
  }
  if (v3 != -1) {
    return 0LL;
  }
  uint64_t v6 = a2;
  *(_DWORD *)(a3 + 4LL * a2) = a2;
  while (1)
  {
    int v7 = *(unsigned __int8 *)(a1 + 16 * v6);
    if (v7 == 18) {
      break;
    }
    if (v7 == 34) {
      goto LABEL_18;
    }
    if (v7 == 39)
    {
      uint64_t v14 = *(unsigned int *)(a1 + 16 * v6 + 4);
      if ((_DWORD)v14 != -1 && *(_BYTE *)(a1 + 16 * v14) == 48 && *(_DWORD *)(*(void *)(a1 + 16 * v6 + 8) + 4LL) == 2) {
        goto LABEL_18;
      }
      goto LABEL_19;
    }

    uint64_t v8 = *(unsigned int *)(a1 + 16 * v6 + 4);
    *(_DWORD *)(a3 + 4 * v8) = v6;
    uint64_t v6 = v8;
  }

  uint64_t v10 = *(void *)(a1 + 16 * v6 + 8);
  uint64_t v11 = *(unsigned __int8 *)(v10 + 6);
  if (!*(_BYTE *)(v10 + 6))
  {
LABEL_18:
    int v15 = -2;
    uint64_t result = 1LL;
    goto LABEL_20;
  }

  int v12 = (unsigned int *)(v10 + 12);
  while (1)
  {
    unsigned int v13 = *v12;
    v12 += 2;
    if ((isStraightLineUntilDotStar(a1, v13, a3) & 1) == 0) {
      break;
    }
    if (!--v11) {
      goto LABEL_18;
    }
  }

LABEL_19:
  uint64_t result = 0LL;
  int v15 = -3;
  do
  {
LABEL_20:
    uint64_t v16 = *(unsigned int *)(a3 + 4 * v6);
    *(_DWORD *)(a3 + 4 * v6) = v15;
    BOOL v17 = v16 == v6;
    uint64_t v6 = v16;
  }

  while (!v17);
  return result;
}

uint64_t charAltEntryCmp(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 - *a2;
}

uint64_t matchValidate()
{
  return 0xFFFFFFFFLL;
}

uint64_t matchUnpack(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(void *)(a3 + 32))
  {
    uint64_t v8 = *(void *)(a3 + 56);
    if (v8)
    {
      (*(void (**)(uint64_t, void))(a3 + 16))(v8, *(void *)(a3 + 24));
      *(void *)(a3 + 56) = 0LL;
    }

    uint64_t v9 = *(void (**)(void, void))(a3 + 48);
    if (v9) {
      v9(*(void *)(a3 + 32), *(void *)(a3 + 24));
    }
    *(void *)(a3 + 32) = 0LL;
    *(void *)(a3 + 48) = 0LL;
  }

  uint64_t result = 0xFFFFFFFFLL;
  if (a2 >= 6 && *(_DWORD *)a1 == 50331648)
  {
    size_t v11 = *(unsigned __int16 *)(a1 + 4);
    unint64_t v12 = a2 - (v11 + 6);
    if (a2 >= v11 + 6 && !HIDWORD(v12) && *(_WORD *)(a1 + 4))
    {
      uint64_t v14 = *(void (**)(_BYTE *, uint64_t))(a3 + 16);
      uint64_t v13 = *(void *)(a3 + 24);
      int v15 = (_BYTE *)(*(uint64_t (**)(void, uint64_t))(a3 + 8))(*(unsigned __int16 *)(a1 + 4), v13);
      if (v15)
      {
        uint64_t v16 = v15;
        int v38 = v14;
        uint64_t v17 = a1 + 6;
        bzero(v15, v11);
        unsigned __int16 v18 = 0;
        while (2)
        {
          v16[v18] = 1;
          unsigned int v19 = *(unsigned __int8 *)(v17 + v18);
          LOWORD(v20) = 2;
          switch(v19 & 0xF)
          {
            case 0u:
            case 4u:
            case 8u:
            case 0xAu:
            case 0xCu:
              LOWORD(v20) = 3;
              goto LABEL_20;
            case 2u:
            case 5u:
            case 6u:
            case 7u:
              goto LABEL_20;
            case 3u:
              int v20 = 3 * (v19 >> 4) + 1;
              goto LABEL_20;
            case 9u:
              LOWORD(v20) = 1;
              goto LABEL_20;
            case 0xBu:
            case 0xDu:
              int v20 = (v19 >> 3) | 1;
              goto LABEL_20;
            case 0xFu:
              int v20 = ((v19 >> 3) & 0x1E) - 1;
LABEL_20:
              v18 += v20;
              if ((_DWORD)v11 != v18) {
                goto LABEL_56;
              }
              int v21 = 0;
              unsigned __int16 v22 = 0;
              break;
            default:
              goto LABEL_56;
          }

          break;
        }

        while (2)
        {
          unsigned int v23 = (unsigned __int8 *)(v17 + v22);
          unint64_t v24 = *v23;
          unsigned int v25 = 2;
          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              unsigned int v25 = 3;
              goto LABEL_29;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_29;
            case 3uLL:
              unsigned int v25 = 3 * (v24 >> 4) + 1;
              goto LABEL_29;
            case 9uLL:
              unsigned int v25 = 1;
              goto LABEL_29;
            case 0xBuLL:
            case 0xDuLL:
              unsigned int v25 = (v24 >> 3) | 1;
              goto LABEL_29;
            case 0xFuLL:
              unsigned int v25 = ((v24 >> 3) & 0x1E) - 1;
LABEL_29:
              break;
            default:
              goto LABEL_56;
          }

          switch(v24 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xCuLL:
              goto LABEL_52;
            case 2uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_52;
            case 3uLL:
              unint64_t v27 = v24 >> 4;
              char v28 = (unsigned __int16 *)(v23 + 1);
              while (1)
              {
                unsigned int v30 = *v28;
                char v28 = (unsigned __int16 *)((char *)v28 + 3);
                uint64_t v29 = v30;
                if (!--v27) {
                  goto LABEL_53;
                }
              }

            case 5uLL:
              goto LABEL_53;
            case 9uLL:
              unsigned int v31 = (v24 >> 4) & 7;
              if (v31 < 4) {
                goto LABEL_52;
              }
              if (v31 != 4) {
                goto LABEL_56;
              }
              goto LABEL_53;
            case 0xAuLL:
              uint64_t v26 = *(unsigned __int16 *)(v23 + 1);
              goto LABEL_53;
            case 0xBuLL:
            case 0xDuLL:
              goto LABEL_52;
            case 0xFuLL:
              uint64_t v32 = (unsigned __int16 *)(v23 + 1);
              uint64_t v33 = (v24 >> 4) - 1;
              break;
            default:
              goto LABEL_56;
          }

          do
          {
            unsigned int v35 = *v32++;
            uint64_t v34 = v35;
            --v33;
          }

          while (v33);
LABEL_52:
          if (v25 + v21 == (_DWORD)v11)
          {
LABEL_56:
            v38(v16, v13);
            return 0xFFFFFFFFLL;
          }

LABEL_53:
          v22 += v25;
          int v21 = v22;
          break;
        }

        v38(v16, v13);
        uint64_t v36 = (*(uint64_t (**)(uint64_t, void))(a3 + 8))(24LL, *(void *)(a3 + 24));
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t result = 0LL;
          *(_WORD *)(v37 + 16) = v11;
          *(void *)uint64_t v37 = v17;
          *(void *)(v37 + 8) = a1 + v11 + 6;
          *(void *)(a3 + 32) = a1;
          *(void *)(a3 + 40) = a2;
          *(void *)(a3 + 48) = a4;
          *(void *)(a3 + 56) = v37;
          return result;
        }
      }

      return 4294967292LL;
    }
  }

  return result;
}

uint64_t matchPack(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = (unint64_t *)(a1 + 56);
  if (*(void *)(a1 + 56))
  {
LABEL_2:
    if (a2) {
      *a2 = *(void *)(a1 + 32);
    }
    uint64_t v7 = 0LL;
    if (a3) {
      *a3 = *(void *)(a1 + 40);
    }
    return v7;
  }

  uint64_t v8 = *(void *)(a1 + 64);
  if (!v8) {
    return 4294967293LL;
  }
  uint64_t v9 = (char *)(unsigned __int16)*(_DWORD *)(v8 + 12);
  if (HIWORD(*(_DWORD *)(v8 + 12))) {
    BOOL v10 = 1;
  }
  else {
    BOOL v10 = (_DWORD)v9 == 0;
  }
  if (v10) {
    return 0xFFFFFFFFLL;
  }
  size_t v11 = (char *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(8LL * (void)v9, *(void *)(a1 + 24));
  if (!v11) {
    return 4294967292LL;
  }
  unint64_t v12 = v11;
  memset(v11, 255, 4LL * (void)v9);
  uint64_t v13 = 0LL;
  int v14 = 0;
  int v15 = &v12[2 * (void)v9];
  uint64_t v16 = &v15[2 * (void)v9];
  *(_DWORD *)uint64_t v16 = *(_DWORD *)(v8 + 8);
  uint64_t v95 = v12;
  uint64_t v17 = (uint64_t)&v12[4 * (void)v9 - 4];
  unsigned int v18 = 1;
LABEL_16:
  uint64_t v19 = 4LL * v18;
  while (v19)
  {
    unint64_t v20 = *(unsigned int *)(v17 + v19);
    if (WORD1(v20)) {
      return 0xFFFFFFFFLL;
    }
    --v18;
    v19 -= 4LL;
    if (*(__int16 *)&v15[2 * v20] == -1)
    {
      int v21 = v9;
      while (1)
      {
        unsigned __int16 v22 = 0LL;
        int v23 = *(unsigned __int8 *)(v8 + 16 * v20 + 40);
        uint64_t v7 = 0xFFFFFFFFLL;
        if (v23 <= 0x21)
        {
          if (v23 == 16)
          {
            int v27 = 2;
          }

          else
          {
            if (v23 != 17)
            {
              unint64_t v25 = 0LL;
              uint64_t v26 = 0LL;
              if (v23 != 18) {
                goto LABEL_139;
              }
              int v37 = 3 * *(unsigned __int8 *)(*(void *)(v8 + 16 * v20 + 48) + 6LL);
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += v37 + 1;
              uint64_t v9 = v21;
              uint64_t v38 = *(void *)(v8 + 16 * v20 + 48);
              uint64_t v39 = *(unsigned __int8 *)(v38 + 6);
              if (*(_BYTE *)(v38 + 6))
              {
                v40 = (int *)(v38 + 12);
                do
                {
                  int v42 = *v40;
                  v40 += 2;
                  int v41 = v42;
                  --v39;
                }

                while (v39);
              }

              goto LABEL_16;
            }

            v13 += *(unsigned int *)(*(void *)(v8 + 16 * v20 + 48) + 4LL);
            int v27 = 3;
          }

          *(_WORD *)&v15[2 * v20] = v14;
          v14 += v27;
LABEL_50:
          unint64_t v29 = *(unsigned int *)(v8 + 16 * v20 + 44);
        }

        else
        {
          int v24 = 0;
          unint64_t v25 = 0LL;
          uint64_t v26 = 0LL;
          switch(*(_BYTE *)(v8 + 16 * v20 + 40))
          {
            case '""':
            case '#':
            case '$':
              int v24 = 2;
              goto LABEL_30;
            case '%':
            case '(':
            case ')':
            case '*':
            case '+':
            case ',':
            case '-':
            case '.':
            case '/':
            case '5':
            case '7':
              goto LABEL_139;
            case '&':
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += 3;
              goto LABEL_38;
            case '\'':
              int v31 = *(_DWORD *)(*(void *)(v8 + 16 * v20 + 48) + 4LL);
              if (!v31)
              {
                unsigned __int16 v22 = 0LL;
                unint64_t v25 = 0LL;
                uint64_t v26 = 0LL;
LABEL_146:
                uint64_t v7 = 0xFFFFFFFFLL;
                goto LABEL_139;
              }

              *(_WORD *)&v15[2 * v20] = v14;
              int v14 = v14 + 2 * v31 - 1;
LABEL_42:
              uint64_t v32 = *(void *)(v8 + 16 * v20 + 48);
              unsigned int v33 = *(_DWORD *)(v32 + 4);
              unint64_t v29 = *(unsigned int *)(v32 + 8);
              if (v33 >= 2)
              {
                for (unsigned __int16 i = 1; i < v33; ++i)
                {
                  uint64_t v35 = *(unsigned int *)(v32 + 4LL * i + 8);
                  if (*(__int16 *)&v15[2 * v35] == -1)
                  {
                    *(_DWORD *)&v16[4 * v18++] = v35;
                    unsigned int v33 = *(_DWORD *)(v32 + 4);
                  }
                }
              }

              break;
            case '0':
            case '2':
            case '3':
            case '8':
              int v24 = 1;
              goto LABEL_30;
            case '1':
              goto LABEL_30;
            case '4':
            case '6':
              int v24 = *(_DWORD *)(*(void *)(v8 + 16 * v20 + 48) + 4LL) + 1;
              goto LABEL_30;
            default:
              unint64_t v25 = 0LL;
              uint64_t v26 = 0LL;
              if (v23 != 255) {
                goto LABEL_139;
              }
LABEL_30:
              *(_WORD *)&v15[2 * v20] = v14;
              v14 += v24;
              if (v23 > 38)
              {
                if (v23 == 39) {
                  goto LABEL_42;
                }
                if (v23 == 255) {
                  goto LABEL_55;
                }
              }

              else
              {
                if (v23 == 38)
                {
LABEL_38:
                  uint64_t v28 = v8 + 16 * v20;
                  unint64_t v29 = *(unsigned int *)(v28 + 44);
                  uint64_t v30 = *(unsigned int *)(v28 + 48);
                  break;
                }

                if (v23 == 34) {
                  goto LABEL_55;
                }
              }

              goto LABEL_50;
          }
        }

        int v36 = *(unsigned __int16 *)&v15[2 * v29];
        if (v36 != 0xFFFF)
        {
          *(_WORD *)&v95[2 * v20] = v36;
          v14 += 3;
LABEL_55:
          uint64_t v9 = v21;
          goto LABEL_16;
        }

        uint64_t v7 = 0xFFFFFFFFLL;
        unint64_t v20 = v29;
        if (v29 >> 16) {
          return v7;
        }
      }
    }
  }

  uint64_t v43 = v13 + (unsigned __int16)v14 + 6;
  unint64_t v44 = v13;
  uint64_t v26 = (char *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(v43, *(void *)(a1 + 24));
  uint64_t v94 = v26;
  if (!v26)
  {
    unsigned __int16 v22 = 0LL;
    unint64_t v25 = 0LL;
    uint64_t v7 = 4294967292LL;
    goto LABEL_139;
  }

  if (v44 > 0x10000)
  {
    unint64_t v25 = 0LL;
    uint64_t v26 = 0LL;
    uint64_t v7 = 4294967292LL;
    unsigned __int16 v22 = v94;
    goto LABEL_139;
  }

  uint64_t v87 = v43;
  uint64_t v88 = (unsigned __int16)v14;
  uint64_t v26 = (char *)(*(uint64_t (**)(unint64_t, void))(a1 + 8))(v44, *(void *)(a1 + 24));
  uint64_t v45 = 0LL;
  size_t v46 = 0LL;
  unsigned __int16 v22 = v94;
  *(_DWORD *)uint64_t v94 = 50331648;
  *((_WORD *)v94 + 2) = v14;
  uint64_t v47 = v94 + 6;
  uint64_t v48 = (unsigned __int8 *)(v8 + 40);
  uint64_t v49 = v94 + 65541;
  __int16 v89 = v14;
  int v21 = &jpt_188B3F9D4;
  uint64_t v13 = 10LL;
  uint64_t v50 = v95;
  uint64_t v93 = v94 + 6;
  int v90 = v9;
  BOOL v91 = v26;
  do
  {
    uint64_t v51 = *(unsigned __int16 *)&v15[2 * (void)v45];
    int v52 = *v48;
    if (v51 == 0xFFFF)
    {
      uint64_t v53 = v49;
      if (v52 != 255) {
        goto LABEL_130;
      }
    }

    else
    {
      uint64_t v53 = &v47[v51];
      if (*v48 > 0x21u)
      {
        int v54 = v52 - 34;
        char v55 = 6;
        switch(v54)
        {
          case 0:
            char v55 = 5;
            goto LABEL_86;
          case 1:
            goto LABEL_86;
          case 2:
            char v55 = 7;
            goto LABEL_86;
          case 14:
          case 16:
          case 17:
          case 22:
            char v55 = 9;
            goto LABEL_86;
          case 15:
            goto LABEL_128;
          case 18:
            char v55 = 11;
            goto LABEL_86;
          case 20:
            char v55 = 13;
            goto LABEL_86;
          default:
            goto LABEL_79;
        }
      }

      switch(v52)
      {
        case 16:
          char v55 = 2;
          break;
        case 17:
          char v55 = 0;
          break;
        case 18:
          char v55 = 3;
          break;
        default:
LABEL_79:
          char v55 = 15;
          break;
      }

LABEL_86:
      *uint64_t v53 = v55;
      unsigned int v56 = *v48;
      if (v56 <= 0x21)
      {
        switch(v56)
        {
          case 0x10u:
            v53[1] = v48[8];
            break;
          case 0x11u:
            uint64_t v74 = *((void *)v48 + 1);
            size_t v92 = v46;
            uint64_t v75 = memmem(v26, v46, (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
            if (v75)
            {
              size_t v76 = v92;
              uint64_t v77 = v75 - v91;
              uint64_t v26 = v91;
            }

            else
            {
              memcpy(&v91[v92], (const void *)(v74 + 8), *(unsigned int *)(v74 + 4));
              uint64_t v26 = v91;
              uint64_t v77 = v92;
              size_t v76 = v92 + *(unsigned int *)(v74 + 4);
            }

            uint64_t v7 = 0xFFFFFFFFLL;
            uint64_t v50 = v95;
            uint64_t v47 = v94 + 6;
            uint64_t v49 = v94 + 65541;
            uint64_t v13 = 10LL;
            if (v77 > 0xFFFFFFFFLL)
            {
              unint64_t v25 = 0LL;
              goto LABEL_139;
            }

            *(_WORD *)(v53 + 1) = v77;
            *uint64_t v53 = *v53 & 3 | (4 * *(_BYTE *)(*((void *)v48 + 1) + 4LL));
            size_t v46 = v76;
            uint64_t v9 = v90;
            break;
          case 0x12u:
            uint64_t v57 = *((void *)v48 + 1);
            *uint64_t v53 = v55 | (16 * *(_BYTE *)(v57 + 6));
            if (*(_BYTE *)(v57 + 6))
            {
              unint64_t v58 = 0LL;
              uint64_t v59 = (_DWORD *)(v57 + 12);
              uint64_t v60 = &v94[v51 + 9];
              do
              {
                *uint64_t v60 = *((_BYTE *)v59 - 4);
                int v61 = *v59;
                v59 += 2;
                *((_WORD *)v60 - 1) = *(_WORD *)&v15[2 * v61];
                ++v58;
                v60 += 3;
              }

              while (v58 < *(unsigned __int8 *)(v57 + 6));
            }

            break;
        }
      }

      else
      {
        switch(*v48)
        {
          case '""':
          case '#':
          case '$':
            *(_WORD *)uint64_t v53 = *(_WORD *)v53 & 0xF | (16 * *((_WORD *)v48 + 4));
            break;
          case '&':
            *uint64_t v53 = v55 | 0x20;
            *(_WORD *)(v53 + 1) = *(_WORD *)&v15[2 * *((unsigned int *)v48 + 2)];
            break;
          case '\'':
            uint64_t v69 = *((void *)v48 + 1);
            *uint64_t v53 = v55 | (16 * *(_BYTE *)(v69 + 4));
            unsigned int v70 = *(_DWORD *)(v69 + 4);
            if (v70 >= 2)
            {
              int v71 = 1;
              int v72 = 1;
              do
              {
                *(_WORD *)&v53[2 * v71 - 2 + 1] = *(_WORD *)&v15[2
                                                               * *(unsigned int *)(v69
                                                                                 + 4LL * (unsigned __int16)v72++
                                                                                 + 8)];
                int v71 = (unsigned __int16)v72;
              }

              while (v70 > (unsigned __int16)v72);
            }

            break;
          case '0':
            *uint64_t v53 = v55;
            break;
          case '2':
            char v73 = v55 | 0x10;
            goto LABEL_113;
          case '3':
            char v73 = v55 | 0x20;
            goto LABEL_113;
          case '4':
          case '6':
            uint64_t v62 = *((void *)v48 + 1);
            unsigned int v63 = *(_DWORD *)(v62 + 4);
            if (v63 > 0x1FF)
            {
              unint64_t v25 = 0LL;
              goto LABEL_146;
            }

            unsigned int v64 = v63 >> 1;
            *uint64_t v53 = v55 & 0xF | (16 * ((v63 >> 1) & 0xF));
            if (v63 >= 2)
            {
              if (v64 <= 1) {
                uint64_t v65 = 1LL;
              }
              else {
                uint64_t v65 = v64;
              }
              uint64_t v66 = (char *)(v62 + 9);
              uint64_t v67 = &v94[v51 + 8];
              do
              {
                *(v67 - 1) = *(v66 - 1);
                char v68 = *v66;
                v66 += 2;
                *uint64_t v67 = v68;
                v67 += 2;
                --v65;
              }

              while (v65);
            }

            break;
          case '8':
            char v73 = v55 | 0x30;
LABEL_113:
            *uint64_t v53 = v73;
            break;
          default:
            break;
        }
      }

      unint64_t v78 = *v53;
      LODWORD(v79) = 2;
      switch(v78 & 0xF)
      {
        case 0uLL:
        case 4uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xCuLL:
          LODWORD(v79) = 3;
          break;
        case 2uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          break;
        case 3uLL:
          uint64_t v79 = 3 * (v78 >> 4) + 1;
          break;
        case 9uLL:
          LODWORD(v79) = 1;
          break;
        case 0xBuLL:
        case 0xDuLL:
          LODWORD(v79) = (v78 >> 3) | 1;
          break;
        case 0xFuLL:
          LODWORD(v79) = ((v78 >> 3) & 0x1E) - 1;
          break;
        default:
          LODWORD(v79) = 0;
          break;
      }

      v53 += v79;
    }

LABEL_128:
    if (*(__int16 *)&v50[2 * (void)v45] != -1)
    {
      *uint64_t v53 = 10;
      *(_WORD *)(v53 + 1) = *(_WORD *)&v50[2 * (void)v45];
    }

LABEL_130:
    ++v45;
    v48 += 16;
  }

  while (v45 != v9);
  size_t v80 = v46;
  uint64_t v81 = v26;
  uint64_t v82 = (*(uint64_t (**)(uint64_t, void, char *, uint64_t))(a1 + 8))(24LL, *(void *)(a1 + 24), v21, 10LL);
  unint64_t v25 = v82;
  if (v82)
  {
    *(_WORD *)(v82 + 16) = v89;
    *(void *)uint64_t v82 = v93;
    *(void *)(v82 + 8) = &v93[v88];
    memcpy(&v93[v88], v81, v80);
    while (!__ldaxr(v6))
    {
      if (!__stlxr(v25, v6))
      {
        int v84 = 0;
        uint64_t v7 = 0LL;
        *(void *)(a1 + 32) = v94;
        *(void *)(a1 + 40) = v87;
        uint64_t v85 = *(void (**)(char *, void))(a1 + 16);
        *(void *)(a1 + 48) = v85;
        v85(v95, *(void *)(a1 + 24));
        goto LABEL_140;
      }
    }

    uint64_t v7 = 0LL;
    __clrex();
  }

  else
  {
    uint64_t v7 = 4294967292LL;
  }

  uint64_t v26 = v81;
LABEL_139:
  uint64_t v81 = v26;
  (*(void (**)(unint64_t, void, char *, uint64_t))(a1 + 16))(v25, *(void *)(a1 + 24), v21, v13);
  int v84 = 1;
  (*(void (**)(char *, void))(a1 + 16))(v95, *(void *)(a1 + 24));
LABEL_140:
  (*(void (**)(char *, void))(a1 + 16))(v81, *(void *)(a1 + 24));
  if (v84) {
    (*(void (**)(char *, void))(a1 + 16))(v22, *(void *)(a1 + 24));
  }
  if (!(_DWORD)v7) {
    goto LABEL_2;
  }
  return v7;
}

uint64_t matchDiagram(int a1, void *a2, const char *a3)
{
  uint64_t v6 = fdopen(a1, "w");
  int v7 = dup(a1);
  if (a2[8] || a2[4])
  {
    int v55 = v7;
    fwrite("digraph nfa {\n\t/*nodesep=.15;*/\n\trankdir=LR;\n", 0x2DuLL, 1uLL, v6);
    fprintf(v6, "\tlabel = %s;\n", a3);
    int v56 = a1;
    if (a2[4])
    {
      fwrite("\tnstart [shape=Msquare, label=S];\n", 0x24uLL, 1uLL, v6);
      uint64_t v8 = a2[7];
      if (*(_WORD *)(v8 + 16))
      {
        uint64_t v9 = *(_BYTE **)v8;
        unint64_t v10 = *(void *)v8 + *(unsigned __int16 *)(v8 + 16);
        size_t v11 = *(_BYTE **)v8;
        while (2)
        {
          if ((*v11 & 0x7F) != 0x49)
          {
            fprintf(v6, "\tn%d [shape=", (_DWORD)v11 - (_DWORD)v9);
            unsigned int v12 = *v11;
            switch(v12 & 0xF)
            {
              case 0u:
              case 4u:
              case 8u:
              case 0xCu:
                fprintf(v6, "circle, label=%.*s");
                break;
              case 2u:
                fprintf(v6, "circle, label=%c");
                break;
              case 5u:
                fprintf(v6, "Msquare, label=E%d");
                break;
              case 6u:
                fprintf(v6, "Mcircle, label=%d)");
                break;
              case 7u:
                fprintf(v6, "Mcircle, label=(%d");
                break;
              case 9u:
                switch((v12 >> 4) & 7)
                {
                  case 0u:
                    uint64_t v13 = "Mcircle, label=.";
                    goto LABEL_24;
                  case 1u:
                    uint64_t v13 = "Mcircle, label=^";
                    goto LABEL_24;
                  case 2u:
                    uint64_t v13 = "Mcircle, label=$";
LABEL_24:
                    size_t v14 = 17LL;
                    goto LABEL_25;
                  case 3u:
                    uint64_t v13 = "Mcircle, label=.*";
                    goto LABEL_18;
                  default:
                    goto LABEL_26;
                }

              case 0xAu:
                fprintf(v6, "Mcircle, label=%c");
                break;
              case 0xBu:
                uint64_t v13 = "Mcircle, label=[]";
LABEL_18:
                size_t v14 = 18LL;
                goto LABEL_25;
              case 0xDu:
                uint64_t v13 = "Mcircle, label=[]*";
                size_t v14 = 19LL;
LABEL_25:
                fwrite(v13, v14, 1uLL, v6);
                break;
              case 0xFu:
                fprintf(v6, "Mcircle, headport=n, label=%c");
                break;
              default:
                fprintf(v6, "hexagon, label=%d");
                break;
            }

LABEL_26:
            if ((*v11 & 0xF) == 5) {
              fprintf(v6, "]; /* n=%p, type=%d, end */\n");
            }
            else {
              fprintf(v6, "]; /* n=%p, type=%d */\n");
            }
          }

          unint64_t v15 = *v11;
          LODWORD(v16) = 2;
          switch(v15 & 0xF)
          {
            case 0uLL:
            case 4uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xCuLL:
              LODWORD(v16) = 3;
              goto LABEL_35;
            case 2uLL:
            case 5uLL:
            case 6uLL:
            case 7uLL:
              goto LABEL_35;
            case 3uLL:
              uint64_t v16 = 3 * (v15 >> 4) + 1;
              goto LABEL_35;
            case 9uLL:
              LODWORD(v16) = 1;
              goto LABEL_35;
            case 0xBuLL:
            case 0xDuLL:
              LODWORD(v16) = (v15 >> 3) | 1;
              goto LABEL_35;
            case 0xFuLL:
              LODWORD(v16) = ((v15 >> 3) & 0x1E) - 1;
LABEL_35:
              v11 += v16;
              continue;
            default:
              goto LABEL_72;
          }
        }
      }

      goto LABEL_72;
    }

    uint64_t v17 = a2[8];
    fwrite("\tnstart [shape=Msquare, label=S];\n", 0x24uLL, 1uLL, v6);
    uint64_t v18 = *(unsigned int *)(v17 + 12);
    if (v17 + 40 + 16 * v18 - 16 < (unint64_t)(v17 + 40))
    {
LABEL_72:
      fputc(10, v6);
      if (a2[4])
      {
        fprintf(v6, "\tnstart -> n%d:w;\n", 0);
        uint64_t v26 = (unsigned __int8 **)a2[7];
        if (*((_WORD *)v26 + 8))
        {
          int v27 = *v26;
          unint64_t v28 = (unint64_t)&(*v26)[*((unsigned __int16 *)v26 + 8)];
          unint64_t v29 = *v26;
          while (2)
          {
            unsigned int v30 = *v29;
            switch(v30 & 0xF)
            {
              case 3u:
                if (v30 >= 0x10)
                {
                  unint64_t v31 = 0LL;
                  uint64_t v32 = (char *)(v29 + 3);
                  do
                  {
                    fprintf( v6,  "\tn%d -> n%d [label=%c];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *((unsigned __int16 *)v32 - 1),
                      *v32);
                    ++v31;
                    v32 += 3;
                  }

                  while (v31 < (unint64_t)*v29 >> 4);
                }

                goto LABEL_89;
              case 5u:
                goto LABEL_89;
              case 9u:
                if ((v30 & 0x70) == 0x30) {
                  fprintf( v6,  "\tn%d:e -> n%d:w;\n",
                }
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                    (unsigned __int16)((_WORD)v29 - (_WORD)v27));
                goto LABEL_88;
              case 0xDu:
                fprintf(v6, "\tn%d:e -> n%d:w;\n");
                goto LABEL_89;
              case 0xFu:
                fprintf( v6,  "\tn%d -> n%d:w;\n",
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                  (unsigned __int16)((_WORD)v29 - (_WORD)v27 + ((v30 >> 3) & 0x1E) - 1));
                if (*v29 >= 0x20u)
                {
                  uint64_t v33 = 0LL;
                  do
                  {
                    fprintf( v6,  "\tn%d -> n%d:w [arrowhead=odot];\n",
                      (unsigned __int16)((_WORD)v29 - (_WORD)v27),
                      *(unsigned __int16 *)&v29[2 * v33 + 1]);
                    unint64_t v34 = v33 + 2;
                    ++v33;
                  }

                  while (v34 < (unint64_t)*v29 >> 4);
                }

                goto LABEL_89;
              default:
LABEL_88:
                fprintf(v6, "\tn%d -> n%d:w;\n");
LABEL_89:
                unint64_t v35 = *v29;
                LODWORD(v36) = 2;
                switch(v35 & 0xF)
                {
                  case 0uLL:
                  case 4uLL:
                  case 8uLL:
                  case 0xAuLL:
                  case 0xCuLL:
                    LODWORD(v36) = 3;
                    goto LABEL_95;
                  case 2uLL:
                  case 5uLL:
                  case 6uLL:
                  case 7uLL:
                    goto LABEL_95;
                  case 3uLL:
                    uint64_t v36 = 3 * (v35 >> 4) + 1;
                    goto LABEL_95;
                  case 9uLL:
                    LODWORD(v36) = 1;
                    goto LABEL_95;
                  case 0xBuLL:
                  case 0xDuLL:
                    LODWORD(v36) = (v35 >> 3) | 1;
                    goto LABEL_95;
                  case 0xFuLL:
                    LODWORD(v36) = ((v35 >> 3) & 0x1E) - 1;
LABEL_95:
                    v29 += v36;
                    continue;
                  default:
                    goto LABEL_135;
                }
            }
          }
        }

        goto LABEL_135;
      }

      uint64_t v37 = a2[8];
      fprintf(v6, "\tnstart -> n%d:w\n", *(_DWORD *)(v37 + 8));
      uint64_t v38 = *(unsigned int *)(v37 + 12);
      if (!(_DWORD)v38)
      {
LABEL_135:
        fwrite("\n}\n", 3uLL, 1uLL, v6);
        fflush(v6);
        fclose(v6);
        dup2(v55, v56);
        return 0LL;
      }

      uint64_t v39 = v37 + 40;
      unint64_t v40 = v37 + 40 + 16 * v38;
      int v41 = (unsigned __int8 *)(v37 + 40);
      while (1)
      {
        int v42 = *v41;
        if (v42 == 255) {
          goto LABEL_128;
        }
        int v43 = *((_DWORD *)v41 + 1);
        if (*v41 > 0x26u)
        {
          if (v42 == 39)
          {
            uint64_t v52 = *((void *)v41 + 1);
            if (*(_DWORD *)(v52 + 4))
            {
              unint64_t v53 = 0LL;
              do
              {
                else {
                  fprintf(v6, "\tn%d -> n%d:s [arrowhead=odot];\n");
                }
                ++v53;
              }

              while (v53 < *(unsigned int *)(v52 + 4));
            }

            goto LABEL_128;
          }

          if (v42 == 54 || (unsigned int v44 = *((_DWORD *)v41 + 1), v42 == 56))
          {
            fprintf(v6, "\tn%d:e -> n%d:w;\n", (unint64_t)&v41[-v39] >> 4, (unint64_t)&v41[-v39] >> 4);
            unsigned int v44 = *((_DWORD *)v41 + 1);
          }
        }

        else
        {
          if (v42 == 18)
          {
            uint64_t v47 = *((void *)v41 + 1);
            if (*(_BYTE *)(v47 + 6))
            {
              unint64_t v48 = 0LL;
              uint64_t v49 = (int *)(v47 + 12);
              do
              {
                uint64_t v50 = *((unsigned __int8 *)v49 - 4);
                int v51 = *v49;
                v49 += 2;
                fprintf(v6, "\tn%d -> n%d [label=%c];\n", (unint64_t)&v41[-v39] >> 4, v51, v50);
                ++v48;
              }

              while (v48 < *(unsigned __int8 *)(v47 + 6));
            }

            goto LABEL_128;
          }

          if (v42 == 34) {
            goto LABEL_128;
          }
          unsigned int v44 = *((_DWORD *)v41 + 1);
          if (v42 == 38)
          {
            int v45 = v41[1];
            if (v45 == 42)
            {
              fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              fprintf(v6, "\tn%d:s -> n%d:s [arrowhead=odot];\n");
            }

            else
            {
              if (v45 != 43)
              {
                fprintf(v6, "\tn%d:n -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
                if (*(_BYTE *)(v39 + 16LL * *((unsigned int *)v41 + 2)) != 49)
                {
                  fprintf(v6, "\tn%d:s -> n%d:w [arrowhead=odot];\n");
                  goto LABEL_128;
                }

LABEL_133:
                fprintf(v6, "\tn%d:s -> n%d [arrowhead=odot];\n");
                goto LABEL_128;
              }

              fprintf(v6, "\tn%d:e -> n%d:w [arrowhead=dot];\n", (unint64_t)&v41[-v39] >> 4, v43);
              fprintf(v6, "\tn%d:n -> n%d:n [arrowhead=odot];\n");
            }

            goto LABEL_128;
          }
        }

        int v46 = *(unsigned __int8 *)(v39 + 16LL * v44);
        if (v46 == 38)
        {
          if (*(_BYTE *)(v39 + 16LL * v44 + 1) != 42)
          {
LABEL_127:
            fprintf(v6, "\tn%d -> n%d:w;\n");
            goto LABEL_128;
          }
        }

        else if (v46 != 49)
        {
          goto LABEL_127;
        }

        fprintf(v6, "\tn%d -> n%d;\n");
LABEL_128:
        v41 += 16;
      }
    }

    unint64_t v19 = 16 * v18 - 16;
    while (1)
    {
      unint64_t v20 = (_BYTE *)(v17 + v19 + 40);
LABEL_71:
      v19 -= 16LL;
      if (v17 + v19 + 40 < v17 + 40) {
        goto LABEL_72;
      }
    }

    unint64_t v21 = v19 >> 4;
    fprintf(v6, "\tn%d [shape=", v21);
    unsigned int v22 = *v20;
    if (v22 > 0x21)
    {
      switch(*v20)
      {
        case '""':
          fprintf(v6, "Msquare, label=E%d");
          goto LABEL_66;
        case '#':
          fprintf(v6, "Mcircle, label=%d)");
          goto LABEL_66;
        case '$':
          fprintf(v6, "Mcircle, label=(%d");
          goto LABEL_66;
        case '&':
        case '\'':
          fprintf(v6, "Mcircle, headport=n, label=%c");
          goto LABEL_66;
        case '0':
          int v23 = "Mcircle, label=.";
          goto LABEL_57;
        case '1':
          fprintf(v6, "Mcircle, label=%c");
          goto LABEL_66;
        case '2':
          int v23 = "Mcircle, label=^";
          goto LABEL_57;
        case '3':
          int v23 = "Mcircle, label=$";
LABEL_57:
          size_t v24 = 17LL;
          break;
        case '4':
          int v23 = "Mcircle, label=[]";
          goto LABEL_61;
        case '6':
          int v23 = "Mcircle, label=[]*";
          size_t v24 = 19LL;
          goto LABEL_62;
        case '8':
          int v23 = "Mcircle, label=.*";
          goto LABEL_61;
        default:
          goto LABEL_65;
      }

      goto LABEL_62;
    }

    switch(v22)
    {
      case 0x10u:
        fprintf(v6, "circle, label=%c");
        break;
      case 0x11u:
        fprintf(v6, "circle, label=%.*s");
        break;
      case 0x12u:
        int v23 = "diamond, label={}";
LABEL_61:
        size_t v24 = 18LL;
LABEL_62:
        fwrite(v23, v24, 1uLL, v6);
        break;
      default:
LABEL_65:
        fprintf(v6, "hexagon, label=%d");
        break;
    }

LABEL_66:
    int v25 = *v20;
    if (v25 == 34)
    {
      fprintf(v6, "]; /* n=%p, type=%d, end */\n");
    }

    else if (v25 == 38)
    {
      fprintf(v6, "]; /* n=%p, type=%d, left=n%u, right=n%u */\n");
    }

    else
    {
      fprintf(v6, "]; /* n=%p, type=%d, next=n%u, data=%u */\n");
    }

    goto LABEL_71;
  }

  return 0xFFFFFFFFLL;
}

    *((_BYTE *)a1 + 18) = v5;
    return 16;
  }

  switch(v5)
  {
    case '$':
      int v7 = 51;
      break;
    case '(':
      if (v6) {
        *a1 = v4 + 1;
      }
      else {
        int v7 = 37;
      }
      break;
    case ')':
      int v7 = 35;
      break;
    case '*':
      if (v6)
      {
        *a1 = v4 + 1;
        int v7 = 42;
      }

      else
      {
        int v7 = 41;
      }

      break;
    case '+':
      if (v6)
      {
        *a1 = v4 + 1;
        int v7 = 44;
      }

      else
      {
        int v7 = 43;
      }

      break;
    case '.':
      int v7 = 48;
      break;
    default:
      goto LABEL_66;
  }

  return v7;
}

size_t printGraphNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = a2 + 16LL * a3;
  fprintf(a1, "[#%x->%x ", a3, *(_DWORD *)(v6 + 44));
  switch(*(_BYTE *)(v6 + 40))
  {
    case 0x10:
      fprintf(a1, "'%c'");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x11:
      fprintf(a1, "%.*s");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x12:
      uint64_t v8 = *(void *)(a2 + 16LL * a3 + 48);
      fputc(123, a1);
      if (*(_BYTE *)(v8 + 6))
      {
        unint64_t v9 = 0LL;
        unint64_t v10 = (int *)(v8 + 12);
        do
        {
          if (v9) {
            fputc(32, a1);
          }
          uint64_t v11 = *((char *)v10 - 4);
          int v12 = *v10;
          v10 += 2;
          fprintf(a1, "'%c'->%x", v11, v12);
          ++v9;
        }

        while (v9 < *(unsigned __int8 *)(v8 + 6));
      }

      putchar(125);
      goto LABEL_13;
    case 0x13:
    case 0x14:
    case 0x15:
    case 0x16:
    case 0x17:
    case 0x18:
    case 0x19:
    case 0x1A:
    case 0x1B:
    case 0x1C:
    case 0x1D:
    case 0x1E:
    case 0x1F:
    case 0x20:
    case 0x21:
    case 0x2F:
    case 0x35:
    case 0x37:
      goto LABEL_5;
    case 0x22:
      fprintf(a1, "E r=%d");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x23:
LABEL_13:
      int v13 = 41;
      goto LABEL_41;
    case 0x24:
      int v13 = 40;
      goto LABEL_41;
    case 0x25:
      int v7 = "(?";
      goto LABEL_43;
    case 0x26:
      fprintf(a1, "->%x alt:%c");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x27:
      fwrite("alts", 4uLL, 1uLL, a1);
      uint64_t v14 = a2 + 16LL * a3;
      uint64_t v17 = *(void *)(v14 + 48);
      uint64_t v16 = (uint64_t *)(v14 + 48);
      uint64_t v15 = v17;
      if (*(_DWORD *)(v17 + 4))
      {
        unint64_t v18 = 0LL;
        do
        {
          fprintf(a1, " ->%x", *(_DWORD *)(v15 + 4 * v18++ + 8));
          uint64_t v15 = *v16;
        }

        while (v18 < *(unsigned int *)(*v16 + 4));
      }

      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x28:
      int v7 = "cons";
      goto LABEL_24;
    case 0x29:
      int v13 = 42;
      goto LABEL_41;
    case 0x2A:
      int v7 = "*?";
      goto LABEL_43;
    case 0x2B:
      int v13 = 43;
      goto LABEL_41;
    case 0x2C:
      int v7 = "+?";
      goto LABEL_43;
    case 0x2D:
      int v13 = 63;
      goto LABEL_41;
    case 0x2E:
      int v7 = "??";
      goto LABEL_43;
    case 0x30:
      int v13 = 46;
      goto LABEL_41;
    case 0x31:
      int v7 = "[S]";
      size_t v19 = 3LL;
      goto LABEL_44;
    case 0x32:
      int v13 = 94;
      goto LABEL_41;
    case 0x33:
      int v13 = 36;
      goto LABEL_41;
    case 0x34:
      fputc(91, a1);
      goto LABEL_37;
    case 0x36:
      fwrite("*[", 2uLL, 1uLL, a1);
LABEL_37:
      uint64_t v20 = a2 + 16LL * a3;
      uint64_t v23 = *(void *)(v20 + 48);
      unsigned int v22 = (uint64_t *)(v20 + 48);
      uint64_t v21 = v23;
      if (*(_DWORD *)(v23 + 4))
      {
        unsigned int v24 = 0;
        do
        {
          fprintf(a1, "%c-%c", *(char *)(v21 + 8 + v24), *(char *)(v21 + 8 + v24 + 1));
          v24 += 2;
          uint64_t v21 = *v22;
        }

        while (v24 < *(_DWORD *)(*v22 + 4));
      }

      int v13 = 93;
LABEL_41:
      fputc(v13, a1);
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0x38:
      int v7 = ".*";
LABEL_43:
      size_t v19 = 2LL;
      goto LABEL_44;
    default:
      if (*(unsigned __int8 *)(v6 + 40) == 255)
      {
        int v7 = "DEAD";
LABEL_24:
        size_t v19 = 4LL;
LABEL_44:
        fwrite(v7, v19, 1uLL, a1);
      }

      else
      {
LABEL_5:
        fprintf(a1, "(unknown type %x)");
      }

      return fwrite("]\n", 2uLL, 1uLL, a1);
  }

size_t printRunNode(FILE *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v5 = a3;
  uint64_t v6 = **(void **)(a2 + 56);
  int v7 = (unsigned __int8 *)(v6 + a3);
  fprintf(a1, "[#%x ", a3);
  unsigned int v8 = *v7;
  switch(v8 & 0xF)
  {
    case 0u:
    case 4u:
    case 8u:
    case 0xCu:
      fprintf(a1, "%.*s");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 2u:
      fprintf(a1, "'%c'");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 3u:
      fputc(123, a1);
      if (*v7 >= 0x10u)
      {
        unint64_t v9 = 0LL;
        unint64_t v10 = (char *)(v5 + v6 + 3);
        do
        {
          if (v9) {
            fputc(32, a1);
          }
          fprintf(a1, "'%c'->%x", *v10, *((unsigned __int16 *)v10 - 1));
          ++v9;
          v10 += 3;
        }

        while (v9 < (unint64_t)*v7 >> 4);
      }

      int v11 = 125;
      goto LABEL_14;
    case 5u:
      fprintf(a1, "E r=%d");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 6u:
      int v11 = 41;
      goto LABEL_14;
    case 7u:
      int v11 = 40;
LABEL_14:
      fputc(v11, a1);
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 9u:
      switch((v8 >> 4) & 7)
      {
        case 0u:
          int v11 = 46;
          goto LABEL_14;
        case 1u:
          int v11 = 94;
          goto LABEL_14;
        case 2u:
          int v11 = 36;
          goto LABEL_14;
        case 3u:
          int v12 = ".*";
          size_t v13 = 2LL;
          goto LABEL_21;
        default:
          return fwrite("]\n", 2uLL, 1uLL, a1);
      }

      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0xAu:
      fprintf(a1, "->%x [S]");
      return fwrite("]\n", 2uLL, 1uLL, a1);
    case 0xBu:
      int v12 = "[...]";
      size_t v13 = 5LL;
      goto LABEL_21;
    case 0xDu:
      int v12 = "[...]*";
      size_t v13 = 6LL;
LABEL_21:
      fwrite(v12, v13, 1uLL, a1);
      break;
    case 0xFu:
      fprintf(a1, "alts ->%x", a3 + ((v8 >> 3) & 0x1E) - 1);
      if (*v7 >= 0x20u)
      {
        unsigned int v15 = 1;
        do
          fprintf(a1, " ->%x", *(unsigned __int16 *)&v7[2 * v15++ - 1]);
        while (v15 < *v7 >> 4);
      }

      break;
    default:
      fprintf(a1, "(unknown type %x)");
      break;
  }

  return fwrite("]\n", 2uLL, 1uLL, a1);
}

uint64_t matchPrintNodes(int a1, uint64_t a2)
{
  int v4 = fdopen(a1, "w");
  int v5 = dup(a1);
  uint64_t v6 = *(uint64_t **)(a2 + 56);
  uint64_t v7 = *(void *)(a2 + 64);
  uint64_t v8 = *v6;
  if (*v6)
  {
    uint64_t v9 = *((unsigned __int16 *)v6 + 8);
    fprintf(v4, "== matchPrintNodes: run nodes (start=0, count=%x) ==\n", *((unsigned __int16 *)v6 + 8));
    if (v9)
    {
      unsigned __int16 v10 = 0;
      while (2)
      {
        printRunNode(v4, a2, v10);
        unsigned int v11 = *(unsigned __int8 *)(v8 + v10);
        LOWORD(v12) = 2;
        switch(v11 & 0xF)
        {
          case 0u:
          case 4u:
          case 8u:
          case 0xAu:
          case 0xCu:
            LOWORD(v12) = 3;
            goto LABEL_10;
          case 2u:
          case 5u:
          case 6u:
          case 7u:
            goto LABEL_10;
          case 3u:
            int v12 = 3 * (v11 >> 4) + 1;
            goto LABEL_10;
          case 9u:
            LOWORD(v12) = 1;
            goto LABEL_10;
          case 0xBu:
          case 0xDu:
            int v12 = (v11 >> 3) | 1;
            goto LABEL_10;
          case 0xFu:
            int v12 = ((v11 >> 3) & 0x1E) - 1;
LABEL_10:
            v10 += v12;
            continue;
          default:
            return 0xFFFFFFFFLL;
        }

        break;
      }
    }

    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }

  if (v7)
  {
    fprintf(v4, "== matchPrintNodes: graph nodes (start=%x, count=%x) ==\n", *(_DWORD *)(v7 + 8), *(_DWORD *)(v7 + 12));
    if (*(_DWORD *)(v7 + 12))
    {
      unsigned int v13 = 0;
      unsigned __int16 v14 = 0;
      do
      {
        uint64_t v15 = *(void *)(v7 + 16);
        if (v15) {
          fprintf(v4, "rc=%u ", *(_DWORD *)(v15 + 4LL * v14));
        }
        printGraphNode(v4, v7, v13);
        unsigned int v13 = ++v14;
      }

      while (*(_DWORD *)(v7 + 12) > v14);
    }

    fwrite("== end nodes==\n", 0xFuLL, 1uLL, v4);
  }

  fflush(v4);
  fclose(v4);
  dup2(v5, a1);
  return 0LL;
}

uint64_t matchInit(uint64_t *a1, void *(__cdecl *a2)(size_t __size), void (__cdecl *a3)(void *), uint64_t a4)
{
  if (a2) {
    BOOL v7 = a3 == 0LL;
  }
  else {
    BOOL v7 = 1;
  }
  int v8 = v7;
  if (v7)
  {
    uint64_t v9 = malloc_wrapper;
    uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))malloc_wrapper)(72LL, a4);
  }

  else
  {
    uint64_t v9 = a2;
    uint64_t v10 = ((uint64_t (*)(uint64_t, uint64_t))a2)(72LL, a4);
  }

  if (!v10) {
    return 4294967292LL;
  }
  uint64_t v11 = v10;
  uint64_t result = 0LL;
  unsigned int v13 = free_wrapper;
  *(_OWORD *)uint64_t v11 = 0u;
  *(_OWORD *)(v11 + 16) = 0u;
  if (!v8) {
    unsigned int v13 = a3;
  }
  *(_OWORD *)(v11 + 32) = 0uLL;
  *(_OWORD *)(v11 + 48) = 0uLL;
  *(_DWORD *)uint64_t v11 = 1;
  *(void *)(v11 + 8) = v9;
  *(void *)(v11 + 16) = v13;
  *(void *)(v11 + 24) = a4;
  *(void *)(v11 + 56) = 0LL;
  *(void *)(v11 + 64) = 0LL;
  *a1 = v11;
  return result;
}

uint64_t matchSetOption( unsigned int *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  if (!a1) {
    return 4294967294LL;
  }
  if (a2 != 1) {
    return 4294967293LL;
  }
  uint64_t result = 0LL;
  *a1 = *a1 & 0xFFFFFFFE | (a9 != 0);
  return result;
}

unsigned __int8 *nodeModPtrRefs( unsigned __int8 *result, int a2, uint64_t (*a3)(void, uint64_t), uint64_t a4)
{
  unsigned int v4 = *result;
  BOOL v5 = v4 > 0x36;
  uint64_t v6 = (1LL << v4) & 0x50008000060000LL;
  BOOL v7 = v5 || v6 == 0;
  if (!v7)
  {
    int v8 = (_DWORD *)*((void *)result + 1);
    BOOL v7 = *v8 + a2 == 0;
    *v8 += a2;
    if (v7) {
      return (unsigned __int8 *)a3(*((void *)result + 1), a4);
    }
  }

  return result;
}

uint64_t nfaFree(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  if (*(_DWORD *)(a1 + 36) && *(_DWORD *)(a1 + 12))
  {
    unint64_t v5 = 0LL;
    uint64_t v6 = (uint64_t *)(a1 + 48);
    do
    {
      unsigned int v7 = *((unsigned __int8 *)v6 - 8);
      BOOL v8 = v7 > 0x36;
      uint64_t v9 = (1LL << v7) & 0x50008000060000LL;
      if (!v8 && v9 != 0)
      {
        int v11 = *(_DWORD *)*v6 - 1;
        *(_DWORD *)uint64_t *v6 = v11;
        if (!v11) {
          a2(*v6, a3);
        }
      }

      v6 += 2;
      ++v5;
    }

    while (v5 < *(unsigned int *)(a1 + 12));
  }

  return a2(a1, a3);
}

uint64_t matchFree(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 64);
    if (v2) {
      nfaFree(v2, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16), *(void *)(v1 + 24));
    }
    uint64_t v3 = *(void *)(v1 + 56);
    if (v3) {
      (*(void (**)(uint64_t, void))(v1 + 16))(v3, *(void *)(v1 + 24));
    }
    if (*(void *)(v1 + 32))
    {
      unsigned int v4 = *(void (**)(void))(v1 + 48);
      if (v4) {
        v4();
      }
    }

    return (*(uint64_t (**)(uint64_t, void))(v1 + 16))(v1, *(void *)(v1 + 24));
  }

  return result;
}

uint64_t matchCompile(uint64_t a1, unsigned __int8 *a2, unint64_t a3, int a4)
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  v27[0] = a2;
  v27[1] = &a2[a3];
  char v28 = 0;
  char v29 = *(_BYTE *)a1 & 1;
  uint64_t v23 = a1;
  if (a3 > 0x1553555) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = 6 * a3 + 6;
  uint64_t v8 = (*(uint64_t (**)(uint64_t, void))(a1 + 8))(16LL * v7 + 56, *(void *)(a1 + 24));
  if (!v8) {
    return 4294967292LL;
  }
  uint64_t v9 = v8;
  *(_DWORD *)(v8 + 12) = 0;
  *(void *)uint64_t v8 = a1;
  *(void *)(v8 + 16) = 0LL;
  *(void *)(v8 + 24) = 0LL;
  *(_DWORD *)(v8 + 32) = 0;
  *(_DWORD *)(v8 + 36) = v7;
  v16[64] = 0;
  uint64_t v24 = v8;
  uint64_t v25 = v8 + 40;
  unsigned int v26 = 0;
  char v21 = 1;
  uint64_t v19 = 0LL;
  int v20 = 0;
  char v17 = 33;
  uint64_t v18 = 1LL;
  int v10 = tokenize(v27);
  unsigned __int8 v11 = v10;
  if (v10 == 50)
  {
    char v22 = 1;
  }

  else
  {
    char v22 = 0;
    handleToken((uint64_t)v16, 0x30u);
    handleOperator((uint64_t)v16, 0x2Au);
  }

  if (v29) {
    unsigned int v12 = 37;
  }
  else {
    unsigned int v12 = 36;
  }
  handleOperator((uint64_t)v16, v12);
  do
  {
    uint64_t v13 = handleToken((uint64_t)v16, v11);
    if ((_DWORD)v13)
    {
      uint64_t v4 = v13;
      uint64_t v24 = 0LL;
      uint64_t v25 = 0LL;
      (*(void (**)(uint64_t, void))(a1 + 16))(v9, *(void *)(a1 + 24));
      return v4;
    }

    int v14 = tokenize(v27);
    unsigned __int8 v11 = v14;
  }

  while (v14 != 34);
  if ((_DWORD)v19 && (evaluateOperator((uint64_t)v16, 0x23u), char v21 = 0, (_DWORD)v19))
  {
    (*(void (**)(uint64_t, void))(a1 + 16))(v9, *(void *)(a1 + 24));
    return 4294967291LL;
  }

  else
  {
    handleOperator((uint64_t)v16, 0x22u);
    evaluateOperator((uint64_t)v16, 0x21u);
    uint64_t v4 = 0LL;
    *(_DWORD *)(v25 + 16LL * v26 + 8) = a4;
    *(void *)(a1 + 64) = v9;
  }

  return v4;
}

uint64_t tokenize(unsigned __int8 **a1)
{
  char v1 = 0;
  uint64_t v3 = *a1;
  unint64_t v2 = (unint64_t)a1[1];
  do
  {
    uint64_t v4 = v3 + 1;
    *a1 = v3 + 1;
    int v5 = *v3;
    if ((v1 & 1) != 0 || *((_BYTE *)a1 + 16)) {
      goto LABEL_66;
    }
    char v1 = 1;
    ++v3;
  }

  while (v5 == 92);
  int v6 = (unint64_t)v4 < v2 && *v4 == 63;
  if (v5 > 62)
  {
    if (v5 > 93)
    {
      if (v5 == 94) {
        return 50;
      }
      if (v5 == 124) {
        return 38;
      }
    }

    else
    {
      if (v5 == 63)
      {
        if (v6)
        {
          *a1 = v4 + 1;
          return 46;
        }

        else
        {
          return 45;
        }
      }

      if (v5 == 91)
      {
        char v8 = 0;
        char v9 = 0;
        char v10 = 0;
        unsigned int v11 = 0;
        unsigned int v12 = (char *)a1 + 28;
        char v13 = 1;
        while (2)
        {
          char v14 = 0;
          v12[v11] = 0;
          do
          {
            uint64_t v15 = v4++;
            *a1 = v4;
            unsigned int v16 = *v15;
            if ((v14 & 1) != 0) {
              goto LABEL_32;
            }
            char v14 = 1;
          }

          while (v16 == 92);
          switch(v16)
          {
            case '-':
              if ((v9 & 1) != 0)
              {
                char v13 = 0;
                char v8 = 1;
                goto LABEL_36;
              }

              unsigned int v16 = 45;
              break;
            case '^':
              if ((v13 & 1) != 0)
              {
                char v10 = 1;
                char v13 = 1;
                goto LABEL_37;
              }

              unsigned int v16 = 94;
              break;
            case ']':
              if ((v13 & 1) == 0)
              {
                if ((v8 & 1) != 0) {
                  v12[v11 - 1] = 45;
                }
                if (!v11) {
                  goto LABEL_56;
                }
                if (v11 <= 2)
                {
                  unsigned int v11 = 0;
                  if ((v10 & 1) == 0) {
                    goto LABEL_61;
                  }
                  char v38 = *v12;
                  goto LABEL_60;
                }

LABEL_38:
                uint64_t v20 = 0LL;
                char v21 = (char *)a1 + 30;
                unint64_t v22 = 2LL;
                unint64_t v23 = v11;
                do
                {
                  uint64_t v24 = 0LL;
                  uint64_t v25 = v20;
                  v20 += 2LL;
                  LODWORD(v26) = v25;
                  do
                  {
                    else {
                      uint64_t v26 = (v22 + v24);
                    }
                    v24 += 2LL;
                  }

                  while (v22 + v24 < v23);
                  if (v25 != v26)
                  {
                    char v27 = v12[v26];
                    v12[v26] = v12[v25];
                    v12[v25] = v27;
                    int v28 = v26 + 1;
                    char v29 = v12[v28];
                    uint64_t v30 = v25 | 1;
                    v12[v28] = v12[v30];
                    v12[v30] = v29;
                  }

                  v22 += 2LL;
                  v21 += 2;
                }

                while (v22 < v23);
                uint64_t v31 = 0LL;
                unsigned int v11 = 0;
                do
                {
                  unsigned int v32 = *((unsigned __int8 *)a1 + v31 + 30);
                  uint64_t v33 = v11 + 1;
                  unsigned int v34 = v12[v33];
                  if (v32 <= v34)
                  {
                    unsigned int v36 = *((unsigned __int8 *)a1 + v31 + 31);
                    if (v34 > v36) {
                      LOBYTE(v36) = v12[v33];
                    }
                    v12[v33] = v36;
                  }

                  else
                  {
                    uint64_t v35 = v11 + 2;
                    if (v31 + 2 == v35)
                    {
                      unsigned int v11 = v31 + 2;
                    }

                    else
                    {
                      v12[v35] = v32;
                      v12[v11 + 3] = *((_BYTE *)a1 + v31 + 31);
                      v11 += 2;
                    }
                  }

                  unint64_t v37 = v31 + 4;
                  v31 += 2LL;
                }

                while (v37 < v23);
LABEL_56:
                if ((v10 & 1) == 0)
                {
LABEL_61:
                  *((_DWORD *)a1 + 6) = v11 + 2;
                  return 52;
                }

                char v38 = *v12;
                if (v11)
                {
                  for (unsigned int i = 0; i < v11; v12[v40] = v12[i] - 1)
                  {
                    unsigned int v40 = i + 1;
                    v12[i] = v12[i + 1] + 1;
                    i += 2;
                  }
                }

LABEL_60:
                v12[v11] = v12[v11 + 1] + 1;
                v12[v11 + 1] = v38 - 1;
                goto LABEL_61;
              }

              unsigned int v16 = 93;
              break;
          }

LABEL_32:
          *((_BYTE *)a1 + 18) = v16;
          if ((v8 & 1) != 0)
          {
            uint64_t v17 = v11 - 1;
            v12[v17] = v16;
            uint64_t v18 = v11 - 2;
            unsigned int v19 = v12[v18];
            char v8 = 0;
            char v9 = 0;
            char v13 = 0;
            if (v16 < v19)
            {
              v12[v17] = v19;
              v12[v18] = v16;
            }

LABEL_37:
            uint64_t v4 = v15 + 1;
            if (v11 < 0x20) {
              continue;
            }
            goto LABEL_38;
          }

          break;
        }

        char v8 = 0;
        char v13 = 0;
        v12[v11] = v16;
        v12[v11 + 1] = v16;
        v11 += 2;
LABEL_36:
        char v9 = 1;
        goto LABEL_37;
      }
    }

uint64_t handleToken(uint64_t a1, unsigned int a2)
{
  if ((a2 & 0x30) == 0x20)
  {
    handleOperator(a1, a2);
    return 0LL;
  }

  if (!*(_BYTE *)(a1 + 436)) {
    handleOperator(a1, 0x28u);
  }
  uint64_t v5 = *(void *)(a1 + 448);
  uint64_t v6 = *(void *)(a1 + 456);
  uint64_t v7 = *(unsigned int *)(v5 + 12);
  *(_DWORD *)(v5 + 12) = v7 + 1;
  uint64_t v8 = v6 + 16 * v7;
  *(_BYTE *)uint64_t v8 = a2;
  *(_BYTE *)(v8 + 1) = 95;
  *(void *)(v8 + 4) = -1LL;
  if (a2 == 16)
  {
    *(_BYTE *)(*(void *)(a1 + 456) + 16 * v7 + 8) = *(_BYTE *)(a1 + 490);
  }

  else if (a2 == 52)
  {
    size_t v9 = *(unsigned int *)(a1 + 496) + 8LL;
    char v10 = (_DWORD *)(*(uint64_t (**)(size_t, void))(**(void **)(a1 + 448) + 8LL))( v9,  *(void *)(**(void **)(a1 + 448) + 24LL));
    if (!v10) {
      return 4294967292LL;
    }
    unsigned int v11 = v10;
    memcpy(v10, (const void *)(a1 + 492), v9);
    *unsigned int v11 = 1;
    *(void *)(*(void *)(a1 + 456) + 16 * v7 + 8) = v11;
  }

  uint64_t v12 = *(unsigned int *)(a1 + 256);
  if (v12 <= 0x1F)
  {
    *(_WORD *)(a1 + 8 * v12) = v7;
    if (!WORD1(v7))
    {
      *(_WORD *)(a1 + 8LL * *(unsigned int *)(a1 + 256) + 2) = v7;
      uint64_t v13 = *(unsigned int *)(a1 + 256);
      *(_DWORD *)(a1 + 8 * v13 + 4) = *(_DWORD *)(a1 + 424);
      *(_DWORD *)(a1 + 256) = v13 + 1;
    }
  }

  uint64_t result = 0LL;
  *(_BYTE *)(a1 + 436) = 0;
  return result;
}

uint64_t handleOperator(uint64_t result, unsigned int a2)
{
  uint64_t v2 = result;
  if (a2 == 35)
  {
    if (!*(_DWORD *)(result + 424)) {
      return result;
    }
    uint64_t result = evaluateOperator(result, 0x23u);
    goto LABEL_12;
  }

  if ((a2 & 0xFE) != 0x24)
  {
    uint64_t result = evaluateOperator(result, a2);
    uint64_t v5 = *(unsigned int *)(v2 + 292);
    if (v5 <= 0x1F)
    {
      *(_BYTE *)(v2 + v5 + 260) = a2;
      uint64_t v6 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v6 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v6 + 1;
    }

    if (a2 - 41 < 6)
    {
LABEL_12:
      char v7 = 0;
LABEL_22:
      *(_BYTE *)(v2 + 436) = v7;
      return result;
    }

LABEL_21:
    char v7 = 1;
    goto LABEL_22;
  }

  if (a2 != 36 || *(int *)(result + 432) <= 16)
  {
    if (*(_BYTE *)(result + 436))
    {
      LODWORD(v4) = *(_DWORD *)(result + 292);
    }

    else
    {
      uint64_t result = evaluateOperator(result, 0x28u);
      uint64_t v4 = *(unsigned int *)(v2 + 292);
      if (v4 <= 0x1F)
      {
        *(_BYTE *)(v2 + v4 + 260) = 40;
        uint64_t v8 = *(unsigned int *)(v2 + 292);
        *(_DWORD *)(v2 + 4 * v8 + 296) = *(_DWORD *)(v2 + 432);
        LODWORD(v4) = v8 + 1;
        *(_DWORD *)(v2 + 292) = v8 + 1;
      }

      *(_BYTE *)(v2 + 436) = 1;
    }

    if (v4 <= 0x1F)
    {
      *(_BYTE *)(v2 + v4 + 260) = a2;
      uint64_t v9 = *(unsigned int *)(v2 + 292);
      *(_DWORD *)(v2 + 4 * v9 + 296) = *(_DWORD *)(v2 + 432);
      *(_DWORD *)(v2 + 292) = v9 + 1;
    }

    if (a2 == 36) {
      *(int32x2_t *)(v2 + 428) = vadd_s32(*(int32x2_t *)(v2 + 428), (int32x2_t)0x100000001LL);
    }
    ++*(_DWORD *)(v2 + 424);
    goto LABEL_21;
  }

  return result;
}

uint64_t evaluateOperator(uint64_t result, unsigned int a2)
{
  uint64_t v3 = (int32x2_t *)result;
  while (2)
  {
    while (1)
    {
      __int32 v4 = v3[36].i32[1];
      if (a2 != 35) {
        break;
      }
      if (v4) {
        goto LABEL_7;
      }
LABEL_9:
      uint64_t result = verifyOperandCount((uint64_t)v3, 1);
      int32x2_t v7 = v3[56];
      int32x2_t v8 = v3[57];
      uint64_t v9 = *(unsigned int *)(*(void *)&v7 + 12LL);
      *(_DWORD *)(*(void *)&v7 + 12LL) = v9 + 1;
      uint64_t v10 = (v3[32].i32[0] - 1);
      v3[32].i32[0] = v10;
      uint64_t v11 = *(void *)&v8 + 16 * v9;
      *(_WORD *)uint64_t v11 = 17698;
      *(void *)(v11 + 4) = -1LL;
      v3[58].i32[0] = v9;
      *(_DWORD *)(*(void *)&v3[57] + 16LL * v3[v10].u16[1] + 4) = v9;
      uint64_t v12 = v3[32].u32[0];
      if (v12 <= 0x1F)
      {
        v3[v12].i16[0] = v3[v10].i16[0];
LABEL_30:
        v3[v3[32].u32[0]].i16[1] = v9;
        if (!WORD1(v9))
        {
LABEL_31:
          uint64_t v66 = v3[32].u32[0];
          v3[v66].i32[1] = v3[53].i32[0];
          v3[32].i32[0] = v66 + 1;
        }
      }
    }

    if (v4 && v3[32].u8[v4 - 1 + 4] >= a2)
    {
LABEL_7:
      uint64_t v5 = (v4 - 1);
      v3[36].i32[1] = v5;
      switch(v3[32].i8[v5 + 4])
      {
        case '!':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v6 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v6;
          *(_DWORD *)(*(void *)&v3[56] + 8LL) = v3[v6].u16[0];
          continue;
        case '""':
          goto LABEL_9;
        case '$':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v85 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v85;
          int v86 = &v3[v85];
          int32x2_t v87 = v3[56];
          int32x2_t v88 = v3[57];
          uint64_t v89 = *(unsigned int *)(*(void *)&v87 + 12LL);
          *(_DWORD *)(*(void *)&v87 + 12LL) = v89 + 1;
          uint64_t v90 = *(void *)&v88 + 16 * v89;
          *(_WORD *)uint64_t v90 = 10531;
          *(void *)(v90 + 4) = -1LL;
          int32x2_t v91 = v3[56];
          int32x2_t v92 = v3[57];
          uint64_t v93 = *(unsigned int *)(*(void *)&v91 + 12LL);
          *(_DWORD *)(*(void *)&v91 + 12LL) = v93 + 1;
          v91.i32[0] = v86->u16[0];
          uint64_t v94 = *(void *)&v92 + 16 * v93;
          *(_WORD *)uint64_t v94 = 10276;
          *(_DWORD *)(v94 + 4) = v91.i32[0];
          *(_DWORD *)(v94 + 8) = -1;
          int32x2_t v95 = v3[57];
          *(_DWORD *)(*(void *)&v95 + 16LL * v86->u16[1] + 4) = v89;
          *(_DWORD *)(*(void *)&v95 + 16 * v93 + 8) = v3[37].i32[v3[36].u32[1]];
          *(_DWORD *)(*(void *)&v3[57] + 16 * v89 + 8) = v3[37].i32[v3[36].u32[1]];
          v3[53] = vadd_s32(v3[53], (int32x2_t)-1LL);
          uint64_t v96 = v3[32].u32[0];
          if (v96 <= 0x1F)
          {
            v3[v96].i16[0] = v93;
            if (!WORD1(v93))
            {
              v3[v3[32].u32[0]].i16[1] = v89;
              if (!WORD1(v89))
              {
                uint64_t v97 = v3[32].u32[0];
                v3[v97].i32[1] = v3[53].i32[0];
                v3[32].i32[0] = v97 + 1;
              }
            }
          }

          return result;
        case '%':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          --v3[53].i32[0];
          return result;
        case '&':
          uint64_t result = verifyOperandCount((uint64_t)v3, 2);
          __int32 v13 = v3[32].i32[0];
          if (v13)
          {
            v3[32].i32[0] = v13 - 1;
            char v14 = &v3[v13 - 1];
            if (v13 != 1)
            {
              __int32 v15 = v13 - 2;
              v3[32].i32[0] = v15;
              unsigned int v16 = &v3[v15];
              goto LABEL_34;
            }
          }

          else
          {
            char v14 = 0LL;
          }

          unsigned int v16 = 0LL;
LABEL_34:
          if (v3[53].i32[0] == 1)
          {
            if (v3[54].i8[5])
            {
              int32x2_t v67 = v3[57];
              if (*(_BYTE *)(*(void *)&v67 + 16LL * v14->u16[0]) != 50)
              {
                int32x2_t v68 = v3[56];
                uint64_t v69 = *(unsigned int *)(*(void *)&v68 + 12LL);
                *(_DWORD *)(*(void *)&v68 + 12LL) = v69 + 1;
                uint64_t v70 = *(void *)&v67 + 16 * v69;
                *(_WORD *)uint64_t v70 = 11824;
                *(void *)(v70 + 4) = -1LL;
                int32x2_t v71 = v3[56];
                int32x2_t v72 = v3[57];
                uint64_t v73 = *(unsigned int *)(*(void *)&v71 + 12LL);
                *(_DWORD *)(*(void *)&v71 + 12LL) = v73 + 1;
                v71.i32[0] = v14->u16[0];
                uint64_t v74 = *(void *)&v72 + 16 * v73;
                *(_WORD *)uint64_t v74 = 10790;
                *(_DWORD *)(v74 + 4) = v71.i32[0];
                *(_DWORD *)(v74 + 8) = v69;
                *(_DWORD *)(*(void *)&v3[57] + 16 * v69 + 4) = v73;
                v14->i16[0] = v73;
                if (WORD1(v73)) {
                  return result;
                }
              }
            }
          }

          int32x2_t v75 = v3[56];
          int32x2_t v76 = v3[57];
          uint64_t v77 = *(unsigned int *)(*(void *)&v75 + 12LL);
          *(_DWORD *)(*(void *)&v75 + 12LL) = v77 + 1;
          uint64_t v78 = *(void *)&v76 + 16 * v77;
          *(_WORD *)uint64_t v78 = 29489;
          *(void *)(v78 + 4) = -1LL;
          v76.i32[0] = v16->u16[0];
          int32x2_t v79 = v3[56];
          int32x2_t v80 = v3[57];
          uint64_t v81 = *(unsigned int *)(*(void *)&v79 + 12LL);
          *(_DWORD *)(*(void *)&v79 + 12LL) = v81 + 1;
          v79.i32[0] = v14->u16[0];
          uint64_t v82 = *(void *)&v80 + 16 * v81;
          *(_WORD *)uint64_t v82 = 31782;
          *(_DWORD *)(v82 + 4) = v76.i32[0];
          *(_DWORD *)(v82 + 8) = v79.i32[0];
          int32x2_t v83 = v3[57];
          *(_DWORD *)(*(void *)&v83 + 16LL * v16->u16[1] + 4) = v77;
          *(_DWORD *)(*(void *)&v83 + 16LL * v14->u16[1] + 4) = v77;
          uint64_t v84 = v3[32].u32[0];
          if (v84 <= 0x1F)
          {
            v3[v84].i16[0] = v81;
            if (!WORD1(v81))
            {
              v3[v3[32].u32[0]].i16[1] = v77;
              if (!WORD1(v77)) {
                goto LABEL_31;
              }
            }
          }

          continue;
        case '(':
          uint64_t result = verifyOperandCount((uint64_t)v3, 2);
          unsigned int v44 = v3[32].u32[0];
          uint64_t v45 = v44 - 1;
          v44 -= 2;
          v3[32].i32[0] = v44;
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v3[v44].u16[1] + 4) = v3[v45].u16[0];
          if (v44 > 0x1F) {
            continue;
          }
          v3[v3[32].u32[0]].i16[1] = v3[v45].i16[1];
          goto LABEL_31;
        case ')':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v17 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v17;
          uint64_t v18 = &v3[v17];
          int32x2_t v19 = v3[56];
          int32x2_t v20 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v19 + 12LL);
          *(_DWORD *)(*(void *)&v19 + 12LL) = v9 + 1;
          uint64_t v21 = *(void *)&v20 + 16 * v9;
          *(_WORD *)uint64_t v21 = 29489;
          *(void *)(v21 + 4) = -1LL;
          int32x2_t v22 = v3[56];
          int32x2_t v23 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v22 + 12LL);
          *(_DWORD *)(*(void *)&v22 + 12LL) = v24 + 1;
          v22.i32[0] = v18->u16[0];
          uint64_t v25 = *(void *)&v23 + 16 * v24;
          *(_WORD *)uint64_t v25 = 10790;
          *(_DWORD *)(v25 + 4) = v22.i32[0];
          *(_DWORD *)(v25 + 8) = v9;
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v18->u16[1] + 4) = v24;
          goto LABEL_28;
        case '*':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v46 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v46;
          uint64_t v47 = &v3[v46];
          int32x2_t v48 = v3[56];
          int32x2_t v49 = v3[57];
          uint64_t v50 = *(unsigned int *)(*(void *)&v48 + 12LL);
          *(_DWORD *)(*(void *)&v48 + 12LL) = v50 + 1;
          v48.i32[0] = v47->u16[0];
          uint64_t v51 = *(void *)&v49 + 16 * v50;
          *(_WORD *)uint64_t v51 = 10790;
          *(_DWORD *)(v51 + 4) = -1;
          *(_DWORD *)(v51 + 8) = v48.i32[0];
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v47->u16[1] + 4) = v50;
          uint64_t v52 = v3[32].u32[0];
          v3[v52].i16[0] = v50;
          if (WORD1(v50)) {
            continue;
          }
          v3[v3[32].u32[0]].i16[1] = v50;
          goto LABEL_31;
        case '+':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v26 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v26;
          char v27 = &v3[v26];
          int32x2_t v28 = v3[56];
          int32x2_t v29 = v3[57];
          uint64_t v30 = *(unsigned int *)(*(void *)&v28 + 12LL);
          *(_DWORD *)(*(void *)&v28 + 12LL) = v30 + 1;
          uint64_t v31 = *(void *)&v29 + 16 * v30;
          *(_WORD *)uint64_t v31 = 29489;
          *(void *)(v31 + 4) = -1LL;
          int32x2_t v32 = v3[56];
          int32x2_t v33 = v3[57];
          uint64_t v34 = *(unsigned int *)(*(void *)&v32 + 12LL);
          *(_DWORD *)(*(void *)&v32 + 12LL) = v34 + 1;
          v32.i32[0] = v27->u16[0];
          uint64_t v35 = *(void *)&v33 + 16 * v34;
          *(_WORD *)uint64_t v35 = 11046;
          *(_DWORD *)(v35 + 4) = v32.i32[0];
          *(_DWORD *)(v35 + 8) = v30;
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v27->u16[1] + 4) = v34;
          goto LABEL_23;
        case ',':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v53 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v53;
          char v27 = &v3[v53];
          int32x2_t v54 = v3[56];
          int32x2_t v55 = v3[57];
          uint64_t v30 = *(unsigned int *)(*(void *)&v54 + 12LL);
          *(_DWORD *)(*(void *)&v54 + 12LL) = v30 + 1;
          v54.i32[0] = v27->u16[0];
          uint64_t v56 = *(void *)&v55 + 16 * v30;
          *(_WORD *)uint64_t v56 = 11046;
          *(_DWORD *)(v56 + 4) = -1;
          *(_DWORD *)(v56 + 8) = v54.i32[0];
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v27->u16[1] + 4) = v30;
LABEL_23:
          uint64_t v57 = v3[32].u32[0];
          if (v57 <= 0x1F)
          {
            v3[v57].i16[0] = v27->i16[0];
            v3[v3[32].u32[0]].i16[1] = v30;
            if (!WORD1(v30)) {
              goto LABEL_31;
            }
          }

          continue;
        case '-':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v58 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v58;
          unint64_t v37 = &v3[v58];
          int32x2_t v59 = v3[56];
          int32x2_t v60 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v59 + 12LL);
          *(_DWORD *)(*(void *)&v59 + 12LL) = v9 + 1;
          uint64_t v61 = *(void *)&v60 + 16 * v9;
          *(_WORD *)uint64_t v61 = 29489;
          *(void *)(v61 + 4) = -1LL;
          int32x2_t v62 = v3[56];
          int32x2_t v63 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v62 + 12LL);
          *(_DWORD *)(*(void *)&v62 + 12LL) = v24 + 1;
          v62.i32[0] = v37->u16[0];
          uint64_t v64 = *(void *)&v63 + 16 * v24;
          *(_WORD *)uint64_t v64 = 16166;
          *(_DWORD *)(v64 + 4) = v62.i32[0];
          *(_DWORD *)(v64 + 8) = v9;
          goto LABEL_27;
        case '.':
          uint64_t result = verifyOperandCount((uint64_t)v3, 1);
          unsigned int v36 = v3[32].i32[0] - 1;
          v3[32].i32[0] = v36;
          unint64_t v37 = &v3[v36];
          int32x2_t v38 = v3[56];
          int32x2_t v39 = v3[57];
          uint64_t v9 = *(unsigned int *)(*(void *)&v38 + 12LL);
          *(_DWORD *)(*(void *)&v38 + 12LL) = v9 + 1;
          uint64_t v40 = *(void *)&v39 + 16 * v9;
          *(_WORD *)uint64_t v40 = 29489;
          *(void *)(v40 + 4) = -1LL;
          int32x2_t v41 = v3[56];
          int32x2_t v42 = v3[57];
          uint64_t v24 = *(unsigned int *)(*(void *)&v41 + 12LL);
          *(_DWORD *)(*(void *)&v41 + 12LL) = v24 + 1;
          v41.i32[0] = v37->u16[0];
          uint64_t v43 = *(void *)&v42 + 16 * v24;
          *(_WORD *)uint64_t v43 = 16166;
          *(_DWORD *)(v43 + 4) = v9;
          *(_DWORD *)(v43 + 8) = v41.i32[0];
LABEL_27:
          *(_DWORD *)(*(void *)&v3[57] + 16LL * v37->u16[1] + 4) = v9;
LABEL_28:
          uint64_t v65 = v3[32].u32[0];
          if (v65 <= 0x1F)
          {
            v3[v65].i16[0] = v24;
            if (!WORD1(v24)) {
              goto LABEL_30;
            }
          }

          continue;
        default:
          continue;
      }
    }

    return result;
  }

uint64_t matchDup(uint64_t *a1, void *a2)
{
  uint64_t matched = 4294967293LL;
  if (a1)
  {
    if (a2)
    {
      __int32 v4 = (void *(__cdecl *)(size_t))a2[1];
      if (v4)
      {
        uint64_t v5 = (void (__cdecl *)(void *))a2[2];
        if (v5)
        {
          uint64_t matched = matchInit(a1, v4, v5, a2[3]);
          if (!(_DWORD)matched)
          {
            uint64_t matched = matchCopy(*a1, (uint64_t)a2);
            if ((_DWORD)matched) {
              matchFree(*a1);
            }
          }
        }
      }
    }
  }

  return matched;
}

uint64_t matchCopy(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  __int128 v3 = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 8) = v3;
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  if (*(void *)(a1 + 32)) {
    return 4294967293LL;
  }
  uint64_t v5 = (uint64_t *)(a1 + 64);
  if (*(void *)(a1 + 64) || *(void *)(a1 + 56)) {
    return 4294967293LL;
  }
  if (*(void *)(a2 + 32))
  {
    int32x2_t v7 = (void *)((uint64_t (*)(void))v3)(*(void *)(a2 + 40));
    *(void *)(a1 + 32) = v7;
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 16);
      uint64_t v9 = *(const void **)(a2 + 32);
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v8;
      memcpy(v7, v9, *(void *)(a2 + 40));
      if (!*(void *)(a2 + 56)) {
        goto LABEL_11;
      }
      uint64_t v10 = (void *)(*(uint64_t (**)(uint64_t, void))(a1 + 8))(24LL, *(void *)(a1 + 24));
      *(void *)(a1 + 56) = v10;
      if (v10)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = *(void *)(a2 + 32);
        *uint64_t v10 = v11 + **(void **)(a2 + 56) - v12;
        *(_WORD *)(*(void *)(a1 + 56) + 16LL) = *(_WORD *)(*(void *)(a2 + 56) + 16LL);
        *(void *)(*(void *)(a1 + 56) + 8LL) = v11 + *(void *)(*(void *)(a2 + 56) + 8LL) - v12;
        *(_WORD *)(*(void *)(a1 + 56) + 18LL) = *(_WORD *)(*(void *)(a2 + 56) + 18LL);
LABEL_11:
        __int32 v13 = *(_DWORD **)(a2 + 64);
        if (!v13) {
          return 0LL;
        }
        goto LABEL_14;
      }

      (*(void (**)(void, void))(a1 + 16))(*(void *)(a1 + 32), *(void *)(a1 + 24));
    }

    return 4294967292LL;
  }

  __int32 v13 = *(_DWORD **)(a2 + 64);
  if (!v13) {
    return 4294967293LL;
  }
LABEL_14:
  uint64_t result = nfaCopy( v5,  v13,  *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8),  *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16),  *(void *)(a1 + 24),  0);
  if (!(_DWORD)result) {
    **(void **)(a1 + 64) = a1;
  }
  return result;
}

uint64_t matchCombine(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (!a2)
  {
    if (!a3) {
      return 0LL;
    }
    return matchCombine2(a1, a3);
  }

  uint64_t result = matchCombine2(a1, a2);
  if (a3 && !(_DWORD)result) {
    return matchCombine2(a1, a3);
  }
  return result;
}

uint64_t matchCombine2(uint64_t a1, uint64_t a2)
{
  char v14 = 0LL;
  __int32 v4 = *(_DWORD **)(a1 + 64);
  if (!v4) {
    return matchCopy(a1, a2);
  }
  uint64_t v5 = *(_DWORD **)(a2 + 64);
  if (!v5) {
    return 4294967293LL;
  }
  uint64_t v6 = v5[3] + 1LL;
  uint64_t v7 = v6 << 31 >> 31;
  uint64_t v8 = 4294967293LL;
  if (v7 == v6 && (v7 & 0x8000000000000000LL) == 0)
  {
    uint64_t v8 = nfaCopy( (uint64_t *)&v14,  v4,  *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8),  *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16),  *(void *)(a1 + 24),  v7);
    if (!(_DWORD)v8)
    {
      uint64_t v9 = (uint64_t)v14;
      uint64_t *v14 = a1;
      int v10 = *(_DWORD *)(v9 + 8);
      uint64_t v11 = *(unsigned int *)(v9 + 12);
      *(_DWORD *)(v9 + 12) = v11 + 1;
      uint64_t v12 = v9 + 16 * v11;
      *(_WORD *)(v12 + 40) = 31782;
      *(_DWORD *)(v12 + 44) = v10;
      uint64_t v8 = nfaCopyNodes( v9,  (_DWORD *)(v12 + 48),  v5,  *(uint64_t (**)(uint64_t, uint64_t))(a1 + 8),  *(uint64_t (**)(void, uint64_t))(a1 + 16),  *(void *)(a1 + 24));
      if ((_DWORD)v8)
      {
        nfaFree(v9, *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24));
      }

      else
      {
        *(_DWORD *)(v9 + 8) = v11;
        nfaFree(*(void *)(a1 + 64), *(uint64_t (**)(uint64_t, uint64_t))(a1 + 16), *(void *)(a1 + 24));
        *(void *)(a1 + 64) = v9;
      }
    }
  }

  return v8;
}

uint64_t verifyOperandCount(uint64_t result, int a2)
{
  if (a2)
  {
    int v2 = 0;
    unint64_t v3 = *(unsigned int *)(result + 256);
    unsigned int v4 = v3 - 1;
    unint64_t v5 = 1LL;
    do
    {
      if (v5 > v3 || *(_DWORD *)(result + 8LL * v4 + 4) < *(_DWORD *)(result + 424)) {
        ++v2;
      }
      ++v5;
      --v4;
    }

    while (a2 + 1 != v5);
    for (; v2; --v2)
    {
      uint64_t v6 = *(void *)(result + 448);
      uint64_t v7 = *(void *)(result + 456);
      uint64_t v8 = *(unsigned int *)(v6 + 12);
      *(_DWORD *)(v6 + 12) = v8 + 1;
      uint64_t v9 = v7 + 16 * v8;
      *(_WORD *)uint64_t v9 = 25905;
      *(void *)(v9 + 4) = -1LL;
      uint64_t v10 = *(unsigned int *)(result + 256);
      if (v10 <= 0x1F)
      {
        *(_WORD *)(result + 8 * v10) = v8;
        if (!WORD1(v8))
        {
          *(_WORD *)(result + 8LL * *(unsigned int *)(result + 256) + 2) = v8;
          uint64_t v11 = *(unsigned int *)(result + 256);
          *(_DWORD *)(result + 8 * v11 + 4) = *(_DWORD *)(result + 424);
          *(_DWORD *)(result + 256) = v11 + 1;
        }
      }
    }
  }

  return result;
}

uint64_t nfaCopy( uint64_t *a1, _DWORD *a2, uint64_t (*a3)(uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t), uint64_t a5, int a6)
{
  unsigned int v11 = a2[9] + a6;
  uint64_t v12 = a3(16LL * v11 + 56, a5);
  if (!v12) {
    return 4294967292LL;
  }
  uint64_t v13 = v12;
  *(_DWORD *)(v12 + 12) = 0;
  *(void *)uint64_t v12 = *(void *)a2;
  *(_DWORD *)(v12 + 32) = 0;
  *(_DWORD *)(v12 + 36) = v11;
  *(void *)(v12 + 16) = 0LL;
  *(void *)(v12 + 24) = 0LL;
  uint64_t v14 = nfaCopyNodes(v12, &v16, a2, a3, a4, a5);
  if ((_DWORD)v14)
  {
    a4(v13, a5);
  }

  else
  {
    *(_DWORD *)(v13 + 8) = v16;
    *(void *)uint64_t v13 = 0LL;
    *a1 = v13;
  }

  return v14;
}

uint64_t nfaCopyNodes( uint64_t a1, _DWORD *a2, _DWORD *a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t (*a5)(void, uint64_t), uint64_t a6)
{
  if (!a3[9]) {
    return 4294967292LL;
  }
  uint64_t v6 = *(unsigned int *)(a1 + 12);
  uint64_t v7 = a3[3];
  if (!(_DWORD)v7)
  {
    *(_DWORD *)(a1 + 12) = v6;
LABEL_25:
    uint64_t result = 0LL;
    *a2 = a3[2] + v6;
    return result;
  }

  int32x2_t v28 = a3;
  int32x2_t v29 = a2;
  uint64_t v10 = 0LL;
  int v27 = *(_DWORD *)(a1 + 12);
  unint64_t v11 = a1 + 16 * v6 + 40;
  uint64_t v12 = (const void **)(a3 + 12);
  uint64_t v13 = (unsigned __int8 *)v11;
  uint64_t v14 = (unsigned __int8 *)v11;
  while (1)
  {
    *(_OWORD *)uint64_t v13 = *(_OWORD *)(v12 - 1);
    int v16 = *v14;
    v14 += 16;
    int v15 = v16;
    if (v16 <= 38)
    {
      if (v15 == 17) {
        goto LABEL_10;
      }
      if (v15 == 18)
      {
        uint64_t v17 = 8LL * *((unsigned __int8 *)*v12 + 6);
        goto LABEL_12;
      }

      goto LABEL_14;
    }

    if (v15 == 39) {
      break;
    }
    if (v15 == 52)
    {
LABEL_10:
      uint64_t v17 = *((unsigned int *)*v12 + 1);
      goto LABEL_12;
    }

LABEL_14:
    ++v10;
    v12 += 2;
    uint64_t v13 = v14;
    if (v7 == v10)
    {
      LODWORD(v6) = v27;
      *(_DWORD *)(a1 + 12) += v7;
      a3 = v28;
      a2 = v29;
      if (v27)
      {
        unint64_t v21 = v11 + 16 * v7;
        do
        {
          int v22 = *(_DWORD *)(v11 + 4);
          if (v22 != -1) {
            *(_DWORD *)(v11 + 4) = v22 + v27;
          }
          if (*(_BYTE *)v11 == 38)
          {
            int v23 = *(_DWORD *)(v11 + 8);
            if (v23 != -1) {
              *(_DWORD *)(v11 + 8) = v23 + v27;
            }
          }

          v11 += 16LL;
        }

        while (v11 < v21);
      }

      goto LABEL_25;
    }
  }

  uint64_t v17 = 4LL * *((unsigned int *)*v12 + 1);
LABEL_12:
  size_t v18 = v17 + 8;
  int32x2_t v19 = (_DWORD *)a4(v17 + 8, a6);
  if (v19)
  {
    int32x2_t v20 = v19;
    *((void *)v13 + 1) = v19;
    memcpy(v19, *v12, v18);
    *int32x2_t v20 = 1;
    goto LABEL_14;
  }

  for (; v10; --v10)
  {
    nodeModPtrRefs((unsigned __int8 *)v11, -1, a5, a6);
    v11 += 16LL;
  }

  return 4294967292LL;
}

void bzero(void *a1, size_t a2)
{
}

int dup(int a1)
{
  return MEMORY[0x1895FAFA8](*(void *)&a1);
}

int dup2(int a1, int a2)
{
  return MEMORY[0x1895FAFB8](*(void *)&a1, *(void *)&a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB4C8](__ptr, __size, __nitems, __stream);
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

void *__cdecl memmem(const void *__big, size_t __big_len, const void *__little, size_t __little_len)
{
  return (void *)MEMORY[0x1895FBE28](__big, __big_len, __little, __little_len);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1895FBE30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}

int putchar(int a1)
{
  return MEMORY[0x1895FCB88](*(void *)&a1);
}