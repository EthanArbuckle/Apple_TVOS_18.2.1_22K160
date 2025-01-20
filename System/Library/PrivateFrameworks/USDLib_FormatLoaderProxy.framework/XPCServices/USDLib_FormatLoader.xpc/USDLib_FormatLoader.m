uint64_t PlyConverter::PlyConverter(uint64_t a1, void *a2, __int128 *a3)
{
  __int128 v5;
  *(void *)a1 = 0LL;
  *(void *)(a1 + 8) = 0LL;
  *(void *)(a1 + 16) = 0LL;
  if (*((char *)a3 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)(a1 + 24), *(void **)a3, *((void *)a3 + 1));
  }

  else
  {
    v5 = *a3;
    *(void *)(a1 + 40) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 24) = v5;
  }

  *(_OWORD *)(a1 + 48) = 0u;
  *(void *)(a1 + 160) = 0LL;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_BYTE *)(a1 + 168) = PlyConverter::parsePly((uint64_t *)a1, a2);
  return a1;
}

void sub_100001A7C(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

BOOL PlyConverter::parsePly(uint64_t *a1, void *a2)
{
  v4 = std::locale::use_facet(&v123, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10LL);
  std::locale::~locale(&v123);
  v6 = sub_100005124(a2, &__p, v5);
  if ((*((_BYTE *)v6 + *(void *)(*v6 - 24LL) + 32) & 5) != 0
    || ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0
      ? (p_p = &__p)
      : (p_p = (std::string *)__p.__r_.__value_.__r.__words[0]),
        strncmp("ply", (const char *)p_p, 3uLL)))
  {
    BOOL v8 = 0LL;
    goto LABEL_7;
  }

  memset(&v110, 0, sizeof(v110));
  PlyConverter::parsePlyHeader(a1, &v110, a2);
  v124 = 0LL;
  v122 = 0LL;
  v120 = 0LL;
  if ((v110.__r_.__value_.__s.__size_ & 0x80) == 0)
  {
    if (v110.__r_.__value_.__s.__size_ != 5)
    {
      if (v110.__r_.__value_.__s.__size_ != 17)
      {
        if (v110.__r_.__value_.__s.__size_ != 20)
        {
          BOOL v8 = 0LL;
          goto LABEL_58;
        }

        if (v110.__r_.__value_.__r.__words[0] != 0x6C5F7972616E6962LL
          || v110.__r_.__value_.__l.__size_ != 0x6E655F656C747469LL
          || LODWORD(v110.__r_.__value_.__r.__words[2]) != 1851877732)
        {
LABEL_52:
          BOOL v8 = 0LL;
          goto LABEL_53;
        }

        goto LABEL_71;
      }

      v12 = &v110;
LABEL_39:
      std::string::size_type v17 = v12->__r_.__value_.__r.__words[0];
      std::string::size_type size = v12->__r_.__value_.__l.__size_;
      int v19 = v12->__r_.__value_.__s.__data_[16];
      if (v17 != 0x625F7972616E6962LL || size != 0x6169646E655F6769LL || v19 != 110) {
        goto LABEL_52;
      }
      sub_100003E60(&v123, (uint64_t)sub_100004258);
      sub_100003F90(v121, (uint64_t)sub_100004340);
      v22 = sub_100004444;
      goto LABEL_73;
    }

    if (LODWORD(v110.__r_.__value_.__l.__data_) != 1768125281 || v110.__r_.__value_.__s.__data_[4] != 105) {
      goto LABEL_52;
    }
LABEL_72:
    sub_100003E60(&v123, (uint64_t)sub_100003DDC);
    sub_100003F90(v121, (uint64_t)sub_100003F04);
    v22 = sub_100004034;
    goto LABEL_73;
  }

  std::string::size_type v13 = v110.__r_.__value_.__l.__size_;
  if (v110.__r_.__value_.__l.__size_ == 5
    && *(_DWORD *)v110.__r_.__value_.__l.__data_ == 1768125281
    && *(_BYTE *)(v110.__r_.__value_.__r.__words[0] + 4) == 105)
  {
    goto LABEL_72;
  }

  if (v110.__r_.__value_.__l.__size_ != 20)
  {
LABEL_37:
    if (v13 != 17) {
      goto LABEL_52;
    }
    v12 = (std::string *)v110.__r_.__value_.__r.__words[0];
    goto LABEL_39;
  }

  if (*(void *)v110.__r_.__value_.__l.__data_ != 0x6C5F7972616E6962LL
    || *(void *)(v110.__r_.__value_.__r.__words[0] + 8) != 0x6E655F656C747469LL
    || *(_DWORD *)(v110.__r_.__value_.__r.__words[0] + 16) != 1851877732)
  {
    std::string::size_type v13 = v110.__r_.__value_.__l.__size_;
    goto LABEL_37;
  }

LABEL_71:
  sub_100003E60(&v123, (uint64_t)sub_100004064);
  sub_100003F90(v121, (uint64_t)sub_100004138);
  v22 = sub_100004228;
LABEL_73:
  sub_100003F90(v119, (uint64_t)v22);
  uint64_t v31 = *a1;
  uint64_t v30 = a1[1];
  if (*a1 == v30)
  {
    BOOL v8 = 1LL;
    goto LABEL_53;
  }

  v103 = (void **)(a1 + 15);
  v101 = a1 + 6;
  v102 = (void **)(a1 + 18);
  v100 = a1 + 9;
  v99 = a1 + 12;
  do
  {
    unint64_t v32 = *(void *)(v31 + 48);
    BOOL v8 = v32 >> 28 == 0;
    if (v32 >> 28) {
      break;
    }
    uint64_t v33 = v31 + 24;
    if (*(char *)(v31 + 47) < 0)
    {
      uint64_t v36 = *(void *)(v31 + 32);
      if (v36 != 4)
      {
        if (v36 == 6 && **(_DWORD **)v33 == 1953654134 && *(_WORD *)(*(void *)v33 + 4LL) == 30821)
        {
LABEL_171:
          v78 = *(int **)v31;
          v79 = *(int **)(v31 + 8);
          if (*(int **)v31 == v79)
          {
            char v81 = 0;
            char v80 = 0;
          }

          else
          {
            char v80 = 0;
            char v81 = 0;
            do
            {
              int v82 = *v78;
              v78 += 3;
              v80 |= v82 == 3;
              v81 |= v82 == 6;
            }

            while (v78 != v79);
          }

          uint64_t v98 = v30;
          sub_100004474(v101, v32);
          if ((v80 & 1) != 0) {
            sub_100004474(v100, *(void *)(v31 + 48));
          }
          if ((v81 & 1) != 0) {
            sub_100004474(v99, *(void *)(v31 + 48));
          }
          uint64_t v108 = 0LL;
          float v109 = 0.0;
          uint64_t v106 = 0x3F80000000000000LL;
          float v107 = 0.0;
          uint64_t v104 = 0LL;
          float v105 = 0.0;
          if (*(void *)(v31 + 48))
          {
            unint64_t v83 = 0LL;
            do
            {
              v85 = *(int **)v31;
              v84 = *(int **)(v31 + 8);
              while (v85 != v84)
              {
                switch(*v85)
                {
                  case 0:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    LODWORD(v108) = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 1:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    HIDWORD(v108) = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 2:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    float v109 = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 3:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    LODWORD(v106) = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 4:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    HIDWORD(v106) = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 5:
                    int v112 = v85[1];
                    if (!v122) {
                      goto LABEL_234;
                    }
                    float v107 = (*(float (**)(void *, void *, int *))(*v122 + 48LL))(v122, a2, &v112);
                    goto LABEL_214;
                  case 6:
                    int v112 = v85[1];
                    if (!v120) {
                      goto LABEL_234;
                    }
                    LODWORD(v104) = (*(float (**)(void *, void *, int *))(*v120 + 48LL))(v120, a2, &v112);
                    goto LABEL_214;
                  case 7:
                    int v112 = v85[1];
                    if (!v120) {
                      goto LABEL_234;
                    }
                    HIDWORD(v104) = (*(float (**)(void *, void *, int *))(*v120 + 48LL))(v120, a2, &v112);
                    goto LABEL_214;
                  case 8:
                    int v112 = v85[1];
                    if (!v120) {
LABEL_234:
                    }
                      sub_1000057D4();
                    float v105 = (*(float (**)(void *, void *, int *))(*v120 + 48LL))(v120, a2, &v112);
                    goto LABEL_214;
                  default:
                    uint64_t v86 = (uint64_t)v124;
                    if (!v124) {
                      goto LABEL_206;
                    }
                    if (v124 == &v123)
                    {
                      v118 = v117;
                      uint64_t v86 = (*((uint64_t (**)(std::locale *, _BYTE *))v123.__locale_ + 3))(&v123, v117);
                    }

                    else
                    {
                      uint64_t v86 = (*((uint64_t (**)(void))v124->__locale_ + 2))();
LABEL_206:
                      v118 = (_BYTE *)v86;
                    }

                    char v87 = PlyConverter::skipUnknownProperty(v86, (uint64_t)v85, (uint64_t)a2, (uint64_t)v117);
                    v88 = v118;
                    if (v118 == v117)
                    {
                      v88 = v117;
                      uint64_t v89 = 4LL;
                    }

                    else
                    {
                      if (!v118) {
                        goto LABEL_213;
                      }
                      uint64_t v89 = 5LL;
                    }

                    (*(void (**)(void))(*v88 + 8 * v89))();
LABEL_213:
                    if ((v87 & 1) == 0) {
                      goto LABEL_52;
                    }
LABEL_214:
                    v85 += 3;
                    break;
                }
              }

              unint64_t v90 = a1[7];
              if (v90 >= a1[8])
              {
                uint64_t v91 = sub_100005BCC(v101, (uint64_t)&v108);
              }

              else
              {
                *(void *)unint64_t v90 = v108;
                *(float *)(v90 + 8) = v109;
                uint64_t v91 = v90 + 12;
              }

              a1[7] = v91;
              if ((v80 & 1) != 0)
              {
                unint64_t v92 = a1[10];
                if (v92 >= a1[11])
                {
                  uint64_t v93 = sub_100005BCC(v100, (uint64_t)&v106);
                }

                else
                {
                  *(void *)unint64_t v92 = v106;
                  *(float *)(v92 + 8) = v107;
                  uint64_t v93 = v92 + 12;
                }

                a1[10] = v93;
              }

              if ((v81 & 1) != 0)
              {
                unint64_t v94 = a1[13];
                if (v94 >= a1[14])
                {
                  uint64_t v95 = sub_100005BCC(v99, (uint64_t)&v104);
                }

                else
                {
                  *(void *)unint64_t v94 = v104;
                  *(float *)(v94 + 8) = v105;
                  uint64_t v95 = v94 + 12;
                }

                a1[13] = v95;
              }

              ++v83;
            }

            while (v83 < *(void *)(v31 + 48));
          }

          uint64_t v30 = v98;
          goto LABEL_230;
        }

        goto LABEL_94;
      }

      uint64_t v33 = *(void *)v33;
    }

    else
    {
      int v34 = *(unsigned __int8 *)(v31 + 47);
      if (v34 != 4)
      {
        if (v34 == 6 && *(_DWORD *)v33 == 1953654134 && *(_WORD *)(v31 + 28) == 30821) {
          goto LABEL_171;
        }
        goto LABEL_94;
      }
    }

    if (*(_DWORD *)v33 == 1701011814)
    {
      sub_100004594(v103, 3 * v32);
      sub_100004594(v102, *(void *)(v31 + 48));
      unint64_t v45 = *(void *)(v31 + 48);
      if (!v45) {
        goto LABEL_230;
      }
      uint64_t v46 = 0LL;
      uint64_t v97 = v30;
      while (1)
      {
        uint64_t v96 = v46;
        v48 = *(int **)v31;
        v47 = *(int **)(v31 + 8);
LABEL_169:
        uint64_t v30 = v97;
        uint64_t v46 = v96 + 1;
        if (v96 + 1 >= v45) {
          goto LABEL_230;
        }
      }

      while (1)
      {
        if (*v48 == 9)
        {
          LODWORD(v108) = v48[2];
          if (!v124) {
            sub_1000057D4();
          }
          unsigned int v49 = (int)(*((float (**)(std::locale *, void *, uint64_t *))v124->__locale_ + 6))( v124,  a2,  &v108);
          if (v49 > 0x400) {
            goto LABEL_52;
          }
          if (v49)
          {
            for (int i = 0; i != v49; ++i)
            {
              LODWORD(v108) = v48[1];
              if (!v124) {
                sub_1000057D4();
              }
              int v51 = (int)(*((float (**)(std::locale *, void *, uint64_t *))v124->__locale_ + 6))( v124,  a2,  &v108);
              v53 = (int *)a1[16];
              unint64_t v52 = a1[17];
              if ((unint64_t)v53 >= v52)
              {
                v55 = (int *)*v103;
                uint64_t v56 = ((char *)v53 - (_BYTE *)*v103) >> 2;
                unint64_t v57 = v56 + 1;
                uint64_t v58 = v52 - (void)v55;
                if (v58 >> 1 > v57) {
                  unint64_t v57 = v58 >> 1;
                }
                else {
                  unint64_t v59 = v57;
                }
                if (v59)
                {
                  v60 = (char *)sub_100005D34((uint64_t)(a1 + 17), v59);
                  v55 = (int *)a1[15];
                  v53 = (int *)a1[16];
                }

                else
                {
                  v60 = 0LL;
                }

                v61 = (int *)&v60[4 * v56];
                int *v61 = v51;
                v54 = v61 + 1;
                while (v53 != v55)
                {
                  int v62 = *--v53;
                  *--v61 = v62;
                }

                a1[15] = (uint64_t)v61;
                a1[16] = (uint64_t)v54;
                a1[17] = (uint64_t)&v60[4 * v59];
                if (v55) {
                  operator delete(v55);
                }
              }

              else
              {
                int *v53 = v51;
                v54 = v53 + 1;
              }

              a1[16] = (uint64_t)v54;
            }
          }

          v64 = (unsigned int *)a1[19];
          unint64_t v63 = a1[20];
          if ((unint64_t)v64 >= v63)
          {
            v67 = (unsigned int *)*v102;
            uint64_t v68 = ((char *)v64 - (_BYTE *)*v102) >> 2;
            unint64_t v69 = v68 + 1;
            uint64_t v70 = v63 - (void)v67;
            if (v70 >> 1 > v69) {
              unint64_t v69 = v70 >> 1;
            }
            else {
              unint64_t v71 = v69;
            }
            if (v71)
            {
              v72 = (char *)sub_100005D34((uint64_t)(a1 + 20), v71);
              v67 = (unsigned int *)a1[18];
              v64 = (unsigned int *)a1[19];
            }

            else
            {
              v72 = 0LL;
            }

            v76 = (unsigned int *)&v72[4 * v68];
            unsigned int *v76 = v49;
            v65 = v76 + 1;
            while (v64 != v67)
            {
              unsigned int v77 = *--v64;
              *--v76 = v77;
            }

            a1[18] = (uint64_t)v76;
            a1[19] = (uint64_t)v65;
            a1[20] = (uint64_t)&v72[4 * v71];
            if (v67) {
              operator delete(v67);
            }
          }

          else
          {
            unsigned int *v64 = v49;
            v65 = v64 + 1;
          }

          a1[19] = (uint64_t)v65;
          goto LABEL_167;
        }

        uint64_t v66 = (uint64_t)v124;
        if (!v124) {
          goto LABEL_143;
        }
        if (v124 != &v123) {
          break;
        }
        v116 = v115;
        uint64_t v66 = (*((uint64_t (**)(std::locale *, _BYTE *))v123.__locale_ + 3))(&v123, v115);
LABEL_153:
        char v73 = PlyConverter::skipUnknownProperty(v66, (uint64_t)v48, (uint64_t)a2, (uint64_t)v115);
        v74 = v116;
        if (v116 == v115)
        {
          v74 = v115;
          uint64_t v75 = 4LL;
        }

        else
        {
          if (!v116) {
            goto LABEL_158;
          }
          uint64_t v75 = 5LL;
        }

        (*(void (**)(void))(*v74 + 8 * v75))();
LABEL_158:
        if ((v73 & 1) == 0) {
          goto LABEL_52;
        }
LABEL_167:
        v48 += 3;
        if (v48 == v47)
        {
          unint64_t v45 = *(void *)(v31 + 48);
          goto LABEL_169;
        }
      }

      uint64_t v66 = (*((uint64_t (**)(void))v124->__locale_ + 2))();
LABEL_143:
      v116 = (_BYTE *)v66;
      goto LABEL_153;
    }

LABEL_94:
    if (!v32) {
      goto LABEL_230;
    }
    for (unint64_t j = 0LL; j < v32; ++j)
    {
      uint64_t v40 = *(void *)v31;
      uint64_t v39 = *(void *)(v31 + 8);
      if (*(void *)v31 == v39) {
        continue;
      }
      do
      {
        uint64_t v41 = (uint64_t)v124;
        if (!v124) {
          goto LABEL_100;
        }
        if (v124 != &v123)
        {
          uint64_t v41 = (*((uint64_t (**)(void))v124->__locale_ + 2))();
LABEL_100:
          v114 = (_BYTE *)v41;
          goto LABEL_102;
        }

        v114 = v113;
        uint64_t v41 = (*((uint64_t (**)(std::locale *, _BYTE *))v123.__locale_ + 3))(&v123, v113);
LABEL_102:
        char v42 = PlyConverter::skipUnknownProperty(v41, v40, (uint64_t)a2, (uint64_t)v113);
        v43 = v114;
        if (v114 == v113)
        {
          v43 = v113;
          uint64_t v44 = 4LL;
        }

        else
        {
          if (!v114) {
            goto LABEL_107;
          }
          uint64_t v44 = 5LL;
        }

        (*(void (**)(void))(*v43 + 8 * v44))();
LABEL_107:
        if ((v42 & 1) == 0) {
          goto LABEL_52;
        }
        v40 += 12LL;
      }

      while (v40 != v39);
      unint64_t v32 = *(void *)(v31 + 48);
    }

LABEL_230:
    v31 += 56LL;
  }

  while (v31 != v30);
LABEL_53:
  v24 = v120;
  if (v120 == v119)
  {
    uint64_t v25 = 4LL;
    v24 = v119;
LABEL_57:
    (*(void (**)(void))(*v24 + 8 * v25))();
  }

  else if (v120)
  {
    uint64_t v25 = 5LL;
    goto LABEL_57;
  }

LABEL_58:
  v26 = v122;
  if (v122 == v121)
  {
    uint64_t v27 = 4LL;
    v26 = v121;
LABEL_62:
    (*(void (**)(void))(*v26 + 8 * v27))();
  }

  else if (v122)
  {
    uint64_t v27 = 5LL;
    goto LABEL_62;
  }

  v28 = v124;
  if (v124 == &v123)
  {
    uint64_t v29 = 4LL;
    v28 = &v123;
LABEL_67:
    (*((void (**)(void))v28->__locale_ + v29))();
  }

  else if (v124)
  {
    uint64_t v29 = 5LL;
    goto LABEL_67;
  }

LABEL_7:
  return v8;
}

void sub_100002734( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, void *__p, uint64_t a25, int a26, __int16 a27, char a28, char a29, void *a30, uint64_t a31, int a32, __int16 a33, char a34, char a35, uint64_t a36, char a37, uint64_t a38, uint64_t a39, uint64_t a40, char a41, uint64_t a42, uint64_t a43, uint64_t a44, char a45, uint64_t a46, uint64_t a47, uint64_t a48)
{
  v50 = *(void **)(v48 - 184);
  if (v50 == (void *)(v48 - 208))
  {
    uint64_t v51 = 4LL;
    v50 = (void *)(v48 - 208);
  }

  else
  {
    if (!v50) {
      goto LABEL_6;
    }
    uint64_t v51 = 5LL;
  }

  (*(void (**)(void))(*v50 + 8 * v51))();
LABEL_6:
  unint64_t v52 = *(void **)(v48 - 152);
  if (v52 == (void *)(v48 - 176))
  {
    uint64_t v53 = 4LL;
    unint64_t v52 = (void *)(v48 - 176);
  }

  else
  {
    if (!v52) {
      goto LABEL_11;
    }
    uint64_t v53 = 5LL;
  }

  (*(void (**)(void))(*v52 + 8 * v53))();
LABEL_11:
  v54 = *(void **)(v48 - 120);
  if (v54 == (void *)(v48 - 144))
  {
    uint64_t v55 = 4LL;
    v54 = (void *)(v48 - 144);
  }

  else
  {
    if (!v54) {
      goto LABEL_16;
    }
    uint64_t v55 = 5LL;
  }

  (*(void (**)(void))(*v54 + 8 * v55))();
LABEL_16:
  if (a29 < 0) {
    operator delete(__p);
  }
  if (a35 < 0) {
    operator delete(a30);
  }
  _Unwind_Resume(exception_object);
}

void PlyConverter::parsePlyHeader(uint64_t *a1, std::string *a2, void *a3)
{
  if (!sub_100003370(a3, &__str)) {
    goto LABEL_16;
  }
  sub_10000354C((uint64_t)v72);
  std::string::operator=(&v74, &__str);
  sub_1000053F8((uint64_t)v73);
  memset(&__p, 0, sizeof(__p));
  sub_100003638(v72, &__p);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    if (__p.__r_.__value_.__l.__size_ != 6) {
      goto LABEL_12;
    }
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (__p.__r_.__value_.__s.__size_ != 6) {
      goto LABEL_13;
    }
    p_p = &__p;
  }

  int data = (int)p_p->__r_.__value_.__l.__data_;
  int v8 = WORD2(p_p->__r_.__value_.__r.__words[0]);
  if (data != 1836216166 || v8 != 29793)
  {
    if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
      goto LABEL_12;
    }
    goto LABEL_13;
  }

  sub_100003638(v72, a2);
  while (sub_100003370(a3, &__str))
  {
    std::string::size_type size = __str.__r_.__value_.__s.__size_;
    if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v72 + *(void *)(v72[0] - 24)), 0);
      std::string::operator=(&v74, &__str);
      sub_1000053F8((uint64_t)v73);
      memset(&v70, 0, sizeof(v70));
      sub_100003638(v72, &v70);
      unsigned __int8 v11 = v70.__r_.__value_.__s.__size_;
      if ((char)v70.__r_.__value_.__s.__size_ < 0)
      {
        std::string::size_type v13 = v70.__r_.__value_.__l.__size_;
        if (v70.__r_.__value_.__l.__size_ == 7)
        {
          if (*(_DWORD *)v70.__r_.__value_.__l.__data_ == 1835363429
            && *(_DWORD *)(v70.__r_.__value_.__r.__words[0] + 3) == 1953391981)
          {
            goto LABEL_56;
          }

          std::string::size_type v13 = v70.__r_.__value_.__l.__size_;
LABEL_38:
          if (v13 != 10) {
            goto LABEL_173;
          }
          v12 = (std::string *)v70.__r_.__value_.__r.__words[0];
LABEL_40:
          std::string::size_type v15 = v12->__r_.__value_.__r.__words[0];
          int v16 = LOWORD(v12->__r_.__value_.__r.__words[1]);
          if (v15 != 0x646165685F646E65LL || v16 != 29285) {
            goto LABEL_173;
          }
          char v18 = 1;
          goto LABEL_174;
        }

        if (v70.__r_.__value_.__l.__size_ != 8 || *(void *)v70.__r_.__value_.__l.__data_ != 0x79747265706F7270LL) {
          goto LABEL_38;
        }
      }

      else
      {
        if (v70.__r_.__value_.__s.__size_ == 7)
        {
          if (LODWORD(v70.__r_.__value_.__l.__data_) == 1835363429
            && *(_DWORD *)((char *)v70.__r_.__value_.__r.__words + 3) == 1953391981)
          {
LABEL_56:
            memset(&v69, 0, sizeof(v69));
            sub_100003638(v72, &v69);
            std::istream::operator>>(v72, &v68);
            sub_100004E70(&v64, (__int128 *)&v69, v68);
            unint64_t v21 = a1[1];
            unint64_t v22 = a1[2];
            if (v21 >= v22)
            {
              uint64_t v24 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v21 - *a1) >> 3);
              unint64_t v25 = v24 + 1;
              unint64_t v26 = 0x6DB6DB6DB6DB6DB7LL * ((uint64_t)(v22 - *a1) >> 3);
              if (2 * v26 > v25) {
                unint64_t v25 = 2 * v26;
              }
              if (v26 >= 0x249249249249249LL) {
                unint64_t v27 = 0x492492492492492LL;
              }
              else {
                unint64_t v27 = v25;
              }
              v79 = a1 + 2;
              v28 = (char *)sub_1000055D4((uint64_t)(a1 + 2), v27);
              std::string::size_type v29 = (std::string::size_type)&v28[56 * v24];
              v77.__r_.__value_.__r.__words[0] = (std::string::size_type)v28;
              v77.__r_.__value_.__l.__size_ = v29;
              v78 = &v28[56 * v30];
              *(void *)std::string::size_type v29 = 0LL;
              *(void *)(v29 + 8) = 0LL;
              *(void *)(v29 + 16) = 0LL;
              *(std::string *)std::string::size_type v29 = v64;
              memset(&v64, 0, sizeof(v64));
              __int128 v31 = v65;
              *(void *)(v29 + 40) = v66;
              *(_OWORD *)(v29 + 24) = v31;
              uint64_t v66 = 0LL;
              __int128 v65 = 0uLL;
              *(void *)(v29 + 48) = v67;
              v77.__r_.__value_.__l.__cap_ = v29 + 56;
              sub_100005560(a1, &v77);
              uint64_t v32 = a1[1];
              sub_100005760((void **)&v77.__r_.__value_.__l.__data_);
              int v33 = SHIBYTE(v66);
              a1[1] = v32;
              if (v33 < 0) {
                operator delete((void *)v65);
              }
            }

            else
            {
              *(void *)unint64_t v21 = 0LL;
              *(void *)(v21 + 8) = 0LL;
              *(void *)(v21 + 16) = 0LL;
              *(std::string *)unint64_t v21 = v64;
              memset(&v64, 0, sizeof(v64));
              uint64_t v23 = v66;
              *(_OWORD *)(v21 + 24) = v65;
              *(void *)(v21 + 40) = v23;
              uint64_t v66 = 0LL;
              __int128 v65 = 0uLL;
              *(void *)(v21 + 48) = v67;
              a1[1] = v21 + 56;
            }

            if (v64.__r_.__value_.__r.__words[0])
            {
              v64.__r_.__value_.__l.__size_ = v64.__r_.__value_.__r.__words[0];
              operator delete(v64.__r_.__value_.__l.__data_);
            }

            if ((char)v69.__r_.__value_.__s.__size_ < 0)
            {
              int v34 = (void *)v69.__r_.__value_.__r.__words[0];
              goto LABEL_172;
            }
          }

LABEL_173:
          char v18 = 0;
          unsigned __int8 v11 = v70.__r_.__value_.__s.__size_;
          goto LABEL_174;
        }

        if (v70.__r_.__value_.__s.__size_ != 8)
        {
          if (v70.__r_.__value_.__s.__size_ != 10) {
            goto LABEL_173;
          }
          v12 = &v70;
          goto LABEL_40;
        }

        if (v70.__r_.__value_.__r.__words[0] != 0x79747265706F7270LL) {
          goto LABEL_173;
        }
      }

      if (a1[1] != *a1)
      {
        memset(&v64, 0, sizeof(v64));
        sub_100003638(v72, &v64);
        if (((char)v64.__r_.__value_.__s.__size_ & 0x80000000) == 0)
        {
          if (v64.__r_.__value_.__s.__size_ == 4)
          {
            int v19 = &v64;
            goto LABEL_73;
          }

          goto LABEL_74;
        }

        if (v64.__r_.__value_.__l.__size_ != 4) {
          goto LABEL_74;
        }
        int v19 = (std::string *)v64.__r_.__value_.__r.__words[0];
LABEL_73:
        if (LODWORD(v19->__r_.__value_.__l.__data_) == 1953720684)
        {
          sub_100003638(v72, &v64);
          int v35 = sub_1000038F4(&v64);
          sub_100003638(v72, &v64);
        }

        else
        {
LABEL_74:
          int v35 = 8;
        }

        memset(&v77, 0, sizeof(v77));
        sub_100003638(v72, &v77);
        if ((char)v77.__r_.__value_.__s.__size_ < 0)
        {
          std::string::size_type v39 = v77.__r_.__value_.__l.__size_;
          if (v77.__r_.__value_.__l.__size_ == 1)
          {
            unsigned int v38 = *v77.__r_.__value_.__l.__data_ - 120;
            if (v38 >= 3) {
              LOBYTE(v38) = 10;
            }
LABEL_114:
            int v36 = v38;
          }

          else
          {
            if (v77.__r_.__value_.__l.__size_ != 2) {
              goto LABEL_81;
            }
            if (*(_WORD *)v77.__r_.__value_.__l.__data_ == 30830)
            {
LABEL_139:
              int v36 = 3;
              goto LABEL_152;
            }

            if (*(_WORD *)v77.__r_.__value_.__l.__data_ == 31086)
            {
LABEL_143:
              int v36 = 4;
              goto LABEL_152;
            }

            int v36 = *(_WORD *)v77.__r_.__value_.__l.__data_ == 31342 ? 5 : 10;
            if (*(_WORD *)v77.__r_.__value_.__l.__data_ != 31342)
            {
LABEL_81:
              if (v77.__r_.__value_.__l.__size_ == 3)
              {
                if (*(_WORD *)v77.__r_.__value_.__l.__data_ == 25970
                  && *(_BYTE *)(v77.__r_.__value_.__r.__words[0] + 2) == 100)
                {
                  int v36 = 6;
                  goto LABEL_152;
                }

                std::string::size_type v39 = v77.__r_.__value_.__l.__size_;
              }

              if (v39 == 5)
              {
                if (*(_DWORD *)v77.__r_.__value_.__l.__data_ == 1701147239
                  && *(_BYTE *)(v77.__r_.__value_.__r.__words[0] + 4) == 110)
                {
LABEL_140:
                  int v36 = 7;
                  goto LABEL_152;
                }

                std::string::size_type v39 = v77.__r_.__value_.__l.__size_;
              }

              if (v39 == 4)
              {
                if (*(_DWORD *)v77.__r_.__value_.__l.__data_ == 1702194274)
                {
                  int v36 = 8;
                  goto LABEL_152;
                }

                std::string::size_type v39 = v77.__r_.__value_.__l.__size_;
              }

              if (v39 == 14)
              {
                if (*(void *)v77.__r_.__value_.__l.__data_ == 0x695F786574726576LL
                  && *(void *)(v77.__r_.__value_.__r.__words[0] + 6) == 0x73656369646E695FLL)
                {
LABEL_141:
                  int v36 = 9;
                  goto LABEL_152;
                }

                std::string::size_type v39 = v77.__r_.__value_.__l.__size_;
              }

              if (v39 == 12)
              {
                v37 = (std::string *)v77.__r_.__value_.__r.__words[0];
                goto LABEL_125;
              }

              int v36 = 10;
            }
          }
        }

        else
        {
          int v36 = 10;
          v37 = &v77;
          switch(v77.__r_.__value_.__s.__size_)
          {
            case 1u:
              unsigned int v38 = v77.__r_.__value_.__s.__data_[0] - 120;
              if (v38 < 3) {
                goto LABEL_114;
              }
              goto LABEL_152;
            case 2u:
              switch(LOWORD(v77.__r_.__value_.__l.__data_))
              {
                case 0x786Eu:
                  goto LABEL_139;
                case 0x796Eu:
                  goto LABEL_143;
                case 0x7A6Eu:
                  int v36 = 5;
                  break;
              }

              goto LABEL_152;
            case 3u:
              else {
                int v36 = 6;
              }
              goto LABEL_152;
            case 4u:
              goto LABEL_136;
            case 5u:
              if (LODWORD(v77.__r_.__value_.__l.__data_) == 1701147239 && v77.__r_.__value_.__s.__data_[4] == 110) {
                goto LABEL_140;
              }
              if (v77.__r_.__value_.__s.__size_ == 4)
              {
LABEL_136:
                if (LODWORD(v77.__r_.__value_.__l.__data_) == 1702194274) {
                  int v36 = 8;
                }
                else {
                  int v36 = 10;
                }
              }

              goto LABEL_152;
            case 0xCu:
              break;
            case 0xEu:
              if (v77.__r_.__value_.__r.__words[0] == 0x695F786574726576LL
                && *(std::string::size_type *)((char *)v77.__r_.__value_.__r.__words + 6) == 0x73656369646E695FLL)
              {
                goto LABEL_141;
              }

              if (v77.__r_.__value_.__s.__size_ != 12) {
                goto LABEL_152;
              }
              v37 = &v77;
              break;
            default:
              goto LABEL_152;
          }

LABEL_125:
          unint64_t v44 = 0x7665727465785F69LL;
          unint64_t v45 = bswap64(v37->__r_.__value_.__r.__words[0]);
          if (v45 == 0x7665727465785F69LL)
          {
            unint64_t v45 = bswap32(v37->__r_.__value_.__r.__words[1]);
            if ((_DWORD)v45 == 1852073336)
            {
              int v46 = 0;
              goto LABEL_149;
            }

            unint64_t v44 = 1852073336LL;
          }

          if (v45 < v44) {
            int v46 = -1;
          }
          else {
            int v46 = 1;
          }
LABEL_149:
          if (v46) {
            int v36 = 10;
          }
          else {
            int v36 = 9;
          }
        }

LABEL_152:
        uint64_t v48 = a1[1] - 56;
        int v49 = sub_1000038F4(&v64);
        int v50 = v49;
        unint64_t v51 = *(void *)(v48 + 16);
        unint64_t v52 = *(int **)(v48 + 8);
        if ((unint64_t)v52 >= v51)
        {
          v54 = *(int **)v48;
          unint64_t v55 = 0xAAAAAAAAAAAAAAABLL * (((uint64_t)v52 - *(void *)v48) >> 2);
          unint64_t v56 = v55 + 1;
          if (v55 + 1 > 0x1555555555555555LL) {
            sub_100005508();
          }
          unint64_t v57 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v51 - (void)v54) >> 2);
          if (2 * v57 > v56) {
            unint64_t v56 = 2 * v57;
          }
          if (v57 >= 0xAAAAAAAAAAAAAAALL) {
            unint64_t v58 = 0x1555555555555555LL;
          }
          else {
            unint64_t v58 = v56;
          }
          if (v58)
          {
            unint64_t v59 = (char *)sub_10000551C(v48 + 16, v58);
            v54 = *(int **)v48;
            unint64_t v52 = *(int **)(v48 + 8);
          }

          else
          {
            unint64_t v59 = 0LL;
          }

          v60 = (int *)&v59[12 * v55];
          int *v60 = v36;
          v60[1] = v50;
          v60[2] = v35;
          v61 = v60;
          if (v52 != v54)
          {
            do
            {
              uint64_t v62 = *(void *)(v52 - 3);
              v52 -= 3;
              int v63 = v52[2];
              *(void *)(v61 - 3) = v62;
              v61 -= 3;
              v61[2] = v63;
            }

            while (v52 != v54);
            v54 = *(int **)v48;
          }

          uint64_t v53 = v60 + 3;
          *(void *)uint64_t v48 = v61;
          *(void *)(v48 + 8) = v60 + 3;
          *(void *)(v48 + 16) = &v59[12 * v58];
          if (v54) {
            operator delete(v54);
          }
        }

        else
        {
          *unint64_t v52 = v36;
          v52[1] = v49;
          uint64_t v53 = v52 + 3;
          v52[2] = v35;
        }

        *(void *)(v48 + 8) = v53;
        if ((char)v64.__r_.__value_.__s.__size_ < 0)
        {
          int v34 = (void *)v64.__r_.__value_.__r.__words[0];
LABEL_172:
          operator delete(v34);
        }

        goto LABEL_173;
      }

      char v18 = 0;
LABEL_174:
      if ((v11 & 0x80) != 0)
      {
        operator delete(v70.__r_.__value_.__l.__data_);
        if ((v18 & 1) != 0) {
          break;
        }
      }

      else if ((v18 & 1) != 0)
      {
        break;
      }
    }
  }

  if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
LABEL_12:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_13:
  std::streambuf::~streambuf(v73);
  std::ios::~ios(&v75);
LABEL_16:
}

void sub_100003290( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20, uint64_t a21, uint64_t a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33, void *a34, uint64_t a35, int a36, __int16 a37, char a38, char a39, char a40)
{
  if (a16 < 0) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  sub_100003C84((uint64_t)&a40);
  _Unwind_Resume(a1);
}

BOOL sub_100003370(void *a1, std::string *a2)
{
  v4 = std::locale::use_facet(&v28, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10LL);
  std::locale::~locale(&v28);
  v6 = sub_100005124(a1, a2, v5);
  int v7 = *(_DWORD *)((_BYTE *)v6 + *(void *)(*v6 - 24LL) + 32) & 5;
  if (!v7)
  {
    uint64_t size = a2->__r_.__value_.__s.__size_;
    int v9 = (char)size;
    v10 = (char *)a2 + size;
    if (v9 >= 0) {
      std::string::size_type v11 = (std::string::size_type)v10;
    }
    else {
      std::string::size_type v11 = a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_;
    }
    if (v9 >= 0) {
      v12 = a2;
    }
    else {
      v12 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }
    while ((std::string *)v11 != v12)
    {
      __darwin_ct_rune_t v14 = *(char *)--v11;
      __darwin_ct_rune_t v13 = v14;
      if (v14 < 0)
      {
        if (!__maskrune(v13, 0x4000uLL))
        {
LABEL_13:
          v12 = (std::string *)(v11 + 1);
          break;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v13] & 0x4000) == 0)
      {
        goto LABEL_13;
      }
    }

    uint64_t v15 = a2->__r_.__value_.__s.__size_;
    int v16 = (char)v15;
    std::string::size_type v17 = (char *)a2 + v15;
    if (v16 >= 0)
    {
      char v18 = a2;
    }

    else
    {
      std::string::size_type v17 = (char *)(a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_);
      char v18 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }

    std::string::erase(a2, (char *)v12 - (char *)v18, v17 - (char *)v12);
    int v19 = (char)a2->__r_.__value_.__s.__size_;
    std::string::size_type v20 = a2->__r_.__value_.__r.__words[0];
    if (v19 >= 0) {
      std::string::size_type v21 = (std::string::size_type)a2;
    }
    else {
      std::string::size_type v21 = a2->__r_.__value_.__r.__words[0];
    }
    if (v19 >= 0) {
      std::string::size_type v22 = a2->__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type v22 = a2->__r_.__value_.__l.__size_;
    }
    if (v22)
    {
      uint64_t v23 = (char *)(v21 + v22);
      uint64_t v24 = (char *)v21;
      do
      {
        __darwin_ct_rune_t v25 = *v24;
        if (v25 < 0)
        {
          if (!__maskrune(v25, 0x4000uLL)) {
            goto LABEL_31;
          }
        }

        else if ((_DefaultRuneLocale.__runetype[v25] & 0x4000) == 0)
        {
          goto LABEL_31;
        }

        ++v24;
        --v22;
      }

      while (v22);
      uint64_t v24 = v23;
LABEL_31:
      LOBYTE(v19) = a2->__r_.__value_.__s.__size_;
      std::string::size_type v20 = a2->__r_.__value_.__r.__words[0];
    }

    else
    {
      uint64_t v24 = (char *)v21;
    }

    if ((v19 & 0x80u) == 0) {
      unint64_t v26 = a2;
    }
    else {
      unint64_t v26 = (std::string *)v20;
    }
    std::string::erase(a2, v21 - (void)v26, (std::string::size_type)&v24[-v21]);
  }

  return v7 == 0;
}

void sub_100003538( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
}

uint64_t sub_10000354C(uint64_t a1)
{
  uint64_t v2 = a1 + 16;
  *(void *)a1 = v3;
  *(void *)(a1 + *(void *)(v3 - 24)) = v4;
  *(void *)(a1 + 8) = 0LL;
  unsigned __int8 v5 = (std::ios_base *)(a1 + *(void *)(*(void *)a1 - 24LL));
  std::ios_base::init(v5, (void *)(a1 + 16));
  v5[1].__vftable = 0LL;
  v5[1].__fmtflags_ = -1;
  std::streambuf::basic_streambuf(v2);
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 8;
  return a1;
}

void sub_100003610(_Unwind_Exception *a1)
{
}

uint64_t *sub_100003638(uint64_t *a1, std::string *a2)
{
  if (!v20) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v4 = *(void *)(*a1 - 24);
  uint64_t v5 = *(uint64_t *)((char *)a1 + v4 + 24);
  if (v5 <= 1) {
    uint64_t v6 = 1LL;
  }
  else {
    uint64_t v6 = *(uint64_t *)((char *)a1 + v4 + 24);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a1 + v4));
  int v7 = std::locale::use_facet(&v19, &std::ctype<char>::id);
  std::locale::~locale(&v19);
  uint64_t v8 = 0LL;
  int v9 = a1 + 5;
  if (v5 >= 1) {
    uint64_t v10 = v6;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFF7LL;
  }
  while (1)
  {
    std::string::size_type v11 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    v12 = (_BYTE *)v11[3];
    if (v12 == (_BYTE *)v11[4]) {
      break;
    }
    LOBYTE(v13) = *v12;
LABEL_14:
    if ((v13 & 0x80) == 0 && (*((_DWORD *)&v7[1].~facet + v13) & 0x4000) != 0)
    {
      int v16 = 0;
      goto LABEL_23;
    }

    std::string::push_back(a2, v13);
    __darwin_ct_rune_t v14 = *(void **)((char *)v9 + *(void *)(*a1 - 24));
    uint64_t v15 = v14[3];
    if (v15 == v14[4]) {
      (*(void (**)(void *))(*v14 + 80LL))(v14);
    }
    else {
      v14[3] = v15 + 1;
    }
    if (v10 == ++v8)
    {
      int v16 = 0;
      uint64_t v17 = *a1;
      *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
      goto LABEL_25;
    }
  }

  int v13 = (*(uint64_t (**)(void *))(*v11 + 72LL))(v11);
  if (v13 != -1) {
    goto LABEL_14;
  }
  int v16 = 2;
LABEL_23:
  uint64_t v17 = *a1;
  *(uint64_t *)((char *)a1 + *(void *)(*a1 - 24) + 24) = 0LL;
  if (!v8) {
    v16 |= 4u;
  }
LABEL_25:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(v17 - 24)),  *(_DWORD *)((char *)a1 + *(void *)(v17 - 24) + 32) | v16);
  return a1;
}

void sub_1000037EC( void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, std::locale a9)
{
  uint64_t v11 = *v9;
  *(_DWORD *)((char *)v9 + *(void *)(*v9 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v9 + *(void *)(v11 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x1000037B8LL);
  }

  __cxa_rethrow();
}

void sub_100003850(_Unwind_Exception *a1)
{
}

BOOL sub_100003864(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (*((char *)a1 + 23) < 0)
  {
    if (v4 == a1[1])
    {
      if (v4 == -1LL) {
        goto LABEL_10;
      }
      a1 = (void *)*a1;
      return memcmp(a1, __s, v4) == 0;
    }
  }

  else if (v4 == *((unsigned __int8 *)a1 + 23))
  {
    if (v4 == -1LL) {
LABEL_10:
    }
      sub_1000052A8();
    return memcmp(a1, __s, v4) == 0;
  }

  return 0LL;
}

uint64_t sub_1000038F4(void *a1)
{
  int v2 = *((unsigned __int8 *)a1 + 23);
  if ((*((char *)a1 + 23) & 0x80000000) == 0)
  {
    switch(*((_BYTE *)a1 + 23))
    {
      case 3:
        goto LABEL_3;
      case 4:
        int v7 = a1;
        if (*(_DWORD *)a1 == 1918986339) {
          return 0LL;
        }
        goto LABEL_61;
      case 5:
        if (*(_DWORD *)a1 == 1634231157 && *((_BYTE *)a1 + 4) == 114) {
          return 1LL;
        }
        if (v2 == 3) {
          goto LABEL_3;
        }
        int v7 = a1;
        if (v2 == 4) {
          goto LABEL_61;
        }
        if (v2 != 5) {
          goto LABEL_62;
        }
        if (*(_DWORD *)a1 != 1919903859 || *((_BYTE *)a1 + 4) != 116) {
          goto LABEL_62;
        }
        return 2LL;
      case 6:
        if (*(_DWORD *)a1 == 1869116277 && *((_WORD *)a1 + 2) == 29810) {
          return 3LL;
        }
        int v7 = a1;
        if (v2 == 4) {
          goto LABEL_61;
        }
        if (v2 != 3) {
          goto LABEL_62;
        }
        goto LABEL_3;
      default:
        goto LABEL_62;
    }
  }

  uint64_t v4 = a1[1];
  if (v4 == 4 && *(_DWORD *)*a1 == 1918986339) {
    return 0LL;
  }
  if (v4 == 5)
  {
    if (*(_DWORD *)*a1 == 1634231157 && *(_BYTE *)(*a1 + 4LL) == 114) {
      return 1LL;
    }
    uint64_t v4 = a1[1];
    if (v4 == 5)
    {
      if (*(_DWORD *)*a1 == 1919903859 && *(_BYTE *)(*a1 + 4LL) == 116) {
        return 2LL;
      }
      if ((v2 & 0x80) == 0)
      {
        if (v2 != 3)
        {
          int v7 = a1;
          if (v2 != 4) {
            goto LABEL_62;
          }
          goto LABEL_61;
        }

LABEL_3:
        if (*(_WORD *)a1 != 28265 || *((_BYTE *)a1 + 2) != 116)
        {
          if ((v2 & 0x80) == 0) {
            goto LABEL_62;
          }
          goto LABEL_36;
        }

        return 4LL;
      }
    }
  }

  if (v4 == 6)
  {
    if (*(_DWORD *)*a1 == 1869116277 && *(_WORD *)(*a1 + 4LL) == 29810) {
      return 3LL;
    }
    uint64_t v4 = a1[1];
  }

  if (v4 != 3) {
    goto LABEL_37;
  }
  if (*(_WORD *)*a1 == 28265 && *(_BYTE *)(*a1 + 2LL) == 116) {
    return 4LL;
  }
LABEL_36:
  uint64_t v4 = a1[1];
LABEL_37:
  if (v4 != 4) {
    goto LABEL_62;
  }
  int v7 = (_DWORD *)*a1;
LABEL_61:
  if (*v7 == 1953393013) {
    return 5LL;
  }
LABEL_62:
  else {
    return 8LL;
  }
}

uint64_t sub_100003C44(uint64_t a1)
{
  int v2 = *(void **)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + std::istream::~istream(v2, v3 + 8) = v2;
    operator delete(v2);
  }

  return a1;
}

uint64_t sub_100003C84(uint64_t a1)
{
  uint64_t v3 = a1 + 16;
  std::streambuf::~streambuf(v3);
  std::ios::~ios(a1 + 120);
  return a1;
}

uint64_t PlyConverter::skipUnknownProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a2 + 8) == 8)
  {
    int v14 = *(_DWORD *)(a2 + 4);
    uint64_t v7 = *(void *)(a4 + 24);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, int *))(*(void *)v7 + 48LL))(v7, a3, &v14);
      return 1LL;
    }

LABEL_11:
    sub_1000057D4();
  }

  int v12 = *(_DWORD *)(a2 + 8);
  uint64_t v8 = *(void *)(a4 + 24);
  if (!v8) {
    goto LABEL_11;
  }
  unsigned int v9 = (int)(*(float (**)(uint64_t, uint64_t, int *))(*(void *)v8 + 48LL))(v8, a3, &v12);
  if (v9 <= 0x400)
  {
    if (!v9) {
      return 1LL;
    }
    while (1)
    {
      int v13 = *(_DWORD *)(a2 + 4);
      uint64_t v10 = *(void *)(a4 + 24);
      if (!v10) {
        break;
      }
      (*(void (**)(uint64_t, uint64_t, int *))(*(void *)v10 + 48LL))(v10, a3, &v13);
      if (!--v9) {
        return 1LL;
      }
    }

    goto LABEL_11;
  }

  return 0LL;
}

  uint64_t v8 = 1.0;
  unsigned int v9 = 0.0;
  Float = 0.0;
LABEL_12:
  uint64_t v11 = *(uint64_t **)(a1 + 32);
  int v12 = (float *)v11[7];
  if ((unint64_t)v12 >= v11[8])
  {
    int v13 = sub_100005BCC(v11 + 6, (uint64_t)&v27);
    int v14 = *(uint64_t **)(a1 + 32);
  }

  else
  {
    _BYTE *v12 = Float;
    v12[1] = v8;
    int v13 = (uint64_t)(v12 + 3);
    int v14 = v11;
    v12[2] = v9;
  }

  v11[7] = v13;
  uint64_t v15 = v14[11];
  int v16 = (char *)v14[10];
  if ((unint64_t)v16 >= v15)
  {
    char v18 = (char *)v14[9];
    std::locale v19 = (v16 - v18) >> 2;
    char v20 = v15 - (void)v18;
    std::string::size_type v21 = (uint64_t)(v15 - (void)v18) >> 1;
    if (v21 <= v19 + 1) {
      std::string::size_type v21 = v19 + 1;
    }
    if (v20 >= 0x7FFFFFFFFFFFFFFCLL) {
      std::string::size_type v22 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      std::string::size_type v22 = v21;
    }
    if (v22)
    {
      uint64_t v23 = (char *)sub_100005D34((uint64_t)(v14 + 11), v22);
      char v18 = (char *)v14[9];
      int v16 = (char *)v14[10];
    }

    else
    {
      uint64_t v23 = 0LL;
    }

    uint64_t v24 = &v23[4 * v19];
    __darwin_ct_rune_t v25 = &v23[4 * v22];
    *(_DWORD *)uint64_t v24 = 0;
    uint64_t v17 = v24 + 4;
    while (v16 != v18)
    {
      unint64_t v26 = *((_DWORD *)v16 - 1);
      v16 -= 4;
      *((_DWORD *)v24 - 1) = v26;
      v24 -= 4;
    }

    v14[9] = (uint64_t)v24;
    v14[10] = (uint64_t)v17;
    v14[11] = (uint64_t)v25;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *(_DWORD *)int v16 = 0;
    uint64_t v17 = v16 + 4;
  }

  v14[10] = (uint64_t)v17;
}

  sub_100004FE8((_BYTE *)a2, *((void **)this + 4), *((void *)this + 5));
}

  sub_100004FE8((_BYTE *)a2, *((void **)this + 7), *((void *)this + 8));
}

uint64_t sub_100003DDC(uint64_t a1, int a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 0:
    case 2:
    case 4:
      std::istream::operator>>(a1, &v5);
      goto LABEL_4;
    case 1:
    case 3:
    case 5:
      std::istream::operator>>(a1, &v5);
LABEL_4:
      uint64_t result = LODWORD(v5);
      break;
    case 6:
      std::istream::operator>>(a1, &v5);
      uint64_t result = (int)*(float *)&v5;
      break;
    case 7:
      std::istream::operator>>(a1, &v5);
      uint64_t result = (int)v5;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

void *sub_100003E60(void *a1, uint64_t a2)
{
  v6[0] = &off_100014418;
  v6[1] = a2;
  uint64_t v7 = v6;
  sub_10000593C(v6, a1);
  uint64_t v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v6;
    goto LABEL_5;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

float sub_100003F04(uint64_t a1, int a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 0:
    case 2:
    case 4:
      std::istream::operator>>(a1, &v5);
      float result = (float)SLODWORD(v5);
      break;
    case 1:
    case 3:
    case 5:
      std::istream::operator>>(a1, &v5);
      float result = (float)LODWORD(v5);
      break;
    case 6:
      std::istream::operator>>(a1, &v5);
      float result = *(float *)&v5;
      break;
    case 7:
      std::istream::operator>>(a1, &v5);
      float result = v5;
      break;
    default:
      float result = 0.0;
      break;
  }

  return result;
}

void *sub_100003F90(void *a1, uint64_t a2)
{
  v6[0] = &off_1000144C8;
  v6[1] = a2;
  uint64_t v7 = v6;
  sub_10000593C(v6, a1);
  uint64_t v3 = v7;
  if (v7 == v6)
  {
    uint64_t v4 = 4LL;
    uint64_t v3 = v6;
    goto LABEL_5;
  }

  if (v7)
  {
    uint64_t v4 = 5LL;
LABEL_5:
    (*(void (**)(void))(*v3 + 8 * v4))();
  }

  return a1;
}

float sub_100004034(uint64_t a1, unsigned int a2)
{
  if (a2 > 5) {
    return sub_100003F04(a1, a2);
  }
  else {
    return (float)(int)sub_100003DDC(a1, a2) / 255.0;
  }
}

uint64_t sub_100004064(uint64_t a1, int a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 0:
      std::istream::read(a1, &v5, 1LL);
      uint64_t result = SLOBYTE(v5);
      break;
    case 1:
      std::istream::read(a1, &v5, 1LL);
      uint64_t result = LOBYTE(v5);
      break;
    case 2:
      std::istream::read(a1, &v5, 2LL);
      uint64_t result = SLOWORD(v5);
      break;
    case 3:
      std::istream::read(a1, &v5, 2LL);
      uint64_t result = LOWORD(v5);
      break;
    case 4:
    case 5:
      std::istream::read(a1, &v5, 4LL);
      uint64_t result = LODWORD(v5);
      break;
    case 6:
      std::istream::read(a1, &v5, 4LL);
      uint64_t result = (int)*(float *)&v5;
      break;
    case 7:
      std::istream::read(a1, &v5, 8LL);
      uint64_t result = (int)v5;
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

float sub_100004138(uint64_t a1, int a2)
{
  uint64_t v8 = v2;
  uint64_t v9 = v3;
  switch(a2)
  {
    case 0:
      std::istream::read(a1, &v7, 1LL);
      return (float)SLOBYTE(v7);
    case 1:
      std::istream::read(a1, &v7, 1LL);
      LOBYTE(v6) = LOBYTE(v7);
      goto LABEL_10;
    case 2:
      std::istream::read(a1, &v7, 2LL);
      return (float)SLOWORD(v7);
    case 3:
      std::istream::read(a1, &v7, 2LL);
      LOWORD(v6) = LOWORD(v7);
      goto LABEL_10;
    case 4:
      std::istream::read(a1, &v7, 4LL);
      return (float)SLODWORD(v7);
    case 5:
      std::istream::read(a1, &v7, 4LL);
      unsigned int v6 = LODWORD(v7);
LABEL_10:
      float result = (float)v6;
      break;
    case 6:
      std::istream::read(a1, &v7, 4LL);
      float result = *(float *)&v7;
      break;
    case 7:
      std::istream::read(a1, &v7, 8LL);
      float result = v7;
      break;
    default:
      float result = 0.0;
      break;
  }

  return result;
}

float sub_100004228(uint64_t a1, unsigned int a2)
{
  if (a2 > 5) {
    return sub_100004138(a1, a2);
  }
  else {
    return (float)(int)sub_100004064(a1, a2) / 255.0;
  }
}

uint64_t sub_100004258(uint64_t a1, int a2)
{
  uint64_t v6 = v2;
  uint64_t v7 = v3;
  switch(a2)
  {
    case 0:
      std::istream::read(a1, &v5, 1LL);
      uint64_t result = (char)v5;
      break;
    case 1:
      std::istream::read(a1, &v5, 1LL);
      uint64_t result = v5;
      break;
    case 2:
      std::istream::read(a1, &v5, 2LL);
      uint64_t result = (__int16)(v5 << 8) | BYTE1(v5);
      break;
    case 3:
      std::istream::read(a1, &v5, 2LL);
      uint64_t result = __rev16((unsigned __int16)v5);
      break;
    case 4:
    case 5:
      std::istream::read(a1, &v5, 4LL);
      uint64_t result = bswap32(v5);
      break;
    case 6:
      std::istream::read(a1, &v5, 4LL);
      uint64_t result = (int)COERCE_FLOAT(bswap32(v5));
      break;
    case 7:
      uint64_t result = (int)sub_100004EE8(a1);
      break;
    default:
      uint64_t result = 0LL;
      break;
  }

  return result;
}

float sub_100004340(uint64_t a1, int a2)
{
  uint64_t v9 = v2;
  uint64_t v10 = v3;
  switch(a2)
  {
    case 0:
      std::istream::read(a1, &v8, 1LL);
      int v4 = (char)v8;
      goto LABEL_8;
    case 1:
      __n128 v6 = std::istream::read(a1, &v8, 1LL);
      v6.n128_u8[0] = v8;
      return (float)v6.n128_u32[0];
    case 2:
      std::istream::read(a1, &v8, 2LL);
      int v4 = (int)bswap32((unsigned __int16)v8) >> 16;
      goto LABEL_8;
    case 3:
      std::istream::read(a1, &v8, 2LL);
      unsigned int v7 = bswap32((unsigned __int16)v8) >> 16;
      goto LABEL_10;
    case 4:
      std::istream::read(a1, &v8, 4LL);
      int v4 = bswap32(v8);
LABEL_8:
      float result = (float)v4;
      break;
    case 5:
      std::istream::read(a1, &v8, 4LL);
      unsigned int v7 = bswap32(v8);
LABEL_10:
      float result = (float)v7;
      break;
    case 6:
      std::istream::read(a1, &v8, 4LL);
      float result = COERCE_FLOAT(bswap32(v8));
      break;
    case 7:
      float result = sub_100004EE8(a1);
      break;
    default:
      float result = 0.0;
      break;
  }

  return result;
}

float sub_100004444(uint64_t a1, unsigned int a2)
{
  if (a2 > 5) {
    return sub_100004340(a1, a2);
  }
  else {
    return (float)(int)sub_100004258(a1, a2) / 255.0;
  }
}

void sub_100004474(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 2) < a2)
  {
    if (a2 >= 0x1555555555555556LL) {
      sub_100005508();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v11 = v3;
    std::string __p = sub_10000551C(v3, a2);
    unsigned int v8 = (char *)__p + v5;
    uint64_t v9 = (char *)__p + v5;
    uint64_t v10 = (char *)__p + 12 * v6;
    sub_100005B6C(a1, &__p);
    if (v9 != v8) {
      uint64_t v9 = &v8[(v9 - v8 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }
}

void sub_100004548( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_100004594(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62) {
      sub_100005508();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_100005D34(v3, a2);
    unsigned int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    uint64_t v9 = &v6[4 * v8];
    uint64_t v10 = (char *)*a1;
    uint64_t v11 = (char *)a1[1];
    int v12 = v7;
    if (v11 != *a1)
    {
      int v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void PlyConverter::createPointCloud(uint64_t a1, const void **a2, uint64_t a3, serialize::Prim *a4)
{
  uint64_t v8 = (char *)operator new(0x88uLL);
  sub_100004864(a2, 47, (uint64_t)&v20);
  fileFormatUtils::makeValidIdentifier((uint64_t *)(a1 + 24), &__p);
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = __p.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  uint64_t v11 = std::string::append(&v20, (const std::string::value_type *)p_p, size);
  int v13 = (void *)v11->__r_.__value_.__r.__words[0];
  unint64_t v12 = v11->__r_.__value_.__l.__size_;
  v21[0] = v11->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v21 + 3) = *(_DWORD *)((char *)&v11->__r_.__value_.__r.__words[2] + 3);
  int v14 = (char)v11->__r_.__value_.__s.__size_;
  v11->__r_.__value_.__l.__size_ = 0LL;
  v11->__r_.__value_.__l.__cap_ = 0LL;
  v11->__r_.__value_.__r.__words[0] = 0LL;
  *(void *)uint64_t v8 = off_1000145C8;
  *((_DWORD *)v8 + 2) = 3;
  if (v14 < 0)
  {
    sub_100004FE8(v8 + 16, v13, v12);
    *((void *)v8 + 5) = 0LL;
    *((void *)v8 + 6) = 0LL;
    *((void *)v8 + 7) = 0LL;
    *(void *)uint64_t v8 = off_100014650;
    *((_OWORD *)v8 + 4) = 0u;
    uint64_t v15 = v8 + 64;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((void *)v8 + 16) = 0LL;
    operator delete(v13);
  }

  else
  {
    *((void *)v8 + 2) = v13;
    *((void *)v8 + 3) = v12;
    *((_DWORD *)v8 + std::istream::~istream(v2, v3 + 8) = v21[0];
    *(_DWORD *)(v8 + 35) = *(_DWORD *)((char *)v21 + 3);
    v8[39] = v14;
    *((void *)v8 + 6) = 0LL;
    *((void *)v8 + 7) = 0LL;
    *((void *)v8 + 5) = 0LL;
    *(void *)uint64_t v8 = off_100014650;
    *((_OWORD *)v8 + 4) = 0u;
    uint64_t v15 = v8 + 64;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 7) = 0u;
    *((void *)v8 + 16) = 0LL;
  }

  if (v15 != (void *)(a1 + 48)) {
    sub_100005DEC( v15,  *(uint64_t **)(a1 + 48),  *(uint64_t **)(a1 + 56),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 2));
  }
  int v16 = *(uint64_t **)(a1 + 96);
  uint64_t v17 = *(uint64_t **)(a1 + 104);
  char v18 = (char *)(a1 + 96);
  if (v17 != v16 && v8 + 88 != v18) {
    sub_100005DEC((void *)v8 + 11, v16, v17, 0xAAAAAAAAAAAAAAABLL * (((char *)v17 - (char *)v16) >> 2));
  }
  std::string::operator=((std::string *)(v8 + 112), (const std::string *)(a3 + 16));
  serialize::Prim::addChild(a4, (serialize::Prim *)v8);
}

void sub_100004810( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t sub_100004864@<X0>(const void **a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  else {
    size_t v5 = (size_t)a1[1];
  }
  uint64_t result = sub_100005D68(a3, v5 + 1);
  else {
    unsigned int v7 = *(char **)result;
  }
  if (v5)
  {
    else {
      uint64_t v8 = *a1;
    }
    uint64_t result = (uint64_t)memmove(v7, v8, v5);
  }

  uint64_t v9 = &v7[v5];
  *uint64_t v9 = a2;
  v9[1] = 0;
  return result;
}

void PlyConverter::createMesh(uint64_t a1, const void **a2, uint64_t a3, serialize::Prim *a4)
{
  uint64_t v4 = (char *)(a1 + 144);
  if (*(void *)(a1 + 152) != *(void *)(a1 + 144))
  {
    uint64_t v9 = (char *)operator new(0x128uLL);
    sub_100004864(a2, 47, (uint64_t)&v20);
    fileFormatUtils::makeValidIdentifier((uint64_t *)(a1 + 24), &v19);
    if ((v19.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v10 = &v19;
    }
    else {
      uint64_t v10 = (std::string *)v19.__r_.__value_.__r.__words[0];
    }
    if ((v19.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = v19.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = v19.__r_.__value_.__l.__size_;
    }
    unint64_t v12 = std::string::append(&v20, (const std::string::value_type *)v10, size);
    __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
    std::string::size_type cap = v12->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v13;
    v12->__r_.__value_.__l.__size_ = 0LL;
    v12->__r_.__value_.__l.__cap_ = 0LL;
    v12->__r_.__value_.__r.__words[0] = 0LL;
    sub_100004F44((uint64_t)v9, (__int128 *)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    if (v9 + 64 != v4) {
      sub_100005FF8( v9 + 64,  *(char **)(a1 + 144),  *(void *)(a1 + 152),  (uint64_t)(*(void *)(a1 + 152) - *(void *)(a1 + 144)) >> 2);
    }
    if (v9 + 160 != (char *)(a1 + 48)) {
      sub_100005DEC( (void *)v9 + 20,  *(uint64_t **)(a1 + 48),  *(uint64_t **)(a1 + 56),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a1 + 56) - *(void *)(a1 + 48)) >> 2));
    }
    if (v9 + 88 != (char *)(a1 + 120)) {
      sub_100005FF8( v9 + 88,  *(char **)(a1 + 120),  *(void *)(a1 + 128),  (uint64_t)(*(void *)(a1 + 128) - *(void *)(a1 + 120)) >> 2);
    }
    int v14 = *(uint64_t **)(a1 + 96);
    uint64_t v15 = *(uint64_t **)(a1 + 104);
    int v16 = *(uint64_t **)(a1 + 72);
    uint64_t v17 = *(uint64_t **)(a1 + 80);
    char v18 = (char *)(a1 + 72);
    if (v17 != v16)
    {
      if (v9 + 184 != v18) {
        sub_100005DEC((void *)v9 + 23, v16, v17, 0xAAAAAAAAAAAAAAABLL * (((char *)v17 - (char *)v16) >> 2));
      }
      *((_DWORD *)v9 + 64) = 2;
    }

    std::string::operator=((std::string *)(v9 + 272), (const std::string *)(a3 + 16));
    serialize::Prim::addChild(a4, (serialize::Prim *)v9);
  }

void sub_100004AC0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  if (a14 < 0) {
    operator delete(a9);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  operator delete(v26);
  _Unwind_Resume(a1);
}

serialize::Prim *PlyConverter::makeStage(PlyConverter *this)
{
  if (!*((_BYTE *)this + 168)) {
    return 0LL;
  }
  if (*((char *)this + 47) < 0)
  {
    sub_100004FE8(__p, *((void **)this + 3), *((void *)this + 4));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)((char *)this + 24);
    uint64_t v15 = *((void *)this + 5);
  }

  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, &v17);
  __int128 v20 = 0u;
  *(_OWORD *)std::string v19 = 0u;
  *(_OWORD *)char v18 = 0u;
  if (SHIBYTE(v15) < 0) {
    operator delete(__p[0]);
  }
  inited = (serialize::Prim *)fileFormatUtils::Asset::initStage((fileFormatUtils::Asset *)v16);
  fileFormatUtils::Asset::getMaterialsPath((fileFormatUtils::Asset *)v16, (uint64_t)v12);
  uint64_t v3 = (char *)operator new(0x40uLL);
  if ((v13 & 0x80u) == 0) {
    size_t v4 = v13;
  }
  else {
    size_t v4 = (size_t)v12[1];
  }
  size_t v5 = v10;
  sub_100005D68((uint64_t)v10, v4 + 8);
  if (v11 < 0) {
    size_t v5 = (void **)v10[0];
  }
  if (v4)
  {
    if ((v13 & 0x80u) == 0) {
      uint64_t v6 = v12;
    }
    else {
      uint64_t v6 = (void **)v12[0];
    }
    memmove(v5, v6, v4);
  }

  strcpy((char *)v5 + v4, "/default");
  *(void *)uint64_t v3 = off_1000145C8;
  *((_DWORD *)v3 + 2) = 6;
  unsigned int v7 = v3 + 16;
  if (SHIBYTE(v11) < 0)
  {
    sub_100004FE8(v7, v10[0], (unint64_t)v10[1]);
    int v8 = SHIBYTE(v11);
    *((void *)v3 + 6) = 0LL;
    *((void *)v3 + 7) = 0LL;
    *((void *)v3 + 5) = 0LL;
    *(void *)uint64_t v3 = &off_100014728;
    if (v8 < 0) {
      operator delete(v10[0]);
    }
  }

  else
  {
    *(_OWORD *)unsigned int v7 = *(_OWORD *)v10;
    *((void *)v3 + 4) = v11;
    *((void *)v3 + 6) = 0LL;
    *((void *)v3 + 7) = 0LL;
    *((void *)v3 + 5) = 0LL;
    *(void *)uint64_t v3 = &off_100014728;
  }

  serialize::Prim::addChild(inited, (serialize::Prim *)v3);
  fileFormatUtils::Asset::getGeomPath((fileFormatUtils::Asset *)v16, (uint64_t)v10);
  if (*((void *)this + 19) != *((void *)this + 18) || *((void *)this + 7) == *((void *)this + 6)) {
    PlyConverter::createMesh((uint64_t)this, (const void **)v10, (uint64_t)v3, inited);
  }
  else {
    PlyConverter::createPointCloud((uint64_t)this, (const void **)v10, (uint64_t)v3, inited);
  }
  if (SHIBYTE(v11) < 0) {
    operator delete(v10[0]);
  }
  if (SHIBYTE(v20) < 0) {
    operator delete(v19[1]);
  }
  if (SHIBYTE(v19[0]) < 0) {
    operator delete(v18[0]);
  }
  return inited;
}

void sub_100004D88( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v27);
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100004E10((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E10(uint64_t a1)
{
  return a1;
}

void sub_100004E60(void *a1)
{
}

void *sub_100004E70(void *a1, __int128 *a2, uint64_t a3)
{
  *a1 = 0LL;
  a1[1] = 0LL;
  a1[2] = 0LL;
  size_t v5 = a1 + 3;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8(v5, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v6 = *a2;
    v5[2] = *((void *)a2 + 2);
    *(_OWORD *)size_t v5 = v6;
  }

  a1[6] = a3;
  return a1;
}

void sub_100004ECC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + std::istream::~istream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  _Unwind_Resume(exception_object);
}

double sub_100004EE8(uint64_t a1)
{
  return COERCE_DOUBLE(bswap64(v2));
}

uint64_t sub_100004F44(uint64_t a1, __int128 *a2)
{
  *(void *)a1 = off_1000145C8;
  *(_DWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 4;
  uint64_t v3 = a1 + 16;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)v3, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    *(void *)(v3 + 16) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v3 = v4;
  }

  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(void *)a1 = &off_100014698;
  *(void *)(a1 + 280) = 0LL;
  *(void *)(a1 + 28std::istream::~istream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 272) = 0LL;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 12std::istream::~istream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 20std::istream::~istream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 252) = 0u;
  return a1;
}

void *sub_100004FE8(_BYTE *__dst, void *__src, unint64_t a3)
{
  size_t v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8LL) {
      sub_100005074();
    }
    uint64_t v6 = (a3 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a3 | 7) != 0x17) {
      uint64_t v6 = a3 | 7;
    }
    uint64_t v7 = v6 + 1;
    int v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000LL;
    *size_t v5 = v8;
    size_t v5 = v8;
  }

  else
  {
    __dst[23] = a3;
  }

  return memmove(v5, __src, a3 + 1);
}

void sub_100005074()
{
}

void sub_100005088(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1000050D8(exception, a1);
}

void sub_1000050C4(_Unwind_Exception *a1)
{
}

std::logic_error *sub_1000050D8(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_1000050FC()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
}

void *sub_100005124(void *a1, std::string *a2, unsigned __int8 a3)
{
  if (!v11) {
    return a1;
  }
  if ((char)a2->__r_.__value_.__s.__size_ < 0)
  {
    *a2->__r_.__value_.__l.__data_ = 0;
    a2->__r_.__value_.__l.__size_ = 0LL;
  }

  else
  {
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2->__r_.__value_.__s.__size_ = 0;
  }

  uint64_t v6 = 0LL;
  while (1)
  {
    uint64_t v7 = *(void **)((char *)a1 + *(void *)(*a1 - 24LL) + 40);
    int v8 = (_BYTE *)v7[3];
    if (v8 != (_BYTE *)v7[4])
    {
      v7[3] = v8 + 1;
      LOBYTE(v7) = *v8;
      goto LABEL_9;
    }

    LODWORD(v7) = (*(uint64_t (**)(void *))(*v7 + 80LL))(v7);
    if ((_DWORD)v7 == -1) {
      break;
    }
LABEL_9:
    if (v7 == a3)
    {
      int v9 = 0;
      goto LABEL_17;
    }

    std::string::push_back(a2, (std::string::value_type)v7);
    --v6;
    if ((char)a2->__r_.__value_.__s.__size_ < 0 && a2->__r_.__value_.__l.__size_ == 0x7FFFFFFFFFFFFFF7LL)
    {
      int v9 = 4;
      goto LABEL_17;
    }
  }

  if (v6) {
    int v9 = 2;
  }
  else {
    int v9 = 6;
  }
LABEL_17:
  std::ios_base::clear( (std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)),  *(_DWORD *)((char *)a1 + *(void *)(*a1 - 24LL) + 32) | v9);
  return a1;
}

void sub_100005250(void *a1)
{
  uint64_t v2 = *v1;
  *(_DWORD *)((char *)v1 + *(void *)(*v1 - 24LL) + 32) |= 1u;
  if ((*((_BYTE *)v1 + *(void *)(v2 - 24) + 36) & 1) == 0)
  {
    __cxa_end_catch();
    JUMPOUT(0x10000521CLL);
  }

  __cxa_rethrow();
}

void sub_100005294(_Unwind_Exception *a1)
{
}

void sub_1000052A8()
{
}

void sub_1000052BC(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_10000530C(exception, a1);
}

void sub_1000052F8(_Unwind_Exception *a1)
{
}

std::logic_error *sub_10000530C(std::logic_error *a1, const char *a2)
{
  uint64_t result = std::logic_error::logic_error(a1, a2);
  return result;
}

void sub_100005330(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    size_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 56LL;
        sub_1000053B4((uint64_t)(v1 + 2), v4);
      }

      while ((void *)v4 != v2);
      size_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_1000053B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  if (*(void *)a2)
  {
    *(void *)(a2 + std::istream::~istream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

void sub_1000053F8(uint64_t a1)
{
  *(void *)(a1 + 8std::istream::~istream(v2, v3 + 8) = 0LL;
  uint64_t v2 = (std::string *)(a1 + 64);
  char v3 = *(_BYTE *)(a1 + 87);
  if (v3 < 0)
  {
    uint64_t v4 = *(std::string **)(a1 + 64);
    unint64_t v5 = *(void *)(a1 + 72);
  }

  else
  {
    uint64_t v4 = v2;
    unint64_t v5 = *(unsigned __int8 *)(a1 + 87);
  }

  int v6 = *(_DWORD *)(a1 + 96);
  if ((v6 & 8) != 0)
  {
    *(void *)(a1 + 8std::istream::~istream(v2, v3 + 8) = (char *)v4 + v5;
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v4;
    *(void *)(a1 + 32) = (char *)v4 + v5;
  }

  if ((v6 & 0x10) != 0)
  {
    *(void *)(a1 + 8std::istream::~istream(v2, v3 + 8) = (char *)v4 + v5;
    std::string::size_type v7 = v3 < 0 ? (*(void *)(a1 + 80) & 0x7FFFFFFFFFFFFFFFLL) - 1 : 22LL;
    std::string::resize(v2, v7, 0);
    uint64_t v8 = *(char *)(a1 + 87) < 0 ? *(void *)(a1 + 72) : *(unsigned __int8 *)(a1 + 87);
    *(void *)(a1 + 40) = v4;
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = v4;
    *(void *)(a1 + 56) = (char *)v4 + v8;
    if ((*(_BYTE *)(a1 + 96) & 3) != 0)
    {
      if (v5 >> 31)
      {
        uint64_t v9 = ((v5 - 0x80000000) * (unsigned __int128)0x200000005uLL) >> 64;
        unint64_t v10 = 0x7FFFFFFF * ((v9 + ((v5 - 0x80000000 - v9) >> 1)) >> 30);
        uint64_t v4 = (std::string *)((char *)v4 + v10 + 0x7FFFFFFF);
        unint64_t v5 = v5 - v10 - 0x7FFFFFFF;
        *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = v4;
      }

      if (v5) {
        *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = (char *)v4 + v5;
      }
    }
  }

void sub_100005508()
{
}

void *sub_10000551C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556LL) {
    sub_1000050FC();
  }
  return operator new(12 * a2);
}

uint64_t sub_100005560(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000561C((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_1000055D4(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493LL) {
    sub_1000050FC();
  }
  return operator new(56 * a2);
}

uint64_t sub_10000561C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    uint64_t v10 = a6;
  }

  else
  {
    do
    {
      *(void *)(v7 - 56) = 0LL;
      *(void *)(v7 - 4std::istream::~istream(v2, v3 + 8) = 0LL;
      *(void *)(v7 - 40) = 0LL;
      __int128 v8 = *(_OWORD *)(a3 - 56);
      a3 -= 56LL;
      *(_OWORD *)(v7 - 56) = v8;
      *(void *)(v7 - 40) = *(void *)(a3 + 16);
      *(void *)a3 = 0LL;
      *(void *)(a3 + std::istream::~istream(v2, v3 + 8) = 0LL;
      *(void *)(a3 + 16) = 0LL;
      __int128 v9 = *(_OWORD *)(a3 + 24);
      *(void *)(v7 - 16) = *(void *)(a3 + 40);
      *(_OWORD *)(v7 - 32) = v9;
      *(void *)(a3 + 32) = 0LL;
      *(void *)(a3 + 40) = 0LL;
      *(void *)(a3 + 24) = 0LL;
      *(void *)(v7 - std::istream::~istream(v2, v3 + 8) = *(void *)(a3 + 48);
      uint64_t v7 = *((void *)&v15 + 1) - 56LL;
      *((void *)&v15 + 1) -= 56LL;
    }

    while (a3 != a5);
    uint64_t v10 = v15;
  }

  char v13 = 1;
  sub_1000056DC((uint64_t)v12);
  return v10;
}

uint64_t sub_1000056DC(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_100005710((uint64_t *)a1);
  }
  return a1;
}

void sub_100005710(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_1000053B4(v3, v1);
      v1 += 56LL;
    }

    while (v1 != v2);
  }

void **sub_100005760(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_100005790(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 56;
    sub_1000053B4(v4, i - 56);
  }

void sub_1000057D4()
{
  exception = __cxa_allocate_exception(8uLL);
  void *exception = &off_1000143F0;
}

void sub_10000580C(std::exception *a1)
{
}

void *sub_100005828(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_100014418;
  result[1] = v3;
  return result;
}

uint64_t sub_100005860(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_100014418;
  a2[1] = v2;
  return result;
}

float sub_100005880(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return (float)(*(int (**)(uint64_t, void))(a1 + 8))(a2, *a3);
}

uint64_t sub_1000058A8(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

_UNKNOWN **sub_1000058E4()
{
  return &off_100014498;
}

BOOL sub_1000058F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1LL;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0LL;
}

void *sub_10000593C(void *result, void *a2)
{
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    uint64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24LL))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32LL))(v3[3]);
        v3[3] = 0LL;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24LL))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32LL))(a2[3]);
        a2[3] = 0LL;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24LL))(v6, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32LL))(v6);
      }

      else
      {
        (*(void (**)(void *, void *))(*result + 24LL))(result, a2);
        uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32LL))(v3[3]);
        v3[3] = a2[3];
      }

      a2[3] = a2;
    }

    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24LL))(a2, result);
      uint64_t result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32LL))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }

    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }

  return result;
}

void sub_100005AA4(_Unwind_Exception *a1, int a2)
{
  if (!a2) {
    _Unwind_Resume(a1);
  }
  sub_100004E60(a1);
}

void *sub_100005AB8(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &off_1000144C8;
  result[1] = v3;
  return result;
}

uint64_t sub_100005AF0(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &off_1000144C8;
  a2[1] = v2;
  return result;
}

uint64_t sub_100005B10(uint64_t a1, uint64_t a2, unsigned int *a3)
{
  return (*(uint64_t (**)(uint64_t, void))(a1 + 8))(a2, *a3);
}

uint64_t sub_100005B24(uint64_t a1, uint64_t a2)
{
  else {
    return 0LL;
  }
}

_UNKNOWN **sub_100005B60()
{
  return &off_100014538;
}

uint64_t *sub_100005B6C(uint64_t *result, void *a2)
{
  uint64_t v3 = *result;
  uint64_t v2 = result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    uint64_t v5 = *(void *)(v2 - 12);
    v2 -= 12LL;
    *(void *)(v4 - 12) = v5;
    v4 -= 12LL;
    *(_DWORD *)(v4 + std::istream::~istream(v2, v3 + 8) = *(_DWORD *)(v2 + 8);
  }

  a2[1] = v4;
  uint64_t v6 = *result;
  *uint64_t result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t sub_100005BCC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x1555555555555555LL) {
    sub_100005508();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x1555555555555555LL;
  }
  else {
    unint64_t v9 = v5;
  }
  std::string v19 = a1 + 2;
  uint64_t v10 = (char *)sub_10000551C(v7, v9);
  char v11 = &v10[12 * v4];
  std::string __p = v10;
  int v16 = v11;
  char v18 = &v10[12 * v12];
  *(void *)char v11 = *(void *)a2;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(a2 + 8);
  std::string v17 = v11 + 12;
  sub_100005B6C(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    std::string v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_100005CE8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_100005D34(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1000050FC();
  }
  return operator new(4 * a2);
}

uint64_t sub_100005D68(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100005074();
  }
  if (a2 > 0x16)
  {
    uint64_t v4 = (a2 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((a2 | 7) != 0x17) {
      uint64_t v4 = a2 | 7;
    }
    uint64_t v5 = v4 + 1;
    uint64_t v6 = operator new(v4 + 1);
    *(void *)(a1 + std::istream::~istream(v2, v3 + 8) = a2;
    *(void *)(a1 + 16) = v5 | 0x8000000000000000LL;
    *(void *)a1 = v6;
  }

  else
  {
    *(void *)(a1 + std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 16) = 0LL;
    *(void *)a1 = 0LL;
    *(_BYTE *)(a1 + 23) = a2;
  }

  return a1;
}

_DWORD *sub_100005DEC(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  uint64_t v6 = a2;
  uint64_t v8 = a1[2];
  uint64_t result = (_DWORD *)*a1;
  if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)result) >> 2) < a4)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a4 > 0x1555555555555555LL) {
      sub_100005508();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    uint64_t v11 = 2 * v10;
    if (2 * v10 <= a4) {
      uint64_t v11 = a4;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v12 = 0x1555555555555555LL;
    }
    else {
      unint64_t v12 = v11;
    }
    sub_100005FA8(a1, v12);
    __int128 v14 = (_DWORD *)a1[1];
    uint64_t v13 = (_DWORD **)(a1 + 1);
    uint64_t result = v14;
    __int128 v15 = (char *)v14;
    if (v6 != a3)
    {
      __int128 v15 = (char *)result;
      do
      {
        *(void *)__int128 v15 = *v6;
        *((_DWORD *)v15 + 2) = *((_DWORD *)v6 + 2);
        v15 += 12;
        uint64_t v6 = (uint64_t *)((char *)v6 + 12);
      }

      while (v6 != a3);
    }

LABEL_26:
    int64_t v24 = v15 - (char *)result;
    goto LABEL_27;
  }

  std::string v17 = (_DWORD *)a1[1];
  uint64_t v13 = (_DWORD **)(a1 + 1);
  int v16 = v17;
  unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * (v17 - result);
  if (v18 >= a4)
  {
    __int128 v15 = (char *)result;
    if (a2 != a3)
    {
      __darwin_ct_rune_t v25 = result;
      do
      {
        uint64_t v26 = *v6;
        v25[2] = *((_DWORD *)v6 + 2);
        *(void *)__darwin_ct_rune_t v25 = v26;
        v25 += 3;
        uint64_t v6 = (uint64_t *)((char *)v6 + 12);
        v15 += 12;
      }

      while (v6 != a3);
    }

    goto LABEL_26;
  }

  uint64_t v19 = (uint64_t)a2 + 12 * v18;
  if (v16 != result)
  {
    uint64_t v20 = 12 * v18;
    do
    {
      uint64_t v21 = *v6;
      result[2] = *((_DWORD *)v6 + 2);
      *(void *)uint64_t result = v21;
      result += 3;
      uint64_t v6 = (uint64_t *)((char *)v6 + 12);
      v20 -= 12LL;
    }

    while (v20);
    uint64_t result = *v13;
  }

  std::string::size_type v22 = (char *)result;
  if ((uint64_t *)v19 != a3)
  {
    std::string::size_type v22 = (char *)result;
    uint64_t v23 = result;
    do
    {
      *(void *)uint64_t v23 = *(void *)v19;
      v23[2] = *(_DWORD *)(v19 + 8);
      v22 += 12;
      v19 += 12LL;
      v23 += 3;
    }

    while ((uint64_t *)v19 != a3);
  }

  int64_t v24 = v22 - (char *)result;
LABEL_27:
  *uint64_t v13 = (_DWORD *)((char *)result + v24);
  return result;
}

    __darwin_ct_rune_t v25 = v14 - (char *)result;
    goto LABEL_27;
  }

  std::string v17 = (void *)a1[1];
  unint64_t v12 = (void **)(a1 + 1);
  int v16 = v17;
  unint64_t v18 = v17 - result;
  if (v18 >= a4)
  {
    __int128 v14 = (char *)result;
    if (a2 != a3)
    {
      uint64_t v26 = result;
      do
      {
        unint64_t v27 = *v6++;
        *v26++ = v27;
        v14 += 8;
      }

      while (v6 != a3);
    }

    goto LABEL_26;
  }

  uint64_t v19 = &a2[v18];
  if (v16 != result)
  {
    uint64_t v20 = 8 * v18;
    do
    {
      uint64_t v21 = *v6++;
      *result++ = v21;
      v20 -= 8LL;
    }

    while (v20);
    uint64_t result = *v12;
  }

  std::string::size_type v22 = (char *)result;
  if (v19 != a3)
  {
    std::string::size_type v22 = (char *)result;
    uint64_t v23 = result;
    do
    {
      int64_t v24 = *v19++;
      *v23++ = v24;
      v22 += 8;
    }

    while (v19 != a3);
  }

  __darwin_ct_rune_t v25 = v22 - (char *)result;
LABEL_27:
  std::string *v12 = (void *)((char *)result + v25);
  return result;
}

char *sub_100005FA8(void *a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556LL) {
    sub_100005508();
  }
  uint64_t result = (char *)sub_10000551C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

char *sub_100005FF8(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = result;
  uint64_t v8 = *((void *)result + 2);
  unint64_t v9 = *(char **)result;
  if (a4 > (v8 - *(void *)result) >> 2)
  {
    if (v9)
    {
      *((void *)result + 1) = v9;
      operator delete(v9);
      uint64_t v8 = 0LL;
      *uint64_t v7 = 0LL;
      v7[1] = 0LL;
      v7[2] = 0LL;
    }

    if (a4 >> 62) {
      sub_100005508();
    }
    uint64_t v10 = v8 >> 1;
    if (v8 >> 1 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    uint64_t result = sub_100006100(v7, v11);
    uint64_t v13 = (char *)v7[1];
    unint64_t v12 = (void **)(v7 + 1);
    unint64_t v9 = v13;
LABEL_16:
    size_t v17 = a3 - (void)__src;
    if (v17)
    {
      unint64_t v18 = v9;
      uint64_t v19 = __src;
      goto LABEL_18;
    }

    goto LABEL_19;
  }

  unint64_t v12 = (void **)(result + 8);
  __int128 v14 = (_BYTE *)*((void *)result + 1);
  unint64_t v15 = (v14 - v9) >> 2;
  if (v15 >= a4) {
    goto LABEL_16;
  }
  int v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    uint64_t result = (char *)memmove(*(void **)result, __src, v14 - v9);
    unint64_t v9 = (char *)*v12;
  }

  size_t v17 = a3 - (void)v16;
  if (v17)
  {
    unint64_t v18 = v9;
    uint64_t v19 = v16;
LABEL_18:
    uint64_t result = (char *)memmove(v18, v19, v17);
  }

LABEL_19:
  std::string *v12 = &v9[v17];
  return result;
}

char *sub_100006100(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_100005508();
  }
  uint64_t result = (char *)sub_100005D34((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void XpcSandbox::~XpcSandbox(XpcSandbox *this)
{
  uint64_t v2 = (void *)*((void *)this + 1);
  uint64_t v3 = (void *)*((void *)this + 2);
  if (v2 != v3)
  {
    do
      sandbox_extension_release(*v2++);
    while (v2 != v3);
    uint64_t v2 = (void *)*((void *)this + 1);
  }

  if (v2)
  {
    *((void *)this + 2) = v2;
    operator delete(v2);
  }

void XpcSandbox::consumeExtension(XpcSandbox *this, const char *a2)
{
  if (a2)
  {
    uint64_t v3 = sandbox_extension_consume(a2);
    if (v3 != -1)
    {
      uint64_t v4 = v3;
      unint64_t v5 = *((void *)this + 3);
      uint64_t v6 = (uint64_t *)*((void *)this + 2);
      if ((unint64_t)v6 >= v5)
      {
        uint64_t v8 = (uint64_t *)*((void *)this + 1);
        uint64_t v9 = v6 - v8;
        unint64_t v10 = v5 - (void)v8;
        unint64_t v11 = (uint64_t)(v5 - (void)v8) >> 2;
        if (v11 <= v9 + 1) {
          unint64_t v11 = v9 + 1;
        }
        if (v10 >= 0x7FFFFFFFFFFFFFF8LL) {
          unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12)
        {
          uint64_t v13 = (char *)sub_100006318((uint64_t)this + 24, v12);
          uint64_t v8 = (uint64_t *)*((void *)this + 1);
          uint64_t v6 = (uint64_t *)*((void *)this + 2);
        }

        else
        {
          uint64_t v13 = 0LL;
        }

        __int128 v14 = (uint64_t *)&v13[8 * v9];
        unint64_t v15 = &v13[8 * v12];
        *__int128 v14 = v4;
        uint64_t v7 = v14 + 1;
        while (v6 != v8)
        {
          uint64_t v16 = *--v6;
          *--__int128 v14 = v16;
        }

        *((void *)this + 1) = v14;
        *((void *)this + 2) = v7;
        *((void *)this + 3) = v15;
        if (v8) {
          operator delete(v8);
        }
      }

      else
      {
        uint64_t *v6 = v3;
        uint64_t v7 = v6 + 1;
      }

      *((void *)this + 2) = v7;
    }
  }

void XpcSandbox::consume(xpc_connection_t *this, const char *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_string(v4, "consume", a2);
  xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(*this, v4);
  if (v5)
  {
    string = xpc_dictionary_get_string(v5, "consumeToken");
    XpcSandbox::consumeExtension((XpcSandbox *)this, string);
  }

void *sub_100006318(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1000050FC();
  }
  return operator new(8 * a2);
}

_BYTE *serialize::Serializer::Serializer(_BYTE *this)
{
  *this = 1;
  return this;
}

{
  *this = 1;
  return this;
}

char *serialize::Serializer::load(xpc_object_t *this)
{
  *(_BYTE *)this = 0;
  switch(xpc_dictionary_get_int64(this[1], "type"))
  {
    case 1u:
      uint64_t v2 = (char *)operator new(0x40uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      *(void *)uint64_t v2 = off_1000145C8;
      *((_DWORD *)v2 + 2) = 1;
      uint64_t v3 = v2 + 16;
      if ((SHIBYTE(v11) & 0x80000000) == 0)
      {
        *(_OWORD *)uint64_t v3 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v11;
        *((void *)v2 + 6) = 0LL;
        *((void *)v2 + 7) = 0LL;
        *((void *)v2 + 5) = 0LL;
        goto LABEL_16;
      }

      sub_100004FE8(v3, __p[0], (unint64_t)__p[1]);
      int v7 = SHIBYTE(v11);
      *((void *)v2 + 6) = 0LL;
      *((void *)v2 + 7) = 0LL;
      *((void *)v2 + 5) = 0LL;
      if ((v7 & 0x80000000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_15;
    case 2u:
      uint64_t v2 = (char *)operator new(0x68uLL);
      sub_10000741C((uint64_t)v2);
      goto LABEL_16;
    case 3u:
      uint64_t v2 = (char *)operator new(0x88uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      *(void *)uint64_t v2 = off_1000145C8;
      *((_DWORD *)v2 + 2) = 3;
      xpc_object_t v4 = v2 + 16;
      if ((SHIBYTE(v11) & 0x80000000) == 0)
      {
        *(_OWORD *)xpc_object_t v4 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v11;
        *((void *)v2 + 6) = 0LL;
        *((void *)v2 + 7) = 0LL;
        *((void *)v2 + 5) = 0LL;
        *(void *)uint64_t v2 = off_100014650;
        *((_OWORD *)v2 + 4) = 0u;
        *((_OWORD *)v2 + 5) = 0u;
        *((_OWORD *)v2 + 6) = 0u;
        *((_OWORD *)v2 + 7) = 0u;
        *((void *)v2 + 16) = 0LL;
        goto LABEL_16;
      }

      sub_100004FE8(v4, __p[0], (unint64_t)__p[1]);
      int v8 = SHIBYTE(v11);
      *((void *)v2 + 6) = 0LL;
      *((void *)v2 + 7) = 0LL;
      *((void *)v2 + 5) = 0LL;
      *(void *)uint64_t v2 = off_100014650;
      *((_OWORD *)v2 + 4) = 0u;
      *((_OWORD *)v2 + 5) = 0u;
      *((_OWORD *)v2 + 6) = 0u;
      *((_OWORD *)v2 + 7) = 0u;
      *((void *)v2 + 16) = 0LL;
      if (v8 < 0) {
        goto LABEL_15;
      }
      goto LABEL_16;
    case 4u:
      uint64_t v2 = (char *)operator new(0x128uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      sub_100004F44((uint64_t)v2, (__int128 *)__p);
      goto LABEL_14;
    case 5u:
      uint64_t v2 = (char *)operator new(0x88uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      sub_1000072F0((uint64_t)v2, (__int128 *)__p);
      goto LABEL_14;
    case 6u:
      uint64_t v2 = (char *)operator new(0x40uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      *(void *)uint64_t v2 = off_1000145C8;
      *((_DWORD *)v2 + 2) = 6;
      xpc_object_t v5 = v2 + 16;
      if (SHIBYTE(v11) < 0)
      {
        sub_100004FE8(v5, __p[0], (unint64_t)__p[1]);
        int v9 = SHIBYTE(v11);
        *((void *)v2 + 6) = 0LL;
        *((void *)v2 + 7) = 0LL;
        *((void *)v2 + 5) = 0LL;
        *(void *)uint64_t v2 = &off_100014728;
        if (v9 < 0) {
LABEL_15:
        }
          operator delete(__p[0]);
      }

      else
      {
        *(_OWORD *)xpc_object_t v5 = *(_OWORD *)__p;
        *((void *)v2 + 4) = v11;
        *((void *)v2 + 6) = 0LL;
        *((void *)v2 + 7) = 0LL;
        *((void *)v2 + 5) = 0LL;
        *(void *)uint64_t v2 = &off_100014728;
      }

LABEL_16:
      (*(void (**)(char *, xpc_object_t *))(*(void *)v2 + 24LL))(v2, this);
      return v2;
    case 7u:
      uint64_t v2 = (char *)operator new(0x68uLL);
      sub_1000074FC((uint64_t)v2, 1);
      goto LABEL_16;
    case 8u:
      uint64_t v2 = (char *)operator new(0xB0uLL);
      sub_1000076C8(__p, (char *)&unk_100013692);
      sub_1000075D8((uint64_t)v2, 1, (__int128 *)__p);
LABEL_14:
      if (SHIBYTE(v11) < 0) {
        goto LABEL_15;
      }
      goto LABEL_16;
    default:
      return 0LL;
  }

      if ((v4 & 1) != 0)
      {
        if ((v27.__r_.__value_.__s.__size_ & 0x80) != 0)
        {
          unint64_t v12 = v27.__r_.__value_.__l.__size_;
          if (v27.__r_.__value_.__l.__size_ != 5) {
            goto LABEL_45;
          }
          uint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
        }

        else
        {
          uint64_t v11 = &v27;
          if (v27.__r_.__value_.__s.__size_ != 5) {
            goto LABEL_28;
          }
        }

        uint64_t v13 = (int)v11->__r_.__value_.__l.__data_;
        __int128 v14 = v11->__r_.__value_.__s.__data_[4];
        if (v13 == 1702131055 && v14 == 114)
        {
          xpc_object_t v4 = 1;
          goto LABEL_43;
        }
      }

      if ((v27.__r_.__value_.__s.__size_ & 0x80) == 0)
      {
        uint64_t v11 = &v27;
        if (v27.__r_.__value_.__s.__size_ != 5)
        {
LABEL_28:
          uint64_t v16 = 0;
          if (v27.__r_.__value_.__s.__size_ == 7) {
            goto LABEL_52;
          }
          if (v27.__r_.__value_.__s.__size_ != 8) {
            goto LABEL_82;
          }
          goto LABEL_47;
        }

        goto LABEL_33;
      }

      unint64_t v12 = v27.__r_.__value_.__l.__size_;
      if (v27.__r_.__value_.__l.__size_ == 5)
      {
        uint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
LABEL_33:
        size_t v17 = (int)v11->__r_.__value_.__l.__data_;
        unint64_t v18 = v11->__r_.__value_.__s.__data_[4];
        if (v17 == 1701011814 && v18 == 116)
        {
          StlConverter::addNormal((uint64_t)a1, v28);
          xpc_object_t v4 = 1;
          goto LABEL_82;
        }

        if ((v27.__r_.__value_.__s.__size_ & 0x80) == 0)
        {
          if (v27.__r_.__value_.__s.__size_ != 5) {
            goto LABEL_82;
          }
          uint64_t v16 = 0;
          uint64_t v11 = &v27;
          goto LABEL_68;
        }

        unint64_t v12 = v27.__r_.__value_.__l.__size_;
      }

void sub_100006668( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v15);
  _Unwind_Resume(a1);
}

uint64_t serialize::Serializer::save(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + std::istream::~istream(v2, v3 + 8) = xpc_dictionary_create(0LL, 0LL, 0LL);
  (*(void (**)(uint64_t, uint64_t))(*(void *)a2 + 24LL))(a2, a1);
  return *(void *)(a1 + 8);
}

void serialize::Serializer::sync(unsigned __int8 *a1, const char *a2, int *a3)
{
  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3) {
    xpc_dictionary_set_int64(v4, a2, *a3);
  }
  else {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

{
  int v3;
  void *v4;
  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3) {
    xpc_dictionary_set_int64(v4, a2, *a3);
  }
  else {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

{
  int v3;
  void *v4;
  int v3 = *a1;
  xpc_object_t v4 = (void *)*((void *)a1 + 1);
  if (v3) {
    xpc_dictionary_set_int64(v4, a2, *a3);
  }
  else {
    *a3 = xpc_dictionary_get_int64(v4, a2);
  }
}

void serialize::Serializer::sync(unsigned __int8 *a1, const char *a2, std::string *a3)
{
  int v3 = a3;
  int v4 = *a1;
  xpc_object_t v5 = (void *)*((void *)a1 + 1);
  if (v4)
  {
    if ((a3->__r_.__value_.__s.__size_ & 0x80u) != 0) {
      a3 = (std::string *)a3->__r_.__value_.__r.__words[0];
    }
    xpc_dictionary_set_string(v5, a2, (const char *)a3);
  }

  else
  {
    string = xpc_dictionary_get_string(v5, a2);
    std::string::assign(v3, string);
  }

float serialize::Serializer::sync(serialize::Serializer *this, const char *a2, float *a3)
{
  int v4 = *(unsigned __int8 *)this;
  xpc_object_t v5 = (void *)*((void *)this + 1);
  if (v4)
  {
    xpc_dictionary_set_double(v5, a2, *a3);
  }

  else
  {
    float result = xpc_dictionary_get_double(v5, a2);
    *a3 = result;
  }

  return result;
}

void serialize::Serializer::sync(serialize::Serializer *this, const char *a2, unint64_t *a3)
{
  int v3 = *(unsigned __int8 *)this;
  int v4 = (void *)*((void *)this + 1);
  if (v3) {
    xpc_dictionary_set_uint64(v4, a2, *a3);
  }
  else {
    *a3 = xpc_dictionary_get_uint64(v4, a2);
  }
}

void serialize::Serializer::sync(serialize::Serializer *this, const char *a2, int *a3)
{
  int v3 = *(unsigned __int8 *)this;
  int v4 = (void *)*((void *)this + 1);
  if (v3) {
    xpc_dictionary_set_uint64(v4, a2, *a3);
  }
  else {
    *a3 = xpc_dictionary_get_uint64(v4, a2);
  }
}

void serialize::Serializer::sync(serialize::Serializer *a1, char *a2, float *a3)
{
  uint64_t v6 = std::string::append(&v15, ":x");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  int64_t cap = v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v8, a3);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  sub_1000076C8(&v15, a2);
  int v9 = std::string::append(&v15, ":y");
  __int128 v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t cap = v9->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0LL;
  v9->__r_.__value_.__l.__cap_ = 0LL;
  v9->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v11, a3 + 1);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  sub_1000076C8(&v15, a2);
  unint64_t v12 = std::string::append(&v15, ":z");
  __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t cap = v12->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v13;
  v12->__r_.__value_.__l.__size_ = 0LL;
  v12->__r_.__value_.__l.__cap_ = 0LL;
  v12->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    __int128 v14 = __p;
  }
  else {
    __int128 v14 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v14, a3 + 2);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

{
  std::string *v6;
  __int128 v7;
  void **v8;
  std::string *v9;
  __int128 v10;
  void **v11;
  std::string *v12;
  __int128 v13;
  void **v14;
  std::string *v15;
  __int128 v16;
  void **v17;
  std::string v18;
  void *__p[2];
  int64_t cap;
  sub_1000076C8(&v18, a2);
  uint64_t v6 = std::string::append(&v18, ":x");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  int64_t cap = v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v8, a3);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  sub_1000076C8(&v18, a2);
  int v9 = std::string::append(&v18, ":y");
  __int128 v10 = *(_OWORD *)&v9->__r_.__value_.__l.__data_;
  int64_t cap = v9->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v10;
  v9->__r_.__value_.__l.__size_ = 0LL;
  v9->__r_.__value_.__l.__cap_ = 0LL;
  v9->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    uint64_t v11 = __p;
  }
  else {
    uint64_t v11 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v11, a3 + 1);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  sub_1000076C8(&v18, a2);
  unint64_t v12 = std::string::append(&v18, ":z");
  __int128 v13 = *(_OWORD *)&v12->__r_.__value_.__l.__data_;
  int64_t cap = v12->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v13;
  v12->__r_.__value_.__l.__size_ = 0LL;
  v12->__r_.__value_.__l.__cap_ = 0LL;
  v12->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    __int128 v14 = __p;
  }
  else {
    __int128 v14 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v14, a3 + 2);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  sub_1000076C8(&v18, a2);
  std::string v15 = std::string::append(&v18, ":w");
  uint64_t v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  int64_t cap = v15->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v16;
  v15->__r_.__value_.__l.__size_ = 0LL;
  v15->__r_.__value_.__l.__cap_ = 0LL;
  v15->__r_.__value_.__r.__words[0] = 0LL;
  if (cap >= 0) {
    size_t v17 = __p;
  }
  else {
    size_t v17 = (void **)__p[0];
  }
  serialize::Serializer::sync(a1, (const char *)v17, a3 + 3);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
}

void sub_1000069F4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void sub_100006C38( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  _Unwind_Resume(exception_object);
}

void serialize::Serializer::sync(uint64_t a1, const char *a2, uint64_t a3)
{
  if (*(_BYTE *)a1)
  {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 8), a2, *(const void **)a3, *(void *)(a3 + 8) - *(void *)a3);
  }

  else
  {
    int data = (char *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100005FF8((char *)a3, data, (uint64_t)&data[length & 0xFFFFFFFFFFFFFFFCLL], (uint64_t)length >> 2);
  }

{
  char *data;
  size_t length;
  if (*(_BYTE *)a1)
  {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 8), a2, *(const void **)a3, *(void *)(a3 + 8) - *(void *)a3);
  }

  else
  {
    int data = (char *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100005FF8((char *)a3, data, (uint64_t)&data[length & 0xFFFFFFFFFFFFFFFCLL], (uint64_t)length >> 2);
  }

{
  uint64_t *data;
  size_t length;
  if (*(_BYTE *)a1)
  {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 8), a2, *(const void **)a3, *(void *)(a3 + 8) - *(void *)a3);
  }

  else
  {
    int data = (uint64_t *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100005DEC((void *)a3, data, (uint64_t *)((char *)data + 12 * (length / 0xC)), length / 0xC);
  }

{
  uint64_t *data;
  size_t length;
  if (*(_BYTE *)a1)
  {
    xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 8), a2, *(const void **)a3, *(void *)(a3 + 8) - *(void *)a3);
  }

  else
  {
    int data = (uint64_t *)xpc_dictionary_get_data(*(xpc_object_t *)(a1 + 8), a2, &length);
    sub_100007778((void *)a3, data, (uint64_t *)((char *)data + (length & 0xFFFFFFFFFFFFFFF8LL)), (uint64_t)length >> 3);
  }

void serialize::Serializer::sync(xpc_object_t *a1, char *a2, void **a3)
{
  unint64_t v46 = ((_BYTE *)a3[1] - (_BYTE *)*a3) >> 3;
  sub_1000076C8(&v43, a2);
  uint64_t v6 = std::string::append(&v43, ":count");
  __int128 v7 = *(_OWORD *)&v6->__r_.__value_.__l.__data_;
  int64_t cap = (char *)v6->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v7;
  v6->__r_.__value_.__l.__size_ = 0LL;
  v6->__r_.__value_.__l.__cap_ = 0LL;
  v6->__r_.__value_.__r.__words[0] = 0LL;
  if (SHIBYTE(cap) >= 0) {
    int v8 = __p;
  }
  else {
    int v8 = (void **)__p[0];
  }
  serialize::Serializer::sync((serialize::Serializer *)a1, (const char *)v8, &v46);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  size_t v9 = v46;
  if (v46)
  {
    if (*(_BYTE *)a1)
    {
      key = a2;
      __p[0] = 0LL;
      __p[1] = 0LL;
      int64_t cap = 0LL;
      sub_10000725C(__p, v46);
      __int128 v10 = (char *)*a3;
      uint64_t v11 = (char *)a3[1];
      if (*a3 != v11)
      {
        do
        {
          uint64_t v12 = *(void *)v10;
          v43.__r_.__value_.__s.__data_[0] = 1;
          v43.__r_.__value_.__l.__size_ = (std::string::size_type)xpc_dictionary_create(0LL, 0LL, 0LL);
          (*(void (**)(uint64_t, std::string *))(*(void *)v12 + 24LL))(v12, &v43);
          std::string::size_type size = v43.__r_.__value_.__l.__size_;
          __int128 v14 = (char *)__p[1];
          if (__p[1] >= cap)
          {
            int64_t v16 = ((char *)__p[1] - (char *)__p[0]) >> 3;
            unint64_t v17 = (cap - (char *)__p[0]) >> 2;
            if (v17 <= v16 + 1) {
              unint64_t v17 = v16 + 1;
            }
            else {
              unint64_t v18 = v17;
            }
            if (v18) {
              uint64_t v19 = (char *)sub_100006318((uint64_t)&cap, v18);
            }
            else {
              uint64_t v19 = 0LL;
            }
            uint64_t v20 = (std::string::size_type *)&v19[8 * v16];
            *uint64_t v20 = size;
            std::string v15 = v20 + 1;
            std::string::size_type v22 = (char *)__p[0];
            uint64_t v21 = (char *)__p[1];
            if (__p[1] != __p[0])
            {
              do
              {
                std::string::size_type v23 = *((void *)v21 - 1);
                v21 -= 8;
                *--uint64_t v20 = v23;
              }

              while (v21 != v22);
              uint64_t v21 = (char *)__p[0];
            }

            __p[0] = v20;
            __p[1] = v15;
            int64_t cap = &v19[8 * v18];
            if (v21) {
              operator delete(v21);
            }
          }

          else
          {
            *(void *)__p[1] = v43.__r_.__value_.__l.__size_;
            std::string v15 = v14 + 8;
          }

          __p[1] = v15;
          v10 += 8;
        }

        while (v10 != v11);
      }

      xpc_object_t v24 = xpc_array_create((xpc_object_t *)__p[0], v9);
      xpc_dictionary_set_value(a1[1], key, v24);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
    }

    else
    {
      xpc_object_t value = xpc_dictionary_get_value(a1[1], a2);
      sub_10000725C(a3, v9);
      size_t v26 = 0LL;
      do
      {
        xpc_object_t v27 = xpc_array_get_value(value, v26);
        LOBYTE(__p[0]) = 1;
        __p[1] = v27;
        std::locale v28 = serialize::Serializer::load(__p);
        if (v28)
        {
          std::string::size_type v29 = v28;
          __int128 v31 = (char **)a3[1];
          unint64_t v30 = (unint64_t)a3[2];
          if ((unint64_t)v31 >= v30)
          {
            uint64_t v33 = ((char *)v31 - (_BYTE *)*a3) >> 3;
            uint64_t v34 = v30 - (void)*a3;
            uint64_t v35 = v34 >> 2;
            else {
              unint64_t v36 = v35;
            }
            if (v36) {
              v37 = (char *)sub_100006318((uint64_t)(a3 + 2), v36);
            }
            else {
              v37 = 0LL;
            }
            unsigned int v38 = (char **)&v37[8 * v33];
            *unsigned int v38 = v29;
            uint64_t v32 = (char *)(v38 + 1);
            uint64_t v40 = (char *)*a3;
            std::string::size_type v39 = (char *)a3[1];
            if (v39 != *a3)
            {
              do
              {
                uint64_t v41 = (char *)*((void *)v39 - 1);
                v39 -= 8;
                *--unsigned int v38 = v41;
              }

              while (v39 != v40);
              std::string::size_type v39 = (char *)*a3;
            }

            *a3 = v38;
            a3[1] = v32;
            a3[2] = &v37[8 * v36];
            if (v39) {
              operator delete(v39);
            }
          }

          else
          {
            *__int128 v31 = v28;
            uint64_t v32 = (char *)(v31 + 1);
          }

          a3[1] = v32;
        }

        ++v26;
      }

      while (v26 != v9);
    }
  }

void sub_100007208( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000725C(void **a1, unint64_t a2)
{
  int v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100005508();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_100006318(v3, a2);
    __int128 v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8LL];
    size_t v9 = &v6[8 * v8];
    uint64_t v11 = (char *)*a1;
    __int128 v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        uint64_t v13 = *((void *)v10 - 1);
        v10 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v10 != v11);
      __int128 v10 = (char *)*a1;
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

uint64_t sub_1000072F0(uint64_t a1, __int128 *a2)
{
  *(void *)a1 = off_1000145C8;
  *(_DWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 5;
  int v4 = (_BYTE *)(a1 + 16);
  if (SHIBYTE(v10) < 0)
  {
    sub_100004FE8(v4, __p[0], (unint64_t)__p[1]);
    int v5 = SHIBYTE(v10);
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    *(_OWORD *)int v4 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v10;
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
  }

  *(void *)a1 = off_1000146E0;
  *(void *)(a1 + 64) = 0LL;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  uint64_t v6 = (_BYTE *)(a1 + 88);
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8(v6, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v7 = *a2;
    *(void *)(a1 + 104) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v6 = v7;
  }

  *(void *)(a1 + 112) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 12std::istream::~istream(v2, v3 + 8) = 0LL;
  return a1;
}

void sub_1000073E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  unint64_t v18 = *v16;
  if (*v16)
  {
    *((void *)v15 + 9) = v18;
    operator delete(v18);
  }

  serialize::Prim::~Prim(v15);
  _Unwind_Resume(a1);
}

uint64_t sub_10000741C(uint64_t a1)
{
  *(void *)a1 = off_1000145C8;
  *(_DWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 2;
  uint64_t v2 = (_BYTE *)(a1 + 16);
  if (SHIBYTE(v6) < 0)
  {
    sub_100004FE8(v2, __p[0], (unint64_t)__p[1]);
    int v3 = SHIBYTE(v6);
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
    if (v3 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    *(_OWORD *)uint64_t v2 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v6;
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
  }

  *(void *)a1 = off_100014608;
  *(void *)(a1 + 72) = 0LL;
  *(void *)(a1 + 80) = 0LL;
  *(void *)(a1 + 64) = 0LL;
  *(_DWORD *)(a1 + 8std::istream::~istream(v2, v3 + 8) = 1008981770;
  *(_DWORD *)(a1 + 92) = 0;
  *(_DWORD *)(a1 + 96) = 0;
  *(_DWORD *)(a1 + 100) = 24;
  return a1;
}

void sub_1000074E0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000074FC(uint64_t a1, int a2)
{
  *(void *)a1 = off_1000145C8;
  *(_DWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 7;
  int v4 = (_BYTE *)(a1 + 16);
  if (SHIBYTE(v8) < 0)
  {
    sub_100004FE8(v4, __p[0], (unint64_t)__p[1]);
    int v5 = SHIBYTE(v8);
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
    if (v5 < 0) {
      operator delete(__p[0]);
    }
  }

  else
  {
    *(_OWORD *)int v4 = *(_OWORD *)__p;
    *(void *)(a1 + 32) = v8;
    *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
    *(void *)(a1 + 56) = 0LL;
    *(void *)(a1 + 40) = 0LL;
  }

  *(void *)a1 = off_100014770;
  *(_DWORD *)(a1 + 64) = a2;
  *(_OWORD *)(a1 + 6std::istream::~istream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_DWORD *)(a1 + 100) = 0;
  return a1;
}

void sub_1000075BC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_1000075D8(uint64_t a1, int a2, __int128 *a3)
{
  *(void *)a1 = off_1000145C8;
  *(_DWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 8;
  uint64_t v5 = a1 + 16;
  if (*((char *)a3 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)v5, *(void **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v6 = *a3;
    *(void *)(v5 + 16) = *((void *)a3 + 2);
    *(_OWORD *)uint64_t v5 = v6;
  }

  *(void *)(a1 + 40) = 0LL;
  *(void *)(a1 + 4std::istream::~istream(v2, v3 + 8) = 0LL;
  *(void *)(a1 + 56) = 0LL;
  *(void *)a1 = off_1000147B8;
  __asm { FMOV            V0.4S, #1.0 }

  *(_OWORD *)(a1 + 6std::istream::~istream(v2, v3 + 8) = _Q0;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 64) = a2;
  *(void *)(a1 + 92) = 0LL;
  *(void *)(a1 + 84) = 0LL;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  sub_1000076C8((void *)(a1 + 152), "st");
  return a1;
}

void sub_100007694(_Unwind_Exception *a1)
{
}

void *sub_1000076C8(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8LL) {
    sub_100005074();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8LL) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    __int128 v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000LL;
    *a1 = v6;
  }

  else
  {
    *((_BYTE *)a1 + 23) = v4;
    __int128 v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }

  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void *sub_100007778(void *a1, uint64_t *a2, uint64_t *a3, unint64_t a4)
{
  __int128 v6 = a2;
  uint64_t v8 = a1[2];
  float result = (void *)*a1;
  if (a4 > (v8 - (uint64_t)result) >> 3)
  {
    if (result)
    {
      a1[1] = result;
      operator delete(result);
      uint64_t v8 = 0LL;
      *a1 = 0LL;
      a1[1] = 0LL;
      a1[2] = 0LL;
    }

    if (a4 >> 61) {
      sub_100005508();
    }
    uint64_t v10 = v8 >> 2;
    if (v8 >> 2 <= a4) {
      uint64_t v10 = a4;
    }
    else {
      unint64_t v11 = v10;
    }
    sub_1000078C8(a1, v11);
    uint64_t v13 = (void *)a1[1];
    uint64_t v12 = (void **)(a1 + 1);
    float result = v13;
    __int128 v14 = (char *)v13;
    if (v6 != a3)
    {
      __int128 v14 = (char *)result;
      do
      {
        uint64_t v15 = *v6++;
        *(void *)__int128 v14 = v15;
        v14 += 8;
      }

      while (v6 != a3);
    }

char *sub_1000078C8(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_100005508();
  }
  float result = (char *)sub_100006318((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

uint64_t StlConverter::StlConverter(uint64_t a1, void *a2, __int128 *a3)
{
  *(void *)a1 = off_100014568;
  *(_OWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  if (*((char *)a3 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)(a1 + 40), *(void **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v5 = *a3;
    *(void *)(a1 + 56) = *((void *)a3 + 2);
    *(_OWORD *)(a1 + 40) = v5;
  }

  StlConverter::parseStl((void *)a1, a2);
  return a1;
}

void sub_100007988(_Unwind_Exception *exception_object)
{
  uint64_t v4 = *v2;
  if (*v2)
  {
    *(void *)(v1 + 16) = v4;
    operator delete(v4);
  }

  _Unwind_Resume(exception_object);
}

void StlConverter::parseStl(void *a1, void *a2)
{
  a1[8] = v6[16];
  memset(v4, 0, sizeof(v4));
  uint64_t v5 = 0LL;
  std::istream::seekg(a2, v4);
  else {
    StlConverter::parseStlAscii(a1, a2);
  }
}

void StlConverter::~StlConverter(StlConverter *this)
{
  *(void *)this = off_100014568;
  uint64_t v2 = (uint64_t *)*((void *)this + 1);
  int v3 = (uint64_t *)*((void *)this + 2);
  while (v2 != v3)
  {
    uint64_t v4 = *v2;
    if (*v2)
    {
      uint64_t v5 = *(void **)(v4 + 72);
      if (v5)
      {
        *(void *)(v4 + 80) = v5;
        operator delete(v5);
      }

      __int128 v6 = *(void **)(v4 + 48);
      if (v6)
      {
        *(void *)(v4 + 56) = v6;
        operator delete(v6);
      }

      uint64_t v7 = *(void **)(v4 + 24);
      if (v7)
      {
        *(void *)(v4 + 32) = v7;
        operator delete(v7);
      }

      operator delete((void *)v4);
    }

    ++v2;
  }

  uint64_t v8 = (void *)*((void *)this + 1);
  if (v8)
  {
    *((void *)this + 2) = v8;
    operator delete(v8);
  }

{
  void *v1;
  StlConverter::~StlConverter(this);
  operator delete(v1);
}

uint64_t StlConverter::isBinary(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 64) < 0x54uLL) {
    return 0LL;
  }
  sub_1000076C8(&v13, "solid");
  uint64_t v20 = 0LL;
  memset(v19, 0, sizeof(v19));
  uint64_t v5 = std::istream::seekg(a2, v19);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v12 - v6;
  if ((v13.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type size = v13.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type size = v13.__r_.__value_.__l.__size_;
  }
  std::istream::read(a2, v7, size);
  std::string::size_type v9 = v13.__r_.__value_.__s.__size_;
  if ((v13.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string::size_type v9 = v13.__r_.__value_.__l.__size_;
  }
  v7[v9] = 0;
  memset(v17, 0, sizeof(v17));
  uint64_t v18 = 0LL;
  std::istream::seekg(a2, v17);
  if (!std::string::compare(&v13, v7)
    && *(void *)(a1 + 64) >= 0x81uLL
    && ((std::istream::read(a2, v16, 128LL),
         uint64_t v15 = 0LL,
         memset(v14, 0, sizeof(v14)),
         std::istream::seekg(a2, v14),
         (v13.__r_.__value_.__s.__size_ & 0x80u) == 0)
      ? (std::string::size_type v10 = v13.__r_.__value_.__s.__size_)
      : (std::string::size_type v10 = v13.__r_.__value_.__l.__size_),
        v10 <= 0x73))
  {
    while (strncmp("facet normal", &v16[v10], 0xCuLL))
    {
      if (++v10 == 116) {
        goto LABEL_16;
      }
    }

    uint64_t v2 = 0LL;
  }

  else
  {
LABEL_16:
    uint64_t v2 = 1LL;
  }

  return v2;
}

void sub_100007D74(_Unwind_Exception *exception_object)
{
}

void StlConverter::addSolid(void *a1, uint64_t *a2)
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  int v3 = (char **)(a1 + 1);
  if (v4 == v5) {
    goto LABEL_39;
  }
  uint64_t size = __p.__r_.__value_.__s.__size_;
  __int128 v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    size_t v8 = __p.__r_.__value_.__s.__size_;
  }
  else {
    size_t v8 = __p.__r_.__value_.__l.__size_;
  }
  while (1)
  {
    uint64_t v9 = *(unsigned __int8 *)(*(void *)v4 + 23LL);
    int v10 = (char)v9;
    if ((v9 & 0x80u) != 0LL) {
      uint64_t v9 = *(void *)(*(void *)v4 + 8LL);
    }
    if (v8 != v9) {
      goto LABEL_18;
    }
    unint64_t v11 = v10 >= 0 ? *(unsigned __int8 **)v4 : **(unsigned __int8 ***)v4;
    if ((size & 0x80) != 0) {
      break;
    }
    if (!(_DWORD)size) {
      goto LABEL_20;
    }
    p_p = &__p;
    uint64_t v13 = size;
    while (p_p->__r_.__value_.__s.__data_[0] == *v11)
    {
      p_p = (std::string *)((char *)p_p + 1);
      ++v11;
      if (!--v13) {
        goto LABEL_20;
      }
    }

LABEL_18:
    v4 += 8LL;
    if (v4 == v5) {
      goto LABEL_39;
    }
  }

LABEL_20:
  __int128 v14 = &v37;
  sub_100005D68((uint64_t)&v37, v8 + 7);
  if ((v37.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    __int128 v14 = (std::string *)v37.__r_.__value_.__r.__words[0];
  }
  if (v8)
  {
    if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v15 = &__p;
    }
    else {
      uint64_t v15 = (std::string *)__p.__r_.__value_.__r.__words[0];
    }
    memmove(v14, v15, v8);
  }

  strcpy((char *)v14 + v8, "_solid_");
  std::to_string(&v36, (uint64_t)(a1[2] - a1[1]) >> 3);
  if ((v36.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    int64_t v16 = &v36;
  }
  else {
    int64_t v16 = (std::string *)v36.__r_.__value_.__r.__words[0];
  }
  if ((v36.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    std::string::size_type v17 = v36.__r_.__value_.__s.__size_;
  }
  else {
    std::string::size_type v17 = v36.__r_.__value_.__l.__size_;
  }
  uint64_t v18 = std::string::append(&v37, (const std::string::value_type *)v16, v17);
  std::string::size_type v19 = v18->__r_.__value_.__r.__words[0];
  v39[0] = v18->__r_.__value_.__l.__size_;
  *(void *)((char *)v39 + 7) = *(std::string::size_type *)((char *)&v18->__r_.__value_.__r.__words[1] + 7);
  unsigned __int8 v20 = v18->__r_.__value_.__s.__size_;
  v18->__r_.__value_.__l.__size_ = 0LL;
  v18->__r_.__value_.__l.__cap_ = 0LL;
  v18->__r_.__value_.__r.__words[0] = 0LL;
  __p.__r_.__value_.__r.__words[0] = v19;
  __p.__r_.__value_.__l.__size_ = v39[0];
  *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 7) = *(void *)((char *)v39 + 7);
  __p.__r_.__value_.__s.__size_ = v20;
LABEL_39:
  uint64_t v21 = (std::string *)operator new(0x60uLL);
  std::string::size_type v22 = v21;
  else {
    *uint64_t v21 = __p;
  }
  v22[3].__r_.__value_.__l.__cap_ = 0LL;
  *(_OWORD *)&v22[3].__r_.__value_.__l.__data_ = 0u;
  *(_OWORD *)&v22[2].__r_.__value_.__r.__words[1] = 0u;
  *(_OWORD *)&v22[1].__r_.__value_.__r.__words[2] = 0u;
  *(_OWORD *)&v22[1].__r_.__value_.__l.__data_ = 0u;
  unint64_t v23 = a1[3];
  a1[4] = v22;
  uint64_t v24 = (std::string **)a1[2];
  if ((unint64_t)v24 >= v23)
  {
    uint64_t v26 = ((char *)v24 - *v3) >> 3;
    uint64_t v27 = v23 - (void)*v3;
    uint64_t v28 = v27 >> 2;
    else {
      unint64_t v29 = v28;
    }
    if (v29)
    {
      unint64_t v30 = (char *)sub_100006318((uint64_t)(a1 + 3), v29);
      std::string::size_type v22 = (std::string *)a1[4];
    }

    else
    {
      unint64_t v30 = 0LL;
    }

    __int128 v31 = (std::string **)&v30[8 * v26];
    uint64_t v32 = &v30[8 * v29];
    *__int128 v31 = v22;
    int64_t v25 = v31 + 1;
    uint64_t v34 = (char *)a1[1];
    uint64_t v33 = (char *)a1[2];
    if (v33 != v34)
    {
      do
      {
        uint64_t v35 = (std::string *)*((void *)v33 - 1);
        v33 -= 8;
        *--__int128 v31 = v35;
      }

      while (v33 != v34);
      uint64_t v33 = *v3;
    }

    a1[1] = v31;
    a1[2] = v25;
    a1[3] = v32;
    if (v33) {
      operator delete(v33);
    }
  }

  else
  {
    char *v24 = v22;
    int64_t v25 = v24 + 1;
  }

  a1[2] = v25;
}

void sub_1000080E0( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *__p, uint64_t a22, int a23, __int16 a24, char a25, char a26)
{
  if (a26 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void StlConverter::addNormal(uint64_t a1, uint64_t *a2)
{
  if (!*(void *)(a1 + 32)) {
    return;
  }
  memset(&__p, 0, sizeof(__p));
  sub_100003638(a2, &__p);
  uint64_t v27 = 0x3F80000000000000LL;
  float v28 = 0.0;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    if (__p.__r_.__value_.__l.__size_ != 6) {
      goto LABEL_11;
    }
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }

  else
  {
    if (__p.__r_.__value_.__s.__size_ != 6) {
      goto LABEL_11;
    }
    p_p = &__p;
  }

  int data = (int)p_p->__r_.__value_.__l.__data_;
  int v6 = WORD2(p_p->__r_.__value_.__r.__words[0]);
  if (data == 1836216174 && v6 == 27745)
  {
    float Float = fileFormatUtils::getFloat(a2);
    *(float *)&uint64_t v27 = Float;
    float v8 = fileFormatUtils::getFloat(a2);
    *((float *)&v27 + 1) = v8;
    float v9 = fileFormatUtils::getFloat(a2);
    float v28 = v9;
    goto LABEL_12;
  }

void sub_100008328( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t StlConverter::addVertex(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (v2)
  {
    uint64_t v3 = *(void *)(v2 + 80) - *(void *)(v2 + 72);
    if (v3)
    {
      uint64_t v5 = result;
      uint64_t v6 = v3 >> 2;
      v12[2] = 0;
      fileFormatUtils::getFloat(a2);
      float Float = fileFormatUtils::getFloat(a2);
      *(float *)&v12[1] = Float;
      float v8 = fileFormatUtils::getFloat(a2);
      *(float *)uint64_t v12 = v8;
      float v9 = *(uint64_t **)(v5 + 32);
      unint64_t v10 = v9[4];
      if (v10 >= v9[5])
      {
        float result = sub_100005BCC(v9 + 3, (uint64_t)v12);
        unint64_t v11 = *(uint64_t **)(v5 + 32);
      }

      else
      {
        *(float *)unint64_t v10 = v8;
        *(float *)(v10 + 4) = Float;
        float result = v10 + 12;
        unint64_t v11 = v9;
        *(_DWORD *)(v10 + std::istream::~istream(v2, v3 + 8) = 0;
      }

      v9[4] = result;
      ++*(_DWORD *)(v11[9] + 4 * v6 - 4);
    }
  }

  return result;
}

void StlConverter::parseStlAscii(void *a1, void *a2)
{
  char v4 = 0;
  char v5 = 0;
  while (sub_100003370(a2, &__str))
  {
    std::string::size_type size = __str.__r_.__value_.__s.__size_;
    if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v28 + *(void *)(v28[0] - 24)), 0);
      std::string::operator=(&v30, &__str);
      sub_1000053F8((uint64_t)v29);
      memset(&v27, 0, sizeof(v27));
      sub_100003638(v28, &v27);
      if ((v5 & 1) == 0) {
        goto LABEL_16;
      }
      if ((v27.__r_.__value_.__s.__size_ & 0x80) != 0)
      {
        if (v27.__r_.__value_.__l.__size_ != 6) {
          goto LABEL_16;
        }
        __int128 v7 = (std::string *)v27.__r_.__value_.__r.__words[0];
      }

      else
      {
        if (v27.__r_.__value_.__s.__size_ != 6) {
          goto LABEL_16;
        }
        __int128 v7 = &v27;
      }

      int data = (int)v7->__r_.__value_.__l.__data_;
      int v9 = WORD2(v7->__r_.__value_.__r.__words[0]);
      if (data == 1953654134 && v9 == 30821)
      {
        StlConverter::addVertex((uint64_t)a1, v28);
LABEL_43:
        char v5 = 1;
        goto LABEL_82;
      }

LABEL_45:
      if (v12 != 8) {
        goto LABEL_50;
      }
      int v16 = 1;
      unint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
LABEL_47:
      if (v11->__r_.__value_.__r.__words[0] == 0x7465636166646E65LL)
      {
        char v4 = 0;
LABEL_61:
        char v5 = 0;
        goto LABEL_82;
      }

      if (!v16)
      {
        unint64_t v11 = &v27;
        if (v27.__r_.__value_.__s.__size_ == 5) {
          goto LABEL_68;
        }
        if (v27.__r_.__value_.__s.__size_ != 7)
        {
LABEL_66:
          if (v27.__r_.__value_.__s.__size_ != 8) {
            goto LABEL_82;
          }
          goto LABEL_80;
        }

        goto LABEL_52;
      }

      std::string::size_type v12 = v27.__r_.__value_.__l.__size_;
LABEL_50:
      if (v12 != 7) {
        goto LABEL_58;
      }
      int v16 = 1;
      unint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
LABEL_52:
      int v20 = (int)v11->__r_.__value_.__l.__data_;
      int v21 = *(_DWORD *)((char *)v11->__r_.__value_.__r.__words + 3);
      if (v20 == 1818521189 && v21 == 1886351212) {
        goto LABEL_61;
      }
      if (v16)
      {
        std::string::size_type v12 = v27.__r_.__value_.__l.__size_;
LABEL_58:
        if (v12 != 5) {
          goto LABEL_74;
        }
        int v16 = 1;
        unint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
        goto LABEL_68;
      }

      unint64_t v11 = &v27;
      if (v27.__r_.__value_.__s.__size_ != 5) {
        goto LABEL_66;
      }
      int v16 = 0;
LABEL_68:
      int v23 = (int)v11->__r_.__value_.__l.__data_;
      int v24 = v11->__r_.__value_.__s.__data_[4];
      if (v23 != 1768714099 || v24 != 100)
      {
        if (v16)
        {
          std::string::size_type v12 = v27.__r_.__value_.__l.__size_;
LABEL_74:
          if (v12 != 8) {
            goto LABEL_82;
          }
          unint64_t v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
        }

        else
        {
          if (v27.__r_.__value_.__s.__size_ != 8) {
            goto LABEL_82;
          }
          unint64_t v11 = &v27;
        }

LABEL_80:
        if (v11->__r_.__value_.__r.__words[0] == 0x64696C6F73646E65LL) {
          a1[4] = 0LL;
        }
        goto LABEL_82;
      }

      memset(&__p, 0, sizeof(__p));
      sub_100003638(v28, &__p);
      StlConverter::addSolid(a1, (uint64_t *)&__p);
LABEL_82:
    }
  }

  std::streambuf::~streambuf(v29);
  std::ios::~ios(&v31);
}

void sub_1000087F4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100003C84((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void StlConverter::parseStlBinary(void *a1, uint64_t a2)
{
  if (!(v54 >> 28))
  {
    sub_100004474((uint64_t *)(a1[4] + 48LL), v54);
    sub_100004474((uint64_t *)(a1[4] + 24LL), 3 * v54);
    if (v54)
    {
      unint64_t v4 = 0LL;
      unint64_t v5 = 84LL;
      do
      {
        if (v5 >= a1[8] + 50LL) {
          break;
        }
        std::istream::read(a2, &v42, 50LL);
        int v6 = v43;
        int v7 = v44;
        v41[0] = v42;
        v41[1] = v43;
        v41[2] = v44;
        float v8 = (uint64_t *)a1[4];
        int v9 = (_DWORD *)v8[7];
        if ((unint64_t)v9 >= v8[8])
        {
          uint64_t v10 = sub_100005BCC(v8 + 6, (uint64_t)v41);
          unint64_t v11 = (uint64_t *)a1[4];
        }

        else
        {
          *int v9 = v42;
          v9[1] = v6;
          uint64_t v10 = (uint64_t)(v9 + 3);
          unint64_t v11 = v8;
          v9[2] = v7;
        }

        v8[7] = v10;
        unint64_t v12 = v11[11];
        int v13 = (char *)v11[10];
        if ((unint64_t)v13 >= v12)
        {
          unint64_t v15 = (char *)v11[9];
          uint64_t v16 = (v13 - v15) >> 2;
          unint64_t v17 = v12 - (void)v15;
          unint64_t v18 = (uint64_t)(v12 - (void)v15) >> 1;
          if (v18 <= v16 + 1) {
            unint64_t v18 = v16 + 1;
          }
          if (v17 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v19 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v18;
          }
          if (v19)
          {
            int v20 = (char *)sub_100005D34((uint64_t)(v11 + 11), v19);
            unint64_t v15 = (char *)v11[9];
            int v13 = (char *)v11[10];
          }

          else
          {
            int v20 = 0LL;
          }

          uint64_t v21 = &v20[4 * v16];
          *(_DWORD *)uint64_t v21 = 3;
          int v14 = v21 + 4;
          while (v13 != v15)
          {
            int v22 = *((_DWORD *)v13 - 1);
            v13 -= 4;
            *((_DWORD *)v21 - 1) = v22;
            v21 -= 4;
          }

          v11[9] = (uint64_t)v21;
          v11[10] = (uint64_t)v14;
          v11[11] = (uint64_t)&v20[4 * v19];
          if (v15) {
            operator delete(v15);
          }
        }

        else
        {
          *(_DWORD *)int v13 = 3;
          int v14 = v13 + 4;
        }

        v11[10] = (uint64_t)v14;
        int v23 = (uint64_t *)a1[4];
        int v24 = v46;
        int v25 = v47;
        int v38 = v45;
        int v39 = v46;
        int v40 = v47;
        int v26 = (_DWORD *)v23[4];
        if ((unint64_t)v26 >= v23[5])
        {
          uint64_t v27 = sub_10000921C(v23 + 3, (uint64_t)&v38);
          float v28 = (uint64_t *)a1[4];
        }

        else
        {
          _DWORD *v26 = v45;
          v26[1] = v24;
          uint64_t v27 = (uint64_t)(v26 + 3);
          float v28 = v23;
          v26[2] = v25;
        }

        v23[4] = v27;
        int v29 = v49;
        int v30 = v50;
        int v38 = v48;
        int v39 = v49;
        int v40 = v50;
        uint64_t v31 = (_DWORD *)v28[4];
        if ((unint64_t)v31 >= v28[5])
        {
          uint64_t v32 = sub_10000921C(v28 + 3, (uint64_t)&v38);
          uint64_t v33 = (uint64_t *)a1[4];
        }

        else
        {
          *uint64_t v31 = v48;
          v31[1] = v29;
          uint64_t v32 = (uint64_t)(v31 + 3);
          uint64_t v33 = v28;
          v31[2] = v30;
        }

        v28[4] = v32;
        int v34 = v52;
        int v35 = v53;
        int v38 = v51;
        int v39 = v52;
        int v40 = v53;
        std::string v36 = (_DWORD *)v33[4];
        if ((unint64_t)v36 >= v33[5])
        {
          uint64_t v37 = sub_10000921C(v33 + 3, (uint64_t)&v38);
        }

        else
        {
          *std::string v36 = v51;
          v36[1] = v34;
          uint64_t v37 = (uint64_t)(v36 + 3);
          v36[2] = v35;
        }

        v5 += 50LL;
        v33[4] = v37;
        ++v4;
      }

      while (v4 < v54);
    }
  }

void StlConverter::createMesh(uint64_t a1, const void **a2, uint64_t a3, uint64_t a4, void *a5)
{
  unint64_t v5 = (char *)(a3 + 72);
  if (*(void *)(a3 + 80) != *(void *)(a3 + 72))
  {
    uint64_t v10 = (char *)operator new(0x128uLL);
    sub_100004864(a2, 47, (uint64_t)&v43);
    int v11 = *(char *)(a3 + 23);
    if (v11 >= 0) {
      unint64_t v12 = (const std::string::value_type *)a3;
    }
    else {
      unint64_t v12 = *(const std::string::value_type **)a3;
    }
    if (v11 >= 0) {
      std::string::size_type v13 = *(unsigned __int8 *)(a3 + 23);
    }
    else {
      std::string::size_type v13 = *(void *)(a3 + 8);
    }
    int v14 = std::string::append(&v43, v12, v13);
    __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    std::string::size_type cap = v14->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v15;
    v14->__r_.__value_.__l.__size_ = 0LL;
    v14->__r_.__value_.__l.__cap_ = 0LL;
    v14->__r_.__value_.__r.__words[0] = 0LL;
    sub_100004F44((uint64_t)v10, (__int128 *)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v16 = a5[7];
    unint64_t v17 = (void *)a5[6];
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v19 = a5[5];
      uint64_t v20 = ((uint64_t)v17 - v19) >> 3;
      uint64_t v21 = v16 - v19;
      uint64_t v22 = v21 >> 2;
      else {
        unint64_t v23 = v22;
      }
      if (v23) {
        int v24 = (char *)sub_100006318((uint64_t)(a5 + 7), v23);
      }
      else {
        int v24 = 0LL;
      }
      int v25 = &v24[8 * v20];
      int v26 = &v24[8 * v23];
      *(void *)int v25 = v10;
      unint64_t v18 = v25 + 8;
      float v28 = (char *)a5[5];
      uint64_t v27 = (char *)a5[6];
      if (v27 != v28)
      {
        do
        {
          uint64_t v29 = *((void *)v27 - 1);
          v27 -= 8;
          *((void *)v25 - 1) = v29;
          v25 -= 8;
        }

        while (v27 != v28);
        uint64_t v27 = (char *)a5[5];
      }

      a5[5] = v25;
      a5[6] = v18;
      a5[7] = v26;
      if (v27) {
        operator delete(v27);
      }
    }

    else
    {
      *unint64_t v17 = v10;
      unint64_t v18 = v17 + 1;
    }

    a5[6] = v18;
    if (v10 + 64 != v5) {
      sub_100005FF8( v10 + 64,  *(char **)(a3 + 72),  *(void *)(a3 + 80),  (uint64_t)(*(void *)(a3 + 80) - *(void *)(a3 + 72)) >> 2);
    }
    if (v10 + 160 != (char *)(a3 + 24)) {
      sub_100005DEC( (void *)v10 + 20,  *(uint64_t **)(a3 + 24),  *(uint64_t **)(a3 + 32),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2));
    }
    int v30 = (void **)(v10 + 88);
    sub_100004594( (void **)v10 + 11,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2));
    if (*(void *)(a3 + 32) != *(void *)(a3 + 24))
    {
      unint64_t v31 = 0LL;
      uint64_t v32 = v10 + 104;
      uint64_t v33 = (char *)*((void *)v10 + 12);
      do
      {
        if ((unint64_t)v33 >= *v32)
        {
          int v35 = (char *)*v30;
          uint64_t v36 = (v33 - (_BYTE *)*v30) >> 2;
          unint64_t v37 = v36 + 1;
          uint64_t v38 = *v32 - (void)v35;
          if (v38 >> 1 > v37) {
            unint64_t v37 = v38 >> 1;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            int v40 = (char *)sub_100005D34((uint64_t)(v10 + 104), v39);
            int v35 = (char *)*((void *)v10 + 11);
            uint64_t v33 = (char *)*((void *)v10 + 12);
          }

          else
          {
            int v40 = 0LL;
          }

          uint64_t v41 = &v40[4 * v36];
          *(_DWORD *)uint64_t v41 = v31;
          int v34 = v41 + 4;
          while (v33 != v35)
          {
            int v42 = *((_DWORD *)v33 - 1);
            v33 -= 4;
            *((_DWORD *)v41 - 1) = v42;
            v41 -= 4;
          }

          *((void *)v10 + 11) = v41;
          *((void *)v10 + 12) = v34;
          *((void *)v10 + 13) = &v40[4 * v39];
          if (v35) {
            operator delete(v35);
          }
        }

        else
        {
          *(_DWORD *)uint64_t v33 = v31;
          int v34 = v33 + 4;
        }

        *((void *)v10 + 12) = v34;
        ++v31;
        uint64_t v33 = v34;
      }

      while (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 32) - *(void *)(a3 + 24)) >> 2) > v31);
    }

    if (v10 + 184 != (char *)(a3 + 48)) {
      sub_100005DEC( (void *)v10 + 23,  *(uint64_t **)(a3 + 48),  *(uint64_t **)(a3 + 56),  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(a3 + 56) - *(void *)(a3 + 48)) >> 2));
    }
    *((_DWORD *)v10 + 64) = 1;
    std::string::operator=((std::string *)(v10 + 272), (const std::string *)(a4 + 16));
  }

void sub_100008E54( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  operator delete(v21);
  _Unwind_Resume(a1);
}

uint64_t StlConverter::makeStage(StlConverter *this)
{
  if (*((char *)this + 63) < 0)
  {
    sub_100004FE8(__p, *((void **)this + 5), *((void *)this + 6));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)((char *)this + 40);
    uint64_t v32 = *((void *)this + 7);
  }

  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, &v34);
  __int128 v37 = 0u;
  *(_OWORD *)uint64_t v36 = 0u;
  *(_OWORD *)int v35 = 0u;
  if (SHIBYTE(v32) < 0) {
    operator delete(__p[0]);
  }
  uint64_t inited = fileFormatUtils::Asset::initStage((fileFormatUtils::Asset *)v33);
  *(_DWORD *)(inited + 8std::istream::~istream(v2, v3 + 8) = 981668463;
  fileFormatUtils::Asset::getMaterialsPath((fileFormatUtils::Asset *)v33, (uint64_t)v29);
  uint64_t v3 = (char *)operator new(0x40uLL);
  if ((v30 & 0x80u) == 0) {
    size_t v4 = v30;
  }
  else {
    size_t v4 = (size_t)v29[1];
  }
  unint64_t v5 = v27;
  sub_100005D68((uint64_t)v27, v4 + 8);
  if (v28 < 0) {
    unint64_t v5 = (void **)v27[0];
  }
  if (v4)
  {
    if ((v30 & 0x80u) == 0) {
      int v6 = v29;
    }
    else {
      int v6 = (void **)v29[0];
    }
    memmove(v5, v6, v4);
  }

  strcpy((char *)v5 + v4, "/default");
  *(void *)uint64_t v3 = off_1000145C8;
  *((_DWORD *)v3 + 2) = 6;
  int v7 = v3 + 16;
  if (SHIBYTE(v28) < 0)
  {
    sub_100004FE8(v7, v27[0], (unint64_t)v27[1]);
    int v8 = SHIBYTE(v28);
    *((void *)v3 + 6) = 0LL;
    *((void *)v3 + 7) = 0LL;
    *((void *)v3 + 5) = 0LL;
    *(void *)uint64_t v3 = &off_100014728;
    if (v8 < 0) {
      operator delete(v27[0]);
    }
  }

  else
  {
    *(_OWORD *)int v7 = *(_OWORD *)v27;
    *((void *)v3 + 4) = v28;
    *((void *)v3 + 6) = 0LL;
    *((void *)v3 + 7) = 0LL;
    *((void *)v3 + 5) = 0LL;
    *(void *)uint64_t v3 = &off_100014728;
  }

  unint64_t v9 = *(void *)(inited + 56);
  uint64_t v10 = *(void **)(inited + 48);
  if ((unint64_t)v10 >= v9)
  {
    uint64_t v12 = *(void *)(inited + 40);
    uint64_t v13 = ((uint64_t)v10 - v12) >> 3;
    uint64_t v14 = v9 - v12;
    uint64_t v15 = v14 >> 2;
    else {
      unint64_t v16 = v15;
    }
    if (v16) {
      unint64_t v17 = (char *)sub_100006318(inited + 56, v16);
    }
    else {
      unint64_t v17 = 0LL;
    }
    unint64_t v18 = &v17[8 * v13];
    uint64_t v19 = &v17[8 * v16];
    *(void *)unint64_t v18 = v3;
    int v11 = v18 + 8;
    uint64_t v21 = *(char **)(inited + 40);
    uint64_t v20 = *(char **)(inited + 48);
    if (v20 != v21)
    {
      do
      {
        uint64_t v22 = *((void *)v20 - 1);
        v20 -= 8;
        *((void *)v18 - 1) = v22;
        v18 -= 8;
      }

      while (v20 != v21);
      uint64_t v20 = *(char **)(inited + 40);
    }

    *(void *)(inited + 40) = v18;
    *(void *)(inited + 4std::istream::~istream(v2, v3 + 8) = v11;
    *(void *)(inited + 56) = v19;
    if (v20) {
      operator delete(v20);
    }
  }

  else
  {
    void *v10 = v3;
    int v11 = v10 + 1;
  }

  *(void *)(inited + 4std::istream::~istream(v2, v3 + 8) = v11;
  fileFormatUtils::Asset::getGeomPath((fileFormatUtils::Asset *)v33, (uint64_t)v27);
  int v25 = (uint64_t *)*((void *)this + 1);
  int v24 = (uint64_t *)*((void *)this + 2);
  while (v25 != v24)
    StlConverter::createMesh(v23, (const void **)v27, *v25++, (uint64_t)v3, (void *)inited);
  if (SHIBYTE(v28) < 0) {
    operator delete(v27[0]);
  }
  if (SHIBYTE(v37) < 0) {
    operator delete(v36[1]);
  }
  if (SHIBYTE(v36[0]) < 0) {
    operator delete(v35[0]);
  }
  return inited;
}

void sub_100009190( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, void *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, char a27)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  operator delete(v27);
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100004E10((uint64_t)&a27);
  _Unwind_Resume(a1);
}

uint64_t sub_10000921C(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x1555555555555555LL) {
    sub_100005508();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 2);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0xAAAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x1555555555555555LL;
  }
  else {
    unint64_t v9 = v5;
  }
  uint64_t v19 = a1 + 2;
  uint64_t v10 = (char *)sub_10000551C(v7, v9);
  int v11 = &v10[12 * v4];
  std::string __p = v10;
  unint64_t v16 = v11;
  unint64_t v18 = &v10[12 * v12];
  *(void *)int v11 = *(void *)a2;
  *((_DWORD *)v11 + 2) = *(_DWORD *)(a2 + 8);
  unint64_t v17 = v11 + 12;
  sub_100005B6C(a1, &__p);
  uint64_t v13 = a1[1];
  if (v17 != v16) {
    unint64_t v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
  }
  if (__p) {
    operator delete(__p);
  }
  return v13;
}

void sub_100009338( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void ObjConverter::Group::removeLastSubMaterialIfEmpty(ObjConverter::Group *this)
{
  uint64_t v1 = *((void *)this + 1);
  if (v1 != *(void *)this)
  {
    uint64_t v3 = *(void ***)(v1 - 8);
    unint64_t v4 = v3[1];
    if (v4 == *v3)
    {
      if (v4) {
        operator delete(v4);
      }
      operator delete(v3);
      *((void *)this + 1) -= 8LL;
    }
  }

void ObjConverter::Group::setMaterial(ObjConverter::Group *this, int a2)
{
  *((void *)this + 3) = 0LL;
  for (uint64_t i = *(char **)this; i != *((char **)this + 1); i += 8)
  {
    if (*(_DWORD *)(*(void *)i + 24LL) == a2)
    {
      *((void *)this + 3) = *(void *)i;
      return;
    }
  }

  ObjConverter::Group::removeLastSubMaterialIfEmpty(this);
  unint64_t v5 = operator new(0x20uLL);
  v5[1] = 0LL;
  v5[2] = 0LL;
  *unint64_t v5 = 0LL;
  *((_DWORD *)v5 + 6) = a2;
  unint64_t v6 = *((void *)this + 2);
  *((void *)this + 3) = v5;
  uint64_t v7 = (void *)*((void *)this + 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v9 = ((uint64_t)v7 - *(void *)this) >> 3;
    uint64_t v10 = v6 - *(void *)this;
    uint64_t v11 = v10 >> 2;
    else {
      unint64_t v12 = v11;
    }
    if (v12)
    {
      uint64_t v13 = (char *)sub_100006318((uint64_t)this + 16, v12);
      unint64_t v5 = (void *)*((void *)this + 3);
    }

    else
    {
      uint64_t v13 = 0LL;
    }

    uint64_t v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    *(void *)uint64_t v14 = v5;
    unint64_t v8 = v14 + 8;
    unint64_t v17 = *(char **)this;
    unint64_t v16 = (char *)*((void *)this + 1);
    if (v16 != *(char **)this)
    {
      do
      {
        uint64_t v18 = *((void *)v16 - 1);
        v16 -= 8;
        *((void *)v14 - 1) = v18;
        v14 -= 8;
      }

      while (v16 != v17);
      unint64_t v16 = *(char **)this;
    }

    *(void *)this = v14;
    *((void *)this + 1) = v8;
    *((void *)this + 2) = v15;
    if (v16) {
      operator delete(v16);
    }
  }

  else
  {
    *uint64_t v7 = v5;
    unint64_t v8 = v7 + 1;
  }

  *((void *)this + 1) = v8;
}

void ObjConverter::Group::appendIndices(ObjConverter::Group *this, int a2, int a3, int a4)
{
  unint64_t v8 = (char *)this + 48;
  unint64_t v9 = *((void *)this + 6);
  uint64_t v10 = (char *)*((void *)this + 5);
  if ((unint64_t)v10 >= v9)
  {
    unint64_t v12 = (char *)*((void *)this + 4);
    uint64_t v13 = (v10 - v12) >> 2;
    unint64_t v14 = v9 - (void)v12;
    unint64_t v15 = (uint64_t)(v9 - (void)v12) >> 1;
    if (v15 <= v13 + 1) {
      unint64_t v15 = v13 + 1;
    }
    if (v14 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v16 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v16 = v15;
    }
    if (v16)
    {
      unint64_t v17 = (char *)sub_100005D34((uint64_t)v8, v16);
      unint64_t v12 = (char *)*((void *)this + 4);
      uint64_t v10 = (char *)*((void *)this + 5);
    }

    else
    {
      unint64_t v17 = 0LL;
    }

    uint64_t v18 = &v17[4 * v13];
    uint64_t v19 = &v17[4 * v16];
    *(_DWORD *)uint64_t v18 = a2;
    uint64_t v11 = v18 + 4;
    while (v10 != v12)
    {
      int v20 = *((_DWORD *)v10 - 1);
      v10 -= 4;
      *((_DWORD *)v18 - 1) = v20;
      v18 -= 4;
    }

    *((void *)this + 4) = v18;
    *((void *)this + 5) = v11;
    *((void *)this + 6) = v19;
    if (v12) {
      operator delete(v12);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v10 = a2;
    uint64_t v11 = v10 + 4;
  }

  unint64_t v21 = *((void *)this + 9);
  *((void *)this + 5) = v11;
  uint64_t v22 = (char *)*((void *)this + 8);
  if ((unint64_t)v22 >= v21)
  {
    int v24 = (char *)*((void *)this + 7);
    uint64_t v25 = (v22 - v24) >> 2;
    unint64_t v26 = v21 - (void)v24;
    unint64_t v27 = (uint64_t)(v21 - (void)v24) >> 1;
    if (v27 <= v25 + 1) {
      unint64_t v27 = v25 + 1;
    }
    if (v26 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v28 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v28 = v27;
    }
    if (v28)
    {
      uint64_t v29 = (char *)sub_100005D34((uint64_t)this + 72, v28);
      int v24 = (char *)*((void *)this + 7);
      uint64_t v22 = (char *)*((void *)this + 8);
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    unsigned __int8 v30 = &v29[4 * v25];
    unint64_t v31 = &v29[4 * v28];
    *(_DWORD *)unsigned __int8 v30 = a3;
    uint64_t v23 = v30 + 4;
    while (v22 != v24)
    {
      int v32 = *((_DWORD *)v22 - 1);
      v22 -= 4;
      *((_DWORD *)v30 - 1) = v32;
      v30 -= 4;
    }

    *((void *)this + 7) = v30;
    *((void *)this + std::istream::~istream(v2, v3 + 8) = v23;
    *((void *)this + 9) = v31;
    if (v24) {
      operator delete(v24);
    }
  }

  else
  {
    *(_DWORD *)uint64_t v22 = a3;
    uint64_t v23 = v22 + 4;
  }

  unint64_t v33 = *((void *)this + 13);
  *((void *)this + std::istream::~istream(v2, v3 + 8) = v23;
  std::string v34 = (char *)*((void *)this + 12);
  if ((unint64_t)v34 < v33)
  {
    *(_DWORD *)std::string v34 = a4;
    int v35 = v34 + 4;
    goto LABEL_49;
  }

  uint64_t v36 = (char *)*((void *)this + 11);
  uint64_t v37 = (v34 - v36) >> 2;
  if ((unint64_t)(v37 + 1) >> 62) {
LABEL_50:
  }
    sub_100005508();
  unint64_t v38 = v33 - (void)v36;
  unint64_t v39 = (uint64_t)(v33 - (void)v36) >> 1;
  if (v39 <= v37 + 1) {
    unint64_t v39 = v37 + 1;
  }
  if (v38 >= 0x7FFFFFFFFFFFFFFCLL) {
    unint64_t v40 = 0x3FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v40 = v39;
  }
  if (v40)
  {
    uint64_t v41 = (char *)sub_100005D34((uint64_t)this + 104, v40);
    uint64_t v36 = (char *)*((void *)this + 11);
    std::string v34 = (char *)*((void *)this + 12);
  }

  else
  {
    uint64_t v41 = 0LL;
  }

  int v42 = &v41[4 * v37];
  std::string v43 = &v41[4 * v40];
  *(_DWORD *)int v42 = a4;
  int v35 = v42 + 4;
  while (v34 != v36)
  {
    int v44 = *((_DWORD *)v34 - 1);
    v34 -= 4;
    *((_DWORD *)v42 - 1) = v44;
    v42 -= 4;
  }

  *((void *)this + 11) = v42;
  *((void *)this + 12) = v35;
  *((void *)this + 13) = v43;
  if (v36) {
    operator delete(v36);
  }
LABEL_49:
  *((void *)this + 12) = v35;
}

uint64_t ObjConverter::ObjConverter(uint64_t a1, void *a2, uint64_t a3, __int128 *a4, uint64_t a5)
{
  *(_OWORD *)(a1 + std::istream::~istream(v2, v3 + 8) = 0u;
  *(void *)(a1 + 112) = 0LL;
  *(void *)a1 = off_100014598;
  *(void *)(a1 + 104) = a1 + 112;
  *(void *)(a1 + 120) = 0LL;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 8std::istream::~istream(v2, v3 + 8) = 0u;
  *(void *)(a1 + 200) = 0LL;
  *(void *)(a1 + 192) = 0LL;
  *(_OWORD *)(a1 + 12std::istream::~istream(v2, v3 + 8) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(void *)(a1 + 176) = 0LL;
  *(_OWORD *)(a1 + 160) = 0u;
  *(void *)(a1 + 184) = a1 + 192;
  *(void *)(a1 + 20std::istream::~istream(v2, v3 + 8) = -1LL;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_OWORD *)(a1 + 232) = 0u;
  if (*(char *)(a3 + 23) < 0)
  {
    sub_100004FE8(__p, *(void **)a3, *(void *)(a3 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a3;
    uint64_t v14 = *(void *)(a3 + 16);
  }

  fileFormatUtils::makeValidIdentifier((uint64_t *)__p, (std::string *)(a1 + 256));
  *(_OWORD *)(a1 + 296) = 0u;
  *(_OWORD *)(a1 + 312) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  if (SHIBYTE(v14) < 0) {
    operator delete(__p[0]);
  }
  if (*((char *)a4 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)(a1 + 328), *(void **)a4, *((void *)a4 + 1));
  }

  else
  {
    __int128 v9 = *a4;
    *(void *)(a1 + 344) = *((void *)a4 + 2);
    *(_OWORD *)(a1 + 32std::istream::~istream(v2, v3 + 8) = v9;
  }

  *(void *)(a1 + 352) = a5;
  sub_1000076C8(v11, (char *)&unk_100013692);
  ObjConverter::setGroup(a1, (uint64_t)v11);
  if (v12 < 0) {
    operator delete(v11[0]);
  }
  ObjConverter::parseObj((uint64_t *)a1, a2);
  return a1;
}

void sub_1000098DC( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  unint64_t v21 = *v19;
  if (*v19)
  {
    *(void *)(v15 + 224) = v21;
    operator delete(v21);
  }

  sub_10000DF54(v17, *(char **)(v15 + 192));
  sub_10000E030(&__p);
  std::string __p = v19 - 10;
  sub_10000DFA4(&__p);
  sub_10000DF54(v16, *(char **)(v15 + 112));
  uint64_t v22 = *(void **)(v15 + 80);
  if (v22)
  {
    *(void *)(v15 + 8std::istream::~istream(v2, v3 + 8) = v22;
    operator delete(v22);
  }

  uint64_t v23 = *(void **)(v15 + 56);
  if (v23)
  {
    *(void *)(v15 + 64) = v23;
    operator delete(v23);
  }

  int v24 = *(void **)(v15 + 32);
  if (v24)
  {
    *(void *)(v15 + 40) = v24;
    operator delete(v24);
  }

  uint64_t v25 = *v18;
  if (*v18)
  {
    *(void *)(v15 + 16) = v25;
    operator delete(v25);
  }

  _Unwind_Resume(a1);
}

void sub_1000099B0( int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  JUMPOUT(0x100009924LL);
}

void ObjConverter::setGroup(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100004FE8(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }

  else if (*(_BYTE *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }

  sub_1000076C8(&__p, "default");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v7);
  std::string __p = v7;
  uint64_t v4 = sub_10000E0E8(a1 + 104, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 112 == v4)
  {
    unint64_t v6 = operator new(0x90uLL);
    sub_10000D4BC((uint64_t)v6, *(_DWORD *)(a1 + 208));
    *(void *)(a1 + 12std::istream::~istream(v2, v3 + 8) = v6;
    v7.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    sub_10000E9BC( (uint64_t **)(a1 + 104),  (const void **)&__p.__r_.__value_.__l.__data_,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v7)[7] = (uint64_t)v6;
  }

  else
  {
    unint64_t v5 = *(ObjConverter::Group **)(v4 + 56);
    *(void *)(a1 + 12std::istream::~istream(v2, v3 + 8) = v5;
    ObjConverter::Group::setMaterial(v5, *(_DWORD *)(a1 + 208));
  }

void sub_100009AE8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void ObjConverter::parseObj(uint64_t *a1, void *a2)
{
  while (sub_10000BDB8(a2, &__str))
  {
    std::string::size_type size = __str.__r_.__value_.__s.__size_;
    if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v15 + *(void *)(v15[0] - 24)), 0);
      std::string::operator=(&v17, &__str);
      sub_1000053F8((uint64_t)v16);
      memset(&v14, 0, sizeof(v14));
      sub_100003638(v15, &v14);
      if ((char)v14.__r_.__value_.__s.__size_ < 0)
      {
        std::string::size_type v7 = v14.__r_.__value_.__l.__size_;
        if (v14.__r_.__value_.__l.__size_ == 1 && *v14.__r_.__value_.__l.__data_ == 118)
        {
LABEL_48:
          ObjConverter::addVertex(a1, v15);
          goto LABEL_52;
        }

        if (v14.__r_.__value_.__l.__size_ == 2)
        {
          if (*(_WORD *)v14.__r_.__value_.__l.__data_ == 29814) {
            goto LABEL_43;
          }
          std::string::size_type v7 = v14.__r_.__value_.__l.__size_;
          if (*(_WORD *)v14.__r_.__value_.__l.__data_ == 28278) {
            goto LABEL_42;
          }
        }

        if (v7 == 1)
        {
          int v8 = *v14.__r_.__value_.__l.__data_;
          if (v8 == 102) {
            goto LABEL_44;
          }
          std::string::size_type v7 = v14.__r_.__value_.__l.__size_;
          if (v14.__r_.__value_.__l.__size_ == 1 && (v8 | 8) == 0x6F) {
            goto LABEL_49;
          }
        }

        if (v7 != 6) {
          goto LABEL_52;
        }
        unint64_t v6 = (std::string *)v14.__r_.__value_.__r.__words[0];
        if (*(_DWORD *)v14.__r_.__value_.__l.__data_ == 1835365237
          && *(_WORD *)(v14.__r_.__value_.__r.__words[0] + 4) == 27764)
        {
LABEL_45:
          sub_10000C12C(v15, &__p);
          ObjConverter::setMaterial((uint64_t)a1, (uint64_t)&__p);
          goto LABEL_50;
        }

        if (v14.__r_.__value_.__l.__size_ != 6) {
          goto LABEL_52;
        }
        goto LABEL_30;
      }

      switch(v14.__r_.__value_.__s.__size_)
      {
        case 1u:
          if (v14.__r_.__value_.__s.__data_[0] <= 0x6Eu)
          {
            if (v14.__r_.__value_.__s.__data_[0] == 102)
            {
LABEL_44:
              ObjConverter::addFace(a1, v15);
              goto LABEL_52;
            }

            if (v14.__r_.__value_.__s.__data_[0] != 103) {
              goto LABEL_52;
            }
LABEL_49:
            sub_10000C12C(v15, &__p);
            ObjConverter::setGroup((uint64_t)a1, (uint64_t)&__p);
LABEL_50:
            goto LABEL_52;
          }

          if (v14.__r_.__value_.__s.__data_[0] == 111) {
            goto LABEL_49;
          }
          if (v14.__r_.__value_.__s.__data_[0] == 118) {
            goto LABEL_48;
          }
LABEL_52:
          break;
        case 2u:
          if (LOWORD(v14.__r_.__value_.__l.__data_) == 29814)
          {
LABEL_43:
            ObjConverter::addUV(a1, v15);
            goto LABEL_52;
          }

          if (LOWORD(v14.__r_.__value_.__l.__data_) == 28278)
          {
LABEL_42:
            ObjConverter::addNormal(a1, v15);
            goto LABEL_52;
          }

          goto LABEL_52;
        case 6u:
          if (LODWORD(v14.__r_.__value_.__l.__data_) == 1835365237 && WORD2(v14.__r_.__value_.__r.__words[0]) == 27764) {
            goto LABEL_45;
          }
          unint64_t v6 = &v14;
LABEL_30:
          int data = (int)v6->__r_.__value_.__l.__data_;
          int v11 = WORD2(v6->__r_.__value_.__r.__words[0]);
          if (data == 1819047021 && v11 == 25193)
          {
            sub_10000C12C(v15, &__p);
            ObjConverter::loadMaterialFile((uint64_t)a1, (uint64_t)&__p);
            goto LABEL_50;
          }

          goto LABEL_52;
      }
    }
  }

  ObjConverter::checkLastSubMaterials((ObjConverter *)a1);
  std::streambuf::~streambuf(v16);
  std::ios::~ios(&v18);
}

void sub_100009E6C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  sub_100003C84((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void ObjConverter::~ObjConverter(ObjConverter *this)
{
  *(void *)this = off_100014598;
  uint64_t v2 = (char *)this + 112;
  unint64_t v3 = (char *)this + 104;
  uint64_t v4 = (char *)*((void *)this + 13);
  if (v4 != (char *)this + 112)
  {
    do
    {
      uint64_t v5 = *((void *)v4 + 7);
      if (v5)
      {
        unint64_t v6 = (void *)sub_10000D2F4(v5);
        operator delete(v6);
      }

      std::string::size_type v7 = (char *)*((void *)v4 + 1);
      if (v7)
      {
        do
        {
          int v8 = v7;
          std::string::size_type v7 = *(char **)v7;
        }

        while (v7);
      }

      else
      {
        do
        {
          int v8 = (char *)*((void *)v4 + 2);
          BOOL v9 = *(void *)v8 == (void)v4;
          uint64_t v4 = v8;
        }

        while (!v9);
      }

      uint64_t v4 = v8;
    }

    while (v8 != v2);
  }

  uint64_t v10 = (void *)*((void *)this + 27);
  if (v10)
  {
    *((void *)this + 2std::istream::~istream(v2, v3 + 8) = v10;
    operator delete(v10);
  }

  sub_10000DF54((uint64_t)this + 184, *((char **)this + 24));
  uint64_t v15 = (void **)((char *)this + 160);
  sub_10000E030(&v15);
  uint64_t v15 = (void **)((char *)this + 136);
  sub_10000DFA4(&v15);
  sub_10000DF54((uint64_t)v3, *((char **)this + 14));
  int v11 = (void *)*((void *)this + 10);
  if (v11)
  {
    *((void *)this + 11) = v11;
    operator delete(v11);
  }

  char v12 = (void *)*((void *)this + 7);
  if (v12)
  {
    *((void *)this + std::istream::~istream(v2, v3 + 8) = v12;
    operator delete(v12);
  }

  uint64_t v13 = (void *)*((void *)this + 4);
  if (v13)
  {
    *((void *)this + 5) = v13;
    operator delete(v13);
  }

  std::string v14 = (void *)*((void *)this + 1);
  if (v14)
  {
    *((void *)this + 2) = v14;
    operator delete(v14);
  }

{
  void *v1;
  ObjConverter::~ObjConverter(this);
  operator delete(v1);
}

void ObjConverter::setMaterial(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100004FE8(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }

  else if (*(_BYTE *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }

  sub_1000076C8(&__p, "white");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v17);
  std::string __p = v17;
  uint64_t v4 = sub_10000E0E8(a1 + 184, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 192 == v4)
  {
    unint64_t v5 = *(void *)(a1 + 144);
    if (v5 >= *(void *)(a1 + 152))
    {
      uint64_t v7 = sub_10000DE34((uint64_t *)(a1 + 136), (__int128 *)&__p);
    }

    else
    {
      if ((char)__p.__r_.__value_.__s.__size_ < 0)
      {
        sub_100004FE8(*(_BYTE **)(a1 + 144), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }

      else
      {
        __int128 v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v5 + 16) = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)unint64_t v5 = v6;
      }

      uint64_t v7 = v5 + 24;
      *(void *)(a1 + 144) = v5 + 24;
    }

    *(void *)(a1 + 144) = v7;
    sub_10000D3A0(&v17, (__int128 *)&__p);
    unint64_t v8 = *(void *)(a1 + 168);
    if (v8 >= *(void *)(a1 + 176))
    {
      uint64_t v12 = sub_10000E1DC((uint64_t *)(a1 + 160), (uint64_t)&v17);
      int v13 = SHIBYTE(v19);
      *(void *)(a1 + 16std::istream::~istream(v2, v3 + 8) = v12;
      if (v13 < 0) {
        operator delete(v18[0]);
      }
    }

    else
    {
      *(void *)unint64_t v8 = v17.__r_.__value_.__r.__words[0];
      std::string::size_type size = v17.__r_.__value_.__l.__size_;
      *(void *)(v8 + std::istream::~istream(v2, v3 + 8) = v17.__r_.__value_.__l.__size_;
      unint64_t v10 = v8 + 8;
      std::string::size_type cap = v17.__r_.__value_.__l.__cap_;
      *(void *)(v8 + 16) = v17.__r_.__value_.__l.__cap_;
      if (cap)
      {
        *(void *)(size + 16) = v10;
        *(_OWORD *)&v17.__r_.__value_.__l.__data_ = (unint64_t)&v17.__r_.__value_.__l.__size_;
        v17.__r_.__value_.__l.__cap_ = 0LL;
      }

      else
      {
        *(void *)unint64_t v8 = v10;
      }

      __int128 v14 = *(_OWORD *)v18;
      *(void *)(v8 + 40) = v19;
      *(_OWORD *)(v8 + 24) = v14;
      v18[1] = 0LL;
      uint64_t v19 = 0LL;
      v18[0] = 0LL;
      *(void *)(a1 + 16std::istream::~istream(v2, v3 + 8) = v8 + 48;
    }

    sub_10000D410((uint64_t)&v17, (void *)v17.__r_.__value_.__l.__size_);
    int v15 = -1431655765 * ((*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3) - 1;
    *(_DWORD *)(a1 + 20std::istream::~istream(v2, v3 + 8) = v15;
    v17.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    *((_DWORD *)sub_10000E5B0( (uint64_t **)(a1 + 184),  (const void **)&__p.__r_.__value_.__l.__data_,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v17)
    + 14) = v15;
  }

  else
  {
    *(_DWORD *)(a1 + 20std::istream::~istream(v2, v3 + 8) = *(_DWORD *)(v4 + 56);
  }

  uint64_t v16 = *(ObjConverter::Group **)(a1 + 128);
  if (v16) {
    ObjConverter::Group::setMaterial(v16, *(_DWORD *)(a1 + 208));
  }
}

void sub_10000A274( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000A2B4(uint64_t a1)
{
  return a1;
}

void ObjConverter::updateMaterial(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    unint64_t v3 = *(void *)(a2 + 8);
    if (v3)
    {
      sub_100004FE8(&__p, *(void **)a2, v3);
      goto LABEL_7;
    }
  }

  else if (*(_BYTE *)(a2 + 23))
  {
    std::string __p = *(std::string *)a2;
    goto LABEL_7;
  }

  sub_1000076C8(&__p, "white");
LABEL_7:
  fileFormatUtils::makeValidIdentifier((uint64_t *)&__p, &v16);
  std::string __p = v16;
  uint64_t v4 = sub_10000E0E8(a1 + 184, (const void **)&__p.__r_.__value_.__l.__data_);
  if (a1 + 192 == v4)
  {
    unint64_t v5 = *(void *)(a1 + 144);
    if (v5 >= *(void *)(a1 + 152))
    {
      uint64_t v7 = sub_10000DE34((uint64_t *)(a1 + 136), (__int128 *)&__p);
    }

    else
    {
      if ((char)__p.__r_.__value_.__s.__size_ < 0)
      {
        sub_100004FE8(*(_BYTE **)(a1 + 144), __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      }

      else
      {
        __int128 v6 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
        *(void *)(v5 + 16) = __p.__r_.__value_.__l.__cap_;
        *(_OWORD *)unint64_t v5 = v6;
      }

      uint64_t v7 = v5 + 24;
      *(void *)(a1 + 144) = v5 + 24;
    }

    *(void *)(a1 + 144) = v7;
    sub_10000D3A0(&v16, (__int128 *)&__p);
    unint64_t v8 = *(void *)(a1 + 168);
    if (v8 >= *(void *)(a1 + 176))
    {
      uint64_t v12 = sub_10000E1DC((uint64_t *)(a1 + 160), (uint64_t)&v16);
      int v13 = SHIBYTE(v18);
      *(void *)(a1 + 16std::istream::~istream(v2, v3 + 8) = v12;
      if (v13 < 0) {
        operator delete(v17[0]);
      }
    }

    else
    {
      *(void *)unint64_t v8 = v16.__r_.__value_.__r.__words[0];
      std::string::size_type size = v16.__r_.__value_.__l.__size_;
      *(void *)(v8 + std::istream::~istream(v2, v3 + 8) = v16.__r_.__value_.__l.__size_;
      unint64_t v10 = v8 + 8;
      std::string::size_type cap = v16.__r_.__value_.__l.__cap_;
      *(void *)(v8 + 16) = v16.__r_.__value_.__l.__cap_;
      if (cap)
      {
        *(void *)(size + 16) = v10;
        *(_OWORD *)&v16.__r_.__value_.__l.__data_ = (unint64_t)&v16.__r_.__value_.__l.__size_;
        v16.__r_.__value_.__l.__cap_ = 0LL;
      }

      else
      {
        *(void *)unint64_t v8 = v10;
      }

      __int128 v14 = *(_OWORD *)v17;
      *(void *)(v8 + 40) = v18;
      *(_OWORD *)(v8 + 24) = v14;
      v17[1] = 0LL;
      uint64_t v18 = 0LL;
      v17[0] = 0LL;
      *(void *)(a1 + 16std::istream::~istream(v2, v3 + 8) = v8 + 48;
    }

    sub_10000D410((uint64_t)&v16, (void *)v16.__r_.__value_.__l.__size_);
    int v15 = -1431655765 * ((*(void *)(a1 + 144) - *(void *)(a1 + 136)) >> 3) - 1;
    *(_DWORD *)(a1 + 212) = v15;
    v16.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
    *((_DWORD *)sub_10000E5B0( (uint64_t **)(a1 + 184),  (const void **)&__p.__r_.__value_.__l.__data_,  (uint64_t)&std::piecewise_construct,  (__int128 **)&v16)
    + 14) = v15;
  }

  else
  {
    *(_DWORD *)(a1 + 212) = *(_DWORD *)(v4 + 56);
  }

void sub_10000A504( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  *(void *)(v20 + 144) = v21;
  if (a20 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t ObjConverter::addVertex(uint64_t *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = fileFormatUtils::getFloat(a2);
  *(float *)std::string v17 = Float;
  *(float *)&v17[1] = v5;
  *(float *)&v17[2] = v6;
  uint64_t v7 = (float *)a1[2];
  if ((unint64_t)v7 >= a1[3])
  {
    uint64_t v8 = sub_100005BCC(a1 + 1, (uint64_t)v17);
  }

  else
  {
    *uint64_t v7 = Float;
    v7[1] = v5;
    uint64_t v8 = (uint64_t)(v7 + 3);
    v7[2] = v6;
  }

  a1[2] = v8;
  unint64_t v9 = a2[5];
  unint64_t v10 = a2[6];
  if (v9 >= v10)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t *))(a2[2] + 56))(a2 + 2);
    if (!result) {
      return result;
    }
  }

  else
  {
    uint64_t result = v10 - v9;
    if (v10 == v9) {
      return result;
    }
  }

  float v12 = fileFormatUtils::getFloat(a2);
  float v13 = fileFormatUtils::getFloat(a2);
  float v14 = fileFormatUtils::getFloat(a2);
  *(float *)std::string v16 = v12;
  *(float *)&v16[1] = v13;
  *(float *)&v16[2] = v14;
  int v15 = (float *)a1[5];
  if ((unint64_t)v15 >= a1[6])
  {
    uint64_t result = sub_100005BCC(a1 + 4, (uint64_t)v16);
  }

  else
  {
    *int v15 = v12;
    v15[1] = v13;
    uint64_t result = (uint64_t)(v15 + 3);
    uint64_t v15[2] = v14;
  }

  a1[5] = result;
  return result;
}

void ObjConverter::addUV(void *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = v5;
  unint64_t v7 = a1[9];
  uint64_t v8 = (float *)a1[8];
  if ((unint64_t)v8 >= v7)
  {
    uint64_t v10 = a1[7];
    uint64_t v11 = ((uint64_t)v8 - v10) >> 3;
    unint64_t v12 = v7 - v10;
    unint64_t v13 = (uint64_t)(v7 - v10) >> 2;
    if (v13 <= v11 + 1) {
      unint64_t v13 = v11 + 1;
    }
    if (v12 >= 0x7FFFFFFFFFFFFFF8LL) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v13;
    }
    int v15 = (char *)sub_100006318((uint64_t)(a1 + 9), v14);
    std::string v16 = &v15[8 * v11];
    uint64_t v18 = &v15[8 * v17];
    *(float *)std::string v16 = Float;
    *((float *)v16 + 1) = v6;
    unint64_t v9 = v16 + 8;
    uint64_t v19 = (char *)a1[7];
    for (uint64_t i = (char *)a1[8]; i != v19; i -= 8)
    {
      uint64_t v21 = *((void *)i - 1);
      *((void *)v16 - 1) = v21;
      v16 -= 8;
    }

    a1[7] = v16;
    a1[8] = v9;
    a1[9] = v18;
    if (v19) {
      operator delete(v19);
    }
  }

  else
  {
    *uint64_t v8 = Float;
    v8[1] = v5;
    unint64_t v9 = v8 + 2;
  }

  a1[8] = v9;
}

uint64_t ObjConverter::addNormal(uint64_t *a1, uint64_t *a2)
{
  float Float = fileFormatUtils::getFloat(a2);
  float v5 = fileFormatUtils::getFloat(a2);
  float v6 = fileFormatUtils::getFloat(a2);
  *(float *)unint64_t v9 = Float;
  *(float *)&v9[1] = v5;
  *(float *)&v9[2] = v6;
  unint64_t v7 = (float *)a1[11];
  if ((unint64_t)v7 >= a1[12])
  {
    uint64_t result = sub_100005BCC(a1 + 10, (uint64_t)v9);
  }

  else
  {
    *unint64_t v7 = Float;
    v7[1] = v5;
    uint64_t result = (uint64_t)(v7 + 3);
    v7[2] = v6;
  }

  a1[11] = result;
  return result;
}

void ObjConverter::addFace(void *a1, uint64_t *a2)
{
  int v4 = 0;
  int v50 = 0LL;
  int v51 = 0LL;
  unint64_t v52 = 0LL;
  int v48 = a2 + 2;
  do
  {
    unint64_t v8 = a2[5];
    unint64_t v9 = a2[6];
    if (v8 >= v9) {
      uint64_t v10 = (*(uint64_t (**)(uint64_t *))(*v48 + 56))(v48);
    }
    else {
      uint64_t v10 = v9 - v8;
    }
    if (!v10) {
      break;
    }
    memset(&v49, 0, sizeof(v49));
    sub_100003638(a2, &v49);
    sub_10000D55C((uint64_t *)&v50, 0LL);
    sub_10000D5E8((void (__cdecl ***)(std::basic_stringstream<char> *__hidden))v54, &v49, 24);
    memset(&__p, 0, sizeof(__p));
    while (1)
    {
      uint64_t v11 = sub_100005124(v54, &__p, 0x2Fu);
      if ((*((_BYTE *)v11 + *(void *)(*v11 - 24LL) + 32) & 5) != 0) {
        break;
      }
      unint64_t v12 = v51;
      if ((unint64_t)v51 >= v52)
      {
        unint64_t v14 = (_BYTE *)sub_10000DE34((uint64_t *)&v50, (__int128 *)&__p);
      }

      else
      {
        if ((char)__p.__r_.__value_.__s.__size_ < 0)
        {
          sub_100004FE8(v51, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
        }

        else
        {
          __int128 v13 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          *((void *)v51 + 2) = __p.__r_.__value_.__l.__cap_;
          _OWORD *v12 = v13;
        }

        unint64_t v14 = (char *)v12 + 24;
      }

      int v51 = v14;
    }

    v54[0] = v5;
    *(void ***)((char *)v54 + (void)*(v5 - 3)) = v7;
    v54[2] = v6;
    if (v56 < 0) {
      operator delete((void *)v55[8]);
    }
    std::streambuf::~streambuf(v55);
    std::ios::~ios(&v57);
    int v15 = sub_10000AC94(v50, -1431655765 * ((a1[2] - a1[1]) >> 2));
    if (v15 != -1)
    {
      if (0xAAAAAAAAAAAAAAABLL * ((v51 - (_BYTE *)v50) >> 3) < 2)
      {
        int v17 = -1;
      }

      else
      {
        int v16 = sub_10000AC94(v50 + 3, (a1[8] - a1[7]) >> 3);
        int v17 = v15;
        if (v16 != v15)
        {
          *(_BYTE *)(a1[16] + 80LL) = 1;
          int v17 = v16;
        }
      }

      if (0xAAAAAAAAAAAAAAABLL * ((v51 - (_BYTE *)v50) >> 3) <= 2)
      {
        uint64_t v19 = (ObjConverter::Group *)a1[16];
        int v18 = -1;
      }

      else
      {
        int v18 = sub_10000AC94(v50 + 6, -1431655765 * ((a1[11] - a1[10]) >> 2));
        uint64_t v19 = (ObjConverter::Group *)a1[16];
        if (v18 == v15) {
          int v18 = v15;
        }
        else {
          *((_BYTE *)v19 + 112) = 1;
        }
      }

      ObjConverter::Group::appendIndices(v19, v15, v17, v18);
      ++v4;
    }
  }

  while (v15 != -1);
  if (v4 >= 1)
  {
    uint64_t v20 = (void *)a1[16];
    uint64_t v21 = v20[3];
    uint64_t v22 = (v20[16] - v20[15]) >> 2;
    uint64_t v23 = *(_DWORD **)(v21 + 8);
    unint64_t v24 = *(void *)(v21 + 16);
    if ((unint64_t)v23 >= v24)
    {
      unint64_t v26 = *(_DWORD **)v21;
      uint64_t v27 = ((uint64_t)v23 - *(void *)v21) >> 2;
      unint64_t v28 = v27 + 1;
      uint64_t v29 = v24 - (void)v26;
      if (v29 >> 1 > v28) {
        unint64_t v28 = v29 >> 1;
      }
      else {
        unint64_t v30 = v28;
      }
      if (v30)
      {
        unint64_t v31 = (char *)sub_100005D34(v21 + 16, v30);
        unint64_t v26 = *(_DWORD **)v21;
        uint64_t v23 = *(_DWORD **)(v21 + 8);
      }

      else
      {
        unint64_t v31 = 0LL;
      }

      int v32 = &v31[4 * v27];
      unint64_t v33 = &v31[4 * v30];
      *(_DWORD *)int v32 = v22;
      uint64_t v25 = v32 + 4;
      while (v23 != v26)
      {
        int v34 = *--v23;
        *((_DWORD *)v32 - 1) = v34;
        v32 -= 4;
      }

      *(void *)uint64_t v21 = v32;
      *(void *)(v21 + std::istream::~istream(v2, v3 + 8) = v25;
      *(void *)(v21 + 16) = v33;
      if (v26) {
        operator delete(v26);
      }
    }

    else
    {
      *uint64_t v23 = v22;
      uint64_t v25 = v23 + 1;
    }

    *(void *)(v21 + std::istream::~istream(v2, v3 + 8) = v25;
    int v35 = (void *)a1[16];
    uint64_t v36 = (int *)v35[16];
    unint64_t v37 = v35[17];
    if ((unint64_t)v36 >= v37)
    {
      unint64_t v39 = (int *)v35[15];
      uint64_t v40 = v36 - v39;
      unint64_t v41 = v37 - (void)v39;
      unint64_t v42 = (uint64_t)(v37 - (void)v39) >> 1;
      if (v42 <= v40 + 1) {
        unint64_t v42 = v40 + 1;
      }
      if (v41 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v43 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v43 = v42;
      }
      if (v43)
      {
        int v44 = (char *)sub_100005D34((uint64_t)(v35 + 17), v43);
        unint64_t v39 = (int *)v35[15];
        uint64_t v36 = (int *)v35[16];
      }

      else
      {
        int v44 = 0LL;
      }

      int v45 = (int *)&v44[4 * v40];
      int v46 = &v44[4 * v43];
      *int v45 = v4;
      unint64_t v38 = v45 + 1;
      while (v36 != v39)
      {
        int v47 = *--v36;
        *--int v45 = v47;
      }

      v35[15] = v45;
      v35[16] = v38;
      v35[17] = v46;
      if (v39) {
        operator delete(v39);
      }
    }

    else
    {
      *uint64_t v36 = v4;
      unint64_t v38 = v36 + 1;
    }

    v35[16] = v38;
  }

  v54[0] = (void **)&v50;
  sub_10000DFA4(v54);
}

void sub_10000AC28( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18, uint64_t a19, uint64_t a20, char *a21, uint64_t a22, int a23, __int16 a24, char a25, char a26, char a27)
{
  a21 = &a18;
  sub_10000DFA4((void ***)&a21);
  _Unwind_Resume(a1);
}

uint64_t sub_10000AC94(uint64_t *a1, int a2)
{
  if (*((char *)a1 + 23) < 0)
  {
    if (!a1[1]) {
      return 0xFFFFFFFFLL;
    }
    a1 = (uint64_t *)*a1;
  }

  else if (!*((_BYTE *)a1 + 23))
  {
    return 0xFFFFFFFFLL;
  }

  int v3 = strtol((const char *)a1, 0LL, 10);
  if (v3 >= 0) {
    int v4 = -1;
  }
  else {
    int v4 = a2;
  }
  int v5 = v4 + v3;
  if (v5 >= a2 || v5 <= -1) {
    return 0xFFFFFFFFLL;
  }
  else {
    return v5;
  }
}

void ObjConverter::checkLastSubMaterials(ObjConverter *this)
{
  uint64_t v1 = (char *)*((void *)this + 13);
  uint64_t v2 = (char *)this + 112;
  if (v1 != (char *)this + 112)
  {
    do
    {
      int v3 = (ObjConverter::Group *)*((void *)v1 + 7);
      if (*((void *)v3 + 1) - *(void *)v3 >= 9uLL) {
        ObjConverter::Group::removeLastSubMaterialIfEmpty(v3);
      }
      int v4 = (char *)*((void *)v1 + 1);
      if (v4)
      {
        do
        {
          int v5 = v4;
          int v4 = *(char **)v4;
        }

        while (v4);
      }

      else
      {
        do
        {
          int v5 = (char *)*((void *)v1 + 2);
          BOOL v6 = *(void *)v5 == (void)v1;
          uint64_t v1 = v5;
        }

        while (!v6);
      }

      uint64_t v1 = v5;
    }

    while (v5 != v2);
  }

void ObjConverter::loadMaterialFile(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
  {
    sub_100004FE8(__p, *(void **)a2, *(void *)(a2 + 8));
  }

  else
  {
    *(_OWORD *)std::string __p = *(_OWORD *)a2;
    *(void *)&__p[16] = *(void *)(a2 + 16);
  }

  int v3 = (const std::string *)(a1 + 328);
  if (*(char *)(a1 + 351) < 0)
  {
    std::string::size_type v4 = *(void *)(a1 + 336);
    if (!v4) {
      goto LABEL_35;
    }
    uint64_t v5 = v3->__r_.__value_.__r.__words[0];
  }

  else
  {
    std::string::size_type v4 = *(unsigned __int8 *)(a1 + 351);
    if (!*(_BYTE *)(a1 + 351)) {
      goto LABEL_35;
    }
    uint64_t v5 = a1 + 328;
  }

  uint64_t v6 = v5 - 1;
  while (v4)
  {
    int v7 = *(unsigned __int8 *)(v6 + v4--);
    if (v7 == 47)
    {
      if (v4 != -1LL)
      {
        std::string::basic_string(&v20, v3, 0LL, v4, (std::allocator<char> *)&v18);
        if ((v20.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          size_t size = v20.__r_.__value_.__s.__size_;
        }
        else {
          size_t size = v20.__r_.__value_.__l.__size_;
        }
        unint64_t v9 = &v18;
        sub_100005D68((uint64_t)&v18, size + 1);
        if ((v18.__r_.__value_.__s.__size_ & 0x80u) != 0) {
          unint64_t v9 = (std::string *)v18.__r_.__value_.__r.__words[0];
        }
        if (size)
        {
          if ((v20.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            uint64_t v10 = &v20;
          }
          else {
            uint64_t v10 = (std::string *)v20.__r_.__value_.__r.__words[0];
          }
          memmove(v9, v10, size);
        }

        *(_WORD *)((char *)&v9->__r_.__value_.__l.__data_ + size) = 47;
        if (__p[23] >= 0) {
          uint64_t v11 = __p;
        }
        else {
          uint64_t v11 = *(const std::string::value_type **)__p;
        }
        if (__p[23] >= 0) {
          std::string::size_type v12 = __p[23];
        }
        else {
          std::string::size_type v12 = *(void *)&__p[8];
        }
        __int128 v13 = std::string::append(&v18, v11, v12);
        std::string::size_type v14 = v13->__r_.__value_.__r.__words[0];
        v23[0] = v13->__r_.__value_.__l.__size_;
        *(void *)((char *)v23 + 7) = *(std::string::size_type *)((char *)&v13->__r_.__value_.__r.__words[1] + 7);
        unsigned __int8 v15 = v13->__r_.__value_.__s.__size_;
        v13->__r_.__value_.__l.__size_ = 0LL;
        v13->__r_.__value_.__l.__cap_ = 0LL;
        v13->__r_.__value_.__r.__words[0] = 0LL;
        if ((__p[23] & 0x80000000) != 0) {
          operator delete(*(void **)__p);
        }
        *(void *)std::string __p = v14;
        *(void *)&__p[8] = v23[0];
        *(void *)&__p[15] = *(void *)((char *)v23 + 7);
        __p[23] = v15;
      }

      break;
    }
  }

LABEL_35:
  if (__p[23] >= 0) {
    int v16 = __p;
  }
  else {
    int v16 = *(const char **)__p;
  }
  XpcSandbox::consume(*(xpc_connection_t **)(a1 + 352), v16);
  if (__p[23] >= 0) {
    int v17 = __p;
  }
  else {
    int v17 = *(_BYTE **)__p;
  }
  sub_10000B050((void (__cdecl ***)(std::ifstream *__hidden))&v20, (uint64_t)v17, 8);
  if (v21) {
    ObjConverter::parseMtl(a1, &v20);
  }
  std::filebuf::~filebuf(&v20.__r_.__value_.__r.__words[2]);
  std::ios::~ios(&v22);
  if ((__p[23] & 0x80000000) != 0) {
    operator delete(*(void **)__p);
  }
}

void sub_10000AFE4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, uint64_t a23, void *a24, uint64_t a25, int a26, __int16 a27, char a28, char a29)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a29 < 0) {
    operator delete(a24);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(exception_object);
}

void (__cdecl ***sub_10000B050( void (__cdecl ***a1)(std::ifstream *__hidden this), uint64_t a2, int a3))(std::ifstream *__hidden this)
{
  uint64_t v6 = a1 + 2;
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  unint64_t v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 2);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  std::filebuf::basic_filebuf(v6);
  if (!std::filebuf::open(v6, a2, a3 | 8u)) {
    std::ios_base::clear( (std::ios_base *)((char *)*(*a1 - 3) + (void)a1),  *(_DWORD *)((char *)*(*a1 - 3) + (void)a1 + 32) | 4);
  }
  return a1;
}

void sub_10000B124(_Unwind_Exception *a1)
{
}

void ObjConverter::parseMtl(uint64_t a1, void *a2)
{
  while (sub_10000BDB8(a2, &__str))
  {
    std::string::size_type size = __str.__r_.__value_.__s.__size_;
    if ((__str.__r_.__value_.__s.__size_ & 0x80u) != 0) {
      std::string::size_type size = __str.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      std::ios_base::clear((std::ios_base *)((char *)v18 + *(void *)(v18[0] - 24)), 0);
      std::string::operator=(&v20, &__str);
      sub_1000053F8((uint64_t)v19);
      memset(&v17, 0, sizeof(v17));
      sub_100003638(v18, &v17);
      if (((char)v17.__r_.__value_.__s.__size_ & 0x80000000) == 0)
      {
        switch(v17.__r_.__value_.__s.__size_)
        {
          case 1u:
            goto LABEL_77;
          case 2u:
            goto LABEL_8;
          case 4u:
            if (LODWORD(v17.__r_.__value_.__l.__data_) == 1886221666) {
              goto LABEL_72;
            }
            if (v17.__r_.__value_.__s.__size_ == 1) {
              goto LABEL_77;
            }
            if (v17.__r_.__value_.__s.__size_ != 2) {
              goto LABEL_88;
            }
LABEL_8:
            if (LOWORD(v17.__r_.__value_.__l.__data_) == 25675) {
              goto LABEL_73;
            }
            if (v17.__r_.__value_.__s.__size_ == 1)
            {
LABEL_77:
              if (v17.__r_.__value_.__s.__data_[0] != 100) {
                goto LABEL_88;
              }
              goto LABEL_78;
            }

LABEL_83:
            if (v17.__r_.__value_.__s.__size_ != 2) {
              goto LABEL_88;
            }
LABEL_84:
            if (LOWORD(v17.__r_.__value_.__l.__data_) == 28513) {
              goto LABEL_99;
            }
LABEL_85:
            if (v17.__r_.__value_.__s.__size_ != 2) {
              goto LABEL_88;
            }
            uint64_t v10 = &v17;
            break;
          case 5u:
LABEL_79:
            if (LODWORD(v17.__r_.__value_.__l.__data_) == 1601200493 && v17.__r_.__value_.__s.__data_[4] == 100) {
              goto LABEL_94;
            }
            goto LABEL_83;
          case 6u:
            if (LODWORD(v17.__r_.__value_.__l.__data_) == 1836541294
              && WORD2(v17.__r_.__value_.__r.__words[0]) == 27764)
            {
              goto LABEL_74;
            }

LABEL_60:
            if (LODWORD(v17.__r_.__value_.__l.__data_) != 1601200493
              || WORD2(v17.__r_.__value_.__r.__words[0]) != 25675)
            {
              switch(v17.__r_.__value_.__s.__size_)
              {
                case 1u:
                  goto LABEL_77;
                case 2u:
                  goto LABEL_84;
                case 5u:
                  goto LABEL_79;
                case 6u:
                  if (LODWORD(v17.__r_.__value_.__l.__data_) != 1601200493
                    || WORD2(v17.__r_.__value_.__r.__words[0]) != 28513)
                  {
                    goto LABEL_85;
                  }

                  goto LABEL_70;
                default:
                  goto LABEL_88;
              }
            }

            goto LABEL_75;
          case 8u:
            if (v17.__r_.__value_.__r.__words[0] != 0x706D75625F70616DLL)
            {
              switch(v17.__r_.__value_.__s.__size_)
              {
                case 1u:
                  goto LABEL_77;
                case 2u:
                  goto LABEL_8;
                case 5u:
                  goto LABEL_79;
                case 6u:
                  goto LABEL_60;
                default:
                  goto LABEL_88;
              }
            }

            goto LABEL_72;
          default:
            goto LABEL_88;
        }

LABEL_87:
        if (LOWORD(v10->__r_.__value_.__l.__data_) == 25931)
        {
          int v14 = 3;
          goto LABEL_103;
        }

        goto LABEL_88;
      }

      std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      if (v17.__r_.__value_.__l.__size_ == 4)
      {
        if (*(_DWORD *)v17.__r_.__value_.__l.__data_ == 1886221666) {
          goto LABEL_72;
        }
        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      else if (v17.__r_.__value_.__l.__size_ == 6 {
             && *(_DWORD *)v17.__r_.__value_.__l.__data_ == 1836541294
      }
             && *(_WORD *)(v17.__r_.__value_.__r.__words[0] + 4) == 27764)
      {
LABEL_74:
        sub_10000C12C(v18, &__p);
        ObjConverter::updateMaterial(a1, (uint64_t)&__p);
        goto LABEL_95;
      }

      if (v5 == 8)
      {
        if (*(void *)v17.__r_.__value_.__l.__data_ == 0x706D75625F70616DLL)
        {
LABEL_72:
          sub_10000C12C(v18, &__p);
          ObjConverter::addMapToMaterial(a1, 0, &__p);
          goto LABEL_95;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 2)
      {
        if (*(_WORD *)v17.__r_.__value_.__l.__data_ == 25675)
        {
LABEL_73:
          int v14 = 1;
LABEL_103:
          ObjConverter::addInputToMaterial(a1, v14, (uint64_t)v18);
          goto LABEL_104;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 6)
      {
        if (*(_DWORD *)v17.__r_.__value_.__l.__data_ == 1601200493
          && *(_WORD *)(v17.__r_.__value_.__r.__words[0] + 4) == 25675)
        {
LABEL_75:
          sub_10000C12C(v18, &__p);
          ObjConverter::addMapToMaterial(a1, 1, &__p);
          goto LABEL_95;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 1)
      {
        if (*v17.__r_.__value_.__l.__data_ == 100)
        {
LABEL_78:
          int v14 = 2;
          goto LABEL_103;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 5)
      {
        if (*(_DWORD *)v17.__r_.__value_.__l.__data_ == 1601200493
          && *(_BYTE *)(v17.__r_.__value_.__r.__words[0] + 4) == 100)
        {
LABEL_94:
          sub_10000C12C(v18, &__p);
          ObjConverter::addMapToMaterial(a1, 2, &__p);
          goto LABEL_95;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 2)
      {
        if (*(_WORD *)v17.__r_.__value_.__l.__data_ == 28513)
        {
LABEL_99:
          int v14 = 4;
          goto LABEL_103;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 6)
      {
        if (*(_DWORD *)v17.__r_.__value_.__l.__data_ == 1601200493
          && *(_WORD *)(v17.__r_.__value_.__r.__words[0] + 4) == 28513)
        {
LABEL_70:
          sub_10000C12C(v18, &__p);
          ObjConverter::addMapToMaterial(a1, 4, &__p);
          goto LABEL_95;
        }

        std::string::size_type v5 = v17.__r_.__value_.__l.__size_;
      }

      if (v5 == 2)
      {
        uint64_t v10 = (std::string *)v17.__r_.__value_.__r.__words[0];
        goto LABEL_87;
      }

LABEL_88:
      if (sub_100003864(&v17, "map_Ke"))
      {
        sub_10000C12C(v18, &__p);
        ObjConverter::addMapToMaterial(a1, 3, &__p);
        goto LABEL_95;
      }

      if (sub_100003864(&v17, "metallic"))
      {
        int v14 = 5;
        goto LABEL_103;
      }

      if (sub_100003864(&v17, "map_metallic"))
      {
        sub_10000C12C(v18, &__p);
        ObjConverter::addMapToMaterial(a1, 5, &__p);
        goto LABEL_95;
      }

      if (sub_100003864(&v17, "roughness"))
      {
        int v14 = 6;
        goto LABEL_103;
      }

      if (sub_100003864(&v17, "map_roughness"))
      {
        sub_10000C12C(v18, &__p);
        ObjConverter::addMapToMaterial(a1, 6, &__p);
LABEL_95:
      }

LABEL_104:
    }
  }

  std::streambuf::~streambuf(v19);
  std::ios::~ios(&v21);
}

void sub_10000B728( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a20 < 0) {
    operator delete(__p);
  }
  sub_100003C84((uint64_t)&a21);
  _Unwind_Resume(a1);
}

void *sub_10000B7B8(void *a1)
{
  return a1;
}

uint64_t ObjConverter::addInputToMaterial(uint64_t result, int a2, uint64_t a3)
{
  int v38 = a2;
  int v3 = *(_DWORD *)(result + 212);
  if (v3 != -1)
  {
    std::string::size_type v5 = (uint64_t **)(*(void *)(result + 160) + 48LL * v3);
    if (!fileFormatUtils::Material::hasInput((uint64_t)v5, a2))
    {
      sub_1000076C8(v26, (char *)&unk_100013692);
      sub_1000076C8(v24, (char *)&unk_100013692);
      sub_1000076C8(v22, "st");
      sub_10000DBD8((char *)__dst, (__int128 *)v26, (__int128 *)v24, (__int128 *)v22);
      unint64_t v39 = &v38;
      uint64_t v6 = sub_10000EAF4(v5, &v38, (uint64_t)&std::piecewise_construct, &v39);
      int v7 = (void **)(v6 + 5);
      v6[7] = v29;
      *(_OWORD *)int v7 = *(_OWORD *)__dst;
      HIBYTE(v29) = 0;
      LOBYTE(__dst[0]) = 0;
      unint64_t v8 = (void **)(v6 + 8);
      v6[10] = v31;
      *(_OWORD *)unint64_t v8 = v30;
      HIBYTE(v31) = 0;
      LOBYTE(v30) = 0;
      unint64_t v9 = (void **)(v6 + 11);
      v6[13] = v33;
      *(_OWORD *)unint64_t v9 = __p;
      HIBYTE(v33) = 0;
      LOBYTE(__p) = 0;
      uint64_t v10 = v6 + 14;
      if (*((char *)v6 + 135) < 0)
      {
        operator delete(v6[14]);
        int v12 = SHIBYTE(v33);
        _OWORD *v10 = v34;
        __int128 v13 = v36;
        v6[16] = v35;
        HIBYTE(v35) = 0;
        LOBYTE(v34) = 0;
        void v6[17] = v13;
        *((_DWORD *)v6 + 36) = v37;
        if (v12 < 0) {
          operator delete((void *)__p);
        }
      }

      else
      {
        _OWORD *v10 = v34;
        uint64_t v11 = v36;
        v6[16] = v35;
        HIBYTE(v35) = 0;
        LOBYTE(v34) = 0;
        void v6[17] = v11;
        *((_DWORD *)v6 + 36) = v37;
      }

      if (SHIBYTE(v31) < 0) {
        operator delete((void *)v30);
      }
      if (SHIBYTE(v29) < 0) {
        operator delete(__dst[0]);
      }
      if (v23 < 0) {
        operator delete(v22[0]);
      }
      if (v25 < 0) {
        operator delete(v24[0]);
      }
      if (v27 < 0) {
        operator delete(v26[0]);
      }
    }

    __dst[0] = &v38;
    int v14 = sub_10000EAF4(v5, &v38, (uint64_t)&std::piecewise_construct, (_DWORD **)__dst);
    __asm { FMOV            V0.2S, #1.0 }

    v14[17] = _D0;
    std::string v20 = (char *)v14 + 140;
    *((_DWORD *)v14 + 36) = 1065353216;
    uint64_t v21 = v14 + 18;
    std::istream::operator>>(a3, v14 + 17);
    std::istream::operator>>(a3, v20);
    return std::istream::operator>>(a3, v21);
  }

  return result;
}

void sub_10000BA94( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *a22, uint64_t a23, int a24, __int16 a25, char a26, char a27, char a28)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  _Unwind_Resume(a1);
}

uint64_t sub_10000BAF0(uint64_t a1)
{
  return a1;
}

void ObjConverter::addMapToMaterial(uint64_t a1, int a2, std::string *a3)
{
  int v29 = a2;
  int v3 = *(_DWORD *)(a1 + 212);
  if (v3 != -1)
  {
    std::string::size_type v5 = (uint64_t **)(*(void *)(a1 + 160) + 48LL * v3);
    if (fileFormatUtils::Material::hasInput((uint64_t)v5, a2))
    {
      __dst[0] = &v29;
      uint64_t v6 = sub_10000EAF4(v5, &v29, (uint64_t)&std::piecewise_construct, (_DWORD **)__dst);
      std::string::operator=((std::string *)(v6 + 8), a3);
    }

    else
    {
      sub_1000076C8(v17, (char *)&unk_100013692);
      sub_1000076C8(v15, "st");
      sub_10000DBD8((char *)__dst, (__int128 *)v17, (__int128 *)a3, (__int128 *)v15);
      __int128 v30 = &v29;
      int v7 = sub_10000EAF4(v5, &v29, (uint64_t)&std::piecewise_construct, &v30);
      unint64_t v8 = (void **)(v7 + 5);
      v7[7] = v20;
      *(_OWORD *)unint64_t v8 = *(_OWORD *)__dst;
      HIBYTE(v20) = 0;
      LOBYTE(__dst[0]) = 0;
      unint64_t v9 = (void **)(v7 + 8);
      v7[10] = v22;
      *(_OWORD *)unint64_t v9 = v21;
      HIBYTE(v22) = 0;
      LOBYTE(v21) = 0;
      uint64_t v10 = (void **)(v7 + 11);
      v7[13] = v24;
      *(_OWORD *)uint64_t v10 = __p;
      HIBYTE(v24) = 0;
      LOBYTE(__p) = 0;
      uint64_t v11 = v7 + 14;
      if (*((char *)v7 + 135) < 0)
      {
        operator delete(v7[14]);
        int v13 = SHIBYTE(v24);
        *uint64_t v11 = v25;
        int v14 = v27;
        v7[16] = v26;
        HIBYTE(v26) = 0;
        LOBYTE(v25) = 0;
        v7[17] = v14;
        *((_DWORD *)v7 + 36) = v28;
        if (v13 < 0) {
          operator delete((void *)__p);
        }
      }

      else
      {
        *uint64_t v11 = v25;
        int v12 = v27;
        v7[16] = v26;
        HIBYTE(v26) = 0;
        LOBYTE(v25) = 0;
        v7[17] = v12;
        *((_DWORD *)v7 + 36) = v28;
      }

      if (SHIBYTE(v22) < 0) {
        operator delete((void *)v21);
      }
      if (SHIBYTE(v20) < 0) {
        operator delete(__dst[0]);
      }
      if (v16 < 0) {
        operator delete(v15[0]);
      }
      if (v18 < 0) {
        operator delete(v17[0]);
      }
    }
  }

void sub_10000BD74( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20, char a21)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(a1);
}

BOOL sub_10000BDB8(void *a1, std::string *a2)
{
  std::string::size_type v4 = std::locale::use_facet((const std::locale *)&__p, &std::ctype<char>::id);
  unsigned __int8 v5 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v4->__vftable[2].~facet_0)(v4, 10LL);
  std::locale::~locale((std::locale *)&__p);
  uint64_t v6 = sub_100005124(a1, a2, v5);
  int v7 = *(_DWORD *)((_BYTE *)v6 + *(void *)(*v6 - 24LL) + 32) & 5;
  if (!v7)
  {
    uint64_t size = a2->__r_.__value_.__s.__size_;
    int v10 = (char)size;
    uint64_t v11 = (char *)a2 + size;
    if (v10 >= 0) {
      std::string::size_type v12 = (std::string::size_type)v11;
    }
    else {
      std::string::size_type v12 = a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_;
    }
    if (v10 >= 0) {
      int v13 = a2;
    }
    else {
      int v13 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }
    while ((std::string *)v12 != v13)
    {
      __darwin_ct_rune_t v15 = *(char *)--v12;
      __darwin_ct_rune_t v14 = v15;
      if (v15 < 0)
      {
        if (!__maskrune(v14, 0x4000uLL))
        {
LABEL_14:
          int v13 = (std::string *)(v12 + 1);
          break;
        }
      }

      else if ((_DefaultRuneLocale.__runetype[v14] & 0x4000) == 0)
      {
        goto LABEL_14;
      }
    }

    uint64_t v16 = a2->__r_.__value_.__s.__size_;
    int v17 = (char)v16;
    char v18 = (char *)a2 + v16;
    if (v17 >= 0)
    {
      uint64_t v19 = a2;
    }

    else
    {
      char v18 = (char *)(a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_);
      uint64_t v19 = (std::string *)a2->__r_.__value_.__r.__words[0];
    }

    std::string::erase(a2, (char *)v13 - (char *)v19, v18 - (char *)v13);
    do
    {
      while (1)
      {
        std::string::size_type v20 = a2->__r_.__value_.__s.__size_;
        if ((char)a2->__r_.__value_.__s.__size_ < 0)
        {
          std::string::size_type v21 = a2->__r_.__value_.__l.__size_;
          if (!v21) {
            return v7 == 0;
          }
        }

        else
        {
          if (!a2->__r_.__value_.__s.__size_) {
            return v7 == 0;
          }
          std::string::size_type v21 = a2->__r_.__value_.__s.__size_;
        }

        std::string::size_type v22 = v21 - 1;
        if ((v20 & 0x80) != 0)
        {
          char v23 = (std::string *)a2->__r_.__value_.__r.__words[0];
          if (*(_BYTE *)(a2->__r_.__value_.__r.__words[0] + v22) != 92) {
            return v7 == 0;
          }
          std::string::size_type v20 = a2->__r_.__value_.__l.__size_;
        }

        else
        {
          if (a2->__r_.__value_.__s.__data_[v22] != 92) {
            return v7 == 0;
          }
          char v23 = a2;
        }

        v23->__r_.__value_.__s.__data_[v20 - 1] = 32;
        memset(&__p, 0, sizeof(__p));
        std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(void *)(*a1 - 24LL)));
        unint64_t v24 = std::locale::use_facet(&v49, &std::ctype<char>::id);
        unsigned __int8 v25 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10LL);
        std::locale::~locale(&v49);
        unint64_t v26 = sub_100005124(a1, &__p, v25);
        int v27 = *(_DWORD *)((_BYTE *)v26 + *(void *)(*v26 - 24LL) + 32) & 5;
        if (v27)
        {
          uint64_t v28 = a2->__r_.__value_.__s.__size_;
          int v29 = (char)v28;
          __int128 v30 = (char *)a2 + v28;
          unint64_t v31 = v29 >= 0 ? v30 : (char *)(a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_);
          int v32 = v29 >= 0 ? a2 : (std::string *)a2->__r_.__value_.__r.__words[0];
          while (v31 != (char *)v32)
          {
            __darwin_ct_rune_t v34 = *--v31;
            __darwin_ct_rune_t v33 = v34;
            if (v34 < 0) {
              __uint32_t v35 = __maskrune(v33, 0x4000uLL);
            }
            else {
              __uint32_t v35 = _DefaultRuneLocale.__runetype[v33] & 0x4000;
            }
            if (!v35) {
              goto LABEL_58;
            }
          }
        }

        else
        {
          uint64_t v36 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0 ? &__p : (std::string *)__p.__r_.__value_.__r.__words[0];
          std::string::size_type v37 = (__p.__r_.__value_.__s.__size_ & 0x80u) == 0
              ? __p.__r_.__value_.__s.__size_
              : __p.__r_.__value_.__l.__size_;
          std::string::append(a2, (const std::string::value_type *)v36, v37);
          uint64_t v38 = a2->__r_.__value_.__s.__size_;
          int v39 = (char)v38;
          uint64_t v40 = (char *)a2 + v38;
          unint64_t v31 = v39 >= 0 ? v40 : (char *)(a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_);
          int v32 = v39 >= 0 ? a2 : (std::string *)a2->__r_.__value_.__r.__words[0];
          while (v31 != (char *)v32)
          {
            __darwin_ct_rune_t v42 = *--v31;
            __darwin_ct_rune_t v41 = v42;
            if (v42 < 0) {
              __uint32_t v43 = __maskrune(v41, 0x4000uLL);
            }
            else {
              __uint32_t v43 = _DefaultRuneLocale.__runetype[v41] & 0x4000;
            }
            if (!v43)
            {
LABEL_58:
              int v32 = (std::string *)(v31 + 1);
              break;
            }
          }
        }

        uint64_t v44 = a2->__r_.__value_.__s.__size_;
        int v45 = (char)v44;
        int v46 = (char *)a2 + v44;
        if (v45 >= 0)
        {
          int v47 = a2;
        }

        else
        {
          int v46 = (char *)(a2->__r_.__value_.__r.__words[0] + a2->__r_.__value_.__l.__size_);
          int v47 = (std::string *)a2->__r_.__value_.__r.__words[0];
        }

        std::string::erase(a2, (char *)v32 - (char *)v47, v46 - (char *)v32);
        if (v27) {
          return v7 == 0;
        }
      }

      operator delete(__p.__r_.__value_.__l.__data_);
    }

    while (!v27);
  }

  return v7 == 0;
}

void sub_10000C0E8( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, std::locale a15)
{
}

void sub_10000C12C(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  a2->__r_.__value_.__r.__words[0] = 0LL;
  a2->__r_.__value_.__l.__size_ = 0LL;
  a2->__r_.__value_.__l.__cap_ = 0LL;
  sub_100003638(a1, a2);
  while (1)
  {
    unint64_t v4 = a1[5];
    unint64_t v5 = a1[6];
    memset(&__p, 0, sizeof(__p));
    sub_100003638(a1, &__p);
    if ((char)__p.__r_.__value_.__s.__size_ < 0)
    {
      if (__p.__r_.__value_.__l.__size_)
      {
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        goto LABEL_11;
      }

      int v8 = 0;
LABEL_26:
      operator delete(__p.__r_.__value_.__l.__data_);
      if (v8) {
        return;
      }
    }

    else
    {
      if (!__p.__r_.__value_.__s.__size_)
      {
        int v8 = 0;
        goto LABEL_23;
      }

      p_p = &__p;
LABEL_11:
      if (p_p->__r_.__value_.__s.__data_[0] == 35)
      {
        int v8 = 3;
        if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
          goto LABEL_26;
        }
      }

      else
      {
        std::string::append(a2, " ");
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          unint64_t v9 = &__p;
        }
        else {
          unint64_t v9 = (std::string *)__p.__r_.__value_.__r.__words[0];
        }
        if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
          std::string::size_type size = __p.__r_.__value_.__s.__size_;
        }
        else {
          std::string::size_type size = __p.__r_.__value_.__l.__size_;
        }
        std::string::append(a2, (const std::string::value_type *)v9, size);
        int v8 = 0;
        if ((__p.__r_.__value_.__s.__size_ & 0x80) != 0) {
          goto LABEL_26;
        }
      }

LABEL_23:
      if (v8) {
        return;
      }
    }
  }

void sub_10000C250( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
}

char **ObjConverter::getSerializeMaterial(ObjConverter *this, unsigned int a2)
{
  if ((a2 & 0x80000000) == 0)
  {
    uint64_t v2 = *((void *)this + 27);
  }

  int v3 = (char **)((char *)this + 240);
  if (!*((void *)this + 30))
  {
    unint64_t v4 = (char *)this + 248;
    fileFormatUtils::Asset::getMaterialsPath((ObjConverter *)((char *)this + 248), (uint64_t)v29);
    unint64_t v5 = (char *)operator new(0x40uLL);
    if ((v30 & 0x80u) == 0) {
      size_t v6 = v30;
    }
    else {
      size_t v6 = (size_t)v29[1];
    }
    int v7 = __p;
    sub_100005D68((uint64_t)__p, v6 + 8);
    if (v28 < 0) {
      int v7 = (void **)__p[0];
    }
    if (v6)
    {
      if ((v30 & 0x80u) == 0) {
        int v8 = v29;
      }
      else {
        int v8 = (void **)v29[0];
      }
      memmove(v7, v8, v6);
    }

    strcpy((char *)v7 + v6, "/default");
    *(void *)unint64_t v5 = off_1000145C8;
    *((_DWORD *)v5 + 2) = 6;
    unint64_t v9 = v5 + 16;
    if (SHIBYTE(v28) < 0)
    {
      sub_100004FE8(v9, __p[0], (unint64_t)__p[1]);
      int v10 = SHIBYTE(v28);
      *((void *)v5 + 6) = 0LL;
      *((void *)v5 + 7) = 0LL;
      *((void *)v5 + 5) = 0LL;
      *(void *)unint64_t v5 = &off_100014728;
      *int v3 = v5;
      if (v10 < 0)
      {
        operator delete(__p[0]);
        unint64_t v5 = *v3;
      }
    }

    else
    {
      *(_OWORD *)unint64_t v9 = *(_OWORD *)__p;
      *((void *)v5 + 4) = v28;
      *((void *)v5 + 6) = 0LL;
      *((void *)v5 + 7) = 0LL;
      *((void *)v5 + 5) = 0LL;
      *(void *)unint64_t v5 = &off_100014728;
      *int v3 = v5;
    }

    uint64_t v11 = *(void **)v4;
    std::string::size_type v12 = *(void **)(*(void *)v4 + 48LL);
    unint64_t v13 = *(void *)(*(void *)v4 + 56LL);
    if ((unint64_t)v12 >= v13)
    {
      uint64_t v15 = v11[5];
      uint64_t v16 = ((uint64_t)v12 - v15) >> 3;
      uint64_t v17 = v13 - v15;
      uint64_t v18 = v17 >> 2;
      else {
        unint64_t v19 = v18;
      }
      if (v19) {
        std::string::size_type v20 = (char *)sub_100006318(*(void *)v4 + 56LL, v19);
      }
      else {
        std::string::size_type v20 = 0LL;
      }
      std::string::size_type v21 = &v20[8 * v16];
      std::string::size_type v22 = &v20[8 * v19];
      *(void *)std::string::size_type v21 = v5;
      __darwin_ct_rune_t v14 = v21 + 8;
      unint64_t v24 = (char *)v11[5];
      char v23 = (char *)v11[6];
      if (v23 != v24)
      {
        do
        {
          uint64_t v25 = *((void *)v23 - 1);
          v23 -= 8;
          *((void *)v21 - 1) = v25;
          v21 -= 8;
        }

        while (v23 != v24);
        char v23 = (char *)v11[5];
      }

      v11[5] = v21;
      v11[6] = v14;
      v11[7] = v22;
      if (v23) {
        operator delete(v23);
      }
    }

    else
    {
      void *v12 = v5;
      __darwin_ct_rune_t v14 = v12 + 1;
    }

    v11[6] = v14;
  }

  return v3;
}

void sub_10000C4D4( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  operator delete(v21);
  if (a21 < 0) {
    operator delete(a16);
  }
  _Unwind_Resume(a1);
}

void ObjConverter::createMesh(ObjConverter *a1, const void **a2, uint64_t **a3, uint64_t *a4, void *a5)
{
  unint64_t v5 = (char *)(a3 + 15);
  if (a3[16] != a3[15])
  {
    int v8 = a3;
    uint64_t v11 = (char *)operator new(0x128uLL);
    float v107 = (serialize::Prim *)v11;
    sub_100004864(a2, 47, (uint64_t)&v109);
    fileFormatUtils::makeValidIdentifier(a4, &v108);
    if ((v108.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type v12 = &v108;
    }
    else {
      std::string::size_type v12 = (std::string *)v108.__r_.__value_.__r.__words[0];
    }
    if ((v108.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      std::string::size_type size = v108.__r_.__value_.__s.__size_;
    }
    else {
      std::string::size_type size = v108.__r_.__value_.__l.__size_;
    }
    __darwin_ct_rune_t v14 = std::string::append(&v109, (const std::string::value_type *)v12, size);
    __int128 v15 = *(_OWORD *)&v14->__r_.__value_.__l.__data_;
    std::string::size_type cap = v14->__r_.__value_.__l.__cap_;
    *(_OWORD *)std::string __p = v15;
    v14->__r_.__value_.__l.__size_ = 0LL;
    v14->__r_.__value_.__l.__cap_ = 0LL;
    v14->__r_.__value_.__r.__words[0] = 0LL;
    sub_100004F44((uint64_t)v11, (__int128 *)__p);
    if (SHIBYTE(cap) < 0) {
      operator delete(__p[0]);
    }
    unint64_t v16 = a5[7];
    uint64_t v17 = (char **)a5[6];
    if ((unint64_t)v17 >= v16)
    {
      uint64_t v19 = a5[5];
      uint64_t v20 = ((uint64_t)v17 - v19) >> 3;
      uint64_t v21 = v16 - v19;
      uint64_t v22 = v21 >> 2;
      else {
        unint64_t v23 = v22;
      }
      if (v23) {
        unint64_t v24 = (char *)sub_100006318((uint64_t)(a5 + 7), v23);
      }
      else {
        unint64_t v24 = 0LL;
      }
      uint64_t v25 = (char **)&v24[8 * v20];
      unint64_t v26 = &v24[8 * v23];
      *uint64_t v25 = v11;
      uint64_t v18 = v25 + 1;
      uint64_t v28 = (char *)a5[5];
      int v27 = (char *)a5[6];
      if (v27 != v28)
      {
        do
        {
          int v29 = (char *)*((void *)v27 - 1);
          v27 -= 8;
          *--uint64_t v25 = v29;
        }

        while (v27 != v28);
        int v27 = (char *)a5[5];
      }

      a5[5] = v25;
      a5[6] = v18;
      a5[7] = v26;
      if (v27) {
        operator delete(v27);
      }
    }

    else
    {
      *uint64_t v17 = v11;
      uint64_t v18 = v17 + 1;
    }

    a5[6] = v18;
    if (v11 + 64 != v5) {
      sub_100005FF8(v11 + 64, (char *)v8[15], (uint64_t)v8[16], ((char *)v8[16] - (char *)v8[15]) >> 2);
    }
    unsigned __int8 v30 = (int *)v8[4];
    unint64_t v31 = (int *)v8[5];
    int v32 = v30 + 1;
    int v33 = *v30;
    if (v30 != v31 && v32 != v31)
    {
      int v35 = *v30;
      uint64_t v36 = v30 + 1;
      std::string::size_type v37 = (int *)v8[4];
      uint64_t v38 = v30 + 1;
      do
      {
        int v40 = *v38++;
        int v39 = v40;
        if (v40 < v35)
        {
          int v35 = v39;
          std::string::size_type v37 = v36;
        }

        uint64_t v36 = v38;
      }

      while (v38 != v31);
      int v41 = *v37;
      __darwin_ct_rune_t v42 = v30 + 1;
      do
      {
        int v44 = *v42++;
        int v43 = v44;
        BOOL v45 = v33 < v44;
        if (v33 <= v44) {
          int v33 = v43;
        }
        if (v45) {
          unsigned __int8 v30 = v32;
        }
        int v32 = v42;
      }

      while (v42 != v31);
      int v33 = v41;
    }

    int v46 = *v30;
    __p[0] = 0LL;
    __p[1] = 0LL;
    std::string::size_type cap = 0LL;
    int v47 = v46 + 1;
    sub_10000CE98((uint64_t *)__p, (void *)a1 + 1, v33, v46 + 1);
    sub_100005DEC( (void *)v11 + 20,  (uint64_t *)__p[0],  (uint64_t *)__p[1],  0xAAAAAAAAAAAAAAABLL * (((char *)__p[1] - (char *)__p[0]) >> 2));
    if (v33)
    {
      memset(&v109, 0, sizeof(v109));
      sub_10000CF58((uint64_t)&v109, v8 + 4, -v33);
      sub_100005FF8( v11 + 64,  v109.__r_.__value_.__l.__data_,  v109.__r_.__value_.__l.__size_,  (uint64_t)(v109.__r_.__value_.__l.__size_ - v109.__r_.__value_.__r.__words[0]) >> 2);
      if (v109.__r_.__value_.__r.__words[0])
      {
        v109.__r_.__value_.__l.__size_ = v109.__r_.__value_.__r.__words[0];
        operator delete(v109.__r_.__value_.__l.__data_);
      }
    }

    else if (v11 + 88 != (char *)(v8 + 4))
    {
      sub_100005FF8(v11 + 88, (char *)v8[4], (uint64_t)v8[5], ((char *)v8[5] - (char *)v8[4]) >> 2);
    }

    if (*((void *)a1 + 5) - *((void *)a1 + 4) == *((void *)a1 + 2) - *((void *)a1 + 1))
    {
      memset(&v109, 0, sizeof(v109));
      sub_10000CE98((uint64_t *)&v109, (void *)a1 + 4, v33, v47);
      *((_DWORD *)v11 + 65) = 2;
      sub_100005DEC( (void *)v11 + 26,  (uint64_t *)v109.__r_.__value_.__l.__data_,  (uint64_t *)v109.__r_.__value_.__l.__size_,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v109.__r_.__value_.__l.__size_ - v109.__r_.__value_.__r.__words[0]) >> 2));
      if (v109.__r_.__value_.__r.__words[0])
      {
        v109.__r_.__value_.__l.__size_ = v109.__r_.__value_.__r.__words[0];
        operator delete(v109.__r_.__value_.__l.__data_);
      }
    }

    int v48 = (int *)v8[7];
    std::locale v49 = (int *)v8[8];
    int v50 = v8 + 7;
    int v51 = v48 + 1;
    int v52 = *v48;
    if (v48 != v49 && v51 != v49)
    {
      int v53 = *v48;
      unsigned int v54 = v48 + 1;
      unint64_t v55 = (int *)v8[7];
      char v56 = v48 + 1;
      do
      {
        int v58 = *v56++;
        int v57 = v58;
        if (v58 < v53)
        {
          int v53 = v57;
          unint64_t v55 = v54;
        }

        unsigned int v54 = v56;
      }

      while (v56 != v49);
      int v59 = *v55;
      v60 = v48 + 1;
      do
      {
        int v62 = *v60++;
        int v61 = v62;
        BOOL v63 = v52 < v62;
        if (v52 <= v62) {
          int v52 = v61;
        }
        if (v63) {
          int v48 = v51;
        }
        int v51 = v60;
      }

      while (v60 != v49);
      int v52 = v59;
    }

    if ((v52 & 0x80000000) == 0)
    {
      uint64_t v64 = *v48;
      memset(&v109, 0, sizeof(v109));
      sub_10000EE48((uint64_t)&v109, 0LL);
      else {
        int v65 = (uint64_t)(*((void *)a1 + 8) - *((void *)a1 + 7)) >> 3;
      }
      sub_10000EE78((void **)&v109.__r_.__value_.__l.__data_, v65 - v52);
      uint64_t v106 = v8;
      if (v65 <= v52)
      {
        uint64_t v67 = (uint64_t *)v109.__r_.__value_.__l.__size_;
      }

      else
      {
        uint64_t v66 = v52;
        uint64_t v67 = (uint64_t *)v109.__r_.__value_.__l.__size_;
        do
        {
          uint64_t v68 = *((void *)a1 + 7);
          if ((unint64_t)v67 >= v109.__r_.__value_.__l.__cap_)
          {
            uint64_t v69 = (uint64_t)((uint64_t)v67 - v109.__r_.__value_.__r.__words[0]) >> 3;
            unint64_t v70 = (uint64_t)(v109.__r_.__value_.__l.__cap_ - v109.__r_.__value_.__r.__words[0]) >> 2;
            if (v70 <= v69 + 1) {
              unint64_t v70 = v69 + 1;
            }
            if (v109.__r_.__value_.__l.__cap_ - v109.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF8LL) {
              unint64_t v71 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v71 = v70;
            }
            v72 = (char *)sub_100006318((uint64_t)&v109.__r_.__value_.__l.__cap_, v71);
            std::string v74 = &v72[8 * v69];
            *(void *)std::string v74 = *(void *)(v68 + 8 * v66);
            uint64_t v67 = (uint64_t *)(v74 + 8);
            std::string::size_type v76 = v109.__r_.__value_.__l.__size_;
            uint64_t v75 = (void *)v109.__r_.__value_.__r.__words[0];
            while ((void *)v76 != v75)
            {
              uint64_t v77 = *(void *)(v76 - 8);
              v76 -= 8LL;
              *((void *)v74 - 1) = v77;
              v74 -= 8;
            }

            v109.__r_.__value_.__r.__words[0] = (std::string::size_type)v74;
            v109.__r_.__value_.__l.__size_ = (std::string::size_type)v67;
            v109.__r_.__value_.__l.__cap_ = (std::string::size_type)&v72[8 * v73];
            if (v75) {
              operator delete(v75);
            }
          }

          else
          {
            *v67++ = *(void *)(v68 + 8 * v66);
          }

          v109.__r_.__value_.__l.__size_ = (std::string::size_type)v67;
          ++v66;
        }

        while (v65 != (_DWORD)v66);
      }

      uint64_t v11 = (char *)v107;
      sub_100007778( (void *)v107 + 29,  (uint64_t *)v109.__r_.__value_.__l.__data_,  v67,  (uint64_t)((uint64_t)v67 - v109.__r_.__value_.__r.__words[0]) >> 3);
      int v8 = v106;
      if (*((_BYTE *)v106 + 80))
      {
        *((_DWORD *)v107 + 66) = 3;
        if (v52)
        {
          memset(&v108, 0, sizeof(v108));
          sub_10000CF58((uint64_t)&v108, v50, -v52);
          sub_100005FF8( (char *)v107 + 112,  v108.__r_.__value_.__l.__data_,  v108.__r_.__value_.__l.__size_,  (uint64_t)(v108.__r_.__value_.__l.__size_ - v108.__r_.__value_.__r.__words[0]) >> 2);
          if (v108.__r_.__value_.__r.__words[0])
          {
            v108.__r_.__value_.__l.__size_ = v108.__r_.__value_.__r.__words[0];
            operator delete(v108.__r_.__value_.__l.__data_);
          }
        }

        else if ((void *)((char *)v107 + 112) != v50)
        {
          sub_100005FF8((char *)v107 + 112, (char *)v106[7], (uint64_t)v106[8], ((char *)v106[8] - (char *)v106[7]) >> 2);
        }
      }

      else
      {
        *((_DWORD *)v107 + 66) = 2;
      }

      if (v109.__r_.__value_.__r.__words[0])
      {
        v109.__r_.__value_.__l.__size_ = v109.__r_.__value_.__r.__words[0];
        operator delete(v109.__r_.__value_.__l.__data_);
      }
    }

    v78 = (int *)v8[11];
    v79 = (int *)v8[12];
    char v80 = v78 + 1;
    int v81 = *v78;
    if (v78 != v79 && v80 != v79)
    {
      int v83 = *v78;
      v84 = v78 + 1;
      v85 = (int *)v8[11];
      uint64_t v86 = v78 + 1;
      do
      {
        int v88 = *v86++;
        int v87 = v88;
        if (v88 < v83)
        {
          int v83 = v87;
          v85 = v84;
        }

        v84 = v86;
      }

      while (v86 != v79);
      int v89 = *v85;
      unint64_t v90 = v78 + 1;
      do
      {
        int v92 = *v90++;
        int v91 = v92;
        BOOL v93 = v81 < v92;
        if (v81 <= v92) {
          int v81 = v91;
        }
        if (v93) {
          v78 = v80;
        }
        char v80 = v90;
      }

      while (v90 != v79);
      int v81 = v89;
    }

    if ((v81 & 0x80000000) == 0)
    {
      int v94 = *v78;
      memset(&v109, 0, sizeof(v109));
      sub_10000CE98((uint64_t *)&v109, (void *)a1 + 10, v81, v94 + 1);
      sub_100005DEC( (void *)v11 + 23,  (uint64_t *)v109.__r_.__value_.__l.__data_,  (uint64_t *)v109.__r_.__value_.__l.__size_,  0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v109.__r_.__value_.__l.__size_ - v109.__r_.__value_.__r.__words[0]) >> 2));
      if (*((_BYTE *)v8 + 112))
      {
        *((_DWORD *)v11 + 64) = 3;
        if (v81)
        {
          memset(&v108, 0, sizeof(v108));
          sub_10000CF58((uint64_t)&v108, v8 + 11, -v81);
          sub_100005FF8( v11 + 136,  v108.__r_.__value_.__l.__data_,  v108.__r_.__value_.__l.__size_,  (uint64_t)(v108.__r_.__value_.__l.__size_ - v108.__r_.__value_.__r.__words[0]) >> 2);
          if (v108.__r_.__value_.__r.__words[0])
          {
            v108.__r_.__value_.__l.__size_ = v108.__r_.__value_.__r.__words[0];
            operator delete(v108.__r_.__value_.__l.__data_);
          }
        }

        else if (v11 + 136 != (char *)(v8 + 11))
        {
          sub_100005FF8(v11 + 136, (char *)v8[11], (uint64_t)v8[12], ((char *)v8[12] - (char *)v8[11]) >> 2);
        }
      }

      else
      {
        *((_DWORD *)v11 + 64) = 2;
      }

      if (v109.__r_.__value_.__r.__words[0])
      {
        v109.__r_.__value_.__l.__size_ = v109.__r_.__value_.__r.__words[0];
        operator delete(v109.__r_.__value_.__l.__data_);
      }
    }

    uint64_t v97 = v8;
    uint64_t v95 = *v8;
    uint64_t v96 = v97[1];
    if ((char *)v96 - (char *)v95 == 8)
    {
      uint64_t v98 = *ObjConverter::getSerializeMaterial(a1, *(_DWORD *)(*v95 + 24));
      if (v98) {
        std::string::operator=((std::string *)((char *)v107 + 272), (const std::string *)(v98 + 16));
      }
    }

    else
    {
      for (; v95 != v96; ++v95)
      {
        uint64_t v99 = *v95;
        if (*(void *)(*v95 + 8) != *(void *)*v95)
        {
          unint64_t v100 = *(unsigned int *)(v99 + 24);
          else {
            fileFormatUtils::makeValidIdentifier((uint64_t *)(*((void *)a1 + 17) + 24LL * v100), &v109);
          }
          v101 = (char *)operator new(0x88uLL);
          if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            size_t v102 = v109.__r_.__value_.__s.__size_;
          }
          else {
            size_t v102 = v109.__r_.__value_.__l.__size_;
          }
          sub_100005D68((uint64_t)&v108, v102 + 6);
          if ((v108.__r_.__value_.__s.__size_ & 0x80u) == 0) {
            v103 = &v108;
          }
          else {
            v103 = (std::string *)v108.__r_.__value_.__r.__words[0];
          }
          if (v102)
          {
            if ((v109.__r_.__value_.__s.__size_ & 0x80u) == 0) {
              uint64_t v104 = &v109;
            }
            else {
              uint64_t v104 = (std::string *)v109.__r_.__value_.__r.__words[0];
            }
            memmove(v103, v104, v102);
          }

          strcpy((char *)v103 + v102, "Subset");
          sub_1000072F0((uint64_t)v101, (__int128 *)&v108);
          if (v101 + 64 != (char *)v99) {
            sub_100005FF8( v101 + 64,  *(char **)v99,  *(void *)(v99 + 8),  (uint64_t)(*(void *)(v99 + 8) - *(void *)v99) >> 2);
          }
          SerializeMaterial = ObjConverter::getSerializeMaterial(a1, v100);
          std::string::operator=((std::string *)(v101 + 112), (const std::string *)(*SerializeMaterial + 16));
          serialize::Prim::addChild(v107, (serialize::Prim *)v101);
        }
      }
    }

    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }

void sub_10000CD9C( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *a17, uint64_t a18, int a19, __int16 a20, char a21, char a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (__p) {
    operator delete(__p);
  }
  if (a17) {
    operator delete(a17);
  }
  if (a23) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000CE98(uint64_t *a1, void *a2, int a3, int a4)
{
  BOOL v8 = __OFSUB__(a4, a3);
  int v9 = a4 - a3;
  if (!((v9 < 0) ^ v8 | (v9 == 0)))
  {
    unint64_t v10 = a1[1];
    uint64_t v11 = 12LL * a3;
    do
    {
      uint64_t v12 = *a2 + v11;
      if (v10 >= a1[2])
      {
        unint64_t v10 = sub_100005BCC(a1, v12);
      }

      else
      {
        *(void *)unint64_t v10 = *(void *)v12;
        *(_DWORD *)(v10 + std::istream::~istream(v1, v2 + 8) = *(_DWORD *)(v12 + 8);
        v10 += 12LL;
      }

      a1[1] = v10;
      v11 += 12LL;
      --v9;
    }

    while (v9);
  }

void sub_10000CF58(uint64_t a1, void *a2, int a3)
{
  size_t v6 = (_DWORD *)*a2;
  int v7 = (_DWORD *)a2[1];
  if ((_DWORD *)*a2 != v7)
  {
    BOOL v8 = (void *)(a1 + 16);
    int v9 = *(_DWORD **)(a1 + 8);
    do
    {
      int v10 = *v6 + a3;
      if ((unint64_t)v9 >= *v8)
      {
        uint64_t v12 = *(_DWORD **)a1;
        uint64_t v13 = ((uint64_t)v9 - *(void *)a1) >> 2;
        unint64_t v14 = v13 + 1;
        uint64_t v15 = *v8 - (void)v12;
        if (v15 >> 1 > v14) {
          unint64_t v14 = v15 >> 1;
        }
        else {
          unint64_t v16 = v14;
        }
        if (v16)
        {
          uint64_t v17 = (char *)sub_100005D34(a1 + 16, v16);
          uint64_t v12 = *(_DWORD **)a1;
          int v9 = *(_DWORD **)(a1 + 8);
        }

        else
        {
          uint64_t v17 = 0LL;
        }

        uint64_t v18 = &v17[4 * v13];
        *(_DWORD *)uint64_t v18 = v10;
        uint64_t v11 = v18 + 4;
        while (v9 != v12)
        {
          int v19 = *--v9;
          *((_DWORD *)v18 - 1) = v19;
          v18 -= 4;
        }

        *(void *)a1 = v18;
        *(void *)(a1 + std::istream::~istream(v1, v2 + 8) = v11;
        *(void *)(a1 + 16) = &v17[4 * v16];
        if (v12) {
          operator delete(v12);
        }
      }

      else
      {
        *int v9 = v10;
        uint64_t v11 = v9 + 1;
      }

      *(void *)(a1 + std::istream::~istream(v1, v2 + 8) = v11;
      ++v6;
      int v9 = v11;
    }

    while (v6 != v7);
  }

void *ObjConverter::makeStage(ObjConverter *this)
{
  uint64_t v2 = (ObjConverter *)((char *)this + 248);
  uint64_t inited = (void *)fileFormatUtils::Asset::initStage((ObjConverter *)((char *)this + 248));
  fileFormatUtils::Asset::getMaterialsPath(v2, (uint64_t)&v30);
  unint64_t v4 = (fileFormatUtils::Material *)*((void *)this + 20);
  unint64_t v5 = (fileFormatUtils::Material *)*((void *)this + 21);
  if (v4 != v5)
  {
    size_t v6 = (char **)((char *)this + 216);
    do
    {
      SerializeMaterial = fileFormatUtils::Material::makeSerializeMaterial(v4, v2);
      BOOL v8 = SerializeMaterial;
      int v10 = (serialize::Mat **)*((void *)this + 28);
      unint64_t v9 = *((void *)this + 29);
      if ((unint64_t)v10 >= v9)
      {
        uint64_t v12 = ((char *)v10 - *v6) >> 3;
        uint64_t v13 = v9 - (void)*v6;
        uint64_t v14 = v13 >> 2;
        else {
          unint64_t v15 = v14;
        }
        if (v15) {
          unint64_t v16 = (char *)sub_100006318((uint64_t)this + 232, v15);
        }
        else {
          unint64_t v16 = 0LL;
        }
        uint64_t v17 = (serialize::Mat **)&v16[8 * v12];
        *uint64_t v17 = v8;
        uint64_t v11 = v17 + 1;
        int v19 = (char *)*((void *)this + 27);
        uint64_t v18 = (char *)*((void *)this + 28);
        if (v18 != v19)
        {
          do
          {
            uint64_t v20 = (serialize::Mat *)*((void *)v18 - 1);
            v18 -= 8;
            *--uint64_t v17 = v20;
          }

          while (v18 != v19);
          uint64_t v18 = *v6;
        }

        *((void *)this + 27) = v17;
        *((void *)this + 2std::istream::~istream(v1, v2 + 8) = v11;
        *((void *)this + 29) = &v16[8 * v15];
        if (v18) {
          operator delete(v18);
        }
      }

      else
      {
        _OWORD *v10 = SerializeMaterial;
        uint64_t v11 = v10 + 1;
      }

      *((void *)this + 2std::istream::~istream(v1, v2 + 8) = v11;
      unint64_t v4 = (fileFormatUtils::Material *)((char *)v4 + 48);
    }

    while (v4 != v5);
  }

  fileFormatUtils::Asset::getGeomPath(v2, (uint64_t)v28);
  uint64_t v21 = (ObjConverter *)*((void *)this + 13);
  if (v21 != (ObjConverter *)((char *)this + 112))
  {
    do
    {
      if (*((char *)v21 + 55) < 0)
      {
        sub_100004FE8(__p, *((void **)v21 + 4), *((void *)v21 + 5));
      }

      else
      {
        *(_OWORD *)std::string __p = *((_OWORD *)v21 + 2);
        uint64_t v27 = *((void *)v21 + 6);
      }

      ObjConverter::createMesh(this, (const void **)v28, *((uint64_t ***)v21 + 7), (uint64_t *)__p, inited);
      if (SHIBYTE(v27) < 0) {
        operator delete(__p[0]);
      }
      uint64_t v22 = (ObjConverter *)*((void *)v21 + 1);
      if (v22)
      {
        do
        {
          unint64_t v23 = v22;
          uint64_t v22 = *(ObjConverter **)v22;
        }

        while (v22);
      }

      else
      {
        do
        {
          unint64_t v23 = (ObjConverter *)*((void *)v21 + 2);
          BOOL v24 = *(void *)v23 == (void)v21;
          uint64_t v21 = v23;
        }

        while (!v24);
      }

      uint64_t v21 = v23;
    }

    while (v23 != (ObjConverter *)((char *)this + 112));
  }

  if (v29 < 0) {
    operator delete(v28[0]);
  }
  if (v31 < 0) {
    operator delete(v30);
  }
  return inited;
}

void sub_10000D2A0( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, void *__p, uint64_t a23, int a24, __int16 a25, char a26, char a27)
{
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10000D2F4(uint64_t a1)
{
  uint64_t v2 = *(void ***)a1;
  int v3 = *(void ***)(a1 + 8);
  while (v2 != v3)
  {
    unint64_t v4 = (void **)*v2;
    if (*v2)
    {
      unint64_t v5 = *v4;
      if (*v4)
      {
        v4[1] = v5;
        operator delete(v5);
      }

      operator delete(v4);
    }

    ++v2;
  }

  size_t v6 = *(void **)(a1 + 120);
  if (v6)
  {
    *(void *)(a1 + 12std::istream::~istream(v1, v2 + 8) = v6;
    operator delete(v6);
  }

  int v7 = *(void **)(a1 + 88);
  if (v7)
  {
    *(void *)(a1 + 96) = v7;
    operator delete(v7);
  }

  BOOL v8 = *(void **)(a1 + 56);
  if (v8)
  {
    *(void *)(a1 + 64) = v8;
    operator delete(v8);
  }

  unint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    *(void *)(a1 + 40) = v9;
    operator delete(v9);
  }

  int v10 = *(void ***)a1;
  if (*(void *)a1)
  {
    *(void *)(a1 + std::istream::~istream(v1, v2 + 8) = v10;
    operator delete(v10);
  }

  return a1;
}

void *sub_10000D3A0(void *a1, __int128 *a2)
{
  a1[2] = 0LL;
  a1[1] = 0LL;
  *a1 = a1 + 1;
  int v3 = a1 + 3;
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8(v3, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v4 = *a2;
    v3[2] = *((void *)a2 + 2);
    *(_OWORD *)int v3 = v4;
  }

  return a1;
}

void sub_10000D3F8(_Unwind_Exception *a1)
{
}

void sub_10000D410(uint64_t a1, void *a2)
{
  if (a2)
  {
    sub_10000D410(a1, *a2);
    sub_10000D410(a1, a2[1]);
    sub_10000D458((uint64_t)(a2 + 4));
    operator delete(a2);
  }

void sub_10000D458(uint64_t a1)
{
}

uint64_t sub_10000D4BC(uint64_t a1, int a2)
{
  *(_OWORD *)(a1 + 32) = 0u;
  *(void *)(a1 + 8std::istream::~istream(v1, v2 + 8) = 0LL;
  *(void *)(a1 + 120) = 0LL;
  *(void *)(a1 + 12std::istream::~istream(v1, v2 + 8) = 0LL;
  *(void *)(a1 + 136) = 0LL;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 4std::istream::~istream(v1, v2 + 8) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_BYTE *)(a1 + 80) = 0;
  *(void *)(a1 + 96) = 0LL;
  *(void *)(a1 + 104) = 0LL;
  *(_BYTE *)(a1 + 112) = 0;
  ObjConverter::Group::setMaterial((ObjConverter::Group *)a1, a2);
  return a1;
}

void sub_10000D528(_Unwind_Exception *a1)
{
  size_t v6 = v5;
  BOOL v8 = *v6;
  if (*v6)
  {
    *(void *)(v1 + 12std::istream::~istream(v1, v2 + 8) = v8;
    operator delete(v8);
  }

  sub_100011C5C(v3, v4, v2, v1);
  _Unwind_Resume(a1);
}

void sub_10000D55C(uint64_t *a1, unint64_t a2)
{
  uint64_t v3 = a1[1];
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((v3 - *a1) >> 3);
  BOOL v5 = a2 >= v4;
  unint64_t v6 = a2 - v4;
  if (v6 != 0 && v5)
  {
    sub_10000D790(a1, v6);
  }

  else if (!v5)
  {
    uint64_t v7 = *a1 + 24 * a2;
    while (v3 != v7)
    {
      v3 -= 24LL;
    }

    a1[1] = v7;
  }

void (__cdecl ***sub_10000D5E8( void (__cdecl ***a1)(std::basic_stringstream<char> *__hidden this), const std::string *a2, int a3))(std::basic_stringstream<char> *__hidden this)
{
  BOOL v5 = a1 + 2;
  uint64_t v6 = (uint64_t)(a1 + 3);
  *a1 = v7;
  *(void *)((char *)*(v7 - 3) + (void)a1) = v8;
  a1[1] = 0LL;
  unint64_t v9 = (std::ios_base *)((char *)*(*a1 - 3) + (void)a1);
  std::ios_base::init(v9, a1 + 3);
  v9[1].__vftable = 0LL;
  v9[1].__fmtflags_ = -1;
  a1[2] = v10;
  *(void *)((char *)*(v10 - 3) + (void)v5) = v11;
  *a1 = v12;
  sub_10000DB48(v6, a2, a3);
  return a1;
}

void sub_10000D6E0(_Unwind_Exception *a1)
{
}

uint64_t sub_10000D708(uint64_t a1)
{
  uint64_t v4 = a1 + 24;
  *(void *)(a1 + 16) = v3;
  std::streambuf::~streambuf(v4);
  std::ios::~ios(a1 + 128);
  return a1;
}

void sub_10000D790(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 3) >= a2)
  {
    if (a2)
    {
      size_t v13 = 24 * ((24 * a2 - 24) / 0x18) + 24;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 3);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0xAAAAAAAAAAAAAAALL) {
      sub_100005508();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555LL) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)sub_10000D968(v4, v11);
    }
    else {
      uint64_t v12 = 0LL;
    }
    unint64_t v15 = v12;
    unint64_t v16 = &v12[24 * v8];
    uint64_t v18 = &v12[24 * v11];
    size_t v14 = 24 * ((24 * a2 - 24) / 0x18) + 24;
    bzero(v16, v14);
    uint64_t v17 = &v16[v14];
    sub_10000D8F4(a1, &v15);
    sub_10000DAC0((uint64_t)&v15);
  }

void sub_10000D8E0(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000D8F4(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000D9AC((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_10000D968(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    sub_1000050FC();
  }
  return operator new(24 * a2);
}

uint64_t sub_10000D9AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v15 = a6;
  *((void *)&v15 + 1) = a7;
  __int128 v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    uint64_t v9 = a7;
    do
    {
      __int128 v10 = *(_OWORD *)(a3 - 24);
      *(void *)(v9 - std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      *(void *)(a3 - 24) = 0LL;
      v7 -= 24LL;
      a3 -= 24LL;
    }

    while (a3 != a5);
    *((void *)&v15 + 1) = v9;
  }

  char v13 = 1;
  sub_10000DA48((uint64_t)v12);
  return a6;
}

uint64_t sub_10000DA48(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10000DA7C(a1);
  }
  return a1;
}

void sub_10000DA7C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 16) + 8LL);
  uint64_t v2 = *(void *)(*(void *)(a1 + 8) + 8LL);
  while (v1 != v2)
  {
    v1 += 24LL;
  }

uint64_t sub_10000DAC0(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void sub_10000DAF4(uint64_t a1, void **a2)
{
  uint64_t v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      uint64_t v5 = v2 - 3;
      *(void *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        uint64_t v5 = *(void ***)(a1 + 16);
      }

      uint64_t v2 = v5;
    }

    while (v5 != a2);
  }

uint64_t sub_10000DB48(uint64_t a1, const std::string *a2, int a3)
{
  uint64_t v6 = std::streambuf::basic_streambuf(a1);
  *(_OWORD *)(v6 + 64) = 0u;
  *(_OWORD *)(v6 + 80) = 0u;
  *(_DWORD *)(v6 + 96) = a3;
  std::string::operator=((std::string *)(v6 + 64), a2);
  sub_1000053F8(a1);
  return a1;
}

void sub_10000DBB4(_Unwind_Exception *a1)
{
}

char *sub_10000DBD8(char *__dst, __int128 *a2, __int128 *a3, __int128 *a4)
{
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8(__dst, *(void **)a2, *((void *)a2 + 1));
  }

  else
  {
    __int128 v7 = *a2;
    *((void *)__dst + 2) = *((void *)a2 + 2);
    *(_OWORD *)__dst = v7;
  }

  if (*((char *)a3 + 23) < 0)
  {
    sub_100004FE8(__dst + 24, *(void **)a3, *((void *)a3 + 1));
  }

  else
  {
    __int128 v8 = *a3;
    *((void *)__dst + 5) = *((void *)a3 + 2);
    *(_OWORD *)(__dst + 24) = v8;
  }

  if (*((char *)a4 + 23) < 0)
  {
    sub_100004FE8(__dst + 48, *(void **)a4, *((void *)a4 + 1));
  }

  else
  {
    __int128 v9 = *a4;
    *((void *)__dst + std::iostream::~basic_iostream(v2, v3 + 8) = *((void *)a4 + 2);
    *((_OWORD *)__dst + 3) = v9;
  }

  sub_1000076C8((void *)__dst + 9, (char *)&unk_100013692);
  float v10 = nanf((const char *)&unk_100013692);
  *((float *)__dst + 24) = v10;
  *((float *)__dst + 25) = v10;
  *((float *)__dst + 26) = v10;
  return __dst;
}

void sub_10000DCB0(_Unwind_Exception *exception_object)
{
}

void sub_10000DCFC(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 2;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)a1 + 4 * a2;
    }
  }

  else
  {
    sub_10000DD2C((char **)a1, a2 - v2);
  }

void sub_10000DD2C(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  __int128 v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 2)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 4 * a2);
      v7 += 4 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    __int128 v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 2);
    if (v10 >> 62) {
      sub_100005508();
    }
    uint64_t v11 = v9 >> 2;
    uint64_t v12 = v5 - v8;
    if (v12 >> 1 > v10) {
      unint64_t v10 = v12 >> 1;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      __int128 v14 = (char *)sub_100005D34(v4, v13);
      __int128 v8 = *a1;
      __int128 v7 = a1[1];
    }

    else
    {
      __int128 v14 = 0LL;
    }

    __int128 v15 = &v14[4 * v11];
    unint64_t v16 = &v14[4 * v13];
    bzero(v15, 4 * a2);
    uint64_t v17 = &v15[4 * a2];
    while (v7 != v8)
    {
      int v18 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }

    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

uint64_t sub_10000DE34(uint64_t *a1, __int128 *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL) {
    sub_100005508();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x555555555555555LL) {
    unint64_t v9 = 0xAAAAAAAAAAAAAAALL;
  }
  else {
    unint64_t v9 = v5;
  }
  int v18 = a1 + 2;
  if (v9) {
    unint64_t v10 = (char *)sub_10000D968(v7, v9);
  }
  else {
    unint64_t v10 = 0LL;
  }
  uint64_t v11 = &v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  unint64_t v16 = v11;
  uint64_t v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    sub_100004FE8(v11, *(void **)a2, *((void *)a2 + 1));
    uint64_t v11 = v16;
  }

  else
  {
    __int128 v12 = *a2;
    *((void *)v11 + 2) = *((void *)a2 + 2);
    *(_OWORD *)uint64_t v11 = v12;
  }

  unint64_t v16 = v11 + 24;
  sub_10000D8F4(a1, v15);
  uint64_t v13 = a1[1];
  sub_10000DAC0((uint64_t)v15);
  return v13;
}

void sub_10000DF40(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

void sub_10000DF54(uint64_t a1, char *a2)
{
  if (a2)
  {
    sub_10000DF54(a1, *(void *)a2);
    sub_10000DF54(a1, *((void *)a2 + 1));
    if (a2[55] < 0) {
      operator delete(*((void **)a2 + 4));
    }
    operator delete(a2);
  }

void sub_10000DFA4(void ***a1)
{
  unint64_t v2 = *a1;
  if (*v2)
  {
    sub_10000DFE4((uint64_t *)v2);
    operator delete(**a1);
  }

void sub_10000DFE4(uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24LL)
  {
  }

  a1[1] = v2;
}

void sub_10000E030(void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = (uint64_t)v1[1];
    unint64_t v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48LL;
        sub_10000E0B4((uint64_t)(v1 + 2), v4);
      }

      while ((void *)v4 != v2);
      unint64_t v5 = **a1;
    }

    v1[1] = v2;
    operator delete(v5);
  }

void sub_10000E0B4(uint64_t a1, uint64_t a2)
{
}

uint64_t sub_10000E0E8(uint64_t a1, const void **a2)
{
  uint64_t v2 = a1 + 8;
  uint64_t v3 = *(void *)(a1 + 8);
  if (!v3) {
    return v2;
  }
  uint64_t v5 = a1 + 16;
  uint64_t v6 = a1 + 8;
  do
  {
    BOOL v7 = sub_10000E174(v5, (const void **)(v3 + 32), a2);
    unint64_t v8 = (uint64_t *)(v3 + 8);
    if (!v7)
    {
      unint64_t v8 = (uint64_t *)v3;
      uint64_t v6 = v3;
    }

    uint64_t v3 = *v8;
  }

  while (*v8);
  return v6;
}

BOOL sub_10000E174(uint64_t a1, const void **a2, const void **a3)
{
  int v3 = *((char *)a3 + 23);
  int v4 = *((char *)a2 + 23);
  if (v4 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = (size_t)a2[1];
  }
  if (v4 >= 0) {
    uint64_t v6 = a2;
  }
  else {
    uint64_t v6 = *a2;
  }
  if (v3 >= 0) {
    size_t v7 = *((unsigned __int8 *)a3 + 23);
  }
  else {
    size_t v7 = (size_t)a3[1];
  }
  if (v3 >= 0) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = *a3;
  }
  if (v7 >= v5) {
    size_t v9 = v5;
  }
  else {
    size_t v9 = v7;
  }
  int v10 = memcmp(v6, v8, v9);
  if (v10) {
    return v10 < 0;
  }
  else {
    return v5 < v7;
  }
}

uint64_t sub_10000E1DC(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  unint64_t v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555LL) {
    sub_100005508();
  }
  uint64_t v7 = (uint64_t)(a1 + 2);
  unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5) {
    unint64_t v5 = 2 * v8;
  }
  if (v8 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v9 = 0x555555555555555LL;
  }
  else {
    unint64_t v9 = v5;
  }
  v20[4] = a1 + 2;
  if (v9) {
    int v10 = (char *)sub_10000E39C(v7, v9);
  }
  else {
    int v10 = 0LL;
  }
  uint64_t v11 = &v10[48 * v4];
  v20[0] = v10;
  v20[1] = v11;
  v20[3] = &v10[48 * v9];
  *(void *)uint64_t v11 = *(void *)a2;
  __int128 v12 = (void *)(a2 + 8);
  uint64_t v13 = *(void *)(a2 + 8);
  *((void *)v11 + 1) = v13;
  __int128 v14 = v11 + 8;
  uint64_t v15 = *(void *)(a2 + 16);
  *((void *)v11 + 2) = v15;
  if (v15)
  {
    *(void *)(v13 + 16) = v14;
    *(void *)a2 = v12;
    void *v12 = 0LL;
    *(void *)(a2 + 16) = 0LL;
  }

  else
  {
    *(void *)uint64_t v11 = v14;
  }

  __int128 v16 = *(_OWORD *)(a2 + 24);
  uint64_t v17 = &v10[48 * v4];
  *((void *)v17 + 5) = *(void *)(a2 + 40);
  *(_OWORD *)(v17 + 24) = v16;
  *(void *)(a2 + 32) = 0LL;
  *(void *)(a2 + 40) = 0LL;
  *(void *)(a2 + 24) = 0LL;
  v20[2] = v11 + 48;
  sub_10000E328(a1, v20);
  uint64_t v18 = a1[1];
  sub_10000E53C(v20);
  return v18;
}

void sub_10000E314(_Unwind_Exception *a1, uint64_t a2, ...)
{
}

uint64_t sub_10000E328(uint64_t *a1, void *a2)
{
  uint64_t result = sub_10000E3E0((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  uint64_t v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  uint64_t v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *sub_10000E39C(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556LL) {
    sub_1000050FC();
  }
  return operator new(48 * a2);
}

uint64_t sub_10000E3E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7 = a7;
  *(void *)&__int128 v20 = a6;
  *((void *)&v20 + 1) = a7;
  __int128 v19 = v20;
  v17[0] = a1;
  v17[1] = &v19;
  v17[2] = &v20;
  if (a3 == a5)
  {
    uint64_t v15 = a6;
  }

  else
  {
    uint64_t v8 = a3;
    do
    {
      uint64_t v9 = *(void *)(v8 - 48);
      v8 -= 48LL;
      *(void *)(v7 - 4std::iostream::~basic_iostream(v2, v3 + 8) = v9;
      int v10 = (void *)(a3 - 40);
      uint64_t v11 = *(void *)(a3 - 40);
      *(void *)(v7 - 40) = v11;
      uint64_t v12 = v7 - 40;
      uint64_t v13 = *(void *)(a3 - 32);
      *(void *)(v7 - 32) = v13;
      if (v13)
      {
        *(void *)(v11 + 16) = v12;
        *(void *)(a3 - 4std::iostream::~basic_iostream(v2, v3 + 8) = v10;
        void *v10 = 0LL;
        *(void *)(a3 - 32) = 0LL;
      }

      else
      {
        *(void *)(v7 - 4std::iostream::~basic_iostream(v2, v3 + 8) = v12;
      }

      __int128 v14 = *(_OWORD *)(a3 - 24);
      *(void *)(v7 - std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)(a3 - 8);
      *(_OWORD *)(v7 - 24) = v14;
      *(void *)(a3 - 24) = 0LL;
      *(void *)(a3 - 16) = 0LL;
      *(void *)(a3 - std::iostream::~basic_iostream(v2, v3 + 8) = 0LL;
      uint64_t v7 = *((void *)&v20 + 1) - 48LL;
      *((void *)&v20 + 1) -= 48LL;
      a3 = v8;
    }

    while (v8 != a5);
    uint64_t v15 = v20;
  }

  char v18 = 1;
  sub_10000E4B8((uint64_t)v17);
  return v15;
}

uint64_t sub_10000E4B8(uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24)) {
    sub_10000E4EC((uint64_t *)a1);
  }
  return a1;
}

void sub_10000E4EC(uint64_t *a1)
{
  uint64_t v1 = *(void *)(a1[2] + 8);
  uint64_t v2 = *(void *)(a1[1] + 8);
  if (v1 != v2)
  {
    uint64_t v3 = *a1;
    do
    {
      sub_10000E0B4(v3, v1);
      v1 += 48LL;
    }

    while (v1 != v2);
  }

void **sub_10000E53C(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void sub_10000E56C(void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 48;
    sub_10000E0B4(v4, i - 48);
  }

uint64_t *sub_10000E5B0(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  uint64_t v6 = (uint64_t **)sub_10000E644((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000E6E0((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000E784(a1, v9, v6, v8);
    return v8;
  }

  return result;
}

void *sub_10000E644(uint64_t a1, void *a2, const void **a3)
{
  uint64_t v5 = (void *)(a1 + 8);
  uint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint64_t v7 = a1 + 16;
    do
    {
      while (1)
      {
        uint64_t v8 = (void *)v4;
        uint64_t v9 = (const void **)(v4 + 32);
        uint64_t v4 = *v8;
        uint64_t v5 = v8;
        if (!*v8) {
          goto LABEL_10;
        }
      }

      if (!sub_10000E174(v7, v9, a3)) {
        break;
      }
      uint64_t v5 = v8 + 1;
      uint64_t v4 = v8[1];
    }

    while (v4);
  }

  else
  {
    uint64_t v8 = (void *)(a1 + 8);
  }

LABEL_10:
  *a2 = v8;
  return v5;
}

_BYTE *sub_10000E6E0@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  uint64_t v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  uint64_t v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_100004FE8(result, *(void **)v8, *((void *)v8 + 1));
  }

  else
  {
    __int128 v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t result = v9;
  }

  *((_DWORD *)v6 + 14) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_10000E768(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_10000E970(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t *sub_10000E784(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  *a4 = 0LL;
  a4[1] = 0LL;
  a4[2] = a2;
  *a3 = a4;
  uint64_t v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }

  uint64_t result = sub_10000E7D8(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_10000E7D8(uint64_t *result, uint64_t *a2)
{
  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      uint64_t v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24)) {
        return result;
      }
      uint64_t v3 = (uint64_t *)v2[2];
      uint64_t v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        uint64_t v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), uint64_t v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            __int128 v9 = (uint64_t **)a2[2];
          }

          else
          {
            __int128 v9 = (uint64_t **)v2[1];
            int v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              uint64_t v3 = (uint64_t *)v2[2];
            }

            v9[2] = v3;
            *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = v9;
            *__int128 v9 = v2;
            v2[2] = (uint64_t)v9;
            uint64_t v3 = v9[2];
            uint64_t v2 = (uint64_t *)*v3;
          }

          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          uint64_t v13 = v2[1];
          *uint64_t v3 = v13;
          if (v13) {
            *(void *)(v13 + 16) = v3;
          }
          v2[2] = v3[2];
          *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }

      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), uint64_t v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          uint64_t v11 = a2[1];
          *uint64_t v2 = v11;
          if (v11)
          {
            *(void *)(v11 + 16) = v2;
            uint64_t v3 = (uint64_t *)v2[2];
          }

          a2[2] = (uint64_t)v3;
          *(void *)(v2[2] + 8LL * (*(void *)v2[2] != (void)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          uint64_t v3 = (uint64_t *)a2[2];
        }

        else
        {
          a2 = (uint64_t *)a2[2];
        }

        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        uint64_t v2 = (uint64_t *)v3[1];
        uint64_t v12 = *v2;
        v3[1] = *v2;
        if (v12) {
          *(void *)(v12 + 16) = v3;
        }
        v2[2] = v3[2];
        *(void *)(v3[2] + 8LL * (*(void *)v3[2] != (void)v3)) = v2;
        *uint64_t v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }

      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *uint64_t v5 = 1;
    }

    while (v3 != result);
  }

  return result;
}

void sub_10000E970(uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
  }

  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t *sub_10000E9BC(uint64_t **a1, const void **a2, uint64_t a3, __int128 **a4)
{
  int v6 = (uint64_t **)sub_10000E644((uint64_t)a1, &v9, a2);
  uint64_t result = *v6;
  if (!*v6)
  {
    sub_10000EA50((uint64_t)a1, a4, (uint64_t)&v8);
    sub_10000E784(a1, v9, v6, v8);
    return v8;
  }

  return result;
}

_BYTE *sub_10000EA50@<X0>(uint64_t a1@<X0>, __int128 **a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v5 = a1 + 8;
  int v6 = (char *)operator new(0x40uLL);
  *(void *)a3 = v6;
  *(void *)(a3 + std::iostream::~basic_iostream(v2, v3 + 8) = v5;
  *(_BYTE *)(a3 + 16) = 0;
  uint64_t result = v6 + 32;
  int v8 = *a2;
  if (*((char *)*a2 + 23) < 0)
  {
    uint64_t result = sub_100004FE8(result, *(void **)v8, *((void *)v8 + 1));
  }

  else
  {
    __int128 v9 = *v8;
    *((void *)v6 + 6) = *((void *)v8 + 2);
    *(_OWORD *)uint64_t result = v9;
  }

  *((void *)v6 + 7) = 0LL;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

void sub_10000EAD8(_Unwind_Exception *a1)
{
  *uint64_t v1 = 0LL;
  sub_10000E970(v3, v2);
  _Unwind_Resume(a1);
}

uint64_t **sub_10000EAF4(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t v7 = a1 + 1;
  int v6 = a1[1];
  int v8 = a1 + 1;
  __int128 v9 = a1 + 1;
  if (v6)
  {
    int v10 = *a2;
    while (1)
    {
      while (1)
      {
        __int128 v9 = (uint64_t **)v6;
        int v11 = *((_DWORD *)v6 + 8);
        if (v10 >= v11) {
          break;
        }
        int v6 = *v9;
        int v8 = v9;
        if (!*v9) {
          goto LABEL_9;
        }
      }

      if (v11 >= v10) {
        break;
      }
      int v6 = v9[1];
      if (!v6)
      {
        int v8 = v9 + 1;
        goto LABEL_9;
      }
    }
  }

  else
  {
LABEL_9:
    uint64_t v12 = (char *)operator new(0x98uLL);
    v14[1] = v7;
    *((_DWORD *)v12 + std::iostream::~basic_iostream(v2, v3 + 8) = **a4;
    *(_OWORD *)(v12 + 132) = 0u;
    *(_OWORD *)(v12 + 120) = 0u;
    *(_OWORD *)(v12 + 104) = 0u;
    *(_OWORD *)(v12 + 8std::iostream::~basic_iostream(v2, v3 + 8) = 0u;
    *(_OWORD *)(v12 + 72) = 0u;
    *(_OWORD *)(v12 + 56) = 0u;
    *(_OWORD *)(v12 + 40) = 0u;
    char v15 = 1;
    sub_10000E784(a1, (uint64_t)v9, v8, (uint64_t *)v12);
    v14[0] = 0LL;
    sub_10000EBF4((uint64_t)v14, 0LL);
    return (uint64_t **)v12;
  }

  return v9;
}

void sub_10000EBF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16)) {
      sub_10000D458((uint64_t)v2 + 32);
    }
    operator delete(v2);
  }

void sub_10000EC38(uint64_t *a1, unint64_t a2)
{
  unint64_t v2 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 2);
  BOOL v3 = a2 >= v2;
  unint64_t v4 = a2 - v2;
  if (v4 != 0 && v3)
  {
    sub_10000EC74(a1, v4);
  }

  else if (!v3)
  {
    a1[1] = *a1 + 12 * a2;
  }

void sub_10000EC74(uint64_t *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(void *)(v4 - 8);
  if (0xAAAAAAAAAAAAAAABLL * ((v6 - v7) >> 2) >= a2)
  {
    if (a2)
    {
      size_t v13 = 12 * ((12 * a2 - 12) / 0xC) + 12;
      bzero(*(void **)(v4 - 8), v13);
      v7 += v13;
    }

    a1[1] = v7;
  }

  else
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((v7 - *a1) >> 2);
    unint64_t v9 = v8 + a2;
    if (v8 + a2 > 0x1555555555555555LL) {
      sub_100005508();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((v5 - *a1) >> 2);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v11 = 0x1555555555555555LL;
    }
    else {
      unint64_t v11 = v9;
    }
    uint64_t v19 = v4;
    if (v11) {
      uint64_t v12 = (char *)sub_10000551C(v4, v11);
    }
    else {
      uint64_t v12 = 0LL;
    }
    std::string __p = v12;
    __int128 v16 = &v12[12 * v8];
    char v18 = &v12[12 * v11];
    size_t v14 = 12 * ((12 * a2 - 12) / 0xC) + 12;
    bzero(v16, v14);
    uint64_t v17 = &v16[v14];
    sub_100005B6C(a1, &__p);
    if (v17 != v16) {
      uint64_t v17 = &v16[(v17 - v16 - 12) % 0xCuLL];
    }
    if (__p) {
      operator delete(__p);
    }
  }

void sub_10000EDFC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void sub_10000EE48(uint64_t a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(*(void *)(a1 + 8) - *(void *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      *(void *)(a1 + std::iostream::~basic_iostream(v2, v3 + 8) = *(void *)a1 + 8 * a2;
    }
  }

  else
  {
    sub_10000EF08((char **)a1, a2 - v2);
  }

void sub_10000EE78(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61) {
      sub_100005508();
    }
    int64_t v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    uint64_t v6 = (char *)sub_100006318(v3, a2);
    uint64_t v7 = &v6[v5];
    unint64_t v9 = &v6[8 * v8];
    unint64_t v10 = (char *)*a1;
    unint64_t v11 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v11 != *a1)
    {
      uint64_t v12 = v7;
      do
      {
        uint64_t v13 = *((void *)v11 - 1);
        v11 -= 8;
        *((void *)v12 - 1) = v13;
        v12 -= 8;
      }

      while (v11 != v10);
    }

    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10) {
      operator delete(v10);
    }
  }

void sub_10000EF08(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  int64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }

    a1[1] = v7;
  }

  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      sub_100005508();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    else {
      unint64_t v13 = v10;
    }
    if (v13)
    {
      size_t v14 = (char *)sub_100006318(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }

    else
    {
      size_t v14 = 0LL;
    }

    char v15 = &v14[8 * v11];
    __int128 v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    uint64_t v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      uint64_t v18 = *((void *)v7 - 1);
      v7 -= 8;
      *((void *)v15 - 1) = v18;
      v15 -= 8;
    }

    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8) {
      operator delete(v8);
    }
  }

void fileFormatUtils::makeValidIdentifier(uint64_t *a1@<X0>, std::string *a2@<X8>)
{
  BOOL v3 = *((char *)a1 + 23) < 0;
  uint64_t v4 = *((unsigned __int8 *)a1 + 23);
  if ((v4 & 0x80u) != 0LL) {
    uint64_t v4 = a1[1];
  }
  if (v4)
  {
    unint64_t v6 = 0LL;
    do
    {
      if (v3) {
        uint64_t v7 = (uint64_t *)*a1;
      }
      else {
        uint64_t v7 = a1;
      }
      __darwin_ct_rune_t v8 = *((char *)v7 + v6);
      if (v8 < 0) {
        __uint32_t v9 = __maskrune(v8, 0x500uLL);
      }
      else {
        __uint32_t v9 = _DefaultRuneLocale.__runetype[v8] & 0x500;
      }
      if (v9)
      {
        else {
          unint64_t v10 = (uint64_t *)*a1;
        }
        std::string::push_back(&v15, *((_BYTE *)v10 + v6));
      }

      else
      {
        std::string::append(&v15, "_");
      }

      ++v6;
      BOOL v3 = *((char *)a1 + 23) < 0;
      unint64_t v11 = *((unsigned __int8 *)a1 + 23);
      if ((v11 & 0x80u) != 0LL) {
        unint64_t v11 = a1[1];
      }
    }

    while (v6 < v11);
    uint64_t v12 = (std::string *)v15.__r_.__value_.__r.__words[0];
    if ((v15.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      uint64_t v12 = &v15;
    }
    int v13 = v12->__r_.__value_.__s.__data_[0];
    if ((v13 & 0x80000000) == 0 && (_DefaultRuneLocale.__runetype[v13] & 0x400) != 0)
    {
      std::operator+<char>(&v14, "_", &v15);
      std::string v15 = v14;
    }

    *a2 = v15;
  }

  else
  {
    sub_1000076C8(a2, "defaultIdentifier");
  }

void sub_10000F188( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::fixExponent(std::string *a1)
{
  int64_t size = a1->__r_.__value_.__s.__size_;
  if ((size & 0x80u) == 0LL) {
    BOOL v3 = a1;
  }
  else {
    BOOL v3 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    uint64_t v4 = (char *)&v57;
  }
  else {
    uint64_t v4 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v5 = v59;
  }
  else {
    int64_t v5 = v58;
  }
  if (v5)
  {
    if ((size & 0x80u) != 0LL) {
      int64_t size = a1->__r_.__value_.__l.__size_;
    }
    if (size >= v5)
    {
      unint64_t v6 = (char *)v3 + size;
      int v7 = *v4;
      __darwin_ct_rune_t v8 = v3;
      do
      {
        int64_t v9 = size - v5;
        if (v9 == -1) {
          break;
        }
        unint64_t v10 = (char *)memchr(v8, v7, v9 + 1);
        if (!v10) {
          break;
        }
        unint64_t v11 = v10;
        if (!memcmp(v10, v4, v5))
        {
          if (v11 != v6)
          {
            std::string::size_type v12 = v11 - (char *)v3;
          }

          break;
        }

        __darwin_ct_rune_t v8 = (std::string *)(v11 + 1);
        int64_t size = v6 - (v11 + 1);
      }

      while (size >= v5);
    }
  }

  else
  {
    std::string::size_type v12 = 0LL;
LABEL_21:
    if ((v56 & 0x80u) == 0) {
      p_p = (const std::string::value_type *)&__p;
    }
    else {
      p_p = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v14 = v56;
    }
    else {
      std::string::size_type v14 = v55;
    }
    std::string::replace(a1, v12, v5, p_p, v14);
  }

  sub_1000076C8(&v57, "+E");
  sub_1000076C8(&__p, "e+");
  int64_t v15 = a1->__r_.__value_.__s.__size_;
  if ((v15 & 0x80u) == 0LL) {
    __int128 v16 = a1;
  }
  else {
    __int128 v16 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    uint64_t v17 = (char *)&v57;
  }
  else {
    uint64_t v17 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v18 = v59;
  }
  else {
    int64_t v18 = v58;
  }
  if (v18)
  {
    if ((v15 & 0x80u) != 0LL) {
      int64_t v15 = a1->__r_.__value_.__l.__size_;
    }
    if (v15 >= v18)
    {
      uint64_t v19 = (char *)v16 + v15;
      int v20 = *v17;
      uint64_t v21 = v16;
      do
      {
        int64_t v22 = v15 - v18;
        if (v22 == -1) {
          break;
        }
        unint64_t v23 = (char *)memchr(v21, v20, v22 + 1);
        if (!v23) {
          break;
        }
        BOOL v24 = v23;
        if (!memcmp(v23, v17, v18))
        {
          if (v24 != v19)
          {
            std::string::size_type v25 = v24 - (char *)v16;
          }

          break;
        }

        uint64_t v21 = (std::string *)(v24 + 1);
        int64_t v15 = v19 - (v24 + 1);
      }

      while (v15 >= v18);
    }
  }

  else
  {
    std::string::size_type v25 = 0LL;
LABEL_52:
    if ((v56 & 0x80u) == 0) {
      unint64_t v26 = (const std::string::value_type *)&__p;
    }
    else {
      unint64_t v26 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v27 = v56;
    }
    else {
      std::string::size_type v27 = v55;
    }
    std::string::replace(a1, v25, v18, v26, v27);
  }

  sub_1000076C8(&v57, "-e");
  sub_1000076C8(&__p, "e-");
  int64_t v28 = a1->__r_.__value_.__s.__size_;
  if ((v28 & 0x80u) == 0LL) {
    char v29 = a1;
  }
  else {
    char v29 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    unsigned __int8 v30 = (char *)&v57;
  }
  else {
    unsigned __int8 v30 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v31 = v59;
  }
  else {
    int64_t v31 = v58;
  }
  if (v31)
  {
    if ((v28 & 0x80u) != 0LL) {
      int64_t v28 = a1->__r_.__value_.__l.__size_;
    }
    if (v28 >= v31)
    {
      int v32 = (char *)v29 + v28;
      int v33 = *v30;
      __darwin_ct_rune_t v34 = v29;
      do
      {
        int64_t v35 = v28 - v31;
        if (v35 == -1) {
          break;
        }
        uint64_t v36 = (char *)memchr(v34, v33, v35 + 1);
        if (!v36) {
          break;
        }
        std::string::size_type v37 = v36;
        if (!memcmp(v36, v30, v31))
        {
          if (v37 != v32)
          {
            std::string::size_type v38 = v37 - (char *)v29;
          }

          break;
        }

        __darwin_ct_rune_t v34 = (std::string *)(v37 + 1);
        int64_t v28 = v32 - (v37 + 1);
      }

      while (v28 >= v31);
    }
  }

  else
  {
    std::string::size_type v38 = 0LL;
LABEL_83:
    if ((v56 & 0x80u) == 0) {
      int v39 = (const std::string::value_type *)&__p;
    }
    else {
      int v39 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v40 = v56;
    }
    else {
      std::string::size_type v40 = v55;
    }
    std::string::replace(a1, v38, v31, v39, v40);
  }

  sub_1000076C8(&v57, "-E");
  sub_1000076C8(&__p, "e-");
  int64_t v41 = a1->__r_.__value_.__s.__size_;
  if ((v41 & 0x80u) == 0LL) {
    __darwin_ct_rune_t v42 = a1;
  }
  else {
    __darwin_ct_rune_t v42 = (std::string *)a1->__r_.__value_.__r.__words[0];
  }
  if ((v59 & 0x80u) == 0) {
    int v43 = (char *)&v57;
  }
  else {
    int v43 = (char *)v57;
  }
  if ((v59 & 0x80u) == 0) {
    int64_t v44 = v59;
  }
  else {
    int64_t v44 = v58;
  }
  if (v44)
  {
    if ((v41 & 0x80u) != 0LL) {
      int64_t v41 = a1->__r_.__value_.__l.__size_;
    }
    if (v41 >= v44)
    {
      BOOL v45 = (char *)v42 + v41;
      int v46 = *v43;
      int v47 = v42;
      do
      {
        int64_t v48 = v41 - v44;
        if (v48 == -1) {
          break;
        }
        std::locale v49 = (char *)memchr(v47, v46, v48 + 1);
        if (!v49) {
          break;
        }
        int v50 = v49;
        if (!memcmp(v49, v43, v44))
        {
          if (v50 != v45)
          {
            std::string::size_type v51 = v50 - (char *)v42;
          }

          break;
        }

        int v47 = (std::string *)(v50 + 1);
        int64_t v41 = v45 - (v50 + 1);
      }

      while (v41 >= v44);
    }
  }

  else
  {
    std::string::size_type v51 = 0LL;
LABEL_114:
    if ((v56 & 0x80u) == 0) {
      int v52 = (const std::string::value_type *)&__p;
    }
    else {
      int v52 = (const std::string::value_type *)__p;
    }
    if ((v56 & 0x80u) == 0) {
      std::string::size_type v53 = v56;
    }
    else {
      std::string::size_type v53 = v55;
    }
    std::string::replace(a1, v51, v44, v52, v53);
  }

void sub_10000F658( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

float fileFormatUtils::getFloat(uint64_t *a1)
{
  if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_p = &__p;
  }
  else {
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  }
  double v2 = strtod((const char *)p_p, 0LL);
  return v2;
}

void sub_10000F718( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getPath(fileFormatUtils::Asset *this@<X0>, std::string *a2@<X8>)
{
  unint64_t v6 = (const std::string::value_type *)*((void *)this + 1);
  int64_t v5 = (char *)this + 8;
  uint64_t v4 = v6;
  int v7 = v5[23];
  if (v7 >= 0) {
    __darwin_ct_rune_t v8 = v5;
  }
  else {
    __darwin_ct_rune_t v8 = v4;
  }
  if (v7 >= 0) {
    std::string::size_type v9 = v5[23];
  }
  else {
    std::string::size_type v9 = *((void *)v5 + 1);
  }
  unint64_t v10 = std::string::append(&v11, v8, v9);
  *a2 = *v10;
  v10->__r_.__value_.__l.__size_ = 0LL;
  v10->__r_.__value_.__l.__cap_ = 0LL;
  v10->__r_.__value_.__r.__words[0] = 0LL;
}

void sub_10000F7B8( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getMaterialsPath(fileFormatUtils::Asset *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 32;
  if (*((char *)this + 55) < 0)
  {
    if (*((void *)this + 5)) {
      goto LABEL_11;
    }
  }

  else if (*((_BYTE *)this + 55))
  {
LABEL_9:
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = *((void *)v4 + 2);
    return;
  }

  fileFormatUtils::Asset::getPath(this, &__p);
  int64_t v5 = std::string::append(&__p, "/Materials");
  std::string::size_type v6 = v5->__r_.__value_.__r.__words[0];
  v10[0] = v5->__r_.__value_.__l.__size_;
  *(void *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
  unsigned __int8 size = v5->__r_.__value_.__s.__size_;
  v5->__r_.__value_.__l.__size_ = 0LL;
  v5->__r_.__value_.__l.__cap_ = 0LL;
  v5->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v8 = v10[0];
  *((void *)this + 4) = v6;
  *((void *)this + 5) = v8;
  *(void *)((char *)this + 47) = *(void *)((char *)v10 + 7);
  *((_BYTE *)this + 55) = size;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((_BYTE *)this + 55) & 0x80) == 0) {
      goto LABEL_9;
    }
  }

  else if ((size & 0x80) == 0)
  {
    goto LABEL_9;
  }

void sub_10000F8EC( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Asset::getGeomPath(fileFormatUtils::Asset *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (char *)this + 56;
  if (*((char *)this + 79) < 0)
  {
    if (*((void *)this + 8)) {
      goto LABEL_11;
    }
  }

  else if (*((_BYTE *)this + 79))
  {
LABEL_9:
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = *((void *)v4 + 2);
    return;
  }

  fileFormatUtils::Asset::getPath(this, &__p);
  int64_t v5 = std::string::append(&__p, "/Geom");
  std::string::size_type v6 = v5->__r_.__value_.__r.__words[0];
  v10[0] = v5->__r_.__value_.__l.__size_;
  *(void *)((char *)v10 + 7) = *(std::string::size_type *)((char *)&v5->__r_.__value_.__r.__words[1] + 7);
  unsigned __int8 size = v5->__r_.__value_.__s.__size_;
  v5->__r_.__value_.__l.__size_ = 0LL;
  v5->__r_.__value_.__l.__cap_ = 0LL;
  v5->__r_.__value_.__r.__words[0] = 0LL;
  uint64_t v8 = v10[0];
  *((void *)this + 7) = v6;
  *((void *)this + std::iostream::~basic_iostream(v2, v3 + 8) = v8;
  *(void *)((char *)this + 71) = *(void *)((char *)v10 + 7);
  *((_BYTE *)this + 79) = size;
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if ((*((_BYTE *)this + 79) & 0x80) == 0) {
      goto LABEL_9;
    }
  }

  else if ((size & 0x80) == 0)
  {
    goto LABEL_9;
  }

void sub_10000FA28( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

uint64_t fileFormatUtils::Asset::initStage(fileFormatUtils::Asset *this)
{
  double v2 = (char *)operator new(0x68uLL);
  sub_10000741C((uint64_t)v2);
  *(void *)this = v2;
  std::string::operator=((std::string *)(v2 + 64), (const std::string *)((char *)this + 8));
  return *(void *)this;
}

void sub_10000FA8C(_Unwind_Exception *a1)
{
}

serialize::Mat *fileFormatUtils::Material::makeSerializeMaterial( fileFormatUtils::Material *this, fileFormatUtils::Asset *a2)
{
  uint64_t v4 = std::string::append(&v16, "/");
  __int128 v5 = *(_OWORD *)&v4->__r_.__value_.__l.__data_;
  v17.__r_.__value_.__l.__cap_ = v4->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v17.__r_.__value_.__l.__data_ = v5;
  v4->__r_.__value_.__l.__size_ = 0LL;
  v4->__r_.__value_.__l.__cap_ = 0LL;
  v4->__r_.__value_.__r.__words[0] = 0LL;
  int v6 = *((char *)this + 47);
  if (v6 >= 0) {
    int v7 = (char *)this + 24;
  }
  else {
    int v7 = (const std::string::value_type *)*((void *)this + 3);
  }
  if (v6 >= 0) {
    std::string::size_type v8 = *((unsigned __int8 *)this + 47);
  }
  else {
    std::string::size_type v8 = *((void *)this + 4);
  }
  std::string::size_type v9 = std::string::append(&v17, v7, v8);
  unint64_t v10 = (void *)v9->__r_.__value_.__r.__words[0];
  unint64_t size = v9->__r_.__value_.__l.__size_;
  v18[0] = v9->__r_.__value_.__r.__words[2];
  *(_DWORD *)((char *)v18 + 3) = *(_DWORD *)((char *)&v9->__r_.__value_.__r.__words[2] + 3);
  int v12 = (char)v9->__r_.__value_.__s.__size_;
  v9->__r_.__value_.__l.__size_ = 0LL;
  v9->__r_.__value_.__l.__cap_ = 0LL;
  v9->__r_.__value_.__r.__words[0] = 0LL;
  int v13 = (char *)operator new(0x40uLL);
  std::string::size_type v14 = (serialize::Mat *)v13;
  *(void *)int v13 = off_1000145C8;
  *((_DWORD *)v13 + 2) = 6;
  if (v12 < 0)
  {
    sub_100004FE8(v13 + 16, v10, size);
  }

  else
  {
    *((void *)v13 + 2) = v10;
    *((void *)v13 + 3) = size;
    *((_DWORD *)v13 + std::iostream::~basic_iostream(v2, v3 + 8) = v18[0];
    *(_DWORD *)(v13 + 35) = *(_DWORD *)((char *)v18 + 3);
    v13[39] = v12;
  }

  *((void *)v14 + 5) = 0LL;
  *((void *)v14 + 6) = 0LL;
  *((void *)v14 + 7) = 0LL;
  *(void *)std::string::size_type v14 = &off_100014728;
  fileFormatUtils::Material::updateSerializeMaterial((uint64_t **)this, v14, *(serialize::Stage **)a2);
  serialize::Prim::addChild(*(serialize::Prim **)a2, v14);
  if (v12 < 0) {
    operator delete(v10);
  }
  return v14;
}

void sub_10000FC0C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21)
{
}

void fileFormatUtils::Material::updateSerializeMaterial( uint64_t **this, serialize::Mat *a2, serialize::Stage *a3)
{
  for (int i = 0; i != 7; ++i)
    fileFormatUtils::Material::_addMapToSerializeMaterial((uint64_t)this, i, (uint64_t)a2);
}

void fileFormatUtils::Material::_makeTextureShaderNames(uint64_t **this)
{
  int v2 = 0;
  BOOL v3 = this + 1;
  do
  {
    v67[0] = v2;
    uint64_t v4 = *v3;
    if (*v3)
    {
      __int128 v5 = v3;
      do
      {
        int v6 = *(_DWORD *)(v4 + 32);
        BOOL v7 = v6 < v2;
        if (v6 >= v2) {
          std::string::size_type v8 = (uint64_t *)v4;
        }
        else {
          std::string::size_type v8 = (uint64_t *)(v4 + 8);
        }
        if (!v7) {
          __int128 v5 = (void *)v4;
        }
        uint64_t v4 = *v8;
      }

      while (*v8);
      if (v5 != v3 && *((_DWORD *)v5 + 8) <= v2)
      {
        __str.__r_.__value_.__r.__words[0] = (std::string::size_type)v67;
        std::string::size_type v9 = sub_10000EAF4(this, v67, (uint64_t)&std::piecewise_construct, &__str);
        unint64_t v10 = v9;
        if (*((char *)v9 + 87) < 0)
        {
          if (!v9[9]) {
            goto LABEL_12;
          }
        }

        else if (!*((_BYTE *)v9 + 87))
        {
          goto LABEL_12;
        }

        if (*((char *)v9 + 135) < 0)
        {
          if (v9[15]) {
            goto LABEL_12;
          }
        }

        else if (*((_BYTE *)v9 + 135))
        {
          goto LABEL_12;
        }

        sub_1000104EC(v67[0], (uint64_t)&__str);
        BOOL v63 = 0LL;
        uint64_t v64 = 0LL;
        int v65 = 0LL;
        std::string v11 = (std::string **)sub_100006318((uint64_t)&v65, 1uLL);
        *std::string v11 = (std::string *)(v10 + 5);
        int v13 = v11 + 1;
        int64_t v15 = v63;
        std::string::size_type v14 = v64;
        std::string v16 = v11;
        if (v64 != v63)
        {
          do
          {
            std::string v17 = *--v14;
            *--std::string v16 = v17;
          }

          while (v14 != v15);
          std::string::size_type v14 = v63;
        }

        BOOL v63 = v16;
        uint64_t v64 = v11 + 1;
        int v65 = (char *)&v11[v12];
        if (v14) {
          operator delete(v14);
        }
        uint64_t v64 = v13;
        if (v67[0]) {
          BOOL v18 = v2 > 5;
        }
        else {
          BOOL v18 = 1;
        }
        int v19 = v2;
        if (v18)
        {
LABEL_120:
          int64_t v58 = v63;
          if (v63 != v13)
          {
            do
              std::string::operator=(*v58++ + 3, &__str);
            while (v58 != v13);
            int v13 = v63;
          }

          if (v13)
          {
            uint64_t v64 = v13;
            operator delete(v13);
          }

          goto LABEL_12;
        }

        while (1)
        {
          int v20 = v19 + 1;
          int v62 = v19 + 1;
          uint64_t v21 = *v3;
          if (!*v3) {
            goto LABEL_114;
          }
          int64_t v22 = v3;
          do
          {
            int v23 = *(_DWORD *)(v21 + 32);
            BOOL v24 = v23 <= v19;
            if (v23 <= v19) {
              std::string::size_type v25 = (uint64_t *)(v21 + 8);
            }
            else {
              std::string::size_type v25 = (uint64_t *)v21;
            }
            if (!v24) {
              int64_t v22 = (void *)v21;
            }
            uint64_t v21 = *v25;
          }

          while (*v25);
          if (v22 == v3 || *((_DWORD *)v22 + 8) > v20) {
            goto LABEL_114;
          }
          __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v62;
          unint64_t v26 = sub_10000EAF4(this, &v62, (uint64_t)&std::piecewise_construct, &__p);
          std::string::size_type v27 = v26;
          uint64_t v28 = *((unsigned __int8 *)v26 + 87);
          if (*((char *)v26 + 87) < 0)
          {
            size_t v29 = (size_t)v26[9];
            if (!v29) {
              goto LABEL_114;
            }
          }

          else
          {
            if (!*((_BYTE *)v26 + 87)) {
              goto LABEL_114;
            }
            size_t v29 = (size_t)v26[9];
          }

          if ((v28 & 0x80u) == 0LL) {
            size_t v30 = *((unsigned __int8 *)v26 + 87);
          }
          else {
            size_t v30 = v29;
          }
          int64_t v31 = (uint64_t *)*((unsigned __int8 *)v10 + 87);
          int v32 = (char)v31;
          if ((uint64_t *)v30 == v31)
          {
            int v33 = (const void **)(v26 + 8);
            if (v32 >= 0) {
              __darwin_ct_rune_t v34 = (uint64_t *)(v10 + 8);
            }
            else {
              __darwin_ct_rune_t v34 = v10[8];
            }
            if ((v28 & 0x80) == 0)
            {
              while (*(unsigned __int8 *)v33 == *(unsigned __int8 *)v34)
              {
                int v33 = (const void **)((char *)v33 + 1);
                __darwin_ct_rune_t v34 = (uint64_t *)((char *)v34 + 1);
                if (!--v28) {
                  goto LABEL_59;
                }
              }

              goto LABEL_114;
            }

            if (!memcmp(*v33, v34, v29))
            {
LABEL_59:
              unsigned __int8 v59 = (std::string *)(v27 + 5);
              float v35 = *((float *)v10 + 34);
              float v36 = *((float *)v27 + 34);
              uint64_t v37 = *((unsigned __int8 *)v10 + 63);
              else {
                std::string::size_type v38 = (uint64_t *)*((unsigned __int8 *)v10 + 63);
              }
              char v39 = *((_BYTE *)v27 + 63);
              std::string::size_type v40 = v39 < 0 ? v27[6] : (uint64_t *)*((unsigned __int8 *)v27 + 63);
              int64_t v41 = (v37 & 0x80u) == 0LL ? (uint64_t *)*((unsigned __int8 *)v10 + 63) : v10[6];
              __darwin_ct_rune_t v42 = v39 >= 0 ? (uint64_t *)*((unsigned __int8 *)v27 + 63) : v27[6];
              if (v41 != v42) {
                goto LABEL_84;
              }
              if (v39 >= 0) {
                int v43 = (unsigned __int8 *)(v27 + 5);
              }
              else {
                int v43 = (unsigned __int8 *)v59->__r_.__value_.__r.__words[0];
              }
              if ((v37 & 0x80) != 0)
              {
                if (memcmp(v10[5], v43, (size_t)v10[6])) {
                  goto LABEL_84;
                }
              }

              else if (*((_BYTE *)v10 + 63))
              {
                int64_t v44 = (unsigned __int8 *)(v10 + 5);
                while (*v44 == *v43)
                {
                  ++v44;
                  ++v43;
                  if (!--v37) {
                    goto LABEL_116;
                  }
                }

LABEL_84:
                sub_1000104EC(v62, (uint64_t)&v60);
                if ((v60.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  v45.__i_ = (std::__wrap_iter<const char *>::iterator_type)&v60;
                }
                else {
                  v45.__i_ = (std::__wrap_iter<const char *>::iterator_type)v60.__r_.__value_.__r.__words[0];
                }
                std::string::insert(&v60, v45, 95);
                std::string __p = v60;
                memset(&v60, 0, sizeof(v60));
                if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  p_p = &__p;
                }
                else {
                  p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
                }
                if ((__p.__r_.__value_.__s.__size_ & 0x80u) == 0) {
                  std::string::size_type cap_high = HIBYTE(__p.__r_.__value_.__l.__cap_);
                }
                else {
                  std::string::size_type cap_high = __p.__r_.__value_.__l.__size_;
                }
                std::string::append(&__str, (const std::string::value_type *)p_p, cap_high);
                int64_t v48 = v64;
                if (v64 >= (std::string **)v65)
                {
                  uint64_t v50 = v64 - v63;
                  unint64_t v51 = (v65 - (char *)v63) >> 2;
                  if (v51 <= v50 + 1) {
                    unint64_t v51 = v50 + 1;
                  }
                  else {
                    unint64_t v52 = v51;
                  }
                  if (v52) {
                    std::string::size_type v53 = (char *)sub_100006318((uint64_t)&v65, v52);
                  }
                  else {
                    std::string::size_type v53 = 0LL;
                  }
                  unsigned int v54 = &v53[8 * v50];
                  *(void *)unsigned int v54 = v59;
                  std::locale v49 = (std::string **)(v54 + 8);
                  unsigned __int8 v56 = v63;
                  std::string::size_type v55 = v64;
                  if (v64 != v63)
                  {
                    do
                    {
                      uint64_t v57 = (uint64_t)*--v55;
                      *((void *)v54 - 1) = v57;
                      v54 -= 8;
                    }

                    while (v55 != v56);
                    std::string::size_type v55 = v63;
                  }

                  BOOL v63 = (std::string **)v54;
                  uint64_t v64 = v49;
                  int v65 = &v53[8 * v52];
                  if (v55) {
                    operator delete(v55);
                  }
                }

                else
                {
                  unsigned int *v64 = v59;
                  std::locale v49 = v48 + 1;
                }

                uint64_t v64 = v49;
                goto LABEL_114;
              }

LABEL_116:
              if (v35 == v36
                && *((float *)v10 + 35) == *((float *)v27 + 35)
                && *((float *)v10 + 36) == *((float *)v27 + 36))
              {
                goto LABEL_84;
              }
            }
          }

LABEL_114:
          int v19 = v20;
          if (v20 == 6)
          {
            int v13 = v64;
            goto LABEL_120;
          }
        }
      }
    }

LABEL_12:
    ++v2;
  }

  while (v2 != 7);
}

void sub_1000101E4( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, void *a18, uint64_t a19, int a20, __int16 a21, char a22, char a23, uint64_t a24, void *__p, uint64_t a26, uint64_t a27, void *a28, uint64_t a29, int a30, __int16 a31, char a32, char a33)
{
  if (__p) {
    operator delete(__p);
  }
  if (a33 < 0) {
    operator delete(a28);
  }
  _Unwind_Resume(exception_object);
}

void fileFormatUtils::Material::_addMapToSerializeMaterial(uint64_t a1, int a2, uint64_t a3)
{
  int v25 = a2;
  uint64_t v3 = *(void *)(a1 + 8);
  if (v3)
  {
    uint64_t v5 = a1 + 8;
    do
    {
      int v6 = *(_DWORD *)(v3 + 32);
      BOOL v7 = v6 < a2;
      if (v6 >= a2) {
        std::string::size_type v8 = (uint64_t *)v3;
      }
      else {
        std::string::size_type v8 = (uint64_t *)(v3 + 8);
      }
      if (!v7) {
        uint64_t v5 = v3;
      }
      uint64_t v3 = *v8;
    }

    while (*v8);
    if (v5 != a1 + 8 && *(_DWORD *)(v5 + 32) <= a2)
    {
      int64_t v22 = &v25;
      std::string::size_type v9 = sub_10000EAF4((uint64_t **)a1, &v25, (uint64_t)&std::piecewise_construct, (_DWORD **)&v22);
      sub_1000109A8(v25, (uint64_t)&v22);
      std::string v11 = (char *)v9 + 63;
      else {
        uint64_t v12 = (uint64_t *)*((unsigned __int8 *)v9 + 63);
      }
      int v13 = (uint64_t *)v24;
      if ((v24 & 0x80u) != 0) {
        int v13 = v23;
      }
      if (v12 == v13) {
        std::string::size_type v14 = (std::string *)(v9 + 5);
      }
      else {
        std::string::size_type v14 = (std::string *)&v22;
      }
      if (v12 != v13) {
        std::string v11 = (char *)&v24;
      }
      if (*v11 < 0)
      {
        if (v12 == v13) {
          int64_t v15 = (unint64_t *)(v9 + 6);
        }
        else {
          int64_t v15 = (unint64_t *)&v23;
        }
        unint64_t v10 = sub_100004FE8(&__str, v14->__r_.__value_.__l.__data_, *v15);
      }

      else
      {
        std::string __str = *v14;
      }

      if (*((char *)v9 + 87) < 0)
      {
        if (v9[9])
        {
LABEL_29:
          if (*(char *)(a3 + 39) < 0)
          {
            unint64_t v10 = sub_100004FE8(__p, *(void **)(a3 + 16), *(void *)(a3 + 24));
          }

          else
          {
            *(_OWORD *)std::string __p = *(_OWORD *)(a3 + 16);
            uint64_t v20 = *(void *)(a3 + 32);
          }

          Shader = fileFormatUtils::Material::_makeShader( (uint64_t)v10,  (const void **)__p,  (uint64_t)(v9 + 5),  v25,  &__str);
          serialize::Prim::addChild((serialize::Prim *)a3, (serialize::Prim *)Shader);
          if (SHIBYTE(v20) < 0) {
            operator delete(__p[0]);
          }
          goto LABEL_36;
        }
      }

      else if (*((_BYTE *)v9 + 87))
      {
        goto LABEL_29;
      }

      std::string v16 = (char *)operator new(0x68uLL);
      sub_1000074FC((uint64_t)v16, v25);
      std::string v17 = v9[17];
      *((_DWORD *)v16 + 19) = *((_DWORD *)v9 + 36);
      *(void *)(v16 + 6std::iostream::~basic_iostream(v2, v3 + 8) = v17;
      std::string::operator=((std::string *)(v16 + 80), &__str);
      serialize::Prim::addChild((serialize::Prim *)a3, (serialize::Prim *)v16);
LABEL_36:
    }
  }

void sub_100010444( _Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *a23, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a21 < 0) {
    operator delete(__p);
  }
  if (a28 < 0) {
    operator delete(a23);
  }
  _Unwind_Resume(exception_object);
}

BOOL fileFormatUtils::Material::hasInput(uint64_t a1, int a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v2 = a1 + 8;
  uint64_t v3 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  uint64_t v5 = v2;
  do
  {
    int v6 = *(_DWORD *)(v3 + 32);
    BOOL v7 = v6 < a2;
    if (v6 >= a2) {
      std::string::size_type v8 = (uint64_t *)v3;
    }
    else {
      std::string::size_type v8 = (uint64_t *)(v3 + 8);
    }
    if (!v7) {
      uint64_t v5 = v3;
    }
    uint64_t v3 = *v8;
  }

  while (*v8);
  if (v5 == v2 || *(_DWORD *)(v5 + 32) > a2) {
LABEL_11:
  }
    uint64_t v5 = v2;
  return v5 != v2;
}

void sub_1000104EC(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void **)&v6[3 * a1];
  if (*((char *)v4 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)a2, *v4, (unint64_t)v4[1]);
  }

  else
  {
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = v4[2];
  }

  for (uint64_t i = 0LL; i != -21; i -= 3LL)
  {
    if (SHIBYTE(v12[i + 2]) < 0) {
      operator delete((void *)v12[i]);
    }
  }

void sub_100010638( _Unwind_Exception *exception_object, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = 0LL;
  while (1)
  {
    v10 -= 24LL;
    if (v10 == -168) {
      _Unwind_Resume(exception_object);
    }
  }

char *fileFormatUtils::Material::_makeShader( uint64_t a1, const void **a2, uint64_t a3, int a4, const std::string *a5)
{
  std::string::size_type v9 = (char *)operator new(0xB0uLL);
  else {
    size_t v10 = (size_t)a2[1];
  }
  std::string v11 = &v33;
  sub_100005D68((uint64_t)&v33, v10 + 1);
  if ((v33.__r_.__value_.__s.__size_ & 0x80u) != 0) {
    std::string v11 = (std::string *)v33.__r_.__value_.__r.__words[0];
  }
  if (v10)
  {
    else {
      uint64_t v12 = *a2;
    }
    memmove(v11, v12, v10);
  }

  *(_WORD *)((char *)&v11->__r_.__value_.__l.__data_ + v10) = 47;
  int v13 = *(char *)(a3 + 95);
  if (v13 >= 0) {
    std::string::size_type v14 = (const std::string::value_type *)(a3 + 72);
  }
  else {
    std::string::size_type v14 = *(const std::string::value_type **)(a3 + 72);
  }
  if (v13 >= 0) {
    std::string::size_type v15 = *(unsigned __int8 *)(a3 + 95);
  }
  else {
    std::string::size_type v15 = *(void *)(a3 + 80);
  }
  std::string v16 = std::string::append(&v33, v14, v15);
  __int128 v17 = *(_OWORD *)&v16->__r_.__value_.__l.__data_;
  v34.__r_.__value_.__l.__cap_ = v16->__r_.__value_.__l.__cap_;
  *(_OWORD *)&v34.__r_.__value_.__l.__data_ = v17;
  v16->__r_.__value_.__l.__size_ = 0LL;
  v16->__r_.__value_.__l.__cap_ = 0LL;
  v16->__r_.__value_.__r.__words[0] = 0LL;
  BOOL v18 = std::string::append(&v34, "_texture");
  __int128 v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
  std::string::size_type cap = v18->__r_.__value_.__l.__cap_;
  *(_OWORD *)std::string __p = v19;
  v18->__r_.__value_.__l.__size_ = 0LL;
  v18->__r_.__value_.__l.__cap_ = 0LL;
  v18->__r_.__value_.__r.__words[0] = 0LL;
  sub_1000075D8((uint64_t)v9, a4, (__int128 *)__p);
  if (SHIBYTE(cap) < 0) {
    operator delete(__p[0]);
  }
  if ((char)v33.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(v33.__r_.__value_.__l.__data_);
    if (a4)
    {
LABEL_23:
      int v20 = *(_DWORD *)(a3 + 96);
      int size = a5->__r_.__value_.__s.__size_;
      if ((char)a5->__r_.__value_.__s.__size_ < 0)
      {
        std::string::size_type v28 = a5->__r_.__value_.__l.__size_;
        if (v28 != 1)
        {
          if (v28 != 3) {
            goto LABEL_54;
          }
          if (*(_WORD *)a5->__r_.__value_.__l.__data_ != 26482
            || *(_BYTE *)(a5->__r_.__value_.__r.__words[0] + 2) != 98)
          {
            goto LABEL_54;
          }

LABEL_49:
          *((_DWORD *)v9 + 17) = v20;
          *((void *)v9 + 9) = *(void *)(a3 + 100);
          goto LABEL_55;
        }

        if (*a5->__r_.__value_.__l.__data_ == 103) {
          goto LABEL_48;
        }
        if (a5->__r_.__value_.__l.__size_ != 1) {
          goto LABEL_54;
        }
        size_t v30 = (const std::string *)a5->__r_.__value_.__r.__words[0];
        if (*a5->__r_.__value_.__l.__data_ == 98) {
          goto LABEL_51;
        }
        if ((size & 0x80) == 0)
        {
          size_t v30 = a5;
          if (size != 1)
          {
LABEL_54:
            *((_DWORD *)v9 + 17) = v20;
            goto LABEL_55;
          }
        }
      }

      else
      {
        if (size != 1)
        {
          if (size != 3) {
            goto LABEL_54;
          }
          if (LOWORD(a5->__r_.__value_.__l.__data_) != 26482 || a5->__r_.__value_.__s.__data_[2] != 98) {
            goto LABEL_54;
          }
          goto LABEL_49;
        }

        int v31 = a5->__r_.__value_.__s.__data_[0];
        if (v31 == 103)
        {
LABEL_48:
          *((_DWORD *)v9 + 1std::iostream::~basic_iostream(v2, v3 + 8) = v20;
          goto LABEL_55;
        }

        size_t v30 = a5;
        if (v31 == 98)
        {
LABEL_51:
          *((_DWORD *)v9 + 19) = v20;
          goto LABEL_55;
        }
      }

      if (v30->__r_.__value_.__s.__data_[0] == 97)
      {
        *((_DWORD *)v9 + 20) = v20;
        goto LABEL_55;
      }

      goto LABEL_54;
    }
  }

  else if (a4)
  {
    goto LABEL_23;
  }

  *(void *)&__int128 v23 = 0x4000000040000000LL;
  *((void *)&v23 + 1) = 0x4000000040000000LL;
  *(_OWORD *)(v9 + 6std::iostream::~basic_iostream(v2, v3 + 8) = v23;
  __asm { FMOV            V0.4S, #-1.0 }

  *(_OWORD *)(v9 + 84) = _Q0;
LABEL_55:
  std::string::operator=((std::string *)(v9 + 104), (const std::string *)(a3 + 24));
  std::string::operator=((std::string *)(v9 + 128), a5);
  return v9;
}

    Stage = 0LL;
    goto LABEL_50;
  }

  if (v47.__r_.__value_.__s.__size_ != 3) {
    goto LABEL_49;
  }
  if (LOWORD(v47.__r_.__value_.__l.__data_) == 25199 && v47.__r_.__value_.__s.__data_[2] == 106) {
    goto LABEL_63;
  }
  if (LOWORD(v47.__r_.__value_.__l.__data_) == 29811 && v47.__r_.__value_.__s.__data_[2] == 108) {
    goto LABEL_64;
  }
  int v20 = &v47;
LABEL_45:
  data_low = LOWORD(v20->__r_.__value_.__l.__data_);
  unsigned __int8 v24 = v20->__r_.__value_.__s.__data_[2];
  if (data_low != 27760 || v24 != 121) {
    goto LABEL_49;
  }
  PlyConverter::PlyConverter(v34, &v50, &__p);
  Stage = PlyConverter::makeStage((PlyConverter *)v34);
  if (v45)
  {
    int v46 = v45;
    operator delete(v45);
  }

  if (v43)
  {
    int64_t v44 = v43;
    operator delete(v43);
  }

  if (v41)
  {
    __darwin_ct_rune_t v42 = v41;
    operator delete(v41);
  }

  if (v39)
  {
    std::string::size_type v40 = v39;
    operator delete(v39);
  }

  if (v37)
  {
    std::string::size_type v38 = v37;
    operator delete(v37);
  }

  if (v36 < 0) {
    operator delete(v35);
  }
  std::locale v49 = (void **)v34;
  sub_100005330(&v49);
LABEL_50:
  std::filebuf::~filebuf(&v50.__r_.__value_.__r.__words[2]);
  std::ios::~ios(&v52);
  if ((char)__p.__r_.__value_.__s.__size_ < 0)
  {
    operator delete(__p.__r_.__value_.__l.__data_);
    if (Stage) {
      goto LABEL_54;
    }
LABEL_56:
    xpc_dictionary_set_string(reply, "error", "Can't load file.");
    goto LABEL_57;
  }

  if (!Stage) {
    goto LABEL_56;
  }
LABEL_54:
  serialize::Serializer::Serializer(&v50);
  std::string::size_type v27 = serialize::Serializer::save((uint64_t)&v50, (uint64_t)Stage);
  std::string::size_type v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  (*(void (**)(void *))(*(void *)Stage + 16LL))(Stage);
  xpc_dictionary_set_value(reply, "object", v28);
  xpc_dictionary_set_string(reply, "error", string);

LABEL_57:
  xpc_connection_send_message(v10, reply);
  if (SHIBYTE(v31) < 0) {
    operator delete(*(void **)string);
  }
  XpcSandbox::~XpcSandbox((XpcSandbox *)v33);
LABEL_62:
}

void sub_10001094C( _Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, uint64_t a22, void *__p, uint64_t a24, int a25, __int16 a26, char a27, char a28)
{
  if (a28 < 0) {
    operator delete(__p);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  operator delete(v28);
  _Unwind_Resume(a1);
}

void sub_1000109A8(int a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = (void **)&v6[3 * a1];
  if (*((char *)v4 + 23) < 0)
  {
    sub_100004FE8((_BYTE *)a2, *v4, (unint64_t)v4[1]);
  }

  else
  {
    *(_OWORD *)a2 = *(_OWORD *)v4;
    *(void *)(a2 + 16) = v4[2];
  }

  for (uint64_t i = 0LL; i != -21; i -= 3LL)
  {
    if (SHIBYTE(v12[i + 2]) < 0) {
      operator delete((void *)v12[i]);
    }
  }

void sub_100010AF4( _Unwind_Exception *exception_object, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = 0LL;
  while (1)
  {
    v10 -= 24LL;
    if (v10 == -168) {
      _Unwind_Resume(exception_object);
    }
  }

void serialize::Prim::~Prim(serialize::Prim *this)
{
  *(void *)this = off_1000145C8;
  uint64_t v2 = (void *)*((void *)this + 5);
  if (v2)
  {
    *((void *)this + 6) = v2;
    operator delete(v2);
  }

{
  void *v1;
  serialize::Prim::~Prim(this);
  operator delete(v1);
}

uint64_t serialize::Prim::release(serialize::Prim *this)
{
  uint64_t v2 = (uint64_t *)*((void *)this + 5);
  uint64_t v3 = (uint64_t *)*((void *)this + 6);
  if (v2 == v3) {
    return (*(uint64_t (**)(serialize::Prim *))(*(void *)this + 8LL))(this);
  }
  do
  {
    uint64_t v4 = *v2++;
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16LL))(v4);
  }

  while (v2 != v3);
  if (this) {
    return (*(uint64_t (**)(serialize::Prim *))(*(void *)this + 8LL))(this);
  }
  return result;
}

void serialize::Prim::serialize(serialize::Prim *this, serialize::Serializer *a2)
{
}

void serialize::Prim::addChild(serialize::Prim *this, serialize::Prim *a2)
{
  unint64_t v6 = *((void *)this + 7);
  uint64_t v4 = (char *)this + 56;
  unint64_t v5 = v6;
  BOOL v7 = (void *)*((void *)v4 - 1);
  if ((unint64_t)v7 >= v6)
  {
    std::string::size_type v9 = (void **)(v4 - 16);
    uint64_t v10 = *((void *)v4 - 2);
    uint64_t v11 = ((uint64_t)v7 - v10) >> 3;
    uint64_t v12 = v5 - v10;
    uint64_t v13 = v12 >> 2;
    else {
      unint64_t v14 = v13;
    }
    if (v14) {
      std::string::size_type v15 = (char *)sub_100006318((uint64_t)v4, v14);
    }
    else {
      std::string::size_type v15 = 0LL;
    }
    std::string v16 = &v15[8 * v11];
    __int128 v17 = &v15[8 * v14];
    *(void *)std::string v16 = a2;
    std::string::size_type v8 = v16 + 8;
    __int128 v19 = (char *)*((void *)this + 5);
    BOOL v18 = (char *)*((void *)this + 6);
    if (v18 != v19)
    {
      do
      {
        uint64_t v20 = *((void *)v18 - 1);
        v18 -= 8;
        *((void *)v16 - 1) = v20;
        v16 -= 8;
      }

      while (v18 != v19);
      BOOL v18 = (char *)*v9;
    }

    *((void *)this + 5) = v16;
    *((void *)this + 6) = v8;
    *((void *)this + 7) = v17;
    if (v18) {
      operator delete(v18);
    }
  }

  else
  {
    *BOOL v7 = a2;
    std::string::size_type v8 = v7 + 1;
  }

  *((void *)this + 6) = v8;
}

void serialize::Stage::serialize(serialize::Stage *this, serialize::Serializer *a2)
{
}

void serialize::PointCloud::serialize(serialize::PointCloud *this, serialize::Serializer *a2)
{
}

void serialize::Mesh::serialize(serialize::Mesh *this, serialize::Serializer *a2)
{
}

void serialize::Subset::serialize(serialize::Subset *this, serialize::Serializer *a2)
{
}

void serialize::MapInput::serialize(serialize::MapInput *this, serialize::Serializer *a2)
{
}

void serialize::Shader::serialize(serialize::Shader *this, serialize::Serializer *a2)
{
}

void sub_100011098(void **this)
{
  *this = off_100014608;
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_1000110D4(void **this)
{
  *this = off_100014608;
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_100011114(void **this)
{
  *this = off_100014650;
  uint64_t v2 = this[11];
  if (v2)
  {
    this[12] = v2;
    operator delete(v2);
  }

  uint64_t v3 = this[8];
  if (v3)
  {
    this[9] = v3;
    operator delete(v3);
  }

  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100011170(void **this)
{
  *this = off_100014650;
  uint64_t v2 = this[11];
  if (v2)
  {
    this[12] = v2;
    operator delete(v2);
  }

  uint64_t v3 = this[8];
  if (v3)
  {
    this[9] = v3;
    operator delete(v3);
  }

  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v4);
}

void sub_1000111D4(void **a1)
{
}

void sub_1000111E8(void **this)
{
  *this = off_1000146E0;
  uint64_t v2 = this[8];
  if (v2)
  {
    this[9] = v2;
    operator delete(v2);
  }

  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100011244(void **this)
{
  *this = off_1000146E0;
  uint64_t v2 = this[8];
  if (v2)
  {
    this[9] = v2;
    operator delete(v2);
  }

  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v3);
}

void sub_1000112A8(serialize::Prim *a1)
{
}

void sub_1000112BC(void **this)
{
  *this = off_100014770;
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_1000112F8(void **this)
{
  *this = off_100014770;
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_100011338(void **this)
{
  *this = off_1000147B8;
  serialize::Prim::~Prim((serialize::Prim *)this);
}

void sub_100011394(void **this)
{
  *this = off_1000147B8;
  serialize::Prim::~Prim((serialize::Prim *)this);
  operator delete(v2);
}

void sub_1000113F4(void **this)
{
  *this = &off_100014698;
  uint64_t v2 = this[29];
  if (v2)
  {
    this[30] = v2;
    operator delete(v2);
  }

  uint64_t v3 = this[26];
  if (v3)
  {
    this[27] = v3;
    operator delete(v3);
  }

  uint64_t v4 = this[23];
  if (v4)
  {
    this[24] = v4;
    operator delete(v4);
  }

  unint64_t v5 = this[20];
  if (v5)
  {
    this[21] = v5;
    operator delete(v5);
  }

  unint64_t v6 = this[17];
  if (v6)
  {
    this[18] = v6;
    operator delete(v6);
  }

  BOOL v7 = this[14];
  if (v7)
  {
    this[15] = v7;
    operator delete(v7);
  }

  std::string::size_type v8 = this[11];
  if (v8)
  {
    this[12] = v8;
    operator delete(v8);
  }

  std::string::size_type v9 = this[8];
  if (v9)
  {
    this[9] = v9;
    operator delete(v9);
  }

  serialize::Prim::~Prim((serialize::Prim *)this);
}

int main(int argc, const char **argv, const char **envp)
{
}

void sub_1000114C4(void *a1)
{
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_100011558;
  handler[3] = &unk_1000147F8;
  id v1 = a1;
  id v3 = v1;
  xpc_connection_set_event_handler((xpc_connection_t)v1, handler);
  xpc_connection_resume((xpc_connection_t)v1);
}

void sub_10001153C( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_100011558(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  id v5 = v3;
  xpc_connection_t remote_connection = xpc_dictionary_get_remote_connection(v5);
  BOOL v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_object_t reply = xpc_dictionary_create_reply(v5);
  if (xpc_get_type(v5) != (xpc_type_t)&_xpc_type_dictionary)
  {
    if (v7 && reply)
    {
      xpc_dictionary_set_string(reply, "error", "Wrong XPC message");
      xpc_connection_send_message(v7, reply);
    }

    goto LABEL_62;
  }

  std::string::size_type v9 = (char *)xpc_dictionary_get_string(v5, "filename");
  if (!v9)
  {
    xpc_dictionary_set_string(reply, "error", "Filename was not specified");
    xpc_connection_send_message(v7, reply);
    goto LABEL_62;
  }

  uint64_t v10 = v7;
  v33[0] = v10;
  memset(&v33[1], 0, 24);
  sub_1000076C8(&__str, v9);
  *(void *)string = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = 0LL;
  uint64_t v11 = xpc_dictionary_get_string(v5, "extensionToken");
  XpcSandbox::consumeExtension((XpcSandbox *)v33, v11);
  memset(&__p, 0, sizeof(__p));
  memset(&v47, 0, sizeof(v47));
  std::string::size_type v12 = std::string::rfind(&__str, 47, 0xFFFFFFFFFFFFFFFFLL);
  std::string::size_type v13 = std::string::rfind(&__str, 46, 0xFFFFFFFFFFFFFFFFLL);
  if (v12 != -1LL)
  {
    std::string::size_type v14 = v13;
    if (v13 != -1LL)
    {
      std::string::basic_string(&v50, &__str, v12 + 1, v13 - (v12 + 1), (std::allocator<char> *)v34);
      std::string __p = v50;
      std::string::basic_string(&v50, &__str, v14 + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)v34);
      std::string v47 = v50;
      if ((v50.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string::size_type v15 = (std::string *)((char *)&v47 + v47.__r_.__value_.__s.__size_);
      }
      else {
        std::string::size_type v15 = (std::string *)(v47.__r_.__value_.__r.__words[0] + v47.__r_.__value_.__l.__size_);
      }
      if ((v50.__r_.__value_.__s.__size_ & 0x80u) == 0) {
        std::string v16 = &v47;
      }
      else {
        std::string v16 = (std::string *)v47.__r_.__value_.__r.__words[0];
      }
      while (v16 != v15)
      {
        v16->__r_.__value_.__s.__data_[0] = __tolower(v16->__r_.__value_.__s.__data_[0]);
        std::string v16 = (std::string *)((char *)v16 + 1);
      }
    }
  }

  if ((__str.__r_.__value_.__s.__size_ & 0x80u) == 0) {
    p_str = &__str;
  }
  else {
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  }
  sub_10000B050((void (__cdecl ***)(std::ifstream *__hidden))&v50, (uint64_t)p_str, 8);
  if (!v51) {
    goto LABEL_49;
  }
  if ((char)v47.__r_.__value_.__s.__size_ < 0)
  {
    if (v47.__r_.__value_.__l.__size_ == 3)
    {
      uint64_t v20 = (std::string *)v47.__r_.__value_.__r.__words[0];
      if (*(_WORD *)v47.__r_.__value_.__l.__data_ != 25199 || *(_BYTE *)(v47.__r_.__value_.__r.__words[0] + 2) != 106)
      {
        if (*(_WORD *)v47.__r_.__value_.__l.__data_ != 29811 || *(_BYTE *)(v47.__r_.__value_.__r.__words[0] + 2) != 108) {
          goto LABEL_45;
        }
LABEL_64:
        StlConverter::StlConverter(v34, &v50, &__p);
        Stage = (void *)StlConverter::makeStage((StlConverter *)v34);
        StlConverter::~StlConverter((StlConverter *)v34);
        goto LABEL_50;
      }

LABEL_63:
      ObjConverter::ObjConverter(v34, &v50, &__p, &__str, v33);
      Stage = ObjConverter::makeStage((ObjConverter *)v34);
      ObjConverter::~ObjConverter((ObjConverter *)v34);
      goto LABEL_50;
    }

void sub_100011AB4( _Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20, char a21, char a22, uint64_t a23, uint64_t a24, uint64_t a25, char a26, uint64_t a27, uint64_t a28, uint64_t a29, uint64_t a30, uint64_t a31, uint64_t a32, uint64_t a33, uint64_t a34, uint64_t a35, uint64_t a36, uint64_t a37, uint64_t a38, uint64_t a39, uint64_t a40, uint64_t a41, uint64_t a42, uint64_t a43, uint64_t a44, uint64_t a45, uint64_t a46, uint64_t a47, uint64_t a48, uint64_t a49, uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a72 < 0) {
    operator delete(__p);
  }
  if (a74 < 0) {
    operator delete(a73);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  XpcSandbox::~XpcSandbox((XpcSandbox *)&a22);

  _Unwind_Resume(a1);
}

uint64_t sub_100011BC8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 144);
  if (v2)
  {
    *(void *)(a1 + 152) = v2;
    operator delete(v2);
  }

  id v3 = *(void **)(a1 + 120);
  if (v3)
  {
    *(void *)(a1 + 12std::iostream::~basic_iostream(v2, v3 + 8) = v3;
    operator delete(v3);
  }

  id v4 = *(void **)(a1 + 96);
  if (v4)
  {
    *(void *)(a1 + 104) = v4;
    operator delete(v4);
  }

  id v5 = *(void **)(a1 + 72);
  if (v5)
  {
    *(void *)(a1 + 80) = v5;
    operator delete(v5);
  }

  unint64_t v6 = *(void **)(a1 + 48);
  if (v6)
  {
    *(void *)(a1 + 56) = v6;
    operator delete(v6);
  }

  std::string::size_type v8 = (void **)a1;
  sub_100005330(&v8);
  return a1;
}

void sub_100011C5C(void **a1, void **a2, void **a3, uint64_t a4)
{
  BOOL v7 = *a1;
  if (v7)
  {
    *(void *)(a4 + 96) = v7;
    operator delete(v7);
  }

  std::string::size_type v8 = *a2;
  if (*a2)
  {
    *(void *)(a4 + 64) = v8;
    operator delete(v8);
  }

  std::string::size_type v9 = *a3;
  if (*a3)
  {
    *(void *)(a4 + 40) = v9;
    operator delete(v9);
  }

  uint64_t v10 = *(void **)a4;
  if (*(void *)a4)
  {
    *(void *)(a4 + std::iostream::~basic_iostream(v2, v3 + 8) = v10;
    operator delete(v10);
  }

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}