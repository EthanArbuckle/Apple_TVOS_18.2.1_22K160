LABEL_163:
                        v223 += v461 + 1;
                        v225 = (int)v442 - 1LL;
                        if (v223 >= v111) {
                          goto LABEL_395;
                        }
                        continue;
                      }
                    }
                  }

                  else
                  {
                    v164 = v181;
                    v173 = v180;
                    v58 = v456;
                    v162 = v185;
                    v110 = v184;
                  }
                }

                else
                {
                  v164 = v181;
                  v173 = v180;
                  v58 = v456;
                }

                ++v178;
                v180 = v173;
                v181 = v164;
              }

              while (v179 != (_DWORD)v178);
            }
          }

          v174 = (int32x2_t *)v174[4];
          v111 = v445;
          v175 = v432;
        }

        while (v174);
        v163 = v173;
        v60 = v446;
        v108 = v436;
        do
        {
          v190 = v175[1].i32[1];
          if ((int)v190 < *(_DWORD *)v175->i32[0] - 1)
          {
            v191 = *(void *)(*(void *)v175 + 8LL);
            v192 = *(int *)(v191 + 8 * v190);
            v193 = *(_DWORD *)(v191 + 8LL * ((int)v190 + 1));
            if ((int)v192 < v193)
            {
              v194 = v163;
              do
              {
                v195 = *(void *)(*(void *)v175 + 24LL);
                v196 = v195 + 12 * v192;
                v198 = *(_DWORD *)(v196 + 4);
                v197 = (_DWORD *)(v196 + 4);
                if (v198)
                {
                  if (v194)
                  {
                    v199 = 0;
                    v200 = 0;
                    v201 = (__int32 *)(v195 + 12 * v192 + 8);
                    v163 = v194;
                    while (1)
                    {
                      if (*v197 == v194[1].i32[0] && v175[2].i32[1] == v194[2].i32[0])
                      {
                        v202 = *v194;
                        if (v200)
                        {
                          v200 = 1;
                        }

                        else
                        {
                          v200 = *(_DWORD *)(*(void *)(*(void *)&v202 + 8LL) + 8LL * v194[1].i32[1] + 4);
                          if (v200)
                          {
                            v203 = (int32x2_t *)&v161[5 * v165];
                            *v203 = *v175;
                            v203[1].i32[1] = *v201;
                            v203[2].i32[0] = v175[2].i32[0];
                            v203[2].i32[1] = v439;
                            v203[1].i32[0] = v175[1].i32[0];
                            v203[4] = (int32x2_t)v163;
                            v203[3].i32[0] = 1;
                            v204 = 40LL * v165 + 64;
                            do
                            {
                              v205 = *(_DWORD *)((char *)v161 + v204);
                              ++v165;
                              v204 += 40LL;
                            }

                            while (v205);
                            if (v447 <= v165) {
                              goto LABEL_156;
                            }
                            v202 = *v194;
                            v200 = 1;
                            v163 = v203;
                          }
                        }

                        v206 = *(void *)(*(void *)&v202 + 8LL);
                        v207 = v194[1].i32[1];
                        v208 = *(_DWORD *)(v206 + 8 * v207);
                        if (v208 >= *(_DWORD *)(*(void *)&v202 + 4LL)
                          || v199
                          || *(_DWORD *)(v206 + 8 * v207 + 8) <= v208)
                        {
                          if (v199) {
                            v212 = v200;
                          }
                          else {
                            v212 = 0;
                          }
                          if ((v212 & 1) != 0) {
                            goto LABEL_115;
                          }
                        }

                        else
                        {
                          v209 = (int32x2_t *)&v161[5 * v165];
                          *v209 = *v175;
                          v209[1].i32[1] = v175[1].i32[1];
                          v209[2].i32[0] = v175[2].i32[0];
                          v209[2].i32[1] = v175[2].i32[1];
                          v209[1].i32[0] = v175[1].i32[0];
                          v209[4] = (int32x2_t)v163;
                          v209[3].i32[0] = 1;
                          v210 = 40LL * v165 + 64;
                          do
                          {
                            v211 = *(_DWORD *)((char *)v161 + v210);
                            ++v165;
                            v210 += 40LL;
                          }

                          while (v211);
                          if (v447 <= v165) {
                            goto LABEL_156;
                          }
                          v199 = 1;
                          v163 = v209;
                          if ((v200 & 1) != 0) {
                            goto LABEL_115;
                          }
                        }
                      }

                      v194 = (int32x2_t *)v194[4];
                      if (!v194) {
                        goto LABEL_115;
                      }
                    }
                  }

                  v163 = 0LL;
                }

                else
                {
                  v163 = v194;
                }

  if (v7) {
    goto LABEL_164;
  }
LABEL_165:
  pthread_mutex_unlock(v5);
  CFRelease((CFTypeRef)v3);
  return v10;
}

uint64_t sub_1000A6628(__int16 *a1, int a2, uint64_t a3)
{
  int v6 = sub_1000CC52C((unint64_t)a1) + 1;
  v14 = (char *)sub_1000CAFC0(2LL * v6, v7, v8, v9, v10, v11, v12, v13);
  v15 = v14;
  if (v14 && sub_1000CC548(v14, a1, v6))
  {
    uint64_t v32 = 2LL * v6;
    v33 = 0LL;
    v16 = sub_1000CC804(v15, asc_1000F24E0, &v33);
    if (v16)
    {
      v17 = v16;
      uint64_t v18 = 0LL;
      uint64_t v19 = 2LL - (void)v15;
      v20 = (unsigned __int16 *)v15;
      while (1)
      {
        if (v17 > (char *)v20)
        {
          if ((int)v18 < a2)
          {
            *(_DWORD *)a3 = 4;
            *(_DWORD *)(a3 + 4) = (unint64_t)((char *)v20 - v15) >> 1;
            *(_DWORD *)(a3 + 8) = (unint64_t)(v17 - (char *)v20) >> 1;
            a3 += 28LL;
            v20 = (unsigned __int16 *)v17;
          }

          uint64_t v18 = (v18 + 1);
        }

        v21 = &v17[2 * (int)sub_1000CC52C((unint64_t)v17)];
LABEL_5:
        v17 = sub_1000CC804(0LL, asc_1000F24E0, &v33);
        if (!v17) {
          goto LABEL_29;
        }
      }

      while (!sub_1000CBAD0(*v20))
      {
        BOOL v26 = sub_1000CBA3C(*v20);
        unint64_t v27 = (char *)v20 - v15;
        if (v26)
        {
          *(_DWORD *)a3 = 2;
          *(_DWORD *)(a3 + 4) = v27 >> 1;
          v28 = (char *)v20 + v19;
          v29 = v20 + 1;
          do
          {
            unint64_t v24 = (unint64_t)v28;
            v20 = v29;
            if (!*v29) {
              break;
            }
            BOOL v30 = sub_1000CBA3C(*v29);
            v28 = (char *)(v24 + 2);
            v29 = v20 + 1;
          }

          while (v30);
LABEL_22:
          *(_DWORD *)(a3 + 8) = (v24 >> 1) - *(_DWORD *)(a3 + 4);
LABEL_23:
          *(void *)a3 = 0LL;
          *(void *)(a3 + 8) = 0LL;
          *(_DWORD *)(a3 + 24) = 0;
          *(void *)(a3 + 16) = 0LL;
          uint64_t v18 = (v18 + 1);
        }

        else
        {
          ++v20;
          *(_DWORD *)a3 = 3;
          *(_DWORD *)(a3 + 4) = v27 >> 1;
          *(_DWORD *)(a3 + 8) = 1;
LABEL_12:
          a3 += 28LL;
          uint64_t v18 = (v18 + 1);
        }
      }

      *(_DWORD *)a3 = 1;
      *(_DWORD *)(a3 + 4) = (unint64_t)((char *)v20 - v15) >> 1;
      v22 = v20 + 1;
      v23 = (char *)v20 + v19;
      do
      {
        v20 = v22;
        unint64_t v24 = (unint64_t)v23;
        if (!*v22) {
          break;
        }
        int v25 = sub_1000CBAD0(*v22);
        v22 = v20 + 1;
        v23 = (char *)(v24 + 2);
      }

      while (v25);
      goto LABEL_22;
    }

    uint64_t v18 = 0LL;
LABEL_29:
    sub_1000CB038(v15, v32);
  }

  else
  {
    sub_1000CB038(v15, 2LL * v6);
    return 0LL;
  }

  return v18;
}

uint64_t sub_1000A6858(uint64_t *a1, int a2, _WORD *a3, uint64_t a4, int *a5, _DWORD *a6)
{
  *a6 = 0;
  int v11 = sub_1000B324C(a1);
  uint64_t v19 = sub_1000CAFC0(2LL * (v11 + 1), v12, v13, v14, v15, v16, v17, v18);
  int v20 = sub_1000B3288(a1);
  v28 = sub_1000CAFC0(2LL * (v20 + 1), v21, v22, v23, v24, v25, v26, v27);
  if (a2 < 1)
  {
    uint64_t v30 = 0xFFFFFFFFLL;
  }

  else
  {
    unint64_t v29 = a2 + 1LL;
    uint64_t v30 = 0xFFFFFFFFLL;
    do
    {
      uint64_t v31 = (v29 - 2);
      sub_1000B33F8((char *)a1, *(_DWORD *)(a4 + 4LL * v31), (uint64_t)v19, v28);
      int v32 = sub_1000CC52C((unint64_t)v19);
      if (v32 >= *a5)
      {
        int v33 = v32;
        int v34 = sub_1000CD3EC(a3, v19, v32);
        if ((_DWORD)v30 == -1 || v33 > *a5 || v33 == *a5 && (!*a6 || !v34))
        {
          *a5 = v33;
          uint64_t v30 = *(unsigned int *)(a4 + 4 * v31);
          *a6 = v34 == 0;
        }
      }

      --v29;
    }

    while (v29 > 1);
  }

  int v35 = sub_1000B3288(a1);
  sub_1000CB038(v28, 2LL * (v35 + 1));
  int v36 = sub_1000B324C(a1);
  sub_1000CB038(v19, 2LL * (v36 + 1));
  return v30;
}

uint64_t sub_1000A69C0( uint64_t *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, int *a10, _DWORD *a11, int *a12)
{
  uint64_t v108 = *(void *)(a1[7] + 216);
  if (a12[4] >= 1)
  {
    uint64_t v15 = 0LL;
    int v115 = 0;
    uint64_t v16 = a12 + 1;
    while (1)
    {
      int v18 = *(v16 - 1);
      if (v18 == 1) {
        break;
      }
      if (v18 != 3) {
        goto LABEL_5;
      }
      int v17 = *(unsigned __int16 *)(a2 + 2LL * *v16);
      if (v17 != 36)
      {
        if (v17 != 8364 && v17 != 164) {
          goto LABEL_5;
        }
LABEL_3:
        int v17 = 8364;
      }

LABEL_111:
      v60 = a11;
      goto LABEL_137;
    }

    if (v115 == 36)
    {
      v61 = *(_WORD **)(v108 + 256);
      if (!v61) {
        goto LABEL_111;
      }
      v62 = a9;
      if ((int)sub_1000B3680(v31, v61, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
      {
        v63 = *(_WORD **)(v108 + 256);
LABEL_87:
        else {
          int v64 = *v62;
        }
        v60 = a11;
        int v65 = *v51;
        goto LABEL_70;
      }
    }

    else
    {
      v67 = *(_WORD **)(v108 + 320);
      if (!v67) {
        goto LABEL_111;
      }
      v62 = a9;
      if ((int)sub_1000B3680(v31, v67, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
      {
        v63 = *(_WORD **)(v108 + 320);
        goto LABEL_87;
      }
    }

    int v57 = *v62;
    int v58 = *v51;
    goto LABEL_59;
  }

  int v37 = v19 + 1;
  if (a12[7 * (v19 + 1)] != 2)
  {
LABEL_136:
    LODWORD(v19) = v19 + 1;
    v60 = a11;
    goto LABEL_137;
  }

  v38 = &a12[7 * v37];
  int v41 = v38[2];
  v40 = v38 + 2;
  int v39 = v41;
  if (v41 != 2 || v115 != 36 && !*(_DWORD *)(v108 + 536) || a12[7 * a12[2] - 7] == 1)
  {
    v42 = *(_WORD **)(v108 + 64);
    if (v42)
    {
      if ((int)sub_1000B3680(v31, v42, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
      {
        else {
          int v71 = *a9;
        }
        sub_1000B8938(a4, a5, a6, v110, 0LL, v111, a10, a3, v71, *v35, 0, 0, 0);
      }

      else
      {
        sub_1000B8938(a4, a5, a6, v110, 0LL, v111, a10, a3, *a9, *v35, 0, 0, 1);
      }

      LODWORD(v29) = v29 + 1;
      int v39 = *v40;
    }

    uint64_t v72 = a12[7 * v37 + 1];
    int v80 = a12[4];
    if (a12[7 * v80 - 7] == 1)
    {
      v81 = &a12[7 * v80 - 7];
      unint64_t v19 = (unint64_t)(v81 + 2);
      v82 = (_WORD *)sub_1000CAF58(2LL * v81[2] + 2, v73, v74, v75, v76, v77, v78, v79);
      uint64_t v84 = v81[1];
      v83 = v81 + 1;
      sub_1000CC548(v82, (__int16 *)(a2 + 2 * v84), *(_DWORD *)v19 + 1);
      if (v82)
      {
        if ((int)sub_1000B3680(v31, v82, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
        {
          else {
            int v87 = *a9;
          }
          sub_1000B8938(a4, a5, a6, v110, 0LL, v111, a10, a3, v87, *v83, *(_DWORD *)v19, 0, 0);
        }

        else
        {
          sub_1000B8938( a4,  a5,  a6,  v110,  0LL,  v111,  a10,  a3,  *a9,  *v83,  *(_DWORD *)v19,  (int)&_mh_execute_header,  (unint64_t)&_mh_execute_header >> 32);
        }

        uint64_t v29 = (v29 + 1);
      }

      sub_1000CB038(v82, 2LL * *(int *)v19 + 2);
      LODWORD(v19) = v80;
      if (v115 == 36)
      {
LABEL_108:
        v88 = *(_WORD **)(v108 + 240);
        if (v88)
        {
          v86 = *(_WORD **)(v108 + 240);
LABEL_113:
          else {
            int v64 = *a9;
          }
          v60 = a11;
          int v66 = a12[7 * (int)v19 - 5] + a12[7 * (int)v19 - 6];
          goto LABEL_71;
        }

        goto LABEL_111;
      }
    }

    else
    {
      LODWORD(v19) = v19 + 2;
      if (v115 == 36) {
        goto LABEL_108;
      }
    }

    v85 = *(_WORD **)(v108 + 304);
    if (v85)
    {
      if ((int)sub_1000B3680(v31, v85, 1LL, 1LL, 0LL, 30, (uint64_t)a9) >= 1)
      {
LABEL_110:
        int v57 = *a9;
        int v59 = a12[7 * (int)v19 - 5] + a12[7 * (int)v19 - 6];
        goto LABEL_60;
      }

      v86 = *(_WORD **)(v108 + 304);
      goto LABEL_113;
    }

    goto LABEL_111;
  }

  if ((_DWORD)v19 && a12[7 * (v19 - 1)] == 2)
  {
    int v68 = a12[9];
    if (v115 == 36)
    {
      if (v68 == 1 && *(_WORD *)(a2 + 2LL * a12[8]) == 49)
      {
        v69 = *(_WORD **)(v108 + 256);
        if (v69)
        {
          if ((int)sub_1000B3680(v31, v69, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
          {
            v70 = *(_WORD **)(v108 + 256);
LABEL_129:
            else {
              int v92 = *a9;
            }
            sub_1000B8938(a4, a5, a6, v110, 0LL, v111, a10, a3, v92, *v35, 0, 0, 0);
            goto LABEL_133;
          }

          goto LABEL_127;
        }
      }

      else
      {
        v90 = *(_WORD **)(v108 + 240);
        if (v90)
        {
          if ((int)sub_1000B3680(v31, v90, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
          {
            v70 = *(_WORD **)(v108 + 240);
            goto LABEL_129;
          }

          goto LABEL_127;
        }
      }
    }

    else if (v68 == 1 && *(_WORD *)(a2 + 2LL * a12[8]) == 49)
    {
      v89 = *(_WORD **)(v108 + 320);
      if (v89)
      {
        if ((int)sub_1000B3680(v31, v89, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
        {
          v70 = *(_WORD **)(v108 + 320);
          goto LABEL_129;
        }

LABEL_165:
        sub_1000B8938(a4, a5, a6, v110, 0LL, v111, a10, a3, *a9, *v99 + 2, 0, 0, 1);
LABEL_171:
        uint64_t v29 = (v29 + 1);
      }
    }
  }

  LODWORD(v19) = v19 + 2;
  v60 = a11;
LABEL_137:
  int v97 = a12[4];
  _DWORD *v60 = v97 - 1;
  return v29;
}

uint64_t sub_1000A77AC( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, int *a10, _WORD *a11, _WORD *a12, unsigned int *a13, int *a14)
{
  uint64_t v19 = a3;
  int v20 = (char *)a1;
  int v21 = a14;
  uint64_t v81 = *(void *)(a1[7] + 216);
  v82 = a14 + 1;
  uint64_t v84 = a2;
  if (a14[4] != 1) {
    goto LABEL_31;
  }
  uint64_t v22 = (char *)(a2 + 2LL * a14[1]);
  int v23 = a14[2];
  int v25 = sub_1000B37CC(a1, v22, 0LL, 0LL, v23, 30LL, (uint64_t)a9);
  uint64_t v19 = a3;
  uint64_t v26 = a9;
  a2 = v84;
  if (v25 < 1) {
    goto LABEL_31;
  }
  uint64_t v74 = a8;
  uint64_t v75 = a5;
  uint64_t v76 = a6;
  unsigned int v77 = a3;
  BOOL v73 = 0;
  int v27 = -1;
  uint64_t v28 = v20;
  while (2)
  {
    while (2)
    {
      while (2)
      {
        int v79 = v27;
        uint64_t v29 = (unsigned int *)&v26[v25 - 1];
        int v30 = v25;
        while (1)
        {
          sub_1000B33F8(v28, *v29, (uint64_t)a11, a12);
          int v32 = sub_1000CC52C((unint64_t)a11);
          if (v32 >= v23)
          {
            int v33 = v32;
            uint64_t v34 = v32;
            uint64_t v35 = v32 - 1LL;
            if (!sub_1000CBA60(*(unsigned __int16 *)&v22[2 * v35])
              && (!sub_1000CB890(*(unsigned __int16 *)&v22[2 * v35])
               || !sub_1000CB890(*(unsigned __int16 *)&v22[2 * v34]))
              && (!sub_1000CBA3C(*(unsigned __int16 *)&v22[2 * v35])
               || !sub_1000CBA3C(*(unsigned __int16 *)&v22[2 * v34])))
            {
              break;
            }
          }

          --v29;
          BOOL v31 = __OFSUB__(v30--, 1);
          if ((v30 < 0) ^ v31 | (v30 == 0))
          {
            int v33 = v23;
            a2 = v84;
            int v27 = v79;
            goto LABEL_24;
          }
        }

        int v36 = sub_1000CD3EC(v22, a11, v33);
        int v27 = v79;
        a2 = v84;
        uint64_t v26 = a9;
        if (v79 == -1 || v33 > v23)
        {
LABEL_19:
          int v27 = *v29;
          BOOL v73 = v36 == 0;
          int v25 = v30 - 1;
          int v23 = v33;
          if (v30 > 1) {
            continue;
          }
          goto LABEL_24;
        }

        break;
      }

      if (v33 == v23)
      {
        if (v73 && v36)
        {
          BOOL v73 = 1;
          int v33 = v23;
          int v25 = v30 - 1;
          if (v30 > 1) {
            continue;
          }
          goto LABEL_24;
        }

        goto LABEL_19;
      }

      break;
    }

    int v33 = v23;
    int v25 = v30 - 1;
    if (v30 > 1) {
      continue;
    }
    break;
  }

uint64_t sub_1000A7D60( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, uint64_t a8, uint64_t a9, _DWORD *a10, _DWORD *a11)
{
  int v11 = a8;
  uint64_t v15 = a3;
  unsigned int v191 = a2;
  uint64_t v16 = a1;
  uint64_t v17 = a9;
  int v18 = *(_WORD ***)(a1[7] + 216);
  if (a10[4] == 1)
  {
    int v19 = a10[2];
    uint64_t v20 = (int)a10[1];
    if (v19 > 6 || v19 >= 3 && *(_WORD *)(a9 + 2 * v20) == 48)
    {
      *a11 = v20 + v19;
      if (!*((_DWORD *)v18 + 134)) {
        return sub_1000B8998(a1, a9 + 2LL * (int)a10[1], a10[1], a10[2], a8, a2, a3, a4, a5, 0LL, a6, a7, 0);
      }
      uint64_t v22 = sub_1000CAFC0(2LL * (int)a10[2] + 2, a2, a3, a4, a5, a6, (uint64_t)a7, a8);
      sub_1000CC548(v22, (__int16 *)(a9 + 2LL * (int)a10[1]), a10[2] + 1);
      uint64_t v23 = sub_1000AF7E0(a1, v191, v15, a4, a5, a6, a7, v11, (unint64_t)v22, a10[1]);
      sub_1000CB038(v22, 2LL * (int)a10[2] + 2);
      return v23;
    }
  }

  int v196 = a8;
  int v25 = sub_1000B324C(a1);
  int v33 = sub_1000CAFC0(2LL * (v25 + 1), v26, v27, v28, v29, v30, v31, v32);
  int v34 = sub_1000B3288(v16);
  v198 = sub_1000CAFC0(2LL * (v34 + 1), v35, v36, v37, v38, v39, v40, v41);
  v201 = (int *)sub_1000CAFC0(0x78uLL, v42, v43, v44, v45, v46, v47, v48);
  int v56 = (int *)sub_1000CAFC0(0x78uLL, v49, v50, v51, v52, v53, v54, v55);
  v195 = a7;
  if (*a10 != 3)
  {
    unsigned int v199 = 0;
    uint64_t v59 = a4;
    v61 = v56;
    uint64_t v58 = a6;
    goto LABEL_31;
  }

  int v57 = *(unsigned __int16 *)(a9 + 2LL * (int)a10[1]);
  uint64_t v58 = a6;
  if (v57 == 35)
  {
    int v64 = v18[14];
    uint64_t v59 = a4;
    if (!v64) {
      goto LABEL_23;
    }
    v61 = v56;
    uint64_t v65 = v18[14];
  }

  else
  {
    if (v57 != 43)
    {
      uint64_t v59 = a4;
      if (v57 == 45)
      {
        uint64_t v60 = v18[12];
        v61 = v56;
        if (!v60)
        {
          unsigned int v199 = 0;
          goto LABEL_31;
        }

        v62 = v201;
        if ((int)sub_1000B3680(v16, v60, 1LL, 1LL, 0LL, 30, (uint64_t)v201) >= 1)
        {
          int v63 = *v201;
LABEL_22:
          unsigned int v199 = 1;
          sub_1000B8938(v191, v15, v59, a5, 0LL, a6, v195, v196, v63, a10[1], 0, 0, 1);
          goto LABEL_31;
        }

        goto LABEL_27;
      }

LABEL_171:
                sub_1000B8938(v191, v15, v59, a5, 0LL, v58, v195, v196, *v84, v200[v141 - 1] + 1, 0, 0, 1);
LABEL_199:
                ++v199;
                LODWORD(v83) = v141;
                goto LABEL_56;
              }
            }

    if (*v19) {
      int v112 = **v19;
    }
    else {
      int v112 = 0LL;
    }
    v113 = sub_10004CA44(v112, v41);
    if ((_DWORD)v113)
    {
      uint64_t v47 = v113;
      int v114 = (os_log_s *)VSGetLogDefault(v113);
      uint64_t v115 = os_log_type_enabled(v114, OS_LOG_TYPE_ERROR);
      if ((_DWORD)v115)
      {
        *(_DWORD *)unsigned int v199 = 67109890;
        *(_DWORD *)&v199[4] = v47;
        *(_WORD *)&v199[8] = 2080;
        *(void *)&v199[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        v200 = 1024;
        v201 = 2380;
        v202 = 2080;
        __int16 v203 = "discarding choice";
        uint64_t v116 = v114;
        goto LABEL_185;
      }
    }

    else
    {
      if (*v19) {
        BOOL v117 = **v19;
      }
      else {
        BOOL v117 = 0LL;
      }
      uint64_t v115 = sub_10004CFE0(v117, &v177, &v176);
      uint64_t v47 = v115;
      if ((_DWORD)v115)
      {
        v120 = (os_log_s *)VSGetLogDefault(v115);
        uint64_t v115 = os_log_type_enabled(v120, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v115)
        {
          *(_DWORD *)unsigned int v199 = 67109890;
          *(_DWORD *)&v199[4] = v47;
          *(_WORD *)&v199[8] = 2080;
          *(void *)&v199[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          v200 = 1024;
          v201 = 2384;
          v202 = 2080;
          __int16 v203 = "getting new choice count";
          uint64_t v116 = v120;
LABEL_185:
          _os_log_error_impl( (void *)&_mh_execute_header,  v116,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d (%s)\n",  v199,  0x22u);
        }
      }

      else
      {
        --v41;
      }
    }

    v121 = (os_log_s *)VSGetLogDefault(v115);
    uint64_t v122 = os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG);
    if (v122)
    {
      *(_WORD *)unsigned int v199 = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v121,  OS_LOG_TYPE_DEBUG,  "discarding invalid result:\n ",  v199,  2u);
    }

    if (cf && (unsigned int v123 = (os_log_s *)VSGetLogDefault(v122), os_log_type_enabled(v123, OS_LOG_TYPE_DEBUG)))
    {
      *(_DWORD *)unsigned int v199 = 138412290;
      *(void *)&v199[4] = cf;
      _os_log_debug_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEBUG, "%@", v199, 0xCu);
      if (v12) {
LABEL_192:
      }
        sub_1000DCE80((uint64_t)cf, (uint64_t)v98, key[2], 0, (__CFArray **)&v178);
    }

    else if (v12)
    {
      goto LABEL_192;
    }

    uint64_t v147 = 1;
LABEL_194:
    if (cf) {
      CFRelease(cf);
    }
    CFRelease(v98);
LABEL_197:
    if (v174) {
      CFRelease(v174);
    }
    if (cf1) {
      CFRelease(cf1);
    }
    if (v157) {
      CFRelease(v157);
    }
LABEL_203:
    uint64_t v42 = v167;
LABEL_204:
    if (v47) {
      break;
    }
    ++v41;
  }

  while (v41 < v177);
  unint64_t v126 = v47 != 0;
  if (v47)
  {
    unint64_t v127 = theString2;
    if (v40)
    {
      CFRelease(v40);
      alloc = 0LL;
      unint64_t v126 = 1;
    }

    else
    {
      alloc = 0LL;
    }

    unint64_t v128 = cf2;
    if (!v12)
    {
LABEL_246:
      uint64_t v40 = alloc;
      goto LABEL_267;
    }
  }

  else
  {
    alloc = v40;
    unint64_t v128 = cf2;
    unint64_t v127 = theString2;
    if (!v12) {
      goto LABEL_246;
    }
  }

LABEL_172:
            BOOL v145 = (_DWORD)v91 != 1 || v182 < 2;
            if (!v145 && *(_WORD *)(v17 + 2LL * v139[v138]) == 49 && (v146 = v18[64]) != 0LL)
            {
              if ((int)sub_1000B3680(v16, v146, 1LL, 1LL, 0LL, 30, (uint64_t)v84) < 1)
              {
                else {
                  int v152 = *v84;
                }
                sub_1000B8938(v191, v15, v59, a5, 0LL, v58, v195, v196, v152, v139[v179], 1, 0, 0);
              }

              else
              {
                sub_1000B8938(v191, v15, v59, a5, 0LL, v58, v195, v196, *v84, v139[v179], 1, 0, 1);
              }

              ++v199;
            }

            else
            {
              uint64_t v147 = 0LL;
              uint64_t v148 = v138;
              do
              {
                *(&v203 + v147) = *(_WORD *)(v17 + 2LL * v139[v138 + v147]);
                ++v147;
              }

              while (v190 != v147);
              *(&v203 + v190) = 0;
              if (sub_1000B3680(v16, &v203, 1LL, 1LL, 0LL, 30, (uint64_t)v84))
              {
                if ((int)sub_1000B3680(v16, &v203, 1LL, 1LL, 0LL, 30, (uint64_t)v84) < 1)
                {
                  else {
                    int v150 = *v84;
                  }
                  sub_1000B8938(v191, v15, v59, a5, 0LL, v58, v195, v196, v150, v139[v148], v190, 0, 0);
                }

                else
                {
                  sub_1000B8938( v191,  v15,  v59,  a5,  0LL,  v58,  v195,  v196,  *v84,  v139[v148],  v190,  (int)&_mh_execute_header,  (unint64_t)&_mh_execute_header >> 32);
                }

                unsigned int v149 = v199 + 1;
              }

              else
              {
                unsigned int v149 = sub_1000B8998( v16,  v17 + 2LL * v139[v148],  v139[v148],  2,  v196,  v191,  v15,  v59,  a5,  0LL,  v58,  v195,  0)
                     + v199;
              }

              unsigned int v199 = v149;
              int v18 = v185;
            }

            LODWORD(v83) = v190 + v193;
            unsigned int v119 = v70 - (v190 + v193);
            if (v119 != 3) {
              goto LABEL_107;
            }
LABEL_169:
            v144 = v18[4];
            if (!v144) {
              goto LABEL_56;
            }
            int v141 = v83;
            v142 = v18[4];
LABEL_189:
            else {
              int v151 = *v84;
            }
            sub_1000B8938(v191, v15, v59, a5, 0LL, v58, v195, v196, v151, v200[v141 - 1] + 1, 0, 0, 0);
            goto LABEL_199;
          }
        }

        else
        {
          int v18 = v185;
          uint64_t v15 = v99;
        }

        uint64_t v58 = v98;
        uint64_t v59 = v97;
        int v70 = v188;
        int v138 = v193;
        v139 = v200;
        if (v188 == 4) {
          goto LABEL_165;
        }
        goto LABEL_172;
      }

      int v181 = v96;
      int v125 = sub_1000B37CC(v16, (char *)(v17 + 2LL * v200[(int)v83]), 0LL, 0LL, v91, 30LL, (uint64_t)v84);
      int v96 = v181;
      LODWORD(v91) = v190;
      if (v125 < 1) {
        goto LABEL_139;
      }
      BOOL v180 = 0;
      unint64_t v126 = v125 + 1LL;
      int v186 = -1;
      unint64_t v127 = v190;
      do
      {
        while (1)
        {
          unint64_t v128 = v127;
          uint64_t v129 = (v126 - 2);
          sub_1000B33F8((char *)v16, v201[v129], (uint64_t)v33, v118);
          unint64_t v130 = sub_1000CC52C((unint64_t)v33);
          if (--v126 <= 1) {
            goto LABEL_143;
          }
        }

        unint64_t v127 = v130;
        v131 = v33;
        v132 = v16;
        int v133 = v130 - 1;
        if (sub_1000CBA60(*(unsigned __int16 *)(v17 + 2LL * ((int)v130 - 1 + v200[v193])))
          || sub_1000CB890(*(unsigned __int16 *)(v17 + 2LL * (v133 + v200[v193])))
          && sub_1000CB890(*(unsigned __int16 *)(v17 + 2LL * (v200[v193] + (int)v127)))
          || sub_1000CBA3C(*(unsigned __int16 *)(v17 + 2LL * (v133 + v200[v193])))
          && sub_1000CBA3C(*(unsigned __int16 *)(v17 + 2LL * (v200[v193] + (int)v127))))
        {
          unint64_t v127 = v128;
          uint64_t v16 = v132;
          goto LABEL_125;
        }

        int v134 = sub_1000CD3EC((_WORD *)(v17 + 2LL * v200[v193]), v131, v127);
        uint64_t v16 = v132;
        if ((_DWORD)v127 != (_DWORD)v128)
        {
          unint64_t v127 = v128;
          goto LABEL_125;
        }

        if (v180 && v134)
        {
          BOOL v180 = 1;
          unint64_t v127 = v128;
        }

        else
        {
LABEL_138:
          int v186 = v201[v129];
          BOOL v180 = v134 == 0;
        }

LABEL_125:
        int v33 = v131;
        v118 = v198;
        --v126;
      }

      while (v126 > 1);
LABEL_143:
      uint64_t v99 = v177;
      uint64_t v97 = v178;
      uint64_t v98 = a6;
      uint64_t v84 = v201;
      LODWORD(v91) = v190;
      int v96 = v181;
      if (v186 == -1) {
        goto LABEL_104;
      }
      if (v181)
      {
        if ((_DWORD)v127 == v190)
        {
          v136 = v185[48];
          if (v136)
          {
            if ((int)sub_1000B3680(v16, v136, 1LL, 1LL, 0LL, 30, (uint64_t)v201) >= 1)
            {
              uint64_t v169 = v200[v179];
              sub_1000B8938(v191, v177, v178, a5, 0LL, a6, v195, v196, *v201, v169, SHIDWORD(v169), 0, 1);
              unsigned int v87 = v199;
            }

            else
            {
              else {
                int v137 = *v201;
              }
              unsigned int v87 = v199;
              uint64_t v174 = v200[v179];
              sub_1000B8938(v191, v177, v178, a5, 0LL, a6, v195, v196, v137, v174, SHIDWORD(v174), 0, 0);
            }

            unsigned int v199 = v87 + 1;
          }
        }
      }

      uint64_t v88 = v193;
      sub_1000B8938(v191, v177, v178, a5, 0LL, a6, v195, v196, v186, v200[v88], v127, 0, v180);
      ++v199;
      int v89 = v200[v88] + v127;
      uint64_t v15 = v177;
      uint64_t v58 = a6;
      uint64_t v59 = v178;
      *a11 = v89;
      int v70 = v188;
      LODWORD(v83) = v190 + v193;
      int v18 = v185;
      uint64_t v84 = v201;
LABEL_56:
      v61 = v200;
    }

    uint64_t v92 = (int)v83;
    uint64_t v93 = v61[(int)v83];
    v94 = (unsigned __int16 *)(v17 + 2 * v93);
    int v95 = *v94;
    if (v95 != 49)
    {
      if (v95 == 48)
      {
        int v96 = 0;
        LODWORD(v83) = v83 + 1;
        uint64_t v84 = v201;
        goto LABEL_94;
      }

      int v192 = v83;
      if (*((_DWORD *)v18 + 132))
      {
        v103 = v61;
        __int16 v203 = *v94;
        int v204 = 3145776;
        __int16 v205 = 0;
        v104 = v201;
        if ((int)sub_1000B3680(v16, &v203, 1LL, 1LL, 0LL, 30, (uint64_t)v201) < 1)
        {
          v105 = &v203;
LABEL_84:
          else {
            int v107 = *v104;
          }
          v61 = v103;
          int v108 = v103[v92];
          char v176 = 0;
          uint64_t v109 = 1LL;
          goto LABEL_88;
        }

        goto LABEL_72;
      }

      goto LABEL_77;
    }

    if (*((_DWORD *)v18 + 132))
    {
      v100 = &v61[(int)v83];
      if (*(_WORD *)(v17 + 2LL * v100[1]) == 48 && *(_WORD *)(v17 + 2LL * v100[2]) == 48)
      {
        int v192 = v83;
        if ((int)sub_1000B3680(v16, L"100", 1LL, 1LL, 0LL, 30, (uint64_t)v201) >= 1)
        {
          char v176 = 1;
          *((void *)&v168 + 1) = 3LL;
          LODWORD(v168) = *v201;
          DWORD1(v168) = v61[v92];
          uint64_t v101 = v191;
          uint64_t v102 = v15;
          uint64_t v59 = v178;
LABEL_90:
          uint64_t v115 = v59;
          uint64_t v116 = a5;
LABEL_91:
          uint64_t v58 = a6;
          sub_1000B8938( v101,  v102,  v115,  v116,  0LL,  a6,  v195,  v196,  v168,  SDWORD1(v168),  SDWORD2(v168),  SHIDWORD(v168),  v176);
          ++v199;
          goto LABEL_92;
        }

        else {
          int v107 = *v201;
        }
        uint64_t v59 = v178;
        int v108 = v61[v92];
        char v176 = 0;
        uint64_t v109 = 3LL;
        goto LABEL_88;
      }

      int v106 = v18[62];
      if (!v106)
      {
        uint64_t v84 = v201;
LABEL_93:
        LODWORD(v83) = v83 + 1;
        int v96 = 1;
        int v179 = v83;
        goto LABEL_94;
      }

      int v192 = v83;
      v103 = v61;
      v104 = v201;
      if ((int)sub_1000B3680(v16, v106, 1LL, 1LL, 0LL, 30, (uint64_t)v201) < 1)
      {
        v105 = v18[62];
        goto LABEL_84;
      }

LABEL_245:
    --v160;
  }

  while (v160 > 1);
  int v70 = 3;
  if (v187 == -1)
  {
    uint64_t v15 = v177;
    uint64_t v59 = v178;
    uint64_t v84 = v201;
    v61 = v200;
    uint64_t v58 = a6;
    LODWORD(v83) = 0;
    goto LABEL_50;
  }

  v61 = v200;
  sub_1000B8938(v162, v177, v178, a5, 0LL, a6, v195, v196, v187, *v200, v161, 0, v183);
  ++v199;
  *a11 = *v200 + v161;
  uint64_t v84 = v201;
LABEL_52:
  sub_1000CB038(v61, 120LL);
  sub_1000CB038(v84, 120LL);
  int v85 = sub_1000B3288(v16);
  sub_1000CB038(v198, 2LL * (v85 + 1));
  int v86 = sub_1000B324C(v16);
  sub_1000CB038(v33, 2LL * (v86 + 1));
  return v199;
}

uint64_t sub_1000A9814( uint64_t *a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9, int *a10, _WORD *a11, _WORD *a12, int *a13, uint64_t a14)
{
  uint64_t v14 = a14;
  if (*(int *)(a14 + 16) >= 1)
  {
    unsigned int v91 = 0;
    int v17 = 0;
    uint64_t v84 = *(void *)(a1[7] + 216);
    while (1)
    {
      int v19 = (int *)(v14 + 28LL * v17);
      int v20 = *v19;
      if (*v19 == 1)
      {
        uint64_t v30 = v14 + 28LL * v17;
        int v32 = *(_DWORD *)(v30 + 8);
        uint64_t v31 = (int *)(v30 + 8);
        if (v32 < 1)
        {
          LOWORD(v92[0]) = 0;
        }

        else
        {
          uint64_t v33 = 0LL;
          int v34 = (int *)(v14 + 28LL * v17 + 4);
          do
          {
            *((_WORD *)v92 + v33) = sub_1000CB5E8(*(unsigned __int16 *)(a2 + 2 * (v33 + *v34)));
            ++v33;
          }

          while (v33 < *v31);
          *((_WORD *)v92 + v33) = 0;
        }

        if (v17 < 1)
        {
          unsigned int v57 = v91;
        }

        else
        {
          int v56 = *(_WORD **)(v84 + 352);
          unsigned int v57 = v91;
          if (v56)
          {
            if ((int)sub_1000B3680(a1, v56, 1LL, 1LL, 0LL, 30, (uint64_t)a9) < 1)
            {
              else {
                int v64 = *a9;
              }
              uint64_t v74 = *(unsigned int *)(a14 + 28LL * v17 + 4);
              sub_1000B8938(a4, a5, a6, a7, 0LL, a8, a10, a3, v64, v74, SHIDWORD(v74), 0, 0);
            }

            else
            {
              uint64_t v73 = *(unsigned int *)(a14 + 28LL * v17 + 4);
              sub_1000B8938(a4, a5, a6, a7, 0LL, a8, a10, a3, *a9, v73, SHIDWORD(v73), 0, 1);
            }

            unsigned int v57 = v91 + 1;
          }
        }

        uint64_t v66 = a1[7];
        if (*(int *)(v66 + 120) >= 1)
        {
          uint64_t v67 = 0LL;
          uint64_t v68 = 0LL;
          while (sub_1000CCE90(v92, *(unsigned __int16 **)(*(void *)(v66 + 128) + v67))
               && sub_1000CCE90(v92, *(unsigned __int16 **)(*(void *)(a1[7] + 128) + v67 + 16)))
          {
            ++v68;
            uint64_t v66 = a1[7];
            v67 += 32LL;
          }

          else {
            int v69 = *a9;
          }
          uint64_t v75 = *(unsigned int *)(a14 + 28LL * v17 + 4);
          sub_1000B8938(a4, a5, a6, a7, 0LL, a8, a10, a3, v69, v75, SHIDWORD(v75), 0, 0);
          ++v57;
        }

uint64_t sub_1000AA40C( uint64_t *a1, __int16 *a2, unsigned int a3, uint64_t a4, void *a5, void *a6, void *a7, void *a8, void *a9)
{
  uint64_t v400 = 0LL;
  int v13 = sub_1000CC52C((unint64_t)a2);
  int v21 = v13 + 10;
  for (int i = v13 + 11; ; int i = v24 + 4)
  {
    uint64_t v23 = (int *)sub_1000CAFC0(28LL * i, v14, v15, v16, v17, v18, v19, v20);
    int v24 = sub_1000A6628(a2, v21, (uint64_t)v23);
    if (v24 <= v21) {
      break;
    }
    sub_1000CB038(v23, 28LL * (v21 + 1));
    int v21 = v24 + 3;
  }

  v379 = v23;
  uint64_t v380 = a4;
  int v366 = v21;
  size_t v25 = 4LL * (int)a4;
  bzero(a5, v25);
  if (a6) {
    bzero(a6, v25);
  }
  uint64_t v376 = (uint64_t)a6;
  if (a7) {
    bzero(a7, v25);
  }
  if (a8) {
    bzero(a8, (int)v380);
  }
  if (a9) {
    bzero(a9, (int)v380);
  }
  int v26 = sub_1000CC52C((unint64_t)a2) + 1;
  int v34 = (__int16 *)sub_1000CAFC0(2LL * v26, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v35 = v34;
  if (v34 && sub_1000CC548(v34, a2, v26))
  {
    uint64_t v364 = 2LL * v26;
    int v36 = sub_1000B324C(a1);
    v383 = sub_1000CAFC0(2LL * (v36 + 1), v37, v38, v39, v40, v41, v42, v43);
    int v44 = sub_1000B3288(a1);
    v382 = sub_1000CAFC0(2LL * (v44 + 1), v45, v46, v47, v48, v49, v50, v51);
    v384 = (int *)sub_1000CAFC0(0x78uLL, v52, v53, v54, v55, v56, v57, v58);
    v390 = v35;
    if (v24 > 0)
    {
      uint64_t v391 = 0LL;
      uint64_t v66 = 0LL;
      uint64_t v67 = 0LL;
      v386 = (int **)a1[7];
      v363 = v386[27];
      int v375 = v24;
      uint64_t v369 = v24;
      do
      {
        while (1)
        {
          uint64_t v68 = *v386;
          uint64_t v69 = v66;
          if (**v386 >= 1)
          {
            do
            {
              sub_1000C0BFC(0x28uLL, v59, v60, v61, v62, v63, v64, v65);
              if (v69) {
                *(void *)(v103 + 32) = v69;
              }
              *(void *)uint64_t v103 = v68;
              *(_DWORD *)(v103 + 12) = 0;
              *(_DWORD *)(v103 + 16) = v391;
              *(_DWORD *)(v103 + 20) = v391;
              *(_DWORD *)(v103 + 8) = v68[14];
              int v102 = v68[16];
              v68 += 16;
              uint64_t v69 = v103;
            }

            while (v102 > 0);
          }

          uint64_t v66 = 0LL;
          int v70 = &v23[7 * v391];
          uint64_t v393 = v391 + 1;
          uint64_t v71 = v69;
          do
          {
            uint64_t v72 = *(int *)(v71 + 12);
            if ((int)v72 < **(_DWORD **)v71 - 1)
            {
              uint64_t v73 = *(void *)(*(void *)v71 + 8LL);
              uint64_t v74 = *(int *)(v73 + 8 * v72);
              int v75 = *(_DWORD *)(v73 + 8LL * ((int)v72 + 1));
              if (v75 > (int)v74)
              {
                uint64_t v76 = 12 * v74;
                int v77 = v75 - v74;
                uint64_t v78 = v67;
                do
                {
                  while (1)
                  {
                    uint64_t v79 = *(void *)(*(void *)v71 + 24LL);
                    uint64_t v59 = *(unsigned int *)(v79 + v76);
                    if ((_DWORD)v59)
                    {
                      if (v391 == *(_DWORD *)(v71 + 20)
                        && sub_1000AEBB8((uint64_t)v386, v59, (uint64_t)v390, v70))
                      {
                        break;
                      }
                    }

                    uint64_t v67 = v78;
                    v76 += 12LL;
                    if (!--v77) {
                      goto LABEL_19;
                    }
                  }

                  sub_1000C0BFC(0x28uLL, v59, v60, v61, v62, v63, v64, v65);
                  uint64_t v67 = v80;
                  if (v66)
                  {
                    *(void *)(v78 + 32) = v80;
                    uint64_t v80 = v66;
                  }

                  *(void *)uint64_t v67 = *(void *)v71;
                  *(_DWORD *)(v67 + 12) = *(_DWORD *)(v79 + v76 + 8);
                  *(_DWORD *)(v67 + 16) = *(_DWORD *)(v71 + 16);
                  *(_DWORD *)(v67 + 20) = v393;
                  *(_DWORD *)(v67 + 8) = *(_DWORD *)(v71 + 8);
                  uint64_t v66 = v80;
                  v76 += 12LL;
                  uint64_t v78 = v67;
                  --v77;
                }

                while (v77);
              }
            }

LABEL_143:
            int v157 = (_BYTE *)sub_1000B31D0(a1);
            if (sub_1000C8AB4(v157, "frfr"))
            {
              v401[0] = (unsigned __int16)v390[*v118];
              if ((int)sub_1000B3680(a1, v401, 0LL, 1LL, 0LL, 30, (uint64_t)v384) < 1)
              {
                char v159 = 0;
                int v158 = -1;
              }

              else
              {
                int v158 = *v384;
                char v159 = 1;
              }

              sub_1000B8938( v127,  (uint64_t)a5,  v128,  v122,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v158,  *v118,  1,  0,  v159);
            }

            else
            {
              v318 = (char *)&v390[*v118];
              int v319 = sub_1000B37CC(a1, v318, 0LL, 0LL, v125, 30LL, (uint64_t)v384);
              if (v319 < 1)
              {
LABEL_428:
                int v322 = -1;
                int v328 = v125;
              }

              else
              {
                int v320 = v319;
                sub_1000CC548(v401, v321, 10);
                int v322 = -1;
                while (2)
                {
                  while (1)
                  {
                    int v323 = v320;
                    if (v322 != -1) {
                      break;
                    }
                    v330 = (unsigned int *)&v384[v320 - 1];
                    uint64_t v331 = -1LL;
                    while (1)
                    {
                      unsigned int v332 = *v330--;
                      sub_1000B33F8((char *)a1, v332, (uint64_t)v383, v382);
                      int v333 = sub_1000CC52C((unint64_t)v383);
                      if (v333 >= (int)v125)
                      {
                        int v328 = v333;
                        if (!sub_1000CB890(*(unsigned __int16 *)&v318[2 * v333 - 2])
                          || !sub_1000CB890(*(unsigned __int16 *)&v318[2 * v328]))
                        {
                          break;
                        }
                      }
                    }

                    sub_1000CD3EC(v318, v383, v328);
                    sub_1000CCE90(v382, (unsigned __int16 *)v401);
                    int v320 = v323 + v331;
                    int v322 = v384[(v323 - 1) + 1 + v331];
                    LODWORD(v125) = v328;
                    if (v320 <= 0) {
                      goto LABEL_469;
                    }
                  }

                  uint64_t v374 = v111;
                  v324 = (unsigned int *)&v384[v320 - 1];
                  uint64_t v325 = -1LL;
                  while (1)
                  {
                    unsigned int v326 = *v324--;
                    sub_1000B33F8((char *)a1, v326, (uint64_t)v383, v382);
                    int v327 = sub_1000CC52C((unint64_t)v383);
                    if (v327 >= (int)v125)
                    {
                      int v328 = v327;
                      if (!sub_1000CB890(*(unsigned __int16 *)&v318[2 * v327 - 2])
                        || !sub_1000CB890(*(unsigned __int16 *)&v318[2 * v328]))
                      {
                        sub_1000CD3EC(v318, v383, v328);
                      }
                    }

                    if (v323 + (int)--v325 + 2 <= 1)
                    {
                      int v328 = v125;
                      LODWORD(v111) = v374;
                      goto LABEL_469;
                    }
                  }

                  int v320 = v323 + v325;
                  uint64_t v329 = (v323 - 1) + v325 + 1;
                  uint64_t v111 = v374;
                  int v322 = v384[v329];
                  LODWORD(v125) = v328;
                  if (v320 > 0) {
                    continue;
                  }
                  break;
                }
              }

          uint64_t v98 = (os_log_s *)VSGetLogDefault(v87);
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)newValues = 0;
            _os_log_debug_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEBUG, "\n", newValues, 2u);
          }

          int v99 = v89 && v90;
          uint64_t v19 = v151;
          uint64_t v16 = kCFAllocatorDefault;
          if (v99)
          {
            uint64_t v100 = sub_100045674(a1, v172, (char *)v89, "_CONSTRAINT_CLASS_END", v168, &v171);
            uint64_t v61 = v171 | v100 ? v100 : 1;
            if (v61) {
              break;
            }
          }

          uint64_t v84 = v85 + 1;
          if (v85 + 1 >= v164 || v61) {
            goto LABEL_155;
          }
        }

        unint64_t v135 = (os_log_s *)VSGetLogDefault(v100);
        if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)newValues = 67109890;
          *(_DWORD *)&newValues[4] = v61;
          *(_WORD *)&newValues[8] = 2080;
          *(void *)&newValues[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          *(_WORD *)&newValues[18] = 1024;
          *(_DWORD *)&newValues[20] = 882;
          LOWORD(v175[0]) = 2080;
          *(void *)((char *)v175 + 2) = "couldn't add sequences to constraint";
          _os_log_error_impl( (void *)&_mh_execute_header,  v135,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d (%s)\n",  newValues,  0x22u);
        }

LABEL_469:
              sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v322,  *v118,  0,  0,  0);
              LODWORD(v125) = v328;
              v121 = v379;
            }

LABEL_475:
            ++v392;
            if ((int)v125 > *v124)
            {
              uint64_t v354 = v117 + 1;
              if (v121[7 * v117 + 7])
              {
                v355 = (int *)v365 + 7 * (int)v117;
                uint64_t v356 = 1LL;
                do
                {
                  uint64_t v354 = ++v356 + v117;
                  int v357 = *v355;
                  v355 += 7;
                }

                while (v357);
              }

              else
              {
                LODWORD(v356) = 1;
              }

              LODWORD(v111) = v111 + v356 - 1;
            }

            goto LABEL_79;
          }

          unint64_t v130 = (_BYTE *)sub_1000B31D0(a1);
          if (!sub_1000C8AB4(v130, "frfr") && v379[7 * (int)v111 + 3] != 5)
          {
            uint64_t v122 = (uint64_t)a7;
            v121 = v379;
            v352 = &v379[7 * (int)v111];
            unsigned int v353 = v352[2];
            int v124 = v352 + 2;
            uint64_t v125 = v353;
            uint64_t v128 = v376;
            uint64_t v127 = v380;
            goto LABEL_143;
          }

          if (*v116 != 3) {
            goto LABEL_96;
          }
          int v120 = *(unsigned __int16 *)v119;
        }

        if (v120 != 46) {
          goto LABEL_96;
        }
        uint64_t v131 = (int)v111 + 1LL;
        if ((_DWORD)v111 + 1 != v375 && v379[7 * v131] == 2) {
          goto LABEL_96;
        }
        int v143 = a1;
        int v144 = sub_1000B37CC(a1, v119, 0LL, 0LL, 1LL, 30LL, (uint64_t)v384);
        if (v144 < 1) {
          goto LABEL_146;
        }
        int v371 = v111;
        BOOL v395 = 0;
        uint64_t v145 = v144 + 1LL;
        uint64_t v146 = 1LL;
        int v147 = -1;
        while (1)
        {
          uint64_t v148 = v146;
          uint64_t v149 = (v145 - 2);
          sub_1000B33F8((char *)a1, v384[v149], (uint64_t)v383, v382);
          unint64_t v150 = sub_1000CC52C((unint64_t)v383);
          uint64_t v146 = v150;
          uint64_t v151 = (v150 - 1);
          if (sub_1000CBA60(*(unsigned __int16 *)&v119[2 * v151])
            || sub_1000CB890(*(unsigned __int16 *)&v119[2 * v151])
            && sub_1000CB890(*(unsigned __int16 *)&v119[2 * v146]))
          {
            goto LABEL_120;
          }

          if (sub_1000CBA3C(*(unsigned __int16 *)&v119[2 * v151])
            && sub_1000CBA3C(*(unsigned __int16 *)&v119[2 * v146]))
          {
            goto LABEL_120;
          }

          int v152 = sub_1000CD3EC(v119, v383, v146);
          if ((_DWORD)v146 != (_DWORD)v148)
          {
LABEL_120:
            uint64_t v146 = v148;
          }

          else if (v395 && v152)
          {
            BOOL v395 = 1;
            uint64_t v146 = v148;
          }

          else
          {
LABEL_133:
            int v147 = v384[v149];
            BOOL v395 = v152 == 0;
            if ((unint64_t)--v145 <= 1)
            {
LABEL_134:
              int v143 = a1;
              LODWORD(v111) = v371;
              if (v147 != -1 && (int)v146 >= 2)
              {
                sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v147,  *v118,  v146,  0,  v395);
                ++v392;
                if ((int)v146 > v379[7 * (int)v117 + 2])
                {
                  if (v379[7 * (int)v131])
                  {
                    uint64_t v153 = (int)v131;
                    v154 = (int *)v365 + 7 * (int)v117;
                    uint64_t v155 = 1LL;
                    do
                    {
                      uint64_t v153 = ++v155 + v117;
                      int v156 = *v154;
                      v154 += 7;
                    }

                    while (v156);
                  }

                  else
                  {
LABEL_427:
                    LODWORD(v155) = 1;
                  }

LABEL_410:
                  LODWORD(v400) = v155 - 1;
                }

                goto LABEL_79;
              }

          uint64_t v279 = *(_DWORD *)(v472 + 4 * v409);
          v408 = sub_1000CCE40(v469, v37);
          v406 = v472;
          if (!v408) {
            goto LABEL_417;
          }
LABEL_411:
        }
      }

      if (v391) {
        sub_1000CB038((void *)v391, 120LL);
      }
      v432 = -1;
      uint64_t v279 = -1;
      uint64_t v280 = -1;
      uint64_t v38 = v434;
LABEL_203:
      uint64_t v281 = v458;
      if ((v445 & 1) != 0)
      {
LABEL_204:
        if (v279 == -1) {
          uint64_t v282 = v280;
        }
        else {
          uint64_t v282 = v279;
        }
        uint64_t v283 = -1;
        v284 = (void *)v472;
        goto LABEL_208;
      }

      int v372 = v38;
      do
      {
        int v373 = *(unsigned __int16 *)v372;
        if (!*v372) {
          goto LABEL_204;
        }
        ++v372;
      }

      while (sub_1000CBA60(v373));
      v381 = sub_1000CAF58(120LL, v374, v375, v376, v377, v378, v379, v380);
      v382 = sub_100082CF0(*a1);
      if (v382 < 1)
      {
        uint64_t v281 = v458;
        if (v381) {
          sub_1000CB038((void *)v381, 120LL);
        }
        goto LABEL_204;
      }

      v383 = v382;
      v384 = 0LL;
      if (v382 >= 30) {
        v385 = 30LL;
      }
      else {
        v385 = v382;
      }
      if (v385 < 8)
      {
        v386 = v472;
      }

      else
      {
        v386 = v472;
        if (v472 - v381 >= 0x20)
        {
          v384 = v385 & 0x18;
          *(void *)&v387 = __PAIR64__(HIDWORD(*(void *)v381), *(_OWORD *)v381) | 0xC0000000C0000000LL;
          DWORD2(v387) = *(void *)(v381 + 8) | 0xC0000000;
          HIDWORD(v387) = HIDWORD(*(_OWORD *)v381) | 0xC0000000;
          int v388 = *(_OWORD *)(v381 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
          *(_OWORD *)v472 = v387;
          *(_OWORD *)(v472 + 16) = v388;
          if ((v385 & 0xFFFFFFF8) != 8)
          {
            int v389 = *(_OWORD *)(v381 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v472 + 32) = *(_OWORD *)(v381 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v472 + 48) = v389;
            if (v384 != 16)
            {
              v390 = *(_OWORD *)(v381 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v472 + 64) = *(_OWORD *)(v381 + 64) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v472 + 80) = v390;
            }
          }

          if (v384 == v385) {
            goto LABEL_422;
          }
        }
      }

      v411 = v385 - v384;
      v412 = 4 * v384;
      v413 = (unsigned int *)(v386 + 4 * v384);
      v414 = (int *)(v381 + v412);
      do
      {
        v415 = *v414++;
        *v413++ = v415 | 0xC0000000;
        --v411;
      }

      while (v411);
LABEL_422:
      sub_1000CB038((void *)v381, 120LL);
      v284 = (void *)v472;
      v416 = v383 + 1LL;
      uint64_t v283 = -1;
      v417 = -1;
      do
      {
        while (1)
        {
          v419 = (v416 - 2);
          sub_1000B33F8((char *)a1, *((_DWORD *)v284 + v419), (uint64_t)v475, v469);
          v417 = *(_DWORD *)(v472 + 4 * v419);
          v418 = sub_1000CCE40(v469, v459);
          v284 = (void *)v472;
          if (!v418) {
            goto LABEL_427;
          }
LABEL_424:
          if (--v416 <= 1) {
            goto LABEL_428;
          }
        }

        v420 = sub_1000CCE40(v469, v459);
        v284 = (void *)v472;
        if (v420) {
          goto LABEL_424;
        }
LABEL_427:
        uint64_t v283 = *((_DWORD *)v284 + v419);
        --v416;
      }

      while (v416 > 1);
LABEL_428:
      if (v279 == -1) {
        uint64_t v282 = v280;
      }
      else {
        uint64_t v282 = v279;
      }
      int v285 = v417;
      uint64_t v281 = v458;
      if (v417 == -1) {
LABEL_208:
      }
        int v285 = v283;
      if (v432 == -1 || v282 == -1 || v285 == -1)
      {
        sub_1000CB038(v284, 120LL);
        sub_1000CB038(v469, v426);
        sub_1000CB038(v475, v427);
        sub_1000CB038(v430, v428);
        if (v281 < 1) {
          return 1LL;
        }
        *a7 = -1;
        if (v448) {
          *v448 = 0;
        }
        if (a9) {
          *(_DWORD *)a9 = v449;
        }
        if (!a11) {
          return 1LL;
        }
        *a11 = 0;
        return 1LL;
      }

      v424 = v282;
      v422 = v285;
      int v178 = 0LL;
      v437 = -2LL - a3;
      uint64_t v286 = a3;
      while (2)
      {
        while (2)
        {
          uint64_t v288 = 0LL;
          do
          {
            uint64_t v289 = sub_1000CBA60(*(unsigned __int16 *)(v286 + v288));
            v288 += 2LL;
          }

          while (v289);
          uint64_t v290 = (unsigned __int16 *)(v286 + v288 - 2);
          if (!*v290) {
            goto LABEL_397;
          }
          v440 = (_WORD *)(v286 + v288);
          uint64_t v291 = 1;
          uint64_t v292 = (unsigned __int16 *)(v286 + v288 - 2);
          do
          {
            memset(v477, 0, sizeof(v477));
            sub_1000CC1FC(*v292, 0, 0LL, 0LL, (unsigned int *)&v477[8], 0LL, 0LL, &v477[4], v477, 0LL, 0LL);
            if (!*(void *)v477) {
              break;
            }
            v294 = v292[1];
            ++v292;
            v293 = v294;
            if (!*(_DWORD *)&v477[4]) {
              uint64_t v291 = 0;
            }
          }

          while (v293);
          v466 = v178;
          int v295 = v290 == v292;
          v462 = &v292[v290 == v292];
          if (!v291) {
            int v295 = 1;
          }
          v446 = v295;
          if (!v295 && *v462 == *(unsigned __int16 *)v38 && sub_1000CBA3C(v462[1]))
          {
            v296 = 0LL;
            while (1)
            {
              int v297 = &v462[v296];
              uint64_t v298 = v462[v296 + 2] != *(unsigned __int16 *)v38 || !sub_1000CBA3C(v297[3]);
              memset(v477, 0, sizeof(v477));
              sub_1000CC1FC(v297[2], 0, 0LL, 0LL, (unsigned int *)v477, 0LL, 0LL, &v477[8], &v477[4], 0LL, 0LL);
              if (!*(void *)&v477[4]) {
                break;
              }
              if (*(_DWORD *)&v477[8])
              {
                ++v296;
                if (v298) {
                  continue;
                }
              }

              goto LABEL_251;
            }

            if (v298)
            {
              uint64_t v299 = v430;
              sub_1000CC5F0( (uint64_t)v430,  v286 + v288 - 2,  ((unint64_t)&v462[v288 / 0xFFFFFFFFFFFFFFFELL + 1] - v286) >> 1);
              v447 = ((unint64_t)&v462[v288 / 0xFFFFFFFFFFFFFFFELL + 1] - v286) >> 1;
              *((_WORD *)v430 + (int)v447) = 0;
              v452 = (uint64_t)&v462[v296 + 2];
              do
              {
                int v300 = (unsigned __int16)*v299;
                if (!*v299) {
                  goto LABEL_325;
                }
                ++v299;
              }

              while (sub_1000CBA60(v300));
              int v308 = sub_1000CAF58(120LL, v301, v302, v303, v304, v305, v306, v307);
              int v309 = sub_100082CF0(*a1);
              if (v309 >= 1)
              {
                int v310 = 0LL;
                if (v309 >= 30) {
                  int v311 = 30LL;
                }
                else {
                  int v311 = v309;
                }
                if (v311 < 8)
                {
                  int v313 = v458;
                  int v312 = v472;
                }

                else
                {
                  int v312 = v472;
                  int v313 = v458;
                  if (v472 - v308 >= 0x20)
                  {
                    int v310 = v311 & 0x18;
                    *(void *)&int v314 = __PAIR64__(HIDWORD(*(void *)v308), *(_OWORD *)v308) | 0xC0000000C0000000LL;
                    DWORD2(v314) = *(void *)(v308 + 8) | 0xC0000000;
                    HIDWORD(v314) = HIDWORD(*(_OWORD *)v308) | 0xC0000000;
                    int v315 = *(_OWORD *)(v308 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                    *(_OWORD *)v472 = v314;
                    *(_OWORD *)(v472 + 16) = v315;
                    if ((v311 & 0xFFFFFFF8) != 8)
                    {
                      int v316 = *(_OWORD *)(v308 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                      *(_OWORD *)(v472 + 32) = *(_OWORD *)(v308 + 32) | __PAIR128__( 0xC0000000C0000000LL,  0xC0000000C0000000LL);
                      *(_OWORD *)(v472 + 48) = v316;
                      if (v310 != 16)
                      {
                        int v317 = *(_OWORD *)(v308 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                        *(_OWORD *)(v472 + 64) = *(_OWORD *)(v308 + 64) | __PAIR128__( 0xC0000000C0000000LL,  0xC0000000C0000000LL);
                        *(_OWORD *)(v472 + 80) = v317;
                      }
                    }

                    if (v310 == v311)
                    {
LABEL_335:
                      sub_1000CB038((void *)v308, 120LL);
                      uint64_t v369 = v478[0];
                      if (v478[0] >= v313 && v455 != 0) {
                        uint64_t v369 = 0;
                      }
                      if (v369 < v313)
                      {
                        a7[v369] = *(_DWORD *)v472;
                        if (v448) {
                          v448[v369] = (v437 + v286 + v288) >> 1;
                        }
                        if (a9) {
                          *(_DWORD *)&a9[4 * v369] = v447;
                        }
                        if (a11) {
                          a11[v369] = 1;
                        }
                      }

                      uint64_t v362 = v369 + 1;
                      uint64_t v361 = v466 + 1;
                      int v359 = (uint64_t)v448;
                      int v360 = (uint64_t)a9;
                      if (v362 >= v313 && v455 != 0) {
                        uint64_t v362 = 0;
                      }
                      if (v362 < v313) {
                        goto LABEL_353;
                      }
                      goto LABEL_359;
                    }
                  }
                }

                uint64_t v364 = v311 - v310;
                v365 = 4 * v310;
                int v366 = (unsigned int *)(v312 + 4 * v310);
                uint64_t v367 = (int *)(v308 + v365);
                do
                {
                  v368 = *v367++;
                  *v366++ = v368 | 0xC0000000;
                  --v364;
                }

                while (v364);
                goto LABEL_335;
              }

              if (v308) {
                sub_1000CB038((void *)v308, 120LL);
              }
LABEL_325:
              int v358 = (v437 + v286 + v288) >> 1;
              int v359 = (uint64_t)v448;
              int v360 = (uint64_t)a9;
              int v313 = v458;
              uint64_t v361 = sub_1000B8998( a1,  (uint64_t)v290,  v358,  v447,  v455,  v458,  (uint64_t)a7,  (uint64_t)v448,  (uint64_t)a9,  0LL,  (uint64_t)a11,  v478,  1)
                   + v466;
              uint64_t v362 = v478[0];
              if (v362 < (int)v458)
              {
LABEL_353:
                a7[v362] = v422;
                if (v359) {
                  *(_DWORD *)(v359 + 4LL * v362) = ((unint64_t)v462 - a3) >> 1;
                }
                if (v360) {
                  *(_DWORD *)(v360 + 4LL * v362) = 1;
                }
                if (a11) {
                  a11[v362] = 1;
                }
              }

LABEL_146:
              unint64_t v160 = (__int16 **)(v363 + 116);
              uint64_t v161 = (__int16 **)(v363 + 120);
              if (*((_WORD *)v119 + 1))
              {
                uint64_t v162 = sub_1000CC7E0(asc_1000F24E0, *((unsigned __int16 *)v119 + 1));
                unint64_t v160 = (__int16 **)(v363 + 108);
                if (v162)
                {
                  unint64_t v160 = (__int16 **)(v363 + 116);
                  uint64_t v161 = (__int16 **)(v363 + 120);
                }

                else
                {
                  uint64_t v161 = (__int16 **)(v363 + 112);
                }
              }

              sub_1000CC548(v401, *v160, 16);
              sub_1000CC548(v403, *v161, 16);
              uint64_t v163 = sub_1000B3680(v143, v401, 1LL, 1LL, 0LL, 30, (uint64_t)v384);
              while ((int)v163 >= 1)
              {
                uint64_t v164 = v163 - 1;
                sub_1000B33F8((char *)a1, v384[v163 - 1], (uint64_t)v383, v382);
                int v165 = sub_1000CCE90(v382, (unsigned __int16 *)v403);
                uint64_t v163 = v164;
                if (!v165)
                {
                  int v166 = v384[v164];
                  goto LABEL_420;
                }
              }

              int v166 = -1;
LABEL_420:
              sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v166,  *v118,  0,  0,  1);
              ++v392;
LABEL_79:
              uint64_t v111 = (v111 + v400 + 1);
              uint64_t v23 = v379;
              goto LABEL_80;
            }
          }
        }
      }

LABEL_467:
            int v172 = 0;
LABEL_472:
            LODWORD(v400) = v168 - 1;
            int v115 = v172 + v392;
            goto LABEL_78;
          }

          v338 = &v379[7 * (int)v111];
          int v340 = v338[4];
          v339 = v338 + 4;
          LODWORD(v168) = v340;
          if (v340 < 1) {
            goto LABEL_467;
          }
          uint64_t v341 = 0LL;
          int v399 = 0;
          BOOL v342 = 1;
          while (1)
          {
            if (v116[7 * v341] != 2)
            {
              ++v341;
              goto LABEL_432;
            }

            v343 = &v116[7 * v341];
            int v346 = v343[2];
            v345 = v343 + 2;
            int v344 = v346;
            v348 = v345 - 1;
            uint64_t v347 = (int)*(v345 - 1);
            if (!v342) {
              break;
            }
            uint64_t v349 = (uint64_t)a7;
            if (v344 != 3) {
              goto LABEL_443;
            }
            if (v390[(int)v347 + 1] != 48 || v390[(int)v347 + 2] != 48)
            {
              int v344 = 3;
              goto LABEL_443;
            }

            v399 += sub_1000B8998( a1,  (uint64_t)&v390[v347],  v347,  1,  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  0);
            uint64_t v59 = *(void *)(*(void *)(a1[7] + 216) + 48LL);
            if (v59)
            {
              if ((int)sub_1000B3680(a1, (_WORD *)v59, 1LL, 1LL, 0LL, 30, (uint64_t)v384) < 1)
              {
                if ((int)sub_1000B3680( a1,  *(_WORD **)(*(void *)(a1[7] + 216) + 48LL),  0LL,  1LL,  0LL,  30,  (uint64_t)v384) < 1) {
                  int v351 = -1;
                }
                else {
                  int v351 = *v384;
                }
                sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v351,  *v348 + 1,  0,  0,  0);
              }

              else
              {
                sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  *v384,  *v348 + 1,  0,  0,  1);
              }

              ++v399;
              if (++v341 >= *v339) {
                goto LABEL_432;
              }
LABEL_444:
              if ((int)sub_1000B3680(a1, L",", 1LL, 1LL, 0LL, 30, (uint64_t)v384) < 1)
              {
                else {
                  int v350 = *v384;
                }
                sub_1000B8938( v380,  (uint64_t)a5,  v376,  v349,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v350,  *v345 + *v348,  0,  0,  0);
              }

              else
              {
                sub_1000B8938( v380,  (uint64_t)a5,  v376,  v349,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  *v384,  *v345 + *v348,  0,  0,  1);
              }

              ++v399;
              BOOL v342 = v342 && *v345 != 3;
              goto LABEL_432;
            }

            if (++v341 < *v339) {
              goto LABEL_444;
            }
LABEL_432:
            uint64_t v168 = *v339;
            if (v341 >= v168)
            {
              int v172 = v399;
              goto LABEL_472;
            }
          }

          uint64_t v349 = (uint64_t)a7;
LABEL_443:
          v399 += sub_1000B8998( a1,  (uint64_t)&v390[v347],  v347,  v344,  a3,  v380,  (uint64_t)a5,  v376,  v349,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  0);
          if (++v341 < *v339) {
            goto LABEL_444;
          }
          goto LABEL_432;
        case 3:
          int v114 = sub_1000A69C0( a1,  (uint64_t)v390,  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  v384,  (int *)&v400 + 1,  &v400,  &v23[7 * (int)v111]);
          goto LABEL_77;
        case 4:
          int v114 = sub_1000A77AC( a1,  (uint64_t)v390,  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  v384,  (int *)&v400 + 1,  v383,  v382,  (unsigned int *)&v400,  &v23[7 * (int)v111]);
          goto LABEL_77;
        case 5:
          v401[0] = 0;
          int v189 = sub_1000A7D60( a1,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  (uint64_t)v390,  &v23[7 * (int)v111],  v401);
          uint64_t v190 = (int)v111 + 1LL;
          if (!v379[7 * v190]) {
            goto LABEL_408;
          }
          unsigned int v191 = (int *)v365 + 7 * (int)v111;
          uint64_t v155 = 1LL;
          int v192 = v392;
          do
          {
            if (v379[7 * v190 + 1] >= v401[0]) {
              break;
            }
            uint64_t v190 = ++v155 + (int)v111;
            int v193 = *v191;
            v191 += 7;
          }

          while (v193);
          goto LABEL_409;
        case 6:
          v401[0] = 0;
          int v189 = sub_1000A7D60( a1,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  (uint64_t)v390,  &v23[7 * (int)v111],  v401);
          uint64_t v194 = (int)v111 + 1LL;
          if (v379[7 * v194])
          {
            v195 = (int *)v365 + 7 * (int)v111;
            uint64_t v155 = 1LL;
            int v192 = v392;
            do
            {
              if (v379[7 * v194 + 1] >= v401[0]) {
                break;
              }
              uint64_t v194 = ++v155 + (int)v111;
              int v196 = *v195;
              v195 += 7;
            }

            while (v196);
          }

          else
          {
LABEL_408:
            LODWORD(v155) = 1;
            int v192 = v392;
          }

LABEL_409:
          int v392 = v189 + v192;
          goto LABEL_410;
        case 7:
          v197 = &v379[7 * (int)v111];
          LODWORD(v198) = v197[4];
          v397 = v197 + 4;
          if ((int)v198 < 1)
          {
            int v200 = 0;
LABEL_462:
            LODWORD(v400) = v198 - 1;
            int v115 = v200 + v392;
LABEL_78:
            int v392 = v115;
            goto LABEL_79;
          }

          uint64_t v199 = 0LL;
          int v200 = 0;
          int v388 = 0;
          uint64_t v367 = *(void *)(a1[7] + 216);
          int v201 = 1;
          break;
        case 9:
          int v114 = sub_1000A9814( a1,  (uint64_t)v390,  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  v384,  (int *)&v400 + 1,  v383,  v382,  (int *)&v400,  (uint64_t)&v23[7 * (int)v111]);
LABEL_77:
          int v115 = v114 + v392;
          goto LABEL_78;
        case 10:
          v245 = &v379[7 * (int)v111];
          int v248 = v245[4];
          v247 = v245 + 4;
          LODWORD(v246) = v248;
          if (v248 < 1)
          {
            int v250 = 0;
          }

          else
          {
            uint64_t v249 = 0LL;
            int v250 = 0;
            do
            {
              int v252 = *(v118 - 1);
              if ((v252 - 3) >= 2)
              {
                if (v252 == 2)
                {
                  v253 = (_BYTE *)sub_1000B31D0(a1);
                  int v254 = sub_1000C8AB4(v253, "frfr");
                  int v255 = v118[1];
                  if (v254 || v255 > 3)
                  {
                    int v251 = sub_1000B8998( a1,  (uint64_t)&v390[*v118],  *v118,  v255,  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  0);
                  }

                  else
                  {
                    sub_1000CC548(v401, &v390[*v118], v255 + 1);
                    int v251 = sub_1000AF7E0( a1,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  (unint64_t)v401,  *v118);
                  }

                  v250 += v251;
                }
              }

              else
              {
                v401[0] = 0;
                if ((int)sub_1000B3680(a1, L",", 1LL, 1LL, 0LL, 1, (uint64_t)v401) >= 1)
                {
                  sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v118,  0,  0,  1);
                  ++v250;
                }
              }

              ++v249;
              uint64_t v246 = *v247;
              v118 += 7;
            }

            while (v249 < v246);
          }

          LODWORD(v400) = v246 - 1;
          int v115 = v250 + v392;
          goto LABEL_78;
        case 11:
          v256 = &v379[7 * (int)v111];
          int v259 = v256[4];
          v258 = v256 + 4;
          LODWORD(v257) = v259;
          if (v259 >= 1)
          {
            v398 = &v23[7 * (int)v111];
            uint64_t v260 = 0LL;
            int v389 = 0;
            v368 = v258;
            int v373 = v111;
            v261 = L"?";
            v262 = v258;
            while (1)
            {
              int v265 = v398[7 * v260];
              switch(v265)
              {
                case 1:
                  uint64_t v111 = (uint64_t)v261;
                  v266 = (char *)&v398[7 * v260];
                  v267 = (int *)(v266 + 8);
                  v268 = (_WORD *)sub_1000CAF58( 2LL * *((int *)v266 + 2) + 2,  v59,  (uint64_t)L"=",  v61,  v62,  v63,  v64,  v65);
                  uint64_t v270 = *((int *)v266 + 1);
                  v269 = (int *)(v266 + 4);
                  sub_1000CC548(v268, &v390[v270], *v267 + 1);
                  if (v268)
                  {
                    if ((int)sub_1000B3680(a1, v268, 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                    {
                      int v263 = sub_1000B3680(a1, v268, 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                      int v264 = v401[0];
                      if (v263 <= 0) {
                        int v264 = -1;
                      }
                      sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v264,  *v269,  *v267,  0,  0);
                    }

                    else
                    {
                      sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v269,  *v267,  (int)&_mh_execute_header,  (unint64_t)&_mh_execute_header >> 32);
                    }

                    ++v389;
                  }

                  sub_1000CB038(v268, 2LL * *v267 + 2);
LABEL_319:
                  v261 = (__int16 *)v111;
                  LODWORD(v111) = v373;
                  break;
                case 3:
                  v271 = (char *)&v398[7 * v260];
                  uint64_t v273 = *((int *)v271 + 1);
                  v272 = (int *)(v271 + 4);
                  switch(v390[v273])
                  {
                    case '#':
                      v274 = a1;
                      v275 = L"#";
                      goto LABEL_378;
                    case '$':
                      uint64_t v59 = *(void *)(*(void *)(a1[7] + 216) + 256LL);
                      if (!v59) {
                        goto LABEL_320;
                      }
                      if ((int)sub_1000B3680(a1, (_WORD *)v59, 1LL, 1LL, 0LL, 30, (uint64_t)v401) >= 1)
                      {
LABEL_351:
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      else
                      {
                        v275 = *(__int16 **)(*(void *)(a1[7] + 216) + 256LL);
                        v274 = a1;
LABEL_378:
                        int v314 = sub_1000B3680(v274, v275, 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v315 = v401[0];
                        if (v314 <= 0) {
                          int v315 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v315,  *v272,  1,  0,  0);
                      }

                      ++v389;
                      goto LABEL_320;
                    case '&':
                      uint64_t v111 = (uint64_t)v261;
                      if ((int)sub_1000B3680(a1, word_1000F1438, 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v304 = sub_1000B3680(a1, word_1000F1438, 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v305 = v401[0];
                        if (v304 <= 0) {
                          int v305 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v305,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      goto LABEL_319;
                    case '-':
                      if ((int)sub_1000B3680(a1, L"-", 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v306 = sub_1000B3680(a1, L"-", 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v307 = v401[0];
                        if (v306 <= 0) {
                          int v307 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v307,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      goto LABEL_376;
                    case '.':
                      int v276 = sub_1000B324C(a1);
                      v284 = (void *)sub_1000CAF58(2LL * (v276 + 1), v277, v278, v279, v280, v281, v282, v283);
                      int v285 = sub_1000B3288(a1);
                      v293 = (_WORD *)sub_1000CAF58(2LL * (v285 + 1), v286, v287, v288, v289, v290, v291, v292);
                      v294 = *(__int16 **)(*(void *)(a1[7] + 216) + 432LL);
                      int v295 = sub_1000CC52C((unint64_t)v294);
                      sub_1000CC548(v402, v294, v295 + 1);
                      v296 = *(__int16 **)(*(void *)(a1[7] + 216) + 448LL);
                      int v297 = sub_1000CC52C((unint64_t)v296);
                      sub_1000CC548(v403, v296, v297 + 1);
                      uint64_t v298 = sub_1000B3680(a1, v402, 1LL, 1LL, 0LL, 30, (uint64_t)v401);
                      break;
                    case '/':
                      v274 = a1;
                      v275 = L"/";
                      goto LABEL_378;
                    case ':':
                      if ((int)sub_1000B3680(a1, L":", 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v308 = sub_1000B3680(a1, L":", 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v309 = v401[0];
                        if (v308 <= 0) {
                          int v309 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v309,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      goto LABEL_376;
                    case ';':
                      if ((int)sub_1000B3680(a1, L";", 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v310 = sub_1000B3680(a1, L";", 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v311 = v401[0];
                        if (v310 <= 0) {
                          int v311 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v311,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      goto LABEL_320;
                    case '=':
                      if ((int)sub_1000B3680(a1, L"=", 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v312 = sub_1000B3680(a1, L"=", 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v313 = v401[0];
                        if (v312 <= 0) {
                          int v313 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v313,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      goto LABEL_376;
                    case '?':
                      v274 = a1;
                      v275 = v261;
                      goto LABEL_378;
                    case '@':
                      uint64_t v111 = (uint64_t)v261;
                      if ((int)sub_1000B3680(a1, word_1000F1434, 1LL, 1LL, 0LL, 30, (uint64_t)v401) < 1)
                      {
                        int v316 = sub_1000B3680(a1, word_1000F1434, 0LL, 1LL, 0LL, 30, (uint64_t)v401);
                        int v317 = v401[0];
                        if (v316 <= 0) {
                          int v317 = -1;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v317,  *v272,  1,  0,  0);
                      }

                      else
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v401[0],  *v272,  1,  0,  1);
                      }

                      ++v389;
                      v262 = v368;
                      goto LABEL_319;
                    default:
                      goto LABEL_320;
                  }

                  do
                  {
                    if ((int)v298 < 1)
                    {
                      int v301 = -1;
                      goto LABEL_355;
                    }

                    uint64_t v299 = v298 - 1;
                    sub_1000B33F8((char *)a1, v401[v298 - 1], (uint64_t)v284, v293);
                    int v300 = sub_1000CCE90(v293, (unsigned __int16 *)v403);
                    uint64_t v298 = v299;
                  }

                  while (v300);
                  int v301 = v401[v299];
LABEL_355:
                  sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v301,  *v272,  0,  0,  1);
                  ++v389;
                  int v302 = sub_1000B3288(a1);
                  sub_1000CB038(v293, 2LL * (v302 + 1));
                  int v303 = sub_1000B324C(a1);
                  sub_1000CB038(v284, 2LL * (v303 + 1));
LABEL_376:
                  v261 = L"?";
                  v262 = v368;
                  break;
                case 2:
                  v389 += sub_1000B8998( a1,  (uint64_t)&v390[v398[7 * v260 + 1]],  v398[7 * v260 + 1],  v398[7 * v260 + 2],  a3,  v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  0);
                  break;
              }

LABEL_266:
                    int v235 = *v229;
                    int v236 = *v217;
LABEL_267:
                    sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v235,  v236,  1,  0,  1);
LABEL_294:
                    ++v200;
                    goto LABEL_192;
                  }
                }

                uint64_t v59 = *(void *)(v367 + 160);
                if (v59)
                {
                  v229 = v384;
                  v230 = a1;
                  v231 = *(_WORD **)(v367 + 160);
                  goto LABEL_283;
                }
              }

              else
              {
                uint64_t v59 = *(void *)(v367 + 192);
                if (!v59) {
                  goto LABEL_248;
                }
                if (sub_1000CD450(&v390[v116[7 * v199 + 1]], (unsigned __int16 *)v59, v225))
                {
                  int v225 = *v213;
LABEL_248:
                  if (v225 >= 1)
                  {
                    uint64_t v237 = 0LL;
                    v238 = &v116[7 * v199 + 1];
                    do
                    {
                      v401[0] = (unsigned __int16)v390[v237 + *v238];
                      if ((int)sub_1000B3680(a1, v401, 1LL, 1LL, 0LL, 30, (uint64_t)v384) >= 1)
                      {
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  *v384,  v237 + *v238,  1,  0,  1);
                      }

                      else
                      {
                        else {
                          int v239 = *v384;
                        }
                        sub_1000B8938( v380,  (uint64_t)a5,  v376,  (uint64_t)a7,  0LL,  (uint64_t)a9,  (int *)&v400 + 1,  a3,  v239,  v237 + *v238,  1,  0,  0);
                      }

                      ++v237;
                    }

                    while ((int)v237 < *v213);
                    v200 += v237;
                  }
                }
              }
            }
          }
        }

          uint64_t v341 = v478[0];
          if (v341 < (int)v458)
          {
            a7[v341] = -1;
            if (v448) {
              v448[v341] = v340;
            }
            if (a9) {
              *(_DWORD *)&a9[4 * v341] = v339;
            }
            if (a11) {
              a11[v341] = v338;
            }
          }

          v478[0] = v341 + 1;
          uint64_t v287 = 1;
          goto LABEL_214;
        }

        break;
      }

      int v178 = 0LL;
LABEL_397:
      sub_1000CB038((void *)v472, 120LL);
      sub_1000CB038(v469, v426);
      sub_1000CB038(v475, v427);
      uint64_t v246 = v428;
      int v241 = v430;
LABEL_402:
      sub_1000CB038(v241, v246);
      return v178;
    case 4:
      uint64_t v16 = a1;
      if (!a1[7]) {
        goto LABEL_19;
      }
      return sub_1000AA40C(a1, (__int16 *)a3, a4, a6, a7, a8, a9, a10, a11);
    case 5:
    case 6:
    case 7:
      uint64_t v16 = a1;
      if (a1[7]) {
        return sub_1000A44B0(a1, (__int16 *)a3, a4, a6, a7, a8, a9, a10, a11);
      }
LABEL_19:
      v479 = a10;
      v480 = a11;
      return sub_1000B7548(v16, a3, a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9, v479, (uint64_t)v480);
    case 8:
      uint64_t v39 = a1;
      uint64_t v40 = a3;
      uint64_t v41 = 0;
      return sub_1000B7CC8(v39, v40, v41, a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9, a10, (uint64_t)a11);
    case 9:
      uint64_t v39 = a1;
      uint64_t v40 = a3;
      uint64_t v41 = 1;
      return sub_1000B7CC8(v39, v40, v41, a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9, a10, (uint64_t)a11);
    case 10:
      v456 = a4;
      *a7 = -1;
      uint64_t v42 = (int)a6;
      if (a10) {
        bzero(a10, (int)a6);
      }
      uint64_t v43 = sub_1000CC52C(a3);
      int v44 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
      uint64_t v45 = sub_100082BA4(*a1);
      if (v45 <= v44) {
        uint64_t v46 = v44;
      }
      else {
        uint64_t v46 = v45;
      }
      if (v46 <= v43) {
        uint64_t v46 = v43;
      }
      uint64_t v47 = v46 + 1;
      uint64_t v48 = sub_10003982C(*a1) + 1;
      v441 = 2LL * v47;
      uint64_t v56 = (_WORD *)sub_1000CAF58(v441, v49, v50, v51, v52, v53, v54, v55);
      v438 = 2LL * v48;
      v473 = (_WORD *)sub_1000CAF58(v438, v57, v58, v59, v60, v61, v62, v63);
      uint64_t v71 = sub_1000CAF58(120LL, v64, v65, v66, v67, v68, v69, v70);
      v435 = 4 * v42;
      v460 = sub_1000CAF58(4 * v42, v72, v73, v74, v75, v76, v77, v78);
      uint64_t v79 = 0;
      v464 = 0;
      v450 = -(uint64_t)a3;
      uint64_t v80 = v458;
      while (2)
      {
        uint64_t v81 = a3 - 2;
        uint64_t v82 = (char *)(a3 - 2);
        do
        {
          uint64_t v83 = *((unsigned __int16 *)v82 + 1);
          v82 += 2;
          v81 += 2LL;
        }

        while (sub_1000CBA60(v83));
        if (*(_WORD *)v82)
        {
          v470 = sub_1000CB108(*(unsigned __int16 *)v82, 0);
          uint64_t v84 = *(_WORD *)v82;
          int v85 = v82;
          if (*(_WORD *)v82)
          {
            int v85 = v82;
            do
            {
              uint64_t v86 = *((unsigned __int16 *)v85 + 1);
              v85 += 2;
              uint64_t v84 = v86;
            }

            while (v86);
          }

          uint64_t v87 = 0LL;
          uint64_t v88 = (unint64_t)&v85[-v81] >> 1;
          v467 = v79;
          do
          {
            int v89 = *(unsigned __int16 *)&v82[v87];
            if (!*(_WORD *)&v82[v87]) {
              goto LABEL_65;
            }
            v87 += 2LL;
          }

          while (sub_1000CBA60(v89));
          uint64_t v97 = sub_1000CAF58(120LL, v90, v91, v92, v93, v94, v95, v96);
          uint64_t v98 = sub_100082BB4(*a1, a5, (unint64_t)&v85[-v81] >> 1, v82, v97, 30LL, 0LL);
          if (v98 < 1)
          {
            if (v97)
            {
              sub_1000CB038((void *)v97, 120LL);
LABEL_65:
              LOBYTE(v97) = 0;
            }

            uint64_t v111 = 0;
            v113 = -1;
LABEL_67:
            uint64_t v80 = v458;
            else {
              uint64_t v117 = 0;
            }
            if (v117 < (int)v458)
            {
              a7[v117] = v113;
              if (v448) {
                v448[v117] = (v450 + v81) >> 1;
              }
              if (a9) {
                *(_DWORD *)&a9[4 * v117] = v88;
              }
              if (v460) {
                *(_DWORD *)(v460 + 4LL * v117) = v111;
              }
              if (a11) {
                a11[v117] = v97;
              }
            }

            uint64_t v79 = v117 + 1;
            ++v464;
            a3 = (unint64_t)&v82[2 * (int)v88];
            continue;
          }

          int v99 = v98;
          uint64_t v100 = 0LL;
          if (v98 >= 30) {
            uint64_t v101 = 30LL;
          }
          else {
            uint64_t v101 = v98;
          }
          uint64_t v100 = v101 & 0x18;
          *(void *)&int v102 = __PAIR64__(HIDWORD(*(void *)v97), *(_OWORD *)v97) | 0xC0000000C0000000LL;
          DWORD2(v102) = *(void *)(v97 + 8) | 0xC0000000;
          HIDWORD(v102) = HIDWORD(*(_OWORD *)v97) | 0xC0000000;
          uint64_t v103 = *(_OWORD *)(v97 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
          *(_OWORD *)uint64_t v71 = v102;
          *(_OWORD *)(v71 + 16) = v103;
          if ((v101 & 0xFFFFFFF8) != 8)
          {
            uint64_t v104 = *(_OWORD *)(v97 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v71 + 32) = *(_OWORD *)(v97 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v71 + 48) = v104;
            if (v100 != 16)
            {
              int v105 = *(_OWORD *)(v97 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v71 + 64) = *(_OWORD *)(v97 + 64) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v71 + 80) = v105;
            }
          }

          if (v100 != v101)
          {
LABEL_53:
            int v106 = v101 - v100;
            int v107 = 4 * v100;
            int v108 = (unsigned int *)(v71 + 4 * v100);
            int v109 = (int *)(v97 + v107);
            do
            {
              uint64_t v110 = *v109++;
              *v108++ = v110 | 0xC0000000;
              --v106;
            }

            while (v106);
          }

          sub_1000CB038((void *)v97, 120LL);
          if (v99 != 30)
          {
            uint64_t v111 = 0;
            LODWORD(v97) = 0;
            uint64_t v112 = v99 + 1LL;
            v113 = -1;
            do
            {
              int v114 = (v112 - 2);
              sub_1000B33F8((char *)a1, *(_DWORD *)(v71 + 4LL * v114), (uint64_t)v56, v473);
              if (sub_1000CC52C((unint64_t)v56) == (_DWORD)v88)
              {
                int v115 = sub_1000CD3EC(v82, v56, v88);
                if (v113 == -1 || !(v97 | v115))
                {
                  LODWORD(v97) = v115 == 0;
                  v113 = *(_DWORD *)(v71 + 4 * v114);
                  uint64_t v111 = v470;
                }
              }

              --v112;
            }

            while (v112 > 1);
            goto LABEL_67;
          }

          int v178 = 0LL;
          v221 = (uint64_t)v448;
          BOOL v222 = (uint64_t)a9;
          int v223 = a11;
          v224 = v456;
          v226 = v438;
          int v225 = v441;
          uint64_t v227 = v435;
          v228 = (void *)v460;
          uint64_t v79 = v467;
        }

        else
        {
          v221 = (uint64_t)v448;
          BOOL v222 = (uint64_t)a9;
          int v223 = a11;
          v224 = v456;
          int v178 = v464;
          v226 = v438;
          int v225 = v441;
          uint64_t v227 = v435;
          v228 = (void *)v460;
          if (v464 <= (int)v80)
          {
LABEL_178:
            if (a10)
            {
              int v242 = (int)v178 >= (int)v80 ? v80 : v178;
              if ((int)v242 >= 2)
              {
                int v243 = v242 - 1;
                int v244 = a10 + 1;
                v245 = (_DWORD *)v228 + 1;
                do
                {
                  if (*(v245 - 1) != *v245) {
                    *v244 |= 8u;
                  }
                  ++v245;
                  ++v244;
                  --v243;
                }

                while (v243);
              }
            }

            sub_1000CB038(v228, v227);
            sub_1000CB038((void *)v71, 120LL);
            sub_1000CB038(v473, v226);
            int v241 = v56;
LABEL_188:
            uint64_t v246 = v225;
            goto LABEL_402;
          }
        }

        break;
      }

      if (v224 && v79 < (int)v80)
      {
        sub_1000B8B64(v80, (uint64_t)a7, v221, v222, v460, (uint64_t)v223, v79);
        v228 = (void *)v460;
      }

      goto LABEL_178;
    case 11:
      *a7 = -1;
      if (a10) {
        bzero(a10, (int)a6);
      }
      v457 = a4;
      v118 = sub_1000CC52C(a3);
      unsigned int v119 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
      int v120 = sub_100082BA4(*a1);
      if (v120 <= v119) {
        v121 = v119;
      }
      else {
        v121 = v120;
      }
      if (v121 <= v118) {
        v121 = v118;
      }
      v439 = v121 + 1;
      int v129 = sub_10003982C(*a1);
      unint64_t v130 = v118;
      if (v129 > v118) {
        unint64_t v130 = sub_10003982C(*a1);
      }
      uint64_t v131 = v130 + 1;
      v132 = (_WORD *)sub_1000CAF58(2LL * v439, v122, v123, v124, v125, v126, v127, v128);
      v433 = v131;
      uint64_t v133 = 2LL * v131;
      v474 = (_WORD *)sub_1000CAF58(v133, v134, v135, v136, v137, v138, v139, v140);
      uint64_t v148 = (char *)sub_1000CAF58(2LL * v439, v141, v142, v143, v144, v145, v146, v147);
      v425 = v133;
      v468 = (_WORD *)sub_1000CAF58(v133, v149, v150, v151, v152, v153, v154, v155);
      v423 = 2LL * (v118 + 1);
      v436 = (_WORD *)sub_1000CAF58(v423, v156, v157, v158, v159, v160, v161, v162);
      v471 = sub_1000CAF58(120LL, v163, v164, v165, v166, v167, v168, v169);
      v421 = 4LL * (int)a6;
      uint64_t v177 = 0;
      int v178 = 0LL;
      v429 = -(uint64_t)a3;
      v431 = sub_1000CAF58(v421, v170, v171, v172, v173, v174, v175, v176);
      v461 = v148;
      while (2)
      {
        int v179 = a3 - 2;
        int v180 = (__int16 *)(a3 - 2);
        do
        {
          int v181 = (unsigned __int16)v180[1];
          ++v180;
          v179 += 2LL;
        }

        while (sub_1000CBA60(v181));
        if (!*v180)
        {
          v229 = (uint64_t)v448;
          v230 = (uint64_t)a9;
          v231 = a11;
          v232 = v457;
          v233 = v425;
          int v225 = 2LL * v439;
          int v235 = v421;
          uint64_t v234 = v423;
          int v236 = (void *)v431;
          goto LABEL_159;
        }

        v451 = sub_1000CB108((unsigned __int16)*v180, 0);
        uint64_t v182 = *v180;
        a3 = (unint64_t)v180;
        if (*v180)
        {
          a3 = (unint64_t)v180;
          do
          {
            uint64_t v183 = *(unsigned __int16 *)(a3 + 2);
            a3 += 2LL;
            uint64_t v182 = v183;
          }

          while (v183);
        }

        int v184 = (a3 - v179) >> 1;
        sub_1000CC548(v436, v180, v184 + 1);
        v436[(int)v184] = 0;
        v442 = v177;
        uint64_t v185 = sub_1000CC52C((unint64_t)v148);
        v465 = v178;
        if (v148)
        {
          int v186 = v148;
          do
          {
            int v187 = *(unsigned __int16 *)v186;
            if (!*(_WORD *)v186) {
              goto LABEL_119;
            }
            v186 += 2;
          }

          while (sub_1000CBA60(v187));
          v195 = sub_1000CAF58(120LL, v188, v189, v190, v191, v192, v193, v194);
          int v196 = sub_100082BB4(*a1, a5, v185, v148, v195, 30LL, 0LL);
          if (v196 >= 1)
          {
            v197 = v196;
            uint64_t v198 = 0LL;
            if (v196 >= 30) {
              uint64_t v199 = 30LL;
            }
            else {
              uint64_t v199 = v196;
            }
            if (v199 < 8)
            {
              int v200 = v471;
            }

            else
            {
              int v200 = v471;
              if (v471 - v195 >= 0x20)
              {
                uint64_t v198 = v199 & 0x18;
                *(void *)&int v201 = __PAIR64__(HIDWORD(*(void *)v195), *(_OWORD *)v195) | 0xC0000000C0000000LL;
                DWORD2(v201) = *(void *)(v195 + 8) | 0xC0000000;
                HIDWORD(v201) = HIDWORD(*(_OWORD *)v195) | 0xC0000000;
                v202 = *(_OWORD *)(v195 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                *(_OWORD *)v471 = v201;
                *(_OWORD *)(v471 + 16) = v202;
                if ((v199 & 0xFFFFFFF8) != 8)
                {
                  int v203 = *(_OWORD *)(v195 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                  *(_OWORD *)(v471 + 32) = *(_OWORD *)(v195 + 32) | __PAIR128__( 0xC0000000C0000000LL,  0xC0000000C0000000LL);
                  *(_OWORD *)(v471 + 48) = v203;
                  if (v198 != 16)
                  {
                    int v204 = *(_OWORD *)(v195 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                    *(_OWORD *)(v471 + 64) = *(_OWORD *)(v195 + 64) | __PAIR128__( 0xC0000000C0000000LL,  0xC0000000C0000000LL);
                    *(_OWORD *)(v471 + 80) = v204;
                  }
                }

                if (v198 == v199)
                {
LABEL_139:
                  sub_1000CB038((void *)v195, 120LL);
                  if (v197 != 30)
                  {
                    LODWORD(v148) = 0;
                    uint64_t v205 = 0;
                    int v214 = v197 + 1LL;
                    v206 = -1;
                    v215 = (char *)a1;
                    v216 = v471;
                    do
                    {
                      v217 = (v214 - 2);
                      sub_1000B33F8(v215, *(_DWORD *)(v216 + 4LL * v217), (uint64_t)v132, v474);
                      if (sub_1000CC52C((unint64_t)v132) == (_DWORD)v185)
                      {
                        uint64_t v218 = sub_1000CCE40(v461, v132);
                        if (*v468) {
                          v219 = sub_1000CCE40(v468, v474) == 0;
                        }
                        else {
                          v219 = 1;
                        }
                        v216 = v471;
                        if (v218) {
                          v219 = 0;
                        }
                        int v220 = !v205 && v219;
                        v215 = (char *)a1;
                        if (v206 == -1 || v220)
                        {
                          v206 = *(_DWORD *)(v471 + 4 * v217);
                          uint64_t v205 = v219;
                          LODWORD(v148) = v451;
                        }
                      }

                      else
                      {
                        v216 = v471;
                      }

                      --v214;
                    }

                    while (v214 > 1);
                    goto LABEL_121;
                  }

                  int v178 = 0LL;
                  v229 = (uint64_t)v448;
                  v230 = (uint64_t)a9;
                  a6 = v458;
                  v231 = a11;
                  v232 = v457;
                  v233 = v425;
                  int v225 = 2LL * v439;
                  int v235 = v421;
                  uint64_t v234 = v423;
                  int v236 = (void *)v431;
                  uint64_t v177 = v442;
                  if ((int)v458 >= 0)
                  {
LABEL_162:
                    if (a10)
                    {
                      uint64_t v237 = (int)v178 >= (int)a6 ? a6 : v178;
                      if ((int)v237 >= 2)
                      {
                        v238 = v237 - 1;
                        int v239 = a10 + 1;
                        int v240 = (_DWORD *)v236 + 1;
                        do
                        {
                          if (*(v240 - 1) != *v240) {
                            *v239 |= 8u;
                          }
                          ++v240;
                          ++v239;
                          --v238;
                        }

                        while (v238);
                      }
                    }

                    sub_1000CB038(v236, v235);
                    sub_1000CB038((void *)v471, 120LL);
                    sub_1000CB038(v436, v234);
                    sub_1000CB038(v468, v233);
                    sub_1000CB038(v148, v225);
                    sub_1000CB038(v474, v233);
                    int v241 = v132;
                    goto LABEL_188;
                  }

LABEL_192:
        ++v199;
        uint64_t v198 = *v397;
        if (v199 >= v198) {
          goto LABEL_462;
        }
      }
    }

    int v392 = 0;
    HIDWORD(v400) = 0;
LABEL_485:
    uint64_t v112 = v392;
    sub_1000CB038(v384, 120LL);
    int v358 = sub_1000B3288(a1);
    sub_1000CB038(v382, 2LL * (v358 + 1));
    int v359 = sub_1000B324C(a1);
    sub_1000CB038(v383, 2LL * (v359 + 1));
    sub_1000CB038(v390, v364);
    sub_1000CB038(v23, 28LL * (v366 + 1));
  }

  else
  {
    sub_1000CB038(v35, 2LL * v26);
    return 0LL;
  }

  return v112;
}

uint64_t sub_1000AD4C8(unint64_t a1, unsigned int a2, _DWORD *a3, uint64_t a4, int a5, void *a6)
{
  int v10 = sub_1000CC52C(a1);
  int v11 = v10 & (v10 >> 31);
  uint64_t v12 = (unsigned __int16 *)(a1 + 2LL * v10 - 2);
  int v13 = v10;
  int v14 = v10;
  while (1)
  {
    BOOL v15 = __OFSUB__(v14--, 1);
    if (v14 < 0 != v15) {
      break;
    }
    int v16 = *v12--;
    if (v16 != 32)
    {
      int v11 = v14 + 1;
      break;
    }
  }

  uint64_t v17 = 0LL;
  int v145 = 0;
  uint64_t v18 = " - ep";
  do
  {
    int v19 = sub_1000C88E4((unint64_t)v18);
    if (v19 >= 1)
    {
      uint64_t v27 = v19;
      int v28 = v11;
      while (1)
      {
        unint64_t v29 = (v28 - 1);
        if (v28 < 1) {
          goto LABEL_9;
        }
        int v30 = v18[(v27 - 1)];
        unsigned __int16 v31 = (v30 - 97) >= 0x1A ? v18[(v27 - 1)] : v30 ^ 0x20;
        int v32 = *(unsigned __int16 *)(a1 + 2LL * v29);
        if (v28 >= 2)
        {
          --v28;
          if (v30 != 32) {
            goto LABEL_13;
          }
          while (*(_WORD *)(a1 - 2 + 2 * v29) == 32)
          {
            if (v29-- <= 1)
            {
              int v28 = 0;
              goto LABEL_13;
            }
          }
        }

        int v28 = v29;
LABEL_13:
        BOOL v95 = v27-- <= 1;
        if (v95)
        {
          int v19 = 0;
          if (v28 < 1) {
            goto LABEL_9;
          }
          goto LABEL_28;
        }
      }
    }

    int v28 = v11;
    if (v11 >= 1)
    {
LABEL_28:
      if (!v19)
      {
        if ((int)a2 >= 1 && *(_DWORD *)(a4 + 4LL * a2 - 4) > v28)
        {
          if (a2 < 2)
          {
            a2 = 0;
          }

          else
          {
            uint64_t v33 = a2;
            while (*(_DWORD *)(a4 + 4LL * (v33 - 2)) > v28)
            {
              if ((unint64_t)--v33 < 2)
              {
                int v145 = 1;
                a2 = 0;
                goto LABEL_8;
              }
            }

            a2 = v33 - 1;
          }

          int v145 = 1;
        }

uint64_t sub_1000ADD14(uint64_t a1)
{
  v2 = *(signed int **)a1;
  if (v2)
  {
    unsigned int v3 = sub_100093B40(v2);
    uint64_t v4 = sub_1000BE644(v3, 4, 0xFFFFFFFF);
    v5 = *(unint64_t **)(a1 + 16);
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v4 = 0xFFFFFFFFLL;
  v5 = *(unint64_t **)(a1 + 16);
  if (v5)
  {
LABEL_3:
    int v6 = sub_1000CC52C((unint64_t)v5);
    uint64_t v4 = sub_1000BE770(v5, 2, v6 + 1, v4);
  }

uint64_t sub_1000AE0DC( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v10 = sub_1000BCAE8(a1, "btn0", a2, a4, a5, a6, a7, a8);
  if (!v10) {
    return 0LL;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = sub_1000C1074(232LL);
  uint64_t v13 = v12;
  if (v12)
  {
    if (sub_1000BD0DC(v11, (uint64_t *)(v12 + 24)))
    {
      *(void *)(v13 + 16) = *(void *)(v13 + 24);
      if (sub_1000BD0DC(v11, (uint64_t *)(v13 + 40)))
      {
        *(void *)(v13 + 32) = *(void *)(v13 + 40);
        if (sub_1000BD0DC(v11, (uint64_t *)(v13 + 56)))
        {
          *(void *)(v13 + 48) = *(void *)(v13 + 56);
          if (sub_1000BD0DC(v11, (uint64_t *)(v13 + 72)))
          {
            *(void *)(v13 + 64) = *(void *)(v13 + 72);
            if (sub_1000BD0DC(v11, (uint64_t *)(v13 + 88)))
            {
              *(void *)(v13 + 80) = *(void *)(v13 + 88);
              if (sub_1000BCD38(v11, (void *)(v13 + 96))
                && sub_1000BCD38(v11, (void *)(v13 + 120))
                && sub_1000BCD38(v11, (void *)(v13 + 144))
                && sub_1000BCD38(v11, (void *)(v13 + 168))
                && sub_1000BCD38(v11, (void *)(v13 + 192)))
              {
                uint64_t v21 = *(unsigned int *)(v13 + 96);
                if ((int)v21 >= 1)
                {
                  sub_1000C0BFC(16 * v21, v14, v15, v16, v17, v18, v19, v20);
                  *(void *)(v13 + 112) = v22;
                  if (*(int *)(v13 + 96) >= 1)
                  {
                    uint64_t v23 = 0LL;
                    uint64_t v24 = 0LL;
                    do
                    {
                      *(void *)(*(void *)(v13 + 112) + v23) = *(void *)(*(void *)(v13 + 112) + v23 + 8);
                      ++v24;
                      v23 += 16LL;
                    }

                    while (v24 < *(int *)(v13 + 96));
                    uint64_t v22 = *(void *)(v13 + 112);
                  }

                  *(void *)(v13 + 104) = v22;
                }

                uint64_t v25 = *(unsigned int *)(v13 + 120);
                if ((int)v25 >= 1)
                {
                  sub_1000C0BFC(32 * v25, v14, v15, v16, v17, v18, v19, v20);
                  *(void *)(v13 + 136) = v26;
                  if (*(int *)(v13 + 120) >= 1)
                  {
                    uint64_t v27 = 0LL;
                    uint64_t v28 = 0LL;
                    do
                    {
                      *(void *)(*(void *)(v13 + 136) + v27) = *(void *)(*(void *)(v13 + 136) + v27 + 8);
                      *(void *)(*(void *)(v13 + 136) + v27 + 16) = *(void *)(*(void *)(v13 + 136) + v27 + 24);
                      ++v28;
                      v27 += 32LL;
                    }

                    while (v28 < *(int *)(v13 + 120));
                    uint64_t v26 = *(void *)(v13 + 136);
                  }

                  *(void *)(v13 + 128) = v26;
                }

                uint64_t v29 = *(unsigned int *)(v13 + 144);
                if ((int)v29 >= 1)
                {
                  sub_1000C0BFC(32 * v29, v14, v15, v16, v17, v18, v19, v20);
                  *(void *)(v13 + 160) = v30;
                  if (*(int *)(v13 + 144) >= 1)
                  {
                    uint64_t v31 = 0LL;
                    uint64_t v32 = 0LL;
                    do
                    {
                      *(void *)(*(void *)(v13 + 160) + v31) = *(void *)(*(void *)(v13 + 160) + v31 + 8);
                      *(void *)(*(void *)(v13 + 160) + v31 + 16) = *(void *)(*(void *)(v13 + 160) + v31 + 24);
                      ++v32;
                      v31 += 32LL;
                    }

                    while (v32 < *(int *)(v13 + 144));
                    uint64_t v30 = *(void *)(v13 + 160);
                  }

                  *(void *)(v13 + 152) = v30;
                }

                uint64_t v33 = *(unsigned int *)(v13 + 168);
                if ((int)v33 >= 1)
                {
                  sub_1000C0BFC(32 * v33, v14, v15, v16, v17, v18, v19, v20);
                  *(void *)(v13 + 184) = v34;
                  if (*(int *)(v13 + 168) >= 1)
                  {
                    uint64_t v35 = 0LL;
                    uint64_t v36 = 0LL;
                    do
                    {
                      *(void *)(*(void *)(v13 + 184) + v35) = *(void *)(*(void *)(v13 + 184) + v35 + 8);
                      *(void *)(*(void *)(v13 + 184) + v35 + 16) = *(void *)(*(void *)(v13 + 184) + v35 + 24);
                      ++v36;
                      v35 += 32LL;
                    }

                    while (v36 < *(int *)(v13 + 168));
                    uint64_t v34 = *(void *)(v13 + 184);
                  }

                  *(void *)(v13 + 176) = v34;
                }

                uint64_t v37 = *(unsigned int *)(v13 + 192);
                if ((int)v37 >= 1)
                {
                  sub_1000C0BFC(32 * v37, v14, v15, v16, v17, v18, v19, v20);
                  *(void *)(v13 + 208) = v38;
                  if (*(int *)(v13 + 192) >= 1)
                  {
                    uint64_t v39 = 0LL;
                    uint64_t v40 = 0LL;
                    do
                    {
                      *(void *)(*(void *)(v13 + 208) + v39) = *(void *)(*(void *)(v13 + 208) + v39 + 8);
                      *(void *)(*(void *)(v13 + 208) + v39 + 16) = *(void *)(*(void *)(v13 + 208) + v39 + 24);
                      ++v40;
                      v39 += 32LL;
                    }

                    while (v40 < *(int *)(v13 + 192));
                    uint64_t v38 = *(void *)(v13 + 208);
                  }

                  *(void *)(v13 + 200) = v38;
                }

                sub_1000C0BFC(0x228uLL, v14, v15, v16, v17, v18, v19, v20);
                uint64_t v42 = v41;
                *(void *)(v13 + 224) = v41;
                if (sub_1000BD0DC(v11, (uint64_t *)(v41 + 8)))
                {
                  *(void *)uint64_t v42 = *(void *)(v42 + 8);
                  if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 24)))
                  {
                    *(void *)(v42 + 16) = *(void *)(v42 + 24);
                    if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 40)))
                    {
                      *(void *)(v42 + 32) = *(void *)(v42 + 40);
                      if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 56)))
                      {
                        *(void *)(v42 + 48) = *(void *)(v42 + 56);
                        if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 72)))
                        {
                          *(void *)(v42 + 64) = *(void *)(v42 + 72);
                          if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 88)))
                          {
                            *(void *)(v42 + 80) = *(void *)(v42 + 88);
                            if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 104)))
                            {
                              *(void *)(v42 + 96) = *(void *)(v42 + 104);
                              if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 120)))
                              {
                                *(void *)(v42 + 112) = *(void *)(v42 + 120);
                                if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 136)))
                                {
                                  *(void *)(v42 + 128) = *(void *)(v42 + 136);
                                  if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 152)))
                                  {
                                    *(void *)(v42 + 144) = *(void *)(v42 + 152);
                                    if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 168)))
                                    {
                                      *(void *)(v42 + 160) = *(void *)(v42 + 168);
                                      if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 200)))
                                      {
                                        *(void *)(v42 + 192) = *(void *)(v42 + 200);
                                        if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 216)))
                                        {
                                          *(void *)(v42 + 208) = *(void *)(v42 + 216);
                                          if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 232)))
                                          {
                                            *(void *)(v42 + 224) = *(void *)(v42 + 232);
                                            if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 248)))
                                            {
                                              *(void *)(v42 + 240) = *(void *)(v42 + 248);
                                              if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 264)))
                                              {
                                                *(void *)(v42 + 256) = *(void *)(v42 + 264);
                                                if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 280)))
                                                {
                                                  *(void *)(v42 + 272) = *(void *)(v42 + 280);
                                                  if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 296)))
                                                  {
                                                    *(void *)(v42 + 288) = *(void *)(v42 + 296);
                                                    if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 312)))
                                                    {
                                                      *(void *)(v42 + 304) = *(void *)(v42 + 312);
                                                      if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 328)))
                                                      {
                                                        *(void *)(v42 + 320) = *(void *)(v42 + 328);
                                                        if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 344)))
                                                        {
                                                          *(void *)(v42 + 336) = *(void *)(v42 + 344);
                                                          if (sub_1000BD0DC(v11, (uint64_t *)(v42 + 360)))
                                                          {
                                                            *(void *)(v42 + 352) = *(void *)(v42 + 360);
                                                            if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 376)))
                                                            {
                                                              *(void *)(v42 + 368) = *(void *)(v42 + 376);
                                                              if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 392)))
                                                              {
                                                                *(void *)(v42 + 384) = *(void *)(v42 + 392);
                                                                if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 408)))
                                                                {
                                                                  *(void *)(v42 + 400) = *(void *)(v42 + 408);
                                                                  if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 424)))
                                                                  {
                                                                    *(void *)(v42 + 416) = *(void *)(v42 + 424);
                                                                    if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 440)))
                                                                    {
                                                                      *(void *)(v42 + 432) = *(void *)(v42 + 440);
                                                                      if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 456)))
                                                                      {
                                                                        *(void *)(v42 + 448) = *(void *)(v42 + 456);
                                                                        if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 472)))
                                                                        {
                                                                          *(void *)(v42 + 464) = *(void *)(v42 + 472);
                                                                          if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 488)))
                                                                          {
                                                                            *(void *)(v42 + 480) = *(void *)(v42 + 488);
                                                                            if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 504)))
                                                                            {
                                                                              *(void *)(v42 + 496) = *(void *)(v42 + 504);
                                                                              if (sub_1000BD0DC( v11,  (uint64_t *)(v42 + 520)))
                                                                              {
                                                                                *(void *)(v42 + 512) = *(void *)(v42 + 520);
                                                                                if (sub_1000BCCEC( v11,  (_DWORD *)(v42 + 528))
                                                                                  && sub_1000BCCEC( v11,  (_DWORD *)(v42 + 532))
                                                                                  && sub_1000BCCEC( v11,  (_DWORD *)(v42 + 536))
                                                                                  && sub_1000BCCEC( v11,  (_DWORD *)(v42 + 540)))
                                                                                {
                                                                                  sub_1000BCCEC( v11,  (_DWORD *)(v42 + 544));
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

    *(void *)(v13 + 216) = *(void *)(v13 + 224);
    sub_1000BCBC8(v11);
    uint64_t v49 = sub_100093C84(a1, a2, v43, v44, v45, v46, v47, v48);
    *(void *)uint64_t v13 = v49;
    *(void *)(v13 + 8) = v49;
  }

  else
  {
    sub_1000BCBC8(v11);
  }

  return v13;
}

uint64_t sub_1000AE884(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 136);
    if (v2)
    {
      if (*(int *)(v1 + 120) >= 1)
      {
        uint64_t v3 = 0LL;
        uint64_t v4 = 0LL;
        do
        {
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 128) + v3 + 8));
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 128) + v3 + 24));
          ++v4;
          v3 += 32LL;
        }

        while (v4 < *(int *)(v1 + 120));
        uint64_t v2 = *(void *)(v1 + 136);
      }

      sub_1000C0EF8(v2);
      *(void *)(v1 + 128) = 0LL;
    }

    uint64_t v5 = *(void *)(v1 + 112);
    if (v5)
    {
      if (*(int *)(v1 + 96) >= 1)
      {
        uint64_t v6 = 0LL;
        uint64_t v7 = 8LL;
        do
        {
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 112) + v7));
          ++v6;
          v7 += 16LL;
        }

        while (v6 < *(int *)(v1 + 96));
        uint64_t v5 = *(void *)(v1 + 112);
      }

      sub_1000C0EF8(v5);
      *(void *)(v1 + 104) = 0LL;
      *(void *)(v1 + 112) = 0LL;
    }

    uint64_t v8 = *(void *)(v1 + 160);
    if (v8)
    {
      if (*(int *)(v1 + 144) >= 1)
      {
        uint64_t v9 = 0LL;
        uint64_t v10 = 0LL;
        do
        {
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 160) + v9 + 8));
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 160) + v9 + 24));
          ++v10;
          v9 += 32LL;
        }

        while (v10 < *(int *)(v1 + 144));
        uint64_t v8 = *(void *)(v1 + 160);
      }

      sub_1000C0EF8(v8);
      *(void *)(v1 + 152) = 0LL;
      *(void *)(v1 + 160) = 0LL;
    }

    uint64_t v11 = *(void *)(v1 + 184);
    if (v11)
    {
      if (*(int *)(v1 + 168) >= 1)
      {
        uint64_t v12 = 0LL;
        uint64_t v13 = 0LL;
        do
        {
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 184) + v12 + 8));
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 184) + v12 + 24));
          ++v13;
          v12 += 32LL;
        }

        while (v13 < *(int *)(v1 + 168));
        uint64_t v11 = *(void *)(v1 + 184);
      }

      sub_1000C0EF8(v11);
      *(void *)(v1 + 176) = 0LL;
      *(void *)(v1 + 184) = 0LL;
    }

    uint64_t v14 = *(void *)(v1 + 208);
    if (v14)
    {
      if (*(int *)(v1 + 192) >= 1)
      {
        uint64_t v15 = 0LL;
        uint64_t v16 = 0LL;
        do
        {
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 208) + v15 + 8));
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 208) + v15 + 24));
          ++v16;
          v15 += 32LL;
        }

        while (v16 < *(int *)(v1 + 192));
        uint64_t v14 = *(void *)(v1 + 208);
      }

      sub_1000C0EF8(v14);
      *(void *)(v1 + 200) = 0LL;
    }

    sub_1000C0EF8(*(void *)(v1 + 24));
    sub_1000C0EF8(*(void *)(v1 + 40));
    sub_1000C0EF8(*(void *)(v1 + 56));
    sub_1000C0EF8(*(void *)(v1 + 88));
    sub_1000C0EF8(*(void *)(v1 + 72));
    uint64_t v17 = *(uint64_t **)(v1 + 224);
    if (v17)
    {
      sub_1000C0EF8(v17[1]);
      sub_1000C0EF8(v17[3]);
      sub_1000C0EF8(v17[5]);
      sub_1000C0EF8(v17[7]);
      sub_1000C0EF8(v17[9]);
      sub_1000C0EF8(v17[11]);
      sub_1000C0EF8(v17[13]);
      sub_1000C0EF8(v17[15]);
      sub_1000C0EF8(v17[17]);
      sub_1000C0EF8(v17[19]);
      sub_1000C0EF8(v17[21]);
      sub_1000C0EF8(v17[23]);
      sub_1000C0EF8(v17[25]);
      sub_1000C0EF8(v17[27]);
      sub_1000C0EF8(v17[29]);
      sub_1000C0EF8(v17[31]);
      sub_1000C0EF8(v17[33]);
      sub_1000C0EF8(v17[35]);
      sub_1000C0EF8(v17[37]);
      sub_1000C0EF8(v17[39]);
      sub_1000C0EF8(v17[41]);
      sub_1000C0EF8(v17[43]);
      sub_1000C0EF8(v17[45]);
      sub_1000C0EF8(v17[47]);
      sub_1000C0EF8(v17[49]);
      sub_1000C0EF8(v17[51]);
      sub_1000C0EF8(v17[53]);
      sub_1000C0EF8(v17[55]);
      sub_1000C0EF8(v17[57]);
      sub_1000C0EF8(v17[59]);
      sub_1000C0EF8(v17[61]);
      sub_1000C0EF8(v17[63]);
      sub_1000C0EF8(v17[65]);
      sub_1000C0EF8(*(void *)(v1 + 224));
      *(void *)(v1 + 224) = 0LL;
    }

    sub_100093EA4(*(int **)(v1 + 8));
    return sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t sub_1000AEBB8(uint64_t a1, int a2, uint64_t a3, int *a4)
{
  uint64_t v7 = *(void **)(a1 + 216);
  switch(a2)
  {
    case 1:
      if (*a4 == 2 && a4[2] == 1) {
        return *(_WORD *)(a3 + 2LL * a4[1]) == 48;
      }
      return 0LL;
    case 2:
      if (*a4 != 2 || a4[2] != 2) {
        return 0LL;
      }
      return *(_WORD *)(a3 + 2LL * a4[1]) == 48;
    case 3:
      if (*a4 != 2 || a4[2] != 1) {
        return 0LL;
      }
      int v8 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      return v8 == 49;
    case 4:
      if (*a4 != 2 || a4[2] != 3) {
        return 0LL;
      }
      uint64_t v9 = a4[1];
      unsigned int v10 = *(unsigned __int16 *)(a3 + 2 * v9);
      BOOL v11 = v10 > 0x39;
      uint64_t v12 = (1LL << v10) & 0x250000000000000LL;
      BOOL v13 = v11 || v12 == 0;
      int v8 = *(unsigned __int16 *)(a3 + 2LL * ((int)v9 + 2));
      return v8 == 49;
    case 5:
      if (*a4 != 2) {
        return 0LL;
      }
      int v14 = a4[2];
      return v14 == 1;
    case 6:
      return *a4 == 2 && a4[2] == 2;
    case 7:
      return *a4 == 2 && a4[2] == 3;
    case 8:
      return *a4 == 2 && a4[2] < 4;
    case 9:
      if (*a4 != 2) {
        return 0LL;
      }
      int v15 = a4[2];
      return v15 == 4;
    case 10:
      return *a4 == 2 && a4[2] < 7;
    case 11:
      return *a4 == 2 && a4[2] == 7;
    case 12:
      return *a4 == 2 && a4[2] > 6;
    case 13:
      return *a4 == 2 && a4[2] > 0;
    case 14:
      return *a4 == 4 || *a4 == 3 && *(unsigned __int16 *)(a3 + 2LL * a4[1]) - 48 >= 0xFFFFFFFD;
    case 15:
      if (*a4 != 3) {
        return 0LL;
      }
      int v16 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      uint64_t v17 = (unsigned __int16 *)v7[50];
      return v16 == *v17;
    case 16:
      if (*a4 == 3)
      {
        unsigned int v18 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
        BOOL v11 = v18 > 0x2D;
        uint64_t v19 = (1LL << v18) & 0x280800000000LL;
        if (!v11 && v19 != 0) {
          return 1LL;
        }
      }

      return 0LL;
    case 17:
      if (*a4 != 3) {
        return 0LL;
      }
      int v16 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      uint64_t v17 = (unsigned __int16 *)v7[52];
      return v16 == *v17;
    case 18:
      return *a4 == 3 && *(_WORD *)(a3 + 2LL * a4[1]) == 40;
    case 19:
      return *a4 == 3 && *(_WORD *)(a3 + 2LL * a4[1]) == 41;
    case 20:
      if (*a4 != 3) {
        return 0LL;
      }
      int v21 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      uint64_t result = 1LL;
      if (v21 != 36 && v21 != 164 && v21 != 8364) {
        return 0LL;
      }
      return result;
    case 21:
      if (*a4 != 1) {
        return 0LL;
      }
      int v24 = a4[2];
      if (v24 > 3) {
        return 0LL;
      }
      if (v24 < 1)
      {
        uint64_t v25 = 0LL;
      }

      else
      {
        uint64_t v25 = 0LL;
        do
        {
          v65[v25] = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v25 + a4[1])));
          ++v25;
        }

        while (v25 < a4[2]);
      }

      v65[v25] = 0;
      int v62 = "u";
      return !sub_1000CCE40(v65, v62);
    case 22:
      if (*a4 != 1) {
        return 0LL;
      }
      int v26 = a4[2];
      if (v26 > 31) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v26 + 1);
      uint64_t v27 = 0LL;
      uint64_t v28 = 0LL;
      while (sub_1000CCE90(*(_WORD **)(*(void *)(a1 + 104) + v27), v65))
      {
        ++v28;
        v27 += 16LL;
      }

      return 1LL;
    case 23:
      if (*a4 != 2) {
        return 0LL;
      }
      int v29 = a4[2];
      if (v29 > 2) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v29 + 1);
      if (a4[2] < 1) {
        goto LABEL_96;
      }
      uint64_t v30 = 0LL;
      while (1)
      {
        uint64_t result = sub_1000CBA3C(v65[v30]);
        if (!(_DWORD)result) {
          return result;
        }
        if (++v30 >= a4[2])
        {
LABEL_96:
          return 0LL;
        }
      }

    case 24:
      if (*a4 != 2) {
        return 0LL;
      }
      int v31 = a4[2];
      if (v31 > 2) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v31 + 1);
      if (a4[2] < 1) {
        goto LABEL_104;
      }
      uint64_t v32 = 0LL;
      while (1)
      {
        uint64_t result = sub_1000CBA3C(v65[v32]);
        if (!(_DWORD)result) {
          break;
        }
        if (++v32 >= a4[2])
        {
LABEL_104:
          return (int)sub_1000C26B0(v65) >= 1;
        }
      }

      return result;
    case 25:
      if (*a4 != 2) {
        return 0LL;
      }
      return ((a4[2] - 2) & 0xFFFFFFFD) == 0;
    case 26:
      if (*a4 != 2 || a4[2] != 4) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), 5);
      if (a4[2] < 1) {
        return (int)sub_1000C26B0(v65) <= 2010 && (int)sub_1000C26B0(v65) >= 1900;
      }
      uint64_t v33 = 0LL;
      while (1)
      {
        uint64_t result = sub_1000CBA3C(v65[v33]);
        if (!(_DWORD)result) {
          break;
        }
        if (++v33 >= a4[2]) {
          return (int)sub_1000C26B0(v65) <= 2010 && (int)sub_1000C26B0(v65) >= 1900;
        }
      }

      return result;
    case 27:
      if (*a4 != 1) {
        return 0LL;
      }
      int v34 = a4[2];
      if (v34 > 31) {
        return 0LL;
      }
      if (v34 < 1)
      {
        uint64_t v35 = 0LL;
      }

      else
      {
        uint64_t v35 = 0LL;
        do
        {
          v65[v35] = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v35 + a4[1])));
          ++v35;
        }

        while (v35 < a4[2]);
      }

      v65[v35] = 0;
      uint64_t result = (uint64_t)sub_1000CCD78(*(unsigned __int16 **)(a1 + 32), v65);
      if (!result) {
        return result;
      }
      uint64_t v63 = 0LL;
      uint64_t v64 = 0LL;
      while (sub_1000CCE90(v65, *(unsigned __int16 **)(*(void *)(a1 + 128) + v63))
           && sub_1000CCE90(v65, *(unsigned __int16 **)(*(void *)(a1 + 128) + v63 + 16)))
      {
        ++v64;
        v63 += 32LL;
      }

      return 1LL;
    case 28:
      return *a4 == 3 && (*(_WORD *)(a3 + 2LL * a4[1]) & 0xFFFD) == 0x2D;
    case 29:
      return *a4 == 3 && *(_WORD *)(a3 + 2LL * a4[1]) == 44;
    case 30:
      return *a4 == 3 && *(_WORD *)(a3 + 2LL * a4[1]) == 46;
    case 31:
      int v15 = *a4;
      return v15 == 4;
    case 32:
      if (*a4 != 2) {
        return 0LL;
      }
      int v36 = a4[2];
      if (v36 > 2) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v36 + 1);
      if (a4[2] < 1) {
        return (int)sub_1000C26B0(v65) < 25;
      }
      uint64_t v37 = 0LL;
      while (1)
      {
        uint64_t result = sub_1000CBA3C(v65[v37]);
        if (!(_DWORD)result) {
          break;
        }
        if (++v37 >= a4[2]) {
          return (int)sub_1000C26B0(v65) < 25;
        }
      }

      return result;
    case 33:
      if (*a4 != 2) {
        return 0LL;
      }
      int v38 = a4[2];
      if (v38 > 2) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v38 + 1);
      if (a4[2] < 1) {
        return (int)sub_1000C26B0(v65) < 61;
      }
      uint64_t v39 = 0LL;
      while (1)
      {
        uint64_t result = sub_1000CBA3C(v65[v39]);
        if (!(_DWORD)result) {
          break;
        }
        if (++v39 >= a4[2]) {
          return (int)sub_1000C26B0(v65) < 61;
        }
      }

      return result;
    case 34:
      if (*a4 != 2) {
        return 0LL;
      }
      int v40 = a4[2];
      if (v40 > 2) {
        return 0LL;
      }
      sub_1000CC548(v65, (__int16 *)(a3 + 2LL * a4[1]), v40 + 1);
      if (a4[2] < 1) {
        return (int)sub_1000C26B0(v65) < 61;
      }
      uint64_t v41 = 0LL;
      break;
    case 35:
      if (a4[2] != 1) {
        return 0LL;
      }
      uint64_t v42 = (unsigned __int16 *)v7[22];
      if (!v42) {
        return 0LL;
      }
      int v43 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      return sub_1000CC7E0(v42, v43) != 0;
    case 36:
      if (*a4 != 1) {
        return 0LL;
      }
      int v44 = a4[2];
      if (v44 > 2) {
        return 0LL;
      }
      if (v44 < 1)
      {
        uint64_t v45 = 0LL;
      }

      else
      {
        uint64_t v45 = 0LL;
        do
        {
          v65[v45] = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v45 + a4[1])));
          ++v45;
        }

        while (v45 < a4[2]);
      }

      v65[v45] = 0;
      int v62 = "p";
      return !sub_1000CCE40(v65, v62);
    case 37:
      return *a4 == 1
          && a4[2] == 1
          && (sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2LL * a4[1])) == 97
           || sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2LL * a4[1])) == 112);
    case 38:
      return *a4 == 1 && a4[2] == 1 && sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2LL * a4[1])) == 109;
    case 39:
      if (*a4 == 1)
      {
        uint64_t v46 = (unsigned __int16 *)v7[24];
        if (v46)
        {
        }
      }

      return 0LL;
    case 40:
      if ((*a4 | 2) != 3) {
        return 0LL;
      }
      int v47 = a4[2];
      if (v47 > 2) {
        return 0LL;
      }
      if (v47 < 1)
      {
        uint64_t v48 = 0LL;
      }

      else
      {
        uint64_t v48 = 0LL;
        do
        {
          v65[v48] = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v48 + a4[1])));
          ++v48;
        }

        while (v48 < a4[2]);
      }

      v65[v48] = 0;
      uint64_t v61 = *(unsigned __int16 **)(a1 + 16);
      return sub_1000CCD78(v61, v65) != 0;
    case 41:
      int v14 = *a4;
      return v14 == 1;
    case 42:
      if (*a4 != 3) {
        return 0LL;
      }
      int v43 = *(unsigned __int16 *)(a3 + 2LL * a4[1]);
      uint64_t v42 = L"$-_@&=;/#?:";
      return sub_1000CC7E0(v42, v43) != 0;
    case 43:
      if (*a4 != 1) {
        return 0LL;
      }
      int v49 = a4[2];
      if (v49 > 5) {
        return 0LL;
      }
      v65[0] = 95;
      if (v49 < 1)
      {
        LODWORD(v50) = 0;
      }

      else
      {
        uint64_t v50 = 0LL;
        do
        {
          uint64_t v51 = v50;
          unsigned __int16 v52 = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v50 + a4[1])));
          uint64_t v50 = v51 + 1;
          v65[v51 + 1] = v52;
        }

        while (v51 + 1 < a4[2]);
      }

      v65[(v50 + 1)] = 95;
      v65[(v50 + 2)] = 0;
      uint64_t v61 = *(unsigned __int16 **)(a1 + 64);
      return sub_1000CCD78(v61, v65) != 0;
    case 44:
      if (*a4 != 1) {
        return 0LL;
      }
      int v53 = a4[2];
      if (v53 > 5) {
        return 0LL;
      }
      v65[0] = 95;
      if (v53 < 1)
      {
        LODWORD(v54) = 0;
      }

      else
      {
        uint64_t v54 = 0LL;
        do
        {
          uint64_t v55 = v54;
          unsigned __int16 v56 = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (v54 + a4[1])));
          uint64_t v54 = v55 + 1;
          v65[v55 + 1] = v56;
        }

        while (v55 + 1 < a4[2]);
      }

      v65[(v54 + 1)] = 95;
      v65[(v54 + 2)] = 0;
      uint64_t v61 = *(unsigned __int16 **)(a1 + 80);
      return sub_1000CCD78(v61, v65) != 0;
    case 45:
      if (*a4 != 2 || a4[2] > 2) {
        return 0LL;
      }
      int v57 = sub_1000CC52C(a3 + 2LL * a4[1]);
      int v58 = a4[2] + 2;
      if (v58 >= v57) {
        uint64_t v59 = v57;
      }
      else {
        uint64_t v59 = v58;
      }
      v65[0] = 95;
      if ((int)v59 < 1)
      {
        LODWORD(v59) = 0;
      }

      else
      {
        for (uint64_t i = 0LL; i != v59; ++i)
          v65[i + 1] = sub_1000CB5E8(*(unsigned __int16 *)(a3 + 2 * (i + a4[1])));
      }

      v65[(v59 + 1)] = 95;
      v65[(v59 + 2)] = 0;
      uint64_t v61 = *(unsigned __int16 **)(a1 + 48);
      return sub_1000CCD78(v61, v65) != 0;
    default:
      return 0LL;
  }

  while (1)
  {
    uint64_t result = sub_1000CBA3C(v65[v41]);
    if (!(_DWORD)result) {
      break;
    }
    if (++v41 >= a4[2]) {
      return (int)sub_1000C26B0(v65) < 61;
    }
  }

  return result;
}

uint64_t sub_1000AF7E0( uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, int a8, unint64_t a9, int a10)
{
  int v16 = a1;
  uint64_t v17 = (unsigned __int16 *)a9;
  uint64_t v36 = a1[7];
  int v18 = sub_1000CC52C(a9);
  if (v18 < 1) {
    return 0LL;
  }
  int v19 = v18;
  uint64_t v37 = a6;
  int v38 = a7;
  int v40 = a8;
  uint64_t v20 = 0LL;
  int v22 = 1;
  while (1)
  {
    if (v19 == 2)
    {
      if ((_DWORD)v20 && !v22 && *v17 == 48 && v17[1] == 48) {
        return v20;
      }
      if ((int)sub_1000B3680(v16, v17, 1LL, 1LL, 0LL, 5, (uint64_t)v43) >= 1)
      {
        sub_1000B8938(a2, a3, a4, a5, 0LL, v37, v38, v40, v43[0], a10, 2, 0, 1);
        return (v20 + 1);
      }

      int v19 = 1;
      if (*v17 != 48 || v22)
      {
        __int16 v41 = *v17;
        __int16 v42 = 0;
        sub_1000B3680(v16, &v41, 1LL, 1LL, 0LL, 5, (uint64_t)v43);
        sub_1000B8938(a2, a3, a4, a5, 0LL, v37, v38, v40, v43[0], a10, 1, 0, 1);
        uint64_t v20 = (v20 + 1);
      }

      goto LABEL_4;
    }

    if (v19 != 3) {
      break;
    }
    int v23 = *v17;
    if (v23 == 49)
    {
      if (*(_DWORD *)(*(void *)(v36 + 216) + 540LL))
      {
        int v24 = v16;
        uint64_t v25 = a2;
        uint64_t v26 = a3;
        uint64_t v27 = a4;
        uint64_t v28 = a5;
        uint64_t v29 = v37;
        uint64_t v30 = v38;
      }

      else
      {
        int v31 = L"1";
        uint64_t v30 = v38;
LABEL_25:
        sub_1000B3680(v16, v31, 1LL, 1LL, 0LL, 5, (uint64_t)v43);
        uint64_t v32 = a2;
        uint64_t v33 = a3;
        uint64_t v34 = a4;
        int v24 = v16;
        uint64_t v25 = a2;
        uint64_t v26 = a3;
        uint64_t v27 = a4;
        uint64_t v28 = a5;
        uint64_t v29 = v37;
        sub_1000B8938(v32, v33, v34, a5, 0LL, v37, v30, v40, v43[0], a10, 1, 0, 1);
        LODWORD(v20) = v20 + 1;
      }

      sub_1000B3680(v24, *(_WORD **)(*(void *)(v36 + 216) + 48LL), 0LL, 1LL, 0LL, 5, (uint64_t)v43);
      sub_1000B8938(v25, v26, v27, v28, 0LL, v29, v30, v40, v43[0], a10 + 1, 0, 0, 0);
      int v22 = 0;
      uint64_t v20 = (v20 + 1);
      int v19 = 2;
      a4 = v27;
      a3 = v26;
      a2 = v25;
      int v16 = v24;
      goto LABEL_4;
    }

    if (v23 != 48)
    {
      __int16 v41 = *v17;
      __int16 v42 = 0;
      int v31 = &v41;
      uint64_t v30 = v38;
      goto LABEL_25;
    }

    if (v22)
    {
      int v22 = 1;
      sub_1000B3680(v16, L"0", 1LL, 1LL, 0LL, 5, (uint64_t)v43);
      sub_1000B8938(a2, a3, a4, a5, 0LL, v37, v38, v40, v43[0], a10, 1, 0, 1);
      uint64_t v20 = (v20 + 1);
    }

    int v19 = 2;
LABEL_4:
    ++v17;
    ++a10;
  }

  if (v19 != 1) {
    return 0LL;
  }
  sub_1000B3680(v16, v17, 1LL, 1LL, 0LL, 5, (uint64_t)v43);
  sub_1000B8938(a2, a3, a4, a5, 0LL, v37, v38, v40, v43[0], a10, 1, 0, 1);
  return (v20 + 1);
}

uint64_t sub_1000AFBD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000AFBF4(0LL, 0LL, a1, a2, a3, a4);
}

uint64_t sub_1000AFBF4(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12 = (void *)sub_1000C1074(33376LL);
  uint64_t v13 = (uint64_t)v12;
  if (v12)
  {
    if (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 1164)) {
      return 0LL;
    }
    memcpy(v12, &off_1000F9F18, 0x208uLL);
    *(void *)(v13 + 376) = a3;
    *(void *)(v13 + 384) = a4;
    if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 3304)) {
      a6 = ((_DWORD)a6 << (*(_DWORD *)(qword_1000FDCC0 + 1780) != 0));
    }
    *(_DWORD *)(v13 + 432) = a6;
    uint64_t v14 = sub_100038B44(a3, a4, 0LL, 0LL, a6, 3LL);
    *(void *)(v13 + 528) = v14;
    if (v14)
    {
      uint64_t v15 = sub_100038B44(a3, a4, 0LL, 0LL, a6, 3LL);
      *(void *)(v13 + 520) = v15;
      if (v15)
      {
        if (a1)
        {
          int v16 = sub_1000C88E4((unint64_t)a2) + 10;
          int v24 = (unsigned __int8 *)sub_1000CAFC0(v16, v17, v18, v19, v20, v21, v22, v23);
          *int v24 = 0;
          sub_1000C89F8(v24, a2, v16);
          sub_1000C89F8(v24, "dual", v16);
          *(void *)(v13 + 536) = sub_10003E468(a1, v24, a3, a4, a5, 0LL, a6);
          sub_1000CB038(v24, v16);
          uint64_t v25 = *(void *)(v13 + 536);
          if (!v25) {
            goto LABEL_17;
          }
        }

        else
        {
          uint64_t v25 = sub_100038B44(a3, a4, a5, 0LL, a6, 5LL);
          *(void *)(v13 + 536) = v25;
          if (!v25) {
            goto LABEL_17;
          }
        }

        sub_10003E020(v25, 0);
        uint64_t v26 = sub_1000045F4(a4);
        if (qword_1000FDCC0)
        {
          uint64_t v27 = sub_1000595C8(v26, *(unsigned int *)(qword_1000FDCC0 + 4056));
          *(void *)(v13 + 392) = v27;
          if (v27)
          {
LABEL_15:
            *(_DWORD *)(v13 + 400) = 1;
            return v13;
          }
        }

        else
        {
          uint64_t v28 = sub_1000595C8(v26, 0LL);
          *(void *)(v13 + 392) = v28;
          if (v28) {
            goto LABEL_15;
          }
        }
      }
    }

uint64_t sub_1000AFDF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 528);
  if (v4) {
    sub_100038D28(v4, a2);
  }
  uint64_t v5 = *(void *)(a1 + 520);
  if (v5) {
    sub_100038D28(v5, a2);
  }
  uint64_t v6 = *(void *)(a1 + 536);
  if (v6) {
    sub_100038D28(v6, a2);
  }
  if (*(int *)(a1 + 8756) >= 1)
  {
    uint64_t v7 = 0LL;
    do
      sub_10002613C(*(void *)(*(void *)(a1 + 8744) + 8 * v7++));
    while (v7 < *(int *)(a1 + 8756));
  }

  *(_DWORD *)(a1 + 8756) = 0;
  sub_1000C0EF8(*(void *)(a1 + 8744));
  if (*(_DWORD *)(a1 + 400)) {
    sub_100059670(*(void *)(a1 + 392));
  }
  *(void *)(a1 + 392) = 0LL;
  return sub_1000C0EF8(a1);
}

BOOL sub_1000AFEA0(uint64_t *a1, uint64_t a2, char *a3)
{
  int v5 = sub_1000C88E4((unint64_t)a3) + 10;
  uint64_t v13 = (_BYTE *)sub_1000CAF58(v5, v6, v7, v8, v9, v10, v11, v12);
  bzero(v13, v5);
  sub_1000C896C(v13, a3, v5);
  sub_1000C89F8(v13, "dtg/", v5);
  int v14 = sub_100038EC8(a1[65]);
  sub_1000C896C(v13, a3, v5);
  sub_1000C89F8(v13, "dtl/", v5);
  int v15 = sub_100038EC8(a1[66]);
  sub_1000C896C(v13, a3, v5);
  sub_1000C89F8(v13, "dtd/", v5);
  int v16 = sub_100038EC8(a1[67]);
  sub_1000CB038(v13, v5);
  if (v14) {
    BOOL v17 = v15 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  return !v17 && v16 != 0;
}

uint64_t sub_1000AFFC4(uint64_t *a1, uint64_t a2, char *a3)
{
  int v5 = sub_1000C88E4((unint64_t)a3) + 10;
  uint64_t v13 = (_BYTE *)sub_1000CAF58(v5, v6, v7, v8, v9, v10, v11, v12);
  bzero(v13, v5);
  sub_1000C896C(v13, a3, v5);
  sub_1000C89F8(v13, "dtg/", v5);
  if (sub_100038EDC(a1[65])
    && (sub_1000C896C(v13, a3, v5), sub_1000C89F8(v13, "dtl/", v5), sub_100038EDC(a1[66])))
  {
    sub_1000C896C(v13, a3, v5);
    sub_1000C89F8(v13, "dtd/", v5);
    uint64_t v14 = sub_100038EDC(a1[67]);
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  sub_1000CB038(v13, v5);
  return v14;
}

uint64_t sub_1000B00DC( uint64_t a1, uint64_t a2, uint64_t a3, unsigned int **a4, uint64_t a5, int a6, uint64_t a7, unsigned int a8, unsigned int a9, unsigned int a10)
{
  uint64_t v18 = a1 + 33340;
  if (*(int *)(a1 + 8756) >= 1)
  {
    uint64_t v19 = 0LL;
    do
      sub_10002613C(*(void *)(*(void *)(a1 + 8744) + 8 * v19++));
    while (v19 < *(int *)(a1 + 8756));
  }

  *(_DWORD *)(a1 + 8756) = 0;
  if (a6 != 3 && a6 != 10 || !(_DWORD)a5) {
    goto LABEL_115;
  }
  if ((int)a5 >= 1)
  {
    uint64_t v20 = a5;
    uint64_t v21 = a4;
    while (**v21 == 3 && *((void *)*v21 + 32) == *((void *)*a4 + 32))
    {
      ++v21;
      if (!--v20) {
        goto LABEL_12;
      }
    }

    goto LABEL_115;
  }

uint64_t sub_1000B0ACC(void *a1, int a2, int a3)
{
  uint64_t v6 = a1[65];
  uint64_t v7 = a1[66];
  uint64_t v8 = a1[67];
  uint64_t result = sub_100038F00((uint64_t)a1, a2, a3);
  if ((_DWORD)result)
  {
    uint64_t v10 = a1 + 4169;
    if (!*v10 || (uint64_t result = sub_100038F00(v6, a2, a3), (_DWORD)result))
    {
      if (!v10[1] || (uint64_t result = sub_100038F00(v7, a2, a3), (_DWORD)result))
      {
        if (v10[2]) {
          return sub_100038F00(v8, a2, a3);
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000B0B7C(uint64_t result, const void *a2, _DWORD *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = result;
  uint64_t v6 = *(void *)(result + 520);
  uint64_t v7 = *(void *)(result + 528);
  uint64_t v8 = *(void *)(result + 536);
  size_t v9 = *(int *)(result + 8736);
  uint64_t v58 = 0LL;
  int v10 = *(_DWORD *)(result + 464);
  if (a2 || v10)
  {
    uint64_t v11 = (_DWORD *)(result + 33336);
    if (*(_DWORD *)(result + 33356))
    {
      BOOL v12 = 1;
      int v13 = *(_DWORD *)(result + 33352);
      uint64_t v14 = qword_1000FDCC0;
      size_t v56 = v9;
      if (!qword_1000FDCC0) {
        goto LABEL_11;
      }
    }

    else
    {
      BOOL v12 = *(_DWORD *)(result + 33360) != 0;
      int v13 = *(_DWORD *)(result + 33352);
      uint64_t v14 = qword_1000FDCC0;
      size_t v56 = v9;
      if (!qword_1000FDCC0) {
        goto LABEL_11;
      }
    }

    if (*(_DWORD *)(v14 + 5232))
    {
      if (a2)
      {
        if (v13)
        {
          int v13 = 1;
          goto LABEL_24;
        }

        if (!v10)
        {
          int v13 = 0;
          uint64_t v15 = (uint64_t)a2;
          if (v12) {
            goto LABEL_15;
          }
LABEL_24:
          uint64_t result = sub_1000596C0(*(void *)(v5 + 392), v4, a3);
          if (!(_DWORD)result) {
            return sub_10003991C(v5);
          }
          goto LABEL_25;
        }
      }

      else
      {
        if (!v10) {
          goto LABEL_102;
        }
        BOOL v12 = 1;
      }

      uint64_t result = sub_100059730(*(void **)(result + 392), *(_DWORD *)(result + 33344), &v58);
      a3 = v58;
      if (v12)
      {
        uint64_t v15 = result;
        int v13 = 0;
        int v10 = *(_DWORD *)(v5 + 464);
        if (v4) {
          goto LABEL_13;
        }
        goto LABEL_15;
      }

      int v13 = 0;
LABEL_23:
      if (!v4)
      {
LABEL_25:
        if (!v13) {
          goto LABEL_100;
        }
        sub_100039834(v6, (uint64_t)v4, (uint64_t)a3);
        uint64_t result = sub_100066144(v6);
        if (!(_DWORD)result) {
          goto LABEL_100;
        }
        uint64_t v54 = v7;
        uint64_t v55 = v8;
        int v23 = (uint64_t *)(v5 + 544);
        uint64_t v24 = v56;
        uint64_t v25 = sub_1000CAFC0(v56, v16, v17, v18, v19, v20, v21, v22);
        sub_100066550(v6, (uint64_t)v25);
        uint64_t result = sub_100039820(v6, 0LL);
        if (*(int *)(v5 + 8756) >= 1)
        {
          uint64_t v26 = 0LL;
          do
            uint64_t result = sub_10002613C(*(void *)(*(void *)(v5 + 8744) + 8 * v26++));
          while (v26 < *(int *)(v5 + 8756));
        }

        *(_DWORD *)(v5 + 8756) = 0;
        *(_DWORD *)(v5 + 33352) = 0;
        if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 5244))
        {
          if ((int)v56 < 1)
          {
            int v27 = 0;
            uint64_t v36 = v55;
            uint64_t v11 = (_DWORD *)(v5 + 33336);
            uint64_t v37 = v54;
          }

          else
          {
            int v27 = 0;
            int v28 = 0;
            do
            {
              int v29 = *(unsigned __int8 *)v25;
              uint64_t v25 = (void *)((char *)v25 + 1);
              if (v29)
              {
                uint64_t result = sub_10002A328(*v23);
                if ((_DWORD)result) {
                  int v28 = 1;
                }
                else {
                  int v27 = 1;
                }
              }

              ++v23;
              --v24;
            }

            while (v24);
            uint64_t v36 = v55;
            uint64_t v11 = (_DWORD *)(v5 + 33336);
            uint64_t v37 = v54;
            if (v28) {
              goto LABEL_76;
            }
          }

          if (v11[6])
          {
            uint64_t result = sub_100039820(v36, 0LL);
            v11[6] = 0;
            if (v11[5]) {
              uint64_t result = sub_1000398A4(v37);
            }
          }

uint64_t sub_1000B1184(uint64_t a1)
{
  uint64_t v1 = a1 + 33352;
  uint64_t v2 = *(void *)(a1 + 528);
  uint64_t v3 = *(void *)(a1 + 536);
  if (*(_DWORD *)(a1 + 33352))
  {
    uint64_t v4 = *(void *)(a1 + 520);
    if (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 5244)) {
      return sub_10003982C(v4);
    }
  }

  int v6 = *(_DWORD *)(v1 + 4);
  int v5 = *(_DWORD *)(v1 + 8);
  if (!v6)
  {
    uint64_t v4 = v3;
    if (v5) {
      return sub_10003982C(v4);
    }
    return 3LL;
  }

  if (!v5) {
    return sub_10003982C(v2);
  }
  int v7 = sub_10003982C(v2);
  int v8 = sub_10003982C(v3);
  if (v7 == 3 || v8 == 3) {
    return 3LL;
  }
  int v10 = v8;
  uint64_t result = 2LL;
  if (v7 != 2 && v10 != 2)
  {
    int v12 = sub_100038FF8(v2);
    else {
      uint64_t v4 = v2;
    }
    return sub_10003982C(v4);
  }

  return result;
}

uint64_t sub_1000B1268(uint64_t a1)
{
  return *(__int16 *)(a1 + 33340);
}

uint64_t sub_1000B1274(uint64_t a1)
{
  uint64_t v1 = a1 + 33352;
  if (*(_DWORD *)(a1 + 33352)) {
    return sub_1000398B4(*(void *)(a1 + 520));
  }
  uint64_t v3 = *(void *)(a1 + 536);
  if (!*(_DWORD *)(a1 + 33356))
  {
    uint64_t result = 2LL;
    if (!*(_DWORD *)(v1 + 8)) {
      return result;
    }
    return sub_1000398B4(v3);
  }

  uint64_t result = sub_1000398B4(*(void *)(a1 + 528));
  if ((_DWORD)result != 2 && *(_DWORD *)(v1 + 8)) {
    return sub_1000398B4(v3);
  }
  return result;
}

uint64_t sub_1000B130C(uint64_t *a1)
{
  return sub_10003991C(a1[67]);
}

uint64_t sub_1000B133C( uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, uint64_t a14)
{
  uint64_t v19 = (_DWORD *)(a1 + 33352);
  uint64_t v20 = *(void *)(a1 + 520);
  uint64_t v21 = *(void *)(a1 + 528);
  uint64_t v22 = (uint64_t *)(a1 + 536);
  uint64_t v23 = *(void *)(a1 + 536);
  int v24 = *(_DWORD *)(a1 + 33352);
  uint64_t v25 = v20;
  if (!v24)
  {
    if (v19[1])
    {
      BOOL v26 = sub_1000398FC(v21);
      if (v19[1]) {
        BOOL v27 = !v26;
      }
      else {
        BOOL v27 = 1;
      }
      if (!v27) {
        return 0LL;
      }
      if (!v19[2])
      {
LABEL_9:
        if (!v26) {
          goto LABEL_16;
        }
        return 0LL;
      }
    }

    else
    {
      BOOL v26 = 1;
      if (!v19[2]) {
        goto LABEL_9;
      }
    }

    uint64_t v25 = *v22;
  }

  if (sub_1000398FC(v25)) {
    return 0LL;
  }
LABEL_16:
  if (*v19 && (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 5244))) {
    return sub_10003967C(v20, a13, a14, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, 0LL);
  }
  if (v19[1])
  {
    if (v19[2])
    {
      uint64_t v117 = sub_1000CB0B0();
      int v30 = sub_10003982C(v21);
      int v31 = sub_10003982C(v23);
      if (v30 == 5)
      {
        int v132 = 0;
        int v135 = 0LL;
        uint64_t v130 = 0LL;
        unint64_t v131 = 0LL;
        unint64_t v128 = 0LL;
        unint64_t v129 = 0LL;
        unint64_t v127 = 0LL;
        unint64_t v125 = 0LL;
        unint64_t v126 = 0LL;
        uint64_t v116 = 0LL;
        BOOL v39 = (uint64_t *)(a1 + 520);
        if (v31 != 5) {
          goto LABEL_23;
        }
        goto LABEL_51;
      }

      int v134 = v31;
      int v135 = (_DWORD *)sub_1000CAF58(4LL * (int)a2, v32, v33, v34, v35, v36, v37, v38);
      unint64_t v131 = sub_1000CAF58(2LL * (int)a2, v69, v70, v71, v72, v73, v74, v75);
      uint64_t v130 = (_DWORD *)sub_1000CAF58(4LL * (int)a5, v76, v77, v78, v79, v80, v81, v82);
      unint64_t v129 = sub_1000CAF58((int)a5, v83, v84, v85, v86, v87, v88, v89);
      if (a11)
      {
        unint64_t v128 = sub_1000CAF58(2LL * (int)a5, v90, v91, v92, v93, v94, v95, v96);
        uint64_t v97 = 4LL * (int)a5;
        if (a8) {
          goto LABEL_34;
        }
      }

      else
      {
        unint64_t v128 = 0LL;
        uint64_t v97 = 4LL * (int)a5;
        if (a8)
        {
LABEL_34:
          unint64_t v127 = sub_1000CAF58(v97, v90, v91, v92, v93, v94, v95, v96);
          if (a9) {
            goto LABEL_35;
          }
          goto LABEL_47;
        }
      }

      unint64_t v127 = 0LL;
      if (a9)
      {
LABEL_35:
        unint64_t v126 = sub_1000CAF58(v97, v90, v91, v92, v93, v94, v95, v96);
        uint64_t v98 = (int)a5;
        if (a10) {
          goto LABEL_36;
        }
        goto LABEL_48;
      }

uint64_t sub_1000B1980(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 33352))
  {
    uint64_t v1 = *(void *)(a1 + 520);
  }

  else
  {
    uint64_t v1 = *(void *)(a1 + 536);
    if (*(_DWORD *)(a1 + 33356))
    {
      uint64_t v3 = *(void *)(a1 + 528);
      if (*(_DWORD *)(a1 + 33360))
      {
        int v4 = sub_100038FF8(*(void *)(a1 + 528));
      }

      else
      {
        uint64_t v1 = *(void *)(a1 + 528);
      }
    }
  }

  return sub_100039818(v1);
}

uint64_t sub_1000B1A40(uint64_t *a1)
{
  return sub_100039B8C(a1[67]);
}

uint64_t sub_1000B1A70(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 33352))
  {
    uint64_t v1 = *(void *)(a1 + 520);
  }

  else
  {
    uint64_t v1 = *(void *)(a1 + 536);
    if (*(_DWORD *)(a1 + 33356))
    {
      uint64_t v3 = *(void *)(a1 + 528);
      if (*(_DWORD *)(a1 + 33360))
      {
        int v4 = sub_100038FF8(*(void *)(a1 + 528));
      }

      else
      {
        uint64_t v1 = *(void *)(a1 + 528);
      }
    }
  }

  return sub_1000399C4(v1);
}

uint64_t sub_1000B1B00( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned int a7, int a8)
{
  uint64_t v9 = a1 + 33352;
  uint64_t v10 = *(void *)(a1 + 528);
  uint64_t v11 = *(void *)(a1 + 536);
  if (*(_DWORD *)(a1 + 33352))
  {
    int v12 = (uint64_t *)(a1 + 520);
    goto LABEL_14;
  }

  if (!*(_DWORD *)(a1 + 33356))
  {
    BOOL v13 = 1;
    if (!*(_DWORD *)(v9 + 8)) {
      goto LABEL_10;
    }
LABEL_13:
    int v12 = (uint64_t *)(a1 + 536);
LABEL_14:
    if (!sub_1000398FC(*v12)) {
      goto LABEL_15;
    }
    return 0LL;
  }

  BOOL v13 = sub_1000398FC(*(void *)(a1 + 528));
  if (*(_DWORD *)(v9 + 4)) {
    BOOL v14 = !v13;
  }
  else {
    BOOL v14 = 1;
  }
  if (!v14) {
    return 0LL;
  }
  if (*(_DWORD *)(v9 + 8)) {
    goto LABEL_13;
  }
LABEL_10:
  if (v13) {
    return 0LL;
  }
LABEL_15:
  if (*(_DWORD *)(v9 + 4))
  {
    if (*(_DWORD *)(v9 + 8))
    {
      int v16 = sub_100038FF8(v10);
    }

    else
    {
      uint64_t v11 = v10;
    }
  }

  return sub_100039978(v11, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000B1C48(uint64_t a1)
{
  uint64_t v1 = a1 + 33352;
  uint64_t v2 = *(void *)(a1 + 528);
  uint64_t v3 = *(void *)(a1 + 536);
  if (*(_DWORD *)(a1 + 33352))
  {
    uint64_t v4 = *(void *)(a1 + 520);
    if (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 5244)) {
      return sub_1000399D8(v4);
    }
  }

  if (!*(_DWORD *)(v1 + 4)) {
    return sub_1000399D8(v3);
  }
  if (!*(_DWORD *)(v1 + 8)) {
    return sub_1000399D8(v2);
  }
  int v5 = sub_100038FF8(v2);
  int v8 = sub_100038FF8(v3);
  if (v5 >= v8) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = v2;
  }
  uint64_t result = sub_1000399D8(v6);
  if ((_DWORD)result == -1)
  {
    if (v5 < v8) {
      return sub_1000399D8(v3);
    }
    uint64_t v4 = v2;
    return sub_1000399D8(v4);
  }

  return result;
}

uint64_t sub_1000B1DBC(uint64_t result, uint64_t a2)
{
  uint64_t v3 = result;
  uint64_t v4 = (int *)(result + 33340);
  if (*(_DWORD *)(result + 33352)) {
    uint64_t result = sub_100039820(*(void *)(result + 520), a2);
  }
  uint64_t v11 = 0LL;
  if (*(int *)(v3 + 8756) >= 1)
  {
    uint64_t v5 = 0LL;
    do
      uint64_t result = sub_10002613C(*(void *)(*(void *)(v3 + 8744) + 8 * v5++));
    while (v5 < *(int *)(v3 + 8756));
  }

  *(_DWORD *)(v3 + 8756) = 0;
  uint64_t v6 = (uint64_t *)(v3 + 536);
  while (1)
  {
    int v7 = v4[1];
    if (v7 >= *v4) {
      break;
    }
    uint64_t v8 = sub_100059730(*(void **)(v3 + 392), v7, &v11);
    sub_1000B21BC(v3, v8, v11);
    uint64_t v9 = (uint64_t *)(v3 + 520);
    if (v4[3]) {
      goto LABEL_7;
    }
    if (!v4[4])
    {
      uint64_t result = 1LL;
      uint64_t v9 = (uint64_t *)(v3 + 536);
      if (!v4[5]) {
        goto LABEL_8;
      }
LABEL_7:
      uint64_t result = sub_1000398FC(*v9);
      goto LABEL_8;
    }

    uint64_t result = sub_1000398FC(*(void *)(v3 + 528));
    if (v4[4] && (_DWORD)result) {
      goto LABEL_27;
    }
    uint64_t v9 = (uint64_t *)(v3 + 536);
    if (v4[5]) {
      goto LABEL_7;
    }
LABEL_8:
    if ((_DWORD)result) {
      goto LABEL_27;
    }
  }

  if (v4[4])
  {
    sub_100039820(*(void *)(v3 + 528), a2);
    uint64_t result = sub_1000398FC(*(void *)(v3 + 528));
    if ((_DWORD)result)
    {
      v4[4] = 0;
      if (v4[5])
      {
        uint64_t result = sub_1000398A4(*v6);
        goto LABEL_22;
      }

uint64_t sub_1000B1F5C(uint64_t a1)
{
  return sub_100038FD4(*(void *)(a1 + 536));
}

uint64_t sub_1000B1F64(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 33360);
  if (*(_DWORD *)(a1 + 33356))
  {
    int v3 = sub_100039408(*(void *)(a1 + 528));
    int v4 = v3;
    if (!v2) {
      return (__int16)v4;
    }
    if (v3 != -1)
    {
      int v5 = sub_100039408(*(void *)(a1 + 536));
      if (v4 <= v5) {
        __int16 v6 = v5;
      }
      else {
        __int16 v6 = v4;
      }
      if (v5 == -1) {
        LOWORD(v4) = -1;
      }
      else {
        LOWORD(v4) = v6;
      }
      return (__int16)v4;
    }
  }

  else if (v2)
  {
    return sub_100039408(*(void *)(a1 + 536));
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_1000B1FFC(uint64_t a1)
{
  return sub_100038EF0(*(void *)(a1 + 536));
}

uint64_t sub_1000B2004(uint64_t *a1)
{
  return sub_100039030(a1[67]);
}

uint64_t sub_1000B2040(uint64_t a1)
{
  uint64_t result = sub_100039A14(*(void *)(a1 + 528));
  if ((_DWORD)result) {
    return sub_100039A14(*(void *)(a1 + 536)) != 0;
  }
  return result;
}

uint64_t sub_1000B2080(uint64_t *a1)
{
  uint64_t result = sub_100039A28(a1[65]);
  if ((_DWORD)result)
  {
    uint64_t result = sub_100039A28(a1[66]);
    if ((_DWORD)result) {
      return sub_100039A28(a1[67]) != 0;
    }
  }

  return result;
}

uint64_t sub_1000B20D0(uint64_t *a1)
{
  uint64_t result = sub_100039A3C(a1[65]);
  if ((_DWORD)result)
  {
    uint64_t result = sub_100039A3C(a1[66]);
    if ((_DWORD)result) {
      return sub_100039A3C(a1[67]) != 0;
    }
  }

  return result;
}

uint64_t sub_1000B2120(uint64_t *a1)
{
  uint64_t result = sub_100039A50(a1[65]);
  if ((_DWORD)result)
  {
    uint64_t result = sub_100039A50(a1[66]);
    if ((_DWORD)result) {
      return sub_100039A50(a1[67]) != 0;
    }
  }

  return result;
}

uint64_t sub_1000B2170(uint64_t result)
{
  uint64_t v1 = result;
  if (*(int *)(result + 8756) >= 1)
  {
    uint64_t v2 = 0LL;
    do
      uint64_t result = sub_10002613C(*(void *)(*(void *)(v1 + 8744) + 8 * v2++));
    while (v2 < *(int *)(v1 + 8756));
  }

  *(_DWORD *)(v1 + 8756) = 0;
  return result;
}

uint64_t sub_1000B21BC(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v5 = (int *)(result + 33344);
  uint64_t v6 = *(void *)(result + 536);
  int v7 = *(_DWORD *)(result + 33360);
  if (!*(_DWORD *)(result + 33356))
  {
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v10 = *(void *)(result + 536);
LABEL_19:
    uint64_t result = sub_100039834(v10, a2, a3);
    goto LABEL_20;
  }

  uint64_t v8 = *(void *)(result + 528);
  if (!v7)
  {
    uint64_t v10 = *(void *)(result + 528);
    goto LABEL_19;
  }

  if (*v5 < 1
    || (sub_100038FF8(*(void *)(result + 528)), sub_100039020(v6),
                                                  sub_100038FF8(v6),
                                                  uint64_t result = sub_100039020(v8),
                                                  v5[3]))
  {
    sub_100039834(v8, a2, a3);
    uint64_t result = sub_10003982C(v8);
    if ((_DWORD)result == 5 || (_DWORD)result == 3)
    {
      sub_100039820(v8, 0LL);
      v5[3] = 0;
      uint64_t result = sub_1000398A4(v6);
    }
  }

  if (v5[4])
  {
    sub_100039834(v6, a2, a3);
    uint64_t result = sub_10003982C(v6);
    if ((_DWORD)result == 5 || (_DWORD)result == 3)
    {
      uint64_t result = sub_100039820(v6, 0LL);
      v5[4] = 0;
      if (v5[3]) {
        uint64_t result = sub_1000398A4(v8);
      }
    }
  }

uint64_t sub_1000B230C( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int *a11, int *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, int *a22, int *a23)
{
  uint64_t v23 = 0LL;
  LODWORD(v24) = 0;
  LODWORD(v25) = 0;
  uint64_t v26 = *a11;
  uint64_t v27 = *a22;
  uint64_t v28 = *a12;
  uint64_t v29 = *a23;
  do
  {
    int v30 = *(_DWORD *)(a15 + 4 * v27 + v23);
    size_t v25 = (v25 + 2);
    size_t v24 = (v24 + 1);
    v23 += 4LL;
  }

  while (v30 != -1);
  size_t v34 = v23;
  j__memmove((void *)(a4 + 4 * v26), (const void *)(a15 + 4 * v27), v23);
  *(_DWORD *)(a2 + 4 * v28) = *(_DWORD *)(a13 + 4 * v29);
  if (a3) {
    *(_WORD *)(a3 + 2 * v28) = *(_WORD *)(a14 + 2 * v29);
  }
  if (a10) {
    *(void *)(a10 + 8 * v28) = *(void *)(a21 + 8 * v29);
  }
  j__memmove((void *)(a5 + v26), (const void *)(a16 + v27), v24);
  if (a9) {
    j__memmove((void *)(a9 + 2 * v26), (const void *)(a20 + 2 * v27), v25);
  }
  if (a6) {
    j__memmove((void *)(a6 + 4 * v26), (const void *)(a17 + 4 * v27), v34);
  }
  if (a7) {
    j__memmove((void *)(a7 + 4 * v26), (const void *)(a18 + 4 * v27), v34);
  }
  if (a8) {
    j__memmove((void *)(a8 + v26), (const void *)(a19 + v27), v24);
  }
  ++*a12;
  ++*a23;
  *a11 += v24;
  *a22 += v24;
  return 1LL;
}

void (**sub_1000B24F4(void (**result)(void)))(void)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    (*result)();
    return (void (**)(void))sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t sub_1000B2524(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t sub_1000B252C(uint64_t a1, char *a2)
{
  int v3 = 0;
  sub_1000BCC44(a1, "btt0", a2, &v3);
  return 0LL;
}

double sub_1000B2560(uint64_t a1, int a2, int a3, int a4, int a5, int a6)
{
  int v6 = a3 / a2;
  *(_DWORD *)(a1 + 4) = v6;
  *(_DWORD *)(a1 + 8) = a4 / a2;
  *(_DWORD *)(a1 + 36) = a5;
  if (!(a4 / a2)) {
    *(_DWORD *)(a1 + 8) = 1;
  }
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)a1 = 1;
  double result = NAN;
  *(void *)(a1 + 24) = 0xFFFFFFFF00000000LL;
  *(_DWORD *)(a1 + 32) = -1;
  *(_DWORD *)(a1 + 40) = 0;
  *(_DWORD *)(a1 + 44) = a6;
  return result;
}

double sub_1000B25A8(uint64_t a1)
{
  *(_DWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 16) = 0;
  *(_DWORD *)a1 = 1;
  double result = NAN;
  *(void *)(a1 + 24) = 0xFFFFFFFF00000000LL;
  *(_DWORD *)(a1 + 32) = -1;
  *(_DWORD *)(a1 + 40) = 0;
  return result;
}

uint64_t sub_1000B25CC(unsigned int *a1, int a2)
{
  uint64_t v2 = *a1;
  switch((_DWORD)v2)
  {
    case 3:
      if (a2)
      {
        signed int v4 = a1[3];
        int v5 = a1[4] + 1;
        a1[4] = v5;
        int v6 = a1[2];
        if (v4 >= (int)a1[1])
        {
          if (v5 >= (int)(a1[10] + v6))
          {
            *a1 = 2;
            a1[8] = a1[6] - v5;
            int v9 = a1[6] + 1;
            a1[5] = 0;
            a1[6] = v9;
            return 2LL;
          }

          else
          {
            ++a1[6];
            return 3LL;
          }
        }

        else if (v5 >= v6)
        {
          *a1 = 1;
          ++a1[6];
          return 1LL;
        }

        else
        {
          ++a1[6];
          return 3LL;
        }
      }

      else
      {
        ++a1[3];
        a1[4] = 0;
        ++a1[6];
        return 3LL;
      }

    case 2:
      if (a2 || (int v7 = a1[5] + 1, a1[5] = v7, v7 != a1[1]))
      {
        ++a1[6];
        return 2LL;
      }

      else
      {
        *a1 = 3;
        a1[4] = 0;
        ++a1[6];
        return 3LL;
      }

    case 1:
      if (a2)
      {
        uint64_t v2 = 1LL;
        goto LABEL_6;
      }

      *a1 = 3;
      *(void *)(a1 + 3) = 1LL;
      unsigned int v8 = a1[6];
      a1[6] = v8 + 1;
      a1[7] = v8;
      return 3LL;
    default:
LABEL_6:
      ++a1[6];
      return v2;
  }

BOOL sub_1000B2750(_DWORD *a1)
{
  return *a1 == 2;
}

BOOL sub_1000B2760(_DWORD *a1)
{
  return *a1 == 3 && (int)a1[4] > 0 || *a1 == 2;
}

uint64_t sub_1000B278C(_DWORD *a1)
{
  if (*a1 == 1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a1[7];
  }
}

uint64_t sub_1000B27A8(_DWORD *a1)
{
  if (*a1 == 1) {
    return 0xFFFFFFFFLL;
  }
  if (*a1 != 3) {
    return a1[8];
  }
  int v2 = a1[4];
  if (!v2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = a1[8];
  if ((int)result <= 0)
  {
    int v4 = a1[6];
    unsigned int v5 = v4 - v2;
    if (v4 <= 0) {
      return result;
    }
    else {
      return v5;
    }
  }

  return result;
}

uint64_t sub_1000B27FC(unsigned int *a1, int a2, int a3)
{
  uint64_t result = *a1;
  if ((_DWORD)result == 3)
  {
    signed int v5 = a1[4];
    if (v5 > (int)a1[9] && v5 + a2 >= (int)(a1[10] + a1[2]) && (int)a1[3] >= (int)a1[1])
    {
      uint64_t result = 2LL;
      if (a3)
      {
        a1[8] = a1[6] - v5;
        *a1 = 2;
      }
    }

    else
    {
      return 3LL;
    }
  }

  return result;
}

uint64_t sub_1000B2868(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 40) != a2) {
    *(_DWORD *)(result + 40) = a2;
  }
  return result;
}

uint64_t sub_1000B287C(uint64_t a1, uint64_t a2, int a3, int a4)
{
  uint64_t result = sub_1000C1074(64LL);
  if (result)
  {
    *(void *)(result + 8) = a1;
    *(void *)(result + 16) = a2;
    *(_DWORD *)(result + 24) = a3;
    *(_DWORD *)(result + 32) = a4;
    *(_DWORD *)(result + 44) = 0;
    *(_DWORD *)(result + 56) = 0;
    *(_DWORD *)(result + 60) = a4;
  }

  return result;
}

uint64_t sub_1000B28CC(int *a1)
{
  uint64_t v2 = sub_1000C1074(64LL);
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  int v4 = a1[10];
  *(_DWORD *)(v2 + 24) = v4;
  unsigned int v5 = a1[8];
  *(void *)(v2 + 32) = v5;
  int v6 = a1[10];
  *(_DWORD *)(v2 + 40) = v6;
  *(_DWORD *)uint64_t v2 = 0;
  *(_DWORD *)(v2 + 28) = v6;
  int v7 = v5 * v4;
  int v8 = (a1[6] - a1[9]) * v5;
  if (v5 * v4) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    *(_DWORD *)(v2 + 44) = 0;
    *(void *)(v2 + 8) = 0LL;
    *(void *)(v2 + 16) = 0LL;
    return v3;
  }

  if (!qword_1000FDCC0)
  {
    *(_DWORD *)(v2 + 56) = 0;
    uint64_t v10 = (_DWORD *)(v2 + 56);
    goto LABEL_12;
  }

  if (!*(_DWORD *)qword_1000FDCC0)
  {
    int v32 = *(_DWORD *)(qword_1000FDCC0 + 4);
    *(_DWORD *)(v2 + 56) = v32 != 0;
    uint64_t v10 = (_DWORD *)(v2 + 56);
    if (v32) {
      goto LABEL_45;
    }
LABEL_12:
    *(_DWORD *)(v2 + 60) = v5;
    *(_DWORD *)(v2 + 44) = 1;
    uint64_t v11 = (char *)sub_1000C1074(v7);
    *(void *)(v3 + 8) = v11;
    if (!v11)
    {
LABEL_48:
      uint64_t v35 = *(void *)(v3 + 48);
      goto LABEL_60;
    }

    goto LABEL_13;
  }

  *(_DWORD *)(v2 + 56) = 1;
  uint64_t v10 = (_DWORD *)(v2 + 56);
LABEL_45:
  if ((v5 & 1) != 0) {
    goto LABEL_61;
  }
  *(_DWORD *)(v2 + 60) = (int)v5 / 2;
  uint64_t v33 = sub_1000C1074((int)v5);
  *(void *)(v3 + 48) = v33;
  if (!v33) {
    goto LABEL_61;
  }
  int v34 = *(_DWORD *)(v3 + 24) * *(_DWORD *)(v3 + 60);
  *(_DWORD *)(v3 + 44) = 1;
  uint64_t v11 = (char *)sub_1000C1074(v34);
  *(void *)(v3 + 8) = v11;
  if (!v11) {
    goto LABEL_48;
  }
LABEL_13:
  int v12 = a1[9];
  if (*v10)
  {
    int v13 = a1[10];
    *a1 = v12;
    a1[7] = v13;
    *(_DWORD *)(v3 + 40) = 0;
    *(_DWORD *)(v3 + 28) = 0;
    if (v13 >= 1)
    {
      int v14 = 0;
      int v15 = 0;
      while (1)
      {
        int v17 = a1[7];
        if (v17) {
          break;
        }
        uint64_t v20 = 0LL;
        int v23 = *(_DWORD *)(v3 + 24);
        if (v14 != v23) {
          goto LABEL_32;
        }
LABEL_18:
        if (++v15 == v13) {
          goto LABEL_53;
        }
      }

      a1[7] = v17 - 1;
      int v18 = *a1;
      int v19 = a1[15];
      uint64_t v20 = (unsigned __int8 *)(*((void *)a1 + 1) + v19 * *a1);
      if (a1[14])
      {
        uint64_t v21 = (_BYTE *)*((void *)a1 + 6);
        if (v19 < 1)
        {
          uint64_t v20 = (unsigned __int8 *)*((void *)a1 + 6);
        }

        else
        {
          uint64_t v22 = 0LL;
          do
          {
            _BYTE *v21 = v20[v22] & 0xF;
            v21[1] = v20[v22] >> 4;
            v21 += 2;
            ++v22;
          }

          while (v22 < a1[15]);
          uint64_t v20 = (unsigned __int8 *)*((void *)a1 + 6);
          int v18 = *a1;
        }
      }

      if (v18 + 1 == a1[6]) {
        int v24 = 0;
      }
      else {
        int v24 = v18 + 1;
      }
      *a1 = v24;
      int v23 = *(_DWORD *)(v3 + 24);
      int v14 = *(_DWORD *)(v3 + 28);
      if (v14 == v23) {
        goto LABEL_18;
      }
LABEL_32:
      int v25 = *(_DWORD *)v3 + v14;
      if (v25 <= v23) {
        int v23 = 0;
      }
      if (*(_DWORD *)(v3 + 56))
      {
        uint64_t v26 = *(void *)(v3 + 48);
        int v16 = *(_DWORD *)(v3 + 60);
        if (v16 < 1)
        {
          uint64_t v20 = *(unsigned __int8 **)(v3 + 48);
        }

        else
        {
          uint64_t v27 = 0LL;
          uint64_t v28 = v20 + 1;
          do
          {
            unsigned int v29 = *(v28 - 1);
            if (v29 >= 0xF) {
              LOBYTE(v29) = 15;
            }
            unsigned int v31 = *v28;
            v28 += 2;
            char v30 = v31;
            if (v31 >= 0xF) {
              char v30 = 15;
            }
            *(_BYTE *)(v26 + v27++) = v29 | (16 * v30);
          }

          while (v27 < *(int *)(v3 + 60));
          uint64_t v20 = *(unsigned __int8 **)(v3 + 48);
          int v16 = *(_DWORD *)(v3 + 60);
        }
      }

      else
      {
        int v16 = *(_DWORD *)(v3 + 60);
      }

      memcpy((void *)(*(void *)(v3 + 8) + v16 * (v25 - v23)), v20, v16);
      int v14 = *(_DWORD *)(v3 + 28) + 1;
      *(_DWORD *)(v3 + 28) = v14;
      *(_DWORD *)(v3 + 40) = v14;
      goto LABEL_18;
    }
  }

  else
  {
    uint64_t v36 = v11;
    uint64_t v37 = (const void *)(*((void *)a1 + 1) + v12 * (uint64_t)a1[8]);
    if (v7 <= v8)
    {
      size_t v38 = v7;
    }

    else
    {
      memcpy(v11, v37, v8);
      uint64_t v37 = (const void *)*((void *)a1 + 1);
      uint64_t v11 = &v36[v8];
      size_t v38 = v7 - v8;
    }

    memcpy(v11, v37, v38);
  }

_DWORD *sub_1000B2C9C(_DWORD *result)
{
  int v1 = result[10];
  *uint64_t result = result[9];
  result[7] = v1;
  return result;
}

uint64_t sub_1000B2CAC(int *a1, void *a2)
{
  int v2 = a1[7];
  if (!v2) {
    return 0LL;
  }
  a1[7] = v2 - 1;
  int v3 = *a1;
  int v4 = a1[15];
  uint64_t v5 = *((void *)a1 + 1) + v4 * *a1;
  if (a1[14])
  {
    int v6 = (_BYTE *)*((void *)a1 + 6);
    if (v4 < 1)
    {
      uint64_t v5 = *((void *)a1 + 6);
      if (!a2) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }

    uint64_t v7 = 0LL;
    do
    {
      *int v6 = *(_BYTE *)(v5 + v7) & 0xF;
      v6[1] = *(_BYTE *)(v5 + v7) >> 4;
      v6 += 2;
      ++v7;
    }

    while (v7 < a1[15]);
    uint64_t v5 = *((void *)a1 + 6);
    int v3 = *a1;
  }

  if (a2)
  {
LABEL_8:
    *a2 = *((void *)a1 + 2) + 4LL * v3;
    int v3 = *a1;
  }

uint64_t sub_1000B2D5C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 44))
    {
      sub_1000C0EF8(*(void *)(result + 48));
      sub_1000C0EF8(*(void *)(v1 + 8));
      sub_1000C0EF8(*(void *)(v1 + 16));
    }

    return sub_1000C0EF8(v1);
  }

  return result;
}

_DWORD *sub_1000B2DA4(_DWORD *result, int a2, int a3)
{
  result[9] = a2;
  result[10] = a3;
  *uint64_t result = a2;
  result[7] = a3;
  return result;
}

uint64_t sub_1000B2DB4(uint64_t a1, int a2, void *a3)
{
  if (a2 < 0 || *(_DWORD *)(a1 + 40) <= a2) {
    return 0LL;
  }
  int v3 = *(_DWORD *)(a1 + 36) + a2;
  int v4 = *(_DWORD *)(a1 + 24);
  if (v3 < v4) {
    int v4 = 0;
  }
  int v5 = v3 - v4;
  int v6 = *(_DWORD *)(a1 + 60);
  uint64_t v7 = *(void *)(a1 + 8) + v6 * (uint64_t)v5;
  if (*(_DWORD *)(a1 + 56))
  {
    int v8 = *(_BYTE **)(a1 + 48);
    if (v6 < 1)
    {
      uint64_t v7 = *(void *)(a1 + 48);
      if (a3) {
        goto LABEL_11;
      }
      return v7;
    }

    uint64_t v9 = 0LL;
    do
    {
      *int v8 = *(_BYTE *)(v7 + v9) & 0xF;
      v8[1] = *(_BYTE *)(v7 + v9) >> 4;
      v8 += 2;
      ++v9;
    }

    while (v9 < *(int *)(a1 + 60));
    uint64_t v7 = *(void *)(a1 + 48);
  }

  if (a3)
  {
LABEL_11:
    *a3 = *(void *)(a1 + 16) + 4LL * v5;
    return v7;
  }

  return v7;
}

uint64_t sub_1000B2E64(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 44))
    {
      sub_1000C0EF8(*(void *)(result + 8));
      sub_1000C0EF8(*(void *)(v1 + 16));
    }

    return sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t *sub_1000B2EA4(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = (uint64_t)result;
    uint64_t v2 = *result;
    if (*(int *)(v1 + 16) >= 1)
    {
      uint64_t v3 = 0LL;
      int v4 = (uint64_t *)(v2 + 8);
      do
      {
        sub_1000B2D5C(*(v4 - 1));
        uint64_t v5 = *v4;
        v4 += 3;
        sub_1000C0EF8(v5);
        ++v3;
      }

      while (v3 < *(int *)(v1 + 16));
      uint64_t v2 = *(void *)v1;
    }

    sub_1000C0EF8(v2);
    *(void *)uint64_t v1 = 0LL;
    *(void *)(v1 + 8) = 0LL;
    *(void *)(v1 + 16) = 0LL;
    return (uint64_t *)sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t sub_1000B2F1C(uint64_t *a1)
{
  int v1 = *((_DWORD *)a1 + 3);
  if (v1 >= *((_DWORD *)a1 + 4)) {
    return 0LL;
  }
  uint64_t v2 = *a1;
  *((_DWORD *)a1 + 3) = v1 + 1;
  return v2 + 24LL * v1;
}

uint64_t sub_1000B2F4C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000C133C(*(void *)(result + 72));
    *(void *)(v1 + 72) = 0LL;
    sub_1000C133C(*(void *)(v1 + 80));
    *(void *)(v1 + 80) = 0LL;
    sub_100051884(*(unsigned int **)(v1 + 64));
    sub_1000AE884(*(void *)(v1 + 56));
    sub_100063950(*(void *)(v1 + 48));
    sub_100074AC8(*(void *)(v1 + 16));
    sub_10001EB1C(*(void *)(v1 + 8));
    sub_100023E28(*(void **)(v1 + 40));
    sub_100059748(*(uint64_t (***)(void))v1);
    sub_100099F1C(*(void *)(v1 + 32));
    sub_100074AC8(*(void *)(v1 + 24));
    *(void *)(v1 + 64) = 0LL;
    *(_OWORD *)uint64_t v1 = 0u;
    *(_OWORD *)(v1 + 16) = 0u;
    *(_OWORD *)(v1 + 32) = 0u;
    *(void *)(v1 + 48) = 0LL;
    return sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t *sub_1000B2FE8(uint64_t *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    int v4 = sub_100082DD0(*result);
    uint64_t result = (uint64_t *)sub_100082DD0(a2);
    if (v4 == (_DWORD)result)
    {
      int v5 = sub_100082BA4(a2);
      int v6 = sub_10003982C(a2);
      uint64_t v7 = sub_100082D10(a2);
      uint64_t v8 = sub_100082D20(a2);
      uint64_t v9 = sub_1000C1074(2LL * v5);
      uint64_t v10 = sub_1000C1074(2LL * v6);
      uint64_t v11 = sub_1000C13F8(2LL, v8, v7);
      uint64_t v12 = sub_1000C1074(4LL * (int)v8);
      int v18 = 0;
      while (sub_100082DA4(a2) != 0xFFFFFF)
      {
        sub_100082BAC(a2);
        int v13 = sub_100082B9C(*v3);
        char v14 = sub_100082D08(a2);
        uint64_t v15 = sub_100082D30(a2);
        if (v13 == 0xFFFFFF)
        {
          sub_100082D40(*v3, v9, v10, v15, v11, v14 & 2, 0LL, &v18);
        }

        else if ((int)v15 >= 1)
        {
          uint64_t v16 = v15;
          uint64_t v17 = v11;
          do
          {
            v17 += 8LL;
            sub_100082D9C(*v3);
            --v16;
          }

          while (v16);
        }
      }

      sub_1000C0EF8(v12);
      sub_1000C133C(v11);
      sub_1000C0EF8(v10);
      return (uint64_t *)sub_1000C0EF8(v9);
    }
  }

  return result;
}

uint64_t sub_1000B31C8(uint64_t a1)
{
  return *(void *)(a1 + 8);
}

uint64_t sub_1000B31D0(uint64_t *a1)
{
  return sub_1000597B8(*a1);
}

BOOL sub_1000B31D8(uint64_t *a1, int a2, _BYTE *a3)
{
  unint64_t v5 = sub_1000597B8(*a1);
  else {
    return 0LL;
  }
}

BOOL sub_1000B323C(uint64_t a1)
{
  return *(void *)(a1 + 16) != 0LL;
}

uint64_t sub_1000B324C(uint64_t *a1)
{
  int v2 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  LODWORD(result) = sub_100082BA4(*a1);
  else {
    return result;
  }
}

uint64_t sub_1000B3288(uint64_t *a1)
{
  return sub_10003982C(*a1);
}

uint64_t sub_1000B3290(uint64_t a1)
{
  return sub_10001FBA0(*(void *)(a1 + 8));
}

uint64_t sub_1000B3298(uint64_t a1)
{
  return sub_10001FBBC(*(void *)(a1 + 8));
}

uint64_t sub_1000B32A0(uint64_t *a1)
{
  return sub_100082D18(*a1);
}

uint64_t sub_1000B32A8(uint64_t *a1)
{
  return sub_100082D20(*a1);
}

uint64_t sub_1000B32B0(uint64_t *a1, _WORD *a2)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v3 = a2;
  do
  {
    int v4 = (unsigned __int16)*v3;
    if (!*v3) {
      return 0xFFFFFFFFLL;
    }
    ++v3;
  }

  while (sub_1000CBA60(v4));
  int v5 = sub_100082B9C(*a1);
  if (v5 == 0xFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5 | 0xC0000000;
  }
}

uint64_t sub_1000B3338(uint64_t *a1)
{
  if (sub_1000CBA60(58)
    && sub_1000CBA60(71)
    && sub_1000CBA60(65)
    && sub_1000CBA60(82)
    && sub_1000CBA60(66)
    && sub_1000CBA60(65)
    && sub_1000CBA60(71)
    && sub_1000CBA60(69)
    && sub_1000CBA60(58))
  {
    return 0xFFFFFFFFLL;
  }

  int v3 = sub_100082B9C(*a1);
  if (v3 == 0xFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v3 | 0xC0000000;
  }
}

char *sub_1000B33F8(char *result, unsigned int a2, uint64_t a3, _WORD *a4)
{
  if (a2 <= 0xFFFFFFFA)
  {
    uint64_t v7 = (uint64_t *)result;
    unsigned int v8 = a2 >> 30;
    if (a2 >> 30 != 1)
    {
      if (v8 == 2)
      {
        uint64_t result = (char *)sub_100020024(*((void *)result + 1), (unsigned __int16)a2);
        if (!(_DWORD)result) {
          goto LABEL_10;
        }
      }

      else
      {
        if (v8 != 3) {
          goto LABEL_10;
        }
        if ((a2 & 0xFFFFFF) == 0xFFFFFF) {
          goto LABEL_23;
        }
        uint64_t result = (char *)sub_100082D94(*(void *)result);
        if (!(_DWORD)result) {
          goto LABEL_10;
        }
      }

uint64_t sub_1000B3608(uint64_t *a1, unsigned int a2)
{
  if (a2 > 0xFFFFFFFA) {
    return 1LL;
  }
  unsigned int v3 = a2 >> 30;
  if (a2 >> 30 == 1)
  {
    if ((~a2 & 0xFFFE) != 0) {
      return sub_10002007C(a1[1], (unsigned __int16)a2);
    }
    return 0LL;
  }

  if (v3 == 2) {
    return sub_100020024(a1[1], (unsigned __int16)a2);
  }
  if (v3 != 3) {
    return 0LL;
  }
  if ((a2 & 0xFFFFFF) == 0xFFFFFF) {
    return 1LL;
  }
  else {
    return sub_100082D94(*a1);
  }
}

uint64_t sub_1000B3680(uint64_t *a1, _WORD *a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  if (a2)
  {
    uint64_t v10 = a2;
    while (1)
    {
      int v11 = (unsigned __int16)*v10;
      if (!*v10) {
        break;
      }
      ++v10;
      if (!sub_1000CBA60(v11))
      {
        if (a6 < 1) {
          int v19 = 0LL;
        }
        else {
          int v19 = (void *)sub_1000CAF58(4LL * a6, v12, v13, v14, v15, v16, v17, v18);
        }
        uint64_t v21 = sub_100082CF0(*a1);
        uint64_t v20 = v21;
        else {
          uint64_t v22 = v21;
        }
        if ((int)v22 < 1)
        {
          if (!v19) {
            return v20;
          }
        }

        else
        {
          uint64_t v23 = 0LL;
          uint64_t v23 = v22 & 0x7FFFFFF8;
          int v24 = v19 + 2;
          int v25 = (_OWORD *)(a7 + 16);
          uint64_t v26 = v22 & 0xFFFFFFF8;
          do
          {
            *(void *)&__int128 v27 = __PAIR64__(HIDWORD(*v24), *(_OWORD *)v24) | 0xC0000000C0000000LL;
            DWORD2(v27) = v24[1] | 0xC0000000;
            HIDWORD(v27) = HIDWORD(*(_OWORD *)v24) | 0xC0000000;
            *(v25 - 1) = *((_OWORD *)v24 - 1) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *int v25 = v27;
            v24 += 4;
            v25 += 2;
            v26 -= 8LL;
          }

          while (v26);
          if (v23 != v22)
          {
LABEL_18:
            uint64_t v28 = (unsigned int *)(a7 + 4 * v23);
            unsigned int v29 = (int *)v19 + v23;
            uint64_t v30 = v22 - v23;
            do
            {
              int v31 = *v29++;
              *v28++ = v31 | 0xC0000000;
              --v30;
            }

            while (v30);
          }
        }

        sub_1000CB038(v19, 4LL * a6);
        return v20;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000B37CC(uint64_t *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2)
  {
    uint64_t v14 = a2;
    while (1)
    {
      int v15 = *(unsigned __int16 *)v14;
      if (!*(_WORD *)v14) {
        break;
      }
      v14 += 2;
      if (!sub_1000CBA60(v15))
      {
        else {
          uint64_t v23 = (void *)sub_1000CAF58(4LL * a6, v16, v17, v18, v19, v20, v21, v22);
        }
        uint64_t v25 = sub_100082BB4(*a1, a3, a5, a2, (uint64_t)v23, a6, a4);
        uint64_t v24 = v25;
        else {
          uint64_t v26 = v25;
        }
        if ((int)v26 < 1)
        {
          if (!v23) {
            return v24;
          }
        }

        else
        {
          uint64_t v27 = 0LL;
          uint64_t v27 = v26 & 0x7FFFFFF8;
          uint64_t v28 = v23 + 2;
          unsigned int v29 = (_OWORD *)(a7 + 16);
          uint64_t v30 = v26 & 0xFFFFFFF8;
          do
          {
            *(void *)&__int128 v31 = __PAIR64__(HIDWORD(*v28), *(_OWORD *)v28) | 0xC0000000C0000000LL;
            DWORD2(v31) = v28[1] | 0xC0000000;
            HIDWORD(v31) = HIDWORD(*(_OWORD *)v28) | 0xC0000000;
            *(v29 - 1) = *((_OWORD *)v28 - 1) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            _OWORD *v29 = v31;
            v28 += 4;
            v29 += 2;
            v30 -= 8LL;
          }

          while (v30);
          if (v27 != v26)
          {
LABEL_18:
            int v32 = (unsigned int *)(a7 + 4 * v27);
            uint64_t v33 = (int *)v23 + v27;
            uint64_t v34 = v26 - v27;
            do
            {
              int v35 = *v33++;
              *v32++ = v35 | 0xC0000000;
              --v34;
            }

            while (v34);
          }
        }

        sub_1000CB038(v23, 4LL * (int)a6);
        return v24;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000B3918(uint64_t a1, unsigned int a2)
{
  unsigned int v3 = a2 >> 30;
  if (a2 >> 30 == 1)
  {
    unsigned int v5 = sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a2, 0LL);
    return sub_10001ECA8(*(void *)(a1 + 8), v5);
  }

  else if (v3 == 2)
  {
    return sub_10001ECA8(*(void *)(a1 + 8), (unsigned __int16)a2);
  }

  else if (v3 == 3)
  {
    return a2 & 0xFFFFFF;
  }

  else
  {
    return 0xFFFFFFLL;
  }

uint64_t sub_1000B3990(uint64_t a1, int a2)
{
  if (a2 == 0xFFFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a2 | 0xC0000000;
  }
}

uint64_t sub_1000B39A4(uint64_t a1, unsigned int a2, int16x8_t *a3, int a4)
{
  unsigned int v6 = a2 >> 30;
  if (a2 >> 30 != 1)
  {
    if (a2 >= 0xFFFFFFFB)
    {
      if (a2 + 5 < 4) {
        return sub_10001FBCC(*(void *)(a1 + 8), (unsigned __int16)a2, a3, a4);
      }
      return 0LL;
    }

    switch(v6)
    {
      case 1u:
        if ((_WORD)a2 == 0xFFFF) {
          return 0LL;
        }
        __int16 v10 = sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a2, 0LL);
        break;
      case 2u:
        goto LABEL_16;
      case 3u:
        int v9 = a2 & 0xFFFFFF;
        if (v9 == 0xFFFFFF) {
          return 0LL;
        }
        __int16 v10 = sub_10001EECC(*(void *)(a1 + 8), v9);
        break;
      default:
        return 0LL;
    }

    LOWORD(a2) = v10;
LABEL_16:
    if ((_WORD)a2 != 0xFFFF) {
      return sub_10001FBCC(*(void *)(a1 + 8), (unsigned __int16)a2, a3, a4);
    }
    return 0LL;
  }

  if (a4 >= 1) {
    a3->i16[0] = a2;
  }
  return 1LL;
}

uint64_t sub_1000B3A9C(uint64_t a1, unsigned int a2)
{
  if (a2 < 0xFFFFFFFB)
  {
    unsigned int v4 = a2 >> 30;
    unsigned __int16 v5 = -1;
    if (a2 >> 30 == 1)
    {
      if ((_WORD)a2 != 0xFFFF) {
        return sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a2, 0LL);
      }
    }

    else if (v4 == 2)
    {
      return (unsigned __int16)a2;
    }

    else if (v4 == 3)
    {
      int v6 = a2 & 0xFFFFFF;
      if (v6 == 0xFFFFFF) {
        return 0xFFFFLL;
      }
      else {
        return sub_10001EECC(*(void *)(a1 + 8), v6);
      }
    }

    return v5;
  }

  if (a2 + 5 >= 4) {
    return (unsigned __int16)-1;
  }
  else {
    return (unsigned __int16)a2;
  }
}

uint64_t sub_1000B3B28(uint64_t a1, unsigned int a2, int a3)
{
  if (a2 < 0xFFFFFFFB)
  {
    unsigned int v6 = a2 >> 30;
    LOWORD(result) = -1;
    if (a2 >> 30 == 1)
    {
      if ((_WORD)a2 == 0xFFFF) {
        return (unsigned __int16)result;
      }
      LOWORD(result) = sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a2, 0LL);
      int v8 = (unsigned __int16)result;
    }

    else if (v6 == 2)
    {
      LOWORD(result) = a2;
      int v8 = (unsigned __int16)a2;
    }

    else
    {
      if (v6 != 3) {
        return (unsigned __int16)result;
      }
      int v7 = a2 & 0xFFFFFF;
      if (v7 == 0xFFFFFF) {
        return (unsigned __int16)result;
      }
      LOWORD(result) = sub_10001EECC(*(void *)(a1 + 8), v7);
      int v8 = (unsigned __int16)result;
    }

    if (v8 != 65534) {
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)result, a3);
    }
LABEL_15:
    if (a3) {
      LOWORD(result) = -1;
    }
    else {
      LOWORD(result) = -2;
    }
    return (unsigned __int16)result;
  }

  LOWORD(result) = -3;
  switch(a2)
  {
    case 0xFFFFFFFB:
      LOWORD(result) = -5;
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)result, a3);
    case 0xFFFFFFFC:
      LOWORD(result) = -4;
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)result, a3);
    case 0xFFFFFFFD:
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)result, a3);
    case 0xFFFFFFFE:
      goto LABEL_15;
    default:
      uint64_t result = 0xFFFFLL;
      break;
  }

  return result;
}

uint64_t sub_1000B3C5C(uint64_t *a1, unsigned int a2)
{
  if (a2 == -1) {
    return 0LL;
  }
  unsigned int v2 = a2 >> 30;
  if (a2 >> 30 == 1) {
    return (_WORD)a2 != 0xFFFF && sub_10001EDF8(a1[1], (unsigned __int16)a2, 0LL) != 0xFFFF;
  }
  if (v2 != 2)
  {
    if (v2 == 3) {
      return sub_100082D28(*a1);
    }
    return 0LL;
  }

  return sub_10001FE60(a1[1], (unsigned __int16)a2);
}

BOOL sub_1000B3D00(uint64_t a1, unsigned int a2)
{
  return a2 != 0xFFFF && sub_10001EDF8(*(void *)(a1 + 8), a2, 0LL) != 0xFFFF;
}

uint64_t sub_1000B3D48( uint64_t *a1, unint64_t a2, _WORD *a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, char *a8, char *a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  int v14 = a4;
  if (qword_1000FDCC0)
  {
    int v17 = *(_DWORD *)(qword_1000FDCC0 + 5508);
    if (!a3) {
      goto LABEL_11;
    }
  }

  else
  {
    int v17 = 0;
    if (!a3)
    {
LABEL_11:
      uint64_t v12 = sub_1000B4E70(a1, a2, a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9);
      bzero(a8, 4 * (int)v12);
      bzero(a9, 4 * (int)v12);
      return v12;
    }
  }

  if (!*a3) {
    goto LABEL_11;
  }
  int v305 = v17;
  int v18 = sub_1000CC52C(a2);
  v318 = a3;
  int v331 = sub_1000CC52C((unint64_t)a3);
  int v19 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v20 = sub_100082BA4(*a1);
  if (v20 <= v19) {
    int v21 = v19;
  }
  else {
    int v21 = v20;
  }
  int v22 = sub_10003982C(*a1);
  int v314 = a8;
  if (qword_1000FDCC0) {
    unsigned int v341 = *(_DWORD *)(qword_1000FDCC0 + 5508);
  }
  else {
    unsigned int v341 = 0;
  }
  uint64_t v24 = sub_1000C13F8(4LL, (v18 + 1), (v331 + 1));
  if (v24)
  {
    int v32 = (_DWORD **)v24;
    int v309 = v14;
    uint64_t v33 = 2LL * (v21 + 1);
    int v336 = (void *)sub_1000CAF58(v33, v25, v26, v27, v28, v29, v30, v31);
    uint64_t v301 = 2LL * (v22 + 1);
    v339 = (_WORD *)sub_1000CAF58(v301, v34, v35, v36, v37, v38, v39, v40);
    uint64_t v48 = (void *)sub_1000CAF58(120LL, v41, v42, v43, v44, v45, v46, v47);
    uint64_t v323 = (uint64_t)v32;
    int v326 = v18;
    int v307 = v12;
    uint64_t v303 = v33;
    if (v18 < 0)
    {
      int v51 = 0;
      int v111 = 0;
      int v112 = 0;
      **int v32 = 0;
      int v113 = v18;
      uint64_t v52 = v314;
      else {
        int v114 = 0;
      }
      int v342 = 0;
      if (!v18) {
        goto LABEL_108;
      }
      goto LABEL_183;
    }

    if ((v331 & 0x80000000) == 0)
    {
      uint64_t v49 = 0LL;
      do
      {
        uint64_t v50 = 0LL;
        do
          v32[v49][v50++] = -1;
        while (v331 + 1 != v50);
        ++v49;
      }

      while (v49 != v18 + 1);
    }

    int v51 = 0;
    **int v32 = 0;
    uint64_t v52 = a8;
    if (v18 < 1 || v331 < 1)
    {
      int v111 = 0;
      int v112 = 0;
      else {
        int v114 = 0;
      }
      int v113 = v18;
      int v342 = 0;
      if (!v18) {
        goto LABEL_108;
      }
      goto LABEL_183;
    }

    if (!a2)
    {
      int v51 = 0;
      int v111 = 0;
      int v112 = 0;
      int v113 = v18;
      else {
        int v114 = 0;
      }
      int v342 = 0;
      goto LABEL_183;
    }

    uint64_t v53 = 0LL;
    int v320 = 0;
    int v321 = 0;
    uint64_t v54 = 30LL;
    unsigned int v334 = v13;
LABEL_26:
    uint64_t v55 = 0LL;
    uint64_t v56 = (char *)(a2 + 2 * v53);
    uint64_t v328 = v53;
    while (v32[v53][v55] == -1)
    {
LABEL_29:
      if (++v55 == v331)
      {
        if (++v53 != v326) {
          goto LABEL_26;
        }
        int v111 = v321;
        if (v321 >= 1)
        {
          int v112 = 0;
          int v115 = v320;
          do
          {
            sub_1000B33F8((char *)a1, v32[v111][v115], (uint64_t)v336, v339);
            int v116 = sub_1000CC52C((unint64_t)v336);
            v115 -= sub_1000CC52C((unint64_t)v339);
            ++v112;
            BOOL v117 = __OFSUB__(v111, v116);
            v111 -= v116;
          }

          while (!((v111 < 0) ^ v117 | (v111 == 0)));
          uint64_t v52 = v314;
          LODWORD(v12) = v307;
          int v51 = v320;
          int v111 = v321;
          if (v112 >= v307) {
            int v114 = v307;
          }
          else {
            int v114 = v112;
          }
          int v113 = v326 - v321;
          int v342 = v112;
          if (v326 != v321) {
            goto LABEL_183;
          }
LABEL_108:
          int v118 = v111;
          int v332 = 0;
          unsigned int v119 = v114 - 1;
          if (v114 < 1)
          {
LABEL_199:
            sub_1000CB038(v48, 120LL);
            sub_1000CB038(v339, v301);
            sub_1000CB038(v336, v303);
            sub_1000C133C(v323);
            uint64_t v99 = (v332 + v342);
            uint64_t v100 = a7;
            BOOL v101 = (int *)v314;
            int v14 = v309;
            uint64_t v12 = v307;
            unint64_t v102 = (unint64_t)v318;
            int v103 = v307 - v99;
            if (v307 == (_DWORD)v99) {
              goto LABEL_200;
            }
            goto LABEL_79;
          }

uint64_t sub_1000B4E70( uint64_t *a1, unint64_t a2, int a3, unsigned int a4, int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_1000FDCC0) {
    int v190 = *(_DWORD *)(qword_1000FDCC0 + 5508);
  }
  else {
    int v190 = 0;
  }
  int v11 = sub_1000CC52C(a2);
  int v12 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v13 = sub_100082BA4(*a1);
  if (v13 <= v12) {
    int v14 = v12;
  }
  else {
    int v14 = v13;
  }
  int v15 = v14 + 1;
  int v23 = sub_10003982C(*a1) + 1;
  uint64_t v210 = a6;
  if (qword_1000FDCC0) {
    unsigned int v203 = *(_DWORD *)(qword_1000FDCC0 + 5508);
  }
  else {
    unsigned int v203 = 0;
  }
  uint64_t v24 = 2LL * v15;
  uint64_t v25 = (void *)sub_1000CAF58(v24, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v26 = 2LL * v23;
  uint64_t v34 = (_WORD *)sub_1000CAF58(v26, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v42 = (_DWORD *)sub_1000CAF58(4LL * (v11 + 1), v35, v36, v37, v38, v39, v40, v41);
  uint64_t v43 = v42;
  int v201 = a5;
  uint64_t v196 = v26;
  __dst = (void *)v24;
  int v192 = v11;
  uint64_t v194 = 4LL * (v11 + 1);
  if (v11 > 0)
  {
    memset(v42 + 1, 255, 4LL * v11);
    *(_DWORD *)uint64_t v43 = 0;
    if (!a2)
    {
      int v45 = 0;
      int v60 = 0;
      if (a5 <= 0) {
        int v64 = a5;
      }
      else {
        int v64 = 0;
      }
      int v65 = v11;
      goto LABEL_41;
    }

    uint64_t v44 = 0LL;
    int v45 = 0;
    unsigned int v46 = 0;
    uint64_t v47 = v11;
    while (*((_DWORD *)v43 + v44) == -1)
    {
LABEL_13:
      if (++v44 == v47)
      {
        if (v45 < 1)
        {
          int v60 = 0;
        }

        else
        {
          int v60 = 0;
          int v61 = v45;
          do
          {
            sub_1000B33F8((char *)a1, *((_DWORD *)v43 + v61), (uint64_t)v25, v34);
            int v62 = sub_1000CC52C((unint64_t)v25);
            ++v60;
            BOOL v63 = __OFSUB__(v61, v62);
            v61 -= v62;
          }

          while (!((v61 < 0) ^ v63 | (v61 == 0)));
        }

        a5 = v201;
        if (v60 >= v201) {
          int v64 = v201;
        }
        else {
          int v64 = v60;
        }
        int v65 = v192 - v45;
        if (v192 == v45) {
          goto LABEL_53;
        }
LABEL_41:
        if (a3 || v60 < a5)
        {
          int v64 = a5 - 1;
          if (v60 < a5) {
            int v64 = v60;
          }
          uint64_t v66 = 4LL * v64;
          *(_DWORD *)(a7 + v66) = v45;
          *(_DWORD *)(a8 + v66) = v65;
          *(_DWORD *)(v210 + v66) = -1;
        }

        int v67 = 1;
        unsigned int v68 = v64 - 1;
        if (v64 < 1) {
          goto LABEL_63;
        }
LABEL_54:
        if (v60 > v201 && a3 == 0) {
          int v70 = v60 - v201;
        }
        else {
          int v70 = 0;
        }
        do
        {
          while (1)
          {
            unsigned int v72 = *((_DWORD *)v43 + v45);
            sub_1000B33F8((char *)a1, v72, (uint64_t)v25, v34);
            int v73 = sub_1000CC52C((unint64_t)v25);
            v45 -= v73;
            if (v70 >= 1) {
              break;
            }
            uint64_t v71 = 4LL * v68;
            *(_DWORD *)(a7 + v71) = v45;
            *(_DWORD *)(a8 + v71) = v73;
            *(_DWORD *)(v210 + v71) = v72;
            if ((--v68 & 0x80000000) != 0) {
              goto LABEL_63;
            }
          }

          --v70;
        }

        while ((v68 & 0x80000000) == 0);
        goto LABEL_63;
      }
    }

    uint64_t v48 = (_WORD *)(a2 + 2 * v44);
    do
    {
      int v49 = (unsigned __int16)*v48;
      if (!*v48) {
        goto LABEL_13;
      }
      ++v48;
    }

    while (sub_1000CBA60(v49));
    uint64_t v57 = (void *)sub_1000CAF58(4LL, v50, v51, v52, v53, v54, v55, v56);
    int v58 = sub_100082BB4(*a1, a4, 1LL, (char *)(a2 + 2 * v44), (uint64_t)v57, 1LL, v203);
    if (v58 < 1)
    {
      if (!v57)
      {
LABEL_22:
        if (v58)
        {
          sub_1000B33F8((char *)a1, v46, (uint64_t)v25, v34);
          int v59 = sub_1000CC52C((unint64_t)v25) + v44;
          if (*((_DWORD *)v43 + v59) == -1)
          {
            *((_DWORD *)v43 + v59) = v46;
            if (v59 > v45) {
              int v45 = v59;
            }
          }
        }

        goto LABEL_13;
      }
    }

    else
    {
      unsigned int v46 = *(_DWORD *)v57 | 0xC0000000;
    }

    sub_1000CB038(v57, 4LL);
    goto LABEL_22;
  }

  int v45 = 0;
  int v60 = 0;
  _DWORD *v42 = 0;
  if (a5 <= 0) {
    int v64 = a5;
  }
  else {
    int v64 = 0;
  }
  int v65 = v11;
  if (v11) {
    goto LABEL_41;
  }
LABEL_53:
  int v67 = 0;
  unsigned int v68 = v64 - 1;
  if (v64 >= 1) {
    goto LABEL_54;
  }
LABEL_63:
  sub_1000CB038(v43, v194);
  sub_1000CB038(v34, v196);
  sub_1000CB038(v25, (uint64_t)__dst);
  uint64_t v74 = (v67 + v60);
  uint64_t v75 = v201;
  int v76 = v201 - v74;
  if (v201 == (_DWORD)v74)
  {
    if (v190 && *(_DWORD *)(v210 + 4LL * (v201 - 1)) == -1)
    {
      uint64_t v77 = v201 - 1;
      uint64_t v78 = 2LL * (int)(sub_1000CC52C(a2) + 1);
      int v86 = (void *)sub_1000CAF58(v78, v79, v80, v81, v82, v83, v84, v85);
      j__memmove(v86, (const void *)(a2 + 2LL * *(int *)(a7 + 4 * v77)), 2LL * *(int *)(a8 + 4 * v77));
      *((_WORD *)v86 + *(int *)(a8 + 4 * v77)) = 0;
      uint64_t v87 = v86;
      do
      {
        int v88 = (unsigned __int16)*v87;
        if (!*v87)
        {
          unsigned int v90 = -1;
          goto LABEL_101;
        }

        ++v87;
      }

      while (sub_1000CBA60(v88));
      int v89 = sub_100082B9C(*a1);
      unsigned int v90 = v89 | 0xC0000000;
      if (v89 == 0xFFFFFF) {
        unsigned int v90 = -1;
      }
LABEL_101:
      uint64_t v75 = v201;
      *(_DWORD *)(v210 + 4 * v77) = v90;
      sub_1000CB038(v86, v78);
    }

    return v75;
  }

  int v91 = v74 - 1;
  uint64_t v75 = v74;
  uint64_t v191 = v91;
  uint64_t v193 = (unsigned int *)(v210 + 4LL * ((int)v74 - 1));
  uint64_t v92 = 4LL * v91;
  uint64_t v197 = (_DWORD *)(a7 + v92);
  uint64_t v93 = *(int *)(a7 + v92);
  int v94 = (char *)(a2 + 2 * v93);
  unsigned int v204 = sub_1000CC52C((unint64_t)v94);
  int v95 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v96 = sub_100082BA4(*a1);
  if (v96 <= v95) {
    int v97 = v95;
  }
  else {
    int v97 = v96;
  }
  int v98 = v97 + 1;
  int v106 = sub_10003982C(*a1) + 1;
  unsigned int v213 = a1;
  if (qword_1000FDCC0) {
    int v211 = *(_DWORD *)(qword_1000FDCC0 + 5508);
  }
  else {
    int v211 = 0;
  }
  v195 = (signed int *)(a8 + v92);
  int v186 = v76 + 1;
  LODWORD(v92) = v204;
  __dsta = (char *)sub_1000CAF58(2LL * (int)(v204 + 1), v99, v100, v101, v102, v103, v104, v105);
  j__memmove(__dsta, v94, (int)(v204 + 1));
  uint64_t v107 = 2LL * v98;
  int v115 = (void *)sub_1000CAF58(v107, v108, v109, v110, v111, v112, v113, v114);
  uint64_t v116 = 2LL * v106;
  uint64_t v124 = (_WORD *)sub_1000CAF58(v116, v117, v118, v119, v120, v121, v122, v123);
  uint64_t v132 = (char *)sub_1000CAF58(4LL * (int)(v204 + 1), v125, v126, v127, v128, v129, v130, v131);
  uint64_t v133 = v132;
  uint64_t v209 = v132;
  unsigned int v189 = v93;
  uint64_t v187 = v116;
  uint64_t v188 = v107;
  if ((v204 & 0x80000000) != 0)
  {
    char v155 = 0;
    signed int v136 = v204;
    LODWORD(v92) = 0;
    *(_DWORD *)&v132[4 * v204] = 0;
    goto LABEL_113;
  }

  memset(v132, 255, 4LL * (v204 + 1));
  *(_DWORD *)&v133[4 * v204] = 0;
  if (!v204)
  {
    char v155 = 0;
    signed int v136 = 0;
    goto LABEL_112;
  }

  uint64_t v134 = v204;
  if (!a2)
  {
    if (v204 < 0xE || __dsta + 2 < &v209[4 * v204 + 4] && v209 + 4 < &__dsta[2 * v204 + 2])
    {
      uint64_t v157 = v204;
      int v158 = v76 + 1;
      goto LABEL_172;
    }

    uint64_t v157 = v204 & 3;
    __int128 v180 = (int32x2_t *)&v209[4 * v204 - 4];
    uint64_t v181 = &__dsta[2 * v204 - 2];
    uint64_t v182 = v204 & 0xFFFFFFFC;
    int v158 = v76 + 1;
    while (1)
    {
      int32x2_t v183 = vrev64_s32(*v180);
      int32x2_t v184 = v180[-1];
      if ((vmvn_s8((int8x8_t)vceq_s32(v183, (int32x2_t)-1LL)).u8[0] & 1) != 0)
      {
        *((_WORD *)v181 + 1) = 0;
        if ((vmvn_s8((int8x8_t)vceq_s32(v183, (int32x2_t)-1LL)).i32[1] & 1) == 0)
        {
LABEL_162:
          int32x2_t v185 = vrev64_s32(v184);
          goto LABEL_167;
        }
      }

      else if ((vmvn_s8((int8x8_t)vceq_s32(v183, (int32x2_t)-1LL)).i32[1] & 1) == 0)
      {
        goto LABEL_162;
      }

      *(_WORD *)uint64_t v181 = 0;
      int32x2_t v185 = vrev64_s32(v184);
      if ((vmvn_s8((int8x8_t)vceq_s32(v185, (int32x2_t)-1LL)).u8[0] & 1) == 0)
      {
LABEL_163:
        goto LABEL_159;
      }

uint64_t sub_1000B5964( uint64_t *a1, int a2, unint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, _DWORD *a7, _DWORD *a8, char *a9, char *a10, _BYTE *a11)
{
  if (a2 == 1) {
    a2 = sub_100082B94(*a1);
  }
  v448 = a8;
  uint64_t v458 = a6;
  switch(a2)
  {
    case 2:
      v479 = a10;
      v480 = a11;
      uint64_t v16 = a1;
      return sub_1000B7548(v16, a3, a4, a5, a6, a7, (uint64_t)a8, (uint64_t)a9, v479, (uint64_t)v480);
    case 3:
      v478[0] = 0;
      int v18 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
      int v19 = sub_100082BA4(*a1);
      if (v19 <= v18) {
        int v20 = v18;
      }
      else {
        int v20 = v19;
      }
      int v21 = sub_10003982C(*a1);
      int v449 = sub_1000CC52C(a3);
      uint64_t v22 = (unsigned __int8 *)sub_1000597B8(*a1);
      int v455 = a4;
      if (!sub_1000C8AE4(v22, "dede"))
      {
        char v445 = 0;
        uint64_t v38 = L",";
        v459 = (__int16 *)"K";
        v463 = L"Dezimalkomma";
        uint64_t v36 = L"Internetpunkt";
        uint64_t v35 = (char *)L"Punkt";
        goto LABEL_197;
      }

      uint64_t v30 = (unsigned __int8 *)sub_1000597B8(*a1);
      if (!sub_1000C8AE4(v30, "engb"))
      {
        char v445 = 0;
        uint64_t v38 = L".";
        uint64_t v36 = (__int16 *)"d";
        uint64_t v35 = "f";
LABEL_190:
        uint64_t v37 = "d";
        v459 = (__int16 *)"p";
        v463 = (__int16 *)"p";
        goto LABEL_198;
      }

      uint64_t v31 = (unsigned __int8 *)sub_1000597B8(*a1);
      if (!sub_1000C8AE4(v31, "enus"))
      {
        char v445 = 0;
        uint64_t v38 = L".";
        uint64_t v36 = (__int16 *)"d";
        uint64_t v35 = "p";
        goto LABEL_190;
      }

      uint64_t v32 = (unsigned __int8 *)sub_1000597B8(*a1);
      if (!sub_1000C8AE4(v32, "eses"))
      {
        char v445 = 0;
        uint64_t v38 = L",";
        v459 = L"coma";
        char v247 = "c";
LABEL_196:
        v463 = (__int16 *)v247;
        uint64_t v36 = L"punto-internet";
        uint64_t v35 = (char *)L"punto";
        goto LABEL_197;
      }

      uint64_t v33 = (unsigned __int8 *)sub_1000597B8(*a1);
      if (sub_1000C8AE4(v33, "frfr"))
      {
        uint64_t v34 = (unsigned __int8 *)sub_1000597B8(*a1);
        if (sub_1000C8AE4(v34, "itit"))
        {
          uint64_t v35 = 0LL;
          uint64_t v36 = 0LL;
          uint64_t v37 = 0LL;
          v459 = 0LL;
          v463 = 0LL;
          uint64_t v38 = 0LL;
          char v445 = 1;
          goto LABEL_198;
        }

        char v445 = 0;
        uint64_t v38 = L",";
        v459 = L"virgola";
        char v247 = (const char *)&unk_1000F162A;
        goto LABEL_196;
      }

      char v445 = 0;
      uint64_t v38 = L",";
      v459 = (__int16 *)&unk_1000F161A;
      v463 = aVirguleD;
      uint64_t v36 = (__int16 *)"p";
      uint64_t v35 = "p";
LABEL_197:
      uint64_t v37 = v35;
LABEL_198:
      int v248 = v20 + 1;
      int v249 = v21 + 1;
      *a7 = -1;
      v430 = (void *)sub_1000CAF58(2LL * (v449 + 1), v23, v24, v25, v26, v27, v28, v29);
      uint64_t v250 = 2LL * v248;
      v475 = (void *)sub_1000CAF58(v250, v251, v252, v253, v254, v255, v256, v257);
      v469 = (_WORD *)sub_1000CAF58(2LL * v249, v258, v259, v260, v261, v262, v263, v264);
      unint64_t v472 = sub_1000CAF58(120LL, v265, v266, v267, v268, v269, v270, v271);
      v434 = v38;
      uint64_t v427 = v250;
      uint64_t v428 = 2LL * (v449 + 1);
      uint64_t v426 = 2LL * v249;
      if (sub_1000CBA60(46))
      {
        int v432 = -1;
        int v279 = -1;
        int v280 = -1;
        goto LABEL_203;
      }

      unint64_t v391 = sub_1000CAF58(120LL, v272, v273, v274, v275, v276, v277, v278);
      int v392 = sub_100082CF0(*a1);
      if (v392 >= 1)
      {
        unsigned int v393 = v392;
        uint64_t v394 = 0LL;
        if (v392 >= 30) {
          uint64_t v395 = 30LL;
        }
        else {
          uint64_t v395 = v392;
        }
        if (v395 < 8)
        {
          unint64_t v396 = v472;
        }

        else
        {
          unint64_t v396 = v472;
          if (v472 - v391 >= 0x20)
          {
            uint64_t v394 = v395 & 0x18;
            *(void *)&__int128 v397 = __PAIR64__(HIDWORD(*(void *)v391), *(_OWORD *)v391) | 0xC0000000C0000000LL;
            DWORD2(v397) = *(void *)(v391 + 8) | 0xC0000000;
            HIDWORD(v397) = HIDWORD(*(_OWORD *)v391) | 0xC0000000;
            unsigned __int128 v398 = *(_OWORD *)(v391 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)unint64_t v472 = v397;
            *(_OWORD *)(v472 + 16) = v398;
            if ((v395 & 0xFFFFFFF8) != 8)
            {
              unsigned __int128 v399 = *(_OWORD *)(v391 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v472 + 32) = *(_OWORD *)(v391 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              *(_OWORD *)(v472 + 48) = v399;
              if (v394 != 16)
              {
                unsigned __int128 v400 = *(_OWORD *)(v391 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
                *(_OWORD *)(v472 + 64) = *(_OWORD *)(v391 + 64) | __PAIR128__( 0xC0000000C0000000LL,  0xC0000000C0000000LL);
                *(_OWORD *)(v472 + 80) = v400;
              }
            }

            if (v394 == v395) {
              goto LABEL_409;
            }
          }
        }

        uint64_t v401 = v395 - v394;
        uint64_t v402 = 4 * v394;
        v403 = (unsigned int *)(v396 + 4 * v394);
        v404 = (int *)(v391 + v402);
        do
        {
          int v405 = *v404++;
          *v403++ = v405 | 0xC0000000;
          --v401;
        }

        while (v401);
LABEL_409:
        sub_1000CB038((void *)v391, 120LL);
        unint64_t v406 = v472;
        uint64_t v407 = v393 + 1LL;
        int v280 = -1;
        int v279 = -1;
        int v432 = -1;
        uint64_t v38 = v434;
        while (1)
        {
          while (1)
          {
            uint64_t v409 = (v407 - 2);
            sub_1000B33F8((char *)a1, *(_DWORD *)(v406 + 4LL * v409), (uint64_t)v475, v469);
            int v432 = *(_DWORD *)(v472 + 4 * v409);
LABEL_416:
            int v410 = sub_1000CCE40(v469, v37);
            unint64_t v406 = v472;
            if (v410) {
              goto LABEL_411;
            }
LABEL_417:
            int v280 = *(_DWORD *)(v406 + 4 * v409);
          }

LABEL_359:
              v478[0] = v362 + 1;
              uint64_t v178 = v361
                   + sub_1000B8998( a1,  (uint64_t)(v462 + 1),  ((unint64_t)v462 - a3 + 2) >> 1,  (unint64_t)(v296 * 2 + 2) >> 1,  v455,  v313,  (uint64_t)a7,  v359,  v360,  0LL,  (uint64_t)a11,  v478,  1)
                   + 1;
              uint64_t v286 = v452;
              uint64_t v38 = v434;
              continue;
            }
          }

          break;
        }

LABEL_251:
        unint64_t v318 = ((unint64_t)&v462[v288 / 0xFFFFFFFFFFFFFFFELL + 1] - v286) >> 1;
        int v319 = (_WORD *)(v286 + v288 - 2);
        int v443 = v318;
        do
        {
          int v320 = (unsigned __int16)*v319;
          if (!*v319)
          {
            BOOL v338 = 0;
            LODWORD(v339) = v318;
            unint64_t v340 = (v437 + v286 + v288) >> 1;
            if (!v446) {
              goto LABEL_281;
            }
            goto LABEL_266;
          }

          ++v319;
        }

        while (sub_1000CBA60(v320));
        unint64_t v328 = sub_1000CAF58(120LL, v321, v322, v323, v324, v325, v326, v327);
        int v329 = sub_100082BB4(*a1, 0LL, v318, (char *)(v286 + v288 - 2), v328, 30LL, 0LL);
        if (v329 < 1)
        {
          if (v328) {
            sub_1000CB038((void *)v328, 120LL);
          }
          BOOL v338 = 0;
          LODWORD(v339) = v318;
          uint64_t v38 = v434;
          unint64_t v340 = (v437 + v286 + v288) >> 1;
          if (!v446) {
            goto LABEL_281;
          }
          goto LABEL_266;
        }

        unsigned int v330 = v329;
        uint64_t v331 = 0LL;
        if (v329 >= 30) {
          uint64_t v332 = 30LL;
        }
        else {
          uint64_t v332 = v329;
        }
        if (v332 < 8)
        {
          unint64_t v333 = v472;
LABEL_283:
          uint64_t v343 = v332 - v331;
          uint64_t v344 = 4 * v331;
          v345 = (unsigned int *)(v333 + 4 * v331);
          int v346 = (int *)(v328 + v344);
          do
          {
            int v347 = *v346++;
            *v345++ = v347 | 0xC0000000;
            --v343;
          }

          while (v343);
          goto LABEL_285;
        }

        unint64_t v333 = v472;
        if (v472 - v328 < 0x20) {
          goto LABEL_283;
        }
        uint64_t v331 = v332 & 0x18;
        *(void *)&__int128 v334 = __PAIR64__(HIDWORD(*(void *)v328), *(_OWORD *)v328) | 0xC0000000C0000000LL;
        DWORD2(v334) = *(void *)(v328 + 8) | 0xC0000000;
        HIDWORD(v334) = HIDWORD(*(_OWORD *)v328) | 0xC0000000;
        unsigned __int128 v335 = *(_OWORD *)(v328 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
        *(_OWORD *)unint64_t v472 = v334;
        *(_OWORD *)(v472 + 16) = v335;
        if ((v332 & 0xFFFFFFF8) != 8)
        {
          unsigned __int128 v336 = *(_OWORD *)(v328 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
          *(_OWORD *)(v472 + 32) = *(_OWORD *)(v328 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
          *(_OWORD *)(v472 + 48) = v336;
          if (v331 != 16)
          {
            unsigned __int128 v337 = *(_OWORD *)(v328 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v472 + 64) = *(_OWORD *)(v328 + 64) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            *(_OWORD *)(v472 + 80) = v337;
          }
        }

        if (v331 != v332) {
          goto LABEL_283;
        }
LABEL_285:
        sub_1000CB038((void *)v328, 120LL);
        if (v330 != 30)
        {
          BOOL v453 = 0;
          uint64_t v348 = v330 + 1LL;
          int v349 = -1;
          unint64_t v339 = ((unint64_t)&v462[v288 / 0xFFFFFFFFFFFFFFFELL + 1] - v286) >> 1;
          unint64_t v350 = v472;
          while (2)
          {
            unint64_t v351 = v339;
            uint64_t v352 = (v348 - 2);
            sub_1000B33F8((char *)a1, *(_DWORD *)(v350 + 4LL * v352), (uint64_t)v475, v469);
            unint64_t v353 = sub_1000CC52C((unint64_t)v475);
            if ((int)v353 < (int)v339
              || (unint64_t v339 = v353,
                  memset(v477, 0, sizeof(v477)),
                  sub_1000CC1FC( *(unsigned __int16 *)(v286 + 2LL * ((int)v353 - 1) + v288 - 2),  0,  0LL,  0LL,  (unsigned int *)&v477[8],  0LL,  0LL,  &v477[4],  v477,  0LL,  0LL),  *(void *)v477)
              && (sub_1000CC1FC( *(unsigned __int16 *)(v286 + 2LL * (int)v339 + v288 - 2),  0,  0LL,  0LL,  (unsigned int *)&v477[8],  0LL,  0LL,  &v477[4],  v477,  0LL,  0LL),  *(void *)v477))
            {
              unint64_t v339 = v351;
              unint64_t v350 = v472;
              goto LABEL_288;
            }

            int v354 = sub_1000CD3EC((_WORD *)(v286 + v288 - 2), v475, v339);
            unint64_t v350 = v472;
            if ((_DWORD)v339 != (_DWORD)v351)
            {
              unint64_t v339 = v351;
              goto LABEL_288;
            }

            if (v453 && v354)
            {
              BOOL v453 = 1;
              unint64_t v339 = v351;
            }

            else
            {
LABEL_299:
              int v349 = *(_DWORD *)(v472 + 4 * v352);
              BOOL v453 = v354 == 0;
            }

LABEL_159:
                  goto LABEL_162;
                }
              }
            }

            uint64_t v209 = v199 - v198;
            uint64_t v210 = 4 * v198;
            int v211 = (unsigned int *)(v200 + 4 * v198);
            int v212 = (int *)(v195 + v210);
            do
            {
              int v213 = *v212++;
              *v211++ = v213 | 0xC0000000;
              --v209;
            }

            while (v209);
            goto LABEL_139;
          }

          if (v195) {
            sub_1000CB038((void *)v195, 120LL);
          }
LABEL_119:
          LOBYTE(v205) = 0;
          LODWORD(v148) = 0;
        }

        else
        {
          LOBYTE(v205) = 0;
        }

        int v206 = -1;
LABEL_121:
        a6 = v458;
        else {
          int v208 = 0;
        }
        if (v208 < (int)v458)
        {
          a7[v208] = v206;
          if (v448) {
            v448[v208] = (v429 + v179) >> 1;
          }
          if (a9) {
            *(_DWORD *)&a9[4 * v208] = v185;
          }
          if (v431) {
            *(_DWORD *)(v431 + 4LL * v208) = (_DWORD)v148;
          }
          if (a11) {
            a11[v208] = v205;
          }
        }

        int v177 = v208 + 1;
        uint64_t v178 = (v465 + 1);
        uint64_t v148 = v461;
        continue;
      }

    default:
      return 0LL;
  }

uint64_t sub_1000B7548( uint64_t *a1, unint64_t a2, int a3, unsigned int a4, uint64_t a5, _DWORD *a6, uint64_t a7, uint64_t a8, char *a9, uint64_t a10)
{
  *(void *)uint64_t v128 = 0LL;
  *a6 = -1;
  uint64_t v12 = (int)a5;
  if (a9) {
    bzero(a9, (int)a5);
  }
  int v13 = sub_1000CC52C(a2);
  unint64_t v14 = a2;
  int v15 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v16 = sub_100082BA4(*a1);
  if (v16 <= v15) {
    int v17 = v15;
  }
  else {
    int v17 = v16;
  }
  if (v17 <= v13) {
    int v17 = v13;
  }
  int v18 = v17 + 1;
  int v19 = sub_10003982C(*a1) + 1;
  uint64_t v106 = 2LL * v18;
  uint64_t v27 = (_WORD *)sub_1000CAF58(v106, v20, v21, v22, v23, v24, v25, v26);
  uint64_t v28 = 2LL * v19;
  uint64_t v29 = v14;
  uint64_t v105 = v28;
  uint64_t v37 = (_WORD *)sub_1000CAF58(v28, v30, v31, v32, v33, v34, v35, v36);
  unint64_t v45 = sub_1000CAF58(120LL, v38, v39, v40, v41, v42, v43, v44);
  uint64_t v104 = 4 * v12;
  unint64_t v111 = sub_1000CAF58(4 * v12, v46, v47, v48, v49, v50, v51, v52);
  uint64_t v53 = 0LL;
  uint64_t v112 = -2 - v29;
  int v119 = a1;
  while (1)
  {
    unint64_t v55 = 0LL;
    uint64_t v127 = 0LL;
    do
    {
      int v56 = sub_1000CBA60(*(unsigned __int16 *)(v29 + v55));
      v55 += 2LL;
    }

    while (v56);
    uint64_t v57 = (unsigned __int16 *)(v29 + v55 - 2);
    if (!*v57) {
      break;
    }
    v128[0] = 0;
    int v118 = (char *)(v29 + v55 - 2);
    if (*v57)
    {
      uint64_t v126 = 0LL;
      int v125 = 0;
      sub_1000CC1FC(*v57, 0, 0LL, 0LL, (unsigned int *)&v125, 0LL, 0LL, (_DWORD *)&v126 + 1, &v126, 0LL, 0LL);
      uint64_t v57 = (unsigned __int16 *)(v29 + v55 - 2);
      int v58 = v125;
      v128[0] = v125;
      uint64_t v127 = v126;
      uint64_t v59 = v57;
      int v121 = v57;
      if (v126)
      {
        if (*(_WORD *)(v29 + v55))
        {
          uint64_t v59 = (unsigned __int16 *)(v29 + v55);
          do
          {
            uint64_t v126 = 0LL;
            int v125 = 0;
            sub_1000CC1FC(*v59, v58, 0LL, 0LL, (unsigned int *)&v125, 0LL, 0LL, (_DWORD *)&v126 + 1, &v126, 0LL, 0LL);
            int v58 = v125;
            if (v125 != v128[0]) {
              break;
            }
            if (v126 != v127) {
              break;
            }
            int v60 = v59[1];
            ++v59;
          }

          while (v60);
          int v121 = v59 - 1;
          uint64_t v57 = (unsigned __int16 *)(v29 + v55 - 2);
        }

        else
        {
          uint64_t v59 = (unsigned __int16 *)(v29 + v55);
          int v121 = (unsigned __int16 *)(v29 + v55 - 2);
        }
      }
    }

    else
    {
      int v121 = 0LL;
      uint64_t v59 = (unsigned __int16 *)(v29 + v55 - 2);
    }

    uint64_t v122 = v29;
    uint64_t v123 = ((uint64_t)&v59[(v57 == v59) + 1 + v55 / 0xFFFFFFFFFFFFFFFELL] - v29) >> 1;
    uint64_t v61 = v57;
    do
    {
      int v62 = *v61;
      if (!*v61) {
        goto LABEL_59;
      }
      ++v61;
    }

    while (sub_1000CBA60(v62));
    unint64_t v70 = sub_1000CAF58(120LL, v63, v64, v65, v66, v67, v68, v69);
    int v71 = sub_100082BB4(*a1, a4, v123, v118, v70, 30LL, 0LL);
    if (v71 < 1)
    {
      if (v70) {
        sub_1000CB038((void *)v70, 120LL);
      }
LABEL_59:
      LOBYTE(v116) = 0;
      int v117 = -1;
      unsigned int v115 = v128[0];
      int v85 = v123;
      goto LABEL_60;
    }

    unsigned int v72 = v71;
    uint64_t v73 = 0LL;
    if (v71 >= 30) {
      uint64_t v74 = 30LL;
    }
    else {
      uint64_t v74 = v71;
    }
    uint64_t v73 = v74 & 0x18;
    *(void *)&__int128 v75 = __PAIR64__(HIDWORD(*(void *)v70), *(_OWORD *)v70) | 0xC0000000C0000000LL;
    DWORD2(v75) = *(void *)(v70 + 8) | 0xC0000000;
    HIDWORD(v75) = HIDWORD(*(_OWORD *)v70) | 0xC0000000;
    unsigned __int128 v76 = *(_OWORD *)(v70 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
    *(_OWORD *)unint64_t v45 = v75;
    *(_OWORD *)(v45 + 16) = v76;
    if ((v74 & 0xFFFFFFF8) != 8)
    {
      unsigned __int128 v77 = *(_OWORD *)(v70 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
      *(_OWORD *)(v45 + 32) = *(_OWORD *)(v70 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
      *(_OWORD *)(v45 + 48) = v77;
      if (v73 != 16)
      {
        unsigned __int128 v78 = *(_OWORD *)(v70 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
        *(_OWORD *)(v45 + 64) = *(_OWORD *)(v70 + 64) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
        *(_OWORD *)(v45 + 80) = v78;
      }
    }

    if (v73 != v74)
    {
LABEL_37:
      uint64_t v79 = v74 - v73;
      uint64_t v80 = 4 * v73;
      unint64_t v81 = (unsigned int *)(v45 + 4 * v73);
      uint64_t v82 = (int *)(v70 + v80);
      do
      {
        int v83 = *v82++;
        *v81++ = v83 | 0xC0000000;
        --v79;
      }

      while (v79);
    }

    sub_1000CB038((void *)v70, 120LL);
    if (v72 == 30)
    {
      uint64_t v53 = 0LL;
      break;
    }

    BOOL v116 = 0;
    uint64_t v84 = v72;
    int v117 = -1;
    int v120 = v128[0];
    unsigned int v115 = v128[0];
    int v85 = v123;
    do
    {
      uint64_t v126 = 0LL;
      int v125 = 0;
      sub_1000B33F8((char *)a1, *(_DWORD *)(v45 + 4LL * (v84 - 1)), (uint64_t)v27, v37);
      int v87 = sub_1000CC52C((unint64_t)v27);
      if (v87 >= v85)
      {
        int v88 = v87;
        int v124 = v85;
        unint64_t v89 = v45;
        uint64_t v90 = v37;
        sub_1000CC1FC(*v121, v120, 0LL, 0LL, v128, 0LL, 0LL, (_DWORD *)&v127 + 1, &v127, 0LL, 0LL);
        unsigned __int16 v91 = v27[v123];
        if (v91)
        {
          uint64_t v92 = &v27[v123 + 1];
          do
          {
            sub_1000CC1FC(v91, v128[0], 0LL, 0LL, v128, 0LL, 0LL, (_DWORD *)&v127 + 1, &v127, 0LL, 0LL);
            int v93 = *v92++;
            unsigned __int16 v91 = v93;
          }

          while (v93);
        }

        sub_1000CC1FC( *(unsigned __int16 *)(v122 + 2LL * v88 + v55 - 2),  v128[0],  0LL,  0LL,  (unsigned int *)&v125,  0LL,  0LL,  (_DWORD *)&v126 + 1,  &v126,  0LL,  0LL);
        if (sub_1000CBA60((unsigned __int16)v27[v88 - 1]) || v128[0] == v125 && v127 && v127 == v126)
        {
          uint64_t v37 = v90;
          unint64_t v45 = v89;
          a1 = v119;
          int v85 = v124;
        }

        else
        {
          int v94 = sub_1000CD3EC(v118, v27, v88);
          uint64_t v37 = v90;
          unint64_t v45 = v89;
          a1 = v119;
          int v85 = v124;
          if (v117 == -1 || v88 > v124 || v88 == v124 && !v116 && !v94)
          {
            int v117 = *(_DWORD *)(v45 + 4LL * (v84 - 1));
            unsigned int v115 = v128[0];
            BOOL v116 = v94 == 0;
            int v85 = v88;
          }
        }
      }
    }

    while (v84-- > 1);
LABEL_60:
    unint64_t v95 = (v112 + v122 + v55) >> 1;
    if (v117 == -1 && HIDWORD(v127))
    {
      int v54 = sub_1000B8998(a1, (uint64_t)v118, v95, v123, a3, a5, (uint64_t)a6, a7, a8, v111, a10, (int *)&v128[1], 1);
    }

    else
    {
      int v96 = v128[1];
      if (v96 < (int)a5)
      {
        a6[v96] = v117;
        if (a7) {
          *(_DWORD *)(a7 + 4LL * v96) = v95;
        }
        if (a8) {
          *(_DWORD *)(a8 + 4LL * v96) = v85;
        }
        if (v111) {
          *(_DWORD *)(v111 + 4LL * v96) = v115;
        }
        if (a10) {
          *(_BYTE *)(a10 + v96) = v116;
        }
      }

      v128[1] = v96 + 1;
      int v54 = 1;
    }

    uint64_t v53 = (v54 + v53);
    uint64_t v29 = v122 + 2LL * v85 + v55 - 2;
  }

  int v98 = (void *)v111;
  if ((int)v53 > (int)a5 && a3 && (int)v128[1] < (int)a5)
  {
    sub_1000B8B64(a5, (uint64_t)a6, a7, a8, v111, a10, v128[1]);
    int v98 = (void *)v111;
  }

  if (a9)
  {
    uint64_t v99 = (int)v53 >= (int)a5 ? a5 : v53;
    if ((int)v99 >= 2)
    {
      uint64_t v100 = (_DWORD *)v98 + 1;
      uint64_t v101 = a9 + 1;
      uint64_t v102 = v99 - 1;
      do
      {
        if (*(v100 - 1) != *v100) {
          *v101 |= 8u;
        }
        ++v100;
        ++v101;
        --v102;
      }

      while (v102);
    }
  }

  sub_1000CB038(v98, v104);
  sub_1000CB038((void *)v45, 120LL);
  sub_1000CB038(v37, v105);
  sub_1000CB038(v27, v106);
  return v53;
}

uint64_t sub_1000B7CC8( uint64_t *a1, unint64_t a2, int a3, int a4, unsigned int a5, uint64_t a6, _DWORD *a7, uint64_t a8, uint64_t a9, char *a10, uint64_t a11)
{
  v243[0] = 0;
  *a7 = -1;
  if (a10) {
    bzero(a10, (int)a6);
  }
  int v14 = sub_1000CC52C(a2);
  if (!v14) {
    return 0LL;
  }
  int v15 = v14;
  uint64_t v217 = a8;
  int v16 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v17 = sub_100082BA4(*a1);
  if (v17 <= v16) {
    int v18 = v16;
  }
  else {
    int v18 = v17;
  }
  if (v18 <= v15) {
    int v18 = v15;
  }
  int v220 = v18;
  int v19 = v18 + 1;
  int v20 = sub_10003982C(*a1) + 1;
  uint64_t v209 = 2LL * v19;
  int v239 = (_WORD *)sub_1000CAF58(v209, v21, v22, v23, v24, v25, v26, v27);
  uint64_t v208 = 2LL * v20;
  int v241 = (_WORD *)sub_1000CAF58(v208, v28, v29, v30, v31, v32, v33, v34);
  unint64_t v42 = sub_1000CAF58(120LL, v35, v36, v37, v38, v39, v40, v41);
  uint64_t v212 = a6;
  uint64_t v207 = 4LL * (int)a6;
  int v211 = (void *)sub_1000CAF58(v207, v43, v44, v45, v46, v47, v48, v49);
  uint64_t v57 = (unsigned int *)sub_1000CAF58(4LL * v15, v50, v51, v52, v53, v54, v55, v56);
  uint64_t v65 = (_DWORD *)sub_1000CAF58(4LL * v15, v58, v59, v60, v61, v62, v63, v64);
  uint64_t v73 = (_DWORD *)sub_1000CAF58(4LL * v15, v66, v67, v68, v69, v70, v71, v72);
  unint64_t v81 = (_DWORD *)sub_1000CAF58(4LL * v15, v74, v75, v76, v77, v78, v79, v80);
  uint64_t v206 = 4LL * v15;
  unint64_t v89 = (_DWORD *)sub_1000CAF58(v206, v82, v83, v84, v85, v86, v87, v88);
  uint64_t v90 = *(unsigned __int16 *)a2;
  uint64_t v91 = (v15 - 1);
  unint64_t v216 = a2;
  int v236 = v57;
  uint64_t v228 = v73;
  uint64_t v229 = v65;
  int v215 = v81;
  uint64_t v222 = v89;
  int v232 = v15;
  if (v15 <= 1)
  {
    sub_1000CC1FC(v90, 0, 0LL, 0LL, v57, 0LL, 0LL, v65, v73, v81, v89);
  }

  else
  {
    sub_1000CC1FC(v90, 0, 0LL, *(unsigned __int16 *)(a2 + 2), v57, 0LL, 0LL, v65, v73, v81, v89);
    unsigned int v92 = v15 - 2;
    int v93 = v81;
    if (v92)
    {
      unint64_t v95 = v89 + 1;
      unint64_t v96 = a2;
      unint64_t v97 = (_DWORD *)v93 + 1;
      int v98 = v73 + 1;
      uint64_t v99 = v65 + 1;
      uint64_t v100 = v57 + 1;
      uint64_t v101 = v91 - 1;
      uint64_t v102 = (unsigned __int16 *)(v96 + 2);
      do
      {
        uint64_t v103 = *v102;
        uint64_t v104 = *(v102 - 1);
        unsigned int v105 = v102[1];
        ++v102;
        sub_1000CC1FC(v103, *(v100 - 1), v104, v105, v100, 0LL, 0LL, v99++, v98++, v97++, v95++);
        ++v100;
        --v101;
      }

      while (v101);
      int v93 = v215;
      a2 = v216;
      unint64_t v89 = v222;
    }

    else
    {
      uint64_t v91 = 1LL;
    }

    sub_1000CC1FC( *(unsigned __int16 *)(a2 + 2 * v91),  v236[v92],  *(unsigned __int16 *)(a2 + 2LL * v92),  0LL,  &v236[v91],  0LL,  0LL,  (_DWORD *)v229 + v91,  (_DWORD *)v228 + v91,  (_DWORD *)v93 + v91,  &v89[v91]);
  }

  unint64_t v106 = (unint64_t)v239;
  int v107 = 0;
  unsigned int v214 = 0;
  uint64_t v108 = a2;
  unint64_t v230 = -2LL - a2;
  int v210 = -1;
  int v240 = (_OWORD *)v42;
  while (1)
  {
    unint64_t v109 = 0LL;
    uint64_t v110 = v108;
    int v237 = v107;
    unint64_t v111 = &_mh_execute_header + 0x4000000 * a2 + -67108864 * v108;
    uint64_t v112 = (char *)(0xFFFFFFFF80000000LL * a2 + (v108 << 31));
    uint64_t v113 = 2 - a2 + v108;
    do
    {
      uint64_t v114 = (uint64_t)v112;
      uint64_t v115 = v113;
      int v116 = sub_1000CBA60(*(unsigned __int16 *)(v108 + v109));
      v109 += 2LL;
      v111 -= 0x8000000;
      uint64_t v112 = (char *)&_mh_execute_header + v114;
      uint64_t v113 = v115 + 2;
    }

    while (v116);
    int v117 = (_WORD *)(v108 + v109);
    uint64_t v108 = v108 + v109 - 2;
    if (!*(_WORD *)(v110 + v109 - 2)) {
      break;
    }
    uint64_t v225 = v230 + v110 + v109;
    uint64_t v118 = v225 >> 1;
    uint64_t v119 = -(uint64_t)v111 >> 32;
    uint64_t v231 = v119;
    if (!v237)
    {
      int v120 = sub_1000CB0C4(v236[v119]);
      uint64_t v118 = v225 >> 1;
      uint64_t v108 = v110 + v109 - 2;
      uint64_t v119 = -(uint64_t)v111 >> 32;
      if (!v120)
      {
        uint64_t v233 = &v236[v118];
        unint64_t v125 = 1LL;
LABEL_35:
        uint64_t v234 = v118;
        unsigned int v127 = *v233;
        uint64_t v128 = (_WORD *)v108;
        do
        {
          int v129 = (unsigned __int16)*v128;
          if (!*v128) {
            goto LABEL_72;
          }
          ++v128;
        }

        while (sub_1000CBA60(v129));
        unsigned int v224 = v127;
        unint64_t v137 = sub_1000CAF58(120LL, v130, v131, v132, v133, v134, v135, v136);
        int v138 = sub_100082BB4(*a1, a5, v125, (char *)v108, v137, 30LL, 1LL);
        if (v138 < 1)
        {
          int v126 = v125;
          if (v137)
          {
            sub_1000CB038((void *)v137, 120LL);
LABEL_72:
            int v126 = v125;
          }

LABEL_118:
      v243[0] = v160 + 1;
      unsigned int v159 = v214 + 1;
      goto LABEL_119;
    }

    if (a9) {
      *(_DWORD *)(a9 + 4 * v161) += v125;
    }
LABEL_120:
    int v210 = v158 + v126 - 1;
    int v107 = v237;
    if (a3) {
      int v107 = 1;
    }
    uint64_t v108 = v110 + 2LL * v126 + v109 - 2;
  }

  uint64_t v94 = v214;
  uint64_t v168 = a9;
  else {
    uint64_t v169 = v214;
  }
  uint64_t v238 = v169;
  if ((int)v169 >= 1)
  {
    uint64_t v170 = 0LL;
    while (1)
    {
      uint64_t v171 = *(int *)(v168 + 4 * v170);
      if ((int)v171 <= v220)
      {
        uint64_t v174 = (_WORD *)(v216 + 2LL * *(int *)(v217 + 4 * v170));
        uint64_t v175 = v239;
        sub_1000CC5F0((uint64_t)v239, (uint64_t)v174, v171);
        v239[v171] = 0;
        do
        {
          int v176 = (unsigned __int16)*v175;
          if (!*v175)
          {
            LOBYTE(v172) = 0;
            int v173 = -1;
            unint64_t v42 = (unint64_t)v240;
            goto LABEL_160;
          }

          ++v175;
        }

        while (sub_1000CBA60(v176));
        unint64_t v184 = sub_1000CAF58(120LL, v177, v178, v179, v180, v181, v182, v183);
        int v185 = sub_100082CF0(*a1);
        unint64_t v42 = (unint64_t)v240;
        if (v185 >= 1)
        {
          unsigned int v186 = v185;
          uint64_t v187 = 0LL;
          if (v185 >= 30) {
            uint64_t v188 = 30LL;
          }
          else {
            uint64_t v188 = v185;
          }
          uint64_t v187 = v188 & 0x18;
          *(void *)&__int128 v189 = __PAIR64__(HIDWORD(*(void *)v184), *(_OWORD *)v184) | 0xC0000000C0000000LL;
          DWORD2(v189) = *(void *)(v184 + 8) | 0xC0000000;
          HIDWORD(v189) = HIDWORD(*(_OWORD *)v184) | 0xC0000000;
          unsigned __int128 v190 = *(_OWORD *)(v184 + 16) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
          *int v240 = v189;
          v240[1] = v190;
          if ((v188 & 0xFFFFFFF8) != 8)
          {
            unsigned __int128 v191 = *(_OWORD *)(v184 + 48) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            v240[2] = *(_OWORD *)(v184 + 32) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
            v240[3] = v191;
            if (v187 != 16)
            {
              unsigned __int128 v192 = *(_OWORD *)(v184 + 80) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              v240[4] = *(_OWORD *)(v184 + 64) | __PAIR128__(0xC0000000C0000000LL, 0xC0000000C0000000LL);
              v240[5] = v192;
            }
          }

          if (v187 != v188)
          {
LABEL_148:
            uint64_t v193 = v188 - v187;
            uint64_t v194 = 4 * v187;
            unint64_t v195 = (unsigned int *)v240 + v187;
            int v196 = (int *)(v184 + v194);
            do
            {
              int v197 = *v196++;
              *v195++ = v197 | 0xC0000000;
              --v193;
            }

            while (v193);
          }

          sub_1000CB038((void *)v184, 120LL);
          BOOL v198 = 0;
          BOOL v172 = 0;
          unint64_t v199 = v186 + 1LL;
          int v173 = -1;
          do
          {
            uint64_t v200 = (v199 - 2);
            sub_1000B33F8((char *)a1, *(_DWORD *)(v42 + 4LL * v200), (uint64_t)v239, v241);
            unint64_t v42 = (unint64_t)v240;
            int v201 = sub_1000CD3EC(v174, v239, v171);
            if (v173 == -1 || !(v172 | v201) || v172 == (v201 == 0) && !v198 && !*v241)
            {
              int v173 = *((_DWORD *)v240 + v200);
              BOOL v172 = v201 == 0;
              BOOL v198 = *v241 == 0;
            }

            --v199;
          }

          while (v199 > 1);
          goto LABEL_160;
        }

        if (v184) {
          sub_1000CB038((void *)v184, 120LL);
        }
      }

      LOBYTE(v172) = 0;
      int v173 = -1;
LABEL_160:
      a7[v170] = v173;
      if (a11) {
        *(_BYTE *)(a11 + v170) = v172;
      }
      ++v170;
      uint64_t v168 = a9;
      if (v170 == v238)
      {
        uint64_t v94 = v214;
        if (a10 && (int)v238 >= 2)
        {
          unsigned __int128 v202 = (_DWORD *)v211 + 1;
          unsigned __int128 v203 = a10 + 1;
          uint64_t v204 = v238 - 1;
          do
          {
            if (*(v202 - 1) != *v202) {
              *v203 |= 8u;
            }
            ++v202;
            ++v203;
            --v204;
          }

          while (v204);
        }

        break;
      }
    }
  }

  sub_1000CB038(v222, v206);
  sub_1000CB038(v215, v206);
  sub_1000CB038(v228, v206);
  sub_1000CB038(v229, v206);
  sub_1000CB038(v236, v206);
  sub_1000CB038(v211, v207);
  sub_1000CB038((void *)v42, 120LL);
  sub_1000CB038(v241, v208);
  sub_1000CB038(v239, v209);
  return v94;
}

uint64_t sub_1000B8938( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int *a7, int a8, int a9, int a10, int a11, int a12, char a13)
{
  int v13 = *a7;
  if (v13 < (int)result)
  {
    *(_DWORD *)(a2 + 4LL * v13) = a9;
    if (a3) {
      *(_DWORD *)(a3 + 4LL * v13) = a10;
    }
    if (a4) {
      *(_DWORD *)(a4 + 4LL * v13) = a11;
    }
    if (a5) {
      *(_DWORD *)(a5 + 4LL * v13) = a12;
    }
    if (a6) {
      *(_BYTE *)(a6 + v13) = a13;
    }
  }

  *a7 = v13 + 1;
  return result;
}

uint64_t sub_1000B8998( uint64_t *a1, uint64_t a2, int a3, int a4, int a5, int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int *a12, int a13)
{
  if (a4 >= 1)
  {
    uint64_t v15 = 0LL;
    uint64_t v16 = a4;
    while (1)
    {
      int v41 = 0;
      LOWORD(v41) = *(_WORD *)(a2 + 2 * v15);
      LOWORD(v19) = v41;
      if ((_WORD)v41)
      {
        uint64_t v20 = a9;
        uint64_t v21 = a10;
        uint64_t v22 = 2LL;
        while (sub_1000CBA60((unsigned __int16)v19))
        {
          int v19 = *(unsigned __int16 *)((char *)&v41 + v22);
          v22 += 2LL;
          if (!v19)
          {
            unsigned int v30 = -1;
            a10 = v21;
            a9 = v20;
            goto LABEL_14;
          }
        }

        uint64_t v31 = (void *)sub_1000CAF58(4LL, v23, v24, v25, v26, v27, v28, v29);
        if ((int)sub_100082CF0(*a1) >= 1)
        {
          unsigned int v30 = *(_DWORD *)v31 | 0xC0000000;
LABEL_13:
          sub_1000CB038(v31, 4LL);
          a9 = v20;
          a10 = v21;
          goto LABEL_14;
        }

        unsigned int v30 = -1;
        a10 = v21;
        a9 = v20;
        if (v31) {
          goto LABEL_13;
        }
      }

      else
      {
        unsigned int v30 = -1;
      }

uint64_t sub_1000B8B64(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7)
{
  if ((int)result >= 1)
  {
    uint64_t v7 = 0LL;
    int v8 = 0;
    char v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    LODWORD(v13) = a7;
    do
    {
      if (a3) {
        int v12 = *(_DWORD *)(a3 + 4 * v7);
      }
      if (a4) {
        int v11 = *(_DWORD *)(a4 + 4 * v7);
      }
      if (a5) {
        int v10 = *(_DWORD *)(a5 + 4 * v7);
      }
      if (a6) {
        char v9 = *(_BYTE *)(a6 + v7);
      }
      int v14 = *(_DWORD *)(a2 + 4 * v7);
      if (v7 == v13)
      {
        uint64_t v15 = (int)v7;
      }

      else
      {
        if (a3)
        {
          int v16 = v7;
          if (a4)
          {
            do
            {
              uint64_t v15 = (int)v13;
              uint64_t v18 = 4LL * (int)v13;
              uint64_t v19 = v16;
              uint64_t v20 = 4LL * v16;
              *(_DWORD *)(a2 + v20) = *(_DWORD *)(a2 + v18);
              *(_DWORD *)(a3 + v20) = *(_DWORD *)(a3 + v18);
              *(_DWORD *)(a4 + v20) = *(_DWORD *)(a4 + v18);
              if (a5) {
                *(_DWORD *)(a5 + 4 * v19) = *(_DWORD *)(a5 + 4LL * (int)v13);
              }
              if (a6) {
                *(_BYTE *)(a6 + v19) = *(_BYTE *)(a6 + (int)v13);
              }
              ++v8;
              else {
                int v17 = 0;
              }
              int v16 = v13;
              uint64_t v13 = (v13 + a7 - v17);
            }

            while (v7 != v13);
          }

          else
          {
            do
            {
              uint64_t v15 = (int)v13;
              uint64_t v22 = 4LL * (int)v13;
              uint64_t v23 = v16;
              uint64_t v24 = 4LL * v16;
              *(_DWORD *)(a2 + v24) = *(_DWORD *)(a2 + v22);
              *(_DWORD *)(a3 + v24) = *(_DWORD *)(a3 + v22);
              if (a5) {
                *(_DWORD *)(a5 + 4 * v23) = *(_DWORD *)(a5 + 4LL * (int)v13);
              }
              if (a6) {
                *(_BYTE *)(a6 + v23) = *(_BYTE *)(a6 + (int)v13);
              }
              ++v8;
              else {
                int v21 = 0;
              }
              int v16 = v13;
              uint64_t v13 = (v13 + a7 - v21);
            }

            while (v7 != v13);
          }

          *(_DWORD *)(a2 + 4 * v15) = v14;
LABEL_41:
          *(_DWORD *)(a3 + 4 * v15) = v12;
          if (!a4) {
            goto LABEL_17;
          }
LABEL_16:
          *(_DWORD *)(a4 + 4 * v15) = v11;
          goto LABEL_17;
        }

        int v25 = v7;
        do
        {
          uint64_t v15 = (int)v13;
          *(_DWORD *)(a2 + 4LL * v25) = *(_DWORD *)(a2 + 4LL * (int)v13);
          if (a4) {
            *(_DWORD *)(a4 + 4LL * v25) = *(_DWORD *)(a4 + 4LL * (int)v13);
          }
          if (a5) {
            *(_DWORD *)(a5 + 4LL * v25) = *(_DWORD *)(a5 + 4LL * (int)v13);
          }
          if (a6) {
            *(_BYTE *)(a6 + v25) = *(_BYTE *)(a6 + (int)v13);
          }
          ++v8;
          else {
            int v26 = 0;
          }
          int v25 = v13;
          uint64_t v13 = (v13 + a7 - v26);
        }

        while (v7 != v13);
      }

      *(_DWORD *)(a2 + 4 * v15) = v14;
      if (a3) {
        goto LABEL_41;
      }
      if (a4) {
        goto LABEL_16;
      }
LABEL_17:
      if (a5) {
        *(_DWORD *)(a5 + 4 * v15) = v10;
      }
      if (a6) {
        *(_BYTE *)(a6 + v15) = v9;
      }
      ++v8;
      LODWORD(v13) = ++v7 + a7;
    }

    while (v8 < (int)result);
  }

  return result;
}

uint64_t sub_1000B8D4C( uint64_t a1, uint64_t a2, unint64_t a3, unsigned int a4, _DWORD *a5, uint64_t a6, int a7, void *a8)
{
  return sub_1000AD4C8(a3, a4, a5, a6, a7, a8);
}

uint64_t sub_1000B8D68(uint64_t *a1, uint64_t a2)
{
  int v4 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v5 = sub_100082BA4(*a1);
  if (v5 <= v4) {
    int v6 = v4;
  }
  else {
    int v6 = v5;
  }
  int v7 = v6 + 1;
  int v8 = sub_10003982C(*a1) + 1;
  uint64_t v9 = 2LL * v7;
  int v17 = (_WORD *)sub_1000CAF58(v9, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v18 = 2LL * v8;
  int v26 = (_WORD *)sub_1000CAF58(v18, v19, v20, v21, v22, v23, v24, v25);
  sub_1000B33F8((char *)a1, a2, (uint64_t)v17, v26);
  uint64_t v34 = (_WORD *)sub_1000CAF58(v9, v27, v28, v29, v30, v31, v32, v33);
  uint64_t v35 = v34;
  LOWORD(v36) = *v17;
  if (!*v17)
  {
    *uint64_t v34 = 0;
LABEL_39:
    sub_1000CB038(v35, v9);
    goto LABEL_43;
  }

  uint64_t v37 = 0LL;
  do
  {
    __int16 v38 = sub_1000CB5E8((unsigned __int16)v36);
    uint64_t v39 = v37;
    *(_WORD *)((char *)v35 + v39 * 2) = v38;
    ++v37;
    int v36 = (unsigned __int16)v17[v39 + 1];
  }

  while (v36);
  *((_WORD *)v35 + v37) = 0;
LABEL_8:
  uint64_t v76 = v18;
  int v47 = 30;
  uint64_t v48 = 120LL;
LABEL_11:
  uint64_t v49 = (void *)sub_1000CAF58(v48, v40, v41, v42, v43, v44, v45, v46);
  uint64_t v50 = v17;
  do
  {
    int v51 = (unsigned __int16)*v50;
    if (!*v50)
    {
      if (v47 > 0)
      {
        uint64_t v74 = (unsigned int *)v49;
        goto LABEL_41;
      }

unint64_t sub_1000B9044(uint64_t *a1, unsigned int a2, _DWORD *a3)
{
  if (a2 == 65534)
  {
    *a3 = 0;
    return 1LL;
  }

  int v13 = 0;
  unsigned int v6 = sub_10001EDF8(a1[1], a2, (unsigned int *)&v13);
  if (v6 == 0xFFFF) {
    return 0xFFFFFFFFLL;
  }
  unsigned int v7 = v6;
  int v8 = sub_100082D18(*a1);
  uint64_t v9 = (v8 + 1);
  uint64_t v10 = sub_100082D20(*a1);
  sub_10001ECA8(a1[1], v7);
  uint64_t v11 = a1[9];
  if (v11)
  {
    int v12 = sub_1000C172C(v11);
    uint64_t v11 = a1[9];
    if (v12 >= (int)v10)
    {
      uint64_t v11 = a1[9];
    }
  }

  sub_1000C133C(v11);
  a1[9] = sub_1000C11B8(2LL, v10, v9);
LABEL_9:
  sub_100082D28(*a1);
  memcpy(a3, *(const void **)(a1[9] + 8LL * v13), 2 * (int)v9);
  return sub_100099EE0((unint64_t)a3);
}

uint64_t sub_1000B91B4(uint64_t *a1, int a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = sub_10001EECC(v4, a2);
  if ((_DWORD)v5 == 0xFFFF)
  {
    uint64_t v6 = *a1;
    uint64_t v7 = a1[2];
    uint64_t v8 = sub_10001F130(v4, a2);
    if ((_DWORD)v8 == 0xFFFF) {
      return 0xFFFFLL;
    }
    uint64_t v5 = v8;
    sub_100082CF8(v6);
    sub_100082D00(v6);
    if (!sub_100075238(v7, v5))
    {
LABEL_12:
      sub_10001F7B8(v4, v5, 1);
      return 0xFFFFLL;
    }

    int v9 = sub_100082D28(v6);
    if (v9 >= 1)
    {
      int v10 = v9;
      while (sub_10001F368(v4, v5) != 0xFFFF)
      {
        if (!--v10) {
          return v5;
        }
      }

      uint64_t v4 = a1[1];
      goto LABEL_12;
    }
  }

  return v5;
}

uint64_t sub_1000B92DC(uint64_t a1, unsigned int a2)
{
  uint64_t result = sub_10001F794(*(void *)(a1 + 8), a2);
  if ((_DWORD)result)
  {
    uint64_t result = sub_1000752D8(*(void *)(a1 + 16), a2);
    if ((_DWORD)result) {
      return sub_10001F7B8(*(void *)(a1 + 8), a2, 1) != 0;
    }
  }

  return result;
}

uint64_t sub_1000B9330(uint64_t *a1, unint64_t a2, _WORD *a3, uint64_t a4, unsigned int *a5, _DWORD *a6)
{
  uint64_t v19 = a4;
  *a5 = -1;
  *a6 = 0;
  if (!a2) {
    return 1LL;
  }
  int v12 = (_WORD *)a2;
  do
  {
    int v13 = (unsigned __int16)*v12;
    if (!*v12) {
      return 1LL;
    }
    ++v12;
  }

  while (sub_1000CBA60(v13));
  uint64_t v14 = *a1;
  int v15 = sub_100082B9C(*a1);
  int v18 = v15;
  if (v15 != 0xFFFFFF)
  {
LABEL_10:
    uint64_t result = 0LL;
    *a5 = v15 | 0xC0000000;
    *a6 = 1;
    return result;
  }

  if (!a4)
  {
    uint64_t v17 = a1[3];
    if (a3 && v17)
    {
      if (*a3) {
        return sub_1000B94C4(a1, a2, (unint64_t)a3, a5, a6);
      }
LABEL_16:
      return 1LL;
    }

    if (v17) {
      goto LABEL_16;
    }
    return 1LL;
  }

  uint64_t result = sub_100082D40(*a1, a2, (uint64_t)a3, 1LL, (uint64_t)&v19, 0LL, 0LL, &v18);
  if (!(_DWORD)result)
  {
    int v15 = v18;
    goto LABEL_10;
  }

  return result;
}

uint64_t sub_1000B94C4(uint64_t *a1, uint64_t a2, unint64_t a3, unsigned int *a4, _DWORD *a5)
{
  int v35 = 0;
  uint64_t v34 = 0LL;
  int v33 = 0;
  int v10 = sub_100082D10(*a1);
  if (v10 <= 50) {
    int v18 = 50;
  }
  else {
    int v18 = v10;
  }
  uint64_t v19 = (4 * v18 + 4);
  uint64_t v20 = (void *)sub_1000CAF58(2LL * (int)v19, v11, v12, v13, v14, v15, v16, v17);
  uint64_t v32 = v20;
  int v21 = sub_1000942C4(a1[3], a3, 0LL, v20, v19, (uint64_t)&v34, 1LL, (uint64_t)&v35);
  if (v35 >= 1)
  {
    sub_1000CB038(v20, 2LL * (int)v19);
    uint64_t v19 = v35;
    uint64_t v20 = (void *)sub_1000CAF58(2LL * v35, v22, v23, v24, v25, v26, v27, v28);
    uint64_t v32 = v20;
    int v21 = sub_1000942C4(a1[3], a3, 0LL, v20, v19, (uint64_t)&v34, 1LL, (uint64_t)&v35);
  }

  if (v21)
  {
    uint64_t v29 = sub_100082D40(*a1, a2, a3, 1LL, (uint64_t)&v32, 0LL, 1LL, &v33);
    sub_1000CB038(v32, 2LL * (int)v19);
    int v30 = v33;
    *a5 = 1;
    *a4 = v30 | 0xC0000000;
  }

  else
  {
    sub_1000CB038(v20, 2LL * (int)v19);
    *a5 = 0;
    return 1LL;
  }

  return v29;
}

uint64_t sub_1000B9628(uint64_t *a1, unint64_t a2, unsigned int *a3, _DWORD *a4)
{
  if (qword_1000FDCC0)
  {
    uint64_t v7 = *(void *)(qword_1000FDCC0 + 5496);
    uint64_t v249 = *(unsigned int *)(qword_1000FDCC0 + 5488);
    uint64_t v251 = 8LL * (int)v7;
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v251 = 0LL;
    uint64_t v249 = 0LL;
  }

  int v272 = 0;
  uint64_t v8 = sub_1000CB0B0();
  uint64_t v9 = sub_100082DD8(*a1);
  uint64_t v17 = (_DWORD *)sub_1000CAF58(80LL, v10, v11, v12, v13, v14, v15, v16);
  uint64_t v25 = (_DWORD *)sub_1000CAF58(80LL, v18, v19, v20, v21, v22, v23, v24);
  int v33 = (char *)sub_1000CAF58(80LL, v26, v27, v28, v29, v30, v31, v32);
  uint64_t v269 = (char *)sub_1000CAF58(20LL, v34, v35, v36, v37, v38, v39, v40);
  uint64_t v253 = v33;
  uint64_t v264 = v17;
  uint64_t v254 = v25;
  uint64_t v41 = sub_1000B5964(a1, 1, a2, 0, 0, 20LL, v17, v25, v33, v269, 0LL);
  if (!(_DWORD)v41)
  {
    *a4 = 0;
    sub_1000CB094(v8);
    return 1LL;
  }

  uint64_t v42 = v41;
  uint64_t v247 = v8;
  int v248 = a4;
  uint64_t v250 = v7;
  if ((int)v41 >= 21)
  {
    sub_1000CB038(v269, 20LL);
    sub_1000CB038(v33, 80LL);
    sub_1000CB038(v254, 80LL);
    sub_1000CB038(v17, 80LL);
    uint64_t v50 = (_DWORD *)sub_1000CAF58(4LL * v42, v43, v44, v45, v46, v47, v48, v49);
    uint64_t v58 = (_DWORD *)sub_1000CAF58(4LL * v42, v51, v52, v53, v54, v55, v56, v57);
    uint64_t v66 = (char *)sub_1000CAF58(4LL * v42, v59, v60, v61, v62, v63, v64, v65);
    uint64_t v269 = (char *)sub_1000CAF58(v42, v67, v68, v69, v70, v71, v72, v73);
    uint64_t v253 = v66;
    uint64_t v264 = v50;
    uint64_t v254 = v58;
    LODWORD(v42) = sub_1000B5964(a1, 1, a2, 0, 0, v42, v50, v58, v66, v269, 0LL);
  }

  v273[0] = 0;
  int v74 = sub_100082D10(*a1);
  if (v74 <= 50) {
    int v82 = 50;
  }
  else {
    int v82 = v74;
  }
  unsigned int v259 = v82;
  int v83 = v82 + 1;
  uint64_t v265 = (char *)sub_1000CAF58((8 * (v82 + 1)), v75, v76, v77, v78, v79, v80, v81);
  int v244 = sub_1000CC52C(a2);
  unint64_t v257 = sub_1000CAF58(2LL * (v244 + 1), v84, v85, v86, v87, v88, v89, v90);
  uint64_t v91 = (int)v42;
  uint64_t v99 = (unsigned __int8 *)sub_1000CAF58((int)v42, v92, v93, v94, v95, v96, v97, v98);
  uint64_t v100 = 8LL * (int)v42;
  unint64_t v108 = sub_1000CAF58(v100, v101, v102, v103, v104, v105, v106, v107);
  unint64_t v116 = sub_1000CAF58(v100, v109, v110, v111, v112, v113, v114, v115);
  uint64_t v124 = v116;
  uint64_t v262 = (int)v42;
  uint64_t v263 = a1;
  uint64_t v252 = (_WORD *)a2;
  if ((int)v42 <= 0)
  {
    __int128 v189 = (void *)sub_1000CAF58(8LL * (int)v42, v117, v118, v119, v120, v121, v122, v123);
    goto LABEL_73;
  }

  unsigned int v245 = v9;
  uint64_t v125 = 0LL;
  int v255 = v83;
  int v267 = 4 * v83;
  uint64_t v270 = v42;
  int v126 = (void *)v257;
  uint64_t v127 = 2LL * v259 + 2;
  unint64_t v256 = v116;
  uint64_t v260 = v100;
  do
  {
    while (1)
    {
      unsigned int v130 = v264[v125];
      if (v130 != -1) {
        break;
      }
      memcpy(v126, &v252[*((int *)v254 + v125)], 2LL * *(int *)&v253[4 * v125]);
      *((_WORD *)v126 + *(int *)&v253[4 * v125]) = 0;
      unint64_t v140 = sub_1000CAF58(v251, v133, v134, v135, v136, v137, v138, v139);
      *(void *)(v124 + 8 * v125) = v140;
      int v141 = sub_1000942C4(a1[3], (unint64_t)v126, 0LL, v265, v267, v140, v250, (uint64_t)v273);
      uint64_t v142 = v273[0];
      if (v273[0] >= 1)
      {
        uint64_t v265 = (char *)sub_1000CAF58(2LL * v273[0], v117, v118, v119, v120, v121, v122, v123);
        int v141 = sub_1000942C4( a1[3],  (unint64_t)v126,  0LL,  v265,  v142,  *(void *)(v124 + 8 * v125),  v250,  (uint64_t)v273);
        int v267 = v142;
      }

      if (v141 >= 255) {
        uint64_t v143 = 255LL;
      }
      else {
        uint64_t v143 = v141;
      }
      v99[v125] = v143;
      if ((int)v143 < 1)
      {
        **(void **)(v124 + 8 * v125) = 0LL;
        *(void *)(v108 + 8 * v125) = 0LL;
        uint64_t v129 = v260;
        if (++v125 == v270) {
          goto LABEL_63;
        }
      }

      else
      {
        unint64_t v144 = v143 + 1;
        unsigned __int128 v145 = v265;
        do
          *(void *)(*(void *)(v124 + 8 * v125) + 8LL * (v144-- - 2)) -= **(void **)(v124 + 8 * v125);
        while (v144 > 1);
        uint64_t v146 = 8 * v143;
        uint64_t v147 = 0LL;
        *(void *)(v108 + 8 * v125) = sub_1000CAF58(8 * v143, v117, v118, v119, v120, v121, v122, v123);
        do
        {
          int v148 = sub_100099EE0((unint64_t)v145) + 1;
          uint64_t v156 = (void *)sub_1000CAF58(2LL * v148, v149, v150, v151, v152, v153, v154, v155);
          j__memmove(v156, v145, 2 * v148);
          *(void *)(*(void *)(v108 + 8 * v125) + v147) = v156;
          v145 += 2 * (int)(sub_100099EE0((unint64_t)v145) + 1);
          v147 += 8LL;
        }

        while (v146 != v147);
        a1 = v263;
        uint64_t v124 = v256;
        int v126 = (void *)v257;
        uint64_t v129 = v260;
        if (++v125 == v270) {
          goto LABEL_63;
        }
      }
    }

    unsigned int v131 = v130 >> 30;
    if (v130 >> 30 == 1)
    {
      if ((_WORD)v130 != 0xFFFF && sub_10001EDF8(a1[1], (unsigned __int16)v264[v125], 0LL) != 0xFFFF)
      {
        int v157 = 1;
        goto LABEL_37;
      }

LABEL_121:
    BOOL v241 = 0LL;
    goto LABEL_122;
  }

  if (*v252 == 32) {
    goto LABEL_121;
  }
  BOOL v241 = v252[v244 - 1] != 32;
LABEL_122:
  uint64_t v192 = sub_100082D40(*a1, (uint64_t)v252, 0LL, v268, v220, 0LL, v241, &v272);
  int v242 = v272;
  if (v272 == 0xFFFFFF)
  {
    *int v248 = 0;
  }

  else
  {
    *int v248 = 1;
    *a3 = v242 | 0xC0000000;
  }

uint64_t sub_1000BA058( uint64_t *a1, _WORD *a2, unsigned int a3, uint64_t a4, unsigned int *a5, _DWORD *a6, _BYTE *a7)
{
  if (!a2)
  {
LABEL_17:
    *a6 = 0;
    return 1LL;
  }

  uint64_t v12 = a2;
  uint64_t v14 = a2;
  do
  {
    int v15 = (unsigned __int16)*v14;
    if (!*v14) {
      goto LABEL_17;
    }
    ++v14;
  }

  while (sub_1000CBA60(v15));
  if (!qword_1000FDCC0 || *(uint64_t *)(qword_1000FDCC0 + 5496) < 1)
  {
    int v38 = sub_100082B9C(*a1);
    if (v38 != 0xFFFFFF)
    {
      uint64_t v39 = 0LL;
      *a6 = 1;
      *a5 = v38 | 0xC0000000;
      return v39;
    }

    goto LABEL_17;
  }

  unsigned int v400 = a3;
  uint64_t v407 = a5;
  v434 = a1;
  int v408 = a6;
  HIDWORD(v439) = 0;
  unsigned __int128 v399 = a7;
  uint64_t v412 = (int)a4;
  bzero(a7, (int)a4);
  uint64_t v437 = sub_1000CB0B0();
  int v16 = sub_1000CC52C((unint64_t)v12);
  uint64_t v24 = (void *)sub_1000CAF58(2LL * (v16 + 1), v17, v18, v19, v20, v21, v22, v23);
  uint64_t v32 = (void *)sub_1000CAF58(8LL * (int)a4, v25, v26, v27, v28, v29, v30, v31);
  int v33 = v32;
  __src = v12;
  uint64_t v404 = a4;
  if (v16 <= 0)
  {
    *uint64_t v32 = &v12[v16];
  }

  else
  {
    uint64_t v34 = 0LL;
    int v35 = 0;
    while (*v12 != 32)
    {
      ++v35;
      ++v12;
      do
      {
        if (v16 == v35)
        {
          uint64_t v41 = 0LL;
          int v42 = 0;
          v32[v34] = &__src[v16];
          uint64_t v43 = __src;
          while (1)
          {
            uint64_t v44 = v42;
            uint64_t v45 = v34;
            while (1)
            {
              unint64_t v46 = v33[v45] - (void)v43;
              memcpy(v24, v43, (int)v46 & 0xFFFFFFFFFFFFFFFELL);
              *((_WORD *)v24 + (int)(v46 >> 1)) = 0;
              int v47 = sub_100082B9C(*v434);
              if (v47 != 0xFFFFFF) {
                break;
              }
              BOOL v48 = v45-- <= v44;
              if (v48) {
                goto LABEL_30;
              }
            }

            int v49 = v41 + 1;
            v407[v41] = v47 | 0xC0000000;
            int v42 = v45 + 1;
            uint64_t v43 = (const void *)(v33[v45] + 2LL);
            ++v41;
            if ((int)v34 <= (int)v45)
            {
              *int v408 = v49;
              sub_1000CB094(v437);
              return 0LL;
            }
          }
        }

        int v36 = (unsigned __int16)*v12++;
        ++v35;
      }

      while (v36 != 32);
      int v37 = v34 + 1;
      v32[v34++] = v12 - 1;
      if (v16 == v35)
      {
        v32[v37] = &__src[v16];
        break;
      }
    }
  }

LABEL_304:
              memcpy(__dst, &__src[v387], v388);
              BOOL v390 = 0LL;
              unsigned int v383 = v418;
              *((_WORD *)__dst + *(int *)&v418[4 * v381]) = 0;
              uint64_t v391 = *(unsigned __int8 *)(v424 + v381);
              if ((_DWORD)v391 == 1) {
                BOOL v390 = v425[v381] != 0;
              }
              uint64_t v392 = sub_100082D40(*v434, (uint64_t)__dst, 0LL, v391, *(void *)(v433 + 8 * v381), v400, v390, v440);
              if ((_DWORD)v392)
              {
                uint64_t v39 = v392;
                if ((_DWORD)v381)
                {
                  uint64_t v393 = 0LL;
                  do
                  {
                    if (v399[v393])
                    {
                      LODWORD(v440[0]) = v407[v393] & 0xFFFFFF;
                      sub_100082D7C(*v434);
                    }

                    ++v393;
                  }

                  while (v381 != v393);
                }

                LODWORD(v413) = 0;
                goto LABEL_315;
              }

              v407[v381] = LODWORD(v440[0]) | 0xC0000000;
              v399[v381] = 1;
              int v382 = v417;
            }

LABEL_293:
            if (++v381 == v427) {
              goto LABEL_308;
            }
          }
        }
      }
    }
  }

LABEL_148:
      int v259 = 0;
      goto LABEL_150;
    }

    int v259 = sub_10001FE60(v52[1], (unsigned __int16)v430[v251]);
LABEL_150:
    if (v259 >= v420) {
      int v260 = v420;
    }
    else {
      int v260 = v259;
    }
    if (v260 >= 255) {
      int v261 = 255;
    }
    else {
      int v261 = v260;
    }
    *(_BYTE *)(v424 + v251) = v261;
    if (v260 >= 1)
    {
      uint64_t v262 = 0LL;
      if (v261 <= 1) {
        unsigned int v263 = 1;
      }
      else {
        unsigned int v263 = v261;
      }
      uint64_t v264 = 8LL * v263;
      uint64_t v265 = v258;
      do
      {
        *(void *)(*(void *)(v433 + 8 * v251) + v262) = v265;
        *(void *)(v257 + 8 * v251) = 0LL;
        v262 += 8LL;
        v265 += v394;
      }

      while (v264 != v262);
    }

    unsigned int v266 = v430[v251];
    uint64_t v267 = *v52;
    if (v266 >> 30 == 1)
    {
      unsigned int v268 = sub_10001EDF8(v52[1], (unsigned __int16)v430[v251], 0LL);
      uint64_t v269 = v52[1];
    }

    else
    {
      if (v266 >> 30 != 2) {
        goto LABEL_168;
      }
      uint64_t v269 = v52[1];
      unsigned int v268 = (unsigned __int16)v430[v251];
    }

    sub_10001ECA8(v269, v268);
LABEL_168:
    sub_100082D30(v267);
    if (v260 < 1)
    {
      int v252 = 0;
    }

    else
    {
      uint64_t v270 = 0LL;
      int v252 = 0;
      if (v261 <= 1) {
        unsigned int v271 = 1;
      }
      else {
        unsigned int v271 = v261;
      }
      uint64_t v272 = 8LL * v271;
      do
      {
        uint64_t v273 = *(const void **)(*(void *)(v433 + 8 * v251) + v270);
        int v274 = sub_100099EE0((unint64_t)v273);
        int v282 = v274 + 1;
        if (v274 >= v252) {
          int v252 = v274 + 1;
        }
        int v283 = (void *)sub_1000CAF58(2LL * v282, v275, v276, v277, v278, v279, v280, v281);
        j__memmove(v283, v273, 2 * v282);
        *(void *)(*(void *)(v433 + 8 * v251) + v270) = v283;
        v270 += 8LL;
      }

      while (v272 != v270);
    }

    int v253 = v252 + v428;
    if ((v438[v251] & 8) != 0 && v435 != 0xFFFF) {
      ++v253;
    }
    int v428 = v253;
    uint64_t v52 = v434;
    uint64_t v84 = v418;
    unint64_t v165 = v424;
    uint64_t v189 = v427;
LABEL_138:
    ++v251;
  }

  while (v251 != v189);
  uint64_t v284 = v189;
  unint64_t v292 = sub_1000CAF58(v397, v179, v180, v181, v182, v183, v184, v185);
  uint64_t v293 = 0LL;
  do
  {
    if (*(_BYTE *)(v165 + v293))
    {
      *(void *)(v292 + 8 * v293) = sub_1000CAF58( *(unsigned __int8 *)(v165 + v293),  v285,  v286,  v287,  v288,  v289,  v290,  v291);
      if (*(_BYTE *)(v165 + v293))
      {
        unint64_t v294 = 0LL;
        do
          *(_BYTE *)(*(void *)(v292 + 8 * v293) + v294++) = sub_100082DAC(*v52);
        while (v294 < *(unsigned __int8 *)(v165 + v293));
      }
    }

    else
    {
      *(void *)(v292 + 8 * v293) = 0LL;
    }

    ++v293;
  }

  while (v293 != v284);
  uint64_t v249 = v408;
  int v250 = v413;
  uint64_t v296 = v409;
  unsigned int v295 = v410;
  if ((int)v410 >= 1)
  {
LABEL_186:
    unsigned int v297 = v295;
    unint64_t v298 = sub_1000CAF58(8LL * v295, v285, v286, v287, v288, v289, v290, v291);
    uint64_t v299 = 0LL;
    uint64_t v300 = 8LL * v297;
    do
    {
      *(void *)(v298 + v299) = sub_1000CAF58(2LL * (v428 + 1), v285, v286, v287, v288, v289, v290, v291);
      v299 += 8LL;
    }

    while (v300 != v299);
    uint64_t v426 = v298;
    int v250 = v413;
    uint64_t v249 = v408;
    goto LABEL_191;
  }

LABEL_242:
        uint64_t v345 = v431;
        uint64_t v350 = v426;
        if ((int)(((unint64_t)v351 - *(void *)(v426 + 8LL * (int)v431)) >> 1) <= 255)
        {
          uint64_t v345 = (v431 + 1);
          *unint64_t v351 = -1;
          uint64_t v347 = v429 + 1;
          if (v429 + 1 == v421) {
            goto LABEL_247;
          }
        }

        else
        {
          uint64_t v347 = v429 + 1;
          if (v429 + 1 == v421) {
            goto LABEL_247;
          }
        }
      }

      uint64_t v353 = 0LL;
      int v354 = 0;
      while (2)
      {
        if ((v438[v353] & 8) != 0)
        {
          if (!v354)
          {
            *v351++ = v435;
            int v354 = 1;
            goto LABEL_234;
          }

          int v354 = 0;
          --v351;
          if (v343[v353])
          {
LABEL_237:
            int v355 = *(const void **)(*(void *)(v349 + 8 * v353) + 8LL * *(unsigned __int8 *)(*v352 + v353));
            int v356 = sub_100099EE0((unint64_t)v355);
            memcpy(v351, v355, 2 * v356);
            int v354 = 0;
            v351 += v356;
          }
        }

        else
        {
LABEL_234:
          if (v343[v353]) {
            goto LABEL_237;
          }
        }

        if (v348 == ++v353) {
          goto LABEL_242;
        }
        continue;
      }
    }

    break;
  }

  HIDWORD(v439) = 0xFFFFFF;
  uint64_t v39 = 1LL;
  unsigned int v372 = v395;
  int v373 = v408;
  unint64_t v375 = v402;
  uint64_t v374 = v403;
  if (v395 >= 1)
  {
LABEL_273:
    uint64_t v376 = v372;
    do
    {
      v375 += 4LL;
      sub_100082D7C(*v52);
      --v376;
    }

    while (v376);
  }

LABEL_275:
  sub_1000CB094(v374);
  *int v373 = 0;
  return v39;
}

uint64_t sub_1000BB674(uint64_t *a1, unsigned int a2, _DWORD *a3)
{
  if (a2 >= 0xFFFFFFFB)
  {
    if (a2 + 5 >= 4) {
      unsigned __int16 v6 = -1;
    }
    else {
      unsigned __int16 v6 = a2;
    }
    int v7 = a2 & 0xFFFFFF;
    uint64_t result = 0LL;
    *a3 = 0;
    if (a2 == -1) {
      return result;
    }
    goto LABEL_20;
  }

  unsigned int v9 = a2 >> 30;
  if (a2 >> 30 != 1)
  {
    if (v9 == 2)
    {
      int v7 = sub_10001ECA8(a1[1], (unsigned __int16)a2);
      unsigned __int16 v6 = a2;
      uint64_t result = 0LL;
      *a3 = 0;
      if (a2 == -1) {
        return result;
      }
    }

    else
    {
      if (v9 != 3)
      {
        uint64_t result = 0LL;
        *a3 = 0;
        return result;
      }

      if ((a2 & 0xFFFFFF) == 0xFFFFFF)
      {
        unsigned __int16 v6 = -1;
        int v7 = a2 & 0xFFFFFF;
        uint64_t result = 0LL;
        *a3 = 0;
      }

      else
      {
        unsigned __int16 v6 = sub_10001EECC(a1[1], a2 & 0xFFFFFF);
        int v7 = a2 & 0xFFFFFF;
        uint64_t result = 0LL;
        *a3 = 0;
        if (a2 == -1) {
          return result;
        }
      }
    }

    goto LABEL_20;
  }

  unsigned __int16 v6 = -1;
  if ((_WORD)a2 != 0xFFFF) {
    unsigned __int16 v6 = sub_10001EDF8(a1[1], (unsigned __int16)a2, 0LL);
  }
  unsigned int v10 = sub_10001EDF8(a1[1], (unsigned __int16)a2, 0LL);
  int v7 = sub_10001ECA8(a1[1], v10);
  uint64_t result = 0LL;
  *a3 = 0;
  if (a2 != -1)
  {
LABEL_20:
    if (v7 != 0xFFFFFF)
    {
      if (v6 == 0xFFFF
        || (uint64_t result = sub_10001F794(a1[1], v6), (_DWORD)result)
        && (uint64_t result = sub_1000752D8(a1[2], v6), (_DWORD)result)
        && (uint64_t result = sub_10001F7B8(a1[1], v6, 1), (_DWORD)result))
      {
        uint64_t result = sub_100082D8C(*a1);
        if ((_DWORD)result)
        {
          sub_100082D7C(*a1);
          return 1LL;
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000BB860(uint64_t *a1)
{
  return sub_100082D84(*a1);
}

uint64_t sub_1000BB868(uint64_t a1, unsigned int a2, unsigned int *a3)
{
  return sub_10001EDF8(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_1000BB870(uint64_t a1, int a2)
{
  if (a2 == 0xFFFF) {
    return 0xFFFFFFFFLL;
  }
  else {
    return a2 | 0x40000000u;
  }
}

uint64_t sub_1000BB884(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = (unsigned __int16)(a2 + 5);
  if (v2 >= 4) {
    unsigned int v3 = -1;
  }
  else {
    unsigned int v3 = v2 - 5;
  }
  if (a2 >= 0xFFFB) {
    return v3;
  }
  else {
    return a2 | 0x80000000;
  }
}

uint64_t sub_1000BB8B0(uint64_t a1, unsigned int a2)
{
  unsigned int v2 = a2 >> 30;
  if (a2 >> 30 == 1) {
    return (unsigned __int16)a2;
  }
  if (v2 == 2)
  {
    if ((_WORD)a2 != 0xFFFF) {
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)a2, 0);
    }
    return 0xFFFFLL;
  }

  if (v2 != 3) {
    return 0xFFFFLL;
  }
  if ((a2 & 0xFFFFFF) == 0xFFFFFF) {
    return 0xFFFFLL;
  }
  if (a2 < 0xFFFFFFFB)
  {
    int v5 = sub_10001EECC(*(void *)(a1 + 8), a2 & 0xFFFFFF);
    if (v5 != 0xFFFF) {
      return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)v5, 0);
    }
    return 0xFFFFLL;
  }

  if (a2 + 5 >= 4) {
    return 0xFFFFLL;
  }
  LOWORD(v5) = a2;
  return sub_1000200F0(*(void *)(a1 + 8), (unsigned __int16)v5, 0);
}

BOOL sub_1000BB9AC(uint64_t a1, unsigned int a2, unsigned int a3)
{
  unsigned int v5 = a2 >> 30;
  unsigned int v6 = a3 >> 30;
  if (a2 >> 30 == 3 || v6 == 3)
  {
    if (v5 == 1)
    {
      unsigned int v12 = sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a2, 0LL);
      int v8 = sub_10001ECA8(*(void *)(a1 + 8), v12);
      if (v6 == 1) {
        goto LABEL_27;
      }
    }

    else
    {
      if (v5 != 2)
      {
        if (v5 == 3) {
          int v8 = a2 & 0xFFFFFF;
        }
        else {
          int v8 = 0xFFFFFF;
        }
        if (v6 != 1) {
          goto LABEL_12;
        }
LABEL_27:
        unsigned int v13 = sub_10001EDF8(*(void *)(a1 + 8), (unsigned __int16)a3, 0LL);
        uint64_t v14 = *(void *)(a1 + 8);
        return v8 == sub_10001ECA8(v14, v13);
      }

      int v8 = sub_10001ECA8(*(void *)(a1 + 8), (unsigned __int16)a2);
      if (v6 == 1) {
        goto LABEL_27;
      }
    }

uint64_t sub_1000BBBA0(uint64_t a1)
{
  return sub_1000202C4(*(void *)(a1 + 8));
}

uint64_t sub_1000BBBA8(uint64_t a1, uint64_t a2, int a3)
{
  return sub_1000202CC(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_1000BBBB0(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  int v4 = sub_100074B0C(*(void *)(a1 + 16), a2, a3, a4);
  if (!qword_1000FDCC0) {
    return (__int16)(v4 & (v4 >> 31));
  }
  uint64_t v5 = *(void *)(qword_1000FDCC0 + 5456);
  if (v5 >= v4) {
    LOWORD(v5) = v4;
  }
  return (__int16)v5;
}

uint64_t sub_1000BBBF8(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  int v4 = sub_100074D50(*(void *)(a1 + 16), a2, a3, a4);
  if (!qword_1000FDCC0) {
    return (__int16)(v4 & (v4 >> 31));
  }
  uint64_t v5 = *(void *)(qword_1000FDCC0 + 5456);
  if (v5 >= v4) {
    LOWORD(v5) = v4;
  }
  return (__int16)v5;
}

uint64_t sub_1000BBC40( uint64_t a1, signed int a2, uint64_t a3, uint64_t a4, unsigned __int16 *a5, int a6, __int16 *a7)
{
  int v7 = a7;
  int v8 = a4;
  uint64_t result = sub_100074D58(*(void *)(a1 + 16), a2, a3, a4, a5, a6, a7);
  uint64_t v10 = qword_1000FDCC0;
  if (qword_1000FDCC0)
  {
  }

  else if (v8 >= 1)
  {
LABEL_9:
    for (uint64_t i = v8; i; --i)
    {
      uint64_t v14 = *v7;
      if (v10)
      {
        uint64_t v13 = *(void *)(v10 + 5456);
        if (v13 >= v14) {
          goto LABEL_12;
        }
      }

      else
      {
        LOWORD(v13) = 0;
        if ((int)v14 <= 0)
        {
          uint64_t v10 = 0LL;
          goto LABEL_12;
        }
      }

      *int v7 = v13;
      uint64_t v10 = qword_1000FDCC0;
LABEL_12:
      ++v7;
    }
  }

  return result;
}

BOOL sub_1000BBCE0(uint64_t a1, unsigned int a2, unsigned int a3)
{
  return sub_10002032C(*(void *)(a1 + 8), a2, a3);
}

uint64_t sub_1000BBCE8(uint64_t *a1)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v2 = *a1;
  if (v2)
  {
    unsigned int v3 = sub_100082DB4(v2);
    uint64_t v4 = sub_1000BE644(v3, 4, 0xFFFFFFFF);
    uint64_t v5 = a1[3];
    if (!v5) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }

  uint64_t v4 = 0xFFFFFFFFLL;
  uint64_t v5 = a1[3];
  if (v5)
  {
LABEL_4:
    unsigned int v6 = sub_1000944C8(v5);
    uint64_t v4 = sub_1000BE644(v6, 4, v4);
  }

uint64_t sub_1000BBE20(uint64_t *a1)
{
  return sub_100082DC8(*a1);
}

uint64_t sub_1000BBE28(uint64_t *a1, unsigned int a2, int a3, unsigned __int16 *a4, int a5)
{
  signed int v35 = 0;
  if (a2 >> 30 == 1) {
    sub_10001EDF8(a1[1], (unsigned __int16)a2, (unsigned int *)&v35);
  }
  int v10 = sub_1000C88E4((unint64_t)"<START_DOCUMENT>");
  int v11 = sub_100082BA4(*a1);
  if (v11 <= v10) {
    int v12 = v10;
  }
  else {
    int v12 = v11;
  }
  int v13 = v12 + 1;
  int v14 = sub_10003982C(*a1) + 1;
  uint64_t v15 = 2LL * v13;
  uint64_t v23 = (void *)sub_1000CAF58(v15, v16, v17, v18, v19, v20, v21, v22);
  uint64_t v24 = 2LL * v14;
  uint64_t v32 = (_WORD *)sub_1000CAF58(v24, v25, v26, v27, v28, v29, v30, v31);
  sub_1000B33F8((char *)a1, a2, (uint64_t)v23, v32);
  unint64_t v33 = sub_1000D68AC((unint64_t)v23, v32, a4, a3);
  sub_1000CB038(v32, v24);
  sub_1000CB038(v23, v15);
  if (a5 && v35 >= 1)
  {
    __sprintf_chk(v37, 0, 0xAuLL, "(%d)", v35);
    sub_1000CE25C(v37, 10, (uint64_t)v36);
    return sub_1000CC67C(a4, v36, a3);
  }

  return v33;
}

uint64_t sub_1000BBFB0(uint64_t *a1, int a2, int a3, uint64_t a4, int a5)
{
  int v10 = (unsigned __int16 *)sub_1000C1074(2LL * a3);
  if (!v10) {
    return 0LL;
  }
  int v11 = v10;
  if (a2 == 65534)
  {
    unsigned int v12 = sub_1000CC72C(v10, "SILENCE", a3);
    if (v12)
    {
LABEL_4:
      else {
        uint64_t v13 = v12;
      }
      goto LABEL_13;
    }
  }

  else
  {
    if (a2 == 0xFFFF) {
      unsigned int v15 = -1;
    }
    else {
      unsigned int v15 = a2 | 0x40000000;
    }
    unsigned int v12 = sub_1000BBE28(a1, v15, a3, v10, a5);
    if (v12) {
      goto LABEL_4;
    }
  }

  uint64_t v13 = 0LL;
LABEL_13:
  sub_1000C0EF8((uint64_t)v11);
  return v13;
}

uint64_t sub_1000BC098(uint64_t *a1, unsigned int a2, int a3, uint64_t a4, int a5)
{
  int v10 = (unsigned __int16 *)sub_1000C1074(2LL * a3);
  if (!v10) {
    return 0LL;
  }
  int v11 = v10;
  unsigned int v12 = sub_1000BBE28(a1, a2, a3, v10, a5);
  if (v12)
  {
    unsigned int v13 = v12;
    else {
      uint64_t v14 = v13;
    }
  }

  else
  {
    uint64_t v14 = 0LL;
  }

  sub_1000C0EF8((uint64_t)v11);
  return v14;
}

uint64_t sub_1000BC14C(uint64_t *a1, uint64_t a2, char *a3)
{
  uint64_t result = sub_100082DE0(*a1);
  if ((_DWORD)result)
  {
    uint64_t result = sub_1000206DC(a1[1], a2, a3);
    if ((_DWORD)result)
    {
      uint64_t v7 = a1[2];
      if (!v7) {
        return 1LL;
      }
      uint64_t result = sub_1000755E0(v7, a2, a3);
      if ((_DWORD)result) {
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t sub_1000BC1B4(uint64_t *a1, uint64_t a2, char *a3)
{
  uint64_t result = sub_100082DE8(*a1);
  if ((_DWORD)result)
  {
    uint64_t result = sub_100020950(a1[1], a2, a3, v7, v8, v9, v10, v11);
    if ((_DWORD)result)
    {
      uint64_t v12 = a1[2];
      if (!v12) {
        return 1LL;
      }
      uint64_t result = sub_100075508(v12, a2, a3);
      if ((_DWORD)result) {
        return 1LL;
      }
    }
  }

  return result;
}

uint64_t *sub_1000BC21C( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = (_BYTE *)sub_1000CAF58(6LL, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  *(_DWORD *)uint64_t v10 = 0;
  *((_WORD *)v10 + 2) = 0;
  uint64_t v16 = sub_1000BCAE8(a1, "voc", a2, v11, v12, v13, v14, v15);
  uint64_t v17 = v16;
  if (!v16) {
    return v17;
  }
  BOOL v18 = sub_1000BCE28((uint64_t)v16, v10, 6, 1);
  sub_1000BCBC8((uint64_t)v17);
  if (v18)
  {
    sub_1000C0BFC(0x58uLL, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v17 = v26;
    if (*v10)
    {
      unint64_t v33 = sub_1000944DC(a1, a2, v27, v28, v29, v30, v31, v32);
      uint64_t v34 = (uint64_t)v33;
      if (!v33)
      {
LABEL_23:
        sub_1000CB038(v10, 6LL);
        sub_1000B2F4C((uint64_t)v17);
        return 0LL;
      }

      v17[3] = (uint64_t)v33;
      if (v10[4]) {
        goto LABEL_6;
      }
    }

    else
    {
      uint64_t v34 = 0LL;
      v26[3] = 0LL;
      if (v10[4])
      {
LABEL_6:
        signed int v35 = sub_10009A6BC(a1, a2, v27, v28, v29, v30, v31, v32);
        if (!v35) {
          goto LABEL_23;
        }
        goto LABEL_11;
      }
    }

    signed int v35 = 0LL;
LABEL_11:
    v17[4] = (uint64_t)v35;
    int v36 = sub_100082DF0(a1, a2, v34, (uint64_t)v35, v29, v30, v31, v32);
    uint64_t *v17 = (uint64_t)v36;
    if (!v36) {
      goto LABEL_23;
    }
    uint64_t v43 = sub_100020DB0(a1, a2, v37, v38, v39, v40, v41, v42);
    v17[1] = v43;
    if (!v43) {
      goto LABEL_23;
    }
    if (v10[2])
    {
      uint64_t v50 = sub_100075384(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[2] = v50;
      if (!v50) {
        goto LABEL_23;
      }
    }

    if (v10[1])
    {
      int v51 = sub_100023F3C(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[5] = (uint64_t)v51;
      if (!v51) {
        goto LABEL_23;
      }
    }

    if (v10[3])
    {
      uint64_t v52 = sub_100063ACC(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[6] = (uint64_t)v52;
      if (!v52) {
        goto LABEL_23;
      }
    }

    if (v10[5])
    {
      uint64_t v53 = sub_1000AE0DC(a1, a2, v44, v45, v46, v47, v48, v49);
      v17[7] = v53;
      if (!v53) {
        goto LABEL_23;
      }
    }

    v17[8] = sub_100051A4C(a1, a2, v44, v45, v46, v47, v48, v49);
    sub_1000CB038(v10, 6LL);
    uint64_t v54 = (uint64_t (**)(void))sub_100082E24(a1, a2, v17[3], v17[4]);
    sub_1000B2FE8(v17, (uint64_t)v54);
    sub_100059748(v54);
    return v17;
  }

  sub_1000CB038(v10, 6LL);
  return 0LL;
}

uint64_t sub_1000BC428(signed int a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v10 = sub_1000CB0B0();
  unint64_t v18 = sub_1000CAF58(12LL, v11, v12, v13, v14, v15, v16, v17);
  *(void *)unint64_t v18 = 0LL;
  *(_DWORD *)(v18 + 8) = 0;
  uint64_t v26 = (uint64_t *)sub_1000CAF58(24LL, v19, v20, v21, v22, v23, v24, v25);
  uint64_t v27 = 16LL * (int)a6;
  unsigned int v146 = a1;
  size_t v28 = a1;
  *uint64_t v26 = sub_1000CAF58(v27, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v143 = a6;
  uint64_t v145 = a4;
  if ((int)a6 <= 0)
  {
    v26[1] = sub_1000CAF58(16LL * (int)a6, v36, v37, v38, v39, v40, v41, v42);
    v26[2] = sub_1000CAF58(16LL * (int)a6, v64, v65, v66, v67, v68, v69, v70);
  }

  else
  {
    uint64_t v43 = 0LL;
    uint64_t v44 = a6;
    uint64_t v45 = 16LL * a6;
    do
    {
      *(void *)(*v26 + v43 + 8) = sub_1000CAF58(v28, v36, v37, v38, v39, v40, v41, v42);
      v43 += 16LL;
    }

    while (v45 != v43);
    uint64_t v46 = 0LL;
    v26[1] = sub_1000CAF58(v27, v36, v37, v38, v39, v40, v41, v42);
    uint64_t v54 = 16 * v44;
    do
    {
      *(void *)(v26[1] + v46 + 8) = sub_1000CAF58(v28, v47, v48, v49, v50, v51, v52, v53);
      v46 += 16LL;
    }

    while (v54 != v46);
    unint64_t v55 = sub_1000CAF58(v27, v47, v48, v49, v50, v51, v52, v53);
    uint64_t v63 = 0LL;
    v26[2] = v55;
    do
    {
      *(void *)(v26[2] + v63 + 8) = sub_1000CAF58(v28, v56, v57, v58, v59, v60, v61, v62);
      v63 += 16LL;
    }

    while (v54 != v63);
  }

  uint64_t v71 = (unsigned __int8 *)sub_1000CAF58(v28, v56, v57, v58, v59, v60, v61, v62);
  bzero(v71, v28);
  int v79 = v146;
  uint64_t v80 = v146;
  uint64_t v81 = v146;
  while ((int)v81 >= 1)
  {
    unsigned int v82 = v81 - 1;
    if (a3[--v81])
    {
      uint64_t v84 = 0LL;
      uint64_t v85 = *(_DWORD **)(v145 + 8LL * v82);
      uint64_t v141 = v10;
      while (1)
      {
        uint64_t v86 = 2LL;
        if (v79 < 1) {
          goto LABEL_25;
        }
        uint64_t v87 = a3;
        uint64_t v88 = v71;
        uint64_t v89 = a5;
        uint64_t v90 = v80;
        do
        {
          uint64_t v91 = v86;
          if (*v87++)
          {
            uint64_t v86 = *(unsigned __int8 *)(*v89 + *v88);
            if ((_DWORD)v91 != 2)
            {
              BOOL v93 = (_DWORD)v91 == (_DWORD)v86 || (_DWORD)v86 == 2;
              uint64_t v86 = v91;
              if (!v93) {
                goto LABEL_43;
              }
            }
          }

          ++v89;
          ++v88;
          --v90;
        }

        while (v90);
        if ((_DWORD)v86 != 255)
        {
LABEL_25:
          if (qword_1000FDCC0)
          {
            int v94 = *(_DWORD *)(qword_1000FDCC0 + 5488);
            uint64_t v95 = (char *)v26[v86];
            uint64_t v96 = *(int *)(v18 + 4LL * v86);
            dword_1000FDE50 = v79;
          }

          else
          {
            int v94 = 0;
            uint64_t v95 = (char *)v26[v86];
            uint64_t v96 = *(int *)(v18 + 4LL * v86);
            dword_1000FDE50 = v79;
            if ((int)v96 < 0)
            {
LABEL_27:
              uint64_t v139 = v86;
              unint64_t v140 = v85;
              uint64_t v97 = (void **)&v95[16 * v96];
              *(_DWORD *)uint64_t v97 = v84;
              uint64_t v98 = v80;
              uint64_t v99 = v84;
              memcpy(v97[1], v71, v28);
              uint64_t v85 = v140;
              uint64_t v84 = v99;
              uint64_t v80 = v98;
              int v79 = v146;
              int v100 = *(_DWORD *)(v18 + 4 * v139) + 1;
              *(_DWORD *)(v18 + 4 * v139) = v100;
              if (v100 != v94) {
                goto LABEL_43;
              }
              qsort(v95, v94, 0x10uLL, (int (__cdecl *)(const void *, const void *))sub_1000BCA94);
              int v79 = v146;
              uint64_t v85 = v140;
              goto LABEL_42;
            }
          }

          int v101 = v96 - 1;
          uint64_t v102 = (int)v96 - 1;
          int v103 = (v101 & (v101 >> 31)) - 1;
          while (1)
          {
            int v104 = *(_DWORD *)&v95[16 * v102];
            int v105 = v84 - v104;
            if ((_DWORD)v84 == v104) {
              break;
            }
LABEL_35:
            if ((v105 & 0x80000000) == 0) {
              goto LABEL_39;
            }
            if (v102-- < 1) {
              goto LABEL_40;
            }
          }

          uint64_t v106 = v146 - 1LL;
          while ((int)v106 + 1 >= 1)
          {
            int v107 = v71[v106];
            int v108 = *(unsigned __int8 *)(*(void *)&v95[16 * v102 + 8] + v106--);
            int v105 = v107 - v108;
            if (v105) {
              goto LABEL_35;
            }
          }

uint64_t sub_1000BCA94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (*(_DWORD *)a1 - *(_DWORD *)a2);
  if (*(_DWORD *)a1 != *(_DWORD *)a2) {
    return v2;
  }
  for (uint64_t i = dword_1000FDE50 - 1LL; (int)i + 1 >= 1; --i)
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 8) + i);
    int v5 = *(unsigned __int8 *)(*(void *)(a2 + 8) + i);
    uint64_t v2 = (v4 - v5);
    if ((_DWORD)v2) {
      return v2;
    }
  }

  return 0LL;
}

uint64_t *sub_1000BCAE8( uint64_t a1, _BYTE *a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12 = v11;
  v15[0] = 0;
  if (a3) {
    sub_1000C896C(v15, a3, 256);
  }
  sub_1000C89F8(v15, a2, 256);
  *uint64_t v12 = a1;
  if (!sub_1000C9B00(a1, v15))
  {
    if (v12[1]) {
      return v12;
    }
    goto LABEL_5;
  }

  uint64_t v13 = sub_1000C9F70(a1, v15);
  v12[1] = v13;
  if (!v13)
  {
LABEL_5:
    sub_1000C0EF8((uint64_t)v12);
    return 0LL;
  }

  return v12;
}

uint64_t sub_1000BCBC8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 8);
    sub_1000CA54C(v2);
    sub_1000CA554(v2);
    sub_1000CA190(*(void *)(v1 + 8));
    return sub_1000C0EF8(v1);
  }

  return result;
}

BOOL sub_1000BCC0C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  uint64_t v2 = sub_1000CA54C(v1);
  return v2 == sub_1000CA554(v1);
}

BOOL sub_1000BCC44(uint64_t a1, _BYTE *a2, char *a3, void *a4)
{
  v8[0] = 0;
  if (a3) {
    sub_1000C896C(v8, a3, 256);
  }
  sub_1000C89F8(v8, a2, 256);
  return sub_1000CAA88(a1, v8, 0, 4, a4) == 4;
}

BOOL sub_1000BCCEC(uint64_t a1, _DWORD *a2)
{
  return sub_1000CA55C(*(void *)(a1 + 8), a2, 4uLL) == 4 && *a2 < 2u;
}

BOOL sub_1000BCD38(uint64_t a1, void *a2)
{
  return sub_1000CA55C(*(void *)(a1 + 8), a2, 4uLL) == 4;
}

BOOL sub_1000BCD5C(uint64_t a1, void *a2)
{
  return sub_1000CA55C(*(void *)(a1 + 8), a2, 8uLL) == 8;
}

uint64_t sub_1000BCD80(uint64_t a1, _BYTE *a2)
{
  int __dst = 0;
  int v3 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v3 == 4)
  {
    *a2 = __dst;
    return 1LL;
  }

  return result;
}

uint64_t sub_1000BCDD4(uint64_t a1, _WORD *a2)
{
  int __dst = 0;
  int v3 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v3 == 4)
  {
    *a2 = __dst;
    return 1LL;
  }

  return result;
}

BOOL sub_1000BCE28(uint64_t a1, void *a2, int a3, int a4)
{
  int __dst = 0;
  int v8 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0LL;
  if (v8 == 4)
  {
    if (a2)
    {
      size_t v10 = (a4 * a3);
      if (__dst != (_DWORD)v10) {
        return 0LL;
      }
      return sub_1000CA55C(*(void *)(a1 + 8), a2, v10) == (_DWORD)v10;
    }

    else
    {
      return __dst == 0;
    }
  }

  return result;
}

uint64_t sub_1000BCED0(uint64_t a1, int a2, uint64_t *a3, int *a4)
{
  int __dst = 0;
  int v8 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v8 == 4)
  {
    int v10 = __dst / a2;
    if (__dst % a2) {
      return 0LL;
    }
    if (!__dst)
    {
      uint64_t v11 = 0LL;
      goto LABEL_10;
    }

    uint64_t result = sub_1000C1074(__dst);
    if (result)
    {
      uint64_t v11 = result;
LABEL_10:
      *a3 = v11;
      *a4 = v10;
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000BCFA0(uint64_t a1, uint64_t *a2)
{
  int __dst = 0;
  int v4 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v4 == 4)
  {
    size_t v6 = __dst;
    if (__dst)
    {
      uint64_t result = sub_1000C1074(__dst);
      if (!result) {
        return result;
      }
      uint64_t v7 = result;
    }

    else
    {
      uint64_t v7 = 0LL;
    }

    *a2 = v7;
    return 1LL;
  }

  return result;
}

BOOL sub_1000BD048(uint64_t a1, int a2, void *a3)
{
  unsigned int __dst = 0;
  int v6 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0LL;
  if (v6 == 4)
  {
    unsigned int v8 = __dst;
    return (int)__dst <= a2 && sub_1000CA55C(*(void *)(a1 + 8), a3, __dst) == v8;
  }

  return result;
}

uint64_t sub_1000BD0DC(uint64_t a1, uint64_t *a2)
{
  int __dst = 0;
  int v4 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v4 == 4)
  {
    if (__dst >= 0) {
      int v6 = __dst;
    }
    else {
      int v6 = __dst + 1;
    }
    if (__dst)
    {
      int v7 = v6 >> 1;
      uint64_t result = sub_1000C1074(2LL * (v6 >> 1));
      if (!result) {
        return result;
      }
      uint64_t v8 = result;
    }

    else
    {
      uint64_t v8 = 0LL;
    }

    *a2 = v8;
    return 1LL;
  }

  return result;
}

BOOL sub_1000BD194(uint64_t a1, int a2, void *a3)
{
  unsigned int __dst = 0;
  int v6 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  BOOL result = 0LL;
  if (v6 == 4)
  {
    if ((__dst & 0x80000000) != 0)
    {
      return 0LL;
    }

    else
    {
      BOOL result = 0LL;
      if ((__dst & 1) == 0 && (int)(__dst >> 1) <= a2)
      {
        uint64_t v8 = *(void *)(a1 + 8);
        unsigned int v9 = __dst & 0xFFFFFFFE;
        return sub_1000CA55C(v8, a3, __dst & 0xFFFFFFFE) == v9;
      }
    }
  }

  return result;
}

uint64_t sub_1000BD23C(uint64_t a1, uint64_t *a2, int *a3)
{
  int __dst = 0;
  int v6 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  if (v6 != 4 || __dst < 0) {
    return result;
  }
  if (!__dst)
  {
    *a2 = 0LL;
    *a3 = 0;
    return 1LL;
  }

  uint64_t result = sub_1000C1074(8LL * __dst);
  if (!result) {
    return result;
  }
  uint64_t v8 = result;
  int v9 = __dst;
  if (__dst < 1)
  {
LABEL_18:
    *a3 = v9;
    *a2 = v8;
    return 1LL;
  }

  uint64_t v10 = 0LL;
  while (1)
  {
    int v16 = 0;
    size_t v12 = v16;
    if (v16)
    {
      uint64_t v13 = (void *)sub_1000C1074(v16);
      if (!v13) {
        break;
      }
      uint64_t v11 = v13;
    }

    else
    {
      uint64_t v11 = 0LL;
    }

    *(void *)(v8 + 8 * v10++) = v11;
    int v9 = __dst;
    if (v10 >= __dst) {
      goto LABEL_18;
    }
  }

  if (v10)
  {
    uint64_t v14 = v10 + 1;
    do
      sub_1000C0EF8(*(void *)(v8 + 8LL * (v14-- - 2)));
    while (v14 > 1);
  }

  sub_1000C0EF8(v8);
  return 0LL;
}

BOOL sub_1000BD380(uint64_t a1, size_t __nitems, void *__dst)
{
  return sub_1000CA55C(*(void *)(a1 + 8), __dst, __nitems) == (_DWORD)__nitems;
}

uint64_t sub_1000BD3B4(uint64_t a1, void **a2, int a3, int a4, int a5)
{
  uint64_t __dst = 0LL;
  int v10 = sub_1000CA55C(*(void *)(a1 + 8), (char *)&__dst + 4, 4uLL);
  uint64_t result = 0LL;
  if (v10 == 4)
  {
    if (sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL) == 4)
    {
      if (a2 || !__dst)
      {
        uint64_t result = 0LL;
        if (__dst == __PAIR64__(a3, a4)) {
          return sub_1000BD4A8(a1, a2, a3, a4, a5);
        }
      }

      else
      {
        return 0LL;
      }
    }

    else
    {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000BD4A8(uint64_t a1, void **a2, int a3, int a4, int a5)
{
  if (a3 < 1) {
    return 1LL;
  }
  uint64_t v16 = v5;
  uint64_t v17 = v6;
  size_t v9 = (a5 * a4);
  uint64_t v10 = a3;
  if (a4)
  {
    while (1)
    {
      uint64_t v11 = *a2;
      if (!*a2) {
        break;
      }
      int __dst = 0;
      BOOL v12 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && __dst == (_DWORD)v9;
      ++a2;
      if (!--v10) {
        return 1LL;
      }
    }
  }

  else
  {
    while (1)
    {
      uint64_t v14 = *a2;
      int __dst = 0;
      if (v14)
      {
      }

      else if (__dst)
      {
        return 0LL;
      }

      ++a2;
      if (!--v10) {
        return 1LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000BD5C4(uint64_t a1, void **a2, int a3, int a4, int a5, int *a6)
{
  int __dst = 0;
  int v12 = sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL);
  uint64_t result = 0LL;
  int v14 = 0;
  if (v12 == 4)
  {
    int v15 = __dst;
    if (__dst % a4)
    {
      uint64_t result = 0LL;
      int v14 = 0;
    }

    else
    {
      int v16 = a4 + __dst - 1;
      int v14 = v16 / a4;
      if (v16 / a4 <= a3)
      {
        if (v14 < 1)
        {
          uint64_t result = 1LL;
          goto LABEL_15;
        }

        uint64_t v17 = (v16 / a4);
        while (1)
        {
          int v18 = v15 >= a4 ? a4 : v15;
          v15 -= v18;
          ++a2;
          uint64_t result = 1LL;
          if (!--v17) {
            goto LABEL_15;
          }
        }
      }

      uint64_t result = 0LL;
    }
  }

uint64_t sub_1000BD6CC(uint64_t a1, uint64_t *a2, int a3, int a4, int a5, _DWORD *a6)
{
  int __dst = 0;
  if (sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && !(__dst % a4))
  {
    uint64_t v13 = ((a4 - 1 + __dst) / a4);
    if ((int)v13 <= a3)
    {
      if (a3)
      {
        uint64_t result = sub_1000C1074(8LL * a3);
        uint64_t v12 = result;
        if (!result) {
          goto LABEL_5;
        }
        if ((int)v13 >= 1)
        {
          uint64_t v15 = v13 - 1;
          int v16 = (uint64_t *)result;
          do
          {
            uint64_t v17 = v15;
            uint64_t v18 = sub_1000C1074(a5 * a4);
            *v16++ = v18;
            if (!v18) {
              break;
            }
            uint64_t v15 = v17 - 1;
          }

          while (v17);
        }

        int v19 = __dst;
        if ((a4 - 1 + __dst) / a4 >= 1)
        {
          uint64_t v20 = 0LL;
          uint64_t v25 = a6;
          uint64_t v26 = 8LL * ((a4 - 1 + __dst) / a4);
          while (1)
          {
            int v21 = v19 >= a4 ? a4 : v19;
            v19 -= v21;
            v20 += 8LL;
            uint64_t result = 1LL;
            if (v26 == v20)
            {
              a6 = v25;
              goto LABEL_5;
            }
          }

          a6 = v25;
          if ((int)v13 >= 1)
          {
            uint64_t v22 = v13;
            uint64_t v23 = (uint64_t *)v12;
            do
            {
              uint64_t v24 = *v23++;
              sub_1000C0EF8(v24);
              --v22;
            }

            while (v22);
          }

          sub_1000C0EF8(v12);
          goto LABEL_4;
        }
      }

      else
      {
        uint64_t v12 = 0LL;
      }

      uint64_t result = 1LL;
      goto LABEL_5;
    }

    uint64_t v12 = 0LL;
  }

  else
  {
    uint64_t v12 = 0LL;
    LODWORD(v13) = 0;
  }

uint64_t sub_1000BD870( uint64_t a1, uint64_t *a2, int a3, signed int a4, int a5, uint64_t (*a6)(uint64_t, void, uint64_t), _DWORD *a7)
{
  int __dst = 0;
  if (sub_1000CA55C(*(void *)(a1 + 8), &__dst, 4uLL) == 4 && !(__dst % a4))
  {
    uint64_t v16 = ((a4 - 1 + __dst) / a4);
    if ((int)v16 <= a3)
    {
      int v17 = sub_1000CA554(*(void *)(a1 + 8));
      if (a3)
      {
        uint64_t result = sub_1000C1074(8LL * a3);
        uint64_t v15 = result;
        if (!result) {
          goto LABEL_4;
        }
      }

      else
      {
        uint64_t v15 = 0LL;
      }

      int v33 = v17;
      uint64_t v34 = a7;
      uint64_t v36 = a2;
      if ((int)v16 >= 1)
      {
        uint64_t v18 = v16 - 1;
        int v19 = (uint64_t *)v15;
        do
        {
          uint64_t v20 = v18;
          uint64_t v21 = sub_1000C1074(a5 * a4);
          *v19++ = v21;
          if (!v21) {
            break;
          }
          uint64_t v18 = v20 - 1;
        }

        while (v20);
      }

      unsigned int v22 = __dst;
      uint64_t v35 = ((a4 - 1 + __dst) / a4);
      if ((int)v35 < 1)
      {
LABEL_26:
        int v28 = sub_1000CA554(*(void *)(a1 + 8));
        int v38 = 0;
        uint64_t result = sub_1000CA55C(*(void *)(a1 + 8), &v38, 4uLL) != 4 || v38 == v28 - v33;
      }

      else
      {
        uint64_t v23 = 0LL;
        uint64_t v24 = a5;
        while (1)
        {
          uint64_t v25 = (int)v22 >= a4 ? a4 : v22;
          int v37 = v25;
LABEL_17:
          v22 -= v37;
          if (++v23 == v35) {
            goto LABEL_26;
          }
        }

        uint64_t v26 = *(void *)(v15 + 8 * v23);
        uint64_t v27 = v25;
        while (1)
        {
          uint64_t result = a6(a1, 0LL, v26);
          if (!(_DWORD)result) {
            break;
          }
          v26 += v24;
          if (!--v27) {
            goto LABEL_17;
          }
        }
      }

      a7 = v34;
      a2 = v36;
      if (v15 && !(_DWORD)result)
      {
        if ((int)v16 >= 1)
        {
          uint64_t v30 = v16;
          uint64_t v31 = (uint64_t *)v15;
          do
          {
            uint64_t v32 = *v31++;
            sub_1000C0EF8(v32);
            --v30;
          }

          while (v30);
        }

        sub_1000C0EF8(v15);
        uint64_t result = 0LL;
        a2 = v36;
      }
    }

    else
    {
      uint64_t result = 0LL;
      uint64_t v15 = 0LL;
    }
  }

  else
  {
    uint64_t result = 0LL;
    uint64_t v15 = 0LL;
    LODWORD(v16) = 0;
  }

uint64_t sub_1000BDA88(uint64_t a1, _BYTE *a2, char *a3)
{
  uint64_t v6 = sub_1000C1074(24LL);
  if (v6)
  {
    v8[0] = 0;
    if (a3) {
      sub_1000C896C(v8, a3, 256);
    }
    sub_1000C89F8(v8, a2, 256);
    *(void *)uint64_t v6 = a1;
    *(void *)(v6 + 8) = sub_1000CA714(a1, (char *)v8);
    *(_DWORD *)(v6 + 16) = *(_DWORD *)(a1 + 20);
  }

  return v6;
}

uint64_t sub_1000BDB48(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000CA190(*(void *)(result + 8));
    return sub_1000C0EF8(v1);
  }

  return result;
}

BOOL sub_1000BDB78(uint64_t a1, __int32 a2, uint8x8_t a3)
{
  __ptr.i32[0] = a2;
  if (*(_DWORD *)(a1 + 16)) {
    sub_1000C8E90(&__ptr, 4, a3);
  }
  return sub_1000CA888(*(void *)(a1 + 8), &__ptr, 4uLL) == 4;
}

int8x8_t *sub_1000BDBCC(uint64_t a1, void *a2, unsigned int a3, int a4, uint8x8_t a5)
{
  __ptr.i32[0] = a4 * a3;
  int v6 = *(_DWORD *)(a1 + 16);
  if (a2)
  {
    if (v6) {
      sub_1000C8E90(&__ptr, 4, a5);
    }
    int v10 = sub_1000CA888(*(void *)(a1 + 8), &__ptr, 4uLL);
    if (*(_DWORD *)(a1 + 16)) {
      sub_1000C8E90(&__ptr, 4, v11);
    }
    if (v10 == 4) {
      return sub_1000BDCE4(a1, a2, a3, a4);
    }
    else {
      return 0LL;
    }
  }

  else
  {
    if (v6) {
      sub_1000C8E90(&__ptr, 4, a5);
    }
    int v13 = sub_1000CA888(*(void *)(a1 + 8), &__ptr, 4uLL);
    if (*(_DWORD *)(a1 + 16)) {
      sub_1000C8E90(&__ptr, 4, v14);
    }
    return (int8x8_t *)(v13 == 4);
  }

int8x8_t *sub_1000BDCE4(uint64_t a1, void *__ptr, unsigned int a3, int a4)
{
  size_t v6 = a4 * a3;
  if (a4 >= 2 && *(_DWORD *)(a1 + 16))
  {
    uint64_t result = (int8x8_t *)sub_1000C1074((int)v6);
    if (!result) {
      return result;
    }
    int v10 = result;
    memcpy(result, __ptr, (int)v6);
    switch(a4)
    {
      case 8:
        sub_1000C8E6C(v10, a3);
        break;
      case 4:
        sub_1000C8D84((uint64_t)v10, a3, v11);
        break;
      case 2:
        sub_1000C8CC0((uint64_t)v10, a3);
        break;
    }

    int v12 = sub_1000CA888(*(void *)(a1 + 8), v10, v6);
    sub_1000C0EF8((uint64_t)v10);
  }

  else
  {
    int v12 = sub_1000CA888(*(void *)(a1 + 8), __ptr, a4 * a3);
  }

  return (int8x8_t *)(v12 == (_DWORD)v6);
}

BOOL sub_1000BDDD8(uint64_t a1, size_t a2, void *__ptr)
{
  return sub_1000CA888(*(void *)(a1 + 8), __ptr, a2) == (_DWORD)a2;
}

uint64_t sub_1000BDE0C(uint64_t a1, void **a2, int a3, unsigned int a4, int a5, uint8x8_t a6)
{
  LODWORD(v8) = a3;
  __ptr.i32[0] = a4 * a3;
  if (*(_DWORD *)(a1 + 16)) {
    sub_1000C8E90(&__ptr, 4, a6);
  }
  uint64_t v8 = v8;
  while (1)
  {
    uint64_t result = (uint64_t)sub_1000BDCE4(a1, *a2, a4, a5);
    if (!(_DWORD)result) {
      break;
    }
    ++a2;
    if (!--v8) {
      return 1LL;
    }
  }

  return result;
}

BOOL sub_1000BDED0( uint64_t a1, uint64_t a2, int a3, int a4, int a5, uint64_t (*a6)(uint64_t, uint64_t, uint64_t), uint8x8_t a7)
{
  uint64_t v13 = *(unsigned int *)(a1 + 16);
  __ptr.i32[0] = a4 * a3;
  if ((_DWORD)v13) {
    sub_1000C8E90(&__ptr, 4, a7);
  }
  int v14 = sub_1000CA554(*(void *)(a1 + 8));
  int v15 = v14;
  if (a3 < 1)
  {
    LODWORD(v16) = 0;
    BOOL result = 0LL;
    goto LABEL_18;
  }

  if (a4 < 1)
  {
    LODWORD(v16) = a3;
    BOOL result = 0LL;
LABEL_18:
    if ((_DWORD)v16 == a3)
    {
      __ptr.i32[1] = sub_1000CA554(*(void *)(a1 + 8)) - v15;
      if (*(_DWORD *)(a1 + 16)) {
        sub_1000C8E90((int8x8_t *)((char *)&__ptr + 4), 4, v23);
      }
      return sub_1000CA888(*(void *)(a1 + 8), (char *)&__ptr + 4, 4uLL) == 4;
    }

    return result;
  }

  uint64_t v16 = 0LL;
  int v24 = v14;
  uint64_t v17 = a4;
  while (2)
  {
    uint64_t v18 = *(void *)(a2 + 8 * v16);
    uint64_t v19 = v17;
    do
    {
      int v20 = a6(a1, v13, v18);
      BOOL v21 = v20 == 0;
      if (!v20)
      {
        LODWORD(v16) = v16 + 1;
        goto LABEL_15;
      }

      v18 += a5;
      --v19;
    }

    while (v19);
    break;
  }

uint64_t sub_1000BE054(uint64_t result)
{
  return result;
}

uint64_t sub_1000BE078(int a1, __int16 *a2, int a3, uint64_t a4)
{
  switch(a1)
  {
    case 5:
      return sub_1000CE4A8(a2, a3, a4);
    case 3:
      return sub_1000CF720(a2, a3, a4);
    case 2:
      return sub_1000CE2BC(a2, a3, a4);
  }

  return 3LL;
}

uint64_t sub_1000BE0C8(int a1, __int16 *a2, int a3, int a4, uint64_t a5)
{
  switch(a1)
  {
    case 5:
      return sub_1000CE5D4(a2, a3, a4, a5);
    case 3:
      return sub_1000CF5E4(a2, a3, a4, a5);
    case 2:
      return sub_1000CE344(a2, a3, a4, a5);
  }

  return 3LL;
}

uint64_t sub_1000BE124(int a1, char *a2, int a3, uint64_t a4)
{
  switch(a1)
  {
    case 5:
      return sub_1000CE3CC(a2, a3, a4);
    case 3:
      return sub_1000CF40C(a2, a3, a4);
    case 2:
      return sub_1000CE25C(a2, a3, a4);
  }

  return 0LL;
}

uint64_t sub_1000BE174(uint64_t a1, int a2, int a3)
{
  int v9 = 0;
  int v6 = sub_1000C294C(a2, &v9);
  uint64_t result = 0LL;
  if (v6 == a2)
  {
    *(void *)a1 = 0LL;
    int v8 = v9;
    *(_DWORD *)(a1 + 8) = a2;
    *(_DWORD *)(a1 + 12) = v8;
    *(void *)(a1 + 16) = 0LL;
    *(_DWORD *)(a1 + 24) = 0;
    if (a3 < 1) {
      return 1LL;
    }
    uint64_t result = sub_1000C1A34((const void **)a1, (int *)(a1 + 20), a3);
    if ((_DWORD)result) {
      return 1LL;
    }
  }

  return result;
}

uint64_t *sub_1000BE1FC(uint64_t *result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t result = (uint64_t *)sub_1000C1BC8(*result, *((unsigned int *)v1 + 5), *((_DWORD *)v1 + 4));
    *uint64_t v1 = 0LL;
    v1[2] = 0LL;
    *((_DWORD *)v1 + 6) = 0;
  }

  return result;
}

uint64_t sub_1000BE234(uint64_t result, int a2)
{
  if (result)
  {
    uint64_t v3 = result;
    uint64_t result = sub_1000C1744( (const void **)result,  (int *)(result + 20),  (signed int *)(result + 16),  *(_DWORD *)(result + 12),  1,  a2);
    if ((_DWORD)result) {
      *(_DWORD *)(v3 + 24) = a2;
    }
  }

  return result;
}

BOOL sub_1000BE278(uint64_t a1, uint64_t a2, uint8x8_t a3)
{
  BOOL result = 0LL;
  if (a1)
  {
    if (a2)
    {
      BOOL result = sub_1000BDB78(a2, *(_DWORD *)(a1 + 8), a3);
      if (result)
      {
        BOOL result = sub_1000BDB78(a2, *(_DWORD *)(a1 + 12), v6);
        if (result)
        {
          BOOL result = sub_1000BDB78(a2, *(_DWORD *)(a1 + 16), v7);
          if (result)
          {
            BOOL result = sub_1000BDB78(a2, *(_DWORD *)(a1 + 20), v8);
            if (result)
            {
              BOOL result = sub_1000BDB78(a2, *(_DWORD *)(a1 + 24), v9);
              if (result) {
                return sub_1000BDE0C(a2, *(void ***)a1, *(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 8), 1, v10) != 0;
              }
            }
          }
        }
      }
    }
  }

  return result;
}

uint64_t sub_1000BE314(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    int v10 = 0;
    int v9 = 0;
    uint64_t v8 = 0LL;
    int v7 = 0;
    uint64_t result = sub_1000BCD38(a2, &v10);
    if ((_DWORD)result)
    {
      uint64_t result = sub_1000BCD38(a2, &v9);
      if ((_DWORD)result)
      {
        uint64_t result = sub_1000BCD38(a2, (char *)&v8 + 4);
        if ((_DWORD)result)
        {
          uint64_t result = sub_1000BCD38(a2, &v8);
          if ((_DWORD)result)
          {
            uint64_t result = sub_1000BCD38(a2, &v7);
            if ((_DWORD)result)
            {
              uint64_t result = 0LL;
              if (v10 >= 1 && v9 >= 1 && (v8 & 0x80000000) == 0 && (v8 & 0x8000000000000000LL) == 0)
              {
                int v5 = v7;
                if ((v7 & 0x80000000) == 0)
                {
                  if (*(int *)(a1 + 16) < 1)
                  {
                    uint64_t result = sub_1000BE174(a1, v10, v8);
                    if (!(_DWORD)result) {
                      return result;
                    }
                    int v5 = v7;
                  }

                  else if (v10 != *(_DWORD *)(a1 + 8) {
                         || v9 != *(_DWORD *)(a1 + 12)
                  }
                         || (_DWORD)v8 != *(_DWORD *)(a1 + 20))
                  {
                    return 0LL;
                  }

                  if (v5 < 1 || (uint64_t result = sub_1000BE234(a1, v5), (_DWORD)result))
                  {
                    int v6 = 0;
                    uint64_t result = sub_1000BD5C4(a2, *(void ***)a1, *(_DWORD *)(a1 + 20), *(_DWORD *)(a1 + 8), 1, &v6);
                    if ((_DWORD)result) {
                      return *(_DWORD *)(a1 + 16) == v6;
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

uint64_t sub_1000BE4A0(unint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v3 = (char *)a1;
    int v4 = sub_1000C88E4(a1);
    if ((v4 & 0x80000000) == 0)
    {
      int v5 = v4 + 1;
      do
      {
        char v6 = *v3++;
        a2 = dword_1000F1784[(v6 ^ a2)] ^ (a2 >> 8);
        --v5;
      }

      while (v5);
    }
  }

  return a2;
}

uint64_t sub_1000BE4F8(char a1, unsigned int a2)
{
  return dword_1000F1784[(a2 ^ a1)] ^ (a2 >> 8);
}

uint64_t sub_1000BE514(unsigned int a1, unsigned int a2)
{
  return dword_1000F1784[(LOBYTE(dword_1000F1784[(a1 ^ a2)]) ^ BYTE1(a2)) ^ (a1 >> 8)] ^ ((dword_1000F1784[(a1 ^ a2)] ^ (a2 >> 8)) >> 8);
}

uint64_t sub_1000BE540(unsigned int a1, unsigned int a2)
{
  unsigned int v2 = dword_1000F1784[(a2 ^ a1)] ^ (a2 >> 8);
  unsigned int v3 = dword_1000F1784[(v2 ^ BYTE1(a1))] ^ (v2 >> 8);
  unsigned int v4 = dword_1000F1784[(v3 ^ BYTE2(a1))] ^ (v3 >> 8);
  return dword_1000F1784[v4 ^ HIBYTE(a1)] ^ (v4 >> 8);
}

uint64_t sub_1000BE58C(unint64_t *a1, int a2, uint64_t a3)
{
  if (a2 >= 1)
  {
    uint64_t v3 = a2;
    do
    {
      unint64_t v4 = *a1++;
      unsigned int v5 = dword_1000F1784[(a3 ^ v4)] ^ (a3 >> 8);
      unsigned int v6 = dword_1000F1784[(v5 ^ BYTE1(v4))] ^ (v5 >> 8);
      unsigned int v7 = dword_1000F1784[(v6 ^ BYTE2(v4))] ^ (v6 >> 8);
      unsigned int v8 = dword_1000F1784[v7 ^ BYTE3(v4)] ^ (v7 >> 8);
      unsigned int v9 = dword_1000F1784[(v8 ^ BYTE4(v4))];
      unsigned int v10 = HIWORD(v8) ^ (v9 >> 8) ^ dword_1000F1784[(v9 ^ ((unsigned __int16)(v8 ^ WORD2(v4)) >> 8))];
      unsigned int v11 = dword_1000F1784[(v10 ^ BYTE6(v4))] ^ (v10 >> 8);
      a3 = dword_1000F1784[v11 ^ HIBYTE(v4)] ^ (v11 >> 8);
      --v3;
    }

    while (v3);
  }

  return a3;
}

uint64_t sub_1000BE644(unsigned int a1, int a2, unsigned int a3)
{
  uint64_t v3 = 0LL;
  switch(a2)
  {
    case 1:
      unsigned int v4 = dword_1000F1784[(a3 ^ a1)];
      unsigned int v5 = a3 >> 8;
      goto LABEL_7;
    case 2:
      unsigned int v6 = dword_1000F1784[(a3 ^ a1)] ^ (a3 >> 8);
      int v7 = (LOBYTE(dword_1000F1784[(a3 ^ a1)]) ^ BYTE1(a3) ^ BYTE1(a1));
      goto LABEL_6;
    case 4:
      unsigned int v8 = dword_1000F1784[(a3 ^ a1)] ^ (a3 >> 8);
      unsigned int v9 = dword_1000F1784[(v8 ^ BYTE1(a1))] ^ (v8 >> 8);
      unsigned int v6 = dword_1000F1784[(v9 ^ BYTE2(a1))] ^ (v9 >> 8);
      int v7 = (LOBYTE(dword_1000F1784[(v9 ^ BYTE2(a1))]) ^ BYTE1(v9)) ^ HIBYTE(a1);
      goto LABEL_6;
    case 8:
      unsigned int v10 = dword_1000F1784[(a3 ^ a1)] ^ (a3 >> 8);
      unsigned int v11 = dword_1000F1784[(v10 ^ BYTE1(a1))] ^ (v10 >> 8);
      unsigned int v12 = dword_1000F1784[v11] ^ (v11 >> 8);
      unsigned int v13 = dword_1000F1784[v12] ^ (v12 >> 8);
      unsigned int v14 = dword_1000F1784[v13];
      int v15 = dword_1000F1784[(v14 ^ BYTE1(v13))];
      unsigned int v6 = dword_1000F1784[(v15 ^ BYTE1(v14) ^ BYTE2(v13))] ^ ((v15 ^ (v14 >> 8) ^ HIWORD(v13)) >> 8);
      int v7 = v6;
LABEL_6:
      unsigned int v5 = dword_1000F1784[v7];
      unsigned int v4 = v6 >> 8;
LABEL_7:
      uint64_t v3 = v4 ^ v5;
      break;
    default:
      return v3;
  }

  return v3;
}

uint64_t sub_1000BE770(unint64_t *a1, int a2, int a3, uint64_t a4)
{
  uint64_t v4 = 0LL;
  switch(a2)
  {
    case 1:
      if (a3 < 1) {
        return a4;
      }
      LODWORD(v4) = a4;
      do
      {
        char v5 = *(_BYTE *)a1;
        a1 = (unint64_t *)((char *)a1 + 1);
        uint64_t v4 = dword_1000F1784[(v5 ^ v4)] ^ (v4 >> 8);
        --a3;
      }

      while (a3);
      return v4;
    case 2:
      if (a3 < 1) {
        return a4;
      }
      uint64_t v6 = a3;
      LODWORD(v4) = a4;
      do
      {
        unsigned int v7 = *(unsigned __int16 *)a1;
        a1 = (unint64_t *)((char *)a1 + 2);
        unsigned int v8 = dword_1000F1784[(v4 ^ v7)] ^ (v4 >> 8);
        uint64_t v4 = dword_1000F1784[v8 ^ (v7 >> 8)] ^ (v8 >> 8);
        --v6;
      }

      while (v6);
      return v4;
    case 4:
      if (a3 < 1) {
        return a4;
      }
      uint64_t v9 = a3;
      LODWORD(v4) = a4;
      do
      {
        unsigned int v10 = *(_DWORD *)a1;
        a1 = (unint64_t *)((char *)a1 + 4);
        unsigned int v11 = dword_1000F1784[(v10 ^ v4)] ^ (v4 >> 8);
        unsigned int v12 = dword_1000F1784[(v11 ^ BYTE1(v10))] ^ (v11 >> 8);
        unsigned int v13 = dword_1000F1784[(v12 ^ BYTE2(v10))] ^ (v12 >> 8);
        uint64_t v4 = dword_1000F1784[v13 ^ HIBYTE(v10)] ^ (v13 >> 8);
        --v9;
      }

      while (v9);
      return v4;
    case 8:
      return sub_1000BE58C(a1, a3, a4);
    default:
      return v4;
  }

uint64_t sub_1000BE894(uint64_t result, unint64_t a2, uint64_t a3)
{
  if (a2)
  {
    uint64_t v3 = 0LL;
    do
    {
      *(_BYTE *)(a3 + v3) = byte_1000F1B84[*(unsigned __int8 *)(result + v3)];
      ++v3;
    }

    while (a2 > v3);
  }

  return result;
}

uint64_t sub_1000BE8C0(uint64_t result, unint64_t a2, uint64_t a3)
{
  for (unsigned int i = 0; i < a2; ++i)
    *(_BYTE *)(a3 + i) = byte_1000F1C84[*(unsigned __int8 *)(result + i)];
  return result;
}

uint64_t sub_1000BE914( const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9 = (const char *)sub_1000BE930(a1, a2, a3, &a9);
  return sub_1000BE930(v9, v10, v11, v12);
}

uint64_t sub_1000BE930(const char *a1, int a2, const char *a3, va_list a4)
{
  uint64_t v4 = (unsigned int *)off_1000FD768;
  if (!off_1000FD768) {
    sub_1000D934C(a1, a2, "Recognizer error", 0LL, 0LL);
  }
  *((_DWORD *)off_1000FD768 + 10) = a2;
  *((void *)v4 + 4) = a1;
  char v5 = (char *)*((void *)v4 + 3);
  if (v5) {
    sub_1000CF848(v5, v4[5], a3, a4);
  }
  sub_1000BE974();
  return sub_1000BE974();
}

uint64_t sub_1000BE974()
{
  if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 2312)) {
    abort();
  }
  if (!off_1000FD768) {
    sub_1000D934C("vsterr.c", 359, "No error handling installed", 0LL, 0LL);
  }
  uint64_t v0 = *((int *)off_1000FD768 + 1);
  if ((_DWORD)v0)
  {
    uint64_t v1 = *((void *)off_1000FD768 + 1);
    uint64_t v2 = v0 - 1;
    *((_DWORD *)off_1000FD768 + 1) = v2;
    longjmp((int *)(v1 + 192 * v2), 1);
  }

  if (!off_1000FDE58) {
    sub_1000BEAD0();
  }
  uint64_t v3 = off_1000FDE58();
  return sub_1000BE9FC(v3);
}

uint64_t sub_1000BE9FC()
{
  uint64_t v0 = off_1000FD768;
  if (!off_1000FD768) {
    sub_1000D934C("vsterr.c", 287, "No error handling installed", 0LL, 0LL);
  }
  int v1 = *((_DWORD *)off_1000FD768 + 1);
  *((_DWORD *)off_1000FD768 + 1) = v1 + 1;
  if (v0[4] <= v1) {
    v0[4] = v1 + 1;
  }
  return *((void *)v0 + 1) + 192LL * v1;
}

void sub_1000BEA60()
{
  if (!off_1000FD768) {
    sub_1000D934C("vsterr.c", 313, "No error handling installed", 0LL, 0LL);
  }
  --*((_DWORD *)off_1000FD768 + 1);
}

uint64_t sub_1000BEAA8()
{
  return 0LL;
}

void *sub_1000BEAB0(void *a1)
{
  int v1 = off_1000FD768;
  off_1000FD768 = a1;
  return v1;
}

void *sub_1000BEAC4()
{
  return off_1000FD768;
}

void sub_1000BEAD0()
{
  int v0 = sub_1000BEAA8();
  int v1 = sub_10003F3EC();
  sub_1000D934C(v1, v0, "Recognizer error", 0LL, 0LL);
}

uint64_t sub_1000BEB00(unint64_t a1, int a2, uint64_t a3)
{
  for (unsigned int i = (unsigned __int8 *)(a1 + a2 - 1);
        (unint64_t)i >= a1;
        a3 = (dword_1000F1E10[v4] ^ __ROR4__(a3, 31)))
  {
    int v4 = *i--;
  }

  return a3;
}

uint64_t sub_1000BEB34( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v26 = 0;
  sub_1000C0BFC(0x28uLL, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v12 = v11;
  if (a1 <= 4) {
    uint64_t v13 = 4LL;
  }
  else {
    uint64_t v13 = a1;
  }
  int v14 = sub_1000C294C(v13, &v26);
  sub_1000C0BFC(8LL * v14, v15, v16, v17, v18, v19, v20, v21);
  *(void *)uint64_t v12 = v22;
  if (!v22) {
    return 0LL;
  }
  *(_DWORD *)(v12 + 8) = v14;
  *(_DWORD *)(v12 + 12) = 0;
  uint8x8_t v23 = sub_1000BEB00;
  if (a3) {
    uint8x8_t v23 = (uint64_t (*)(unint64_t, int, uint64_t))a3;
  }
  *(void *)(v12 + 24) = a2;
  *(void *)(v12 + 32) = v23;
  signed int v24 = vcvtmd_s64_f64((double)v14 * 0.5 + 0.5);
  if (v14 <= v24) {
    signed int v24 = v14 - 1;
  }
  *(_DWORD *)(v12 + 16) = v24;
  *(_DWORD *)(v12 + 20) = v14 - 1;
  return v12;
}

uint64_t sub_1000BEBFC(uint64_t result, double a2)
{
  if (result)
  {
    int v2 = *(_DWORD *)(result + 8);
    signed int v3 = vcvtmd_s64_f64((double)v2 * a2 + 0.5);
    *(_DWORD *)(result + 16) = v3;
    if (v2 <= v3) {
      *(_DWORD *)(result + 16) = v2 - 1;
    }
  }

  return result;
}

uint64_t *sub_1000BEC30(uint64_t *result)
{
  if (result)
  {
    int v1 = result;
    sub_1000C0EF8(*result);
    *int v1 = 0LL;
    return (uint64_t *)sub_1000C0EF8((uint64_t)v1);
  }

  return result;
}

uint64_t sub_1000BEC64( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v22 = 0LL;
  int v10 = *(_DWORD *)(a1 + 16);
  if (*(_DWORD *)(a1 + 12) > v10)
  {
    uint64_t v11 = *(void *)a1;
    uint64_t v12 = *(int *)(a1 + 8);
    *(_DWORD *)(a1 + 8) = 2 * v12;
    *(_DWORD *)(a1 + 12) = 0;
    *(_DWORD *)(a1 + 16) = 2 * v10;
    *(_DWORD *)(a1 + 20) = 2 * v12 - 1;
    sub_1000C0BFC(16 * v12, a2, a3, a4, a5, a6, a7, a8);
    if (v13)
    {
      uint64_t v12 = v12;
      *(void *)a1 = v13;
      if ((int)v12 >= 1)
      {
        int v14 = (void *)v11;
        do
        {
          if (*v14) {
            sub_1000BEC64(a1);
          }
          ++v14;
          --v12;
        }

        while (v12);
      }

      sub_1000C0EF8(v11);
    }
  }

  uint64_t v15 = (*(uint64_t (**)(uint64_t, const void **))(a1 + 24))(a2, &v22);
  uint64_t v16 = v22;
  int v17 = *(_DWORD *)(a1 + 20) & (*(uint64_t (**)(const void *, uint64_t, void))(a1 + 32))(v22, v15, 0LL);
  uint64_t v18 = v17;
  __s1 = 0LL;
  uint64_t v19 = *(void *)a1;
  uint64_t result = *(void *)(*(void *)a1 + 8LL * v17);
  if (result)
  {
    int v21 = 1;
    while (1)
    {
      if ((*(unsigned int (**)(void))(a1 + 24))() == (_DWORD)v15)
      {
        uint64_t result = memcmp(__s1, v16, (int)v15);
        if (!(_DWORD)result) {
          break;
        }
      }

      if (v17 + 1 == *(_DWORD *)(a1 + 8)) {
        int v17 = 0;
      }
      else {
        ++v17;
      }
      __s1 = 0LL;
      uint64_t v19 = *(void *)a1;
      uint64_t v18 = v17;
      uint64_t result = *(void *)(*(void *)a1 + 8LL * v17);
      ++v21;
      if (!result) {
        goto LABEL_18;
      }
    }

    uint64_t v19 = *(void *)a1;
  }

uint64_t sub_1000BEDD4(uint64_t result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  uint64_t v3 = result;
  int v37 = 0LL;
  uint64_t v4 = (*(uint64_t (**)(uint64_t, const void **))(result + 24))(a2, &v37);
  char v5 = v37;
  int v6 = (*(uint64_t (**)(const void *, uint64_t, void))(v3 + 32))(v37, v4, 0LL);
  if (*(int *)(v3 + 8) < 1)
  {
LABEL_14:
    uint64_t v20 = 0LL;
    uint64_t result = MEMORY[0];
    if (MEMORY[0]) {
      return result;
    }
    goto LABEL_15;
  }

  int v14 = 0;
  int v15 = *(_DWORD *)(v3 + 20) & v6;
  while (1)
  {
    __s1 = 0LL;
    uint64_t v17 = *(void *)v3;
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)(*(void *)v3 + 8LL * v15);
    if (!v19) {
      break;
    }
    if ((*(unsigned int (**)(uint64_t, void **))(v3 + 24))(v19, &__s1) == (_DWORD)v4
      && !memcmp(__s1, v5, (int)v4))
    {
      uint64_t v17 = *(void *)v3;
      break;
    }

    int v16 = *(_DWORD *)(v3 + 8);
    if ((_DWORD)v18 + 1 == v16) {
      int v15 = 0;
    }
    else {
      int v15 = v18 + 1;
    }
    if (++v14 >= v16) {
      goto LABEL_14;
    }
  }

  uint64_t v20 = (uint64_t *)(v17 + 8 * v18);
  uint64_t result = *v20;
  if (!*v20)
  {
LABEL_15:
    int v21 = *(_DWORD *)(v3 + 16);
    if (*(_DWORD *)(v3 + 12) > v21)
    {
      uint64_t v22 = *(void *)v3;
      uint64_t v23 = *(int *)(v3 + 8);
      *(_DWORD *)(v3 + 8) = 2 * v23;
      *(_DWORD *)(v3 + 12) = 0;
      *(_DWORD *)(v3 + 16) = 2 * v21;
      *(_DWORD *)(v3 + 20) = 2 * v23 - 1;
      sub_1000C0BFC(16 * v23, v7, v8, v9, v10, v11, v12, v13);
      if (v24)
      {
        uint64_t v23 = v23;
        *(void *)uint64_t v3 = v24;
        if ((int)v23 >= 1)
        {
          uint64_t v31 = (uint64_t *)v22;
          do
          {
            if (*v31) {
              sub_1000BEC64(v3, *v31, v25, v26, v27, v28, v29, v30);
            }
            ++v31;
            --v23;
          }

          while (v23);
        }

        sub_1000C0EF8(v22);
      }

      uint64_t v32 = v37;
      int v33 = *(_DWORD *)(v3 + 20) & (*(uint64_t (**)(const void *, uint64_t, void))(v3 + 32))(v37, v4, 0LL);
      uint64_t v34 = v33;
      __s1 = 0LL;
      uint64_t v35 = *(void *)v3;
      if (*(void *)(*(void *)v3 + 8LL * v33))
      {
        int v36 = 1;
        while ((*(unsigned int (**)(void))(v3 + 24))() != (_DWORD)v4 || memcmp(__s1, v32, (int)v4))
        {
          if (v33 + 1 == *(_DWORD *)(v3 + 8)) {
            int v33 = 0;
          }
          else {
            ++v33;
          }
          __s1 = 0LL;
          uint64_t v35 = *(void *)v3;
          uint64_t v34 = v33;
          ++v36;
          if (!*(void *)(*(void *)v3 + 8LL * v33)) {
            goto LABEL_32;
          }
        }

        uint64_t v35 = *(void *)v3;
      }

uint64_t sub_1000BF004(unsigned int a1)
{
  BOOL v1 = a1 != 247;
  if (a1 < 0xDF) {
    BOOL v1 = 0;
  }
  return a1 - 97 < 0x1A || v1;
}

uint64_t sub_1000BF028(int a1)
{
  BOOL v1 = (a1 + 64) <= 0x1Eu && a1 != 215;
  return (a1 - 65) < 0x1A || v1;
}

uint64_t sub_1000BF054(int a1)
{
  else {
    unsigned __int8 v2 = a1 + 32;
  }
  else {
    return v2;
  }
}

uint64_t sub_1000BF084(int a1)
{
  else {
    unsigned __int8 v2 = a1 - 32;
  }
  else {
    return v2;
  }
}

BOOL sub_1000BF0B4(unsigned int a1)
{
  if ((a1 & 0x80) == 0) {
    return (byte_1000F1D84[a1] & 3) != 0;
  }
  BOOL v3 = a1 > 0xDE && a1 != 247;
  else {
    return v3;
  }
}

BOOL sub_1000BF0FC(int a1)
{
  return (a1 - 48) < 0xA;
}

uint64_t sub_1000BF10C(int a1, int a2)
{
  uint64_t v4 = (int *)sub_1000C1074(24LL);
  uint64_t v5 = (uint64_t)v4;
  if (!v4) {
    return v5;
  }
  *uint64_t v4 = a1;
  v4[1] = a2;
  uint64_t v6 = sub_1000C1074(8LL * a1);
  *(void *)(v5 + 8) = v6;
  if (v6)
  {
    uint64_t v7 = sub_1000C1074(8LL * a2 * a1);
    *(void *)(v5 + 16) = v7;
    if (v7)
    {
      if (a1 >= 1)
      {
        uint64_t v8 = 0LL;
        do
        {
          *(void *)(*(void *)(v5 + 8) + v8) = v7;
          v8 += 8LL;
          v7 += 8LL * a2;
        }

        while (8LL * a1 != v8);
      }

      return v5;
    }

    uint64_t v6 = *(void *)(v5 + 8);
  }

  sub_1000C0EF8(v6);
  sub_1000C0EF8(*(void *)(v5 + 16));
  sub_1000C0EF8(v5);
  return 0LL;
}

uint64_t sub_1000BF1CC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000C0EF8(*(void *)(result + 8));
    sub_1000C0EF8(*(void *)(v1 + 16));
    return sub_1000C0EF8(v1);
  }

  return result;
}

void sub_1000BF204(int *a1, double a2)
{
  uint64_t v2 = *a1;
  if ((int)v2 >= 1)
  {
    uint64_t v5 = 0LL;
    size_t v6 = 8 * v2;
    uint64_t v7 = 8LL * *a1;
    do
    {
      bzero(*(void **)(*((void *)a1 + 1) + v5), v6);
      *(double *)(*(void *)(*((void *)a1 + 1) + v5) + v5) = a2;
      v5 += 8LL;
    }

    while (v7 != v5);
  }

uint64_t sub_1000BF278(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)a3;
  if (*(int *)a3 >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(a3 + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0LL;
          do
          {
            ++v6;
            uint64_t v4 = *(int *)(a3 + 4);
          }

          while (v6 < v4);
          int v3 = *(_DWORD *)a3;
        }

        ++v5;
      }

      while (v5 < v3);
    }
  }

  return result;
}

double sub_1000BF2EC(uint64_t a1, int a2, int a3)
{
  return *(double *)(*(void *)(*(void *)(a1 + 8) + 8LL * a2) + 8LL * a3);
}

uint64_t sub_1000BF2FC(uint64_t result, int a2, int a3, double a4)
{
  *(double *)(*(void *)(*(void *)(result + 8) + 8LL * a2) + 8LL * a3) = a4;
  return result;
}

double sub_1000BF30C(int *a1, uint64_t a2)
{
  if (*a1 >= 1)
  {
    uint64_t v2 = 0LL;
    do
    {
      double result = *(double *)(a2 + 8 * v2);
      *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v2) + 8 * v2) = result;
      ++v2;
    }

    while (v2 < *a1);
  }

  return result;
}

uint64_t sub_1000BF344(uint64_t result, double a2)
{
  int v2 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v3) = *(_DWORD *)(result + 4);
    if ((int)v3 >= 1)
    {
      uint64_t v4 = 0LL;
      do
      {
        if ((int)v3 >= 1)
        {
          uint64_t v5 = 0LL;
          do
          {
            uint64_t v6 = *(void *)(*(void *)(result + 8) + 8 * v4);
            *(double *)(v6 + 8 * v5) = *(double *)(v6 + 8 * v5) * a2;
            ++v5;
            uint64_t v3 = *(int *)(result + 4);
          }

          while (v5 < v3);
          int v2 = *(_DWORD *)result;
        }

        ++v4;
      }

      while (v4 < v2);
    }
  }

  return result;
}

uint64_t sub_1000BF3B0(int *a1, int *a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v12 = *a1;
  uint64_t v13 = a1[1];
  else {
    uint64_t v14 = v12;
  }
  if (v12 >= 1)
  {
    uint64_t v15 = 0LL;
    size_t v16 = 8 * v13;
    do
    {
      memcpy(*(void **)(*((void *)a3 + 1) + 8 * v15), *(const void **)(*((void *)a1 + 1) + 8 * v15), v16);
      ++v15;
    }

    while (v15 < *a1);
  }

  uint64_t v17 = *a2;
  if ((int)v17 >= 1)
  {
    uint64_t v18 = 0LL;
    size_t v19 = 8 * v17;
    uint64_t v20 = 8LL * *a2;
    do
    {
      bzero(*(void **)(*((void *)a2 + 1) + v18), v19);
      *(void *)(*(void *)(*((void *)a2 + 1) + v18) + v18) = 0LL;
      v18 += 8LL;
    }

    while (v20 != v18);
  }

  if (a4)
  {
    uint64_t v21 = sub_1000C0BF4(4LL * *a1, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
    uint64_t v22 = v21;
    if (*a1 >= 1)
    {
      uint64_t v23 = 0LL;
      do
      {
        *(_DWORD *)(v21 + 4 * v23) = v23;
        ++v23;
      }

      while (v23 < *a1);
    }

    LODWORD(v24) = *a3;
    if ((int)v14 >= 1)
    {
      uint64_t v25 = 0LL;
      uint64_t v26 = 1LL;
      while (1)
      {
        uint64_t v27 = *((void *)a3 + 1);
        double v28 = fabs(*(double *)(*(void *)(v27 + 8 * v25) + 8 * v25));
        uint64_t v29 = v25 + 1;
        int v31 = v25;
        if (v28 != 0.0) {
          goto LABEL_25;
        }
LABEL_16:
        ++v26;
        ++v25;
        if (v29 == v14) {
          goto LABEL_39;
        }
      }

      uint64_t v30 = v26;
      int v31 = v25;
      do
      {
        double v32 = fabs(*(double *)(*(void *)(v27 + 8 * v30) + 8 * v25));
        if (v32 > v28)
        {
          int v31 = v30;
          double v28 = v32;
        }

        ++v30;
      }

      while (v24 != v30);
      if (v28 == 0.0) {
        goto LABEL_16;
      }
LABEL_25:
      if (v25 != v31)
      {
        int v33 = *(_DWORD *)(v21 + 4 * v25);
        uint64_t v34 = 4LL * v31;
        *(_DWORD *)(v21 + 4 * v25) = *(_DWORD *)(v21 + v34);
        *(_DWORD *)(v21 + v34) = v33;
        uint64_t v35 = 8LL * v31;
        if (a3[1] >= 1)
        {
          uint64_t v36 = 0LL;
          do
          {
            uint64_t v37 = *((void *)a3 + 1);
            uint64_t v38 = *(void *)(v37 + 8 * v25);
            uint64_t v39 = 8 * v36;
            uint64_t v40 = *(void *)(v38 + 8 * v36);
            *(void *)(v38 + v39) = *(void *)(*(void *)(v37 + v35) + 8 * v36);
            *(void *)(*(void *)(*((void *)a3 + 1) + v35) + v39) = v40;
            ++v36;
          }

          while (v36 < a3[1]);
        }

        if (a2[1] >= 1)
        {
          uint64_t v41 = 0LL;
          do
          {
            uint64_t v42 = *((void *)a2 + 1);
            uint64_t v43 = *(void *)(v42 + 8 * v25);
            uint64_t v44 = 8 * v41;
            uint64_t v45 = *(void *)(v43 + 8 * v41);
            *(void *)(v43 + v44) = *(void *)(*(void *)(v42 + v35) + 8 * v41);
            *(void *)(*(void *)(*((void *)a2 + 1) + v35) + v44) = v45;
            ++v41;
          }

          while (v41 < a2[1]);
        }
      }

      uint64_t v24 = *a3;
      if (v29 < v24)
      {
        uint64_t v46 = v26;
        do
        {
          uint64_t v48 = *((void *)a3 + 1);
          uint64_t v49 = *(void *)(v48 + 8 * v46);
          double v50 = *(double *)(v49 + 8 * v25) / *(double *)(*(void *)(v48 + 8 * v25) + 8 * v25);
          if (a3[1] >= 1)
          {
            uint64_t v51 = 0LL;
            do
            {
              *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v46) + 8 * v51) = *(double *)(*(void *)(*((void *)a3 + 1) + 8 * v46)
                                                                                            + 8 * v51)
                                                                                + -v50
              ++v51;
            }

            while (v51 < a3[1]);
            uint64_t v49 = *(void *)(*((void *)a3 + 1) + 8 * v46);
          }

          *(void *)(v49 + 8 * v25) = 0LL;
          uint64_t v47 = *(void *)(*((void *)a2 + 1) + 8 * v46++);
          *(double *)(v47 + 8 * v25) = v50;
          LODWORD(v24) = *a3;
        }

        while (*a3 > (int)v46);
      }

      goto LABEL_16;
    }

uint64_t sub_1000BF7E0(int *a1, int *a2)
{
  uint64_t v4 = (int *)sub_1000BF10C(*a1, *a1);
  if (!v4) {
    return 1LL;
  }
  uint64_t v10 = (uint64_t)v4;
  if (*v4 >= 1)
  {
    uint64_t v11 = 0LL;
    do
    {
      *(void *)(*(void *)(*((void *)v4 + 1) + 8 * v11) + 8 * v11) = 0x3FF0000000000000LL;
      ++v11;
    }

    while (v11 < *v4);
  }

  uint64_t v12 = sub_1000BF894(a1, v4, a2, v5, v6, v7, v8, v9);
  sub_1000C0EF8(*(void *)(v10 + 8));
  sub_1000C0EF8(*(void *)(v10 + 16));
  sub_1000C0EF8(v10);
  return v12;
}

uint64_t sub_1000BF894(int *a1, int *a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = (void *)sub_1000C0BF4(8LL * *a2, (uint64_t)a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  uint64_t v19 = sub_1000C0BF4(8LL * *a2, v12, v13, v14, v15, v16, v17, v18);
  if (a2[1] < 1)
  {
LABEL_12:
    uint64_t v24 = 0LL;
  }

  else
  {
    uint64_t v20 = 0LL;
    while (1)
    {
      if (*a2 >= 1)
      {
        uint64_t v21 = 0LL;
        do
        {
          v11[v21] = *(void *)(*(void *)(*((void *)a2 + 1) + 8 * v21) + 8 * v20);
          ++v21;
        }

        while (v21 < *a2);
      }

      uint64_t v22 = sub_1000BFC6C(a1, v11, v19);
      if ((_DWORD)v22) {
        break;
      }
      if (*a3 >= 1)
      {
        uint64_t v23 = 0LL;
        do
        {
          *(void *)(*(void *)(*((void *)a3 + 1) + 8 * v23) + 8 * v20) = *(void *)(v19 + 8 * v23);
          ++v23;
        }

        while (v23 < *a3);
      }

      if (++v20 >= a2[1]) {
        goto LABEL_12;
      }
    }

    uint64_t v24 = v22;
  }

  sub_1000C0EF8((uint64_t)v11);
  sub_1000C0EF8(v19);
  return v24;
}

uint64_t sub_1000BF9B4(uint64_t result, uint64_t a2)
{
  int v2 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    uint64_t v3 = 0LL;
    LODWORD(v4) = *(_DWORD *)(result + 4);
    do
    {
      if (v3 < (int)v4)
      {
        uint64_t v5 = v3;
        do
        {
          uint64_t v6 = *(void *)(result + 8);
          uint64_t v7 = *(void *)(*(void *)(v6 + 8 * v3) + 8 * v5);
          *(void *)(*(void *)(*(void *)(a2 + 8) + 8 * v3) + 8 * v5) = *(void *)(*(void *)(v6 + 8 * v5) + 8 * v3);
          *(void *)(*(void *)(*(void *)(a2 + 8) + 8 * v5++) + 8 * v3) = v7;
          uint64_t v4 = *(int *)(result + 4);
        }

        while (v5 < v4);
        int v2 = *(_DWORD *)result;
      }

      ++v3;
    }

    while (v3 < v2);
  }

  return result;
}

uint64_t sub_1000BFA34(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(result + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0LL;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v5) + 8 * v6) = *(double *)(*(void *)(*(void *)(result + 8) + 8 * v5)
                                                                                        + 8 * v6)
            ++v6;
            uint64_t v4 = *(int *)(result + 4);
          }

          while (v6 < v4);
          int v3 = *(_DWORD *)result;
        }

        ++v5;
      }

      while (v5 < v3);
    }
  }

  return result;
}

uint64_t sub_1000BFAB8(uint64_t result, uint64_t a2, uint64_t a3, double a4)
{
  int v4 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v5) = *(_DWORD *)(result + 4);
    if ((int)v5 >= 1)
    {
      uint64_t v6 = 0LL;
      do
      {
        if ((int)v5 >= 1)
        {
          uint64_t v7 = 0LL;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v6) + 8 * v7) = *(double *)(*(void *)(*(void *)(result + 8) + 8 * v6)
                                                                                        + 8 * v7)
                                                                            + a4
            ++v7;
            uint64_t v5 = *(int *)(result + 4);
          }

          while (v7 < v5);
          int v4 = *(_DWORD *)result;
        }

        ++v6;
      }

      while (v6 < v4);
    }
  }

  return result;
}

int *sub_1000BFB3C(int *result, uint64_t a2, uint64_t a3)
{
  if (*result >= 1)
  {
    uint64_t v3 = 0LL;
    do
    {
      *(void *)(a3 + 8 * v3) = 0LL;
      if (result[1] >= 1)
      {
        uint64_t v4 = 0LL;
        double v5 = 0.0;
        do
        {
          double v5 = v5 + *(double *)(*(void *)(*((void *)result + 1) + 8 * v3) + 8 * v4) * *(double *)(a2 + 8 * v4);
          *(double *)(a3 + 8 * v3) = v5;
          ++v4;
        }

        while (v4 < result[1]);
      }

      ++v3;
    }

    while (v3 < *result);
  }

  return result;
}

uint64_t sub_1000BFBB0(uint64_t result, uint64_t a2, uint64_t a3)
{
  int v3 = *(_DWORD *)result;
  if (*(int *)result >= 1)
  {
    LODWORD(v4) = *(_DWORD *)(a2 + 4);
    if ((int)v4 >= 1)
    {
      uint64_t v5 = 0LL;
      do
      {
        if ((int)v4 >= 1)
        {
          uint64_t v6 = 0LL;
          do
          {
            *(void *)(*(void *)(*(void *)(a3 + 8) + 8 * v5) + 8 * v6) = 0LL;
            if (*(int *)(result + 4) >= 1)
            {
              uint64_t v7 = 0LL;
              do
              {
                uint64_t v8 = *(void *)(*(void *)(a3 + 8) + 8 * v5);
                *(double *)(v8 + 8 * v6) = *(double *)(v8 + 8 * v6)
                ++v7;
              }

              while (v7 < *(int *)(result + 4));
            }

            ++v6;
            uint64_t v4 = *(int *)(a2 + 4);
          }

          while (v6 < v4);
          int v3 = *(_DWORD *)result;
        }

        ++v5;
      }

      while (v5 < v3);
    }
  }

  return result;
}

uint64_t sub_1000BFC6C(int *a1, const void *a2, uint64_t a3)
{
  uint64_t v6 = sub_1000BF10C(*a1, *a1);
  uint64_t v7 = sub_1000BF10C(*a1, a1[1]);
  uint64_t v15 = (uint64_t *)sub_1000C80C0(*a1, v8, v9, v10, v11, v12, v13, v14);
  if (sub_1000BF3B0(a1, (int *)v6, (int *)v7, (uint64_t)v15, v16, v17, v18, v19))
  {
    uint64_t v23 = 1LL;
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  uint64_t v23 = sub_1000BFD4C((int *)v6, (unsigned int *)v7, (uint64_t)v15, a2, a3, v20, v21, v22);
  if (v6)
  {
LABEL_3:
    sub_1000C0EF8(*(void *)(v6 + 8));
    sub_1000C0EF8(*(void *)(v6 + 16));
    sub_1000C0EF8(v6);
  }

uint64_t sub_1000BFD4C( int *a1, unsigned int *a2, uint64_t a3, const void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v13 = 8LL * *a1;
  uint64_t v14 = (void *)sub_1000C0BF4(v13, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8);
  memcpy(v14, a4, v13);
  if (a3) {
    sub_1000C8248(a3, 0xFFFFFFFFLL, (uint64_t)v14, 8LL, v18, v19, v20, v21);
  }
  uint64_t v22 = sub_1000C0BF4(v13, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  if (*a1 >= 1)
  {
    uint64_t v24 = 0LL;
    while (*(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * v24) != 0.0)
    {
      double v25 = *((double *)v14 + v24);
      *(double *)(v22 + 8 * v24) = v25;
      if (v24)
      {
        for (uint64_t i = 0LL; i != v24; ++i)
        {
          double v25 = v25 - *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * i) * *(double *)(v22 + 8 * i);
          *(double *)(v22 + 8 * v24) = v25;
        }
      }

      *(double *)(v22 + 8 * v24) = v25 / *(double *)(*(void *)(*((void *)a1 + 1) + 8 * v24) + 8 * v24);
      if (++v24 >= *a1) {
        goto LABEL_11;
      }
    }

    sub_1000C0EF8((uint64_t)v14);
    goto LABEL_20;
  }

uint64_t sub_1000BFF1C( unsigned int *a1, int *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *a1;
  uint64_t v101 = (int)*a1;
  sub_1000C0BFC(8 * v101, (uint64_t)a2, a3, a4, a5, a6, a7, a8);
  unint64_t v13 = v12;
  sub_1000C0BFC(8 * v101, v14, v15, v16, v17, v18, v19, v20);
  uint64_t v22 = v21;
  sub_1000C0BFC(8 * v101, v23, v24, v25, v26, v27, v28, v29);
  uint64_t v31 = v30;
  uint64_t v32 = *a2;
  if ((int)v32 >= 1)
  {
    uint64_t v33 = 0LL;
    size_t v34 = 8 * v32;
    uint64_t v35 = 8LL * *a2;
    do
    {
      bzero(*(void **)(*((void *)a2 + 1) + v33), v34);
      *(void *)(*(void *)(*((void *)a2 + 1) + v33) + v33) = 0LL;
      v33 += 8LL;
    }

    while (v35 != v33);
  }

  if ((int)*a1 >= 1)
  {
    uint64_t v36 = 0LL;
    size_t v37 = 8LL * (int)a1[1];
    do
    {
      memcpy(*(void **)(*(void *)(a3 + 8) + 8 * v36), *(const void **)(*((void *)a1 + 1) + 8 * v36), v37);
      ++v36;
    }

    while (v36 < (int)*a1);
  }

  if ((int)v11 > 1)
  {
    unint64_t v38 = (v11 - 1);
    uint64_t v39 = v101;
    while (1)
    {
      uint64_t v42 = v39 - 1;
      uint64_t v43 = *(void **)(*(void *)(a3 + 8) + 8 * (v39 - 1));
      uint64_t v44 = 8 * (v39 - 1);
      uint64_t v45 = v39 - 2;
      if (v39 == 2) {
        break;
      }
      if (v38 < 4)
      {
        unint64_t v46 = 0LL;
        double v47 = 0.0;
        goto LABEL_41;
      }

      unint64_t v48 = v38 & 0xFFFFFFFFFFFFFFFCLL;
      unint64_t v46 = v38 & 0xFFFFFFFFFFFFFFFCLL;
      uint64_t v49 = (float64x2_t *)(v43 + 2);
      double v47 = 0.0;
      do
      {
        float64x2_t v50 = vabsq_f64(v49[-1]);
        float64x2_t v51 = vabsq_f64(*v49);
        double v47 = v47 + v50.f64[0] + v50.f64[1] + v51.f64[0] + v51.f64[1];
        v49 += 2;
        v48 -= 4LL;
      }

      while (v48);
      while (v38 != v46)
LABEL_41:
        double v47 = v47 + fabs(*(double *)&v43[v46++]);
      if (v47 == 0.0)
      {
        v13[(unint64_t)v44 / 8] = *(void *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45);
        double v40 = 0.0;
      }

      else
      {
        uint64_t v52 = 0LL;
        double v53 = 0.0;
        do
        {
          uint64_t v54 = *(void *)(*(void *)(a3 + 8) + 8 * v42);
          double v55 = *(double *)(v54 + 8 * v52) / v47;
          *(double *)(v54 + 8 * v52) = v55;
          double v53 = v53 + v55 * v55;
          ++v52;
        }

        while (v38 != v52);
        uint64_t v56 = 0LL;
        double v57 = *(double *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45);
        double v58 = sqrt(v53);
        if (v57 > 0.0) {
          double v58 = -v58;
        }
        *(double *)&v13[(unint64_t)v44 / 8] = v47 * v58;
        double v40 = v53 - v57 * v58;
        *(double *)(*(void *)(*(void *)(a3 + 8) + v44) + 8 * v45) = v57 - v58;
        uint64_t v59 = *(void *)(a3 + 8);
        uint64_t v60 = *(void *)(v59 + v44);
        double v61 = 0.0;
        uint64_t v62 = &_mh_execute_header;
        uint64_t v63 = 1LL;
        unint64_t v64 = 1LL;
        do
        {
          uint64_t v66 = 8 * v56;
          *(double *)(*(void *)(v59 + 8 * v56) + v44) = *(double *)(v60 + 8 * v56) / v40;
          uint64_t v67 = *(void *)(a3 + 8);
          uint64_t v68 = *(float64x2_t **)(v67 + 8 * v56);
          uint64_t v69 = *(float64x2_t **)(v67 + v44);
          if (v64 < 4)
          {
            uint64_t v70 = 0LL;
            double v71 = 0.0;
            goto LABEL_29;
          }

          unint64_t v72 = v64 & 0xFFFFFFFFFFFFFFFCLL;
          uint64_t v70 = v64 & 0x7FFFFFFFFFFFFFFCLL;
          uint64_t v73 = v68 + 1;
          uint64_t v74 = v69 + 1;
          double v71 = 0.0;
          do
          {
            float64x2_t v75 = vmulq_f64(v73[-1], v74[-1]);
            float64x2_t v76 = vmulq_f64(*v73, *v74);
            double v71 = v71 + v75.f64[0] + v75.f64[1] + v76.f64[0] + v76.f64[1];
            v73 += 2;
            v74 += 2;
            v72 -= 4LL;
          }

          while (v72);
          while (v64 != v70)
          {
LABEL_29:
            double v71 = v71 + v68->f64[v70] * v69->f64[v70];
            ++v70;
          }

          if (v56 < v45)
          {
            uint64_t v77 = &v69->f64[v63];
            uint64_t v78 = (uint64_t *)(v67 + v63 * 8);
            uint64_t v79 = (uint64_t)v62;
            do
            {
              uint64_t v80 = *v78++;
              double v81 = *(double *)(v80 + 8 * v56);
              double v82 = *v77++;
              double v71 = v71 + v81 * v82;
              BOOL v41 = v45 <= v79 >> 32;
              v79 += (uint64_t)&_mh_execute_header;
            }

            while (!v41);
          }

          double v65 = v71 / v40;
          *(double *)(v31 + 8 * v56) = v65;
          uint64_t v59 = *(void *)(a3 + 8);
          uint64_t v60 = *(void *)(v59 + 8 * v42);
          ++v56;
          double v61 = v61 + v65 * *(double *)(v60 + v66);
          ++v64;
          uint64_t v62 = (const mach_header_64 *)((char *)&_mh_execute_header + (void)v62);
          ++v63;
        }

        while (v56 != v38);
        uint64_t v83 = 0LL;
        uint64_t v84 = 1LL;
        double v85 = -v61 / (v40 + v40);
        do
        {
          uint64_t v86 = 0LL;
          double v87 = *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v42) + 8 * v83);
          double v88 = *(double *)(v31 + 8 * v83) + v85 * v87;
          *(double *)&v13[v83] = v88;
          do
          {
            *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v83) + 8 * v86) = *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v83)
                                                                                          + 8 * v86)
                                                                              - (v88
                                                                               * *(double *)(*(void *)(*(void *)(a3 + 8) + 8 * v42)
                                                                                           + 8 * v86)
                                                                               + v87 * *(double *)&v13[v86]);
            ++v86;
          }

          while (v84 != v86);
          ++v83;
          ++v84;
        }

        while (v83 != v38);
      }

      *(double *)&v22[v42] = v40;
      --v38;
      BOOL v41 = v39-- <= 2;
      if (v41) {
        goto LABEL_45;
      }
    }

    v13[(unint64_t)v44 / 8] = *v43;
    v22[(unint64_t)v44 / 8] = 0LL;
  }

uint64_t sub_1000C04AC( unsigned int *a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *a1;
  unint64_t v12 = 8LL * (int)*a1;
  sub_1000C0BFC(v12, a2, (uint64_t)a3, a4, a5, a6, a7, a8);
  uint64_t v14 = v13;
  sub_1000C0BFC(v12, v15, v16, v17, v18, v19, v20, v21);
  uint64_t v23 = v22;
  uint64_t v24 = *a3;
  if ((int)v24 >= 1)
  {
    uint64_t v25 = 0LL;
    size_t v26 = 8 * v24;
    uint64_t v27 = 8LL * *a3;
    do
    {
      bzero(*(void **)(*((void *)a3 + 1) + v25), v26);
      *(void *)(*(void *)(*((void *)a3 + 1) + v25) + v25) = 0x3FF0000000000000LL;
      v25 += 8LL;
    }

    while (v27 != v25);
  }

  if ((int)v11 > 1)
  {
    uint64_t v28 = 0LL;
    do
    {
      *(void *)(v23 + v28) = *(void *)(*(void *)(*((void *)a1 + 1) + v28 + 8) + v28);
      *(void *)(v14 + v28) = *(void *)(*(void *)(*((void *)a1 + 1) + v28) + v28);
      v28 += 8LL;
    }

    while (8 * v11 - 8 != v28);
  }

  int v29 = v11 - 1;
  uint64_t v30 = 8LL * ((int)v11 - 1);
  *(void *)(v23 + v30) = 0LL;
  *(void *)(v14 + v30) = *(void *)(*(void *)(*((void *)a1 + 1) + v30) + v30);
  if ((int)v11 >= 1)
  {
    unint64_t v31 = 0LL;
    uint64_t v32 = (double *)(v14 + 8);
    while (2)
    {
      int v33 = 0;
      else {
        unint64_t v34 = v31;
      }
      unint64_t v35 = v31 + 1;
LABEL_15:
      uint64_t v36 = v32;
      unint64_t v37 = v31;
      while (v34 != v37)
      {
        int v38 = v37 + 1;
        double v39 = fabs(*(v36 - 1)) + fabs(*v36);
        double v40 = fabs(*(double *)(v23 + 8 * v37)) + v39;
        ++v36;
        ++v37;
        if (v40 == v39)
        {
          unint64_t v41 = (v38 - 1);
          if (v41 == v31) {
            goto LABEL_43;
          }
LABEL_21:
          if (v33 == 30) {
            return 0LL;
          }
          double v42 = *(double *)(v14 + 8 * v31);
          double v43 = *(double *)(v23 + 8 * v31);
          double v44 = (*(double *)(v14 + 8 * v35) - v42) / (v43 + v43);
          double v45 = fabs(v44);
          if (v45 >= 1.0) {
            double v46 = v45;
          }
          else {
            double v46 = 1.0;
          }
          double v47 = 0.0;
          double v48 = 0.0;
          if (v46 != 0.0)
          {
            double v49 = fmin(v45, 1.0);
            double v48 = v46 * sqrt(v49 / v46 * (v49 / v46) + 1.0);
          }

          ++v33;
          double v50 = *(double *)(v14 + 8 * v41) - v42;
          double v51 = fabs(v48);
          if (v44 < 0.0) {
            double v51 = -v51;
          }
          double v52 = v50 + v43 / (v44 + v51);
          if (v41 <= v31)
          {
LABEL_14:
            *(double *)(v14 + 8 * v31) = *(double *)(v14 + 8 * v31) - v47;
            *(double *)(v23 + 8 * v31) = v52;
            *(void *)(v23 + 8 * v41) = 0LL;
          }

          else
          {
            double v53 = 1.0;
            unint64_t v54 = v41;
            double v55 = 1.0;
            while (1)
            {
              uint64_t v56 = v54 - 1;
              double v57 = *(double *)(v23 + 8 * (v54 - 1));
              double v58 = v55 * v57;
              double v59 = fabs(v58);
              double v60 = fabs(v52);
              double v61 = v59 >= v60 ? v59 : v60;
              if (v61 == 0.0) {
                break;
              }
              if (v59 >= v60) {
                double v59 = v60;
              }
              double v62 = v61 * sqrt(v59 / v61 * (v59 / v61) + 1.0);
              *(double *)(v23 + 8 * v54) = v62;
              if (v62 == 0.0)
              {
                *(double *)(v14 + 8 * v54) = *(double *)(v14 + 8 * v54) - v47;
                *(void *)(v23 + 8 * v41) = 0LL;
                goto LABEL_15;
              }

              uint64_t v63 = 0LL;
              double v64 = v53 * v57;
              double v55 = v58 / v62;
              double v53 = v52 / v62;
              uint64_t v65 = 8 * v54;
              double v66 = *(double *)(v14 + v65) - v47;
              double v67 = v64 * (v53 + v53) + (*(double *)(v14 + 8 * v56) - v66) * v55;
              double v47 = v55 * v67;
              *(double *)(v14 + v65) = v66 + v55 * v67;
              double v52 = -(v64 - v53 * v67);
              do
              {
                uint64_t v68 = *(void *)(*((void *)a3 + 1) + v63);
                double v69 = *(double *)(v68 + v65);
                *(double *)(v68 + v65) = v53 * v69 + v55 * *(double *)(v68 + 8 * v56);
                *(double *)(*(void *)(*((void *)a3 + 1) + v63) + 8 * v56) = v69 * -v55
                                                                              + v53
                v63 += 8LL;
              }

              while (8 * v11 != v63);
              unint64_t v54 = v56;
            }

            uint64_t v70 = 8LL * (int)v54;
            *(void *)(v23 + v70) = 0LL;
            *(double *)(v14 + v70) = *(double *)(v14 + v70) - v47;
            *(void *)(v23 + 8 * v41) = 0LL;
          }

          goto LABEL_15;
        }
      }

      unint64_t v41 = v34;
      if (v34 != v31) {
        goto LABEL_21;
      }
LABEL_43:
      ++v32;
      ++v31;
      if (v35 != v11) {
        continue;
      }
      break;
    }

    uint64_t v71 = 0LL;
    uint64_t v71 = v11 & 0x7FFFFFFC;
    unint64_t v72 = (__int128 *)(v14 + 16);
    uint64_t v73 = (_OWORD *)(a2 + 16);
    uint64_t v74 = v11 & 0xFFFFFFFC;
    do
    {
      __int128 v75 = *v72;
      *(v73 - 1) = *(v72 - 1);
      *uint64_t v73 = v75;
      v72 += 2;
      v73 += 2;
      v74 -= 4LL;
    }

    while (v74);
    if (v71 != v11)
    {
LABEL_49:
      float64x2_t v76 = (void *)(a2 + 8 * v71);
      uint64_t v77 = (uint64_t *)(v14 + 8 * v71);
      uint64_t v78 = v11 - v71;
      do
      {
        uint64_t v79 = *v77++;
        *v76++ = v79;
        --v78;
      }

      while (v78);
    }
  }

  sub_1000C0EF8(v23);
  sub_1000C0EF8(v14);
  return 1LL;
}

uint64_t sub_1000C0890(unsigned int *a1, uint64_t a2, int *a3)
{
  size_t v6 = *a1;
  uint64_t v7 = (int *)sub_1000BF10C(v6, v6);
  uint64_t v8 = sub_1000BF10C(v6, v6);
  sub_1000BFF1C(a1, v7, v8, v9, v10, v11, v12, v13);
  uint64_t v26 = sub_1000C04AC((unsigned int *)v7, a2, a3, v14, v15, v16, v17, v18);
  if ((_DWORD)v26)
  {
    int v27 = *(_DWORD *)v8;
    if (*(int *)v8 >= 1)
    {
      LODWORD(v28) = a3[1];
      if ((int)v28 >= 1)
      {
        uint64_t v29 = 0LL;
        do
        {
          if ((int)v28 >= 1)
          {
            uint64_t v30 = 0LL;
            do
            {
              *(void *)(*(void *)(*((void *)v7 + 1) + 8 * v29) + 8 * v30) = 0LL;
              if (*(int *)(v8 + 4) >= 1)
              {
                uint64_t v31 = 0LL;
                do
                {
                  uint64_t v32 = *(void *)(*((void *)v7 + 1) + 8 * v29);
                  *(double *)(v32 + 8 * v30) = *(double *)(v32 + 8 * v30)
                  ++v31;
                }

                while (v31 < *(int *)(v8 + 4));
              }

              ++v30;
              uint64_t v28 = a3[1];
            }

            while (v30 < v28);
            int v27 = *(_DWORD *)v8;
          }

          ++v29;
        }

        while (v29 < v27);
      }
    }

    if (*v7 >= 1)
    {
      uint64_t v33 = 0LL;
      size_t v34 = 8LL * v7[1];
      do
      {
        memcpy(*(void **)(*((void *)a3 + 1) + 8 * v33), *(const void **)(*((void *)v7 + 1) + 8 * v33), v34);
        ++v33;
      }

      while (v33 < *v7);
    }

    if ((int)v6 <= 0)
    {
      double v43 = (uint64_t *)sub_1000C80C0(0, v19, v20, v21, v22, v23, v24, v25);
      if (*a3 >= 1) {
        goto LABEL_27;
      }
      goto LABEL_29;
    }

    qword_100102960 = a2;
    sub_1000C0BFC(4 * v6, v19, v20, v21, v22, v23, v24, v25);
    uint64_t v36 = (uint64_t)v35;
    if (v6 >= 8)
    {
      size_t v37 = v6 & 0x7FFFFFF8;
      int32x4_t v44 = (int32x4_t)xmmword_1000F0830;
      double v45 = v35 + 1;
      v46.i64[0] = 0x400000004LL;
      v46.i64[1] = 0x400000004LL;
      v47.i64[0] = 0x800000008LL;
      v47.i64[1] = 0x800000008LL;
      uint64_t v48 = v6 & 0xFFFFFFF8;
      do
      {
        v45[-1] = v44;
        *double v45 = vaddq_s32(v44, v46);
        int32x4_t v44 = vaddq_s32(v44, v47);
        v45 += 2;
        v48 -= 8LL;
      }

      while (v48);
      if (v37 == v6)
      {
LABEL_26:
        qsort(v35, v6, 4uLL, (int (__cdecl *)(const void *, const void *))sub_1000C0B6C);
        qword_100102960 = 0LL;
        double v43 = (uint64_t *)sub_1000C80C0(v6, v49, v50, v51, v52, v53, v54, v55);
        sub_1000C8480((uint64_t)v43, v6, v36);
        sub_1000C8560((uint64_t)v43);
        sub_1000C0EF8(v36);
        if (*a3 >= 1)
        {
LABEL_27:
          uint64_t v56 = 0LL;
          do
            sub_1000C8134((uint64_t)v43, *(void *)(*((void *)a3 + 1) + 8 * v56++), 8LL, v38, v39, v40, v41, v42);
          while (v56 < *a3);
        }

uint64_t sub_1000C0B6C(int *a1, int *a2)
{
  uint64_t v2 = *a1;
  double v3 = *(double *)(qword_100102960 + 8 * v2);
  uint64_t v4 = *a2;
  double v5 = *(double *)(qword_100102960 + 8 * v4);
  if (v3 == v5) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = -1;
  }
  if (v3 < v5) {
    unsigned int v6 = 1;
  }
  BOOL v7 = (int)v2 < (int)v4;
  if ((_DWORD)v2 == (_DWORD)v4) {
    unsigned int v8 = 0;
  }
  else {
    unsigned int v8 = -1;
  }
  if (v7) {
    unsigned int v8 = 1;
  }
  if (v6) {
    return v6;
  }
  else {
    return v8;
  }
}

uint64_t sub_1000C0BA8(uint64_t a1)
{
  uint64_t v1 = qword_100102970;
  qword_100102970 = a1;
  return v1;
}

uint64_t sub_1000C0BBC(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(void *)(result + 24))
    {
      double result = (*(uint64_t (**)(uint64_t))(result + 8))(result);
      *(void *)(v1 + 24) = 0LL;
    }
  }

  return result;
}

uint64_t sub_1000C0BF4( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_1000C0D84(a1, 1, a3, a4, a5, a6, a7, a8);
}

void sub_1000C0BFC( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (void *)sub_1000C0D84(a1, 1, a3, a4, a5, a6, a7, a8);
  bzero(v9, a1);
}

uint64_t sub_1000C0C28( char *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!a1)
  {
    if (!a2) {
      return 0LL;
    }
    uint64_t v13 = sub_1000C0D84(a2, 1, a3, a4, a5, a6, a7, a8);
    unint64_t v11 = 0LL;
    size_t v20 = a2;
    if (!a2) {
      return v13;
    }
    goto LABEL_12;
  }

  uint64_t v10 = a1 - 8;
  unint64_t v11 = *((unsigned int *)a1 - 2);
  if (!a2)
  {
    uint64_t v21 = qword_100102970;
    v22.i64[0] = -1LL;
    v22.i64[1] = -1LL;
    v23.i64[1] = -1LL;
    v23.i64[0] = v11;
    *(void *)&__int128 v24 = vsubq_s64((int64x2_t)xmmword_100102980, v23).u64[0];
    *((void *)&v24 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v22).i64[1];
    xmmword_100102980 = v24;
    int64x2_t v25 = *(int64x2_t *)(qword_100102970 + 32);
    v23.i64[0] = vsubq_s64(v25, v23).u64[0];
    v23.i64[1] = vaddq_s64(v25, v22).i64[1];
    *(int64x2_t *)(qword_100102970 + 32) = v23;
    (*(void (**)(uint64_t, char *))(v21 + 8))(v21, v10);
    return 0LL;
  }

  uint64_t v12 = (void *)sub_1000C0D84(a2, 1, a3, a4, a5, a6, a7, a8);
  uint64_t v13 = (uint64_t)v12;
  else {
    size_t v14 = *((unsigned int *)a1 - 2);
  }
  memcpy(v12, a1, v14);
  uint64_t v15 = qword_100102970;
  v16.i64[0] = -1LL;
  v16.i64[1] = -1LL;
  v17.i64[1] = -1LL;
  v17.i64[0] = *((unsigned int *)a1 - 2);
  *(void *)&__int128 v18 = vsubq_s64((int64x2_t)xmmword_100102980, v17).u64[0];
  *((void *)&v18 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v16).i64[1];
  xmmword_100102980 = v18;
  int64x2_t v19 = *(int64x2_t *)(qword_100102970 + 32);
  v17.i64[0] = vsubq_s64(v19, v17).u64[0];
  v17.i64[1] = vaddq_s64(v19, v16).i64[1];
  *(int64x2_t *)(qword_100102970 + 32) = v17;
  (*(void (**)(uint64_t, char *))(v15 + 8))(v15, v10);
  size_t v20 = a2 - v11;
  if (a2 > v11) {
LABEL_12:
  }
    bzero((void *)(v13 + v11), v20);
  return v13;
}

uint64_t sub_1000C0D84( unint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 <= 0x7FFFFFF6
    && (uint64_t v10 = (void *)qword_100102970,
        (unint64_t v11 = (_DWORD *)(*(uint64_t (**)(uint64_t, unint64_t))qword_100102970)(qword_100102970, a1 + 8)) != 0LL))
  {
    *unint64_t v11 = a1;
    v11[1] = 0;
    unint64_t v12 = v10[4] + a1;
    v10[4] = v12;
    if (v12 > v10[6]) {
      v10[6] = v12;
    }
    unint64_t v13 = v10[7];
    v10[8] += a1;
    unint64_t v14 = v10[5] + 1LL;
    v10[5] = v14;
    if (v14 > v13) {
      v10[7] = v14;
    }
    ++v10[9];
    *(void *)&xmmword_100102980 = xmmword_100102980 + a1;
    uint64_t result = (uint64_t)(v11 + 2);
    qword_1001029A0 += a1;
    ++qword_1001029A8;
  }

  else if (a2)
  {
    int64x2_t v16 = &xmmword_100102980;
    if (qword_100102970) {
      int64x2_t v16 = (__int128 *)(qword_100102970 + 32);
    }
    uint64_t v17 = sub_1000BE914( "vstmem.c",  695,  "Error allocating memory: Request %6lu, Size %6lu, Current bytes allocated %lu, %lu objects.",  a4,  a5,  a6,  a7,  a8,  *((void *)v16 + 5));
    return sub_1000C0EF8(v17);
  }

  else
  {
    return 0LL;
  }

  return result;
}

uint64_t sub_1000C0EF8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = qword_100102970;
    v3.i64[0] = -1LL;
    v3.i64[1] = -1LL;
    v4.i64[1] = -1LL;
    v4.i64[0] = *(unsigned int *)(v1 - 8);
    *(void *)&__int128 v5 = vsubq_s64((int64x2_t)xmmword_100102980, v4).u64[0];
    *((void *)&v5 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v3).i64[1];
    xmmword_100102980 = v5;
    int64x2_t v6 = *(int64x2_t *)(qword_100102970 + 32);
    v4.i64[0] = vsubq_s64(v6, v4).u64[0];
    v4.i64[1] = vaddq_s64(v6, v3).i64[1];
    *(int64x2_t *)(qword_100102970 + 32) = v4;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v2, v1 - 8);
  }

  return result;
}

void *sub_1000C0F50(void *result, void *a2)
{
  *uint64_t result = 0LL;
  *a2 = 0LL;
  *result += 8LL;
  return result;
}

_DWORD *sub_1000C0F68(unint64_t a1)
{
  if (a1 > 0x7FFFFFF6) {
    return 0LL;
  }
  uint64_t v2 = (void *)qword_100102970;
  uint64_t result = (_DWORD *)(*(uint64_t (**)(uint64_t, unint64_t))qword_100102970)(qword_100102970, a1 + 8);
  if (result)
  {
    *uint64_t result = a1;
    result[1] = 0;
    unint64_t v4 = v2[4] + a1;
    v2[4] = v4;
    if (v4 > v2[6]) {
      v2[6] = v4;
    }
    unint64_t v5 = v2[7];
    v2[8] += a1;
    unint64_t v6 = v2[5] + 1LL;
    v2[5] = v6;
    if (v6 > v5) {
      v2[7] = v6;
    }
    ++v2[9];
    *(void *)&xmmword_100102980 = xmmword_100102980 + a1;
    result += 2;
    qword_1001029A0 += a1;
    ++qword_1001029A8;
  }

  return result;
}

_DWORD *sub_1000C1078(size_t a1)
{
  if (a1 > 0x7FFFFFF6) {
    return 0LL;
  }
  uint64_t v2 = (void *)qword_100102970;
  int64x2_t v3 = (_DWORD *)(*(uint64_t (**)(uint64_t, size_t))qword_100102970)(qword_100102970, a1 + 8);
  if (!v3) {
    return 0LL;
  }
  *int64x2_t v3 = a1;
  v3[1] = 0;
  size_t v4 = v2[4] + a1;
  v2[4] = v4;
  if (v4 > v2[6]) {
    v2[6] = v4;
  }
  unint64_t v5 = v2[7];
  v2[8] += a1;
  unint64_t v6 = v2[5] + 1LL;
  v2[5] = v6;
  if (v6 > v5) {
    v2[7] = v6;
  }
  BOOL v7 = v3 + 2;
  ++v2[9];
  *(void *)&xmmword_100102980 = xmmword_100102980 + a1;
  qword_1001029A0 += a1;
  ++qword_1001029A8;
  bzero(v3 + 2, a1);
  return v7;
}

uint64_t sub_1000C11AC(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 8);
  }
  return result;
}

uint64_t sub_1000C11BC( uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = 0LL;
  if (a2 < 1) {
    return v8;
  }
  unsigned int v9 = a3;
  if ((a3 & 0x80000000) != 0) {
    return v8;
  }
  unsigned int v10 = a2;
  uint64_t v12 = sub_1000C0D84((8 * a2 + 24), 1, a3, a4, a5, a6, a7, a8);
  uint64_t v8 = v12;
  if (!v12) {
    return v8;
  }
  *(_DWORD *)uint64_t v12 = v10;
  *(_DWORD *)(v12 + 4) = v9;
  *(void *)(v12 + 8) = a1;
  if (v9)
  {
    int64x2_t v19 = (char *)sub_1000C0D84((_DWORD)a1 * v10 * v9, 1, v13, v14, v15, v16, v17, v18);
    *(void *)(v8 + 16) = v19;
    if (v19)
    {
      if (v10 >= 2)
      {
        uint64_t v20 = v10 & 0xFFFFFFFE;
        uint64_t v28 = (void *)(v8 + 32);
        uint64_t v29 = v20;
        uint64_t v30 = v19;
        do
        {
          *(v28 - 1) = v30;
          void *v28 = &v30[a1 * v9];
          v30 += 2 * a1 * v9;
          v28 += 2;
          v29 -= 2LL;
        }

        while (v29);
        if (v20 == v10) {
          goto LABEL_16;
        }
      }

      else
      {
        uint64_t v20 = 0LL;
      }

      uint64_t v31 = v10 - v20;
      uint64_t v32 = (char **)(v8 + 8 * v20 + 24);
      uint64_t v33 = a1 * v9;
      size_t v34 = &v19[v33 * v20];
      do
      {
        *v32++ = v34;
        v34 += v33;
        --v31;
      }

      while (v31);
LABEL_16:
      unsigned int v10 = *(_DWORD *)v8;
      int v21 = *(_DWORD *)(v8 + 4);
      a1 = *(void *)(v8 + 8);
      goto LABEL_17;
    }

    uint64_t v22 = qword_100102970;
    v23.i64[0] = -1LL;
    v23.i64[1] = -1LL;
    v24.i64[1] = -1LL;
    v24.i64[0] = *(unsigned int *)(v8 - 8);
    *(void *)&__int128 v25 = vsubq_s64((int64x2_t)xmmword_100102980, v24).u64[0];
    *((void *)&v25 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v23).i64[1];
    xmmword_100102980 = v25;
    int64x2_t v26 = *(int64x2_t *)(qword_100102970 + 32);
    v24.i64[0] = vsubq_s64(v26, v24).u64[0];
    v24.i64[1] = vaddq_s64(v26, v23).i64[1];
    *(int64x2_t *)(qword_100102970 + 32) = v24;
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v22, v8 - 8);
    return 0LL;
  }

  int v21 = 0;
  int64x2_t v19 = *(char **)(v12 + 16);
LABEL_17:
  bzero(v19, v21 * (uint64_t)(int)v10 * a1);
  return v8 + 24;
}

uint64_t sub_1000C133C(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result - 8);
    if (v2)
    {
      uint64_t v3 = qword_100102970;
      v4.i64[0] = -1LL;
      v4.i64[1] = -1LL;
      v5.i64[1] = -1LL;
      v5.i64[0] = *(unsigned int *)(v2 - 8);
      *(void *)&__int128 v6 = vsubq_s64((int64x2_t)xmmword_100102980, v5).u64[0];
      *((void *)&v6 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v4).i64[1];
      xmmword_100102980 = v6;
      int64x2_t v7 = *(int64x2_t *)(qword_100102970 + 32);
      v5.i64[0] = vsubq_s64(v7, v5).u64[0];
      v5.i64[1] = vaddq_s64(v7, v4).i64[1];
      *(int64x2_t *)(qword_100102970 + 32) = v5;
      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v3, v2 - 8);
    }

    uint64_t v8 = qword_100102970;
    v9.i64[0] = -1LL;
    v9.i64[1] = -1LL;
    v10.i64[1] = -1LL;
    v10.i64[0] = *(unsigned int *)(v1 - 32);
    *(void *)&__int128 v11 = vsubq_s64((int64x2_t)xmmword_100102980, v10).u64[0];
    *((void *)&v11 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v9).i64[1];
    xmmword_100102980 = v11;
    int64x2_t v12 = *(int64x2_t *)(qword_100102970 + 32);
    v10.i64[0] = vsubq_s64(v12, v10).u64[0];
    v10.i64[1] = vaddq_s64(v12, v9).i64[1];
    *(int64x2_t *)(qword_100102970 + 32) = v10;
    return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v8, v1 - 32);
  }

  return result;
}

unsigned int *sub_1000C13FC(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v3 = 0LL;
  if (a2 >= 1 && (a3 & 0x80000000) == 0)
  {
    LODWORD(v5) = a2;
    uint64_t v6 = (8 * a2 + 24);
    uint64_t v8 = (void *)qword_100102970;
    uint64_t v9 = (*(uint64_t (**)(uint64_t, uint64_t))qword_100102970)(qword_100102970, v6 + 8);
    uint64_t v3 = (unsigned int *)v9;
    if (v9)
    {
      *(_DWORD *)uint64_t v9 = v6;
      *(_DWORD *)(v9 + 4) = 0;
      unint64_t v10 = v8[4] + v6;
      v8[4] = v10;
      if (v10 > v8[6]) {
        v8[6] = v10;
      }
      unint64_t v11 = v8[7];
      v8[8] += v6;
      unint64_t v12 = v8[5] + 1LL;
      v8[5] = v12;
      if (v12 > v11) {
        v8[7] = v12;
      }
      ++v8[9];
      *(void *)&xmmword_100102980 = xmmword_100102980 + v6;
      uint64_t v13 = xmmword_100102980;
      qword_1001029A0 += v6;
      ++qword_1001029A8;
      *(_DWORD *)(v9 + 8) = v5;
      *(_DWORD *)(v9 + 12) = a3;
      *(void *)(v9 + 16) = a1;
      if (!a3) {
        goto LABEL_34;
      }
      uint64_t v14 = (_DWORD)a1 * (_DWORD)v5 * a3;
      uint64_t v15 = qword_100102970;
      if (v14 < 0x7FFFFFF7)
      {
        uint64_t v16 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))qword_100102970)(qword_100102970, v14 + 8);
        if (v16)
        {
          void *v16 = v14;
          unint64_t v17 = *(void *)(v15 + 32) + v14;
          *(void *)(v15 + 32) = v17;
          if (v17 > *(void *)(v15 + 48)) {
            *(void *)(v15 + 48) = v17;
          }
          unint64_t v18 = *(void *)(v15 + 56);
          *(void *)(v15 + 64) += v14;
          unint64_t v19 = *(void *)(v15 + 40) + 1LL;
          *(void *)(v15 + 40) = v19;
          if (v19 > v18) {
            *(void *)(v15 + 56) = v19;
          }
          uint64_t v20 = v16 + 1;
          ++*(void *)(v15 + 72);
          unint64_t v21 = xmmword_100102980 + v14;
          *(void *)&xmmword_100102980 = v21;
          if (v21 > qword_100102990) {
            qword_100102990 = v21;
          }
          qword_1001029A0 += v14;
          unint64_t v22 = *((void *)&xmmword_100102980 + 1) + 1LL;
          *((void *)&xmmword_100102980 + 1) = v22;
          if (v22 > qword_100102998) {
            qword_100102998 = v22;
          }
          ++qword_1001029A8;
          *((void *)v3 + 3) = v20;
          if (v5 >= 2)
          {
            uint64_t v23 = v5 & 0xFFFFFFFE;
            uint64_t v28 = v3 + 10;
            uint64_t v29 = v23;
            do
            {
              *(v28 - 1) = v20;
              void *v28 = (char *)v20 + a1 * a3;
              uint64_t v20 = (void *)((char *)v20 + 2 * a1 * a3);
              v28 += 2;
              v29 -= 2LL;
            }

            while (v29);
          }

          else
          {
            uint64_t v23 = 0LL;
          }

          uint64_t v30 = v5 - v23;
          uint64_t v31 = (uint64_t *)&v3[2 * v23 + 8];
          uint64_t v32 = a1 * a3;
          uint64_t v33 = (uint64_t)v16 + v32 * v23 + 8;
          do
          {
            *v31++ = v33;
            v33 += v32;
            --v30;
          }

          while (v30);
LABEL_34:
          v3 += 8;
          size_t v34 = (int)(a1 * a3);
          uint64_t v5 = v5;
          unint64_t v35 = (void **)v3;
          do
          {
            uint64_t v36 = *v35++;
            bzero(v36, v34);
            --v5;
          }

          while (v5);
          return v3;
        }

        uint64_t v15 = qword_100102970;
        uint64_t v13 = xmmword_100102980;
      }

      *((void *)v3 + 3) = 0LL;
      uint64_t v24 = *v3;
      *(void *)&xmmword_100102980 = v13 - v24;
      --*((void *)&xmmword_100102980 + 1);
      int64x2_t v25 = *(int64x2_t *)(v15 + 32);
      v26.i64[0] = -1LL;
      v26.i64[1] = -1LL;
      v27.i64[1] = -1LL;
      v27.i64[0] = v24;
      v27.i64[0] = vsubq_s64(v25, v27).u64[0];
      v27.i64[1] = vaddq_s64(v25, v26).i64[1];
      *(int64x2_t *)(v15 + 32) = v27;
      (*(void (**)(uint64_t, unsigned int *))(v15 + 8))(v15, v3);
      return 0LL;
    }
  }

  return v3;
}

uint64_t sub_1000C172C(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 24);
  }
  return result;
}

uint64_t sub_1000C1738(uint64_t result)
{
  if (result) {
    return *(unsigned int *)(result - 20);
  }
  return result;
}

uint64_t sub_1000C1744(const void **a1, int *a2, signed int *a3, char a4, int a5, int a6)
{
  return sub_1000C1750(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_1000C1750(const void **a1, int *a2, signed int *a3, char a4, int a5, int a6)
{
  int v11 = *a2;
  signed int v12 = *a3;
  signed int v13 = (~(-1 << a4) + a6) >> a4;
  uint64_t v14 = *a1;
  if (!*a1)
  {
    if (v11 <= v13) {
      unsigned int v23 = (~(-1 << a4) + a6) >> a4;
    }
    else {
      unsigned int v23 = *a2;
    }
    if (v11) {
      int v11 = v23;
    }
    else {
      int v11 = 2 * v13;
    }
    uint64_t v24 = sub_1000C1078(8LL * v11);
    if (!v24) {
      return 0LL;
    }
    uint64_t v14 = v24;
    if (v13 > v12) {
      goto LABEL_6;
    }
    return 1LL;
  }

  if (v13 > v11)
  {
    int v11 = 2 * v13;
    uint64_t v15 = sub_1000C1078(16LL * v13);
    if (!v15) {
      return 0LL;
    }
    uint64_t v14 = v15;
    memcpy(v15, *a1, 8LL * v12);
  }

  if (v13 <= v12) {
    return 1LL;
  }
LABEL_6:
  int v16 = a5 << a4;
  size_t v17 = a5 << a4;
  unint64_t v18 = sub_1000C1078(v16);
  v14[v12] = v18;
  if (!v18)
  {
    signed int v22 = v12;
LABEL_22:
    if (v22 > v12)
    {
      uint64_t v25 = v22;
      int64x2_t v26 = (char *)(v14 - 1);
      do
      {
        uint64_t v27 = *(void *)&v26[8 * v25];
        if (v27)
        {
          uint64_t v28 = qword_100102970;
          v29.i64[1] = -1LL;
          v29.i64[0] = *(unsigned int *)(v27 - 8);
          *(void *)&__int128 v30 = vsubq_s64((int64x2_t)xmmword_100102980, v29).u64[0];
          v31.i64[0] = -1LL;
          v31.i64[1] = -1LL;
          *((void *)&v30 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v31).i64[1];
          xmmword_100102980 = v30;
          int64x2_t v32 = *(int64x2_t *)(qword_100102970 + 32);
          v29.i64[0] = vsubq_s64(v32, v29).u64[0];
          v29.i64[1] = vaddq_s64(v32, v31).i64[1];
          *(int64x2_t *)(qword_100102970 + 32) = v29;
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v28, v27 - 8);
        }

        *(void *)&v26[8 * v25--] = 0LL;
      }

      while (v25 > v12);
    }

    uint64_t v21 = 0LL;
    if (!v14 || v14 == *a1) {
      return v21;
    }
    uint64_t v33 = qword_100102970;
    v34.i64[0] = -1LL;
    v34.i64[1] = -1LL;
    v35.i64[1] = -1LL;
    v35.i64[0] = *((unsigned int *)v14 - 2);
    *(void *)&__int128 v36 = vsubq_s64((int64x2_t)xmmword_100102980, v35).u64[0];
    *((void *)&v36 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v34).i64[1];
    xmmword_100102980 = v36;
    int64x2_t v37 = *(int64x2_t *)(qword_100102970 + 32);
    v35.i64[0] = vsubq_s64(v37, v35).u64[0];
    v35.i64[1] = vaddq_s64(v37, v34).i64[1];
    *(int64x2_t *)(qword_100102970 + 32) = v35;
    (*(void (**)(uint64_t, void *))(v33 + 8))(v33, v14 - 1);
    return 0LL;
  }

  uint64_t v19 = 0LL;
  while (v12 + 1 - v13 + (_DWORD)v19)
  {
    uint64_t v20 = sub_1000C1078(v17);
    v14[v12 + 1 + v19++] = v20;
    if (!v20)
    {
      uint64_t v21 = 0LL;
      signed int v22 = v12 + v19;
      if (v12 + v19 < v13) {
        goto LABEL_22;
      }
      goto LABEL_32;
    }
  }

  uint64_t v21 = 1LL;
  signed int v22 = v13;
  if (v12 + v19 + 1 < v13) {
    goto LABEL_22;
  }
LABEL_32:
  uint64_t v38 = (unsigned int *)*a1;
  if (v14 != *a1)
  {
    if (v38)
    {
      uint64_t v39 = qword_100102970;
      v40.i64[0] = -1LL;
      v40.i64[1] = -1LL;
      v41.i64[1] = -1LL;
      v41.i64[0] = *(v38 - 2);
      *(void *)&__int128 v42 = vsubq_s64((int64x2_t)xmmword_100102980, v41).u64[0];
      *((void *)&v42 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v40).i64[1];
      xmmword_100102980 = v42;
      int64x2_t v43 = *(int64x2_t *)(qword_100102970 + 32);
      v41.i64[0] = vsubq_s64(v43, v41).u64[0];
      v41.i64[1] = vaddq_s64(v43, v40).i64[1];
      *(int64x2_t *)(qword_100102970 + 32) = v41;
      (*(void (**)(uint64_t, unsigned int *))(v39 + 8))(v39, v38 - 2);
    }

    *a1 = v14;
  }

  *a3 = v13;
  *a2 = v11;
  return v21;
}

uint64_t sub_1000C1A34(const void **a1, int *a2, int a3)
{
  return sub_1000C1A40(a1, a2, a3);
}

uint64_t sub_1000C1A40(const void **a1, int *a2, int a3)
{
  if (!*a1)
  {
    uint64_t result = (uint64_t)sub_1000C1078(8LL * a3);
    uint64_t v8 = (const void *)result;
    if (!result) {
      return result;
    }
    goto LABEL_6;
  }

  uint64_t v6 = *a2;
  if ((int)v6 < a3)
  {
    uint64_t result = (uint64_t)sub_1000C1078(8LL * a3);
    if (!result) {
      return result;
    }
    uint64_t v8 = (const void *)result;
    memcpy((void *)result, *a1, 8 * v6);
LABEL_6:
    uint64_t v9 = (unsigned int *)*a1;
    if (v8 != *a1)
    {
      if (v9)
      {
        uint64_t v10 = qword_100102970;
        v11.i64[0] = -1LL;
        v11.i64[1] = -1LL;
        v12.i64[1] = -1LL;
        v12.i64[0] = *(v9 - 2);
        *(void *)&__int128 v13 = vsubq_s64((int64x2_t)xmmword_100102980, v12).u64[0];
        *((void *)&v13 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v11).i64[1];
        xmmword_100102980 = v13;
        int64x2_t v14 = *(int64x2_t *)(qword_100102970 + 32);
        v12.i64[0] = vsubq_s64(v14, v12).u64[0];
        v12.i64[1] = vaddq_s64(v14, v11).i64[1];
        *(int64x2_t *)(qword_100102970 + 32) = v12;
        (*(void (**)(uint64_t, unsigned int *))(v10 + 8))(v10, v9 - 2);
      }

      *a1 = v8;
    }
  }

  *a2 = a3;
  return 1LL;
}

uint64_t sub_1000C1B20(uint64_t result, uint64_t a2, int a3)
{
  if (result && a3 >= 1)
  {
    uint64_t v3 = result;
    unint64_t v4 = a3 + 1LL;
    do
    {
      uint64_t v5 = (v4 - 2);
      uint64_t v6 = *(void *)(v3 + 8LL * v5);
      if (v6)
      {
        uint64_t v7 = qword_100102970;
        v8.i64[1] = -1LL;
        v8.i64[0] = *(unsigned int *)(v6 - 8);
        *(void *)&__int128 v9 = vsubq_s64((int64x2_t)xmmword_100102980, v8).u64[0];
        v10.i64[0] = -1LL;
        v10.i64[1] = -1LL;
        *((void *)&v9 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v10).i64[1];
        xmmword_100102980 = v9;
        int64x2_t v11 = *(int64x2_t *)(qword_100102970 + 32);
        v8.i64[0] = vsubq_s64(v11, v8).u64[0];
        v8.i64[1] = vaddq_s64(v11, v10).i64[1];
        *(int64x2_t *)(qword_100102970 + 32) = v8;
        uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v7, v6 - 8);
      }

      *(void *)(v3 + 8 * v5) = 0LL;
      --v4;
    }

    while (v4 > 1);
  }

  return result;
}

uint64_t sub_1000C1BC8(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3 = result;
  if (result && a3 >= 1)
  {
    unint64_t v4 = a3 + 1LL;
    do
    {
      uint64_t v5 = (v4 - 2);
      uint64_t v6 = *(void *)(v3 + 8LL * v5);
      if (v6)
      {
        uint64_t v7 = qword_100102970;
        v8.i64[1] = -1LL;
        v8.i64[0] = *(unsigned int *)(v6 - 8);
        *(void *)&__int128 v9 = vsubq_s64((int64x2_t)xmmword_100102980, v8).u64[0];
        v10.i64[0] = -1LL;
        v10.i64[1] = -1LL;
        *((void *)&v9 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v10).i64[1];
        xmmword_100102980 = v9;
        int64x2_t v11 = *(int64x2_t *)(qword_100102970 + 32);
        v8.i64[0] = vsubq_s64(v11, v8).u64[0];
        v8.i64[1] = vaddq_s64(v11, v10).i64[1];
        *(int64x2_t *)(qword_100102970 + 32) = v8;
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v7, v6 - 8);
      }

      *(void *)(v3 + 8 * v5) = 0LL;
      --v4;
    }

    while (v4 > 1);
  }

  else if (!result)
  {
    return result;
  }

  uint64_t v12 = qword_100102970;
  v13.i64[0] = -1LL;
  v13.i64[1] = -1LL;
  v14.i64[1] = -1LL;
  v14.i64[0] = *(unsigned int *)(v3 - 8);
  *(void *)&__int128 v15 = vsubq_s64((int64x2_t)xmmword_100102980, v14).u64[0];
  *((void *)&v15 + 1) = vaddq_s64((int64x2_t)xmmword_100102980, v13).i64[1];
  xmmword_100102980 = v15;
  int64x2_t v16 = *(int64x2_t *)(qword_100102970 + 32);
  v14.i64[0] = vsubq_s64(v16, v14).u64[0];
  v14.i64[1] = vaddq_s64(v16, v13).i64[1];
  *(int64x2_t *)(qword_100102970 + 32) = v14;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v12, v3 - 8);
}

void *sub_1000C1CCC(void *result, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  int v7 = a6 - 1;
  if (a6 >= 1)
  {
    int v8 = a4 * a3;
    int v9 = a6 * a4;
    uint64_t v49 = result;
    int v48 = a4 * a3;
    if (a5 >= a7)
    {
      int v30 = a5 / a3;
      int v31 = a5 % a3 * a4;
      LODWORD(v32) = a7 / a3;
      int v33 = a7 % a3 * a4;
      uint64_t v34 = result[a5 / a3];
      uint64_t v35 = result[a7 / a3];
      int v36 = v8 - v31;
      if (v8 - v31 >= v9) {
        int v36 = a6 * a4;
      }
      int v37 = v8 - v33;
      if (v37 < v36) {
        int v36 = v37;
      }
      int v38 = v31 - v33;
      if (v31 - v33 < 0) {
        int v38 = v33 - v31;
      }
      BOOL v39 = v38 >= v36;
      for (BOOL i = v30 != (_DWORD)v32 || v39; ; BOOL i = v30 != (_DWORD)v32 || v41 >= v36)
      {
        int32x4_t v44 = (void *)(v35 + v33);
        int v45 = v36;
        int32x4_t v46 = (const void *)(v34 + v31);
        if (i)
        {
          uint64_t result = memcpy(v44, v46, v36);
          int32x4_t v47 = v49;
          v9 -= v45;
          if (v9 < 1) {
            return result;
          }
        }

        else
        {
          uint64_t result = memmove(v44, v46, v36);
          int32x4_t v47 = v49;
          v9 -= v45;
          if (v9 < 1) {
            return result;
          }
        }

        if (v31 < v33)
        {
          int v33 = 0;
          uint64_t v32 = (int)v32 + 1LL;
          uint64_t v35 = v47[v32];
          v31 += v45;
          int v41 = v31;
          int v42 = v48;
        }

        else
        {
          uint64_t v34 = v47[++v30];
          v33 += v45;
          int v42 = v48;
          int v31 = 0;
          if (v33 == v48)
          {
            int v33 = 0;
            int v41 = 0;
            uint64_t v32 = (int)v32 + 1LL;
            uint64_t v35 = v47[v32];
          }

          else
          {
            int v41 = v33;
          }
        }

        int v36 = v42 - v41;
        if (v42 - v41 >= v9) {
          int v36 = v9;
        }
      }
    }

    int v10 = (v7 + a5) / a3;
    int v11 = a4 + a4 * ((v7 + a5) % a3);
    int v12 = v7 + a7;
    int v13 = v12 / a3;
    uint64_t v14 = result[v10];
    uint64_t v15 = result[v12 / a3];
    int v16 = a4 + a4 * (v12 % a3);
    if (v11 >= v9) {
      int v17 = a6 * a4;
    }
    else {
      int v17 = v11;
    }
    if (v16 < v17) {
      int v17 = v16;
    }
    int v18 = v11 - v16;
    if (v11 - v16 < 0) {
      int v18 = v16 - v11;
    }
    BOOL v19 = v18 >= v17;
    BOOL v20 = v10 != v13 || v19;
    while (1)
    {
      int v25 = v17;
      uint64_t v22 = v16 - (uint64_t)v17;
      int64x2_t v26 = (void *)(v15 + v22);
      uint64_t v27 = v11 - (uint64_t)v17;
      uint64_t v28 = (const void *)(v14 + v27);
      if (v20)
      {
        uint64_t result = memcpy(v26, v28, v17);
        int64x2_t v29 = v49;
        v9 -= v25;
        if (v9 < 1) {
          return result;
        }
      }

      else
      {
        uint64_t result = memmove(v26, v28, v17);
        int64x2_t v29 = v49;
        v9 -= v25;
        if (v9 < 1) {
          return result;
        }
      }

      if (v11 >= v16)
      {
        uint64_t v15 = v29[--v13];
        int v21 = v48;
        LODWORD(v22) = v48;
        if ((int)v27 > 0)
        {
          LODWORD(v22) = v48;
          int v17 = v11 - v25;
          goto LABEL_15;
        }
      }

      else
      {
        int v21 = v48;
      }

      uint64_t v14 = v29[--v10];
      LODWORD(v27) = v21;
      int v17 = v22;
LABEL_15:
      int v23 = v21 - v17;
      if (v17 >= v9) {
        int v17 = v9;
      }
      BOOL v20 = v10 != v13 || v23 >= v17;
      int v11 = v27;
      int v16 = v22;
    }
  }

  return result;
}

uint64_t sub_1000C1F48( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8 = a3;
  sub_1000C0BFC(0x40uLL, a2, a3, a4, a5, a6, a7, a8);
  uint64_t v19 = v11;
  if (v8) {
    int v20 = v8;
  }
  else {
    int v20 = 8;
  }
  *(_DWORD *)(v11 + 16) = v20;
  uint64_t v21 = 2048LL;
  if (a1) {
    uint64_t v21 = a1;
  }
  if (a2) {
    uint64_t v21 = a2;
  }
  *(void *)uint64_t v11 = a1;
  *(void *)(v11 + 8) = v21;
  if (a1)
  {
    sub_1000C0BFC(0xC0uLL, v12, v13, v14, v15, v16, v17, v18);
    *(void *)(v19 + 24) = v22;
    sub_1000C0BFC(a1, v23, v24, v25, v26, v27, v28, v29);
    *(void *)(*(void *)(v19 + 24) + 16LL) = v30;
    **(void **)(v19 + 24) = a1;
    *(void *)(*(void *)(v19 + 24) + 8LL) = 0LL;
    *(void *)(v19 + 32) = 0x100000008LL;
  }

  return v19;
}

uint64_t sub_1000C1FE8(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 40);
    if (v2)
    {
      unint64_t v3 = (*(_DWORD *)(result + 16) + (_DWORD)v2 - 1) & -*(_DWORD *)(result + 16);
      if (((*(_DWORD *)(result + 16) + (_DWORD)v2 - 1) & -*(_DWORD *)(result + 16)) != 0)
      {
        uint64_t v4 = *(int *)(result + 36);
        uint64_t v5 = 24 * v4;
        uint64_t v6 = v4 - 1;
        do
        {
          uint64_t v8 = *(void *)(v1 + 24);
          uint64_t v9 = v8 + v5;
          unint64_t v10 = *(void *)(v8 + v5 - 16);
          if (v3 >= v10) {
            unint64_t v11 = *(void *)(v8 + v5 - 16);
          }
          else {
            unint64_t v11 = v3;
          }
          *(void *)(v9 - 16) = v10 - v11;
          *(void *)(v1 + 40) -= v11;
          if (!*(void *)(v9 - 16) && (v6 || !*(void *)v1))
          {
            int v7 = (void *)(v9 - 24);
            sub_1000C0EF8(*(void *)(v8 + v5 - 8));
            *int v7 = 0LL;
            v7[1] = 0LL;
            v7[2] = 0LL;
            --*(_DWORD *)(v1 + 36);
          }

          v5 -= 24LL;
          --v6;
          v3 -= v11;
        }

        while (v3);
      }
    }

    uint64_t v12 = *(void **)(v1 + 24);
    if (v12)
    {
      uint64_t v13 = v12[2];
      if (v13)
      {
        sub_1000C0EF8(v13);
        v12[2] = 0LL;
      }

      *uint64_t v12 = 0LL;
      uint64_t v14 = *(void *)(v1 + 24);
    }

    else
    {
      uint64_t v14 = 0LL;
    }

    sub_1000C0EF8(v14);
    return sub_1000C0EF8(v1);
  }

  return result;
}

unint64_t sub_1000C20F4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = (*(_DWORD *)(a1 + 16) + (_DWORD)a2 - 1) & -*(_DWORD *)(a1 + 16);
  ++*(_DWORD *)(a1 + 56);
  int v10 = *(_DWORD *)(a1 + 36);
  if (v10 < 1)
  {
    int v10 = 0;
    uint64_t v13 = *(int *)(a1 + 32);
    goto LABEL_7;
  }

  uint64_t v11 = *(void *)(a1 + 24);
  if (!v11 || (uint64_t v12 = (unint64_t *)(v11 + 24LL * (v10 - 1)), *v12 < v12[1] + v9))
  {
    uint64_t v13 = *(int *)(a1 + 32);
    if (v10 < (int)v13)
    {
LABEL_5:
      uint64_t v14 = *(void *)(a1 + 24);
LABEL_8:
      uint64_t v12 = (unint64_t *)(v14 + 24LL * v10);
      if (v9 <= *(void *)(a1 + 8)) {
        unint64_t v16 = *(void *)(a1 + 8);
      }
      else {
        unint64_t v16 = v9;
      }
      *uint64_t v12 = v16;
      sub_1000C0BFC(v16, a2, a3, a4, a5, a6, a7, a8);
      v12[1] = 0LL;
      v12[2] = v17;
      ++*(_DWORD *)(a1 + 36);
      goto LABEL_12;
    }

uint64_t sub_1000C21F8(uint64_t result, uint64_t a2, int a3)
{
  int v3 = *(_DWORD *)(result + 16);
  int v4 = v3 - 1;
  uint64_t v5 = (v3 - 1 + a3);
  uint64_t v6 = -v3;
  uint64_t v7 = v5 & v6;
  unint64_t v8 = ((_DWORD)v7 + v4) & v6;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    uint64_t v10 = result;
    uint64_t v11 = *(int *)(result + 36);
    uint64_t v12 = 24 * v11;
    uint64_t v13 = v11 - 1;
    do
    {
      uint64_t v15 = *(void *)(v10 + 24);
      uint64_t v16 = v15 + v12;
      unint64_t v17 = *(void *)(v15 + v12 - 16);
      if (v8 >= v17) {
        unint64_t v18 = *(void *)(v15 + v12 - 16);
      }
      else {
        unint64_t v18 = v8;
      }
      *(void *)(v16 - 16) = v17 - v18;
      *(void *)(v10 + 40) -= v18;
      if (!*(void *)(v16 - 16) && (v13 || !*(void *)v10))
      {
        uint64_t v14 = (void *)(v16 - 24);
        uint64_t result = sub_1000C0EF8(*(void *)(v15 + v12 - 8));
        void *v14 = 0LL;
        v14[1] = 0LL;
        v14[2] = 0LL;
        --*(_DWORD *)(v10 + 36);
      }

      v12 -= 24LL;
      --v13;
      v8 -= v18;
    }

    while (v8);
  }

  return result;
}

uint64_t sub_1000C22D4(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 40);
  if (v2 != a2)
  {
    uint64_t v3 = result;
    unint64_t v4 = (*(_DWORD *)(result + 16) + (_DWORD)v2 - (_DWORD)a2 - 1) & -*(_DWORD *)(result + 16);
    if (((*(_DWORD *)(result + 16) + (_DWORD)v2 - (_DWORD)a2 - 1) & -*(_DWORD *)(result + 16)) != 0)
    {
      uint64_t v5 = *(int *)(result + 36);
      uint64_t v6 = 24 * v5;
      uint64_t v7 = v5 - 1;
      do
      {
        uint64_t v9 = *(void *)(v3 + 24);
        uint64_t v10 = v9 + v6;
        unint64_t v11 = *(void *)(v9 + v6 - 16);
        if (v4 >= v11) {
          unint64_t v12 = *(void *)(v9 + v6 - 16);
        }
        else {
          unint64_t v12 = v4;
        }
        *(void *)(v10 - 16) = v11 - v12;
        *(void *)(v3 + 40) -= v12;
        if (!*(void *)(v10 - 16) && (v7 || !*(void *)v3))
        {
          unint64_t v8 = (void *)(v10 - 24);
          uint64_t result = sub_1000C0EF8(*(void *)(v9 + v6 - 8));
          *unint64_t v8 = 0LL;
          v8[1] = 0LL;
          v8[2] = 0LL;
          --*(_DWORD *)(v3 + 36);
        }

        v6 -= 24LL;
        --v7;
        v4 -= v12;
      }

      while (v4);
    }
  }

  return result;
}

uint64_t sub_1000C23B0(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

uint64_t sub_1000C23B8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (!result) {
    return result;
  }
  unsigned __int16 v4 = *(_WORD *)result;
  if (!*(_WORD *)result) {
    return 0LL;
  }
  for (BOOL i = (unsigned __int16 *)(result + 2); v4 <= 0x80u && (v4 & 0x80) == 0; ++i)
  {
    if ((byte_1000F1D84[v4] & 0x10) == 0)
    {
      if (v4 != 43 && v4 != 45)
      {
        BOOL v12 = 0;
        --i;
        if (!v4) {
          return 0LL;
        }
LABEL_23:
        if (!v12) {
          goto LABEL_28;
        }
        if (v4 > 0x80u || (v4 & 0x80) != 0)
        {
          if (v4 == 65279) {
            return 0LL;
          }
        }

        else if ((byte_1000F1D84[v4] & 0x10) != 0)
        {
          return 0LL;
        }

        uint64_t result = sub_1000CBA3C(v4);
        if ((_DWORD)result)
        {
          uint64_t v21 = v4 - 48;
          if (v21 + a2 > 9) {
            return 0LL;
          }
          uint64_t v13 = -v21;
          unsigned __int16 v22 = i[1];
          if (!v22) {
            goto LABEL_72;
          }
          uint64_t v23 = i + 2;
          while (1)
          {
            unsigned int v24 = v22;
            int v25 = v22 & 0x80;
            if (v24 <= 0x80 && v25 == 0)
            {
              if ((byte_1000F1D84[v24] & 0x10) != 0) {
                goto LABEL_72;
              }
            }

            else if (v24 == 65279)
            {
              goto LABEL_72;
            }

            uint64_t result = sub_1000CBA3C(v24);
            if (!(_DWORD)result) {
              break;
            }
            uint64_t v27 = (int)(v24 - 48);
            if (v24 >> 4 > 0xFF0) {
              uint64_t v27 = v24 - 65296;
            }
            if ((v27 + a2) / 10 > v13) {
              return 0LL;
            }
            uint64_t v13 = 10 * v13 - v27;
            int v28 = *v23++;
            unsigned __int16 v22 = v28;
            if (!v28) {
              goto LABEL_72;
            }
          }
        }

        return result;
      }

uint64_t sub_1000C26B0(_WORD *a1)
{
  uint64_t v3 = 0LL;
  return v3;
}

uint64_t sub_1000C272C(uint64_t result, uint64_t a2, unint64_t *a3)
{
  if (!result) {
    return result;
  }
  unsigned __int16 v3 = *(_WORD *)result;
  if (!*(_WORD *)result) {
    return 0LL;
  }
  for (BOOL i = (unsigned __int16 *)(result + 2); ; ++i)
  {
    BOOL v8 = v3 <= 0x80u && (v3 & 0x80) == 0;
    if ((!v8 || (byte_1000F1D84[v3] & 0x10) == 0) && v3 != 65279) {
      break;
    }
    unsigned __int16 v7 = *i;
    unsigned __int16 v3 = v7;
  }

  if (v3 == 43 || v3 == 65291)
  {
    unsigned __int16 v3 = *i;
    if (!*i) {
      return 0LL;
    }
  }

  else
  {
    --i;
    if (!v3) {
      return 0LL;
    }
  }

  if (v3 <= 0x80u && (v3 & 0x80) == 0)
  {
    if ((byte_1000F1D84[v3] & 0x10) != 0) {
      return 0LL;
    }
    goto LABEL_25;
  }

  if (v3 == 65279) {
    return 0LL;
  }
LABEL_25:
  uint64_t result = sub_1000CBA3C(v3);
  if ((_DWORD)result)
  {
    else {
      uint64_t v9 = -65296LL;
    }
    unint64_t v10 = v9 + v3;
    unsigned __int16 v11 = i[1];
    if (v11)
    {
      BOOL v12 = i + 2;
      while (1)
      {
        uint64_t v13 = v11;
        unsigned int v14 = v11;
        int v15 = v11 & 0x80;
        if (v14 <= 0x80 && v15 == 0)
        {
          if ((byte_1000F1D84[v13] & 0x10) != 0) {
            goto LABEL_44;
          }
        }

        else if ((_DWORD)v13 == 65279)
        {
          goto LABEL_44;
        }

        uint64_t result = sub_1000CBA3C(v13);
        if (!(_DWORD)result) {
          break;
        }
        else {
          uint64_t v17 = -65296LL;
        }
        uint64_t v18 = v17 + v13;
        if (v10 > (a2 - v18) / 0xAuLL) {
          return 0LL;
        }
        unint64_t v10 = v18 + 10 * v10;
        int v19 = *v12++;
        unsigned __int16 v11 = v19;
        if (!v19) {
          goto LABEL_44;
        }
      }
    }

    else
    {
LABEL_44:
      if (a3) {
        *a3 = v10;
      }
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000C28D4(_WORD *a1)
{
  unint64_t v3 = 0LL;
  return (unsigned __int16)v3;
}

uint64_t sub_1000C294C(uint64_t result, _DWORD *a2)
{
  int v2 = 0;
  if (result)
  {
    unint64_t v3 = result - 1;
    if (result != 1)
    {
      uint64_t result = 1LL;
      do
      {
        result *= 2LL;
        ++v2;
        BOOL v4 = v3 > 1;
        v3 >>= 1;
      }

      while (v4);
    }
  }

  if (a2) {
    *a2 = v2;
  }
  return result;
}

uint64_t sub_1000C2984( uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  BOOL v8 = sub_1000BCAE8(a1, "vstpar", a2, a4, a5, a6, a7, a8);
  if (!v8) {
    return 0LL;
  }
  uint64_t v9 = (uint64_t)v8;
  uint64_t v14 = 0LL;
  unsigned int v13 = 0;
  uint64_t v12 = 0LL;
  if (HIDWORD(v14) != 870)
  {
    sub_1000BCBC8(v9);
    return 0LL;
  }

  uint64_t v10 = sub_1000C1074(5584LL);
  if (v10)
  {
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)uint64_t v10 = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 8) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 12) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 16) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 24) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 32) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 40) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 48) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 56) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 60) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 64) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 68) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 72) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 76) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 80) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 84) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 88) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 96) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 100) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 104) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 112) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 120) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 124) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 128) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 152) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 160) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 164) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 168) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 172) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 176) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 184) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 192) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 200) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 208) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 216) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 224) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 228) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 232) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 240) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 248) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 256) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 264) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 272) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 280) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 288) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 292) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 296) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 304) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 312) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 320) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 328) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 336) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 344) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 348) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 352) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 360) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 368) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 376), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 384) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 392) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 400) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 408) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 416) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 424) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 432) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 440) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 448) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 456) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 464) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 472) = v12;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 480), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 488) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 496) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 500) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 504) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 512) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 516) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 520) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 528) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 536) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 544) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 552) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 560) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 568) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 576) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 580), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 584) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 592) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 600) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 608) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 616), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 620) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 624) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 628) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 632) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 640) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 648) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 656) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 664) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 672) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 676) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 680) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 688) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 692) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 696) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 700) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 704) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 708) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 712) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 716) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 720) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 724) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 728) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 732) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 736) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 740) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 744) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 748) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 752) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 756) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 760) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 764) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 768) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 772) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 776) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 784) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 792), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 796) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 800) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 808) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 812) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 816) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 824) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 832) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 840) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 848) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 856) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 864) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 872) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 880) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 884) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 888) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 892) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 896) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 904) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 908) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 912) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 920) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 928) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 936) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 944) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 952) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 960) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 968) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 976) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 984) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 992) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 996) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1000) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1008) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1016) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1024) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1032) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1036) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1040) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1048) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1056) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1060) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1064) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1068) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1072) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1076) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1080) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1088) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1092) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1096) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1100) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1104) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1112) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1116) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1120) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1124) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1128) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1152) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1160) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1164) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1168) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1172) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1176) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1180) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1184) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1192) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1200) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1208) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1216) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1224) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1228) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1232) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1240) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1248) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1256) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1260) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1264) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1272) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1280) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1288) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1296) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1304) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1312) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1320) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1328) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1332) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1336) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1340) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1344) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1352) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1360) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1368) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1372) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1376) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1380) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1384) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1388) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1392) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1396) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1400) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1404) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1408) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1412) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1416) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1420) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1424) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1428) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1432) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1440) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1448) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1452) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1456) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1464) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1472) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1480) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1484) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1488) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1492) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1496) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1504) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1512) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1520) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1528) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1536) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1544) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1552) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1560) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1568) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1576) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1584) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1592) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1600) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1608) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1616) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1624) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1632) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1640) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1648) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1652) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1656) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1664) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1672) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1680) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1684) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1688) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1696) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1704) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1712) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 1716), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1720) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1728) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1736) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1744) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1748) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1752) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1756) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1760) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1764) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1768) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1772) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1776) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1780) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1784) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1788) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1792) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1796) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1800) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1804) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1808) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1812) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1816) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1820) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 1824), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1828) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1832) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1836) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1840) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1844) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1848) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1852) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1856) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1860) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1864) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1872) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1876) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1880) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1888) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1896) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1904) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1908) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1912) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1920) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1928) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1932) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1936) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1940) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1944) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1948) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1952) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1956) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1960) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1964) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1968) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1972) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1976) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1980) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 1984) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 1992) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2000) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2008) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2016) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2020) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2024) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2032) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2040) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2048) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2056) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2064) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2072) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2080) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2088) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2092) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2096) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2104) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2112) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2120) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2128) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2132) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2152) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2160) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2168) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2176) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2184) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2192) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2196) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2200) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2204) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2208) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2212) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2216) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2220) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2224) = v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2232) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2240) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2248) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2252) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2256) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2260) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2264) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2272) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2280) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2284) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2288) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2296) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2304) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2312) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2316) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2320) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2328) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2336) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2344) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2352) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2360), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2368) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2376) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2384) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2392) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2400) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2408) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2416) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2424) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2432) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2436) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2440) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2444) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2448) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2452) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2456), v15, 128);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2584), v15, 128);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2712), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2720) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2728) = v13;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2736), v15, 1);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2737), v15, 1);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2738), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2744) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2752) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2760) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2768) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2776) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2780) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2784) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2792) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2800) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2808) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2816) = v13;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2824), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2832) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2840) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2848) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2852) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2856) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2860) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2864) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2868) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2872) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2876) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2880) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2884) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2888) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2892) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2896) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2900) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2904) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2908) = v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2912) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2920) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 2928), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2936) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2944) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2948) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2952) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2956) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2960) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 2968) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2976) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2984) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 2992) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3000) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3008) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3016) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3024) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3028) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3032) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3040) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3048) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3056) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3064) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3072) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3080) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3088) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3096) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3104) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3112) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3120) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3128) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3152) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3160) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3168) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3176) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3184) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3192) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3200) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3208) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3216) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3224) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3228) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3232) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3236), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3240) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3248) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3256) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3264) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3272) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3276) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3280) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3284) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3288) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3296) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3304) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3312) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3320) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3324), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3328) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3336) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3344) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3352) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3360) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3368) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3376) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3384) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3388) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3392) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3396) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3400) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3408) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3416) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3424) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3432) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3440) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3448) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3452) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3456) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3464) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3472) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3480) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3484) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3488) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3492) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3496) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3504) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3512) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3520) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3528) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3536) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3544) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3552) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3560) = v12;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3568), v15, 30);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3600) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3608) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3616) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3624) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3632) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3636) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3640) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3648) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3656) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3664) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3668), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3672) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3680) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3688) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3696) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3700) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3704) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3708) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3712) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3716) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3720) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3724) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3728) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3732) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3736) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3740) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3744) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3748) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3752) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3760) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3768) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3772) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3776) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3784) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3792) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3800) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3808), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3816) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3824) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3828) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3832) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3840) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3848), v15, 1);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3849), v15, 1);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3850), v15, 1);
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 3851), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3852) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3856) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3864) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3868) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3872) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3876) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3880) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3884) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3888) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3892) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3896) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3904) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3908) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3912) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3916) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3920) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3928) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3936) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3944) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3952) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3960) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3968) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3972) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3976) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3980) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 3984) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 3992) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4000) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4008) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4016) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4024) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4032) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4040) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4048) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4056) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4064) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4072) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4080) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4088) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4096) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4104) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4112) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4120) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4128) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4152) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4160) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4168) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4176) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4184) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4188) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4192) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4196) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4200) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4208) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4216) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4220), v15, 30);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4256) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4264) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4272) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4280) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4288) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4296) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4304) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4308) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4312) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4316) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4320) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4328) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4336) = v13;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4344) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4352) = v13;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4360) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4368) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4376) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4384) = v13;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4392) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4400) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4408) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4416) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4424) = v13;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4432) = v12;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4440) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4448) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4452) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4456) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4460) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4464) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4472) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4480) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4488) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4496) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4504) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4508) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4512) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4516) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4520), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4528) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4536) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4544) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4548) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4552) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4560) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4568) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4576), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4584) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4592) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4596) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4600) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4604) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4608) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4612) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4616), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4620) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4624) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4632) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4640) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4648) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4656) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4664) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4672) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4680) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4688) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4696) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4704) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4708) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4712) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4716) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4720) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4724) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4728) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4732) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4736) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4740) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4744) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4748) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4752) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4756) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4760) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4768) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4776) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4780), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4784) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4788) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4792), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4800) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4808) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4816) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4824) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4832), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4840) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4848) = v12;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4856), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4864) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4872) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4880) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4888) = v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 4892), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4896) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4900) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4904) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4912) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4920) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4928) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4932) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4936) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4944) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4952) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4960) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4968) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4972) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 4976) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4984) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 4992) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5000) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5008) = (int)v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5016) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5024) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5032) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5036) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5040) = (int)v14;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 5048), v15, 1);
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5056) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5064) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5068) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5072) = v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5080) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5088) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5092) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5096) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5104) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5112) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5120) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5128) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5132) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5136) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5144) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5152) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5156) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5160) = v14;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5168) = v12;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5176) = v12;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5184) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5192) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5196) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5200) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5204) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5208) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5216) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5224) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5232) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5236) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5240) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5244) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5248) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5252) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5256) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5260) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5264) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5268) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5272) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5276) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5280) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5284) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5288) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5292) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5296) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5300) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5304) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5308) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5312) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5316) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5320) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5324) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5328) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5332) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5336) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5340) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5344) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5348) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5352) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5356) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5360) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5364) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5368) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5372) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5376) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5384) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5392) = v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5400) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5408) = v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5416) = v13;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5424) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5428) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5432) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5440) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5444) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5448) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5452) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5456) = (int)v14;
    if (!sub_1000BCD38(v9, &v13)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5464) = v13;
    if (!sub_1000BCD5C(v9, &v12)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5472) = v12;
    if (!sub_1000BD048(v9, 1024, v15)) {
      goto LABEL_67;
    }
    sub_1000C896C((_BYTE *)(v10 + 5480), v15, 1);
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5488) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5496) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5504) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5508) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5512) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5520) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(void *)(v10 + 5528) = (int)v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5536) = v14;
    if (!sub_1000BCD38(v9, &v14)) {
      goto LABEL_67;
    }
    *(_DWORD *)(v10 + 5540) = v14;
    if (sub_1000BCD38(v9, &v14)
      && (*(_DWORD *)(v10 + 5544) = v14, sub_1000BCD38(v9, &v14))
      && (*(_DWORD *)(v10 + 5548) = v14, sub_1000BCD38(v9, &v14))
      && (*(_DWORD *)(v10 + 5552) = v14, sub_1000BCD38(v9, &v14))
      && (*(_DWORD *)(v10 + 5556) = v14, sub_1000BCD38(v9, &v14))
      && (*(void *)(v10 + 5560) = (int)v14, sub_1000BCD38(v9, &v14))
      && (*(void *)(v10 + 5568) = (int)v14, sub_1000BCD38(v9, &v14)))
    {
      *(_DWORD *)(v10 + 5576) = v14;
    }

    else
    {
LABEL_67:
      sub_1000C0EF8(v10);
      uint64_t v10 = 0LL;
    }

    sub_1000BCBC8(v9);
  }

  return v10;
}

_OWORD *sub_1000C80C0( int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (_OWORD *)sub_1000C0BF4(0x20uLL, a2, a3, a4, a5, a6, a7, a8);
  *uint64_t v9 = 0u;
  v9[1] = 0u;
  sub_1000C86A4((uint64_t)v9, a1);
  return v9;
}

uint64_t sub_1000C80FC(uint64_t *a1)
{
  return sub_1000C0EF8((uint64_t)a1);
}

uint64_t sub_1000C8134( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a3 & 0x80000000) == 0)
  {
    int v8 = a3;
    uint64_t v10 = result;
    size_t v11 = a3;
    uint64_t v12 = (void *)sub_1000C0BF4(a3, a2, a3, a4, a5, a6, a7, a8);
    if (*(int *)(v10 + 28) >= 1)
    {
      uint64_t v13 = 0LL;
      int v14 = 0;
      uint64_t v15 = *(void *)(v10 + 8);
      do
      {
        uint64_t v16 = *(unsigned int *)(v15 + 4 * v13);
        memcpy( v12,  (const void *)(a2 + *(int *)(*(void *)(v10 + 16) + 4LL * ((int)v16 + v14 - 1)) * (uint64_t)v8),  v11);
        if ((int)v16 >= 2)
        {
          uint64_t v17 = v16 - 1;
          uint64_t v18 = 4LL * v14 + 4LL * (int)v16;
          do
          {
            memcpy( (void *)(a2 + *(int *)(*(void *)(v10 + 16) + v18 - 4) * (uint64_t)v8),  (const void *)(a2 + *(int *)(*(void *)(v10 + 16) + v18 - 8) * (uint64_t)v8),  v11);
            v18 -= 4LL;
            --v17;
          }

          while (v17);
        }

        memcpy((void *)(a2 + *(int *)(*(void *)(v10 + 16) + 4LL * v14) * (uint64_t)v8), v12, v11);
        uint64_t v15 = *(void *)(v10 + 8);
        v14 += *(_DWORD *)(v15 + 4 * v13++);
      }

      while (v13 < *(int *)(v10 + 28));
    }

    return sub_1000C0EF8((uint64_t)v12);
  }

  return result;
}

uint64_t sub_1000C8248( uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v31 = a2;
  if ((a4 & 0x80000000) == 0)
  {
    int v8 = a4;
    uint64_t v10 = result;
    size_t v11 = a4;
    uint64_t v12 = sub_1000C0BF4(a4, a2, a3, a4, a5, a6, a7, a8);
    uint64_t v13 = (void *)v12;
    if (*(int *)(v10 + 28) >= 1)
    {
      uint64_t v14 = 0LL;
      int v15 = 0;
      uint64_t v16 = *(void *)(v10 + 8);
      __src = (void *)v12;
      do
      {
        int v17 = *(_DWORD *)(v16 + 4 * v14);
        int v18 = (v17 & ((v31 % v17) >> 31)) + v31 % v17;
        if (v18 >= 0) {
          unsigned int v19 = (v17 & ((v31 % v17) >> 31)) + v31 % v17;
        }
        else {
          unsigned int v19 = -v18;
        }
        if (v17 >= 0) {
          unsigned int v20 = v17;
        }
        else {
          unsigned int v20 = -v17;
        }
        if (v19 <= v20) {
          int v21 = v20;
        }
        else {
          int v21 = v19;
        }
        if (v19 < v20) {
          unsigned int v20 = v19;
        }
        uint64_t v32 = v14;
        if (v20)
        {
          do
          {
            int v22 = v20;
            unsigned int v20 = v21 % v20;
            int v21 = v22;
          }

          while (v20);
          if (v22 >= 1)
          {
LABEL_21:
            uint64_t v23 = v22;
            int v35 = v17 / v22 - 1;
            if (v17 / v22 <= 1)
            {
              int v30 = v15 + v17 - 1;
              do
              {
                memcpy(v13, (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v30) * (uint64_t)v8), v11);
                memcpy((void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v30--) * (uint64_t)v8), v13, v11);
                --v23;
              }

              while (v23);
            }

            else
            {
              uint64_t v24 = 0LL;
              uint64_t v34 = v23;
              do
              {
                uint64_t v36 = v24;
                int v25 = v17 + v15 + ~(_DWORD)v24;
                memcpy(v13, (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v25) * (uint64_t)v8), v11);
                int v26 = v35;
                do
                {
                  if (v25 - v18 >= v15) {
                    int v27 = 0;
                  }
                  else {
                    int v27 = v17;
                  }
                  int v28 = v27 + v25 - v18;
                  memcpy( (void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v25) * (uint64_t)v8),  (const void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v28) * (uint64_t)v8),  v11);
                  int v25 = v28;
                  --v26;
                }

                while (v26);
                uint64_t v29 = (void *)(a3 + *(int *)(*(void *)(v10 + 16) + 4LL * v28) * (uint64_t)v8);
                uint64_t v13 = __src;
                memcpy(v29, __src, v11);
                uint64_t v24 = v36 + 1;
              }

              while (v36 + 1 != v34);
            }
          }
        }

        else
        {
          int v22 = v21;
          if (v21 >= 1) {
            goto LABEL_21;
          }
        }

        uint64_t v16 = *(void *)(v10 + 8);
        v15 += *(_DWORD *)(v16 + 4 * v32);
        uint64_t v14 = v32 + 1;
      }

      while (v32 + 1 < *(int *)(v10 + 28));
    }

    return sub_1000C0EF8((uint64_t)v13);
  }

  return result;
}

uint64_t sub_1000C8480(uint64_t a1, int a2, uint64_t a3)
{
  int64_t v12 = *(int *)(a1 + 24);
  if ((int)v12 >= 1)
  {
    for (int64_t i = 0LL; i < v12; ++i)
    {
      *(_DWORD *)(*(void *)a1 + 4 * i) = *(_DWORD *)(a3 + 4 * i);
      int64_t v12 = *(int *)(a1 + 24);
    }
  }

  sub_1000C0BFC(v12, v5, v6, v7, v8, v9, v10, v11);
  int v15 = *(_DWORD *)(a1 + 24);
  if (v15 < 1)
  {
    int v17 = 0;
  }

  else
  {
    uint64_t v16 = 0LL;
    int v17 = 0;
    int v18 = 0;
    do
    {
      if (!*(_BYTE *)(v14 + v16))
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v16;
        do
        {
          uint64_t v21 = *(int *)(*(void *)a1 + 4 * v20);
          *(_DWORD *)(*(void *)(a1 + 16) + 4LL * v18 + 4 * v19) = v21;
          *(_BYTE *)(v14 + v20) = 1;
          ++v19;
          uint64_t v20 = v21;
        }

        while (!*(_BYTE *)(v14 + v21));
        v18 += v19;
        *(_DWORD *)(*(void *)(a1 + 8) + 4LL * v17++) = v19;
        int v15 = *(_DWORD *)(a1 + 24);
      }

      ++v16;
    }

    while (v16 < v15);
  }

  *(_DWORD *)(a1 + 28) = v17;
  return sub_1000C0EF8(v14);
}

uint64_t sub_1000C8560(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 28);
  if (v1 >= 1)
  {
    uint64_t v2 = 0LL;
    int v3 = 0;
    uint64_t v4 = *(void *)(result + 8);
    do
    {
      unint64_t v5 = *(unsigned int *)(v4 + 4 * v2);
      if ((int)v5 >= 2)
      {
        uint64_t v6 = *(void *)(result + 16) + 4LL * v3;
        unint64_t v7 = v5 >> 1;
        int v8 = v5 - 1;
        uint64_t v9 = (int *)v6;
        do
        {
          int v10 = *v9;
          uint64_t v11 = 4LL * v8;
          *v9++ = *(_DWORD *)(v6 + v11);
          *(_DWORD *)(v6 + v11) = v10;
          --v8;
          --v7;
        }

        while (v7);
        uint64_t v4 = *(void *)(result + 8);
        int v1 = *(_DWORD *)(result + 28);
        LODWORD(v5) = *(_DWORD *)(v4 + 4 * v2);
      }

      v3 += v5;
      ++v2;
    }

    while (v2 < v1);
  }

  if (*(int *)(result + 24) >= 1)
  {
    uint64_t v12 = 0LL;
    do
      *(_DWORD *)(*(void *)result + 4 * v12++) = 0x7FFFFFFF;
    while (v12 < *(int *)(result + 24));
    int v1 = *(_DWORD *)(result + 28);
  }

  if (v1 >= 1)
  {
    uint64_t v13 = 0LL;
    int v14 = 0;
    uint64_t v15 = *(void *)(result + 8);
    do
    {
      LODWORD(v16) = *(_DWORD *)(v15 + 4 * v13);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0LL;
        int v18 = *(_DWORD *)(*(void *)(result + 16) + 4LL * v14);
        do
        {
          uint64_t v19 = *(void *)(result + 16) + 4LL * v14;
          uint64_t v20 = v17 + 1;
          BOOL v21 = v17 + 1 < (int)v16;
          int v22 = v18;
          if (v21) {
            int v22 = *(_DWORD *)(v19 + 4 * v17 + 4);
          }
          *(_DWORD *)(*(void *)result + 4LL * *(int *)(v19 + 4 * v17)) = v22;
          uint64_t v15 = *(void *)(result + 8);
          uint64_t v16 = *(int *)(v15 + 4 * v13);
          ++v17;
        }

        while (v20 < v16);
        int v1 = *(_DWORD *)(result + 28);
      }

      v14 += v16;
      ++v13;
    }

    while (v13 < v1);
  }

  return result;
}

uint64_t sub_1000C86A4(uint64_t result, int a2)
{
  uint64_t v3 = result;
  if (*(_DWORD *)(result + 24) < a2)
  {
    sub_1000C0EF8(*(void *)result);
    sub_1000C0EF8(*(void *)(v3 + 8));
    sub_1000C0EF8(*(void *)(v3 + 16));
    *(void *)uint64_t v3 = sub_1000C0BF4(4LL * a2, v4, v5, v6, v7, v8, v9, v10);
    *(void *)(v3 + 8) = sub_1000C0BF4(4LL * a2, v11, v12, v13, v14, v15, v16, v17);
    uint64_t result = sub_1000C0BF4(4LL * a2, v18, v19, v20, v21, v22, v23, v24);
    *(void *)(v3 + 16) = result;
  }

  if (a2 <= 0)
  {
    *(_DWORD *)(v3 + 24) = a2;
    *(_DWORD *)(v3 + 28) = a2;
  }

  else
  {
    uint64_t v25 = 0LL;
    do
    {
      *(_DWORD *)(*(void *)v3 + 4 * v25) = v25;
      ++v25;
    }

    while (a2 != v25);
    uint64_t v26 = 0LL;
    *(_DWORD *)(v3 + 24) = a2;
    *(_DWORD *)(v3 + 28) = a2;
    do
    {
      uint64_t v27 = 4 * v26;
      *(_DWORD *)(*(void *)(v3 + 8) + v27) = 1;
      *(_DWORD *)(*(void *)(v3 + 16) + v27) = v26++;
    }

    while (a2 != v26);
  }

  return result;
}

BOOL sub_1000C877C()
{
  return qword_1001029B0 != 0;
}

uint64_t sub_1000C8790()
{
  if (qword_1001029B0) {
    return off_1001029D8();
  }
  return result;
}

uint64_t sub_1000C87AC(char *a1, uint64_t a2, _WORD *a3)
{
  unsigned int v3 = *a1;
  if (*a1 < 0)
  {
    v3 += 65408 + *(_DWORD *)(a2 + 4LL * *(int *)(a2 + 4) + 8);
  }

  else if (v3 < 0x20)
  {
    return sub_1000CF26C(a1 + 1, a3) + 1;
  }

  *a3 = v3;
  return 1LL;
}

uint64_t sub_1000C8808(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  if ((a1 - 32) > 0x5F)
  {
    unsigned int v4 = a1 - *(_DWORD *)(a2 + 4LL * *(int *)(a2 + 4) + 8);
    if (v4 > 0x7F)
    {
      *a3 = 14;
      return sub_1000CF578(a1, a3 + 1) + 1;
    }

    else
    {
      *a3 = v4 ^ 0x80;
      return 1LL;
    }
  }

  else
  {
    *a3 = a1;
    return 1LL;
  }

uint64_t sub_1000C8874(void *__s1, int a2, char *__s2, int a4)
{
  if (a4 < 1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v7 = 0LL;
  size_t v8 = a2;
  while (memcmp(__s1, __s2, v8))
  {
    __s2 += v8;
    uint64_t v7 = (v7 + 1);
    if (a4 == (_DWORD)v7) {
      return 0xFFFFFFFFLL;
    }
  }

  return v7;
}

unint64_t sub_1000C88E4(unint64_t result)
{
  if (result)
  {
    int v1 = (unsigned __int8 *)result;
    LODWORD(result) = -1;
    do
    {
      int v2 = *v1++;
      uint64_t result = (result + 1);
    }

    while (v2);
  }

  return result;
}

_BYTE *sub_1000C8900(_BYTE *result, unsigned __int8 a2)
{
  if (result)
  {
    int v2 = *result;
    if (*result)
    {
      while (v2 != a2)
      {
        int v3 = *++result;
        int v2 = v3;
        if (!v3) {
          return 0LL;
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

uint64_t sub_1000C8928@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  if (a3 < 1) {
    return 0LL;
  }
  uint64_t v4 = a3;
  while (1)
  {
    int v6 = *a1++;
    int v5 = v6;
    int v8 = *a2++;
    int v7 = v8;
    if (!v5) {
      LODWORD(a4) = 0;
    }
    a4 = v5 == v7 ? a4 : (v5 - v7);
    if (!v5 || v5 != v7) {
      break;
    }
    if (!--v4) {
      return 0LL;
    }
  }

  return a4;
}

BOOL sub_1000C896C(_BYTE *a1, char *a2, int a3)
{
  if (a3 == 1)
  {
    *a1 = 0;
    return *a2 == 0;
  }

  else if (a2)
  {
    char v4 = *a2;
    if (*a2) {
      BOOL v5 = a3 < 2;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
      *a1 = 0;
      return *a2 == 0;
    }

    else
    {
      uint64_t v6 = 0LL;
      do
      {
        a1[v6] = v4;
        unint64_t v7 = v6 + 1;
        char v4 = a2[v6 + 1];
        if (v4) {
          BOOL v8 = v7 >= (a3 - 1);
        }
        else {
          BOOL v8 = 1;
        }
        ++v6;
      }

      while (!v8);
      a1[v7] = 0;
      return a2[v7] == 0;
    }
  }

  else
  {
    *a1 = 0;
    return 0LL;
  }

uint64_t sub_1000C89F8(unsigned __int8 *a1, _BYTE *a2, int a3)
{
  if (a1)
  {
    int v3 = -1;
    char v4 = a1;
    do
    {
      int v5 = *v4++;
      ++v3;
    }

    while (v5);
    if (!a2) {
      return 0LL;
    }
  }

  else
  {
    int v3 = 0;
    if (!a2) {
      return 0LL;
    }
  }

  if (v3 + 1 >= a3) {
    return 0LL;
  }
  LOBYTE(v7) = *a2;
  if (*a2)
  {
    uint64_t v8 = 0LL;
    int v9 = a3 - 1;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v10 = (v9 - v3);
    int v11 = v9 - v3;
    while (v10 != v8)
    {
      a1[v3 + v8] = v7;
      int v12 = v8 + 1;
      int v7 = a2[++v8];
      if (!v7)
      {
        int v11 = v12;
        break;
      }
    }

    a1[v11 + (uint64_t)v3] = 0;
    return 1LL;
  }

  else
  {
    a1[v3] = 0;
    return 1LL;
  }

uint64_t sub_1000C8AB4(_BYTE *a1, unsigned __int8 *a2)
{
  while (1)
  {
    int v2 = *a1;
    if (!*a1) {
      break;
    }
    int v3 = *a2++;
    ++a1;
    uint64_t v4 = (v2 - v3);
    if ((_DWORD)v4) {
      return v4;
    }
  }

  return -*a2;
}

uint64_t sub_1000C8AE4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  while (1)
  {
    uint64_t v5 = *a1;
    uint64_t v6 = *a2;
    if (!*a1) {
      break;
    }
    unsigned __int8 v7 = *a1;
    if ((v6 & 0x80) == 0 && (byte_1000F1D84[v6] & 2) != 0) {
      LODWORD(v6) = sub_1000BE054(v6);
    }
    ++a1;
    ++a2;
    uint64_t result = v7 - v6;
    if (v7 != (_DWORD)v6) {
      return result;
    }
  }

  return -(int)v6;
}

_BYTE *sub_1000C8B7C(char *a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = sub_1000C88E4((unint64_t)a1) + 1;
  sub_1000C0BFC(v2, v3, v4, v5, v6, v7, v8, v9);
  int v11 = v10;
  sub_1000C896C(v10, a1, v2);
  return v11;
}

_BYTE *sub_1000C8BE0(char *a1, unint64_t a2)
{
  if (a1)
  {
    int v4 = sub_1000C88E4((unint64_t)a1);
    int v12 = v4;
    if (a2)
    {
      int v13 = sub_1000C88E4(a2);
      sub_1000C0BFC(v12 + 1 + v13, v14, v15, v16, v17, v18, v19, v20);
      uint64_t v22 = v21;
      sub_1000C896C(v21, a1, v12 + 1);
      uint64_t v23 = &v22[v12];
      int v24 = v13 + 1;
      uint64_t v25 = (char *)a2;
    }

    else
    {
      sub_1000C0BFC(v4 + 1, v5, v6, v7, v8, v9, v10, v11);
      uint64_t v22 = v23;
      uint64_t v25 = a1;
      int v24 = v12 + 1;
    }

    goto LABEL_7;
  }

  if (a2)
  {
    int v26 = sub_1000C88E4(a2) + 1;
    sub_1000C0BFC(v26, v27, v28, v29, v30, v31, v32, v33);
    uint64_t v22 = v23;
    uint64_t v25 = (char *)a2;
    int v24 = v26;
LABEL_7:
    sub_1000C896C(v23, v25, v24);
    return v22;
  }

  return 0LL;
}

uint64_t sub_1000C8CC0(uint64_t result, unsigned int a2)
{
  if ((int)a2 >= 1)
  {
    if (a2 < 8)
    {
      uint64_t v2 = 0LL;
      goto LABEL_13;
    }

    if (a2 >= 0x20)
    {
      uint64_t v2 = a2 & 0xFFFFFFE0;
      uint64_t v3 = (char *)(result + 32);
      uint64_t v4 = v2;
      do
      {
        uint64_t v5 = v3 - 32;
        int8x16x2_t v16 = vld2q_s8(v5);
        int8x16x2_t v17 = vld2q_s8(v3);
        int8x16_t v6 = v16.val[0];
        int8x16_t v7 = v17.val[0];
        vst2q_s8(v5, *(int8x16x2_t *)((char *)&v16 + 16));
        vst2q_s8(v3, *(int8x16x2_t *)((char *)&v17 + 16));
        v3 += 64;
        v4 -= 32LL;
      }

      while (v4);
      if (v2 == a2) {
        return result;
      }
      if ((a2 & 0x18) == 0)
      {
LABEL_13:
        int v12 = (_BYTE *)(result + 2 * v2 + 1);
        uint64_t v13 = a2 - v2;
        do
        {
          char v14 = *(v12 - 1);
          *(v12 - 1) = *v12;
          *int v12 = v14;
          v12 += 2;
          --v13;
        }

        while (v13);
        return result;
      }
    }

    else
    {
      uint64_t v2 = 0LL;
    }

    uint64_t v8 = v2;
    uint64_t v2 = a2 & 0xFFFFFFF8;
    uint64_t v9 = (char *)(result + 2 * v8);
    uint64_t v10 = v8 - v2;
    do
    {
      int8x8x2_t v15 = vld2_s8(v9);
      int8x8_t v11 = v15.val[0];
      vst2_s8(v9, *(int8x8x2_t *)((char *)&v15 + 8));
      v9 += 16;
      v10 += 8LL;
    }

    while (v10);
    if (v2 != a2) {
      goto LABEL_13;
    }
  }

  return result;
}

double sub_1000C8D84(uint64_t a1, unsigned int a2, int16x8_t a3)
{
  if ((int)a2 >= 1)
  {
    if (a2 < 8)
    {
      uint64_t v3 = 0LL;
      goto LABEL_13;
    }

    if (a2 >= 0x20)
    {
      uint64_t v3 = a2 & 0xFFFFFFE0;
      uint64_t v4 = (char *)(a1 + 64);
      uint64_t v5 = v3;
      do
      {
        int8x16_t v6 = v4 - 64;
        int8x16x4_t v17 = vld4q_s8(v6);
        v18.val[0] = v17.val[3];
        v18.val[1] = v17.val[2];
        int8x16x4_t v19 = vld4q_s8(v4);
        v18.val[2] = v17.val[1];
        v18.val[3] = v17.val[0];
        a3 = (int16x8_t)v19.val[3];
        v17.val[1] = v19.val[2];
        v17.val[2] = v19.val[1];
        v17.val[3] = v19.val[0];
        vst4q_s8(v6, v18);
        vst4q_s8(v4, *(int8x16x4_t *)a3.i8);
        v4 += 128;
        v5 -= 32LL;
      }

      while (v5);
      if (v3 == a2) {
        return *(double *)a3.i64;
      }
      if ((a2 & 0x18) == 0)
      {
LABEL_13:
        uint64_t v13 = (unsigned __int32 *)(a1 + 4 * v3);
        uint64_t v14 = a2 - v3;
        do
        {
          a3.i32[0] = *v13;
          a3 = (int16x8_t)vmovl_u8(*(uint8x8_t *)a3.i8);
          *(int16x4_t *)a3.i8 = vrev64_s16(*(int16x4_t *)a3.i8);
          *(int8x8_t *)a3.i8 = vmovn_s16(a3);
          *v13++ = a3.i32[0];
          --v14;
        }

        while (v14);
        return *(double *)a3.i64;
      }
    }

    else
    {
      uint64_t v3 = 0LL;
    }

    uint64_t v7 = v3;
    uint64_t v3 = a2 & 0xFFFFFFF8;
    uint64_t v8 = (char *)(a1 + 4 * v7);
    uint64_t v9 = v7 - v3;
    do
    {
      *(int8x8x4_t *)a3.i8 = vld4_s8(v8);
      v16.val[0] = v10;
      v16.val[1] = v11;
      v16.val[2] = v12;
      v16.val[3] = (int8x8_t)a3.i64[0];
      vst4_s8(v8, v16);
      v8 += 32;
      v9 += 8LL;
    }

    while (v9);
    if (v3 != a2) {
      goto LABEL_13;
    }
  }

  return *(double *)a3.i64;
}

int8x8_t *sub_1000C8E6C(int8x8_t *result, int a2)
{
  if (a2 >= 1)
  {
    uint64_t v2 = a2;
    do
    {
      *uint64_t result = vrev64_s8(*result);
      ++result;
      --v2;
    }

    while (v2);
  }

  return result;
}

uint8x8_t sub_1000C8E90(int8x8_t *a1, int a2, uint8x8_t result)
{
  switch(a2)
  {
    case 8:
      uint64_t result = (uint8x8_t)vrev64_s8(*a1);
      *a1 = (int8x8_t)result;
      break;
    case 4:
      result.i32[0] = a1->i32[0];
      int16x8_t v4 = (int16x8_t)vmovl_u8(result);
      *(int16x4_t *)v4.i8 = vrev64_s16(*(int16x4_t *)v4.i8);
      uint64_t result = (uint8x8_t)vmovn_s16(v4);
      a1->i32[0] = result.i32[0];
      break;
    case 2:
      __int8 v3 = a1->i8[0];
      a1->i8[0] = a1->i8[1];
      a1->i8[1] = v3;
      break;
  }

  return result;
}

uint64_t sub_1000C8EE4(const char *a1)
{
  if (!a1) {
    return 0LL;
  }
  if (!*a1) {
    return 0LL;
  }
  int v1 = j__fopen(a1, "rb");
  if (!v1) {
    return 0LL;
  }
  uint64_t v2 = v1;
  uint64_t v3 = sub_1000C1074(96LL);
  uint64_t v4 = v3;
  if (!v3) {
    return v4;
  }
  *(void *)(v3 + 32) = v2;
  if (j__fseek(v2, 0LL, 2))
  {
    if (*(int *)(v4 + 76) >= 1)
    {
      if (*(_WORD *)(v4 + 12))
      {
        unint64_t v5 = 0LL;
        do
          sub_1000C0EF8(*(void *)(*(void *)(v4 + 80) + 8 * v5++));
        while (v5 < *(unsigned __int16 *)(v4 + 12));
      }

uint64_t sub_1000C9070(uint64_t a1)
{
  if (*(int *)(a1 + 76) >= 1)
  {
    if (*(_WORD *)(a1 + 12))
    {
      unint64_t v2 = 0LL;
      do
        sub_1000C0EF8(*(void *)(*(void *)(a1 + 80) + 8 * v2++));
      while (v2 < *(unsigned __int16 *)(a1 + 12));
    }

    sub_1000C0EF8(*(void *)(a1 + 80));
    sub_1000C0EF8(*(void *)(a1 + 88));
  }

  uint64_t v3 = *(FILE **)(a1 + 32);
  if (v3) {
    j__fclose(v3);
  }
  return sub_1000C0EF8(a1);
}

uint64_t sub_1000C90E0(int *__dst)
{
  unint64_t v2 = (FILE *)*((void *)__dst + 4);
  if (v2)
  {
  }

  else
  {
    uint64_t v3 = __dst[12];
    else {
      int v4 = __dst[13] - v3;
    }
    memcpy(__dst, (const void *)(*((void *)__dst + 5) + v3), v4);
    __dst[12] += v4;
    if (v4 < 4) {
      return 0LL;
    }
  }

  int8x16_t v6 = (FILE *)*((void *)__dst + 4);
  if (v6)
  {
  }

  else
  {
    uint64_t v7 = __dst[12];
    else {
      int v8 = __dst[13] - v7;
    }
    memcpy(__dst + 1, (const void *)(*((void *)__dst + 5) + v7), v8);
    __dst[12] += v8;
    if (v8 < 4) {
      return 0LL;
    }
  }

  __dst[5] = 0;
  int v9 = (FILE *)*((void *)__dst + 4);
  if (v9)
  {
  }

  else
  {
    uint64_t v11 = __dst[12];
    else {
      int v12 = __dst[13] - v11;
    }
    memcpy(__dst + 2, (const void *)(*((void *)__dst + 5) + v11), v12);
    __dst[12] += v12;
    if (v12 < 2) {
      return 0LL;
    }
  }

  if (__dst[5]) {
    sub_1000C8E90((int8x8_t *)__dst + 1, 2, v10);
  }
  int v13 = *((unsigned __int16 *)__dst + 4);
  if (v13 != 65279)
  {
    if (v13 != 65534) {
      return 0LL;
    }
    __dst[5] = 1;
  }

  if (__dst[5]) {
    sub_1000C8E90((int8x8_t *)((char *)__dst + 10), 2, v14);
  }
  if (__dst[5]) {
    sub_1000C8E90((int8x8_t *)(__dst + 3), 2, v15);
  }
  if (__dst[5]) {
    sub_1000C8E90((int8x8_t *)((char *)__dst + 14), 2, v16);
  }
  *((_WORD *)__dst + 8) = 0;
  if (*((unsigned __int16 *)__dst + 5) < 3u)
  {
    *((_WORD *)__dst + 14) = 16;
    return 1LL;
  }

  else
  {
    if (__dst[5]) {
      sub_1000C8E90((int8x8_t *)__dst + 2, 2, v17);
    }
    *((_WORD *)__dst + 14) = 18;
    return 1LL;
  }

uint64_t sub_1000C93C4(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(_DWORD *)(result + 24))
    {
      if (j__fseek(*(FILE **)(result + 32), 0LL, 0)) {
        return 1LL;
      }
      int v2 = sub_1000C94A4(v1);
      if (*(int *)(v1 + 76) >= 1)
      {
LABEL_9:
        if (*(_WORD *)(v1 + 12))
        {
          unint64_t v5 = 0LL;
          do
            sub_1000C0EF8(*(void *)(*(void *)(v1 + 80) + 8 * v5++));
          while (v5 < *(unsigned __int16 *)(v1 + 12));
        }

        sub_1000C0EF8(*(void *)(v1 + 80));
        sub_1000C0EF8(*(void *)(v1 + 88));
        uint64_t v3 = *(FILE **)(v1 + 32);
        if (!v3) {
          goto LABEL_13;
        }
        goto LABEL_7;
      }
    }

    else
    {
      int v2 = 0;
    }

    uint64_t v3 = *(FILE **)(v1 + 32);
    if (!v3)
    {
LABEL_13:
      BOOL v4 = 0;
LABEL_14:
      sub_1000C0EF8(v1);
      return v2 || v4;
    }

uint64_t sub_1000C94A4(uint64_t a1)
{
  int v2 = *(FILE **)(a1 + 32);
  if (j__fwrite((const void *)a1, 1uLL, 4uLL, v2) != 4
    || j__fwrite((const void *)(a1 + 4), 1uLL, 4uLL, v2) != 4)
  {
    return 0xFFFFFFFFLL;
  }

  uint64_t v3 = (const void *)(a1 + 8);
  __int16 v4 = *(_WORD *)(a1 + 8);
  *(_WORD *)(a1 + 8) = -257;
  unint64_t v5 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    *(_WORD *)(a1 + 8) = -2;
    int v6 = j__fwrite(v3, 1uLL, 2uLL, v5);
    char v7 = *(_BYTE *)(a1 + 8);
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a1 + 9);
    *(_BYTE *)(a1 + 9) = v7;
    if (v6 != 2) {
      return 0xFFFFFFFFLL;
    }
  }

  else if (j__fwrite(v3, 1uLL, 2uLL, v5) != 2)
  {
    return 0xFFFFFFFFLL;
  }

  *(_WORD *)(a1 + 8) = v4;
  int v8 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v9 = *(_BYTE *)(a1 + 10);
    *(_BYTE *)(a1 + 10) = *(_BYTE *)(a1 + 11);
    *(_BYTE *)(a1 + 11) = v9;
    int v10 = j__fwrite((const void *)(a1 + 10), 1uLL, 2uLL, v8);
    char v11 = *(_BYTE *)(a1 + 10);
    *(_BYTE *)(a1 + 10) = *(_BYTE *)(a1 + 11);
    *(_BYTE *)(a1 + 11) = v11;
    if (v10 != 2) {
      return 0xFFFFFFFFLL;
    }
  }

  else if (j__fwrite((const void *)(a1 + 10), 1uLL, 2uLL, v8) != 2)
  {
    return 0xFFFFFFFFLL;
  }

  int v12 = (const void *)(a1 + 12);
  int v13 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v14 = *(_BYTE *)(a1 + 12);
    *(_BYTE *)(a1 + 12) = *(_BYTE *)(a1 + 13);
    *(_BYTE *)(a1 + 13) = v14;
    int v15 = j__fwrite(v12, 1uLL, 2uLL, v13);
    char v16 = *(_BYTE *)(a1 + 12);
    *(_BYTE *)(a1 + 12) = *(_BYTE *)(a1 + 13);
    *(_BYTE *)(a1 + 13) = v16;
    if (v15 != 2) {
      return 0xFFFFFFFFLL;
    }
  }

  else if (j__fwrite(v12, 1uLL, 2uLL, v13) != 2)
  {
    return 0xFFFFFFFFLL;
  }

  uint8x8_t v17 = (const void *)(a1 + 14);
  int8x16x4_t v18 = *(FILE **)(a1 + 32);
  if (*(_DWORD *)(a1 + 20))
  {
    char v19 = *(_BYTE *)(a1 + 14);
    *(_BYTE *)(a1 + 14) = *(_BYTE *)(a1 + 15);
    *(_BYTE *)(a1 + 15) = v19;
    int v20 = j__fwrite(v17, 1uLL, 2uLL, v18);
    char v21 = *(_BYTE *)(a1 + 14);
    *(_BYTE *)(a1 + 14) = *(_BYTE *)(a1 + 15);
    *(_BYTE *)(a1 + 15) = v21;
  }

  else
  {
    int v20 = j__fwrite(v17, 1uLL, 2uLL, v18);
  }

  if (v20 == 2)
  {
    __int16 v22 = 16;
    if (*(unsigned __int16 *)(a1 + 10) < 3u)
    {
LABEL_22:
      uint64_t result = 0LL;
      *(_WORD *)(a1 + 28) = v22;
      return result;
    }

    if (sub_1000CAE58(*(FILE **)(a1 + 32), (char *)(a1 + 16), *(_DWORD *)(a1 + 20)) == 2)
    {
      __int16 v22 = 18;
      goto LABEL_22;
    }
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_1000C96D4(uint64_t a1, int a2)
{
  __ptr.i16[0] = 0;
  uint64_t v4 = *(void *)(a1 + 24);
  int v5 = *(unsigned __int16 *)(v4 + 16);
  int v6 = *(FILE **)(v4 + 32);
  if (v6)
  {
    int v7 = j__fread(&__ptr, 1uLL, 2uLL, v6);
    if (v7 < 2) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v9 = *(int *)(v4 + 48);
    else {
      int v10 = *(_DWORD *)(v4 + 52) - v9;
    }
    __memcpy_chk(&__ptr, *(void *)(v4 + 40) + v9, v10, 2LL);
    *(_DWORD *)(v4 + 48) = v10 + v9;
    int v7 = v10;
    if (v10 < 2) {
      return 0LL;
    }
  }

  if (v5 == 1) {
    sub_1000BE8C0((uint64_t)&__ptr, v7, (uint64_t)&__ptr);
  }
  if (a2) {
    sub_1000C8E90(&__ptr, 2, v8);
  }
  if (__ptr.i16[0] < 1) {
    return 0LL;
  }
  uint64_t result = sub_1000C1074(__ptr.u16[0] + 1LL);
  *(void *)a1 = result;
  if (!result) {
    return result;
  }
  uint64_t v12 = result;
  int v13 = *(unsigned __int16 *)(v4 + 16);
  int v14 = __ptr.i16[0];
  if (__ptr.i16[0] < 1)
  {
    int v16 = 0;
    if (__ptr.i16[0] > 0) {
      return 0LL;
    }
  }

  else
  {
    int v15 = *(FILE **)(v4 + 32);
    if (v15)
    {
      int v16 = j__fread((void *)result, 1uLL, __ptr.i16[0], v15);
      if (v16 < v14) {
        return 0LL;
      }
    }

    else
    {
      uint64_t v17 = *(int *)(v4 + 48);
      else {
        int v16 = *(_DWORD *)(v4 + 52) - v17;
      }
      memcpy((void *)result, (const void *)(*(void *)(v4 + 40) + v17), v16);
      *(_DWORD *)(v4 + 48) += v16;
      if (v16 < v14) {
        return 0LL;
      }
    }
  }

  if (v13 == 1) {
    sub_1000BE8C0(v12, v16, v12);
  }
  if (!v16) {
    return 0LL;
  }
  __int16 v18 = __ptr.i16[0];
  int v19 = *(unsigned __int16 *)(v4 + 16);
  int v20 = *(FILE **)(v4 + 32);
  if (v20)
  {
    int v21 = j__fread((void *)(a1 + 8), 1uLL, 4uLL, v20);
    if (v21 < 4) {
      return 0LL;
    }
  }

  else
  {
    uint64_t v23 = *(int *)(v4 + 48);
    else {
      int v24 = *(_DWORD *)(v4 + 52) - v23;
    }
    memcpy((void *)(a1 + 8), (const void *)(*(void *)(v4 + 40) + v23), v24);
    *(_DWORD *)(v4 + 48) += v24;
    int v21 = v24;
    if (v24 < 4) {
      return 0LL;
    }
  }

  if (v19 == 1) {
    sub_1000BE8C0(a1 + 8, v21, a1 + 8);
  }
  if (a2) {
    sub_1000C8E90((int8x8_t *)(a1 + 8), 4, v22);
  }
  int v25 = *(unsigned __int16 *)(v4 + 16);
  int v26 = *(FILE **)(v4 + 32);
  if (v26)
  {
    int v27 = j__fread((void *)(a1 + 12), 1uLL, 4uLL, v26);
  }

  else
  {
    uint64_t v29 = *(int *)(v4 + 48);
    else {
      int v30 = *(_DWORD *)(v4 + 52) - v29;
    }
    memcpy((void *)(a1 + 12), (const void *)(*(void *)(v4 + 40) + v29), v30);
    *(_DWORD *)(v4 + 48) += v30;
    int v27 = v30;
  }

  if (v27 >= 4)
  {
    if (v25 == 1) {
      sub_1000BE8C0(a1 + 12, v27, a1 + 12);
    }
    if (a2) {
      sub_1000C8E90((int8x8_t *)(a1 + 12), 4, v28);
    }
    if (*(int *)(a1 + 12) >= 1)
    {
      *(_WORD *)(a1 + 16) = v18 + 10;
      return 1LL;
    }
  }

  return 0LL;
}

uint64_t sub_1000C99C0(const char *a1)
{
  uint64_t v1 = j__fopen(a1, "wb");
  if (!v1) {
    return 0LL;
  }
  int v2 = v1;
  uint64_t v3 = sub_1000C1074(96LL);
  uint64_t v4 = v3;
  if (v3)
  {
    *(void *)(v3 + 32) = v2;
    sub_1000C896C((_BYTE *)v3, "VST", 4);
    sub_1000C896C((_BYTE *)(v4 + 4), "vtr", 4);
    *(_DWORD *)(v4 + 8) = 261887;
    *(_DWORD *)(v4 + 20) = 0;
    __int16 v5 = qword_1000FDCC0;
    if (qword_1000FDCC0) {
      __int16 v5 = *(_WORD *)(qword_1000FDCC0 + 5184);
    }
    *(_WORD *)(v4 + 16) = v5;
    if (sub_1000C94A4(v4)
      || (*(_DWORD *)(v4 + 24) = 1,
          *(_DWORD *)(v4 + 52) = j__ftell(*(FILE **)(v4 + 32)),
          *(_DWORD *)(v4 + 76) = 500,
          uint64_t v9 = sub_1000C1074(4000LL),
          (*(void *)(v4 + 80) = v9) == 0LL)
      || (uint64_t v10 = sub_1000C1074(4LL * *(int *)(v4 + 76)), (*(void *)(v4 + 88) = v10) == 0LL))
    {
      if (*(int *)(v4 + 76) >= 1)
      {
        if (*(_WORD *)(v4 + 12))
        {
          unint64_t v6 = 0LL;
          do
            sub_1000C0EF8(*(void *)(*(void *)(v4 + 80) + 8 * v6++));
          while (v6 < *(unsigned __int16 *)(v4 + 12));
        }

        sub_1000C0EF8(*(void *)(v4 + 80));
        sub_1000C0EF8(*(void *)(v4 + 88));
      }

      int v7 = *(FILE **)(v4 + 32);
      if (v7) {
        j__fclose(v7);
      }
      sub_1000C0EF8(v4);
      return 0LL;
    }
  }

  return v4;
}

uint64_t sub_1000C9B00(uint64_t a1, _BYTE *a2)
{
  if (*(int *)(a1 + 76) < 1)
  {
    __int128 v11 = 0u;
    uint64_t v12 = 0LL;
    uint64_t v13 = a1;
    uint64_t v14 = 0LL;
    uint64_t v9 = sub_1000C9BD0(a1, a2, (uint64_t)&v11);
    sub_1000C0EF8(v11);
  }

  else
  {
    int v4 = *(unsigned __int16 *)(a1 + 12);
    if (*(_WORD *)(a1 + 12))
    {
      int v5 = 0;
      while (1)
      {
        while (1)
        {
          int v6 = v4 >= 0 ? v4 : v4 + 1;
          int v7 = v6 >> 1;
          int v8 = sub_1000C8AB4(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8LL * ((v6 >> 1) + v5)));
          if ((v8 & 0x80000000) == 0) {
            break;
          }
          int v4 = v7;
          if (!v7) {
            return 0LL;
          }
        }

        if (!v8) {
          break;
        }
        v4 += ~v7;
        v5 += v7 + 1;
        if (!v4) {
          return 0LL;
        }
      }

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

  return v9;
}

uint64_t sub_1000C9BD0(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  int v6 = *(_DWORD *)(a1 + 60) + *(_DWORD *)(a1 + 56) + *(_DWORD *)(a1 + 68);
  int v7 = *(FILE **)(a1 + 32);
  if (!v7)
  {
    if (!*(void *)(a1 + 40))
    {
      int v8 = -1;
      if (v6 < 0) {
        return 0LL;
      }
LABEL_8:
      if (v6 > *(_DWORD *)(a1 + 52)) {
        return 0LL;
      }
      *(_DWORD *)(a1 + 48) = v6;
      while (1)
      {
LABEL_13:
        uint64_t v12 = *(FILE **)(a1 + 32);
        if (v12)
        {
          int v13 = j__ftell(v12);
          *(_DWORD *)(a3 + 32) = v13;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == v13) {
            goto LABEL_30;
          }
        }

        else if (*(void *)(a1 + 40))
        {
          int v13 = *(_DWORD *)(a1 + 48);
          *(_DWORD *)(a3 + 32) = v13;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == v13) {
            goto LABEL_30;
          }
        }

        else
        {
          int v13 = -1;
          *(_DWORD *)(a3 + 32) = -1;
          *(void *)(a3 + 24) = a1;
          if (*(_DWORD *)(a1 + 52) == -1)
          {
LABEL_30:
            uint64_t v18 = *(unsigned __int16 *)(a1 + 28);
            if (!*(void *)(a1 + 32))
            {
              if (v13 >= (int)v18)
              {
                *(_DWORD *)(a1 + 48) = v18;
                goto LABEL_37;
              }

              return 0LL;
            }

            int v19 = j__fseek(*(FILE **)(a1 + 32), v18, 0);
            uint64_t result = 0LL;
            if (!v19)
            {
              while (1)
              {
LABEL_37:
                int v20 = *(FILE **)(a1 + 32);
                if (v20)
                {
                  int v21 = j__ftell(v20);
                  *(_DWORD *)(a3 + 32) = v21;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == v21) {
                    goto LABEL_55;
                  }
                }

                else if (*(void *)(a1 + 40))
                {
                  int v21 = *(_DWORD *)(a1 + 48);
                  *(_DWORD *)(a3 + 32) = v21;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == v21) {
                    goto LABEL_55;
                  }
                }

                else
                {
                  int v21 = -1;
                  *(_DWORD *)(a3 + 32) = -1;
                  *(void *)(a3 + 24) = a1;
                  if (*(_DWORD *)(a1 + 52) == -1)
                  {
LABEL_55:
                    uint64_t v26 = *(unsigned __int16 *)(a1 + 28);
                    if (*(void *)(a1 + 32))
                    {
                      int v27 = j__fseek(*(FILE **)(a1 + 32), v26, 0);
                      uint64_t result = 0LL;
                      if (v27) {
                        return result;
                      }
                    }

                    else
                    {
                      *(_DWORD *)(a1 + 48) = v26;
                    }

uint64_t sub_1000C9F70(uint64_t a1, _BYTE *a2)
{
  uint64_t v4 = sub_1000C1074(40LL);
  uint64_t v5 = v4;
  if (!v4) {
    return v5;
  }
  *(void *)(v4 + 24) = a1;
  if (*(int *)(a1 + 76) >= 1)
  {
    int v6 = *(unsigned __int16 *)(a1 + 12);
    if (*(_WORD *)(a1 + 12))
    {
      int v7 = 0;
      while (1)
      {
        while (1)
        {
          int v8 = v6 >= 0 ? v6 : v6 + 1;
          int v9 = v8 >> 1;
          int v10 = (v8 >> 1) + v7;
          int v11 = sub_1000C8AB4(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8LL * v10));
          if ((v11 & 0x80000000) == 0) {
            break;
          }
          int v6 = v9;
          if (!v9) {
            goto LABEL_38;
          }
        }

        if (!v11) {
          break;
        }
        v6 += ~v9;
        int v7 = v10 + 1;
        if (!v6) {
          goto LABEL_38;
        }
      }

      int v14 = *(_DWORD *)(*(void *)(a1 + 88) + 4LL * v10);
      uint64_t v15 = *(FILE **)(a1 + 32);
      if (v15)
      {
        if (!j__fseek(v15, v14, 0))
        {
          int v16 = *(FILE **)(a1 + 32);
          if (v16)
          {
            int v17 = j__ftell(v16);
LABEL_35:
            *(_DWORD *)(v5 + 32) = v17;
            sub_1000C0EF8(*(void *)v5);
            *(void *)(v5 + 32) = 0LL;
            *(_OWORD *)uint64_t v5 = 0u;
            *(_OWORD *)(v5 + 16) = 0u;
            goto LABEL_38;
          }

uint64_t sub_1000CA190(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  if (*(_DWORD *)(v2 + 24) != 1)
  {
LABEL_33:
    uint64_t v9 = 0LL;
    --*(_DWORD *)(v2 + 72);
    goto LABEL_34;
  }

  int v3 = *(_DWORD *)(a1 + 32);
  uint64_t v4 = *(FILE **)(v2 + 32);
  if (v4)
  {
    j__fseek(v4, v3, 0);
  }

  else if ((v3 & 0x80000000) == 0 && v3 <= *(_DWORD *)(v2 + 52))
  {
    *(_DWORD *)(v2 + 48) = v3;
  }

  if (sub_1000CA3DC(a1, *(_DWORD *)(*(void *)(a1 + 24) + 20LL)))
  {
    uint64_t v5 = *(FILE **)(v2 + 32);
    if (v5)
    {
      j__fseek(v5, 0LL, 2);
      int v6 = *(FILE **)(v2 + 32);
      if (v6)
      {
        *(_DWORD *)(v2 + 52) = j__ftell(v6);
        int v7 = *(unsigned __int16 *)(v2 + 12);
        int v8 = *(_DWORD *)(v2 + 76);
        if (v8 > v7) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
    }

    else
    {
      int v10 = *(_DWORD *)(v2 + 52);
      if ((v10 & 0x80000000) == 0) {
        *(_DWORD *)(v2 + 48) = v10;
      }
    }

    if (*(void *)(v2 + 40))
    {
      *(_DWORD *)(v2 + 52) = *(_DWORD *)(v2 + 48);
      int v7 = *(unsigned __int16 *)(v2 + 12);
      int v8 = *(_DWORD *)(v2 + 76);
      if (v8 > v7) {
        goto LABEL_18;
      }
    }

    else
    {
      *(_DWORD *)(v2 + 52) = -1;
      int v7 = *(unsigned __int16 *)(v2 + 12);
      int v8 = *(_DWORD *)(v2 + 76);
      if (v8 > v7)
      {
LABEL_18:
        int v12 = 0;
        if (v7)
        {
          int v13 = *(char **)a1;
          while (1)
          {
            while (1)
            {
              int v14 = v7 >= 0 ? v7 : v7 + 1;
              int v15 = v14 >> 1;
              int v16 = (v14 >> 1) + v12;
              int v17 = sub_1000C8AB4(v13, *(unsigned __int8 **)(*(void *)(v2 + 80) + 8LL * v16));
              if ((v17 & 0x80000000) == 0) {
                break;
              }
              int v7 = v15;
              if (!v15) {
                goto LABEL_27;
              }
            }

            if (!v17) {
              break;
            }
            v7 += ~v15;
            int v12 = v16 + 1;
            if (!v7)
            {
LABEL_27:
              int v18 = *(unsigned __int16 *)(v2 + 12);
              BOOL v19 = __OFSUB__(v18, v12);
              int v20 = v18 - v12;
              if ((v20 < 0) ^ v19 | (v20 == 0)) {
                goto LABEL_31;
              }
              goto LABEL_28;
            }
          }

          v12 += v15;
          int v23 = *(unsigned __int16 *)(v2 + 12);
          BOOL v19 = __OFSUB__(v23, v16);
          int v20 = v23 - v16;
          if (!((v20 < 0) ^ v19 | (v20 == 0)))
          {
LABEL_28:
            uint64_t v21 = v12;
            uint64_t v22 = v12 + 1LL;
            j__memmove( (void *)(*(void *)(v2 + 80) + 8 * v22),  (const void *)(*(void *)(v2 + 80) + 8LL * v12),  8 * v20);
            j__memmove( (void *)(*(void *)(v2 + 88) + 4 * v22),  (const void *)(*(void *)(v2 + 88) + 4LL * v12),  4 * (*(unsigned __int16 *)(v2 + 12) - v12));
            goto LABEL_32;
          }
        }

uint64_t sub_1000CA3DC(uint64_t a1, int a2)
{
  __ptr.i16[0] = sub_1000C88E4(*(void *)a1);
  if (a2) {
    sub_1000C8E90(&__ptr, 2, v4);
  }
  int v5 = sub_1000CA8D0( *(FILE **)(*(void *)(a1 + 24) + 32LL),  *(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL),  2uLL,  &__ptr);
  if (a2) {
    sub_1000C8E90(&__ptr, 2, v6);
  }
  if (v5 != 2) {
    return 0LL;
  }
  int v7 = sub_1000CA8D0( *(FILE **)(*(void *)(a1 + 24) + 32LL),  *(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL),  __ptr.i16[0],  *(void **)a1);
  __int16 v9 = __ptr.i16[0];
  if (v7 != __ptr.i16[0]) {
    return 0LL;
  }
  if (a2) {
    sub_1000C8E90((int8x8_t *)(a1 + 8), 4, v8);
  }
  int v10 = sub_1000CA8D0( *(FILE **)(*(void *)(a1 + 24) + 32LL),  *(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL),  4uLL,  (void *)(a1 + 8));
  int v12 = v10;
  if (a2)
  {
    uint8x8_t v13 = sub_1000C8E90((int8x8_t *)(a1 + 8), 4, v11);
    if (v12 != 4) {
      return 0LL;
    }
    sub_1000C8E90((int8x8_t *)(a1 + 12), 4, v13);
  }

  else if (v10 != 4)
  {
    return 0LL;
  }

  int v14 = sub_1000CA8D0( *(FILE **)(*(void *)(a1 + 24) + 32LL),  *(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL),  4uLL,  (void *)(a1 + 12));
  if (a2) {
    sub_1000C8E90((int8x8_t *)(a1 + 12), 4, v15);
  }
  if (v14 == 4)
  {
    *(_WORD *)(a1 + 16) = v9 + 10;
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_1000CA54C(uint64_t a1)
{
  return *(int *)(a1 + 12);
}

uint64_t sub_1000CA554(uint64_t a1)
{
  return *(int *)(a1 + 36);
}

size_t sub_1000CA55C(uint64_t a1, void *__dst, size_t __nitems)
{
  int v3 = *(_DWORD *)(a1 + 36);
  int v4 = *(_DWORD *)(a1 + 12) - v3;
  if (!v4) {
    return 0LL;
  }
  uint64_t v9 = *(void *)(a1 + 24);
  int v10 = *(_DWORD *)(a1 + 32);
  if (*(_DWORD *)(v9 + 56) != v10 || *(_DWORD *)(v9 + 64) != v3)
  {
    int v11 = v10 + v3 + *(unsigned __int16 *)(a1 + 16);
    int v12 = *(FILE **)(v9 + 32);
    if (v12)
    {
      if (j__fseek(v12, v11, 0)) {
        return 0xFFFFFFFFLL;
      }
    }

    else
    {
      if (v11 < 0 || v11 > *(_DWORD *)(v9 + 52)) {
        return 0xFFFFFFFFLL;
      }
      *(_DWORD *)(v9 + 48) = v11;
    }

    *(_DWORD *)(v9 + 56) = *(_DWORD *)(a1 + 32);
    *(_DWORD *)(v9 + 64) = *(_DWORD *)(a1 + 36);
    *(_DWORD *)(v9 + 68) = *(_DWORD *)(a1 + 12);
    *(_DWORD *)(v9 + 60) = *(unsigned __int16 *)(a1 + 16);
  }

  int v13 = *(unsigned __int16 *)(v9 + 16);
  if ((int)__nitems < 1)
  {
    int v15 = 0;
  }

  else
  {
    int v14 = *(FILE **)(v9 + 32);
    if (v14)
    {
      int v15 = j__fread(__dst, 1uLL, __nitems, v14);
      if (v15 < (int)__nitems)
      {
LABEL_16:
        int v15 = 0;
        goto LABEL_20;
      }
    }

    else
    {
      uint64_t v17 = *(int *)(v9 + 48);
      else {
        int v15 = *(_DWORD *)(v9 + 52) - v17;
      }
      memcpy(__dst, (const void *)(*(void *)(v9 + 40) + v17), v15);
      *(_DWORD *)(v9 + 48) += v15;
    }
  }

  if (v13 == 1) {
    sub_1000BE8C0((uint64_t)__dst, v15, (uint64_t)__dst);
  }
LABEL_20:
  if (v15 == (_DWORD)__nitems)
  {
    int v16 = *(_DWORD *)(a1 + 36) + __nitems;
    *(_DWORD *)(a1 + 36) = v16;
    *(_DWORD *)(v9 + 64) = v16;
    return __nitems;
  }

  return 0xFFFFFFFFLL;
}

uint64_t sub_1000CA714(uint64_t a1, char *a2)
{
  int v4 = *(unsigned __int16 *)(a1 + 12);
  if (*(_WORD *)(a1 + 12))
  {
    int v5 = 0;
    do
    {
      while (1)
      {
        int v6 = v4 >= 0 ? v4 : v4 + 1;
        int v7 = v6 >> 1;
        int v8 = sub_1000C8AB4(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8LL * ((v6 >> 1) + v5)));
        if ((v8 & 0x80000000) == 0) {
          break;
        }
        int v4 = v7;
        if (!v7) {
          goto LABEL_11;
        }
      }

      if (!v8) {
        break;
      }
      v4 += ~v7;
      v5 += v7 + 1;
    }

    while (v4);
  }

size_t sub_1000CA888(uint64_t a1, void *__ptr, size_t a3)
{
  size_t result = sub_1000CA8D0( *(FILE **)(*(void *)(a1 + 24) + 32LL),  *(unsigned __int16 *)(*(void *)(a1 + 24) + 16LL),  a3,  __ptr);
  *(_DWORD *)(a1 + 36) += result;
  *(_DWORD *)(a1 + 12) += result;
  return result;
}

size_t sub_1000CA8D0(FILE *__stream, int a2, size_t __nitems, void *__ptr)
{
  uint64_t v4 = 0LL;
  if ((__nitems & 0x80000000) != 0 || !__stream) {
    return v4;
  }
  int v7 = __nitems;
  if (!a2) {
    return j__fwrite(__ptr, 1uLL, __nitems, __stream);
  }
  if (__nitems < 0x21)
  {
    if (!(_DWORD)__nitems) {
      return 0LL;
    }
    int v11 = v20;
    int v12 = 32;
    if (a2 == 1) {
      goto LABEL_15;
    }
LABEL_26:
    uint64_t v4 = 0LL;
    do
    {
      if (v12 >= v7) {
        size_t v17 = v7;
      }
      else {
        size_t v17 = v12;
      }
      int v18 = j__fwrite(v11, 1uLL, v17, __stream);
      if (v18 < 1) {
        break;
      }
      uint64_t v4 = (v4 + v18);
      BOOL v16 = __OFSUB__(v7, v18);
      v7 -= v18;
    }

    while (!((v7 < 0) ^ v16 | (v7 == 0)));
    goto LABEL_33;
  }

  else {
    uint64_t v9 = __nitems;
  }
  uint64_t v10 = sub_1000C1074(v9);
  if (v10) {
    int v11 = (_BYTE *)v10;
  }
  else {
    int v11 = v20;
  }
  if (v10) {
    int v12 = v9;
  }
  else {
    int v12 = 32;
  }
  if (a2 != 1) {
    goto LABEL_26;
  }
LABEL_15:
  int v13 = 0;
  uint64_t v4 = 0LL;
  do
  {
    if (v12 >= v7) {
      unint64_t v14 = v7;
    }
    else {
      unint64_t v14 = v12;
    }
    sub_1000BE894((uint64_t)__ptr + v13, v14, (uint64_t)v11);
    int v15 = j__fwrite(v11, 1uLL, v14, __stream);
    if (v15 < 1) {
      break;
    }
    uint64_t v4 = (v4 + v15);
    v13 += v15;
    BOOL v16 = __OFSUB__(v7, v15);
    v7 -= v15;
  }

  while (!((v7 < 0) ^ v16 | (v7 == 0)));
LABEL_33:
  if (v11 != v20) {
    sub_1000C0EF8((uint64_t)v11);
  }
  return v4;
}

size_t sub_1000CAA88(uint64_t a1, _BYTE *a2, int a3, int a4, void *a5)
{
  uint64_t v10 = *(FILE **)(a1 + 32);
  if (v10)
  {
    int v11 = j__ftell(v10);
    uint64_t v37 = 0LL;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
  }

  else if (*(void *)(a1 + 40))
  {
    int v11 = *(_DWORD *)(a1 + 48);
    uint64_t v37 = 0LL;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
  }

  else
  {
    int v11 = -1;
    uint64_t v37 = 0LL;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
  }

  int v12 = *(unsigned __int16 *)(a1 + 12);
  if (*(_WORD *)(a1 + 12))
  {
    int v13 = 0;
    while (1)
    {
      while (1)
      {
        int v14 = v12 >= 0 ? v12 : v12 + 1;
        int v15 = v14 >> 1;
        int v16 = (v14 >> 1) + v13;
        int v17 = sub_1000C8AB4(a2, *(unsigned __int8 **)(*(void *)(a1 + 80) + 8LL * v16));
        if ((v17 & 0x80000000) == 0) {
          break;
        }
        int v12 = v15;
        if (!v15) {
          goto LABEL_17;
        }
      }

      if (!v17) {
        break;
      }
      v12 += ~v15;
      int v13 = v16 + 1;
      if (!v12) {
        goto LABEL_17;
      }
    }

    unsigned int v19 = *(_DWORD *)(*(void *)(a1 + 88) + 4LL * v16);
    if ((v19 & 0x80000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_19;
  }

size_t sub_1000CADBC(uint64_t a1, size_t __nitems, void *__dst)
{
  uint64_t v4 = *(FILE **)(a1 + 32);
  if (v4) {
    return j__fread(__dst, 1uLL, __nitems, v4);
  }
  uint64_t v6 = *(int *)(a1 + 48);
  int v7 = *(_DWORD *)(a1 + 52) - v6;
  else {
    uint64_t v8 = v7;
  }
  memcpy(__dst, (const void *)(*(void *)(a1 + 40) + v6), (int)v8);
  *(_DWORD *)(a1 + 48) += v8;
  return v8;
}

uint64_t sub_1000CAE58(FILE *__stream, char *__ptr, int a3)
{
  if (!a3) {
    return j__fwrite(__ptr, 1uLL, 2uLL, __stream);
  }
  char v4 = *__ptr;
  *int8x8_t __ptr = __ptr[1];
  __ptr[1] = v4;
  uint64_t result = j__fwrite(__ptr, 1uLL, 2uLL, __stream);
  char v6 = *__ptr;
  *int8x8_t __ptr = __ptr[1];
  __ptr[1] = v6;
  return result;
}

uint64_t sub_1000CAEC8(uint64_t a1)
{
  uint64_t v1 = qword_1001029F8;
  qword_1001029F8 = a1;
  return v1;
}

uint64_t sub_1000CAEDC()
{
  return qword_1001029F8;
}

uint64_t sub_1000CAEE8( unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (qword_1001029F8) {
    return 0LL;
  }
  qword_1001029F8 = sub_1000C1F48(a1, a2, 0LL, a4, a5, a6, a7, a8);
  return 1LL;
}

uint64_t sub_1000CAF2C()
{
  uint64_t result = qword_1001029F8;
  if (qword_1001029F8) {
    uint64_t result = sub_1000C1FE8(qword_1001029F8);
  }
  qword_1001029F8 = 0LL;
  return result;
}

unint64_t sub_1000CAF58( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_1001029F8) {
    qword_1001029F8 = sub_1000C1F48(0x800uLL, 2048LL, 0LL, a4, a5, a6, a7, a8);
  }
  uint64_t v16 = 0LL;
  uint64_t v17 = 0LL;
  sub_1000C0F50(&v17, &v16);
  return sub_1000C20F4(qword_1001029F8, v17 + a1 + v16, v9, v10, v11, v12, v13, v14);
}

void *sub_1000CAFC0( size_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!qword_1001029F8) {
    qword_1001029F8 = sub_1000C1F48(0x800uLL, 2048LL, 0LL, a4, a5, a6, a7, a8);
  }
  uint64_t v17 = 0LL;
  uint64_t v18 = 0LL;
  sub_1000C0F50(&v18, &v17);
  int v15 = (void *)sub_1000C20F4(qword_1001029F8, v18 + a1 + v17, v9, v10, v11, v12, v13, v14);
  bzero(v15, a1);
  return v15;
}

void *sub_1000CB038(void *result, uint64_t a2)
{
  if (result)
  {
    uint64_t v3 = (uint64_t)result;
    uint64_t v4 = 0LL;
    uint64_t v5 = 0LL;
    uint64_t result = sub_1000C0F50(&v5, &v4);
    if (v5 + a2 + v4) {
      return (void *)sub_1000C21F8(qword_1001029F8, v3, (int)v5 + (int)a2 + (int)v4);
    }
  }

  return result;
}

uint64_t sub_1000CB094(uint64_t a1)
{
  uint64_t result = qword_1001029F8;
  if (a1 || qword_1001029F8) {
    return sub_1000C22D4(qword_1001029F8, a1);
  }
  return result;
}

uint64_t sub_1000CB0B0()
{
  uint64_t result = qword_1001029F8;
  if (qword_1001029F8) {
    return sub_1000C23B0(qword_1001029F8);
  }
  return result;
}

uint64_t sub_1000CB0C4(int a1)
{
  int v1 = a1 - 1;
  else {
    return 0LL;
  }
}

uint64_t sub_1000CB108(unsigned int a1, int a2)
{
  if (a1 < 0x80)
  {
    int v3 = 0;
    return dword_1000FA138[14 * v3];
  }

  if (a1 < 0x100) {
    return 1LL;
  }
  if (a1 < 0x180) {
    return 1LL;
  }
  if (a1 < 0x370) {
    return 0LL;
  }
  if (a1 < 0x400) {
    return 2LL;
  }
  if (a1 < 0x500) {
    return 3LL;
  }
  if (a1 < 0x2000) {
    return 0LL;
  }
  unsigned int v4 = a1 >> 4;
  if (a1 >> 4 < 0x207) {
    return 4LL;
  }
  if (a1 >> 5 < 0x105) {
    return 0LL;
  }
  if (v4 < 0x20D) {
    return 0LL;
  }
  if (a1 < 0x3000) {
    return 0LL;
  }
  if (a1 >> 6 < 0xC1)
  {
    int v3 = 7;
    if (a1 == 12293 && a2 == 8) {
      return 8LL;
    }
    return dword_1000FA138[14 * v3];
  }

  if (a1 >> 5 < 0x185)
  {
    int v3 = 8;
    return dword_1000FA138[14 * v3];
  }

  if (a1 >> 8 < 0x31)
  {
    int v3 = 9;
    if (a1 == 12540 && a2 == 6) {
      return 6LL;
    }
    return dword_1000FA138[14 * v3];
  }

  if (a1 >> 9 < 0x27) {
    return 0LL;
  }
  if (a1 >> 6 < 0x27F) {
    return 8LL;
  }
  if (a1 >> 10 < 0x2B) {
    return 0LL;
  }
  if (v4 < 0xD7B) {
    return 9LL;
  }
  return 0LL;
}

uint64_t sub_1000CB378(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000BF004(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }

  else
  {
    if (a1 < 0x370) {
      return 0LL;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }

    else if (a1 < 0x500)
    {
      int v2 = 4;
    }

    else
    {
      if (a1 < 0x2000) {
        return 0LL;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }

      else
      {
        if (a1 >> 5 < 0x105) {
          return 0LL;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }

        else
        {
          if (a1 < 0x3000) {
            return 0LL;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }

          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }

          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }

          else
          {
            if (a1 >> 9 < 0x27) {
              return 0LL;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }

            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0LL;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }

              else
              {
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }

  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FA138[14 * v2 + 4])();
  }
  return 0LL;
}

uint64_t sub_1000CB4B0(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000BF028(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }

  else
  {
    if (a1 < 0x370) {
      return 0LL;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }

    else if (a1 < 0x500)
    {
      int v2 = 4;
    }

    else
    {
      if (a1 < 0x2000) {
        return 0LL;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }

      else
      {
        if (a1 >> 5 < 0x105) {
          return 0LL;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }

        else
        {
          if (a1 < 0x3000) {
            return 0LL;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }

          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }

          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }

          else
          {
            if (a1 >> 9 < 0x27) {
              return 0LL;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }

            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0LL;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }

              else
              {
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }

  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FA138[14 * v2 + 6])();
  }
  return 0LL;
}

uint64_t sub_1000CB5E8(uint64_t result)
{
  if (result < 0x180)
  {
    int v2 = 2;
  }

  else
  {
    if (result < 0x400)
    {
      int v2 = 3;
    }

    else if (result < 0x500)
    {
      int v2 = 4;
    }

    else
    {
      unsigned int v1 = result >> 4;
      if (result >> 4 < 0x207)
      {
        int v2 = 5;
      }

      else
      {
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }

        else
        {
          if (result >> 6 < 0xC1)
          {
            int v2 = 7;
          }

          else if (result >> 5 < 0x185)
          {
            int v2 = 8;
          }

          else if (result >> 8 < 0x31)
          {
            int v2 = 9;
          }

          else
          {
            if (result >> 6 < 0x27F)
            {
              int v2 = 10;
            }

            else
            {
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }

              else
              {
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }

  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FA138[14 * v2 + 8])();
  }
  return result;
}

uint64_t sub_1000CB730(uint64_t result)
{
  if (result < 0x100)
  {
    if ((_DWORD)result == 255) {
      return 376LL;
    }
    return sub_1000BF084(result);
  }

  if (result < 0x180)
  {
    int v2 = 2;
  }

  else
  {
    if (result < 0x400)
    {
      int v2 = 3;
    }

    else if (result < 0x500)
    {
      int v2 = 4;
    }

    else
    {
      unsigned int v1 = result >> 4;
      if (result >> 4 < 0x207)
      {
        int v2 = 5;
      }

      else
      {
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }

        else
        {
          if (result >> 6 < 0xC1)
          {
            int v2 = 7;
          }

          else if (result >> 5 < 0x185)
          {
            int v2 = 8;
          }

          else if (result >> 8 < 0x31)
          {
            int v2 = 9;
          }

          else
          {
            if (result >> 6 < 0x27F)
            {
              int v2 = 10;
            }

            else
            {
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }

              else
              {
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }

  if (((0xFE3uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FA138[14 * v2 + 10])();
  }
  return result;
}

BOOL sub_1000CB890(uint64_t a1)
{
  if (a1 < 0x180)
  {
    int v3 = 2;
  }

  else
  {
    if (a1 < 0x400)
    {
      int v3 = 3;
    }

    else if (a1 < 0x500)
    {
      int v3 = 4;
    }

    else
    {
      unsigned int v2 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v3 = 5;
      }

      else
      {
        if (v2 < 0x20D)
        {
          int v3 = 6;
        }

        else
        {
          if (a1 >> 6 < 0xC1)
          {
            int v3 = 7;
          }

          else if (a1 >> 5 < 0x185)
          {
            int v3 = 8;
          }

          else if (a1 >> 8 < 0x31)
          {
            int v3 = 9;
          }

          else
          {
            if (a1 >> 6 < 0x27F)
            {
              int v3 = 10;
            }

            else
            {
              if (v2 >= 0xD7B)
              {
                if ((unsigned __int16)((unsigned __int16)(a1 + 16) >> 4) >= 0xFF1u)
                {
                  int v3 = 12;
                  goto LABEL_22;
                }

                return 0LL;
              }

              int v3 = 11;
            }
          }
        }
      }
    }
  }

BOOL sub_1000CBA3C(unsigned int a1)
{
  if (a1 > 0xFF) {
    return (unsigned __int16)(a1 + 240) < 0xAu;
  }
  else {
    return sub_1000BF0FC(a1);
  }
}

uint64_t sub_1000CBA60(int a1)
{
  if (a1 <= 0xFF)
  {
    if ((a1 & 0x80) == 0) {
      return (byte_1000F1D84[a1] >> 4) & 1;
    }
    return 0LL;
  }

  unsigned int v3 = a1 - 0x2000;
  uint64_t result = 1LL;
  if (v3 >= 0xC)
  {
    if (a1 < 12288)
    {
      if (a1 == 8239 || a1 == 8287) {
        return result;
      }
      return 0LL;
    }

    if (a1 != 12288 && a1 != 12351) {
      return 0LL;
    }
  }

  return result;
}

uint64_t sub_1000CBAD0(unsigned int a1)
{
  if (a1 < 0x100) {
    return sub_1000BF0B4(a1);
  }
  if (a1 < 0x180)
  {
    int v2 = 2;
  }

  else
  {
    if (a1 < 0x370) {
      return 0LL;
    }
    if (a1 < 0x400)
    {
      int v2 = 3;
    }

    else if (a1 < 0x500)
    {
      int v2 = 4;
    }

    else
    {
      if (a1 < 0x2000) {
        return 0LL;
      }
      unsigned int v1 = a1 >> 4;
      if (a1 >> 4 < 0x207)
      {
        int v2 = 5;
      }

      else
      {
        if (a1 >> 5 < 0x105) {
          return 0LL;
        }
        if (v1 < 0x20D)
        {
          int v2 = 6;
        }

        else
        {
          if (a1 < 0x3000) {
            return 0LL;
          }
          if (a1 >> 6 < 0xC1)
          {
            int v2 = 7;
          }

          else if (a1 >> 5 < 0x185)
          {
            int v2 = 8;
          }

          else if (a1 >> 8 < 0x31)
          {
            int v2 = 9;
          }

          else
          {
            if (a1 >> 9 < 0x27) {
              return 0LL;
            }
            if (a1 >> 6 < 0x27F)
            {
              int v2 = 10;
            }

            else
            {
              if (a1 >> 10 < 0x2B) {
                return 0LL;
              }
              if (v1 < 0xD7B)
              {
                int v2 = 11;
              }

              else
              {
                int v2 = 12;
              }
            }
          }
        }
      }
    }
  }

  if (((0x43uLL >> v2) & 1) == 0) {
    return (*(uint64_t (**)(void))&dword_1000FA138[14 * v2 + 12])();
  }
  return 0LL;
}

BOOL sub_1000CBC08(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0) {
    return 0LL;
  }
  if (a3 < 0x80)
  {
    int v5 = 0;
  }

  else if (a3 < 0x100)
  {
    int v5 = 1;
  }

  else if (a3 < 0x180)
  {
    int v5 = 2;
  }

  else
  {
    if (a3 < 0x400)
    {
      int v5 = 3;
    }

    else if (a3 < 0x500)
    {
      int v5 = 4;
    }

    else
    {
      unsigned int v4 = a3 >> 4;
      if (a3 >> 4 < 0x207)
      {
        int v5 = 5;
      }

      else
      {
        if (v4 < 0x20D)
        {
          int v5 = 6;
        }

        else
        {
          if (a3 >> 6 < 0xC1)
          {
            int v5 = 7;
          }

          else if (a3 >> 5 < 0x185)
          {
            int v5 = 8;
          }

          else if (a3 >> 8 < 0x31)
          {
            int v5 = 9;
          }

          else
          {
            if (a3 >> 6 < 0x27F)
            {
              int v5 = 10;
            }

            else
            {
              if (v4 < 0xD7B)
              {
                int v5 = 11;
              }

              else
              {
                int v5 = 12;
              }
            }
          }
        }
      }
    }
  }

  unsigned int v6 = dword_1000FA138[14 * v5];
  if ((_DWORD)a2 == 12540 && v6 == 6
    || (unsigned __int16)(a2 - 12441) <= 3u && v6 == 7
    || (_DWORD)a2 == 12293 && v6 == 8
    || dword_1000FA138[14 * a1] == v6)
  {
    switch(v6)
    {
      case 1u:
      case 2u:
      case 3u:
        if (a2 > 0xFF)
        {
          if (!a1
            || ((0x43uLL >> a1) & 1) != 0
            || !(*(unsigned int (**)(uint64_t))&dword_1000FA138[14 * a1 + 12])(a2))
          {
            return 0LL;
          }
        }

        else if (!sub_1000BF0B4(a2))
        {
          return 0LL;
        }

        break;
      case 6u:
        BOOL result = 1LL;
        switch((int)a2)
        {
          case 12353:
          case 12355:
          case 12357:
          case 12359:
          case 12361:
          case 12419:
          case 12421:
          case 12423:
          case 12430:
          case 12435:
          case 12441:
          case 12442:
          case 12443:
          case 12444:
          case 12445:
          case 12446:
            return result;
          case 12354:
          case 12356:
          case 12358:
          case 12360:
          case 12362:
          case 12363:
          case 12364:
          case 12365:
          case 12366:
          case 12367:
          case 12368:
          case 12369:
          case 12370:
          case 12371:
          case 12372:
          case 12373:
          case 12374:
          case 12375:
          case 12376:
          case 12377:
          case 12378:
          case 12379:
          case 12380:
          case 12381:
          case 12382:
          case 12383:
          case 12384:
          case 12385:
          case 12386:
          case 12387:
          case 12388:
          case 12389:
          case 12390:
          case 12391:
          case 12392:
          case 12393:
          case 12394:
          case 12395:
          case 12396:
          case 12397:
          case 12398:
          case 12399:
          case 12400:
          case 12401:
          case 12402:
          case 12403:
          case 12404:
          case 12405:
          case 12406:
          case 12407:
          case 12408:
          case 12409:
          case 12410:
          case 12411:
          case 12412:
          case 12413:
          case 12414:
          case 12415:
          case 12416:
          case 12417:
          case 12418:
          case 12420:
          case 12422:
          case 12424:
          case 12425:
          case 12426:
          case 12427:
          case 12428:
          case 12429:
          case 12431:
          case 12432:
          case 12433:
          case 12434:
          case 12436:
          case 12437:
          case 12438:
          case 12439:
          case 12440:
            return 0LL;
          default:
            if ((_DWORD)a2 != 12540) {
              return 0LL;
            }
            break;
        }

        return result;
      case 7u:
        BOOL result = 1LL;
        switch((int)a2)
        {
          case 12441:
          case 12442:
          case 12443:
          case 12444:
          case 12449:
          case 12451:
          case 12453:
          case 12455:
          case 12457:
          case 12515:
          case 12517:
          case 12519:
          case 12526:
          case 12531:
          case 12540:
          case 12541:
          case 12542:
            return result;
          default:
            return 0LL;
        }

        return result;
      case 8u:
        return (_DWORD)a2 == 12293;
      default:
        return 0LL;
    }
  }

  return 0LL;
}

uint64_t sub_1000CBF28(int a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0) {
    return 0LL;
  }
  if (a3 < 0x80)
  {
    int v5 = 0;
LABEL_26:
    unsigned int v7 = dword_1000FA138[14 * a1];
    goto LABEL_27;
  }

  if (a3 < 0x100)
  {
    int v5 = 1;
    goto LABEL_26;
  }

  if (a3 < 0x180)
  {
    int v5 = 2;
    goto LABEL_26;
  }

  if (a3 < 0x400)
  {
    int v5 = 3;
    goto LABEL_26;
  }

  if (a3 < 0x500)
  {
    int v5 = 4;
    goto LABEL_26;
  }

  unsigned int v4 = a3 >> 4;
  if (a3 >> 4 < 0x207)
  {
    int v5 = 5;
    goto LABEL_26;
  }

  if (v4 < 0x20D)
  {
    int v5 = 6;
    goto LABEL_26;
  }

  if (a3 >> 6 < 0xC1)
  {
    unsigned int v7 = dword_1000FA138[14 * a1];
    int v5 = 7;
    if ((_DWORD)a3 == 12293 && v7 == 8) {
      return 0LL;
    }
  }

  else if (a3 >> 5 < 0x185)
  {
    unsigned int v7 = dword_1000FA138[14 * a1];
    int v5 = 8;
  }

  else
  {
    if (a3 >> 8 >= 0x31)
    {
      if (a3 >> 6 < 0x27F)
      {
        int v5 = 10;
      }

      else
      {
        if (v4 < 0xD7B)
        {
          int v5 = 11;
        }

        else
        {
          int v5 = 12;
        }
      }

      goto LABEL_26;
    }

    unsigned int v7 = dword_1000FA138[14 * a1];
    int v5 = 9;
    if ((_DWORD)a3 == 12540 && v7 == 6) {
      return (_DWORD)a2 == 12387;
    }
  }

uint64_t sub_1000CC1FC( uint64_t result, int a2, uint64_t a3, uint64_t a4, unsigned int *a5, _DWORD *a6, _DWORD *a7, _DWORD *a8, _DWORD *a9, _DWORD *a10, _DWORD *a11)
{
  uint64_t v16 = result;
  if (result < 0x80)
  {
    int v18 = 0;
    goto LABEL_9;
  }

  if (result < 0x100)
  {
    int v18 = 1;
    goto LABEL_9;
  }

  if (result < 0x180)
  {
    int v18 = 2;
    goto LABEL_9;
  }

  if (result < 0x370)
  {
LABEL_5:
    unsigned int v17 = 0;
    int v18 = -1;
    goto LABEL_10;
  }

  if (result < 0x400)
  {
    int v18 = 3;
    goto LABEL_9;
  }

  if (result < 0x500)
  {
    int v18 = 4;
    goto LABEL_9;
  }

  unsigned int v19 = result >> 4;
  if (result >> 4 < 0x207)
  {
    int v18 = 5;
    goto LABEL_9;
  }

  if (v19 < 0x20D)
  {
    int v18 = 6;
    goto LABEL_9;
  }

  if (result >> 6 < 0xC1)
  {
    int v18 = 7;
    if ((_DWORD)result == 12293 && a2 == 8)
    {
      unsigned int v17 = 8;
      goto LABEL_10;
    }

    goto LABEL_9;
  }

  if (result >> 5 < 0x185)
  {
    int v18 = 8;
    if ((unsigned __int16)(result - 12441) <= 3u && a2 == 7)
    {
      unsigned int v17 = 7;
      goto LABEL_10;
    }

unint64_t sub_1000CC52C(unint64_t result)
{
  if (result)
  {
    unsigned int v1 = (unsigned __int16 *)result;
    LODWORD(result) = -1;
    do
    {
      int v2 = *v1++;
      BOOL result = (result + 1);
    }

    while (v2);
  }

  return result;
}

BOOL sub_1000CC548(_WORD *a1, __int16 *a2, int a3)
{
  uint64_t v3 = 0LL;
  if (!a1 || a3 < 1) {
    return v3;
  }
  if (a3 == 1)
  {
    *a1 = 0;
    return !a2 || !*a2;
  }

  if (a2)
  {
    __int16 v5 = *a2;
    if (*a2)
    {
      unint64_t v6 = 0LL;
      do
      {
        uint64_t v7 = v6;
        a1[v7] = v5;
        ++v6;
        __int16 v5 = a2[v7 + 1];
        if (v5) {
          BOOL v8 = v6 >= (a3 - 1);
        }
        else {
          BOOL v8 = 1;
        }
      }

      while (!v8);
      uint64_t v9 = v6;
      a1[v9] = 0;
      return a2[v9] == 0;
    }

    else
    {
      *a1 = 0;
      return *a2 == 0;
    }
  }

  else
  {
    *a1 = 0;
    return 0LL;
  }

uint64_t sub_1000CC5F0(uint64_t a1, uint64_t a2, int a3)
{
  if (a3 < 1) {
    return 1LL;
  }
  uint64_t v3 = 0LL;
  if (a1 && a2)
  {
    uint64_t v4 = 0LL;
    uint64_t v4 = a3 & 0x7FFFFFF0;
    __int16 v5 = (__int128 *)(a2 + 16);
    unint64_t v6 = (_OWORD *)(a1 + 16);
    uint64_t v7 = a3 & 0xFFFFFFF0;
    do
    {
      __int128 v8 = *v5;
      *(v6 - 1) = *(v5 - 1);
      *unint64_t v6 = v8;
      v5 += 2;
      v6 += 2;
      v7 -= 16LL;
    }

    while (v7);
    if (v4 != a3)
    {
LABEL_9:
      uint64_t v9 = (_WORD *)(a1 + 2 * v4);
      uint64_t v10 = (__int16 *)(a2 + 2 * v4);
      uint64_t v11 = a3 - v4;
      do
      {
        __int16 v12 = *v10++;
        *v9++ = v12;
        --v11;
      }

      while (v11);
    }

    return 1LL;
  }

  return v3;
}

uint64_t sub_1000CC67C(unsigned __int16 *a1, unsigned __int16 *a2, int a3)
{
  if (!a1) {
    return 0LL;
  }
  int v3 = -1;
  uint64_t v4 = 0xFFFFFFFF00000000LL;
  __int16 v5 = a1;
  do
  {
    int v6 = *v5++;
    ++v3;
    v4 += (uint64_t)&_mh_execute_header;
  }

  while (v6);
  if (!a2 || v3 + 1 >= a3) {
    return 0LL;
  }
  unsigned __int16 v7 = *a2;
  if (*a2)
  {
    uint64_t v8 = 0LL;
    int v9 = a3 - 1;
    uint64_t v10 = v4 >> 32;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v11 = (v9 - v3);
    __int16 v12 = &a1[v10];
    while (v11 != v8)
    {
      uint64_t v13 = v8;
      v12[v13] = v7;
      ++v8;
      unsigned __int16 v7 = a2[v13 + 1];
      if (!v7)
      {
        LODWORD(v11) = v8;
        break;
      }
    }

    a1[(int)v11 + v3] = 0;
    return 1LL;
  }

  else
  {
    a1[v3] = 0;
    return 1LL;
  }

uint64_t sub_1000CC72C(unsigned __int16 *a1, _BYTE *a2, int a3)
{
  if (!a1) {
    return 0LL;
  }
  int v3 = -1;
  uint64_t v4 = 0xFFFFFFFF00000000LL;
  __int16 v5 = a1;
  do
  {
    int v6 = *v5++;
    ++v3;
    v4 += (uint64_t)&_mh_execute_header;
  }

  while (v6);
  if (!a2 || v3 + 1 >= a3) {
    return 0LL;
  }
  LOBYTE(v7) = *a2;
  if (*a2)
  {
    uint64_t v8 = 0LL;
    int v9 = a3 - 1;
    uint64_t v10 = v4 >> 32;
    if (v3 > a3 - 1) {
      int v9 = v3;
    }
    uint64_t v11 = (v9 - v3);
    __int16 v12 = &a1[v10];
    while (v11 != v8)
    {
      v12[v8] = v7;
      int v13 = v8 + 1;
      int v7 = a2[++v8];
      if (!v7)
      {
        LODWORD(v11) = v13;
        break;
      }
    }

    a1[(int)v11 + v3] = 0;
    return 1LL;
  }

  else
  {
    a1[v3] = 0;
    return 1LL;
  }

unsigned __int16 *sub_1000CC7E0(unsigned __int16 *result, int a2)
{
  if (result)
  {
    int v2 = *result;
    if (*result)
    {
      while (v2 != a2)
      {
        int v3 = result[1];
        ++result;
        int v2 = v3;
        if (!v3) {
          return 0LL;
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

char *sub_1000CC804(char *a1, _WORD *a2, char **a3)
{
  if (a1)
  {
    int v3 = a1;
    if (a2)
    {
      uint64_t v4 = a1;
      do
      {
        if (!*(_WORD *)v4) {
          break;
        }
        int v5 = (unsigned __int16)*a2;
        if (!*a2) {
          break;
        }
        int v6 = a2 + 1;
        do
        {
          int v7 = v5;
          int v8 = *(unsigned __int16 *)v4;
          v4 += 2 * (v8 == v5);
          int v9 = *v6++;
          int v5 = v9;
          if (v9) {
            BOOL v10 = v8 == v7;
          }
          else {
            BOOL v10 = 1;
          }
        }

        while (!v10);
      }

      while (v8 == v7);
      uint64_t v11 = v4 - a1;
      BOOL result = &a1[v11 << 31 >> 31];
      int v13 = *(unsigned __int16 *)result;
      if (*(_WORD *)result)
      {
        if (*a2)
        {
          uint64_t v14 = &v3[v11 << 31 >> 31];
LABEL_16:
          int v15 = a2 + 1;
          int v16 = (unsigned __int16)*a2;
          while (v13 != v16)
          {
            int v17 = *v15++;
            int v16 = v17;
            if (!v17)
            {
              int v18 = *((unsigned __int16 *)v14 + 1);
              v14 += 2;
              int v13 = v18;
              if (v18) {
                goto LABEL_16;
              }
              goto LABEL_48;
            }
          }

          if (v13) {
            goto LABEL_55;
          }
        }

        else
        {
          uint64_t v32 = &v3[2 * (int)(v11 >> 1) + 2];
          do
          {
            int v33 = *(unsigned __int16 *)v32;
            v32 += 2;
          }

          while (v33);
        }

uint64_t sub_1000CCA00(char *a1, _WORD *a2)
{
  int v27 = 0;
  uint64_t v26 = 0LL;
  uint64_t result = (uint64_t)sub_1000CCB64(a1, a2, &v26, &v27);
  if (result)
  {
    uint64_t v4 = v26;
    if (a2)
    {
      int v5 = 0;
      if (v26)
      {
        do
        {
          int v6 = v4;
          do
          {
            if (!*(_WORD *)v6) {
              break;
            }
            int v7 = (unsigned __int16)*a2;
            if (!*a2) {
              break;
            }
            int v8 = a2 + 1;
            do
            {
              int v9 = v7;
              int v10 = *(unsigned __int16 *)v6;
              v6 += 2 * (v10 == v7);
              int v11 = *v8++;
              int v7 = v11;
              if (v11) {
                BOOL v12 = v10 == v9;
              }
              else {
                BOOL v12 = 1;
              }
            }

            while (!v12);
          }

          while (v10 == v9);
          uint64_t v13 = v6 - v4;
          uint64_t v14 = &v4[(v6 - v4) << 31 >> 31];
          int v15 = *(unsigned __int16 *)v14;
          if (!*(_WORD *)v14) {
            break;
          }
          uint64_t v16 = (int)(v13 >> 1);
          if (!*a2)
          {
            int v22 = &v4[2 * v16 + 2];
            do
            {
              int v23 = *(unsigned __int16 *)v22;
              v22 += 2;
            }

            while (v23);
LABEL_27:
            uint64_t v26 = 0LL;
            uint64_t v24 = (uint64_t)&v4[2 * v16 - 2];
            do
            {
              int v25 = *(unsigned __int16 *)(v24 + 2);
              v24 += 2LL;
            }

            while (v25);
            int v27 = (unint64_t)(v24 - (void)v14) >> 1;
            return (++v5 + 1);
          }

          int v17 = v14;
LABEL_20:
          int v18 = a2 + 1;
          int v19 = (unsigned __int16)*a2;
          while (v15 != v19)
          {
            int v20 = *v18++;
            int v19 = v20;
            if (!v20)
            {
              int v21 = *((unsigned __int16 *)v17 + 1);
              v17 += 2;
              int v15 = v21;
              if (v21) {
                goto LABEL_20;
              }
              goto LABEL_27;
            }
          }

          if (!v15) {
            goto LABEL_27;
          }
          uint64_t v4 = v17 + 2;
          uint64_t v26 = v17 + 2;
          int v27 = (unint64_t)(v17 - v14) >> 1;
          ++v5;
        }

        while (v17 != (char *)-2LL);
      }

      return (v5 + 1);
    }

    else
    {
      uint64_t result = 1LL;
      if (v26)
      {
        if (*(_WORD *)v26) {
          return 2LL;
        }
        else {
          return 1LL;
        }
      }
    }
  }

  return result;
}

char *sub_1000CCB64(char *a1, _WORD *a2, char **a3, _DWORD *a4)
{
  if (a1)
  {
    uint64_t v4 = a1;
    if (a2)
    {
      int v5 = a1;
      do
      {
        if (!*(_WORD *)v5) {
          break;
        }
        int v6 = (unsigned __int16)*a2;
        if (!*a2) {
          break;
        }
        int v7 = a2 + 1;
        do
        {
          int v8 = v6;
          int v9 = *(unsigned __int16 *)v5;
          v5 += 2 * (v9 == v6);
          int v10 = *v7++;
          int v6 = v10;
          if (v10) {
            BOOL v11 = v9 == v8;
          }
          else {
            BOOL v11 = 1;
          }
        }

        while (!v11);
      }

      while (v9 == v8);
      uint64_t v12 = v5 - a1;
      uint64_t result = &a1[(v5 - a1) << 31 >> 31];
      int v14 = *(unsigned __int16 *)result;
      if (*(_WORD *)result)
      {
        if (*a2)
        {
          int v15 = result;
LABEL_16:
          uint64_t v16 = a2 + 1;
          int v17 = (unsigned __int16)*a2;
          while (v14 != v17)
          {
            int v18 = *v16++;
            int v17 = v18;
            if (!v18)
            {
              int v19 = *((unsigned __int16 *)v15 + 1);
              v15 += 2;
              int v14 = v19;
              if (v19) {
                goto LABEL_16;
              }
              goto LABEL_48;
            }
          }

          if (!v14) {
            goto LABEL_48;
          }
          *a3 = v15 + 2;
          *a4 = (unint64_t)(v15 - result) >> 1;
          return result;
        }

        uint64_t v34 = &v4[2 * (int)(v12 >> 1) + 2];
        do
        {
          int v35 = *(unsigned __int16 *)v34;
          v34 += 2;
        }

        while (v35);
LABEL_48:
        uint64_t v4 = result;
        goto LABEL_49;
      }
    }

    else if (*(_WORD *)a1)
    {
LABEL_49:
      uint64_t v36 = 0LL;
      *a3 = 0LL;
LABEL_61:
      uint64_t result = v4;
      *a4 = v36 - 1;
      return result;
    }

unsigned __int16 *sub_1000CCD78(unsigned __int16 *a1, _WORD *a2)
{
  if (a2)
  {
    int v2 = (unsigned __int16)*a2;
    if (*a2)
    {
      uint64_t v3 = 0LL;
      while (a2[++v3])
        ;
      if (a1)
      {
        unint64_t v5 = (unint64_t)(v3 * 2) >> 1;
        if ((int)((unint64_t)(v3 * 2) >> 1) >= 2)
        {
          while (1)
          {
            do
            {
              int v6 = a1;
              int v8 = *a1++;
              int v7 = v8;
              if (v8) {
                BOOL v9 = v7 == v2;
              }
              else {
                BOOL v9 = 1;
              }
            }

            while (!v9);
            if (!v7) {
              return 0LL;
            }
            uint64_t v10 = 1LL;
            while (v6[v10] == (unsigned __int16)a2[v10])
            {
              if (++v10 >= (int)v5)
              {
                LODWORD(v10) = v5;
                break;
              }
            }

            if ((_DWORD)v10 == (_DWORD)v5) {
              return v6;
            }
          }
        }

        if ((_DWORD)v5 == 1)
        {
          uint64_t v12 = a1 - 1;
          do
          {
            int v14 = v12[1];
            ++v12;
            int v13 = v14;
            if (v14) {
              BOOL v15 = v13 == v2;
            }
            else {
              BOOL v15 = 1;
            }
          }

          while (!v15);
          if (v13) {
            return v12;
          }
          else {
            return 0LL;
          }
        }

        while (*a1++)
          ;
      }

      return 0LL;
    }
  }

  return a1;
}

uint64_t sub_1000CCE40(_WORD *a1, _WORD *a2)
{
  if (a1)
  {
    if (a2)
    {
      while (1)
      {
        unsigned int v2 = (unsigned __int16)*a1;
        unsigned int v3 = (unsigned __int16)*a2;
        if (!*a1) {
          break;
        }
        ++a1;
        ++a2;
        if (v2 != v3)
        {
          if (v2 < v3) {
            return 0xFFFFFFFFLL;
          }
          else {
            return 1LL;
          }
        }
      }

      if (*a2) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 0LL;
  }

uint64_t sub_1000CCE90(_WORD *a1, unsigned __int16 *a2)
{
  unsigned int v2 = a2;
  if (a1)
  {
    if (!a2) {
      return 1LL;
    }
    for (int64_t i = a1; ; ++i)
    {
      uint64_t v5 = (unsigned __int16)*i;
      uint64_t v4 = *v2;
      if (!*i)
      {
        BOOL v16 = (_DWORD)v4 == 0;
        goto LABEL_133;
      }

      if (v5 < 0x100)
      {
        int v8 = sub_1000BF054(v5);
        goto LABEL_28;
      }

      if (v5 < 0x180)
      {
        int v7 = 2;
      }

      else
      {
        if (v5 < 0x400)
        {
          int v7 = 3;
        }

        else if (v5 < 0x500)
        {
          int v7 = 4;
        }

        else
        {
          unsigned int v6 = v5 >> 4;
          if (v5 >> 4 < 0x207)
          {
            int v7 = 5;
          }

          else
          {
            if (v6 < 0x20D)
            {
              int v7 = 6;
            }

            else
            {
              if (v5 >> 6 < 0xC1)
              {
                int v7 = 7;
              }

              else if (v5 >> 5 < 0x185)
              {
                int v7 = 8;
              }

              else if (v5 >> 8 < 0x31)
              {
                int v7 = 9;
              }

              else
              {
                if (v5 >> 6 < 0x27F)
                {
                  int v7 = 10;
                }

                else
                {
                  if (v6 < 0xD7B)
                  {
                    int v7 = 11;
                  }

                  else
                  {
                    int v7 = 12;
                  }
                }
              }
            }
          }
        }
      }

      if (((0xFE3uLL >> v7) & 1) == 0
        && (*(unsigned int (**)(void))&dword_1000FA138[14 * v7 + 6])((unsigned __int16)*i))
      {
        if (v5 < 0x180)
        {
          int v10 = 2;
        }

        else if (v5 < 0x400)
        {
          int v10 = 3;
        }

        else if (v5 < 0x500)
        {
          int v10 = 4;
        }

        else
        {
          unsigned int v9 = v5 >> 4;
          if (v5 >> 4 < 0x207)
          {
            int v10 = 5;
          }

          else
          {
            if (v9 < 0x20D)
            {
              int v10 = 6;
            }

            else
            {
              if (v5 >> 6 < 0xC1)
              {
                int v10 = 7;
              }

              else if (v5 >> 5 < 0x185)
              {
                int v10 = 8;
              }

              else if (v5 >> 8 < 0x31)
              {
                int v10 = 9;
              }

              else
              {
                if (v5 >> 6 < 0x27F)
                {
                  int v10 = 10;
                }

                else
                {
                  if (v9 < 0xD7B)
                  {
                    int v10 = 11;
                  }

                  else
                  {
                    int v10 = 12;
                  }
                }
              }
            }
          }
        }

        if (((0xFE3uLL >> v10) & 1) == 0)
        {
          int v8 = (*(uint64_t (**)(uint64_t))&dword_1000FA138[14 * v10 + 8])(v5);
LABEL_28:
          LODWORD(v5) = v8;
        }
      }

uint64_t sub_1000CD3EC(_WORD *a1, _WORD *a2, int a3)
{
  if (!a3) {
    return 0LL;
  }
  if (a1)
  {
    if (a2)
    {
      while (1)
      {
        unsigned int v3 = (unsigned __int16)*a1;
        unsigned int v4 = (unsigned __int16)*a2;
        if (!*a1) {
          break;
        }
        if (v3 != v4)
        {
          if (v3 < v4) {
            return 0xFFFFFFFFLL;
          }
          else {
            return 1LL;
          }
        }

        ++a1;
        ++a2;
        if (!--a3) {
          return 0LL;
        }
      }

      if (*a2) {
        return 0xFFFFFFFFLL;
      }
      else {
        return 0LL;
      }
    }

    else
    {
      return 1LL;
    }
  }

  else if (a2)
  {
    return 0xFFFFFFFFLL;
  }

  else
  {
    return 0LL;
  }

uint64_t sub_1000CD450(_WORD *a1, unsigned __int16 *a2, int a3)
{
  if (!a3) {
    return 0LL;
  }
  unsigned int v3 = a2;
  unsigned int v4 = a1;
  if (a1)
  {
    if (!a2) {
      return 1LL;
    }
    int v5 = a3;
    while (1)
    {
      uint64_t v6 = (unsigned __int16)*v4;
      uint64_t v7 = *v3;
      if (!*v4)
      {
        BOOL v18 = (_DWORD)v7 == 0;
        goto LABEL_137;
      }

      if (v6 < 0x100)
      {
        int v10 = sub_1000BF054(v6);
        goto LABEL_27;
      }

      if (v6 < 0x180)
      {
        int v9 = 2;
      }

      else
      {
        if (v6 < 0x400)
        {
          int v9 = 3;
        }

        else if (v6 < 0x500)
        {
          int v9 = 4;
        }

        else
        {
          unsigned int v8 = v6 >> 4;
          if (v6 >> 4 < 0x207)
          {
            int v9 = 5;
          }

          else
          {
            if (v8 < 0x20D)
            {
              int v9 = 6;
            }

            else
            {
              if (v6 >> 6 < 0xC1)
              {
                int v9 = 7;
              }

              else if (v6 >> 5 < 0x185)
              {
                int v9 = 8;
              }

              else if (v6 >> 8 < 0x31)
              {
                int v9 = 9;
              }

              else
              {
                if (v6 >> 6 < 0x27F)
                {
                  int v9 = 10;
                }

                else
                {
                  if (v8 < 0xD7B)
                  {
                    int v9 = 11;
                  }

                  else
                  {
                    int v9 = 12;
                  }
                }
              }
            }
          }
        }
      }

      if (((0xFE3uLL >> v9) & 1) == 0
        && (*(unsigned int (**)(void))&dword_1000FA138[14 * v9 + 6])((unsigned __int16)*v4))
      {
        if (v6 < 0x180)
        {
          int v12 = 2;
        }

        else if (v6 < 0x400)
        {
          int v12 = 3;
        }

        else if (v6 < 0x500)
        {
          int v12 = 4;
        }

        else
        {
          unsigned int v11 = v6 >> 4;
          if (v6 >> 4 < 0x207)
          {
            int v12 = 5;
          }

          else
          {
            if (v11 < 0x20D)
            {
              int v12 = 6;
            }

            else
            {
              if (v6 >> 6 < 0xC1)
              {
                int v12 = 7;
              }

              else if (v6 >> 5 < 0x185)
              {
                int v12 = 8;
              }

              else if (v6 >> 8 < 0x31)
              {
                int v12 = 9;
              }

              else
              {
                if (v6 >> 6 < 0x27F)
                {
                  int v12 = 10;
                }

                else
                {
                  if (v11 < 0xD7B)
                  {
                    int v12 = 11;
                  }

                  else
                  {
                    int v12 = 12;
                  }
                }
              }
            }
          }
        }

        if (((0xFE3uLL >> v12) & 1) == 0)
        {
          int v10 = (*(uint64_t (**)(uint64_t))&dword_1000FA138[14 * v12 + 8])(v6);
LABEL_27:
          LODWORD(v6) = v10;
        }
      }

unsigned __int16 *sub_1000CD9AC(unsigned __int16 *a1)
{
  if (a1)
  {
    unsigned __int16 v2 = *a1;
    if (*a1)
    {
      unsigned int v3 = a1 + 1;
      do
      {
        if (v2 < 0x100u)
        {
          unsigned __int16 v9 = sub_1000BF054(v2);
        }

        else
        {
          if (v2 < 0x180u)
          {
            int v8 = 2;
          }

          else
          {
            if (v2 < 0x370u) {
              goto LABEL_6;
            }
            if (v2 < 0x400u)
            {
              int v8 = 3;
            }

            else if (v2 < 0x500u)
            {
              int v8 = 4;
            }

            else
            {
              if (v2 < 0x2000u) {
                goto LABEL_6;
              }
              unsigned int v5 = v2 >> 4;
              if (v5 < 0x207)
              {
                int v8 = 5;
              }

              else
              {
                unsigned int v6 = v2 >> 5;
                if (v6 < 0x105) {
                  goto LABEL_6;
                }
                if (v5 < 0x20D)
                {
                  int v8 = 6;
                }

                else
                {
                  if (v2 < 0x3000u) {
                    goto LABEL_6;
                  }
                  unsigned int v7 = v2 >> 6;
                  if (v7 < 0xC1)
                  {
                    int v8 = 7;
                  }

                  else if (v6 < 0x185)
                  {
                    int v8 = 8;
                  }

                  else if (HIBYTE(v2) < 0x31u)
                  {
                    int v8 = 9;
                  }

                  else
                  {
                    if (v7 < 0x27F)
                    {
                      int v8 = 10;
                    }

                    else
                    {
                      if (v5 < 0xD7B)
                      {
                        int v8 = 11;
                      }

                      else
                      {
                        int v8 = 12;
                      }
                    }
                  }
                }
              }
            }
          }

          if (((0xFE3uLL >> v8) & 1) != 0
            || !(*(unsigned int (**)(void))&dword_1000FA138[14 * v8 + 6])(v2))
          {
            goto LABEL_6;
          }

          if (v2 < 0x180u)
          {
            int v13 = 2;
          }

          else
          {
            if (v2 < 0x370u) {
              goto LABEL_5;
            }
            if (v2 < 0x400u)
            {
              int v13 = 3;
            }

            else if (v2 < 0x500u)
            {
              int v13 = 4;
            }

            else
            {
              unsigned int v10 = v2 >> 4;
              if (v10 < 0x207)
              {
                int v13 = 5;
              }

              else
              {
                unsigned int v11 = v2 >> 5;
                if (v11 < 0x105) {
                  goto LABEL_5;
                }
                if (v10 < 0x20D)
                {
                  int v13 = 6;
                }

                else
                {
                  if (v2 < 0x3000u) {
                    goto LABEL_5;
                  }
                  unsigned int v12 = v2 >> 6;
                  if (v12 < 0xC1)
                  {
                    int v13 = 7;
                  }

                  else if (v11 < 0x185)
                  {
                    int v13 = 8;
                  }

                  else if (HIBYTE(v2) < 0x31u)
                  {
                    int v13 = 9;
                  }

                  else
                  {
                    if (v12 < 0x27F)
                    {
                      int v13 = 10;
                    }

                    else
                    {
                      if (v10 < 0xD7B)
                      {
                        int v13 = 11;
                      }

                      else
                      {
                        int v13 = 12;
                      }
                    }
                  }
                }
              }
            }
          }

          if (((0xFE3uLL >> v13) & 1) != 0) {
            goto LABEL_5;
          }
          unsigned __int16 v9 = (*(uint64_t (**)(void))&dword_1000FA138[14 * v13 + 8])(v2);
        }

        unsigned __int16 v2 = v9;
LABEL_5:
        *(v3 - 1) = v2;
LABEL_6:
        int v4 = *v3++;
        unsigned __int16 v2 = v4;
      }

      while (v4);
    }
  }

  return a1;
}

unint64_t sub_1000CDC84(char *a1, _WORD *a2)
{
  unsigned __int16 v2 = a1;
  while (1)
  {
    int v4 = v2;
    uint64_t v5 = *(unsigned __int16 *)v2;
    if (!*(_WORD *)v2) {
      break;
    }
    if (v5 > 0xFF)
    {
      if ((v5 - 0x2000) < 0xC)
      {
        int v3 = 1;
      }

      else
      {
        int v3 = 1;
        if (*(unsigned __int16 *)v2 >= 0x3000u)
        {
          if ((_DWORD)v5 != 12351 && (_DWORD)v5 != 12288)
          {
LABEL_15:
            v4 += 2;
            break;
          }
        }

        else if ((_DWORD)v5 != 8239 && (_DWORD)v5 != 8287)
        {
          goto LABEL_15;
        }
      }
    }

    else
    {
      if ((v5 & 0x80) != 0) {
        goto LABEL_15;
      }
      int v3 = (byte_1000F1D84[v5] >> 4) & 1;
    }

    v2 += 2;
    if (!v3) {
      goto LABEL_15;
    }
  }

  *a2 = v5;
  return (unint64_t)(v4 - a1) >> 1;
}

uint64_t sub_1000CDD20(uint64_t result)
{
  if ((result - 0x2000) <= 0x6F)
  {
    unsigned __int16 v1 = result;
    switch((int)result)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 47:
      case 95:
        uint64_t result = 32LL;
        break;
      case 12:
      case 13:
      case 14:
      case 15:
      case 22:
      case 23:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 48:
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
      case 61:
      case 62:
      case 63:
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
        return v1;
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
        uint64_t result = 45LL;
        break;
      case 24:
      case 25:
      case 26:
      case 27:
        uint64_t result = 39LL;
        break;
      case 28:
      case 29:
      case 30:
      case 31:
        uint64_t result = 34LL;
        break;
      default:
        return (unsigned __int16)result;
    }

    return result;
  }

  unsigned __int16 v1 = 32;
  if ((_DWORD)result == 12288 || (_DWORD)result == 12351) {
    return v1;
  }
  if ((unsigned __int16)(result + 155) > 0x3Au)
  {
    if ((unsigned __int16)(result + 96) <= 0x3Cu)
    {
      if ((_DWORD)result == 65440) {
        return 12644LL;
      }
      unsigned __int16 v2 = result + 12679;
      return v2;
    }

    if (result >= 0xFFE8)
    {
      if ((_DWORD)result == 65518) {
        return 9675LL;
      }
      if ((_DWORD)result == 65517) {
        return 9632LL;
      }
      unsigned __int16 v1 = result;
      if ((_DWORD)result == 65512) {
        return 9474LL;
      }
      return v1;
    }

    return (unsigned __int16)result;
  }

  unsigned __int16 v1 = result;
  switch((int)result)
  {
    case 65381:
      uint64_t result = 12539LL;
      break;
    case 65382:
      uint64_t result = 12530LL;
      break;
    case 65383:
    case 65384:
    case 65385:
    case 65386:
    case 65387:
    case 65388:
    case 65389:
    case 65390:
    case 65393:
    case 65394:
    case 65395:
    case 65396:
    case 65397:
    case 65398:
    case 65399:
    case 65400:
    case 65401:
    case 65402:
    case 65403:
    case 65404:
    case 65405:
    case 65406:
    case 65407:
    case 65408:
    case 65409:
    case 65410:
    case 65411:
    case 65412:
    case 65413:
    case 65414:
    case 65415:
    case 65416:
    case 65417:
    case 65418:
    case 65419:
    case 65420:
    case 65421:
    case 65422:
    case 65423:
    case 65424:
    case 65425:
    case 65426:
    case 65427:
    case 65430:
    case 65431:
    case 65432:
    case 65433:
    case 65434:
    case 65435:
      return v1;
    case 65391:
      uint64_t result = 12483LL;
      break;
    case 65392:
      uint64_t result = 12540LL;
      break;
    case 65428:
      uint64_t result = 12516LL;
      break;
    case 65429:
      uint64_t result = 12518LL;
      break;
    case 65436:
      uint64_t result = 12527LL;
      break;
    case 65437:
      uint64_t result = 12531LL;
      break;
    case 65438:
      uint64_t result = 12441LL;
      break;
    case 65439:
      uint64_t result = 12442LL;
      break;
    default:
      return (unsigned __int16)result;
  }

  return result;
}

uint64_t sub_1000CE164(_WORD *a1, int a2, _WORD *a3)
{
  uint64_t v3 = 0xFFFFFFFFLL;
  if (a2 >= 1)
  {
    int v4 = a3;
    if (a3)
    {
      if (a1 && *a1)
      {
        uint64_t v7 = 0LL;
        uint64_t v8 = 0LL;
        do
        {
          int v9 = (unsigned __int16)a1[v7 + 1];
          v8 += (uint64_t)&_mh_execute_header;
          ++v7;
        }

        while (v9);
        if ((int)((unint64_t)(v7 * 2) >> 1) < 1)
        {
          uint64_t v3 = 0LL;
        }

        else
        {
          uint64_t v3 = 0LL;
          uint64_t v10 = v8 >> 32;
          do
          {
            if (v3 < a2) {
              v4[v3] = sub_1000CDD20((unsigned __int16)a1[v3]);
            }
            ++v3;
          }

          while (v3 < v10);
        }

        v4 += v3;
      }

      else
      {
        uint64_t v3 = 0LL;
      }

      *int v4 = 0;
    }
  }

  return v3;
}

uint64_t sub_1000CE248(unsigned int a1)
{
  if (a1 >= 0x100) {
    return 0;
  }
  else {
    return a1;
  }
}

uint64_t sub_1000CE25C(_BYTE *a1, int a2, uint64_t a3)
{
  if (!a1 || ((LOBYTE(v3) = *a1) != 0 ? (BOOL v4 = a2 < 1) : (BOOL v4 = 1), v4))
  {
    LODWORD(v5) = 0;
  }

  else
  {
    unint64_t v5 = 0LL;
    do
    {
      *(_WORD *)(a3 + 2 * v5) = v3;
      int v3 = a1[++v5];
      if (v3) {
        BOOL v6 = v5 >= a2;
      }
      else {
        BOOL v6 = 1;
      }
    }

    while (!v6);
  }

  *(_WORD *)(a3 + 2LL * v5) = 0;
  return 1LL;
}

uint64_t sub_1000CE2BC(__int16 *a1, int a2, uint64_t a3)
{
  if (!a1 || ((__int16 v3 = *a1) != 0 ? (v4 = a2 < 1) : (v4 = 1), v4))
  {
    LODWORD(v5) = 0;
LABEL_8:
    if ((int)v5 >= a2)
    {
      return 1LL;
    }

    else
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a3 + v5) = 0;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    while (1)
    {
      if ((v3 & 0xFF00) != 0) {
        LOBYTE(v3) = 0;
      }
      if (!(_BYTE)v3) {
        break;
      }
      *(_BYTE *)(a3 + v7) = v3;
      unint64_t v5 = v7 + 1;
      __int16 v3 = a1[v7 + 1];
      if (v3) {
        BOOL v8 = v5 >= a2;
      }
      else {
        BOOL v8 = 1;
      }
      ++v7;
      if (v8) {
        goto LABEL_8;
      }
    }

    uint64_t result = 2LL;
    *(_BYTE *)(a3 + v7) = 0;
  }

  return result;
}

uint64_t sub_1000CE344(__int16 *a1, int a2, int a3, uint64_t a4)
{
  if (!a1 || ((__int16 v4 = *a1) != 0 ? (v5 = a2 < 1) : (v5 = 1), v5))
  {
    LODWORD(v6) = 0;
LABEL_8:
    if ((int)v6 >= a3)
    {
      return 1LL;
    }

    else
    {
      uint64_t result = 0LL;
      *(_BYTE *)(a4 + v6) = 0;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    while (1)
    {
      if ((v4 & 0xFF00) != 0) {
        LOBYTE(v4) = 0;
      }
      if (!(_BYTE)v4) {
        break;
      }
      *(_BYTE *)(a4 + v8) = v4;
      unint64_t v6 = v8 + 1;
      __int16 v4 = a1[v8 + 1];
      if (v4) {
        BOOL v9 = v6 >= a2;
      }
      else {
        BOOL v9 = 1;
      }
      ++v8;
      if (v9) {
        goto LABEL_8;
      }
    }

    uint64_t result = 2LL;
    *(_BYTE *)(a4 + v8) = 0;
  }

  return result;
}

uint64_t sub_1000CE3CC(_BYTE *a1, int a2, uint64_t a3)
{
  if (!a1 || ((int v3 = *a1, *a1) ? (v4 = a2 < 1) : (v4 = 1), v4))
  {
    LODWORD(v5) = 0;
LABEL_8:
    if ((int)v5 < a2)
    {
      *(_WORD *)(a3 + 2LL * v5) = 0;
      return 1LL;
    }
  }

  else
  {
    uint64_t v7 = 0LL;
    uint64_t v8 = a1 + 1;
    while (1)
    {
      uint64_t v9 = 0LL;
      switch(v3)
      {
        case 164:
          goto LABEL_19;
        case 166:
          uint64_t v9 = 1LL;
          goto LABEL_19;
        case 168:
          uint64_t v9 = 2LL;
          goto LABEL_19;
        case 180:
          uint64_t v9 = 3LL;
          goto LABEL_19;
        case 184:
          uint64_t v9 = 4LL;
          goto LABEL_19;
        case 188:
          uint64_t v9 = 5LL;
          goto LABEL_19;
        case 189:
          uint64_t v9 = 6LL;
          goto LABEL_19;
        case 190:
          uint64_t v9 = 7LL;
LABEL_19:
          int v3 = dword_1000F2510[2 * v9 + 1];
          break;
        default:
          LOWORD(v3) = v3;
          break;
      }

      if (!(_WORD)v3) {
        break;
      }
      *(_WORD *)(a3 + 2 * v7) = v3;
      unint64_t v5 = v7 + 1;
      int v3 = v8[v7];
      if (v8[v7]) {
        BOOL v10 = v5 >= a2;
      }
      else {
        BOOL v10 = 1;
      }
      ++v7;
      if (v10) {
        goto LABEL_8;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000CE4A8(_WORD *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    LOWORD(v3) = *a1;
    if (*a1 && a2 >= 1)
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = a1 + 1;
      uint64_t result = 2LL;
      while (1)
      {
        if ((unsigned __int16)v3 >= 0x100u)
        {
          switch((__int16)v3)
          {
            case 338:
              uint64_t v9 = 5LL;
              break;
            case 339:
              uint64_t v9 = 6LL;
              break;
            case 340:
            case 341:
            case 342:
            case 343:
            case 344:
            case 345:
            case 346:
            case 347:
            case 348:
            case 349:
            case 350:
            case 351:
            case 354:
            case 355:
            case 356:
            case 357:
            case 358:
            case 359:
            case 360:
            case 361:
            case 362:
            case 363:
            case 364:
            case 365:
            case 366:
            case 367:
            case 368:
            case 369:
            case 370:
            case 371:
            case 372:
            case 373:
            case 374:
            case 375:
            case 377:
            case 378:
            case 379:
            case 380:
              goto LABEL_10;
            case 352:
              uint64_t v9 = 1LL;
              break;
            case 353:
              uint64_t v9 = 2LL;
              break;
            case 376:
              uint64_t v9 = 7LL;
              break;
            case 381:
              uint64_t v9 = 3LL;
              break;
            case 382:
              uint64_t v9 = 4LL;
              break;
            default:
              uint64_t v9 = 0LL;
              break;
          }

          int v3 = dword_1000F2510[2 * v9];
          if (!(_BYTE)v3)
          {
LABEL_31:
            uint64_t result = 2LL;
            *(_BYTE *)(a3 + v6) = 0;
            return result;
          }
        }

        else if ((unsigned __int16)v3 - 164 <= 0x1A && ((1 << (v3 + 92)) & 0x7110015) != 0)
        {
          goto LABEL_31;
        }

        *(_BYTE *)(a3 + v6) = v3;
        unint64_t v5 = v6 + 1;
        LOWORD(v3) = v7[v6];
        if ((_WORD)v3) {
          BOOL v10 = v5 >= a2;
        }
        else {
          BOOL v10 = 1;
        }
        ++v6;
        if (v10) {
          goto LABEL_8;
        }
      }
    }
  }

  LODWORD(v5) = 0;
LABEL_8:
  uint64_t result = 0LL;
  uint64_t v6 = v5;
LABEL_10:
  *(_BYTE *)(a3 + v6) = 0;
  return result;
}

uint64_t sub_1000CE5D4(_WORD *a1, int a2, int a3, uint64_t a4)
{
  if (a1)
  {
    LOWORD(v4) = *a1;
    if (*a1 && a2 >= 1)
    {
      uint64_t v7 = 0LL;
      uint64_t v8 = a1 + 1;
      uint64_t result = 2LL;
      while (1)
      {
        if ((unsigned __int16)v4 >= 0x100u)
        {
          switch((__int16)v4)
          {
            case 338:
              uint64_t v10 = 5LL;
              break;
            case 339:
              uint64_t v10 = 6LL;
              break;
            case 340:
            case 341:
            case 342:
            case 343:
            case 344:
            case 345:
            case 346:
            case 347:
            case 348:
            case 349:
            case 350:
            case 351:
            case 354:
            case 355:
            case 356:
            case 357:
            case 358:
            case 359:
            case 360:
            case 361:
            case 362:
            case 363:
            case 364:
            case 365:
            case 366:
            case 367:
            case 368:
            case 369:
            case 370:
            case 371:
            case 372:
            case 373:
            case 374:
            case 375:
            case 377:
            case 378:
            case 379:
            case 380:
              goto LABEL_10;
            case 352:
              uint64_t v10 = 1LL;
              break;
            case 353:
              uint64_t v10 = 2LL;
              break;
            case 376:
              uint64_t v10 = 7LL;
              break;
            case 381:
              uint64_t v10 = 3LL;
              break;
            case 382:
              uint64_t v10 = 4LL;
              break;
            default:
              uint64_t v10 = 0LL;
              break;
          }

          int v4 = dword_1000F2510[2 * v10];
          if (!(_BYTE)v4)
          {
LABEL_31:
            uint64_t result = 2LL;
            *(_BYTE *)(a4 + v7) = 0;
            return result;
          }
        }

        else if ((unsigned __int16)v4 - 164 <= 0x1A && ((1 << (v4 + 92)) & 0x7110015) != 0)
        {
          goto LABEL_31;
        }

        *(_BYTE *)(a4 + v7) = v4;
        unint64_t v6 = v7 + 1;
        LOWORD(v4) = v8[v7];
        if ((_WORD)v4) {
          BOOL v11 = v6 >= a2;
        }
        else {
          BOOL v11 = 1;
        }
        ++v7;
        if (v11) {
          goto LABEL_8;
        }
      }
    }
  }

  LODWORD(v6) = 0;
LABEL_8:
  uint64_t result = 0LL;
  uint64_t v7 = (int)v6;
LABEL_10:
  *(_BYTE *)(a4 + v7) = 0;
  return result;
}

uint64_t sub_1000CE700(unsigned int a1)
{
  if (a1 <= 0x137) {
    return (a1 & 1) != 0;
  }
  if (a1 <= 0x148) {
    return (a1 & 1) == 0;
  }
  if (a1 <= 0x178) {
    return (a1 & 1) != 0;
  }
  uint64_t result = 1LL;
  if (a1 <= 0x17E && (a1 & 1) != 0) {
    return 0LL;
  }
  return result;
}

uint64_t sub_1000CE758(unsigned int a1)
{
  if (a1 > 0x137)
  {
    if (a1 > 0x148)
    {
      if (a1 > 0x178)
      {
        if (a1 <= 0x17E && (a1 & 1) != 0) {
          return 1LL;
        }
      }

      else if ((a1 & 1) == 0)
      {
        return 1LL;
      }
    }

    else if ((a1 & 1) != 0)
    {
      return 1LL;
    }
  }

  else if ((a1 & 1) == 0)
  {
    return 1LL;
  }

  return 0LL;
}

uint64_t sub_1000CE7B0(unsigned int a1)
{
  if (a1 > 0x12F)
  {
    if (a1 == 304)
    {
      return 105LL;
    }

    else
    {
      if (a1 == 376) {
        unsigned __int16 v3 = 255;
      }
      else {
        unsigned __int16 v3 = ((a1 - 377 < 6) & a1) + a1;
      }
      if ((a1 & 1) != 0) {
        unsigned __int16 v4 = a1;
      }
      else {
        unsigned __int16 v4 = a1 + 1;
      }
      if (a1 <= 0x177) {
        unsigned __int16 v3 = v4;
      }
      if (a1 <= 0x148) {
        unsigned __int16 v3 = (a1 & 1) + a1;
      }
      if ((a1 & 1) != 0) {
        unsigned __int16 v5 = a1;
      }
      else {
        unsigned __int16 v5 = a1 + 1;
      }
      if (a1 <= 0x137) {
        return v5;
      }
      return v3;
    }
  }

  else if ((a1 & 1) != 0)
  {
    return (unsigned __int16)a1;
  }

  else
  {
    return (unsigned __int16)(a1 + 1);
  }

uint64_t sub_1000CE834(unsigned int a1)
{
  if (a1 <= 0x130) {
    return a1 & 0xFFFE;
  }
  if (a1 == 305) {
    return 73LL;
  }
  if (a1 <= 0x138) {
    return a1 & 0xFFFE;
  }
  if (a1 <= 0x148) {
    return (unsigned __int16)(a1 + (a1 & 1) - 1);
  }
  if (a1 != 329 && a1 <= 0x177) {
    return a1 & 0xFFFE;
  }
  __int16 v3 = (a1 & 1) == 0 && a1 - 377 < 6;
  return (unsigned __int16)(a1 - v3);
}

uint64_t sub_1000CE8C4()
{
  return 1LL;
}

uint64_t sub_1000CE8CC(int a1)
{
  __int16 v1 = a1 - 880;
  if ((a1 - 880) > 0x20)
  {
    if ((a1 - 975) <= 0x12)
    {
      BOOL v4 = (a1 & 0xFFFE) == 0x3D0 || (v1 & 0xFFFD) == 101;
      int v5 = v1 & 0xFFF9;
      return v4 || v5 == 105 || (unsigned __int16)(a1 - 880) == 113;
    }

    unsigned int v8 = (unsigned __int16)(a1 - 880);
    if (v8 >= 0x80)
    {
      if (v8 == 136) {
        return 1LL;
      }
    }

    return 0LL;
  }

  char v3 = a1 - 113;
  uint64_t result = 1LL;
  if (((1 << v3) & 0x80000045) == 0) {
    return 0LL;
  }
  return result;
}

uint64_t sub_1000CE9C8(int a1)
{
  if ((a1 - 880) > 0x20)
  {
    if ((unsigned __int16)(a1 - 880) > 0x3Bu)
    {
      if ((a1 - 975) > 0x12)
      {
        unsigned int v4 = (0x809u >> (a1 + 12)) & 1;
        else {
          int v5 = 1;
        }
        else {
          unsigned int v6 = 0;
        }
        else {
          return v6;
        }
      }

      else
      {
        unsigned int v3 = (0x2AA21u >> (a1 + 49)) & 1;
        if ((a1 & 0xFFFE) == 0x3D2) {
          return 1LL;
        }
        else {
          return v3;
        }
      }
    }

    else
    {
      return (unsigned __int16)(a1 - 880) != 50;
    }
  }

  else
  {
    unsigned int v1 = (0xD4400045 >> (a1 - 112)) & 1;
    if ((a1 & 0xFFFE) == 0x388) {
      return 1LL;
    }
    else {
      return v1;
    }
  }

uint64_t sub_1000CEAA8(uint64_t result)
{
  if ((result - 880) <= 0x20)
  {
    switch((int)result)
    {
      case 880:
      case 882:
      case 886:
        uint64_t result = (unsigned __int16)(result + 1);
        break;
      case 902:
        uint64_t result = 940LL;
        break;
      case 904:
      case 905:
      case 906:
        uint64_t result = (unsigned __int16)(result + 37);
        break;
      case 908:
        uint64_t result = 972LL;
        break;
      case 910:
      case 911:
        uint64_t result = (unsigned __int16)(result + 63);
        break;
      default:
        return (unsigned __int16)result;
    }

    return result;
  }

  if ((unsigned __int16)(result - 880) > 0x3Bu)
  {
    unsigned int v1 = result - 975;
    if ((result - 975) > 0x12)
    {
      LOWORD(v2) = result - 1012;
      uint64_t v2 = (__int16)v2;
      unsigned int v3 = &unk_1000F2608;
    }

    else
    {
      if (v1 >= 0x12 || ((0x2AA39u >> (result + 49)) & 1) == 0) {
        return (unsigned __int16)result;
      }
      uint64_t v2 = (__int16)v1;
      unsigned int v3 = &unk_1000F25E4;
    }

    LOWORD(result) = v3[v2];
    return (unsigned __int16)result;
  }

  return (unsigned __int16)result;
}

uint64_t sub_1000CEBB4(uint64_t result)
{
  __int16 v1 = result - 881;
  return (unsigned __int16)result;
}

uint64_t sub_1000CECE4(int a1)
{
  int v2 = a1 - 884;
  uint64_t result = 0LL;
  switch(v2)
  {
    case 0:
    case 1:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 19:
    case 23:
    case 25:
    case 137:
    case 138:
    case 139:
      return result;
    default:
      return 1LL;
  }

  return result;
}

BOOL sub_1000CED2C(int a1)
{
  unsigned int v1 = (unsigned __int16)(a1 - 1024);
  if (v1 == 135) {
    return 0LL;
  }
  if (v1 <= 0x81) {
    return a1 & 1;
  }
  if (v1 < 0x8A) {
    return 0LL;
  }
  if (v1 <= 0xBF) {
    return a1 & 1;
  }
  if (v1 != 192 && v1 <= 0xCE) {
    return (a1 & 1) == 0;
  }
  if (v1 >= 0xD0) {
    return a1 & 1;
  }
  return v1 == 207;
}

BOOL sub_1000CEDBC(int a1)
{
  unsigned int v1 = (unsigned __int16)(a1 - 1024);
  if ((a1 - 1024) < 0x60)
  {
    unsigned int v1 = 7u >> (v1 >> 4);
    return v1 & 1;
  }

  if (v1 == 135) {
    return 0LL;
  }
  if (v1 <= 0x81) {
    return (a1 & 1) == 0;
  }
  if (v1 < 0x8A) {
    return 0LL;
  }
  if (v1 <= 0xBF) {
    return (a1 & 1) == 0;
  }
  if (v1 != 192 && v1 <= 0xCE) {
    return v1 & 1;
  }
  if (v1 >= 0xD0) {
    return (a1 & 1) == 0;
  }
  else {
    return v1 == 192;
  }
}

uint64_t sub_1000CEE48(uint64_t result)
{
  unsigned int v1 = (unsigned __int16)(result - 1024);
  if ((result - 1024) <= 0x5F)
  {
    unsigned int v2 = v1 >> 4;
    unsigned int v3 = v2 - 1;
    if (v2) {
      __int16 v4 = result;
    }
    else {
      __int16 v4 = result + 80;
    }
    if (v3 >= 2) {
      LOWORD(result) = v4;
    }
    else {
      LOWORD(result) = result + 32;
    }
    return (unsigned __int16)result;
  }

  if (v1 == 135) {
    return 1159LL;
  }
  if (v1 <= 0x81) {
    return (unsigned __int16)result | 1u;
  }
  if (v1 < 0x8A) {
    return (unsigned __int16)result;
  }
  if (v1 > 0xBF)
  {
    if (v1 != 192 && v1 <= 0xCE) {
      return (unsigned __int16)((result & 1) + result);
    }
    if ((result & 1) != 0) {
      __int16 v5 = result;
    }
    else {
      __int16 v5 = result + 1;
    }
    if (v1 >= 0xD0) {
      LOWORD(result) = v5;
    }
    else {
      LOWORD(result) = 1231;
    }
    return (unsigned __int16)result;
  }

  if ((result & 1) == 0) {
    LOWORD(result) = result + 1;
  }
  return (unsigned __int16)result;
}

uint64_t sub_1000CEF04(uint64_t result)
{
  if ((result - 1024) > 0x5F)
  {
    if ((unsigned __int16)(result - 1024) >= 0x8Au)
    {
      unsigned int v4 = (unsigned __int16)(result - 1024);
      if (v4 != 192 && v4 <= 0xCE) {
        return (unsigned __int16)(result + (result & 1) - 1);
      }
      if (v4 <= 0xCF) {
        LOWORD(result) = 1216;
      }
      else {
        LOWORD(result) = result & 0xFFFE;
      }
    }

    return (unsigned __int16)result;
  }

  else
  {
    int v1 = (unsigned __int16)(result - 1024) >> 4;
    unsigned int v2 = v1 - 3;
    if (v1 == 5) {
      __int16 v3 = result - 80;
    }
    else {
      __int16 v3 = result;
    }
    if (v2 >= 2) {
      LOWORD(result) = v3;
    }
    else {
      LOWORD(result) = result - 32;
    }
    return (unsigned __int16)result;
  }

BOOL sub_1000CEFC4(unsigned int a1)
{
  return a1 < 0x482 || a1 - 1162 < 0x76 || a1 - 1155 < 5;
}

uint64_t sub_1000CEFE4()
{
  return 0LL;
}

BOOL sub_1000CEFEC(int a1)
{
  return (a1 - 12293) < 2;
}

BOOL sub_1000CF000(int a1)
{
  return (a1 - 12439) >= 2 && a1 != 12352;
}

BOOL sub_1000CF020(int a1)
{
  return a1 != 12539 && a1 != 12448;
}

BOOL sub_1000CF038(unsigned int a1)
{
  return a1 < 0x9FBC;
}

BOOL sub_1000CF048(unsigned int a1)
{
  return a1 < 0xD7A4;
}

BOOL sub_1000CF058(__int16 a1)
{
  return (unsigned __int16)(a1 + 191) < 0x1Au;
}

BOOL sub_1000CF06C(__int16 a1)
{
  return (unsigned __int16)(a1 + 223) < 0x1Au;
}

uint64_t sub_1000CF080(unsigned __int16 a1)
{
  else {
    return (unsigned __int16)(a1 + 32);
  }
}

uint64_t sub_1000CF09C(unsigned __int16 a1)
{
  else {
    return (unsigned __int16)(a1 - 32);
  }
}

BOOL sub_1000CF0B8(__int16 a1)
{
  if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x1E003A001A001ALL, (uint16x4_t)vadd_s16( vdup_n_s16(a1),  (int16x4_t)0x5F009A00DF00BFLL))) & 1) != 0) {
    return 1LL;
  }
  return (unsigned __int16)(a1 + 62) < 0x1Bu && (unsigned __int16)(a1 + 54) < 0xFFFEu && (a1 & 0xFFF6) != 65488;
}

uint64_t sub_1000CF11C(char *a1, _DWORD *a2)
{
  __int16 v3 = a1;
  unsigned __int16 v12 = 0;
  if (a2) {
    *a2 = 0;
  }
  int v4 = *a1;
  if (!*a1)
  {
    int v5 = 0;
LABEL_26:
    if (a2) {
      *a2 = v5;
    }
    return 1LL;
  }

  int v5 = 0;
  while (1)
  {
    if ((v4 & 0x80) == 0)
    {
      unsigned int v6 = 1;
      goto LABEL_18;
    }

    uint64_t result = 0LL;
    if (v4 == 255 || (v4 & 0xC0) == 0x80LL) {
      return result;
    }
    unsigned int v6 = byte_1000F268F[v4];
    if ((v4 & 0xC0) == 0xC0LL) {
      break;
    }
LABEL_17:
    if ((~(_BYTE)v4 & 0xF0) == 0) {
      return 0LL;
    }
LABEL_18:
    sub_1000CF26C(v3, &v12);
    if (v6 == 2 && v12 < 0x80u) {
      return 0LL;
    }
    if (v6 == 3 && v12 < 0x800u) {
      return 0LL;
    }
    v3 += v6;
    ++v5;
    int v4 = *v3;
    if (!*v3) {
      goto LABEL_26;
    }
  }

  if (v6 <= 2) {
    uint64_t v8 = 2LL;
  }
  else {
    uint64_t v8 = byte_1000F268F[v4];
  }
  uint64_t v9 = v8 - 1;
  uint64_t v10 = v3 + 1;
  while (1)
  {
    char v11 = *v10++;
    if ((v11 & 0xC0) != 0x80) {
      return 0LL;
    }
    if (!--v9) {
      goto LABEL_17;
    }
  }

uint64_t sub_1000CF26C(char *a1, _WORD *a2)
{
  *a2 = 0;
  uint64_t v2 = *a1;
  if (!*a1) {
    return 0LL;
  }
  char v3 = *a1;
  uint64_t v4 = byte_1000F268F[v2];
  char v19 = *a1;
  if (((char)v2 & 0x80000000) == 0)
  {
LABEL_3:
    __int16 v5 = v3;
    uint64_t v4 = 1LL;
LABEL_4:
    *a2 = v5;
    return v4;
  }

  uint64_t v6 = 0xFFFFFFFFLL;
  if ((char)v2 != -1)
  {
    uint64_t v8 = v2 & 0xC0;
    if (v8 != 128)
    {
      if (v8 != 192)
      {
        uint64_t v9 = 1LL;
LABEL_18:
        int v14 = &v19;
        v20[v9 - 1] = 0;
        __int16 v5 = 0;
        switch((int)v4)
        {
          case 1:
            char v3 = v19;
            goto LABEL_3;
          case 2:
            int v14 = v20;
            __int16 v5 = v19 & 0x1F;
            break;
          case 3:
            int v14 = v20;
            __int16 v5 = v19 & 0xF;
            break;
          case 4:
            int v14 = v20;
            __int16 v5 = v19 & 7;
            break;
          case 5:
            int v14 = v20;
            __int16 v5 = v19 & 3;
            break;
          case 6:
            int v14 = v20;
            __int16 v5 = v19 & 1;
            break;
          case 7:
            break;
          default:
            return 0xFFFFFFFFLL;
        }

        char v17 = *v14;
        int v15 = (unsigned __int8 *)(v14 + 1);
        char v16 = v17;
        do
        {
          __int16 v5 = v16 & 0x3F | (v5 << 6);
          int v18 = *v15++;
          char v16 = v18;
        }

        while (v18);
        goto LABEL_4;
      }

      else {
        uint64_t v9 = v4;
      }
      uint64_t v10 = v9 - 1;
      char v11 = v20;
      unsigned __int16 v12 = a1 + 1;
      while (1)
      {
        char v13 = *v12++;
        *char v11 = v13;
        if ((v13 & 0xC0) != 0x80) {
          return 0xFFFFFFFFLL;
        }
        ++v11;
        if (!--v10) {
          goto LABEL_18;
        }
      }
    }
  }

  return v6;
}

uint64_t sub_1000CF40C(char *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    __int16 v5 = a1;
    unsigned __int16 v18 = 0;
    int v6 = *a1;
    if (*a1)
    {
      int v7 = *a1;
      uint64_t v8 = a1;
      while (1)
      {
        if ((v7 & 0x80) != 0)
        {
          if (v7 == 255 || (v7 & 0xC0) == 0x80LL) {
            return 0LL;
          }
          unsigned int v9 = byte_1000F268F[v7];
          if ((v7 & 0xC0) == 0xC0LL)
          {
            if (v9 <= 2) {
              uint64_t v10 = 2LL;
            }
            else {
              uint64_t v10 = byte_1000F268F[v7];
            }
            uint64_t v11 = v10 - 1;
            unsigned __int16 v12 = v8 + 1;
            do
            {
              char v13 = *v12++;
              if ((v13 & 0xC0) != 0x80) {
                return 0LL;
              }
            }

            while (--v11);
          }

          if ((~(_BYTE)v7 & 0xF0) == 0) {
            return 0LL;
          }
        }

        else
        {
          unsigned int v9 = 1;
        }

        sub_1000CF26C(v8, &v18);
        if (v9 == 2 && v18 < 0x80u || v9 == 3 && v18 < 0x800u) {
          return 0LL;
        }
        v8 += v9;
        int v7 = *v8;
        if (!*v8)
        {
          int v14 = 0;
          if (v6)
          {
            do
            {
              __int16 v17 = 0;
              int v16 = sub_1000CF26C(v5, &v17);
              if (v14 < a2) {
                *(_WORD *)(a3 + 2LL * v14++) = v17;
              }
              v5 += v16;
            }

            while (*v5);
          }

          goto LABEL_23;
        }
      }
    }
  }

  int v14 = 0;
LABEL_23:
  if (v14 >= a2) {
    return 0LL;
  }
  *(_WORD *)(a3 + 2LL * v14) = 0;
  return 1LL;
}

uint64_t sub_1000CF578(uint64_t result, _BYTE *a2)
{
  if ((_DWORD)result)
  {
    if (result > 0x7F)
    {
      if (result > 0x7FF)
      {
        *a2 = (result >> 12) | 0xE0;
        a2[1] = (result >> 6) & 0x3F | 0x80;
        a2[2] = result & 0x3F | 0x80;
        return 3LL;
      }

      else
      {
        *a2 = (result >> 6) | 0xC0;
        a2[1] = result & 0x3F | 0x80;
        return 2LL;
      }
    }

    else
    {
      *a2 = result;
      return 1LL;
    }
  }

  return result;
}

uint64_t sub_1000CF5E4(_WORD *a1, int a2, int a3, uint64_t a4)
{
  int v6 = 0;
  if (a1 && a3 >= 1)
  {
    unsigned int v7 = (unsigned __int16)*a1;
    if (*a1 && a2 >= 1)
    {
      unsigned int v9 = 0;
      uint64_t v10 = &a1[a2];
      uint64_t v11 = a1 + 1;
      do
      {
        if (v7 > 0x7F)
        {
          if (v7 > 0x7FF)
          {
            char __src = (v7 >> 12) | 0xE0;
            char v16 = (v7 >> 6) & 0x3F | 0x80;
            char v17 = v7 & 0x3F | 0x80;
            unsigned int v12 = 3;
            int v6 = v9 + 3;
          }

          else
          {
            char __src = (v7 >> 6) | 0xC0;
            char v16 = v7 & 0x3F | 0x80;
            unsigned int v12 = 2;
            int v6 = v9 + 2;
          }
        }

        else
        {
          char __src = v7;
          unsigned int v12 = 1;
          int v6 = v9 + 1;
        }

        memcpy((void *)(a4 + v9), &__src, v12);
        unsigned int v7 = (unsigned __int16)*v11;
        if (!*v11) {
          break;
        }
        unsigned int v9 = v6;
      }

      while (v11++ < v10);
    }
  }

  if (v6 >= a3) {
    return 1LL;
  }
  uint64_t result = 0LL;
  *(_BYTE *)(a4 + v6) = 0;
  return result;
}

uint64_t sub_1000CF720(_WORD *a1, int a2, uint64_t a3)
{
  if (a1)
  {
    unsigned int v5 = (unsigned __int16)*a1;
    if (*a1)
    {
      unsigned int v6 = 0;
      unsigned int v7 = a1 + 1;
      while (1)
      {
        if (v5 > 0x7F)
        {
          if (v5 > 0x7FF)
          {
            char __src = (v5 >> 12) | 0xE0;
            char v13 = (v5 >> 6) & 0x3F | 0x80;
            char v14 = v5 & 0x3F | 0x80;
            unsigned int v9 = 3;
            int v10 = v6 + 3;
            if ((int)(v6 + 3) < a2) {
LABEL_12:
            }
              memcpy((void *)(a3 + v6), &__src, v9);
          }

          else
          {
            char __src = (v5 >> 6) | 0xC0;
            char v13 = v5 & 0x3F | 0x80;
            unsigned int v9 = 2;
            int v10 = v6 + 2;
          }
        }

        else
        {
          char __src = v5;
          unsigned int v9 = 1;
          int v10 = v6 + 1;
        }

        unsigned int v8 = *v7++;
        unsigned int v5 = v8;
        unsigned int v6 = v10;
        if (!v8) {
          goto LABEL_14;
        }
      }
    }

    int v10 = 0;
    if (a2 <= 0) {
      return 1LL;
    }
LABEL_15:
    uint64_t result = 0LL;
    *(_BYTE *)(a3 + v10) = 0;
    return result;
  }

  int v10 = 0;
LABEL_14:
  if (v10 < a2) {
    goto LABEL_15;
  }
  return 1LL;
}

uint64_t sub_1000CF848(char *__str, size_t __size, const char *a3, va_list a4)
{
  uint64_t result = 0xFFFFFFFFLL;
  if (__str)
  {
    int v6 = __size;
    if ((int)__size >= 1)
    {
      uint64_t result = vsnprintf(__str, __size, a3, a4);
      uint64_t v7 = (int)result >= v6 ? 0xFFFFFFFFLL : result;
      if ((v7 & 0x80000000) != 0)
      {
        else {
          strcpy(&__str[v6 - 10], aTruncated);
        }
        return v7;
      }
    }
  }

  return result;
}

void *sub_1000CF8F8(void *a1, uint64_t a2, void *a3)
{
  char v3 = off_100102A00;
  if (a3) {
    *a3 = qword_100102A08;
  }
  off_100102A00 = a1;
  qword_100102A08 = a2;
  return v3;
}

BOOL sub_1000CF924()
{
  return off_100102A00 && off_100102A00(qword_100102A08);
}

uint64_t *sub_1000CF960(int a1, int a2)
{
  uint64_t v4 = (uint64_t *)sub_1000C1074(56LL);
  unsigned int v5 = v4;
  if (!v4) {
    return v5;
  }
  *((_DWORD *)v4 + 1) = a1;
  *((_DWORD *)v4 + 2) = a2;
  uint64_t v6 = qword_1000FDCC0;
  if (!qword_1000FDCC0)
  {
    int v13 = 0;
    *((_DWORD *)v4 + 5) = 0;
    goto LABEL_17;
  }

  int v7 = *(_DWORD *)(qword_1000FDCC0 + 2868);
  *((_DWORD *)v4 + 5) = v7;
  if (!v7)
  {
    int v13 = *(_DWORD *)(v6 + 2816);
LABEL_17:
    *((_DWORD *)v4 + 3) = v13;
    if (a2 >= 0) {
      int v14 = a2;
    }
    else {
      int v14 = a2 + 1;
    }
    int v11 = v14 >> 1;
    *(_DWORD *)uint64_t v4 = 0;
    uint64_t v15 = sub_1000C1074(4LL * (v14 >> 1));
    v5[3] = v15;
    if (!v15) {
      goto LABEL_25;
    }
    goto LABEL_21;
  }

  else {
    int v8 = 4800;
  }
  if (a1 == 8000) {
    int v9 = 3490;
  }
  else {
    int v9 = v8;
  }
  *((_DWORD *)v4 + 4) = v9;
  if (a2 >= 0) {
    int v10 = a2;
  }
  else {
    int v10 = a2 + 1;
  }
  int v11 = (v10 >> 1) + 1;
  *(_DWORD *)uint64_t v4 = 7;
  uint64_t v12 = sub_1000C1074(4LL * v11);
  v5[3] = v12;
  if (!v12) {
    goto LABEL_25;
  }
LABEL_21:
  uint64_t v16 = 2LL * v11;
  uint64_t v17 = sub_1000C1074(v16);
  v5[4] = v17;
  if (v17)
  {
    uint64_t v18 = sub_1000C1074(v16);
    v5[5] = v18;
    if (v18)
    {
      uint64_t v19 = sub_1000C1074(v16);
      v5[6] = v19;
      if (v19) {
        return v5;
      }
    }
  }

uint64_t sub_1000CFAD0(uint64_t result)
{
  if (result)
  {
    int v1 = (uint64_t *)result;
    sub_1000C0EF8(*(void *)(result + 48));
    sub_1000C0EF8(v1[5]);
    sub_1000C0EF8(v1[4]);
    sub_1000C0EF8(v1[3]);
    return sub_1000C0EF8((uint64_t)v1);
  }

  return result;
}

uint64_t sub_1000CFB18(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 20)) {
    return 2LL;
  }
  int v1 = *(_DWORD *)(a1 + 4);
  else {
    unsigned int v2 = 15;
  }
  if (v1 == 8000) {
    return 15LL;
  }
  else {
    return v2;
  }
}

uint64_t sub_1000CFB50(uint64_t result, int a2)
{
  if (*(_DWORD *)(result + 20))
  {
    int v2 = *(_DWORD *)(result + 4);
    if (v2 == 8000)
    {
      int v3 = word_1000F2790[a2];
    }

    else if ((v2 - 10000) > 0x41A)
    {
      int v3 = v2 / 4;
    }

    else
    {
      int v3 = word_1000F27B0[a2];
    }

    *(_DWORD *)(result + 12) = v3;
    int v21 = *(_DWORD *)(result + 16);
    if (v21 >= 0) {
      int v22 = *(_DWORD *)(result + 16);
    }
    else {
      int v22 = v21 + 1;
    }
    int v23 = *(_DWORD *)(result + 8);
    int v24 = (v2 + v23 * v21 - 1) / v2;
    int v25 = v2 + (v2 < 0);
    if (v24 >= 1)
    {
      uint64_t v26 = 0LL;
      unsigned int v27 = 0;
      do
      {
        *(_WORD *)(*(void *)(result + 32) + v26) = v27 >> 12;
        *(_WORD *)(*(void *)(result + 48) + v26) = v27 - (*(_WORD *)(*(void *)(result + 32) + v26) << 12);
        *(_WORD *)(*(void *)(result + 40) + v26) = 4096 - *(_WORD *)(*(void *)(result + 48) + v26);
        v27 += ((v22 >> 1) + (v3 << 12)) / v21;
        v26 += 2LL;
      }

      while (2LL * v24 != v26);
      int v23 = *(_DWORD *)(result + 8);
    }

    if (v23 >= 0) {
      int v28 = v23;
    }
    else {
      int v28 = v23 + 1;
    }
    int v29 = v28 >> 1;
    if (v24 >= v29)
    {
      uint64_t v41 = v29;
    }

    else
    {
      int v30 = v25 >> 1;
      int v31 = (v30 - v3) << 12;
      uint64_t v32 = v24;
      int v33 = v31 / (v30 - v21);
      do
      {
        int v34 = *(_DWORD *)(result + 4);
        int v35 = v34 * v32 - *(_DWORD *)(result + 16) * v23;
        int v36 = (v23 * *(_DWORD *)(result + 12)) << 12;
        if (v34 >= 0) {
          int v37 = *(_DWORD *)(result + 4);
        }
        else {
          int v37 = v34 + 1;
        }
        unsigned int v38 = (v36 + (v37 >> 1) + v35 * v33) / v34;
        uint64_t v39 = 2 * v32;
        *(_WORD *)(*(void *)(result + 32) + v39) = v38 >> 12;
        *(_WORD *)(*(void *)(result + 48) + v39) = v38 - (*(_WORD *)(*(void *)(result + 32) + 2 * v32) << 12);
        *(_WORD *)(*(void *)(result + 40) + v39) = 4096 - *(_WORD *)(*(void *)(result + 48) + 2 * v32++);
        int v23 = *(_DWORD *)(result + 8);
        if (v23 >= 0) {
          int v40 = *(_DWORD *)(result + 8);
        }
        else {
          int v40 = v23 + 1;
        }
        uint64_t v41 = (uint64_t)v40 >> 1;
      }

      while (v32 < v41);
      int v29 = v40 >> 1;
    }

    *(_WORD *)(*(void *)(result + 32) + 2 * v41) = v29 - 1;
    *(_WORD *)(*(void *)(result + 48) + 2LL * (*(_DWORD *)(result + 8) / 2)) = 4096;
    int v20 = *(_DWORD *)(result + 8) / 2;
    goto LABEL_46;
  }

  int v4 = word_1000F27D0[a2 + 2];
  int v5 = *(_DWORD *)(result + 8);
  int v6 = *(_DWORD *)(result + 12) * v5 / *(_DWORD *)(result + 4);
  LODWORD(v7) = (v6 * v4 + 2048) >> 12;
  if (v5 >= 0) {
    int v8 = *(_DWORD *)(result + 8);
  }
  else {
    int v8 = v5 + 1;
  }
  int v9 = v8 >> 1;
  int v10 = v8 >> 1;
  if (v8 >> 1 >= (int)v7)
  {
    int v12 = (v6 * v4 + 2048) >> 12;
    int v11 = ((v9 - (int)v7) << 12) / (v9 - v6);
  }

  else
  {
    int v11 = 4096;
    int v12 = v8 >> 1;
    int v6 = (v9 << 12) / v4;
    if (v9 < 1) {
      goto LABEL_16;
    }
  }

  uint64_t v13 = 0LL;
  int v14 = 0;
  do
  {
    *(_WORD *)(*(void *)(result + 32) + v13) = (v14 / v4) >> 12;
    *(_WORD *)(*(void *)(result + 48) + v13) = v14 / v4 - (*(_WORD *)(*(void *)(result + 32) + v13) << 12);
    *(_WORD *)(*(void *)(result + 40) + v13) = 4096 - *(_WORD *)(*(void *)(result + 48) + v13);
    v14 += 0x1000000;
    v13 += 2LL;
  }

  while (2LL * v12 != v13);
  int v10 = *(_DWORD *)(result + 8) / 2;
LABEL_16:
  int v15 = v10 - 1;
  if (v12 < v10 - 1)
  {
    int v16 = 0;
    int v17 = v6 << 12;
    uint64_t v7 = (int)v7;
    do
    {
      unsigned int v18 = v16 / v11 + v17;
      uint64_t v19 = 2 * v7;
      *(_WORD *)(*(void *)(result + 32) + v19) = v18 >> 12;
      *(_WORD *)(*(void *)(result + 48) + v19) = v18 - (*(_WORD *)(*(void *)(result + 32) + 2 * v7) << 12);
      *(_WORD *)(*(void *)(result + 40) + v19) = 4096 - *(_WORD *)(*(void *)(result + 48) + 2 * v7++);
      int v10 = *(_DWORD *)(result + 8) / 2;
      int v15 = v10 - 1;
      v16 += 0x1000000;
    }

    while (v7 < v10 - 1);
  }

  if (v12 < v10)
  {
    *(_WORD *)(*(void *)(result + 32) + 2LL * v15) = v10 - 2;
    *(_WORD *)(*(void *)(result + 48) + 2LL * (*(_DWORD *)(result + 8) / 2 - 1)) = 4096;
    int v20 = *(_DWORD *)(result + 8) / 2 - 1;
LABEL_46:
    *(_WORD *)(*(void *)(result + 40) + 2LL * v20) = 0;
  }

  *(_DWORD *)uint64_t result = a2;
  return result;
}

char *sub_1000CFEEC(char *result, char *__dst)
{
  int v2 = *(_DWORD *)result;
  if (*((_DWORD *)result + 5))
  {
    if (v2 == 7) {
      return result;
    }
    int v3 = (const void **)(result + 24);
    int v4 = *((_DWORD *)result + 2);
    if (v4 >= 0) {
      int v5 = *((_DWORD *)result + 2);
    }
    else {
      int v5 = v4 + 1;
    }
    int v6 = v5 >> 1;
    int v7 = (v5 >> 1) + 1;
    if (v4 >= -1)
    {
      int v8 = (int *)*((void *)result + 3);
      int v9 = (unsigned __int16 *)*((void *)result + 4);
      int v10 = v6 + 2;
      int v11 = (__int16 *)*((void *)result + 5);
      int v12 = (__int16 *)*((void *)result + 6);
      do
      {
        int v14 = (int *)&__dst[4 * *v9];
        int v16 = *v14;
        int v15 = v14[1];
        int v17 = *v11;
        if (v16 >= 0x80000 || v15 >= 0x80000) {
          int v13 = (v16 >> 12) * v17 + (v15 >> 12) * *v12;
        }
        else {
          int v13 = (v15 * *v12 + v16 * v17 + 2048) >> 12;
        }
        *v8++ = v13;
        ++v12;
        ++v11;
        ++v9;
        --v10;
      }

      while (v10 > 1);
    }
  }

  else
  {
    if (!v2) {
      return result;
    }
    int v3 = (const void **)(result + 24);
    int v18 = *((_DWORD *)result + 2);
    if (v18 >= 0) {
      int v19 = *((_DWORD *)result + 2);
    }
    else {
      int v19 = v18 + 1;
    }
    int v7 = v19 >> 1;
    if (v18 >= 2)
    {
      int v20 = (int *)*((void *)result + 3);
      int v21 = (unsigned __int16 *)*((void *)result + 4);
      int v22 = v7 + 1;
      int v23 = (__int16 *)*((void *)result + 5);
      int v24 = (__int16 *)*((void *)result + 6);
      do
      {
        int v26 = *v23++;
        int v25 = v26;
        int v27 = *v21++;
        int v28 = &__dst[4 * v27];
        int v29 = *v24++;
        *v20++ = (*((_DWORD *)v28 + 1) * v29 + *(_DWORD *)v28 * v25 + 2048) >> 12;
        --v22;
      }

      while (v22 > 1);
    }
  }

  return (char *)j__memmove(__dst, *v3, 4LL * v7);
}

uint64_t sub_1000D0010(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v16 = sub_1000C1074(144LL);
  uint64_t v17 = v16;
  if (!v16) {
    return v17;
  }
  *(_DWORD *)(v16 + 56) = 0;
  *(_WORD *)(v16 + 60) = 0;
  *(_WORD *)(v16 + 84) = -1;
  *(void *)(v16 + 88) = a1;
  *(void *)(v16 + 96) = a2;
  *(_DWORD *)(v16 + 76) = a5;
  *(_DWORD *)(v16 + 80) = a4;
  *(_DWORD *)(v16 + 124) = a8;
  uint64_t v18 = qword_1000FDCC0;
  if (qword_1000FDCC0)
  {
    *(_DWORD *)(v16 + 136) = *(_DWORD *)(qword_1000FDCC0 + 5576);
    *(_DWORD *)(v16 + 72) = a3;
    *(_DWORD *)(v16 + 116) = a6;
    if (*(_DWORD *)(v18 + 5540)) {
      a7 = 0;
    }
    *(_DWORD *)(v16 + 68) = a7;
    *(void *)(v16 + 48) = 0LL;
    if (!a4) {
      return v17;
    }
  }

  else
  {
    *(_DWORD *)(v16 + 136) = 0;
    *(_DWORD *)(v16 + 68) = a7;
    *(_DWORD *)(v16 + 72) = a3;
    *(_DWORD *)(v16 + 116) = a6;
    *(void *)(v16 + 48) = 0LL;
    if (!a4) {
      return v17;
    }
  }

  uint64_t v19 = sub_1000C1074(16LL * a4);
  *(void *)(v17 + 48) = v19;
  if (!v19)
  {
    sub_1000D0174(v17);
    return 0LL;
  }

  if (a4 >= 1)
  {
    if (a4 == 1)
    {
      uint64_t v20 = 0LL;
    }

    else
    {
      uint64_t v20 = a4 & 0xFFFFFFFE;
      uint64_t v21 = v19 + 16;
      uint64_t v22 = v20;
      do
      {
        *(void *)(v21 - 16) = 0LL;
        *(void *)uint64_t v21 = 0LL;
        *(_DWORD *)(v21 - 8) = 0;
        *(_DWORD *)(v21 + 8) = 0;
        v21 += 32LL;
        v22 -= 2LL;
      }

      while (v22);
      if (v20 == a4) {
        return v17;
      }
    }

    uint64_t v23 = a4 - v20;
    int v24 = (_DWORD *)(v19 + 16 * v20 + 8);
    do
    {
      *((void *)v24 - 1) = 0LL;
      *int v24 = 0;
      v24 += 4;
      --v23;
    }

    while (v23);
  }

  return v17;
}

uint64_t sub_1000D0174(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_10009C54C(*(void *)(result + 128));
    uint64_t v2 = *(void *)v1;
    if (*(void *)v1)
    {
      if (*(int *)(v1 + 8) >= 1)
      {
        uint64_t v3 = 0LL;
        do
          sub_1000C0EF8(*(void *)(*(void *)v1 + 8 * v3++));
        while (v3 < *(int *)(v1 + 8));
        uint64_t v2 = *(void *)v1;
      }

      sub_1000C0EF8(v2);
    }

    uint64_t v4 = *(void *)(v1 + 32);
    if (v4)
    {
      if (*(int *)(v1 + 40) >= 1)
      {
        uint64_t v5 = 0LL;
        do
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 32) + 8 * v5++));
        while (v5 < *(int *)(v1 + 40));
        uint64_t v4 = *(void *)(v1 + 32);
      }

      sub_1000C0EF8(v4);
    }

    uint64_t v6 = *(void *)(v1 + 16);
    if (v6)
    {
      if (*(int *)(v1 + 24) >= 1)
      {
        uint64_t v7 = 0LL;
        do
          sub_1000C0EF8(*(void *)(*(void *)(v1 + 16) + 8 * v7++));
        while (v7 < *(int *)(v1 + 24));
        uint64_t v6 = *(void *)(v1 + 16);
      }

      sub_1000C0EF8(v6);
    }

    sub_1000C0EF8(*(void *)(v1 + 48));
    return sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t sub_1000D0260(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 68);
  signed int v3 = *(_DWORD *)(a1 + 56);
  if (v2)
  {
    if (v3 < 1)
    {
      unsigned int v5 = -1;
    }

    else
    {
      signed int v4 = 0;
      unsigned int v5 = -1;
      do
      {
        unsigned int v5 = sub_1000BE644( *(unsigned __int16 *)(*(void *)(*(void *)(a1 + 32) + 8LL * (v4 >> 8))
                                   + 2LL * v4),
               2,
               v5);
        ++v4;
        signed int v3 = *(_DWORD *)(a1 + 56);
      }

      while (v4 < v3);
    }

    goto LABEL_11;
  }

  if (v3 >= 1)
  {
    signed int v6 = 0;
    unsigned int v5 = -1;
    do
    {
      uint64_t v7 = (unsigned __int16 *)(*(void *)(*(void *)a1 + 8LL * (v6 >> 8)) + 8LL * v6);
      unsigned int v8 = sub_1000BE644(*v7, 2, v5);
      unsigned int v9 = sub_1000BE644((__int16)v7[1], 2, v8);
      unsigned int v5 = sub_1000BE644((__int16)v7[2], 2, v9);
      ++v6;
      signed int v3 = *(_DWORD *)(a1 + 56);
    }

    while (v6 < v3);
LABEL_11:
    goto LABEL_12;
  }

  unsigned int v5 = -1;
LABEL_12:
  uint64_t v10 = 0LL;
  uint64_t v11 = 0LL;
  do
  {
    unsigned int v12 = sub_1000BE644(*(_DWORD *)(*(void *)(a1 + 48) + v10), 4, v5);
    unsigned int v13 = sub_1000BE644(*(_DWORD *)(*(void *)(a1 + 48) + v10 + 4), 4, v12);
    unsigned int v5 = sub_1000BE644(*(_DWORD *)(*(void *)(a1 + 48) + v10 + 12), 4, v13);
    ++v11;
    v10 += 16LL;
  }

  while (v11 < *(__int16 *)(a1 + 60));
  signed int v3 = *(_DWORD *)(a1 + 56);
LABEL_15:
  unsigned int v14 = sub_1000BE644(v3, 4, v5);
  unsigned int v15 = sub_1000BE644(*(__int16 *)(a1 + 60), 2, v14);
  unsigned int v16 = sub_1000BE644(*(_DWORD *)(a1 + 76), 4, v15);
  unsigned int v17 = sub_1000BE644(*(_DWORD *)(a1 + 80), 4, v16);
  unsigned int v18 = sub_1000BE644(*(__int16 *)(a1 + 84), 2, v17);
  unsigned int v19 = sub_1000BE644(*(unsigned __int16 *)(a1 + 104), 2, v18);
  unsigned int v20 = sub_1000BE644(*(_DWORD *)(a1 + 108), 4, v19);
  unsigned int v21 = sub_1000BE644(*(_DWORD *)(a1 + 112), 4, v20);
  unsigned int v22 = sub_1000BE644(*(_DWORD *)(a1 + 116), 4, v21);
  return sub_1000BE644(*(_DWORD *)(a1 + 120), 4, v22);
}

uint64_t sub_1000D0454(__int128 *a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = sub_1000C0F68(0x90uLL);
  uint64_t v3 = (uint64_t)v2;
  if (!v2) {
    return v3;
  }
  __int128 v5 = a1[3];
  __int128 v4 = a1[4];
  __int128 v6 = a1[1];
  *((_OWORD *)v2 + 2) = a1[2];
  *((_OWORD *)v2 + 3) = v5;
  __int128 v7 = a1[7];
  __int128 v8 = a1[8];
  __int128 v9 = a1[6];
  *((_OWORD *)v2 + 5) = a1[5];
  *((_OWORD *)v2 + 1) = v6;
  __int128 v10 = *a1;
  *((_OWORD *)v2 + 4) = v4;
  *((_OWORD *)v2 + 7) = v7;
  *((_OWORD *)v2 + 8) = v8;
  *((_OWORD *)v2 + 6) = v9;
  v2[11] = 0;
  *((void *)v2 + 6) = 0LL;
  v2[20] = 0;
  *((void *)v2 + 4) = 0LL;
  *(_OWORD *)int v2 = v10;
  *((_OWORD *)v2 + 1) = 0u;
  *(_OWORD *)int v2 = 0u;
  if (*(void *)a1)
  {
    unsigned int v11 = *((_DWORD *)a1 + 14) + 255;
    unsigned int v12 = v11 >> 8;
    unsigned int v13 = sub_1000C0F68(8 * (v11 >> 8));
    if (!v13) {
      goto LABEL_44;
    }
    unsigned int v14 = v13;
    if (v11 >= 0x100)
    {
      uint64_t v15 = 0LL;
      if (v12 <= 1) {
        uint64_t v16 = 1LL;
      }
      else {
        uint64_t v16 = v12;
      }
      while (1)
      {
        unsigned int v17 = sub_1000C0F68(0x800uLL);
        *(void *)&v14[2 * v15] = v17;
        if (!v17) {
          break;
        }
        j__memmove(v17, *(const void **)(*(void *)a1 + 8 * v15++), 0x800uLL);
        if (v16 == v15) {
          goto LABEL_11;
        }
      }

      if (v15)
      {
        uint64_t v36 = v15 + 1;
        do
          sub_1000C0EF8(*(void *)&v14[2 * (v36-- - 2)]);
        while (v36 > 1);
      }

      goto LABEL_44;
    }

uint64_t sub_1000D06E4(uint64_t a1, int a2, unsigned __int16 a3, __int16 a4, int a5, _DWORD *a6)
{
  return sub_1000D06EC(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t sub_1000D06EC( uint64_t result, int a2, unsigned __int16 a3, __int16 a4, int a5, _DWORD *a6, __int16 a7)
{
  unsigned __int16 v11 = a3;
  __int16 v12 = a2;
  uint64_t v13 = result;
  *a6 = 0;
  if (*(_DWORD *)(result + 116))
  {
    if (*(__int16 *)(result + 84) == -1)
    {
      *(_DWORD *)(result + 120) = a2;
      LOWORD(v14) = a2;
    }

    else
    {
      int v14 = *(_DWORD *)(result + 120);
    }

    __int16 v12 = v14 - a2;
    unsigned __int16 v11 = v14 - a3;
  }

  int v15 = (__int16)v11 + 1;
  if (v15 >= *(_DWORD *)(result + 80)) {
    goto LABEL_25;
  }
  *(_WORD *)(result + 60) = v15;
  if (v12)
  {
    uint64_t v16 = *(void *)(result + 48);
    if (!*(_DWORD *)(v16 + 16LL * v12 - 12)) {
      return result;
    }
    uint64_t v17 = (__int16)v11;
    LODWORD(v18) = *(unsigned __int16 *)(result + 84);
    if ((_DWORD)v18 == v11)
    {
LABEL_10:
      int v19 = *(_DWORD *)(result + 56) + 1;
      if (*(_DWORD *)(result + 68)) {
        goto LABEL_11;
      }
      goto LABEL_22;
    }
  }

  else
  {
    uint64_t v16 = *(void *)(result + 48);
    uint64_t v17 = (__int16)v11;
    LODWORD(v18) = *(unsigned __int16 *)(result + 84);
    if ((_DWORD)v18 == v11) {
      goto LABEL_10;
    }
  }

  uint64_t v18 = (__int16)v18;
  if ((__int16)v18 != -1 && !*(_DWORD *)(result + 68))
  {
    int v20 = *(_DWORD *)(v16 + 16 * v18 + 4);
    if (v20) {
      sub_1000D52A0( (uint64_t *)result,  *(unsigned int *)(v16 + 16 * v18),  (v20 + *(_DWORD *)(v16 + 16 * v18) - 1));
    }
  }

  sub_1000D0964(v13);
  for (int i = (__int16)++*(_WORD *)(v13 + 84); i < (__int16)v11; ++*(_WORD *)(v13 + 84))
  {
    uint64_t v22 = (_DWORD *)(*(void *)(v13 + 48) + 16LL * (__int16)i);
    _DWORD *v22 = *(_DWORD *)(v13 + 56);
    v22[1] = 0;
    int i = (__int16)(*(_WORD *)(v13 + 84) + 1);
  }

  *(_DWORD *)(v16 + 16LL * (__int16)v11) = *(_DWORD *)(v13 + 56);
  *(_DWORD *)(v16 + 16 * v17 + 12) = a5;
  int v19 = *(_DWORD *)(v13 + 56) + 1;
  if (*(_DWORD *)(v13 + 68))
  {
LABEL_11:
    uint64_t result = sub_1000C1744((const void **)(v13 + 32), (int *)(v13 + 44), (signed int *)(v13 + 40), 8, 2, v19);
    if ((_DWORD)result) {
      goto LABEL_12;
    }
LABEL_25:
    *a6 = 1;
    return result;
  }

uint64_t sub_1000D0964(uint64_t result)
{
  if (!*(_DWORD *)(result + 124))
  {
    uint64_t v1 = result;
    if ((*(__int16 *)(result + 84) & 0x80000000) == 0)
    {
      int v2 = (unsigned int *)(*(void *)(result + 48) + 16LL * *(unsigned __int16 *)(result + 84));
      __int128 v4 = (int *)(v2 + 1);
      int v3 = v2[1];
      if (v3 >= 2)
      {
        uint64_t v5 = *v2;
        uint64_t v6 = (v3 + v5 - 1);
        if (*(_DWORD *)(result + 68))
        {
          uint64_t result = sub_1000D57EC(result, v5, v6);
          LODWORD(v7) = *v2;
          if (*v4 >= 2)
          {
            int v8 = *v4 + v7;
            unsigned int v9 = v7 + 1;
            do
            {
              int v11 = v10;
              uint64_t v12 = *(void *)(v1 + 32);
              int v10 = *(unsigned __int16 *)(*(void *)(v12 + 8LL * (v9 >> 8)) + 2LL * v9);
              if (v10 != v11)
              {
                LODWORD(v7) = v7 + 1;
                *(_WORD *)(*(void *)(v12 + 8LL * (v7 >> 8)) + 2LL * v7) = v10;
              }

              ++v9;
            }

            while ((int)v9 < v8);
          }
        }

        else
        {
          uint64_t result = sub_1000D52A0((uint64_t *)result, v5, v6);
          unint64_t v7 = *v2;
          if (*v4 >= 2)
          {
            int v13 = *v4 + v7;
            unsigned int v14 = v7 + 1;
            int v15 = (unsigned __int16 *)(*(void *)(*(void *)v1 + ((v7 >> 5) & 0x7FFFFF8)) + 8LL * v7);
            LODWORD(v16) = *v15;
            do
            {
              uint64_t v17 = *(void *)(*(void *)v1 + 8LL * (v14 >> 8));
              uint64_t v18 = (unsigned __int16 *)(v17 + 8LL * v14);
              if (*v18 != (_DWORD)v16 || *(unsigned __int16 *)(v17 + 8LL * v14 + 2) != v15[1])
              {
                LODWORD(v7) = v7 + 1;
                uint64_t v16 = *(void *)v18;
                *(void *)int v15 = *(void *)v18;
                LODWORD(v16) = (unsigned __int16)v16;
              }

              ++v14;
            }

            while ((int)v14 < v13);
          }
        }

        int v19 = v7 + 1;
        *(_DWORD *)(v1 + 56) = v19;
        *__int128 v4 = v19 - *v2;
      }
    }
  }

  return result;
}

uint64_t sub_1000D0B08( uint64_t a1, int a2, int a3, int a4, int a5, unsigned __int16 a6, __int16 a7, __int16 a8, int a9, int a10, _DWORD *a11)
{
  unint64_t v16 = *(unsigned int *)(a1 + 56);
  uint64_t result = sub_1000D06EC(a1, a5, a6, a7, a9, a11, 0);
  if (*(_DWORD *)(a1 + 56) != (_DWORD)v16)
  {
    int v18 = a2 == 0;
    if (a3) {
      int v18 = 2;
    }
    if (a4) {
      BOOL v19 = a3 == 0;
    }
    else {
      BOOL v19 = 1;
    }
    uint64_t v20 = *(void *)(*(void *)(a1 + 16) + ((v16 >> 5) & 0x7FFFFF8)) + 12LL * v16;
    *(_DWORD *)uint64_t v20 = v18;
    if (v19) {
      __int16 v21 = a8;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)(v20 + 6) = v21;
    *(_WORD *)(v20 + 4) = a8;
    *(_DWORD *)(v20 + 8) = a10;
  }

  return result;
}

uint64_t sub_1000D0BC8(uint64_t a1, _WORD *a2, _DWORD *a3, int a4, int a5)
{
  LODWORD(v6) = a4;
  int v10 = *(__int16 *)(a1 + 84);
  if (v10 <= a5)
  {
    if (v10 < a5) {
      return 0LL;
    }
    if (*(_DWORD *)(a1 + 68))
    {
      sub_1000D0964(a1);
    }

    else
    {
      uint64_t v12 = *(void *)(a1 + 48);
      int v13 = *(_DWORD *)(v12 + 16LL * *(__int16 *)(a1 + 84) + 4);
      if (v13)
      {
        uint64_t v14 = *(unsigned int *)(v12 + 16LL * *(__int16 *)(a1 + 84));
        sub_1000D52A0((uint64_t *)a1, v14, (v13 + v14 - 1));
      }
    }
  }

  uint64_t v15 = *(void *)(a1 + 48);
  int v16 = *(_DWORD *)(v15 + 16LL * a5 + 4);
  if (!v16) {
    return 0LL;
  }
  unsigned int v17 = *(_DWORD *)(v15 + 16LL * a5);
  int v18 = v17 + v16;
  if (!*(_DWORD *)(a1 + 68))
  {
    if (v16 >= 1)
    {
      LODWORD(result) = 0;
      int v20 = *(_DWORD *)(v15 + 16LL * a5 + 12);
      while (1)
      {
        uint64_t v21 = *(void *)(*(void *)a1 + 8LL * (v17 >> 8));
        uint64_t result = result;
        int v22 = *(unsigned __int16 *)(v21 + 8LL * v17);
        if (v22 != 65534)
        {
          int v23 = v20 + *(__int16 *)(v21 + 8LL * v17 + 4);
          if ((int)result >= 1)
          {
            uint64_t v24 = 0LL;
            int v25 = 0x7FFFFFFF;
            int v26 = -1;
            while (1)
            {
              int v27 = a3[v24];
              if (v27 > v26)
              {
                int v25 = v24;
                int v26 = a3[v24];
              }

              if (result == ++v24)
              {
                uint64_t v24 = v25;
                goto LABEL_34;
              }
            }

            if (v27 <= v23) {
              goto LABEL_23;
            }
            goto LABEL_37;
          }

          int v26 = -1;
          uint64_t v24 = 0x7FFFFFFFLL;
          if ((int)result < (int)v6)
          {
LABEL_22:
            a2[(int)result] = v22;
            a3[(int)result] = v23;
            uint64_t result = (result + 1);
          }

          else
          {
LABEL_34:
            if (v26 > v23)
            {
              a2[v24] = v22;
LABEL_37:
              a3[v24] = v23;
            }
          }
        }

uint64_t sub_1000D0E08(uint64_t result, uint64_t a2, int a3, int a4)
{
  uint64_t v4 = *(void *)(result + 48);
  uint64_t v5 = *(unsigned __int16 *)(result + 60);
  if ((_DWORD)v5 == 1)
  {
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = (unsigned __int16)v5 & 0xFFFE;
    uint64_t v7 = v4 + 16;
    uint64_t v8 = v6;
    do
    {
      *(void *)(v7 - 16) = 0LL;
      *(void *)uint64_t v7 = 0LL;
      *(_DWORD *)(v7 - 8) = 0;
      *(_DWORD *)(v7 + 8) = 0;
      v7 += 32LL;
      v8 -= 2LL;
    }

    while (v8);
    if (v6 == v5) {
      goto LABEL_9;
    }
  }

  uint64_t v9 = v5 - v6;
  int v10 = (_DWORD *)(v4 + 16 * v6 + 8);
  do
  {
    *((void *)v10 - 1) = 0LL;
    *int v10 = 0;
    v10 += 4;
    --v9;
  }

  while (v9);
LABEL_9:
  *(_DWORD *)(result + 56) = 0;
  *(_WORD *)(result + 60) = 0;
  *(_WORD *)(result + 84) = -1;
  *(_DWORD *)(result + 112) = a4;
  *(_DWORD *)(result + 64) = 0;
  *(_DWORD *)(result + 140) = 0;
  if (a3)
  {
    *(_WORD *)(result + 104) = *(_WORD *)(a2 + 2LL * (a3 - 1));
    *(_DWORD *)(result + 108) = 1;
  }

  else
  {
    *(_WORD *)(result + 104) = -1;
    *(_DWORD *)(result + 108) = 0;
  }

  return result;
}

uint64_t sub_1000D0EC4( uint64_t a1, int a2, unint64_t a3, int a4, _DWORD *a5, void *a6, unsigned int a7)
{
  if (qword_1000FDCC0)
  {
    int v14 = *(_DWORD *)(qword_1000FDCC0 + 1136);
    uint64_t v15 = (_DWORD *)sub_1000C1074((uint64_t)v14 << 7);
    if (v15) {
      goto LABEL_3;
    }
LABEL_31:
    *a5 = 0x40000000;
LABEL_34:
    sub_1000C0EF8((uint64_t)v15);
    return 0LL;
  }

  int v14 = 0;
  uint64_t v15 = (_DWORD *)sub_1000C1074(0LL);
  if (!v15) {
    goto LABEL_31;
  }
LABEL_3:
  int v16 = v15;
  if (*(_WORD *)(a1 + 60))
  {
    goto LABEL_33;
  }

  if (a2 >= 0)
  {
LABEL_33:
    *a5 = 0x40000000;
    uint64_t v15 = v16;
    goto LABEL_34;
  }

uint64_t sub_1000D10B0(void *a1, int a2, int a3, char *__src)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v7 = 0LL;
  uint64_t v8 = __src + 4;
  size_t v9 = 4LL * (a3 - 1);
  do
  {
    int v10 = (unsigned int *)(a1[6] + 16LL * (__int16)(a2 - 1));
    int v11 = v10[1];
    if (v11 < 1)
    {
      uint64_t v12 = 0LL;
      int v16 = MEMORY[0];
      if (MEMORY[0] == 65534) {
        goto LABEL_5;
      }
LABEL_14:
      if ((int)v7 >= a3)
      {
        j__memmove(v8, __src, v9);
        *(_DWORD *)char __src = sub_1000BB870(a1[12], *v12);
      }

      else
      {
        *(_DWORD *)&__src[4 * ~(_DWORD)v7 + 4 * a3] = sub_1000BB870(a1[12], v16);
      }

      uint64_t v7 = (v7 + 1);
      goto LABEL_5;
    }

    uint64_t v12 = 0LL;
    unsigned int v13 = *v10;
    int v14 = v11 + v13;
    __int16 v15 = 0x4000;
    do
    {
      if (*(__int16 *)(*(void *)(*a1 + 8LL * (v13 >> 8)) + 8LL * v13 + 4) < v15)
      {
        uint64_t v12 = (unsigned __int16 *)(*(void *)(*a1 + 8LL * (v13 >> 8)) + 8LL * v13);
        __int16 v15 = v12[2];
      }

      ++v13;
    }

    while ((int)v13 < v14);
    int v16 = *v12;
    if (v16 != 65534) {
      goto LABEL_14;
    }
LABEL_5:
    LOWORD(a2) = v12[1];
  }

  while ((_WORD)a2);
  return v7;
}

uint64_t sub_1000D11F8(uint64_t a1, _DWORD *a2, int a3, unsigned int a4, void *a5, unsigned int a6)
{
  if (*(_WORD *)(a1 + 60)) {
    return sub_1000D1250(a1, a2, a3, 0, *(__int16 *)(a1 + 84), a1 + 104, *(_DWORD *)(a1 + 108), a4, a5, a6);
  }
  else {
    return 0LL;
  }
}

uint64_t sub_1000D1250( uint64_t a1, _DWORD *a2, int a3, unsigned __int16 a4, int a5, uint64_t a6, unsigned int a7, unsigned int a8, void *a9, unsigned int a10)
{
  if (*(_DWORD *)(a1 + 124) && !*(_DWORD *)(a1 + 64))
  {
    int v29 = a3;
    uint64_t v30 = a1;
    *(_DWORD *)(v30 + 64) = 1;
    a1 = v30;
    a3 = v29;
    if (!v29) {
      return 0LL;
    }
  }

  else if (!a3)
  {
    return 0LL;
  }

  if (!*(_DWORD *)(a1 + 56)) {
    return 0LL;
  }
  if (*(_DWORD *)(a1 + 116))
  {
    int v15 = *(_DWORD *)(a1 + 120);
    unsigned __int16 v16 = v15 - a5;
    if (v15 >= a5)
    {
      LOWORD(a5) = v15 - a4;
      a4 = v16;
      goto LABEL_8;
    }

    return 0LL;
  }

LABEL_458:
          uint64_t v31 = 0LL;
          goto LABEL_459;
        }

        uint64_t v67 = v395;
        int v206 = (unsigned int *)(*(void *)(v395 + 48) + 16 * ((__int16)v191 - 1LL));
        int v207 = v206[1];
        if (v207 < 1) {
          goto LABEL_304;
        }
        uint64_t v208 = 0LL;
        uint64_t v209 = *v206;
        int v210 = v207 + *v206;
        unint64_t v398 = v206 + 3;
        int v382 = &a2[32 * v181 + 3];
        uint64_t v211 = 0x7FFFFFFFLL;
        do
        {
          uint64_t v212 = v211;
          uint64_t v213 = v208;
          uint64_t v214 = *(void *)(*(void *)v67 + 8LL * (v209 >> 8));
          uint64_t v208 = (unsigned __int16 *)(v214 + 8LL * v209);
          uint64_t v215 = *v186;
          if ((_DWORD)v215 == 35)
          {
            int v216 = 0;
          }

          else
          {
            int v216 = *(unsigned __int16 *)(v214 + 8LL * v209 + 2);
          }

          int v217 = *v208;
          if (!(_DWORD)v215 && (!v216 ? (BOOL v218 = v217 == 65534) : (BOOL v218 = 0), v218)
            || a10
            && v217 != 65534
            && (*(_WORD *)(v407 + (v181 << 7) + 2 * v215 + 16) = v217,
                int v219 = sub_100026158((uint64_t)a9, a10),
                uint64_t v67 = v395,
                !v219))
          {
LABEL_283:
            uint64_t v211 = v212;
            uint64_t v208 = v213;
            a2 = (_DWORD *)v407;
            goto LABEL_284;
          }

          int v220 = *v398 + *(__int16 *)(v214 + 8LL * v209 + 4);
          a2 = (_DWORD *)v407;
          if (v213 || (uint64_t v211 = v209, v220 != v201))
          {
            sub_1000D591C( (void *)v67,  v407,  v402,  &v408,  v372,  v220 - v201 + *v382,  v209,  v387,  0,  *(_DWORD *)(v67 + 112));
            uint64_t v67 = v395;
            uint64_t v211 = v212;
            uint64_t v208 = v213;
          }

LABEL_284:
          uint64_t v209 = (v209 + 1);
        }

        while ((int)v209 < v210);
        if (v208)
        {
          *(_DWORD *)unint64_t v402 = v211;
          int v225 = *v208;
          int v48 = (unsigned __int16 *)v387;
          int v131 = v375;
          uint64_t v132 = v379;
          if (v225 == 65534)
          {
            int v226 = v208[1];
            signed int v68 = v392;
            if (v226)
            {
              uint64_t v227 = *v186;
              if ((_DWORD)v227) {
                *((_BYTE *)&a2[32 * v181 + 21] + v227 + 3) = 1;
              }
            }
          }

          else
          {
            uint64_t v228 = &a2[32 * v181];
            *((_WORD *)v228 + *v186 + 8) = v225;
            uint64_t v229 = *v186;
            if (v208[3] && *v186 >= 1) {
              *((_BYTE *)&a2[32 * v181 + 22] + (v229 - 1)) = 1;
            }
            uint64_t v230 = v229 + 1;
            *uint64_t v186 = v230;
            *((_BYTE *)v228 + v230 + 88) = 0;
            uint64_t v67 = v395;
            signed int v68 = v392;
          }

LABEL_246:
          ++v131;
          uint64_t v45 = v408;
          if (v131 >= v408) {
            goto LABEL_327;
          }
          goto LABEL_247;
        }

        LODWORD(v45) = v408;
        int v48 = (unsigned __int16 *)v387;
        signed int v68 = v392;
        int v131 = v375;
        uint64_t v132 = v379;
LABEL_304:
        uint64_t v45 = (v45 - 1);
        int v408 = v45;
        if (!(_DWORD)v45) {
          goto LABEL_458;
        }
        uint64_t v180 = __dstb;
        LOWORD(v181) = *__dstb;
        size_t v182 = 2LL * ((int)v45 - v131);
LABEL_249:
        j__memmove(v180, v132, v182);
        v48[(int)v45] = v181;
        uint64_t v67 = v395;
      }
    }

    int v413 = 0;
    int v412 = v45;
    __int16 v411 = 0;
    int v410 = 0;
    if (!*(_DWORD *)(v67 + 124))
    {
      if ((int)v45 >= 1)
      {
        int v133 = 0;
        int v370 = 1;
        int v371 = 0x7FFFFFFF;
        __dsta = v48;
        while (1)
        {
          uint64_t v134 = __dsta++;
          int v367 = v133;
          __srca = v134;
          while (1)
          {
            uint64_t v401 = *v134;
            uint64_t v137 = &a2[32 * v401];
            unint64_t v138 = *v137;
            if ((_DWORD)v138 == 0x7FFFFFFF) {
              goto LABEL_181;
            }
            uint64_t v397 = (__int128 *)&a2[32 * v401];
            signed int v140 = v137[1];
            uint64_t v139 = (int *)(v137 + 1);
            if (v140 > v68) {
              goto LABEL_240;
            }
            uint64_t v141 = *(void *)(*(void *)v67 + ((v138 >> 5) & 0x7FFFFF8));
            uint64_t v142 = v138;
            uint64_t v143 = (unsigned __int16 *)(v141 + 8LL * v138);
            if ((__int16)*v143 == -2 && !*(_WORD *)(v141 + 8LL * v138 + 2))
            {
              *(_DWORD *)uint64_t v397 = 0x7FFFFFFF;
              goto LABEL_181;
            }

            int v144 = v45;
            uint64_t v145 = sub_1000D5E50((void *)v67, v143, &v410, &v411);
            int v146 = v410;
            if ((_DWORD)v145 == 0x7FFFFFFF && v410 == 0)
            {
              uint64_t v67 = v395;
              *(_DWORD *)uint64_t v397 = 0x7FFFFFFF;
              signed int v68 = v392;
              goto LABEL_181;
            }

            uint64_t v148 = v145;
            LOWORD(v149) = qword_1000FDCC0;
            if (qword_1000FDCC0) {
              uint64_t v149 = *(void *)(qword_1000FDCC0 + 1704);
            }
            uint64_t v67 = v395;
            __int16 v150 = v411 + v149;
            v411 += v149;
            int v151 = *(unsigned __int16 *)(v141 + 8 * v142 + 2);
            if (v151 == a4) {
              break;
            }
            uint64_t v152 = (unsigned int *)(*(void *)(v395 + 48) + 16 * ((__int16)v151 - 1LL));
            int v153 = v152[1];
            if (v153 < 1) {
              goto LABEL_224;
            }
            __int16 v378 = v150;
            uint64_t v154 = a2;
            uint64_t v155 = 0LL;
            unsigned int v156 = *v152;
            signed int v157 = v153 + *v152;
            uint64_t v374 = v152 + 3;
            uint64_t v369 = &v154[32 * v401 + 3];
            uint64_t v158 = 0x7FFFFFFFLL;
            do
            {
              uint64_t v159 = v158;
              uint64_t v160 = v155;
              uint64_t v161 = *(void *)(*(void *)v67 + 8LL * (v156 >> 8));
              uint64_t v155 = (__int16 *)(v161 + 8LL * v156);
              uint64_t v162 = *v139;
              if ((_DWORD)v162 == 35)
              {
                if (*v155 != -2) {
                  goto LABEL_220;
                }
                int v163 = 0;
              }

              else
              {
                int v163 = *(unsigned __int16 *)(v161 + 8LL * v156 + 2);
              }

              int v164 = (unsigned __int16)*v155;
              if ((_DWORD)v162 || (!v163 ? (BOOL v165 = v164 == 65534) : (BOOL v165 = 0), !v165))
              {
                if (!a10
                  || v164 == 65534
                  || (*(_WORD *)(v407 + (v401 << 7) + 2 * v162 + 16) = v164,
                      int v166 = sub_100026158((uint64_t)a9, a10),
                      uint64_t v67 = v395,
                      v166))
                {
                  uint64_t v158 = v148;
                  if ((_DWORD)v148 == v156) {
                    goto LABEL_221;
                  }
                  int v167 = *v374 - v146 + *(__int16 *)(v161 + 8LL * v156 + 4);
                  if (v167 < 0) {
                    __int16 v168 = *(_WORD *)v374 - v146 + *(_WORD *)(v161 + 8LL * v156 + 4);
                  }
                  else {
                    __int16 v168 = 0;
                  }
                  sub_1000D591C( (void *)v67,  v407,  v397,  &v412,  v372,  (v167 & ~(v167 >> 31)) + *v369,  v156,  v387,  v378 - v168,  *(_DWORD *)(v67 + 112));
                  uint64_t v67 = v395;
                }
              }

    if (!DWORD2(context))
    {
      sub_1000E2474(DWORD1(context), theString, 0LL);
      goto LABEL_209;
    }

LABEL_220:
              uint64_t v158 = v159;
              uint64_t v155 = v160;
LABEL_221:
              ++v156;
            }

            while ((int)v156 < v157);
            if (v155)
            {
              *(_DWORD *)uint64_t v397 = v158;
              int v173 = (unsigned __int16)*v155;
              int v48 = (unsigned __int16 *)v387;
              signed int v68 = v392;
              int v133 = v367;
              if (v173 == 65534)
              {
                int v174 = (unsigned __int16)v155[1];
                a2 = (_DWORD *)v407;
                if (v174)
                {
                  uint64_t v175 = *v139;
                  if ((_DWORD)v175) {
                    *(_BYTE *)(v407 + (v401 << 7) + v175 + 88) = 1;
                  }
                }
              }

              else
              {
                uint64_t v176 = v407 + (v401 << 7);
                *(_WORD *)(v176 + 2LL * *v139 + 16) = v173;
                uint64_t v177 = *v139;
                if ((int)v177 >= 1)
                {
                  *(_BYTE *)(v176 + (v177 - 1) + 88) = *((_BYTE *)v155 + 6);
                  uint64_t v67 = v395;
                }

                uint64_t v178 = v177 + 1;
                int *v139 = v178;
                *(_BYTE *)(v176 + v178 + 88) = 0;
                *(_WORD *)(v176 + 124) += v378;
                a2 = (_DWORD *)v407;
              }

              goto LABEL_240;
            }

            int v144 = v412;
            a2 = (_DWORD *)v407;
            int v48 = (unsigned __int16 *)v387;
            int v133 = v367;
LABEL_224:
            uint64_t v45 = (v144 - 1);
            int v412 = v144 - 1;
            if (v144 == 1) {
              goto LABEL_244;
            }
            signed int v68 = v392;
            uint64_t v134 = __srca;
            unsigned __int16 v135 = *__srca;
            size_t v136 = 2LL * ((int)v45 - v133);
LABEL_184:
            j__memmove(v134, __dsta, v136);
            v48[(int)v45] = v135;
            uint64_t v67 = v395;
          }

          uint64_t v134 = __srca;
          if (!*v139)
          {
            unsigned __int16 v135 = *__srca;
            uint64_t v45 = (v144 - 1);
            int v412 = v144 - 1;
            if (v144 != 1)
            {
              size_t v136 = 2 * ((int)v45 - v133);
              signed int v68 = v392;
              goto LABEL_184;
            }

LABEL_244:
            signed int v68 = v392;
            int v370 = 1;
            int v371 = v392;
            goto LABEL_327;
          }

          uint64_t v169 = &a2[32 * v401];
          int v170 = v169[3] - v410;
          v169[3] = v170;
          *(_DWORD *)uint64_t v397 = 0x7FFFFFFF;
          int v413 = v133;
          if (v133 >= 1)
          {
            do
            {
              --v413;
            }

            while (v413 > 0);
          }

          signed int v68 = v392;
          if (v413 != v133)
          {
            unsigned __int16 v171 = *__srca;
            uint64_t v172 = &v48[v413];
            j__memmove(v172 + 1, v172, 2 * (v133 - v413));
            uint64_t v67 = v395;
            *uint64_t v172 = v171;
          }

LABEL_240:
          if (*(_DWORD *)v397 != 0x7FFFFFFF)
          {
            int v179 = v371;
            if (*v139 < v371) {
              int v179 = *v139;
            }
            int v370 = 0;
            int v371 = v179;
          }

LABEL_181:
          ++v133;
          uint64_t v45 = v412;
          if (v133 >= v412) {
            goto LABEL_327;
          }
        }
      }

LABEL_179:
      int v370 = 1;
      int v371 = 0x7FFFFFFF;
      goto LABEL_327;
    }

    int v69 = 0;
    int v417 = 0;
    int v416 = v45;
    __int16 v415 = 0;
    int v414 = 0;
    int v370 = 1;
    int v371 = 0x7FFFFFFF;
    uint64_t v70 = v48;
    uint64_t v377 = *(void *)(v67 + 88);
    uint64_t v381 = *(void *)(v67 + 96);
LABEL_83:
    uint64_t v71 = v70;
    while (2)
    {
      char __src = v71 + 1;
      int __dst = v69;
      int v396 = v71;
LABEL_85:
      uint64_t v45 = v416;
      if (v69 >= v416) {
        goto LABEL_327;
      }
      uint64_t v72 = *v71;
      uint64_t v73 = (__int128 *)&a2[32 * v72];
      unint64_t v74 = *(unsigned int *)v73;
      if ((_DWORD)v74 == 0x7FFFFFFF) {
        goto LABEL_88;
      }
      __int128 v75 = (int *)v73 + 1;
      if (*((_DWORD *)v73 + 1) > v68) {
        goto LABEL_88;
      }
      unsigned int v400 = (__int128 *)&a2[32 * v72];
      int v78 = v416;
      uint64_t v79 = (v74 >> 5) & 0x7FFFFF8;
      uint64_t v80 = *(void *)(*(void *)v67 + v79);
      uint64_t v81 = *(_DWORD *)v73;
      uint64_t v82 = *(void *)(*(void *)(v67 + 16) + v79);
      unsigned int v83 = *(unsigned __int16 *)(v80 + 8 * v81);
      if (v83 == 65534 && !*(_WORD *)(v80 + 8 * v81 + 2))
      {
        a2 = (_DWORD *)v407;
        uint64_t v115 = v407 + (v72 << 7);
        int v116 = *(__int16 *)(v115 + 124);
        if (*(_WORD *)(v115 + 124))
        {
          int v117 = *(_DWORD *)(v115 + 12) - v116;
          *(_DWORD *)(v115 + 12) = v117;
          *(_WORD *)(v115 + 124) = 0;
          int v417 = __dst;
          if (v116 <= 0)
          {
            for (; v417 < v78 - 1; ++v417)
            {
            }

            int v69 = __dst;
            if (v417 != __dst)
            {
              unsigned __int16 v129 = *v396;
              j__memmove(v396, __src, 2 * (v417 - __dst));
              uint64_t v71 = v396;
              v48[v417] = v129;
              int v77 = 1;
              goto LABEL_167;
            }

            int v77 = 0;
            uint64_t v67 = v395;
            uint64_t v71 = v396;
          }

          else
          {
            if (v417 >= 1)
            {
              do
              {
                --v417;
              }

              while (v417 > 0);
            }

            int v69 = __dst;
            uint64_t v71 = v396;
            if (v417 == __dst)
            {
              int v77 = 0;
            }

            else
            {
              unsigned __int16 v127 = *v396;
              int v128 = &v48[v417];
              j__memmove(v128 + 1, v128, 2 * (__dst - v417));
              uint64_t v71 = v396;
              int v77 = 0;
              *int v128 = v127;
            }

LABEL_374:
            uint64_t v67 = v395;
          }

          else
          {
            uint64_t v279 = (v232 - 1);
            uint64_t v235 = v234;
            LODWORD(v232) = v234;
            uint64_t v67 = v395;
            if ((_DWORD)v234 != (_DWORD)v279)
            {
              j__memmove(v236, v236 + 1, 2 * (v272 + (int)v279));
              uint64_t v67 = v395;
              v48[(int)v279] = v273;
              uint64_t v235 = v279;
              LODWORD(v232) = v279;
            }
          }
        }

        uint64_t v234 = (v234 - 1);
        --v236;
        ++v272;
        if ((_DWORD)v234 == -1) {
          break;
        }
        continue;
      }
    }

LABEL_353:
                LODWORD(v249) = v249 + 1;
                ++v256;
                if ((int)v249 >= v259)
                {
                  int v48 = (unsigned __int16 *)v387;
                  uint64_t v67 = v395;
                  uint64_t v45 = v403;
                  goto LABEL_347;
                }
              }

              if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 1760))
              {
                uint64_t v262 = a2[32 * v260 + 1];
                while ((int)v262 >= 1)
                {
                  uint64_t v263 = 2 * v262--;
                }
              }

              else
              {
                uint64_t v264 = a2[32 * v260 + 1];
                while ((int)v264 >= 1)
                {
                  uint64_t v265 = v264 - 1;
                  uint64_t v266 = 2 * v264;
                  int v267 = sub_1000BB868(v254, *(unsigned __int16 *)&v394[128 * v260 + 2 * v264], 0LL);
                  int v268 = sub_1000BB868(v254, *(unsigned __int16 *)&v258[v266], 0LL);
                  uint64_t v264 = v265;
                  if (v267 != v268)
                  {
                    int v259 = v403;
                    int v250 = v403;
LABEL_352:
                    a2 = (_DWORD *)v407;
                    unint64_t v257 = i;
                    goto LABEL_353;
                  }
                }
              }

              a2 = (_DWORD *)v407;
              int v269 = SLOWORD(a2[32 * v260 + 31]) - a2[32 * v260 + 3];
              if (*__srcb - *v383 + v269 >= 1) {
                __int16 *v383 = v269 + *__srcb;
              }
              uint64_t v270 = v403 - 1;
              unsigned __int16 v271 = *v256;
              j__memmove(v256, v256 + 1, 2 * (v403 - 1 - (int)v249));
              *(_WORD *)(v387 + 2 * v270) = v271;
              --v403;
              int v250 = v270;
            }

            int v250 = v403 - 1;
            int v48 = (unsigned __int16 *)v387;
            uint64_t v67 = v395;
            uint64_t v45 = v403 - 1;
LABEL_347:
            uint64_t v251 = v376;
            uint64_t v249 = v380;
          }

          ++v251;
        }

        while (v249 < v250);
      }
    }

    else
    {
      a2 = (_DWORD *)v407;
      uint64_t v45 = v235;
    }

    if (!v370) {
      continue;
    }
    break;
  }

  if (!(_DWORD)v45) {
    goto LABEL_458;
  }
  uint64_t v404 = v45;
  uint64_t v280 = (void *)sub_1000C1074(v360 << 7);
  if (!v280) {
    goto LABEL_458;
  }
  uint64_t v281 = (uint64_t)v280;
  memcpy(v280, a2, v360 << 7);
  uint64_t v31 = v45;
  if ((int)v45 >= 1)
  {
    uint64_t v282 = v45;
    int v283 = a2;
    uint64_t v284 = v48;
    do
    {
      unsigned int v285 = *v284++;
      uint64_t v286 = (__int128 *)(v281 + ((unint64_t)v285 << 7));
      __int128 v287 = *v286;
      __int128 v288 = v286[1];
      __int128 v289 = v286[3];
      v283[2] = v286[2];
      v283[3] = v289;
      *int v283 = v287;
      v283[1] = v288;
      __int128 v290 = v286[4];
      __int128 v291 = v286[5];
      __int128 v292 = v286[7];
      v283[6] = v286[6];
      v283[7] = v292;
      v283[4] = v290;
      v283[5] = v291;
      v283 += 8;
      --v282;
    }

    while (v282);
  }

  sub_1000C0EF8(v281);
  if (!*(_DWORD *)(v395 + 116) && (int)v45 >= 1)
  {
    uint64_t v293 = a2;
    uint64_t v294 = 0LL;
    BOOL v406 = (char *)v293 - 30;
    unsigned int v295 = (char *)v293 - 15;
    uint64_t v296 = (char *)v293 - 14;
    unsigned int v297 = (char *)v293 - 7;
    unint64_t v298 = (int16x8_t *)(v293 + 4);
    uint64_t v299 = (int8x16_t *)(v293 + 22);
    while (1)
    {
      uint64_t v301 = (unsigned int *)(v407 + (v294 << 7));
      uint64_t v302 = (char *)(v301 + 22);
      uint64_t v303 = (char *)v301 + 89;
      unint64_t v304 = v301[1];
      uint64_t v305 = (int)v304;
LABEL_392:
      uint64_t v300 = v305 - 1;
      j__memmove(v302, v303, v305 - 1);
      v302[v300] = 0;
      ++v294;
      v298 += 8;
      v299 += 8;
      if (v294 == v404)
      {
        uint64_t v31 = v404;
        goto LABEL_459;
      }
    }

    unint64_t v306 = v304 >> 1;
    if (v304 < 0x10
      || ((unint64_t v307 = (unint64_t)(v301 + 4),
           uint64_t v308 = (v304 - 1),
           uint64_t v309 = 2 * v308,
           (int)v304 - (int)v306 < (int)v304)
        ? (BOOL v310 = (char *)v301 + v309 + -2 * v306 + 18 > (char *)v301 + v309 + 16)
        : (BOOL v310 = 1),
          !v310 ? (BOOL v311 = &v302[v308 - v306 + 1] > &v302[v308]) : (BOOL v311 = 1),
          v311))
    {
      uint64_t v312 = 0LL;
    }

    else
    {
      uint64_t v312 = 0LL;
      uint64_t v319 = (char *)v301 + 18;
      unint64_t v320 = v307 + 2 * v306;
      uint64_t v321 = &v302[v306];
      unint64_t v322 = (unint64_t)&v319[v309 - 2 * v306];
      unint64_t v323 = (unint64_t)&v319[v309];
      uint64_t v324 = &v303[v308 - v306];
      size_t v325 = &v303[v308];
      BOOL v327 = v307 < (unint64_t)&v319[v309] && v322 < v320;
      BOOL v329 = v307 < (unint64_t)v325 && (unint64_t)v324 < v320;
      BOOL v331 = (unint64_t)v302 < v323 && v322 < (unint64_t)v321;
      BOOL v333 = v302 < v325 && v324 < v321;
      BOOL v335 = v322 < (unint64_t)v325 && (unint64_t)v324 < v323;
      BOOL v336 = (unint64_t)v302 >= v320 || v307 >= (unint64_t)v321;
      if (v336 && !v327 && !v329 && !v331 && !v333)
      {
        uint64_t v313 = v407;
        if (!v335)
        {
          uint64_t v337 = v294 << 7;
          if (v304 >= 0x20)
          {
            uint64_t v312 = (v304 >> 1) & 0x7FFFFFF0;
            uint64_t v338 = v312;
            uint64_t v339 = v299;
            uint64_t v340 = v298;
            do
            {
              int16x8_t v342 = *v340;
              int16x8_t v341 = v340[1];
              uint64_t v343 = (int16x8_t *)&v406[2 * (int)v308 + v337];
              int8x16_t v344 = (int8x16_t)vrev64q_s16(v343[1]);
              int8x16_t v345 = (int8x16_t)vrev64q_s16(v343[2]);
              *(int8x16_t *)uint64_t v340 = vextq_s8(v345, v345, 8uLL);
              v340[1] = (int16x8_t)vextq_s8(v344, v344, 8uLL);
              v340 += 2;
              int8x16_t v346 = (int8x16_t)vrev64q_s16(v342);
              int8x16_t v347 = (int8x16_t)vrev64q_s16(v341);
              v343[1] = (int16x8_t)vextq_s8(v347, v347, 8uLL);
              v343[2] = (int16x8_t)vextq_s8(v346, v346, 8uLL);
              int8x16_t v348 = *v339;
              unint64_t v349 = &v295[v337 + (int)v308];
              int8x16_t v350 = vrev64q_s8(*(int8x16_t *)(v349 + 88));
              *v339++ = vextq_s8(v350, v350, 8uLL);
              int8x16_t v351 = vrev64q_s8(v348);
              *(int8x16_t *)(v349 + 88) = vextq_s8(v351, v351, 8uLL);
              LODWORD(v308) = v308 - 16;
              v338 -= 16LL;
            }

            while (v338);
            uint64_t v313 = v407;
            if (v312 == v306) {
              goto LABEL_392;
            }
            if ((v306 & 8) != 0) {
              goto LABEL_454;
            }
          }

          else
          {
            uint64_t v312 = 0LL;
LABEL_454:
            uint64_t v352 = v312;
            uint64_t v312 = (v304 >> 1) & 0x7FFFFFF8;
            uint64_t v353 = 2 * v352;
            int v354 = ~(_DWORD)v352 + v304;
            do
            {
              int16x8_t v355 = *(int16x8_t *)((char *)v298 + v353);
              int v356 = (int16x8_t *)&v296[2 * v354 + v337];
              int8x16_t v357 = (int8x16_t)vrev64q_s16(v356[1]);
              *(int8x16_t *)((char *)v298 + v353) = vextq_s8(v357, v357, 8uLL);
              int8x16_t v358 = (int8x16_t)vrev64q_s16(v355);
              v356[1] = (int16x8_t)vextq_s8(v358, v358, 8uLL);
              v358.i64[0] = *(uint64_t *)((char *)v299->i64 + v352);
              int v359 = (int8x8_t *)&v297[v337 + v354];
              *(int8x8_t *)&v299->i8[v352] = vrev64_s8(v359[11]);
              v359[11] = vrev64_s8(*(int8x8_t *)v358.i8);
              v352 += 8LL;
              v353 += 16LL;
              v354 -= 8;
            }

            while (v312 != v352);
            uint64_t v313 = v407;
            if (v312 == v306) {
              goto LABEL_392;
            }
          }
        }

LABEL_405:
        int v314 = ~(_DWORD)v312 + v304;
        do
        {
          __int16 v315 = v298->i16[v312];
          uint64_t v316 = v313 + (v294 << 7);
          uint64_t v317 = v316 + 2LL * v314;
          v298->i16[v312] = *(_WORD *)(v317 + 16);
          *(_WORD *)(v317 + 16) = v315;
          LOBYTE(v315) = v299->i8[v312];
          uint64_t v318 = v316 + v314;
          v299->i8[v312] = *(_BYTE *)(v318 + 88);
          *(_BYTE *)(v318 + 88) = v315;
          ++v312;
          --v314;
        }

        while (v306 != v312);
        goto LABEL_392;
      }
    }

    uint64_t v313 = v407;
    goto LABEL_405;
  }

LABEL_459:
  sub_1000C0EF8((uint64_t)v48);
LABEL_460:
  sub_1000260E4((uint64_t)a9, a10);
  return v31;
}

uint64_t sub_1000D3158(void **a1)
{
  if (*((__int16 *)a1 + 42) < 0)
  {
LABEL_80:
    signed int v85 = (*((_DWORD *)a1 + 14) + 255) >> 8;
    if (v85 < *((_DWORD *)a1 + 2))
    {
      uint64_t v86 = (*((_DWORD *)a1 + 14) + 255) >> 8;
      do
      {
        sub_1000C0EF8((*a1)[v86]);
        (*a1)[v86] = 0LL;
        sub_1000C0EF8(a1[2][v86]);
        a1[2][v86++] = 0LL;
      }

      while (*((_DWORD *)a1 + 2) > (int)v86);
    }

    *((_DWORD *)a1 + 2) = v85;
    *((_DWORD *)a1 + 6) = v85;
    return 1LL;
  }

  uint64_t v2 = *((unsigned __int16 *)a1 + 42);
  int v3 = a1[6];
  int v95 = (int *)a1 + 11;
  unsigned __int16 v96 = (const void **)(a1 + 4);
  int v93 = v3;
  uint64_t v94 = (signed int *)(a1 + 5);
  __int16 v92 = (int *)a1 + 3;
  unsigned int v90 = (const void **)(a1 + 2);
  uint64_t v91 = (signed int *)(a1 + 1);
  int v88 = (signed int *)(a1 + 3);
  size_t v89 = (int *)a1 + 7;
  uint64_t v4 = (uint64_t)&v3[2 * v2 + 2];
  while (1)
  {
    uint64_t v6 = (int *)&v3[2 * v2];
    int v7 = v6[1];
    int v99 = v6 + 1;
    if (v7 < 1)
    {
      uint64_t v30 = 0LL;
      uint64_t v28 = 0LL;
      int v8 = 0;
      BOOL v98 = 0;
      goto LABEL_64;
    }

    int v8 = 0;
    int v9 = *v6;
    int v10 = v7 + *v6;
    uint64_t v11 = (uint64_t)*a1;
    uint64_t v12 = a1[2];
    unsigned int v13 = *v6;
    do
    {
      int v14 = *(_DWORD *)(v12[v13 >> 8] + 12LL * v13);
      if (v14 == 2
        || (uint64_t v15 = *(void *)(v11 + 8LL * (v13 >> 8)),
            int v16 = *(unsigned __int16 *)(v15 + 8LL * v13),
            v16 == 65534))
      {
        ++v8;
      }

      else if (v14 == 1)
      {
        uint64_t v17 = (uint64_t)&a1[6][2 * *(__int16 *)(v15 + 8LL * v13 + 2)];
        signed int v18 = *(_DWORD *)(v17 - 16);
        int v19 = *(_DWORD *)(v17 - 12);
        signed int v20 = v19 + v18;
        if (v19 >= 1)
        {
          signed int v21 = v20 - 1;
          do
          {
            uint64_t v23 = (v21 + v18) >> 9;
            int v24 = v16
            if (!v24) {
              int v24 = -*(_DWORD *)(v12[v23] + 12LL * ((v21 + v18) >> 1));
            }
            unsigned int v22 = (v21 + v18) >> 1;
            if (v24 >= 1) {
              signed int v18 = v22 + 1;
            }
            else {
              signed int v21 = v22 - 1;
            }
          }

          while (v18 <= v21);
        }

        unsigned int v25 = v18;
        if (v18 < v20)
        {
          unsigned int v25 = v18;
          while (1)
          {
            uint64_t v26 = v25 >> 8;
            if (*(unsigned __int16 *)(*(void *)(v11 + 8LL * v26) + 8LL * v25) != v16
              || *(_DWORD *)(v12[v26] + 12LL * v25) == 1)
            {
              break;
            }

            if (v20 == ++v25)
            {
              unsigned int v25 = v20;
              break;
            }
          }
        }

        int v8 = v8 - v18 + v25;
      }

      ++v13;
    }

    while ((int)v13 < v10);
    BOOL v98 = v8 > 0;
    if (v8 >= 1) {
      break;
    }
    uint64_t v28 = 0LL;
    uint64_t v30 = 0LL;
LABEL_33:
    int v31 = 0;
    do
    {
      uint64_t v34 = (uint64_t)*a1;
      uint64_t v35 = v9 >> 8;
      uint64_t v36 = (*a1)[v35];
      uint64_t v37 = (void *)(v36 + 8LL * v9);
      __int16 v38 = a1[2];
      uint64_t v39 = v38[v35];
      int v40 = (uint64_t *)(v39 + 12LL * v9);
      if (*(_DWORD *)v40 == 2 || (int v41 = *(unsigned __int16 *)v37, v41 == 65534))
      {
        *(void *)(v28 + 8LL * v31) = *v37;
        uint64_t v32 = v30 + 12LL * v31;
        uint64_t v33 = *v40;
        *(_DWORD *)(v32 + 8) = *((_DWORD *)v40 + 2);
        *(void *)uint64_t v32 = v33;
        ++v31;
      }

      else if (*(_DWORD *)v40 == 1)
      {
        uint64_t v42 = (uint64_t)&a1[6][2 * *(__int16 *)(v36 + 8LL * v9 + 2)];
        signed int v44 = *(_DWORD *)(v42 - 16);
        int v43 = *(_DWORD *)(v42 - 12);
        signed int v45 = v43 + v44;
        if (v43 >= 1)
        {
          signed int v46 = v45 - 1;
          do
          {
            uint64_t v48 = (v46 + v44) >> 9;
            int v49 = v41
            if (!v49) {
              int v49 = -*(_DWORD *)(v38[v48] + 12LL * ((v46 + v44) >> 1));
            }
            unsigned int v47 = (v46 + v44) >> 1;
            if (v49 >= 1) {
              signed int v44 = v47 + 1;
            }
            else {
              signed int v46 = v47 - 1;
            }
          }

          while (v44 <= v46);
        }

        unsigned int v50 = v44;
        if (v44 < v45)
        {
          unsigned int v50 = v44;
          while (1)
          {
            uint64_t v51 = v50 >> 8;
            if (*(unsigned __int16 *)(*(void *)(v34 + 8LL * v51) + 8LL * v50) != v41
              || *(_DWORD *)(v38[v51] + 12LL * v50) == 1)
            {
              break;
            }

            if (v45 == ++v50)
            {
              unsigned int v50 = v45;
              break;
            }
          }
        }

        if ((int)(v50 - v44) >= 1)
        {
          __int16 v52 = 0x4000;
          int v53 = 0x40000000;
          unsigned int v54 = v44;
          do
          {
            uint64_t v55 = v54 >> 8;
            if (*(__int16 *)(*(void *)(v34 + 8LL * v55) + 8LL * v54 + 4) < v52)
            {
              int v53 = *(_DWORD *)(v38[v55] + 12LL * v54 + 8);
              __int16 v52 = *(_WORD *)(*(void *)(v34 + 8LL * v55) + 8LL * v54 + 4);
            }

            ++v54;
          }

          while (v50 != v54);
          if ((int)(v50 - v44) >= 1)
          {
            uint64_t v56 = 0LL;
            uint64_t v57 = (_DWORD *)(v39 + 12LL * v9 + 8);
            uint64_t v58 = v28 + 8LL * v31;
            uint64_t v59 = v30 + 12LL * v31;
            unsigned int v60 = v44 - v50;
            uint64_t v61 = 4LL;
            do
            {
              uint64_t v62 = (v44 + v56) >> 8;
              uint64_t v63 = (*a1)[v62];
              uint64_t v64 = a1[2][v62];
              *(void *)(v58 + 8 * v56) = *v37;
              uint64_t v65 = v63 + 8LL * (v44 + v56);
              BOOL v66 = (_WORD *)(v58 + v61);
              *(v66 - 1) = *(_WORD *)(v65 + 2);
              *BOOL v66 = *(_WORD *)(v65 + 4) - v52 + *(_WORD *)(v58 + v61);
              LODWORD(v65) = *((_DWORD *)v40 + 2);
              *(void *)uint64_t v59 = *v40;
              *(_DWORD *)(v59 + 8) = v65;
              *(_DWORD *)uint64_t v59 = 1;
              uint64_t v67 = v64 + 12LL * (v44 + v56);
              *(_WORD *)(v59 + 4) = *(_WORD *)(v67 + 4);
              *(_DWORD *)(v59 + 8) = *v57 - v53 + *(_DWORD *)(v67 + 8);
              ++v56;
              v59 += 12LL;
              v61 += 8LL;
            }

            while (v60 + (_DWORD)v56);
            v31 += v56;
          }
        }
      }

      ++v9;
    }

    while (v9 < v10);
    int v7 = *v99;
LABEL_64:
    int v68 = v8 - v7;
    if (v8 != v7)
    {
      uint64_t v97 = (_DWORD *)v4;
      int v69 = *((_DWORD *)a1 + 14) + v68;
      if (*((_DWORD *)a1 + 17))
      {
        uint64_t v70 = (int *)&v3[2 * v2];
      }

      else
      {
        uint64_t v70 = (int *)&v3[2 * v2];
        if (!sub_1000C1744((const void **)a1, v92, v91, 8, 8, *((_DWORD *)a1 + 14) + v68)
          || *((_DWORD *)a1 + 31) && !sub_1000C1744(v90, v89, v88, 8, 12, v69))
        {
LABEL_84:
          sub_1000C0EF8(v28);
          uint64_t v87 = v30;
          goto LABEL_86;
        }
      }

      if (v2 < *((__int16 *)a1 + 42))
      {
        int v71 = v3[2 * v2 + 2];
        int v72 = *((_DWORD *)a1 + 14);
        int v73 = v72 - v71;
        sub_1000C1CCC(*a1, *((unsigned int *)a1 + 2), 256, 8, v71, v72 - v71, v71 + v68);
        int v74 = v73;
        int v3 = v93;
        sub_1000C1CCC(a1[2], *((unsigned int *)a1 + 6), 256, 12, v71, v74, v71 + v68);
      }

      *((_DWORD *)a1 + 14) += v68;
      int *v99 = v8;
      uint64_t v4 = (uint64_t)v97;
      uint64_t v6 = v70;
      if (v2 < *((__int16 *)a1 + 42))
      {
        __int128 v75 = v97;
        int v76 = v2;
        do
        {
          *v75 += v68;
          v75 += 4;
          ++v76;
        }

        while (v76 < *((__int16 *)a1 + 42));
      }
    }

    if (v98)
    {
      unsigned int v77 = *v6;
      uint64_t v78 = v8;
      uint64_t v79 = (uint64_t *)v28;
      uint64_t v80 = v30;
      do
      {
        uint64_t v81 = v77 >> 8;
        uint64_t v82 = *v79++;
        *(void *)((*a1)[v81] + 8LL * v77) = v82;
        uint64_t v83 = a1[2][v81] + 12LL * v77;
        uint64_t v84 = *(void *)v80;
        *(_DWORD *)(v83 + 8) = *(_DWORD *)(v80 + 8);
        *(void *)uint64_t v83 = v84;
        ++v77;
        v80 += 12LL;
        --v78;
      }

      while (v78);
    }

    sub_1000C0EF8(v28);
    sub_1000C0EF8(v30);
    v4 -= 16LL;
    if (v2-- <= 0) {
      goto LABEL_80;
    }
  }

  uint64_t result = (uint64_t)sub_1000C0F68(8LL * v8);
  if (!result) {
    return result;
  }
  uint64_t v28 = result;
  int v29 = sub_1000C0F68(12LL * v8);
  if (v29)
  {
    uint64_t v30 = (uint64_t)v29;
    int v9 = *v6;
    int v7 = *v99;
    int v10 = *v99 + *v6;
    if (*v99 < 1) {
      goto LABEL_64;
    }
    goto LABEL_33;
  }

  uint64_t v87 = v28;
LABEL_86:
  sub_1000C0EF8(v87);
  return 0LL;
}

uint64_t sub_1000D3890( uint64_t result, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned __int16 *a7, int a8)
{
  int v9 = a3;
  __int16 v78 = 0;
  uint64_t v10 = *(void *)(result + 96);
  int v69 = (void *)result;
  if (!*(_DWORD *)(result + 116))
  {
    uint64_t v37 = a2;
    if (a3 < 1) {
      return result;
    }
    unsigned int v38 = a6;
    int v39 = 0;
    uint64_t v66 = a2 + 16;
    while (1)
    {
      uint64_t v40 = *a7;
      int v41 = (unsigned int *)(v37 + (v40 << 7));
      int v43 = (int *)(v41 + 2);
      signed int v42 = v41[2];
      signed int v45 = (int *)(v41 + 1);
      signed int v44 = v41[1];
      if (v42 > v44 || v44 == 0) {
        goto LABEL_41;
      }
      if (v42) {
        int v47 = v41[2];
      }
      else {
        int v47 = 1;
      }
      if (v42) {
        BOOL v48 = 1;
      }
      else {
        BOOL v48 = v38 == 0xFFFF;
      }
      uint64_t v76 = *a7;
      if (v48)
      {
        if (v44 >= a8) {
          int v49 = a8;
        }
        else {
          int v49 = v41[1];
        }
        int v50 = v49 - v47;
        if (v49 <= v47)
        {
LABEL_58:
          unint64_t v51 = *v41;
          if ((_DWORD)v51 == 0x7FFFFFFF) {
            goto LABEL_59;
          }
          goto LABEL_68;
        }
      }

      else
      {
        uint64_t v55 = v37 + (v40 << 7);
        __int16 v78 = sub_1000BB868(v10, *(unsigned __int16 *)(v55 + 16), 0LL);
        int v47 = 1;
        uint64_t result = sub_1000BBBB0(v10, (uint64_t)&v78, 1u, v38);
        *(_DWORD *)(v55 + 12) += result;
        if (*v45 >= a8) {
          int v49 = a8;
        }
        else {
          int v49 = *v45;
        }
        int v50 = v49 - 1;
        if (v49 <= 1) {
          goto LABEL_58;
        }
      }

      int v71 = v49;
      uint64_t v56 = (unsigned __int16 *)(v66 + (v76 << 7) + 2LL * v47);
      do
      {
        __int16 v78 = sub_1000BB868(v10, *v56, 0LL);
        unsigned int v57 = sub_1000BB868(v10, *(v56 - 1), 0LL);
        int v58 = sub_1000BBBB0(v10, (uint64_t)&v78, 1u, v57);
        uint64_t result = sub_1000BBBB0(v10, 0LL, 0, v57);
        *(_DWORD *)(a2 + (v76 << 7) + 12) = *(_DWORD *)(a2 + (v76 << 7) + 12) - result + v58;
        ++v56;
        --v50;
      }

      while (v50);
      int v49 = v71;
      int v47 = v71;
      unsigned int v38 = a6;
      int v43 = (int *)(v41 + 2);
      unint64_t v51 = *v41;
      if ((_DWORD)v51 == 0x7FFFFFFF)
      {
LABEL_59:
        BOOL v52 = 1;
        uint64_t v53 = v76;
        uint64_t v37 = a2;
        int v54 = *v45;
        if (v49 >= *v45) {
          goto LABEL_70;
        }
        goto LABEL_40;
      }

uint64_t sub_1000D3E08(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_100023890(qword_100102A10 + ((unint64_t)*a1 << 7), qword_100102A10 + ((unint64_t)*a2 << 7));
}

uint64_t sub_1000D3E24(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v6 = a1;
  int v7 = (char *)*(__int16 *)(a1 + 60);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v146 = *(void *)(a1 + 88);
  uint64_t v152 = *(void *)(a1 + 96);
  unsigned int v16 = sub_1000CB0B0();
  if (!*(_DWORD *)(v6 + 64))
  {
    *(_DWORD *)(v6 + 64) = 1;
  }

  int v17 = (char *)sub_1000CAF58(4LL * ((int)v7 + 1), v9, v10, v11, v12, v13, v14, v15);
  bzero(v17, 4LL * (int)v7);
  *(_DWORD *)&v17[4 * (int)v7] = 1;
  if (*(int *)(v6 + 56) >= 1)
  {
    unsigned int v25 = 0;
    do
    {
      uint64_t v26 = 4LL * *(__int16 *)(*(void *)(*(void *)v6 + 8LL * (v25 >> 8)) + 8LL * v25 + 2);
      ++*(_DWORD *)&v17[v26];
      ++v25;
    }

    while ((signed int)v25 < *(_DWORD *)(v6 + 56));
  }

  if ((int)v7 > 1)
  {
    uint64_t v27 = ((_DWORD)v7 - 1);
    do
    {
      if (!*(_DWORD *)&v17[4 * v27])
      {
        int v29 = (unsigned int *)(v8 + 16LL * (v27 - 1));
        int v30 = v29[1];
        if (v30 >= 1)
        {
          unsigned int v31 = *v29;
          int v32 = v30 + v31;
          do
          {
            uint64_t v33 = 4LL * *(__int16 *)(*(void *)(*(void *)v6 + 8LL * (v31 >> 8)) + 8LL * v31 + 2);
            --*(_DWORD *)&v17[v33];
            ++v31;
          }

          while ((int)v31 < v32);
        }
      }

      BOOL v28 = v27-- <= 1;
    }

    while (!v28);
  }

  uint64_t v34 = (int)v7 - 1LL;
  unint64_t v143 = sub_1000CAF58(4LL * ((int)v7 + 1), v18, v19, v20, v21, v22, v23, v24);
  if (qword_1000FDCC0) {
    unint64_t v35 = *(void *)(qword_1000FDCC0 + 5400) / 0x1CuLL;
  }
  else {
    LODWORD(v35) = 0;
  }
  int v137 = v35;
  int v156 = v35;
  uint64_t v36 = sub_1000C0F68(28LL * (int)v35);
  uint64_t v37 = (uint64_t)v36;
  if (v36)
  {
    uint64_t v38 = *(void *)(v6 + 128);
    if (v38)
    {
      uint64_t v139 = *(unsigned int **)(v6 + 128);
      sub_10009C5F8(v38, 1, 1);
    }

    else
    {
      if (qword_1000FDCC0) {
        int v126 = *(_DWORD *)(qword_1000FDCC0 + 4120);
      }
      else {
        int v126 = 0;
      }
      uint64_t v127 = sub_10009C484(v126);
      *(void *)(v6 + 128) = v127;
      sub_10009C5B0(v127, *(void *)(v6 + 96));
      uint64_t v139 = *(unsigned int **)(v6 + 128);
      sub_10009C5F8((uint64_t)v139, 1, 1);
      if ((int)v7 >= 1)
      {
LABEL_23:
        unsigned int v129 = v16;
        int v39 = 0;
        uint64_t v149 = (char *)(v37 + 28LL * v156);
        if (a3 >= a2) {
          int v40 = a2;
        }
        else {
          int v40 = a3;
        }
        int v41 = (const void *)(a4 + 2LL * (a3 - v40));
        uint64_t v42 = 0LL;
        __int16 v135 = v40;
        size_t v133 = 2 * v40;
        uint64_t v134 = v41;
        if (v137 >= 0) {
          int v43 = v137;
        }
        else {
          int v43 = v137 + 1;
        }
        int v140 = v43 >> 1;
        signed int v44 = (char *)v37;
        uint64_t v130 = v8;
        int v131 = v7;
        uint64_t v141 = v6;
        uint64_t v132 = (int)v7 - 1LL;
        while (1)
        {
          while (1)
          {
            *(_DWORD *)(v143 + 4 * v42) = v39;
            if (v42 >= v34) {
              break;
            }
            signed int v45 = (char *)(v42 + 1);
            if (*(_DWORD *)&v17[4 * v42 + 4]) {
              break;
            }
            ++v42;
            if (v45 == v7) {
              goto LABEL_141;
            }
          }

          sub_10009C660((uint64_t)v139);
          signed int v46 = (unsigned int *)(v8 + 16 * v42);
          int v47 = v46[1];
          if (v47 >= 1) {
            break;
          }
          int v151 = 0x40000000;
          uint64_t v101 = qword_1000FDCC0;
          if (qword_1000FDCC0)
          {
LABEL_108:
            int v102 = *(_DWORD *)(v101 + 5568);
            goto LABEL_111;
          }

LABEL_138:
          signed int v44 = v110;
          uint64_t v37 = (uint64_t)&v110[28 * v39];
          ++v42;
          uint64_t v34 = v132;
          if ((char *)v42 == v131)
          {
LABEL_141:
            uint64_t v36 = v44;
            unsigned int v16 = v129;
LABEL_149:
            *(_DWORD *)(v143 + 4LL * (void)v7) = v39;
            uint64_t v37 = 1LL;
            goto LABEL_150;
          }
        }

        unsigned int v48 = *v46;
        int v142 = v47 + *v46;
        size_t v136 = v46 + 3;
        int v157 = 0x40000000;
        int v151 = 0x40000000;
        uint64_t v150 = v42;
        while (1)
        {
          uint64_t v49 = *(void *)(*(void *)v6 + 8LL * (v48 >> 8));
          unsigned int v50 = v48;
          unint64_t v51 = (unsigned __int16 *)(v49 + 8LL * v48);
          unsigned int v52 = *v51;
          unsigned int v147 = v48;
          if (v52 != 65534) {
            break;
          }
          int v53 = *v136 + (__int16)v51[2];
          if (v53 <= v157)
          {
            if ((char *)v37 == v149)
            {
              unsigned int v77 = v44;
              if (2 * v156 >= v137) {
                int v78 = v137;
              }
              else {
                int v78 = 2 * v156;
              }
              unsigned int v79 = v78 - v156;
              if (v78 - v156 < 1)
              {
                if (!v79) {
                  goto LABEL_152;
                }
                goto LABEL_98;
              }

              do
              {
                uint64_t v80 = sub_1000C0F68(28LL * v78);
                if (v80)
                {
                  uint64_t v42 = (uint64_t)v80;
                  int v99 = v78;
                  goto LABEL_100;
                }

                unsigned int v81 = v79 >> 1;
                int v78 = (v79 >> 1) + v156;
                BOOL v28 = v79 > 1;
                v79 >>= 1;
              }

              while (v28);
              if (!v81)
              {
LABEL_152:
                uint64_t v37 = 0LL;
                unsigned int v16 = v129;
                uint64_t v36 = v77;
                goto LABEL_150;
              }

uint64_t sub_1000D49BC(uint64_t a1)
{
  uint64_t v2 = sub_1000C1074(48LL);
  uint64_t v3 = v2;
  if (!v2) {
    return v3;
  }
  if (!*(_DWORD *)(a1 + 136))
  {
LABEL_7:
    *(void *)uint64_t v3 = a1;
    return v3;
  }

  LODWORD(v4) = qword_1000FDCC0;
  if (qword_1000FDCC0)
  {
    uint64_t v4 = *(void *)(qword_1000FDCC0 + 4096);
    if ((v4 & 0x80000000) != 0) {
      return 0LL;
    }
  }

  *(_DWORD *)(v2 + 16) = v4;
  uint64_t v5 = sub_1000C1074(16LL * (int)v4);
  *(void *)(v3 + 24) = v5;
  if (v5)
  {
    uint64_t v6 = sub_1000C1074(2LL * *(int *)(v3 + 16));
    *(void *)(v3 + 40) = v6;
    if (v6) {
      goto LABEL_7;
    }
    sub_1000C0EF8(*(void *)(v3 + 24));
  }

  sub_1000C0EF8(v3);
  return 0LL;
}

uint64_t sub_1000D4A70(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = result;
    sub_1000C0EF8(*(void *)(result + 24));
    sub_1000C0EF8(*(void *)(v1 + 40));
    return sub_1000C0EF8(v1);
  }

  return result;
}

uint64_t sub_1000D4AA8(uint64_t *a1, int a2, int a3)
{
  uint64_t v3 = *a1;
  if (*(_DWORD *)(*a1 + 136))
  {
    __int16 v4 = a2;
    a1[1] = 0LL;
    *((_WORD *)a1 + 19) = 0;
    if (*((int *)a1 + 4) < 2)
    {
      uint64_t v7 = 0LL;
    }

    else
    {
      uint64_t v6 = 0LL;
      uint64_t v7 = 0LL;
      do
      {
        *(_WORD *)(a1[3] + v6) = ++v7;
        v6 += 16LL;
      }

      while (v7 < *((int *)a1 + 4) - 1LL);
    }

    *(_WORD *)(a1[3] + 16 * v7) = -1;
    int v8 = *(__int16 *)(v3 + 60);
    if (v8 >= a3) {
      int v8 = a3;
    }
    uint64_t v9 = (int *)(*(void *)(v3 + 48) + 16LL * v8);
    BOOL v10 = v8 > a2;
    if (!v9[1] && a2 < (__int16)v8)
    {
      do
      {
        int v8 = (__int16)(v8 - 1);
        int v11 = *(v9 - 3);
        v9 -= 4;
        BOOL v10 = v8 > a2;
        if (v11) {
          BOOL v12 = 1;
        }
        else {
          BOOL v12 = v8 <= a2;
        }
      }

      while (!v12);
    }

    if (!v10) {
      return 0LL;
    }
    *((_DWORD *)a1 + 8) = 0x40000000;
    int v13 = v9[1];
    if (v13 >= 1)
    {
      int v14 = *v9;
      int v15 = v13 + *v9;
      do
      {
        uint64_t v16 = *(void *)(*(void *)v3 + 8LL * (v14 >> 8)) + 8LL * v14;
        int v17 = v9[3] + *(__int16 *)(v16 + 4);
        if (v17 < *((_DWORD *)a1 + 8)) {
          *((_DWORD *)a1 + 8) = v17;
        }
        sub_1000D4C14((int *)a1, v16, v17);
        ++v14;
      }

      while (v14 < v15);
    }

    *((_WORD *)a1 + 18) = v4;
  }

  return 1LL;
}

int *sub_1000D4C14(int *result, uint64_t a2, int a3)
{
  uint64_t v5 = result;
  uint64_t v6 = qword_1000FDCC0;
  if (qword_1000FDCC0) {
    uint64_t v6 = *(void *)(qword_1000FDCC0 + 1216);
  }
  if (v6 >= a3 - (uint64_t)result[8])
  {
    int v7 = result[3];
    int v8 = result[4];
    if (v7 != v8
      || *(_DWORD *)(*((void *)result + 3) + 16LL * *(unsigned __int16 *)(*((void *)result + 5) + 2LL * (v7 - 1)) + 8) >= a3)
    {
      int v9 = result[2];
      int v10 = v9 + v7;
      if (v7 <= 0)
      {
        BOOL v12 = (char *)*((void *)result + 5);
        signed int v13 = v5[2];
        int v15 = &v12[2 * v9];
        if (v7 == v8)
        {
LABEL_13:
          uint64_t v16 = *(unsigned __int16 *)&v12[2 * v7 - 2];
          uint64_t v17 = *((void *)v5 + 3) + 16 * v16;
          uint64_t result = (int *)j__memmove(v15 + 2, v15, 2 * (v7 + ~v13));
          *(_WORD *)int v15 = v16;
LABEL_19:
          *(_DWORD *)(v17 + 8) = a3;
          *(void *)uint64_t v17 = a2;
          return result;
        }
      }

      else
      {
        signed int v11 = v10 - 1;
        BOOL v12 = (char *)*((void *)result + 5);
        signed int v13 = v5[2];
        do
        {
          unsigned int v14 = (v13 + v11) >> 1;
          else {
            signed int v11 = v14 - 1;
          }
        }

        while (v13 <= v11);
        int v15 = &v12[2 * v13];
        if (v7 == v8) {
          goto LABEL_13;
        }
      }

      uint64_t v18 = *((unsigned __int16 *)v5 + 19);
      uint64_t v17 = *((void *)v5 + 3) + 16 * v18;
      *((_WORD *)v5 + 19) = *(_WORD *)v17;
      if (v10 >= v8)
      {
        uint64_t v19 = &v12[2 * v9];
        int v20 = v13 - v9;
        j__memmove(v12, v19, 2 * (v13 - v9));
        uint64_t v21 = 2LL * v20;
        int v15 = (char *)(*((void *)v5 + 5) + v21);
        uint64_t result = (int *)j__memmove(v15 + 2, &v19[v21], 2 * (v5[3] - v20));
        v5[2] = 0;
      }

      else
      {
        uint64_t result = (int *)j__memmove(v15 + 2, v15, 2 * (v10 - v13));
      }

      *(_WORD *)int v15 = v18;
      ++v5[3];
      goto LABEL_19;
    }
  }

  return result;
}

uint64_t sub_1000D4DE0(uint64_t *a1, _WORD *a2)
{
  uint64_t v2 = (uint64_t *)*a1;
  if (*(_DWORD *)(*a1 + 136))
  {
    if (*((_DWORD *)a1 + 3))
    {
      while (1)
      {
        uint64_t v4 = *((int *)a1 + 2);
        uint64_t v5 = *(unsigned __int16 *)(a1[5] + 2 * v4);
        *((_DWORD *)a1 + 2) = v4 + 1;
        uint64_t v6 = a1[3] + 16 * v5;
        int v7 = *(unsigned __int16 **)v6;
        int v8 = *(_DWORD *)(v6 + 8);
        *(_WORD *)uint64_t v6 = *((_WORD *)a1 + 19);
        *((_WORD *)a1 + 19) = v5;
        int v9 = *((_DWORD *)a1 + 3) - 1;
        *((_DWORD *)a1 + 3) = v9;
        if (v7[1]) {
          BOOL v10 = v7[1] < *((_WORD *)a1 + 18);
        }
        else {
          BOOL v10 = 1;
        }
        if (v10) {
          goto LABEL_4;
        }
        unsigned int v68 = v7;
        uint64_t v11 = v2[6];
        uint64_t v12 = (__int16)v7[1] - 1LL;
        signed int v13 = (unsigned int *)(v11 + 16 * v12);
        if (!v13[2]) {
          break;
        }
LABEL_10:
        int v14 = *v68;
        if (v14 != 65534)
        {
          *a2 = v14;
          a2[1] = v68[1];
          return 1LL;
        }

        int v9 = *((_DWORD *)a1 + 3);
LABEL_4:
        if (!v9) {
          return 0LL;
        }
      }

      v13[2] = 1;
      int v15 = (__int16)v7[1];
      if (v15 < 1
        || (uint64_t v16 = v2[6],
            uint64_t v17 = (unsigned __int16)v15 - 1,
            uint64_t v18 = (unsigned int *)(v16 + 16LL * v17),
            int v19 = v18[1],
            v19 < 1))
      {
        int v26 = 0x40000000;
      }

      else
      {
        unsigned int v20 = *v18;
        int v21 = v19 + *v18;
        uint64_t v22 = *v2;
        int v23 = *(_DWORD *)(v16 + 16 * v17 + 12);
        else {
          int v24 = v21;
        }
        unsigned int v25 = v24 - v20;
        if (v24 - v20 >= 2)
        {
          unsigned int v27 = v20 + (v25 & 0xFFFFFFFE);
          int v26 = 0x40000000;
          unsigned int v28 = v25 & 0xFFFFFFFE;
          int v29 = 0x40000000;
          do
          {
            v20 += 2;
            v28 -= 2;
          }

          while (v28);
          if (v26 >= v29) {
            int v26 = v29;
          }
          if (v25 == (v25 & 0xFFFFFFFE)) {
            goto LABEL_32;
          }
        }

        else
        {
          int v26 = 0x40000000;
          unsigned int v27 = v20;
        }

        do
        {
          ++v27;
        }

        while ((int)v27 < v21);
      }

uint64_t sub_1000D52A0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  while (!*((_DWORD *)a1 + 31))
  {
    uint64_t v5 = *a1;
    int v7 = (int)v6 >> 16;
    uint64_t v8 = v6 << 16 >> 48;
    uint64_t v9 = a2;
    uint64_t v10 = a3;
LABEL_5:
    uint64_t v11 = v9;
    while (1)
    {
      uint64_t v9 = v11;
      uint64_t v13 = *(void *)(v5 + 8LL * (v11 >> 8));
      uint64_t v14 = v11;
      int v12 = *(unsigned __int16 *)(v13 + 8 * v14) - (unsigned __int16)v6;
      if (v12) {
        goto LABEL_7;
      }
      uint64_t v15 = v13 + 8 * v14;
      int v16 = *(unsigned __int16 *)(v15 + 2);
      if (v16 == WORD1(v6)) {
        break;
      }
      int v12 = (__int16)v16 - v7;
LABEL_7:
      uint64_t v11 = (v9 + 1);
      if ((v12 & 0x80000000) == 0) {
        goto LABEL_12;
      }
    }

    int v17 = *(unsigned __int16 *)(v15 + 4);
    if (v17 != WORD2(v6))
    {
      int v12 = (__int16)v17 - (_DWORD)v8;
      goto LABEL_7;
    }

uint64_t sub_1000D54BC(void *a1, uint64_t a2, uint64_t a3)
{
  while (2)
  {
    uint64_t v3 = a3;
    uint64_t v4 = a1;
    uint64_t v5 = *a1;
    uint64_t v6 = 8LL * ((a3 + a2) >> 9);
    uint64_t v7 = *(void *)(*(void *)(*a1 + v6) + 8LL * ((a3 + a2) >> 1));
    uint64_t v8 = a1[2];
    uint64_t v9 = *(void *)(v8 + v6) + 12LL * ((a3 + a2) >> 1);
    int v10 = *(_DWORD *)v9;
    int v11 = *(unsigned __int16 *)(v9 + 4);
    int v12 = *(unsigned __int16 *)(v9 + 6);
    int v13 = (int)v7 >> 16;
    uint64_t v14 = v7 << 16 >> 48;
    uint64_t v15 = a2;
    while (2)
    {
      uint64_t v20 = v15;
      while (1)
      {
        uint64_t v15 = v20;
        uint64_t v22 = 8LL * (v20 >> 8);
        uint64_t v23 = *(void *)(v5 + v22);
        uint64_t v24 = v20;
        uint64_t v25 = *(void *)(v8 + v22);
        uint64_t result = v25 + 12LL * v24;
        int v21 = *(unsigned __int16 *)(v23 + 8 * v24) - (unsigned __int16)v7;
        if (v21) {
          goto LABEL_5;
        }
        int v21 = *(_DWORD *)result - v10;
        if (*(_DWORD *)result != v10) {
          goto LABEL_5;
        }
        int v21 = *(unsigned __int16 *)(v25 + 12LL * v24 + 4) - v11;
        if (v21) {
          goto LABEL_5;
        }
        int v21 = *(unsigned __int16 *)(v25 + 12LL * v24 + 6) - v12;
        if (v21) {
          goto LABEL_5;
        }
        uint64_t v27 = v23 + 8 * v24;
        int v28 = *(unsigned __int16 *)(v27 + 2);
        if (v28 == WORD1(v7)) {
          break;
        }
        int v21 = (__int16)v28 - v13;
LABEL_5:
        uint64_t v20 = (v15 + 1);
        if ((v21 & 0x80000000) == 0) {
          goto LABEL_13;
        }
      }

      int v29 = *(unsigned __int16 *)(v27 + 4);
      if (v29 != WORD2(v7))
      {
        int v21 = (__int16)v29 - (_DWORD)v14;
        goto LABEL_5;
      }

uint64_t sub_1000D57EC(uint64_t a1, int a2, int a3)
{
  do
  {
    uint64_t v5 = *(void *)(a1 + 32);
    unsigned int v7 = a3;
    unsigned int v8 = a2;
LABEL_4:
    unsigned int v9 = v8 + 1;
    unsigned int v10 = v7 - v8;
    do
    {
      unsigned int v11 = v8;
      unsigned int v12 = v9;
      LODWORD(result) = v10;
      uint64_t v14 = *(void *)(v5 + 8LL * (v8 >> 8));
      uint64_t v15 = v8++;
      ++v9;
      --v10;
    }

    while (*(unsigned __int16 *)(v14 + 2LL * v15) < v6);
    uint64_t v16 = (_WORD *)(v14 + 2 * v15);
    ++v7;
    do
    {
      uint64_t v17 = *(void *)(v5 + 8LL * (--v7 >> 8));
      int v18 = result;
      unsigned int v19 = *(unsigned __int16 *)(v17 + 2LL * v7);
      uint64_t result = (result - 1);
    }

    while (v19 > v6);
    if (v11 == v7)
    {
      unsigned int v7 = v8 - 1;
    }

    else
    {
      do
      {
        int v20 = (unsigned __int16)*v16;
        if (v20 != v19)
        {
          _WORD *v16 = v19;
          *(_WORD *)(v17 + 2LL * v7) = v20;
          uint64_t v5 = *(void *)(a1 + 32);
          unsigned int v8 = v12 - 1;
          goto LABEL_4;
        }

        uint64_t v16 = (_WORD *)(*(void *)(v5 + 8LL * (v12 >> 8)) + 2LL * v12);
        ++v12;
        --v18;
      }

      while (v18);
      if ((int)(v7 - 1) > a2) {
LABEL_14:
      }
        uint64_t result = sub_1000D57EC(a1);
    }

    a2 = v7 + 1;
  }

  while ((int)(v7 + 1) < a3);
  return result;
}

void *sub_1000D591C( void *result, uint64_t a2, __int128 *a3, _DWORD *a4, int a5, int a6, unsigned int a7, uint64_t a8, __int16 a9, int a10)
{
  int v11 = a6;
  uint64_t v13 = a2;
  uint64_t v14 = *a4;
  if ((_DWORD)v14 != a5
    || *(_DWORD *)(a2 + ((unint64_t)*(unsigned __int16 *)(a8 + 2LL * (a5 - 1)) << 7) + 12) > a6)
  {
    uint64_t v15 = result;
    if ((int)v14 < 1)
    {
      int v84 = a6;
      uint64_t v86 = a2;
      unsigned int v22 = 0x7FFFFFFF;
LABEL_14:
      uint64_t v13 = v86;
      int v11 = v84;
      if (v22 == 0x7FFFFFFF)
      {
LABEL_15:
        uint64_t v27 = *(unsigned __int16 *)(a8 + 2LL * (int)v14);
        uint64_t v28 = v13 + (v27 << 7);
        uint64_t v29 = a7 >> 8;
        uint64_t v30 = *(void *)(*result + 8LL * v29);
        uint64_t v31 = a7;
        __int128 v32 = *a3;
        __int128 v33 = a3[1];
        __int128 v34 = a3[3];
        *(_OWORD *)(v28 + 32) = a3[2];
        *(_OWORD *)(v28 + 48) = v34;
        *(_OWORD *)uint64_t v28 = v32;
        *(_OWORD *)(v28 + 16) = v33;
        __int128 v35 = a3[4];
        __int128 v36 = a3[5];
        __int128 v37 = a3[7];
        *(_OWORD *)(v28 + 96) = a3[6];
        *(_OWORD *)(v28 + 112) = v37;
        *(_OWORD *)(v28 + 64) = v35;
        *(_OWORD *)(v28 + 80) = v36;
        int v38 = *(unsigned __int16 *)(v30 + 8 * v31);
        if (v38 == 65534)
        {
          __int16 v39 = a9;
          int v40 = a4;
          if (*(_WORD *)(v30 + 8 * v31 + 2))
          {
            uint64_t v41 = v13 + (v27 << 7);
            uint64_t v42 = *(int *)(v41 + 4);
            if ((_DWORD)v42) {
              *(_BYTE *)(v42 + v41 + 87) = 1;
            }
          }
        }

        else
        {
          uint64_t v47 = (int *)(v28 + 4);
          *(_WORD *)(v28 + 2LL * *(int *)(v28 + 4) + 16) = v38;
          if (*((_DWORD *)result + 31))
          {
            int v48 = *(unsigned __int16 *)(*(void *)(result[2] + 8 * v29) + 12LL * v31 + 6);
            int v49 = *v47;
            __int16 v39 = a9;
            int v40 = a4;
            if (!v48)
            {
              *(_BYTE *)(v49 + v13 + (v27 << 7) + 87) = 1;
              int v49 = *v47;
            }
          }

          else
          {
            int v49 = *v47;
            if (*v47 >= 1) {
              *(_BYTE *)(v13 + (v27 << 7) + (v49 - 1) + 88) = *(_BYTE *)(v30 + 8 * v31 + 6);
            }
            __int16 v39 = a9;
            int v40 = a4;
          }

          *(_BYTE *)(v13 + (v27 << 7) + v49 + 88) = 0;
          ++*v47;
        }

        uint64_t v81 = v13 + (v27 << 7);
        *(_WORD *)(v81 + 124) = v39;
        *(_DWORD *)uint64_t v28 = a7;
        *(_DWORD *)(v81 + 12) = v11;
        ++*v40;
      }

      else
      {
        int v43 = a5;
        if ((_DWORD)v14 != a5)
        {
          int v43 = v14 + 1;
          *a4 = v14 + 1;
        }

        signed int v44 = v43 - 1;
        if (v44 <= (int)v22)
        {
          unsigned int v45 = *(unsigned __int16 *)(a8 + 2LL * v22);
        }

        else
        {
          unsigned int v45 = *(unsigned __int16 *)(a8 + 2LL * v44);
          signed int v46 = (_WORD *)(a8 + 2LL * v22);
          j__memmove(v46 + 1, v46, (int)(2 * (v44 - v22)));
          uint64_t v13 = v86;
          uint64_t result = v15;
          *signed int v46 = v45;
        }

        uint64_t v64 = v13 + ((unint64_t)v45 << 7);
        uint64_t v65 = a7 >> 8;
        uint64_t v66 = *(void *)(*result + 8LL * v65);
        uint64_t v67 = a7;
        __int128 v68 = *a3;
        __int128 v69 = a3[1];
        __int128 v70 = a3[3];
        *(_OWORD *)(v64 + 32) = a3[2];
        *(_OWORD *)(v64 + 48) = v70;
        *(_OWORD *)uint64_t v64 = v68;
        *(_OWORD *)(v64 + 16) = v69;
        __int128 v71 = a3[4];
        __int128 v72 = a3[5];
        __int128 v73 = a3[7];
        *(_OWORD *)(v64 + 96) = a3[6];
        *(_OWORD *)(v64 + 112) = v73;
        *(_OWORD *)(v64 + 64) = v71;
        *(_OWORD *)(v64 + 80) = v72;
        int v74 = *(unsigned __int16 *)(v66 + 8 * v67);
        if (v74 == 65534)
        {
          __int16 v75 = a9;
          if (*(_WORD *)(v66 + 8 * v67 + 2))
          {
            uint64_t v76 = v13 + ((unint64_t)v45 << 7);
            uint64_t v77 = *(int *)(v76 + 4);
            if ((_DWORD)v77) {
              *(_BYTE *)(v77 + v76 + 87) = 1;
            }
          }
        }

        else
        {
          int v78 = (int *)(v64 + 4);
          *(_WORD *)(v64 + 2LL * *(int *)(v64 + 4) + 16) = v74;
          if (*((_DWORD *)result + 31))
          {
            int v79 = *(unsigned __int16 *)(*(void *)(result[2] + 8 * v65) + 12LL * v67 + 6);
            int v80 = *v78;
            __int16 v75 = a9;
            if (!v79)
            {
              *(_BYTE *)(v80 + v13 + ((unint64_t)v45 << 7) + 87) = 1;
              int v80 = *v78;
            }
          }

          else
          {
            int v80 = *v78;
            if (*v78 >= 1) {
              *(_BYTE *)(v13 + ((unint64_t)v45 << 7) + (v80 - 1) + 88) = *(_BYTE *)(v66 + 8 * v67 + 6);
            }
            __int16 v75 = a9;
          }

          *(_BYTE *)(v13 + ((unint64_t)v45 << 7) + v80 + 88) = 0;
          ++*v78;
        }

        uint64_t v82 = v13 + ((unint64_t)v45 << 7);
        *(_WORD *)(v82 + 124) = v75;
        *(_DWORD *)uint64_t v64 = a7;
        *(_DWORD *)(v82 + 12) = v84;
      }
    }

    else
    {
      uint64_t v16 = 0LL;
      while (1)
      {
        uint64_t v17 = *(unsigned __int16 *)(a8 + 2 * v16);
        uint64_t v18 = v13 + (v17 << 7);
        int v20 = *(_DWORD *)(v18 + 12);
        unsigned int v19 = (_DWORD *)(v18 + 12);
        if (v20 > v11) {
          break;
        }
        uint64_t v21 = v13;
        uint64_t result = (void *)sub_1000D6204(result, (_DWORD *)(v13 + (v17 << 7)), (uint64_t)a3, a7, a10);
        if ((_DWORD)result)
        {
          uint64_t v50 = v21 + (v17 << 7);
          int v52 = *(__int16 *)(v50 + 124);
          int v51 = (_WORD *)(v50 + 124);
          int v53 = *v19 - v11 + a9;
          if (v53 - v52 >= 1)
          {
            _WORD *v51 = v53;
            if (a10)
            {
              uint64_t v54 = v21 + (v17 << 7);
              int v55 = *(_DWORD *)(v54 + 4);
              if (v55 < 36) {
                int v56 = v55 + 1;
              }
              else {
                int v56 = 36;
              }
              return j__memmove((void *)(v54 + 88), (char *)a3 + 88, v56);
            }
          }

          return result;
        }

        ++v16;
        uint64_t result = v15;
        uint64_t v13 = v21;
        if (v14 == v16) {
          goto LABEL_15;
        }
      }

      int v84 = v11;
      uint64_t v86 = v13;
      unsigned int v22 = v16;
      uint64_t v23 = v16;
      size_t v24 = 0LL;
      while (1)
      {
        uint64_t v25 = *(unsigned __int16 *)(a8 + 2 * v23);
        uint64_t v26 = (_DWORD *)(v86 + (v25 << 7));
        uint64_t result = (void *)sub_1000D6204(result, v26, (uint64_t)a3, a7, a10);
        if ((_DWORD)result) {
          break;
        }
        ++v23;
        v24 += 2LL;
        uint64_t result = v15;
      }

      int v58 = v26[3];
      int v57 = v26 + 3;
      int v59 = v58 - v84 + a9;
      *int v57 = v84;
      if (a10)
      {
        uint64_t v60 = v86 + (v25 << 7);
        int v61 = *(_DWORD *)(v60 + 4);
        if (v61 < 36) {
          int v62 = v61 + 1;
        }
        else {
          int v62 = 36;
        }
        uint64_t result = j__memmove((void *)(v60 + 88), (char *)a3 + 88, v62);
      }

      if (v22 != (_DWORD)v23)
      {
        __int16 v63 = *(_WORD *)(a8 + 2 * v23);
        uint64_t result = j__memmove((void *)(a8 + 2LL * (v22 + 1)), (const void *)(a8 + 2LL * v22), v24);
        *(_WORD *)(a8 + 2LL * v22) = v63;
      }
    }
  }

  return result;
}

uint64_t sub_1000D5E50(void *a1, unsigned __int16 *a2, int *a3, __int16 *a4)
{
  int v4 = a2[1];
  if (a2[1])
  {
    int v20 = a3;
    uint64_t v21 = a4;
    uint64_t v7 = a1[12];
    __int16 v24 = sub_1000BB868(v7, *a2, 0LL);
    unsigned int v8 = (unsigned int *)(a1[6] + 16 * ((__int16)a2[1] - 1LL));
    int v9 = v8[1];
    if (v9 < 1)
    {
      int v12 = 0x40000000;
      __int16 v11 = 0x4000;
      uint64_t v13 = 0x7FFFFFFFLL;
    }

    else
    {
      unsigned int v10 = *v8;
      int v23 = v9 + *v8;
      unsigned int v22 = v8 + 3;
      __int16 v11 = 0x4000;
      int v12 = 0x40000000;
      LODWORD(v13) = 0x7FFFFFFF;
      do
      {
        uint64_t v16 = *(void *)(*a1 + 8LL * (v10 >> 8));
        unsigned int v17 = *(unsigned __int16 *)(v16 + 8LL * v10);
        if (v17 == 65534)
        {
          while (1)
          {
            unsigned int v18 = sub_1000D5E50(a1);
            if (v18 == 0x7FFFFFFF) {
              break;
            }
            unsigned int v17 = *(unsigned __int16 *)(*(void *)(*a1 + 8LL * (v18 >> 8)) + 8LL * v18);
            if (v17 != 65534) {
              goto LABEL_4;
            }
          }

          int v15 = 0;
        }

        else
        {
LABEL_4:
          unsigned int v14 = sub_1000BB868(v7, v17, 0LL);
          int v15 = sub_1000BBBB0(v7, (uint64_t)&v24, 1u, v14);
        }

        if (*v22 + v15 + *(__int16 *)(v16 + 8LL * v10 + 4) >= v12)
        {
          uint64_t v13 = v13;
        }

        else
        {
          __int16 v11 = v15;
          int v12 = *v22 + v15 + *(__int16 *)(v16 + 8LL * v10 + 4);
          uint64_t v13 = v10;
        }

        ++v10;
      }

      while ((int)v10 < v23);
    }

    int v4 = v12 - v11;
    a3 = v20;
    a4 = v21;
  }

  else
  {
    __int16 v11 = 0;
    uint64_t v13 = 0x7FFFFFFFLL;
  }

  *a3 = v4;
  *a4 = v11;
  return v13;
}

uint64_t sub_1000D5FEC(void *a1, unsigned int a2, int *a3, __int16 *a4, unsigned __int16 a5)
{
  unsigned __int16 v31 = a5;
  if (*(_WORD *)(*(void *)(*a1 + 8LL * (a2 >> 8)) + 8LL * a2 + 2))
  {
    unsigned int v22 = a3;
    int v23 = a4;
    unsigned int v6 = (unsigned int *)(a1[6]
                        + 16 * (*(__int16 *)(*(void *)(*a1 + 8LL * (a2 >> 8)) + 8LL * a2 + 2) - 1LL));
    int v7 = v6[1];
    if (v7 < 1)
    {
      int v10 = 0x40000000;
      __int16 v9 = 0x4000;
      uint64_t v11 = 0x7FFFFFFFLL;
    }

    else
    {
      uint64_t v8 = *v6;
      int v28 = v7 + v8;
      uint64_t v25 = v6 + 3;
      uint64_t v24 = a1[12];
      uint64_t v26 = a1[11];
      uint64_t v27 = (unsigned __int16 *)(*(void *)(a1[2] + 8LL * (a2 >> 8)) + 12LL * a2 + 4);
      __int16 v9 = 0x4000;
      int v10 = 0x40000000;
      uint64_t v11 = 0x7FFFFFFFLL;
      do
      {
        uint64_t v14 = 8LL * (v8 >> 8);
        uint64_t v15 = *(void *)(*a1 + v14);
        uint64_t v16 = v8;
        unsigned int v17 = *(unsigned __int16 *)(v15 + 8 * v16);
        if (sub_100005DBC(v26, *v27, *(unsigned __int16 *)(*(void *)(a1[2] + v14) + 12LL * v16 + 6)))
        {
          if (v17 == 65534)
          {
            uint64_t v18 = v8;
            while (1)
            {
              uint64_t v19 = sub_1000D5FEC(a1, v18, v29, v30, v31);
              if ((_DWORD)v19 == 0x7FFFFFFF) {
                break;
              }
              uint64_t v18 = v19;
              unsigned int v17 = *(unsigned __int16 *)(*(void *)(*a1 + 8LL * (v19 >> 8)) + 8LL * v19);
              if (v17 != 65534) {
                goto LABEL_4;
              }
            }

            int v13 = 0;
          }

          else
          {
LABEL_4:
            unsigned int v12 = sub_1000BB868(v24, v17, 0LL);
            int v13 = sub_1000BBBB0(v24, (uint64_t)&v31, 1u, v12);
          }

          if (*v25 + v13 + *(__int16 *)(v15 + 8 * v16 + 4) >= v10)
          {
            uint64_t v11 = v11;
          }

          else
          {
            __int16 v9 = v13;
            int v10 = *v25 + v13 + *(__int16 *)(v15 + 8 * v16 + 4);
            uint64_t v11 = v8;
          }
        }

        uint64_t v8 = (v8 + 1);
      }

      while ((int)v8 < v28);
    }

    int v20 = v10 - v9;
    a3 = v22;
    a4 = v23;
  }

  else
  {
    int v20 = 0;
    __int16 v9 = 0;
    uint64_t v11 = 0x7FFFFFFFLL;
  }

  *a3 = v20;
  *a4 = v9;
  return v11;
}

uint64_t sub_1000D6204(void *a1, _DWORD *a2, uint64_t a3, unsigned int a4, int a5)
{
  if (*a2 != a4) {
    return 0LL;
  }
  unsigned int v7 = *(unsigned __int16 *)(*(void *)(*a1 + 8LL * (a4 >> 8)) + 8LL * a4);
  int v8 = *(_DWORD *)(a3 + 4);
  if (v7 == 65534)
  {
    unsigned int v7 = *(unsigned __int16 *)(a3 + 2LL * (v8 - 1) + 16);
    if (a2[1] != v8) {
      return 0LL;
    }
  }

  else if (a2[1] != ++v8)
  {
    return 0LL;
  }

  if (v8)
  {
    uint64_t v9 = a1[12];
    if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 1760))
    {
      if (*((unsigned __int16 *)a2 + v8 + 7) == v7)
      {
        if (v8 >= 2)
        {
          LODWORD(v10) = v8 - 1;
          uint64_t result = 1LL;
          if (a5)
          {
            while (1)
            {
              uint64_t v10 = (v10 - 1);
              if (*((unsigned __int16 *)a2 + v10 + 8) != *(unsigned __int16 *)(a3
                                                                                            + 2LL * v10
                                                                                            + 16)
                || *((unsigned __int8 *)a2 + v10 + 88) != *(unsigned __int8 *)(a3 + v10 + 88))
              {
                break;
              }
            }
          }

          else
          {
            while (1)
            {
              LODWORD(v10) = v10 - 1;
              if (*((unsigned __int16 *)a2 + v10 + 8) != *(unsigned __int16 *)(a3
                                                                                            + 2LL * v10
                                                                                            + 16))
                break;
            }
          }

          return 0LL;
        }

        return 1LL;
      }
    }

    else
    {
      int v12 = sub_1000BB868(a1[12], *((unsigned __int16 *)a2 + v8 + 7), 0LL);
      if (v12 == sub_1000BB868(v9, v7, 0LL))
      {
        if (v8 >= 2)
        {
          for (uint64_t i = (v8 - 2) + 8LL; ; --i)
          {
            int v14 = sub_1000BB868(v9, *((unsigned __int16 *)a2 + i), 0LL);
            uint64_t v15 = i - 8;
            uint64_t result = 1LL;
            if (v15 < 1) {
              return result;
            }
          }

          return 0LL;
        }

        return 1LL;
      }
    }

    return 0LL;
  }

  return 1LL;
}

uint64_t sub_1000D6400(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(unsigned __int16 *)(a1 + 2) - *(unsigned __int16 *)(a2 + 2);
  if ((_DWORD)v2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int16 *)(a1 + 4) - *(unsigned __int16 *)(a2 + 4);
  if ((_DWORD)v2) {
    return v2;
  }
  int v4 = *(__int16 *)(a1 + 16);
  uint64_t v2 = (v4 - *(__int16 *)(a2 + 16));
  if ((_DWORD)v2) {
    return v2;
  }
  if (v4 >= 2)
  {
    int v5 = v4 - 1;
    while (1)
    {
      --v5;
      if ((_DWORD)v2) {
        break;
      }
      if (v5 < 1) {
        return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a2 + 12));
      }
    }

    return v2;
  }

  return (*(_DWORD *)(a1 + 12) - *(_DWORD *)(a2 + 12));
}

unint64_t sub_1000D6480(unint64_t result, _BYTE *a2, unsigned __int8 *a3, int a4)
{
  if (result)
  {
    unsigned int v7 = (unsigned __int8 *)result;
    int v8 = sub_1000C88E4((unint64_t)v7);
    int v9 = 0;
    do
    {
      if (v9 > v8) {
        goto LABEL_12;
      }
      unsigned int v10 = v7[v9];
      if (v10 > 0x1F) {
        ++v9;
      }
      if (v10) {
        int v11 = v10 < 0x20;
      }
      else {
        int v11 = 3;
      }
    }

    while (!v11);
    if (v11 != 3) {
      return 0LL;
    }
LABEL_12:
    int v12 = sub_1000C88E4((unint64_t)v7);
    if (v12 < 0)
    {
      int v17 = 0;
LABEL_26:
      a3[v17] = 0;
      if (!a2) {
        return 1LL;
      }
      goto LABEL_27;
    }

    int v13 = 0;
    uint64_t v14 = (v12 + 1);
    while (1)
    {
      int v16 = *v7++;
      int v15 = v16;
      if (!v16)
      {
        a3[v13] = 0;
        if (!a2) {
          return 1LL;
        }
LABEL_27:
        if (!*a2) {
          return 1LL;
        }
        int v20 = sub_1000C88E4((unint64_t)a2);
        int v21 = 0;
        do
        {
          if (v21 > v20) {
            goto LABEL_37;
          }
          unsigned int v22 = a2[v21];
          if (v22 > 0x1F) {
            ++v21;
          }
          if (v22) {
            int v23 = v22 < 0x20;
          }
          else {
            int v23 = 3;
          }
        }

        while (!v23);
        if (v23 == 3)
        {
LABEL_37:
          if (*a2)
          {
            sub_1000C89F8(a3, "\\"", a4);
            int v24 = sub_1000C88E4((unint64_t)a3);
            a3 += v24;
            int v25 = sub_1000C88E4((unint64_t)a2);
            int v13 = 0;
            if (v25 < 0)
            {
LABEL_54:
              uint64_t result = 1LL;
              a3[v13] = 0;
              return result;
            }

            int v26 = a4 - v24;
            uint64_t v27 = (v25 + 1);
            while (1)
            {
              int v30 = *a2++;
              int v29 = v30;
              if (!v30) {
                goto LABEL_54;
              }
              int v31 = v13 + 1;
              if (v13 + 1 >= v26) {
                goto LABEL_55;
              }
              if (v29 == 32)
              {
                int v28 = v13++;
                a3[v28] = 95;
                if (!--v27) {
                  goto LABEL_54;
                }
                continue;
              }

              if (v29 == 92)
              {
LABEL_50:
                a3[v13] = 94;
                int v32 = v13 + 2;
                if (v13 + 2 >= v26) {
                  goto LABEL_57;
                }
              }

              else
              {
                int v32 = v13 + 1;
                int v31 = v13;
                if (v13 + 1 >= v26)
                {
LABEL_57:
                  uint64_t result = 0LL;
                  a3[v31] = 0;
                  return result;
                }
              }

              int v13 = v32;
              a3[v31] = v29;
              if (!--v27) {
                goto LABEL_54;
              }
            }
          }

          return 1LL;
        }

        return 0LL;
      }

      int v17 = v13 + 1;
      if (v13 + 1 >= a4)
      {
LABEL_55:
        uint64_t result = 0LL;
        a3[v13] = 0;
        return result;
      }

      if (v15 == 32)
      {
        a3[v13++] = 95;
        if (!--v14) {
          goto LABEL_26;
        }
      }

      else
      {
        if (v15 == 92) {
          break;
        }
        int v18 = v13 + 1;
        int v17 = v13;
        if (v13 + 1 >= a4)
        {
LABEL_43:
          uint64_t result = 0LL;
          a3[v17] = 0;
          return result;
        }

BOOL sub_1000D6710(uint64_t a1, unint64_t a2, int a3, _WORD *a4, int a5)
{
  int v6 = 0;
  int v7 = 0;
  int v8 = (_WORD *)(a1 + 2);
  int v9 = (_WORD *)a2;
  while (1)
  {
    int v10 = (unsigned __int16)*(v8 - 1);
    switch(v10)
    {
      case '_':
        int v11 = v7 == 1 ? 95 : 32;
        break;
      case '^':
        if (!v7)
        {
          int v7 = 1;
          goto LABEL_3;
        }

        int v11 = 94;
        break;
      case '\\':
        if (v7 != 1)
        {
          BOOL result = 0LL;
          if (!*v8) {
            return result;
          }
          if (v6 >= a3) {
            return result;
          }
          int v7 = 0;
          BOOL result = 0LL;
          v9[v6] = 0;
          a3 = a5;
          int v6 = 0;
          BOOL v13 = v9 == (_WORD *)a2;
          int v9 = a4;
          if (!v13) {
            return result;
          }
          goto LABEL_3;
        }

        int v11 = 92;
        break;
      default:
        BOOL result = 0LL;
        if (v7 == 1) {
          return result;
        }
        int v11 = (unsigned __int16)*(v8 - 1);
        break;
    }

    if (v6 >= a3) {
      return 0LL;
    }
    v9[v6] = v11;
    if (!v11) {
      break;
    }
    int v7 = 0;
    ++v6;
LABEL_3:
    ++v8;
    if (!v10) {
      goto LABEL_26;
    }
  }

  if (v9 == (_WORD *)a2)
  {
    int v7 = 0;
    int v6 = 0;
    int v9 = a4;
    a3 = a5;
    goto LABEL_3;
  }

  ++v6;
  if (v10) {
    return 0LL;
  }
LABEL_26:
  if (!v6)
  {
    *a4 = 0;
    if (a2) {
      goto LABEL_30;
    }
    return 0LL;
  }

  if (!a2) {
    return 0LL;
  }
LABEL_30:
  int v14 = sub_1000CC52C(a2);
  unsigned int v15 = 0;
  while ((int)v15 <= v14)
  {
    unsigned int v16 = *(unsigned __int16 *)(a2 + 2LL * v15);
    if (v16 > 0x1F) {
      ++v15;
    }
    if (v16) {
      int v17 = v16 < 0x20;
    }
    else {
      int v17 = 3;
    }
    if (v17) {
      return v17 == 3;
    }
  }

  return 1LL;
}

unint64_t sub_1000D68AC(unint64_t result, _WORD *a2, unsigned __int16 *a3, int a4)
{
  if (!result) {
    return result;
  }
  int v7 = (unsigned __int16 *)result;
  int v8 = sub_1000CC52C((unint64_t)v7);
  int v9 = 0;
  do
  {
    if (v9 > v8) {
      goto LABEL_12;
    }
    unsigned int v10 = v7[v9];
    if (v10 > 0x1F) {
      ++v9;
    }
    if (v10) {
      int v11 = v10 < 0x20;
    }
    else {
      int v11 = 3;
    }
  }

  while (!v11);
  if (v11 != 3) {
    return 0LL;
  }
LABEL_12:
  int v12 = sub_1000CC52C((unint64_t)v7);
  if (v12 < 0)
  {
    int v16 = 0;
LABEL_26:
    a3[v16] = 0;
    if (!a2) {
      return 1LL;
    }
LABEL_27:
    if (!*a2) {
      return 1LL;
    }
    int v19 = sub_1000CC52C((unint64_t)a2);
    int v20 = 0;
    do
    {
      if (v20 > v19) {
        goto LABEL_37;
      }
      unsigned int v21 = (unsigned __int16)a2[v20];
      if (v21 > 0x1F) {
        ++v20;
      }
      if (v21) {
        int v22 = v21 < 0x20;
      }
      else {
        int v22 = 3;
      }
    }

    while (!v22);
    if (v22 == 3)
    {
LABEL_37:
      if (*a2)
      {
        int v32 = 92;
        BOOL result = sub_1000CC67C(a3, (unsigned __int16 *)&v32, a4);
        if (!(_DWORD)result) {
          return result;
        }
        int v23 = sub_1000CC52C((unint64_t)a3);
        a3 += v23;
        int v24 = sub_1000CC52C((unint64_t)a2);
        int v13 = 0;
        if (v24 < 0)
        {
LABEL_54:
          BOOL result = 1LL;
          goto LABEL_56;
        }

        int v25 = a4 - v23;
        uint64_t v26 = (v24 + 1);
        while (1)
        {
          int v29 = (unsigned __int16)*a2++;
          int v28 = v29;
          if (!v29) {
            goto LABEL_54;
          }
          int v30 = v13 + 1;
          if (v13 + 1 >= v25) {
            goto LABEL_55;
          }
          if (v28 == 32)
          {
            int v27 = v13++;
            a3[v27] = 95;
            if (!--v26) {
              goto LABEL_54;
            }
          }

          else
          {
            if (v28 == 92) {
              break;
            }
            int v31 = v13 + 1;
            int v30 = v13;
            if (v13 + 1 >= v25)
            {
LABEL_58:
              BOOL result = 0LL;
              int v13 = v30;
              goto LABEL_56;
            }

uint64_t sub_1000D6B30(uint64_t a1, int a2)
{
  unsigned int v14 = 0;
  uint64_t v13 = 0LL;
  uint64_t v12 = 0LL;
  uint64_t v11 = 0LL;
  if (a1)
  {
    uint64_t v13 = sub_1000C0BA8(*(void *)(a1 + 6480));
    uint64_t v12 = sub_1000CAEC8(*(void *)(a1 + 6488));
    int v9 = sub_1000BEAC4();
    sub_1000045A4(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    unsigned int v10 = sub_1000CF8F8(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v11);
    nullsub_1(v10);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1LL;
    }
    sub_1000BEAB0((void *)(a1 + 6648));
    int v5 = (int *)sub_1000BE9FC();
    if (!setjmp(v5))
    {
      if (sub_1000C8AB4(*(_BYTE **)(a1 + 8168), "Elvis Magic"))
      {
        int v6 = 4;
      }

      else if (!*(_DWORD *)(a1 + 8160) {
             && ((int v7 = a2) != 0 || qword_1000FDCC0 && (int v7 = *(_DWORD *)(qword_1000FDCC0 + 2152)) != 0))
      }
      {
        if (sub_1000D6D50(a1, v7)
          && (*(_DWORD *)(a1 + 372) = 0,
              *(_DWORD *)(a1 + 364) = 1,
              *(_DWORD *)(a1 + 792) = 0,
              uint64_t v8 = sub_1000C1074(28LL),
              (*(void *)(a1 + 784) = v8) != 0LL))
        {
          *(_DWORD *)(a1 + 6472) = 1;
          int v6 = v14;
        }

        else
        {
          int v6 = 2;
        }
      }

      else
      {
        int v6 = 1;
      }

      unsigned int v14 = v6;
      sub_1000BEA60();
      goto LABEL_9;
    }

    *(_DWORD *)(a1 + 8160) = 1;
  }

  else
  {
    uint64_t v13 = sub_1000C0BA8(0LL);
    uint64_t v12 = sub_1000CAEC8(0LL);
    int v9 = sub_1000BEAC4();
    sub_1000045A4(0LL, 0LL);
    unsigned int v10 = sub_1000CF8F8(0LL, 0LL, &v11);
    nullsub_1(v10);
  }

  unsigned int v14 = 1;
LABEL_9:
  sub_1000504B4(v14);
  sub_1000CF8F8(v10, v11, 0LL);
  sub_1000BEAB0(v9);
  sub_1000CAEC8(v12);
  sub_1000C0BA8(v13);
  return v14;
}

uint64_t sub_1000D6D50(uint64_t a1, int a2)
{
  int v3 = (int)sub_1000597E0(*(void *)a1) / 1000 * a2;
  int v4 = v3 / *(_DWORD *)(a1 + 304);
  sub_10003FE8C(a1);
  *(_DWORD *)(a1 + 368) = v4;
  *(_DWORD *)(a1 + 372) = 0;
  if (!v3 || (uint64_t result = sub_1000C1074(2LL * v3), (*(void *)(a1 + 376) = result) != 0LL))
  {
    if (!*(void *)(a1 + 424) && (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 2848)))
    {
      int v8 = sub_100059840(*(void *)a1);
      uint64_t v9 = sub_1000C1074(v8);
      *(void *)(a1 + 424) = v9;
      if (!v9) {
        goto LABEL_12;
      }
    }

    if (v4)
    {
      int v6 = 50 * v4 + 4;
      *(_DWORD *)(a1 + 400) = 0;
      uint64_t v7 = sub_1000C1074(v6);
      *(void *)(a1 + 392) = v7;
      if (!v7)
      {
LABEL_12:
        sub_10003FE8C(a1);
        return 0LL;
      }

      *(_DWORD *)(a1 + 384) = v6;
    }

    return 1LL;
  }

  return result;
}

uint64_t sub_1000D6E48(uint64_t a1, char *a2, int a3)
{
  unsigned int v75 = 0;
  int v74 = 0;
  uint64_t v73 = 0LL;
  uint64_t v72 = 0LL;
  __int128 v70 = 0LL;
  uint64_t v71 = 0LL;
  __int128 v69 = 0LL;
  if (a1)
  {
    uint64_t v73 = sub_1000C0BA8(*(void *)(a1 + 6480));
    uint64_t v72 = sub_1000CAEC8(*(void *)(a1 + 6488));
    __int128 v69 = sub_1000BEAC4();
    sub_1000045A4(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    __int128 v70 = sub_1000CF8F8(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v71);
    nullsub_1(v70);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1LL;
    }
    sub_1000BEAB0((void *)(a1 + 6648));
    uint64_t v7 = (int *)sub_1000BE9FC();
    if (!setjmp(v7))
    {
      if (sub_1000C8AB4(*(_BYTE **)(a1 + 8168), "Elvis Magic"))
      {
        int v8 = 4;
      }

      else if (*(_DWORD *)(a1 + 8160) || !*(void *)(a1 + 5512))
      {
        int v8 = 1;
      }

      else
      {
        unsigned int v75 = sub_1000510C4(a1);
        uint64_t v68 = 0LL;
        int v67 = 0;
        if (*(_DWORD *)(a1 + 6472))
        {
          if (*(_DWORD *)(a1 + 752) == 7) {
            int v74 = 1;
          }
          if (!a3
            || (sub_1000C896C(v76, a2, 256),
                sub_1000C89F8(v76, "elvisdump.psa", 256),
                (unsigned int v75 = sub_1000491C0(a1, (const char *)v76)) == 0))
          {
            sub_1000C896C(v76, a2, 256);
            sub_1000C89F8(v76, "elvisdump.rpr", 256);
            uint64_t v9 = j__fopen((const char *)v76, "wb");
            if (v9)
            {
              int v17 = v9;
              sub_1000C0BFC(0x400uLL, v10, v11, v12, v13, v14, v15, v16);
              int v19 = (char *)v18;
              sub_1000D8F60(v18, v20, v21, v22, v23, v24, v25, v26);
              int v28 = v27;
              int v29 = v27;
              sub_1000D8FE8(v27, "FileType", "ElvisDump");
              sub_1000D911C(v28, "FileVersion", 3);
              int v30 = (char *)sub_10009AA68();
              sub_1000D8FE8(v28, "ElvisVersion", v30);
              int v31 = sub_10009AA58();
              sub_1000D911C(v28, "ElvisMajorVersion", v31);
              int v32 = sub_10009AA60();
              sub_1000D911C(v28, "ElvisMinorVersion", v32);
              __int128 v33 = (char *)sub_1000B31D0(*(uint64_t **)(a1 + 8));
              sub_1000D8FE8(v28, "ElvisLanguage", v33);
              __int128 v34 = (char *)sub_1000D7718(*(_DWORD *)(a1 + 752));
              sub_1000D8FE8(v28, "RecogType", v34);
              unsigned int v75 = sub_100046060(a1, (_DWORD *)&v68 + 1);
              unsigned int v75 = sub_10004026C(a1, &v68, &v67);
              sub_1000D911C(v28, "SampleRate", SHIDWORD(v68));
              sub_1000D911C(v28, "RecogModelProperties", v68);
              sub_1000D911C(v28, "TTSModelProperties", v67);
              uint64_t v35 = *(void *)(a1 + 48);
              if (v35)
              {
                unsigned int v36 = sub_1000B2524(v35);
                if (v36 > 4) {
                  __int128 v37 = "Unknown";
                }
                else {
                  __int128 v37 = off_1000FA410[v36];
                }
                sub_1000D8FE8(v29, "TTSEncoding", v37);
              }

              if (qword_1000FDCC0) {
                uint64_t v39 = *(void *)(qword_1000FDCC0 + 5464);
              }
              else {
                LODWORD(v39) = 0;
              }
              sub_1000D911C(v29, "VocMaxNumAddedWords", v39);
              sub_1000D773C(a1, v29);
              if (v74) {
                sub_1000D79B0(a1, v29);
              }
              sub_1000D7C24((void *)a1, v29);
              if (v74) {
                sub_1000D85F0(a1, v29);
              }
              if (qword_1000FDCC0 && *(_DWORD *)(qword_1000FDCC0 + 2848)) {
                int v40 = 0;
              }
              else {
                int v40 = sub_100059840(*(void *)a1);
              }
              sub_1000D911C(v29, "FESnapshotSize", v40);
              if (sub_100011CD8(*(void *)(a1 + 16)))
              {
                int v41 = sub_100011CD8(*(void *)(a1 + 16));
                sub_1000D911C(v29, "DynSilSnapshotSize", v41);
              }

              int v42 = sub_1000BBCE8(*(uint64_t **)(a1 + 8));
              sub_1000D911C(v29, "VocCRC", v42);
              sub_100005EFC(*(void *)(a1 + 16), v43, v44, v45, v46, v47, v48);
              int v49 = *(_DWORD *)(a1 + 5504);
              if (v49 == -1) {
                int v49 = sub_100007200(*(void *)(a1 + 16), 0LL);
              }
              sub_1000D911C(v29, "AMCRC", v49);
              sub_1000D911C(v29, "FeCRC", *(_DWORD *)(a1 + 416));
              if (v74) {
                sub_1000D911C(v29, "FeTalkAheadCRC", *(_DWORD *)(a1 + 432));
              }
              sub_1000D911C(v29, "NumConstraints", *(_DWORD *)(a1 + 1320));
              if (*(int *)(a1 + 1320) >= 1)
              {
                uint64_t v50 = 0LL;
                do
                {
                  unsigned int v51 = *(_DWORD *)(a1 + 1324 + 4 * v50);
                  sprintf(v19, "Constraint[%d]", v50);
                  sub_1000D911C(v29, (unsigned __int8 *)v19, v51);
                  uint64_t v52 = sub_10002F660(*(void *)(a1 + 72), v51);
                  int v53 = (char *)sub_100025C9C(v52);
                  sprintf(v19, "ConstraintName[%d]", v50);
                  sub_1000D8FE8(v29, (unsigned __int8 *)v19, v53);
                  ++v50;
                }

                while (v50 < *(int *)(a1 + 1320));
              }

              if (*(_DWORD *)(a1 + 752) == 8) {
                sub_1000D88A8(a1, v29);
              }
              uint64_t v54 = (char *)sub_1000C1074(*(int *)(a1 + 400) + 1LL);
              if (v54)
              {
                uint64_t v55 = (uint64_t)v54;
                if (*(int *)(a1 + 400) >= 1)
                {
                  uint64_t v56 = 0LL;
                  do
                  {
                    v54[v56] = *(_BYTE *)(*(void *)(a1 + 392) + v56);
                    ++v56;
                  }

                  while (v56 < *(int *)(a1 + 400));
                }

                sub_1000D8FE8(v29, "OperationRecordArray", v54);
                sub_1000C0EF8(v55);
              }

              int v66 = 0;
              uint64_t v65 = 0LL;
              sub_100048C94(a1, &v66, (_DWORD *)&v65 + 1, &v65);
              sub_1000D911C(v29, "FEFeatureQueueLength", v66);
              sub_1000D911C(v29, "FEFeatureQueueCurrent", SHIDWORD(v65));
              sub_1000D911C(v29, "FEFeatureQueueHigh", v65);
              uint64_t v57 = *(void *)(a1 + 440);
              if (v57)
              {
                uint64_t v58 = *(void *)(a1 + 440);
                int v66 = 0;
                sub_1000D911C(v29, "UttDetSpeechStartFrame", *(_DWORD *)(v57 + 28));
                sub_1000D911C(v29, "UttDetFinalSilenceStartFrame", *(_DWORD *)(v58 + 32));
                unsigned int v75 = sub_1000483D8(a1, -2, &v66);
                if (!v75) {
                  sub_1000D911C(v29, "UttNumFrames", v66);
                }
                unsigned int v75 = sub_100048460(a1, 0xFFFFFFFE, &v66);
                if (!v75) {
                  sub_1000D911C(v29, "UttNumFramesRecognized", v66);
                }
              }

              sub_1000D919C(v29, v17);
              sub_1000D8F84((void **)v29);
              if (!qword_1000FDCC0 || !*(_DWORD *)(qword_1000FDCC0 + 2848))
              {
                int v59 = *(const void **)(a1 + 408);
                int v60 = sub_100059840(*(void *)a1);
                j__fwrite(v59, v60, 1uLL, v17);
                if (v74)
                {
                  int v61 = *(const void **)(a1 + 424);
                  int v62 = sub_100059840(*(void *)a1);
                  j__fwrite(v61, v62, 1uLL, v17);
                }
              }

              __int16 v63 = *(const void **)(a1 + 5480);
              if (v63)
              {
                int v64 = sub_100011CD8(*(void *)(a1 + 16));
                j__fwrite(v63, v64, 1uLL, v17);
              }

              j__fclose(v17);
              uint64_t v38 = (uint64_t)v19;
            }

            else
            {
              uint64_t v38 = 0LL;
              unsigned int v75 = 9;
            }

            sub_1000C896C(v76, a2, 256);
            sub_1000C89F8(v76, "elvisdump.utt", 256);
            unsigned int v75 = sub_1000D8B30(a1);
            sub_1000C896C(v76, a2, 256);
            sub_1000C89F8(v76, "elvisdump.wav", 256);
            unsigned int v75 = sub_1000D8CB0(a1, (const char *)v76);
            sub_1000C0EF8(v38);
          }
        }

        else
        {
          unsigned int v75 = 7;
        }

        int v8 = v75;
      }

      unsigned int v75 = v8;
      sub_1000BEA60();
      goto LABEL_9;
    }

    *(_DWORD *)(a1 + 8160) = 1;
  }

  else
  {
    uint64_t v73 = sub_1000C0BA8(0LL);
    uint64_t v72 = sub_1000CAEC8(0LL);
    __int128 v69 = sub_1000BEAC4();
    sub_1000045A4(0LL, 0LL);
    __int128 v70 = sub_1000CF8F8(0LL, 0LL, &v71);
    nullsub_1(v70);
  }

  unsigned int v75 = 1;
LABEL_9:
  sub_1000504B4(v75);
  sub_1000CF8F8(v70, v71, 0LL);
  sub_1000BEAB0(v69);
  sub_1000CAEC8(v72);
  sub_1000C0BA8(v73);
  return v75;
}

const char *sub_1000D7718(unsigned int a1)
{
  if (a1 > 0xA) {
    return "UNKNOWN_RECOG_TYPE";
  }
  else {
    return off_1000FA438[a1];
  }
}

uint64_t sub_1000D773C(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t result = sub_1000D911C(a2, "LengthLMContext", *(_DWORD *)(a1 + 776));
  if (*(int *)(v3 + 776) >= 1)
  {
    __int128 v34 = a2;
    sub_1000C0BFC(0x400uLL, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v13 = v12;
    __int128 v33 = sub_1000C8B7C("LMContext[1000]");
    if (*(int *)(v3 + 776) >= 1)
    {
      uint64_t v14 = 0LL;
      do
      {
        int v15 = *(_DWORD *)(*(void *)(v3 + 768) + 4 * v14);
        sprintf(v33, "LMContext[%d]", v14);
        sub_1000D911C(v34, (unsigned __int8 *)v33, v15);
        ++v14;
        uint64_t v16 = *(int *)(v3 + 776);
      }

      while (v14 < v16);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0LL;
        uint64_t v35 = v13;
        uint64_t v36 = v3;
        do
        {
          unsigned int v18 = *(_DWORD *)(*(void *)(v3 + 768) + 4 * v17);
          int v19 = sub_1000C88E4((unint64_t)v13);
          uint64_t v20 = 1024LL - v19;
          unint64_t v21 = (unint64_t)&v13[v19];
          if (v18 == -1)
          {
            sub_1000C896C(&v13[v19], "UNKNOWN", v20);
            unint64_t v22 = sub_1000C88E4(v21);
            if ((int)v22 >= 1)
            {
LABEL_14:
              uint64_t v23 = v22;
              int v24 = 1;
              int v25 = 1 - v22;
              do
              {
                uint64_t v27 = v23 - 1;
                int v28 = (unsigned __int8 *)(v21 + (v23 - 1));
                int v29 = *v28;
                if (v29 == 13 || v29 == 10)
                {
                  unint64_t v26 = (v22 + 1);
                  else {
                    int v31 = v20;
                  }
                  j__memmove(v28 + 2, v28 + 1, v31 + v25);
                  unsigned __int8 *v28 = 92;
                  if (v23 <= v20)
                  {
                    if (v29 == 13) {
                      char v32 = 114;
                    }
                    else {
                      char v32 = 110;
                    }
                    *(_BYTE *)(v21 + v23) = v32;
                  }
                }

                else
                {
                  unint64_t v26 = v22;
                }

                ++v25;
                --v23;
                unint64_t v22 = v26;
              }

              while ((unint64_t)(v27 + 1) > 1);
              uint64_t v13 = v35;
              uint64_t v3 = v36;
              if (!v24) {
                *(_BYTE *)(v21 + v20) = 0;
              }
            }
          }

          else
          {
            sub_1000BC098(*(uint64_t **)(v3 + 8), v18, v20, v21, 0);
            unint64_t v22 = sub_1000C88E4(v21);
          }

          sub_1000C89F8(v13, " ", 1024);
          ++v17;
        }

        while (v17 < *(int *)(v3 + 776));
      }
    }

    sub_1000D8FE8(v34, "LMContext", (char *)v13);
    sub_1000C0EF8((uint64_t)v33);
    return sub_1000C0EF8((uint64_t)v13);
  }

  return result;
}

uint64_t sub_1000D79B0(uint64_t a1, void *a2)
{
  uint64_t v3 = a1;
  uint64_t result = sub_1000D911C(a2, "LengthTalkAheadLMContext", *(_DWORD *)(a1 + 792));
  if (*(int *)(v3 + 792) >= 1)
  {
    __int128 v34 = a2;
    sub_1000C0BFC(0x400uLL, v5, v6, v7, v8, v9, v10, v11);
    uint64_t v13 = v12;
    __int128 v33 = sub_1000C8B7C("TalkAheadLMContext[1000]");
    if (*(int *)(v3 + 792) >= 1)
    {
      uint64_t v14 = 0LL;
      do
      {
        int v15 = *(_DWORD *)(*(void *)(v3 + 784) + 4 * v14);
        sprintf(v33, "TalkAheadLMContext[%d]", v14);
        sub_1000D911C(v34, (unsigned __int8 *)v33, v15);
        ++v14;
        uint64_t v16 = *(int *)(v3 + 792);
      }

      while (v14 < v16);
      if ((int)v16 >= 1)
      {
        uint64_t v17 = 0LL;
        uint64_t v35 = v13;
        uint64_t v36 = v3;
        do
        {
          unsigned int v18 = *(_DWORD *)(*(void *)(v3 + 784) + 4 * v17);
          int v19 = sub_1000C88E4((unint64_t)v13);
          uint64_t v20 = 1024LL - v19;
          unint64_t v21 = (unint64_t)&v13[v19];
          if (v18 == -1)
          {
            sub_1000C896C(&v13[v19], "UNKNOWN", v20);
            unint64_t v22 = sub_1000C88E4(v21);
            if ((int)v22 >= 1)
            {
LABEL_14:
              uint64_t v23 = v22;
              int v24 = 1;
              int v25 = 1 - v22;
              do
              {
                uint64_t v27 = v23 - 1;
                int v28 = (unsigned __int8 *)(v21 + (v23 - 1));
                int v29 = *v28;
                if (v29 == 13 || v29 == 10)
                {
                  unint64_t v26 = (v22 + 1);
                  else {
                    int v31 = v20;
                  }
                  j__memmove(v28 + 2, v28 + 1, v31 + v25);
                  unsigned __int8 *v28 = 92;
                  if (v23 <= v20)
                  {
                    if (v29 == 13) {
                      char v32 = 114;
                    }
                    else {
                      char v32 = 110;
                    }
                    *(_BYTE *)(v21 + v23) = v32;
                  }
                }

                else
                {
                  unint64_t v26 = v22;
                }

                ++v25;
                --v23;
                unint64_t v22 = v26;
              }

              while ((unint64_t)(v27 + 1) > 1);
              uint64_t v13 = v35;
              uint64_t v3 = v36;
              if (!v24) {
                *(_BYTE *)(v21 + v20) = 0;
              }
            }
          }

          else
          {
            sub_1000BC098(*(uint64_t **)(v3 + 8), v18, v20, v21, 0);
            unint64_t v22 = sub_1000C88E4(v21);
          }

          sub_1000C89F8(v13, " ", 1024);
          ++v17;
        }

        while (v17 < *(int *)(v3 + 792));
      }
    }

    sub_1000D8FE8(v34, "TalkAheadLMContext", (char *)v13);
    sub_1000C0EF8((uint64_t)v33);
    return sub_1000C0EF8((uint64_t)v13);
  }

  return result;
}

uint64_t sub_1000D7C24(void *a1, void *a2)
{
  uint64_t v2 = (uint64_t)a1;
  int v167 = 0;
  if (!a1[13] || a1[689] == a1[14]) {
    uint64_t v3 = (int **)(a1 + 101);
  }
  else {
    uint64_t v3 = (int **)(a1 + 100);
  }
  int v4 = *v3;
  uint64_t v5 = sub_1000C8B7C("ChoiceConstraintScore[1000]");
  uint64_t v6 = v5;
  if (v4[1] >= 1)
  {
    uint64_t v7 = 0LL;
    uint64_t v155 = (unsigned int *)(v2 + 1324);
    int v156 = v4;
    int v157 = v5;
    uint64_t v162 = v2;
    do
    {
      int v166 = 0;
      uint64_t v8 = sub_100041A00((void *)v2, v7, &v166, 0LL);
      if (!v8 || v166 < 1) {
        goto LABEL_7;
      }
      uint64_t v16 = v8;
      sub_1000C0BFC(20LL * v166, v9, v10, v11, v12, v13, v14, v15);
      unsigned int v18 = v17;
      if (v166 >= 1)
      {
        uint64_t v19 = 0LL;
        uint64_t v20 = v17;
        do
        {
          sprintf(v20, "0x%08x ", v16[v19]);
          v20 += (int)sub_1000C88E4((unint64_t)v20);
          ++v19;
        }

        while (v19 < v166);
      }

      sprintf(v6, "Choice[%d]", v7);
      sub_1000D8FE8(a2, (unsigned __int8 *)v6, v18);
      sub_1000C0EF8((uint64_t)v18);
      sub_1000C0BFC(0x200uLL, v21, v22, v23, v24, v25, v26, v27);
      int v29 = v28;
      if (sub_10004D20C(v2, v7, 128, v28, &v167))
      {
        if (v7 < *v4) {
          goto LABEL_101;
        }
        goto LABEL_7;
      }

      uint64_t v163 = (uint64_t)v29;
      uint64_t v159 = v7;
      int v30 = sub_1000B324C(*(uint64_t **)(v2 + 8));
      int v31 = sub_1000B3288(*(uint64_t **)(v2 + 8));
      uint64_t v32 = v167 * (uint64_t)(2 * (v31 + v30) + 7);
      uint64_t v33 = v32 + 1;
      sub_1000C0BFC(v32 + 1, v34, v35, v36, v37, v38, v39, v40);
      int v42 = v41;
      *int v41 = 34;
      if (v167 >= 1)
      {
        int v43 = 0;
        do
        {
          int v44 = sub_1000C88E4((unint64_t)v42);
          int v45 = sub_1000BB8B0(*(void *)(v2 + 8), *(_DWORD *)(v163 + 4LL * v43));
          sub_1000BBFB0(*(uint64_t **)(v2 + 8), v45, v33 - v44, (uint64_t)&v42[v44], 1);
          uint64_t v46 = v43 + 1LL;
          int v47 = v167;
          if (v43 + 1 >= v167) {
            goto LABEL_18;
          }
          if (*(_DWORD *)(v163 + 4 * v46) == -2)
          {
            sub_1000C89F8(v42, "(S)", v32 + 1);
            int v47 = v167;
            LODWORD(v46) = v43 + 2;
            if (v43 + 2 < v167)
            {
LABEL_25:
              sub_1000C89F8(v42, " ", v32 + 1);
              int v47 = v167;
            }
          }

          else if ((int)v46 < v167)
          {
            goto LABEL_25;
          }

uint64_t sub_1000D85F0(uint64_t result, void *a2)
{
  if (*(int *)(result + 1296) >= 1)
  {
    uint64_t v3 = result;
    int v4 = sub_1000C8B7C("IsoChoiceFullScores[1000]");
    int v5 = *(_DWORD *)(v3 + 436);
    sub_1000D911C(a2, "TalkAheadFirstUtteranceId", v5);
    int v6 = 0;
    int v28 = a2;
    uint64_t v25 = v3;
    int v24 = v5;
    do
    {
      int v29 = 0;
      int v7 = v6 + v5;
      if (sub_10004F474(v3, v6 + v5, &v29))
      {
        uint64_t v26 = v29;
        uint64_t v27 = *(void *)(v3 + 1312);
        uint64_t v15 = (int *)(v27 + ((uint64_t)v29 << 7));
        sub_1000C0BFC(20 * *v15 + 20, v8, v9, v10, v11, v12, v13, v14);
        uint64_t v17 = v16;
        sprintf(v4, "IsoChoiceContext[%u]", v6 + v5);
        sprintf(v17, "0x%08x ", v15[1]);
        sub_1000D8FE8(a2, (unsigned __int8 *)v4, v17);
        if (*v15 >= 1)
        {
          uint64_t v18 = 0LL;
          uint64_t v19 = v17;
          do
          {
            sprintf(v19, "0x%08x ", v15[v18 + 22]);
            v19 += (int)sub_1000C88E4((unint64_t)v19);
            ++v18;
          }

          while (v18 < *v15);
          sprintf(v4, "IsoChoice[%u]", v7);
          sub_1000D8FE8(v28, (unsigned __int8 *)v4, v17);
          if (*v15 >= 1)
          {
            uint64_t v20 = 0LL;
            uint64_t v21 = v17;
            do
            {
              sprintf(v21, "%ld ", *(int *)(v27 + (v26 << 7) + 8 + 4 * v20));
              v21 += (int)sub_1000C88E4((unint64_t)v21);
              ++v20;
            }

            while (v20 < *v15);
          }

          sprintf(v4, "IsoChoiceFullScores[%u]", v7);
          sub_1000D8FE8(v28, (unsigned __int8 *)v4, v17);
          if (*v15 >= 1)
          {
            uint64_t v22 = 0LL;
            uint64_t v23 = v17;
            do
            {
              sprintf(v23, "%ld ", *(int *)(v27 + (v26 << 7) + 48 + 4 * v22));
              v23 += (int)sub_1000C88E4((unint64_t)v23);
              ++v22;
            }

            while (v22 < *v15);
          }

          sprintf(v4, "IsoChoiceScores[%u]", v7);
          a2 = v28;
          sub_1000D8FE8(v28, (unsigned __int8 *)v4, v17);
          uint64_t v3 = v25;
          int v5 = v24;
        }

        sub_1000C0EF8((uint64_t)v17);
      }

      ++v6;
    }

    while (v6 != 0x7FFFFFFF);
    return sub_1000C0EF8((uint64_t)v4);
  }

  return result;
}

uint64_t sub_1000D88A8(uint64_t a1, void *a2)
{
  uint64_t v2 = a2;
  unint64_t v4 = *(unsigned int *)(a1 + 6232);
  uint64_t result = sub_1000D911C(a2, "EnrollmentLength", v4);
  if (*(int *)(a1 + 6232) >= 1)
  {
    int v6 = (int *)(a1 + 5720);
    int v7 = sub_1000B324C(*(uint64_t **)(a1 + 8));
    int v15 = 2 * (sub_1000B3288(*(uint64_t **)(a1 + 8)) + v7) + 7;
    if (v15 <= 11) {
      int v15 = 11;
    }
    int v35 = v15 * v4;
    int v16 = v15 * v4 + 1;
    sub_1000C0BFC(v15 * (int)v4 + 1LL, v8, v9, v10, v11, v12, v13, v14);
    uint64_t v18 = v17;
    unsigned __int8 *v17 = 34;
    if ((int)v4 >= 1)
    {
      unint64_t v19 = 0LL;
      do
      {
        int v20 = sub_1000C88E4((unint64_t)v18);
        sub_1000BC098(*(uint64_t **)(a1 + 8), v6[v19++], v16 - v20, (uint64_t)&v18[v20], 0);
        if (v19 < v4) {
          sub_1000C89F8(v18, " ", v16);
        }
      }

      while (v4 != v19);
    }

    unint64_t v21 = sub_1000C88E4((unint64_t)v18);
    if ((int)v21 >= 1)
    {
      uint64_t v36 = v35 + 1LL;
      uint64_t v34 = v2;
      uint64_t v22 = v21;
      int v23 = 2 - v21;
      int v24 = 1;
      do
      {
        uint64_t v26 = v22 - 1;
        uint64_t v27 = &v18[(v22 - 1)];
        int v28 = *v27;
        if (v28 == 13 || v28 == 10)
        {
          unint64_t v25 = (v21 + 1);
          if ((int)v21 < v35)
          {
            int v30 = v21;
          }

          else
          {
            int v24 = 0;
            int v30 = v35;
          }

          j__memmove(v27 + 2, v27 + 1, v30 + v23);
          *uint64_t v27 = 92;
          if (v22 <= v36)
          {
            if (v28 == 13) {
              char v31 = 114;
            }
            else {
              char v31 = 110;
            }
            v18[v22] = v31;
          }
        }

        else
        {
          unint64_t v25 = v21;
        }

        ++v23;
        --v22;
        unint64_t v21 = v25;
      }

      while ((unint64_t)(v26 + 1) > 1);
      uint64_t v2 = v34;
      int v16 = v35 + 1;
      if (!v24) {
        v18[v36] = 0;
      }
    }

    sub_1000C89F8(v18, "", v16);
    sub_1000D8FE8(v2, "EnrollmentText", (char *)v18);
    *uint64_t v18 = 0;
    if ((int)v4 >= 1)
    {
      do
      {
        int v32 = sub_1000C88E4((unint64_t)v18);
        int v33 = *v6++;
        sprintf((char *)&v18[v32], "0x%08x ", v33);
        --v4;
      }

      while (v4);
    }

    sub_1000D8FE8(v2, "EnrollmentIds", (char *)v18);
    return sub_1000C0EF8((uint64_t)v18);
  }

  return result;
}

uint64_t sub_1000D8B30(uint64_t a1)
{
  unsigned int v9 = 0;
  uint64_t v8 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v6 = 0LL;
  if (a1)
  {
    uint64_t v8 = sub_1000C0BA8(*(void *)(a1 + 6480));
    uint64_t v7 = sub_1000CAEC8(*(void *)(a1 + 6488));
    unint64_t v4 = sub_1000BEAC4();
    sub_1000045A4(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    int v5 = sub_1000CF8F8(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v6);
    nullsub_1(v5);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1LL;
    }
    sub_1000BEAB0((void *)(a1 + 6648));
    uint64_t v3 = (int *)sub_1000BE9FC();
    if (!setjmp(v3))
    {
      sub_1000BEA60();
      goto LABEL_9;
    }

    *(_DWORD *)(a1 + 8160) = 1;
  }

  else
  {
    uint64_t v8 = sub_1000C0BA8(0LL);
    uint64_t v7 = sub_1000CAEC8(0LL);
    unint64_t v4 = sub_1000BEAC4();
    sub_1000045A4(0LL, 0LL);
    int v5 = sub_1000CF8F8(0LL, 0LL, &v6);
    nullsub_1(v5);
  }

  unsigned int v9 = 1;
LABEL_9:
  sub_1000504B4(v9);
  sub_1000CF8F8(v5, v6, 0LL);
  sub_1000BEAB0(v4);
  sub_1000CAEC8(v7);
  sub_1000C0BA8(v8);
  return v9;
}

uint64_t sub_1000D8CB0(uint64_t a1, const char *a2)
{
  unsigned int v17 = 0;
  uint64_t v16 = 0LL;
  uint64_t v15 = 0LL;
  uint64_t v14 = 0LL;
  if (a1)
  {
    uint64_t v16 = sub_1000C0BA8(*(void *)(a1 + 6480));
    uint64_t v15 = sub_1000CAEC8(*(void *)(a1 + 6488));
    uint64_t v12 = sub_1000BEAC4();
    sub_1000045A4(*(void *)(a1 + 6496), *(void *)(a1 + 6504));
    uint64_t v13 = sub_1000CF8F8(*(void **)(a1 + 6520), *(void *)(a1 + 6528), &v14);
    nullsub_1(v13);
    if (*(_DWORD *)(a1 + 8160)) {
      return 1LL;
    }
    sub_1000BEAB0((void *)(a1 + 6648));
    int v5 = (int *)sub_1000BE9FC();
    if (!setjmp(v5))
    {
      if (*(void *)(a1 + 376))
      {
        int v6 = sub_1000597E0(*(void *)a1);
        size_t v7 = (*(_DWORD *)(a1 + 304) * *(_DWORD *)(a1 + 372));
        __sprintf_chk( __ptr,  0,  0x400uLL,  "NIST_1A\n 1024\n sample_count -i %d\n sample_rate -i %d\n sample_n_bytes -i %d\n sample_byte_format -s2 %s\n channel_count -i %d\n sample_coding -s3 %s\n end_head\n",  *(_DWORD *)(a1 + 304) * *(_DWORD *)(a1 + 372),  v6,  2,  "01",  1,  "pcm");
        int v8 = sub_1000C88E4((unint64_t)__ptr);
        if (v8 <= 1023) {
          memset(&__ptr[v8], 32, (1023 - v8) + 1LL);
        }
        unsigned int v9 = j__fopen(a2, "wb");
        if (v9)
        {
          uint64_t v10 = v9;
          j__fwrite(__ptr, 1uLL, 0x400uLL, v9);
          if ((int)v7 >= 1)
          {
            uint64_t v11 = *(const void **)(a1 + 376);
            if (v11) {
              j__fwrite(v11, 2uLL, v7, v10);
            }
          }

          j__fclose(v10);
        }

        else
        {
          unsigned int v17 = 9;
        }
      }

      sub_1000BEA60();
      goto LABEL_9;
    }

    *(_DWORD *)(a1 + 8160) = 1;
  }

  else
  {
    uint64_t v16 = sub_1000C0BA8(0LL);
    uint64_t v15 = sub_1000CAEC8(0LL);
    uint64_t v12 = sub_1000BEAC4();
    sub_1000045A4(0LL, 0LL);
    uint64_t v13 = sub_1000CF8F8(0LL, 0LL, &v14);
    nullsub_1(v13);
  }

  unsigned int v17 = 1;
LABEL_9:
  sub_1000504B4(v17);
  sub_1000CF8F8(v13, v14, 0LL);
  sub_1000BEAB0(v12);
  sub_1000CAEC8(v15);
  sub_1000C0BA8(v16);
  return v17;
}

void sub_1000D8F60( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(void *)(v8 + 24) = "VstTextFile";
}

void **sub_1000D8F84(void **result)
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *result;
    if (*result)
    {
      do
      {
        uint64_t v3 = (void *)*v2;
        sub_1000C0EF8(v2[2]);
        sub_1000C0EF8(v2[3]);
        sub_1000C0EF8((uint64_t)v2);
        *uint64_t v1 = v3;
        uint64_t v2 = v3;
      }

      while (v3);
    }

    v1[3] = 0LL;
    return (void **)sub_1000C0EF8((uint64_t)v1);
  }

  return result;
}

uint64_t sub_1000D8FE8(void *a1, unsigned __int8 *a2, char *a3)
{
  if (!a2) {
    return 0LL;
  }
  int v4 = *a2;
  if (*a2)
  {
    uint64_t v7 = 1LL;
    int v8 = *a2;
    while ((v8 & 0x80) == 0 && (byte_1000F1D84[v8] & 0x20) != 0)
    {
      int v8 = a2[v7++];
      if (!v8)
      {
        uint64_t v9 = 1LL;
        while ((v4 & 0x80) != 0 || (byte_1000F1D84[v4] & 0x10) == 0)
        {
          int v4 = a2[v9++];
          if (!v4)
          {
            uint64_t v11 = a1;
            while (1)
            {
              uint64_t v11 = (void *)*v11;
              if (!v11) {
                break;
              }
              if (!sub_1000C8AB4((_BYTE *)v11[2], a2))
              {
                sub_100006EFC(v11[3]);
                v11[3] = sub_1000C8B7C(a3);
                return 1LL;
              }
            }

            uint64_t v12 = sub_1000C8B7C((char *)a2);
            uint64_t v13 = sub_1000C8B7C(a3);
            sub_1000C0BFC(0x20uLL, v14, v15, v16, v17, v18, v19, v20);
            v21[2] = v12;
            v21[3] = v13;
            uint64_t v22 = (void *)a1[1];
            int v23 = a1;
            if (v22)
            {
              void *v21 = *v22;
              v21[1] = v22;
              if (*v22) {
                *(void *)(*v22 + 8LL) = v21;
              }
              int v23 = v22;
            }

            void *v23 = v21;
            a1[1] = v21;
            return 1LL;
          }
        }

        return 0LL;
      }
    }
  }

  return 0LL;
}

uint64_t sub_1000D911C(void *a1, unsigned __int8 *a2, int a3)
{
  return sub_1000D8FE8(a1, a2, v6);
}

uint64_t sub_1000D919C(void *a1, FILE *a2)
{
  uint64_t v3 = (void *)*a1;
  j__fseek(a2, 0LL, 0);
  int v4 = sub_1000C88E4((unint64_t)"VstTextFile");
  j__fwrite("VstTextFile", v4, 1uLL, a2);
  int v5 = sub_1000C88E4((unint64_t)" ");
  j__fwrite(" ", v5, 1uLL, a2);
  int v6 = sub_1000C88E4((unint64_t)"1");
  j__fwrite("1", v6, 1uLL, a2);
  int v7 = sub_1000C88E4((unint64_t)"\n");
  j__fwrite("\n", v7, 1uLL, a2);
  for (; v3; uint64_t v3 = (void *)*v3)
  {
    int v8 = (const void *)v3[2];
    int v9 = sub_1000C88E4((unint64_t)v8);
    j__fwrite(v8, v9, 1uLL, a2);
    int v10 = sub_1000C88E4((unint64_t)" ");
    j__fwrite(" ", v10, 1uLL, a2);
    uint64_t v11 = (const void *)v3[3];
    int v12 = sub_1000C88E4((unint64_t)v11);
    j__fwrite(v11, v12, 1uLL, a2);
    int v13 = sub_1000C88E4((unint64_t)"\n");
    j__fwrite("\n", v13, 1uLL, a2);
  }

  int v14 = sub_1000C88E4((unint64_t)"VstEndHeader");
  j__fwrite("VstEndHeader", v14, 1uLL, a2);
  int v15 = sub_1000C88E4((unint64_t)"\n");
  j__fwrite("\n", v15, 1uLL, a2);
  return j__fflush(a2);
}

void sub_1000D934C(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_1000D9360(const char *a1, int a2, const char *a3, uint64_t a4, uint64_t a5)
{
  return putchar(10);
}

uint64_t sub_1000D93D0(uint64_t a1)
{
  qword_100102A18 = mach_absolute_time();
  *(void *)a1 = 0LL;
  __asm { FMOV            V0.2D, #-1.0 }

  *(_OWORD *)(a1 + 8) = _Q0;
  *(void *)(a1 + 24) = @"Express";
  *(void *)(a1 + 40) = 31LL;
  *(void *)(a1 + 48) = sub_1000D94B0;
  *(void *)(a1 + 56) = sub_1000D958C;
  *(void *)(a1 + 64) = sub_1000D95E8;
  *(void *)(a1 + 72) = sub_1000DA0C0;
  *(void *)(a1 + 80) = sub_1000DA150;
  *(void *)(a1 + 88) = sub_1000DA3D0;
  *(void *)(a1 + 96) = sub_1000DA6CC;
  *(void *)(a1 + 104) = sub_1000DA834;
  *(void *)(a1 + 112) = sub_1000DA9E8;
  *(void *)(a1 + 120) = sub_1000DAA34;
  *(void *)(a1 + 128) = sub_1000DAA80;
  *(void *)(a1 + 136) = sub_1000DAD4C;
  *(void *)(a1 + 144) = sub_1000DB0D8;
  *(void *)(a1 + 152) = sub_1000DB284;
  *(void *)(a1 + 160) = sub_1000DB480;
  return 0LL;
}

uint64_t sub_1000D94B0(uint64_t a1, const void *a2, double a3)
{
  int v6 = (char *)malloc(0x78uLL);
  *(void *)int v6 = 0LL;
  *((void *)v6 + 12) = 0LL;
  v6[104] = 0;
  v6[105] = sub_1000DD6EC(*(const __CFString **)(a1 + 32));
  int v7 = *(const __CFString **)(a1 + 32);
  if (v7) {
    LOBYTE(v7) = CFStringHasPrefix(v7, @"ja");
  }
  v6[106] = (char)v7;
  if (a2)
  {
    *((void *)v6 + 14) = CFRetain(a2);
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 72) = 0u;
    *((void *)v6 + 11) = 0LL;
    *(void *)a1 = v6;
    int v8 = (uint64_t **)a1;
    int v9 = (const __CFURL *)a2;
  }

  else
  {
    *((void *)v6 + 14) = 0LL;
    *(_OWORD *)(v6 + 8) = 0u;
    *(_OWORD *)(v6 + 24) = 0u;
    *(_OWORD *)(v6 + 40) = 0u;
    *(_OWORD *)(v6 + 56) = 0u;
    *(_OWORD *)(v6 + 72) = 0u;
    *((void *)v6 + 11) = 0LL;
    *(void *)a1 = v6;
    int v8 = (uint64_t **)a1;
    int v9 = 0LL;
  }

  return sub_1000DD134(v8, v9, a3);
}

uint64_t sub_1000D958C(uint64_t *a1)
{
  uint64_t v2 = (CFTypeRef *)*a1;
  if (*a1)
  {
    if (v2[12])
    {
      CFRelease(v2[12]);
      uint64_t v2 = (CFTypeRef *)*a1;
    }

    if (v2[14])
    {
      CFRelease(v2[14]);
      uint64_t v2 = (CFTypeRef *)*a1;
    }

    free(v2);
    *a1 = 0LL;
  }

  return 0LL;
}

uint64_t sub_1000D95E8(uint64_t **a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (!*a1 || !*v2) {
    return 4294963293LL;
  }
  int v4 = a1;
  int v5 = *(const __CFString **)(a2 + 16);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(a2 + 16));
    uint64_t v2 = *v4;
    int v6 = *(unsigned __int8 **)(a2 + 536);
    if (!*v4)
    {
      uint64_t v7 = 0LL;
      goto LABEL_9;
    }
  }

  else
  {
    int v6 = *(unsigned __int8 **)(a2 + 536);
  }

  uint64_t v7 = *v2;
LABEL_9:
  if (sub_1000DD04C(v7, v6) == -1)
  {
    int v10 = sub_1000E8378((CFDictionaryRef *)a2);
    int v98 = 0;
    uint64_t v97 = 0LL;
    unsigned __int8 v96 = 0;
    if (!v10)
    {
      int v9 = 4;
      goto LABEL_137;
    }

    uint64_t v11 = v10;
    CFIndex Count = CFArrayGetCount(v10);
    int v13 = sub_1000E8ECC(a2, v11);
    if (!v13)
    {
      int v9 = 0;
      goto LABEL_136;
    }

    int v14 = v13;
    if (CFArrayGetCount(v13) != Count)
    {
      int v9 = 0;
      goto LABEL_134;
    }

    uint64_t v93 = a2;
    theArray = v14;
    CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v5);
    CFStringAppend(MutableCopy, @".");
    CFIndex Length = CFStringGetLength(MutableCopy);
    uint64_t v89 = malloc(8 * Count);
    uint64_t v17 = NSPushAutoreleasePool(0LL);
    int64_t __count = Count;
    BOOL v18 = Count < 1;
    BOOL v19 = Count < 1;
    if (v18)
    {
      CFIndex v20 = 0LL;
      cf = 0LL;
      uint64_t v86 = 0LL;
      int v9 = 0;
    }

    else
    {
      uint64_t v78 = v6;
      int v79 = v5;
      CFIndex v20 = 0LL;
      int v81 = v11;
      cf = 0LL;
      uint64_t v85 = v4;
      uint64_t v86 = 0LL;
      while (1)
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(v11, v20);
        uint64_t v22 = (const __CFString *)*((void *)ValueAtIndex + 2);
        if (!v22)
        {
          int v9 = 4;
          goto LABEL_87;
        }

        int v23 = (uint64_t *)ValueAtIndex;
        CFRetain(*((CFTypeRef *)ValueAtIndex + 2));
        CFStringAppend(MutableCopy, v22);
        CFIndex v24 = CFStringGetLength(MutableCopy);
        CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(v24, 0x8000100u);
        CFIndex v26 = MaximumSizeForEncoding;
        *(void *)usedBufLen = MaximumSizeForEncoding;
        uint64_t v27 = MaximumSizeForEncoding < 0 ? 0LL : (UInt8 *)malloc(MaximumSizeForEncoding + 1);
        uint64_t v84 = v20 + 1;
        v89[v20] = v27;
        v102.location = 0LL;
        v102.length = v24;
        CFStringGetBytes(MutableCopy, v102, 0x8000100u, 0, 0, v27, v26, (CFIndex *)usedBufLen);
        v27[*(void *)usedBufLen] = 0;
        v103.length = CFStringGetLength(MutableCopy) - Length;
        v103.location = Length;
        CFStringReplace(MutableCopy, v103, &stru_1000FAE88);
        int v9 = sub_1000DDE78(v85, v27, v23[3]);
        if (v9) {
          break;
        }
        Mutable = cf;
        if (!cf) {
          Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
        }
        cf = Mutable;
        CFDictionarySetValue(Mutable, v23, v27);
        unint64_t v29 = v23[4];
        if (v29 >= 0xFFFFFFFFFFFFFF01LL)
        {
          signed int v30 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v29 + 255) / 255.0)) * 255.0) + 0.0);
          uint64_t v11 = v81;
          int v4 = v85;
          if (v30)
          {
            char v31 = v86;
            if (!v86) {
              char v31 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
            }
            uint64_t v86 = v31;
            CFDictionarySetValue(v31, (const void *)v89[v20], (const void *)v30);
          }
        }

        else
        {
          uint64_t v11 = v81;
          int v4 = v85;
        }

        ++v20;
        CFRelease(v22);
        if (v84 >= __count)
        {
          CFRelease(MutableCopy);
          CFIndex idx = 0LL;
          uint64_t v95 = 0LL;
          theDict = 0LL;
          int64_t v32 = __count;
          int v83 = 127 * __count;
          int v90 = __count;
          int v33 = v89;
          while (1)
          {
            uint64_t v34 = (uint64_t *)CFArrayGetValueAtIndex(v11, idx);
            int v35 = CFArrayGetValueAtIndex(theArray, idx);
            uint64_t v36 = (uint64_t)v35;
            uint64_t v37 = (uint64_t (*)(void *, uint64_t, uint64_t *, void))v35[3];
            if (v37)
            {
              int v35 = (void *)v37(v35, v93, v34, v35[2]);
              uint64_t v92 = (uint64_t)v35;
            }

            else
            {
              uint64_t v92 = 0LL;
            }

            uint64_t v38 = (unsigned __int8 *)v33[idx];
            uint64_t v39 = (os_log_s *)VSGetLogDefault(v35);
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)usedBufLen = 136315138;
              *(void *)&usedBufLen[4] = v38;
              _os_log_debug_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_DEBUG,  "#DataProvider, --- %s: \n",  usedBufLen,  0xCu);
            }

            if (v92 >= 1)
            {
              int v40 = v83;
              uint64_t v41 = 1LL;
              uint64_t v42 = v93;
              uint64_t v88 = v36;
              while (1)
              {
                if (!v17) {
                  uint64_t v17 = NSPushAutoreleasePool(0LL);
                }
                uint64_t v43 = sub_1000DD7F0((uint64_t)v4, v42, (uint64_t)v34, v36, v41 - 1, v38, &v96, &v97);
                if ((_DWORD)v43 == 1)
                {
                  int v44 = v95;
                  if (!v95) {
                    int v44 = calloc(__count, 8uLL);
                  }
                  ++v44[idx];
                  CFMutableStringRef v45 = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
                  CFStringAppendCString(v45, (const char *)v89[idx], 0x8000100u);
                  uint64_t v95 = v44;
                  CFStringAppendFormat(v45, 0LL, @"#%ld", v44[idx]);
                  CFIndex v46 = CFStringGetLength(v45);
                  CFIndex v47 = CFStringGetMaximumSizeForEncoding(v46, 0x8000100u);
                  CFIndex v48 = v47;
                  *(void *)usedBufLen = v47;
                  if (v47 < 0) {
                    uint64_t v38 = 0LL;
                  }
                  else {
                    uint64_t v38 = (unsigned __int8 *)malloc(v47 + 1);
                  }
                  uint64_t v55 = v17;
                  v104.location = 0LL;
                  v104.length = v46;
                  CFStringGetBytes(v45, v104, 0x8000100u, 0, 0, v38, v48, (CFIndex *)usedBufLen);
                  v38[*(void *)usedBufLen] = 0;
                  uint64_t v56 = theDict;
                  if (theDict)
                  {
                    Value = (void *)CFDictionaryGetValue(theDict, v34);
                    char v58 = v85;
                    if (!Value)
                    {
LABEL_57:
                      Value = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
                      CFDictionarySetValue(v56, v34, Value);
                      CFRelease(Value);
                    }

                    theDict = v56;
                    CFArrayAppendValue((CFMutableArrayRef)Value, v38);
                    if (v86)
                    {
                      unint64_t v59 = v34[4];
                      if (v59 >= 0xFFFFFFFFFFFFFF01LL)
                      {
                        signed int v60 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v59 + 255) / 255.0)) * 255.0) + 0.0);
                        if (v60) {
                          CFDictionarySetValue(v86, v38, (const void *)v60);
                        }
                      }
                    }

                    ++v90;
                    CFRelease(v45);
                    int v4 = v58;
                    int v61 = sub_1000DDE78(v58, v38, v34[3]);
                    uint64_t v42 = v93;
                    if (v61)
                    {
                      int v9 = v61;
                      int64_t v32 = __count;
                      uint64_t v17 = v55;
                    }

                    else
                    {
                      uint64_t v62 = sub_1000DD7F0((uint64_t)v58, v93, (uint64_t)v34, v88, v41 - 1, v38, &v96, &v97);
                      int v9 = v62;
                      uint64_t v17 = v55;
                      if ((_DWORD)v62)
                      {
                        uint64_t v63 = (os_log_s *)VSGetLogDefault(v62);
                        int64_t v32 = __count;
                        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)usedBufLen = 136315394;
                          *(void *)&usedBufLen[4] = "_VSElvisConfigureForModel";
                          __int16 v100 = 1024;
                          int v101 = v9;
                          _os_log_error_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_ERROR,  "#Pronunciation %s: error adding last entry (%d) - continuing...\n",  usedBufLen,  0x12u);
                        }

                        int v9 = 0;
                        uint64_t v42 = v93;
                      }

                      else
                      {
                        int64_t v32 = __count;
                      }
                    }

                    uint64_t v36 = v88;
                    if (!v17) {
                      goto LABEL_72;
                    }
LABEL_70:
                    if ((~v40 & 0x5FLL) == 0)
                    {
                      NSPopAutoreleasePool(v17);
                      uint64_t v17 = 0LL;
                    }

                    goto LABEL_72;
                  }

                  uint64_t v56 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                  char v58 = v85;
                  goto LABEL_57;
                }

                int v49 = v43;
                int64_t v32 = __count;
                if ((_DWORD)v43)
                {
                  uint64_t v54 = (os_log_s *)VSGetLogDefault(v43);
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)usedBufLen = 136315394;
                    *(void *)&usedBufLen[4] = "_VSElvisConfigureForModel";
                    __int16 v100 = 1024;
                    int v101 = v49;
                    int v51 = v54;
                    unint64_t v52 = "#Pronunciation %s: error adding last entry (%d) - continuing...\n";
                    uint32_t v53 = 18;
LABEL_76:
                    _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, v52, usedBufLen, v53);
                  }
                }

LABEL_124:
          if (v33) {
            free(v33);
          }
          int v14 = theArray;
          if (v95) {
            free(v95);
          }
          if (theDict) {
            CFRelease(theDict);
          }
          if (cf) {
            CFRelease(cf);
          }
          if (v86) {
            CFRelease(v86);
          }
LABEL_134:
          CFRelease(v14);
          if (v97) {
            CFRelease(v97);
          }
LABEL_136:
          CFRelease(v11);
          goto LABEL_137;
        }
      }

      CFRelease(v22);
      BOOL v19 = 0;
      ++v20;
      int v4 = v85;
LABEL_87:
      int v5 = v79;
      uint64_t v11 = v81;
      int v6 = v78;
    }

    CFRelease(MutableCopy);
    theDict = 0LL;
    uint64_t v95 = 0LL;
    uint64_t v84 = v20;
    int v33 = v89;
    goto LABEL_89;
  }

  int v9 = 0;
LABEL_137:
  if (v5) {
    CFRelease(v5);
  }
  return dword_1000F28F8[v9];
}

uint64_t sub_1000DA0C0(uint64_t **a1, uint64_t a2, int a3)
{
  uint64_t v3 = *a1;
  if (!*a1) {
    return 0LL;
  }
  uint64_t result = *v3;
  if (!*v3) {
    return result;
  }
  if (!a3 && !*(_BYTE *)(a2 + 648)) {
    return 0LL;
  }
  unsigned int v6 = sub_1000DD04C(result, *(unsigned __int8 **)(a2 + 536));
  if (v6 == -1)
  {
    unsigned int v9 = 0;
    return dword_1000F28F8[v9];
  }

  unsigned int v7 = v6;
  if (*a1) {
    uint64_t v8 = **a1;
  }
  else {
    uint64_t v8 = 0LL;
  }
  unsigned int v9 = sub_100042C48(v8, v7);
  if (v9 <= 0xB) {
    return dword_1000F28F8[v9];
  }
  return 4294963295LL;
}

uint64_t sub_1000DA150(uint64_t **a1, uint64_t a2, uint64_t a3)
{
  int v23 = 0;
  if (!*a1 || !**a1)
  {
LABEL_32:
    unsigned int v10 = 0;
    return dword_1000F28F8[v10];
  }

  int v4 = sub_1000DD73C(*(CFTypeRef *)(a2 + 16), a3);
  if (!v4)
  {
    unsigned int v10 = 1;
    return dword_1000F28F8[v10];
  }

  int v5 = v4;
  CFIndex Length = CFStringGetLength(v4);
  uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v8 = MaximumSizeForEncoding;
  CFIndex usedBufLen = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    unsigned int v9 = v24;
  }
  else {
    unsigned int v9 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
  }
  v25.location = 0LL;
  v25.length = Length;
  CFStringGetBytes(v5, v25, 0x8000100u, 0, 0, v9, v8, &usedBufLen);
  v9[usedBufLen] = 0;
  if (*a1) {
    uint64_t v11 = **a1;
  }
  else {
    uint64_t v11 = 0LL;
  }
  unsigned int v12 = sub_100044F80(v11, v9, &v23);
  if (v9 != v24) {
    free(v9);
  }
  if (v12 | v23) {
    unsigned int v10 = v12;
  }
  else {
    unsigned int v10 = 1;
  }
  if (!v10)
  {
    if (v23)
    {
      uint64_t v14 = 0LL;
      do
      {
        int v15 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@#%d", v5, v14);
        CFIndex v16 = CFStringGetLength(v15);
        uint64_t v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
        CFIndex v18 = v17;
        CFIndex usedBufLen = v17;
        if (v17 < 1024) {
          BOOL v19 = v24;
        }
        else {
          BOOL v19 = (UInt8 *)malloc(v17 + 1);
        }
        v26.location = 0LL;
        v26.length = v16;
        CFStringGetBytes(v15, v26, 0x8000100u, 0, 0, v19, v18, &usedBufLen);
        v19[usedBufLen] = 0;
        if (*a1) {
          uint64_t v20 = **a1;
        }
        else {
          uint64_t v20 = 0LL;
        }
        int v21 = sub_100044F80(v20, v19, &v23);
        if (v19 != v24) {
          free(v19);
        }
        CFRelease(v15);
        if (v21) {
          break;
        }
        uint64_t v14 = (v14 + 1);
      }

      while (v23);
    }

    CFRelease(v5);
    goto LABEL_32;
  }

  CFRelease(v5);
  if (v10 > 0xB) {
    return 4294963295LL;
  }
  return dword_1000F28F8[v10];
}

uint64_t sub_1000DA3D0(uint64_t **a1, uint64_t a2, void *a3)
{
  CFTypeRef v28 = 0LL;
  values = a3;
  int v27 = 0;
  if (!*a1 || !**a1) {
    return 4294963293LL;
  }
  int v5 = sub_1000DD73C(*(CFTypeRef *)(a2 + 16), (uint64_t)a3);
  if (!v5)
  {
    unsigned int v12 = 1;
    return dword_1000F28F8[v12];
  }

  unsigned int v6 = v5;
  CFIndex Length = CFStringGetLength(v5);
  uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v9 = MaximumSizeForEncoding;
  CFIndex usedBufLen = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    unsigned int v10 = v30;
  }
  else {
    unsigned int v10 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
  }
  v31.location = 0LL;
  v31.length = Length;
  CFStringGetBytes(v6, v31, 0x8000100u, 0, 0, v10, v9, &usedBufLen);
  v10[usedBufLen] = 0;
  if (*a1) {
    uint64_t v13 = **a1;
  }
  else {
    uint64_t v13 = 0LL;
  }
  unsigned int v12 = 4;
  if (!v27) {
    goto LABEL_35;
  }
  unsigned int v12 = 1;
  uint64_t v14 = CFArrayCreate(kCFAllocatorDefault, (const void **)&values, 1LL, &kCFTypeArrayCallBacks);
  if (!v14) {
    goto LABEL_35;
  }
  int v15 = v14;
  CFIndex v16 = sub_1000E8ECC(a2, v14);
  if (!v16)
  {
    unsigned int v12 = 0;
    goto LABEL_34;
  }

  uint64_t v17 = v16;
  if (CFArrayGetCount(v16) < 1)
  {
    unsigned int v12 = 0;
    goto LABEL_33;
  }

  ValueAtIndex = CFArrayGetValueAtIndex(v17, 0LL);
  BOOL v19 = (uint64_t (*)(void *, uint64_t, void *, void))ValueAtIndex[3];
  if (!v19 || (uint64_t v20 = (uint64_t)ValueAtIndex, v21 = v19(ValueAtIndex, a2, values, ValueAtIndex[2]), v21 < 1))
  {
    unsigned int v12 = 1;
    goto LABEL_33;
  }

  uint64_t v22 = v21;
  CFRange v25 = v15;
  uint64_t v23 = 0LL;
  uint64_t v24 = 1LL;
  do
  {
    if (v23)
    {
      unsigned int v12 = sub_1000DD7F0((uint64_t)a1, a2, (uint64_t)values, v20, v24 - 1, v10, 0LL, (__CFStringTokenizer **)&v28);
    }

    else
    {
      uint64_t v23 = NSPushAutoreleasePool(0LL);
      unsigned int v12 = sub_1000DD7F0((uint64_t)a1, a2, (uint64_t)values, v20, v24 - 1, v10, 0LL, (__CFStringTokenizer **)&v28);
      if (!v23) {
        goto LABEL_25;
      }
    }

    if ((~((_BYTE)v24 - 1) & 0x5F) == 0)
    {
      NSPopAutoreleasePool(v23);
      uint64_t v23 = 0LL;
    }

CFStringRef sub_1000DA6CC(uint64_t a1, CFStringRef theString)
{
  CFStringRef v2 = theString;
  if (!a1 || !theString) {
    goto LABEL_24;
  }
  if (!*(_BYTE *)(*(void *)a1 + 105LL))
  {
LABEL_25:
    CFRetain(v2);
    return v2;
  }

  uint64_t Length = CFStringGetLength(theString);
  v12.location = 0LL;
  v12.length = Length;
  int v4 = CFStringTokenizerCopyBestStringLanguage(v2, v12);
  int v5 = v4;
  if (v4 && !sub_1000DD6EC(v4))
  {
    CFMutableStringRef MutableCopy = 0LL;
    goto LABEL_23;
  }

  v11.location = 0LL;
  v11.length = Length;
  if (Length >= 1)
  {
    v6.location = 0LL;
    CFMutableStringRef MutableCopy = 0LL;
    uint64_t v8 = Length;
    while (1)
    {
      v6.length = Length;
      if (!CFStringFindWithOptions(v2, @" ", v6, 0LL, &v11)) {
        break;
      }
      if (!MutableCopy)
      {
        CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v2);
        CFStringRef v2 = MutableCopy;
      }

      CFStringReplace(MutableCopy, v11, &stru_1000FAE88);
      v6.location = v11.location;
      v8 -= v11.length;
      uint64_t Length = v8 - v11.location;
      v11.length = v8 - v11.location;
      if (v11.location == -1 || v8 <= v11.location) {
        goto LABEL_18;
      }
    }

    v11.location = -1LL;
    if (v5) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }

  CFMutableStringRef MutableCopy = 0LL;
LABEL_18:
  if (!v5)
  {
LABEL_19:
    if (MutableCopy) {
      return MutableCopy;
    }
LABEL_24:
    if (!v2) {
      return 0LL;
    }
    goto LABEL_25;
  }

uint64_t sub_1000DA834(uint64_t **a1, const __CFURL *a2)
{
  int v12 = 0;
  uint64_t v3 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, @"express.psa", 0);
  if (v3)
  {
    int v4 = v3;
    if (CFURLGetFileSystemRepresentation(v3, 1u, buffer, 1024LL))
    {
      if (*a1) {
        uint64_t v5 = **a1;
      }
      else {
        uint64_t v5 = 0LL;
      }
      uint64_t v6 = sub_100043B94(v5, &v12);
      if (!(_DWORD)v6 && v12 >= 1)
      {
        unsigned int v7 = (os_log_s *)VSGetLogDefault(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v14 = "_VSElvisWriteToCache";
          __int16 v15 = 1024;
          LODWORD(v16) = v12;
          _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%s: pruned %d classes\n", buf, 0x12u);
        }
      }

      if (*a1) {
        uint64_t v8 = **a1;
      }
      else {
        uint64_t v8 = 0LL;
      }
      uint64_t v9 = sub_1000498D4(v8, 0LL, (const char *)buffer);
      unsigned int v10 = (os_log_s *)VSGetLogDefault(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v14 = "_VSElvisWriteToCache";
        __int16 v15 = 2080;
        CFIndex v16 = buffer;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s: PSA file written to %s.\n",  buf,  0x16u);
      }
    }

    CFRelease(v4);
  }

  return 0LL;
}

void sub_1000DA9E8(uint64_t *a1, CFTypeRef cf)
{
  uint64_t v4 = *a1;
  uint64_t v5 = *(const void **)(*a1 + 112);
  if (v5)
  {
    CFRelease(v5);
    uint64_t v4 = *a1;
  }

  *(void *)(v4 + 112) = cf;
  if (cf) {
    CFRetain(cf);
  }
}

uint64_t sub_1000DAA34(uint64_t a1, BOOL *a2, double a3)
{
  double v5 = *(double *)(a1 + 16);
  uint64_t result = sub_1000DD134((uint64_t **)a1, *(const __CFURL **)(*(void *)a1 + 112LL), a3);
  if (a2) {
    *a2 = v5 != *(double *)(a1 + 16);
  }
  return result;
}

uint64_t sub_1000DAA80(uint64_t **a1, const __CFSet *a2, uint64_t a3, int a4)
{
  uint64_t v22 = 0LL;
  uint64_t v23 = 0LL;
  uint64_t v4 = *a1;
  if (!*a1 || !*v4) {
    return 4294963293LL;
  }
  if (a4)
  {
    uint64_t v8 = sub_100046244(*v4);
    int v9 = v8;
    unsigned int v10 = (os_log_s *)VSGetLogDefault(v8);
    CFRange v11 = v10;
    if (v9)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Couldn't reset front end\n", buf, 2u);
        if (!a3) {
          goto LABEL_19;
        }
LABEL_11:
        if (*((_BYTE *)v4 + 104) || (!*a1 ? (uint64_t v13 = 0LL) : (uint64_t v13 = **a1), v14 = sub_1000D6B30(v13, 40000), !(_DWORD)v14))
        {
          (*a1)[12] = VSLogBundleCopyPathForFile(a3, @"recog_express_dump_", 1LL);
          *((_BYTE *)v4 + 104) = 1;
        }

        else
        {
          __int16 v15 = (os_log_s *)VSGetLogDefault(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "error allocating debug dump resources\n",  buf,  2u);
          }
        }

        goto LABEL_19;
      }
    }

    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "Reset engine\n", buf, 2u);
      if (!a3) {
        goto LABEL_19;
      }
      goto LABEL_11;
    }
  }

  if (a3) {
    goto LABEL_11;
  }
LABEL_19:
  if (sub_1000DB4B0(a1, a2, buf, &v23, &v22, 0LL))
  {
    unsigned int v16 = 1;
  }

  else
  {
    if (*a1) {
      uint64_t v17 = **a1;
    }
    else {
      uint64_t v17 = 0LL;
    }
    uint64_t v18 = sub_100046924(v17, &v21);
    if ((_DWORD)v18)
    {
      unsigned int v16 = v18;
      BOOL v19 = (os_log_s *)VSGetLogDefault(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)uint64_t v24 = 67109634;
        unsigned int v25 = v16;
        __int16 v26 = 2080;
        int v27 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v28 = 1024;
        int v29 = 1871;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Error %d at %s:%d\n", v24, 0x18u);
      }
    }

    else
    {
      if (*a1) {
        uint64_t v20 = **a1;
      }
      else {
        uint64_t v20 = 0LL;
      }
      unsigned int v16 = sub_10004A4D0(v20, v21, 3, 0, 0LL, v22, (uint64_t)v23);
    }
  }

  if (v23 && v23 != buf) {
    free(v23);
  }
  if (v16 > 0xB) {
    return 4294963295LL;
  }
  else {
    return dword_1000F28F8[v16];
  }
}

uint64_t sub_1000DAD4C(uint64_t **a1, char *a2, int a3, uint64_t a4, _BYTE *a5)
{
  if ((byte_100102A20 & 1) == 0)
  {
    int v9 = (os_log_s *)VSGetLogDefault(a1);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = mach_absolute_time();
      *(_DWORD *)buf = 134217984;
      *(void *)int v27 = VSAbsoluteTimeToSecond(v18 - qword_100102A18);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "time to first Elvis packet: %g",  buf,  0xCu);
    }

    byte_100102A20 = 1;
  }

  int v24 = 2;
  int v25 = 0;
  if (a5) {
    *a5 = 0;
  }
  unsigned int v10 = *a1;
  if (!*a1 || !*v10)
  {
    uint64_t result = 4294963293LL;
    if (!a5) {
      return result;
    }
    goto LABEL_15;
  }

  uint64_t v11 = sub_1000478F4(*v10, a2, a3, &v25);
  unsigned int v12 = v11;
  uint64_t v13 = (os_log_s *)VSGetLogDefault(v11);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
  if (!v14)
  {
    if (!v12) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }

  *(_DWORD *)buf = 67109888;
  *(_DWORD *)int v27 = v12;
  *(_WORD *)&v27[4] = 2048;
  *(void *)&v27[6] = a2;
  __int16 v28 = 1024;
  int v29 = a3;
  __int16 v30 = 1024;
  LODWORD(v31) = v25;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "#Audio PutWaveSamples (uint64_t result = %d): audioData = %p, sampleCount = %d, feStatus = %d\n",  buf,  0x1Eu);
  if (v12)
  {
LABEL_11:
    __int16 v15 = (os_log_s *)VSGetLogDefault(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)int v27 = v12;
      *(_WORD *)&v27[4] = 2080;
      *(void *)&v27[6] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v28 = 1024;
      int v29 = 1911;
      __int16 v30 = 2080;
      CFRange v31 = "error enqueing samples";
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
    }

    int v16 = 2;
    goto LABEL_28;
  }

uint64_t sub_1000DB0D8(uint64_t **a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = sub_100046B00(v2);
  if ((_DWORD)v3)
  {
    unsigned int v4 = v3;
    double v5 = (os_log_s *)VSGetLogDefault(v3);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109634;
      unsigned int v12 = v4;
      __int16 v13 = 2080;
      BOOL v14 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v15 = 1024;
      int v16 = 1951;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d\n",  (uint8_t *)&v11,  0x18u);
    }

    if (v4 > 0xB) {
      uint64_t v6 = 4294963295LL;
    }
    else {
      uint64_t v6 = dword_1000F28F8[v4];
    }
  }

  else
  {
    uint64_t v6 = 0LL;
  }

  uint64_t v7 = sub_10004BE18(*v1, 0);
  if ((_DWORD)v7)
  {
    unsigned int v8 = v7;
    int v9 = (os_log_s *)VSGetLogDefault(v7);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 67109634;
      unsigned int v12 = v8;
      __int16 v13 = 2080;
      BOOL v14 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v15 = 1024;
      int v16 = 1954;
      _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d\n",  (uint8_t *)&v11,  0x18u);
    }

    if (v8 > 0xB) {
      return 4294963295LL;
    }
    else {
      return dword_1000F28F8[v8];
    }
  }

  return v6;
}

__CFArray *sub_1000DB284(unint64_t **a1, const __CFSet *a2)
{
  uint64_t v16 = 0LL;
  CFTypeRef cf = 0LL;
  BOOL v14 = 0LL;
  sub_1000DB4B0(a1, a2, v25, &v14, &v16, (CFMutableDictionaryRef *)&cf);
  uint64_t v3 = NSPushAutoreleasePool(0LL);
  unsigned int v4 = sub_1000DB6CC((uint64_t **)a1, 1, 0LL, 1, &v15, (unsigned int *)v14, v16, (const __CFDictionary *)cf);
  double v5 = v4;
  if (v4) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v15 < 1;
  }
  if (!v6)
  {
    uint64_t v7 = (os_log_s *)VSGetLogDefault(v4);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "beginning re-recognition\n", buf, 2u);
    }

    if (*a1) {
      unint64_t v8 = **a1;
    }
    else {
      unint64_t v8 = 0LL;
    }
    uint64_t v9 = sub_10004D938(v8, v15);
    if ((_DWORD)v9)
    {
      int v10 = v9;
      int v11 = (os_log_s *)VSGetLogDefault(v9);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        int v18 = v10;
        __int16 v19 = 2080;
        uint64_t v20 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
        __int16 v21 = 1024;
        int v22 = 2528;
        __int16 v23 = 2080;
        int v24 = "re-recognizing";
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
      }

      double v5 = 0LL;
    }

    else
    {
      double v5 = sub_1000DB6CC( (uint64_t **)a1,  0,  @"-rerec",  0,  &v15,  (unsigned int *)v14,  v16,  (const __CFDictionary *)cf);
    }
  }

  NSPopAutoreleasePool(v3);
  if (v14 && v14 != v25) {
    free(v14);
  }
  if (cf) {
    CFRelease(cf);
  }
  return v5;
}

void sub_1000DB480(uint64_t *a1)
{
  uint64_t v1 = *a1;
  if (*a1)
  {
    uint64_t v2 = *(const void **)(v1 + 96);
    if (v2)
    {
      CFRelease(v2);
      *(void *)(v1 + 96) = 0LL;
    }
  }

uint64_t sub_1000DB4B0( void **a1, CFSetRef theSet, void *a3, void *a4, void *a5, CFMutableDictionaryRef *a6)
{
  CFIndex Count = CFSetGetCount(theSet);
  CFIndex v13 = Count;
  BOOL v14 = a3;
  if (Count >= 17) {
    BOOL v14 = malloc(4 * Count);
  }
  if (a6) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
  }
  else {
    CFMutableDictionaryRef Mutable = 0LL;
  }
  v22[0] = 0LL;
  v22[1] = v14;
  uint64_t v16 = *a1;
  if (*a1) {
    uint64_t v16 = (void *)*v16;
  }
  v22[2] = Mutable;
  v22[3] = v16;
  CFSetApplyFunction(theSet, (CFSetApplierFunction)sub_1000DCFE4, v22);
  uint64_t v18 = v22[0];
  if (v22[0] == v13) {
    goto LABEL_11;
  }
  __int16 v19 = (os_log_s *)VSGetLogDefault(v17);
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 136315394;
      int v24 = "_VSElvisGetConstraintsFromModels";
      __int16 v25 = 2048;
      CFIndex v26 = v13 - v22[0];
      _os_log_error_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_ERROR,  "%s: couldn't convert %ld models to constraints\n",  buf,  0x16u);
      if (a4) {
        goto LABEL_12;
      }
      goto LABEL_23;
    }

__CFArray *sub_1000DB6CC( uint64_t **a1, int a2, const __CFString *a3, int a4, void *a5, unsigned int *a6, uint64_t a7, const __CFDictionary *a8)
{
  CFTypeRef v178 = 0LL;
  int v177 = 0;
  *(void *)&key[1] = 0LL;
  key[0] = -1;
  uint64_t v171 = 0LL;
  int v11 = *a1;
  if (*a1)
  {
    unsigned int v12 = (const __CFString *)v11[12];
    uint64_t v13 = *v11;
  }

  else
  {
    unsigned int v12 = 0LL;
    uint64_t v13 = 0LL;
  }

  uint64_t MutableCopy = sub_10004CFE0(v13, &v177, &v176);
  int v15 = MutableCopy;
  if ((_DWORD)MutableCopy)
  {
    uint64_t v16 = (os_log_s *)VSGetLogDefault(MutableCopy);
    uint64_t MutableCopy = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if ((_DWORD)MutableCopy)
    {
      LODWORD(v181) = 67109890;
      __int16 v182 = 2080;
      uint64_t v183 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v184 = 1024;
      HIDWORD(v181) = v15;
      int v185 = 2211;
      __int16 v186 = 2080;
      signed int v187 = "couldn't get choices";
      _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d (%s)\n",  (uint8_t *)&v181,  0x22u);
    }

    BOOL v17 = a5 != 0LL;
  }

  else
  {
    if (!a5)
    {
      BOOL v153 = 0;
      if (v12) {
        goto LABEL_11;
      }
LABEL_24:
      uint64_t v152 = 0LL;
      __int16 v19 = a1;
      goto LABEL_33;
    }

    *a5 = v177;
    BOOL v17 = 1;
  }

  BOOL v153 = v17;
  if (!v12) {
    goto LABEL_24;
  }
LABEL_11:
  if (a3 && (uint64_t MutableCopy = (uint64_t)CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, v12)) != 0)
  {
    uint64_t v18 = (const __CFString *)MutableCopy;
    CFStringAppend((CFMutableStringRef)MutableCopy, a3);
    unsigned int v12 = v18;
  }

  else
  {
    uint64_t v18 = 0LL;
  }

  __int16 v19 = a1;
  uint64_t v152 = v18;
  if (a4)
  {
    BOOL v20 = (os_log_s *)VSGetLogDefault(MutableCopy);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v181) = 0;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEBUG,  "dumping debug information...",  (uint8_t *)&v181,  2u);
    }

    uint64_t FileSystemRepresentation = CFStringGetFileSystemRepresentation(v12, v190, 1024LL);
    if ((_DWORD)FileSystemRepresentation)
    {
      if (*a1) {
        uint64_t v22 = **a1;
      }
      else {
        uint64_t v22 = 0LL;
      }
      uint64_t v25 = sub_1000D6E48(v22, v190, 1);
      int v26 = v25;
      __int16 v23 = (os_log_s *)VSGetLogDefault(v25);
      uint64_t MutableCopy = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (v26)
      {
        if (!(_DWORD)MutableCopy) {
          goto LABEL_33;
        }
        LODWORD(v181) = 67109120;
        HIDWORD(v181) = v26;
        int v24 = "couldn't dump recognition (error %d)\n";
        int v27 = v23;
        uint32_t v28 = 8;
        goto LABEL_32;
      }

      if (!(_DWORD)MutableCopy) {
        goto LABEL_33;
      }
      LOWORD(v181) = 0;
      int v24 = "dump complete\n";
    }

    else
    {
      __int16 v23 = (os_log_s *)VSGetLogDefault(FileSystemRepresentation);
      uint64_t MutableCopy = os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG);
      if (!(_DWORD)MutableCopy) {
        goto LABEL_33;
      }
      LOWORD(v181) = 0;
      int v24 = "couldn't convert dump path\n";
    }

    int v27 = v23;
    uint32_t v28 = 2;
LABEL_32:
    _os_log_debug_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, v24, (uint8_t *)&v181, v28);
  }

LABEL_249:
  BOOL v168 = v126;
  CFTypeRef cf2a = v128;
  CFStringRef theString2a = v127;
  int v156 = a5;
  uint64_t v129 = v19;
  CFTypeRef v130 = v178;
  uint64_t v131 = v129[2];
  int v191 = v176;
  *(void *)unsigned int v199 = v131;
  uint64_t v132 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFNumberRef v133 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v191);
  CFNumberRef v134 = CFNumberCreate(kCFAllocatorDefault, kCFNumberFloat64Type, v199);
  __int16 v135 = v12;
  CFNumberRef v136 = v134;
  int v137 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@results.%@", v135, kVSLogBundlePlistExtension);
  uint64_t v138 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  uint64_t v139 = (void *)objc_claimAutoreleasedReturnValue([v138 currentRoute]);

  int v140 = (void *)objc_claimAutoreleasedReturnValue([v139 inputs]);
  if ([v140 count]) {
    unint64_t v141 = (void *)objc_claimAutoreleasedReturnValue([v140 objectAtIndex:0]);
  }
  else {
    unint64_t v141 = 0LL;
  }
  uint64_t v142 = (const void *)objc_claimAutoreleasedReturnValue([v141 portType]);

  pthread_once(&stru_1000FDA90, sub_1000EB83C);
  if (qword_100102B58)
  {
    CFRetain((CFTypeRef)qword_100102B58);
    int v143 = (const void *)qword_100102B58;
  }

  else
  {
    int v143 = 0LL;
  }

  a5 = v156;
  int v144 = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v137, kCFURLPOSIXPathStyle, 0);
  unint64_t v145 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, v144);
  if (v130) {
    CFDictionarySetValue(v132, @"results", v130);
  }
  CFDictionarySetValue(v132, @"top-confidence", v133);
  CFDictionarySetValue(v132, @"sample-rate", v136);
  CFRelease(v133);
  CFRelease(v136);
  if (v142)
  {
    CFDictionarySetValue(v132, @"route", v142);
    CFRelease(v142);
  }

  uint64_t v127 = theString2a;
  if (v143)
  {
    CFDictionarySetValue(v132, @"version", v143);
    CFRelease(v143);
  }

  if (v145)
  {
    BOOL v126 = v168;
    if (CFWriteStreamOpen(v145))
    {
      CFPropertyListWrite(v132, v145, kCFPropertyListXMLFormat_v1_0, 0LL, 0LL);
      CFWriteStreamClose(v145);
    }

    CFRelease(v137);
    CFRelease(v144);
    CFRelease(v132);
    CFRelease(v145);
  }

  else
  {
    CFRelease(v137);
    CFRelease(v144);
    CFRelease(v132);
    BOOL v126 = v168;
  }

  int v40 = alloc;
  uint64_t v128 = cf2a;
LABEL_267:
  if (v178) {
    CFRelease(v178);
  }
  if (v152) {
    CFRelease(v152);
  }
  if (v127) {
    CFRelease(v127);
  }
  if (v128) {
    CFRelease(v128);
  }
  if (v153 && v126) {
    *a5 = 0LL;
  }
  return v40;
}

void sub_1000DCC50( uint64_t a1, char *__s, int64_t a3, CFMutableArrayRef *a4, CFMutableArrayRef *a5, const void *ValueAtIndex)
{
  int64_t v12 = strlen(__s);
  if (v12 > a3)
  {
    int64_t v13 = v12 - 1;
    while (__s[v12 - 1] != 35)
    {
      if (--v12 <= a3) {
        goto LABEL_7;
      }
    }

    int64_t v13 = v12 - 2;
LABEL_7:
    CFStringRef v14 = CFStringCreateWithBytes(kCFAllocatorDefault, (const UInt8 *)&__s[a3], v13 - a3 + 1, 0x8000100u, 0);
    if (v14)
    {
      CFStringRef v15 = v14;
      uint64_t v16 = sub_1000E83E0(*(const __CFDictionary **)(a1 + 560), v14);
      if (!v16)
      {
        uint64_t v22 = (os_log_s *)VSGetLogDefault(0LL);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          int v23 = 136315394;
          int v24 = "_AddPhraseStringToResults";
          __int16 v25 = 2080;
          int v26 = __s;
          _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "%s: couldn't find class with identifier '%s'\n",  (uint8_t *)&v23,  0x16u);
        }

        goto LABEL_26;
      }

      BOOL v17 = v16;
      uint64_t v18 = *(uint64_t (**)(uint64_t, const void *, const void *, void))(a1 + 616);
      if (v18)
      {
        __int16 v19 = (const __CFArray *)v18(a1, v16, ValueAtIndex, *(void *)(a1 + 656));
        BOOL v20 = v19;
        if (v19)
        {
          if (CFArrayGetCount(v19) >= 1) {
            ValueAtIndex = CFArrayGetValueAtIndex(v20, 0LL);
          }
          char v21 = 0;
          if (!a4) {
            goto LABEL_21;
          }
          goto LABEL_19;
        }
      }

      else
      {
        BOOL v20 = 0LL;
      }

      char v21 = 1;
      if (!a4)
      {
LABEL_21:
        if (a5 && !*a5) {
          *a5 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
        }
        CFArrayAppendValue(*a4, ValueAtIndex);
        CFArrayAppendValue(*a5, v15);
        CFRelease(v17);
        if ((v21 & 1) == 0) {
          CFRelease(v20);
        }
LABEL_26:
        CFRelease(v15);
        return;
      }

void sub_1000DCE80(uint64_t a1, uint64_t a2, int a3, int a4, __CFArray **a5)
{
  int valuePtr = a3;
  uint64_t v9 = (void *)((uint64_t (*)(void))VSRecognitionResultCreateDictionaryRepresentation)();
  if (a2 == a1) {
    DictionaryRepresentation = 0LL;
  }
  else {
    DictionaryRepresentation = (void *)VSRecognitionResultCreateDictionaryRepresentation(a2);
  }
  CFNumberRef v11 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFNumberRef v12 = v11;
  *(_OWORD *)keys = *(_OWORD *)&off_1000FA490;
  __int128 v20 = *(_OWORD *)&off_1000FA4A0;
  int64_t v13 = &kCFBooleanTrue;
  if (!a4) {
    int64_t v13 = &kCFBooleanFalse;
  }
  values[0] = *(void **)v13;
  values[1] = v9;
  values[2] = v11;
  values[3] = DictionaryRepresentation;
  if (DictionaryRepresentation) {
    CFIndex v14 = 4LL;
  }
  else {
    CFIndex v14 = 3LL;
  }
  CFDictionaryRef v15 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)values,  v14,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableStringRef Mutable = *a5;
  if (!*a5)
  {
    CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    *a5 = Mutable;
  }

  CFArrayAppendValue(Mutable, v15);
  CFRelease(v15);
  CFRelease(v9);
  CFRelease(v12);
  if (DictionaryRepresentation) {
    CFRelease(DictionaryRepresentation);
  }
}

void sub_1000DCFE4(unsigned __int8 **a1, uint64_t *a2)
{
  if (a2)
  {
    unsigned int v4 = sub_1000DD04C(a2[3], a1[67]);
    if (v4 != -1)
    {
      uint64_t v6 = *a2;
      uint64_t v5 = a2[1];
      ++*a2;
      *(_DWORD *)(v5 + 4 * v6) = v4;
      if (a2[2]) {
        CFDictionarySetValue((CFMutableDictionaryRef)a2[2], (const void *)v4, a1);
      }
    }
  }

uint64_t sub_1000DD04C(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v6 = -1;
  uint64_t v2 = sub_100043328(a1, a2, (int *)&v6);
  if ((_DWORD)v2)
  {
    int v3 = v2;
    unsigned int v4 = (os_log_s *)VSGetLogDefault(v2);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109890;
      int v8 = v3;
      __int16 v9 = 2080;
      int v10 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
      __int16 v11 = 1024;
      int v12 = 534;
      __int16 v13 = 2080;
      CFIndex v14 = "couldn't find constraint";
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Error %d at %s:%d (%s)\n", buf, 0x22u);
    }
  }

  return v6;
}

uint64_t sub_1000DD134(uint64_t **a1, const __CFURL *a2, double a3)
{
  if (*((double *)a1 + 2) != a3 && *((double *)a1 + 1) != a3)
  {
    a1[2] = (uint64_t *)0xBFF0000000000000LL;
    sub_1000DD58C((uint64_t *)a1);
  }

  if (*a1 && **a1) {
    return 0LL;
  }
  uint64_t v7 = (const __CFString *)a1[4];
  BundleWithIdentifier = CFBundleGetBundleWithIdentifier(kVSFrameworkBundleIdentifier);
  if (!BundleWithIdentifier || (BundleWithIdentifier = CFBundleCopyBundleURL(BundleWithIdentifier)) == 0LL)
  {
    a1[2] = (uint64_t *)0xBFF0000000000000LL;
    goto LABEL_19;
  }

  __int16 v9 = BundleWithIdentifier;
  int v10 = CFURLCreateCopyAppendingPathComponent( kCFAllocatorDefault,  BundleWithIdentifier,  @"RecognitionResources/Express",  1u);
  CFRelease(v9);
  a1[2] = (uint64_t *)0xBFF0000000000000LL;
  if (v10)
  {
    if (sub_1000DD5DC(v7, v10, @".v", v39))
    {
      __int16 v11 = 0LL;
    }

    else
    {
      CFURLRef v17 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v10, @"language_fallbacks.plist", 0);
      if (!v17)
      {
        int v16 = 0;
        goto LABEL_36;
      }

      CFURLRef v18 = v17;
      __int16 v19 = (const __CFString *)_VSCopyFallbackLanguageIdentifierForLanguageIdentifier(v7, v17);
      uint64_t v7 = v19;
      if (!v19 || !sub_1000DD5DC(v19, v10, @".v", v39))
      {
        CFRelease(v18);
        int v16 = 0;
LABEL_32:
        CFRelease(v10);
        int v10 = (const __CFURL *)v7;
        if (!v7)
        {
LABEL_37:
          if (v16)
          {
            uint64_t v20 = (uint64_t)*a1;
            *(_OWORD *)(v20 + 64) = 0u;
            *(_OWORD *)(v20 + 80) = 0u;
            *(_OWORD *)(v20 + 32) = 0u;
            *(_OWORD *)(v20 + 48) = 0u;
            *(void *)(v20 + 8) = sub_1000DD6C8;
            *(void *)(v20 + 16) = sub_1000DD6D0;
            *(void *)(v20 + 24) = sub_1000DD6D8;
            uint64_t v21 = sub_100042918(v40, v39, (uint64_t)(*a1 + 1), *a1);
            uint64_t v6 = v21;
            if ((_DWORD)v21)
            {
              uint64_t v22 = (os_log_s *)VSGetLogDefault(v21);
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 67109634;
                int v34 = v6;
                __int16 v35 = 2080;
                uint64_t v36 = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
                __int16 v37 = 1024;
                int v38 = 406;
                _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d\n",  buf,  0x18u);
              }

              else {
                uint64_t v6 = dword_1000F28F8[v6];
              }
            }

            if (a2)
            {
              int v23 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, @"express.psa", 0);
              if (v23)
              {
                int v24 = v23;
                if (CFURLGetFileSystemRepresentation(v23, 1u, buf, 1024LL) && !stat((const char *)buf, &v28))
                {
                  if (*a1) {
                    uint64_t v25 = **a1;
                  }
                  else {
                    uint64_t v25 = 0LL;
                  }
                  uint64_t v26 = sub_1000496B8(v25, 0LL, (const char *)buf);
                  if (!(_DWORD)v26)
                  {
                    int v27 = (os_log_s *)VSGetLogDefault(v26);
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)int v29 = 136315394;
                      int v30 = "_VSElvisCreateElvisIfNecessary";
                      __int16 v31 = 2080;
                      uint64_t v32 = buf;
                      _os_log_debug_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEBUG,  "%s: Configured from PSA file at %s.\n",  v29,  0x16u);
                    }
                  }
                }

                CFRelease(v24);
              }
            }

            *((double *)a1 + 1) = a3;
            return v6;
          }

          goto LABEL_19;
        }

uint64_t *sub_1000DD58C(uint64_t *result)
{
  uint64_t v1 = (uint64_t **)*result;
  if (*result)
  {
    uint64_t v2 = result;
    uint64_t result = *v1;
    if (*v1)
    {
      unsigned int v4 = v1 + 1;
      uint64_t result = (uint64_t *)sub_10003FEC8((uint64_t)result, (uint64_t *)&v4);
      uint64_t v3 = *v2;
      *(void *)uint64_t v3 = 0LL;
      *(_BYTE *)(v3 + 104) = 0;
    }
  }

  return result;
}

BOOL sub_1000DD5DC(CFStringRef theString, const __CFURL *a2, const __CFString *a3, char *a4)
{
  if (!theString) {
    return 0LL;
  }
  uint64_t MutableCopy = CFStringCreateMutableCopy(kCFAllocatorDefault, 0LL, theString);
  int v8 = MutableCopy;
  if (a3) {
    CFStringAppend(MutableCopy, a3);
  }
  CFStringAppend(v8, @".bin");
  __int16 v9 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, a2, v8, 0);
  CFRelease(v8);
  if (!v9) {
    return 0LL;
  }
  if (CFURLGetFileSystemRepresentation(v9, 1u, (UInt8 *)a4, 1024LL)) {
    BOOL v10 = stat(a4, &v12) == 0;
  }
  else {
    BOOL v10 = 0LL;
  }
  CFRelease(v9);
  return v10;
}

void *sub_1000DD6C8(int a1, size_t __size)
{
  return malloc(__size);
}

void sub_1000DD6D0(int a1, void *a2)
{
}

size_t sub_1000DD6D8(int a1, void *ptr)
{
  if (ptr) {
    return malloc_size(ptr);
  }
  else {
    return 0LL;
  }
}

CFStringRef sub_1000DD6EC(const __CFString *result)
{
  if (result)
  {
    uint64_t v1 = result;
    if (CFStringHasPrefix(result, @"zh")) {
      return (const __CFString *)1;
    }
    else {
      return (const __CFString *)(CFStringHasPrefix(v1, @"ja") != 0);
    }
  }

  return result;
}

CFStringRef sub_1000DD73C(CFTypeRef cf, uint64_t a2)
{
  if (!cf)
  {
    CFTypeRef v4 = *(CFTypeRef *)(a2 + 16);
    if (!v4) {
      return 0LL;
    }
    goto LABEL_5;
  }

  CFRetain(cf);
  CFTypeRef v4 = *(CFTypeRef *)(a2 + 16);
  if (v4)
  {
LABEL_5:
    CFRetain(v4);
    if (cf)
    {
      CFStringRef v5 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@.%@", cf, v4);
      CFRelease(cf);
    }

    else
    {
      CFStringRef v5 = 0LL;
    }

    goto LABEL_8;
  }

  CFStringRef v5 = 0LL;
  CFTypeRef v4 = cf;
LABEL_8:
  CFRelease(v4);
  return v5;
}

uint64_t sub_1000DD7F0( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 *a6, _BYTE *a7, __CFStringTokenizer **a8)
{
  uint64_t v13 = (unint64_t **)a1;
  CFTypeRef cf = 0LL;
  CFStringRef theString = 0LL;
  int v14 = *(unsigned __int8 *)(*(void *)a1 + 106LL);
  if (*(_BYTE *)(*(void *)a1 + 106LL)) {
    p_CFTypeRef cf = &cf;
  }
  else {
    p_CFTypeRef cf = 0LL;
  }
  unint64_t v36 = 0LL;
  if (v14) {
    *p_CFTypeRef cf = 0LL;
  }
  int v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, unint64_t *, CFStringRef *, CFTypeRef *))(a4 + 32);
  if (v16 && (a1 = v16(a4, a2, a3, a5, *(void *)(a4 + 16), &v36, &theString, p_cf), v36 >= 0xFFFFFFFFFFFFFF01LL)) {
    int v17 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v36 + 255) / 255.0)) * 255.0) + 0.0);
  }
  else {
    int v17 = 0;
  }
  if (!theString) {
    return 0LL;
  }
  CFURLRef v18 = (os_log_s *)VSGetLogDefault(a1);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v38 = theString;
    _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "#DataProvider %@", buf, 0xCu);
  }

  uint64_t v19 = sub_1000DDB84(v13, v17, theString, (const __CFString *)cf, a6);
  if (!a8) {
    goto LABEL_41;
  }
  int v33 = a7;
  uint64_t v20 = *a8;
  if (*a8)
  {
    uint64_t v21 = theString;
    v39.length = CFStringGetLength(theString);
    v39.location = 0LL;
    CFStringTokenizerSetString(v20, v21, v39);
  }

  else
  {
    uint64_t v22 = CFLocaleCopyCurrent();
    int v23 = theString;
    v40.length = CFStringGetLength(theString);
    v40.location = 0LL;
    CFStringTokenizerRef v24 = CFStringTokenizerCreate(kCFAllocatorDefault, v23, v40, 0x10000uLL, v22);
    *a8 = v24;
    if (!v22)
    {
      uint64_t v25 = v24;
      if (v24) {
        goto LABEL_21;
      }
      goto LABEL_41;
    }

    CFRelease(v22);
  }

  uint64_t v25 = *a8;
  if (*a8)
  {
LABEL_21:
    CFMutableStringRef Mutable = 0LL;
    while (CFStringTokenizerAdvanceToNextToken(v25))
    {
      int v27 = (const __CFString *)CFStringTokenizerCopyCurrentTokenAttribute(v25, 0x10000uLL);
      if (v27)
      {
        stat v28 = v27;
        if (CFStringGetLength(v27))
        {
          if (Mutable) {
            CFStringAppend(Mutable, @" ");
          }
          else {
            CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0LL);
          }
          CFStringAppend(Mutable, v28);
        }

        CFRelease(v28);
      }
    }

    a7 = v33;
    if (Mutable)
    {
      uint64_t v29 = CFStringTransform(Mutable, 0LL, @"NFC; [^\\u0000-\\u00FF] NFD; [:Mn:] Remove; NFC; ", 0);
      int v30 = (os_log_s *)VSGetLogDefault(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v38 = Mutable;
        _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#DataProvider   -ttt-> %@", buf, 0xCu);
      }

      uint64_t v19 = sub_1000DDB84(v13, v17, Mutable, (const __CFString *)cf, a6);
      if (!(_DWORD)v19)
      {
        __int16 v31 = *(void (**)(uint64_t, uint64_t, CFStringRef, CFMutableStringRef, void))(a2 + 608);
        if (v31) {
          v31(a2, a3, theString, Mutable, *(void *)(a2 + 656));
        }
      }

      CFRelease(theString);
      CFStringRef theString = Mutable;
    }

uint64_t sub_1000DDB84( unint64_t **a1, int a2, const __CFString *a3, const __CFString *a4, unsigned __int8 *a5)
{
  int v28 = 0;
  CFIndex Length = CFStringGetLength(a3);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x100u);
  CFIndex v12 = MaximumSizeForEncoding;
  usedBufLen[0] = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 1024) {
    uint64_t v13 = v31;
  }
  else {
    uint64_t v13 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
  }
  v32.location = 0LL;
  v32.length = Length;
  CFStringGetBytes(a3, v32, 0x100u, 0, 0, v13, v12, usedBufLen);
  *(_WORD *)&v13[usedBufLen[0] & 0xFFFFFFFFFFFFFFFELL] = 0;
  if (a4 && CFStringGetLength(a4))
  {
    CFIndex v14 = CFStringGetLength(a4);
    CFIndex v15 = CFStringGetMaximumSizeForEncoding(v14, 0x100u);
    CFIndex v16 = v15;
    *(void *)uint64_t v29 = v15;
    if (v15 < 1024) {
      int v17 = (UInt8 *)usedBufLen;
    }
    else {
      int v17 = (UInt8 *)malloc(v15 + 1);
    }
    v33.location = 0LL;
    v33.length = v14;
    CFStringGetBytes(a4, v33, 0x100u, 0, 0, v17, v16, (CFIndex *)v29);
    *(_WORD *)&v17[*(void *)v29 & 0xFFFFFFFFFFFFFFFELL] = 0;
    if (*a1) {
      unint64_t v18 = **a1;
    }
    else {
      unint64_t v18 = 0LL;
    }
    uint64_t v19 = sub_100044A8C(v18, a5, (char *)v13, (char *)v17, -1, a2, 0, 0, &v28);
    int v20 = v19;
    int v21 = v28;
    uint64_t v22 = (os_log_s *)VSGetLogDefault(v19);
    int v23 = v22;
    if (!v21 || v20)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)uint64_t v29 = 67109120;
        *(_DWORD *)&uint8_t v29[4] = v20;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "error %d activating spoken phrase; falling back to regular\n",
          v29,
          8u);
      }

      int v28 = 0;
    }

    else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)uint64_t v29 = 138412290;
      *(void *)&uint8_t v29[4] = a4;
      _os_log_error_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "#DataProvider -ppp-> %@", v29, 0xCu);
    }

    if (v17 != (UInt8 *)usedBufLen) {
      free(v17);
    }
  }

  if (v28)
  {
    uint64_t v24 = 0LL;
  }

  else
  {
    if (*a1) {
      unint64_t v25 = **a1;
    }
    else {
      unint64_t v25 = 0LL;
    }
    unsigned int v26 = sub_1000447E4(v25, a5, (__int16 *)v13, -1, a2, 0, 0, &v28);
    if (v28 | v26) {
      uint64_t v24 = v26;
    }
    else {
      uint64_t v24 = 1LL;
    }
  }

  if (v13 != v31) {
    free(v13);
  }
  return v24;
}

uint64_t sub_1000DDE78(uint64_t **a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v17 = 0LL;
  if (*a1) {
    uint64_t v6 = **a1;
  }
  else {
    uint64_t v6 = 0LL;
  }
  uint64_t v7 = sub_1000439B8(v6, a2, (_DWORD *)&v17 + 1);
  if ((_DWORD)v7)
  {
    int v8 = (os_log_s *)VSGetLogDefault(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "_VSElvisCreateClass";
      __int16 v20 = 2080;
      int v21 = a2;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "%s: Class %s already exists?\n",  buf,  0x16u);
    }

    return 4LL;
  }

  else
  {
    if (HIDWORD(v17))
    {
      BOOL v10 = (os_log_s *)VSGetLogDefault(v7);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        uint64_t v19 = "_VSElvisCreateClass";
        __int16 v20 = 2080;
        int v21 = a2;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s: Class %s already exists, emptying it\n",  buf,  0x16u);
      }

      if (*a1) {
        uint64_t v11 = **a1;
      }
      else {
        uint64_t v11 = 0LL;
      }
      uint64_t v13 = sub_100044F80(v11, a2, &v17);
    }

    else
    {
      if (*a1) {
        uint64_t v12 = **a1;
      }
      else {
        uint64_t v12 = 0LL;
      }
      else {
        int v14 = 4;
      }
      uint64_t v13 = sub_100043678(v12, a2, 0, 0, v14, 0, 0, &v17);
    }

    int v15 = v13;
    if ((_DWORD)v13 || !(_DWORD)v17)
    {
      CFIndex v16 = (os_log_s *)VSGetLogDefault(v13);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v19 = "_VSElvisCreateClass";
        __int16 v20 = 2080;
        int v21 = a2;
        __int16 v22 = 1024;
        int v23 = v15;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: Could not create the empty class %s (%d)\n",  buf,  0x1Cu);
      }

      return 1LL;
    }

    else
    {
      return 0LL;
    }
  }

uint64_t sub_1000DE0C0( uint64_t a1, unsigned __int8 *a2, unint64_t a3, CFArrayRef theArray, int a5, const __CFDictionary *a6, int a7, const __CFDictionary *a8, const __CFDictionary *a9)
{
  uint64_t v10 = 0xFFFFFFFFLL;
  int v171 = 1;
  unsigned int v172 = -1;
  if (!theArray) {
    return v10;
  }
  if (CFArrayGetCount(theArray) < 1) {
    return 0xFFFFFFFFLL;
  }
  int v140 = a7;
  unint64_t v141 = a2;
  int v142 = a5;
  unint64_t v143 = a3;
  int v15 = a9;
  CFIndex v16 = kCFAllocatorDefault;
  CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
  theArraya = theArray;
  CFIndex Count = CFArrayGetCount(theArray);
  int v173 = 0;
  uint64_t v19 = 0LL;
  if (Count < 1)
  {
    uint64_t v55 = 0LL;
    if (Mutable)
    {
LABEL_70:
      char v151 = v19;
      int v147 = v55;
      CFIndex v164 = CFArrayGetCount(Mutable);
      CFIndex v56 = CFArrayGetCount(Mutable);
      if (v56 < 1)
      {
        uint64_t v59 = 0LL;
      }

      else
      {
        CFIndex v57 = v56;
        CFIndex v58 = 0LL;
        uint64_t v59 = 0LL;
        do
        {
          ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v58);
          v59 += CFArrayGetCount(ValueAtIndex);
          ++v58;
        }

        while (v57 != v58);
      }

      uint64_t v19 = v151;
      if (v151)
      {
        CFIndex v160 = CFArrayGetCount(v151);
        if (v160 < 1)
        {
          int v79 = 0;
        }

        else
        {
          for (CFIndex i = 0LL; i != v160; ++i)
          {
            CFIndex v63 = CFArrayGetValueAtIndex(v19, i);
            if (*((_BYTE *)v63 + 41))
            {
              if (v15 && (Value = (const __CFArray *)CFDictionaryGetValue(v15, v63)) != 0LL)
              {
                CFStringRef v65 = Value;
                CFIndex v66 = CFArrayGetCount(Value) + 1;
                CFIndex v67 = v66 + v66 * CFArrayGetCount(v65);
                uint64_t v19 = v151;
                v59 += v67;
              }

              else
              {
                ++v59;
              }
            }

            else
            {
              uint64_t v68 = (const void *)*((void *)v63 + 6);
              CFRetain(v68);
              if (v68)
              {
                CFIndex v69 = CFArrayGetCount((CFArrayRef)v68);
                if (v69 >= 1)
                {
                  CFIndex v70 = v69;
                  for (CFIndex j = 0LL; j != v70; ++j)
                  {
                    uint64_t v72 = (CFArrayRef *)CFArrayGetValueAtIndex((CFArrayRef)v68, j);
                    CFIndex v73 = CFArrayGetCount(v72[2]);
                    CFIndex v74 = CFArrayGetValueAtIndex(v72[2], v73);
                    if (v15)
                    {
                      uint64_t v75 = (const __CFArray *)CFDictionaryGetValue(v15, v74);
                      if (v75) {
                        uint64_t v75 = (const __CFArray *)CFArrayGetCount(v75);
                      }
                      uint64_t v76 = (uint64_t)v75 + 1;
                      uint64_t v77 = CFArrayGetValueAtIndex(v72[2], 0LL);
                      CFIndex v78 = (CFIndex)CFDictionaryGetValue(v15, v77);
                      if (v78) {
                        CFIndex v78 = CFArrayGetCount((CFArrayRef)v78);
                      }
                    }

                    else
                    {
                      CFArrayGetValueAtIndex(v72[2], 0LL);
                      CFIndex v78 = 0LL;
                      uint64_t v76 = 1LL;
                    }

                    v59 += v76 + v76 * v78;
                  }
                }

                CFRelease(v68);
              }

              uint64_t v19 = v151;
            }
          }

          int v79 = 1;
          CFIndex v16 = kCFAllocatorDefault;
        }
      }

      else
      {
        int v79 = 0;
        CFIndex v160 = 0LL;
      }

      if (v143 >= 0xFFFFFFFFFFFFFF01LL) {
        signed int v168 = llroundf((float)((float)(1.0 - (float)((float)(uint64_t)(v143 + 255) / 255.0)) * 255.0) + 0.0);
      }
      else {
        signed int v168 = 0;
      }
      BOOL v80 = 1;
      if (!v140 && v168 <= 0)
      {
        if (a6) {
          BOOL v80 = CFDictionaryGetCount(a6) > 0;
        }
        else {
          BOOL v80 = 0;
        }
      }

      uint64_t v81 = sub_1000453C4(a1, v141, v142, v59, v80, &v172);
      int v61 = v81;
      if ((_DWORD)v81)
      {
        uint64_t v82 = (os_log_s *)VSGetLogDefault(v81);
        uint64_t v81 = os_log_type_enabled(v82, OS_LOG_TYPE_ERROR);
        if ((_DWORD)v81)
        {
          *(_DWORD *)newValues = 67109890;
          *(_DWORD *)&newValues[4] = v61;
          *(_WORD *)&newValues[8] = 2080;
          *(void *)&newValues[10] = "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSElvis.c";
          *(_WORD *)&newValues[18] = 1024;
          *(_DWORD *)&newValues[20] = 840;
          LOWORD(v175[0]) = 2080;
          *(void *)((char *)v175 + 2) = "couldn't create constraint";
          _os_log_error_impl( (void *)&_mh_execute_header,  v82,  OS_LOG_TYPE_ERROR,  "Error %d at %s:%d (%s)\n",  newValues,  0x22u);
        }
      }

      if (v172 == -1)
      {
        int v61 = 1;
        goto LABEL_213;
      }

      int v155 = v79;
      uint64_t v83 = (os_log_s *)VSGetLogDefault(v81);
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)newValues = 134218240;
        *(void *)&newValues[4] = v143;
        *(_WORD *)&newValues[12] = 1024;
        *(_DWORD *)&newValues[14] = v168;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v83,  OS_LOG_TYPE_DEBUG,  "Configuring sequences with weight %ld (%d):\n",  newValues,  0x12u);
      }

      if (v164 >= 1 && !v61)
      {
        CFIndex v84 = 0LL;
        while (1)
        {
          CFIndex v85 = v84;
          int v86 = (const __CFArray *)CFArrayGetValueAtIndex(Mutable, v84);
          uint64_t v87 = CFArrayGetCount(v86);
          if (v87 < 1 || v171 == 0)
          {
            uint64_t v89 = 0LL;
            int v61 = 0;
            BOOL v90 = 1;
          }

          else
          {
            uint64_t v91 = v87;
            CFIndex v92 = 0LL;
            uint64_t v93 = 0LL;
            while (1)
            {
              uint64_t v94 = (void *)CFArrayGetValueAtIndex(v86, v92);
              uint64_t v89 = v94;
              if (v92)
              {
                uint32_t v95 = (os_log_s *)VSGetLogDefault(v94);
                if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
                {
                  *(_WORD *)newValues = 0;
                  _os_log_debug_impl((void *)&_mh_execute_header, v95, OS_LOG_TYPE_DEBUG, " -> ", newValues, 2u);
                }
              }

              else
              {
                uint64_t v93 = "_CONSTRAINT_CLASS_START";
              }

              uint64_t v87 = (uint64_t)a6;
              if (!v89) {
                break;
              }
              if (v92) {
                unsigned int v96 = 0;
              }
              else {
                unsigned int v96 = v168;
              }
              if (a6)
              {
                uint64_t v87 = (uint64_t)CFDictionaryGetValue(a6, v89);
                v96 += v87;
              }

              uint64_t v97 = (os_log_s *)VSGetLogDefault(v87);
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)newValues = 136315394;
                *(void *)&newValues[4] = v89;
                *(_WORD *)&newValues[12] = 1024;
                *(_DWORD *)&newValues[14] = v96;
                _os_log_debug_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "%s (%d)", newValues, 0x12u);
              }

              uint64_t v87 = sub_100045674(a1, v172, v93, (char *)v89, v96, &v171);
              BOOL v90 = v87 == 0;
              int v61 = v87;
              if (++v92 < v91 && !(_DWORD)v87)
              {
                uint64_t v93 = (char *)v89;
                if (v171) {
                  continue;
                }
              }

              goto LABEL_143;
            }

            BOOL v90 = 0;
            int v61 = 1;
          }

LABEL_213:
        CFRelease(Mutable);
        uint64_t v55 = v147;
        if (!v19) {
          goto LABEL_215;
        }
        goto LABEL_214;
      }

LABEL_215:
  if (v55) {
    CFRelease(v55);
  }
  uint64_t v10 = v172;
  if (v61 && v172 != -1)
  {
    sub_100042C48(a1, v172);
    return 0xFFFFFFFFLL;
  }

  return v10;
}

void sub_1000DF11C(OpaqueAudioQueue *a1, int a2)
{
  int inData = a2;
  OSStatus v2 = AudioQueueSetProperty(a1, 0x61716D65u, &inData, 4u);
  if (v2)
  {
    CFStringRef v3 = sub_1000E2648(v2);
    CFTypeRef v4 = (os_log_s *)VSGetLogDefault(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v8 = "_VSAudioQueueSetLevelMeteringPropertyValue";
      *(_DWORD *)buf = 136315650;
      if (inData) {
        CFStringRef v5 = "enabling";
      }
      else {
        CFStringRef v5 = "disabling";
      }
      __int16 v9 = 2112;
      CFStringRef v10 = v3;
      __int16 v11 = 2080;
      uint64_t v12 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "%s: error %@ %s level metering\n",  buf,  0x20u);
    }

    CFRelease(v3);
  }

void sub_1000DF21C( mach_port_name_t a1, int a2, const char *a3, const char *a4, UInt8 *bytes, CFIndex numBytes, const UInt8 *a7, unsigned int a8, double a9, __int16 a10, unsigned __int8 a11, _BYTE *a12)
{
  CFStringRef v19 = 0LL;
  uint64_t v39 = 0LL;
  *(_OWORD *)CFIndex v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  if (bytes
    && (_DWORD)numBytes
    && (CFStringRef v19 = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, numBytes, 0x8000100u, 0)) == 0LL
    || ((__int16 v20 = (const __CFDictionary *)sub_1000E4930()) == 0LL
     || (CFIndex v21 = v20, v22 = CFDictionaryContainsKey(v20, v19), CFRelease(v21), !v22))
    && CFStringCompare(v19, @"_default", 0LL))
  {
    int v23 = 0;
    goto LABEL_14;
  }

  pthread_mutex_lock(&stru_1000FD7B0);
  CFIndex v24 = (const __CFString *)sub_1000EA4E0();
  if (v24 || qword_100102A28 && !*(_DWORD *)qword_100102A28)
  {
    unint64_t v25 = (os_log_s *)VSGetLogDefault(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v41 = "server_VSRecognitionPrepareOrBegin";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEBUG,  "%s: recognition requested when busy\n",  buf,  0xCu);
    }
  }

  else
  {
    LODWORD(v35) = 0;
    if (!a8) {
      goto LABEL_33;
    }
    CFDataRef v26 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, a7, a8, kCFAllocatorNull);
    if (v26)
    {
      CFDataRef v27 = v26;
      int v28 = (const void *)VSCFPropertyListCreateFromBinaryXMLData(kCFAllocatorDefault, v26);
      if (v28)
      {
        uint64_t v29 = v28;
        CFTypeID v30 = CFGetTypeID(v28);
        if (v30 == CFDictionaryGetTypeID())
        {
          cf[1] = (CFTypeRef)VSRecognitionDisambiguationContextCreateFromDictionaryRepresentation( kCFAllocatorDefault,  v29);
          CFRelease(v29);
          CFRelease(v27);
LABEL_33:
          if (*a3)
          {
            CFIndex v24 = CFStringCreateWithCString(kCFAllocatorDefault, a3, 0x8000100u);
            if (v24)
            {
              __int16 v31 = v24;
              v37[0] = (CFTypeRef)VSLogBundleCreateFromPath(kCFAllocatorDefault, v24);
              CFRelease(v31);
            }
          }

          if (*a4)
          {
            CFIndex v24 = CFStringCreateWithCString(kCFAllocatorDefault, a4, 0x8000100u);
            if (v24)
            {
              CFRange v32 = v24;
              v37[1] = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, v24, kCFURLPOSIXPathStyle, 0);
              CFRelease(v32);
            }
          }

          CFRange v33 = (os_log_s *)VSGetLogDefault(v24);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315138;
            uint64_t v41 = "server_VSRecognitionPrepareOrBegin";
            _os_log_debug_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_DEBUG,  "%s: allowing recognition start\n",  buf,  0xCu);
          }

          DWORD2(v35) = a1;
          cf[0] = v19;
          LODWORD(v38) = a2;
          *((double *)&v38 + 1) = a9;
          LOWORD(v39) = a10;
          BYTE2(v39) = a11;
          sub_1000EB730(a11);
          sub_1000DF634(&v35);
          int v23 = 1;
          goto LABEL_12;
        }

        CFRelease(v29);
      }

      CFRelease(v27);
    }

    int v34 = (os_log_s *)VSGetLogDefault(v26);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v41 = "server_VSRecognitionPrepareOrBegin";
      _os_log_error_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_ERROR,  "%s: error converting disambiguation context\n",  buf,  0xCu);
    }
  }

  int v23 = 0;
LABEL_12:
  pthread_mutex_unlock(&stru_1000FD7B0);
  if (cf[1]) {
    CFRelease(cf[1]);
  }
LABEL_14:
  if (v37[0]) {
    CFRelease(v37[0]);
  }
  if (v37[1]) {
    CFRelease(v37[1]);
  }
  if (a12) {
    *a12 = v23;
  }
  if (v19) {
    CFRelease(v19);
  }
  if (a1 - 1 <= 0xFFFFFFFD && !v23) {
    mach_port_deallocate(mach_task_self_, a1);
  }
}

void sub_1000DF634(void *value)
{
  CFMutableStringRef Mutable = (const __CFArray *)qword_100102B38;
  if (!qword_100102B38)
  {
    callBacks.versioCFIndex n = 0LL;
    callBacks.info = sub_1000EA2CC;
    memset(&callBacks.retain, 0, 24);
    CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, (const CFArrayCallBacks *)&callBacks);
    qword_100102B38 = (uint64_t)Mutable;
  }

  if (*(_DWORD *)value != 1) {
    goto LABEL_16;
  }
  CFIndex Count = CFArrayGetCount(Mutable);
  if (!value[1])
  {
    sub_1000EA3A0(1);
    goto LABEL_16;
  }

  CFIndex v4 = Count;
  if (Count < 1)
  {
LABEL_16:
    CFArrayAppendValue((CFMutableArrayRef)qword_100102B38, value);
    if ((byte_100102A48 & 1) == 0)
    {
      CFRunLoopSourceRef v9 = (CFRunLoopSourceRef)qword_100102A30;
      if (!qword_100102A30)
      {
        *(_OWORD *)&callBacks.cancel = unk_1000FA4F0;
        memset(&callBacks, 0, 64);
        CFRunLoopSourceRef v9 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0LL, &callBacks);
        qword_100102A30 = (uint64_t)v9;
      }

      byte_100102A48 = 1;
      pthread_attr_init((pthread_attr_t *)&callBacks);
      pthread_attr_setdetachstate((pthread_attr_t *)&callBacks, 2);
      pthread_create(&v10, (const pthread_attr_t *)&callBacks, (void *(__cdecl *)(void *))sub_1000DF838, v9);
      pthread_attr_destroy((pthread_attr_t *)&callBacks);
    }

    if (qword_100102A30)
    {
      if (qword_100102A38)
      {
        CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100102A30);
        CFRunLoopWakeUp((CFRunLoopRef)qword_100102A38);
      }
    }

    return;
  }

  CFIndex v5 = 0LL;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100102B38, v5);
    uint64_t v7 = (const __CFString *)ValueAtIndex[1];
    if (!v7) {
      break;
    }
    int v8 = (const __CFString *)value[1];
    if (v8 && CFStringCompare(v7, v8, 0LL) == kCFCompareEqualTo)
    {
      if (!ValueAtIndex[2]) {
        return;
      }
      if (!value[2])
      {
        CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100102B38, v5);
        sub_1000EA438(kCFAllocatorDefault, ValueAtIndex);
        --v4;
        --v5;
      }
    }

    if (++v5 >= v4) {
      goto LABEL_16;
    }
  }

uint64_t sub_1000DF838(__CFRunLoopSource *a1)
{
  char v166 = 0;
  memset(&v147, 0, sizeof(v147));
  __int128 context = 0u;
  __int128 v149 = 0u;
  __int128 v150 = 0u;
  *(_OWORD *)CFTypeRef cf = 0u;
  __int128 v152 = 0u;
  __int128 v153 = 0u;
  __int128 v154 = 0u;
  __int128 v155 = 0u;
  __int128 v156 = 0u;
  __int128 v157 = 0u;
  __int128 v158 = 0u;
  *(_OWORD *)CFIndex v159 = 0u;
  *(_OWORD *)inAQ = 0u;
  v161[1] = 0LL;
  *(_OWORD *)CFTypeRef cf1 = 0u;
  *(_OWORD *)inExtAudioFile = 0u;
  *(_OWORD *)inAudioFile = 0u;
  unint64_t v165 = 0xFFFFFFFF00000000LL;
  LODWORD(inAQ[0]) = -1;
  v161[0] = (CFTypeRef)-1LL;
  Current = CFRunLoopGetCurrent();
  CFStringRef v3 = sub_1000E2268((void (__cdecl *)(void *))sub_1000E111C, &v166);
  if (v3) {
    CFRunLoopAddSource(Current, v3, kCFRunLoopDefaultMode);
  }
  if (a1) {
    CFRunLoopAddSource(Current, a1, kCFRunLoopDefaultMode);
  }
  if (v166) {
    goto LABEL_6;
  }
  int v146 = 0;
  int v145 = 0;
  CFStringRef theString = (const __CFString *)kVSServerRecognitionPreparedNotification;
  uint64_t v144 = kVSServerRecognitionErrorCodeKey;
  CFIndex v5 = &unk_100102000;
  Float64 v141 = kVSServerRecognitionResultsKey;
  int v142 = (const __CFString *)kVSServerRecognitionResultsNotification;
  unint64_t v143 = (const __CFString *)kVSServerRecognitionErrorNotification;
  do
  {
    pthread_mutex_lock(&stru_1000FD7B0);
    if (!qword_100102A38) {
      qword_100102A38 = (uint64_t)Current;
    }
    if (!qword_100102B38 || CFArrayGetCount((CFArrayRef)qword_100102B38) <= 0)
    {
      v5[325] = 0LL;
      pthread_mutex_unlock(&stru_1000FD7B0);
LABEL_31:
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      continue;
    }

    ValueAtIndex = (char *)CFArrayGetValueAtIndex((CFArrayRef)qword_100102B38, 0LL);
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100102B38, 0LL);
    v5[325] = ValueAtIndex;
    pthread_mutex_unlock(&stru_1000FD7B0);
    if (!ValueAtIndex) {
      goto LABEL_31;
    }
    object = (void *)os_transaction_create("com.apple.voiceservices.recognition");
    sub_1000E234C(v3, 1);
    CFIndex v139 = Current;
    if (*(_DWORD *)ValueAtIndex == 1)
    {
      uint64_t v7 = v5;
      int v146 = *((_DWORD *)ValueAtIndex + 6);
      int v145 = getiopolicy_np(0, 1);
      setiopolicy_np(0, 1, 3);
      uint64_t v8 = setpriority(3, 0, 4096);
      if (!(_DWORD)v8)
      {
        CFRunLoopSourceRef v9 = (os_log_s *)VSGetLogDefault(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(outPropertyData.mSampleRate) = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "Running with background thread priority",  (uint8_t *)&outPropertyData,  2u);
        }
      }

      CFIndex v5 = v7;
      if (*(_DWORD *)ValueAtIndex)
      {
LABEL_38:
        pthread_t v10 = 0LL;
        cf1[1] = 0LL;
        BYTE5(inAQ[0]) = 1;
        *(void *)((char *)&context + 4) = 0LL;
        inExtAudioFile[1] = 0LL;
        inAudioFile[0] = 0LL;
        theString1 = @"_default";
        inExtAudioFile[0] = 0LL;
        goto LABEL_44;
      }
    }

    else
    {
      if (*(_DWORD *)ValueAtIndex) {
        goto LABEL_38;
      }
      int v146 = *((_DWORD *)ValueAtIndex + 12);
    }

    unsigned int v11 = *((_DWORD *)ValueAtIndex + 2);
    cf1[1] = *((CFTypeRef *)ValueAtIndex + 4);
    *(_WORD *)((char *)inAQ + 5) = *(_WORD *)(ValueAtIndex + 65);
    BYTE4(inAQ[0]) = ValueAtIndex[64];
    uint64_t v12 = (OpaqueExtAudioFile *)*((void *)ValueAtIndex + 5);
    inExtAudioFile[1] = v12;
    inAudioFile[1] = *((AudioFileID *)ValueAtIndex + 7);
    pthread_t v10 = (const void *)*((void *)ValueAtIndex + 3);
    theString1 = (const __CFString *)*((void *)ValueAtIndex + 2);
    inExtAudioFile[0] = 0LL;
    inAudioFile[0] = 0LL;
    *(void *)((char *)&context + 4) = v11;
    if (v12)
    {
      uint64_t v13 = AudioFileOpenURL(v12, kAudioFileReadPermission, 0x57415645u, inAudioFile);
      if ((_DWORD)v13)
      {
        int v14 = v5;
        int v15 = (os_log_s *)VSGetLogDefault(v13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(outPropertyData.mSampleRate) = 0;
          _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "couldn't open audio input file for reading\n",  (uint8_t *)&outPropertyData,  2u);
        }

        DWORD2(context) = -4006;
        CFIndex v5 = v14;
      }
    }

LABEL_170:
      if ((void)v153) {
        CFSetApplyFunction(v53, (CFSetApplierFunction)sub_1000E1270, &context);
      }
      goto LABEL_172;
    }

    CFIndex v5 = (void *)&unk_100102000;
    if (v159[1]) {
      goto LABEL_170;
    }
    DWORD2(context) = sub_1000E2B58(0LL, 0LL, &v149, (CFURLRef *)&v159[1]);
LABEL_172:
    if (cf1[0]) {
      CFRelease(cf1[0]);
    }
    cf1[0] = v53;
LABEL_175:
    int v57 = DWORD2(context);
    if (DWORD2(context)) {
      goto LABEL_185;
    }
LABEL_186:
    if (*(_DWORD *)ValueAtIndex == 1) {
      goto LABEL_198;
    }
    if (*(_DWORD *)ValueAtIndex)
    {
      int v61 = 0LL;
      goto LABEL_302;
    }

    signed int v60 = CFMachPortCreateWithPort( kCFAllocatorDefault,  *((_DWORD *)ValueAtIndex + 2),  (CFMachPortCallBack)nullsub_16,  &v147,  0LL);
    int v61 = v60;
    if (!v60)
    {
      CFIndex v63 = (os_log_s *)VSGetLogDefault(0LL);
      if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(outPropertyData.mSampleRate) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v63,  OS_LOG_TYPE_DEBUG,  "couldn't create instance for client port - cancelling\n",  (uint8_t *)&outPropertyData,  2u);
      }

      goto LABEL_206;
    }

    CFMachPortSetInvalidationCallBack(v60, (CFMachPortInvalidationCallBack)sub_1000E12B8);
    if (DWORD2(context)) {
      goto LABEL_207;
    }
    int v62 = ((uint64_t (*)(__int128 *, CFTypeRef, CFTypeRef, void))v157)( &v149,  cf1[0],  cf1[1],  BYTE5(inAQ[0]));
    DWORD2(context) = v62;
    if (v62)
    {
      syslog( 3,  "Error %d at %s:%d (%s)\n",  v62,  "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c",  1011,  "couldn't start recognition");
      if (DWORD2(context)) {
        goto LABEL_207;
      }
    }

    if (inExtAudioFile[1]) {
      goto LABEL_246;
    }
    if (inAQ[1])
    {
      if (sub_1000EB6A4() != v161[0]) {
        sub_1000E116C((uint64_t)&context);
      }
      if (inAQ[1])
      {
        sub_1000EB730(BYTE6(inAQ[0]));
        sub_1000EB6E0(1, 3LL);
        LOBYTE(v165) = 1;
        goto LABEL_236;
      }
    }

    v161[0] = sub_1000EB6A4();
    Float64 v64 = *(double *)&v150;
    AudioQueueBufferRef outBuffer = 0LL;
    *(void *)ioDataSize = 0LL;
    CFStringRef v65 = (void *)objc_claimAutoreleasedReturnValue(+[VSAudioSession sharedInstance](&OBJC_CLASS___VSAudioSession, "sharedInstance"));
    [v65 _safeSetCategoryForActivity:1];

    outPropertyData.double mSampleRate = v64;
    *(_OWORD *)&outPropertyData.mFormatID = xmmword_1000F2890;
    *(_OWORD *)&outPropertyData.mBytesPerFrame = xmmword_1000F28A0;
    CFIndex v66 = CFRunLoopGetCurrent();
    OSStatus v67 = AudioQueueNewInput( &outPropertyData,  (AudioQueueInputCallback)sub_1000E1368,  &context,  v66,  kCFRunLoopCommonModes,  0,  (AudioQueueRef *)ioDataSize);
    if (!v67)
    {
      int inData = 127;
      OSStatus v68 = AudioQueueSetProperty(*(AudioQueueRef *)ioDataSize, 0x73726371u, &inData, 4u);
      if (v68)
      {
        CFStringRef v69 = sub_1000E2648(v68);
        CFIndex v70 = (os_log_s *)VSGetLogDefault(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v69;
          _os_log_error_impl( (void *)&_mh_execute_header,  v70,  OS_LOG_TYPE_ERROR,  "error setting SRC quality: %@\n",  buf,  0xCu);
        }

        CFRelease(v69);
      }

      unint64_t v71 = 0LL;
      UInt32 v72 = (outPropertyData.mSampleRate * (float)((float)outPropertyData.mBytesPerPacket * 0.05));
      do
      {
        OSStatus v67 = AudioQueueAllocateBuffer(*(AudioQueueRef *)ioDataSize, v72, &outBuffer);
        if (v67) {
          BOOL v73 = 1;
        }
        else {
          BOOL v73 = outBuffer == 0LL;
        }
        if (!v73) {
          OSStatus v67 = AudioQueueEnqueueBuffer(*(AudioQueueRef *)ioDataSize, outBuffer, 0, 0LL);
        }
        if (v71 > 4) {
          break;
        }
        ++v71;
      }

      while (!v67);
    }

    AudioQueueRef v74 = *(AudioQueueRef *)ioDataSize;
    if (*(void *)ioDataSize && v67)
    {
      AudioQueueDispose(*(AudioQueueRef *)ioDataSize, 1u);
      uint64_t v75 = 0LL;
    }

    else
    {
      pthread_mutex_lock(&stru_1000FDA50);
      uint64_t v76 = (__CFSet *)qword_100102B50;
      if (!qword_100102B50)
      {
        uint64_t v76 = CFSetCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
        qword_100102B50 = (uint64_t)v76;
      }

      CFSetAddValue(v76, v74);
      pthread_mutex_unlock(&stru_1000FDA50);
      uint64_t v75 = *(OpaqueAudioQueue **)ioDataSize;
    }

    inAQ[1] = v75;
    uint64_t v77 = AudioQueueAddPropertyListener(v75, 0x6171726Eu, (AudioQueuePropertyListenerProc)sub_1000E1474, &context);
    if ((_DWORD)v77)
    {
      CFStringRef v78 = sub_1000E2648(v77);
      int v79 = (os_log_s *)VSGetLogDefault(v78);
      if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
      {
        LODWORD(outPropertyData.mSampleRate) = 138412290;
        *(void *)((char *)&outPropertyData.mSampleRate + 4) = v78;
        _os_log_error_impl( (void *)&_mh_execute_header,  v79,  OS_LOG_TYPE_ERROR,  "couldn't add listener for queue running state (%@)\n",  (uint8_t *)&outPropertyData,  0xCu);
      }

      CFRelease(v78);
    }

    if (!inAQ[1])
    {
      uint64_t v87 = (os_log_s *)VSGetLogDefault(v77);
      if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
      {
        LOWORD(outPropertyData.mSampleRate) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v87,  OS_LOG_TYPE_ERROR,  "couldn't create audio queue\n",  (uint8_t *)&outPropertyData,  2u);
      }

LABEL_206:
      DWORD2(context) = -4001;
      goto LABEL_207;
    }

    sub_1000EB730(BYTE6(inAQ[0]));
    sub_1000EB6E0(1, 3LL);
    LOBYTE(v165) = 1;
    AudioQueueStart(inAQ[1], 0LL);
    AudioQueuePause(inAQ[1]);
    AudioQueueReset(inAQ[1]);
LABEL_236:
    sub_1000E14D8(45, (int *)&v165 + 1);
    if (cf1[1])
    {
      uint64_t v80 = VSLogBundleCopyURLForFile(cf1[1], @"recording.wav", 1LL);
      if (v80)
      {
        uint64_t v81 = (const __CFURL *)v80;
        *(_DWORD *)buf = 40;
        AudioQueueGetProperty(inAQ[1], 0x61716674u, &outPropertyData, (UInt32 *)buf);
        ExtAudioFileCreateWithURL(v81, 0x57415645u, &outPropertyData, 0LL, 1u, inExtAudioFile);
        CFRelease(v81);
      }
    }

    if (v161[1])
    {
      unsigned int v131 = a1;
      CFIndex v82 = CFArrayGetCount((CFArrayRef)v161[1]);
      if (v82 >= 1)
      {
        CFIndex v83 = v82;
        for (CFIndex i = 0LL; i != v83; ++i)
        {
          CFIndex v85 = inAQ[1];
          int v86 = (AudioQueueBuffer *)CFArrayGetValueAtIndex((CFArrayRef)v161[1], i);
          AudioQueueEnqueueBuffer(v85, v86, 0, 0LL);
        }
      }

      CFArrayRemoveAllValues((CFMutableArrayRef)v161[1]);
      a1 = v131;
    }

LABEL_207:
    if (inAudioFile[0]) {
      AudioFileClose(inAudioFile[0]);
    }
LABEL_209:
    qword_100102A50 = (uint64_t)&context;
    if (BYTE4(inAQ[0])) {
      goto LABEL_268;
    }
LABEL_267:
    sub_1000E15B8((uint64_t)&context);
LABEL_268:
    while (!v166 && !DWORD2(context))
    {
      int v94 = BYTE4(inAQ[0]);
      if ((BYTE4(inAQ[0]) != 1 || (_DWORD)context != 0) && (BYTE4(inAQ[0]) || (_DWORD)context != 1)) {
        break;
      }
      CFRunLoopRunInMode(kCFRunLoopDefaultMode, 1.79769313e308, 1u);
      if (v94) {
        BOOL v97 = BYTE4(inAQ[0]) == 0;
      }
      else {
        BOOL v97 = 0;
      }
      if (v97 && (_DWORD)context == 0) {
        goto LABEL_267;
      }
    }

    qword_100102A50 = 0LL;
    if (inAQ[1])
    {
      AudioQueuePause(inAQ[1]);
      AudioQueueFlush(inAQ[1]);
      AudioQueueReset(inAQ[1]);
      pthread_mutex_lock(&stru_1000FD7B0);
      qword_100102A40 = 0LL;
      pthread_mutex_unlock(&stru_1000FD7B0);
      sub_1000DF11C(inAQ[1], 0);
      if (HIDWORD(v165) != -1) {
        sub_1000E14D8(SHIDWORD(v165), 0LL);
      }
    }

    if ((_BYTE)v165)
    {
      sub_1000EB6E0(0, 3LL);
      LOBYTE(v165) = 0;
    }

    if (inAudioFile[0])
    {
      AudioFileClose(inAudioFile[0]);
      inAudioFile[0] = 0LL;
    }

    if ((void)v158)
    {
      int v99 = ((uint64_t (*)(__int128 *))v158)(&v149);
      int v100 = v99;
      if (v99) {
        syslog( 3,  "Error %d at %s:%d\n",  v99,  "/Library/Caches/com.apple.xbs/Sources/VoiceServicesDaemons/Daemon/VSRecognitionServer.c",  1299);
      }
      if (!DWORD2(context)) {
        DWORD2(context) = v100;
      }
    }

    if (inExtAudioFile[0])
    {
      ExtAudioFileDispose(inExtAudioFile[0]);
      inExtAudioFile[0] = 0LL;
    }

    CFIndex v5 = &unk_100102000;
LABEL_302:
    pthread_mutex_lock(&stru_1000FD7B0);
    v5[325] = 0LL;
    pthread_mutex_unlock(&stru_1000FD7B0);
    if (v61)
    {
      CFMachPortSetInvalidationCallBack(v61, 0LL);
      CFRelease(v61);
    }

    if (*(_DWORD *)ValueAtIndex == 1)
    {
      setiopolicy_np(0, 1, v145);
      setpriority(3, 0, 0);
      Current = v139;
    }

    else
    {
      Current = v139;
      if (!*(_DWORD *)ValueAtIndex)
      {
        mach_port_t v101 = *((_DWORD *)ValueAtIndex + 2);
        uint64_t v132 = a1;
        if (!DWORD2(context) && (_DWORD)context == 3)
        {
          if (*((void *)&v158 + 1))
          {
            CFIndex v102 = (const __CFArray *)(*((uint64_t (**)(__int128 *, CFTypeRef, CFTypeRef))&v158 + 1))( &v149,  cf1[0],  cf1[1]);
            CFRange v103 = v102;
            if (v102)
            {
              CFIndex v104 = CFArrayGetCount(v102);
              if (v104 >= 1)
              {
                CFIndex v105 = v104;
                uint64_t v106 = (os_log_s *)VSGetLogDefault(v104);
                BOOL v107 = os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG);
                if (v107)
                {
                  BOOL v108 = (os_log_s *)VSGetLogDefault(v107);
                  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
                  {
                    LOWORD(outPropertyData.mSampleRate) = 0;
                    _os_log_debug_impl( (void *)&_mh_execute_header,  v108,  OS_LOG_TYPE_DEBUG,  " \nRecognition results:\n--------------------\n",  (uint8_t *)&outPropertyData,  2u);
                  }

                  v176.locatioCFIndex n = 0LL;
                  v176.length = v105;
                  CFArrayApplyFunction(v103, v176, (CFArrayApplierFunction)sub_1000E1A54, 0LL);
                }

                CFMutableArrayRef v109 = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
                v177.locatioCFIndex n = 0LL;
                v177.length = v105;
                CFArrayApplyFunction(v103, v177, (CFArrayApplierFunction)sub_1000E1AF0, v109);
                outPropertyData.double mSampleRate = v141;
                *(void *)buf = v109;
                CFIndex v110 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&outPropertyData,  (const void **)buf,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
LABEL_324:
                BOOL v116 = sub_1000E2474(v101, v142, v110);
                if (!v116 && (uint64_t v117 = (os_log_s *)VSGetLogDefault(v116), os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)))
                {
                  LODWORD(outPropertyData.mSampleRate) = 136315138;
                  *(void *)((char *)&outPropertyData.mSampleRate + 4) = "_SendChoices";
                  _os_log_error_impl( (void *)&_mh_execute_header,  v117,  OS_LOG_TYPE_ERROR,  "%s: error posting client completion notification\n",  (uint8_t *)&outPropertyData,  0xCu);
                  if (v103) {
LABEL_327:
                  }
                    CFRelease(v103);
                }

                else if (v103)
                {
                  goto LABEL_327;
                }

                if (v110) {
                  CFRelease(v110);
                }
                Current = v139;
                if (v109)
                {
                  CFMutableArrayRef v115 = v109;
LABEL_332:
                  CFRelease(v115);
                }

                goto LABEL_333;
              }
            }
          }

          else
          {
            CFRange v103 = 0LL;
          }

          CFMutableArrayRef v109 = 0LL;
          CFIndex v110 = 0LL;
          goto LABEL_324;
        }

        *(void *)buf = -4001LL;
        CFIndex v111 = (AudioQueueBuffer *)CFNumberCreate(kCFAllocatorDefault, kCFNumberCFIndexType, buf);
        AudioQueueBufferRef outBuffer = v111;
        *(void *)ioDataSize = v144;
        unint64_t v112 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)ioDataSize,  (const void **)&outBuffer,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
        CFRelease(v111);
        BOOL v113 = sub_1000E2474(v101, v143, v112);
        if (!v113)
        {
          CFIndex v114 = (os_log_s *)VSGetLogDefault(v113);
          if (os_log_type_enabled(v114, OS_LOG_TYPE_ERROR))
          {
            LODWORD(outPropertyData.mSampleRate) = 136315138;
            *(void *)((char *)&outPropertyData.mSampleRate + 4) = "_SendChoices";
            _os_log_error_impl( (void *)&_mh_execute_header,  v114,  OS_LOG_TYPE_ERROR,  "%s: error posting client error notification\n",  (uint8_t *)&outPropertyData,  0xCu);
          }
        }

        if (v112)
        {
          CFMutableArrayRef v115 = v112;
          goto LABEL_332;
        }

LABEL_333:
        a1 = v132;
        CFIndex v5 = (void *)&unk_100102000;
        if (v159[0]) {
          ((void (*)(__int128 *))v159[0])(&v149);
        }
      }
    }

    sub_1000EA438(kCFAllocatorDefault, ValueAtIndex);
    sub_1000E234C(v3, 0);
    os_release(object);
    LODWORD(context) = 0;
  }

  while (!v166);
LABEL_6:
  if (a1) {
    CFRunLoopRemoveSource(Current, a1, kCFRunLoopDefaultMode);
  }
  if (*((void *)&v152 + 1)) {
    (*((void (**)(__int128 *))&v152 + 1))(&v149);
  }
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (cf1[0])
  {
    CFRelease(cf1[0]);
    cf1[0] = 0LL;
  }

  if (v159[1])
  {
    CFRelease(v159[1]);
    v159[1] = 0LL;
  }

  sub_1000E116C((uint64_t)&context);
  if (v161[1])
  {
    CFRelease(v161[1]);
    v161[1] = 0LL;
  }

  if (v3)
  {
    sub_1000E2408(v3);
    CFRunLoopSourceInvalidate(v3);
    CFRelease(v3);
  }

  return 0LL;
}

_BYTE *sub_1000E111C(_BYTE *result)
{
  if (result)
  {
    uint64_t v1 = result;
    pthread_mutex_lock(&stru_1000FD7B0);
    byte_100102A48 = 0;
    qword_100102A38 = 0LL;
    uint64_t result = (_BYTE *)pthread_mutex_unlock(&stru_1000FD7B0);
    *uint64_t v1 = 1;
  }

  return result;
}

void sub_1000E116C(uint64_t a1)
{
  OSStatus v2 = *(OpaqueAudioQueue **)(a1 + 200);
  if (v2)
  {
    sub_1000DF11C(v2, 0);
    CFStringRef v3 = *(const void **)(a1 + 200);
    pthread_mutex_lock(&stru_1000FDA50);
    if (qword_100102B50) {
      CFSetRemoveValue((CFMutableSetRef)qword_100102B50, v3);
    }
    pthread_mutex_unlock(&stru_1000FDA50);
    AudioQueueRemovePropertyListener( *(AudioQueueRef *)(a1 + 200),  0x6171726Eu,  (AudioQueuePropertyListenerProc)sub_1000E1474,  (void *)a1);
    AudioQueueStop(*(AudioQueueRef *)(a1 + 200), 1u);
    AudioQueueFlush(*(AudioQueueRef *)(a1 + 200));
    AudioQueueReset(*(AudioQueueRef *)(a1 + 200));
    AudioQueueDispose(*(AudioQueueRef *)(a1 + 200), 0);
    *(void *)(a1 + 200) = 0LL;
    *(void *)(a1 + 208) = -1LL;
    CFIndex v4 = *(__CFArray **)(a1 + 216);
    if (v4) {
      CFArrayRemoveAllValues(v4);
    }
  }

uint64_t sub_1000E1228(uint64_t result, uint64_t a2)
{
  if (result && a2 && !*(_DWORD *)(a2 + 8))
  {
    CFStringRef v3 = *(uint64_t (**)(uint64_t, uint64_t, void))(a2 + 88);
    if (v3)
    {
      uint64_t result = v3(a2 + 16, result, 0LL);
      *(_DWORD *)(a2 + 8) = result;
    }
  }

  return result;
}

uint64_t sub_1000E1270(uint64_t result, uint64_t a2)
{
  if (result && a2 && !*(_DWORD *)(a2 + 8))
  {
    CFStringRef v3 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 80);
    if (v3)
    {
      uint64_t result = v3(a2 + 16, result);
      *(_DWORD *)(a2 + 8) = result;
    }
  }

  return result;
}

uint64_t sub_1000E12B8(__CFMachPort *a1)
{
  OSStatus v2 = (os_log_s *)VSGetLogDefault(a1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 136315138;
    uint64_t v6 = "_RecognitionClientInvalidationCallback";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s: client died - cancelling recognition\n",  (uint8_t *)&v5,  0xCu);
  }

  uint64_t Port = CFMachPortGetPort(a1);
  return sub_1000E1C30(Port);
}

void sub_1000E1368(uint64_t a1, AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, uint64_t a4, UInt32 a5)
{
  char v18 = 0;
  if (*(_DWORD *)a1 == 1)
  {
    UInt32 mAudioDataByteSize = inBuffer->mAudioDataByteSize;
    if (!mAudioDataByteSize
      || (int v10 = (*(uint64_t (**)(uint64_t, void *const, void, void, char *))(a1 + 152))( a1 + 16,  inBuffer->mAudioData,  a5,  mAudioDataByteSize / a5,  &v18),  *(_DWORD *)(a1 + 8) = v10,  !inBuffer->mAudioDataByteSize)
      || (!v10 ? (BOOL v11 = v18 == 0) : (BOOL v11 = 0), !v11))
    {
      *(_DWORD *)a1 = 3;
      Current = CFRunLoopGetCurrent();
      CFRunLoopStop(Current);
    }

    if (a5)
    {
      uint64_t v13 = *(OpaqueExtAudioFile **)(a1 + 240);
      if (v13)
      {
        UInt32 v14 = inBuffer->mAudioDataByteSize;
        mAudioData = inBuffer->mAudioData;
        v17.mNumberBuffers = 1;
        v17.mBuffers[0].mNumberChannels = 1;
        v17.mBuffers[0].mDataByteSize = v14;
        v17.mBuffers[0].mData = mAudioData;
        ExtAudioFileWriteAsync(v13, a5, &v17);
      }
    }
  }

  if (AudioQueueEnqueueBuffer(inAQ, inBuffer, 0, 0LL))
  {
    CFMutableStringRef Mutable = *(__CFArray **)(a1 + 216);
    if (!Mutable)
    {
      CFMutableStringRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, 0LL);
      *(void *)(a1 + 216) = Mutable;
    }

    CFArrayAppendValue(Mutable, inBuffer);
  }

uint64_t sub_1000E1474(_DWORD *a1, AudioQueueRef inAQ)
{
  UInt32 ioDataSize = 4;
  uint64_t result = AudioQueueGetProperty(inAQ, 0x6171726Eu, &outData, &ioDataSize);
  return result;
}

void sub_1000E14D8(int a1, int *a2)
{
  CFIndex v4 = pthread_self();
  if (!pthread_getschedparam(v4, &v7, &v8))
  {
    if (a2) {
      *a2 = v8.sched_priority;
    }
    v8.sched_priority = a1;
    uint64_t v5 = pthread_setschedparam(v4, v7, &v8);
    uint64_t v6 = (os_log_s *)VSGetLogDefault(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      int v10 = a1;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "setting recognition thread priority to %d\n",  buf,  8u);
    }
  }

void sub_1000E15B8(uint64_t a1)
{
  if (!a1 || *(_DWORD *)a1 || *(_DWORD *)(a1 + 8)) {
    return;
  }
  if (!*(void *)(a1 + 256))
  {
    if (!*(void *)(a1 + 200)) {
      goto LABEL_24;
    }
    uint64_t v5 = mach_absolute_time();
    uint64_t v6 = (os_log_s *)VSGetLogDefault(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(outPropertyData.mSampleTime) = 136315394;
      *(void *)((char *)&outPropertyData.mSampleTime + 4) = "_BeginRecognition";
      WORD2(outPropertyData.mHostTime) = 2048;
      *(double *)((char *)&outPropertyData.mHostTime + 6) = sub_1000EB778();
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEBUG,  "%s: sleeping for %g s\n",  (uint8_t *)&outPropertyData,  0x16u);
    }

    float v7 = sub_1000EB778();
    usleep((float)(v7 * 1000000.0));
    outPropertyData.mFlags = 2;
    outPropertyData.mHostTime = mach_absolute_time();
    OSStatus v8 = AudioQueueStart(*(AudioQueueRef *)(a1 + 200), &outPropertyData);
    pthread_mutex_lock(&stru_1000FD7B0);
    qword_100102A40 = *(void *)(a1 + 200);
    uint64_t v9 = pthread_mutex_unlock(&stru_1000FD7B0);
    int v10 = (os_log_s *)VSGetLogDefault(v9);
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      uint64_t v20 = mach_absolute_time();
      UInt32 ioDataSize = 136315394;
      CFDataRef v26 = "_BeginRecognition";
      __int16 v27 = 2048;
      double v28 = VSAbsoluteTimeToSecond(v20 - v5);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "%s: finished starting queue in %g s\n",  (uint8_t *)&ioDataSize,  0x16u);
      if (v8) {
        goto LABEL_16;
      }
    }

    else if (v8)
    {
LABEL_16:
      *(_DWORD *)(a1 + 8) = -4001;
      CFStringRef v12 = sub_1000E2648(v8);
      uint64_t v13 = (os_log_s *)VSGetLogDefault(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        UInt32 ioDataSize = 138412290;
        CFDataRef v26 = (const char *)v12;
        _os_log_error_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_ERROR,  "couldn't start audio queue for recognition (%@)\n",  (uint8_t *)&ioDataSize,  0xCu);
      }

      CFRelease(v12);
      goto LABEL_24;
    }

    CFIndex v21 = (os_log_s *)VSGetLogDefault(v11);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      UInt32 ioDataSize = 136315138;
      CFDataRef v26 = "_BeginRecognition";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "%s: starting recognition\n",  (uint8_t *)&ioDataSize,  0xCu);
    }

    *(_DWORD *)a1 = 1;
    sub_1000E2474(*(_DWORD *)(a1 + 4), kVSServerRecognitionStartedNotification, 0LL);
    goto LABEL_24;
  }

  OSStatus v2 = (os_log_s *)VSGetLogDefault(a1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(outPropertyData.mSampleTime) = 136315138;
    *(void *)((char *)&outPropertyData.mSampleTime + 4) = "_BeginRecognition";
    _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s: starting recognition from file\n",  (uint8_t *)&outPropertyData,  0xCu);
  }

  *(_DWORD *)a1 = 1;
  sub_1000E2474(*(_DWORD *)(a1 + 4), kVSServerRecognitionStartedNotification, 0LL);
  UInt32 ioDataSize = 40;
  uint64_t Property = AudioFileGetProperty(*(AudioFileID *)(a1 + 256), 0x64666D74u, &ioDataSize, &outPropertyData);
  if ((_DWORD)Property)
  {
    CFIndex v4 = (os_log_s *)VSGetLogDefault(Property);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(ioNumBytes[0]) = 0;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "couldn't get file format description.\n",  (uint8_t *)ioNumBytes,  2u);
    }

    *(_DWORD *)a1 = 3;
    *(_DWORD *)(a1 + 8) = -4001;
    goto LABEL_23;
  }

  UInt32 ioNumPackets = 400;
  ioNumBytes[0] = 400 * LODWORD(outPropertyData.mRateScalar);
  char v22 = 0;
  UInt32 v14 = malloc((400 * LODWORD(outPropertyData.mRateScalar)));
  if (!v14)
  {
    *(_DWORD *)a1 = 3;
    goto LABEL_23;
  }

  int v15 = v14;
  if (!*(_DWORD *)(a1 + 8))
  {
    SInt64 v17 = 0LL;
    do
    {
      if (*(_DWORD *)a1 == 3) {
        break;
      }
      if (AudioFileReadPacketData(*(AudioFileID *)(a1 + 256), 0, ioNumBytes, 0LL, v17, &ioNumPackets, v15))
      {
        *(_DWORD *)(a1 + 8) = -4001;
        break;
      }

      uint64_t v18 = ioNumPackets;
      if (ioNumPackets)
      {
        int v19 = (*(uint64_t (**)(uint64_t, void *, void, void, char *))(a1 + 152))( a1 + 16,  v15,  ioNumPackets,  LODWORD(outPropertyData.mRateScalar),  &v22);
        *(_DWORD *)(a1 + 8) = v19;
        if (v22 == 1) {
          *(_DWORD *)a1 = 3;
        }
        if (ioNumPackets > 0x18F) {
          goto LABEL_38;
        }
      }

      else
      {
        int v19 = *(_DWORD *)(a1 + 8);
      }

      *(_DWORD *)a1 = 3;
LABEL_38:
      v17 += v18;
    }

    while (!v19);
  }

  *(_DWORD *)a1 = 3;
  free(v15);
LABEL_23:
  AudioFileClose(*(AudioFileID *)(a1 + 256));
  *(void *)(a1 + 256) = 0LL;
LABEL_24:
  if (!*(_DWORD *)(a1 + 8))
  {
    CFIndex v16 = *(const void **)(a1 + 184);
    if (v16) {
      sub_1000E2AAC(v16, 1);
    }
  }

void sub_1000E1A54(uint64_t a1)
{
  OSStatus v2 = (os_log_s *)VSGetLogDefault(a1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v3, 0xCu);
  }

void sub_1000E1AF0(uint64_t a1, __CFArray *a2)
{
  ModelIdentifier = (const void *)VSRecognitionResultGetModelIdentifier();
  if (!ModelIdentifier) {
    goto LABEL_13;
  }
  uint64_t v5 = ModelIdentifier;
  uint64_t v6 = (CFBundleRef *)sub_1000E53F4(ModelIdentifier);
  if (!v6) {
    goto LABEL_13;
  }
  uint64_t v7 = (uint64_t)v6;
  CFURLRef v8 = CFBundleCopyBundleURL(v6[10]);
  if (!v8)
  {
    CFRelease((CFTypeRef)v7);
    goto LABEL_13;
  }

  CFURLRef v9 = v8;
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 16));
  int v10 = (const __CFDictionary *)sub_1000E6830(v7);
  pthread_mutex_unlock((pthread_mutex_t *)(v7 + 16));
  if (!v10) {
    goto LABEL_9;
  }
  Value = CFDictionaryGetValue(v10, v5);
  if (!Value) {
    goto LABEL_10;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t ValueIfType = VSCFDictionaryGetValueIfType(Value, @"VSRecognitionResultHandler", TypeID);
  if (ValueIfType) {
    Value = (const void *)VSRecognitionPluginInfoCreateString(v9, ValueIfType);
  }
  else {
LABEL_9:
  }
    Value = 0LL;
LABEL_10:
  CFRelease(v9);
  CFRelease((CFTypeRef)v7);
  if (Value)
  {
    DictionaryRepresentationWithResultHandlerInfo = (const void *)VSRecognitionResultCreateDictionaryRepresentationWithResultHandlerInfo( a1,  Value);
    CFRelease(Value);
    if (!DictionaryRepresentationWithResultHandlerInfo) {
      return;
    }
LABEL_14:
    CFArrayAppendValue(a2, DictionaryRepresentationWithResultHandlerInfo);
    CFRelease(DictionaryRepresentationWithResultHandlerInfo);
    return;
  }

uint64_t sub_1000E1C30(uint64_t result)
{
  if ((result - 1) <= 0xFFFFFFFD)
  {
    int v1 = result;
    pthread_mutex_lock(&stru_1000FD7B0);
    if (qword_100102A28 && !*(_DWORD *)qword_100102A28 && *(_DWORD *)(qword_100102A28 + 8) == v1)
    {
      qword_100102A28 = 0LL;
      if (qword_100102A30) {
        CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100102A30);
      }
      uint64_t v2 = qword_100102A38;
      if (qword_100102A38) {
        CFRunLoopWakeUp((CFRunLoopRef)qword_100102A38);
      }
      int v3 = (os_log_s *)VSGetLogDefault(v2);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        return pthread_mutex_unlock(&stru_1000FD7B0);
      }
      int v7 = 136315138;
      CFURLRef v8 = "_CancelRecognitionForMachPort";
      uint64_t v4 = "%s: client requested cancellation of active recognition\n";
    }

    else
    {
      uint64_t v5 = sub_1000EA4E0();
      if (!v5) {
        return pthread_mutex_unlock(&stru_1000FD7B0);
      }
      if (v5[2] != v1) {
        return pthread_mutex_unlock(&stru_1000FD7B0);
      }
      sub_1000EA3A0(0);
      int v3 = (os_log_s *)VSGetLogDefault(v6);
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
        return pthread_mutex_unlock(&stru_1000FD7B0);
      }
      int v7 = 136315138;
      CFURLRef v8 = "_CancelRecognitionForMachPort";
      uint64_t v4 = "%s: client requested cancellation of queued recognition\n";
    }

    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, v4, (uint8_t *)&v7, 0xCu);
    return pthread_mutex_unlock(&stru_1000FD7B0);
  }

  return result;
}

void sub_1000E1D98()
{
  if (qword_100102A50)
  {
    if (*(_DWORD *)qword_100102A50 == 1
      || (!*(_DWORD *)qword_100102A50 ? (BOOL v0 = *(_BYTE *)(qword_100102A50 + 196) == 0) : (BOOL v0 = 1), !v0))
    {
      uint64_t v1 = pthread_mutex_lock(&stru_1000FD7B0);
      if (qword_100102A28)
      {
        if (*(_DWORD *)qword_100102A28) {
          goto LABEL_14;
        }
        if (*(_BYTE *)(qword_100102A50 + 196) != 1) {
          goto LABEL_14;
        }
        if (*(_BYTE *)(qword_100102A28 + 64)) {
          goto LABEL_14;
        }
        *(_BYTE *)(qword_100102A50 + 196) = 0;
        uint64_t v2 = (os_log_s *)VSGetLogDefault(v1);
        if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_14;
        }
        __int16 v5 = 0;
        int v3 = "released from holding.. beginning now.\n";
        uint64_t v4 = (uint8_t *)&v5;
      }

      else
      {
        *(_DWORD *)qword_100102A50 = 2;
        uint64_t v2 = (os_log_s *)VSGetLogDefault(v1);
        if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
        {
LABEL_14:
          pthread_mutex_unlock(&stru_1000FD7B0);
          return;
        }

        *(_WORD *)buf = 0;
        int v3 = "cancelling recognition\n";
        uint64_t v4 = buf;
      }

      _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, v3, v4, 2u);
      goto LABEL_14;
    }
  }

void sub_1000E1EA4(int a1, const UInt8 *a2, CFIndex numBytes, UInt8 *bytes, unsigned int a5)
{
  CFStringRef v8 = 0LL;
  if (a2 && (_DWORD)numBytes) {
    CFStringRef v8 = CFStringCreateWithBytes(kCFAllocatorDefault, a2, numBytes, 0x8000100u, 0);
  }
  CFStringRef v9 = 0LL;
  if (bytes && a5) {
    CFStringRef v9 = CFStringCreateWithBytes(kCFAllocatorDefault, bytes, a5, 0x8000100u, 0);
  }
  LODWORD(value[0]) = 1;
  value[1] = v8;
  value[2] = v9;
  int v11 = a1;
  pthread_mutex_lock(&stru_1000FD7B0);
  sub_1000DF634(value);
  pthread_mutex_unlock(&stru_1000FD7B0);
  if (v9) {
    CFRelease(v9);
  }
  if (v8) {
    CFRelease(v8);
  }
}

uint64_t start()
{
  BOOL v0 = objc_autoreleasePoolPush();
  uint64_t v1 = v0;
  do
    unsigned int v2 = __ldaxr(&tkqMjk4y);
  while (__stlxr(v2 | 0xC000, &tkqMjk4y));
  uint64_t v3 = VSGetLogDefault(v0);
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf.version) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "voiced starting up...", (uint8_t *)&buf, 2u);
  }

  +[VSSiriInstrumentation instrumentVoicedProcessStartedPowerEvent]( &OBJC_CLASS___VSSiriInstrumentation,  "instrumentVoicedProcessStartedPowerEvent");
  if ((+[VSFeatureFlags useSiriTTSServiceV2](&OBJC_CLASS___VSFeatureFlags, "useSiriTTSServiceV2") & 1) == 0)
  {
    id v5 = objc_alloc_init(&OBJC_CLASS___VSPostInstallService);
    [v5 registerPostInstallActivity];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(+[VSCacheDeleteService sharedService](&OBJC_CLASS___VSCacheDeleteService, "sharedService"));
    unsigned __int8 v7 = [v6 registerCacheDelete];

    if ((v7 & 1) == 0)
    {
      uint64_t v9 = VSGetLogDefault(v8);
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.version) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "Cannot register CacheDelete service.",  (uint8_t *)&buf,  2u);
      }
    }

    xpc_set_event_stream_handler("com.apple.notifyd.matching", 0LL, &stru_1000FAA48);
  }

  char v22 = 1;
  buf.versioCFIndex n = 0LL;
  memset(&buf.retain, 0, 56);
  buf.info = &v22;
  buf.perforCFIndex m = (void (__cdecl *)(void *))sub_1000E2258;
  qword_100102A58 = (uint64_t)CFRunLoopSourceCreate(kCFAllocatorDefault, 0LL, &buf);
  MaiCFIndex n = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, (CFRunLoopSourceRef)qword_100102A58, kCFRunLoopDefaultMode);
  sub_1000E9770(0);
  sub_1000E9770(1u);
  CFStringRef v12 = (void *)objc_claimAutoreleasedReturnValue(+[VSAudioSession sharedInstance](&OBJC_CLASS___VSAudioSession, "sharedInstance"));
  [v12 _safeSetupAudioSession];

  uint64_t v13 = objc_alloc_init(&OBJC_CLASS___VSKeepAliveServer);
  -[VSKeepAliveServer resume](v13, "resume");
  UInt32 v14 = objc_alloc_init(&OBJC_CLASS___VSSpeechServer);
  -[VSSpeechServer resume](v14, "resume");
  Current = CFRunLoopGetCurrent();
  mach_port_t sp = 0;
  LODWORD(buf.version) = 0;
  mach_port_t v16 = mach_task_self_;
  task_get_special_port(mach_task_self_, 4, (mach_port_t *)&buf);
  if (bootstrap_check_in(buf.version, "com.apple.voiced", &sp))
  {
    if (sp - 1 <= 0xFFFFFFFD) {
      mach_port_deallocate(v16, sp);
    }
    goto LABEL_16;
  }

  SInt64 v17 = (__CFRunLoopSource *)CPCreateMIGServerSource(&off_1000FABA0, sp, 0LL);
  if (!v17)
  {
LABEL_16:
    objc_autoreleasePoolPop(v1);
    uint64_t v20 = 1LL;
    goto LABEL_17;
  }

  uint64_t v18 = v17;
  CFRunLoopAddSource(Current, v17, kCFRunLoopDefaultMode);
  CFRelease(v18);
  objc_autoreleasePoolPop(v1);
  int v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  [v19 run];

  uint64_t v20 = 0LL;
LABEL_17:

  return v20;
}

_BYTE *sub_1000E2258(_BYTE *result)
{
  if (result) {
    *uint64_t result = 1;
  }
  return result;
}

CFRunLoopSourceRef sub_1000E2268(void (__cdecl *a1)(void *), void *a2)
{
  v7.versioCFIndex n = 0LL;
  memset(&v7.retain, 0, 56);
  v7.info = a2;
  v7.perforCFIndex m = a1;
  CFRunLoopSourceRef v2 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0LL, &v7);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  pthread_mutex_lock(&stru_1000FD7F0);
  CFMutableStringRef Mutable = (__CFSet *)qword_100102A60;
  if (!qword_100102A60)
  {
    CFMutableStringRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
    qword_100102A60 = (uint64_t)Mutable;
  }

  CFSetAddValue(Mutable, v2);
  id v5 = (__CFDictionary *)qword_100102A68;
  if (!qword_100102A68)
  {
    id v5 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    qword_100102A68 = (uint64_t)v5;
  }

  CFDictionarySetValue(v5, v2, Current);
  pthread_mutex_unlock(&stru_1000FD7F0);
  return v2;
}

uint64_t sub_1000E234C(const void *a1, int a2)
{
  CFMutableStringRef Mutable = (__CFSet *)qword_100102A70;
  if (a2)
  {
    if (!qword_100102A70)
    {
      CFMutableStringRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
      qword_100102A70 = (uint64_t)Mutable;
    }

    CFSetAddValue(Mutable, a1);
  }

  else if (qword_100102A70)
  {
    CFIndex Count = CFSetGetCount((CFSetRef)qword_100102A70);
    CFSetRemoveValue((CFMutableSetRef)qword_100102A70, a1);
    if (Count >= 1 && !CFSetGetCount((CFSetRef)qword_100102A70) && qword_100102A58)
    {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100102A58);
      MaiCFIndex n = CFRunLoopGetMain();
      CFRunLoopWakeUp(Main);
    }
  }

  return pthread_mutex_unlock(&stru_1000FD7F0);
}

uint64_t sub_1000E2408(const void *a1)
{
  if (qword_100102A60) {
    CFSetRemoveValue((CFMutableSetRef)qword_100102A60, a1);
  }
  if (qword_100102A70) {
    CFSetRemoveValue((CFMutableSetRef)qword_100102A70, a1);
  }
  if (qword_100102A68) {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)qword_100102A68, a1);
  }
  return pthread_mutex_unlock(&stru_1000FD7F0);
}

BOOL sub_1000E2474(mach_port_t a1, CFStringRef theString, const __CFDictionary *a3)
{
  if (!theString) {
    return 0LL;
  }
  CFIndex Length = CFStringGetLength(theString);
  CFIndex usedBufLen = Length;
  if (!Length) {
    return 0LL;
  }
  CFIndex v7 = Length;
  v23.locatioCFIndex n = 0LL;
  v23.length = v7;
  CFStringGetBytes(theString, v23, 0x8000100u, 0, 0, buffer, 1023LL, &usedBufLen);
  buffer[usedBufLen] = 0;
  if (a3
    && CFDictionaryGetCount(a3)
    && (BinaryXMLData = (const __CFData *)VSCFPropertyListCreateBinaryXMLData(kCFAllocatorDefault, a3)) != 0LL)
  {
    int v11 = BinaryXMLData;
    BytePtr = CFDataGetBytePtr(BinaryXMLData);
    int v13 = CFDataGetLength(v11);
    int v14 = sub_1000EE220(a1, (const char *)buffer, (uint64_t)BytePtr, v13);
    CFRelease(v11);
  }

  else
  {
    uint64_t v15 = sub_1000EE220(a1, (const char *)buffer, 0LL, 0);
    int v14 = v15;
  }

  BOOL v8 = v14 == 0;
  mach_port_t v16 = (os_log_s *)VSGetLogDefault(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)CFRunLoopSourceContext buf = 136315394;
    int v19 = "VSClientPostNotification";
    __int16 v20 = 2080;
    CFIndex v21 = buffer;
    _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%s: posted %s to client\n", buf, 0x16u);
  }

  return v8;
}

CFStringRef sub_1000E2648(unsigned int a1)
{
  int v2 = bswap32(a1);
  int v8 = v2;
  if ((v2 & 0x80) != 0)
  {
  }

  else if ((_DefaultRuneLocale.__runetype[(char)v2] & 0x40000) == 0)
  {
    goto LABEL_17;
  }

  __darwin_ct_rune_t v3 = (__int16)v2 >> 8;
  if ((v2 & 0x8000) != 0)
  {
    if (!__maskrune(v3, 0x40000uLL)) {
      goto LABEL_17;
    }
  }

  else if ((_DefaultRuneLocale.__runetype[v3] & 0x40000) == 0)
  {
    goto LABEL_17;
  }

  __darwin_ct_rune_t v4 = v2 << 8 >> 24;
  if ((v2 & 0x800000) != 0)
  {
    if (!__maskrune(v4, 0x40000uLL)) {
      goto LABEL_17;
    }
LABEL_13:
    __darwin_ct_rune_t v5 = v2 >> 24;
    if (v2 < 0)
    {
      if (!__maskrune(v5, 0x40000uLL)) {
        goto LABEL_17;
      }
    }

    else if ((_DefaultRuneLocale.__runetype[v5] & 0x40000) == 0)
    {
      goto LABEL_17;
    }

    __int16 v9 = 39;
    char __str = 39;
    return CFStringCreateWithCString(0LL, &__str, 0x600u);
  }

  if ((_DefaultRuneLocale.__runetype[v4] & 0x40000) != 0) {
    goto LABEL_13;
  }
LABEL_17:
  if (a1 + 199999 > 0x61A7E) {
    snprintf(&__str, 0x10uLL, "0x%x");
  }
  else {
    snprintf(&__str, 0x10uLL, "%d");
  }
  return CFStringCreateWithCString(0LL, &__str, 0x600u);
}

CFURLRef sub_1000E27BC(uint64_t a1, const __CFString *a2, uint64_t a3)
{
  CFURLRef v5 = sub_1000E29EC(a1);
  uint64_t v6 = v5;
  if (v5)
  {
    int v7 = VSDirectoryExistsAtURL(v5, 0LL, 0LL);
    int v8 = 0LL;
    if (!a2) {
      goto LABEL_20;
    }
    if (!v7) {
      goto LABEL_20;
    }
    int v8 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v6, @"Info.plist", 0);
    if (!v8) {
      goto LABEL_20;
    }
    __int16 v9 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v8);
    if (v9)
    {
      int v10 = v9;
      if (CFReadStreamOpen(v9))
      {
        int v11 = (const __CFURL *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v10, 0LL, 0LL, 0LL, 0LL);
        CFStringRef v12 = v11;
        if (v11)
        {
          CFTypeID v13 = CFGetTypeID(v11);
          if (v13 != CFDictionaryGetTypeID())
          {
            CFRelease(v12);
            CFStringRef v12 = 0LL;
          }
        }

        CFReadStreamClose(v10);
      }

      else
      {
        CFStringRef v12 = 0LL;
      }

      CFRelease(v10);
      CFRelease(v8);
      if (!v12) {
        goto LABEL_19;
      }
      Value = (const __CFString *)CFDictionaryGetValue(v12, @"VSLocaleIdentifier");
      if (Value)
      {
        mach_port_t v16 = Value;
        CFTypeID v17 = CFGetTypeID(Value);
        if (v17 == CFStringGetTypeID() && CFStringCompare(v16, a2, 0LL) == kCFCompareEqualTo)
        {
          int v19 = (const __CFNumber *)CFDictionaryGetValue(v12, @"VSVersion");
          if (v19)
          {
            __int16 v20 = v19;
            CFTypeID v21 = CFGetTypeID(v19);
            if (v21 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v20, kCFNumberCFIndexType, &valuePtr);
              if (valuePtr == a3)
              {
                char v22 = CFDictionaryGetValue(v12, @"VSPluginVersions");
                if (v22)
                {
                  CFRange v23 = v22;
                  CFTypeID v24 = CFGetTypeID(v22);
                  if (v24 == CFDictionaryGetTypeID())
                  {
                    BOOL v25 = (const void *)sub_1000E64E0();
                    if (!v25)
                    {
                      int v8 = v6;
                      goto LABEL_21;
                    }

                    CFDataRef v26 = v25;
                    int v27 = CFEqual(v25, v23);
                    CFRelease(v26);
                    CFRelease(v12);
                    if (v27) {
                      return v6;
                    }
                    goto LABEL_19;
                  }
                }
              }
            }
          }
        }
      }

      int v14 = v12;
    }

    else
    {
      int v14 = v8;
    }

    CFRelease(v14);
LABEL_19:
    int v8 = 0LL;
LABEL_20:
    CFStringRef v12 = v6;
LABEL_21:
    CFRelease(v12);
    return v8;
  }

  return v6;
}

CFURLRef sub_1000E29EC(uint64_t a1)
{
  if (!a1) {
    return 0LL;
  }
  int v2 = (const __CFURL *)qword_100102AA0;
  if (!qword_100102AA0) {
    return 0LL;
  }
  __darwin_ct_rune_t v3 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"%@%@", a1, @".vscache");
  CFURLRef v4 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v2, v3, 1u);
  CFRelease(v3);
  return v4;
}

uint64_t sub_1000E2A98()
{
  return pthread_key_create((pthread_key_t *)&qword_100102A80, (void (__cdecl *)(void *))&_CFRelease);
}

uint64_t sub_1000E2AAC(const void *a1, int a2)
{
  if (a2 != 1 || qword_100102A78)
  {
    if (a2 || !qword_100102A78) {
      return pthread_mutex_unlock(&stru_1000FD830);
    }
    sub_1000E9A1C(qword_100102A78);
    CFRelease((CFTypeRef)qword_100102A78);
LABEL_10:
    qword_100102A78 = 0LL;
    return pthread_mutex_unlock(&stru_1000FD830);
  }

  if (!a1) {
    goto LABEL_10;
  }
  CFURLRef v4 = CFGetAllocator(a1);
  uint64_t v5 = sub_1000E98D4(v4, (const __CFURL *)a1);
  qword_100102A78 = v5;
  if (v5)
  {
    uint64_t v6 = (const void *)sub_1000EA190(v5, @"x", @"xx", @"xxx");
    if (v6) {
      CFRelease(v6);
    }
  }

  return pthread_mutex_unlock(&stru_1000FD830);
}

uint64_t sub_1000E2B58(const __CFString *a1, const __CFString *a2, void *a3, CFURLRef *a4)
{
  uint64_t v6 = a1;
  CFTypeRef cf = 0LL;
  int v7 = *a4;
  int v8 = (os_log_s *)VSGetLogDefault(a1);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t Bytes = mach_absolute_time();
    uint64_t v10 = Bytes;
    if (v6)
    {
      CFIndex Length = CFStringGetLength(v6);
      CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
      CFIndex v13 = MaximumSizeForEncoding;
      *(void *)__int128 context = MaximumSizeForEncoding;
      if (MaximumSizeForEncoding < 256) {
        int v14 = v165;
      }
      else {
        int v14 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
      }
      v173.locatioCFIndex n = 0LL;
      v173.length = Length;
      uint64_t Bytes = CFStringGetBytes(v6, v173, 0x8000100u, 0, 0, v14, v13, (CFIndex *)context);
      v14[*(void *)context] = 0;
      __int128 v152 = v14;
    }

    else
    {
      __int128 v152 = 0LL;
      int v14 = (UInt8 *)"all";
    }

    mach_port_t v16 = v6;
    if (a2)
    {
      CFIndex v17 = CFStringGetLength(a2);
      CFIndex v18 = CFStringGetMaximumSizeForEncoding(v17, 0x8000100u);
      CFIndex v19 = v18;
      *(void *)__int128 context = v18;
      if (v18 < 256) {
        __int16 v20 = v164;
      }
      else {
        __int16 v20 = (UInt8 *)malloc(v18 + 1);
      }
      v174.locatioCFIndex n = 0LL;
      v174.length = v17;
      uint64_t Bytes = CFStringGetBytes(a2, v174, 0x8000100u, 0, 0, v20, v19, (CFIndex *)context);
      v20[*(void *)context] = 0;
      uint64_t v15 = v20;
    }

    else
    {
      uint64_t v15 = 0LL;
      __int16 v20 = (UInt8 *)"all";
    }

    CFTypeID v21 = (os_log_s *)VSGetLogDefault(Bytes);
    uint64_t v148 = v10;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 context = 136315394;
      *(void *)&context[4] = v14;
      __int16 v169 = 2080;
      *(void *)int v170 = v20;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "caching model <%s> class <%s> ...\n",  context,  0x16u);
    }

    uint64_t v6 = v16;
  }

  else
  {
    uint64_t v15 = 0LL;
    __int128 v152 = 0LL;
    uint64_t v148 = 0LL;
  }

  uint64_t v22 = NSPushAutoreleasePool(0LL);
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v24 = Mutable;
  CFStringRef v156 = a2;
  if (v7)
  {
    uint64_t v25 = sub_1000E98D4(kCFAllocatorDefault, v7);
    if (v25)
    {
      CFDataRef v26 = (void *)v25;
      int v27 = v7;
      double v28 = a3;
      uint64_t v29 = v22;
      CFTypeID v30 = v15;
      __int16 v31 = v6;
      *(void *)__int128 context = 0LL;
      CFMutableArrayRef v32 = (pthread_mutex_t *)(v25 + 16);
      pthread_mutex_lock((pthread_mutex_t *)(v25 + 16));
      uint64_t v33 = v26[10];
      if (v33)
      {
        uint64_t Database = CPRecordStoreGetDatabase(v33);
        if (Database)
        {
          uint64_t v35 = CPSqliteDatabaseStatementForReading(Database, @"SELECT model_id, validity FROM Model;");
          if (v35)
          {
            uint64_t v36 = v35;
            CPSqliteStatementSendResults(v35, sub_1000E9A60, context);
            CPSqliteStatementReset(v36);
          }
        }
      }

      pthread_mutex_unlock(v32);
      CFIndex v37 = *(const void **)context;
      if (*(void *)context)
      {
        CFDictionaryApplyFunction(*(CFDictionaryRef *)context, (CFDictionaryApplierFunction)sub_1000E3DD8, v24);
        CFRelease(v37);
      }

      CFRelease(v26);
      uint64_t v6 = v31;
      uint64_t v15 = v30;
      uint64_t v22 = v29;
      a3 = v28;
      int v7 = v27;
    }

    if (a3) {
      goto LABEL_28;
    }
LABEL_39:
    uint64_t v50 = 0LL;
    uint64_t v51 = 0LL;
    if (!v24) {
      goto LABEL_111;
    }
    goto LABEL_110;
  }

  uint64_t v49 = (os_log_s *)VSGetLogDefault(Mutable);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)__int128 context = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v49,  OS_LOG_TYPE_DEBUG,  "no valid cache found; recaching everything.\n",
      context,
      2u);
  }

  uint64_t v6 = 0LL;
  if (!a3) {
    goto LABEL_39;
  }
LABEL_28:
  CFStringRef theString = v6;
  if (!v6)
  {
    CFIndex v39 = 0LL;
    unint64_t v48 = 0LL;
    CFDictionaryRef v40 = 0LL;
    goto LABEL_54;
  }

  CFIndex v38 = (__CFString *)sub_1000E5578(v6);
  if (!v38)
  {
    uint64_t v51 = 0LL;
    BOOL v54 = 0;
    unsigned int v155 = -4006;
    goto LABEL_78;
  }

  CFIndex v39 = v38;
  CFDictionaryRef v40 = sub_1000E9008(v38);
  if (CFDictionaryContainsKey(v24, v39))
  {
    uint64_t v41 = CFDictionaryGetValue(v24, v39);
    data = v39[19].data;
    if (data)
    {
      uint64_t v43 = ((uint64_t (*)(__CFString *, const void *, char *))data)(v39, v41, v39[20].data);
      if ((_DWORD)v43)
      {
        int v44 = (os_log_s *)VSGetLogDefault(v43);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v119 = v39[16].length;
          *(_DWORD *)__int128 context = 136315138;
          *(void *)&context[4] = v119;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEBUG,  "cache for model <%s> is valid; skipping recache request.\n",
            context,
            0xCu);
        }

        LODWORD(v45) = 0;
        BOOL v46 = 0;
        CFMutableDictionaryRef v47 = 0LL;
        unint64_t v48 = 0LL;
        goto LABEL_69;
      }
    }
  }

  if (!v156)
  {
    uint64_t v55 = (void (*)(void *, __CFString *, uint64_t))a3[9];
    if (v55)
    {
      v55(a3, v39, 1LL);
      CFDictionaryRemoveValue(v24, v39);
    }

    unint64_t v48 = 0LL;
    goto LABEL_53;
  }

  unint64_t v48 = sub_1000E83E0((const __CFDictionary *)v39[17].data, v156);
  if (!v48)
  {
    CFMutableDictionaryRef v47 = 0LL;
    BOOL v46 = 1;
    LODWORD(v45) = -4006;
    goto LABEL_69;
  }

  if (!a3[9]) {
    goto LABEL_54;
  }
  if (!CFDictionaryContainsKey(v24, v39))
  {
LABEL_53:
    CFStringRef v156 = 0LL;
    goto LABEL_54;
  }

  CFMutableArrayRef v52 = (uint64_t (*)(void *, __CFString *))a3[8];
  if (v52)
  {
    int v53 = v52(a3, v39);
    if (v53)
    {
      LODWORD(v45) = v53;
      CFMutableDictionaryRef v47 = 0LL;
      BOOL v46 = 1;
LABEL_69:
      CFRelease(v39);
      goto LABEL_70;
    }

    CFDictionarySetValue(v24, v39, v40);
  }

  uint64_t v117 = (void (*)(void *, __CFString *, const void *))a3[10];
  if (v117) {
    v117(a3, v39, v48);
  }
LABEL_54:
  CFMutableDictionaryRef v47 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  sub_1000E3E30(v47);
  if (!v6)
  {
    *(void *)__int128 context = 0LL;
    int v61 = (const __CFDictionary *)sub_1000E4930();
    uint64_t v45 = v61;
    if (v61)
    {
      CFDictionaryApplyFunction(v61, (CFDictionaryApplierFunction)sub_1000E6370, context);
      CFRelease(v45);
      uint64_t v45 = *(const __CFDictionary **)context;
      if (*(void *)context)
      {
        v157[0] = a3;
        v157[1] = v24;
        __int128 v158 = 0LL;
        CFIndex v159 = v7;
        char v160 = 0;
        int v161 = 0;
        CFSetApplyFunction(*(CFSetRef *)context, (CFSetApplierFunction)sub_1000E3EA8, v157);
        BOOL v46 = v160 != 0;
        CFTypeRef cf = v158;
        int v62 = v45;
        LODWORD(v45) = v161;
        CFRelease(v62);
        goto LABEL_68;
      }
    }

    goto LABEL_67;
  }

  if (v156)
  {
    char v56 = (uint64_t (*)(void *, __CFString *, const void *))a3[11];
    if (v56)
    {
      LODWORD(v45) = v56(a3, v39, v48);
      if (!(_DWORD)v45)
      {
        CFDictionarySetValue(v24, v39, v40);
        uint64_t v57 = (uint64_t)a3;
        CFIndex v58 = v7;
        uint64_t v59 = (uint64_t)v39;
        signed int v60 = v48;
LABEL_65:
        sub_1000E410C(&cf, v57, v58, v59, v60);
        goto LABEL_67;
      }

      goto LABEL_67;
    }

LABEL_223:
        CFIndex v139 = (os_log_s *)VSGetLogDefault(v128);
        if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)__int128 context = 136315138;
          *(void *)&context[4] = "_SaveEngineToCache";
          _os_log_error_impl( (void *)&_mh_execute_header,  v139,  OS_LOG_TYPE_ERROR,  "%s: error setting info dict on temp cache\n",  context,  0xCu);
        }

        CFIndex v105 = 0LL;
LABEL_226:
        CFRelease(v124);
        goto LABEL_227;
      }

      CFRelease(v131);
    }

    CFRelease(v129);
    goto LABEL_223;
  }

  CFIndex v104 = (os_log_s *)VSGetLogDefault(0LL);
  CFIndex v70 = (const __CFArray *)os_log_type_enabled(v104, OS_LOG_TYPE_ERROR);
  if ((_DWORD)v70)
  {
    *(_DWORD *)__int128 context = 136315138;
    *(void *)&context[4] = "_SaveEngineToCache";
    _os_log_error_impl( (void *)&_mh_execute_header,  v104,  OS_LOG_TYPE_ERROR,  "%s: couldn't create manifest for cache\n",  context,  0xCu);
  }

void sub_1000E3DD8(const void *a1, const void *a2, __CFDictionary *a3)
{
  uint64_t v5 = sub_1000E5578(a1);
  if (v5)
  {
    uint64_t v6 = v5;
    CFDictionaryAddValue(a3, v5, a2);
    CFRelease(v6);
  }

void sub_1000E3E30(const void *a1)
{
  int v2 = pthread_getspecific(qword_100102A80);
  if (a1) {
    CFRetain(a1);
  }
  pthread_setspecific(qword_100102A80, a1);
  if (v2) {
    CFRelease(v2);
  }
}

void sub_1000E3EA8(void *a1, uint64_t *a2)
{
  uint64_t v4 = mach_absolute_time();
  if (a1 && a2 && *a2 && *(void *)(*a2 + 64) && !*((_DWORD *)a2 + 9))
  {
    uint64_t v5 = v4;
    CFDictionaryRef v6 = sub_1000E9008(a1);
    int v7 = (const __CFDictionary *)a2[1];
    if (v7
      && CFDictionaryContainsKey(v7, a1)
      && (Value = CFDictionaryGetValue((CFDictionaryRef)a2[1], a1),
          (__int16 v9 = (uint64_t (*)(void *, const void *, void))a1[78]) != 0LL)
      && (uint64_t v10 = v9(a1, Value, a1[82]), (_DWORD)v10))
    {
      int v11 = (os_log_s *)VSGetLogDefault(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v12 = a1[67];
        int v22 = 136315138;
        uint64_t v23 = v12;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "cache for model <%s> is valid; skipping recache.\n",
          (uint8_t *)&v22,
          0xCu);
      }
    }

    else
    {
      uint64_t v13 = *a2;
      int v14 = *(void (**)(void))(*a2 + 72);
      if (v14)
      {
        v14();
        uint64_t v13 = *a2;
      }

      uint64_t v15 = (*(uint64_t (**)(uint64_t, void *))(v13 + 64))(v13, a1);
      if ((_DWORD)v15)
      {
        mach_port_t v16 = (os_log_s *)VSGetLogDefault(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = a1[67];
          int v22 = 136315138;
          uint64_t v23 = v20;
          _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "error caching model <%s>\n",  (uint8_t *)&v22,  0xCu);
        }

        *((_DWORD *)a2 + 9) = -4001;
      }

      else
      {
        CFIndex v17 = (__CFDictionary *)a2[1];
        if (v17) {
          CFDictionarySetValue(v17, a1, v6);
        }
        *((_BYTE *)a2 + 32) = 1;
        uint64_t v18 = mach_absolute_time();
        CFIndex v19 = (os_log_s *)VSGetLogDefault(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v21 = a1[67];
          int v22 = 136315394;
          uint64_t v23 = v21;
          __int16 v24 = 2048;
          double v25 = VSAbsoluteTimeToSecond(v18 - v5);
          _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "recache for model <%s> done in %g s\n",  (uint8_t *)&v22,  0x16u);
        }

        if (!*((_DWORD *)a2 + 9)) {
          sub_1000E410C(a2 + 2, *a2, (CFURLRef)a2[3], (uint64_t)a1, 0LL);
        }
      }
    }

    CFRelease(v6);
  }

void sub_1000E410C(void *a1, uint64_t a2, CFURLRef url, uint64_t a4, const void *a5)
{
  if (a1)
  {
    int v8 = a1;
    if (*a1) {
      goto LABEL_3;
    }
    if (!url) {
      goto LABEL_14;
    }
    CFURLRef v12 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, url, @"KeywordIndex.plist", 0);
    uint64_t v13 = v8;
    if (v12)
    {
      CFURLRef v14 = v12;
      *uint64_t v13 = VSKeywordIndexCreateWithURL(kCFAllocatorDefault, v12);
      CFRelease(v14);
    }

    int v8 = v13;
    if (*v13)
    {
LABEL_3:
      if (!a5) {
        goto LABEL_15;
      }
    }

    else
    {
LABEL_14:
      *int v8 = VSKeywordIndexCreate(kCFAllocatorDefault);
      if (!a5)
      {
LABEL_15:
        uint64_t v15 = sub_1000E8378((CFDictionaryRef *)a4);
        if (v15)
        {
          mach_port_t v16 = v15;
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(kCFAllocatorDefault, 0LL, v15);
          CFRelease(v16);
          if (MutableCopy)
          {
            CFIndex Count = CFArrayGetCount(MutableCopy);
            if (Count < 1) {
              goto LABEL_21;
            }
            goto LABEL_5;
          }
        }

        else
        {
          CFMutableArrayRef MutableCopy = 0LL;
        }

        CFIndex Count = 0LL;
        goto LABEL_21;
      }
    }

    CFMutableArrayRef MutableCopy = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
    CFArrayAppendValue(MutableCopy, a5);
    CFIndex Count = 1LL;
LABEL_5:
    unint64_t v11 = Count + 1;
    do
    {
      if (!*((_BYTE *)CFArrayGetValueAtIndex(MutableCopy, v11 - 2) + 40))
      {
        CFArrayRemoveValueAtIndex(MutableCopy, v11 - 2);
        --Count;
      }

      --v11;
    }

    while (v11 > 1);
LABEL_21:
    CFIndex v17 = *(const void **)(a4 + 16);
    if (v17) {
      CFRetain(*(CFTypeRef *)(a4 + 16));
    }
    uint64_t v18 = (const __CFDictionary *)sub_1000E4930();
    CFMutableDictionaryRef v47 = v17;
    if (v18)
    {
      CFIndex v19 = v18;
      Value = CFDictionaryGetValue(v18, v17);
      BOOL v49 = Value
         && (uint64_t v21 = Value,
             CFTypeID TypeID = CFBooleanGetTypeID(),
             (uint64_t ValueIfType = (const __CFBoolean *)VSCFDictionaryGetValueIfType( v21,  @"VSRecognitionModelIsTopLevel",  TypeID)) != 0LL)
         && CFBooleanGetValue(ValueIfType) != 0;
      CFIndex v17 = v47;
      CFRelease(v19);
    }

    else
    {
      BOOL v49 = 0;
    }

    if (Count >= 1)
    {
      CFArrayRef theArray = sub_1000E8ECC(a4, MutableCopy);
      if (theArray)
      {
        CFIndex v24 = 0LL;
        BOOL v46 = v8;
        unint64_t v48 = MutableCopy;
        CFIndex v50 = Count;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v24);
          CFDataRef v26 = CFArrayGetValueAtIndex(theArray, v24);
          int v27 = (const void *)ValueAtIndex[2];
          if (v27)
          {
            double v28 = v26;
            uint64_t v52 = *v8;
            CFRetain(v27);
            uint64_t v29 = (uint64_t (*)(void *, uint64_t, void *, void))v28[3];
            int v53 = v27;
            if (v29)
            {
              uint64_t v30 = v29(v28, a4, ValueAtIndex, v28[2]);
              if (v30 >= 1)
              {
                uint64_t v31 = v30;
                CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
                uint64_t v33 = 0LL;
                while (2)
                {
                  CFTypeRef cf = 0LL;
                  int v34 = (uint64_t (*)(void *, uint64_t, void *, uint64_t, void, void, CFTypeRef *, void))v28[4];
                  if (!v34) {
                    goto LABEL_50;
                  }
                  int v35 = v34(v28, a4, ValueAtIndex, v33, v28[2], 0LL, &cf, 0LL);
                  uint64_t v36 = (const __CFString *)cf;
                  if (!v35 || cf == 0LL) {
                    goto LABEL_50;
                  }
                  CFIndex v38 = *(uint64_t (**)(uint64_t, CFTypeRef))(a2 + 96);
                  if (v38)
                  {
                    uint64_t v36 = (const __CFString *)v38(a2, cf);
                    if (!v36) {
                      goto LABEL_49;
                    }
                  }

                  else
                  {
                    CFRetain(cf);
                  }

                  uint64_t v39 = a4;
                  uint64_t v40 = a2;
                  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings( kCFAllocatorDefault,  v36,  @" ");
                  if (ArrayBySeparatingStrings)
                  {
                    CFIndex v42 = ArrayBySeparatingStrings;
                    v55.length = CFArrayGetCount(ArrayBySeparatingStrings);
                    v55.locatioCFIndex n = 0LL;
                    CFArrayAppendArray(Mutable, v42, v55);
                    CFRelease(v42);
                  }

                  CFRelease(v36);
                  a2 = v40;
                  a4 = v39;
LABEL_49:
                  CFRelease(cf);
LABEL_50:
                  if (v31 == ++v33)
                  {
                    int v8 = v46;
                    CFIndex v17 = v47;
                    goto LABEL_55;
                  }

                  continue;
                }
              }

              CFMutableDictionaryRef Mutable = 0LL;
LABEL_55:
              CFMutableArrayRef MutableCopy = v48;
            }

            else
            {
              CFMutableDictionaryRef Mutable = 0LL;
            }

            CFIndex v43 = v50;
            VSKeywordIndexSetKeywordsForClassIdentifier(v52, v49, v17, v53, Mutable);
            CFRelease(v53);
            if (Mutable) {
              CFRelease(Mutable);
            }
          }

          else
          {
            CFIndex v43 = v50;
          }

          if (++v24 == v43)
          {
            CFRelease(theArray);
            break;
          }
        }
      }
    }

    int v44 = *(const void **)(a4 + 576);
    if (v44)
    {
      CFTypeRef v45 = CFRetain(v44);
      VSKeywordIndexSetKeywordsForModelIdentifier(*v8, v49, v17, v45);
      if (v45) {
        CFRelease(v45);
      }
      if (!v17) {
        goto LABEL_65;
      }
    }

    else
    {
      VSKeywordIndexSetKeywordsForModelIdentifier(*v8, v49, v17, 0LL);
      if (!v17)
      {
LABEL_65:
        if (MutableCopy) {
          CFRelease(MutableCopy);
        }
        return;
      }
    }

    CFRelease(v17);
    goto LABEL_65;
  }

void sub_1000E454C(uint64_t a1, const void *BinaryXMLData, uint64_t a3)
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v4 = *(const __CFString **)(a1 + 16);
      if (v4)
      {
        CFRetain(*(CFTypeRef *)(a1 + 16));
        if (BinaryXMLData) {
          BinaryXMLData = (const void *)VSCFPropertyListCreateBinaryXMLData(kCFAllocatorDefault, BinaryXMLData);
        }
        pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
        if (*(void *)(a3 + 80))
        {
          SelectPrefixFromRecordDescriptor = (__CFString *)CPRecordStoreCreateSelectPrefixFromRecordDescriptor(&off_1000FA758);
          if (SelectPrefixFromRecordDescriptor)
          {
            int v7 = SelectPrefixFromRecordDescriptor;
            CFStringAppend(SelectPrefixFromRecordDescriptor, @" WHERE model_id = ?;");
            uint64_t Database = CPRecordStoreGetDatabase(*(void *)(a3 + 80));
            if (Database)
            {
              uint64_t v9 = CPSqliteDatabaseStatementForReading(Database, v7);
              if (v9)
              {
                uint64_t v10 = v9;
                CFIndex Length = CFStringGetLength(v4);
                uint64_t MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
                CFIndex v13 = MaximumSizeForEncoding;
                CFIndex usedBufLen = MaximumSizeForEncoding;
                CFURLRef v14 = buffer;
                if (MaximumSizeForEncoding >= 256) {
                  CFURLRef v14 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
                }
                v21.locatioCFIndex n = 0LL;
                v21.length = Length;
                CFStringGetBytes(v4, v21, 0x8000100u, 0, 0, v14, v13, &usedBufLen);
                v14[usedBufLen] = 0;
                sqlite3_bind_text(*(sqlite3_stmt **)(v10 + 8), 1, (const char *)v14, -1, 0LL);
                uint64_t v15 = (const __CFArray *)CPRecordStoreProcessStatement( *(void *)(a3 + 80),  &off_1000FA758,  v10,  0LL,  0LL);
                if (v14 && v14 != buffer) {
                  free(v14);
                }
                if (v15)
                {
                  if (CFArrayGetCount(v15) < 1 || (ValueAtIndex = CFArrayGetValueAtIndex(v15, 0LL)) == 0LL)
                  {
                    CFIndex v17 = (const void *)CPRecordCreate(&off_1000FA758);
                    CPRecordSetProperty(v17, 0LL, v4);
                    CPRecordStoreAddRecord(*(void *)(a3 + 80), v17);
                    CFRelease(v17);
                    ValueAtIndex = v17;
                  }

                  CPRecordSetProperty(ValueAtIndex, 1LL, BinaryXMLData);
                  CFRelease(v15);
                }

                else
                {
                  uint64_t v18 = (const void *)CPRecordCreate(&off_1000FA758);
                  CPRecordSetProperty(v18, 0LL, v4);
                  CPRecordStoreAddRecord(*(void *)(a3 + 80), v18);
                  CFRelease(v18);
                  CPRecordSetProperty(v18, 1LL, BinaryXMLData);
                }
              }
            }

            CFRelease(v7);
          }
        }

        pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
        if (BinaryXMLData) {
          CFRelease(BinaryXMLData);
        }
        CFRelease(v4);
      }
    }
  }

void sub_1000E4810(uint64_t a1, CFDictionaryRef theDict, uint64_t a3)
{
  context[0] = a1;
  context[1] = 0LL;
  context[2] = a3;
  if (a1 && theDict)
  {
    if (a3) {
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000E4854, context);
    }
  }

void sub_1000E4854(uint64_t a1, CFDictionaryRef theDict, void *a3)
{
  if (theDict && a1)
  {
    if (a3)
    {
      a3[1] = a1;
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)sub_1000E487C, a3);
    }
  }

CFStringRef sub_1000E487C(const __CFString *result, const __CFString *a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v3 = *(void *)(a3 + 16);
    if (v3)
    {
      uint64_t v4 = *(const __CFString **)(a3 + 8);
      if (v4)
      {
        if (a2)
        {
          CFDictionaryRef v6 = result;
          if (result)
          {
            int v7 = *(const __CFString **)a3;
            if (*(void *)a3)
            {
              pthread_mutex_lock((pthread_mutex_t *)(v3 + 16));
              uint64_t v8 = *(void *)(v3 + 80);
              if (v8)
              {
                uint64_t Database = CPRecordStoreGetDatabase(v8);
                if (Database)
                {
                  uint64_t v10 = CPSqliteDatabaseStatementForWriting( Database,  @"INSERT OR REPLACE INTO ValueTranslation (model_id, class_id, original_value, translated_value) VALUES (?, ?, ?, ?);");
                  if (v10) {
                    sub_1000E9E44(v10, 0LL, 0LL, v7, v4, v6, a2);
                  }
                }
              }

              return (const __CFString *)pthread_mutex_unlock((pthread_mutex_t *)(v3 + 16));
            }
          }
        }
      }
    }
  }

  return result;
}

const void *sub_1000E4930()
{
  BOOL v0 = (const void *)sub_1000E4978();
  uint64_t v1 = v0;
  if (v0) {
    CFRetain(v0);
  }
  pthread_mutex_unlock(&stru_1000FD880);
  return v1;
}

uint64_t sub_1000E4978()
{
  if (qword_100102A90) {
    return qword_100102A90;
  }
  uint64_t v1 = sub_1000E4C0C();
  if (!v1) {
    return qword_100102A90;
  }
  int v2 = v1;
  if (!CFURLGetFileSystemRepresentation(v1, 1u, buffer, 1024LL)
    || stat((const char *)buffer, &v18)
    || (uint64_t v4 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/VoiceServices/PlugIns",  kCFURLPOSIXPathStyle,  1u)) == 0LL)
  {
    uint64_t v3 = sub_1000E4C60();
    goto LABEL_7;
  }

  uint64_t v5 = v4;
  __darwin_time_t tv_sec = v18.st_mtimespec.tv_sec;
  BOOL v7 = CFURLGetFileSystemRepresentation(v4, 1u, v21, 1024LL)
  CFRelease(v5);
  uint64_t v3 = sub_1000E4C60();
  if (v7)
  {
    uint64_t v8 = CFReadStreamCreateWithFile(kCFAllocatorDefault, v2);
    if (v8)
    {
      uint64_t v9 = v8;
      if (!CFReadStreamOpen(v8)) {
        goto LABEL_38;
      }
      uint64_t v10 = (const __CFDictionary *)CFPropertyListCreateWithStream(kCFAllocatorDefault, v9, 0LL, 0LL, 0LL, 0LL);
      if (!v10) {
        goto LABEL_38;
      }
      unint64_t v11 = v10;
      CFTypeID v12 = CFGetTypeID(v10);
      if (v12 == CFDictionaryGetTypeID())
      {
        Value = CFDictionaryGetValue(v11, @"modelid-desc");
        CFURLRef v14 = CFDictionaryGetValue(v11, @"pluginid-vers");
        uint64_t v15 = CFDictionaryGetValue(v11, @"pluginpath-moddate");
        if (v15)
        {
          if (v3 && !CFEqual(v3, v15)) {
            Value = 0LL;
          }
          if (Value) {
            BOOL v16 = v14 == 0LL;
          }
          else {
            BOOL v16 = 1;
          }
          if (v16) {
            uint64_t v17 = 0LL;
          }
          else {
            uint64_t v17 = (uint64_t)Value;
          }
          qword_100102A90 = v17;
          if (!v16)
          {
            CFRetain(Value);
            qword_100102A98 = (uint64_t)v14;
            CFRetain(v14);
            goto LABEL_37;
          }
        }

        else
        {
          qword_100102A90 = 0LL;
        }

        qword_100102A98 = 0LL;
      }

CFURLRef sub_1000E4C0C()
{
  if (qword_100102AA0) {
    return CFURLCreateCopyAppendingPathComponent( kCFAllocatorDefault,  (CFURLRef)qword_100102AA0,  @"PluginRegistry.plist",  0);
  }
  else {
    return 0LL;
  }
}

__CFDictionary *sub_1000E4C60()
{
  CFURLRef v0 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/VoiceServices/PlugIns",  kCFURLPOSIXPathStyle,  1u);
  if (!v0) {
    return 0LL;
  }
  CFURLRef v1 = v0;
  int v2 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(v0, 0LL);
  if (v2)
  {
    uint64_t v3 = v2;
    CFIndex Count = CFArrayGetCount(v2);
    if (Count < 1)
    {
      CFMutableDictionaryRef Mutable = 0LL;
    }

    else
    {
      CFIndex v5 = Count;
      CFMutableDictionaryRef Mutable = 0LL;
      for (CFIndex i = 0LL; i != v5; ++i)
      {
        ValueAtIndex = (const __CFURL *)CFArrayGetValueAtIndex(v3, i);
        if (CFURLGetFileSystemRepresentation(ValueAtIndex, 1u, buffer, 1024LL) && !stat((const char *)buffer, &v12))
        {
          CFStringRef PathComponent = CFURLCopyLastPathComponent(ValueAtIndex);
          CFNumberRef v10 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongType, &v12.st_mtimespec);
          if (PathComponent)
          {
            if (CFStringGetLength(PathComponent) >= 1 && v10)
            {
              if (!Mutable) {
                CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  v5,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              }
              CFDictionaryAddValue(Mutable, PathComponent, v10);
            }

            CFRelease(PathComponent);
          }

          if (v10) {
            CFRelease(v10);
          }
        }
      }
    }

    CFRelease(v3);
  }

  else
  {
    CFMutableDictionaryRef Mutable = 0LL;
  }

  CFRelease(v1);
  return Mutable;
}

void sub_1000E4E18(const __CFURL *a1, CFMutableDictionaryRef a2)
{
  CFURLRef v4 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/VoiceServices/PlugIns",  kCFURLPOSIXPathStyle,  1u);
  CFErrorRef error = 0LL;
  if (!v4) {
    goto LABEL_14;
  }
  CFURLRef v5 = v4;
  cf[0] = 0LL;
  CFDictionaryRef v6 = (const __CFArray *)VSCopyContentsOfDirectoryAtURL(v4, cf);
  if (v6)
  {
    BOOL v7 = v6;
    CFIndex Count = CFArrayGetCount(v6);
    if (Count < 1)
    {
      CFMutableDictionaryRef v11 = 0LL;
      CFMutableDictionaryRef Mutable = 0LL;
    }

    else
    {
      CFIndex v9 = Count;
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v11 = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
      context[0] = Mutable;
      context[1] = v11;
      v26.locatioCFIndex n = 0LL;
      v26.length = v9;
      CFArrayApplyFunction(v7, v26, (CFArrayApplierFunction)sub_1000E5194, context);
    }

    CFRelease(v7);
  }

  else
  {
    stat v12 = (os_log_s *)VSGetLogDefault(0LL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      CFTypeRef Code = cf[0];
      if (cf[0]) {
        CFTypeRef Code = (CFTypeRef)CFErrorGetCode((CFErrorRef)cf[0]);
      }
      *(_DWORD *)keys = 136315394;
      *(void *)&keys[4] = "_CreateRegistryAndSaveToCache";
      *(_WORD *)&keys[12] = 2048;
      *(void *)&keys[14] = Code;
      _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "%s: error examining plugins directory (%ld)\n",  keys,  0x16u);
    }

    CFMutableDictionaryRef v11 = 0LL;
    CFMutableDictionaryRef Mutable = 0LL;
  }

  CFRelease(v5);
  if (cf[0]) {
    CFRelease(cf[0]);
  }
  if (Mutable)
  {
    if (a2)
    {
LABEL_13:
      CFRetain(a2);
      goto LABEL_16;
    }
  }

  else
  {
LABEL_14:
    CFMutableDictionaryRef v11 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
    CFRetain(v11);
    CFMutableDictionaryRef Mutable = v11;
    if (a2) {
      goto LABEL_13;
    }
  }

  a2 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL);
LABEL_16:
  *(_OWORD *)keys = *(_OWORD *)off_1000FA500;
  *(void *)&keys[16] = @"pluginpath-moddate";
  cf[0] = Mutable;
  cf[1] = v11;
  CFTypeRef cf[2] = a2;
  CFDictionaryRef v13 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  cf,  3LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  CFURLRef v14 = CFWriteStreamCreateWithFile(kCFAllocatorDefault, a1);
  if (v14)
  {
    uint64_t v15 = v14;
    if (CFWriteStreamOpen(v14) && !CFPropertyListWrite(v13, v15, kCFPropertyListBinaryFormat_v1_0, 0LL, &error))
    {
      BOOL v16 = (os_log_s *)VSGetLogDefault(0LL);
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v17)
      {
        *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
        CFErrorRef v23 = (CFErrorRef)"_CreateRegistryAndSaveToCache";
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: error writing plugin registry cache:\n",  buf,  0xCu);
      }

      if (error)
      {
        stat v18 = (os_log_s *)VSGetLogDefault(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)CFRunLoopSourceContext buf = 138412290;
          CFErrorRef v23 = error;
          _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }

        CFRelease(error);
      }
    }

    CFWriteStreamClose(v15);
    CFRelease(v15);
  }

  CFRelease(v13);
  CFRelease(a2);
  qword_100102A90 = (uint64_t)Mutable;
  qword_100102A98 = (uint64_t)v11;
}

void sub_1000E5194(CFURLRef url, uint64_t a2)
{
  uint64_t v4 = sub_1000E6748(kCFAllocatorDefault, url);
  CFURLRef v5 = *(const void **)a2;
  cf[0] = 0LL;
  cf[1] = v5;
  if (v4)
  {
    CFDictionaryRef v6 = (CFBundleRef *)v4;
    BOOL v7 = (pthread_mutex_t *)(v4 + 16);
    pthread_mutex_lock((pthread_mutex_t *)(v4 + 16));
    uint64_t v8 = (const __CFDictionary *)sub_1000E6830((uint64_t)v6);
    pthread_mutex_unlock(v7);
    if (v8)
    {
      cf[0] = CFURLCopyLastPathComponent(url);
      if (cf[0])
      {
        CFDictionaryApplyFunction(v8, (CFDictionaryApplierFunction)sub_1000E52B8, cf);
        CFRelease(cf[0]);
      }
    }

    InfoDictionary = CFBundleGetInfoDictionary(v6[10]);
    if (InfoDictionary) {
      Value = CFDictionaryGetValue(InfoDictionary, @"VSRecognitionVersion");
    }
    else {
      Value = 0LL;
    }
    CFStringRef Identifier = CFBundleGetIdentifier(v6[10]);
    CFTypeID TypeID = CFStringGetTypeID();
    if (Value)
    {
      if (Identifier)
      {
        CFTypeID v13 = TypeID;
        if (CFGetTypeID(Value) == TypeID && CFGetTypeID(Identifier) == v13) {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(a2 + 8), Identifier, Value);
        }
      }
    }

    CFRelease(v6);
  }

void sub_1000E52B8(void *key, const __CFDictionary *a2, uint64_t a3)
{
  if (!CFDictionaryContainsKey(*(CFDictionaryRef *)(a3 + 8), key))
  {
    Value = (const __CFArray *)CFDictionaryGetValue(a2, @"VSRecognitionModelRequiredCapabilities");
    if (Value && (BOOL v7 = Value, Count = CFArrayGetCount(Value), Count >= 1))
    {
      CFIndex v9 = Count;
      CFIndex v10 = 0LL;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v7, v10);
        stat v12 = (const __CFBoolean *)MGCopyAnswer(ValueAtIndex, 0LL);
        if (!v12) {
          break;
        }
        CFTypeID v13 = v12;
        CFTypeID v14 = CFGetTypeID(v12);
        if (v14 != CFBooleanGetTypeID())
        {
          BOOL v17 = v13;
          goto LABEL_11;
        }

        int v15 = CFBooleanGetValue(v13);
        CFRelease(v13);
        if (!v15) {
          return;
        }
        if (v9 == ++v10) {
          goto LABEL_10;
        }
      }
    }

    else
    {
LABEL_10:
      CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0LL, a2);
      CFDictionaryRemoveValue(MutableCopy, @"VSRecognitionModelIdentifier");
      CFDictionarySetValue(MutableCopy, @"PluginPath", *(const void **)a3);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a3 + 8), key, MutableCopy);
      BOOL v17 = MutableCopy;
LABEL_11:
      CFRelease(v17);
    }
  }

const void *sub_1000E53F4(const void *a1)
{
  int v2 = (const __CFDictionary *)sub_1000E4978();
  if (v2 && (uint64_t v3 = CFDictionaryGetValue(v2, a1)) != 0LL && (v4 = sub_1000E54DC((uint64_t)v3)) != 0LL)
  {
    CFURLRef v5 = v4;
    if (qword_100102A88 && (Value = CFDictionaryGetValue((CFDictionaryRef)qword_100102A88, v4)) != 0LL)
    {
      BOOL v7 = Value;
      CFRetain(Value);
    }

    else
    {
      BOOL v7 = (const void *)sub_1000E6748(kCFAllocatorDefault, v5);
      if (v7)
      {
        CFMutableDictionaryRef Mutable = (__CFDictionary *)qword_100102A88;
        if (!qword_100102A88)
        {
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
          qword_100102A88 = (uint64_t)Mutable;
        }

        CFDictionarySetValue(Mutable, v5, v7);
      }
    }

    CFRelease(v5);
  }

  else
  {
    BOOL v7 = 0LL;
  }

  pthread_mutex_unlock(&stru_1000FD880);
  return v7;
}

CFURLRef sub_1000E54DC(uint64_t a1)
{
  CFTypeID TypeID = CFStringGetTypeID();
  uint64_t ValueIfType = VSCFDictionaryGetValueIfType(a1, @"PluginPath", TypeID);
  if (!ValueIfType) {
    return 0LL;
  }
  CFURLRef v4 = (const __CFString *)ValueIfType;
  CFURLRef v5 = CFURLCreateWithFileSystemPath( kCFAllocatorDefault,  @"/System/Library/VoiceServices/PlugIns",  kCFURLPOSIXPathStyle,  1u);
  if (!v5) {
    return 0LL;
  }
  CFDictionaryRef v6 = v5;
  CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v5, v4, 1u);
  CFRelease(v6);
  return v7;
}

CFStringRef sub_1000E5578(const void *a1)
{
  int v2 = sub_1000E53F4(a1);
  if (!v2) {
    return 0LL;
  }
  uint64_t v3 = (uint64_t)v2;
  CFURLRef v4 = CFGetAllocator(v2);
  CFURLRef v5 = (pthread_mutex_t *)(v3 + 16);
  uint64_t v6 = pthread_mutex_lock((pthread_mutex_t *)(v3 + 16));
  CFURLRef v7 = (const __CFString *)VSPreferencesCopySpokenLanguageIdentifier(v6);
  uint64_t v8 = (const __CFDictionary *)sub_1000E6830(v3);
  if (v8) {
    CFIndex v9 = (const __CFDictionary *)CFDictionaryGetValue(v8, a1);
  }
  else {
    CFIndex v9 = 0LL;
  }
  CFMutableDictionaryRef v11 = *(const __CFDictionary **)(v3 + 112);
  if (v11)
  {
    stat v12 = (const __CFString *)CFDictionaryGetValue(v11, a1);
    CFIndex v10 = v12;
    if (v12 && v7 && v9)
    {
      CFTypeID v13 = (const __CFString *)CFDictionaryGetValue(v9, @"lang");
      if (v13 && CFStringCompare(v13, v7, 0LL))
      {
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 112), a1);
        CFMutableArrayRef MutableCopy = CFDictionaryCreateMutableCopy(v4, 0LL, v9);
        if (MutableCopy)
        {
          int v15 = MutableCopy;
          CFDictionaryRemoveValue(MutableCopy, @"lang");
          CFDictionaryRemoveValue(v15, @"VSRecognitionModelDefinition");
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 96), a1, v15);
          CFRelease(v15);
          CFIndex v9 = v15;
        }

        goto LABEL_17;
      }

CFDictionaryRef sub_1000E625C()
{
  uint64_t v4 = 0LL;
  uint64_t result = (const __CFDictionary *)sub_1000E4930();
  __int128 context = &v4;
  char v3 = 0;
  if (result)
  {
    CFURLRef v1 = result;
    CFDictionaryApplyFunction(result, (CFDictionaryApplierFunction)sub_1000E62B4, &context);
    CFRelease(v1);
    return (const __CFDictionary *)v4;
  }

  return result;
}

void sub_1000E62B4(const void *a1, uint64_t a2, uint64_t a3)
{
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (a3)
  {
    if (a1)
    {
      if (a2)
      {
        if (*(void *)a3)
        {
          CFTypeID v7 = TypeID;
          uint64_t ValueIfType = (const void *)VSCFDictionaryGetValueIfType(a2, @"VSRecognitionModelIsTopLevel", TypeID);
          if (ValueIfType)
          {
            if (CFEqual(ValueIfType, kCFBooleanTrue))
            {
              if (!*(_BYTE *)(a3 + 8)
                || (CFIndex v10 = (const __CFBoolean *)VSCFDictionaryGetValueIfType( a2,  @"VSRecognitionModelIsCancelModel",  v7),  !*(_BYTE *)(a3 + 8))
                || v10 && CFBooleanGetValue(v10))
              {
                sub_1000E6370(a1, v9, *(__CFSet ***)a3);
              }
            }
          }
        }
      }
    }
  }

void sub_1000E6370(const void *a1, uint64_t a2, __CFSet **a3)
{
  if (a1)
  {
    if (a3)
    {
      uint64_t v4 = sub_1000E5578(a1);
      if (v4)
      {
        CFURLRef v5 = v4;
        CFMutableDictionaryRef Mutable = *a3;
        if (!*a3)
        {
          CFMutableDictionaryRef Mutable = CFSetCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeSetCallBacks);
          *a3 = Mutable;
        }

        CFSetAddValue(Mutable, v5);
        CFRelease(v5);
      }
    }
  }

void sub_1000E63E0(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        CFTypeID TypeID = CFBooleanGetTypeID();
        uint64_t ValueIfType = (const void *)VSCFDictionaryGetValueIfType(a2, @"VSRecognitionModelIsTopLevel", TypeID);
        if (ValueIfType)
        {
          if (CFEqual(ValueIfType, kCFBooleanTrue))
          {
            CFTypeID v8 = CFStringGetTypeID();
            uint64_t v9 = VSCFDictionaryGetValueIfType(a2, @"VSRecognitionModelDataProvider", v8);
            if (v9)
            {
              uint64_t v10 = v9;
              CFURLRef v11 = sub_1000E54DC(a2);
              if (v11)
              {
                CFURLRef v12 = v11;
                uint64_t String = VSRecognitionPluginInfoCreateString(v11, v10);
                if (String)
                {
                  CFTypeID v14 = (const void *)String;
                  CFMutableDictionaryRef Mutable = *a3;
                  if (!*a3)
                  {
                    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                    *a3 = Mutable;
                  }

                  CFDictionarySetValue(Mutable, a1, v14);
                  CFRelease(v14);
                }

                CFRelease(v12);
              }
            }
          }
        }
      }
    }
  }

uint64_t sub_1000E64E0()
{
  uint64_t v0 = qword_100102A98;
  if (qword_100102A98) {
    CFRetain((CFTypeRef)qword_100102A98);
  }
  pthread_mutex_unlock(&stru_1000FD880);
  return v0;
}

void sub_1000E652C()
{
  uint64_t v0 = CFCopyHomeDirectoryURLForUser(0LL);
  if (v0)
  {
    CFURLRef v1 = (const void *)v0;
    if (VSCreateURLAndDirectory(v0, @"Library", &v3) && v3)
    {
      if (VSCreateURLAndDirectory(v3, @"Caches", &cf) && cf)
      {
        VSCreateURLAndDirectory(cf, @"VoiceServices", &qword_100102AA0);
        CFRelease(cf);
      }

      if (v3) {
        CFRelease(v3);
      }
    }

    CFRelease(v1);
  }

uint64_t sub_1000E65C4()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000FA518);
  qword_100102AA8 = result;
  return result;
}

uint64_t sub_1000E65E8(uint64_t a1)
{
  int v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  CFTypeRef v3 = *(const void **)(a1 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 80) = 0LL;
  }

  uint64_t v4 = *(const void **)(a1 + 96);
  if (v4)
  {
    CFRelease(v4);
    *(void *)(a1 + 96) = 0LL;
  }

  CFURLRef v5 = *(const void **)(a1 + 104);
  if (v5)
  {
    CFRelease(v5);
    *(void *)(a1 + 104) = 0LL;
  }

  uint64_t v6 = *(const void **)(a1 + 112);
  if (v6)
  {
    CFRelease(v6);
    *(void *)(a1 + 112) = 0LL;
  }

  CFTypeID v7 = *(const void **)(a1 + 120);
  if (v7)
  {
    CFRelease(v7);
    *(void *)(a1 + 120) = 0LL;
  }

  CFTypeID v8 = *(const void **)(a1 + 128);
  if (v8)
  {
    CFRelease(v8);
    *(void *)(a1 + 128) = 0LL;
  }

  return pthread_mutex_destroy(v2);
}

uint64_t sub_1000E6674(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 == a2;
  CFTypeRef v3 = *(__CFBundle **)(a1 + 80);
  if (v3 && *(void *)(a2 + 80))
  {
    CFURLRef v5 = CFBundleCopyBundleURL(v3);
    CFURLRef v6 = CFBundleCopyBundleURL(*(CFBundleRef *)(a2 + 80));
    CFURLRef v7 = v6;
    if (v5) {
      BOOL v8 = v6 == 0LL;
    }
    else {
      BOOL v8 = 1;
    }
    if (!v8)
    {
      if (CFEqual(v5, v6)) {
        uint64_t v2 = 1LL;
      }
      else {
        uint64_t v2 = v2;
      }
LABEL_15:
      CFRelease(v5);
      if (!v7) {
        return v2;
      }
      goto LABEL_10;
    }

    if (v5) {
      goto LABEL_15;
    }
    if (v6) {
LABEL_10:
    }
      CFRelease(v7);
  }

  return v2;
}

CFStringRef sub_1000E6708(void *a1)
{
  uint64_t v2 = CFGetAllocator(a1);
  return CFStringCreateWithFormat(v2, 0LL, @"<VSPlugin %p: %@>", a1, a1[10]);
}

uint64_t sub_1000E6748(const __CFAllocator *a1, CFURLRef url)
{
  if (!url) {
    return 0LL;
  }
  uint64_t v4 = CFURLCopyPathExtension(url);
  if (!v4) {
    return 0LL;
  }
  CFURLRef v5 = v4;
  uint64_t v6 = 0LL;
  if (CFStringCompare(v4, @"vsplugin", 0LL) == kCFCompareEqualTo)
  {
    CFBundleRef v8 = CFBundleCreate(a1, url);
    if (v8)
    {
      CFBundleRef v9 = v8;
      pthread_once(&stru_1000FD8D0, (void (*)(void))sub_1000E65C4);
      uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102AA8, 120LL, 0LL);
      uint64_t v6 = Instance;
      if (Instance)
      {
        *(void *)(Instance + 80) = v9;
        *(_BYTE *)(Instance + 88) = 0;
        *(_OWORD *)(Instance + 96) = 0u;
        *(_OWORD *)(Instance + 112) = 0u;
        *(void *)(Instance + 128) = 0LL;
        pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0LL);
      }

      else
      {
        CFRelease(v9);
      }
    }

    else
    {
      uint64_t v6 = 0LL;
    }
  }

  CFRelease(v5);
  return v6;
}

uint64_t sub_1000E6830(uint64_t a1)
{
  if (!*(void *)(a1 + 96))
  {
    InfoDictionary = CFBundleGetInfoDictionary(*(CFBundleRef *)(a1 + 80));
    if (InfoDictionary)
    {
      Value = (const __CFArray *)CFDictionaryGetValue(InfoDictionary, @"VSRecognitionModels");
      if (Value)
      {
        CFURLRef v5 = Value;
        CFTypeID v6 = CFGetTypeID(Value);
        if (v6 == CFArrayGetTypeID())
        {
          CFURLRef v7 = CFGetAllocator((CFTypeRef)a1);
          CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v7, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (Mutable)
          {
            CFMutableDictionaryRef v9 = Mutable;
            v10.length = CFArrayGetCount(v5);
            v10.locatioCFIndex n = 0LL;
            CFArrayApplyFunction(v5, v10, (CFArrayApplierFunction)sub_1000E68E8, v9);
            *(void *)(a1 + 96) = v9;
          }
        }
      }
    }
  }

  return *(void *)(a1 + 96);
}

void sub_1000E68E8(const void *a1, __CFDictionary *a2)
{
  CFTypeID v4 = CFGetTypeID(a1);
  if (v4 == CFDictionaryGetTypeID())
  {
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"VSRecognitionModelIdentifier");
    if (Value)
    {
      CFTypeID v6 = Value;
      if (CFStringGetLength(Value) >= 1 && !CFDictionaryContainsKey(a2, v6)) {
        CFDictionarySetValue(a2, v6, a1);
      }
    }
  }

void sub_1000E6974()
{
  if (!qword_100102AB0)
  {
    *(_OWORD *)keys = *(_OWORD *)off_1000FA578;
    __int128 v3 = *(_OWORD *)off_1000FA588;
    __int128 v4 = *(_OWORD *)off_1000FA598;
    CFURLRef v5 = @"VSRecognitionClassTypeAlbumName";
    v0[0] = xmmword_1000F28B0;
    v0[1] = xmmword_1000F28C0;
    v0[2] = xmmword_1000F28D0;
    uint64_t v1 = 6LL;
    qword_100102AB0 = (uint64_t)CFDictionaryCreate( kCFAllocatorDefault,  (const void **)keys,  (const void **)v0,  7LL,  &kCFTypeDictionaryKeyCallBacks,  0LL);
  }

void sub_1000E6A40( CFAllocatorRef allocator, void *value, const void *a3, __CFArray **a4, CFMutableDictionaryRef *a5)
{
  CFMutableDictionaryRef Mutable = *a4;
  if (!*a4)
  {
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(allocator, 0LL, &kCFTypeArrayCallBacks);
    *a4 = Mutable;
  }

  if (!*a5)
  {
    *a5 = CFDictionaryCreateMutable(allocator, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef Mutable = *a4;
  }

  CFArrayAppendValue(Mutable, value);
  CFDictionarySetValue(*a5, a3, value);
}

CFDictionaryRef sub_1000E6ADC( const __CFAllocator *a1, CFArrayRef theArray, const __CFDictionary *a3, int a4, const void **a5, const __CFSet *a6)
{
  CFArrayRef v8 = theArray;
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0LL;
  }
  CFTypeID TypeID = CFArrayGetTypeID();
  CFTypeID v9 = CFStringGetTypeID();
  CFTypeID v43 = CFDictionaryGetTypeID();
  if (a5) {
    CFRange v10 = (const __CFDictionary *)*a5;
  }
  else {
    CFRange v10 = 0LL;
  }
  CFIndex v38 = a5;
  if (Count < 1)
  {
    CFTypeRef cf = 0LL;
    goto LABEL_74;
  }

  CFMutableDictionaryRef theDict = v10;
  CFTypeRef cf = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v41 = v8;
  do
  {
    uint64_t ValueAtIndexIfType = VSCFArrayGetValueAtIndexIfType(v8, v11, v43);
    if (!ValueAtIndexIfType
      || (uint64_t v13 = ValueAtIndexIfType,
          (uint64_t ValueIfType = (const __CFArray *)VSCFDictionaryGetValueIfType( ValueAtIndexIfType,  @"VSRecognitionSequenceElements",  TypeID)) == 0LL))
    {
      CFRange v10 = theDict;
      goto LABEL_69;
    }

    int v15 = ValueIfType;
    uint64_t v45 = v13;
    uint64_t v46 = v11;
    CFIndex v16 = CFArrayGetCount(ValueIfType);
    if (v16 >= 1)
    {
      BOOL v17 = 0LL;
      CFMutableDictionaryRef Mutable = 0LL;
      CFIndex v19 = 0LL;
      while (1)
      {
        CFTypeID v20 = (const __CFString *)VSCFArrayGetValueAtIndexIfType(v15, v19, v9);
        if (!v20)
        {
          int v29 = 0;
          goto LABEL_43;
        }

        CFTypeID v21 = v20;
        CFRange result = (CFRange)xmmword_1000F28E0;
        CFIndex Length = CFStringGetLength(v20);
        v51.locatioCFIndex n = 0LL;
        v51.length = Length;
        if (CFStringFindWithOptions(v21, @"+", v51, 0xCuLL, &result)) {
          break;
        }
        v52.locatioCFIndex n = 0LL;
        v52.length = Length;
        if (CFStringFindWithOptions(v21, @"*", v52, 0xCuLL, &result))
        {
          uint64_t v23 = 2LL;
          goto LABEL_18;
        }

        CFRetain(v21);
        uint64_t v23 = 0LL;
LABEL_19:
        Value = CFDictionaryGetValue(a3, v21);
        if (Value)
        {
          CFRange v26 = Value;
          if (!a4 || *((_BYTE *)Value + 41))
          {
            if (!Mutable) {
              CFMutableDictionaryRef Mutable = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
            }
            CFArrayAppendValue(Mutable, v26);
            if (!v17)
            {
              if (v23)
              {
                BOOL v17 = CFArrayCreateMutable(a1, 0LL, 0LL);
                if (v19)
                {
                  CFIndex v27 = v19;
                  do
                  {
                    CFArrayAppendValue(v17, 0LL);
                    --v27;
                  }

                  while (v27);
                }
              }
            }

            if (v17) {
              CFArrayAppendValue(v17, (const void *)v23);
            }
            int v28 = 0;
            goto LABEL_34;
          }
        }

        else if (a6)
        {
          int v28 = CFSetContainsValue(a6, v21);
LABEL_34:
          int v29 = 1;
          goto LABEL_36;
        }

        int v28 = 0;
        int v29 = 0;
LABEL_36:
        CFRelease(v21);
        ++v19;
        BOOL v30 = v28 == 0;
        if (v19 >= v16 || !v29 || v28) {
          goto LABEL_44;
        }
      }

      uint64_t v23 = 1LL;
LABEL_18:
      uint64_t v24 = CFGetAllocator(v21);
      v53.length = result.location;
      v53.locatioCFIndex n = 0LL;
      CFTypeID v21 = CFStringCreateWithSubstring(v24, v21, v53);
      goto LABEL_19;
    }

    CFMutableDictionaryRef Mutable = 0LL;
    BOOL v17 = 0LL;
    int v29 = 1;
LABEL_43:
    BOOL v30 = 1;
LABEL_44:
    if (v16 == 0 && v30) {
      LODWORD(v31) = 0;
    }
    else {
      LODWORD(v31) = v29;
    }
    if (v30)
    {
      if ((_DWORD)v31)
      {
        CFURLRef v31 = (const void *)sub_1000E94DC(a1, Mutable, v17);
        if (v31)
        {
          CFMutableArrayRef v32 = cf;
          if (!cf) {
            CFMutableArrayRef v32 = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
          }
          CFTypeRef cf = v32;
          CFArrayAppendValue(v32, v31);
          uint64_t v33 = (const void *)VSCFDictionaryGetValueIfType(v45, @"VSRecognitionSequenceDisambiguationTag", v9);
          if (!v33) {
            goto LABEL_59;
          }
          int v34 = v33;
          int v35 = theDict;
          if (theDict)
          {
            CFTypeID v36 = (__CFArray *)CFDictionaryGetValue(theDict, v33);
            if (v36)
            {
LABEL_58:
              CFMutableDictionaryRef theDict = v35;
              CFArrayAppendValue(v36, v31);
LABEL_59:
              CFRelease(v31);
              LODWORD(v31) = 1;
              goto LABEL_60;
            }
          }

          else
          {
            int v35 = CFDictionaryCreateMutable(a1, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }

          CFTypeID v36 = CFArrayCreateMutable(a1, 0LL, &kCFTypeArrayCallBacks);
          CFDictionarySetValue(v35, v34, v36);
          CFRelease(v36);
          goto LABEL_58;
        }
      }
    }

__CFArray *sub_1000E6F1C(uint64_t a1, CFArrayRef theArray, char *a3)
{
  if (!theArray) {
    return 0LL;
  }
  CFIndex Count = CFArrayGetCount(theArray);
  CFRange result = 0LL;
  if (a3 && Count >= 1)
  {
    CFMutableDictionaryRef Mutable = 0LL;
    CFIndex v9 = 0LL;
    CFRange v10 = 0LL;
    uint64_t v24 = (pthread_mutex_t *)(a3 + 16);
    uint64_t v11 = &kCFTypeArrayCallBacks;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(theArray, v9);
      uint64_t v13 = sub_1000E9188((uint64_t)ValueAtIndex);
      if (v13)
      {
        CFTypeID v14 = (const void *)v13;
        if (!Mutable) {
          goto LABEL_7;
        }
      }

      else
      {
        if (!v10)
        {
          CFIndex v16 = *(void **)(a1 + 16);
          if (!v16) {
            goto LABEL_23;
          }
          CFRetain(*(CFTypeRef *)(a1 + 16));
          pthread_mutex_lock(v24);
          BOOL v17 = sub_1000E78D8((uint64_t)a3, v16);
          pthread_mutex_unlock(v24);
          if (!v17) {
            goto LABEL_22;
          }
          uint64_t v18 = a1;
          CFIndex v19 = v11;
          CFTypeID v20 = (const void **)malloc(0x10uLL);
          CFStringRef v20 = v17;
          *((_BYTE *)v20 + 8) = objc_opt_respondsToSelector( v17,  "getValue:weight:atIndex:forClassWithIdentifier:inModelWithIdentifier:") & 1;
          *((_BYTE *)v20 + 9) = objc_opt_respondsToSelector( v17,  "phoneticValueAtIndex:forClassWithIdentifier:inModelWithIdentifier:") & 1;
          *(void *)&__int128 v25 = v20;
          *((void *)&v25 + 1) = sub_1000E7C24;
          CFRange v26 = sub_1000E7CC4;
          CFIndex v27 = sub_1000E7EA0;
          CFAllocatorRef v21 = CFGetAllocator(a3);
          uint64_t v22 = sub_1000E7F20((uint64_t)v21, &v25);
          if (!v22)
          {
            sub_1000E7EA0(v20);
LABEL_22:
            CFRelease(v16);
LABEL_23:
            uint64_t v23 = 0LL;
            CFRange result = 0LL;
            CFRange v10 = Mutable;
            if (!Mutable) {
              return result;
            }
LABEL_19:
            CFRelease(v10);
            return v23;
          }

          CFRange v10 = (const void *)v22;
          CFRelease(v16);
          uint64_t v11 = v19;
          a1 = v18;
        }

        CFRetain(v10);
        CFTypeID v14 = v10;
        if (!Mutable)
        {
LABEL_7:
          int v15 = CFGetAllocator(a3);
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v15, 0LL, v11);
        }
      }

      CFArrayAppendValue(Mutable, v14);
      CFRelease(v14);
      if (Count == ++v9)
      {
        uint64_t v23 = Mutable;
        CFRange result = Mutable;
        if (!v10) {
          return result;
        }
        goto LABEL_19;
      }
    }
  }

  return result;
}

uint64_t sub_1000E712C(CFTypeRef *a1, const void **a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    CFArrayRef v8 = *a2;
    if (a4) {
      goto LABEL_3;
    }
    return 1LL;
  }

  CFArrayRef v8 = 0LL;
  if (!a4) {
    return 1LL;
  }
LABEL_3:
  CFTypeID v36 = (pthread_mutex_t *)(a4 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a4 + 16));
  CFTypeRef v9 = a1[2];
  if (v9)
  {
    CFRetain(a1[2]);
    CFArrayRef theArray = 0LL;
    CFArrayRef v38 = 0LL;
    if (v8)
    {
      CFRange v10 = *(const __CFDictionary **)(a4 + 104);
      if (v10)
      {
        Value = (const __CFDictionary *)CFDictionaryGetValue(v10, v9);
        if (Value)
        {
          CFURLRef v12 = Value;
          PhraseCFIndex Count = VSRecognitionResultGetPhraseCount(v8);
          VSRecognitionResultCopyClassIDsAndPhrases(v8, &theArray, &v38);
          if (PhraseCount >= 1)
          {
            uint64_t v35 = a3;
            CFMutableArrayRef MutableCopy = 0LL;
            for (CFIndex i = 0LL; i != PhraseCount; ++i)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(theArray, i);
              if (ValueAtIndex)
              {
                BOOL v17 = (const __CFDictionary *)CFDictionaryGetValue(v12, ValueAtIndex);
                if (v17)
                {
                  uint64_t v18 = v17;
                  CFIndex v19 = CFArrayGetValueAtIndex(v38, i);
                  newValues = (void *)CFDictionaryGetValue(v18, v19);
                  if (newValues)
                  {
                    if (!MutableCopy)
                    {
                      CFTypeID v20 = CFGetAllocator(v8);
                      CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(v20, 0LL, v38);
                    }

                    v40.locatioCFIndex n = i;
                    v40.length = 1LL;
                    CFArrayReplaceValues(MutableCopy, v40, (const void **)&newValues, 1LL);
                  }
                }
              }
            }

            a3 = v35;
            if (MutableCopy)
            {
              CFAllocatorRef v21 = CFGetAllocator(v8);
              ModelCFStringRef Identifier = VSRecognitionResultGetModelIdentifier(v8);
              CFAllocatorRef v23 = v21;
              a3 = v35;
              uint64_t v24 = (const void *)VSRecognitionResultCreate(v23, ModelIdentifier);
              CFRelease(MutableCopy);
              if (v24) {
                goto LABEL_23;
              }
            }
          }
        }
      }

      goto LABEL_22;
    }

void sub_1000E7444(uint64_t a1, void *a2, const void *a3, const void *a4)
{
  CFTypeID v6 = a2;
  if (!a1)
  {
    CFURLRef v7 = 0LL;
    if (!a2) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

  CFURLRef v7 = *(const void **)(a1 + 16);
  if (v7) {
    CFRetain(*(CFTypeRef *)(a1 + 16));
  }
  if (v6)
  {
LABEL_7:
    CFTypeID v6 = (void *)v6[2];
    if (v6) {
      CFRetain(v6);
    }
  }

uint64_t sub_1000E75C4(uint64_t a1, uint64_t a2, const __CFString *a3)
{
  if (*(void *)(a2 + 48)) {
    return 0LL;
  }
  CFTypeID v6 = *(const __CFString **)(a1 + 16);
  if (v6) {
    CFRetain(*(CFTypeRef *)(a1 + 16));
  }
  CFURLRef v7 = *(const __CFString **)(a2 + 16);
  if (v7) {
    CFRetain(v7);
  }
  pthread_mutex_lock(&stru_1000FD830);
  if (qword_100102A78) {
    uint64_t v3 = sub_1000EA190(qword_100102A78, v6, v7, a3);
  }
  else {
    uint64_t v3 = 0LL;
  }
  pthread_mutex_unlock(&stru_1000FD830);
  if (v6) {
    CFRelease(v6);
  }
  if (v7) {
    CFRelease(v7);
  }
  return v3;
}

uint64_t sub_1000E7678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 16);
  if (!v3) {
    return 0LL;
  }
  CFRetain(*(CFTypeRef *)(a1 + 16));
  pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
  CFTypeID v6 = sub_1000E78D8(a3, v3);
  pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
  if (v6)
  {
    if ((objc_opt_respondsToSelector(v6, "isCacheValidityIdentifierValid:") & 1) != 0) {
      a2 = (uint64_t)-[NSString isCacheValidityIdentifierValid:](v6, "isCacheValidityIdentifierValid:", a2);
    }
    else {
      a2 = 0LL;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a3 + 16));
    CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a3 + 128);
    if (!Mutable)
    {
      CFRange v10 = CFGetAllocator((CFTypeRef)a3);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v10, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a3 + 128) = Mutable;
    }

    CFDictionarySetValue(Mutable, v3, v6);
    pthread_mutex_unlock((pthread_mutex_t *)(a3 + 16));
    CFRelease(v6);
  }

  else if (a2)
  {
    CFBooleanRef Value = (CFBooleanRef)CFDictionaryGetValue((CFDictionaryRef)a2, @"isvalid");
    if (Value) {
      BOOL v8 = Value == kCFBooleanTrue;
    }
    else {
      BOOL v8 = 0;
    }
    a2 = v8;
  }

  CFRelease(v3);
  return a2;
}

CFDictionaryRef sub_1000E77A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  if (!v2) {
    return 0LL;
  }
  CFRetain(*(CFTypeRef *)(a1 + 16));
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 16));
  __int128 v4 = sub_1000E78D8(a2, v2);
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 16));
  if (v4)
  {
    if ((objc_opt_respondsToSelector(v4, "cacheValidityIdentifier") & 1) != 0)
    {
      CFURLRef v5 = (const __CFDictionary *)-[NSString cacheValidityIdentifier](v4, "cacheValidityIdentifier");
      CFDictionaryRef v6 = v5;
      if (v5) {
        CFRetain(v5);
      }
    }

    else
    {
      CFDictionaryRef v6 = 0LL;
    }

    pthread_mutex_lock((pthread_mutex_t *)(a2 + 16));
    CFMutableDictionaryRef Mutable = *(__CFDictionary **)(a2 + 128);
    if (!Mutable)
    {
      BOOL v8 = CFGetAllocator((CFTypeRef)a2);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(v8, 0LL, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      *(void *)(a2 + 128) = Mutable;
    }

    CFDictionarySetValue(Mutable, v2, v4);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 16));
    CFRelease(v4);
  }

  else
  {
    CFDictionaryRef v6 = CFDictionaryCreate( kCFAllocatorDefault,  (const void **)&off_1000FA5B0,  (const void **)&kCFBooleanTrue,  1LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
  }

  CFRelease(v2);
  return v6;
}

NSString *sub_1000E78D8(uint64_t a1, void *key)
{
  __int128 v4 = *(const __CFDictionary **)(a1 + 128);
  if (v4 && (CFBooleanRef Value = (NSString *)CFDictionaryGetValue(v4, key)) != 0LL)
  {
    CFDictionaryRef v6 = Value;
    CFRetain(Value);
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 128), key);
  }

  else
  {
    CFURLRef v7 = sub_1000E79CC( a1,  (uint64_t)key,  (uint64_t)@"VSRecognitionModelDataProvider",  (uint64_t)&OBJC_PROTOCOL___VSRecognitionModelDataProvider);
    CFDictionaryRef v6 = v7;
    if (v7)
    {
      if ((objc_opt_respondsToSelector(v7, "valueAtIndex:forClassWithIdentifier:inModelWithIdentifier:") & 1) == 0)
      {
        uint64_t v8 = objc_opt_respondsToSelector(v6, "getValue:weight:atIndex:forClassWithIdentifier:inModelWithIdentifier:");
        if ((v8 & 1) == 0)
        {
          CFTypeRef v9 = (os_log_s *)VSGetLogDefault(v8);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            v11[0] = 0;
            _os_log_error_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_ERROR,  "data provider does not implement value method\n",  (uint8_t *)v11,  2u);
          }

          return 0LL;
        }
      }
    }
  }

  return v6;
}

NSString *sub_1000E79CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  CFRange result = (NSString *)sub_1000E6830(a1);
  if (result)
  {
    CFTypeRef v9 = result;
    CFTypeID TypeID = CFDictionaryGetTypeID();
    CFRange result = (NSString *)VSCFDictionaryGetValueIfType(v9, a2, TypeID);
    if (result)
    {
      uint64_t v11 = result;
      CFTypeID v12 = CFStringGetTypeID();
      CFRange result = (NSString *)VSCFDictionaryGetValueIfType(v11, a3, v12);
      if (result)
      {
        uint64_t v13 = result;
        CFErrorRef error = 0LL;
        if (!*(_BYTE *)(a1 + 88))
        {
          int v14 = CFBundleLoadExecutableAndReturnError(*(CFBundleRef *)(a1 + 80), &error);
          CFErrorRef v15 = error;
          if (!v14 && error)
          {
            CFIndex v16 = (os_log_s *)VSGetLogDefault(error);
            BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
            if (v17)
            {
              *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
              char v26 = "_LoadPluginIfNecessary";
              _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "%s: error loading plugin:\n",  buf,  0xCu);
            }

            uint64_t v18 = (os_log_s *)VSGetLogDefault(v17);
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = 138412290;
              char v26 = (const char *)error;
              _os_log_debug_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            CFErrorRef v15 = error;
          }

          if (v15) {
            CFRelease(v15);
          }
          *(_BYTE *)(a1 + 88) = 1;
        }

        Class v19 = NSClassFromString(v13);
        if (v19)
        {
          CFTypeID v20 = v19;
          if (!a4) {
            return (NSString *)objc_alloc_init(v20);
          }
          id v21 = -[objc_class conformsToProtocol:](v19, "conformsToProtocol:", a4);
          if ((_DWORD)v21) {
            return (NSString *)objc_alloc_init(v20);
          }
          uint64_t v22 = (os_log_s *)VSGetLogDefault(v21);
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            return 0LL;
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          char v26 = "_InstantiatePluginClassWithRecognitionModelKeyedName";
          CFAllocatorRef v23 = "%s: plugin class does not conform to appropriate protocol\n";
        }

        else
        {
          uint64_t v22 = (os_log_s *)VSGetLogDefault(0LL);
          if (!os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            return 0LL;
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          char v26 = "_InstantiatePluginClassWithRecognitionModelKeyedName";
          CFAllocatorRef v23 = "%s: plugin class not found\n";
        }

        _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, v23, buf, 0xCu);
        return 0LL;
      }
    }
  }

  return result;
}

id sub_1000E7C24(uint64_t a1, uint64_t a2, uint64_t a3, void **a4)
{
  CFDictionaryRef v6 = *(const void **)(a3 + 16);
  if (v6) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  CFURLRef v7 = *(const void **)(a2 + 16);
  if (v7) {
    CFRetain(v7);
  }
  if (a4)
  {
    uint64_t v8 = *a4;
    if (!v6)
    {
LABEL_11:
      id v9 = 0LL;
      id v10 = 0LL;
      if (!v6) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
    if (!v6) {
      goto LABEL_11;
    }
  }

  if (!v7) {
    goto LABEL_11;
  }
  id v9 = [v8 valueCountForClassWithIdentifier:v6 inModelWithIdentifier:v7];
LABEL_12:
  CFRelease(v6);
  id v10 = v9;
LABEL_13:
  if (v7) {
    CFRelease(v7);
  }
  return v10;
}

BOOL sub_1000E7CC4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7, void *a8)
{
  CFTypeRef cf = 0LL;
  int v14 = *(const void **)(a3 + 16);
  if (v14) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  CFErrorRef v15 = *(const void **)(a2 + 16);
  if (v15) {
    CFRetain(v15);
  }
  if (a5)
  {
    CFIndex v16 = *(void **)a5;
    uint64_t v22 = 0LL;
    BOOL v17 = v14 != 0LL;
    BOOL v18 = v15 != 0LL;
    if (v14 && v15)
    {
      if (*(_BYTE *)(a5 + 8)) {
        [v16 getValue:&cf weight:&v22 atIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      else {
        CFTypeRef cf = [v16 valueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      id v20 = 0LL;
      if (a8 && *(_BYTE *)(a5 + 9)) {
        id v20 = [v16 phoneticValueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      }
      CFTypeRef v19 = cf;
      if (!cf) {
        goto LABEL_25;
      }
LABEL_24:
      CFRetain(v19);
LABEL_25:
      if (v20) {
        CFRetain(v20);
      }
      CFRelease(v14);
      goto LABEL_28;
    }
  }

  else
  {
    uint64_t v22 = 0LL;
    BOOL v17 = v14 != 0LL;
    BOOL v18 = v15 != 0LL;
    if (v14 && v15)
    {
      CFTypeRef v19 = [0 valueAtIndex:a4 forClassWithIdentifier:v14 inModelWithIdentifier:v15];
      id v20 = 0LL;
      CFTypeRef cf = v19;
      if (!v19) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }

  if (v17)
  {
    CFRelease(v14);
    id v20 = 0LL;
    if (!v18) {
      goto LABEL_29;
    }
LABEL_28:
    CFRelease(v15);
    goto LABEL_29;
  }

  id v20 = 0LL;
  if (v18) {
    goto LABEL_28;
  }
LABEL_29:
  if (a6) {
    *a6 = v22;
  }
  if (a7)
  {
    *a7 = cf;
  }

  else if (cf)
  {
    CFRelease(cf);
  }

  if (a8)
  {
    *a8 = v20;
  }

  else if (v20)
  {
    CFRelease(v20);
  }

  return cf != 0LL;
}

void sub_1000E7EA0(const void **a1)
{
  if (a1)
  {
    uint64_t v2 = *a1;
    if (v2) {
      CFRelease(v2);
    }
    free(a1);
  }

uint64_t sub_1000E7ED4()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000FA5B8);
  qword_100102AB8 = result;
  return result;
}

uint64_t sub_1000E7EF8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 16);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(a1 + 40);
    if (v3) {
      return v3();
    }
  }

  return result;
}

BOOL sub_1000E7F14(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000E7F20(uint64_t a1, _OWORD *a2)
{
  if (!a2) {
    return 0LL;
  }
  pthread_once(&stru_1000FD9B0, (void (*)(void))sub_1000E7ED4);
  uint64_t result = _CFRuntimeCreateInstance(a1, qword_100102AB8, 32LL, 0LL);
  if (result)
  {
    __int128 v5 = a2[1];
    *(_OWORD *)(result + 16) = *a2;
    *(_OWORD *)(result + 32) = v5;
  }

  return result;
}

uint64_t sub_1000E7F84()
{
  qword_100102AC0 = _CFRuntimeRegisterClass(&unk_1000FA618);
  return pthread_mutex_init(&stru_100102AC8, 0LL);
}

void sub_1000E7FB4(void *a1)
{
  uint64_t v2 = (const void *)a1[70];
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = (const void *)a1[71];
  if (v3) {
    CFRelease(v3);
  }
  __int128 v4 = (const void *)a1[2];
  if (v4) {
    CFRelease(v4);
  }
  __int128 v5 = (void *)a1[67];
  if (v5 && a1 + 3 != v5) {
    free(v5);
  }
  CFDictionaryRef v6 = (const void *)a1[73];
  if (v6) {
    CFRelease(v6);
  }
  CFURLRef v7 = (const void *)a1[72];
  if (v7) {
    CFRelease(v7);
  }
  uint64_t v8 = (void (*)(void))a1[80];
  if (v8) {
    v8(a1[82]);
  }
}

BOOL sub_1000E803C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000E8048( const __CFAllocator *a1, const void *a2, uint64_t a3, char a4, CFArrayRef theArray, const __CFArray *a6, const __CFDictionary *a7, const void *a8, __int128 *a9, uint64_t a10)
{
  uint64_t v10 = 0LL;
  if (theArray && a6)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count >= 1
      && (CFIndex v20 = Count,
          CFTypeRef cf = a8,
          (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( a1,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks)) != 0LL))
    {
      uint64_t v22 = Mutable;
      v40.locatioCFIndex n = 0LL;
      v40.length = v20;
      CFArrayApplyFunction(theArray, v40, (CFArrayApplierFunction)sub_1000E831C, Mutable);
      uint64_t v10 = 0LL;
      if (CFDictionaryGetCount(v22) == v20)
      {
        CFArrayRef Copy = CFArrayCreateCopy(a1, a6);
        if (Copy)
        {
          uint64_t v24 = Copy;
          if (a7) {
            a7 = CFDictionaryCreateCopy(a1, a7);
          }
          CFIndex v25 = CFDictionaryGetCount(v22);
          CFIndex v26 = CFArrayGetCount(v24);
          uint64_t v10 = 0LL;
          if (v25 >= 1 && v26 >= 1)
          {
            pthread_once(&stru_1000FD9C0, (void (*)(void))sub_1000E7F84);
            uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102AC0, 648LL, 0LL);
            uint64_t v10 = Instance;
            if (Instance)
            {
              if (a2)
              {
                *(void *)(Instance + 16) = a2;
                CFRetain(a2);
                int v28 = *(const __CFString **)(v10 + 16);
              }

              else
              {
                pthread_mutex_lock(&stru_100102AC8);
                uint64_t v29 = qword_100102B08++;
                pthread_mutex_unlock(&stru_100102AC8);
                int v28 = CFStringCreateWithFormat(a1, 0LL, @"dflt%ld", v29);
                *(void *)(v10 + 16) = v28;
              }

              *(void *)(v10 + 536) = 0LL;
              if (v28)
              {
                CFIndex Length = CFStringGetLength(v28);
                if (Length >= 1)
                {
                  if ((unint64_t)Length > 0x1FE)
                  {
                    CFIndex v32 = Length + 1;
                    CFURLRef v31 = (char *)malloc(Length + 1);
                  }

                  else
                  {
                    CFURLRef v31 = (char *)(v10 + 24);
                    CFIndex v32 = Length + 1;
                  }

                  *(void *)(v10 + 536) = v31;
                  if (!CFStringGetCString(*(CFStringRef *)(v10 + 16), v31, v32, 0x8000100u))
                  {
                    if (*(void *)(v10 + 536) != v10 + 24) {
                      free((void *)(v10 + 24));
                    }
                    *(void *)(v10 + 536) = 0LL;
                  }
                }
              }

              *(void *)(v10 + 544) = a3;
              *(_BYTE *)(v10 + 552) = a4;
              *(void *)(v10 + 560) = v22;
              *(void *)(v10 + 568) = v24;
              *(void *)(v10 + 584) = a7;
              CFTypeRef v33 = cf;
              if (cf) {
                CFTypeRef v33 = CFRetain(cf);
              }
              *(void *)(v10 + 576) = v33;
              *(_BYTE *)(v10 + 648) = 0;
              *(void *)(v10 + 656) = a10;
              if (a9)
              {
                __int128 v34 = *a9;
                __int128 v35 = a9[1];
                __int128 v36 = a9[2];
                *(void *)(v10 + 640) = *((void *)a9 + 6);
                *(_OWORD *)(v10 + 608) = v35;
                *(_OWORD *)(v10 + 624) = v36;
              }

              else
              {
                *(void *)(v10 + 640) = 0LL;
                __int128 v34 = 0uLL;
                *(_OWORD *)(v10 + 608) = 0u;
                *(_OWORD *)(v10 + 624) = 0u;
              }

              *(_OWORD *)(v10 + 592) = v34;
              CFRetain(*(CFTypeRef *)(v10 + 560));
              CFRetain(*(CFTypeRef *)(v10 + 568));
              CFIndex v37 = *(const void **)(v10 + 584);
              if (v37) {
                CFRetain(v37);
              }
            }
          }

          CFRelease(v24);
          if (a7) {
            CFRelease(a7);
          }
        }

        else
        {
          uint64_t v10 = 0LL;
        }
      }

      CFRelease(v22);
    }

    else
    {
      return 0LL;
    }
  }

  return v10;
}

void sub_1000E831C(CFTypeRef *a1, __CFDictionary *a2)
{
  CFTypeRef v2 = a1[2];
  if (v2)
  {
    CFRetain(a1[2]);
    CFDictionarySetValue(a2, v2, a1);
    CFRelease(v2);
  }

CFMutableArrayRef sub_1000E8378(CFDictionaryRef *a1)
{
  CFTypeRef v2 = a1[70];
  if (!v2 || !CFDictionaryGetCount(v2)) {
    return 0LL;
  }
  uint64_t v3 = CFGetAllocator(a1);
  CFMutableArrayRef Mutable = CFArrayCreateMutable(v3, 0LL, &kCFTypeArrayCallBacks);
  CFDictionaryApplyFunction(a1[70], (CFDictionaryApplierFunction)sub_1000E8FF0, Mutable);
  return Mutable;
}

const void *sub_1000E83E0(const __CFDictionary *a1, const void *a2)
{
  if (!a1) {
    return 0LL;
  }
  CFBooleanRef Value = CFDictionaryGetValue(a1, a2);
  uint64_t v3 = Value;
  if (Value) {
    CFRetain(Value);
  }
  return v3;
}

__CFArray *sub_1000E841C(const void *a1, CFArrayRef theArray, uint64_t *a3)
{
  if (theArray) {
    CFIndex Count = CFArrayGetCount(theArray);
  }
  else {
    CFIndex Count = 0LL;
  }
  allocator = CFGetAllocator(a1);
  if (a3 && (uint64_t v6 = a3[1]) != 0)
  {
    KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues(v6);
    AmbiguousClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetAmbiguousClassValues(a3[1]);
  }

  else
  {
    AmbiguousClassValues = 0LL;
    KnownClassValues = 0LL;
  }

  if (Count < 1) {
    return 0LL;
  }
  id v9 = 0LL;
  CFMutableArrayRef Mutable = 0LL;
  CFIndex v11 = 0LL;
  CFTypeID v12 = 0LL;
  do
  {
    ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(theArray, v11);
    int v14 = ValueAtIndex;
    CFTypeRef v15 = ValueAtIndex[2];
    if (!v15)
    {
      newValues = 0LL;
      goto LABEL_25;
    }

    CFRetain(ValueAtIndex[2]);
    newValues = 0LL;
    if (!KnownClassValues)
    {
      if (!AmbiguousClassValues) {
        goto LABEL_24;
      }
LABEL_21:
      if (CFDictionaryGetValue(AmbiguousClassValues, v15)) {
        goto LABEL_22;
      }
LABEL_24:
      CFRelease(v15);
LABEL_25:
      if (!Mutable) {
        CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0LL, &kCFTypeArrayCallBacks);
      }
      CFArrayAppendValue(Mutable, v14);
      goto LABEL_28;
    }

    CFBooleanRef Value = CFDictionaryGetValue(KnownClassValues, v15);
    if (Value) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = AmbiguousClassValues == 0LL;
    }
    if (!v17) {
      goto LABEL_21;
    }
    if (!Value) {
      goto LABEL_24;
    }
LABEL_22:
    if (v12)
    {
      newValues = v12;
      CFRelease(v15);
      goto LABEL_28;
    }

    *(void *)&__int128 v30 = a3[1];
    *((void *)&v30 + 1) = sub_1000E8D58;
    CFURLRef v31 = sub_1000E8DE4;
    CFIndex v32 = &_CFRelease;
    CFTypeID v12 = (void *)sub_1000E7F20((uint64_t)allocator, &v30);
    newValues = v12;
    CFRelease(v15);
    if (!v12) {
      goto LABEL_25;
    }
LABEL_28:
    if (!v9) {
      id v9 = CFArrayCreateMutable(allocator, 0LL, &kCFTypeArrayCallBacks);
    }
    if (newValues) {
      BOOL v18 = newValues;
    }
    else {
      BOOL v18 = kCFNull;
    }
    CFArrayAppendValue(v9, v18);
    ++v11;
  }

  while (Count != v11);
  if (v12) {
    CFRelease(v12);
  }
  if (Mutable)
  {
    if (a3) {
      uint64_t v19 = *a3;
    }
    else {
      uint64_t v19 = 0LL;
    }
    CFIndex v20 = sub_1000E8ECC(v19, Mutable);
    if (v20)
    {
      id v21 = v20;
      CFIndex v22 = CFArrayGetCount(v20);
      if (v22 >= 1)
      {
        CFIndex v23 = v22;
        CFIndex v24 = 0LL;
        uint64_t v25 = 1LL;
        do
        {
          if (CFArrayGetValueAtIndex(v9, v25 - 1) == kCFNull)
          {
            newValues = (void *)CFArrayGetValueAtIndex(v21, v24);
            v34.locatioCFIndex n = v25 - 1;
            v34.length = 1LL;
            CFArrayReplaceValues(v9, v34, (const void **)&newValues, 1LL);
            ++v24;
          }

          if (v25 >= Count) {
            break;
          }
          ++v25;
        }

        while (v24 < v23);
      }

      CFIndex v26 = v9;
LABEL_53:
      CFRelease(v21);
    }

    else
    {
      CFIndex v26 = 0LL;
      id v21 = v9;
      if (v9) {
        goto LABEL_53;
      }
    }

    CFRelease(Mutable);
    return v26;
  }

  return v9;
}

uint64_t sub_1000E86FC(uint64_t a1, CFTypeRef *a2, uint64_t a3, void *a4)
{
  CFRange v52 = 0LL;
  CFTypeRef v53 = 0LL;
  CFArrayRef otherArray = 0LL;
  if (!a2) {
    return 1LL;
  }
  uint64_t v5 = 0LL;
  if (!a4) {
    return v5;
  }
  CFTypeRef v7 = *a2;
  if (!*a2) {
    return v5;
  }
  if (!a4[1] || !*a4) {
    return 0LL;
  }
  allocator = CFGetAllocator(*a2);
  KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues(a4[1]);
  SequenceTag = (const void *)VSRecognitionDisambiguationContextGetSequenceTag(a4[1]);
  if (!SequenceTag) {
    return 1LL;
  }
  uint64_t v10 = (const __CFArray *)sub_1000E83E0(*(const __CFDictionary **)(*a4 + 584LL), SequenceTag);
  CFIndex v11 = v10;
  if (!v10 || (Count = CFArrayGetCount(v10), Count < 1) || (CFIndex v13 = Count, VSRecognitionResultGetPhraseCount(v7) < 1))
  {
    CFIndex v37 = 0LL;
    uint64_t v5 = 1LL;
    goto LABEL_53;
  }

  uint64_t v39 = a2;
  CFRange v40 = a4;
  VSRecognitionResultCopyClassIDsAndPhrases(v7, &v52, &otherArray);
  int v14 = 0LL;
  CFIndex v15 = 0LL;
  uint64_t v41 = 0LL;
  CFIndex v42 = v11;
  CFIndex v16 = 0LL;
  CFIndex v43 = v13;
  CFTypeRef v44 = v7;
  unint64_t v48 = KnownClassValues;
  do
  {
    ValueAtIndex = (CFArrayRef *)CFArrayGetValueAtIndex(v11, v16);
    CFIndex v18 = CFArrayGetCount(ValueAtIndex[2]);
    if (v18 >= v15)
    {
      uint64_t v19 = v18;
      CFIndex v46 = v15;
      CFTypeRef cf = v14;
      CFArrayRef theArray = CFArrayCreateMutable(allocator, 0LL, &kCFTypeArrayCallBacks);
      CFMutableArrayRef Mutable = CFArrayCreateMutable(allocator, 0LL, &kCFTypeArrayCallBacks);
      if (v19 >= 1)
      {
        CFIndex v20 = 0LL;
        int v21 = 0;
        do
        {
          CFIndex v22 = CFArrayGetValueAtIndex(ValueAtIndex[2], v20);
          CFIndex v23 = (const void *)*((void *)v22 + 2);
          if (!v23) {
            break;
          }
          CFRetain(*((CFTypeRef *)v22 + 2));
          CFBooleanRef Value = CFDictionaryGetValue(KnownClassValues, v23);
          if (Value) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v21 == 0;
          }
          if (v25)
          {
            PhraseCFIndex Count = VSRecognitionResultGetPhraseCount(v7);
            if (v19 - v20 >= PhraseCount)
            {
              CFIndex v28 = PhraseCount;
              uint64_t v29 = v52;
              if (PhraseCount >= 1)
              {
                CFIndex v30 = 0LL;
                while (1)
                {
                  CFURLRef v31 = CFArrayGetValueAtIndex(ValueAtIndex[2], v20 + v30);
                  CFIndex v32 = (const __CFString *)*((void *)v31 + 2);
                  if (!v32) {
                    break;
                  }
                  CFRetain(*((CFTypeRef *)v31 + 2));
                  CFTypeRef v33 = (const __CFString *)CFArrayGetValueAtIndex(v29, v30);
                  CFComparisonResult v34 = CFStringCompare(v32, v33, 0LL);
                  CFRelease(v32);
                  if (++v30 >= v28 || v34)
                  {
                    if (v34 == kCFCompareEqualTo)
                    {
                      uint64_t v29 = v52;
                      CFIndex v11 = v42;
                      goto LABEL_30;
                    }

                    break;
                  }
                }

                CFRelease(v23);
                CFIndex v11 = v42;
                CFTypeRef v7 = v44;
                KnownClassValues = v48;
                break;
              }

void sub_1000E8B04(const void *a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5)
{
  if (a4)
  {
    if (a3)
    {
      if (a2)
      {
        if (a5)
        {
          CFTypeRef v7 = *(const void **)(a2 + 16);
          if (v7)
          {
            CFRetain(*(CFTypeRef *)(a2 + 16));
            uint64_t v10 = *(const __CFDictionary **)(a5 + 16);
            if (v10 && (CFIndex v11 = (const __CFDictionary *)CFDictionaryGetValue(v10, v7)) != 0LL)
            {
              CFMutableDictionaryRef Mutable = v11;
              CFBooleanRef Value = (__CFSet *)CFDictionaryGetValue(v11, a4);
              if (Value)
              {
LABEL_15:
                CFSetAddValue(Value, a3);
                CFRelease(v7);
                return;
              }
            }

            else
            {
              int v14 = CFGetAllocator(a1);
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( v14,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
              CFIndex v15 = *(__CFDictionary **)(a5 + 16);
              if (!v15)
              {
                CFIndex v16 = CFGetAllocator(a1);
                CFIndex v15 = CFDictionaryCreateMutable( v16,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
                *(void *)(a5 + 16) = v15;
              }

              CFDictionarySetValue(v15, v7, Mutable);
              CFRelease(Mutable);
            }

            BOOL v17 = CFGetAllocator(a1);
            CFBooleanRef Value = CFSetCreateMutable(v17, 0LL, &kCFTypeSetCallBacks);
            CFDictionarySetValue(Mutable, a4, Value);
            CFRelease(Value);
            goto LABEL_15;
          }
        }
      }
    }
  }

uint64_t sub_1000E8C44(const void *a1, uint64_t a2, const void *a3, uint64_t a4)
{
  if (!a4) {
    return 0LL;
  }
  uint64_t MutableArray = 0LL;
  if (a3 && a2 && *(void *)(a4 + 16))
  {
    CFTypeRef v7 = *(const void **)(a2 + 16);
    if (v7)
    {
      CFRetain(*(CFTypeRef *)(a2 + 16));
      CFBooleanRef Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a4 + 16), v7);
      if (Value)
      {
        uint64_t v10 = (const __CFSet *)CFDictionaryGetValue(Value, a3);
        uint64_t MutableArray = (uint64_t)v10;
        if (!v10)
        {
LABEL_12:
          CFRelease(v7);
          return MutableArray;
        }

        if (CFSetGetCount(v10) >= 1)
        {
          CFAllocatorRef v11 = CFGetAllocator(a1);
          uint64_t MutableArray = VSCFSetCreateMutableArray(v11, MutableArray, 0LL, &kCFTypeArrayCallBacks);
          goto LABEL_12;
        }
      }

      uint64_t MutableArray = 0LL;
      goto LABEL_12;
    }

    return 0LL;
  }

  return MutableArray;
}

void sub_1000E8D0C(const void **a1)
{
  if (a1)
  {
    CFTypeRef v2 = *a1;
    if (v2) {
      CFRelease(v2);
    }
    uint64_t v3 = a1[1];
    if (v3) {
      CFRelease(v3);
    }
    __int128 v4 = a1[2];
    if (v4) {
      CFRelease(v4);
    }
    free(a1);
  }

CFIndex sub_1000E8D58(uint64_t a1, uint64_t a2, uint64_t a3, CFIndex Count)
{
  __int128 v4 = *(const void **)(a3 + 16);
  if (!v4) {
    return 0LL;
  }
  CFRetain(*(CFTypeRef *)(a3 + 16));
  if (Count)
  {
    KnownClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetKnownClassValues(Count);
    if (KnownClassValues && CFDictionaryGetValue(KnownClassValues, v4))
    {
      CFIndex Count = 1LL;
    }

    else
    {
      AmbiguousClassValues = (const __CFDictionary *)VSRecognitionDisambiguationContextGetAmbiguousClassValues(Count);
      if (AmbiguousClassValues && (CFBooleanRef Value = (const __CFArray *)CFDictionaryGetValue(AmbiguousClassValues, v4)) != 0LL) {
        CFIndex Count = CFArrayGetCount(Value);
      }
      else {
        CFIndex Count = 0LL;
      }
    }
  }

  CFRelease(v4);
  return Count;
}

uint64_t sub_1000E8DE4( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, CFTypeRef *a7, CFTypeRef *a8)
{
  CFIndex v13 = *(const void **)(a3 + 16);
  if (v13) {
    CFRetain(*(CFTypeRef *)(a3 + 16));
  }
  if (a7) {
    *a7 = 0LL;
  }
  if (a8) {
    *a8 = 0LL;
  }
  if (a6) {
    *a6 = 0LL;
  }
  if (a5 && v13)
  {
    if (!a4
      && (KnownClassCFBooleanRef Value = VSRecognitionDisambiguationContextGetKnownClassValue(a5, v13, a7, a8),
          (_DWORD)KnownClassValue)
      || (KnownClassCFBooleanRef Value = VSRecognitionDisambiguationContextGetAmbiguousClassValueAtIndex(a5, v13, a4, a7, a8),
          (_DWORD)KnownClassValue))
    {
      if (a7 && *a7) {
        CFRetain(*a7);
      }
      if (a8 && *a8) {
        CFRetain(*a8);
      }
    }
  }

  else
  {
    KnownClassCFBooleanRef Value = 0LL;
    if (!v13) {
      return KnownClassValue;
    }
  }

  CFRelease(v13);
  return KnownClassValue;
}

CFArrayRef sub_1000E8ECC(uint64_t a1, CFArrayRef theArray)
{
  CFTypeRef v2 = theArray;
  __int128 context = 0LL;
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (a1 && (uint64_t v5 = *(uint64_t (**)(uint64_t, const __CFArray *, void))(a1 + 592)) != 0LL)
    {
      CFTypeRef v2 = (const __CFArray *)v5(a1, v2, *(void *)(a1 + 656));
      if (!v2) {
        return v2;
      }
    }

    else
    {
      v8.locatioCFIndex n = 0LL;
      v8.length = Count;
      CFArrayApplyFunction(v2, v8, (CFArrayApplierFunction)sub_1000E8F7C, &context);
      CFTypeRef v2 = context;
      if (!context) {
        return v2;
      }
    }

    if (CFArrayGetCount(v2) != Count)
    {
      CFRelease(v2);
      return 0LL;
    }
  }

  return v2;
}

void sub_1000E8F7C(uint64_t a1, __CFArray **a2)
{
  uint64_t v3 = sub_1000E9188(a1);
  __int128 v4 = (const void *)v3;
  if (a2 && v3)
  {
    CFMutableDictionaryRef Mutable = *a2;
    if (*a2
      || (uint64_t v6 = CFGetAllocator(v4),
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(v6, 0LL, &kCFTypeArrayCallBacks),
          (*a2 = Mutable) != 0LL))
    {
      CFArrayAppendValue(Mutable, v4);
    }
  }

  else if (!v3)
  {
    return;
  }

  CFRelease(v4);
}

void sub_1000E8FF0(int a1, _BYTE *a2, CFMutableArrayRef theArray)
{
  if (a2)
  {
    if (a2[41]) {
      CFArrayAppendValue(theArray, a2);
    }
  }

CFDictionaryRef sub_1000E9008(void *cf)
{
  CFTypeRef v2 = (uint64_t (*)(void *, void))cf[79];
  if (!v2 || (CFDictionaryRef result = (CFDictionaryRef)v2(cf, cf[82])) == 0LL)
  {
    __int128 v4 = CFGetAllocator(cf);
    return CFDictionaryCreate(v4, 0LL, 0LL, 0LL, 0LL, 0LL);
  }

  return result;
}

uint64_t sub_1000E9064()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000FA678);
  qword_100102B10 = result;
  return result;
}

void sub_1000E9088(uint64_t a1)
{
  CFTypeRef v2 = *(const void **)(a1 + 16);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *(const void **)(a1 + 48);
  if (v3) {
    CFRelease(v3);
  }
}

BOOL sub_1000E90C4(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000E90D0(uint64_t a1, const void *a2, uint64_t a3, char a4, uint64_t a5, const void *a6, char a7)
{
  if (!a2) {
    return 0LL;
  }
  pthread_once(&stru_1000FD9D0, (void (*)(void))sub_1000E9064);
  uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102B10, 40LL, 0LL);
  uint64_t v15 = Instance;
  if (Instance)
  {
    *(void *)(Instance + 16) = a2;
    CFRetain(a2);
    *(_BYTE *)(v15 + 40) = a4;
    *(void *)(v15 + 24) = a3;
    *(void *)(v15 + 32) = a5;
    *(_BYTE *)(v15 + 41) = a7;
    *(void *)(v15 + 48) = a6;
    if (a6) {
      CFRetain(a6);
    }
  }

  return v15;
}

uint64_t sub_1000E9188(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 41) || !*(void *)(a1 + 48)) {
    return 0LL;
  }
  pthread_once(&stru_1000FD9E0, sub_1000E91E0);
  uint64_t result = qword_100102B18;
  if (qword_100102B18)
  {
    CFRetain((CFTypeRef)qword_100102B18);
    return qword_100102B18;
  }

  return result;
}

void sub_1000E91E0()
{
  if (!qword_100102B18)
  {
    v0[0] = unk_1000FA6D8;
    v0[1] = *(_OWORD *)&off_1000FA6E8;
    qword_100102B18 = sub_1000E7F20((uint64_t)kCFAllocatorDefault, v0);
  }

CFIndex sub_1000E9234(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a3 + 41) && (uint64_t v3 = *(const __CFArray **)(a3 + 48)) != 0LL) {
    return CFArrayGetCount(v3);
  }
  else {
    return 0LL;
  }
}

BOOL sub_1000E9250( uint64_t a1, uint64_t a2, uint64_t a3, CFIndex a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  if (*(_BYTE *)(a3 + 41) && (CFTypeID v12 = *(const __CFArray **)(a3 + 48)) != 0LL && CFArrayGetCount(v12) > a4)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a3 + 48), a4);
    uint64_t v15 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  if (a6) {
    *a6 = 0LL;
  }
  if (a8) {
    *a8 = 0LL;
  }
  if (a7)
  {
    *a7 = v15;
  }

  else if (v15)
  {
    CFRelease(v15);
  }

  return v15 != 0LL;
}

uint64_t sub_1000E92FC()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000FA6F8);
  qword_100102B20 = result;
  return result;
}

void sub_1000E9320(uint64_t a1)
{
  if (a1)
  {
    CFTypeRef v2 = *(const void **)(a1 + 16);
    if (v2) {
      CFRelease(v2);
    }
    uint64_t v3 = *(const void **)(a1 + 24);
    if (v3) {
      CFRelease(v3);
    }
  }

uint64_t sub_1000E9358(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0LL;
  if (a1 && a2)
  {
    uint64_t v5 = *(const void **)(a1 + 16);
    uint64_t v6 = *(const void **)(a2 + 16);
    if (!v5 || !v6) {
      return v5 == v6;
    }
    uint64_t result = CFEqual(v5, v6);
    if (!(_DWORD)result) {
      return result;
    }
    uint64_t v5 = *(const void **)(a1 + 24);
    uint64_t v6 = *(const void **)(a2 + 24);
    if (v5 && v6) {
      return CFEqual(v5, v6);
    }
    else {
      return v5 == v6;
    }
  }

  return result;
}

__CFString *sub_1000E93C0(CFArrayRef *a1)
{
  CFTypeRef v2 = CFGetAllocator(a1);
  CFMutableDictionaryRef Mutable = CFStringCreateMutable(v2, 0LL);
  CFIndex Count = CFArrayGetCount(a1[2]);
  if (Count >= 1)
  {
    CFIndex v5 = Count;
    for (CFIndex i = 0LL; v5 != i; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1[2], i);
      CFRange v8 = (const void *)*((void *)ValueAtIndex + 2);
      if (v8) {
        CFRetain(*((CFTypeRef *)ValueAtIndex + 2));
      }
      if (i) {
        CFStringAppend(Mutable, @" ");
      }
      if (!v8) {
        continue;
      }
      CFStringAppendFormat(Mutable, 0LL, @"<%@>", v8);
      id v9 = a1[3];
      if (v9)
      {
        unsigned int v10 = CFArrayGetValueAtIndex(v9, i);
        if (v10 == 1)
        {
          CFAllocatorRef v11 = @"+";
          goto LABEL_13;
        }

        if (v10 == 2)
        {
          CFAllocatorRef v11 = @"*";
LABEL_13:
          CFStringAppend(Mutable, v11);
        }
      }

      CFRelease(v8);
    }
  }

  return Mutable;
}

uint64_t sub_1000E94DC(const __CFAllocator *a1, const __CFArray *a2, CFArrayRef theArray)
{
  if (!a2) {
    return 0LL;
  }
  if (theArray)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count != CFArrayGetCount(a2)) {
      return 0LL;
    }
  }

  pthread_once(&stru_1000FD9F0, (void (*)(void))sub_1000E92FC);
  uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102B20, 16LL, 0LL);
  if (Instance)
  {
    *(void *)(Instance + 16) = CFArrayCreateCopy(a1, a2);
    if (theArray) {
      CFArrayRef Copy = CFArrayCreateCopy(a1, theArray);
    }
    else {
      CFArrayRef Copy = 0LL;
    }
    *(void *)(Instance + 24) = Copy;
  }

  return Instance;
}

uint64_t sub_1000E9598(const __CFAllocator *a1, uint64_t a2, CFIndex a3, const __CFArray *a4)
{
  if (a3 == -1 || CFArrayGetCount(*(CFArrayRef *)(a2 + 16)) > a3)
  {
    pthread_once(&stru_1000FD9F0, (void (*)(void))sub_1000E92FC);
    uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102B20, 16LL, 0LL);
    if (a3 == -1)
    {
      *(void *)(Instance + 16) = CFArrayCreateCopy(a1, *(CFArrayRef *)(a2 + 16));
      int v14 = *(const __CFArray **)(a2 + 24);
      if (v14) {
        CFArrayRef Copy = CFArrayCreateCopy(a1, v14);
      }
      else {
        CFArrayRef Copy = 0LL;
      }
      goto LABEL_19;
    }

    CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(a1, 0LL, *(CFArrayRef *)(a2 + 16));
    unsigned int v10 = MutableCopy;
    CFAllocatorRef v11 = *(const __CFArray **)(a2 + 24);
    if (v11)
    {
      CFArrayRef Copy = CFArrayCreateMutableCopy(a1, 0LL, v11);
      CFArrayRemoveValueAtIndex(v10, a3);
      if (Copy)
      {
        CFArrayRemoveValueAtIndex(Copy, a3);
        char v13 = 0;
        if (!a4) {
          goto LABEL_18;
        }
        goto LABEL_13;
      }
    }

    else
    {
      CFArrayRemoveValueAtIndex(MutableCopy, a3);
      CFArrayRef Copy = 0LL;
    }

    char v13 = 1;
    if (!a4)
    {
LABEL_18:
      *(void *)(Instance + 16) = v10;
LABEL_19:
      *(void *)(Instance + 24) = Copy;
      return Instance;
    }

const void *sub_1000E9724(uint64_t a1, CFIndex idx, _DWORD *a3)
{
  if (a3)
  {
    uint64_t v6 = *(const __CFArray **)(a1 + 24);
    if (v6) {
      LODWORD(v6) = CFArrayGetValueAtIndex(v6, idx);
    }
    *a3 = (_DWORD)v6;
  }

  return CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 16), idx);
}

uint64_t sub_1000E9770(unsigned int a1)
{
  CFMutableDictionaryRef Mutable = (__CFDictionary *)qword_100102B28;
  if (qword_100102B28
    || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, 0LL),
        (qword_100102B28 = (uint64_t)Mutable) != 0))
  {
    CFDictionarySetValue(Mutable, (const void *)a1, sub_1000D93D0);
  }

  return pthread_mutex_unlock(&stru_1000FDA00);
}

uint64_t sub_1000E97E0(int a1, uint64_t a2)
{
  if (!qword_100102B28)
  {
    pthread_mutex_unlock(&stru_1000FDA00);
    return 4294963295LL;
  }

  CFBooleanRef Value = (uint64_t (*)(uint64_t))CFDictionaryGetValue((CFDictionaryRef)qword_100102B28, (const void *)a1);
  pthread_mutex_unlock(&stru_1000FDA00);
  if (!Value) {
    return 4294963295LL;
  }
  uint64_t result = Value(a2);
  if (!(_DWORD)result)
  {
    uint64_t v6 = VSPreferencesCopySpokenLanguageIdentifier();
    uint64_t result = 0LL;
    *(void *)(a2 + 32) = v6;
  }

  return result;
}

uint64_t sub_1000E9864()
{
  uint64_t result = _CFRuntimeRegisterClass(&unk_1000FA888);
  qword_100102B30 = result;
  return result;
}

uint64_t sub_1000E9888(uint64_t a1)
{
  CFTypeRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  if (*(void *)(a1 + 80)) {
    CPRecordStoreDestroy();
  }
  return pthread_mutex_destroy(v2);
}

BOOL sub_1000E98C0(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_1000E98CC()
{
  return 0LL;
}

uint64_t sub_1000E98D4(const __CFAllocator *a1, const __CFURL *a2)
{
  uint64_t v3 = CFURLCreateCopyAppendingPathComponent(a1, a2, @"Manifest.sqlitedb", 0);
  if (v3)
  {
    __int128 v4 = v3;
    CFStringRef v5 = CFURLCopyFileSystemPath(v3, kCFURLPOSIXPathStyle);
    if (!v5)
    {
      uint64_t v11 = 0LL;
LABEL_12:
      CFRelease(v4);
      return v11;
    }

    CFStringRef v6 = v5;
    uint64_t v7 = CPRecordStoreCreateWithPath();
    if (v7)
    {
      uint64_t v8 = v7;
      CPRecordStoreSetSetupHandler(v7, sub_1000E99C4);
      uint64_t Database = CPRecordStoreGetDatabase(v8);
      if (Database)
      {
        CPSqliteDatabaseSetVersion(Database, 1LL);
        pthread_once(&stru_1000FDA40, (void (*)(void))sub_1000E9864);
        uint64_t Instance = _CFRuntimeCreateInstance(a1, qword_100102B30, 72LL, 0LL);
        if (Instance)
        {
          uint64_t v11 = Instance;
          pthread_mutex_init((pthread_mutex_t *)(Instance + 16), 0LL);
          *(void *)(v11 + 80) = v8;
LABEL_11:
          CFRelease(v6);
          goto LABEL_12;
        }
      }

      CPRecordStoreDestroy(v8);
    }

    uint64_t v11 = 0LL;
    goto LABEL_11;
  }

  return 0LL;
}

uint64_t sub_1000E99C4(uint64_t a1, uint64_t a2)
{
  return CPSqliteConnectionPerformSQL( a2,  @"CREATE INDEX ValueTranslationModelIdClassIdIndex on ValueTranslation(model_id, class_id, translated_value);");
}

uint64_t sub_1000E9A1C(uint64_t a1)
{
  CFTypeRef v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3)
  {
    CPRecordStoreSave(v3, 0LL);
    CPRecordStoreInvalidateCaches(*(void *)(a1 + 80));
  }

  return pthread_mutex_unlock(v2);
}

uint64_t sub_1000E9A60(uint64_t a1, __CFDictionary **a2)
{
  __int128 v4 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (!a2) {
    return 0LL;
  }
  if (!v4) {
    return 0LL;
  }
  CFStringRef v5 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v4, 0x8000100u);
  if (!v5) {
    return 0LL;
  }
  CFStringRef v6 = v5;
  unsigned int v7 = sqlite3_column_bytes(*(sqlite3_stmt **)(a1 + 8), 1);
  uint64_t v8 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(a1 + 8), 1);
  if (!v7) {
    goto LABEL_12;
  }
  if (!v8) {
    goto LABEL_12;
  }
  CFDataRef v9 = CFDataCreateWithBytesNoCopy(kCFAllocatorDefault, v8, v7, kCFAllocatorNull);
  if (!v9) {
    goto LABEL_12;
  }
  CFDataRef v10 = v9;
  uint64_t v11 = VSCFPropertyListCreateFromBinaryXMLData(kCFAllocatorDefault, v9);
  if (!v11)
  {
LABEL_11:
    CFRelease(v10);
LABEL_12:
    CFDictionaryRef v12 = CFDictionaryCreate(kCFAllocatorDefault, 0LL, 0LL, 0LL, 0LL, 0LL);
    goto LABEL_13;
  }

  CFDictionaryRef v12 = (CFDictionaryRef)v11;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v12))
  {
    CFRelease(v12);
    goto LABEL_11;
  }

  CFRelease(v10);
LABEL_13:
  CFMutableDictionaryRef Mutable = *a2;
  if (!*a2)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable( kCFAllocatorDefault,  0LL,  &kCFTypeDictionaryKeyCallBacks,  &kCFTypeDictionaryValueCallBacks);
    *a2 = Mutable;
  }

  CFDictionarySetValue(Mutable, v6, v12);
  CFRelease(v12);
  CFRelease(v6);
  return 0LL;
}

void sub_1000E9BC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    uint64_t v6 = *(void *)CPRecordGetPropertyDescriptor();
    Class = (void *)CPRecordGetClass(a1);
    CFStringRef v8 = CFStringCreateWithFormat(kCFAllocatorDefault, 0LL, @"SELECT %s FROM %s WHERE ROWID = ?", v6, *Class);
    uint64_t v9 = CPSqliteConnectionStatementForSQL(a3, v8);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(sqlite3_stmt **)(v9 + 8);
      int ID = CPRecordGetID(a1);
      sqlite3_bind_int(v11, 1, ID);
      if (sqlite3_step(*(sqlite3_stmt **)(v10 + 8)) == 100)
      {
        unsigned int v13 = sqlite3_column_bytes(*(sqlite3_stmt **)(v10 + 8), 0);
        int v14 = (const UInt8 *)sqlite3_column_blob(*(sqlite3_stmt **)(v10 + 8), 0);
        if (v13) {
          BOOL v15 = v14 == 0LL;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          CPRecordInitializeProperty(a1, a2, 0LL);
        }

        else
        {
          CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, v14, v13);
          CPRecordInitializeProperty(a1, a2, v16);
          if (v16) {
            CFRelease(v16);
          }
        }
      }

      CPSqliteStatementReset(v10);
    }

    if (v8) {
      CFRelease(v8);
    }
  }

void sub_1000E9D14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)CPRecordGetClass(a1);
  PropertyDescriptor = (void *)CPRecordGetPropertyDescriptor(a1, a2);
  CFStringRef v8 = CFStringCreateWithFormat( kCFAllocatorDefault,  0LL,  @"UPDATE %s SET %s = ? WHERE ROWID = ?",  v6,  *PropertyDescriptor);
  uint64_t v9 = CPSqliteConnectionStatementForSQL(a3, v8);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t Property = (const __CFData *)CPRecordGetProperty(a1, a2);
    if (Property && (CFDictionaryRef v12 = Property, Length = CFDataGetLength(Property), Length >= 1))
    {
      int v14 = Length;
      BytePtr = CFDataGetBytePtr(v12);
      sqlite3_bind_blob(*(sqlite3_stmt **)(v10 + 8), 1, BytePtr, v14, 0LL);
    }

    else
    {
      sqlite3_bind_null(*(sqlite3_stmt **)(v10 + 8), 1);
    }

    CFDataRef v16 = *(sqlite3_stmt **)(v10 + 8);
    int ID = CPRecordGetID(a1);
    sqlite3_bind_int(v16, 2, ID);
    CPSqliteStatementPerform(v10);
    CPSqliteStatementReset(v10);
  }

  if (v8) {
    CFRelease(v8);
  }
}

void sub_1000E9E44( uint64_t a1, uint64_t a2, uint64_t a3, CFStringRef theString, const __CFString *a5, const __CFString *a6, const __CFString *a7)
{
  CFIndex Length = CFStringGetLength(theString);
  CFIndex MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u);
  CFIndex v14 = MaximumSizeForEncoding;
  usedBufLen[0] = MaximumSizeForEncoding;
  if (MaximumSizeForEncoding < 256) {
    BOOL v15 = v35;
  }
  else {
    BOOL v15 = (UInt8 *)malloc(MaximumSizeForEncoding + 1);
  }
  v36.locatioCFIndex n = 0LL;
  v36.length = Length;
  CFStringGetBytes(theString, v36, 0x8000100u, 0, 0, v15, v14, usedBufLen);
  v15[usedBufLen[0]] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 1, (const char *)v15, -1, 0LL);
  CFIndex v16 = CFStringGetLength(a5);
  CFIndex v17 = CFStringGetMaximumSizeForEncoding(v16, 0x8000100u);
  CFIndex v18 = v17;
  v33[0] = v17;
  if (v17 < 256) {
    uint64_t v19 = (UInt8 *)usedBufLen;
  }
  else {
    uint64_t v19 = (UInt8 *)malloc(v17 + 1);
  }
  v37.locatioCFIndex n = 0LL;
  v37.length = v16;
  CFStringGetBytes(a5, v37, 0x8000100u, 0, 0, v19, v18, v33);
  v19[v33[0]] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 2, (const char *)v19, -1, 0LL);
  if (a6)
  {
    CFIndex v20 = CFStringGetLength(a6);
    CFIndex v21 = CFStringGetMaximumSizeForEncoding(v20, 0x8000100u);
    CFIndex v22 = v21;
    v32[0] = v21;
    if (v21 < 256) {
      CFIndex v23 = (UInt8 *)v33;
    }
    else {
      CFIndex v23 = (UInt8 *)malloc(v21 + 1);
    }
    v38.locatioCFIndex n = 0LL;
    v38.length = v20;
    CFStringGetBytes(a6, v38, 0x8000100u, 0, 0, v23, v22, v32);
    v23[v32[0]] = 0;
    sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), 3, (const char *)v23, -1, 0LL);
    int v24 = 4;
  }

  else
  {
    CFIndex v23 = 0LL;
    int v24 = 3;
  }

  CFIndex v25 = CFStringGetLength(a7);
  uint64_t v26 = CFStringGetMaximumSizeForEncoding(v25, 0x8000100u);
  CFIndex v27 = v26;
  CFIndex v31 = v26;
  if (v26 < 256) {
    CFIndex v28 = (UInt8 *)v32;
  }
  else {
    CFIndex v28 = (UInt8 *)malloc(v26 + 1);
  }
  v39.locatioCFIndex n = 0LL;
  v39.length = v25;
  CFStringGetBytes(a7, v39, 0x8000100u, 0, 0, v28, v27, &v31);
  v28[v31] = 0;
  sqlite3_bind_text(*(sqlite3_stmt **)(a1 + 8), v24, (const char *)v28, -1, 0LL);
  if (a2) {
    CPSqliteStatementSendResults(a1, a2, a3);
  }
  else {
    CPSqliteStatementPerform(a1);
  }
  CPSqliteStatementReset(a1);
  if (v15 != v35) {
    free(v15);
  }
  if (v19 != (UInt8 *)usedBufLen) {
    free(v19);
  }
  if (a6 && v23 && v23 != (UInt8 *)v33) {
    free(v23);
  }
  if (v28 != (UInt8 *)v32) {
    free(v28);
  }
}

uint64_t sub_1000EA190(uint64_t a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  uint64_t result = 0LL;
  uint64_t v11 = 0LL;
  if (a2 && a3 && a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
    uint64_t Database = CPRecordStoreGetDatabase(*(void *)(a1 + 80));
    if (Database)
    {
      uint64_t v10 = CPSqliteDatabaseStatementForWriting( Database,  @"SELECT original_value FROM ValueTranslation WHERE model_id = ? AND class_id = ? AND translated_value = ?;");
      if (v10) {
        sub_1000E9E44(v10, (uint64_t)sub_1000EA238, (uint64_t)&v11, a2, a3, 0LL, a4);
      }
    }

    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 16));
    return v11;
  }

  return result;
}

uint64_t sub_1000EA238(uint64_t a1, __CFArray **a2)
{
  uint64_t v3 = sqlite3_column_text(*(sqlite3_stmt **)(a1 + 8), 0);
  if (v3)
  {
    CFStringRef v4 = CFStringCreateWithCString(kCFAllocatorDefault, (const char *)v3, 0x8000100u);
    if (v4)
    {
      CFStringRef v5 = v4;
      if (a2)
      {
        CFMutableDictionaryRef Mutable = *a2;
        if (!*a2)
        {
          CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0LL, &kCFTypeArrayCallBacks);
          *a2 = Mutable;
        }

        CFArrayAppendValue(Mutable, v5);
      }

      CFRelease(v5);
    }
  }

  return 0LL;
}

CFTypeRef *sub_1000EA2CC(const __CFAllocator *a1, uint64_t a2)
{
  if (!a2) {
    return 0LL;
  }
  uint64_t v3 = (CFTypeRef *)CFAllocatorAllocate(a1, 72LL, 0LL);
  CFStringRef v4 = v3;
  if (v3)
  {
    *(_OWORD *)uint64_t v3 = *(_OWORD *)a2;
    __int128 v5 = *(_OWORD *)(a2 + 16);
    __int128 v6 = *(_OWORD *)(a2 + 32);
    __int128 v7 = *(_OWORD *)(a2 + 48);
    v3[8] = *(CFTypeRef *)(a2 + 64);
    *((_OWORD *)v3 + 2) = v6;
    *((_OWORD *)v3 + 3) = v7;
    *((_OWORD *)v3 + 1) = v5;
    if (*(_DWORD *)a2 == 1)
    {
      if (*(void *)(a2 + 8)) {
        CFRetain(v3[1]);
      }
      if (*(void *)(a2 + 16))
      {
        CFStringRef v8 = v4 + 2;
        goto LABEL_18;
      }
    }

    else if (!*(_DWORD *)a2)
    {
      if (*(void *)(a2 + 16)) {
        CFRetain(v3[2]);
      }
      if (*(void *)(a2 + 24)) {
        CFRetain(v4[3]);
      }
      if (*(void *)(a2 + 32)) {
        CFRetain(v4[4]);
      }
      if (*(void *)(a2 + 40))
      {
        CFStringRef v8 = v4 + 5;
LABEL_18:
        CFRetain(*v8);
      }
    }
  }

  return v4;
}

void sub_1000EA3A0(int a1)
{
  if (qword_100102B38)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100102B38);
    if (Count >= 1)
    {
      unint64_t v3 = Count + 1;
      do
      {
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)qword_100102B38, v3 - 2);
        if (*ValueAtIndex == a1)
        {
          __int128 v5 = ValueAtIndex;
          CFArrayRemoveValueAtIndex((CFMutableArrayRef)qword_100102B38, v3 - 2);
          sub_1000EA438(kCFAllocatorDefault, v5);
        }

        --v3;
      }

      while (v3 > 1);
    }
  }

void sub_1000EA438(CFAllocatorRef allocator, void *ptr)
{
  if (ptr)
  {
    if (*(_DWORD *)ptr == 1)
    {
      uint64_t v9 = (const void *)ptr[1];
      if (v9) {
        CFRelease(v9);
      }
      CFStringRef v8 = (const void *)ptr[2];
      if (!v8) {
        goto LABEL_19;
      }
    }

    else
    {
      if (*(_DWORD *)ptr) {
        goto LABEL_19;
      }
      mach_port_name_t v4 = *((_DWORD *)ptr + 2);
      if (v4 + 1 >= 2) {
        mach_port_deallocate(mach_task_self_, v4);
      }
      __int128 v5 = (const void *)ptr[2];
      if (v5) {
        CFRelease(v5);
      }
      __int128 v6 = (const void *)ptr[3];
      if (v6) {
        CFRelease(v6);
      }
      __int128 v7 = (const void *)ptr[4];
      if (v7) {
        CFRelease(v7);
      }
      CFStringRef v8 = (const void *)ptr[5];
      if (!v8) {
        goto LABEL_19;
      }
    }

    CFRelease(v8);
LABEL_19:
    CFAllocatorDeallocate(allocator, ptr);
  }

_DWORD *sub_1000EA4E0()
{
  uint64_t result = (_DWORD *)qword_100102B38;
  if (qword_100102B38)
  {
    CFIndex Count = CFArrayGetCount((CFArrayRef)qword_100102B38);
    if (Count < 1)
    {
      return 0LL;
    }

    else
    {
      CFIndex v2 = Count;
      uint64_t v3 = 1LL;
      do
      {
        uint64_t result = CFArrayGetValueAtIndex((CFArrayRef)qword_100102B38, v3 - 1);
        if (*result) {
          uint64_t result = 0LL;
        }
        if (v3 >= v2) {
          break;
        }
        ++v3;
      }

      while (!result);
    }
  }

  return result;
}

void sub_1000EB028(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned __int8 *)(v1 + 56) != v2)
  {
    *(_BYTE *)(v1 + 56) = v2;
    if (*(void *)(*(void *)(a1 + 32) + 40LL) == 2LL)
    {
      mach_port_name_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      unint64_t v5 = (unint64_t)[v4 categoryOptions];
      if (((v5 & 4) == 0) == (*(_BYTE *)(*(void *)(a1 + 32) + 56LL) != 0))
      {
        uint64_t v6 = v5 ^ 4;
        __int128 v7 = (void *)objc_claimAutoreleasedReturnValue([v4 category]);
        id v15 = 0LL;
        [v4 setCategory:v7 withOptions:v6 error:&v15];
        id v8 = v15;

        uint64_t v10 = VSGetLogDefault(v9);
        uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
        CFDictionaryRef v12 = v11;
        if (v8)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            unsigned int v13 = (const char *)[v8 code];
            *(_DWORD *)CFRunLoopSourceContext buf = 134217984;
            CFIndex v17 = v13;
            _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "#AudioSession error %ld setting bluetooth allowability\n",  buf,  0xCu);
          }
        }

        else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          if (*(_BYTE *)(*(void *)(a1 + 32) + 56LL)) {
            CFIndex v14 = "en";
          }
          else {
            CFIndex v14 = "dis";
          }
          *(_DWORD *)CFRunLoopSourceContext buf = 136315138;
          CFIndex v17 = v14;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "#AudioSession : Bluetooth %sabled\n",  buf,  0xCu);
        }
      }
    }
  }

void *sub_1000EB1E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _nextActivityForActive:*(unsigned __int8 *)(a1 + 48) activity:*(void *)(a1 + 40) serverActivity:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t result = *(void **)(a1 + 32);
  if (v2 != (id)result[6])
  {
    if (v2)
    {
      [result _setCategoryForActivity:v2];
      mach_port_name_t v4 = *(void **)(a1 + 32);
      if (v4[6]) {
        goto LABEL_12;
      }
      [v4 _setupAudioSession];
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      id v18 = 0LL;
      [v5 setActive:1 error:&v18];
      id v6 = v18;

      uint64_t v8 = VSGetLogDefault(v7);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        uint64_t v10 = "#AudioSession : Active --> TRUE\n";
LABEL_16:
        _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, v10, buf, 2u);
      }
    }

    else
    {
      sub_1000EB3EC();
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
      id v19 = 0LL;
      [v11 setActive:0 error:&v19];
      id v6 = v19;

      uint64_t v13 = VSGetLogDefault(v12);
      uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        uint64_t v10 = "#AudioSession : Active --> FALSE\n";
        goto LABEL_16;
      }
    }

    if (v6)
    {
      uint64_t v15 = VSGetLogDefault(v14);
      CFIndex v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = [v6 code];
        *(_DWORD *)CFRunLoopSourceContext buf = 134218240;
        id v21 = v17;
        __int16 v22 = 2048;
        id v23 = v2;
        _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "#AudioSession error %ld activating or deactivating session for activity %ld\n",  buf,  0x16u);
      }

      goto LABEL_13;
    }

    mach_port_name_t v4 = *(void **)(a1 + 32);
LABEL_12:
    v4[6] = v2;
LABEL_13:
    uint64_t result = *(void **)(a1 + 32);
  }

  result[4] = v2;
  return result;
}

uint64_t sub_1000EB3EC()
{
  if (qword_100102B50) {
    CFSetApplyFunction((CFSetRef)qword_100102B50, (CFSetApplierFunction)sub_1000EB42C, 0LL);
  }
  return pthread_mutex_unlock(&stru_1000FDA50);
}

void sub_1000EB42C(OpaqueAudioQueue *a1)
{
  uint64_t v1 = AudioQueueStop(a1, 1u);
  if ((_DWORD)v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = VSGetLogDefault(v1);
    mach_port_name_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString vs_stringFrom4CC:](&OBJC_CLASS___NSString, "vs_stringFrom4CC:", v2));
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_error_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_ERROR,  "#AudioSession could not stop queue (%@)\n",  (uint8_t *)&v6,  0xCu);
    }
  }

id sub_1000EB4F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setCategoryForActivity:*(void *)(a1 + 40)];
}

uint64_t sub_1000EB504(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL) = *(void *)(*(void *)(result + 32) + 72LL);
  return result;
}

id sub_1000EB518(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setupAudioSession];
}

id sub_1000EB520(uint64_t a1)
{
  uint64_t v2 = VSGetLogDefault(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)int v6 = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "#AudioSession mediaserverd died\n", v6, 2u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  *(void *)(v4 + 40) = 0LL;
  *(void *)(v4 + 48) = 0LL;
  *(_BYTE *)(*(void *)(a1 + 32) + 16LL) = 0;
  id result = [*(id *)(a1 + 32) _setupAudioSession];
  ++*(void *)(*(void *)(a1 + 32) + 72LL);
  return result;
}

uint64_t sub_1000EB5B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(void *)(v1 + 40) = 0LL;
  *(void *)(v1 + 48) = 0LL;
  uint64_t v2 = VSGetLogDefault(a1);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)unint64_t v5 = 0;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "#AudioSession session interrupted\n",  v5,  2u);
  }

  return sub_1000EB3EC();
}

void sub_1000EB67C(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___VSAudioSession);
  uint64_t v2 = (void *)qword_100102B40;
  qword_100102B40 = (uint64_t)v1;
}

id sub_1000EB6A4()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[VSAudioSession sharedInstance](&OBJC_CLASS___VSAudioSession, "sharedInstance"));
  id v1 = [v0 _safeServerGeneration];

  return v1;
}

void sub_1000EB6E0(int a1, uint64_t a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(+[VSAudioSession sharedInstance](&OBJC_CLASS___VSAudioSession, "sharedInstance"));
  [v4 _safeSetActive:a1 != 0 withActivity:a2];
}

void sub_1000EB730(int a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[VSAudioSession sharedInstance](&OBJC_CLASS___VSAudioSession, "sharedInstance"));
  [v2 _safeSetBluetoothInputAllowed:a1 != 0];
}

float sub_1000EB778()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue(+[AVAudioSession sharedInstance](&OBJC_CLASS___AVAudioSession, "sharedInstance"));
  [v0 outputLatency];
  double v2 = v1;
  [v0 inputLatency];
  double v4 = v3;
  [v0 IOBufferDuration];
  double v6 = v5;
  uint64_t v7 = (void *)VSPreferencesCopyValueForKey(@"LatencyFudgeFactor");
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___NSNumber);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0) {
    [v7 doubleValue];
  }
  else {
    double v9 = 0.05;
  }
  float v10 = v2 + 0.0 + v4 + v6 * 2.0 + v9;

  return v10;
}

void sub_1000EB83C()
{
  uint64_t v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v0)
  {
    double v1 = v0;
    CFBooleanRef Value = CFDictionaryGetValue(v0, _kCFSystemVersionBuildVersionKey);
    qword_100102B58 = (uint64_t)Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v1);
  }

uint64_t sub_1000EB890(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v7 = *a3;
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 16));
  int v36 = 0;
  CFStringRef theString1 = 0LL;
  CFIndex v30 = a3;
  CFIndex v31 = Count;
  if (Count < 1)
  {
    uint64_t v10 = 1LL;
    goto LABEL_51;
  }

  CFIndex v9 = 0LL;
  LOBYTE(v10) = 1;
  while (v7 < a4 && (_BYTE)v10)
  {
    uint64_t v11 = (unsigned __int8 *)sub_1000E9724(a1, v9, &v36);
    int v12 = v11[41];
    CFIndex v33 = v9;
    if (v11[41])
    {
      uint64_t v13 = (const __CFString *)*((void *)v11 + 2);
      if (v13) {
        CFRetain(*((CFTypeRef *)v11 + 2));
      }
      uint64_t v14 = 0LL;
    }

    else
    {
      uint64_t v14 = (const void *)*((void *)v11 + 6);
      CFRetain(v14);
      if (v14)
      {
        CFIndex v15 = CFArrayGetCount((CFArrayRef)v14);
        uint64_t v13 = 0LL;
        goto LABEL_12;
      }

      uint64_t v13 = 0LL;
    }

    CFIndex v15 = 0LL;
LABEL_12:
    int v16 = 0;
    while (v12)
    {
      VSRecognitionResultGetPhraseAtIndex(a2, v7, &theString1, 0LL);
      CFComparisonResult v17 = CFStringCompare(theString1, v13, 0LL);
      BOOL v18 = v17 == kCFCompareEqualTo;
      if (v17) {
        goto LABEL_34;
      }
      ++v7;
LABEL_25:
      int v24 = v36;
      int v16 = 1;
      BOOL v26 = !v18 || v7 >= a4 || v36 == 0;
      if (v26)
      {
        CFIndex v27 = v33;
        goto LABEL_35;
      }
    }

    if (v15 >= 1)
    {
      uint64_t v19 = 0LL;
      for (CFIndex i = 0LL; i != v15; ++i)
      {
        uint64_t v34 = v7;
        ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v14, i);
        int v22 = sub_1000EB890(ValueAtIndex, a2, &v34, a4);
        uint64_t v23 = v34 - v7;
        if (v34 - v7 <= v19) {
          uint64_t v23 = v19;
        }
        if (v22) {
          uint64_t v19 = v23;
        }
      }

      if (v19)
      {
        v7 += v19;
        BOOL v18 = 1;
        goto LABEL_25;
      }
    }

void sub_1000EBA9C(id a1, OS_xpc_object *a2)
{
  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    double v3 = string;
    uint64_t v4 = VSGetLogDefault(string);
    double v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136315138;
      CFIndex v27 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Receive notification %s",  (uint8_t *)&v26,  0xCu);
    }

    id v6 = [[VSDownloadService alloc] initWithType:2];
    if (qword_100102B60)
    {
      [(id)qword_100102B60 timeIntervalSinceNow];
      BOOL v8 = v7 >= -300.0;
    }

    else
    {
      BOOL v8 = 0;
    }

    if (!strcmp("com.apple.MobileAsset.VoiceServicesVocalizerVoice.ma.cached-metadata-updated", v3) && !v8)
    {
      [v6 updateVoicesAndVoiceResources];
      uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
      uint64_t v10 = (void *)qword_100102B60;
      qword_100102B60 = v9;
    }

    if (!strcmp("com.apple.MobileAsset.VoiceServices.GryphonVoice.ma.new-asset-installed", v3)
      || !strcmp("com.apple.MobileAsset.VoiceServicesVocalizerVoice.ma.new-asset-installed", v3))
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
      [v11 resetCache];

      notify_post((const char *)[@"com.apple.voiceservices.notification.voice-update" UTF8String]);
    }

    if (!strcmp("com.apple.MobileAsset.VoiceServices.VoiceResources.ma.new-asset-installed", v3))
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
      [v13 resetResourcesCache];

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
      [v14 resetCache];

      double Current = CFAbsoluteTimeGetCurrent();
      int v16 = (void *)VSPreferencesCopyValueForKey(@"LastAttemptedDownloadTimeForNewResource");
      [v16 doubleValue];
      double v18 = v17;

      double v12 = Current - v18;
      if (Current - v18 > 43200.0)
      {
        uint64_t v19 = VSPreferencesSetValueForKey( @"LastAttemptedDownloadTimeForNewResource",  +[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", Current));
        uint64_t v20 = VSGetLogDefault(v19);
        id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v26) = 0;
          _os_log_debug_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEBUG,  "com.apple.MobileAsset.VoiceServices.VoiceResources.ma.new-asset-installed: checking for a voice update",  (uint8_t *)&v26,  2u);
        }

        [v6 updateVoicesAndVoiceResources];
      }
    }

    uint64_t v22 = strcmp( (const char *)objc_msgSend(@"com.apple.voiceservices.trigger.asset-force-update", "UTF8String", v12),  v3);
    if (!(_DWORD)v22)
    {
      uint64_t v23 = VSGetLogDefault(v22);
      int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v26) = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEBUG,  "Perform force asset update",  (uint8_t *)&v26,  2u);
      }

      id v25 = [[VSDownloadService alloc] initWithType:3];
      [v25 updateVoicesAndVoiceResources];
      id v6 = v25;
    }
  }

id sub_1000EBFB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_1000EC1D4(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 16) count])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    double v3 = *(void **)(v2 + 16);
    *(void *)(v2 + 16) = 0LL;
  }

id sub_1000EC224(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  if (!v2)
  {
    double v3 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v3;

    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 16LL);
  }

  return [v2 addObject:*(void *)(a1 + 40)];
}

id sub_1000EC274(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = result != 0LL;
  return result;
}

id sub_1000EC988(uint64_t a1)
{
  uint64_t v2 = VSGetLogDefault(a1);
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) connectionIdentifier]);
    int v6 = 138543362;
    double v7 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "XPC connection invalidated, identifier: %{public}@",  (uint8_t *)&v6,  0xCu);
  }

  return objc_msgSend( *(id *)(a1 + 40),  "setConnectionCount:",  (char *)objc_msgSend(*(id *)(a1 + 40), "connectionCount") - 1);
}

void sub_1000ECA70(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    uint64_t v6 = ((uint64_t (*)(void))VSGetLogEvent)();
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)CFRunLoopSourceContext buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "running com.apple.voiced.neural-compiling",  buf,  2u);
    }

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( [v8 installedAssetsForType:4 voicename:0 language:0 gender:0 footprint:0]);

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[VSSpeechInternalSettings standardInstance]( &OBJC_CLASS___VSSpeechInternalSettings,  "standardInstance"));
    unsigned int v11 = [v10 enableLocalVoices];

    if (v11)
    {
      double v12 = (void *)objc_claimAutoreleasedReturnValue(+[VSMobileAssetsManager sharedManager](&OBJC_CLASS___VSMobileAssetsManager, "sharedManager"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 installedLocalVoices]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue([v9 arrayByAddingObjectsFromArray:v13]);

      uint64_t v9 = (void *)v14;
    }

    __int128 v43 = 0u;
    __int128 v44 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    xpc_object_t v15 = v9;
    id v16 = [v15 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v16)
    {
      id v18 = v16;
      uint64_t v19 = *(void *)v42;
      *(void *)&__int128 v17 = 138412290LL;
      __int128 v40 = v17;
      while (2)
      {
        for (CFIndex i = 0LL; i != v18; CFIndex i = (char *)i + 1)
        {
          if (*(void *)v42 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(void **)(*((void *)&v41 + 1) + 8LL * (void)i);
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "voicePath", v40, (void)v41));
          id v23 = +[VSNeuralTTSUtils isANEModelCompiled:](&OBJC_CLASS___VSNeuralTTSUtils, "isANEModelCompiled:", v22);
          if ((_DWORD)v23)
          {
            uint64_t v24 = VSGetLogEvent(v23);
            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v40;
              xpc_activity_state_t v46 = (xpc_activity_state_t)v22;
              _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Neural voice is already compiled: '%@'",  buf,  0xCu);
            }
          }

          else
          {
            BOOL should_defer = xpc_activity_should_defer(v2);
            if (should_defer)
            {
              uint64_t v35 = VSGetLogDefault(should_defer);
              int v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)CFRunLoopSourceContext buf = 0;
                _os_log_error_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_ERROR,  "com.apple.voiced.neural-compiling is requested to be deferred.",  buf,  2u);
              }

              BOOL v37 = xpc_activity_set_state(v2, 3LL);
              if (v37)
              {
                uint64_t v38 = VSGetLogDefault(v37);
                CFRange v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                {
                  *(_WORD *)CFRunLoopSourceContext buf = 0;
                  _os_log_error_impl( (void *)&_mh_execute_header,  v39,  OS_LOG_TYPE_ERROR,  "Unable to set defer state for com.apple.voiced.neural-compiling",  buf,  2u);
                }
              }

              goto LABEL_41;
            }

            uint64_t v27 = ((uint64_t (*)(void))VSGetLogEvent)();
            BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v40;
              xpc_activity_state_t v46 = (xpc_activity_state_t)v22;
              _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "Triggered compiling neural voice '%@'",  buf,  0xCu);
            }

            uint64_t v29 = VSGetLogEvent(+[VSNeuralTTSUtils compileANEModel:](&OBJC_CLASS___VSNeuralTTSUtils, "compileANEModel:", v22));
            CFIndex v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)CFRunLoopSourceContext buf = v40;
              xpc_activity_state_t v46 = (xpc_activity_state_t)v22;
              _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Neural voice finished compiling '%@'",  buf,  0xCu);
            }

            id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[VSPrewarmService sharedService](&OBJC_CLASS___VSPrewarmService, "sharedService"));
            -[os_log_s unloadCachedEngineWithVoice:](v25, "unloadCachedEngineWithVoice:", v21);
          }
        }

        id v18 = [v15 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }

    BOOL v31 = xpc_activity_set_state(v2, 5LL);
    if (!v31)
    {
      uint64_t v32 = VSGetLogDefault(v31);
      CFIndex v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v33,  OS_LOG_TYPE_ERROR,  "xpc activity com.apple.voiced.neuralCompiling, failed to set state to done.",  buf,  2u);
      }
    }

    goto LABEL_41;
  }

  xpc_activity_state_t v4 = state;
  if (state)
  {
    uint64_t v34 = VSGetLogDefault(state);
    xpc_object_t v15 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)CFRunLoopSourceContext buf = 134217984;
      xpc_activity_state_t v46 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v15,  OS_LOG_TYPE_ERROR,  "Unexpected xpc_activity state, got: %ld",  buf,  0xCu);
    }

    goto LABEL_41;
  }

  xpc_object_t v5 = xpc_activity_copy_criteria(v2);
  if (!v5)
  {
    xpc_object_t v15 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_int64(v15, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_4_HOURS);
    xpc_dictionary_set_string(v15, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
    xpc_dictionary_set_BOOL(v15, XPC_ACTIVITY_REQUIRE_SIGNIFICANT_USER_INACTIVITY, 1);
    xpc_activity_set_criteria(v2, v15);
LABEL_41:

    goto LABEL_42;
  }

LABEL_42:
}

void sub_1000ECFB4(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_activity_state_t v4 = state;
  if (state == 2)
  {
    uint64_t v6 = VSGetLogEvent(2LL);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "running com.apple.voiced.weekly",  (uint8_t *)&v14,  2u);
    }

    id v8 = [[VSDownloadService alloc] initWithType:1];
    [v8 updateVoicesAndVoiceResources];

    xpc_activity_state_t state = xpc_activity_set_state(v2, 5LL);
    if ((state & 1) == 0)
    {
      uint64_t v9 = VSGetLogDefault(state);
      uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v14) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_ERROR,  "xpc activity com.apple.voiced.weekly, failed to set state to done.",  (uint8_t *)&v14,  2u);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    if (v5)
    {
    }

    else
    {
      xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v13, XPC_ACTIVITY_INTERVAL, XPC_ACTIVITY_INTERVAL_7_DAYS);
      xpc_dictionary_set_string(v13, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_activity_set_criteria(v2, v13);
    }

    goto LABEL_14;
  }

  uint64_t v11 = VSGetLogDefault(state);
  double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v14 = 134217984;
    xpc_activity_state_t v15 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_ERROR,  "Unexpected xpc_activity state, got: %ld",  (uint8_t *)&v14,  0xCu);
  }

LABEL_14:
}

void sub_1000ED1AC(id a1, OS_xpc_object *a2)
{
  uint64_t v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  xpc_activity_state_t v4 = state;
  if (state == 2)
  {
    uint64_t v6 = VSGetLogEvent(2LL);
    double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "running com.apple.voiced",  (uint8_t *)&v19,  2u);
    }

    id v8 = objc_alloc_init(&OBJC_CLASS___VSSpeechXPCHandler);
    [v8 cleanUnusedAssets:&stru_1000FAB18];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[VSSpeechCache defaultCacheStore](&OBJC_CLASS___VSSpeechCache, "defaultCacheStore"));
    [v9 cleanCache];

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[VSDiagnosticService defaultService](&OBJC_CLASS___VSDiagnosticService, "defaultService"));
    [v10 removeOldFiles];

    id v11 = [[VSDownloadService alloc] initWithType:0];
    [v11 updateVoicesAndVoiceResources];

    BOOL v12 = xpc_activity_set_state(v2, 5LL);
    if (!v12)
    {
      uint64_t v13 = VSGetLogDefault(v12);
      int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v19) = 0;
        _os_log_error_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "xpc activity com.apple.voiced, failed to set state to done.",  (uint8_t *)&v19,  2u);
      }
    }
  }

  else if (!state)
  {
    xpc_object_t v5 = xpc_activity_copy_criteria(v2);
    if (v5)
    {
    }

    else
    {
      xpc_object_t v17 = xpc_dictionary_create(0LL, 0LL, 0LL);
      xpc_dictionary_set_int64(v17, XPC_ACTIVITY_DELAY, XPC_ACTIVITY_INTERVAL_1_DAY);
      xpc_dictionary_set_BOOL(v17, XPC_ACTIVITY_REPEATING, 1);
      if (XPC_ACTIVITY_INTERVAL_1_DAY >= 0) {
        int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY;
      }
      else {
        int64_t v18 = XPC_ACTIVITY_INTERVAL_1_DAY + 1;
      }
      xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_GRACE_PERIOD, v18 >> 1);
      xpc_dictionary_set_string(v17, XPC_ACTIVITY_PRIORITY, XPC_ACTIVITY_PRIORITY_MAINTENANCE);
      xpc_dictionary_set_uint64(v17, XPC_ACTIVITY_RANDOM_INITIAL_DELAY, XPC_ACTIVITY_INTERVAL_4_HOURS);
      xpc_activity_set_criteria(v2, v17);
    }

    goto LABEL_15;
  }

  uint64_t v15 = VSGetLogDefault(state);
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    int v19 = 134217984;
    xpc_activity_state_t v20 = v4;
    _os_log_error_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_ERROR,  "Unexpected xpc_activity state, got: %ld",  (uint8_t *)&v19,  0xCu);
  }

LABEL_15:
}

void sub_1000ED458(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  double v3 = v2;
  if (v2)
  {
    uint64_t v4 = VSGetLogDefault(v2);
    xpc_object_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSError localizedDescription](v3, "localizedDescription"));
      int v7 = 138412290;
      id v8 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_ERROR,  "Error cleanUnusedAssets in scheduled background task: %@",  (uint8_t *)&v7,  0xCu);
    }
  }
}

uint64_t sub_1000ED524(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  else {
    return 0LL;
  }
}

void sub_1000ED564(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(a1 + 24) != 3) {
    goto LABEL_27;
  }
  uint64_t v5 = *(unsigned int *)(a1 + 4);
  unsigned int v6 = *(_DWORD *)(a1 + 88);
  if (v6 > 0x400)
  {
LABEL_2:
    int v3 = -304;
LABEL_27:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v19 = NDR_record;
    goto LABEL_28;
  }

  int v3 = -304;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  uint64_t v8 = a1 + v7;
  unsigned int v9 = *(_DWORD *)(v8 + 96);
  if (v9 > 0x400) {
    goto LABEL_27;
  }
  int v10 = v5 - v7;
  if (v10 - 128 < v9) {
    goto LABEL_27;
  }
  unsigned int v11 = (v9 + 3) & 0xFFFFFFFC;
  if (v10 != v11 + 128) {
    goto LABEL_27;
  }
  uint64_t v12 = v8 - 1024;
  uint64_t v13 = v8 - 1024 + v11;
  CFIndex v14 = *(unsigned int *)(a1 + 52);
  if ((_DWORD)v14 != *(_DWORD *)(v13 + 1132)
    || (uint64_t v15 = v13 - 1024, v16 = *(_DWORD *)(a1 + 68), v16 != *(_DWORD *)(v13 + 1136)))
  {
LABEL_26:
    int v3 = -300;
    goto LABEL_27;
  }

  uint64_t v17 = 1116LL;
  size_t v18 = a1 + v5 - (v12 + 1124) >= 1024 ? 1024LL : a1 + v5 - (v12 + 1124);
  HIBYTE(v20) = *(_BYTE *)(v15 + 2168);
  LOBYTE(v20) = *(_BYTE *)(v15 + 2164);
  sub_1000DF21C( *(_DWORD *)(a1 + 28),  *(_DWORD *)(a1 + 80),  (const char *)(a1 + 92),  (const char *)(v12 + 1124),  *(UInt8 **)(a1 + 40),  v14,  *(const UInt8 **)(a1 + 56),  v16,  *(double *)(v15 + 2148),  v20,  *(_BYTE *)(v15 + 2172),  (_BYTE *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = 0;
  mig_deallocate(*(void *)(a1 + 56), *(unsigned int *)(a1 + 68));
  *(void *)(a1 + 56) = 0LL;
  *(_DWORD *)(a1 + 68) = 0;
  mig_deallocate(*(void *)(a1 + 40), *(unsigned int *)(a1 + 52));
  *(void *)(a1 + 40) = 0LL;
  *(_DWORD *)(a1 + 52) = 0;
  NDR_record_t v19 = NDR_record;
  if (!*(_DWORD *)(a2 + 32))
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return;
  }

uint64_t sub_1000ED790(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v6 = -304;
LABEL_16:
    *(_DWORD *)(a2 + 32) = v6;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v6 = -300;
    goto LABEL_16;
  }

  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  uint64_t v4 = pthread_mutex_lock(&stru_1000FD7B0);
  if (qword_100102A28
    && !*(_DWORD *)qword_100102A28
    && *(_BYTE *)(qword_100102A28 + 64) == 1
    && *(_DWORD *)(qword_100102A28 + 8) == v3)
  {
    *(_BYTE *)(qword_100102A28 + 64) = 0;
    uint64_t v5 = (os_log_s *)VSGetLogDefault(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315138;
      int v10 = "server_VSRecognitionBegin";
      _os_log_debug_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "%s: releasing active client to begin\n",  (uint8_t *)&v9,  0xCu);
    }

    if (qword_100102A30) {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)qword_100102A30);
    }
    if (qword_100102A38) {
      CFRunLoopWakeUp((CFRunLoopRef)qword_100102A38);
    }
  }

  else
  {
    unsigned int v7 = sub_1000EA4E0();
    if (!v7 || v7[2] != v3 || *((_BYTE *)v7 + 64) != 1)
    {
      char v8 = 0;
      goto LABEL_24;
    }

    *((_BYTE *)v7 + 64) = 0;
  }

  char v8 = 1;
LABEL_24:
  id result = pthread_mutex_unlock(&stru_1000FD7B0);
  *(_BYTE *)(a2 + 36) = v8;
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_1000ED970(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v11 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v11;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v11 = -300;
    goto LABEL_24;
  }

  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 36) = 0;
  pthread_mutex_lock(&stru_1000FD7B0);
  if (qword_100102A28 && !*(_DWORD *)qword_100102A28 && *(_DWORD *)(qword_100102A28 + 8) == v3 && qword_100102A40 != 0)
  {
    UInt32 ioDataSize = 16;
    OSStatus Property = AudioQueueGetProperty((AudioQueueRef)qword_100102A40, 0x61716D76u, outData, &ioDataSize);
    float v6 = 0.0;
    if (!Property)
    {
      LODWORD(v7) = ioDataSize >> 3;
      uint64_t v7 = ioDataSize >> 3 >= 2 ? 2LL : v7;
      if ((_DWORD)v7)
      {
        char v8 = (float *)outData;
        uint64_t v9 = v7;
        do
        {
          float v10 = *v8;
          v8 += 2;
          float v6 = v6 + v10;
          --v9;
        }

        while (v9);
        float v6 = v6 / (float)v7;
      }
    }

    *(float *)(a2 + 36) = v6;
  }

  id result = pthread_mutex_unlock(&stru_1000FD7B0);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_1000EDAFC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v11 = -304;
LABEL_24:
    *(_DWORD *)(a2 + 32) = v11;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v11 = -300;
    goto LABEL_24;
  }

  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  *(_DWORD *)(a2 + 36) = 0;
  pthread_mutex_lock(&stru_1000FD7B0);
  if (qword_100102A28 && !*(_DWORD *)qword_100102A28 && *(_DWORD *)(qword_100102A28 + 8) == v3 && qword_100102A40 != 0)
  {
    UInt32 ioDataSize = 16;
    OSStatus Property = AudioQueueGetProperty((AudioQueueRef)qword_100102A40, 0x61716D64u, outData, &ioDataSize);
    float v6 = 0.0;
    if (!Property)
    {
      LODWORD(v7) = ioDataSize >> 3;
      uint64_t v7 = ioDataSize >> 3 >= 2 ? 2LL : v7;
      if ((_DWORD)v7)
      {
        char v8 = (float *)outData;
        uint64_t v9 = v7;
        do
        {
          float v10 = *v8;
          v8 += 2;
          float v6 = v6 + v10;
          --v9;
        }

        while (v9);
        float v6 = v6 / (float)v7;
      }
    }

    *(float *)(a2 + 36) = v6;
  }

  id result = pthread_mutex_unlock(&stru_1000FD7B0);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_1000EDC88(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 40)
  {
    int v4 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v4;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }

  if (*(unsigned __int16 *)(result + 38) << 16 != 1114112)
  {
    int v4 = -300;
    goto LABEL_9;
  }

  mach_port_name_t v3 = *(_DWORD *)(result + 28);
  id result = sub_1000E1C30(v3);
  if (v3 - 1 <= 0xFFFFFFFD) {
    id result = mach_port_deallocate(mach_task_self_, v3);
  }
  *(_DWORD *)(a2 + 32) = 0;
  return result;
}

void sub_1000EDD28(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 && *(_DWORD *)(a1 + 24) == 2 && *(_DWORD *)(a1 + 4) == 80)
  {
    if (*(_BYTE *)(a1 + 39) == 1 && *(_BYTE *)(a1 + 55) == 1)
    {
      CFIndex v4 = *(unsigned int *)(a1 + 40);
      if ((_DWORD)v4 == *(_DWORD *)(a1 + 72))
      {
        unsigned int v5 = *(_DWORD *)(a1 + 56);
        if (v5 == *(_DWORD *)(a1 + 76))
        {
          sub_1000E1EA4(*(_DWORD *)(a1 + 68), *(const UInt8 **)(a1 + 28), v4, *(UInt8 **)(a1 + 44), v5);
          *(_DWORD *)(a2 + 32) = 0;
          mig_deallocate(*(void *)(a1 + 44), *(unsigned int *)(a1 + 56));
          *(void *)(a1 + 44) = 0LL;
          *(_DWORD *)(a1 + 56) = 0;
          mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
          *(void *)(a1 + 28) = 0LL;
          *(_DWORD *)(a1 + 40) = 0;
          return;
        }
      }
    }

    int v6 = -300;
  }

  else
  {
    int v6 = -304;
  }

  *(_DWORD *)(a2 + 32) = v6;
  *(NDR_record_t *)(a2 + 24) = NDR_record;
}

void sub_1000EDE00(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    *(_DWORD *)(a2 + 36) = 16777473;
    __int128 context = 0LL;
    mach_port_name_t v3 = (const __CFDictionary *)sub_1000E4930();
    if (v3)
    {
      CFIndex v4 = v3;
      CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)sub_1000E63E0, &context);
      CFRelease(v4);
      unsigned int v5 = context;
      if (context)
      {
        BinaryXMLData = (const __CFData *)VSCFPropertyListCreateBinaryXMLData(kCFAllocatorDefault, context);
        if (BinaryXMLData)
        {
          uint64_t v7 = BinaryXMLData;
          unsigned int Length = CFDataGetLength(BinaryXMLData);
          *(_DWORD *)(a2 + 52) = Length;
          if (vm_allocate(mach_task_self_, (vm_address_t *)(a2 + 28), Length, 1))
          {
            *(_DWORD *)(a2 + 52) = 0;
          }

          else
          {
            uint64_t v9 = *(void **)(a2 + 28);
            BytePtr = CFDataGetBytePtr(v7);
            memcpy(v9, BytePtr, *(unsigned int *)(a2 + 52));
          }

          CFRelease(v7);
        }

        else
        {
          *(_DWORD *)(a2 + 52) = 0;
        }

        CFRelease(v5);
      }
    }

    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(NDR_record_t *)(a2 + 44) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
  }

void sub_1000EDF50(_DWORD *a1, uint64_t a2)
{
  if ((*a1 & 0x80000000) != 0 || a1[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return;
  }

  *(_BYTE *)(a2 + 44) = 0;
  if (sub_1000E97E0(0, (uint64_t)v9))
  {
    *(_DWORD *)(a2 + 32) = 5;
    NDR_record_t v3 = NDR_record;
  }

  else
  {
    CFIndex v4 = sub_1000E27BC(v10, (const __CFString *)cf, v12);
    if (v4)
    {
      unsigned int v5 = v4;
      int v6 = CFURLCreateCopyAppendingPathComponent(kCFAllocatorDefault, v4, @"KeywordIndex.plist", 0);
      CFRelease(v5);
      int v7 = 5;
      if (v6)
      {
        if (CFURLGetFileSystemRepresentation(v6, 1u, (UInt8 *)(a2 + 44), 1024LL)) {
          int v7 = 0;
        }
        else {
          int v7 = 5;
        }
        CFRelease(v6);
      }
    }

    else
    {
      int v7 = 5;
    }

    if (v13) {
      v13(v9);
    }
    if (cf) {
      CFRelease(cf);
    }
    *(_DWORD *)(a2 + 32) = v7;
    NDR_record_t v3 = NDR_record;
    if (!v7)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      size_t v8 = strlen((const char *)(a2 + 44));
      if (!((v8 + 1) >> 32))
      {
        *(_DWORD *)(a2 + 36) = 0;
        *(_DWORD *)(a2 + 40) = v8 + 1;
        *(_DWORD *)(a2 + 4) = ((v8 + 4) & 0xFFFFFFFC) + 44;
        return;
      }

      *(_DWORD *)(a2 + 32) = -304;
    }
  }

  *(NDR_record_t *)(a2 + 24) = v3;
}

void sub_1000EE0BC(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
  }

  else
  {
    if (*(_BYTE *)(a1 + 32))
    {
      NDR_record_t v3 = (os_log_s *)VSGetLogDefault(a1);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CFRunLoopSourceContext buf = 0;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "beginning plugin registry rebuild...",  buf,  2u);
      }

      CFIndex v4 = sub_1000E4C0C();
      unsigned int v5 = sub_1000E4C60();
      pthread_mutex_lock(&stru_1000FD880);
      if (qword_100102A90)
      {
        CFRelease((CFTypeRef)qword_100102A90);
        qword_100102A90 = 0LL;
      }

      if (qword_100102A98)
      {
        CFRelease((CFTypeRef)qword_100102A98);
        qword_100102A98 = 0LL;
      }

      sub_1000E4E18(v4, v5);
      CFRelease(v4);
      if (v5) {
        CFRelease(v5);
      }
      uint64_t v6 = pthread_mutex_unlock(&stru_1000FD880);
      int v7 = (os_log_s *)VSGetLogDefault(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "finished.\n", v9, 2u);
      }
    }

    else
    {
      size_t v8 = sub_1000E4930();
      if (v8) {
        CFRelease(v8);
      }
    }

    *(_DWORD *)(a2 + 32) = 0;
  }

uint64_t sub_1000EE220(mach_port_t a1, const char *a2, uint64_t a3, int a4)
{
  int v10 = 1;
  uint64_t v11 = a3;
  int v12 = 16777472;
  int v13 = a4;
  NDR_record_t v14 = NDR_record;
  if (&_mig_strncpy_zerofill) {
    int v6 = mig_strncpy_zerofill(v17, a2, 1024);
  }
  else {
    int v6 = mig_strncpy(v17, a2, 1024);
  }
  int v15 = 0;
  int v16 = v6;
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  *(_DWORD *)&v17[v7] = a4;
  msg.msgh_bits = -2147483629;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 1004734;
  if (&_voucher_mach_msg_set) {
    voucher_mach_msg_set(&msg);
  }
  return mach_msg(&msg, 1, v7 + 64, 0, 0, 0, 0);
}

id objc_msgSend_vs_stringFrom4CC_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_stringFrom4CC:");
}