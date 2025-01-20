const NXArchInfo *NXGetAllArchInfos(void)
{
  return (const NXArchInfo *)&ArchInfoTable;
}

const NXArchInfo *NXGetLocalArchInfo(void)
{
  kern_return_t v1;
  ipc_space_t *v2;
  uint64_t v3;
  host_t v4;
  kern_return_t v5;
  cpu_type_t v7;
  integer_t v8;
  cpu_subtype_t v10;
  mach_msg_type_number_t host_info_outCnt;
  integer_t host_info_out[12];
  host_info_outCnt = 2;
  host_t v0 = MEMORY[0x1895DC230]();
  v1 = host_info(v0, 12, host_info_out, &host_info_outCnt);
  v2 = (ipc_space_t *)MEMORY[0x1895FFD48];
  v3 = mach_port_deallocate(*MEMORY[0x1895FFD48], v0);
  if (v1)
  {
    host_info_outCnt = 12;
    v4 = MEMORY[0x1895DC230](v3);
    v5 = host_info(v4, 1, host_info_out, &host_info_outCnt);
    mach_port_deallocate(*v2, v4);
    if (v5) {
      return 0LL;
    }
    v7 = host_info_out[3];
    v8 = host_info_out[4];
  }

  else
  {
    v7 = host_info_out[0];
    v8 = host_info_out[1];
  }

  if (v8 == 1 && v7 == 6) {
    v10 = 3;
  }
  else {
    v10 = v8;
  }
  return NXGetArchInfoFromCpuType(v7, v10);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  v3 = &ArchInfoTable;
  while (*((_DWORD *)v3 + 2) != cputype || cpusubtype != -1 && ((*((_DWORD *)v3 + 3) ^ cpusubtype) & 0xFFFFFF) != 0)
  {
    v4 = v3[4];
    v3 += 4;
    if (!v4)
    {
      if (cputype == 18)
      {
        v3 = (char **)malloc(0x20uLL);
        *(_OWORD *)v3 = xmmword_18A331440;
        v3[2] = (char *)2;
        *((_DWORD *)v3 + 3) = cpusubtype;
        v6 = (char *)malloc(0x1EuLL);
        v3[3] = v6;
        if (v6)
        {
          __sprintf_chk(v6, 0, 0x1EuLL, "PowerPC cpusubtype %u");
          return (const NXArchInfo *)v3;
        }

LABEL_13:
        free(v3);
      }

      else if (cputype == 7)
      {
        v3 = (char **)malloc(0x20uLL);
        *(_OWORD *)v3 = xmmword_18A331380;
        v3[2] = (char *)1;
        *((_DWORD *)v3 + 3) = cpusubtype;
        v5 = (char *)malloc(0x1FuLL);
        v3[3] = v5;
        if (v5)
        {
          __sprintf_chk(v5, 0, 0x1FuLL, "Intel family %u model %u");
          return (const NXArchInfo *)v3;
        }

        goto LABEL_13;
      }

      return 0LL;
    }
  }

  return (const NXArchInfo *)v3;
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  v2 = (const NXArchInfo *)&ArchInfoTable;
  v3 = "hppa";
  while (strcmp(v3, name))
  {
    v4 = v2[1].name;
    ++v2;
    v3 = v4;
    if (!v4) {
      return 0LL;
    }
  }

  return v2;
}

void NXFreeArchInfo(const NXArchInfo *x)
{
  for (i = (const NXArchInfo *)&ArchInfoTable; i != x; ++i)
  {
    if (!i[1].name)
    {
      free((void *)x->description);
      free((void *)x);
      return;
    }
  }
}

fat_arch *__cdecl NXFindBestFatArch( cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  int v5 = internal_NXFindBestFatArch(cputype, cpusubtype, fat_archs, 0LL, nfat_archs);
  if (v5 == -1) {
    return 0LL;
  }
  else {
    return &fat_archs[v5];
  }
}

uint64_t internal_NXFindBestFatArch(int a1, int a2, _DWORD *a3, _DWORD *a4, unsigned int a5)
{
  if (!a5)
  {
LABEL_13:
    uint64_t result = 0xFFFFFFFFLL;
    if (a1 <= 16777222)
    {
      switch(a1)
      {
        case 6:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 0LL;
          v11 = a3;
          v12 = a4;
          while (1)
          {
            v13 = a4 ? v12 : v11;
            if (*v13 == 6)
            {
              v14 = a4 ? v12 : v11;
              if ((v14[1] & 0xFFFFFF) == 1) {
                break;
              }
            }

            ++result;
            v12 += 8;
            v11 += 5;
            if (a5 == result)
            {
              if ((a2 & 0xFFFFFF) != 1) {
                return 0xFFFFFFFFLL;
              }
              uint64_t result = 0LL;
              v15 = a3;
              v16 = a4;
              while (1)
              {
                v17 = a4 ? v16 : v15;
                if (*v17 == 6)
                {
                  v18 = a4 ? v16 : v15;
                  if ((v18[1] & 0xFFFFFF) == 2) {
                    break;
                  }
                }

                ++result;
                v16 += 8;
                v15 += 5;
                if (a5 == result)
                {
                  uint64_t v19 = 0LL;
                  v20 = a4;
                  while (1)
                  {
                    v21 = a4 ? v20 : a3;
                    if (*v21 == 6)
                    {
                      v22 = a4 ? v20 : a3;
                      if ((v22[1] & 0xFFFFFF) == 3) {
                        break;
                      }
                    }

                    ++v19;
                    v20 += 8;
                    a3 += 5;
                    uint64_t result = 0xFFFFFFFFLL;
                    if (a5 == v19) {
                      return result;
                    }
                  }

                  return v19;
                }
              }

              return result;
            }
          }

          return result;
        case 7:
          int v40 = a2 & 0xFFFFFF;
          if ((a2 & 0xFFFFFFu) - 3 < 2) {
            goto LABEL_122;
          }
          if (v40 == 5 || v40 == 132) {
            goto LABEL_111;
          }
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 0LL;
          v41 = a3;
          v42 = a4;
          while (1)
          {
            v43 = a4 ? v42 : v41;
            if (*v43 == 7)
            {
              v44 = a4 ? v42 : v41;
              if ((v44[1] & 0xFFFFFF) == 5) {
                break;
              }
            }

            ++result;
            v42 += 8;
            v41 += 5;
            if (a5 == result)
            {
LABEL_111:
              if (!a5) {
                return 0xFFFFFFFFLL;
              }
              uint64_t result = 0LL;
              v45 = a3;
              v46 = a4;
              while (1)
              {
                v47 = a4 ? v46 : v45;
                if (*v47 == 7)
                {
                  v48 = a4 ? v46 : v45;
                  if ((v48[1] & 0xFFFFFF) == 4) {
                    break;
                  }
                }

                ++result;
                v46 += 8;
                v45 += 5;
                if (a5 == result)
                {
LABEL_122:
                  if (!a5) {
                    return 0xFFFFFFFFLL;
                  }
                  uint64_t result = 0LL;
                  v49 = a3;
                  v50 = a4;
                  while (1)
                  {
                    v51 = a4 ? v50 : v49;
                    if (*v51 == 7)
                    {
                      v52 = a4 ? v50 : v49;
                      if ((v52[1] & 0xFFFFFF) == 3) {
                        break;
                      }
                    }

                    ++result;
                    v50 += 8;
                    v49 += 5;
                    if (a5 == result)
                    {
                      uint64_t result = 0LL;
                      v53 = a3;
                      v54 = a4;
                      while (1)
                      {
                        v55 = a4 ? v54 : v53;
                        if (*v55 == 7)
                        {
                          v56 = a4 ? v54 : v53;
                          if ((v56[1] & 0xFFFFFF) == 4) {
                            break;
                          }
                        }

                        ++result;
                        v54 += 8;
                        v53 += 5;
                        if (a5 == result)
                        {
                          uint64_t result = 0LL;
                          v57 = a3;
                          v58 = a4;
                          while (1)
                          {
                            v59 = a4 ? v58 : v57;
                            if (*v59 == 7)
                            {
                              v60 = a4 ? v58 : v57;
                              if ((v60[1] & 0xFFFFFF) == 0x84) {
                                break;
                              }
                            }

                            ++result;
                            v58 += 8;
                            v57 += 5;
                            if (a5 == result)
                            {
                              uint64_t result = 0LL;
                              v61 = a3;
                              for (i = a4; ; i += 8)
                              {
                                v63 = a4 ? i : v61;
                                if (*v63 == 7)
                                {
                                  v64 = a4 ? i : v61;
                                  if ((v64[1] & 0xFFFFFF) == 5) {
                                    break;
                                  }
                                }

                                ++result;
                                v61 += 5;
                                if (a5 == result)
                                {
                                  unsigned int v65 = 16;
                                  uint64_t v66 = a5;
                                  v67 = a3;
                                  v68 = a4;
                                  do
                                  {
                                    if (a4) {
                                      v69 = v68;
                                    }
                                    else {
                                      v69 = v67;
                                    }
                                    if (*v69 == 7)
                                    {
                                      v70 = a4 ? v68 : v67;
                                      unsigned int v71 = v70[1] & 0xF;
                                      if (v71 < v65) {
                                        unsigned int v65 = v71;
                                      }
                                    }

                                    v68 += 8;
                                    v67 += 5;
                                    --v66;
                                  }

                                  while (v66);
                                  if (v65 != 16)
                                  {
                                    uint64_t v72 = 0LL;
                                    unsigned int v73 = 0x7FFFFFFF;
                                    uint64_t result = 0xFFFFFFFFLL;
                                    v74 = a4;
                                    do
                                    {
                                      if (a4) {
                                        v75 = v74;
                                      }
                                      else {
                                        v75 = a3;
                                      }
                                      if (*v75 == 7)
                                      {
                                        if (a4) {
                                          v76 = v74;
                                        }
                                        else {
                                          v76 = a3;
                                        }
                                        unsigned int v77 = v76[1];
                                        int v78 = v77 & 0xF;
                                        unsigned int v79 = (v77 >> 4) & 0xFFFFF;
                                        if (v79 < v73)
                                        {
                                          unsigned int v80 = v72;
                                        }

                                        else
                                        {
                                          unsigned int v79 = v73;
                                          unsigned int v80 = result;
                                        }

                                        if (v78 == v65)
                                        {
                                          unsigned int v73 = v79;
                                          uint64_t result = v80;
                                        }

                                        else
                                        {
                                          uint64_t result = result;
                                        }
                                      }

                                      ++v72;
                                      v74 += 8;
                                      a3 += 5;
                                    }

                                    while (a5 != v72);
                                    return result;
                                  }

                                  return 0xFFFFFFFFLL;
                                }
                              }

                              return result;
                            }
                          }

                          return result;
                        }
                      }

                      return result;
                    }
                  }

                  return result;
                }
              }

              return result;
            }
          }

          return result;
        case 11:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v27 = 0LL;
          v81 = a4;
          while (1)
          {
            v82 = a4 ? v81 : a3;
            if (*v82 == 11)
            {
              v83 = a4 ? v81 : a3;
              if ((v83[1] & 0xFFFFFF) == 0) {
                break;
              }
            }

            ++v27;
            v81 += 8;
            a3 += 5;
            uint64_t result = 0xFFFFFFFFLL;
            if (a5 == v27) {
              return result;
            }
          }

          return v27;
        case 12:
          goto LABEL_76;
        case 13:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v27 = 0LL;
          v84 = a4;
          while (1)
          {
            v85 = a4 ? v84 : a3;
            if (*v85 == 13)
            {
              v86 = a4 ? v84 : a3;
              if ((v86[1] & 0xFFFFFF) == 0) {
                break;
              }
            }

            ++v27;
            v84 += 8;
            a3 += 5;
            uint64_t result = 0xFFFFFFFFLL;
            if (a5 == v27) {
              return result;
            }
          }

          return v27;
        case 14:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v27 = 0LL;
          v87 = a4;
          while (1)
          {
            v88 = a4 ? v87 : a3;
            if (*v88 == 14)
            {
              v89 = a4 ? v87 : a3;
              if ((v89[1] & 0xFFFFFF) == 0) {
                break;
              }
            }

            ++v27;
            v87 += 8;
            a3 += 5;
            uint64_t result = 0xFFFFFFFFLL;
            if (a5 == v27) {
              return result;
            }
          }

          return v27;
        case 15:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t v27 = 0LL;
          v90 = a4;
          while (1)
          {
            v91 = a4 ? v90 : a3;
            if (*v91 == 15)
            {
              v92 = a4 ? v90 : a3;
              if ((v92[1] & 0xFFFFFF) == 0) {
                break;
              }
            }

            ++v27;
            v90 += 8;
            a3 += 5;
            uint64_t result = 0xFFFFFFFFLL;
            if (a5 == v27) {
              return result;
            }
          }

          return v27;
        case 18:
          int v93 = a2 & 0xFFFFFF;
          if ((a2 & 0xFFFFFFu) > 0xB) {
            goto LABEL_324;
          }
          if (((1 << a2) & 0x2F8) != 0) {
            goto LABEL_241;
          }
          if (((1 << a2) & 0xC00) != 0) {
            goto LABEL_336;
          }
          if (!v93) {
            goto LABEL_325;
          }
LABEL_324:
          if (v93 != 100) {
            goto LABEL_359;
          }
LABEL_325:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 0LL;
          v124 = a3;
          v125 = a4;
          break;
        default:
          return result;
      }

      while (1)
      {
        v126 = a4 ? v125 : v124;
        if (*v126 == 18)
        {
          v127 = a4 ? v125 : v124;
          if ((v127[1] & 0xFFFFFF) == 0x64) {
            break;
          }
        }

        ++result;
        v125 += 8;
        v124 += 5;
        if (a5 == result)
        {
LABEL_336:
          if (!a5) {
            return 0xFFFFFFFFLL;
          }
          uint64_t result = 0LL;
          v128 = a3;
          v129 = a4;
          while (1)
          {
            v130 = a4 ? v129 : v128;
            if (*v130 == 18)
            {
              v131 = a4 ? v129 : v128;
              if ((v131[1] & 0xFFFFFF) == 0xB) {
                break;
              }
            }

            ++result;
            v129 += 8;
            v128 += 5;
            if (a5 == result)
            {
              uint64_t result = 0LL;
              v132 = a3;
              v133 = a4;
              while (1)
              {
                v134 = a4 ? v133 : v132;
                if (*v134 == 18)
                {
                  v135 = a4 ? v133 : v132;
                  if ((v135[1] & 0xFFFFFF) == 0xA) {
                    break;
                  }
                }

                ++result;
                v133 += 8;
                v132 += 5;
                if (a5 == result)
                {
LABEL_241:
                  if (!a5) {
                    return 0xFFFFFFFFLL;
                  }
                  uint64_t result = 0LL;
                  v94 = a3;
                  v95 = a4;
                  while (1)
                  {
                    v96 = a4 ? v95 : v94;
                    if (*v96 == 18)
                    {
                      v97 = a4 ? v95 : v94;
                      if ((v97[1] & 0xFFFFFF) == 7) {
                        break;
                      }
                    }

                    ++result;
                    v95 += 8;
                    v94 += 5;
                    if (a5 == result)
                    {
                      uint64_t result = 0LL;
                      v98 = a3;
                      v99 = a4;
                      while (1)
                      {
                        v100 = a4 ? v99 : v98;
                        if (*v100 == 18)
                        {
                          v101 = a4 ? v99 : v98;
                          if ((v101[1] & 0xFFFFFF) == 6) {
                            break;
                          }
                        }

                        ++result;
                        v99 += 8;
                        v98 += 5;
                        if (a5 == result)
                        {
                          uint64_t result = 0LL;
                          v102 = a3;
                          v103 = a4;
                          while (1)
                          {
                            v104 = a4 ? v103 : v102;
                            if ((*v104 & 0xFFFFFF) == 0x12)
                            {
                              v105 = a4 ? v103 : v102;
                              if ((v105[1] & 0xFFFFFF) == 5) {
                                break;
                              }
                            }

                            ++result;
                            v103 += 8;
                            v102 += 5;
                            if (a5 == result)
                            {
                              uint64_t result = 0LL;
                              v106 = a3;
                              v107 = a4;
                              while (1)
                              {
                                v108 = a4 ? v107 : v106;
                                if (*v108 == 18)
                                {
                                  v109 = a4 ? v107 : v106;
                                  if ((v109[1] & 0xFFFFFF) == 4) {
                                    break;
                                  }
                                }

                                ++result;
                                v107 += 8;
                                v106 += 5;
                                if (a5 == result)
                                {
                                  uint64_t result = 0LL;
                                  v110 = a3;
                                  v111 = a4;
                                  while (1)
                                  {
                                    v112 = a4 ? v111 : v110;
                                    if (*v112 == 18)
                                    {
                                      v113 = a4 ? v111 : v110;
                                      if ((v113[1] & 0xFFFFFF) == 3) {
                                        break;
                                      }
                                    }

                                    ++result;
                                    v111 += 8;
                                    v110 += 5;
                                    if (a5 == result)
                                    {
LABEL_359:
                                      if (!a5) {
                                        return 0xFFFFFFFFLL;
                                      }
                                      uint64_t v27 = 0LL;
                                      v136 = a4;
                                      while (1)
                                      {
                                        v137 = a4 ? v136 : a3;
                                        if (*v137 == 18)
                                        {
                                          v138 = a4 ? v136 : a3;
                                          if ((v138[1] & 0xFFFFFF) == 0) {
                                            break;
                                          }
                                        }

                                        ++v27;
                                        v136 += 8;
                                        a3 += 5;
                                        uint64_t result = 0xFFFFFFFFLL;
                                        if (a5 == v27) {
                                          return result;
                                        }
                                      }

                                      return v27;
                                    }
                                  }

                                  return result;
                                }
                              }

                              return result;
                            }
                          }

                          return result;
                        }
                      }

                      return result;
                    }
                  }

                  return result;
                }
              }

              return result;
            }
          }

          return result;
        }
      }

      return result;
    }

    switch(a1)
    {
      case 16777223:
        if (!a5) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v27 = 0LL;
        v114 = a4;
        while (1)
        {
          v115 = a4 ? v114 : a3;
          if (*v115 == 16777223)
          {
            v116 = a4 ? v114 : a3;
            if ((v116[1] & 0xFFFFFF) == 3) {
              break;
            }
          }

          ++v27;
          v114 += 8;
          a3 += 5;
          uint64_t result = 0xFFFFFFFFLL;
          if (a5 == v27) {
            return result;
          }
        }

        break;
      case 16777228:
LABEL_76:
        if (a5)
        {
          uint64_t v31 = 0LL;
          uint64_t result = 0LL;
          unsigned int v32 = 0;
          v33 = a3;
          v34 = a4;
          do
          {
            if (a4) {
              v35 = v34;
            }
            else {
              v35 = v33;
            }
            if (*v35 == 16777228)
            {
              if (a4) {
                v36 = v34;
              }
              else {
                v36 = v33;
              }
              int v37 = v36[1];
              if (v37) {
                int v38 = 0;
              }
              else {
                int v38 = 9;
              }
              if (v37 == 1) {
                unsigned int v39 = 10;
              }
              else {
                unsigned int v39 = v38;
              }
              if (v39 <= v32)
              {
                uint64_t result = result;
              }

              else
              {
                unsigned int v32 = v39;
                uint64_t result = v31;
              }
            }

            ++v31;
            v34 += 8;
            v33 += 5;
          }

          while (a5 != v31);
          if (v32) {
            return result;
          }
          if (a1 == 16777228)
          {
            uint64_t v117 = 0LL;
            uint64_t result = 0LL;
            int v118 = 0;
            v119 = a3;
            v120 = a4;
            do
            {
              if (a4) {
                v121 = v120;
              }
              else {
                v121 = v119;
              }
              if (*v121 == 12)
              {
                if (v118)
                {
                  int v122 = v121[1];
                  v123 = &a4[8 * result + 1];
                  if (!a4) {
                    v123 = &a3[5 * result + 1];
                  }
                  if (v122 <= *v123) {
                    uint64_t result = result;
                  }
                  else {
                    uint64_t result = v117;
                  }
                  int v118 = 1;
                }

                else
                {
                  int v118 = 1;
                  uint64_t result = v117;
                }
              }

              ++v117;
              v120 += 8;
              v119 += 5;
            }

            while (a5 != v117);
            if (v118) {
              return result;
            }
          }
        }

        return 0xFFFFFFFFLL;
      case 16777234:
        if ((a2 & 0xFFFFFF) == 0x64 || (a2 & 0xFFFFFF) == 0)
        {
          if (a5)
          {
            uint64_t result = 0LL;
            v23 = a3;
            v24 = a4;
            while (1)
            {
              v25 = a4 ? v24 : v23;
              if (*v25 == 16777234)
              {
                v26 = a4 ? v24 : v23;
                if ((v26[1] & 0xFFFFFF) == 0x64) {
                  return result;
                }
              }

              ++result;
              v24 += 8;
              v23 += 5;
              if (a5 == result) {
                goto LABEL_64;
              }
            }
          }

          return 0xFFFFFFFFLL;
        }

LABEL_64:
        if (!a5) {
          return 0xFFFFFFFFLL;
        }
        uint64_t v27 = 0LL;
        v28 = a4;
        while (1)
        {
          v29 = a4 ? v28 : a3;
          if (*v29 == 16777234)
          {
            v30 = a4 ? v28 : a3;
            if ((v30[1] & 0xFFFFFF) == 0) {
              break;
            }
          }

          ++v27;
          v28 += 8;
          a3 += 5;
          uint64_t result = 0xFFFFFFFFLL;
          if (a5 == v27) {
            return result;
          }
        }

        break;
      default:
        return result;
    }

    return v27;
  }

  uint64_t result = 0LL;
  v7 = a3;
  v8 = a4;
  while (1)
  {
    v9 = a4 ? v8 : v7;
    if (a1 != 16777228 && *v9 == a1)
    {
      v10 = a4 ? v8 : v7;
      if (((v10[1] ^ a2) & 0xFFFFFF) == 0) {
        return result;
      }
    }

    ++result;
    v8 += 8;
    v7 += 5;
    if (a5 == result) {
      goto LABEL_13;
    }
  }

fat_arch_64 *__cdecl NXFindBestFatArch_64( cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch_64 *fat_archs64, uint32_t nfat_archs)
{
  int v5 = internal_NXFindBestFatArch(cputype, cpusubtype, 0LL, fat_archs64, nfat_archs);
  if (v5 == -1) {
    return 0LL;
  }
  else {
    return &fat_archs64[v5];
  }
}

cpu_subtype_t NXCombineCpuSubtypes(cpu_type_t cputype, cpu_subtype_t cpusubtype1, cpu_subtype_t cpusubtype2)
{
  if (cputype == 7) {
    return 3;
  }
  if (cputype == 16777223)
  {
    BOOL v4 = cpusubtype2 == 8 || cpusubtype1 == 8;
    cpu_subtype_t v5 = 3;
LABEL_7:
    if (v4) {
      return -1;
    }
    else {
      return v5;
    }
  }

  else
  {
    unsigned int v7 = cpusubtype1 & 0xFFFFFF;
    uint64_t v8 = *(void *)&cpusubtype2 & 0xFFFFFFLL;
    if ((cpusubtype1 & 0xFFFFFF) == (cpusubtype2 & 0xFFFFFF))
    {
      return cpusubtype1;
    }

    else
    {
      cpu_subtype_t result = -1;
      switch(cputype)
      {
        case 6:
          if (v7 - 1 <= 2
            && (v8 - 1) <= 2
            && (v7 != 3 || (_DWORD)v8 != 2)
            && (v7 != 2 || (_DWORD)v8 != 3))
          {
            cpu_subtype_t result = 3;
            if (v7 != 3 && (_DWORD)v8 != 3) {
              goto LABEL_35;
            }
          }

          return result;
        case 7:
        case 8:
        case 9:
        case 10:
        case 16:
        case 17:
          return result;
        case 11:
          if (((cpusubtype2 | cpusubtype1) & 0xFFFFFE) != 0) {
            return -1;
          }
          else {
            return 1;
          }
        case 12:
          cpu_subtype_t result = cpusubtype2;
          if (v7)
          {
            cpu_subtype_t result = cpusubtype1;
            if ((_DWORD)v8)
            {
              cpu_subtype_t result = cpusubtype2 & 0xFFFFFF;
              switch(v7)
              {
                case 5u:
                  return result;
                case 6u:
                  BOOL v4 = (_DWORD)v8 == 8;
                  cpu_subtype_t v5 = 6;
                  goto LABEL_7;
                case 7u:
                  uint64_t v11 = v8 - 6LL;
                  if (v11 < 4)
                  {
                    v12 = &unk_188FD8AF0;
                    goto LABEL_61;
                  }

                  cpu_subtype_t result = 7;
                  break;
                case 8u:
                  uint64_t v11 = v8 - 6;
                  if ((v8 - 6) >= 4)
                  {
                    cpu_subtype_t result = 8;
                  }

                  else
                  {
                    v12 = &unk_188FD8AE0;
LABEL_61:
                    cpu_subtype_t result = v12[v11];
                  }

                  break;
                case 9u:
                  BOOL v4 = (_DWORD)v8 == 8;
                  cpu_subtype_t v5 = 9;
                  goto LABEL_7;
                default:
                  goto LABEL_55;
              }
            }
          }

          return result;
        case 13:
          if ((cpusubtype1 & 0xFFFFFD | 2) == 2 && (cpusubtype2 & 0xFFFFFD | 2) == 2)
          {
LABEL_35:
            cpu_subtype_t result = 2;
            if (v7 != 2 && (_DWORD)v8 != 2) {
              goto LABEL_55;
            }
          }

          return result;
        case 14:
          goto LABEL_24;
        case 15:
          if (((cpusubtype2 | cpusubtype1) & 0xFFFFFE) == 0)
          {
            cpu_subtype_t result = 1;
            if (v7 != 1 && (_DWORD)v8 != 1) {
              goto LABEL_55;
            }
          }

          return result;
        case 18:
          else {
            cpu_subtype_t v9 = cpusubtype1;
          }
          if ((_DWORD)v8 == 1) {
            cpu_subtype_t v9 = 1;
          }
          if (v7 == 1) {
            cpu_subtype_t v10 = 1;
          }
          else {
            cpu_subtype_t v10 = v9;
          }
          if (!(_DWORD)v8) {
            cpu_subtype_t v10 = cpusubtype1;
          }
          if (v7) {
            return v10;
          }
          else {
            return cpusubtype2;
          }
        default:
          if (cputype != 16777228) {
            return result;
          }
LABEL_24:
          if (((cpusubtype2 | cpusubtype1) & 0xFFFFFF) == 0) {
LABEL_55:
          }
            cpu_subtype_t result = -1;
          break;
      }
    }
  }

  return result;
}

unint64_t get_end(void)
{
  host_t v0 = _NSGetMachExecuteHeader();
  uint32_t ncmds = v0->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  v2 = v0;
  unint64_t result = 0LL;
  BOOL v4 = v2 + 1;
  do
  {
    if (v4->magic == 25)
    {
      uint64_t v5 = *(void *)&v4[1].magic;
      if (v5 + *(void *)&v4->flags > result) {
        unint64_t result = v5 + *(void *)&v4->flags;
      }
    }

    BOOL v4 = (mach_header_64 *)((char *)v4 + v4->cputype);
    --ncmds;
  }

  while (ncmds);
  return result;
}

unint64_t get_etext(void)
{
  unint64_t result = (unint64_t)getsectbyname("__TEXT", "__text");
  if (result) {
    return *(void *)(result + 40) + *(void *)(result + 32);
  }
  return result;
}

unint64_t get_edata(void)
{
  unint64_t result = (unint64_t)getsectbyname("__DATA", "__data");
  if (result) {
    return *(void *)(result + 40) + *(void *)(result + 32);
  }
  return result;
}

const section *__cdecl getsectbynamefromheader(const mach_header *mhp, const char *segname, const char *sectname)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  int v7 = 0;
  uint64_t v8 = mhp + 1;
  while (1)
  {
    if (v8->magic == 1 && (!strncmp((const char *)&v8->cpusubtype, segname, 0x10uLL) || mhp->filetype == 1))
    {
      uint32_t sizeofcmds = v8[1].sizeofcmds;
      if (sizeofcmds) {
        break;
      }
    }

LABEL_11:
    uint64_t v8 = (const mach_header *)((char *)v8 + v8->cputype);
    if (++v7 == ncmds) {
      return 0LL;
    }
  }

  cpu_subtype_t v10 = (const section *)&v8[2];
  while (strncmp(v10->sectname, sectname, 0x10uLL) || strncmp(v10->segname, segname, 0x10uLL))
  {
    ++v10;
    if (!--sizeofcmds) {
      goto LABEL_11;
    }
  }

  return v10;
}

    uint64_t v8 = (const mach_header_64 *)((char *)v8 + v8->cputype);
    if (++v7 == ncmds) {
      return 0LL;
    }
  }

  p_cpusubtype = (const section_64 *)&v8[2].cpusubtype;
  while (strncmp(p_cpusubtype->sectname, sectname, 0x10uLL) || strncmp(p_cpusubtype->segname, segname, 0x10uLL))
  {
    ++p_cpusubtype;
    if (!--magic) {
      goto LABEL_11;
    }
  }

  return p_cpusubtype;
}

const section_64 *__cdecl getsectbynamefromheader_64( const mach_header_64 *mhp, const char *segname, const char *sectname)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  int v7 = 0;
  uint64_t v8 = mhp + 1;
  while (1)
  {
    if (v8->magic == 25 && (!strncmp((const char *)&v8->cpusubtype, segname, 0x10uLL) || mhp->filetype == 1))
    {
      uint32_t magic = v8[2].magic;
      if (magic) {
        break;
      }
    }

const section *__cdecl getsectbynamefromheaderwithswap( mach_header *mhp, const char *segname, const char *sectname, int fSwap)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  int v9 = 0;
  cpu_subtype_t v10 = mhp + 1;
  if (fSwap) {
    int v11 = 0x1000000;
  }
  else {
    int v11 = 1;
  }
  while (1)
  {
    if (v10->magic != v11)
    {
      unsigned int cputype = v10->cputype;
      unsigned int v15 = bswap32(cputype);
      if (fSwap) {
        unsigned int cputype = v15;
      }
      goto LABEL_19;
    }

    if (fSwap) {
      swap_segment_command((segment_command *)v10, NX_BigEndian);
    }
    if (!strncmp((const char *)&v10->cpusubtype, segname, 0x10uLL) || mhp->filetype == 1)
    {
      v12 = (const section *)&v10[2];
      if (fSwap) {
        swap_section((section *)&v10[2], v10[1].sizeofcmds, NX_BigEndian);
      }
      uint32_t sizeofcmds = v10[1].sizeofcmds;
      if (sizeofcmds) {
        break;
      }
    }

LABEL_16:
    unsigned int cputype = v10->cputype;
    uint32_t ncmds = mhp->ncmds;
LABEL_19:
    cpu_subtype_t v10 = (mach_header *)((char *)v10 + cputype);
    if (++v9 >= ncmds) {
      return 0LL;
    }
  }

  while (strncmp(v12->sectname, sectname, 0x10uLL) || strncmp(v12->segname, segname, 0x10uLL))
  {
    ++v12;
    if (!--sizeofcmds) {
      goto LABEL_16;
    }
  }

  return v12;
}

    unsigned int cputype = v10->cputype;
    uint32_t ncmds = mhp->ncmds;
LABEL_19:
    cpu_subtype_t v10 = (mach_header_64 *)((char *)v10 + cputype);
    if (++v9 >= ncmds) {
      return 0LL;
    }
  }

  while (strncmp(p_cpusubtype->sectname, sectname, 0x10uLL) || strncmp(p_cpusubtype->segname, segname, 0x10uLL))
  {
    p_cpusubtype = (const section *)((char *)p_cpusubtype + 80);
    if (!--magic) {
      goto LABEL_16;
    }
  }

  return p_cpusubtype;
}

const section *__cdecl getsectbynamefromheaderwithswap_64( mach_header_64 *mhp, const char *segname, const char *sectname, int fSwap)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  int v9 = 0;
  cpu_subtype_t v10 = mhp + 1;
  if (fSwap) {
    int v11 = 0x1000000;
  }
  else {
    int v11 = 1;
  }
  while (1)
  {
    if (v10->magic != v11)
    {
      unsigned int cputype = v10->cputype;
      unsigned int v15 = bswap32(cputype);
      if (fSwap) {
        unsigned int cputype = v15;
      }
      goto LABEL_19;
    }

    if (fSwap) {
      swap_segment_command_64((segment_command_64 *)v10, NX_BigEndian);
    }
    if (!strncmp((const char *)&v10->cpusubtype, segname, 0x10uLL) || mhp->filetype == 1)
    {
      p_cpusubtype = (const section *)&v10[2].cpusubtype;
      if (fSwap) {
        swap_section_64((section_64 *)&v10[2].cpusubtype, v10[2].magic, NX_BigEndian);
      }
      uint32_t magic = v10[2].magic;
      if (magic) {
        break;
      }
    }

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  BOOL v4 = _NSGetMachExecuteHeader();
  return getsectbynamefromheader_64(v4, segname, sectname);
}

char *__cdecl getsectdata(const char *segname, const char *sectname, unint64_t *size)
{
  v6 = _NSGetMachExecuteHeader();
  unint64_t result = (char *)getsectbynamefromheader_64(v6, segname, sectname);
  if (result)
  {
    int v9 = result + 32;
    unint64_t result = (char *)*((void *)result + 4);
    unint64_t v8 = *((void *)v9 + 1);
  }

  else
  {
    unint64_t v8 = 0LL;
  }

  *size = v8;
  return result;
}

uint8_t *__cdecl getsectiondata( const mach_header_64 *mhp, const char *segname, const char *sectname, unint64_t *size)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  unint64_t v8 = 0LL;
  int v9 = 0;
  uint64_t v10 = 28LL;
  if (mhp->magic == -17958193) {
    uint64_t v10 = 32LL;
  }
  int v11 = (char *)mhp + v10;
  while (*(_DWORD *)v11 != 1)
  {
    if (*(_DWORD *)v11 == 25)
    {
      if (!strcmp(v11 + 8, "__TEXT")) {
        unint64_t v8 = (char *)mhp - *((void *)v11 + 3);
      }
      if (!strncmp(v11 + 8, segname, 0x10uLL))
      {
        uint64_t v12 = *((unsigned int *)v11 + 16);
        if ((_DWORD)v12)
        {
          v13 = v11 + 72;
          while (strncmp(v13, sectname, 0x10uLL) || strncmp(v13 + 16, segname, 0x10uLL))
          {
            v13 += 80;
            if (!--v12) {
              goto LABEL_24;
            }
          }

          uint64_t v17 = *((void *)v13 + 4);
          *size = *((void *)v13 + 5);
          return (uint8_t *)&v8[v17];
        }
      }
    }

LABEL_24:
    v11 += *((unsigned int *)v11 + 1);
    if (++v9 == ncmds) {
      return 0LL;
    }
  }

  if (!strcmp(v11 + 8, "__TEXT")) {
    unint64_t v8 = (char *)mhp - *((unsigned int *)v11 + 6);
  }
  if (strncmp(v11 + 8, segname, 0x10uLL)) {
    goto LABEL_24;
  }
  uint64_t v14 = *((unsigned int *)v11 + 12);
  if (!(_DWORD)v14) {
    goto LABEL_24;
  }
  unsigned int v15 = v11 + 56;
  while (strncmp(v15, sectname, 0x10uLL) || strncmp(v15 + 16, segname, 0x10uLL))
  {
    v15 += 68;
    if (!--v14) {
      goto LABEL_24;
    }
  }

  uint64_t v18 = *((unsigned int *)v15 + 8);
  *size = *((unsigned int *)v15 + 9);
  return (uint8_t *)&v8[v18];
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  uint32_t ncmds = mhp->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  int v7 = 0LL;
  unint64_t v8 = mhp + 1;
  while (1)
  {
    if (v8->magic == 25)
    {
    }

    unint64_t v8 = (const mach_header_64 *)((char *)v8 + v8->cputype);
    if (!--ncmds) {
      return 0LL;
    }
  }

  uint64_t v10 = *(void *)&v8->flags;
  *size = *(void *)&v8[1].magic;
  return (uint8_t *)&v7[v10];
}

char *__cdecl getsectdatafromheader(const mach_header *mhp, const char *segname, const char *sectname, uint32_t *size)
{
  unint64_t result = (char *)getsectbynamefromheader(mhp, segname, sectname);
  if (result)
  {
    *size = *((_DWORD *)result + 9);
    return (char *)*((unsigned int *)result + 8);
  }

  else
  {
    *size = 0;
  }

  return result;
}

char *__cdecl getsectdatafromheader_64( const mach_header_64 *mhp, const char *segname, const char *sectname, uint64_t *size)
{
  unint64_t result = (char *)getsectbynamefromheader_64(mhp, segname, sectname);
  if (result)
  {
    *size = *((void *)result + 5);
    return (char *)*((void *)result + 4);
  }

  else
  {
    *size = 0LL;
  }

  return result;
}

char *__cdecl getsectdatafromFramework( const char *FrameworkName, const char *segname, const char *sectname, unint64_t *size)
{
  unint64_t v8 = _dyld_image_count();
  if (!v8)
  {
LABEL_8:
    unint64_t result = 0LL;
LABEL_9:
    *size = 0LL;
    return result;
  }

  unint64_t v9 = v8;
  uint32_t v10 = 0;
  uint32_t v11 = 0;
  while (1)
  {
    image_name = _dyld_get_image_name(v10);
    v13 = strrchr(image_name, 47);
    if (v13)
    {
      int v15 = v13[1];
      uint64_t v14 = v13 + 1;
      if (v15) {
        image_name = v14;
      }
    }

    if (!strcmp(image_name, FrameworkName)) {
      break;
    }
    uint32_t v10 = ++v11;
    if (v9 <= v11) {
      goto LABEL_8;
    }
  }

  image_header = _dyld_get_image_header(v11);
  intptr_t image_vmaddr_slide = _dyld_get_image_vmaddr_slide(v10);
  unint64_t result = (char *)getsectbynamefromheader_64((const mach_header_64 *)image_header, segname, sectname);
  if (!result) {
    goto LABEL_9;
  }
  uint64_t v19 = *((void *)result + 4);
  *size = *((void *)result + 5);
  return (char *)(v19 + image_vmaddr_slide);
}

const segment_command_64 *__cdecl getsegbyname(const char *segname)
{
  v2 = _NSGetMachExecuteHeader();
  uint32_t ncmds = v2->ncmds;
  if (!ncmds) {
    return 0LL;
  }
  BOOL v4 = (const segment_command_64 *)&v2[1];
  while (v4->cmd != 25 || strncmp(v4->segname, segname, 0x10uLL))
  {
    BOOL v4 = (const segment_command_64 *)((char *)v4 + v4->cmdsize);
    if (!--ncmds) {
      return 0LL;
    }
  }

  return v4;
}

int8x16_t swap_i386_thread_state(int8x16_t *a1)
{
  int8x16_t v1 = vrev32q_s8(a1[1]);
  *a1 = vrev32q_s8(*a1);
  a1[1] = v1;
  int8x16_t result = vrev32q_s8(a1[2]);
  int8x16_t v3 = vrev32q_s8(a1[3]);
  a1[2] = result;
  a1[3] = v3;
  return result;
}

int8x16_t swap_x86_thread_state64(int8x16_t *a1)
{
  int8x16_t v1 = vrev64q_s8(a1[1]);
  *a1 = vrev64q_s8(*a1);
  a1[1] = v1;
  int8x16_t v2 = vrev64q_s8(a1[3]);
  a1[2] = vrev64q_s8(a1[2]);
  a1[3] = v2;
  int8x16_t v3 = vrev64q_s8(a1[5]);
  a1[4] = vrev64q_s8(a1[4]);
  a1[5] = v3;
  int8x16_t v4 = vrev64q_s8(a1[7]);
  a1[6] = vrev64q_s8(a1[6]);
  a1[7] = v4;
  int8x16_t result = vrev64q_s8(a1[8]);
  int8x16_t v6 = vrev64q_s8(a1[9]);
  a1[8] = result;
  a1[9] = v6;
  a1[10].i64[0] = bswap64(a1[10].u64[0]);
  return result;
}

int8x8_t swap_x86_state_hdr(int8x8_t *a1)
{
  int8x8_t result = vrev32_s8(*a1);
  *a1 = result;
  return result;
}

int8x8_t swap_x86_float_state64(int8x8_t *a1, int a2)
{
  *a1 = vrev32_s8(*a1);
  unsigned int v2 = a1[1].u16[0];
  if (a2 == 1)
  {
    unsigned int v3 = bswap32(v2);
    a1[1].i16[0] = v2 & 0xF0C0 | (v3 >> 31) | (v3 >> 10) & 0xC00 | (v3 >> 14) & 0x300 | (v3 >> 21) & 0x20 | (v3 >> 23) & 0x10 | (v3 >> 25) & 8 | (v3 >> 27) & 4 | (v3 >> 29) & 2;
    unsigned int v4 = bswap32(a1[1].u16[1]);
    unsigned int v5 = (v4 >> 7) & 0x3800 | (v4 >> 31) | (__rbit32(HIWORD(v4)) >> 30 << 14) | (v4 >> 11) & 0x400 | (v4 >> 13) & 0x200 | (v4 >> 15) & 0x100 | (v4 >> 17) & 0x80 | (v4 >> 19) & 0x40 | (v4 >> 21) & 0x20 | (v4 >> 23) & 0x10 | (v4 >> 25) & 8 | (v4 >> 27) & 4 | (v4 >> 29) & 2;
  }

  else
  {
    a1[1].i16[0] = __rev16((v2 >> 6) & 0x30 | (v2 >> 2) & 0xC0 | (__rbit32(v2) >> 26 << 10));
    unsigned int v6 = a1[1].u16[1];
    unsigned int v5 = bswap32( ((v6 << 11) & 0x2000 | (((v6 >> 3) & 1) << 12) & 0xFFFFBFFF | (((v6 >> 4) & 1) << 11) & 0xFFFFBFFF | (((v6 >> 5) & 1) << 10) & 0xFFFFBFFF | (((v6 >> 6) & 1) << 9) & 0xFFFFBFFF | (((v6 >> 7) & 1) << 8) & 0xFFFFBFFF | (((v6 >> 1) & 1) << 14) | (v6 >> 13) & 2 | (v6 >> 15) | (v6 >> 9) & 0x1C | (v6 >> 5) & 0x20 | (v6 >> 3) & 0x40 | (v6 >> 1) & 0x80)
         + (v6 << 15)) >> 16;
  }

  a1[1].i16[1] = v5;
  a1[1].i16[3] = bswap32(a1[1].u16[3]) >> 16;
  a1[2].i32[0] = bswap32(a1[2].u32[0]);
  a1[2].i16[2] = bswap32(a1[2].u16[2]) >> 16;
  a1[2].i16[3] = bswap32(a1[2].u16[3]) >> 16;
  a1[3].i32[0] = bswap32(a1[3].u32[0]);
  a1[3].i16[2] = bswap32(a1[3].u16[2]) >> 16;
  a1[3].i16[3] = bswap32(a1[3].u16[3]) >> 16;
  int8x8_t result = vrev32_s8(a1[4]);
  a1[4] = result;
  a1[65].i32[0] = bswap32(a1[65].u32[0]);
  return result;
}

uint64_t swap_x86_exception_state64(uint64_t result)
{
  *(_WORD *)int8x8_t result = 0;
  *(_DWORD *)(result + 4) = bswap32(*(_DWORD *)(result + 4));
  *(void *)(result + 8) = bswap64(*(void *)(result + 8));
  return result;
}

double swap_x86_thread_state(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)a1;
  unsigned int v3 = *(_DWORD *)(a1 + 4);
  unsigned int v4 = bswap32(*(_DWORD *)a1);
  if (a2 == 1) {
    unsigned int v2 = v4;
  }
  *(_DWORD *)a1 = v4;
  *(_DWORD *)(a1 + 4) = bswap32(v3);
  if (v2 == 4)
  {
    *(void *)&double result = swap_x86_thread_state64((int8x16_t *)(a1 + 8)).u64[0];
  }

  else if (v2 == 1)
  {
    *(void *)&double result = swap_i386_thread_state((int8x16_t *)(a1 + 8)).u64[0];
  }

  return result;
}

int8x8_t swap_x86_float_state(int8x8_t *a1, int a2)
{
  unsigned int v2 = a1->i32[0];
  unsigned int v3 = a1->u32[1];
  unsigned int v4 = bswap32(a1->i32[0]);
  if (a2 == 1) {
    unsigned int v2 = v4;
  }
  a1->i32[0] = v4;
  a1->i32[1] = bswap32(v3);
  if (v2 == 5) {
    return swap_x86_float_state64(a1 + 1, a2);
  }
  if (v2 == 2) {
    return swap_i386_float_state(a1 + 1, a2);
  }
  return result;
}

int8x8_t swap_i386_float_state(int8x8_t *a1, int a2)
{
  *a1 = vrev32_s8(*a1);
  unsigned int v2 = a1[1].u16[0];
  if (a2 == 1)
  {
    unsigned int v3 = bswap32(v2);
    a1[1].i16[0] = v2 & 0xF0C0 | (v3 >> 31) | (v3 >> 10) & 0xC00 | (v3 >> 14) & 0x300 | (v3 >> 21) & 0x20 | (v3 >> 23) & 0x10 | (v3 >> 25) & 8 | (v3 >> 27) & 4 | (v3 >> 29) & 2;
    unsigned int v4 = bswap32(a1[1].u16[1]);
    unsigned int v5 = (v4 >> 7) & 0x3800 | (v4 >> 31) | (__rbit32(HIWORD(v4)) >> 30 << 14) | (v4 >> 11) & 0x400 | (v4 >> 13) & 0x200 | (v4 >> 15) & 0x100 | (v4 >> 17) & 0x80 | (v4 >> 19) & 0x40 | (v4 >> 21) & 0x20 | (v4 >> 23) & 0x10 | (v4 >> 25) & 8 | (v4 >> 27) & 4 | (v4 >> 29) & 2;
  }

  else
  {
    a1[1].i16[0] = __rev16((v2 >> 6) & 0x30 | (v2 >> 2) & 0xC0 | (__rbit32(v2) >> 26 << 10));
    unsigned int v6 = a1[1].u16[1];
    unsigned int v5 = bswap32( ((v6 << 11) & 0x2000 | (((v6 >> 3) & 1) << 12) & 0xFFFFBFFF | (((v6 >> 4) & 1) << 11) & 0xFFFFBFFF | (((v6 >> 5) & 1) << 10) & 0xFFFFBFFF | (((v6 >> 6) & 1) << 9) & 0xFFFFBFFF | (((v6 >> 7) & 1) << 8) & 0xFFFFBFFF | (((v6 >> 1) & 1) << 14) | (v6 >> 13) & 2 | (v6 >> 15) | (v6 >> 9) & 0x1C | (v6 >> 5) & 0x20 | (v6 >> 3) & 0x40 | (v6 >> 1) & 0x80)
         + (v6 << 15)) >> 16;
  }

  a1[1].i16[1] = v5;
  a1[1].i16[3] = bswap32(a1[1].u16[3]) >> 16;
  a1[2].i32[0] = bswap32(a1[2].u32[0]);
  a1[2].i16[2] = bswap32(a1[2].u16[2]) >> 16;
  a1[2].i16[3] = bswap32(a1[2].u16[3]) >> 16;
  a1[3].i32[0] = bswap32(a1[3].u32[0]);
  a1[3].i16[2] = bswap32(a1[3].u16[2]) >> 16;
  a1[3].i16[3] = bswap32(a1[3].u16[3]) >> 16;
  int8x8_t result = vrev32_s8(a1[4]);
  a1[4] = result;
  a1[65].i32[0] = bswap32(a1[65].u32[0]);
  return result;
}

uint64_t swap_x86_exception_state(uint64_t result, int a2)
{
  unsigned int v2 = *(_DWORD *)result;
  unsigned int v3 = *(_DWORD *)(result + 4);
  unsigned int v4 = bswap32(*(_DWORD *)result);
  if (a2 == 1) {
    unsigned int v2 = v4;
  }
  *(_DWORD *)int8x8_t result = v4;
  *(_DWORD *)(result + 4) = bswap32(v3);
  if (v2 == 6)
  {
    *(_WORD *)(result + 8) = 0;
    *(_DWORD *)(result + 12) = bswap32(*(_DWORD *)(result + 12));
    *(void *)(result + 16) = bswap64(*(void *)(result + 16));
  }

  else if (v2 == 3)
  {
    *(_WORD *)(result + 8) = 0;
    *(int8x8_t *)(result + 12) = vrev32_s8(*(int8x8_t *)(result + 12));
  }

  return result;
}

int8x8_t swap_i386_exception_state(uint64_t a1)
{
  *(_WORD *)a1 = 0;
  int8x8_t result = vrev32_s8(*(int8x8_t *)(a1 + 4));
  *(int8x8_t *)(a1 + 4) = result;
  return result;
}

int8x16_t swap_x86_debug_state32(int8x16_t *a1)
{
  int8x16_t result = vrev32q_s8(*a1);
  int8x16_t v2 = vrev32q_s8(a1[1]);
  *a1 = result;
  a1[1] = v2;
  return result;
}

int8x16_t swap_x86_debug_state64(int8x16_t *a1)
{
  int8x16_t v1 = vrev64q_s8(a1[1]);
  *a1 = vrev64q_s8(*a1);
  a1[1] = v1;
  int8x16_t result = vrev64q_s8(a1[2]);
  int8x16_t v3 = vrev64q_s8(a1[3]);
  a1[2] = result;
  a1[3] = v3;
  return result;
}

double swap_x86_debug_state(uint64_t a1, int a2)
{
  unsigned int v2 = *(_DWORD *)a1;
  unsigned int v3 = *(_DWORD *)(a1 + 4);
  unsigned int v4 = bswap32(*(_DWORD *)a1);
  if (a2 == 1) {
    unsigned int v2 = v4;
  }
  *(_DWORD *)a1 = v4;
  *(_DWORD *)(a1 + 4) = bswap32(v3);
  if (v2 == 11)
  {
    *(void *)&double result = swap_x86_debug_state64((int8x16_t *)(a1 + 8)).u64[0];
  }

  else if (v2 == 10)
  {
    *(void *)&double result = swap_x86_debug_state32((int8x16_t *)(a1 + 8)).u64[0];
  }

  return result;
}

void slot_name(cpu_type_t a1, cpu_subtype_t a2, char **a3, char **a4)
{
  unsigned int v6 = NXGetArchInfoFromCpuType(a1, a2);
  if (v6)
  {
    name = (char *)v6->name;
    description = (char *)v6->description;
  }

  else
  {
    name = "Unknown CPU";
    description = (char *)&unk_188FD8F42;
  }

  *a3 = name;
  *a4 = description;
}

void swap_fat_header(fat_header *fat_header, NXByteOrder target_byte_order)
{
  *fat_header = (fat_header)vrev32_s8((int8x8_t)*fat_header);
}

void swap_fat_arch(fat_arch *fat_archs, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
  if (nfat_arch)
  {
    uint64_t v3 = nfat_arch;
    p_align = &fat_archs->align;
    do
    {
      *((int8x16_t *)p_align - 1) = vrev32q_s8(*((int8x16_t *)p_align - 1));
      uint32_t *p_align = bswap32(*p_align);
      p_align += 5;
      --v3;
    }

    while (v3);
  }

void swap_fat_arch_64(fat_arch_64 *fat_archs64, uint32_t nfat_arch, NXByteOrder target_byte_order)
{
  if (nfat_arch)
  {
    uint64_t v3 = nfat_arch;
    do
    {
      *(int8x8_t *)&fat_archs64->unsigned int cputype = vrev32_s8(*(int8x8_t *)&fat_archs64->cputype);
      *(int8x16_t *)&fat_archs64->offset = vrev64q_s8(*(int8x16_t *)&fat_archs64->offset);
      *(int8x8_t *)&fat_archs64->align = vrev32_s8(*(int8x8_t *)&fat_archs64->align);
      ++fat_archs64;
      --v3;
    }

    while (v3);
  }

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
  *(int8x16_t *)&mh->uint32_t magic = vrev32q_s8(*(int8x16_t *)&mh->magic);
  *(int8x8_t *)&mh->uint32_t ncmds = vrev32_s8(*(int8x8_t *)&mh->ncmds);
  mh->flags = bswap32(mh->flags);
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)&mh->ncmds);
  *(int8x16_t *)&mh->uint32_t magic = vrev32q_s8(*(int8x16_t *)&mh->magic);
  *(int8x16_t *)&mh->uint32_t ncmds = v2;
}

void swap_load_command(load_command *lc, NXByteOrder target_byte_order)
{
  *lc = (load_command)vrev32_s8((int8x8_t)*lc);
}

void swap_segment_command(segment_command *sg, NXByteOrder target_byte_order)
{
  *(int8x8_t *)&sg->cmd = vrev32_s8(*(int8x8_t *)&sg->cmd);
  *(int8x16_t *)&sg->vmaddr = vrev32q_s8(*(int8x16_t *)&sg->vmaddr);
  *(int8x16_t *)&sg->maxprot = vrev32q_s8(*(int8x16_t *)&sg->maxprot);
}

void swap_segment_command_64(segment_command_64 *sg, NXByteOrder target_byte_order)
{
  *(int8x8_t *)&sg->cmd = vrev32_s8(*(int8x8_t *)&sg->cmd);
  *(int8x16_t *)&sg->vmaddr = vrev64q_s8(*(int8x16_t *)&sg->vmaddr);
  *(int8x16_t *)&sg->fileoff = vrev64q_s8(*(int8x16_t *)&sg->fileoff);
  *(int8x16_t *)&sg->maxprot = vrev32q_s8(*(int8x16_t *)&sg->maxprot);
}

void swap_section(section *s, uint32_t nsects, NXByteOrder target_byte_order)
{
  if (nsects)
  {
    uint64_t v3 = nsects;
    p_reserved2 = &s->reserved2;
    do
    {
      int8x16_t v5 = vrev32q_s8(*((int8x16_t *)p_reserved2 - 1));
      *((int8x16_t *)p_reserved2 - 2) = vrev32q_s8(*((int8x16_t *)p_reserved2 - 2));
      *((int8x16_t *)p_reserved2 - 1) = v5;
      uint32_t *p_reserved2 = bswap32(*p_reserved2);
      p_reserved2 += 17;
      --v3;
    }

    while (v3);
  }

void swap_section_64(section_64 *s, uint32_t nsects, NXByteOrder target_byte_order)
{
  if (nsects)
  {
    uint64_t v3 = nsects;
    p_flags = (int8x16_t *)&s->flags;
    do
    {
      int8x16_t v5 = vrev32q_s8(p_flags[-1]);
      p_flags[-2] = vrev64q_s8(p_flags[-2]);
      p_flags[-1] = v5;
      int8x16_t *p_flags = vrev32q_s8(*p_flags);
      p_flags += 5;
      --v3;
    }

    while (v3);
  }

void swap_symtab_command(symtab_command *st, NXByteOrder target_byte_order)
{
  *(int8x16_t *)&st->cmd = vrev32q_s8(*(int8x16_t *)&st->cmd);
  *(int8x8_t *)&st->stroff = vrev32_s8(*(int8x8_t *)&st->stroff);
}

void swap_dysymtab_command(dysymtab_command *dyst, NXByteOrder target_byte_sex)
{
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)&dyst->iextdefsym);
  *(int8x16_t *)&dyst->cmd = vrev32q_s8(*(int8x16_t *)&dyst->cmd);
  *(int8x16_t *)&dyst->iextdefsym = v2;
  int8x16_t v3 = vrev32q_s8(*(int8x16_t *)&dyst->extrefsymoff);
  *(int8x16_t *)&dyst->tocoff = vrev32q_s8(*(int8x16_t *)&dyst->tocoff);
  *(int8x16_t *)&dyst->extrefsymoff = v3;
  *(int8x16_t *)&dyst->extreloff = vrev32q_s8(*(int8x16_t *)&dyst->extreloff);
}

void swap_symseg_command(symseg_command *ss, NXByteOrder target_byte_order)
{
  *(int8x16_t *)ss = vrev32q_s8(*(int8x16_t *)ss);
}

void swap_fvmlib_command(fvmlib_command *fl, NXByteOrder target_byte_order)
{
  *(int8x16_t *)&fl->cmd = vrev32q_s8(*(int8x16_t *)&fl->cmd);
  fl->fvmlib.header_addr = bswap32(fl->fvmlib.header_addr);
}

void swap_dylib_command(dylib_command *dl, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)&dl->cmd = vrev32q_s8(*(int8x16_t *)&dl->cmd);
  *(int8x8_t *)&dl->dylib.current_version = vrev32_s8(*(int8x8_t *)&dl->dylib.current_version);
}

void swap_sub_framework_command(sub_framework_command *sub, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&sub->cmd = vrev32_s8(*(int8x8_t *)&sub->cmd);
  sub->umbrella.offset = bswap32(sub->umbrella.offset);
}

void swap_sub_umbrella_command(sub_umbrella_command *usub, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&usub->cmd = vrev32_s8(*(int8x8_t *)&usub->cmd);
  usub->sub_umbrella.offset = bswap32(usub->sub_umbrella.offset);
}

void swap_sub_library_command(sub_library_command *lsub, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&lsub->cmd = vrev32_s8(*(int8x8_t *)&lsub->cmd);
  lsub->sub_library.offset = bswap32(lsub->sub_library.offset);
}

void swap_sub_client_command(sub_client_command *csub, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&csub->cmd = vrev32_s8(*(int8x8_t *)&csub->cmd);
  csub->client.offset = bswap32(csub->client.offset);
}

void swap_prebound_dylib_command(prebound_dylib_command *pbdylib, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)&pbdylib->cmd = vrev32q_s8(*(int8x16_t *)&pbdylib->cmd);
  pbdylib->linked_modules.offset = bswap32(pbdylib->linked_modules.offset);
}

void swap_dylinker_command(dylinker_command *dyld, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&dyld->cmd = vrev32_s8(*(int8x8_t *)&dyld->cmd);
  dyld->name.offset = bswap32(dyld->name.offset);
}

void swap_fvmfile_command(fvmfile_command *ff, NXByteOrder target_byte_order)
{
  *(int8x16_t *)ff = vrev32q_s8(*(int8x16_t *)ff);
}

void swap_thread_command(thread_command *ut, NXByteOrder target_byte_order)
{
  *ut = (thread_command)vrev32_s8((int8x8_t)*ut);
}

void swap_ident_command(ident_command *ident, NXByteOrder target_byte_order)
{
  *ident = (ident_command)vrev32_s8((int8x8_t)*ident);
}

void swap_routines_command(routines_command *r_cmd, NXByteOrder target_byte_sex)
{
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)&r_cmd->reserved1);
  *(int8x16_t *)&r_cmd->cmd = vrev32q_s8(*(int8x16_t *)&r_cmd->cmd);
  *(int8x16_t *)&r_cmd->reserved1 = v2;
  *(int8x8_t *)&r_cmd->reserved5 = vrev32_s8(*(int8x8_t *)&r_cmd->reserved5);
}

void swap_routines_command_64(routines_command_64 *r_cmd, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&r_cmd->cmd = vrev32_s8(*(int8x8_t *)&r_cmd->cmd);
  *(int8x16_t *)&r_cmd->init_address = vrev64q_s8(*(int8x16_t *)&r_cmd->init_address);
  *(int8x16_t *)&r_cmd->reserved1 = vrev64q_s8(*(int8x16_t *)&r_cmd->reserved1);
  *(int8x16_t *)&r_cmd->reserved3 = vrev64q_s8(*(int8x16_t *)&r_cmd->reserved3);
  *(int8x16_t *)&r_cmd->reserved5 = vrev64q_s8(*(int8x16_t *)&r_cmd->reserved5);
}

void swap_twolevel_hints_command(twolevel_hints_command *hints_cmd, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)hints_cmd = vrev32q_s8(*(int8x16_t *)hints_cmd);
}

void swap_twolevel_hint(twolevel_hint *hints, uint32_t nhints, NXByteOrder target_byte_sex)
{
  if (nhints)
  {
    uint64_t v3 = nhints;
    do
    {
      if (target_byte_sex == NX_LittleEndian)
      {
        HIDWORD(v5) = bswap32(*hints);
        LODWORD(v5) = HIDWORD(v5);
        twolevel_hint v4 = (twolevel_hint)(v5 >> 24);
      }

      else
      {
        HIDWORD(v6) = *hints;
        LODWORD(v6) = *hints;
        twolevel_hint v4 = (twolevel_hint)bswap32(v6 >> 8);
      }

      *hints++ = v4;
      --v3;
    }

    while (v3);
  }

void swap_prebind_cksum_command(prebind_cksum_command *cksum_cmd, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&cksum_cmd->cmd = vrev32_s8(*(int8x8_t *)&cksum_cmd->cmd);
  cksum_cmd->cksum = bswap32(cksum_cmd->cksum);
}

void swap_uuid_command(uuid_command *uuid_cmd, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&uuid_cmd->cmd = vrev32_s8(*(int8x8_t *)&uuid_cmd->cmd);
}

void swap_linkedit_data_command(linkedit_data_command *ld, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)ld = vrev32q_s8(*(int8x16_t *)ld);
}

void swap_version_min_command(version_min_command *ver_cmd, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&ver_cmd->cmd = vrev32_s8(*(int8x8_t *)&ver_cmd->cmd);
  ver_cmd->version = bswap32(ver_cmd->version);
}

void swap_build_version_command(build_version_command *bv, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)&bv->cmd = vrev32q_s8(*(int8x16_t *)&bv->cmd);
  *(int8x8_t *)&bv->sdk = vrev32_s8(*(int8x8_t *)&bv->sdk);
}

void swap_build_tool_version(build_tool_version *bt, uint32_t ntools, NXByteOrder target_byte_sex)
{
  if (ntools)
  {
    uint64_t v3 = ntools;
    do
    {
      *bt = (build_tool_version)vrev32_s8((int8x8_t)*bt);
      ++bt;
      --v3;
    }

    while (v3);
  }

void swap_rpath_command(rpath_command *rpath_cmd, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&rpath_cmd->cmd = vrev32_s8(*(int8x8_t *)&rpath_cmd->cmd);
  rpath_cmd->path.offset = bswap32(rpath_cmd->path.offset);
}

void swap_encryption_command(encryption_info_command *ec, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)&ec->cmd = vrev32q_s8(*(int8x16_t *)&ec->cmd);
  ec->cryptid = bswap32(ec->cryptid);
}

void swap_encryption_command_64(encryption_info_command_64 *ec, NXByteOrder target_byte_sex)
{
  *(int8x16_t *)&ec->cmd = vrev32q_s8(*(int8x16_t *)&ec->cmd);
  ec->cryptid = bswap32(ec->pad);
}

void swap_linker_option_command(linker_option_command *lo, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&lo->cmd = vrev32_s8(*(int8x8_t *)&lo->cmd);
  lo->count = bswap32(lo->count);
}

void swap_dyld_info_command(dyld_info_command *ed, NXByteOrder target_byte_sex)
{
  int8x16_t v2 = vrev32q_s8(*(int8x16_t *)&ed->bind_off);
  *(int8x16_t *)&ed->cmd = vrev32q_s8(*(int8x16_t *)&ed->cmd);
  *(int8x16_t *)&ed->bind_off = v2;
  *(int8x16_t *)&ed->lazy_bind_off = vrev32q_s8(*(int8x16_t *)&ed->lazy_bind_off);
}

void swap_entry_point_command(entry_point_command *ep, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&ep->cmd = vrev32_s8(*(int8x8_t *)&ep->cmd);
  *(int8x16_t *)&ep->entryoff = vrev64q_s8(*(int8x16_t *)&ep->entryoff);
}

void swap_source_version_command(source_version_command *sv, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&sv->cmd = vrev32_s8(*(int8x8_t *)&sv->cmd);
  sv->version = bswap64(sv->version);
}

void swap_note_command(note_command *nc, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&nc->cmd = vrev32_s8(*(int8x8_t *)&nc->cmd);
  *(int8x16_t *)&nc->offset = vrev64q_s8(*(int8x16_t *)&nc->offset);
}

void swap_fileset_entry_command(fileset_entry_command *lc, NXByteOrder target_byte_sex)
{
  *(int8x8_t *)&lc->cmd = vrev32_s8(*(int8x8_t *)&lc->cmd);
  *(int8x16_t *)&lc->vmaddr = vrev64q_s8(*(int8x16_t *)&lc->vmaddr);
  *(int8x8_t *)&lc->entry_id.offset = vrev32_s8(*(int8x8_t *)&lc->entry_id.offset);
}

void swap_nlist(nlist *symbols, uint32_t nsymbols, NXByteOrder target_byte_order)
{
  if (nsymbols)
  {
    uint64_t v3 = nsymbols;
    p_n_value = &symbols->n_value;
    do
    {
      *(p_n_value - 2) = bswap32(*(p_n_value - 2));
      *((_WORD *)p_n_value - 1) = bswap32(*((unsigned __int16 *)p_n_value - 1)) >> 16;
      uint32_t *p_n_value = bswap32(*p_n_value);
      p_n_value += 3;
      --v3;
    }

    while (v3);
  }

void swap_nlist_64(nlist_64 *symbols, uint32_t nsymbols, NXByteOrder target_byte_order)
{
  if (nsymbols)
  {
    uint64_t v3 = nsymbols;
    p_n_value = &symbols->n_value;
    do
    {
      *((_DWORD *)p_n_value - 2) = bswap32(*((_DWORD *)p_n_value - 2));
      *((_WORD *)p_n_value - 1) = bswap32(*((unsigned __int16 *)p_n_value - 1)) >> 16;
      uint64_t *p_n_value = bswap64(*p_n_value);
      p_n_value += 2;
      --v3;
    }

    while (v3);
  }

void swap_ranlib(ranlib *ranlibs, uint32_t nranlibs, NXByteOrder target_byte_order)
{
  if (nranlibs)
  {
    uint64_t v3 = nranlibs;
    do
    {
      *ranlibs = (ranlib)vrev32_s8((int8x8_t)*ranlibs);
      ++ranlibs;
      --v3;
    }

    while (v3);
  }

void swap_ranlib_64(ranlib_64 *ranlibs, uint64_t nranlibs, NXByteOrder target_byte_order)
{
  {
    *(int8x16_t *)ranlibs = vrev64q_s8(*(int8x16_t *)ranlibs);
    ++ranlibs;
  }

void swap_relocation_info(relocation_info *relocs, uint32_t nrelocs, NXByteOrder target_byte_order)
{
  if (nrelocs)
  {
    uint64_t v3 = nrelocs;
    for (i = (unsigned int *)relocs + 1; ; i += 2)
    {
      uint64_t v5 = *(i - 1);
      if (target_byte_order == NX_LittleEndian) {
        break;
      }
      if ((v5 & 0x80000000) != 0) {
        goto LABEL_8;
      }
      *(void *)(i - 1) = bswap64((*i >> 20) & 0x60 | (*i << 8) | (*i >> 17) & 0x80 | (*i >> 23) & 0x10 | (*i >> 28) | (unint64_t)(v5 << 32));
LABEL_10:
      if (!--v3) {
        return;
      }
    }

    if ((v5 & 0x80) != 0)
    {
LABEL_8:
      *(i - 1) = bswap32(v5);
      unsigned int v7 = bswap32(*i);
    }

    else
    {
      unsigned int v6 = bswap32(*i);
      *(i - 1) = bswap32(*(i - 1));
      unsigned int v7 = (v6 >> 8) & 0xF0FFFFFF | (v6 << 28) | (((v6 >> 7) & 1) << 24) & 0xF1FFFFFF | (((v6 >> 5) & 3) << 25) & 0xF7FFFFFF | (((v6 >> 4) & 1) << 27);
    }

    unsigned int *i = v7;
    goto LABEL_10;
  }

void swap_indirect_symbols(uint32_t *indirect_symbols, uint32_t nindirect_symbols, NXByteOrder target_byte_sex)
{
  if (nindirect_symbols)
  {
    uint64_t v3 = nindirect_symbols;
    do
    {
      *indirect_symbols = bswap32(*indirect_symbols);
      ++indirect_symbols;
      --v3;
    }

    while (v3);
  }

void swap_dylib_reference(dylib_reference *refs, uint32_t nrefs, NXByteOrder target_byte_sex)
{
  if (nrefs)
  {
    uint64_t v3 = nrefs;
    do
    {
      if (target_byte_sex == NX_LittleEndian)
      {
        HIDWORD(v5) = bswap32(*refs);
        LODWORD(v5) = HIDWORD(v5);
        dylib_reference v4 = (dylib_reference)(v5 >> 8);
      }

      else
      {
        HIDWORD(v6) = *refs;
        LODWORD(v6) = *refs;
        dylib_reference v4 = (dylib_reference)bswap32(v6 >> 24);
      }

      *refs++ = v4;
      --v3;
    }

    while (v3);
  }

void swap_dylib_module(dylib_module *mods, uint32_t nmods, NXByteOrder target_byte_sex)
{
  if (nmods)
  {
    uint64_t v3 = nmods;
    p_nextrel = (int8x16_t *)&mods->nextrel;
    do
    {
      int8x16_t v5 = vrev32q_s8(p_nextrel[-1]);
      p_nextrel[-2] = vrev32q_s8(p_nextrel[-2]);
      p_nextrel[-1] = v5;
      p_nextrel[1].i32[0] = bswap32(p_nextrel[1].u32[0]);
      int8x16_t *p_nextrel = vrev32q_s8(*p_nextrel);
      p_nextrel = (int8x16_t *)((char *)p_nextrel + 52);
      --v3;
    }

    while (v3);
  }

void swap_dylib_module_64(dylib_module_64 *mods, uint32_t nmods, NXByteOrder target_byte_sex)
{
  if (nmods)
  {
    uint64_t v3 = nmods;
    p_nextrel = (int8x16_t *)&mods->nextrel;
    do
    {
      int8x16_t v5 = vrev32q_s8(p_nextrel[-1]);
      p_nextrel[-2] = vrev32q_s8(p_nextrel[-2]);
      p_nextrel[-1] = v5;
      int8x16_t *p_nextrel = vrev32q_s8(*p_nextrel);
      p_nextrel[1].i64[0] = bswap64(p_nextrel[1].u64[0]);
      p_nextrel = (int8x16_t *)((char *)p_nextrel + 56);
      --v3;
    }

    while (v3);
  }

void swap_dylib_table_of_contents(dylib_table_of_contents *tocs, uint32_t ntocs, NXByteOrder target_byte_sex)
{
  if (ntocs)
  {
    uint64_t v3 = ntocs;
    do
    {
      *tocs = (dylib_table_of_contents)vrev32_s8((int8x8_t)*tocs);
      ++tocs;
      --v3;
    }

    while (v3);
  }

mach_header_64 *_NSGetMachExecuteHeader(void)
{
  return (mach_header_64 *)MEMORY[0x1895FEDA8]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1895FEDF8](a1, *(void *)&a2, a3, a4);
}

const mach_header *__cdecl _dyld_get_image_header(uint32_t image_index)
{
  return (const mach_header *)MEMORY[0x1895FEBE8](*(void *)&image_index);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return (const char *)MEMORY[0x1895FEBF0](*(void *)&image_index);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return MEMORY[0x1895FEC08](*(void *)&image_index);
}

uint32_t _dyld_image_count(void)
{
  return MEMORY[0x1895FEC28]();
}

void free(void *a1)
{
}

kern_return_t host_info( host_t host, host_flavor_t flavor, host_info_t host_info_out, mach_msg_type_number_t *host_info_outCnt)
{
  return MEMORY[0x1895FFB58](*(void *)&host, *(void *)&flavor, host_info_out, host_info_outCnt);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1895FFC78]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1895FFCC0](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x189600268](__size);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1895FF2E8](__s1, __s2);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1895FF340](__s1, __s2, __n);
}