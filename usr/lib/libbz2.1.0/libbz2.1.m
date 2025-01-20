void sub_1811486AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  int v5;
  int v6;
  unint64_t v7;
  unsigned __int8 *v8;
  int v9;
  FILE **v10;
  unsigned __int8 *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  uint64_t i;
  uint64_t j;
  uint64_t v23;
  _DWORD *v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  int v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  int v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t k;
  unint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  int32x4_t v51;
  int32x4_t v52;
  int v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  uint64_t v58;
  int v59;
  unsigned int v60;
  int v61;
  int v62;
  uint64_t v63;
  BOOL v64;
  unsigned int v65;
  unint64_t v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  unsigned int v73;
  FILE **v74;
  unsigned int v75;
  uint64_t m;
  int v77;
  int v78;
  uint64_t v79;
  int v80;
  int v81;
  BOOL v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  unsigned int v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  int v92;
  int *v93;
  uint64_t v94;
  int v95;
  unsigned int v96;
  int v97;
  uint64_t v98;
  int v99;
  unsigned int v100;
  int v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  int v107;
  uint64_t v108;
  int v109;
  int v110;
  int v111;
  uint64_t v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  int v121;
  int *v122;
  int *v123;
  unsigned int v124;
  int v125;
  int v126;
  int v127;
  int *v128;
  int *v129;
  unsigned int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  BOOL v136;
  int v137;
  int v138;
  int v139;
  int v140;
  BOOL v141;
  int v142;
  int v143;
  int v144;
  int v145;
  BOOL v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  int *v154;
  int64_t v155;
  int v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  int v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t n;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  int v169;
  int v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  unint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  uint64_t v180;
  int v181;
  uint64_t v182;
  int v183;
  int v184;
  unsigned int v185;
  uint64_t v186;
  int v187;
  unsigned int v188;
  int v189;
  int v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  int v194;
  int v195;
  int v196;
  int v197;
  uint64_t v198;
  int v199;
  int v200;
  uint64_t v201;
  uint64_t v202;
  unsigned __int8 *v203;
  _DWORD v204[513];
  _BYTE v205[1288];
  _DWORD v206[100];
  _DWORD v207[100];
  _DWORD v208[100];
  uint64_t v209;
  v0 = MEMORY[0x1895F8858]();
  v1 = v0;
  v209 = *MEMORY[0x1895F89C0];
  v2 = *(void *)(v0 + 56);
  v3 = *(int **)(v0 + 40);
  v4 = *(int *)(v0 + 108);
  v5 = *(_DWORD *)(v0 + 656);
  if ((int)v4 < 10000)
  {
LABEL_2:
    sub_18114959C(*(void *)(v1 + 24), *(unsigned __int8 **)(v1 + 32), v3, v4, v5);
    goto LABEL_221;
  }

  v6 = *(_DWORD *)(v0 + 88);
  v7 = (v4 + 34) + (unint64_t)(v4 & 1);
  v203 = *(unsigned __int8 **)(v0 + 64);
  v8 = &v203[v7];
  if (v6 <= 1) {
    v6 = 1;
  }
  v9 = v4 * ((v6 - 1) / 3u);
  v204[0] = v9;
  v10 = (FILE **)MEMORY[0x1895F89D0];
  if (v5 >= 4) {
    fwrite("        main sort initialise ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }
  bzero(v3, 0x40004uLL);
  v11 = v203;
  v12 = *v203;
  v13 = (v4 - 1);
  v183 = v4 - 1;
  do
  {
    v14 = v13;
    *(_WORD *)&v8[2 * v13] = 0;
    v15 = v203[v13];
    ++v3[v12 | (v15 << 8)];
    v16 = v13 - 2;
    v17 = v13 - 1;
    *(_WORD *)&v8[2 * v17] = 0;
    v18 = v203[v17];
    ++v3[v15 | (v18 << 8)];
    *(_WORD *)&v8[2 * v16] = 0;
    v19 = v203[v16];
    ++v3[v18 | (v19 << 8)];
    *(_WORD *)&v8[2 * --v16] = 0;
    v12 = v203[v16];
    v20 = v19 | (v12 << 8);
    ++v3[v20];
    v13 = v14 - 4;
  }

  while (v14 > 6);
  if ((v14 & 0xFFFFFFFC) != 0)
  {
    for (i = (v14 - 4); i != -1; --i)
    {
      *(_WORD *)&v203[2 * i + v7] = 0;
      v20 = (v203[i] << 8) | (v20 >> 8);
      ++v3[v20];
    }
  }

  for (j = 0LL; j != 34; ++j)
  {
    v203[v4 + j] = v203[j];
    *(_WORD *)&v203[2 * v4 + 2 * j + v7] = 0;
  }

  if (v5 >= 4)
  {
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, *v10);
    v11 = v203;
  }

  v23 = 0LL;
  v24 = v3 + 1;
  v25 = *v3;
  do
  {
    v25 += v24[v23];
    v24[v23++] = v25;
  }

  while (v23 != 0x10000);
  v26 = *v11 << 8;
  v27 = -1;
  v28 = 3;
  v29 = -4;
  v30 = -3;
  v31 = -2;
  v32 = (v4 - 1);
  do
  {
    HIDWORD(v33) = v11[v32];
    LODWORD(v33) = v26 << 16;
    v34 = (unsigned __int16)(v33 >> 24);
    v35 = v3[v34] - 1;
    v3[v34] = v35;
    *(_DWORD *)(v2 + 4LL * v35) = v4 + v27;
    v36 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v31)];
    LODWORD(v33) = v36;
    v37 = (unsigned __int16)(v33 >> 24);
    v38 = v3[v37] - 1;
    v3[v37] = v38;
    *(_DWORD *)(v2 + 4LL * v38) = v4 + v31;
    v39 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v30)];
    LODWORD(v33) = v39;
    v40 = (unsigned __int16)(v33 >> 24);
    v41 = v3[v40] - 1;
    v3[v40] = v41;
    *(_DWORD *)(v2 + 4LL * v41) = v4 + v30;
    v42 = (v33 >> 24) << 16;
    HIDWORD(v33) = v11[(v4 + v29)];
    LODWORD(v33) = v42;
    v26 = v33 >> 24;
    v43 = (unsigned __int16)(v33 >> 24);
    v44 = v3[v43] - 1;
    v3[v43] = v44;
    *(_DWORD *)(v2 + 4LL * v44) = v4 + v29;
    v27 -= 4;
    v28 -= 4;
    v29 -= 4;
    v30 -= 4;
    v31 -= 4;
    v82 = v32 > 6;
    v32 -= 4LL;
  }

  while (v82);
  if ((int)v4 + v28 >= 4)
  {
    v45 = (v4 + v27);
    for (k = v45; k != -1; --k)
    {
      HIDWORD(v47) = v11[k];
      LODWORD(v47) = v26 << 16;
      v26 = v47 >> 24;
      v48 = (unsigned __int16)(v47 >> 24);
      v49 = v3[v48] - 1;
      v3[v48] = v49;
      *(_DWORD *)(v2 + 4LL * v49) = v45;
      LODWORD(v45) = v45 - 1;
    }
  }

  v50 = 0LL;
  memset(v205, 0, 256);
  v51 = (int32x4_t)xmmword_181153090;
  v52.i64[0] = 0x400000004LL;
  v52.i64[1] = 0x400000004LL;
  do
  {
    *(int32x4_t *)&v205[v50 + 264] = v51;
    v51 = vaddq_s32(v51, v52);
    v50 += 16LL;
  }

  while (v50 != 1024);
  v53 = 364;
  do
  {
    v54 = v53 / 3;
    if (v53 <= 767)
    {
      v55 = 0;
      v56 = v54;
      if (v54 <= 255) {
        v57 = 255;
      }
      else {
        v57 = v53 / 3;
      }
      v58 = (v57 + 1);
      do
      {
        v59 = *(_DWORD *)&v205[4 * v56 + 264];
        v60 = v3[256 * v59 + 256] - v3[256 * v59];
        v61 = v55;
        while (1)
        {
          v62 = *(_DWORD *)&v205[4 * v61 + 264];
          if (v3[256 * v62 + 256] - v3[256 * v62] <= v60) {
            break;
          }
          v63 = v61;
          *(_DWORD *)&v205[4 * v54 + 264 + 4 * v61] = v62;
          v64 = __OFSUB__(v61, v54);
          v61 -= v54;
          if (v61 < 0 != v64) {
            goto LABEL_39;
          }
        }

        v63 = v54 + v61;
LABEL_39:
        *(_DWORD *)&v205[4 * v63 + 264] = v59;
        ++v56;
        ++v55;
      }

      while (v56 != v58);
    }

    v65 = v53 - 3;
    v53 /= 3;
  }

  while (v65 > 2);
  v66 = 0LL;
  v179 = 0;
  v67 = v9;
  v182 = v1;
  v181 = v5;
  v184 = v9;
  v202 = (uint64_t)v8;
  while (2)
  {
    v68 = 0LL;
    v69 = *(unsigned int *)&v205[4 * v66 + 264];
    v191 = (int)v69;
    v70 = (int)((_DWORD)v69 << 8);
    v176 = v66;
    v180 = v70;
    do
    {
      if (v68 != v69)
      {
        v71 = v68 + v70;
        v72 = v3[v68 + v70];
        if ((v72 & 0x200000) == 0)
        {
          v186 = v68 + v70;
          v73 = v3[v71 + 1] & 0xFFDFFFFF;
          v188 = v72 & 0xFFDFFFFF;
          v185 = v73 - 1;
          if ((int)(v73 - 1) > (int)(v72 & 0xFFDFFFFF))
          {
            v177 = v69;
            v178 = v68;
            v74 = (FILE **)MEMORY[0x1895F89D0];
            if (v5 >= 4)
            {
              fprintf( (FILE *)*MEMORY[0x1895F89D0],  "        qsort [0x%x, 0x%x]   done %d   this %d\n",  v69,  v68,  v179,  v73 - v188);
              v11 = v203;
            }

            v208[0] = v188;
            v207[0] = v185;
            v75 = 1;
            v206[0] = 2;
            while (2)
            {
              for (m = v75 - 1; ; v206[m] = v80 + 1)
              {
                if (v75 >= 0x62) {
                  sub_18114A0F8(1001);
                }
                v77 = v208[m];
                v78 = v207[m];
                v79 = v78;
                v80 = v206[m];
                v81 = v78 - v77;
                v82 = v78 - v77 >= 20 && v80 < 15;
                if (!v82) {
                  break;
                }
                v83 = v11[*(_DWORD *)(v2 + 4LL * v77) + v80];
                v84 = v11[*(_DWORD *)(v2 + 4LL * v78) + v80];
                v85 = v11[*(_DWORD *)(v2 + 4LL * ((v78 + v77) >> 1)) + v80];
                if (v83 <= v84) {
                  v86 = v11[*(_DWORD *)(v2 + 4LL * v78) + v80];
                }
                else {
                  v86 = v11[*(_DWORD *)(v2 + 4LL * v77) + v80];
                }
                if (v83 >= v84) {
                  v83 = v11[*(_DWORD *)(v2 + 4LL * v78) + v80];
                }
                if (v83 <= v85) {
                  v83 = v11[*(_DWORD *)(v2 + 4LL * ((v78 + v77) >> 1)) + v80];
                }
                if (v86 <= v85) {
                  v87 = v86;
                }
                else {
                  v87 = v83;
                }
                LODWORD(v88) = v207[m];
                LODWORD(v89) = v208[m];
                v90 = v88;
                v91 = v89;
LABEL_68:
                if (v91 <= v90)
                {
                  v89 = (int)v89;
                  do
                  {
                    if (v91 <= v90) {
                      v92 = v90;
                    }
                    else {
                      v92 = v91;
                    }
                    v93 = (int *)(v2 + 4LL * v91);
                    v94 = v92 - (uint64_t)v91 + 1;
                    while (1)
                    {
                      v95 = *v93;
                      v96 = v11[*v93 + v80];
                      if (v96 == v87) {
                        break;
                      }
                      if (v96 > v87) {
                        goto LABEL_81;
                      }
                      ++v91;
                      ++v93;
                      if (!--v94)
                      {
                        v91 = v92 + 1;
                        goto LABEL_81;
                      }
                    }

                    *v93 = *(_DWORD *)(v2 + 4 * v89);
                    *(_DWORD *)(v2 + 4 * v89++) = v95;
                    v97 = v91 + 1;
                    v82 = v90 <= v91++;
                  }

                  while (!v82);
                  v91 = v97;
                }

LABEL_81:
                if (v91 <= v90)
                {
                  v88 = (int)v88;
                  while (2)
                  {
                    v98 = v90;
                    while (1)
                    {
                      v99 = *(_DWORD *)(v2 + 4 * v98);
                      v100 = v11[v99 + v80];
                      if (v100 == v87) {
                        break;
                      }
                      if (v100 < v87)
                      {
                        v101 = *(_DWORD *)(v2 + 4LL * v91);
                        *(_DWORD *)(v2 + 4LL * v91) = v99;
                        *(_DWORD *)(v2 + 4 * v98) = v101;
                        ++v91;
                        v90 = v98 - 1;
                        goto LABEL_68;
                      }

                      v82 = v98-- <= v91;
                      if (v82)
                      {
                        --v90;
                        goto LABEL_95;
                      }
                    }

                    *(_DWORD *)(v2 + 4 * v98) = *(_DWORD *)(v2 + 4 * v88);
                    *(_DWORD *)(v2 + 4 * v88--) = v99;
                    v90 = v98 - 1;
                    break;
                  }
                }

LABEL_95:
                if ((int)v88 >= (int)v89)
                {
                  v121 = v91 - v89;
                  if (v121 >= 1)
                  {
                    v122 = (int *)(v2 + 4LL * v77);
                    v123 = (int *)(v2 + 4LL * (v91 - v121));
                    v124 = v121 + 1;
                    do
                    {
                      v125 = *v122;
                      *v122++ = *v123;
                      *v123++ = v125;
                      --v124;
                    }

                    while (v124 > 1);
                  }

                  v126 = v78 - v88;
                  v127 = v88 - v90;
                  if (v126 >= 1)
                  {
                    v128 = (int *)(v2 + 4LL * v91);
                    v129 = (int *)(v2 + 4 + 4LL * (v78 - v126));
                    v130 = v126 + 1;
                    do
                    {
                      v131 = *v128;
                      *v128++ = *v129;
                      *v129++ = v131;
                      --v130;
                    }

                    while (v130 > 1);
                  }

                  v132 = v77 - v89 + v91;
                  v133 = v78 - v127;
                  v134 = v132 - 1 - v77;
                  v135 = v78 - (v133 + 1);
                  v136 = v134 < v135;
                  if (v134 >= v135)
                  {
                    v137 = v133 + 1;
                  }

                  else
                  {
                    v135 = v132 - 1 - v77;
                    v137 = v77;
                  }

                  if (v136) {
                    v138 = v133 + 1;
                  }
                  else {
                    v138 = v77;
                  }
                  if (v136) {
                    v139 = v132 - 1;
                  }
                  else {
                    v139 = v78;
                  }
                  if (!v136) {
                    v78 = v132 - 1;
                  }
                  v140 = v133 - v132;
                  v141 = v135 < v133 - v132;
                  if (v135 < v133 - v132)
                  {
                    v142 = v132;
                  }

                  else
                  {
                    v140 = v135;
                    v142 = v137;
                  }

                  if (v141) {
                    v143 = v139;
                  }
                  else {
                    v143 = v133;
                  }
                  if (v141)
                  {
                    v144 = v80;
                  }

                  else
                  {
                    v133 = v139;
                    v144 = v80 + 1;
                  }

                  if (v141) {
                    v145 = v80 + 1;
                  }
                  else {
                    v145 = v80;
                  }
                  if (v141) {
                    v132 = v137;
                  }
                  v146 = v78 - v138 < v140;
                  if (v78 - v138 < v140) {
                    v147 = v142;
                  }
                  else {
                    v147 = v138;
                  }
                  if (v146) {
                    v148 = v133;
                  }
                  else {
                    v148 = v78;
                  }
                  v208[m] = v147;
                  v207[m] = v148;
                  if (v146) {
                    v149 = v138;
                  }
                  else {
                    v149 = v142;
                  }
                  if (v146) {
                    v150 = v145;
                  }
                  else {
                    v150 = v80;
                  }
                  v206[m] = v150;
                  v208[v75] = v149;
                  if (v146)
                  {
                    v151 = v80;
                  }

                  else
                  {
                    v78 = v133;
                    v151 = v145;
                  }

                  v207[v75] = v78;
                  v206[v75] = v151;
                  v152 = 4LL * (int)v75 + 4;
                  *(_DWORD *)((char *)v208 + v152) = v132;
                  *(_DWORD *)((char *)v207 + v152) = v143;
                  *(_DWORD *)((char *)v206 + v152) = v144;
                  LODWORD(m) = v75 + 2;
                  goto LABEL_179;
                }
              }

              if (v81 >= 1)
              {
                v102 = 0LL;
                do
                  v103 = dword_1811530A0[v102++];
                while (v103 <= v81);
                v104 = v102 - 1;
                if ((_DWORD)v104)
                {
                  v105 = v4;
                  v189 = v77 + 2;
                  v190 = v77 + 1;
                  v187 = v208[m];
                  v198 = v79;
                  do
                  {
                    v192 = v104;
                    v193 = v104 - 1;
                    v106 = dword_1811530A0[(v104 - 1)];
                    v107 = v106 + v77;
                    v197 = v189;
                    v199 = v190;
                    v200 = v77;
                    v108 = v106 + v77;
                    while (v108 <= v79)
                    {
                      v201 = v108;
                      v194 = *(_DWORD *)(v2 + 4 * v108);
                      v109 = v200;
                      while (1)
                      {
                        v110 = v106 + v109;
                        v111 = *(_DWORD *)(v2 + 4LL * v109);
                        v112 = v109;
                        *(_DWORD *)(v2 + 4LL * v110) = v111;
                        v109 -= v106;
                        v11 = v203;
                      }

                      v112 = v110;
                      v11 = v203;
LABEL_109:
                      *(_DWORD *)(v2 + 4 * v112) = v194;
                      v79 = v198;
                      if (v201 >= v198) {
                        break;
                      }
                      v195 = *(_DWORD *)(v2 + 4 * v201 + 4);
                      v113 = v199;
                      while (1)
                      {
                        v114 = v106 + v113;
                        v115 = *(_DWORD *)(v2 + 4LL * v113);
                        v116 = v113;
                        *(_DWORD *)(v2 + 4LL * v114) = v115;
                        v113 -= v106;
                        v11 = v203;
                      }

                      v116 = v114;
                      v11 = v203;
LABEL_115:
                      *(_DWORD *)(v2 + 4 * v116) = v195;
                      v79 = v198;
                      if (v201 + 2 > v198) {
                        break;
                      }
                      v196 = *(_DWORD *)(v2 + 4 * (v201 + 2));
                      v117 = v197;
                      while (1)
                      {
                        v118 = v106 + v117;
                        v119 = *(_DWORD *)(v2 + 4LL * v117);
                        v120 = v117;
                        *(_DWORD *)(v2 + 4LL * v118) = v119;
                        v117 -= v106;
                        v11 = v203;
                      }

                      v120 = v118;
                      v11 = v203;
LABEL_121:
                      *(_DWORD *)(v2 + 4 * v120) = v196;
                      v108 = v201 + 3;
                      v67 = v204[0];
                      v199 += 3;
                      v200 += 3;
                      v197 += 3;
                      v79 = v198;
                      if ((v204[0] & 0x80000000) != 0)
                      {
                        v1 = v182;
                        LODWORD(v4) = v105;
                        v5 = v181;
                        v74 = (FILE **)MEMORY[0x1895F89D0];
                        goto LABEL_217;
                      }
                    }

                    v77 = v187;
                    v104 = v193;
                  }

                  while (v192 > 1);
                  v67 = v204[0];
                  v1 = v182;
                  v4 = v105;
                  v5 = v181;
                  v74 = (FILE **)MEMORY[0x1895F89D0];
                  LODWORD(m) = v75 - 1;
                }
              }

              if (v67 < 0) {
                goto LABEL_217;
              }
LABEL_179:
              v75 = m;
              break;
            }

            if ((v67 & 0x80000000) == 0)
            {
              v70 = v180;
              v179 = v179 - v188 + v185 + 1;
              v71 = v186;
              v72 = v3[v186];
              v9 = v184;
              v8 = (unsigned __int8 *)v202;
              v69 = v177;
              v68 = v178;
              goto LABEL_183;
            }

LABEL_217:
            v9 = v184;
            goto LABEL_218;
          }

          v71 = v68 + v70;
        }

LABEL_183:
        v3[v71] = v72 | 0x200000;
      }

      ++v68;
    }

    while (v68 != 256);
    if (v205[v191]) {
      sub_18114A0F8(1006);
    }
    v153 = 0LL;
    v154 = &v3[v191 + 1];
    do
    {
      v204[v153 + 257] = *(v154 - 1) & 0xFFDFFFFF;
      v204[++v153] = (*v154 & 0xFFDFFFFF) - 1;
      v154 += 256;
    }

    while (v153 != 256);
    v155 = v3[v180] & 0xFFFFFFFFFFDFFFFFLL;
    v156 = v204[v191 + 257];
    v11 = v203;
    if ((int)v155 < v156)
    {
      do
      {
        v157 = (v4 & ((*(_DWORD *)(v2 + 4 * v155) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v155) - 1;
        v158 = v203[v157];
        if (!v205[v158])
        {
          v159 = (int)v204[v158 + 257];
          v204[v158 + 257] = v159 + 1;
          *(_DWORD *)(v2 + 4 * v159) = v157;
          v156 = v204[v191 + 257];
        }

        ++v155;
      }

      while (v155 < v156);
    }

    LODWORD(v160) = (v3[(int)v180 + 256] & 0xFFDFFFFF) - 1;
    v161 = v204[v191 + 1];
    if ((int)v160 > v161)
    {
      v160 = (int)v160;
      do
      {
        v162 = (v4 & ((*(_DWORD *)(v2 + 4 * v160) - 1) >> 31)) + *(_DWORD *)(v2 + 4 * v160) - 1;
        v163 = v203[v162];
        if (!v205[v163])
        {
          v164 = (int)v204[v163 + 1];
          v204[v163 + 1] = v164 - 1;
          *(_DWORD *)(v2 + 4 * v164) = v162;
          v161 = v204[v191 + 1];
        }

        --v160;
      }

      while (v160 > v161);
    }

    if (v156 - 1 != v161 && (v156 || v161 != v183)) {
      sub_18114A0F8(1007);
    }
    for (n = 0LL; n != 0x10000; n += 256LL)
      v3[v191 + n] |= 0x200000u;
    v205[v191] = 1;
    if (v176 <= 0xFE)
    {
      v166 = v3[v180];
      v167 = v166 & 0xFFFFFFFFFFDFFFFFLL;
      v168 = (v3[(int)v180 + 256] & 0xFFDFFFFF) - (v166 & 0xFFDFFFFF);
      v169 = -1;
      do
        ++v169;
      while ((int)v168 >> v169 > 65534);
      v170 = v168 - 1;
      if ((int)v168 >= 1)
      {
        v171 = v2 - 4 + 4 * v167;
        do
        {
          v172 = v168 - 1;
          v173 = *(int *)(v171 + 4 * v168);
          *(_WORD *)&v8[2 * v173] = v172 >> v169;
          v168 = v172;
        }

        while ((unint64_t)(v172 + 1) > 1);
      }

      if (v170 >> v169 >= 0x10000) {
        sub_18114A0F8(1002);
      }
    }

    v66 = v176 + 1;
    if (v176 != 255) {
      continue;
    }
    break;
  }

  v74 = (FILE **)MEMORY[0x1895F89D0];
  if (v5 > 3)
  {
    fprintf((FILE *)*MEMORY[0x1895F89D0], "        %d pointers, %d sorted, %d scanned\n", v4, v179, v4 - v179);
    goto LABEL_219;
  }

LABEL_218:
  if (v5 < 3) {
    goto LABEL_220;
  }
LABEL_219:
  fprintf(*v74, "      %d work, %d block, ratio %5.2f\n", v9 - v67, v4, (float)((float)(v9 - v67) / (float)(int)v4));
LABEL_220:
  if (v67 < 0)
  {
    if (v5 >= 2) {
      fwrite("    too repetitive; using fallback sorting algorithm\n", 0x35uLL, 1uLL, *v74);
    }
    goto LABEL_2;
  }

LABEL_221:
  *(_DWORD *)(v1 + 48) = -1;
  v174 = *(unsigned int *)(v1 + 108);
  if ((int)v174 < 1) {
LABEL_225:
  }
    sub_18114A0F8(1003);
  v175 = 0LL;
  while (*(_DWORD *)(v2 + 4 * v175))
  {
    if (v174 == ++v175) {
      goto LABEL_225;
    }
  }

  *(_DWORD *)(v1 + 48) = v175;
}

void sub_18114959C(uint64_t a1, unsigned __int8 *a2, void *a3, int a4, int a5)
{
  int v5 = a5;
  uint64_t v115 = *MEMORY[0x1895F89C0];
  if (a5 >= 4) {
    fwrite("        bucket sorting ...\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
  }
  uint64_t v10 = a4;
  bzero(__src, 0x404uLL);
  int v109 = a4;
  if (a4 < 1)
  {
    int v14 = 0;
  }

  else
  {
    uint64_t v11 = a4;
    v12 = a2;
    do
    {
      int v13 = *v12++;
      ++__src[v13];
      --v11;
    }

    while (v11);
    int v14 = __src[0];
  }

  memcpy(__dst, __src, sizeof(__dst));
  for (uint64_t i = 1LL; i != 257; ++i)
  {
    v14 += __src[i];
    __src[i] = v14;
  }

  if (a4 >= 1)
  {
    uint64_t v16 = 0LL;
    do
    {
      uint64_t v17 = a2[v16];
      uint64_t v18 = (int)__src[v17] - 1LL;
      __src[v17] = v18;
      *(_DWORD *)(a1 + 4 * v18) = v16++;
    }

    while (a4 != v16);
  }

  if (a4 >= -63) {
    bzero(a3, 4LL * (a4 / 32 + 1) + 4);
  }
  for (uint64_t j = 0LL; j != 256; ++j)
    *((_DWORD *)a3 + ((int)__src[j] >> 5)) |= 1 << __src[j];
  for (int k = 0; k != 64; k += 2)
  {
    *((_DWORD *)a3 + ((a4 + k) >> 5)) |= 1 << (a4 + k);
    *((_DWORD *)a3 + ((a4 + k + 1) >> 5)) &= ~(1 << (a4 + k + 1));
  }

  int v21 = 1;
  uint64_t v107 = a4;
  int v106 = v5;
  do
  {
    while (1)
    {
      if (v5 >= 4) {
        fprintf((FILE *)*MEMORY[0x1895F89D0], "        depth %6d has ", v21);
      }
      if (a4 >= 1)
      {
        uint64_t v22 = 0LL;
        int v23 = 0;
        do
        {
          *(_DWORD *)&a2[4 * (int)((v10 & ((*(_DWORD *)(a1 + 4 * v22) - v21) >> 31)) + *(_DWORD *)(a1 + 4 * v22) - v21)] = v23;
          ++v22;
        }

        while (v10 != v22);
      }

      int v108 = v21;
      int v24 = 0;
      int v25 = 0;
      while (1)
      {
        int v26 = v24 - 32;
        int v27 = v24 - 1;
        do
        {
          int v28 = v26;
          int v29 = v27;
          int v30 = (1 << v24) & *((_DWORD *)a3 + (v24 >> 5));
          BOOL v31 = (v24++ & 0x1F) == 0;
          if (v31) {
            break;
          }
          ++v26;
          ++v27;
        }

        while (v30);
        if (v30)
        {
          do
          {
            int v32 = v29;
            v28 += 32;
            v29 += 32;
          }

          while (*((_DWORD *)a3 + (v28 >> 5)) == -1);
          do
            ++v32;
          while (((*((_DWORD *)a3 + (v32 >> 5)) >> v32) & 1) != 0);
        }

        else
        {
          int v32 = v24 - 1;
        }

        if (v32 > a4) {
          break;
        }
        int v33 = v32 - 1;
        int v34 = v32 - 32;
        int v35 = v32 - 1;
        int v36 = v32;
        do
        {
          int v37 = v34;
          int v38 = v35;
          int v39 = (1 << v36) & *((_DWORD *)a3 + (v36 >> 5));
          BOOL v31 = (v36++ & 0x1F) == 0;
          if (v31) {
            break;
          }
          ++v34;
          ++v35;
        }

        while (!v39);
        if (v39)
        {
          int v24 = v36 - 1;
        }

        else
        {
          do
          {
            int v24 = v38;
            v37 += 32;
            v38 += 32;
          }

          while (!*((_DWORD *)a3 + (v37 >> 5)));
          do
            ++v24;
          while (((*((_DWORD *)a3 + (v24 >> 5)) >> v24) & 1) == 0);
        }

        if (v24 > a4) {
          break;
        }
        if (v24 > v32)
        {
          LOWORD(v40) = 0;
          int v110 = v25 - v32 + v24 - 1 + 2;
          v114[0] = v32 - 1;
          v113[0] = v24 - 1;
          uint64_t v41 = 1LL;
          do
          {
            unint64_t v42 = v41;
            while (1)
            {
              if (v42 >= 0x63) {
                sub_18114A0F8(1004);
              }
              int v43 = v114[(v42 - 1)];
              uint64_t v44 = v43;
              int v45 = v113[(v42 - 1)];
              if (v45 - v43 > 9) {
                break;
              }
              if (v45 != v43)
              {
                int v46 = v45 - 4;
                BOOL v47 = v45 - v43 < 4 || v46 < v43;
                if (!v47)
                {
                  uint64_t v48 = v46;
                  uint64_t v49 = v45;
                  uint64_t v50 = a1 + 4LL * v45;
                  do
                  {
                    uint64_t v51 = *(int *)(a1 + 4 * v48);
                    int v52 = v48;
                    if (v48 <= v45 - 4LL)
                    {
                      uint64_t v53 = 0LL;
                      unsigned int v54 = *(_DWORD *)&a2[4 * v51];
                      do
                      {
                        uint64_t v55 = *(unsigned int *)(v50 + 4 * v53);
                        if (v54 <= *(_DWORD *)&a2[4 * v55]) {
                          break;
                        }
                        *(_DWORD *)(a1 + 4LL * (v46 + (int)v53)) = v55;
                        v53 += 4LL;
                      }

                      while (v49 + v53 <= v45);
                      int v52 = v46 + v53;
                    }

                    *(_DWORD *)(a1 + 4LL * v52) = v51;
                    --v49;
                    --v46;
                    v50 -= 4LL;
                    BOOL v47 = v48-- <= v43;
                  }

                  while (!v47);
                }

                if (v45 > v43)
                {
                  int v56 = 0;
                  uint64_t v57 = v45;
                  v58 = (int *)(a1 + 4LL * v45);
                  do
                  {
                    uint64_t v59 = v57--;
                    uint64_t v60 = *(int *)(a1 + 4 * v57);
                    if (v59 <= v45)
                    {
                      unsigned int v61 = *(_DWORD *)&a2[4 * v60];
                      v62 = v58;
                      int v63 = v56;
                      v64 = v58;
                      while (1)
                      {
                        int v66 = *v64++;
                        int v65 = v66;
                        if (v61 <= *(_DWORD *)&a2[4 * v66]) {
                          break;
                        }
                        *(v62 - 1) = v65;
                        --v63;
                        v62 = v64;
                        if (v63 == -1)
                        {
                          LODWORD(v59) = v45 + 1;
                          goto LABEL_72;
                        }
                      }

                      LODWORD(v59) = v45 - v63;
                    }

LABEL_72:
                    *(_DWORD *)(a1 + 4LL * ((int)v59 - 1)) = v60;
                    ++v56;
                    --v58;
                  }

                  while (v57 > v44);
                }
              }

              BOOL v47 = (int)v42-- <= 1;
              if (v47) {
                goto LABEL_124;
              }
            }

            int v40 = (7621 * (_WORD)v40 + 1) & 0x7FFF;
            int v67 = v114[(v42 - 1)];
            if ((_WORD)v40 != 3 * ((21846 * v40) >> 16))
            {
              else {
                int v67 = v113[(v42 - 1)];
              }
            }

            uint64_t v41 = (v42 - 1);
            int v68 = *(_DWORD *)&a2[4 * *(unsigned int *)(a1 + 4LL * v67)];
            LODWORD(v69) = v113[v41];
            LODWORD(v70) = v114[v41];
            int v71 = v69;
            int v72 = v70;
LABEL_81:
            if (v72 <= v71)
            {
              uint64_t v70 = (int)v70;
              do
              {
                if (v72 <= v71) {
                  int v73 = v71;
                }
                else {
                  int v73 = v72;
                }
                v74 = (_DWORD *)(a1 + 4LL * v72);
                uint64_t v75 = v73 - (uint64_t)v72 + 1;
                while (1)
                {
                  uint64_t v76 = *v74;
                  int v77 = *(_DWORD *)&a2[4 * v76];
                  if (v77 == v68) {
                    break;
                  }
                  if (v77 > v68) {
                    goto LABEL_94;
                  }
                  ++v72;
                  ++v74;
                  if (!--v75)
                  {
                    int v72 = v73 + 1;
                    goto LABEL_94;
                  }
                }

                _DWORD *v74 = *(_DWORD *)(a1 + 4 * v70);
                *(_DWORD *)(a1 + 4 * v70++) = v76;
                int v78 = v72 + 1;
                BOOL v47 = v71 <= v72++;
              }

              while (!v47);
              int v72 = v78;
            }

LABEL_94:
            if (v72 <= v71)
            {
              uint64_t v69 = (int)v69;
              while (2)
              {
                uint64_t v79 = v71;
                while (1)
                {
                  uint64_t v80 = *(unsigned int *)(a1 + 4 * v79);
                  int v81 = *(_DWORD *)&a2[4 * v80];
                  if (v81 == v68) {
                    break;
                  }
                  if (v81 < v68)
                  {
                    int v82 = *(_DWORD *)(a1 + 4LL * v72);
                    *(_DWORD *)(a1 + 4LL * v72) = v80;
                    *(_DWORD *)(a1 + 4 * v79) = v82;
                    ++v72;
                    int v71 = v79 - 1;
                    goto LABEL_81;
                  }

                  BOOL v47 = v79-- <= v72;
                  if (v47)
                  {
                    --v71;
                    goto LABEL_108;
                  }
                }

                *(_DWORD *)(a1 + 4 * v79) = *(_DWORD *)(a1 + 4 * v69);
                *(_DWORD *)(a1 + 4 * v69--) = v80;
                int v71 = v79 - 1;
                break;
              }
            }

LABEL_108:
            if ((int)v69 >= (int)v70)
            {
              int v83 = v72 - v70;
              if (v83 >= 1)
              {
                v84 = (int *)(a1 + 4LL * v43);
                v85 = (int *)(a1 + 4LL * (v72 - v83));
                unsigned int v86 = v83 + 1;
                do
                {
                  int v87 = *v84;
                  *v84++ = *v85;
                  *v85++ = v87;
                  --v86;
                }

                while (v86 > 1);
              }

              int v88 = v45 - v69;
              int v89 = v69 - v71;
              if (v88 >= 1)
              {
                v90 = (int *)(a1 + 4LL * v72);
                v91 = (int *)(a1 + 4 + 4LL * (v45 - v88));
                unsigned int v92 = v88 + 1;
                do
                {
                  int v93 = *v90;
                  *v90++ = *v91;
                  *v91++ = v93;
                  --v92;
                }

                while (v92 > 1);
              }

              int v94 = v43 + ~(_DWORD)v70 + v72;
              int v95 = v45 - v89 + 1;
              if (v94 - v43 <= v45 - v95)
              {
                v114[v41] = v95;
                int v95 = v43;
                int v45 = v94;
              }

              else
              {
                v113[v41] = v94;
              }

              v114[v42] = v95;
              v113[v42] = v45;
              uint64_t v41 = v42 + 1LL;
            }
          }

          while ((int)v41 > 0);
LABEL_124:
          v96 = (int *)(a1 + 4LL * v33);
          int v97 = -1;
          a4 = v109;
          int v25 = v110;
          do
          {
            int v98 = *v96++;
            int v99 = *(_DWORD *)&a2[4 * v98];
            if (v97 != v99)
            {
              *((_DWORD *)a3 + (v33 >> 5)) |= 1 << v33;
              int v97 = v99;
            }

            ++v33;
          }

          while (v24 != v33);
        }
      }

      int v21 = 2 * v108;
      int v5 = v106;
      if (v106 >= 4) {
        break;
      }
      uint64_t v10 = v107;
      if (v21 > a4 || !v25) {
        goto LABEL_137;
      }
    }

    int v100 = v25;
    fprintf((FILE *)*MEMORY[0x1895F89D0], "%6d unresolved strings\n", v25);
    int v101 = v100;
    uint64_t v10 = v107;
  }

  while (v21 <= a4 && v101);
  fwrite("        reconstructing block ...\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
LABEL_137:
  if (a4 >= 1)
  {
    uint64_t v102 = 0LL;
    LODWORD(v103) = 0;
    do
    {
      uint64_t v103 = (int)v103;
      int v104 = v103 - 1;
      do
      {
        int v105 = __dst[v103++];
        ++v104;
      }

      while (!v105);
      __dst[v103 - 1] = v105 - 1;
      LODWORD(v103) = v103 - 1;
      a2[*(unsigned int *)(a1 + 4 * v102++)] = v103;
    }

    while (v102 != v10);
    if (v104 >= 256) {
      sub_18114A0F8(1005);
    }
  }
}

BOOL sub_181149E4C(unsigned int a1, unsigned int a2, uint64_t a3, uint64_t a4, unsigned int a5, _DWORD *a6)
{
  unsigned int v6 = *(unsigned __int8 *)(a3 + a1);
  unsigned int v7 = *(unsigned __int8 *)(a3 + a2);
  BOOL v8 = v6 > v7;
  if (v6 == v7)
  {
    unsigned int v9 = *(unsigned __int8 *)(a3 + a1 + 1);
    unsigned int v10 = *(unsigned __int8 *)(a3 + a2 + 1);
    BOOL v8 = v9 > v10;
    if (v9 == v10)
    {
      unsigned int v11 = *(unsigned __int8 *)(a3 + a1 + 2);
      unsigned int v12 = *(unsigned __int8 *)(a3 + a2 + 2);
      BOOL v8 = v11 > v12;
      if (v11 == v12)
      {
        unsigned int v13 = *(unsigned __int8 *)(a3 + a1 + 3);
        unsigned int v14 = *(unsigned __int8 *)(a3 + a2 + 3);
        BOOL v8 = v13 > v14;
        if (v13 == v14)
        {
          unsigned int v15 = *(unsigned __int8 *)(a3 + a1 + 4);
          unsigned int v16 = *(unsigned __int8 *)(a3 + a2 + 4);
          BOOL v8 = v15 > v16;
          if (v15 == v16)
          {
            unsigned int v17 = *(unsigned __int8 *)(a3 + a1 + 5);
            unsigned int v18 = *(unsigned __int8 *)(a3 + a2 + 5);
            BOOL v8 = v17 > v18;
            if (v17 == v18)
            {
              unsigned int v19 = *(unsigned __int8 *)(a3 + a1 + 6);
              unsigned int v20 = *(unsigned __int8 *)(a3 + a2 + 6);
              BOOL v8 = v19 > v20;
              if (v19 == v20)
              {
                unsigned int v21 = *(unsigned __int8 *)(a3 + a1 + 7);
                unsigned int v22 = *(unsigned __int8 *)(a3 + a2 + 7);
                BOOL v8 = v21 > v22;
                if (v21 == v22)
                {
                  unsigned int v23 = *(unsigned __int8 *)(a3 + a1 + 8);
                  unsigned int v24 = *(unsigned __int8 *)(a3 + a2 + 8);
                  BOOL v8 = v23 > v24;
                  if (v23 == v24)
                  {
                    unsigned int v25 = *(unsigned __int8 *)(a3 + a1 + 9);
                    unsigned int v26 = *(unsigned __int8 *)(a3 + a2 + 9);
                    BOOL v8 = v25 > v26;
                    if (v25 == v26)
                    {
                      unsigned int v27 = *(unsigned __int8 *)(a3 + a1 + 10);
                      unsigned int v28 = *(unsigned __int8 *)(a3 + a2 + 10);
                      BOOL v8 = v27 > v28;
                      if (v27 == v28)
                      {
                        unsigned int v29 = *(unsigned __int8 *)(a3 + a1 + 11);
                        unsigned int v30 = *(unsigned __int8 *)(a3 + a2 + 11);
                        BOOL v8 = v29 > v30;
                        if (v29 == v30)
                        {
                          unsigned int v31 = a1 + 12;
                          unsigned int v32 = a2 + 12;
                          int v33 = a5 + 16;
                          while (1)
                          {
                            unsigned int v34 = *(unsigned __int8 *)(a3 + v31);
                            unsigned int v35 = *(unsigned __int8 *)(a3 + v32);
                            BOOL v8 = v34 > v35;
                            if (v34 != v35) {
                              break;
                            }
                            unsigned int v36 = *(unsigned __int16 *)(a4 + 2LL * v31);
                            unsigned int v37 = *(unsigned __int16 *)(a4 + 2LL * v32);
                            BOOL v8 = v36 > v37;
                            if (v36 != v37) {
                              break;
                            }
                            uint64_t v38 = v31 + 1;
                            uint64_t v39 = v32 + 1;
                            unsigned int v40 = *(unsigned __int8 *)(a3 + v38);
                            unsigned int v41 = *(unsigned __int8 *)(a3 + v39);
                            BOOL v8 = v40 > v41;
                            if (v40 != v41) {
                              break;
                            }
                            unsigned int v42 = *(unsigned __int16 *)(a4 + 2 * v38);
                            unsigned int v43 = *(unsigned __int16 *)(a4 + 2 * v39);
                            BOOL v8 = v42 > v43;
                            if (v42 != v43) {
                              break;
                            }
                            uint64_t v44 = v31 + 2;
                            uint64_t v45 = v32 + 2;
                            unsigned int v46 = *(unsigned __int8 *)(a3 + v44);
                            unsigned int v47 = *(unsigned __int8 *)(a3 + v45);
                            BOOL v8 = v46 > v47;
                            if (v46 != v47) {
                              break;
                            }
                            unsigned int v48 = *(unsigned __int16 *)(a4 + 2 * v44);
                            unsigned int v49 = *(unsigned __int16 *)(a4 + 2 * v45);
                            BOOL v8 = v48 > v49;
                            if (v48 != v49) {
                              break;
                            }
                            uint64_t v50 = v31 + 3;
                            uint64_t v51 = v32 + 3;
                            unsigned int v52 = *(unsigned __int8 *)(a3 + v50);
                            unsigned int v53 = *(unsigned __int8 *)(a3 + v51);
                            BOOL v8 = v52 > v53;
                            if (v52 != v53) {
                              break;
                            }
                            unsigned int v54 = *(unsigned __int16 *)(a4 + 2 * v50);
                            unsigned int v55 = *(unsigned __int16 *)(a4 + 2 * v51);
                            BOOL v8 = v54 > v55;
                            if (v54 != v55) {
                              break;
                            }
                            uint64_t v56 = v31 + 4;
                            uint64_t v57 = v32 + 4;
                            unsigned int v58 = *(unsigned __int8 *)(a3 + v56);
                            unsigned int v59 = *(unsigned __int8 *)(a3 + v57);
                            BOOL v8 = v58 > v59;
                            if (v58 != v59) {
                              break;
                            }
                            unsigned int v60 = *(unsigned __int16 *)(a4 + 2 * v56);
                            unsigned int v61 = *(unsigned __int16 *)(a4 + 2 * v57);
                            BOOL v8 = v60 > v61;
                            if (v60 != v61) {
                              break;
                            }
                            uint64_t v62 = v31 + 5;
                            uint64_t v63 = v32 + 5;
                            unsigned int v64 = *(unsigned __int8 *)(a3 + v62);
                            unsigned int v65 = *(unsigned __int8 *)(a3 + v63);
                            BOOL v8 = v64 > v65;
                            if (v64 != v65) {
                              break;
                            }
                            unsigned int v66 = *(unsigned __int16 *)(a4 + 2 * v62);
                            unsigned int v67 = *(unsigned __int16 *)(a4 + 2 * v63);
                            BOOL v8 = v66 > v67;
                            if (v66 != v67) {
                              break;
                            }
                            uint64_t v68 = v31 + 6;
                            uint64_t v69 = v32 + 6;
                            unsigned int v70 = *(unsigned __int8 *)(a3 + v68);
                            unsigned int v71 = *(unsigned __int8 *)(a3 + v69);
                            BOOL v8 = v70 > v71;
                            if (v70 != v71) {
                              break;
                            }
                            unsigned int v72 = *(unsigned __int16 *)(a4 + 2 * v68);
                            unsigned int v73 = *(unsigned __int16 *)(a4 + 2 * v69);
                            BOOL v8 = v72 > v73;
                            if (v72 != v73) {
                              break;
                            }
                            uint64_t v74 = v31 + 7;
                            uint64_t v75 = v32 + 7;
                            unsigned int v76 = *(unsigned __int8 *)(a3 + v74);
                            unsigned int v77 = *(unsigned __int8 *)(a3 + v75);
                            BOOL v8 = v76 > v77;
                            if (v76 != v77) {
                              break;
                            }
                            unsigned int v78 = *(unsigned __int16 *)(a4 + 2 * v74);
                            unsigned int v79 = *(unsigned __int16 *)(a4 + 2 * v75);
                            BOOL v8 = v78 > v79;
                            if (v78 != v79) {
                              break;
                            }
                            BOOL result = 0LL;
                            unsigned int v81 = v31 + 8;
                            unsigned int v82 = v32 + 8;
                            if (v81 >= a5) {
                              unsigned int v83 = a5;
                            }
                            else {
                              unsigned int v83 = 0;
                            }
                            unsigned int v31 = v81 - v83;
                            if (v82 >= a5) {
                              unsigned int v84 = a5;
                            }
                            else {
                              unsigned int v84 = 0;
                            }
                            unsigned int v32 = v82 - v84;
                            --*a6;
                            v33 -= 8;
                            if (v33 <= 7) {
                              return result;
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

  return v8;
}

void sub_18114A0F8(int a1)
{
  v2 = (FILE **)MEMORY[0x1895F89D0];
  fprintf( (FILE *)*MEMORY[0x1895F89D0],  "\n \n bzip2/libbzip2: internal error number %d.\n This is a bug in bzip2/libbzip2, %s.\n Please report it to: bzip2-devel@sourceware.org.  If this happened\n when you were using some program which uses libbzip2 as a\n component, you should also report this bug to the author(s)\n of that program.  Please make an effort to report this bug;\n"
    "timely and accurate bug reports eventually lead to higher\n"
    "quality software.  Thanks.\n"
    "\n",
    a1,
    "1.0.8, 13-Jul-2019");
  if (a1 == 1007) {
    fwrite( "\n *** A special note about internal error number 1007 ***\n \n Experience suggests that a common cause of i.e. 1007\n is unreliable memory or other hardware.  The 1007 assertion\n just happens to cross-check the results of huge numbers of\n memory reads/writes, and so acts (unintendedly) as a stress\n test of your memory system.\n \n I suggest the following: try compressing the file again,\n possibly monitoring progress in detail with the -vv flag.\n \n * If the error cannot be reproduced, and/or happens at different\n points in compression, you may have a flaky memory system.\n Try a memory-test program.  I have used Memtest86\n (www.memtest86.com).  At the time of writing it is free (GPLd).\n Memtest86 tests memory much more thorougly than your BIOSs\n power-on test, and may find failures that the BIOS doesn't.\n \n * If the error can be repeatably reproduced, this is a bug in\n bzip2, and I would very much like to hear about it.  Please\n let me know, and, ideally, save a copy of the file causing the\n problem -- without which I will be unable to investigate it.\n \n",  0x420uLL,  1uLL,  *v2);
  }
  exit(3);
}

const char *BZ2_bzlibVersion(void)
{
  return "1.0.8, 13-Jul-2019";
}

int BZ2_bzCompressInit(bz_stream *strm, int blockSize100k, int verbosity, int workFactor)
{
  int result = -2;
  if (strm && (blockSize100k - 10) >= 0xFFFFFFF7 && workFactor <= 0xFA)
  {
    if (workFactor) {
      int v8 = workFactor;
    }
    else {
      int v8 = 30;
    }
    bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
    if (!bzalloc)
    {
      bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_18114A338;
      strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_18114A338;
    }

    if (!strm->bzfree) {
      strm->bzfree = (void (__cdecl *)(void *, void *))sub_18114A344;
    }
    unsigned int v10 = (bz_stream **)bzalloc(strm->opaque, 55768LL, 1LL);
    if (v10)
    {
      unsigned int v11 = v10;
      *unsigned int v10 = strm;
      v10[4] = 0LL;
      v10[5] = 0LL;
      v10[3] = 0LL;
      v10[3] = (bz_stream *)((uint64_t (*)(void *, void, uint64_t))strm->bzalloc)( strm->opaque,  (400000 * blockSize100k),  1LL);
      v11[4] = (bz_stream *)((uint64_t (*)(void *, void, uint64_t))strm->bzalloc)( strm->opaque,  (400000 * blockSize100k + 136),  1LL);
      uint64_t v12 = ((uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc)(strm->opaque, 262148LL, 1LL);
      v11[5] = (bz_stream *)v12;
      unsigned int v13 = v11[3];
      if (v13)
      {
        unsigned int v14 = v11[4];
        if (v14 && v12)
        {
          int result = 0;
          *((_DWORD *)v11 + 166) = blockSize100k;
          v11[1] = (bz_stream *)0x200000002LL;
          *((_DWORD *)v11 + 28) = 100000 * blockSize100k - 19;
          *((_DWORD *)v11 + 164) = verbosity;
          *((_DWORD *)v11 + 22) = v8;
          v11[9] = v13;
          v11[10] = 0LL;
          v11[7] = v13;
          v11[8] = v14;
          strm->state = v11;
          *(void *)&strm->total_in_lo32 = 0LL;
          *(void *)&strm->total_out_lo32 = 0LL;
          *(bz_stream **)((char *)v11 + 92) = (bz_stream *)256;
          *((_DWORD *)v11 + 27) = 0;
          *(bz_stream **)((char *)v11 + 116) = 0LL;
          v11[81] = (bz_stream *)0xFFFFFFFFLL;
          *((_OWORD *)v11 + 8) = 0u;
          *((_OWORD *)v11 + 9) = 0u;
          *((_OWORD *)v11 + 10) = 0u;
          *((_OWORD *)v11 + 11) = 0u;
          *((_OWORD *)v11 + 12) = 0u;
          *((_OWORD *)v11 + 13) = 0u;
          *((_OWORD *)v11 + 14) = 0u;
          *((_OWORD *)v11 + 15) = 0u;
          *((_OWORD *)v11 + 16) = 0u;
          *((_OWORD *)v11 + 17) = 0u;
          *((_OWORD *)v11 + 18) = 0u;
          *((_OWORD *)v11 + 19) = 0u;
          *((_OWORD *)v11 + 20) = 0u;
          *((_OWORD *)v11 + 21) = 0u;
          *((_OWORD *)v11 + 22) = 0u;
          *((_OWORD *)v11 + 23) = 0u;
          *((_DWORD *)v11 + 165) = 1;
          return result;
        }

        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }

      if (v11[4]) {
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      if (v11[5]) {
        ((void (*)(void *))strm->bzfree)(strm->opaque);
      }
      ((void (*)(void *, bz_stream **))strm->bzfree)(strm->opaque, v11);
    }

    return -3;
  }

  return result;
}

void *sub_18114A338(uint64_t a1, int a2, int a3)
{
  return malloc(a3 * a2);
}

void sub_18114A344(int a1, void *a2)
{
  if (a2) {
    free(a2);
  }
}

int BZ2_bzCompress(bz_stream *strm, int action)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  int v5 = *((_DWORD *)state + 2);
  int result = -1;
  while (v5 == 2)
  {
    if (action == 1)
    {
      int v5 = 3;
    }

    else
    {
      if (action != 2)
      {
        int result = -2;
        if (!action)
        {
          else {
            return -2;
          }
        }

        return result;
      }

      int v5 = 4;
    }

    *((_DWORD *)state + 4) = strm->avail_in;
    *((_DWORD *)state + 2) = v5;
  }

  if (v5 == 1) {
    return result;
  }
  if (v5 != 3)
  {
    if (v5 != 4) {
      return 0;
    }
    if (action == 2 && *((_DWORD *)state + 4) == strm->avail_in && sub_18114A4E4((uint64_t)strm))
    {
      if (*((_DWORD *)state + 4)
        || *((_DWORD *)state + 23) <= 0xFFu && *((int *)state + 24) > 0
        || *((_DWORD *)state + 30) < *((_DWORD *)state + 29))
      {
        return 3;
      }

      *((_DWORD *)state + 2) = 1;
      return 4;
    }

    return -1;
  }

  if (action != 1 || *((_DWORD *)state + 4) != strm->avail_in) {
    return -1;
  }
  sub_18114A4E4((uint64_t)strm);
  int result = 2;
  if (*((_DWORD *)state + 30) >= *((_DWORD *)state + 29))
  {
    *((_DWORD *)state + 2) = 2;
    return 1;
  }

  return result;
}

BOOL sub_18114A4E4(uint64_t a1)
{
  int v1 = 0;
  int v2 = 0;
  uint64_t v3 = *(void *)(a1 + 48);
  while (1)
  {
    int v4 = *(_DWORD *)(v3 + 12);
    do
    {
      if (v4 == 2) {
        goto LABEL_27;
      }
    }

    while (v4 != 1);
    int v6 = *(_DWORD *)(v3 + 116);
    int v5 = *(_DWORD *)(v3 + 120);
    if (*(_DWORD *)(*(void *)v3 + 32LL) && v5 < v6)
    {
      unsigned int v9 = *(_BYTE **)(*(void *)v3 + 24LL);
      do
      {
        *unsigned int v9 = *(_BYTE *)(*(void *)(v3 + 80) + v5);
        int v5 = *(_DWORD *)(v3 + 120) + 1;
        *(_DWORD *)(v3 + 120) = v5;
        uint64_t v10 = *(void *)v3;
        int v11 = *(_DWORD *)(*(void *)v3 + 36LL);
        int v12 = *(_DWORD *)(*(void *)v3 + 32LL) - 1;
        unsigned int v9 = (_BYTE *)(*(void *)(*(void *)v3 + 24LL) + 1LL);
        *(void *)(v10 + 24) = v9;
        *(_DWORD *)(v10 + 32) = v12;
        *(_DWORD *)(v10 + 36) = v11 + 1;
        if (v11 == -1) {
          ++*(_DWORD *)(v10 + 40);
        }
        int v6 = *(_DWORD *)(v3 + 116);
        if (v12) {
          BOOL v13 = v5 < v6;
        }
        else {
          BOOL v13 = 0;
        }
      }

      while (v13);
      int v8 = 1;
    }

    else
    {
      int v8 = 0;
    }

    v1 |= v8;
    if (v5 < v6) {
      break;
    }
    int v14 = *(_DWORD *)(v3 + 8);
    *(_DWORD *)(v3 + 108) = 0;
    *(_DWORD *)(v3 + 116) = 0;
    *(_DWORD *)(v3 + 120) = 0;
    *(_DWORD *)(v3 + 648) = -1;
    *(_OWORD *)(v3 + 128) = 0u;
    *(_OWORD *)(v3 + 144) = 0u;
    *(_OWORD *)(v3 + 160) = 0u;
    *(_OWORD *)(v3 + 176) = 0u;
    *(_OWORD *)(v3 + 192) = 0u;
    *(_OWORD *)(v3 + 208) = 0u;
    *(_OWORD *)(v3 + 224) = 0u;
    *(_OWORD *)(v3 + 240) = 0u;
    *(_OWORD *)(v3 + 256) = 0u;
    *(_OWORD *)(v3 + 272) = 0u;
    *(_OWORD *)(v3 + 288) = 0u;
    *(_OWORD *)(v3 + 304) = 0u;
    *(_OWORD *)(v3 + 320) = 0u;
    *(_OWORD *)(v3 + 336) = 0u;
    *(_OWORD *)(v3 + 352) = 0u;
    *(_OWORD *)(v3 + 368) = 0u;
    ++*(_DWORD *)(v3 + 660);
    *(_DWORD *)(v3 + 12) = 2;
    if (v14 == 3)
    {
LABEL_27:
      int v14 = *(_DWORD *)(v3 + 8);
    }

    int v15 = *(_DWORD *)(v3 + 108);
    int v16 = *(_DWORD *)(v3 + 112);
    if (v14 == 2)
    {
      if (v15 < v16 && *(_DWORD *)(*(void *)v3 + 8LL))
      {
        unsigned int v17 = **(unsigned __int8 ***)v3;
        unsigned int v18 = *(_DWORD *)(v3 + 92);
        while (1)
        {
          unsigned int v19 = *v17;
          int v20 = *(_DWORD *)(v3 + 96);
          if (v18 == v19)
          {
            if (v20 == 255) {
              goto LABEL_37;
            }
            *(_DWORD *)(v3 + 96) = v20 + 1;
          }

          else
          {
            if (v20 != 1)
            {
LABEL_37:
              if (v18 <= 0xFF) {
                sub_18114C730(v3);
              }
              *(_DWORD *)(v3 + 92) = v19;
              *(_DWORD *)(v3 + 96) = 1;
              goto LABEL_40;
            }

            *(_DWORD *)(v3 + 648) = dword_1811530F0[v18 ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
            *(_BYTE *)(v3 + v18 + 128) = 1;
            *(_BYTE *)(*(void *)(v3 + 64) + v15) = v18;
            ++*(_DWORD *)(v3 + 108);
            *(_DWORD *)(v3 + 92) = v19;
          }

LABEL_40:
          unsigned int v21 = *(unsigned __int8 ***)v3;
          unsigned int v17 = (unsigned __int8 *)(**(void **)v3 + 1LL);
          *unsigned int v21 = v17;
          int v22 = *((_DWORD *)v21 + 3);
          int v23 = *((_DWORD *)v21 + 2) - 1;
          *((_DWORD *)v21 + 2) = v23;
          *((_DWORD *)v21 + 3) = v22 + 1;
          if (v22 == -1) {
            ++*((_DWORD *)v21 + 4);
          }
          int v15 = *(_DWORD *)(v3 + 108);
          int v16 = *(_DWORD *)(v3 + 112);
          int v24 = 1;
          if (v15 < v16)
          {
            unsigned int v18 = v19;
            if (v23) {
              continue;
            }
          }

          goto LABEL_63;
        }
      }
    }

    else if (v15 < v16)
    {
      unsigned int v25 = *(unsigned __int8 ***)v3;
      int v24 = *(_DWORD *)(*(void *)v3 + 8LL);
      if (!v24) {
        goto LABEL_63;
      }
      int v24 = *(_DWORD *)(v3 + 16);
      if (!v24) {
        goto LABEL_63;
      }
      while (2)
      {
        int v26 = **v25;
        uint64_t v27 = *(unsigned int *)(v3 + 92);
        int v28 = *(_DWORD *)(v3 + 96);
        if ((_DWORD)v27 == v26)
        {
          if (v28 != 255)
          {
            *(_DWORD *)(v3 + 96) = v28 + 1;
            goto LABEL_56;
          }

LABEL_53:
          *(_DWORD *)(v3 + 92) = v26;
          *(_DWORD *)(v3 + 96) = 1;
        }

        else
        {
          if (v28 != 1) {
            goto LABEL_53;
          }
          *(_DWORD *)(v3 + 648) = dword_1811530F0[*(_DWORD *)(v3 + 92) ^ HIBYTE(*(_DWORD *)(v3 + 648))] ^ (*(_DWORD *)(v3 + 648) << 8);
          *(_BYTE *)(v3 + v27 + 128) = 1;
          *(_BYTE *)(*(void *)(v3 + 64) + v15) = v27;
          ++*(_DWORD *)(v3 + 108);
          *(_DWORD *)(v3 + 92) = v26;
        }

LABEL_56:
        unsigned int v25 = *(unsigned __int8 ***)v3;
        *unsigned int v25 = (unsigned __int8 *)(**(void **)v3 + 1LL);
        int v29 = *((_DWORD *)v25 + 3);
        int v30 = *((_DWORD *)v25 + 2) - 1;
        *((_DWORD *)v25 + 2) = v30;
        *((_DWORD *)v25 + 3) = v29 + 1;
        if (v29 == -1) {
          ++*((_DWORD *)v25 + 4);
        }
        int v31 = *(_DWORD *)(v3 + 16) - 1;
        *(_DWORD *)(v3 + 16) = v31;
        int v15 = *(_DWORD *)(v3 + 108);
        int v16 = *(_DWORD *)(v3 + 112);
        int v24 = 1;
        if (v15 >= v16 || !v30 || !v31) {
          goto LABEL_63;
        }
        continue;
      }
    }

    int v24 = 0;
LABEL_63:
    v2 |= v24;
    int v32 = *(_DWORD *)(v3 + 8);
    if (v32 == 2 || *(_DWORD *)(v3 + 16))
    {
      if (v15 >= v16)
      {
        BOOL v33 = 0;
        goto LABEL_72;
      }

      if (!*(_DWORD *)(*(void *)v3 + 8LL)) {
        return (v2 | v1) != 0;
      }
    }

    else
    {
      if (*(_DWORD *)(v3 + 92) <= 0xFFu)
      {
        sub_18114C730(v3);
        int v32 = *(_DWORD *)(v3 + 8);
      }

      *(void *)(v3 + 92) = 256LL;
      BOOL v33 = v32 == 4;
LABEL_72:
      sub_18114C87C(v3, v33);
      *(_DWORD *)(v3 + 12) = 1;
    }
  }

  return (v2 | v1) != 0;
}

int BZ2_bzCompressEnd(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  if (state[3]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[4]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[5]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  int result = 0;
  strm->state = 0LL;
  return result;
}

int BZ2_bzDecompressInit(bz_stream *strm, int verbosity, int small)
{
  int result = -2;
  if (verbosity <= 4)
  {
    if (strm)
    {
      char v5 = small;
      if (small <= 1)
      {
        bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))strm->bzalloc;
        if (!bzalloc)
        {
          bzalloc = (uint64_t (*)(void *, uint64_t, uint64_t))sub_18114A338;
          strm->bzalloc = (void *(__cdecl *)(void *, int, int))sub_18114A338;
        }

        if (!strm->bzfree) {
          strm->bzfree = (void (__cdecl *)(void *, void *))sub_18114A344;
        }
        uint64_t v8 = bzalloc(strm->opaque, 64144LL, 1LL);
        if (v8)
        {
          uint64_t v9 = v8;
          int result = 0;
          *(_DWORD *)(v9 + 8) = 10;
          *(void *)uint64_t v9 = strm;
          strm->state = (void *)v9;
          *(void *)(v9 + 32) = 0LL;
          *(_DWORD *)(v9 + 3188) = 0;
          *(void *)&strm->total_in_lo32 = 0LL;
          *(void *)&strm->total_out_lo32 = 0LL;
          *(_BYTE *)(v9 + 44) = v5;
          *(void *)(v9 + 3152) = 0LL;
          *(void *)(v9 + 3168) = 0LL;
          *(void *)(v9 + 3160) = 0LL;
          *(_DWORD *)(v9 + 48) = 0;
          *(_DWORD *)(v9 + 52) = verbosity;
        }

        else
        {
          return -3;
        }
      }
    }
  }

  return result;
}

uint64_t sub_18114AA38(int a1, uint64_t a2)
{
  LODWORD(result) = 0;
  int v4 = 256;
  do
  {
    int v5 = ((int)result + v4) >> 1;
    if (*(_DWORD *)(a2 + 4LL * v5) <= a1)
    {
      uint64_t result = v5;
    }

    else
    {
      int v4 = ((int)result + v4) >> 1;
      uint64_t result = result;
    }
  }

  while (v4 - (_DWORD)result != 1);
  return result;
}

int BZ2_bzDecompress(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = strm->state;
  if (!state || *(bz_stream **)state != strm) {
    return -2;
  }
  unsigned int v7 = state + 16020;
  uint64_t v8 = (char *)(state + 274);
  int v9 = state[2];
  uint64_t v10 = dword_18C54B0D8;
  int v11 = (FILE **)MEMORY[0x1895F89D0];
  while (1)
  {
    if (v9 == 1) {
      return -1;
    }
    if (v9 == 2) {
      break;
    }
    if (v9 >= 10)
    {
LABEL_238:
      int result = sub_18114FCBC((uint64_t **)state);
      if (result == 4)
      {
        if (state[797] == state[795]) {
          return 4;
        }
        else {
          return -4;
        }
      }

      int v9 = 2;
      if (state[2] != 2) {
        return result;
      }
    }
  }

  int v12 = *(uint64_t **)state;
  BOOL v13 = *(int8x16_t **)(*(void *)state + 24LL);
  if (*((_BYTE *)state + 44))
  {
    int v14 = *((_DWORD *)v12 + 8);
    if (*((_BYTE *)state + 20))
    {
      if (v14)
      {
        int v15 = state[4];
        while (1)
        {
          while (v15)
          {
            *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
            int v15 = state[4] - 1;
            state[4] = v15;
            int v12 = *(uint64_t **)state;
            v12[3] = *(void *)(*(void *)state + 24LL) + 1LL;
            int v60 = *((_DWORD *)v12 + 9);
            int v61 = *((_DWORD *)v12 + 8) - 1;
            *((_DWORD *)v12 + 8) = v61;
            *((_DWORD *)v12 + 9) = v60 + 1;
            if (v60 == -1) {
              ++*((_DWORD *)v12 + 10);
            }
            int v62 = 1;
            if (!v61) {
              goto LABEL_224;
            }
          }

          int v16 = state[273];
          int v17 = *v7;
          int v18 = *v7 + 1;
          if (v16 == v18) {
            goto LABEL_191;
          }
          if (v16 > v18) {
            break;
          }
          state[4] = 1;
          unint64_t v20 = state[15];
          int v19 = state[16];
          *((_BYTE *)state + 12) = v19;
          unsigned int v21 = 100000 * state[10];
          int v22 = 0;
          int v23 = 256;
          do
          {
            else {
              int v23 = (v22 + v23) >> 1;
            }
          }

          while (v23 - v22 != 1);
          uint64_t v24 = *((void *)state + 395);
          int v25 = *(unsigned __int16 *)(v24 + 2 * v20);
          uint64_t v26 = *((void *)state + 396);
          unint64_t v27 = v25 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v20 >> 1)) >> (4 * (v20 & 1))) & 0xF) << 16);
          state[15] = v27;
          int v28 = state[6];
          if (!v28)
          {
            uint64_t v29 = (int)state[7];
            int v28 = v10[v29];
            if ((_DWORD)v29 == 511) {
              int v30 = 0;
            }
            else {
              int v30 = v29 + 1;
            }
            state[7] = v30;
          }

          int v31 = v28 - 1;
          state[6] = v28 - 1;
          state[273] = v16 + 1;
          if (v16 != v17)
          {
            int v32 = v22 ^ (v31 == 1);
            if (v32 == v19)
            {
              state[4] = 2;
              int v33 = 0;
              int v34 = 256;
              do
              {
                else {
                  int v34 = (v33 + v34) >> 1;
                }
              }

              while (v34 - v33 != 1);
              int v35 = *(unsigned __int16 *)(v24 + 2LL * v27);
              unint64_t v36 = v35 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v26 + (v27 >> 1)) >> (4 * (v25 & 1))) & 0xF) << 16);
              state[15] = v36;
              if (v28 == 1)
              {
                uint64_t v37 = (int)state[7];
                int v31 = v10[v37];
                if ((_DWORD)v37 == 511) {
                  int v38 = 0;
                }
                else {
                  int v38 = v37 + 1;
                }
                state[7] = v38;
              }

              int v39 = v31 - 1;
              state[6] = v31 - 1;
              state[273] = v16 + 2;
              if (v16 + 1 != v17)
              {
                int v40 = v33 ^ (v39 == 1);
                if (v40 == v19)
                {
                  state[4] = 3;
                  int v41 = 0;
                  int v42 = 256;
                  do
                  {
                    else {
                      int v42 = (v41 + v42) >> 1;
                    }
                  }

                  while (v42 - v41 != 1);
                  unsigned __int16 v43 = *(_WORD *)(v24 + 2LL * v36);
                  unint64_t v44 = v43 | (((*(unsigned __int8 *)(v26 + (v36 >> 1)) >> (4 * (v35 & 1))) & 0xFu) << 16);
                  state[15] = v44;
                  if (!v39)
                  {
                    uint64_t v45 = (int)state[7];
                    int v39 = v10[v45];
                    if ((_DWORD)v45 == 511) {
                      int v46 = 0;
                    }
                    else {
                      int v46 = v45 + 1;
                    }
                    state[7] = v46;
                  }

                  int v47 = v39 - 1;
                  state[6] = v39 - 1;
                  state[273] = v16 + 3;
                  if (v16 + 2 != v17)
                  {
                    int v48 = v41 ^ (v47 == 1);
                    if (v48 == v19)
                    {
                      int v49 = 0;
                      int v50 = 256;
                      do
                      {
                        else {
                          int v50 = (v49 + v50) >> 1;
                        }
                      }

                      while (v50 - v49 != 1);
                      unsigned __int16 v51 = *(_WORD *)(v24 + 2LL * v44);
                      unint64_t v52 = v51 | (((*(unsigned __int8 *)(v26 + (v44 >> 1)) >> (4 * (v43 & 1))) & 0xFu) << 16);
                      state[15] = v52;
                      if (!v47)
                      {
                        uint64_t v53 = (int)state[7];
                        int v47 = v10[v53];
                        if ((_DWORD)v53 == 511) {
                          int v54 = 0;
                        }
                        else {
                          int v54 = v53 + 1;
                        }
                        state[7] = v54;
                      }

                      int v55 = v47 - 1;
                      state[6] = v47 - 1;
                      state[273] = v16 + 4;
                      state[4] = (v49 ^ (v47 == 2)) + 4;
                      int v56 = 0;
                      int v57 = 256;
                      do
                      {
                        else {
                          int v57 = (v56 + v57) >> 1;
                        }
                      }

                      while (v57 - v56 != 1);
                      state[16] = v56;
                      state[15] = *(unsigned __int16 *)(v24 + 2LL * v52) | (((*(unsigned __int8 *)(v26 + (v52 >> 1)) >> (4 * (v51 & 1))) & 0xF) << 16);
                      if (v47 == 1)
                      {
                        uint64_t v58 = (int)state[7];
                        int v55 = v10[v58];
                        if ((_DWORD)v58 == 511) {
                          int v59 = 0;
                        }
                        else {
                          int v59 = v58 + 1;
                        }
                        state[7] = v59;
                      }

                      state[6] = v55 - 1;
                      state[16] = v56 ^ (v55 == 2);
                      state[273] = v16 + 5;
                    }

                    else
                    {
                      state[16] = v48;
                    }
                  }
                }

                else
                {
                  state[16] = v40;
                }
              }
            }

            else
            {
              state[16] = v32;
            }
          }

          int v15 = 1;
          if (!*((_DWORD *)v12 + 8)) {
            goto LABEL_191;
          }
        }

LABEL_192:
        int v62 = 0;
        goto LABEL_224;
      }
    }

    else if (v14)
    {
      int v101 = state[4];
      do
      {
        while (v101)
        {
          *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
          int v101 = state[4] - 1;
          state[4] = v101;
          int v12 = *(uint64_t **)state;
          v12[3] = *(void *)(*(void *)state + 24LL) + 1LL;
          int v128 = *((_DWORD *)v12 + 9);
          int v129 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v129;
          *((_DWORD *)v12 + 9) = v128 + 1;
          if (v128 == -1) {
            ++*((_DWORD *)v12 + 10);
          }
          int v62 = 1;
          if (!v129) {
            goto LABEL_224;
          }
        }

        int v102 = state[273];
        int v103 = *v7;
        int v104 = *v7 + 1;
        if (v102 == v104) {
          break;
        }
        if (v102 > v104) {
          goto LABEL_192;
        }
        state[4] = 1;
        unint64_t v106 = state[15];
        int v105 = state[16];
        *((_BYTE *)state + 12) = v105;
        unsigned int v107 = 100000 * state[10];
        int v108 = 0;
        int v109 = 256;
        do
        {
          else {
            int v109 = (v108 + v109) >> 1;
          }
        }

        while (v109 - v108 != 1);
        uint64_t v110 = *((void *)state + 395);
        int v111 = *(unsigned __int16 *)(v110 + 2 * v106);
        uint64_t v112 = *((void *)state + 396);
        unint64_t v113 = v111 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v106 >> 1)) >> (4 * (v106 & 1))) & 0xF) << 16);
        state[15] = v113;
        state[273] = v102 + 1;
        if (v102 != v103)
        {
          if (v108 == v105)
          {
            state[4] = 2;
            int v114 = 0;
            int v115 = 256;
            do
            {
              else {
                int v115 = (v114 + v115) >> 1;
              }
            }

            while (v115 - v114 != 1);
            unsigned __int16 v116 = *(_WORD *)(v110 + 2LL * v113);
            unint64_t v117 = v116 | (((*(unsigned __int8 *)(v112 + (v113 >> 1)) >> (4 * (v111 & 1))) & 0xFu) << 16);
            state[15] = v117;
            state[273] = v102 + 2;
            if (v102 + 1 != v103)
            {
              if (v114 == v105)
              {
                state[4] = 3;
                int v118 = 0;
                int v119 = 256;
                do
                {
                  else {
                    int v119 = (v118 + v119) >> 1;
                  }
                }

                while (v119 - v118 != 1);
                int v120 = *(unsigned __int16 *)(v110 + 2LL * v117);
                unint64_t v121 = v120 & 0xFFF0FFFF | (((*(unsigned __int8 *)(v112 + (v117 >> 1)) >> (4 * (v116 & 1))) & 0xF) << 16);
                state[15] = v121;
                state[273] = v102 + 3;
                if (v102 + 2 != v103)
                {
                  if (v118 == v105)
                  {
                    int v122 = 0;
                    int v123 = 256;
                    do
                    {
                      else {
                        int v123 = (v122 + v123) >> 1;
                      }
                    }

                    while (v123 - v122 != 1);
                    unsigned __int16 v124 = *(_WORD *)(v110 + 2LL * v121);
                    unint64_t v125 = v124 | (((*(unsigned __int8 *)(v112 + (v121 >> 1)) >> (4 * (v120 & 1))) & 0xFu) << 16);
                    state[15] = v125;
                    state[273] = v102 + 4;
                    state[4] = v122 + 4;
                    int v126 = 0;
                    int v127 = 256;
                    do
                    {
                      else {
                        int v127 = (v126 + v127) >> 1;
                      }
                    }

                    while (v127 - v126 != 1);
                    state[16] = v126;
                    state[15] = *(unsigned __int16 *)(v110 + 2LL * v125) | (((*(unsigned __int8 *)(v112 + (v125 >> 1)) >> (4 * (v124 & 1))) & 0xF) << 16);
                    state[273] = v102 + 5;
                  }

                  else
                  {
                    state[16] = v118;
                  }
                }
              }

              else
              {
                state[16] = v114;
              }
            }
          }

          else
          {
            state[16] = v108;
          }
        }

        int v101 = 1;
      }

      while (*((_DWORD *)v12 + 8));
    }

LABEL_191:
    int v62 = 1;
    goto LABEL_224;
  }

  if (*((_BYTE *)state + 20))
  {
    if (*((_DWORD *)v12 + 8))
    {
      int v63 = state[4];
      while (1)
      {
        while (v63)
        {
          *(_BYTE *)v12[3] = *((_BYTE *)state + 12);
          int v63 = state[4] - 1;
          state[4] = v63;
          int v12 = *(uint64_t **)state;
          v12[3] = *(void *)(*(void *)state + 24LL) + 1LL;
          int v99 = *((_DWORD *)v12 + 9);
          int v100 = *((_DWORD *)v12 + 8) - 1;
          *((_DWORD *)v12 + 8) = v100;
          *((_DWORD *)v12 + 9) = v99 + 1;
          if (v99 == -1) {
            ++*((_DWORD *)v12 + 10);
          }
          int v62 = 1;
          if (!v100) {
            goto LABEL_224;
          }
        }

        int v64 = state[273];
        int v65 = *v7;
        int v66 = *v7 + 1;
        if (v64 == v66) {
          goto LABEL_191;
        }
        if (v64 > v66) {
          goto LABEL_192;
        }
        state[4] = 1;
        uint64_t v68 = state[15];
        int v67 = state[16];
        *((_BYTE *)state + 12) = v67;
        unsigned int v69 = 100000 * state[10];
        uint64_t v70 = *((void *)state + 394);
        unint64_t v71 = *(unsigned int *)(v70 + 4 * v68);
        unint64_t v72 = v71 >> 8;
        state[15] = *(_DWORD *)(v70 + 4 * v68) >> 8;
        int v73 = state[6];
        if (!v73)
        {
          uint64_t v74 = (int)state[7];
          int v73 = v10[v74];
          if ((_DWORD)v74 == 511) {
            int v75 = 0;
          }
          else {
            int v75 = v74 + 1;
          }
          state[7] = v75;
        }

        int v76 = v73 - 1;
        state[6] = v73 - 1;
        state[273] = v64 + 1;
        if (v64 != v65)
        {
          int v77 = v71 ^ (v76 == 1);
          if (v77 == v67)
          {
            state[4] = 2;
            unint64_t v78 = *(unsigned int *)(v70 + 4 * v72);
            unint64_t v79 = v78 >> 8;
            state[15] = *(_DWORD *)(v70 + 4 * v72) >> 8;
            if (v73 == 1)
            {
              uint64_t v80 = (int)state[7];
              int v76 = v10[v80];
              if ((_DWORD)v80 == 511) {
                int v81 = 0;
              }
              else {
                int v81 = v80 + 1;
              }
              state[7] = v81;
            }

            int v82 = v76 - 1;
            state[6] = v82;
            state[273] = v64 + 2;
            if (v64 + 1 != v65)
            {
              int v83 = v78 ^ (v82 == 1);
              if (v83 == v67)
              {
                state[4] = 3;
                unint64_t v84 = *(unsigned int *)(v70 + 4 * v79);
                unint64_t v85 = v84 >> 8;
                state[15] = *(_DWORD *)(v70 + 4 * v79) >> 8;
                if (!v82)
                {
                  uint64_t v86 = (int)state[7];
                  int v82 = v10[v86];
                  if ((_DWORD)v86 == 511) {
                    int v87 = 0;
                  }
                  else {
                    int v87 = v86 + 1;
                  }
                  state[7] = v87;
                }

                int v88 = v82 - 1;
                state[6] = v82 - 1;
                state[273] = v64 + 3;
                if (v64 + 2 != v65)
                {
                  int v89 = v84 ^ (v88 == 1);
                  if (v89 == v67)
                  {
                    unint64_t v90 = *(unsigned int *)(v70 + 4 * v85);
                    unint64_t v91 = v90 >> 8;
                    state[15] = v90 >> 8;
                    if (v82 == 1)
                    {
                      uint64_t v92 = (int)state[7];
                      int v88 = v10[v92];
                      if ((_DWORD)v92 == 511) {
                        int v93 = 0;
                      }
                      else {
                        int v93 = v92 + 1;
                      }
                      state[7] = v93;
                    }

                    int v94 = v88 - 1;
                    state[6] = v88 - 1;
                    state[273] = v64 + 4;
                    state[4] = (v90 ^ (v88 == 2)) + 4;
                    unsigned int v95 = *(_DWORD *)(v70 + 4 * v91);
                    int v96 = v95;
                    state[15] = v95 >> 8;
                    state[16] = v95;
                    if (v88 == 1)
                    {
                      uint64_t v97 = (int)state[7];
                      int v94 = v10[v97];
                      if ((_DWORD)v97 == 511) {
                        int v98 = 0;
                      }
                      else {
                        int v98 = v97 + 1;
                      }
                      state[7] = v98;
                    }

                    state[6] = v94 - 1;
                    state[16] = v96 ^ (v94 == 2);
                    state[273] = v64 + 5;
                  }

                  else
                  {
                    state[16] = v89;
                  }
                }
              }

              else
              {
                state[16] = v83;
              }
            }
          }

          else
          {
            state[16] = v77;
          }
        }

        int v63 = 1;
        if (!*((_DWORD *)v12 + 8)) {
          goto LABEL_191;
        }
      }
    }

    goto LABEL_191;
  }

  char v130 = *((_BYTE *)state + 12);
  int v131 = state[4];
  int v132 = state[273];
  uint64_t v133 = *((void *)state + 394);
  LODWORD(v134) = state[15];
  unint64_t v135 = state[16];
  int v136 = *((_DWORD *)v12 + 8);
  int v137 = *v7;
  int v138 = *v7 + 1;
  unsigned int v139 = 100000 * state[10];
  v140 = *(_BYTE **)(*(void *)state + 24LL);
  int v141 = v136;
LABEL_194:
  if (v131 < 1)
  {
    while (1)
    {
      int v143 = v132;
      unint64_t v144 = v135;
      if (v132 > v138) {
        goto LABEL_223;
      }
      if (v132 == v138)
      {
        int v131 = 0;
        int v132 = v137 + 1;
        goto LABEL_219;
      }

      unint64_t v135 = *(unsigned int *)(v133 + 4LL * v134);
      unint64_t v134 = v135 >> 8;
      ++v132;
      unint64_t v135 = v135;
      if (v135 == (_DWORD)v144)
      {
        if (v143 != v137)
        {
          unint64_t v145 = *(unsigned int *)(v133 + 4 * v134);
          unint64_t v134 = v145 >> 8;
          int v131 = 2;
          int v132 = v137 + 1;
          unint64_t v135 = v144;
          char v130 = v144;
          if (v143 + 2 != v138)
          {
            unint64_t v135 = v145;
            int v132 = v143 + 2;
            char v130 = v144;
            if (v145 == (_DWORD)v144)
            {
              if (v134 >= v139)
              {
LABEL_223:
                int v62 = 0;
                int v12 = *(uint64_t **)state;
                goto LABEL_224;
              }

              unint64_t v146 = *(unsigned int *)(v133 + 4 * v134);
              unint64_t v147 = v146 >> 8;
              int v131 = 3;
              int v132 = v137 + 1;
              unint64_t v135 = v144;
              unint64_t v134 = v146 >> 8;
              char v130 = v144;
              if (v143 + 3 != v138)
              {
                unint64_t v135 = v146;
                int v132 = v143 + 3;
                unint64_t v134 = v146 >> 8;
                char v130 = v144;
                if (v146 == (_DWORD)v144)
                {
                  if (v147 < v139 && *(_DWORD *)(v133 + 4 * v147) >> 8 < v139)
                  {
                    int v131 = *(_DWORD *)(v133 + 4 * v147) + 4;
                    unsigned int v148 = *(_DWORD *)(v133 + 4 * ((unint64_t)*(unsigned int *)(v133 + 4 * v147) >> 8));
                    unint64_t v135 = v148;
                    LODWORD(v134) = v148 >> 8;
                    int v132 = v143 + 5;
                    char v130 = v144;
                    goto LABEL_194;
                  }

                  goto LABEL_223;
                }
              }
            }
          }

          goto LABEL_194;
        }

        unint64_t v135 = v144;
      }

      char v130 = v144;
LABEL_201:
      if (!v141)
      {
        int v131 = 1;
        goto LABEL_219;
      }

      *v140++ = v130;
      --v141;
    }
  }

  if (v141)
  {
    uint64_t v142 = 0LL;
    do
    {
      if (v131 - 1 == (_DWORD)v142)
      {
        v141 -= v142;
        v140 += v142;
        goto LABEL_201;
      }

      v140[v142++] = v130;
    }

    while (v141 != (_DWORD)v142);
    int v141 = 0;
    v140 += v142;
    v131 -= v142;
  }

LABEL_219:
  int v12 = *(uint64_t **)state;
  int v149 = *(_DWORD *)(*(void *)state + 36LL);
  int v150 = v136 - v141;
  *(_DWORD *)(*(void *)state + 36LL) = v149 + v150;
  if (__CFADD__(v149, v150)) {
    ++*((_DWORD *)v12 + 10);
  }
  *((_BYTE *)state + 12) = v130;
  state[4] = v131;
  state[273] = v132;
  *((void *)state + 394) = v133;
  state[15] = v134;
  state[16] = v135;
  v12[3] = (uint64_t)v140;
  int v62 = 1;
  *((_DWORD *)v12 + 8) = v141;
LABEL_224:
  v151 = v10;
  int v152 = v12[3] - (_DWORD)v13;
  if (v152 >= 16)
  {
    sub_181152880(state[796], v13, v152 & 0xFFFFFFF0, v1, v2, v3, v4);
    state[796] = v153;
    BOOL v13 = (int8x16_t *)((char *)v13 + (v152 & 0xFFFFFFF0));
    v152 &= 0xFu;
  }

  if (v152)
  {
    unsigned int v154 = state[796];
    do
    {
      int v155 = v13->u8[0];
      BOOL v13 = (int8x16_t *)((char *)v13 + 1);
      unsigned int v154 = dword_1811530F0[v155 ^ HIBYTE(v154)] ^ (v154 << 8);
      state[796] = v154;
      --v152;
    }

    while (v152);
  }

  if (!v62) {
    return -4;
  }
  if (state[273] != *v7 + 1 || state[4]) {
    return 0;
  }
  int v156 = ~state[796];
  state[796] = v156;
  int v157 = state[13];
  if (v157 > 2)
  {
    fprintf(*v11, " {0x%08x, 0x%08x}", state[794], v156);
    int v157 = state[13];
  }

  uint64_t v10 = v151;
  if (v157 >= 2) {
    fputc(93, *v11);
  }
  int v158 = state[796];
  if (v158 == state[794])
  {
    state[797] = v158 ^ __ROR4__(state[797], 31);
    state[2] = 14;
    goto LABEL_238;
  }

  return -4;
}

int BZ2_bzDecompressEnd(bz_stream *strm)
{
  if (!strm) {
    return -2;
  }
  state = (bz_stream **)strm->state;
  if (!state || *state != strm) {
    return -2;
  }
  if (state[394]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[395]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  if (state[396]) {
    ((void (*)(void *))strm->bzfree)(strm->opaque);
  }
  ((void (*)(void *, void *))strm->bzfree)(strm->opaque, strm->state);
  int result = 0;
  strm->state = 0LL;
  return result;
}

BZFILE *__cdecl BZ2_bzWriteOpen(int *bzerror, FILE *f, int blockSize100k, int verbosity, int workFactor)
{
  if (bzerror) {
    *bzerror = 0;
  }
  if (verbosity > 4
    || !f
    || (blockSize100k - 10) < 0xFFFFFFF7
    || workFactor >= 0xFB)
  {
    if (bzerror)
    {
      uint64_t v10 = 0LL;
      int v11 = -2;
      goto LABEL_12;
    }

    return 0LL;
  }

  if (!ferror(f))
  {
    int v12 = (char *)malloc(0x13F0uLL);
    if (v12)
    {
      uint64_t v10 = v12;
      BOOL v13 = v12 + 5012;
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)v12 + 1274) = 0;
      v12[5100] = 0;
      *((_DWORD *)v12 + 1252) = 0;
      *(void *)int v12 = f;
      *BOOL v13 = 1;
      int v14 = (bz_stream *)(v12 + 5016);
      if (workFactor) {
        int v15 = workFactor;
      }
      else {
        int v15 = 30;
      }
      *((void *)v10 + 634) = 0LL;
      *((void *)v10 + 636) = 0LL;
      *((void *)v10 + 635) = 0LL;
      int v16 = BZ2_bzCompressInit(v14, blockSize100k, verbosity, v15);
      if (!v16)
      {
        *((_DWORD *)v10 + 1256) = 0;
        v13[88] = 1;
        return v10;
      }

      if (bzerror) {
        *bzerror = v16;
      }
      free(v10);
    }

    else if (bzerror)
    {
      uint64_t v10 = 0LL;
      int v11 = -3;
      goto LABEL_12;
    }

    return 0LL;
  }

  if (!bzerror) {
    return 0LL;
  }
  uint64_t v10 = 0LL;
  int v11 = -6;
LABEL_12:
  *bzerror = v11;
  return v10;
}

void BZ2_bzWrite(int *bzerror, BZFILE *b, void *buf, int len)
{
  if (bzerror) {
    *bzerror = 0;
  }
  if (b && (*((_DWORD *)b + 1274) = 0, buf) && (len & 0x80000000) == 0)
  {
    if (!*((_BYTE *)b + 5012))
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v8 = -1;
      goto LABEL_18;
    }

    if (ferror(*(FILE **)b))
    {
LABEL_8:
      if (bzerror) {
        *bzerror = -6;
      }
      int v8 = -6;
      goto LABEL_18;
    }

    if (len)
    {
      *((_DWORD *)b + 1256) = len;
      *((void *)b + 627) = buf;
      while (1)
      {
        *((_DWORD *)b + 1262) = 5000;
        *((void *)b + 630) = (char *)b + 8;
        int v9 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 0);
        if (v9 != 1) {
          break;
        }
        uint64_t v10 = *((unsigned int *)b + 1262);
        if (v10 >> 3 <= 0x270
          && (5000 - (_DWORD)v10 != fwrite((char *)b + 8, 1uLL, 5000 - v10, *(FILE **)b)
           || ferror(*(FILE **)b)))
        {
          goto LABEL_8;
        }

        if (!*((_DWORD *)b + 1256)) {
          goto LABEL_27;
        }
      }

      if (bzerror) {
        *bzerror = v9;
      }
      *((_DWORD *)b + 1274) = v9;
    }

    else
    {
LABEL_27:
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)b + 1274) = 0;
    }
  }

  else
  {
    if (bzerror) {
      *bzerror = -2;
    }
    if (b)
    {
      int v8 = -2;
LABEL_18:
      *((_DWORD *)b + 1274) = v8;
    }
  }

void BZ2_bzWriteClose(int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in, unsigned int *nbytes_out)
{
}

void BZ2_bzWriteClose64( int *bzerror, BZFILE *b, int abandon, unsigned int *nbytes_in_lo32, unsigned int *nbytes_in_hi32, unsigned int *nbytes_out_lo32, unsigned int *nbytes_out_hi32)
{
  if (b)
  {
    if (!*((_BYTE *)b + 5012))
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v15 = -1;
      goto LABEL_12;
    }

    int v14 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_4:
      if (bzerror) {
        *bzerror = -6;
      }
      int v15 = -6;
LABEL_12:
      *((_DWORD *)b + 1274) = v15;
      return;
    }

    if (nbytes_in_lo32) {
      *nbytes_in_lo32 = 0;
    }
    if (nbytes_in_hi32) {
      *nbytes_in_hi32 = 0;
    }
    if (nbytes_out_lo32) {
      *nbytes_out_lo32 = 0;
    }
    if (nbytes_out_hi32) {
      *nbytes_out_hi32 = 0;
    }
    if (abandon) {
      goto LABEL_25;
    }
    if (*((_DWORD *)b + 1274))
    {
LABEL_24:
      if (!ferror(v14))
      {
        fflush(v14);
        if (ferror(*(FILE **)b)) {
          goto LABEL_4;
        }
      }

LABEL_25:
      if (nbytes_in_lo32) {
        *nbytes_in_lo32 = *((_DWORD *)b + 1257);
      }
      if (nbytes_in_hi32) {
        *nbytes_in_hi32 = *((_DWORD *)b + 1258);
      }
      if (nbytes_out_lo32) {
        *nbytes_out_lo32 = *((_DWORD *)b + 1263);
      }
      if (nbytes_out_hi32) {
        *nbytes_out_hi32 = *((_DWORD *)b + 1264);
      }
      if (bzerror) {
        *bzerror = 0;
      }
      *((_DWORD *)b + 1274) = 0;
      BZ2_bzCompressEnd((bz_stream *)((char *)b + 5016));
      free(b);
      return;
    }

    while (1)
    {
      *((_DWORD *)b + 1262) = 5000;
      *((void *)b + 630) = (char *)b + 8;
      int v16 = BZ2_bzCompress((bz_stream *)((char *)b + 5016), 2);
      int v17 = v16;
      uint64_t v18 = *((unsigned int *)b + 1262);
      if (v18 >> 3 <= 0x270
        && (5000 - (_DWORD)v18 != fwrite((char *)b + 8, 1uLL, 5000 - v18, *(FILE **)b)
         || ferror(*(FILE **)b)))
      {
        goto LABEL_4;
      }

      if (v17 == 4)
      {
        int v14 = *(FILE **)b;
        goto LABEL_24;
      }
    }

    if (bzerror) {
      *bzerror = v16;
    }
    *((_DWORD *)b + 1274) = v16;
  }

  else if (bzerror)
  {
    *bzerror = 0;
  }

BZFILE *__cdecl BZ2_bzReadOpen(int *bzerror, FILE *f, int verbosity, int small, void *unused, int nUnused)
{
  unsigned int v7 = (char *)unused;
  if (bzerror) {
    *bzerror = 0;
  }
  if (f
    && verbosity <= 4
    && small <= 1
    && (unused || !nUnused)
    && (!unused || nUnused < 0x1389))
  {
    if (ferror(f))
    {
      if (bzerror)
      {
        int v12 = 0LL;
        int v13 = -6;
        goto LABEL_12;
      }
    }

    else
    {
      int v14 = (char *)malloc(0x13F0uLL);
      if (v14)
      {
        int v12 = v14;
        int v15 = v14 + 5012;
        if (bzerror) {
          *bzerror = 0;
        }
        *((_DWORD *)v14 + 1274) = 0;
        v14[5100] = 0;
        *(void *)int v14 = f;
        *((_DWORD *)v14 + 1252) = 0;
        *int v15 = 0;
        int v16 = (bz_stream *)(v14 + 5016);
        *((void *)v12 + 634) = 0LL;
        *((void *)v12 + 636) = 0LL;
        *((void *)v12 + 635) = 0LL;
        if (nUnused >= 1)
        {
          int v17 = 0;
          unsigned int v18 = nUnused + 1;
          do
          {
            char v19 = *v7++;
            v12[v17 + 8] = v19;
            int v17 = *((_DWORD *)v12 + 1252) + 1;
            *((_DWORD *)v12 + 1252) = v17;
            --v18;
          }

          while (v18 > 1);
        }

        int v20 = BZ2_bzDecompressInit(v16, verbosity, small);
        if (!v20)
        {
          *((_DWORD *)v12 + 1256) = *((_DWORD *)v12 + 1252);
          *((void *)v12 + 627) = v12 + 8;
          v15[88] = 1;
          return v12;
        }

        if (bzerror) {
          *bzerror = v20;
        }
        free(v12);
      }

      else if (bzerror)
      {
        int v12 = 0LL;
        int v13 = -3;
        goto LABEL_12;
      }
    }

    return 0LL;
  }

  if (!bzerror) {
    return 0LL;
  }
  int v12 = 0LL;
  int v13 = -2;
LABEL_12:
  *bzerror = v13;
  return v12;
}

void BZ2_bzReadClose(int *bzerror, BZFILE *b)
{
  int8x16_t v3 = (char *)b + 5012;
  if (bzerror)
  {
    *bzerror = 0;
    if (!b) {
      return;
    }
    *((_DWORD *)b + 1274) = 0;
    if (*v3)
    {
      *bzerror = -1;
LABEL_7:
      *((_DWORD *)b + 1274) = -1;
      return;
    }
  }

  else
  {
    if (!b) {
      return;
    }
    *((_DWORD *)b + 1274) = 0;
    if (*v3) {
      goto LABEL_7;
    }
  }

  if (*((_BYTE *)b + 5100)) {
    BZ2_bzDecompressEnd((bz_stream *)((char *)b + 5016));
  }
  free(b);
}

int BZ2_bzRead(int *bzerror, BZFILE *b, void *buf, int len)
{
  int v4 = len;
  if (bzerror) {
    *bzerror = 0;
  }
  if (!b || (*((_DWORD *)b + 1274) = 0, !buf) || len < 0)
  {
    if (bzerror) {
      *bzerror = -2;
    }
    int v4 = 0;
    if (b)
    {
      int v7 = -2;
      goto LABEL_14;
    }

    return v4;
  }

  if (*((_BYTE *)b + 5012))
  {
    if (bzerror) {
      *bzerror = -1;
    }
    int v4 = 0;
    int v7 = -1;
    goto LABEL_14;
  }

  if (!len)
  {
    if (bzerror) {
      *bzerror = 0;
    }
    int v4 = 0;
LABEL_35:
    *((_DWORD *)b + 1274) = 0;
    return v4;
  }

  *((_DWORD *)b + 1262) = len;
  *((void *)b + 630) = buf;
  int v9 = (char *)b + 8;
  while (1)
  {
    uint64_t v10 = *(FILE **)b;
    if (ferror(*(FILE **)b))
    {
LABEL_36:
      if (bzerror) {
        *bzerror = -6;
      }
      int v4 = 0;
      int v7 = -6;
      goto LABEL_14;
    }

    if (!*((_DWORD *)b + 1256) && !sub_18114C0D4(v10))
    {
      int v11 = fread((char *)b + 8, 1uLL, 0x1388uLL, *(FILE **)b);
      if (ferror(*(FILE **)b)) {
        goto LABEL_36;
      }
      *((_DWORD *)b + 1252) = v11;
      *((_DWORD *)b + 1256) = v11;
      *((void *)b + 627) = v9;
    }

    int v12 = BZ2_bzDecompress((bz_stream *)((char *)b + 5016));
    if ((v12 & 0xFFFFFFFB) != 0)
    {
      if (bzerror) {
        *bzerror = v12;
      }
      int v4 = 0;
      *((_DWORD *)b + 1274) = v12;
      return v4;
    }

    if (v12)
    {
      if (v12 == 4)
      {
        if (bzerror) {
          *bzerror = 4;
        }
        *((_DWORD *)b + 1274) = 4;
        v4 -= *((_DWORD *)b + 1262);
        return v4;
      }

      goto LABEL_29;
    }

LABEL_29:
    if (!*((_DWORD *)b + 1262)) {
      goto LABEL_30;
    }
  }

  if (!*((_DWORD *)b + 1262))
  {
LABEL_30:
    if (bzerror) {
      *bzerror = 0;
    }
    goto LABEL_35;
  }

  if (bzerror) {
    *bzerror = -7;
  }
  int v4 = 0;
  int v7 = -7;
LABEL_14:
  *((_DWORD *)b + 1274) = v7;
  return v4;
}

uint64_t sub_18114C0D4(FILE *a1)
{
  int v2 = fgetc(a1);
  if (v2 == -1) {
    return 1LL;
  }
  ungetc(v2, a1);
  return 0LL;
}

void BZ2_bzReadGetUnused(int *bzerror, BZFILE *b, void **unused, int *nUnused)
{
  if (b)
  {
    if (*((_DWORD *)b + 1274) == 4)
    {
      if (unused && nUnused)
      {
        if (bzerror) {
          *bzerror = 0;
        }
        *((_DWORD *)b + 1274) = 0;
        *nUnused = *((_DWORD *)b + 1256);
        *unused = (void *)*((void *)b + 627);
        return;
      }

      if (bzerror) {
        *bzerror = -2;
      }
      int v4 = -2;
    }

    else
    {
      if (bzerror) {
        *bzerror = -1;
      }
      int v4 = -1;
    }

    *((_DWORD *)b + 1274) = v4;
    return;
  }

  if (bzerror) {
    *bzerror = -2;
  }
}

int BZ2_bzBuffToBuffCompress( char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int blockSize100k, int verbosity, int workFactor)
{
  int v7 = -2;
  if (workFactor <= 0xFA
    && verbosity <= 4
    && dest
    && destLen
    && source
    && (blockSize100k - 10) >= 0xFFFFFFF7)
  {
    int v12 = workFactor ? workFactor : 30;
    memset(&v15.bzalloc, 0, 24);
    int v7 = BZ2_bzCompressInit(&v15, blockSize100k, verbosity, v12);
    if (!v7)
    {
      v15.next_in = source;
      v15.next_out = dest;
      v15.avail_in = sourceLen;
      v15.avail_out = *destLen;
      int v13 = BZ2_bzCompress(&v15, 2);
      if (v13 == 3)
      {
        int v7 = -8;
      }

      else
      {
        int v7 = v13;
        if (v13 == 4)
        {
          int v7 = 0;
          *destLen -= v15.avail_out;
        }
      }

      BZ2_bzCompressEnd(&v15);
    }
  }

  return v7;
}

int BZ2_bzBuffToBuffDecompress( char *dest, unsigned int *destLen, char *source, unsigned int sourceLen, int small, int verbosity)
{
  int v6 = -2;
  if (dest)
  {
    if (destLen)
    {
      if (source)
      {
        if (small <= 1 && verbosity <= 4)
        {
          memset(&v14.bzalloc, 0, 24);
          int v6 = BZ2_bzDecompressInit(&v14, verbosity, small);
          if (!v6)
          {
            v14.next_in = source;
            v14.next_out = dest;
            v14.avail_in = sourceLen;
            v14.unsigned int avail_out = *destLen;
            int v12 = BZ2_bzDecompress(&v14);
            if (v12)
            {
              int v6 = v12;
              if (v12 == 4)
              {
                *destLen -= v14.avail_out;
                BZ2_bzDecompressEnd(&v14);
                return 0;
              }

              else
              {
                BZ2_bzDecompressEnd(&v14);
              }
            }

            else
            {
              unsigned int avail_out = v14.avail_out;
              BZ2_bzDecompressEnd(&v14);
              if (avail_out) {
                return -7;
              }
              else {
                return -8;
              }
            }
          }
        }
      }
    }
  }

  return v6;
}

BZFILE *__cdecl BZ2_bzopen(const char *path, const char *mode)
{
  return sub_18114C380();
}

BZFILE *sub_18114C380()
{
  uint64_t v0 = MEMORY[0x1895F8858]();
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int16 v25 = 0;
  *(void *)__mode = 0LL;
  if (!v2) {
    return 0LL;
  }
  int v4 = v3;
  int v5 = v1;
  int v6 = (const char *)v0;
  char v7 = *v2;
  if (*v2)
  {
    int v8 = 0;
    int v9 = 0;
    uint64_t v10 = v2 + 1;
    int v11 = 9;
    do
    {
      unsigned int v12 = v7 - 48;
      if (v12 >= 0xA) {
        unsigned int v12 = v11;
      }
      if (v7 == 119) {
        int v13 = 1;
      }
      else {
        int v13 = v9;
      }
      if (v7 == 119) {
        unsigned int v12 = v11;
      }
      if (v7 == 115) {
        int v14 = v9;
      }
      else {
        int v14 = v13;
      }
      if (v7 == 115)
      {
        unsigned int v12 = v11;
        int v15 = 1;
      }

      else
      {
        int v15 = v8;
      }

      if (v7 == 114) {
        int v9 = 0;
      }
      else {
        int v9 = v14;
      }
      if (v7 != 114)
      {
        int v11 = v12;
        int v8 = v15;
      }

      int v16 = *v10++;
      char v7 = v16;
    }

    while (v16);
  }

  else
  {
    int v9 = 0;
    int v8 = 0;
    int v11 = 9;
  }

  __strlcat_chk();
  __strlcat_chk();
  if (v4)
  {
    int v17 = fdopen(v5, __mode);
  }

  else
  {
    if (!v6 || !*v6)
    {
      char v19 = (FILE **)MEMORY[0x1895F89E0];
      if (!v9) {
        char v19 = (FILE **)MEMORY[0x1895F89D8];
      }
      unsigned int v18 = *v19;
      if (!*v19) {
        return 0LL;
      }
      goto LABEL_35;
    }

    int v17 = fopen(v6, __mode);
  }

  unsigned int v18 = v17;
  if (!v17) {
    return 0LL;
  }
LABEL_35:
  if (v9)
  {
    if (v11 <= 1) {
      unsigned int v20 = 1;
    }
    else {
      unsigned int v20 = v11;
    }
    if (v20 >= 9) {
      int v21 = 9;
    }
    else {
      int v21 = v20;
    }
    int result = BZ2_bzWriteOpen(&bzerror, v18, v21, 0, 30);
    if (result) {
      return result;
    }
  }

  else
  {
    int result = BZ2_bzReadOpen(&bzerror, v18, 0, v8, unused, 0);
    if (result) {
      return result;
    }
  }

  if (v18 != (FILE *)*MEMORY[0x1895F89D8] && v18 != (FILE *)*MEMORY[0x1895F89E0])
  {
    fclose(v18);
    return 0LL;
  }

  return result;
}

BZFILE *__cdecl BZ2_bzdopen(int fd, const char *mode)
{
  return sub_18114C380();
}

int BZ2_bzread(BZFILE *b, void *buf, int len)
{
  if (*((_DWORD *)b + 1274) == 4) {
    return 0;
  }
  int result = BZ2_bzRead(&bzerror, b, buf, len);
  if ((bzerror & 0xFFFFFFFB) != 0) {
    return -1;
  }
  return result;
}

int BZ2_bzwrite(BZFILE *b, void *buf, int len)
{
  if (bzerror) {
    return -1;
  }
  else {
    return len;
  }
}

int BZ2_bzflush(BZFILE *b)
{
  return 0;
}

void BZ2_bzclose(BZFILE *b)
{
  if (b)
  {
    int v2 = *(FILE **)b;
    if (*((_BYTE *)b + 5012))
    {
      BZ2_bzWriteClose64(&bzerror, b, 0, 0LL, 0LL, 0LL, 0LL);
      if (bzerror) {
        BZ2_bzWriteClose64(0LL, b, 1, 0LL, 0LL, 0LL, 0LL);
      }
    }

    else
    {
      BZ2_bzReadClose(&bzerror, b);
    }

    if (v2 != (FILE *)*MEMORY[0x1895F89D8] && v2 != (FILE *)*MEMORY[0x1895F89E0]) {
      fclose(v2);
    }
  }

const char *__cdecl BZ2_bzerror(BZFILE *b, int *errnum)
{
  int v2 = *((_DWORD *)b + 1274) & (*((int *)b + 1274) >> 31);
  *errnum = v2;
  return (&off_189B57A68)[-v2];
}

int *sub_18114C730(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 92);
  int v2 = *(_DWORD *)(a1 + 96);
  if (v2 >= 1)
  {
    unsigned int v3 = *(_DWORD *)(a1 + 648);
    int v4 = *(_DWORD *)(a1 + 96);
    do
    {
      unsigned int v3 = dword_1811530F0[v1 ^ HIBYTE(v3)] ^ (v3 << 8);
      *(_DWORD *)(a1 + 648) = v3;
      --v4;
    }

    while (v4);
  }

  *(_BYTE *)(a1 + v1 + 128) = 1;
  switch(v2)
  {
    case 3:
      uint64_t v10 = *(void *)(a1 + 64);
      int v9 = (int *)(a1 + 64);
      *(_BYTE *)(v10 + v9[11]) = v1;
      uint64_t v11 = v9[11] + 1LL;
      v9[11] = v11;
      *(_BYTE *)(*(void *)v9 + v11) = v1;
      int v6 = v9[11] + 1;
      v9[11] = v6;
      int v8 = v9;
      int result = v9 + 11;
      break;
    case 2:
      uint64_t v12 = *(void *)(a1 + 64);
      int v8 = (int *)(a1 + 64);
      uint64_t v13 = *(int *)(a1 + 108);
      int result = (int *)(a1 + 108);
      *(_BYTE *)(v12 + v13) = v1;
      int v6 = *result + 1;
      *int result = v6;
      break;
    case 1:
      int v7 = *(_DWORD *)(a1 + 108);
      int result = (int *)(a1 + 108);
      int v6 = v7;
      int v8 = result - 11;
      break;
    default:
      *(_BYTE *)(v2 + a1 + 124) = 1;
      uint64_t v14 = *(int *)(a1 + 108);
      int result = (int *)(a1 + 108);
      int v8 = result - 11;
      *(_BYTE *)(*(void *)(result - 11) + v14) = v1;
      uint64_t v15 = *result + 1LL;
      *int result = v15;
      *(_BYTE *)(*(void *)(result - 11) + v15) = v1;
      uint64_t v16 = *result + 1LL;
      *int result = v16;
      *(_BYTE *)(*(void *)(result - 11) + v16) = v1;
      uint64_t v17 = *result + 1LL;
      *int result = v17;
      *(_BYTE *)(*(void *)(result - 11) + v17) = v1;
      int v6 = *result + 1;
      *int result = v6;
      LOBYTE(v1) = *((_BYTE *)result - 12) - 4;
      break;
  }

  *(_BYTE *)(*(void *)v8 + v6) = v1;
  ++*result;
  return result;
}

void sub_18114C87C(uint64_t a1, int a2)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  int v4 = *(_DWORD *)(a1 + 108);
  if (v4 >= 1)
  {
    int v5 = *(_DWORD *)(a1 + 648);
    int v6 = ~v5;
    *(_DWORD *)(a1 + 648) = ~v5;
    int v7 = v5 ^ ~__ROR4__(*(_DWORD *)(a1 + 652), 31);
    *(_DWORD *)(a1 + 652) = v7;
    int v8 = *(_DWORD *)(a1 + 660);
    if (v8 >= 2) {
      *(_DWORD *)(a1 + 116) = 0;
    }
    if (*(int *)(a1 + 656) >= 2) {
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "    block %d: crc = 0x%08x, combined CRC = 0x%08x, size = %d\n",  v8,  v6,  v7,  v4);
    }
    sub_1811486AC();
    int v4 = *(_DWORD *)(a1 + 108);
  }

  *(void *)(a1 + 80) = *(void *)(a1 + 32) + v4;
  if (*(_DWORD *)(a1 + 660) == 1)
  {
    *(void *)(a1 + 640) = 0LL;
    sub_18114CDB4(a1, 66);
    sub_18114CDB4(a1, 90);
    sub_18114CDB4(a1, 104);
    sub_18114CDB4(a1, (*(_BYTE *)(a1 + 664) + 48));
    int v4 = *(_DWORD *)(a1 + 108);
  }

  if (v4 >= 1)
  {
    sub_18114CDB4(a1, 49);
    sub_18114CDB4(a1, 65);
    sub_18114CDB4(a1, 89);
    sub_18114CDB4(a1, 38);
    sub_18114CDB4(a1, 83);
    sub_18114CDB4(a1, 89);
    sub_18114CE24(a1, *(_DWORD *)(a1 + 648));
    int v9 = *(_DWORD *)(a1 + 644);
    if (v9 <= 7)
    {
      int v10 = *(_DWORD *)(a1 + 640);
    }

    else
    {
      int v10 = *(_DWORD *)(a1 + 640);
      int v11 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(void *)(a1 + 80) + v11) = HIBYTE(v10);
        int v11 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v11;
        int v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v10;
        int v12 = *(_DWORD *)(a1 + 644);
        int v9 = v12 - 8;
        *(_DWORD *)(a1 + 644) = v12 - 8;
      }

      while (v12 > 15);
    }

    int v13 = v9 + 1;
    *(_DWORD *)(a1 + 640) = v10;
    *(_DWORD *)(a1 + 644) = v9 + 1;
    int v14 = *(_DWORD *)(a1 + 48);
    if (v9 >= 7)
    {
      int v15 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(void *)(a1 + 80) + v15) = HIBYTE(v10);
        int v15 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v15;
        int v10 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v10;
        int v16 = *(_DWORD *)(a1 + 644);
        int v13 = v16 - 8;
        *(_DWORD *)(a1 + 644) = v16 - 8;
      }

      while (v16 > 15);
    }

    int v17 = 0;
    uint64_t v18 = 0LL;
    *(_DWORD *)(a1 + 640) = (v14 << (8 - v13)) | v10;
    *(_DWORD *)(a1 + 644) = v13 + 24;
    uint64_t v19 = *(void *)(a1 + 56);
    uint64_t v20 = *(void *)(a1 + 64);
    uint64_t v21 = *(void *)(a1 + 72);
    *(_DWORD *)(a1 + 124) = 0;
    do
    {
      if (*(_BYTE *)(a1 + v18 + 128))
      {
        *(_BYTE *)(a1 + v18 + 384) = v17++;
        *(_DWORD *)(a1 + 124) = v17;
      }

      ++v18;
    }

    while (v18 != 256);
    if (v17 >= -1)
    {
      bzero((void *)(a1 + 672), 4LL * (v17 + 1) + 4);
      if (v17 >= 1)
      {
        for (uint64_t i = 0LL; i != v17; ++i)
          v48[i - 1] = i;
      }
    }

    int v23 = *(_DWORD *)(a1 + 108);
    if (v23 < 1)
    {
      int v26 = 0;
    }

    else
    {
      uint64_t v24 = 0LL;
      int v25 = 0;
      int v26 = 0;
      unsigned __int8 v27 = v47;
      int v28 = v47;
      do
      {
        int v29 = v28;
        int v28 = *(unsigned __int8 *)(a1
                                 + *(unsigned __int8 *)(v20
                                                      + (v23 & ((*(_DWORD *)(v19 + 4 * v24) - 1) >> 31))
                                                      + *(_DWORD *)(v19 + 4 * v24)
                                                      - 1)
                                 + 384);
        if (v29 == v28)
        {
          ++v25;
        }

        else
        {
          unsigned int v30 = v25 - 1;
          if (v25 >= 1)
          {
            int v31 = (__int16 *)(v21 + 2LL * v26++);
            if ((v30 & 1) == 0)
            {
LABEL_32:
              __int16 v32 = 0;
              ++*(_DWORD *)(a1 + 672);
              goto LABEL_34;
            }

            while (1)
            {
              ++*(_DWORD *)(a1 + 676);
              __int16 v32 = 1;
LABEL_34:
              *int v31 = v32;
              BOOL v33 = __OFSUB__(v30, 2);
              int v34 = v30 - 2;
              if (v34 < 0 != v33) {
                break;
              }
              unsigned int v30 = v34 >> 1;
              ++v26;
              ++v31;
              if ((v30 & 1) == 0) {
                goto LABEL_32;
              }
            }

            int v25 = 0;
          }

          int v35 = v48[0];
          v48[0] = v27;
          unint64_t v36 = v48;
          if (v28 != v35)
          {
            unint64_t v36 = v48;
            do
            {
              int v37 = *++v36;
              *unint64_t v36 = v35;
              LOBYTE(v35) = v37;
            }

            while (v28 != v37);
          }

          uint64_t v38 = (int)((_DWORD)v36 - &v47) + 1LL;
          *(_WORD *)(v21 + 2LL * v26++) = v38;
          ++*(_DWORD *)(a1 + 4 * v38 + 672);
          int v23 = *(_DWORD *)(a1 + 108);
          unsigned __int8 v27 = v28;
        }

        ++v24;
      }

      while (v24 < v23);
      unsigned int v39 = v25 - 1;
      if (v25 >= 1)
      {
        int v40 = (__int16 *)(v21 + 2LL * v26++);
        if ((v39 & 1) != 0) {
          goto LABEL_46;
        }
LABEL_45:
        __int16 v41 = 0;
        ++*(_DWORD *)(a1 + 672);
        while (1)
        {
          *int v40 = v41;
          BOOL v33 = __OFSUB__(v39, 2);
          int v42 = v39 - 2;
          if (v42 < 0 != v33) {
            break;
          }
          unsigned int v39 = v42 >> 1;
          ++v26;
          ++v40;
          if ((v39 & 1) == 0) {
            goto LABEL_45;
          }
LABEL_46:
          ++*(_DWORD *)(a1 + 676);
          __int16 v41 = 1;
        }
      }
    }

    uint64_t v43 = v17 + 1LL;
    *(_WORD *)(v21 + 2LL * v26) = v43;
    ++*(_DWORD *)(a1 + 4 * v43 + 672);
    *(_DWORD *)(a1 + 668) = v26 + 1;
    sub_18114CFB8(a1);
  }

  if (a2)
  {
    sub_18114CDB4(a1, 23);
    sub_18114CDB4(a1, 114);
    sub_18114CDB4(a1, 69);
    sub_18114CDB4(a1, 56);
    sub_18114CDB4(a1, 80);
    sub_18114CDB4(a1, 144);
    sub_18114CE24(a1, *(_DWORD *)(a1 + 652));
    if (*(int *)(a1 + 644) >= 1)
    {
      int v44 = *(_DWORD *)(a1 + 640);
      int v45 = *(_DWORD *)(a1 + 116);
      do
      {
        *(_BYTE *)(*(void *)(a1 + 80) + v45) = HIBYTE(v44);
        int v45 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v45;
        int v44 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v44;
        int v46 = *(_DWORD *)(a1 + 644);
        BOOL v33 = __OFSUB__(v46, 8);
        v46 -= 8;
        *(_DWORD *)(a1 + 644) = v46;
      }

      while (!((v46 < 0) ^ v33 | (v46 == 0)));
    }
  }

uint64_t sub_18114CDB4(uint64_t result, int a2)
{
  int v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    int v3 = *(_DWORD *)(result + 640);
    int v5 = v2 + 8;
  }

  else
  {
    int v3 = *(_DWORD *)(result + 640);
    int v4 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(void *)(result + 80) + v4) = HIBYTE(v3);
      int v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      int v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v3;
      int v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }

    while (v5 > 15);
  }

  *(_DWORD *)(result + 640) = (a2 << -(char)v5) | v3;
  *(_DWORD *)(result + 644) = v5;
  return result;
}

uint64_t sub_18114CE24(uint64_t result, unsigned int a2)
{
  int v2 = *(_DWORD *)(result + 644);
  if (v2 <= 7)
  {
    int v3 = *(_DWORD *)(result + 640);
    int v5 = v2 + 8;
  }

  else
  {
    int v3 = *(_DWORD *)(result + 640);
    int v4 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(void *)(result + 80) + v4) = HIBYTE(v3);
      int v4 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v4;
      int v3 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v3;
      int v5 = *(_DWORD *)(result + 644);
      *(_DWORD *)(result + 644) = v5 - 8;
    }

    while (v5 > 15);
  }

  int v6 = (HIBYTE(a2) << -(char)v5) | v3;
  *(_DWORD *)(result + 640) = v6;
  *(_DWORD *)(result + 644) = v5;
  if (v5 >= 8)
  {
    int v7 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(void *)(result + 80) + v7) = HIBYTE(v6);
      int v7 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v7;
      int v6 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v6;
      int v8 = *(_DWORD *)(result + 644);
      int v5 = v8 - 8;
      *(_DWORD *)(result + 644) = v8 - 8;
    }

    while (v8 > 15);
  }

  int v9 = v5 + 8;
  int v10 = (BYTE2(a2) << (24 - v5)) | v6;
  *(_DWORD *)(result + 640) = v10;
  *(_DWORD *)(result + 644) = v5 + 8;
  if ((v5 & 0x80000000) == 0)
  {
    int v11 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(void *)(result + 80) + v11) = HIBYTE(v10);
      int v11 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v11;
      int v10 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v10;
      int v12 = *(_DWORD *)(result + 644);
      int v9 = v12 - 8;
      *(_DWORD *)(result + 644) = v12 - 8;
    }

    while (v12 > 15);
  }

  int v13 = v9 + 8;
  int v14 = (BYTE1(a2) << (24 - v9)) | v10;
  *(_DWORD *)(result + 640) = v14;
  *(_DWORD *)(result + 644) = v9 + 8;
  if ((v9 & 0x80000000) == 0)
  {
    int v15 = *(_DWORD *)(result + 116);
    do
    {
      *(_BYTE *)(*(void *)(result + 80) + v15) = HIBYTE(v14);
      int v15 = *(_DWORD *)(result + 116) + 1;
      *(_DWORD *)(result + 116) = v15;
      int v14 = *(_DWORD *)(result + 640) << 8;
      *(_DWORD *)(result + 640) = v14;
      int v16 = *(_DWORD *)(result + 644);
      int v13 = v16 - 8;
      *(_DWORD *)(result + 644) = v16 - 8;
    }

    while (v16 > 15);
  }

  *(_DWORD *)(result + 640) = (a2 << (24 - v13)) | v14;
  *(_DWORD *)(result + 644) = v13 + 8;
  return result;
}

uint64_t sub_18114CFB8(uint64_t a1)
{
  uint64_t v672 = *MEMORY[0x1895F89C0];
  v655 = (int *)(a1 + 51648);
  v658 = (unsigned __int8 *)(a1 + 37708);
  uint64_t v2 = *(void *)(a1 + 72);
  if (*(int *)(a1 + 656) >= 3) {
    fprintf( (FILE *)*MEMORY[0x1895F89D0],  "      %d in block, %d after MTF & 1-2 coding, %d+2 syms in use\n",  *(_DWORD *)(a1 + 108),  *(_DWORD *)(a1 + 668),  *(_DWORD *)(a1 + 124));
  }
  uint64_t v3 = 0LL;
  uint64_t v4 = *(int *)(a1 + 124);
  unsigned int v5 = v4 + 2;
  else {
    size_t v6 = v5;
  }
  uint64_t v661 = *(int *)(a1 + 124);
  do
  {
    if ((int)v4 >= -1)
    {
      memset((void *)(a1 + 37708 + v3), 15, v6);
      uint64_t v4 = v661;
    }

    v3 += 258LL;
  }

  while (v3 != 1548);
  int v659 = v5;
  uint64_t v662 = v2;
  int v7 = *(_DWORD *)(a1 + 668);
  if (v7 <= 0) {
    sub_18114A0F8(3001);
  }
  int v8 = 0;
  BOOL v9 = v7 > 0x95F;
  else {
    int v10 = 6;
  }
  if (v7 >= 0x4B0)
  {
    int v11 = v10;
  }

  else
  {
    BOOL v9 = 0;
    int v11 = 4;
  }

  if (v7 >= 0x258)
  {
    unsigned int v12 = v11;
  }

  else
  {
    BOOL v9 = 0;
    unsigned int v12 = 3;
  }

  BOOL v13 = v7 >= 200 && v9;
  BOOL v663 = v13;
  if (v7 >= 200) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 2LL;
  }
  uint64_t v15 = ((_DWORD)v6 + 1) & 0xFFFFFFFE;
  size_t v657 = v6;
  uint64x2_t v16 = (uint64x2_t)vdupq_n_s64(v6 - 1);
  uint64_t v17 = a1 + 258LL * v14;
  uint64_t v18 = v17 + 37450;
  uint64_t v19 = v17 + 37451;
  uint64_t v20 = v14;
  uint64x2_t v664 = v16;
  do
  {
    int v21 = v8 - 1;
    int v22 = 0;
    BOOL v23 = v7 / (int)v20 >= 1 && v21 <= (int)v4;
    if (v23)
    {
      uint64_t v24 = v21;
      do
      {
        int v21 = v24 + 1;
        v22 += *(_DWORD *)(a1 + 676 + 4 * v24);
      }

      while (v22 < v7 / (int)v20 && v24++ < v4);
    }

    if (v21 > v8 && v20 != v14 && v20 != 1 && (((_DWORD)v14 - (_DWORD)v20) & 0x80000001) == 1) {
      v22 -= *(_DWORD *)(a1 + 4LL * v21-- + 672);
    }
    if (*(int *)(a1 + 656) >= 3)
    {
      uint64_t v666 = v20;
      fprintf( (FILE *)*MEMORY[0x1895F89D0],  "      initial group %d, [%d .. %d], has %d syms (%4.1f%%)\n",  v20,  v8,  v21,  v22,  (float)v22 * 100.0 / (float)*(int *)(a1 + 668));
      uint64_t v20 = v666;
      uint64x2_t v16 = v664;
      uint64_t v4 = v661;
    }

    if ((int)v4 >= -1)
    {
      uint64_t v26 = 0LL;
      int64x2_t v27 = (int64x2_t)xmmword_1811530E0;
      do
      {
        int32x2_t v28 = vmovn_s64((int64x2_t)vcgeq_u64(v16, (uint64x2_t)v27));
        if ((v28.i8[0] & 1) != 0)
        {
          if (v26 > v21 || v26 < v8) {
            char v30 = 15;
          }
          else {
            char v30 = 0;
          }
          *(_BYTE *)(v18 + v26) = v30;
        }

        if ((v28.i8[4] & 1) != 0)
        {
          if (v26 + 1 > v21 || v26 + 1 < v8) {
            char v32 = 15;
          }
          else {
            char v32 = 0;
          }
          *(_BYTE *)(v19 + v26) = v32;
        }

        v26 += 2LL;
        int64x2_t v27 = vaddq_s64(v27, vdupq_n_s64(2uLL));
      }

      while (v15 != v26);
    }

    int v8 = v21 + 1;
    v7 -= v22;
    v18 -= 258LL;
    v19 -= 258LL;
    BOOL v23 = v20-- <= 1;
  }

  while (!v23);
  int v660 = 0;
  size_t v33 = 4 * v657;
  BOOL v34 = v663;
  BOOL v656 = v34;
  uint64_t v35 = a1 + 51640;
  do
  {
    bzero(v670, 4 * v14);
    uint64_t v36 = v14;
    int v37 = (char *)(a1 + 45448);
    int v38 = v661;
    do
    {
      if (v38 >= -1)
      {
        bzero(v37, v33);
        int v38 = v661;
      }

      v37 += 1032;
      --v36;
    }

    while (v36);
    if (v656)
    {
      unsigned int v39 = v655;
      size_t v40 = v657;
      __int16 v41 = v658;
      do
      {
        *(v39 - 2) = *v41 | (v41[258] << 16);
        *(v39 - 1) = v41[516] | (v41[774] << 16);
        *unsigned int v39 = v41[1032] | (v41[1290] << 16);
        v39 += 4;
        ++v41;
        --v40;
      }

      while (v40);
    }

    int v42 = *(_DWORD *)(a1 + 668);
    if (v42 < 1)
    {
      int v668 = 0;
      int v45 = 0;
    }

    else
    {
      uint64_t v43 = 0LL;
      int v44 = 0;
      int v45 = 0;
      do
      {
        int v665 = v45;
        uint64_t v667 = v43;
        uint64_t v46 = v44 + 49LL;
        bzero(v671, 2 * v14);
        else {
          int v47 = v44 + 49;
        }
        BOOL v48 = v663;
        if (v47 - v44 != 49) {
          BOOL v48 = 0;
        }
        if (v48)
        {
          uint64_t v49 = v662;
          int v50 = (unsigned __int16 *)(v662 + 2LL * v44);
          unsigned __int16 v51 = (_DWORD *)(v35 + 16LL * *v50);
          unint64_t v52 = (_DWORD *)(v35 + 16LL * v50[1]);
          int v53 = *v52 + *v51;
          int v54 = v52[1] + v51[1];
          LODWORD(v51) = v52[2] + v51[2];
          int v55 = (_DWORD *)(v35 + 16LL * v50[2]);
          int v56 = (_DWORD *)(v35 + 16LL * v50[3]);
          int v57 = v53 + *v55 + *v56;
          int v58 = v54 + v55[1] + v56[1];
          LODWORD(v51) = (_DWORD)v51 + v55[2] + v56[2];
          int v59 = (_DWORD *)(v35 + 16LL * v50[4]);
          int v60 = (_DWORD *)(v35 + 16LL * v50[5]);
          int v61 = *v59 + *v60;
          int v62 = v59[1] + v60[1];
          LODWORD(v59) = v59[2] + v60[2];
          int v63 = (_DWORD *)(v35 + 16LL * v50[6]);
          int v64 = v57 + v61 + *v63;
          int v65 = v58 + v62 + v63[1];
          LODWORD(v51) = (_DWORD)v51 + (_DWORD)v59 + v63[2];
          int v66 = (_DWORD *)(v35 + 16LL * v50[7]);
          int v67 = (_DWORD *)(v35 + 16LL * v50[8]);
          int v68 = *v66 + *v67;
          int v69 = v66[1] + v67[1];
          LODWORD(v66) = v66[2] + v67[2];
          uint64_t v70 = (_DWORD *)(v35 + 16LL * v50[9]);
          int v71 = v68 + *v70;
          int v72 = v69 + v70[1];
          LODWORD(v66) = (_DWORD)v66 + v70[2];
          int v73 = (_DWORD *)(v35 + 16LL * v50[10]);
          int v74 = v64 + v71 + *v73;
          int v75 = v65 + v72 + v73[1];
          LODWORD(v51) = (_DWORD)v51 + (_DWORD)v66 + v73[2];
          int v76 = (_DWORD *)(v35 + 16LL * v50[11]);
          int v77 = (_DWORD *)(v35 + 16LL * v50[12]);
          int v78 = *v76 + *v77;
          int v79 = v76[1] + v77[1];
          LODWORD(v76) = v76[2] + v77[2];
          uint64_t v80 = (_DWORD *)(v35 + 16LL * v50[13]);
          int v81 = v78 + *v80;
          int v82 = v79 + v80[1];
          LODWORD(v76) = (_DWORD)v76 + v80[2];
          int v83 = (_DWORD *)(v35 + 16LL * v50[14]);
          int v84 = v81 + *v83;
          int v85 = v82 + v83[1];
          LODWORD(v76) = (_DWORD)v76 + v83[2];
          uint64_t v86 = (_DWORD *)(v35 + 16LL * v50[15]);
          int v87 = v74 + v84 + *v86;
          int v88 = v75 + v85 + v86[1];
          LODWORD(v76) = (_DWORD)v51 + (_DWORD)v76 + v86[2];
          int v89 = (_DWORD *)(v35 + 16LL * v50[16]);
          unint64_t v90 = (_DWORD *)(v35 + 16LL * v50[17]);
          int v91 = *v89 + *v90;
          int v92 = v89[1] + v90[1];
          LODWORD(v89) = v89[2] + v90[2];
          int v93 = (_DWORD *)(v35 + 16LL * v50[18]);
          int v94 = v91 + *v93;
          int v95 = v92 + v93[1];
          LODWORD(v89) = (_DWORD)v89 + v93[2];
          int v96 = (_DWORD *)(v35 + 16LL * v50[19]);
          int v97 = v94 + *v96;
          int v98 = v95 + v96[1];
          LODWORD(v89) = (_DWORD)v89 + v96[2];
          int v99 = (_DWORD *)(v35 + 16LL * v50[20]);
          int v100 = v97 + *v99;
          int v101 = v98 + v99[1];
          LODWORD(v99) = (_DWORD)v89 + v99[2];
          int v102 = (_DWORD *)(v35 + 16LL * v50[21]);
          LODWORD(v89) = v87 + v100 + *v102;
          int v103 = v88 + v101 + v102[1];
          int v104 = (_DWORD)v76 + (_DWORD)v99 + v102[2];
          int v105 = (_DWORD *)(v35 + 16LL * v50[22]);
          unint64_t v106 = (_DWORD *)(v35 + 16LL * v50[23]);
          int v107 = *v105 + *v106;
          int v108 = v105[1] + v106[1];
          LODWORD(v105) = v105[2] + v106[2];
          int v109 = (_DWORD *)(v35 + 16LL * v50[24]);
          int v110 = v107 + *v109;
          int v111 = v108 + v109[1];
          LODWORD(v105) = (_DWORD)v105 + v109[2];
          uint64_t v112 = (_DWORD *)(v35 + 16LL * v50[25]);
          int v113 = v110 + *v112;
          int v114 = v111 + v112[1];
          LODWORD(v105) = (_DWORD)v105 + v112[2];
          int v115 = (_DWORD *)(v35 + 16LL * v50[26]);
          int v116 = v113 + *v115;
          int v117 = v114 + v115[1];
          LODWORD(v105) = (_DWORD)v105 + v115[2];
          int v118 = (_DWORD *)(v35 + 16LL * v50[27]);
          int v119 = v116 + *v118;
          int v120 = v117 + v118[1];
          LODWORD(v105) = (_DWORD)v105 + v118[2];
          unint64_t v121 = (_DWORD *)(v35 + 16LL * v50[28]);
          LODWORD(v89) = (_DWORD)v89 + v119 + *v121;
          int v122 = v103 + v120 + v121[1];
          int v123 = v104 + (_DWORD)v105 + v121[2];
          unsigned __int16 v124 = (_DWORD *)(v35 + 16LL * v50[29]);
          unint64_t v125 = (_DWORD *)(v35 + 16LL * v50[30]);
          int v126 = *v124 + *v125;
          int v127 = v124[1] + v125[1];
          LODWORD(v124) = v124[2] + v125[2];
          int v128 = (_DWORD *)(v35 + 16LL * v50[31]);
          int v129 = v126 + *v128;
          int v130 = v127 + v128[1];
          LODWORD(v124) = (_DWORD)v124 + v128[2];
          int v131 = (_DWORD *)(v35 + 16LL * v50[32]);
          int v132 = v129 + *v131;
          int v133 = v130 + v131[1];
          LODWORD(v124) = (_DWORD)v124 + v131[2];
          unint64_t v134 = (_DWORD *)(v35 + 16LL * v50[33]);
          int v135 = v132 + *v134;
          int v136 = v133 + v134[1];
          LODWORD(v124) = (_DWORD)v124 + v134[2];
          int v137 = (_DWORD *)(v35 + 16LL * v50[34]);
          int v138 = v135 + *v137;
          int v139 = v136 + v137[1];
          LODWORD(v124) = (_DWORD)v124 + v137[2];
          v140 = (_DWORD *)(v35 + 16LL * v50[35]);
          int v141 = v138 + *v140;
          int v142 = v139 + v140[1];
          LODWORD(v124) = (_DWORD)v124 + v140[2];
          int v143 = (_DWORD *)(v35 + 16LL * v50[36]);
          LODWORD(v89) = (_DWORD)v89 + v141 + *v143;
          int v144 = v122 + v142 + v143[1];
          int v145 = v123 + (_DWORD)v124 + v143[2];
          unint64_t v146 = (_DWORD *)(v35 + 16LL * v50[37]);
          unint64_t v147 = (_DWORD *)(v35 + 16LL * v50[38]);
          int v148 = *v146 + *v147;
          int v149 = v146[1] + v147[1];
          LODWORD(v146) = v146[2] + v147[2];
          int v150 = (_DWORD *)(v35 + 16LL * v50[39]);
          int v151 = v148 + *v150;
          int v152 = v149 + v150[1];
          LODWORD(v146) = (_DWORD)v146 + v150[2];
          int v153 = (_DWORD *)(v35 + 16LL * v50[40]);
          int v154 = v151 + *v153;
          int v155 = v152 + v153[1];
          LODWORD(v146) = (_DWORD)v146 + v153[2];
          int v156 = (_DWORD *)(v35 + 16LL * v50[41]);
          int v157 = v154 + *v156;
          int v158 = v155 + v156[1];
          LODWORD(v146) = (_DWORD)v146 + v156[2];
          v159 = (_DWORD *)(v35 + 16LL * v50[42]);
          int v160 = v157 + *v159;
          int v161 = v158 + v159[1];
          LODWORD(v146) = (_DWORD)v146 + v159[2];
          v162 = (_DWORD *)(v35 + 16LL * v50[43]);
          int v163 = v160 + *v162;
          int v164 = v161 + v162[1];
          LODWORD(v146) = (_DWORD)v146 + v162[2];
          v165 = (_DWORD *)(v35 + 16LL * v50[44]);
          int v166 = v163 + *v165;
          int v167 = v164 + v165[1];
          LODWORD(v146) = (_DWORD)v146 + v165[2];
          v168 = (_DWORD *)(v35 + 16LL * v50[45]);
          LODWORD(v89) = (_DWORD)v89 + v166 + *v168;
          int v169 = v144 + v167 + v168[1];
          int v170 = v145 + (_DWORD)v146 + v168[2];
          v171 = (_DWORD *)(v35 + 16LL * v50[46]);
          v172 = (_DWORD *)(v35 + 16LL * v50[47]);
          v173 = (_DWORD *)(v35 + 16LL * v50[48]);
          int v174 = *v171 + *v172 + *v173;
          int v175 = v171[1] + v172[1] + v173[1];
          LODWORD(v173) = v171[2] + v172[2] + v173[2];
          v176 = (_DWORD *)(v35 + 16LL * *(unsigned __int16 *)(v662 + 2 * v46));
          int v177 = v169 + v175 + v176[1];
          LODWORD(v173) = v170 + (_DWORD)v173 + v176[2];
          v671[0] = (_DWORD)v89 + v174 + *v176;
          v671[1] = v177;
          v671[2] = (_DWORD)v173;
          uint64_t v178 = v667;
          int v179 = v665;
        }

        else
        {
          uint64_t v49 = v662;
          uint64_t v178 = v667;
          int v179 = v665;
          if (v47 >= v44)
          {
            uint64_t v180 = v44;
            do
            {
              v181 = (unsigned __int8 *)(a1 + 37708 + *(unsigned __int16 *)(v662 + 2 * v180));
              v182 = v671;
              uint64_t v183 = v14;
              do
              {
                *v182++ += *v181;
                v181 += 258;
                --v183;
              }

              while (v183);
              ++v180;
            }

            while (v47 + 1 != (_DWORD)v180);
          }
        }

        uint64_t v184 = 0LL;
        int v185 = 999999999;
        int v186 = -1;
        do
        {
          int v187 = *((unsigned __int16 *)v671 + v184);
          BOOL v188 = v185 <= v187;
          if (v185 >= v187) {
            int v185 = *((unsigned __int16 *)v671 + v184);
          }
          if (!v188) {
            int v186 = v184;
          }
          ++v184;
        }

        while (v14 != v184);
        int v189 = v186;
        ++v670[v186];
        *(_BYTE *)(a1 + v178 + 1704) = v186;
        if (v48)
        {
          v190 = (unsigned __int16 *)(v49 + 2LL * v44);
          uint64_t v191 = a1 + 1032LL * v189 + 45448;
          ++*(_DWORD *)(v191 + 4LL * *v190);
          ++*(_DWORD *)(v191 + 4LL * v190[1]);
          ++*(_DWORD *)(v191 + 4LL * v190[2]);
          ++*(_DWORD *)(v191 + 4LL * v190[3]);
          ++*(_DWORD *)(v191 + 4LL * v190[4]);
          ++*(_DWORD *)(v191 + 4LL * v190[5]);
          ++*(_DWORD *)(v191 + 4LL * v190[6]);
          ++*(_DWORD *)(v191 + 4LL * v190[7]);
          ++*(_DWORD *)(v191 + 4LL * v190[8]);
          ++*(_DWORD *)(v191 + 4LL * v190[9]);
          ++*(_DWORD *)(v191 + 4LL * v190[10]);
          ++*(_DWORD *)(v191 + 4LL * v190[11]);
          ++*(_DWORD *)(v191 + 4LL * v190[12]);
          ++*(_DWORD *)(v191 + 4LL * v190[13]);
          ++*(_DWORD *)(v191 + 4LL * v190[14]);
          ++*(_DWORD *)(v191 + 4LL * v190[15]);
          ++*(_DWORD *)(v191 + 4LL * v190[16]);
          ++*(_DWORD *)(v191 + 4LL * v190[17]);
          ++*(_DWORD *)(v191 + 4LL * v190[18]);
          ++*(_DWORD *)(v191 + 4LL * v190[19]);
          ++*(_DWORD *)(v191 + 4LL * v190[20]);
          ++*(_DWORD *)(v191 + 4LL * v190[21]);
          ++*(_DWORD *)(v191 + 4LL * v190[22]);
          ++*(_DWORD *)(v191 + 4LL * v190[23]);
          ++*(_DWORD *)(v191 + 4LL * v190[24]);
          ++*(_DWORD *)(v191 + 4LL * v190[25]);
          ++*(_DWORD *)(v191 + 4LL * v190[26]);
          ++*(_DWORD *)(v191 + 4LL * v190[27]);
          ++*(_DWORD *)(v191 + 4LL * v190[28]);
          ++*(_DWORD *)(v191 + 4LL * v190[29]);
          ++*(_DWORD *)(v191 + 4LL * v190[30]);
          ++*(_DWORD *)(v191 + 4LL * v190[31]);
          ++*(_DWORD *)(v191 + 4LL * v190[32]);
          ++*(_DWORD *)(v191 + 4LL * v190[33]);
          ++*(_DWORD *)(v191 + 4LL * v190[34]);
          ++*(_DWORD *)(v191 + 4LL * v190[35]);
          ++*(_DWORD *)(v191 + 4LL * v190[36]);
          ++*(_DWORD *)(v191 + 4LL * v190[37]);
          ++*(_DWORD *)(v191 + 4LL * v190[38]);
          ++*(_DWORD *)(v191 + 4LL * v190[39]);
          ++*(_DWORD *)(v191 + 4LL * v190[40]);
          ++*(_DWORD *)(v191 + 4LL * v190[41]);
          ++*(_DWORD *)(v191 + 4LL * v190[42]);
          ++*(_DWORD *)(v191 + 4LL * v190[43]);
          ++*(_DWORD *)(v191 + 4LL * v190[44]);
          ++*(_DWORD *)(v191 + 4LL * v190[45]);
          ++*(_DWORD *)(v191 + 4LL * v190[46]);
          ++*(_DWORD *)(v191 + 4LL * v190[47]);
          ++*(_DWORD *)(v191 + 4LL * v190[48]);
          uint64_t v192 = *(unsigned __int16 *)(v49 + 2LL * (v44 + 49));
          ++*(_DWORD *)(v191 + 4 * v192);
        }

        else if (v47 >= v44)
        {
          v193 = (unsigned __int16 *)(v49 + 2LL * v44);
          int v194 = v47 - v44 + 1;
          do
          {
            unsigned int v195 = *v193++;
            uint64_t v196 = a1 + 1032LL * v189 + 4LL * v195;
            ++*(_DWORD *)(v196 + 45448);
            --v194;
          }

          while (v194);
        }

        int v45 = v185 + v179;
        uint64_t v43 = v178 + 1;
        int v44 = v47 + 1;
        int v42 = *(_DWORD *)(a1 + 668);
      }

      while (v47 + 1 < v42);
      int v668 = v43;
    }

    if (*(int *)(a1 + 656) >= 3)
    {
      v197 = (FILE **)MEMORY[0x1895F89D0];
      fprintf((FILE *)*MEMORY[0x1895F89D0], "      pass %d: size is %d, grp uses are ", v660 + 1, v45 / 8);
      v198 = v670;
      uint64_t v199 = v14;
      do
      {
        int v200 = *v198++;
        fprintf(*v197, "%d ", v200);
        --v199;
      }

      while (v199);
      fputc(10, *v197);
    }

    uint64_t v201 = v14;
    v203 = v658;
    uint64_t v202 = a1 + 45448;
    do
    {
      sub_1811529E8();
      v203 += 258;
      v202 += 1032LL;
      --v201;
    }

    while (v201);
    ++v660;
    size_t v33 = 4 * v657;
  }

  while (v660 != 4);
  if (v668 >= 18003) {
    sub_18114A0F8(3003);
  }
  for (uint64_t i = 0LL; i != v14; ++i)
    v669[i] = i;
  if (v668 >= 1)
  {
    uint64_t v205 = 0LL;
    int v206 = v669[0];
    do
    {
      int v207 = *(unsigned __int8 *)(a1 + v205 + 1704);
      if (v207 == v206)
      {
        LOBYTE(v208) = 0;
      }

      else
      {
        uint64_t v208 = 0LL;
        do
        {
          int v209 = v669[v208 + 1];
          v669[++v208] = v206;
          LOBYTE(v206) = v209;
        }

        while (v207 != v209);
        int v206 = v207;
      }

      *(_BYTE *)(a1 + v205++ + 19706) = v208;
    }

    while (v205 != v668);
  }

  uint64_t v210 = 0LL;
  v211 = (unsigned __int8 *)(a1 + 37708);
  do
  {
    if ((int)v661 < -1)
    {
      int v212 = 0;
      int v213 = 32;
    }

    else
    {
      int v212 = 0;
      int v213 = 32;
      size_t v214 = v657;
      v215 = v211;
      do
      {
        int v217 = *v215++;
        int v216 = v217;
        if (v212 <= v217) {
          int v212 = v216;
        }
        if (v213 >= v216) {
          int v213 = v216;
        }
        --v214;
      }

      while (v214);
      if (v213 <= 0) {
        sub_18114A0F8(3005);
      }
    }

    sub_181152DE0((_DWORD *)(a1 + 1032 * v210 + 39256), (unsigned __int8 *)(a1 + 258 * v210 + 37708), v213, v212, v659);
    ++v210;
    v211 += 258;
  }

  while (v210 != v14);
  uint64_t v218 = 0LL;
  v219 = (FILE **)MEMORY[0x1895F89D0];
  do
  {
    v669[v218] = 0;
    int8x16_t v220 = vtstq_s8(*(int8x16_t *)(a1 + 128 + 16 * v218), *(int8x16_t *)(a1 + 128 + 16 * v218));
    if ((v220.i8[0] & 1) != 0
      || (v220.i8[1] & 1) != 0
      || (v220.i8[2] & 1) != 0
      || (v220.i8[3] & 1) != 0
      || (v220.i8[4] & 1) != 0
      || (v220.i8[5] & 1) != 0
      || (v220.i8[6] & 1) != 0
      || (v220.i8[7] & 1) != 0
      || (v220.i8[8] & 1) != 0
      || (v220.i8[9] & 1) != 0
      || (v220.i8[10] & 1) != 0
      || (v220.i8[11] & 1) != 0
      || (v220.i8[12] & 1) != 0
      || (v220.i8[13] & 1) != 0
      || (v220.i8[14] & 1) != 0
      || (v220.i8[15] & 1) != 0)
    {
      v669[v218] = 1;
    }

    ++v218;
  }

  while (v218 != 16);
  uint64_t v221 = 0LL;
  int v222 = *(_DWORD *)(a1 + 116);
  int v223 = v222;
  do
  {
    int v224 = *(_DWORD *)(a1 + 644);
    int v225 = *(_DWORD *)(a1 + 640);
    if (v669[v221])
    {
      if (v224 >= 8)
      {
        do
        {
          *(_BYTE *)(*(void *)(a1 + 80) + v223) = HIBYTE(v225);
          int v223 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v223;
          int v225 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 640) = v225;
          int v226 = *(_DWORD *)(a1 + 644);
          int v224 = v226 - 8;
          *(_DWORD *)(a1 + 644) = v226 - 8;
        }

        while (v226 > 15);
      }

      v225 |= 0x80000000 >> v224;
    }

    else if (v224 >= 8)
    {
      do
      {
        *(_BYTE *)(*(void *)(a1 + 80) + v223) = HIBYTE(v225);
        int v223 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v223;
        int v225 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v225;
        int v227 = *(_DWORD *)(a1 + 644);
        int v224 = v227 - 8;
        *(_DWORD *)(a1 + 644) = v227 - 8;
      }

      while (v227 > 15);
    }

    int v228 = v224 + 1;
    *(_DWORD *)(a1 + 640) = v225;
    *(_DWORD *)(a1 + 644) = v228;
    ++v221;
  }

  while (v221 != 16);
  for (uint64_t j = 0LL; j != 16; ++j)
  {
    if (v669[j])
    {
      for (uint64_t k = 0LL; k != 16; ++k)
      {
        if (*(_BYTE *)(a1 + k + 16 * j + 128))
        {
          if (v228 >= 8)
          {
            do
            {
              *(_BYTE *)(*(void *)(a1 + 80) + v223) = HIBYTE(v225);
              int v223 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v223;
              int v225 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v225;
              int v231 = *(_DWORD *)(a1 + 644);
              int v228 = v231 - 8;
              *(_DWORD *)(a1 + 644) = v231 - 8;
            }

            while (v231 > 15);
          }

          v225 |= 0x80000000 >> v228;
        }

        else if (v228 >= 8)
        {
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v223) = HIBYTE(v225);
            int v223 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v223;
            int v225 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v225;
            int v232 = *(_DWORD *)(a1 + 644);
            int v228 = v232 - 8;
            *(_DWORD *)(a1 + 644) = v232 - 8;
          }

          while (v232 > 15);
        }

        ++v228;
        *(_DWORD *)(a1 + 640) = v225;
        *(_DWORD *)(a1 + 644) = v228;
      }
    }
  }

  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v219, "      bytes: mapping %d, ", v223 - v222);
    int v223 = *(_DWORD *)(a1 + 116);
    int v228 = *(_DWORD *)(a1 + 644);
  }

  int v233 = *(_DWORD *)(a1 + 640);
  int v234 = v223;
  if (v228 >= 8)
  {
    do
    {
      *(_BYTE *)(*(void *)(a1 + 80) + v234) = HIBYTE(v233);
      int v234 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v234;
      int v233 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 640) = v233;
      int v235 = *(_DWORD *)(a1 + 644);
      int v228 = v235 - 8;
      *(_DWORD *)(a1 + 644) = v235 - 8;
    }

    while (v235 > 15);
  }

  int v236 = v228 + 3;
  int v237 = ((_DWORD)v14 << (29 - v228)) | v233;
  *(_DWORD *)(a1 + 640) = v237;
  *(_DWORD *)(a1 + 644) = v228 + 3;
  if (v228 >= 5)
  {
    do
    {
      *(_BYTE *)(*(void *)(a1 + 80) + v234) = HIBYTE(v237);
      int v234 = *(_DWORD *)(a1 + 116) + 1;
      *(_DWORD *)(a1 + 116) = v234;
      int v237 = *(_DWORD *)(a1 + 640) << 8;
      *(_DWORD *)(a1 + 640) = v237;
      int v238 = *(_DWORD *)(a1 + 644);
      int v236 = v238 - 8;
      *(_DWORD *)(a1 + 644) = v238 - 8;
    }

    while (v238 > 15);
  }

  int v239 = v236 + 15;
  int v240 = (v668 << (17 - v236)) | v237;
  *(_DWORD *)(a1 + 640) = v240;
  *(_DWORD *)(a1 + 644) = v236 + 15;
  if (v668 >= 1)
  {
    for (uint64_t m = 0LL; m != v668; ++m)
    {
      v242 = (unsigned __int8 *)(a1 + m + 19706);
      unsigned __int8 v243 = *v242;
      if (*v242)
      {
        unsigned int v244 = 0;
        do
        {
          if (v239 >= 8)
          {
            do
            {
              *(_BYTE *)(*(void *)(a1 + 80) + v234) = HIBYTE(v240);
              int v234 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v234;
              int v240 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v240;
              int v245 = *(_DWORD *)(a1 + 644);
              int v239 = v245 - 8;
              *(_DWORD *)(a1 + 644) = v245 - 8;
            }

            while (v245 > 15);
            unsigned __int8 v243 = *v242;
          }

          int v246 = v239 + 1;
          v240 |= 0x80000000 >> v239;
          *(_DWORD *)(a1 + 640) = v240;
          *(_DWORD *)(a1 + 644) = v239 + 1;
          ++v244;
          ++v239;
        }

        while (v244 < v243);
      }

      else
      {
        int v246 = v239;
      }

      if (v246 >= 8)
      {
        do
        {
          *(_BYTE *)(*(void *)(a1 + 80) + v234) = HIBYTE(v240);
          int v234 = *(_DWORD *)(a1 + 116) + 1;
          *(_DWORD *)(a1 + 116) = v234;
          int v240 = *(_DWORD *)(a1 + 640) << 8;
          *(_DWORD *)(a1 + 640) = v240;
          int v247 = *(_DWORD *)(a1 + 644);
          int v246 = v247 - 8;
          *(_DWORD *)(a1 + 644) = v247 - 8;
        }

        while (v247 > 15);
      }

      int v239 = v246 + 1;
      *(_DWORD *)(a1 + 640) = v240;
      *(_DWORD *)(a1 + 644) = v246 + 1;
    }
  }

  if (*(int *)(a1 + 656) >= 3)
  {
    fprintf(*v219, "selectors %d, ", v234 - v223);
    int v234 = *(_DWORD *)(a1 + 116);
    int v239 = *(_DWORD *)(a1 + 644);
  }

  uint64_t v248 = 0LL;
  int v249 = v234;
  do
  {
    int v250 = *(unsigned __int8 *)(a1 + 258 * v248 + 37708);
    unsigned int v251 = *(_DWORD *)(a1 + 640);
    if (v239 >= 8)
    {
      do
      {
        *(_BYTE *)(*(void *)(a1 + 80) + v249) = HIBYTE(v251);
        int v249 = *(_DWORD *)(a1 + 116) + 1;
        *(_DWORD *)(a1 + 116) = v249;
        unsigned int v251 = *(_DWORD *)(a1 + 640) << 8;
        *(_DWORD *)(a1 + 640) = v251;
        int v252 = *(_DWORD *)(a1 + 644);
        int v239 = v252 - 8;
        *(_DWORD *)(a1 + 644) = v252 - 8;
      }

      while (v252 > 15);
    }

    int v253 = v239 + 5;
    uint64_t result = (v250 << (27 - v239)) | v251;
    *(_DWORD *)(a1 + 640) = result;
    *(_DWORD *)(a1 + 644) = v239 + 5;
    if ((int)v661 >= -1)
    {
      uint64_t v255 = 0LL;
      do
      {
        v256 = (unsigned __int8 *)(a1 + 258 * v248 + v255 + 37708);
        while (1)
        {
          int v257 = *v256;
          if (v250 >= v257) {
            break;
          }
          if (v253 >= 8)
          {
            do
            {
              *(_BYTE *)(*(void *)(a1 + 80) + v249) = BYTE3(result);
              int v249 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v249;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = result;
              int v258 = *(_DWORD *)(a1 + 644);
              int v253 = v258 - 8;
              *(_DWORD *)(a1 + 644) = v258 - 8;
            }

            while (v258 > 15);
          }

          char v259 = 30 - v253;
          v253 += 2;
          uint64_t result = (2 << v259) | result;
          *(_DWORD *)(a1 + 640) = result;
          *(_DWORD *)(a1 + 644) = v253;
          ++v250;
        }

        while (v250 > v257)
        {
          if (v253 >= 8)
          {
            do
            {
              *(_BYTE *)(*(void *)(a1 + 80) + v249) = BYTE3(result);
              int v249 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v249;
              LODWORD(result) = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = result;
              int v260 = *(_DWORD *)(a1 + 644);
              int v253 = v260 - 8;
              *(_DWORD *)(a1 + 644) = v260 - 8;
            }

            while (v260 > 15);
          }

          char v261 = 30 - v253;
          v253 += 2;
          uint64_t result = (3 << v261) | result;
          *(_DWORD *)(a1 + 640) = result;
          *(_DWORD *)(a1 + 644) = v253;
          --v250;
          int v257 = *v256;
        }

        if (v253 >= 8)
        {
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v249) = BYTE3(result);
            int v249 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v249;
            uint64_t result = (*(_DWORD *)(a1 + 640) << 8);
            *(_DWORD *)(a1 + 640) = result;
            int v262 = *(_DWORD *)(a1 + 644);
            int v253 = v262 - 8;
            *(_DWORD *)(a1 + 644) = v262 - 8;
          }

          while (v262 > 15);
        }

        ++v253;
        *(_DWORD *)(a1 + 640) = result;
        *(_DWORD *)(a1 + 644) = v253;
        ++v255;
      }

      while (v255 != v657);
    }

    ++v248;
    int v239 = v253;
  }

  while (v248 != v14);
  if (*(int *)(a1 + 656) >= 3)
  {
    uint64_t result = fprintf(*v219, "code lengths %d, ", v249 - v234);
    int v249 = *(_DWORD *)(a1 + 116);
  }

  int v263 = *(_DWORD *)(a1 + 668);
  if (v263 < 1)
  {
    LODWORD(v264) = 0;
  }

  else
  {
    uint64_t v264 = 0LL;
    int v265 = 0;
    do
    {
      uint64_t v266 = v265;
      uint64_t v267 = v265 + 49LL;
      else {
        int v268 = v265 + 49;
      }
      v269 = (unsigned __int8 *)(a1 + v264 + 1704);
      BOOL v270 = v663;
      if (v268 - (_DWORD)v266 != 49) {
        BOOL v270 = 0;
      }
      if (v270)
      {
        unsigned int v271 = *v269;
        uint64_t v272 = a1 + 258LL * *v269 + 37708;
        uint64_t v273 = *(unsigned __int16 *)(v662 + 2 * v266);
        int v274 = *(unsigned __int8 *)(v272 + v273);
        uint64_t v275 = a1 + 1032LL * v271 + 39256;
        int v276 = *(_DWORD *)(v275 + 4 * v273);
        int v277 = *(_DWORD *)(a1 + 644);
        int v278 = *(_DWORD *)(a1 + 640);
        if (v277 >= 8)
        {
          int v279 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v279) = HIBYTE(v278);
            int v279 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v279;
            int v278 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v278;
            int v280 = *(_DWORD *)(a1 + 644);
            int v277 = v280 - 8;
            *(_DWORD *)(a1 + 644) = v280 - 8;
          }

          while (v280 > 15);
        }

        int v281 = v277 + v274;
        int v282 = (v276 << -(char)(v277 + v274)) | v278;
        *(_DWORD *)(a1 + 640) = v282;
        *(_DWORD *)(a1 + 644) = v281;
        uint64_t v283 = v662 + 2 * v266;
        uint64_t v284 = *(unsigned __int16 *)(v283 + 2);
        int v285 = *(unsigned __int8 *)(v272 + v284);
        int v286 = *(_DWORD *)(v275 + 4 * v284);
        if (v281 >= 8)
        {
          int v287 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v287) = HIBYTE(v282);
            int v287 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v287;
            int v282 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v282;
            int v288 = *(_DWORD *)(a1 + 644);
            int v281 = v288 - 8;
            *(_DWORD *)(a1 + 644) = v288 - 8;
          }

          while (v288 > 15);
        }

        int v289 = v281 + v285;
        int v290 = (v286 << -(char)v289) | v282;
        *(_DWORD *)(a1 + 640) = v290;
        *(_DWORD *)(a1 + 644) = v289;
        uint64_t v291 = *(unsigned __int16 *)(v283 + 4);
        int v292 = *(unsigned __int8 *)(v272 + v291);
        int v293 = *(_DWORD *)(v275 + 4 * v291);
        if (v289 >= 8)
        {
          int v294 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v294) = HIBYTE(v290);
            int v294 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v294;
            int v290 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v290;
            int v295 = *(_DWORD *)(a1 + 644);
            int v289 = v295 - 8;
            *(_DWORD *)(a1 + 644) = v295 - 8;
          }

          while (v295 > 15);
        }

        int v296 = v289 + v292;
        int v297 = (v293 << -(char)(v289 + v292)) | v290;
        *(_DWORD *)(a1 + 640) = v297;
        *(_DWORD *)(a1 + 644) = v289 + v292;
        uint64_t v298 = v662 + 2 * v266;
        uint64_t v299 = *(unsigned __int16 *)(v298 + 6);
        int v300 = *(unsigned __int8 *)(v272 + v299);
        int v301 = *(_DWORD *)(v275 + 4 * v299);
        if (v296 >= 8)
        {
          int v302 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v302) = HIBYTE(v297);
            int v302 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v302;
            int v297 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v297;
            int v303 = *(_DWORD *)(a1 + 644);
            int v296 = v303 - 8;
            *(_DWORD *)(a1 + 644) = v303 - 8;
          }

          while (v303 > 15);
        }

        int v304 = v296 + v300;
        int v305 = (v301 << -(char)v304) | v297;
        *(_DWORD *)(a1 + 640) = v305;
        *(_DWORD *)(a1 + 644) = v304;
        uint64_t v306 = *(unsigned __int16 *)(v298 + 8);
        int v307 = *(unsigned __int8 *)(v272 + v306);
        int v308 = *(_DWORD *)(v275 + 4 * v306);
        if (v304 >= 8)
        {
          int v309 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v309) = HIBYTE(v305);
            int v309 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v309;
            int v305 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v305;
            int v310 = *(_DWORD *)(a1 + 644);
            int v304 = v310 - 8;
            *(_DWORD *)(a1 + 644) = v310 - 8;
          }

          while (v310 > 15);
        }

        int v311 = v304 + v307;
        int v312 = (v308 << -(char)(v304 + v307)) | v305;
        *(_DWORD *)(a1 + 640) = v312;
        *(_DWORD *)(a1 + 644) = v304 + v307;
        uint64_t v313 = v662 + 2 * v266;
        uint64_t v314 = *(unsigned __int16 *)(v313 + 10);
        int v315 = *(unsigned __int8 *)(v272 + v314);
        int v316 = *(_DWORD *)(v275 + 4 * v314);
        if (v311 >= 8)
        {
          int v317 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v317) = HIBYTE(v312);
            int v317 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v317;
            int v312 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v312;
            int v318 = *(_DWORD *)(a1 + 644);
            int v311 = v318 - 8;
            *(_DWORD *)(a1 + 644) = v318 - 8;
          }

          while (v318 > 15);
        }

        int v319 = v311 + v315;
        int v320 = (v316 << -(char)v319) | v312;
        *(_DWORD *)(a1 + 640) = v320;
        *(_DWORD *)(a1 + 644) = v319;
        uint64_t v321 = *(unsigned __int16 *)(v313 + 12);
        int v322 = *(unsigned __int8 *)(v272 + v321);
        int v323 = *(_DWORD *)(v275 + 4 * v321);
        if (v319 >= 8)
        {
          int v324 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v324) = HIBYTE(v320);
            int v324 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v324;
            int v320 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v320;
            int v325 = *(_DWORD *)(a1 + 644);
            int v319 = v325 - 8;
            *(_DWORD *)(a1 + 644) = v325 - 8;
          }

          while (v325 > 15);
        }

        int v326 = v319 + v322;
        int v327 = (v323 << -(char)(v319 + v322)) | v320;
        *(_DWORD *)(a1 + 640) = v327;
        *(_DWORD *)(a1 + 644) = v319 + v322;
        uint64_t v328 = v662 + 2 * v266;
        uint64_t v329 = *(unsigned __int16 *)(v328 + 14);
        int v330 = *(unsigned __int8 *)(v272 + v329);
        int v331 = *(_DWORD *)(v275 + 4 * v329);
        if (v326 >= 8)
        {
          int v332 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v332) = HIBYTE(v327);
            int v332 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v332;
            int v327 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v327;
            int v333 = *(_DWORD *)(a1 + 644);
            int v326 = v333 - 8;
            *(_DWORD *)(a1 + 644) = v333 - 8;
          }

          while (v333 > 15);
        }

        int v334 = v326 + v330;
        int v335 = (v331 << -(char)v334) | v327;
        *(_DWORD *)(a1 + 640) = v335;
        *(_DWORD *)(a1 + 644) = v334;
        uint64_t v336 = *(unsigned __int16 *)(v328 + 16);
        int v337 = *(unsigned __int8 *)(v272 + v336);
        int v338 = *(_DWORD *)(v275 + 4 * v336);
        if (v334 >= 8)
        {
          int v339 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v339) = HIBYTE(v335);
            int v339 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v339;
            int v335 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v335;
            int v340 = *(_DWORD *)(a1 + 644);
            int v334 = v340 - 8;
            *(_DWORD *)(a1 + 644) = v340 - 8;
          }

          while (v340 > 15);
        }

        int v341 = v334 + v337;
        int v342 = (v338 << -(char)(v334 + v337)) | v335;
        *(_DWORD *)(a1 + 640) = v342;
        *(_DWORD *)(a1 + 644) = v334 + v337;
        uint64_t v343 = v662 + 2 * v266;
        uint64_t v344 = *(unsigned __int16 *)(v343 + 18);
        int v345 = *(unsigned __int8 *)(v272 + v344);
        int v346 = *(_DWORD *)(v275 + 4 * v344);
        if (v341 >= 8)
        {
          int v347 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v347) = HIBYTE(v342);
            int v347 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v347;
            int v342 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v342;
            int v348 = *(_DWORD *)(a1 + 644);
            int v341 = v348 - 8;
            *(_DWORD *)(a1 + 644) = v348 - 8;
          }

          while (v348 > 15);
        }

        int v349 = v341 + v345;
        int v350 = (v346 << -(char)v349) | v342;
        *(_DWORD *)(a1 + 640) = v350;
        *(_DWORD *)(a1 + 644) = v349;
        uint64_t v351 = *(unsigned __int16 *)(v343 + 20);
        int v352 = *(unsigned __int8 *)(v272 + v351);
        int v353 = *(_DWORD *)(v275 + 4 * v351);
        if (v349 >= 8)
        {
          int v354 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v354) = HIBYTE(v350);
            int v354 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v354;
            int v350 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v350;
            int v355 = *(_DWORD *)(a1 + 644);
            int v349 = v355 - 8;
            *(_DWORD *)(a1 + 644) = v355 - 8;
          }

          while (v355 > 15);
        }

        int v356 = v349 + v352;
        int v357 = (v353 << -(char)(v349 + v352)) | v350;
        *(_DWORD *)(a1 + 640) = v357;
        *(_DWORD *)(a1 + 644) = v349 + v352;
        uint64_t v358 = v662 + 2 * v266;
        uint64_t v359 = *(unsigned __int16 *)(v358 + 22);
        int v360 = *(unsigned __int8 *)(v272 + v359);
        int v361 = *(_DWORD *)(v275 + 4 * v359);
        if (v356 >= 8)
        {
          int v362 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v362) = HIBYTE(v357);
            int v362 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v362;
            int v357 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v357;
            int v363 = *(_DWORD *)(a1 + 644);
            int v356 = v363 - 8;
            *(_DWORD *)(a1 + 644) = v363 - 8;
          }

          while (v363 > 15);
        }

        int v364 = v356 + v360;
        int v365 = (v361 << -(char)v364) | v357;
        *(_DWORD *)(a1 + 640) = v365;
        *(_DWORD *)(a1 + 644) = v364;
        uint64_t v366 = *(unsigned __int16 *)(v358 + 24);
        int v367 = *(unsigned __int8 *)(v272 + v366);
        int v368 = *(_DWORD *)(v275 + 4 * v366);
        if (v364 >= 8)
        {
          int v369 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v369) = HIBYTE(v365);
            int v369 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v369;
            int v365 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v365;
            int v370 = *(_DWORD *)(a1 + 644);
            int v364 = v370 - 8;
            *(_DWORD *)(a1 + 644) = v370 - 8;
          }

          while (v370 > 15);
        }

        int v371 = v364 + v367;
        int v372 = (v368 << -(char)(v364 + v367)) | v365;
        *(_DWORD *)(a1 + 640) = v372;
        *(_DWORD *)(a1 + 644) = v364 + v367;
        uint64_t v373 = v662 + 2 * v266;
        uint64_t v374 = *(unsigned __int16 *)(v373 + 26);
        int v375 = *(unsigned __int8 *)(v272 + v374);
        int v376 = *(_DWORD *)(v275 + 4 * v374);
        if (v371 >= 8)
        {
          int v377 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v377) = HIBYTE(v372);
            int v377 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v377;
            int v372 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v372;
            int v378 = *(_DWORD *)(a1 + 644);
            int v371 = v378 - 8;
            *(_DWORD *)(a1 + 644) = v378 - 8;
          }

          while (v378 > 15);
        }

        int v379 = v371 + v375;
        int v380 = (v376 << -(char)v379) | v372;
        *(_DWORD *)(a1 + 640) = v380;
        *(_DWORD *)(a1 + 644) = v379;
        uint64_t v381 = *(unsigned __int16 *)(v373 + 28);
        int v382 = *(unsigned __int8 *)(v272 + v381);
        int v383 = *(_DWORD *)(v275 + 4 * v381);
        if (v379 >= 8)
        {
          int v384 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v384) = HIBYTE(v380);
            int v384 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v384;
            int v380 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v380;
            int v385 = *(_DWORD *)(a1 + 644);
            int v379 = v385 - 8;
            *(_DWORD *)(a1 + 644) = v385 - 8;
          }

          while (v385 > 15);
        }

        int v386 = v379 + v382;
        int v387 = (v383 << -(char)(v379 + v382)) | v380;
        *(_DWORD *)(a1 + 640) = v387;
        *(_DWORD *)(a1 + 644) = v379 + v382;
        uint64_t v388 = v662 + 2 * v266;
        uint64_t v389 = *(unsigned __int16 *)(v388 + 30);
        int v390 = *(unsigned __int8 *)(v272 + v389);
        int v391 = *(_DWORD *)(v275 + 4 * v389);
        if (v386 >= 8)
        {
          int v392 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v392) = HIBYTE(v387);
            int v392 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v392;
            int v387 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v387;
            int v393 = *(_DWORD *)(a1 + 644);
            int v386 = v393 - 8;
            *(_DWORD *)(a1 + 644) = v393 - 8;
          }

          while (v393 > 15);
        }

        int v394 = v386 + v390;
        int v395 = (v391 << -(char)v394) | v387;
        *(_DWORD *)(a1 + 640) = v395;
        *(_DWORD *)(a1 + 644) = v394;
        uint64_t v396 = *(unsigned __int16 *)(v388 + 32);
        int v397 = *(unsigned __int8 *)(v272 + v396);
        int v398 = *(_DWORD *)(v275 + 4 * v396);
        if (v394 >= 8)
        {
          int v399 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v399) = HIBYTE(v395);
            int v399 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v399;
            int v395 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v395;
            int v400 = *(_DWORD *)(a1 + 644);
            int v394 = v400 - 8;
            *(_DWORD *)(a1 + 644) = v400 - 8;
          }

          while (v400 > 15);
        }

        int v401 = v394 + v397;
        int v402 = (v398 << -(char)(v394 + v397)) | v395;
        *(_DWORD *)(a1 + 640) = v402;
        *(_DWORD *)(a1 + 644) = v394 + v397;
        uint64_t v403 = v662 + 2 * v266;
        uint64_t v404 = *(unsigned __int16 *)(v403 + 34);
        int v405 = *(unsigned __int8 *)(v272 + v404);
        int v406 = *(_DWORD *)(v275 + 4 * v404);
        if (v401 >= 8)
        {
          int v407 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v407) = HIBYTE(v402);
            int v407 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v407;
            int v402 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v402;
            int v408 = *(_DWORD *)(a1 + 644);
            int v401 = v408 - 8;
            *(_DWORD *)(a1 + 644) = v408 - 8;
          }

          while (v408 > 15);
        }

        int v409 = v401 + v405;
        int v410 = (v406 << -(char)v409) | v402;
        *(_DWORD *)(a1 + 640) = v410;
        *(_DWORD *)(a1 + 644) = v409;
        uint64_t v411 = *(unsigned __int16 *)(v403 + 36);
        int v412 = *(unsigned __int8 *)(v272 + v411);
        int v413 = *(_DWORD *)(v275 + 4 * v411);
        if (v409 >= 8)
        {
          int v414 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v414) = HIBYTE(v410);
            int v414 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v414;
            int v410 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v410;
            int v415 = *(_DWORD *)(a1 + 644);
            int v409 = v415 - 8;
            *(_DWORD *)(a1 + 644) = v415 - 8;
          }

          while (v415 > 15);
        }

        int v416 = v409 + v412;
        int v417 = (v413 << -(char)(v409 + v412)) | v410;
        *(_DWORD *)(a1 + 640) = v417;
        *(_DWORD *)(a1 + 644) = v409 + v412;
        uint64_t v418 = v662 + 2 * v266;
        uint64_t v419 = *(unsigned __int16 *)(v418 + 38);
        int v420 = *(unsigned __int8 *)(v272 + v419);
        int v421 = *(_DWORD *)(v275 + 4 * v419);
        if (v416 >= 8)
        {
          int v422 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v422) = HIBYTE(v417);
            int v422 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v422;
            int v417 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v417;
            int v423 = *(_DWORD *)(a1 + 644);
            int v416 = v423 - 8;
            *(_DWORD *)(a1 + 644) = v423 - 8;
          }

          while (v423 > 15);
        }

        int v424 = v416 + v420;
        int v425 = (v421 << -(char)v424) | v417;
        *(_DWORD *)(a1 + 640) = v425;
        *(_DWORD *)(a1 + 644) = v424;
        uint64_t v426 = *(unsigned __int16 *)(v418 + 40);
        int v427 = *(unsigned __int8 *)(v272 + v426);
        int v428 = *(_DWORD *)(v275 + 4 * v426);
        if (v424 >= 8)
        {
          int v429 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v429) = HIBYTE(v425);
            int v429 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v429;
            int v425 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v425;
            int v430 = *(_DWORD *)(a1 + 644);
            int v424 = v430 - 8;
            *(_DWORD *)(a1 + 644) = v430 - 8;
          }

          while (v430 > 15);
        }

        int v431 = v424 + v427;
        int v432 = (v428 << -(char)(v424 + v427)) | v425;
        *(_DWORD *)(a1 + 640) = v432;
        *(_DWORD *)(a1 + 644) = v424 + v427;
        uint64_t v433 = v662 + 2 * v266;
        uint64_t v434 = *(unsigned __int16 *)(v433 + 42);
        int v435 = *(unsigned __int8 *)(v272 + v434);
        int v436 = *(_DWORD *)(v275 + 4 * v434);
        if (v431 >= 8)
        {
          int v437 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v437) = HIBYTE(v432);
            int v437 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v437;
            int v432 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v432;
            int v438 = *(_DWORD *)(a1 + 644);
            int v431 = v438 - 8;
            *(_DWORD *)(a1 + 644) = v438 - 8;
          }

          while (v438 > 15);
        }

        int v439 = v431 + v435;
        int v440 = (v436 << -(char)v439) | v432;
        *(_DWORD *)(a1 + 640) = v440;
        *(_DWORD *)(a1 + 644) = v439;
        uint64_t v441 = *(unsigned __int16 *)(v433 + 44);
        int v442 = *(unsigned __int8 *)(v272 + v441);
        int v443 = *(_DWORD *)(v275 + 4 * v441);
        if (v439 >= 8)
        {
          int v444 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v444) = HIBYTE(v440);
            int v444 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v444;
            int v440 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v440;
            int v445 = *(_DWORD *)(a1 + 644);
            int v439 = v445 - 8;
            *(_DWORD *)(a1 + 644) = v445 - 8;
          }

          while (v445 > 15);
        }

        int v446 = v439 + v442;
        int v447 = (v443 << -(char)(v439 + v442)) | v440;
        *(_DWORD *)(a1 + 640) = v447;
        *(_DWORD *)(a1 + 644) = v439 + v442;
        uint64_t v448 = v662 + 2 * v266;
        uint64_t v449 = *(unsigned __int16 *)(v448 + 46);
        int v450 = *(unsigned __int8 *)(v272 + v449);
        int v451 = *(_DWORD *)(v275 + 4 * v449);
        if (v446 >= 8)
        {
          int v452 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v452) = HIBYTE(v447);
            int v452 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v452;
            int v447 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v447;
            int v453 = *(_DWORD *)(a1 + 644);
            int v446 = v453 - 8;
            *(_DWORD *)(a1 + 644) = v453 - 8;
          }

          while (v453 > 15);
        }

        int v454 = v446 + v450;
        int v455 = (v451 << -(char)v454) | v447;
        *(_DWORD *)(a1 + 640) = v455;
        *(_DWORD *)(a1 + 644) = v454;
        uint64_t v456 = *(unsigned __int16 *)(v448 + 48);
        int v457 = *(unsigned __int8 *)(v272 + v456);
        int v458 = *(_DWORD *)(v275 + 4 * v456);
        if (v454 >= 8)
        {
          int v459 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v459) = HIBYTE(v455);
            int v459 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v459;
            int v455 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v455;
            int v460 = *(_DWORD *)(a1 + 644);
            int v454 = v460 - 8;
            *(_DWORD *)(a1 + 644) = v460 - 8;
          }

          while (v460 > 15);
        }

        int v461 = v454 + v457;
        int v462 = (v458 << -(char)(v454 + v457)) | v455;
        *(_DWORD *)(a1 + 640) = v462;
        *(_DWORD *)(a1 + 644) = v454 + v457;
        uint64_t v463 = v662 + 2 * v266;
        uint64_t v464 = *(unsigned __int16 *)(v463 + 50);
        int v465 = *(unsigned __int8 *)(v272 + v464);
        int v466 = *(_DWORD *)(v275 + 4 * v464);
        if (v461 >= 8)
        {
          int v467 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v467) = HIBYTE(v462);
            int v467 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v467;
            int v462 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v462;
            int v468 = *(_DWORD *)(a1 + 644);
            int v461 = v468 - 8;
            *(_DWORD *)(a1 + 644) = v468 - 8;
          }

          while (v468 > 15);
        }

        int v469 = v461 + v465;
        int v470 = (v466 << -(char)v469) | v462;
        *(_DWORD *)(a1 + 640) = v470;
        *(_DWORD *)(a1 + 644) = v469;
        uint64_t v471 = *(unsigned __int16 *)(v463 + 52);
        int v472 = *(unsigned __int8 *)(v272 + v471);
        int v473 = *(_DWORD *)(v275 + 4 * v471);
        if (v469 >= 8)
        {
          int v474 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v474) = HIBYTE(v470);
            int v474 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v474;
            int v470 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v470;
            int v475 = *(_DWORD *)(a1 + 644);
            int v469 = v475 - 8;
            *(_DWORD *)(a1 + 644) = v475 - 8;
          }

          while (v475 > 15);
        }

        int v476 = v469 + v472;
        int v477 = (v473 << -(char)(v469 + v472)) | v470;
        *(_DWORD *)(a1 + 640) = v477;
        *(_DWORD *)(a1 + 644) = v469 + v472;
        uint64_t v478 = v662 + 2 * v266;
        uint64_t v479 = *(unsigned __int16 *)(v478 + 54);
        int v480 = *(unsigned __int8 *)(v272 + v479);
        int v481 = *(_DWORD *)(v275 + 4 * v479);
        if (v476 >= 8)
        {
          int v482 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v482) = HIBYTE(v477);
            int v482 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v482;
            int v477 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v477;
            int v483 = *(_DWORD *)(a1 + 644);
            int v476 = v483 - 8;
            *(_DWORD *)(a1 + 644) = v483 - 8;
          }

          while (v483 > 15);
        }

        int v484 = v476 + v480;
        int v485 = (v481 << -(char)v484) | v477;
        *(_DWORD *)(a1 + 640) = v485;
        *(_DWORD *)(a1 + 644) = v484;
        uint64_t v486 = *(unsigned __int16 *)(v478 + 56);
        int v487 = *(unsigned __int8 *)(v272 + v486);
        int v488 = *(_DWORD *)(v275 + 4 * v486);
        if (v484 >= 8)
        {
          int v489 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v489) = HIBYTE(v485);
            int v489 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v489;
            int v485 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v485;
            int v490 = *(_DWORD *)(a1 + 644);
            int v484 = v490 - 8;
            *(_DWORD *)(a1 + 644) = v490 - 8;
          }

          while (v490 > 15);
        }

        int v491 = v484 + v487;
        int v492 = (v488 << -(char)(v484 + v487)) | v485;
        *(_DWORD *)(a1 + 640) = v492;
        *(_DWORD *)(a1 + 644) = v484 + v487;
        uint64_t v493 = v662 + 2 * v266;
        uint64_t v494 = *(unsigned __int16 *)(v493 + 58);
        int v495 = *(unsigned __int8 *)(v272 + v494);
        int v496 = *(_DWORD *)(v275 + 4 * v494);
        if (v491 >= 8)
        {
          int v497 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v497) = HIBYTE(v492);
            int v497 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v497;
            int v492 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v492;
            int v498 = *(_DWORD *)(a1 + 644);
            int v491 = v498 - 8;
            *(_DWORD *)(a1 + 644) = v498 - 8;
          }

          while (v498 > 15);
        }

        int v499 = v491 + v495;
        int v500 = (v496 << -(char)v499) | v492;
        *(_DWORD *)(a1 + 640) = v500;
        *(_DWORD *)(a1 + 644) = v499;
        uint64_t v501 = *(unsigned __int16 *)(v493 + 60);
        int v502 = *(unsigned __int8 *)(v272 + v501);
        int v503 = *(_DWORD *)(v275 + 4 * v501);
        if (v499 >= 8)
        {
          int v504 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v504) = HIBYTE(v500);
            int v504 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v504;
            int v500 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v500;
            int v505 = *(_DWORD *)(a1 + 644);
            int v499 = v505 - 8;
            *(_DWORD *)(a1 + 644) = v505 - 8;
          }

          while (v505 > 15);
        }

        int v506 = v499 + v502;
        int v507 = (v503 << -(char)(v499 + v502)) | v500;
        *(_DWORD *)(a1 + 640) = v507;
        *(_DWORD *)(a1 + 644) = v499 + v502;
        uint64_t v508 = v662 + 2 * v266;
        uint64_t v509 = *(unsigned __int16 *)(v508 + 62);
        int v510 = *(unsigned __int8 *)(v272 + v509);
        int v511 = *(_DWORD *)(v275 + 4 * v509);
        if (v506 >= 8)
        {
          int v512 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v512) = HIBYTE(v507);
            int v512 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v512;
            int v507 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v507;
            int v513 = *(_DWORD *)(a1 + 644);
            int v506 = v513 - 8;
            *(_DWORD *)(a1 + 644) = v513 - 8;
          }

          while (v513 > 15);
        }

        int v514 = v506 + v510;
        int v515 = (v511 << -(char)v514) | v507;
        *(_DWORD *)(a1 + 640) = v515;
        *(_DWORD *)(a1 + 644) = v514;
        uint64_t v516 = *(unsigned __int16 *)(v508 + 64);
        int v517 = *(unsigned __int8 *)(v272 + v516);
        int v518 = *(_DWORD *)(v275 + 4 * v516);
        if (v514 >= 8)
        {
          int v519 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v519) = HIBYTE(v515);
            int v519 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v519;
            int v515 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v515;
            int v520 = *(_DWORD *)(a1 + 644);
            int v514 = v520 - 8;
            *(_DWORD *)(a1 + 644) = v520 - 8;
          }

          while (v520 > 15);
        }

        int v521 = v514 + v517;
        int v522 = (v518 << -(char)(v514 + v517)) | v515;
        *(_DWORD *)(a1 + 640) = v522;
        *(_DWORD *)(a1 + 644) = v514 + v517;
        uint64_t v523 = v662 + 2 * v266;
        uint64_t v524 = *(unsigned __int16 *)(v523 + 66);
        int v525 = *(unsigned __int8 *)(v272 + v524);
        int v526 = *(_DWORD *)(v275 + 4 * v524);
        if (v521 >= 8)
        {
          int v527 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v527) = HIBYTE(v522);
            int v527 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v527;
            int v522 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v522;
            int v528 = *(_DWORD *)(a1 + 644);
            int v521 = v528 - 8;
            *(_DWORD *)(a1 + 644) = v528 - 8;
          }

          while (v528 > 15);
        }

        int v529 = v521 + v525;
        int v530 = (v526 << -(char)v529) | v522;
        *(_DWORD *)(a1 + 640) = v530;
        *(_DWORD *)(a1 + 644) = v529;
        uint64_t v531 = *(unsigned __int16 *)(v523 + 68);
        int v532 = *(unsigned __int8 *)(v272 + v531);
        int v533 = *(_DWORD *)(v275 + 4 * v531);
        if (v529 >= 8)
        {
          int v534 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v534) = HIBYTE(v530);
            int v534 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v534;
            int v530 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v530;
            int v535 = *(_DWORD *)(a1 + 644);
            int v529 = v535 - 8;
            *(_DWORD *)(a1 + 644) = v535 - 8;
          }

          while (v535 > 15);
        }

        int v536 = v529 + v532;
        int v537 = (v533 << -(char)(v529 + v532)) | v530;
        *(_DWORD *)(a1 + 640) = v537;
        *(_DWORD *)(a1 + 644) = v529 + v532;
        uint64_t v538 = v662 + 2 * v266;
        uint64_t v539 = *(unsigned __int16 *)(v538 + 70);
        int v540 = *(unsigned __int8 *)(v272 + v539);
        int v541 = *(_DWORD *)(v275 + 4 * v539);
        if (v536 >= 8)
        {
          int v542 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v542) = HIBYTE(v537);
            int v542 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v542;
            int v537 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v537;
            int v543 = *(_DWORD *)(a1 + 644);
            int v536 = v543 - 8;
            *(_DWORD *)(a1 + 644) = v543 - 8;
          }

          while (v543 > 15);
        }

        int v544 = v536 + v540;
        int v545 = (v541 << -(char)v544) | v537;
        *(_DWORD *)(a1 + 640) = v545;
        *(_DWORD *)(a1 + 644) = v544;
        uint64_t v546 = *(unsigned __int16 *)(v538 + 72);
        int v547 = *(unsigned __int8 *)(v272 + v546);
        int v548 = *(_DWORD *)(v275 + 4 * v546);
        if (v544 >= 8)
        {
          int v549 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v549) = HIBYTE(v545);
            int v549 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v549;
            int v545 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v545;
            int v550 = *(_DWORD *)(a1 + 644);
            int v544 = v550 - 8;
            *(_DWORD *)(a1 + 644) = v550 - 8;
          }

          while (v550 > 15);
        }

        int v551 = v544 + v547;
        int v552 = (v548 << -(char)(v544 + v547)) | v545;
        *(_DWORD *)(a1 + 640) = v552;
        *(_DWORD *)(a1 + 644) = v544 + v547;
        uint64_t v553 = v662 + 2 * v266;
        uint64_t v554 = *(unsigned __int16 *)(v553 + 74);
        int v555 = *(unsigned __int8 *)(v272 + v554);
        int v556 = *(_DWORD *)(v275 + 4 * v554);
        if (v551 >= 8)
        {
          int v557 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v557) = HIBYTE(v552);
            int v557 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v557;
            int v552 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v552;
            int v558 = *(_DWORD *)(a1 + 644);
            int v551 = v558 - 8;
            *(_DWORD *)(a1 + 644) = v558 - 8;
          }

          while (v558 > 15);
        }

        int v559 = v551 + v555;
        int v560 = (v556 << -(char)v559) | v552;
        *(_DWORD *)(a1 + 640) = v560;
        *(_DWORD *)(a1 + 644) = v559;
        uint64_t v561 = *(unsigned __int16 *)(v553 + 76);
        int v562 = *(unsigned __int8 *)(v272 + v561);
        int v563 = *(_DWORD *)(v275 + 4 * v561);
        if (v559 >= 8)
        {
          int v564 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v564) = HIBYTE(v560);
            int v564 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v564;
            int v560 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v560;
            int v565 = *(_DWORD *)(a1 + 644);
            int v559 = v565 - 8;
            *(_DWORD *)(a1 + 644) = v565 - 8;
          }

          while (v565 > 15);
        }

        int v566 = v559 + v562;
        int v567 = (v563 << -(char)(v559 + v562)) | v560;
        *(_DWORD *)(a1 + 640) = v567;
        *(_DWORD *)(a1 + 644) = v559 + v562;
        uint64_t v568 = v662 + 2 * v266;
        uint64_t v569 = *(unsigned __int16 *)(v568 + 78);
        int v570 = *(unsigned __int8 *)(v272 + v569);
        int v571 = *(_DWORD *)(v275 + 4 * v569);
        if (v566 >= 8)
        {
          int v572 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v572) = HIBYTE(v567);
            int v572 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v572;
            int v567 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v567;
            int v573 = *(_DWORD *)(a1 + 644);
            int v566 = v573 - 8;
            *(_DWORD *)(a1 + 644) = v573 - 8;
          }

          while (v573 > 15);
        }

        int v574 = v566 + v570;
        int v575 = (v571 << -(char)v574) | v567;
        *(_DWORD *)(a1 + 640) = v575;
        *(_DWORD *)(a1 + 644) = v574;
        uint64_t v576 = *(unsigned __int16 *)(v568 + 80);
        int v577 = *(unsigned __int8 *)(v272 + v576);
        int v578 = *(_DWORD *)(v275 + 4 * v576);
        if (v574 >= 8)
        {
          int v579 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v579) = HIBYTE(v575);
            int v579 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v579;
            int v575 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v575;
            int v580 = *(_DWORD *)(a1 + 644);
            int v574 = v580 - 8;
            *(_DWORD *)(a1 + 644) = v580 - 8;
          }

          while (v580 > 15);
        }

        int v581 = v574 + v577;
        int v582 = (v578 << -(char)(v574 + v577)) | v575;
        *(_DWORD *)(a1 + 640) = v582;
        *(_DWORD *)(a1 + 644) = v574 + v577;
        uint64_t v583 = v662 + 2 * v266;
        uint64_t v584 = *(unsigned __int16 *)(v583 + 82);
        int v585 = *(unsigned __int8 *)(v272 + v584);
        int v586 = *(_DWORD *)(v275 + 4 * v584);
        if (v581 >= 8)
        {
          int v587 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v587) = HIBYTE(v582);
            int v587 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v587;
            int v582 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v582;
            int v588 = *(_DWORD *)(a1 + 644);
            int v581 = v588 - 8;
            *(_DWORD *)(a1 + 644) = v588 - 8;
          }

          while (v588 > 15);
        }

        int v589 = v581 + v585;
        int v590 = (v586 << -(char)v589) | v582;
        *(_DWORD *)(a1 + 640) = v590;
        *(_DWORD *)(a1 + 644) = v589;
        uint64_t v591 = *(unsigned __int16 *)(v583 + 84);
        int v592 = *(unsigned __int8 *)(v272 + v591);
        int v593 = *(_DWORD *)(v275 + 4 * v591);
        if (v589 >= 8)
        {
          int v594 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v594) = HIBYTE(v590);
            int v594 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v594;
            int v590 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v590;
            int v595 = *(_DWORD *)(a1 + 644);
            int v589 = v595 - 8;
            *(_DWORD *)(a1 + 644) = v595 - 8;
          }

          while (v595 > 15);
        }

        int v596 = v589 + v592;
        int v597 = (v593 << -(char)(v589 + v592)) | v590;
        *(_DWORD *)(a1 + 640) = v597;
        *(_DWORD *)(a1 + 644) = v589 + v592;
        uint64_t v598 = v662 + 2 * v266;
        uint64_t v599 = *(unsigned __int16 *)(v598 + 86);
        int v600 = *(unsigned __int8 *)(v272 + v599);
        int v601 = *(_DWORD *)(v275 + 4 * v599);
        if (v596 >= 8)
        {
          int v602 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v602) = HIBYTE(v597);
            int v602 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v602;
            int v597 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v597;
            int v603 = *(_DWORD *)(a1 + 644);
            int v596 = v603 - 8;
            *(_DWORD *)(a1 + 644) = v603 - 8;
          }

          while (v603 > 15);
        }

        int v604 = v596 + v600;
        int v605 = (v601 << -(char)v604) | v597;
        *(_DWORD *)(a1 + 640) = v605;
        *(_DWORD *)(a1 + 644) = v604;
        uint64_t v606 = *(unsigned __int16 *)(v598 + 88);
        int v607 = *(unsigned __int8 *)(v272 + v606);
        int v608 = *(_DWORD *)(v275 + 4 * v606);
        if (v604 >= 8)
        {
          int v609 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v609) = HIBYTE(v605);
            int v609 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v609;
            int v605 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v605;
            int v610 = *(_DWORD *)(a1 + 644);
            int v604 = v610 - 8;
            *(_DWORD *)(a1 + 644) = v610 - 8;
          }

          while (v610 > 15);
        }

        int v611 = v604 + v607;
        int v612 = (v608 << -(char)(v604 + v607)) | v605;
        *(_DWORD *)(a1 + 640) = v612;
        *(_DWORD *)(a1 + 644) = v604 + v607;
        uint64_t v613 = v662 + 2 * v266;
        uint64_t v614 = *(unsigned __int16 *)(v613 + 90);
        int v615 = *(unsigned __int8 *)(v272 + v614);
        int v616 = *(_DWORD *)(v275 + 4 * v614);
        if (v611 >= 8)
        {
          int v617 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v617) = HIBYTE(v612);
            int v617 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v617;
            int v612 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v612;
            int v618 = *(_DWORD *)(a1 + 644);
            int v611 = v618 - 8;
            *(_DWORD *)(a1 + 644) = v618 - 8;
          }

          while (v618 > 15);
        }

        int v619 = v611 + v615;
        int v620 = (v616 << -(char)v619) | v612;
        *(_DWORD *)(a1 + 640) = v620;
        *(_DWORD *)(a1 + 644) = v619;
        uint64_t v621 = *(unsigned __int16 *)(v613 + 92);
        int v622 = *(unsigned __int8 *)(v272 + v621);
        int v623 = *(_DWORD *)(v275 + 4 * v621);
        if (v619 >= 8)
        {
          int v624 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v624) = HIBYTE(v620);
            int v624 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v624;
            int v620 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v620;
            int v625 = *(_DWORD *)(a1 + 644);
            int v619 = v625 - 8;
            *(_DWORD *)(a1 + 644) = v625 - 8;
          }

          while (v625 > 15);
        }

        int v626 = v619 + v622;
        int v627 = (v623 << -(char)(v619 + v622)) | v620;
        *(_DWORD *)(a1 + 640) = v627;
        *(_DWORD *)(a1 + 644) = v619 + v622;
        uint64_t v628 = v662 + 2 * v266;
        uint64_t v629 = *(unsigned __int16 *)(v628 + 94);
        int v630 = *(unsigned __int8 *)(v272 + v629);
        int v631 = *(_DWORD *)(v275 + 4 * v629);
        if (v626 >= 8)
        {
          int v632 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v632) = HIBYTE(v627);
            int v632 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v632;
            int v627 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v627;
            int v633 = *(_DWORD *)(a1 + 644);
            int v626 = v633 - 8;
            *(_DWORD *)(a1 + 644) = v633 - 8;
          }

          while (v633 > 15);
        }

        int v634 = v626 + v630;
        int v635 = (v631 << -(char)v634) | v627;
        *(_DWORD *)(a1 + 640) = v635;
        *(_DWORD *)(a1 + 644) = v634;
        uint64_t v636 = *(unsigned __int16 *)(v628 + 96);
        int v637 = *(unsigned __int8 *)(v272 + v636);
        int v638 = *(_DWORD *)(v275 + 4 * v636);
        if (v634 >= 8)
        {
          int v639 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v639) = HIBYTE(v635);
            int v639 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v639;
            int v635 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v635;
            int v640 = *(_DWORD *)(a1 + 644);
            int v634 = v640 - 8;
            *(_DWORD *)(a1 + 644) = v640 - 8;
          }

          while (v640 > 15);
        }

        int v641 = v634 + v637;
        int v642 = (v638 << -(char)v641) | v635;
        *(_DWORD *)(a1 + 640) = v642;
        *(_DWORD *)(a1 + 644) = v641;
        uint64_t v643 = *(unsigned __int16 *)(v662 + 2 * v267);
        int v644 = *(unsigned __int8 *)(v272 + v643);
        int v645 = *(_DWORD *)(v275 + 4 * v643);
        if (v641 >= 8)
        {
          int v646 = *(_DWORD *)(a1 + 116);
          do
          {
            *(_BYTE *)(*(void *)(a1 + 80) + v646) = HIBYTE(v642);
            int v646 = *(_DWORD *)(a1 + 116) + 1;
            *(_DWORD *)(a1 + 116) = v646;
            int v642 = *(_DWORD *)(a1 + 640) << 8;
            *(_DWORD *)(a1 + 640) = v642;
            int v647 = *(_DWORD *)(a1 + 644);
            int v641 = v647 - 8;
            *(_DWORD *)(a1 + 644) = v647 - 8;
          }

          while (v647 > 15);
        }

        *(_DWORD *)(a1 + 640) = (v645 << -(char)(v641 + v644)) | v642;
        *(_DWORD *)(a1 + 644) = v641 + v644;
      }

      else if (v268 >= (int)v266)
      {
        int v648 = *(_DWORD *)(a1 + 644);
        do
        {
          uint64_t v649 = *(unsigned __int16 *)(v662 + 2 * v266);
          int v650 = *(unsigned __int8 *)(a1 + 258LL * *v269 + v649 + 37708);
          int v651 = *(_DWORD *)(a1 + 1032LL * *v269 + 4 * v649 + 39256);
          int v652 = *(_DWORD *)(a1 + 640);
          if (v648 >= 8)
          {
            int v653 = *(_DWORD *)(a1 + 116);
            do
            {
              *(_BYTE *)(*(void *)(a1 + 80) + v653) = HIBYTE(v652);
              int v653 = *(_DWORD *)(a1 + 116) + 1;
              *(_DWORD *)(a1 + 116) = v653;
              int v652 = *(_DWORD *)(a1 + 640) << 8;
              *(_DWORD *)(a1 + 640) = v652;
              int v654 = *(_DWORD *)(a1 + 644);
              int v648 = v654 - 8;
              *(_DWORD *)(a1 + 644) = v654 - 8;
            }

            while (v654 > 15);
          }

          v648 += v650;
          *(_DWORD *)(a1 + 640) = (v651 << -(char)v648) | v652;
          *(_DWORD *)(a1 + 644) = v648;
          ++v266;
        }

        while (v268 + 1 != (_DWORD)v266);
      }

      int v265 = v268 + 1;
      ++v264;
      int v263 = *(_DWORD *)(a1 + 668);
    }

    while (v268 + 1 < v263);
    v219 = (FILE **)MEMORY[0x1895F89D0];
  }

  if ((_DWORD)v264 != v668) {
    sub_18114A0F8(3007);
  }
  return result;
}

uint64_t sub_18114FCBC(uint64_t **a1)
{
  uint64_t v2 = (unsigned int *)a1 + 16009;
  uint64_t v3 = *a1;
  int v4 = *((_DWORD *)a1 + 2) - 10;
  if (*((_DWORD *)a1 + 2) == 10)
  {
    unsigned int v5 = 0LL;
    size_t v6 = 0LL;
    int v7 = 0LL;
    uint64_t v8 = 0LL;
    uint64_t v9 = 0LL;
    uint64_t v10 = 0LL;
    int v11 = 0;
    int v12 = 0;
    uint64_t v13 = 0LL;
    uint64_t v14 = 0LL;
    int v15 = 0;
    int v16 = 0;
    int v441 = 0;
    uint64_t v17 = 0LL;
    unsigned int v18 = 0;
    int v19 = 0;
    uint64_t v20 = 0LL;
    uint64_t v439 = 0LL;
    uint64_t v21 = 0LL;
    uint64_t v22 = 0LL;
    int v440 = 0;
    int i = 0;
    uint64_t n = 0LL;
    *((_OWORD *)a1 + 4008) = 0u;
    *(_OWORD *)((char *)a1 + 64100) = 0u;
    *(_OWORD *)((char *)a1 + 64116) = 0u;
    *(_OWORD *)((char *)a1 + 64068) = 0u;
    *(_OWORD *)((char *)a1 + 64084) = 0u;
    *(_OWORD *)uint64_t v2 = 0u;
    *(_OWORD *)((char *)a1 + 64052) = 0u;
  }

  else
  {
    uint64_t n = *v2;
    int i = *((_DWORD *)a1 + 16010);
    uint64_t v22 = *((unsigned int *)a1 + 16012);
    uint64_t v21 = *((unsigned int *)a1 + 16013);
    HIDWORD(v439) = *((_DWORD *)a1 + 16014);
    int v440 = *((_DWORD *)a1 + 16011);
    uint64_t v20 = *((unsigned int *)a1 + 16016);
    LODWORD(v439) = *((_DWORD *)a1 + 16015);
    int v19 = *((_DWORD *)a1 + 16017);
    unsigned int v18 = *((_DWORD *)a1 + 16018);
    uint64_t v17 = *((unsigned int *)a1 + 16019);
    int v441 = *((_DWORD *)a1 + 16020);
    int v16 = *((_DWORD *)a1 + 16021);
    int v15 = *((_DWORD *)a1 + 16022);
    uint64_t v14 = *((unsigned int *)a1 + 16023);
    uint64_t v13 = *((unsigned int *)a1 + 16024);
    int v12 = *((_DWORD *)a1 + 16025);
    int v11 = *((_DWORD *)a1 + 16026);
    uint64_t v10 = *((unsigned int *)a1 + 16027);
    uint64_t v9 = *((unsigned int *)a1 + 16028);
    uint64_t v8 = *((unsigned int *)a1 + 16029);
    int v7 = a1[8015];
    size_t v6 = a1[8016];
    unsigned int v5 = a1[8017];
  }

  int v442 = v16;
  int v438 = (unsigned __int8 *)a1 + 7884;
  switch(v4)
  {
    case 0:
      *((_DWORD *)a1 + 2) = 10;
      int v25 = *((_DWORD *)a1 + 9);
      if (v25 < 8)
      {
        int v62 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v62 == -1) {
            goto LABEL_8;
          }
          uint64_t v63 = *v3 + 1;
          unsigned int v26 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v25 += 8;
          *((_DWORD *)a1 + 8) = v26;
          *((_DWORD *)a1 + 9) = v25;
          *uint64_t v3 = v63;
          LODWORD(v63) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v62;
          *((_DWORD *)v3 + 3) = v63 + 1;
          if ((_DWORD)v63 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v62;
        }

        while (v25 - 8 < 0);
      }

      else
      {
        unsigned int v26 = *((_DWORD *)a1 + 8);
      }

      int v28 = v25 - 8;
      *((_DWORD *)a1 + 9) = v28;
LABEL_53:
      *((_DWORD *)a1 + 2) = 11;
      if (v28 < 8)
      {
        int v65 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v65 == -1) {
            goto LABEL_8;
          }
          uint64_t v66 = *v3 + 1;
          unsigned int v64 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v28 += 8;
          *((_DWORD *)a1 + 8) = v64;
          *((_DWORD *)a1 + 9) = v28;
          *uint64_t v3 = v66;
          LODWORD(v66) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v65;
          *((_DWORD *)v3 + 3) = v66 + 1;
          if ((_DWORD)v66 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v65;
        }

        while (v28 - 8 < 0);
      }

      else
      {
        unsigned int v64 = *((_DWORD *)a1 + 8);
      }

      int v29 = v28 - 8;
      *((_DWORD *)a1 + 9) = v29;
LABEL_61:
      *((_DWORD *)a1 + 2) = 12;
      if (v29 < 8)
      {
        int v68 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v68 == -1) {
            goto LABEL_8;
          }
          uint64_t v69 = *v3 + 1;
          unsigned int v67 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v29 += 8;
          *((_DWORD *)a1 + 8) = v67;
          *((_DWORD *)a1 + 9) = v29;
          *uint64_t v3 = v69;
          LODWORD(v69) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v68;
          *((_DWORD *)v3 + 3) = v69 + 1;
          if ((_DWORD)v69 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v68;
        }

        while (v29 - 8 < 0);
      }

      else
      {
        unsigned int v67 = *((_DWORD *)a1 + 8);
      }

      int v30 = v29 - 8;
      *((_DWORD *)a1 + 9) = v30;
LABEL_69:
      *((_DWORD *)a1 + 2) = 13;
      if (v30 < 8)
      {
        int v71 = *((_DWORD *)v3 + 2) - 1;
        do
        {
          if (v71 == -1) {
            goto LABEL_8;
          }
          uint64_t v72 = *v3 + 1;
          unsigned int v70 = *(unsigned __int8 *)*v3 | (*((_DWORD *)a1 + 8) << 8);
          v30 += 8;
          *((_DWORD *)a1 + 8) = v70;
          *((_DWORD *)a1 + 9) = v30;
          *uint64_t v3 = v72;
          LODWORD(v72) = *((_DWORD *)v3 + 3);
          *((_DWORD *)v3 + 2) = v71;
          *((_DWORD *)v3 + 3) = v72 + 1;
          if ((_DWORD)v72 == -1) {
            ++*((_DWORD *)v3 + 4);
          }
          --v71;
        }

        while (v30 - 8 < 0);
      }

      else
      {
        unsigned int v70 = *((_DWORD *)a1 + 8);
      }

      int v73 = v30 - 8;
      int v74 = (v70 >> (v30 - 8));
      *((_DWORD *)a1 + 9) = v73;
      *((_DWORD *)a1 + 10) = v74;
      if ((v74 - 58) < 0xFFFFFFF7)
      {
LABEL_77:
        uint64_t result = 4294967291LL;
        goto LABEL_461;
      }

      int v411 = n;
      int v414 = v7;
      int v390 = v13;
      int v393 = v15;
      uint64_t v426 = v6;
      uint64_t v434 = v5;
      int v417 = v9;
      int v421 = v20;
      int v399 = v19;
      int v430 = v11;
      int v423 = v14;
      int v75 = v21;
      int v76 = v22;
      int v77 = v74 - 48;
      *((_DWORD *)a1 + 10) = v74 - 48;
      int v78 = (unsigned __int8 *)v3[7];
      int v79 = (unsigned __int8 *)v3[9];
      if (*((_BYTE *)a1 + 44))
      {
        a1[395] = (uint64_t *)((uint64_t (*)(unsigned __int8 *, void, uint64_t))v78)( v79,  (200000 * v77),  1LL);
        uint64_t v80 = ((uint64_t (*)(uint64_t, void, uint64_t))v3[7])( v3[9],  ((100000 * *((_DWORD *)a1 + 10)) >> 1),  1LL);
        a1[396] = (uint64_t *)v80;
        uint64_t result = 4294967293LL;
        LODWORD(v22) = v76;
        LODWORD(v21) = v75;
        if (!a1[395])
        {
          LODWORD(v14) = v423;
          int v7 = v414;
          LODWORD(v9) = v417;
          LODWORD(v13) = v390;
          int v15 = v393;
          int v11 = v430;
          int v19 = v399;
          LODWORD(v20) = v421;
          unsigned int v5 = v434;
          size_t v6 = v426;
          LODWORD(n) = v411;
          goto LABEL_461;
        }

        LODWORD(v14) = v423;
        int v7 = v414;
        LODWORD(v9) = v417;
        LODWORD(v13) = v390;
        int v15 = v393;
        int v11 = v430;
        int v19 = v399;
        LODWORD(v20) = v421;
        unsigned int v5 = v434;
        size_t v6 = v426;
        LODWORD(n) = v411;
        if (!v80)
        {
LABEL_461:
          *uint64_t v2 = n;
          *((_DWORD *)a1 + 16010) = i;
          *((_DWORD *)a1 + 16011) = v440;
          *((_DWORD *)a1 + 16012) = v22;
          *((_DWORD *)a1 + 16013) = v21;
          *((_DWORD *)a1 + 16014) = HIDWORD(v439);
          *((_DWORD *)a1 + 16015) = v439;
          *((_DWORD *)a1 + 16016) = v20;
          *((_DWORD *)a1 + 16017) = v19;
          *((_DWORD *)a1 + 16018) = v18;
          *((_DWORD *)a1 + 16019) = v17;
          *((_DWORD *)a1 + 16020) = v441;
          *((_DWORD *)a1 + 16021) = v442;
          *((_DWORD *)a1 + 16022) = v15;
          *((_DWORD *)a1 + 16023) = v14;
          *((_DWORD *)a1 + 16024) = v13;
          *((_DWORD *)a1 + 16025) = v12;
          *((_DWORD *)a1 + 16026) = v11;
          *((_DWORD *)a1 + 16027) = v10;
          *((_DWORD *)a1 + 16028) = v9;
          *((_DWORD *)a1 + 16029) = v8;
          a1[8015] = v7;
          a1[8016] = v6;
          a1[8017] = v5;
          return result;
        }
      }

      else
      {
        uint64_t v81 = ((uint64_t (*)(unsigned __int8 *, void, uint64_t))v78)(v79, (400000 * v77), 1LL);
        a1[394] = (uint64_t *)v81;
        LODWORD(v22) = v76;
        LODWORD(v21) = v75;
        LODWORD(v14) = v423;
        int v7 = v414;
        LODWORD(v9) = v417;
        LODWORD(v13) = v390;
        int v15 = v393;
        int v11 = v430;
        int v19 = v399;
        LODWORD(v20) = v421;
        unsigned int v5 = v434;
        size_t v6 = v426;
        LODWORD(n) = v411;
        if (!v81)
        {
          uint64_t result = 4294967293LL;
          goto LABEL_461;
        }
      }

LABEL_83:
      *((_DWORD *)a1 + 2) = 14;
      int v82 = *((_DWORD *)a1 + 9);
      if (v82 < 8)
      {
        int v84 = *a1;
        int v85 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v85 == -1) {
            goto LABEL_8;
          }
          uint64_t v86 = *v84 + 1;
          unsigned int v83 = *(unsigned __int8 *)*v84 | (*((_DWORD *)a1 + 8) << 8);
          v82 += 8;
          *((_DWORD *)a1 + 8) = v83;
          *((_DWORD *)a1 + 9) = v82;
          uint64_t *v84 = v86;
          LODWORD(v86) = *((_DWORD *)v84 + 3);
          *((_DWORD *)v84 + 2) = v85;
          *((_DWORD *)v84 + 3) = v86 + 1;
          if ((_DWORD)v86 == -1) {
            ++*((_DWORD *)v84 + 4);
          }
          --v85;
        }

        while (v82 - 8 < 0);
      }

      else
      {
        unsigned int v83 = *((_DWORD *)a1 + 8);
      }

      int v31 = v82 - 8;
      *((_DWORD *)a1 + 9) = v31;
      int v87 = (v83 >> v31);
      if (v87 == 23)
      {
LABEL_94:
        *((_DWORD *)a1 + 2) = 42;
        if (v31 < 8)
        {
          int v150 = *a1;
          int v151 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v151 == -1) {
              goto LABEL_8;
            }
            uint64_t v152 = *v150 + 1;
            unsigned int v89 = *(unsigned __int8 *)*v150 | (*((_DWORD *)a1 + 8) << 8);
            v31 += 8;
            *((_DWORD *)a1 + 8) = v89;
            *((_DWORD *)a1 + 9) = v31;
            *int v150 = v152;
            LODWORD(v152) = *((_DWORD *)v150 + 3);
            *((_DWORD *)v150 + 2) = v151;
            *((_DWORD *)v150 + 3) = v152 + 1;
            if ((_DWORD)v152 == -1) {
              ++*((_DWORD *)v150 + 4);
            }
            --v151;
          }

          while (v31 - 8 < 0);
        }

        else
        {
          unsigned int v89 = *((_DWORD *)a1 + 8);
        }

        int v49 = v31 - 8;
        *((_DWORD *)a1 + 9) = v49;
        if ((v89 >> v49) == 114)
        {
LABEL_209:
          *((_DWORD *)a1 + 2) = 43;
          if (v49 < 8)
          {
            int v154 = *a1;
            int v155 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v155 == -1) {
                goto LABEL_8;
              }
              uint64_t v156 = *v154 + 1;
              unsigned int v153 = *(unsigned __int8 *)*v154 | (*((_DWORD *)a1 + 8) << 8);
              v49 += 8;
              *((_DWORD *)a1 + 8) = v153;
              *((_DWORD *)a1 + 9) = v49;
              *int v154 = v156;
              LODWORD(v156) = *((_DWORD *)v154 + 3);
              *((_DWORD *)v154 + 2) = v155;
              *((_DWORD *)v154 + 3) = v156 + 1;
              if ((_DWORD)v156 == -1) {
                ++*((_DWORD *)v154 + 4);
              }
              --v155;
            }

            while (v49 - 8 < 0);
          }

          else
          {
            unsigned int v153 = *((_DWORD *)a1 + 8);
          }

          int v50 = v49 - 8;
          *((_DWORD *)a1 + 9) = v50;
          if ((v153 >> v50) == 69)
          {
LABEL_217:
            *((_DWORD *)a1 + 2) = 44;
            if (v50 < 8)
            {
              int v158 = *a1;
              int v159 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v159 == -1) {
                  goto LABEL_8;
                }
                uint64_t v160 = *v158 + 1;
                unsigned int v157 = *(unsigned __int8 *)*v158 | (*((_DWORD *)a1 + 8) << 8);
                v50 += 8;
                *((_DWORD *)a1 + 8) = v157;
                *((_DWORD *)a1 + 9) = v50;
                *int v158 = v160;
                LODWORD(v160) = *((_DWORD *)v158 + 3);
                *((_DWORD *)v158 + 2) = v159;
                *((_DWORD *)v158 + 3) = v160 + 1;
                if ((_DWORD)v160 == -1) {
                  ++*((_DWORD *)v158 + 4);
                }
                --v159;
              }

              while (v50 - 8 < 0);
            }

            else
            {
              unsigned int v157 = *((_DWORD *)a1 + 8);
            }

            int v51 = v50 - 8;
            *((_DWORD *)a1 + 9) = v51;
            if ((v157 >> v51) == 56)
            {
LABEL_225:
              *((_DWORD *)a1 + 2) = 45;
              if (v51 < 8)
              {
                v162 = *a1;
                int v163 = *((_DWORD *)*a1 + 2) - 1;
                do
                {
                  if (v163 == -1) {
                    goto LABEL_8;
                  }
                  uint64_t v164 = *v162 + 1;
                  unsigned int v161 = *(unsigned __int8 *)*v162 | (*((_DWORD *)a1 + 8) << 8);
                  v51 += 8;
                  *((_DWORD *)a1 + 8) = v161;
                  *((_DWORD *)a1 + 9) = v51;
                  uint64_t *v162 = v164;
                  LODWORD(v164) = *((_DWORD *)v162 + 3);
                  *((_DWORD *)v162 + 2) = v163;
                  *((_DWORD *)v162 + 3) = v164 + 1;
                  if ((_DWORD)v164 == -1) {
                    ++*((_DWORD *)v162 + 4);
                  }
                  --v163;
                }

                while (v51 - 8 < 0);
              }

              else
              {
                unsigned int v161 = *((_DWORD *)a1 + 8);
              }

              int v52 = v51 - 8;
              *((_DWORD *)a1 + 9) = v52;
              if ((v161 >> v52) == 80)
              {
LABEL_233:
                *((_DWORD *)a1 + 2) = 46;
                if (v52 < 8)
                {
                  int v166 = *a1;
                  int v167 = *((_DWORD *)*a1 + 2) - 1;
                  do
                  {
                    if (v167 == -1) {
                      goto LABEL_8;
                    }
                    uint64_t v168 = *v166 + 1;
                    unsigned int v165 = *(unsigned __int8 *)*v166 | (*((_DWORD *)a1 + 8) << 8);
                    v52 += 8;
                    *((_DWORD *)a1 + 8) = v165;
                    *((_DWORD *)a1 + 9) = v52;
                    *int v166 = v168;
                    LODWORD(v168) = *((_DWORD *)v166 + 3);
                    *((_DWORD *)v166 + 2) = v167;
                    *((_DWORD *)v166 + 3) = v168 + 1;
                    if ((_DWORD)v168 == -1) {
                      ++*((_DWORD *)v166 + 4);
                    }
                    --v167;
                  }

                  while (v52 - 8 < 0);
                }

                else
                {
                  unsigned int v165 = *((_DWORD *)a1 + 8);
                }

                int v53 = v52 - 8;
                *((_DWORD *)a1 + 9) = v53;
                if ((v165 >> v53) == 144)
                {
                  *((_DWORD *)a1 + 795) = 0;
LABEL_242:
                  *((_DWORD *)a1 + 2) = 47;
                  if (v53 < 8)
                  {
                    int v170 = *a1;
                    int v171 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v171 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v172 = *v170 + 1;
                      unsigned int v169 = *(unsigned __int8 *)*v170 | (*((_DWORD *)a1 + 8) << 8);
                      v53 += 8;
                      *((_DWORD *)a1 + 8) = v169;
                      *((_DWORD *)a1 + 9) = v53;
                      *int v170 = v172;
                      LODWORD(v172) = *((_DWORD *)v170 + 3);
                      *((_DWORD *)v170 + 2) = v171;
                      *((_DWORD *)v170 + 3) = v172 + 1;
                      if ((_DWORD)v172 == -1) {
                        ++*((_DWORD *)v170 + 4);
                      }
                      --v171;
                    }

                    while (v53 - 8 < 0);
                  }

                  else
                  {
                    unsigned int v169 = *((_DWORD *)a1 + 8);
                  }

                  int v54 = v53 - 8;
                  *((_DWORD *)a1 + 9) = v54;
                  *((_DWORD *)a1 + 795) = (v169 >> v54) | (*((_DWORD *)a1 + 795) << 8);
LABEL_250:
                  *((_DWORD *)a1 + 2) = 48;
                  if (v54 < 8)
                  {
                    int v174 = *a1;
                    int v175 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v175 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v176 = *v174 + 1;
                      unsigned int v173 = *(unsigned __int8 *)*v174 | (*((_DWORD *)a1 + 8) << 8);
                      v54 += 8;
                      *((_DWORD *)a1 + 8) = v173;
                      *((_DWORD *)a1 + 9) = v54;
                      *int v174 = v176;
                      LODWORD(v176) = *((_DWORD *)v174 + 3);
                      *((_DWORD *)v174 + 2) = v175;
                      *((_DWORD *)v174 + 3) = v176 + 1;
                      if ((_DWORD)v176 == -1) {
                        ++*((_DWORD *)v174 + 4);
                      }
                      --v175;
                    }

                    while (v54 - 8 < 0);
                  }

                  else
                  {
                    unsigned int v173 = *((_DWORD *)a1 + 8);
                  }

                  int v55 = v54 - 8;
                  *((_DWORD *)a1 + 9) = v55;
                  *((_DWORD *)a1 + 795) = (v173 >> v55) | (*((_DWORD *)a1 + 795) << 8);
LABEL_258:
                  *((_DWORD *)a1 + 2) = 49;
                  if (v55 < 8)
                  {
                    uint64_t v178 = *a1;
                    int v179 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v179 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v180 = *v178 + 1;
                      unsigned int v177 = *(unsigned __int8 *)*v178 | (*((_DWORD *)a1 + 8) << 8);
                      v55 += 8;
                      *((_DWORD *)a1 + 8) = v177;
                      *((_DWORD *)a1 + 9) = v55;
                      *uint64_t v178 = v180;
                      LODWORD(v180) = *((_DWORD *)v178 + 3);
                      *((_DWORD *)v178 + 2) = v179;
                      *((_DWORD *)v178 + 3) = v180 + 1;
                      if ((_DWORD)v180 == -1) {
                        ++*((_DWORD *)v178 + 4);
                      }
                      --v179;
                    }

                    while (v55 - 8 < 0);
                  }

                  else
                  {
                    unsigned int v177 = *((_DWORD *)a1 + 8);
                  }

                  int v56 = v55 - 8;
                  *((_DWORD *)a1 + 9) = v56;
                  *((_DWORD *)a1 + 795) = (v177 >> v56) | (*((_DWORD *)a1 + 795) << 8);
LABEL_266:
                  *((_DWORD *)a1 + 2) = 50;
                  if (v56 < 8)
                  {
                    v182 = *a1;
                    int v183 = *((_DWORD *)*a1 + 2) - 1;
                    do
                    {
                      if (v183 == -1) {
                        goto LABEL_8;
                      }
                      uint64_t v184 = *v182 + 1;
                      unsigned int v181 = *(unsigned __int8 *)*v182 | (*((_DWORD *)a1 + 8) << 8);
                      v56 += 8;
                      *((_DWORD *)a1 + 8) = v181;
                      *((_DWORD *)a1 + 9) = v56;
                      uint64_t *v182 = v184;
                      LODWORD(v184) = *((_DWORD *)v182 + 3);
                      *((_DWORD *)v182 + 2) = v183;
                      *((_DWORD *)v182 + 3) = v184 + 1;
                      if ((_DWORD)v184 == -1) {
                        ++*((_DWORD *)v182 + 4);
                      }
                      --v183;
                    }

                    while (v56 - 8 < 0);
                  }

                  else
                  {
                    unsigned int v181 = *((_DWORD *)a1 + 8);
                  }

                  int v185 = v56 - 8;
                  *((_DWORD *)a1 + 9) = v185;
                  *((_DWORD *)a1 + 795) = (v181 >> v185) | (*((_DWORD *)a1 + 795) << 8);
                  *((_DWORD *)a1 + 2) = 1;
                  uint64_t result = 4LL;
                  goto LABEL_461;
                }
              }
            }
          }
        }

        goto LABEL_460;
      }

      if (v87 != 49) {
        goto LABEL_460;
      }
LABEL_92:
      *((_DWORD *)a1 + 2) = 15;
      if (v31 < 8)
      {
        unint64_t v90 = *a1;
        int v91 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v91 == -1) {
            goto LABEL_8;
          }
          uint64_t v92 = *v90 + 1;
          unsigned int v88 = *(unsigned __int8 *)*v90 | (*((_DWORD *)a1 + 8) << 8);
          v31 += 8;
          *((_DWORD *)a1 + 8) = v88;
          *((_DWORD *)a1 + 9) = v31;
          uint64_t *v90 = v92;
          LODWORD(v92) = *((_DWORD *)v90 + 3);
          *((_DWORD *)v90 + 2) = v91;
          *((_DWORD *)v90 + 3) = v92 + 1;
          if ((_DWORD)v92 == -1) {
            ++*((_DWORD *)v90 + 4);
          }
          --v91;
        }

        while (v31 - 8 < 0);
      }

      else
      {
        unsigned int v88 = *((_DWORD *)a1 + 8);
      }

      int v32 = v31 - 8;
      *((_DWORD *)a1 + 9) = v32;
LABEL_102:
      *((_DWORD *)a1 + 2) = 16;
      if (v32 < 8)
      {
        int v94 = *a1;
        int v95 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v95 == -1) {
            goto LABEL_8;
          }
          uint64_t v96 = *v94 + 1;
          unsigned int v93 = *(unsigned __int8 *)*v94 | (*((_DWORD *)a1 + 8) << 8);
          v32 += 8;
          *((_DWORD *)a1 + 8) = v93;
          *((_DWORD *)a1 + 9) = v32;
          *int v94 = v96;
          LODWORD(v96) = *((_DWORD *)v94 + 3);
          *((_DWORD *)v94 + 2) = v95;
          *((_DWORD *)v94 + 3) = v96 + 1;
          if ((_DWORD)v96 == -1) {
            ++*((_DWORD *)v94 + 4);
          }
          --v95;
        }

        while (v32 - 8 < 0);
      }

      else
      {
        unsigned int v93 = *((_DWORD *)a1 + 8);
      }

      int v33 = v32 - 8;
      *((_DWORD *)a1 + 9) = v33;
LABEL_110:
      *((_DWORD *)a1 + 2) = 17;
      if (v33 < 8)
      {
        int v98 = *a1;
        int v99 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v99 == -1) {
            goto LABEL_8;
          }
          uint64_t v100 = *v98 + 1;
          unsigned int v97 = *(unsigned __int8 *)*v98 | (*((_DWORD *)a1 + 8) << 8);
          v33 += 8;
          *((_DWORD *)a1 + 8) = v97;
          *((_DWORD *)a1 + 9) = v33;
          *int v98 = v100;
          LODWORD(v100) = *((_DWORD *)v98 + 3);
          *((_DWORD *)v98 + 2) = v99;
          *((_DWORD *)v98 + 3) = v100 + 1;
          if ((_DWORD)v100 == -1) {
            ++*((_DWORD *)v98 + 4);
          }
          --v99;
        }

        while (v33 - 8 < 0);
      }

      else
      {
        unsigned int v97 = *((_DWORD *)a1 + 8);
      }

      int v34 = v33 - 8;
      *((_DWORD *)a1 + 9) = v34;
LABEL_118:
      *((_DWORD *)a1 + 2) = 18;
      if (v34 < 8)
      {
        int v102 = *a1;
        int v103 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v103 == -1) {
            goto LABEL_8;
          }
          uint64_t v104 = *v102 + 1;
          unsigned int v101 = *(unsigned __int8 *)*v102 | (*((_DWORD *)a1 + 8) << 8);
          v34 += 8;
          *((_DWORD *)a1 + 8) = v101;
          *((_DWORD *)a1 + 9) = v34;
          *int v102 = v104;
          LODWORD(v104) = *((_DWORD *)v102 + 3);
          *((_DWORD *)v102 + 2) = v103;
          *((_DWORD *)v102 + 3) = v104 + 1;
          if ((_DWORD)v104 == -1) {
            ++*((_DWORD *)v102 + 4);
          }
          --v103;
        }

        while (v34 - 8 < 0);
      }

      else
      {
        unsigned int v101 = *((_DWORD *)a1 + 8);
      }

      int v35 = v34 - 8;
      *((_DWORD *)a1 + 9) = v35;
LABEL_126:
      *((_DWORD *)a1 + 2) = 19;
      if (v35 < 8)
      {
        unint64_t v106 = *a1;
        int v107 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v107 == -1) {
            goto LABEL_8;
          }
          uint64_t v108 = *v106 + 1;
          unsigned int v105 = *(unsigned __int8 *)*v106 | (*((_DWORD *)a1 + 8) << 8);
          v35 += 8;
          *((_DWORD *)a1 + 8) = v105;
          *((_DWORD *)a1 + 9) = v35;
          *unint64_t v106 = v108;
          LODWORD(v108) = *((_DWORD *)v106 + 3);
          *((_DWORD *)v106 + 2) = v107;
          *((_DWORD *)v106 + 3) = v108 + 1;
          if ((_DWORD)v108 == -1) {
            ++*((_DWORD *)v106 + 4);
          }
          --v107;
        }

        while (v35 - 8 < 0);
      }

      else
      {
        unsigned int v105 = *((_DWORD *)a1 + 8);
      }

      int v109 = v35 - 8;
      *((_DWORD *)a1 + 9) = v109;
      int v110 = *((_DWORD *)a1 + 13);
      int v111 = *((_DWORD *)a1 + 12) + 1;
      *((_DWORD *)a1 + 12) = v111;
      if (v110 >= 2)
      {
        int v405 = v21;
        int v408 = i;
        int v427 = v6;
        int v435 = v5;
        int v418 = v9;
        unsigned int v402 = v18;
        int v397 = v22;
        int v112 = v15;
        int v431 = v11;
        int v113 = v19;
        int v424 = v14;
        int v114 = v20;
        int v115 = v13;
        int v412 = n;
        fprintf((FILE *)*MEMORY[0x1895F89D0], "\n    [%d: huff+mtf ", v111);
        LODWORD(v13) = v115;
        LODWORD(v20) = v114;
        LODWORD(v14) = v424;
        int v19 = v113;
        int v11 = v431;
        int v15 = v112;
        unsigned int v18 = v402;
        LODWORD(v22) = v397;
        LODWORD(v9) = v418;
        uint64_t v10 = v10;
        LODWORD(n) = v412;
        unsigned int v5 = v435;
        LODWORD(v21) = v405;
        int i = v408;
        size_t v6 = v427;
      }

      *((_DWORD *)a1 + 794) = 0;
LABEL_137:
      *((_DWORD *)a1 + 2) = 20;
      int v116 = *((_DWORD *)a1 + 9);
      if (v116 < 8)
      {
        int v118 = *a1;
        int v119 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v119 == -1) {
            goto LABEL_8;
          }
          uint64_t v120 = *v118 + 1;
          unsigned int v117 = *(unsigned __int8 *)*v118 | (*((_DWORD *)a1 + 8) << 8);
          v116 += 8;
          *((_DWORD *)a1 + 8) = v117;
          *((_DWORD *)a1 + 9) = v116;
          *int v118 = v120;
          LODWORD(v120) = *((_DWORD *)v118 + 3);
          *((_DWORD *)v118 + 2) = v119;
          *((_DWORD *)v118 + 3) = v120 + 1;
          if ((_DWORD)v120 == -1) {
            ++*((_DWORD *)v118 + 4);
          }
          --v119;
        }

        while (v116 - 8 < 0);
      }

      else
      {
        unsigned int v117 = *((_DWORD *)a1 + 8);
      }

      int v36 = v116 - 8;
      *((_DWORD *)a1 + 9) = v36;
      *((_DWORD *)a1 + 794) = (v117 >> v36) | (*((_DWORD *)a1 + 794) << 8);
LABEL_145:
      *((_DWORD *)a1 + 2) = 21;
      if (v36 < 8)
      {
        int v122 = *a1;
        int v123 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v123 == -1) {
            goto LABEL_8;
          }
          uint64_t v124 = *v122 + 1;
          unsigned int v121 = *(unsigned __int8 *)*v122 | (*((_DWORD *)a1 + 8) << 8);
          v36 += 8;
          *((_DWORD *)a1 + 8) = v121;
          *((_DWORD *)a1 + 9) = v36;
          *int v122 = v124;
          LODWORD(v124) = *((_DWORD *)v122 + 3);
          *((_DWORD *)v122 + 2) = v123;
          *((_DWORD *)v122 + 3) = v124 + 1;
          if ((_DWORD)v124 == -1) {
            ++*((_DWORD *)v122 + 4);
          }
          --v123;
        }

        while (v36 - 8 < 0);
      }

      else
      {
        unsigned int v121 = *((_DWORD *)a1 + 8);
      }

      int v37 = v36 - 8;
      *((_DWORD *)a1 + 9) = v37;
      *((_DWORD *)a1 + 794) = (v121 >> v37) | (*((_DWORD *)a1 + 794) << 8);
LABEL_153:
      *((_DWORD *)a1 + 2) = 22;
      if (v37 < 8)
      {
        int v126 = *a1;
        int v127 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v127 == -1) {
            goto LABEL_8;
          }
          uint64_t v128 = *v126 + 1;
          unsigned int v125 = *(unsigned __int8 *)*v126 | (*((_DWORD *)a1 + 8) << 8);
          v37 += 8;
          *((_DWORD *)a1 + 8) = v125;
          *((_DWORD *)a1 + 9) = v37;
          *int v126 = v128;
          LODWORD(v128) = *((_DWORD *)v126 + 3);
          *((_DWORD *)v126 + 2) = v127;
          *((_DWORD *)v126 + 3) = v128 + 1;
          if ((_DWORD)v128 == -1) {
            ++*((_DWORD *)v126 + 4);
          }
          --v127;
        }

        while (v37 - 8 < 0);
      }

      else
      {
        unsigned int v125 = *((_DWORD *)a1 + 8);
      }

      int v38 = v37 - 8;
      *((_DWORD *)a1 + 9) = v38;
      *((_DWORD *)a1 + 794) = (v125 >> v38) | (*((_DWORD *)a1 + 794) << 8);
LABEL_161:
      *((_DWORD *)a1 + 2) = 23;
      if (v38 < 8)
      {
        int v130 = *a1;
        int v131 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v131 == -1) {
            goto LABEL_8;
          }
          uint64_t v132 = *v130 + 1;
          unsigned int v129 = *(unsigned __int8 *)*v130 | (*((_DWORD *)a1 + 8) << 8);
          v38 += 8;
          *((_DWORD *)a1 + 8) = v129;
          *((_DWORD *)a1 + 9) = v38;
          *int v130 = v132;
          LODWORD(v132) = *((_DWORD *)v130 + 3);
          *((_DWORD *)v130 + 2) = v131;
          *((_DWORD *)v130 + 3) = v132 + 1;
          if ((_DWORD)v132 == -1) {
            ++*((_DWORD *)v130 + 4);
          }
          --v131;
        }

        while (v38 - 8 < 0);
      }

      else
      {
        unsigned int v129 = *((_DWORD *)a1 + 8);
      }

      int v39 = v38 - 8;
      *((_DWORD *)a1 + 9) = v39;
      *((_DWORD *)a1 + 794) = (v129 >> v39) | (*((_DWORD *)a1 + 794) << 8);
LABEL_169:
      *((_DWORD *)a1 + 2) = 24;
      if (v39 < 1)
      {
        unint64_t v134 = *a1;
        int v135 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v135 == -1) {
            goto LABEL_8;
          }
          uint64_t v136 = *v134 + 1;
          unsigned int v133 = *(unsigned __int8 *)*v134 | (*((_DWORD *)a1 + 8) << 8);
          v39 += 8;
          *((_DWORD *)a1 + 8) = v133;
          *((_DWORD *)a1 + 9) = v39;
          *unint64_t v134 = v136;
          LODWORD(v136) = *((_DWORD *)v134 + 3);
          *((_DWORD *)v134 + 2) = v135;
          *((_DWORD *)v134 + 3) = v136 + 1;
          if ((_DWORD)v136 == -1) {
            ++*((_DWORD *)v134 + 4);
          }
          --v135;
        }

        while (v39 - 8 <= -8);
      }

      else
      {
        unsigned int v133 = *((_DWORD *)a1 + 8);
      }

      int v40 = v39 - 1;
      *((_DWORD *)a1 + 9) = v40;
      *((_BYTE *)a1 + 20) = (v133 >> v40) & 1;
      *((_DWORD *)a1 + 14) = 0;
LABEL_177:
      *((_DWORD *)a1 + 2) = 25;
      if (v40 < 8)
      {
        int v138 = *a1;
        int v139 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v139 == -1) {
            goto LABEL_8;
          }
          uint64_t v140 = *v138 + 1;
          unsigned int v137 = *(unsigned __int8 *)*v138 | (*((_DWORD *)a1 + 8) << 8);
          v40 += 8;
          *((_DWORD *)a1 + 8) = v137;
          *((_DWORD *)a1 + 9) = v40;
          *int v138 = v140;
          LODWORD(v140) = *((_DWORD *)v138 + 3);
          *((_DWORD *)v138 + 2) = v139;
          *((_DWORD *)v138 + 3) = v140 + 1;
          if ((_DWORD)v140 == -1) {
            ++*((_DWORD *)v138 + 4);
          }
          --v139;
        }

        while (v40 - 8 < 0);
      }

      else
      {
        unsigned int v137 = *((_DWORD *)a1 + 8);
      }

      int v41 = v40 - 8;
      *((_DWORD *)a1 + 9) = v41;
      *((_DWORD *)a1 + 14) = (v137 >> v41) | (*((_DWORD *)a1 + 14) << 8);
LABEL_185:
      *((_DWORD *)a1 + 2) = 26;
      if (v41 < 8)
      {
        int v142 = *a1;
        int v143 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v143 == -1) {
            goto LABEL_8;
          }
          uint64_t v144 = *v142 + 1;
          unsigned int v141 = *(unsigned __int8 *)*v142 | (*((_DWORD *)a1 + 8) << 8);
          v41 += 8;
          *((_DWORD *)a1 + 8) = v141;
          *((_DWORD *)a1 + 9) = v41;
          *int v142 = v144;
          LODWORD(v144) = *((_DWORD *)v142 + 3);
          *((_DWORD *)v142 + 2) = v143;
          *((_DWORD *)v142 + 3) = v144 + 1;
          if ((_DWORD)v144 == -1) {
            ++*((_DWORD *)v142 + 4);
          }
          --v143;
        }

        while (v41 - 8 < 0);
      }

      else
      {
        unsigned int v141 = *((_DWORD *)a1 + 8);
      }

      int v42 = v41 - 8;
      *((_DWORD *)a1 + 9) = v42;
      *((_DWORD *)a1 + 14) = (v141 >> v42) | (*((_DWORD *)a1 + 14) << 8);
LABEL_193:
      *((_DWORD *)a1 + 2) = 27;
      if (v42 < 8)
      {
        unint64_t v146 = *a1;
        int v147 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v147 == -1) {
            goto LABEL_8;
          }
          uint64_t v148 = *v146 + 1;
          unsigned int v145 = *(unsigned __int8 *)*v146 | (*((_DWORD *)a1 + 8) << 8);
          v42 += 8;
          *((_DWORD *)a1 + 8) = v145;
          *((_DWORD *)a1 + 9) = v42;
          *unint64_t v146 = v148;
          LODWORD(v148) = *((_DWORD *)v146 + 3);
          *((_DWORD *)v146 + 2) = v147;
          *((_DWORD *)v146 + 3) = v148 + 1;
          if ((_DWORD)v148 == -1) {
            ++*((_DWORD *)v146 + 4);
          }
          --v147;
        }

        while (v42 - 8 < 0);
      }

      else
      {
        unsigned int v145 = *((_DWORD *)a1 + 8);
      }

      *((_DWORD *)a1 + 9) = v42 - 8;
      int v149 = (v145 >> (v42 - 8)) | (*((_DWORD *)a1 + 14) << 8);
      *((_DWORD *)a1 + 14) = v149;
      if (v149 < 0 || v149 > ((100000 * *((_DWORD *)a1 + 10)) | 0xA)) {
        goto LABEL_460;
      }
      LODWORD(n) = 0;
      while ((int)n < 16)
      {
LABEL_277:
        *((_DWORD *)a1 + 2) = 28;
        int v186 = *((_DWORD *)a1 + 9);
        if (v186 < 1)
        {
          BOOL v188 = *a1;
          int v189 = *((_DWORD *)*a1 + 2) - 1;
          while (v189 != -1)
          {
            uint64_t v190 = *v188 + 1;
            unsigned int v187 = *(unsigned __int8 *)*v188 | (*((_DWORD *)a1 + 8) << 8);
            v186 += 8;
            *((_DWORD *)a1 + 8) = v187;
            *((_DWORD *)a1 + 9) = v186;
            *BOOL v188 = v190;
            LODWORD(v190) = *((_DWORD *)v188 + 3);
            *((_DWORD *)v188 + 2) = v189;
            *((_DWORD *)v188 + 3) = v190 + 1;
            if ((_DWORD)v190 == -1) {
              ++*((_DWORD *)v188 + 4);
            }
            --v189;
            if (v186 - 8 > -8) {
              goto LABEL_284;
            }
          }

          goto LABEL_8;
        }

        unsigned int v187 = *((_DWORD *)a1 + 8);
LABEL_284:
        int v191 = v186 - 1;
        *((_DWORD *)a1 + 9) = v191;
        *((_BYTE *)a1 + (int)n + 3452) = (v187 >> v191) & 1;
        LODWORD(n) = n + 1;
      }

      LODWORD(n) = 0;
      *(_OWORD *)((char *)a1 + 3420) = 0u;
      *(_OWORD *)((char *)a1 + 3436) = 0u;
      *(_OWORD *)((char *)a1 + 3388) = 0u;
      *(_OWORD *)((char *)a1 + 3404) = 0u;
      *(_OWORD *)((char *)a1 + 3356) = 0u;
      *(_OWORD *)((char *)a1 + 3372) = 0u;
      *(_OWORD *)((char *)a1 + 3324) = 0u;
      *(_OWORD *)((char *)a1 + 3340) = 0u;
      *(_OWORD *)((char *)a1 + 3292) = 0u;
      *(_OWORD *)((char *)a1 + 3308) = 0u;
      *(_OWORD *)((char *)a1 + 3260) = 0u;
      *(_OWORD *)((char *)a1 + 3276) = 0u;
      *(_OWORD *)((char *)a1 + 3228) = 0u;
      *(_OWORD *)((char *)a1 + 3244) = 0u;
      *(_OWORD *)((char *)a1 + 3196) = 0u;
      *(_OWORD *)((char *)a1 + 3212) = 0u;
      while ((int)n <= 15)
      {
        if (*((_BYTE *)a1 + (int)n + 3452))
        {
          for (int i = 0; ; ++i)
          {
            if (i > 15) {
              goto LABEL_484;
            }
LABEL_482:
            *((_DWORD *)a1 + 2) = 29;
            int v332 = *((_DWORD *)a1 + 9);
            if (v332 < 1) {
              break;
            }
            unsigned int v333 = *((_DWORD *)a1 + 8);
LABEL_490:
            int v337 = v332 - 1;
            *((_DWORD *)a1 + 9) = v337;
            if (((v333 >> v337) & 1) != 0) {
              *((_BYTE *)&a1[2 * (int)n + 399] + i + 4) = 1;
            }
          }

          int v334 = *a1;
          int v335 = *((_DWORD *)*a1 + 2) - 1;
          while (v335 != -1)
          {
            uint64_t v336 = *v334 + 1;
            unsigned int v333 = *(unsigned __int8 *)*v334 | (*((_DWORD *)a1 + 8) << 8);
            v332 += 8;
            *((_DWORD *)a1 + 8) = v333;
            *((_DWORD *)a1 + 9) = v332;
            *int v334 = v336;
            LODWORD(v336) = *((_DWORD *)v334 + 3);
            *((_DWORD *)v334 + 2) = v335;
            *((_DWORD *)v334 + 3) = v336 + 1;
            if ((_DWORD)v336 == -1) {
              ++*((_DWORD *)v334 + 4);
            }
            --v335;
            if (v332 - 8 > -8) {
              goto LABEL_490;
            }
          }

          goto LABEL_8;
        }

LABEL_484:
        LODWORD(n) = n + 1;
      }

      int v325 = 0;
      uint64_t v326 = 0LL;
      *((_DWORD *)a1 + 798) = 0;
      do
      {
        if (*((_BYTE *)a1 + v326 + 3196))
        {
          *((_BYTE *)a1 + v325 + 3468) = v326;
          int v325 = *((_DWORD *)a1 + 798) + 1;
          *((_DWORD *)a1 + 798) = v325;
        }

        ++v326;
      }

      while (v326 != 256);
      if (!v325) {
        goto LABEL_460;
      }
      uint64_t v22 = (v325 + 2);
LABEL_472:
      *((_DWORD *)a1 + 2) = 30;
      int v327 = *((_DWORD *)a1 + 9);
      if (v327 < 3)
      {
        uint64_t v329 = *a1;
        int v330 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v330 == -1) {
            goto LABEL_8;
          }
          uint64_t v331 = *v329 + 1;
          unsigned int v328 = *(unsigned __int8 *)*v329 | (*((_DWORD *)a1 + 8) << 8);
          v327 += 8;
          *((_DWORD *)a1 + 8) = v328;
          *((_DWORD *)a1 + 9) = v327;
          *uint64_t v329 = v331;
          LODWORD(v331) = *((_DWORD *)v329 + 3);
          *((_DWORD *)v329 + 2) = v330;
          *((_DWORD *)v329 + 3) = v331 + 1;
          if ((_DWORD)v331 == -1) {
            ++*((_DWORD *)v329 + 4);
          }
          --v330;
        }

        while (v327 - 8 <= -6);
      }

      else
      {
        unsigned int v328 = *((_DWORD *)a1 + 8);
      }

      int v43 = v327 - 3;
      LODWORD(v21) = (v328 >> v43) & 7;
      *((_DWORD *)a1 + 9) = v43;
      if (((1 << ((v328 >> v43) & 7)) & 0x83) != 0) {
        goto LABEL_460;
      }
LABEL_25:
      *((_DWORD *)a1 + 2) = 31;
      if (v43 < 15)
      {
        int v57 = *a1;
        int v58 = *((_DWORD *)*a1 + 2) - 1;
        do
        {
          if (v58 == -1) {
            goto LABEL_8;
          }
          uint64_t v59 = *v57 + 1;
          unsigned int v44 = *(unsigned __int8 *)*v57 | (*((_DWORD *)a1 + 8) << 8);
          v43 += 8;
          *((_DWORD *)a1 + 8) = v44;
          *((_DWORD *)a1 + 9) = v43;
          *int v57 = v59;
          LODWORD(v59) = *((_DWORD *)v57 + 3);
          *((_DWORD *)v57 + 2) = v58;
          *((_DWORD *)v57 + 3) = v59 + 1;
          if ((_DWORD)v59 == -1) {
            ++*((_DWORD *)v57 + 4);
          }
          --v58;
        }

        while (v43 - 8 <= 6);
      }

      else
      {
        unsigned int v44 = *((_DWORD *)a1 + 8);
      }

      int v60 = 0;
      int v61 = v43 - 15;
      *((_DWORD *)a1 + 9) = v61;
      HIDWORD(v439) = (v44 >> v61) & 0x7FFF;
      if (!HIDWORD(v439))
      {
        uint64_t result = 4294967292LL;
        HIDWORD(v439) = 0;
        goto LABEL_461;
      }

LABEL_493:
      if (v60 < SHIDWORD(v439))
      {
        int i = 0;
        LODWORD(n) = v60;
LABEL_495:
        int v338 = *((_DWORD *)a1 + 9);
        uint64_t result = 4294967292LL;
        while (1)
        {
          *((_DWORD *)a1 + 2) = 32;
          if (v338 < 1) {
            break;
          }
          unsigned int v339 = *((_DWORD *)a1 + 8);
LABEL_503:
          *((_DWORD *)a1 + 9) = --v338;
          if (((v339 >> v338) & 1) == 0)
          {
            int v60 = n + 1;
            goto LABEL_493;
          }
        }

        int v340 = *a1;
        int v341 = *((_DWORD *)*a1 + 2) - 1;
        while (v341 != -1)
        {
          uint64_t v342 = *v340 + 1;
          unsigned int v339 = *(unsigned __int8 *)*v340 | (*((_DWORD *)a1 + 8) << 8);
          v338 += 8;
          *((_DWORD *)a1 + 8) = v339;
          *((_DWORD *)a1 + 9) = v338;
          *int v340 = v342;
          LODWORD(v342) = *((_DWORD *)v340 + 3);
          *((_DWORD *)v340 + 2) = v341;
          *((_DWORD *)v340 + 3) = v342 + 1;
          if ((_DWORD)v342 == -1) {
            ++*((_DWORD *)v340 + 4);
          }
          --v341;
          if (v338 - 8 > -8) {
            goto LABEL_503;
          }
        }

        uint64_t result = 0LL;
        goto LABEL_461;
      }

      if (SHIDWORD(v439) >= 18002) {
        int v343 = 18002;
      }
      else {
        int v343 = HIDWORD(v439);
      }
      if ((int)v21 >= 1)
      {
        int v344 = 0;
        do
        {
          v443[v344] = v344;
          ++v344;
        }

        while ((int)v21 > v344);
      }

      if (SHIDWORD(v439) < 1)
      {
        LODWORD(n) = 0;
      }

      else
      {
        int v345 = v20;
        int v346 = v19;
        uint64_t v347 = 0LL;
        if (v343 <= 1) {
          uint64_t v348 = 1LL;
        }
        else {
          uint64_t v348 = v343;
        }
        LODWORD(n) = v348;
        do
        {
          uint64_t v349 = *((unsigned __int8 *)a1 + v347 + 25886);
          char v350 = v443[v349];
          if (*((_BYTE *)a1 + v347 + 25886))
          {
            do
            {
              v443[v349] = v443[(v349 - 1)];
              --v349;
            }

            while ((_BYTE)v349);
          }

          v443[0] = v350;
          *((_BYTE *)a1 + v347++ + 7884) = v350;
        }

        while (v347 != v348);
        int v19 = v346;
        LODWORD(v20) = v345;
      }

      HIDWORD(v439) = v343;
      for (int j = 0; ; int j = v440 + 1)
      {
        int v440 = j;
LABEL_528:
        *((_DWORD *)a1 + 2) = 33;
        int v352 = *((_DWORD *)a1 + 9);
        if (v352 < 5)
        {
          int v354 = *a1;
          int v355 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v355 == -1) {
              goto LABEL_8;
            }
            uint64_t v356 = *v354 + 1;
            unsigned int v353 = *(unsigned __int8 *)*v354 | (*((_DWORD *)a1 + 8) << 8);
            v352 += 8;
            *((_DWORD *)a1 + 8) = v353;
            *((_DWORD *)a1 + 9) = v352;
            *int v354 = v356;
            LODWORD(v356) = *((_DWORD *)v354 + 3);
            *((_DWORD *)v354 + 2) = v355;
            *((_DWORD *)v354 + 3) = v356 + 1;
            if ((_DWORD)v356 == -1) {
              ++*((_DWORD *)v354 + 4);
            }
            --v355;
          }

          while (v352 - 8 <= -4);
        }

        else
        {
          unsigned int v353 = *((_DWORD *)a1 + 8);
        }

        LODWORD(n) = 0;
        int v357 = v352 - 5;
        LODWORD(v14) = (v353 >> v357) & 0x1F;
        *((_DWORD *)a1 + 9) = v357;
LABEL_564:
        if ((int)n < (int)v22)
        {
          while (1)
          {
LABEL_567:
            *((_DWORD *)a1 + 2) = 34;
            int v380 = *((_DWORD *)a1 + 9);
            if (v380 < 1) {
              break;
            }
            unsigned int v381 = *((_DWORD *)a1 + 8);
LABEL_574:
            int v45 = v380 - 1;
            *((_DWORD *)a1 + 9) = v45;
            if (((v381 >> v45) & 1) == 0)
            {
              *((_BYTE *)a1 + 258 * v440 + (int)n + 43888) = v14;
              LODWORD(n) = n + 1;
              goto LABEL_564;
            }

LABEL_575:
            *((_DWORD *)a1 + 2) = 35;
            if (v45 < 1)
            {
              int v386 = *a1;
              int v387 = *((_DWORD *)*a1 + 2) - 1;
              while (v387 != -1)
              {
                uint64_t v388 = *v386 + 1;
                unsigned int v385 = *(unsigned __int8 *)*v386 | (*((_DWORD *)a1 + 8) << 8);
                v45 += 8;
                *((_DWORD *)a1 + 8) = v385;
                *((_DWORD *)a1 + 9) = v45;
                *int v386 = v388;
                LODWORD(v388) = *((_DWORD *)v386 + 3);
                *((_DWORD *)v386 + 2) = v387;
                *((_DWORD *)v386 + 3) = v388 + 1;
                if ((_DWORD)v388 == -1) {
                  ++*((_DWORD *)v386 + 4);
                }
                --v387;
                if (v45 - 8 > -8) {
                  goto LABEL_582;
                }
              }

              goto LABEL_8;
            }

            unsigned int v385 = *((_DWORD *)a1 + 8);
LABEL_582:
            int v389 = v45 - 1;
            *((_DWORD *)a1 + 9) = v389;
            if (((v385 >> v389) & 1) != 0) {
              LODWORD(v14) = v14 - 1;
            }
            else {
              LODWORD(v14) = v14 + 1;
            }
          }

          int v382 = *a1;
          int v383 = *((_DWORD *)*a1 + 2) - 1;
          while (v383 != -1)
          {
            uint64_t v384 = *v382 + 1;
            unsigned int v381 = *(unsigned __int8 *)*v382 | (*((_DWORD *)a1 + 8) << 8);
            v380 += 8;
            *((_DWORD *)a1 + 8) = v381;
            *((_DWORD *)a1 + 9) = v380;
            *int v382 = v384;
            LODWORD(v384) = *((_DWORD *)v382 + 3);
            *((_DWORD *)v382 + 2) = v383;
            *((_DWORD *)v382 + 3) = v384 + 1;
            if ((_DWORD)v384 == -1) {
              ++*((_DWORD *)v382 + 4);
            }
            --v383;
            if (v380 - 8 > -8) {
              goto LABEL_574;
            }
          }

          goto LABEL_8;
        }
      }

      int v429 = v6;
      int v433 = v11;
      unsigned int v392 = v13;
      int v396 = v15;
      unsigned int v407 = v21;
      int v410 = i;
      int v404 = v8;
      int v420 = v9;
      int v437 = v5;
      unsigned int v425 = v14;
      if ((int)v21 < 1)
      {
        uint64_t v368 = v22;
        int v440 = 0;
      }

      else
      {
        int v416 = v7;
        unsigned int v401 = v10;
        uint64_t v358 = 0LL;
        uint64_t v359 = (unsigned __int8 *)(a1 + 5486);
        uint64_t v360 = v21;
        uint64_t v361 = v22;
        do
        {
          if ((int)v22 < 1)
          {
            int v362 = 0;
            int v363 = 32;
          }

          else
          {
            int v362 = 0;
            int v363 = 32;
            uint64_t v364 = v361;
            int v365 = v359;
            do
            {
              int v367 = *v365++;
              int v366 = v367;
              if (v362 <= v367) {
                int v362 = v366;
              }
              if (v363 >= v366) {
                int v363 = v366;
              }
              --v364;
            }

            while (v364);
          }

          uint64_t v368 = v22;
          sub_181152E3C( (uint64_t **)((char *)&a1[129 * v358 + 5679] + 4),  (uint64_t **)((char *)&a1[129 * v358 + 6453] + 4),  (uint64_t)&a1[129 * v358 + 7227] + 4,  (unsigned __int8 *)a1 + 258 * v358 + 43888,  v363,  v362,  v22);
          uint64_t v22 = v368;
          *((_DWORD *)a1 + v358++ + 16003) = v363;
          v359 += 258;
        }

        while (v358 != v360);
        int v440 = v407;
        uint64_t v10 = v401;
        int v7 = v416;
      }

      int v369 = *((_DWORD *)a1 + 798);
      int v370 = *((_DWORD *)a1 + 10);
      bzero((char *)a1 + 68, 0x400uLL);
      uint64_t v371 = 0LL;
      uint64_t v17 = (100000 * v370);
      int v372 = 4095;
      do
      {
        int8x16_t v373 = vrev64q_s8(vorrq_s8(vdupq_n_s8(16 * (int)v371 - 16), (int8x16_t)xmmword_1811534F0));
        *(int8x16_t *)((char *)a1 + v372 + 3709) = vextq_s8(v373, v373, 8uLL);
        *((_DWORD *)a1 + v371-- + 1970) = v372 - 15;
        v372 -= 16;
      }

      while (v371 != -16);
      LODWORD(v439) = v369 + 1;
      uint64_t v22 = v368;
      LODWORD(v8) = v404;
      int v15 = v396;
      int v11 = v433;
      unsigned int v5 = v437;
      size_t v6 = v429;
      if (SHIDWORD(v439) < 1)
      {
        int v441 = 0;
        int v19 = 0;
        LODWORD(v20) = 0;
        uint64_t result = 4294967292LL;
        LODWORD(n) = 256;
        LODWORD(v21) = v407;
        int i = v410;
        LODWORD(v9) = v420;
        LODWORD(v13) = v392;
        LODWORD(v14) = v425;
        goto LABEL_461;
      }

      int v441 = 0;
      uint64_t v20 = 0LL;
      uint64_t v9 = *v438;
      uint64_t v374 = &a1[129 * v9];
      size_t v6 = (uint64_t *)((char *)v374 + 51628);
      unsigned int v5 = (uint64_t *)((char *)v374 + 57820);
      int v7 = (uint64_t *)((char *)v374 + 45436);
      uint64_t v8 = *((unsigned int *)a1 + v9 + 16003);
      uint64_t n = 256LL;
      int v19 = 49;
      int v12 = *((_DWORD *)a1 + v9 + 16003);
      uint64_t v21 = v407;
      int i = v410;
      uint64_t v13 = v392;
      uint64_t v14 = v425;
LABEL_554:
      *((_DWORD *)a1 + 2) = 36;
      int v375 = *((_DWORD *)a1 + 9);
      if (v375 < v12)
      {
        int v376 = *a1;
        int v377 = *((_DWORD *)*a1 + 2) - 1;
        while (v377 != -1)
        {
          uint64_t v378 = *v376 + 1;
          unsigned int v379 = *(unsigned __int8 *)*v376 | (*((_DWORD *)a1 + 8) << 8);
          v375 += 8;
          *((_DWORD *)a1 + 8) = v379;
          *((_DWORD *)a1 + 9) = v375;
          *int v376 = v378;
          LODWORD(v378) = *((_DWORD *)v376 + 3);
          *((_DWORD *)v376 + 2) = v377;
          *((_DWORD *)v376 + 3) = v378 + 1;
          if ((_DWORD)v378 == -1) {
            ++*((_DWORD *)v376 + 4);
          }
          --v377;
          if (v375 >= v12) {
            goto LABEL_562;
          }
        }

LABEL_8:
        uint64_t result = 0LL;
        goto LABEL_461;
      }

      unsigned int v379 = *((_DWORD *)a1 + 8);
LABEL_562:
      int v46 = v375 - v12;
      int v11 = (v379 >> v46) & ~(-1 << v12);
      *((_DWORD *)a1 + 9) = v46;
      while (1)
      {
        if (v12 > 20) {
          goto LABEL_460;
        }
        if (v11 <= *((_DWORD *)v7 + v12)) {
          break;
        }
        ++v12;
LABEL_286:
        *((_DWORD *)a1 + 2) = 37;
        if (v46 < 1)
        {
          v193 = *a1;
          int v194 = *((_DWORD *)*a1 + 2) - 1;
          do
          {
            if (v194 == -1) {
              goto LABEL_8;
            }
            uint64_t v195 = *v193 + 1;
            unsigned int v192 = *(unsigned __int8 *)*v193 | (*((_DWORD *)a1 + 8) << 8);
            v46 += 8;
            *((_DWORD *)a1 + 8) = v192;
            *((_DWORD *)a1 + 9) = v46;
            uint64_t *v193 = v195;
            LODWORD(v195) = *((_DWORD *)v193 + 3);
            *((_DWORD *)v193 + 2) = v194;
            *((_DWORD *)v193 + 3) = v195 + 1;
            if ((_DWORD)v195 == -1) {
              ++*((_DWORD *)v193 + 4);
            }
            --v194;
          }

          while (v46 - 8 <= -8);
        }

        else
        {
          unsigned int v192 = *((_DWORD *)a1 + 8);
        }

        uint64_t v10 = (v192 >> --v46) & 1;
        *((_DWORD *)a1 + 9) = v46;
        int v11 = (v192 >> v46) & 1 | (2 * v11);
      }

      unsigned int v196 = v11 - *((_DWORD *)v6 + v12);
      if (v196 > 0x101)
      {
LABEL_460:
        uint64_t result = 4294967292LL;
        goto LABEL_461;
      }

      unsigned int v18 = *((_DWORD *)v5 + v196);
      int v197 = v442;
      while (v18 != (_DWORD)v439)
      {
        unsigned int v198 = v18 - 1;
        if (v18 > 1)
        {
          int v442 = v197;
          if (v18 > 0x10)
          {
            uint64_t v214 = v198 >> 4;
            v215 = (int *)a1 + v214 + 1955;
            LODWORD(v216) = *v215;
            unsigned int v202 = *((unsigned __int8 *)a1 + (v198 & 0xF) + (uint64_t)*v215 + 3724);
            if ((v198 & 0xF) != 0)
            {
              int64_t v217 = (int)v216 + (unint64_t)(v198 & 0xF);
              do
              {
                *((_BYTE *)a1 + v217 + 3724) = *((_BYTE *)a1 + v217 + 3723);
                int64_t v216 = *v215;
                --v217;
              }

              while (v217 > v216);
            }

            int *v215 = v216 + 1;
            uint64_t v218 = (uint64_t)a1 + 7820;
            do
            {
              uint64_t v219 = *(int *)(v218 + 4 * v214) - 1LL;
              *(_DWORD *)(v218 + 4 * v214) = v219;
              BOOL v220 = v214-- <= 1;
              *((_BYTE *)a1 + v219 + 3724) = *((_BYTE *)a1 + *((int *)a1 + v214 + 1955) + 3739);
            }

            while (!v220);
            uint64_t v221 = *((int *)a1 + 1955) - 1LL;
            *((_DWORD *)a1 + 1955) = v221;
            *((_BYTE *)a1 + v221 + 3724) = v202;
            if (!*((_DWORD *)a1 + 1955))
            {
              int v394 = v15;
              uint64_t v222 = v22;
              int v223 = v7;
              uint64_t v224 = v21;
              uint64_t v225 = v9;
              uint64_t v226 = v17;
              uint64_t v227 = v10;
              uint64_t v228 = n;
              uint64_t v229 = v8;
              uint64_t v230 = v14;
              uint64_t v231 = v13;
              int v232 = v6;
              unsigned int v233 = v18;
              int v234 = v5;
              int v235 = v19;
              int v236 = 4095;
              uint64_t v237 = 15LL;
              do
              {
                uint64_t v238 = 0LL;
                uint64_t v239 = v237;
                int v240 = (int *)a1 + v237 + 1955;
                uint64_t v241 = (uint64_t)a1 + 3724;
                do
                {
                  *(_BYTE *)(v241 + v236) = *(_BYTE *)(v241 + *v240 + 15);
                  ++v238;
                  --v241;
                }

                while ((_DWORD)v238 != 16);
                *int v240 = v236 - 15;
                uint64_t v237 = v239 - 1;
                v236 -= 16;
              }

              while (v239);
              int v19 = v235;
              unsigned int v5 = v234;
              unsigned int v18 = v233;
              size_t v6 = v232;
              uint64_t v13 = v231;
              uint64_t v14 = v230;
              uint64_t v8 = v229;
              uint64_t n = v228;
              uint64_t v10 = v227;
              uint64_t v17 = v226;
              uint64_t v9 = v225;
              uint64_t v21 = v224;
              int v7 = v223;
              uint64_t v22 = v222;
              int v15 = v394;
            }
          }

          else
          {
            uint64_t v201 = *((int *)a1 + 1955);
            unsigned int v202 = *((unsigned __int8 *)a1 + v201 + v198 + 3724);
            if (v198 < 4) {
              goto LABEL_308;
            }
            int v203 = v19;
            int v204 = v201 - 1;
            unsigned int v205 = v18;
            do
            {
              int v206 = v204 + v205 - 1;
              *((_BYTE *)a1 + (int)(v204 + v205) + 3724) = *((_BYTE *)a1 + v206 + 3724);
              int v207 = v204 + v205 - 2;
              *((_BYTE *)a1 + v206 + 3724) = *((_BYTE *)a1 + v207 + 3724);
              int v208 = v204 + v205 - 3;
              *((_BYTE *)a1 + v207 + 3724) = *((_BYTE *)a1 + v208 + 3724);
              unsigned int v209 = v205 - 4;
              *((_BYTE *)a1 + v208 + 3724) = *((_BYTE *)a1 + (int)(v205 - 4 + v204) + 3724);
              unsigned int v210 = v205 - 5;
              v205 -= 4;
            }

            while (v210 > 3);
            unsigned int v198 = v209 - 1;
            int v19 = v203;
            if (v209 != 1)
            {
LABEL_308:
              unsigned int v211 = v198 + v201;
              uint64_t v212 = v198 - 1LL;
              do
              {
                *((_BYTE *)a1 + v211 + 3724) = *((_BYTE *)a1 + v211 + 3723);
                int v213 = v212--;
                --v211;
              }

              while (v213);
            }

            *((_BYTE *)a1 + v201 + 3724) = v202;
          }

          uint64_t v242 = *((unsigned __int8 *)a1 + v202 + 3468);
          ++*((_DWORD *)a1 + v242 + 17);
          if (*((_BYTE *)a1 + 44)) {
            *((_WORD *)a1[395] + v441) = v242;
          }
          else {
            *((_DWORD *)a1[394] + v441) = v242;
          }
          ++v441;
          uint64_t v243 = v20;
          if (!v19)
          {
            uint64_t v243 = (int)v20 + 1LL;
            if ((int)v243 >= SHIDWORD(v439))
            {
              int v19 = 0;
              uint64_t result = 4294967292LL;
              LODWORD(v20) = v20 + 1;
              goto LABEL_461;
            }

            uint64_t v8 = *((unsigned int *)a1 + *((unsigned __int8 *)a1 + v243 + 7884) + 16003);
            unsigned int v244 = &a1[129 * *((unsigned __int8 *)a1 + v243 + 7884)];
            int v7 = (uint64_t *)((char *)v244 + 45436);
            unsigned int v5 = (uint64_t *)((char *)v244 + 57820);
            size_t v6 = (uint64_t *)((char *)v244 + 51628);
            int v19 = 50;
            uint64_t v9 = *((unsigned __int8 *)a1 + v243 + 7884);
          }

          --v19;
          int v12 = v8;
          uint64_t v20 = v243;
LABEL_330:
          *((_DWORD *)a1 + 2) = 40;
          int v245 = *((_DWORD *)a1 + 9);
          if (v245 >= v12)
          {
            unsigned int v249 = *((_DWORD *)a1 + 8);
          }

          else
          {
            int v246 = *a1;
            int v247 = *((_DWORD *)*a1 + 2) - 1;
            do
            {
              if (v247 == -1) {
                goto LABEL_8;
              }
              uint64_t v248 = *v246 + 1;
              unsigned int v249 = *(unsigned __int8 *)*v246 | (*((_DWORD *)a1 + 8) << 8);
              v245 += 8;
              *((_DWORD *)a1 + 8) = v249;
              *((_DWORD *)a1 + 9) = v245;
              *int v246 = v248;
              LODWORD(v248) = *((_DWORD *)v246 + 3);
              *((_DWORD *)v246 + 2) = v247;
              *((_DWORD *)v246 + 3) = v248 + 1;
              if ((_DWORD)v248 == -1) {
                ++*((_DWORD *)v246 + 4);
              }
              --v247;
            }

            while (v245 < v12);
          }

          int v48 = v245 - v12;
          int v11 = (v249 >> v48) & ~(-1 << v12);
          *((_DWORD *)a1 + 9) = v48;
          while (1)
          {
            if (v12 > 20) {
              goto LABEL_460;
            }
            if (v11 <= *((_DWORD *)v7 + v12)) {
              break;
            }
            ++v12;
LABEL_447:
            *((_DWORD *)a1 + 2) = 41;
            if (v48 < 1)
            {
              uint64_t v321 = *a1;
              int v322 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v322 == -1) {
                  goto LABEL_8;
                }
                uint64_t v323 = *v321 + 1;
                unsigned int v320 = *(unsigned __int8 *)*v321 | (*((_DWORD *)a1 + 8) << 8);
                v48 += 8;
                *((_DWORD *)a1 + 8) = v320;
                *((_DWORD *)a1 + 9) = v48;
                *uint64_t v321 = v323;
                LODWORD(v323) = *((_DWORD *)v321 + 3);
                *((_DWORD *)v321 + 2) = v322;
                *((_DWORD *)v321 + 3) = v323 + 1;
                if ((_DWORD)v323 == -1) {
                  ++*((_DWORD *)v321 + 4);
                }
                --v322;
              }

              while (v48 - 8 <= -8);
            }

            else
            {
              unsigned int v320 = *((_DWORD *)a1 + 8);
            }

            uint64_t v10 = (v320 >> --v48) & 1;
            *((_DWORD *)a1 + 9) = v48;
            int v11 = (v320 >> v48) & 1 | (2 * v11);
          }

          unsigned int v324 = v11 - *((_DWORD *)v6 + v12);
          int v197 = v442;
          if (v324 > 0x101) {
            goto LABEL_460;
          }
          unsigned int v18 = *((_DWORD *)v5 + v324);
        }

        else
        {
          int v199 = -1;
          for (int k = 1; ; int k = v15)
          {
            if (k >= 0x200000)
            {
              int v442 = v199;
              uint64_t result = 4294967292LL;
              int v15 = k;
              goto LABEL_461;
            }

            int v15 = 2 * k;
            if (v18) {
              k *= 2;
            }
            int v442 = k + v199;
            if (!v19)
            {
              uint64_t v20 = (int)v20 + 1LL;
              if ((int)v20 >= SHIDWORD(v439))
              {
                int v19 = 0;
                goto LABEL_460;
              }

              uint64_t v9 = *((unsigned __int8 *)a1 + v20 + 7884);
              uint64_t v8 = *((unsigned int *)a1 + v9 + 16003);
              int v303 = &a1[129 * v9];
              int v7 = (uint64_t *)((char *)v303 + 45436);
              unsigned int v5 = (uint64_t *)((char *)v303 + 57820);
              size_t v6 = (uint64_t *)((char *)v303 + 51628);
              int v19 = 50;
            }

            --v19;
            int v12 = v8;
LABEL_401:
            *((_DWORD *)a1 + 2) = 38;
            int v304 = *((_DWORD *)a1 + 9);
            if (v304 >= v12)
            {
              unsigned int v308 = *((_DWORD *)a1 + 8);
            }

            else
            {
              int v305 = *a1;
              int v306 = *((_DWORD *)*a1 + 2) - 1;
              do
              {
                if (v306 == -1) {
                  goto LABEL_8;
                }
                uint64_t v307 = *v305 + 1;
                unsigned int v308 = *(unsigned __int8 *)*v305 | (*((_DWORD *)a1 + 8) << 8);
                v304 += 8;
                *((_DWORD *)a1 + 8) = v308;
                *((_DWORD *)a1 + 9) = v304;
                *int v305 = v307;
                LODWORD(v307) = *((_DWORD *)v305 + 3);
                *((_DWORD *)v305 + 2) = v306;
                *((_DWORD *)v305 + 3) = v307 + 1;
                if ((_DWORD)v307 == -1) {
                  ++*((_DWORD *)v305 + 4);
                }
                --v306;
              }

              while (v304 < v12);
            }

            int v47 = v304 - v12;
            int v11 = (v308 >> v47) & ~(-1 << v12);
            *((_DWORD *)a1 + 9) = v47;
            while (1)
            {
              if (v12 > 20) {
                goto LABEL_460;
              }
              if (v11 <= *((_DWORD *)v7 + v12)) {
                break;
              }
              ++v12;
LABEL_412:
              *((_DWORD *)a1 + 2) = 39;
              if (v47 < 1)
              {
                int v310 = *a1;
                int v311 = *((_DWORD *)*a1 + 2) - 1;
                do
                {
                  if (v311 == -1) {
                    goto LABEL_8;
                  }
                  uint64_t v312 = *v310 + 1;
                  unsigned int v309 = *(unsigned __int8 *)*v310 | (*((_DWORD *)a1 + 8) << 8);
                  v47 += 8;
                  *((_DWORD *)a1 + 8) = v309;
                  *((_DWORD *)a1 + 9) = v47;
                  *int v310 = v312;
                  LODWORD(v312) = *((_DWORD *)v310 + 3);
                  *((_DWORD *)v310 + 2) = v311;
                  *((_DWORD *)v310 + 3) = v312 + 1;
                  if ((_DWORD)v312 == -1) {
                    ++*((_DWORD *)v310 + 4);
                  }
                  --v311;
                }

                while (v47 - 8 <= -8);
              }

              else
              {
                unsigned int v309 = *((_DWORD *)a1 + 8);
              }

              uint64_t v10 = (v309 >> --v47) & 1;
              *((_DWORD *)a1 + 9) = v47;
              int v11 = (v309 >> v47) & 1 | (2 * v11);
            }

            unsigned int v313 = v11 - *((_DWORD *)v6 + v12);
            int v199 = v442;
            if (v313 > 0x101) {
              goto LABEL_460;
            }
            unsigned int v18 = *((_DWORD *)v5 + v313);
            if (v18 >= 2) {
              break;
            }
          }

          int v314 = v442 + 1;
          uint64_t v315 = *((unsigned __int8 *)a1 + *((unsigned __int8 *)a1 + *((int *)a1 + 1955) + 3724) + 3468);
          *((_DWORD *)a1 + v315 + 17) += v442 + 1;
          if (*((_BYTE *)a1 + 44))
          {
            if ((v442 & 0x80000000) == 0)
            {
              else {
                int v316 = v441;
              }
              uint64_t v317 = v441;
              int v441 = v316;
              while (v316 != v317)
              {
                *((_WORD *)a1[395] + v317++) = v315;
                BOOL v318 = __OFSUB__(v314--, 1);
                if ((v314 < 0) ^ v318 | (v314 == 0)) {
                  goto LABEL_444;
                }
              }

LABEL_446:
              uint64_t result = 4294967292LL;
              int v442 = v314;
              goto LABEL_461;
            }

LABEL_445:
            int v197 = v442 + 1;
          }

          else
          {
            if (v442 < 0) {
              goto LABEL_445;
            }
            else {
              int v319 = v441;
            }
            uint64_t v317 = v441;
            int v441 = v319;
            do
            {
              if (v319 == v317) {
                goto LABEL_446;
              }
              *((_DWORD *)a1[394] + v317++) = v315;
              BOOL v318 = __OFSUB__(v314--, 1);
            }

            while (!((v314 < 0) ^ v318 | (v314 == 0)));
LABEL_444:
            int v197 = v314;
            int v441 = v317;
          }
        }
      }

      int v250 = *((_DWORD *)a1 + 14);
      uint64_t result = 4294967292LL;
      int v442 = v197;
      if (v250 < 0 || v250 >= v441)
      {
        LODWORD(v439) = v18;
        goto LABEL_461;
      }

      int v409 = i;
      for (uint64_t m = 0LL; m != 256; ++m)
      {
        int v252 = *((_DWORD *)a1 + m + 17);
        if (v252 < 0 || v252 > v441)
        {
          uint64_t result = 4294967292LL;
          LODWORD(v439) = v18;
          LODWORD(n) = m;
          int i = v409;
          goto LABEL_461;
        }
      }

      int v253 = v21;
      uint64_t v254 = 0LL;
      uint64_t v255 = (uint64_t)(a1 + 137);
      *((_DWORD *)a1 + 274) = 0;
      do
      {
        *(_OWORD *)((char *)&a1[v254 + 137] + 4) = *(_OWORD *)((char *)&a1[v254 + 8] + 4);
        v254 += 2LL;
      }

      while (v254 != 128);
      uint64_t v256 = 0LL;
      int v257 = 0;
      uint64_t v258 = (uint64_t)a1 + 1100;
      int i = v409;
      do
      {
        v257 += *(_DWORD *)(v258 + v256);
        *(_DWORD *)(v258 + v256) = v257;
        v256 += 4LL;
      }

      while (v256 != 1024);
      for (uint64_t n = 0LL; n != 257; ++n)
      {
        int v259 = *((_DWORD *)a1 + n + 274);
        if (v259 < 0 || v259 > v441) {
          goto LABEL_381;
        }
      }

      uint64_t v260 = 0LL;
      int v261 = 0;
      do
      {
        int v262 = *((_DWORD *)a1 + v260 + 275);
        if (v261 > v262)
        {
          LODWORD(n) = v260 + 1;
LABEL_381:
          uint64_t result = 4294967292LL;
          LODWORD(v439) = v18;
          LODWORD(v21) = v253;
          goto LABEL_461;
        }

        ++v260;
        int v261 = v262;
      }

      while (v260 != 256);
      unsigned int v403 = v18;
      int v398 = v22;
      int v400 = v19;
      int v415 = v7;
      int v406 = v253;
      *((_DWORD *)a1 + 4) = 0;
      *((_BYTE *)a1 + 12) = 0;
      *((_DWORD *)a1 + 796) = -1;
      *((_DWORD *)a1 + 2) = 2;
      int v391 = v13;
      int v395 = v15;
      int v432 = v11;
      int v436 = v5;
      if (*((int *)a1 + 13) >= 2)
      {
        int v419 = v9;
        int v263 = v20;
        uint64_t v264 = v6;
        fwrite("rt+rld", 6uLL, 1uLL, (FILE *)*MEMORY[0x1895F89D0]);
        LODWORD(v9) = v419;
        LODWORD(v13) = v391;
        size_t v6 = v264;
        unsigned int v5 = v436;
        LODWORD(v20) = v263;
        uint64_t v255 = (uint64_t)(a1 + 137);
      }

      int v265 = v9;
      int v266 = v14;
      if (*((_BYTE *)a1 + 44))
      {
        int v422 = v20;
        int v428 = v6;
        for (iint i = 0LL; ii != 1028; ii += 4LL)
          *(_DWORD *)((char *)a1 + ii + 2124) = *(_DWORD *)((char *)a1 + ii + 1096);
        uint64_t v268 = 0LL;
        do
        {
          v269 = a1[395];
          uint64_t v270 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v269 + 2 * v268);
          unsigned int v271 = *(_DWORD *)(v270 + 2124);
          *((_WORD *)v269 + v268) = v271;
          uint64_t v272 = a1[396];
          uint64_t v273 = v268 >> 1;
          int v274 = *((_BYTE *)v272 + v273) & 0xF | (16 * HIWORD(v271));
          int v275 = *((_BYTE *)v272 + v273) & 0xF0 | HIWORD(v271);
          if ((v268 & 1) != 0) {
            LOBYTE(v275) = v274;
          }
          *((_BYTE *)v272 + v273) = v275;
          ++*(_DWORD *)(v270 + 2124);
          ++v268;
        }

        while (v441 != v268);
        int v276 = *((_DWORD *)a1 + 14);
        int i = *((unsigned __int16 *)a1[395] + v276) | (((*((unsigned __int8 *)a1[396] + (v276 >> 1)) >> (4 * (v276 & 1))) & 0xF) << 16);
        do
        {
          unsigned int v277 = v276;
          int v276 = i;
          int v278 = a1[395];
          unint64_t v279 = i;
          int v280 = *((unsigned __int16 *)v278 + i);
          int v281 = a1[396];
          unint64_t v282 = v279 >> 1;
          int v283 = *((unsigned __int8 *)v281 + v282) >> (4 * (v276 & 1));
          *((_WORD *)v278 + v276) = v277;
          int i = v280 & 0xFFF0FFFF | ((v283 & 0xF) << 16);
          int v284 = *((_BYTE *)v281 + v282) & 0xF | (16 * HIWORD(v277));
          int v285 = *((_BYTE *)v281 + v282) & 0xF0 | HIWORD(v277);
          if ((v276 & 1) != 0) {
            LOBYTE(v285) = v284;
          }
          *((_BYTE *)v281 + v282) = v285;
        }

        while (v276 != *((_DWORD *)a1 + 14));
        *((_DWORD *)a1 + 15) = v276;
        *((_DWORD *)a1 + 273) = 0;
        if (*((_BYTE *)a1 + 20))
        {
          a1[3] = 0LL;
          int v413 = v276;
          if (v276 < (100000 * *((_DWORD *)a1 + 10)))
          {
            int v286 = sub_18114AA38(v276, v255);
            *((_DWORD *)a1 + 16) = v286;
            *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396] + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
            ++*((_DWORD *)a1 + 273);
            int v287 = *((_DWORD *)a1 + 6);
            if (!v287)
            {
              uint64_t v288 = *((int *)a1 + 7);
              int v287 = dword_18C54B0D8[v288];
              if ((_DWORD)v288 == 511) {
                int v289 = 0;
              }
              else {
                int v289 = v288 + 1;
              }
              *((_DWORD *)a1 + 7) = v289;
            }

            uint64_t result = 0LL;
            int v290 = v287 - 1;
            *((_DWORD *)a1 + 6) = v290;
            *((_DWORD *)a1 + 16) = v286 ^ (v290 == 1);
            unsigned int v291 = v403;
            LODWORD(v439) = v403;
            int v15 = v395;
            LODWORD(v22) = v398;
            LODWORD(v13) = v391;
            LODWORD(v21) = v406;
            LODWORD(v9) = v265;
            LODWORD(n) = v413;
            int v7 = v415;
            goto LABEL_389;
          }
        }

        else if (v276 < (100000 * *((_DWORD *)a1 + 10)))
        {
          int v299 = v276;
          int v300 = sub_18114AA38(v276, v255);
          LODWORD(n) = v299;
          int v301 = v300;
          uint64_t result = 0LL;
          *((_DWORD *)a1 + 16) = v301;
          *((_DWORD *)a1 + 15) = *((unsigned __int16 *)a1[395] + *((unsigned int *)a1 + 15)) | (((*((unsigned __int8 *)a1[396]
                                                                                                  + ((unint64_t)*((unsigned int *)a1 + 15) >> 1)) >> (4 * (*((_DWORD *)a1 + 15) & 1))) & 0xF) << 16);
          ++*((_DWORD *)a1 + 273);
          unsigned int v291 = v403;
          LODWORD(v439) = v403;
          int v15 = v395;
          LODWORD(v22) = v398;
          LODWORD(v13) = v391;
          LODWORD(v21) = v406;
          LODWORD(v14) = v266;
          LODWORD(v9) = v265;
          int v7 = v415;
LABEL_389:
          unsigned int v5 = v436;
          unsigned int v18 = v291;
          size_t v6 = v428;
          int v11 = v432;
          int v19 = v400;
          LODWORD(v20) = v422;
          goto LABEL_461;
        }

        return 1LL;
      }

      int v292 = 0;
      uint64_t v293 = 0LL;
      int v294 = a1[394];
      do
      {
        uint64_t v295 = (uint64_t)a1 + 4 * *((unsigned __int8 *)v294 + 4 * v293);
        *((_DWORD *)v294 + (int)(*(_DWORD *)(v295 + 1096))++) |= v292;
        ++v293;
        v292 += 256;
      }

      while (v441 != v293);
      unint64_t v296 = (unint64_t)*((unsigned int *)v294 + *((int *)a1 + 14)) >> 8;
      *((_DWORD *)a1 + 15) = v296;
      *((_DWORD *)a1 + 273) = 0;
      if (*((_BYTE *)a1 + 20))
      {
        a1[3] = 0LL;
        uint64_t result = 1LL;
        unsigned int v297 = *((_DWORD *)v294 + v296);
        *((_DWORD *)a1 + 273) = 1;
        int v298 = dword_18C54B0D8[0] - 1;
        *((_DWORD *)a1 + 6) = dword_18C54B0D8[0] - 1;
        *((_DWORD *)a1 + 7) = 1;
        *((_DWORD *)a1 + 15) = v297 >> 8;
        *((_DWORD *)a1 + 16) = v297 ^ (v298 == 1);
        goto LABEL_393;
      }

      uint64_t result = 1LL;
      if (v296 < 100000 * *((_DWORD *)a1 + 10))
      {
        unsigned int v302 = *((_DWORD *)v294 + v296);
        *((_DWORD *)a1 + 15) = v302 >> 8;
        *((_DWORD *)a1 + 16) = v302;
        *((_DWORD *)a1 + 273) = 1;
LABEL_393:
        LODWORD(v439) = v403;
        LODWORD(n) = v441;
        uint64_t result = 0LL;
        int v15 = v395;
        LODWORD(v22) = v398;
        int i = v409;
        int v7 = v415;
        LODWORD(v21) = v406;
        unsigned int v18 = v403;
        int v11 = v432;
        int v19 = v400;
        goto LABEL_461;
      }

      return result;
    case 1:
      int v28 = *((_DWORD *)a1 + 9);
      goto LABEL_53;
    case 2:
      int v29 = *((_DWORD *)a1 + 9);
      goto LABEL_61;
    case 3:
      int v30 = *((_DWORD *)a1 + 9);
      goto LABEL_69;
    case 4:
      goto LABEL_83;
    case 5:
      int v31 = *((_DWORD *)a1 + 9);
      goto LABEL_92;
    case 6:
      int v32 = *((_DWORD *)a1 + 9);
      goto LABEL_102;
    case 7:
      int v33 = *((_DWORD *)a1 + 9);
      goto LABEL_110;
    case 8:
      int v34 = *((_DWORD *)a1 + 9);
      goto LABEL_118;
    case 9:
      int v35 = *((_DWORD *)a1 + 9);
      goto LABEL_126;
    case 10:
      goto LABEL_137;
    case 11:
      int v36 = *((_DWORD *)a1 + 9);
      goto LABEL_145;
    case 12:
      int v37 = *((_DWORD *)a1 + 9);
      goto LABEL_153;
    case 13:
      int v38 = *((_DWORD *)a1 + 9);
      goto LABEL_161;
    case 14:
      int v39 = *((_DWORD *)a1 + 9);
      goto LABEL_169;
    case 15:
      int v40 = *((_DWORD *)a1 + 9);
      goto LABEL_177;
    case 16:
      int v41 = *((_DWORD *)a1 + 9);
      goto LABEL_185;
    case 17:
      int v42 = *((_DWORD *)a1 + 9);
      goto LABEL_193;
    case 18:
      goto LABEL_277;
    case 19:
      goto LABEL_482;
    case 20:
      goto LABEL_472;
    case 21:
      int v43 = *((_DWORD *)a1 + 9);
      goto LABEL_25;
    case 22:
      goto LABEL_495;
    case 23:
      goto LABEL_528;
    case 24:
      goto LABEL_567;
    case 25:
      int v45 = *((_DWORD *)a1 + 9);
      goto LABEL_575;
    case 26:
      goto LABEL_554;
    case 27:
      int v46 = *((_DWORD *)a1 + 9);
      goto LABEL_286;
    case 28:
      goto LABEL_401;
    case 29:
      int v47 = *((_DWORD *)a1 + 9);
      goto LABEL_412;
    case 30:
      goto LABEL_330;
    case 31:
      int v48 = *((_DWORD *)a1 + 9);
      goto LABEL_447;
    case 32:
      int v31 = *((_DWORD *)a1 + 9);
      goto LABEL_94;
    case 33:
      int v49 = *((_DWORD *)a1 + 9);
      goto LABEL_209;
    case 34:
      int v50 = *((_DWORD *)a1 + 9);
      goto LABEL_217;
    case 35:
      int v51 = *((_DWORD *)a1 + 9);
      goto LABEL_225;
    case 36:
      int v52 = *((_DWORD *)a1 + 9);
      goto LABEL_233;
    case 37:
      int v53 = *((_DWORD *)a1 + 9);
      goto LABEL_242;
    case 38:
      int v54 = *((_DWORD *)a1 + 9);
      goto LABEL_250;
    case 39:
      int v55 = *((_DWORD *)a1 + 9);
      goto LABEL_258;
    case 40:
      int v56 = *((_DWORD *)a1 + 9);
      goto LABEL_266;
    default:
      sub_18114A0F8(4001);
  }

float sub_181152880(__int32 a1, int8x16_t *a2, int a3, int8x16_t a4, double a5, int8x16_t a6, int8x16_t a7)
{
  int8x16_t v8 = *a2;
  int v7 = a2 + 1;
  int8x16_t v9 = veorq_s8(a4, a4);
  int8x16_t v10 = vrev64q_s8(v8);
  v9.i32[3] = a1;
  uint64x2_t v11 = (uint64x2_t)veorq_s8(v9, vextq_s8(v10, v10, 8uLL));
  BOOL v12 = __OFSUB__(a3, 16);
  int v13 = a3 - 16;
  if (!((v13 < 0) ^ v12 | (v13 == 0)))
  {
    if (v13 >= 48)
    {
      int8x16_t v14 = *v7;
      int8x16_t v15 = v7[1];
      int8x16_t v16 = v7[2];
      v7 += 3;
      int8x16_t v17 = vrev64q_s8(v14);
      int8x16_t v18 = vrev64q_s8(v15);
      int8x16_t v19 = vrev64q_s8(v16);
      int8x16_t v20 = vextq_s8(v17, v17, 8uLL);
      a6 = vextq_s8(v18, v18, 8uLL);
      a7 = vextq_s8(v19, v19, 8uLL);
      BOOL v12 = __OFSUB__(v13, 112);
      int v21 = v13 - 112;
      if (v21 < 0 == v12)
      {
        do
        {
          int8x16_t v23 = *v7;
          int8x16_t v24 = v7[1];
          uint64_t v22 = v7 + 2;
          int8x16_t v25 = vrev64q_s8(v23);
          int8x16_t v26 = vrev64q_s8(v24);
          uint64x2_t v11 = (uint64x2_t)veorq_s8( (int8x16_t)vmull_high_p64(v11, qword_181153560),  veorq_s8(vextq_s8(v25, v25, 8uLL), (int8x16_t)vmull_p64(v11.u64[0], 0xE6228B11uLL)));
          int8x16_t v20 = veorq_s8( (int8x16_t)vmull_high_p64((uint64x2_t)v20, qword_181153560),  veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(v20.u64[0], 0xE6228B11uLL)));
          int8x16_t v27 = *v22;
          int8x16_t v28 = v22[1];
          int v7 = v22 + 2;
          int8x16_t v29 = vrev64q_s8(v27);
          int8x16_t v30 = vrev64q_s8(v28);
          a6 = veorq_s8( (int8x16_t)vmull_high_p64((uint64x2_t)a6, qword_181153560),  veorq_s8(vextq_s8(v29, v29, 8uLL), (int8x16_t)vmull_p64(a6.u64[0], 0xE6228B11uLL)));
          a7 = veorq_s8( (int8x16_t)vmull_high_p64((uint64x2_t)a7, qword_181153560),  veorq_s8(vextq_s8(v30, v30, 8uLL), (int8x16_t)vmull_p64(a7.u64[0], 0xE6228B11uLL)));
          BOOL v12 = __OFSUB__(v21, 64);
          v21 -= 64;
        }

        while (!((v21 < 0) ^ v12 | (v21 == 0)));
      }

      uint64x2_t v31 = (uint64x2_t)veorq_s8( (int8x16_t)vmull_high_p64(v11, qword_181153570),  veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), v20));
      uint64x2_t v32 = (uint64x2_t)veorq_s8( (int8x16_t)vmull_high_p64(v31, qword_181153570),  veorq_s8((int8x16_t)vmull_p64(v31.u64[0], 0xE8A45605uLL), a6));
      uint64x2_t v11 = (uint64x2_t)veorq_s8( (int8x16_t)vmull_high_p64(v32, qword_181153570),  veorq_s8((int8x16_t)vmull_p64(v32.u64[0], 0xE8A45605uLL), a7));
      int v13 = v21 + 64;
    }

    BOOL v12 = __OFSUB__(v13, 16);
    for (int i = v13 - 16; i < 0 == v12; i -= 16)
    {
      int8x16_t v34 = *v7++;
      int8x16_t v35 = vrev64q_s8(v34);
      uint64x2_t v11 = (uint64x2_t)veorq_s8( (int8x16_t)vmull_high_p64(v11, qword_181153570),  veorq_s8((int8x16_t)vmull_p64(v11.u64[0], 0xE8A45605uLL), vextq_s8(v35, v35, 8uLL)));
      BOOL v12 = __OFSUB__(i, 16);
    }
  }

  int8x16_t v36 = veorq_s8(a6, a6);
  uint64x2_t v37 = (uint64x2_t)veorq_s8(a7, a7);
  *(uint64_t *)((char *)v36.i64 + 4) = v11.i64[0];
  int8x16_t v38 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v11, qword_181153580));
  v37.i32[0] = v38.i32[2];
  int8x16_t v39 = veorq_s8(v38, (int8x16_t)vmull_p64(v37.u64[0], 0x490D678DuLL));
  v37.i32[0] = v39.i32[1];
  v37.i32[2] = vmull_p64(*(unint64_t *)&v37, 0x104D101DFuLL).i32[1];
  LODWORD(result) = veorq_s8(v39, (int8x16_t)vmull_high_p64(v37, qword_181153590)).u32[0];
  return result;
}

uint64_t sub_1811529E8()
{
  uint64_t result = MEMORY[0x1895F8858]();
  int v4 = v3;
  int v5 = v2;
  uint64_t v6 = result;
  uint64_t v59 = *MEMORY[0x1895F89C0];
  uint64_t v7 = v2;
  if (v2 >= 1)
  {
    int8x16_t v8 = &v56;
    uint64_t v9 = v2;
    do
    {
      unsigned int v11 = *v1++;
      int v10 = v11;
      if (v11 <= 1) {
        int v10 = 1;
      }
      *v8++ = v10 << 8;
      --v9;
    }

    while (v9);
  }

  int v57 = 0;
  v55[0] = 0;
  v54[0] = -2;
  if (v2 >= 1)
  {
    size_t v53 = 4LL * v2;
    uint64_t v52 = v2;
    uint64_t v12 = (v2 + 1);
    while (1)
    {
      uint64_t result = (uint64_t)memset(&v54[1], 255, v53);
      uint64_t v13 = 0LL;
      uint64_t v14 = 1LL;
      do
      {
        ++v13;
        *(&v57 + v13) = v14;
        int v15 = v55[v14];
        unint64_t v16 = v13;
        unint64_t v17 = v13 >> 1;
        uint64_t v18 = *(&v57 + v17);
        if (v15 >= v55[v18])
        {
          unint64_t v19 = v13;
        }

        else
        {
          do
          {
            unint64_t v19 = v17;
            *(&v57 + v16) = v18;
            v17 >>= 1;
            uint64_t v18 = *(&v57 + v17);
            unint64_t v16 = v19;
          }

          while (v15 < v55[v18]);
        }

        *(&v57 + v19) = v14++;
      }

      while (v13 != v7);
      LODWORD(v20) = v5;
      if (v5 >= 2) {
        break;
      }
LABEL_50:
      char v47 = 0;
      uint64_t v48 = 1LL;
      do
      {
        int v49 = -1;
        int v50 = v48;
        do
        {
          int v50 = v54[v50];
          ++v49;
        }

        while ((v50 & 0x80000000) == 0);
        *(_BYTE *)(v48 + v6 - 1) = v49;
        if (v49 > v4) {
          char v47 = 1;
        }
        ++v48;
      }

      while (v48 != v12);
      if (v47)
      {
        uint64_t v51 = 1LL;
        do
        {
          v55[v51] = (((((int)v55[v51] >> 8) + ((int)v55[v51] >> 8 < 0)) << 7) & 0xFFFFFF00) + 256;
          ++v51;
        }

        while (v12 != v51);
        int v57 = 0;
        v55[0] = 0;
        v54[0] = -2;
        if (v5 >= 1) {
          continue;
        }
      }

      return result;
    }

    uint64_t v21 = v7;
    uint64_t v20 = v52;
    while (1)
    {
      uint64_t v22 = v58;
      int v23 = *(&v57 + v21);
      int v58 = v23;
      uint64_t v24 = v21 - 1;
      uint64_t v25 = v21 - 2;
      if ((unint64_t)v21 <= 2)
      {
        int v58 = v23;
        int v32 = *(&v57 + v24);
        int v58 = v32;
      }

      else
      {
        int v26 = v55[v23];
        int v27 = 1;
        int v28 = 2;
        while (1)
        {
          uint64_t v29 = v28;
          if (v24 <= v28)
          {
            int v30 = v28;
          }

          else
          {
            int v30 = v28 | 1;
            if (v55[*(&v57 + (v28 | 1LL))] >= v55[*(&v57 + v28)]) {
              int v30 = v28;
            }
            uint64_t v29 = v30;
          }

          uint64_t v31 = *(&v57 + v29);
          uint64_t result = v55[v31];
          *(&v57 + v27) = v31;
          int v28 = 2 * v30;
          int v27 = v30;
          if (v21 <= 2 * v30) {
            goto LABEL_30;
          }
        }

        int v30 = v27;
LABEL_30:
        *(&v57 + v30) = v23;
        int v23 = v58;
        int v32 = *(&v57 + v24);
        int v58 = v32;
        if (v21 >= 4)
        {
          int v43 = v55[v32];
          int v33 = 1;
          uint64_t v44 = 2LL;
          while (1)
          {
            uint64_t v45 = (int)v44;
            if (v25 <= (int)v44)
            {
              uint64_t result = v44;
            }

            else
            {
              LODWORD(result) = v44 | 1;
              uint64_t result = v55[*(&v57 + ((int)v44 | 1LL))] >= v55[*(&v57 + (int)v44)]
                     ? v44
                     : result;
              uint64_t v45 = (int)result;
            }

            uint64_t v46 = *(&v57 + v45);
            if (v43 < v55[v46]) {
              goto LABEL_32;
            }
            *(&v57 + v33) = v46;
            uint64_t v44 = (2 * result);
            int v33 = result;
            if (v25 < (int)v44)
            {
              int v33 = result;
              goto LABEL_32;
            }
          }
        }
      }

      int v33 = 1;
LABEL_32:
      *(&v57 + v33) = v32;
      v54[v23] = ++v20;
      v54[v22] = v20;
      int v36 = v55[v22];
      int v34 = v55[v23];
      unsigned int v35 = (v34 & 0xFFFFFF00) + (v36 & 0xFFFFFF00);
      int v36 = v36;
      int v37 = (v36 + 1) | v35;
      v55[v20] = v37;
      v54[v20] = -1;
      *(&v57 + v24) = v20;
      unint64_t v38 = (v21 - 1);
      unint64_t v39 = v24 >> 1;
      uint64_t v40 = *(&v57 + v39);
      if (v37 >= v55[v40])
      {
        unint64_t v41 = (v21 - 1);
      }

      else
      {
        do
        {
          unint64_t v41 = v39;
          *(&v57 + v38) = v40;
          v39 >>= 1;
          uint64_t v40 = *(&v57 + v39);
          unint64_t v38 = v41;
        }

        while (v37 < v55[v40]);
      }

      *(&v57 + v41) = v20;
    }
  }

  return result;
}

_DWORD *sub_181152DE0(_DWORD *result, unsigned __int8 *a2, int a3, int a4, int a5)
{
  if (a3 <= a4)
  {
    int v5 = 0;
    do
    {
      if (a5 >= 1)
      {
        uint64_t v6 = a5;
        uint64_t v7 = a2;
        int8x16_t v8 = result;
        do
        {
          int v9 = *v7++;
          if (a3 == v9) {
            *int8x16_t v8 = v5++;
          }
          ++v8;
          --v6;
        }

        while (v6);
      }

      v5 *= 2;
    }

    while (a3++ != a4);
  }

  return result;
}

_OWORD *sub_181152E3C(_OWORD *result, _OWORD *a2, uint64_t a3, unsigned __int8 *a4, int a5, int a6, int a7)
{
  if (a5 <= a6)
  {
    int v7 = 0;
    int v8 = a5;
    do
    {
      if (a7 >= 1)
      {
        for (uint64_t i = 0LL; i != a7; ++i)
        {
          if (v8 == a4[i]) {
            *(_DWORD *)(a3 + 4LL * v7++) = i;
          }
        }
      }
    }

    while (v8++ != a6);
  }

  *(_OWORD *)((char *)a2 + 76) = 0u;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (a7 > 0)
  {
    uint64_t v11 = a7;
    do
    {
      unsigned int v12 = *a4++;
      ++*((_DWORD *)a2 + v12 + 1);
      --v11;
    }

    while (v11);
  }

  int v13 = 0;
  for (uint64_t j = 4LL; j != 92; j += 4LL)
  {
    v13 += *(_DWORD *)((char *)a2 + j);
    *(_DWORD *)((char *)a2 + j) = v13;
  }

  *(_OWORD *)((char *)result + 76) = 0u;
  result[3] = 0u;
  result[4] = 0u;
  result[1] = 0u;
  result[2] = 0u;
  *uint64_t result = 0u;
  int v15 = (int *)result + a5;
  unint64_t v16 = (char *)a2 + 4 * a5;
  if (a5 <= a6)
  {
    int v17 = 0;
    uint64_t v18 = v16 + 4;
    int v19 = a6 - a5 + 1;
    uint64_t v20 = (_DWORD *)result + a5;
    do
    {
      int v21 = *v18 - *(v18 - 1) + v17;
      *v20++ = v21 - 1;
      int v17 = 2 * v21;
      ++v18;
      --v19;
    }

    while (v19);
  }

  if (a5 < a6)
  {
    uint64_t v22 = a6 - (uint64_t)a5;
    int v23 = v16 + 4;
    do
    {
      int v24 = *v15++;
      *int v23 = 2 * v24 - *v23 + 2;
      ++v23;
      --v22;
    }

    while (v22);
  }

  return result;
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1895F8A00]();
}

void bzero(void *a1, size_t a2)
{
}

void exit(int a1)
{
}

int fclose(FILE *a1)
{
  return MEMORY[0x1895FB208](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x1895FB228](*(void *)&a1, a2);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1895FB250](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1895FB268](a1);
}

int fgetc(FILE *a1)
{
  return MEMORY[0x1895FB280](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1895FB348](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1895FB360](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1895FB370](*(void *)&a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1895FB388](__ptr, __size, __nitems, __stream);
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1895FBE18](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1895FBE48](__b, *(void *)&__c, __len);
}