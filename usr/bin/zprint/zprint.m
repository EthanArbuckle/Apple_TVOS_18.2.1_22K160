void start(int a1, const char **a2)
{
  const char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  const char **v9;
  const char *v10;
  int v11;
  size_t v12;
  _BYTE *v13;
  int i;
  mach_port_t v15;
  mach_error_t v16;
  mach_msg_type_number_t v17;
  mach_msg_type_number_t v18;
  void *v19;
  uint64_t v20;
  mach_zone_info_array_t v21;
  const char *v22;
  size_t v23;
  mach_zone_name_array_t v24;
  void *v25;
  mach_zone_name_t *v26;
  size_t v27;
  int v28;
  size_t v29;
  const char *v30;
  uint64_t mzi_cur_size;
  unsigned int v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  size_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  mach_zone_name_array_t v53;
  mach_zone_info_array_t v54;
  uint64_t v55;
  mach_zone_name_t *v56;
  mach_zone_info_t *v57;
  BOOL v58;
  mach_zone_info_t *v59;
  uint64_t v60;
  _BYTE *v61;
  mach_zone_name_array_t v62;
  mach_zone_info_array_t v63;
  int v64;
  uint64_t v65;
  mach_zone_info_t *v66;
  mach_zone_name_t *v67;
  mach_zone_info_array_t v68;
  int v69;
  _OWORD *v70;
  _BYTE *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  char v87;
  uint64_t j;
  uint64_t v89;
  int v90;
  char *v91;
  mach_zone_name_array_t v92;
  mach_zone_info_array_t v93;
  int (__cdecl *v94)(void *, const void *, const void *);
  uint64_t v95;
  mach_error_t v96;
  FILE **v97;
  FILE *v98;
  FILE *v99;
  FILE *v100;
  BOOL v101;
  void *v102;
  int v103;
  char v104;
  int v105;
  int v106;
  uint64_t mzi_exhaustible;
  int64x2_t v108;
  uint64_t mzi_collectable;
  uint64_t mzi_sum_size;
  uint64_t mzi_max_size;
  __int128 v112;
  const char **v113;
  uint64_t v114;
  mach_zone_name_array_t v115;
  int v116;
  _BYTE *v117;
  uint64_t v118;
  mach_msg_type_number_t memory_infoCnt;
  mach_memory_info_array_t memory_info;
  mach_msg_type_number_t infoCnt;
  mach_zone_info_array_t info;
  mach_msg_type_number_t namesCnt;
  mach_zone_name_array_t names;
  char __s[16];
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 __s1;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  names = 0LL;
  namesCnt = 0;
  info = 0LL;
  infoCnt = 0;
  memory_info = 0LL;
  memory_infoCnt = 0;
  signal(2, (void (__cdecl *)(int))sub_1000054A4);
  v4 = *a2;
  v5 = strrchr(*a2, 47);
  if (v5) {
    v6 = (uint64_t)(v5 + 1);
  }
  else {
    v6 = (uint64_t)v4;
  }
  qword_10000C1F8 = v6;
  v7 = 1;
  if (a1 < 2) {
    goto LABEL_41;
  }
  v8 = 0LL;
  v116 = dword_10000C030;
  v113 = a2;
  v9 = a2 + 1;
  while (1)
  {
    v10 = v9[v8];
    if (!strcmp(v10, "-d"))
    {
      byte_10000C200 = 1;
    }

    else if (!strcmp(v10, "-t"))
    {
      byte_10000C204 = 1;
    }

    else if (!strcmp(v10, "-T"))
    {
      byte_10000C204 = 0;
    }

    else if (!strcmp(v10, "-w"))
    {
      byte_10000C208 = 1;
    }

    else if (!strcmp(v10, "-W"))
    {
      byte_10000C208 = 0;
    }

    else if (!strcmp(v10, "-l"))
    {
      byte_10000C20C = 0;
    }

    else if (!strcmp(v10, "-L"))
    {
      byte_10000C20C = 1;
    }

    else if (!strcmp(v10, "-s"))
    {
      byte_10000C210 = 1;
    }

    else if (!strcmp(v10, "-S"))
    {
      byte_10000C210 = 0;
    }

    else if (!strcmp(v10, "-c"))
    {
      byte_10000C214 = 0;
    }

    else if (!strcmp(v10, "-C"))
    {
      byte_10000C214 = 1;
    }

    else
    {
      if (!strcmp(v10, "-h"))
      {
        v97 = &__stdoutp;
        goto LABEL_174;
      }

      if (!strcmp(v10, "-H"))
      {
        byte_10000C218 = 1;
      }

      else
      {
        if (!strcmp(v10, "-k"))
        {
          v11 = v116 | 0x1E;
        }

        else if (!strcmp(v10, "-kt"))
        {
          v11 = v116 | 0x1C;
        }

        else
        {
          if (strcmp(v10, "-kd"))
          {
            if (!strcmp(v10, "--"))
            {
              v7 = v8 + 2;
LABEL_40:
              a2 = v113;
LABEL_41:
              if (a1 - v7 == 1)
              {
                qword_10000C220 = (uint64_t)a2[v7];
                v12 = strlen((const char *)qword_10000C220);
                goto LABEL_45;
              }

              if (a1 == v7)
              {
                v12 = 0LL;
                qword_10000C220 = (uint64_t)"";
LABEL_45:
                qword_10000C228 = v12;
                if (byte_10000C200 == 1)
                {
                  byte_10000C210 = 0;
                  byte_10000C214 = 0;
                  byte_10000C218 = 0;
                }

                if (byte_10000C208 == 1)
                {
                  byte_10000C190 = 1;
                  byte_10000C1B0 = 1;
                }

                if (byte_10000C204 == 1) {
                  byte_10000C1D0 = 1;
                }
                v13 = 0LL;
                v101 = 0;
                v104 = 0;
                v102 = 0LL;
                for (i = 1; ; i = 0)
                {
                  v15 = mach_host_self();
                  v16 = mach_memory_info(v15, &names, &namesCnt, &info, &infoCnt, &memory_info, &memory_infoCnt);
                  if (v16) {
                    break;
                  }
                  v17 = namesCnt;
                  if (namesCnt != infoCnt)
                  {
                    fprintf(__stderrp, "%s: mach_zone_name/ mach_zone_info: counts not equal?\n");
                    goto LABEL_177;
                  }

                  v18 = namesCnt;
                  if (dword_10000C030 != 1)
                  {
                    qword_10000C1D8 = (uint64_t)calloc(0x24uLL, 0x50uLL);
                    v19 = calloc(0x24uLL, 0x40uLL);
                    qword_10000C1E0 = (uint64_t)v19;
                    if (!qword_10000C1D8 || !v19)
                    {
                      fprintf(__stderrp, "%s: calloc failed to allocate memory\n");
                      goto LABEL_177;
                    }

                    v18 = v17 + 36;
                    v17 = infoCnt;
                  }

                  if ((i & 1) != 0)
                  {
                    v13 = malloc(v18);
                    v102 = malloc((unint64_t)v17 << 6);
                    qword_10000C1E8 = (uint64_t)&v13[v17];
                    if (!v13 || !v102) {
                      goto LABEL_171;
                    }
                  }

                  v117 = v13;
                  v103 = i;
                  if ((int)v17 < 1)
                  {
                    v105 = 0;
                  }

                  else
                  {
                    v20 = 0LL;
                    v105 = 0;
                    v21 = info;
                    v114 = v17;
                    v115 = names;
                    v22 = (const char *)qword_10000C220;
                    v23 = qword_10000C228;
                    v24 = names;
                    v25 = v102;
                    do
                    {
                      v13[v20] = 0;
                      v26 = &v115[v20];
                      v27 = strnlen(v26->mzn_name, 0x50uLL);
                      if (v23 > v27) {
                        goto LABEL_64;
                      }
                      v29 = v27 + 1;
                      v30 = (const char *)v24;
                      while (strncmp(v22, v30, v23))
                      {
                        --v29;
                        ++v30;
                        if (v23 == v29)
                        {
                          v28 = 0;
                          v13 = v117;
                          goto LABEL_74;
                        }
                      }

                      mzi_cur_size = v21->mzi_cur_size;
                      v13 = v117;
                      if ((v104 & 1) != 0
                        && mzi_cur_size <= v25[1]
                        && (byte_10000C204 != 1 || v25[5] >= v21->mzi_sum_size >> 1))
                      {
LABEL_64:
                        v28 = 0;
                        goto LABEL_74;
                      }

                      v25[1] = mzi_cur_size;
                      v25[5] = v21->mzi_sum_size;
                      v28 = 1;
                      v117[v20] = 1;
                      v105 = 1;
LABEL_74:
                      v32 = dword_10000C030;
                      if (dword_10000C030 != 1)
                      {
                        v106 = v28;
                        v33 = 0LL;
                        *(_OWORD *)__s = *(_OWORD *)v26->mzn_name;
                        v34 = *(_OWORD *)&v26->mzn_name[16];
                        v35 = *(_OWORD *)&v26->mzn_name[32];
                        v36 = *(_OWORD *)&v26->mzn_name[64];
                        v128 = *(_OWORD *)&v26->mzn_name[48];
                        v129 = v36;
                        v126 = v34;
                        v127 = v35;
                        v108 = *(int64x2_t *)&v21->mzi_count;
                        v112 = *(_OWORD *)&v21->mzi_elem_size;
                        mzi_sum_size = v21->mzi_sum_size;
                        mzi_max_size = v21->mzi_max_size;
                        mzi_exhaustible = v21->mzi_exhaustible;
                        v37 = *(_OWORD *)&v26->mzn_name[48];
                        v132 = *(_OWORD *)&v26->mzn_name[32];
                        v133 = v37;
                        v134 = *(_OWORD *)&v26->mzn_name[64];
                        v38 = *(_OWORD *)&v26->mzn_name[16];
                        mzi_collectable = v21->mzi_collectable;
                        __s1 = *(_OWORD *)v26->mzn_name;
                        v131 = v38;
                        while (1)
                        {
                          v39 = strlen(*((const char **)&off_10000C000 + v33 + 1));
                          if (++v33 == 5) {
                            goto LABEL_86;
                          }
                        }

                        if (((v32 >> v33) & 1) != 0)
                        {
                          v40 = qword_10000C1F0;
                          v41 = qword_10000C1E0;
                          v13 = v117;
                          if (!qword_10000C1F0) {
                            goto LABEL_85;
                          }
                          v42 = 0LL;
                          v43 = (uint64_t *)(qword_10000C1E0 + 24);
                          do
                          {
                            v44 = *v43;
                            v43 += 8;
                            if (v44 == (void)v112)
                            {
                              v45 = v106;
                              goto LABEL_88;
                            }

                            ++v42;
                          }

                          while (qword_10000C1F0 != v42);
                          if ((unint64_t)qword_10000C1F0 >= 0x23) {
                            __assert_rtn( "get_kalloc_info_idx",  "zprint.c",  809,  "kalloc_info_idx < KALLOC_SIZECLASSES - 1");
                          }
LABEL_85:
                          ++qword_10000C1F0;
                          v45 = v117[v20];
                          v42 = v40;
LABEL_88:
                          v46 = qword_10000C1D8;
                          if (v45)
                          {
                            *(_BYTE *)(qword_10000C1E8 + v42) = 1;
                            v117[v20] = 0;
                          }

                          *(int64x2_t *)(v41 + (v42 << 6)) = vaddq_s64(*(int64x2_t *)(v41 + (v42 << 6)), v108);
                          if (v42 == qword_10000C1F0 - 1)
                          {
                            v47 = v41;
                            v48 = strlen(__s);
                            if (v48)
                            {
                              v49 = mzi_exhaustible;
                              while (__s[v48] != 46)
                              {
                                if (!--v48)
                                {
                                  v50 = 0LL;
                                  goto LABEL_98;
                                }
                              }

                              v50 = &__s[v48 + 1];
                            }

                            else
                            {
                              v50 = 0LL;
                              v49 = mzi_exhaustible;
                            }

LABEL_98:
                            snprintf((char *)(v46 + 80 * v42), 0x50uLL, "kalloc.%s", v50);
                            v41 = v47;
                            v51 = v47 + (v42 << 6);
                            *(_OWORD *)(v51 + 24) = v112;
                            *(void *)(v51 + 48) = v49;
                            v22 = (const char *)qword_10000C220;
                            v23 = qword_10000C228;
                          }

                          if ((mzi_collectable & 1) != 0) {
                            *(void *)(v41 + (v42 << 6) + 56) = ((*(void *)(v41 + (v42 << 6) + 56) & 0xFFFFFFFFFFFFFFFELL)
                          }
                                                                + mzi_collectable) & 0xFFFFFFFFFFFFFFFELL | *(void *)(v41 + (v42 << 6) + 56) & 1LL;
                          v52 = v41 + (v42 << 6);
                          *(void *)(v52 + 40) += mzi_sum_size;
                          *(void *)(v52 + 16) += mzi_max_size;
                        }

                        else
                        {
LABEL_86:
                          v13 = v117;
                        }
                      }

                      ++v21;
                      v25 += 8;
                      ++v20;
                      ++v24;
                    }

                    while (v20 != v114);
                  }

                  if (byte_10000C210 == 1)
                  {
                    v53 = names;
                    v54 = info;
                    v55 = infoCnt;
                    v101 = dword_10000C030 != 1;
                    if (dword_10000C030 != 1)
                    {
                      v56 = (mach_zone_name_t *)malloc(80LL * (infoCnt + 36));
                      v57 = (mach_zone_info_t *)malloc((unint64_t)(v55 + 36) << 6);
                      if (v56) {
                        v58 = v57 == 0LL;
                      }
                      else {
                        v58 = 1;
                      }
                      if (v58)
                      {
LABEL_171:
                        fprintf(__stderrp, "%s: malloc failed to allocate memory\n");
                        goto LABEL_177;
                      }

                      v59 = v57;
                      memcpy(v56, v53, 80 * v55);
                      memcpy(&v56[v55], (const void *)qword_10000C1D8, 0xB40uLL);
                      memcpy(v59, v54, v55 << 6);
                      memcpy(&v59[v55], (const void *)qword_10000C1E0, 0x900uLL);
                      sub_100006718((vm_address_t)v53, v54, v55, 1);
                      LODWORD(v55) = v55 + 36;
                      v54 = v59;
                      v53 = v56;
                      v13 = v117;
                    }

                    if ((_DWORD)v55 != 1)
                    {
                      v60 = 0LL;
                      v61 = v13 + 1;
                      v62 = v53 + 1;
                      v63 = v54 + 1;
                      v64 = v55 - 1;
                      do
                      {
                        v65 = v60 + 1;
                        if (v60 + 1 < (unint64_t)v55)
                        {
                          v66 = &v54[v60];
                          v67 = &v53[v60];
                          v68 = v63;
                          v69 = v64;
                          v70 = v62;
                          v71 = v61;
                          do
                          {
                            if (v68->mzi_cur_size - v68->mzi_count * v68->mzi_elem_size > v66->mzi_cur_size
                                                                                         - v66->mzi_count
                                                                                         * v66->mzi_elem_size)
                            {
                              *(_OWORD *)__s = *(_OWORD *)&v66->mzi_count;
                              v126 = *(_OWORD *)&v66->mzi_max_size;
                              v127 = *(_OWORD *)&v66->mzi_alloc_size;
                              v128 = *(_OWORD *)&v66->mzi_exhaustible;
                              v73 = *(_OWORD *)&v68->mzi_alloc_size;
                              v72 = *(_OWORD *)&v68->mzi_exhaustible;
                              v74 = *(_OWORD *)&v68->mzi_max_size;
                              *(_OWORD *)&v66->mzi_count = *(_OWORD *)&v68->mzi_count;
                              *(_OWORD *)&v66->mzi_max_size = v74;
                              *(_OWORD *)&v66->mzi_alloc_size = v73;
                              *(_OWORD *)&v66->mzi_exhaustible = v72;
                              v75 = *(_OWORD *)__s;
                              v76 = v126;
                              v77 = v128;
                              *(_OWORD *)&v68->mzi_alloc_size = v127;
                              *(_OWORD *)&v68->mzi_exhaustible = v77;
                              *(_OWORD *)&v68->mzi_count = v75;
                              *(_OWORD *)&v68->mzi_max_size = v76;
                              v78 = *(_OWORD *)&v67->mzn_name[64];
                              v79 = *(_OWORD *)&v67->mzn_name[32];
                              v133 = *(_OWORD *)&v67->mzn_name[48];
                              v134 = v78;
                              v80 = *(_OWORD *)&v67->mzn_name[16];
                              __s1 = *(_OWORD *)v67->mzn_name;
                              v131 = v80;
                              v132 = v79;
                              v81 = v70[1];
                              v82 = v70[2];
                              v83 = v70[4];
                              *(_OWORD *)&v67->mzn_name[48] = v70[3];
                              *(_OWORD *)&v67->mzn_name[64] = v83;
                              *(_OWORD *)&v67->mzn_name[16] = v81;
                              *(_OWORD *)&v67->mzn_name[32] = v82;
                              *(_OWORD *)v67->mzn_name = *v70;
                              *v70 = __s1;
                              v84 = v131;
                              v85 = v132;
                              v86 = v134;
                              v70[3] = v133;
                              v70[4] = v86;
                              v70[1] = v84;
                              v70[2] = v85;
                              v87 = v13[v60];
                              v13[v60] = *v71;
                              *v71 = v87;
                            }

                            ++v68;
                            ++v71;
                            v70 += 5;
                            --v69;
                          }

                          while (v69);
                        }

                        ++v61;
                        ++v62;
                        --v64;
                        ++v63;
                        ++v60;
                      }

                      while (v65 != (_DWORD)v55 - 1);
                    }

                    names = v53;
                    info = v54;
                    infoCnt = v55;
                  }

                  v118 = 0LL;
                  if (v105)
                  {
                    if ((byte_10000C214 & 1) == 0)
                    {
                      if ((v103 & 1) == 0) {
                        putchar(10);
                      }
                      if ((byte_10000C218 & 1) == 0)
                      {
                        for (j = 0LL; j != 416; j += 32LL)
                        {
                          if (*((_BYTE *)&off_10000C038 + j + 24)) {
                            printf( "%*s ",  *(_DWORD *)((char *)&off_10000C038 + j + 20)
                          }
                            * *(_DWORD *)((char *)&off_10000C038 + j + 16),
                              *(const char **)((char *)&off_10000C038 + j));
                        }

                        putchar(10);
                        v89 = 0LL;
                        v90 = 0;
                        do
                        {
                          v91 = (char *)&off_10000C038 + v89;
                          if (*((_BYTE *)&off_10000C038 + v89 + 24))
                          {
                            printf("%*s ", *((_DWORD *)v91 + 5) * *((_DWORD *)v91 + 4), *((const char **)v91 + 1));
                            v90 += *((_DWORD *)v91 + 4) + 1;
                          }

                          v89 += 32LL;
                        }

                        while (v89 != 416);
                        putchar(10);
                        if (v90 >= 1)
                        {
                          do
                          {
                            putchar(45);
                            --v90;
                          }

                          while (v90);
                        }

                        putchar(10);
                      }
                    }

                    sub_100005630((uint64_t)names, (uint64_t)info, infoCnt, (uint64_t)v13, &v118);
                    if ((byte_10000C210 & 1) == 0 && dword_10000C030 != 1) {
                      sub_100005630(qword_10000C1D8, qword_10000C1E0, 0x24u, qword_10000C1E8, &v118);
                    }
                  }

                  v92 = names;
                  v93 = info;
                  if ((v103 & ~byte_10000C20C & 1) != 0)
                  {
                    if (byte_10000C210) {
                      v94 = (int (__cdecl *)(void *, const void *, const void *))sub_100006604;
                    }
                    else {
                      v94 = (int (__cdecl *)(void *, const void *, const void *))sub_100006638;
                    }
                    sub_100005D08( (uint64_t)memory_info,  memory_infoCnt,  (uint64_t)info,  (uint64_t)names,  namesCnt,  v118,  v94);
                    v92 = names;
                    v93 = info;
                  }

                  sub_100006718((vm_address_t)v92, v93, infoCnt, !v101);
                  if (dword_10000C030 != 1)
                  {
                    v95 = qword_10000C1E8;
                    *(_OWORD *)qword_10000C1E8 = 0u;
                    *(_OWORD *)(v95 + 16) = 0u;
                    *(_DWORD *)(v95 + 32) = 0;
                    qword_10000C1F0 = 0LL;
                  }

                  if (memory_info)
                  {
                    if (memory_infoCnt)
                    {
                      v96 = vm_deallocate(mach_task_self_, (vm_address_t)memory_info, 176LL * memory_infoCnt);
                      if (v96)
                      {
                        v100 = __stderrp;
                        mach_error_string(v96);
                        fprintf(v100, "%s: vm_deallocate: %s\n");
                        goto LABEL_177;
                      }
                    }
                  }

                  if (((byte_10000C208 | byte_10000C204) & 1) != 0
                    && (byte_10000C218 & 1) == 0
                    && (byte_10000C200 & 1) == 0)
                  {
                    puts("\nZONE TOTALS");
                    puts("---------------------------------------------");
                    printf("TOTAL SIZE        = %llu\n", qword_10000C230);
                    printf("TOTAL USED        = %llu\n", qword_10000C238);
                    if (byte_10000C208 == 1)
                    {
                      printf("TOTAL WASTED      = %llu\n", qword_10000C230 - qword_10000C238);
                      printf("TOTAL FRAGMENTED  = %llu\n", qword_10000C240);
                      printf("TOTAL COLLECTABLE = %llu\n", qword_10000C248);
                    }

                    if (byte_10000C204 == 1) {
                      printf("TOTAL ALLOCS      = %llu\n", qword_10000C250);
                    }
                  }

                  if (byte_10000C200 != 1 || (byte_10000C258 & 1) != 0) {
                    exit(0);
                  }
                  v104 = 1;
                  sleep(1u);
                }

                if (v16 == 53)
                {
                  v99 = __stderrp;
                  mach_error_string(53);
                  fprintf(v99, "%s: mach_memory_info: %s (entitlement required or rate-limit exceeded)\n");
                }

                else
                {
                  v98 = __stderrp;
                  if (v16 == 8)
                  {
                    mach_error_string(8);
                    fprintf(v98, "%s: mach_memory_info: %s (try running as root)\n");
                  }

                  else
                  {
                    mach_error_string(v16);
                    fprintf(v98, "%s: mach_memory_info: %s\n");
                  }
                }

LABEL_177:
                exit(1);
              }
            }

            else if (*v10 != 45)
            {
              v7 = v8 + 1;
              a2 = v113;
              goto LABEL_41;
            }

            v97 = &__stderrp;
LABEL_174:
            sub_1000054B4(*v97);
          }

          v11 = v116 | 2;
        }

        v116 = v11;
        dword_10000C030 = v11;
      }
    }

    if (a1 - 1LL == ++v8)
    {
      v7 = a1;
      goto LABEL_40;
    }
  }
}

void sub_1000054A4()
{
  byte_10000C258 = 1;
}

void sub_1000054B4(FILE *a1)
{
  exit(__stdoutp != a1);
}

uint64_t sub_100005630(uint64_t result, uint64_t a2, unsigned int a3, uint64_t a4, void *a5)
{
  if (a3)
  {
    uint64_t v8 = result;
    uint64_t v9 = 0LL;
    uint64_t v49 = result;
    uint64_t v50 = a3;
    uint64_t v10 = result;
    while (!*(_BYTE *)(a4 + v9))
    {
LABEL_73:
      ++v9;
      v10 += 80LL;
      if (v9 == v50) {
        return result;
      }
    }

    uint64_t v11 = v8 + 80 * v9;
    v12 = (void *)(a2 + (v9 << 6));
    if ((byte_10000C214 & 1) != 0)
    {
      printf("%.*s zone:\n", 80, (const char *)(v8 + 80 * v9));
      v13 = v12 + 3;
      v14 = v12 + 1;
      printf("\tcur_size:    %lluK bytes (%llu elements)\n", v12[1] >> 10, v12[1] / v12[3]);
      unint64_t v15 = v12[2];
      unint64_t v16 = v12[3];
      if (v16) {
        unint64_t v16 = v15 / v16;
      }
      printf("\tmax_size:    %lluK bytes (%llu elements)\n", v15 >> 10, v16);
      printf("\telem_size:   %llu bytes\n", *v13);
      printf("\t# of elems:  %llu\n", *v12);
      uint64_t v17 = a2 + (v9 << 6);
      unint64_t v18 = *(void *)(v17 + 32);
      unint64_t v19 = *v13;
      if (*v13) {
        unint64_t v19 = v18 / v19;
      }
      result = printf("\talloc_size:  %lluK bytes (%llu elements)\n", v18 >> 10, v19);
      if (*(void *)(v17 + 48)) {
        result = puts("\tEXHAUSTIBLE");
      }
      uint64_t v20 = a2 + (v9 << 6);
      char v22 = *(_BYTE *)(v20 + 56);
      v21 = (unint64_t *)(v20 + 56);
      if ((v22 & 1) != 0) {
        result = puts("\tCOLLECTABLE");
      }
      if (byte_10000C208 == 1)
      {
        unint64_t v23 = *v12 * *v13;
        qword_10000C238 += v23;
        uint64_t v24 = *v14;
        qword_10000C230 += *v14;
        unint64_t v25 = *v21;
        uint64_t v26 = *v21 >> 1;
        qword_10000C248 += v26;
        uint64_t v27 = v24 - v23;
        uint64_t v28 = v27 - (v25 >> 1);
        qword_10000C240 += v28;
        printf("\t\t\t\t\tWASTED: %llu\n", v27);
        printf("\t\t\t\t\tFRAGMENTED: %llu\n", v28);
        result = printf("\t\t\t\t\tCOLLECTABLE: %llu\n", v26);
      }

      if (byte_10000C204 == 1)
      {
        qword_10000C250 += *(void *)(a2 + (v9 << 6) + 40);
        result = printf("\t\t\t\t\tTOTAL: %llu\n", qword_10000C250);
      }

LABEL_72:
      *a5 += *v12;
      goto LABEL_73;
    }

    int v29 = dword_10000C048;
    uint64_t v30 = (dword_10000C048 - 1);
    if (dword_10000C048 < 2)
    {
      LODWORD(v31) = 0;
LABEL_26:
      if ((_DWORD)v31 != (_DWORD)v30)
      {
        int v36 = v29 - v31;
        BOOL v35 = v29 <= (int)v31;
        uint64_t v8 = v49;
        if (!v35)
        {
          do
          {
            putchar(32);
            --v36;
          }

          while (v36);
        }

        goto LABEL_33;
      }
    }

    else
    {
      uint64_t v31 = 0LL;
      do
      {
        int v32 = *(unsigned __int8 *)(v10 + v31);
        if (v32 == 32)
        {
          int v33 = 46;
        }

        else
        {
          if (!*(_BYTE *)(v10 + v31)) {
            goto LABEL_26;
          }
          int v33 = (char)v32;
        }

        putchar(v33);
        ++v31;
      }

      while (v30 != v31);
    }

    uint64_t v8 = v49;
    if (*(_BYTE *)(v11 + v30)) {
      int v34 = 36;
    }
    else {
      int v34 = 32;
    }
    putchar(v34);
LABEL_33:
    if (byte_10000C070) {
      printf(" %*llu", unk_10000C06C * dword_10000C068, *(void *)(a2 + (v9 << 6) + 24));
    }
    if (byte_10000C090) {
      printf(" %*lluK", (dword_10000C088 - 1) * unk_10000C08C, *(void *)(a2 + (v9 << 6) + 8) >> 10);
    }
    uint64_t v37 = a2 + (v9 << 6);
    unint64_t v39 = *(void *)(v37 + 16);
    v38 = (void *)(v37 + 16);
    if (v39 <= 0x26259FFFFLL)
    {
      if (byte_10000C0B0) {
        printf(" %*lluK");
      }
    }

    else if (byte_10000C0B0)
    {
      printf(" %*s");
    }

    if (byte_10000C0D0) {
      printf( " %*llu",  unk_10000C0CC * dword_10000C0C8,  *(void *)(a2 + (v9 << 6) + 8) / *(void *)(a2 + (v9 << 6) + 24));
    }
    if (*v38 <= 0x26259FFFFuLL)
    {
      if (byte_10000C0F0) {
        printf(" %*llu");
      }
    }

    else if (byte_10000C0F0)
    {
      printf(" %*s");
    }

    if (byte_10000C110) {
      printf(" %*llu", unk_10000C10C * dword_10000C108, *v12);
    }
    if (byte_10000C130) {
      printf(" %*lluK", (dword_10000C128 - 1) * unk_10000C12C, *(void *)(a2 + (v9 << 6) + 32) >> 10);
    }
    if (byte_10000C150) {
      printf( " %*llu",  unk_10000C14C * dword_10000C148,  *(void *)(a2 + (v9 << 6) + 32) / *(void *)(a2 + (v9 << 6) + 24));
    }
    v40 = (void *)(a2 + (v9 << 6));
    uint64_t v41 = *v12 * v40[3];
    qword_10000C238 += v41;
    uint64_t v42 = v40[1];
    qword_10000C230 += v42;
    uint64_t v44 = v40[5];
    v43 = v40 + 5;
    qword_10000C250 += v44;
    unint64_t v45 = v43[2];
    qword_10000C248 += v45 >> 1;
    unint64_t v46 = v42 - (v41 + (v45 >> 1));
    qword_10000C240 += v46;
    uint64_t v47 = 67LL;
    if ((v45 & 1) == 0) {
      uint64_t v47 = 32LL;
    }
    uint64_t v48 = 88LL;
    if (!v43[1]) {
      uint64_t v48 = 32LL;
    }
    printf(" %c%c", v48, v47);
    if (byte_10000C190)
    {
      if (v46 > 0x3FF) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }

    if (byte_10000C1B0)
    {
      if (v45 > 0x7FF) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }

    if (byte_10000C1D0)
    {
      if (*v43 > 0x3FFuLL) {
        printf(" %*lluK");
      }
      else {
        printf(" %*lluB");
      }
    }

    result = putchar(10);
    goto LABEL_72;
  }

  return result;
}

      ++v35;
    }

    while (v35 != v11);
    if ((_DWORD)v62)
    {
      uint64_t v48 = 0LL;
      uint64_t v49 = 0;
      do
      {
        uint64_t v50 = *(_DWORD *)&v14[4 * v48];
        v51 = v15[76];
        v52 = *(void *)(v51 + 176LL * v50 + 16);
        if (v52)
        {
          if ((*(_BYTE *)(v51 + 176LL * v50 + 1) & 0x10) != 0)
          {
            v53 = sub_100006808(v50, 0LL);
            v54 = (const char *)qword_10000C220;
            v55 = qword_10000C228;
            v56 = strlen(v53);
            if (qword_10000C228 <= v56)
            {
              v57 = 0LL;
              v58 = v56 - qword_10000C228 + 1;
              while (strncmp(v54, &v53[v57], v55))
              {
                if (v58 == ++v57)
                {
                  uint64_t v11 = v64;
                  unint64_t v15 = (void *)&off_10000C000;
                  goto LABEL_85;
                }
              }

              uint64_t v11 = v64;
              unint64_t v15 = (void *)&off_10000C000;
              if ((v49 & 1) == 0)
              {
                puts( "-------------------------------------------------------------------------------------------------------------");
                puts( "                                                                                                          cur");
                puts( "zone views                                                                                              inuse");
                puts( "-------------------------------------------------------------------------------------------------------------");
              }

              printf("%-55s", v53);
              free(v53);
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %11s", "");
              printf(" %16lluK", v52 >> 10);
              putchar(10);
              uint64_t v49 = 1;
            }
          }
        }

void sub_100005D08( uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int (__cdecl *a7)(void *, const void *, const void *))
{
  uint64_t v59 = a6;
  uint64_t v60 = a3;
  size_t v11 = a2;
  uint64_t v12 = __chkstk_darwin();
  v14 = (char *)&v59 - v13;
  unint64_t v61 = qword_10000C230;
  unint64_t v15 = &off_10000C000;
  qword_10000C260 = v12;
  qword_10000C270 = CSSymbolicatorCreateWithMachKernel();
  qword_10000C278 = v16;
  uint64_t v17 = (const __CFDictionary *)OSKextCopyLoadedKextInfo(0LL, 0LL);
  qword_10000C268 = (uint64_t)CFDictionaryCreateMutable(kCFAllocatorDefault, 0LL, 0LL, &kCFTypeDictionaryValueCallBacks);
  CFDictionaryApplyFunction(v17, (CFDictionaryApplierFunction)sub_100006CB0, (void *)qword_10000C268);
  CFRelease(v17);
  uint64_t v62 = a2;
  if ((_DWORD)a2)
  {
    LODWORD(v64) = a5;
    uint64_t v18 = 0LL;
    do
    {
      *(_DWORD *)&v14[4 * v18] = v18;
      ++v18;
    }

    while (v11 != v18);
    uint64_t v67 = a4;
    unsigned int v19 = v64;
    int v68 = v64;
    qsort_r(v14, v11, 4uLL, &v67, a7);
    if ((_DWORD)v62)
    {
      uint64_t v20 = 0LL;
      unint64_t v65 = 0LL;
      uint64_t v66 = 0LL;
      int v63 = 0;
      while (1)
      {
        unsigned int v21 = *(_DWORD *)&v14[4 * v20];
        uint64_t v22 = v15[76];
        uint64_t v23 = *(void *)(v22 + 176LL * v21);
        if ((v23 & 3) != 0 && *(void *)(v22 + 176LL * v21 + 8) == 2LL) {
          unint64_t v65 = *(void *)(v22 + 176LL * v21 + 16);
        }
        if ((v23 & 0x200) == 0 && (v23 & 0x900) != 0) {
          break;
        }
LABEL_36:
        if (++v20 == v11) {
          goto LABEL_40;
        }
      }

      if ((v23 & 0x800) != 0)
      {
        if ((v23 & 0x2000) != 0)
        {
          uint64_t v27 = v22 + 176LL * v21;
          unint64_t v25 = *(void *)(v27 + 16);
          unint64_t v26 = *(unsigned __int16 *)(v27 + 66);
          goto LABEL_16;
        }

        uint64_t v24 = *(unsigned __int16 *)(v22 + 176LL * v21 + 66);
        if (v24 < v19)
        {
          unint64_t v25 = *(void *)(v22 + 176LL * v21 + 16);
          unint64_t v26 = *(void *)(v60 + (v24 << 6) + 24);
LABEL_16:
          v66 += v25 / v26;
        }
      }

      if (*(void *)(v22 + 176LL * v21 + 16) > 0x3FFuLL || *(void *)(v22 + 176LL * v21 + 56) >= 0x400uLL)
      {
        uint64_t v28 = a4;
        int v29 = sub_100006808(v21, a4);
        uint64_t v30 = (const char *)qword_10000C220;
        size_t v31 = qword_10000C228;
        size_t v32 = strlen(v29);
        if (qword_10000C228 > v32)
        {
LABEL_24:
          a4 = v28;
        }

        else
        {
          uint64_t v33 = 0LL;
          uint64_t v34 = v32 - qword_10000C228 + 1;
          while (strncmp(v30, &v29[v33], v31))
          {
            if (v34 == ++v33)
            {
              unint64_t v15 = (void *)&off_10000C000;
              unsigned int v19 = v64;
              goto LABEL_24;
            }
          }

          if ((v63 & 1) == 0)
          {
            puts( "-------------------------------------------------------------------------------------------------------------");
            puts( "                                                               kmod          vm        peak               cur");
            puts( "wired memory                                                     id         tag        size  waste       size");
            puts( "-------------------------------------------------------------------------------------------------------------");
          }

          printf("%-67s", v29);
          free(v29);
          unint64_t v15 = &off_10000C000;
          printf("%12d", *(unsigned __int16 *)(qword_10000C260 + 176LL * v21 + 64));
          unsigned int v19 = v64;
          if (*(void *)(qword_10000C260 + 176LL * v21 + 56)) {
            printf(" %10lluK");
          }
          else {
            printf(" %11s");
          }
          a4 = v28;
          if (*(void *)(qword_10000C260 + 176LL * v21 + 40)) {
            printf(" %5lluK");
          }
          else {
            printf(" %6s");
          }
          printf(" %9lluK", *(void *)(qword_10000C260 + 176LL * v21 + 16) >> 10);
          if ((*(_BYTE *)(qword_10000C260 + 176LL * v21 + 1) & 8) == 0) {
            qword_10000C230 += *(void *)(qword_10000C260 + 176LL * v21 + 16);
          }
          putchar(10);
          int v63 = 1;
        }
      }

      goto LABEL_36;
    }
  }

  else
  {
    uint64_t v67 = a4;
    int v68 = a5;
    qsort_r(v14, v11, 4uLL, &v67, a7);
  }

  unint64_t v65 = 0LL;
  uint64_t v66 = 0LL;
  int v63 = 0;
LABEL_40:
  if (!qword_10000C228)
  {
    printf("%-67s", "zones");
    printf("%12s", "");
    printf(" %11s", "");
    printf(" %6s", "");
    printf(" %9lluK", v61 >> 10);
    putchar(10);
  }

  size_t v64 = v11;
  if ((v63 & 1) != 0)
  {
    if (v66)
    {
      snprintf(__str, 0x28uLL, "%lld of %lld", v66, v59);
      printf("zone tags%100s\n", __str);
    }

    snprintf( __str,  0x28uLL,  "%6.2fM of %6.2fM",  (double)(unint64_t)qword_10000C230 * 0.0009765625 * 0.0009765625,  (double)v65 * 0.0009765625 * 0.0009765625);
    printf("total%104s\n", __str);
    size_t v11 = v64;
  }

  if ((_DWORD)v62)
  {
    uint64_t v35 = 0LL;
    LODWORD(v66) = 0;
    do
    {
      unsigned int v36 = *(_DWORD *)&v14[4 * v35];
      uint64_t v37 = v15[76];
      unint64_t v38 = *(void *)(v37 + 176LL * v36 + 48);
      if (v38)
      {
        uint64_t v39 = *(void *)(v37 + 176LL * v36);
        if ((v39 & 0x200) == 0)
        {
          uint64_t v40 = *(void *)(v37 + 176LL * v36 + 16);
          if ((v39 & 0x900) == 0 || v38 != v40)
          {
            uint64_t v42 = sub_100006808(*(_DWORD *)&v14[4 * v35], 0LL);
            v43 = (const char *)qword_10000C220;
            size_t v44 = qword_10000C228;
            size_t v45 = strlen(v42);
            if (qword_10000C228 <= v45)
            {
              uint64_t v46 = 0LL;
              uint64_t v47 = v45 - qword_10000C228 + 1;
              while (strncmp(v43, &v42[v46], v44))
              {
                if (v47 == ++v46)
                {
                  size_t v11 = v64;
                  unint64_t v15 = (void *)&off_10000C000;
                  goto LABEL_72;
                }
              }

              if ((v66 & 1) == 0)
              {
                puts( "-------------------------------------------------------------------------------------------------------------");
                puts( "                                                                        largest        peak               cur");
                puts( "maps                                                           free        free        size              size");
                puts( "-------------------------------------------------------------------------------------------------------------");
              }

              printf("%-55s", v42);
              free(v42);
              unint64_t v15 = &off_10000C000;
              size_t v11 = v64;
              if (*(void *)(qword_10000C260 + 176LL * v36 + 24)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              if (*(void *)(qword_10000C260 + 176LL * v36 + 32)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              if (*(void *)(qword_10000C260 + 176LL * v36 + 56)) {
                printf(" %10lluK");
              }
              else {
                printf(" %11s");
              }
              printf(" %16lluK", v38 >> 10);
              putchar(10);
              LODWORD(v66) = 1;
            }
          }
        }
      }

LABEL_85:
        ++v48;
      }

      while (v48 != v11);
    }
  }

  qword_10000C230 = v61;
}

uint64_t sub_100006604(uint64_t a1, int *a2, int *a3)
{
  unint64_t v3 = *(void *)(qword_10000C260 + 176LL * *a2 + 16);
  unint64_t v4 = *(void *)(qword_10000C260 + 176LL * *a3 + 16);
  BOOL v5 = v3 > v4;
  BOOL v6 = v3 < v4;
  if (v5) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v6;
  }
}

CFComparisonResult sub_100006638(uint64_t *a1, int *a2, int *a3)
{
  BOOL v5 = sub_100006808(*a2, *a1);
  BOOL v6 = sub_100006808(*a3, *a1);
  v7 = CFStringCreateWithCString(kCFAllocatorDefault, v5, 0x8000100u);
  uint64_t v8 = CFStringCreateWithCString(kCFAllocatorDefault, v6, 0x8000100u);
  v11.length = CFStringGetLength(v7);
  v11.location = 0LL;
  CFComparisonResult v9 = CFStringCompareWithOptionsAndLocale(v7, v8, v11, 0x40uLL, 0LL);
  CFRelease(v7);
  CFRelease(v8);
  free(v5);
  free(v6);
  return v9;
}

void sub_100006718(vm_address_t address, void *a2, unsigned int a3, char a4)
{
  if ((a4 & 1) == 0)
  {
    free((void *)address);
LABEL_12:
    free(a2);
    return;
  }

  if (address && a3 && (mach_error_t v6 = vm_deallocate(mach_task_self_, address, 80LL * a3)) != 0
    || a2 && a3 && (mach_error_t v6 = vm_deallocate(mach_task_self_, (vm_address_t)a2, (unint64_t)a3 << 6)) != 0)
  {
    v7 = __stderrp;
    uint64_t v8 = (const char *)qword_10000C1F8;
    CFComparisonResult v9 = mach_error_string(v6);
    fprintf(v7, "%s: vm_deallocate: %s\n", v8, v9);
    exit(1);
  }

  if (dword_10000C030 != 1)
  {
    free((void *)qword_10000C1D8);
    a2 = (void *)qword_10000C1E0;
    goto LABEL_12;
  }

char *sub_100006808(int a1, uint64_t a2)
{
  __s = 0LL;
  uint64_t v3 = qword_10000C260;
  uint64_t v5 = qword_10000C260 + 176LL * a1;
  if ((*(void *)v5 & 0x400) != 0)
  {
    asprintf(&__s, "%s");
  }

  else
  {
    Path = *(const char **)(v5 + 8);
    switch(*(void *)v5)
    {
      case 0u:
        switch((unint64_t)Path)
        {
          case 0uLL:
          case 1uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
          case 5uLL:
          case 6uLL:
          case 7uLL:
          case 8uLL:
          case 9uLL:
          case 0xAuLL:
          case 0xBuLL:
          case 0xCuLL:
          case 0xDuLL:
          case 0xEuLL:
          case 0xFuLL:
          case 0x10uLL:
          case 0x11uLL:
          case 0x12uLL:
          case 0x13uLL:
          case 0x14uLL:
          case 0x15uLL:
          case 0x16uLL:
          case 0x17uLL:
          case 0x18uLL:
          case 0x19uLL:
          case 0x1AuLL:
          case 0x1BuLL:
          case 0x1CuLL:
          case 0x1DuLL:
          case 0x1EuLL:
          case 0x1FuLL:
          case 0x20uLL:
          case 0x21uLL:
          case 0x23uLL:
            goto LABEL_17;
          case 0x22uLL:
            break;
          default:
            break;
        }

        asprintf(&v26, "VM_KERN_MEMORY_%lld");
        goto LABEL_21;
      case 1u:
        Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)qword_10000C268, *(const void **)(v5 + 8));
        if (Value
          && (CFComparisonResult v9 = (const __CFString *)CFDictionaryGetValue(Value, kCFBundleIdentifierKey),
              CFStringGetCStringPtr(v9, 0x8000100u)))
        {
          asprintf(&__s, "%s");
        }

        else
        {
          asprintf(&__s, "(unloaded kmod)");
        }

        goto LABEL_6;
      case 2u:
        if (Path
          && (uint64_t SymbolWithAddressAtTime = CSSymbolicatorGetSymbolWithAddressAtTime( qword_10000C270,  qword_10000C278,  *(void *)(v5 + 8),  0x8000000000000000LL),  (Name = (const char *)CSSymbolGetName(SymbolWithAddressAtTime)) != 0LL))
        {
          asprintf(&__s, "%s", Name);
          uint64_t SourceInfoWithAddressAtTime = CSSymbolicatorGetSourceInfoWithAddressAtTime( qword_10000C270,  qword_10000C278,  Path,  0x8000000000000000LL);
          uint64_t v14 = v13;
          Path = (const char *)CSSourceInfoGetPath();
          if (!Path) {
            goto LABEL_6;
          }
          int LineNumber = CSSourceInfoGetLineNumber(SourceInfoWithAddressAtTime, v14);
          printf(" (%s:%d)", Path, LineNumber);
        }

        else
        {
          asprintf(&__s, "site 0x%qx");
        }

        break;
      case 3u:
        else {
LABEL_17:
        }
          asprintf(&v26, "%s");
LABEL_21:
        Path = 0LL;
        v7 = v26;
        __s = v26;
        if (v26) {
          goto LABEL_22;
        }
        return v7;
      default:
        asprintf(&__s, "");
        break;
    }
  }

  Path = 0LL;
LABEL_6:
  v7 = __s;
  if (__s)
  {
LABEL_22:
    uint64_t v16 = *(void *)v5;
    if ((v16 & 0x800) != 0)
    {
      size_t v17 = strlen(v7);
      uint64_t v24 = 0LL;
      uint64_t v18 = v3 + 176LL * a1;
      if ((v16 & 0x2000) != 0)
      {
        asprintf(&v24, "size.%d", *(unsigned __int16 *)(v18 + 66));
        unsigned int v19 = v24;
        v7 = __s;
      }

      else
      {
        unsigned int v19 = (char *)(a2 + 80LL * *(unsigned __int16 *)(v18 + 66));
        uint64_t v24 = v19;
      }

      size_t v20 = strnlen(v19, 0x50uLL);
      if (v20 + v17 <= 0x3D || v20 >= 0x3D) {
        int v22 = v17;
      }
      else {
        int v22 = 61 - v20;
      }
      asprintf(&v26, "%.*s[%.*s]", v22, v7, v20, v19);
      free(__s);
      v7 = v26;
      __s = v26;
    }

    if (v7 && Path)
    {
      asprintf(&v26, "%-64s%3ld", v7, Path);
      free(__s);
      return v26;
    }
  }

  return v7;
}

void sub_100006CB0(int a1, CFDictionaryRef theDict, __CFDictionary *a3)
{
  Value = (const __CFNumber *)CFDictionaryGetValue(theDict, @"OSBundleLoadTag");
  CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
  CFDictionarySetValue(a3, (const void *)valuePtr, theDict);
}